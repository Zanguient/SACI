unit ZREval;

{$B-}

interface

uses
  Windows, WinSpool, Sysutils, Messages, Classes, Controls, StdCtrls, ExtCtrls,
  ComCtrls, Buttons, Printers, Graphics, Forms, Dialogs, DB, DBTables, Variants;

type
  { TSZRLibraryEntry }
  TSZRLibraryItemClass = class of TObject;

  TSZRLibraryEntry = class
    private
      fName        : String;
      fDescription : String;
      fData        : String;
      fVendor      : String;
      fItem        : TSZRLibraryItemClass;
    public
      property Data        : String read fData write fData;
      property Description : String read fDescription write fDescription;
      property Name        : String read fName write fName;
      property Vendor      : String read fVendor write fVendor;
      property Item        : TSZRLibraryItemClass read fItem write fItem;
  end;

  { TSZRLibrary }
  TSZRLibrary = class
    private
      fEntries : TStrings;
    protected
      function GetEntry(Index : integer) : TSZRLibraryEntry; virtual;
    public
      constructor Create;
      destructor  Destroy; override;
      procedure Add(aItem : TSZRLibraryItemClass; aName, aDescription, aVendor, aData: String);
      property Entries: TStrings read fEntries write fEntries;
      property Entry[Index: Integer] : TSZRLibraryEntry read GetEntry; default;
  end;

  TSZREvElement = class;

  { TSZRFunctionLibrary }
  TSZRFunctionLibrary = class(TSZRLibrary)
    public
      function GetFunction(Name : String) : TSZREvElement;
  end;

  { TSZREvaluator related declarations }
  TSZREvOperator = (opLess, opLessOrEqual, opGreater, opGreaterOrEqual, opEqual,
                   opUnequal, opPlus, opMinus, opOr, opMul, opDiv, opMod, opAnd);

  TSZREvValueKind = (valInteger, valDouble, valString, valBoolean, valDateTime, valError);

  TSZREvValue = record
    case Kind : TSZREvValueKind of
      valInteger : (intResult : Longint);
      valDouble  : (dblResult : Double);
      valString  : (strResult : String[255]);
      valDateTime: (datResult : TDateTime);
      valBoolean : (booResult : Boolean);
  end;

  TSZREvResult = class
    public
      Value : TSZREvValue;
  end;

  TSZRFiFo = class
    private
      fAggreg   : Boolean;
      fFiFo     : TList;
      fNextItem : Integer;
    public
      constructor Create;
      destructor  Destroy; override;
      procedure Start;
      procedure Put(Value : TObject);
      function  Get        : TObject;
      property Aggreg : Boolean read fAggreg write fAggreg;
  end;

  TSZREvElement = class
    private
      fIsAggreg : Boolean;
    public
      constructor Create; virtual;
      function  Value(FiFo : TSZRFiFo) : TSZREvValue; virtual;
      procedure Reset; virtual;
      property IsAggreg : Boolean read fIsAggreg write fIsAggreg;
  end;

  TSZREvElementFunction = class(TSZREvElement)
    private
    protected
      ArgList : TList;
      function  ArgumentOK(Value : TSZREvElement) : Boolean;
      function  Argument(Index : Integer) : TSZREvValue;
      procedure FreeArguments;
      procedure GetArguments(FiFo : TSZRFiFo);
      procedure Aggregate; virtual;
      function  Calculate : TSZREvValue; virtual;
    public
      constructor Create; override;
      destructor Destroy; override;
      function Value(FiFo : TSZRFiFo) : TSZREvValue; override;
  end;

  TSZREvElementFunctionClass = class of TSZREvElementFunction;

  TSZREvElementArgumentEnd = class(TSZREvElement);

  TSZREvElementDataField = class(TSZREvElement)
    private
      fDataSet : TDataSet;
      fFieldNo : Integer;
      fField   : TField;
    public
      constructor CreateField(aField : TField); virtual;
      function Value(FiFo : TSZRFiFo) : TSZREvValue; override;
  end;

  TSZREvElementError = class(TSZREvElement)
    public
      function Value(FiFo : TSZRFiFo) : TSZREvValue; override;
  end;

  { TSZREvaluator class }

  TSZREvaluator = class (TObject)
    private
      fDataSets  : TList;
      FiFo       : TSZRFiFo;
      fPrepared  : Boolean;
      function  EvalFunctionExpr(const strFunc : String) : TSZREvValue;
      function  EvalSimpleExpr(const strSimplExpr : String) : TSZREvValue;
      function  EvalTerm(const strTermExpr : String) : TSZREvValue;
      function  EvalFactor(strFactorExpr : String) : TSZREvValue;
      function  EvalString(const strString : String) : TSZREvValue;
      function  EvalConstant(const strConstant : String) : TSZREvValue;
      function  GetAggregate : Boolean;
      function  NegateResult(const Res : TSZREvValue) : TSZREvValue;
      function  Evaluate(const strExpr : String) : TSZREvValue;
      procedure FindDelimiter(strArg : String; var Pos : Integer);
      procedure FindOp1(const strExpr : String; var Op : TSZREvOperator; var Pos, Len : Integer);
      procedure FindOp2(const strExpr : String; var Op : TSZREvOperator; var Pos, Len : Integer);
      procedure FindOp3(const strExpr : String; var Op : TSZREvOperator; var Pos, Len : Integer);
      procedure SetAggregate(Value : Boolean);
      procedure TrimString(var strString : String);
    protected
      function EvalFunction(strFunc : String; const strArg : String) : TSZREvValue; virtual;
      function EvalVariable(strVariable : String) : TSZREvValue; virtual;
      function GetIsAggreg : Boolean;
    public
      constructor Create;
      destructor Destroy; override;
      function  Calculate(const StrExpr : String) : TSZREvValue;
      function  Value : TSZREvValue;
      procedure Prepare(const StrExpr : String);
      procedure Reset;
      procedure UnPrepare;
      property IsAggreg  : Boolean read GetIsAggreg;
      property Aggregate : Boolean read GetAggregate write SetAggregate;
      property DataSets  : TList   read fDataSets write fDataSets;
      property Prepared  : Boolean read fPrepared write fPrepared;
  end;

function Calculate(Formula: String; Values: array of const): Variant;

procedure RegisterZRFunction(FunctionClass : TSZRLibraryItemClass; Name, Description, Vendor, Arguments : String);

var
  ZRFunctionLibrary : TSZRFunctionLibrary;

implementation

uses
  ZRConst;

function Calculate(Formula: String; Values: array of const): Variant;
var
  E: TSZREvaluator;
  R: TSZREvValue;
begin
  Formula:= Format(Formula, Values);
  E:= TSZREvaluator.Create;
  try
    R:= E.Calculate(Formula);
    case R.Kind of
      valInteger : Result:= R.intResult;
      valDouble  : Result:= R.dblResult;
      valString  : Result:= R.strResult;
      valBoolean : Result:= R.booResult;
      valDateTime: Result:= R.datResult;
      else        Result:= Null;
    end;
  except
    E.Free;
    VarClear(Result);
  end;
