unit MxServico;
{
  Política de Preço MOTICAL - LABORATÓRIO (Tela de Serviço)

  Observação Geral (Considerando somente tabelas válidas)
  Se o cliente possui uma Tabela Promocional Própria
    Ela será usada independente do preço
  Se NÃO
    Se existirem várias Tabelas Promocionais Gerais será usada a que o preço for menor

  ** Produto **
    Verifica Produto na Tabela Principal do Laboratório
      Pega PreçoTab na Tabela Princinpal do Laboratório
    Se NÃO
      ABORTAR

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
  DBCtrls, Menus, Funcionario, Cliente, Variants, Produto,
  Item_de_Estoque, Cod_Barr, Titulo_receber, Usuario, AgenteFin,
  Forma_de_Pagamento, Parametro, Fatfin, Informacoes, Item_Pacote_Venda,
  Pedido_de_Venda, Item_Pedido_Venda, Detalhe_Venda, DateUtils;

type
  TfMxServico = class(TForm)
    Panel3: TPanel;
    Label27: TLabel;
    Panel5: TPanel;
    Panel1: TPanel;
    dbgProduto: TDBGrid;
    Label23: TLabel;
    Label12: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Cabecalho1: TMenuItem;
    IncluirPed: TMenuItem;
    AlterarPed: TMenuItem;
    N1: TMenuItem;
    SalvarPed: TMenuItem;
    CancelarPed: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Itens1: TMenuItem;
    dblResponsavel: TDBLookupComboBox;
    DS_Funcionario1: TDataSource;
    Funcionario1: TFuncionario;
    SB_Entregar: TSpeedButton;
    SB_Fechar: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    SB_Cancelar: TSpeedButton;
    Label7: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    edtCodigoPDV: TEdit;
    cmbSituacao: TComboBox;
    mskDataPrevisao: TMaskEdit;
    Label13: TLabel;
    edtUsuario: TEdit;
    Label11: TLabel;
    Label10: TLabel;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    Label6: TLabel;
    mskFone: TMaskEdit;
    Label14: TLabel;
    mskFoneContato: TMaskEdit;
    labContato: TLabel;
    edtContato: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    Label18: TLabel;
    edtQuantidade: TEdit;
    SB_NovoPro: TSpeedButton;
    SB_AltPro: TSpeedButton;
    SB_ExcPro: TSpeedButton;
    SB_SalvaPro: TBitBtn;
    SB_CancPro: TBitBtn;
    Label31: TLabel;
    edtPrecoUnitario: TEdit;
    edtPrecoSugestao: TEdit;
    Label19: TLabel;
    Label15: TLabel;
    edtPrecoTotalPRD: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    SB_Imprimir: TSpeedButton;
    IncluirPro: TMenuItem;
    AlterarPro: TMenuItem;
    ExcluirPro: TMenuItem;
    N3: TMenuItem;
    SalvarPro: TMenuItem;
    CancelarPro: TMenuItem;
    edtClienteCNC: TEdit;
    Label29: TLabel;
    mskDataEntrega: TMaskEdit;
    Cliente1: TCliente;
    DSItem_Pedido_Venda1: TDataSource;
    DSPedido_de_Venda1: TDataSource;
    Produto1: TProduto;
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
    Produto1PRD_CARACTERISTICA: TStringField;
    Produto1PRD_OBSERVACAO: TStringField;
    Produto1PRD_PESO_LIQUIDO: TFloatField;
    Item_de_Estoque1: TItem_de_Estoque;
    Item_de_Estoque2: TItem_de_Estoque;
    Item_de_Estoque2ESTOQUE: TFloatField;
    Label32: TLabel;
    edtDocumento: TEdit;
    Label33: TLabel;
    edtCaixa: TEdit;
    Codigo_Barras1: TCodigo_Barras;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    dblTipoPagamento: TDBLookupComboBox;
    dblFormaPagamento: TDBLookupComboBox;
    dblCodigoAGF: TDBLookupComboBox;
    FatorFinanceira1: TFatorFinanceira;
    FatorFinanceira2: TFatorFinanceira;
    edtCodigoPacote: TEdit;
    Titulo_receber5: TTitulo_receber;
    Informacoes1: TInformacoes;
    Itens_Agrupados: TQuery;
    Item_Pacote_Venda1: TItem_Pacote_Venda;
    Titulo_receber2: TTitulo_receber;
    Titulo_receber1: TTitulo_receber;
    edtCodigoTBPProduto: TEdit;
    edtPrecoDesconto: TEdit;
    Pedido_de_Venda1: TPedido_de_Venda;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    edtDataEntrada: TEdit;
    memObservacao: TMemo;
    Label38: TLabel;
    Label39: TLabel;
    edtMedicoNome: TEdit;
    edtMedicoCRM: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label37: TLabel;
    edtOD_ESF: TEdit;
    edtOE_ESF: TEdit;
    edtOD_CIL: TEdit;
    edtOE_CIL: TEdit;
    edtOD_EIXO: TEdit;
    edtOE_EIXO: TEdit;
    edtOD_DNP: TEdit;
    edtOE_DNP: TEdit;
    edtOD_ALT: TEdit;
    edtOE_ALT: TEdit;
    edtOD_ADICAO: TEdit;
    edtOE_ADICAO: TEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    edtTipoLentes: TEdit;
    edtOBSLentes: TEdit;
    edtTipoArmacao: TEdit;
    edtOBSArmacao: TEdit;
    Bevel1: TBevel;
    Detalhe_Venda1: TDetalhe_Venda;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_CODIGO: TIntegerField;
    Item_Pedido_Venda1FUN_CODIGO: TIntegerField;
    Item_Pedido_Venda1IEB_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1SEC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1TBP_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_ENTREGA: TSmallintField;
    Item_Pedido_Venda1IPV_AVISTA: TSmallintField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_DESCONTO: TFloatField;
    Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField;
    Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1IPV_NOTA: TIntegerField;
    Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    Item_Pedido_Venda1Produto: TStringField;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Produto1PRD_FORA_TABELA: TIntegerField;
    Produto1PRD_FORA_PREVISAO: TIntegerField;
    Produto1PRD_INSUMO: TIntegerField;
    Produto1PRD_BASE_REAL: TFloatField;
    Produto1PRD_SERVICO: TIntegerField;
    Produto1PRD_TEMPO_MEDIO: TIntegerField;
    Produto1PRD_NIVEL: TIntegerField;
    Item_Pedido_Venda1DtINI: TStringField;
    Item_Pedido_Venda1DtFIM: TStringField;
    SB_Etiqueta: TSpeedButton;
    Produto1GRP_CODIGO_1: TIntegerField;
    Produto1CNC_CODIGO_1: TIntegerField;
    Produto1GRP_DESCRICAO: TStringField;
    Produto1GRP_OBSERVACAO: TStringField;
    Produto1GRP_ESPECIAL: TIntegerField;
    Produto1GRP_SITUACAO: TIntegerField;
    Produto1GRP_DT_CADASTRO: TDateTimeField;
    Produto1GRP_DT_ALTERADO: TDateTimeField;
    Produto1USU_CODIGO_1: TIntegerField;
    Produto1GRP_SERVICO: TIntegerField;
    Produto1SGP_CODIGO_1: TIntegerField;
    Produto1CNC_CODIGO_2: TIntegerField;
    Produto1GRP_CODIGO_2: TIntegerField;
    Produto1SGP_DESCRICAO: TStringField;
    Produto1SGP_OBSERVACAO: TStringField;
    Produto1SGP_BASE_CHAVE: TStringField;
    Produto1SGP_FAMILIA: TStringField;
    Produto1SGP_SITUACAO: TIntegerField;
    Produto1SGP_DT_CADASTRO: TDateTimeField;
    Produto1SGP_DT_ALTERADO: TDateTimeField;
    Produto1USU_CODIGO_2: TIntegerField;
    Produto1SGP_INDICE_REFRACAO: TFloatField;
    Produto1SGP_FABRICAR: TIntegerField;
    Produto1SGP_PRECO_DOLAR: TIntegerField;
    SB_Cupom: TSpeedButton;
    Item_Pedido_Venda1Total: TFloatField;
    edtDesconto: TEdit;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    PopupMenu1: TPopupMenu;
    ObservaoItem1: TMenuItem;
    Item_Pedido_Venda1IPV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Venda1IPV_VINCULO: TIntegerField;
    Item_Pedido_Venda1IPV_SEQUENCIA: TIntegerField;
    N4: TMenuItem;
    EntradaPed: TMenuItem;
    FretePed: TMenuItem;
    SB_LocPed: TSpeedButton;
    N5: TMenuItem;
    otalPedido1: TMenuItem;
    GerarServioAut1: TMenuItem;
    Produto1PRD_FORA_DE_LINHA: TIntegerField;
    Produto1PRD_CATALOGO: TIntegerField;
    Produto1PRD_PREVISAO: TIntegerField;
    Produto1PRD_CLASSIFICACAO: TIntegerField;
    Produto1PRD_ESTOQUE_DETALHADO: TIntegerField;
    Produto1SGP_EIXOS: TStringField;
    edtBonificacao: TEdit;
    Item_Pedido_Venda1LOT_CODIGO: TIntegerField;
    edtCodigoLOT: TEdit;
    lblDescLote: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_EntregarClick(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_NovoProClick(Sender: TObject);
    procedure SB_AltProClick(Sender: TObject);
    procedure SB_ExcProClick(Sender: TObject);
    procedure SB_SalvaProClick(Sender: TObject);
    procedure SB_CancProClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure dblFormaPagamentoClick(Sender: TObject);
    procedure AgenteFin1BeforeOpen(DataSet: TDataSet);
    procedure AgenteFin1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure Item_Pedido_Venda1AfterScroll(DataSet: TDataSet);
    procedure Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
    procedure Pedido_de_Venda1AfterOpen(DataSet: TDataSet);
    procedure Pedido_de_Venda1BeforeOpen(DataSet: TDataSet);
    procedure Item_Pedido_Venda1AfterOpen(DataSet: TDataSet);
    procedure SB_EtiquetaClick(Sender: TObject);
    procedure SB_CupomClick(Sender: TObject);
    procedure edtOD_ESFExit(Sender: TObject);
    procedure edtOE_ESFExit(Sender: TObject);
    procedure edtOD_CILExit(Sender: TObject);
    procedure edtOE_CILExit(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure ObservaoItem1Click(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoChange(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure EntradaPedClick(Sender: TObject);
    procedure FretePedClick(Sender: TObject);
    procedure otalPedido1Click(Sender: TObject);
    procedure GerarServioAut1Click(Sender: TObject);
    procedure dbgProdutoTitleClick(Column: TColumn);
    procedure Funcionario1BeforeOpen(DataSet: TDataSet);
    procedure edtCodigoLOTExit(Sender: TObject);
    procedure edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
  private
    CdUltimoGRP, CdUltimoSGP: integer;
    QtdAnt: Double;
    vCentraliza: Boolean;
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    procedure CarregarItemVenda;
    procedure LimpaItens(ProdutoServico: integer);
    function RecalcularPrecos:Boolean;
    procedure AtualizaTotal;
    procedure CalcularPrecoSugestao;
  public
    Entidade:TPedido_de_Venda;
    Cancelar, CancelarLoc, CancelarFatura :Boolean;
  end;

var
  fMxServico: TfMxServico;

implementation
Uses
  UDM, funcoes, CdCliente, DigSenha,
  MxSRecPedido, MxSPediProdMotCal,
  MxSPediProd, MxFinalizaPedido, UPedidoServicoCompleto, CdServico,
  MxSPediLoc, UEtiquetaServico, MxSNotaCupom, MxCalculoAdicao,
  UComprovanteMovimento, MxValorEntrada, CdLote;
{$R *.DFM}

procedure TfMxServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    dbgProduto.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_PedSer_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  AgenteFin1.Close;
  Forma_de_Pagamento1.Close;
  Parametro1.Close;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxServico.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  if DM.Configuracao1.Empresa <> empLuciano then
  Begin
    lblDescLote.Visible := False;
    edtCodigoLOT.Visible := False;
  end;
    
  Entidade.Open;
  Funcionario1.Open;
  FatorFinanceira2.Open;
  Parametro1.Open;
  Forma_de_pagamento1.Open;
  AgenteFin1.Open;
  CdUltimoGRP := 0;
  CdUltimoSGP := 0;
  //
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    If not DM.Usuario1.Permissoes.IndexOf(IntToStr(7960)) = 0 then
    begin
      dbgProduto.Columns[2].Visible := False;
      dbgProduto.Columns[3].Visible := False;
      dbgProduto.Columns[4].Visible := False;
      dbgProduto.Columns[5].Visible := False;
      dbgProduto.Columns[7].Visible := False;
      edtProduto.Width := 373;
    end;
    labContato.Caption := 'Paciente';
  end;
  //
  try
    edtTipoLentes.SetFocus;
  except
  end;
end;

procedure TfMxServico.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  Item_Pedido_Venda1.PServico := True;
  try
    dbgProduto.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_PedSer_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  vCentraliza := False;
end;

procedure TfMxServico.SB_NovoPedClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6600)) < 0) then
    Raise exception.Create('Usuário não tem permissão para inserir/alterar Pedido!');

  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  try
    Item_Pedido_Venda1.Close;
    Entidade.Close;
    Entidade.Open;
    Item_Pedido_Venda1.Open;
  finally
    Item_Pedido_Venda1.AfterScroll:=Aux;
  end;
  If not Entidade.IsEmpty Then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO '+
        ' FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      Open;
      if IsEmpty then
      Begin
        Detalhe_Venda1.Deletar(Entidade.CodigoCNC,Entidade.CodigoPDV);
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
        Entidade.RegistrarDel(Entidade.CodigoCNC, 1860(*PedidoDeVenda*), Entidade.CodigoPDV, 'Vazio - Novo Pedido');
        Entidade.Close;
        Entidade.Open;
      end;
    end;
  end;
  if not Entidade.FecharPedido then
    raise Exception.Create('Não foi possível liberar o pedido atual.');
  Item_Pedido_Venda1.Close;
  with Entidade do
  Begin
    Close;
    SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO=-1 '+
      ' AND PDV_CODIGO=-1 ';
    Open;
  end;
  Item_Pedido_Venda1.Open;



  Entidade.PreparaInsercao;
  AtualizaControles(1,True);

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT FUN_CODIGO FROM FUNCIONARIO '+
      ' WHERE FUN_USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU);
    Open;
    if not isEmpty then
      dblResponsavel.KeyValue := FieldByName('FUN_CODIGO').asInteger
    else
      dblResponsavel.KeyValue := -1;
  end;

  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  dblTipoPagamento.KeyValue:=5;
  dblFormaPagamento.KeyValue:=1;
  dblFormaPagamentoClick(sender);
  Detalhe_Venda1.LimpaCampos(1);
  edtCodigoCLI.SetFocus;
end;

procedure TfMxServico.SB_AltPedClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Pedido de Serviço!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido já foi Entregue!');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6600)) < 0) then
    Raise exception.Create('Usuário não tem permissão para inserir/alterar Pedido!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  If Entidade.Situacao >= 2  then
  Begin
    Entidade.AtualizaControles(False);
    dblTipoPagamento.Enabled := True;
    dblFormaPagamento.Enabled := True;
    dblCodigoAGF.Enabled := True;
    ShowMessage('Atenção o Pedido está em andamento!');
  end;
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  try
    edtCodigoCLI.SetFocus;
  except
    try
      dblTipoPagamento.SetFocus;
    except
    end;
  end;
end;

procedure TfMxServico.SB_SalvaPedClick(Sender: TObject);
var
  Trans : Boolean;
  CdCNC, CdPDV, CdCLICNC, CdCLI, iEntrandoDados, vSit: integer;
begin
  if dblResponsavel.Text = '' then
  Begin
    try
      dblResponsavel.SetFocus;
    except
    end;
    Raise exception.Create('Responsável inválido!');
  end;
  If (dblTipoPagamento.Text = '') then
    Raise Exception.Create('Tipo de pagamento faltando!');
  If (dblFormaPagamento.Text = '')then
    Raise Exception.Create('Forma de pagamento faltando!');
  If (dblCodigoAGF.Text = '') then
    Raise Exception.Create('Agente financeiro faltando!');

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdPDV := StrToInt(edtCodigoPDV.Text);
  CdCLICNC := StrToInt(edtClienteCNC.Text);
  CdCLI := StrToInt(edtCodigoCLI.Text);

  if (dblTipoPagamento.KeyValue <> 412) and //Boleto Bancário
     (Informacoes1.Boleto) and
     ((dblTipoPagamento.KeyValue <> 5) or //Dinheiro/Promissória
      (dblFormaPagamento.KeyValue <> 1)) then //Dif. A Vista
  Begin
    if MessageDlg('Tipo de Pagamento inválido para o cliente! (Boleto)!'+#13+
                  'Deseja Continar?' ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=31;
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
              ' SERVICO-TIPO_PAG');
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
        'SERVICO-TIPO_PAG');
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
     (dblFormaPagamento.KeyValue <> 1) then //Dif. A Vista
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
          Tag:=31;
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
                ' SERVICO-FORMA_PAG');
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
          'SERVICO-FORMA_PAG');
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

  //Confirmar Condição de Pagamento
  If (dblTipoPagamento.Text = '') then
    Raise Exception.Create('Tipo de pagamento faltando!');
  If (dblFormaPagamento.Text = '')then
    Raise Exception.Create('Forma de pagamento faltando!');
  If (dblCodigoAGF.Text = '') then
    Raise Exception.Create('Agente financeiro faltando!');

  if Entidade.Situacao >= 2 then
    vSit := Entidade.Situacao //Para poder alterar um Serviço em andamento sem mudar a situação
  else
    vSit := 0;

  Informacoes1.Close;
  Informacoes1.ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
  Informacoes1.ParamByName('CLI_CODIGO').asInteger := CdCLI;
  Informacoes1.Open;
  if Informacoes1.Proibido then
    Raise exception.Create('Cliente Bloqueado!'+#13+'Procure a gerência!');

  if (StrToInt(edtCodigoCLI.Text) <> DM.Configuracao1.CodigoCliAVista) and
     (not ((dblFormaPagamento.KeyValue = 1) and (dblTipoPagamento.KeyValue = 5))) then
  Begin
    if Cliente1.SPC = 1 then
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
          Tag:=31;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0)then
            Begin
              free;
              raise Exception.Create('O usuário não tem permissão para vender a Cliente no SPC!');
            end
            else
              DM.Usuario1.GeraLog(8930, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' CLI: '+IntToStr(CdCLICNC)+'-'+IntToStr(CdCLI)+' SERVICO-SPC');
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
          'CLI: '+IntToStr(CdCLICNC)+'-'+IntToStr(CdCLI)+' SERVICO-SPC');
    end;
    Titulo_receber5.Close;
    Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger := CdCLICNC;
    Titulo_receber5.ParamByName('CLI_CODIGO').asInteger  := CdCLI;
    Titulo_receber5.ParamByName('DATA').asDate           := DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente;
    Titulo_receber5.Open;
    if not Informacoes1.IsEmpty then
    Begin
      with DM.Avalista1 do
      Begin
        if VerificaInteiroBranco(Cliente1.CGFRG) or
           VerificaInteiroBranco(Cliente1.CPFCGC) then
        Begin
          Close;
          SQL.Text := 'SELECT * FROM AVALISTA ' +
            ' WHERE CNC_CODIGO='+IntToStr(Informacoes1.CodigoCNC)+
            ' AND ((AVL_CGF_RG="'+Cliente1.CGFRG+'" AND AVL_CGF_RG<>"") '+
            ' OR (AVL_CGC_CPF="'+Cliente1.CPFCGC+'" AND AVL_CGC_CPF<>""))';
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
    else if (not ((dblTipoPagamento.KeyValue = 5) and
       (dblFormaPagamento.KeyValue = 1))) then
      Raise Exception.Create('Cliente sem Limite de Crédito Definido!');

    if (not Titulo_receber5.IsEmpty) then
    Begin
      if MessageDlg('Cliente Inadiplente!'+#13+
                    'Deseja Continar?' ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (not Informacoes1.LiberaInadiplencia) and
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=31;
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
                ' CLI: '+IntToStr(CdCLICNC)+'-'+IntToStr(CdCLI)+' SERVICO-INADIPLENTE');
          end
          else
          begin
            free;
            exit;
          end;
          free;
        End;
      end
      else if not Informacoes1.LiberaInadiplencia then
        DM.Usuario1.GeraLog(3790, CdCNC, CdPDV,
          'CLI: '+IntToStr(CdCLICNC)+'-'+IntToStr(CdCLI)+' SERVICO-INADIPLENTE');
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

      iEntrandoDados := Entidade.Estado;

      if not Detalhe_Venda1.FinalizaEdicao(iEntrandoDados) then
        Raise exception.Create('');

      if not Entidade.FinalizaEdicao(vSit(*Sit*),0(*Listado*),0(*Total*),0(*Acrescimo*),False(*GRPEsp*),True(*Serviço*)) then
        Raise exception.Create('');

      if trans then
        Commit;
      Trans := False; //Para não fazer mais RollBack

      AtualizaControles(1,False);
      with Entidade do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PDV_CODIGO='+IntToStr(CdPDV);
        Open;
      end;

      //Recalcular os Preços
      if (not Item_Pedido_Venda1.IsEmpty) then
        ReCalcularPrecos;

      Item_Pedido_Venda1.Close;
      Entidade.Close;
      Entidade.Open;
      Item_Pedido_Venda1.Open;
      if Item_Pedido_Venda1.IsEmpty then
        SB_NovoProClick(sender);
    except
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
end;

