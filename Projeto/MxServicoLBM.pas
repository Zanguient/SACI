unit MxServicoLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Menus, Funcionario, Cliente, Variants,
  Produto,
  Item_de_Estoque, Cod_Barr, Titulo_receber, Usuario, AgenteFin,
  Forma_de_Pagamento, Parametro, Fatfin, Informacoes, Item_Pacote_Venda,
  Pedido_de_Venda, Item_Pedido_Venda, Detalhe_Venda, Contato, Vendedor;

type
  TfMxServicoLBM = class(TForm)
    Panel3: TPanel;
    Label27: TLabel;
    Panel5: TPanel;
    Panel1: TPanel;
    dbgProduto: TDBGrid;
    Label23: TLabel;
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
    edtPreco: TEdit;
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
    edtDocumento: TEdit;
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
    Titulo_receber5: TTitulo_receber;
    Informacoes1: TInformacoes;
    Itens_Agrupados: TQuery;
    Item_Pacote_Venda1: TItem_Pacote_Venda;
    Titulo_receber2: TTitulo_receber;
    Titulo_receber1: TTitulo_receber;
    edtCodigoTBPProduto: TEdit;
    edtPrecoDesc: TEdit;
    Pedido_de_Venda1: TPedido_de_Venda;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    edtDataEntrada: TEdit;
    memObservacao: TMemo;
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
    Label16: TLabel;
    edtCodigoCNT: TEdit;
    Label8: TLabel;
    edtNomeContato: TEdit;
    Label17: TLabel;
    Contato1: TContato;
    Label14: TLabel;
    edtVinculo: TEdit;
    Item_Pedido_Venda1IPV_VINCULO: TIntegerField;
    Label20: TLabel;
    edtObservacaoItem: TEdit;
    Label12: TLabel;
    dblResponsavel: TDBLookupComboBox;
    Label21: TLabel;
    edtGarantia: TEdit;
    Label22: TLabel;
    cmbTipoDeVenda: TComboBox;
    Label24: TLabel;
    edtCodigoPDVOrigem: TEdit;
    Item_Pedido_Venda1IPV_SEQUENCIA: TIntegerField;
    DetalhePedidoCab: TMenuItem;
    N4: TMenuItem;
    otalPedido1: TMenuItem;
    Item_Pedido_Venda1Tecnico: TStringField;
    Vendedor2: TVendedor;
    SB_LocPed: TSpeedButton;
    EntradaPed: TMenuItem;
    Label28: TLabel;
    edtOrcamento: TEdit;
    Produto1PRD_FORA_DE_LINHA: TIntegerField;
    Produto1PRD_CATALOGO: TIntegerField;
    Produto1PRD_PREVISAO: TIntegerField;
    Produto1PRD_CLASSIFICACAO: TIntegerField;
    Produto1PRD_ESTOQUE_DETALHADO: TIntegerField;
    Produto1SGP_EIXOS: TStringField;
    edtBonificacao: TEdit;
    Item_Pedido_Venda1Unidade: TStringField;
    Label30: TLabel;
    mskDataReferencia: TMaskEdit;
    ckbMelhorData: TCheckBox;
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
    procedure Item_Pedido_Venda1AfterOpen(DataSet: TDataSet);
    procedure SB_CupomClick(Sender: TObject);
    procedure ObservaoItem1Click(Sender: TObject);
    procedure edtCodigoCNTExit(Sender: TObject);
    procedure edtCodigoCNTKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoDeVendaChange(Sender: TObject);
    procedure SB_EtiquetaClick(Sender: TObject);
    procedure edtCodigoPDVOrigemKeyPress(Sender: TObject; var Key: Char);
    procedure edtVinculoExit(Sender: TObject);
    procedure DetalhePedidoCabClick(Sender: TObject);
    procedure otalPedido1Click(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Item_Pedido_Venda2BeforeOpen(DataSet: TDataSet);
    procedure SB_LocPedClick(Sender: TObject);
    procedure EntradaPedClick(Sender: TObject);
    procedure edtOrcamentoExit(Sender: TObject);
    procedure dbgProdutoTitleClick(Column: TColumn);
    procedure dblTipoPagamentoClick(Sender: TObject);
    procedure Forma_de_Pagamento1BeforeOpen(DataSet: TDataSet);
    procedure Forma_de_Pagamento1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure Label18DblClick(Sender: TObject);
    procedure ckbMelhorDataClick(Sender: TObject);
  private
    QtdAnt: Double;  
    CdUltimoGRP, CdUltimoSGP: integer;
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    procedure CarregarItemVenda;
    procedure LimpaItens(ProdutoServico: integer);
    procedure AtualizaTotal;
  public
    Entidade:TPedido_de_Venda;
    Cancelar, CancelarLoc, CancelarFatura :Boolean;
  end;

var
  fMxServicoLBM: TfMxServicoLBM;

implementation
Uses
  UDM, funcoes, CdCliente, DigSenha,
  MxSRecPedido, MxSPediProdMotCal,
  MxSPediProd, MxFinalizaPedido, CdServico,
  MxSPediLoc, UEtiquetaServico, MxSNotaCupom, MxCalculoAdicao,
  UComprovanteMovimento, CdContato, MxDetalhePedido,
  MxCliObs, MxSelPromissoriaRecibo, MxValorEntrada;
{$R *.DFM}

procedure TfMxServicoLBM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    dbgProduto.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_PedSerLBM_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  AgenteFin1.Close;
  Forma_de_Pagamento1.Close;
  Parametro1.Close;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxServicoLBM.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Open;
  with Funcionario1 do
  Begin
    Close;
    SQL.Text := 'SELECT FUN_CODIGO, FUN_APELIDO '+
      ' FROM FUNCIONARIO '+
      ' WHERE FUN_APARECE_SERVICOS=1 '+
      ' AND FUN_SITUACAO<>1 '+
      ' ORDER BY FUN_APELIDO';
    Open;
  end;
  FatorFinanceira2.Open;
  Parametro1.Open;
  Forma_de_pagamento1.Open;
  AgenteFin1.Open;
  CdUltimoGRP := 0;
  CdUltimoSGP := 0;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC = 3) and //LBM Serviço
     (SB_NovoPed.Visible) then
    SB_NovoPedClick(sender);
end;

procedure TfMxServicoLBM.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  Item_Pedido_Venda1.PServico := True;
  try
    dbgProduto.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_PedSerLBM_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxServicoLBM.SB_NovoPedClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6600)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir/alterar registro!');

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

  //PARA NÃO PERDER O CÓDIGO DO PEDIDO
  //CONSIDERO SOMENTE UM MICRO OPERANDO
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC = 3) then //LBM Serviço
  Begin
    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA_CONF '+
        ' SET PDV_CODIGO=(SELECT MAX(PDV_CODIGO) FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+')');
    except
    end;
  end;

  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  ckbMelhorData.Checked := False;
  ckbMelhorDataClick(sender);    

  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  dblTipoPagamento.KeyValue:=5;
  dblFormaPagamento.KeyValue:=1;
  dblFormaPagamentoClick(sender);

  edtOrcamento.Enabled := True;
  edtOrcamento.Color := clWindow;
  edtOrcamento.Text := IntToStr(DM.Configuracao1.Orcamento);
  edtOrcamento.SetFocus;

  edtCodigoCLI.SetFocus;
end;

procedure TfMxServicoLBM.SB_AltPedClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Pedido de Serviço!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido já foi Entregue!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6600)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir/alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  try
    edtCodigoCLI.SetFocus;
  except
    try
      dblTipoPagamento.SetFocus;
    except
    end;
  end;
  if (Forma_de_Pagamento1.Prazo<>'') and
     (Forma_de_Pagamento1.Prazo<>'0') then
  Begin
    ckbMelhorData.Enabled := True;
    ckbMelhorDataClick(sender);
  end;
end;

procedure TfMxServicoLBM.SB_SalvaPedClick(Sender: TObject);
var
  Trans : Boolean;
  CdCNC, CdPDV, vSit, vTipoVenda: integer;
  vTotal, vValor: Double;
  sMelhorData: string;
