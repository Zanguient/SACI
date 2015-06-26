unit ElastFrm;


(******************************************************************************
    TElasticForm Component.
    Version 2.5 Maintainance Release 2  Last Update August 23, 1998

    Copyright : Q-Systems Engineering. 8950 N. Calle Buena Vista. Tucson AZ

******************************************************************************)

(*Comment out the next line if this is not an evaluation copy*)
{{$DEFINE EVALUATION}

(******************************************************************************)

(*
    ******************************************************************************
    ******************************************************************************
    COPYRIGHT NOTICE:
    THE SOURCE OF THIS COMPONENT IS PROVIDED AS A PERSONAL COPY.  Q-SYSTEMS ENGINEERING
    CLAIMS NO ROYALTIES FOR THE USE OF TElasticForm IN YOUR PROGRAMS.  HOWEVER, YOU MAY
    NOT DISTRIBUTE THE SOURCE -IN PART OR WHOLE-, THE .DCU, OR THE .OBJ OF THIS FILE.

    ******************************************************************************
    ******************************************************************************
*)

(*

    KNOWN PROBLEMS: NONE


    Functions of this component:
    1) resizes all visual  components in your form as you resize your form.
    2) keeps  the initial size of your form constant as you change screen  resolution or font size.
    3) will set min and max size of form.

    Changes in version 1.2

    All sizing and position properties could only take positive values
    in version 1.1 which were measured in pixels.
    These components can now be negative, (from -1 to -100) where the absolute
    value of the number now means percentage of the current screen resolution.

    New public procedure UpdateSize(aControl:TControl).  If during run time any contol's
    size is changed then this procedure must be called for the new size of the control
    to be recorded and be considered in any resizing.

    Changes in version 1.3
    Ability to exclude any component(s) from resizing

    Changes in version 1.4
    Examines the position property of the form and makes proper position decisions when
    the form first appears on the screen

    Changes in version 1.41
    Correction in line :
      fFrames^[i].initialize(fScreenCorrectionH,fScreenCorrectionV,fPixelsCorrection,
      -----> this has been changed to just 1.0: ---> 1.0*fDesignPixelsperInch/fPixelsPerInch,
                                 TControl(fList.items[i]));
    Changes in version 1.42
    When the component is dropped on a form, the SCALED property of the form is set to FALSE
    If this is not done then only the primary form of a project will be resized properly
    between different font sizes (small fonts, large fonts).

    Changes in version 1.5
    Added timed recording of design form geometry.  This allows design at high resolution that can be
    transferred to user's low resolution.
    Also TDBLookupComboBox in Delphi 3 or TDBLookupCombo in Delphi 1 does not show well
    on the screen when you set visible := true.  Thus, if our application has this component, its
    resizing happens without hiding and reshowing the components

    Changes in Version 2.0
    All components and the form are origininally resized BEFORE the appear on the screen.
    This makes the loading in a different resolution than the compile resolution much faster
    and much more pleasant.  The special treatement of TDBLookupCombo has also become unnecessary.
    The components are now always hidden before resizing which make resizing faster.
    The resizing of TDBText and TLabel when they are autosized is also more accurate.
    Finally, font is resized before the components are resized.  This makes for a more
    accurate resizing of Data Controls that tend to self-resize when their font is resized.

    Changes in Version 2.02
    Find all controls excludes all nameless components.  That is the resizing of all
    multicomponent components is left to the main control.
    Removed all restrictions regarding type of BorderStyle.  Exception is the one
    of bsNone because this is a special case where width equals client width and
    height equals clientheight

    Changes in Version 2.05
    InitializeForm has been changed by removing the Setbounds(L0, T0, cW0, cH0) for the form.
    Eventhough this was working fine in general, it seemed to have problems with TFileListBox.
    Changes were made also in NewWndMethod to take care of the change above.

    Changes in Version 2.06
    The size of each component if first recorded by calling TFrame.PreInitialize(TControl).
    This secures correct appearance when two components have the same align property.  For
    example alTop.  Up until now, the hiding and reshowing of components would make them reverse
    order.

    Changes in Version 2.1
    Added public (not published) properties : ManualPosition, ManualLeft,ManualTop.
    if ManualPosition is true then the design left and top position of the form are overriden.
    The idea behind this is that the user program may have saved the position of the form
    in an INI file.  Then next time the program should start at the last position rather
    than the design position.
    In this case, the OnCreate event of the form, should first read the saved left and top
    position of the form and then impose them to the Elasticform.
    A problem may arise if the user saved the data under one resolution and then reloads the
    program under a new resolution.  IN this case, while ElasticForm will redraw the form to
    maintain the same screen proportions this will not be the case with left and top if they
    are saved as pixel coordinates.
    To bypass this problem, ManualLeft and ManualTop are saved and read as percentages of the
    screen size at the time of save and read.
    Here is a typical example that sets the form at: 5% of the width and 10% of the height
    of the screen:

    procedure TForm1.FormCreate(Sender: TObject);
      begin
        with ElasticForm1 do
          begin
            ManualPosition := true;
            ManualLeft := 0.05;
            ManualTop  := 0.10;
          end;
      end;

    Changes in Version 2.2
      May 17
      added option to maintainformproportions during resizing
      June 26
      Moved call for the default window procedure for every message in the
      beginning of the NewWndMethod procedure.  This way, we secure that minimizing
      is possible.
      June 27
      Boolean bOntheScreen is now controlled by WM_WINDOWPOSCHANGING for all Delphi processes.

    Changes in Version 2.25 - Only Bug fixes
      - ElasticFont := false was not working.  Now it has been fixed.
      - Changes in NewWndMethod to allow deleting a secondary form with Elasticform.
      Closing was always working.  However, if closing of a secondary window was
      done with action := caFree then a GPF error was generated.  Now it has been fixed.
      Unfortunately the problem still exists with Delphi 1.0.
      - Changes in NewWndMethod to make things work for MDI child windows (MDI parent does
        not work if it contains no components.
      - Changes in NewWndMethod to make MDI parent work even when empty.

    Changes in Version 2.26 - Only Bug Fixes
      in procedure TFrame.Resize
      Added restrictions in the if aControl is Tlabel part.
      apparently when the label was alTop or alBottom or ... the resizing could enter an
      infinite loop.

    Changes in Version 2.27 - Only Bug Fixes
      This was a rather important bug in TFrame.Resize regarding TCustomGrid components.
      If vertical elasticity was enabled (the most usual case) then a large enough number
      of resizings could cause a floating point error as the TFrame.DefaultRowHeight and the
      TCustomGrid.DefautlRowHeight were mixed - up.
      Also in NewWndMethod: Earlier corrections on the size of MDI child forms do not appear
      to be needed any more.

    Changes in Version 2.3
       In NewWndMethod
         under case wm_ShowWindow: added following two lines to STOP THE FORM FROM SHOWING
         THE WRONG SIZE BEFORE IT RESIZES with different resolution that the design one:

        if bFirstFormResize then
          TForm(Owner).Setbounds(L0, T0, CW0, CH0);

       Added property FONT :
         The component uppon loading will use the Form's font rather than using the default
         Arial as was doing up until now.  If font is not True Type, a warning is displayed
         to point out that this is not desirable.

    Changes in Version 2.4 (released only internally)
      In NewWndMethod
        Under case ms_ShowWindow removed lines
                   Msg.Result := 0;
                   Exit;
        This allowed the movement of line
          Msg.Result := CallWindowProc (OldWndProc,
                 FormHandle, Msg.Msg, Msg.WParam, Msg.LParam);
        at the end of the method.  This fixes problem reported above in version 2.25
        under unfortunately....
      In TFrame.Initialize:
        TLabel AutoSize property is set to be always true.  Wordwrap benefits from that.

    Changes in Version 2.5

      In TFrame.Initialize and TFrame.Resize added in multiple spots for TCustomGrid controls the check:
        if GetPropInfo(aControl.ClassInfo,'defaultcolwidth') <> nil)
        to see if defaultcolwidth is published.  If it is not, it is assumed that the
        grid type component has its own column width resizing mechnanism and we do nothing about it
        Up until now, each grids needed almost a "case by case" approach to them.  If they had
        internal resizing mechanism, such as TCalendar, they needed t be excluded (explicitly)
        from column width and row height resizing.  Otherwise the overall resizing was
        getting screwed up.


        Introduced InitTitleFontSize in TFrame to store TitleFont if it exists and parentfont is false
        Up until now, DBGrids with ParentFont = false would not resize their Title Font.

        In Frame.resize, changed the check for vertical size of a TCustomGrid control.
      ***********************************************************
      Maintenance Release 2:
      Added public (not published properties:
      ManualSize, ManualWidth, ManualHeight.  Their purpose is to make them work in a similar
      way to ManualLeft and ManualTop of version 2.1.
      ManualWidth and Manual Height are also saved and read as percentages of screen:
      procedure TForm1.FormCreate(Sender: TObject);
        begin
          with ElasticForm1 do
            begin
              ManualPosition := true;
              ManualLeft := 0.05;
              ManualTop  := 0.10;
              {*****************************************}
              ManualSize := true;
              ManualWidth := 0.5;
              ManualHeight := 0.5;
            end;
        end;
      ***********************************************************

*)



interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,ExtCtrls,stdctrls,DBCtrls,{$IFDEF WIN32 THEN} comctrls,{$ENDIF}
  Grids,dbgrids,FileCtrl,TypInfo;


type
  TArrayInteger = array[0..$FFFF div SizeOf(Integer)-1] of integer;
  pTArrayInteger = ^TArrayInteger;

  TFrame = class
    left   : integer;
    width  : integer;
    top    : integer;
    height : integer;
    font   : TFont;
    fXResize,fYResize,fFResize : double; (*global variables that hold the resized ratios for UpdateSize*)
    bStatusBar  : boolean;
    bCustomGrid : boolean;
    ColumnWidths : pTArrayInteger;
    ColumnWidthsMax : integer;
    PanelWidths  : pTArrayInteger;
    PanelWidthsMax : integer;
    InitFontSize : integer;
    InitTitleFontSize : integer;
    FontSizeBeforeMax : integer;
    DefaultRowHeight : integer;
    constructor create;
    destructor  destroy; override;
    procedure preInitialize(aControl:TControl);
    procedure initialize(ScreenCorrectionH,ScreenCorrectionV, PixelsCorrection,PurePixelsCorrection : double;
                         aControl:TControl);
    procedure resize(  ElasticH,ElasticV,ElasticF : boolean;
                          FormClientWidth,FormClientHeight,cW,cH,cF:integer;FontCorrection:double;
                          ScreenCorrectionH,ScreenCorrectionV, PixelsCorrection : double;
                          aControl:TControl);

  end;

  TFrameArray = array[0..($FFFF-4) div SizeOf(TFrame)] of TFrame;
  pTFrameArray = ^TFrameArray;


  (*The following three classes are identical to their parents.  However, all the
  private properties of their parents become available to procedures in this unit*)

  TMyControl = class(TControl);       (*publish ParentFont*)

  TMyWinControl = class(TWinControl); (*publish property Controlcount*)

  TMyCustomGrid = class(TCustomGrid); (*publish properties ColCount, ColWidths*)

  TMyCustomDBGrid = class(TCustomDBGrid);


  TElasticForm = class(TComponent)
  private
     (* window procedures *)
     OldWndProc, NewWndProc: Pointer;
     FHorz, FVert: boolean;
     FElasticFont      : boolean;
     fResizeCounter : Integer;
     cW,cH,cF : integer; (*sizes at creation*)
     cWc,cHc     : integer; (*current sizes*)
     cW0,cH0,cF0 : integer; (*initial sizes at creation after correction*)
     L0,T0       : integer; (*initial left and top at creation after correction *)
     bFirstTime : boolean;
     fFrames    : pTFrameArray;

     fDesignScreenWidth        : integer;
     fDesignScreenHeight       : integer;
     fDesignPixelsPerInch      : integer;
     fDesignTimer              : TTimer;
     fDesignFormWidth          : integer;
     fDesignFormHeight         : integer;
     fDesignFormClientWidth    : integer;
     fDesignFormClientHeight   : integer;
     fDesignFormLeft           : integer;
     fDesignFormTop            : integer;

     fManualPosition           : boolean;
     fManualLeft               : double;
     fManualTop                : double;
     fManualSize               : boolean;
     fManualWidth              : double;
     fManualHeight             : double;


     fScreenWidth              : integer;
     fScreenHeight             : integer;
     fPixelsPerInch            : integer;

     fScreenCorrectionH        : Double;
     fScreenCorrectionV        : Double;
     fPixelsCorrection         : Double;

     fList                     : TList;
     FTotalControls            : integer;
     FInitTotalControls        : integer;

     (*Variables for limiting the size of the form*)
     fMaximizedWidth           : Integer;
     fMaximizedHeight          : Integer;
     fMaximizedPosX            : Integer;
     fMaximizedPosY            : Integer;
     fMinimumTrackWidth        : Integer;
     fMinimumTrackHeight       : Integer;
     fMaximumTrackWidth        : Integer;
     fMaximumTrackHeight       : Integer;
     fOwnerFormPosition        : TPosition; (*Holds the position of the form, such as poDesigned, poScreenCenter *)

     bBeforeShow        : boolean;  (*Forces initialize form to be called ONCE in the beginning*)
     bWasVisible        : array[0..1000] of boolean; (*holds account of which components are visible*)
     bMustShow          : boolean; (*The components are first hidden.  This boolean forces
                                     a first time show.  After that it does nothing*)
     bFirstFormResize   : boolean;
     bOnTheScreen       : boolean;
     fBorderStyle       : TFormBorderStyle;
     bFormStartsMaximized : Boolean;

     bMaintainProportions     : boolean;
     bIncreasing              : boolean;
     fFont                    : TFont;

  private
    procedure FindAllControls(ofMyControl:TControl);
    function FormHandle: THandle;
    procedure NewWndMethod (var Msg: TMessage);
    function InList(Container:TList;aControl:TControl):boolean;
    procedure Timer(Sender:TObject);
    function DefinedMaxLeft: integer;
    function DefinedMaxTop : integer;
    procedure InitializeForm;
    procedure ResizeFormMaintainingProportions;
    procedure SetFont(aFont:TFont);

  protected

  public
     GlobalInt   : LongInt;
     ExcludeList : TList; (*Components in this list are excluded from resizing*)
     ShowMaximized : boolean;
     constructor Create( AOwner: TComponent ); override;
     destructor Destroy;override;
     procedure ReSizeForm;
     procedure UpdateSize(aControl:TControl);
     procedure EnforceMaximized;
     procedure AddToExcludeList(aControl:TControl);
     property ManualPosition : boolean read fManualPosition write fManualPosition;
     property ManualSize : boolean read fManualSize write fManualSize;
     property ManualLeft : double read fManualLeft write fManualLeft;
     property ManualTop  : double read fManualTop write fManualTop;
     property ManualWidth : double read fManualWidth write fManualWidth;
     property ManualHeight: double read fManualHeight write fManualHeight;

  published
     property ElasticHorizontal: boolean read FHorz write FHorz default TRUE;
     property ElasticVertical: boolean read FVert write FVert default TRUE;
     property ElasticFont    : boolean read FElasticFont write FElasticFont default TRUE;
     property DesignScreenWidth : integer read fDesignScreenWidth write fDesignScreenWidth;
     property DesignScreenHeight : integer read fDesignScreenHeight write fDesignScreenHeight;
     property DesignPixelsPerInch : integer read fDesignPixelsPerInch write fDesignPixelsPerInch;

     property MaximizedPosX: Integer read fMaximizedPosX write fMaximizedPosX
       default 0;
     property MaximizedPosY: Integer read fMaximizedPosY write fMaximizedPosY
       default 0;
     property MinimumTrackWidth: Integer read fMinimumTrackWidth write fMinimumTrackWidth
       default 0;
     property MinimumTrackHeight: Integer read fMinimumTrackHeight write fMinimumTrackHeight
       default 0;
     property MaximumTrackWidth: Integer read fMaximumTrackWidth write fMaximumTrackWidth
       default 0;
     property MaximumTrackHeight: Integer read fMaximumTrackHeight write fMaximumTrackHeight
       default 0;

     property DesignFormWidth : Integer read fDesignFormWidth write fDesignFormWidth;
     property DesignFormHeight : Integer read fDesignFormHeight write fDesignFormHeight;
     property DesignFormClientWidth : Integer read fDesignFormClientWidth write fDesignFormClientWidth;
     property DesignFormClientHeight : Integer read fDesignFormClientHeight write fDesignFormClientHeight;
     property DesignFormLeft  : Integer read fDesignFormLeft write fDesignFormLeft;
     property DesignFormTop   : integer read fDesignFormTop write fDesignFormTop;
     property MaintainProportions : boolean read bMaintainProportions write bMaintainProportions
              default false;
     property Font : TFont read fFont write SetFont;

  end;


