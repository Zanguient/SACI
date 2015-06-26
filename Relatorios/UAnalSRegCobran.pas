unit UAnalSRegCobran;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, funcoes;

type
  Trpt_SCobran = class(TForm)
    report_cobra: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel5: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText11: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRLabel13: TSZRLabel;
    Cliente1: TCliente;
    ZRLabel2: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRLabel1: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRSysData3: TSZRSysData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente1BeforeOpen(DataSet: TDataSet);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_SCobran: Trpt_SCobran;

implementation
uses
    UDM;
{$R *.DFM}












































procedure Trpt_SCobran.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_SCobran.Cliente1BeforeOpen(DataSet: TDataSet);
begin
   Cliente1.ParamByName('CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_SCobran.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel16.Caption := EmpresaDesenvolvedora;
end;

end.
