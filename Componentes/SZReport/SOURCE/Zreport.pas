unit ZReport;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     ExtCtrls, StdCtrls, DB, DBTables, Printers, ZRPrntr, ZREval,
     ZREscape, DesignIntf, Toolsapi, dsgnintf;

type
  TSZRBandType = (rbTitle,
                 rbPageHeader,
                 rbDetail,
                 rbPageFooter,
                 rbSummary,
                 rbGroupHeader,
                 rbGroupFooter,
                 rbSubDetail,
                 rbColumnHeader,
                 rbColumnFooter,
                 rbChild);
  TSZRBandTypes = set of TSZRBandType;

const
  { ÷вета объектов в design-time }
  clReportFrame    : TColor = clWindowText;
  clReportControl  : TColor = clGray+$303030;
  clReportBand     : TColor = TColor($C0DCC0+$101010);
  clReport         : TColor = clWindow;
  clReportGrid     : TColor = clBtnShadow;
  DefaultFontName  : String = 'Courier New';

type
  { Forward declarations }
  TSZReportControl   = class;
  TSZReport          = class;
  TSZRCustomBand     = class;
//  TSZRChildBand      = class;
  TSZRSubDetailBand  = class;

  { TSZRFrame }
  TSZRFrame = class(TPersistent)
    private
      fOwner : TSZReportControl;
      fValues: array[0..3] of Integer;
      function  GetValue(Index: Integer): Integer;
      procedure SetValue(Index: Integer; Value: Integer);
    public
      constructor Create(AOwner: TSZReportControl);
      procedure Paint;
      procedure Print(X, Y: Integer);
    published
      property Left   : Integer index 0 read GetValue write SetValue default 0;
      property Top    : Integer index 1 read GetValue write SetValue default 0;
      property Right  : Integer index 2 read GetValue write SetValue default 0;
      property Bottom : Integer index 3 read GetValue write SetValue default 0;
      property Width  : Integer index 4 read GetValue;
      property Height : Integer index 5 read GetValue;
  end;

  { TSZReportControl }
  TSZRBeforePrintEvent = procedure (Sender : TObject; var DoPrint : Boolean) of object;
  TSZRAfterPrintEvent  = procedure (Sender : TObject; Printed : Boolean) of object;
  TSZROnNeedDataEvent  = procedure (Sender : TObject; var MoreData : Boolean) of object;

  TSZReportControl = class(TCustomControl)
    private
      { Private declarations }
      fAlignment  : TAlignment;
      fAlignToBand: Boolean;
      fReport     : TSZReport;
      fIsPrinting : Boolean;
      fLength     : Integer;
      fBeforePrint: TSZRBeforePrintEvent;
      fAfterPrint : TSZRAfterPrintEvent;
      fDoPrint    : Boolean;
      fFontStyle  : TEscapeStyles;
      fTextResize : Boolean;
      fFrame      : TSZRFrame;
      procedure SetAlignment(Value: TAlignment);
      procedure SetAlignToBand(Value : Boolean);
      function  GetLeft: Integer;
      procedure SetLeft(Value: Integer);
      function  GetTop: Integer;
      procedure SetTop(Value: Integer);
      function  GetWidth: Integer;
      procedure SetWidth(Value: Integer);
      function  GetHeight: Integer;
      procedure SetHeight(Value: Integer);
      function  GetCharSize: TPoint; 
      procedure SetFontStyle(Value: TEscapeStyles);
      procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
      function GetFramed(Index: Integer): Integer;
    protected
      { Protected declarations }
      procedure Loaded; override;
      procedure Paint; override;
      procedure SetParent(AParent: TWinControl); override;
      procedure AdjustBounds; virtual;
      procedure SetCharBounds(ALeft, ATop, AWidth, AHeight: Integer); virtual;
      procedure DrawString(X, Y: Integer; S: String);
      procedure Prepare; virtual;
      procedure Unprepare; virtual;
      procedure DoBeforePrint(var DoPrint: Boolean); virtual;
      procedure DoAfterPrint(Printed: Boolean) ; virtual;
      function  PrintString(X, Y: Integer; S: String; Styles: TEscapeStyles): Boolean;
      procedure PrintTo(ParentX, ParentY: Integer); virtual;
      procedure MasterDataAdvance; virtual;
      property Alignment  : TAlignment read fAlignment write SetAlignment default taLeftJustify;
      property AlignToBand: Boolean read fAlignToBand write SetAlignToBand;
      property CharSize   : TPoint read GetCharSize;
      property FontStyle  : TEscapeStyles read fFontStyle write SetFontStyle;
      property IsPrinting : Boolean read fIsPrinting write fIsPrinting;
      property Length     : Integer read fLength write fLength;
      property BeforePrint: TSZRBeforePrintEvent read fBeforePrint write fBeforePrint;
      property AfterPrint : TSZRAfterPrintEvent  read fAfterPrint  write fAfterPrint;
    public
      { Public declarations }
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;
      property Canvas;
      property Enabled;
      procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;      
      property Report: TSZReport read fReport;
      property Frame : TSZRFrame read fFrame write fFrame;
      property FramedLeft  : Integer index 0 read GetFramed;
      property FramedTop   : Integer index 1 read GetFramed;
      property FramedWidth : Integer index 2 read GetFramed;
      property FramedHeight: Integer index 3 read GetFramed;
    published
      { Published declarations }
      property Left  : Integer read GetLeft   write SetLeft;
      property Top   : Integer read GetTop    write SetTop;
      property Width : Integer read GetWidth  write SetWidth;
      property Height: Integer read GetHeight write SetHeight;
  end;
  TSZReportControlClass = class of TSZReportControl;

  { TSZRCustomBand }
  TSZRCustomBand = class(TSZReportControl)
    private
      fBandType      : TSZRBandType;
//      fAlignToBottom : Boolean;
      fParentResizing: Boolean;
      fForceNewColumn: Boolean;
      fForceNewPage  : Boolean;
      fParentBand    : TSZRCustomBand;
      procedure SetBandType(Value : TSZRBandType);
      function  GetChild    : TSZRCustomBand;
      function  GetHasChild : Boolean;
      procedure SetHasChild(Value : Boolean);
//      procedure SetParentBand(Value : TSZRCustomBand);
      procedure PaintGrid;
    protected
      procedure CreateParams(var Params: TCreateParams); override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure SetParent(AParent: TWinControl); override;
      procedure Paint; override;
      procedure SetCharBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
      procedure Prepare; override;
      procedure Unprepare; override;
      procedure DoBeforePrint(var DoPrint: Boolean); override;
      procedure DoAfterPrint(Printed: Boolean); override;
      procedure Print; virtual;
      procedure RegisterBands; virtual;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
//      property AlignToBottom : Boolean read fAlignToBottom write fAlignToBottom;
      property BandType  : TSZRBandType read fBandType write SetBandType;
      property ChildBand : TSZRCustomBand read GetChild;
      property HasChild  : Boolean read GetHasChild write SetHasChild stored False;
      property ParentBand : TSZRCustomBand read fParentBand;
      property ForceNewColumn : Boolean read fForceNewColumn write fForceNewColumn;
      property ForceNewPage   : Boolean read fForceNewPage   write fForceNewPage;
      property Length;
    published
      property AfterPrint;
      property BeforePrint;
      property Enabled;
  end;

  { TSZRBand }
  TSZRBand = class(TSZRCustomBand)
    published
//      property AlignToBottom;
      property BandType;
      property Frame;
      property HasChild;
      property ForceNewColumn;
      property ForceNewPage;
  end;

  { TSZRController }
  TSZRControllerBand = class(TSZRCustomBand)
    private
      fMaster        : TSZRControllerBand;
      fDataSet       : TDataSet;
      fDetail        : TSZRCustomBand;
      fFooter        : TSZRCustomBand;
      fHeader        : TSZRCustomBand;
      fDetailNumber  : Integer;
      fPrintBefore   : Boolean;
      fPrintIfEmpty  : Boolean;
      GroupList      : TList;
      PrintAfterList : TList;
      PrintBeforeList: TList;
      NotifyList     : TList;
      fOnNeedData    : TSZROnNeedDataEvent;
      procedure SetMaster(Value : TSZRControllerBand);
      procedure SetDataSet(Value : TDataSet);
      procedure SetPrintBefore(Value : Boolean); virtual;
    protected
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure SetParent(AParent: TWinControl); override;
      procedure RegisterBands; override;
      procedure Print; override;
      procedure Prepare; override;
      procedure Unprepare; override;
      procedure MasterDataAdvance; override;
      procedure BuildTree;
    public
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
      procedure AddNotifyClient(Value : TSZReportControl);
      property DataSet     : TDataSet read fDataSet write SetDataSet;
      property DetailNumber: Integer read fDetailNumber;
      property Detail      : TSZRCustomBand read fDetail write fDetail;
      property Footer      : TSZRCustomband read fFooter write fFooter;
      property Header      : TSZRCustomBand read fHeader write fHeader;
      property Master      : TSZRControllerBand read fMaster write SetMaster;
      property PrintBefore : Boolean read fPrintBefore write SetPrintBefore;
      property PrintIfEmpty: Boolean read fPrintIfEmpty write fPrintIfEmpty;
    published
      property OnNeedData: TSZROnNeedDataEvent read fOnNeedData write fOnNeedData;
  end;

  { TSZRGroup }
  TSZRGroup = class(TSZRCustomBand)
    private
      fMaster     : TSZRControllerBand;
      fFooterBand : TSZRCustomBand;
      fExpression : String;
      fEvaluator  : TSZREvaluator;
      fReprint    : Boolean;
      GroupValue  : TSZREvValue;
      HasResult   : Boolean;
      procedure SetExpression(Value : String);
      function  GetHasFooter: Boolean;
      procedure SetHasFooter(Value: Boolean);
      procedure SetFooterBand(Value : TSZRCustomBand);
      procedure SetMaster(Value: TSZRControllerBand);
    protected
      procedure Check;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure SetParent(AParent: TWinControl); override;
      procedure Prepare; override;
      procedure Unprepare; override;
      property Reprint: Boolean read fReprint write fReprint;
    public
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
    published
