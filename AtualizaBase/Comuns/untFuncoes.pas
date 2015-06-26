////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO SISTEMA..: SYS-NFe                                                 //
//============================================================================//
// REVISÃO..........: 1.0                                                     //
// MÓDULO...........: NFe                                                     //
// UNIT.............: Unit que contém as funções comuns de todo o projeto     //
// ANALISTA.........: Anderson Gonçalves                                      //
// DESENVOLVEDOR....: Anderson Gonçalves                                      //
// UTILIZADO EM.....: SysNFe.exe, LibSysNFe.dll                               //
// DATA DE CRIAÇÃO..: 20/11/2009                                              //
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
unit untFuncoes;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Typinfo, SqlExpr, IniFiles, Registry, ComObj,
  untTypes, ACBrNFe, pcnConversao, ShellAPI, Variants, Buttons, OleCtrls,
  SHDocVw, ACBrNFeDANFEClass, ACBrNFeDANFERave, ACBrUtil,StrUtils, FileCtrl;


  function PreencheR(Tam: Integer; Text:String; Caracter: string=''): String;
  function PreencheL(Tam: Integer; Text:String; Caracter: string=''): String;
  function GetNextNFe(sSerie : String; var Numero: Integer): Boolean; overload;
  function GetNextNFe(sSerie : String): String; overload;
  function SetNextNFe(sSerie: String): Boolean;
  procedure GravarConfiguracao(CertificadoPath,CertificadoSenha,CertificadoNumSerie: String;
    TipoDANFE,FormaEmissaoDANFE: Integer;LogoMarca: String; Salvar: Boolean;PathSalvar,WSUF: String;
    WSAmbiente: Integer; WSVisualizar: Boolean; ProxyHost,ProxyPorta,ProxyUser,ProxyPass,
    EmitCNPJ,EmitIE,EmitRazaoSocial, EmitFantasia,EmitFone,EmitCEP,EmitLogradouro,EmitNumero,
    EmitComplemento,EmitBairro,EmitCodCidade,EmitCidade,EmitUF: String;
    EmailHost,EmailPorta,EmailUser,EmailPass,EmailAssunto: String;EmailSSL: Boolean; memo: TMemo;
    tTimer: Integer; sSerieUtilizada, sPathPDF: String; MostrarPreview: Boolean; NCopiasDANFE: Integer);
  procedure LerConfiguracao(ACBrNFe: TACBrNFe; ACBrNFeDANFERave: TACBrNFeDANFERave; Timer: TTimer; var CertificadoPath: String; var CertificadoSenha: String; var CertificadoNumSerie: String;
    var TipoDANFE: Integer; var FormaEmissaoDANFE: Integer;var LogoMarca: String; var Salvar: Boolean;var PathSalvar: String;var WSUF: String;
    var WSAmbiente: Integer; var WSVisualizar: Boolean; var ProxyHost: String;var ProxyPorta: String;var ProxyUser: String;var ProxyPass: String;
    var EmitCNPJ: String;var EmitIE: String;var EmitRazaoSocial: String; var EmitFantasia: String;var EmitFone: String;
    var EmitCEP: String;var EmitLogradouro: String;var EmitNumero: String;
    var EmitComplemento: String;var EmitBairro: String;var EmitCodCidade: String;var EmitCidade: String;var EmitUF: String;
    var EmailHost: String;var EmailPorta: String;var EmailUser: String;var EmailPass: String;var EmailAssunto: String;var EmailSSL: Boolean; var memo: TStringList;
    var tTimer: Integer; var sSerieUtilizada: String; var sPathPDF: String; var MostrarPreview: Boolean; var NCopiasDANFE: Integer);
  function ParamDialog(OpenDialog: TOpenDialog;Title,DefaultExt,Filter: String) : Boolean;
  procedure LoadXML(mMemo: TMemo; wbWebBrowser: TWebBrowser);
  function  VersaoArquivo(sFile: string; bMask: boolean): String;
  function SelecionarDiretorio(edt: TEdit): String;

var
  PathNFe: String;  
