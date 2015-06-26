(*
CREATE TABLE TB_CLIENTES (
	NOME VARCHAR(150) NOT NULL,
	CNPJ VARCHAR(20) NOT NULL,
	ENVIAR CHAR(1)
);
ALTER TABLE TB_CLIENTES ADD PRIMARY KEY (CNPJ);
*)

unit untUploadSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ImgList, DB,
  DBTables, math, ADODB, ComCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, Gauges, funcoes, StrUtils, Menus;

type
  TfrmUploadSistema = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtCNPJ: TEdit;
    SB_Salva: TBitBtn;
    DBGrid1: TDBGrid;
    ImTicado: TImageList;
    dsClientes: TDataSource;
    qClientes: TADOQuery;
    qSelect: TADOQuery;
    qClientesNOME: TStringField;
    qClientesCNPJ: TStringField;
    qClientesENVIAR: TStringField;
    qExec: TADOQuery;
    ftpupdate: TIdFTP;
    Configuracao1: TADOQuery;
    Status: TStatusBar;
    Panel1: TPanel;
    pbRegistros: TGauge;
    Panel4: TPanel;
    SB_FinalizarPedido: TBitBtn;
    SB_FecharPedido: TBitBtn;
    rbSistema: TRadioButton;
    rbChave: TRadioButton;
    rbAmbos: TRadioButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Configurao1: TMenuItem;
    procedure SB_FecharPedidoClick(Sender: TObject);
    procedure SB_FinalizarPedidoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Ticar(bEnviar: boolean);
    procedure AtivaTabela;
    procedure SB_SalvaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ftpupdateWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure ftpupdateStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure ftpupdateWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure ftpupdateWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure Configurao1Click(Sender: TObject);
  private
    STime: TDateTime;
    BytesToTransfer, iTamanhoArquivo: Longint;
    procedure Log(sMsg: string; bStatusBar: boolean = true);
  public
    { Public declarations }
  end;

var
  frmUploadSistema: TfrmUploadSistema;
  AverageSpeed: Double = 0;
  NOME_ARQUIVO_CHAVE : string;
  NOME_ARQUIVO_PRINCIPAL : string;

implementation

uses UDM_Comunicacao, untConfiguracao;

{$R *.dfm}

procedure TfrmUploadSistema.SB_FecharPedidoClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUploadSistema.SB_FinalizarPedidoClick(Sender: TObject);
var
  sList: TStringList;
  ArquivoDestino: string;

  procedure ExcluiArquivoFTP(sArquivoDestino: string);
  var
    i:integer;
  begin
    try
      try
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

  procedure EnviaArquivoPrincipal(ArquivoOrigem: string);
  begin
    if not FileExists(ArquivoOrigem) then
    begin
      Log('Arquivo '+ArquivoOrigem+' não encontrado!');
      Raise exception.Create('Arquivo '+ArquivoOrigem+' não encontrado!');
    end;

    try
      Log('Excluindo o Arquivo (' + NOME_ARQUIVO_PRINCIPAL + ') do FTP...');
      ExcluiArquivoFTP(NOME_ARQUIVO_PRINCIPAL);
    except
    end;

    Log('Enviando o Arquivo para o FTP(' + NOME_ARQUIVO_PRINCIPAL + ')...');
    ftpupdate.Put(ArquivoOrigem, NOME_ARQUIVO_PRINCIPAL);
  end;

  procedure EnviaArquivoChave(ArquivoOrigem: string);
  begin
    if not FileExists(ArquivoOrigem) then
    begin
      Log('Arquivo '+ArquivoOrigem+' não encontrado!');
      Raise exception.Create('Arquivo '+ArquivoOrigem+' não encontrado!');
    end;

    qClientes.First;
    while not qClientes.Eof do
    begin
      if qClientes.FieldByName('ENVIAR').AsString = 'S' then
      begin
        ArquivoDestino := qClientes.FieldByName('CNPJ').AsString + '\' + NOME_ARQUIVO_CHAVE;
        try
          Log('Excluindo o Arquivo (' + ArquivoDestino + ') do FTP...');
          ExcluiArquivoFTP(ArquivoDestino);
        except
        end;

        Log('Enviando o Arquivo para o FTP(' + ArquivoDestino + ')...');
        ftpupdate.Put(ArquivoOrigem, ArquivoDestino);
      end;
      qClientes.Next;
    end;
  end;

begin
  ftpupdate.Passive  := Configuracao1.FieldByName('CNF_FTP_PASSIVO').AsString = 'S';
  ftpupdate.Host     := Configuracao1.FieldByName('CNF_FTP_URL').AsString;
  ftpupdate.Username := Configuracao1.FieldByName('CNF_FTP_USUARIO').AsString;
  ftpupdate.Password := Configuracao1.FieldByName('CNF_FTP_SENHA').AsString;

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

    if (rbAmbos.Checked) or (rbChave.Checked) then
      EnviaArquivoChave(NOME_ARQUIVO_CHAVE);

    if (rbAmbos.Checked) or (rbSistema.Checked) then
      EnviaArquivoPrincipal(NOME_ARQUIVO_PRINCIPAL);

    Log('Desconectando do Servidor FTP...');
    Log('Arquivo enviado para o FTP!');

    showmessage('Fim da atualização!');

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

