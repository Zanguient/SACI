unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, uVariaveis, jpeg;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    edtNomeUsu: TEdit;
    edtSenha: TEdit;
    Panel2: TPanel;
    btnConfirmar: TBitBtn;
    btnSair: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function Logar: boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

function TfrmLogin.Logar: boolean;
begin
  Result := ((edtNomeUsu.Text = 'RAFAEL') or (edtNomeUsu.Text = 'FLAVIO') or
             (edtNomeUsu.Text = 'JOAQUIM') or (edtNomeUsu.Text = 'GUGU') or (edtNomeUsu.Text = 'ADM')) and
            ((edtSenha.Text = 'LAGOA') or (edtSenha.Text = 'lagoa'));
end;

procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.btnConfirmarClick(Sender: TObject);
begin
  if Logar then
  begin
    NomeUsuarioLogado := edtNomeUsu.Text;
    Close;
  end
  else
    showmessage('Login ou senha inválido!');
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnConfirmar.Click;    
end;

end.