//      property AlignToBottom;
      property HasChild;
      property HasFooter : Boolean read GetHasFooter write SetHasFooter stored False;
      property Expression: String  read fExpression write SetExpression;
      property FooterBand: TSZRCustomBand read fFooterBand write SetFooterBand;
      property Master    : TSZRControllerBand read fMaster write SetMaster;
      property ForceNewColumn;
      property ForceNewPage;
      property Frame;
  end;

  { TSZRSubDetailGroupBands }
  TSZRSubDetailBands = class(TPersistent)
    private
      Owner : TSZRSubDetailBand;
    protected
      function  GetFooterBand : TSZRCustomBand;
      function  GetHeaderBand : TSZRCustomBand;
      function  GetHasFooter : Boolean;
      function  GetHasHeader : Boolean;
      procedure SetHasFooter(Value : Boolean);
      procedure SetHasHeader(Value : Boolean);
    public
      constructor Create(AOwner : TSZRSubDetailBand);
      property FooterBand : TSZRCustomBand read GetFooterBand;
      property HeaderBand : TSZRCustomBand read GetHeaderBand;
    published
      property HasFooter : Boolean read GetHasFooter write SetHasFooter stored False;
      property HasHeader : Boolean read GetHasHeader write SetHasHeader stored False;
  end;

  { TSZRSubDetail }

  TSZRSubDetailBand = class(TSZRControllerBand)
    private
      fBands : TSZRSubDetailBands;
      function  GetFooterBand : TSZRCustomBand;
      function  GetHeaderBand : TSZRCustomBand;
      procedure SetFooterBand(Value : TSZRCustomBand);
      procedure SetHeaderBand(Value : TSZRCustomBand);
    public
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
    published
//      property AlignToBottom;
      property Bands: TSZRSubDetailBands read fBands write fBands;
      property DataSet;
      property FooterBand: TSZRCustomBand read GetFooterBand write SetFooterBand;
      property HeaderBand: TSZRCustomBand read GetHeaderBand write SetHeaderBand;
      property HasChild;
      property Master;
      property ForceNewColumn;
      property ForceNewPage;
      property Frame;
      property OnNeedData;
      property PrintBefore;
      property PrintIfEmpty;
  end;

  { TSZReportBands }
  TSZReportBands = class(TPersistent)
    private
      fOwner : TSZReport;
      function  BandInList(BandType : TSZRBandType) : TSZRCustomBand;
      procedure SetBand(BandType : TSZRBandType; Value : Boolean);
      function  GetBand(Index : Integer) : TSZRCustomBand;
      function  GetHasBand(Index : Integer) : Boolean;
      procedure SetHasBand(Index : Integer; Value : Boolean);
    public
      constructor Create(AOwner : TSZReport);
      property TitleBand        : TSZRCustomBand index 1 read GetBand;
      property PageHeaderBand   : TSZRCustomBand index 2 read GetBand;
      property ColumnHeaderBand : TSZRCustomBand index 3 read GetBand;
      property DetailBand       : TSZRCustomBand index 4 read GetBand;
      property ColumnFooterBand : TSZRCustomBand index 5 read GetBand;
      property PageFooterBand   : TSZRCustomBand index 6 read GetBand;
      property SummaryBand      : TSZRCustomBand index 7 read GetBand;
    published
      property HasTitle        : Boolean index 1 read GetHasBand write SetHasBand stored False;
      property HasPageHeader   : Boolean index 2 read GetHasBand write SetHasBand stored False;
      property HasColumnHeader : Boolean index 3 read GetHasBand write SetHasBand stored False;
      property HasDetail       : Boolean index 4 read GetHasBand write SetHasBand stored False;
      property HasColumnFooter : Boolean index 5 read GetHasBand write SetHasBand stored False;
      property HasPageFooter   : Boolean index 6 read GetHasBand write SetHasBand stored False;
      property HasSummary      : Boolean index 7 read GetHasBand write SetHasBand stored False;
  end;

  { TSZRMargins }
  TSZRMargins = class(TPersistent)
    private
      fOwner  : TSZReport;
      fMargins: TRect;
      function  GetValue(Index: Integer): Integer;
      procedure SetValue(Index: Integer; Value: Integer);
    protected
      procedure Changed;
    public
      constructor Create(AOwner: TSZReport);
    published
      property Left  : Integer index 0 read GetValue write SetValue;
      property Top   : Integer index 1 read GetValue write SetValue;
      property Right : Integer index 2 read GetValue write SetValue;
      property Bottom: Integer index 3 read GetValue write SetValue;
  end;

  { TSZReport }
  TSZReport = class(TSZRControllerBand)
    private
      { Private declarations }
//      BGThread       : TSZRCreateReportThread;
      fAllDataSets   : TList;
      fReady         : Boolean;
      fBands         : TSZReportBands;
      fBandList      : TList;
      BandRegList    : TList;
      fMargins       : TSZRMargins;
      fColumns       : Integer;
      fColumnSpace   : Integer;
      fColumnTop     : Integer;
      fCurrentX      : Integer;
      fCurrentY      : Integer;
      fCurrentColumn : Integer;
      fLastPage      : Boolean;
      NewColumnForced: Boolean;
      NewPageForced  : Boolean;
      fOptions       : TSZRPrinterOptions;
      fPageCount     : Integer;
      fShowProgress  : Boolean;
      fTitle         : String;
      fZRPrinter     : TSZRPrinter;
      fAfterPreview  : TNotifyEvent;
      fOnEndPage     : TNotifyEvent;
      fOnStartPage   : TNotifyEvent;
      fOnFormatString: TSZRFormatStringEvent;
      procedure SetColumns(Value: Integer);
      procedure SetColumnSpace(Value: Integer);
      function  GetRecordCount: Integer;
      procedure AddBand   (aBand: TSZRCustomBand);
      procedure RemoveBand(aBand: TSZRCustomBand);
      procedure PrintBand(ABand : TSZRCustomBand);
    protected
      { Protected declarations }
      procedure Loaded; override;
      procedure Paint; override;
      procedure RegisterBand(aBand: TSZRCustomBand);
      procedure RegisterBands; override;
      function  RemainSpace   : integer;
      function  ColumnWidth   : Integer;
      function  PageFooterSize(Footers: TSZRBandTypes): Integer;
      procedure CreateReport(CompositeReport : boolean);
      procedure PreviewFinished(Sender : TObject);
      procedure PrintFinished(Sender : TObject);
    public
      { Public declarations }
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;
      function  CreateBand(BandType : TSZRBandType) : TSZRBand;
      procedure Print; override;
      procedure Preview;
      procedure RebuildBandList;
      procedure SetCharBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
      procedure SetBandSizes;
      procedure ForceNewColumn;
      procedure ForceNewPage;
      procedure EndPage;
      procedure NewPage;
      procedure EndColumn;
      procedure NewColumn;
      property AllDataSets  : TList   read fAllDataSets write fAllDataSets;
      property Ready        : Boolean read fReady;
      property BandList     : TList   read fBandList;
      property ColumnTop    : Integer read fColumnTop write fColumnTop;
      property CurrentColumn: Integer read fCurrentColumn;
      property CurrentX     : Integer read fCurrentX write fCurrentX;
      property CurrentY     : Integer read fCurrentY write fCurrentY;
      property PageNumber   : Integer read fPageCount;
      property RecordCount  : Integer read GetRecordCount;
      property ZRPrinter    : TSZRPrinter read fZRPrinter write fZRPrinter;
    published
      { Published declarations }
      property Bands         : TSZReportBands read fBands write fBands;
      property Columns       : Integer read fColumns     write SetColumns;
      property ColumnSpace   : Integer read fColumnSpace write SetColumnSpace;
      property DataSet;
      property Font;
      property Margins       : TSZRMargins read fMargins write fMargins;
      property Options       : TSZRPrinterOptions read fOptions write fOptions;
      property ShowProgress  : Boolean read fShowProgress write fShowProgress default True;
      property Title         : String  read fTitle write fTitle;
      property AfterPreview  : TNotifyEvent read fAfterPreview write fAfterPreview;
      property OnStartPage   : TNotifyEvent read fOnStartPage write fOnStartPage;
      property OnEndPage     : TNotifyEvent read fOnEndPage   write fOnEndPage;
      property OnFormatString: TSZRFormatStringEvent read fOnFormatString write fOnFormatString;
  end;

  { TSZCompositeReport - Component which combines several reports into one }
  TSZCompositeReport = class(TComponent)
    private
      fOptions        : TSZRPrinterOptions;
      fZRPrinter      : TSZRPrinter;
      fReports        : TList;
      fShowProgress   : Boolean;
      fTitle          : String;
      fPageWidth      : Integer;
      fPageLength     : Integer;
      fOnAddReports   : TNotifyEvent;
      fReport         : Integer;  
      fOnFinished     : TNotifyEvent;
      fOnFormatString : TSZRFormatStringEvent;
      procedure CreateComposite;
    public
      constructor Create(AOwner : TComponent); override;
      destructor Destroy; override;
      procedure Prepare;
      procedure Preview;
      procedure Print;
      property PageWidth : Integer read fPageWidth  write fPageWidth;
      property PageLength: Integer read fPageLength write fPageLength;
      property Report    : Integer read fReport;
      property Reports   : TList read fReports write fReports;
      property ZRPrinter : TSZRPrinter read fZRPrinter write fZRPrinter;
    published
      property Options     : TSZRPrinterOptions read fOptions write fOptions;
      property ShowProgress: Boolean read fShowProgress write fShowProgress default True;
      property Title       : String read fTitle write fTitle;
      property OnAddReports: TNotifyEvent read fOnAddReports write fOnAddReports;
      property OnFinished  : TNotifyEvent read fOnFinished   write fOnFinished;
      property OnFormatString: TSZRFormatStringEvent read fOnFormatString write fOnFormatString;
  end;

const
  DefaultReportWidth  = 20;
  DefaultReportHeight = 10;

implementation

uses ZRConst, ZRStrUtl, ZRPrgres;

function DataSetOK(DataSet : TDataSet) : Boolean;
begin
  Result := (DataSet <> nil) and DataSet.Active;