////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//           V A R I A V E I S   D E   I N I C I A L I Z A C A O              //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
  fSerie               : String;                                              //
  fCertificadoPath     : String;                                              //
  fCertificadoSenha    : String;                                              //
  fCertificadoNumSerie : String;                                              //
  fTipoDANFE           : Integer;                                             //
  fFormaEmissaoDANFE   : Integer;                                             //
  fLogoMarca           : String;                                              //
  fSalvar              : Boolean;                                             //
  fPathSalvar          : string;                                              //
  fWSUF                : String;                                              //
  fWSAmbiente          : Integer;                                             //
  fWSVisualizar        : Boolean;                                             //
  fProxyHost           : String;                                              //
  fProxyPorta          : String;                                              //
  fProxyUser           : String;                                              //
  fProxyPass           : String;                                              //
  fEmitCNPJ            : String;                                              //
  fEmitIE              : String;                                              //
  fEmitRazaoSocial     : String;                                              //
  fEmitFantasia        : String;                                              //
  fEmitFone            : String;                                              //
  fEmitCEP             : String;                                              //
  fEmitLogradouro      : String;                                              //
  fEmitNumero          : String;                                              //
  fEmitComplemento     : String;                                              //
  fEmitBairro          : String;                                              //
  fEmitCodCidade       : String;                                              //
  fEmitCidade          : String;                                              //
  fEmitUF              : String;                                              //
  fEmailHost           : String;                                              //
  fEmailPorta          : String;                                              //
  fEmailUser           : String;                                              //
  fEmailPass           : String;                                              //
  fEmailAssunto        : String;                                              //
  fEmailSSL            : Boolean;                                             //
  fMsnEmail            : TStringList;                                         //
  fTimer               : Integer;                                             //
  fPathPDF             : string;                                              //
  fArqRAVE             : string;                                              //
  fMostrarPreview      : Boolean;                                             //
  fNCopiasDANFE        : Integer;                                             //
////////////////////////////////////////////////////////////////////////////////

implementation

uses ACBrNFeConfiguracoes;

function PreencheR(Tam: Integer; Text: String; Caracter: string): String;
Var
  Texto: string;
begin
  Texto := '';
  if (Length(Text) >= Tam) or (Caracter = '') then
    texto := Copy(Text,1,Tam)
  else
  Begin
    while Length(Text + Texto) <= Tam do
      texto := texto + Caracter;
    Texto := text + Texto;
  end;
  result := Copy(Texto,1,Tam);
end;

function PreencheL(Tam:Integer; Text: String; Caracter: string): String;
Var
  i: Integer;
  Espaco: string;
begin
  Espaco := '';
  if (Length(Text) >= Tam) or (Caracter = '') then
    Espaco := Copy(Text,1,Tam)
  else
  Begin
    for i := 1 to Tam - Length(Text) do
      Espaco := Espaco + Caracter;
    Espaco := Espaco + Text;
  end;
  result := Espaco;
end;

function GetNextNFe(sSerie : String; var Numero: Integer): Boolean;
var
  Ini: TIniFile;
begin
  try
    try
      if FileExists('C:\Windows\System32\LibSysNFe.ini') then
        Ini := TIniFile.Create('C:\Windows\System32\LibSysNFe.ini')
      else
        Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'LibSysNFe.ini');

      Numero := Ini.ReadInteger('SERIE',sSerie,0) + 1 ;
      Result := True;
    except
    end;
  finally
    Ini.Free;
  end;
end;

function GetNextNFe(sSerie : String): String;
var
  Ini: TIniFile;
begin
  try
    try
      if FileExists('C:\Windows\System32\LibSysNFe.ini') then
        Ini := TIniFile.Create('C:\Windows\System32\LibSysNFe.ini')
      else
        Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'LibSysNFe.ini');

      Result := PathNFe + 'Pendentes\' + sSerie + PreencheL(8,IntToStr(Ini.ReadInteger('SERIE',sSerie,0) + 1 ),'0') + '.NFe';
    except
    end;
  finally
    Ini.Free;
  end;
end;

function SetNextNFe(sSerie: String): Boolean;
var
  Ini: TIniFile;
  Numero: Integer;
