unit CdRecebeComunicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdFTP, StdCtrls, UComunicacao, ComCtrls, SiacReport_TLB, Inifiles, u_Framework,
  Buttons, ExtCtrls, DB, DBTables, funcoes, StrUtils, ADODB, Gauges;

type
  TfrmRecebeComunicacao = class(TForm)
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    bvLeftControle: TBevel;
    cbxFTP: TCheckBox;
    Panel1: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    btnReceber: TBitBtn;
    BitBtn2: TBitBtn;
    edtCNC: TEdit;
    edtCNCNome: TEdit;
    edtEmpresa: TEdit;
    ftpupdate: TIdFTP;
    Status: TStatusBar;
    Configuracao1: TADOQuery;
    qComunicacoes: TADOQuery;
    qArquivosComunicacao: TADOQuery;
    ListBox2: TListBox;
    ListBox1: TListBox;
    Panel3: TPanel;
    pbRegistros: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure ftpupdateStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure ftpupdateWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Integer);
    procedure ftpupdateWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Integer);
    procedure ftpupdateWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxFTPKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    BytesToTransfer, iTamanhoArquivo: Longint;
    STime: TDateTime;
    procedure Log(sMsg: string; bStatusBar: boolean = true);
    procedure ImportaPAF;
  public
    bReceberAutomatico: boolean;
    class procedure Execute(bAutomatico: boolean; Tempo: TTimer);
  end;

  TThreadComunicacao = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

var
  frmRecebeComunicacao: TfrmRecebeComunicacao;
  AverageSpeed: Double = 0;
  
implementation

uses CdEnviaComunicacao, UPrincComunicacao, UDM_Comunicacao,
  ULogComunicacao, UConfComunicacao, UDM;

{$R *.dfm}

procedure TfrmRecebeComunicacao.FormCreate(Sender: TObject);
begin
  Configuracao1.Open;
  qComunicacoes.Open;
  bReceberAutomatico := false;

  if Configuracao1.IsEmpty then
  Begin
    ShowMessage('Não existe registro de Configuração!');
    Raise exception.Create('');
  end;
end;

procedure TfrmRecebeComunicacao.FormShow(Sender: TObject);
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