procedure Register;

var
  LabelLines     : integer;

implementation

var
  bMaxState : boolean;


function MyTrunc(x:double):integer;

begin
  if x-trunc(x) > 0.5 then result := round(x)
  else result := trunc(x);
end;

constructor TFrame.create;

begin
  inherited Create;
  fXResize := 1;
  fYResize := 1;
  fFResize := 1;
end;

destructor TFrame.destroy;
begin
  {$IFDEF WIN32 THEN}
  ReAllocMem(ColumnWidths,0);
  ReAllocMem(PanelWidths,0);
  {$ELSE}
  FreeMem(ColumnWidths,ColumnWidthsMax*SizeOf(Integer));
  {$ENDIF}
  inherited Destroy;
end;



procedure TFrame.PreInitialize(aControl:TControl);


begin
  left := aControl.left;
  top  := aControl.top;
  width := aControl.width;
  height := aControl.height;
end;


procedure TFrame.initialize(ScreenCorrectionH,ScreenCorrectionV, PixelsCorrection,PurePixelsCorrection : double;
                         aControl:TControl);
var
  j : integer;


begin
  bStatusBar := False;
  bCustomGrid := False;

  TMyControl(aControl).ParentFont := false;(*I only needed to to this for Delphi 4 during form maximize*)

  {$IFDEF WIN32 THEN}
  if aControl is TStatusBar then
    begin
      bStatusBar := true;
      (*Allocate memory for the panel widths of the Status Bar*)
      PanelWidthsMax := TStatusBar(aControl).panels.count;
      ReAllocMem(PanelWidths,PanelWidthsMax*SizeOf(Integer));

      (*correct for initial resolution and save*)
      for j := 0 to TStatusBar(aControl).panels.count-1 do
        begin
          TStatusBar(aControl).Panels[j].width :=
             round(PurePixelsCorrection*ScreenCorrectionH*TStatusBar(aControl).Panels[j].width);
          PanelWidths^[j] := TStatusBar(aControl).Panels[j].width;
        end;
    end

  else {$ENDIF} If (aControl is TCustomGrid) and
    (GetPropInfo(aControl.ClassInfo,'defaultcolwidth') <> nil) then
    begin
      bCustomGrid := true;
      (*Allocate memory for the column widths of this grid*)
      ColumnWidthsMax := TMyCustomGrid(aControl).ColCount;
     (* I prefer using ReAllocMem.  However, in Delphi 1, this function cannot initialize a non
        existing pointer.*)
      {$IFDEF WIN32 THEN }
      ReAllocMem(ColumnWidths,ColumnWidthsMax*SizeOf(Integer));
      {$ELSE}
      GetMem(ColumnWidths,ColumnWidthsMax*SizeOf(Integer));
      {$ENDIF}


      (*correct for initial resolution*)
      for j := 0 to TMyCustomGrid(aControl).ColCount-1 do
        TMyCustomGrid(aControl).ColWidths[j] :=
           round(PurePixelsCorrection*ScreenCorrectionH*TMyCustomGrid(aControl).ColWidths[j]);
      TMyCustomGrid(aControl).DefaultRowHeight  :=
         round(PurePixelsCorrection*ScreenCorrectionV*TMyCustomGrid(aControl).DefaultRowHeight);
      (*Save*)
      for j := 0 to TMyCustomGrid(aControl).ColCount-1 do
        ColumnWidths^[j] := TMyCustomGrid(aControl).ColWidths[j];

      if TMyCustomGrid(aControl).DefaultRowHeight > (TMyCustomGrid(aControl).ClientHeight-1) then
        TMyCustomGrid(aControl).DefaultRowHeight := (TMyCustomGrid(aControl).ClientHeight-2);

      DefaultRowHeight := TMyCustomGrid(aControl).DefaultRowHeight;
    end;


  If (aControl is TCustomGrid) and
    (GetPropInfo(aControl.ClassInfo,'defaultrowheight') <> nil) then
    begin
      DefaultRowHeight := TMyCustomGrid(aControl).DefaultRowHeight;
      if DefaultRowHeight <= round(1.2*TMyCustomGrid(aControl).canvas.TextHeight('1')) then
        repeat
          DefaultRowHeight := DefaultRowHeight+1;
        until DefaultRowHeight > round(1.2*TMyCustomGrid(aControl).canvas.TextHeight('1'))
    end;

  (*correct the initial size of each component-saved in preInitialize-for screen resolution differences*)
  left := round(PurePixelsCorrection*ScreenCorrectionH*left);
  top  := round(PurePixelsCorrection*ScreenCorrectionV*top);
  width := round(PurePixelsCorrection*ScreenCorrectionH*width);
  height := round(PurePixelsCorrection*ScreenCorrectionV*height);

  (*Irrespective of the use of it at design time, make it Autosize at runTime.
    I am not certain if someone will object to this.  So I am not going to
    change the related code in TFrame.Resize.  *)
  if aControl is TCustomLabel then
    TLabel(aControl).AutoSize := true;


 (*Record initial font size of each component.  We do it last because some components,
   such as Edit resize automatically when their font changes.  So, first we record
   their initial and modified size, and then we record their font.*)
  with TMyControl(aControl) do
    if not ParentFont then
      begin
        InitFontSize := Trunc(PixelsCorrection*TMyControl(aControl).font.size);
        if GetPropInfo(aControl.ClassInfo,'titlefont') <> nil then
          InitTitleFontSize := Trunc(PixelsCorrection*TMyCustomDBGrid(aControl).font.size);
      end;

