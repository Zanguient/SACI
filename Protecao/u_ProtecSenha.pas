unit u_ProtecSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrProtecSenha = class(TForm)
    GroupBox4: TGroupBox;
    GroupBox1: TGroupBox;
    edSerial1: TEdit;
    edSerial2: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    edSenha1: TEdit;
    edSenha2: TEdit;
    GroupBox5: TGroupBox;
    btnSenhaSup: TButton;
    edtQtde: TEdit;
    Label1: TLabel;
    mmGuid: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSerial1Exit(Sender: TObject);
    procedure btnSenhaSupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frProtecSenha: TfrProtecSenha;

implementation

uses u_Protecao, DateUtils;

{$R *.dfm}

procedure TfrProtecSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrProtecSenha.Button1Click(Sender: TObject);
var
  skey1 : string;
  skey2 : string;
  skey3 : string;
begin
  edSenha1.Clear;
  edSenha2.Clear;
  //edSenha3.Clear;
  if not ValidaSerial(edSerial1.Text, edSerial2.Text) then
    exit;
  GeraSenha(edSerial1.Text, skey1, skey2, skey3, '');
  edSenha1.Text := skey1;
  edSenha2.Text := skey2;
  //edSenha3.Text := skey3;
end;

procedure TfrProtecSenha.FormCreate(Sender: TObject);
var
  sSerial: string;
begin
  sSerial := getSerialHD;
{
  if (sSerial <> '3973097317') then  // Anderson Gonçalves (note)
  begin
    Application.MessageBox('Computador não autorizado.','Informação', MB_OK+MB_ICONINFORMATION);
    Application.Terminate;
  end;
}
end;

procedure TfrProtecSenha.edSerial1Exit(Sender: TObject);
begin
  TEdit(Sender).Text := MascaraProtec(TEdit(Sender).Text);
end;

procedure TfrProtecSenha.btnSenhaSupClick(Sender: TObject);
var
  sChave: TGUID;
  i: integer;
begin
  mmGuid.Clear;
  for i := 1 to StrToInt(edtQtde.text) do
  begin
    CreateGUID(sChave);
    mmGuid.Lines.Add(GUIDToString(sChave));
  end;
end;

end.
