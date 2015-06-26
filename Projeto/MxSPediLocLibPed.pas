unit MxSPediLocLibPed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, Titulo_receber;

type
  TfMxSPedLocLibPed = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    DSPedido_de_Venda1: TDataSource;
    Pedido_de_Venda1: TPedido_de_Venda;
    DBGrid1: TDBGrid;
    SB_Confirmar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    cancelar: Boolean;
  end;

var
  fMxSPedLocLibPed: TfMxSPedLocLibPed;

implementation
uses MxReceber, UDM, Funcoes, MxPedidoRapido, UPromissoria,
  MxSPediLoc, MxSPediLocImpPromis, DigSenha;

{$R *.DFM}

procedure TfMxSPedLocLibPed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Pedido_de_Venda1.Active:=False;
  Action:=Cafree;
end;

procedure TfMxSPedLocLibPed.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSPedLocLibPed.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if tag = 2 then //Pacote
    DBGrid1.Columns[1].FieldName := 'PCT_DT_CADASTRO';

  Pedido_de_Venda1.Open;
end;

procedure TfMxSPedLocLibPed.SB_ConfirmarClick(Sender: TObject);
var
  CdCNC, CdPDV, iOPS: integer;
  Trans: Boolean;
begin
  If Pedido_de_Venda1.IsEmpty Then
    Raise exception.Create('Selecione um registro!');

  CdCNC := Pedido_de_Venda1.CodigoCNC;
  CdPDV := Pedido_de_Venda1.CodigoPDV;
  if self.Tag = 0 then
    iOPS := 7910
  else
    iOPS := 7920;

  If MessageDlg('ATENÇÃO!!!'+#13+
                'Tenha certeza de que esse pedido/pacote não está aberto em outro micro!'+#13+
                'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(iOPS)) < 0) then
  Begin
    ShowMessage('Usuário não ter permissão para liberar Pedido/Pacote!');
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=41;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      Begin
        if (Usuario1.Permissoes.IndexOf(IntToStr(iOPS)) < 0) then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para Liberar Pedido/Pacote de Venda!');
        end
        else
          DM.Usuario1.GeraLog(iOPS, CdCNC, CdPDV,
            'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU));
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end
  else
    DM.Usuario1.GeraLog(iOPS, CdCNC, CdPDV);

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if tag = 0 then
        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
          ' PDV_EM_USO=0 '+
          ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PDV_CODIGO='+IntToStr(CdPDV))
      else if tag = 2 then //Pacote de Venda
        ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
            ' PCT_EM_USO=0 '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND PDV_CODIGO='+IntToStr(CdPDV));

      Pedido_de_Venda1.GeraLog(iOPS,CdCNC,CdPDV);

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
        end;
    end;
  End;
  Pedido_de_Venda1.Close;
  Pedido_de_Venda1.Open;
end;

end.