procedure TfMxServico.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    Detalhe_Venda1.LimpaCampos(0);
    dblResponsavel.KeyValue := -1;
    edtUsuario.Clear;
    edtRazaoSocial.Clear;
    mskFone.Clear;
    edtProduto.Clear;
    edtPrecoTotalPRD.Clear;
  end;
end;

procedure TfMxServico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaPed.Enabled or SB_SalvaPro.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
  If not Entidade.IsEmpty Then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO '+
        ' FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      Open;
      if IsEmpty then
      Begin
        Detalhe_Venda1.Deletar(Entidade.CodigoCNC,Entidade.CodigoPDV);
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
        Entidade.RegistrarDel(Entidade.CodigoCNC, 1860(*PedidoDeVenda*), Entidade.CodigoPDV, 'Vazio - CloseQuery');
      end
      else if not Entidade.FecharPedido then
      Begin
        Showmessage('Não foi possível liberar o pedido atual.');
        Canclose:=False;
        exit;
      end;
    end;
  end;
end;

procedure TfMxServico.SB_EntregarClick(Sender: TObject);
var
  Trans, vTemEntrada : Boolean;
  CdCNC, CdPDV, CdPRD, CdSER, CdCLICNC, CdCLI,SEQ,
    iGerarTitulos, iOpcaoFin, iGrupoEspecial, CdSGP, CdLOT: integer;
  vQtd, vTotal, vPreco: Double;
  sSubGrupo, sCodigoCARTAO: string;
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido já foi Entregue!');
  If (Entidade.Situacao <> 3) then
    Raise Exception.Create('Pedido em andamento ou Entregue!');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1980)) < 0 then
    raise Exception.Create('O usuário não tem permissão para entregar serviço!');

  if MessageDlg('Deseja definir como Pedido Entregue?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdCNC    := Entidade.CodigoCNC;
  CdPDV    := Entidade.CodigoPDV;
  CdCLI    := Entidade.CodigoCLI;
  CdCLICNC := Entidade.ClienteCNC;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
    ParamByName('CLI_CODIGO').asInteger := CdCLI;
    Open;
  end;

//  if (DM.Configuracao1.Empresa IN TEmpresasOtica) then
  if (DM.Configuracao1.Empresa = empMotical) then
  Begin
    with DM.QR_Consultas do
    Begin
      //Verificar Produtos do mesmo SubGrupo com Preços diferentes
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
  //
  with DM.QR_Consultas do
  Begin
    //Verificar se tem Grupo Especial
    Close;
    SQL.Text := 'SELECT TOP 1 GRP_ESPECIAL '+
      ' FROM GRUPO G1 '+
      ' WHERE G1.GRP_CODIGO IN '+
      ' (SELECT GRP_CODIGO FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPRD)+') ';
    Open;
    if FieldByName('GRP_ESPECIAL').asString = '1' then
      iGrupoEspecial:=1
    else
      iGrupoEspecial:=0;
  end;

  if (Forma_de_Pagamento1.Prazo[1] = '0') then
    vTemEntrada := True
  else
    vTemEntrada := False;

  //Selecionar Tipo de Pedido
  edtCodigoPacote.Text := '0';
  Application.CreateForm(TfMxFinalizaPedido, fMxFinalizaPedido);
  with fMxFinalizaPedido do
  Begin
    Tag:=1;
    iCdCLI    := self.Entidade.CodigoCLI;
    iCdCLICNC := self.Entidade.ClienteCNC;
    //Verificar a Vista
    if dblFormaPagamento.KeyValue = 1 then
      rdbPendente.Enabled := False;

    if Arredonda(self.Cliente1.Credito) >= Arredonda(Entidade.Total) then
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
        ' WHERE CNC_CLIENTE='+IntToStr(self.Entidade.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(self.Entidade.CodigoCLI)+
        ' AND PCT_BLOQUEADO<>1 '+
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

  if iOpcaoFin = 2 then
  Begin
    //Verifica Itens de Pacote (Produto)
    with Itens_Agrupados do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
      Open;
      while not EOF do
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
            
          while not Eof do
          Begin
            if (CodigoSGP1=Itens_Agrupados.FieldByName('SGP_CODIGO').asinteger) and
               (saldo<Itens_Agrupados.FieldByName('QUANTIDADE').asinteger)then
              Raise exception.Create('Quantidade superior ao disponível no Pacote!');
            if (CodigoSGP2=Itens_Agrupados.FieldByName('SGP_CODIGO').asinteger) and
               (saldo<Itens_Agrupados.FieldByName('QUANTIDADE').asinteger)then
              Raise exception.Create('Quantidade superior ao disponível no Pacote!');
            if (CodigoSGP3=Itens_Agrupados.FieldByName('SGP_CODIGO').asinteger) and
               (saldo<Itens_Agrupados.FieldByName('QUANTIDADE').asinteger)then
              Raise exception.Create('Quantidade superior ao disponível no Pacote!');
            if (CodigoSGP4=Itens_Agrupados.FieldByName('SGP_CODIGO').asinteger) and
               (saldo<Itens_Agrupados.FieldByName('QUANTIDADE').asinteger)then
              Raise exception.Create('Quantidade superior ao disponível no Pacote!');

            ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
              ' IPV_PRECO_DESC='+VirgPonto(Item_Pacote_Venda1.PrecoDesc)+
              ',IPV_DESCONTO=ROUND('+VirgPonto(Item_Pacote_Venda1.PrecoDesc)+'/IPV_PRECO_SUGERIDO*100,4) '+
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND PDV_CODIGO='+edtCodigoPDV.Text+
              ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
              ' FROM PRODUTO '+
              ' WHERE SGP_CODIGO='+Itens_Agrupados.FieldByName('SGP_CODIGO').asString+') ');

            Next;
          end;
        end;
        Next;
      end;
      Close; //Fechar Tabela
    end;
    AtualizaTotal;
  end;


  //Não é permitido definir Entrada para faturamento pendente
  if (Entidade.Entrada > 0) and
     (iOpcaoFin = 2) then
    Raise exception.Create('Não é permitido definir valor da entrada para faturamento pendente!'+#13+
      'Defina valor 0,00 (zero) para entrada, para que o sistema possa calcular a entrada automaticamente!');

  if (iOpcaoFin <> 2) and
     (CdCLI <> DM.Configuracao1.CodigoCliAVista) and
     (not ((dblFormaPagamento.KeyValue = 1) and (dblTipoPagamento.KeyValue = 5))) then
  Begin
    if Cliente1.SPC = 1 then
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
          Tag:=31;
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
              DM.Usuario1.GeraLog(8930, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' CLI: '+IntToStr(CdCLICNC)+'-'+IntToStr(CdCLI)+' SERVICO-SPC');
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
        DM.Usuario1.GeraLog(8930, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
          'CLI: '+IntToStr(CdCLICNC)+'-'+IntToStr(CdCLI)+' SERVICO-SPC');
    end;
    Titulo_receber5.Close;
    Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger := CdCLICNC;
    Titulo_receber5.ParamByName('CLI_CODIGO').asInteger  := CdCLI;
    Titulo_receber5.ParamByName('DATA').asDate           := DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente;
    Titulo_receber5.Open;
    Informacoes1.Close;
    Informacoes1.ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
    Informacoes1.ParamByName('CLI_CODIGO').asInteger := CdCLI;
    Informacoes1.Open;
    if not Informacoes1.IsEmpty then
    Begin
      if Informacoes1.Proibido then
      Begin
        ShowMessage('Cliente Bloqueado!'+#13+'Procure a gerência!');
        Exit;
      end
      else
      Begin
        with DM.Avalista1 do
        Begin

          if VerificaInteiroBranco(Cliente1.CGFRG) or
             VerificaInteiroBranco(Cliente1.CPFCGC) then
          Begin
            Close;
            SQL.Text := 'SELECT * FROM AVALISTA ' +
              ' WHERE CNC_CODIGO='+IntToStr(Informacoes1.CodigoCNC)+
              ' AND ((AVL_CGF_RG="'+Cliente1.CGFRG+'" AND AVL_CGF_RG<>"") '+
              ' OR (AVL_CGC_CPF="'+Cliente1.CPFCGC+'" AND AVL_CGC_CPF<>""))';
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
      end;
    end
    else
      Raise Exception.Create('Cliente sem Limite de Crédito Definido!');

    if (Titulo_receber5.Active) and
       (not Titulo_receber5.IsEmpty) and
       (not Informacoes1.LiberaInadiplencia) then
    Begin
      if MessageDlg('Cliente Inadiplente!'+#13+
                    'Deseja Continar?' ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (Informacoes1.LiberaInadiplencia) or
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=31;
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
              DM.Usuario1.GeraLog(3790, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' CLI: '+IntToStr(CdCLICNC)+'-'+IntToStr(CdCLI)+' SERVICO-INADIPLENTE');
          end
          else
          begin
            free;
            exit;
          end;
          free;
        End;
      end
      else If (not Informacoes1.LiberaInadiplencia) then
        DM.Usuario1.GeraLog(3790, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
          'CLI: '+IntToStr(CdCLICNC)+'-'+IntToStr(CdCLI)+' SERVICO-INADIPLENTE');
    end;
  end;

  vTotal := 0;
  with Item_Pedido_Venda1 do
  Begin
    Close;
    Open;
    while not Eof do
    Begin
      vTotal := vTotal + Arredonda(Quantidade*Arredonda(PrecoDesc));
      Next;
    end;
  end;

  if iOpcaoFin in [2,3] then //Remessa ou Pré-Pago
  Begin
    if (dblTipoPagamento.KeyValue <> 5) or  //Dinheiro
       (dblFormaPagamento.KeyValue <> 1) or //A Vista
       (dblCodigoAGF.KeyValue <> 1) then    //Loja
      Raise exception.Create('Tipo de Pagamento/Forma de Pagamento/Agente Financeiro inválidos para Remessa/Pré-Pago!');

    if iOpcaoFin = 3 then //Pré-Pago
    Begin
      //Atualizar o Crédito
      if vTotal > Cliente1.Credito then
          Raise exception.Create('Crédito inferior ao valor da compra! (R$'+format('%.2f',[Cliente1.Credito])+')');
    end;
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

  if not Titulo_receber1.Active then
    Titulo_receber1.Open;

  if not Titulo_receber2.Active then
    Titulo_receber2.Open;

  //Deletar os títulos gerados na tabela temporaria por este item antes de gerá-los novamente
  ExecutaSQL(DM.QR_Comandos,'DELETE FROM TRCTEMP '+
    ' WHERE PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
    ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC));

  //Gerar Títulos Temporários
  if iGerarTitulos = 1 then
  Begin
    if Entidade.CodigoFPG = 1 then //A Vista
    Begin
      if not Titulo_receber1.GerarTitVista(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartaoCV*),vTotal) then
        Raise exception.Create('Não foi possível gerar Título à Vista!');
    end
    else if Entidade.TipoPag = 13 then //Cartão
    Begin
      if not Titulo_receber1.GerarTitPrazo(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartaoCV*), vTotal,Entidade.Entrada,vTemEntrada,True) then
        Raise exception.Create('Não foi possível gerar Título Cartão!');
    end
    else
    Begin
      if not Titulo_receber1.GerarTitPrazo(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartaoCV*), vTotal,Entidade.Entrada,vTemEntrada,False) then
        Raise exception.Create('Não foi possível gerar Título à Prazo!');
    end;
  end;

  //Verificar dados do Cliente para Compra a Prazo
  if (DM.Configuracao1.Empresa = empLuciano) and
     (dblFormaPagamento.KeyValue <> 1) and //Diferente de A Vista
     ((not VerificaCPFCNPJBranco(Cliente1.CPFCGC)) or
      (Length(CLiente1.Mae) <= 3)) then
  Begin
    if MessageDlg('Dados do Cliente inconpletos!'+#13+
                  'Deseja Continar?' ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(7360)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=31;
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
              ' SERVICO-DADOS CLIENTE');
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
        'SERVICO-DADOS CLIENTE');
  end;

  sCodigoCARTAO := '';
  if (dblTipoPagamento.KeyValue = 13) and //Cartão
     (iGerarTitulos = 1) then
  Begin
    sCodigoCARTAO := Trim(UpperCase(InputBox('Comprovante de Venda' , 'CV:', '')));
    if Length(sCodigoCARTAO) < 5 then
    Begin
      ShowMessage('Comprovante de Venda (CV) inválido!');
      Exit;
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
          Titulo_receber2.Open;
          SEQ:=1;

          While not EOF do
          Begin
            if iOpcaoFin = 0 then //Normal
            Begin
              if not Titulo_receber2.Inserir(DM.Configuracao1.CodigoCNC,0,
                  FieldByName('CLI_CODIGO').AsInteger,FieldByName('PDV_CODIGO').AsInteger,
                  FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
                  dblTipoPagamento.KeyValue,FieldByName('TRC_TIPO_DOC').AsInteger,0(*TRF*),0(*Reabertura*),
                  FieldByName('TRC_VENCIMENTO').AsDateTime,0(*DtPag*),0(*DtOrigem*),
                  0(*DtVerificado*),FieldByName('TRC_OBSERVACAO').AsString,PreencheZero(2,SEQ),
                  ''(*Numero*),sCodigoCARTAO,
                  FieldByName('TRC_VALOR').AsFloat,0(*ValorPag*),
                  FieldByName('TRC_CRED_CLI').AsFloat,FieldByName('AGF_CODIGO').AsInteger,
                  Cliente1.CodigoCNC,0(*Situacao*),0(*TitAnterior*),0(*TitOrigem*),
                  0(*TipoPedido*), False(*MovCaixa*), False(*CHQDev*)) then
              Begin
                ShowMessage('Falha ao gerar TRC!');
                Raise Exception.Create('');
              end;
            end
            else //Pré-Pago
            Begin
              if not Titulo_receber2.Inserir(DM.Configuracao1.CodigoCNC,0,
                  FieldByName('CLI_CODIGO').AsInteger,FieldByName('PDV_CODIGO').AsInteger,
                  FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
                  dblTipoPagamento.KeyValue,FieldByName('TRC_TIPO_DOC').AsInteger,0(*TRF*),0(*Reabertura*),
                  FieldByName('TRC_VENCIMENTO').AsDateTime,
                  DM.Configuracao1.DataHora(*DtPag*),
                  0(*DtOrigem*),0(*DtVerificado*),
                  FieldByName('TRC_OBSERVACAO').AsString,PreencheZero(2,SEQ),
                  ''(*Numero*),''(*CartaoCV*),
                  FieldByName('TRC_VALOR').AsFloat,
                  FieldByName('TRC_VALOR').AsFloat(*ValorPag*),
                  FieldByName('TRC_CRED_CLI').AsFloat,FieldByName('AGF_CODIGO').AsInteger,
                  Cliente1.CodigoCNC,
                  2(*Situacao*),0(*TitAnterior*),0(*TitOrigem*),0(*TipoPedido*),
                  False(*MovCaixa*), False(*CHQDev*)) then
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
                'TRC:'+IntToStr(Titulo_receber2.SCodigo)+
                '(Credito:'+format('%.2f',[FieldByName('TRC_VALOR').AsFloat])+')',
                '1'(*Flag*),''(*Numero*),''(*Obs*),'01'(*Seq*),
                'C',0(*Valor*),0(*Desconto*),0(*Juros*),FieldByName('TRC_VALOR').AsFloat,
                FieldByName('TRC_VALOR').AsFloat(*ValorDoc*),DM.Configuracao1.DataHora,
                DM.Configuracao1.DataHora(*Competência*),0(*DtCheque*),Titulo_receber2.SCodigo,
                DM.Configuracao1.CodigoCNC,'T') then
              Begin
                ShowMessage('Falha ao gerar Mov. Caixa!');
                Raise Exception.Create('');
              end;

              if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
                CdCLICNC,CdCLI,1003,DM.Configuracao1.CodigoCNC,
                Titulo_receber2.SCodigo,CdCNC,CdPDV,'D',Cliente1.Credito,
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
      Item_Pedido_Venda1.First;
      while not Item_Pedido_Venda1.Eof do
      Begin
        CdPRD := Item_Pedido_Venda1.CodigoPRD;
        vQtd  := Item_Pedido_Venda1.Quantidade;
        CdLOT := Item_Pedido_Venda1.CodigoLOT;

        if iOpcaoFin = 2 then //Remessa
        Begin
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT TOP 1 SGP_CODIGO '+
              ' FROM PRODUTO '+
              ' WHERE PRD_CODIGO='+IntToStr(CdPRD);
            Open;
            if (Trim(FieldByName('SGP_CODIGO').asString) = '') or
               (Trim(FieldByName('SGP_CODIGO').asString) = '0') then
            Begin
              ShowMessage('Produto ('+IntToStr(CdPRD)+') sem SubGrupo definido!');
              Raise exception.Create('');
            end;
            sSubGrupo := FieldByName('SGP_CODIGO').asString;
          end;
          ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PACOTE_DE_VENDA SET '+
            ' IPC_QUANTIDADE_ENTREGUE=IPC_QUANTIDADE_ENTREGUE+'+VirgPonto(vQtd)+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_CODIGO='+edtCodigoPacote.Text+
            ' AND (SGP_CODIGO_1='+sSubGrupo+
            '   OR SGP_CODIGO_2='+sSubGrupo+
            '   OR SGP_CODIGO_3='+sSubGrupo+
            '   OR SGP_CODIGO_4='+sSubGrupo+')');
        end;

        //Gerar Movimento Comercial
        If not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,
            CdPDV,0(*CdFUN*),500(*VendaServiço*),CdCNC,CdPDV,'S', vQtd,
            Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
            Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*)) Then
        Begin
          ShowMessage('Falha ao Gerar Mov. Comercial!');
          Raise Exception.Create('');
        end;
        //Gerar Movimento Físico
        If not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,0(*CdFUN*),
            CdCNC,CdPDV,500(*VendaServiço*),'S',
            vQtd, Item_de_Estoque1.SFisico) then
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

        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
          ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(vQtd)+
          ',IES_SFISICO=IES_SFISICO-'+VirgPonto(vQtd)+
          ',IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(vQtd)+
          ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC));

        Item_Pedido_Venda1.Next;
      end;

      ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_SITUACAO = 4 '+ //Entregue ao Cliente (Finalizado)
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',PDV_PACOTE='+edtCodigoPacote.Text+ //Definir Pacote
        ',PDV_DT_ENTREGA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
        ',PDV_TIPO_VENDA='+IntToStr(iOpcaoFin)+ // 0 - Normal; 1 - Pendente; 2 - Remessa
        ',PDV_TITULO_GERADO='+IntToStr(iGerarTitulos)+
        ',PDV_TITULO_GERADO2='+IntToStr(iGerarTitulos)+        
        ',PDV_SERVICO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

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
        if (iOpcaoFin <> 2) and (Entidade.CodigoFPG <> 1) and (Entidade.TipoPag <> 13) then
        Begin
          if (Informacoes1.Active) and (Informacoes1.IsEmpty) then
          Begin
            if not Informacoes1.Inserir(CdCLICNC,CdCLI,0,0,0,0,vTotal,
                0,0,0(*Renda*), DM.Configuracao1.DataHora,'','','','','','',False,False,vTotal) then
              Raise exception.Create('');
          end
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
              ' ICR_CRED_UTIL='+VirgPonto(Informacoes1.CreditoUtil+vTotal)+
              ',ICR_DT_ULT_CMP="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',ICR_VL_ULT_CMP='+VirgPonto(vTotal)+
              ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
              ' AND CLI_CODIGO='+IntToStr(CdCLI));
        end;
      end;

      if not Entidade.GeraLog(1980,CdCNC,CdPDV,'Entregar Serviço') then
      Begin
        ShowMessage('Falha ao gerar log!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
      //Deletar os títulos gerados na tabela temporaria
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM TRCTEMP '+
        ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      //Desabilita botões
      if iOpcaoFin = 1 then //Faturamento Pendente
        SB_Cupom.Enabled := False;

    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          Exit;
        end;
    end;
  End;

  //Verificar os títulos a receber
  if (iOpcaoFin = 0) then
  Begin
    If MessageDlg('Deseja ver os títulos desse Cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      Application.CreateForm(TfMxSRecPed, fMxSRecPed);
      with fMxSRecPed do
      Begin
        Tag :=7;
        edtCodigoCLI.Text     :=  IntToStr(self.Cliente1.CodigoCLI);
        edtRazaoSocial.Text   :=  self.Cliente1.RazaoSocial;
        mskCNPJ_CPF.Text      :=  self.Cliente1.CPFCGC;
        edtCGF_RG.Text        :=  self.Cliente1.CGFRG;
        edtObservacaoCLI.Text :=  self.Cliente1.OBS;
        Cliente1.Close;
        Cliente1.ParamByName('CNC_CODIGO').AsInteger := self.Cliente1.CodigoCNC;
        Cliente1.ParamByName('CLI_CODIGO').AsInteger := self.Cliente1.CodigoCLI;
        ShowModal;
      end;
    End;
  end;
  Entidade.Close;
  Entidade.Open;

  if (iOpcaoFin = 0) and
     Cliente1.Nota then
    SB_CupomClick(sender);
end;

procedure TfMxServico.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxServico.SB_CancelarClick(Sender: TObject);
var
  CdCNC, CdPDV: integer;
  aux:TDataSetNotifyEvent;
  Trans: Boolean;
  vMotivo: string;
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido finalizado!');
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Pedido!');

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;

  If MessageDlg('Tem certeza que deseja Cancelar esse Pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  vMotivo := UpperCase(InputBox('Cancelamento de Serviço', 'Motivo:', ''));

  if Length(Trim(vMotivo)) < 3 then
    Raise exception.Create('É obrigatório justificar o cancelamento!');

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
    Open;
    If IsEmpty then
    Begin
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));
      Entidade.RegistrarDel(CdCNC, 1860(*PedidoDeVenda*), CdPDV, 'Vazio - Cancelar');
      SB_NovoPedClick(Sender);
      Exit;
    end;
  end;

  // Verifica se o usuário que está logado não tem permissão para cancelar o pedido  
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3500)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=31;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(3500)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para cancelar o pedido!');
        end;
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
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
        try
          First;
          While not EOF do
          Begin
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(CdCNC));
            Next;
          end;
        finally
          AfterScroll:=aux;
        end;
        First;
      End;

      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_SITUACAO=6 '+ //Cancelado
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',PDV_SERVICO=1 '+
        ',PDV_OBS=PDV_OBS+"|Canc USU:'+IntToStr(DM.Configuracao1.CodigoUSU)+
        '-Motivo: '+UpperCase(vMotivo)+'|" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

      //Gerar Log
      if not Entidade.GeraLog(3500,CdCNC,CdPDV,vMotivo) then
      Begin
        ShowMessage('Falha ao inserir Log!');
        Raise exception.Create('');
      end;
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
  SB_NovoPedClick(Sender);