end;

function ZRBandTypeName(BandType : TSZRBandType) : string;
begin
  Result := LoadStr(SzrTitle + ord(BandType));
end;

function ZRBandComponentName(BandType : TSZRBandType) : String;
begin
  Result := LoadStr(SzrTitleBandName + ord(BandType));
end;

{ TSZRFrame }

constructor TSZRFrame.Create(AOwner: TSZReportControl);
begin
  inherited Create;
  FillChar(fValues, SizeOf(fValues), 0);
  fOwner:= aOwner;
end;

function TSZRFrame.GetValue(Index: Integer): Integer;
begin
  case Index of
    4  : Result:= Right  + Left;
    5  : Result:= Bottom + Top;
    else Result:= fValues[Index];
  end;
end;
procedure TSZRFrame.SetValue(Index: Integer; Value: Integer);
var
  DX, DY, i: Integer;
begin
  if fValues[Index] <> Value then
    begin
      if Index in [0,2] then DX:= Value - fValues[Index] else DX:= 0;
      if Index in [1,3] then DY:= Value - fValues[Index] else DY:= 0;
      fValues[Index]:= Value;
      if not (csLoading in fOwner.ComponentState) then
        begin
          fOwner.Width := fOwner.Width  + DX;
          fOwner.Height:= fOwner.Height + DY;
          if Index < 2 then
            for i:=0 to fOwner.ControlCount-1 do
              if (fOwner.Controls[i] is TSZReportControl) then
                with (fOwner.Controls[i] as TSZReportControl) do
                  begin
                    Left:= Left + DX;
                    Top := Top  + DY;
                  end;
        end;
    end;
end;

procedure TSZRFrame.Paint;
var
  R  : TRect;
  dlt,
  drb: TPoint;
begin
  with fOwner.Canvas do
    begin
      R:= fOwner.ClientRect;
      Pen.Style:= psSolid;
      Pen.COlor:= clReportFrame;
      dlt:= fOwner.CharSize;    drb:= dlt;
      if Left  >0 then dlt.x:= dlt.x div 2 else dlt.x:= 0;
      if Top   >0 then dlt.y:= dlt.y div 2 else dlt.y:= 0;
      if Right >0 then drb.x:= drb.x div 2 else drb.x:= 0;
      if Bottom>0 then drb.y:= drb.y div 2 else drb.y:= 0;
      if Top>0 then begin
        MoveTo(dlt.x               , dlt.y);
        LineTo(R.Right-R.Left-drb.x, dlt.y);
      end;
      if Left>0 then begin
        MoveTo(dlt.x, dlt.y               );
        LineTo(dlt.x, R.Bottom-R.Top-drb.y);
      end;
      if Bottom>0 then begin
        MoveTo(dlt.x               , R.Bottom-R.Top-drb.y);
        LineTo(R.Right-R.Left-drb.x, R.Bottom-R.Top-drb.y);
      end;
      if Right>0 then begin
        MoveTo(R.Right-R.Left-drb.x, dlt.y               );
        LineTo(R.Right-R.Left-drb.x, R.Bottom-R.Top-drb.y);
      end;
    end;
end;

procedure TSZRFrame.Print(X, Y: Integer);
const
  Styles: array[Boolean] of TEscapeStyles = ([], [esFrame]);
var
  S, HC: String;
  BY, i: Integer;
begin
  S:= Replicate(FrameChar[fsHorizontal], fOwner.Width-Width);
  if Left  > 0 then S:= FrameChar[fsCross] + Replicate(FrameChar[fsHorizontal], Left-1) + S;
  if Right > 0 then S:= S + Replicate(FrameChar[fsHorizontal], Right-1) + FrameChar[fsCross];
  if not (fOwner is TSZRCustomBand) then
    begin
      Inc(X, fOwner.Left);
      Inc(Y, fOwner.Top );
    end;
  if fOwner.Length > fOwner.Height then
    BY:= Y + fOwner.Length-1
  else
    BY:= Y + fOwner.Height-1;

  if (Top   >0) then fOwner.PrintString(X, Y , S, Styles[fOwner.Report.ZRPrinter.Options.CorrectFrames]);
  if (Bottom>0) then fOwner.PrintString(X, BY, S, Styles[fOwner.Report.ZRPrinter.Options.CorrectFrames]);

  for i:=1 to fOwner.Length do
    begin
      if (i=1) and (Top>0) or (Y+i-1=BY) and (Bottom>0) then
        HC:= FrameChar[fsCross]
      else
        HC:= FrameChar[fsVertical];
      if (Left >0) then fOwner.PrintString(X               , Y+i-1, HC, Styles[fOwner.Report.ZRPrinter.Options.CorrectFrames]);
      if (Right>0) then fOwner.PrintString(X+fOwner.Width-1, Y+i-1, HC, Styles[fOwner.Report.ZRPrinter.Options.CorrectFrames]);
    end;
end;

{ TSZReportControl }

constructor TSZReportControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Color     := clReportControl;
  Width     := 8;
  Height    := 1;
  ParentFont:= True;
  fFrame    := TSZRFrame.Create(Self);
end;

destructor TSZReportControl.Destroy;
begin
  fFrame.Free;
  inherited Destroy;
end;

function TSZReportControl.GetCharSize: TPoint;
var
  TM: TTextMetric;
begin
  if Assigned(Report) and Assigned(Report.Parent) and
     GetTextMetrics(Report.Canvas.Handle, TM) then
    with Result do
      begin
        X:= TM.tmAveCharWidth;
        Y:= TM.tmHeight;
      end
  else
    with Result do
      begin
        X:=  8;
        Y:= 16;
      end
end;

function TSZReportControl.GetLeft: Integer;
begin
  Result:= inherited Left;
  if not (Self is TSZReport) then Result:= Result div CharSize.X;
end;
procedure TSZReportControl.SetLeft(Value: Integer);
begin
  if not (Self is TSZReport) then
    inherited Left:= Value * CharSize.X
  else
    inherited Left:= Value;
end;

function TSZReportControl.GetTop: Integer;
begin
  Result:= inherited Top;
  if not (Self is TSZReport) then Result:= Result div CharSize.Y;
end;
procedure TSZReportControl.SetTop(Value: Integer);
begin
  if not (Self is TSZReport) then
    inherited Top:= Value * CharSize.Y
  else
    inherited Top:= Value;
end;

function TSZReportControl.GetWidth: Integer;
begin
  Result:= inherited Width div CharSize.X;
  if Result = 0 then Inc(Result);
end;
procedure TSZReportControl.SetWidth(Value: Integer);
begin
  inherited Width:= Value * CharSize.X + 1;
end;

function TSZReportControl.GetHeight: Integer;
begin
  Result:= inherited Height div CharSize.Y;
//  if Result = 0 then Inc(Result);
end;
procedure TSZReportControl.SetHeight(Value: Integer);
begin
  inherited Height:= Value * CharSize.Y + 1
end;

procedure TSZReportControl.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  L, T, W, H: Integer;
begin
  if (csLoading in ComponentState) or fTextResize then
    inherited SetBounds(ALeft, ATop, AWidth, AHeight)
  else
    begin
      if not (Self is TSZReport) then
        begin
          L := ALeft div CharSize.X;
          T := ATop  div CharSize.Y;
        end
      else
        begin
          L := ALeft;
          T := ATop;
        end;
      W := AWidth  div CharSize.X;
      H := AHeight div CharSize.Y;
      SetCharBounds(L, T, W, H);
    end;
end;

procedure TSZReportControl.SetCharBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  fTextResize:= True;
  if not (Self is TSZReport) and AlignToBand then
    begin
      case Alignment of
        taLeftJustify  :
          ALeft := TSZRCustomBand(Parent).Frame.Left;
        taRightJustify :
          if Parent is TSZRCustomBand then
            ALeft := TSZRCustomBand(Parent).Width - AWidth -
                     TSZRCustomBand(Parent).Frame.Right;
        taCenter       :
          if Parent is TSZRCustomBand then
            ALeft := TSZRCustomBand(Parent).Frame.Left +
                    (TSZRCustomBand(Parent).FramedWidth - AWidth) div 2;
      end;
    end;
  if Assigned(Frame) and (AWidth  < Frame.Width ) then AWidth := Frame.Width;
  if Assigned(Frame) and (AHeight < Frame.Height) then AHeight:= Frame.Height;
  if Self is TSZReport then
    SetBounds(ALeft, ATop, AWidth * CharSize.X, AHeight * CharSize.Y)
  else
    SetBounds(ALeft * CharSize.X, ATop * CharSize.Y, AWidth * CharSize.X, AHeight * CharSize.Y);
  Invalidate;
  fTextResize:= False;
end;

procedure TSZReportControl.AdjustBounds;
begin
  SetCharBounds(Left, Top, Width, Height);
end;

procedure TSZReportControl.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Canvas.Font:= Self.Font;
  AdjustBounds;
end;

procedure TSZReportControl.SetFontStyle(Value: TEscapeStyles);
begin
  if fFontStyle <> Value then
    begin
      fFontStyle:= Value;
      Invalidate;
    end;
end;

procedure TSZReportControl.SetAlignment(Value: TAlignment);
begin
  if fAlignment <> Value then
    begin
      fAlignment := Value;
      AdjustBounds;
    end;
end;

procedure TSZReportControl.SetAlignToBand(Value : Boolean);
begin
  if fAlignToBand <> Value then
    begin
      fAlignToBand:= Value;
      AdjustBounds;
    end;
end;

procedure TSZReportControl.SetParent(AParent: TWinControl);
begin
  if (Self is TSZReport) then
    inherited SetParent(AParent)
  else
    begin
      if (AParent <> nil) then
        begin
          if not (AParent is TSZRCustomBand) then
            raise EInvalidOperation.CreateRes(SzrParentReport);
          if not (Self is TSZRCustomBand) and (AParent is TSZReport) then
            raise EInvalidOperation.CreateRes(SzrParentBand);
          fReport:= (AParent as TSZReportControl).Report;
          if (Self is TSZRCustomBand) then AParent:= fReport;
        end
      else
        fReport:= nil;
      inherited SetParent(AParent);
      if Assigned(Report) then AdjustBounds;
    end;
