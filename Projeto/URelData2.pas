unit URelData2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls;

type
  Trpt_Data2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    DataOk: Boolean;
  end;

var
  rpt_Data2: Trpt_Data2;

implementation

uses UFluxoCaixaDia2, UDM;

{$R *.DFM}


procedure Trpt_Data2.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure Trpt_Data2.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(Trpt_FluxoCaixaDia2, rpt_FluxoCaixaDia2);
  rpt_FluxoCaixaDia2.report.Preview;
  rpt_FluxoCaixaDia2.Close;
end;

procedure Trpt_Data2.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  DateTimePicker1.Date:=DM.Configuracao1.Data;
end;

procedure Trpt_Data2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_Data2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(13) then
    BitBtn1Click(BitBtn1);
end;

end.