end;

procedure TfMxServico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else if SB_CancPro.Enabled then
    Begin
      SB_CancPro.SetFocus;
      SB_CancProClick(sender);
    end
    else
      Close;
  end
  else if Key=chr(13) then
  Begin
    if edtOD_ESF.Focused or
       edtOE_ESF.Focused or
       edtOD_CIL.Focused or
       edtOE_CIL.Focused or
       edtOD_EIXO.Focused or
       edtOE_EIXO.Focused or
       edtOD_DNP.Focused or
       edtOE_DNP.Focused or
       edtOD_ALT.Focused or
       edtOE_ALT.Focused or
       edtOD_ADICAO.Focused or
       edtOE_ADICAO.Focused then
      Perform(WM_NEXTDLGCTL, 0, 0)
    else if edtCodigoPRD.Focused then
      edtQuantidade.SetFocus
    else if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end
    else if SB_SalvaPro.Enabled then
    Begin
      SB_SalvaPro.SetFocus;
      if VerificaInteiroBranco(edtCodigoPRD.Text) then
        SB_SalvaProClick(sender);
    end;
  end
  else if (Key = #32) and
          ((edtOD_ADICAO.Focused) or (edtOE_ADICAO.Focused)) then
  Begin
    Key := #0;
    Application.CreateForm(TfMxCaluloAdicao, fMxCaluloAdicao);
    with fMxCaluloAdicao do
    Begin
      if edtOD_ADICAO.Focused then
      Begin
        Tag := 0;
        edtESF_Sup.Text := edtOD_ESF.Text;
        edtCIL.Text     := edtOD_CIL.Text;
      end
      else
      Begin
        Tag := 1;      
        edtESF_Sup.Text := edtOE_ESF.Text;
        edtCIL.Text     := edtOE_CIL.Text;
      end;
      ShowModal;
    end;
  end
  else if (Key = '.') then
    Key := ','
  else if (Key = '"') then
    Key := #0;
end;

procedure TfMxServico.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirPed.Enabled        := not Habilitar;
  AlterarPed.Enabled        := not Habilitar;
  SalvarPed.Enabled         := ((Cabecalho=1) and Habilitar);
  CancelarPed.Enabled       := ((Cabecalho=1) and Habilitar);
  Localizar1.Enabled        := not Habilitar;
  GerarServioAut1.Enabled   := not Habilitar;
  SB_NovoPed.Enabled        := not Habilitar;
  SB_LocPed.Enabled         := not Habilitar;  
  SB_AltPed.Enabled         := not Habilitar;
  SB_SalvaPed.Enabled       := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled        := ((Cabecalho=1) and Habilitar);
  if DM.Configuracao1.Empresa = empLuciano then
    edtDataEntrada.Enabled := SB_SalvaPed.Enabled;

  IncluirPro.Enabled        := not Habilitar;
  AlterarPro.Enabled        := not Habilitar;
  ExcluirPro.Enabled        := not Habilitar;
  SalvarPro.Enabled         := ((Cabecalho=2) and Habilitar);
  CancelarPro.Enabled       := ((Cabecalho=2) and Habilitar);
  SB_NovoPro.Enabled        := not Habilitar;
  SB_AltPro.Enabled         := not Habilitar;
  SB_ExcPro.Enabled         := not Habilitar;
  SB_SalvaPro.Enabled       := ((Cabecalho=2) and Habilitar);
  SB_CancPro.Enabled        := ((Cabecalho=2) and Habilitar);
  edtPrecoDesconto.Enabled  := ((Cabecalho=2) and Habilitar);

  SB_Entregar.Enabled       := not Habilitar;
  SB_Etiqueta.Enabled       := not Habilitar;
  SB_Imprimir.Enabled       := not Habilitar;
  SB_Cancelar.Enabled       := not Habilitar;
  SB_Cupom.Enabled          := not Habilitar;
  SB_Fechar.Enabled         := not Habilitar;
  FretePed.Enabled          := not Habilitar;

  if not Habilitar then
  Begin
    If Forma_de_Pagamento1.Prazo<>'0' then
      EntradaPed.Enabled := ((Copy(Forma_de_Pagamento1.Prazo,1,1)='0')and(not AgenteFin1.JurosEntrada))
    Else
      EntradaPed.Enabled := False;
  end
  else
    EntradaPed.Enabled := False;

  if DM.Configuracao1.Empresa <> empMotical then
    dblResponsavel.Enabled    := ((Cabecalho=1) and Habilitar);

  Detalhe_Venda1.AtualizaCampos((Cabecalho=1) and Habilitar);

  dbgProduto.Enabled        := not Habilitar;
end;

procedure TfMxServico.SB_NovoProClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o serviço!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido já foi Entregue!');    
  if Entidade.Situacao >= 2 then
    Raise exception.Create('Pedido em andamento!');
  if dblResponsavel.Text = '' then
    Raise exception.Create('Vendedor inválido!');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');    
  QtdAnt := 0;
  edtProduto.Clear;
  Item_Pedido_Venda1.PreparaInsercao;
  AtualizaControles(2,True);
  try
    edtCodigoPRD.SetFocus;
  except
  end;
end;

procedure TfMxServico.SB_AltProClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Selecione o Produto!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido já foi Entregue!');    
  If Entidade.Situacao >= 2  then
    Raise Exception.Create('Pedido em andamento!');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');    
  QtdAnt := Item_Pedido_Venda1.Quantidade;
  Item_Pedido_Venda1.PreparaAlteracao;
  AtualizaControles(2,True);
  try
    edtQuantidade.SetFocus;
  except
  end;
end;

procedure TfMxServico.SB_ExcProClick(Sender: TObject);
var
  CdCNC, CdPDV, CdIPV, CdPRD, CdLOT: integer;
  Trans: Boolean;
  vQtd: Double;
  vMotivo: string;
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Selecione o Produto!');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido já foi Entregue!');

  If Item_Pedido_Venda1.Situacao = 2  then
    Raise Exception.Create('Serviço em andamento!');

  if Item_Pedido_Venda1.RecordCount <= 1 then
    Raise Exception.Create('Não é possível excluir o último item!');

  CdCNC := Item_Pedido_Venda1.CodigoCNC;
  CdPDV := Item_Pedido_Venda1.CodigoPDV;
  CdIPV := Item_Pedido_Venda1.CodigoIPV;
  CdPRD := Item_Pedido_Venda1.CodigoPRD;
  vQTD  := Item_Pedido_Venda1.Quantidade;
  CdLOT := Item_Pedido_Venda1.CodigoLOT;

  if not Item_Pedido_Venda1.Servico then
  Begin
    if MessageDlg('Ouve uma perca do Produto?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT TOP 1 MEF_ENT_CODIGO '+
          ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
          ' WHERE MEF_ENT_CODIGO='+IntToStr(CdPDV)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND MEF_TIPO_MOV=1050 '; //Danificado/Perca
        Open;
        if not IsEmpty then
        Begin
          if MessageDlg('Já foi definida Perca para esse produto nesse pedido!'+#13+
                        'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Begin
            ShowMessage('Perca cancelada!');
            Exit;
          end;
        end;
      end;
      vMotivo := UpperCase(InputBox('Perca de Produto', 'Motivo:', ''));

      if Length(Trim(vMotivo)) < 3 then
        Raise exception.Create('É obrigatório justificar a exclusão!');

      if vQtd > 1 then
      Begin
        try
          vQtd := Arredonda(StrToFloat(InputBox('Perca de Produto', 'Quantidade:', format('%.2f',[vQtd]))));
        except
          ShowMessage('Quantidade inválida!');
          Exit;
        end;
      end;

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
              CdPRD,0(*CdFUN*),1050,CdCNC,CdPDV,'S', vQtd,
              Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
              Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
              vMotivo) Then
          Begin
            ShowMessage('Falha ao Gerar Mov. Comercial!');
            Raise Exception.Create('');
          end;

          //Gerar Fisico
          If not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,0(*CdFUN*),
              CdCNC,CdPDV,1050(*Danificada/Perca*),'S',
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

          Entidade.GeraLog(6610, CdCNC, CdPDV, 'IPV:'+IntToStr(CdIPV)+' PRD:'+IntToStr(CdPRD)+
              ' Motivo:'+vMotivo+
              ' Qtd:'+format('%.2f',[vQtd])+
              ' Preco:'+format('%.2f',[Item_Pedido_Venda1.Preco])+
              ' PrecoDesc:'+format('%.2f',[Item_Pedido_Venda1.PrecoDesc])+
              ' Sug:'+format('%.2f',[Item_Pedido_Venda1.PrecoSugerido]));

          If DM.Configuracao1.ControleTransacao then
            Commit;
            ShowMessage('Movimentação de Perca concluída!');
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
          Movimento_Fisico1.ParamByName('MEF_TIPO_MOV').asInteger   := 1050; //Perca
          Movimento_Fisico1.ParamByName('MEF_ENT_CODIGO').asInteger := CdPDV;
          Movimento_Fisico1.Open;
          report.Preview;
          Close;
        end;
      End;
      Exit;
    end;
  end;

  vMotivo := 'PRD:'+IntToStr(CdPRD)+' ';
  if Entidade.Situacao in [2,3] then //Laboratório/Qualidade/Pronto
  Begin
    vMotivo := vMotivo + UpperCase(InputBox('Excluir Item de Pedido', 'Motivo:', ''));

    if Length(Trim(vMotivo)) < 3 then
      Raise exception.Create('É obrigatório justificar a exclusão!');
  end;

  //Se foi Perca não vai executar esse código abaixo
  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      Item_Pedido_Venda1.Deletar(CdCNC, CdIPV, vMotivo);

      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
        ' IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(vQtd)+
        ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      Entidade.GeraLog(3640, CdCNC, CdPDV, 'IPV:'+IntToStr(CdIPV)+' PRD:'+IntToStr(CdPRD)+
          ' Motivo:'+vMotivo+
          ' Qtd:'+format('%.2f',[vQtd])+
          ' Preco:'+format('%.2f',[Item_Pedido_Venda1.Preco])+
          ' PrecoDesc:'+format('%.2f',[Item_Pedido_Venda1.PrecoDesc])+
          ' Sug:'+format('%.2f',[Item_Pedido_Venda1.PrecoSugerido]));

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
  if Item_Pedido_Venda1.IsEmpty then
    LimpaItens(0);
end;

procedure TfMxServico.SB_SalvaProClick(Sender: TObject);
Var
  trans:boolean;
  QuantidadeVendida, vTotal, vDesconto, vLimSimples, vLimEspecial, vLimSimplesPrazo, vLimEspecialPrazo:Double;
  CdCNC, CdPRD, CdPDV, CdLOT, iEstado, iPrevisaoHoras: integer;
  sEspecial: string;
  vDataPrevisao: TDateTime;
begin
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Exit
  else if edtCodigoPRD.Text = '-1' then
    Exit;

  if not VerificaFloat(edtQuantidade.Text) then
    Raise exception.Create('Quantidade inválida!');
  edtQuantidadeChange(Sender);
  if not VerificaFloatBranco(edtQuantidade.Text) then
    edtQuantidade.Text:='1';
  if StrToFloat(edtQuantidade.Text) <= 0 then
    raise Exception.Create('Quantidade digitada incorretamente!');
  if not VerificaInteiroBranco(edtCodigoLOT.Text) then
    edtCodigoLOT.Text := '0';

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;
  iEstado := Item_Pedido_Venda1.Estado;

  with DM.QR_Consultas do
  Begin
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

  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> StrToInt(edtCodigoPRD.Text)) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
      Open;
    end;
  end;

  try
    vDesconto := Arredonda(100-(StrToFloat(edtPrecoDesconto.Text)/StrToFloat(edtPrecoSugestao.Text)*100));
  except
    vDesconto := 0;
  end;

  vLimSimples := Arredonda(DM.Configuracao1.JurosNorm);
  vLimEspecial := Arredonda(DM.Configuracao1.JurosEsp);
  vLimSimplesPrazo  := Arredonda(DM.Configuracao1.LBMDesconto60);
  vLimEspecialPrazo := Arredonda(DM.Configuracao1.LBMJuros60);

  if (DM.Configuracao1.Empresa = empLuciano) and
     (StrToInt(edtCodigoLOT.Text) > 0) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT LOT_PRECO_COMPRA '+
        ' FROM LOTE '+
        ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND LOT_CODIGO='+edtCodigoLOT.Text;
      Open;
      if not isEmpty then
      Begin
        edtPrecoSugestao.Text := Format('%.2f',[FieldByName('LOT_PRECO_COMPRA').asFloat]);
        edtPrecoDesconto.Text := Format('%.2f',[FieldByName('LOT_PRECO_COMPRA').asFloat]);
      end;
    end;
  end
  else
  Begin
    if StrToFloat(edtPrecoDesconto.Text) < Arredonda(Produto1.Precomedio) then
    Begin
      ShowMessage('Produto: '+Trim(Produto1.Descricao)+' '+Produto1.Referencia+#13+
        'com preço abaixo do Mínimo!');
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and  //Abaixo do Mínimo
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Desc. Total
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=31;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and  //Abaixo do Mínimo
               (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Desc. Total
            begin
              free;
              raise Exception.Create('O usuário não tem permissão vender abaixo do Preço Mínimo!');
            end
            else
              DM.Usuario1.GeraLog(3740, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-PRECO MINIMO');
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
        DM.Usuario1.GeraLog(3740, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
          'PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-PRECO MINIMO');
    end
    else if vDesconto > 0 then
    Begin
      If (DM.Configuracao1.Empresa = empMotical) then
      Begin
        ShowMessage('Produto '+Trim(Produto1.Descricao)+' '+Produto1.Referencia+#13+
          ' com preço inferior ao sugerido!');
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Desc.Total
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=31;
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
                DM.Usuario1.GeraLog(3540, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-MENOR QUE O SUGERIDO');
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
          DM.Usuario1.GeraLog(3540, self.Entidade.CodigoCNC, self.Entidade.CodigoPDV,
            'PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-MENOR QUE O SUGERIDO');
      End
      else //Preço abaixo do Sugerido Diferente de Motical
      Begin
        // Verifica se o usuário tem permissão para liberar desconto à prazo
        If (vDesconto > vLimEspecial) and
           (Forma_de_Pagamento1.Prazo='0') Then //A Vista
        Begin
          if MessageDlg('Produto: '+Produto1.Descricao+#13+
                        'Desconto atribuído (Total)!'+#13+
                        'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Desc.Total
             (not vCentraliza) then
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              onClose:=nil;
              Tag:=31;
              Cancelar:=False;
              Showmodal;
              If not cancelar Then
              Begin
                if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then //Desc.Total
                begin
                  free;
                  raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
                end
                else
                  DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
                    'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                    ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO ACIMA DO ESPECIAL');
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
              ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO ACIMA DO ESPECIAL');
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
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Desc.Total
             (not vCentraliza) then
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              onClose:=nil;
              Tag:=31;
              Cancelar:=False;
              Showmodal;
              If not cancelar Then
              Begin
                if (usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
                   (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then //Desc.Total
                begin
                  free;
                  raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
                end
                else
                  DM.Usuario1.GeraLog(1810, CdCNC, CdPDV,
                    'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                    ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO ESPECIAL');
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
              ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO ESPECIAL');
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
              Tag:=31;
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
                    ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO NORMAL');
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
              ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO NORMAL');
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
                Tag:=31;
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
                      ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO A PRAZO ACIMA DO ESPECIAL');
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
                ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO A PRAZO ACIMA DO ESPECIAL');
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
                Tag:=31;
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
                      ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO A PRAZO ESPECIAL');
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
                ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO A PRAZO ESPECIAL');
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
                Tag:=31;
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
                      ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO A PRAZO NORMAL');
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
                ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO A PRAZO NORMAL');
          end;
        end;
      end;
    end;
  end;

  QuantidadeVendida:=StrToFloat(edtQuantidade.Text) - QtdAnt;

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdPRD := StrToInt(edtCodigoPRD.Text);
  CdLOT := StrToInt(edtCodigoLOT.Text);
  CdPDV := Entidade.CodigoPDV;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    ParamByName('PRD_CODIGO').AsInteger := CdPRD;
    open;
    If isempty then
    begin
      if not Inserir(CdCNC,CdPRD,0(*CdFUN*),0,0,0,0,0,
          DM.Configuracao1.DataHora,0,0,0,0,0,0) then
        Raise exception.Create('Não foi possível criar Item de Estoque!');
      Close;
      ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      ParamByName('PRD_CODIGO').AsInteger := CdPRD;
      open;
    end;
    if (not Produto1.Servico) and (Saldo < QuantidadeVendida) then
      ShowMessage('Quantidade acima do estoque!')
  end;

  if CdLOT > 0 then
  Begin
    DM.Item_de_Estoque_Detalhe1.Close;
    DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
    DM.Item_de_Estoque_Detalhe1.open;
    If DM.Item_de_Estoque_Detalhe1.isempty then
    begin
      DM.Item_de_Estoque_Detalhe1.Inserir(CdCNC,CdLOT,CdPRD);
      DM.Item_de_Estoque_Detalhe1.Close;
      DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
      DM.Item_de_Estoque_Detalhe1.open;
    end;
  end
  else if DM.Configuracao1.Empresa = empLuciano then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE_DETALHE '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND IED_QTD_FISICO>0 ';
      Open;
      if not isEmpty then
        if MessageDlg('Existe lote para esse produto.'+
                      'Deseja continuar sem definir o Lote?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
    end;
  end;

  try
    edtDesconto.Text := format('%.2f',[(1-(StrToFloat(edtPrecoDesconto.Text)/StrToFloat(edtPrecoSugestao.Text)))*100]);
  except
    edtDesconto.Text := '0';
  end;

  if not Item_Pedido_Venda1.Active then
    Item_Pedido_Venda1.Open;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if not Item_Pedido_Venda1.FinalizaEdicao(0, QuantidadeVendida, 0, Produto1.servico) then
        Raise exception.Create('');

      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
        ' IES_SRESERVADO=IES_SRESERVADO+'+VirgPonto(QuantidadeVendida)+
        ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_SERVICO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

      AtualizaControles(2,False);

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

      vTotal := 0;
      //Recalcular Total do Pedido
      if (not Item_Pedido_Venda1.IsEmpty) then
      Begin
        Item_Pedido_Venda2.Close;
        Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
        Item_Pedido_Venda2.ParamByName('PDV_CODIGO').asInteger:=Entidade.CodigoPDV;
        Item_Pedido_Venda2.Open;
        Item_Pedido_Venda2.First;
        iPrevisaoHoras := 0;
        while not Item_Pedido_Venda2.EOF do
        Begin
          vTotal := vTotal + Item_Pedido_Venda2.Quantidade*Arredonda(Item_Pedido_Venda2.PrecoDesc);
          if Item_Pedido_Venda2.Servico then
          Begin
            DM.qr_consultas2.Close;
            DM.qr_consultas2.SQL.Text := 'SELECT PRD_PREVISAO '+
              ' FROM PRODUTO '+
              ' WHERE PRD_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoPRD);
            DM.qr_consultas2.Open;
            iPrevisaoHoras := iPrevisaoHoras + DM.qr_consultas2.FieldByName('PRD_PREVISAO').asInteger;
          end;
          Item_Pedido_Venda2.Next;
        end;
        vTotal := vTotal + Arredonda(Entidade.Frete);

        vDataPrevisao := Entidade.DataPrevisao;
        if vDataPrevisao < Trunc(IncHour(Entidade.DataHora, iPrevisaoHoras)) then
        Begin
          vDataPrevisao := Trunc(IncHour(Entidade.DataHora, iPrevisaoHoras));
          mskDataPrevisao.Text := DateToStr(vDataPrevisao);
          ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
            ' PDV_TOTAL='+VirgPonto(vTotal)+
            ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ',PDV_SERVICO=1 '+
            ',PDV_DT_PREVISAO="'+MesDia(vDataPrevisao)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
//          ShowMessage('Data de Previsão atualizada!');
        end
        else
          ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
            ' PDV_TOTAL='+VirgPonto(vTotal)+
            ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ',PDV_SERVICO=1 '+
            ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));

      end;

      if iEstado = 1 then
        SB_NovoProClick(sender);
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

procedure TfMxServico.SB_CancProClick(Sender: TObject);
begin
  QtdAnt := 0;
  Item_Pedido_Venda1.CancelaEdicao;
  AtualizaControles(2,False);
  if Item_Pedido_Venda1.IsEmpty then
    LimpaItens(0)
  else
    CarregarItemVenda;
end;

procedure TfMxServico.SB_ImprimirClick(Sender: TObject);
var
  CdSGP: integer;
  vPreco: Double;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Selecione o Serviço!');

  if DM.Configuracao1.Empresa = empMotical then
  Begin
    with DM.QR_Consultas do       //(4828)
    Begin
      Close;
      SQL.Text := 'SELECT DISTINCT P1.SGP_CODIGO, I1.IPV_PRECO_DESC '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1 '+
        ' WHERE I1.CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
        ' AND I1.PDV_CODIGO='+IntToStr(self.Entidade.CodigoPDV)+
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

  Application.CreateForm(Trpt_PedidoServicoCompleto, rpt_PedidoServicoCompleto);
  with rpt_PedidoServicoCompleto do
  begin
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.COdigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(self.Entidade.COdigoPDV)+
      ' ORDER BY CNC_CODIGO, PDV_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise exception.Create('Consulta Vazia!');
    report.preview;
  end;
end;

procedure TfMxServico.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      edtCodigoCLI.Text := '0';
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=21;
    With fCadCli.Cliente1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM CLIENTE '+
        ' WHERE CLI_CODIGO='+edtCodigoCLI.Text+
        ' AND CNC_CODIGO='+edtClienteCNC.Text;
      Open;
    End;
    fCadCli.dblCentroDeCusto.KeyValue:=StrToInt(edtClienteCNC.Text);
    fCadCli.Showmodal;
  End
end;

procedure TfMxServico.edtCodigoCLIExit(Sender: TObject);
begin
  if SB_CancPed.Focused then
    Exit;
  If (edtCodigoCLI.Text<>'') Then
  Begin
    if not VerificaInteiro(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      Raise Exception.Create('Código de Cliente inválido!');
    end;
    with Cliente1 do
    Begin
      Close;
      ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
      ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtClienteCNC.Text);
      Open;

      if VerificaInteiroBranco(Cliente1.Conjuge) and (SB_SalvaPed.Enabled) then
        if StrToInt(Cliente1.Conjuge) > 0 then
          dblResponsavel.KeyValue := StrToInt(Cliente1.Conjuge);

      with Informacoes1 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Cliente1.CodigoCNC;
        ParamByName('CLI_CODIGO').asInteger := Cliente1.CodigoCLI;
        Open;
      end;

{      if (SB_SalvaPed.Enabled) and (Informacoes1.CodigoFPG > 0) then
      Begin
        //Verifica se o Cliente é Boleto Bancário
        if Informacoes1.Boleto and (dblTipoPagamento.KeyValue <> 412) then //Boleto Bancário
        Begin
          if dblFormaPagamento.KeyValue = 1 then //A Vista
          Begin
            if MessageDlg('Cliente definido para Boleto bancário!'+#13+
                          'Deseja alterar?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            Begin
              dblTipoPagamento.KeyValue := 412; //Boleto
              dblFormaPagamentoClick(sender);
            end;
          end
          else
          Begin
            dblTipoPagamento.KeyValue := 412; //Boleto
            dblFormaPagamentoClick(sender);
          end;
        end;

        //Verifica Forma de Pagamento de Cliente
        if dblFormaPagamento.KeyValue <> Informacoes1.CodigoFPG then
        Begin
          if dblFormaPagamento.KeyValue = 1 then //A Vista
          Begin
            if MessageDlg('Cliente com Forma de Pagamento Definida!'+#13+
                          'Deseja alterar?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            Begin
              dblFormaPagamento.KeyValue := Informacoes1.CodigoFPG;
              dblFormaPagamentoClick(sender);
            end;
          end
          else
          Begin
            dblFormaPagamento.KeyValue := Informacoes1.CodigoFPG;
            dblFormaPagamentoClick(sender);
          end;
        end;
      end;
}
      If IsEmpty then
      Begin
        edtCodigoCLI.Clear;
        edtRazaoSocial.Clear;
        mskFone.Clear;
        ShowMessage('Cliente não cadastrado');
        edtClienteCNC.Text:=IntToStr(DM.Configuracao1.CodigoCNC);
        try
          edtCodigoCLI.SetFocus;
        except
        end;
        Exit;
      End;
      edtCodigoCLI.text:=IntToStr(CodigoCli);
      edtRazaoSocial.text:=RazaoSocial;
      mskFone.text:=Fone;
      if DM.Configuracao1.Empresa <> empLuciano then
      begin
        if (edtContato.Enabled) then
        Begin
          if PessoaFisica then
          Begin
            edtContato.text:=RazaoSocial;
            mskFoneContato.text:=Fone;
          end
          else
            edtContato.text:=Pai; //Contato 1
        end;
      end;
    end;
  End;
end;

procedure TfMxServico.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Clear;
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=39;
        dblCodigoGRP.KeyValue := CdUltimoGRP;
        dblCodigoGRPClick(sender);
        dblCodigoSGP.KeyValue := CdUltimoSGP;
        dblCodigoSGPClick(sender);
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=39;
        ShowModal;
      end;
    end;
    edtQuantidade.SetFocus;
  End
  else If key=chr(13) then
  Begin
    Key := #0;
    edtQuantidade.SetFocus;
  end
  else
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

procedure TfMxServico.edtCodigoPRDExit(Sender: TObject);
var
  CdIPV: integer;
begin
  if SB_CancPro.Focused or
     (not SB_SalvaPro.Enabled) then
  Begin
    edtCodigoPRD.Enabled := False;
    Exit;
  end;

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
      QtdAnt := Item_Pedido_Venda1.Quantidade;
      Item_Pedido_Venda1.CancelaEdicao;
      Item_Pedido_Venda1.Close;
      Item_Pedido_Venda1.Open;
      Item_Pedido_Venda1.LocalizarCod(CdIPV,Entidade.CodigoCNC);
      Item_Pedido_Venda1.PreparaAlteracao;
      CarregarItemVenda;
    End
    else
    Begin
      CalcularPrecoSugestao;

{      try
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
      end;}

      if edtDesconto.Text <> '0' then
        edtPrecoDesconto.Text:=format('%.2f',[StrToFloat(edtPrecoSugestao.Text)-(StrToFloat(edtPrecoSugestao.Text)*StrToFloat(edtDesconto.Text)/100)])
      else
        edtPrecoDesconto.Text := edtPrecoSugestao.Text;
    end;
  end;

  if edtQuantidade.Enabled and (not SB_SalvaPro.Focused) then
  Begin
    edtQuantidade.SetFocus;
    edtCodigoPRD.Enabled:=False
  end;
end;

procedure TfMxServico.CarregarItemVenda;
Begin
  edtProduto.Clear;
  If not Item_Pedido_Venda1.IsEmpty Then
  Begin
    Item_Pedido_Venda1.CarregaDados;
    edtProduto.Text := Item_Pedido_Venda1.FieldByName('Produto').asString;
    edtPrecoUnitario.Text := format('%.2f',[Item_Pedido_Venda1.Preco]);
  End;
end;

procedure TfMxServico.edtQuantidadeChange(Sender: TObject);
begin
  try
    if not edtDesconto.Focused then
      edtPrecoTotalPRD.Text := format('%.2f',[StrToFloat(edtPrecoDesconto.Text)*StrToFloat(edtQuantidade.Text)]);
  except
  end;
end;

procedure TfMxServico.LimpaItens(ProdutoServico:integer);
Begin
  if ProdutoServico = 0 then
  Begin
    Item_Pedido_Venda1.LimpaCampos;
    edtCodigoPRD.Clear;
    edtProduto.Clear;
    edtPrecoTotalPRD.Clear;
  end;
end;

procedure TfMxServico.edtCaixaKeyPress(Sender: TObject; var Key: Char);
begin
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

procedure TfMxServico.dblFormaPagamentoClick(Sender: TObject);
begin
  if dblCodigoAGF.Enabled and (dblCodigoAGF.Text = '') then
    dblCodigoAGF.KeyValue:=0;

  if Entidade.Entrada > 0 then
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_ENTRADA=0 '+
      ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
      ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));

  if (dblTipoPagamento.KeyValue = 5) then //Dinheiro/Promissória
  Begin
    With AgenteFin1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
        ' WHERE AGF_CODIGO=1 '; //LOJA
      Open;
    end;
    if dblFormaPagamento.Text = '' then
      dblFormaPagamento.KeyValue := 1; //Á Vista
    if dblCodigoAGF.Enabled and (dblCodigoAGF.Text = '') then
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
          ' AND AGF_CODIGO<>1';
        Open;
      End;
      if dblTipoPagamento.Focused then
      Begin
        if dblFormaPagamento.Text = '' then
          dblFormaPagamento.KeyValue := 8; // Forma em 0 + 1
        if dblCodigoAGF.Enabled and (dblCodigoAGF.Text = '') then
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
            ' WHERE AGF_CODIGO=1'; //LOJA
          Open;
          if dblCodigoAGF.Enabled and (dblCodigoAGF.Text = '') then
            dblCodigoAGF.KeyValue:=1;
        End
      else if dblFormaPagamento.KeyValue > 1 then
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
            ' WHERE AGF_CODIGO=6'; //Cheque-PRE
          Open;
          if dblCodigoAGF.Enabled and (dblCodigoAGF.Text = '') then
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
          ' AND AGF_CODIGO<>6';   //Diferente de Cheque-Pre
        Open;
      End;
      if dblCodigoAGF.Enabled and (dblCodigoAGF.Text = '') and
         ((dblTipoPagamento.KeyValue = 412) or (dblTipoPagamento.KeyValue = 416)) then
        dblCodigoAGF.KeyValue := 2; //BB
  End;
end;

procedure TfMxServico.AgenteFin1BeforeOpen(DataSet: TDataSet);
begin
  AgenteFin1.OnFilterRecord:=AgenteFin1FilterRecord;
  AgenteFin1.Filtered:=True;
end;

procedure TfMxServico.AgenteFin1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  nparc:Integer;
begin
  if (Forma_de_Pagamento1.Prazo <> '') then
  Begin
    nparc:=Titulo_receber2.QtdeTitulos(Forma_de_Pagamento1.Prazo);
    If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
      Accept:=FatorFinanceira2.LocalizarNParc(AgenteFin1.CodigoAGF, nparc-1)
    else
      Accept:=FatorFinanceira2.LocalizarNParc(AgenteFin1.CodigoAGF, nparc);
  end;
end;

procedure TfMxServico.Item_Pedido_Venda1AfterScroll(DataSet: TDataSet);
begin
  CarregarItemVenda;
end;

procedure TfMxServico.Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    if Item_Pedido_Venda1.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda1.CodigoPRD;
      Open;
    end;
    Item_Pedido_Venda1.FieldByName('Produto').asString := Trim(Descricao)+' '+Referencia;
    if Servico then
    Begin
      if Item_Pedido_Venda1.DataEntrada > 0 then
        Item_Pedido_Venda1.FieldByName('DtINI').asString := DateTimeToStr(Item_Pedido_Venda1.DataEntrada)
      else
        Item_Pedido_Venda1.FieldByName('DtINI').asString := '';

      if Item_Pedido_Venda1.DataSaida > 0 then
        Item_Pedido_Venda1.FieldByName('DtFIM').asString := DateTimeToStr(Item_Pedido_Venda1.DataSaida)
      else
        Item_Pedido_Venda1.FieldByName('DtFIM').asString := '';
    end
    else
    Begin
      Item_Pedido_Venda1.FieldByName('DtINI').asString := '-';
      Item_Pedido_Venda1.FieldByName('DtFIM').asString := '-';
    end;
  end;

  Item_Pedido_Venda1.FieldByName('Total').asFloat := Arredonda(Item_Pedido_Venda1.Quantidade*Item_Pedido_Venda1.PrecoDesc);
end;

procedure TfMxServico.Pedido_de_Venda1AfterOpen(DataSet: TDataSet);
begin
  if Entidade.IsEmpty then
    Entidade.LimpaCampos
  else
    Entidade.CarregaDados;

  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);

  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.Open;
  with Detalhe_Venda1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Open;
    if IsEmpty then
      LimpaCampos(0)
    else
      CarregaDados;
  end;
end;

procedure TfMxServico.Pedido_de_Venda1BeforeOpen(DataSet: TDataSet);
begin
  Detalhe_Venda1.LimpaCampos(0);
end;

procedure TfMxServico.Item_Pedido_Venda1AfterOpen(DataSet: TDataSet);
begin
  if Item_Pedido_Venda1.IsEmpty then
  Begin
    Item_Pedido_Venda1.LimpaCampos;
    edtProduto.Clear;
    edtPrecoTotalPRD.Clear;
  end;
end;

procedure TfMxServico.SB_EtiquetaClick(Sender: TObject);
var
  sServico: string;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Selecione o Serviço!');

  sServico := '';
  with Item_Pedido_Venda2 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := self.Entidade.CodigoCNC;
    ParamByName('PDV_CODIGO').asInteger := self.Entidade.CodigoPDV;
    Open;
    First;
    while not EOF do
    Begin
      DM.QR_Consultas.Close;
      DM.QR_Consultas.SQL.Text := 'SELECT PRD_DESCRICAO '+
        ' FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+FieldByName('PRD_CODIGO').asString+
        ' AND PRD_SERVICO=1 ';
      DM.QR_Consultas.Open;
      if not DM.QR_Consultas.IsEmpty then
      Begin
        if sServico <> '' then
          sServico := sServico + ' / ';
        sServico := sServico + DM.QR_Consultas.FieldByName('PRD_DESCRICAO').asString;
      end;
      Next;
    end;
  end;

  Application.CreateForm(Trpt_EtiquetaServico, rpt_EtiquetaServico);
  with rpt_EtiquetaServico do
  begin
    zrlNomeCliente.Caption := '('+edtCodigoCLI.Text+')'+edtRazaoSocial.Text;
    zrlDocumento.Caption := edtDocumento.Text;
    zrlCaixa.Caption := PreencheZero(5,edtCaixa.Text);
    zrlCodigoPDV.Caption := edtCodigoPDV.Text;
    zrlDataPrevisao.Caption := mskDataPrevisao.Text;
    zrlServicos.Caption := sServico;
    if Entidade.IsEmpty then
      Raise exception.Create('Consulta Vazia!');
    try
      report.Preview;
    except
      ShowMessage('Falha na Impressão!');
    end;
  end;
end;

procedure TfMxServico.SB_CupomClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if Entidade.Situacao <> 4 then
    Raise exception.Create('Pedido não finalizado!');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');    
  if not SB_Cupom.Enabled then
    Exit;
  SB_Cupom.Enabled := False;
  Application.CreateForm(TfMxSNotaCupom, fMxSNotaCupom);
  with fMxSNotaCupom do
  Begin
    Tag:=4;
    Self.CancelarFatura := False;
//    if Self.Cliente1.PessoaFisica then
//      rdgNota.Enabled := False
//    else if Self.Cliente1.CGFRG <> '' then
//    Begin
      rdgNota.Checked := True;
      rdgCupom.Enabled := False;
//    end;
    CdCNC    := Self.Entidade.CodigoCNC;
    CdPDV    := Self.Entidade.CodigoPDV;
    iCdCNCCli := Self.Entidade.ClienteCNC;
    CdCLI    := Self.Entidade.CodigoCLI;
    CdFPG    := Self.Entidade.CodigoFPG;
    CdTipoPag:= Self.Entidade.TipoPag;
    Entrada  := Self.Entidade.entrada;
    CNPJ_CPF := Cliente1.CPFCGC;
    if (DM.Configuracao1.Empresa = 1) and
       (DM.Usuario1.Permissoes.IndexOf(IntToStr(3650)) > 0) then
      ReducaoEletro := True;
    ShowModal;
    if Self.CancelarFatura then
    Begin
      Self.SB_Cupom.Enabled := True;
      Raise Exception.Create('Faturamento Cancelado!');
    end;
  end;
  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  try
    Item_Pedido_Venda1.Close;
    Item_Pedido_Venda1.Open;
    Item_Pedido_Venda1.First;
  finally
    Item_Pedido_Venda1.AfterScroll:=Aux;
  end;
  CarregarItemVenda;
  SB_NovoPedClick(sender);
end;

procedure TfMxServico.edtOD_ESFExit(Sender: TObject);
begin
  if edtOD_ESF.Enabled then
    try
      edtOD_ESF.Text := format('%.2f',[StrToFloat(edtOD_ESF.Text)]);
    except
    end;
end;

procedure TfMxServico.edtOE_ESFExit(Sender: TObject);
begin
  if edtOE_ESF.Enabled then
    try
      edtOE_ESF.Text := format('%.2f',[StrToFloat(edtOE_ESF.Text)]);
    except
    end;
end;

procedure TfMxServico.edtOD_CILExit(Sender: TObject);
begin
  if edtOD_CIL.Enabled then
    try
      edtOD_CIL.Text := format('%.2f',[StrToFloat(edtOD_CIL.Text)]);
    except
    end;
end;

procedure TfMxServico.edtOE_CILExit(Sender: TObject);
begin
  if edtOE_CIL.Enabled then
    try
      edtOE_CIL.Text := format('%.2f',[StrToFloat(edtOE_CIL.Text)]);
    except
    end;
end;

procedure TfMxServico.Label26Click(Sender: TObject);
var
  vGrau_OD, vGrau_OE, vCil_OD, vCil_OE, vBase_OD_1, vBase_OE_1: double;
  vLenteProntaOD, vLenteProntaOE, vCH_OD, vCH_OE, sDescLentePronta, sODBifocal, sOEBifocal: string;
begin
  if SB_SalvaPed.Enabled then
    Exit;

  try
    if Entidade.CodigoPDV > 0 then
    Begin
      //Olho Direito
      //Bloco (Trabalha com Cilindro Negativo)
      vBase_OD_1 := VerificaBase(StrToFloat(edtOD_ESF.Text));
      //Lente Pronta
      vGrau_OD       := Arredonda(StrToFloat(edtOD_ESF.Text)+StrToFloat(edtOD_CIL.Text));
      vCil_OD        := Arredonda(-1*StrToFloat(edtOD_CIL.text));
      vLenteProntaOD := format('%.2f',[vGrau_OD])+'  '+
                        format('%.2f',[vCil_OD]);


      //Olho Esquerdo
      //Bloco (Trabalha com Cilindro Negativo)
      vBase_OE_1 := VerificaBase(StrToFloat(edtOE_ESF.Text));
      //Lente Pronta
      vGrau_OE       := Arredonda(StrToFloat(edtOE_ESF.Text)+StrToFloat(edtOE_CIL.Text));
      vCil_OE        := Arredonda(-1*StrToFloat(edtOE_CIL.text));
      vLenteProntaOE := format('%.2f',[vGrau_OE])+'  '+
                        format('%.2f',[vCil_OE]);

      if (vGrau_OD = 0) then
      Begin
        if vCil_OD = 0 then
          vCH_OD := '01'
        else if vCil_OD <= 2 then
          vCH_OD := '06'
        else if vCil_OD <= 3 then
          vCH_OD := '07'
        else
          vCH_OD := 'XX';
      end
      else if vCil_OD = 0 then
      Begin
        if ABS(vGrau_OD) <= 2 then
          vCH_OD := '01'
        else if ABS(vGrau_OD) <= 4 then
          vCH_OD := '02'
        else if ABS(vGrau_OD) <= 6 then
          vCH_OD := '03'
        else
          vCH_OD := 'XX'
      end
      else if vGrau_OD < -6 then
        vCH_OD := 'XX'
      else if vGrau_OD <= -4.25 then
      Begin
        if vCil_OD <= 2 then
          vCH_OD := '19'
        else if vCil_OD <= 3 then
          vCH_OD := '20'
        else
          vCH_OD := 'XX';
      end
      else if vGrau_OD <= -2.25 then
      Begin
        if vCil_OD <= 2 then
          vCH_OD := '17'
        else if vCil_OD <= 3 then
          vCH_OD := '18'
        else
          vCH_OD := 'XX';
      end
      else if vGrau_OD < 0 then
      Begin
        if vCil_OD <= 2 then
          vCH_OD := '15'
        else if vCil_OD <= 3 then
          vCH_OD := '16'
        else
          vCH_OD := 'XX';
      end
      else if vGrau_OD <= 2 then
      Begin
        if vCil_OD <= 2 then
          vCH_OD := '08'
        else if vCil_OD <= 3 then
          vCH_OD := '09'
        else
          vCH_OD := 'XX';
      end
      else if vGrau_OD <= 4 then
      Begin
        if vCil_OD <= 2 then
          vCH_OD := '10'
        else if vCil_OD <= 3 then
          vCH_OD := '11'
        else
          vCH_OD := 'XX';
      end
      else if vGrau_OD <= 6 then
      Begin
        if vCil_OD <= 2 then
          vCH_OD := '12'
        else if vCil_OD <= 3 then
          vCH_OD := '13'
        else
          vCH_OD := 'XX';
      end
      else
        vCH_OD := 'XX';

      //Chave do Olho Esquerdo
      if (vGrau_OE = 0) then
      Begin
        if vCil_OE = 0 then
          vCH_OE := '01'
        else if vCil_OE <= 2 then
          vCH_OE := '06'
        else if vCil_OE <= 3 then
          vCH_OE := '07'
        else
          vCH_OE := 'XX';
      end
      else if vCil_OE = 0 then
      Begin
        if ABS(vGrau_OE) <= 2 then
          vCH_OE := '01'
        else if ABS(vGrau_OE) <= 4 then
          vCH_OE := '02'
        else if ABS(vGrau_OE) <= 6 then
          vCH_OE := '03'
        else
          vCH_OE := 'XX'
      end
      else if vGrau_OE < -6 then
        vCH_OE := 'XX'
      else if vGrau_OE <= -4.25 then
      Begin
        if vCil_OE <= 2 then
          vCH_OE := '19'
        else if vCil_OE <= 3 then
          vCH_OE := '20'
        else
          vCH_OE := 'XX';
      end
      else if vGrau_OE <= -2.25 then
      Begin
        if vCil_OE <= 2 then
          vCH_OE := '17'
        else if vCil_OE <= 3 then
          vCH_OE := '18'
        else
          vCH_OE := 'XX';
      end
      else if vGrau_OE < 0 then
      Begin
        if vCil_OE <= 2 then
          vCH_OE := '15'
        else if vCil_OE <= 3 then
          vCH_OE := '16'
        else
          vCH_OE := 'XX';
      end
      else if vGrau_OE <= 2 then
      Begin
        if vCil_OE <= 2 then
          vCH_OE := '08'
        else if vCil_OE <= 3 then
          vCH_OE := '09'
        else
          vCH_OE := 'XX';
      end
      else if vGrau_OE <= 4 then
      Begin
        if vCil_OE <= 2 then
          vCH_OE := '10'
        else if vCil_OE <= 3 then
          vCH_OE := '11'
        else
          vCH_OE := 'XX';
      end
      else if vGrau_OE <= 6 then
      Begin
        if vCil_OE <= 2 then
          vCH_OE := '12'
        else if vCil_OE <= 3 then
          vCH_OE := '13'
        else
          vCH_OE := 'XX';
      end
      else
        vCH_OE := 'XX';

      sDescLentePronta := '';
      if (StrToFloat(edtOD_ADICAO.Text) = 0) or
         (StrToFloat(edtOE_ADICAO.Text) = 0) then
      Begin
        sDescLentePronta := 'LENTE PRONTA '+#13;
        if StrToFloat(edtOD_ADICAO.Text) = 0 then
        Begin
          sODBifocal := ' (Bifocal/Multifocal)';
          sDescLentePronta := sDescLentePronta+
                              'OD: CH'+vCH_OD+' '+vLenteProntaOD+#13;
        end;
        if StrToFloat(edtOE_ADICAO.Text) = 0 then
        Begin
          sOEBifocal := ' (Bifocal/Multifocal)';
          sDescLentePronta := sDescLentePronta+
                              'OE: CH'+vCH_OE+' '+vLenteProntaOE;
        end;
      end;

      ShowMessage('BLOCO '+#13+
                  'Base Sugerida OD: '+format('%.2f',[vBase_OD_1])+sODBifocal+#13+
                  'Base Sugerida OE: '+format('%.2f',[vBase_OE_1])+sOEBifocal+#13+#13+
                  sDescLentePronta);

    end;
  except
  end;
end;

procedure TfMxServico.ObservaoItem1Click(Sender: TObject);
var
  CdCNC, CdIPV: integer;
  sObsItem: string;
begin
  if Item_Pedido_Venda1.IsEmpty or
     (Entidade.Situacao >= 4) then
    Exit
  else
  Begin
    CdCNC := Item_Pedido_Venda1.CodigoCNC;
    CdIPV := Item_Pedido_Venda1.CodigoIPV;

    sObsItem := UpperCase(InputBox('Dados do Item', 'Observação:', ''));

    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
      ' IPV_OBSERVACAO="'+sObsItem+'" '+
      ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND IPV_CODIGO='+IntToStr(CdIPV));
    Entidade.GeraLog(6580, CdCNC, Item_Pedido_Venda1.CodigoPDV,
      'IPV:'+IntToStr(CdIPV)+
      ' PRD:'+IntToStr(Item_Pedido_Venda1.CodigoPRD)+
      ' OBS:'+sObsItem);

    Item_Pedido_Venda1.Close;
    Item_Pedido_Venda1.Open;
    Item_Pedido_Venda1.LocalizarCod(CdIPV, CdCNC);
  end;
end;

function TfMxServico.ReCalcularPrecos:Boolean;
var
  PrecoTabelaPrincipal, vValor, vPrecoVenda, vTotal, vDesconto, vLimSimples, vLimEspecial, vLimSimplesPrazo, vLimEspecialPrazo: Double;
  vPrecosAlterados, vAlterarPrecos, Lib3540, vNaoManterPreco: Boolean;
  CdTBP: integer;
begin
  Result := False;
  vTotal := 0;
  Lib3540 := False;
  vNaoManterPreco := False;

  vLimSimples := Arredonda(DM.Configuracao1.JurosNorm);
  vLimEspecial := Arredonda(DM.Configuracao1.JurosEsp);
  vLimSimplesPrazo  := Arredonda(DM.Configuracao1.LBMDesconto60);
  vLimEspecialPrazo := Arredonda(DM.Configuracao1.LBMJuros60);

  vPrecosAlterados := False;

  if (not Item_Pedido_Venda1.IsEmpty) then
  Begin
    Item_Pedido_Venda2.Close;
    Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
    Item_Pedido_Venda2.ParamByName('PDV_CODIGO').asInteger:=Entidade.CodigoPDV;
    Item_Pedido_Venda2.Open;
    Item_Pedido_Venda2.First;
    vTotal := 0;
    while not Item_Pedido_Venda2.EOF do
    Begin
      CdTBP := Item_Pedido_Venda2.CodigoTBP;
      with Produto1 do
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda2.CodigoPRD;
        Open;
        if IsEmpty then
          Raise exception.Create('Produto não encontrado! '+IntToStr(Item_Pedido_Venda2.CodigoPRD));

        vDesconto := 0;
        vPrecoVenda := Arredonda(PrecoVenda); //Preço Sugestão
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
            vPrecoVenda := Arredonda(Taxa*PrecoVenda);
          end;
        end;
      end;

      if DM.Configuracao1.Empresa = empMotical then
      Begin
        CdTBP := 0;
        vAlterarPrecos := True; //Sempre altera os preços, mesmo que tenha autorização ao desconto
        if Produto1.Servico then
        Begin
          with DM.QR_Consultas do
          Begin
            //Procurar Tabela Promocional de Laboratório Para Serviço
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
              ' AND T1.TPS_LABORATORIO=1 '+
              ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
              ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' OR T1.CNC_CODIGO=1) '+
              ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
              ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
            Open;
            if IsEmpty then
              vValor := Produto1.Precovenda
            else
            Begin
              CdTBP := FieldByname('TPS_CODIGO').asInteger;
              if (dblFormaPagamento.KeyValue = 1) or
                 (Cliente1.VendaAtacado) then
                vValor := Arredonda(FieldByname('ITS_PRECO_VENDA').asFloat-
                                    FieldByname('ITS_PRECO_VENDA').asFloat*
                                    FieldByname('TPS_DESCONTO_SIMPLES').asFloat/100)
              else
                vValor := Arredonda(FieldByname('ITS_PRECO_VENDA').asFloat-
                                    FieldByname('ITS_PRECO_VENDA').asFloat*
                                    FieldByname('TPS_DESCONTO_ESPECIAL').asFloat/100);
            end;
          end;
        end
        else //Não é Serviço
        Begin
          with DM.QR_Consultas do
          Begin
            //Preço da Tabela de Laboratório Principal
            Close;
            SQL.Text := 'SELECT * '+
              ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
              ' WHERE I1.GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
              ' AND I1.SGP_CODIGO='+IntToStr(Produto1.CodigoSGP)+
              ' AND (I1.PRD_CODIGO=0 OR I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+') '+
              ' AND T1.CLI_CODIGO=0 '+ //Tabela Principal tem que ser CLI_CODIGO = 0
              ' AND I1.ITS_SITUACAO=0 '+
              ' AND T1.TPS_SITUACAO=0 '+
              ' AND T1.TPS_LABORATORIO=1 '+  //Laboratório Principal
              ' AND T1.TPS_PRINCIPAL=1 '+  //Tabela Principal
              ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
              ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' OR T1.CNC_CODIGO=1) '+
              ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND T1.TPS_CODIGO=I1.TPS_CODIGO ';
              //Não Ordena por ser única a Tabela Principal
            Open;
            if IsEmpty then
            Begin
              Showmessage('Produto fora da Tabela Principal de Laboratório!');
              Exit;
            end;
            PrecoTabelaPrincipal := FieldByname('ITS_PRECO_VENDA').asFloat;
            CdTBP := FieldByname('TPS_CODIGO').asInteger;

            //Procurar Tabela Promocional de Laboratório
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
              ' AND T1.TPS_LABORATORIO=1 '+ //Laboratório
              ' AND T1.TPS_PRINCIPAL=0 '+  //Não Tabela Principal
              ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
              ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' OR T1.CNC_CODIGO=1) '+
              ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
              ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
            Open;
            if IsEmpty then
            Begin
              if (dblFormaPagamento.KeyValue = 1) or
                 (Cliente1.VendaAtacado) then
              Begin
                if Cliente1.Desconto > 0 then
                  vValor := Arredonda(PrecoTabelaPrincipal-PrecoTabelaPrincipal*Cliente1.Desconto/100)
                else if Produto1.FieldByName('GRP_ESPECIAL').asInteger = 1 then //Lente de Contato
                  vValor := Arredonda(PrecoTabelaPrincipal-PrecoTabelaPrincipal*DM.Configuracao1.LBMDesconto60/100) //Desc Simples Lente de Contato
                else
                  vValor := Arredonda(PrecoTabelaPrincipal-PrecoTabelaPrincipal*DM.Configuracao1.JurosNorm/100);
              end
              else
              Begin
                if Produto1.FieldByName('GRP_ESPECIAL').asInteger = 1 then //Lente de Contato
                  vValor := Arredonda(PrecoTabelaPrincipal-PrecoTabelaPrincipal*DM.Configuracao1.LBMJuros60/100) //Desc Esp Lente de Contato
                else
                  vValor := Arredonda(PrecoTabelaPrincipal-PrecoTabelaPrincipal*DM.Configuracao1.JurosEsp/100);
              end;
            end
            else
            Begin
              CdTBP := FieldByname('TPS_CODIGO').asInteger;
              if (dblFormaPagamento.KeyValue = 1) or
                 (Cliente1.VendaAtacado) then
                vValor := Arredonda(FieldByname('ITS_PRECO_VENDA').asFloat-
                                    FieldByname('ITS_PRECO_VENDA').asFloat*
                                    FieldByname('TPS_DESCONTO_SIMPLES').asFloat/100)
              else
                vValor := Arredonda(FieldByname('ITS_PRECO_VENDA').asFloat-
                                    FieldByname('ITS_PRECO_VENDA').asFloat*
                                    FieldByname('TPS_DESCONTO_ESPECIAL').asFloat/100);
            end;
            Close; //Fechar QueryConsultas
          end;
        end;
      end
      else //Não é Motical
      Begin
        with DM.QR_Consultas do
        Begin
          //Procurar Tabela Promocional de Laboratório Para Serviço
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
            ' AND T1.TPS_LABORATORIO=1 '+
            ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
            ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' OR T1.CNC_CODIGO=1) '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
            ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
          Open;
          if IsEmpty then
            vValor := Produto1.Precovenda
          else
          Begin
            CdTBP := FieldByname('TPS_CODIGO').asInteger;
            vValor := Arredonda(FieldByname('ITS_PRECO_VENDA').asFloat);
            vLimSimples       := Arredonda(DM.qr_consultas2.FieldByName('TPS_DESCONTO_SIMPLES').asFloat);
            vLimEspecial      := Arredonda(DM.qr_consultas2.FieldByName('TPS_DESCONTO_ESPECIAL').asFloat);
            vLimSimplesPrazo  := Arredonda(DM.qr_consultas2.FieldByName('TPS_DESCONTO_SIMPLES_PRAZO').asFloat);
            vLimEspecialPrazo := Arredonda(DM.qr_consultas2.FieldByName('TPS_DESCONTO_ESPECIAL_PRAZO').asFloat);
          end;
        end;
        //Os preços somente serão alterados caso o usuário não tenha permissão
        //para os descontos na forma de pagamento planejada
        vDesconto := Arredonda(100-(Item_Pedido_Venda2.PrecoDesc/vPrecoVenda*100));
        // Verifica se o usuário tem permissão para liberar desconto à prazo
        If (vDesconto > vLimEspecial) and
           (Forma_de_Pagamento1.Prazo='0') Then //A Vista
        Begin
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
            vAlterarPrecos := True;
        end
        else If (vDesconto >  vLimSimples) and
                (vDesconto <= vLimEspecial)  and
                (Forma_de_Pagamento1.Prazo='0') Then //A Vista
        Begin
          If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
            vAlterarPrecos := True;
        End
        Else If (vDesconto <= vLimSimples) and
                (Forma_de_Pagamento1.Prazo = '0') Then //A Vista
        Begin
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND //Desc. Total
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) AND //Desc. Especial
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) AND //Abaixo do Mínimo
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) then //Desc. Simples
            vAlterarPrecos := True;
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
          else //Desconto Menor ou igual ao Desconto Normal (Venda à prazo)
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
         ((Item_Pedido_Venda2.PrecoSugerido <> vValor) or
          (Item_Pedido_Venda2.Preco <> vPrecoVenda) or
          (Item_Pedido_Venda2.PrecoDesc <> vValor)) then
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
              Tag:=31;
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
                    ' SERVICO-MANTER PRECO ANTIGO');
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
              'SERVICO-MANTER PRECO ANTIGO');
          end;
        end
        else
          vNaoManterPreco := True;
      end;

      if Lib3540 then
        vDesconto := Arredonda(100-(Item_Pedido_Venda2.PrecoDesc/vValor*100));


      if (vAlterarPrecos) and
         ((Item_Pedido_Venda2.PrecoSugerido <> vValor) or
          (Item_Pedido_Venda2.Preco <> vPrecoVenda) or
          (Item_Pedido_Venda2.PrecoDesc <> vValor)) then
      Begin
        vPrecosAlterados :=True;
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_PRECO_SUGERIDO='+VirgPonto(vValor)+
          ',IPV_PRECO='+VirgPonto(vPrecoVenda)+
          ',IPV_DESCONTO=0 '+
          ',IPV_PRECO_DESC='+VirgPonto(vValor)+
          ',TBP_CODIGO='+IntToStr(CdTBP)+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoCNC)+
          ' AND IPV_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoIPV));

        Entidade.GeraLog(6580, Item_Pedido_Venda2.CodigoCNC, Item_Pedido_Venda2.CodigoPDV,
          'IPV:'+IntToStr(Item_Pedido_Venda2.CodigoIPV)+
          ' PRD:'+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' Qtd:'+format('%.2f',[Item_Pedido_Venda2.Quantidade])+
          ' Preco:'+format('%.2f',[vPrecoVenda])+
          ' PrecoDesc:'+format('%.2f',[vValor])+
          ' Sug: '+format('%.2f',[vValor])+
          ' TBP:'+IntToStr(CdTBP));
      end
      else if (Item_Pedido_Venda2.PrecoSugerido <> vValor) or
              (Item_Pedido_Venda2.Preco <> vPrecoVenda) or
              (Item_Pedido_Venda2.Desconto <> vDesconto) then
      Begin
        //Não altera o preço de venda final
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_PRECO_SUGERIDO='+VirgPonto(vValor)+
          ',IPV_PRECO='+VirgPonto(vPrecoVenda)+
          ',IPV_DESCONTO='+VirgPonto(vDesconto)+
          ',TBP_CODIGO='+IntToStr(CdTBP)+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoCNC)+
          ' AND IPV_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoIPV));

        Entidade.GeraLog(6580, Item_Pedido_Venda2.CodigoCNC, Item_Pedido_Venda2.CodigoPDV,
          'IPV:'+IntToStr(Item_Pedido_Venda2.CodigoIPV)+
          ' PRD:'+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' Qtd:'+format('%.2f',[Item_Pedido_Venda2.Quantidade])+
          ' Preco:'+format('%.2f',[vPrecoVenda])+
          ' PrecoDesc:'+format('%.2f',[vValor])+
          ' Sug: '+format('%.2f',[vValor])+
          ' TBP:'+IntToStr(CdTBP));
      end;
      vTotal := vTotal + vValor*Item_Pedido_Venda2.Quantidade;
      Item_Pedido_Venda2.Next;
    end;
    vTotal := vTotal + Arredonda(Entidade.Frete);

    if Entidade.Total <> vTotal then
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_TOTAL='+VirgPonto(vTotal)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));

    Item_Pedido_Venda1.Close;
    Item_Pedido_Venda1.Open;
  end
  else if Entidade.Total <> vTotal then
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_TOTAL='+VirgPonto(vTotal)+
      ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));

  if vPrecosAlterados then
    ShowMessage('Atenção!!! '+#13+
                'Os preços foram atualizados, verifique!');
