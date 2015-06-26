unit UPedidoVendaItemPDV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,funcoes,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Classificacao_fiscal,
  Origem_Fiscal, Fornecedor, Produto, Item_Pedido_Compra, Pedido_de_Venda;

type
  Trpt_PedidoVendaItemPDV = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    ZRLabel18: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRExpression1: TSZRExpression;
    ZRLabel19: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText1: TSZRDBText;
    ZRDBText11: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand2AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    total:Double;
  end;

var
  rpt_PedidoVendaItemPDV: Trpt_PedidoVendaItemPDV;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_PedidoVendaItemPDV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Pedido_de_Venda1.Close;
 Action:=cafree;
end;

procedure Trpt_PedidoVendaItemPDV.ZRBand2AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  If Pedido_de_Venda1.FieldByName('IPV_PRECO_DESC').AsFloat<>0 THEN
    total:=total+(Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat-
                  Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').AsFloat)*Pedido_de_Venda1.FieldByName('IPV_PRECO_DESC').AsFloat
  Else
    total:=total+(Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat-
                  Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').AsFloat)*Pedido_de_Venda1.FieldByName('IPV_PRECO').AsFloat;
end;

procedure Trpt_PedidoVendaItemPDV.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel19.Caption:=Format('%.2f', [Total]);
end;



procedure Trpt_PedidoVendaItemPDV.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_PedidoVendaItemPDV.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_PedidoVendaItemPDV.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
