unit Urpt_Cotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, funcoes;

type
  Trpt_Cotacao = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRSysData1: TSZRSysData;
    qry_cotacao: TQuery;
    qry_iCotacao: TQuery;
    SZRBand1: TSZRBand;
    SZRGroup1: TSZRGroup;
    ZRLabel6: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRDBText16: TSZRDBText;
    SZRLabel17: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRDBText15: TSZRDBText;
    SZRLabel15: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText14: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel10: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRDBText10: TSZRDBText;
    procedure qry_iCotacaoCalcFields(DataSet: TDataSet);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Cotacao: Trpt_Cotacao;

implementation

uses UDM;

{$R *.DFM}

procedure Trpt_Cotacao.qry_iCotacaoCalcFields(DataSet: TDataSet);
begin
  try
    if qry_iCotacao.FieldByName('ICT_TIPO_ACFIN').asInteger=0 then
      qry_iCotacao.FieldByName('ICT_TIPO_ACFIN2').asString:='M'
    else if qry_iCotacao.FieldByName('ICT_TIPO_ACFIN').asInteger=1 then
      qry_iCotacao.FieldByName('ICT_TIPO_ACFIN2').asString:='T';
  except
  end;
end;

procedure Trpt_Cotacao.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Cotacao.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