end;


const
  ArgSeparator : Char = ',';

procedure RegisterZRFunction(FunctionClass : TSZRLibraryItemClass; Name, Description, Vendor, Arguments : string);
begin
  ZRFunctionLibrary.Add(FunctionClass, Name, Description, Vendor, Arguments);
end;

{ TSZRLibrary }

constructor TSZRLibrary.Create;
begin
  inherited Create;
  fEntries := TStringList.Create;
end;

destructor TSZRLibrary.Destroy;
var
  I : integer;
begin
  for I := 0 to Entries.Count - 1 do
    fEntries.Objects[I].Free;
  fEntries.Free;
  inherited Destroy;
end;

procedure TSZRLibrary.Add(aItem : TSZRLibraryItemClass; aName, aDescription, aVendor, aData: String);
var
  aEntry : TSZRLibraryEntry;
begin
  aEntry := TSZRLibraryEntry.Create;
  with aEntry do
    begin
      Name        := aName;
      Description := aDescription;
      Vendor      := aVendor;
      Item        := aItem;
      Data        := aData;
    end;
  fEntries.AddObject(aName, aEntry);
end;

function TSZRLibrary.GetEntry(Index : integer) : TSZRLibraryEntry;
begin
  if Index <= fEntries.Count then
    Result := TSZRLibraryEntry(fEntries.Objects[Index])
  else
    Result := nil;
end;

{ TSZRFunctionLibrary }

function TSZRFunctionLibrary.GetFunction(Name : String) : TSZREvElement;
var
  I             : integer;
  AObject       : TSZREvElementFunctionClass;
  aLibraryEntry : TSZRLibraryEntry;
begin
  I := Entries.IndexOf(Name);
  if I>=0 then
    begin
      aLibraryEntry := TSZRLibraryEntry(Entry[I]);
      aObject := TSZREvElementFunctionClass(aLibraryEntry.Item);
      Result := aObject.Create;
    end
  else
    Result := TSZREvElementError.Create;
end;

{ TSZREvaluator }

constructor TSZRFiFo.Create;
begin
  fFiFo     := TList.Create;
  fAggreg   := False;
  fNextItem := 0;
end;

destructor TSZRFiFo.Destroy;
var
  I : integer;
begin
  for I := 0 to fFiFo.Count-1 do
    TObject(fFiFo[I]).Free;
  fFiFo.Free;
  inherited Destroy;
end;

procedure TSZRFiFo.Start;
begin
  fNextItem := 0;
end;

procedure TSZRFiFo.Put(Value : TObject);
begin
  fFiFo.Add(Value);
end;

function TSZRFiFo.Get : TObject;
begin
  if fNextItem < fFiFo.Count then
  begin
    Result := fFiFo[fNextItem];
    Inc(fNextItem);
  end else
    Result := nil;
end;

{ TSZREvElement }

constructor TSZREvElement.Create;
begin
  inherited Create;
  fIsAggreg := False;
end;

function TSZREvElement.Value(FiFo : TSZRFiFo) : TSZREvValue;
begin
end;

procedure TSZREvElement.Reset;
begin
end;

{ TSZREvElementOperator }

type
  TSZREvElementOperator = class(TSZREvElement)
  private
    fCode :  TSZREvOperator;
    procedure ConverTSZREvResults(var Res1 : TSZREvValue; var Res2 : TSZREvValue);
  public
    constructor CreateOperator(Code : TSZREvOperator);
    function Value(FiFo : TSZRFiFo) : TSZREvValue; override;
  end;

constructor TSZREvElementOperator.CreateOperator(Code : TSZREvOperator);
begin
  inherited Create;
  fCode := Code;
end;

procedure TSZREvElementOperator.ConverTSZREvResults(var Res1 : TSZREvValue; var Res2 : TSZREvValue);
begin
  if Res1.Kind <> Res2.Kind then
    begin
      if ((Res1.Kind = valInteger) and (Res2.Kind = valDouble)) then
        begin
          Res1.Kind      := valDouble;
          Res1.dblResult := Res1.intResult;
        end else
      if ((Res1.Kind = valDouble) and (Res2.Kind = valInteger)) then
        begin
          Res2.Kind      := valDouble;
          Res2.dblResult := Res2.intResult;
        end
      else
        begin
          Res1.Kind := valError;
          Res2.Kind := valError;
        end;
    end;
end;

function TSZREvElementOperator.Value(FiFo : TSZRFiFo) : TSZREvValue;
var
  Res1,
  Res2 : TSZREvValue;
