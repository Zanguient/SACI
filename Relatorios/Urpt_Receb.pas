unit Urpt_Receb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, SQuery, Item_de_Embarque, Embarque,
  Produto, Transportadora, Funcionario, CentroCusto, Pre_Recebimento,
  Recebimento, Funcoes;

type
  Trpt_Recebimento = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRDBText13: TSZRDBText;
    ZRGroup1: TSZRGroup;
    ZRBand4: TSZRBand;
    ZRDBText3: TSZRDBText;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRDBText4: TSZRDBText;
    Produto1: TProduto;
    ZRLabel19: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRDBText10: TSZRDBText;
    ZRLabel21: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRDBText11: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRDBText7: TSZRDBText;
    CentroCusto1: TCentroCusto;
    ZRDBText1: TSZRDBText;
    ZRLabel25: TSZRLabel;
    SZRLabel1: TSZRLabel;
    Recebimento1: TRecebimento;
    Recebimento1REC_CODIGO: TIntegerField;
    Recebimento1CNC_CODIGO: TIntegerField;
    Recebimento1REC_DATA: TDateTimeField;
    Recebimento1FOR_CODIGO: TIntegerField;
    Recebimento1REC_SITUACAO: TIntegerField;
    Recebimento1REC_TOT_ITEM: TIntegerField;
    Recebimento1REC_TIPO: TIntegerField;
    Recebimento1REC_CNC_ORIGEM: TIntegerField;
    Recebimento1REC_COD_ORIGEM: TIntegerField;
    Recebimento1REC_DATA_SAIDA: TDateTimeField;
    Recebimento1REC_DATA_EMISSAO: TDateTimeField;
    Recebimento1REC_NUM_DOC: TStringField;
    Recebimento1PRC_CODIGO: TIntegerField;
    Recebimento1REC_OBSERVACAO: TStringField;
    Recebimento1IRC_CODIGO: TIntegerField;
    Recebimento1CNC_CODIGO_1: TIntegerField;
    Recebimento1PRD_CODIGO: TIntegerField;
    Recebimento1REC_CODIGO_1: TIntegerField;
    Recebimento1IRC_QUANTIDADE: TFloatField;
    Recebimento1IRC_SITUACAO: TIntegerField;
    Recebimento1Origem: TStringField;
    Recebimento1Situacao: TStringField;
    Recebimento1NumDoc: TStringField;
    Recebimento1Produto: TStringField;
    Recebimento1Referencia: TStringField;
    SZRBand1: TSZRBand;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    lblTotal: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Recebimento1CalcFields(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportAfterPrint(Sender: TObject; Printed: Boolean);
  private
    { Private declarations }
    iTotal: double;
  public
    { Public declarations }
  end;

var
  rpt_Recebimento: Trpt_Recebimento;

implementation

Uses UDM;

{$R *.DFM}      

procedure Trpt_Recebimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_Recebimento.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Recebimento.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel1.Caption:=format('%.2f',[Recebimento1.FieldByName('IRC_QUANTIDADE').asfloat]);
  iTotal := iTotal + Recebimento1.FieldByName('IRC_QUANTIDADE').asfloat;
end;

procedure Trpt_Recebimento.Recebimento1CalcFields(DataSet: TDataSet);
var
  Tipo:string;
begin
  Tipo:='';
  Case Recebimento1.Situacao of
    0: Recebimento1.FieldByName('SITUACAO').asString:='Aguardando';
    1: Recebimento1.FieldByName('SITUACAO').asString:='Recebido';
    2: Recebimento1.FieldByName('SITUACAO').asString:='Recusado';
    3: Recebimento1.FieldByName('SITUACAO').asString:='Cancelado';
  End;
  if Recebimento1.Tipo = 0 then
    Tipo:='TRC'
  else if Recebimento1.Tipo = 1 then
    Tipo:='ABS'
  else if Recebimento1.Tipo = 2 then
    Tipo:='COM';
  Recebimento1.FieldByName('NumDoc').AsString := Tipo+Recebimento1.FieldByName('REC_CODIGO').
  AsString+'/'+IntToStr(DM.Configuracao1.CodigoCNC)+'-'+FormatDateTime('dd.mm.yyyy',
  Recebimento1.FieldByName('REC_DATA').asDateTime);
end;

procedure Trpt_Recebimento.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Recebimento.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption := EmpresaDesenvolvedora;
end;

procedure Trpt_Recebimento.FormCreate(Sender: TObject);
begin
  iTotal := 0;
end;

procedure Trpt_Recebimento.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  lblTotal.Caption := format('%.2f',[iTotal]);
end;

procedure Trpt_Recebimento.reportAfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  iTotal := 0;
end;

end.
