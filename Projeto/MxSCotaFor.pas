unit MxSCotaFor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  CentroCusto, Fornecedor, Menus;

type
  TfMxSCotaFor = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Fornecedor1: TFornecedor;
    DSFornecedor1: TDataSource;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    edtLocalizar: TEdit;
    Label19: TLabel;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Fornecedor1FOR_CODIGO: TIntegerField;
    Fornecedor1FOR_RZ_SOCIAL: TStringField;
    MainMenu1: TMainMenu;
    Fornecedor2: TMenuItem;
    Localizar1: TMenuItem;
    Fechar1: TMenuItem;
    Confirmar1: TMenuItem;
    N1: TMenuItem;
    Fornecedor1FOR_NOME_FAN: TStringField;
    SB_CadastroFornecedor: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Localizar1Click(Sender: TObject);
    procedure SB_CadastroFornecedorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SelecionaFornecedor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSCotaFor: TfMxSCotaFor;
implementation

uses
  UDM, Funcoes, MxSPediProd, MxCotacao, MxRecebimento,
  CdProduto, CdSolPReposicao, MxInventario, UOp_RelatProd, UMxAjustePreco,
  URelDataCompra, MxPreRecebimento, UfMxSProdutoData, CdItemTab,
  MxTabelaDescontos, MxSVendasCliente, MxSPreRecRec, MxTabelaQtdNormal,
  MxSelProdutoCurva, MxSelPecasReposicao, MxSelInsumo,
  MxSelFaturamentoFornecedor, MxSTituloPagar,
  MxSelEstoqueAnterior, MxNotaFiscal, MxSelPacote, MxSelInventario,
  MxPrecoCusto, MxSCadastroExtratificado, MxSelComparativoForn,
  CdComunicacao, CdEnviarFornecedor, MxSelFaturarPendentesCompra,
  CdReposicaoFornecedor, MxSelFornecedor, URelDataVend, CdFornecedor;

{$R *.DFM}
procedure TfMxSCotaFor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Fornecedor1.Close;
  Action:=Cafree;
end;

procedure TfMxSCotaFor.SelecionaFornecedor;
begin
  fMxSCotaFor.Fornecedor1.Close;
  fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
  fMxSCotaFor.Fornecedor1.Open;
  Fornecedor1.Open;
end;

procedure TfMxSCotaFor.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  If fMxSCotaFor.tag IN [0,16,17,28,29,30] then
  Begin
    SB_CadastroFornecedor.Visible := true;
    SelecionaFornecedor;
  End;
  if DM.Configuracao1.Empresa = empPetromax then
    cmbCampo.ItemIndex:=2
  else
    cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
end;

