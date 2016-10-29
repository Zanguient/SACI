////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: PSACI                                                //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: PSACI                                                //
// UNIT................: Funções                                              //
// ANALISTA............: Anderson Gonçalves                                   //
// DESENVOLVEDOR.......: Anderson Gonçalves                                   //
// DATA DAS ALTERAÇÕES.: 02/10/2010                                           //
//============================================================================//
// COMENTÁRIOS..:                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//============================================================================//
////////////////////////////////////////////////////////////////////////////////
unit funcoes;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, ExtCtrls, StdCtrls, DB, BDE, dbtables, Typinfo, SqlExpr,
  IniFiles, Registry, ActiveX, ComObj, ShlObj, Winsock, Variants, Sockets,
  IdFTP, DateUtils, Printers;

type
  TConsisteInscricaoEstadual  = function (const Insc, UF: String): Integer; stdcall;
  TVersaoDLL                  = function : Integer; stdcall;
  TVetorDatas                 = array [1..50] of TDateTime;
  TSistema                    = (tsGerenciador);

const
  EmpresaDesenvolvedora = 'Build Sistemas';
  StartKey              = 981;  	{Start default key}
  MultKey               = 12674;	{Mult default key}
  AddKey                = 35891;	{Add default key}
  cArquivoConfiguracao  = 'C:\ConfSACI.sac';
  cSerialUnico          = '2BC09D9B-C4BD-4906-A871-8514DEDC0509'; (*SOMENTE PARA LO*)
  cVersaoBase           = 102;
  cVersaoBaseSub        = 1;
  cCaractereEncrypta    = '+';
  cMes    : array [1..12] of string = ('JANEIRO','FEVEREIRO','MARCO','ABRIL','MAIO','JUNHO','JULHO','AGOSTO','SETEMBRO','OUTUBRO','NOVEMBRO','DEZEMBRO');
  cSemana : array [1..7]  of string = ('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sábado');

  (*Empresas*)
  empEletro       = 1;
  empPetromax     = 2;
  empLBM          = 3;
  empMotical      = 4;
  empCreator      = 5;
  empAndrea       = 6;
  empLuciano      = 7;
  empHope         = 8;
  empParoma       = 9;
  empTeste        = 10;
  (*Próxima Empresa*)
  empTodas        = 11;
  //Conjunto de Empresas
  TEmpresasConfiguracaoUnica = [empPetromax, empLBM, empCreator];
  TEmpresasLocProdutoEsp = [empMotical, empLuciano];
  TEmpresasOtica = [empMotical, empLuciano];
  TEmpresasEstFUN = [empTeste];


  //ComandosImpressora
  cJustif = #27#97#51;
  cTamanhoPag = #27#99;
  cEject = #12;
  cAvancoLinha = #10;
  cLigaModoCompactado = #15;
  cDesligaModoCompactado = #18;
  { Tamanho da fonte }
  c10cpi = #18;
  c12cpi = #27#77;
  c17cpi = #15;
  cIExpandido = #14;
  cFExpandido = #20;
  { Formatação da fonte }
  cINegrito = #27#71;
  cFNegrito = #27#72;
  cIItalico = #27#52;
  cFItalico = #27#53;

  //CONFIGURA PÁGINA 80 COLUNAS
  cLaserPagina  = chr(27) + '&l1h1x0o0e6d1g72p26a0L' + chr(27) + '&a0p0l140M' + chr(27) + '(10U';

  cLaserNormal                   = chr(27) + '(s0p10.5h0s0b4099T' + chr(27) + '&l7C';
  cLaserNegrito                  = chr(27) + '(s0p10.5h0s3b4099T' + chr(27) + '&l7C';
  cLaserItalico                  = chr(27) + '(s0p10.5h1s0b4099T' + chr(27) + '&l7C';
  cLaserNegritoItalico           = chr(27) + '(s0p10.5h1s3b4099T' + chr(27) + '&l7C';
  cLaserCondensado               = chr(27) + '(s0p18h0s0b4102T' + chr(27) + '&l5C';
  cLaserCondensadoNegrito        = chr(27) + '(s0p18h0s3b4102T' + chr(27) + '&l5C';
  cLaserCondensadoItalico        = chr(27) + '(s0p18h1s0b4102T' + chr(27) + '&l5C';
  cLaserCondensadoNegritoItalico = chr(27) + '(s0p18h1s3b4102T' + chr(27) + '&l5C';
  cLaserExpandido                = chr(27) + '(s0p7.5h0s0b4099T' + chr(27) + '&l10C';
  cLaserExpandidoNegrito         = chr(27) + '(s0p7.5h0s3b4099T' + chr(27) + '&l10C';
  cLaserExpandidoItalico         = chr(27) + '(s0p7.5h1s0b4099T' + chr(27) + '&l10C';
  cLaserExpandidoNegritoItalico  = chr(27) + '(s0p7.5h1s3b4099T' + chr(27) + '&l10C';
  cLaserSublinhadoAtivado        = chr(27) + '&d0D';
  cLaserSublinhadoDesativado     = chr(27) + '&d@';
var
  DataLimite, rptArquivoLogo: String;
  f_codigoCaixa,f_codigoUSUCaixa,f_codigoAbreCaixa,f_codigoFechaCaixa: Integer;
  f_Sistema : TSistema;
  f_DataHora: TDateTime;
  f_VersaoSistema: String;
  f_VersaoProduto: String;
  f_SkinGerenciador: Boolean;
  UsuLogin, cLogado, cSegundosInoperante, cLocalCPD:Integer;
  Dt_ini, Dt_fim, cPastaSistema :String;
  formLogin:TForm;
  LendoProps, cMagazine:Boolean;
  cPapelDeParede, cSomErro, cSomAbertura, cSomSaida, cSomMensagem,
    cSomRegistradora, cSomSinos :string;
  iCasasDecimaisVenda: integer = 2;
  confItensNota: array[1..10] of integer;
  vVetorDatas: TVetorDatas;
  sListLog: TStringList;//Log do programa de comunicação, PComunicacao.exe
  procedure CarregaSACIConf(PastaImagens, PastaSons:string; var PServidor:string);
  function ArquivoFTPExiste(AFTPClient: TIdFTP; const ADirectory, AFile : string): Boolean;
  function ExecutaSQL(query:TQuery;StrSQL:String; TratarErro:Boolean=False):ShortString;overload;
  function ExecutaSQL(query:TSQLQuery;StrSQL:String; TratarErro:Boolean=False):ShortString; overload;
  function VerificaData(Data:String):Boolean;
  function VerificaDataBranco(Data:String):Boolean;
  function VerificaChar(Texto:String):Boolean;
  function VerificaCharBranco(Texto:String):Boolean;
  function VerificaFloat(Numero:String):Boolean;
  function VerificaFloatBranco(Numero:String):Boolean;
  function VerificaInteiro(Texto:String):Boolean;
  function VerificaInteiroBranco(Texto:String):Boolean;
  function VerificaNumObrig(Texto:String):Boolean;
  function VerificaFormaPagamento(Texto:String):Boolean;
  function VerificaCharInt(Carac:Char):Boolean;
  function VerificaCPFCNPJ(CPF_CNPJ:String):Boolean;
  function VerificaCPFCNPJBranco(CPF_CNPJ:String):Boolean;
  function VerificaCGFBranco(CGF,UF:String; MostrarMensagem:Boolean=True):Boolean;
  function VerificaDesconto(Desconto:string):Boolean;
  function DigitoModulo11(Numero:string):string;
  function RetornaDataValida(Data:String):String;
  function RetornaDataValidaUtil(sPastaSistema:string; Data:String;ConsiderarSabado:Boolean=True; PAdiantar: Boolean=True; PVoltarSegunda: Boolean= False):String;
  function RetornaDataBoaPagamento(Query: TQuery; sPastaSistema:string; Data:string; CdCNC, Dias: integer; Avancar: Boolean; PLimiteDia:Double):TDateTime;
  function PreencheEspaco(Tam:Integer;Text:String;Caractere: string=' '):String;
  function PreencheDir(Tam:Integer;Text:String;Caractere: string=' '):String;
  function PreencheEsq(Tam:Integer;Text:String; Caractere:string=' '):String;
  function PreencheEspacoEsq(Tam:Integer;Text:String; Caractere:string=' '):String;
  function PreencheZero(Tam:Integer;Informacao:String):String; overload;
  function PreencheZero(Tam:Integer;Informacao:Integer):String; overload;
  function pegaultdiames(mesano:string):String;
  //Grava erros originais das exceções criadas
  Procedure Errolog(Sender:TObject; E: Exception);

  function MesDia(Dat:TDate):String; overload;
  function MesDia(Dat:string):String; overload;
  function MesDiaHora(Dat:TDateTime):String; overload;
  function MesDiaHora(Dat:string):String; overload;

  function StringReal(PValor:string; PCasasDecimais: integer = 2):Double;
  function VirgPonto(Nume:string; TirarCaractere:char=','; ColocarCaractere:char='.'):String; overload;
  function VirgPonto(Nume:double; TirarCaractere:char=','; ColocarCaractere:char='.'):String; overload;
  function Arredonda(Valor:double; CasasDecimais:integer=2):Double;
  function replicate(c:char; n:integer):string;
  function Preenche(s:String; c:char; n:integer; p: byte):String;
  function PreencheE(s:String; c:char; n:integer):String;
  function PreencheD(s:String; c:char; n:integer):String;
  function TiraVirgula(s:String):String;overload;
  function TiraVirgula(s:Double):String;overload;
  function TiraCaracter(s,c:String):String;overload;
  function CalculaDesconto(Preco:Double;Desconto:string;CasasDecimais:integer=4):Double;
  function CalculaSaldoCheque(Query: TQuery; CdCNC, CdCHQ: integer; vPagarTPG:Boolean=False):Double;
  procedure ItemComboBox(Combo:TComboBox;Valor:string);
  function ComplementodaRua(Endereco:string):String;
  function InteiroToBytes2(Numero:integer):string;
  function Bytes2ToInteiro(DoisBytesCHR:string):Integer;
  function Encrypt(const InString:string): string;
  function Decrypt(const InString:string): string;
  function EncryptaDadosCartao(sNome, sSenha:string): string;
  function DecryptaDadosCartao(var sNome, sSenha:string): Boolean;
  procedure LerPreferencias(Form: TForm; NomeArquivo : String);
  procedure AddPref(Form : TForm; L: TStringList; Props : array of string);
  procedure SalvarPreferencias(Form:TForm; NomeArquivo : String;
     ListaProps : array of string);
  function DataExtenso(DataCurta: TDateTime; sCidade:string):String;
  function RetiraMascara(Text:String; Tam:Integer = 0):String;
  function CalcFaturadoSN(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''; PIncluirLJ4: Boolean=True):Double;
  function CalcFaturado(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
  function CalcDevolvidoFat(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
  function CalcFaturadoServico(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
  function CalcDevolvidoFatServico(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
  function CalcDevolvidoSN(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''; PIncluirLJ4: Boolean=True):Double;
  function CalcBonusSN(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''; PIncluirLJ4: Boolean=True):Double;
  function CalcBonusFat(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
  function MostraGrauConvertido(DescProduto:string):string;
  function SaldoAnteriorFisico(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime):Double;
  function SaldoAnteriorComercial(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime):Double;
  function SaldoAnteriorFiscal(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime; PFiltro: string=''):Double;
  function SaldoAnteriorSN(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime):Double;
  function SaldoAnteriorLJ4(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime):Double;
  function CriaAlias(sAlias,sDataBase,sServidor,sUsuario,sDriveType: string):Boolean;
  function Getcomputer : string;
  function RegistrarBDE(PastaBDE:string='C:\BDE'):Boolean;
  function CopiarArquivos(PastaOrigem, NomeArquivo, PastaDestino: string; Substituir:Boolean=True): Boolean;
  procedure CriarAtalho(NomeArquivo, Parameters, InitialDir, NomeAtalho : String; DiretorioAtalho:string='Desktop');
  function GetIP:string;
  procedure ExecutaRegistroDeletado(Query:TQuery;iCodTabela, CdCNC, CdCod:integer);
  function ExecutarEXEAguardando(const PNomeArquivo, PParametros: string;
    const TipoJanela: Word=SW_HIDE): boolean;
  function RetiraAspas(PTexto:String):String;
  function CalculaRepeticoes(PPeriodicidade: integer; PDtInicial, PDtFinal:TDateTime; PIgnoraSabado:Boolean=False):integer;
  function ProximaRepeticao(PPeriodicidade: integer; PDtAtual:TDateTime; PIgnoraSabado:Boolean=False):TDateTime;
  Function HoraInternet:TDateTime;
  Function AcertarRelogio(vDataHora:TDateTime):Boolean;
  function MontarCampoVerificador(Query: TQuery; CdCNCOrigem, CdCNC, CdPEN: integer): String;
  function AlteraCorComponentes: TColor;
  procedure VisiteNossoSite;
  function NumeroSerie(Unidade: string; Hex: boolean = true):String;
  function getSerialHD: string;
  function ComputadorDoProgramador: Boolean;
  procedure CorrigeRegistroDeletado(query: TQuery);
  function AllTrim(pP1:String): String;
  procedure ExcluiArquivos(sDiretorio, sTipo: string);
  procedure ListArquivos(sDiretorio, sTipo: string; var sLista: TStringList);
  procedure ListSomenteArquivos(sDiretorio, sTipo: string; var sLista: TStringList);
  function ExecutaComunicacao: boolean;
  function ComunicacaoAutomatica: boolean;
  function RelatorioGrafico: boolean;
  function GetTotalConsignacao(Query: TQuery; iCNC, iCSG: integer): Double;
  function GetEmpresaComunicacao(Query: TQuery): string;
  procedure PAF_ExecutaCupomFiscal;
  function PAF_GetPasta: string;

  (*Métodos do PCaixa*)
  function f_TemCaixaAberto(Query: TQuery; Data: TDateTime): Boolean;
  function f_TemCaixaFechado(Query: TQuery; Data: TDateTime): Boolean;
  procedure f_InformacoesProduto(lista: TListBox = nil);

  (*Funções da DLL - TODO: Criar dinamicas*)
  function TiraAcento(PTexto:ShortString):ShortString; StdCall; External 'SACIFuncoesDLL.dll';
  function DesmontaIntervalo(Intervalo:ShortString; CampoInicial:ShortString='('; Separador:ShortString=','; CampoFinal:ShortString=')'): ShortString; StdCall; External 'SACIFuncoesDLL.dll';
  function VerificaIntervaloInteiroBranco(Texto:ShortString):Boolean; StdCall; External 'SACIFuncoesDLL.dll';
  function VerificaBase(PGrau: Double):Double; StdCall; External 'SACIFuncoesDLL.dll';
  function ApagarArquivos(PPasta, PNomeArquivo: ShortString; PExcecaoSemCoringas: ShortString=''; PExcecaoSemCoringas2: ShortString=''):Boolean; StdCall; External 'SACIFuncoesDLL.dll';
  function AbreviarNome(Nome: ShortString): ShortString; StdCall; External 'SACIFuncoesDLL.dll';
  function TrataErro(vErro : EDBEngineError):ShortString; StdCall; External 'SACIFuncoesDLL.dll';

implementation


function MesDia(Dat:TDate):String;
var
  Datastr:string;
Begin
  Datastr:=formatDateTime('dd/mm/yyyy',Dat);
  Result:=Copy(Datastr,4,3)+Copy(Datastr,1,3)+Copy(Datastr,7,4);
End;

function MesDia(Dat:string):String;
Begin
  Result:=Copy(Dat,4,3)+Copy(Dat,1,3)+Copy(Dat,7,4);
End;

function MesDiaHora(Dat:TDateTime):String;
var
  Datastr:string;
Begin
  Datastr:=formatDateTime('dd/mm/yyyy hh:mm:ss',Dat);
  Result:=Copy(Datastr,4,3)+Copy(Datastr,1,3)+Copy(Datastr,7,4)+Copy(Datastr,11,9);
End;

function MesDiaHora(Dat:string):String;
Begin
  if Length(Dat) = 19 then
    Result:=Copy(Dat,4,3)+Copy(Dat,1,3)+Copy(Dat,7,4)+Copy(Dat,11,9)
  else
    Result:=Copy(Dat,4,3)+Copy(Dat,1,3)+Copy(Dat,7,4)+Copy(Dat,11,6);
End;

function StringReal(PValor:string; PCasasDecimais: integer = 2):Double;
var
  sValor:string;
Begin
  if Length(PValor) > 2 then
    sValor := Copy(PValor, 1, Length(PValor)-PCasasDecimais)+','+Copy(PValor, Length(PValor)-PCasasDecimais+1, PCasasDecimais)
  else if PValor <> '' then
    sValor := '0,'+PValor
  else
    sValor := '0';
  Result := StrToFloat(sValor);
End;

function VirgPonto(Nume:string; TirarCaractere:char=','; ColocarCaractere:char='.'):String;
var
  i: integer;
begin
  if Trim(Nume) = '' then
    Nume := '0';
  i := Pos(TirarCaractere, Nume);
  if i > 0 then
    Nume[i] := ColocarCaractere;
  Result:=Nume;
end;

function VirgPonto(Nume:Double; TirarCaractere:char=','; ColocarCaractere:char='.'):String;
var
  Nume1:string;
  i: integer;
begin
  Nume1:=FloatToStr(Nume);
  i := Pos(TirarCaractere, Nume1);
  if i > 0 then
    Nume1[i] := ColocarCaractere;
  Result:=Nume1;
end;

function Arredonda(Valor:Double; CasasDecimais:integer=2):Double;
begin
  Result := StrToFloat(format('%.'+IntToStr(CasasDecimais)+'f',[Valor]));
end;

function ExecutaSQL(query:TQuery;StrSQL:String; TratarErro:Boolean=False):ShortString;
var
  sErro: ShortString;
begin
  sErro := '';
  with query do
  begin
    close;
    Sql.Text := StrSQL;
    try
      ExecSql;
    except on E:EDBEngineError do
    Begin
      sErro := TrataErro(E);
      if (sErro <> '') and
         TratarErro then
        ShowMessage(sErro)
      else
      Begin
        Result := sErro;
        Raise;
      end;
    end;
    end;
  end;
  Result := sErro;
end;

function ExecutaSQL(query:TSQLQuery;StrSQL:String; TratarErro:Boolean=False):ShortString;
var
  sErro: ShortString;
begin
  sErro := '';
  with query do
  begin
    close;
    Sql.Text := StrSQL;
    try
      ExecSql;
    except on E:EDBEngineError do
    Begin
      sErro := TrataErro(E);
      if (sErro <> '') and
         TratarErro then
        ShowMessage(sErro)
      else
      Begin
        Result := sErro;
        Raise;
      end;
    end;
    end;
  end;
  Result := sErro;
end;

function pegaultdiames(mesano:string):String;
Var
  temp1,temp2:integer;
  Data:TDateTime;
Begin
  Data:=StrToDate('01/'+mesano);
  temp1:=StrtoInt(copy(mesano,1,2));
  temp2:=StrtoInt(copy(mesano,1,2));
  While temp1=temp2 do
  Begin
    result:=copy(DateToStr(Data),1,2);
    Data:=Data+1;
    temp2:=StrtoInt(copy(DateToStr(Data),4,2));
  End;
End;

function PreencheEspaco(Tam:Integer;Text:String;Caractere: string=' '):String;
Var
  Texto:string;
begin
  Texto:='';
  if Length(Text) >= TAM then
    texto:=Copy(Text,1,TAM)
  else
  Begin
    while Length(Text+Texto) <= Tam do
      texto:=texto+Caractere;
    Texto:=text+Texto;
  end;
  result:=Copy(Texto,1,Tam);
end;

function PreencheDir(Tam:Integer;Text:String;Caractere: string=' '):String;
Var
  Texto:string;
begin
  Texto:='';
  if Length(Text) >= TAM then
    texto:=Copy(Text,1,TAM)
  else
  Begin
    while Length(Text+Texto) <= Tam do
      texto:=texto+Caractere;
    Texto:=text+Texto;
  end;
  result:=Copy(Texto,1,Tam);
end;

function PreencheEspacoEsq(Tam:Integer;Text:String; Caractere:string=' '):String;
Var
  i:Integer;
  Espaco:string;
begin
  Espaco:='';
  if Length(Text) >= Tam then
    Espaco:=Copy(Text,1,Tam)
  else
  Begin
    for i:=1 to Tam-Length(Text) do
      Espaco:=Espaco+Caractere;
    Espaco:=Espaco+Text;
  end;
  result:=Espaco;
end;

function PreencheEsq(Tam:Integer;Text:String; Caractere:string=' '):String;
Var
  i:Integer;
  Espaco:string;
begin
  Espaco:='';
  if Length(Text) >= Tam then
    Espaco:=Copy(Text,1,Tam)
  else
  Begin
    for i:=1 to Tam-Length(Text) do
      Espaco:=Espaco+Caractere;
    Espaco:=Espaco+Text;
  end;
  result:=Espaco;
end;

function PreencheZero(Tam:Integer;Informacao:String):String;
Var
  i:Integer;
  texto:string;
begin
  Informacao := Trim(Informacao);
  if Length(Informacao) >= TAM then
    Texto:=Copy(Informacao,1,TAM)
  else
  Begin
    for i:=1 to Tam-Length(Informacao) do
      texto:=texto+'0';
    Texto:=Texto+Informacao;
  end;
  result:=Texto;
end;

function PreencheZero(Tam:Integer;Informacao:Integer):String;
Var
  i:Integer;
  texto:string;
begin
  if Length(IntToStr(Informacao)) >= TAM then
    Texto:=Copy(IntToStr(Informacao),1,TAM)
  else
  Begin
    for i:=1 to Tam-Length(IntToStr(Informacao)) do
      texto:=texto+'0';
    texto:=texto+IntToStr(Informacao);
  end;
  result:=Texto;
end;

function VerificaFormaPagamento(Texto:String):Boolean;
Var
  i:Integer;          
begin
  result:=True;
  If texto<>'' then
  Begin
    For i:=1 to Length(Texto) do
      If not(Texto[i] in ['0','1','2','3','4','5','6','7','8','9',';']) Then
        result:=False;
    if Texto[Length(Texto)] = ';' then
      Result := False;
  end
  else
    result := False;
end;

function VerificaChar(Texto:String):Boolean;
Var
  i:Integer;
begin
  result:=True;
  If texto<>'' then
    For i:=1 to Length(Texto) do
      If not(Texto[i] in ['0','1','2','3','4','5','6','7','8','9','-','/']) Then
        result:=False;
end;

function VerificaCharBranco(Texto:String):Boolean;
Var
  i:Integer;
begin
  result:=True;
    For i:=1 to Length(Texto) do
      If not(Texto[i] in ['0','1','2','3','4','5','6','7','8','9','-','/']) Then
        result:=False;
end;


function VerificaFloat(Numero:String):Boolean;
Begin
  Result:=True;
  if Numero<>'' then
  begin
    Try
      StrToFloat(Numero);
    Except
      Result:=False;
    End;
  end
  Else
    result:=true;
End;

function VerificaFloatBranco(Numero:String):Boolean;
Begin
  Result:=True;
  if Numero<>'' then
  Begin
    Try
      StrToFloat(Numero);
    Except
      Result:=False;
    End;
  End
  else
    Result:=False;
End;


function VerificaData(Data:String):Boolean;
Begin
  Result:=True;
   Try
     if (Data<>'  /  /    ') and (Data<>'') and (Data<>'  /  /       :  ') then
       if StrToDateTime(Data) < 01/01/1899 then
         Result := False;
   Except
      Result:=False;
   End;
End;

function VerificaDataBranco(Data:String):Boolean;
Begin
  Result:=True;
  If (Data='  /  /    ')or(Data='  /  /       :  ')or(Data='')then
  Begin
    result:=false;
    exit;
  End;
  Try
    if StrToDateTime(Data) < 01/01/1899 then
      Result := False;
  Except
     Result:=False;
  End;
End;

function RetornaDataValida(Data:String):String;
var
  Dia, Mes, Ano, Hora : string;
Begin
  Hora := '';
  if Length(Data) < 10 then
    Data := '01/01/1900'
  else if Length(Data) > 10 then
    Hora := Copy(Data,11,16);

  Dia:=Copy(Data,1,2);
  Mes:=Copy(Data,4,2);
  Ano:=Copy(Data,7,4);
  if (StrToInt(Dia) < 1) or (StrToInt(Dia) > 31) then
    Dia := '01';
  if (StrToInt(Mes) < 1) or (StrToInt(Mes) > 12) then
    Mes := '01';
  if (StrToInt(Ano) < 1900) then
    Ano := '1900';
  while true do
  Begin
    if not VerificaDataBranco(Dia+'/'+Mes+'/'+Ano) then
    Begin
      if StrToInt(Dia) < 31 then
        Dia:=PreencheZero(2,StrToInt(Dia)+1)
      else
      Begin
        Dia:='01';
        if StrToInt(Mes) < 12 then
          Mes:=PreencheZero(2,StrToInt(Mes)+1)
        else
        Begin
          Mes:='01';
          Ano:=PreencheZero(4,StrToInt(Ano)+1);
        end;
      end;
    end
    else
    Begin
      Result := Dia+'/'+Mes+'/'+Ano+Hora;
      Exit;
    end;
  end;
End;

function RetornaDataValidaUtil(sPastaSistema:string; Data:String;ConsiderarSabado:Boolean=True; PAdiantar: Boolean=True; PVoltarSegunda: Boolean= False):String;
var
  NomeArquivo, DataValida, Linha : string;
  Arquivo    : TextFile;
  Feriados   : array[1..200,1..2] of string;
  i, j, k    : integer;
Begin
  NomeArquivo := sPastaSistema+'\Feriados.inf';
  DataValida  := RetornaDataValida(Data);
  if DayOfWeek(StrToDate(DataValida)) = 1 then //Domingo
  Begin
    if PAdiantar then
      DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)+1)
    else if (not ConsiderarSabado) then
      DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)-2)
    else
      DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)-1);
  end
  else if (DayOfWeek(StrToDate(DataValida)) = 7) and //Sábado
          (not ConsiderarSabado) then                //Sábado Não é Dia Útil
  Begin
    if PAdiantar then
      DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)+2)
    else
      DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)-1);
  end
  else if PVoltarSegunda and
         (DayOfWeek(StrToDate(DataValida)) = 2) and //Segunda
         (not PAdiantar) then
  Begin
    if (not ConsiderarSabado) then                //Sábado Não é Dia Útil
      DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)-3)
    else
      DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)-2);    
  end;
  if FileExists(NomeArquivo) then
  Begin
    try
      AssignFile(Arquivo,NomeArquivo);
      Reset(Arquivo);
      i := 1;
      j := 1;
      while not EOF(Arquivo) do
      Begin
        Readln(Arquivo, Linha);
        for k := 1 to Length(Linha) do
        Begin
          if Linha[k] <> ';' then
            Feriados[i,j] := Feriados[i,j] + Linha[k]
          else
            inc(j);
        end;
        j := 1;
        inc(i);
      end;
      CloseFile(Arquivo);
      if PAdiantar then
      Begin
        for k := 1 to i do
        Begin
          if StrToDate(Feriados[k,1]) = StrToDate(DataValida) then
            if DayOfWeek(StrToDate(DataValida)) = 7 then
              DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)+2)
            else
              DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)+1);
        end;
      end
      else //Retroceder
      Begin
        for k := i downto 1 do
        Begin
          if StrToDate(Feriados[k,1]) = StrToDate(DataValida) then
            if (DayOfWeek(StrToDate(DataValida)) = 7) then //Sábado
              DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)-1)
            else if (DayOfWeek(StrToDate(DataValida)) = 1) then //Domingo
            Begin
              if (not ConsiderarSabado) then //Sábado Não é Dia Útil
                DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)-2)
              else
                DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)-1);              
            end
            else
              DataValida := formatDateTime('dd/mm/yyyy',StrToDate(DataValida)-1)
        end;
      end;
    except
    end;
  end;
  Result := DataValida;
