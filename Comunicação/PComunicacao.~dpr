////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO..: PComunicacao                                            //
//============================================================================//
// REVISÃO..........: 1.0                                                     //
// MÓDULO...........: Comunicação                                             //
// UNIT.............: Unit inicial do projeto de Comunicação                  //
// ANALISTA.........: Anderson Gonçalves                                      //
// DESENVOLVEDOR....: Anderson Gonçalves                                      //
// DATA DE CRIAÇÃO..: 26/04/2012                                              //
//============================================================================//
// COMENTÁRIOS..:                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//============================================================================//
////////////////////////////////////////////////////////////////////////////////
program PComunicacao;

uses
  Forms,
  Windows,
  Dialogs,
  SysUtils,
  Classes,
  ShellAPI,
  Controls,
  UComunicacao in 'UComunicacao.pas',
  u_protecao in '..\Protecao\u_Protecao.pas',
  u_DefLibWebBrowser in '..\LibWebBrowser\u_DefLibWebBrowser.pas',
  u_Framework in '..\Projeto\u_Framework.pas',
  //u_Boleto in '..\PBoleto\u_Boleto.pas' {frmBoleto},
  u_Serial in '..\Protecao\u_Serial.pas',
  funcoes in '..\Projeto\Funcoes.pas',
  UFormSplash in '..\Projeto\UFormSplash.pas' {fmxFormSplash},
  UPrincComunicacao in 'UPrincComunicacao.pas' {frmPrincComunicacao},
  CdEnviaComunicacao in 'CdEnviaComunicacao.pas' {frmEnviaComunicacao},
  CdRecebeComunicacao in 'CdRecebeComunicacao.pas' {frmRecebeComunicacao},
  ULogComunicacao in 'ULogComunicacao.pas' {frmLogComunicacao},
  UConfComunicacao in 'UConfComunicacao.pas' {frmConfComunicacao},
  UDM_Comunicacao in 'UDM_Comunicacao.pas' {DMComunicacao: TDataModule},
  UDMFB in '..\Projeto\UDMFB.pas' {DMFB: TDataModule},
  u_ListaPedidoPAF in '..\Projeto\u_ListaPedidoPAF.pas' {frmListaPedidoPAF};

{$R *.res}

var
  Hand1: HWND;
  FormSplash: TfmxFormSplash;

begin
  if ExecutaComunicacao then
  begin
    sListLog := TStringList.Create;
    Hand1 := FindWindow('TfrmPrincComunicacao','PComunicação');

    {Caso o arquivo de conexão com o banco não exista, ele chama a tela de conecção e cria o arquivo}
    if not FileExists('Siac.udl') then
    begin
      TStringList.Create().SaveToFile('Siac.udl');
      ShellExecute(Hand1,'open',PChar('Siac.udl'), '','',SW_SHOWNORMAL);
      exit;
    end;

    if Hand1 <> 0 then
      Application.MessageBox('O Sistema já está ativo!', 'PComunicação', MB_ICONINFORMATION + MB_OK)
    else
    begin
      FormSplash := TfMxFormSplash.Create(Application);


      FormSplash.Show;
      FormSplash.Refresh;
      Sleep(2000);

      Application.Initialize;

      FormSplash.Gauge1.Progress:= 5;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 10;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 15;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 20;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 25;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 30;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 35;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 40;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 45;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 50;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 55;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 60;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 65;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 70;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 75;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 80;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 85;
      FormSplash.Refresh;
      Sleep(1000);

      FormSplash.Gauge1.Progress:= 90;
      FormSplash.Refresh;
      Sleep(2000);

      FormSplash.Gauge1.Progress:= 95;
      FormSplash.Refresh;
      Sleep(2000);

      Application.ShowMainForm := False;
      Sleep(2000);

      //espera 25 segundos

      Application.CreateForm(TfrmPrincComunicacao, frmPrincComunicacao);
      Application.CreateForm(TDMComunicacao, DMComunicacao);
      Application.CreateForm(TDMFB, DMFB);

      if FormSplash <> nil then
      Begin
        //espera mais 1 segundo
        FormSplash.Gauge1.Progress:= 100;
        FormSplash.Refresh;
        Sleep(1000);
        FormSplash.Hide;
        FormSplash.free;
      end;

      Application.Run;
    end;
  end
  else
    Application.MessageBox('Máquina não configurada para comunicação!',
                           'Atenção',
                           MB_ICONINFORMATION);
end.
