program PFase2;

uses
  Forms,
  MxSincroniza in 'MxSincroniza.pas' {fMxSincroniza},
  funcoes in '..\..\Projeto\Funcoes.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Fase Loja_CPD';
  Application.CreateForm(TfMxSincroniza, fMxSincroniza);
  fMxSincroniza.Tag:=2;
  Application.Run;
end.
