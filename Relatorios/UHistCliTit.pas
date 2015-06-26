unit UHistCliTit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, funcoes,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Classificacao_fiscal,
  Origem_Fiscal, Fornecedor, Produto, Item_Pedido_Compra, Titulo_receber;

type
  Trpt_HistCliTit = class(TForm)
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
    ZRLabel7: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel9: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRLabel19: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRBand4: TSZRBand;
    ZRLabel18: TSZRLabel;
    ZRLabel21: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel10: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel14: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    subtotal,total:Double;
  end;

var
  rpt_HistCliTit: Trpt_HistCliTit;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_HistCliTit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Titulo_receber1.Close;
 Action:=cafree;
end;

procedure Trpt_HistCliTit.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel19.Caption:=Format('%.2f', [Total]);
end;



procedure Trpt_HistCliTit.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;


procedure Trpt_HistCliTit.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel22.Caption:=Format('%.2f', [SubTotal]);
end;

procedure Trpt_HistCliTit.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total := 0;
  SubTotal := 0;
end;

procedure Trpt_HistCliTit.ZRBand4AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  Total:=Total+SubTotal;
  SubTotal:=0;
end;



procedure Trpt_HistCliTit.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_HistCliTit.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
