program PAtualizaSACI;

uses
  Forms,
  UAtualizaLBM in 'UAtualizaLBM.pas' {Form1},
  UDM in 'UDM.pas' {DM: TDataModule},
  funcoes in '..\..\Projeto\Funcoes.pas';

(*Adicionar a Path 'D:\FontesD7\SACI\Componentes' na library*)

{$R *.RES}

begin                    
  Application.Initialize;
  Application.Title := 'AtualizaBase';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
