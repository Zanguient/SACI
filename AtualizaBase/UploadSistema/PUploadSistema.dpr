program PUploadSistema;

uses
  Forms,
  Windows,
  Dialogs,
  SysUtils,
  Classes,
  ShellAPI,
  Controls,
  untUploadSistema in 'untUploadSistema.pas' {frmUploadSistema},
  UDM_Comunicacao in '..\..\Comunicação\UDM_Comunicacao.pas' {DMComunicacao: TDataModule},
  UComunicacao in '..\..\Comunicação\UComunicacao.pas',
  UConfComunicacao in '..\..\Comunicação\UConfComunicacao.pas' {frmConfComunicacao},
  funcoes in '..\..\Projeto\Funcoes.pas',
  untConfiguracao in '..\DownloadSACI\Fontes\untConfiguracao.pas' {frmConfiguracao};

{$R *.res}

var
  Hand1: HWND;

begin
  Hand1 := FindWindow('TfrmUploadSistema','Upload');
  Application.Initialize;

  {Caso o arquivo de conexão com o banco não exista, ele chama a tela de conecção e cria o arquivo}
  if not FileExists('Siac.udl') then
  begin
    TStringList.Create().SaveToFile('Siac.udl');
    ShellExecute(Hand1,'open',PChar('Siac.udl'), '','',SW_SHOWNORMAL);
    exit;
  end;

  Application.CreateForm(TDMComunicacao, DMComunicacao);
  Application.CreateForm(TfrmUploadSistema, frmUploadSistema);
  Application.CreateForm(TfrmConfiguracao, frmConfiguracao);
  Application.Run;
end.