begin
  Res1 := TSZREvElement(FiFo.Get).Value(FiFo);
  Res2 := TSZREvElement(FiFo.Get).Value(FiFo);
  ConverTSZREvResults(Res1, Res2);
  Result.Kind := Res1.Kind;
  if Result.Kind <> valError then
    case fCode of
      opPlus: case Result.Kind of
                valInteger : Result.intResult := Res1.intResult + Res2.intResult;
                valDouble  : Result.dblResult := Res1.dblResult + Res2.dblResult;
                valDateTime: Result.datResult := Res1.datResult + Res2.datResult;
                valString  : Result.strResult := Res1.strResult + Res2.strResult;
                valBoolean : Result.Kind := valError;
              end;
      opMinus:  case Result.Kind of
                  valInteger : Result.intResult := Res1.intResult - Res2.intResult;
                  valDouble  : Result.dblResult := Res1.dblResult - Res2.dblResult;
                  valDateTime: Result.datResult := Res1.datResult - Res2.datResult;
                  valString  : Result.Kind := valError;
                  valBoolean : Result.Kind := valError;
                end;
      opMul: case Result.Kind of
               valInteger : Result.intResult := Res1.intResult * Res2.intResult;
               valDouble  : Result.dblResult := Res1.dblResult * Res2.dblResult;
               valString  : Result.Kind := valError;
               valDateTime: Result.Kind := valError;
               valBoolean : Result.Kind := valError;
             end;
      opMod: case Result.Kind of
               valInteger : if Res2.intResult <> 0 then
                              Result.intResult := Res1.intResult mod Res2.intResult
                            else
                              Result.Kind := valError;
               valDouble  : Result.Kind := valError;
               valString  : Result.Kind := valError;
               valDateTime: Result.Kind := valError;
               valBoolean : Result.Kind := valError;
             end;
      opDiv: case Result.Kind of
               valInteger : if Res2.intResult <> 0 then
                              Result.intResult := Res1.intResult div Res2.intResult
                            else
                              Result.Kind := valError;
               valDouble  : if Res2.dblResult <> 0 then
                              Result.dblResult := Res1.dblResult / Res2.dblResult
                            else
                              Result.Kind := valError;
               valDateTime: Result.Kind := valError;
               valString  : Result.Kind := valError;
               valBoolean : Result.Kind := valError;
             end;
      opGreater: begin
                   Result.Kind := valBoolean;
                   case Res1.Kind of
                     valInteger : Result.booResult := Res1.intResult > Res2.intResult;
                     valDouble  : Result.booResult := Res1.dblResult > Res2.dblResult;
                     valString  : Result.booResult := Res1.strResult > Res2.strResult;
                     valDateTime: Result.booResult := Res1.datResult > Res2.datResult;
                     valBoolean : Result.Kind := valError;
                   end;
                 end;
      opGreaterOrEqual: begin
                Result.Kind := valBoolean;
                case Res1.Kind of
                  valInteger : Result.booResult := Res1.intResult >= Res2.intResult;
                  valDouble  : Result.booResult := Res1.dblResult >= Res2.dblResult;
                  valString  : Result.booResult := Res1.strResult >= Res2.strResult;
                  valDateTime: Result.booResult := Res1.datResult >= Res2.datResult;
                  valBoolean : Result.Kind := valError;
                end;
             end;
      opLess: begin
                Result.Kind := valBoolean;
                case Res1.Kind of
                  valInteger : Result.booResult := Res1.intResult < Res2.intResult;
                  valDouble  : Result.booResult := Res1.dblResult < Res2.dblResult;
                  valString  : Result.booResult := Res1.strResult < Res2.strResult;
                  valDateTime: Result.booResult := Res1.datResult < Res2.datResult;
                  valBoolean : Result.Kind := valError;
                end;
              end;
      opLessOrEqual: begin
                 Result.Kind := valBoolean;
                 case Res1.Kind of
                   valInteger : Result.booResult := Res1.intResult <= Res2.intResult;
                   valDouble  : Result.booResult := Res1.dblResult <= Res2.dblResult;
                   valString  : Result.booResult := Res1.strResult <= Res2.strResult;
                   valDateTime: Result.booResult := Res1.datResult <= Res2.datResult;
                   valBoolean : Result.Kind := valError;
                 end;
               end;
      opEqual: begin
                 Result.Kind := valBoolean;
                 case Res1.Kind of
                   valInteger : Result.booResult := Res1.intResult = Res2.intResult;
                   valDouble  : Result.booResult := Res1.dblResult = Res2.dblResult;
                   valString  : Result.booResult := Res1.strResult = Res2.strResult;
                   valDateTime: Result.booResult := Res1.datResult = Res2.datResult;
                   valBoolean : Result.booResult := Res1.booResult = Res2.booResult;
                 end;
               end;
      opUnequal: begin
                   Result.Kind := valBoolean;
                   case Res1.Kind of
                     valInteger : Result.booResult := Res1.intResult <> Res2.intResult;
                     valDouble  : Result.booResult := Res1.dblResult <> Res2.dblResult;
                     valString  : Result.booResult := Res1.strResult <> Res2.strResult;
                     valBoolean : Result.booResult := Res1.booResult <> Res2.booResult;
                     valDateTime: Result.booResult := Res1.datResult <> Res2.datResult;
                   end;
                 end;
      opOr: begin
              Result.Kind := Res1.Kind;
              case Res1.Kind of
                valInteger : Result.intResult := Res1.intResult or Res2.intResult;
                valDouble  : Result.Kind := valError;
                valDateTime: Result.Kind := valError;
                valString  : Result.Kind := valError;
                valBoolean : Result.booResult := Res1.booResult or Res2.booResult;
              end;
            end;
      opAnd: begin
               Result.Kind := Res1.Kind;
               case Res1.Kind of
                 valInteger : Result.intResult := Res1.intResult and Res2.intResult;
                 valDouble  : Result.Kind := valError;
                 valDateTime: Result.Kind := valError;
                 valString  : Result.Kind := valError;
                 valBoolean : Result.booResult := Res1.booResult and Res2.booResult;
               end;
             end;
    end;
end;

{ TSZREvElementConstant }

type
  TSZREvElementConstant = class(TSZREvElement)
  private
    fValue : TSZREvValue;
  public
    constructor CreateConstant(Value : TSZREvValue);
    function Value(FiFo : TSZRFiFo) : TSZREvValue; override;
  end;

constructor TSZREvElementConstant.CreateConstant(Value : TSZREvValue);
begin
  inherited Create;
  fValue := Value;
end;

function TSZREvElementConstant.Value(FiFo : TSZRFiFo): TSZREvValue;
begin
  Result := fValue;
end;

{ TSZREvElementString }

type
  TSZREvElementString = class(TSZREvElement)
  private
    fValue : String;
  public
    constructor CreateString(Value : String);
    function Value(FiFo : TSZRFiFo) : TSZREvValue; override;
  end;

constructor TSZREvElementString.CreateString(Value : String);
begin
  inherited Create;
  fValue := Value;
end;

function TSZREvElementString.Value(FiFo : TSZRFiFo) : TSZREvValue;
begin
  Result.Kind      := valString;
  Result.strResult := fValue;
end;

{ TSZREvElementFunction }

constructor TSZREvElementFunction.Create;
begin
  inherited Create;
  ArgList := TList.Create;
end;

destructor TSZREvElementFunction.Destroy;
begin
  ArgList.Free;
  inherited Destroy;
end;

procedure TSZREvElementFunction.GetArguments(FiFo : TSZRFiFo);
var
  aArgument: TSZREvElement;
  AResult  : TSZREvResult;
begin
  repeat
    aArgument := TSZREvElement(FiFo.Get);
    if not (aArgument is TSZREvElementArgumentEnd) then
    begin
      aResult := TSZREvResult.Create;
      aResult.Value := aArgument.Value(FiFo);
      ArgList.Add(aResult);
    end;
  until aArgument is TSZREvElementArgumentEnd;
end;

procedure TSZREvElementFunction.FreeArguments;
var
  I : Integer;
begin
  for I := 0 to ArgList.Count - 1 do
    TSZREvElement(ArgList.Items[I]).Free;
  ArgList.Clear;
end;

function TSZREvElementFunction.Argument(Index : integer): TSZREvValue;
begin
  if Index <= ArgList.Count then
    Result := TSZREvResult(ArgList[Index]).Value;
end;

function TSZREvElementFunction.Value(FiFo : TSZRFiFo) : TSZREvValue;
begin
  GetArguments(FiFo);
  if FiFo.Aggreg then
    Aggregate;
  Result := Calculate;
  FreeArguments;
end;

function TSZREvElementFunction.ArgumentOK(Value : TSZREvElement) : Boolean;
begin
  Result := not (Value is TSZREvElementArgumentEnd) and not (Value is TSZREvElementError);
end;

procedure TSZREvElementFunction.Aggregate;
begin
end;

function TSZREvElementFunction.Calculate : TSZREvValue;
begin
  Result.Kind := valError;
end;

{ TSZREvTrue }

type
  TSZREvTrue = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

  TSZREvFalse = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvTrue.Calculate : TSZREvValue;
begin
  if ArgList.Count = 0 then
  begin
    Result.Kind := valBoolean;
    Result.booResult := True;
  end else
    Result.Kind := valError;
end;

