unit MxPedidoMotCal_2;
{
  Política de Preço MOTICAL - PDV (Tela de Venda)

  Observação Geral (Considerando somente tabelas válidas)
  Se o cliente possui uma Tabela Promocional Própria
    Ela será usada independente do preço
  Se NÃO
    Se existirem várias Tabelas Promocionais Gerais será usada a que o preço for menor

  ** Produto **
    Verifica Produto em alguma Tabela Promocional (Própria ou Geral)
      Pega PreçoTab na Tabela Promocional
      Verifica (A Vista) ou (Cliente Atacado)
        Aplica Desconto A VISTA da Tabela Promocional
      Se NÃO
        Aplica Desconto A PRAZO da Tabela Promocional
    Se NÃO
      Verifica (A Vista) ou (Cliente Atacado)
        Verifica Cliente com DescontoCLI
          Aplica DescontoCLI no PreçoTab
        Se NÃO e Se Grupo Especial
          Aplica Desconto A VISTA de Configuracao (LBMDesconto60) no PreçoTab
        Se NÃO
          Aplica Desconto SIMPLES (JurosNorm) no PreçoTab
      Se NÃO (A Prazo)
        Verifica Grupo Especial
          Aplica Desconto A PRAZO de Configuracao (LBMJuros60) no PreçoTab
        Se NÃO
          Aplica Desconto ESPECIAL (JurosEsp) no PreçoTab

  ** Serviço **
    Verifica Produto na Tabela Promocional
      Pega PreçoTab na Tabela Promocional
      Verifica (A Vista) ou (Cliente Atacado)
        Aplica Desconto A VISTA da Tabela Promocional no PreçoTab
      Se NÃO
        Aplica Desconto A PRAZO da Tabela Promocional no PreçoTab
    Se NÃO
      Pega PreçoTab na Tabela de Produto
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Parametro, AgenteFin, Forma_de_Pagamento, Vendedor,
  Pedido_de_Venda, Item_Pedido_Venda, Produto, Cliente, Menus, Item_de_Embarque,
  Item_de_Estoque, Titulo_receber, Fatfin, CentroCusto, Movimento_Estoque_Comercial,
  Movimento_Fisico, Informacoes, {ImpFiscB, }Mov_Est_Fiscal, Movimento_caixa,
  Item_Tabela_de_Precos, JPEG, Classificacao_fiscal,
  Item_Nota_Fiscal, NotaFiscal,Variants, ActnList, ActnMan, ImgList,
  ToolWin, ActnCtrls, ActnMenus, CustomizeDlg, ShellAPI, Item_Pacote_Venda,
  Cod_Barr, Detalhe_Venda, Lote;

type
  TfMxPedidoMotCal_2 = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    dbgItens: TDBGrid;
    Label14: TLabel;
    Label15: TLabel;
    edtCodigoPRD: TEdit;
    Label5: TLabel;
    Label16: TLabel;
    edtProduto: TEdit;
    Label17: TLabel;
    edtUnidade: TEdit;
    edtReferencia: TEdit;
    Label18: TLabel;
    edtQuantidade: TEdit;
    Label24: TLabel;
    Panel3: TPanel;
    Label20: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    memResumo: TMemo;
    edtCodigoPDV: TEdit;
    edtDataHora: TEdit;
    edtPrecoUnitario: TEdit;
    edtMarca: TEdit;
    edtCodigoTPS: TEdit;
    memObservacao: TMemo;
    Label27: TLabel;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    Vendedor1: TVendedor;
    DSForma_de_Pagamento1: TDataSource;
    DSAgenteFin1: TDataSource;
    DSVendedor1: TDataSource;
    Pedido_de_Venda1: TPedido_de_Venda;
    DSPedido_de_Venda1: TDataSource;
    Label23: TLabel;
    DSItem_Pedido_Venda1: TDataSource;
    Produto1: TProduto;
    Cliente1: TCliente;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_CODIGO: TIntegerField;
    Item_Pedido_Venda1FUN_CODIGO: TIntegerField;
    Item_Pedido_Venda1IEB_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1SEC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1TBP_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_DESCONTO: TFloatField;
    Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField;
    Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    edtBonificacao: TEdit;
    Label29: TLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    Item_Pedido_Venda1IPV_SITUACAO: TIntegerField;
    edtDiasOrcamento: TEdit;
    Titulo_receber1: TTitulo_receber;
    FatorFinanceira1: TFatorFinanceira;
    Forma_de_Pagamento2: TForma_de_Pagamento;
    edtPrecoDesconto: TEdit;
    Label31: TLabel;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Titulo_receber2: TTitulo_receber;
    AgenteFin2: TAgenteFin;
    Item_Pedido_Venda1IPV_ENTREGA: TSmallIntField;
    mskMelhorData: TMaskEdit;
    FatorFinanceira2: TFatorFinanceira;
    Label28: TLabel;
    dblTipoPagamento: TDBLookupComboBox;
    Label2: TLabel;
    dblFormaPagamento: TDBLookupComboBox;
    Label26: TLabel;
    dblCodigoAGF: TDBLookupComboBox;
    Label13: TLabel;
    Item_Pedido_Venda1IPV_AVISTA: TSmallintField;
    Parametro2: TParametro;
    Informacoes1: TInformacoes;
    Titulo_receber3: TTitulo_receber;
    Item_Pedido_Venda1IPV_NOTA: TIntegerField;
    Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    Bevel1: TBevel;
    imgFotoCliente: TImage;
    Label12: TLabel;
    Titulo_receber4: TTitulo_receber;
    Titulo_receber1TOTALPEDIDO: TFloatField;
    ckbAVista: TCheckBox;
    Item_Pedido_Venda1Aliquota: TStringField;
    Item_Pedido_Venda1Referencia: TStringField;
    Item_Pedido_Venda1unidade: TStringField;
    Item_Pedido_Venda1Vendedor: TStringField;
    Vendedor2: TVendedor;
    Item_Pedido_Venda1Marca: TStringField;
    Item_Pedido_Venda1Produto: TStringField;
    edtCodigoCNC: TEdit;
    Bevel2: TBevel;
    imgProduto: TImage;
    Item_Pedido_Venda1TotalItem: TStringField;
    ckbMelhorData: TCheckBox;
    Titulo_receber5: TTitulo_receber;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Classificacao_fiscal1: TClassificacao_fiscal;
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
    Produto1Aliquota: TStringField;
    Panel4: TPanel;
    Produto1PRD_CARACTERISTICA: TStringField;
    Produto1PRD_OBSERVACAO: TStringField;
    Produto1PRD_PESO_LIQUIDO: TFloatField;
    Pedido_de_Venda2: TPedido_de_Venda;
    edtDiasEntrega: TEdit;
    SB_SalvarPedido: TBitBtn;
    SB_Informacoes: TBitBtn;
    SB_FinalizarPedido: TBitBtn;
    SB_ImprimirPedido: TBitBtn;
    SB_Promissoria: TBitBtn;
    SB_Cupom: TBitBtn;
    SB_CancelarPedido: TBitBtn;
    SB_FecharPedido: TBitBtn;
    Label30: TLabel;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    Produto1PRD_FORA_PREVISAO: TIntegerField;
    Produto1PRD_FORA_TABELA: TIntegerField;
    SB_NovoPed: TSpeedButton;
    SB_LocPed: TSpeedButton;
    SB_Entrada: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Itens1: TMenuItem;
    IncluirCab1: TMenuItem;
    Localizar1: TMenuItem;
    AlterarCab1: TMenuItem;
    Salvarcabecalho1: TMenuItem;
    CancelarCabecalho1: TMenuItem;
    DescontonoPedido1: TMenuItem;
    N1: TMenuItem;
    SalvarPedido1: TMenuItem;
    InfCrdito1: TMenuItem;
    FinalizarPedido1: TMenuItem;
    CancelarPedido1: TMenuItem;
    N3: TMenuItem;
    ImprimirPedido1: TMenuItem;
    ImprimirPromissoria1: TMenuItem;
    ImprimirCarnnet1: TMenuItem;
    ImprimirCupom1: TMenuItem;
    Item1: TMenuItem;
    Incluir1: TMenuItem;
    Excluir1: TMenuItem;
    N2: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    SB_Novo: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    N4: TMenuItem;
    Calculadora1: TMenuItem;
    Calendrio1: TMenuItem;
    Item_Pacote_Venda1: TItem_Pacote_Venda;
    Itens_Agrupados: TQuery;
    edtCodigoPacote: TEdit;
    Item_Pedido_Venda1SubGrupo: TIntegerField;
    Label25: TLabel;
    edtPrecoSugestao: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label21: TLabel;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    mskCNPJCPF: TMaskEdit;
    edtClienteCNC: TEdit;
    Produto1PRD_INSUMO: TIntegerField;
    Produto1PRD_BASE_REAL: TFloatField;
    Produto1PRD_SERVICO: TIntegerField;
    Produto1PRD_TEMPO_MEDIO: TIntegerField;
    Produto1PRD_NIVEL: TIntegerField;
    Produto1SGP_CODIGO_1: TIntegerField;
    Produto1CNC_CODIGO_1: TIntegerField;
    Produto1GRP_CODIGO_1: TIntegerField;
    Produto1SGP_DESCRICAO: TStringField;
    Produto1SGP_OBSERVACAO: TStringField;
    Produto1SGP_BASE_CHAVE: TStringField;
    Produto1SGP_FAMILIA: TStringField;
    Produto1SGP_SITUACAO: TIntegerField;
    Produto1SGP_DT_CADASTRO: TDateTimeField;
    Produto1SGP_DT_ALTERADO: TDateTimeField;
    Produto1USU_CODIGO_1: TIntegerField;
    Produto1SGP_INDICE_REFRACAO: TFloatField;
    Produto1SGP_FABRICAR: TIntegerField;
    Produto1SGP_PRECO_DOLAR: TIntegerField;
    Produto1GRP_DESCRICAO: TStringField;
    Produto1GRP_OBSERVACAO: TStringField;
    Produto1GRP_ESPECIAL: TIntegerField;
    Produto1GRP_SITUACAO: TIntegerField;
    Produto1GRP_DT_CADASTRO: TDateTimeField;
    Produto1GRP_DT_ALTERADO: TDateTimeField;
    Produto1GRP_SERVICO: TIntegerField;
    Produto1CNC_CODIGO_2: TIntegerField;
    Produto1GRP_CODIGO_2: TIntegerField;
    Produto1USU_CODIGO_2: TIntegerField;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    PopupMenu1: TPopupMenu;
    ObservaoItem1: TMenuItem;
    Item_Pedido_Venda1IPV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_CADASTRO: TDateTimeField;
    Codigo_Barras1: TCodigo_Barras;
    Item_Pedido_Venda1IPV_VINCULO: TIntegerField;
    Item_Pedido_Venda1IPV_SEQUENCIA: TIntegerField;
    Label32: TLabel;
    edtDocumento: TEdit;
    SB_Alt: TSpeedButton;
    Alterar1: TMenuItem;
    SB_Frete: TSpeedButton;
    Produto1PRD_FORA_DE_LINHA: TIntegerField;
    Produto1SGP_EIXOS: TStringField;
    EntradaPed: TMenuItem;
    DetalhePedidoCab: TMenuItem;
    Detalhe_Venda1: TDetalhe_Venda;
    PagamentoAntecipadoCab: TMenuItem;
    EntregaAntecipada1: TMenuItem;
    N5: TMenuItem;
    ExtornoEntregaAntecipada1: TMenuItem;
    ExtornoPagamento1: TMenuItem;
    ExtPagamentoAntecipadoCab: TMenuItem;
    sbDetalhe: TSpeedButton;
    Produto1PRD_CATALOGO: TIntegerField;
    Produto1PRD_PREVISAO: TIntegerField;
    Produto1PRD_CLASSIFICACAO: TIntegerField;
    Produto1PRD_ESTOQUE_DETALHADO: TIntegerField;
    edtDesconto: TEdit;
    edtCodigoLOT: TEdit;
    Item_Pedido_Venda1LOT_CODIGO: TIntegerField;
    lblDescLote: TLabel;
    Lote1: TLote;
    ckbFiscal: TCheckBox;
    Item_de_Estoque_Fiscal1: TQuery;
    qrConsultas: TQuery;
    QueryExec: TQuery;
    Item_Pedido_Venda1IPV_FISCAL: TIntegerField;
    Item_Pedido_Venda1INF_N_ITEM: TIntegerField;
    Label22: TLabel;
    dblCodigoFUN: TDBLookupComboBox;
    QuerySelect: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure Item_Pedido_Venda1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dblFormaPagamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbMelhorDataClick(Sender: TObject);
    procedure AgenteFin1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure AgenteFin1BeforeOpen(DataSet: TDataSet);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
    procedure Titulo_receber2BeforeOpen(DataSet: TDataSet);
    procedure imgFotoClienteDblClick(Sender: TObject);
    procedure Titulo_receber4BeforeOpen(DataSet: TDataSet);
    procedure edtBonificacaoExit(Sender: TObject);
    procedure Parametro2BeforeOpen(DataSet: TDataSet);
    procedure dbgItensDblClick(Sender: TObject);
    procedure CarregarItemVenda;
    procedure imgProdutoDblClick(Sender: TObject);
    procedure edtDiasOrcamentoExit(Sender: TObject);
    procedure Produto1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure SB_EntradaClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_SalvarPedidoClick(Sender: TObject);
    procedure SB_InformacoesClick(Sender: TObject);
    procedure SB_FecharPedidoClick(Sender: TObject);
    procedure SB_FinalizarPedidoClick(Sender: TObject);
    procedure SB_ImprimirPedidoClick(Sender: TObject);
    procedure DescontonoPedido1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Calendrio1Click(Sender: TObject);
    procedure SB_CancelarPedidoClick(Sender: TObject);
    procedure SB_CupomClick(Sender: TObject);
    procedure SB_PromissoriaClick(Sender: TObject);
    procedure ObservaoItem1Click(Sender: TObject);
    procedure edtPrecoDescontoChange(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_FreteClick(Sender: TObject);
    procedure DetalhePedidoCabClick(Sender: TObject);
    procedure PagamentoAntecipadoCabClick(Sender: TObject);
    procedure EntregaAntecipada1Click(Sender: TObject);
    procedure ExtornoEntregaAntecipada1Click(Sender: TObject);
    procedure ExtPagamentoAntecipadoCabClick(Sender: TObject);
    procedure dbgItensTitleClick(Column: TColumn);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure Vendedor1BeforeOpen(DataSet: TDataSet);
    procedure edtCodigoLOTExit(Sender: TObject);
    procedure edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
    procedure imprimi_cabecalho;
    procedure imprimi_item;
  private
    NumeroOficial: integer;
    vCentraliza: Boolean;
    QtdAnt: Double;
    sTabelaPrecoCPD: string;
    procedure AtualizaControles(Cabecalho, Habilitar: Boolean);
    function RecalcularPrecos:Boolean;
  public
    TotalNota: Double;
    CancelarFatura, Cancelar, cancelarloc, VendaAVista, Alteracao, PulaCLI, SairPreco: Boolean;
    CdUltimoGRP, CdUltimoSGP: integer;
    Entidade: TPedido_de_Venda;
    inf_n_item:integer;
    inf_cancelar:string;
  end;

var
  fMxPedidoMotCal_2: TfMxPedidoMotCal_2;

  mensagem, sEspecial, sPaciente, TAM, sDescricaoFPG: String;
  trans, vImprimirAouD: Boolean;
  i, CdCNC, CdPDV, iEstado, CdPRD, sFiscal: integer;
  QuantidadeVendida, vDesconto, vLimSimples, vLimEspecial, vLimSimplesPrazo,
  vLimEspecialPrazo, vDescCliente, vDescClientePrazo, vQtdVendida: Double;
  inserindo_alterando:char;


implementation
Uses
  UDM, funcoes, MxS_Tpreco, MxSPediDesc, MxSPediProdMotCal, MxSPediTab,
  MxSPediCtCus, MxSPediLoc, CdCliente, MxValorEntrada, MxSRecPedido,
  UPedidoVendaItemPDV, UPedidoVendaItemPDVRed2, DigSenha, mxSelProm,
  MxFotoAmpliada, MxResumoPedido, uPedidoVendaDARUMA, MxDescontoPedido,
  uPedidoVendaCodigoPreco, MxFeriados, MxFinalizaPedido, MxSNotaCupom,
  UVendasCliente, Configuracao, Grupo, UPedidoVendaMotical,
  MxDetalhePedidoLuciano, MxDetalhePedido, UPedidoServicoCompleto,
  UComprovanteMovimento, CdLote;
{$R *.DFM}



procedure TfMxPedidoMotCal_2.FormCreate(Sender: TObject);
begin
  Entidade:=Pedido_de_Venda1;

  if DM.Configuracao1.empresa = empEletro then
    sTabelaPrecoCPD := ' T1.CNC_CODIGO=0 '
  else
    sTabelaPrecoCPD := ' T1.CNC_CODIGO=1 ';
      
  try
    dbgItens.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_PedMot_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  if DM.Configuracao1.Empresa = empMotical then
  Begin
    DetalhePedidoCab.Visible := False;
    sbDetalhe.Visible := False;
    ExtornoPagamento1.Visible := False;
    EntregaAntecipada1.Visible := False;
  end;
  vCentraliza := False;
  SairPreco := True;
end;

procedure TfMxPedidoMotCal_2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Item_Pedido_Venda1.SGravarGrid(Item_Pedido_Venda1.EDbgrid,'COL_PEDMOT_');
  except
  end;
  AgenteFin1.Close;
  AgenteFin2.Close;
  Item_Pedido_Venda1.Close;
  Entidade.Close;
  Cliente1.Close;
  FatorFinanceira1.Close;
  FatorFinanceira2.Close;
  Forma_de_pagamento1.Close;
  Forma_de_Pagamento2.Close;
  Vendedor1.Close;
  Item_de_Estoque1.Close;
  Item_Pedido_Venda1.Close;
  Produto1.Close;
  Parametro1.Close;
  Parametro2.Close;
  Titulo_receber1.Close;
  Titulo_receber2.Close;
  Titulo_receber3.Close;
  Action:=Cafree;
end;

procedure TfMxPedidoMotCal_2.edtCodigoPRDExit(Sender: TObject);
var
  Foto:string;
  vPrecoVenda, vDescCliente, vDescClientePrazo: Double;
  CdIPV: integer;
begin
  if SB_Canc.Focused or
     (not SB_Salva.Enabled) then
  Begin
    edtCodigoPRD.Enabled := False;
    Exit;
  end;

  if Trim(edtBonificacao.Text) = '' then
    edtBonificacao.Text:='0';

  //Alan - 25-04-2006 Verificar se possui Estoque Fiscal
  with Item_de_Estoque_Fiscal1 do
  begin
    Close;
    ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
    Open;
  end;

  if Item_de_Estoque_Fiscal1.FieldByName('IES_SFISCAL').AsFloat <= 0.0 then
    ckbFiscal.Checked := False
  else
    if Item_de_Estoque_Fiscal1.FieldByName('IES_SFISCAL').AsFloat > 0.0 then
      ckbFiscal.Checked := True;
  //

  with Produto1 do
  Begin
    try
      if CodigoPRD <> StrToInt(edtCodigoPRD.Text) then
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
        Open;
      end;
    except
      Close;
      ParamByName('PRD_CODIGO').asInteger := -10;
      Open;
    end;
    if IsEmpty then
    Begin
      with Codigo_Barras1 do
      Begin
        if CodigoCDB_Barras <> edtCodigoPRD.Text then
        Begin
          Close;
          paramByName('CDB_CODIGO_BARRAS').asString := edtCodigoPRD.Text;
          Open;
        end;
        if not IsEmpty then
          edtCodigoPRD.Text := IntToStr(CodigoCDB_Entrada)
        else
          edtCodigoPRD.Text := '-1';
      end;
      Close;
      ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
      Open;
    End;
    if IsEmpty then
    Begin
      Showmessage('Produto inexistente!');
      edtCodigoPRD.SetFocus;
      Exit;
    end
    else if Situacao = 1 then
    Begin
      Showmessage('Produto desativado!');
      edtCodigoPRD.SetFocus;
      Exit;
    End
    else if Precovenda <= 0 then
    Begin
      Showmessage('Produto com Preço de venda inválido');
      edtCodigoPRD.SetFocus;
      Exit;
    end;

    DM.QR_Consultas.Close;
    DM.QR_Consultas.SQL.Text := 'SELECT TOP 1 * '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
      ' AND PRD_CODIGO='+edtCodigoPRD.Text+
      ' AND LOT_CODIGO='+edtCodigoLOT.Text;
    DM.QR_Consultas.Open;
    if not DM.QR_Consultas.IsEmpty then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := DM.QR_Consultas.FieldByName('PRD_CODIGO').asInteger;
      Open;
      CdIPV  := DM.QR_Consultas.FieldByName('IPV_CODIGO').asInteger;
      QtdAnt := DM.QR_Consultas.FieldByName('IPV_QUANTIDADE').asFloat;
      Item_Pedido_Venda1.CancelaEdicao;
      Item_Pedido_Venda1.Close;
      Item_Pedido_Venda1.Open;
      Item_Pedido_Venda1.LocalizarCod(CdIPV,Entidade.CodigoCNC);
      Item_Pedido_Venda1.PreparaAlteracao;
      CarregarItemVenda;
    End
    else
    Begin
      if FieldByName('SGP_PRECO_DOLAR').asInteger = 1 then
      Begin
        with DM.Indexador_Economico1 do
        Begin
          Close;
          ParamByName('IDE_CODIGO').asInteger := 1; //Dolar
          Open;
          if isEmpty or (Taxa = 0) then
          Begin
            Showmessage('Não foi definido o Preço do Dolar!');
            edtCodigoPRD.SetFocus;
            Exit;
          End;
          ShowMessage('Preço do Dolar R$ '+format('%.2f',[Taxa]));
          vPrecoVenda := Arredonda(Taxa*PrecoVenda);
        end;
      end
      else
        vPrecoVenda := Arredonda(PrecoVenda);

      CdUltimoGRP := CodigoGRP;
      CdUltimoSGP := CodigoSGP;
      edtProduto.text       := Descricao;
      edtUnidade.text       := Unidade;
      edtReferencia.text    := Referencia;
      edtMarca.text         := Marca;
      edtPrecoUnitario.text := Format('%.2f',[vPrecoVenda]);

      if Cliente1.Convenio > 0 then
      Begin
        with DM.qr_consultas2 do
        Begin
          Close;
          SQL.Text := 'SELECT * FROM CLIENTE '+
            ' WHERE CNC_CODIGO='+IntToStr(Cliente1.ConvenioCNC)+
            ' AND CLI_CODIGO='+IntToStr(Cliente1.Convenio);
          Open;
          vDescCliente      := FieldByName('CLI_DESCONTO').asFloat;
          vDescClientePrazo := FieldByName('CLI_DESCONTO_PRAZO').asFloat;
        end;
      end
      else
      Begin
        vDescCliente      := Cliente1.Desconto;
        //vDescClientePrazo := Cliente1.DescontoPrazo;
        vDescClientePrazo := Cliente1.Fieldbyname('CLI_DESCONTO_PRAZO').AsFloat;
      end;

      if DM.Configuracao1.Empresa = empMotical then
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT * '+
            ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
            ' WHERE I1.GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
            ' AND I1.SGP_CODIGO='+IntToStr(Produto1.CodigoSGP)+
            ' AND (I1.PRD_CODIGO=0 OR I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+') '+
            ' AND (T1.CLI_CODIGO=0 '+
            ' OR (T1.CNC_CLIENTE='+edtClienteCNC.Text+
            ' AND T1.CLI_CODIGO='+edtCodigoCLI.Text+') '+
            '  OR (T1.CLI_CODIGO=-1 '+
            '  AND EXISTS (SELECT TBP_CODIGO FROM TABELA_DE_PRECO_CLIENTE TBC '+
            '      WHERE TBC.CNC_TABELA=T1.CNC_CODIGO '+
            '      AND TBC.TBP_CODIGO=T1.TPS_CODIGO '+
            '      AND TBC.CNC_CLIENTE='+edtClienteCNC.Text+
            '      AND TBC.CLI_CODIGO='+edtCodigoCLI.Text+'))) '+
            ' AND I1.ITS_SITUACAO = 0 '+
            ' AND T1.TPS_SITUACAO=0 '+
            ' AND T1.TPS_LABORATORIO=0 '+
            ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
            ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' OR '+sTabelaPrecoCPD+') '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
            ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
          Open;
          if IsEmpty then
          Begin
            edtCodigoTPS.Text := '0';
            if (Forma_de_Pagamento1.Prazo = '0') then //A Vista
            Begin
              if vDescCliente > 0 then
                edtPrecoSugestao.text := Format('%.2f',[vPrecoVenda-vPrecoVenda*vDescCliente/100])
              else if Produto1.FieldByName('GRP_ESPECIAL').asInteger = 1 then //Lente de Contato
                edtPrecoSugestao.text := Format('%.2f',[vPrecoVenda-vPrecoVenda*DM.Configuracao1.LBMDesconto60/100]) //Desc Simples Lente de Contato
              else
                edtPrecoSugestao.text := Format('%.2f',[vPrecoVenda-vPrecoVenda*DM.Configuracao1.JurosNorm/100]);
            end
            else //A Prazo
            Begin
              if vDescClientePrazo > 0 then
                edtPrecoSugestao.text := Format('%.2f',[vPrecoVenda-vPrecoVenda*vDescClientePrazo/100])
              else if Produto1.FieldByName('GRP_ESPECIAL').asInteger = 1 then //Lente de Contato
                edtPrecoSugestao.text := Format('%.2f',[vPrecoVenda-vPrecoVenda*DM.Configuracao1.LBMJuros60/100]) //Desc Esp Lente de Contato
              else
                edtPrecoSugestao.text := Format('%.2f',[vPrecoVenda-vPrecoVenda*DM.Configuracao1.JurosEsp/100]);
            end;
          end
          else
          Begin
            edtCodigoTPS.Text := FieldByname('TPS_CODIGO').asString;
            if (dblFormaPagamento.KeyValue = 1) and
               (Cliente1.VendaAtacado) then
              edtPrecoSugestao.text := Format('%.2f',[FieldByname('ITS_PRECO_VENDA').asFloat-
                                                 FieldByname('ITS_PRECO_VENDA').asFloat*
                                                 FieldByname('TPS_DESCONTO_SIMPLES').asFloat/100])
            else
              edtPrecoSugestao.text := Format('%.2f',[FieldByname('ITS_PRECO_VENDA').asFloat-
                                                 FieldByname('ITS_PRECO_VENDA').asFloat*
                                                 FieldByname('TPS_DESCONTO_ESPECIAL').asFloat/100]);
          end;
          Close; //Fechar QueryConsultas
        end;
      end
      else //Diferente de Motical
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT * '+
            ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
            ' WHERE I1.GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
            ' AND I1.SGP_CODIGO='+IntToStr(Produto1.CodigoSGP)+
            ' AND (I1.PRD_CODIGO=0 OR I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+') '+
            ' AND (T1.CLI_CODIGO=0 '+
            ' OR (T1.CNC_CLIENTE='+edtClienteCNC.Text+
            ' AND T1.CLI_CODIGO='+edtCodigoCLI.Text+') '+
            '  OR (T1.CLI_CODIGO=-1 '+
            '  AND EXISTS (SELECT TBP_CODIGO FROM TABELA_DE_PRECO_CLIENTE TBC '+
            '      WHERE TBC.CNC_TABELA=T1.CNC_CODIGO '+
            '      AND TBC.TBP_CODIGO=T1.TPS_CODIGO '+
            '      AND TBC.CNC_CLIENTE='+edtClienteCNC.Text+
            '      AND TBC.CLI_CODIGO='+edtCodigoCLI.Text+'))) '+
            ' AND I1.ITS_SITUACAO = 0 '+
            ' AND T1.TPS_SITUACAO=0 '+
            ' AND T1.TPS_LABORATORIO=0 '+
            ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
            ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' OR '+sTabelaPrecoCPD+') '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
            ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
          Open;
          if IsEmpty then
          Begin
            edtCodigoTPS.Text := '0';
            edtPrecoSugestao.text := Format('%.2f',[vPrecovenda]);
          end
          else
          Begin
            edtCodigoTPS.Text := FieldByname('TPS_CODIGO').asString;
            edtPrecoSugestao.text := Format('%.2f',[FieldByname('ITS_PRECO_VENDA').asFloat]);
          end;
          if (Forma_de_Pagamento1.Prazo = '0') and //A Vista
             (vDescCliente > 0) then
          Begin
            edtPrecoSugestao.text := Format('%.2f',[StrToFloat(edtPrecoSugestao.text) - (StrToFloat(edtPrecoSugestao.text)*vDescCliente/100)]);
            edtDesconto.Text := '0,00';
          end
          else if (Forma_de_Pagamento1.Prazo <> '0') and //A Prazo
                  (vDescClientePrazo > 0) then
          Begin
            edtPrecoSugestao.text := Format('%.2f',[StrToFloat(edtPrecoSugestao.text) - (StrToFloat(edtPrecoSugestao.text)*vDescClientePrazo/100)]);
            edtDesconto.Text := '0,00';
          end;
          Close; //Fechar QueryConsultas
        end;
      end;

      try
        foto:=DM.Configuracao1.PastaImagens+'\Produto\00'+
             '-'+IntToStr(Produto1.CodigoPRD)+'.JPG';
        if not FileExists(Foto) then
          foto:=DM.Configuracao1.PastaImagens+'\Grupo\00'+
             '-'+IntToStr(Produto1.CodigoGRP)+'.JPG';
        if FileExists(Foto) then
          imgProduto.Picture.LoadFromFile(foto)
        else
          imgProduto.Picture:=nil;
      Except
        imgProduto.Picture:=nil;
      end;

      if edtDesconto.Text <> '0' then
        edtPrecoDesconto.Text:=format('%.2f',[StrToFloat(edtPrecoSugestao.Text)-(StrToFloat(edtPrecoSugestao.Text)*StrToFloat(edtDesconto.Text)/100)])
      else
        edtPrecoDesconto.Text := edtPrecoSugestao.Text;
    end;
  end;

  {if edtQuantidade.Enabled then
  Begin
    edtQuantidade.SetFocus;
    edtCodigoPRD.Enabled:=False
  end;}

  if SB_Salva.Enabled then
  Begin
    SB_Salva.SetFocus;
    edtCodigoPRD.Enabled:=False
  end;

  //cancelado por causa do desconto
  //SB_SalvaClick(SB_Salva);
