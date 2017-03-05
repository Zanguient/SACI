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
  SiacReport_TLB in 'C:\Arquivos de programas\Borland\Delphi7\Imports\SiacReport_TLB.pas',
  uMenu in 'uMenu.pas' {frmMenu},
  uLivroOcorrencia in 'uLivroOcorrencia.pas' {frmOcorrencia},
  uLivro in 'uLivro.pas' {frmLivro},
  uLogin in 'uLogin.pas' {frmLogin},
  uVariaveis in 'uVariaveis.pas',
  u_Resources in '..\..\Projeto\u_Resources.pas';

{$R *.res}
{$R ..\Resources\SIACDA.RES} //Dal.dll
{$R ..\Resources\SIACRP.RES} //SiacReport.dll

  procedure ExtraiArquivos;
  begin
    Extrai_Dal;               
    Extrai_SiacReport;
  end;

begin
  ExtraiArquivos;
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
