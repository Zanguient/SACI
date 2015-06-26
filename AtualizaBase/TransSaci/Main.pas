unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, StdCtrls, IdSMTPBase,
  IdExplicitTLSClientServerBase, IdFTP, IdAntiFreezeBase, IdAntiFreeze, DB,
  DBTables, Configuracao, Menus, Buttons, ToolWin, ComCtrls,
  ExtCtrls, CheckLst, IniFiles, IdAttachmentFile, Gauges, IdFTPCommon, IdGlobal,
  IdIntercept, IdLogBase, IdLogDebug, IdFTPListParseTandemGuardian,IdFTPListParseUnix,
  IdOSFileName,IdFTPListTypes,
  IdLogEvent, IdFTPList, IdFTPListParseBase, IdTStrings, StrUtils;
  //,WinSkinData, IdFTP, DB, IdExplicitTLSClientServerBase;

type
  TfMxPrincipal = class(TForm)
    Status: TStatusBar;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    mitEnviar: TMenuItem;
    MitReceber: TMenuItem;
    N2: TMenuItem;
    MitSair: TMenuItem;
    MitSobre: TMenuItem;
    PageControl1: TPageControl;
    tbs_Enviar: TTabSheet;
    tbs_Receber: TTabSheet;
    clb_enviar: TCheckListBox;
    clb_receber: TCheckListBox;
    tbs_Principal: TTabSheet;
    Image1: TImage;
    Label2: TLabel;
    N1: TMenuItem;
    EnviarBackup1: TMenuItem;
    N3: TMenuItem;
    AtualizarPrograma1: TMenuItem;
    RestaurarVesaoAnterior1: TMenuItem;
    tbs_receber_programa: TTabSheet;
    Configuracao1: TConfiguracao;
    Memo1: TMemo;
    ToolBar1: TToolBar;
    SB_Enviar: TSpeedButton;
    SB_Receber: TSpeedButton;
    SB_Sair: TSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    edtDiasEnvio: TEdit;
    Label4: TLabel;
    edtNomeTabela: TEdit;
    IdFTP1: TIdFTP;
    ckbInternet: TCheckBox;
    DebugListBox: TListBox;
    ProgressBar1: TProgressBar;
    DebugListBoxEnviar: TListBox;
    EnviarFTP1: TMenuItem;
    N4: TMenuItem;
    clb_receberPrograma: TCheckListBox;
    DebugListBoxRecPrograma: TListBox;
    procedure MitSairClick(Sender: TObject);
    procedure MitSobreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mitEnviarClick(Sender: TObject);
    procedure MitReceberClick(Sender: TObject);
    procedure EnviarBackup1Click(Sender: TObject);
    procedure AtualizarPrograma1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Integer);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Integer);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure DirectoryListBoxDrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure HeaderControl1SectionResize(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure EnviarFTP1Click(Sender: TObject);
  private
    STime: TDateTime;
    iCPD: integer;
    sFTPHost, sFTPUsu, sFTPSenha,sFTPProxyHost,
      sFTPProxyUsu, sFTPProxySenha, sFTPProxyPorta, sPastaRaizFTP: string;
    AbortTransfer, TransferrignData, vExibirStatus, vMagazine: Boolean;
    BytesToTransfer, iTamanhoArquivo: Longint;
    procedure EnviarArquivoFTP;
    //function BaixarArquivoFTP(PArquivoFTP, PPastaDestino, PArquivoDestino: string):Boolean;
    procedure AtualizaControles(Habilitar: Boolean);
    procedure DeletarArquivosDB(sPath: String);
  public
    { Public declarations }
    vFalha: Boolean;
    procedure ExportarDados;
    procedure ComprimirDados(Tudo:Boolean);
    procedure Enviar(Tudo:Boolean);
    procedure DescomprimirDados(var PastaRecep2: String);
    procedure ImportarDados;
  end;

var
  AverageSpeed: Double = 0;
  fMxPrincipal: TfMxPrincipal;

implementation

uses Funcoes, MxSincroniza, MxSobreTransSACI;

{$R *.DFM}
procedure TfMxPrincipal.ExportarDados;
begin
  vFalha := False;
  with fmxSincroniza do
  Begin
    Tag := cTransSACIEnviar;
    sSomenteTabela := self.edtNomeTabela.Text;

    if self.edtDiasEnvio.Text = '0' then
      iDiasEnvio := 10000
    else
      iDiasEnvio := StrToInt(self.edtDiasEnvio.Text);

    ShowModal;
  end;
  if vFalha then
  Begin
    ShowMessage('Processo abortado!');
    Application.Terminate;
  end;
  clb_enviar.Checked[0]:=True;
end;

procedure TfMxPrincipal.ComprimirDados(Tudo:Boolean);
var
  arquivo, sNomeArq, sParametro, PastaTransm, sCC: string;
//  sNomeAnexo, sAnexo:string;
  conf:TIniFile;
//  idAttach: TIdAttachmentFile;
begin
  sNomeArq := 'C:\SACI\Sistema\RAR.EXE';

  arquivo:=ExtractFilePath(ParamStr(0))+'confEnviaFILIAL.ini';

  if not FileExists(arquivo) then
  Begin
//    Writeln(T1, 'Arquivo não encontrado <<'+arquivo+'>>');
    ShowMessage('Arquivo não encontrado <<'+arquivo+'>>');
    Raise exception.Create('');
  end;

  conf:=TIniFile.Create(arquivo);
  PastaTransm := conf.ReadString('dbDestino', 'PATH', '');
  sCC := PreencheZero(2,conf.ReadString('dbOrigem', 'CC', '0'));
  sFTPHost  := conf.ReadString('internet', 'HOST', '');
  sFTPUsu   := conf.ReadString('internet', 'USUARIO', '');
  sFTPSenha := conf.ReadString('internet', 'SENHA', 'guerra');
  sFTPProxyHost  := conf.ReadString('internet', 'ProxyHOST', '');
  sFTPProxyPorta := conf.ReadString('internet', 'ProxyPORTA', '0');
  sFTPProxyUsu   := conf.ReadString('internet', 'ProxyUSUARIO', '');
  sFTPProxySenha := conf.ReadString('internet', 'ProxySenha', '');
  iCPD := StrToInt(conf.ReadString('Configuracao', 'CPD', '0')); //1 Russas; 2 Aracati; 3 Mafalda; 4 Itapipoca; 5 Luciano
  vMagazine := (conf.ReadString('Configuracao', 'Magazine', '0') = '1'); //0 Eletro; 1 Magazine

  if not DirectoryExists(PastaTransm) then
    Raise exception.Create('Destino não encontrado!');

  //Todos os arquivos foram apagados antes de começar o processo

  Status.Panels[0].Text:='Comprimindo Dados...';
  Status.Refresh;

  if Configuracao1.Empresa <> empCreator then //Creator
  Begin
    if not FileExists(sNomeArq) then
      Raise exception.Create('Arquivo não encontrado <<'+sNomeArq+'>>');

    sParametro := ' a -y '+PastaTransm+'\SACI_FILIAL.rar '+PastaTransm+'\*.*';
    ExecutarEXEAguardando(sNomeArq, sParametro);
  end;

  clb_enviar.Checked[1]:=True;

  if ckbInternet.Checked then
    EnviarArquivoFTP;


    {
    Status.Panels[0].Text:='Enviando E-MAIL';
    Status.Refresh;

    sAnexo     := PastaTransm+'\SACI_FILIAL.rar';
    sNomeAnexo := 'SACI_FILIAL.rar';
    try
      with mesgMessage do
      begin
        Clear;
        From.Text := 'TRANSACI '+PreencheZero(2,sCC);
        Recipients.Add.Text := 'eletroguerra@eletroguerra.com.br';
        Subject := 'DADOS AUTOMÁTICOS LOJA:'+sCC;

        CharSet:='iso-8859-1';
        Encoding:=meMIME;
        ContentType:='multipart/related';
        Body.Clear;
      end;


      idAttach:=nil;
      try
        idAttach:=TIdAttachmentFile.Create(mesgMessage.MessageParts, sAnexo);
        idAttach.ContentType := 'banco/db';
        idAttach.ExtraHeaders.Add('Content-ID: <'+sNomeAnexo+'>');
        idAttach.ExtraHeaders.Values['content-id'] := sNomeAnexo ;
        idAttach.DisplayName:= sNomeAnexo ;
//        idAttach.ContentDisposition := 'inline';    //Exibir no Corpo da mensagem oconteúdo do anexo
      except
        idAttach.CleanupInstance ;
      end;

      with IdSMTP1 do
      begin
        Host     := sSMTPHost;
        Username := sSMTPUsu;
        Password := sSMTPSenha;
        Connect;
        if not Connected then
          Raise exception.Create('Falha ao conectar SMTP!');
        try
          Send(mesgMessage);
          clb_enviar.Checked[2]:=True;
          Disconnect;
          Application.MessageBox('Email enviado com sucesso!', 'Confirmação', MB_ICONINFORMATION + MB_OK);
        except
        end;
      end;
    finally
      try
        IdSMTP1.Disconnect;
      except
      end;
    end;
}
  SB_Sair.Caption := 'Sair';
  SB_Sair.Refresh;
  Status.Panels[0].Text:='FIM';
end;

procedure TfMxPrincipal.Enviar(Tudo:Boolean);
begin
  Status.Panels[0].Text:='Exportando os dados...';
  Status.Refresh;

  ExportarDados;
  if vFalha then
    Exit;

  ComprimirDados(Tudo);
end;

procedure TfMxPrincipal.DescomprimirDados(var PastaRecep2: String);
var
  arquivo, sNomeArq, sParametro, PastaRecep: string;
  conf:TIniFile;
begin
  sNomeArq := 'C:\SACI\Sistema\UNRAR.EXE';

  arquivo:=ExtractFilePath(ParamStr(0))+'confRecebeFILIAL.ini';

  if not FileExists(arquivo) then
  Begin
//    Writeln(T1, 'Arquivo não encontrado <<'+arquivo+'>>');
    ShowMessage('Arquivo não encontrado <<'+arquivo+'>>');
    Raise exception.Create('');
  end;

  conf:=TIniFile.Create(arquivo);
  PastaRecep := conf.ReadString('dborigem', 'PATH', '');

  if not DirectoryExists(PastaRecep) then
    Raise exception.Create('Pasta de Origem não encontrada!');


  Status.Panels[0].Text:='Descompactando Dados...';
  //Na Creator não tem envio de arquivo, os computadores estão em rede e as tabelas não são compactadas
  if Configuracao1.Empresa <> empCreator then
  Begin
    //Apagar tabelas antigas (sem apagar o SACI_CPD.RAR)
    ApagarArquivos(PastaRecep, '*.*', 'SACI_CPD.RAR');

    if not FileExists(sNomeArq) then
      Raise exception.Create('Arquivo não encontrado <<'+sNomeArq+'>>');

    if not FileExists(PastaRecep+'\SACI_CPD.RAR') then
      Raise exception.Create('Arquivo não encontrado <<SACI_CPD.RAR>>');

    sParametro := ' e -y '+PastaRecep+'\SACI_CPD.RAR '+PastaRecep+'\. ';
    ExecutarEXEAguardando(sNomeArq, sParametro);

    ApagarArquivos(PastaRecep, '*.lck');

    clb_receber.Checked[0]:=True;

    Status.Panels[0].Text:='Descompactado';
  end;
  PastaRecep2 := PastaRecep;
end;

procedure TfMxPrincipal.ImportarDados;
begin
  fmxSincroniza.Tag := cTransSACIReceber;
  fmxSincroniza.ShowModal;
  clb_receber.Checked[1]:=True;
  ShowMessage('Recepção efetuada com sucesso!!!');
  //
  //Não acho uma boa apagar os arquivos depois de processar
//  if Configuracao1.Empresa <> empEletro then
//    ApagarArquivos('C:\SACI\RECEP', '*.*');
end;

//Conexão(dialing) falhou
procedure TfMxPrincipal.MitSairClick(Sender: TObject);
begin
  if SB_Sair.Caption = 'Sair' then
    Close
  else
  Begin
    AbortTransfer := true;
    SB_Sair.Caption := 'Sair';
    SB_Sair.Refresh;
  end;
end;

procedure TfMxPrincipal.MitSobreClick(Sender: TObject);
begin
  Application.CreateForm(TfMxSobreTransSACI, fMxSobreTransSACI);
  fMxSobreTransSACI.ShowModal;
end;

procedure TfMxPrincipal.FormCreate(Sender: TObject);
begin
  Caption           := 'TransSACI';
  vExibirStatus     := True;
  iTamanhoArquivo   := 0;

  //Configurações Regionais
  ThousandSeparator := '.';
  DecimalSeparator  := ',';
  DateSeparator     := '/';
  ShortDateFormat   := 'DD/MM/YYYY';
  TimeSeparator     := ':';
  ShortTimeFormat   := 'hh:mm:ss';

  PageControl1.ActivePage := tbs_Principal;
end;

procedure TfMxPrincipal.mitEnviarClick(Sender: TObject);
begin
  if Configuracao1.CentroDeCusto = 0 then
    Raise exception.Create('Centro de custo "0" não Envia/Recebe dados pelo TransSACI.exe!');

  AtualizaControles(False);
  DebugListBoxEnviar.Clear;
  DebugListBoxEnviar.Refresh;
  Status.Panels[1].Text:='';

  if not VerificaInteiroBranco(edtDiasEnvio.Text) then
    Raise exception.Create('Dias para envio inválido!'+#13+
      'Em caso de dúvida entrar em contato com o CPD!');

  if Trim(edtNomeTabela.Text) <> '' then
    If MessageDlg('Atenção!!!'+#13+'Será enviada somente a tabela informada.'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

  if ckbInternet.Checked and
     (clb_enviar.Items.Count = 2) then
    clb_enviar.Items.Add('Enviar Arquivo FTP');

  PageControl1.ActivePage:=tbs_Enviar;
  Caption:='TransSACI [Enviar]';
  Enviar(True);
  DeletarArquivosDB('C:\SACI\Transm\');

  ShowMessage('Processo Finalizado!!!');
  //
  MitSairClick(Sender);
end;

procedure TfMxPrincipal.DeletarArquivosDB(sPath: String);
var
  SR: TSearchRec;
  I: integer;
begin
  I := FindFirst(PChar(sPath+'*.DB'), faAnyFile, SR);
  while I = 0 do
  begin
    if (SR.Attr and faDirectory) <> faDirectory then
      DeleteFile(PChar(sPath + SR.Name));
    I := FindNext(SR);
  end;
end;

procedure TfMxPrincipal.MitReceberClick(Sender: TObject);
var
  sNomeArquivo, sArquivoDestino,arquivo,PastaRecep, PastaRecep2: string;
//  LS: TStringList;
  FArquivo: file of byte;
  conf:TIniFile;
begin
  if Configuracao1.CentroDeCusto = 0 then
    Raise exception.Create('Centro de custo 0 não Envia/Recebe dados pelo TransSACI.exe!');

  AtualizaControles(False);
  DebugListBox.Clear;
  DebugListBox.Refresh;
  Status.Panels[1].Text:='';

  if Trim(edtNomeTabela.Text) <> '' then
    Raise exception.Create('A opção de definir tabela funciona somente para enviar!');

  PageControl1.ActivePage:=tbs_Receber;
  Caption:='TransSACI [Receber]';


  if ckbInternet.Checked then
  Begin
    arquivo:=ExtractFilePath(ParamStr(0))+'confRecebeFILIAL.ini';
    if not FileExists(arquivo) then
    Begin
      ShowMessage('Arquivo não encontrado <<'+arquivo+'>>');
      Raise exception.Create('');
    end;

    conf:=TIniFile.Create(arquivo);
    PastaRecep      := conf.ReadString('dbOrigem', 'PATH', '');
    sFTPHost        := conf.ReadString('internet', 'HOST', '');
    sFTPUsu         := conf.ReadString('internet', 'USUARIO', '');
    sFTPSenha       := conf.ReadString('internet', 'SENHA', 'guerra');
    sFTPProxyHost   := conf.ReadString('internet', 'ProxyHOST', '');
    sFTPProxyPorta  := conf.ReadString('internet', 'ProxyPORTA', '0');
    sFTPProxyUsu    := conf.ReadString('internet', 'ProxyUSUARIO', '');
    sFTPProxySenha  := conf.ReadString('internet', 'ProxySenha', '');
    iCPD            := StrToInt(conf.ReadString('Configuracao', 'CPD', '0')); //1 Russas; 2 Aracati; 3 Mafalda; 4 Itapipoca; 5 Luciano
    vMagazine       := (conf.ReadString('Configuracao', 'Magazine', '0') = '1'); //0 Eletro; 1 Magazine

    DebugListBox.Clear;

    SB_Sair.Caption := 'Abortar';
    SB_Sair.Refresh;
    Status.Panels[0].Text:='Conectando com o Servidor de FTP...';
    Status.Refresh;

    IdFTP1.Host     := sFTPHost;
    IdFTP1.Username := sFTPUsu;
    IdFTP1.Password := sFTPSenha;

    if sFTPProxyHost <> '' then
    Begin
      IdFTP1.ProxySettings.Host      := sFTPProxyHost;
      IdFTP1.ProxySettings.Port      := StrToInt(sFTPProxyPorta);
      IdFTP1.ProxySettings.ProxyType := fpcmOpen;
    end
    else
      IdFTP1.ProxySettings.ProxyType := fpcmNone;

    try
      IdFTP1.Connect;
    except
    end;
    try
      if not IdFTP1.Connected then
        Raise exception.Create('Não foi possível conectar com o servidor de FTP!');

      Status.Panels[0].Text:='Conectado. Acessando a Pasta SACI...';
      Status.Refresh;
      if iCPD = 1 then //Russas
        IdFTP1.ChangeDir('CPD_RUSSAS')
      else if iCPD = 2 then //Aracati
        IdFTP1.ChangeDir('CPD_ARACATI')
      else if iCPD = 3 then //Mafalda
        IdFTP1.ChangeDir('CPD_MAFALDA')
      else if iCPD = 4 then //Itapipoca
        IdFTP1.ChangeDir('CPD_ITAPIPOCA')
      else
        Raise exception.Create('Configuração de CPD inválida!');

      if vMagazine then
        sPastaRaizFTP := 'SACI_T'
      else
        sPastaRaizFTP := 'SACI';

      IdFTP1.ChangeDir(sPastaRaizFTP);

  {    LS := TStringList.Create;
      try
        IdFTP1.TransferType := ftASCII;
        DirectoryListBox.Items.Clear;
        IdFTP1.List(LS);
        DirectoryListBox.Items.Assign(LS);
        if DirectoryListBox.Items.Count > 0 then
          if AnsiPos('total', DirectoryListBox.Items[0]) > 0 then DirectoryListBox.Items.Delete(0);
      finally
        LS.Free;
      end;
  }

      Status.Panels[0].Text:='Conectado. Localizando o arquivo...';
      Status.Refresh;

      sNomeArquivo := 'SACI_CPD.rar';
      sArquivoDestino := PastaRecep+'\'+sNomeArquivo;
      vExibirStatus := False;
      //if ArquivoFTPExiste(IdFTP1, '', sNomeArquivo) then  // /SACI ou /SACI_T
      //Begin
        vExibirStatus := True;
        Status.Panels[0].Text:='Recebendo o Arquivo...';
        Status.Refresh;
        if FileExists(sArquivoDestino) then
        Begin
          IdFTP1.TransferType := ftBinary;
          BytesToTransfer := IdFTP1.Size(sNomeArquivo);
          iTamanhoArquivo := 0;
          case MessageDlg('Arquivo já existe. '+sNomeArquivo+#13+
                          'Deseja substituir?', mtConfirmation, mbYesNoCancel, 0) of
            mrYes:
              IdFTP1.Get(sNomeArquivo, sArquivoDestino, True);
            mrNo:
            begin
              AssignFile(FArquivo, sArquivoDestino);
              try
                reset(FArquivo);
                iTamanhoArquivo := FileSize(FArquivo);
              finally
                CloseFile(FArquivo);
              end;
              BytesToTransfer := BytesToTransfer;
              IdFTP1.Get(sNomeArquivo, sArquivoDestino, False, True);
            end;
            mrCancel:
            Begin
              Status.Panels[0].Text:='Cancelado';
              Status.Refresh;
              Exit;
            end;
          end;
        end
        else
        Begin
          BytesToTransfer := IdFTP1.Size(sNomeArquivo);
          IdFTP1.Get(sNomeArquivo, sArquivoDestino, True);
        end;
      //end
      //else
        //Raise exception.Create('Arquivo '+sNomeArquivo+' não está disponível!');
    finally
      vExibirStatus := True;
      try
        IdFTP1.Quit;
      except
      end;
      try
        IdFTP1.Disconnect;
      except
      end;
    end;
  end;

  SB_Sair.Caption := 'Sair';
  SB_Sair.Refresh;
  DescomprimirDados(PastaRecep2);
  ImportarDados;


  //Após o recebimento renomear o SACI_CPD para não acusar a existência dele no próximo Receber
  ApagarArquivos(PastaRecep2, '*.DB');
  try
    RenameFile(PastaRecep2+'\SACI_CPD.rar', PastaRecep2+'\SACI_CPD2.rar');
  except
  end;

  MitSairClick(Sender);
end;

procedure TfMxPrincipal.EnviarBackup1Click(Sender: TObject);
begin
  PageControl1.ActivePage:=tbs_Enviar;
  Caption:='TransSACI [Enviar]';
  Enviar(True);
end;

procedure TfMxPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    IdFTP1.Disconnect;
  except
  end;
  Action := caFree;
end;

procedure TfMxPrincipal.FormShow(Sender: TObject);
begin
  {
  if Configuracao1.Empresa <> empEletro then
  Begin
    ckbInternet.Enabled := False;
    ckbInternet.Visible := False;
  end;
  }
  //quanto tive testando
  //ckbInternet.Enabled := true;
  //ckbInternet.Visible := true;
  //
end;

procedure TfMxPrincipal.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Integer);
var
  S: String;
  SS, MM, HH: string;
  TotalTime: TDateTime;
  H, M, Sec, MS: Word;
  DLTime: Double;
begin
  if vExibirStatus then
  Begin
    TotalTime :=  Now - STime;
    DecodeTime(TotalTime, H, M, Sec, MS);
    Sec := Sec + M * 60 + H * 3600;
    DLTime := Sec + MS / 1000;
    if DLTime > 0 then
      AverageSpeed := {(AverageSpeed + }(AWorkCount / 1024) / DLTime{) / 2};

    if AverageSpeed > 0 then begin
      Sec := Trunc(((ProgressBar1.Max - AWorkCount) / 1024) / AverageSpeed);

      //Alan 27-01-06
      S := Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);

      HH := DupeString('0', 2 - Length(floattostr(Sec div 3600)))+floattostr(Sec div 3600);
      MM := DupeString('0', 2 - Length(floattostr((Sec div 60) mod 60)))+floattostr((Sec div 60) mod 60);
      SS := DupeString('0', 2 - Length(floattostr(Sec mod 60)))+floattostr(Sec mod 60);

      //S := 'Tempo: ' + S;
      S := 'Tempo: ' + HH+':'+MM+':'+SS ;
    end
    else
      S := '';


    S := FormatFloat('0.00 KB/s', AverageSpeed) + '; ' + S;
    case AWorkMode of
      wmRead : Status.Panels[1].Text := 'Rec: ' + S;
      wmWrite: Status.Panels[1].Text := 'Env: ' + S;
    end;
    Status.Refresh;
  end;

  Application.ProcessMessages;
  if AbortTransfer then
  Begin
    IdFTP1.Abort;
    Status.Panels[0].Text:='Cancelado';
    Status.Refresh;
    Exit;
  end;

  if (AWorkCount+iTamanhoArquivo) <= ProgressBar1.Max then
    ProgressBar1.Position := (AWorkCount+iTamanhoArquivo)
  else
    ProgressBar1.Position := ProgressBar1.Max;
  AbortTransfer := false;
end;

procedure TfMxPrincipal.IdFTP1WorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Integer);
begin
  TransferrignData := true;
  SB_Sair.Caption := 'Abortar';
  SB_Sair.Refresh;
  AbortTransfer := false;
  STime := Now;
  if AWorkCountMax > 0 then
    ProgressBar1.Max := AWorkCountMax
  else if BytesToTransfer > 0 then
    ProgressBar1.Max := BytesToTransfer;
  AverageSpeed := 0;
