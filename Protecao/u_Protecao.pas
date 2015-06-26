unit u_protecao;

interface

uses Windows, Messages, SysUtils, Variants, Classes, IBCustomDataSet, IBQuery,
  IBDataBase, IBSQL, Forms, DCPcrypt2, DCPrc4, DCPsha1, StrUtils, Dialogs,
  IniFiles, u_Serial, funcoes;

type
  TTipoCrypt = (tcEncrypt, tcDecrypt);
  TDataCrypt = (dcExternal, dcBanco, dcExecutavel);

  function getSerialHD: string;
  function AtualizaShareware(Transaction: TIBTransaction): boolean;
  function CriaShareware(Transaction: TIBTransaction; DirEmprEstacao: string = ''): boolean;
  function isExpirou(Transaction: TIBTransaction): boolean;
  procedure GeraSenha(sSerial1: string; var skey1,skey2,skey3: string; sCodFunc: string = '');
  function ValidaSenha(skey1,skey2,skey3: string; bMsg: boolean = true; bData: boolean = true): boolean;
  procedure GeraSerial(var skey1, skey2: string);
  function ValidaSerial(skey1,skey2: string): boolean;
  function MascaraProtec(sNumero: string): string;
  function getCodFunc(skey3: string): string;
  function TemProtecao: Boolean;

var
  EMPRESA_NUMERO_SERIAL: String;
  EMPRESA_NOME         : String;
  EMPRESA_CNPJ         : String;
  EMPRESA_IE           : String;

implementation

function su_CheckPath(sPath: string): string;
begin
  Result := sPath;
  if (trim(sPath) <> '') and (pos(copy(sPath, Length(sPath),1), '\%/') = 0) then
  begin
    if pos('/', sPath) > 0 then
      Result := sPath + '/'
    else
      Result := sPath + '\';
  end;
end;

procedure su_Msg(sMsg: string);
begin
  Application.MessageBox(PChar(sMsg), 'Informação', MB_OK+MB_ICONINFORMATION);
end;

function su_LPad(sTexto: string; iQtd: integer; cCh: char; bTrunc: boolean=false): string;
var
  iLen: Integer;
begin
  if bTrunc then
    sTexto := Copy(sTexto,1,iQtd);
  iLen   := (iQtd - Length(sTexto));
  Result := StringOfChar(cCh,iLen) + sTexto;
end;

function MascaraProtec(sNumero: string): string;
var
  I    : integer;
  iPos : integer;
  iDiv : integer;
begin
  sNumero := StringReplace(sNumero,'.','',[rfReplaceAll]);
  Result  := '';
  iPos    := 1;
  iDiv    := (Length(sNumero) div 3);
  for I := 1 to iDiv do
  begin
    Result := Result + copy(sNumero,iPos,3) + '.';
    Inc(iPos,3);
  end;
  if Length(sNumero) mod 3 > 0 then
    Result := Result + copy(sNumero, (iDiv*3)+1, Length(sNumero)-(iDiv*3));
  if (Result <> '') and (copy(Result,Length(Result),1) = '.') then
    Result := Copy(Result,1,Length(Result)-1);
end;

function getCodFunc(skey3: string): string;
begin
  // tira os pontos
  skey3  := StringReplace(skey3,'.','',[rfReplaceAll]);
  // inverte a string
  skey3  := ReverseString(skey3);
  // copia o codigo do funcionario
  skey3  := Copy(skey3, Length(skey3)-4,4);
  Result := skey3;
end;

procedure Msg(Texto: string);
begin
  Application.MessageBox(PChar(Texto), 'Informação', MB_OK+MB_ICONINFORMATION);
end;

function getkeyCrypt(Data: TDataCrypt): string;
begin
  case Data of
    dcExternal   : Result := 'yekjhetro';
    dcBanco      : Result := 'keyjhetro';
    dcExecutavel : Result := 'otreh7369';
  end;