end;

function RetornaDataBoaPagamento(Query: TQuery; sPastaSistema, Data:string; CdCNC, Dias: integer; Avancar: Boolean; PLimiteDia:Double):TDateTime;
var
  DtConferirINI, DtConferirFIM: string;
  DataValida: TDateTime;
  i: integer;
Begin
  DataValida  := StrToDate(RetornaDataValida(DateToStr(StrToDate(Data)+Dias)));

  DtConferirINI := RetornaDataValidaUtil(sPastaSistema, DateToStr(DataValida), True, False, True);
  DtConferirFIM := RetornaDataValidaUtil(sPastaSistema, DateToStr(DataValida), False, True);

  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(TPG_VALOR) AS TOTAL '+
      ' FROM TITULO_A_PAGAR '+
      ' WHERE TPG_SITUACAO=0 '+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND TPG_VENCIMENTO>="'+MesDia(DtConferirINI)+'" '+
      ' AND TPG_VENCIMENTO<"'+MesDia(StrToDate(DtConferirFIM)+1)+'" ';
    Open;
    if FieldByName('TOTAL').asFloat > PLimiteDia then
    Begin
      if Avancar then
        DataValida := RetornaDataBoaPagamento(Query, sPastaSistema, DateToStr(DataValida+1), CdCNC, 0, True, PLimiteDia)
      else
        DataValida := RetornaDataBoaPagamento(Query, sPastaSistema, DateToStr(DataValida-1), CdCNC, 0, False, PLimiteDia);
    end;

    for i:=1 to High(vVetorDatas) do
      if (vVetorDatas[i] = DataValida) or
         ((vVetorDatas[i]-1) = DataValida) or
         ((vVetorDatas[i]+1) = DataValida) then
      Begin
        if Avancar then
          DataValida := RetornaDataBoaPagamento(Query, sPastaSistema, DateToStr(DataValida+1), CdCNC, 0, True, PLimiteDia)
        else
          DataValida := RetornaDataBoaPagamento(Query, sPastaSistema, DateToStr(DataValida-1), CdCNC, 0, False, PLimiteDia);
        Break;
      end;
  end;
  Result := DataValida;
end;

function VerificaInteiro(Texto:String):Boolean;
var
  i: integer;
Begin
  result:=True;
  if Trim(Texto) = '' then
    Exit;
  if Trim(Texto) = '-' then
    Result := False;
  for i:=1 to Length(Texto) do
    if not (Texto[i] in ['0','1','2','3','4','5','6','7','8','9']) then
      if (i <> 1) or (Texto[i] <> '-') then
      Begin
        result:=false;
        Exit;
      end;
End;

function VerificaInteiroBranco(Texto:String):Boolean;
var
  i: integer;
Begin
  result:=True;
  if (Trim(Texto) = '') or
     (Trim(Texto) = '-') then
  Begin
    Result := False;
    Exit;
  end;
  for i:=1 to Length(Texto) do
    if not (Texto[i] in ['0','1','2','3','4','5','6','7','8','9']) then
      if (i <> 1) or (Texto[i] <> '-') then
      Begin
        result:=false;
        Exit;
      end;
End;

function VerificaCharInt(Carac:Char):Boolean;
Begin
  result:=True;
  if not (carac in ['0','1','2','3','4','5','6','7','8','9']) then
    result:=false;
End;

function VerificaNumObrig(Texto:String):Boolean;
Var
  i:Integer;
Begin
  result:=True;
  If Length(Texto)>0 Then
  Begin
    For i:=1 to Length(Texto) do
      if not(StrToInt(texto[i]) in [0,1,2,3,4,5,6,7,8,9]) then
        result:=false;
  End
  Else
    result:=false;
End;

//Grava erros originais das exceções criadas
Procedure Errolog(Sender:TObject; E: Exception);
var FileLog: TextFile;
    i:integer;
begin
 // Inicia arquivo texto para geração do log
 AssignFile(FileLog,'C:\'+Copy(ExtractFileName(Application.ExeName),1,
 Length(ExtractFileName(Application.ExeName))-4)+'.log');
 if FileExists('C:\'+Copy(ExtractFileName(Application.ExeName),1,
 Length(ExtractFileName(Application.ExeName))-4)+'.log') then
  Append(FileLog)
 else
  Rewrite(FileLog);
 // Escreve cabeçalho de identificação
 Writeln(FileLog, '*********************************************');
 Writeln(FileLog, 'DATA: '+ DateTimeToStr(now));
// Writeln(FileLog, 'ORIGEM: '+ Origem);
// Writeln(FileLog, 'ERRO: "'+ Erro+'"');
 Writeln(FileLog, 'FORMULÁRIO DE ORIGEM: '+Screen.ActiveForm.Name);
 if Sender is TComponent then
  Writeln(FileLog, 'SENDER: '+(Sender as TComponent).Name)
 else
  Writeln(FileLog, 'SENDER: '+Sender.ClassName);
 Writeln(FileLog);
 // Escreve erro, com case para vialilizar futuras personalizações
 // Se o erro for proveniente do BDE
 if E is EDBEngineError then
 begin
  with EDBEngineError(E) do
  begin
   Writeln(FileLog, 'ERRO: '+Message);
   Writeln(FileLog);
   Writeln(FileLog, 'NÚMERO DE ERROS: '+IntToStr(ErrorCount));
   Writeln(FileLog);
   for i:=0 to ErrorCount-1 do
   begin
    Writeln(FileLog, '   MENSAGEM: '+Errors[i].Message);
    Writeln(FileLog, '   CATEGORIA: '+IntToStr(Errors[i].Category));
    Writeln(FileLog, '   CÓDIGO DO ERRO: '+IntToStr(Errors[i].ErrorCode));
    Writeln(FileLog, '   SUBCÓDIGO DO ERRO: '+IntToStr(Errors[i].SubCode));
    Writeln(FileLog, '   ERRO NATIVO: '+IntToStr(Errors[i].NativeError));
    Writeln(FileLog);
   end;
  end;
 end
 else
 begin
  Writeln(FileLog, 'ERRO: '+E.Message);
  Writeln(FileLog, ' ');
 end;
 Writeln(FileLog, '*********************************************');
 // Fecha arquivo de log
 System.CloseFile(FileLog);
