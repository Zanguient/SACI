unit ZREval;

{$B-}

interface

uses
  Windows, WinSpool, Sysutils, Messages, Classes, Controls, StdCtrls, ExtCtrls,
  ComCtrls, Buttons, Printers, Graphics, Forms, Dialogs, DB, DBTables, ZRPrntr;

type
  { TSZRLibraryEntry }
  TSZRLibraryItemClass = class of TObject;

  TSZRLibraryEntry = class
    private
      fName        : String;
      fDescription : String;
      fVendor      : String;
      fItem        : TSZRLibraryItemClass;
    public
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
      procedure Add(aItem : TSZRLibraryItemClass; aName, aDescription, aVendor: String);
      property Entries : TStrings read fEntries write fEntries;
      property Entry[Index : integer] : TSZRLibraryEntry read GetEntry; defaut;
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

  TSZREvValueKind = (valInteger, valDouble, valString, valBoolean, valDate, valError);

  TSZREvValueType = record
    case Kind : TSZREvValueKind of
      valInteger: (intResult : Longint);
      valDouble : (dblResult : Double);
      valString : (strResult : String[255]);
      valDate   : (datResult : TDateTime);
      valBool   : (booResult : Boolean);
  end;

  TSZREvResult = class
    public
      Value : TSZREvValueType;
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
      function  Value(FiFo : TSZRFiFo) : TSZREvResult; virtual;
      procedure Reset; virtual;
      property IsAggreg : Boolean read fIsAggreg write fIsAggreg;
  end;

  TSZREvElementFunction = class(TSZREvElement)
    private
    protected
      ArgList : TList;
      function  ArgumentOK(Value : TSZREvElement) : Boolean;
      function  Argument(Index : Integer) : TSZREvResult;
      procedure FreeArguments;
      procedure GetArguments(FiFo : TSZRFiFo);
      procedure Aggregate; virtual;
      function  Calculate : TSZREvResult; virtual;
    public
      constructor Create; override;
      destructor Destroy; override;
      function Value(FiFo : TSZRFiFo) : TSZREvResult; override;
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
      function Value(FiFo : TSZRFiFo) : TSZREvResult; override;
  end;

  TSZREvElementError = class(TSZREvElement)
    public
      function Value(FiFo : TSZRFiFo) : TSZREvResult; override;
  end;

  { TSZREvaluator class }

  TSZREvaluator = class (TObject)
    private
      fDataSets  : TList;
      FiFo       : TSZRFiFo;
      fPrepared  : Boolean;
      function  EvalFunctionExpr(const strFunc : String) : TSZREvResult;
      function  EvalSimpleExpr(const strSimplExpr : String) : TSZREvResult;
      function  EvalTerm(const strTermExpr : String) : TSZREvResult;
      function  EvalFactor(strFactorExpr : String) : TSZREvResult;
      function  EvalString(const strString : String) : TSZREvResult;
      function  EvalConstant(const strConstant : String) : TSZREvResult;
      function  GetAggregate : Boolean;
      function  NegateResult(const Res : TSZREvResult) : TSZREvResult;
      function  Evaluate(const strExpr : String) : TSZREvResult;
      procedure FindDelimiter(strArg : String; var Pos : Integer);
      procedure FindOp1(const strExpr : String; var Op : TSZREvOperator; var Pos, Len : Integer);
      procedure FindOp2(const strExpr : String; var Op : TSZREvOperator; var Pos, Len : Integer);
      procedure FindOp3(const strExpr : String; var Op : TSZREvOperator; var Pos, Len : Integer);
      procedure SetAggregate(Value : Boolean);
      procedure TrimString(var strString : String);
    protected
      function EvalFunction(strFunc : String; const strArg : String) : TSZREvResult; virtual;
      function EvalVariable(strVariable : String) : TSZREvResult; virtual;
      function GetIsAggreg : Boolean;
    public
      constructor Create;
      destructor Destroy; override;
      function  Calculate(const StrExpr : String) : TSZREvResult;
      function  Value : TSZREvResult;
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
  ZRStrUtl, ZRConst, ZReport;

function Calculate(Formula: String; Values: array of const): Variant;
var
  E: TSZREvaluator;
  R: TSZREvResult;
begin
  Formula:= Format(Formula, Values);
  E:= TSZREvaluator.Create;
  try
    R:= E.Calculate(Formula);
    case R.Kind of
      resInteger: Result:= R.intResult;
      resDouble : Result:= R.dblResult;
      resString : Result:= R.strResult;
      resBool   : Result:= R.booResult;
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

