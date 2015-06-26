unit MxSPediProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Produto, Menus, Fornecedor, Item_de_Estoque, JPEG;

type
  TfMxSPedProd = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    bitConfirma: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtProduto: TEdit;
    edtReferencia: TEdit;
    Label3: TLabel;
    edtMarca: TEdit;
    Produto1: TProduto;
    DSProduto1: TDataSource;
    SB_Loc: TSpeedButton;
    edtLocalizar: TEdit;
    Label19: TLabel;
    cmbCampo: TComboBox;
    Label20: TLabel;
    edtUnidade: TEdit;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    Produto2: TMenuItem;
    Localizar1: TMenuItem;
    Fornecedor1: TFornecedor;
    Fechar1: TMenuItem;
    N1: TMenuItem;
    Bevel2: TBevel;
    Label15: TLabel;
    Image1: TImage;
    Produto1PRD_CODIGO: TIntegerField;
    Produto1PRD_DESCRICAO: TStringField;
    Produto1PRD_UNIDADE: TStringField;
    Produto1PRD_MARCA: TStringField;
    Produto1PRD_REFERENCIA: TStringField;
    Produto1PRD_PRECO_VENDA: TFloatField;
    Produto1FOR_CODIGO: TIntegerField;
    Produto1PRD_SITUACAO: TIntegerField;
    edtCodigoPRD: TEdit;
    Label5: TLabel;
    rdbLocalizar: TRadioButton;
    rdbSelecionar: TRadioButton;
    Produto1GRP_CODIGO: TIntegerField;
    edtLocalEstoque: TEdit;
    edtSaldoLocal: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    Label8: TLabel;
    edtSaldoExterno: TEdit;
    Item_de_Estoque2: TItem_de_Estoque;
    Produto1PRD_PESO_LIQUIDO: TFloatField;
    Produto1PRD_CARACTERISTICA: TStringField;
    Produto1PRD_OBSERVACAO: TStringField;
    Produto1PRD_DETALHE: TStringField;
    Produto1PRD_LOCAL: TStringField;
    Produto1SGP_CODIGO: TIntegerField;
    BitBtn3: TBitBtn;
    bitEstoqueGeral: TBitBtn;
    PopupMenu1: TPopupMenu;
    PopPupConfirma1: TMenuItem;
    PopPupAlterar1: TMenuItem;
    Produto1CNC_CODIGO: TIntegerField;
    Produto1CTP_CODIGO: TIntegerField;
    Produto1CLF_CODIGO: TIntegerField;
    Produto1ORF_CODIGO: TIntegerField;
    Produto1PRD_PRECO_COMPRA: TFloatField;
    Produto1PRD_DT_ULT_COMPRA: TDateTimeField;
    Produto1PRD_CUSTO: TFloatField;
    Produto1PRD_PRECO_MEDIO: TFloatField;
    Produto1PRD_EST_MINIMO: TFloatField;
    Produto1PRD_EST_MEDIO: TFloatField;
    Produto1PRD_COMISSAO: TFloatField;
    Produto1USU_CODIGO: TIntegerField;
    Produto1PRD_DT_ALTERADO: TDateTimeField;
    Produto1PRD_DT_CADASTRO: TDateTimeField;
    Produto1PRD_FORA_TABELA: TIntegerField;
    Produto1PRD_FORA_PREVISAO: TIntegerField;
    Produto1PRD_INSUMO: TIntegerField;
    Produto1PRD_BASE_REAL: TFloatField;
    Produto1PRD_SERVICO: TIntegerField;
    Produto1PRD_TEMPO_MEDIO: TIntegerField;
    Produto1PRD_NIVEL: TIntegerField;
    Produto1PRD_FORA_DE_LINHA: TIntegerField;
    Produto1PRD_CATALOGO: TIntegerField;
    Produto1PRD_PREVISAO: TIntegerField;
    Produto1PRD_CLASSIFICACAO: TIntegerField;
    Produto1PRD_ESTOQUE_DETALHADO: TIntegerField;
    CadastrarProduto1: TMenuItem;
    procedure bitConfirmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure cmbCampoEnter(Sender: TObject);
    procedure Produto1AfterScroll(DataSet: TDataSet);
    procedure Image1DblClick(Sender: TObject);
    procedure rdbLocalizarClick(Sender: TObject);
    procedure rdbSelecionarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Label6DblClick(Sender: TObject);
    procedure bitEstoqueGeralClick(Sender: TObject);
    procedure edtLocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocalizarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PopPupConfirma1Click(Sender: TObject);
    procedure PopPupAlterar1Click(Sender: TObject);
    procedure CadastrarProduto1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    Entidade:TProduto;
    CNC2:integer;
    { Public declarations }
  end;