end;

procedure TfMxPedidoMotCal_2.Item_Pedido_Venda1AfterScroll(DataSet: TDataSet);
begin
  try
    If not Item_Pedido_Venda1.IsEmpty Then
    Begin
      Item_Pedido_Venda1.CarregaDados;
      CarregarItemVenda;
    end;
  except
  end;

  //Alan 25-04-06 Trazer o Flag Fiscal q indica se o produto vai ser impresso no cupom ou n
  with qrConsultas do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT IPV_FISCAL FROM ITEM_DE_PEDIDO_DE_VENDA'+
      ' WHERE PRD_CODIGO='+Item_Pedido_Venda1PRD_CODIGO.AsString+
      ' AND PDV_CODIGO='+Item_Pedido_Venda1PDV_CODIGO.AsString+
      ' AND CNC_CODIGO='+Item_Pedido_Venda1CNC_CODIGO.AsString;
    Open;
  end;

  if qrConsultas.Fields[0].AsInteger = 1 then
    ckbFiscal.Checked := True
  else
    if qrConsultas.Fields[0].AsInteger = 0 then
      ckbFiscal.Checked := False;
  //
end;

procedure TfMxPedidoMotCal_2.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  aux:TDataSetNotifyEvent;
begin
  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  Item_Pedido_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pedido_Venda1.Open;
  Item_Pedido_Venda1.AfterScroll:=Aux;
  If (SB_SalvaPed.Enabled) or (SB_Salva.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
    Exit;
  End;
  If not Entidade.IsEmpty Then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      Open;
      if IsEmpty then
      Begin
        try
          Detalhe_Venda1.Deletar(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPDV.Text));
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_CODIGO='+edtCodigoPDV.Text);
          Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.text), 'Vazio - CloseQuery');
        except
        end;
      end
      //Situacao; 3-Salvo; 4-Finalizado; 6-Excluído
      Else If (Entidade.Situacao<>3) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6) then
      Begin
        Showmessage('Salve ou cancele o pedido antes de continuar');
        canclose:=false;
        exit;
      End;
      if not Entidade.FecharPedido then
      Begin
        Showmessage('Não foi possível liberar o pedido atual.');
        Canclose:=False;
        exit;
      end;
    end;
  end;
end;

procedure TfMxPedidoMotCal_2.dblFormaPagamentoClick(Sender: TObject);
var
  PDV,CNC:integer;
  aux:TDataSetNotifyEvent;
begin
  if SB_SalvaPed.Enabled then
    dblCodigoAGF.KeyValue:=0;

  if (Entidade.Entrada > 0) and
     SB_SalvaPed.Enabled then
  Begin
    PDV:=StrToInt(edtCodigoPDV.Text);
    CNC:=DM.Configuracao1.CodigoCNC;
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_ENTRADA=0 '+
      ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
      ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
      ' WHERE CNC_CODIGO='+IntToStr(CNC)+
      ' AND PDV_CODIGO='+IntToStr(PDV));
    Aux:=Item_Pedido_Venda1.AfterScroll;
    Item_Pedido_Venda1.AfterScroll:=nil;
    Item_Pedido_Venda1.Close;
    Entidade.Close;
    Entidade.Open;
    Item_Pedido_Venda1.Open;
    Item_Pedido_Venda1.AfterScroll:=Aux;
    Item_Pedido_Venda1.CarregaDados;
    CarregarItemVenda;
  end;

  if dblTipoPagamento.KeyValue = 13 then
  Begin
    if SB_SalvaPed.Enabled then
      dblFormaPagamento.Enabled:=True;
    ckbMelhorData.Enabled:=False;
    ckbMelhorData.Checked:=False;
    mskMelhorData.Clear;
  end
  else
  Begin
    if SB_SalvaPed.Enabled then
      dblFormaPagamento.Enabled:=True;
    ckbMelhorData.Enabled:=True;
  end;
  if (Forma_de_Pagamento1.Prazo<>'') and (Forma_de_Pagamento1.Prazo<>'0')then
     ckbMelhorData.Enabled :=True
  else
  Begin
    ckbMelhorData.Enabled:=False;
    ckbMelhorData.Checked:=False;
    mskMelhorData.Clear;
  end;

  if SB_SalvaPed.Enabled then
    if (dblTipoPagamento.KeyValue = 412) then
      dblCodigoAGF.KeyValue:=2; //Banco do Brasil

  if (dblTipoPagamento.KeyValue = 5) then //Dinheiro/Promissória
  Begin
    With AgenteFin1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
        ' WHERE AGF_CODIGO=1 '+ //LOJA
        ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
      Open;
    end;
    if (dblFormaPagamento.Text = '') then
      dblFormaPagamento.KeyValue := 1; //Á Vista
    if SB_SalvaPed.Enabled and
       (dblCodigoAGF.Text = '') then
      dblCodigoAGF.KeyValue := 1;
  end
  else
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      dblFormaPagamento.Enabled := True;
      dblCodigoAGF.Enabled := True;
    end;
    If dblTipoPagamento.KeyValue = 13 then //Cartão
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
          ' WHERE AGF_DIA_PAGAMENTO > 0 '+
          ' AND AGF_CODIGO<>1'+
          ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
        Open;
      End;
      if dblTipoPagamento.Focused then
      Begin
        if SB_SalvaPed.Enabled and
           (dblFormaPagamento.Text = '') then
          dblFormaPagamento.KeyValue := 8; // Forma em 0 + 1
        if SB_SalvaPed.Enabled and
           (dblCodigoAGF.Text = '') then
          dblCodigoAGF.KeyValue := 8; //Mastercard
      end;
    end
    Else if dblTipoPagamento.KeyValue = 6 then//Cheque
    Begin
      if dblFormaPagamento.KeyValue = 1 then //AVISTA
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
            ' WHERE AGF_CODIGO=1'+ //LOJA
            ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
          Open;
          if SB_SalvaPed.Enabled and
             (dblCodigoAGF.Text = '') then
            dblCodigoAGF.KeyValue:=1;
        End
      else if dblFormaPagamento.KeyValue > 1 then
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
            ' WHERE AGF_CODIGO=6 '+ //Cheque-PRE
            ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
          Open;
          if SB_SalvaPed.Enabled and
             (dblCodigoAGF.Text = '') then
            dblCodigoAGF.KeyValue:=6;
        End;
    end
    else
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
          ' WHERE (AGF_DIA_PAGAMENTO = 0 OR AGF_DIA_PAGAMENTO IS NULL) '+
          ' AND AGF_CODIGO<>1 '+  //Diferente de LOJA
          ' AND AGF_CODIGO<>6'+   //Diferente de Cheque-Pre
          ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
        Open;
      End;
  End;
end;

procedure TfMxPedidoMotCal_2.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if DM.Configuracao1.Empresa <> empLuciano then
  Begin
    lblDescLote.Visible := False;
    edtCodigoLOT.Visible := False;
  end;
    
  if DM.Configuracao1.Empresa = empMotical then
    Caption := Caption + ' MOTICAL'
  else
    Caption := Caption + ' LUCIANO';
  Entidade.Open;
  Parametro1.Open;
  Titulo_receber1.Open;
  Forma_de_Pagamento2.Open;
  AgenteFin2.Open;
  Forma_de_pagamento1.Open;
  FatorFinanceira2.Open;  
  AgenteFin1.Open;
  Vendedor1.Open;
  CdUltimoGRP := 0;
  CdUltimoSGP := 0;
end;


procedure TfMxPedidoMotCal_2.ckbMelhorDataClick(Sender: TObject);
begin
  if not ckbMelhorData.Enabled then
  Begin
    mskMelhorData.Enabled := False;
    Exit;
  end;
  if ckbMelhorData.Checked then
  begin
    if dblFormaPagamento.Enabled then
    Begin
      mskMelhorData.Enabled := true;
      mskMelhorData.SetFocus;
    end;
    mskMelhorData.Color := clwhite;
  end
  else
  begin
    mskMelhorData.Clear;
    mskMelhorData.Enabled := false;
    mskMelhorData.Color := AlteraCorComponentes;
  end;
end;


procedure TfMxPedidoMotCal_2.AgenteFin1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  nparc:Integer;
begin
  if (Forma_de_Pagamento1.Prazo <> '') then
  Begin
    nparc:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);
    If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
      Accept:=FatorFinanceira2.LocalizarNParc(AgenteFin1.CodigoAGF, nparc-1)
    else
      Accept:=FatorFinanceira2.LocalizarNParc(AgenteFin1.CodigoAGF, nparc);
  end;
end;


procedure TfMxPedidoMotCal_2.AgenteFin1BeforeOpen(DataSet: TDataSet);
begin
  AgenteFin1.OnFilterRecord:=AgenteFin1FilterRecord;
  AgenteFin1.Filtered:=True;
end;

procedure TfMxPedidoMotCal_2.edtCodigoCLIExit(Sender: TObject);
var
  Foto: string;
begin
  if (SB_CancPed.Focused) then
    Exit;
  If Trim(edtCodigoCLI.Text)<>'' then
  Begin
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      imgFotoCliente.Picture:=nil;
      Raise Exception.Create('Código do Cliente inválido!');
    end;

    if not VerificaInteiroBranco(edtClienteCNC.Text) then
      edtClienteCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);

    edtRazaoSocial.Clear;
    mskCNPJCPF.Clear;

    with Cliente1 do
    Begin
      Close;
      ParamByName('CLI_CODIGO').AsInteger := StrToInt(edtCodigoCLI.Text);
      ParamByName('CNC_CODIGO').AsInteger := StrToInt(edtClienteCNC.Text);
      Open;
    end;

    with Informacoes1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Cliente1.CodigoCNC;
      ParamByName('CLI_CODIGO').asInteger := Cliente1.CodigoCLI;
      Open;
    end;

    If Cliente1.IsEmpty then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Cliente não cadastrado!');
    End;

    edtRazaoSocial.text:=Cliente1.RazaoSocial;
    If Cliente1.PessoaFisica then
       mskCNPJCPF.Editmask:='999-999-999-99;0;_'
    Else
       mskCNPJCPF.Editmask:='99-999-999/9999-99;0;_';
    mskCNPJCPF.text:=Cliente1.CPFCGC;

    try
      if Cliente1.CodigoCNC < 10 then
        Foto := DM.Configuracao1.PastaImagens+'\Cliente\0'+
          IntToStr(Cliente1.CodigoCNC)+'-'+edtCodigoCLI.Text+'.JPG'
      else
        Foto := DM.Configuracao1.PastaImagens+'\Cliente\'+
          IntToStr(Cliente1.CodigoCNC)+'-'+edtCodigoCLI.Text+'.JPG';
      if FileExists(Foto) then
        imgFotoCliente.Picture.LoadFromFile(Foto)
      else
        imgFotoCliente.Picture:=nil;
    Except
      imgFotoCliente.Picture:=nil;
    end;
  End;
end;

procedure TfMxPedidoMotCal_2.Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
var
  PrecoUnit:string;
begin
  with Produto1 do
  Begin
    if CodigoPRD <> Item_Pedido_Venda1.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda1.CodigoPRD;
      Open;
    end;
    Item_Pedido_Venda1.FieldByName('Produto').asString    := Descricao;
    Item_Pedido_Venda1.FieldByName('Unidade').asString    := Unidade;
    Item_Pedido_Venda1.FieldByName('Referencia').asString := Referencia;
    Item_Pedido_Venda1.FieldByName('Marca').asString      := Marca;
    Item_Pedido_Venda1.FieldByName('Aliquota').asString   := format('%.2f',[FieldByName('Aliquota').asFloat]);
  end;
  with Vendedor2 do
  Begin
    if (CodigoFUN <> Item_Pedido_Venda1.CodigoFUN) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Item_Pedido_Venda1.CodigoFUN;
      Open;
    end;
    Item_Pedido_Venda1.FieldByName('Vendedor').asString := FieldByName('FUN_APELIDO').asString;
  end;

  with Item_Pedido_Venda1 do
  Begin
    if Item_Pedido_Venda1.PrecoDesc > 0 then
      PrecoUnit := format('%.2f',[PrecoDesc])
    else
      PrecoUnit := format('%.2f',[Preco]);
    FieldByName('TotalItem').asString:=format('%.2f',[StrToFloat(PrecoUnit) * (Quantidade-Bonificacao)])
  end;
end;

procedure TfMxPedidoMotCal_2.Titulo_receber2BeforeOpen(DataSet: TDataSet);
begin
  try
    Titulo_receber2.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
  except
  end;
  try
    Titulo_receber2.ParamByName('PDV_CODIGO').asInteger := StrToInt(edtCodigoPDV.Text);
  except
  end;
end;

procedure TfMxPedidoMotCal_2.imgFotoClienteDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgFotoCliente.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Nome Fantasia/Apelido: '+Cliente1.NomeFantasia);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Endereço: '+Cliente1.Endereco+' - '+
    Cliente1.Bairro+' - '+Cliente1.Cidade+'/'+Cliente1.Uf);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Cliente1.OBS);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxPedidoMotCal_2.Titulo_receber4BeforeOpen(DataSet: TDataSet);
begin
  Titulo_receber4.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Titulo_receber4.ParamByName('PDV_CODIGO').asInteger:=StrToInt(edtCodigoPDV.Text);
end;

procedure TfMxPedidoMotCal_2.edtBonificacaoExit(Sender: TObject);
begin
  if not VerificaFloatBranco(edtBonificacao.Text) then
    edtBonificacao.Text:='0';
end;

procedure TfMxPedidoMotCal_2.Parametro2BeforeOpen(DataSet: TDataSet);
begin
  if Cliente1.Logradouro > 0 then
    Parametro2.ParamByName('PAR_CODIGO').asInteger := Cliente1.Logradouro;
end;

procedure TfMxPedidoMotCal_2.dbgItensDblClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
  Foto:string;
  PrecoUnit:String;
begin
  if Item_Pedido_Venda1.IsEmpty then
    Exit;
  if (SB_SalvarPedido.Enabled) then
    SB_SalvarPedidoClick(sender);
  Application.CreateForm(TfMxResumoPedido, fMxResumoPedido);
  fMxResumoPedido.tag := 3;
  fMxResumoPedido.edtCodigoPDV.Text        := edtCodigoPDV.Text;
  fMxResumoPedido.edtCodigoCNC.Text        := IntToStr(Entidade.CodigoCNC);
  fMxResumoPedido.edtDataHota.Text         := edtDataHora.Text;
  fMxResumoPedido.edtTipoPagamento.Text    := dblTipoPagamento.Text;
  fMxResumoPedido.edtFormaPagamento.Text   := dblFormaPagamento.Text;
  fMxResumoPedido.edtAgenteFinanceiro.Text := dblCodigoAGF.Text;
  fMxResumoPedido.edtCodigoCLI.Text        := edtCodigoCLI.Text;
  fMxResumoPedido.edtRazaoSocial.Text      := edtRazaoSocial.Text;
  fMxResumoPedido.libItensPedido.Clear;
  with Item_Pedido_Venda1 do
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    first;
    while not EOF do
    Begin
      if PrecoDesc > 0 then
        PrecoUnit := format('%.2f',[PrecoDesc])
      else
        PrecoUnit := format('%.2f',[Preco]);
      fMxResumoPedido.libItensPedido.Items.Add(PreencheZero(5,CodigoPRD)+' '+
        PreencheEspaco(50,FieldByName('Produto').asString)+' '+
        PreencheEspacoEsq(5,format('%.2f',[Quantidade]))+' '+
        PreencheEspacoEsq(5,format('%.2f',[Bonificacao]))+' '+
        PreencheEspacoEsq(5,format('%.2f',[Desconto]))+'  '+
        PreencheEspacoEsq(8,PrecoUnit)+'  '+
        PreencheEspacoEsq(8,format('%.2f',[StrToFloat(PrecoUnit)*(Quantidade-Bonificacao)]))+' '+
        PreencheEspacoEsq(5,format('%.2f',[FieldByName('Aliquota').asFloat])));
      Next;
    end;
    fMxResumoPedido.memResumo.Text:=memResumo.Text;
    First;
    AfterScroll:=Aux;
    CarregaDados;
    edtProduto.Text:=Item_Pedido_Venda1.FieldByName('Produto').asString;
    edtUnidade.Text:=Item_Pedido_Venda1.FieldByName('Unidade').asString;
    edtReferencia.Text:=Item_Pedido_Venda1.FieldByName('Referencia').asString;
    edtMarca.Text:=Item_Pedido_Venda1.FieldByName('Marca').asString;
    try
      foto:=DM.Configuracao1.PastaImagens+'\Produto\00'+
           '-'+IntToStr(Item_Pedido_Venda1.CodigoPRD)+'.JPG';
      imgProduto.Picture.LoadFromFile(foto);
    Except
      try
        Produto1.Close;
        Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
        Produto1.Open;
        foto:=DM.Configuracao1.PastaImagens+'\Grupo\00'+
           '-'+IntToStr(Produto1.CodigoGRP)+'.JPG';
        imgProduto.Picture.LoadFromFile(foto);
      except
        imgProduto.Picture:=nil;
      end;
    end;
  end;
  fMxResumoPedido.ShowModal;
end;

procedure TfMxPedidoMotCal_2.CarregarItemVenda;
var
  Foto:string;
Begin
  If not Item_Pedido_Venda1.IsEmpty Then
  Begin
    Item_Pedido_Venda1.CarregaDados;
    Produto1.Close;
    Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
    Produto1.Open;
    If not Produto1.IsEmpty Then
    Begin
      edtProduto.text:=Produto1.Descricao;
      edtUnidade.text:=Produto1.Unidade;
      edtReferencia.text:=Produto1.Referencia;
      edtMarca.text:=Produto1.Marca;
      try
        foto:=DM.Configuracao1.PastaImagens+'\Produto\00'+
           '-'+IntToStr(Produto1.CodigoPRD)+'.JPG';
        imgProduto.Picture.LoadFromFile(foto);
      Except
        try
          foto:=DM.Configuracao1.PastaImagens+'\Grupo\00'+
             '-'+IntToStr(Produto1.CodigoGRP)+'.JPG';
          imgProduto.Picture.LoadFromFile(foto);
        except
          imgProduto.Picture:=nil;
        end;
      end;
    End
    Else
    Begin
      edtProduto.Clear;
      edtUnidade.Clear;
      edtReferencia.Clear;
      edtMarca.Clear;
      imgProduto.Picture:=nil;
    End;
  End;
end;


procedure TfMxPedidoMotCal_2.imgProdutoDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgProduto.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Características: '+Produto1.Caracteristica);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Peso Líquido: '+format('%.2f',[Produto1.PesoLiquido]));
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Produto1.Obs);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxPedidoMotCal_2.edtDiasOrcamentoExit(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtDiasOrcamento.Text) then
    edtDiasOrcamento.Text := '0';
