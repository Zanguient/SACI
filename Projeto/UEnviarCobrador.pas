unit UEnviarCobrador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, Db, Item_Pedido_Venda, DBTables, SQuery, Titulo_receber, ZReport;

type
  Trpt_EnviarCob = class(TForm)
    SZReport1: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    SZRBand1: TSZRBand;
    Titulo_receber1: TTitulo_receber;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1PRD_DESCRICAO: TStringField;
    DSTitulo_receber1: TDataSource;
    ZRDBText2: TSZRDBText;
    ZRLabel12: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText1: TSZRDBText;
    ZRLabel14: TSZRLabel;
    ZRDBText5: TSZRDBText;
    ZRLabel15: TSZRLabel;
    ZRDBText4: TSZRDBText;
    ZRDBText9: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRSubDetailBand1: TSZRSubDetailBand;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_EnviarCob: Trpt_EnviarCob;

implementation

{$R *.DFM}










end.
