unit UAnalSAfim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls;

type
  Trpt_SAfim = class(TForm)
    report_cliafim: TSZReport;
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
    Cliente1: TCliente;
    ZRLabel2: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_SAfim: Trpt_SAfim;

implementation
uses
   UDM;
{$R *.DFM}



































procedure Trpt_SAfim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_SAfim.Cliente1BeforeOpen(DataSet: TDataSet);
begin
  Cliente1.ParamByName('CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

end.