var
  fMxSPedProd: TfMxSPedProd;

implementation

uses
  UDM, MxCotacao, MxPedCompra, MxTransferencia, MxSEstEntrada, 
  MxInventario,funcoes, MxPedidoRapido, MxRecebimento, CdSolPReposicao,
  UOp_RelatProd, UMxAjustePreco, URelDataProd, MxNotaFiscal, MxItemNF,
  MxSVendasCliente, MxSPreRecRec, MxTrocaProdutoProc, UfMxSProdutoData,
  CdItemTab, MxFotoAmpliada, MxManufaturado, MxEstoqueGeral,
  MxEmprestimo, MxSelEmprestimo, MxBonus, MxSelBonus, MxSelBonusVendedor,
  UProduto, MxSelPedidos, MxAjustaPrecoCusto, URelDataCompra, MxServico,
  CdCodigoBarras, MxLista_de_Presente, MxSelProdutoCurva,
  MxSelPecasReposicao, MxTabelaDescontos, CdInsumos, MxSelInsumo, MxReserva,
  MxPedidoMotCal, MxSelPedido, MxSelReservaExterna,
  MxSelEstoqueAnterior, MxSelInventario, MxSelNotaFiscal, MxPrecoCusto,
  MxServicoLBM, CdProduto, CdServico, MxSelDataProduto, MxTabPreco,
  MxSCadastroExtratificado, MxVerificarMercadoria, MxBonificacaoAmostra,
  CdComunicacao, CdEnviarFornecedor, MxAssistenciaTecnica,
  MxSelAssitenciaTecnica, URelDataVend, MxTabPrecoSubGrupo,
  CdReposicaoFornecedor, MxSelPendencia, MxPendencia, MxConsignacao,
  URelConsignacao;

{$R *.DFM}

procedure TfMxSPedProd.bitConfirmaClick(Sender: TObject);
begin
  If tag=1 then
  Begin
    fMxCotacao.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxCotacao.edtProduto.text:=Entidade.Descricao;
  End
  Else If tag=3 then
  Begin
    fMxPedComp.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxPedComp.edtProduto.text:=Entidade.Descricao;
    fMxPedComp.edtUnidade.text:=Entidade.Unidade;
    fMxPedComp.edtReferencia.text:=Entidade.Referencia;
    fMxPedComp.edtDetalhe.text:=Entidade.Detalhe;
  End
  Else If tag=4 then
  Begin
    fMxTransfer.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxTransfer.edtProduto.text:=Entidade.Descricao;
    fMxTransfer.edtUnidade.text:=Entidade.Unidade;
    fMxTransfer.edtReferencia.text:=Entidade.Referencia;
    fMxTransfer.edtDetalhe.text:=Entidade.Detalhe;
    fMxTransfer.edtMarca.text:=Entidade.Marca;
  End
  Else If tag=7 then
  Begin
    fMxSEstEntrada.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxSEstEntrada.edtProduto.text:=Entidade.Descricao;
    fMxSEstEntrada.edtReferencia.text:=Entidade.Referencia;
