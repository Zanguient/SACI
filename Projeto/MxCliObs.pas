unit MxCliObs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DBCtrls, ExtCtrls;

type
  TFmxCliObs = class(TForm)
    Panel1: TPanel;
    SB_Cancelar: TSpeedButton;
    SB_Salvar: TSpeedButton;
    memObservacao: TMemo;
    procedure SB_CancelarClick(Sender: TObject);
    procedure SB_SalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmxCliObs: TFmxCliObs;

implementation

uses UDM, MxSRecPedido, funcoes, MxPedCompra, MxServicoLBM;

{$R *.DFM}


procedure TFmxCliObs.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFmxCliObs.SB_SalvarClick(Sender: TObject);
begin
  if tag = 0 then //Alterar Obs do Cliente
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
      ' CLI_OBS1="'+UpperCase(memObservacao.Lines.Text)+'"'+
      ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(fmxSRecPed.Cliente1.CodigoCNC)+
      ' AND CLI_CODIGO='+IntToStr(fmxSRecPed.Cliente1.CodigoCLI));
    fmxSRecPed.edtObservacaoCLI.Text := memObservacao.Lines.Text;
  end
  else if tag = 1 then //Alterar Obs do Título
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
      ' TRC_OBSERVACAO="'+UpperCase(memObservacao.Lines.Text)+'" '+
      ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(fmxSRecPed.Titulo_receber1.CodigoCNC)+
      ' AND TRC_CODIGO='+IntToStr(fmxSRecPed.Titulo_receber1.CodigoTRC));
    fmxSRecPed.Titulo_receber1.Close;
    fmxSRecPed.Titulo_receber1.Open;
  end
  else if tag = 2 then //Alterar Obs Item de Pedido de Compra
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_COMPRA SET '+
      ' IPC_OBSERVACAO="'+UpperCase(memObservacao.Lines.Text)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(fMxPedComp.Item_Pedido_Compra1.CodigoCNC)+
      ' AND IPC_CODIGO='+IntToStr(fMxPedComp.Item_Pedido_Compra1.CodigoIPC));
  end
  else if tag = 3 then //Alterar Obs Item de Pedido de Venda no ServiçoLBM
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
      ' IPV_OBSERVACAO="'+UpperCase(memObservacao.Lines.Text)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(fMxServicoLBM.Item_Pedido_Venda1.CodigoCNC)+
      ' AND IPV_CODIGO='+IntToStr(fMxServicoLBM.Item_Pedido_Venda1.CodigoIPV));
  end;
  Close;
end;

procedure TFmxCliObs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFmxCliObs.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if tag = 0 then
    fmxSRecPed.Cliente1.Open;
end;

procedure TFmxCliObs.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close
  else if Key = #13 then
    SB_SalvarClick(sender);
end;

procedure TFmxCliObs.memObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

end.
