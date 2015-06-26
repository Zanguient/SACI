unit MxValorEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBTables, SQuery, Pedido_de_Venda;

type
  TfMxValorEntrada = class(TForm)
    Panel1: TPanel;
    labDesValor: TLabel;
    edtValorEntrada: TEdit;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxValorEntrada: TfMxValorEntrada;

implementation
Uses
  funcoes, UDM, MxPedidoRapido, MxPedidoMotCal, MxPacoteVenda,
  MxServico, MxServicoLBM, MxPedidoMotCal_2;
{$R *.DFM}


procedure TfMxValorEntrada.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxValorEntrada.BitBtn1Click(Sender: TObject);
begin
  if edtValorEntrada.Text = '' then
    edtValorEntrada.Text := '0';
  If not VerificaFloatBranco(edtValorEntrada.Text) then
    Raise Exception.Create('Valor digitado incorretamente');
  if StrToFloat(edtValorEntrada.Text) < 0 then
    Raise Exception.Create('Valor inválido!');
  edtValorEntrada.Text := format('%.2f',[StrToFloat(edtValorEntrada.Text)]);
  If Tag=1 then
  Begin
    With fMxPedidoRapido do
    Begin
      if (Pedido_de_Venda1.Total <= StrToFloat(fMXValorEntrada.edtValorEntrada.Text)) then
        Raise Exception.Create('Entrada maior que o pedido!');
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_ENTRADA='+VirgPonto(fMXValorEntrada.edtValorEntrada.Text)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
      SB_SalvarPedidoClick(sender);
    End;
  end
  Else If Tag=3 then //LBM
  Begin
    
  end
  else If Tag=4 then //MotCal
  Begin
    With fMxPedidoMotCal do
    Begin
      if (Pedido_de_Venda1.Total <= StrToFloat(fMXValorEntrada.edtValorEntrada.Text)) then
        Raise Exception.Create('Entrada maior que o pedido!');
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_ENTRADA='+VirgPonto(fMXValorEntrada.edtValorEntrada.Text)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
      SB_SalvarPedidoClick(sender);
    End;
  end
  else If Tag=5 then //Pacote de Venda
  Begin
    With fMxPacoteVenda do
    Begin
      if (Pacote_de_venda1.Total <= StrToFloat(fMXValorEntrada.edtValorEntrada.Text)) then
        Raise Exception.Create('Entrada maior que o pedido!');
      ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
        ' PCT_ENTRADA='+VirgPonto(fMXValorEntrada.edtValorEntrada.Text)+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
      SB_SalvarPedidoClick(sender);
    End;
  end
  else If Tag=6 then //Valor do Frete no PedidoMotical
  Begin
    With fMxPedidoMotCal do
    Begin
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_FRETE='+VirgPonto(self.edtValorEntrada.Text)+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
      SB_SalvarPedidoClick(sender);
    End;
  end
  else If Tag=7 then //Servico
  Begin
    With fMxServico do
    Begin
      if (Pedido_de_Venda1.Total <= StrToFloat(self.edtValorEntrada.Text)) then
        Raise Exception.Create('Entrada maior que o pedido!');
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_ENTRADA='+VirgPonto(self.edtValorEntrada.Text)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
//      SB_SalvarPedidoClick(sender);
    End;
  end
  else If Tag=8 then //Servico LBM
  Begin
    With fMxServicoLBM do
    Begin
      if (Pedido_de_Venda1.Total <= StrToFloat(self.edtValorEntrada.Text)) then
        Raise Exception.Create('Entrada maior que o pedido!');
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_ENTRADA='+VirgPonto(self.edtValorEntrada.Text)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
    End;
  end
  else If Tag=9 then //Valor do Frete no Serviço
  Begin
    With fMxServico do
    Begin
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_FRETE='+VirgPonto(self.edtValorEntrada.Text)+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
    End;
  end
  else If Tag=10 then //Valor do Frete no PedidoMotical
  Begin
    With fMxPedidoMotCal_2 do
    Begin
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_FRETE='+VirgPonto(self.edtValorEntrada.Text)+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
      SB_SalvarPedidoClick(sender);
    End;
  end;
  Close;
end;

procedure TfMxValorEntrada.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else if (edtValorEntrada.Focused) and (Key = '.') then
    Key := ',';
end;

procedure TfMxValorEntrada.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
