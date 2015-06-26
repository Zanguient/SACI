unit UCartaCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Titulo_receber, Item_Pedido_Venda;

type
  Trpt_EnviaCobrador = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRBand4: TSZRBand;
    SZRBand1: TSZRBand;
    ZRLabel17: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRSysData1: TSZRSysData;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    DSTitulo_receber1: TDataSource;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1PRD_DESCRICAO: TStringField;
    SZRSubDetailBand1: TSZRSubDetailBand;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText3: TSZRDBText;
    ZRBand2: TSZRBand;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRDBText8: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRDBText11: TSZRDBText;
    SZRDBText12: TSZRDBText;
    SZRLabel8: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText13: TSZRDBText;
    ZRLabel6: TSZRLabel;
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Soma,ValorSemJuros:Real;
  end;

var
  rpt_EnviaCobrador: Trpt_EnviaCobrador;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_EnviaCobrador.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=Dm.Configuracao1.LojaNome;
end;

procedure Trpt_EnviaCobrador.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ValorSemJuros:=0;
end;


procedure Trpt_EnviaCobrador.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;


procedure Trpt_EnviaCobrador.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel17.Caption:=Format('%.2f',[Soma]);
  ZRLabel18.Caption:=Format('%.2f',[ValorSemJuros]);
end;

procedure Trpt_EnviaCobrador.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  ValorComJuros:Real;
begin
  ValorSemJuros:=ValorSemJuros+Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat;
  ValorComJuros:=Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat+
  Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
  Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsDateTime)/30);
  soma:=Soma+ValorComjuros;
  SZRLabel5.Caption:=Format('%.2f',[Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat]);
  SZRLabel6.Caption:=Format('%.2f',[ValorComJuros]);
end;

procedure Trpt_EnviaCobrador.FormShow(Sender: TObject);
begin
  Soma:=0;
  ValorSemJuros:=0;
end;




end.