procedure TSZRLibrary.Add(aItem : TSZRLibraryItemClass; aName, aDescription, aVendor: String);
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
  for I := 0 to FiFo.Count-1 do
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

function TSZREvElement.Value(FiFo : TSZRFiFo) : TSZREvResult;
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
    procedure ConverTSZREvResults(var Res1 : TSZREvResult; var Res2 : TSZREvResult);
  public
    constructor CreateOperator(Code : TSZREvOperator);
    function Value(FiFo : TSZRFiFo) : TSZREvResult; override;
  end;

constructor TSZREvElementOperator.CreateOperator(Code : TSZREvOperator);
begin
  inherited Create;
  fCode := Code;
end;

procedure TSZREvElementOperator.ConverTSZREvResults(var Res1 : TSZREvResult; var Res2 : TSZREvResult);
begin
  if Res1.Kind <> Res2.Kind then
    begin
      if ((Res1.Kind = resInteger) and (Res2.Kind = resDouble)) then
        begin
          Res1.Kind      := resDouble;
          Res1.dblResult := Res1.intResult;
        end else
      if ((Res1.Kind = resDouble) and (Res2.Kind = resInteger)) then
        begin
          Res2.Kind      := resDouble;
          Res2.dblResult := Res2.intResult;
        end
      else
        begin
          Res1.Kind := resError;
          Res2.Kind := resError;
        end;
    end;
end;

function TSZREvElementOperator.Value(FiFo : TSZRFiFo) : TSZREvResult;
var
  Res1,
  Res2 : TSZREvResult;
begin
  Res1 := TSZREvElement(FiFo.Get).Value(FiFo);
  Res2 := TSZREvElement(FiFo.Get).Value(FiFo);
  ConverTSZREvResults(Res1, Res2);
  Result.Kind := Res1.Kind;
  if Result.Kind <> resError then
    case fCode of
      opPlus: case result.Kind of
                resInteger: result.intResult := Res1.intResult + Res2.intResult;
                resDouble : result.dblResult := Res1.dblResult + Res2.dblResult;
                resDate   : result.datResult := Res1.datResult + Res2.datResult;
                resString : result.strResult := Res1.strResult + Res2.strResult;
                resBoolean: result.Kind := resError;
              end;
      opMinus:  case result.Kind of
                  resInteger: result.intResult := Res1.intResult - Res2.intResult;
                  resDouble : result.dblResult := Res1.dblResult - Res2.dblResult;
                  resDate   : result.datResult := Res1.datResult - Res2.datResult;
                  resString : result.Kind := resError;
                  resBoolean: result.Kind := resError;
                end;
      opMul: case result.Kind of
               resInteger: result.intResult := Res1.intResult * Res2.intResult;
               resDouble : result.dblResult := Res1.dblResult * Res2.dblResult;
               resString : result.Kind := resError;
               resDate   : Result.Kind := resError;
               resBoolean: result.Kind := resError;
             end;
      opMod: case result.Kind of
               resInteger: if Res2.intResult <> 0 then
                             Result.intResult := Res1.intResult mod Res2.intResult;
                           else
                             Result.Kind := resError;
               resDouble : Result.Kind := resError;
               resString : Result.Kind := resError;
               resDate   : Result.Kind := resError;
               resBoolean: Result.Kind := resError;
             end;
      opDiv: case result.Kind of
               resInteger: if Res2.intResult <> 0 then
                             Result.intResult := Res1.intResult div Res2.intResult;
                           else
                             Result.Kind := resError;
               resDouble : if Res2.dblResult <> 0 then
                             Result.dblResult := Res1.dblResult / Res2.dblResult
                           else
                             Result.Kind := resError;
               resDate   : Result.Kind := resError;
               resString : Result.Kind := resError;
               resBoolean: Result.Kind := resError;
             end;
      opGreater: begin
                   result.Kind := resBool;
                   case Res1.Kind of
                     resInteger: result.booResult := Res1.intResult > Res2.intResult;
                     resDouble : result.booResult := Res1.dblResult > Res2.dblResult;
                     resString : result.booResult := Res1.strResult > Res2.strResult;
                     resDate   : result.booResult := Res1.datResult > Res2.datResult;
                     resBoolean: result.Kind := resError;
                   end;
                 end;
      opGreaterOrEqual: begin
                result.Kind := resBool;
                case Res1.Kind of
                  resInteger: result.booResult := Res1.intResult >= Res2.intResult;
                  resDouble : result.booResult := Res1.dblResult >= Res2.dblResult;
                  resString : result.booResult := Res1.strResult >= Res2.strResult;
                  resDate   : result.booResult := Res1.datResult >= Res2.datResult;
                  resBoolean: result.Kind := resError;
                end;
             end;
      opLess: begin
                result.Kind := resBool;
                case Res1.Kind of
                  resInteger: result.booResult := Res1.intResult < Res2.intResult;
                  resDouble : result.booResult := Res1.dblResult < Res2.dblResult;
                  resString : result.booResult := Res1.strResult < Res2.strResult;
                  resDate   : result.booResult := Res1.datResult < Res2.datResult;
                  resBoolean: result.Kind := resError;
                end;
              end;
      opLessOrEqual: begin
                 result.Kind := resBool;
                 case Res1.Kind of
                   resInteger: result.booResult := Res1.intResult <= Res2.intResult;
                   resDouble : result.booResult := Res1.dblResult <= Res2.dblResult;
                   resString : result.booResult := Res1.strResult <= Res2.strResult;
                   resDate   : result.booResult := Res1.datResult <= Res2.datResult;
                   resBoolean: result.Kind := resError;
                 end;
               end;
      opEqual: begin
                 result.Kind := resBool;
                 case Res1.Kind of
                   resInteger: result.booResult := Res1.intResult = Res2.intResult;
                   resDouble : result.booResult := Res1.dblResult = Res2.dblResult;
                   resString : result.booResult := Res1.strResult = Res2.strResult;
                   resBoolean: result.booResult := Res1.booResult = Res2.booResult;
                   resDate   : result.booResult := Res1.datResult = Res2.datResult;
                 end;
               end;
      opUnequal: begin
                   result.Kind := resBool;
                   case Res1.Kind of
                     resInteger: result.booResult := Res1.intResult <> Res2.intResult;
                     resDouble : result.booResult := Res1.dblResult <> Res2.dblResult;
                     resString : result.booResult := Res1.strResult <> Res2.strResult;
                     resBoolean: result.booResult := Res1.booResult <> Res2.booResult;
                     resDate   : result.booResult := Res1.datResult <> Res2.datResult;
                   end;
                 end;
      opOr: begin
              result.Kind := Res1.Kind;
              case Res1.Kind of
                resInteger: result.intResult := Res1.intResult or Res2.intResult;
                resDouble : result.Kind := resError;
                resDate   : result.Kind := resError;
                resString : Result.Kind := resError;
                resBoolean: result.booResult := Res1.booResult or Res2.booResult;
              end;
            end;
      opAnd: begin
               result.Kind := Res1.Kind;
               case Res1.Kind of
                 resInteger: result.intResult := Res1.intResult and Res2.intResult;
                 resDouble : result.Kind := resError;
                 resDate   : result.Kind := resError;
                 resString : result.Kind := resError;
                 resBoolean: result.booResult := Res1.booResult and Res2.booResult;
               end;
             end;
    end;
