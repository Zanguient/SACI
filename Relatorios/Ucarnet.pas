unit UCarnet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Titulo_receber;

type
  Trpt_carnet = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRFrameLine1: TSZRFrameLine;
    ZRFrameLine2: TSZRFrameLine;
    ZRFrameLine3: TSZRFrameLine;
    ZRFrameLine8: TSZRFrameLine;
    ZRFrameLine9: TSZRFrameLine;
    ZRFrameLine4: TSZRFrameLine;
    ZRDBText7: TSZRDBText;
    ZRFrameLine12: TSZRFrameLine;
    ZRLabel13: TSZRLabel;
    ZRFrameLine13: TSZRFrameLine;
    Titulo_receber1: TTitulo_receber;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRDBText13: TSZRDBText;
    ZRDBText14: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRLabel9: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRDBText10: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel1: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRExpression1: TSZRExpression;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRDBText10: TSZRDBText;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRSysData1: TSZRSysData;
    SZRLabel13: TSZRLabel;
    SZRFrameLine1: TSZRFrameLine;
    SZRLabel14: TSZRLabel;
    SZRDBText11: TSZRDBText;
    SZRDBText12: TSZRDBText;
    SZRFrameLine2: TSZRFrameLine;
    SZRFrameLine3: TSZRFrameLine;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    Titulo_receberAntes: TTitulo_receber;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRLabel13BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_carnet: Trpt_carnet;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_carnet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Titulo_Receber1.Active:= false;
  Action := cafree;
end;

procedure Trpt_carnet.Button1Click(Sender: TObject);
begin
  Report.Report.Preview;
end;

procedure Trpt_carnet.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_carnet.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel15.Caption := Trim(DM.SelecionaParametro(Titulo_receber1.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                             Titulo_receber1.FieldByName('CLI_ENDERECO').asString);
  SZRLabel16.Caption := SZRLabel15.Caption;
end;

procedure Trpt_carnet.SZRLabel13BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel13.Caption:=DM.Configuracao1.LojaNome;
end;

end.
