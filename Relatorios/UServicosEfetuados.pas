unit UServicosEfetuados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Item_Pedido_Venda,
  Pedido_de_Venda, funcoes;

type
  Trpt_ServicosEfetuados = class(TForm)
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
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRDBText9: TSZRDBText;
    ZRGroup1: TSZRGroup;
    ZRBand4: TSZRBand;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRLabel18: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRFrameLine1: TSZRFrameLine;
    ZRDBText5: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRLabel15: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    zrlDataINI: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1CLI_CODIGO: TIntegerField;
    Item_Pedido_Venda1CLI_RZ_SOCIAL: TStringField;
    Item_Pedido_Venda1PRD_NIVEL: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_DESCRICAO: TStringField;
    Item_Pedido_Venda1PRD_PRECO_VENDA: TFloatField;
    Item_Pedido_Venda1QTD: TFloatField;
    Item_Pedido_Venda1VALOR: TFloatField;
    SZRLabel8: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlTotalCLI: TSZRLabel;
    zrlTotalGER: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlQtdEnt: TSZRLabel;
    zrlQtdSai: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    SZRLabel7: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlQtdEntS: TSZRLabel;
    zrlQtdSaiS: TSZRLabel;
    zrlQtdEntSS: TSZRLabel;
    zrlQtdSaiSS: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel35: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlTotalCLIBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TItem_Pedido_Venda;
    TotCli, TotGer, TotQtdM, TotQtdC, TotQtdA, TotQtdS, TotGQTDM, TotGQTDC: Double;
    { Public declarations }
  end;

var
  rpt_ServicosEfetuados: Trpt_ServicosEfetuados;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_ServicosEfetuados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active:=false;
end;

procedure Trpt_ServicosEfetuados.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;
  TotQtdM := 0;
  TotQtdC := 0;
  TotQtdA := 0;
  TotQtdS := 0;
end;

procedure Trpt_ServicosEfetuados.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ServicosEfetuados.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ServicosEfetuados.FormShow(Sender: TObject);
begin
  TotCli := 0;
  TotGer := 0;
end;

procedure Trpt_ServicosEfetuados.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotCli := TotCli + Item_Pedido_Venda1.FieldByName('VALOR').asFloat;
  TotGer := TotGer + Item_Pedido_Venda1.FieldByName('VALOR').asFloat;

  case Item_Pedido_Venda1.FieldByName('PRD_CODIGO').asinteger of
    //MONTAGEM
    12288: SZRLabel7.Caption := Format('%.1f',[Item_Pedido_Venda1.FieldByName('QTD').asFloat]);
    //CONFERENCIA FINAL
    12298: SZRLabel17.Caption := Format('%.1f',[Item_Pedido_Venda1.FieldByName('QTD').asFloat]);
    //SOLDA
    18767: SZRLabel15.Caption := Format('%.1f',[Item_Pedido_Venda1.FieldByName('QTD').asFloat]);
    //ADAPTAÇÃO
    18766: SZRLabel25.Caption := Format('%.1f',[Item_Pedido_Venda1.FieldByName('QTD').asFloat]);
  end;

end;

procedure Trpt_ServicosEfetuados.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotCli := 0;
end;

procedure Trpt_ServicosEfetuados.zrlTotalCLIBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalCLI.Caption := Format('%.2f',[TotCLI]);
end;

procedure Trpt_ServicosEfetuados.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGER.Caption := Format('%.2f',[TotGER]);
  SZRLabel10.Caption := Format('%.1f',[TotQtdM]);
  SZRLabel19.Caption := Format('%.1f',[TotQtdC]);
  SZRLabel27.Caption := Format('%.1f',[TotQtdA]);
  SZRLabel21.Caption := Format('%.1f',[TotQtdS]);

  TotQtdM := 0;
  TotQtdC := 0;
  TotQtdA := 0;
  TotQtdS := 0;
end;

procedure Trpt_ServicosEfetuados.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if not (SZRLabel7.Caption = '') then
    TotQtdM := TotQtdM + strtofloat(SZRLabel7.Caption)
  else
    TotQtdM := TotQtdM + 0;

  if not (SZRLabel17.Caption = '') then
    TotQtdC := TotQtdC + strtofloat(SZRLabel17.Caption)
  else
    TotQtdC := TotQtdC + 0;

  if not (SZRLabel25.Caption = '') then
    TotQtdA := TotQtdA + strtofloat(SZRLabel25.Caption)
  else
    TotQtdA := TotQtdA + 0;

  if not (SZRLabel15.Caption = '') then
    TotQtdS := TotQtdS + strtofloat(SZRLabel15.Caption)
  else
    TotQtdS := TotQtdS + 0;
end;

procedure Trpt_ServicosEfetuados.ZRBand4AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  SZRLabel7.Caption := '';
  SZRLabel17.Caption := '';
  SZRLabel25.Caption := '';
  SZRLabel15.Caption := '';
end;

procedure Trpt_ServicosEfetuados.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