end;

{ TSZREvElementConstant }

type
  TSZREvElementConstant = class(TSZREvElement)
  private
    fValue : TSZREvResult;
  public
    constructor CreateConstant(Value : TSZREvResult);
    function Value(FiFo : TSZRFiFo) : TSZREvResult; override;
  end;

constructor TSZREvElementConstant.CreateConstant(Value : TSZREvresult);
begin
  inherited Create;
  fValue := Value;
end;

function TSZREvElementConstant.Value(FiFo : TSZRFiFo): TSZREvResult;
begin
  Result := fValue;
end;

{ TSZREvElementString }

type
  TSZREvElementString = class(TSZREvElement)
  private
    fValue : string;
  public
    constructor CreateString(Value : string);
    function Value(FiFo : TSZRFiFo) : TSZREvResult; override;
  end;

constructor TSZREvElementString.CreateString(Value : string);
begin
  inherited Create;
  fValue := Value;
end;

function TSZREvElementString.Value(FiFo : TSZRFiFo) : TSZREvResult;
begin
  Result.Kind      := resString;
  Result.StrResult := fValue;
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
  aArgument : TSZREvElement;
  AResult : TSZREvResultClass;
begin
  repeat
    aArgument := TSZREvElement(FiFo.Get);
    if not (aArgument is TSZREvElementArgumentEnd) then
    begin
      aResult := TSZREvResultClass.Create;
      aResult.EvResult := aArgument.Value(FiFo);
      ArgList.Add(aResult);
    end;
  until aArgument is TSZREvElementArgumentEnd;
end;

procedure TSZREvElementFunction.FreeArguments;
var
  I : integer;
begin
  for I := 0 to ArgList.Count - 1 do
    TSZREvElement(ArgList.Items[I]).Free;
  ArgList.Clear;
