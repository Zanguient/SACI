unit UPromissoria2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Extenso, Titulo_receber;

type
  Trpt_Promissoria2 = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRFrameLine2: TSZRFrameLine;
    ZRFrameLine5: TSZRFrameLine;
    ZRFrameLine6: TSZRFrameLine;
    ZRFrameLine7: TSZRFrameLine;
    ZRFrameLine9: TSZRFrameLine;
    ZRFrameLine4: TSZRFrameLine;
    ZRFrameLine13: TSZRFrameLine;
    Titulo_receber1: TTitulo_receber;
    ZRLabel17: TSZRLabel;
    ZRDBText13: TSZRDBText;
    ZRDBText14: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel6: TSZRLabel;
    SZRBand1: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel23: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRLabel1: TSZRLabel;
    ZRLabel21: TSZRLabel;
    SZRFrameLine3: TSZRFrameLine;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRFrameLine1: TSZRFrameLine;
    SZRFrameLine2: TSZRFrameLine;
    SZRGroup1: TSZRGroup;
    ZRDBText9: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRDBText1: TSZRDBText;
    SZRFrameLine6: TSZRFrameLine;
    SZRFrameLine4: TSZRFrameLine;
    SZRFrameLine5: TSZRFrameLine;
    ZRFrameLine1: TSZRFrameLine;
    ZRFrameLine3: TSZRFrameLine;
    ZRFrameLine8: TSZRFrameLine;
    ZRFrameLine10: TSZRFrameLine;
    Extenso1: TValorPorExtenso;
    SZRDBText12: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRDBText16: TSZRDBText;
    SZRDBText13: TSZRDBText;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRDBText17: TSZRDBText;
    SZRLabel18: TSZRLabel;
    SZRDBText18: TSZRDBText;
    SZRLabel20: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRDBText19: TSZRDBText;
    SZRDBText21: TSZRDBText;
    SZRLabel26: TSZRLabel;
    SZRDBText11: TSZRDBText;
    SZRLabel28: TSZRLabel;
    SZRDBText20: TSZRDBText;
    SZRLabel4: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRDBText10: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRLabel6: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ZRLabel21BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Total:Double;
  end;

var
  rpt_Promissoria2: Trpt_Promissoria2;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_Promissoria2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Titulo_Receber1.Active:= false;
 Action := cafree;
end;

procedure Trpt_Promissoria2.Button1Click(Sender: TObject);
begin
Report.Report.Preview;
end;

procedure Trpt_Promissoria2.ZRLabel21BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  S : string;
begin
  Extenso1.Valor:=Total;
  S := Extenso1.Texto;
  ZRlabel21.Caption:=UpperCase(S);
end;



procedure Trpt_Promissoria2.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;






procedure Trpt_Promissoria2.ZRBand1AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  Total:=0;
end;

procedure Trpt_Promissoria2.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=Total+Titulo_receber1.Valor;
  SZRLabel3.Caption:=Format('%.2f',[Titulo_receber1.Valor]);
end;



procedure Trpt_Promissoria2.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel1.Caption:=Format('%.2f',[Total]);
end;










procedure Trpt_Promissoria2.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Titulo_receber1.FieldByName('CLI_PAI').asString <> '' then
    SZRLabel12.Caption:=Titulo_receber1.FieldByName('CLI_PAI').asString+' / ';
  SZRLabel12.Caption:=SZRLabel12.Caption+Titulo_receber1.FieldByName('CLI_MAE').asString;
  SZRLabel20.Caption:=Trim(DM.SelecionaParametro(Titulo_receber1.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                           Titulo_receber1.FieldByName('CLI_ENDERECO').asString);
end;

end.