end;

procedure TfMxPrincipal.IdFTP1WorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
  SB_Sair.Caption := 'Sair';
  SB_Sair.Refresh;
  BytesToTransfer := 0;
  TransferrignData := false;
  ProgressBar1.Position := 0;
  AverageSpeed := 0;
end;

procedure TfMxPrincipal.IdFTP1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
var
  sIngles, sMensagem: string;
begin
  if vExibirStatus then
  Begin
    sMensagem := '';
    sIngles := AStatusText;
    if (Length(sIngles) >= 14) and
       (Copy(sIngles,1,13) = 'Connecting to') then
      sMensagem := 'Conectando com '+Copy(sIngles,14,Length(sIngles)-13)+' ...'
    else if (sIngles = 'Connected.') then
      sMensagem := 'Conectado.'
    else if (sIngles = 'Connection established') then
      sMensagem := 'Conexão estabelecida.'
    else if (sIngles = 'Starting FTP transfer') then
      sMensagem := 'Iniciando transferência FTP...'
    else if (sIngles = 'Transfer complete') then
      sMensagem := 'Transferência FTP completada.'
    else if (sIngles = 'Disconnecting.') then
      sMensagem := 'Desconectando...'
    else if (sIngles = 'Disconnected.') then
      sMensagem := 'Desconectado.';

    if PageControl1.ActivePage = tbs_Receber then
    Begin
      if sMensagem = '' then
        DebugListBox.ItemIndex := DebugListBox.Items.Add(sIngles)
      else
        DebugListBox.ItemIndex := DebugListBox.Items.Add(sMensagem);
    end
    else if PageControl1.ActivePage = tbs_Enviar then
    Begin
      if sMensagem = '' then
        DebugListBoxEnviar.ItemIndex := DebugListBoxEnviar.Items.Add(sIngles)
      else
        DebugListBoxEnviar.ItemIndex := DebugListBoxEnviar.Items.Add(sMensagem);
    end
    else if PageControl1.ActivePage = tbs_receber_programa then
    Begin
      if sMensagem = '' then
        DebugListBoxRecPrograma.ItemIndex := DebugListBoxRecPrograma.Items.Add(sIngles)
      else
        DebugListBoxRecPrograma.ItemIndex := DebugListBoxRecPrograma.Items.Add(sMensagem);
    end
  end;
