unit untConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables;                                                                      

type
  TfrmConfiguracao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    bvLeftControle: TBevel;
    editftp: TEdit;
    edusuario: TEdit;
    edsenha: TEdit;
    edarquivo1: TEdit;
    edarquivo2: TEdit;
    checkpassivo: TCheckBox;
    btnSalvar: TBitBtn;
    Configuracao1: TQuery;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

{$R *.dfm}

procedure TfrmConfiguracao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;

  if key = #13 then
    btnSalvarClick(btnSalvar);
end;

procedure TfrmConfiguracao.btnSalvarClick(Sender: TObject);
var
  sPassivo : string;
begin
  if checkpassivo.Checked then
    sPassivo := 'S'
  else
    sPassivo := 'N';

  Configuracao1.Close;
  Configuracao1.SQL.Clear;
  Configuracao1.SQL.Add('UPDATE CONFIGURACAO SET');
  Configuracao1.SQL.Add('CNF_FTP_URL = ''' +editftp.Text+ ''',');
  Configuracao1.SQL.Add('CNF_FTP_USUARIO = ''' +edusuario.Text+ ''',');
  Configuracao1.SQL.Add('CNF_FTP_SENHA = ''' +edsenha.Text+ ''',');
  Configuracao1.SQL.Add('CNF_FTP_PASSIVO = ''' +sPassivo+ ''',');

  Configuracao1.SQL.Add('CNF_ARQUIVO_PRINCIPAL = ''' +edarquivo1.Text+ ''',');
  Configuracao1.SQL.Add('CNF_ARQUIVO_CHAVE = ''' +edarquivo2.Text+ '''');
  Configuracao1.ExecSQL;
  Close;
end;

end.