end;

procedure TfMxServico.memObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfMxServico.edtDescontoChange(Sender: TObject);
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

procedure TfMxServico.SB_LocPedClick(Sender: TObject);
var
  Aux1:TDataSetNotifyEvent;
begin
  if (not Entidade.IsEmpty) then
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
          Detalhe_Venda1.Deletar(Entidade.CodigoCNC,Entidade.CodigoPDV);
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
          Entidade.RegistrarDel(Entidade.CodigoCNC, 1860(*PedidoDeVenda*), Entidade.CodigoPDV, 'Vazio - Localizar');
          edtCodigoPDV.Clear;
          edtCodigoCLI.Clear;
          edtRazaoSocial.Clear;
          mskFone.Clear;
        except
        end;
        Entidade.LimpaCampos;
      end;
    end;
  end;

  CancelarLoc:=True;
  Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
  with fMxSPedLoc do
  Begin
    tag:=10;
    sFiltrarServico := ' AND PDV_SERVICO=1 AND PDV_SITUACAO<>4 '; //Dif. Entregue
    Showmodal;
  end;

  if (edtCodigoPDV.Text = '') then
    cancelarLoc := True;

  If not cancelarLoc Then
  Begin
    if not Entidade.FecharPedido then
      raise Exception.Create('Não foi possível liberar o pedido atual.');
    Aux1:=Item_Pedido_Venda1.AfterScroll;
    Item_Pedido_Venda1.AfterScroll:=nil;
    try
      Item_Pedido_Venda1.Close;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text;
      Entidade.Open;
      Entidade.AbrirPedido(True);
      dblTipoPagamento.KeyValue  := Entidade.TipoPag;
      dblFormaPagamento.KeyValue := Entidade.CodigoFPG;
      dblFormaPagamentoClick(sender);
      Entidade.CarregaDados;
      Item_Pedido_Venda1.Open;
      dblResponsavel.KeyValue := Item_Pedido_Venda1.CodigoFUN;
    finally
      Item_Pedido_Venda1.AfterScroll:=Aux1;
    end;

    //Carregar informações do Cliente
    edtCodigoCLIExit(Sender);

    //Carregar informações do Produto
    CarregarItemVenda;

    If not Item_Pedido_Venda1.IsEmpty then
    Begin
      If Forma_de_Pagamento1.Prazo<>'0' then
        EntradaPed.Enabled := ((Copy(Forma_de_Pagamento1.Prazo,1,1)='0')and(not AgenteFin1.JurosEntrada))
      Else
        EntradaPed.Enabled := False;
    end;

    edtQuantidadeChange(edtPrecoDesconto);
  End;
