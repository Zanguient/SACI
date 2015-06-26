program ImportaEstoque;

uses
  Forms,
  u_ImportaEstoque in 'u_ImportaEstoque.pas' {frmImportaEstoque};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmImportaEstoque, frmImportaEstoque);
  Application.Run;
end.