end;

function TSZREvElementFunction.Argument(Index : integer): TSZREvResult;
begin
  if Index <= ArgList.Count then
    Result := TSZREvResultClass(ArgList[Index]).EvResult;
end;

function TSZREvElementFunction.Value(FiFo : TSZRFiFo) : TSZREvResult;
begin
  GetArguments(FiFo);
  if FiFo.Aggreg then
    Aggregate;
  Result := Calculate;
  FreeArguments;
end;

function TSZREvElementFunction.ArgumentOK(Value : TSZREvElement) : boolean;
begin
  Result := not (Value is TSZREvElementArgumentEnd) and not (Value is TSZREvElementError);
end;

procedure TSZREvElementFunction.Aggregate;
begin
end;

function TSZREvElementFunction.Calculate : TSZREvResult;
begin
  Result.Kind := resError;
end;

{ TSZREvTrue }

type
  TSZREvTrue = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

  TSZREvFalse = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvTrue.Calculate : TSZREvResult;
begin
  if ArgList.Count = 0 then
  begin
    Result.Kind := resBool;
    Result.booResult := true;
  end else
    Result.Kind := resError;
end;

function TSZREvFalse.Calculate : TSZREvResult;
begin
  if ArgList.Count = 0 then
  begin
    Result.Kind := resBool;
    Result.booResult := false;
  end else
    Result.Kind := resError;
end;

{ TSZREvIfFunction }

type
  TSZREvIfFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvIfFunction.Calculate : TSZREvResult;
begin
  if (ArgList.Count = 3) and (Argument(0).Kind = resBool) then
  begin
    if Argument(0).BooResult then
      Result := Argument(1)
    else
      Result := Argument(2);
  end else
    result.Kind := resError;
end;

{ TSZREvTypeOfFunction }

type
  TSZREvTypeOfFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvTypeOfFunction.Calculate : TSZREvResult;
begin
  Result.Kind := resString;
  if ArgList.Count = 1 then
  begin
    case Argument(0).Kind of
      resInteger: Result.StrResult := 'INTEGER';    {<-- do not resource }
      resDouble : Result.StrResult := 'FLOAT';   {<-- do not resource }
      resString : Result.StrResult := 'STRING';  {<-- do not resource }
      resBoolean: Result.StrResult := 'BOOLEAN';   {<-- do not resource }
      resDate   : Result.StrResult := 'DATE';   {<-- do not resource }
      resError  : Result.StrResult := 'ERROR';    {<-- do not resource }
    else
      Result.Kind := resError;
    end
  end else
    Result.Kind := resError;
end;

{ TSZREvIntFunction }

type
  TSZREvIntFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvIntFunction.Calculate : TSZREvResult;
begin
  Result.Kind := resInt;
  if ArgList.Count = 1 then
  begin
    case Argument(0).Kind of
      resInt : Result.IntResult := Argument(0).IntResult;
      resDouble : Result.IntResult := Round(Int(Argument(0).DblResult));
    else
      Result.Kind := resError;
    end
  end else
    Result.Kind := resError;
end;

{ TSZREvFracFunction }

type
  TSZREvFracFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvFracFunction.Calculate : TSZREvResult;
begin
  Result.Kind := resDouble;
  if ArgList.Count = 1 then
  begin
    case Argument(0).Kind of
      resInt : Result.DblResult := 0;
      resDouble : Result.DblResult := Frac(Argument(0).DblResult);
    else
      Result.Kind := resError;
    end
  end else
    Result.Kind := resError;
end;

{ TSZREvSQRTFunction }

type
  TSZREvSQRTFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvSQRTFunction.Calculate : TSZREvResult;
begin
  Result.Kind := resDouble;
  if ArgList.Count = 1 then
  begin
    case Argument(0).Kind of
      resInt : Result.DblResult := SQRT(Argument(0).IntResult);
      resDouble : Result.DblResult := SQRT(Argument(0).DblResult);
    else
      Result.Kind := resError;
    end
  end else
    Result.Kind := resError;
end;

{ TSZREvStrFunction }

type
  TSZREvStrFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvStrFunction.Calculate : TSZREvResult;
var
  ArgRes : TSZREvResult;
begin
  if ArgList.Count = 1 then
  begin
    ArgRes := Argument(0);
    Result.Kind := resString;
    case ArgRes.Kind of
      resInt : Result.strResult := IntToStr(ArgRes.IntResult);
      resDouble : Result.strResult := FloatToStr(ArgRes.DblResult);
      resBool : if ArgRes.booResult then
                result.StrResult := 'True'          {<-- do not resource }
              else
                result.StrResult := 'False';        {<-- do not resource }
    else
      result.Kind := resError;
    end
  end else
    Result.Kind := resError;
