unit UPedidosMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,funcoes,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, CentroCusto, Titulo_a_Pagar, Pedido_de_Venda;

type
  Trpt_PedidosMensal = class(TForm)
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
    ZRBand4: TSZRBand;
    ZRLabel12: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRGroup2: TSZRGroup;
    ZRDBText2: TSZRDBText;
    ZRLabel10: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRBand5: TSZRBand;
    ZRLabel11: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRBand6: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel18: TSZRLabel;
    CentroCusto1: TCentroCusto;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRGroup3: TSZRGroup;
    ZRBand7: TSZRBand;
    ZRLabel17: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1ANO: TIntegerField;
    Pedido_de_Venda1MES: TIntegerField;
    Pedido_de_Venda1VALOR: TFloatField;
    Pedido_de_Venda1desc_mes: TStringField;
    Pedido_de_Venda1desc_cc: TStringField;
    ZRExpression2: TSZRExpression;
    ZRLabel21: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRExpression3: TSZRExpression;
    ZRLabel22: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand6AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand5AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand6BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup3AfterPrint(Sender: TObject; Printed: Boolean);
    procedure Pedido_de_Venda1CalcFields(DataSet: TDataSet);
    procedure ZRBand7BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    SomaAno,Somames,SomaTotal, SomaCC:Double;
  end;

var
  rpt_PedidosMensal: Trpt_PedidosMensal;

implementation
Uses
  UDM;

{$R *.DFM}


procedure Trpt_PedidosMensal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Pedido_de_Venda1.Active:=False;
  Action := cafree;
end;


procedure Trpt_PedidosMensal.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;


procedure Trpt_PedidosMensal.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SomaAno:=SomaAno+Pedido_de_Venda1.FieldByName('VALOR').AsFloat;
  Somames:=Somames+Pedido_de_Venda1.FieldByName('VALOR').AsFloat;
  Somatotal:=Somatotal+Pedido_de_Venda1.FieldByName('VALOR').AsFloat;
  SomaCC:=SomaCC+Pedido_de_Venda1.FieldByName('VALOR').AsFloat;
  ZRLabel21.Caption := Pedido_de_Venda1.FieldByName('desc_cc').asString;
end;

procedure Trpt_PedidosMensal.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SomaAno:=0;
  Somames:=0;
  Somatotal:=0;
  SomaCC:=0;
end;


procedure Trpt_PedidosMensal.ZRBand6AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  SomaAno:=0;
end;

procedure Trpt_PedidosMensal.ZRBand5AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  Somames:=0;
end;

procedure Trpt_PedidosMensal.ZRBand6BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel18.Caption:=Format('%.2f',[SomaAno]);
end;

procedure Trpt_PedidosMensal.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel14.Caption:=Format('%.2f',[Somames]);
end;


procedure Trpt_PedidosMensal.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel6.Caption:=Format('%.2f',[SomaTotal]);
end;


procedure Trpt_PedidosMensal.ZRGroup3AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  ZRLabel17.Caption := Pedido_de_Venda1.FieldByName('desc_cc').asString;
end;


procedure Trpt_PedidosMensal.Pedido_de_Venda1CalcFields(DataSet: TDataSet);
begin
  Case Pedido_de_Venda1.FieldByName('mes').AsInteger of
    1:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Janeiro';
    2:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Fevereiro';
    3:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Março';
    4:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Abril';
    5:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Maio';
    6:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Junho';
    7:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Julho';
    8:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Agosto';
    9:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Setembro';
    10:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Outubro';
    11:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Novembro';
    12:Pedido_de_Venda1.FieldByName('desc_mes').AsString:='Dezembro';
  end;

end;



procedure Trpt_PedidosMensal.ZRBand7BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel22.Caption := Format('%.2f',[SomaCC]);
  SomaCC:=0;
end;






procedure Trpt_PedidosMensal.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_PedidosMensal.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