end;

procedure TSZReportControl.Loaded;
begin
  inherited Loaded;
  AdjustBounds;
end;

procedure TSZReportControl.DrawString(X, Y: Integer; S: String);
begin
  with Canvas do
    begin
      Font.Style:= [];
      if esBold      in FontStyle then Font.Style:= Font.Style + [fsBold];
      if esItalic    in FontStyle then Font.Style:= Font.Style + [fsItalic];
      if esUnderline in FontStyle then Font.Style:= Font.Style + [fsUnderline];
      TextOut(X * CharSize.X, Y * CharSize.Y, S);
    end;
end;

procedure TSZReportControl.Paint;
var
  R: TRect;
begin
  R:= GetClientRect;
  with Canvas do
    begin
      Brush.Style:= bsSolid;
      Brush.Color:= Self.Color;
      Pen.Style:= psSolid;
      Pen.Color:= clReportFrame;
      Rectangle(0, 0, ClientWidth, ClientHeight);
    end;
  Frame.Paint;
end;

procedure TSZReportControl.Prepare;
begin
  IsPrinting:= True;
end;

procedure TSZReportControl.Unprepare;
begin
  IsPrinting:= False;
end;

procedure TSZReportControl.DoBeforePrint(var DoPrint: Boolean);
begin
  fLength := FramedHeight;    
  if Assigned(BeforePrint) then BeforePrint(Self, DoPrint);
  if not (Self is TSZRCustomBand) then Inc(fLength, Frame.Height);
  fDoPrint:= DoPrint;
end;

procedure TSZReportControl.DoAfterPrint(Printed: Boolean);
begin
  if Printed then fFrame.Print(Report.CurrentX, Report.CurrentY);
  if Assigned(AfterPrint) then AfterPrint(Self, Printed);
  fDoPrint:= Enabled;
end;

function TSZReportControl.PrintString(X, Y: Integer; S: String; Styles: TEscapeStyles): Boolean;
var
  Page: TSZRPage;
begin
  Page:= Report.ZRPrinter.Page;
  Result:= (Y < Page.Length - Report.Margins.Bottom); // выход за границу страницы
  if Result then Page[Y]:= EscapeStuff( EscapeFormat(S, Styles), Page[Y], Succ(X));
end;

function TSZReportControl.GetFramed(Index: Integer): Integer;
begin
  case Index of
    0: Result:= Left + Frame.Left;
    1: Result:= Top  + Frame.Top;
    2: Result:= Width  - Frame.Width;
    3: Result:= Height - Frame.Height;
  else
    Result := 0;
  end;
end;

procedure TSZReportControl.PrintTo(ParentX, ParentY: Integer);
begin
end;

procedure TSZReportControl.MasterDataAdvance;
begin
end;

{ TSZRCustomBand }

constructor TSZRCustomBand.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
                   csSetCaption, csOpaque, csDoubleClicks, csReplicatable];
  Color    := clReportBand;
  Width    := 8;
  Height   := 2;
end;

destructor TSZRCustomBand.Destroy;
begin
  if Report <> nil then Report.RemoveBand(Self);
  inherited Destroy;
end;

procedure TSZRCustomBand.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if Params.WndParent = 0 then Params.WndParent := Application.Handle;
end;

procedure TSZRCustomBand.SetCharBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  i: Integer;
begin
  inherited SetCharBounds(ALeft, ATop, AWidth, AHeight);
  if not (Self is TSZReport) and Assigned(Report) and
     not fParentResizing then Report.SetBandSizes;
  for i:= 0 to ControlCount-1 do
    if (Controls[i] is TSZReportControl) then
      (Controls[i] as TSZReportControl).AdjustBounds;
end;

procedure TSZRCustomBand.PaintGrid;
var
  i,d,x,y: Integer;
begin
  with Canvas do
    begin
      Brush.Color:= clReportGrid;
      Brush.Style:= bsSolid;
      Pen  .Color:= clReportGrid;
      Pen  .Style:= psSolid;
      d:= CharSize.X;
      y:= CharSize.Y div 2;
      for i:= 1 to Width - 1 do
        begin
          x:= i*d;
          MoveTo(x, 1);
          LineTo(x, ClientRect.Bottom-1);
          if i mod 5 = 0 then
            begin
              Dec(x, CharSize.X div 2);
              Ellipse(x-1, y-1, x+1, y+1);
            end;
        end;
      d:= CharSize.Y;
      x:= CharSize.X div 2;
      for i:= 1 to Height - 1 do
        begin
          y:= i*d;
          MoveTo(1, y);
          LineTo(ClientRect.Right-1, y);
          if i mod 5 = 0 then
            begin
              Dec(y, CharSize.Y div 2);
              Ellipse(x-1, y-1, x+1, y+1);
            end;
        end;
    end;
end;

procedure TSZRCustomBand.Paint;
begin
  inherited Paint;
  PaintGrid;
  if Report <> Self then
    with Canvas do
      begin
        Brush.Style:= bsClear;
        Font.Name  := 'Small Fonts';
        Font.Size  := 6;
        Font.Color := clWindowText;
        TextOut(2, ClientRect.Bottom - TextHeight('W') - 4, ZRBandTypeName(BandType));
      end;
end;

procedure TSZRCustomBand.Prepare;
var
  i : Integer;
begin
  inherited Prepare;
  for i := 0 to ControlCount - 1 do
    if Controls[i] is TSZReportControl then
      TSZReportControl(Controls[i]).Prepare;
end;

procedure TSZRCustomBand.Unprepare;
var
  i : Integer;
begin
  for i := 0 to ControlCount - 1 do
    if Controls[i] is TSZReportControl then
      TSZReportControl(Controls[i]).Unprepare;
  inherited Unprepare;
end;

procedure TSZRCustomBand.DoBeforePrint(var DoPrint: Boolean);
var
  i : Integer;
  B : Boolean;
  C : TSZReportControl;
begin
  inherited;
  if DoPrint and (Self <> Report) then
    for i := 0 to ControlCount - 1 do
      if Controls[i] is TSZReportControl then
        begin
          C:= (Controls[i] as TSZReportControl);
          B:= C.Enabled;
          C.DoBeforePrint(B);
          if B and (C.Length > Length) then Length:= C.Length;
        end;
  Inc(fLength, Frame.Height);
end;

procedure TSZRCustomBand.DoAfterPrint(Printed: Boolean);
var
  i : Integer;
begin
  if (Self <> Report) then
    for i := 0 to ControlCount - 1 do
      if Controls[i] is TSZReportControl then
        TSZReportControl(Controls[i]).DoAfterPrint(Printed and TSZReportControl(Controls[i]).fDoPrint);
  inherited;
end;

function TSZRCustomBand.GetChild : TSZRCustomBand;
var
  i : Integer;
begin
  Result := nil;
  if Report <> nil then
  begin
    for i := 0 to Report.BandList.Count - 1 do
    begin
      if (TSZRCustomBand(Report.BandList[i]).BandType = rbChild) and
         ((TSZRCustomBand(Report.BandList[i]).ParentBand) = Self) then
      begin
        Result := TSZRCustomBand(Report.BandList[i]);
        Break;
      end
    end
  end
end;

function TSZRCustomBand.GetHasChild : Boolean;
begin
  Result := (GetChild <> nil);
end;

procedure TSZRCustomBand.SetHasChild(Value : Boolean);
var
  aBand      : TSZRCustomBand;
  aName      : String;
  AComponent : TComponent;
begin
  if GetHasChild <> Value then
  begin
    if Value then
    begin
      if csDesigning in ComponentState then
      begin
        AComponent := Owner;
        while not (AComponent is TCustomForm) and (AComponent <> nil) do
          AComponent := AComponent.Owner;
        if AComponent <> nil then
        {$ifdef VER120}
          AName := IFormDesigner(TCustomForm(AComponent).Designer).
                   UniqueName(ZRBandComponentName(rbChild));
        {$else}
          AName := IFormDesigner(TCustomForm(AComponent).Designer).
                   UniqueName(ZRBandComponentName(rbChild));
        {$endif}
      end else
        AName := '';
      aBand := TSZRCustomBand.Create(Owner);
      aBand.Name        := aName;
      aBand.Parent      := Parent;
      aBand.fParentBand := Self;
      aBand.BandType    := rbChild;
    end else
    begin
      aBand := GetChild;
      if aBand.HasChild then
        aBand.ChildBand.fParentBand := Self;
      aBand.Free;
    end
  end
end;

{procedure TSZRCustomBand.SetParentBand(Value : TSZRCustomBand);
var
  aBand : TSZRCustomBand;
begin
  aBand := Value;
  while (aBand <> Self) and (aBand <> nil) do
    begin
      if aBand.BandType = rbChild then
        aBand := aBand.ParentBand
      else
        aBand := nil;
    end;
  if aBand = nil then
    begin
      fParentBand := Value;
      BandType    := rbChild;
      Report.RebuildBandList;
      Report.SetBandSizes;
    end
  else
    begin
      if csDesigning in ComponentState then
        ShowMessage(LoadStr(SzrNoCircular));
    end;
end;}

procedure TSZRCustomBand.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = ParentBand) then
    if (ParentBand.BandType = rbChild) then
      fParentBand:= ParentBand.ParentBand
    else
      Free;      //ParentBand:= nil;
end;

procedure TSZRCustomBand.SetBandType(Value : TSZRBandType);
begin
  fBandType := Value;
  if Assigned(Report) then
    begin
      Report.RebuildBandList;
      Report.SetBandSizes;
      Invalidate;
    end
end;

procedure TSZRCustomBand.SetParent(AParent: TWinControl);
begin
  if (Report <> nil) then Report.RemoveBand(Self);
  inherited SetParent(AParent);
  if (Parent is TSZRCustomBand) and (Report <> nil) and (Report <> Self) then
    Report.AddBand(Self);
end;

procedure TSZRCustomBand.RegisterBands;
begin
  if Assigned(Report) then Report.RegisterBand(Self);
end;

procedure TSZRCustomBand.Print;
begin
  if Assigned(Report) then Report.PrintBand(Self);
end;

