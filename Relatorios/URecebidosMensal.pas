unit URecebidosMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,funcoes,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, CentroCusto;

type
  Trpt_RecebidosMensal = class(TForm)
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
    ZRDBText6: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    ZRExpression1: TSZRExpression;
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
    Titulo_receber1CNC_CODIGO: TIntegerField;
    Titulo_receber1VALOR: TFloatField;
    Titulo_receber1desc_mes: TStringField;
    CentroCusto1: TCentroCusto;
    Titulo_receber1desc_cc: TStringField;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel20: TSZRLabel;
    Titulo_receber1Pagamento: TStringField;
    Titulo_receber1PagamentoANO: TStringField;
    Titulo_receber1TRC_PAGAMENTO: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand6AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand5AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand6BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    SomaAno,Somames,SomaTotal:Double;
  end;

var
  rpt_RecebidosMensal: Trpt_RecebidosMensal;

implementation
Uses
  UDM;

{$R *.DFM}


procedure Trpt_RecebidosMensal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Titulo_receber1.Active:=False;
Action := cafree;
end;


procedure Trpt_RecebidosMensal.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;


procedure Trpt_RecebidosMensal.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SomaAno:=SomaAno+Titulo_receber1.FieldByName('VALOR').AsFloat;
  Somames:=Somames+Titulo_receber1.FieldByName('VALOR').AsFloat;
  Somatotal:=Somatotal+Titulo_receber1.FieldByName('VALOR').AsFloat;
end;

procedure Trpt_RecebidosMensal.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SomaAno:=0;
  Somames:=0;
  Somatotal:=0;
end;


procedure Trpt_RecebidosMensal.ZRBand6AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  SomaAno:=0;
end;

procedure Trpt_RecebidosMensal.ZRBand5AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  Somames:=0;
end;

procedure Trpt_RecebidosMensal.ZRBand6BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel18.Caption:=Format('%.2f',[SomaAno]);
end;

procedure Trpt_RecebidosMensal.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel14.Caption:=Format('%.2f',[Somames]);
end;


procedure Trpt_RecebidosMensal.Titulo_receber1CalcFields(DataSet: TDataSet);
begin
  Titulo_receber1.FieldByName('PagamentoAno').AsString:=copy(DateToStr(Titulo_receber1.FieldByName('TRC_PAGAMENTO').AsDateTime),7,4);
  Titulo_receber1.FieldByName('Pagamento').AsString:=copy(DateToStr(Titulo_receber1.FieldByName('TRC_PAGAMENTO').AsDateTime),4,2);
  Case Titulo_receber1.FieldByName('Pagamento').AsInteger of
    1:Titulo_receber1.FieldByName('desc_mes').AsString:='Janeiro';
    2:Titulo_receber1.FieldByName('desc_mes').AsString:='Fevereiro';
    3:Titulo_receber1.FieldByName('desc_mes').AsString:='Março';
    4:Titulo_receber1.FieldByName('desc_mes').AsString:='Abril';
    5:Titulo_receber1.FieldByName('desc_mes').AsString:='Maio';
    6:Titulo_receber1.FieldByName('desc_mes').AsString:='Junho';
    7:Titulo_receber1.FieldByName('desc_mes').AsString:='Julho';
    8:Titulo_receber1.FieldByName('desc_mes').AsString:='Agosto';
    9:Titulo_receber1.FieldByName('desc_mes').AsString:='Setembro';
    10:Titulo_receber1.FieldByName('desc_mes').AsString:='Outubro';
    11:Titulo_receber1.FieldByName('desc_mes').AsString:='Novembro';
    12:Titulo_receber1.FieldByName('desc_mes').AsString:='Dezembro';
  end;
end;

procedure Trpt_RecebidosMensal.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel6.Caption:=Format('%.2f',[SomaTotal]);
end;

procedure Trpt_RecebidosMensal.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_RecebidosMensal.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
