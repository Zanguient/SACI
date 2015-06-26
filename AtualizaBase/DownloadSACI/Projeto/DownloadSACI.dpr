program DownloadSACI;

uses
  Forms,
  untDownloadSACI in '..\Fontes\untDownloadSACI.pas' {frmDownloadSACI},
  funcoes in '..\..\..\Projeto\Funcoes.pas',
  untConfiguracao in '..\Fontes\untConfiguracao.pas' {frmConfiguracao};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DownloadSACI';
  Application.CreateForm(TfrmDownloadSACI, frmDownloadSACI);
  Application.Run;
end.
