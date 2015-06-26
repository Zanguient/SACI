 unit CdEnviaComunicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdFTP, StdCtrls, UComunicacao, ComCtrls,
  Buttons, ExtCtrls, DB, DBTables, funcoes, StrUtils, ADODB, Gauges;

type
  TfrmEnviaComunicacao = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    bvLeftControle: TBevel;
    edtDias: TEdit;
    ftpupdate: TIdFTP;
    Status: TStatusBar;
    BitBtn2: TBitBtn;
    btnEnviar: TBitBtn;
    Label3: TLabel;
    edtCNC: TEdit;
    edtCNCNome: TEdit;
    Label6: TLabel;
    edtEmpresa: TEdit;
    cbxFTP: TCheckBox;
    Configuracao1: TADOQuery;
    qComunicacoes: TADOQuery;
    Panel3: TPanel;
    pbRegistros: TGauge;
    procedure btnEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ftpupdateStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure ftpupdateWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Integer);
    procedure ftpupdateWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Integer);
    procedure ftpupdateWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    BytesToTransfer, iTamanhoArquivo: Longint;
    STime: TDateTime;
    procedure Log(sMsg: string; bStatusBar: boolean = true);
  public
    //sListLog: TStringList;
  end;


var
  frmEnviaComunicacao: TfrmEnviaComunicacao;
  AverageSpeed: Double = 0;

implementation

uses UPrincComunicacao, UDM_Comunicacao, u_ListaPedidoPAF;

{$R *.dfm}

procedure TfrmEnviaComunicacao.btnEnviarClick(Sender: TObject);
var
  comunicacao: TEnviaComunicacao;
  gerouArquivo, gerouPAF: boolean;
  FArquivo: file of byte;
  sPrefixo, sArquivoZIP, sPathArquivoZIP: string;
  sList: TStringList;

  procedure ExcluiArquivoFTP(sArquivoDestino: string);
  var
    i:integer;
    //sArqNome, sArqNomeData: string;
  begin
    try
      try

        //indy 10
        {sList:= TStringList.Create;
        ftpupdate.List(sList);
        for i := 0 to sList.Count - 1 do
        begin
          sArqNome := Copy( sList.strings[i], Length(sList.strings[i]) - 28, 10 );

          if Trim(sArqNome) = Trim(Copy(sArquivoDestino,0,10)) then
          begin
            sArqNomeData := Copy( sList.strings[i], Length(sList.strings[i]) - 18, 19 );
            ftpupdate.Delete(Trim(sArqNome + sArqNomeData));
          end;
        end;}
        

        //Indy 9
        ftpupdate.List(nil);
        for i := 0 to ftpupdate.DirectoryListing.Count - 1 do
        begin
          if Copy(ftpupdate.DirectoryListing[i].FileName,0,10) = Copy(sArquivoDestino,0,10) then
            ftpupdate.Delete(ftpupdate.DirectoryListing[i].FileName);
        end;


      finally
        FreeAndNil(sList);
      end;
    except
    end;
  end;

  procedure EnviaArquivo(sArquivoOrigem, sArquivoDestino: string);
  begin
    //TODO
    //ftpupdate.Passive  := false;
    //
    //ftpupdate.Host     := 'ftp.meiasola.com.br';
    //ftpupdate.Username := 'sincronizacao@meiasola.com.br';
    //ftpupdate.Password := 'MS153020';
    //ou
    //ftpupdate.Host     := 'lantech.eti.br';
    //ftpupdate.Username := 'lantech';
    //ftpupdate.Password := 'pipoca0001';

    ftpupdate.Passive  := Configuracao1.FieldByName('CNF_FTP_PASSIVO').AsString = 'S';
    ftpupdate.Host     := Configuracao1.FieldByName('CNF_FTP_URL').AsString;
    ftpupdate.Username := Configuracao1.FieldByName('CNF_FTP_USUARIO').AsString;
    ftpupdate.Password := Configuracao1.FieldByName('CNF_FTP_SENHA').AsString;
    //ftpupdate.Password := Decrypt(Configuracao1.FieldByName('CNF_FTP_SENHA').AsString);

    try
      Log('Conectando...');
      ftpupdate.Connect;
    except
    end;
    try
      if not ftpupdate.Connected then
      begin
        Log('Não foi possível conectar com o servidor de FTP!');
        Raise exception.Create('Não foi possível conectar com o servidor de FTP!');
      end;

      Log('Conectado. Localizando arquivos...');

      if not FileExists(sArquivoOrigem) then
      begin
        Log('Arquivo '+sArquivoOrigem+' não encontrado!');
        Raise exception.Create('Arquivo '+sArquivoOrigem+' não encontrado!');
      end;

      AssignFile(FArquivo, sArquivoOrigem);
      try
        reset(FArquivo);
        BytesToTransfer := FileSize(FArquivo);
      finally
        CloseFile(FArquivo);
      end;
      iTamanhoArquivo := 0;

      try
        Log('Excluindo o Arquivo do FTP...');
        ExcluiArquivoFTP(sArquivoDestino);
      except
      end;

      Log('Enviando o Arquivo para o FTP...');
      ftpupdate.Put(sArquivoOrigem, sArquivoDestino);

      Log('Desconectando do Servidor FTP...');
      Log('Arquivo enviado para o FTP!');
    finally
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

  function subGeraPreRecebimento: boolean;
  var
    bGerandoPreRecebimento, bGerouPreRecebimento, bLogPreRecebimento: boolean;
    Hand1 : HWND;
  begin
    if FileExists('PGeraPre.exe') then
    begin
      Result := False;
      WinExec('PGeraPre.exe',SW_SHOWNORMAL);
      bLogPreRecebimento   := True;
      bGerouPreRecebimento := False;

      while true do
      begin
        if bLogPreRecebimento then
          Log('Gerando pré-recebimento, aguarde!');

        Hand1 := FindWindow('TfMxGeraPre',PChar('Aguarde alguns minutos...'));
        bGerandoPreRecebimento := Hand1 <> 0;

        if bGerandoPreRecebimento then
        begin
          bGerouPreRecebimento := bGerandoPreRecebimento;
          bLogPreRecebimento   := false; //evitando que crie mais de um log para o pré-recebimento
          Continue;
        end
        else
        begin
          Result := bGerouPreRecebimento;
          Break;
        end;
      end;
    end
    else
    begin
      Log('Arquivo PGeraPre.exe não localizado!');
      Result := false;
    end;
  end;