//  Status.Panels[1].Text := AStatusText;
end;

procedure TfMxPrincipal.DirectoryListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
//Var
//  R: TRect;
begin
{  if odSelected in State then
  begin
    DirectoryListBox.Canvas.Brush.Color := $00895F0A;
    DirectoryListBox.Canvas.Font.Color := clWhite;
  end
  else
    DirectoryListBox.Canvas.Brush.Color := clWindow;


  if Assigned(IdFTP1.DirectoryListing) and
     (IdFTP1.DirectoryListing.Count > Index) then
  begin
    DirectoryListBox.Canvas.FillRect(Rect);
    with IdFTP1.DirectoryListing.Items[Index] do
    begin
      DirectoryListBox.Canvas.TextOut(Rect.Left, Rect.Top, FileName);
      R := Rect;

      R.Left := Rect.Left + HeaderControl1.Sections.Items[0].Width;
      R.Right := R.Left + HeaderControl1.Sections.Items[1].Width;
      DirectoryListBox.Canvas.FillRect(R);
      DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, IntToStr(Size));

      R.Left := R.Right;
      R.Right := R.Left + HeaderControl1.Sections.Items[2].Width;
      DirectoryListBox.Canvas.FillRect(R);

      if ItemType = ditDirectory then
        DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, 'Directory')
      else
        DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, 'File');

      R.Left := R.Right;
      R.Right := R.Left + HeaderControl1.Sections.Items[3].Width;
      DirectoryListBox.Canvas.FillRect(R);
      DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, FormatDateTime('mm/dd/yyyy hh:mm', ModifiedDate));

      R.Left := R.Right;
      R.Right := R.Left + HeaderControl1.Sections.Items[4].Width;
      DirectoryListBox.Canvas.FillRect(R);
      DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, 'GroupName');

      R.Left := R.Right;
      R.Right := R.Left + HeaderControl1.Sections.Items[5].Width;
      DirectoryListBox.Canvas.FillRect(R);
      DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, 'OwnerName');

      R.Left := R.Right;
      R.Right := R.Left + HeaderControl1.Sections.Items[6].Width;
      DirectoryListBox.Canvas.FillRect(R);
      DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, 'OwnerPermissions + GroupPermissions + UserPermissions');
    end;
  end;
}
end;