end;

{ TSZREvUpperFunction }

type
  TSZREvUpperFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvUpperFunction.Calculate : TSZREvResult;
begin
  if (ArgList.Count = 1) and (Argument(0).Kind = resString) then
  begin
    Result.Kind := resString;
    Result.StrResult := AnsiUpperCase(Argument(0).StrResult);
  end else
    Result.Kind := resError;
end;

{ TSZREvLowerFunction }

type
  TSZREvLowerFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvLowerFunction.Calculate : TSZREvResult;
begin
  if (ArgList.Count = 1) and (Argument(0).Kind = resString) then
  begin
    Result.Kind := resString;
    Result.StrResult := AnsiLowerCase(Argument(0).StrResult);
  end else
    Result.Kind := resError;
end;

{ TSZREvUpperFunction }

type
  TSZREvPrettyFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvPrettyFunction.Calculate : TSZREvResult;
begin
  if (ArgList.Count = 1) and (Argument(0).Kind = resString) then
  begin
    Result.Kind := resString;
    Result.StrResult := AnsiUpperCase(Copy(Argument(0).StrResult, 1, 1)) +
                        AnsiLowerCase(Copy(Argument(0).StrResult, 2, length(Argument(0).StrResult)));
  end else
    Result.Kind := resError;
end;

{ TSZREvTimeFunction }

type
  TSZREvTimeFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvTimeFunction.Calculate : TSZREvResult;
begin
  if ArgList.Count = 0 then
  begin
    Result.Kind := resString;
    Result.StrResult := TimeToStr(Now);
  end else
    Result.Kind := resError;
end;

{ TSZREvTimeFunction }

type
  TSZREvDateFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvDateFunction.Calculate : TSZREvResult;
begin
  if ArgList.Count=0 then
  begin
    Result.Kind := resString;
    Result.StrResult := DateToStr(Date);
  end else
    Result.Kind := resError;
end;

{ TSZREvCopyFunction }

type
  TSZREvCopyFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvCopyFunction.Calculate : TSZREvResult;
begin
  if (ArgList.Count = 3) and
    (Argument(0).Kind = resString) and
    (Argument(1).Kind = resInt) and
    (Argument(2).Kind = resInt) then
  begin
    Result.StrResult := copy(Argument(0).strResult, Argument(1).IntResult, Argument(2).IntResult);
    Result.Kind := resString;
  end else
    Result.Kind := resError;
end;

{ TSZREvFormatNumericFunction }

type
  TSZREvFormatNumericFunction = class(TSZREvElementFunction)
  public
    function Calculate : TSZREvResult; override;
  end;

function TSZREvFormatNumericFunction.Calculate : TSZREvResult;
begin
  if (ArgList.Count = 2) and
     ((Argument(1).Kind = resInt) or (Argument(1).Kind = resDouble)) and
     (Argument(0).Kind = resString) then
  begin
    Result.Kind := resString;
    if Argument(1).Kind = resInt then
      Result.StrResult := FormatFloat(Argument(0).StrResult, Argument(1).IntResult * 1.0)
    else
      Result.StrResult := FormatFloat(Argument(0).StrResult, Argument(1).DblResult);
  end else
    Result.Kind := resError;
end;

{ TSZREvSumFunction }

type
  TSZREvSumFunction = class(TSZREvElementFunction)
  private
    SumResult : TSZREvResult;
    ResAssigned : boolean;
  public
    constructor Create; override;
    procedure Aggregate; override;
    function Calculate : TSZREvResult; override;
    procedure Reset; override;
  end;

constructor TSZREvSumFunction.Create;
begin
  inherited Create;
  ResAssigned := false;
  IsAggreg := true;
end;

procedure TSZREvSumFunction.Reset;
begin
  ResAssigned := false;
end;

procedure TSZREvSumFunction.Aggregate;
var
  aValue : TSZREvResult;
begin
  if ArgList.Count = 1 then
  begin
    aValue := Argument(0);
    if ResAssigned then
    begin
      case aValue.Kind of
        resInt : SumResult.IntResult := SumResult.IntResult + aValue.IntResult;
        resDouble : SumResult.dblResult := SumResult.dblResult + aValue.dblResult;
        resString : SumResult.Kind := resError;
      end;
    end else
    begin
      SumResult.Kind := aValue.Kind;
      case aValue.Kind of
        resInt : SumResult.IntResult := aValue.IntResult;
        resDouble : SumResult.dblResult := aValue.dblResult;
      else
        SumResult.Kind := resError;
      end;
    end;
    ResAssigned := true;
  end else
    SumResult.Kind := resError;
