unit UAtualizaBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Db, DBTables, StdCtrls, WinSkinData;

type
  TForm1 = class(TForm)
    Animate1: TAnimate;
    Timer1: TTimer;
    Query1: TQuery;
    SkinData1: TSkinData;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UDM, funcoes, MxMensagens;

{$R *.DFM}

procedure TForm1.Timer1Timer(Sender: TObject);
var
  StarupInfo: TStartupInfo;
  ProcessInformation: TProcessInformation;
  rc: Boolean;
  aux:TStringList;
  i, j :integer;
  OK:Boolean;
begin
  OK:=True;
  Timer1.Enabled:=False;
  aux:=TStringList.Create;
  if FileExists('ListaDeProgramas.txt') then
    aux.LoadFromFile('ListaDeProgramas.txt')
  else
  Begin
    ShowMessage('Faltando arquivo ListaDeProgramas.TXT !!!');
    Application.Terminate;
  end;
  for i := 0 to aux.Count-1 do
  Begin
    for j := 1 to 100 do
    Begin
      Application.ProcessMessages;
      form1.Refresh;
      sleep(100);
    end;
    FillChar(StarupInfo, SizeOf(StarupInfo), #0);
    with StarupInfo do
      cb := SizeOf(StarupInfo);
    rc := CreateProcess(Nil, Pchar(aux[i]), Nil, Nil, False,
          NORMAL_PRIORITY_CLASS, Nil,
          Nil, StarupInfo, ProcessInformation);
    if rc then
      WaitForSingleObject(ProcessInformation.hProcess,INFINITE)
    else
    Begin
      Application.CreateForm(TfMxMensagens, fMxMensagens);
      fMxMensagens.Label1.Caption:='Arquivo não Localizado: '+aux[i];
      fMxMensagens.Show;
      OK:=False;
    end;
  end;

  Animate1.Active := False;

  if OK then
    Application.Terminate
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Animate1.Active:=True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

end.
