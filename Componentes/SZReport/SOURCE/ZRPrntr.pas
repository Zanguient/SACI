unit ZRPrntr;

{$B-}

interface

uses
  Windows, WinSpool, Sysutils, Messages, Classes, Controls, StdCtrls, ExtCtrls,
  ComCtrls, Buttons, Printers, Graphics, Forms, Dialogs, DB, DBTables, ZREscape;

const
  CM_ZRPROGRESSUPDATE = WM_USER + 0;
  CM_ZRPAGEAVAILABLE  = WM_USER + 1;

type
  { TSZStringStream }
  TSZStringStream = class(TStream)
    public
      function  ReadChar(var Value: Char): Boolean;
      procedure WriteChar(Value: Char);
      procedure WriteString(Value: String); virtual;
      function  ReadString(var Value: String): Boolean; virtual;
  end;

  { TSZRStream }
  TSZRStream = class(TSZStringStream)
    private
      fLock        : TRTLCriticalSection;
      MemoryStream : TMemoryStream;
      fFileName    : String;
      FileStream   : TFileStream;
      fInMemory    : Boolean;
      fMemoryLimit : Longint;
    public
      constructor CreateInMemory(MemoryLimit : Longint);
      constructor CreateFromFile(FileName : String);
      destructor  Destroy; override;
      function Write(const Buffer; Count: Longint): Longint; override;
      function Seek(Offset: Longint; Origin: Word): Longint; override;
      function Read(var Buffer; Count: Longint): Longint; override;
      procedure LockStream;
      procedure UnlockStream;
      procedure SaveToStream(AStream : TSZStringStream; StartPos, EndPos: Integer);
      property  InMemory  : Boolean read fInMemory;
  end;

  { TSZRPage }
  TSZRPage = class
    private
      fWidth    : Integer;
      fItems    : TStringList;
      function  GetItems(Index: Integer): String;
      procedure SetItems(Index: Integer; Value: String);
      function  GetLength: Integer;
      procedure SetLength(Value: Integer);
      procedure SetWidth(Value: Integer);
    public
      constructor Create(AWidth: Integer);
      destructor  Destroy; override;
      procedure SaveToStream(Stream: TSZStringStream);
      procedure LoadFromStream(Stream: TSZStringStream; MaxLength: Integer);
      property Items[Index: Integer]: String read GetItems write SetItems; default;
      property Length: Integer read GetLength write SetLength;
      property Width : Integer read fWidth    write SetWidth;
  end;

  { TSZRPageIndex }

  TIntegerArray  = array[0..($FFFF div SizeOf(Integer))-2] of Integer;
  PIntegerArray  = ^TIntegerArray;

  TSZRPageIndex = class(TPersistent)
    private
      fCount : Integer;
      fBuffer: PIntegerArray;
    protected
      procedure SetCount(ACount: Integer);
      function  GetItem(Index: Integer): Integer;
      procedure SetItem(Index: Integer; Value: Integer);
    public
      destructor  Destroy; override;
      procedure   Clear;
      procedure   SetZero;
      property Count: Integer read fCount write SetCount default 0;
      property Item[Index:Integer]: Integer read GetItem write SetItem; default;
  end;

  {TSZRPrinterEscapes}
  
const
  EPSON_BOLD_ON         = #27'E'#27'G';
  EPSON_BOLD_OFF        = #27'F'#27'H';
  EPSON_ITALIC_ON       = #27'4';
  EPSON_ITALIC_OFF      = #27'5';
  EPSON_UNDERLINE_ON    = #27'-1';
  EPSON_UNDERLINE_OFF   = #27'-0';
  EPSON_SUBSCRIPT_ON    = #27#83#00;
  EPSON_SUBSCRIPT_OFF   = #27#84;
  EPSON_SUPERSCRIPT_ON  = #27#83#01;
  EPSON_SUPERSCRIPT_OFF = #27#84;

