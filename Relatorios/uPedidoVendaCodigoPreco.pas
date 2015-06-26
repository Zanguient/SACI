unit uPedidoVendaCodigoPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Classificacao_fiscal,
  Origem_Fiscal, Fornecedor, Produto, Item_Pedido_Compra, Pedido_de_Venda,
  Parametro, Funcionario;

type
  Trpt_PedidoVendaCodigoPreco = class(TForm)
    report: TSZReport;
    SZRBand1: TSZRBand;
    ZRLabel18: TSZRLabel;
    ZRLabel14: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    total:Double;
  end;

var
  rpt_PedidoVendaCodigoPreco: Trpt_PedidoVendaCodigoPreco;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_PedidoVendaCodigoPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