begin
  //sListLog    := TStringList.Create;
  comunicacao := TEnviaComunicacao.Create;
  Log('INICIO...', false);
  Status.Panels[1].Text := '';
  ListBox1.Clear;
  ListBox1.Refresh;

  try

    sPrefixo := qComunicacoes.FieldByName('COM_PREFIXO').AsString;

    if ( qComunicacoes.IsEmpty ) or ( (sPrefixo <> 'AA'(*Teste*)) and (sPrefixo <> 'LO'(*Luciano Ótica*)) and (sPrefixo <> 'AC'(*Água de Cheiro*)) and (sPrefixo <> '01'(*Água de Cheiro - Quixeramobim*)) ) then
    begin
      Log('Empresa não cadastrada para envio de comunicação!');
      Raise Exception.Create('Empresa não cadastrada para envio de comunicação!');
    end;

    (*CPD - Enviando*)
    if DMComunicacao.qCNC.FieldByName('CNC_CODIGO').AsInteger = 1 then
    begin
      if subGeraPreRecebimento then
      begin
        Log('Finalizando pré-recebimento, aguarde: 3');
        Sleep(1000);
        Log('Finalizando pré-recebimento, aguarde: 2');
        Sleep(1000);
        Log('Finalizando pré-recebimento, aguarde: 1');
        Sleep(1000);
        //Foi criado essa pergunta após o pré-recebimento, pq sem essa tela não aparece as informações no ListBox
        //if Application.MessageBox('Pré-Recebimento gerado, deseja enviar a comunicação?',
        //                          'Atenção',
        //                          MB_YESNO + MB_ICONQUESTION) = ID_YES then
        //begin
          gerouArquivo := comunicacao.Exporta_Arquivo_CPD_para_LOJA(DMComunicacao.QSelect,
                                                DMComunicacao.QSelectItem,
                                                pbRegistros,
                                                ListBox1,
                                                sPrefixo,
                                                Status,
                                                sListLog,
                                                sArquivoZIP,
                                                sPathArquivoZIP,
                                                StrToInt(edtDias.Text));
        //end
        //else
        //begin
        //  Log('Gerado o pré-rcebimento, mas não enviado a comunicação!');
        //  if Tag = 0 then
        //    frmPrincComunicacao.sLog.Text := sListLog.Text; //TODO ??
        //  exit;
        //end;
      end
      else
      begin
        Log('Falha ao gerar o pré-recebimento!');
        Raise Exception.Create('Falha ao gerar o pré-recebimento!');
      end;
    end
    (*LOJAS/LABORATÓRIO - Enviando*)
    else
    begin
      gerouPAF := true;
      if PAF_GetPasta <> '' then
        gerouPAF := TfrmListaPedidoPAF.PAF_ImportarExecute(false);

      if gerouPAF then
        gerouArquivo := comunicacao.Exporta_Arquivo_LOJA_para_CPD(DMComunicacao.QSelect,
                                                DMComunicacao.QSelectItem,
                                                pbRegistros,
                                                ListBox1,
                                                sPrefixo,
                                                Status,
                                                sListLog,
                                                sArquivoZIP,
                                                sPathArquivoZIP,
                                                DMComunicacao.qCNC.FieldByName('CNC_CODIGO').AsInteger,
                                                StrToInt(edtDias.Text));
    end;

    if Tag = 0 then
      frmPrincComunicacao.sLog.Text := sListLog.Text;

    if gerouArquivo then
    begin

      if cbxFTP.Checked then
      begin
        ListBox1.Clear;
        //ListBox1.Items.Add('Enviando  ' + sArquivoZIP + '...');
        ListBox1.Items.Add(sArquivoZIP);
        Self.Update;

        EnviaArquivo(sPathArquivoZIP + sArquivoZIP, sArquivoZIP);
      end;

      ListBox1.Clear;
      Application.MessageBox('Fim da comunicação!',
                             'Atenção',
                             MB_ICONINFORMATION);
      Close;
    end
    else
      Log('Falha, não existe movimentação no período selecionado!');

  finally
    Log('FIM.', false);
    FreeAndNil(comunicacao);
    //FreeAndNil(sListLog);
  end;