begin
  try
    try
      if FileExists('C:\Windows\System32\LibSysNFe.ini') then
        Ini := TIniFile.Create('C:\Windows\System32\LibSysNFe.ini')
      else
        Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'LibSysNFe.ini');

      Numero := Ini.ReadInteger('SERIE',sSerie,0);
      Ini.WriteInteger('SERIE',sSerie,(Numero + 1));
      Result := True;
    except
      Result := False;
    end;
  finally
    Ini.Free;
  end;
end;

procedure GravarConfiguracao(CertificadoPath,CertificadoSenha,CertificadoNumSerie: String;
  TipoDANFE,FormaEmissaoDANFE: Integer;LogoMarca: String; Salvar: Boolean;PathSalvar,WSUF: String;
  WSAmbiente: Integer; WSVisualizar: Boolean; ProxyHost,ProxyPorta,ProxyUser,ProxyPass,
  EmitCNPJ,EmitIE,EmitRazaoSocial, EmitFantasia,EmitFone,EmitCEP,EmitLogradouro,EmitNumero,
  EmitComplemento,EmitBairro,EmitCodCidade,EmitCidade,EmitUF: String;
  EmailHost,EmailPorta,EmailUser,EmailPass,EmailAssunto: String;EmailSSL: Boolean; memo: TMemo;
  tTimer: Integer; sSerieUtilizada, sPathPDF: String; MostrarPreview: Boolean; NCopiasDANFE: Integer);
Var IniFile : String ;
    Ini     : TIniFile ;
    StreamMemo : TMemoryStream;
begin
  IniFile := ChangeFileExt( Application.ExeName, '.ini') ;
  Ini := TIniFile.Create( IniFile );
  try
    Ini.WriteString( 'Certificado','Caminho' ,CertificadoPath) ;
    Ini.WriteString( 'Certificado','Senha'   ,CertificadoSenha) ;
    Ini.WriteString( 'Certificado','NumSerie',CertificadoNumSerie) ;

    Ini.WriteInteger( 'Geral','DANFE'        ,TipoDANFE) ;
    Ini.WriteInteger( 'Geral','FormaEmissao' ,FormaEmissaoDANFE) ;
    Ini.WriteString( 'Geral','LogoMarca'     ,LogoMarca) ;
    Ini.WriteBool(   'Geral','Salvar'        ,Salvar) ;
    Ini.WriteString( 'Geral','PathSalvar'    ,PathSalvar) ;
    Ini.WriteInteger( 'Geral','Timer'        ,tTimer) ;
    Ini.WriteString( 'Geral','SerieUtilizada',sSerieUtilizada) ;
    Ini.WriteString( 'Geral','PathPDF'       ,sPathPDF);
    Ini.WriteBool(   'Geral','MostrarPreview',MostrarPreview) ;
    Ini.WriteInteger( 'Geral','NCopiasDANFE' ,NCopiasDANFE) ;
    
    Ini.WriteString( 'WebService','UF'        ,WSUF) ;
    Ini.WriteInteger( 'WebService','Ambiente'  ,WSAmbiente) ;
    Ini.WriteBool(   'WebService','Visualizar',WSVisualizar) ;

    Ini.WriteString( 'Proxy','Host'   ,ProxyHost) ;
    Ini.WriteString( 'Proxy','Porta'  ,ProxyPorta) ;
    Ini.WriteString( 'Proxy','User'   ,ProxyUser) ;
    Ini.WriteString( 'Proxy','Pass'   ,ProxyPass) ;

    Ini.WriteString( 'Emitente','CNPJ'       ,EmitCNPJ) ;
    Ini.WriteString( 'Emitente','IE'         ,EmitIE) ;
    Ini.WriteString( 'Emitente','RazaoSocial',EmitRazaoSocial) ;
    Ini.WriteString( 'Emitente','Fantasia'   ,EmitFantasia) ;
    Ini.WriteString( 'Emitente','Fone'       ,EmitFone) ;
    Ini.WriteString( 'Emitente','CEP'        ,EmitCEP) ;
    Ini.WriteString( 'Emitente','Logradouro' ,EmitLogradouro) ;
    Ini.WriteString( 'Emitente','Numero'     ,EmitNumero) ;
    Ini.WriteString( 'Emitente','Complemento',EmitComplemento) ;
    Ini.WriteString( 'Emitente','Bairro'     ,EmitBairro) ;
    Ini.WriteString( 'Emitente','CodCidade'  ,EmitCodCidade) ;
    Ini.WriteString( 'Emitente','Cidade'     ,EmitCidade) ;
    Ini.WriteString( 'Emitente','UF'         ,EmitUF) ;

    Ini.WriteString( 'Email','Host'    ,EmailHost) ;
    Ini.WriteString( 'Email','Port'    ,EmailPorta) ;
    Ini.WriteString( 'Email','User'    ,EmailUser) ;
    Ini.WriteString( 'Email','Pass'    ,EmailPass) ;
    Ini.WriteString( 'Email','Assunto' ,EmailAssunto) ;
    Ini.WriteBool(   'Email','SSL'     ,EmailSSL ) ;
    StreamMemo := TMemoryStream.Create;
    memo.Lines.SaveToStream(StreamMemo);
    StreamMemo.Seek(0,soFromBeginning);
    Ini.WriteBinaryStream( 'Email','Mensagem',StreamMemo) ;
    StreamMemo.Free;
  finally
     Ini.Free ;
  end;

