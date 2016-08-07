program LivroOcorrencia;

uses
  Forms,
  uLivroOcorrencia in 'uLivroOcorrencia.pas' {frmOcorrencia},
  uLivro in 'uLivro.pas' {frmLivro};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ocorrência';
  Application.CreateForm(TfrmLivro, frmLivro);
  Application.Run;
end.
