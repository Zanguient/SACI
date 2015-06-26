unit ZRPrgres;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
     Dialogs, StdCtrls, ComCtrls, ZRPrntr;

type
  TSZRProgressForm = class(TForm)
    Gauge : TProgressBar;
    Info  : TLabel;
    Cancel: TButton;
    procedure CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    fZRPrinter : TSZRPrinter;
  protected
    procedure CMZRPROGRESSUPDATE(var Message); message CM_ZRPROGRESSUPDATE;
  public
    property ZRPrinter : TSZRPrinter read fZRPrinter write fZRPrinter;
  end;

implementation

{$R *.DFM}

uses ZRConst;

procedure TSZRProgressForm.FormCreate(Sender: TObject);
begin
  Caption       := LoadStr(szrPrinting);
  Cancel.Caption:= LoadStr(szrCancel);
end;

procedure TSZRProgressForm.CMZRPROGRESSUPDATE(var Message);
begin
  if (fZRPrinter.Progress mod 5) = 0 then
    begin
      Gauge.Position := fZRPrinter.Progress;
      Info .Caption  := IntToStr(fZRPrinter.Progress)+'% ' + LoadStr(SzrCompleted);
      Application.ProcessMessages;
    end;
end;

procedure TSZRProgressForm.CancelClick(Sender: TObject);
begin
  fZRPrinter.Cancel;
end;

procedure TSZRProgressForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    CancelClick(sender);
end;

end.