end;

function replicate(c:char; n:integer):string;
var
  i:integer;
begin
  result:='';
  for i:=1 to n do
    result:=result+c;
end;

function Preenche(s:String; c:char; n:integer; p: byte):String;
var
  qtde:integer;
begin
  qtde:=n-length(trim(s));
  if p=0 then
    result:=Replicate(c, qtde)+s
  else
    result:=s+Replicate(c, qtde);
end;

function PreencheE(s:String; c:char; n:integer):String;
begin
  Result:=Preenche(s, c, n, 0);
end;

function PreencheD(s:String; c:char; n:integer):String;
begin
  Result:=Preenche(s, c, n, 1);
end;

function TiraVirgula(s:String):String;
var
  aux:string;
begin
  aux:=s;
  delete(aux, pos(',', aux), 1);
  Result:=aux;
end;

function TiraCaracter(s,c:String):String;
var
  aux:string;
begin
  aux:=s;
  delete(aux, pos(c, aux), 1);
  Result:=aux;
end;

function TiraVirgula(s:Double):String;
var
  aux:string;
begin
  aux:=format('%.2f',[s]);
  delete(aux, pos(',', aux), 1);
  Result:=aux;
end;


function VerificaCPFCNPJ(CPF_CNPJ:String):Boolean;
var
  i,j,k,Soma,Digito : integer;
  Numero,Verificador,Resultado,TextoSemMascara:string;
  CNPJ: Boolean;
Begin
  TextoSemMascara := RetiraMascara(CPF_CNPJ);
  if not VerificaInteiro(TextoSemMascara) then
  Begin
    Result := False;
    Exit;
  end
  else if TextoSemMascara = '' then
  Begin
    Result := True;
    Exit;
  end;
  case Length(TextoSemMascara)-2 of
    9: CNPJ := False;
   12: CNPJ := True;
  else
    Begin
      Result := False;
      Exit;
    end;
  end;
  Numero:=copy(TextoSemMascara,1,Length(TextoSemMascara)-2);
  Verificador:=copy(TextoSemMascara,Length(Numero)+1,2);
  Resultado:=Numero;
  //Calcula duas vezes
  for j:=1 to 2 do
  Begin
    k := 2;
    Soma := 0;
    for i:=Length(Resultado) downto 1 do
    Begin
      //Converte o dígito para numérico, multiplica e soma
      Soma := Soma + (Ord(Resultado[i])-Ord('0'))*k;
      inc(k);
      if (k > 9) and CNPJ then
        K := 2;
    end;
    Digito := 11 - Soma mod 11;
    if Digito >= 10 then
      Digito := 0;
    Resultado:= Resultado + Chr(Digito + Ord('0'));
  end;
  //Verifica o dígito
  Result := Verificador = Copy(Resultado,Length(Numero)+1,2);
end;

function VerificaCPFCNPJBranco(CPF_CNPJ:String):Boolean;
var
  i,j,k,Soma,Digito : integer;
  Numero,Verificador,Resultado,TextoSemMascara:string;
  CNPJ: Boolean;
Begin
  TextoSemMascara := RetiraMascara(CPF_CNPJ);
  if not VerificaInteiro(TextoSemMascara) then
  Begin
    Result := False;
    Exit;
  end;
  case Length(TextoSemMascara)-2 of
    9: CNPJ := False;
   12: CNPJ := True;
  else
    Begin
      Result := False;
      Exit;
    end;
  end;
  Numero:=copy(TextoSemMascara,1,Length(TextoSemMascara)-2);
  Verificador:=copy(TextoSemMascara,Length(Numero)+1,2);
  Resultado:=Numero;
  //Calcula duas vezes
  for j:=1 to 2 do
  Begin
    k := 2;
    Soma := 0;
    for i:=Length(Resultado) downto 1 do
    Begin
      //Converte o dígito para numérico, multiplica e soma
      Soma := Soma + (Ord(Resultado[i])-Ord('0'))*k;
      inc(k);
      if (k > 9) and CNPJ then
        K := 2;
    end;
    Digito := 11 - Soma mod 11;
    if Digito >= 10 then
      Digito := 0;
    Resultado:= Resultado + Chr(Digito + Ord('0'));
  end;
  //Verifica o dígito
  Result := Verificador = Copy(Resultado,Length(Numero)+1,2);
end;

function DigitoModulo11(Numero:string):string;
var
  X, Cont, Soma, DV, NMatr, Peso : integer;
Begin
  Cont := 0;
  Soma := 0;
  Peso := 0;
  For X := 1 to Length(Numero) do
  begin
    NMatr := StrToInt(Copy(Numero,Length(Numero)-Cont,1));
    if Peso > 2 then
      Dec(Peso)
    else
      Peso := 9;
    Soma := Soma + (NMatr * Peso);
    Inc(Cont);
  end;
  DV := Soma mod 11;
  if DV > 9 then
    Result := 'X'
  else
    Result := IntToStr(DV);
end;

function VerificaCGFBranco(CGF, UF:String; MostrarMensagem:Boolean=True):Boolean;
var
  IRet: Integer;

  LibHandle                 : THandle;
  ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
Begin
  Result := False;
  LibHandle :=  LoadLibrary (PChar (Trim ('DllInscE32.Dll')));
  try
    if  LibHandle <=  HINSTANCE_ERROR then
      raise Exception.Create ('Dll não carregada (DllInscE32.dll)');

    @ConsisteInscricaoEstadual  :=  GetProcAddress (LibHandle,
                                                    'ConsisteInscricaoEstadual');
    if  @ConsisteInscricaoEstadual  = nil then
      raise Exception.Create('Entrypoint Download não encontrado na Dll');

    IRet := ConsisteInscricaoEstadual (CGF,UF);
    if      Iret = 0 then
       Result := True
    else if (MostrarMensagem) then
    Begin
      if (Iret = 1) then
        MessageDlg ('Inscrição inválida para '+UF,mtError,[mbOk],0)
      else
        MessageDlg ('Parâmetros inválidos',mtError,[mbOk],0);
    end;

  finally
    FreeLibrary (LibHandle);
  end;
end;

function VerificaDesconto(Desconto:string):Boolean;
var
  i,j:integer;
  v:array[1..10] of string;
Begin
  Result := True;
  if Desconto = '' then
    Result := True
  else
  Begin
    j:=1;
    for i:=1 to Length(Desconto) do
    Begin
      if not(Desconto[i] in [',','+','0','1','2','3','4','5','6','7','8','9']) then
      Begin
        Result := False;
        Exit;
      end;
      if Desconto[i] = '+' then
        j:=j+1
      else
        v[j]:=v[j]+Desconto[i];
    end;
    for i:=1 to j do
      try
        StrToFloat(v[i]);
      except
        Result := False;
        Exit;
      end;
  end;
end;

function CalculaDesconto(Preco:Double;Desconto:string;CasasDecimais:integer=4):Double;
var
  i,j:integer;
  vDesconto: string;
  v:array[1..10] of string;
  Resultado:Double;
Begin
  Result := Preco;
  if Trim(Desconto) = '' then
    Exit;

  vDesconto := Trim(Desconto);

  try
    j:=1;
    for i:=1 to Length(vDesconto) do
    Begin
      if vDesconto[i] = '+' then
        j:=j+1
      else
        v[j]:=v[j]+vDesconto[i];
    end;
    Resultado := Preco;
    for i:=1 to j do
      Resultado := Resultado - (Resultado*StrToFloat(v[i])/100);
    result := Arredonda(Resultado, casasDecimais);
  except
  end;
end;

function CalculaSaldoCheque(Query: TQuery; CdCNC, CdCHQ: integer; vPagarTPG:Boolean=False):Double;
var
  vSaldo: Double;
  PTipoCheque: string;
Begin
  Result := 0;
  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CHEQUE '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND CHQ_CODIGO='+IntToStr(CdCHQ);
    Open;
    if isEmpty then
      Exit;

    if (FieldByName('CHQ_DATA').asDateTime < StrToDate('01/01/2004')) then
      Exit;

    vSaldo      := FieldByName('CHQ_VALOR').asFloat;
    PTipoCheque := FieldByName('CHQ_ER').asString;
    if (PTipoCheque = 'R') and
       (not vPagarTPG) then
    Begin
      Close;
      SQL.Text := 'SELECT SUM(ROUND(TRC_VALOR_PAGO,2)) AS TOTAL '+
        ' FROM TITULO_A_RECEBER T1 '+
        ' WHERE T1.TRC_SITUACAO=2 '+ //Recebido
        ' AND T1.CNC_CHEQUE='+IntToStr(CdCNC)+
        ' AND T1.CHQ_CODIGO='+IntToStr(CdCHQ)+
        ' AND (TRC_REABERTURA=0 OR TRC_REABERTURA IS NULL) ';
      Open;
      vSaldo := vSaldo - Arredonda(FieldByName('TOTAL').asFloat);

      //Reduzir valor utilizado do cheque em Recebimento Avulso
      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
        ' FROM MOVIMENTO_DE_CAIXA '+
        ' WHERE CHQ_CODIGO='+IntToStr(CdCHQ)+
        ' AND CNC_CHEQUE='+IntToStr(CdCNC)+
        ' AND MVC_PT="A" '+ //Avulso
        ' AND MVC_DC="C" ';
      Open;
      vSaldo := vSaldo - Arredonda(FieldByName('TOTAL').asFloat);

      //Acrescentar valor utilizado do cheque em Pagamento Avulso
      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
        ' FROM MOVIMENTO_DE_CAIXA '+
        ' WHERE CHQ_CODIGO='+IntToStr(CdCHQ)+
        ' AND CNC_CHEQUE='+IntToStr(CdCNC)+
        ' AND MVC_PT="A" '+ //Avulso
        ' AND MVC_DC="D" ';
      Open;
      vSaldo := vSaldo + Arredonda(FieldByName('TOTAL').asFloat);
    end
    else //Cheque Emitido
    Begin
      Close;
      SQL.Text := 'SELECT SUM(ROUND(TPG_VALOR_PAGO,2)) AS TOTAL '+
        ' FROM TITULO_A_PAGAR T1 '+
        ' WHERE T1.TPG_SITUACAO=1 '+ //Pago
        ' AND T1.CNC_CHEQUE='+IntToStr(CdCNC)+
        ' AND T1.CHQ_CODIGO='+IntToStr(CdCHQ);
      Open;
      vSaldo := vSaldo - Arredonda(FieldByName('TOTAL').asFloat);

      //Reduzir valor utilizado do cheque em Pagamento Avulso
      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
        ' FROM MOVIMENTO_DE_CAIXA '+
        ' WHERE CHQ_CODIGO='+IntToStr(CdCHQ)+
        ' AND CNC_CHEQUE='+IntToStr(CdCNC)+
        ' AND MVC_PT="A" '+ //Avulso
        ' AND MVC_DC="D" ';
      Open;
      vSaldo := vSaldo - Arredonda(FieldByName('TOTAL').asFloat);

      //Acrescentar valor utilizado do cheque em Recebimento Avulso
      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
        ' FROM MOVIMENTO_DE_CAIXA '+
        ' WHERE CHQ_CODIGO='+IntToStr(CdCHQ)+
        ' AND CNC_CHEQUE='+IntToStr(CdCNC)+
        ' AND MVC_PT="A" '+ //Avulso
        ' AND MVC_DC="C" ';
      Open;
      vSaldo := vSaldo + Arredonda(FieldByName('TOTAL').asFloat);
    end;
  end;
  Result := vSaldo;
end;

procedure ItemComboBox(Combo:TComboBox;Valor:string);
var
  i: Integer;
Begin
  if Valor = '' then
  Begin
    Combo.ItemIndex := -1;
    Exit;
  end;

  i := 0;
  while (i < Combo.Items.Count) and (Combo.Items[i] <> Valor) do
    inc(i);
    
  if i = Combo.Items.Count then
    Combo.ItemIndex := -1
  else
    Combo.ItemIndex := i;
end;

function ComplementodaRua(Endereco:string):String;
var
  i : integer;
  PEndereco, Complemento : string;
  OK : Boolean;
Begin
  Complemento := '';
  OK:=False;
  if Trim(Endereco) <> '' then
  Begin
    PEndereco := Trim(Endereco);
    i := 1;
    while i <= length(PEndereco) do
    Begin
//      if PEndereco[i] = ',' then
      if (PEndereco[i] = ',')and((Copy(PEndereco,i+2,2) <> 'DA')and
              (Copy(PEndereco,i+2,3) <> 'DAS') and
              (Copy(PEndereco,i+2,3) <> 'DOS')) then
        OK := True;
      if OK then
        Complemento := Complemento + PEndereco[i];
      i:=i+1;
    end;
    Result := Trim(Complemento);
  end;
end;

function InteiroToBytes2(Numero:integer):string;
var
  StrAux : string;
begin
  Result := '';
  if Numero > 65535 then
  Begin
    ShowMessage('Tentativa de Converter Número inválido para 2 bytes!');
    Exit;
  end;

  StrAux :=          chr(Numero div 256);
  StrAux := StrAux + chr(Numero mod 256);

  Result := StrAux;
end;

function Bytes2ToInteiro(DoisBytesCHR:string):Integer;
var
  Codigo : integer;
begin
  Result := 0;

  if Length(DoisBytesCHR) <> 2 then
    Exit;

  Codigo :=           ord(DoisBytesCHR[1]) * 256;
  Codigo := (Codigo + ord(DoisBytesCHR[2]));

  Result := Codigo;
end;

function Encrypt(const InString:string): string;
var
  I: Byte;
  j, vTamString: integer;
begin
  if InString = '' then
  Begin
    Result := '';
    Exit;
  end;
  vTamString := Length(InString);
  if vTamString > 8 then
  Begin
    ShowMessage('Falha na Senha (>8)!');
    Raise exception.Create('');
  end;
  Result := PreencheZero(2, vTamString+8);
  for I := 1 to Length(InString) do
  begin
    if i mod 2 = 0 then //Se for Par
      Result := Result + CHAR(ord(InString[I])+vTamString+4)
    else
      Result := Result + CHAR(ord(InString[I])+vTamString);
    j := vTamString*i+40;
    if j > 254 then
      Result := Result + chr((j div vTamString) + vTamString)
    else
      Result := Result + chr(j);
  end;
  for i := 1 to (20-Length(Result)) do
  Begin
    j := vTamString*i+40;
    if j > 254 then
      Result := Result + chr((j div vTamString) + vTamString)
    else
      Result := Result + chr(j);
  end;
end;

function Decrypt(const InString:string): string;
var
  I: Byte;
  vTamString: integer;
  vVetor: string;
begin
  vTamString := StrToInt(Copy(InString,1,2))-8;
  for i := 3 to (vTamString*2)+2 do
  Begin
    if i Mod 2 <> 0 then
      vVetor := vVetor + InString[i];
  end;

  for I := 1 to vTamString do
  begin
    if i mod 2 = 0 then //Se for Par
      Result := Result + CHAR(Ord(vVetor[I])-vTamString-4)
    else
      Result := Result + CHAR(ord(vVetor[I])-vTamString);
  end;
end;

function EncryptaDadosCartao(sNome, sSenha:string): string;
var
  i, iTamanhoNome, iTamanhoSenha: integer;
  sNomeSenhaEncrypt: string;
Begin
  Result := '';
  iTamanhoNome  := Length(sNome);
  sSenha := Decrypt(sSenha);
  iTamanhoSenha := Length(sSenha);

  //sNome := UpperCase(sNome);
  if Length(sNome) <= 10 then
    sNome  := PreencheEspaco(10, sNome, sNome[4]);
  if Length(sNome) <= 10 then
    sNome  := PreencheEspaco(12,sNome,sNome[1]);
  if Length(sNome) <= 12 then
    sNome  := PreencheEspaco(14,sNome,sNome[3]);
  if Length(sNome) <= 14 then
    sNome  := PreencheEspaco(17,sNome,sNome[2]);


  //sSenha := UpperCase(sSenha);
  if Length(sSenha) <= 5 then
    sSenha := PreencheEspaco(5,sSenha,sSenha[3]);
  if Length(sSenha) <= 5 then
    sSenha := PreencheEspaco(6,sSenha,sSenha[1]);
  if Length(sSenha) <= 6 then
    sSenha := PreencheEspaco(7,sSenha,sSenha[4]);
  if Length(sSenha) <= 7 then
    sSenha := PreencheEspaco(8,sSenha,sSenha[2]);

  for i:=1 to Length(sNome) do
    if ((ORD(sNome[i]) < 47) OR (ORD(sNome[i]) > 57)) and
       ((ORD(sNome[i]) < 65) OR (ORD(sNome[i]) > 90)) then
      Raise exception.Create('Nome com caracteres impróprios para Código de Barras!');

  for i:=1 to Length(sSenha) do
    if ((ORD(sSenha[i]) < 47) OR (ORD(sSenha[i]) > 57)) and
       ((ORD(sSenha[i]) < 65) OR (ORD(sSenha[i]) > 90)) then
      Raise exception.Create('Senha com caracteres impróprios para Código de Barras!');

  //CARACTERES PARA BARRA DE CÓDIGO 65 .. 90   A   .. Z
  //CARACTERES PARA BARRA DE CÓDIGO 47 .. 57   / 0 .. 9

  sNomeSenhaEncrypt :=                     cCaractereEncrypta;
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(iTamanhoNome+65);
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(iTamanhoSenha+65);
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sSenha[6]));     // 1
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[15]));     // 2
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[12]));     // 3
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[10]));     // 4
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sSenha[4]));     // 5
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[1]));      // 6
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[5]));      // 7
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[3]));      // 8
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sSenha[2]));     // 9
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[4]));      // 10
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sSenha[5]));     // 11
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sSenha[7]));     // 12
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[9]));      // 13
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[6]));      // 14
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sSenha[8]));     // 15
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[2]));      // 16
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sSenha[1]));     // 17
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[11]));     // 18
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[8]));      // 19
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[7]));      // 20
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sSenha[3]));     // 21
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[14]));     // 22
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[13]));     // 23
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[17]));     // 24
  sNomeSenhaEncrypt := sNomeSenhaEncrypt + chr(ORD(sNome[16]));     // 25

  Result := sNomeSenhaEncrypt;
