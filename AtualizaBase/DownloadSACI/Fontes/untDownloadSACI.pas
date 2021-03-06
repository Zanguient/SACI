unit untDownloadSACI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, IdBaseComponent,
  IdComponent, IdTCPServer, IdFTPServer, IdTCPConnection, IdTCPClient,
  IdFTP,Gauges, IdUDPBase, IdUDPClient, IdTrivialFTP,dateutils,
  Buttons, Menus, inifiles, WinSkinData, funcoes, DB, DBTables, StrUtils;

type
  TfrmDownloadSACI = class(TForm)
    MainMenu1: TMainMenu;
    menuArquivo1: TMenuItem;
    Configurao1: TMenuItem;
    Download1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    SkinData1: TSkinData;
    ftpupdate: TIdFTP;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label4: TLabel;
    bvLeftControle: TBevel;
    btnDownload: TBitBtn;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Database2: TDatabase;
    Configuracao1: TQuery;
    Status: TStatusBar;
    Panel4: TPanel;
    pbRegistros: TGauge;
    procedure ftpupdateWork(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
    procedure ftpupdateWorkBegin(Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
    procedure ftpupdateStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: String);
    procedure ftpupdateWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);

  private
    STime: TDateTime;
    iTamanhoArquivo: Longint;
    function descricao_arquivo(arquivo: string):string;
  public
    BytesToTransfer:longword;
    arqCopia: String;
  end;

var
  frmDownloadSACI: TfrmDownloadSACI;
  AverageSpeed: Double = 0;

implementation

uses untConfiguracao;


{$R *.dfm}

