unit ZREscape;

interface

type
  TEscapeStyle  = (esBold, esItalic, esUnderline, esSuperScript, esSubScript, esFrame);
  TEscapeStyles = set of TEscapeStyle;
  TFrameStyle   = (fsHorizontal, fsVertical, fsCross);
  TFrameStyles  = set of TFrameStyle;

const
  EscapeChar: Char = '\';
  StyleChar : array[TEscapeStyle] of Char = ( 'B', 'I', 'U', 'H', 'L', 'F' );
  FrameChar : array[TFrameStyle]  of Char = ( '-', '|', '+' );

function EscapeFormat(const S: String; Styles: TEscapeStyles): String;
function EscapeDeFormat(const S: String): String;
function EscapeLength(const S: String): Integer;
function EscapeStyles(const S: String; Pos: Integer): TEscapeStyles;
function EscapeCopy(const S: String; Index, Count: Integer): String;
function EscapeDelete(const S: String; Index, Count: Integer): String;
function EscapeInsert(const Pattern, S: String; Pos: Integer): String;
function EscapeStuff(const Pattern, S: String; Pos: Integer): String;

function EscapePadLeft  (const S: String; N: Integer): String;
function EscapePadRight (const S: String; N: Integer): String;
function EscapePadCenter(const S: String; N: Integer): String;

function EscapeToken(const S: String; var Pos: Integer; var Styles: TEscapeStyles): String;

implementation

uses SysUtils, ZRStrUtl;

var
  StyleChars: set of Char = [];
  FrameChars: set of Char = [];

function IsStyleToken(const S: String; Pos: Integer): Boolean;
begin
  Result:= (Pos < Length(S)) and (S[Pos] = EscapeChar) and (Upcase(S[Pos+1]) in StyleChars);
end;

function CountEscapes(const S: String): Integer;
var
  i: Integer;
begin
  Result:= 0;
  i     := 1;
  while i <= Length(S) do
    begin
      if IsStyleToken(S, i) then
        begin
          Inc(i);
          Inc(Result);
        end;
      Inc(I);
    end;
end;

function EscapeLength(const S: String): Integer;
begin
  Result:= Length(S) - 2*CountEscapes(S);
end;

function PosToEscape(const S: String; Pos: Integer): Integer;
var
  i: Integer;
  p: Integer;
begin
  Result:= Pos;
  i     := 1;
  p     := 1;
  while (i <= Length(S)) and (p <= Pos) do
    begin
      if IsStyleToken(S, i) then
        begin
          Inc(i);
          Inc(Result, 2);
        end
      else
        Inc(p);
      Inc(i);
    end;
end;

function CharToStyle(C: Char): TEscapeStyle;
begin
  for Result:= Low(TEscapeStyle) to High(TEscapeStyle) do
    if UpCase(C) = StyleChar[Result] then Break;
end;

function EscapeStyles(const S: String; Pos: Integer): TEscapeStyles;
var
  i: Integer;
  p: Integer;
  E: TEscapeStyle;
begin
  Result:= [];
  i:= 1;
  p:= PosToEscape(S, Pos);
  while (i <= Length(S)) and (i <= p) do
    begin
      if IsStyleToken(S, i) then
        begin
          Inc(i);
          E:= CharToStyle(S[i]);
          if E in Result then Exclude(Result, E) else Include(Result, E);
        end;
      Inc(i);
    end;
end;

function EscapeFormat(const S: String; Styles: TEscapeStyles): String;
var
  f: TEscapeStyle;
  Start,
  Finish: String;
begin
  Start := '';
  Finish:= '';
  for f:= Low(TEscapeStyle) to High(TEscapeStyle) do
    if f in Styles then Start:= EscapeChar + StyleChar[f] + Start;
  for f:= High(TEscapeStyle) downto Low(TEscapeStyle) do
    if f in Styles then Finish:= Finish + EscapeChar + StyleChar[f];
  Result:= Start + S + Finish;
end;

function EscapeDeFormat(const S: String): String;
var
  i: Integer;
begin
  Result:= S;
  i     := 1;
  while i <= Length(S) do
    if IsStyleToken(Result, i) then Delete(Result, i, 2) else Inc(i);
end;

function EscapeNormalize(const S: String): String;
var
  f     : TEscapeStyle;
  si, ei: Integer;
  SubStr: String;
  i     : Integer;
  Even  : Boolean;
