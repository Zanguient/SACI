unit UCarnetCont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, Titulo_receber, ZRCtrls, ZReport, Parametro;

type
  Trpt_CarnetCont = class(TForm)
    report: TSZReport;
    ZRBand2: TSZRBand;
    SZRDBText5: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRExpression1: TSZRExpression;
    SZRDBText10: TSZRDBText;
    SZRDBText11: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRExpression2: TSZRExpression;
    SZRDBText14: TSZRDBText;
    SZRDBText15: TSZRDBText;
    SZRDBText16: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRDBText18: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Parametro1: TParametro;
    SZRLabel6: TSZRLabel;
    SZRLabel61: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_CarnetCont: Trpt_CarnetCont;

implementation

{$R *.DFM}

procedure Trpt_CarnetCont.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Titulo_Receber1.Active:= false;
  Parametro1.Active:=False;
  Action := cafree;
end;

procedure Trpt_CarnetCont.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Titulo_receber1.FieldByName('CLI_LOGRADOURO').asInteger > 0 then
  Begin
    Parametro1.Close;
    Parametro1.ParamByName('PAR_CODIGO').asInteger:=Titulo_receber1.FieldByName('CLI_LOGRADOURO').asInteger;
    Parametro1.Open;
    SZRLabel4.Caption:=Parametro1.Descricao+' '+Titulo_receber1.FieldByName('CLI_ENDERECO').asString;
    SZRLabel7.Caption:=Parametro1.Descricao+' '+Titulo_receber1.FieldByName('CLI_ENDERECO').asString;
  end
  else
  Begin
    SZRLabel4.Caption:=Titulo_receber1.FieldByName('CLI_ENDERECO').asString;
    SZRLabel7.Caption:=Titulo_receber1.FieldByName('CLI_ENDERECO').asString;
  end;
end;

end.