{ TSZRGroup }

constructor TSZRGroup.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  fEvaluator:= TSZREvaluator.Create;
  BandType  := rbGroupHeader;
end;

destructor TSZRGroup.Destroy;
begin
  fEvaluator.Free;
  inherited Destroy;
end;

procedure TSZRGroup.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
    begin
      if AComponent = fFooterBand then
        fFooterBand := nil;
      if AComponent = fMaster then
        fMaster := nil;
    end
end;

procedure TSZRGroup.SetExpression(Value : String);
begin
  fExpression := Value;
end;

procedure TSZRGroup.SetFooterBand(Value : TSZRCustomBand);
begin
  fFooterBand := Value;
  if fFooterBand <> nil then
    begin
      fFooterBand.BandType := rbGroupFooter;
      fFooterBand.FreeNotification(self);
    end;
end;

function TSZRGroup.GetHasFooter: Boolean;
begin
  Result:= FooterBand <> nil;
end;

procedure TSZRGroup.SetHasFooter(Value: Boolean);
var
  aBand      : TSZRCustomBand;
  aName      : String;
  AComponent : TComponent;
begin
  if GetHasChild <> Value then
  begin
    if Value then
    begin
      if csDesigning in ComponentState then
      begin
        AComponent := Owner;
        while not (AComponent is TCustomForm) and (AComponent <> nil) do
          AComponent := AComponent.Owner;
        if AComponent <> nil then
        {$ifdef VER120}
          AName := IFormDesigner(TCustomForm(AComponent).Designer).
                   UniqueName(ZRBandComponentName(rbGroupFooter));
        {$else}
          AName := IFormDesigner(TCustomForm(AComponent).Designer).
                   UniqueName(ZRBandComponentName(rbGroupFooter));
        {$endif}
      end else
        AName := '';
      aBand := TSZRBand.Create(Owner);
      aBand.Name       := aName;
      aBand.Parent     := Parent;
      FooterBand       := aBand;
    end else
    begin
      aBand := FooterBand;
      if aBand.HasChild then FooterBand:= aBand.ChildBand;
      aBand.Free;
    end
  end
end;

procedure TSZRGroup.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);
  if (Master = nil) then SetMaster(Report);
end;

procedure TSZRGroup.SetMaster(Value : TSZRControllerBand);
begin
  if Value = nil then
    fMaster := Report
  else
    fMaster := Value;
  Report.RebuildBandList;
  Report.SetBandSizes;
  fMaster.FreeNotification(Self);
end;

procedure TSZRGroup.Prepare;
begin
  fEvaluator.DataSets := Report.AllDataSets;
  fEvaluator.Prepare(Expression);
  HasResult := False;
  inherited;
end;

procedure TSZRGroup.Unprepare;
begin
  inherited;
  fEvaluator.Unprepare;
end;

procedure TSZRGroup.Check;
var
  aValue : TSZREvValue;
begin
  Reprint := False;
  if not HasResult then
    begin
      GroupValue := fEvaluator.Value;
      Reprint    := True;
      HasResult  := True;
    end
  else
    begin
      aValue := fEvaluator.Value;
      if aValue.Kind <> GroupValue.Kind then
        Reprint := True
      else
      begin
        case aValue.Kind of
          valString  : Reprint := aValue.StrResult <> GroupValue.strResult;
          valInteger : Reprint := aValue.IntResult <> GroupValue.intResult;
          valDouble  : Reprint := aValue.dblResult <> GroupValue.dblResult;
          valBoolean : Reprint := aValue.booResult <> GroupValue.booResult;
          valDateTime: Reprint := aValue.datResult <> GroupValue.datResult;
        end;
      end;
      if Reprint then GroupValue := aValue;
    end;
end;

{ TSZRControllerBand }

constructor TSZRControllerBand.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  PrintBeforeList := TList.Create;
  PrintAfterList  := TList.Create;
  GroupList       := TList.Create;
  NotifyList      := TList.Create;
  Master          := nil;
  PrintBefore     := False;
  PrintIfEmpty    := False;
  BandType        := rbDetail;  
  Detail          := Self;
  Header          := nil;
  Footer          := nil;
end;

destructor TSZRControllerBand.Destroy;
begin
  inherited Destroy;
  NotifyList     .Free;
  GroupList      .Free;
  PrintAfterList .Free;
  PrintBeforeList.Free;
end;

procedure TSZRControllerBand.SetDataSet(Value : TDataSet);
begin
  fDataSet := Value;
  if Value <> nil then
    fDataSet.FreeNotification(Self);
end;

procedure TSZRControllerBand.SetMaster(Value : TSZRControllerBand);
var
  aMaster: TSZRControllerBand;
begin
  if (Value <> Self) and (Value is TSZRControllerBand) then
    begin
      aMaster:= Value;
      while (aMaster <> Self) and (aMaster <> nil) do
         aMaster:= aMaster.Master;
      if aMaster = nil then
        begin
          fMaster:= Value;
          if (Report <> nil) and not (csDestroying in Report.ComponentState) then
            begin
              Report.RebuildBandList;
              Report.SetBandSizes;
            end;
          if Assigned(Value) then Value.FreeNotification(Self);
        end
      else
        begin
          if csDesigning in ComponentState then
            ShowMessage(LoadStr(SzrNoCircular));
        end;
    end;
end;

procedure TSZRControllerBand.SetPrintBefore(Value : Boolean);
begin
  if PrintBefore <> Value then
    begin
      fPrintBefore := Value;
      if Report <> nil then
        begin
          Report.RebuildBandList;
          Report.SetBandSizes;
        end;
    end;
end;

procedure TSZRControllerBand.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);
  if (Master = nil) and Assigned(Report) then SetMaster(Report);
end;

