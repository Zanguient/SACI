unit ZRSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ExtCtrls, ZRPrntr, Buttons;

type
  TSZRPrinterSetup = class(TForm)
    btOK: TButton;
    btCancel: TButton;
    paSetup: TPanel;
    rgDestination: TRadioGroup;
    edFile: TEdit;
    btBrowse: TButton;
    rgLPT: TRadioGroup;
    SaveDialog: TSaveDialog;
    rgPages: TRadioGroup;
    paRange: TPanel;
    laFrom: TLabel;
    laTo: TLabel;
    seFrom: TSpinEdit;
    seTo: TSpinEdit;
    gbCopies: TGroupBox;
    seCopies: TSpinEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure rgDestinationClick(Sender: TObject);
    procedure rgPagesClick(Sender: TObject);
    procedure btBrowseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    fPrinter: TSZRPrinter;
    procedure SetPrinter(Value: TSZRPrinter);
  public
    { Public declarations }
    property ZRPrinter: TSZRPrinter read fPrinter write SetPrinter;
  end;

implementation

{$R *.DFM}

uses ZRConst;

procedure TSZRPrinterSetup.FormCreate(Sender: TObject);
begin
  Caption               := LoadStr(SzrPrinterSetup);
  rgDestination.Caption := LoadStr(SzrDestination);
  rgDestination.Items[0]:= LoadStr(SzrDestinationFile);
  rgDestination.Items[1]:= LoadStr(SzrDestinationLPT);
  btBrowse     .Caption := LoadStr(SzrBrowse);
  SaveDialog   .Filter  := LoadStr(SzrFileFilter);
  rgPages.Caption := LoadStr(SzrPages);
  rgPages.Items[0]:= LoadStr(SzrPagesAll);
  rgPages.Items[1]:= LoadStr(SzrPagesRange);
  laFrom  .Caption:= LoadStr(SzrPagesRangeFrom);
  laTo    .Caption:= LoadStr(SzrPagesRangeTo);
  gbCopies.Caption:= LoadStr(SzrCopies);

  btOK    .Caption:= LoadStr(SzrOK);
  btCancel.Caption:= LoadStr(SzrCancel);
end;

procedure TSZRPrinterSetup.SetPrinter(Value: TSZRPrinter);
begin
  fPrinter:= Value;
  with ZRPrinter.Options do
    begin
      if Destination = zrdFile then
        rgDestination.ItemIndex:= 0
      else
        begin
          rgDestination.ItemIndex:= 1;
          rgLPT        .ItemIndex:= Ord(Destination)-1;
        end;
      edFile.Text:= FileName;
      rgPages.ItemIndex:= 0;
      seFrom.MaxValue  := ZRPrinter.PageCount;
      seTo  .MaxValue  := ZRPrinter.PageCount;
      if PageFrom > ZRPrinter.PageCount then
        seFrom.Value:= 1
      else
        seFrom.Value:= PageFrom;
      if (PageTo > ZRPrinter.PageCount) or (PageTo < PageFrom) then
        seTo.Value:= ZRPrinter.PageCount
      else
        seTo.Value:= PageTo;
      seCopies.Value:= Copies;
    end;
end;

procedure TSZRPrinterSetup.rgDestinationClick(Sender: TObject);
begin
  edFile  .Enabled:= (rgDestination.ItemIndex = 0);
  btBrowse.Enabled:= edFile.Enabled;
  rgLPT   .Enabled:= (rgDestination.ItemIndex = 1);
  if rgLPT.Enabled and (ZRPrinter.Options.Destination = zrdFile) then
    rgLPT.ItemIndex:= 0;
end;

procedure TSZRPrinterSetup.btBrowseClick(Sender: TObject);
begin
  with SaveDialog do
    if Execute then edFile.Text:= FileName;
end;

procedure TSZRPrinterSetup.rgPagesClick(Sender: TObject);
begin
  paRange.Enabled:= (rgPages.ItemIndex = 1);
end;

procedure TSZRPrinterSetup.btOKClick(Sender: TObject);
begin
  if seFrom.Value > seTo.Value then
  begin
    ModalResult:= mrNone;
    raise EZRError.CreateRes(SzrIllegalPageRange);
  end;
  with ZRPrinter.Options do
  begin
    if (rgPages.ItemIndex = 0) then
    begin
      PageFrom:= 1;
      PageTo  := ZRPrinter.PageCount;
    end
    else
    begin
      PageFrom:= seFrom.Value;
      PageTo  := seTo  .Value;
    end;
    Copies:= seCopies.Value;
  end;
end;

procedure TSZRPrinterSetup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    btOKClick(sender)
  else if Key = #27 then
    Close;
end;

procedure TSZRPrinterSetup.BitBtn1Click(Sender: TObject);
begin
  btOKClick(btOK);
end;

end.