end;

function TSZREvSumFunction.Calculate : TSZREvResult;
begin
  if ResAssigned then
    Result := SumResult
  else
    Result.Kind := resError;
end;

{ TSZREvAverageFunction }

type
  TSZREvAverageFunction = class(TSZREvSumFunction)
  private
    Count : longint;
    aResult : TSZREvResult;
  public
    function Calculate : TSZREvResult; override;
    procedure Aggregate; override;
    procedure Reset; override;
  end;

procedure TSZREvAverageFunction.Reset;
begin
  inherited Reset;
  aResult.Kind := resError;
  Count := 0;
  IsAggreg := true;
end;

procedure TSZREvAverageFunction.Aggregate;
var
  aValue : TSZREvResult;
begin
  inherited Aggregate;
  inc(Count);
  aValue := inherited Calculate;
  aResult.Kind := resDouble;
  case aValue.Kind of
    ResInt : aResult.DblResult := aValue.IntResult / Count;
    ResDouble : aResult.DblResult := aValue.DblResult / Count;
  else
    aResult.Kind := resError;
  end;
end;

function TSZREvAverageFunction.Calculate : TSZREvResult;
begin
  Result := aResult
end;

{ TSZREvMaxFunction }

type
  TSZREvMaxFunction = class(TSZREvElementFunction)
  private
    MaxResult : TSZREvResult;
    ResAssigned : boolean;
  public
    constructor Create; override;
    function Calculate : TSZREvResult; override;
    procedure Aggregate; override;
    procedure Reset; override;
  end;

constructor TSZREvMaxFunction.Create;
begin
  inherited Create;
  ResAssigned := false;
  IsAggreg := true;
end;

procedure TSZREvMaxFunction.Reset;
begin
  ResAssigned := false;
end;

procedure TSZREvMaxFunction.Aggregate;
var
  aValue : TSZREvResult;
begin
  if ArgList.Count = 1 then
  begin
    aValue := Argument(0);
    if ResAssigned then
    begin
      case MaxResult.Kind of
        resInt : if aValue.IntResult > MaxResult.IntResult then
                   MaxResult.IntResult := aValue.IntResult;
        resDouble : if aValue.DblResult > MaxResult.DblResult then
                      MaxResult.DblResult := aValue.DblResult;
        resString : if aValue.StrResult > MaxResult.StrResult then
                      MaxResult.StrResult := aValue.StrResult;
        resBool : if aValue.booResult > MaxResult.BooResult then
                    MaxResult.BooResult := aValue.BooResult;
      else
        MaxResult.Kind := resError;
      end
    end else
    begin
      MaxResult := aValue;
      ResAssigned := true;
    end
  end else
    MaxResult.Kind := resError;
end;

function TSZREvMaxFunction.Calculate : TSZREvResult;
begin
  if ResAssigned then
    Result := MaxResult
  else
    Result.Kind := resError;
end;

{ TSZREvMinFunction }

type
  TSZREvMinFunction = class(TSZREvElementFunction)
  private
    MinResult : TSZREvResult;
    ResAssigned : boolean;
  public
    constructor Create; override;
    function Calculate : TSZREvResult; override;
    procedure Aggregate; override;
    procedure Reset; override;
  end;

constructor TSZREvMinFunction.Create;
begin
  inherited Create;
  ResAssigned := false;
  IsAggreg := true;
end;

procedure TSZREvMinFunction.Reset;
begin
  ResAssigned := false;
end;

procedure TSZREvMinFunction.Aggregate;
var
  aValue : TSZREvResult;
begin
  if ArgList.Count = 1 then
  begin
    aValue := Argument(0);
    if ResAssigned then
    begin
      case MinResult.Kind of
        resInt : if aValue.IntResult < MinResult.IntResult then
                   MinResult.IntResult := aValue.IntResult;
        resDouble : if aValue.DblResult < MinResult.DblResult then
                      MinResult.DblResult := aValue.DblResult;
        resString : if aValue.StrResult < MinResult.StrResult then
                      MinResult.StrResult := aValue.StrResult;
        resBool : if aValue.booResult > MinResult.BooResult then
                    MinResult.BooResult := aValue.BooResult;
      else
        MinResult.Kind := resError;
      end
    end else
    begin
      MinResult := aValue;
      ResAssigned := true;
    end
  end else
    MinResult.Kind := resError;