procedure TfrmRecebeComunicacao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRecebeComunicacao.btnReceberClick(Sender: TObject);
var
  comunicacao: TRecebeComunicacao;
  sPrefixo, sArquivoZIP, LogSQL, MsgErroSQL: string;
  sList: TStringList;
  i:integer;
  bMostraMsg: boolean;
  ThreadComunicacao: TThreadComunicacao;

  function subConecta: boolean;
  begin
    if cbxFTP.Checked then
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

      if not ftpupdate.Connected then
      begin
        result := false;
        exit;
      end;

      Log('Conectado. Localizando arquivos...');

      result := ftpupdate.Connected;
    end
    else
      result := true;
  end;

  procedure Desconecta;
  begin
    if ( cbxFTP.Checked ) and ( ftpupdate.Connected ) then
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

  function subExisteArquivoNaTabela(sArquivo: string): boolean;
  begin
    qArquivosComunicacao.Close;
    qArquivosComunicacao.SQL.Clear;
    qArquivosComunicacao.SQL.Add('SELECT CMA_ARQUIVO_RECEBIDO FROM COMUNICACOES_ARQUIVOS');
    qArquivosComunicacao.SQL.Add('WHERE CMA_ARQUIVO_RECEBIDO = ''' + sArquivo + '''');
    qArquivosComunicacao.Open;

    result := not qArquivosComunicacao.IsEmpty;
  end;

  procedure subGravaArquivo(sArquivo: string);
  begin
    qArquivosComunicacao.Close;
    qArquivosComunicacao.SQL.Clear;
    qArquivosComunicacao.SQL.Add('INSERT INTO COMUNICACOES_ARQUIVOS (CMA_ARQUIVO_RECEBIDO)');
    qArquivosComunicacao.SQL.Add('VALUES (''' + sArquivo + ''')');
    qArquivosComunicacao.ExecSQL;
  end;

  function ListaArquivos: boolean;
  var
    i: integer;
    sArqNome, sArqNomeData: string;
  begin
    if not cbxFTP.Checked then
      Log('Localizando arquivos....');
    result := false;
    try
      try
        //LOCPD01ELJ
        //LOLJ02ECPD
        sList := TStringList.Create;
        ListBox1.Clear;

        if cbxFTP.Checked then
        begin


          //indy 10
          {ftpupdate.List(sList,'*.ZIP',True);
          for i := 0 to sList.Count - 1 do
          begin
            sArqNome := Copy( sList.strings[i], Length(sList.strings[i]) - 28, 10 );
            sArqNomeData := Copy( sList.strings[i], Length(sList.strings[i]) - 18, 19 );

            if DMComunicacao.qCNC.FieldByName('CNC_CODIGO').AsInteger = 1 then //se for CPD
            begin
              if ( Copy(sArqNome,0,2) = qComunicacoes.FieldByName('COM_PREFIXO').AsString ) and ( Copy(sArqNome,3,2) = 'LJ' ) and ( Copy(sArqNome,7,4) = 'ECPD' ) then
              begin
                if not subExisteArquivoNaTabela(Trim(sArqNome + sArqNomeData)) then
                begin
                  ListBox1.Items.Add(Trim(sArqNome + sArqNomeData));
                  ListBox1.Refresh;
                end;
              end;
            end
            else
            begin
              if ( Copy(sArqNome,0,2) = qComunicacoes.FieldByName('COM_PREFIXO').AsString ) and ( Copy(sArqNome,3,8) = 'CPD01ELJ' ) then
              begin
                if not subExisteArquivoNaTabela(Trim(sArqNome + sArqNomeData)) then
                begin
                  ListBox1.Items.Add(Trim(sArqNome + sArqNomeData));
                  ListBox1.Refresh;
                end;
              end;
            end;
          end}


          //indy 9
          ftpupdate.List(nil);
          for i := 0 to ftpupdate.DirectoryListing.Count - 1 do
          begin
            if DMComunicacao.qCNC.FieldByName('CNC_CODIGO').AsInteger = 1 then //se for CPD
            begin
              if ( Copy(ftpupdate.DirectoryListing[i].FileName,0,2) = qComunicacoes.FieldByName('COM_PREFIXO').AsString ) and
                 ( Copy(ftpupdate.DirectoryListing[i].FileName,3,2) = 'LJ' )                                              and
                 ( Copy(ftpupdate.DirectoryListing[i].FileName,7,4) = 'ECPD' )                                            then
              begin
                if not subExisteArquivoNaTabela(Trim(ftpupdate.DirectoryListing[i].FileName)) then
                begin
                  ListBox1.Items.Add(Trim(ftpupdate.DirectoryListing[i].FileName));
                  ListBox1.Refresh;
                end;
              end;
            end
            else
            begin
              if ( Copy(ftpupdate.DirectoryListing[i].FileName,0,2) = qComunicacoes.FieldByName('COM_PREFIXO').AsString ) and
                 ( Copy(ftpupdate.DirectoryListing[i].FileName,3,8) = 'CPD01ELJ' )                                        then
              begin
                if not subExisteArquivoNaTabela(Trim(ftpupdate.DirectoryListing[i].FileName)) then
                begin
                  ListBox1.Items.Add(Trim(ftpupdate.DirectoryListing[i].FileName));
                  ListBox1.Refresh;
                end;
              end;
            end;
          end


        end
        else
        begin
          {se não estiver marcado a opção de FTP}
          ListArquivos(comunicacao.PastaRecebe,'*',sList);
          for i := 0 to sList.Count - 1 do
          begin
            //Comunicação\Recebe\ACCPD01ELJ_16052012144955.ZIP
            sArqNome := Copy( sList.strings[i], 20, 10 );
            sArqNomeData := Copy( sList.strings[i], 30, 19 );
            if DMComunicacao.qCNC.FieldByName('CNC_CODIGO').AsInteger = 1 then //se for CPD
            begin
              if ( Copy(sArqNome,0,2) = qComunicacoes.FieldByName('COM_PREFIXO').AsString ) and ( Copy(sArqNome,3,2) = 'LJ' ) and ( Copy(sArqNome,7,4) = 'ECPD' ) then
              begin
                if not subExisteArquivoNaTabela(Trim(sArqNome + sArqNomeData)) then
                begin
                  ListBox1.Items.Add(Trim(sArqNome + sArqNomeData));
                  ListBox1.Refresh;
                end;
              end
            end
            else
            begin
              if ( Copy(sArqNome,0,2) = qComunicacoes.FieldByName('COM_PREFIXO').AsString ) and ( Copy(sArqNome,3,8) = 'CPD01ELJ' ) then
              begin
                if not subExisteArquivoNaTabela(Trim(sArqNome + sArqNomeData)) then
                begin
                  ListBox1.Items.Add(Trim(sArqNome + sArqNomeData));
                  ListBox1.Refresh;
                end;
              end;
            end;
          end;
        end;

        result := ListBox1.Items.Count > 0;
      finally
        FreeAndNil(sList);
      end;
    except
    end;
  end;

  procedure RecebeArquivo(sArquivoOrigem, sArquivoDestino: string);
  begin
    BytesToTransfer := ftpupdate.Size(sArquivoOrigem);
    iTamanhoArquivo := 0;
    Log('Salvando o Arquivo do FTP...');
    ftpupdate.Get(sArquivoOrigem, sArquivoDestino);
  end;

begin
  Log('INICIO...', false);
  bMostraMsg := true;
  Status.Panels[1].Text := '';
  ListBox1.Clear;
  ListBox2.Clear;
  ListBox1.Refresh;
  ListBox2.Refresh;

  sPrefixo := qComunicacoes.FieldByName('COM_PREFIXO').AsString;
  if ( qComunicacoes.IsEmpty ) or ( (sPrefixo <> 'AA'(*Teste*)) and (sPrefixo <> 'LO'(*Luciano Ótica*)) and (sPrefixo <> 'AC'(*Água de Cheiro*)) and (sPrefixo <> '01'(*Água de Cheiro - Quixeramobim*)) ) then
  begin
    Log('Empresa não cadastrada para comunicação!');
    exit;
  end;

  if subConecta then
  begin
    comunicacao := TRecebeComunicacao.Create;
    try
      if ListaArquivos then
      begin

        if cbxFTP.Checked then
          ExcluiArquivos(comunicacao.PastaRecebe,'*');
        for i := 0 to ListBox1.Count - 1 do
        begin
          ListBox1.ItemIndex := i;
          sArquivoZIP := ListBox1.Items[i];

          if cbxFTP.Checked then
          begin
            Log('Recebendo arquivo ' + ListBox1.Items[i] + '...');
            RecebeArquivo(sArquivoZIP, comunicacao.PastaRecebe + sArquivoZIP);
          end;

          try
            (*CPD - Recebendo*)
            if DMComunicacao.qCNC.FieldByName('CNC_CODIGO').AsInteger = 1 then
            begin
              if comunicacao.Importa_Arquivo_LOJA_para_CPD(sArquivoZIP,
                                                           pbRegistros,
                                                           Status,
                                                           sListLog,
                                                           DMComunicacao.QSelect,
                                                           DMComunicacao.QExec,
                                                           ListBox2,
                                                           LogSQL) then
                subGravaArquivo(sArquivoZIP);
            end
            (*LOJAS/LABORATÓRIO - Recebendo*)
            else
            begin
              if comunicacao.Importa_Arquivo_CPD_para_LOJA(sArquivoZIP,
                                                           pbRegistros,
                                                           Status,
                                                           sListLog,
                                                           DMComunicacao.QSelect,
                                                           DMComunicacao.QExec,
                                                           ListBox2,
                                                           LogSQL) then
              begin
                subGravaArquivo(sArquivoZIP);

                //Não chama por causa dos try finally
                //Só funcionou com a Thread
                if frmRecebeComunicacao.Visible then
                begin
                  if PAF_GetPasta <> '' then
                  begin
                    bMostraMsg := false;
                    ThreadComunicacao := TThreadComunicacao.Create(true);
                    ThreadComunicacao.FreeOnTerminate := true;
                    ThreadComunicacao.Resume;
                  end;
                end;

              end;
            end;

          except on e: Exception do
            begin
              MsgErroSQL := 'A T E N Ç Ã O: '+#13+#13+'Erro ao atualizar registro: ' +#13 + LogSQL;
              Log(MsgErroSQL);
              Raise Exception.Create(MsgErroSQL);
            end;
          end;

          if Tag = 0 then
            frmPrincComunicacao.sLog.Text := sListLog.Text;
        end;

        if cbxFTP.Checked then
          Log('Desconectando do Servidor de FTP...');

        Log('Comunicação realizada com sucesso!');
        if frmRecebeComunicacao.Visible then //if not bReceberAutomatico then
        begin
          if bMostraMsg then
            Application.MessageBox('Comunicação realizada com sucesso!','Atenção',MB_ICONINFORMATION + MB_OK);

          Close;
        end;
      end
      else
        Log('Arquivo não localizado!');
    finally
      Desconecta;
      FreeAndNil(comunicacao);
      //if Assigned(sListLog) then
        //FreeAndNil(sListLog);
    end;
  end
  else
  begin
    Log('Não foi possível conectar com o servidor de FTP!');
  end;
  Log('FIM.', false);
end;

procedure TfrmRecebeComunicacao.ftpupdateStatus(ASender: TObject;
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

procedure TfrmRecebeComunicacao.ftpupdateWork(ASender: TObject;
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

procedure TfrmRecebeComunicacao.ftpupdateWorkBegin(ASender: TObject;
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

procedure TfrmRecebeComunicacao.ftpupdateWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
  //SB_Sair.Caption := 'Sair';
  //SB_Sair.Refresh;
  BytesToTransfer := 0;
  //TransferrignData := false;
  pbRegistros.Progress := 0;
  AverageSpeed := 0;
end;

class procedure TfrmRecebeComunicacao.Execute(bAutomatico: boolean; Tempo: TTimer);
begin
  if ( not Assigned(frmRecebeComunicacao) ) and ( not Assigned(frmEnviaComunicacao) ) and
     ( not Assigned(frmLogComunicacao) )    and ( not Assigned(frmConfComunicacao) )  then
  begin

    if Tempo <> nil then
      Tempo.Enabled := false;

    Application.CreateForm(TfrmRecebeComunicacao, frmRecebeComunicacao);
    try
      frmRecebeComunicacao.bReceberAutomatico := bAutomatico;
      frmRecebeComunicacao.Tag := 0; //PComunicacao.exe
      frmRecebeComunicacao.ShowModal;
    finally
      FreeAndNil(frmRecebeComunicacao);
    end;

    if Tempo <> nil then
      Tempo.Enabled := true;
  end;
end;

procedure TfrmRecebeComunicacao.FormActivate(Sender: TObject);
begin
  if bReceberAutomatico then
  begin
    self.Visible := false;
    self.Update;
    btnReceber.Click;
    PostMessage(Handle, WM_CLOSE, 0, 0);//fecha o formulário no FormActivate, não adicionar nenhuma linha depois
  end;
end;

procedure TfrmRecebeComunicacao.Log(sMsg: string; bStatusBar: boolean = true);
begin
  if bStatusBar then
  begin
    Status.Panels[0].Text := sMsg;
    Status.Refresh;
  end;

  sListLog.Add('Rec: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now) + ' - ' + sMsg);

  if tag = 0 then
    frmPrincComunicacao.sLog.Add('Rec: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now) + ' - ' + sMsg);
end;

procedure TfrmRecebeComunicacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRecebeComunicacao.cbxFTPKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    close;
end;

procedure TfrmRecebeComunicacao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    close;
  if key =#13 then
    btnReceberClick(btnReceber);
end;

procedure TfrmRecebeComunicacao.ImportaPAF;
//var
//  stiReport: CoSiacReport_;
//  sBanco : WideString;
//  Inifile : TIniFile;
begin
//  IniFile := TIniFile.create(PAF_GetPasta + '\small.ini');
//  sBanco := IniFile.ReadString('Firebird','Server IP','')+';Database='+IniFile.ReadString('Firebird','Server URL','')+'\small.gdb; UserId=SYSDBA; password=masterkey';
//  IniFile.Free;

//  if ( NetFramework_v4 ) and ( FileExists('SiacReport.dll') ) then
//    stiReport.Create.PAF_Export(sBanco, DM.Configuracao1.Empresa, DM.Configuracao1.CodigoCNC, true)
//  else
//    showmessage('Arquivo ''SiacReport.dll'' não localizado e/ou Framework 4.0 não instalado!');
end;

{ TThreadComunicacao }

procedure TThreadComunicacao.Execute;
var
  stiReport: CoSiacReport_;
  sBanco : WideString;
  Inifile : TIniFile;
begin
  IniFile := TIniFile.create(PAF_GetPasta + '\small.ini');
  sBanco := IniFile.ReadString('Firebird','Server IP','')+';Database='+IniFile.ReadString('Firebird','Server URL','')+'\small.gdb; UserId=SYSDBA; password=masterkey';
  IniFile.Free;

  if ( NetFramework_v4 ) and ( FileExists('SiacReport.dll') ) then
    stiReport.Create.PAF_Export(sBanco, DM.Configuracao1.Empresa, DM.Configuracao1.CodigoCNC, true, 'Comunicação realizada com sucesso!')
  else
    showmessage('Arquivo ''SiacReport.dll'' não localizado e/ou Framework 4.0 não instalado!');
end;

end.
