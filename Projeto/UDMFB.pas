unit UDMFB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBCustomDataSet, DB, IBQuery, IBDatabase, IniFiles;

type
  TDMFB = class(TDataModule)
    IBDatabaseConn: TIBDatabase;
    IBTransactionConn: TIBTransaction;
    qComandos: TIBQuery;
    qConsultas: TIBQuery;
  private
    function AllTrim(pP1:String):String;
    function Replicate(pP1:String; pP2:Integer):String;
    function StrZero(Num : Double ; Zeros,Deci: integer): string;
    function StrTran(sP1,sP2,sP3 : string):String;
    function DateToFB(d: TDateTime): string;
    function AnsiMes(d: TDateTime) : string;
  public
    StringConexao: string;
    function  PAF_Conectar: boolean;
    procedure PAF_Desconectar;
    procedure PAF_SalvaDAV(CdCNC, CdPDV: integer);
    procedure PAF_Export(iDias: integer);
  end;

var
  DMFB: TDMFB;

implementation

uses UDM, funcoes;

{$R *.dfm}

function TDMFB.AllTrim(pP1: String): String;
begin
  While Copy(pP1,Length(pP1),1) = ' ' do
      pP1:=Copy(pP1,1,Length(pP1)-1);
   While Copy(pP1,1,1) = ' ' do
      pP1:=Copy(pP1,2,Length(pP1)-1);
   Result:=pP1;
end;

function TDMFB.AnsiMes(d: TDateTime): string;
var
  wNil,wMes: Word;
begin
  DecodeDate(d, wNil, wMes, wNil);
  case wMes of
  01: Result := 'JAN';
  02: Result := 'FEB';
  03: Result := 'MAR';
  04: Result := 'APR';
  05: Result := 'MAY';
  06: Result := 'JUN';
  07: Result := 'JUL';
  08: Result := 'AUG';
  09: Result := 'SEP';
  10: Result := 'OCT';
  11: Result := 'NOV';
  12: Result := 'DEC';
  end;
end;

function TDMFB.PAF_Conectar: boolean;
var
  sBanco : String;
  Inifile : TIniFile;
begin
  result := false;
  if not(FileExists(PAF_GetPasta + '\small.ini')) then
  begin
    Application.MessageBox('Não foi encontrado o banco de dados do PAF!'+#13+
                           'Informe o local do PAF nas configurações do sistema na aba Máquina!',
                           'Atenção',
                           mb_IconError+mb_Ok);

    exit;
  end;

  try
    IniFile := TIniFile.create(PAF_GetPasta + '\small.ini');
    sBanco := IniFile.ReadString('Firebird','Server IP','')+':'+IniFile.ReadString('Firebird','Server URL','')+'\small.gdb';
    IniFile.Free;
    //
    IBDatabaseConn.Close;
    IBDatabaseConn.Params.Clear;
    IBDatabaseConn.Params.Add('user_name=SYSDBA');
    IBDatabaseConn.Params.Add('password=masterkey');
    IBDatabaseConn.DatabaseName := sBanco;
    IBDatabaseConn.Open;
    IBTransactionConn.Active := true;
    result := true;
  except
    Application.MessageBox(
    '1 - Verifique se o arquivo não esta sendo usado;'+chr(13)+
    '2 - Verifique se Firebird esta instalado no computador;'+chr(13)+
    '3 - Verifique se o usuário do windows tem permissão de Administrador;'+chr(13)+
    '4 - Verifique Antivírus e Firewall do seu microcomputador;','Erro ao abrir o banco de dados',mb_IconError+mb_Ok);
    result := false;
    exit;
  end;
end;

function TDMFB.DateToFB(d: TDateTime): string;
begin
  Result := FormatDateTime('dd-',d)
          + AnsiMes(d)
          + FormatDateTime('-yyyy',d);
end;

procedure TDMFB.PAF_Desconectar;
begin
  IBTransactionConn.Active := false;
  IBDatabaseConn.Close;
end;

procedure TDMFB.PAF_Export(iDias: integer);
begin
  //TODO Refazer
end;