end;

function TSZREvMinFunction.Calculate : TSZREvResult;
begin
  if ResAssigned then
    Result := MinResult
  else
    Result.Kind := resError;
end;

{ TSZREvCountFunction }

type
  TSZREvCountFunction = class(TSZREvElementFunction)
  private
    FCount : integer;
  public
    constructor Create; override;
    function Value(FiFo : TSZRFiFo) : TSZREvResult; override;
    procedure Reset; override;
  end;

constructor TSZREvCountFunction.Create;
begin
  inherited Create;
  FCount := 0;
  IsAggreg := true;
end;

function TSZREvCountFunction.Value(FiFo : TSZRFiFo) : TSZREvResult;
begin
  GetArguments(FiFo);
  if (ArgList.Count = 0) then
  begin
    if FiFo.Aggreg then
      inc(FCount);
    Result.Kind := resInt;
    Result.intResult := FCount;
  end else
    Result.Kind := resError;
  FreeArguments;
end;

procedure TSZREvCountFunction.Reset;
begin
  FCount := 0;
end;

{ TSZREvElementDataField }

constructor TSZREvElementDataField.CreateField(aField : TField);
begin
  inherited Create;
  FDataSet := aField.DataSet;
  FFieldNo := aField.Index;
  FField := aField;
end;

function TSZREvElementDataField.Value(FiFo : TSZRFiFo) : TSZREvResult;
begin
  if FDataSet.DefaultFields then
    FField := FDataSet.Fields[FFieldNo];
  if FField is TStringField then
  begin
    result.Kind := resString;
    result.strResult := TStringField(FField).Value;
  end else
    if (FField is TIntegerField) or
       (FField is TSmallIntField) or
       (FField is TWordField) then
    begin
      result.Kind := resInt;
      result.intResult := FField.AsInteger;
    end else
      if (FField is TFloatField)  or
         (FField is TCurrencyField) or
         (FField is TBCDField) then
      begin
        result.Kind := resDouble;
        result.dblResult := TFloatField(FField).AsFloat;
      end else
        if FField is TBooleanField then
        begin
          result.Kind := resBool;
          result.BooResult := TBooleanField(FField).Value;
        end else
          if FField is TDateField then
          begin
            result.Kind := resString;
            result.strResult := TDateField(FField).AsString;
          end else
            if FField is TDateTimeField then
            begin
              result.Kind := resString;
              result.strResult := TDateField(FField).AsString;
            end else
              result.Kind := resError
end;

function TSZREvElementError.Value(FiFo : TSZRFiFo) : TSZREvResult;
begin
  result.Kind := resError;
end;

{ TSZREvaluator }

constructor TSZREvaluator.Create;
begin
  Prepared := false;
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

function TSZREvaluator.NegateResult(const Res : TSZREvResult) : TSZREvResult;
begin
  result.Kind := Res.Kind;
  case Res.Kind of
    resInt: result.intResult := - Res.intResult;
    resDouble: result.dblResult := -Res.dblResult;
    resBool: result.booResult := not Res.booResult;
  else
    result.Kind := resError;
  end;
end;

function TSZREvaluator.EvalVariable(strVariable : string) : TSZREvResult;
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

function TSZREvaluator.EvalString(const strString : string) : TSZREvResult;
begin
  result.Kind := resString;
  result.strResult := strString;
  FiFo.Put(TSZREvElementString.CreateString(Result.StrResult));
end;

function TSZREvaluator.EvalFunction(strFunc : string; const strArg : string) : TSZREvResult;
var
  DelimPos : integer;
  aString : string;
  Res : TSZREvResult;
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

function TSZREvaluator.EvalConstant(const strConstant : string) : TSZREvResult;
var
  N : integer;
  aString : string[255];
begin
  N := 1;
  aString := strConstant;
  while (N <= Length(aString)) and  (aString[N] in ['0'..'9']) do
    inc(N);
  result.Kind := resInt;
  while ((N <= Length(aString)) and (aString[N] in ['0'..'9', '.', 'e', 'E', '+', '-'])) do
  begin
    inc(N);
    result.Kind := resDouble;
  end;
  if N - 1 <> Length(aString) then
    result.Kind := resError
  else
  begin
    if result.Kind = resInt then
      result.intResult := StrToInt(aString)
    else
      if result.Kind = resDouble then
      begin
        if DecimalSeparator <> '.' then
        begin
          while pos('.', aString) > 0 do
            aString[pos('.', aString)] := DecimalSeparator;
        end;
        result.dblResult := StrToFloat(aString);
      end;
  end;
  if result.Kind=resError then
    FiFo.Put(TSZREvElementError.Create)
  else
    FiFo.Put(TSZREvElementConstant.CreateConstant(Result));