begin
  If (dblTipoPagamento.Text = '') then
    Raise Exception.Create('Tipo de pagamento faltando!');
  If (dblFormaPagamento.Text = '')then
    Raise Exception.Create('Forma de pagamento faltando!');
  If (dblCodigoAGF.Text = '') then
    Raise Exception.Create('Agente financeiro faltando!');
  if not VerificaInteiroBranco(edtCodigoPDVOrigem.Text) then
    edtCodigoPDVOrigem.Text := '0';
  if not VerificaData(mskDataReferencia.Text) then
    Raise Exception.Create('Data de Referência inválida!')
  else if VerificaDataBranco(mskDataReferencia.Text) then
  Begin
    if (Abs(StrToDate(mskDataReferencia.Text)-DM.Configuracao1.Data) > DM.Configuracao1.MelhorData) then
      ShowMessage('Data de Referência acima do permitido!');
    if (StrToDate(mskDataReferencia.Text) < DM.Configuracao1.Data) and
       (Forma_de_Pagamento1.Prazo[1] = '0') then
      Raise exception.Create('Data de Referência inválida!');
  end;

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdPDV := StrToInt(edtCodigoPDV.Text);

  if not VerificaData(mskDataReferencia.Text) then
    Raise Exception.Create('Data de Referência inválida!')
  else if VerificaDataBranco(mskDataReferencia.Text) then
  Begin
    if (StrToDate(mskDataReferencia.Text) < DM.Configuracao1.Data) and
       (Forma_de_Pagamento1.Prazo[1] = '0') then
      Raise Exception.Create('Data de Referência inválida!');
    if (Abs(StrToDate(mskDataReferencia.Text)-DM.Configuracao1.Data) > DM.Configuracao1.MelhorData) then
    Begin
      if MessageDlg('Data de Referência acima do permitido!'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8280)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=37;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(8280)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão Data de referência acima do permitido!');
            end
            else
              DM.Usuario1.GeraLog(8280, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' SERVICO-DT REFERENCIA');
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
        DM.Usuario1.GeraLog(8280, CdCNC, CdPDV,
          'SERVICO-DT REFERENCIA');
    end;
  end;

  if (dblTipoPagamento.KeyValue <> 412) and //Boleto Bancário
     ((dblTipoPagamento.KeyValue <> 5) or //Dinheiro/Promissória
      (dblFormaPagamento.KeyValue <> 1)) and //Dif. A Vista
     (Informacoes1.Boleto) then
  Begin
    if MessageDlg('Cliente cadastrado para Boleto Bancário!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=37;
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
  end;

  if (Informacoes1.CodigoFPG > 0) and
     (dblTipoPagamento.KeyValue <> 13) and //Dif. Cartão
     (dblFormaPagamento.KeyValue <> 1) then //Dif. A Vista
  Begin
    if dblFormaPagamento.KeyValue <> Informacoes1.CodigoFPG then
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
        if MessageDlg('Cliente com forma de pagamento definida!'+#13+
                      'Alterar para a forma pré-estabelecida?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          dblFormaPagamento.KeyValue := Informacoes1.CodigoFPG
        else //Forma de Pagamento diferente da pré-estabelecida
        Begin
          If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0) then
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              onClose:=nil;
              Tag:=37;
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
      end;
    end;
  end;

  if Entidade.Situacao >= 2 then
    vSit := Entidade.Situacao //Para poder alterar um Serviço em andamento sem mudar a situação
  else
    vSit := 0;

  if cmbTipoDeVenda.ItemIndex in [2,3] then
  Begin
    if cmbTipoDeVenda.ItemIndex = 2 then
      vTipoVenda := 11  //Manutenção Contrato
    else
      vTipoVenda := 10; //Garantia Serviço
    if StrToInt(edtCodigoPDVOrigem.Text) <= 0 then
    Begin
      edtCodigoPDVOrigem.SetFocus;
      Raise exception.Create('Código de pedido de origem inválido!');
    end;
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 PDV_CODIGO '+
        ' FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+edtCodigoPDVOrigem.Text+
        ' AND PDV_SITUACAO=4 '+
        ' AND PDV_TIPO_VENDA='+IntToStr(vTipoVenda)+
        ' AND 30*PDV_GARANTIA+PDV_DT_PREVISAO>="'+MesDia(DM.Configuracao1.Data)+'" ';
      Open;
      if isEmpty then
        Raise exception.Create('Pedido Origem inválido ou vencido!');
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

      if not Entidade.FinalizaEdicao(vSit(*Sit*),0(*Listado*),0(*Total*),0(*Acrescimo*),False(*GRPEsp*),True(*Serviço*)) then
        Raise exception.Create('');

      if trans then
        Commit;
      trans := False;
      
      AtualizaControles(1,False);
      ckbMelhorData.Enabled:=False;
      ckbMelhorDataClick(sender);
      edtOrcamento.Enabled := False;
      edtOrcamento.Color := AlteraCorComponentes;
      with Entidade do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PDV_CODIGO='+IntToStr(CdPDV);
        Open;
      end;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  End;
  vTotal := 0;
  //Atualiza Total do Pedido
  if (not Item_Pedido_Venda1.IsEmpty) then
  Begin
    Item_Pedido_Venda2.Close;
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
      vValor := Item_Pedido_Venda2.PrecoDesc;

      vTotal := vTotal + vValor*Item_Pedido_Venda2.Quantidade;
      Item_Pedido_Venda2.Next;
    end;
  end;

  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.Open;
  if ckbMelhorData.Checked then
    sMelhorData := '"'+MesDia(mskDataReferencia.Text)+'" '
  else
    sMelhorData := 'NULL';

  ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
    ' PDV_TOTAL='+VirgPonto(vTotal)+
    ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ',PDV_MELHOR_DATA='+sMelhorData+
    ',PDV_SERVICO=1 '+
    ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
    ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
  Entidade.Close;
  Entidade.Open;
  Item_Pedido_Venda1.Open;

  if Item_Pedido_Venda1.IsEmpty then
  Begin
    if cmbTipoDeVenda.ItemIndex in [2,3] then
      //Adicionar itens do serviço original
    else
      SB_NovoProClick(sender);
  end;
end;

procedure TfMxServicoLBM.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
  ckbMelhorData.Enabled:=False;
  ckbMelhorDataClick(sender);
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtUsuario.Clear;
    edtRazaoSocial.Clear;
    mskFone.Clear;
    edtProduto.Clear;
    edtPrecoTotalPRD.Clear;
    ckbMelhorData.Checked := False;
  end;
  edtOrcamento.Enabled := False;
  edtOrcamento.Color := AlteraCorComponentes;
end;

procedure TfMxServicoLBM.FormCloseQuery(Sender: TObject;
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

procedure TfMxServicoLBM.SB_EntregarClick(Sender: TObject);
var
  Trans, vTemEntrada : Boolean;
  CdCNC, CdPDV, CdPRD, CdCLICNC, CdCLI,SEQ,
    iGrupoEspecial, CdFUN: integer;
  vQtd, vTotal: Double;
  vDataInadiplencia: TDateTime;
  sCodigoCARTAO: string;
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido entregue!');
  If (Entidade.Situacao <> 3) and
     (not (DM.Configuracao1.Empresa in TEmpresasEstFUN))  then
    Raise Exception.Create('Pedido em andamento!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1980)) < 0 then
    raise Exception.Create('O usuário não tem permissão para entregar serviço!');

  if DM.Configuracao1.Empresa = empLBM then
  Begin
    with Detalhe_Venda1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
      Open;
      if isEmpty or
         (Meio <= 0) then
      Begin
        DetalhePedidoCabClick(sender);
        Exit;
      end;
    end;
  end;

  if StrToInt(edtOrcamento.Text) > 0 then
  Begin
    If MessageDlg('Atenção!!!'+#13+'Se esse orçamento for finalizado passará a ser uma pedido entregue.'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end
  else
    If MessageDlg('Atenção!!!'+#13+'Tem certeza que deseja finalizar esse Pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

  CdCNC    := Entidade.CodigoCNC;
  CdPDV    := Entidade.CodigoPDV;
  CdCLI    := Entidade.CodigoCLI;
  CdCLICNC := Entidade.ClienteCNC;
  vTotal := 0;

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

    //Verificar a Existência dos itens Obrigatórios
    Close;
    SQL.Text := 'SELECT SGP_DESCRICAO '+
      ' FROM SUBGRUPO '+
      ' WHERE SGP_SERVICO_OBRIGATORIO=1 '+
      ' AND SGP_SITUACAO=0 '+
      ' AND SGP_CODIGO NOT IN (SELECT DISTINCT PRD.SGP_CODIGO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA IPV, PRODUTO PRD '+
      ' WHERE IPV.PRD_CODIGO=PRD.PRD_CODIGO) ';
    Open;
    if not isEmpty then
      Raise exception.Create('SubGrupo obrigatório '+FieldByName('SGP_DESCRICAO').asString+' não incluído!');
  end;


  with Item_Pedido_Venda2 do
  Begin
    Close;
    Open;
    if isEmpty then
      Raise exception.Create('Pedido sem itens!');
    while not Eof do
    Begin
      vTotal := vTotal + Arredonda(Quantidade*Arredonda(PrecoDesc,iCasasDecimaisVenda),iCasasDecimaisVenda);
      Next;
    end;
  end;
  vTotal := Arredonda(vTotal);

  if (vTotal <= 0) and
     (cmbTipoDeVenda.ItemIndex in [0,1]) then //Serviço ou Contrato
    Raise Exception.Create('Pedido com valor zerado!');

  if (Forma_de_Pagamento1.Prazo[1] = '0') then
    vTemEntrada := True
  else
    vTemEntrada := False;


  if (CdCLI <> DM.Configuracao1.CodigoCliAVista) and
     (dblTipoPagamento.KeyValue <> 13) and //Cartão
     (not ((dblFormaPagamento.KeyValue = 1) and (dblTipoPagamento.KeyValue = 5))) and   //Dinheiro á Vista
     (not ((dblFormaPagamento.KeyValue = 1) and (dblTipoPagamento.KeyValue = 6))) then  //Cheque á Vista
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
          Tag:=37;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para vender a Cliente no SPC!');
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
    end;
    vDataInadiplencia := DM.Configuracao1.Data;
    Titulo_receber5.Close;
    Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger := CdCLICNC;
    Titulo_receber5.ParamByName('CLI_CODIGO').asInteger  := CdCLI;
    Titulo_receber5.ParamByName('DATA').asDate           := vDataInadiplencia;
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
              vDataInadiplencia := DM.Configuracao1.Data;
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
                ' AND TRC_VENCIMENTO>"'+MesDia(vDataInadiplencia)+'") ';
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
          Tag:=37;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para vender a Cliente Inadiplente!');
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

  if cmbTipoDeVenda.ItemIndex in [0,1] then //Serviço ou Contrato
  Begin
    //Gerar Títulos Temporários
    if Entidade.CodigoFPG = 1 then //A Vista
    Begin
      if not Titulo_receber1.GerarTitVista(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartãoCV*), vTotal) then
        Raise Exception.Create('Não foi possível gerar Título à Vista!');
    end
    else if Entidade.TipoPag = 13 then //Cartão
    Begin
      if not Titulo_receber1.GerarTitPrazo(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartãoCV*), vTotal,Entidade.Entrada,vTemEntrada,True) then
        Raise Exception.Create('Não foi possível gerar Título Cartão!');
    end
    else
    Begin
      if not Titulo_receber1.GerarTitPrazo(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartãoCV*), vTotal,Entidade.Entrada,vTemEntrada,False) then
        Raise Exception.Create('Não foi possível gerar Título à Prazo!');
    end;
  end;

  sCodigoCARTAO := '';
{
  if dblTipoPagamento.KeyValue = 13 then //Cartao
  Begin
    sCodigoCARTAO := Trim(UpperCase(InputBox('Comprovante de Venda' , 'CV:', '')));
    if Length(sCodigoCARTAO) < 5 then
    Begin
      ShowMessage('Comprovante de Venda (CV) inválido!');
      Exit;
    end;
  end;
}

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

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
          if not Titulo_receber2.Inserir(DM.Configuracao1.CodigoCNC,0,
              FieldByName('CLI_CODIGO').AsInteger,FieldByName('PDV_CODIGO').AsInteger,
              FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
              dblTipoPagamento.KeyValue,FieldByName('TRC_TIPO_DOC').AsInteger,0(*TRF*),0(*Reabertura*),
              FieldByName('TRC_VENCIMENTO').AsDateTime,0(*DtPag*),0(*DtOrigem*),
              0(*DtVerificad0*),FieldByName('TRC_OBSERVACAO').AsString,
              PreencheZero(2,SEQ),''(*Numero*), sCodigoCARTAO,
              FieldByName('TRC_VALOR').AsFloat,0(*ValorPag*),
              FieldByName('TRC_CRED_CLI').AsFloat,FieldByName('AGF_CODIGO').AsInteger,
              Cliente1.CodigoCNC,0(*Situacao*),0(*TitAnterior*),0(*TitOrigem*),
              0(*TipoPedido*),False(*MovCaixa*), False(*CHQDev*)) then
          Begin
            ShowMessage('Falha ao gerar TRC!');
            Raise Exception.Create('');
          end;
          SEQ:=SEQ+1;
          Next;
        End;
        Close;
      End;


      Item_Pedido_Venda1.First;
      while not Item_Pedido_Venda1.Eof do
      Begin
        CdPRD := Item_Pedido_Venda1.CodigoPRD;
        vQtd  := Item_Pedido_Venda1.Quantidade;

        if DM.Configuracao1.Empresa in TEmpresasEstFUN then
          CdFUN := Item_Pedido_Venda1.CodigoFUN
        else
          CdFUN := 0;

        if (Item_Pedido_Venda1.Vinculo >= 0) and
           (not Item_Pedido_Venda1.Servico) then
        Begin
          with Item_de_Estoque1 do
          Begin
            Close;
            ParamByName('PRD_CODIGO').AsInteger := CdPRD;
            ParamByName('CNC_CODIGO').AsInteger := CdCNC;
            ParamByName('FUN_CODIGO').AsInteger := CdFUN;
            open;
            If IsEmpty Then
            Begin
              ShowMessage('Produto sem Item de Estoque!');
              Raise exception.Create('');
            end;
          end;

          //Gerar Movimento Comercial
          If not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,
              CdPDV,CdFUN,500(*VendaServiço*),CdCNC,CdPDV,'S', vQtd,
              Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
              Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*)) Then
          Begin
            ShowMessage('Falha ao Gerar Mov. Comercial!');
            Raise Exception.Create('');
          end;
          //Gerar Movimento Físico
          If not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,CdFUN,
              CdCNC,CdPDV,500(*VendaServiço*),'S',
              vQtd, Item_de_Estoque1.SFisico) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Físico!');
            Raise Exception.Create('');
          end;

          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
            ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(vQtd)+
            ',IES_SFISICO=IES_SFISICO-'+VirgPonto(vQtd)+