function TSZREvFalse.Calculate : TSZREvValue;
begin
  if ArgList.Count = 0 then
  begin
    Result.Kind := valBoolean;
    Result.booResult := False;
  end else
    Result.Kind := valError;
end;

{ TSZREvIfFunction }

type
  TSZREvIfFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvIfFunction.Calculate : TSZREvValue;
begin
  if (ArgList.Count = 3) and (Argument(0).Kind = valBoolean) then
  begin
    if Argument(0).booResult then
      Result := Argument(1)
    else
      Result := Argument(2);
  end else
    result.Kind := valError;
end;

{ TSZREvTypeOfFunction }

type
  TSZREvTypeOfFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvTypeOfFunction.Calculate : TSZREvValue;
begin
  Result.Kind := valString;
  if ArgList.Count = 1 then
  begin
    case Argument(0).Kind of
      valInteger : Result.strResult := 'INTEGER';   {<-- do not resource }
      valDouble  : Result.strResult := 'FLOAT';     {<-- do not resource }
      valString  : Result.strResult := 'STRING';    {<-- do not resource }
      valBoolean : Result.strResult := 'BOOLEAN';   {<-- do not resource }
      valDateTime: Result.strResult := 'DATE';      {<-- do not resource }
      valError   : Result.strResult := 'ERROR';     {<-- do not resource }
    else
      Result.Kind := valError;
    end
  end else
    Result.Kind := valError;
end;

{ TSZREvIntFunction }

type
  TSZREvIntFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvIntFunction.Calculate : TSZREvValue;
begin
  Result.Kind := valInteger;
  if ArgList.Count = 1 then
  begin
    case Argument(0).Kind of
      valInteger: Result.intResult := Argument(0).intResult;
      valDouble : Result.intResult := Round(Int(Argument(0).dblResult));
    else
      Result.Kind := valError;
    end
  end else
    Result.Kind := valError;
end;

{ TSZREvFracFunction }

type
  TSZREvFracFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvFracFunction.Calculate : TSZREvValue;
begin
  Result.Kind := valDouble;
  if ArgList.Count = 1 then
  begin
    case Argument(0).Kind of
      valInteger: Result.dblResult := 0;
      valDouble : Result.dblResult := Frac(Argument(0).dblResult);
    else
      Result.Kind := valError;
    end
  end else
    Result.Kind := valError;
end;

{ TSZREvSQRTFunction }

type
  TSZREvSQRTFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvSQRTFunction.Calculate : TSZREvValue;
begin
  Result.Kind := valDouble;
  if ArgList.Count = 1 then
  begin
    case Argument(0).Kind of
      valInteger: Result.dblResult := SQRT(Argument(0).intResult);
      valDouble : Result.dblResult := SQRT(Argument(0).dblResult);
    else
      Result.Kind := valError;
    end
  end else
    Result.Kind := valError;
end;

{ TSZREvStrFunction }

type
  TSZREvStrFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvStrFunction.Calculate : TSZREvValue;
var
  ArgRes : TSZREvValue;
begin
  if ArgList.Count = 1 then
  begin
    ArgRes := Argument(0);
    Result.Kind := valString;
    case ArgRes.Kind of
      valInteger : Result.strResult := IntToStr(ArgRes.intResult);
      valDouble  : Result.strResult := FloatToStr(ArgRes.dblResult);
      valBoolean : if ArgRes.booResult then
                     Result.strResult := 'True'          {<-- do not resource }
                   else
                     Result.strResult := 'False';        {<-- do not resource }
      valDateTime: Result.strResult := DateTimeToStr(ArgRes.datResult);
    else
      Result.Kind := valError;
    end
  end else
    Result.Kind := valError;
end;

{ TSZREvUpperFunction }

type
  TSZREvUpperFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvUpperFunction.Calculate : TSZREvValue;
begin
  if (ArgList.Count = 1) and (Argument(0).Kind = valString) then
  begin
    Result.Kind := valString;
    Result.strResult := AnsiUpperCase(Argument(0).strResult);
  end else
    Result.Kind := valError;
end;

{ TSZREvLowerFunction }

type
  TSZREvLowerFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvLowerFunction.Calculate : TSZREvValue;
begin
  if (ArgList.Count = 1) and (Argument(0).Kind = valString) then
  begin
    Result.Kind := valString;
    Result.strResult := AnsiLowerCase(Argument(0).strResult);
  end else
    Result.Kind := valError;
end;

{ TSZREvPrettyFunction }

type
  TSZREvPrettyFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvPrettyFunction.Calculate : TSZREvValue;
begin
  if (ArgList.Count = 1) and (Argument(0).Kind = valString) then
  begin
    Result.Kind := valString;
    Result.strResult := AnsiUpperCase(Copy(Argument(0).strResult, 1, 1)) +
                        AnsiLowerCase(Copy(Argument(0).strResult, 2, Length(Argument(0).strResult)));
  end else
    Result.Kind := valError;
end;

{ TSZREvTimeFunction }

type
  TSZREvTimeFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvTimeFunction.Calculate : TSZREvValue;
begin
  if ArgList.Count = 0 then
  begin
    Result.Kind      := valString;
    Result.strResult := TimeToStr(Now);
  end else
    Result.Kind := valError;
end;

{ TSZREvTimeFunction }

type
  TSZREvDateFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvDateFunction.Calculate : TSZREvValue;
begin
  if ArgList.Count=0 then
  begin
    Result.Kind      := valString;
    Result.StrResult := DateToStr(Date);
  end else
    Result.Kind := valError;
end;

{ TSZREvCopyFunction }

type
  TSZREvCopyFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvCopyFunction.Calculate : TSZREvValue;
begin
  if (ArgList.Count = 3) and
    (Argument(0).Kind = valString) and
    (Argument(1).Kind = valInteger) and
    (Argument(2).Kind = valInteger) then
  begin
    Result.strResult := copy(Argument(0).strResult, Argument(1).intResult, Argument(2).intResult);
    Result.Kind := valString;
  end else
    Result.Kind := valError;
end;

{ TSZREvFormatFloatFunction }

type
  TSZREvFormatFloatFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvValue; override;
  end;

function TSZREvFormatFloatFunction.Calculate : TSZREvValue;
begin
  if (ArgList.Count = 2) and
     ((Argument(1).Kind = valInteger) or (Argument(1).Kind = valDouble)) and
     (Argument(0).Kind = valString) then
  begin
    Result.Kind := valString;
    if Argument(1).Kind = valInteger then
      Result.StrResult := FormatFloat(Argument(0).strResult, Argument(1).intResult * 1.0)
    else
      Result.StrResult := FormatFloat(Argument(0).strResult, Argument(1).dblResult);
  end else
    Result.Kind := valError;
end;

{ TSZREvSumFunction }

type
  TSZREvSumFunction = class(TSZREvElementFunction)
  private
    SumResult   : TSZREvValue;
    ResAssigned : Boolean;
  public
    constructor Create; override;
    procedure  Aggregate; override;
    function   Calculate : TSZREvValue; override;
    procedure  Reset; override;
  end;