procedure TfrmDownloadSACI.ftpupdateWork(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var
  S: String;
  SS, MM, HH: string;
  TotalTime: TDateTime;
  H, M, Sec, MS: Word;
  DLTime: Double;
begin
  TotalTime :=  Now - STime;
  DecodeTime(TotalTime, H, M, Sec, MS);
  Sec := Sec + M * 60 + H * 3600;
  DLTime := Sec + MS / 1000;
  if DLTime > 0 then
    AverageSpeed := {(AverageSpeed + }(AWorkCount / 1024) / DLTime{) / 2};

  if AverageSpeed > 0 then
  begin
    Sec := Trunc(((pbRegistros.MaxValue - AWorkCount) / 1024) / AverageSpeed);

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
    wmRead : Status.Panels[0].Text := 'Rec: ' + S;
    wmWrite: Status.Panels[0].Text := 'Env: ' + S;
  end;

  if arqCopia <> '' then
    Status.Panels[1].Text := arqCopia + ' Atualizando...'
  else
    Status.Panels[1].Text := '';

  Status.Refresh;

  Application.ProcessMessages;
  {if AbortTransfer then
  Begin
    IdFTP1.Abort;
    Status.Panels[0].Text:='Cancelado';
    Status.Refresh;
    Exit;
  end;}

  if (AWorkCount+iTamanhoArquivo) <= pbRegistros.MaxValue then
    pbRegistros.Progress := (AWorkCount+iTamanhoArquivo)
  else
    pbRegistros.Progress := pbRegistros.MaxValue;
  //AbortTransfer := false;
end;

procedure TfrmDownloadSACI.ftpupdateStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
var
  sIngles, sMensagem: string;
begin

  sMensagem := '';
  sIngles := AStatusText;
  if (Length(sIngles) >= 14) and
     (Copy(sIngles,1,13) = 'Connecting to') then
    sMensagem := 'Conectando com '+Copy(sIngles,14,Length(sIngles)-13)+' ...'
  else if (sIngles = 'Connected.') then
    sMensagem := 'Conectado.'
  else if (sIngles = 'Connection established') then
    sMensagem := 'Conex�o estabelecida.'
  else if (sIngles = 'Starting FTP transfer') then
    sMensagem := 'Iniciando transfer�ncia FTP...'
  else if (sIngles = 'Transfer complete') then
    sMensagem := 'Transfer�ncia FTP completada.'
  else if (sIngles = 'Disconnecting.') then
    sMensagem := 'Desconectando...'
  else if (sIngles = 'Disconnected.') then
    sMensagem := 'Desconectado.';

  {if PageControl1.ActivePage = tbs_Receber then
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
  end;}
//  Status.Panels[1].Text := AStatusText;
end;

procedure TfrmDownloadSACI.ftpupdateWorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
  //SB_Sair.Caption := 'Sair';
  //SB_Sair.Refresh;
  BytesToTransfer := 0;
  //TransferrignData := false;
  pbRegistros.Progress := 0;
  AverageSpeed := 0;
end;

procedure TfrmDownloadSACI.IdTCPClient1Connected(Sender: TObject);
begin
 showmessage('conectado');
end;

procedure TfrmDownloadSACI.FormShow(Sender: TObject);
begin
  BytesToTransfer:=0;
end;

procedure TfrmDownloadSACI.btnDownloadClick(Sender: TObject);
var
  passivo, arquivo1, arquivo2, arquivo3, arquivo4,
  arquivo5, diretorio_sist:string;

  procedure subArquivoPSIAC;
  begin
    try
      if arquivo1 <> '' then
      begin
        arqCopia := descricao_arquivo(arquivo1);
        BytesToTransfer:=ftpupdate.Size(arquivo1);
        ftpupdate.get(arquivo1,diretorio_sist + '\' + descricao_arquivo(arquivo1),true);
        pbRegistros.Progress := 100;
      end;
    except
    end;
  end;

  procedure subArquivoChave;
  begin
    try
      if arquivo2 <> '' then
      begin
        arqCopia := descricao_arquivo(arquivo2);
        BytesToTransfer:=ftpupdate.Size(arquivo2);
        ftpupdate.get(arquivo2,diretorio_sist + '\' + descricao_arquivo(arquivo2),true);
        pbRegistros.Progress := 100;
      end;
    except
    end;
  end;

  function subConecta: boolean;
  begin
    try
      ftpupdate.Connect;
    except
    end;

    if not ftpupdate.Connected then
    begin
      result := false;
      exit;
    end;

    result := ftpupdate.Connected;
  end;

  procedure Desconecta;
  begin
    if ( ftpupdate.Connected ) then
    begin
      try
        ftpupdate.Quit;
      except
      end;
      try
        ftpupdate.Disconnect;
      except
      end;
    end;
  end;

  procedure BaixaArquivos;
  begin
    {ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'AtualizaSistema.ini');

    passivo := ServerIni.ReadString('CONEXAO','PASSIVO','');
    ftpupdate.Host:=ServerIni.ReadString('CONEXAO','FTP','');
    ftpupdate.Username:=ServerIni.ReadString('CONEXAO','USUARIO','');
    ftpupdate.Password:=Decrypt(ServerIni.ReadString('CONEXAO','PASSWD',''));
    arquivo1:=ServerIni.ReadString('CONEXAO','ARQUIVO1','');
    arquivo2:=ServerIni.ReadString('CONEXAO','ARQUIVO2','');
    arquivo3:=ServerIni.ReadString('CONEXAO','ARQUIVO3','');
    arquivo4:=ServerIni.ReadString('CONEXAO','ARQUIVO4','');
    arquivo5:=ServerIni.ReadString('CONEXAO','ARQUIVO5','');
    diretorio_sist:= ExtractFilePath(ParamStr(0)); //ServerIni.ReadString('CONEXAO','SALVARSIST','');
    if passivo='S' then
      ftpupdate.Passive:=true
    else
      ftpupdate.passive:=false;}


    ftpupdate.Host := Configuracao1.FieldByName('CNF_FTP_URL').AsString;
    ftpupdate.Username := Configuracao1.FieldByName('CNF_FTP_USUARIO').AsString;
    //ftpupdate.Password := Decrypt( Configuracao1.FieldByName('CNF_FTP_SENHA').AsString );
    ftpupdate.Password := Configuracao1.FieldByName('CNF_FTP_SENHA').AsString;
    passivo := Configuracao1.FieldByName('CNF_FTP_PASSIVO').AsString;

    if passivo='S' then
      ftpupdate.Passive:=true
    else
      ftpupdate.passive:=false;

    arquivo1 := Configuracao1.FieldByName('CNF_ARQUIVO_PRINCIPAL').AsString;
    arquivo2 := Configuracao1.FieldByName('CNF_ARQUIVO_CHAVE').AsString;
    arquivo3 := '';
    arquivo4 := '';
    arquivo5 := '';
    diretorio_sist := ExtractFilePath(ParamStr(0));


    //ServerIni.Free;

    //ftpupdate.Connect;

    if subConecta then
    begin

      try
        ftpupdate.list(memo1.Lines);

        if RadioGroup1.ItemIndex = 0 then
          subArquivoPSIAC
        else if RadioGroup1.ItemIndex = 1 then
          subArquivoChave
        else if RadioGroup1.ItemIndex = 2 then
        begin
          subArquivoPSIAC;
          subArquivoChave;
        end;

        ftpupdate.Disconnect;


        Application.MessageBox('Fim da atualiza��o!','Aten��o',MB_ICONINFORMATION+MB_OK);
        Application.Terminate;
      finally
        Desconecta;
      end;

    end
    else
      Status.Panels[0].Text := 'N�o foi poss�vel conectar com o servidor de FTP!';
  end;

begin
  {arq := ExtractFilePath(ParamStr(0)) + 'AtualizaSistema.ini';

  if not FileExists(arq) then
  begin
    try
      Application.CreateForm(TfrmConfiguracao, frmConfiguracao);
        frmConfiguracao.frmFrameConfirmarRetornar1lblConfirmarClick(sender);
    finally
      frmConfiguracao.Free;
    end;
  end;}

  if not ftpupdate.Connected then
    BaixaArquivos
  else
    showmessage('J� est� conectado no FTP!');
end;

procedure TfrmDownloadSACI.Sair1Click(Sender: TObject);
begin
  if not ftpupdate.Connected then
  begin
    close;
  end
  else
  begin
    ftpupdate.Disconnect;
    close;
  end;
end;

procedure TfrmDownloadSACI.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

function TfrmDownloadSACI.descricao_arquivo(arquivo: string): string;
var
  i: integer;
  aux: string;
begin
   aux:= '';
   for i:=Length(arquivo) downto 1 do
   begin
      if ( arquivo[i] <> '\' ) and ( arquivo[i] <> '/') then
         aux:= arquivo[i] + aux
      else
         break;
   end;
   result:= aux;
end;

procedure TfrmDownloadSACI.FormCreate(Sender: TObject);
begin
  try
    if not Database2.Connected then
      Database2.Connected:=True;
  except
    ShowMessage('Falha no BDE Administrator!');
    Halt;
  end;

  Configuracao1.Open;

  if Configuracao1.IsEmpty then
  Begin
    ShowMessage('N�o existe registro de Configura��o!');
    Raise exception.Create('');
  end;
end;

procedure TfrmDownloadSACI.ftpupdateWorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  //TransferrignData := true;
  //SB_Sair.Caption := 'Abortar';
  //SB_Sair.Refresh;
  //AbortTransfer := false;
  STime := Now;
  if AWorkCountMax > 0 then
    pbRegistros.MaxValue := AWorkCountMax
  else if BytesToTransfer > 0 then
    pbRegistros.MaxValue := BytesToTransfer;
  AverageSpeed := 0;  
end;

procedure TfrmDownloadSACI.Configurao1Click(Sender: TObject);
var
  sPassivo : string;
begin
  Application.CreateForm(TfrmConfiguracao, frmConfiguracao);

  frmConfiguracao.editftp.Text   := Configuracao1.FieldByName('CNF_FTP_URL').AsString;
  frmConfiguracao.edusuario.Text := Configuracao1.FieldByName('CNF_FTP_USUARIO').AsString;
  frmConfiguracao.edsenha.Text   := Configuracao1.FieldByName('CNF_FTP_SENHA').AsString;

  frmConfiguracao.edarquivo1.Text   := Configuracao1.FieldByName('CNF_ARQUIVO_PRINCIPAL').AsString;
  frmConfiguracao.edarquivo2.Text   := Configuracao1.FieldByName('CNF_ARQUIVO_CHAVE').AsString;

  sPassivo := Configuracao1.FieldByName('CNF_FTP_PASSIVO').AsString;

  if sPassivo = 'S' then
    frmConfiguracao.checkpassivo.Checked := true
  else
    frmConfiguracao.checkpassivo.Checked := false;

  frmConfiguracao.ShowModal;
  frmConfiguracao.Free;

  Configuracao1.Close;
  Configuracao1.Open;
end;

end.