//            ',IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(vQtd)+
            ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND FUN_CODIGO='+IntToStr(CdFUN));
        end;
        Item_Pedido_Venda1.Next;
      end;

      ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_SITUACAO = 4 '+ //Entregue ao Cliente (Finalizado)
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
//        ',PDV_PACOTE='+edtCodigoPacote.Text+ //Definir Pacote
        ',PDV_DT_ENTREGA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
        ',FUN_ARQUITETO=0 '+
        ',PDV_TITULO_GERADO=1 '+
        ',PDV_SERVICO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

      With Cliente1 do
      Begin
        //Mudar situacao de cliente
        if (Cliente1.Situacao = 0) then
          ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
            ' CLI_SITUACAO=1 '+
            ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CLI_SITUACAO=0 '+
            ' AND CLI_CODIGO='+IntToStr(CdCLI)+
            ' AND CNC_CODIGO='+IntToStr(CdCLICNC));

        //Aumentar o crédito utilizado do cliente (Diferente de (À Vista ou Cartão)
        if (Entidade.CodigoFPG <> 1) and (Entidade.TipoPag <> 13) then
        Begin
          if (Informacoes1.Active) and (Informacoes1.IsEmpty) then
          Begin
            if not Informacoes1.Inserir(CdCLICNC,CdCLI,0,0,0,0,vTotal,
                0,0,0(*Renda*),DM.Configuracao1.DataHora,'','','','','','',False,False,vTotal) then
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
  If MessageDlg('Deseja ver os títulos desse Cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    Application.CreateForm(TfMxSRecPed, fMxSRecPed);
    with fMxSRecPed do
    Begin
      Tag :=9;
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
  Item_Pedido_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pedido_Venda1.Open;
end;

procedure TfMxServicoLBM.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxServicoLBM.SB_CancelarClick(Sender: TObject);
var
  CdCNC, CdPDV: integer;
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

  vMotivo := InputBox('Cancelamento de Serviço', 'Motivo:', '');

  if Length(Trim(vMotivo)) < 3 then
    Raise exception.Create('É obrigatório justificar o cancelamento!');

  // Verifica se o usuário que está logado não tem permissão para cancelar o pedido
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
      Tag:=37;
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

procedure TfMxServicoLBM.FormKeyPress(Sender: TObject; var Key: Char);
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
    if edtCodigoPRD.Focused then
      edtVinculo.SetFocus
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
  else if (Key = '.') and ((edtQuantidade.Focused) or (edtPrecoDesc.Focused)) then
    Key := ','
  else if (Key = '"') then
    Key := #0;
end;

procedure TfMxServicoLBM.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirPed.Enabled        := not Habilitar;
  AlterarPed.Enabled        := not Habilitar;
  SalvarPed.Enabled         := ((Cabecalho=1) and Habilitar);
  CancelarPed.Enabled       := ((Cabecalho=1) and Habilitar);
  Localizar1.Enabled        := not Habilitar;
  DetalhePedidoCab.Enabled  := not Habilitar;
  SB_NovoPed.Enabled        := not Habilitar;
  SB_LocPed.Enabled         := not Habilitar;  
  SB_AltPed.Enabled         := not Habilitar;
  SB_SalvaPed.Enabled       := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled        := ((Cabecalho=1) and Habilitar);

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
  edtPrecoDesc.Enabled      := ((Cabecalho=2) and Habilitar);

  SB_Entregar.Enabled       := not Habilitar;
  SB_Etiqueta.Enabled       := not Habilitar;
  SB_Imprimir.Enabled       := not Habilitar;
  SB_Cancelar.Enabled       := not Habilitar;
  SB_Cupom.Enabled          := not Habilitar;
  SB_Fechar.Enabled         := not Habilitar;

  if not Habilitar then
  Begin
    If Forma_de_Pagamento1.Prazo<>'0' then
      EntradaPed.Enabled := ((Copy(Forma_de_Pagamento1.Prazo,1,1)='0')and(not AgenteFin1.JurosEntrada))
    Else
      EntradaPed.Enabled := False;
  end
  else
    EntradaPed.Enabled := False;    

  dblResponsavel.Enabled    := ((Cabecalho=2) and Habilitar);

  dbgProduto.Enabled        := not Habilitar;
end;

procedure TfMxServicoLBM.SB_NovoProClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o serviço!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido entregue!');

//  if cmbTipoDeVenda.ItemIndex IN [2,3] then //Manutenção Contrato / Garantia Serviço
//    Raise exception.Create('Não é permitido adicionar itens na garantia!');

  QtdAnt := 0;
  edtProduto.Clear;
  edtPrecoTotalPRD.Clear;
  Item_Pedido_Venda1.PreparaInsercao;

  if dblResponsavel.Text = '' then
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FUN_CODIGO FROM FUNCIONARIO '+
        ' WHERE FUN_USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU);
      Open;
      if not isEmpty then
        dblResponsavel.KeyValue := FieldByName('FUN_CODIGO').asInteger;
    end;

  AtualizaControles(2,True);
  try
    edtCodigoPRD.SetFocus;
  except
  end;
end;

procedure TfMxServicoLBM.SB_AltProClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Selecione o Item!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido entregue!');

  if cmbTipoDeVenda.ItemIndex IN [2,3] then //Manutenção Contrato / Garantia Serviço
    Raise exception.Create('Não é permitido alterar itens na garantia!');

  QtdAnt := Item_Pedido_Venda1.Quantidade;
  Item_Pedido_Venda1.PreparaAlteracao;
  AtualizaControles(2,True);
  try
    edtVinculo.SetFocus;
  except
  end;
end;

procedure TfMxServicoLBM.SB_ExcProClick(Sender: TObject);
var
  CdCNC, CdPDV, CdIPV, CdPRD, iSequencia, CdFUN: integer;
  Trans: Boolean;
  vQtd: Double;
  vMotivo: string;
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inválido!');
  if Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Selecione o Item!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido finalizado!');

  If Item_Pedido_Venda1.Situacao = 2  then
    Raise Exception.Create('Serviço em andamento!');

  if Item_Pedido_Venda1.RecordCount <= 1 then
    Raise Exception.Create('Não é possível excluir o último item!');

  CdCNC := Item_Pedido_Venda1.CodigoCNC;
  CdPDV := Item_Pedido_Venda1.CodigoPDV;
  CdIPV := Item_Pedido_Venda1.CodigoIPV;
  CdPRD := Item_Pedido_Venda1.CodigoPRD;
  vQTD  := Item_Pedido_Venda1.Quantidade;
  iSequencia := Item_Pedido_Venda1.Sequencia;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT IPV_SEQUENCIA '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE IPV_VINCULO='+IntToStr(iSequencia)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC);
    Open;
    if not IsEmpty then
      Raise exception.Create('O Item '+FieldByName('IPV_SEQUENCIA').asString+' está vinculado a esse!');
  end;

  if (Item_Pedido_Venda1.Vinculo>=0) then
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

      if DM.Configuracao1.Empresa in TEmpresasEstFUN then
        CdFUN := Item_Pedido_Venda1.CodigoFUN
      else
        CdFUN := 0;

      with Item_de_Estoque1 do
      Begin
        Close;
        ParamByName('PRD_CODIGO').AsInteger := CdPRD;
        ParamByName('CNC_CODIGO').AsInteger := CdCNC;
        ParamByName('FUN_CODIGO').AsInteger := CdFUN;
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

          if (Item_Pedido_Venda1.Vinculo >= 0) and
             (not Item_Pedido_Venda1.Servico) then
          Begin
            //Gerar Comercial
            If not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,
                CdPRD,CdFUN,1050,CdCNC,CdPDV,'S', vQtd,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                vMotivo) Then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;

            //Gerar Fisico
            If not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,CdFUN,
                CdCNC,CdPDV,1050(*Danificada/Perca*),'S',
                vQtd, Item_de_Estoque1.SFisico,vMotivo) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end;

            //Atualizar estoque comercial e Físico
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(vQtd)+
              ',IES_SFISICO=IES_SFISICO-'+VirgPonto(vQtd)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND FUN_CODIGO='+IntToStr(CdFUN));
          end;

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
          Tag := 1;
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
      //
      Entidade.GeraLog(6610, CdCNC, CdPDV, 'IPV:'+IntToStr(CdIPV)+' PRD:'+IntToStr(CdPRD)+
          ' Motivo:'+vMotivo+
          ' Qtd:'+format('%.2f',[vQtd])+
          ' Preco:'+format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Item_Pedido_Venda1.Preco])+
          ' PrecoDesc:'+format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Item_Pedido_Venda1.PrecoDesc])+
          ' Sug:'+format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Item_Pedido_Venda1.PrecoSugerido]));
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