constructor TSZREvSumFunction.Create;
begin
  inherited Create;
  ResAssigned := False;
  IsAggreg    := True;
end;

procedure TSZREvSumFunction.Reset;
begin
  ResAssigned := False;
end;

procedure TSZREvSumFunction.Aggregate;
var
  aValue : TSZREvValue;
begin
  if ArgList.Count = 1 then
  begin
    aValue := Argument(0);
    if ResAssigned then
      case aValue.Kind of
        valInteger: SumResult.IntResult := SumResult.intResult + aValue.intResult;
        valDouble : SumResult.dblResult := SumResult.dblResult + aValue.dblResult;
        else        SumResult.Kind := valError;
      end else
    begin
      SumResult.Kind := aValue.Kind;
      case aValue.Kind of
        valInteger: SumResult.intResult := aValue.intResult;
        valDouble : SumResult.dblResult := aValue.dblResult;
        else        SumResult.Kind := valError;
      end;
    end;
    ResAssigned := True;
  end else
    SumResult.Kind := valError;
end;

function TSZREvSumFunction.Calculate : TSZREvValue;
begin
  if ResAssigned then
    Result := SumResult
  else
    Result.Kind := valError;
end;

{ TSZREvAverageFunction }

type
  TSZREvAverageFunction = class(TSZREvSumFunction)
  private
    Count   : Longint;
    aResult : TSZREvValue;
  public
    function  Calculate : TSZREvValue; override;
    procedure Aggregate; override;
    procedure Reset; override;
  end;

procedure TSZREvAverageFunction.Reset;
begin
  inherited Reset;
  aResult.Kind := valError;
  Count        := 0;
  IsAggreg     := True;
end;

procedure TSZREvAverageFunction.Aggregate;
var
  aValue : TSZREvValue;
begin
  inherited Aggregate;
  Inc(Count);
  aValue       := inherited Calculate;
  aResult.Kind := valDouble;
  case aValue.Kind of
    valInteger: aResult.dblResult := aValue.intResult / Count;
    valDouble : aResult.dblResult := aValue.dblResult / Count;
  else
    aResult.Kind := valError;
  end;
end;

function TSZREvAverageFunction.Calculate : TSZREvValue;
begin
  Result := aResult
end;

{ TSZREvMaxFunction }

type
  TSZREvMaxFunction = class(TSZREvElementFunction)
  private
    MaxResult   : TSZREvValue;
    ResAssigned : Boolean;
  public
    constructor Create; override;
    function  Calculate : TSZREvValue; override;
    procedure Aggregate; override;
    procedure Reset; override;
  end;

constructor TSZREvMaxFunction.Create;
begin
  inherited Create;
  ResAssigned := False;
  IsAggreg    := True;
end;

procedure TSZREvMaxFunction.Reset;
begin
  ResAssigned := False;
end;

procedure TSZREvMaxFunction.Aggregate;
var
  aValue : TSZREvValue;
begin
  if ArgList.Count = 1 then
  begin
    aValue := Argument(0);
    if ResAssigned then
    begin
      case MaxResult.Kind of
        valInteger : if aValue.intResult > MaxResult.intResult then
                       MaxResult.intResult := aValue.intResult;
        valDouble  : if aValue.dblResult > MaxResult.dblResult then
                       MaxResult.dblResult := aValue.dblResult;
        valString  : if aValue.strResult > MaxResult.strResult then
                       MaxResult.strResult := aValue.strResult;
        valDateTime: if aValue.datResult > MaxResult.datResult then
                       MaxResult.datResult := aValue.datResult;
        valBoolean : if aValue.booResult > MaxResult.booResult then
                       MaxResult.booResult := aValue.booResult;
      else
        MaxResult.Kind := valError;
      end
    end else
    begin
      MaxResult   := aValue;
      ResAssigned := True;
    end
  end else
    MaxResult.Kind := valError;
end;

function TSZREvMaxFunction.Calculate : TSZREvValue;
begin
  if ResAssigned then
    Result := MaxResult
  else
    Result.Kind := valError;
end;

{ TSZREvMinFunction }

type
  TSZREvMinFunction = class(TSZREvElementFunction)
  private
    MinResult   : TSZREvValue;
    ResAssigned : Boolean;
  public
    constructor Create; override;
    function  Calculate : TSZREvValue; override;
    procedure Aggregate; override;
    procedure Reset; override;
  end;

constructor TSZREvMinFunction.Create;
begin
  inherited Create;
  ResAssigned := False;
  IsAggreg    := True;
end;

procedure TSZREvMinFunction.Reset;
begin
  ResAssigned := False;
end;

procedure TSZREvMinFunction.Aggregate;
var
  aValue : TSZREvValue;
begin
  if ArgList.Count = 1 then
  begin
    aValue := Argument(0);
    if ResAssigned then
    begin
      case MinResult.Kind of
        valInteger : if aValue.intResult < MinResult.intResult then
                       MinResult.intResult := aValue.intResult;
        valDouble  : if aValue.dblResult < MinResult.dblResult then
                       MinResult.dblResult := aValue.dblResult;
        valString  : if aValue.strResult < MinResult.strResult then
                       MinResult.strResult := aValue.strResult;
        valDateTime: if aValue.datResult < MinResult.datResult then
                       MinResult.datResult := aValue.datResult;
        valBoolean : if aValue.booResult > MinResult.booResult then
                       MinResult.booResult := aValue.booResult;
      else
        MinResult.Kind := valError;
      end
    end else
    begin
      MinResult   := aValue;
      ResAssigned := True;
    end
  end else
    MinResult.Kind := valError;
end;

function TSZREvMinFunction.Calculate : TSZREvValue;
begin
  if ResAssigned then
    Result := MinResult
  else
    Result.Kind := valError;
end;

{ TSZREvCountFunction }

type
  TSZREvCountFunction = class(TSZREvElementFunction)
  private
    fCount : Integer;
  public
    constructor Create; override;
    function  Value(FiFo : TSZRFiFo) : TSZREvValue; override;
    procedure Reset; override;
  end;

constructor TSZREvCountFunction.Create;
begin
  inherited Create;
  fCount   := 0;
  IsAggreg := True;
end;

function TSZREvCountFunction.Value(FiFo : TSZRFiFo) : TSZREvValue;
begin
  GetArguments(FiFo);
  if (ArgList.Count = 0) then
  begin
    if FiFo.Aggreg then
      Inc(fCount);
    Result.Kind      := valInteger;
    Result.intResult := fCount;
  end else
    Result.Kind := valError;
  FreeArguments;
end;

procedure TSZREvCountFunction.Reset;
begin
  fCount := 0;
end;

{ TSZREvElementDataField }

constructor TSZREvElementDataField.CreateField(aField : TField);
begin
  inherited Create;
  fDataSet := aField.DataSet;
  fFieldNo := aField.Index;
  fField := aField;
end;

