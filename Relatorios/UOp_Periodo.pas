unit UOp_Periodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls;

type
  TOp_Periodo = class(TForm)
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Op_Periodo: TOp_Periodo;

implementation

uses UHistorCompras, UPedidoVenda;

{$R *.DFM}


procedure TOp_Periodo.BitBtn1Click(Sender: TObject);
var
    Cod : Integer;
begin
//Se o relatório for de historico de compras
  If Op_Periodo.Tag=0 then
  Begin
    Application.CreateForm(Trpt_HistorCompras,rpt_HistorCompras);
    rpt_HistorCompras.report.Preview;
  End;
//Se o relatorio for de pedidos pendentes
  If Op_Periodo.Tag=1 then
  Begin
    Application.CreateForm(Trpt_PedidoVenda,rpt_Pedidovenda);
    rpt_Pedidovenda.Pedido_de_Venda1.Close;
    rpt_Pedidovenda.Pedido_de_Venda1.SQL.Clear;
    rpt_Pedidovenda.Pedido_de_Venda1.SQL.Add('SELECT * FROM PEDIDO_DE_VENDA,CLIENTE,CENTRO_DE_CUSTO '+
                                             'WHERE (PEDIDO_DE_VENDA.CLI_CODIGO=CLIENTE.CLI_CODIGO) AND '+
                                             '(PEDIDO_DE_VENDA.CNC_CLIENTE=CLIENTE.CNC_CODIGO) AND '+
                                             '(PEDIDO_DE_VENDA.CNC_CODIGO=CENTRO_DE_CUSTO.CNC_CODIGO) AND '+
                                             'PEDIDO_DE_VENDA.PDV_SITUACAO<4 AND PDV_DATA_HORA>=:DATAINI AND PDV_DATA_HORA<=:DATAFIM');
    rpt_Pedidovenda.Pedido_de_Venda1.ParamByName('DATAINI').AsDateTime:=StrToDate(MaskEdit1.Text);
    rpt_Pedidovenda.Pedido_de_Venda1.ParamByName('DATAFIM').AsDateTime:=StrToDate(MaskEdit2.Text)+1;
    rpt_Pedidovenda.Pedido_de_Venda1.Open;
    rpt_PedidoVenda.report.preview;
  End;
end;

procedure TOp_Periodo.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
