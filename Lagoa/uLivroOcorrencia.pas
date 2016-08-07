unit uLivroOcorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, StdCtrls, ExtCtrls, IdMessage, ShellAPI, Buttons,
  Mask, DB, ADODB;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    mmMensagem: TMemo;
    Label1: TLabel;
    odAnexos: TOpenDialog;
    Label2: TLabel;
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
    cbxPorteiro: TComboBox;
    Label6: TLabel;
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
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Provider=SQLOLEDB.1;Password=agfm1901;Persist Security Info=True;User ID=lagoa;Initial Catalog=buildsis_lagoa;Data Source=70.38.11.27;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=FONTESD7-VM;Use Encryption for Data=False;Tag with column collation when possible=False

procedure TForm1.btnLimparClick(Sender: TObject);
begin
  mmAnexos.Clear;
end;

procedure TForm1.btnAnexarClick(Sender: TObject);
begin
  if odAnexos.Execute Then
    mmAnexos.Lines.Add(odAnexos.FileName);
end;

procedure TForm1.EnviaEmail;
var
  i: integer;
  msgOcorrencia: string;

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
  msgOcorrencia := 'Porteiro: ' + cbxPorteiro.Text + #13 +
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

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
  if cbxPorteiro.Text = '' then
  begin
    cbxPorteiro.SetFocus;
    raise Exception.Create('Informe o nome do porteiro!');
  end;

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
      InsertOcorrencia.Parameters.ParamByName('PORTEIRO').Value       := cbxPorteiro.Text;
      InsertOcorrencia.Parameters.ParamByName('DATA').Value           := now;
      InsertOcorrencia.Parameters.ParamByName('DATAOCORRENCIA').Value := StrToDateTime(medtData.Text + ' ' + medtHora.Text);
      InsertOcorrencia.Parameters.ParamByName('OCORRENCIA').Value     := mmMensagem.Text;
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
    medtHora.SetFocus;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  ArquivoPorteiro: string;
begin
  mmMensagem.Clear;
  mmAnexos.Clear;

  ArquivoPorteiro := 'C:\Porteiros.txt';

  if FileExists(ArquivoPorteiro) then
    cbxPorteiro.Items.LoadFromFile(ArquivoPorteiro);
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  Close;
end;

function TForm1.VerificaData(Data: String): Boolean;
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

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   btnSalvarClick(btnSalvar);
end;

end.