end;

procedure TfMxServico.EntradaPedClick(Sender: TObject);
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
    AtualizaTotal;
    Application.CreateForm(TfMXValorEntrada, fMXValorEntrada);
    with fMXValorEntrada do
    Begin
      Tag:=7;
      Showmodal;
    end;
    Item_Pedido_Venda1.Close;
    Item_Pedido_Venda1.Open;
    Item_Pedido_Venda1.First;
    CarregarItemVenda;
  end;
end;

procedure TfMxServico.AtualizaTotal;
var
  vTotal: Double;
begin
  if Entidade.Situacao <= 3 then
  Begin
    vTotal := 0;
    //Atualiza Total do Pedido
    if (not Item_Pedido_Venda1.IsEmpty) then
    Begin
      Item_Pedido_Venda2.Close;
      Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
      Item_Pedido_Venda2.ParamByName('PDV_CODIGO').asInteger:=Entidade.CodigoPDV;
      Item_Pedido_Venda2.Open;
      Item_Pedido_Venda2.First;
      while not Item_Pedido_Venda2.EOF do
      Begin
        with Produto1 do
        Begin
          Close;
          ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda2.CodigoPRD;
          Open;
          if IsEmpty then
            Raise exception.Create('Produto não encontrado! '+IntToStr(Item_Pedido_Venda2.CodigoPRD));
        end;
        vTotal := vTotal + Arredonda(Item_Pedido_Venda2.PrecoDesc*Item_Pedido_Venda2.Quantidade);
        Item_Pedido_Venda2.Next;
      end;
    end;
    Item_Pedido_Venda1.Close;
    vTotal := vTotal + Arredonda(Entidade.Frete);
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_TOTAL='+VirgPonto(vTotal)+
      ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ',PDV_SERVICO=1 '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
    Entidade.Close;
    Entidade.Open;
    Item_Pedido_Venda1.Open;
  end;