//    fMxSEstEntrada.edtMarca.text:=Entidade.Marca;
  End
  Else If tag=8 then
  Begin
    ShowMessage('Opção Desativada!');
{
    fMxSEstSaida.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxSEstSaida.edtProduto.text:=Entidade.Descricao;
    fMxSEstSaida.edtUnidade.text:=Entidade.Unidade;
    fMxSEstSaida.edtReferencia.text:=Entidade.Referencia;
    fMxSEstSaida.edtMarca.text:=Entidade.Marca;
}
  End
  Else If tag=10 then
  Begin
    fMxInvent.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxInvent.edtProduto.text:=Entidade.Descricao;
    fMxInvent.edtUnidade.text:=Entidade.Unidade;
    fMxInvent.edtReferencia.text:=Entidade.Referencia;
    fMxInvent.edtMarca.text:=Entidade.Marca;
  End
  Else If tag=13 then
  Begin
    fMxPedidoRapido.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxPedidoRapido.edtProduto.text:=Entidade.Descricao;
    fMxPedidoRapido.edtUnidade.text:=Entidade.Unidade;
    fMxPedidoRapido.edtReferencia.text:=Entidade.Referencia;
    fMxPedidoRapido.edtMarca.text:=Entidade.Marca;
  End
  Else If tag=14 then
  Begin
    fMxRecebim.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxRecebim.edtProduto.text:=Entidade.Descricao;
    fMxRecebim.edtUnidade.text:=Entidade.Unidade;
    fMxRecebim.edtReferencia.text:=Entidade.Referencia;
    fMxRecebim.edtMarca.text:=Entidade.Marca;
  End
  Else If tag=15 then
  begin
    fCadSolPRep.edtProduto.text:=Entidade.Descricao;
    fCadSolPRep.edtCodigoPRD.Text := Produto1.FieldByName('PRD_CODIGO').AsString;
  end
  Else If tag=16 then
  Begin
    Op_RelatProd.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
  End
  Else If tag=17 then
    fmxAjustePreco.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=18 then
    rpt_DataProd.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  else
  If tag=20 then
  Begin
    fMxSItemNF.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxSItemNF.edtProduto.text:=Entidade.Descricao+' '+Entidade.Referencia;
    fMxSItemNF.edtValorUnit.Text:=format('%.2f',[Entidade.Precovenda]);
    fMxSItemNF.edtAliquota.Text:='17';
  End
  else If tag=21 then
    fMxSVendasCliente.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  else If tag=22 then
    fMxSPreRecRec.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  else If tag=23 then
    fMxTrocaProdutoProc.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  else If tag=24 then
    fMxSProdutoData.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  else If tag=25 then
    fCadItemTab.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  (*Else If tag=26 then
  Begin
    fMxPedidoLBM.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxPedidoLBM.edtProduto.text:=Entidade.Descricao;
    fMxPedidoLBM.edtUnidade.text:=Entidade.Unidade;
    fMxPedidoLBM.edtReferencia.text:=Entidade.Referencia;
    fMxPedidoLBM.edtDetalhe.text:=Entidade.Detalhe;
  End*)
  Else If tag=27 then
  Begin
    fMxManufaturado.edtCodigoPRD1.text:=IntToStr(Entidade.CodigoPRD);
    fMxManufaturado.edtProduto1.text:=Entidade.Descricao;
    fMxManufaturado.edtDetalhe1.text:=Entidade.Detalhe;
  End
  Else If tag=28 then
  Begin
    fMxManufaturado.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxManufaturado.edtProduto.text:=Entidade.Descricao;
    fMxManufaturado.edtDetalhe.text:=Entidade.Detalhe;
  End
  Else If tag=29 then
    fmxEstoqueGeral.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=30 then
  Begin
    fMxEmprestimo.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxEmprestimo.edtProduto.text:=Entidade.Descricao;
    fMxEmprestimo.edtReferencia.text:=Entidade.Referencia;
    fMxEmprestimo.edtDetalhe.text:=Entidade.Detalhe;
  End
  Else If tag=31 then
    fMxSelEmprestimo.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=32 then
  Begin
    fMxBonus.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxBonus.edtProduto.text:=Entidade.Descricao;
  end
  Else If tag=33 then
    fMxSelBonus.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=34 then
    fMxSelBonusVendedor.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=35 then
    fMxSelPedidos.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  else if tag=36 then //Pesquisa de Produtos. Menu Principal
  Begin
    //
  end
  else if tag=37 then //Pesquisa de Produtos. Menu Principal
    fMxAjustaPrecoCusto.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  else if tag=38 then //Histórico de Compras
    rpt_DataCompra.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  else if tag=39 then //Histórico de Compras
  Begin
    fMxServico.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxServico.edtProduto.Text := Trim(Entidade.Descricao)+' '+Trim(Entidade.Referencia);
  end
  Else If tag=40 then
  Begin
    fCadCodigoBarras.edtCodigoCDB_Entrada.text:=IntToStr(Entidade.CodigoPRD);
    fCadCodigoBarras.edtDescricao.text:=Entidade.Descricao;
    fCadCodigoBarras.edtCodigoCDB_Barras.setfocus;
  end
  Else If tag=41 then
  Begin
    fMxListadePresente.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxListadePresente.edtProduto.text:=Entidade.Descricao;
    fMxListadePresente.edtQtdNecessaria.setfocus;
  end
  Else If tag=42 then
    fMxSelProdutoCurva.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=43 then
    fMxSelPecasReposicao.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=44 then
    fMxTabelaDescontos.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=45 then
    fCadInsumos.edtINS_CodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=46 then
    fMxSelInsumo.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=47 then
    fMxReserva.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=48 then
    fMxPedidoMotCal.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=49 then
