program TransSACI;

uses
  Forms,
  windows,
  Dialogs,
  Main in 'Main.pas' {fMxPrincipal},
  MxSobreTransSACI in 'MxSobreTransSACI.pas' {fMxSobreTransSACI},
  MxSincroniza in 'MxSincroniza.pas' {fmxSincroniza},
  funcoes in '..\..\Projeto\funcoes.pas',
  Udownload in 'Udownload.pas';

{$R *.RES}

{$E exe}

var
  Hand1, Hand2, Hand3 : HWND;
Begin
  Hand1 := FindWindow('TSACI','SACI - Sistema de Automação Comercial Integrado');
  Hand2 := FindWindow('TDigitaSenha','SACI - Senha de Acesso');
  Hand3 := FindWindow('TfMxPrincipal','TransSACI');
  if Hand1 <> 0 then
  Begin
    ShowMessage('O SACI está ativo!');
    SetForegroundWindow(Hand1);
    ShowWindow(Hand1, SW_RESTORE);
  end
  else if Hand2 <> 0 then
  Begin
    ShowMessage('O SACI está ativo!');
    SetForegroundWindow(Hand2);
    ShowWindow(Hand2, SW_RESTORE);
  end
  else if Hand3 <> 0 then
  Begin
    ShowMessage('O Sistema já está ativo!');
    SetForegroundWindow(Hand2);
    ShowWindow(Hand2, SW_RESTORE);
  end
  else
  Begin
    Application.Initialize;
    Application.Title := 'TransSACI';
    Application.CreateForm(TfMxPrincipal, fMxPrincipal);
  Application.CreateForm(TfmxSincroniza, fmxSincroniza);
  Application.Run;
  end;
end.
