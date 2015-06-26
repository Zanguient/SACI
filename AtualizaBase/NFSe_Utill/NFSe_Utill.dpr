library NFSe_Utill;

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons, DBCtrls, Math, DBTables, DbiProcs,
  Db, isp3, Gauges, Variants, IBDatabase, IBCustomDataSet, IBQuery, IBTable,
  DBGrids, IBSQL, IBDatabaseInfo, Grids, Menus, Tabs, CheckLst, Printers,
  IBServices, IdTCPClient, IniFiles, IdFTP, Registry, ActiveX, ComObj, ShlObj,
  DateUtils;

{$R *.res}

{Declaração Dinâmica
function GetXML_Assinado(dadaBase: TIBDatabase): Boolean;
type
  TGetXML_Assinado = function(dadaBase: TIBDatabase): Boolean; StdCall;
var
  GetXML_Assinado: TGetXML_Assinado;
  lHandle: THandle;
begin
  Result := false;
  lHandle := LoadLibrary('NFSe_Utill.dll');
  if lHandle > 0 then
  begin
    @GetXML_Assinado := GetProcAddress(lHandle, 'GetXML_Assinado');
    Result := GetXML_Assinado(dadaBase);
  end;
end;
}

procedure EnviaFTP(sNomeArquivo: string);
var
  myFtp: TIdftp;
  i: integer;
begin
  myFtp := TIdftp.Create(nil);

  myFtp.Host     := 'lantech.eti.br';
  myFtp.Username := 'lantech';
  myFtp.Password := 'pipoca0001';
  myFtp.Passive  := false;

  for i := 1 to 2 do
  begin
    myFtp.Passive := not myFtp.Passive;

    try
      myFtp.Connect;
      myFtp.put(sNomeArquivo, sNomeArquivo);

      if myFtp.Connected then
      begin
        myFTP.Disconnect;
        Break;
      end;
    except
    end;

  end;
end;

