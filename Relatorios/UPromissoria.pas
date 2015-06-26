unit UPromissoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Parametro,
  Titulo_receber, Extenso;

type
  Trpt_Promissoria = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRDBText9: TSZRDBText;
    ZRFrameLine1: TSZRFrameLine;
    ZRFrameLine2: TSZRFrameLine;
    ZRFrameLine3: TSZRFrameLine;
    ZRFrameLine5: TSZRFrameLine;
    ZRFrameLine6: TSZRFrameLine;
    ZRFrameLine7: TSZRFrameLine;
    ZRFrameLine8: TSZRFrameLine;
    ZRFrameLine9: TSZRFrameLine;
    ZRFrameLine4: TSZRFrameLine;
    ZRLabel13: TSZRLabel;
    ZRFrameLine13: TSZRFrameLine;
    Titulo_receber1: TTitulo_receber;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRDBText13: TSZRDBText;
    ZRDBText14: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRLabel15: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRDBText10: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText1: TSZRDBText;
    ZRLabel1: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel21: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel23: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRFrameLine10: TSZRFrameLine;
    Extenso1: TValorPorExtenso;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ZRLabel21BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Promissoria: Trpt_Promissoria;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_Promissoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Titulo_Receber1.Active:= false;
  Action := cafree;
end;

procedure Trpt_Promissoria.Button1Click(Sender: TObject);
begin
  Report.Report.Preview;
end;

procedure Trpt_Promissoria.ZRLabel21BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  S : string;
begin
  Extenso1.Valor:=Titulo_receber1.fieldbyname('TRC_VALOR').asfloat;
  S := Extenso1.Texto;
  ZRlabel21.Caption:=UpperCase(S);
end;

procedure Trpt_Promissoria.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

end.