end;

procedure TfMxServico.FretePedClick(Sender: TObject);
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
      Tag:=9;
      aux:=self.Item_Pedido_Venda1.AfterScroll;
      self.Item_Pedido_Venda1.AfterScroll:=Nil;
      try
        Caption := 'Valor do Frete';
        labDesValor.Caption := 'Frete: R$';
        edtValorEntrada.Text := Format('%.2f',[self.Entidade.Frete]);
        Showmodal;
        self.Item_Pedido_Venda1.First;
      finally
        self.Item_Pedido_Venda1.AfterScroll:=Aux;
      end;
      self.CarregarItemVenda;
    end;
  end;
end;

procedure TfMxServico.otalPedido1Click(Sender: TObject);
begin
  AtualizaTotal;
  ShowMessage('Total do Pedido: R$ '+format('%.2f',[Entidade.Total]));
end;

procedure TfMxServico.GerarServioAut1Click(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(7930)) < 0) then
    Raise exception.Create('Usuário não tem permissão para inserir Pedido automático!');

  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  try
    Item_Pedido_Venda1.Close;
    Entidade.Close;
    Entidade.Open;
    Item_Pedido_Venda1.Open;
  finally
    Item_Pedido_Venda1.AfterScroll:=Aux;
  end;
  If not Entidade.IsEmpty Then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO '+
        ' FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      Open;
      if IsEmpty then
      Begin
        Detalhe_Venda1.Deletar(Entidade.CodigoCNC,Entidade.CodigoPDV);
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
        Entidade.RegistrarDel(Entidade.CodigoCNC, 1860(*PedidoDeVenda*), Entidade.CodigoPDV, 'Vazio - Novo Pedido');
        Entidade.Close;
        Entidade.Open;
      end;
    end;
  end;
  if not Entidade.FecharPedido then
    raise Exception.Create('Não foi possível liberar o pedido atual.');
  Item_Pedido_Venda1.Close;
  with Entidade do
  Begin
    Close;
    SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO=-1 '+
      ' AND PDV_CODIGO=-1 ';
    Open;
  end;
  Item_Pedido_Venda1.Open;

  CancelarLoc:=True;
  Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
  with fMxSPedLoc do
  Begin
    tag:=13;
    sFiltrarServico := '';

    //Mudança do tamanho dos campos - existe um select ao chamar a entidade q diminui o tamanho eu run-time
    Pedido_de_Venda1.fieldbyname('PDV_VENCIMENTOS').size := 1;
    Pedido_de_Venda1.fieldbyname('PDV_CONTATO').size := 1;
    Pedido_de_Venda1.fieldbyname('PDV_CAIXA').size := 1;
    Pedido_de_Venda1.fieldbyname('PDV_FONE_CONTATO').size := 1;

    Showmodal;
  end;

  if (edtCodigoPDV.Text = '') then
    cancelarLoc := True;

  If not cancelarLoc Then
  Begin
    Aux:=Item_Pedido_Venda1.AfterScroll;
    Item_Pedido_Venda1.AfterScroll:=nil;
    try
      Item_Pedido_Venda1.Close;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text;
      Entidade.Open;
      Entidade.AbrirPedido(True);
      dblTipoPagamento.KeyValue  := Entidade.TipoPag;
      dblFormaPagamento.KeyValue := Entidade.CodigoFPG;
      dblFormaPagamentoClick(sender);
      Entidade.CarregaDados;
      Item_Pedido_Venda1.Open;
      dblResponsavel.KeyValue := Item_Pedido_Venda1.CodigoFUN;
    finally
      Item_Pedido_Venda1.AfterScroll:=Aux;
    end;

    //Carregar informações do Cliente
    edtCodigoCLIExit(Sender);

    //Carregar informações do Produto
    CarregarItemVenda;

    If not Item_Pedido_Venda1.IsEmpty then
    Begin
      If Forma_de_Pagamento1.Prazo<>'0' then
        EntradaPed.Enabled := ((Copy(Forma_de_Pagamento1.Prazo,1,1)='0')and(not AgenteFin1.JurosEntrada))
      Else
        EntradaPed.Enabled := False;
    end;

    edtQuantidadeChange(edtPrecoDesconto);

    SB_AltPedClick(sender);
  end;