end;

function TSZREvaluator.EvalFunctionExpr(const strFunc : string) : TSZREvResult;
var
  argRes : TSZREvResult;
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
      argRes.Kind := resError;
      result := EvalFunction('', '');
    end;
  end else
  begin
    argRes.Kind := resError;
    result := EvalFunction(StrFunc, '');
  end;
end;

function TSZREvaluator.EvalFactor(strFactorExpr : string) : TSZREvResult;
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
              result.Kind := resError;
      '-' : result := NegateResult(EvalFactor(Copy(strFactorExpr, 2, Length(strFactorExpr))));
      '+' : result := EvalFactor(Copy(strFactorExpr, 2, Length(strFactorExpr)));
      '0'..'9' : result := EvalConstant(strFactorExpr);
      '''' : if aString[Length(strFactorExpr)] = '''' then
               result := EvalString(Copy(strFactorExpr, 2, Length(strFactorExpr) - 2))
             else
             begin
               result.Kind := resError;
               FiFo.Put(TSZREvElementError.Create);
             end;
      '[' : if aString[Length(strFactorExpr)] = ']' then
              result := EvalVariable(Copy(strFactorExpr, 2, Length(strFactorExpr) - 2))
            else
              result.Kind := resError;
      'A'..'Z', 'a'..'z' : result := EvalFunctionExpr(strFactorExpr);
    else
    begin
      FiFo.Put(TSZREvElementError.Create);
      result.Kind := resError;
    end;
  end;
end;

function TSZREvaluator.EvalSimpleExpr(const strSimplExpr : string) : TSZREvResult;
var
  op : TSZREvOperator;
  intStart,
  intLen : integer;
  Res1,
  Res2 : TSZREvResult;
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

function TSZREvaluator.EvalTerm(const strTermExpr : string) : TSZREvResult;
var
  op : TSZREvOperator;
  intStart,
  intLen : integer;
  Res1,
  Res2 : TSZREvResult;
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

function TSZREvaluator.Evaluate(const strExpr : string) : TSZREvResult;
var
  op : TSZREvOperator;
  intStart,
  intLen : integer;
  Res1,
  Res2 : TSZREvResult;
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
  Value : TSZREvResult;
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
  for I := 0 to FiFo.FiFo.Count - 1 do
    TSZREvElement(FiFo.FiFo[I]).Reset;
end;

function TSZREvaluator.Value : TSZREvResult;
begin
  FiFo.Start;
  Result := TSZREvElement(FiFo.Get).Value(FiFo);
end;

function TSZREvaluator.GetIsAggreg : boolean;
var
  I : integer;
begin
  Result := false;
  for I := 0 to FiFo.FiFo.Count - 1 do
    Result := Result or TSZREvElement(FiFo.FiFo[I]).IsAggreg;
end;

function TSZREvaluator.GetAggregate : boolean;
begin
  Result := FiFo.Aggreg;
end;

procedure TSZREvaluator.SetAggregate(Value : boolean);
begin
  FiFo.Aggreg := Value;
end;

function TSZREvaluator.Calculate(const strExpr : string) : TSZREvResult;
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
  RegisterZRFunction(TSZREvFormatNumericFunction,'FORMATNUMERIC', 'FORMATNUMERIC(<F>,<N>|' + LoadStr(SzrFormatNumericDesc), LoadStr(SzrQSD), '7SN');

finalization
  ZRFunctionLibrary.Free;

end.



type
  TSZREvaluator = class
    private
      fExpression: String;
    protected
    public
      constructor Create; override;
      destructor  Destroy; override;
      procedure Prepare;
      property Expression: String read fExpression write fExpression default '';
  end;
  
constructor TSZREvaluator.Create;
begin
  fExpression:= '';
end;

destructor TSZREvaluator.Destroy;
begin
end;

procedure TSZREvaluator.Prepare;
var
  Stream: TStringStream;
  Parser: TParser;
  
  procedure ProcessToken;
  begin
    case Parser.Token of
      toSymbol :
      toString :
      toInteger:
      toFloat  :
    end;
  end;
  
begin
  Stream:= TStringStream.Create(fExpression);
  Parser:= TParser.Create(Stream);
  try
    while Parser.Token <> toEOF do
      begin
        ProcessToken;
        Parser.NextToken;
      end;
  finally
    Parser.Free;
    Stream.Free;
  end;
end;