procedure TfrmUploadSistema.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Image1: integer;
begin
  if Column.FieldName = 'ENVIAR' then
  begin
    if ( Column.Field.AsString = 'S' ) then
      Image1 := 1
    else
      Image1 := 0;

    DBGrid1.Canvas.FillRect(Rect);
    ImTicado.Draw(DBGrid1.Canvas, Trunc( (Rect.Right) div 4 ), Rect.Top + 1, Image1);
  end;
end;

procedure TfrmUploadSistema.DBGrid1CellClick(Column: TColumn);
var
  posicao: TBookmark;
  bTicar: boolean;
begin
  if Column.FieldName = 'ENVIAR' then
  begin
    posicao := qClientes.GetBookmark;
    try
      bTicar := qClientes.FieldByName('ENVIAR').AsString <> 'S';
      Ticar(bTicar);
      AtivaTabela;
      qClientes.GotoBookmark(posicao);
    finally
      qClientes.FreeBookmark(posicao);
    end;
  end;
end;

procedure TfrmUploadSistema.Ticar(bEnviar: boolean);
var
  sEnviar: string;
begin
  if bEnviar then
    sEnviar := 'S'
  else
    sEnviar := 'N';

  qExec.Close;
  qExec.SQL.Clear;
  qExec.SQL.Add('UPDATE TB_CLIENTES SET ENVIAR = ''' + sEnviar + '''');
  qExec.SQL.Add('WHERE CNPJ = ''' + qClientes.FieldByName('CNPJ').AsString + '''');
  qExec.ExecSQL
end;

procedure TfrmUploadSistema.AtivaTabela;
begin
  qClientes.Close;
  qClientes.Open;
end;

procedure TfrmUploadSistema.SB_SalvaClick(Sender: TObject);
begin
  qSelect.Close;
  qSelect.SQL.Clear;
  qSelect.SQL.Text := 'SELECT * FROM TB_CLIENTES WHERE CNPJ = ''' + edtCNPJ.Text + '''';
  qSelect.Open;
  if qSelect.IsEmpty then
  begin
    qExec.Close;
    qExec.SQL.Text := 'INSERT INTO TB_CLIENTES (NOME, CNPJ, ENVIAR) VALUES (''' + edtNome.text + ''', ''' + edtCNPJ.Text + ''',''S'')';
    qExec.ExecSQL;
  end
  else
  begin
    qExec.Close;
    qExec.SQL.Text := 'UPDATE TB_CLIENTES SET NOME = ''' + edtNome.text + ''' WHERE CNPJ = ''' + edtCNPJ.Text + '''';
    qExec.ExecSQL;
  end;
  qClientes.Close;
  qClientes.Open;
end;

procedure TfrmUploadSistema.FormShow(Sender: TObject);
begin
  NOME_ARQUIVO_CHAVE     := Configuracao1.FieldByName('CNF_ARQUIVO_CHAVE').AsString;
  NOME_ARQUIVO_PRINCIPAL := Configuracao1.FieldByName('CNF_ARQUIVO_PRINCIPAL').AsString;
  
  AtivaTabela;
end;

procedure TfrmUploadSistema.FormCreate(Sender: TObject);
begin
  Configuracao1.Open;
end;

procedure TfrmUploadSistema.Log(sMsg: string; bStatusBar: boolean);
begin
  if bStatusBar then
  begin
    Status.Panels[0].Text := sMsg;
    Status.Refresh;
  end;
end;

procedure TfrmUploadSistema.ftpupdateWork(Sender: TObject;
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

  Application.ProcessMessages;
  if (AWorkCount+iTamanhoArquivo) <= pbRegistros.MaxValue then
    pbRegistros.Progress := (AWorkCount+iTamanhoArquivo)
  else
    pbRegistros.Progress := pbRegistros.MaxValue;
end;

procedure TfrmUploadSistema.ftpupdateStatus(ASender: TObject;
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
end;

procedure TfrmUploadSistema.ftpupdateWorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  STime := Now;
  if AWorkCountMax > 0 then
    pbRegistros.MaxValue := AWorkCountMax
  else if BytesToTransfer > 0 then
    pbRegistros.MaxValue := BytesToTransfer;
  AverageSpeed := 0;
end;

procedure TfrmUploadSistema.ftpupdateWorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
  BytesToTransfer := 0;
  pbRegistros.Progress := 0;
  AverageSpeed := 0;
end;

procedure TfrmUploadSistema.Configurao1Click(Sender: TObject);
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