end;

procedure TfMxServico.dbgProdutoTitleClick(Column: TColumn);
begin
  try
    if Item_Pedido_Venda1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_Pedido_Venda1.SOrdemdoGrid(Item_Pedido_Venda1.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxServico.Funcionario1BeforeOpen(DataSet: TDataSet);
begin
  try
    Funcionario1.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxServico.edtCodigoLOTExit(Sender: TObject);
begin
  if (not VerificaInteiroBranco(edtCodigoPRD.Text)) or
     (not VerificaInteiroBranco(edtCodigoLOT.Text)) then
    edtCodigoLOT.Text := '0';

  if StrToInt(edtCodigoLOT.Text) <= 0 then
  Begin
    edtCodigoLOT.Text := '0';
    if Item_Pedido_Venda1.CodigoLOT > 0 then
    Begin
      CalcularPrecoSugestao;
      edtPrecoDesconto.Text := edtPrecoSugestao.Text;
    end;
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT LOT_CODIGO '+
      ' FROM LOTE '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+
      ' AND LOT_CODIGO='+edtCodigoLOT.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoLOT.Text := '0';
      Exit;
    end;
  end;
end;

procedure TfMxServico.edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadLote, fCadLote);
    with fCadLote do
    Begin
      tag:=6;
      edtCodigoPRD.text := self.edtCodigoPRD.Text;
      edtProduto.Text := self.edtProduto.Text;
      ShowModal;
    end;
  end;