end;

function DecryptaDadosCartao(var sNome, sSenha:string): Boolean;
var
  iTamanhoNome, iTamanhoSenha: integer;
  sNomePronto, sSenhaPronto, sNomeSenhaEncrypt: string;
Begin
  Result := False;
  if (Length(sNome) <> 20) or (Length(sSenha) <> 8) then
  Begin
    ShowMessage('Nome ou senha inválida!');
    Exit;
  end;
  if sNome[1] <> cCaractereEncrypta then
  Begin
    ShowMessage('Caractere Encrypta inválido!');
    Exit;
  end;

  iTamanhoNome  := ord(sNome[2])-65;
  iTamanhoSenha := ord(sNome[3])-65;

  sNomeSenhaEncrypt := Copy(sNome,4,17)+sSenha;

  sNomePronto :=  sNomeSenhaEncrypt[6] +   // 1
                  sNomeSenhaEncrypt[16] +  // 2
                  sNomeSenhaEncrypt[8] +   // 3
                  sNomeSenhaEncrypt[10] +  // 4
                  sNomeSenhaEncrypt[7] +   // 5
                  sNomeSenhaEncrypt[14] +  // 6
                  sNomeSenhaEncrypt[20] +   // 7
                  sNomeSenhaEncrypt[19] +  // 8
                  sNomeSenhaEncrypt[13] +  // 9
                  sNomeSenhaEncrypt[4] +   // 10
                  sNomeSenhaEncrypt[18] +  // 11
                  sNomeSenhaEncrypt[3] +   // 12
                  sNomeSenhaEncrypt[23] +  // 13
                  sNomeSenhaEncrypt[22] +  // 14
                  sNomeSenhaEncrypt[2] +   // 15
                  sNomeSenhaEncrypt[25] +  // 16
                  sNomeSenhaEncrypt[24];   // 17

  sSenhaPronto := sNomeSenhaEncrypt[17] +  // 1
                  sNomeSenhaEncrypt[9] +   // 2
                  sNomeSenhaEncrypt[21] +  // 3
                  sNomeSenhaEncrypt[5] +   // 4
                  sNomeSenhaEncrypt[11] +  // 5
                  sNomeSenhaEncrypt[1] +   // 6
                  sNomeSenhaEncrypt[12] +  // 7
                  sNomeSenhaEncrypt[15];   // 8

  sNome  := Copy(sNomePronto,1,iTamanhoNome);
  sSenha := Copy(sSenhaPronto,1,iTamanhoSenha);

  Result := True;
end;

procedure LerPreferencias(Form: TForm; NomeArquivo : String);
var
  Prefs : TStringList;
  Linha, NomeComp, NomeProp, Valor : String;
  Cont, Ps : Integer;
  Componente : TComponent;
Begin
  Prefs := TStringList.Create;
  if FileExists(NomeArquivo) then
  Begin
    Prefs.LoadFromFile(NomeArquivo);
    with Prefs do
      for Cont := 0 to Count-1 do
      Begin
        Linha := Strings[Cont];
        Ps := Pos('.', Linha);
        NomeComp := Copy(Linha, 1, Ps-1);
        System.Delete(Linha, 1, Ps);
        Ps := Pos('=', Linha);
        NomeProp := Copy(Linha, 1, Ps-1);
        System.Delete(Linha, 1, Ps);
        Valor := Linha;
        Componente := Form.FindComponent(NomeComp);
        if Componente <> nil then
          SetPropValue(Componente, NomeProp, Valor);
      end;
  end;
  Prefs.Free;
end;

procedure AddPref(Form : TForm; L: TStringList; Props : array of string);
var
  Linha, NomeComp, NomeProp, Valor : String;
  Cont, Ps : Integer;
  Componente : TComponent;
Begin
  for Cont := 0 to High(Props) do
  Begin
    Linha := Props[Cont];
    Ps := Pos('.', Linha);
    NomeComp := copy(Linha, 1, Ps-1);
    NomeProp := copy(Linha, Ps+1, Length(Linha));
    Componente := Form.FindComponent(NomeComp);
    if Componente <> nil then
    Begin
      Valor := GetPropValue(Componente, NomeProp, LendoProps);
      L.Add(Linha+'='+Valor);
    end;
  end;
end;

procedure SalvarPreferencias(Form:TForm; NomeArquivo : String;
  ListaProps : array of string);
var
  Prefs : TStringList;
Begin
  Prefs := TStringList.Create;
  AddPref(Form, Prefs, ListaProps);
  try
    Prefs.SaveToFile(NomeArquivo);
  except
    ShowMessage('Não foi possível criar arquivo de Configuracao.'+#13+
      'Verifique a pasta \\Servidor\SACI ');
  end;
  Prefs.Free;
end;

function DataExtenso(DataCurta: TDateTime; sCidade:string):String;
const
  mes : array [1..12] of string = ('janeiro','fevereiro','marco','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro');
Begin
  Result := sCidade+', '+
    FormatDateTime('dd',DataCurta)+' de '+mes[StrToInt(FormatDateTime('mm',DataCurta))]+
    ' de '+FormatDateTime('yyyy',DataCurta);
end;

function RetiraMascara(Text:String; Tam:Integer = 0):String;
Var
  i:Integer;
  SemMascara, TextoFinal, Espaco : string;
begin
  if Length(Text) > 0 then
    for i := 1 to Length(Text) do
      if Text[i] in ['0','1','2','3','4','5','6','7','8','9'] then
        SemMascara := SemMascara + Text[i];

  Espaco := '';
  if TAM <> 0 then
  Begin
    if Length(SemMascara) >= TAM then
      TextoFinal := Copy(SemMascara,1,TAM)
    else
    Begin
      while Length(Espaco+SemMascara) <= Tam do
        Espaco := Espaco + ' ';
      TextoFinal := SemMascara + Espaco;
    end;
    Result := Copy(TextoFinal,1,Tam);
  end
  else
    Result := SemMascara;
end;

function CalcFaturadoSN(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''; PIncluirLJ4: Boolean=True):Double;
var
  sDataINI, sDataFIM, sLJ4: string;
  vTotal : Double;
Begin
  if VerificaDataBranco(DataINI) then
    sDataINI := ' AND P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(StrToDate(DataINI))+'" '
  else
    sDataINI := '';
  if VerificaDataBranco(DataFIM) then
    sDataFIM := ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(DataFIM)+1)+'" '
  else
    sDataFIM := '';

  sLJ4 := '';
  if PIncluirLJ4 then
    sLJ4 := ' OR P1.PDV_NOTA_FISCAL=-2 ';

  with Query do
  Begin
    //Calcular Faturado (LJ3)
    Close;
    SQL.Text := 'SELECT SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE (P1.PDV_SITUACAO=4 OR P1.PDV_SITUACAO=8) '+
      sDataINI+sDataFIM+FiltroFuncionario+
      ' AND (P1.PDV_NOTA_FISCAL=-1 '+sLJ4+')'+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    vTotal := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Faturado (Itens Trocados - Devolvidos Parciais SN)
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE*ROUND(I1.ITO_VALOR,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_TROCA I1 '+
      ' WHERE (P1.PDV_SITUACAO=4 OR P1.PDV_SITUACAO=8) '+
      sDataINI+sDataFIM+FiltroFuncionario+
      ' AND I1.ITO_SITUACAO=1 '+
      ' AND (P1.PDV_NOTA_FISCAL=-1 '+sLJ4+')'+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    vTotal := vTotal + Arredonda(FieldByName('TOTAL').asFloat);
  end;
  Result := vTotal;
end;

function CalcFaturado(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
var
  sDataINI, sDataFIM: string;
Begin
  if VerificaDataBranco(DataINI) then
    sDataINI := ' AND N1.NTF_DT_EMISSAO>="'+MesDia(StrToDate(DataINI))+'" '
  else
    sDataINI := '';
  if VerificaDataBranco(DataFIM) then
    sDataFIM := ' AND N1.NTF_DT_EMISSAO<"'+MesDia(StrToDate(DataFIM)+1)+'" '
  else
    sDataFIM := '';
  with Query do
  Begin
    //Calcular Faturado (Nota)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*(ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2))) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE ((N1.NTF_TIPO_NOTA=361) or (N1.NTF_TIPO_NOTA=368)) '+
      ' AND N1.NTF_SITUACAO=2 '+
      sDataINI+sDataFIM+FiltroFuncionario+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    Result := FieldByName('TOTAL').asFloat;
  end;
end;

function CalcDevolvidoFat(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
var
  sDataINI, sDataINIEntrada, sDataFIM, sDataFIMEntrada: string;
  vTotal : Double;
Begin
  if VerificaDataBranco(DataINI) then
  Begin
    sDataINI := ' AND N1.NTF_DT_EMISSAO>="'+MesDia(StrToDate(DataINI))+'" ';
    sDataINIEntrada := ' AND N1.NTF_DT_ENTRADA_SAIDA>="'+MesDia(StrToDate(DataINI))+'" ';
  end
  else
  Begin
    sDataINI := '';
    sDataINIEntrada := '';
  end;
  if VerificaDataBranco(DataFIM) then
  Begin
    sDataFIM := ' AND N1.NTF_DT_EMISSAO<"'+MesDia(StrToDate(DataFIM)+1)+'" ';
    sDataFIMEntrada := ' AND N1.NTF_DT_ENTRADA_SAIDA<"'+MesDia(StrToDate(DataFIM)+1)+'" ';
  end
  else
  Begin
    sDataFIM := '';
    sDataFIMEntrada := '';
  end;

  with Query do
  Begin
    //Calcular Devolvido (Nota Não Avulsa)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_TIPO_NOTA=362 '+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA<>1 '+
      sDataINI+sDataFIM+FiltroFuncionario+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vTotal := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Avulsa)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_TIPO_NOTA=362 '+
      sDataINIEntrada+sDataFIMEntrada+FiltroFuncionario+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA=1 '+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vTotal := vTotal + Arredonda(FieldByName('TOTAL').asFloat);
  end;
  Result := vTotal;
end;

function CalcFaturadoServico(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
var
  sDataINI, sDataFIM: string;
Begin
  if VerificaDataBranco(DataINI) then
    sDataINI := ' AND N1.NTF_DT_EMISSAO>="'+MesDia(StrToDate(DataINI))+'" '
  else
    sDataINI := '';
  if VerificaDataBranco(DataFIM) then
    sDataFIM := ' AND N1.NTF_DT_EMISSAO<"'+MesDia(StrToDate(DataFIM)+1)+'" '
  else
    sDataFIM := '';
  with Query do
  Begin
    //Calcular Faturado (Nota) que ficou como serviço
    //A Partir de 60% do preço encontrar os 40% (referente a serviço)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*(ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)*2/3)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE ((N1.NTF_TIPO_NOTA=361) or (N1.NTF_TIPO_NOTA=368)) '+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND I1.PRD_CODIGO>0 '+
      ' AND N1.NTF_CODIGO IN (SELECT NTF_CODIGO FROM ITEM_DE_NOTA_FISCAL I10 '+
      ' WHERE I10.PRD_CODIGO=0) '+
      sDataINI+sDataFIM+FiltroFuncionario+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    Result := FieldByName('TOTAL').asFloat;
  end;
end;

function CalcDevolvidoFatServico(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
var
  sDataINI, sDataINIEntrada, sDataFIM, sDataFIMEntrada: string;
  vTotal : Double;
Begin
  if VerificaDataBranco(DataINI) then
  Begin
    sDataINI := ' AND N1.NTF_DT_EMISSAO>="'+MesDia(StrToDate(DataINI))+'" ';
    sDataINIEntrada := ' AND N1.NTF_DT_ENTRADA_SAIDA>="'+MesDia(StrToDate(DataINI))+'" ';
  end
  else
  Begin
    sDataINI := '';
    sDataINIEntrada := '';
  end;
  if VerificaDataBranco(DataFIM) then
  Begin
    sDataFIM := ' AND N1.NTF_DT_EMISSAO<"'+MesDia(StrToDate(DataFIM)+1)+'" ';
    sDataFIMEntrada := ' AND N1.NTF_DT_ENTRADA_SAIDA<"'+MesDia(StrToDate(DataFIM)+1)+'" ';
  end
  else
  Begin
    sDataFIM := '';
    sDataFIMEntrada := '';
  end;

  with Query do
  Begin
    //Calcular Devolvido (Nota Não Avulsa)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)*2/3) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_TIPO_NOTA=362 '+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA<>1 '+
      ' AND I1.PRD_CODIGO>0 '+
      ' AND N1.NTF_CODIGO IN (SELECT NTF_CODIGO FROM ITEM_DE_NOTA_FISCAL I10 '+
      ' WHERE I10.PRD_CODIGO=0) '+
      sDataINI+sDataFIM+FiltroFuncionario+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vTotal := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Avulsa)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)*2/3) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_TIPO_NOTA=362 '+
      ' AND I1.PRD_CODIGO>0 '+
      ' AND N1.NTF_CODIGO IN (SELECT NTF_CODIGO FROM ITEM_DE_NOTA_FISCAL I10 '+
      ' WHERE I10.PRD_CODIGO=0) '+
      sDataINIEntrada+sDataFIMEntrada+FiltroFuncionario+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA=1 '+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vTotal := vTotal + Arredonda(FieldByName('TOTAL').asFloat);
  end;
  Result := vTotal;
end;

function CalcDevolvidoSN(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''; PIncluirLJ4: Boolean=True):Double;
var
  sDataINI, sDataINITroca, sDataFIM, sDataFIMTroca, sLJ4: string;
  vTotal : Double;
Begin
  if VerificaDataBranco(DataINI) then
  Begin
    sDataINI := ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(StrToDate(DataINI))+'" ';
    sDataINITroca := ' AND T1.TRO_DATA>="'+MesDia(StrToDate(DataINI))+'" ';
  end
  else
  Begin
    sDataINI := '';
    sDataINITroca := '';
  end;
  if VerificaDataBranco(DataFIM) then
  Begin
    sDataFIM := ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(StrToDate(DataFIM)+1)+'" ';
    sDataFIMTroca := ' AND T1.TRO_DATA<"'+MesDia(StrToDate(DataFIM)+1)+'" ';
  end
  else
  Begin
    sDataFIM := '';
    sDataFIMTroca := '';
  end;

    sLJ4 := '';
  if PIncluirLJ4 then
    sLJ4 := ' OR P1.PDV_NOTA_FISCAL=-2 ';

  with Query do
  Begin
    //Calcular Devolvidos Total (SN)
    Close;
    SQL.Text := 'SELECT SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_SITUACAO=8 '+
      ' AND (P1.PDV_NOTA_FISCAL=-1 '+sLJ4+') '+
      sDataINI+sDataFIM+FiltroFuncionario+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    vTotal := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Troca SN)
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE*I1.ITO_VALOR) AS TOTAL '+
      ' FROM TROCA T1, ITEM_DE_TROCA I1, PEDIDO_DE_VENDA P1 '+
      ' WHERE (P1.PDV_NOTA_FISCAL=-1 '+sLJ4+') '+
      ' AND I1.ITO_SITUACAO=1 '+
      sDataINITroca+sDataFIMTroca+FiltroFuncionario+
      ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
      ' AND T1.TRO_CODIGO=I1.TRO_CODIGO ';
    Open;
    vTotal := vTotal + FieldByName('TOTAL').asFloat;
  end;
  Result := vTotal;
end;

function CalcBonusSN(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''; PIncluirLJ4: Boolean=True):Double;
var
  sDataINI, sDataINITroca, sDataINIDevolucao, sDataFIM, sDataFIMTroca, sDataFIMDevolucao, sLJ4: string;
  vTotal : Double;