end;

procedure TfMxPedidoMotCal_2.Produto1CalcFields(DataSet: TDataSet);
begin
  Classificacao_fiscal1.Close;
  if Produto1.CodigoCLF = 0 then
  Begin
    Produto1.FieldByname('Aliquota').asFloat:=17;
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=1;
    Classificacao_fiscal1.Open;
  end
  else
  Begin
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCLF;
    Classificacao_fiscal1.Open;
    if Classificacao_fiscal1.IsEmpty then
      Produto1.FieldByname('Aliquota').asFloat:=17
    else
      Produto1.FieldByname('Aliquota').asFloat:=Classificacao_fiscal1.ICMS;
  end;
end;

procedure TfMxPedidoMotCal_2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(13) then
  Begin
    Key := #0;
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end
    else if SB_Salva.Enabled then
    Begin
      if edtCodigoPRD.Focused then
      Begin
        //edtQuantidade.SetFocus;
        SB_Salva.SetFocus;
        Exit;
      end;
      {if not VerificaFloatBranco(edtQuantidade.Text) then
        edtQuantidade.Text:='1';
      if (dblCodigoFUN.Text <> '') then
      Begin
        SB_Salva.SetFocus;
        SB_SalvaClick(sender);
      end
      else
        dblCodigoFUN.SetFocus;}
    end;
  end
  else if Key=chr(27) then
  Begin
    Key := #0;
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end
  else If key=chr(32) then
  Begin
    If edtCodigoCLI.Focused then
    Begin
      edtCodigoCLI.Clear;
      key:=chr(0);
      Application.CreateForm(TfCadCli, fCadCli);
      fCadCli.tag:=52;
      fCadCli.CentroCusto2.open;
      try
        fCadCli.CentroCusto2.LocalizarCod(StrToInt(edtClienteCNC.Text));
        fCadCli.dblCentroDeCusto.KeyValue := StrToInt(edtClienteCNC.Text);
      except
        fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
        fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
      end;
      With fCadCli.Cliente1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM CLIENTE '+
          ' WHERE CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
          ' AND CNC_CODIGO=:CNC_COdIGO ';
        Open;
      End;
      fCadCli.Showmodal;
      edtCodigoCLIExit(sender);
    End;
    if edtCodigoPRD.Focused then
    Begin
      edtCodigoPRD.Clear;
      key:=chr(0);
      Application.CreateForm(TfMxSPedProdMotCal, fMxSPedProdMotCal);
      with fMxSPedProdMotCal do
      Begin
        Tag:=73;
        if (CdUltimoGRP = 0) then
        Begin
          if (DM.Configuracao1.CodigoCNC = 91) then
            dblCodigoGRP.KeyValue := 11
          else
            dblCodigoGRP.KeyValue := Grupo1.CodigoGRP;
        end
        else
          dblCodigoGRP.KeyValue := CdUltimoGRP;
        dblCodigoGRPClick(sender);
        if CdUltimoSGP <> 0 then
          dblCodigoSGP.KeyValue := CdUltimoSGP
        else
          dblCodigoSGP.KeyValue := SubGrupo1.CodigoSGP;

        dblCodigoSGPClick(sender);
        ShowModal;
      end;
      try
        if SB_Novo.Enabled then
          SB_NovoClick(sender)
        else
          edtQuantidade.SetFocus;
      except
      end;
    end
    Else  if edtDesconto.Focused then
    Begin
      Key:=chr(0);
      Application.CreateForm(TfMxSPedDesc, fMxSPedDesc);
      with fMxSPedDesc do
      Begin
        Tag:=5;
        edtProduto.Text          := self.edtProduto.Text;
        edtUnidade.Text          := self.edtUnidade.Text;
        edtMarca.Text            := self.edtMarca.Text;
        edtReferencia.Text       := self.edtReferencia.Text;
        edtPreco.Text            := self.edtPrecoSugestao.Text;
        edtPrecoComDesconto.Text := self.edtPrecoSugestao.Text;
        if VerificaFloatBranco(self.edtDesconto.Text) then
          edtDescontoPercentual.Text   :=  self.edtDesconto.Text;
        ShowModal;
      end;
    end;
  End
  else if edtCodigoPRD.Focused then
  Begin
    If key='-' then
      key:='0'
    else If UpperCase(key)='C' then
      key:='0'
    else If UpperCase(key)='D' then
      key:='6';
  end;
end;
procedure TfMxPedidoMotCal_2.AtualizaControles(Cabecalho, Habilitar: Boolean);
begin
  IncluirCab1.Enabled          := not Habilitar;
  AlterarCab1.Enabled          := not Habilitar;
  Localizar1.Enabled           := not Habilitar;
  Salvarcabecalho1.Enabled     := (Cabecalho and Habilitar);
  CancelarCabecalho1.Enabled   := (Cabecalho and Habilitar);
  DetalhePedidoCab.Enabled     := not Habilitar;
  sbDetalhe.Enabled := not Habilitar;
  PagamentoAntecipadoCab.Enabled := not Habilitar;
  ExtPagamentoAntecipadoCab.Enabled := not Habilitar;
  DescontonoPedido1.Enabled    := not Habilitar;
  SalvarPedido1.Enabled        := not Habilitar;
  FinalizarPedido1.Enabled     := not Habilitar;
  CancelarPedido1.Enabled      := not Habilitar;
  InfCrdito1.Enabled           := not Habilitar;
  Incluir1.Enabled             := not Habilitar;
  Alterar1.Enabled             := not Habilitar;
  Excluir1.Enabled             := not Habilitar;
  ImprimirPedido1.Enabled      := not Habilitar;
  ImprimirPromissoria1.Enabled := not Habilitar;
  ImprimirCarnnet1.Enabled     := not Habilitar;
  ImprimirCupom1.Enabled       := not Habilitar;
  SB_Novo.Enabled              := not Habilitar;
  SB_Alt.Enabled               := not Habilitar;  
  SB_Exc.Enabled               := not Habilitar;
  SB_CancelarPedido.Enabled    := not Habilitar;
  SB_Salva.Enabled             := ((not Cabecalho) and Habilitar);
  SB_Canc.Enabled              := ((not Cabecalho) and Habilitar);
  SB_LocPed.Enabled            := not Habilitar;
  SB_NovoPed.Enabled           := not Habilitar;
  SB_SalvarPedido.Enabled      := not Habilitar;
  SB_FinalizarPedido.Enabled   := not Habilitar;
  SB_FecharPedido.Enabled      := not Habilitar;
  SB_Frete.Enabled             := not Habilitar;

  edtPrecoDesconto.Enabled     := ((not Cabecalho) and Habilitar);

  if not Habilitar then
  Begin
    If Forma_de_Pagamento1.Prazo<>'0' then
      SB_Entrada.Enabled := ((Copy(Forma_de_Pagamento1.Prazo,1,1)='0')and(not AgenteFin1.JurosEntrada))
    Else
      SB_Entrada.Enabled := False;
  end
  else
    SB_Entrada.Enabled := False;
  EntradaPed.Enabled := SB_Entrada.Enabled;

  SB_Informacoes.Enabled       := not Habilitar;
  SB_AltPed.Enabled            := not Habilitar;
  SB_ImprimirPedido.Enabled    := not Habilitar;
  SB_SalvaPed.Enabled          := (Cabecalho and Habilitar);
  SB_CancPed.Enabled           := (Cabecalho and Habilitar);
  SB_Cupom.Enabled             := not Habilitar;
  SB_Promissoria.Enabled       := not Habilitar;
end;

procedure TfMxPedidoMotCal_2.SB_NovoPedClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  dblCodigoFUN.KeyValue:=-1;
  inserindo_alterando:='I';
  //inf_n_item:=0;
  inf_n_item:=1;
  SairPreco := True;
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir vendas neste centro de custo.');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');
  ckbMelhorData.Checked := False;
  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  Item_Pedido_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pedido_Venda1.Open;
  Item_Pedido_Venda1.AfterScroll:=Aux;
  If not Entidade.IsEmpty Then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      Open;
      if IsEmpty then
      Begin
        try
          Detalhe_Venda1.Deletar(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPDV.Text));
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_CODIGO='+edtCodigoPDV.Text);
          Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.text), 'Vazio - Novo');
        except
        end;
        Entidade.Close;
        Entidade.Open;
      end
      Else If (Entidade.Situacao<>3) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6) then
        Raise Exception.Create('Salve ou cancele o pedido antes de continuar');
    end;
  end;
  if not Entidade.FecharPedido then
    raise Exception.Create('Não foi possível liberar o pedido atual.');
  Item_Pedido_Venda1.Close;
  with Entidade do
  Begin
    if not Inserir(DM.Configuracao1.CodigoCNC,0,0,1,1,5,
       DM.Usuario1.CodigoUSU,0,0,''(*OBS*),''(*Documento*),DM.Configuracao1.Orcamento,
       DM.Configuracao1.CodigoCNC,DM.Configuracao1.DataHora,0(*DataPrevisão*)) then
      Raise Exception.Create('Erro ao gerar Pedido. Entre em contato com o suporte técnico!');
    Close;
    SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(SCodigo);
    Open;
    CarregaDados;
    AbrirPedido;
  end;
  NumeroOficial := 0;
  Entidade.AtualizaControles(True);
  dblTipoPagamento.KeyValue:=5;
  dblFormaPagamento.KeyValue:=1;
  dblFormaPagamentoClick(sender);
  if DM.Configuracao1.CodigoCliAVista > 0 then
  Begin
    edtClienteCNC.Text:=IntToStr(DM.Configuracao1.CodigoCNC);
    edtCodigoCLI.Text:=IntToStr(DM.Configuracao1.CodigoCliAVista);
  end;
  imgProduto.Picture:=nil;
  edtCodigoTPS.Text  :='0';
  edtCodigoCLI.Clear;
  edtRazaoSocial.Clear;
  edtCodigoPRD.Clear;
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;
  edtQuantidade.Clear;
  edtDesconto.Text :='0';
  edtPrecoUnitario.Clear;
  edtBonificacao.Clear;
  mskCNPJCPF.Clear;
  memResumo.Enabled:=False;
  memResumo.Clear;
  memObservacao.Clear;
  Alteracao:=False;
  AtualizaControles(True, True);
  edtDiasOrcamento.Enabled := True;
  edtDiasOrcamento.Color := clWindow;
  {if DM.Configuracao1.Empresa = empLuciano then
    dblCodigoFUN.KeyValue := -1;}
  edtCodigoCLI.SetFocus;

  dblCodigoFUN.Enabled := true;
end;

procedure TfMxPedidoMotCal_2.SB_LocPedClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');

  if not Entidade.IsEmpty then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      Open;
      if IsEmpty then
      Begin
        try
          Detalhe_Venda1.Deletar(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPDV.Text));
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_CODIGO='+edtCodigoPDV.Text);
          Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.text), 'Vazio - Localizar');
        except
        end;
        Entidade.LimpaCampos;
        imgFotoCliente.Picture:=nil;
      end;
    end;
  end;

  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  Item_Pedido_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pedido_Venda1.Open;
  Item_Pedido_Venda1.AfterScroll:=Aux;
  If not Entidade.IsEmpty Then
  Begin
    If (Entidade.Situacao<>3) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6) then
      Raise Exception.Create('Salve ou cancele o pedido antes de continuar')
    Else If (Entidade.Situacao<>1) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6) then
        if MessageDlg('Deseja sair sem finalizar o Pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
  End;
  cancelarloc:=True;
  Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
  fMxSPedLoc.tag:=16;
  fMxSPedLoc.sFiltrarServico := ' AND (PDV_SERVICO=0 OR PDV_SERVICO IS NULL) ';
  fMxSPedLoc.Showmodal;

  If not cancelarloc Then
  Begin
    if not Entidade.FecharPedido then
      raise Exception.Create('Não foi possível liberar o pedido atual.')
    else
      AtualizaControles(False,False);
    Aux:=Item_Pedido_Venda1.AfterScroll;
    Item_Pedido_Venda1.AfterScroll:=nil;
    Item_Pedido_Venda1.Close;
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text;
    Entidade.Open;
    Entidade.AbrirPedido;
    dblTipoPagamento.KeyValue  := Entidade.TipoPag;
    dblFormaPagamento.KeyValue := Entidade.CodigoFPG;
    dblFormaPagamentoClick(sender);
    Entidade.CarregaDados;
    edtCodigoCLIExit(sender);
    Item_Pedido_Venda1.Open;
    Item_Pedido_Venda1.AfterScroll:=Aux;

    // Carregar informações do Produto
    CarregarItemVenda();

    If not Item_Pedido_Venda1.IsEmpty then
    Begin
      If Forma_de_Pagamento1.Prazo<>'0' then
        SB_Entrada.Enabled := ((Copy(Forma_de_Pagamento1.Prazo,1,1)='0')and(not AgenteFin1.JurosEntrada))
      Else
        SB_Entrada.Enabled := False;
    end;
    EntradaPed.Enabled := SB_Entrada.Enabled;

    //Gerar resumo
    memResumo.Text := '0,00';
  End;
  if (mskMelhorData.Text <> '  /  /    ') and (mskMelhorData.Text <> '') then
    ckbMelhorData.Checked := True
  else
    ckbMelhorData.Checked := False;

  NumeroOficial := 0;
end;

procedure TfMxPedidoMotCal_2.SB_AltPedClick(Sender: TObject);
begin
  inserindo_alterando:='A';
  if Entidade.IsEmpty then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');
  Entidade.PreparaAlteracao;
  if (Forma_de_Pagamento1.Prazo<>'') and (Forma_de_Pagamento1.Prazo<>'0')then
     ckbMelhorData.Enabled     :=True;
  AtualizaControles(True, True);
  memResumo.Enabled:=False;
  Alteracao:=True;
  edtCodigoCLI.SetFocus;

  dblCodigoFUN.Enabled := true;
end;

procedure TfMxPedidoMotCal_2.SB_SalvaPedClick(Sender: TObject);
Var
  Aux:TDataSetNotifyEvent;
  CdCNC, CdPDV: integer;
begin
  if dblCodigoFUN.KeyValue<0 then
    Raise Exception.Create('Vendedor inválido');
    
  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
  Begin
    edtCodigoCLI.SetFocus;
    Raise exception.Create('Código do Cliente inválido!');
  end;
  If (dblTipoPagamento.Text = '') then
    Raise Exception.Create('Tipo de pagamento faltando!');
  If (dblFormaPagamento.Text = '')then
    Raise Exception.Create('Forma de pagamento faltando!');
  If (dblCodigoAGF.Text = '') then
    Raise Exception.Create('Agente financeiro faltando!');
  if not VerificaData(mskMelhorData.Text) then
    Raise Exception.Create('Melhor data inválida!')
  else if mskMelhorData.Text = '  /  /    ' then
    Begin
    //
    end
  else if (Trunc(StrToDate(mskMelhorData.Text)) > Trunc(DM.Configuracao1.Data)+(DM.Configuracao1.MelhorData)) then
    Raise Exception.Create('Melhor data acima do permitido!');
  if ckbMelhorData.Checked then
    if StrToDate(mskMelhorData.Text) < DM.Configuracao1.Data then
      Raise Exception.Create('Melhor data inválida!');

  if (Forma_de_Pagamento1.Prazo[1] <> '0') and
     (Entidade.PagamentoAntecipado > 0) then
    Raise exception.Create('Foi definido pagamento antecipado, logo é obrigatório a entrada na Forma de Pagamento ou venda à vista!');

  CdCNC := DM.Configuracao1.codigoCNC;
  CdPDV := StrToInt(edtCodigoPDV.Text);

  if (dblTipoPagamento.KeyValue <> 412) and //Boleto Bancário
     ((dblTipoPagamento.KeyValue <> 5) or //Dinheiro/Promissória
      (dblFormaPagamento.KeyValue <> 1)) and //Dif. A Vista
     (Informacoes1.Boleto) then
  Begin
    if MessageDlg('Tipo de Pagamento diferente do cadastrado para o cliente! (Boleto)!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=47;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0)then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão Trocar TipoPag/FormaPag na Venda!');
          end
          else
            DM.Usuario1.GeraLog(6750, CdCNC, CdPDV,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' VENDA-TIPO_PAG');
        end
        else
        begin
          free;
          exit;
        end;
        free;
      End;
    end
    else
      DM.Usuario1.GeraLog(6750, CdCNC, CdPDV,
        'VENDA-TIPO_PAG');
  end
  else if (dblTipoPagamento.KeyValue <> 412) and
          (Informacoes1.Boleto) then
  Begin
    if MessageDlg('Cliente definido para Boleto bancário!'+#13+
                  'Deseja alterar?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      dblTipoPagamento.KeyValue := 412;
      dblFormaPagamentoClick(sender);
    end;
  end;

  if (Informacoes1.CodigoFPG > 0) and
     (dblTipoPagamento.KeyValue <> 13) and //Dif. Cartão
     (dblFormaPagamento.KeyValue <> 1) then //Dif. de A Vista
  Begin
    if dblFormaPagamento.KeyValue <> Informacoes1.CodigoFPG then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM FORMA_DE_PAGAMENTO '+
          ' WHERE FPG_CODIGO='+IntToStr(Informacoes1.CodigoFPG);
        Open;
      end;
      if MessageDlg('Forma de Pagamento diferente da cadastrada para o cliente! ('+DM.QR_Consultas.FieldByName('FPG_DESCRICAO').asString+')'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=47;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão Trocar TipoPag/FormaPag na Venda!');
            end
            else
              DM.Usuario1.GeraLog(6750, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' VENDA-FORMA_PAG');
          end
          else
          begin
            free;
            exit;
          end;
          free;
        End;
      end
      else
        DM.Usuario1.GeraLog(6750, CdCNC, CdPDV,
          'VENDA-FORMA_PAG');
    end;
  end
  else if (dblFormaPagamento.KeyValue <> Informacoes1.CodigoFPG) and
          (Informacoes1.CodigoFPG > 0) then
  Begin
    if MessageDlg('Cliente com Forma de Pagamento definida!'+#13+
                  'Deseja alterar?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      dblFormaPagamento.KeyValue := Informacoes1.CodigoFPG;
      dblFormaPagamentoClick(sender);
    end;
  end;

  Entidade.AtualizaControles(False);
  AtualizaControles(True, False);
  ckbMelhorData.Enabled:=False;
  mskMelhorData.Enabled:=False;
  dblCodigoAGF.Enabled:=False;
  memResumo.Enabled:=True;
  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  Item_Pedido_Venda1.Close;
  With Entidade do
  Begin
    if (mskMelhorData.Text <> '  /  /    ') and (mskMelhorData.Text <> '') then
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',CNC_CLIENTE='+edtClienteCNC.Text+
        ',CLI_CODIGO='+edtCodigoCLI.Text+
        ',PDV_DIAS_RESERV='+edtDiasOrcamento.Text+
        ',PDV_MELHOR_DATA="'+MesDia(mskMelhorData.Text)+'" '+
        ',PDV_TIPO_PAG='+IntToStr(Parametro1.CodigoPAR)+
        ',FPG_CODIGO='+IntToStr(Forma_de_Pagamento1.CodigoFPG)+
        ',AGF_CODIGO='+IntToStr(AgenteFin1.CodigoAGF)+
        ',PDV_DOCUMENTO="'+edtDocumento.Text+'" '+
        ',PDV_SITUACAO=0'+
        ',PDV_OBS="'+memObservacao.Text+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV))
    else
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_MELHOR_DATA=NULL '+
        ',PDV_DIAS_RESERV='+edtDiasOrcamento.Text+
        ',CNC_CLIENTE='+edtClienteCNC.Text+
        ',CLI_CODIGO='+edtCodigoCLI.Text+
        ',PDV_TIPO_PAG='+IntToStr(Parametro1.CodigoPAR)+
        ',FPG_CODIGO='+IntToStr(Forma_de_Pagamento1.CodigoFPG)+
        ',AGF_CODIGO='+IntToStr(AgenteFin1.CodigoAGF)+
        ',PDV_DOCUMENTO="'+edtDocumento.Text+'" '+
        ',PDV_SITUACAO=0'+
        ',PDV_OBS="'+memObservacao.Text+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(cdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

    Entidade.GeraLog(6600, CdCNC, CdPDV, 'CNCCLI:'+IntToStr(ClienteCNC)+
      ' CLI:'+edtCodigoCLI.Text+
      ' TipoPag:'+IntToStr(dblTipoPagamento.KeyValue)+
      ' FPG:'+IntToStr(dblFormaPagamento.KeyValue)+
      ' AGF:'+IntToStr(dblCodigoAGF.KeyValue));

    Close;
    Open;
  end;
  Item_Pedido_Venda1.Open;
  Item_Pedido_Venda1.AfterScroll:=Aux;

  //Recalcular os Preços
  if (not Item_Pedido_Venda1.IsEmpty) then
    RecalcularPrecos;
  Item_Pedido_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pedido_Venda1.Open;

  if not Item_Pedido_Venda1.IsEmpty then
  Begin
    Item_Pedido_Venda1.CarregaDados;
    CarregarItemVenda;
    SB_SalvarPedidoClick(sender);
  end
  else
    SB_NovoClick(sender);

  edtDiasOrcamento.Enabled := False;
  edtDiasOrcamento.Color := AlteraCorComponentes;

  dblCodigoFUN.Enabled := false;

  //Anderson
  if inserindo_alterando='I' then //se estiver inserindo
    imprimi_cabecalho;
end;

procedure TfMxPedidoMotCal_2.SB_CancPedClick(Sender: TObject);
var
  sCliente:String;
begin
  Entidade.AtualizaControles(False);
  AtualizaControles(True,False);
  If Alteracao then
  Begin
    sCliente:=edtCodigoCLI.Text;
    Entidade.CarregaDados;
    edtCodigoCLI.Text:=sCliente;
  End
  Else
  Begin
    try
      Detalhe_Venda1.Deletar(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPDV.Text));
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text);
      Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.text), 'Vazio - Cancelar Cabecalho');
    except
    end;
  end;
  memResumo.Enabled:=True;
  ckbMelhorData.Enabled:=False;
  edtDiasOrcamento.Enabled := False;
  edtDiasOrcamento.Color := AlteraCorComponentes;
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos
  else
    Entidade.CarregaDados;

  dblCodigoFUN.Enabled := false;
end;

procedure TfMxPedidoMotCal_2.SB_EntradaClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if (Entidade.IsEmpty) then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');
  if Item_Pedido_Venda1.IsEmpty then
    ShowMessage('Coloque os itens primeiro!')
  else
  Begin
    aux := Item_Pedido_Venda1.AfterScroll;
    Item_Pedido_Venda1.AfterScroll:=Nil;
    Application.CreateForm(TfMXValorEntrada, fMXValorEntrada);
    with fMXValorEntrada do
    Begin
      Tag:=4;
      Showmodal;
    end;
    Item_Pedido_Venda1.First;
    Item_Pedido_Venda1.AfterScroll:=Aux;
    CarregarItemVenda;
  end;
end;

