unit MxPerfil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, DBCtrls, Db, DBTables, SQuery, Usuario,
  Permissao, Variants;

type
  TfMxPerfil = class(TForm)
    Panel1: TPanel;
    dblCodigoUSU: TDBLookupComboBox;
    Usuario1: TUsuario;
    DSUsuario1: TDataSource;
    Label1: TLabel;
    Permissao1: TPermissao;
    ckbApagarPermissoes: TCheckBox;
    Panel2: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Usuario1BeforeOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxPerfil: TfMxPerfil;

implementation
Uses
  UDM, Funcoes, MxRelPermissao;

{$R *.DFM}


procedure TfMxPerfil.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxPerfil.FormCreate(Sender: TObject);
begin
  Usuario1.Open;
  Permissao1.Open;
end;

procedure TfMxPerfil.SpeedButton5Click(Sender: TObject);
begin
  if dblCodigoUSU.Text = '' then
    Raise Exception.Create('Selecione o Usuário!');
  If ckbApagarPermissoes.Checked Then
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM PERMISSAO '+
      ' WHERE USU_CODIGO='+IntToStr(fMxRelPermis.Usuario1.CodigoUSU));

  fMxRelPermis.Permissao2.Close;
  fMxRelPermis.Permissao2.open;

  Permissao1.GeraLog(2040,0,fMxRelPermis.Usuario1.CodigoUSU,'USU PERFIL:'+IntToStr(dblCodigoUSU.KeyValue));
  Permissao1.First;
  while not Permissao1.eof do
  Begin
    if not fMxRelPermis.Permissao2.Localizar(fMxRelPermis.dblUsuarioGrafico.KeyValue,Permissao1.CodigoOPS) then
      fMxRelPermis.Permissao2.Inserir(0,DM.Configuracao1.CodigoCNC,Permissao1.CodigoOPS,fMxRelPermis.dblUsuarioGrafico.KeyValue,Usuario1.CodigoUSU(*Perfil*));

    Permissao1.next;
  End;
  Close;
end;

procedure TfMxPerfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfMxPerfil.Usuario1BeforeOpen(DataSet: TDataSet);
begin
  Usuario1.ParamByName('USU_CODIGO').asInteger:=fMxRelPermis.Usuario1.CodigoUSU;
end;

procedure TfMxPerfil.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    SpeedButton5Click(SpeedButton5);
  if key = #27 then
    close;
end;

procedure TfMxPerfil.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