procedure TDMFB.PAF_SalvaDAV(CdCNC, CdPDV: integer);
var
  iMaxReg: integer;
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    //SQL.Add('	PRD.PRD_CODIGO AS CODIGO,');
    SQL.Add('	PRD.PRD_COD_PAF AS CODIGO,');
    SQL.Add('	PRD.PRD_DESCRICAO AS DESCRICAO,');
    SQL.Add('	IPV.IPV_QUANTIDADE AS QUANTIDADE,');
    SQL.Add('	PRD.PRD_UNIDADE AS MEDIDA,');
    SQL.Add('	IPV.IPV_PRECO_DESC AS UNITARIO,');
    SQL.Add('	CONVERT(NUMERIC(18,2), IPV.IPV_QUANTIDADE * IPV.IPV_PRECO_DESC) AS TOTAL,');
    SQL.Add('	PDV.PDV_DATA_HORA AS DATA,');
    SQL.Add('	''ORCAME'' AS TIPO,');
    SQL.Add('	PDV.PDV_CODIGO AS PEDIDO,');
    SQL.Add('	NULL AS ITEM,');
    SQL.Add('	CLI.CLI_RZ_SOCIAL AS CLIFOR,');
    SQL.Add('	FUN.FUN_NOME AS VENDEDOR,');
    SQL.Add('	NULL AS CAIXA,');
    SQL.Add('	NULL AS VALORICM,');//TODO
    SQL.Add('	NULL AS ALIQUICM,');//TODO
    SQL.Add('	NULL AS REGISTRO,');//G_ORCAMENT (pegar o ultimo, salvar o item e logo em seguida alterar o generator, ele guarda o próximo)
    SQL.Add('	NULL AS ENCRYPTHASH,');
    SQL.Add('	NULL AS COO,');
    SQL.Add('	NULL AS NUMERONF');
    SQL.Add('FROM');
    SQL.Add('	PEDIDO_DE_VENDA PDV');
    SQL.Add('INNER JOIN ITEM_DE_PEDIDO_DE_VENDA IPV ON');
    SQL.Add('	IPV.CNC_CODIGO = PDV.CNC_CODIGO AND');
    SQL.Add('	IPV.PDV_CODIGO = PDV.PDV_CODIGO');
    SQL.Add('INNER JOIN CLIENTE CLI ON');
    SQL.Add('	CLI.CNC_CODIGO = PDV.CNC_CLIENTE AND');
    SQL.Add('	CLI.CLI_CODIGO = PDV.CLI_CODIGO');
    SQL.Add('INNER JOIN PRODUTO PRD ON');
    SQL.Add('	PRD.PRD_CODIGO = IPV.PRD_CODIGO');
    SQL.Add('INNER JOIN FUNCIONARIO FUN ON');
    SQL.Add('	FUN.FUN_CODIGO = IPV.FUN_CODIGO');
    SQL.Add('WHERE PDV.PDV_CODIGO = '''+IntToStr(CdPDV)+''' AND');
    SQL.Add('  PDV.CNC_CODIGO = '''+IntToStr(CdCNC)+''' ');
    Open;
    First;
  end;

  while not DM.QR_Consultas.Eof do
  begin
    qConsultas.Close;
    qConsultas.Sql.Clear;
    qConsultas.Sql.Add('SELECT GEN_ID(G_ORCAMENT,1) FROM RDB$DATABASE');
    qConsultas.Open;
    iMaxReg := strtoInt(StrZero(StrToInt(qConsultas.FieldByname('GEN_ID').AsString),10,0));

    qComandos.Close;
    qComandos.SQL.Clear;
    qComandos.SQL.Add('INSERT INTO ORCAMENT (');
    qComandos.SQL.Add('    CODIGO,');
    qComandos.SQL.Add('    DESCRICAO,');
    qComandos.SQL.Add('    QUANTIDADE,');
    qComandos.SQL.Add('    MEDIDA,');
    qComandos.SQL.Add('    UNITARIO,');
    qComandos.SQL.Add('    TOTAL,');
    qComandos.SQL.Add('    DATA,');
    qComandos.SQL.Add('    TIPO,');
    qComandos.SQL.Add('    PEDIDO,');
    qComandos.SQL.Add('    ITEM,');
    qComandos.SQL.Add('    CLIFOR,');
    qComandos.SQL.Add('    VENDEDOR,');
    qComandos.SQL.Add('    CAIXA,');
    qComandos.SQL.Add('    VALORICM,');
    qComandos.SQL.Add('    ALIQUICM,');
    qComandos.SQL.Add('    REGISTRO,');
    qComandos.SQL.Add('    ENCRYPTHASH,');
    qComandos.SQL.Add('    COO,');
    qComandos.SQL.Add('    NUMERONF');
    qComandos.SQL.Add(') VALUES (');
    qComandos.SQL.Add('    ''' + FormatFloat('00000',DM.QR_Consultas.FieldByName('CODIGO').AsFloat)     + ''',');
    qComandos.SQL.Add('    '   + QuotedStr(Alltrim(Copy(DM.QR_Consultas.FieldByName('DESCRICAO').AsString, 0,45)))    +   ',');
    qComandos.SQL.Add('    ''' + VirgPonto(DM.QR_Consultas.FieldByName('QUANTIDADE').AsFloat)                         + ''',');
    qComandos.SQL.Add('    '   + QuotedStr(Alltrim(Copy(DM.QR_Consultas.FieldByName('MEDIDA').AsString, 0,3)))        +   ',');
    qComandos.SQL.Add('    ''' + VirgPonto(DM.QR_Consultas.FieldByName('UNITARIO').AsFloat)                           + ''',');
    qComandos.SQL.Add('    ''' + VirgPonto(DM.QR_Consultas.FieldByName('TOTAL').AsFloat)                              + ''',');
    qComandos.SQL.Add('    ''' + DateToFB(DM.QR_Consultas.FieldByName('DATA').AsDateTime)                             + ''',');
    qComandos.SQL.Add('    ''ORCAME'',');
    qComandos.SQL.Add('    ''' + FormatFloat('0000000000',DM.QR_Consultas.FieldByName('PEDIDO').AsFloat)              + ''',');
    qComandos.SQL.Add('    NULL,');
    qComandos.SQL.Add('    '   + QuotedStr(Alltrim(Copy(DM.QR_Consultas.FieldByName('CLIFOR').AsString,0,35)))        +   ',');
    qComandos.SQL.Add('    '   + QuotedStr(Alltrim(Copy(DM.QR_Consultas.FieldByName('VENDEDOR').AsString,0,30)))      +   ',');
    qComandos.SQL.Add('    NULL,');
    qComandos.SQL.Add('    NULL,');
    qComandos.SQL.Add('    NULL,');
    qComandos.SQL.Add('    ''' + FormatFloat('0000000000',StrToFloat(inttostr(iMaxREG))) + ''',');
    qComandos.SQL.Add('    NULL,');
    qComandos.SQL.Add('    NULL,');
    qComandos.SQL.Add('    NULL)');
//showmessage(qComandos.SQL.GetText);
    qComandos.ExecSQL;

    DM.QR_Consultas.Next;
  end;

  IBTransactionConn.CommitRetaining;

  with DM.QR_Comandos do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE PEDIDO_DE_VENDA SET PDV_PAF = ''S''');
    SQL.Add('WHERE PDV_CODIGO = '''+IntToStr(CdPDV)+''' AND');
    SQL.Add('  CNC_CODIGO = '''+IntToStr(CdCNC)+''' ');
    ExecSQL;
  end;
end;

function TDMFB.Replicate(pP1: String; pP2: Integer): String;
var
  i:Integer;
begin
   Result:='';
   for i := 1 to pP2 do
      Result:=Copy(Result+pP1,1,I);
end;

function TDMFB.StrTran(sP1, sP2, sP3: string): String;
var
  I : Integer;
begin
  //
  for I := 1 to 100 do
  begin
   if (Pos(sP2,sP1)<>0) then
   begin
     Insert(sP3,sP1,pos(sP2,sP1));
     Delete(sP1,pos(sP2,sP1),length(sP2));
   end;
  end;
  Result := sP1;
  //
end;

function TDMFB.StrZero(Num: Double; Zeros, Deci: integer): string;
begin
  Result:='';
  Result:=Result+StrTran(Format('%'+intToStr(Zeros)+'.'+intToStr(Deci)+'f',[Num]),' ','0');
  if pos('-',Result) > 0 then begin
     Delete(Result,pos('-',Result),1);
     Result:='-'+Result;
  end;
end;

end.
