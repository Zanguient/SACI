unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,
  ActnMenus, ComCtrls, jpeg, ExtCtrls, StdCtrls, uVariaveis;

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
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

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

end.
