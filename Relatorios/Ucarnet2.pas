unit UCarnet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Parametro,
  Titulo_receber;

type
  Trpt_carnet2 = class(TForm)
    report: TSZReport;
    ZRBand2: TSZRBand;
    ZRDBText1: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    ZRDBText12: TSZRDBText;
    ZRDBText13: TSZRDBText;
    ZRDBText14: TSZRDBText;
    ZRExpression1: TSZRExpression;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRExpression1: TSZRExpression;
    SZRDBText9: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRDBText11: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_carnet2: Trpt_carnet2;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_carnet2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Titulo_Receber1.Active:= false;
 Action := cafree;
end;

procedure Trpt_carnet2.Button1Click(Sender: TObject);
begin
  Report.Report.Preview;
end;


end.