procedure TfMxPedidoMotCal_2.SB_NovoClick(Sender: TObject);
begin
  QtdAnt := 0;
  if not Item_Pedido_Venda1.Active then
    Raise Exception.Create('Crie primeiro o Cabeçalho');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');
  if Item_Pedido_Venda1.RecordCount >= DM.Configuracao1.MaxItensNota then
    Raise Exception.Create('Quantidade Máxima de itens por nota!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if Entidade.IsEmpty then
    Raise Exception.Create('Crie primeiro o cabeçalho do Pedido!');
  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
  Begin
    ShowMessage('Cliente inválido!');
    Exit;
  end
  else
  Begin
    AtualizaControles(False, True);
    Item_Pedido_Venda1.PreparaInsercao;
    {if DM.Configuracao1.Empresa = empMotical then
      dblCodigoFUN.Enabled := False;}
    try
      {if (Item_Pedido_Venda1.IsEmpty) and
         VerificaInteiroBranco(Cliente1.Conjuge) then
        dblCodigoFUN.KeyValue := StrToInt(Cliente1.Conjuge);}
    except
    end;
    edtProduto.Clear;
    edtUnidade.Clear;
    edtReferencia.Clear;
    edtMarca.Clear;
    imgProduto.Picture:=nil;
    memResumo.Enabled:=False;
    //edtCodigoPRD.SetFocus;
    edtQuantidade.SetFocus;

    //Alan 25-04-2006
    ckbFiscal.Checked := False;
    //

    //verificar se a venda é a vista
    If (Forma_de_Pagamento1.Prazo='0') or (Forma_de_Pagamento1.Prazo='') then
      ckbAVista.Checked:=true
    Else
      ckbAVista.Checked:=false;
    if edtDesconto.Text = '' then
      edtDesconto.Text := '0';
  end;
end;

procedure TfMxPedidoMotCal_2.SB_ExcClick(Sender: TObject);
var
  QTD, vQtdSaldo:Double;
  PRD:Integer;
  Trans:Boolean;
  vMotivo: string;
begin
  inf_cancelar:=Item_Pedido_Venda1.fieldbyname('INF_N_ITEM').AsString;

  If Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Não existem registros para serem deletados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');

  //if Item_Pedido_Venda1.RecordCount <= 1 then
    //Raise Exception.Create('Não é possível excluir o último item!');

  //Verificar Produto com entrega antecipada
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
      ' WHERE MEF_ENT_CODIGO='+IntToStr(Entidade.CodigoPDV)+
      ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PRD_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPRD)+
      ' AND MEF_TIPO_MOV=4200 '; //Entrega Antecipada
    Open;
    vQtdSaldo := FieldByName('QTD').asFloat;

    Close;
    SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
      ' WHERE MEF_ENT_CODIGO='+IntToStr(Entidade.CodigoPDV)+
      ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PRD_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPRD)+
      ' AND MEF_TIPO_MOV=4210 '; //Ext. Entrega Antecipada
    Open;
    vQtdSaldo := vQtdSaldo - FieldByName('QTD').asFloat;

    if vQtdSaldo > 0 then
      Raise exception.Create('Produto com entrega antecipada!');
  end;

  //Verifica se o Pedido foi impresso
  if (Entidade.Impresso) or (DM.Configuracao1.Caixa) then
  Begin
    //Verifica permissão para excluir item
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3640)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=47;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (usuario1.Permissoes.IndexOf(IntToStr(3640)) < 0) then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para Excluir Item de Pedido de Venda!');
          end;
        end
        else
        begin
          free;
          exit;
        end;
        free;
      End;
    End;
  end;

  PRD:=Item_Pedido_Venda1.CodigoPRD;
  QTD:=Item_Pedido_Venda1.Quantidade;

  vMotivo := '';

  if Item_Pedido_Venda1.deletarauto(vMotivo) then
  Begin
    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        if edtDiasOrcamento.Text = '0' then
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
            ' IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(QTD)+
            ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PRD_CODIGO='+IntToStr(PRD));

        if Item_Pedido_Venda1.IsEmpty then
        begin
           memResumo.Clear;
           //dblCodigoFUN.KeyValue := -1;
           imgProduto.Picture:=nil;
           edtCodigoTPS.Clear;
           edtCodigoPRD.Clear;
           edtProduto.Clear;
           edtUnidade.Clear;
           edtReferencia.Clear;
           edtMarca.Clear;
           edtQuantidade.Clear;
           edtDesconto.Clear;
           edtPrecoUnitario.Clear;
           edtBonificacao.Clear;
           edtPrecoDesconto.Text := '0';
           memResumo.Clear;
        end;
        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
          ' PDV_SITUACAO=3 '+
          ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
          ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND PDV_CODIGO='+edtCodigoPDV.Text);

        //Anderson
//        if DM.Configuracao1.DiretoImpFiscal then
//        Begin
//          try
//            DM.ImpFiscalB1.CancelaItemGenerico(inf_cancelar);
//          except
//          end;
//        end;
        // // // //

        If DM.Configuracao1.ControleTransacao then
          Commit;
      except
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          end;
      end;
    end;
  end;
end;

procedure TfMxPedidoMotCal_2.SB_SalvaClick(Sender: TObject);
{Var
  mensagem, sEspecial, sPaciente, TAM, sDescricaoFPG: String;
  trans, vImprimirAouD: Boolean;
  i, CdCNC, CdPDV, iEstado, CdPRD, sFiscal: integer;
  QuantidadeVendida, vDesconto, vLimSimples, vLimEspecial, vLimSimplesPrazo,
    vLimEspecialPrazo, vDescCliente, vDescClientePrazo, vQtdVendida: Double;}
