unit MxSFuncionario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  CentroCusto, Menus, Funcionario;

type
  TfMxSFuncionario = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DSFuncionario1: TDataSource;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Edit11: TEdit;
    Label19: TLabel;
    ComboBox2: TComboBox;
    Label20: TLabel;
    MainMenu1: TMainMenu;
    Fornecedor2: TMenuItem;
    Localizar1: TMenuItem;
    Fechar1: TMenuItem;
    Confirmar1: TMenuItem;
    N1: TMenuItem;
    Funcionario1: TFuncionario;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSFuncionario: TfMxSFuncionario;
implementation

uses
  UDM, MxSPediProd, MxCotacao, MxRecebimento,
  CdProduto, CdSolPReposicao, MxInventario, UOp_RelatProd, UMxAjustePreco,
  URelDataCompra, MxPreRecebimento, UfMxSProdutoData, CdItemTab,
  MxTabelaDescontos, CdCliente, MxSelFuncionario, CdFuncionario,
  MxSelAtendimentoPorVendedor;

{$R *.DFM}
procedure TfMxSFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Funcionario1.Active:=False;
  Action:=Cafree;
end;

procedure TfMxSFuncionario.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ComboBox2.ItemIndex:=1;
  Edit11.SetFocus;
end;

procedure TfMxSFuncionario.BitBtn1Click(Sender: TObject);
begin
  If Funcionario1.IsEmpty then
    Raise Exception.Create('Selecione o Funcionário!');
  If tag=0 then
  Begin
    fCadCli.edtConjuge.Text   := IntToStr(Funcionario1.CodigoFUN);
    fCadCli.edtVendedor.Text  := Funcionario1.Apelido; 
  end
  else If tag=1 then
    fMxSelFuncionario.edtCodigoFUN.Text   := IntToStr(Funcionario1.CodigoFUN)
  else If tag=2 then
    fCadFunc.edtSuperior.Text   := IntToStr(Funcionario1.CodigoFUN)
  else If tag=3 then
    fCadFunc.edtParceiro.Text   := IntToStr(Funcionario1.CodigoFUN)
  else If tag=4 then
    fMxSelAtendimentoPorVendedor.edtCodigoFUN.Text   := IntToStr(Funcionario1.CodigoFUN);
end;

procedure TfMxSFuncionario.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSFuncionario.SB_LocClick(Sender: TObject);
begin
  Funcionario1.Localizar;
end;

end.