end;

function EncryptStr(Key, Texto: string): string;
var
  Cipher : TDCP_rc4;
begin
  Cipher := TDCP_rc4.Create(nil);
  try
    Cipher.InitStr(Key, TDCP_sha1);
    Result := Cipher.EncryptString(Texto);
    Cipher.Burn;
  finally
    FreeAndNil(Cipher);
  end;
end;

function DacEan(s: string): Char;
const
  Digitos = ['0'..'9'];
var
  i,iTot,iMul,iDac: Integer;
begin
  Result := '0';
  for i := Length(s) downto 1 do
  begin
    if not (s[i] in Digitos) then
    begin
      Msg('Erro no cálculo do Dac!');
      Result := '-';
      Break;
    end;
  end;
  if Result <> '-' then
  begin
    iMul := 3;
    iTot := 0;
    for i := Length(s) downto 1 do
    begin
      iTot := iTot + (Ord(s[i])-48) * iMul;
      if iMul = 3 then iMul := 1 else iMul := 3;
    end;
    iDac := 10 - (iTot mod 10);
    if iDac = 10 then iDac := 0;
    Result := Chr(iDac+48);
  end;
end;

function CalcDgCript(Texto: string): string;
var
  I    : integer;
  sNum : string;
begin
  sNum := '';
  for I := 1 to Length(Texto) do
    if Texto[I] in ['0'..'9'] then
      sNum := sNum + Texto[I]
    else
      sNum := sNum + IntToStr(ord(Texto[I]));
  Result := DacEan(sNum);
end;

function DecryptStr(Key, Texto: string): string;
var
  Cipher : TDCP_rc4;
begin
  Cipher := TDCP_rc4.Create(nil);
  try
    Cipher.InitStr(Key, TDCP_sha1);
    Result := Cipher.DecryptString(Texto);
    Cipher.Burn;
  finally
    FreeAndNil(Cipher);
  end;
end;

function CryptData(Tipo: TTipoCrypt; Data: TDataCrypt; Texto: string): string;
begin
  case Tipo of
    tcEncrypt :
    begin
      Result := EncryptStr(getkeyCrypt(Data), Texto);
      // calcula um digito
      Result := Result + CalcDgCript(Result);
    end;
    // tira o digito
    tcDecrypt : Result := DecryptStr(getkeyCrypt(Data), copy(Texto,1,Length(Texto)-1));
  end;
end;

function getDataShareware: TDateTime;
var
  wAno,wMes,wDia: Word;
begin
  wAno := 2100;
  wMes := 1;
  wDia := 1;
  Result := EncodeDate(wAno,wMes,wDia);
end;

function NumeroSerie(Unidade: string; Hex: boolean = true):String;
var
  VolName    : AnsiString;
  SysName    : AnsiString;
  SerialNo   : DWord;
  MaxCLength : DWord;
  FileFlags  : DWord;
begin
  try
    SetLength(VolName,255);
    SetLength(SysName,255);
    GetVolumeInformation(PChar(Unidade),PChar(VolName),255,@SerialNo,
                         MaxCLength,FileFlags,PChar(SysName),255);
    if Hex then
      result := IntToHex(SerialNo,8)
    else
      Result := IntToStr(SerialNo);

  except
    result := ' ';
  end;
end;

function getSerialHD: string;
var
  Buffer     : array[0..144] of Char;
  DirWindows : string;