Begin
  if VerificaDataBranco(DataINI) then
  Begin
    sDataINI := ' AND P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(StrToDate(DataINI))+'" ';
    sDataINITroca := ' AND T1.TRO_DATA>="'+MesDia(StrToDate(DataINI))+'" ';
    sDataINIDevolucao := ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(StrToDate(DataINI))+'" ';
  end
  else
  Begin
    sDataINI := '';
    sDataINITroca := '';
    sDataINIDevolucao := '';
  end;
  if VerificaDataBranco(DataFIM) then
  Begin
    sDataFIM := ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(DataFIM)+1)+'" ';
    sDataFIMTroca := ' AND T1.TRO_DATA<"'+MesDia(StrToDate(DataFIM)+1)+'" ';
    sDataFIMDevolucao := ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(StrToDate(DataFIM)+1)+'" ';
  end
  else
  Begin
    sDataFIM := '';
    sDataFIMTroca := '';
    sDataFIMDevolucao := '';
  end;

  sLJ4 := '';
  if PIncluirLJ4 then
    sLJ4 := ' OR P1.PDV_NOTA_FISCAL=-2 ';

  with Query do
  Begin
    //Calcular Bônus Faturado (SN)
    Close;
    SQL.Text := 'SELECT SUM(ROUND((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(IPV_PRECO_DESC,2)*I2.IBN_BONUS_FOR/100,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1, BONUS B1, ITEM_DE_BONUS I2 '+
      ' WHERE (P1.PDV_SITUACAO=4 OR P1.PDV_SITUACAO=8) '+
      sDataINI+sDataFIM+FiltroFuncionario+
      ' AND (P1.PDV_NOTA_FISCAL=-1 '+sLJ4+') '+
      ' AND B1.BON_MES='+Copy(DataFIM,4,2)+
      ' AND B1.BON_ANO='+Copy(DataFIM,7,4)+
      ' AND I2.PRD_CODIGO=I1.PRD_CODIGO '+
      ' AND B1.BON_CODIGO=I2.BON_CODIGO '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    vTotal := Arredonda(FieldByName('TOTAL').asFloat);
  end;
  Result := vTotal;
end;

function CalcBonusFat(Query:TQuery; DataINI, DataFIM:string; FiltroFuncionario: string=''):Double;
var
  sDataINI, sDataFIM: string;
  vTotal : Double;
Begin
  if VerificaDataBranco(DataINI) then
    sDataINI := ' AND DIB_DT_CADASTRO>="'+MesDia(StrToDate(DataINI))+'" '
  else
    sDataINI := '';

  if VerificaDataBranco(DataFIM) then
    sDataFIM := ' AND DIB_DT_CADASTRO<"'+MesDia(StrToDate(DataFIM)+1)+'" '
  else
    sDataFIM := '';

  with Query do
  Begin
    //Calcular Bônus Faturado (Nota)
    Close;
    SQL.Text := 'SELECT SUM(ROUND(ROUND(DIB_QUANTIDADE_BONUS*DIB_PRECO,2)*DIB_BONUS_1/100,2)) AS TOTAL '+
      ' FROM DIREITO_DE_BONUS N1 '+
      ' WHERE DIB_SITUACAO=0 '+
      sDataINI+sDataFIM+FiltroFuncionario;
    Open;
    vTotal := Arredonda(FieldByName('TOTAL').asFloat);
  end;
  Result := vTotal;
end;

procedure CarregaSACIConf(PastaImagens, PastaSons:string; var PServidor:string);
var
  i: integer;
  ArqConf:TIniFile;
  F: TextFile;
begin
  for i:=1 to High(confItensNota) do
    confItensNota[i] := 0;
  confItensNota[empMotical] := 17;

  if FileExists(PastaImagens+'\Fundo.JPG') then
    cPapelDeParede := PastaImagens+'\Fundo.JPG'
  else
    cPapelDeParede := PastaImagens+'\Fundo.BMP';

  cSomAbertura     := PastaSons+'\Abertura.wav';
  cSomSaida        := PastaSons+'\Sair.wav';
  cSomErro         := PastaSons+'\Erro.wav';
  cSomMensagem     := PastaSons+'\Mensagem.wav';
  cSomRegistradora := PastaSons+'\Registradora.wav';
  cSomSinos        := PastaSons+'\Sinos.wav';
  cPastaSistema    := 'C:\SACI';
  cMagazine        := False;
  cLocalCPD        := -1;

  if FileExists(cArquivoConfiguracao) then
  Begin
    ArqConf := TIniFile.Create(cArquivoConfiguracao);
    try
      if ArqConf.ReadString('IMAGEM', 'PapelDeParede', '.') <> '.' then
        cPapelDeParede   := ArqConf.ReadString('IMAGEM', 'PapelDeParede', '');
      if ArqConf.ReadString('SOM', 'Abertura', '.') <> '.' then
        cSomAbertura     := ArqConf.ReadString('SOM', 'Abertura', '.');
      if ArqConf.ReadString('SOM', 'Saida', '.') <> '.' then
        cSomSaida        := ArqConf.ReadString('SOM', 'Saida', '.');
      if ArqConf.ReadString('SOM', 'Erro', '.') <> '.' then
        cSomErro         := ArqConf.ReadString('SOM', 'Erro', '.');
      if ArqConf.ReadString('SOM', 'Mensagem', '.') <> '.' then
        cSomMensagem     := ArqConf.ReadString('SOM', 'Mensagem', '.');
      if ArqConf.ReadString('SOM', 'Registradora', '.') <> '.' then
        cSomRegistradora := ArqConf.ReadString('SOM', 'Registradora', '.');
      if ArqConf.ReadString('SOM', 'Sinos', '.') <> '.' then
        cSomSinos        := ArqConf.ReadString('SOM', 'Sinos', '.');
      if ArqConf.ReadString('MAQUINA', 'PastaSistema', '.') <> '.' then
        cPastaSistema    := ArqConf.ReadString('MAQUINA', 'PastaSistema', '.');
      try
        cMagazine        := (ArqConf.ReadString('MAQUINA', 'Magazine', '0') = '1');
      except
      end;
      try
        cLocalCPD      := StrToInt(ArqConf.ReadString('MAQUINA', 'LocalCPD', '-1'));
      except
        cLocalCPD      := -1;
      end;
    finally
      ArqConf.Free;
    end;
  end
  else //Arquivo não Existe
  Begin
    If MessageDlg('ATENÇÃO!!!'+#13+
                  'Máquina Desconfigurada.'+#13+
                  'Em caso de dúvida ligar para o Suporte!!!'+#13+
                  'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

    if not Session.IsAlias('SACI') then
    Begin
      while True do
      Begin
        PServidor := UpperCase(InputBox('Dados Configuração', 'Nome do Servidor:', ''));
        if PServidor <> '' then
          Break;
      end;
    end;


    AssignFile(F, cArquivoConfiguracao);
    Rewrite(F);
    CloseFile(F);
    ArqConf := TIniFile.Create(cArquivoConfiguracao);
    try
      //SOM/IMAGEM
      ArqConf.WriteString('IMAGEM', 'PapelDeParede', '.');
      ArqConf.WriteString('SOM', 'Abertura', '.');
      ArqConf.WriteString('SOM', 'Saida', '.');
      ArqConf.WriteString('SOM', 'Erro', '.');
      ArqConf.WriteString('SOM', 'Mensagem', '.');
      ArqConf.WriteString('SOM', 'Registradora', '.');
      ArqConf.WriteString('SOM', 'Sinos', '.');
      //Configurações de Máquina
      ArqConf.WriteString('MAQUINA', 'Caixa', '0');
      ArqConf.WriteString('MAQUINA', 'CAX_CODIGO', '1');
      ArqConf.WriteString('MAQUINA', 'CC', '1');
      ArqConf.WriteString('MAQUINA', 'Daruma', '0');
      ArqConf.WriteString('MAQUINA', 'Empresa', '11');
      ArqConf.WriteString('MAQUINA', 'IdMachine', '1');
      ArqConf.WriteString('MAQUINA', 'IdPath', 'LOCAL');
      ArqConf.WriteString('MAQUINA', 'IdPrintType', '0');
      ArqConf.WriteString('MAQUINA', 'ImpCheque', '0');
      ArqConf.WriteString('MAQUINA', 'LeitoraCheque', '0');
      ArqConf.WriteString('MAQUINA', 'Mafalda', '0');
      ArqConf.WriteString('MAQUINA', 'Maquina', '1');
      ArqConf.WriteString('MAQUINA', 'MaxItensNota', '30');
      ArqConf.WriteString('MAQUINA', 'MaxLinhasImp', '65');
      ArqConf.WriteString('MAQUINA', 'Orcamento', '0');
      ArqConf.WriteString('MAQUINA', 'PastaImagens', 'C:\SACI\Imagens');
      ArqConf.WriteString('MAQUINA', 'PastaSistema', 'C:\SACI');
      ArqConf.WriteString('MAQUINA', 'PastaSons', 'C:\SACI\Sons');
      ArqConf.WriteString('MAQUINA', 'TempoOcioso', '0');
      ArqConf.WriteString('MAQUINA', 'CodigoImpFiscal', '0');
      ArqConf.WriteString('MAQUINA', 'ItemAutomatico', '0');
      ArqConf.WriteString('MAQUINA', 'Magazine', '0');
      ArqConf.WriteString('MAQUINA', 'LocalCPD', '-1');
      ArqConf.WriteString('MAQUINA', 'DiretoImpFiscal', '0');
    finally
      ArqConf.Free;
    end;
  end;
end;

function MostraGrauConvertido(DescProduto:string):string;
var
  sGrauEsf, sGrauCil: string;
  i, iTamDesc: integer;
  vGrauPronto: Boolean;
begin
  Result := DescProduto;

  if Trim(DescProduto) = '' then
    Exit;

  sGrauEsf := '';
  sGrauCil := '';
  vGrauPronto := False;
  iTamDesc := Length(DescProduto);
  for i:=iTamDesc downto 1 do
  Begin
    if DescProduto[i] in ['0','1','2','3','4','5','6','7','8','9','-','+','.',' '] then
    Begin
      if vGrauPronto then
        sGrauEsf := Trim(DescProduto[i]) + sGrauEsf
      else
        sGrauCil := Trim(DescProduto[i]) + sGrauCil;

      if DescProduto[i] in ['-','+',' '] then
        if vGrauPronto then
          Break
        else
          vGrauPronto := True;
    end
    else
      Break;
  end;

  if (sGrauEsf = '') or (sGrauCil = '') then
    Exit;

  try
    StrToFloat(VirgPonto(sGrauEsf,'.',','));
  except
    Exit;
  end;

  try
    StrToFloat(VirgPonto(sGrauCil,'.',','));
  except
    Exit;
  end;

  if StrToFloat(VirgPonto(sGrauCil,'.',',')) = 0 then
    Exit;

  sGrauEsf := format('%.2f',[   StrToFloat(VirgPonto(sGrauEsf,'.',','))+
                                StrToFloat(VirgPonto(sGrauCil,'.',','))]);
  sGrauCil := format('%.2f',[-1*StrToFloat(VirgPonto(sGrauCil,'.',','))]);

  Result := DescProduto + ' (' + VirgPonto(sGrauEsf) + ' ' + VirgPonto(sGrauCil) + ')';
end;

function SaldoAnteriorFisico(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime):Double;
var
  vES: string;
  vEstoque, vQtdAnt, vQuantidade: Double;
  vDtMovimento:TDateTime;
Begin
  vEstoque := 0;
  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 * '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
      ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND MEF_DATA<"'+MesDia(vData+1)+'" '+
      ' ORDER BY MEF_DATA DESC, MEF_CODIGO DESC ';
    Open;
    if not IsEmpty then //Pegar o último movimento do dia ou de um dia anterior
    Begin
      vQtdAnt     := FieldByName('MEF_SALDO_ANT').asFloat;
      vQuantidade := FieldByName('MEF_QUANTIDADE').asFloat;
      vES         := UpperCase(FieldByName('MEF_ES').asString);
      vDtMovimento:= FieldByName('MEF_DATA').asDateTime;

      if vES = 'E' then
        vEstoque := Arredonda(vQtdAnt+vQuantidade)
      else
        vEstoque := Arredonda(vQtdAnt-vQuantidade);

      Close;
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
        ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND I1.INV_SITUACAO=1 '+
        ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND I1.INV_DATA<='+QuotedStr(MesDiaHora(vData))+
        ' AND I1.INV_TIPO<=1 '+
        ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
        ' AND I1.INV_CODIGO=I2.INV_CODIGO '+
        ' ORDER BY I1.INV_DATA DESC ';
      Open;
      if vDtMovimento < FieldByName('INV_DATA').asDateTime then
        vEstoque := FieldByName('IIV_QUANT_INF').asFloat;
    end
    else //if vData < StrToDate('01/01/2003') then //Não tem movimento no dia ou anterior a ele
    Begin
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' ORDER BY MEF_DATA ASC, MEF_CODIGO ASC ';
      Open;
      if not IsEmpty then
        vEstoque := Arredonda(FieldByName('MEF_SALDO_ANT').asFloat)
      else //Não existe movimento Físico nenhum
      Begin
        Close;
        SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC);
        Open;
        if (not IsEmpty) then //and (Trunc(Data) <= DataINI) then
          vEstoque := Arredonda(FieldByName('IES_SFISICO').asFloat);
      end;
    end;
  end;
  Result := vEstoque;
end;

function SaldoAnteriorComercial(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime):Double;
var
  vES: string;
  vEstoque, vQtdAnt, vQuantidade: Double;
  vDtMovimento: TDateTime;
Begin
  vEstoque := 0;
  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 * '+
      ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL '+
      ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND MEC_DATA_HORA<"'+MesDiaHora(vData+1)+'" '+
      ' ORDER BY MEC_DATA_HORA DESC, MEC_CODIGO DESC ';
    Open;
    if not IsEmpty then //Pegar o último movimento do dia ou de um dia anterior
    Begin
      vQtdAnt     := FieldByName('MEC_SALDO_ANT').asFloat;
      vQuantidade := FieldByName('MEC_QUANTIDADE').asFloat;
      vES         := UpperCase(FieldByName('MEC_ES').asString);
      vDtMovimento:= FieldByName('MEC_DATA_HORA').asDateTime;

      if vES = 'E' then
        vEstoque := Arredonda(vQtdAnt+vQuantidade)
      else
        vEstoque := Arredonda(vQtdAnt-vQuantidade);

      Close;
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
        ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND I1.INV_SITUACAO=1 '+
        ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND I1.INV_DATA<='+QuotedStr(MesDiaHora(vData))+
        ' AND I1.INV_TIPO<=1 '+
        ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
        ' AND I1.INV_CODIGO=I2.INV_CODIGO '+
        ' ORDER BY I1.INV_DATA DESC ';
      Open;
      if vDtMovimento < FieldByName('INV_DATA').asDateTime then
        vEstoque := FieldByName('IIV_QUANT_INF').asFloat;
    end
    else // if vData < StrToDate('01/01/2003') then //Não tem movimento no dia ou anterior a ele
    Begin
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' ORDER BY MEC_DATA_HORA ASC, MEC_CODIGO ASC ';
      Open;
      if not IsEmpty then
        vEstoque := Arredonda(FieldByName('MEC_SALDO_ANT').asFloat)
      else //Não existe movimento nenhum
      Begin
        Close;
        SQL.Text := 'SELECT * '+
          ' FROM ITEM_DE_ESTOQUE '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC);
        Open;
        if (not IsEmpty) then //and (Trunc(Data) <= DataINI) then
          vEstoque := Arredonda(FieldByName('IES_SCOMERCIAL').asFloat);
      end;
    end;
  end;
  Result := vEstoque;
end;

function SaldoAnteriorFiscal(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime; PFiltro: string=''):Double;
var
  vES: string;
  vEstoque, vQtdAnt, vQuantidade: Double;
  vDtMovimento:TDateTime;
