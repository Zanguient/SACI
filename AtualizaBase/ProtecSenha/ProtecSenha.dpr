program ProtecSenha;

uses
  Forms,
  u_ProtecSenha in '..\..\Protecao\u_ProtecSenha.pas' {frProtecSenha},
  u_protecao in '..\..\Protecao\u_Protecao.pas',
  u_Serial in '..\..\Protecao\u_Serial.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrProtecSenha, frProtecSenha);
  Application.Run;
end.
