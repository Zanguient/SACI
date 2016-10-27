program PortariaOnline;

uses
  Forms,
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Dialogs,
  Buttons,
  StdCtrls,
  ExtCtrls,
  uMenu in 'uMenu.pas' {frmMenu},
  uLivroOcorrencia in 'uLivroOcorrencia.pas' {frmOcorrencia},
  uLivro in 'uLivro.pas' {frmLivro},
  uLogin in 'uLogin.pas' {frmLogin},
  uVariaveis in 'uVariaveis.pas';

{$R *.res}

begin
  NomeUsuarioLogado := '';
  Application.CreateForm(TfrmLogin, frmLogin);
  try
    frmLogin.ShowModal;
  finally
    FreeAndNil(frmLogin);
  end;

  if NomeUsuarioLogado <> '' then
  begin
    Application.Initialize;
    Application.CreateForm(TfrmMenu, frmMenu);
    Application.Run;
  end;
end.
