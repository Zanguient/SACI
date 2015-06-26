program PGeraPre;

uses
  Forms,
  UGeraPre in 'UGeraPre.pas' {fMxGeraPre},
  UDM in 'UDM.pas' {DM: TDataModule},
  funcoes in '..\..\Projeto\Funcoes.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'GeraPreRecebimento';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfMxGeraPre, fMxGeraPre);
  Application.Run;
end.