procedure TSZRControllerBand.Notification(AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
    begin
      if AComponent = Header then
        Header := nil;
      if AComponent = Detail then
        Detail := nil;
      if AComponent = Footer then
        Footer := nil;
      if AComponent = DataSet then
        DataSet := nil;
      if AComponent = Master then
        Master := nil;
    end
end;

procedure TSZRControllerBand.AddNotifyClient(Value : TSZReportControl);
begin
  NotifyList.Add(Value);
end;

procedure TSZRControllerBand.BuildTree;
var
  B: TSZRControllerBand;
  i: Integer;
begin
  if (csDestroying in ComponentState) then Exit;
  PrintBeforeList.Clear;
  PrintAfterList .Clear;
  GroupList      .Clear;
  for i:= 0 to ControlCount-1 do
    begin
      if (csDestroying in Controls[i].ComponentState) then Continue;
      if Controls[i] is TSZRControllerBand then
        begin
          B:= (Controls[i] as TSZRControllerBand);
          if B.PrintBefore then
            B.Master.PrintBeforeList.Add(B)
          else
            B.Master.PrintAfterList.Add(B);
          B.BuildTree;
        end;
      if (Controls[i] is TSZRGroup) then
        if (Controls[i] as TSZRGroup).Master <> nil then
          (Controls[i] as TSZRGroup).Master.GroupList.Add(Controls[i]);
    end;
end;

procedure TSZRControllerBand.RegisterBands;
var
  I : Integer;
begin
  if Assigned(fHeader) then Header.RegisterBands;
  for I := 0 to GroupList.Count - 1 do
    TSZRGroup(GroupList[I]).RegisterBands;
  for I := 0 to PrintBeforeList.Count - 1 do
    TSZRCustomBand(PrintBeforeList[I]).RegisterBands;
  if Assigned(fDetail) then
    if (Detail <> Self) then
      Detail.RegisterBands
    else
      inherited RegisterBands;
  for I := 0 to PrintAfterList.Count - 1 do
    TSZRCustomBand(PrintAfterList[I]).RegisterBands;
  for I := GroupList.Count - 1 downto 0 do
    if TSZRGroup(GroupList[I]).FooterBand <> nil then
      TSZRGroup(GroupList[I]).FooterBand.RegisterBands;
  if Assigned(fFooter) then Footer.RegisterBands;
end;

procedure TSZRControllerBand.Print;
var
  MoreData : Boolean;
  RecCount : Integer;
  DSOK     : Boolean;

  procedure PrintGroupHeaders;
  var
    I : Integer;
  begin
    for I := 0 to GroupList.Count - 1 do
      if TSZRGroup(GroupList[I]).Reprint then
        Report.PrintBand(TSZRGroup(GroupList[I]));
  end;

  procedure PrintGroupFooters;
  var
    I : Integer;
  begin
    for I := GroupList.Count - 1 downto 0 do
      if TSZRGroup(GroupList[I]).Reprint and
         (TSZRGroup(GroupList[I]).FooterBand <> nil) then
        Report.PrintBand(TSZRGroup(GroupList[I]).FooterBand);
  end;

  function CheckGroups : Boolean;
  var
    I, J : Integer;
  begin
    Result := False;
    for I := 0 to GroupList.Count - 1 do
    begin
      TSZRGroup(GroupList[I]).Check;
      if TSZRGroup(GroupList[I]).Reprint then
      begin
        Result := True;
        for J := I + 1 to GroupList.Count - 1 do
          with TSZRGroup(GroupList[J]) do
            begin
              GroupValue := fEvaluator.Value;
              Reprint    := True;
              HasResult  := True;
            end;
        Exit;
      end;
    end;
  end;

  procedure CheckLastGroupFooters;
  var
    I : Integer;
  begin
    for I := 0 to GroupList.Count - 1 do
      TSZRGroup(GroupList[I]).Reprint := not TSZRGroup(GroupList[I]).Reprint;
  end;

  procedure PrintBeforeControllers;
  var
    I : Integer;
  begin
    for I := 0 to PrintBeforeList.Count - 1 do
      TSZRControllerBand(PrintBeforeList[I]).Print;
  end;

  procedure PrintAfterControllers;
  var
    I : Integer;
  begin
    for I := 0 to PrintAfterList.Count - 1 do
      TSZRControllerBand(PrintAfterList[I]).Print;
  end;

  procedure PrintEmptyController;
  begin
    if Assigned(Header) then Report.PrintBand(Header);
    PrintBeforeControllers;
    if Assigned(Detail) then Report.PrintBand(Detail);
    PrintAfterControllers;
    if Assigned(Footer) then Report.PrintBand(Footer);
  end;

begin
  RecCount := 1;
  if (DataSetOK(DataSet) or Assigned(fOnNeedData)) and
    Assigned(Report) then
  begin
    MoreData := True;
    DSOK     := DataSetOK(fDataSet);
    if DSOK then
      begin
        DataSet.First;
        MoreData := not DataSet.EOF;
        if Report.DataSet = DataSet then RecCount := Report.RecordCount;
        if (not Moredata) and PrintIfEmpty then
          PrintEmptyController;
      end
    else
      if Assigned(fOnNeedData) and not (csDesigning in ComponentState) then
        OnNeedData(Self, MoreData);
    fDetailNumber := 0;
    CheckGroups;
    if MoreData then
      begin
        Application.ProcessMessages;
        if Report.ZRPrinter.Cancelled then Exit;
        if Assigned(Header) then Report.PrintBand(fHeader);
        if (Self = Report) and (Report.PageNumber = 1) then
          Report.PrintBand(Report.Bands.ColumnHeaderBand);
        while MoreData do
          begin
            Application.ProcessMessages;
            if Report.ZRPrinter.Cancelled then Exit;
            Inc(fDetailNumber);
            PrintGroupHeaders;
            PrintBeforeControllers;
            MasterDataAdvance;
            if Assigned(Detail) then
              if (Detail <> Self) then
                Report.PrintBand(fDetail)
              else
                inherited Print;
            PrintAfterControllers;
            if DSOK then
              begin
                DataSet.Next;
                MoreData := not fDataSet.EOF;
              end
            else
              begin
                MoreData := False;
                if Assigned(fOnNeedData) and not (csDesigning in ComponentState) then
                  OnNeedData(Self, MoreData);
              end;
            if CheckGroups then
              begin
                if DSOK then DataSet.Prior;
                PrintGroupFooters;
                if DSOK then DataSet.Next;
              end;
            if DSOK and (Report.DataSet = DataSet) and (RecCount <> 0) then
              Report.ZRPrinter.Progress := (Longint(DetailNumber) * 100) div RecCount;
          end;
      CheckLastGroupFooters;
      PrintGroupFooters;
      if (Self = Report) then Report.PrintBand(Report.Bands.ColumnFooterBand);
      if Assigned(Footer) then Report.PrintBand(Footer);
    end
  end
  else
    if PrintIfEmpty then
      PrintEmptyController;
end;

procedure TSZRControllerBand.Prepare;
var
  I : Integer;
begin
  if Self = Report then BuildTree;
  NotifyList.Clear;
  if DataSetOK(fDataSet) then
    Report.AllDataSets.Add(DataSet);
  for I := 0 to PrintBeforeList.Count - 1 do
    TSZRControllerBand(PrintBeforeList[I]).Prepare;
  for I := 0 to PrintAfterList.Count - 1 do
    TSZRControllerBand(PrintAfterList[I]).Prepare;
  for I := 0 to GroupList.Count - 1 do
    TSZRGroup(GroupList[I]).Prepare;
  inherited;
end;

procedure TSZRControllerBand.Unprepare;
var
  I : Integer;
begin
  for I := 0 to PrintBeforeList.Count - 1 do
    TSZRControllerBand(PrintBeforeList[I]).Unprepare;
  for I := 0 to PrintAfterList.Count - 1 do
    TSZRControllerBand(PrintAfterList[I]).Unprepare;
  for I := 0 to GroupList.Count - 1 do
    TSZRGroup(GroupList[I]).Unprepare;
  inherited;
end;

procedure TSZRControllerBand.MasterDataAdvance;
var
  i: Integer;
begin
  for i:=0 to NotifyList.Count-1 do
    TSZReportControl(NotifyList[i]).MasterDataAdvance;
end;

{ TSZRSubDetailBand }

constructor TSZRSubDetailBand.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  Bands    := TSZRSubDetailBands.Create(Self);
  BandType := rbSubDetail;
end;

destructor TSZRSubDetailBand.Destroy;
begin
  inherited Destroy;
  Bands.Free;
end;

function TSZRSubDetailBand.GetFooterBand : TSZRCustomBand;
begin
  Result := Footer;
end;

function TSZRSubDetailBand.GetHeaderBand : TSZRCustomBand;
begin
  Result := Header;
end;

procedure TSZRSubDetailBand.SetFooterBand(Value : TSZRCustomBand);
begin
  Footer := Value;
  if Footer <> nil then
    begin
      Footer.BandType := rbGroupFooter;
      Footer.FreeNotification(Self);
    end
end;

procedure TSZRSubDetailBand.SetHeaderBand(Value : TSZRCustomBand);
begin
  Header := Value;
  if Header <> nil then
    begin
      Header.BandType := rbGroupHeader;
      Header.FreeNotification(Self);
    end
end;

{ TSZReport }

constructor TSZReport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fMargins       := TSZRMargins.Create(Self);
  fAllDataSets   := TList.Create;
  fBandList      := TList.Create;
  BandRegList    := TList.Create;
  fReport        := Self;
  fBands         := TSZReportBands.Create(Self);
  fColumns       := 1;
  Detail         := nil;
  fOptions       := TSZRPrinterOptions.Create(Self);
  Color          := clReport;
  Font.Name      := DefaultFontName;
  Width          := DefaultReportWidth;
  Height         := DefaultReportHeight;
  fReady         := True;
  fShowProgress  := True;
end;

destructor TSZReport.Destroy;
begin
  inherited Destroy;
  fMargins       .Free;
  fBands         .Free;
  BandRegList    .Free;
  fBandList      .Free;
  fAllDataSets   .Free;
  fOptions       .Free;
end;

procedure TSZReport.Loaded;
begin
  inherited Loaded;
  RebuildBandList;
  AdjustBounds;
end;

procedure TSZReport.Paint;
  procedure PaintMargins;
  begin
    with Canvas do
      begin
        Brush.Style:= bsClear;
        Pen.Style  := psSolid;
        Pen.Color  := clReportFrame;
        Rectangle(
          Margins.Left   * CharSize.X -1,
          Margins.Top    * CharSize.Y -1,
          (Width -Margins.Right ) * CharSize.X,
          (Height-Margins.Bottom) * CharSize.Y );
      end;
  end;
  procedure PaintColumns;
  var
    i           : Integer;
  begin
    if Columns > 1 then
    with Canvas do
      begin
        Brush.Style:= bsClear;
        Pen.Style  := psDash;
        Pen.Color  := clReportFrame;
        Rectangle(
          Margins.Left   * CharSize.X -1,
          Margins.Top    * CharSize.Y -1,
          (Width -Margins.Right ) * CharSize.X,
          (Height-Margins.Bottom) * CharSize.Y );
        Pen.Color  := clRed;
        for i := 1 to Columns-1 do
          begin
            MoveTo(CharSize.X * (Margins.Left + i * ColumnWidth + (i - 1) * ColumnSpace), 0);
            LineTo(CharSize.X * (Margins.Left + i * ColumnWidth + (i - 1) * ColumnSpace),
                   CharSize.Y * Margins.Top);

            MoveTo(CharSize.X * (Margins.Left + i * (ColumnWidth + ColumnSpace)), 0);
            LineTo(CharSize.X * (Margins.Left + i * (ColumnWidth + ColumnSpace)),
                   CharSize.Y * Margins.Top);
          end;
      end;
  end;
begin
  inherited Paint;
  PaintMargins;
  PaintColumns;
end;

function TSZReport.CreateBand(BandType : TSZRBandType) : TSZRBand;
var
  {$ifdef VER120}
  Designer : IFormDesigner;
  {$else}
  Designer : IFormDesigner;
  {$endif}
  BandOwner: TComponent;
  aName : String;
  aBand : TSZRBand;

  {$ifdef VER120}
  function FindDesigner: IFormDesigner;
  {$else}
  function FindDesigner: IFormDesigner;
  {$endif}
  var
    Component: TComponent;
  begin
    Result := nil;
    if csDesigning in ComponentState then
    begin
      Component := Owner;
      while not (Component is TCustomForm) and
        (Component <> nil) do
        Component := Component.Owner;
      {$ifdef VER120}
      Result := IFormDesigner(TCustomForm(Component).Designer);
      {$else}
      Result := IFormDesigner(TCustomForm(Component).Designer);
      {$endif}
    end
  end;

begin
  Designer := FindDesigner;
  BandOwner := nil;
  if Designer <> nil then BandOwner := Designer.GetRoot;
  if BandOwner = nil then BandOwner := Owner;
  if BandOwner = nil then BandOwner := Self;
  aBand  := TSZRBand.Create(BandOwner);
  Result := aBand;
  Result.Parent   := Self;
  Result.BandType := BandType;
  if Designer <> nil then
    begin
      aName := ZRBandComponentName(BandType);
      if Copy(aName, 1, 1) = 'T' then aName := 'T'+ aName;
      Result.Name := Designer.UniqueName(aName);
      Designer.Modified;
    end;
end;

procedure TSZReport.AddBand(aBand: TSZRCustomBand);
begin
  if fBandList.IndexOf(aBand) < 0 then
    begin
      fBandList.Add(aBand);
      RebuildBandList;
      SetBandSizes;
    end;
end;

procedure TSZReport.RemoveBand(aBand: TSZRCustomBand);
begin
  if not (csDestroying in ComponentState) then
    begin
      fBandList.Remove(aBand);
      RebuildBandList;
      SetBandSizes;
    end;
end;

procedure TSZReport.RegisterBand(aBand : TSZRCustomBand);
begin
  if not (csDestroying in aBand.ComponentState) and
    (BandRegList.IndexOf(ABand) < 0) then
  begin
    BandRegList.Add(ABand);
    if aBand.HasChild then aBand.ChildBand.RegisterBands;
  end;
end;

procedure TSZReport.RegisterBands;

  procedure AddBandsToList(BandType: TSZRBandType);
  var
    i: Integer;
  begin
    for i:= 0 to fBandList.Count - 1 do
      if TSZRCustomBand(fBandList[i]).BandType = BandType then
        TSZRCustomBand(fBandList[i]).RegisterBands;
  end;

var
  i: Integer;
begin
  AddBandsToList(rbPageHeader);
  if Bands.HasTitle then AddBandsToList(rbTitle);
  AddBandsToList(rbColumnHeader);
  inherited RegisterBands;
  AddBandsToList(rbColumnFooter);
  if Bands.HasSummary then AddBandsToList(rbSummary);
  AddBandsToList(rbPageFooter);
  for i:= 0 to fBandList.Count - 1 do
    if BandRegList.IndexOf(fBandList[i]) = -1 then
      TSZRCustomBand(fBandList[i]).RegisterBands;
end;

procedure TSZReport.RebuildBandList;
begin
  if not (csLoading in ComponentState) then
    begin
      Detail:= Bands.DetailBand;
      Header:= Bands.TitleBand;
      Footer:= Bands.SummaryBand;
      BuildTree;
      BandRegList.Clear;
      RegisterBands;
      fBandList.Free;
      fBandList  := BandRegList;
      BandRegList:= TList.Create;
    end;
end;

procedure TSZReport.SetCharBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetCharBounds(ALeft, ATop, AWidth, AHeight);
  SetBandSizes;
end;

const
  ImplicitBands   = [rbPageHeader, rbPageFooter, rbTitle];
  ReportWideBands = [rbPageHeader, rbPageFooter, rbTitle];
  FooterBands     = [rbPageFooter, rbColumnFooter];

procedure TSZReport.SetBandSizes;
var
  i, y,
  BandWidth  : Integer;
  aBand      : TSZRCustomBand;
  aBandType  : TSZRBandType;
  aChildBand : TSZRCustomBand;
begin
  if not Assigned(fBandList) or
    (csDestroying in ComponentState) or
    (csLoading in ComponentState) then Exit;
  y          := Margins.Top;
  BandWidth  := Width - Margins.Left - Margins.Right;
  for i:= 0 to fBandList.Count - 1 do
    begin
      aBand:= TSZRCustomBand(fBandList[i]);
      if Assigned(aBand) and not (csDestroying in aBand.ComponentState) then
        begin
          aBand.fParentResizing:= True;
          aBand.Left:= Margins.Left;
          aBand.Top := y;
          Inc(y, aBand.Height);
          aBandType:= aBand.BandType;
          if aBand is TSZRCustomBand then
            begin
              aChildBand:= TSZRCustomBand(aBand);
              while (aChildBand.ParentBand <> nil) and
                    (aChildBand.ParentBand.BandType = rbChild) do
                aChildBand:= TSZRCustomBand(aChildBand.ParentBand);
              if aChildBand.ParentBand <> nil then
                aBandType:= aChildBand.ParentBand.BandType;
            end;
          if aBandType in ReportWideBands then
            aBand.Width:= BandWidth
          else
            aBand.Width:= ColumnWidth;
          aBand.fParentResizing:= False;
        end;
    end;
end;

procedure TSZReport.SetColumns(Value: Integer);
begin
  if Columns <> Value then
    begin
      fColumns:= Value;
      SetBandSizes;
      Invalidate;
    end;
end;

procedure TSZReport.SetColumnSpace(Value: Integer);
begin
  if ColumnSpace <> Value then
    begin
      fColumnSpace:= Value;
      SetBandSizes;
      Invalidate;
    end;
end;

function TSZReport.ColumnWidth: Integer;
begin
  Result := (Width - Margins.Left - Margins.Right -
            ColumnSpace * (Columns - 1)) div Columns;
end;

function TSZReport.GetRecordCount : Integer;
begin
  Result := 1;
  if DataSetOK(DataSet) then
    begin
      try
        Result := DataSet.RecordCount;
      except
        Result := 0;
      end;
    end;
end;

function TSZReport.PageFooterSize(Footers: TSZRBandTypes): Integer;
var
  I     : Integer;
  aBand : TSZRCustomBand;
begin
  Result := 0;
  for I := 0 to ControlCount - 1 do
    if Controls[I] is TSZRCustomBand then
      with TSZRCustomBand(Controls[I]) do
        if (BandType in Footers) and Enabled then
          begin
            Inc(Result, Height);
            aBand := TSZRCustomBand(Self.Controls[I]);
            while aBand.HasChild do
              begin
                aBand := aBand.ChildBand;
                Inc(Result, aBand.Height);
              end;
          end;
end;

function TSZReport.RemainSpace : Integer;
begin
  if not Ready then
    Result := ZRPrinter.PageLength - Margins.Bottom - PageFooterSize(FooterBands) - CurrentY
  else
    Result := 0;
end;

procedure TSZReport.ForceNewColumn;
begin
  if (not Ready) then
    begin
      if NewColumnForced or (CurrentColumn > 1) then
        NewColumn
      else
        NewColumnForced := True;
    end;
end;

procedure TSZReport.ForceNewPage;
begin
  if not Ready then
    begin
      if NewPageForced or (PageNumber > 1) then
      begin
        repeat
          NewColumn
        until CurrentColumn = 1
      end else
        NewPageForced := True;
    end;
end;

procedure TSZReport.NewColumn;
begin
  EndColumn;
  if fCurrentColumn = Columns then
    begin
      fCurrentColumn := 1;
      fCurrentX      := Margins.Left;
      NewPage;
    end
  else
    begin
      fCurrentX := fCurrentX + ColumnWidth + ColumnSpace;
      fCurrentY := fColumnTop;
      Inc(fCurrentColumn);
    end;
  if Bands.ColumnHeaderBand <> nil then Bands.ColumnHeaderBand.Print;
end;

procedure TSZReport.NewPage;
begin
  EndPage;
  Inc(fPageCount);
  ZRPrinter.BeginPage;
  CurrentY := Margins.Top;
  if Assigned(fOnStartPage) and not (csDesigning in ComponentState) then fOnStartPage(Self);
  if (fPageCount > 1) or ((fPageCount = 1) and Options.FirstPageHeader) then
    if Bands.PageHeaderBand <> nil then Bands.PageHeaderBand.Print;
  fColumnTop:= CurrentY;
  if (PageNumber = 1) and Bands.HasTitle then Inc(fColumnTop, Bands.TitleBand.Height);
end;

procedure TSZReport.EndColumn;
begin
  if Bands.ColumnFooterBand <> nil then Bands.ColumnFooterBand.Print;
end;

procedure TSZReport.EndPage;
begin
  if fPageCount > 0 then
    begin
      if Assigned(fOnEndPage) and not (csDesigning in ComponentState) then fOnEndPage(Self);
      CurrentY := ZRPrinter.PageLength - Margins.Bottom - PageFooterSize([rbPageFooter]);
      if (Bands.PageFooterBand <> nil) and (fPageCount > 0) and
         ((not fLastPage) or Options.LastPageFooter) then Bands.PageFooterBand.Print;
    end;
end;

procedure TSZReport.PrintBand(aBand : TSZRCustomBand);
var
  PrintBand: Boolean;
  i        : Integer;
begin
  if not Assigned(aBand) or not aBand.Enabled or (csDesigning in ComponentState) then Exit;
//  if aBand.AlignToBottom then
//    CurrentY:= ZRPrinter.PageLength - Margins.Bottom - aBand.Height - PageFooterSize;
  with aBand do
    begin
      PrintBand:= Enabled;
      DoBeforePrint(PrintBand);
      if PrintBand then
        begin
          if ForceNewPage   and not (BandType in ImplicitBands) then Report.ForceNewPage   else
          if ForceNewColumn and not (BandType in ImplicitBands) then Report.ForceNewColumn else
          if not (BandType in FooterBands) and (Report.RemainSpace < Length) then Report.NewColumn;
          for i := 0 to ControlCount - 1 do
            if Controls[I] is TSZReportControl and
               TSZReportControl(Controls[I]).Enabled and
               TSZReportControl(Controls[I]).fDoPrint then
              TSZReportControl(Controls[I]).PrintTo(CurrentX, CurrentY);
          DoAfterPrint(PrintBand);
          CurrentY := CurrentY + Length;
        end;
      if HasChild then
        begin
          if BandType in FooterBands then ChildBand.BandType:= BandType;
          ChildBand.Print;
          ChildBand.BandType:= rbChild;
        end;
    end;
end;

procedure TSZReport.CreateReport(CompositeReport : Boolean);
var
  I           : Integer;
  PrintReport : Boolean;
begin
  if Ready then
    begin
      fReady          := False;
      fLastPage       := False;
      NewColumnForced := False;
      NewPageForced   := False;
      PrintReport     := Enabled;
      try
        if Parent is TCustomForm then
          for I := 0 to TCustomForm(Parent).ComponentCount - 1 do
            if TCustomForm(Parent).Components[I] is TDataset then
              fAllDatasets.Add(TDataset(TCustomForm(Parent).Components[I]));
        DoBeforePrint(PrintReport);
        if PrintReport then
        try
          if not CompositeReport then
            begin
              ZRPrinter.BeginDoc;
              fCurrentY := ZRPrinter.PageLength;
              fPageCount:= 0;
            end;
          fCurrentColumn := 1;
          fCurrentX := Margins.Left;
          Detail := Bands.DetailBand;
          Header := Bands.TitleBand;
          Footer := Bands.SummaryBand;
          Prepare;
          if not CompositeReport then NewPage;
          inherited Print;
          if not CompositeReport then
            begin
              fCurrentX := Margins.Left;
              fLastPage := True;
              if not ZRPrinter.Cancelled then EndPage;
            end;
          Unprepare;
        finally
          if not CompositeReport and not ZRPrinter.Cancelled then ZRPrinter.EndDoc;
        end;
      finally
        fAllDataSets.Clear;
      end;
      fReady := True;
    end;
end;

function PrepareZRPrinter(Owner: TComponent): Boolean;
var
  aPrinter : TSZRPrinter;
  aReceiver: TWinControl;
begin
  Result:= not (Owner is TSZReport) or (Owner as TSZReport).Ready;
  if Result then
    begin
      if (Owner is TSZCompositeReport) then
        aPrinter:= (Owner as TSZCompositeReport).fZRPrinter
      else
        aPrinter:= (Owner as TSZReport).fZRPrinter;
      if Assigned(aPrinter) then
        begin
          AReceiver := aPrinter.MessageReceiver;
          aPrinter.Free;
        end
      else
        AReceiver := nil;
      aPrinter := TSZRPrinter.Create(Owner);
      if (Owner is TSZCompositeReport) then
        with (Owner as TSZCompositeReport) do
          begin
            fZRPrinter    := aPrinter;
            aPrinter.OnFormatString:= OnFormatString;
          end
      else
        with (Owner as TSZReport) do
          begin
            fZRPrinter:= aPrinter;
            ZRPrinter.AfterPreview  := PreviewFinished;
            ZRPrinter.AfterPrint    := PrintFinished;
            aPrinter .OnFormatString:= OnFormatString;
          end;
      aPrinter.MessageReceiver := AReceiver;
    end;
end;

procedure TSZReport.Print;
var
  AProgress : TSZRProgressForm;
begin
  AProgress := nil;
  if PrepareZRPrinter(Self) then
  try
//    ZRPrinter.Destination := zrdPrinter;
    AProgress := TSZRProgressForm.Create(Application);
    AProgress.ZRPrinter := ZRPrinter;
    if ShowProgress then AProgress.Show;
    ZRPrinter.MessageReceiver := AProgress;
    CreateReport(False);
    ZRPrinter.Print;
  finally
    ZRPrinter.Free;
    ZRPrinter := nil;
    AProgress.Free;
  end;
end;

procedure TSZReport.Preview;
var
  aZRPrinter : TSZRPrinter;
begin
  aZRPrinter := nil;
  if PrepareZRPrinter(Self) and not ZRPrinter.ShowingPreview then
  try
    ZRPrinter.Preview;
    Application.ProcessMessages;
    CreateReport(False);
    aZRPrinter := ZRPrinter;
    repeat
      Application.ProcessMessages
    until (not aZRPrinter.ShowingPreview) or Application.Terminated;
  finally
    aZRPrinter.Free;
    ZRPrinter := nil;
  end;
end;

procedure TSZReport.PreviewFinished(Sender : TObject);
begin
  if Assigned(fAfterPreview) then fAfterPreview(Self);
end;

procedure TSZReport.PrintFinished(Sender : TObject);
begin
  DoAfterPrint(True);
end;

{ TSZCompositeReport }

constructor TSZCompositeReport.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  fReports     := TList.Create;
  fPageWidth   := DefaultReportWidth;
  fPageLength  := DefaultReportHeight;
  fOptions     := TSZRPrinterOptions.Create(Self);
  fShowProgress:= True;
end;

destructor TSZCompositeReport.Destroy;
begin
  fOptions.Free;
  fReports.Free;
  inherited Destroy;
end;

procedure TSZCompositeReport.CreateComposite;
var
  I            : Integer;
  LastCurrentY : Integer;
  LastPageCount: Integer;
  LastColumn   : Integer;
  aReport      : TSZReport;
begin
  Reports.Clear;
  if Assigned(fOnAddReports) then fOnAddReports(Self);
  if Reports.Count > 0 then
    begin
      fZRPrinter.BeginDoc;
      fZRPrinter.BeginPage;
      aReport := TSZReport(Reports[0]);
      LastCurrentY  := aReport.Margins.Top;
      LastPageCount := 1;
      LastColumn    := 1;
      for i := 0 to Reports.Count - 1 do
        begin
          fReport := i;
          aReport := TSZReport(Reports[fReport]);
          aReport.ZRPrinter      := fZRPrinter;
          aReport.CurrentY       := LastCurrentY;
          aReport.fPageCount     := LastPageCount;
          aReport.fCurrentColumn := LastColumn;
          aReport.CreateReport(True);
          if Assigned(fOnFinished) then fOnFinished(Reports[fReport]);
          LastCurrentY  := aReport.CurrentY;
          LastPageCount := aReport.fPageCount;
          LastColumn    := aReport.CurrentColumn;
        end;
      fZRPrinter.EndDoc;
    end;
  if Assigned(fOnFinished) then fOnFinished(Self);
end;

procedure TSZCompositeReport.Print;
var
  AProgress : TSZRProgressForm;
begin
  AProgress := nil;
  if PrepareZRPrinter(Self) then
  try
//  fOptions.Destination := zrdPrinter;
    AProgress := TSZRProgressForm.Create(Application);
    AProgress.ZRPrinter := fZRPrinter;
    if ShowProgress then AProgress.Show;
    fZRPrinter.MessageReceiver := AProgress;
    CreateComposite;
    ZRPrinter.Print;
  finally
    fZRPrinter.Free;
    fZRPrinter := nil;
    AProgress.Free;
  end;
end;

procedure TSZCompositeReport.Preview;
begin
  if PrepareZRPrinter(Self) then
    try
      ZRPrinter.Preview;
      CreateComposite;
      repeat
        Application.ProcessMessages
      until (not ZRPrinter.ShowingPreview) or Application.Terminated;
    finally
      ZRPrinter.Free;
      ZRPrinter := nil;
    end;
end;

procedure TSZCompositeReport.Prepare;
begin
  fZRPrinter := TSZRPrinter.Create(Self);
  CreateComposite;
end;

{ TSZRSubDetailBands }

constructor TSZRSubDetailBands.Create(AOwner : TSZRSubDetailBand);
begin
  inherited Create;
  Owner := AOwner;
end;

function TSZRSubDetailBands.GetHasFooter : Boolean;
begin
  Result := Owner.FooterBand <> nil;
end;

function TSZRSubDetailBands.GetHasHeader : Boolean;
begin
  Result := Owner.HeaderBand <> nil;
end;

function TSZRSubDetailBands.GetHeaderBand : TSZRCustomBand;
begin
  Result := Owner.HeaderBand;
end;

function TSZRSubDetailBands.GetFooterBand : TSZRCustomBand;
begin
  Result := Owner.FooterBand;
end;

procedure TSZRsubDetailBands.SetHasHeader(Value : Boolean);
begin
  if Value then
    begin
      if not HasHeader then
        Owner.HeaderBand := Owner.Report.CreateBand(rbGroupHeader)
    end
  else
    begin
      if HasHeader then
        begin
          HeaderBand.Free;
          Owner.HeaderBand := nil;
        end;
    end;
end;

procedure TSZRSubDetailBands.SetHasFooter(Value : Boolean);
begin
  if Value then
    begin
      if not HasFooter then
        Owner.FooterBand := Owner.Report.CreateBand(rbGroupFooter);
    end
  else
    begin
      if HasFooter then
        begin
          FooterBand.Free;
          Owner.FooterBand := nil;
        end;
    end
end;

{ TSZReportBands }

constructor TSZReportBands.Create(AOwner : TSZReport);
begin
  inherited Create;
  fOwner := AOwner;
end;

function TSZReportBands.BandInList(BandType : TSZRBandType) : TSZRCustomBand;
var
  I : Integer;
begin
  Result := nil;
  if Assigned(fOwner) and (fOwner.BandList <> nil) then
    begin
      for I := 0 to fOwner.BandList.Count - 1 do
        begin
          if TSZRCustomBand(fOwner.BandList[I]).BandType = BandType then
            begin
              Result := TSZRCustomBand(fOwner.BandList[I]);
              Break;
            end
        end
    end
end;

function TSZReportBands.GetHasBand(Index : Integer) : Boolean;
begin
  case Index of
    1 : Result := BandInList(rbTitle       ) <> nil;
    2 : Result := BandInList(rbPageHeader  ) <> nil;
    3 : Result := BandInList(rbColumnHeader) <> nil;
    4 : Result := BandInList(rbDetail      ) <> nil;
    5 : Result := BandInList(rbColumnFooter) <> nil;
    6 : Result := BandInList(rbPageFooter  ) <> nil;
  else
    Result := BandInList(rbSummary) <> nil;
  end
end;

function TSZReportBands.GetBand(Index : Integer) : TSZRCustomBand;
begin
  case Index of
    1 : Result := BandInList(rbTitle       );
    2 : Result := BandInList(rbPageHeader  );
    3 : Result := BandInList(rbColumnHeader);
    4 : Result := BandInList(rbDetail      );
    5 : Result := BandInList(rbColumnFooter);
    6 : Result := BandInList(rbPageFooter  );
  else
    Result := BandInList(rbSummary);
  end;
end;

procedure TSZReportBands.SetBand(BandType : TSZRBandType; Value : Boolean);
var
  aBand : TSZRCustomBand;
begin
  if (BandInList(BandType) <> nil) <> Value then
    begin
      if Value then
        TSZReport(fOwner).CreateBand(BandType)
      else
      begin
        aBand := BandInList(BandType);
        aBand.Free;
      end
    end
end;

procedure TSZReportBands.SetHasBand(Index : Integer; Value : Boolean);
begin
  case Index of
    1 : SetBand(rbTitle       , Value);
    2 : SetBand(rbPageHeader  , Value);
    3 : SetBand(rbColumnHeader, Value);
    4 : SetBand(rbDetail      , Value);
    5 : SetBand(rbColumnFooter, Value);
    6 : SetBand(rbPageFooter  , Value);
    7 : SetBand(rbSummary     , Value);
  end;
end;

{ TSZRMargins }
constructor TSZRMargins.Create(AOwner: TSZReport);
begin
  inherited Create;
  fOwner  := AOwner;
  fMargins:= Rect(2, 1, 1, 1);
  Changed;
end;

function TSZRMargins.GetValue(Index: Integer): Integer;
begin
  case Index of
    0: Result:= fMargins.Left;
    1: Result:= fMargins.Top;
    2: Result:= fMargins.Right;
    3: Result:= fMargins.Bottom;
  else
    Result := 0;
  end;
end;

procedure TSZRMargins.SetValue(Index: Integer; Value: Integer);
begin
  case Index of
    0: fMargins.Left   := Value;
    1: fMargins.Top    := Value;
    2: fMargins.Right  := Value;
    3: fMargins.Bottom := Value;
  end;
  Changed;
end;

procedure TSZRMargins.Changed;
begin
  fOwner.SetBandSizes;
  fOwner.Invalidate;
end;

end.