end;

procedure LerConfiguracao(ACBrNFe: TACBrNFe; ACBrNFeDANFERave: TACBrNFeDANFERave; Timer: TTimer; var CertificadoPath: String; var CertificadoSenha: String; var CertificadoNumSerie: String;
  var TipoDANFE: Integer; var FormaEmissaoDANFE: Integer;var LogoMarca: String; var Salvar: Boolean;var PathSalvar: String;var WSUF: String;
  var WSAmbiente: Integer; var WSVisualizar: Boolean; var ProxyHost: String;var ProxyPorta: String;var ProxyUser: String;var ProxyPass: String;
  var EmitCNPJ: String;var EmitIE: String;var EmitRazaoSocial: String; var EmitFantasia: String;var EmitFone: String;
  var EmitCEP: String;var EmitLogradouro: String;var EmitNumero: String;
  var EmitComplemento: String;var EmitBairro: String;var EmitCodCidade: String;var EmitCidade: String;var EmitUF: String;
  var EmailHost: String;var EmailPorta: String;var EmailUser: String;var EmailPass: String;var EmailAssunto: String;var EmailSSL: Boolean; var memo: TStringList;
  var tTimer: Integer; var sSerieUtilizada: String; var sPathPDF: String; var MostrarPreview: Boolean; var NCopiasDANFE: Integer);
Var IniFile  : String ;
    Ini     : TIniFile ;
    Ok : Boolean;
    StreamMemo : TMemoryStream;
