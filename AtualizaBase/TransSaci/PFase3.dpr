program PFase3;

uses
  Forms,
  MxSincroniza in 'MxSincroniza.pas' {fMxSincroniza},
  funcoes in '..\..\Projeto\funcoes.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Fase CPD_Loja';
  Application.CreateForm(TfMxSincroniza, fMxSincroniza);
  fMxSincroniza.Tag:=3;
  Application.Run;
end.
 