//    fMxSelPedidoServico.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=50 then
    fMxSelPedido.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=51 then
    fMxSelReservaExterna.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=52 then
    fMxSelEstoqueAnterior.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=53 then
    fMxSelInventario.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=54 then
    fMxSelNotaFiscal.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=55 then
    fMxPrecoCusto.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=56 then
    fMxServicoLBM.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=57 then
    fMxSelDataProduto.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=58 then
    fMxTabPreco.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=59 then
    fMxSExtratoExtratificado.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=60 then
  Begin
    fMxVerificarMercadoria.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxVerificarMercadoria.edtProduto.text:=Entidade.Descricao;
  end
  Else If tag=61 then
  Begin
    fMxBonificacaoAmostra.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxBonificacaoAmostra.edtProduto.text:=Entidade.Descricao;
  end
  Else If tag=62 then
  Begin
    fCadComunicacao.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fCadComunicacao.edtDescricaoProduto.text:=Entidade.Descricao;
  end
  Else If tag=63 then
  Begin
    fCadEnviarFornecedor.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fCadEnviarFornecedor.edtProduto.text:=Entidade.Descricao;
  end
  Else If tag=64 then
  Begin
    fMxAssistenciaTecnica.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxAssistenciaTecnica.edtProduto.text:=Trim(Entidade.Descricao+' '+Entidade.Caracteristica);
  end
  Else If tag=65 then
    fMxSelAssistenciaTecnica.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=66 then
    rpt_DataVend.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=67 then
  Begin
    fMxTabPrecoSubGrupo.dblGrupo.KeyValue := Entidade.CodigoGRP;
    fMxTabPrecoSubGrupo.dblSubGrupo.KeyValue := Entidade.CodigoSGP;  
    fMxTabPrecoSubGrupo.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxTabPrecoSubGrupo.edtProduto.Text   := Entidade.Descricao;
  end
  Else If tag=68 then
  Begin
    fCadReposicaoFornecedor.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fCadReposicaoFornecedor.edtProduto.Text   := Entidade.Descricao;
  end
  Else If tag=69 then
    fMxSelPendencia.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=70 then
    fMxPendencia.edtCodigoPRD1.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=71 then
    fMxPendencia.edtCodigoPRD2.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=72 then
    fMxPendencia.edtCodigoPRD3.text:=IntToStr(Entidade.CodigoPRD)
  Else If tag=73 then
    showmessage('em desenvolvimento')
  Else If tag=74 then
  Begin
    fMxConsignacao.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxConsignacao.edtProduto.text:=Entidade.Descricao;
    fMxConsignacao.edtUnidade.text:=Entidade.Unidade;
    fMxConsignacao.edtReferencia.text:=Entidade.Referencia;
    fMxConsignacao.edtMarca.text:=Entidade.Marca;
    fMxConsignacao.edtvalorItem.text:=Format('%.2f',[Entidade.Precovenda]);
  end
  Else If tag=75 then
    fMxRelConsignacao.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);

  Entidade.Active:=False;
  Close;
end;