function TSZREvElementDataField.Value(FiFo : TSZRFiFo) : TSZREvValue;
begin
  if fDataSet.DefaultFields then
    fField := fDataSet.Fields[fFieldNo];
  if fField is TStringField then
  begin
    Result.Kind := valString;
    Result.strResult := TStringField(fField).Value;
  end else
    if (fField is TIntegerField) or
       (fField is TSmallIntField) or
       (fField is TWordField) then
    begin
      Result.Kind := valInteger;
      Result.intResult := fField.AsInteger;
    end else
      if (fField is TFloatField)  or
         (fField is TCurrencyField) or
         (fField is TBCDField) then
      begin
        Result.Kind := valDouble;
        Result.dblResult := TFloatField(fField).AsFloat;
      end else
        if fField is TBooleanField then
        begin
          Result.Kind := valBoolean;
          Result.BooResult := TBooleanField(fField).Value;
        end else
          if (fField is TDateField) or
             (fField is TTimeField) or
             (fField is TDateTimeField) then
          begin
            Result.Kind := valDateTime;
            Result.datResult := fField.AsDateTime;
          end else
            Result.Kind := valError
end;

function TSZREvElementError.Value(FiFo : TSZRFiFo) : TSZREvValue;
begin
  Result.Kind := valError;
end;

{ TSZREvaluator }

constructor TSZREvaluator.Create;
begin
  Prepared := False;
end;

destructor TSZREvaluator.Destroy;
begin
  if Prepared then Unprepare;
  inherited Destroy;
end;

procedure TSZREvaluator.TrimString(var strString : string);
var
  intStart,
  intEnd : integer;
begin
  intStart := 1;
  intEnd := Length(strString);
  while (copy(strString, intStart,1) = ' ') and (intStart < intEnd) do
    inc(intStart);
  while (copy(strString, intEnd,1) = ' ') and (intEnd > intStart) do
    dec(intEnd);
  strString := Copy(strString, intStart, intEnd - intStart + 1);
end;

procedure TSZREvaluator.FindDelimiter(strArg : string; var Pos : integer);
var
  n             : integer;
  FoundDelim    : boolean;
  booString     : boolean;
  intParenteses : integer;
begin
  if strArg='' then
    Pos := 0
  else
  begin
    FoundDelim := false;
    BooString := false;
    intParenteses := 0;
    N := 1;
    while (N<length(strArg)) and not FoundDelim do
    begin
      case StrArg[N] of
        '(' : if not booString then inc(intParenteses);
        ')' : if not booString then dec(intParenteses);
        '''' : booString := not booString;
      end;
      if (intParenteses=0) and not booString then
        if strArg[N]=ArgSeparator then
        begin
          FoundDelim := true;
          break;
        end;
      inc(N);
    end;
    if FoundDelim then
      Pos := N
    else
      Pos := 0;
  end;
end;

procedure TSZREvaluator.FindOp1(const strExpr : string; var Op : TSZREvOperator; var Pos, Len : integer);
var
  n : integer;
  booFound : boolean;
  intParenteses : integer;
  aString : string[255];
  booString : boolean;
begin
  n := 1;
  intParenteses := 0;
  booFound := false;
  Len := 1;
  aString := strExpr;
  booString := false;
  while (n < Length(strExpr)) and (not booFound) do
  begin
    booFound := true;
    case aString[N] of
      '(' : if not booString then inc(intParenteses);
      ')' : if not booString then dec(intParenteses);
      '''' : booString := not booString;
    end;
    if (intParenteses = 0) and (n > 1) and not booString then
      case aString[N] of
        '<' : begin
                if aString[N + 1] = '>' then
                begin
                  Op := opUnequal;
                  Len := 2;
                end else
                  if aString[N + 1] = '=' then
                  begin
                    Op := opLessOrEqual;
                    Len := 2;
                  end else
                    Op := opLess;
                end;
        '>' : if aString[N + 1] = '=' then
              begin
                Op := opGreaterOrEqual;
                Len := 2;
              end else
                Op := opGreater;
        '=' : Op := opEqual;
      else
        booFound := false;
      end
    else
      booFound := false;
    inc(N);
  end;
  if booFound then
    Pos := n - 1
  else
    Pos := -1;
end;

procedure TSZREvaluator.FindOp2(const strExpr : string; var Op : TSZREvOperator; var Pos, Len : integer);
var
  n : integer;
  booFound : boolean;
  intParenteses : integer;
  booString : boolean;
  aString : string[255];
begin
  n := 1;
  intParenteses := 0;
  booFound := false;
  booString := false;
  aString := strExpr;
  Len := 1;
  while (n < Length(strExpr)) and (not booFound) do
  begin
    booFound := true;
    case aString[N] of
      '(' : if not boostring then inc(intParenteses);
      ')' : if not boostring then dec(intParenteses);
      '''': booString := not booString;
    end;
    if (intParenteses = 0) and (not booString) and (N > 1) then
      case aString[N] of
        '+' : Op := opPlus;
        '-' : Op := opMinus;
        ' ' : if (AnsiLowercase(copy(strExpr, N + 1, 3)) = 'or ') then
              begin
                Op := opOr;
                Len := 2;
                inc(N);
              end else
                booFound := false;
      else
        booFound := false;
    end else
      booFound := false;
    inc(N);
  end;
  if booFound then
    Pos := N - 1
  else
    Pos := -1;
end;

procedure TSZREvaluator.FindOp3(const strExpr : string; var Op : TSZREvOperator; var Pos, Len : integer);
var
  n : integer;
  booFound : boolean;
  intParenteses : integer;
  booString : boolean;
  aString : string[255];
begin
  n := 1;
  intParenteses := 0;
  booFound := false;
  booString := false;
  Len := 1;
  aString := strExpr;
  while (N < Length(strExpr)) and (not booFound) do
  begin
    booFound := true;
    case aString[N] of
      '(' : if not booString then inc(intParenteses);
      ')' : if not booString then dec(intParenteses);
      '''': booString := not booString;
    end;
    if (intParenteses = 0) and (not booString) and (N > 1) then
    begin
      case aString[N] of
        '*' : Op := opMul;
        '/' : Op := opDiv;
        ' ' : if (AnsiLowercase(copy(strExpr, n + 1, 4)) = 'and ') then
              begin
                Op := opAnd;
                Len := 3;
                inc(N);
              end else
                booFound := false;
      else
        booFound := false;
    end;
  end else
    booFound := false;
    inc(N);
  end;
  if booFound then
    Pos := N - 1
  else
    Pos := -1;
end;

function TSZREvaluator.NegateResult(const Res : TSZREvValue) : TSZREvValue;
begin
  result.Kind := Res.Kind;
  case Res.Kind of
    valInteger: Result.intResult := - Res.intResult;
    valDouble : Result.dblResult := -Res.dblResult;
    valBoolean: Result.booResult := not Res.booResult;
  else
    Result.Kind := valError;
  end;
end;

function TSZREvaluator.EvalVariable(strVariable : string) : TSZREvValue;
var
  SeparatorPos : integer;
  DSName : string;
  FieldName : string;
  aDataSet : TDataSet;
  aField : TField;
  I : integer;
