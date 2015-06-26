program PVerificaCliente;

uses
  Forms,
  MxVerificaCliente in 'MxVerificaCliente.pas' {fMxVerificaCliente},
  funcoes in '..\..\Projeto\Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMxVerificaCliente, fMxVerificaCliente);
  Application.Run;
end.
