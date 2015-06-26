unit MxSelecionaCheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, checklst, Db, DBTables, SQuery,
  DBCtrls, Buttons, ExtCtrls, Menus, Mask, Cheque, Cliente;

type
  TfMxSelecionaCheques = class(TForm)
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    Panel2: TPanel;
    sbtSalvar: TSpeedButton;
    sbtFechar: TSpeedButton;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Confirmar1: TMenuItem;
    btnMarcar: TBitBtn;
    btnDesmarcar: TBitBtn;
    rbtTodos: TRadioButton;
    Bevel1: TBevel;
    Cheque1: TCheque;
    Cliente1: TCliente;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtFecharClick(Sender: TObject);
    procedure sbtSalvarClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Cheque1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    CdCNC, CdBLD: integer;
    Entidade :TCheque;
    { Public declarations }
  end;

var
  fMxSelecionaCheques: TfMxSelecionaCheques;

implementation
uses
  UDM, funcoes, MxBoletimFechaCaixa;

{$R *.DFM}

procedure TfMxSelecionaCheques.FormCreate(Sender: TObject);
begin
  CdCNC := 0;
  CdBLD := 0;
  Entidade := Cheque1;
end;

procedure TfMxSelecionaCheques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxSelecionaCheques.sbtFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelecionaCheques.sbtSalvarClick(Sender: TObject);
Var
  i, iTotalCheques:Integer;
  vTotal, vTotalPre: Double;
  vDataEnvio: TDateTime;
  trans:boolean;
begin
  vDataEnvio := DM.Configuracao1.DataHora;
  iTotalCheques := 0;
  vTotal := 0;
  vTotalPre := 0;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      for i:=0 to CheckListBox1.Items.Count-1 do
      Begin
        CheckListBox1.ItemIndex:=i;
        If Entidade.Locate('CHQ_CODIGO',StrToInt(Copy(CheckListBox1.Items[i],1,6)),[]) Then
        Begin
          If CheckListBox1.checked[i] then
          Begin
            inc(iTotalCheques);
            if Entidade.Data > DM.Configuracao1.Data then //Pré-Datado
              vTotalPre := vTotalPre + StrTofloat(Copy(CheckListBox1.Items[i],78,8))
            else
              vTotal := vTotal + StrTofloat(Copy(CheckListBox1.Items[i],78,8));

            if not Entidade.Enviado then
            Begin
              if not DM.Movimento_de_Cheque1.Inserir(Entidade.CodigoCNC,
                Entidade.CodigoCNC, Entidade.CodigoCHQ, CdCNC, CdBLD, 1080(*Mudar de CNC*), Entidade.Valor) then
              Begin
                ShowMessage('Falha ao gerar Movimento de Cheque!');
                Raise exception.Create('');
              end;
              ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
                ' CHQ_ENVIADO=1 '+
                ',CHQ_DT_ENVIADO="'+MesDiaHora(vDataEnvio)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
                ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ));
            end
            else //Alterar a Data e Hora de Envio para ficar igual a todos
              ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
                ' CHQ_DT_ENVIADO="'+MesDiaHora(vDataEnvio)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
                ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ));
          end
          else if Entidade.Enviado then
          Begin
            if not DM.Movimento_de_Cheque1.Inserir(Entidade.CodigoCNC,
              Entidade.CodigoCNC, Entidade.CodigoCHQ, CdCNC, CdBLD, 1130(*Cancelar Mudar de CNC*),Entidade.Valor) then
            Begin
              ShowMessage('Falha ao gerar Movimento de Cheque!');
              Raise exception.Create('');
            end;
            ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
              ' CHQ_ENVIADO=0 '+
              ',CHQ_DT_ENVIADO=NULL '+
              ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
              ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ));
          end;
        End;
      End;

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          Exit;
        end;
    end;
  End;

  if tag = 0 then //Fechar Caixa
  Begin
    fMxBoletimFechaCaixa.edtTotalCheque.Text := format('%.2f',[vTotal]);
    fMxBoletimFechaCaixa.edtPreDatado.Text := format('%.2f',[vTotalPre]);
  end;
  ShowMessage('Total de Cheques: '+IntToStr(iTotalCheques));
  Close;
end;

procedure TfMxSelecionaCheques.btnMarcarClick(Sender: TObject);
Var
  i:Integer;
begin
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    if rbtTodos.Checked then
      CheckListBox1.checked[i] := True;
  End;
end;


procedure TfMxSelecionaCheques.btnDesmarcarClick(Sender: TObject);
Var
  i:Integer;
begin
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    CheckListBox1.checked[i] := False;
  End;
end;

procedure TfMxSelecionaCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else if Key=#13 then
    sbtSalvarClick(sender);
end;

procedure TfMxSelecionaCheques.FormShow(Sender: TObject);
Var
  i:Integer;
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Entidade.Open;
  CheckListBox1.Clear;
  With Entidade do
  Begin
    DisableControls;
    Close;
    Open;
    first;
    i:=0;
    While not EOF Do
    Begin
      CheckListBox1.Items.Add(PreencheZero(6,CodigoCHQ)+' '+
                              PreencheZero(10,Trim(Numero))+' '+
                              PreencheEspaco(59,DonoCheque)+
                              PreencheEspacoEsq(8,format('%.2f',[Valor])));
      If Enviado Then
        CheckListBox1.Checked[i]:=true;
      inc(i);
      Next;
    End;
    EnableControls;
  End;
end;

procedure TfMxSelecionaCheques.Cheque1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  Entidade.ParamByName('CHQ_DT_ENVIADO').AsDate := DM.Configuracao1.Data;
end;

end.