begin
  if assigned(FDataSets) then
  begin
    SeparatorPos := AnsiPos('.', strVariable);
    DSName := AnsiUpperCase(copy(StrVariable, 1, SeparatorPos - 1));
    FieldName := AnsiUpperCase(copy(strVariable, SeparatorPos + 1, length(StrVariable) - SeparatorPos));
    aField := nil;
    aDataSet := nil;
    if length(DSName)>0 then
    begin
      for I := 0 to FDataSets.Count - 1 do
        if AnsiUpperCase(TDataSet(FDataSets[I]).Name) = DSName then
        begin
          aDataSet := TDataSet(FDataSets[I]);
          break;
        end;
      if aDataSet<>nil then
        aField := aDataSet.FindField(FieldName);
    end else
    begin
      for I := 0 to FDataSets.Count - 1 do
        with TDataSet(FDataSets[I]) do
        begin
          aField := FindField(FieldName);
          if aField <> nil then break;
        end;
    end;
    if aField <> nil then
      FiFo.Put(TSZREvElementDataField.CreateField(aField))
    else
      FiFo.Put(TSZREvElementError.Create);
  end else
    FiFo.Put(TSZREvElementError.Create);
end;

function TSZREvaluator.EvalString(const strString : string) : TSZREvValue;
begin
  result.Kind := valString;
  result.strResult := strString;
  FiFo.Put(TSZREvElementString.CreateString(Result.StrResult));
end;

function TSZREvaluator.EvalFunction(strFunc : string; const strArg : string) : TSZREvValue;
var
  DelimPos : integer;
  aString : string;
  Res : TSZREvValue;
  aFunc : TSZREvElement;
begin
  StrFunc := AnsiUpperCase(StrFunc);
  aFunc := ZRFunctionLibrary.GetFunction(strFunc);
  if AFunc is TSZREvElementError then
  begin
    if StrArg = '' then
    begin
      AFunc.Free;
      EvalVariable(StrFunc)
    end else
      FiFo.Put(AFunc);
  end else
  begin
    FiFo.Put(AFunc);
    if not (aFunc is TSZREvElementError) then
    begin
      aString := strArg;
      repeat
        FindDelimiter(aString, DelimPos);
        if DelimPos > 0 then
          Res := Evaluate(copy(aString, 1, DelimPos - 1))
        else
          if length(aString) > 0 then Res := Evaluate(aString);
        Delete(aString, 1, DelimPos);
      until DelimPos = 0;
    end;
    FiFo.Put(TSZREvElementArgumentEnd.Create);
  end;
end;

function TSZREvaluator.EvalConstant(const strConstant : string) : TSZREvValue;
var
  N : integer;
  aString : string[255];
begin
  N := 1;
  aString := strConstant;
  while (N <= Length(aString)) and  (aString[N] in ['0'..'9']) do
    inc(N);
  result.Kind := valInteger;
  while ((N <= Length(aString)) and (aString[N] in ['0'..'9', '.', 'e', 'E', '+', '-'])) do
  begin
    inc(N);
    result.Kind := valDouble;
  end;
  if N - 1 <> Length(aString) then
    result.Kind := valError
  else
  begin
    if result.Kind = valInteger then
      result.intResult := StrToInt(aString)
    else
      if result.Kind = valDouble then
      begin
        if DecimalSeparator <> '.' then
        begin
          while pos('.', aString) > 0 do
            aString[pos('.', aString)] := DecimalSeparator;
        end;
        result.dblResult := StrToFloat(aString);
      end;
  end;
  if result.Kind=valError then
    FiFo.Put(TSZREvElementError.Create)
  else
    FiFo.Put(TSZREvElementConstant.CreateConstant(Result));
end;

function TSZREvaluator.EvalFunctionExpr(const strFunc : string) : TSZREvValue;
var
  argRes : TSZREvValue;
  po : integer;
begin
  po := AnsiPos('(', StrFunc);
  if po > 0 then
  begin
    if copy(StrFunc, length(StrFunc), 1) = ')' then
    begin
      result := EvalFunction(copy(StrFunc, 1, po - 1), copy(StrFunc, po + 1, length(strFunc) - po - 1));
    end else
    begin
      argRes.Kind := valError;
      result := EvalFunction('', '');
    end;
  end else
  begin
    argRes.Kind := valError;
    result := EvalFunction(StrFunc, '');
  end;
end;

function TSZREvaluator.EvalFactor(strFactorExpr : string) : TSZREvValue;
var
  aString : string[255];
begin
  TrimString(strFactorExpr);
  aString := strFactorExpr;
  if (AnsiLowerCase(Copy(strFactorExpr, 1, 3)) = 'not') then
    result := NegateResult(EvalFactor(Copy(strFactorExpr, 4, Length(strFactorExpr))))
  else
    case aString[1] of
      '(' : if strFactorExpr[Length(strFactorExpr)] = ')' then
              result := Evaluate(Copy(strFactorExpr, 2, Length(strFactorExpr) - 2))
            else
              result.Kind := valError;
      '-' : result := NegateResult(EvalFactor(Copy(strFactorExpr, 2, Length(strFactorExpr))));
      '+' : result := EvalFactor(Copy(strFactorExpr, 2, Length(strFactorExpr)));
      '0'..'9' : result := EvalConstant(strFactorExpr);
      '''' : if aString[Length(strFactorExpr)] = '''' then
               result := EvalString(Copy(strFactorExpr, 2, Length(strFactorExpr) - 2))
             else
             begin
               result.Kind := valError;
               FiFo.Put(TSZREvElementError.Create);
             end;
      '[' : if aString[Length(strFactorExpr)] = ']' then
              result := EvalVariable(Copy(strFactorExpr, 2, Length(strFactorExpr) - 2))
            else
              result.Kind := valError;
      'A'..'Z', 'a'..'z' : result := EvalFunctionExpr(strFactorExpr);
    else
    begin
      FiFo.Put(TSZREvElementError.Create);
      result.Kind := valError;
    end;
  end;
end;

function TSZREvaluator.EvalSimpleExpr(const strSimplExpr : string) : TSZREvValue;
var
  op : TSZREvOperator;
  intStart,
  intLen : integer;
  Res1,
  Res2 : TSZREvValue;
begin
  FindOp2(strSimplExpr, op, intStart, intLen);
  if intStart > 0 then
  begin
    FiFo.Put(TSZREvElementOperator.CreateOperator(Op));
    Res1 := EvalTerm(Copy(strSimplExpr, 1, intStart - 1));
    Res2 := EvalSimpleExpr(Copy(strSimplExpr, intStart + intLen, Length(strSimplExpr)));
  end else
    result := EvalTerm(strSimplExpr);
end;

function TSZREvaluator.EvalTerm(const strTermExpr : string) : TSZREvValue;
var
  op : TSZREvOperator;
  intStart,
  intLen : integer;
  Res1,
  Res2 : TSZREvValue;