procedure TfMxSCotaFor.BitBtn1Click(Sender: TObject);
begin
  If Fornecedor1.IsEmpty then
    Raise Exception.Create('Não existe fornecedor associado a este produto!');
  If tag=0 then
    fMxCotacao.edtFornecedor.Text   := Fornecedor1.FieldByName('FOR_RZ_SOCIAL').AsString
  Else If tag=2 then
    fMxRecebim.edtCodigoFOR.Text   := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=3 then
    fCadProdutos.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=4 then
  Begin
    fCadSolPRep.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString;
    fCadSolPRep.Edit5.text:=Fornecedor1.RazaoSocial;
  end
  Else If tag=5 then
    fMxInvent.FornecedorInv := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=6 then
    fMxRecebim.FornecedorInv := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=7 then
    Op_RelatProd.edtCodigoFOR.Text:=Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=8 then
    fMxAjustePreco.edtCodigoFOR.Text:=Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=9 then
    rpt_DataCompra.edtCodigoFOR.Text:=Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=10 then
  Begin
    fmxCotacao.edtCodigoFOR.Text:=Fornecedor1.FieldByName('FOR_CODIGO').AsString;
    fmxCotacao.edtFornecedor.Text:=Fornecedor1.FieldByName('FOR_RZ_SOCIAL').AsString;
  end
  Else If tag=11 then
    fMxPreRecebim.FornecedorInv := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=12 then
    fMxSProdutoData.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=13 then
    fCadItemTab.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=14 then
    fMxTabelaDescontos.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=15 then
    fMxSVendasCliente.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=16 then // Relatório de Recebimentos
    fMxSPreRecRec.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=17 then // Quantidade Normal de Venda
    fMxTabelaQtdNormal.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=18 then // Curva ABC Produto
    fMxSelProdutoCurva.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=19 then // Pescas de Reposição
    fMxSelPecasReposicao.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=20 then // Sel Insumo
    fMxSelInsumo.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=21 then // SelFaturamentoFornecedor
    fMxSelFaturamentoFornecedor.edtCodigoFOR1.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=22 then // SelFaturamentoFornecedor
    fMxSelFaturamentoFornecedor.edtCodigoFOR2.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=23 then // SelFaturamentoFornecedor
    fMxSelFaturamentoFornecedor.edtCodigoFOR3.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=24 then // SelFaturamentoFornecedor
    fMxSelFaturamentoFornecedor.edtCodigoFOR4.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=25 then // SelFaturamentoFornecedor
    fMxSelFaturamentoFornecedor.edtCodigoFOR5.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=26 then // SelFaturamentoFornecedor
    fMxSelFaturamentoFornecedor.edtCodigoFOR6.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=27 then // SelFaturamentoFornecedor
    fMxSelFaturamentoFornecedor.edtCodigoFOR7.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=28 then // Rel. TPG
    fMxSTituloPagar.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=29 then // Rel. Ped. Serv
//    fMxSelPedidoServico.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=30 then // Sel Estoque Anterior
    fMxSelEstoqueAnterior.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=31 then // Sel Estoque Anterior
    fMxNotaFiscal.edtCodigoCLI.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=32 then // Sel Pacote
    fMxSelPacote.edtCodigoCLI.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=33 then // Sel Inventario
    fMxSelInventario.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=34 then // Custo
    fMxPrecoCusto.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=35 then // Venda Extratificada
    fMxSExtratoExtratificado.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=36 then // Comparativo de Fornecedores
    fMxSelComparativoForn.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=37 then // Comparativo de Fornecedores
  Begin
    fCadComunicacao.edtCodEntrada.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString;
    fCadComunicacao.edtRazaoSocial.Text := Fornecedor1.FieldByName('FOR_RZ_SOCIAL').AsString;
  end
  Else If tag=38 then // Enviar Fornecedor
  Begin
    fCadEnviarFornecedor.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString;
    fCadEnviarFornecedor.edtFornecedor.Text := Fornecedor1.FieldByName('FOR_RZ_SOCIAL').AsString;
  end
  Else If tag=39 then
    fMxSelFaturarPendentesCompra.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=40 then
  Begin
    fCadReposicaoFornecedor.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString;
    fCadReposicaoFornecedor.edtFornecedor.Text := Fornecedor1.FieldByName('FOR_RZ_SOCIAL').AsString;
  end
  Else If tag=41 then
    fMxSelFornecedor.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString
  Else If tag=42 then
    rpt_DataVend.edtCodigoFOR.Text := Fornecedor1.FieldByName('FOR_CODIGO').AsString;

  Close;
end;

procedure TfMxSCotaFor.BitBtn2Click(Sender: TObject);
begin
  Close;
end;


procedure TfMxSCotaFor.SB_LocClick(Sender: TObject);
begin
  Fornecedor1.Localizar;
end;

procedure TfMxSCotaFor.Localizar1Click(Sender: TObject);
begin
  Fornecedor1.Localizar;
end;

procedure TfMxSCotaFor.SB_CadastroFornecedorClick(Sender: TObject);
begin
  Application.CreateForm(TfCadFor, fCadFor);
  with fCadFor do
  Begin
    tag := 0;
    Showmodal;
  end;

  SelecionaFornecedor;
end;

procedure TfMxSCotaFor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1Click(BitBtn1);
end;

end.
