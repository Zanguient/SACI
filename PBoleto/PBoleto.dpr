program PBoleto;

uses
  ShareMem,
  Forms,
  Windows,
  IniFiles,
  SysUtils,
  Dialogs,
  Classes,
  ShellAPI,
  Controls,
  u_Boleto in 'u_Boleto.pas' {frmBoleto},
  u_BancoContas in 'u_BancoContas.pas' {frmBancoContas},
  funcoes in '..\Projeto\Funcoes.pas',
  uDefKeyGen in '..\Projeto\uDefKeyGen.pas',
  u_protecao in '..\Protecao\u_Protecao.pas',
  u_Serial in '..\Protecao\u_Serial.pas',
  u_ProtecSerial in '..\Protecao\u_ProtecSerial.pas' {frProtecSerial},
  u_SobreBoleto in 'u_SobreBoleto.pas' {frmSobreBoleto};

{$R *.res}

begin
  if not TemProtecao then
    TfrProtecSerial.Execute;

  if TemProtecao then
  begin
    Application.Initialize;
    Application.CreateForm(TfrmBoleto, frmBoleto);
  Application.Run;
  end
  else
    Application.MessageBox('Proteção não inicializada!','Proteção',MB_ICONERROR + MB_OK);
end.
