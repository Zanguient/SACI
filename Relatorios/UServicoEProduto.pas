unit UServicoEProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Item_Pedido_Venda,
  Pedido_de_Venda, funcoes;

type
  Trpt_ServicoEProduto = class(TForm)
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
    SZRGroup1: TSZRGroup;
    SZRDBText1: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRDBText2: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRBand2: TSZRBand;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlTotalGRP: TSZRLabel;
    zrlTotalCLI: TSZRLabel;
    zrlTotalGER: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlQtdSai: TSZRLabel;
    zrlQtdEnt: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    zrlUsuario: TSZRLabel;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1CLI_CODIGO: TIntegerField;
    Item_Pedido_Venda1CLI_RZ_SOCIAL: TStringField;
    Item_Pedido_Venda1PRD_NIVEL: TIntegerField;
    Item_Pedido_Venda1GRP_CODIGO: TIntegerField;
    Item_Pedido_Venda1GRP_DESCRICAO: TStringField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_DESCRICAO: TStringField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1QTD: TFloatField;
    Item_Pedido_Venda1VALOR: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TItem_Pedido_Venda;
    TotCli, TotGer, TotGrp: Double;
    { Public declarations }
  end;

var
  rpt_ServicoEProduto: Trpt_ServicoEProduto;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_ServicoEProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Entidade.Active:=false;
end;

procedure Trpt_ServicoEProduto.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;
end;

procedure Trpt_ServicoEProduto.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ServicoEProduto.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ServicoEProduto.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotCli := TotCli + Item_Pedido_Venda1.FieldByName('VALOR').asFloat;
  TotGrp := TotGrp + Item_Pedido_Venda1.FieldByName('VALOR').asFloat;
  TotGer := TotGer + Item_Pedido_Venda1.FieldByName('VALOR').asFloat;
end;

procedure Trpt_ServicoEProduto.FormShow(Sender: TObject);
begin
  TotCli := 0;
  TotGrp := 0;
  TotGer := 0;
end;

procedure Trpt_ServicoEProduto.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotCLI := 0;
end;

procedure Trpt_ServicoEProduto.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotGRP := 0;
end;

procedure Trpt_ServicoEProduto.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGRP.Caption := Format('%.2f',[TotGRP]);
end;

procedure Trpt_ServicoEProduto.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalCLI.Caption := Format('%.2f',[TotCLI]);
end;

procedure Trpt_ServicoEProduto.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGER.Caption := Format('%.2f',[TotGER]);

end;

procedure Trpt_ServicoEProduto.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

end.
