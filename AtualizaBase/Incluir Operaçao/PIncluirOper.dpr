program PIncluirOper;

uses
  Forms,
  UAtualizaBase in 'UAtualizaBase.pas' {Form1},
  UDM in 'UDM.pas' {DM: TDataModule},
  funcoes in '..\..\Projeto\Funcoes.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'PIncluirOpe';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
