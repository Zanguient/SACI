program ExecutarProgramas;

uses
  Forms,
  UAtualizaBase in 'UAtualizaBase.pas' {Form1},
  UDM in 'UDM.pas' {DM: TDataModule},
  MxMensagens in 'MxMensagens.pas' {fMxMensagens};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
