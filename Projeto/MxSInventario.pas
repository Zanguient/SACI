unit MxSInventario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, Titulo_receber, DBCtrls, CentroCusto,
  Funcionario, Parametro, NotaFiscal, OperFisc, Item_de_Estoque,
  Item_Nota_Fiscal, Menus, Fornecedor, Transportadora, Inventario;

type
  TfMxSInventario = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    DBGrid5: TDBGrid;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    edtLocalizar: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    cmbCampo: TComboBox;
    DSInventario1: TDataSource;
    Funcionario1: TFuncionario;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Principal1: TMenuItem;
    Localizar1: TMenuItem;
    Inventario1: TInventario;
    SB_Confirmar: TBitBtn;
    SB_Fechar: TBitBtn;
    Inventario1INV_CODIGO: TIntegerField;
    Inventario1CNC_CODIGO: TIntegerField;
    Inventario1INV_DATA: TDateTimeField;
    Inventario1FUN_CODIGO: TIntegerField;
    Inventario1INV_SITUACAO: TIntegerField;
    Inventario1INV_OBSERVACAO1: TStringField;
    Inventario1USU_CODIGO: TIntegerField;
    Inventario1INV_DT_ALTERADO: TDateTimeField;
    Inventario1INV_TIPO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Inventario1BeforeOpen(DataSet: TDataSet);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Entidade:TInventario;
    { Public declarations }
  end;

var
  fMxSInventario: TfMxSInventario;

implementation
uses
  UDM, funcoes, MxInventario;

{$R *.DFM}

procedure TfMxSInventario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_LOC_INV_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Action:=Cafree;
end;

procedure TfMxSInventario.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSInventario.SB_LocClick(Sender: TObject);
begin
  if edtLocalizar.Text = '*' then
  Begin
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM INVENTARIO '+
      ' WHERE CNC_CODIGO=:CNC_CODIGO '+
      ' ORDER BY INV_CODIGO DESC ';
    Entidade.Open;
  end
  else
    Entidade.Selecionar;
end;

procedure TfMxSInventario.FormShow(Sender: TObject);
begin
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
  DM.Usuario1.AlteraCorComponentes(self);
end;

procedure TfMxSInventario.FormCreate(Sender: TObject);
begin
  Entidade := Inventario1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_LOC_INV_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxSInventario.Inventario1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxSInventario.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSInventario.SB_ConfirmarClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');
    
  if tag = 0 then //Inventário
  Begin
    with fMxInvent do
    Begin
      Entidade.Close;
      Inventario1.Close;
      Inventario1.SQL.Text := 'SELECT * FROM INVENTARIO '+
        ' WHERE CNC_CODIGO=:CNC_CODIGO '+
        ' AND INV_CODIGO='+IntToStr(self.Entidade.CodigoINV);
      Inventario1.Open;
      Entidade.Open;
    end;
  end;
  Close;
end;

procedure TfMxSInventario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(27) then
  Begin
    Key := #0;
    Close;
  end
  else if Key = chr(13) then
  Begin
    Key := #0;
    SB_ConfirmarClick(sender);
  end;
end;

end.
