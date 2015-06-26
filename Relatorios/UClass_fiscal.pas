unit UClass_fiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Classificacao_fiscal, funcoes;

type
  Trpt_class_fiscal = class(TForm)
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
    Classificacao_fiscal1: TClassificacao_fiscal;
    ZRDBText1: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRLabel9: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Classificacao_fiscal1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_class_fiscal: Trpt_class_fiscal;

implementation
uses
  UDM;

{$R *.DFM}


procedure Trpt_class_fiscal.FormCreate(Sender: TObject);
begin
  Classificacao_fiscal1.Active := true;
end;

procedure Trpt_class_fiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Classificacao_fiscal1.Active := false;
    Action := cafree;
end;

procedure Trpt_class_fiscal.Classificacao_fiscal1BeforeOpen(
  DataSet: TDataSet);
begin
 Classificacao_fiscal1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_class_fiscal.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_class_fiscal.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_class_fiscal.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