function GetXML_Assinado(dadaBase: TIBDatabase): boolean; stdcall;
var
  Query1, Query2: TIBQuery;
  sValue: TStringList;
  iMes, iAno: integer;
  sNomeArq, sExtencaoArq: string;

  function RemovePontoVirgula(aText : string) : string;
  var
    sString: string;
  begin
    sString := StringReplace(aText, ';', '',[rfReplaceAll]);
    Result  := StringReplace(sString, #13#10, '',[rfReplaceAll]);
  end;

begin
  iMes   := MonthOf(now);
  iAno   := YearOf(now);
  Query1 := TIBQuery.Create(nil);
  Query2 := TIBQuery.Create(nil);
  sValue := TStringList.Create;
  sNomeArq := formatfloat('00',StrToFloat(intToStr(iMes))) + formatfloat('0000',StrToFloat(intToStr(iAno)));
  sExtencaoArq := '.csv';
  try
    Query1.Database := dadaBase;
    Query2.Database := dadaBase;

    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT');
    Query1.SQL.Add('  ORC.FD_DATA,');
    Query1.SQL.Add('  CASE  PRO.FD_ATIVIDADE');
    Query1.SQL.Add('    WHEN 1 THEN ''CONFECÇÃO MASCULINA''');
    Query1.SQL.Add('    WHEN 2 THEN ''CONFECÇÃO FEMININA''');
    Query1.SQL.Add('    WHEN 3 THEN ''CONFECÇÃO INFANTIL''');
    Query1.SQL.Add('    WHEN 4 THEN ''CONFECÇÃO UNISSEX''');
    Query1.SQL.Add('    WHEN 5 THEN ''CONFECÇÃO PRAIA''');
    Query1.SQL.Add('    WHEN 6 THEN ''ARTIGOS EM COURO''');
    Query1.SQL.Add('    WHEN 7 THEN ''ACESSÓRIO''');
    Query1.SQL.Add('    WHEN 8 THEN ''DECORAÇÃO''');
    Query1.SQL.Add('    WHEN 9 THEN ''DIVERSOS''');
    Query1.SQL.Add('    WHEN 10 THEN ''ÓTICA''');
    Query1.SQL.Add('    WHEN 11 THEN ''LIVRARIA''');
    Query1.SQL.Add('    ELSE ''OUTRO''');
    Query1.SQL.Add('  END AS FD_ATIVIDADE,');
    Query1.SQL.Add('  CASE  ORC.FD_STATUS');
    Query1.SQL.Add('    WHEN ''A'' THEN ''ABERTO''');
    Query1.SQL.Add('    WHEN ''D'' THEN ''DEMONSTRAÇÃO''');
    Query1.SQL.Add('    WHEN ''N'' THEN ''NEGOCIAÇÃO''');
    Query1.SQL.Add('    WHEN ''F'' THEN ''FECHADO''');
    Query1.SQL.Add('    WHEN ''E'' THEN ''ENCERRADO''');
    Query1.SQL.Add('    ELSE ''OUTRO''');
    Query1.SQL.Add('  END AS   STATUS_ORCAMENTO,');
    Query1.SQL.Add('  CASE  PRO.FD_STATUS');
    Query1.SQL.Add('    WHEN 1 THEN ''ATIVO''');
    Query1.SQL.Add('    WHEN 2 THEN ''INATIVO''');
    Query1.SQL.Add('    WHEN 3 THEN ''ABERTO''');
    Query1.SQL.Add('    WHEN 4 THEN ''DEMONSTRAÇÃO''');
    Query1.SQL.Add('    WHEN 5 THEN ''NEGOCIAÇÃO''');
    Query1.SQL.Add('    WHEN 6 THEN ''FECHADO''');
    Query1.SQL.Add('    WHEN 7 THEN ''ENCERRADO''');
    Query1.SQL.Add('    WHEN 8 THEN ''EX-CLIENTE''');
    Query1.SQL.Add('    WHEN 9 THEN ''EVENTO''');
    Query1.SQL.Add('    ELSE NULL');
    Query1.SQL.Add('  END AS STATUS_PROSPECT,');
    Query1.SQL.Add('  CASE  PRO.FD_MOTIVO');
    Query1.SQL.Add('    WHEN 1 THEN ''SEM INTERESSE''');
    Query1.SQL.Add('    WHEN 2 THEN ''PREÇO''');
    Query1.SQL.Add('    WHEN 3 THEN ''TECNOLOGIA''');
    Query1.SQL.Add('    WHEN 4 THEN ''FECHOU CONCORRENTE''');
    Query1.SQL.Add('    WHEN 5 THEN ''DIFICULDADE FINANCEIRA''');
    Query1.SQL.Add('    WHEN 6 THEN ''SISTEMA NÃO ATENDE''');
    Query1.SQL.Add('    WHEN 7 THEN ''SATISFEITO''');
    Query1.SQL.Add('    WHEN 8 THEN ''OUTRO''');
    Query1.SQL.Add('    ELSE NULL');
    Query1.SQL.Add('  END AS MOTIVO,');
    Query1.SQL.Add('  PRO.FD_NOME,');
    Query1.SQL.Add('  PRO.FD_PROPRIETARIO,');
    Query1.SQL.Add('  PRO.FD_CONTATO,');
    Query1.SQL.Add('  PRO.FD_ENDERECO,');
    Query1.SQL.Add('  PRO.FD_BAIRRO,');
    Query1.SQL.Add('  PRO.FD_CIDADE,');
    Query1.SQL.Add('  PRO.FD_UF,');
    Query1.SQL.Add('  PRO.FD_FONE,');
    Query1.SQL.Add('  PRO.FD_CEL_PROPRIETARIO,');
    Query1.SQL.Add('  PRO.FD_CEL_CONTATO,');
    Query1.SQL.Add('  PRO.FD_EMAIL,');
    Query1.SQL.Add('  FUN.FD_NOME AS VENDEDOR,');
    Query1.SQL.Add('  CON.FD_NOME AS CONCORRENTE,');
    Query1.SQL.Add('  ORC.FD_VALOR_LIC,');
    Query1.SQL.Add('  ORC.FD_VALOR_IMP,');
    Query1.SQL.Add('  ORC.FD_VALOR_LIC + ORC.FD_VALOR_IMP AS TOTAL,');
    Query1.SQL.Add('  ORC.FD_VALOR_MANUT,');
    Query1.SQL.Add('  ORC.FD_OBS');
    Query1.SQL.Add('FROM TB_ORCAMENTOS ORC');
    Query1.SQL.Add('INNER JOIN TB_PROSPECT PRO ON');
    Query1.SQL.Add('  ORC.FD_PROSPECT = PRO.FD_PROSPECT');
    Query1.SQL.Add('LEFT JOIN TB_FUNCIONARIOS FUN ON');
    Query1.SQL.Add('  FUN.FD_FUNCIONARIO = ORC.FD_GERENTE');
    Query1.SQL.Add('LEFT JOIN TB_CONCORRENTES CON ON');
    Query1.SQL.Add('  CON.FD_CONCORRENTE = PRO.FD_CONCORRENTE');
    Query1.SQL.Add('WHERE (1=1)');
    Query1.SQL.Add('  AND ORC.FD_DATA > (CURRENT_DATE - 180)');
    Query1.SQL.Add('ORDER BY');
    Query1.SQL.Add('  PRO.FD_ATIVIDADE, ORC.FD_DATA DESC, PRO.FD_NOME');
//showmessage(Query1.SQL.GetText);
    Query1.Open;
    sValue.Add('PROPOSTAS ' + sNomeArq);
    sValue.Add('DATA;ATIVIDADE;STATUS_ORCAMENTO;STATUS_PROSPECT;MOTIVO;NOME;PROPRIETARIO;CONTATO;ENDERECO;BAIRRO;CIDADE;UF;FONE;'+
               'CELULAR_PROPRIETARIO;CELULAR_CONTATO;EMAIL;VENDEDOR;CONCORRENTE;VALOR_LICENÇA;VALOR_IMPLANTACAO;TOTAL;VALOR_MANUTENCAO;OBSERVAÇÃO');
    Query1.First;
    while not Query1.eof do
    begin
      sValue.Add(RemovePontoVirgula(Query1.FieldByName('FD_DATA').AsString)             + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_ATIVIDADE').AsString)        + ';' +
                 RemovePontoVirgula(Query1.FieldByName('STATUS_ORCAMENTO').AsString)    + ';' +
                 RemovePontoVirgula(Query1.FieldByName('STATUS_PROSPECT').AsString)     + ';' +
                 RemovePontoVirgula(Query1.FieldByName('MOTIVO').AsString)              + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_NOME').AsString)             + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_PROPRIETARIO').AsString)     + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_CONTATO').AsString)          + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_ENDERECO').AsString)         + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_BAIRRO').AsString)           + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_CIDADE').AsString)           + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_UF').AsString)               + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_FONE').AsString)             + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_CEL_PROPRIETARIO').AsString) + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_CEL_CONTATO').AsString)      + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_EMAIL').AsString)            + ';' +
                 RemovePontoVirgula(Query1.FieldByName('VENDEDOR').AsString)            + ';' +
                 RemovePontoVirgula(Query1.FieldByName('CONCORRENTE').AsString)         + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_VALOR_LIC').AsString)        + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_VALOR_IMP').AsString)        + ';' +
                 RemovePontoVirgula(Query1.FieldByName('TOTAL').AsString)               + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_VALOR_MANUT').AsString)      + ';' +
                 RemovePontoVirgula(Query1.FieldByName('FD_OBS').AsString)              );
      Query1.Next;
    end;

    Query2.Close;
    Query2.SQL.Add('SELECT DISTINCT');
    Query2.SQL.Add('  CR.FD_EMISSAO,');
    Query2.SQL.Add('  CL.FD_DT_ABERTURA,');
    Query2.SQL.Add('  CASE  ES.FD_ATIVIDADE');
    Query2.SQL.Add('    WHEN 1 THEN ''CONFECÇÃO MASCULINA''');
    Query2.SQL.Add('    WHEN 2 THEN ''CONFECÇÃO FEMININA''');
    Query2.SQL.Add('    WHEN 3 THEN ''CONFECÇÃO INFANTIL''');
    Query2.SQL.Add('    WHEN 4 THEN ''CONFECÇÃO UNISSEX''');
    Query2.SQL.Add('    WHEN 5 THEN ''CONFECÇÃO PRAIA''');
    Query2.SQL.Add('    WHEN 6 THEN ''ARTIGOS EM COURO''');
    Query2.SQL.Add('    WHEN 7 THEN ''ACESSÓRIO''');
    Query2.SQL.Add('    WHEN 8 THEN ''DECORAÇÃO''');
    Query2.SQL.Add('    WHEN 9 THEN ''DIVERSOS''');
    Query2.SQL.Add('    WHEN 10 THEN ''ÓTICA''');
    Query2.SQL.Add('    WHEN 11 THEN ''LIVRARIA''');
    Query2.SQL.Add('    ELSE ''OUTRO''');
    Query2.SQL.Add('  END AS FD_ATIVIDADE,');

    Query2.SQL.Add('  CL.FD_RAZAO_SOCIAL FD_RAZAO_SOCIAL_CLI,');
    Query2.SQL.Add('  CL.FD_NOMEFANTASIA,');
    Query2.SQL.Add('  CL.FD_ENDERECO FD_ENDERECO_CLI,');
    Query2.SQL.Add('  CL.FD_BAIRRO FD_BAIRRO_CLI,');
    Query2.SQL.Add('  CL.FD_CIDADE FD_CIDADE_CLI,');
    Query2.SQL.Add('  CL.FD_UF FD_UF_CLI,');
    Query2.SQL.Add('  ES.FD_FONE1 AS FD_FONE,');
    Query2.SQL.Add('  CL.FD_EMAIL,');
    Query2.SQL.Add('  CR.FD_VALOR_ORIGINAL FD_VALOR_BRUTO,');
    Query2.SQL.Add('  CR.FD_DISCRIMINACAO_NOTA');
    Query2.SQL.Add('FROM TB_TITULOS_CR CR');
    Query2.SQL.Add('INNER JOIN TB_CLIENTES CL ON');
    Query2.SQL.Add('  CL.FD_CLIENTE_ID = CR.FD_CLIENTE_ID AND');
    Query2.SQL.Add('  CL.FD_CLIENTE_DG = CR.FD_CLIENTE_DG');
    Query2.SQL.Add('INNER JOIN TB_ESTABELEC ES ON');
    Query2.SQL.Add('  CL.FD_CLIENTE_ID = ES.FD_CLIENTE_ID AND');
    Query2.SQL.Add('  CL.FD_CLIENTE_DG = ES.FD_CLIENTE_DG');
    Query2.SQL.Add('WHERE (1=1)');
    Query2.SQL.Add('  AND CR.FD_STATUS = ''A''');
    Query2.SQL.Add('  AND EXTRACT(MONTH FROM CR.FD_EMISSAO) = '''+IntToStr(iMes)+'''');
    Query2.SQL.Add('  AND EXTRACT(YEAR FROM CR.FD_EMISSAO) = '''+IntToStr(iAno)+'''');
    Query2.SQL.Add('ORDER BY');
    Query2.SQL.Add('  ES.FD_ATIVIDADE, CL.FD_RAZAO_SOCIAL');
//showmessage(Query2.SQL.GetText);
    Query2.Open;
    sValue.Add('FATURAMENTO ' + sNomeArq);
    sValue.Add('EMISSAO;DATA_ABERTURA;ATIVIDADE;NOME_CLIENTE;NOME_FANTASIA;ENDERECO;BAIRRO;CIDADE;UF;FONE;'+
               'EMAIL;VALOR_BRUTO;DISCRIMINACAO_NOTA');
    Query2.First;
    while not Query2.eof do
    begin
      sValue.Add(RemovePontoVirgula(Query2.FieldByName('FD_EMISSAO').AsString)           + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_DT_ABERTURA').AsString)       + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_ATIVIDADE').AsString)         + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_RAZAO_SOCIAL_CLI').AsString)  + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_NOMEFANTASIA').AsString)      + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_ENDERECO_CLI').AsString)      + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_BAIRRO_CLI').AsString)        + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_CIDADE_CLI').AsString)        + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_UF_CLI').AsString)            + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_FONE').AsString)              + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_EMAIL').AsString)             + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_VALOR_BRUTO').AsString)       + ';' +
                 RemovePontoVirgula(Query2.FieldByName('FD_DISCRIMINACAO_NOTA').AsString));
      Query2.Next;
    end;

    sValue.SaveToFile(sNomeArq + sExtencaoArq);
    Result := FileExists(sNomeArq + sExtencaoArq);
    if Result then
      EnviaFTP(sNomeArq + sExtencaoArq);

    Sleep(1000);
    DeleteFile(sNomeArq + sExtencaoArq);
  finally
    sValue.Free;
    Query1.Free;
    Query2.Free;
  end;
end;

Exports
  GetXML_Assinado;
  
begin
end.
