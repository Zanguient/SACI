unit MxCancelarRenegociacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus;

type
  TfMxCancelarRenegociacao = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    DataOk: Boolean;
  end;

var
  fMxCancelarRenegociacao: TfMxCancelarRenegociacao;
  CNC:string;

implementation

uses UDM, UPrinc2, CdCliente;

{$R *.DFM}


procedure TfMxCancelarRenegociacao.BitBtn1Click(Sender: TObject);
var
  mensagem :string;
  Trans:Boolean;
begin
  mensagem:='';
  if RadioButton2.Checked then
    if not VerificaInteiroBranco(Edit1.text) then
      Mensagem:=mensagem+'Código do cliente inválido!'+#13;

  if RadioButton3.Checked then
    if not VerificaInteiroBranco(Edit2.text) then
      Mensagem:=mensagem+'Código do título inválido!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      If Tag=0 then
      begin
        if RadioButton1.Checked then
        Begin
          ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
             ' TRC_SITUACAO=0 '+
             ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
             ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
             ' AND TRC_SITUACAO=4 AND TRC_CODIGO IN '+
             ' (SELECT TRC_TITULOANT FROM TITULO_A_RECEBER '+
             ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
             ' AND TRC_SITUACAO = 8 '+
             ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" '+
             ' AND ((TRC_VALOR_PAGO=0) OR (TRC_VALOR_PAGO IS NULL)))');
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM TITULO_A_RECEBER '+
             ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
             ' AND TRC_SITUACAO = 8 AND ((TRC_VALOR_PAGO=0) OR (TRC_VALOR_PAGO IS NULL)) '+
             ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") ');
        end
        else if RadioButton2.Checked then
        Begin
          ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
             ' TRC_SITUACAO = 0 '+
             ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
             ' WHERE CNC_CODIGO = '+IntToStr(DM.Configuracao1.CodigoCNC)+
             ' AND TRC_SITUACAO = 4 '+
             ' AND CLI_CODIGO='+Edit1.Text+
             ' AND TRC_CODIGO NOT IN '+
             ' (SELECT T2.TRC_TITULOANT FROM TITULO_A_RECEBER T2 '+
             ' WHERE T2.CNC_CODIGO=TITULO_A_RECEBER.CNC_CODIGO '+
             ' AND T2.TRC_TRCORIGINAL=TITULO_A_RECEBER.TRC_CODIGO '+
             ' AND T2.TRC_SITUACAO=0) ');
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM TITULO_A_RECEBER '+
             'WHERE CNC_CODIGO = '+IntToStr(DM.Configuracao1.CodigoCNC)+
             ' AND TRC_SITUACAO = 8 '+
             ' AND CLI_CODIGO='+Edit1.Text);
        end
        else if RadioButton3.Checked then
        Begin
          ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
             ' T1.TRC_SITUACAO = 0 '+
             ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
             ' WHERE T1.CNC_CODIGO = '+IntToStr(DM.Configuracao1.CodigoCNC)+
             ' AND T1.TRC_SITUACAO = 4 AND T1.TRC_CODIGO='+Edit2.Text+
             ' AND T1.TRC_CODIGO NOT IN '+
             ' (SELECT T2.TRC_TITULOANT FROM TITULO_A_RECEBER T2 '+
             ' WHERE T2.CNC_CODIGO=TITULO_A_RECEBER.CNC_CODIGO '+
             ' AND T2.TRC_TRCORIGINAL=TITULO_A_RECEBER.TRC_CODIGO '+
             ' AND T2.TRC_SITUACAO=0) ');
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM TITULO_A_RECEBER '+
             'WHERE CNC_CODIGO = '+IntToStr(DM.Configuracao1.CodigoCNC)+
             ' AND TRC_SITUACAO = 8 AND TRC_CODIGO='+Edit2.Text);
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
        end;
    end;
  End;
  Close;
end;

procedure TfMxCancelarRenegociacao.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxCancelarRenegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfMxCancelarRenegociacao.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    Edit1.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=11;
    fCadCli.CentroCusto2.open;
    fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxCancelarRenegociacao.RadioButton2Click(Sender: TObject);
begin
  Edit2.Clear;
  Edit2.Enabled:=False;
  Edit2.Color:=AlteraCorComponentes;
  Edit1.Enabled:=True;
  Edit1.Color:=clWindow;
  Edit1.SetFocus;
end;

procedure TfMxCancelarRenegociacao.RadioButton3Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit1.Enabled:=False;
  Edit1.Color:=AlteraCorComponentes;
  Edit2.Enabled:=True;
  Edit2.Color:=clWindow;
  Edit2.SetFocus;
end;

procedure TfMxCancelarRenegociacao.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