end;

procedure TfMxServico.CalcularPrecoSugestao;
var
  PrecoTabelaPrincipal, vPrecoVenda:Double;
Begin
  with Produto1 do
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
    edtProduto.text:=Trim(Descricao)+' '+Referencia;
    edtPrecoUnitario.Text := format('%.2f',[vPrecoVenda]);

    if DM.Configuracao1.Empresa = empMotical then
    Begin
      if Produto1.Servico then
      Begin
        with DM.QR_Consultas do
        Begin
          //Procurar Tabela Promocional de Laboratório Para Serviço
          Close;
          SQL.Text := 'SELECT * '+
            ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
            ' WHERE I1.GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
            ' AND I1.SGP_CODIGO='+IntToStr(Produto1.CodigoSGP)+
            ' AND (I1.PRD_CODIGO=0 OR I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+') '+              
            ' AND (T1.CLI_CODIGO=0 '+
            '  OR (T1.CNC_CLIENTE='+edtClienteCNC.Text+
            '  AND T1.CLI_CODIGO='+edtCodigoCLI.Text+') '+
            '  OR (T1.CLI_CODIGO=-1 '+
            '  AND EXISTS (SELECT TBP_CODIGO FROM TABELA_DE_PRECO_CLIENTE TBC '+
            '      WHERE TBC.CNC_TABELA=T1.CNC_CODIGO '+
            '      AND TBC.TBP_CODIGO=T1.TPS_CODIGO '+
            '      AND TBC.CNC_CLIENTE='+edtClienteCNC.Text+
            '      AND TBC.CLI_CODIGO='+edtCodigoCLI.Text+'))) '+
            ' AND I1.ITS_SITUACAO=0 '+
            ' AND T1.TPS_SITUACAO=0 '+
            ' AND T1.TPS_LABORATORIO=1 '+
            ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
            ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' OR T1.CNC_CODIGO=1) '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
            ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
          Open;
          if IsEmpty then
            edtPrecoSugestao.Text := format('%.2f',[vPrecoVenda])
          else
          Begin
            edtCodigoTBPProduto.Text := FieldByname('TPS_CODIGO').asString;
            if (dblFormaPagamento.KeyValue = 1) or
               (Cliente1.VendaAtacado) then
              edtPrecoSugestao.Text := format('%.2f',[FieldByname('ITS_PRECO_VENDA').asFloat-
                                  FieldByname('ITS_PRECO_VENDA').asFloat*
                                  FieldByname('TPS_DESCONTO_SIMPLES').asFloat/100])
            else
              edtPrecoSugestao.Text := format('%.2f',[FieldByname('ITS_PRECO_VENDA').asFloat-
                                  FieldByname('ITS_PRECO_VENDA').asFloat*
                                  FieldByname('TPS_DESCONTO_ESPECIAL').asFloat/100]);
          end;
        end;
      end
      else //Não Serviço
      Begin
        //Preço Sugerido
        with DM.QR_Consultas do
        Begin
          //Preço da Tabela de Laboratório Principal
          Close;
          SQL.Text := 'SELECT * '+
            ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
            ' WHERE I1.GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
            ' AND I1.SGP_CODIGO='+IntToStr(Produto1.CodigoSGP)+
            ' AND (I1.PRD_CODIGO=0 OR I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+') '+
            ' AND T1.CLI_CODIGO=0 '+ //Tabela Principal tem que ser CLI_CODIGO = 0
            ' AND I1.ITS_SITUACAO=0 '+
            ' AND T1.TPS_SITUACAO=0 '+
            ' AND T1.TPS_LABORATORIO=1 '+  //Laboratório Principal
            ' AND T1.TPS_PRINCIPAL=1 '+  //Tabela Principal
            ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
            ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' OR T1.CNC_CODIGO=1) '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO ';
            //Não Ordena por ser única a tabela principal
          Open;
          if IsEmpty then
          Begin
            Showmessage('Produto fora da Tabela Principal de Laboratório!');
            edtCodigoPRD.SetFocus;
            Exit;
          end;
          PrecoTabelaPrincipal := FieldByname('ITS_PRECO_VENDA').asFloat;
          edtCodigoTBPProduto.Text := FieldByname('TPS_CODIGO').asString;

          //Procurar Tabela Promocional de Laboratório
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
            ' AND T1.TPS_LABORATORIO=1 '+  //Laboratório
            ' AND T1.TPS_PRINCIPAL=0 '+  //Não Tabela Promocional
            ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
            ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' OR T1.CNC_CODIGO=1) '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
            ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
          Open;
          if IsEmpty then
          Begin
            if (dblFormaPagamento.KeyValue = 1) or
               (Cliente1.VendaAtacado) then
            Begin
              if Cliente1.Desconto > 0 then
                edtPrecoSugestao.text := Format('%.2f',[PrecoTabelaPrincipal-PrecoTabelaPrincipal*Cliente1.Desconto/100])
              else if Produto1.FieldByName('GRP_ESPECIAL').asInteger = 1 then //Lente de Contato
                edtPrecoSugestao.text := Format('%.2f',[PrecoTabelaPrincipal-PrecoTabelaPrincipal*DM.Configuracao1.LBMDesconto60/100]) //Desc Simple Lente de Contato
              else
                edtPrecoSugestao.text := Format('%.2f',[PrecoTabelaPrincipal-PrecoTabelaPrincipal*DM.Configuracao1.JurosNorm/100]);
            end
            else
            Begin
              if Produto1.FieldByName('GRP_ESPECIAL').asInteger = 1 then //Lente de Contato
                edtPrecoSugestao.text := Format('%.2f',[PrecoTabelaPrincipal-PrecoTabelaPrincipal*DM.Configuracao1.LBMJuros60/100]) //Desc Esp Lente de Contato
              else
                edtPrecoSugestao.text := Format('%.2f',[PrecoTabelaPrincipal-PrecoTabelaPrincipal*DM.Configuracao1.JurosEsp/100]);
            end;
          end
          else
          Begin
            edtCodigoTBPProduto.Text := FieldByname('TPS_CODIGO').asString;
            if (dblFormaPagamento.KeyValue = 1) or
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
      end;
    end
    else //Não é Motical
    Begin
      with DM.QR_Consultas do
      Begin
        //Procurar Tabela Promocional de Laboratório Para Serviço
        Close;
        SQL.Text := 'SELECT * '+
          ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
          ' WHERE I1.GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
          ' AND I1.SGP_CODIGO='+IntToStr(Produto1.CodigoSGP)+
          ' AND (I1.PRD_CODIGO=0 OR I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+') '+
          ' AND (T1.CLI_CODIGO=0 '+
          '  OR (T1.CNC_CLIENTE='+edtClienteCNC.Text+
          '  AND T1.CLI_CODIGO='+edtCodigoCLI.Text+') '+
          '  OR (T1.CLI_CODIGO=-1 '+
          '  AND EXISTS (SELECT TBP_CODIGO FROM TABELA_DE_PRECO_CLIENTE TBC '+
          '      WHERE TBC.CNC_TABELA=T1.CNC_CODIGO '+
          '      AND TBC.TBP_CODIGO=T1.TPS_CODIGO '+
          '      AND TBC.CNC_CLIENTE='+edtClienteCNC.Text+
          '      AND TBC.CLI_CODIGO='+edtCodigoCLI.Text+'))) '+
          ' AND I1.ITS_SITUACAO=0 '+
          ' AND T1.TPS_SITUACAO=0 '+
          ' AND T1.TPS_LABORATORIO=1 '+
          ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
          ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' OR T1.CNC_CODIGO=1) '+
          ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
          ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
          ' ORDER BY ABS(CLI_CODIGO) DESC, ITS_PRECO_VENDA ASC ';
        Open;
        if IsEmpty then
          edtPrecoSugestao.Text := format('%.2f',[vPrecoVenda])
        else
        Begin
          edtCodigoTBPProduto.Text := FieldByname('TPS_CODIGO').asString;
          edtPrecoSugestao.Text := format('%.2f',[FieldByname('ITS_PRECO_VENDA').asFloat]);
        end;
      end;
    end;
  end;
end;

end.