begin
  Result:= S;
  for f:= Low(TEscapeStyle) to High(TEscapeStyle) do
    begin
      i   := 1;
      Even:= True;
      repeat
        SubStr:= copy(Result, i, Length(Result));
        si    := Pos(EscapeChar + StyleChar[f], SubStr);
        if si > 0 then
          begin
            ei:= Pos(EscapeChar + StyleChar[f], copy(SubStr, si+2, Length(SubStr)));
            if ei = 1 then Delete(Result, i+si-1, 4) else
            if (ei = 0) and Even then Result:= Result + EscapeChar + StyleChar[f]
            else
              begin
                Inc(i, si+1);
                Even:= not Even;
              end;
          end;
      until si = 0;
    end;
end;

function EscapeCopy(const S: String; Index, Count: Integer): String;
var
  SI, EI: Integer;
  SF, EF: TEscapeStyles;
  f     : TEscapeStyle;
begin
  Result:= '';
  if Index > EscapeLength(S) then Exit;
  SI:= PosToEscape(S, Index);
  SF:= EscapeStyles(S, Index);
  EI:= PosToEscape(S, Index+Count-1);
  EF:= EscapeStyles(S, Index+Count-1);
  Result:= copy(S, SI, EI-SI+1);
  for f:= High(TEscapeStyle) downto Low(TEscapeStyle) do
    if f in SF then Result:= EscapeChar + StyleChar[f] + Result;
  for f:= Low(TEscapeStyle) to High(TEscapeStyle) do
    if f in EF then Result:= Result + EscapeChar + StyleChar[f];
  Result:= EscapeNormalize(Result);
end;

function EscapeInsert(const Pattern, S: String; Pos: Integer): String;
var
  SI: Integer;
  SF: TEscapeStyles;
  f : TEscapeStyle;
  SS: String;
begin
  if Pos > EscapeLength(S) then Result:= EscapePadRight(S, Pos) else Result:= S;
  SI := PosToEscape(Result, Pos);
  SF := EscapeStyles(Result, Pos);
  SS := EscapeNormalize(Pattern);
  for f:= Low(TEscapeStyle) to High(TEscapeStyle) do
    if f in SF then SS:= EscapeChar + StyleChar[f] + SS;
  for f:= High(TEscapeStyle) downto Low(TEscapeStyle) do
    if f in SF then SS:= SS + EscapeChar + StyleChar[f];
  Insert(SS, Result, SI);
  Result:= EscapeNormalize(Result);
end;

function EscapeDelete(const S: String; Index, Count: Integer): String;
var
  First,
  Last : String;
begin
  if Index > EscapeLength(S) then Exit;
  First := EscapeCopy(S, 1, Index-1);
  Last  := EscapeCopy(S, Index+Count, EscapeLength(S));
  Result:= EscapeNormalize(First + Last);
end;

function EscapeStuff(const Pattern, S: String; Pos: Integer): String;
begin
  Result:= EscapePadRight(S, Pos);
  Result:= EscapeDelete(Result, Pos, EscapeLength(Pattern));
  Result:= EscapeInsert(Pattern, Result, Pos);
end;

function EscapePadLeft(const S: String; N: Integer): String;
var
  EL: Integer;
begin
  Result:= EscapeNormalize(S);
  EL    := EscapeLength(Result);
  if EL < N then Result:= Space(N-EL) + Result;
end;

function EscapePadRight(const S: String; N: Integer): String;
var
  EL: Integer;
begin
  Result:= EscapeNormalize(S);
  EL    := EscapeLength(Result);
  if EL < N then Result:= Result + Space(N-EL);
end;

function EscapePadCenter(const S: String; N: Integer): String;
var
  EL: Integer;
begin
  Result:= EscapeNormalize(S);
  EL    := EscapeLength(Result);
  if EL < N then
    begin
      Result := Space((N - EL) div 2) + S;
      Result := Result + Space(N - EscapeLength(Result));
    end;
end;

function EscapeToken(const S: String; var Pos: Integer; var Styles: TEscapeStyles): String;
var
  SI, i: Integer;
begin
  SI    := PosToEscape(S, Pos);
  Styles:= EscapeStyles(S, Pos);
  i     := SI;
  while (i <= Length(S)) and not IsStyleToken(S, i) do begin Inc(i); Inc(Pos) end;
  if IsStyleToken(S, i) then Dec(i);
  Result:= copy(S, SI, i-SI+1);
end;

procedure FillStyleChars;
var
  e: TEscapeStyle;
  f: TFrameStyle;
begin
  for e:= Low(TEscapeStyle) to High(TEscapeStyle) do
    Include(StyleChars, StyleChar[e]);
  for f:= Low(TFrameStyle) to High(TFrameStyle) do
    Include(FrameChars, FrameChar[f]);
end;

initialization
  FillStyleChars;
end.

