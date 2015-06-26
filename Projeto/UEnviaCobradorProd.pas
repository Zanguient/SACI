unit UEnviaCobradorProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, Titulo_receber, ZRCtrls, ZReport, funcoes;

type
  Trpt_EnviaCoradorProd = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRBand2: TSZRBand;
    ZRDBText1: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRLabel14: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRLabel12: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRLabel19: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    SZRDBText1: TSZRDBText;
    SZRLabel1: TSZRLabel;
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_EnviaCoradorProd: Trpt_EnviaCoradorProd;

implementation

{$R *.DFM}




procedure Trpt_EnviaCoradorProd.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