procedure TfMxPrincipal.HeaderControl1SectionResize(
  HeaderControl: THeaderControl; Section: THeaderSection);
begin
//  DirectoryListBox.Repaint;
end;

procedure TfMxPrincipal.EnviarArquivoFTP;
var
  arquivo, PastaTransm, sCC, sNomeArquivo, sArquivoOrigem, sPastaMafalda: string;
  conf:TIniFile;
  FArquivo: file of byte;
begin
  DebugListBoxEnviar.Clear;
  DebugListBoxEnviar.Refresh;

  arquivo:=ExtractFilePath(ParamStr(0))+'confEnviaFILIAL.ini';

  if not FileExists(arquivo) then
  Begin
    ShowMessage('Arquivo não encontrado <<'+arquivo+'>>');
    Raise exception.Create('');
  end;

  conf:=TIniFile.Create(arquivo);
  PastaTransm := conf.ReadString('dbDestino', 'PATH', '');
  sCC := PreencheZero(2,conf.ReadString('dbOrigem', 'CC', '0'));
  sFTPHost  := conf.ReadString('internet', 'HOST', '');
  sFTPUsu   := conf.ReadString('internet', 'USUARIO', '');
  sFTPSenha := conf.ReadString('internet', 'SENHA', 'guerra');
  sFTPProxyHost  := conf.ReadString('internet', 'ProxyHOST', '');
  sFTPProxyPorta := conf.ReadString('internet', 'ProxyPORTA', '0');
  sFTPProxyUsu   := conf.ReadString('internet', 'ProxyUSUARIO', '');
  sFTPProxySenha := conf.ReadString('internet', 'ProxySenha', '');
  iCPD := StrToInt(conf.ReadString('Configuracao', 'CPD', '0')); //1 Russas; 2 Aracati; 3 Mafalda; 4 Itapipoca; 5 Luciano
  vMagazine := (conf.ReadString('Configuracao', 'Magazine', '0') = '1'); //0 Eletro; 1 Magazine

  if not DirectoryExists(PastaTransm) then
    Raise exception.Create('Destino não encontrado!');

  SB_Sair.Caption := 'Abortar';
  SB_Sair.Refresh;

  Status.Panels[0].Text:='Conectando com Servidor FTP';
  Status.Refresh;

  IdFTP1.Host := sFTPHost;
  IdFTP1.Username := sFTPUsu;
  IdFTP1.Password := sFTPSenha;

  if sFTPProxyHost <> '' then
  Begin
    IdFTP1.ProxySettings.Host := sFTPProxyHost;
    IdFTP1.ProxySettings.Port := StrToInt(sFTPProxyPorta);
    IdFTP1.ProxySettings.ProxyType := fpcmOpen;
  end
  else
    IdFTP1.ProxySettings.ProxyType := fpcmNone;

  try
    IdFTP1.Connect;
  except
  end;
  try
    if not IdFTP1.Connected then
      Raise exception.Create('Não foi possível conectar com o servidor de FTP!');

    if iCPD = 3 then //Mafalda
      sPastaMafalda := 'MAF'
    else
      sPastaMafalda := '';

    Status.Panels[0].Text:='Conectado. Acessando a Pasta '+sPastaMafalda+'LOJA_'+sCC+' ...';
    Status.Refresh;
    if vMagazine then
      sPastaRaizFTP := 'SACI_T'
    else
      sPastaRaizFTP := 'SACI';

    IdFTP1.ChangeDir(sPastaRaizFTP);
    IdFTP1.ChangeDir(sPastaMafalda+'LOJA_'+sCC);

    sNomeArquivo := 'SACI_FILIAL.rar';
    sArquivoOrigem := PastaTransm+'\SACI_FILIAL.rar';

    Status.Panels[0].Text:='Conectado. Localizando o arquivo...';
    Status.Refresh;

    if not FileExists(sArquivoOrigem) then
      Raise exception.Create('Arquivo '+sArquivoOrigem+' não encontrado!');

    AssignFile(FArquivo, sArquivoOrigem);
    try
      reset(FArquivo);
      BytesToTransfer := FileSize(FArquivo);
    finally
      CloseFile(FArquivo);
    end;
    iTamanhoArquivo := 0;

    Status.Panels[0].Text:='Enviando o Arquivo...';
    Status.Refresh;
    IdFTP1.Put(sArquivoOrigem, sNomeArquivo);

    Status.Panels[0].Text:='Desconectando do Servidor FTP';
    Status.Refresh;
  finally
    try
      IdFTP1.Quit;
    except
    end;
    try
      IdFTP1.Disconnect;
    except
    end;
    Status.Panels[0].Text:='FIM';
    Status.Refresh;
  end;