end;

procedure TFrame.Resize(  ElasticH,ElasticV,ElasticF : boolean;
                          FormClientWidth,FormClientHeight,cW,cH,cF:integer;FontCorrection:double;
                          ScreenCorrectionH,ScreenCorrectionV, PixelsCorrection : double;
                          aControl:TControl);
var
  xRatio, yRatio : double;
  sLocal         : double;
  j              : integer;
  s              : integer;
  l,t,w,h        : integer;
(*  LabelLines     : integer;*)
  LabelCaption   : string;

begin

  (*Initialize l,t,w,h in case ElasticF,ElasticH, and ElasticV are all FALSE.*)
  l := left;
  t := top;
  w := width;
  h := height;

  if ElasticF then
    begin
      With TMyControl(aControl) do
        begin
          fFResize := FontCorrection;
          if not ParentFont then
            begin
              sLocal := InitFontSize*FontCorrection;
              font.size := MyTrunc(sLocal);
              if GetPropInfo(aControl.ClassInfo,'titlefont') <> nil then
                TMyCustomDBGrid(aControl).titlefont.size := MyTrunc(InitTitleFontSize*FontCorrection);
            end;
        end;
    end;

  if ElasticH then
    begin
       xRatio := FormClientWidth/cW;
       fXResize := xRatio;
       {$IFDEF WIN32 THEN}
       if bStatusBar then
         begin
           with TStatusBar(aControl)do
             begin
               for j := 0 to panels.count-1 do
                 panels[j].width := round(PanelWidths^[j]*xRatio);
             end;
         end;
       {$ENDIF}
       l := round(left*xRatio);
       w := round(width*xRatio);
       If (aControl is TCustomGrid)  and
         (GetPropInfo(aControl.ClassInfo,'defaultcolwidth') <> nil) then
         for j := 0 to TMyCustomGrid(aControl).ColCount-1 do
           TMyCustomGrid(aControl).ColWidths[j] := round(ColumnWidths^[j]*xRatio);
    end;

  if ElasticV then
    begin
       yRatio := FormClientHeight/cH;
       fYResize := yRatio;
       t := Round(top*yRatio);
       h := Round(height*yRatio);

       If (aControl is TCustomGrid)and
              (GetPropInfo(aControl.ClassInfo,'defaultrowheight') <> nil) then
         begin
           s := round(TMyCustomGrid(aControl).canvas.TextHeight('1'));
           TMyCustomGrid(aControl).DefaultRowHeight := round(DefaultRowHeight*yRatio);

           (*Perform the following check only during regular resizing.  Excluce
             going to max or coming back from it.  Only the latter needs actually
             to be restricted because s is returned too large.*)
           if bMaxState then
             if (TMyCustomGrid(aControl).DefaultRowHeight <= s-2) then
                TMyCustomGrid(aControl).DefaultRowHeight := s-2;

         end;
    end;

  aControl.Setbounds(l, t, w, h);

  (*Sometimes Label captions may be slightly clipped during resizing due to
    snug fitting of the label caption within the label *)

  if aControl is TLabel then
    begin
      if not (TLabel(aControl).AutoSize) and not TLabel(aControl).WordWrap then
        begin
          if TLabel(aControl).canvas.textwidth(TLabel(aControl).caption)> aControl.width then
            if not (TLabel(aControl).align in [alTop,alBottom,alClient]) then
              repeat
                aControl.width := aControl.width+1;
              until TLabel(aControl).canvas.textwidth(TLabel(aControl).caption)<=aControl.width;
          if TLabel(aControl).canvas.textHeight(TLabel(aControl).caption)>aControl.Height then
            if not (TLabel(aControl).align in [alLeft,alRight,alClient]) then
              repeat
                aControl.Height := aControl.Height+1;
              until TLabel(aControl).canvas.textHeight(TLabel(aControl).caption)<=aControl.Height;
        end
      else
        begin
          TLabel(AControl).Autosize := false;
          TLabel(AControl).Autosize := true;
        end;
    end;

  if (aControl is TDBText) then
    if TDBText(AControl).Autosize then
      begin
        TDBText(AControl).Autosize := false;
        TDBText(AControl).Autosize := true;
      end;

