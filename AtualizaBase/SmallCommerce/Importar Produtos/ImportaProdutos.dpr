program ImportaProdutos;

uses
  Forms,
  u_ImportaProdutos in 'u_ImportaProdutos.pas' {frmImportaProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(TfrmImportaProdutos, frmImportaProdutos);
  Application.Run;
end.
