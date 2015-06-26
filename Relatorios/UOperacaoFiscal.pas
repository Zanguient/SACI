unit UOperacaoFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, OperFisc,
  Parametro, funcoes;

type
  Trpt_OperacaoFiscal = class(TForm)
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
    ZRDBText1: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRLabel10: TSZRLabel;
    SZRLabel1: TSZRLabel;
    OperFiscal1: TOperFiscal;
    OperFiscal1OPF_CODIGO: TIntegerField;
    OperFiscal1CNC_CODIGO: TIntegerField;
    OperFiscal1OPF_DESCRICAO: TStringField;
    OperFiscal1OPF_TIPO: TIntegerField;
    OperFiscal1OPF_OBSERVACAO: TStringField;
    OperFiscal1USU_CODIGO: TIntegerField;
    OperFiscal1OPF_DT_CADASTRO: TDateTimeField;
    OperFiscal1OPF_DT_ALTERADO: TDateTimeField;
    OperFiscal1OPF_ENTRADA: TIntegerField;
    OperFiscal1OPF_SAIDA: TIntegerField;
    OperFiscal1EntradaSaida: TStringField;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    OperFiscal1Tipo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure OperFiscal1CalcFields(DataSet: TDataSet);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_OperacaoFiscal: Trpt_OperacaoFiscal;

implementation
uses
  UDM;

{$R *.DFM}



procedure Trpt_OperacaoFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 OperFiscal1.Close;
 Action := cafree;
end;

procedure Trpt_OperacaoFiscal.FormCreate(Sender: TObject);
begin
  OperFiscal1.Open;
end;

procedure Trpt_OperacaoFiscal.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_OperacaoFiscal.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_OperacaoFiscal.OperFiscal1CalcFields(DataSet: TDataSet);
var
  vEntradaSaida : String;
begin
  OperFiscal1.FieldByName('Tipo').asString := DM.SelecionaParametro(OperFiscal1.Tipo);

  vEntradaSaida := '';
  if OperFiscal1.Entrada then
    vEntradaSaida := 'E';
  if OperFiscal1.Saida then
    vEntradaSaida := 'S';

  OperFiscal1.FieldByName('EntradaSaida').asString := vEntradaSaida;
end;

procedure Trpt_OperacaoFiscal.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