procedure TfMxServicoLBM.SB_SalvaProClick(Sender: TObject);
Var
  trans, vInserir:boolean;
  QuantidadeVendida, vTotal, vDesconto:Double;
  CdCNC, CdPRD, CdPDV, iSequencia, CdFUN: integer;
  sEspecial: string;
begin
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Exit
  else if edtCodigoPRD.Text = '-1' then
    Exit;

  if not VerificaInteiroBranco(edtVinculo.Text) then
    edtVinculo.Text := '0';

  if (StrToInt(edtVinculo.Text) < -1) then
    edtVinculo.Text := '-1';

  if dblResponsavel.Text = '' then
  Begin
    dblResponsavel.SetFocus;
    Exit;
  end;

  if Item_Pedido_Venda1.Estado = 1 then
    vInserir := True
  else
    vInserir := False;

  if not VerificaFloat(edtQuantidade.Text) then
    Raise exception.Create('Quantidade inválida!');
  edtQuantidadeChange(Sender);
  if not VerificaFloatBranco(edtQuantidade.Text) then
    edtQuantidade.Text:='1';
  if StrToFloat(edtQuantidade.Text) <= 0 then
    raise Exception.Create('Quantidade digitada incorretamente!');

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

  if (StrToInt(edtVinculo.Text) < 0) and
     (Produto1.Servico) then
    edtVinculo.Text := '0';

  if StrToInt(edtVinculo.Text) > 0 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT IPV_CODIGO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE IPV_SEQUENCIA='+edtVinculo.Text+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
        ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND (IPV_VINCULO=-1)  '+
        ' AND IPV_CODIGO<>'+IntToStr(Item_Pedido_Venda1.scodigo);
      Open;
      if IsEmpty then
        Raise exception.Create('Vínculo inválido!');
    end;
  end;

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

  QuantidadeVendida:=StrToFloat(edtQuantidade.Text) - QtdAnt;

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdPRD := StrToInt(edtCodigoPRD.Text);
  CdPDV := Entidade.CodigoPDV;

  if StrToInt(edtVinculo.Text) >= 0 then
  Begin
    if StrToFloat(edtPrecoDesc.Text) < Arredonda(Produto1.Precomedio,iCasasDecimaisVenda) then
    Begin
      ShowMessage('Produto: '+Trim(Produto1.Descricao)+' '+Produto1.Referencia+#13+
        'com preço abaixo do Mínimo!');
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=37;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão vender abaixo do Preço Mínimo!');
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
    end
    else
    Begin
      vDesconto := 100 - Arredonda(StrToFloat(edtPrecoDesc.Text)/StrToFloat(edtPrecoSugestao.Text)*100);
      If (vDesconto>DM.Configuracao1.JurosNorm) and
         (vDesconto<=DM.Configuracao1.JurosEsp) and
         (Forma_de_Pagamento1.Prazo='0') Then
      Begin
        if MessageDlg('Produto '+Trim(Produto1.Descricao)+' '+Produto1.Referencia+#13+
            ' com desconto atribuído (Especial)!'+#13+
            ' Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=37;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              If (Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
                 (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto (=Gerente)!');
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
      else If (vDesconto>DM.Configuracao1.JurosEsp) then
      Begin
        if MessageDlg('Produto '+Trim(Produto1.Descricao)+' '+Produto1.Referencia+#13+
            ' com desconto atribuído (Total)!'+#13+
            ' Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=37;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto (>Gerente)!');
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
      else if (Forma_de_Pagamento1.Prazo <> '0') and (vDesconto > 0) then
      Begin
        if MessageDlg('Produto '+Trim(Produto1.Descricao)+' '+Produto1.Referencia+#13+
            ' com desconto atribuído (Prazo)!'+#13+
            ' Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
           (not ((DM.Usuario1.Permissoes.IndexOf(IntToStr(3600)) > 0) and
                (vDesconto<DM.Configuracao1.JurosEsp))) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=37;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                 (not((Usuario1.Permissoes.IndexOf(IntToStr(3600)) > 0)and
                 (vDesconto<DM.Configuracao1.JurosEsp))) then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto (Prazo)!');
              end
              else
                DM.Usuario1.GeraLog(3600, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO A PRAZO');
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
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' SERVICO-DESCONTO A PRAZO');
      end
      else If (vDesconto>0) and (vDesconto<=DM.Configuracao1.JurosNorm) then
      Begin
        if MessageDlg('Produto '+Trim(Produto1.Descricao)+' '+Produto1.Referencia+#13+
            ' com desconto atribuído (Simples)!'+#13+
            ' Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND //Desc. Total
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) AND //Desc. Especial
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) AND //Abaixo do Mínimo
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) Then //Desc. Simples
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=37;
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
                raise Exception.Create('Usuário não tem Permissão para Liberar Desconto (Normal)!');
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
      end;
    end;
  end;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUN := dblResponsavel.KeyValue
  else
    CdFUN := 0;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    ParamByName('PRD_CODIGO').AsInteger := CdPRD;
    ParamByName('FUN_CODIGO').AsInteger := CdFUN;
    open;
    If isempty then
    begin
      if not Inserir(CdCNC,CdPRD,CdFUN,0,0,0,0,0,
          DM.Configuracao1.DataHora,0,0,0,0,0,0) then
        Raise exception.Create('Não foi possível criar Item de Estoque!');
      Close;
      ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      ParamByName('PRD_CODIGO').AsInteger := CdPRD;
      ParamByName('FUN_CODIGO').AsInteger := CdFUN;
      open;
    end;
    if StrToInt(edtVinculo.Text) >= 0 then
    Begin
      if (not Produto1.Servico) and (Saldo < QuantidadeVendida) then
      Begin
        ShowMessage('Quantidade acima do estoque!');
        if DM.Configuracao1.Empresa = empTeste then
          Exit;
      end;
    end;
  end;

  try
    edtDesconto.Text := format('%.2f',[(1-(StrToFloat(edtPrecoDesc.Text)/StrToFloat(edtPreco.Text)))*100]);
  except
    edtDesconto.Text := '0';
  end;

  if not Item_Pedido_Venda1.Active then
    Item_Pedido_Venda1.Open;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT MAX(IPV_SEQUENCIA) AS SEQ '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
    Open;
    if FieldByName('SEQ').asInteger > 0 then
      iSequencia := FieldByName('SEQ').asInteger + 1
    else
      iSequencia := 1;
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

      if not Item_Pedido_Venda1.FinalizaEdicao(0, QuantidadeVendida, 0, Produto1.servico, iSequencia) then
        Raise exception.Create('');

{      if StrToInt(edtVinculo.Text) >= 0 then
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
          ' IES_SRESERVADO=IES_SRESERVADO+'+VirgPonto(QuantidadeVendida)+
          ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND FUN_CODIGO='+IntToStr(CdFUN));
}

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
        Item_Pedido_Venda2.Open;
        Item_Pedido_Venda2.First;
        while not Item_Pedido_Venda2.EOF do
        Begin
          vTotal := vTotal + Item_Pedido_Venda2.Quantidade*Arredonda(Item_Pedido_Venda2.PrecoDesc,iCasasDecimaisVenda);
          Item_Pedido_Venda2.Next;
        end;
        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
          ' PDV_TOTAL='+VirgPonto(vTotal)+
          ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',PDV_SERVICO=1 '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      end;
      if vInserir then
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

procedure TfMxServicoLBM.SB_CancProClick(Sender: TObject);
begin
  QtdAnt := 0;
  Item_Pedido_Venda1.CancelaEdicao;
  AtualizaControles(2,False);
  if Item_Pedido_Venda1.IsEmpty then
    LimpaItens(0)
  else
    CarregarItemVenda;
end;

procedure TfMxServicoLBM.SB_ImprimirClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Selecione o Serviço!');

  Application.CreateForm(TfMxSelPromissoriaRecibo, fMxSelPromissoriaRecibo);
  with fMxSelPromissoriaRecibo do
  begin
    tag := 0;
    if (self.Entidade.Situacao = 4) then
      rdgOrcamento.Enabled := False;
    if (self.Entidade.Situacao <> 4) then
    Begin
      rdgRecibo.Enabled := False;
      rdgPromissoria.Enabled := False;
    end
    else if (self.Entidade.CodigoFPG = 1) then
      rdgPromissoria.Enabled := False;

    CdCNC       := self.Entidade.CodigoCNC;
    CdPDV       := self.Entidade.CodigoPDV;
    CdFPG       := self.Entidade.CodigoFPG;
    vTipoPag    := self.Entidade.TipoPag;
    iNotaFiscal := self.Entidade.NotaFiscal;
    if edtCodigoCNT.Text <> '0' then
      sContato    := self.edtNomeContato.Text
    else
      sContato    := '';
    iSituacao   := self.Entidade.Situacao;
    ShowModal;
  end;
end;

procedure TfMxServicoLBM.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      edtCodigoCLI.Text := '0';
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=40;
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
    if VerificaInteiroBranco(edtCodigoCLI.Text) and
       (edtCodigoCLI.Text <> '0') then
      try
        edtCodigoCNT.SetFocus;
      except
      end;
  End;
end;

procedure TfMxServicoLBM.edtCodigoCLIExit(Sender: TObject);
var
  vAux: char;
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
      if IsEmpty then
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
      end;

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
      end;      

      with Informacoes1 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Cliente1.CodigoCNC;
        ParamByName('CLI_CODIGO').asInteger := Cliente1.CodigoCLI;
        Open;
      end;

      edtCodigoCLI.text:=IntToStr(CodigoCli);
      edtRazaoSocial.text:=RazaoSocial;
      mskFone.text:=Fone;

      if SB_SalvaPed.Enabled then
      Begin
        edtCodigoCNT.Text := '0';
        edtNomeContato.Clear;

        //Contato
        if not Cliente1.PessoaFisica then
        Begin
          Contato1.Close;
          Contato1.SQL.Text := 'SELECT * FROM CONTATO '+
            ' WHERE CNC_FOR='+IntToStr(CodigoCNC)+
            ' AND FOR_CODIGO='+IntToStr(CodigoCLI);
          Contato1.Open;
          if not Contato1.isEmpty then
          Begin
            edtCodigoCNT.Text := IntToStr(Contato1.CodigoCNT);
            edtNomeContato.Text := Contato1.Nome;
          end
          else
          Begin
            vAux := chr(32);
            edtCodigoCNTKeyPress(sender, vAux);
          end;
        end;
      end
      else
        edtCodigoCNTExit(sender);
    end;
  End;
end;

procedure TfMxServicoLBM.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
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
        Tag:=56;
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
        Tag:=56;
        ShowModal;
      end;
    end;
    edtVinculo.SetFocus;
  End
  else If key=chr(13) then
  Begin
    Key := #0;
    edtVinculo.SetFocus;
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

procedure TfMxServicoLBM.edtCodigoPRDExit(Sender: TObject);
begin
  If SB_CancPro.Focused then
    Exit;
  try
    if Produto1.CodigoPRD <> StrToInt(edtCodigoPRD.Text) then
    Begin
      Produto1.Close;
      Produto1.ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
      Produto1.Open;
    end;
  except
    Produto1.Close;
    Produto1.ParamByName('PRD_CODIGO').asInteger := -10;
    Produto1.Open;
  end;
  if Produto1.IsEmpty then
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
    Produto1.Close;
    Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
    Produto1.Open;
  end;
  if Produto1.IsEmpty then
  Begin
    Showmessage('Produto inexistente!');
    edtCodigoPRD.SetFocus;
    Exit;
  End
  else if Produto1.Precovenda <= 0 then
  Begin
    Showmessage('Produto com Preço de venda inválido');
    edtCodigoPRD.SetFocus;
    Exit;
  end
  else if Produto1.Situacao = 1 then
  Begin
    Showmessage('Produto Desativado!');
    edtCodigoPRD.SetFocus;
    Exit;
  end;
  CdUltimoGRP := Produto1.CodigoGRP;
  CdUltimoSGP := Produto1.CodigoSGP;

  edtProduto.text:=Trim(Produto1.Descricao)+' '+Produto1.Referencia+' '+Produto1.Unidade;
  edtPreco.Text := format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Produto1.Precovenda]);
  edtCodigoTBPProduto.Text := '0';
  if Produto1.Servico then
    edtPrecoSugestao.Text := format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Produto1.Precovenda])
  else //Não Serviço
    edtPrecoSugestao.Text := format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Produto1.Precovenda]);
  edtPrecoDesc.Text := edtPrecoSugestao.Text;

  if edtQuantidade.Enabled and (not SB_SalvaPro.Focused) then
  Begin
    edtVinculo.SetFocus;
    edtCodigoPRD.Enabled:=False
  end;