Begin
  vEstoque := 0;
  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 * '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISCAL '+
      ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      PFiltro+
      ' AND MES_DATA_HORA<"'+MesDia(vData+1)+'" '+
      ' ORDER BY MES_DATA_HORA DESC, MES_CODIGO DESC ';
    Open;
    if not IsEmpty then //Pegar o último movimento do dia ou de um dia anterior
    Begin
      vQtdAnt     := FieldByName('MES_SALDO_ANT').asFloat;
      vQuantidade := FieldByName('MES_QUANTIDADE').asFloat;
      vES         := UpperCase(FieldByName('MES_ES').asString);
      vDtMovimento:= FieldByName('MES_DATA_HORA').asDateTime;

      if vES = 'E' then
        vEstoque := Arredonda(vQtdAnt+vQuantidade)
      else
        vEstoque := Arredonda(vQtdAnt-vQuantidade);

      Close;
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
        ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND I1.INV_SITUACAO=1 '+
        ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND I1.INV_DATA<='+QuotedStr(MesDiaHora(vData))+
        ' AND (I1.INV_TIPO=0 OR I1.INV_TIPO=2) '+ //C,F,F1 ou F1
        ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
        ' AND I1.INV_CODIGO=I2.INV_CODIGO '+
        ' ORDER BY I1.INV_DATA DESC ';
      Open;
      if vDtMovimento < FieldByName('INV_DATA').asDateTime then
        vEstoque := FieldByName('IIV_QUANT_INF').asFloat;
    end
    else //if vData < StrToDate('01/01/2003') then //Não tem movimento no dia ou anterior a ele
    Begin
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM MOVIMENTO_DE_ESTOQUE_FISCAL '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' ORDER BY MES_DATA_HORA ASC, MES_CODIGO ASC ';
      Open;
      if not IsEmpty then
        vEstoque := Arredonda(FieldByName('MES_SALDO_ANT').asFloat)
      else //Não existe movimento nenhum
      Begin
        Close;
        SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC);
        Open;
        if (not IsEmpty) then //and (Trunc(Data) <= DataINI) then
          vEstoque := Arredonda(FieldByName('IES_SFISCAL').asFloat);
      end;
    end;
  end;
  Result := vEstoque;
end;

function SaldoAnteriorSN(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime):Double;
var
  vES: string;
  vEstoque, vQtdAnt, vQuantidade: Double;
  vDtMovimento:TDateTime;
Begin
  vEstoque := 0;
  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 * '+
      ' FROM MOVIMENTO_DE_ESTOQUE_SN   '+
      ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND MSN_DATA_HORA<"'+MesDia(vData+1)+'" '+
      ' ORDER BY MSN_DATA_HORA DESC, MSN_CODIGO DESC ';
    Open;
    if not IsEmpty then //Pegar o último movimento do dia ou de um dia anterior
    Begin
      vQtdAnt     := FieldByName('MSN_SALDO_ANT').asFloat;
      vQuantidade := FieldByName('MSN_QUANTIDADE').asFloat;
      vES         := UpperCase(FieldByName('MSN_ES').asString);
      vDtMovimento:= FieldByName('MSN_DATA_HORA').asDateTime;

      if vES = 'E' then
        vEstoque := Arredonda(vQtdAnt+vQuantidade)
      else
        vEstoque := Arredonda(vQtdAnt-vQuantidade);

      Close;
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
        ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND I1.INV_SITUACAO=1 '+
        ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND I1.INV_DATA<='+QuotedStr(MesDiaHora(vData))+
        ' AND I1.INV_TIPO=3 '+ //SN
        ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
        ' AND I1.INV_CODIGO=I2.INV_CODIGO '+
        ' ORDER BY I1.INV_DATA DESC ';
      Open;
      if vDtMovimento < FieldByName('INV_DATA').asDateTime then
        vEstoque := FieldByName('IIV_QUANT_INF').asFloat;
    end
    else //if vData < StrToDate('01/01/2003') then //Não tem movimento no dia ou anterior a ele
    Begin
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM MOVIMENTO_DE_ESTOQUE_SN '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' ORDER BY MSN_DATA_HORA ASC, MSN_CODIGO ASC ';
      Open;
      if not IsEmpty then
        vEstoque := Arredonda(FieldByName('MSN_SALDO_ANT').asFloat)
      else //Não existe movimento nenhum
      Begin
        Close;
        SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC);
        Open;
        if (not IsEmpty) then //and (Trunc(Data) <= DataINI) then
          vEstoque := Arredonda(FieldByName('IES_SSN').asFloat);
      end;
    end;
  end;
  Result := vEstoque;
end;

function SaldoAnteriorLJ4(Query:TQuery; CdCNC, CdPRD: integer; vData: TDateTime):Double;
var
  vES: string;
  vEstoque, vQtdAnt, vQuantidade: Double;
  vDtMovimento:TDateTime;
Begin
  vEstoque := 0;
  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 * '+
      ' FROM MOVIMENTO_DE_ESTOQUE_LJ4 '+
      ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND ML4_DATA_HORA<"'+MesDia(vData+1)+'" '+
      ' ORDER BY ML4_DATA_HORA DESC, ML4_CODIGO DESC ';
    Open;
    if not IsEmpty then //Pegar o último movimento do dia ou de um dia anterior
    Begin
      vQtdAnt     := FieldByName('ML4_SALDO_ANT').asFloat;
      vQuantidade := FieldByName('ML4_QUANTIDADE').asFloat;
      vES         := UpperCase(FieldByName('ML4_ES').asString);
      vDtMovimento:= FieldByName('ML4_DATA_HORA').asDateTime;

      if vES = 'E' then
        vEstoque := Arredonda(vQtdAnt+vQuantidade)
      else
        vEstoque := Arredonda(vQtdAnt-vQuantidade);

      Close;
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
        ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND I1.INV_SITUACAO=1 '+
        ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND I1.INV_DATA<='+QuotedStr(MesDiaHora(vData))+
        ' AND I1.INV_TIPO=4 '+ //LJ4
        ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
        ' AND I1.INV_CODIGO=I2.INV_CODIGO '+
        ' ORDER BY I1.INV_DATA DESC ';
      Open;
      if vDtMovimento < FieldByName('INV_DATA').asDateTime then
        vEstoque := FieldByName('IIV_QUANT_INF').asFloat;
    end
    else if vData < StrToDate('01/01/2003') then //Não tem movimento no dia ou anterior a ele
    Begin
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM MOVIMENTO_DE_ESTOQUE_LJ4 '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' ORDER BY ML4_DATA_HORA ASC, ML4_CODIGO ASC ';
      Open;
      if not IsEmpty then
        vEstoque := Arredonda(FieldByName('ML4_SALDO_ANT').asFloat)
      else //Não existe movimento nenhum
      Begin
        Close;
        SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC);
        Open;
        if (not IsEmpty) then //and (Trunc(Data) <= DataINI) then
          vEstoque := Arredonda(FieldByName('IES_SL4').asFloat);
      end;
    end;
  end;
  Result := vEstoque;
end;

function CriaAlias(sAlias,sDataBase,sServidor,sUsuario,sDriveType: string):Boolean;
var
  vParametros: TStringList;
  sPastaEXE, sPastaWindows, sDLLConexao: string;