begin
  IniFile := ChangeFileExt( Application.ExeName, '.ini') ;

  Ini := TIniFile.Create( IniFile );
  try
      {$IFDEF ACBrNFeOpenSSL}
         CertificadoPath  := Ini.ReadString( 'Certificado','Caminho' ,'') ;
         CertificadoSenha := Ini.ReadString( 'Certificado','Senha'   ,'') ;
         ACBrNFe.Configuracoes.Certificados.Certificado  := CertificadoPath;
         ACBrNFe.Configuracoes.Certificados.Senha        := CertificadoSenha;
         ACBrNFe.Configuracoes.Certificados.NumeroSerie := CertificadoNumSerie;
         {edtNumSerie.Visible := False;
         Label25.Visible := False;
         sbtnGetCert.Visible := False;}
      {$ELSE}
         CertificadoNumSerie := Ini.ReadString( 'Certificado','NumSerie','') ;
         ACBrNFe.Configuracoes.Certificados.NumeroSerie := CertificadoNumSerie;
         CertificadoNumSerie := ACBrNFe.Configuracoes.Certificados.NumeroSerie;
         {Label1.Caption := 'Informe o número de série do certificado'#13+
                           'Disponível no Internet Explorer no menu'#13+
                           'Ferramentas - Opções da Internet - Conteúdo '#13+
                           'Certificados - Exibir - Detalhes - '#13+
                           'Número do certificado';
         Label2.Visible := False;
         edtCaminho.Visible := False;
         edtSenha.Visible   := False;
         sbtnCaminhoCert.Visible := False;}
      {$ENDIF}

      FormaEmissaoDANFE := Ini.ReadInteger( 'Geral','FormaEmissao',0) ;
      Salvar    := Ini.ReadBool(   'Geral','Salvar'      ,True) ;
      PathSalvar   := Ini.ReadString( 'Geral','PathSalvar'  ,'') ;
      sSerieUtilizada   := Ini.ReadString( 'Geral','SerieUtilizada'  ,'1') ;
      tTimer := Ini.ReadInteger( 'Geral','Timer',20000) ;
      sPathPDF := Ini.ReadString( 'Geral','PathPDF'  ,'') ;
      MostrarPreview    := Ini.ReadBool(   'Geral','MostrarPreview'      ,True) ;
      NCopiasDANFE := Ini.ReadInteger( 'Geral','NCopiasDANFE',1) ;

      ACBrNFe.Configuracoes.Geral.FormaEmissao := StrToTpEmis(OK,IntToStr(FormaEmissaoDANFE+1));
      ACBrNFe.Configuracoes.Geral.Salvar       := Salvar;
      ACBrNFe.Configuracoes.Geral.PathSalvar   := PathSalvar;
      Timer.Interval := tTimer;

      WSUF       := Ini.ReadString( 'WebService','UF','CE') ;
      WSAmbiente  := Ini.ReadInteger( 'WebService','Ambiente'  ,0) ;
      WSVisualizar :=Ini.ReadBool(    'WebService','Visualizar',False) ;
      ACBrNFe.Configuracoes.WebServices.UF         := WSUF;
      ACBrNFe.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(WSAmbiente+1));
      ACBrNFe.Configuracoes.WebServices.Visualizar := WSVisualizar;

      ProxyHost  := Ini.ReadString( 'Proxy','Host'   ,'') ;
      ProxyPorta := Ini.ReadString( 'Proxy','Porta'  ,'') ;
      ProxyUser  := Ini.ReadString( 'Proxy','User'   ,'') ;
      ProxyPass  := Ini.ReadString( 'Proxy','Pass'   ,'') ;
      ACBrNFe.Configuracoes.WebServices.ProxyHost := ProxyHost;
      ACBrNFe.Configuracoes.WebServices.ProxyPort := ProxyPorta;
      ACBrNFe.Configuracoes.WebServices.ProxyUser := ProxyUser;
      ACBrNFe.Configuracoes.WebServices.ProxyPass := ProxyPass;

      TipoDANFE     := Ini.ReadInteger( 'Geral','DANFE'       ,0) ;
      LogoMarca     := Ini.ReadString( 'Geral','LogoMarca'   ,'') ;
      if ACBrNFe.DANFE <> nil then
      begin
        ACBrNFe.DANFE.TipoDANFE  := StrToTpImp(OK,IntToStr(TipoDANFE+1));
        ACBrNFe.DANFE.Logo       := LogoMarca;
        ACBrNFe.DANFE.PathPDF    := sPathPDF;
        ACBrNFe.DANFE.MostrarPreview := MostrarPreview;
        ACBrNFe.DANFE.NumCopias := NCopiasDANFE;
      end;

      EmitCNPJ       := Ini.ReadString( 'Emitente','CNPJ'       ,'') ;
      EmitIE         := Ini.ReadString( 'Emitente','IE'         ,'') ;
      EmitRazaoSocial:= Ini.ReadString( 'Emitente','RazaoSocial','') ;
      EmitFantasia   := Ini.ReadString( 'Emitente','Fantasia'   ,'') ;
      EmitFone       := Ini.ReadString( 'Emitente','Fone'       ,'') ;
      EmitCEP        := Ini.ReadString( 'Emitente','CEP'        ,'') ;
      EmitLogradouro := Ini.ReadString( 'Emitente','Logradouro' ,'') ;
      EmitNumero     := Ini.ReadString( 'Emitente','Numero'     ,'') ;
      EmitComplemento:= Ini.ReadString( 'Emitente','Complemento','') ;
      EmitBairro     := Ini.ReadString( 'Emitente','Bairro'     ,'') ;
      EmitCodCidade  := Ini.ReadString( 'Emitente','CodCidade'  ,'') ;
      EmitCidade     := Ini.ReadString( 'Emitente','Cidade'     ,'') ;
      EmitUF         := Ini.ReadString( 'Emitente','UF'         ,'') ;

      EmailHost     := Ini.ReadString( 'Email','Host'   ,'') ;
      EmailPorta    := Ini.ReadString( 'Email','Port'   ,'') ;
      EmailUser     := Ini.ReadString( 'Email','User'   ,'') ;
      EmailPass     := Ini.ReadString( 'Email','Pass'   ,'') ;
      EmailAssunto := Ini.ReadString( 'Email','Assunto','') ;
      EmailSSL    := Ini.ReadBool(   'Email','SSL'    ,False) ;
      StreamMemo := TMemoryStream.Create;
      Ini.ReadBinaryStream( 'Email','Mensagem',StreamMemo) ;
      Memo.LoadFromStream(StreamMemo);
      StreamMemo.Free;

      fArqRAVE := ExtractFileDir(application.ExeName) + '\Rave\NotaFiscalEletronica.rav';
      ACBrNFeDANFERave.RavFile := fArqRAVE;
  finally
     Ini.Free ;
  end;
