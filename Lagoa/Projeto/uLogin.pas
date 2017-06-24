{
INSERT INTO USUARIOS (EMAIL, NOME, SENHA, TOKEN, TIPO_USUARIO) VALUES ('admlagoajoqueiville@gmail.com', 'ADM', 'lagoa', '0', 'P');
INSERT INTO USUARIOS (EMAIL, NOME, SENHA, TOKEN, TIPO_USUARIO) VALUES ('porteiro1lagoajoqueiville@gmail.com', 'FLAVIO', 'lagoa', '1', 'P');
INSERT INTO USUARIOS (EMAIL, NOME, SENHA, TOKEN, TIPO_USUARIO) VALUES ('porteiro2lagoajoqueiville@gmail.com', 'RAFAEL', 'lagoa', '2', 'P');
INSERT INTO USUARIOS (EMAIL, NOME, SENHA, TOKEN, TIPO_USUARIO) VALUES ('porteiro3lagoajoqueiville@gmail.com', 'GUGU', 'lagoa', '3', 'P');
INSERT INTO USUARIOS (EMAIL, NOME, SENHA, TOKEN, TIPO_USUARIO) VALUES ('porteiro4lagoajoqueiville@gmail.com', 'JANDERSON', 'lagoa', '4', 'P');
}

unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, uVariaveis, jpeg, funcoes, DB,
  ADODB;

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
    ConnectionLagoa: TADOConnection;
    adoUsuario: TADOQuery;
    procedure btnSairClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  adoUsuario.Close;
  adoUsuario.SQL.Text := 'SELECT * FROM USUARIOS WHERE NOME = ''' + edtNomeUsu.Text + ''' AND ' +
                         ' SENHA = ''' + edtSenha.Text + '''';
  adoUsuario.Open;
  Result := not adoUsuario.IsEmpty;
end;

procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.btnConfirmarClick(Sender: TObject);
begin
  try
    ConnectionLagoa.Connected := True;
    if Logar then
    begin
      NomeUsuarioLogado := edtNomeUsu.Text;
      Close;
    end
    else
      showmessage('Login ou senha inválido!');
  finally
    ConnectionLagoa.Connected := False;
  end;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnConfirmar.Click;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  if ComputadorDoProgramador then
  begin
    edtNomeUsu.Text := 'ADM';
    edtSenha.Text := 'lagoa';
  end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  ConnectionLagoa.ConnectionString := StringConexao;
  EnderecoCondominio := 'Rua Professor Manoel Lourenço, 50, Jóquei Clube, CEP: 60.510-107';
  NomeCondominio := 'Condomínio Lagoa Jóquei Ville, CNPJ: 22.996.271/0001-81';
end;

end.