begin
  Result := False;

  sPastaWindows := 'C:\WINDOWS\SYSTEM32';
  sDLLConexao   := 'NTWDBLIB.DLL';
  sPastaEXE     := ExtractFilePath(ParamStr(0));

  {Cria um Alias do BDE em tempo de execução}
  if DirectoryExists(sPastaWindows) then
  Begin
    if not FileExists(sPastaWindows+'\'+sDLLConexao) then
    Begin
      if FileExists(sPastaEXE+sDLLConexao) then
      Begin
        if not CopyFile(PChar(sPastaEXE+sDLLConexao), PChar(sPastaWindows+'\'+sDLLConexao),False) then
        Begin
          ShowMessage('Não foi possível copiar o arquivo '+sPastaEXE+sDLLConexao+' !');
          Raise exception.Create('');
        end;
      end
      else
      Begin
        ShowMessage('Arquivo '+sPastaWindows+'\'+sDLLConexao+' não encontrado!');
        Raise exception.Create('');
      end;
    end;
  end;

  vParametros :=  TStringList.Create;
  try
    vParametros.Add('DATABASE NAME='+UpperCase(sDataBase));
    vParametros.Add('SERVER NAME='+UpperCase(sServidor));
    vParametros.Add('USER NAME='+UpperCase(sUsuario));
    try
      Session.AddAlias(sAlias, sDriveType, vParametros);
      Session.SaveConfigFile;
      Result := True;
    except
    end;
  finally
    vParametros.Free;
  end;
end;

function Getcomputer : string;
var
  registro : tregistry;
  Nome:string;
begin
  registro:=tregistry.create;
  registro.RootKey:=HKEY_LOCAL_MACHINE;
  registro.openkey('System\CurrentControlSet\Services\VXD\VNETSUP',false);
  Nome := registro.readstring('ComputerName');
  if Trim(Nome) = '' then
  Begin
    registro.openkey('System\ControlSet001\Control\ComputerName\ActiveComputerName',false);
    Nome := registro.readstring('ComputerName');
  end;
  Result := Nome;
  Registro.Free;
end;

function RegistrarBDE(PastaBDE:string='C:\BDE'):Boolean;
var
  Registro : tregistry;
begin
  Result := False;
  Registro:=tregistry.create;
  try
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    Registro.CreateKey('SOFTWARE\Borland\Database Engine');
    Registro.OpenKey('SOFTWARE\Borland\Database Engine', False);
    Registro.WriteString('DLLPATH', PastaBDE+'\');
    Registro.WriteString('CONFIGFILE1', PastaBDE+'\IDAPI32.CFG');
    Registro.OpenKey('\', False);
    Registro.CreateKey('SOFTWARE\Borland\BLW32');
    Registro.OpenKey('SOFTWARE\Borland\BLW32', False);
    Registro.WriteString('BLAPIPATH', PastaBDE+'\');
    Registro.WriteString('LOCALE_LIB1', PastaBDE+'\USA.BLL');
    Registro.WriteString('LOCALE_LIB2', PastaBDE+'\EUROPE.BLL');
  except
    Result := False;
  end;
  Registro.Free;
end;

function CopiarArquivos(PastaOrigem, NomeArquivo, PastaDestino: string; Substituir:Boolean=True): Boolean;
var
  sr: TSearchRec;
  i: integer;
  ListaArquivos: TStringList;
begin
  Result := False;
  ListaArquivos := TStringList.Create;
  try
    if FindFirst(PastaOrigem+'\'+NomeArquivo, 0, sr) = 0 then
    begin
      repeat
        ListaArquivos.Add(sr.Name);
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
    if ListaArquivos.Count > 0 then
    Begin
      for i:=0 to ListaArquivos.Count-1 do
      Begin
        if not CopyFile(PChar(PastaOrigem+'\'+ListaArquivos[i]), PChar(PastaDestino+'\'+ListaArquivos[i]),False) then
        Begin
          ShowMessage('Não foi possível copiar o arquivo: '+#13+#13+
                      'Origem : '+PastaOrigem+'\'+ListaArquivos[i]+#13+#13+
                      'Destino: '+PastaDestino);
          Exit;
        end;
      end;
      Result := True;
    end
    else
      ShowMessage('Arquivo(s) não encontrado(s) <<'+PastaOrigem+'\'+NomeArquivo+'>> !');
  finally
    ListaArquivos.Free;
  end;
end;

procedure CriarAtalho(NomeArquivo, Parameters, InitialDir, NomeAtalho :String; DiretorioAtalho:string='Desktop');
var
  MyObject : IUnknown;
  MySLink : IShellLink;
  MyPFile : IPersistFile;
  Directory : String;
  WFileName : WideString;
  MyReg : TRegIniFile;
begin
  MyObject := CreateComObject(CLSID_ShellLink);
  MySLink := MyObject as IShellLink;
  MyPFile := MyObject as IPersistFile;
  with MySLink do
  begin
    SetArguments(PChar(Parameters));
    SetPath(PChar(NomeArquivo));
    SetWorkingDirectory(PChar(InitialDir));
  end;
  if UpperCase(DiretorioAtalho) = 'DESKTOP' then
  Begin
    MyReg := TRegIniFile.Create('Software\MicroSoft\Windows\CurrentVersion\Explorer');
    try
      Directory := MyReg.ReadString ('Shell Folders','Desktop','');
      WFileName := Directory + '\' + NomeAtalho + '.lnk';
    finally
      MyReg.Free;
    end;
  end
  else
  Begin
    if DirectoryExists(DiretorioAtalho) then
      WFileName := DiretorioAtalho + '\' + NomeAtalho + '.lnk'
    else
    Begin
      ShowMessage('Diretório '+DiretorioAtalho+' não existe!');
      Exit;
    end;
  end;
  MyPFile.Save(PWChar(WFileName), False);
end;

function GetIP:string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name:string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PChar(Name), 255);
  SetLength(Name, StrLen(PChar(Name)));
  HostEnt := gethostbyname(PChar(Name));
  with HostEnt^ do
  begin
    Result := Format('%d.%d.%d.%d',
    [Byte(h_addr^[0]),Byte(h_addr^[1]),
    Byte(h_addr^[2]),Byte(h_addr^[3])]);
  end;
  WSACleanup;
end;

procedure ExecutaRegistroDeletado(Query:TQuery;iCodTabela, CdCNC, CdCod:integer);
begin
  Case iCodTabela of
    1130: Begin //AGENCIA
            ExecutaSQL(Query, 'DELETE FROM AGENCIA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AGE_CODIGO='+IntToStr(CdCod));
          end;
    1140: Begin //AGENTE_FINANCEIRO
            ExecutaSQL(Query, 'DELETE FROM AGENTE_FINANCEIRO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AGF_CODIGO='+IntToStr(CdCod));
          end;
    1150: Begin //AVALISTA
            ExecutaSQL(Query, 'DELETE FROM AVALISTA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AVL_CODIGO='+IntToStr(CdCod));
          end;
    1170: Begin //BANCO
            ExecutaSQL(Query, 'DELETE FROM BANCO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND BNC_CODIGO='+IntToStr(CdCod));
          end;
    1180: Begin //BANCO_BOLETO
          end;
    1190: Begin //BONUS
          end;
    1200: Begin //CAIXA
            ExecutaSQL(Query, 'DELETE FROM CAIXA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND CAX_CODIGO='+IntToStr(CdCod));
          end;
    1210: Begin //CATEGORIA_DE_PRODUTO
          end;
    1220: Begin //CENTRO_DE_CUSTO
            ExecutaSQL(Query, 'DELETE FROM CENTRO_DE_CUSTO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCod));
          end;
    1230: Begin //CHEQUE
            ExecutaSQL(Query, 'DELETE FROM CHEQUE '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND CHQ_CODIGO='+IntToStr(CdCod));
          end;
    1240: Begin //CLASSIFICACAO_FISCAL
          end;
    1250: Begin //CLIENTE
            ExecutaSQL(Query, 'DELETE FROM CLIENTE '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND CLI_CODIGO='+IntToStr(CdCod));
          end;
    1260: Begin //CLIENTE_AFIM
          end;
    1270: Begin //COBRANCA_POR_COBRADOR
          end;
    1280: Begin //CODIGO_DE_BARRAS
          end;
    1300: Begin //CONTA_BANCARIA
          end;
    1310: Begin //CONTA_CORRENTE_DO_CC
          end;
    1320: Begin //CONTA_DE_CAIXA
            ExecutaSQL(Query, 'DELETE FROM CONTA_DE_CAIXA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND CCX_CODIGO='+IntToStr(CdCod));
          end;
    1290: Begin //CONTATO
          end;
    1330: Begin //CONTROLE_DE_VITRINE
          end;
    4250: Begin //CONTROLE_ENVIO_CPD
            ExecutaSQL(Query, 'DELETE FROM CONTROLE_ENVIO_CPD '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND CEC_CODIGO='+IntToStr(CdCod));
          end;
    4260: Begin //CONTROLE_ENVIO_FILIAL
            ExecutaSQL(Query, 'DELETE FROM CONTROLE_ENVIO_FILIAL '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND CEF_CODIGO='+IntToStr(CdCod));
          end;
    4270: Begin //CONTROLE_RECEBIMENTO_CPD
            ExecutaSQL(Query, 'DELETE FROM CONTROLE_RECEBIMENTO_CPD '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND CRC_CODIGO='+IntToStr(CdCod));
          end;
    4280: Begin //CONTROLE_RECEBIMENTO_FILIAL
            ExecutaSQL(Query, 'DELETE FROM CONTROLE_RECEBIMENTO_FILIAL '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND CRF_CODIGO='+IntToStr(CdCod));
          end;
    1340: Begin //COTA

          end;
    1350: Begin //CUSTO
            ExecutaSQL(Query, 'DELETE FROM CUSTO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND CUS_CODIGO='+IntToStr(CdCod));
          end;
    1360: Begin //DESCONTO
          end;
    1370: Begin //DETALHE_DE_PEDIDO_DE_VENDA
          end;
    1380: Begin //DIREITO_DE_BONUS
          end;
    1390: Begin //EMBARQUE
            ExecutaSQL(Query, 'DELETE FROM EMBARQUE '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND EMB_CODIGO='+IntToStr(CdCod));
          end;
    1400: Begin //EMPRESTIMO
          end;
    1410: Begin //ENVIA_DADOS_EMBARQUE
          end;
    1420: Begin //ENVIA_DADOS_NOTA
          end;
    1430: Begin //EQUIPE_GERENCIA
          end;
    1440: Begin //FACTORING
          end;
    1450: Begin //FATOR_DE_FINANCEIRA
          end;
    1460: Begin //FORMA_DE_PAGAMENTO
            ExecutaSQL(Query, 'DELETE FROM FORMA_DE_PAGAMENTO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND FPG_CODIGO='+IntToStr(CdCod));
          end;
    1470: Begin //FORNECEDOR
            ExecutaSQL(Query, 'DELETE FROM FORNECEDOR '+
              ' WHERE FOR_CODIGO='+IntToStr(CdCod));
          end;
    1480: Begin //FUNCIONARIO
            ExecutaSQL(Query, 'DELETE FROM FUNCIONARIO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND FUN_CODIGO='+IntToStr(CdCod));
          end;
    1490: Begin //GRAU
          end;
    1500: Begin //GRUPO
            ExecutaSQL(Query, 'DELETE FROM GRUPO '+
              ' WHERE GRP_CODIGO='+IntToStr(CdCod));
          end;
    1510: Begin //INFORMACOES_DE_CREDITO
          end;
    1520: Begin //INSUMO
          end;
    1530: Begin //INVENTARIO
            ExecutaSQL(Query, 'DELETE FROM INVENTARIO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND INV_CODIGO='+IntToStr(CdCod));
          end;
    1540: Begin //ITEM_DE_BONUS
          end;
    1550: Begin //ITEM_DE_COTA
          end;
    1560: Begin //ITEM_DE_EMBARQUE
          end;
    4350: Begin //ITEM_DE_ESTOQUE
            ExecutaSQL(Query, 'DELETE FROM ITEM_DE_ESTOQUE '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND IES_CODIGO='+IntToStr(CdCod));
          end;
    1570: Begin //ITEM_DE_INVENTARIO
            ExecutaSQL(Query, 'DELETE FROM ITEM_DE_INVENTARIO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND IIV_CODIGO='+IntToStr(CdCod));
          end;
    1580: Begin //ITEM_DE_LISTA_DE_PRESENTE
          end;
    1590: Begin //ITEM_DE_MANUFATURADO
          end;
    1600: Begin //ITEM_DE_MAPA_DE_COTACAO
          end;
    1610: Begin //ITEM_DE_NOTA_FISCAL
            ExecutaSQL(Query, 'DELETE FROM ITEM_DE_NOTA_FISCAL '+
              ' WHERE CNC_ORIGEM='+IntToStr(CdCNC)+
              ' AND INF_CODIGO='+IntToStr(CdCod));
          end;
    1620: Begin //ITEM_DE_PACOTE_DE_VENDA
          end;
    1630: Begin //ITEM_DE_PEDIDO_DE_COMPRA
            ExecutaSQL(Query, 'DELETE FROM ITEM_DE_PEDIDO_DE_COMPRA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND IPC_CODIGO='+IntToStr(CdCod));
          end;
    1640: Begin //ITEM_DE_PEDIDO_DE_VENDA
            ExecutaSQL(Query, 'DELETE FROM ITEM_DE_PEDIDO_DE_VENDA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND IPV_CODIGO='+IntToStr(CdCod));
          end;
    1650: Begin //ITEM_DE_PRE_RECEBIMENTO
          end;
    1660: Begin //ITEM_DE_RECEBIMENTO
            ExecutaSQL(Query, 'DELETE FROM ITEM_DE_RECEBIMENTO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND IRC_CODIGO='+IntToStr(CdCod));
          end;
    1670: Begin //ITEM_DE_TABELA_DE_PRECO
          end;
    1680: Begin //ITEM_DE_TABELA_DE_PRECO_SUBGRUPO
          end;
    1690: Begin //ITEM_DE_TRANSFERENCIA
          end;
    1700: Begin //ITEM_DE_TROCA
          end;
    1710: Begin //LISTA_DE_PRESENTE
          end;
    4310: Begin //LOG
            ExecutaSQL(Query, 'DELETE FROM LOG '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND LOG_CODIGO='+IntToStr(CdCod));
          end;
    1720: Begin //MANUFATURADO
          end;
    1730: Begin //MAPA_DE_COTACAO
          end;
    1740: Begin //MAPA_DE_FATURAMENTO
          end;
    1750: Begin //MENSAGEM
            ExecutaSQL(Query, 'DELETE FROM MENSAGEM '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND MSG_CODIGO='+IntToStr(CdCod));
          end;
    1760: Begin //MENSAGEM_CPD
          end;
    1770: Begin //MODULO
            ExecutaSQL(Query, 'DELETE FROM MODULO '+
              ' WHERE MDL_CODIGO='+IntToStr(CdCod));
          end;
    4330: Begin //MOVIMENTO_DE_CAIXA
            ExecutaSQL(Query, 'DELETE FROM MOVIMENTO_DE_CAIXA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND MVC_CODIGO='+IntToStr(CdCod));
          end;
    4360: Begin //MOVIMENTO_DE_ESOTQUE_COMERCIAL
            ExecutaSQL(Query, 'DELETE FROM MOVIMENTO_DE_ESOTQUE_COMERCIAL '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND MEC_CODIGO='+IntToStr(CdCod));
          end;
    4380: Begin //MOVIMENTO_DE_ESOTQUE_FISCAL
            ExecutaSQL(Query, 'DELETE FROM MOVIMENTO_DE_ESOTQUE_FISCAL '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND MES_CODIGO='+IntToStr(CdCod));
          end;
    4370: Begin //MOVIMENTO_DE_ESOTQUE_FISICO
            ExecutaSQL(Query, 'DELETE FROM MOVIMENTO_DE_ESOTQUE_FISICO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND MEF_CODIGO='+IntToStr(CdCod));
          end;
    4390: Begin //MOVIMENTO_DE_ESOTQUE_SN
            ExecutaSQL(Query, 'DELETE FROM MOVIMENTO_DE_ESOTQUE_SN '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND MSN_CODIGO='+IntToStr(CdCod));
          end;
    1780: Begin //NOTA_FISCAL
            ExecutaSQL(Query, 'DELETE FROM NOTA_FISCAL '+
              ' WHERE CNC_ORIGEM='+IntToStr(CdCNC)+
              ' AND NTF_CODIGO='+IntToStr(CdCod));
          end;
    1800: Begin //OPERACAO_FISCAL
            ExecutaSQL(Query, 'DELETE FROM OPERACAO_FISCAL '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND OPF_CODIGO='+IntToStr(CdCod));
          end;
    1790: Begin //OPERACAO_DO_SISTEMA
            ExecutaSQL(Query, 'DELETE FROM OPERACAO_DO_SISTEMA '+
              ' WHERE OPS_CODIGO='+IntToStr(CdCod));
          end;
    1810: Begin //ORIGEM_FISCAL
          end;
    1820: Begin //PACOTE_DE_CREDITO
          end;
    1830: Begin //PACOTE_DE_VENDA
          end;
    1840: Begin //PARAMETRO
            ExecutaSQL(Query, 'DELETE FROM PARAMETRO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PAR_CODIGO='+IntToStr(CdCod));
          end;
    1850: Begin //PEDIDO_DE_COMPRA
            ExecutaSQL(Query, 'DELETE FROM PEDIDO_DE_COMPRA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PCP_CODIGO='+IntToStr(CdCod));
          end;
    1860: Begin //PEDIDO_DE_VENDA
            ExecutaSQL(Query, 'DELETE FROM PEDIDO_DE_VENDA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdCod));
          end;
    1870: Begin //PERMISSAO
            ExecutaSQL(Query, 'DELETE FROM PERMISSAO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PRM_CODIGO='+IntToStr(CdCod));
          end;
    1880: Begin //PRE_RECEBIMENTO
          end;
    1890: Begin //PRODUTO
            ExecutaSQL(Query, 'DELETE FROM PRODUTO '+
              ' WHERE PRD_CODIGO='+IntToStr(CdCod));
          end;
    1900: Begin //PRODUTO_SITE
          end;
    1910: Begin //QUANTIDADE_NORMAL_VENDA
          end;
    1920: Begin //RECEBIMENTO
            ExecutaSQL(Query, 'DELETE FROM RECEBIMENTO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND REC_CODIGO='+IntToStr(CdCod));
          end;
    1930: Begin //REGISTRO_DE_PROCURA
          end;
    4290: Begin //REGISTRO_DELETADO
            ExecutaSQL(Query, 'DELETE FROM REGISTRO_DELETADO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND RDL_CODIGO='+IntToStr(CdCod));
          end;
    1940: Begin //RESERVA_EXTERNA
          end;
    1950: Begin //SOLICITACAO_DE_PECAS_DE_REP
          end;
    1960: Begin //SUBGRUPO
          end;
    1970: Begin //SUBMODULO
            ExecutaSQL(Query, 'DELETE FROM SUBMODULO '+
              ' WHERE SML_CODIGO='+IntToStr(CdCod));
          end;
    1980: Begin //TABELA_DE_PRECO
          end;
    1990: Begin //TABELA_DE_PRECO_SUBGRUPO
          end;
    2000: Begin //TAREFA
          end;
    2010: Begin //TIPO_DE_PARAMETRO
            ExecutaSQL(Query, 'DELETE FROM TIPO_DE_PARAMETRO '+
              ' WHERE TPR_CODIGO='+IntToStr(CdCod));
          end;
    2020: Begin //TITULO_A_PAGAR
            ExecutaSQL(Query, 'DELETE FROM TITULO_A_PAGAR '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND TPG_CODIGO='+IntToStr(CdCod));
          end;
    2030: Begin //TITULO_A_RECEBER
            ExecutaSQL(Query, 'DELETE FROM TITULO_A_RECEBER '+
              ' WHERE CNC_ORIGEM='+IntToStr(CdCNC)+
              ' AND TRC_CODIGO='+IntToStr(CdCod));
          end;
    2040: Begin //TRANSFERENCIA
            ExecutaSQL(Query, 'DELETE FROM TRANSFERENCIA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND TRF_CODIGO='+IntToStr(CdCod));
          end;
    2050: Begin //TRANSFERENCIA_DE_DADOS
          end;
    2060: Begin //TRANSPORTADORA
            ExecutaSQL(Query, 'DELETE FROM TRANSPORTADORA '+
              ' WHERE TPR_CODIGO='+IntToStr(CdCod));
          end;
    2070: Begin //TROCA
            ExecutaSQL(Query, 'DELETE FROM TROCA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND TRO_CODIGO='+IntToStr(CdCod));
          end;
    2080: Begin //UF_ICMS
          end;
    2090: Begin //USUARIO
            ExecutaSQL(Query, 'DELETE FROM USUARIO '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND USU_CODIGO='+IntToStr(CdCod));
          end;
    4300: Begin //USUARIO_SENHA
            ExecutaSQL(Query, 'DELETE FROM USUARIO_SENHA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND USU_CODIGO='+IntToStr(CdCod));
          end;
    else
    Begin
      ShowMessage('Tabela não identificada.');
    end;
  end;
end;

function ExecutarEXEAguardando(const PNomeArquivo, PParametros: string;
  const TipoJanela: Word=SW_HIDE): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido aos espaços contidos em nomes longos }
  CmdLine := '"' + PNomeArquivo + '"' + PParametros;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := TipoJanela;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
  CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
  PChar(ExtractFilePath(PNomeArquivo)), SUInfo, ProcInfo);
  { Aguarda até ser finalizado }
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, 5*60000); //5 Minuto
    { Libera os Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function RetiraAspas(PTexto:String):String;
var
  sTexto: string;
  i: integer;
Begin
  if Trim(PTexto) = '' then
  Begin
    Result := PTexto;
    Exit;
  end;
  For i := 1 to Length(PTexto) do
  Begin
    if (PTexto[i] = '"')     or
       (PTexto[i] = '`')     or
       (Ord(PTexto[i]) = 39) or   //  '
       (Ord(PTexto[i]) = 13) or   // ENTER
       (Ord(PTexto[i]) = 10) then //Proxima linha
      sTexto := sTexto + ' '
    else
      sTexto := sTexto + PTexto[i];
  end;
  Result := sTexto;
end;

function CalculaRepeticoes(PPeriodicidade: integer; PDtInicial, PDtFinal:TDateTime; PIgnoraSabado:Boolean=False):integer;
var
  iVezes: integer;
  vDtAux: TDateTime;
Begin
  Result := 0;
  if Trunc(PDtFinal) < Trunc(PDtInicial) then
    Exit;

  if PPeriodicidade = 0 then //Uma Vez
    iVezes := 1
  else
  Begin
    iVezes := 0;
    vDtAux := Trunc(PDtInicial);
    while vDtAux <= Trunc(PDtFinal) do
    Begin
      if (DayOfTheWeek(vDtAux) <> 7) and //Não é Domingo
         ((not PIgnoraSabado) or
          (DayOfTheWeek(vDtAux) <> 6)) then //Não é sábado
        inc(iVezes);

      if PPeriodicidade = 1 then      //Uma Vez/Semana
        vDtAux := IncWeek(vDtAux, 1)
      else if PPeriodicidade = 2 then //Uma Vez/Mês
        vDtAux := IncMonth(vDtAux, 1)
      else if PPeriodicidade = 3 then //Uma Vez/Ano
        vDtAux := IncYear(vDtAux, 1)
      else if PPeriodicidade = 4 then //Diariamente
        vDtAux := vDtAux + 1;
    end;
  end;
  Result := iVezes;
end;

function ProximaRepeticao(PPeriodicidade: integer; PDtAtual:TDateTime; PIgnoraSabado:Boolean=False):TDateTime;
var
  vDtAux: TDateTime;
Begin
  vDtAux := Trunc(PDtAtual);
  Result := vDtAux;

  if (PPeriodicidade = 1) and //Uma Vez/Semana
     ((DayOfTheWeek(vDtAux) = 7) or //Domingo
      (PIgnoraSabado and
       (DayOfTheWeek(vDtAux) = 6))) then //Não é sábado
    Exit;

  if PPeriodicidade = 0 then //Uma Vez
    Exit
  else if PPeriodicidade = 1 then //Uma Vez/Semana
    vDtAux := IncWeek(vDtAux, 1)
  else if PPeriodicidade = 2 then //Uma Vez/Mês
    vDtAux := IncMonth(vDtAux, 1)
  else if PPeriodicidade = 3 then //Uma Vez/Ano
    vDtAux := IncYear(vDtAux, 1)
  else if PPeriodicidade = 4 then //Diariamente
    vDtAux := vDtAux + 1;

  if (DayOfTheWeek(vDtAux) = 7) or //Domingo
     (PIgnoraSabado and
      (DayOfTheWeek(vDtAux) = 6)) then //Não é sábado
    vDtAux := ProximaRepeticao(PPeriodicidade, Trunc(vDtAux), PIgnoraSabado);

  Result := vDtAux;
end;

Function AcertarRelogio(vDataHora:TDateTime):Boolean;
var
  tSetDati: TDateTime;
  vDatiBias: Variant;
  tTZI: TTimeZoneInformation;
  tST: TSystemTime;
Begin
  Result := False;
  if vDataHora < StrToDate('26/10/2004') then
    Raise exception.Create('DataHora inválida!');
  GetTimeZoneInformation(tTZI);
  vDatiBias := tTZI.Bias / 1440;
  tSetDati := vDataHora + vDatiBias;
  with tST do
  begin
    wYear := StrToInt(FormatDateTime('yyyy', tSetDati));
    wMonth := StrToInt(FormatDateTime('mm', tSetDati));
    wDay := StrToInt(FormatDateTime('dd', tSetDati));
    wHour := StrToInt(FormatDateTime('hh', tSetDati));
    wMinute := StrToInt(FormatDateTime('nn', tSetDati));
    wSecond := StrToInt(FormatDateTime('ss', tSetDati));
    wMilliseconds := 0;
  end;
  if Windows.SetSystemTime(tST) then
    Result := True;
end;

Function HoraInternet:TDateTime;
var
  TcpClient1: TTcpClient;

  Dado : array [0..8] of byte;
  I : Cardinal;
  j : Integer;
  Tempo : TDateTime;
Begin
  Result := 0;

  TcpClient1 := TTcpClient.Create(nil);
  TcpClient1.BlockMode := bmBlocking;
  TcpClient1.RemoteHost := '200.20.186.75';
  TcpClient1.RemotePort := '37';
  try
    j := 0;
    if TcpClient1.Connect then
    begin
      Tempo := Now + EncodeTime(0,0,0,500);
      while j < 4 do
      begin
        j := j + TcpClient1.ReceiveBuf(Dado[j],4);
        if Abs(Tempo-Now) > StrToTime('01:00:00') then
        begin
          ShowMessage('Data-hora da Internet muito diferente da data-hora do micro!');
          exit;
        end;
      end;
      I := Dado[0] * 256*256*256;
      I := I + Dado[1] * 256*256;
      I := I + Dado[2] * 256;
      I := I + Dado[3];
      Tempo := (I / (60*60*24)) - EncodeTime(3,0,0,0) + 2;
      if Tempo < StrToDate('20/10/2004') then
        Raise exception.Create('Falha ao acertar relógio!');

      Result := Tempo;
    end
    else
    begin
      ShowMessage('Servidor não encontrado.');
      exit;
    end;
  finally
    TcpClient1.Disconnect;
  end;
end;

function ArquivoFTPExiste(AFTPClient: TIdFTP;
  const ADirectory, AFile : string): Boolean;
var
  AOldDir : string;
  FolderList :  TStringList;
begin
  Result := False;
  try
    if not AFTPClient.Connected then //Pas connecté ?
      AFTPClient.Connect(); //On connecte
  except
     Exit; //Impossible de connecter !
  end;

  FolderList := TStringList.Create;
  try
    AOldDir := AFTPClient.RetrieveCurrentDir;
    try
      if (ADirectory <> '') then
        AFTPClient.ChangeDir(ADirectory);
      try
        AFTPClient.List(FolderList,'',False);
      finally
        Result := FolderList.IndexOf(AFile) > 0;
      end;
    except
    end;
  finally
    AFTPClient.ChangeDir(AOldDir); //reviens à l'ancien dossier
    FolderList.Free; //Libère la StringList
  end;
end;

function MontarCampoVerificador(Query: TQuery; CdCNCOrigem, CdCNC, CdPEN: integer): String;
var
  sCampo, sDataAgora, sDataRef, sCdPEN, sTipo, sCdFUN, sCdUSU, sBCC1, sBCC2, sBCC3, sCdPDV,
    sCdPRD1, sPreco1, sCdPRD2, sPreco2, sCdPRD3, sPreco3, sCdTRC, sValorTRC,
    sCredExt, sSit: string;
  iBCC: byte;
  i: integer;
begin
{
FFFFF DataAgora DD->F  MM->F  YYYY->F  HH->F  NN->F
FFFFF CodigoPEN
FFF   Referencia DD->F  MM->F  YYYY->F
0     Tipo Pendência ORD + 70
FF    Funcionario
FF    Usuário
F     BCC da descricao
0     Credito/Extorno  65 + ORD * 4
FFFFF CodigoPDV
FFFFF CodigoPRD1
FFFF  PrecoPRD1
FFFFF CodigoPRD2
FFFF  PrecoPRD2
FFFFF CodigoPRD3
FFFF  PrecoPRD3
FFFFF CodigoTRC
FFFF  ValorTRC
0     Situacao  65 + ORD * 5
F     BCC da Observação
F     BCC DO CAMPO
}
  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM PENDENCIA '+
      ' WHERE CNC_ORIGEM='+IntToStr(CdCNCOrigem)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PEN_CODIGO='+IntToStr(CdPEN);
    Open;

    sleep(200);
    sDataAgora := IntToHex(StrToInt(FormatDateTime('DD',Now)),1)+
                  IntToHex(StrToInt(FormatDateTime('MM',Now)),1)+
                  IntToHex(StrToInt(FormatDateTime('YYYY',Now)),1)+
                  IntToHex(StrToInt(FormatDateTime('HH',Now)),1)+
                  IntToHex(StrToInt(FormatDateTime('NN',Now)),1);
    sCdPEN     := IntToHex(FieldByName('PEN_CODIGO').asInteger,5);
    sDataRef   := IntToHex(StrToInt(FormatDateTime('DD',FieldByName('PEN_DT_REFERENCIA').asDateTime)),1)+
                  IntToHex(StrToInt(FormatDateTime('MM',FieldByName('PEN_DT_REFERENCIA').asDateTime)),1)+
                  IntToHex(StrToInt(FormatDateTime('YYYY',FieldByName('PEN_DT_REFERENCIA').asDateTime)),1);
    sTipo      := chr(FieldByName('PEN_TIPO').asInteger+70);
    sCdFUN     := IntToHex(FieldByName('FUN_CODIGO').asInteger,2);
    sCdUSU     := IntToHex(FieldByName('USU_CODIGO').asInteger,2);

    iBCC := 0;
    for i := 1 to Length(FieldByName('PEN_DESCRICAO').asString) do
      iBCC := iBCC XOR ord(FieldByName('PEN_DESCRICAO').asString[i]);

    sBCC1      := IntToHex(iBCC, 1);
    sCredExt   := chr(65 + FieldByName('PEN_CREDITO_EXTORNO').asInteger*4);
    sCdPDV     := IntToHex(FieldByName('PDV_CODIGO').asInteger, 5);
    sCdPRD1    := IntToHex(FieldByName('PRD_CODIGO_1').asInteger, 5);
    sPreco1    := IntToHex(Trunc(FieldByName('PEN_PRECO_PRD1').asFloat*100), 4);
    sCdPRD2    := IntToHex(FieldByName('PRD_CODIGO_2').asInteger, 5);
    sPreco2    := IntToHex(Trunc(FieldByName('PEN_PRECO_PRD2').asFloat*100), 4);
    sCdPRD3    := IntToHex(FieldByName('PRD_CODIGO_3').asInteger, 5);
    sPreco3    := IntToHex(Trunc(FieldByName('PEN_PRECO_PRD3').asFloat*100), 4);
    sCdTRC     := IntToHex(FieldByName('TRC_CODIGO').asInteger, 5);
    sValorTRC  := IntToHex(Trunc(FieldByName('PEN_VALOR_TRC').asFloat*100), 4);
    sSit       := chr(65 + FieldByName('PEN_SITUACAO').asInteger*5);

    iBCC := 0;
    for i := 1 to Length(FieldByName('PEN_OBSERVACAO').asString) do
      iBCC := iBCC XOR ord(FieldByName('PEN_OBSERVACAO').asString[i]);

    sBCC2      := IntToHex(iBCC, 1);
  end;

  sCampo := IntToHex(Round(255),1)+
            Copy(sDataAgora, 1, 1)+
            Copy(sCdFUN, 2, 1)+
            Copy(sPreco1, 1, 2)+
            Copy(sCdPRD2, 1, 1)+
            sBCC1+
            Copy(sCdPRD1, 1, 1)+
            sTipo+
            sCredExt+
            Copy(sPreco2, 3, 2)+
            Copy(sValorTRC, 3, 2)+
            Copy(sCdPEN, 1, 1)+
            Copy(sCdPRD2, 2, 2)+
            Copy(sValorTRC, 1, 2)+
            Copy(sCdTRC, 1, 1)+
            Copy(sCdPRD1, 4, 2)+
            sBCC2+
            Copy(sCdPRD1, 2, 2)+
            sSit+
            Copy(sCdPRD3, 4, 2)+
            Copy(sDataAgora, 2, 2)+
            Copy(sCdPRD3, 1, 1)+
            Copy(sCdPDV, 1, 1)+
            Copy(sCdPRD3, 2, 2)+
            Copy(sPreco2, 1, 2)+
            Copy(sCdUSU, 1, 1)+
            Copy(sPreco3, 3, 2)+
            Copy(sDataRef, 2, 2)+
            Copy(sCdTRC, 4, 2)+
            Copy(sDataRef, 1, 1)+
            Copy(sCdPDV, 4, 2)+
            Copy(sPreco3, 1, 2)+
            Copy(sCdTRC, 2, 2)+
            Copy(sCdPRD2, 4, 2)+
            Copy(sCdPDV, 2, 2)+
            Copy(sCdUSU, 2, 1)+
            Copy(sPreco1, 3, 2)+
            Copy(sCdFUN, 1, 1)+
            Copy(sDataAgora, 4, 2)+
            Copy(sCdPEN, 4, 2)+
            Copy(sCdPEN, 2, 2);

  //Calcular BCC do Campo todo
  iBCC := 0;
  for i := 1 to Length(sCampo) do
    iBCC := iBCC XOR ord(sCampo[i]);

  sBCC3      := IntToHex(iBCC, 1);

  Result := sCampo+sBCC3;
end;

function AlteraCorComponentes: TColor;
begin
  if (f_SkinGerenciador) then
    Result := clInfoBk
  else
    Result := clMenu;
end;

function f_TemCaixaAberto(Query: TQuery; Data: TDateTime): Boolean;
begin
  Query.close;
  Query.SQL.Text := 'SELECT BLD_CODIGO '+
        ' FROM BOLETIM_DIARIO '+
        ' WHERE BLD_DATA>="'+MesDia(Data)+'" '+
        ' AND BLD_TIPO = ''A'' '+
        ' AND BLD_DATA<"'+MesDia(Data+1)+'" '+
        ' AND CAX_CODIGO='+IntToStr(f_codigoCaixa);
  Query.open;

  if not Query.isEmpty then
    Result := True
  else
    Result := False;
end;

function f_TemCaixaFechado(Query: TQuery; Data: TDateTime): Boolean;
begin
  Query.close;
  Query.SQL.Text := 'SELECT BLD_CODIGO '+
        ' FROM BOLETIM_DIARIO '+
        ' WHERE BLD_DATA>="'+MesDia(Data)+'" '+
        ' AND BLD_TIPO = ''F'' '+
        ' AND BLD_DATA<"'+MesDia(Data+1)+'" '+
        ' AND CAX_CODIGO='+IntToStr(f_codigoCaixa);
  Query.open;

  if not Query.isEmpty then
    Result := True
  else
    Result := False;
end;


procedure f_InformacoesProduto(lista: TListBox);
const
  InfoStr : array [1..11] of string =
    ('CompanyName', 'FileDescription', 'FileVersion',
     'InternalName', 'LegalCopyright',
     'LegalTradeMarks', 'OriginalFilename',
     'ProductName', 'ProductVersion',
     'Comments', 'Author');

  LabelStr : array [1..11] of string =
    ('Companhia', 'Descrição','Versão arquivo','Nome interno',
     'Copyright','Marca registrada','Nome original',
     'Nome produto','Versão produto','Comentários','Autor');
var
  TamVer, i   :integer;
  Dummy       : DWord;
  Tam         : UINT;
  VerInfo     : PChar;
  Valor       : Pointer;
  Translation : Pointer;
  VerBegin    : String;
begin
  try
    if lista <> nil then
      lista.Items.Clear;
    // Obtém o tamanho da informação de versão
    TamVer := GetFileVersionInfoSize(PChar(ParamStr(0)),Dummy);
    if TamVer > 0 then
    Begin
      // Aloca memória para armazenar versão
      GetMem(VerInfo, TamVer);
      if lista <> nil then
        lista.Items.Add(PreencheEspaco(16,'Tamanho')+' - '+IntToStr(TamVer));
      // Obtém informação de versão
      GetFileVersionInfo(PChar(ParamStr(0)),0,TamVer,VerInfo);
      // Obtém informação de Língua
      VerQueryValue(VerInfo,'\\VarFileInfo\\Translation',Translation,Tam);
      // Inicializa variável para obter informações
      VerBegin:='\\StringFileInfo\\'+IntToHex(LoWord(LongInt(Translation^)),4)+
                                     IntToHex(HiWord(LongInt(Translation^)),4)+'\\';
      // Obtém as informações
      For i := 1 to 11 do
      begin
        if VerQueryValue(VerInfo, PChar(VerBegin+InfoStr[i]),Valor,Tam) then
        begin
          if Tam > 0 then
          begin

            if i = 3 then
              f_VersaoSistema := String(PChar(Valor));

            if i = 9 then
              f_VersaoProduto := String(PChar(Valor));

            if lista <> nil then
              lista.Items.Add(PreencheEspaco(16,LabelStr[i])+ ' - '+String(PChar(Valor)));

          end;
        end;
      end;
      if lista <> nil then
        lista.Items.Add(PreencheEspaco(16,'Versão da Base')+' - '+IntToStr(cVersaoBase)+'.'+PreencheZero(2,cVersaoBaseSub)+
                             ' ('+IntToStr(Trunc(StrToDate(DataLimite)-f_DataHora)+1)+')');
      // Libera Memória Alocada
      FreeMem(VerInfo, TamVer);
    end
    else
    begin
      if lista <> nil then
        lista.Items.Add('Não há informação de versão!!!');
    end;
  except
  end;
end;

procedure VisiteNossoSite;
var
  IE : Variant;
begin
  IE := CreateOleObject('InternetExplorer.Application');
  IE.Visible := True;
  IE.Navigate('http://www.buildsistema.com.br');
{  WEB_ShowWebBrowser(Application,
                     'http://www.buildsistema.com.br',
                     'Build Sistemas',
                     1000, //Width
                     500, //Height
                     5, //Top
                     5  //Left
                     );
}                     
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

function ComputadorDoProgramador: Boolean;
var
  sSerial: string;
begin
  sSerial := getSerialHD;
  result := (sSerial = '1090001114');
end;                    

procedure CorrigeRegistroDeletado(query: TQuery);
begin
  ExecutaSQL(query,'DELETE FROM REGISTRO_DELETADO WHERE RDL_CODIGO_TABELA >= 4600');
end;

function AllTrim(pP1:String): String;
begin
  while Copy(pP1,Length(pP1),1) = ' ' do
    pP1 := Copy(pP1,1,Length(pP1)-1);
  while Copy(pP1,1,1) = ' ' do
    pP1 := Copy(pP1,2,Length(pP1)-1);
  Result := pP1;
end;

procedure ExcluiArquivos(sDiretorio, sTipo: string);
var
  dir : TSearchRec;
begin
  try
    FindFirst(PChar(sDiretorio + '*.' + sTipo),faArchive,dir);

    repeat
      DeleteFile(PChar(sDiretorio + dir.name));
    until FindNext(dir) <> 0;

  finally
    FindClose(dir);
  end;
end;

procedure ListArquivos(sDiretorio, sTipo: string; var sLista: TStringList);
var
  dir : TSearchRec;
begin
  sLista.Clear;
  try
    FindFirst(PChar(sDiretorio + '*.' + sTipo),faArchive,dir);

    repeat
      sLista.Add(PChar(sDiretorio + dir.name))
    until FindNext(dir) <> 0;

  finally
    FindClose(dir);
  end;
end;

procedure ListSomenteArquivos(sDiretorio, sTipo: string; var sLista: TStringList);
var
  dir : TSearchRec;
begin
  sLista.Clear;
  try
    FindFirst(PChar(sDiretorio + '*.' + sTipo),faArchive,dir);

    repeat
      sLista.Add(PChar(dir.name))
    until FindNext(dir) <> 0;

  finally
    FindClose(dir);
  end;
end;

function ExecutaComunicacao: boolean;
var
  ArqConf: TIniFile;
begin
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := ArqConf.ReadString('MAQUINA', 'Comunicacao', 'N') = 'S';
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

function ComunicacaoAutomatica: boolean;
var
  ArqConf: TIniFile;
begin
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := ArqConf.ReadString('MAQUINA', 'ComAutomatico', 'N') = 'S';
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

function RelatorioGrafico: boolean;
var
  ArqConf: TIniFile;
begin
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := ArqConf.ReadString('MAQUINA', 'RelGrafico', 'N') = 'S';
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

function PAF_GetPasta: string;
var
  ArqConf: TIniFile;
begin
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := ArqConf.ReadString('MAQUINA', 'PastaPAF', '');
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

function GetTotalConsignacao(Query: TQuery; iCNC, iCSG: integer): Double;
begin
  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT ISNULL(SUM(ICS_QUANTIDADE * ICS_VALOR),0) AS VALOR_TOTAL'+
      ' FROM ITEM_DE_CONSIGNACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(iCNC)+
      ' AND CSG_CODIGO='+inttostr(iCSG);
    Open;
    Result := FieldByName('VALOR_TOTAL').AsFloat;
    //Consignacao1.Valor := Result;
    {DM.QR_Comandos.Close;
    DM.QR_Comandos.SQL.Text := 'UPDATE CONSIGNACAO SET CSG_VALOR = '+VirgPonto(Result)+
                       ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                       ' AND CSG_CODIGO='+edtCodigoCSG.Text;
    DM.QR_Comandos.ExecSQL;}
  end;
end;

function GetEmpresaComunicacao(Query: TQuery): string;
begin
  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM COMUNICACOES';
    Open;
    Result := FieldByName('COM_PREFIXO').AsString;
  end;
end;

procedure PAF_ExecutaCupomFiscal;
var
  sArquivo: string;
  Origem, Destino: string;
begin
  Origem  := PAF_GetPasta + '\small.ini';
  Destino := ExtractFilePath(Application.ExeName)+'small.ini';

  if CopyFile(PChar(Origem), PChar(Destino), false) then
  begin
    sArquivo := PAF_GetPasta + '\Frente.exe';

    if FileExists(sArquivo) then
      WinExec(PChar(sArquivo), SW_SHOWNORMAL); //ShellExecute(Handle,'open',PChar(sArquivo),'',NIL,SW_NORMAL);
  end
  else
    ShowMessage('Erro ao copiar ' + Origem + ' para ' + Destino);
end;

{
procedure AtualizaTabelaFTP(Query: TQuery);
begin
  Query.Close;
  Query.SQL.Text := 'UPDATE CONFIGURACAO SET                ' +
                    'CNF_FTP_URL = ''lantech.eti.br'',      ' +
                    'CNF_FTP_USUARIO = ''lantech'',         ' +
                    'CNF_FTP_SENHA = ''pipoca0001'',        ' +
                    'CNF_FTP_PASSIVO = ''S'',               ' +
                    'CNF_ARQUIVO_PRINCIPAL = ''/PSCI.exe'', ' +
                    'CNF_ARQUIVO_CHAVE = ''/Chave.dll''     ' ;
  Query.ExecSQL;
end;
}

end.