end;

procedure TfMxServicoLBM.CarregarItemVenda;
Begin
  edtProduto.Clear;
  edtPrecoTotalPRD.Clear;
  If not Item_Pedido_Venda1.IsEmpty Then
  Begin
    Item_Pedido_Venda1.CarregaDados;
    edtProduto.Text := Item_Pedido_Venda1.FieldByName('Produto').asString;
    edtPreco.Text := format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Item_Pedido_Venda1.Preco]);
    dblResponsavel.KeyValue := Item_Pedido_Venda1.CodigoFUN;
    edtQuantidadeChange(edtQuantidade);
  End;
end;

procedure TfMxServicoLBM.edtQuantidadeChange(Sender: TObject);
begin
  try
    edtPrecoTotalPRD.Text := format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[StrToFloat(edtPrecoDesc.Text)*StrToFloat(edtQuantidade.Text)]);
    if not edtPrecoDesc.Enabled then
      Exit
    else if StrToInt(edtVinculo.Text) < 0 then
      edtPrecoDesc.Text := '0,00';    
  except
    if edtCodigoPRD.Text <> '' then
      edtPrecoTotalPRD.Text := '0,00'
    else
      edtPrecoTotalPRD.Clear;
  end;
end;

procedure TfMxServicoLBM.LimpaItens(ProdutoServico:integer);
Begin
  if ProdutoServico = 0 then
  Begin
    Item_Pedido_Venda1.LimpaCampos;
    edtProduto.Clear;
    dblResponsavel.KeyValue := -1;
    edtCodigoPRD.Clear;
    edtPrecoTotalPRD.Clear;
  end;