type
  TSZRPrinterEscapes = class(TPersistent)
    private
      fEscapes: array[TEscapeStyle, 0..1] of String;
      function  GetEscape(Index: Integer): String;
      procedure SetEscape(Index: Integer; Value: String);
    public
      constructor Create;
      function PrinterFormat(const Escape: String): String;
    published
      property BoldOn        : String index 0 read GetEscape write SetEscape;
      property BoldOff       : String index 1 read GetEscape write SetEscape;
      property ItalicsOn     : String index 2 read GetEscape write SetEscape;
      property ItalicsOff    : String index 3 read GetEscape write SetEscape;
      property UnderlineOn   : String index 4 read GetEscape write SetEscape;
      property UnderlineOff  : String index 5 read GetEscape write SetEscape;
      property SuperScriptOn : String index 6 read GetEscape write SetEscape;
      property SuperScriptOff: String index 7 read GetEscape write SetEscape;
      property SubScriptOn   : String index 8 read GetEscape write SetEscape;
      property SubScriptOff  : String index 9 read GetEscape write SetEscape;
  end;

  {TSZRPrinterOptions}

  TSZReportDestination = (zrdFile, zrdLPT1, zrdLPT2, zrdLPT3 {zrdPrinter});
  TSZRPaperType        = (zptSheet, zptFolio);

  TSZRPrinterOptions = class(TPersistent)
    private
      fOwner          : TComponent;
      fCopies         : Integer;
      fDestination    : TSZReportDestination;
      fEscapes        : TSZRPrinterEscapes;
      fFileName       : String;
      fPaperType      : TSZRPaperType;
      fFirstPageHeader: Boolean;
      fLastPageFooter : Boolean;
      fOEMConvert     : Boolean;
      fFormatEscapes  : Boolean;
      fPageFrom,
      fPageTo         : Integer;
      fCorrectFrames  : Boolean;
      procedure SetCopies(Value : Integer);
      procedure SetDestination(Value: TSZReportDestination);
      function  GetPageWidth  : Integer;
      function  GetPageLength : Integer;
      procedure SetPageLength(Value : Integer);
      procedure SetPageWidth(Value : Integer);
    public
      constructor Create(AOwner: TComponent);
      destructor  Destroy; override;
      property PageFrom       : Integer read fPageFrom write fPageFrom;
      property PageTo         : Integer read fPageTo   write fPageTo;
    published
      property Copies         : Integer read fCopies write SetCopies;
      property CorrectFrames  : Boolean read fCorrectFrames write fCorrectFrames default False;
      property Destination    : TSZReportDestination read fDestination write SetDestination;
      property Escapes        : TSZRPrinterEscapes read fEscapes write fEscapes;
      property FileName       : String read fFileName write fFileName;
      property FirstPageHeader: Boolean read fFirstPageHeader write fFirstPageHeader default True;
      property LastPageFooter : Boolean read fLastPageFooter  write fLastPageFooter  default True;
      property FormatEscapes  : Boolean read fFormatEscapes write fFormatEscapes default True;
      property OEMConvert     : Boolean read fOEMConvert write fOEMConvert default True;
      property PageLength     : Integer read GetPageLength write SetPageLength;
      property PageWidth      : Integer read GetPageWidth write SetPageWidth;
      property PaperType      : TSZRPaperType read fPaperType write fPaperType;
  end;

  { TSZRPrinter }

  TSZRPrinter = class;
  EZRError   = class(Exception);

  TSZRPrinterStatus     = (mpReady, mpBusy, mpFinished);
  TSZRFormatStringEvent = procedure(Sender: TSZRPrinter; var Text: String) of object;

  TSZRPrinter = class(TPersistent)
    private
      fLock           : TRTLCriticalSection;
      fStream         : TSZRStream;
      fPageIndex      : TSZRPageIndex;
      fPage           : TSZRPage;
      fPageNumber     : Integer;
      fAvailablePages : Integer;
      fCancelled      : Boolean;
      fMessageReceiver: TWinControl;
      fOwner          : TComponent;
      fProgress       : Integer;
      fStatus         : TSZRPrinterStatus;
      fShowingPreview : Boolean;
      fAfterPrint     : TNotifyEvent;
      fAfterPreview   : TNotifyEvent;
      fOnFormatString : TSZRFormatStringEvent;
      function  GetOptions: TSZRPrinterOptions;
      function  GetPageCount: Integer;
      procedure SetPageNumber(Value : Integer);
      procedure SetAvailablePages(Value : Integer);
      procedure SetShowingPreview(Value: Boolean);
      procedure SetProgress(Value : Integer);
//      function  GetPrinter: TPrinter;
//      procedure SetPrinter(Value: TPrinter);
      function  EndOfPage: String;
//      procedure IndexPages;
      procedure LockList;
      procedure UnlockList;
      procedure AddPage(Page: TSZRPage);
      procedure SeekToPage(PageNumber : Integer);
      procedure ReadPage(Page: TSZRPage);
      procedure FormatString(var Text: String);
    protected
//      property Printer: TPrinter read GetPrinter write SetPrinter;
    public
      constructor Create(AOwner: TComponent);
      destructor  Destroy; override;
      procedure AbortDoc;
      procedure BeginDoc;
      procedure EndDoc;
      procedure Cancel;
      procedure Cleanup;
      procedure BeginPage;
      procedure EndPage;
      procedure Print;
      procedure Preview;
      function  Setup: Boolean;
      function  LoadPage(PageNumber : Integer) : TSZRPage;
      function  PageWidth : Integer;
      function  PageLength: Integer;
      function  StreamName: String;
//      procedure LoadFromFile(FileName : String);
      procedure SaveToFile(FileName : String);
      function  Title: String;
      property AvailablePages : Integer read fAvailablePages write SetAvailablePages;
      property Cancelled      : Boolean read fCancelled write fCancelled;
      property MessageReceiver: TWinControl read fMessageReceiver write fMessageReceiver;
      property  Options: TSZRPrinterOptions read GetOptions;
      property Page           : TSZRPage read fPage;
      property PageCount      : Integer read GetPageCount;
      property PageNumber     : Integer read fPageNumber write SetPageNumber;
      property Progress       : Integer read fProgress write SetProgress;
      property ShowingPreview : Boolean read fShowingPreview write SetShowingPreview;
      property Status         : TSZRPrinterStatus read fStatus;
      property AfterPreview   : TNotifyEvent read fAfterPreview write fAfterPreview;
      property AfterPrint     : TNotifyEvent read fAfterPrint   write fAfterPrint;
      property OnFormatString : TSZRFormatStringEvent read fOnFormatString write fOnFormatString;
  end;

  { TSZRPreview }

