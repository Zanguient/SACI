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
  ActiveX,
  SiacReport_TLB in '..\..\..\..\Arquivos de programas\Borland\Delphi7\Imports\SiacReport_TLB.pas',
  uMenu in 'uMenu.pas' {frmMenu},
  uLivroOcorrencia in 'uLivroOcorrencia.pas' {frmOcorrencia},
  uLivro in 'uLivro.pas' {frmLivro},
  uLogin in 'uLogin.pas' {frmLogin},
  uVariaveis in 'uVariaveis.pas',
  u_Resources in '..\..\Projeto\u_Resources.pas',
  uReserva in 'uReserva.pas' {frmReserva},
  uReservaCadastro in 'uReservaCadastro.pas' {frmReservaCadastro};

{$R *.res}
{$R ..\Resources\SIACDA.RES} //Dal.dll
{$R ..\Resources\SIACRP.RES} //SiacReport.dll

  procedure ExtraiArquivos;
  begin
    Extrai_Dal;               
    Extrai_SiacReport;
  end;

begin
  CoInitialize(nil);
  StringConexao := 'Provider=SQLOLEDB.1;Password=agfm1901;Persist Security Info=True;'+
                   'User ID=lagoa;Initial Catalog=buildsis_lagoa;Data Source=70.38.11.27;'+
                   'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;'+
                   'Workstation ID=FONTESD7-VM;Use Encryption for Data=False;'+
                   'Tag with column collation when possible=False';
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