end;

procedure TfMxServicoLBM.edtCaixaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMxServicoLBM.dblFormaPagamentoClick(Sender: TObject);
var
  PDV,CNC:integer;
  aux:TDataSetNotifyEvent;
begin
  if (Entidade.Entrada > 0) and
     (Entidade.CodigoFPG <> dblFormaPagamento.KeyValue) and
     (SB_SalvaPed.Enabled) then
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
    try
      Item_Pedido_Venda1.Close;
      Entidade.Close;
      Entidade.Open;
      Item_Pedido_Venda1.Open;
    finally
      Item_Pedido_Venda1.AfterScroll:=Aux;
    end;
    CarregarItemVenda;
  end;

  if dblCodigoAGF.Enabled and (dblCodigoAGF.Text = '') then
    dblCodigoAGF.KeyValue:=0;

  if dblTipoPagamento.KeyValue = 13 then
  Begin
    if SB_SalvaPed.Enabled then
      dblFormaPagamento.Enabled:=True;
    ckbMelhorData.Enabled:=False;
  end
  else
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      dblFormaPagamento.Enabled:=True;
      ckbMelhorData.Enabled := True;
    end;
  end;

  if (Forma_de_Pagamento1.Prazo<>'') and (Forma_de_Pagamento1.Prazo<>'0') then
    if SB_SalvaPed.Enabled then
      ckbMelhorData.Enabled :=True;

  ckbMelhorDataClick(sender);

  if SB_SalvaPed.Enabled then
  Begin
    if not Item_Pedido_Venda1.IsEmpty then
    Begin
      Item_Pedido_Venda2.Close;
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
        if (Item_Pedido_Venda2.Desconto > 0) then
        Begin
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3600)) < 0) then
          Begin
            dblFormaPagamento.KeyValue := 1;
            Raise Exception.Create('Retire o Desconto dos itens para fazer essa alteração!');
          end;
        end;
        Item_Pedido_Venda2.Next;
      end;
    end;
  end;

  if (DM.Configuracao1.Empresa >= 4) or
     (DM.Configuracao1.Empresa = empEletro) then
  Begin
    if (dblTipoPagamento.KeyValue = 5) then //Dinheiro/Promissória
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                  ' WHERE (AGF_TIPOPAG_EXCLUSIVO=0 OR AGF_TIPOPAG_EXCLUSIVO='+IntToStr(dblTipoPagamento.KeyValue)+') '+
                  ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
        Open;
      end;
      if (dblCodigoAGF.Enabled) and
         (dblCodigoAGF.Text = '') then
      Begin
        if (DM.Configuracao1.Empresa = empEletro) then
          dblCodigoAGF.KeyValue := 54
        else
          dblCodigoAGF.KeyValue := 1;
      end;
    end
    else If dblTipoPagamento.KeyValue = 13 then //Cartão
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                  ' WHERE AGF_TIPOPAG_EXCLUSIVO=13 '+
                  ' AND AGF_CODIGO<>1 '+
                  ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL) ';
        Open;
      End;
      if (DM.Configuracao1.Empresa <> empEletro) and
         dblTipoPagamento.Focused then
      Begin
        dblFormaPagamento.KeyValue := 8; // Forma em 0 + 1
        if dblCodigoAGF.Enabled then
          dblCodigoAGF.KeyValue := 8; //Mastercard
      end;
    end
    Else if dblTipoPagamento.KeyValue = 6 then//Cheque
    Begin
      if DM.Configuracao1.Empresa = empEletro then
      Begin
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                    ' WHERE (AGF_TIPOPAG_EXCLUSIVO=0 OR AGF_TIPOPAG_EXCLUSIVO='+IntToStr(dblTipoPagamento.KeyValue)+') '+
                    ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
          Open;
        end;
      end
      else //Diferente de Eletro Guerra
      Begin
        if dblFormaPagamento.KeyValue = 1 then //A Vista
        Begin
          With AgenteFin1 do
          Begin
            Close;
            SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                      ' WHERE AGF_CODIGO=1'+ //Carteiro ou Cheque-PRE
                      ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
            Open;
            if dblCodigoAGF.Enabled then
              if (DM.Configuracao1.Empresa <> empEletro) then
                dblCodigoAGF.KeyValue := 1
              else
                dblCodigoAGF.KeyValue := 54;
          End
        end
        else if dblFormaPagamento.KeyValue <> 1 then //Diferente de A Vista
        Begin
          With AgenteFin1 do
          Begin
            Close;
            SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                      ' WHERE AGF_CODIGO=6'+ //Cheque-PRE
                      ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
            Open;
            if dblCodigoAGF.Enabled then
              dblCodigoAGF.KeyValue := 6;
          End;
        end;
      end;
    end
    else
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                  ' WHERE (AGF_TIPOPAG_EXCLUSIVO=0 OR AGF_TIPOPAG_EXCLUSIVO='+IntToStr(dblTipoPagamento.KeyValue)+') '+
                  ' AND AGF_CODIGO<>1 '+ //Diferente de Carteira
                  ' AND AGF_CODIGO<>6'+
                  ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
        Open;
      End;
    end;
  End
  //Petromax
  else
  Begin
    IF (Forma_de_Pagamento1.Prazo<>'0') OR
       (dblTipoPagamento.KeyValue = 13) then
    Begin
      if SB_SalvaPed.Enabled then
        dblCodigoAGF.Enabled:=True;
      If Parametro1.CodigoPAR=13 then
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                    ' WHERE AGF_TIPOPAG_EXCLUSIVO='+IntToStr(dblTipoPagamento.KeyValue)+
                    ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
          Open;
        End
      Else
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                    ' WHERE (AGF_TIPOPAG_EXCLUSIVO=0 OR AGF_TIPOPAG_EXCLUSIVO='+IntToStr(dblTipoPagamento.KeyValue)+') '+
                    ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
          Open;
        End;
    End
    Else
      If Parametro1.CodigoPAR=13 then
      Begin
        With AgenteFin1 do
        Begin
          if SB_SalvaPed.Enabled then
            dblCodigoAGF.Enabled:=True;
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                    ' WHERE AGF_TIPOPAG_EXCLUSIVO='+IntToStr(dblTipoPagamento.KeyValue)+
                    ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)';
          Open;
        End;
      end
      Else
      Begin
        if dblCodigoAGF.Enabled then
          dblCodigoAGF.KeyValue := 0;
        dblCodigoAGF.Enabled:=False;
      End;
  end;  
