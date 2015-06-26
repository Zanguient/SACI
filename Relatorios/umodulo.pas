unit umodulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Submodulo,
  Modulo;

type
  Trpt_modulo_submodulo = class(TForm)
    Modulo1: TModulo;
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRLabel6: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ChildBand1: TSZRCustomBand;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_modulo_submodulo: Trpt_modulo_submodulo;

implementation

{$R *.DFM}

procedure Trpt_modulo_submodulo.FormCreate(Sender: TObject);
begin
 Modulo1.Active:=true;
end;
procedure Trpt_modulo_submodulo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Modulo1.Active:=false;
end;

end.