begin
  FindOp3(strTermExpr, op, intStart, intLen);
  if intStart > 0 then
  begin
    FiFo.Put(TSZREvElementOperator.CreateOperator(Op));
    Res1 := EvalFactor(Copy(strTermExpr, 1, intStart - 1));
    Res2 := EvalTerm(Copy(strTermExpr, intStart + intLen, Length(strTermExpr)));
  end else
    result := EvalFactor(strTermExpr);
end;

function TSZREvaluator.Evaluate(const strExpr : string) : TSZREvValue;
var
  op : TSZREvOperator;
  intStart,
  intLen : integer;
  Res1,
  Res2 : TSZREvValue;
begin
  FindOp1(strExpr, op, intStart, intLen);
  if intStart > 0 then
  begin
    FiFo.Put(TSZREvElementOperator.CreateOperator(Op));
    Res1 := EvalSimpleExpr(Copy(strExpr, 1, intStart - 1));
    Res2 := EvalSimpleExpr(Copy(strExpr, intStart + intLen, Length(strExpr)));
  end else
    result := EvalSimpleExpr(strExpr);
end;

procedure TSZREvaluator.Prepare(const strExpr : string);
var
  Value : TSZREvValue;
begin
  if Prepared then Unprepare;
  FiFo := TSZRFiFo.Create;
  if strExpr = '' then
    Value := Evaluate(''' ''')
  else
    Value := Evaluate(strExpr);
  Prepared := true;
end;

procedure TSZREvaluator.UnPrepare;
begin
  if Assigned(FiFo) then
    begin
      FiFo.Free;
      FiFo:= nil;
    end;
  Prepared := false;
end;

procedure TSZREvaluator.Reset;
var
  I : integer;
begin
  for I := 0 to FiFo.fFiFo.Count - 1 do
    TSZREvElement(FiFo.fFiFo[I]).Reset;
end;

function TSZREvaluator.Value : TSZREvValue;
begin
  FiFo.Start;
  Result := TSZREvElement(FiFo.Get).Value(FiFo);
end;

function TSZREvaluator.GetIsAggreg : boolean;
var
  I : integer;
begin
  Result := false;
  for I := 0 to FiFo.fFiFo.Count - 1 do
    Result := Result or TSZREvElement(FiFo.fFiFo[I]).IsAggreg;
end;

function TSZREvaluator.GetAggregate : boolean;
begin
  Result := FiFo.Aggreg;
end;

procedure TSZREvaluator.SetAggregate(Value : boolean);
begin
  FiFo.Aggreg := Value;
end;

function TSZREvaluator.Calculate(const strExpr : string) : TSZREvValue;
begin
  Prepare(strExpr);
  result := Value;
  UnPrepare;
end;

initialization
  ZRFunctionLibrary := TSZRFunctionLibrary.Create;

  { Register ZREvaluator functions }
  RegisterZRFunction(TSZREvIfFunction,'IF', 'IF(<Exp>, <X>, <Y>)|' + LoadStr(SzrIfDesc), LoadStr(SzrQSD), '5BVV');
  RegisterZRFunction(TSZREvStrFunction, 'STR', 'STR(<X>)|' + LoadStr(SzrStrDesc), LoadStr(SzrQSD), '7N');
  RegisterZRFunction(TSZREvUpperFunction, 'UPPER', 'UPPER(<X>)|' + LoadStr(SzrUpperDesc), LoadStr(SzrQSD), '7S');
  RegisterZRFunction(TSZREvLowerFunction, 'LOWER', 'LOWER(<X>)|' + LoadStr(SzrLowerDesc), LoadStr(SzrQSD), '7S');
  RegisterZRFunction(TSZREvPrettyFunction, 'PRETTY', 'PRETTY(<X>)|' + LoadStr(SzrPrettyDesc), LoadStr(SzrQSD), '7S');
  RegisterZRFunction(TSZREvTimeFunction, 'TIME', 'TIME|' + LoadStr(SzrTimeDesc), LoadStr(SzrQSD), '1');
  RegisterZRFunction(TSZREvDateFunction, 'DATE', 'DATE|' + LoadStr(SzrDateDesc), LoadStr(SzrQSD), '1');
  RegisterZRFunction(TSZREvCopyFunction, 'COPY', 'COPY(<X>, <St>,<Len>)|' + LoadStr(SzrCopyDesc), LoadStr(SzrQSD), '7SNN');
  RegisterZRFunction(TSZREvSumFunction, 'SUM', 'SUM(<X>)|' + LoadStr(SzrSumDesc), LoadStr(SzrQSD), '3N');
  RegisterZRFunction(TSZREvCountFunction, 'COUNT', 'COUNT|'+ LoadStr(SzrCountDesc), LoadStr(SzrQSD), '3');
  RegisterZRFunction(TSZREvMaxFunction, 'MAX', 'MAX(<X>)|' + LoadStr(SzrMaxDesc), LoadStr(SzrQSD), '3V');
  RegisterZRFunction(TSZREvMinFunction, 'MIN', 'MIN(<X>)|' + LoadStr(SzrMinDesc), LoadStr(SzrQSD), '3V');
  RegisterZRFunction(TSZREvAverageFunction, 'AVERAGE', 'AVERAGE(<X>)|' + LoadStr(SzrAverageDesc), LoadStr(SzrQSD), '3N');
  RegisterZRFunction(TSZREvTrue, 'TRUE', 'TRUE|' + LoadStr(SzrBoolDesc), LoadStr(SzrQSD), '5');
  RegisterZRFunction(TSZREvFalse, 'FALSE', 'FALSE|' + LoadStr(SzrBoolDesc), LoadStr(SzrQSD), '5');
  RegisterZRFunction(TSZREvIntFunction, 'INT', 'INT(<X>)|' + LoadStr(SzrIntDesc), LoadStr(SzrQSD), '2N');
  RegisterZRFunction(TSZREvFracFunction, 'FRAC', 'FRAC(<X>)|' + LoadStr(SzrFracDesc), LoadStr(SzrQSD), '2N');
  RegisterZRFunction(TSZREvSQRTFunction, 'SQRT', 'SQRT(<X>)|' + LoadStr(SzrSqrtDesc), LoadStr(SzrQSD), '2N');
  RegisterZRFunction(TSZREvTypeOfFunction, 'TYPEOF', 'TYPEOF(<Exp>)|' + LoadStr(SzrTypeofDesc), LoadStr(SzrQSD), '6N');
  RegisterZRFunction(TSZREvFormatFloatFunction,'FORMATFLOAT', 'FORMATFLOAT(<F>,<N>|' + LoadStr(SzrFormatFloatDesc), LoadStr(SzrQSD), '7SN');
  RegisterZRFunction(TSZREvFormatFloatFunction,'FORMATNUMERIC', 'FORMATNUMERIC(<F>,<N>|' + LoadStr(SzrFormatFloatDesc), LoadStr(SzrQSD), '7SN');

finalization
  ZRFunctionLibrary.Free;

end.