end;

procedure TfMxServicoLBM.AgenteFin1BeforeOpen(DataSet: TDataSet);
begin
  AgenteFin1.OnFilterRecord:=AgenteFin1FilterRecord;
  AgenteFin1.Filtered:=True;
end;

procedure TfMxServicoLBM.AgenteFin1FilterRecord(DataSet: TDataSet;
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

procedure TfMxServicoLBM.Item_Pedido_Venda1AfterScroll(DataSet: TDataSet);
begin
  CarregarItemVenda;
end;

procedure TfMxServicoLBM.Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    if Item_Pedido_Venda1.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda1.CodigoPRD;
      Open;
    end;
    Item_Pedido_Venda1.FieldByName('Produto').asString := Trim(Descricao)+' '+Referencia+' '+Unidade+' ('+IntToStr(CodigoPRD)+')';
    Item_Pedido_Venda1.FieldByName('Unidade').asString := Unidade;
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

  with Vendedor2 do
  Begin
    if (CodigoFUN <> Item_Pedido_Venda1.CodigoFUN) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Item_Pedido_Venda1.CodigoFUN;
      Open;
    end;
    Item_Pedido_Venda1.FieldByName('Tecnico').asString := FieldByName('FUN_APELIDO').asString;
  end;

  Item_Pedido_Venda1.FieldByName('Total').asFloat := Arredonda(Item_Pedido_Venda1.Quantidade*Item_Pedido_Venda1.PrecoDesc,iCasasDecimaisVenda);
end;

procedure TfMxServicoLBM.Pedido_de_Venda1AfterOpen(DataSet: TDataSet);
begin
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtNomeContato.Clear;
    edtRazaoSocial.Clear;
    ckbMelhorData.Checked := False;
  end
  else
  Begin
    Entidade.CarregaDados;
    if Entidade.CodigoCNT = 0 then
      edtNomeContato.Text := 'Não Definido';
  end;

  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.Open;
end;

procedure TfMxServicoLBM.Item_Pedido_Venda1AfterOpen(DataSet: TDataSet);
begin
  if Item_Pedido_Venda1.IsEmpty then
  Begin
    Item_Pedido_Venda1.LimpaCampos;
    dblResponsavel.KeyValue := -1;
    edtProduto.Clear;
    edtPrecoTotalPRD.Clear;
  end;
end;

procedure TfMxServicoLBM.SB_CupomClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if Entidade.Situacao <> 4 then
    Raise exception.Create('Pedido não finalizado!');
  if not SB_Cupom.Enabled then
    Exit;
  SB_Cupom.Enabled := False;
  Application.CreateForm(TfMxSNotaCupom, fMxSNotaCupom);
  with fMxSNotaCupom do
  Begin
    Tag:=6;
    Self.CancelarFatura := False;
    if Self.Cliente1.PessoaFisica and
      ((DM.Configuracao1.Empresa <> empLBM) OR (DM.Configuracao1.CodigoCNC <> 3)) then
      rdgNota.Enabled := False
    else if (not Self.Cliente1.PessoaFisica) and (Self.Cliente1.CGFRG <> '') then
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
    CNPJ_CPF := Cliente1.CPFCGC;
    if (DM.Configuracao1.Empresa = empEletro) and
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

procedure TfMxServicoLBM.ObservaoItem1Click(Sender: TObject);
var
  CdCNC, CdIPV, CdPDV, CdPRD: integer;
  sObsItem: string;
begin
  if Item_Pedido_Venda1.IsEmpty or
     (Entidade.Situacao >= 4) then
    Exit
  else
  Begin
    CdCNC := Item_Pedido_Venda1.CodigoCNC;
    CdIPV := Item_Pedido_Venda1.CodigoIPV;
    CdPDV := Item_Pedido_Venda1.CodigoPDV;
    CdPRD := Item_Pedido_Venda1.CodigoPRD;    

    sObsItem := UpperCase(InputBox('Dados do Item', 'Observação:', ''));
    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
      ' IPV_OBSERVACAO="'+UpperCase(sObsItem)+'" '+
      ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND IPV_CODIGO='+IntToStr(CdIPV));
    Entidade.GeraLog(6580, CdCNC, CdPDV,
      'IPV:'+IntToStr(CdIPV)+
      ' PRD:'+IntToStr(CdPRD)+
      ' OBS:'+Item_Pedido_Venda1.Observacao);
    Item_Pedido_Venda1.Close;
    Item_Pedido_Venda1.Open;
    Item_Pedido_Venda1.LocalizarCod(CdIPV, CdCNC);
  end;
end;

procedure TfMxServicoLBM.edtCodigoCNTExit(Sender: TObject);
begin
  if SB_CancPed.Focused then
    Exit;
  if not VerificaInteiroBranco(edtCodigoCNT.Text) then
    edtCodigoCNT.Text := '0';
  If (edtCodigoCNT.Text<>'0') Then
  Begin
    if not VerificaInteiro(edtCodigoCNT.Text) then
    Begin
      edtCodigoCNT.SetFocus;
      Raise Exception.Create('Código de Contato inválido!');
    end;
    with Contato1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTATO '+
        ' WHERE CNC_FOR='+edtClienteCNC.Text+
        ' AND CNT_CODIGO='+edtCodigoCNT.Text;
      Open;
      if IsEmpty then
      Begin
        edtCodigoCNT.Clear;
        edtNomeContato.Clear;
        ShowMessage('Contato não cadastrado');
        edtClienteCNC.Text:=IntToStr(DM.Configuracao1.CodigoCNC);
        try
          edtCodigoCNT.SetFocus;
        except
        end;
        Exit;
      end;

      edtCodigoCNT.text:=IntToStr(CodigoCNT);
      edtNomeContato.text:=Nome;
    end;
  End
  else
    edtNomeContato.Text := 'Não Definido';
end;

procedure TfMxServicoLBM.edtCodigoCNTKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if not VerificaInteiroBranco(edtCodigoCNT.Text) then
      edtCodigoCNT.Text := '0';
    if not SB_SalvaPed.Enabled then
      Exit;

    Application.CreateForm(TFCadCont, FCadCont);
    with FCadCont do
    Begin
      tag:=3;
      edtFORCNC.Text      := self.edtClienteCNC.Text;
      edtCodigoFOR.Text   := self.edtCodigoCLI.Text;
      edtRazaoSocial.Text := self.edtRazaoSocial.Text;
      Showmodal;
    end;
    if VerificaInteiroBranco(edtCodigoCNT.Text) and
       (edtCodigoCNT.Text <> '0') then
      try
        edtDocumento.SetFocus;
      except
      end;
  End
end;

procedure TfMxServicoLBM.cmbTipoDeVendaChange(Sender: TObject);
begin
  if cmbTipoDeVenda.Enabled then
  Begin
    //O Tipo de Venda é gravado Somando o ItemIndex com 10
    if cmbTipoDeVenda.ItemIndex in [2,3] then
    Begin
      edtGarantia.Text := '0';
      edtGarantia.Enabled := False;
      edtCodigoPDVOrigem.Enabled := True;
      edtCodigoPDVOrigem.SetFocus;
    end
    else
    Begin
      edtGarantia.Text := '3';
      edtGarantia.Enabled := True;
      edtCodigoPDVOrigem.Text := '0';
      edtCodigoPDVOrigem.Enabled := False;
    end;
  end;
end;

procedure TfMxServicoLBM.SB_EtiquetaClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Selecione o Serviço!');

  Exit;

  Application.CreateForm(Trpt_EtiquetaServico, rpt_EtiquetaServico);
  with rpt_EtiquetaServico do
  begin
    zrlNomeCliente.Caption := '('+edtCodigoCLI.Text+')'+edtRazaoSocial.Text;
    zrlDocumento.Caption := edtDocumento.Text;
    zrlCodigoPDV.Caption := edtCodigoPDV.Text;
    zrlDataPrevisao.Caption := mskDataPrevisao.Text;
    try
      report.Preview;
    except
      ShowMessage('Falha na Impressão!');
    end;
  end;
end;

procedure TfMxServicoLBM.edtCodigoPDVOrigemKeyPress(Sender: TObject;
  var Key: Char);
var
  sTipoVenda: string;
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      Raise exception.Create('Código do Cliente inválido!');
    end;
    edtCodigoPDVOrigem.Clear;
    Application.CreateForm(TfMxSPedProd, fMxSPedProd);
    CancelarLoc:=True;
    Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
    with fMxSPedLoc do
    Begin
      tag:=12;
      if cmbTipoDeVenda.ItemIndex = 2 then  //Manutenção Contrato
        sTipoVenda := ' AND PDV_TIPO_VENDA=11 '
      else //Garantia Serviço
        sTipoVenda := ' AND PDV_TIPO_VENDA=10 ';
      sFiltrarServico := ' AND PDV_SERVICO=1 '+
                         ' AND PDV_SITUACAO=4 '+
                         ' AND CNC_CLIENTE='+edtClienteCNC.Text+
                         ' AND CLI_CODIGO='+edtCodigoCLI.Text+
                         sTipoVenda+
                         ' AND (PDV_GARANTIA+PDV_DT_ENTREGA)>="'+MesDia(DM.Configuracao1.Data)+'" ';
      Showmodal;
    end;
  End
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

procedure TfMxServicoLBM.edtVinculoExit(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtVinculo.Text) then
    edtVinculo.Text := '0';

  if StrToInt(edtVinculo.Text) < 0 then
    edtPrecoDesc.Text := '0,00'
  else if edtPrecoDesc.Text = '0,00' then
    edtPrecoDesc.Text := edtPrecoSugestao.Text;

  edtQuantidadeChange(sender);
end;

procedure TfMxServicoLBM.DetalhePedidoCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Pedido!');

  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if (Entidade.Situacao = 4) then
    Raise exception.Create('Pedido entregue!');

  Application.CreateForm(TfMxDetalhePedido, fMxDetalhePedido);
  with fMxDetalhePedido do
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
end;

procedure TfMxServicoLBM.otalPedido1Click(Sender: TObject);
Begin
  AtualizaTotal;
  ShowMessage('Total do Pedido: R$ '+format('%.2f',[Entidade.Total]));
end;

procedure TfMxServicoLBM.AtualizaTotal;
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
        vTotal := vTotal + Arredonda(Item_Pedido_Venda2.PrecoDesc*Item_Pedido_Venda2.Quantidade,iCasasDecimaisVenda);
        Item_Pedido_Venda2.Next;
      end;
      vTotal := Arredonda(vTotal);
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

procedure TfMxServicoLBM.memObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfMxServicoLBM.Item_Pedido_Venda2BeforeOpen(DataSet: TDataSet);
begin
  Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
  Item_Pedido_Venda2.ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
end;

procedure TfMxServicoLBM.SB_LocPedClick(Sender: TObject);
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
          ckbMelhorData.Checked := False;
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
    tag:=11;
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

    edtQuantidadeChange(edtPrecoDesc);
  End;

  if VerificaDataBranco(mskDataReferencia.Text) then
    ckbMelhorData.Checked := True
  else
    ckbMelhorData.Checked := False;
  ckbMelhorDataClick(sender);
end;

procedure TfMxServicoLBM.EntradaPedClick(Sender: TObject);
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
      Tag:=8;
      Showmodal;
    end;
    Item_Pedido_Venda1.Close;
    Item_Pedido_Venda1.Open;
    Item_Pedido_Venda1.First;
    CarregarItemVenda;
  end;
end;

procedure TfMxServicoLBM.edtOrcamentoExit(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtOrcamento.Text) then
    edtOrcamento.Text := '0';
  if (edtOrcamento.Text = '1') and (edtOrcamento.Enabled) then
    Raise Exception.Create('Prazo inválido para Orçamento!');
end;

procedure TfMxServicoLBM.dbgProdutoTitleClick(Column: TColumn);
begin
  try
    if Item_Pedido_Venda1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_Pedido_Venda1.SOrdemdoGrid(Item_Pedido_Venda1.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxServicoLBM.dblTipoPagamentoClick(Sender: TObject);
begin
  Forma_de_Pagamento1.Close;
  Forma_de_Pagamento1.Open;
  dblFormaPagamentoClick(sender);
end;

procedure TfMxServicoLBM.Forma_de_Pagamento1BeforeOpen(DataSet: TDataSet);
begin
  Forma_de_Pagamento1.OnFilterRecord:=Forma_de_Pagamento1FilterRecord;
  Forma_de_Pagamento1.Filtered:=True;
end;

procedure TfMxServicoLBM.Forma_de_Pagamento1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  try
    if (Forma_de_Pagamento1.TipoPagExclusivo = 0) or
       (Forma_de_Pagamento1.TipoPagExclusivo = dblTipoPagamento.KeyValue) then
      Accept := True
    else
      Accept := False;
  except
    Accept := False;
  end;
end;

procedure TfMxServicoLBM.Label18DblClick(Sender: TObject);
begin
  if not SB_SalvaPro.Enabled then
    Exit;
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Exit;
  if dblResponsavel.text = '' then
    Exit;
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3730)) <= 0 then  //Consulta de Estoque
    Exit;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
    ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    if DM.Configuracao1.Empresa = empTeste then
      ParamByName('FUN_CODIGO').AsInteger := dblResponsavel.KeyValue
    else
      ParamByName('FUN_CODIGO').AsInteger := 0;
    open;
    ShowMessage('Disponível: '+IntToStr(Trunc(Saldo))+' '+Produto1.Unidade);
  end;
end;

procedure TfMxServicoLBM.ckbMelhorDataClick(Sender: TObject);
begin
  if not ckbMelhorData.Enabled then
  Begin
    mskDataReferencia.Color := AlteraCorComponentes;
    mskDataReferencia.Enabled := False;
    Exit;
  end;

  if ckbMelhorData.Checked then
  begin
    mskDataReferencia.Color := clwhite;
    mskDataReferencia.Enabled := true;
    if ckbMelhorData.Focused then
      mskDataReferencia.SetFocus;
  end
  else
  begin
    mskDataReferencia.Clear;
    mskDataReferencia.Color := AlteraCorComponentes;
    mskDataReferencia.Enabled := false;
  end;
end;

end.