begin
  mensagem:='';
  //Andedrson
  QuerySelect.Close;
  QuerySelect.SQL.Text:='SELECT * FROM ITEM_DE_PEDIDO_DE_VENDA WHERE PDV_CODIGO='''+edtCodigoPDV.Text+''' '+
                        ' AND PRD_CODIGO='''+edtCodigoPRD.Text+''' AND CNC_CODIGO='''+Inttostr(DM.Configuracao1.CodigoCNC)+'''';
  QuerySelect.Open;
  if not QuerySelect.IsEmpty then
  begin
    if Strtofloat(edtQuantidade.Text)<Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat then
      raise exception.Create('A quantidade digitada é menor do que a anterior, exclua o item e adicione com o valor desejado!');
  end;
  //
  if not VerificaFloatBranco(edtQuantidade.Text) then
    edtQuantidade.Text:='1';
  if not VerificaFloatBranco(edtCodigoPRD.Text) then
    mensagem:= mensagem + 'Código do Produto inválido!'+#13;
  if not VerificaFloatBranco(edtQuantidade.Text) then
    mensagem:= mensagem + 'Quantidade inválida!'+#13;
  if not VerificaFloat(edtBonificacao.Text) then
    mensagem:= mensagem + 'Bonificação inválida!'+#13;

  if mensagem <> '' then
    Raise Exception.Create(mensagem);

  if StrToFloat(edtQuantidade.Text) <= 0 then
    raise Exception.Create('Quantidade digitada incorretamente!');

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;

  //Alan 25-04-2006
  CdPRD := strtoint(edtCodigoPRD.Text);
  if (ckbFiscal.Checked = True) then
    sFiscal := 1
  else
    if (ckbFiscal.Checked = False) then
      sFiscal := 0;
  //

  iEstado := Item_Pedido_Venda1.Estado;

  with DM.QR_Consultas do
  Begin
    if Cliente1.Convenio > 0 then
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CLIENTE '+
        ' WHERE CNC_CODIGO='+IntToStr(Cliente1.ConvenioCNC)+
        ' AND CLI_CODIGO='+IntToStr(Cliente1.Convenio);
      Open;
      vDescCliente      := FieldByName('CLI_DESCONTO').asFloat;
      vDescClientePrazo := FieldByName('CLI_DESCONTO_PRAZO').asFloat;
    end
    else
    Begin
      vDescCliente      := Cliente1.Desconto;
      //vDescClientePrazo := Cliente1.DescontoPrazo;
      vDescClientePrazo := Cliente1.Fieldbyname('CLI_DESCONTO_PRAZO').AsFloat;
    end;

    //Verificar Mistura de Grupo Especiais com Normais
    Close;
    SQL.Text := 'SELECT TOP 1 GRP_ESPECIAL '+
      ' FROM GRUPO G1, PRODUTO P1 '+
      ' WHERE P1.PRD_CODIGO='+edtCodigoPRD.Text+
      ' AND P1.GRP_CODIGO=G1.GRP_CODIGO ';
    Open;
    sEspecial := FieldByName('GRP_ESPECIAL').asString;

    Close;
    SQL.Text := 'SELECT TOP 1 I1.PRD_CODIGO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1, GRUPO G1 '+
      ' WHERE I1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND I1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
      ' AND G1.GRP_ESPECIAL<>'+sEspecial+
      ' AND I1.PRD_CODIGO=P1.PRD_CODIGO '+
      ' AND P1.GRP_CODIGO=G1.GRP_CODIGO ';
    Open;
    if not IsEmpty then
      Raise exception.Create('Não é permitido misturar Grupo Especial com Normal!');
  end;

  try
    vDesconto := Arredonda(100-(StrToFloat(edtPrecoDesconto.Text)/StrToFloat(edtPrecoSugestao.Text)*100));
  except
    vDesconto := 0;
  end;

  vLimSimples  := Arredonda(DM.Configuracao1.JurosNorm);
  vLimEspecial := Arredonda(DM.Configuracao1.JurosEsp);
  vLimSimplesPrazo  := Arredonda(DM.Configuracao1.LBMDesconto60);
  vLimEspecialPrazo := Arredonda(DM.Configuracao1.LBMJuros60);

  if not VerificaInteiroBranco(edtBonificacao.Text) then
    edtBonificacao.Text := '0';

  if not VerificaInteiroBranco(edtCodigoTPS.Text) then
    edtCodigoTPS.Text := '0';

  //Sendo Tabela de Preço verifica Bonificação
  if StrToInt(edtCodigoTPS.Text) <> 0 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text:='SELECT * '+
        ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
        'WHERE T1.TPS_CODIGO='+edtCodigoTPS.Text+
        ' AND ('+sTabelaPrecoCPD+' OR T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+') '+
        ' AND (T1.CLI_CODIGO=0 '+
        ' OR (T1.CNC_CLIENTE='+edtClienteCNC.Text+
        ' AND T1.CLI_CODIGO='+edtCodigoCLI.Text+') '+
        '  OR (T1.CLI_CODIGO=-1 '+
        '  AND EXISTS (SELECT TBP_CODIGO FROM TABELA_DE_PRECO_CLIENTE TBC '+
        '      WHERE TBC.CNC_TABELA=T1.CNC_CODIGO '+
        '      AND TBC.TBP_CODIGO=T1.TPS_CODIGO '+
        '      AND TBC.CNC_CLIENTE='+edtClienteCNC.Text+
        '      AND TBC.CLI_CODIGO='+edtCodigoCLI.Text+'))) '+
        ' AND I1.SGP_CODIGO='+IntToStr(Produto1.CodigoSGP)+
        ' AND I1.GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
        ' AND (I1.PRD_CODIGO=0 OR I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+') '+
        ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
        ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
        ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
      Open;
      if IsEmpty then
        Raise exception.Create('Tabela de Preço não encontrada/disponível!');
      //Verifica Bonificação
      if StrToInt(edtBonificacao.text) <> 0 then
        if Arredonda(StrToFloat(edtQuantidade.Text)/StrToFloat(edtBonificacao.text)) < FieldByName('ITS_BONIFICACAO').asFloat then
          Raise Exception.Create('Bonificação acima da Permitida na Tabela!');

      vLimSimples       := Arredonda(DM.qr_consultas.FieldByName('TPS_DESCONTO_SIMPLES').asFloat);
      vLimEspecial      := Arredonda(DM.qr_consultas.FieldByName('TPS_DESCONTO_ESPECIAL').asFloat);
      vLimSimplesPrazo  := Arredonda(DM.qr_consultas.FieldByName('TPS_DESCONTO_SIMPLES_PRAZO').asFloat);
      vLimEspecialPrazo := Arredonda(DM.qr_consultas.FieldByName('TPS_DESCONTO_ESPECIAL_PRAZO').asFloat);
      if (vDescCliente > 0) or
         (vDescClientePrazo > 0) then
      Begin
        vLimSimples       := 0;
        vLimSimplesPrazo  := 0;
        vLimEspecial      := 0;
        vLimEspecialPrazo := 0;
      end;
    end;
  end;

  if (vDescCliente > 0) or
     (vDescClientePrazo > 0) then
  Begin
    vLimSimples       := 0;
    vLimSimplesPrazo  := 0;
    vLimEspecial      := 0;
    vLimEspecialPrazo := 0;
  end;

  if StrToFloat(edtPrecoDesconto.Text) < StrToFloat(format('%.2f',[Produto1.Precomedio])) then
  Begin
    if MessageDlg('Produto: '+Produto1.Descricao+#13+
                  'com preço abaixo do Mínimo!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=47;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão vender abaixo do Preço Mínimo!');
          end
          else
            DM.Usuario1.GeraLog(3740, CdCNC, CdPDV,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-ABAIXO PRECO MINIMO');
        end
        else
        begin
          free;
          exit;
        end;
        free;
      End;
    end
    else
      DM.Usuario1.GeraLog(3740, CdCNC, CdPDV,
        ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-ABAIXO PRECO MINIMO');
  End
  //Verifica se o usuário tem permissão para liberar desconto
  else if vDesconto > 0 then
  Begin
    if DM.Configuracao1.Empresa = empMotical then
    Begin
      If (StrToFloat(edtPrecoDesconto.Text) < StrToFloat(edtPrecoSugestao.text)) Then
      Begin
        if MessageDlg('Produto: '+Produto1.Descricao+#13+
                      'Preço menor que o sugerido!'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=47;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
              end
              else
                DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-ABAIXO SUGERIDO');
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end
        else
          DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-ABAIXO SUGERIDO');
      End;
    end
    else //Somente Diferente de Motical com Desconto Concedido
    Begin
      // Verifica se o usuário tem permissão para liberar desconto à prazo
      If (vDesconto > vLimEspecial) and
         (Forma_de_Pagamento1.Prazo='0') Then //A Vista
      Begin
        if MessageDlg('Produto: '+Produto1.Descricao+#13+
                      'Desconto atribuído (Total)!'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
           (not vCentraliza) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=47;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
              end
              else
                DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO ACIMA DO ESPECIAL');
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end
        else
          DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO ACIMA DO ESPECIAL');
      end
      else If (vDesconto >  vLimSimples) and
              (vDesconto <= vLimEspecial)  and
              (Forma_de_Pagamento1.Prazo='0') Then //A Vista
      Begin
        if MessageDlg('Produto: '+Produto1.Descricao+#13+
                      'Desconto atribuído (Especial)!'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
           (not vCentraliza) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=47;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
                 (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
              end
              else
                DM.Usuario1.GeraLog(1810, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO ESPECIAL');
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end
        else
          DM.Usuario1.GeraLog(1810, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO ESPECIAL');
      End
      Else If (vDesconto <= vLimSimples) and
              (Forma_de_Pagamento1.Prazo = '0') Then //A Vista
      Begin
        if MessageDlg('Produto: '+Produto1.Descricao+#13+
                      'Desconto atribuído! (Normal)'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND //Desc. Total
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) AND //Desc. Especial
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) AND //Abaixo do Mínimo
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) AND //Desc. Simples
           (not vCentraliza) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=47;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND
                 (Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) AND
                 (Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) AND
                 (Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) then
              begin
                free;
                raise Exception.Create('Usuário não tem Permissão para Liberar Desconto! (Normal)');
              end
              else
                DM.Usuario1.GeraLog(3800, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO NORMAL');
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end
        else
          DM.Usuario1.GeraLog(3800, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO NORMAL');
      end
      else //Venda a Prazo com Desconto
      Begin
        if (vDesconto > vLimEspecialPrazo) then
        Begin
          if MessageDlg('Produto: '+Produto1.Descricao+#13+
                        'Desconto atribuído (Total-Prazo)!'+#13+
                        'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Liberacao Total
             (not vCentraliza) then
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              onClose:=nil;
              Tag:=47;
              Cancelar:=False;
              Showmodal;
              If not cancelar Then
              Begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
                begin
                  free;
                  raise Exception.Create('O usuário não tem permissão para liberar o desconto (Total-Prazo)!');
                end
                else
                  DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
                    'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                    ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO A PRAZO ACIMA DO ESPECIAL');
              end
              else
              begin
                free;
                exit;
              end;
              free;
            End;
          end
          else
            DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
              ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO A PRAZO ACIMA DO ESPECIAL');
        end
        else if (vDesconto > vLimSimplesPrazo) and
                (vDesconto <= vLimEspecialPrazo) then
        Begin
          if MessageDlg('Produto: '+Produto1.Descricao+#13+
                        'Desconto atribuído (Especial-Prazo)!'+#13+
                        'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Liberacao Total
             (not vCentraliza) then
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              onClose:=nil;
              Tag:=47;
              Cancelar:=False;
              Showmodal;
              If not cancelar Then
              Begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
                   (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Liberacao Total
                begin
                  free;
                  raise Exception.Create('O usuário não tem permissão para liberar o desconto (Especial-Prazo)!');
                end
                else
                  DM.Usuario1.GeraLog(7370, CdCNC, CdPDV,
                    'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                    ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO A PRAZO ESPECIAL');
              end
              else
              begin
                free;
                exit;
              end;
              free;
            End;
          end
          else
            DM.Usuario1.GeraLog(7370, CdCNC, CdPDV,
              ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO A PRAZO ESPECIAL');
        end
        else //Desconto Menor ou igual ao Desconto Normal (Venda à prazo)
        Begin
          if MessageDlg('Produto: '+Produto1.Descricao+#13+
                        'Desconto atribuído (Normal-Prazo)!'+#13+
                        'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3600)) < 0) and //Liberacao Normal-Prazo
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Liberacao Total
             (not vCentraliza) then
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              onClose:=nil;
              Tag:=47;
              Cancelar:=False;
              Showmodal;
              If not cancelar Then
              Begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(3600)) < 0) and //Desconto Simples-Prazo
                   (Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
                   (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Liberacao Total
                begin
                  free;
                  raise Exception.Create('O usuário não tem permissão para liberar o desconto (Normal-Prazo)!');
                end
                else
                  DM.Usuario1.GeraLog(3600, CdCNC, CdPDV,
                    'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                    ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO A PRAZO NORMAL');
              end
              else
              begin
                free;
                exit;
              end;
              free;
            End;
          end
          else
            DM.Usuario1.GeraLog(3600, CdCNC, CdPDV,
              ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-DESCONTO A PRAZO NORMAL');
        end;
      end;
    end;
  end;

  QuantidadeVendida := StrToFloat(edtQuantidade.Text) - QtdAnt;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
    open;
    If isempty then
    begin
      if not Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPRD.Text),0(*CdFUN*),
          0,0,0,0,0,DM.Configuracao1.DataHora,0,0,0,0,0,0) then
        Raise exception.Create('Falha ao Gerar Item de Estoque!');
      Close;
      ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
      open;
    end;
    if (not Produto1.Servico) and (Saldo < QuantidadeVendida) then
      ShowMessage('Quantidade acima do estoque!');
  end;

  if StrToInt(edtCodigoLOT.Text) > 0 then
  Begin
    with Lote1 do
    Begin
      if (not Lote1.Active) or
         (CodigoLOT <> StrToInt(edtCodigoLOT.Text)) then
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
        ParamByName('LOT_CODIGO').asInteger := StrToInt(edtCodigoLOT.Text);
        Open;
        if IsEmpty then
          Raise exception.Create('Lote inválido!');
      end;
    end;
    DM.Item_de_Estoque_Detalhe1.Close;
    DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := StrToInt(edtCodigoLOT.Text);
    DM.Item_de_Estoque_Detalhe1.open;
    If DM.Item_de_Estoque_Detalhe1.isempty then
    begin
      DM.Item_de_Estoque_Detalhe1.Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoLOT.Text),StrToInt(edtCodigoPRD.Text));
      DM.Item_de_Estoque_Detalhe1.Close;
      DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := StrToInt(edtCodigoLOT.Text);
      DM.Item_de_Estoque_Detalhe1.open;
    end;
  end
  else if DM.Configuracao1.Empresa = empLuciano then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE_DETALHE '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND IED_QTD_FISICO>0 ';
      Open;
      if not isEmpty then
        if MessageDlg('Existe lote para esse produto.'+
                      'Deseja continuar sem definir o Lote?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
    end;
  end;

  sPaciente := '';
  if (Produto1.FieldByName('GRP_ESPECIAL').asInteger = 1) and
     (DM.Configuracao1.Empresa = empMotical) then
    sPaciente := UpperCase(InputBox('Dados do Item' , Produto1.Descricao+#13+'Paciente:', ''));

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Anderson, ele é inserido depois da impressao do item
      {if not Item_Pedido_Venda1.FinalizaEdicao(0,0,0,Produto1.Servico,0(*Sequencia*),sPaciente) then
        Raise exception.Create('');}

      //Fazer reserva no estoque (Versao que evita concorrencia)
      if edtDiasOrcamento.Text = '0' then
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
          ' IES_SRESERVADO=IES_SRESERVADO+'+VirgPonto(QuantidadeVendida)+
          ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque1.CodigoPRD)+
          ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque1.CodigoCNC));

      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_SITUACAO=0 '+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text);

      If DM.Configuracao1.ControleTransacao then
        Commit;

      AtualizaControles(False, False);

      {if iEstado = 1 then
        SB_NovoClick(sender);}
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;

  //Anderson
  imprimi_item;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //inc(inf_n_item);

//      if not Item_Pedido_Venda1.FinalizaEdicao(0,0,0,Produto1.Servico,0(*Sequencia*),sPaciente) then
//      begin
//        DM.ImpFiscalB1.CancelaItemAnterior;
//        Raise exception.Create('');
//      end;

      //verificar
      {if iEstado=2 then //alterando
      begin
        //Anderson
        if DM.Configuracao1.DiretoImpFiscal then
        Begin
          try
            inf_cancelar:=Item_Pedido_Venda1.fieldbyname('INF_N_ITEM').AsString;
            DM.ImpFiscalB1.CancelaItemGenerico(inf_cancelar);
            //alterar o INF_N_ITEM para o atual
          except
          end;
        end;
        // // // //
      end;}


      {DM.QuerySelect.Close;
      DM.QuerySelect.SQL.Text := 'SELECT MAX(INF_N_ITEM) MAX FROM ITEM_DE_PEDIDO_DE_VENDA WHERE PDV_CODIGO = '''+Entidade.fieldbyname('PDV_CODIGO').AsString+'''';
      DM.QuerySelect.Open;
      inf_n_item := DM.QuerySelect.Fieldbyname('MAX').AsInteger + 1;}

      //Alan 25-04-2006
      if (ckbFiscal.Checked = True) then
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET IPV_FISCAL='+inttostr(sFiscal)+
          ' ,INF_N_ITEM='''+inttostr(inf_n_item)+''' WHERE PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PRD_CODIGO='+inttostr(CdPRD))
      else
        if (ckbFiscal.Checked = False) then
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET IPV_FISCAL='+inttostr(sFiscal)+
            ' ,INF_N_ITEM='''+inttostr(inf_n_item)+''' WHERE PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
            ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND PRD_CODIGO='+inttostr(CdPRD));

      inc(inf_n_item);

      Item_Pedido_Venda1.Close;
      Item_Pedido_Venda1.Open;
      // // //

      {if Item_Pedido_Venda1.FinalizaEdicao(0,0,0,Produto1.Servico) then
      Begin
        //Fazer reserva no estoque (Versao que evita concorrencia)
        if edtDiasOrcamento.Text = '0' then
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
            ' IES_SRESERVADO=IES_SRESERVADO+'+VirgPonto(vQtdVendida)+
            ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque1.CodigoPRD)+
            ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque1.CodigoCNC));

        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
          ' PDV_SITUACAO=0 '+
          ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND PDV_CODIGO='+edtCodigoPDV.Text);

        if iEstado = 1 then
          SB_NovoClick(sender)
        else
          AtualizaControles(False, False);
      end;}

      If DM.Configuracao1.ControleTransacao then
        if trans then
          Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
  // // // //

  memResumo.Enabled:=True;
  memResumo.Clear;

  SB_NovoClick(SB_Novo);
end;

procedure TfMxPedidoMotCal_2.SB_CancClick(Sender: TObject);
var
  aux:TNotifyEvent;
  ult:integer;
begin
  ult:=dblCodigoFUN.KeyValue;
  aux := edtCodigoPRD.OnExit;
  edtCodigoPRD.OnExit := nil;
  QtdAnt := 0;
  Item_Pedido_Venda1.CancelaEdicao;
  AtualizaControles(False, False);

  If Item_Pedido_Venda1.IsEmpty Then
  Begin
    edtProduto.Clear;
    edtUnidade.Clear;
    edtReferencia.Clear;
    edtMarca.Clear;
    dbgItens.SetFocus;
    imgProduto.Picture:=nil;
  End
  else
    CarregarItemVenda;
  memResumo.Enabled:=True;
  edtCodigoPRD.OnExit := aux;

  dblCodigoFUN.KeyValue:=ult;
end;

procedure TfMxPedidoMotCal_2.SB_SalvarPedidoClick(Sender: TObject);
Var
  Soma, VAVista, VAPrazo, Entra:Double;
  aux:TDataSetNotifyEvent;
  trans, cCartao, TemEntrada:Boolean;
  iGrupoEspecial:integer;
  ObsTrc:string;
  ccx:integer;
begin
  ccx:=0;
  ObsTrc := '';
  If Entidade.IsEmpty then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  If not (VerificaInteiroBranco(edtCodigoCLI.Text)) or (Cliente1.IsEmpty) or
     (edtCodigoCLI.Text='0') then
    Raise Exception.Create('Não foi selecionado nenhum cliente para este pedido!');
  If Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Não existem itens para este pedido!');
  if (Forma_de_Pagamento1.Prazo <> '0') and (StrToInt(edtCodigoCLI.Text) = DM.Configuracao1.CodigoCliAVista) then
    Raise Exception.Create('Não é possível atribuir uma venda à prazo a um cliente à Vista!');
  if not VerificaData(mskMelhorData.Text) then
    Raise Exception.Create('Melhor data inválida!')
  else if mskMelhorData.Text <> '  /  /    ' then
    if (Trunc(StrToDate(mskMelhorData.Text)) > Trunc(DM.Configuracao1.Data)+(DM.Configuracao1.MelhorData)) then
      Raise Exception.Create('Melhor data acima do permitido!');
  if Entidade.Situacao > 3 then
    Raise Exception.Create('Não pode mais ser Salvo!');
  if dblCodigoAGF.Text = '' then
    Raise Exception.Create('Agente Financeiro inválido!');
  Soma:=0;

  Item_Pedido_Venda2.Close;
  Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
  Item_Pedido_Venda2.ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
  Item_Pedido_Venda2.Open;

  with DM.QR_Consultas do
  Begin
    //Verificar se tem Grupo Especial
    Close;
    SQL.Text := 'SELECT TOP 1 GRP_ESPECIAL '+
      ' FROM GRUPO G1 '+
      ' WHERE G1.GRP_CODIGO IN '+
      ' (SELECT GRP_CODIGO FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoPRD)+') ';
    Open;
    if FieldByName('GRP_ESPECIAL').asString = '1' then
      iGrupoEspecial:=1
    else
      iGrupoEspecial:=0;
  end;

  //Selecionar Fator Financeiro
  With FatorFinanceira1 do
  Begin
    Close;
    ParamByName('AGF_CODIGO').AsInteger:=AgenteFin1.CodigoAGF;
    If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
      ParamByName('FAF_NPARC').AsInteger:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
    Else
      ParamByName('FAF_NPARC').AsInteger:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);
    Open;
  End;

  if DM.Configuracao1.Empresa <> empLuciano then
    //Verificar, caso o Pedido seja antigo, se a Tabela de preço está válida!!!
  if Trunc(Entidade.DataAlterado) < Trunc(DM.Configuracao1.Data) then
    Raise exception.Create('Pedido Antigo!'+#13+
                           'Atualize o Cabeçalho!');

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      If not Item_Pedido_Venda2.IsEmpty then
      Begin

        //Deletar os títulos gerados na tabela temporaria por este item antes de gerá-los novamente
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM TRCTEMP '+
          ' WHERE PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC));

        //Gerar titulos temporários
        With Item_Pedido_Venda2 do
        Begin
          VAVista := 0;
          VAPrazo := 0;
          cCartao := False;
          Item_Pedido_Venda2.First;
          while not eof do
          begin
            //verifica se a forma de pagamento é a vista
            If ((Forma_de_Pagamento1.Prazo='0') or (Forma_de_Pagamento1.Prazo='')) and
                ((dblTipoPagamento.KeyValue <> 13) or (dblTipoPagamento.KeyValue <> 412)) then
            Begin
              if not AVista then
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
                  ' IPV_AVISTA = 1 '+
                  ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
                  ' AND IPV_CODIGO='+IntToStr(CodigoIPV));
            End
            Else if AVista then
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
                ' IPV_AVISTA = 0 '+
                ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
                ' AND IPV_CODIGO='+IntToStr(CodigoIPV));

            if PrecoDesc=0 then
              Soma:=Soma+Arredonda((Quantidade-Bonificacao)*Arredonda(Preco))
            else
              Soma:=Soma+Arredonda((Quantidade-Bonificacao)*Arredonda(PrecoDesc));
            next;
          end;
          Soma := Soma + Arredonda(Entidade.Frete);
          If (Forma_de_Pagamento1.Prazo = '0') and
             (dblTipoPagamento.KeyValue <> 13) and (dblTipoPagamento.KeyValue <> 412) Then
            VAVista:=Soma
          else
          Begin
            VAPrazo:=Soma;
            If Entidade.TipoPag=13 Then
              cCartao := True;
          end;

          Entra:=0;
          If Entidade.Entrada > 0 then
          Begin
            TemEntrada := True;
            Entra := Entidade.Entrada;
          end
          Else if Forma_de_Pagamento1.Prazo[1]='0' then
            TemEntrada := True
          else
            TemEntrada := False;

          Titulo_receber1.GerarTitVista(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartaoCV*), VAVista);
          Titulo_receber1.GerarTitPrazo(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartaoCV*), VAPrazo, Entra, TemEntrada, cCartao, ObsTrc);

          //corrigindo o erro, Anderson
          if (dblTipoPagamento.KeyValue=13) and (dblFormaPagamento.KeyValue=1) then
          begin
            try
              DM.QueryExec.Close;
              DM.QueryExec.SQL.Text:='UPDATE TRCTEMP SET AGF_CODIGO='''+inttostr(dblCodigoAGF.KeyValue)+''' WHERE PDV_CODIGO='''+inttostr(entidade.CodigoPDV)+'''';
              DM.QueryExec.ExecSQL;                                               //AgenteFin1.CodigoAGF
            except
            end;
          end;
          // // //

          //Muda situacao para pedido aprovado e coloca o valor total do pedido
          Titulo_receber4.Active:=False;
          Titulo_receber4.Active:=True;

          // Evitar erros no acréscimo por arredondamento
          if ABS(Titulo_receber4.FieldByName('TotalPedido').asFloat-Soma) > 0.2 then
            ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_SITUACAO=3 '+
              ',PDV_TOTAL='+VirgPonto(Soma)+
              ',PDV_ACRESCIMO='+VirgPonto(Titulo_receber4.FieldByName('TotalPedido').asFloat-Soma)+
              ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
              ',CLI_CODIGO='+edtCodigoCLI.Text+
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND PDV_CODIGO='+edtCodigoPDV.Text)
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_SITUACAO=3, '+
              ' PDV_TOTAL='+VirgPonto(Soma)+
              ',PDV_ACRESCIMO=0'+
              ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
              ',CLI_CODIGO='+edtCodigoCLI.Text+
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND PDV_CODIGO='+edtCodigoPDV.Text)
        end; // Fim do With Item_Pedido_Venda2
      End; // Fim do If not Item_Pedido_Venda2.isEmpty
      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;

  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  Item_Pedido_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pedido_Venda1.Open;
  Item_Pedido_Venda1.AfterScroll:=Aux;
  //Gerar resumo
  Titulo_receber2.Close;
  Titulo_receber2.Open;
  Entidade.Resumo(Titulo_receber2);
end;

procedure TfMxPedidoMotCal_2.SB_InformacoesClick(Sender: TObject);
var
  CdCLI, CdCLICNC: integer;
begin
  if (Entidade.IsEmpty) then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
  Begin
    edtCodigoCLI.Clear;
    edtRazaoSocial.Clear;
    mskCNPJCPF.Clear;
    ShowMessage('Selecione o Cliente!');
    Exit;
  end
  else if StrToInt(edtCodigoCLI.Text) <> DM.Configuracao1.CodigoCliAVista then
  Begin
    CdCLI    := StrToInt(edtCodigoCLI.Text);
    CdCLICNC := StrToInt(edtClienteCNC.Text);
    if Cliente1.SPC = 1 then
      ShowMessage('Esta venda não será permitida!'+#13+'Procure a gerência!')
    else
    Begin
      Titulo_receber5.Close;
      Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger:= CdCLICNC;
      Titulo_receber5.ParamByName('CLI_CODIGO').asInteger := CdCLI;
      Titulo_receber5.ParamByName('DATA').asDate          := DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente;
      Titulo_receber5.Open;
      if (not Titulo_receber5.IsEmpty) then
        ShowMessage('Será necessário autorização para efetuar essa venda!'+#13+'Procure a gerência!')
      else
      Begin
        with Informacoes1 do
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
          ParamByName('CLI_CODIGO').asInteger := CdCLI;
          Open;
          if IsEmpty and (CdCLI > 0) then
          Begin
            if not Inserir(CdCLICNC, CdCLI, 0, 0, 0, 0,
                0,0,0,0(*Renda*),0,'','','','','','',False,False,0) then
            Begin
              ShowMessage('Falha ao inserir Informações de Crédito!');
            end;
            Close;
            ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
            ParamByName('CLI_CODIGO').asInteger := CdCLI;
            Open;
          end;
          if Proibido then
            ShowMessage('Esta venda não será permitida (PROIB)!'+#13+'Procure a gerência!')
          Else if not IsEmpty then
          Begin
            if (CreditoUtil > LimiteCredito) and
               (LimiteCredito > 0) then
            Begin
              ShowMessage('Verifique Limite de Crédito com a Gerência!');
              Exit;
            end;
          end;
        end;
        ShowMessage('Cliente está OK!');
      end;
    end;
  end
  else
    ShowMessage('Cliente à Vista!');
end;

procedure TfMxPedidoMotCal_2.SB_FecharPedidoClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxPedidoMotCal_2.SB_FinalizarPedidoClick(Sender: TObject);
Var
  CdSGP, CdCLICNC, CdCLI, CdCNC, CdPDV, SEQ, IEB, iGerarTitulos, iOpcaoFin, CdLOT:Integer;
  Trans:Boolean;
  sSubGrupo, sCodigoCARTAO: string;
  vPreco, vQtd: Double;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if (not Item_Pedido_Venda1.Active) or (not Entidade.Active) then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if (Item_Pedido_Venda1.IsEmpty) or (Entidade.IsEmpty) then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if StrToInt(edtDiasOrcamento.Text) > 0 then
    If MessageDlg('Atenção!!!'+#13+
                  'Se esse orçamento for finalizado passará a ser uma venda concluída.'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  SB_SalvarPedidoClick(sender);

  //Verifica permissão para finalizar o pedido
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1980)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para finalizar o pedido!');
  If not (VerificaInteiroBranco(edtCodigoCLI.Text)) or (Cliente1.IsEmpty) or
    (edtCodigoCLI.Text = '0') then
    Raise Exception.Create('Não foi selecionado nenhum cliente para este pedido!');
  If Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Não existem itens de pedido a serem processados!');
  If (dblTipoPagamento.Text = '') then
    Raise Exception.Create('Tipo de pagamento faltando!');
  If (dblFormaPagamento.Text = '') then
    Raise Exception.Create('Forma de pagamento faltando!');
  If Entidade.Situacao<>3 then
    Raise Exception.Create('Salve o pedido antes de finalizar!');
  if (Forma_de_Pagamento1.Prazo <> '0') and
     (StrToInt(edtCodigoCLI.Text) = DM.Configuracao1.CodigoCliAVista) then
    Raise Exception.Create('Não é possível atribuir uma venda à prazo ao Cliente Balcão!');

  if (Forma_de_Pagamento1.Prazo[1] <> '0') and
     (Entidade.PagamentoAntecipado > 0) then
    Raise exception.Create('Foi definido pagamento antecipado, logo é obrigatório a entrada na Forma de Pagamento ou à vista!');
  if (Arredonda(Entidade.PagamentoAntecipado) > Arredonda(Entidade.Entrada)) and
     (Forma_de_Pagamento1.Prazo <> '0') then //Diferente de À Vista
    Raise exception.Create('A entrada está menor que o pagamento antecipado!');

  if DM.Configuracao1.Empresa = empMotical then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT DISTINCT P1.SGP_CODIGO, I1.IPV_PRECO_DESC '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1 '+
        ' WHERE I1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND I1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
        ' AND I1.PRD_CODIGO=P1.PRD_CODIGO '+
        ' ORDER BY P1.SGP_CODIGO ';
      Open;
      CdSGP  := FieldByName('SGP_CODIGO').asInteger;
      vPreco := FieldByName('IPV_PRECO_DESC').asFloat;
      Next;
      while not EOF do
      Begin
        if CdSGP <> FieldByName('SGP_CODIGO').asInteger then
        Begin
          CdSGP  := FieldByName('SGP_CODIGO').asInteger;
          vPreco := FieldByName('IPV_PRECO_DESC').asFloat;
        end
        else if vPreco <> FieldByName('IPV_PRECO_DESC').asFloat then
          Raise exception.Create('Produtos do mesmo SubGrupo com preços diferentes!');
        Next;
      end;
    end;
  end;

  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;
  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
    ParamByName('CLI_CODIGO').asInteger := CdCLI;
    Open;
  end;

  //Selecionar Tipo de Pedido
  edtCodigoPacote.Text := '0';

  if DM.Configuracao1.Empresa = empMotical then
  Begin
    Application.CreateForm(TfMxFinalizaPedido, fMxFinalizaPedido);
    with fMxFinalizaPedido do
    Begin
      Tag:=3;
      iCdCLI    := CdCLI;
      iCdCLICNC := CdCLICNC;
      //Verificar a Vista
      if dblFormaPagamento.KeyValue = 1 then
        rdbPendente.Enabled := False;

      if self.Cliente1.Credito > 0 then
      Begin
        edtCredito.Text := format('%.2f',[self.Cliente1.Credito]);
        rdbPrePago.Checked := True;
      end
      else
        rdbPrePago.Enabled := False;

      //Verificar se existe Pacote
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT TOP 1 PDV_CODIGO '+
          ' FROM PACOTE_DE_VENDA '+
          ' WHERE CNC_CLIENTE='+IntToStr(CdCLICNC)+
          ' AND CLI_CODIGO='+IntToStr(CdCLI)+
          ' AND (PCT_BLOQUEADO=0 OR PCT_BLOQUEADO IS NULL) '+
          ' AND PCT_SITUACAO=4 ';
        Open;
        if not IsEmpty then
          rdbRemessa.Checked := True
        else
          rdbRemessa.Enabled := False;
      end;

      ShowModal;
      if iOpcaoEscolhida < 0 then
        Raise exception.Create('Operação Cancelada!');

      iOpcaoFin := iOpcaoEscolhida;
      if iOpcaoEscolhida in [0,3] then  //Normal ou Pré-Paga
        iGerarTitulos := 1
      else                         //Faturamento Pendente
        iGerarTitulos := 0;
    end;
  end
  else //Diferente de Motical Tipo de Venda Normal
  Begin
    iOpcaoFin     := 0;
    iGerarTitulos := 1;
  end;

  if iOpcaoFin = 2 then //Remessa Pacote de Venda
  Begin
    Itens_Agrupados.Close;
    Itens_Agrupados.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    Itens_Agrupados.ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Itens_Agrupados.Open;

    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        while not Itens_Agrupados.EOF do
        Begin
          with Item_Pacote_Venda1 do
          Begin
            Close;
            ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
            ParamByName('PDV_CODIGO').asInteger := StrToInt(edtCodigoPacote.Text);
            ParamByName('SGP_CODIGO').asInteger := Itens_Agrupados.FieldByName('SGP_CODIGO').asinteger;
            Open;
            if IsEmpty then
              Raise exception.Create('SubGrupo não disponível no Pacote!');

            if (saldo<Itens_Agrupados.FieldByName('QUANTIDADE').asinteger)then //Já está deduzido a Bonificação
              Raise exception.Create('Quantidade superior ao disponível no Pacote!');

            ExecutaSQL(DM.qr_consultas2, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
              ' IPV_PRECO_SUGERIDO='+VirgPonto(Item_Pacote_Venda1.PrecoDesc)+
              ',IPV_DESCONTO=0 '+
              ',IPV_PRECO_DESC='+VirgPonto(Item_Pacote_Venda1.PrecoDesc)+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV)+
              ' AND PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO WHERE SGP_CODIGO='+Itens_Agrupados.FieldByName('SGP_CODIGO').asString+')');
            Next;
          end;
          Itens_Agrupados.Next;
        end;

        If DM.Configuracao1.ControleTransacao then
          if trans then
            Commit;
        Trans := False;

        Item_Pedido_Venda1.Close;
        Item_Pedido_Venda1.Open;
        SB_SalvarPedidoClick(sender);            
      except
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            Exit;
          end;
      end;
    end;
  end;

  if iOpcaoFin > 1 then //Remessa ou Pré-pago
  Begin
    if (Entidade.TipoPag <> 5) or     //Dinheiro/Promissória
       (Entidade.CodigoFPG <> 1) or   //A Vista
       (Entidade.CodigoAGF <> 1) then //Loja
    Begin
      if MessageDlg('Tipo de Pag/Forma de pag/Agente Financeiro inválido!'+#13+
                    'Deseja alterar (corrigindo preços)?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' AGF_CODIGO=1 '+
        ',FPG_CODIGO=1 '+
        ',PDV_TIPO_PAG=5 '+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
      RecalcularPrecos;
    end;
  end;

  Informacoes1.Close;
  Informacoes1.ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
  Informacoes1.ParamByName('CLI_CODIGO').asInteger := CdCLI;
  Informacoes1.Open;
  if Informacoes1.Proibido then
    Raise exception.Create('Cliente Bloqueado!'+#13+'Procure a gerência!');

  if (iOpcaoFin <> 2) and
     (StrToInt(edtCodigoCLI.Text) <> DM.Configuracao1.CodigoCliAVista) and
     (not ((dblFormaPagamento.KeyValue = 1) and (dblTipoPagamento.KeyValue = 5))) then
  Begin
    if (Cliente1.SPC = 1) then
    Begin
      if MessageDlg('Cliente no SPC !!!'+#13+
                    'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=47;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para vender a Cliente no SPC!');
            end
            else
              DM.Usuario1.GeraLog(8930, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE NO SPC');
          end
          else
          begin
            free;
            exit;
          end;
          free;
        End;
      end
      else
        DM.Usuario1.GeraLog(8930, CdCNC, CdPDV,
          ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE NO SPC');
    end;

    if not Informacoes1.IsEmpty then
    Begin
      with DM.Avalista1 do
      Begin
        if VerificaInteiroBranco(mskCNPJCPF.Text) then
        Begin
          Close;
          SQL.Text := 'SELECT * FROM AVALISTA ' +
            ' WHERE CNC_CODIGO='+IntToStr(Informacoes1.CodigoCNC)+
            ' AND (AVL_CGC_CPF="'+mskCNPJCPF.Text+'" AND AVL_CGC_CPF<>"") ';
          Open;
          if not IsEmpty then
          Begin
            DM.QR_Consultas.Close;
            DM.QR_Consultas.SQL.Text := 'SELECT T1.CLI_CODIGO '+
              ' FROM INFORMACOES_DE_CREDITO T1 '+
              ' WHERE T1.CNC_CODIGO='+IntToStr(CdCLICNC)+
              ' AND T1.AVL_CODIGO='+IntToStr(CodigoAVL)+
              ' AND EXISTS ' +
              ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
              ' WHERE CNC_CLIENTE=T1.CNC_CODIGO '+
              ' AND CLI_CODIGO=T1.CLI_CODIGO '+
              ' AND TRC_SITUACAO IN (0,1,8,9) '+
              ' AND TRC_VENCIMENTO>"'+MesDia(DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente)+'") ';
            DM.QR_Consultas.Open;
            if not DM.QR_Consultas.IsEmpty then
            Begin
              ShowMessage('Cliente Avalista de Inadiplente! ('+
                DM.QR_Consultas.FieldByName('CLI_CODIGO').AsString+')');
              Exit;
            end;
          end;
        end;
      end;
      if (Informacoes1.CreditoUtil > Informacoes1.LimiteCredito) and
         (Informacoes1.LimiteCredito > 0) then
        Raise Exception.Create('Limite de Crédito Ultrapassado!');
    end
    else
      Raise Exception.Create('Cliente sem Limite de Crédito Definido!');

    Titulo_receber5.Close;
    Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger := CdCLICNC;
    Titulo_receber5.ParamByName('CLI_CODIGO').asInteger  := CdCLI;
    Titulo_receber5.ParamByName('DATA').asDate           := DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente;
    Titulo_receber5.Open;
    if (not Titulo_receber5.IsEmpty) then
    Begin
      if MessageDlg('Cliente Inadiplente!'+#13+
                    'Deseja Continuar?' ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (not Informacoes1.LiberaInadiplencia) and
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=47;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para vender a Cliente Inadiplente!');
            end
            else
              DM.Usuario1.GeraLog(3790, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE INADIPLENTE');
          end
          else
          begin
            free;
            exit;
          end;
          free;
        End;
      end
      else if (not Informacoes1.LiberaInadiplencia) then
        DM.Usuario1.GeraLog(3790, CdCNC, CdPDV,
          ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE INADIPLENTE');
    end;
  end;

  if iOpcaoFin in [2,3] then //Remessa ou Pré-Pago
  Begin
    if (dblTipoPagamento.KeyValue <> 5) or  //Dinheiro
       (dblFormaPagamento.KeyValue <> 1) or //A Vista
       (dblCodigoAGF.KeyValue <> 1) then    //Loja
      Raise exception.Create('Tipo de Pagamento/Forma de Pagamento/Agente Financeiro inválidos para Remessa/Pré-Pago!'+
                             'Mudar para --> DINHEIRO/PROMISSORIA - A VISTA - LOJA');
    if iOpcaoFin = 3 then //Pré-Pago
    Begin
      //Atualizar o Crédito
      with Cliente1 do
      Begin
        if Entidade.Total+Entidade.Acrescimo > Credito then
        Begin
          SB_SalvarPedido.Enabled := True;
          SB_Informacoes.Enabled := True;
          SB_FinalizarPedido.Enabled := True;
          Raise exception.Create('Crédito inferior ao valor da compra! (R$'+format('%.2f',[Credito])+')');
        end;
      end;
    end;
  end;

  //Verificar dados do Cliente para Compra a Prazo
  if (DM.Configuracao1.Empresa = empLuciano) and
     (dblFormaPagamento.KeyValue <> 1) and //Diferente de A Vista
     (dblTipoPagamento.KeyValue <> 13) and //Diferente de Cartao de Credito
     ((not VerificaCPFCNPJBranco(Cliente1.CPFCGC)) or
      (Length(CLiente1.Mae) <= 3)) then
  Begin
    if MessageDlg('Dados do Cliente incompletos!'+#13+
                  'Deseja Continuar?' ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(7360)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=47;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(7360)) < 0)then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão Venda à cliente com dados incompletos!');
          end
          else
            DM.Usuario1.GeraLog(7360, CdCNC, CdPDV,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' VENDA-DADOS CLIENTE');
        end
        else
        begin
          free;
          exit;
        end;
        free;
      End;
    end
    else
      DM.Usuario1.GeraLog(7360, CdCNC, CdPDV,
        'VENDA-DADOS CLIENTE');
  end;

  sCodigoCARTAO := '';
{  if (dblTipoPagamento.KeyValue = 13)and //Cartão
     (iGerarTitulos = 1) then
  Begin
    sCodigoCARTAO := Trim(UpperCase(InputBox('Comprovante de Venda CARTÃO' , 'CV:', '')));
    if Length(sCodigoCARTAO) < 5 then
    Begin
      SB_SalvarPedido.Enabled    := True;
      SB_Informacoes.Enabled     := True;
      SB_FinalizarPedido.Enabled := True;
      Raise exception.Create('Comprovante de Venda (CV) inválido!');
    end;
  end;
}

  //Verificar se tem Bonificação
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(IPV_BONIFICACAO) AS QTD '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV);
    Open;
    if (FieldByName('QTD').asFloat > 0) then
    Begin
      if MessageDlg('Foram definidos '+FieldByName('QTD').asString+' unidades como bonificação!'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8210)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=47;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(8210)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para Liberar Bonificação!');
            end
            else
              DM.Usuario1.GeraLog(8210, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' VENDA-BONIFICACAO QTD: '+Format('%.2f',[FieldByName('QTD').asFloat]));
          end
          else
          begin
            free;
            exit;
          end;
          free;
        End;
      end
      else
        DM.Usuario1.GeraLog(8210, CdCNC, CdPDV,
          'VENDA-BONIFICACAO QTD: '+Format('%.2f',[FieldByName('QTD').asFloat]));
    end;
  end;

  Item_Pedido_Venda2.Close;
  Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger := CdCNC;
  Item_Pedido_Venda2.ParamByName('PDV_CODIGO').asInteger := CdPDV;
  Item_Pedido_Venda2.Open;
  Item_Pedido_Venda2.First;
  while not Item_Pedido_Venda2.EOF do
  Begin
    CdLOT := Item_Pedido_Venda2.CodigoLOT;
    with Item_de_Estoque1 do
    Begin
      Close;
      ParamByName('PRD_CODIGO').AsInteger := Item_Pedido_Venda2.CodigoPRD;
      ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      open;
      If IsEmpty Then
        Raise exception.Create('Produto sem Item de Estoque!');
    end;
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
        ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
        ' WHERE MEF_ENT_CODIGO='+IntToStr(Entidade.CodigoPDV)+
        ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PRD_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
        ' AND MEF_TIPO_MOV=4200 '; //Entrega Antecipada
      Open;
      vQtd := FieldByName('QTD').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
        ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
        ' WHERE MEF_ENT_CODIGO='+IntToStr(Entidade.CodigoPDV)+
        ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PRD_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
        ' AND MEF_TIPO_MOV=4210 '; //Ext. Entrega Antecipada
      Open;
      vQtd := vQtd - FieldByName('QTD').asFloat;
    end;

    if vQtd > 0 then
    Begin
      //Gerar Comercial
      If not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,
          Item_Pedido_Venda2.CodigoPRD,0(*CdFUN*),4210,CdCNC,CdPDV,'E', vQtd,
          Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
          Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
          'FINALIZACAO DO PEDIDO') Then
      Begin
        ShowMessage('Falha ao Gerar Mov. Comercial!');
        Raise Exception.Create('');
      end;

      //Gerar Fisico
      If not DM.Movimento_Fisico1.Inserir(CdCNC,0,Item_Pedido_Venda2.CodigoPRD,0(*CdFUN*),
          CdCNC,CdPDV,4210(*Entrega Antecipada*),'E',
          vQtd, Item_de_Estoque1.SFisico,'FINALIZACAO DO PEDIDO') then
      Begin
        ShowMessage('Falha ao Gerar Mov. Físico!');
        Raise Exception.Create('');
      end;

      if CdLOT>0 then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
          ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(vQtd)+
          ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND LOT_CODIGO='+IntToStr(CdLOT));
      end;

      //Atualizar estoque comercial e Físico Não alterar Bonificação
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
        ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(vQtd)+
        ',IES_SFISICO=IES_SFISICO+'+VirgPonto(vQtd)+
        ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PRD_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      Entidade.GeraLog(7680, CdCNC, CdPDV, 'IPV:'+IntToStr(Item_Pedido_Venda2.CodigoIPV)+' PRD:'+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' Motivo:FINALIZACAO DO PEDIDO'+
          ' Qtd:'+format('%.2f',[vQtd])+
          ' Preco:'+format('%.2f',[Item_Pedido_Venda2.Preco])+
          ' PrecoDesc:'+format('%.2f',[Item_Pedido_Venda2.PrecoDesc])+
          ' Sug:'+format('%.2f',[Item_Pedido_Venda2.PrecoSugerido]));
    end;
    Item_Pedido_Venda2.Next;
  end;

  IEB := 0;
  if SB_FinalizarPedido.Enabled then
  Begin
    SB_SalvarPedido.Enabled := False;
    SB_Informacoes.Enabled := False;
    SB_FinalizarPedido.Enabled := False;
  end
  else
    Exit;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if iGerarTitulos = 1 then
      Begin
        With DM.QR_Consultas do
        Begin
          Close;
          SQL.Text:='SELECT * '+
                  ' FROM TRCTEMP '+
                  ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND PDV_CODIGO='+IntToStr(CdPDV)+
                  ' ORDER BY TRC_VENCIMENTO';
          Open;
          First;
          Titulo_receber3.Open;
          SEQ:=1;

          if FieldByName('TRC_VENCIMENTO').AsDateTime <= StrToDate('01/09/2004') then
          Begin
            ShowMessage('Vencimento inválido!');
            Raise exception.Create('');
          end;

          While not EOF do
          Begin
            if iOpcaoFin = 0 then //Normal (Título Aberto)
            Begin
              if not Titulo_receber3.Inserir(DM.Configuracao1.CodigoCNC,0,
                  FieldByName('CLI_CODIGO').AsInteger,FieldByName('PDV_CODIGO').AsInteger,
                  FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
                  dblTipoPagamento.KeyValue,FieldByName('TRC_TIPO_DOC').AsInteger,0(*TRF*),0(*Reabertura*),
                  FieldByName('TRC_VENCIMENTO').AsDateTime,0(*DtPag*),0(*DtOrigem*),0(*DtVerificado*),
                  FieldByName('TRC_OBSERVACAO').AsString,PreencheZero(2,SEQ),
                  ''(*Numero*),sCodigoCARTAO,
                  FieldByName('TRC_VALOR').AsFloat,0(*ValorPag*),
                  0,FieldByName('AGF_CODIGO').AsInteger,
                  Cliente1.CodigoCNC,0(*Situacao*),0(*TitAnterior*),0(*TitOrigem*),
                  0(*TipoPedido*),False(*MovCaixa*), False(*CHQDev*)) then
              Begin
                ShowMessage('Falha ao gerar TRC!');
                Raise Exception.Create('');
              end;
            end
            else //Pré-Pago (Título Pago com Crédito)
            Begin
              if not Titulo_receber3.Inserir(DM.Configuracao1.CodigoCNC,0,
                  FieldByName('CLI_CODIGO').AsInteger,FieldByName('PDV_CODIGO').AsInteger,
                  FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
                  dblTipoPagamento.KeyValue,FieldByName('TRC_TIPO_DOC').AsInteger,0(*TRF*),0(*Reabertura*),
                  FieldByName('TRC_VENCIMENTO').AsDateTime,
                  DM.Configuracao1.DataHora(*DtPag*),
                  0(*DtOrigem*),0(*DtVerificado*),
                  FieldByName('TRC_OBSERVACAO').AsString,PreencheZero(2,SEQ),
                  ''(*Numero*),''(*CartãoCV*),
                  FieldByName('TRC_VALOR').AsFloat,
                  0(*ValorPag*),
                  FieldByName('TRC_VALOR').AsFloat,FieldByName('AGF_CODIGO').AsInteger,
                  Cliente1.CodigoCNC,
                  2(*Situacao*),0(*TitAnterior*),0(*TitOrigem*),0(*TipoPedido*),False(*MovCaixa*), False(*CHQDev*)) then
              Begin
                ShowMessage('Falha ao gerar TRC!');
                Raise Exception.Create('');
              end;

              if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,
                FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
                DM.Configuracao1.CodigoCAX,dblTipoPagamento.KeyValue,
                FieldByName('TRC_TIPO_DOC').AsInteger,DM.Configuracao1.COdigoCNC,
                0, //CdCHQCNC
                0, //CdCHQ
                'TRC:'+IntToStr(Titulo_receber3.SCodigo)+
                '(Credito:'+format('%.2f',[FieldByName('TRC_VALOR').AsFloat])+')',
                '1'(*Flag*),
                ''(*Numero*),''(*Obs*),'01'(*Seq*),
                'C',0(*Valor*),0(*Desconto*),0(*Juros*),FieldByName('TRC_VALOR').AsFloat,
                FieldByName('TRC_VALOR').AsFloat(*ValorDoc*),DM.Configuracao1.DataHora,
                DM.Configuracao1.DataHora(*Competência*),0(*DtCheque*),Titulo_receber3.SCodigo,
                DM.Configuracao1.CodigoCNC,'T') then
              Begin
                ShowMessage('Falha ao gerar Mov. Caixa!');
                Raise Exception.Create('');
              end;

              if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
                CdCLICNC,CdCLI,1003,DM.Configuracao1.CodigoCNC,
                Titulo_receber3.SCodigo,CdCNC,CdPDV,'D',Cliente1.Credito,
                FieldByName('TRC_VALOR').AsFloat) then
              Begin
                ShowMessage('Falha ao gerar Mov. Credito!');
                Raise Exception.Create('');
              end;

              if (Cliente1.Situacao = 0) then
                ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
                  ' CLI_CREDITO=CLI_CREDITO-'+VirgPonto(FieldByName('TRC_VALOR').AsFloat)+
                  ',CLI_SITUACAO=1 '+
                  ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
                  ' AND CLI_CODIGO='+IntToStr(CdCLI))
              else
                ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
                  ' CLI_CREDITO=CLI_CREDITO-'+VirgPonto(FieldByName('TRC_VALOR').AsFloat)+
                  ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
                  ' AND CLI_CODIGO='+IntToStr(CdCLI));
            end;
            SEQ:=SEQ+1;
            Next;
          End;
          Close;
        End;
      end;

      //Deletar do arquivo temporário
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM TRCTEMP '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

      With Item_Pedido_Venda2 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := CdCNC;
        ParamByName('PDV_CODIGO').asInteger := CdPDV;
        Open;
        First;
        While not eof do
        Begin
          CdLOT := CodigoLOT;
          if iOpcaoFin = 2 then //Remessa
          Begin
            with DM.QR_Consultas do
            Begin
              Close;
              SQL.Text := 'SELECT TOP 1 SGP_CODIGO '+
                ' FROM PRODUTO '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD);
              Open;
              if (Trim(FieldByName('SGP_CODIGO').asString) = '') or
                 (Trim(FieldByName('SGP_CODIGO').asString) = '0') then
              Begin
                ShowMessage('Produto ('+IntToStr(CodigoPRD)+') sem SubGrupo definido!');
                Raise exception.Create('');
              end;
              sSubGrupo := FieldByName('SGP_CODIGO').asString;
            end;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PACOTE_DE_VENDA SET '+
              ' IPC_QUANTIDADE_ENTREGUE=IPC_QUANTIDADE_ENTREGUE+'+VirgPonto(Quantidade-Bonificacao)+ //Na Qtd está incluído a bonificação que não pode ser deduzida do pacote
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND PDV_CODIGO='+edtCodigoPacote.Text+
              ' AND (SGP_CODIGO_1='+sSubGrupo+
              '   OR SGP_CODIGO_2='+sSubGrupo+
              '   OR SGP_CODIGO_3='+sSubGrupo+
              '   OR SGP_CODIGO_4='+sSubGrupo+')');
          end;

          with Item_de_Estoque1 do
          Begin
            Close;
            ParamByName('PRD_CODIGO').AsInteger := Item_Pedido_Venda2.CodigoPRD;
            ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
            open;
            If IsEmpty Then
              Raise exception.Create('Produto sem Item de Estoque!');
          end;

          //Gerar MEC
          If not DM.Movimento_Estoque_Comercial1.Inserir(DM.Configuracao1.CodigoCNC,0,
              CodigoPRD,0(*CdFUN*),361,CdCNC,CdPDV,'S', Quantidade,
              Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
              Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, Bonificacao) Then
          Begin
            ShowMessage('Falha ao Gerar Mov. Comercial!');
            Raise Exception.Create('');
          end;

          If not DM.Movimento_Fisico1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoPRD,0(*CdFUN*),
              CdCNC,CdPDV,261(*Venda*),'S',
              Quantidade, Item_de_Estoque1.SFisico) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Físico!');
            Raise Exception.Create('');
          end;

          if CdLOT>0 then
          Begin
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
              ' IED_QTD_FISICO=IED_QTD_FISICO-'+VirgPonto(Quantidade)+
              ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND LOT_CODIGO='+IntToStr(CdLOT));
          end;

          //Atualizar estoque comercial e Físico e excluir Reserva (se não for orçamento)
          if edtDiasOrcamento.Text = '0' then
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
              ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
              ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
              ',IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC))
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
              ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
              ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));

          //Item de pedido fica finalizado
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
            ' IPV_SITUACAO=3 '+
            ',IEB_CODIGO='+IntToStr(IEB)+
            ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND IPV_CODIGO='+IntToStr(CodigoIPV));
          next;
        End;
      end;

      //Pedido vira venda confirmada
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_SITUACAO=4 '+
        ',PDV_PACOTE='+edtCodigoPacote.Text+
        ',PDV_LISTADO=0 '+
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',PDV_DT_ENTREGA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',FUN_ARQUITETO=0 '+
        ',PDV_DIAS_RESERV=0 '+
        ',PDV_TIPO_VENDA='+IntToStr(iOpcaoFin)+ // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
        ',PDV_TITULO_GERADO='+IntToStr(iGerarTitulos)+
        ',PDV_TITULO_GERADO2='+IntToStr(iGerarTitulos)+        
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

      Entidade.GeraLog(1980,CdCNC,CdPDV); //Log Finalizar Pedido

      With Cliente1 do
      Begin
        //Mudar situacao de cliente
        if (Cliente1.Situacao = 0) and
           (iOpcaoFin <> 3) then //Se for Pré-Pago já foi alterado
          ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
            ' CLI_SITUACAO=1 '+
            ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CLI_SITUACAO=0 '+
            ' AND CLI_CODIGO='+IntToStr(CdCLI)+
            ' AND CNC_CODIGO='+IntToStr(CdCLICNC));

        //Aumentar o crédito utilizado do cliente (Diferente de (À Vista ou Cartão)
        // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
        if iOpcaoFin <= 1 then
        Begin
          if (iOpcaoFin <> 2) and (Entidade.CodigoFPG <> 1) and (Entidade.TipoPag <> 13) then
          Begin
            if (Informacoes1.Active) and (Informacoes1.IsEmpty) then
            Begin
              if not Informacoes1.Inserir(CodigoCNC,CodigoCLI,0,0,0,0,Entidade.Total+Entidade.Acrescimo,
                  0,0,0(*Renda*),Entidade.DataHora,'','','','','','',False,False,Entidade.Total+Entidade.Acrescimo) then
                Raise exception.Create('');
            end
            else
              ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
                ' ICR_CRED_UTIL='+VirgPonto(Informacoes1.CreditoUtil+Entidade.Total+Entidade.Acrescimo)+
                ',ICR_DT_ULT_CMP="'+MesDiaHora(Entidade.DataHora)+'" '+
                ',ICR_VL_ULT_CMP='+VirgPonto(Entidade.Total+Entidade.Acrescimo)+
                ' WHERE CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC)+
                ' AND CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI));
          end;
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
        if trans then
          Commit;

      //Desabilita botões
      if iOpcaoFin = 1 then //Faturamento Pendente
        SB_Cupom.Enabled := False;

      if (Forma_de_Pagamento1.Prazo<>'0') and (Forma_de_Pagamento1.Prazo<>'') then
        SB_Promissoria.Enabled:=True;

      memResumo.Enabled:=False;

      //Anderson
      //Fechar Cupom Fiscal
//      if DM.Configuracao1.DiretoImpFiscal and
//         (NumeroOficial > 0) then
//        DM.ImpFiscalB1.FecharCupomResumido('Dinheiro',DM.ImpFiscalB1.MensagemPromocional);
        //caso queira tirar os dados do cliente de baixo do cupom
        //DM.ImpFiscalB1.FecharCupomResumido('Dinheiro','');

    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          Exit;
        end;
      Exit;
    end;
  End;

  //Verificar os títulos a receber
  if (iOpcaoFin = 0) then
  Begin
    if (DM.Configuracao1.Empresa = empLuciano) and (Entidade.PagamentoAntecipado > 0) then
    begin
      Application.CreateForm(TfMxSRecPed, fMxSRecPed);
      with fMxSRecPed do
      Begin
        Tag :=12;
        edtCodigoCLI.Text     :=  self.edtCodigoCLI.Text;
        edtRazaoSocial.Text   :=  self.edtRazaoSocial.Text;
        mskCNPJ_CPF.Text      :=  self.mskCNPJCPF.Text;
        edtObservacaoCLI.Text :=  self.Cliente1.OBS;
        Cliente1.Close;
        Cliente1.ParamByName('CNC_CODIGO').AsInteger := self.Entidade.ClienteCNC;
        Cliente1.ParamByName('CLI_CODIGO').AsInteger := self.Entidade.CodigoCLI;
        ShowModal;
      end;
    end
    else
    Begin
      If MessageDlg('Deseja ver os títulos desse Cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Application.CreateForm(TfMxSRecPed, fMxSRecPed);
        with fMxSRecPed do
        Begin
          Tag :=13;
          edtCodigoCLI.Text     :=  self.edtCodigoCLI.Text;
          edtRazaoSocial.Text   :=  self.edtRazaoSocial.Text;
          mskCNPJ_CPF.Text      :=  self.mskCNPJCPF.Text;
          edtObservacaoCLI.Text :=  self.Cliente1.OBS;
          Cliente1.Close;
          Cliente1.ParamByName('CNC_CODIGO').AsInteger := self.Entidade.ClienteCNC;
          Cliente1.ParamByName('CLI_CODIGO').AsInteger := self.Entidade.CodigoCLI;
          ShowModal;
        end;
      end;
    End;
  end;
  Entidade.Close;
  Entidade.Open;

  if (iOpcaoFin = 0) and
     Cliente1.Nota then
    SB_CupomClick(sender);
end;

procedure TfMxPedidoMotCal_2.DescontonoPedido1Click(Sender: TObject);
var
  CdCNC, CdPDV: integer;
begin
  if Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Só é válido para pedidos com itens já cadastrados!');

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;

  if (Cliente1.Convenio > 0) or
     (Cliente1.Desconto > 0) or
     //(Cliente1.DescontoPrazo > 0) then
     (Cliente1.Fieldbyname('CLI_DESCONTO_PRAZO').AsFloat > 0) then
  Begin
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
    Begin
      if MessageDlg('Cliente com Desconto em Cadastro!'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=47;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão esse Desconto!');
          end
          else
            DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE C/ DESCONTO');
        end
        else
        begin
          free;
          exit;
        end;
        free;
      End;
    end
    else
      DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
        ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE C/ DESCONTO');
  end;
  Application.CreateForm(TfMxDescontoPedido, fMxDescontoPedido);
  fMxDescontoPedido.Tag := 2;
  fMxDescontoPedido.Entidade.Close;
  fMxDescontoPedido.Entidade.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
  fMxDescontoPedido.Entidade.ParamByName('PDV_CODIGO').asInteger:=Entidade.CodigoPDV;
  fMxDescontoPedido.Entidade.Open;
  fMxDescontoPedido.ShowModal;
end;

procedure TfMxPedidoMotCal_2.Calculadora1Click(Sender: TObject);
var
  Hand1 : HWND;
begin
  Hand1 := FindWindow('SciCalc',nil);
  if Hand1 <> 0 then
  Begin
    SetForegroundWindow(Hand1);
    ShowWindow(Hand1, SW_RESTORE);
  end
  else if FileExists('C:\WINDOWS\CALC.EXE') then
    ShellExecute(0,nil,'C:\WINDOWS\CALC.EXE','',NIL,SW_NORMAL)
  else if FileExists('C:\WINDOWS\SYSTEM32\CALC.EXE') then
    ShellExecute(0,nil,'C:\WINDOWS\SYSTEM32\CALC.EXE','',NIL,SW_NORMAL)
  else
    ShowMessage('Arquivo <Calc.exe> não encontrado!');
end;

procedure TfMxPedidoMotCal_2.Calendrio1Click(Sender: TObject);
begin
  Application.CreateForm(TfMxFeriados, fMxFeriados);
  fMxFeriados.tag:=0;
  fMxFeriados.ShowModal;
end;

procedure TfMxPedidoMotCal_2.SB_ImprimirPedidoClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
  CdCNC, CdPDV : integer;
  vServico: Boolean;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Faça o Pedido primeiro!');
  If not Item_Pedido_Venda1.Active then
    Raise Exception.Create('Não existem itens a serem impressos!');
  If Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Não existem itens a serem impressos!');
  if Entidade.Situacao < 4 then
    SB_SalvarPedidoClick(sender);
  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;
  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  Item_Pedido_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pedido_Venda1.Open;
  Item_Pedido_Venda1.AfterScroll:=Aux;
  Item_Pedido_Venda1.CarregaDados;
  CarregarItemVenda;

  vServico := False;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
      ' FROM DETALHE_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV)+
      ' AND (DPV_OD_ESF<>0 '+
      '   OR DPV_OE_ESF<>0 '+
      '   OR DPV_OD_CIL<>0 '+
      '   OR DPV_OE_CIL<>0 '+
      '   OR DPV_OD_EIXO<>0 '+
      '   OR DPV_OE_EIXO<>0 '+
      '   OR DPV_OD_DNP<>0 '+
      '   OR DPV_OE_DNP<>0 '+
      '   OR DPV_OD_ALT<>0 '+
      '   OR DPV_OE_ALT<>0 '+
      '   OR DPV_OD_ADICAO<>0 '+
      '   OR DPV_OE_ADICAO<>0 '+
      '   OR DPV_TIPO_ARMACAO<>"" '+
      '   OR DPV_OBS_ARMACAO<>"" '+
      '   OR DPV_TIPO_LENTES<>"" '+
      '   OR DPV_OBS_LENTES<>"") ';
    Open;
    if not IsEmpty then
      vServico := True;
  end;

  if DM.Configuracao1.Daruma <> 1 then
  Begin
    if (DM.Configuracao1.Empresa <> empLuciano) or
       (not vServico) then
    Begin
      Application.CreateForm(Trpt_PedidoVendaMotical, rpt_PedidoVendaMotical);
      with rpt_PedidoVendaMotical do
      Begin
        tag := 1;
        if DM.Configuracao1.Empresa IN [empMotical, empLuciano] then //Motical - Meia Folha
          report.Options.PageLength := 32;

        Item_Pedido_Venda1.Close;
        Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
          ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
          ' WHERE T2.PDV_CODIGO='+IntToStr(self.Entidade.CodigoPDV)+
          ' AND T2.CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
          ' AND (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+
          ' ORDER BY T1.IPV_CODIGO ';
        Item_Pedido_Venda1.Open;
        if Item_Pedido_Venda1.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        if (report.Height > DM.Configuracao1.MaxLinhasImp) and
           (DM.Configuracao1.MaxLinhasImp <> 65) then
          report.Height := DM.Configuracao1.MaxLinhasImp;
        report.preview;
        Close;
      end;
    end
    else //Luciano imprimir a tela de serviço
    Begin
      Application.CreateForm(Trpt_PedidoServicoCompleto, rpt_PedidoServicoCompleto);
      with rpt_PedidoServicoCompleto do
      begin
        rpt_PedidoServicoCompleto.Tag := 1;
        Entidade.Close;
        Entidade.SQL.Text := 'SELECT * FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.COdigoCNC)+
          ' AND PDV_CODIGO='+IntToStr(self.Entidade.COdigoPDV)+
          ' ORDER BY CNC_CODIGO, PDV_CODIGO ';
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise exception.Create('Consulta Vazia!');
        report.preview;
        if SairPreco then SairPreco := False else SairPreco := True;
      end;
    end;
  end
  else
  Begin
    Application.CreateForm(Trpt_PedidoVendaCodigoPreco, rpt_PedidoVendaCodigoPreco);
    with rpt_PedidoVendaCodigoPreco do
    Begin
      SZRLabel2.Caption := self.edtCodigoPDV.Text;
      SZRLabel3.Caption := self.edtDataHora.Text;
      SZRLabel4.Caption := format('%.2f',[self.Entidade.Total+self.Entidade.Acrescimo]);
      if StrToInt(self.edtDiasOrcamento.Text) > 0 then
        SZRLabel5.Enabled:=True
      else
        SZRLabel5.Enabled:=False;
      report.Preview;
      Close;
    end;
  end;
  //Alterar situação de Impresso para impedir excluir itens sem permissão
  ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
    ' PDV_IMPRESSO=1 '+
    ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
    ' AND PDV_CODIGO='+IntToStr(CdPDV));
end;

procedure TfMxPedidoMotCal_2.SB_CancelarPedidoClick(Sender: TObject);
var
  Trans:Boolean;
  aux:TDataSetNotifyEvent;
  vMotivo: string;
  CdCNC, CdPDV: integer;
  vQtdSaldo: Double;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Não existe pedido para cancelar!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;

  if Entidade.PagamentoAntecipado = 0 then
  Begin
    If MessageDlg('Tem certeza que deseja Cancelar esse Pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end
  else //Feito um Pagamento Antecipado
  Begin
    If MessageDlg('Foi feito um pagamento antecipado. O crédito poderá ser aproveitado em outro pedido!'+#13+
                  'Tem certeza que deseja cancelar o pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end;

  vMotivo := InputBox('Cancelamento de Serviço', 'Motivo:', '');

  if Length(Trim(vMotivo)) < 3 then
    Raise exception.Create('É obrigatório justificar o cancelamento!');

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
    Open;
    If IsEmpty then
    Begin
      try
        Detalhe_Venda1.Deletar(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPDV.Text));
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND PDV_CODIGO='+edtCodigoPDV.Text);
        Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.text), 'Vazio - Cancelar Pedido');
      except
      end;
      SB_NovoPedClick(sender);
      Exit;
    end
  end;

  // Verifica se o usuário que está logado não tem permissão para cancelar o pedido
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3500)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=47;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(3500)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para cancelar o pedido!');
        end
        else
          DM.Usuario1.GeraLog(3500, CdCNC, CdPDV,
            'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
            ' VENDA-CANCELAR');
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end
  else
    DM.Usuario1.GeraLog(3500, CdCNC, CdPDV, 'VENDA-CANCELAR');

  //Verificar Produto com entrega antecipada
  if not Item_Pedido_Venda1.IsEmpty then
  Begin
    Item_Pedido_Venda2.Close;
    Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    Item_Pedido_Venda2.ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Item_Pedido_Venda2.Open;
    Item_Pedido_Venda2.First;
    while not Item_Pedido_Venda2.EOF do
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
          ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
          ' WHERE MEF_ENT_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PRD_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' AND MEF_TIPO_MOV=4200 '; //Entrega Antecipada
        Open;
        vQtdSaldo := FieldByName('QTD').asFloat;

        Close;
        SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
          ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
          ' WHERE MEF_ENT_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PRD_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' AND MEF_TIPO_MOV=4210 '; //Ext. Entrega Antecipada
        Open;
        vQtdSaldo := vQtdSaldo - FieldByName('QTD').asFloat;

        if vQtdSaldo > 0 then
          Raise exception.Create('Produto '+IntToStr(Item_Pedido_Venda2.CodigoPRD)+' com entrega antecipada!');
      end;
      Item_Pedido_Venda2.Next;
    end;
  end;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;
      //Excluir reserva do estoque
      With Item_Pedido_Venda1 do
      Begin
        aux:=AfterScroll;
        AfterScroll:=Nil;
        First;
        While not EOF do
        Begin
          if edtDiasOrcamento.Text = '0' then
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));
          Next;
        end;
        AfterScroll:=aux;
        First;
      End;
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_SITUACAO=6 '+
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',PDV_OBS=PDV_OBS+"|Canc USU:'+IntToStr(DM.Configuracao1.CodigoUSU)+
        '-Motivo: '+UpperCase(vMotivo)+'|" '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text);

      //Gerar Log Cancelar Pedido
      Entidade.GeraLog(3500,CdCNC,CdPDV);
      If DM.Configuracao1.ControleTransacao then
        Commit;

      //Anderson
//      try
//        if DM.Configuracao1.DiretoImpFiscal and
//           (NumeroOficial > 0) then
//          DM.ImpFiscalB1.CancelaCupom;
//      except
//      end;
      // // //


      SB_NovoPedClick(sender);
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
end;

procedure TfMxPedidoMotCal_2.SB_CupomClick(Sender: TObject);
var
  aux: TDataSetNotifyEvent;
begin
  if Entidade.Situacao <> 4 then
    Raise exception.Create('Pedido não finalizado!');
  if not SB_Cupom.Enabled then
    Exit;
  if Entidade.TipoDeVenda = 1 then
    Raise exception.Create('Pedido Pendente!');

  if Entidade.CodigoPacote > 0 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO '+
        ' FROM PACOTE_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPacote)+
        ' AND PCT_NOTA_FISCAL>0 ';
      Open;
      if IsEmpty then
        Raise exception.Create('Não foi impressa a Nota Mãe do Pacote!');
    end;
  end;

  SB_Cupom.Enabled := False;
  Application.CreateForm(TfMxSNotaCupom, fMxSNotaCupom);
  with fMxSNotaCupom do
  Begin

    fMxSNotaCupom.FOtica := False;

    if (self.Entidade.TipoDeVenda = 0) or   //Normal
       (self.Entidade.TipoDeVenda = 3) then //Pre-Pago
      Tag := 7
    else if self.Entidade.TipoDeVenda = 2 then //Remessa
      Tag := 8
    else
      Raise exception.Create('Tipo de Pedido não esperado!');

    Self.CancelarFatura := False;
    if ((not Self.Cliente1.PessoaFisica) and
        (Self.Cliente1.CGFRG <> '')) or
        (self.Entidade.CodigoPacote > 0) then
    Begin
      rdgNota.Checked := True;
      rdgCupom.Enabled := False;
    end;
    CdCNC    := Self.Entidade.CodigoCNC;
    CdPDV    := Self.Entidade.CodigoPDV;
    iCdCNCCli := Self.Entidade.ClienteCNC;
    CdCLI    := Self.Entidade.CodigoCLI;
    CdFPG    := Self.Entidade.CodigoFPG;
    CdTipoPag:= Self.Entidade.TipoPag;
    Entrada  := Self.Entidade.entrada;
    CNPJ_CPF := Self.mskCNPJCPF.Text;
    ShowModal;
    if Self.CancelarFatura then
    Begin
      Self.SB_Cupom.Enabled := True;
      Raise Exception.Create('Faturamento Cancelado!');
    end;
  end;
  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.Open;
  Item_Pedido_Venda1.First;
  Item_Pedido_Venda1.AfterScroll:=Aux;
  CarregarItemVenda;
  SB_NovoPedClick(sender);
  //dblCodigoFUN.KeyValue := -1;
end;

procedure TfMxPedidoMotCal_2.SB_PromissoriaClick(Sender: TObject);
begin
  Application.CreateForm(TfmxSelProm, fmxSelProm);
  fmxSelProm.tag:=9;
  fmxSelProm.ShowModal;
end;

function TfMxPedidoMotCal_2.RecalcularPrecos: Boolean;
var
  vPrecoSug, vPrecoDes, vTotal, vDesconto, vLimSimples, vLimEspecial,
    vLimSimplesPrazo, vLimEspecialPrazo, vDescCliente, vDescClientePrazo: Double;
  CdTBP: Integer;
  vPrecosAlterados, vAlterarPrecos, Lib3540, vNaoManterPreco:Boolean;
begin
  Result := False;
  vTotal := 0;
  Lib3540 := False;
  vNaoManterPreco := False;

  vLimSimples  := Arredonda(DM.Configuracao1.JurosNorm);
  vLimEspecial := Arredonda(DM.Configuracao1.JurosEsp);
  vLimSimplesPrazo  := Arredonda(DM.Configuracao1.LBMDesconto60);
  vLimEspecialPrazo := Arredonda(DM.Configuracao1.LBMJuros60);

  vPrecosAlterados := False;

  if Cliente1.Convenio > 0 then
  Begin
    with DM.qr_consultas2 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CLIENTE '+
        ' WHERE CNC_CODIGO='+IntToStr(Cliente1.ConvenioCNC)+
        ' AND CLI_CODIGO='+IntToStr(Cliente1.Convenio);
      Open;
      vDescCliente      := FieldByName('CLI_DESCONTO').asFloat;
      vDescClientePrazo := FieldByName('CLI_DESCONTO_PRAZO').asFloat;
    end;
  end
  else
  Begin
    vDescCliente      := Cliente1.Desconto;
    //vDescClientePrazo := Cliente1.DescontoPrazo;
    vDescClientePrazo := Cliente1.Fieldbyname('CLI_DESCONTO_PRAZO').AsFloat;
  end;

  if (vDescCliente > 0) or
     (vDescClientePrazo > 0) then
  Begin
    vLimSimples  := 0;
    vLimEspecial := 0;
    vLimSimplesPrazo  := 0;
    vLimEspecialPrazo := 0;
  end;

  if not Item_Pedido_Venda1.IsEmpty then
  Begin
    Item_Pedido_Venda2.Close;
    Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    Item_Pedido_Venda2.ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Item_Pedido_Venda2.Open;
    Item_Pedido_Venda2.First;
    while not Item_Pedido_Venda2.EOF do
    Begin
      CdTBP := 0;
      with Produto1 do
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda2.CodigoPRD;
        Open;
        if IsEmpty then
          Raise exception.Create('Produto não encontrado! '+IntToStr(Item_Pedido_Venda2.CodigoPRD));

        vDesconto      := 0;
        vPrecoSug      := Arredonda(PrecoVenda); //Preço Sugestão
        vPrecoDes      := Arredonda(Precovenda); //Preço Desconto
        vAlterarPrecos := False;

        //Preço em Dolar
        if FieldByName('SGP_PRECO_DOLAR').asInteger = 1 then
        Begin
          with dm.Indexador_Economico1 do
          Begin
            Close;
            ParamByName('IDE_CODIGO').asInteger := 1; //Dolar
            Open;
            if isEmpty or (Taxa = 0) then
            Begin
              Showmessage('Não foi definido o Preço do Dolar!');
              edtCodigoPRD.SetFocus;
              Exit;
            End;
            vPrecoDes := Arredonda(Taxa*PrecoVenda);
            vPrecoSug := Arredonda(Taxa*PrecoVenda);
          end;
        end;
      end;

      if DM.Configuracao1.Empresa = empMotical then
      Begin
        vAlterarPrecos := True; //Sempre altera os preços, mesmo que tenha autorização ao desconto
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT * '+
            ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
            ' WHERE I1.GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
            ' AND I1.SGP_CODIGO='+IntToStr(Produto1.CodigoSGP)+
            ' AND (I1.PRD_CODIGO=0 OR I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+') '+
            ' AND (T1.CLI_CODIGO=0 '+
            ' OR (T1.CNC_CLIENTE='+edtClienteCNC.Text+
            ' AND T1.CLI_CODIGO='+edtCodigoCLI.Text+') '+
            '  OR (T1.CLI_CODIGO=-1 '+
            '  AND EXISTS (SELECT TBP_CODIGO FROM TABELA_DE_PRECO_CLIENTE TBC '+
            '      WHERE TBC.CNC_TABELA=T1.CNC_CODIGO '+
            '      AND TBC.TBP_CODIGO=T1.TPS_CODIGO '+
            '      AND TBC.CNC_CLIENTE='+edtClienteCNC.Text+
            '      AND TBC.CLI_CODIGO='+edtCodigoCLI.Text+'))) '+
            ' AND I1.ITS_SITUACAO=0 '+
            ' AND T1.TPS_SITUACAO=0 '+
            ' AND T1.TPS_LABORATORIO=0 '+
            ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
            ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' OR '+sTabelaPrecoCPD+') '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
            ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
          Open;
          if IsEmpty then
          Begin
            if (dblFormaPagamento.KeyValue = 1) then
            Begin
              if vDescCliente > 0 then
                vPrecoDes := Arredonda(vPrecoSug-vPrecoSug*vDescCliente/100)
              else if Produto1.FieldByName('GRP_ESPECIAL').asInteger = 1 then //Lente de Contato
                vPrecoDes := Arredonda(vPrecoSug-vPrecoSug*DM.Configuracao1.LBMDesconto60/100) //Desc Simples Lente de Contato
              else
                vPrecoDes := Arredonda(vPrecoSug-vPrecoSug*DM.Configuracao1.JurosNorm/100);
            end
            else
            Begin
              if Produto1.FieldByName('GRP_ESPECIAL').asInteger = 1 then //Lente de Contato
                vPrecoDes := Arredonda(vPrecoSug-vPrecoSug*DM.Configuracao1.LBMJuros60/100) //Desc Esp Lente de Contato
              else
                vPrecoDes := Arredonda(vPrecoSug-vPrecoSug*DM.Configuracao1.JurosEsp/100);
            end;
          end
          else
          Begin
            CdTBP := FieldByname('TPS_CODIGO').asInteger;
            if (dblFormaPagamento.KeyValue = 1) or
               (Cliente1.VendaAtacado) then
              vPrecoDes := Arredonda(FieldByname('ITS_PRECO_VENDA').asFloat-
                                     FieldByname('ITS_PRECO_VENDA').asFloat*
                                     FieldByname('TPS_DESCONTO_SIMPLES').asFloat/100)
            else
              vPrecoDes := Arredonda(FieldByname('ITS_PRECO_VENDA').asFloat-
                                     FieldByname('ITS_PRECO_VENDA').asFloat*
                                     FieldByname('TPS_DESCONTO_ESPECIAL').asFloat/100);
          end;
          Close; //Fechar QueryConsultas
        end;
      end
      else //Diferente Motical
      Begin
        //Os preços somente serão alterados caso o usuário não tenha permissão
        //para os descontos na forma de pagamento planejada
        vDesconto := Arredonda(100-(Item_Pedido_Venda2.PrecoDesc/vPrecoSug*100));

        // Verifica se o usuário tem permissão para liberar desconto à prazo
        If (Forma_de_Pagamento1.Prazo = '0') Then //A Vista
        Begin
          If (vDesconto > vLimEspecial) then
          Begin
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
              vAlterarPrecos := True;
          end
          else if (vDesconto >  vLimSimples) and
                  (vDesconto <= vLimEspecial)  Then //A Vista
          Begin
            If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
              vAlterarPrecos := True;
          End
          Else //Igual ou menor que o Limite Simples
          Begin
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Desc. Total
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and //Desc. Especial
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and //Abaixo do Mínimo
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) then //Desc. Simples
              vAlterarPrecos := True;
          end;
        end
        else //Venda a Prazo com Desconto
        Begin
          if (vDesconto > vLimEspecialPrazo) then
          Begin
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Liberacao Total
              vAlterarPrecos := True;
          end
          else if (vDesconto <= vLimEspecialPrazo) and
                  (vDesconto > vLimSimplesPrazo) then
          Begin
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Liberacao Total
              vAlterarPrecos := True;
          end
          else //Igual ou menor que o Limite Simples Prazo
          Begin
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3600)) < 0) and //Liberacao Normal-Prazo
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Liberacao Total
              vAlterarPrecos := True;
          end;
        end;
      end;


      if (DM.Configuracao1.Empresa = empMotical) and
         (vAlterarPrecos) and
         (not vNaoManterPreco) and
         (not Lib3540) and //Se tiver autorizado para o primeiro produto não perguntar para os próximos
         ((Item_Pedido_Venda2.PrecoSugerido <> vPrecoDes) or
          (Item_Pedido_Venda2.Preco <> vPrecoSug) or
          (Item_Pedido_Venda2.PrecoDesc <> vPrecoDes)) then
      Begin
        if MessageDlg('Os preços precisam ser recalculados!'+#13+
                      'Deseja manter os preços antigos?' ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Begin
          If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
             (not Lib3540) then //Desc.Total
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              onClose:=nil;
              Tag:=47;
              Cancelar:=False;
              Showmodal;
              If not cancelar Then
              Begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then //Desc.Total
                begin
                  free;
                  raise Exception.Create('O usuário não tem permissão para venda com preço diferente do sugerido!');
                end
                else
                Begin
                  Lib3540 := True;
                  vAlterarPrecos := False;
                  DM.Usuario1.GeraLog(3540, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
                    'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                    ' VENDA-MANTER PRECO ANTIGO');
                end;
              end
              else
              begin
                free;
                exit;
              end;
              free;
            End;
          end
          else
          Begin
            Lib3540 := True;
            vAlterarPrecos := False;
            DM.Usuario1.GeraLog(3540, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
              'VENDA-MANTER PRECO ANTIGO');
          end;
        end
        else
          vNaoManterPreco := True;
      end;

      if Lib3540 then
        vDesconto := Arredonda(100-(Item_Pedido_Venda2.PrecoDesc/vPrecoDes*100));


      if (vAlterarPrecos) and
         ((Item_Pedido_Venda2.PrecoSugerido <> vPrecoDes) or
          (Item_Pedido_Venda2.Preco <> vPrecoSug) or
          (Item_Pedido_Venda2.PrecoDesc <> vPrecoDes)) then
      Begin
        vPrecosAlterados :=True;
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_PRECO_SUGERIDO='+VirgPonto(vPrecoDes)+
          ',IPV_PRECO='+VirgPonto(vPrecoSug)+
          ',IPV_DESCONTO=0 '+
          ',IPV_PRECO_DESC='+VirgPonto(vPrecoDes)+
          ',TBP_CODIGO='+IntToStr(CdTBP)+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoCNC)+
          ' AND IPV_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoIPV));

        Entidade.GeraLog(6580, Item_Pedido_Venda2.CodigoCNC, Item_Pedido_Venda2.CodigoPDV,
          'IPV:'+IntToStr(Item_Pedido_Venda2.CodigoIPV)+
          ' PRD:'+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' Qtd:'+format('%.2f',[Item_Pedido_Venda2.Quantidade])+
          ' Preco:'+format('%.2f',[vPrecoSug])+
          ' PrecoDesc:'+format('%.2f',[vPrecoDes])+
          ' Sug: '+format('%.2f',[vPrecoDes])+
          ' TBP: '+IntToStr(CdTBP));
        Result := True;
      end
      else if (Item_Pedido_Venda2.PrecoSugerido <> vPrecoDes) or
              (Item_Pedido_Venda2.Preco <> vPrecoSug) or
              (Item_Pedido_Venda2.Desconto <> vDesconto) then
      Begin
        //Não altera o preço de venda final
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_PRECO_SUGERIDO='+VirgPonto(vPrecoDes)+
          ',IPV_PRECO='+VirgPonto(vPrecoSug)+
          ',IPV_DESCONTO='+VirgPonto(vDesconto)+
          ',TBP_CODIGO='+IntToStr(CdTBP)+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoCNC)+
          ' AND IPV_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoIPV));

        Entidade.GeraLog(6580, Item_Pedido_Venda2.CodigoCNC, Item_Pedido_Venda2.CodigoPDV,
          'IPV:'+IntToStr(Item_Pedido_Venda2.CodigoIPV)+
          ' PRD:'+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' Qtd:'+format('%.2f',[Item_Pedido_Venda2.Quantidade])+
          ' Preco:'+format('%.2f',[vPrecoSug])+
          ' PrecoDesc:'+format('%.2f',[vPrecoDes])+
          ' Sug: '+format('%.2f',[vPrecoDes])+
          ' TBP: '+IntToStr(CdTBP));
      end;
      vTotal := vTotal + vPrecoDes * (Item_Pedido_Venda2.Quantidade-Item_Pedido_Venda2.Bonificacao);
      Item_Pedido_Venda2.Next;
    end;
  end;
  vTotal := vTotal + Arredonda(Entidade.Frete);
  if Entidade.Total <> vTotal then
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_TOTAL='+VirgPonto(vTotal)+
      ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));

  if vPrecosAlterados then
    ShowMessage('Atenção!!! '+#13+
                'Os preços foram atualizados, verifique!');
end;

procedure TfMxPedidoMotCal_2.ObservaoItem1Click(Sender: TObject);
var
  CdCNC, CdIPV: integer;
  sObsItem: string;
begin
  if Item_Pedido_Venda1.IsEmpty then
    Raise exception.Create('Selecione o Item!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');

  CdCNC := Item_Pedido_Venda1.CodigoCNC;
  CdIPV := Item_Pedido_Venda1.CodigoIPV;

  sObsItem := UpperCase(InputBox('Dados do Item', 'Observação:', ''));
  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
    ' IPV_OBSERVACAO="'+sObsItem+'" '+
    ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
    ' AND IPV_CODIGO='+IntToStr(CdIPV));
  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.Open;
  Item_Pedido_Venda1.LocalizarCod(CdIPV, CdCNC);
end;

procedure TfMxPedidoMotCal_2.edtPrecoDescontoChange(Sender: TObject);
begin
  try
    if not edtDesconto.Focused then
      edtDesconto.Text:=format('%.4f',[100-(StrToFloat(edtPrecoDesconto.Text)/StrToFloat(edtPrecoSugestao.Text)*100)]);
  except
  end;
end;

procedure TfMxPedidoMotCal_2.edtQuantidadeExit(Sender: TObject);
begin
  {if dblCodigoFUN.Enabled and
     (dblCodigoFUN.Text = '') then
    dblCodigoFUN.SetFocus;}

  if edtCodigoPRD.Enabled then
    edtCodigoPRD.SetFocus;
end;

procedure TfMxPedidoMotCal_2.memObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfMxPedidoMotCal_2.SB_AltClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Selecione o Produto!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido já foi Entregue!');

  try
    if (StrToInt(edtCodigoPRD.text) > 0) and
       (StrToInt(edtCodigoPRD.text) <> Item_Pedido_Venda1.CodigoPRD) then
      CarregarItemVenda;
  except
  end;
      
  QtdAnt := Item_Pedido_Venda1.Quantidade;
  Item_Pedido_Venda1.PreparaAlteracao;
  AtualizaControles(False, True);
  try
    edtQuantidade.SetFocus;
  except
  end;
end;

procedure TfMxPedidoMotCal_2.SB_FreteClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if (Entidade.IsEmpty) then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!')
  else
  Begin
    Application.CreateForm(TfMXValorEntrada, fMXValorEntrada);
    with fMXValorEntrada do
    Begin
      Tag:=10;
      aux:=self.Item_Pedido_Venda1.AfterScroll;
      self.Item_Pedido_Venda1.AfterScroll:=Nil;
      Caption := 'Valor do Frete';
      labDesValor.Caption := 'Frete: R$';
      edtValorEntrada.Text := Format('%.2f',[self.Entidade.Frete]);
      Showmodal;
      self.Item_Pedido_Venda1.First;
      self.Item_Pedido_Venda1.AfterScroll:=Aux;
      self.CarregarItemVenda;
    end;
  end;
end;

procedure TfMxPedidoMotCal_2.DetalhePedidoCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o pedido!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');

  if DM.Configuracao1.Empresa = empLuciano then
  Begin
    Application.CreateForm(TfMxDetalhePedidoLuciano, fMxDetalhePedidoLuciano);
    with fMxDetalhePedidoLuciano do
    Begin
      Tag:=0;
      edtCodigoCNC.text := IntToStr(self.Entidade.CodigoCNC);
      edtCodigoPDV.text := IntToStr(self.Entidade.CodigoPDV);
      edtClienteCNC.Text     :=IntToStr(self.Entidade.CodigoCNC);
      edtCodigoCLI.Text      := self.edtCodigoCLI.Text;
      edtRazaoSocial.Text    := self.edtRazaoSocial.Text;
      dblLogradouro.KeyValue := self.Cliente1.Logradouro;
      edtEndereco.Text       := self.Cliente1.Endereco;
      edtBairro.Text         := self.Cliente1.Bairro;
      edtCidade.Text         := self.Cliente1.Cidade;
      ItemComboBox(cmbUF,self.Cliente1.UF);
      mskCEP.Text            := self.Cliente1.CEP;
      edtCredito.Text        :=format('%.2f',[self.Cliente1.Credito]);
      ShowModal;
    end;
  end
  else //Outras Empresas (<> Luciano)
  Begin
    Application.CreateForm(TfMxDetalhePedido, fMxDetalhePedido);
    with fMxDetalhePedido do
    Begin
      Tag:=1;
      edtCodigoCNC.text := IntToStr(self.Entidade.CodigoCNC);
      edtCodigoPDV.text := IntToStr(self.Entidade.CodigoPDV);
      edtClienteCNC.Text     :=IntToStr(self.Entidade.CodigoCNC);
      edtCodigoCLI.Text      := self.edtCodigoCLI.Text;
      edtRazaoSocial.Text    := self.edtRazaoSocial.Text;
      dblLogradouro.KeyValue := self.Cliente1.Logradouro;
      edtEndereco.Text       := self.Cliente1.Endereco;
      edtBairro.Text         := self.Cliente1.Bairro;
      edtCidade.Text         := self.Cliente1.Cidade;
      ItemComboBox(cmbUF,self.Cliente1.UF);
      mskCEP.Text            := self.Cliente1.CEP;
      edtCredito.Text        :=format('%.2f',[self.Cliente1.Credito]);
      ShowModal;
    end;
  end;
end;

procedure TfMxPedidoMotCal_2.PagamentoAntecipadoCabClick(Sender: TObject);
var
  vPagAntecipado: Double;
  Trans:Boolean;
  CdCNC, CdPDV, CdCLI, CdCLICNC, CaixaCNC: integer;
  vCreditoAnterior: Double;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Pedido!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');

  if Entidade.CodigoCLI = DM.Configuracao1.CodigoCliAVista then
    Raise Exception.Create('Não é permitido pagamento antecipado para Cliente Balcão!');

  if Forma_de_Pagamento1.Prazo[1] <> '0' then
    Raise exception.Create('Pagamento antecipado somente para vendas com entrada ou à vista!');

  if Entidade.PagamentoAntecipado > 0 then
  Begin
    if MessageDlg('Já houve um pagamento antecipado de R$ '+format('%.2f',[Entidade.PagamentoAntecipado])+'!'+#13+
                  'Deseja gerar outro pagamento?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end;

  try
    vPagAntecipado := Arredonda(StrToFloat(UpperCase(InputBox('Pagamento Antecipado' , 'Valor: R$ ', Format('%.2f',[Entidade.Entrada])))));
    if vPagAntecipado <= 0 then
      Raise exception.Create('');
  except
    ShowMessage('Valor inválido!');
    Exit;
  end;

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;
  CdCLI := Entidade.CodigoCLI;
  CdCLICNC := Entidade.ClienteCNC;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
    ParamByName('CLI_CODIGO').asInteger := CdCLI;
    Open;
    vCreditoAnterior := Arredonda(Credito);
  end;

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(7850)) < 0) then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=47;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      Begin
        if (Usuario1.Permissoes.IndexOf(IntToStr(7850)) < 0)then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão Pagamento Antecipado!');
        end
        else
          DM.Usuario1.GeraLog(7850, CdCNC, CdPDV,
            'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
            ' VENDA-PAG. ANTECIPADO');
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end
  else
    DM.Usuario1.GeraLog(7850, CdCNC, CdPDV,
      'VENDA-PAG. ANTECIPADO');

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;


      DM.Caixa1.Close;
      DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
      DM.Caixa1.Open;
      if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0, DM.Configuracao1.ContRecCliAnt,
           DM.Configuracao1.ContRecCliAnt, DM.Configuracao1.CodigoCAX,
           5 (*Tipo Pag Dinheiro*),DM.Configuracao1.TipoDocumento, CdCNC,
           0(*CdCHQCNCi*), 0(*CdCHQi*),
           'PAG ANTECIPADO PDV:'+IntToStr(CdPDV),'0' (*Flag*), ''(*sNumero*),''(*OBS*),
           '00','C', vPagAntecipado(*Valor*), 0(*Desconto*),0(*Juros*),
           vPagAntecipado, vPagAntecipado(*ValorDoc*),
           DM.Configuracao1.DataHora,
           DM.Configuracao1.Data(*Competencia*),0(*vDtChequePre*),
           0(*TRC*),0(*TituloCNC*),'T') then
      Begin
        ShowMessage('Falha ao gerar Movimento de Caixa');
        Raise Exception.Create('');
      end
      else if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
        DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC, DM.Caixa1.CodigoFUN,
          1,0,'Movimento de Caixa','Pag. Antecipado: '+IntToStr(CdPDV)+#13+#10+
          'Valor: R$ '+format('%.2f',[vPagAntecipado]));

      ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
        ' CLI_CREDITO=CLI_CREDITO+('+VirgPonto(vPagAntecipado)+')'+
        ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CLI_CODIGO='+IntToStr(CdCLI)+
        ' AND CNC_CODIGO='+IntToStr(CdCLICNC));

      if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
          CdCLICNC,CdCLI,4190(*PAG.Antecipado*),CdCNC,CdPDV,CdCNC(*CdPDVCNC*),CdPDV(*CdPDV*),'C',
          vCreditoAnterior(*ValorAnt*),vPagAntecipado(*Valor*)) then
      Begin
        ShowMessage('Falha ao Gerar Mov. de Crédito!');
        Raise Exception.Create('');
      end;

      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_ANTECIPADO=PDV_ANTECIPADO+('+VirgPonto(vPagAntecipado)+')'+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_DT_ANTECIPADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

      Entidade.Close;
      Entidade.Open;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  end;
end;

procedure TfMxPedidoMotCal_2.EntregaAntecipada1Click(Sender: TObject);
var
  CdCNC, CdPDV, CdIPV, CdPRD, CdLOT: integer;
  Trans: Boolean;
  vQtd, vQtdSaldo, vQtdAux: Double;
  vMotivo: string;
begin
  if Item_Pedido_Venda1.IsEmpty then
    Raise exception.Create('Selecione o Item!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');

  CdCNC := Item_Pedido_Venda1.CodigoCNC;
  CdPDV := Item_Pedido_Venda1.CodigoPDV;
  CdIPV := Item_Pedido_Venda1.CodigoIPV;
  CdPRD := Item_Pedido_Venda1.CodigoPRD;
  vQTD  := Item_Pedido_Venda1.Quantidade;
  CdLOT := Item_Pedido_Venda1.CodigoLOT;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger := CdPRD;
    ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    open;
    If IsEmpty Then
      Raise exception.Create('Produto sem Item de Estoque!');
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
      ' WHERE MEF_ENT_CODIGO='+IntToStr(CdPDV)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND MEF_TIPO_MOV=4200 '; //Entrega Antecipada
    Open;
    vQtdSaldo := FieldByName('QTD').asFloat;

    Close;
    SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
      ' WHERE MEF_ENT_CODIGO='+IntToStr(CdPDV)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND MEF_TIPO_MOV=4210 '; //Ext. Entrega Antecipada
    Open;
    vQtdSaldo := vQtdSaldo - FieldByName('QTD').asFloat;

    if vQtdSaldo >= vQtd then
      Raise exception.Create('Produto já entregue!');

    if MessageDlg('Efetuar entrega antecipada?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

    if vQtdSaldo > 0 then
      if MessageDlg('Já foi definida entrega antecipada para esse produto nesse pedido!'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Begin
        ShowMessage('Entrega cancelada!');
        Exit;
      end;
  end;
  vMotivo := UpperCase(InputBox('Entrega Antecipada', 'Observação:', ''));

  if Length(Trim(vMotivo)) < 3 then
    Raise exception.Create('É obrigatório justificar a entrega antecipada!');

  if vQtd-vQtdSaldo > 1 then
  Begin
    try
      vQtdAux := Arredonda(StrToFloat(InputBox('Entrega Antecipada', 'Quantidade:', format('%.2f',[vQtd]))));
      if (vQtdAux <= 0) or
         (vQtdAux > (vQtd-vQtdSaldo)) then
        Raise exception.Create('');
      vQtd := vQtdAux;
    except
      ShowMessage('Quantidade inválida!');
      Exit;
    end;
  end
  else
    vQtd := 1;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger := CdPRD;
    ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    open;
    If IsEmpty Then
      Raise exception.Create('Produto sem Item de Estoque!');
  end;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Gerar Comercial
      If not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,
          CdPRD,0(*CdFUN*),4200,CdCNC,CdPDV,'S', vQtd,
          Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
          Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
          vMotivo) Then
      Begin
        ShowMessage('Falha ao Gerar Mov. Comercial!');
        Raise Exception.Create('');
      end;

      //Gerar Fisico
      If not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,0(*CdFUN*),
          CdCNC,CdPDV,4200(*Entrega Antecipada*),'S',
          vQtd, Item_de_Estoque1.SFisico,vMotivo) then
      Begin
        ShowMessage('Falha ao Gerar Mov. Físico!');
        Raise Exception.Create('');
      end;

      if CdLOT>0 then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
          ' IED_QTD_FISICO=IED_QTD_FISICO-'+VirgPonto(vQtd)+
          ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND LOT_CODIGO='+IntToStr(CdLOT));
      end;

      //Atualizar estoque comercial e Físico
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
        ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(vQtd)+
        ',IES_SFISICO=IES_SFISICO-'+VirgPonto(vQtd)+
        ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      Entidade.GeraLog(7670, CdCNC, CdPDV, 'IPV:'+IntToStr(CdIPV)+' PRD:'+IntToStr(CdPRD)+
          ' Motivo:'+vMotivo+
          ' Qtd:'+format('%.2f',[vQtd])+
          ' Preco:'+format('%.2f',[Item_Pedido_Venda1.Preco])+
          ' PrecoDesc:'+format('%.2f',[Item_Pedido_Venda1.PrecoDesc])+
          ' Sug:'+format('%.2f',[Item_Pedido_Venda1.PrecoSugerido]));

      If DM.Configuracao1.ControleTransacao then
        Commit;
        ShowMessage('Movimentação de Entrega Antecipada concluída!');
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
    //Mostrar Comprovante
    Application.CreateForm(Trpt_ComprovanteMovimento, rpt_ComprovanteMovimento);
    with rpt_ComprovanteMovimento do
    Begin
      Tag := 0;
      Produto1.Close;
      Produto1.ParamByName('PRD_CODIGO').asInteger := CdPRD;
      Produto1.Open;

      Movimento_Fisico1.Close;
      Movimento_Fisico1.ParamByName('CNC_CODIGO').asInteger     := CdCNC;
      Movimento_Fisico1.ParamByName('PRD_CODIGO').asInteger     := CdPRD;
      Movimento_Fisico1.ParamByName('MEF_TIPO_MOV').asInteger   := 4200; //Entrega Antecipada
      Movimento_Fisico1.ParamByName('MEF_ENT_CODIGO').asInteger := CdPDV;
      Movimento_Fisico1.Open;
      report.Preview;
      Close;
    end;
  End;
  Exit;
end;

procedure TfMxPedidoMotCal_2.ExtornoEntregaAntecipada1Click(Sender: TObject);
var
  CdCNC, CdPDV, CdIPV, CdPRD, CdLOT: integer;
  Trans: Boolean;
  vQtd, vQtdSaldo, vQtdAux: Double;
  vMotivo: string;
begin
  if Item_Pedido_Venda1.IsEmpty then
    Raise exception.Create('Selecione o Item!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');

  CdCNC := Item_Pedido_Venda1.CodigoCNC;
  CdPDV := Item_Pedido_Venda1.CodigoPDV;
  CdIPV := Item_Pedido_Venda1.CodigoIPV;
  CdPRD := Item_Pedido_Venda1.CodigoPRD;
  CdLOT := Item_Pedido_Venda1.CodigoLOT;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger := CdPRD;
    ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    open;
    If IsEmpty Then
      Raise exception.Create('Produto sem Item de Estoque!');
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
      ' WHERE MEF_ENT_CODIGO='+IntToStr(CdPDV)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND MEF_TIPO_MOV=4200 '; //Entrega Antecipada
    Open;
    vQtdSaldo := FieldByName('QTD').asFloat;

    Close;
    SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
      ' WHERE MEF_ENT_CODIGO='+IntToStr(CdPDV)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND MEF_TIPO_MOV=4210 '; //Ext. Entrega Antecipada
    Open;
    vQtdSaldo := vQtdSaldo - FieldByName('QTD').asFloat;

    if vQtdSaldo <= 0 then
      Raise exception.Create('Produto já extornado ou não foi entregue!');
  end;

  if MessageDlg('Efetuar extorno de entrega antecipada?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  vMotivo := UpperCase(InputBox('Extorno Entrega Antecipada', 'Observação:', ''));

  if Length(Trim(vMotivo)) < 3 then
    Raise exception.Create('É obrigatório justificar a entrega antecipada!');

  if vQtdSaldo > 1 then
  Begin
    try
      vQtdAux := Arredonda(StrToFloat(InputBox('Extorno Entrega Antecipada', 'Quantidade:', format('%.2f',[vQtdSaldo]))));
      if (vQtdAux <= 0) or
         (vQtdAux > vQtdSaldo) then
        Raise exception.Create('');
      vQtd := vQtdAux;
    except
      ShowMessage('Quantidade inválida!');
      Exit;
    end;
  end
  else
    vQtd := 1;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger := CdPRD;
    ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    open;
    If IsEmpty Then
      Raise exception.Create('Produto sem Item de Estoque!');
  end;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Gerar Comercial
      If not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,
          CdPRD,0(*CdFUN*),4200,CdCNC,CdPDV,'E', vQtd,
          Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
          Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
          vMotivo) Then
      Begin
        ShowMessage('Falha ao Gerar Mov. Comercial!');
        Raise Exception.Create('');
      end;

      //Gerar Fisico
      If not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,0(*CdFUN*),
          CdCNC,CdPDV,4210(*Entrega Antecipada*),'E',
          vQtd, Item_de_Estoque1.SFisico,vMotivo) then
      Begin
        ShowMessage('Falha ao Gerar Mov. Físico!');
        Raise Exception.Create('');
      end;

      if CdLOT>0 then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
          ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(vQtd)+
          ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND LOT_CODIGO='+IntToStr(CdLOT));
      end;

      //Atualizar estoque comercial e Físico
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
        ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(vQtd)+
        ',IES_SFISICO=IES_SFISICO+'+VirgPonto(vQtd)+
        ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      Entidade.GeraLog(7680, CdCNC, CdPDV, 'IPV:'+IntToStr(CdIPV)+' PRD:'+IntToStr(CdPRD)+
          ' Motivo:'+vMotivo+
          ' Qtd:'+format('%.2f',[vQtd])+
          ' Preco:'+format('%.2f',[Item_Pedido_Venda1.Preco])+
          ' PrecoDesc:'+format('%.2f',[Item_Pedido_Venda1.PrecoDesc])+
          ' Sug:'+format('%.2f',[Item_Pedido_Venda1.PrecoSugerido]));

      If DM.Configuracao1.ControleTransacao then
        Commit;
        ShowMessage('Movimentação de Extorno de Entrega Antecipada concluída!');
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
    //Mostrar Comprovante
    Application.CreateForm(Trpt_ComprovanteMovimento, rpt_ComprovanteMovimento);
    with rpt_ComprovanteMovimento do
    Begin
      Tag := 0;

      Produto1.Close;
      Produto1.ParamByName('PRD_CODIGO').asInteger := CdPRD;
      Produto1.Open;

      Movimento_Fisico1.Close;
      Movimento_Fisico1.ParamByName('CNC_CODIGO').asInteger     := CdCNC;
      Movimento_Fisico1.ParamByName('PRD_CODIGO').asInteger     := CdPRD;
      Movimento_Fisico1.ParamByName('MEF_TIPO_MOV').asInteger   := 4210; //Entrega Antecipada
      Movimento_Fisico1.ParamByName('MEF_ENT_CODIGO').asInteger := CdPDV;
      Movimento_Fisico1.Open;
      report.Preview;
      Close;
    end;
  End;
  Exit;
end;

procedure TfMxPedidoMotCal_2.ExtPagamentoAntecipadoCabClick(Sender: TObject);
var
  vPagAntecipado: Double;
  Trans:Boolean;
  CdCNC, CdPDV, CdCLI, CdCLICNC, CaixaCNC: integer;
  vCreditoAnterior: Double;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Pedido!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');

  if Entidade.PagamentoAntecipado <= 0 then
    Raise Exception.Create('Não existe pagamento antecipado para extornar!');

  try
    vPagAntecipado := Arredonda(StrToFloat(UpperCase(InputBox('Pagamento Antecipado' , 'Valor: R$ ', Format('%.2f',[Entidade.Entrada])))));
    if (vPagAntecipado <= 0) or
       (vPagAntecipado > Arredonda(Entidade.PagamentoAntecipado)) then
      Raise exception.Create('');
  except
    ShowMessage('Valor inválido!');
    Exit;
  end;

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;
  CdCLI := Entidade.CodigoCLI;
  CdCLICNC := Entidade.ClienteCNC;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
    ParamByName('CLI_CODIGO').asInteger := CdCLI;
    Open;
    vCreditoAnterior := Arredonda(Credito);
  end;

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(7860)) < 0) then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=47;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      Begin
        if (Usuario1.Permissoes.IndexOf(IntToStr(7860)) < 0)then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão Extornar Pagamento Antecipado!');
        end
        else
          DM.Usuario1.GeraLog(7860, CdCNC, CdPDV,
            'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
            ' VENDA-EXT. PAG. ANTECIPADO');
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end
  else
    DM.Usuario1.GeraLog(7860, CdCNC, CdPDV,
      'VENDA-EXT. PAG. ANTECIPADO');

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;


      DM.Caixa1.Close;
      DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
      DM.Caixa1.Open;
      if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0, DM.Configuracao1.ContRecCliAnt,
           DM.Configuracao1.ContRecCliAnt, DM.Configuracao1.CodigoCAX,
           5 (*Tipo Pag Dinheiro*),DM.Configuracao1.TipoDocumento, CdCNC,
           0(*CdCHQCNCi*), 0(*CdCHQi*),
           'EXT.PAG ANTECIPADO PDV:'+IntToStr(CdPDV),'0' (*Flag*), ''(*sNumero*),''(*OBS*),
           '00','D', vPagAntecipado(*Valor*), 0(*Desconto*),0(*Juros*),
           vPagAntecipado, vPagAntecipado(*ValorDoc*),
           DM.Configuracao1.DataHora,
           DM.Configuracao1.Data(*Competencia*),0(*vDtChequePre*),
           0(*TRC*),0(*TituloCNC*),'T') then
      Begin
        ShowMessage('Falha ao gerar Movimento de Caixa');
        Raise Exception.Create('');
      end
      else if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
        DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC, DM.Caixa1.CodigoFUN,
          1,0,'Movimento de Caixa','Ext.Pag. Antecipado: '+IntToStr(CdPDV)+#13+#10+
          'Valor: R$ '+format('%.2f',[vPagAntecipado]));

      ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
        ' CLI_CREDITO=CLI_CREDITO-('+VirgPonto(vPagAntecipado)+')'+
        ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CLI_CODIGO='+IntToStr(CdCLI)+
        ' AND CNC_CODIGO='+IntToStr(CdCLICNC));

      if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
          CdCLICNC,CdCLI,4230(*Ext.PAG.Antecipado*),CdCNC,CdPDV,CdCNC(*CdPDVCNC*),CdPDV(*CdPDV*),'D',
          vCreditoAnterior(*ValorAnt*),vPagAntecipado(*Valor*)) then
      Begin
        ShowMessage('Falha ao Gerar Mov. de Crédito!');
        Raise Exception.Create('');
      end;

      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_ANTECIPADO=PDV_ANTECIPADO-('+VirgPonto(vPagAntecipado)+')'+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

      Entidade.Close;
      Entidade.Open;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  end;
end;

procedure TfMxPedidoMotCal_2.dbgItensTitleClick(Column: TColumn);
begin
  try
    if Item_Pedido_Venda1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_Pedido_Venda1.SOrdemdoGrid(Item_Pedido_Venda1.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxPedidoMotCal_2.edtDescontoChange(Sender: TObject);
Var
  Descont:Double;
begin
  if edtPrecoDesconto.Focused then
    Exit;

  If not VerificaFloatBranco(edtDesconto.Text) then
  Begin
    Descont := 0;
    edtDesconto.Text := '0';
    edtPrecoDesconto.text := edtPrecoSugestao.Text;
  end
  else
    Descont := StrToFloat(edtDesconto.text);

  if (Descont >= 100) or
     (Descont  = 0) then
    edtPrecoDesconto.Text := edtPrecoSugestao.Text
  Else If VerificaFloatBranco(edtPrecoSugestao.Text) then
    edtPrecoDesconto.Text := Format('%.2f',[StrToFloat(edtPrecoSugestao.Text)-StrToFloat(edtPrecoSugestao.Text)*Descont/100])
  else
    edtPrecoDesconto.Text := '0,00';
end;

procedure TfMxPedidoMotCal_2.edtDescontoExit(Sender: TObject);
begin
  if (edtDesconto.Text = '') then
    edtDesconto.Text:='0';
  if (edtDesconto.Text = '0') then
    edtPrecoDesconto.Text := edtPrecoSugestao.Text;
end;

procedure TfMxPedidoMotCal_2.Vendedor1BeforeOpen(DataSet: TDataSet);
begin
  try
    Vendedor1.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxPedidoMotCal_2.edtCodigoLOTExit(Sender: TObject);
begin
  if (not VerificaInteiroBranco(edtCodigoPRD.Text)) or
     (not VerificaInteiroBranco(edtCodigoLOT.Text)) then
    edtCodigoLOT.Text := '0';

  if StrToInt(edtCodigoLOT.Text) <= 0 then
  Begin
    edtCodigoLOT.Text := '0';
    Exit;
  end;

  with Lote1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
    ParamByName('LOT_CODIGO').asInteger := StrToInt(edtCodigoLOT.Text);
    Open;
    if isEmpty then
    Begin
      edtCodigoLOT.Text := '0';
      Exit;
    end;
  end;
end;

procedure TfMxPedidoMotCal_2.edtCodigoLOTKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadLote, fCadLote);
    with fCadLote do
    Begin
      tag:=3;
      edtCodigoPRD.text := self.edtCodigoPRD.Text;
      edtProduto.Text := self.edtProduto.Text;
      ShowModal;
    end;
  end;
end;

procedure TfMxPedidoMotCal_2.imprimi_cabecalho;
begin
{  if DM.Configuracao1.DiretoImpFiscal then
  Begin
    DM.ImpFiscalB1.MonitoramentoPapel;
    if not DM.ImpFiscalB1.Analisa_iRetorno then
      Raise exception.Create('Falha de Comunicação com a impressora!');

    case DM.ImpFiscalB1.Retorno_Impressora of
      -1: Raise exception.Create('Impressora sem papel ou desligada!');
       0: Begin
            //Papel está acabando
          end;
    end;

    DM.ImpFiscalB1.LimpaItens;

    if not DM.ImpFiscalB1.AbreCupom(Cliente1.CPFCGC) then
      Raise exception.Create('Falha ao Abrir o Cupom Fiscal!');
    if (DM.ImpFiscalB1.iRetorno <> 1) then // Se não for aberto o Cupom
      Raise exception.Create('Falha ao Abrir o Cupom Fiscal!');

    mensagem:='';
    TAM:='';
    for i:=1 to 40-Length(Trim(Cliente1.RazaoSocial)) do
      TAM:=TAM+' ';
    mensagem:=mensagem+PreencheEspaco(48,PreencheZero(5,Cliente1.CodigoCLI)+' - '+
              Trim(Cliente1.RazaoSocial)+TAM);
    mensagem:=mensagem+PreencheEspaco(48,'Fone: '+Trim(Cliente1.Fone));
    mensagem:=mensagem+PreencheEspaco(48,Cliente1.Endereco+TAM);
    TAM:='';
    for i:=1 to 48-Length(Trim(Cliente1.Bairro)+'CEP:'+Trim(Cliente1.CEP)) do
      TAM:=TAM+' ';
    mensagem:=mensagem+PreencheEspaco(48,Trim(Cliente1.Bairro)+TAM+'CEP:'+Trim(Cliente1.CEP));
    TAM:='';
    for i:=1 to 27-Length(Trim(Cliente1.Cidade)+'UF:'+Trim(Cliente1.UF)) do
      TAM:=TAM+' ';
    mensagem:=mensagem+PreencheEspaco(48,Trim(Cliente1.Cidade)+TAM+'UF:'+Trim(Cliente1.UF)+
      ' PDV:'+PreencheZero(7,CdPDV)+' Ven:'+PreencheZero(4,dblCodigoFUN.KeyValue));
    for i:=1 to 48 do
      mensagem := mensagem + '*';
    mensagem:=mensagem+DM.Configuracao1.MensagemCupom;
    DM.ImpFiscalB1.MensagemPromocional:=mensagem;
    NumeroOficial := DM.ImpFiscalB1.RetornoNumeroCupom;
    if NumeroOficial <= 0 then
    Begin
      sleep(300);
      Application.ProcessMessages;
      NumeroOficial := DM.ImpFiscalB1.RetornoNumeroCupom;
      if NumeroOficial <= 0 then
      Begin
        Raise exception.Create('ATENÇÃO !!!'+#13+
                               'Impressora retornou Número do Cupom inválido!');
      end;
    end;
  end;
  }
end;

procedure TfMxPedidoMotCal_2.imprimi_item;
begin
  //tem um erro aqui (Anderson)
  vQtdVendida:=Arredonda(StrtoFloat(edtQuantidade.Text) - QtdAnt);
  if DM.Configuracao1.DiretoImpFiscal then
  Begin
    with DM.QR_Consultas2 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM AGENTE_FINANCEIRO '+
        ' WHERE AGF_CODIGO='+IntToStr(Pedido_de_Venda1.CodigoAGF);
      Open;
      sDescricaoFPG := FieldByName('AGF_DESCRICAO').asString;
      if Length(sDescricaoFPG) > 16 then
        sDescricaoFPG := Copy(sDescricaoFPG,1,16);
    end;
    if (DM.Configuracao1.Empresa IN [empEletro, empPetromax, empHOPE, empLuciano]) then
      vImprimirAouD := True
    else
      vImprimirAouD := False;
    if StrToFloat(edtPrecoDesconto.Text) < StrToFloat(edtPrecoSugestao.Text) then
    begin
      {DM.ImpFiscalB1.AdicionaItem(Produto1.CodigoPRD, Trim(Produto1.Descricao),
        '', Produto1.Referencia, 17 (*vAliquota*), vQtdVendida,
        StrToFloat(edtPrecoDesconto.Text),StrToFloat(edtPrecoSugestao.Text)-StrToFloat(edtPrecoDesconto.Text) );}

//      DM.ImpFiscalB1.AdicionaItem(Produto1.CodigoPRD, Trim(Produto1.Descricao),
//        '', Produto1.Referencia, 17 (*vAliquota*), vQtdVendida,
//        StrToFloat(edtPrecoSugestao.Text),(StrToFloat(edtPrecoSugestao.Text)-StrToFloat(edtPrecoDesconto.Text)) * strtofloat(edtQuantidade.Text) );
      //
//      DM.ImpFiscalB1.ImprimeItemAtual(sDescricaoFPG, StrToFloat(edtPrecoDesconto.Text), 'D', '$', 0, vImprimirAouD,False)
    end
    else
    begin
//      DM.ImpFiscalB1.AdicionaItem(Produto1.CodigoPRD, Trim(Produto1.Descricao),
//        '', Produto1.Referencia, 17 (*vAliquota*), vQtdVendida,
//        StrToFloat(edtPrecoDesconto.Text),0 );
      //
//      DM.ImpFiscalB1.ImprimeItemAtual(sDescricaoFPG, StrToFloat(edtPrecoDesconto.Text), 'D', '$', 0, vImprimirAouD,False)
    end;
  end;
end;

end.
