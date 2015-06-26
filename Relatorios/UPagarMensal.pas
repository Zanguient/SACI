unit UPagarMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, funcoes,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, CentroCusto, Titulo_a_Pagar;

type
  Trpt_PagarMensal = class(TForm)
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
    CentroCusto1: TCentroCusto;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel20: TSZRLabel;
    Titulo_a_pagar1: TTitulo_a_pagar;
    Titulo_a_pagar1CNC_CODIGO: TIntegerField;
    Titulo_a_pagar1VALOR: TFloatField;
    Titulo_a_pagar1desc_mes: TStringField;
    Titulo_a_pagar1desc_cc: TStringField;
    Titulo_a_pagar1Vencimento: TStringField;
    Titulo_a_pagar1VencimentoANO: TStringField;
    Titulo_a_pagar1TPG_VENCIMENTO: TDateTimeField;
    Titulo_a_pagar1VencimentoMES: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand6AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand5AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand6BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Titulo_a_pagar1CalcFields(DataSet: TDataSet);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    SomaAno,Somames,SomaTotal:Double;
  end;

var
  rpt_PagarMensal: Trpt_PagarMensal;

implementation
Uses
  UDM;

{$R *.DFM}


procedure Trpt_PagarMensal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Titulo_a_pagar1.close;
  Action := cafree;
end;


procedure Trpt_PagarMensal.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;


procedure Trpt_PagarMensal.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SomaAno:=SomaAno+Titulo_a_pagar1.FieldByName('VALOR').AsFloat;
  Somames:=Somames+Titulo_a_pagar1.FieldByName('VALOR').AsFloat;
  Somatotal:=Somatotal+Titulo_a_pagar1.FieldByName('VALOR').AsFloat;
end;

procedure Trpt_PagarMensal.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SomaAno:=0;
  Somames:=0;
  Somatotal:=0;
end;


procedure Trpt_PagarMensal.ZRBand6AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  SomaAno:=0;
end;

procedure Trpt_PagarMensal.ZRBand5AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  Somames:=0;
end;

procedure Trpt_PagarMensal.ZRBand6BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel18.Caption:=Format('%.2f',[SomaAno]);
end;

procedure Trpt_PagarMensal.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel14.Caption:=Format('%.2f',[Somames]);
end;


procedure Trpt_PagarMensal.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel6.Caption:=Format('%.2f',[SomaTotal]);
end;


procedure Trpt_PagarMensal.Titulo_a_pagar1CalcFields(DataSet: TDataSet);
begin
  Titulo_a_pagar1.FieldByName('VencimentoMes').AsString:=copy(FormatDateTime('dd/mm/yyyy',Titulo_a_pagar1.FieldByName('TPG_VENCIMENTO').AsDateTime),4,2);
  Titulo_a_pagar1.FieldByName('Vencimento').AsString:=copy(FormatDateTime('dd/mm/yyyy',Titulo_a_pagar1.FieldByName('TPG_VENCIMENTO').AsDateTime),1,5);
  Case StrToInt(copy(FormatDateTime('dd/mm/yyyy',Titulo_a_pagar1.FieldByName('TPG_VENCIMENTO').AsDateTime),4,2)) of
    1:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Janeiro';
    2:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Fevereiro';
    3:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Março';
    4:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Abril';
    5:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Maio';
    6:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Junho';
    7:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Julho';
    8:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Agosto';
    9:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Setembro';
    10:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Outubro';
    11:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Novembro';
    12:Titulo_a_pagar1.FieldByName('desc_mes').AsString:='Dezembro';
  end;
end;

procedure Trpt_PagarMensal.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_PagarMensal.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