type
  TCM_ZRPRogressUpdate = record
    Msg       : Cardinal;
    Position  : Word;
    ZRPrinter : TSZRPrinter;
  end;

  TCM_ZRPageAvailable = record
    Msg       : Cardinal;
    PageCount : Word;
    ZRPrinter : TSZRPrinter;
  end;

  TSZRProgressUpdateEvent = procedure (Sender : TObject; Progress : Integer) of object;
  TSZRPageAvailableEvent  = procedure (Sender : TObject; PageNumber : Integer) of object;

  TSZRPreview = class(TCustomRichEdit)
    private
      fZRPrinter : TSZRPrinter;
      fPageNumber: Integer;
      fPage      : TSZRPage;
      TextOK     : Boolean;
      fOnPageAvailable  : TSZRPageAvailableEvent;
      fOnProgressUpdate : TSZRProgressUpdateEvent;
      procedure SetPageNumber(Value : Integer);
      procedure SeTSZRPrinter(Value : TSZRPrinter);
      procedure FormatPage;
      procedure UpdateText;
    protected
      procedure CMPageAvailable (var Message : TCM_ZRPageAvailable ); Message CM_ZRPAGEAVAILABLE;
      procedure CMProgressUpdate(var Message : TCM_ZRProgressUpdate); Message CM_ZRPROGRESSUPDATE;
    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;
      property ZRPrinter : TSZRPrinter read fZRPrinter write SeTSZRPrinter;
    published
      property Align;
      property Color;
      property Ctl3D;
      property Enabled;
//      property Font;
      property HideScrollBars;
      property HideSelection;
      property PageNumber : Integer read fPageNumber write SetPageNumber;
      property ParentColor;
      property ParentCtl3D;
      property PopupMenu;
      property ReadOnly;
      property ScrollBars;
      property ShowHint;
      property TabOrder;
      property TabStop default True;
      property Visible;
      property OnEnter;
      property OnExit;
      property OnKeyDown;
      property OnKeyPress;
      property OnKeyUp;
      property OnMouseDown;
      property OnMouseMove;
      property OnMouseUp;
      property OnPageAvailable  : TSZRPageAvailableEvent  read  fOnPageAvailable
                                                         write fOnPageAvailable;
      property OnProgressUpdate : TSZRProgressUpdateEvent read  fOnProgressUpdate
                                                         write fOnProgressUpdate;
      property OnSelectionChange;
  end;

  function TempFileName : String;

implementation

uses
  ZRStrUtl, ZRConst, ZReport, ZRPrev, ZRSetup;

function TempFileName : String;
const
  aName : array[0..31] of Char = ('0','1','2','3','4','5','6','7','8','9',
    'a','b','c','d','e','f','g','h','i','j','l','m','n','o','p','q','r','s','t','u','v','z');
  aDir  : array[0..31] of Char = ('0','1','2','3','4','5','6','7','8','9',
    'a','b','c','d','e','f','g','h','i','j','l','m','n','o','p','q','r','s','t','u','v','z');
begin
  GetTempPath(30, aDir);
  GetTempFileName(aDir, PChar('ZRP'), 0, aName);
  Result := StrPas(aName);
end;

{ TSZRPage }

constructor TSZRPage.Create(AWidth: Integer);
begin
  inherited Create;
  fItems    := TStringList.Create;
  fWidth    := AWidth;
end;

destructor TSZRPage.Destroy;
begin
  fItems.Free;
  inherited Create;
end;

function TSZRPage.GetLength: Integer;
begin
  Result:= fItems.Count;
end;

procedure TSZRPage.SetWidth(Value: Integer);
var
  i: Integer;
begin
  if fWidth <> Value then
    begin
      fWidth:= Value;
      for i:= 0 to Length-1 do
        Items[i]:= EscapePadRight( Left(Items[i], Value), Value );
    end;
end;

procedure TSZRPage.SetLength(Value: Integer);
begin
  while fItems.Count > Value do fItems.Delete(fItems.Count-1);
  while fItems.Count < Value do fItems.Add(Space(Width));
end;

function TSZRPage.GetItems(Index: Integer): String;
begin
  Result:= fItems[Index];
end;

procedure TSZRPage.SetItems(Index: Integer; Value: String);
begin
  fItems[Index]:= Value;
end;

procedure TSZRPage.SaveToStream(Stream: TSZStringStream);
begin
  fItems.SaveToStream(Stream);
end;

procedure TSZRPage.LoadFromStream(Stream: TSZStringStream; MaxLength: Integer);
var
  S: String;
  P: Integer;
