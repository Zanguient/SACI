unit MxSPediProdMotCal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Produto, Menus, Fornecedor, Item_de_Estoque, JPEG, DBCtrls, SubGrupo,
  Grupo;

type
  TfMxSPedProdMotCal = class(TForm)
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
    edtCodigoPRD: TEdit;
    Label5: TLabel;
    edtLocalEstoque: TEdit;
    edtSaldoLocal: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    BitBtn3: TBitBtn;
    bitEstoqueGeral: TBitBtn;
    Grupo1: TGrupo;
    DSGrupo1: TDataSource;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    Label9: TLabel;
    dblCodigoGRP: TDBLookupComboBox;
    Label10: TLabel;
    dblCodigoSGP: TDBLookupComboBox;
    ckbTodos: TCheckBox;
    Produto1PRD_CODIGO: TIntegerField;
    Produto1CNC_CODIGO: TIntegerField;
    Produto1FOR_CODIGO: TIntegerField;
    Produto1CTP_CODIGO: TIntegerField;
    Produto1SGP_CODIGO: TIntegerField;
    Produto1GRP_CODIGO: TIntegerField;
    Produto1CLF_CODIGO: TIntegerField;
    Produto1ORF_CODIGO: TIntegerField;
    Produto1PRD_DESCRICAO: TStringField;
    Produto1PRD_UNIDADE: TStringField;
    Produto1PRD_MARCA: TStringField;
    Produto1PRD_PRECO_COMPRA: TFloatField;
    Produto1PRD_REFERENCIA: TStringField;
    Produto1PRD_DT_ULT_COMPRA: TDateTimeField;
    Produto1PRD_CUSTO: TFloatField;
    Produto1PRD_PRECO_MEDIO: TFloatField;
    Produto1PRD_PRECO_VENDA: TFloatField;
    Produto1PRD_EST_MINIMO: TFloatField;
    Produto1PRD_EST_MEDIO: TFloatField;
    Produto1PRD_COMISSAO: TFloatField;
    Produto1PRD_SITUACAO: TIntegerField;
    Produto1USU_CODIGO: TIntegerField;
    Produto1PRD_DT_ALTERADO: TDateTimeField;
    Produto1PRD_LOCAL: TStringField;
    Produto1PRD_DETALHE: TStringField;
    Produto1PRD_DT_CADASTRO: TDateTimeField;
    Produto1PRD_PESO_LIQUIDO: TFloatField;
    Produto1PRD_CARACTERISTICA: TStringField;
    Produto1PRD_OBSERVACAO: TStringField;
    Produto1PRD_FORA_TABELA: TIntegerField;
    Produto1PRD_FORA_PREVISAO: TIntegerField;
    Produto1PRD_INSUMO: TIntegerField;
    Produto1PRD_BASE_REAL: TFloatField;
    Timer1: TTimer;
    biConverter: TBitBtn;
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
    procedure Produto1AfterScroll(DataSet: TDataSet);
    procedure Image1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Label6DblClick(Sender: TObject);
    procedure bitEstoqueGeralClick(Sender: TObject);
    procedure edtLocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocalizarChange(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure dblCodigoSGPClick(Sender: TObject);
    procedure Produto1BeforeOpen(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ckbTodosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblCodigoSGPExit(Sender: TObject);
    procedure biConverterClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure CadastrarProduto1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    TeclasPrecionadas: string;
  public
    Entidade:TProduto;
  end;

var
  fMxSPedProdMotCal: TfMxSPedProdMotCal;

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
  MxServicoLBM, MxSelDataProduto, MxTabPreco, MxSCadastroExtratificado,
  MxVerificarMercadoria, MxBonificacaoAmostra, CdComunicacao,
  CdEnviarFornecedor, MxAssistenciaTecnica, MxSelAssitenciaTecnica,
  URelDataVend, MxTabPrecoSubGrupo, CdReposicaoFornecedor, MxSelPendencia,
  MxPendencia, u_pesquisa_subgrupo, MxPedidoMotCal_2, CdProduto,
  MxConsignacao, URelConsignacao;

{$R *.DFM}

procedure TfMxSPedProdMotCal.bitConfirmaClick(Sender: TObject);
var
  i: integer;
begin
  If tag=1 then
  Begin
    fMxCotacao.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxCotacao.edtProduto.text:=Entidade.Descricao;
  End
  Else If tag=3 then
  Begin
    if DBGrid1.SelectedRows.Count>1 then
    Begin
      with DBGrid1.DataSource.DataSet do
      Begin
        for i:=0 to DBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
          if fMxPedComp.SB_NovoItem.Enabled then
            fMxPedComp.SB_NovoItemClick(sender);
          fMxPedComp.edtCodigoPRD.text := FieldByName('PRD_CODIGO').AsString;
          fMxPedComp.edtCodigoPRDExit(sender);
          fMxPedComp.edtQuantidade.Text := InputBox('Dados do Item', FieldByName('PRD_DESCRICAO').AsString+#13+'Quantidade:', '1');
          fMxPedComp.edtPrecoUnit.Text  := InputBox('Dados do Item', FieldByName('PRD_DESCRICAO').AsString+#13+'Preço de Compra:', format('%.2f',[FieldByName('PRD_PRECO_COMPRA').AsFloat]));
          fMxPedComp.SB_SalvaItemClick(sender);
        end;
      end;
      fMxPedComp.SB_CancItemClick(fMxPedComp.SB_CancItem);
      fMxPedComp.Item_Pedido_Compra1.Close;
      fMxPedComp.Item_Pedido_Compra1.Open;
    end
    else
    Begin
      fMxPedComp.edtCodigoPRD.text  := IntToStr(Entidade.CodigoPRD);
      fMxPedComp.edtProduto.text    := Entidade.Descricao;
      fMxPedComp.edtUnidade.text    := Entidade.Unidade;
      fMxPedComp.edtReferencia.text := Entidade.Referencia;
      fMxPedComp.edtDetalhe.text    := Entidade.Detalhe;
    end;
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
    ShowMessage('Opção Desabilitada!');
//    fMxSEstSaida.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
//    fMxSEstSaida.edtProduto.text:=Entidade.Descricao;
//    fMxSEstSaida.edtUnidade.text:=Entidade.Unidade;
//    fMxSEstSaida.edtReferencia.text:=Entidade.Referencia;
//    fMxSEstSaida.edtMarca.text:=Entidade.Marca;
  End
  Else If tag=10 then
  Begin
    if DBGrid1.SelectedRows.Count>1 then
    Begin
      with DBGrid1.DataSource.DataSet do
      Begin
        for i:=0 to DBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
          if fMxInvent.SB_NovoItem.Enabled then
            fMxInvent.SB_NovoItemClick(sender);
          fMxInvent.edtCodigoPRD.text := FieldByName('PRD_CODIGO').AsString;
          fMxInvent.edtCodigoPRDExit(sender);
          fMxInvent.edtQuantidade.Text := InputBox('Dados do Item', FieldByName('PRD_DESCRICAO').AsString+#13+'Quantidade:', '1');
          fMxInvent.SB_SalvaItem.SetFocus;
          fMxInvent.SB_SalvaItemClick(sender);
        end;
      end;
      if fMxInvent.SB_CancItem.Enabled then
        fMxInvent.SB_CancItemClick(sender);
      fMxInvent.Item_de_Inventario2.Close;
      fMxInvent.Item_de_Inventario2.Open;
    end
    else
      fMxInvent.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
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
    fCadSolPRep.edtProduto.text   := Entidade.Descricao;
    fCadSolPRep.edtCodigoPRD.Text := Entidade.FieldByName('PRD_CODIGO').AsString;
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
    if DBGrid1.SelectedRows.Count>1 then
    Begin
      with DBGrid1.DataSource.DataSet do
      Begin
        for i:=0 to DBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
          if fMxSItemNF.SB_Nov.Enabled then
            fMxSItemNF.SB_NovClick(sender);
          fMxSItemNF.edtCodigoPRD.text := FieldByName('PRD_CODIGO').AsString;
          fMxSItemNF.edtCodigoPRDExit(sender);
          fMxSItemNF.edtQuantidade.Text := InputBox('Dados do Item', FieldByName('PRD_DESCRICAO').AsString+#13+'Quantidade:', '1');
          fMxSItemNF.edtValorUnit.Text:= InputBox('Dados do Item', FieldByName('PRD_DESCRICAO').AsString+#13+'Preço Unitário:', format('%.2f',[FieldByName('PRD_PRECO_VENDA').AsFloat]));
          fMxSItemNF.edtAliquota.Text := InputBox('Dados do Item', FieldByName('PRD_DESCRICAO').AsString+#13+'Alíquota ICMS:', '17');
          fMxSItemNF.SB_Con.SetFocus;
          fMxSItemNF.SB_ConClick(sender);
        end;
      end;
      fMxSItemNF.SB_CanClick(sender);
      fMxSItemNF.Item_Nota_Fiscal1.Close;
      fMxSItemNF.Item_Nota_Fiscal1.Open;
    end
    else
    Begin
      fMxSItemNF.edtCodigoPRD.text:= IntToStr(Entidade.CodigoPRD);
      fMxSItemNF.edtProduto.text  := Entidade.Descricao+' '+Entidade.Referencia;
      fMxSItemNF.edtValorUnit.Text:= format('%.2f',[Entidade.Precovenda]);
      fMxSItemNF.edtAliquota.Text := '17';
    end;
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
  Else If tag=26 then
  Begin
    (*fMxPedidoLBM.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
    fMxPedidoLBM.edtProduto.text:=Entidade.Descricao;
    fMxPedidoLBM.edtUnidade.text:=Entidade.Unidade;
    fMxPedidoLBM.edtReferencia.text:=Entidade.Referencia;
    fMxPedidoLBM.edtDetalhe.text:=Entidade.Detalhe;*)
  End
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
  Begin
    if DBGrid1.SelectedRows.Count>1 then
    Begin
      with DBGrid1.DataSource.DataSet do
      Begin
        for i:=0 to DBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
          if fMxPedidoMotCal.SB_Novo.Enabled then
            fMxPedidoMotCal.SB_NovoClick(sender);
          fMxPedidoMotCal.edtCodigoPRD.text := FieldByName('PRD_CODIGO').AsString;
          fMxPedidoMotCal.edtCodigoPRDExit(sender);
          fMxPedidoMotCal.edtQuantidade.Text := InputBox('Dados do Item', FieldByName('PRD_DESCRICAO').AsString+#13+'Quantidade:', '1');
          fMxPedidoMotCal.SB_Salva.SetFocus;
          fMxPedidoMotCal.SB_SalvaClick(sender);
        end;
      end;
      fMxPedidoMotCal.SB_CancClick(sender);
      fMxPedidoMotCal.Item_Pedido_Venda1.Close;
      fMxPedidoMotCal.Item_Pedido_Venda1.Open;
    end
    else
      fMxPedidoMotCal.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
  end
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
    fMxTabPrecoSubGrupo.edtCodigoPRD.text := IntToStr(Entidade.CodigoPRD);
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
  Begin
    if DBGrid1.SelectedRows.Count>1 then
    Begin
      with DBGrid1.DataSource.DataSet do
      Begin
        for i:=0 to DBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
          if fMxPedidoMotCal_2.SB_Novo.Enabled then
            fMxPedidoMotCal_2.SB_NovoClick(sender);
          fMxPedidoMotCal_2.edtCodigoPRD.text := FieldByName('PRD_CODIGO').AsString;
          fMxPedidoMotCal_2.edtCodigoPRDExit(sender);
          fMxPedidoMotCal_2.edtQuantidade.Text := InputBox('Dados do Item', FieldByName('PRD_DESCRICAO').AsString+#13+'Quantidade:', '1');
          fMxPedidoMotCal_2.SB_Salva.SetFocus;
          fMxPedidoMotCal_2.SB_SalvaClick(sender);
        end;
      end;
      fMxPedidoMotCal_2.SB_CancClick(sender);
      fMxPedidoMotCal_2.Item_Pedido_Venda1.Close;
      fMxPedidoMotCal_2.Item_Pedido_Venda1.Open;
    end
    else
      fMxPedidoMotCal_2.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
  end
  else If tag=74 then
  begin
    if DBGrid1.SelectedRows.Count>1 then
    begin
      with DBGrid1.DataSource.DataSet do
      begin
        for i:=0 to DBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
          if fMxConsignacao.SB_NovoItem.Enabled then
            fMxConsignacao.SB_NovoItemClick(sender);
          fMxConsignacao.edtCodigoPRD.text := FieldByName('PRD_CODIGO').AsString;
          fMxConsignacao.edtCodigoPRDExit(sender);
          fMxConsignacao.edtQuantidade.Text := InputBox('Dados do Item', FieldByName('PRD_DESCRICAO').AsString+#13+'Quantidade:', '1');
          fMxConsignacao.SB_SalvaItem.SetFocus;
          fMxConsignacao.SB_SalvaItemClick(sender);
        end;
      end;
      if fMxConsignacao.SB_CancItem.Enabled then
        fMxConsignacao.SB_CancItemClick(sender);
      fMxConsignacao.Item_de_Consignacao1.Close;
      fMxConsignacao.Item_de_Consignacao1.Open;
    end
    else
      fMxConsignacao.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);
  end
  Else If tag=75 then
    fMxRelConsignacao.edtCodigoPRD.text:=IntToStr(Entidade.CodigoPRD);

  Entidade.Close;
  Close;
end;

procedure TfMxSPedProdMotCal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_LocPRDMot_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxSPedProdMotCal.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSPedProdMotCal.FormCreate(Sender: TObject);
begin
  Entidade:=Produto1;
  Grupo1.Open;
  SubGrupo1.Open;
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_LocPRDMot_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxSPedProdMotCal.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  TeclasPrecionadas := '';
  if dblCodigoGRP.Text = '' then
  Begin
    dblCodigoGRP.KeyValue := Grupo1.CodigoGRP;
    dblCodigoGRPClick(sender);
  end;

  Entidade.Close;
  Entidade.SQL.Text:='SELECT * '+
     ' FROM PRODUTO '+
     ' WHERE PRD_SITUACAO <> 1 '+
     ' AND PRD_PRECO_VENDA>0 '+
     ' AND GRP_CODIGO=:GRP_CODIGO '+
     ' AND SGP_CODIGO=:SGP_CODIGO '+
     ' ORDER BY PRD_DESCRICAO ';
  ckbTodosClick(sender);
  Entidade.Open;
  try

    {Foi decidido que otica e agua de cheiro irao buscar pela descricao
    if DM.Configuracao1.Empresa = empLuciano then
      cmbCampo.ItemIndex := 4 //Referência do Produto
    else
      cmbCampo.ItemIndex := 1; //Descrição do Produto}
    cmbCampo.ItemIndex := 1; //Descrição do Produto
    edtLocalizar.SetFocus;
  except
  end;
  if tag = 36 then
  Begin
    bitConfirma.Enabled := False;
    bitConfirma.Visible := False;
  end
  else if Tag IN [3,10,20,48] then //Pedido de Compra, Inventário,Cadastro Item Nota, Pedido Venda Motical
    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];


  (*Anderson Gonçalves*)
  if not (DM.Configuracao1.Empresa IN TEmpresasOtica) then
  begin
    biConverter.Visible := false;
    bitConfirma.Left := bitEstoqueGeral.Left;
    bitEstoqueGeral.Left := biConverter.Left;
  end;
end;


procedure TfMxSPedProdMotCal.SB_LocClick(Sender: TObject);
begin
  Entidade.Selecionar;
end;

procedure TfMxSPedProdMotCal.Produto1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3730)) > 0 then
  Begin
    Item_de_Estoque1.Close;
    Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
    Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
    Item_de_Estoque1.Open;
    if not Item_de_Estoque1.IsEmpty then
      edtSaldoLocal.Text := format('%.2f',[Item_de_Estoque1.Saldo])
    else
      edtSaldoLocal.Text := '0,00';
  end
  else
    edtSaldoLocal.Text := '.';
end;

procedure TfMxSPedProdMotCal.Image1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=Image1.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Produto: '+Entidade.Descricao+' '+
    Entidade.Unidade+' '+Entidade.Referencia+' '+Entidade.Detalhe+' '+
    Entidade.Marca);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Local Estoque: '+Entidade.Local);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Características: '+Entidade.Caracteristica);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Entidade.Obs);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxSPedProdMotCal.BitBtn3Click(Sender: TObject);
begin
  Application.CreateForm(Trpt_produto,rpt_produto);
  with rpt_produto do
  Begin
    tag := 5;
    Entidade.Close;

    if not self.Entidade.IsEmpty then
    begin
      Entidade.SQL.Text := self.Entidade.SQL.Text;
      if not ckbTodos.Checked then
      begin
        try
          Entidade.ParamByName('GRP_CODIGO').asInteger := dblCodigoGRP.KeyValue;
          Entidade.ParamByName('SGP_CODIGO').asInteger := dblCodigoSGP.KeyValue;
        except
        end;
      end;
    end
    else
      Entidade.SQL.Text := 'SELECT * FROM PRODUTO WHERE PRD_CODIGO=-1';
    
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;
procedure TfMxSPedProdMotCal.Label6DblClick(Sender: TObject);
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

procedure TfMxSPedProdMotCal.bitEstoqueGeralClick(Sender: TObject);
begin
  Application.CreateForm(TfMxEstoqueGeral, fMxEstoqueGeral);
  with fMxEstoqueGeral do
  Begin
    Tag := 1;
    if VerificaInteiroBranco(self.edtCodigoPRD.Text) then
      edtCodigoPRD.Text := self.edtCodigoPRD.Text
    else
      edtCodigoPRD.Text := '0';
    SB_LocClick(sender);

    edtCodigoPRD.Enabled := false;
    edtCodigoPRD.Color := AlteraCorComponentes;
    SB_Loc.Visible := false;

    ShowModal;
  end;
end;

procedure TfMxSPedProdMotCal.edtLocalizarKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMxSPedProdMotCal.edtLocalizarChange(Sender: TObject);
begin
  if not ckbTodos.Checked then
    SB_LocClick(sender);
end;

procedure TfMxSPedProdMotCal.dblCodigoGRPClick(Sender: TObject);
begin
  with SubGrupo1 do
  begin
    close;
    SQL.Text:='SELECT * FROM SUBGRUPO '+
      ' WHERE GRP_CODIGO = '+ inttostr(dblCodigoGRP.KeyValue)+
      ' AND SGP_SITUACAO <> 1 '+ //Não mostrar subgrupos desativados
      ' ORDER BY SGP_DESCRICAO ';
    open;
  end;
  dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
  dblCodigoSGPClick(sender);
end;

procedure TfMxSPedProdMotCal.dblCodigoSGPClick(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxSPedProdMotCal.Produto1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('GRP_CODIGO').asInteger := dblCodigoGRP.KeyValue;
    Entidade.ParamByName('SGP_CODIGO').asInteger := dblCodigoSGP.KeyValue;
  except
  end;
end;

procedure TfMxSPedProdMotCal.DBGrid1DblClick(Sender: TObject);
begin
  if bitConfirma.Enabled then
    bitConfirmaClick(sender);
end;

procedure TfMxSPedProdMotCal.ckbTodosClick(Sender: TObject);
begin
  Entidade.Close;
  if ckbTodos.Checked then
  Begin
    Entidade.Selecao.Text := ' AND PRD_SITUACAO <> 1 '+
      ' AND PRD_PRECO_VENDA > 0 ';
    dblCodigoGRP.KeyValue := -1;
    dblCodigoGRP.Enabled  := False;
    dblCodigoGRP.Color    := AlteraCorComponentes;
    dblCodigoSGP.KeyValue := -1;
    dblCodigoSGP.Enabled  := False;
    dblCodigoSGP.Color    := AlteraCorComponentes;
    try
      edtLocalizar.SetFocus;
    except
    end;
  end
  else
  Begin
    Entidade.Selecao.Text := ' AND GRP_CODIGO=:GRP_CODIGO '+
      ' AND SGP_CODIGO=:SGP_CODIGO '+
      ' AND PRD_SITUACAO <> 1 '+
      ' AND PRD_PRECO_VENDA > 0 ';
    dblCodigoGRP.Enabled  := True;
    dblCodigoGRP.Color    := clWindow;
    dblCodigoGRP.KeyValue := Grupo1.CodigoGRP;
    dblCodigoSGP.Enabled  := True;
    dblCodigoSGP.Color    := clWindow;
    try
      edtLocalizar.SetFocus;
    except
    end;    
  end;
end;

procedure TfMxSPedProdMotCal.Timer1Timer(Sender: TObject);
begin
  TeclasPrecionadas := '';
end;

procedure TfMxSPedProdMotCal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
  Begin
    Key := #0;
    if bitConfirma.visible then
      bitConfirmaClick(sender);
  end
  else if key = #8 then
    TeclasPrecionadas := ''
  else if dblCodigoSGP.Focused then
  Begin
    try
      TeclasPrecionadas := TeclasPrecionadas + upperCase(key);
      if Length(TeclasPrecionadas) > 2 then
      Begin
        SubGrupo1.LocalizarNome(TeclasPrecionadas);
        if dblCodigoSGP.KeyValue <> SubGrupo1.CodigoSGP then
          dblCodigoSGP.KeyValue := SubGrupo1.CodigoSGP;
      end;
    except
    end;

    if key=#32 then
    begin
      Application.CreateForm(Tf_pesquisa_subgrupo, f_pesquisa_subgrupo);
      f_pesquisa_subgrupo.tag:=0;
      f_pesquisa_subgrupo.showmodal;
      f_pesquisa_subgrupo.free;
    end;
  end;
end;

procedure TfMxSPedProdMotCal.dblCodigoSGPExit(Sender: TObject);
begin
  TeclasPrecionadas := '';
end;

procedure TfMxSPedProdMotCal.biConverterClick(Sender: TObject);
var
  sGrauEsf, sGrauCil, sGrauEsfConvertido, sGrauCilConvertido, sDesc: string;
  i, iTamDesc: integer;
  vGrauPronto: Boolean;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o produto');
  sDesc := Entidade.Descricao;

  sGrauEsf := '';
  sGrauCil := '';
  vGrauPronto := False;
  iTamDesc := Length(sDesc);
  for i:=iTamDesc downto 1 do
  Begin
    if sDesc[i] in ['0','1','2','3','4','5','6','7','8','9','-','+','.',' '] then
    Begin
      if vGrauPronto then
        sGrauEsf := Trim(sDesc[i]) + sGrauEsf
      else
        sGrauCil := Trim(sDesc[i]) + sGrauCil;
      if sDesc[i] in ['-','+',' '] then
        if vGrauPronto then
          Break
        else
          vGrauPronto := True;
    end
    else
      Break;
  end;

  if (sGrauEsf = '') and (sGrauCil = '') then
  Begin
    ShowMessage('Produto não pode ser convertido!');
    Exit;
  end
  else if (sGrauCil <> '') and (sGrauEsf = '') then
  Begin
    sGrauEsf := sGrauCil;
    sGrauCil := '';
  end;

  try
    StrToFloat(VirgPonto(sGrauEsf,'.',','));
  except
    ShowMessage('Grau esférico inválido!');
  end;

  if (sGrauCil = '') then
  Begin
    ShowMessage('Produto não pode ser convertido! (possivelmente esférico)');
    Exit;
  end;

  try
    StrToFloat(VirgPonto(sGrauCil,'.',','));
  except
    ShowMessage('Grau Cilídrico inválido!');
  end;

  if StrToFloat(VirgPonto(sGrauCil,'.',',')) = 0 then
  Begin
    ShowMessage('Produto somente com grau esférico!');
    Exit;
  end;

  sGrauEsfConvertido := format('%.2f',[   StrToFloat(VirgPonto(sGrauEsf,'.',','))+
                                          StrToFloat(VirgPonto(sGrauCil,'.',','))]);
  sGrauCilConvertido := format('%.2f',[-1*StrToFloat(VirgPonto(sGrauCil,'.',','))]);

  ShowMessage('**  Original  ** '+#13+
              'Grau Esférico  : '+sGrauEsf+#13+
              'Grau Cilíndrico: '+sGrauCil+#13+
              #13+
              '** Convertido ** '+#13+
              'Grau Esférico  : '+sGrauEsfConvertido+#13+
              'Grau Cilíndrico: '+sGrauCilConvertido);
end;

procedure TfMxSPedProdMotCal.DBGrid1TitleClick(Column: TColumn);
begin
  if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
    Exit;
  Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
end;

procedure TfMxSPedProdMotCal.CadastrarProduto1Click(Sender: TObject);
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

procedure TfMxSPedProdMotCal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    CadastrarProduto1Click(CadastrarProduto1);

  if Key = VK_F3 then
    SB_LocClick(SB_Loc);
end;

end.