procedure TfMxSPedProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_SPedPRD_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxSPedProd.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSPedProd.FormCreate(Sender: TObject);
begin
  Entidade:=Produto1;
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_SPedPRD_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxSPedProd.FormShow(Sender: TObject);
begin
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    if DM.Configuracao1.CodigoCNC = 1 then
      CNC2:=2
    else
      CNC2:=1;
  end
  else
  Begin
    Item_de_Estoque2.SQL.Text:='SELECT * FROM ITEM_DE_ESTOQUE_DEPOSITO '+
      ' WHERE PRD_CODIGO=:PRD_CODIGO ';
    CNC2 := 0;
  end;

  DM.Usuario1.ConfiguraTela(self);
  rdbSelecionar.Checked := True;
  Entidade.Open;
  try
    if not (DM.Configuracao1.Empresa IN [empEletro,empPetromax]) then
    Begin
      if ((DM.Configuracao1.Empresa = empLBM) and
          (DM.Configuracao1.CodigoCNC <> 3)) or
         (DM.Configuracao1.Empresa = empHope) then
        cmbCampo.ItemIndex:=4
      else
        cmbCampo.ItemIndex:=1;
    end
    else if DM.Configuracao1.Empresa = 2 then
      cmbCampo.ItemIndex:=1
    else
      cmbCampo.ItemIndex:=0;

    edtLocalizar.SetFocus;
  except
  end;
  if tag = 36 then
  Begin
    PopPupConfirma1.Enabled := False;
    PopPupConfirma1.Visible := False;
    bitConfirma.Enabled := False;
    bitConfirma.Visible := False;
  end;

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(480)) <= 0 then
  Begin
    PopPupAlterar1.Enabled := False;
    PopPupAlterar1.Visible := False;
  end;  
end;


procedure TfMxSPedProd.SB_LocClick(Sender: TObject);
begin
  if (cmbCampo.ItemIndex = 0) and
     (not VerificaInteiroBranco(edtLocalizar.Text)) then
    cmbCampo.ItemIndex := 1;
    
  if rdbLocalizar.Checked then
    Produto1.Localizar
  else
    Produto1.Selecionar;
end;

procedure TfMxSPedProd.cmbCampoEnter(Sender: TObject);
begin
  cmbCampo.Text:='';
end;

procedure TfMxSPedProd.Produto1AfterScroll(DataSet: TDataSet);
begin
  Produto1.CarregaDados;
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3730)) > 0 then
  Begin
    Item_de_Estoque1.Close;
    Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
    Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=Produto1.CodigoPRD;
    Item_de_Estoque1.Open;
    Item_de_Estoque2.Close;
    try
      Item_de_Estoque2.ParamByName('CNC_CODIGO').asInteger:=CNC2;
    except
    end;
    Item_de_Estoque2.ParamByName('PRD_CODIGO').asInteger:=Produto1.CodigoPRD;
    Item_de_Estoque2.Open;
    if not Item_de_Estoque1.IsEmpty then
      edtSaldoLocal.Text := format('%.2f',[Item_de_Estoque1.Saldo])
    else
      edtSaldoLocal.Text := '0,00';
    if not Item_de_Estoque2.IsEmpty then
      edtSaldoExterno.Text := format('%.2f',[Item_de_Estoque2.Saldo])
    else
      edtSaldoExterno.Text := '0,00';
  end
  else
    edtSaldoLocal.Text := '.';
end;

procedure TfMxSPedProd.Image1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=Image1.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Produto: '+Produto1.Descricao+' '+
    Produto1.Unidade+' '+Produto1.Referencia+' '+Produto1.Detalhe+' '+
    Produto1.Marca);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Local Estoque: '+Produto1.Local);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Características: '+Produto1.Caracteristica);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Produto1.Obs);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxSPedProd.rdbLocalizarClick(Sender: TObject);
begin
  Produto1.Close;
  Produto1.SQL.Text:='SELECT * '+
     'FROM PRODUTO '+
     'WHERE PRD_SITUACAO <> 1 '+
     'ORDER BY PRD_DESCRICAO ';
  Produto1.Open;
  edtLocalizar.Setfocus;  
end;

procedure TfMxSPedProd.rdbSelecionarClick(Sender: TObject);
begin
  edtLocalizar.Setfocus;
end;