end;


constructor TElasticForm.Create( AOwner: TComponent );

var
  i : integer;
  counter : integer;

  TheSize  : LongInt;


begin
  inherited Create(AOwner);
  (*Owner can only be a FORM*)

  if (AOwner = nil) or not (AOwner is TForm) then
    begin
      raise Exception.Create (
      'Owner of TElasticForm component must be a form');
    end;
  (* create a single instance only *)
  counter := 0;
  for I := 0 to AOwner.ComponentCount - 1 do
    if AOwner.Components[I] is TElasticForm then
      inc(counter);
  if counter > 1 then (*One is itself*)
    begin
      raise Exception.Create (
        'A TElasticForm component already exists in ' +
        AOwner.Name);
    end;

  if not (csDesigning in ComponentState) then
    begin
      NewWndProc := MakeObjectInstance (NewWndMethod);
      OldWndProc := Pointer (SetWindowLong (FormHandle, gwl_WndProc, Longint (NewWndProc)));
    end
  else
    begin
      NewWndProc := nil;
      OldWndPRoc := nil;
      fDesignFormWidth := TForm(AOwner).Width;
      fDesignFormHeight := TForm(AOwner).Height;
      fDesignFormClientWidth := TForm(AOwner).ClientWidth;
      fDesignFormClientHeight := TForm(AOwner).ClientHeight;
      fDesignFormTop := TForm(AOwner).Top;
      fDesignFormLeft := TForm(AOwner).Left;
      fDesignTimer :=  TTimer.create(self);
      fDesignTimer.interval := 1000;
      fDesignTimer.OnTimer := Timer;
      fDesignTimer.enabled := true;
    end;

  FHorz := TRUE; (*Make elastic in x*)
  FVert := TRUE; (*Make Elastic in y*)
  FElasticFont := TRUE; (*Make Fonts elastic*)
  bFirstTime := true;  (*the first time we shall calculate the components.*)

  if (csDesigning in ComponentState) then (*See if form's font is True Type*)
    begin
    (****************************************************************************)
    TheSize := GetOutlineTextMetrics(TForm(AOwner).canvas.handle,0,nil);
    if TheSize = 0 then
      MessageDlg('Form''s Font is not True Type.  Only True Type font are guaranteed to resize '+
                 'well at all form sizes.  Consider Changing the form''s font to one that is True Type.',
                  mtWarning,[mbOK],0);
    (****************************************************************************)
    end;

  fFont := TFont.create;

  if not (fFont = nil) then
    with fFont do
      begin
        name := TForm(AOwner).font.name;
        size := TForm(AOwner).font.size;
        style := TForm(aowner).font.style;
        color := TForm(aowner).font.color;
        Height := TForm(aowner).font.Height;
      end;


  (*Design time only*)
  if (csDesigning in ComponentState) then
    begin
      With AOwner as TForm do
        begin
          HorzScrollBar.Visible := false;
          VertScrollBar.Visible := false;
          scaled := false;
        end;
      fDesignScreenWidth := Screen.Width;
      fDesignScreenHeight := Screen.Height;
      fDesignPixelsPerInch := Screen.PixelsPerInch;
    end;

  fScreenWidth := Screen.width;
  fScreenHeight := Screen.height;
  fPixelsPerInch := Screen.PixelsPerInch;
  fOwnerFormPosition := TForm(AOwner).position;

  (*Create and Clear List of components that are excluded from resizing*)
  ExcludeList := TList.Create;
  ExcludeList.Clear;

  bBeforeShow := true;
  bMustShow := true;
  bFirstFormResize := true;
  bOnTheScreen := false;
  bFormStartsMaximized := (TForm(Owner).WindowState = wsMaximized);
  fManualPosition := false; (*no manual positioning of the form*)
  bMaintainProportions := false;
  ShowMaximized := false;
  bMaxState := bFormStartsMaximized;

end;


destructor TElasticForm.destroy;

begin
  if Assigned (NewWndProc) then
    begin
      SetWindowLong(FormHandle,gwl_WndProc,LongInt(OldWndProc));
      FreeObjectInstance (NewWndProc);
    end;

  inherited destroy;
  if fList <> nil then
    fList.free;

  if not (fFrames = nil) then
    FreeMem(fFrames,fTotalControls*SizeOf(TFrame));

  if ExcludeList <> nil then
    ExcludeList.Free;

  if fFont <> nil then
    fFont.free;  
end;


function TElasticForm.FormHandle: THandle;

begin
  Result := (Owner as TForm).Handle;
end;


procedure TElasticForm.FindAllControls(ofMyControl:TControl);


(* This procedure parses all the children of one component before it goes to the next*)
var
  i : integer;
  ctrl : TControl;
  s    : String;

begin
  S := ofMycontrol.name;
  If TWinControl(ofMyControl).ControlCount > 0 then
    with TWinControl(ofMyControl) do
      for i := 0 to ControlCount-1 do
        begin
          ctrl := controls[i];
          if not (ctrl.name = '') then (*It is assumed that nameless controls are
                                         internal to other controls, and are the
                                         responsibility of their parents to resize them*)
            fList.add(ctrl);

          if (TControl(controls[i]) is TWinControl) then
            FindAllControls(TControl(ctrl));
        end;
end;


procedure TElasticForm.ReSizeForm;

var

  i,j: integer;
  h,w: integer;
  s    : Double;
  FontCorrection : Double;

begin
  with TForm(owner) do
    begin
      if bFirstTime then
        begin
          for i := 0 to fTotalControls-1 do
              fFrames^[i].initialize(fScreenCorrectionH,fScreenCorrectionV,fPixelsCorrection,
                                      1.0,
                                     TControl(fList.items[i]));


(*Now that component sizes have been stored I can change the Form's font size CF0 which was stored
  when the component first came to existence and before the form was shown*)
          Font.Size := cF0;

          cW := clientwidth;
          cH := clientheight;
          cF := font.size;
          bFirstTime := false;

        end (*if bFirstTime*)
      else
        if ExcludeList.count > 0 then(*remove all excluded controls*)
        begin
          i := 0;
          while i <= FList.Count-1 do
            begin
              if InList(ExcludeList,FList.items[i]) then
                begin
                  for j := i to FList.Count-2 do
                    fFrames^[j] := fFrames^[j+1];
                  FList.delete(i);
                end;
              inc(i);
            end;
          fTotalControls := FList.Count;
          ExcludeList.Clear;
        end;



      if not ( csDesigning in ComponentState ) then
        begin
          h := height;
          w := width;
          s := cF*h/cH;
          if s > cF*w/cW then
            s := cF*w/cW;
          if ElasticFont then
            font.size := round(s);
          s := s/cF;
          FontCorrection := s;

          (*If the component is resizeable then is is resized based on current values.
            This will happen on every resize*)

          for i := 0 to fTotalControls - 1 do
            fFrames^[i].Resize(fHorz,fVert,fElasticFont,ClientWidth,ClientHeight,cW,cH,cF,FontCorrection,
                          fScreenCorrectionH,fScreenCorrectionV, fPixelsCorrection,
                          TControl(fList.items[i]));


          (*After resizing show all components*)
          if bMustShow then
            begin
              for i := 0 to fTotalControls  - 1 do
                try
                  TControl(fList.items[i]).visible := bWasVisible[i];
                except
                end;
              bMustShow := false;
            end;
        end
      else
         begin
            if bFirstTime then
              begin
                cW := width;
                cH := height;
                cF := font.size;
                bFirstTime := false;
              end;
         end;
    end;

end;


procedure TElasticForm.UpdateSize(aControl:TControl);

var
  i : integer;
begin
  i := -1;
  repeat
    inc(i)
  until (i >= fTotalControls) or (aControl = TControl(fList.items[i]));
  if i < fTotalControls then
    with fFrames^[i] do
      begin
        try
          left   := round(aControl.Left/fXResize);
          width  := round(aControl.Width/fXResize);
          top    := round(aControl.Top/fYResize);
          height := round(aControl.Height/fYResize);
        except
        end;

        If (aControl is TCustomGrid)  and
            (GetPropInfo(aControl.ClassInfo,'defaultcolwidth') <> nil) then
          for i := 0 to TMyCustomGrid(aControl).ColCount-1 do
            TMyCustomGrid(aControl).ColWidths[i] := round(ColumnWidths^[i]/fXResize);
      end;
end;

procedure TElasticForm.EnforceMaximized;

begin
  ShowWindow(TForm(Owner).handle,SW_SHOWMAXIMIZED);
end;

function TElasticForm.InList(Container:TList;aControl:TControl):boolean;

var
  i : integer;

begin
  result := false;
  if Container <> nil then
    begin
      for i := 0 to Container.Count-1 do
        if Container.Items[i] = aControl then
          begin
            result := true;
            break;
          end;
    end;
end;


procedure TElasticForm.Timer(Sender:TObject);

begin
  fDesignFormWidth := TForm(Owner).Width;
  fDesignFormHeight := TForm(Owner).Height;
  fDesignFormClientWidth := TForm(Owner).ClientWidth;
  fDesignFormClientHeight := TForm(Owner).ClientHeight;
  fDesignFormTop := TForm(Owner).Top;
  fDesignFormLeft := TForm(Owner).Left;

  if not (fFont = nil) then
    with fFont do
      begin
        name := TForm(Owner).font.name;
        size := TForm(Owner).font.size;
        style := TForm(Owner).font.style;
        color := TForm(Owner).font.color;
        Height := TForm(Owner).font.Height;
      end;
end;


procedure TElasticForm.AddToExcludeList(aControl:TControl);

begin
  try
    If aControl.Owner = Owner then
      begin
        ExcludeList.add(aControl);
        TMyControl(aControl).ParentFont := false;
      end;
  except
    ShowMessage('Control ' + aControl.Name + ' is not a member of ' + TForm(owner).name);
  end;
end;


function TElasticForm.DefinedMaxLeft: integer;
(*Left position of maximized form*)
begin
  result := 0;
  if fMaximizedPosX > 0 then
    result := fMaximizedPosX
  else if fMaximizedPosX < 0 then
    result := round(1.0*abs(fMaximizedPosX)*fDesignScreenWidth / 100);
end;

function TElasticForm.DefinedMaxTop : integer;
(*Top position of maximized form*)
begin
  result := 0;
  if fMaximizedPosY > 0 then
    result := fMaximizedPosY;
  if fMaximizedPosY < 0 then
    result := round(1.0*abs(fMaximizedPosY)*fDesignScreenHeight / 100);
end;


procedure TElasticForm.InitializeForm;

var
  i: integer;

  H1, H2, H3, H4 :HWND;

  const A1 : array[0..12] of char = 'TApplication'#0;
        A2 : array[0..15] of char = 'TAlignPalette'#0;
        A3 : array[0..18] of char = 'TPropertyInspector'#0;
        A4 : array[0..11] of char = 'TAppBuilder'#0;
        T1 : array[0..10] of char = 'Delphi'#0;
        T2 : array[0..10] of char = 'Delphi 2.0'#0;
        T3 : array[0..10] of char = 'Delphi 3'#0;
        T4 : array[0..10] of char = 'Delphi 4'#0;
        T5 : array[0..10] of char = 'C++Builder'#0;

begin
  (* Find all controls, record their visible property and then hide them.
     This enhanses the loading speed *)

  with TForm(Owner) do
    begin
      t0 := top;
      l0 := left;
    end;

  if fList = nil then
    begin
      fTotalControls := 0;
      fList := TList.create;
      fList.Clear;

      FindAllControls(TForm(owner));
      fTotalControls := fList.count;
      FInitTotalControls := FTotalControls;

      {$IFDEF WIN32 THEN }
      ReAllocMem(fFrames,fTotalControls*SizeOf(TFrame));
      {$ELSE}
      GetMem(fFrames,fTotalControls*SizeOf(TFrame));
      {$ENDIF}


      (*Record the initial size and position of all the components BEFORE they are hidden.
        Otherwise, the order of two consecutive components that are both aligned to the top,
        or bottom, or right, or left may be reversed after hiding and reshowing.*)
      for i := 0 to fTotalControls-1 do
        begin
          fFrames^[i] := TFrame.create;
          fFrames^[i].PreInitialize(TControl(fList.items[i]));
        end;

      for i := 0 to (fTotalControls - 1) do
        begin
          bWasVisible[i] := TControl(fList.items[i]).visible;
          try (*Use this in case a control's visible property cannot be changed*)
            TControl(fList.items[i]).visible := false;
          except
          end;
        end;
    end;


  if TForm(Owner).WindowState = wsMaximized then
    begin
      fDesignFormWidth := DesignScreenWidth;
      fDesignFormHeight := DesignScreenHeight;
      fDesignFormTop := DefinedMaxTop;
      fDesignFormLeft := DefinedMaxLeft;
    end;
  (*Define the corrections*)

  fBorderStyle := TForm(Owner).BorderStyle;

  fScreenCorrectionH := 1.0*fScreenWidth/fDesignScreenWidth;
  fScreenCorrectionV := 1.0*fScreenHeight/fDesignScreenHeight;
  fPixelsCorrection := sqrt(fScreenCorrectionV*fScreenCorrectionH);

  bBeforeShow := false;

(*
  Record the Corrected Font of the form.  However, do not correct the font yet because
  changing the font causes many components to automatically resize before their original
  size has been recorded.
*)
  cf0 := MyTrunc(TForm(Owner).font.size*fPixelsCorrection);

  (*resize the form for initial resolution*)
  with TForm(Owner) do
    begin
      if not (BorderStyle = bsNone) then
        begin
          L0 := round(fDesignFormLeft*fScreenCorrectionH);
          T0 := round(fDesignFormTop*fScreenCorrectionV);
          cW0 := round(fDesignFormwidth*fScreenCorrectionH);
          cH0 := round(fDesignFormHeight*fScreenCorrectionV);
        end
      else
        begin
          L0 := round(fDesignFormLeft*fScreenCorrectionH);
          T0 := round(fDesignFormTop*fScreenCorrectionV);
          cW0 := round(fDesignFormClientWidth*fScreenCorrectionH);
          cH0 := round(fDesignFormClientHeight*fScreenCorrectionV);
        end;


      if fOwnerFormPosition = poDesigned then
        begin
          L0 := round(fDesignFormLeft*fScreenCorrectionH);
          T0 := round(fDesignFormTop*fScreenCorrectionV);
        end;

      if fOwnerFormPosition = poScreenCenter then
        begin
          L0 := (Screen.width - cW0) div 2;
          T0  := (Screen.height - cH0) div 2;
        end;

      if (L0 + cW0) > screen.width  then begin L0 := (Screen.Width - cW0) div 2; end;
      if (T0 + cH0) > screen.height then begin T0  := (Screen.Height - cH0) div 2; end;
      if L0 < 0 then begin L0 := 0;  end;
      if T0  < 0 then begin T0 := 0; end;

    end;


  {$IFDEF EVALUATION THEN}
  if not(csDesigning in ComponentState) then
    MessageDlg('This program uses an evaluation copy of TElasticForm by Q-Systems Engineering',
                mtInformation,[mbOK],0);
   H1:=FindWindow(A1, T1);
   if H1 = 0 then
   H1 := FindWindow(A1,T2);
   if H1 = 0 then
   H1 := FindWindow(A1,T3);
   if H1 = 0 then
   H1 := FindWindow(A1,T4);
   if H1 = 0 then
   H1 := FindWindow(A1,T5);

   if H1 = 0 then
     begin
       MessageDlg('Evaluation of TElasticForm can only occur while Delhi IDE is running',
                   mtInformation,[mbOK],0);
       application.terminate;
     end;
   H2:=FindWindow(A2, nil);
   H3:=FindWindow(A3, nil);
   H4:=FindWindow(A4, nil);
   if not ((H1<>0) and (H2<>0) and (H3<>0) and (H4<>0)) then
     begin
       MessageDlg('Evaluation of TElasticForm can only occur while Delhi IDE is running',
                   mtInformation,[mbOK],0);
       application.terminate;
     end;

  {$UNDEF EVALUATION}
  {$ENDIF}
  fResizeCounter := 0;
  bOnTheScreen := false;
end;

procedure TElasticForm.ResizeFormMaintainingProportions;

var
  h,w : integer;
begin

  h := TForm(owner).height;
  w := TForm(owner).width;
  if (h+w) > (cHc + cWc) then bIncreasing := true
  else bIncreasing := false;
  if bIncreasing and ((w-cWc) > (h-cHc)) then
    h := round(1.0*w*cHc/cWc)
  else if bIncreasing and ((w-cWc) < (h-cHc)) then
    w := round(1.0*h*cWc/cHc)
  else if not bIncreasing and ((w-cWc) > (h-cHc)) then
    w := round(1.0*h*cWc/cHc)
  else if not bIncreasing and ((w-cWc) < (h-cHc)) then
    h := round(1.0*w*cHc/cWc);
  with TForm(Owner) do
    Setbounds(left, top, w, h);
end;

procedure TElasticForm.SetFont(aFont:TFont);

begin
  fFont.name := aFont.name;
  fFont.size := aFont.size;
  fFont.style := aFont.style;
  fFont.color := aFont.color;
  fFont.Height := aFont.Height;
  TForm(owner).font.name := fFont.name;
  TForm(owner).font.size := fFont.size;
  TForm(owner).font.style := fFont.style;
  TForm(owner).font.color := fFont.color;
  TForm(owner).font.Height := fFont.Height;
  TForm(owner).repaint;
end;



procedure TElasticForm.NewWndMethod (var Msg: TMessage);

var
  pMinMax          : PMinMaxInfo;

begin
  if not Assigned (NewWndProc) then exit;

  GlobalInt := Msg.Msg;

  if bBeforeShow then
    begin

      InitializeForm;

      cWc := cW0;
      cHc := cH0;

      (*when an MDI chind window is first opened the wm_size message is not called.*)
      if TForm(Owner).FormStyle = fsMDIChild then
        begin
          ResizeForm;
          fResizeCounter := 10000;
       end
      else if TForm(Owner).FormStyle = fsMDIForm then
        begin
          TForm(Owner).Setbounds(L0, T0, CW0, CH0);
        end;
    end;

  if fManualPosition then
    begin
      fManualPosition := false; (*Just do it once*)
      L0 := round(fManualLeft*Screen.Width);
      T0 := round(fManualTop*Screen.Height);
      TForm(Owner).Setbounds(L0, T0, CW0, CH0);
    end;

{
  if fManualSize then
    begin
      resizeForm;
      fManualSize := false; (*Just do it once*)
      CW0 := round(fManualWidth*Screen.Width);
      CH0 := round(fManualHeight*Screen.Height);
      TForm(Owner).Setbounds(L0, T0, CW0, CH0);
    end;
}

  case Msg.Msg of
    wm_GetMinMaxInfo:
      begin
        if bFirstTime and (TForm(Owner).WindowState = wsMaximized) then
          ResizeForm;
       (*We do not want to do this the first time around.  All these checks
              should be available after the form appears on the screen resized at
              to the same relative dimensions during design time: Thus it can occur
              only if not bFirstTime*)

        if bMaintainProportions then
          begin
            if 1.0*cW0/cH0 > 1.0*Screen.Width/Screen.Height then
              begin
                fMaximumTrackHeight := round(1.0*Screen.Width*cH0/cW0);
                fMaximizedHeight := round(1.0*Screen.Width*cH0/cW0);
                if fOwnerFormPosition = poScreenCenter then
                  fMaximizedPosY := (screen.Height - fMaximumTrackHeight) div 2;
              end
            else
              begin
                fMaximumTrackWidth := round(1.0*Screen.Height*cW0/cH0);
                fMaximizedWidth := round(1.0*Screen.Height*cW0/cH0);
                if fOwnerFormPosition = poScreenCenter then
                  fMaximizedPosX := (screen.width - fMaximumTrackWidth) div 2;
              end;
          end;

        if ((fMaximizedWidth + fMaximizedHeight + fMaximizedPosX +
          fMaximizedPosY + fMinimumTrackWidth + fMinimumTrackHeight +
          fMaximumTrackWidth + fMaximumTrackHeight) <> 0) and (not bFirstTime) then
            begin
              pMinMax := PMinMaxInfo (Msg.lParam);
              if fMaximizedWidth <> 0 then
                pMinMax^.ptMaxSize.X := fMaximizedWidth;
              if fMaximizedHeight <> 0 then
                pMinMax^.ptMaxSize.Y := fMaximizedHeight;
              if fMaximizedPosX > 0 then
                pMinMax^.ptMaxPosition.X := fMaximizedPosX;
              if fMaximizedPosX < 0 then
                pMinMax^.ptMaxPosition.X := round(1.0*abs(fMaximizedPosX)*screen.width / 100);
              if fMaximizedPosY > 0 then
                pMinMax^.ptMaxPosition.Y := fMaximizedPosY;
              if fMaximizedPosY < 0 then
                pMinMax^.ptMaxPosition.Y := round(1.0*abs(fMaximizedPosY)*screen.height / 100);
              if fMinimumTrackWidth > 0 then
                pMinMax^.ptMinTrackSize.X := fMinimumTrackWidth;
              if fMinimumTrackWidth < 0 then
                pMinMax^.ptMinTrackSize.X := round(1.0*abs(fMinimumTrackWidth)*screen.width / 100);
              if fMinimumTrackHeight > 0 then
                pMinMax^.ptMinTrackSize.Y := fMinimumTrackHeight;
              if fMinimumTrackHeight < 0 then
                pMinMax^.ptMinTrackSize.Y := round(1.0*abs(fMinimumTrackHeight)*screen.height / 100);
              if fMaximumTrackWidth > 0 then
                pMinMax^.ptMaxTrackSize.X := fMaximumTrackWidth;
              if fMaximumTrackWidth < 0 then
                pMinMax^.ptMaxTrackSize.X := round(1.0*abs(fMaximumTrackWidth)*screen.width / 100);
              if fMaximumTrackHeight > 0 then
                pMinMax^.ptMaxTrackSize.Y := fMaximumTrackHeight;
              if fMaximumTrackHeight < 0 then
                pMinMax^.ptMaxTrackSize.Y := round(1.0*abs(fMaximumTrackHeight)*screen.height / 100);
(*              Msg.Result := 0; (* message handled *)
(*              Exit; (* skip default processing *)
            end;
        Exit; (* skip default processing *)
      end;

    wm_Size :
      begin
        (*maximizing and coming back from maximized form are not handled by wm_sizing*)
        if (Msg.wParam = SIZE_MAXIMIZED) then
          begin
            bOnTheScreen := true;
            bMaxState := true;
          end;
        if bOnTheScreen and (Msg.wParam = SIZE_RESTORED) then
          begin
            bFirstFormResize := false;  (*coming back from maximized form*)
            bMaxState := false;
          end;
        if ((TForm(Owner).BorderStyle = bsNone) or bFirstFormResize or not bOnTheScreen) then
          TForm(Owner).Setbounds(L0, T0, CW0, CH0);

        ResizeForm;

      end;

    wm_ShowWindow:
      begin
        (*Make sure that TForm(Owner).Setbounds(L0, T0, CW0, CH0); from above
          will not be called again.  It just needed to be don the first time
          until the window became visible on the screen*)
        (*CORRECTION IN VERSION 3.0 : IT STOPS THE FORM FROM SHOWING THE WRONG SIZE BEFORE IT RESIZES THE FIRST TIME*)
        if bFirstFormResize then
          if (TForm(Owner).FormStyle <> fsMDIChild) then
            TForm(Owner).Setbounds(L0, T0, CW0, CH0);
        bFirstFormResize := false;

        if fManualSize then
          begin
            resizeForm;
            fManualSize := false; (*Just do it once*)
            CW0 := round(fManualWidth*Screen.Width);
            CH0 := round(fManualHeight*Screen.Height);
            TForm(Owner).Setbounds(L0, T0, CW0, CH0);
          end;

        (*Message handled and exit should not be used here, otherwise, simple minimize
          process will not be handled*)
      end;


    {$IFDEF WIN32 THEN}
    wm_EnterSizeMove:
      begin
        cWc := TForm(Owner).width;
        cHc := TForm(Owner).height;
      end;
    {$ELSE}
    561 : (*wm_EnterSizeMove does not exist in Windows 3.1.  Message 561
            -same number as wm_EnterSizeMove- is called instead*)
      begin
        cWc := TForm(Owner).width;
        cHc := TForm(Owner).height;
      end;
    {$ENDIF}

    {$IFDEF WIN32 THEN}
    wm_ExitSizeMove:
      begin
        if bMaintainProportions then
          ResizeFormMaintainingProportions;
        bMaxState := false;
      end;
    {$ELSE}
    562:  (*wm_ExitSizeMove does not exist in Windows 3.1.  Message 562
            -same number as wm_ExitSizeMove- is called instead*)
       begin
         if bMaintainProportions then
           ResizeFormMaintainingProportions;
         bMaxState := false;
       end;
    {$ENDIF}

    (*wm_activate and wm_windowposchanging are working together.
      wm_windowposchanging is called first with fresizecounter = 0.
      So, for a while bOnTheScreen is false.  Once WM_ACtivate is
      called then fResizeConter = 10000.  Next time that wm_windowposchanging
      is called the bOnthescreen becomes true*)


    WM_ACTIVATE :
      begin
        fResizeCounter := 10000; (*fResizeCounter can be set to any
                                            initial number larger than 2.  However,
                                            the more the forms that are used by an
                                            application the higher it should be.*)

      end;

    WM_WINDOWPOSCHANGING :
      begin
        inc(fResizeCounter);
        if fResizeCounter >= 10000 then
          bOnTheScreen := true;
      end;

    WM_Destroy :
      if Assigned (NewWndProc) then
        begin
          SetWindowLong(FormHandle,gwl_WndProc,LongInt(OldWndProc));
          FreeObjectInstance (NewWndProc);
          NewWndProc := nil;
          Msg.Result := 0;
        end;
  end;

  Msg.Result := CallWindowProc (OldWndProc,
        FormHandle, Msg.Msg, Msg.WParam, Msg.LParam);

end;

procedure Register;
begin
  RegisterComponents('QSysGraph', [TElasticForm]);
end;

end.

