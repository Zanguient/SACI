unit MxEquipe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  CentroCusto, Fornecedor, Menus, EquipeGerencia, DBCtrls, Vendedor;

type
  TfMxEquipe = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    bitFechar: TBitBtn;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Fornecedor2: TMenuItem;
    Fechar1: TMenuItem;
    Salvar1: TMenuItem;
    EquipeGerencia1: TEquipeGerencia;
    Novo1: TMenuItem;
    N2: TMenuItem;
    SB_Exc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    EquipeGerencia1CNC_CODIGO: TIntegerField;
    EquipeGerencia1USU_CODIGO: TIntegerField;
    EquipeGerencia1FUN_CODIGO: TIntegerField;
    EquipeGerencia1FUN_VENDEDOR: TIntegerField;
    EquipeGerencia1Vendedor: TStringField;
    DSEquipeGerencia1: TDataSource;
    edtCodigoFUN: TEdit;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    Label22: TLabel;
    dblVendedor: TDBLookupComboBox;
    Vendedor2: TVendedor;
    Excluir1: TMenuItem;
    Cancelar1: TMenuItem;
    EquipeGerencia2: TEquipeGerencia;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitFecharClick(Sender: TObject);
    procedure EquipeGerencia1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EquipeGerencia1BeforeOpen(DataSet: TDataSet);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure EquipeGerencia1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Entidade : TEquipeGerencia;
  end;

var
  fMxEquipe: TfMxEquipe;
implementation

uses
  UDM, Funcoes;

{$R *.DFM}
procedure TfMxEquipe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=Cafree;
end;

procedure TfMxEquipe.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxEquipe.EquipeGerencia1CalcFields(DataSet: TDataSet);
begin
  with Vendedor2 do
  Begin
    if Entidade.CodigoVendedor <> CodigoFUN then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoVendedor;
      Open
    end;
    Entidade.FieldByName('Vendedor').asString := Apelido;
  end;
end;

procedure TfMxEquipe.FormCreate(Sender: TObject);
begin
  Entidade := EquipeGerencia1;
end;

procedure TfMxEquipe.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Vendedor1.Open;
  Entidade.Open;
end;

procedure TfMxEquipe.EquipeGerencia1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('FUN_CODIGO').asInteger := StrToInt(edtCodigoFUN.Text);
  except
  end;
end;

procedure TfMxEquipe.SB_NovoClick(Sender: TObject);
begin
  Novo1.Enabled := False;
  Excluir1.Enabled := False;
  Salvar1.Enabled := True;
  Cancelar1.Enabled := True;
  SB_Novo.Enabled := False;
  SB_Exc.Enabled := False;
  SB_Salva.Enabled := True;
  SB_Canc.Enabled := True;
  dblVendedor.Enabled := True;
  dblVendedor.SetFocus;  
end;

procedure TfMxEquipe.SB_SalvaClick(Sender: TObject);
var
  CdVen: integer;
begin
  if not (dblVendedor.KeyValue > 0) then
    Raise Exception.Create('Vendedor inválido!');
  with EquipeGerencia2 do
  Begin
    Close;
    ParamByName('FUN_CODIGO').asInteger := StrToInt(edtCodigoFUN.Text);
    ParamByName('FUN_VENDEDOR').asInteger := dblVendedor.KeyValue;
    Open;
    if not IsEmpty then
      Raise Exception.Create('Este Vendedor(a) já está nesta Equipe!');
  end;
  CdVen := dblVendedor.KeyValue;
  Novo1.Enabled := True;
  Excluir1.Enabled := True;
  Salvar1.Enabled := False;
  Cancelar1.Enabled := False;
  SB_Novo.Enabled := True;
  SB_Exc.Enabled := True;
  SB_Salva.Enabled := False;
  SB_Canc.Enabled := False;
  dblVendedor.Enabled := False;
  if Entidade.Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoFUN.Text),dblVendedor.KeyValue) then
  Begin
    Entidade.Close;
    Entidade.Open;
    Entidade.LocalizarCod(StrToInt(edtCodigoFUN.Text), CdVen);
  end
  else
    ShowMessage('As alterações não foram salvas!');  
end;

procedure TfMxEquipe.SB_CancClick(Sender: TObject);
begin
  Novo1.Enabled := True;
  Excluir1.Enabled := True;
  Salvar1.Enabled := False;
  Cancelar1.Enabled := False;
  SB_Novo.Enabled := True;
  SB_Exc.Enabled := True;
  SB_Salva.Enabled := False;
  SB_Canc.Enabled := False;
  dblVendedor.Enabled := False;
  if Entidade.IsEmpty then
    dblVendedor.KeyValue := -1
  else
    Entidade.CarregaDados;
end;

procedure TfMxEquipe.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Nenhum Vendedor selecionado!');
  Entidade.deletarauto;
end;

procedure TfMxEquipe.EquipeGerencia1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

end.
