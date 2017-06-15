
//Banco de dados do projetoda portaria hospedado no HOSTED
//Data Source=70.38.11.27;
//User ID=lagoa
//Password=agfm1901

unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, StrUtils,
  ActnMenus, ComCtrls, jpeg, ExtCtrls, StdCtrls, uVariaveis, mscorlib_TLB, SiacReport_TLB;


type
  TfrmMenu = class(TForm)
    ActionManager1: TActionManager;
    AR_MudarUsuario: TAction;
    AJ_Ajuda: TAction;
    AR_AlterarSenha: TAction;
    AR_Sair: TAction;
    AJ_Sobre: TAction;
    AC_SQL: TAction;
    AC_Backup: TAction;
    AJ_AtualizarSistema: TAction;
    AC_BlocoNotas: TAction;
    AC_Calendario: TAction;
    AC_Calculadora: TAction;
    PR_LivroOcorrencia: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    sbMenu: TStatusBar;
    Image1: TImage;
    procedure PR_LivroOcorrenciaExecute(Sender: TObject);
    procedure AR_MudarUsuarioExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure ShowTela(Tela: TForm);
    procedure IdentificaUsuario;
  public
  end;

var
  frmMenu: TfrmMenu;

procedure EnviaEmail(aPorteiro, aData, aHora, aMensagem: string; aImportante: boolean; aAnexos: ArrayList);

implementation

uses uLivro, uLogin;

{$R *.dfm}

procedure TfrmMenu.ShowTela(Tela: TForm);
begin
  Tela.Left := 1;
  Tela.Top := 1;
  Tela.Show;
end;

procedure TfrmMenu.PR_LivroOcorrenciaExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmLivro, frmLivro);
  ShowTela(frmLivro);
end;

procedure TfrmMenu.AR_MudarUsuarioExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmLogin, frmLogin);
  try
    frmLogin.ShowModal;
    IdentificaUsuario;
  finally
    FreeAndNil(frmLogin);
  end;
end;

procedure TfrmMenu.FormActivate(Sender: TObject);
begin
  IdentificaUsuario;
end;

procedure TfrmMenu.IdentificaUsuario;
begin
  sbMenu.Panels[2].Text := NomeUsuarioLogado;
  sbMenu.Panels[3].Text := FormatDateTime('"Fortaleza-CE, " dd " de " mmmm " de " yyyy', now);
end;

procedure EnviaEmail(aPorteiro, aData, aHora, aMensagem: string; aImportante: boolean; aAnexos: ArrayList);
var
  msgOcorrencia: string;
  stiReport: CoSiacReport_; //TSiacReport;
const
  cImportante = ' (IMPORTANTE)';
begin
  msgOcorrencia := 'Porteiro: ' + aPorteiro + IfThen(aImportante, cImportante, '') + '<br/>' +
                   'Data: ' + aData + '<br/>' +
                   'Hora: ' + aHora + '<br/><br/>' +
                   aMensagem;
  {
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
  }

  stiReport.Create.SendMessage('aspmx.l.google.com',
                               'admlagoajoqueiville@gmail.com',
                               'Portaria',
                               '17072007',
                               'anndersonn.gonncalves@gmail.com',
                               'Síndico',
                               'Livro de ocorrência',
                               msgOcorrencia,
                               aAnexos);
end;

end.
