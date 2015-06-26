unit URegistro_procura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, RegProc;

type
  Trpt_reg_procura = class(TForm)
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
    ZRDBText2: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    RegProc1: TRegProc;
    ZRLabel10: TSZRLabel;
    ZRDBText3: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_reg_procura: Trpt_reg_procura;

implementation

{$R *.DFM}




procedure Trpt_reg_procura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 RegProc1.Active:=false;
end;

procedure Trpt_reg_procura.FormCreate(Sender: TObject);
begin
 RegProc1.Active:=true;
end;

end.
