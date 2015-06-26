unit ZRStrUtl;

interface

{ These declarations copied from StrUtils.pas (RX library v2.32) }
type
  TCharSet = Set of Char;

function MakeStr(C: Char; N: Integer): String;
function WordCount(const S: string; WordDelims: TCharSet): Integer;
function WordPosition(const N: Integer; const S: string; WordDelims: TCharSet): Integer;
function ExtractWord(N: Integer; const S: string; WordDelims: TCharSet): string;

{ These are unique declarations }
function Space(N: Integer): String;
function Replicate(S: String; N: Integer): String;

function Left(const S: String; N: Integer): String;
function Right(const S: String; N: Integer): String;

function PadLeftChar(const S: String; N: Integer; Chr: Char): String;
function PadRightChar(const S: String; N: Integer; Chr: Char): String;
function PadCenterChar(const S: String; N: Integer; Chr: Char): String;

function PadLeft(const S: String; N: Integer): String;
function PadRight(const S: String; N: Integer): String;
function PadCenter(const S: String; N: Integer): String;

function Stuff(const Source, S: String; N: Integer): String;

implementation

Uses Windows, SysUtils;

function MakeStr(C: Char; N: Integer): String;
begin
  if N < 1 then Result := ''
  else begin
    SetLength(Result, N);
    FillChar(Result[1], Length(Result), C);
  end;
end;

function Space(N: Integer): String;
begin
  Result:= MakeStr(' ', N);
end;

function Replicate(S: String; N: Integer): String;
var
  i: Integer;
begin
  Result:= '';
  for i:= 1 to N do Result:= Result + S;
end;

function AddChar(C: Char; const S: string; N: Integer): string;
begin
  if Length(S) < N then
    Result := MakeStr(C, N - Length(S)) + S
  else Result := S;
end;

function AddCharR(C: Char; const S: string; N: Integer): string;
begin
  if Length(S) < N then
    Result := S + MakeStr(C, N - Length(S))
  else Result := S;
end;

function Left(const S: String; N: Integer): String;
begin
  Result:= Copy(S, 1, N);
end;

function Right(const S: String; N: Integer): String;                 
begin
  if Length(S) > N then
    Result:= Copy(S, Length(S)-N+1, N)
  else
    Result:= S;
end;

function PadLeftChar(const S: String; N: Integer; Chr: Char): String;
begin
  Result:= AddChar(Chr, S, N);
end;
function PadRightChar(const S: String; N: Integer; Chr: Char): String;
begin
  Result:= AddCharR(Chr, S, N);
end;
function PadCenterChar(const S: String; N: Integer; Chr: Char): String;
begin
  if Length(S) < N then
    begin
      Result := MakeStr(Chr, (N div 2) - (Length(S) div 2)) + S;
      Result := Result + MakeStr(Chr, N - Length(Result));
    end
  else
    Result := S;
end;

function PadLeft(const S: String; N: Integer): String;
begin
  Result:= PadLeftChar(S, N, ' ');
end;
function PadRight(const S: String; N: Integer): String;
begin
  Result:= PadRightChar(S, N, ' ');
end;
function PadCenter(const S: String; N: Integer): String;
begin
  Result:= PadCenterChar(S, N, ' ');
end;

function Stuff(const Source, S: String; N: Integer): String;
begin
  Result:= PadRight(Source, N);
  System.Delete(Result, N, Length(S));
  System.Insert(S, Result, N);
end;

function WordCount(const S: string; WordDelims: TCharSet): Integer;
var
  SLen, I: Cardinal;
begin
  Result := 0;
  I := 1;
  SLen := Length(S);
  while I <= SLen do begin
    while (I <= SLen) and (S[I] in WordDelims) do Inc(I);
    if I <= SLen then Inc(Result);
    while (I <= SLen) and not(S[I] in WordDelims) do Inc(I);
  end;
end;

function WordPosition(const N: Integer; const S: string; WordDelims: TCharSet): Integer;
var
  Count, I: Integer;
begin
  Count := 0;
  I := 1;
  Result := 0;
  while ((I <= Length(S)) and (Count <> N)) do begin
    { skip over delimiters }
    while ((I <= Length(S)) and (S[I] in WordDelims)) do Inc(I);
    { if we're not beyond end of S, we're at the start of a word }
    if (I <= Length(S)) then Inc(Count);
    { if not finished, find the end of the current word }
    if (Count <> N) then
      while ((I <= Length(S)) and not (S[I] in WordDelims)) do Inc(I)
    else Result := I;
  end;
end;

function ExtractWord(N: Integer; const S: string; WordDelims: TCharSet): string;
var
  I: Word;
  Len: Integer;
begin
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  if I <> 0 then
    { find the end of the current word }
    while (I <= Length(S)) and not(S[I] in WordDelims) do begin
      { add the I'th character to result }
      Inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[I];
      Inc(I);
    end;
  SetLength(Result, Len);
end;

end.