end;

function ParamDialog(OpenDialog: TOpenDialog;Title,DefaultExt,Filter: String) : Boolean;
begin
  OpenDialog.Title := Title;
  OpenDialog.DefaultExt := DefaultExt;
  OpenDialog.Filter := Filter;
  OpenDialog.InitialDir := fPathSalvar;
  if OpenDialog.Execute then
    Result := True
  else
    Result := False;
end;

procedure LoadXML(mMemo: TMemo; wbWebBrowser: TWebBrowser);
begin
  mMemo.Lines.SaveToFile(ExtractFileDir(application.ExeName)+'temp.xml');
  wbWebBrowser.Navigate(ExtractFileDir(application.ExeName)+'temp.xml');
end;

function  VersaoArquivo(sFile: string; bMask: boolean): String;

  function subVerDef: string;
  begin
    Result := IfThen(bMask,'3.0.1.0','3000') ;
  end;

var
  VerInfo      : Pointer;
  VerValue     : Pointer;
  VerInfoSize  : DWORD;
  VerValueSize : DWORD;
  Dummy        : DWORD;
begin
  if (sFile = '') or (not FileExists(sFile)) then
  begin
    Result := subVerDef;
    Exit;
  end;
  VerInfoSize := GetFileVersionInfoSize(PChar(sFile), Dummy);
  GetMem(VerInfo, VerInfoSize);
  try
    GetFileVersionInfo(PChar(sFile), 0, VerInfoSize, VerInfo);
    if Assigned(VerInfo) then
    begin
      VerQueryValue(VerInfo, '\VarFileInfo\Translation', VerValue, VerValueSize);
      VerQueryValue(VerInfo,
                    PChar( Format('\StringFileInfo\0%x0%x\%s',
                                  [LoWord(Longint(VerValue^)),
                                   HiWord(Longint(VerValue^)),
                                   'FileVersion']) ),
                    Pointer(VerValue),
                    VerValueSize);
      Result := PChar(VerValue);
      // retira os pontos
      if not bMask then
        Result := StringReplace(Result,'.','',[rfReplaceAll]);
    end
    else
      Result := subVerDef;
  finally
    FreeMem(VerInfo, VerInfoSize);
  end;
end;

function SelecionarDiretorio(edt: TEdit): String;
var
  Dir: string;
const
  SELDIRHELP = 1000;  
begin
  if Length(edt.Text) <= 0 then
     Dir := ExtractFileDir(application.ExeName)
  else
     Dir := edt.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    Result := Dir
  else
    Result := '';
end;

initialization
  PathNFe := ExtractFilePath(Application.Exename);

end.