procedure TfMxSPedProd.BitBtn3Click(Sender: TObject);
begin
  Application.CreateForm(Trpt_produto,rpt_produto);
  with rpt_produto do
  Begin
    tag := 5;
    Entidade.Close;
    if not fMxSPedProd.Entidade.IsEmpty then
      Entidade.SQL.Text := fMxSPedProd.Entidade.SQL.Text
    else
      Entidade.SQL.Text := 'SELECT * FROM PRODUTO WHERE PRD_CODIGO=-1';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;
procedure TfMxSPedProd.Label6DblClick(Sender: TObject);
var
  foto:string;
begin
  if edtLocalEstoque.Text <> '' then
  Begin
    Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
    try
      foto:=DM.Configuracao1.PastaImagens+'\Loja\'+
           edtLocalEstoque.Text+'.JPG';
      fMxFotoAmpliada.imgFotoAmpliada.Picture.LoadFromFile(foto);
    Except
      try
        foto:=DM.Configuracao1.PastaImagens+'\Loja\'+
           Copy(edtLocalEstoque.Text,1,3) +'.JPG';
        fMxFotoAmpliada.imgFotoAmpliada.Picture.LoadFromFile(foto);
      except
        fMxFotoAmpliada.imgFotoAmpliada.Picture:=nil;
      end;
    end;
    fMxFotoAmpliada.memRodapeFoto.Text := 'Local de Estoque: '+edtLocalEstoque.Text;
    fMxFotoAmpliada.ShowModal;
  end;
end;

procedure TfMxSPedProd.bitEstoqueGeralClick(Sender: TObject);
begin
  Application.CreateForm(TfMxEstoqueGeral, fMxEstoqueGeral);
  with fMxEstoqueGeral do
  Begin
    Tag := 1;
    if VerificaInteiroBranco(fMxSPedProd.edtCodigoPRD.Text) then
      edtCodigoPRD.Text := fMxSPedProd.edtCodigoPRD.Text
    else
      edtCodigoPRD.Text := '0';
    SB_LocClick(sender);

    edtCodigoPRD.Enabled := false;
    edtCodigoPRD.Color := AlteraCorComponentes;
    SB_Loc.Visible := false;

    ShowModal;
  end;
end;

procedure TfMxSPedProd.edtLocalizarKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
  if cmbCampo.ItemIndex = 0 then
  Begin
    if DM.Configuracao1.Empresa <> empHope then
    Begin
      If key='-' then
        key:='0'
      else If UpperCase(key)='C' then
        key:='0'
      else If UpperCase(key)='D' then
        key:='6';
    end;
  end;
end;

procedure TfMxSPedProd.edtLocalizarChange(Sender: TObject);
begin
  if cmbCampo.ItemIndex = 0 then
    if Length(edtLocalizar.Text) = 6 then
    Begin
      SB_LocClick(sender);
      edtLocalizar.Clear;
    end;
end;

procedure TfMxSPedProd.DBGrid1DblClick(Sender: TObject);
begin
  if bitConfirma.Enabled then
    bitConfirmaClick(sender);
end;

procedure TfMxSPedProd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
  Begin
    Key := #0;
    if bitConfirma.visible then
      bitConfirmaClick(sender);
  end;
end;

procedure TfMxSPedProd.PopPupConfirma1Click(Sender: TObject);
begin
  bitConfirmaClick(sender);
end;

procedure TfMxSPedProd.PopPupAlterar1Click(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Exit;

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(480)) < 0 then
    Exit;

  if Entidade.Servico then
  Begin
    Application.CreateForm(TfCadServico, fCadServico);
    with fCadServico do
    Begin
      Tag := 1;
      ShowModal;
    end;
  end
  else
  Begin
    Application.CreateForm(TfCadProdutos, fCadProdutos);
    with fCadProdutos do
    Begin
      Tag := 1;
      ShowModal;
    end;
  end;
end;

procedure TfMxSPedProd.CadastrarProduto1Click(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(460)) > 0 then
  Begin
    Application.CreateForm(TfCadProdutos, fCadProdutos);
    with fCadProdutos do
    Begin
      Tag := 1;
      ShowModal;
    end;
  end;
end;

procedure TfMxSPedProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    CadastrarProduto1Click(CadastrarProduto1);

  if Key = VK_F3 then
    SB_LocClick(SB_Loc);
end;

end.
