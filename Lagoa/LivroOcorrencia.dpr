program LivroOcorrencia;

uses
  Forms,
  uLivroOcorrencia in 'uLivroOcorrencia.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ocorrência';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