begin
  GetWindowsDirectory(Buffer,144);
  DirWindows := StrPas(Buffer);
  Result     := NumeroSerie( copy(DirWindows, 1, pos(':', DirWindows)) + '\', false );
end;

function getDriveEmpr(vl_str_banco: string): string;
  function CountCh(S: string; ch: Char): integer;
  var
    I: integer;
  begin
    Result := 0;
    for I := 1 to Length(S) do
      if S[I] = ch then
        Inc(Result);
  end;

begin

  if (CountCh(vl_str_banco, ':') > 1) or
     (pos(':/', vl_str_banco) > 0) then // em rede
  begin
    if (pos(':/', vl_str_banco) > 0) then // linux
      Result := '/'
    else
    begin
      vl_str_banco := copy(vl_str_banco, pos(':',vl_str_banco)+1, Length(vl_str_banco));
      Result       := copy(vl_str_banco, 1, pos(':', vl_str_banco)-1);
    end;
  end
  else
    Result := copy(vl_str_banco, 1, pos(':',vl_str_banco)-1);

end;

function AtualizaShareware(Transaction: TIBTransaction): boolean;
var
  qDataSet : TIBSQL;
  bInsert  : boolean;
begin
  Result   := false;
  qDataSet := TIBSQL.Create(nil);
  try try
    qDataSet.Transaction := Transaction;

    qDataSet.SQL.Clear;
    qDataSet.SQL.Add('SELECT * FROM RDB$ACCESS');
    qDataSet.ExecQuery;
    bInsert := qDataSet.Eof;

    qDataSet.Close;
    qDataSet.SQL.Clear;
    if bInsert then
      qDataSet.SQL.Add('INSERT INTO RDB$ACCESS VALUES(:RDB$NAME)')
    else
      qDataSet.SQL.Add('UPDATE RDB$ACCESS SET RDB$NAME = :RDB$NAME');

    qDataSet.Params[0].AsString := CryptData(tcEncrypt, dcBanco, DateToStr(Date) );
    qDataSet.ExecQuery;

    qDataSet.Close;
    qDataSet.SQL.Clear;
    qDataSet.SQL.Add('SELECT * FROM RDB$EXTERN');
    qDataSet.SQL.Add('WHERE RDB$NAME = :RDB$NAME');
    qDataSet.Params[0].AsString := CryptData(tcEncrypt, dcExternal, DateToStr(Date));
    qDataSet.ExecQuery;
    bInsert := qDataSet.Eof;

    if bInsert then
    begin
      qDataSet.Close;
      qDataSet.SQL.Clear;
      qDataSet.SQL.Add('INSERT INTO RDB$EXTERN VALUES(:RDB$NAME)');
      qDataSet.Params[0].AsString := CryptData(tcEncrypt, dcExternal, DateToStr(Date));
      qDataSet.ExecQuery;
    end;

    if qDataSet.Transaction.InTransaction then
      qDataSet.Transaction.CommitRetaining;

    Result := true;
  except
    if qDataSet.Transaction.InTransaction then
      qDataSet.Transaction.RollbackRetaining;
    raise;
  end;
  finally
    FreeAndNil(qDataSet);
  end;

end;

function getEmpr(vl_str_banco: string): string;
begin
  vl_str_banco := LowerCase(vl_str_banco);
  Result := copy(vl_str_banco, Pos('empr', vl_str_banco),6);
end;

function CriaProtecLocal(DirEmprEstacao: string): boolean;
var
  Arq: TextFile;
begin

  if copy(DirEmprEstacao, Length(DirEmprEstacao),1) <> '\' then
    DirEmprEstacao := DirEmprEstacao + '\';

  try
    AssignFile(Arq, DirEmprEstacao + 'server.sys' );
    try
      Rewrite(Arq);
      Writeln(Arq, CryptData(tcEncrypt, dcExecutavel, NumeroSerie(getDriveEmpr(DirEmprEstacao)+':\')) );
      Result := true;
    finally
      CloseFile(Arq);
    end;

  except
    Result := false;
  end;
end;

function getProtecLocal(DirEmprEstacao: string): string;
var
  Arq : TextFile;
begin

  Result := '';
  if copy(DirEmprEstacao, Length(DirEmprEstacao),1) <> '\' then
    DirEmprEstacao := DirEmprEstacao + '\';

  AssignFile(Arq, DirEmprEstacao + 'server.sys' );
  try
    Reset(Arq);
    Readln(Arq, Result );
  finally
    CloseFile(Arq);
  end;

end;

function CriaShareware(Transaction: TIBTransaction; DirEmprEstacao: string): boolean;

  function BackSlash(s: string): string;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Length(s) do
    begin
      if s[i] = '/' then
        Result := Result + '\'
      else
        Result := Result + s[i];
    end;
  end;

  function SlashPath(s: string): string;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Length(s) do
    begin
      if s[i] = '\' then
        Result := Result + '/'
      else
        Result := Result + s[i];
    end;
  end;

  function get_PathExternal(vl_str_banco: string): string;
  var
    sServer : string;
  begin
    if Pos(':',vl_str_banco) > 2 then // tcp
      sServer := Copy(vl_str_banco,1,(Pos(':',vl_str_banco)-1))
    else if Copy (vl_str_banco,1,2)= '\\' then //NamedPipe
      sServer := Copy(vl_str_banco,3,(Pos('\',Copy(vl_str_banco,3,70))-1))
    else if Pos('@',vl_str_banco) > 0 then // spx
      sServer := Copy(vl_str_banco,1,(Pos('@',vl_str_banco)-1))
    else // local
      sServer := 'localhost';

    if LowerCase(sServer) = LowerCase('Localhost') then
      Result := LowerCase(BackSlash(getDriveEmpr(vl_str_banco) + ':/taylor/cache'))
    else
      Result := LowerCase( BackSlash('//' + sServer + '/taylor/cache') );

  end;

var
  qDataSet  : TIBSQL;
  sNumEmpr  : string;
  sArqExt   : string;
  sDriveEmpr: string;
begin
  Result := false;

  if Trim(DirEmprEstacao) <> '' then
  begin
    if not DirectoryExists(su_CheckPath(DirEmprEstacao)) then
    begin
      su_Msg('Diretório não encontrado "'+DirEmprEstacao+'"');
      Exit;
    end;

    if CriaProtecLocal(DirEmprEstacao) then
    begin
      if Trim(Transaction.DefaultDatabase.DatabaseName) = '' then
        Result := true;
    end
    else
    begin
      Msg('Não foi possível Inicializar a Proteção Local.');
      Exit;
    end;
  end;

  if Trim(Transaction.DefaultDatabase.DatabaseName) <> '' then
  begin
    sNumEmpr   := LowerCase(Transaction.DefaultDatabase.DatabaseName);
    sNumEmpr   := copy(sNumEmpr, Pos('empr', sNumEmpr)+4,2);
    sDriveEmpr := getDriveEmpr(Transaction.DefaultDatabase.DatabaseName);
    sArqExt    := get_PathExternal(Transaction.DefaultDatabase.DatabaseName)
                  + '\etc\server' + sNumEmpr + '.dat';
    qDataSet   := TIBSQL.Create(nil);

    try try
      qDataSet.Transaction := Transaction;

      qDataSet.Close;
      qDataSet.SQL.Clear;
      qDataSet.SQL.Add('SELECT RDB$RELATION_NAME FROM RDB$RELATIONS');
      qDataSet.SQL.Add('WHERE RDB$RELATION_NAME = ''RDB$ACCESS'';');
      qDataSet.ExecQuery;
      if qDataSet.Eof then
      begin
        qDataSet.Close;
        qDataSet.SQL.Clear;
        qDataSet.SQL.Add('CREATE TABLE RDB$ACCESS');
        qDataSet.SQL.Add('(');
        qDataSet.SQL.Add('  RDB$NAME VARCHAR(500)');
        qDataSet.SQL.Add(');');
        qDataSet.ExecQuery;
      end;

      qDataSet.Close;
      qDataSet.SQL.Clear;
      qDataSet.SQL.Add('SELECT RDB$RELATION_NAME FROM RDB$RELATIONS');
      qDataSet.SQL.Add('WHERE RDB$RELATION_NAME = ''RDB$EXTERN'';');
      qDataSet.ExecQuery;
      if not qDataSet.Eof then
      begin
        qDataSet.Close;
        qDataSet.SQL.Clear;
        qDataSet.SQL.Add('DROP TABLE RDB$EXTERN;');
        qDataSet.ExecQuery;
      end;

      if FileExists(sArqExt) then
        if not DeleteFile(sArqExt) then
          raise Exception.Create('Erro ao apagar o arquivo ' + sArqExt);

      if sDriveEmpr = '/' then // linux
        sArqExt := sDriveEmpr
      else
        sArqExt := sDriveEmpr + ':\';

      sArqExt   := sArqExt + 'taylor\cache\etc\server' + sNumEmpr + '.dat';

      if sDriveEmpr = '/' then //linux
        sArqExt := LowerCase(SlashPath(sArqExt))
      else
        sArqExt := LowerCase(BackSlash(sArqExt));

      qDataSet.Close;
      qDataSet.SQL.Clear;
      qDataSet.SQL.Add('CREATE TABLE RDB$EXTERN EXTERNAL FILE ' + QuotedStr(sArqExt));
      qDataSet.SQL.Add('(');
      qDataSet.SQL.Add('  RDB$NAME VARCHAR(500)');
      qDataSet.SQL.Add(');');
      qDataSet.ExecQuery;

      qDataSet.Close;
      qDataSet.SQL.Clear;
      qDataSet.SQL.Add('UPDATE RDB$RELATIONS SET RDB$SYSTEM_FLAG = 1');
      qDataSet.SQL.Add('WHERE RDB$RELATION_NAME = ''RDB$EXTERN''');
      qDataSet.SQL.Add('   OR RDB$RELATION_NAME = ''RDB$ACCESS''');
      qDataSet.ExecQuery;

      if qDataSet.Transaction.InTransaction then
        qDataSet.Transaction.CommitRetaining;

      Result := true;
    except
      if qDataSet.Transaction.InTransaction then
        qDataSet.Transaction.RollbackRetaining;
      raise;
    end;
    finally
      FreeAndNil(qDataSet);
    end;
  end;

end;

function isExpirou(Transaction: TIBTransaction): boolean;
var
  qDataSet  : TIBQuery;
  sAccess   : string;
  sTX       : string;
  sSerialHD : string;
  iDias     : integer;

  procedure Finaliza;
  begin
    FreeAndNil(qDataSet);
  end;

  function ValidaData(Data: string): boolean;
  begin
    try
      StrToDate(Data);
      Result := true;
    except
      Result := false;
    end;
  end;

begin

  Result    := true;
  sAccess   := '';
  sTX       := '';
  sSerialHD := '';
  qDataSet  := TIBQuery.Create(nil);

  try
    qDataSet.Transaction := Transaction;

    try
      qDataSet.SQL.Clear;
      qDataSet.SQL.Add('SELECT * FROM RDB$ACCESS');
      qDataSet.Open;
      if (qDataSet.IsEmpty) or (qDataSet.Fields[0].IsNull) then
      begin
        // o campo no banco está vazio.
        Msg('Erro: P.01' + #13 + 'Proteção não encontrada.');
        Finaliza;
        Exit;
      end
      else
        sAccess := qDataSet.Fields[0].AsString;
    except
      // tabela nao encontrada
      Msg('Erro: P.02' + #13 + 'Proteção não encontrada.');
      Finaliza;
      Exit;
    end;

    try
      qDataSet.Close;
      qDataSet.SQL.Clear;
      qDataSet.SQL.Add('SELECT * FROM RDB$EXTERN');
      qDataSet.Open;
      qDataSet.Last;
      if (qDataSet.IsEmpty) or (qDataSet.Fields[0].IsNull) then
      begin
        // tabela externa nao encontrada.
        Msg('Erro: P.03' + #13 + 'Proteção não encontrada.');
        Finaliza;
        Exit;
      end
      else
        sTX := qDataSet.Fields[0].AsString;
    except
      Msg('Erro: P.04' + #13 + 'Proteção não encontrada.');
      Finaliza;
      Exit;
    end;

    if not FileExists( ExtractFilePath(Application.ExeName) + 'server.sys' ) then
    begin
      Msg('Erro: P.05' + #13 + 'Proteção não encontrada.');
      Finaliza;
      Exit;
    end;

    sSerialHD := getProtecLocal(ExtractFilePath(Application.ExeName));
    if Trim(sSerialHD) = '' then
    begin
      Msg('Erro: P.06' + #13 + 'Proteção não encontrada.');
      Finaliza;
      Exit;
    end;

    // verifica se o texto foi alterado
    if copy(sAccess,Length(sAccess),1) <> CalcDgCript(copy(sAccess,1,Length(sAccess)-1)) then
    begin
      Msg('Erro: P.10' + #13 + 'Proteção violada.');
      Finaliza;
      Exit;
    end;

    // verifica se o texto foi alterado
    if copy(sTX,Length(sTX),1) <> CalcDgCript(copy(sTX,1,Length(sTX)-1)) then
    begin
      Msg('Erro: P.11' + #13 + 'Proteção violada.');
      Finaliza;
      Exit;
    end;

    // verifica se o texto foi alterado
    if copy(sSerialHD,Length(sSerialHD),1) <> CalcDgCript(copy(sSerialHD,1,Length(sSerialHD)-1)) then
    begin
      Msg('Erro: P.12' + #13 + 'Proteção violada.');
      Finaliza;
      Exit;
    end;

    // descriptografa
    try
      sAccess := CryptData(tcDecrypt, dcBanco, sAccess);
    except
      // modificação da proteção no banco.
      Msg('Erro: P.10.2' + #13 + 'Proteção violada.');
      Finaliza;
      Exit;
    end;

    try
      sTX     := CryptData(tcDecrypt, dcExternal, sTX);
    except
      // modificação da proteção no arquivo externo
      Msg('Erro: P.11.2' + #13 + 'Proteção violada.');
      Finaliza;
      Exit;
    end;

    try
      sSerialHD := CryptData(tcDecrypt, dcExecutavel, sSerialHD);
    except
      Msg('Erro: P.12.2' + #13 + 'Proteção violada.');
      Finaliza;
      Exit;
    end;

    // verifica se é uma data valida
    if (not ValidaData(sAccess)) then
    begin
      // modificação da proteção no banco.
      Msg('Erro: P.10.3' + #13 + 'Proteção violada.');
      Finaliza;
      Exit;
    end;

    if (not ValidaData(sTX)) then
    begin
      // modificação da proteção no arquivo externo
      Msg('Erro: P.11.3' + #13 + 'Proteção violada.');
      Finaliza;
      Exit;
    end;

    // verifica se as datas estao diferentes
    if StrToDate(sAccess) <> StrToDate(sTX) then
    begin
      // data do ultimo acesso do banco diferente do arquivo externo
      Msg('Erro: P.20' + #13 + 'Inconsistência na Proteção.');
      Finaliza;
      Exit;
    end;

    if sSerialHD <> NumeroSerie(getDriveEmpr(ExtractFilePath(Application.ExeName)) + ':\') then
    begin
      Msg('Erro: P.21' + #13 + 'Inconsistência na Proteção.');
      Finaliza;
      Exit;
    end;

    // verifica se tem mais de 15 dias sem entrar no sistema
    if (Date - StrToDate(sAccess)) > 15 then
    begin
      Msg('Erro: P.22' + #13 + 'Verifique se a data do computador está correta.');
      Finaliza;
      Exit;
    end;

    // verifica se a data do ultimo acesso é maior que a atual
    if StrToDate(sAccess) > Date then
    begin
      Msg('Erro: P.23' + #13 + 'Data do último acesso maior que a atual.');
      Finaliza;
      Exit;
    end;

    // atualiza a data do ultimo acesso no banco
    if AtualizaShareware(Transaction) then
    begin
      if Date >= getDataShareware then
      begin
        Result := true;
        Msg('Erro: P.90' + #13 + 'Sistema expirado.' + #13 + 'Favor entrar em contato com a Jetro!');
      end
      else
      begin
        Result := false;
        iDias := trunc(getDataShareware - Date);
        if iDias = 1 then
          Msg('O sistema expirará amanhã.' + #13 + 'Favor entrar em contato com a Jetro!')
        else if (iDias <= 10) then
          Msg('Faltam ' + IntToStr(iDias) + ' dias para o sistema expirar.' + #13 +
              'Favor entrar em contato com a Jetro!' );
      end;
    end;

  finally
    Finaliza;
  end;

end;

function ValidaDAC(Num: string): boolean;
begin
  Result := DacEan(copy(Num, 1, Length(Num)-1)) = copy(Num, Length(Num),1);
end;

procedure GeraSerial(var skey1, skey2: string);
begin
  Randomize;
  skey1 := ReverseString( IntToStr(Random(9)) + getSerialHD + IntToStr(Random(9)) );
  skey1 := skey1 + DacEan(skey1);
  skey2 := ReverseString( FormatDateTime('nnsszz', now) );
  skey2 := skey2 + DacEan(skey2);
  // coloca os pontos
  skey1 := MascaraProtec(skey1);
  skey2 := MascaraProtec(skey2);
end;

function ValidaSerial(skey1,skey2: string): boolean;
begin
  Result := false;
  // tira os pontos
  skey1 := StringReplace(skey1,'.','',[rfReplaceAll]);
  skey2 := StringReplace(skey2,'.','',[rfReplaceAll]);

  if (Trim(skey1) = '') or (Trim(skey1) = '') then
  begin
    Msg('Serial Incompleto.');
    Exit;
  end;

  if (not ValidaDAC(skey1)) or
     (not ValidaDAC(skey2)) then
  begin
    Msg('Serial incorreto.');
    exit;
  end;

  Result := true;

end;

procedure GeraSenha(sSerial1: string; var skey1,skey2,skey3: string; sCodFunc: string = '');
begin
  // tira os pontos
  sSerial1 := StringReplace(sSerial1,'.','',[rfReplaceAll]);

  // tira o digito
  sSerial1 := copy(sSerial1, 1, Length(sSerial1)-1);
  // remove os campos aleatorios
  sSerial1 := Copy(sSerial1, 2, Length(sSerial1));
  sSerial1 := Copy(sSerial1, 1, Length(sSerial1)-1);
  // inverte a string
  sSerial1 := ReverseString(sSerial1);

  Randomize;
  skey1 := ReverseString( IntToStr(Random(9)) + FloatToStr(Trunc(Date)) + IntToStr(Random(9)) );
  skey1 := skey1 + DacEan(skey1);
  skey2 := ReverseString( sSerial1 );
  skey2 := skey2 + DacEan(skey2);

  if StrToIntDef(Trim(sCodFunc),0) > 0 then
  begin
    Randomize;
    skey3 := ReverseString( IntToStr(Random(9)) +
                            FormatDateTime('sszz', now) +
                            su_LPad(Trim(sCodFunc),4,'0') +
                            IntToStr(Random(9)) );
    skey3 := skey3 + DacEan(skey3);
  end
  else
    skey3 := '';

  // coloca os pontos
  skey1 := MascaraProtec(skey1);
  skey2 := MascaraProtec(skey2);
  skey3 := MascaraProtec(skey3);
end;

function ValidaSenha(skey1,skey2,skey3: string; bMsg: boolean; bData: boolean): boolean;
begin
  Result := false;
  // tira os pontos
  skey1 := StringReplace(skey1,'.','',[rfReplaceAll]);
  skey2 := StringReplace(skey2,'.','',[rfReplaceAll]);
  skey3 := StringReplace(skey3,'.','',[rfReplaceAll]);

  if (Trim(skey1) = '') or (Trim(skey1) = '') then
  begin
    if bMsg = true then
      Msg('Senha Incompleta.');
    Exit;
  end;


  if (not ValidaDAC(skey1)) or
     (not ValidaDAC(skey2)) or
     ( (skey3 <> '') and (not ValidaDAC(skey3)) ) then
  begin
    if bMsg = true then
      Msg('Senha incorreta.');
    exit;
  end;

  // tira o digito
  skey1 := copy(skey1, 1, Length(skey1)-1);
  // remove os campos aleatorios
  skey1 := Copy(skey1, 2, Length(skey1));
  skey1 := Copy(skey1, 1, Length(skey1)-1);
  // inverte a string
  skey1 := ReverseString(skey1);

  // tira o digito
  skey2 := copy(skey2, 1, Length(skey2)-1);
  // inverte a string
  skey2 := ReverseString(skey2);


  if bData then
  begin
    if (StrToInt64(skey1) <> Trunc(Date)) or
       (skey2 <> getSerialHD) then
    begin
      if bMsg = true then
        Msg('Senha inválida.');
      exit;
    end;
  end
  else
  begin
    if (skey2 <> getSerialHD) then
    begin
      if bMsg = true then
        Msg('Senha inválida.');
      exit;
    end;
  end;

  Result := true;
end;

function TemProtecao: Boolean;
var
  ServerIni: TIniFile;
  sCOD_01,sCOD_02,sCOD_03,sCOD_04,sCOD_05,sSenha1,sSenha2: String;

  Serie: TSerial;
  codigo,nome,cnpj,ie,sSerial: string;
begin
  if FileExists(cArquivoConfiguracao) then
  begin
    ServerIni := TIniFile.Create(cArquivoConfiguracao);
    Serie  := TSerial.Create;

    try
      sCOD_01 := ServerIni.ReadString('PROTECAO','COD_01','');
      sCOD_02 := ServerIni.ReadString('PROTECAO','COD_02','');
      sCOD_03 := ServerIni.ReadString('PROTECAO','COD_03','');
      sCOD_04 := ServerIni.ReadString('PROTECAO','COD_04','');
      sCOD_05 := ServerIni.ReadString('PROTECAO','COD_05','');
      sSenha1 := ServerIni.ReadString('PROTECAO','SENHA_01','');
      sSenha2 := ServerIni.ReadString('PROTECAO','SENHA_02','');
      sSerial := sCOD_01 + '-' + sCOD_02 + '-' + sCOD_03 + '-' + sCOD_04 + '-' + sCOD_05;

      if sSerial = cSerialUnico then
        Result := true
      else
        Result := Serie.ExisteSerial(sCOD_01+'-'+
                                     sCOD_02+'-'+
                                     sCOD_03+'-'+
                                     sCOD_04+'-'+
                                     sCOD_05,
                                     codigo,nome,cnpj,ie) and
                  ValidaSenha(sSenha1,sSenha2,'',false,false);

      if result then
      begin
        EMPRESA_NUMERO_SERIAL := sSerial;
        EMPRESA_NOME          := nome;
        EMPRESA_CNPJ          := cnpj;
        EMPRESA_IE            := ie;
      end
      else
      begin
        EMPRESA_NUMERO_SERIAL := '';
        EMPRESA_NOME          := '';
        EMPRESA_CNPJ          := '';
        EMPRESA_IE            := '';
      end;

    finally
      Serie.Free;
      ServerIni.Free;
    end;
  end
  else
    Result := false;
end;

end.
