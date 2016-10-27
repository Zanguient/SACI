unit uLivroOcorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, StdCtrls, ExtCtrls, IdMessage, ShellAPI, Buttons,
  Mask, DB, ADODB, StrUtils, uVariaveis;

type
  TfrmOcorrencia = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    mmMensagem: TMemo;
    Label1: TLabel;
    odAnexos: TOpenDialog;
    mmAnexos: TMemo;
    btnAnexar: TBitBtn;
    btnLimpar: TBitBtn;
    btnSalvar: TBitBtn;
    Label3: TLabel;
    edtData: TLabel;
    medtData: TMaskEdit;
    Label4: TLabel;
    medtHora: TMaskEdit;
    ConnectionLagoa: TADOConnection;
    InsertOcorrencia: TADOQuery;
    btnSair: TBitBtn;
    cbxEmail: TCheckBox;
    Label5: TLabel;
    edtPorteiro: TEdit;
    cbxImportante: TCheckBox;
    procedure btnLimparClick(Sender: TObject);
    procedure btnAnexarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure EnviaEmail;
    function VerificaData(Data:String):Boolean;
    { Private declarations }
  public
    { Public declarations }
    sPorteiro: string;
  end;

var
  frmOcorrencia: TfrmOcorrencia;

implementation

uses uMenu;


{$R *.dfm}

//Provider=SQLOLEDB.1;Password=agfm1901;Persist Security Info=True;User ID=lagoa;Initial Catalog=buildsis_lagoa;Data Source=70.38.11.27;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=FONTESD7-VM;Use Encryption for Data=False;Tag with column collation when possible=False

procedure TfrmOcorrencia.btnLimparClick(Sender: TObject);
begin
  mmAnexos.Clear;
end;

procedure TfrmOcorrencia.btnAnexarClick(Sender: TObject);
begin
  if odAnexos.Execute Then
    mmAnexos.Lines.Add(odAnexos.FileName);
end;

procedure TfrmOcorrencia.EnviaEmail;
var
  i: integer;
  msgOcorrencia: string;
const
  cImportante = ' (IMPORTANTE)';
begin
  IdSMTP1.Port               := 25;
  IdSMTP1.Host               := 'aspmx.l.google.com'; //aspmx.l.google.com ou smtp.gmail.com
  IdSMTP1.Username           := 'admlagoajoqueiville@gmail.com';
  IdSMTP1.Password           := '17072007';
  IdSMTP1.AuthenticationType := atLogin; //atNone;

  //Prioridade alta
  IdMessage1.Priority := mpLow;
  //'Email_originário_da_mensagem';
  IdMessage1.From.Address := 'admlagoajoqueiville@gmail.com';
  //'Email_do_destinatario_da_mensagem';
  IdMessage1.Recipients.EMailAddresses := 'anndersonn.gonncalves@gmail.com'; //'seu_mail_aqui';
  //O assunto da mensagem
  IdMessage1.Subject :='Livro de ocorrência';
  //conteudo da mensagem
  msgOcorrencia := 'Porteiro: ' + edtPorteiro.Text + IfThen(cbxImportante.checked, cImportante, '') + #13 +
                   'Data: ' + medtData.Text + #13 +
                   'Hora: ' + medtHora.Text + #13 + #13 +
                   mmMensagem.Text;
  IdMessage1.Body.Add(msgOcorrencia);

  //Tratando os arquivos anexos
  for i := 0 to mmAnexos.Lines.Count-1 do
    TIdAttachment.create(Idmessage1.MessageParts, TFileName(mmAnexos.Lines.Strings[i]));

  try
    IdSMTP1.Connect;
    IdSMTP1.Send(IdMessage1);
  finally
    IdSMTP1.Disconnect;
  end;
end;

procedure TfrmOcorrencia.btnSalvarClick(Sender: TObject);
begin
  {if cbxPorteiro.Text = '' then
  begin
    cbxPorteiro.SetFocus;
    raise Exception.Create('Informe o nome do porteiro!');
  end;}

  if (medtData.Text = '  /  /    ') or not (VerificaData(medtData.Text)) then
  begin
    medtData.SetFocus;
    Raise Exception.Create('Data inválida!');
  end;

  if medtHora.Text = '  :  ' then
  begin
    medtHora.SetFocus;
    raise Exception.Create('Informe a hora da ocorrência!');
  end;

  if mmMensagem.Text = '' then
  begin
    mmMensagem.SetFocus;
    raise Exception.Create('Informe a mensagem da ocorrência!');
  end;

  if Application.MessageBox('Confirma as informações digitadas?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
  begin

    try
      Screen.Cursor := crHourGlass;

      ConnectionLagoa.Connected := True;
      InsertOcorrencia.Close;
      InsertOcorrencia.Parameters.ParamByName('PORTEIRO').Value       := edtPorteiro.Text;
      InsertOcorrencia.Parameters.ParamByName('DATA').Value           := now;
      InsertOcorrencia.Parameters.ParamByName('DATAOCORRENCIA').Value := StrToDateTime(medtData.Text + ' ' + medtHora.Text);
      InsertOcorrencia.Parameters.ParamByName('OCORRENCIA').Value     := mmMensagem.Text;
      if cbxImportante.Checked then
        InsertOcorrencia.Parameters.ParamByName('IMPORTANTE').Value   := 'S'
      else
        InsertOcorrencia.Parameters.ParamByName('IMPORTANTE').Value   := 'N';


      InsertOcorrencia.ExecSQL;

      if cbxEmail.Checked then
        EnviaEmail;
    finally
      Screen.Cursor := crDefault;
      ConnectionLagoa.Connected := False;
    end;

    Application.MessageBox('Ocorrência salva com sucesso!', 'Confirmação', MB_ICONINFORMATION + MB_OK);

    mmMensagem.Clear;
    mmAnexos.Clear;
    medtHora.Clear;
    cbxImportante.Checked := false;
    medtHora.SetFocus;
  end;
end;

procedure TfrmOcorrencia.FormShow(Sender: TObject);
begin
  mmMensagem.Clear;
  mmAnexos.Clear;
  medtData.Text := DateToStr(now);
  edtPorteiro.Text := NomeUsuarioLogado;
  medtData.SetFocus;
end;

procedure TfrmOcorrencia.btnSairClick(Sender: TObject);
begin
  Close;
end;

function TfrmOcorrencia.VerificaData(Data: String): Boolean;
begin
  Result:=True;
   Try
     if (Data<>'  /  /    ') and (Data<>'') and (Data<>'  /  /       :  ') then
       if StrToDateTime(Data) < 01/01/1899 then
         Result := False;
   Except
      Result:=False;
   End;
end;

procedure TfrmOcorrencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   btnSalvarClick(btnSalvar);

  if key =#27 then
    close;
end;

end.