end;

procedure TfMxPrincipal.EnviarFTP1Click(Sender: TObject);
begin
  AtualizaControles(False);
  PageControl1.ActivePage := tbs_Enviar;
  EnviarArquivoFTP;
  AtualizaControles(True);
end;

procedure TfMxPrincipal.AtualizarPrograma1Click(Sender: TObject);
(*
var
  arquivo, PastaTemporaria: string;
  conf:TIniFile;
  vPastasSistema: array [1..10] of string;
  i: byte;

  FromF, ToF: file of byte;
  Buffer: array[0..4096] of char;
  NumRead: integer;
  FileLength: longint;
  copiou:char;

  fServerName:string;
  local_conf:TInifile;
*)
var
  arquivo: string;
begin
  arquivo := ExtractFilePath(ParamStr(0)) + 'DownloadSACI.exe';
  winExec(PChar(arquivo),SW_NORMAL);
  (*
  copiou:='N';
  AtualizaControles(False);
  PageControl1.ActivePage:=tbs_Receber_Programa;
  Caption := 'TransSACI [Atualizar Programa]';

  PastaTemporaria := 'C:\SACI\TEMP';
  if not DirectoryExists(PastaTemporaria) then
    ForceDirectories(PastaTemporaria);

  //if not DirectoryExists('C:\SACI') then
  //  CreateDir('C:\SACI');
  //if not DirectoryExists(PastaTemporaria) then
  //  CreateDir(PastaTemporaria);

  arquivo := ExtractFilePath(ParamStr(0))+'confRecebeFILIAL.ini';

  //Anderson
  local_conf:=TIniFile.Create(arquivo);
  fServerName := local_conf.ReadString('PastasSistema', 'PASTA01', '');
  local_conf.Free;
  // // // // // //


  if not FileExists(arquivo) then
  Begin
    ShowMessage('Arquivo não encontrado <<'+arquivo+'>>');
    Status.Panels[0].Text := 'Cancelado.';
    Status.Refresh;
    Raise exception.Create('');
  end;

  for i := 1 to 10 do
    vPastasSistema[i] := '';

  conf           := TIniFile.Create(arquivo);
  sFTPHost       := conf.ReadString('internet', 'HOST', '');
  sFTPUsu        := conf.ReadString('internet', 'USUARIO', '');
  sFTPSenha      := conf.ReadString('internet', 'SENHA', 'guerra');
  sFTPProxyHost  := conf.ReadString('internet', 'ProxyHOST', '');
  sFTPProxyPorta := conf.ReadString('internet', 'ProxyPORTA', '0');
  sFTPProxyUsu   := conf.ReadString('internet', 'ProxyUSUARIO', '');
  sFTPProxySenha := conf.ReadString('internet', 'ProxySenha', '');
  iCPD           := StrToInt(conf.ReadString('Configuracao', 'CPD', '0')); //1 Russas; 2 Aracati; 3 Mafalda; 4 Itapipoca; 5 Luciano
  vMagazine      := (conf.ReadString('Configuracao', 'Magazine', '0') = '1'); //0 Eletro; 1 Magazine

  for i := 1 to 10 do
  Begin
    if conf.ReadString('PastasSistema', 'Pasta' + PreencheZero(2,i), '') <> '' then
      vPastasSistema[i] := conf.ReadString('PastasSistema', 'Pasta'+PreencheZero(2,i), '')
    else
      Break;
  end;

  if vPastasSistema[1] = '' then
  Begin
    Status.Panels[0].Text := 'Cancelado.';
    Status.Refresh;
    Raise exception.Create('Pasta de sistema não identificada no arquivo '+arquivo);
  end;

  for i := 1 to 10 do
  Begin
    if vPastasSistema[i] <> '' then
    Begin
      if not DirectoryExists(vPastasSistema[i]) then
      Begin
        Status.Panels[0].Text:='Cancelado.';
        Status.Refresh;
        Raise exception.Create('Pasta de sistema ' + vPastasSistema[i] + ' não está acessível!');
      end;
    end
    else
      Break;
  end;

  if ckbInternet.Checked then
  Begin
    if MessageDlg('ATENÇÃO!!!'+#13+
                  'NÃO é necessário que todos saiam do sistema agora.'+#13+
                  'Deseja atualizar o Sistema?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

    if FileExists(PastaTemporaria+'\PSACI.exe') or
       FileExists(PastaTemporaria+'\PAtualizaSACI.exe') or
       FileExists(PastaTemporaria+'\PIncluirOper.exe') then
      if MessageDlg('Limpar a pasta temporária?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        ApagarArquivos(PastaTemporaria, '*.*');

    SB_Sair.Caption := 'Abortar';
    SB_Sair.Refresh;

    Status.Panels[0].Text:='Conectando com Servidor FTP';
    Status.Refresh;

    IdFTP1.Host     := sFTPHost;
    IdFTP1.Username := sFTPUsu;
    IdFTP1.Password := sFTPSenha;

    if sFTPProxyHost <> '' then
    Begin
      IdFTP1.ProxySettings.Host := sFTPProxyHost;
      IdFTP1.ProxySettings.Port := StrToInt(sFTPProxyPorta);
      IdFTP1.ProxySettings.ProxyType := fpcmOpen;
    end
    else
      IdFTP1.ProxySettings.ProxyType := fpcmNone;

    try
      IdFTP1.Connect;
    except
    end;

    try
      if not IdFTP1.Connected then
      Begin
        Status.Panels[0].Text:='Cancelado.';
        Status.Refresh;
        Raise exception.Create('Não foi possível conectar com o servidor de FTP!');
      end;

      Status.Panels[0].Text:='Conectado. Acessando a Pasta ' + sPastaRaizFTP + ' ...';
      Status.Refresh;

      //IdFTP1.ChangeDir('EmpresaDesenvolvedora');
      //IdFTP1.List(Memo1.Lines,'',False);
      //idFTP1.get('PSACI.exe', 'c:\saci\temp\Psaci.exe', true, false);
      //sPastaRaizFTP := 'SACI'; //Executáveis ficam na pasta SACI para todos os CPD e Eletro ou Magazine
      //Status.Panels[0].Text:='Conectado. Acessando a Pasta '+sPastaRaizFTP+' ...';
      //IdFTP1.ChangeDir(sPastaRaizFTP);
      //Status.Panels[0].Text:='Conectado. Acessando a Pasta CPD ...';
      //Status.Refresh;
      //
      //case iCPD of
      //  1: IdFTP1.ChangeDir('RUSSAS');
      //  2: IdFTP1.ChangeDir('ARACATI');
      //  3: IdFTP1.ChangeDir('MAFALDA');
      //  4: IdFTP1.ChangeDir('ITAPIPOCA');
      //  5: IdFTP1.ChangeDir('LUCIANO');
      //  else
      //    Raise exception.Create('Configuração do CPD inválida!');
      //end;
      //Status.Panels[0].Text:='Conectado. Acessando a Pasta '+sPastaRaizFTP+' ...';
      //Status.Refresh;

      //by anderson
      Status.Panels[0].Text:='Localizando PSACI.exe ...';
      Status.Refresh;
      if not BaixarArquivoFTP('PSACI.exe', PastaTemporaria, 'PSACI.exe') then
      Begin
        Status.Panels[0].Text:='Cancelado.';
        Status.Refresh;
        //Exit;
      end
      else copiou:='S';
      clb_receberPrograma.Checked[0]:=True;

      Status.Panels[0].Text:='Localizando PAtualizaSACI.exe ...';
      Status.Refresh;
      if not BaixarArquivoFTP('PAtualizaSACI.exe', PastaTemporaria, 'PAtualizaSACI.exe') then
      Begin
        Status.Panels[0].Text:='Cancelado.';
        Status.Refresh;
        //Exit;
      end
      else copiou:='S';
      clb_receberPrograma.Checked[1]:=True;

      Status.Panels[0].Text:='Localizando PIncluirOper.exe ...';
      Status.Refresh;
      if not BaixarArquivoFTP('PIncluirOper.exe', PastaTemporaria, 'PIncluirOper.exe') then
      Begin
        Status.Panels[0].Text:='Cancelado.';
        Status.Refresh;
        //Exit;
      end
      else copiou:='S';
      clb_receberPrograma.Checked[2]:=True;

      if copiou='N' then
        exit;
      // // // // // // // // // // // // //

      Status.Panels[0].Text:='Desconectando do Servidor FTP...';
      Status.Refresh;
    finally
      try
        IdFTP1.Quit;
      except
      end;
      try
        IdFTP1.Disconnect;
      except
      end;
    end;
  end;

  Status.Panels[0].Text:='Verificando arquivos...';
  Status.Refresh;
  if not FileExists(PastaTemporaria+'\PSACI.exe') then
  Begin
    Status.Panels[0].Text:='Cancelado.';
    Status.Refresh;
    Raise exception.Create('Arquivo << '+PastaTemporaria+'\PSACI.exe >> não encontrado!');
  end;

  Status.Panels[0].Text:='Substituindo arquivos...';
  Status.Refresh;
  If MessageDlg('Atenção!!!'+#13+
                'Será necesário, agora, que todos saiam do sistema.'+#13+
                'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
  Begin
    Status.Panels[0].Text:='Cancelado.';
    Status.Refresh;
    Exit;
  end;

  try
    for i:=1 to 10 do
    Begin
      if vPastasSistema[i] = '' then
        Break;
      AssignFile(FromF,PastaTemporaria+'\PSACI.exe');
      reset(FromF);
      AssignFile(ToF, vPastasSistema[i]+'\PSACI.exe');
      rewrite(ToF);
      FileLength := FileSize(FromF);
      with Progressbar1 do
      begin
        Min := 0;
        Max := FileLength;
        Position := 0;
        while FileLength > 0 do
        begin
          BlockRead(FromF, Buffer[0], SizeOf(Buffer), NumRead);
          FileLength := FileLength - NumRead;
          BlockWrite(ToF, Buffer[0], NumRead);
          Position := Position + NumRead;
        end;
        CloseFile(FromF);
        CloseFile(ToF);
      end;
    end;
  except
    Status.Panels[0].Text:='Cancelado.';
    Status.Refresh;
    Exit;
  end;
  Progressbar1.Position := 0;
  clb_receberPrograma.Checked[3]:=True;

  //Anderson, Atualizando no servidor
  try
    if fileexists(Pchar(fServerName+'\PSACI.exe')) then
      deletefile(Pchar(fServerName+'\PSACI.exe'));
    CopyFile(Pchar(PastaTemporaria+'\PSACI.exe'),Pchar(fServerName+'\PSACI.exe'),True);

    if fileexists(Pchar(fServerName+'\PAtualizaSACI.exe')) then
      deletefile(Pchar(fServerName+'\PAtualizaSACI.exe'));
    CopyFile(Pchar(PastaTemporaria+'\PAtualizaSACI.exe'),Pchar(fServerName+'\PAtualizaSACI.exe'),True);

    if fileexists(Pchar(fServerName+'\PIncluirOper.exe')) then
      deletefile(Pchar(fServerName+'\PIncluirOper.exe'));
    CopyFile(Pchar(PastaTemporaria+'\PIncluirOper.exe'),Pchar(fServerName+'\PIncluirOper.exe'),True);
  except
  end;
  // // // // // //

  if FileExists(PastaTemporaria+'\PAtualizaSACI.exe') then
  Begin
    Status.Panels[0].Text:='Executando PAtualizaSACI ...';
    Status.Refresh;
    ExecutarEXEAguardando(PastaTemporaria+'\PAtualizaSACI.exe', '');
    clb_receberPrograma.Checked[4]:=True;
  end;

  if FileExists(PastaTemporaria+'\PIncluirOper.exe') then
  Begin
    Status.Panels[0].Text:='Executando PIncluirOper ...';
    Status.Refresh;
    ExecutarEXEAguardando(PastaTemporaria+'\PIncluirOper.exe', '');
    clb_receberPrograma.Checked[5]:=True;
  end;

  SB_Sair.Caption := 'Sair';
  SB_Sair.Refresh;
  Status.Panels[0].Text:='FIM';
  Status.Refresh;

  //Renomear os arquivos utilizados para não serem percebidos na próxima atualização
  ApagarArquivos(PastaTemporaria, 'PSACI2.exe');
  ApagarArquivos(PastaTemporaria, 'PAtualizaSACI2.exe');
  ApagarArquivos(PastaTemporaria, 'PIncluirOper2.exe');
  try
    RenameFile(PastaTemporaria+'\PSACI.exe',PastaTemporaria+'\PSACI2.exe');
  except
  end;
  try
    RenameFile(PastaTemporaria+'\PAtualizaSACI.exe',PastaTemporaria+'\PAtualizaSACI2.exe');
  except
  end;
  try
    RenameFile(PastaTemporaria+'\PIncluirOper.exe',PastaTemporaria+'\PIncluirOper2.exe');
  except
  end;
  ShowMessage('Caso NÃO tenha aparecido nenhum ERRO, então o sistema está atualizado.'+#13+
              'Receba dados antes de entrar no sistema.');
  AtualizaControles(True);
  *)
end;

(*
function TfMxPrincipal.BaixarArquivoFTP(PArquivoFTP,
  PPastaDestino, PArquivoDestino: string): Boolean;
var
  FArquivo: file of byte;
begin
  Result := False;

  iTamanhoArquivo := 0;
  vExibirStatus := False;
  vExibirStatus := True;
  Status.Panels[0].Text:='Recebendo o Arquivo '+PArquivoFTP+' ...';
  Status.Refresh;
  if FileExists(PPastaDestino+'\'+PArquivoDestino) then
  Begin
    IdFTP1.TransferType := ftBinary;
    BytesToTransfer := IdFTP1.Size(PArquivoFTP);
    case MessageDlg('Arquivo já existe << '+PArquivoDestino+' >>.'+#13+
                    'Deseja substituí-lo?', mtConfirmation, mbYesNoCancel, 0) of
      mrYes:
        IdFTP1.Get(PArquivoFTP, PPastaDestino+'\'+PArquivoDestino, True);
      mrNo:
      begin
        AssignFile(FArquivo, PPastaDestino+'\'+PArquivoDestino);
        try
          reset(FArquivo);
          iTamanhoArquivo := FileSize(FArquivo);
        finally
          CloseFile(FArquivo);
        end;
        BytesToTransfer := BytesToTransfer;
        IdFTP1.Get(PArquivoFTP, PPastaDestino+'\'+PArquivoDestino, False, True);
      end;
      mrCancel:
      Begin
        Status.Panels[0].Text:='Cancelado';
        Status.Refresh;
        Exit;
      end;
    end;
  end
  else
  Begin
    BytesToTransfer := IdFTP1.Size(PArquivoFTP);
    IdFTP1.Get(PArquivoFTP, PPastaDestino+'\'+PArquivoDestino, True);
  end;
  vExibirStatus := True;
  Result := True;
end;
*)

procedure TfMxPrincipal.AtualizaControles(Habilitar:Boolean);
Begin
  mitEnviar.Enabled := Habilitar;
  MitReceber.Enabled := Habilitar;
  EnviarFTP1.Enabled := Habilitar;
  AtualizarPrograma1.Enabled := Habilitar;
  SB_Enviar.Enabled := Habilitar;
  SB_Receber.Enabled := Habilitar;
end;

end.
