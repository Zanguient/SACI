//http://www.scriptbrasil.com.br/forum/lofiversion/index.php/t108730.html

//1800000 = 30 MINUTOS
unit UPrincComunicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellApi, TrayIcon, Menus, Registry, DB,
  DBTables, ADODB, funcoes, Gauges;

type
  TfrmPrincComunicacao = class(TForm)
    Timer1: TTimer;
    PopupMenu: TPopupMenu;
    Enviar1: TMenuItem;
    Receber1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    TrayIcon1: TTrayIcon;
    Log1: TMenuItem;
    N2: TMenuItem;
    Configurao1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Enviar1Click(Sender: TObject);
    procedure Receber1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Log1Click(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    sLog: TStringList;
  end;

var
  frmPrincComunicacao: TfrmPrincComunicacao;


implementation

uses CdRecebeComunicacao, CdEnviaComunicacao, ULogComunicacao,
  UConfComunicacao, UComunicacao;

{$R *.dfm}

procedure TfrmPrincComunicacao.Timer1Timer(Sender: TObject);
begin
  TfrmRecebeComunicacao.Execute(true, Timer1);
end;

procedure TfrmPrincComunicacao.Enviar1Click(Sender: TObject);
begin
  Timer1.Enabled := false;
  Application.CreateForm(TfrmEnviaComunicacao, frmEnviaComunicacao);
  with frmEnviaComunicacao do
  begin
    Tag := 0;
    Showmodal;
    FreeAndNil(frmEnviaComunicacao);
  end;
  Timer1.Enabled := true;
end;

procedure TfrmPrincComunicacao.Receber1Click(Sender: TObject);
begin
  TfrmRecebeComunicacao.Execute(false, nil);
end;

procedure TfrmPrincComunicacao.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincComunicacao.Log1Click(Sender: TObject);
begin
  Timer1.Enabled := false;
  Application.CreateForm(TfrmLogComunicacao, frmLogComunicacao);
  with frmLogComunicacao do
  begin
    ShowModal;
    FreeAndNil(frmLogComunicacao);
  end;
  Timer1.Enabled := true;
end;

procedure TfrmPrincComunicacao.TrayIcon1DblClick(Sender: TObject);
begin
  Enviar1.Click;
end;

procedure TfrmPrincComunicacao.Configurao1Click(Sender: TObject);
begin
  Timer1.Enabled := false;
  Application.CreateForm(TfrmConfComunicacao, frmConfComunicacao);
  with frmConfComunicacao do
  begin
    ShowModal;
    FreeAndNil(frmConfComunicacao);
  end;
  Timer1.Enabled := true;
end;

procedure TfrmPrincComunicacao.FormCreate(Sender: TObject);
begin
  //sleep(10000);//10 segundos
  sLog := TStringList.Create;
  Timer1.Enabled := ComunicacaoAutomatica;
end;

procedure TfrmPrincComunicacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  comunicacao: TRecebeComunicacao;
begin
  comunicacao := TRecebeComunicacao.Create;

  try
    frmPrincComunicacao.sLog.SaveToFile(comunicacao.PastaLOG + 'Log-' + FormatDateTime('ddmmyyyyhhnnss',now) + '.txt');
  finally
    FreeAndNil(comunicacao);
  end;
end;

end.