end;

procedure TfrmEnviaComunicacao.FormCreate(Sender: TObject);
begin
  Configuracao1.Open;
  qComunicacoes.Open;

  if Configuracao1.IsEmpty then
  Begin
    ShowMessage('Não existe registro de Configuração!');
    Raise exception.Create('');
  end;
end;

procedure TfrmEnviaComunicacao.ftpupdateStatus(ASender: TObject;
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
    sMensagem := 'Conexão estabelecida.'
  else if (sIngles = 'Starting FTP transfer') then
    sMensagem := 'Iniciando transferência FTP...'
  else if (sIngles = 'Transfer complete') then
    sMensagem := 'Transferência FTP completada.'
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

procedure TfrmEnviaComunicacao.ftpupdateWork(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Integer);
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

  if AverageSpeed > 0 then begin
    Sec := Trunc(((pbRegistros.MaxValue - AWorkCount) / 1024) / AverageSpeed);

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
  if cbxFTP.Checked then
  begin
    case AWorkMode of
      wmRead : Status.Panels[1].Text := 'Rec: ' + S;
      wmWrite: Status.Panels[1].Text := 'Env: ' + S;
    end;
  end
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

procedure TfrmEnviaComunicacao.ftpupdateWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Integer);
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

procedure TfrmEnviaComunicacao.ftpupdateWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
  //SB_Sair.Caption := 'Sair';
  //SB_Sair.Refresh;
  BytesToTransfer := 0;
  //TransferrignData := false;
  pbRegistros.Progress := 0;
  AverageSpeed := 0;
end;

procedure TfrmEnviaComunicacao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEnviaComunicacao.FormShow(Sender: TObject);
begin
  if qComunicacoes.FieldByName('COM_PREFIXO').AsString = 'LO' then
    edtEmpresa.Text := 'LUCIANO ÓTICA'
  else if qComunicacoes.FieldByName('COM_PREFIXO').AsString = 'AC' then
    edtEmpresa.Text := 'ÁGUA DE CHEIRO'
  else if qComunicacoes.FieldByName('COM_PREFIXO').AsString = '01' then
    edtEmpresa.Text := 'ÁGUA DE CHEIRO - QUIXERAMOBIM'
  else if qComunicacoes.FieldByName('COM_PREFIXO').AsString = 'AA' then
    edtEmpresa.Text := 'TESTE'
  else
    edtEmpresa.Text := '';

  edtCNC.Text     := IntToStr(DMComunicacao.qCNC.FieldByName('CNC_CODIGO').AsInteger);
  edtCNCNome.Text := DMComunicacao.qCNC.FieldByName('CNC_RZ_SOCIAL').AsString;
end;

procedure TfrmEnviaComunicacao.Log(sMsg: string; bStatusBar: boolean = true);
begin
  if bStatusBar then
  begin
    Status.Panels[0].Text := sMsg;
    Status.Refresh;
  end;

  sListLog.Add('Env: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now) + ' - ' + sMsg);

  if tag = 0 then
    frmPrincComunicacao.sLog.Add('Env: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now) + ' - ' + sMsg);
end;

procedure TfrmEnviaComunicacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmEnviaComunicacao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    close;
  if key =#13 then
    btnEnviarClick(btnEnviar);
end;

end.