begin
  fItems.Clear;
  while (Length < MaxLength) and
        Stream.ReadString(S) and (S <> #12) do
    fItems.Add(S);
  P:= Stream.Position;
  if Stream.ReadString(S) and (S <> #12) then Stream.Position:= P;
end;

{ TSZRPrinter }

constructor TSZRPrinter.Create(AOwner: TComponent);
begin
  inherited Create;
  fOwner         := AOwner;
  fStatus        := mpReady;
  InitializeCriticalSection(fLock);
  fPageIndex     := TSZRPageIndex.Create;
  fPageNumber    := 0;
  fAvailablePages:= 0;
end;

destructor TSZRPrinter.Destroy;
begin
  if Status <> mpReady then Cleanup;
  DeleteCriticalSection(fLock);
  fPageIndex.Free;
  if (fOwner <> nil) then
    if (fOwner is TSZCompositeReport) then
      (fOwner as TSZCompositeReport).ZRPrinter:= nil
    else
      (fOwner as TSZReport).ZRPrinter:= nil;
  inherited Destroy;
end;

procedure TSZRPrinter.Cleanup;
begin
  if Status = mpBusy then Cancel;
  if Assigned(fPage) then
    begin
      fPage.Free;
      fPage := nil;
    end;
  if Assigned(fStream) then
    begin
      fStream.Free;
      fStream := nil;
    end;
  fPageIndex.Clear;
  fStatus := mpReady;
end;

procedure TSZRPrinter.Cancel;
begin
  Cancelled := True;
end;

procedure TSZRPrinter.BeginDoc;
begin
  fAvailablePages := 0;
  fCancelled      := False;
  if Status <> mpReady then
    raise EZRError.CreateRes(SzrZRPrinterNotReady)
  else
    begin
      fPageIndex.Clear;
      PageNumber := 0;
      fStatus    := mpBusy;
      fStream    := TSZRStream.CreateInMemory(100000);
    end;
end;

procedure TSZRPrinter.EndDoc;
begin
  EndPage;
  Options.PageFrom:= 1;
  Options.PageTo  := PageCount;
  fStatus:= mpFinished;
  if Assigned(fAfterPrint) then
    try
      fAfterPrint(Self);
    finally
    end;
end;

procedure TSZRPrinter.AbortDoc;
begin
  if Assigned(fPage) then
    begin
      fPage.Free;
      fPage:= nil;
    end;
  fStatus:= mpFinished;
  if Assigned(fAfterPrint) then
    try
      fAfterPrint(Self);
    finally
    end;
end;

procedure TSZRPrinter.BeginPage;
begin
  if Status <> mpBusy then
    raise EZRError.CreateRes(SzrIllegalNewPage);
  EndPage;
  Inc(fPageNumber);
  fPage:= TSZRPage.Create(PageWidth);
  fPage.Length:= PageLength;
end;

procedure TSZRPrinter.EndPage;
begin
  if Assigned(fPage) then
    begin
//      with fPage do while (Length > 0) and (Items[Length] = '') do Length:= Length-1; !!!!!!!!!!!!!!
      AddPage(fPage);
      fPage.Free;  fPage:= nil;
      AvailablePages := AvailablePages + 1;
    end;
end;

procedure TSZRPrinter.Print;
begin
  if not (Status = mpFinished) then
    raise EZRError.CreateRes(SzrZRPrinterNotFinished);
  SaveToFile(StreamName);
end;

procedure TSZRPrinter.Preview;
begin
  TSZRPreviewForm.CreatePreview(Application, Self).Show;
end;

procedure TSZRPrinter.LockList;
begin
  EnterCriticalSection(fLock);
end;

procedure TSZRPrinter.UnlockList;
begin
  LeaveCriticalSection(fLock);
end;

{
function TSZRPrinter.GetPrinter: TPrinter;
begin
  Result:= Printers.Printer;
end;

procedure TSZRPrinter.SetPrinter(Value: TPrinter);
var
  Options   : TSZReportOptions;
begin
  if fOwner is TSZCompositeReport then
    Options:= (fOwner as TSZCompositeReport).Options
  else
    Options:= (fOwner as TSZReport).Options;
  with Options do
    begin
      Copies     := Value.Copies;
      Destination:= zrdPrinter;
    end;
end;
}

function ValidFileName(const FileName: string): Boolean;
  function HasAny(const Str, Substr: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 1 to Length(Substr) do begin
      if Pos(Substr[I], Str) > 0 then begin
        Result := True;
        Break;
      end;
    end;
  end;
begin
  Result := (FileName <> '') and (not HasAny(FileName, ';,=+<>"[]|'));
  if Result then Result := Pos('\', ExtractFileName(FileName)) = 0;
end;

function TSZRPrinter.StreamName: String;
{
var
  DeviceMode: THandle;
  Device,
  Driver,
  Port  : array[0..127] of Char;
}
begin
  with Options do
  case Destination of
    zrdFile:
      begin
        Result:= FileName;
        if not ValidFileName(Result) then Result:= TempFileName;
      end;
    zrdLPT1..zrdLPT3:
      Result:= 'LPT' + Char(Byte('0') + Ord(Destination));   // LPT1..LPT3
    {
    // These doesn`t work for network printers under
    // some types of network clients   
    zrdPrinter:
      begin
        Printer.GetPrinter(Device, Driver, Port, DeviceMode);
        if DeviceMode = 0 then
          Printer.GetPrinter(Device, Driver, Port, DeviceMode);
        Result:= StrPas(Port);
      end;
    }
  end;
end;

function TSZRPrinter.GetOptions: TSZRPrinterOptions;
begin
  if fOwner is TSZCompositeReport then
    Result:= (fOwner as TSZCompositeReport).Options
  else
    Result:= (fOwner as TSZReport).Options;
end;

function TSZRPrinter.PageWidth : Integer;
begin
  Result:= Options.PageWidth;
end;
function TSZRPrinter.PageLength: Integer;
begin
  Result:= Options.PageLength;
end;

function TSZRPrinter.Title: String;
begin
  if fOwner is TSZCompositeReport then
    Result:= (fOwner as TSZCompositeReport).Title
  else
    Result:= (fOwner as TSZReport).Title;
end;

function TSZRPrinter.EndOfPage: String;
const
  Pattern = '- ';
begin
  case Options.PaperType of
    zptSheet: Result:= #12;
    zptFolio: Result:= ':< ' + Replicate(Pattern, PageWidth div Length(Pattern) - 3);
  end;
end;

function TSZRPrinter.GetPageCount: Integer;
begin
  Result:= fPageIndex.Count;
end;

procedure TSZRPrinter.SetAvailablePages(Value : integer);
begin
  fAvailablePages := Value;
  if MessageReceiver <> nil then
    PostMessage(MessageReceiver.Handle, CM_ZRPAGEAVAILABLE, Value, 0);
end;

procedure TSZRPrinter.SetProgress(Value : Integer);
begin
  fProgress := Value;
  if MessageReceiver <> nil then
    PostMessage(MessageReceiver.Handle, CM_ZRPROGRESSUPDATE, Value, 0)
end;

procedure TSZRPrinter.SetPageNumber(Value : Integer);
begin
  if (PageNumber > 0) and (PageNumber <= PageCount) then
    begin
      fPage := LoadPage(Value);
      fPageNumber := Value;
    end;
end;

{procedure TSZRPrinter.LoadFromFile(FileName : String);
begin
  if Assigned(fStream) then fStream.Free;
  fStream := TSZRStream.CreateFromFile(FileName);
//  fStream.OEMConvert:= True;
  IndexPages;
end;

procedure TSZRPrinter.IndexPages;
var
  Page  : TSZRPage;
begin
  fPageIndex.Clear;
  Page:= TSZRPage.Create(PageWidth);
  while fStream.Position < fStream.Size do
    begin
      fPageIndex.Count:= fPageIndex.Count + 1;
      fPageIndex[fPageIndex.Count-1]:= fStream.Position;
      ReadPage(Page);
    end;
  Page.Free;
end;}

type
  TSZRPrinterStream = class(TSZStringStream)
    private
      fOwner        : TSZRPrinter;
      fFileName     : String;
      FileStream    : TFileStream;
    public
      constructor Create(aOwner: TSZRPrinter; FileName : String);
      destructor  Destroy; override;
      function  Write(const Buffer; Count: Longint): Longint; override;
      procedure WriteString(Value: String); override;
  end;

procedure TSZRPrinter.FormatString(var Text: String);
begin
  if Assigned(OnFormatString) then OnFormatString(Self, Text) else
  if Options.FormatEscapes then Text:= Options.Escapes.PrinterFormat(Text);
end;

function TSZRPrinter.Setup: Boolean;
begin
  with TSZRPrinterSetup.Create(Application) do
    try
      ZRPrinter:= Self;
      Result:= ShowModal in [mrYes, mrOK];
    finally
      Free;
    end;
end;

procedure TSZRPrinter.SaveToFile(FileName : String);
var
  StartPage,
  EndPage,
  StartPos,
  EndPos  : Integer;
  AStream : TSZRPrinterStream;
  i       : Integer;
begin
  StartPage:= Options.PageFrom;
  EndPage  := Options.PageTo;
  if (StartPage > EndPage) or
     (StartPage < 0) or (EndPage < 0) or
     (StartPage > PageCount) or (EndPage > PageCount) then
    raise EZRError.CreateRes(SzrIllegalPageRange);
  AStream := TSZRPrinterStream.Create(Self, FileName);
  if (StartPage > 0) and (StartPage <= PageCount) then
    StartPos:= fPageIndex[StartPage-1]
  else
    StartPos:= 0;
  if (EndPage > 0) and (EndPage < PageCount) then
    EndPos:= fPageIndex[EndPage]
  else
    EndPos:= fStream.Size;
  try
    for i:= 1 to Options.Copies do
      fStream.SaveToStream(AStream, StartPos, EndPos);
  except
    ShowMessage('Falha de conexão com a Impressora!');
  end;
  AStream.Free;
end;

procedure TSZRPrinter.ReadPage(Page: TSZRPage);
var
  Pos: Integer;
  S  : String;
begin
  Page.LoadFromStream(fStream, PageLength);
  Pos:= fStream.Position;
  if not (fStream.ReadString(S) and (S = EndOfPage)) then fStream.Position:= Pos;
end;

procedure TSZRPrinter.SeekToPage(PageNumber : Integer);
begin
  fStream.Position:= fPageIndex[PageNumber-1];
end;

function TSZRPrinter.LoadPage(PageNumber : Integer) : TSZRPage;
var
  Pos: Integer;
begin
  if (Status in [mpBusy, mpFinished]) and
     (PageNumber > 0) and (PageNumber <= PageCount) then
    try
      LockList;
      Pos:= fStream.Position;
      SeekToPage(PageNumber);
      Result := TSZRPage.Create(PageWidth);
      ReadPage(Result);
      fStream.Position:= Pos;
    finally
      UnlockList;
    end
  else
    Result := nil;
end;


procedure TSZRPrinter.AddPage(Page: TSZRPage);

  procedure CorrectFrames;
  var
    x, y                   : Integer;
    Previous, Current, Next: String;
  begin
    if not Assigned(fPage) or (fPage.Length < 2) then Exit;
    Next:= fPage[0];
    for y:= 0 to fPage.Length-1 do
      begin
        Current:= Next;
        if y = fPage.Length-1 then Next:= '' else Next:= fPage[y+1];
        if y > 0 then
          for x:= 1 to EscapeLength(Current) do
            if (EscapeStyles(Current , x) = [esFrame]) and (EscapeCopy(Current , x, 1) = EscapeFormat(FrameChar[fsHorizontal], [esFrame])) and (
               (EscapeStyles(Previous, x) = [esFrame]) and (EscapeCopy(Previous, x, 1) = EscapeFormat(FrameChar[fsVertical  ], [esFrame])) or
               (EscapeStyles(Next    , x) = [esFrame]) and (EscapeCopy(Next    , x, 1) = EscapeFormat(FrameChar[fsVertical  ], [esFrame])) ) then
                  Current:= EscapeStuff(FrameChar[fsCross], Current, x);
        fPage[y]:= Current;
        Previous:= Current;
      end;
  end;

begin
  try
    LockList;
    if PageCount = 0 then fStream.Size := 0;
    fStream.Position       := fStream.Size;
    fPageIndex.Count       := PageCount + 1;
    fPageIndex[PageCount-1]:= fStream.Position;
    if Options.CorrectFrames then CorrectFrames;
    Page.SaveToStream(fStream);
    fStream.WriteString(EndOfPage);
  finally
    UnlockList;
  end;
end;

procedure TSZRPrinter.SetShowingPreview(Value: Boolean);
begin
  if ShowingPreview and not Value then
  try
    if Status = mpBusy then Cancel;
    if Assigned(fAfterPreview) then
      fAfterPreview(Self);
  finally
    fShowingPreview := Value;
  end else
    fShowingPreview := Value;
end;

{ TSZRPageIndex }

destructor TSZRPageIndex.Destroy;
begin
  Clear;
  inherited Destroy;
end;

procedure TSZRPageIndex.Clear;
begin
  SetCount(0);
end;

procedure TSZRPageIndex.SetCount(ACount: Integer);
begin
  if ACount <> fCount then
    begin
      ReallocMem(fBuffer, ACount*SizeOf(Integer));
      if ACount > fCount then
        FillChar(fBuffer^[fCount], (ACount - fCount) * SizeOf(Integer), 0);
      fCount:= ACount;
    end;
end;

procedure TSZRPageIndex.SeTZero;
begin
  if fCount > 0 then FillChar(fBuffer^, fCount*SizeOf(Integer), 0);
end;

function TSZRPageIndex.GetItem(Index: Integer): Integer;
begin
  Result:= fBuffer^[Index];
end;

procedure TSZRPageIndex.SetItem(Index: Integer; Value: Integer);
begin
  fBuffer^[Index]:= Value;
end;

{ TSZStringStream }

function TSZStringStream.ReadChar(var Value: Char): Boolean;
begin
  Result:= Read(Value, SizeOf(Value)) = SizeOf(Value);
end;

procedure TSZStringStream.WriteChar(Value: Char);
begin
  Write(Value, SizeOf(Value));
end;

procedure TSZStringStream.WriteString(Value: String);
begin
  Value:= TrimRight(Value);
  Write(PChar(Value + #13#10)^, Length(Value)+2);
end;

function TSZStringStream.ReadString(var Value: String): Boolean;
const
  StringDelimiters: set of Char = [#12, #13, #10];
var
  C: Char;
begin
  C:= #0;
  SetString(Value, nil, 0);
  Result:= Position < Size;
  if Result then
    while not (C in StringDelimiters) and ReadChar(C) do
      begin
        case C of
          #13: if ReadChar(C) and (C <> #10) then Seek(-SizeOf(C), soFromCurrent);
          #12: if (Length(Value) > 0)        then Seek(-SizeOf(C), soFromCurrent);
          else Value:= Value + C;
        end;
      end;
end;

{ TSZRStream }

constructor TSZRStream.CreateInMemory(MemoryLimit : longint);
begin
  inherited Create;
  fInMemory    := True;
  MemoryStream := TMemoryStream.Create;
  fMemoryLimit := MemoryLimit;
  InitializeCriticalSection(fLock);
end;

constructor TSZRStream.CreateFromFile(FileName : String);
begin
  inherited Create;
  fInMemory    := False;
  FileStream   := TFileStream.Create(FileName, fmOpenRead);
  fMemoryLimit := 0;
  InitializeCriticalSection(fLock);
end;

destructor TSZRStream.Destroy;
begin
  LockStream;
  try
    if InMemory then
      MemoryStream.Free
    else
    begin
      FileStream.Free;
      DeleteFile(fFileName);
    end;
  finally
    UnlockStream;
    DeleteCriticalSection(fLock);
  end;
  inherited Destroy;
end;

procedure TSZRStream.LockStream;
begin
  EnterCriticalSection(fLock);
end;

procedure TSZRStream.UnlockStream;
begin
  LeaveCriticalSection(fLock);
end;

function TSZRStream.Write(const Buffer; Count: Longint): Longint;
var
  B: PChar;
begin
  LockStream;
  B:= @Buffer;
  if InMemory then
    begin
      Result := MemoryStream.Write(B^, Count);
      if MemoryStream.Size > fMemoryLimit then
        begin
          fFileName  := TempFileName;
          FileStream := TFileStream.Create(fFileName, fmCreate or fmOpenReadWrite);
          MemoryStream.SaveToStream(FileStream);
          MemoryStream.Free;
          fInMemory := False;
        end;
    end
  else
    Result := FileStream.Write(B^, Count);
  UnlockStream;
end;

function TSZRStream.Read(var Buffer; Count: Longint): Longint;
begin
  LockStream;
  if InMemory then
    Result := MemoryStream.Read(Buffer,Count)
  else
    Result := FileStream.Read(Buffer,Count);
  UnlockStream;
end;

function TSZRStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  LockStream;
  if InMemory then
    Result := MemoryStream.Seek(Offset,Origin)
  else
    Result := FileStream.Seek(Offset,Origin);
  UnlockStream;
end;

procedure TSZRStream.SaveToStream(AStream : TSZStringStream; StartPos, EndPos: Integer);
var
  S: String;
begin
  LockStream;
  Position  := StartPos;
  while ReadString(S) and (Position <= EndPos) do AStream.WriteString(S);
  UnlockStream;
end;

{ TSZRPrinterStream }

constructor TSZRPrinterStream.Create(aOwner: TSZRPrinter; FileName : String);
begin
  inherited Create;
  fOwner        := aOwner;
  fFileName     := FileName;
  FileStream    := TFileStream.Create(FileName, fmCreate {or fmOpenReadWrite});
end;

destructor TSZRPrinterStream.Destroy;
begin
  FileStream.Free;
  inherited Destroy;
end;

function TSZRPrinterStream.Write(const Buffer; Count: Longint): Longint;
var
  B: PChar;
begin
  B:= @Buffer;
  if fOwner.Options.OEMConvert then
    begin
      GetMem(B, Count);
      CharToOEMBuff(@Buffer, B, Count);
    end;
  try
    Result := FileStream.Write(B^, Count);
  finally
  end;
  if fOwner.Options.OEMConvert then FreeMem(B);
end;

procedure TSZRPrinterStream.WriteString(Value: String);
begin
  fOwner.FormatString(Value);
  try
    inherited WriteString(Value);
  finally
  end;

end;

{ TSZRPrinterOptions }

constructor TSZRPrinterOptions.Create(AOwner: TComponent);
begin
  inherited Create;
  fOwner      := AOwner;
  fEscapes    := TSZRPrinterEscapes.Create;
  fCopies     := 1;
  Destination := zrdLPT1;  //zrdPrinter;
  fFirstPageHeader:= True;
  fLastPageFooter := True;
  fOEMConvert   := True;
  fFormatEscapes:= True;
end;

destructor TSZRPrinterOptions.Destroy;
begin
  fEscapes.Free;
  inherited Destroy;
end;

procedure TSZRPrinterOptions.SetDestination(Value: TSZReportDestination);
begin
  if fDestination <> Value then
    begin
      fDestination:= Value;
      SetCopies(Copies);
    end;
end;

procedure TSZRPrinterOptions.SetCopies(Value : Integer);
begin
  fCopies:= Value;
{  if Destination = zrdPrinter then
    Printer.Copies:= Value;  }
end;

function TSZRPrinterOptions.GetPageWidth : integer;
begin
  if (fOwner is TSZCompositeReport) then
    Result:= (fOwner as TSZCompositeReport).PageWidth
  else
    Result:= (fOwner as TSZReport).Width;
end;

procedure TSZRPrinterOptions.SetPageWidth(Value : integer);
begin
  if (fOwner is TSZCompositeReport) then
    (fOwner as TSZCompositeReport).PageWidth:= Value
  else
    (fOwner as TSZReport).Width:= Value;
end;

function TSZRPrinterOptions.GetPageLength : integer;
begin
  if (fOwner is TSZCompositeReport) then
    Result:= (fOwner as TSZCompositeReport).PageLength
  else
    Result:= (fOwner as TSZReport).Height;
end;

procedure TSZRPrinterOptions.SetPageLength(Value : integer);
begin
  if (fOwner is TSZCompositeReport) then
    (fOwner as TSZCompositeReport).PageLength:= Value
  else
    (fOwner as TSZReport).Height:= Value;
end;

{TSZRPrinterEscapes}

constructor TSZRPrinterEscapes.Create;
begin
  inherited;
  // Epson codes by default
  fEscapes[esBold       , 0]:= EPSON_BOLD_ON;
  fEscapes[esBold       , 1]:= EPSON_BOLD_OFF;
  fEscapes[esItalic     , 0]:= EPSON_ITALIC_ON;
  fEscapes[esItalic     , 1]:= EPSON_ITALIC_OFF;
  fEscapes[esUnderline  , 0]:= EPSON_UNDERLINE_ON;
  fEscapes[esUnderline  , 1]:= EPSON_UNDERLINE_OFF;
  fEscapes[esSubScript  , 0]:= EPSON_SUBSCRIPT_ON;
  fEscapes[esSubScript  , 1]:= EPSON_SUBSCRIPT_OFF;
  fEscapes[esSuperScript, 0]:= EPSON_SUPERSCRIPT_ON;
  fEscapes[esSuperScript, 1]:= EPSON_SUPERSCRIPT_OFF;
end;

function TSZRPrinterEscapes.GetEscape(Index: Integer): String;
begin
  Result:= fEscapes[TEscapeStyle(Index div 2), Index mod 2];
end;

procedure TSZRPrinterEscapes.SetEscape(Index: Integer; Value: String);
begin
  fEscapes[TEscapeStyle(Index div 2), Index mod 2]:= Value;
end;

function TSZRPrinterEscapes.PrinterFormat(const Escape: String): String;

  procedure Append(var S: String; const Addittion: String);
  begin
    Insert(Addittion, S, Length(S)+1);
  end;

var
  Old, New: TEscapeStyles;

  procedure ProcessStyles;
  var
    E: TEscapeStyle;
  begin
   for E:= Low(TEscapeStyle) to High(TEscapeStyle) do
     if (E in New) and not (E in Old) then Append(Result, GetEscape(Ord(E)*2));
   for E:= High(TEscapeStyle) downto Low(TEscapeStyle) do
     if not (E in New) and (E in Old) then Append(Result, GetEscape(Ord(E)*2 + 1));
  end;

var
  i: Integer;
  T: String;
begin
  Result:= '';
  Old:= [];
  i:= 1;
  while i<=EscapeLength(Escape) do
    begin
      T:= EscapeToken(Escape, i, New);
      ProcessStyles;
      Append(Result, T);
      Old:= New;
    end;
  New:= [];
  ProcessStyles;
end;

{ TSZRPreview }

constructor TSZRPreview.Create(AOwner: TComponent);
const
  FontSize  = 8;
  FontPitch = fpFixed;
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption];
  Align        := alClient;
  fPageNumber  := 1;
  fOnPageAvailable  := nil;
  fOnProgressUpdate := nil;
  Font.Name    := DefaultFontName;
  Font.Pitch   := FontPitch;
  with DefAttributes do
    begin
//      Name      := DefaultFontName;
//      Pitch     := FontPitch;
      Protected := True;
      Style     := [];
    end;
  ReadOnly:= True;
  WordWrap:= False;
end;

destructor TSZRPreview.Destroy;
begin
  ZRPrinter:= nil;
  if TextOK then fPage.Free;
  inherited Destroy;
end;

procedure TSZRPreview.SeTSZRPrinter(Value : TSZRPrinter);
begin
  if Assigned(fZRPrinter) and (fZRPrinter.MessageReceiver = Self) then
    begin
      fZRPrinter.ShowingPreview  := False;
      fZRPrinter.MessageReceiver := nil;
    end;
  fZRPrinter:= Value;
  if fZRPrinter <> nil then
    begin
      fZRPrinter.MessageReceiver := Self;
      fZRPrinter.ShowingPreview  := True;
    end;
  PageNumber := 1;
end;

procedure TSZRPreview.SetPageNumber(Value : Integer);
begin
  if ((Value <> fPageNumber) or (not TextOK)) and (Value > 0)
    and Assigned(fZRPrinter) and (Value <= ZRPrinter.PageCount) then
  begin
    fPageNumber            := Value;
    UpdateText;
  end;
end;

procedure TSZRPreview.CMPageAvailable(var Message : TCM_ZRPageAvailable);
begin
  if (Message.PageCount = PageNumber) then
    UpdateText;
  if Assigned(fOnPageAvailable) then
  try
    fOnPageAvailable(Self, Message.PageCount);
  finally
  end;
end;

procedure TSZRPreview.CMProgressUpdate(var Message : TCM_ZRProgressUpdate);
begin
  if Assigned(fOnProgressUpdate) then
  try
    fOnProgressUpdate(Self, Message.Position);
  finally
  end;
end;

procedure TSZRPreview.UpdateText;
begin
  if Assigned(fPage) then fPage.Free;
  fPage := nil;
  if Assigned(fZRPrinter) then
    fPage:= ZRPrinter.LoadPage(fPageNumber);
  TextOK:= fPage <> nil;
  FormatPage;
end;

procedure TSZRPreview.FormatPage;

  procedure FormatLine(S: String; Y: Integer);
  var
    p,i: Integer;
    T  : STring;
    F  : TEscapeStyles;
  begin
    i:= 1;
    while i <= EscapeLength(S) do
      begin
        p:= i;
        T:= EscapeToken(S, i, F);
        SelStart := Y * (fPage.Width+2) + p-1;
        SelLength:= Y * (fPage.Width+2) + i-p;
        with SelAttributes do
          begin
            Style:= [];
            if esBold      in F then Style:= Style + [fsBold];
            if esItalic    in F then Style:= Style + [fsItalic];
            if esUnderline in F then Style:= Style + [fsUnderline];
          end;
      end;
  end;

var
  i: Integer;
  C: TCursor;
begin
  Lines.BeginUpdate;
  Lines.Clear;
  C:= Screen.Cursor;
  Screen.Cursor:= crAppStart;
  if Assigned(fPage) then
    begin
      for i:= 0 to fPage.Length-1 do Lines.Add(EscapeDeFormat(fPage[i]));
      for i:= 0 to fPage.Length-1 do FormatLine(fPage[i], i);
      SelStart := 0;
      SelLength:= 0;
    end;
  Screen.Cursor:= C;
  Lines.EndUpdate;
end;

end.

