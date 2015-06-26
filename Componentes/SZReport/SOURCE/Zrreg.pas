unit ZRReg;

interface

procedure Register;

implementation

uses
  SysUtils, Classes, Graphics, Dialogs,
  Forms, DB, TypInfo, ZReport, ZRCtrls,
  ZRPrntr, ZREval, ZRPrgres, ZRPrev, dsgnintf;

{$R ZReport.RES}

{ TDataFieldProperty }
type
  TSZRDBStringProperty = class(TStringProperty)
    public
      function GetAttributes: TPropertyAttributes; override;
      procedure GetValueList(List: TStrings); virtual; abstract;
      procedure GetValues(Proc: TGetStrProc); override;
  end;

function TSZRDBStringProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TSZRDBStringProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

type
  TSZREscapeProperty = class(TStringProperty)
    public
      function  GetAttributes: TPropertyAttributes; override;
      function  GetValue: String; override;
      procedure SetValue(const Value: String);  override;
  end;

function TSZREscapeProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect];
end;

function TSZREscapeProperty.GetValue: String;
var
  Value: String;

  function IsCode(i: Integer; var S: String): Boolean;
  begin
    Result:= Value[i] < #32;
    if Result then
      S:= '#' + IntToStr(Byte(Value[i]))
    else
      S:= Value[i];
  end;

var
  i: Integer;
  S: String;
  C: Boolean;
begin
  Value := GetStrValue;
  Result:= '';
  i:= 1;
  C:= True;
  while i <= Length(Value) do
    begin
      if IsCode(i, S) then
        begin
          if not C then Result:= Result + '''';
          C:= True;
        end
      else
        if C then
          begin
            Result:= Result + '''';
            C     := False;
          end;
      Result:= Result + S;
      Inc(i);
    end;
  if not C then Result:= Result + '''';
end;

procedure TSZREscapeProperty.SetValue(const Value: String);
var
  i, pc, ps: Integer;
  C        : Boolean;
  R        : String;
begin
  i:= 1;
  while i<=Length(Value) do
    begin
      if (Value[i] = '#') or (Value[i] = '''') then
        begin
          ps:= Pos('''', copy(Value, i+1, Length(Value)));
          pc:= Pos('#' , copy(Value, i+1, Length(Value)));
          if (pc = 0) or (ps > 0) and (ps < pc) then pc:= ps;
          if pc = 0 then pc:= Length(Value);
          if Value[i] = '#' then
            R:= R + Char(StrToInt(copy(Value, i+1, pc-1)))
          else
            begin
              R:= R + copy(Value, i+1, pc-1);
              inc(i);
            end;
          Inc(i, pc);
        end
      else
        begin
          Inc(i);
          R:= R + Value[i];
        end;
    end;
  if GetStrValue <> R then SetStrValue(R);
end;

type
  TSZRDataFieldProperty = class(TSZRDBStringProperty)
    public
      function GetDataSetPropName: string; virtual;
      procedure GetValueList(List: TStrings); override;
  end;

function TSZRDataFieldProperty.GetDataSetPropName: string;
begin
  Result := 'DataSet'; {<-- do not resource}
end;

procedure TSZRDataFieldProperty.GetValueList(List: TStrings);
var
  Instance: TComponent;
  PropInfo: PPropInfo;
  DataSet : TDataSet;
begin
  Instance := TComponent(GetComponent(0));
  PropInfo := TypInfo.GetPropInfo(Instance.ClassInfo, GetDataSetPropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkClass) then
    begin
      DataSet := TObject(GetOrdProp(Instance, PropInfo)) as TDataSet;
      if (DataSet <> nil) then
        DataSet.GetFieldNames(List);
    end;
end;

type
  TSZRFontProperty = class(TFontProperty)
    public
      function  GetAttributes: TPropertyAttributes; override;
      procedure Edit; override;
  end;

function TSZRFontProperty.GetAttributes: TPropertyAttributes;
begin
  Result:= inherited GetAttributes - [paSubProperties];
end;

const
  hcDFontEditor       = 25000;

procedure TSZRFontProperty.Edit;
var
  FontDialog: TFontDialog;
begin
  FontDialog := TFontDialog.Create(Application);
  try
    FontDialog.Font        := TFont(GetOrdValue);
    FontDialog.HelpContext := hcDFontEditor;
    FontDialog.Options     := [fdAnsiOnly, fdFixedPitchOnly, fdForceFontExist, fdNoSimulations, fdShowHelp];
    if FontDialog.Execute then SetOrdValue(Longint(FontDialog.Font));
  finally
    FontDialog.Free;
  end;
end;

procedure Register;
begin
  RegisterComponents('SZReport', [TSZReport]);
  RegisterComponents('SZReport', [TSZRBand]);
  RegisterComponents('SZReport', [TSZRGroup]);
  RegisterComponents('SZReport', [TSZRSubDetailBand]);
  RegisterComponents('SZReport', [TSZRFrameLine]);
  RegisterComponents('SZReport', [TSZRLabel]);
  RegisterComponents('SZReport', [TSZRDBText]);
  RegisterComponents('SZReport', [TSZRExpression]);
  RegisterComponents('SZReport', [TSZRSysData]);
  RegisterComponents('SZReport', [TSZCompositeReport]);
  RegisterComponents('SZReport', [TSZRPreview]);
  RegisterPropertyEditor(TypeInfo(String), TSZRDBText, 'DataField', TSZRDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(String), TSZRPrinterEscapes, '', TSZREscapeProperty);
  RegisterPropertyEditor(TypeInfo(TFont), TSZReport, 'Font', TSZRFontProperty);
  RegisterPropertyEditor(TypeInfo(TFont), TSZRPreview, 'Font', TSZRFontProperty);
end;

end.

