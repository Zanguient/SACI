unit MxPedidoRapido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Menus, ImgList, ShellAPI, 
  Tabela_de_precos, Item_Tabela_de_Precos, Informacoes, Titulo_receber,
  Item_de_Estoque, Parametro, Item_Pedido_Venda, Cliente, Produto,
  Pedido_de_Venda, Vendedor, AgenteFin, Forma_de_Pagamento, Variants,
  Fatfin, Classificacao_fiscal, Cod_Barr;

type
  TfMxPedidoRapido = class(TForm)
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
    Label22: TLabel;
    ckbEntregue: TCheckBox;
    Label24: TLabel;
    edtDesconto: TEdit;
    Panel3: TPanel;
    Label20: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    memResumo: TMemo;
    edtCodigoPDV: TEdit;
    edtDataHora: TEdit;
    edtPrecoUnitario: TEdit;
    edtMarca: TEdit;
    Label25: TLabel;
    dblCodigoFUN: TDBLookupComboBox;
    edtCodigoTBP: TEdit;
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
    Item_Pedido_Venda1IPV_ENTREGA: TSmallIntField;
    mskDataReferencia: TMaskEdit;
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
    imgCliente: TImage;
    Label12: TLabel;
    Titulo_receber4: TTitulo_receber;
    Titulo_receber1TOTALPEDIDO: TFloatField;
    ckbVendaAVista: TCheckBox;
    Item_Pedido_Venda1Aliquota: TStringField;
    Item_Pedido_Venda1Referencia: TStringField;
    Item_Pedido_Venda1unidade: TStringField;
    Item_Pedido_Venda1Vendedor: TStringField;
    Vendedor2: TVendedor;
    Item_Pedido_Venda1Marca: TStringField;
    Item_Pedido_Venda1Produto: TStringField;
    Item_Pedido_Venda1Entrega: TStringField;
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
    Edit7: TEdit;
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
    ResumoCab: TMenuItem;
    Calculadora2: TMenuItem;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Produto1PRD_INSUMO: TIntegerField;
    Produto1PRD_BASE_REAL: TFloatField;
    Produto1PRD_SERVICO: TIntegerField;
    Produto1PRD_TEMPO_MEDIO: TIntegerField;
    Produto1PRD_NIVEL: TIntegerField;
    Item_Pedido_Venda1Caracteristica: TStringField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    PopupMenu1: TPopupMenu;
    ObservaoItem1: TMenuItem;
    Item_Pedido_Venda1IPV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Venda1IPV_VINCULO: TIntegerField;
    Item_Pedido_Venda1IPV_SEQUENCIA: TIntegerField;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    mskCNPJCPF: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label21: TLabel;
    edtClienteCNC: TEdit;
    ckbAtacado: TCheckBox;
    PopupMenu2: TPopupMenu;
    CupomEletro1: TMenuItem;
    Label3: TLabel;
    edtSugestao: TEdit;
    SB_Alt: TSpeedButton;
    Alterar1: TMenuItem;
    Produto1PRD_FORA_DE_LINHA: TIntegerField;
    Produto1SGP_PRECO_DOLAR: TIntegerField;
    EntradaPed: TMenuItem;
    DetalhePedidoCab: TMenuItem;
    Label9: TLabel;
    edtConvenio: TEdit;
    Produto1PRD_CATALOGO: TIntegerField;
    Produto1PRD_PREVISAO: TIntegerField;
    Produto1PRD_CLASSIFICACAO: TIntegerField;
    Produto1PRD_ESTOQUE_DETALHADO: TIntegerField;
    Item_Pedido_Venda1LocalEstoque: TStringField;
    Item_Pedido_Venda1CodigoGrupo: TIntegerField;
    ckbEntregaDeposito: TCheckBox;
    edtCodigoLOT: TEdit;
    Titulo_receber7: TTitulo_receber;
    FloatField8: TFloatField;
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
    procedure edtDescontoChange(Sender: TObject);
    procedure Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
    procedure edtCodigoTBPExit(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure Titulo_receber2BeforeOpen(DataSet: TDataSet);
    procedure imgClienteDblClick(Sender: TObject);
    procedure Titulo_receber4BeforeOpen(DataSet: TDataSet);
    procedure edtBonificacaoExit(Sender: TObject);
    procedure Parametro2BeforeOpen(DataSet: TDataSet);
    procedure dbgItensDblClick(Sender: TObject);
    procedure CarregarItemVenda;
    procedure imgProdutoDblClick(Sender: TObject);
    procedure edtCodigoCLIEnter(Sender: TObject);
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
    procedure Calculadora2Click(Sender: TObject);
    procedure ObservaoItem1Click(Sender: TObject);
    procedure CupomEletro1Click(Sender: TObject);
    procedure edtPrecoDescontoChange(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_AltClick(Sender: TObject);
    procedure DetalhePedidoCabClick(Sender: TObject);
    procedure dbgItensTitleClick(Column: TColumn);
    procedure dblTipoPagamentoClick(Sender: TObject);
    procedure Forma_de_Pagamento1BeforeOpen(DataSet: TDataSet);
    procedure Forma_de_Pagamento1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    NumeroOficial: integer;
    vCentraliza: Boolean;
    QtdAnt: Double;
    sTabelaPrecoCPD: string;
    procedure AtualizaControles(Cabecalho, Habilitar: Boolean);
    function RecalcularPrecos: Boolean;
  public
    TotalNota:Double;
    Cancelar, cancelarloc, VendaAVista, Alteracao, CancelarFatura:Boolean;
    Entidade:TPedido_de_Venda;
    CodCliente:string;
    CdCLIOK:integer;
    sFiltroAGFMossoro: string;
  end;

var
  fMxPedidoRapido: TfMxPedidoRapido;

implementation
Uses
  UDM, funcoes, MxS_Tpreco, MxSPediDesc, MxSPediProd, MxSPediTab,
  MxSPediCtCus, MxSPediLoc, CdCliente, MxValorEntrada, MxSRecPedido,
  UPedidoVendaItemPDV, UPedidoVendaItemPDVRed2, DigSenha, mxSelProm,
  MxFotoAmpliada, MxResumoPedido, uPedidoVendaDARUMA, MxDescontoPedido,
  uPedidoVendaCodigoPreco, MxFeriados, MxSNotaCupom, MxCalculaTroco,
  MxSPediProdMotCal, Configuracao, MxDetalhePedido, MxFinalizaPedido;
{$R *.DFM}

procedure TfMxPedidoRapido.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  vCentraliza := False;   //N�o pode ser utilizado. N�o est� pronto o Finaliza Pedido

  if DM.Configuracao1.empresa = empEletro then
    sTabelaPrecoCPD := ' T1.CNC_CODIGO=0 '
  else
    sTabelaPrecoCPD := ' T1.CNC_CODIGO=1 ';

  edtDesconto.Height := 22;

  if (DM.Configuracao1.Empresa <> empEletro) or
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(3650)) <= 0) then
    SB_Cupom.PopupMenu := nil;

  Entidade.Open;
  Parametro1.Open;
  Forma_de_Pagamento2.Open;
  Forma_de_pagamento1.Open;
  FatorFinanceira2.Open;  
  AgenteFin1.Open;
  Vendedor1.Close;
  Vendedor1.SQL.Text := 'SELECT FUN_CODIGO,FUN_NOME,SEC_CODIGO,CNC_CODIGO,FUN_APELIDO '+
    ' FROM FUNCIONARIO '+
    ' WHERE FUN_APARECE_VENDAS=1 '+
    ' AND FUN_SITUACAO <> 1 '+
    ' AND (CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
    '  OR  FUN_TODOS_CENTROS=1) '+
    ' ORDER BY FUN_APELIDO ';
  Vendedor1.Open;
  try
    dbgItens.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_PDVRap_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;

  if (DM.Configuracao1.Empresa = empEletro) and
     (DM.Configuracao1.CodigoCNC = 30) then  //Mossor�
  Begin
    sFiltroAGFMossoro := ' AND AGF_ESPECIAL=1 ';
    AgenteFin1.Close;
    AgenteFin1.SQL.Text := 'SELECT * FROM AGENTE_FINANCEIRO '+
      ' WHERE (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL) '+
      sFiltroAGFMossoro+
      ' ORDER BY AGF_DESCRICAO ';
  end;
end;

procedure TfMxPedidoRapido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_PDVRap_');
  except
  end;
  AgenteFin1.Close;
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

procedure TfMxPedidoRapido.edtCodigoPRDExit(Sender: TObject);
var
  Foto:string;
  CdCNC, CdPRD, CdIPV: integer;
  Trans:Boolean;
begin
  if SB_Canc.Focused then
    Exit;

  with Produto1 do
  Begin
    try
      if (not Active) or
         (CodigoPRD <> StrToInt(edtCodigoPRD.Text)) then
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
      with DM.Codigo_Barras1 do
      Begin
        if CodigoCDB_Barras <> edtCodigoPRD.Text then
        Begin
          Close;
          paramByName('CDB_CODIGO_BARRAS').asString := edtCodigoPRD.Text;
          Open;
        end;
        if not IsEmpty then
        Begin
          edtCodigoPRD.Text := IntToStr(CodigoCDB_Entrada);
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
          Produto1.Open;
        end;
      end;
    End;
    if IsEmpty and
       (Length(edtCodigoPRD.Text) > 5) then //Refer�ncias maiores que 3 caracteres
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT PRD_CODIGO '+
          ' FROM PRODUTO '+
          ' WHERE PRD_REFERENCIA="'+edtCodigoPRD.Text+'"';
        Open;
        if not IsEmpty then
          edtCodigoPRD.Text := FieldByName('PRD_CODIGO').asString
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
    End
    else if Situacao = 1 then
    Begin
      Showmessage('Produto desativado!');
      edtCodigoPRD.SetFocus;
      Exit;
    End
    else if PrecoVenda = 0 then
    Begin
      Showmessage('Produto sem pre�o de venda!');
      edtCodigoPRD.SetFocus;
      Exit;
    End;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 * '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+edtCodigoPDV.text+
      ' AND PRD_CODIGO='+edtCodigoPRD.Text;
    Open;
  end;
  If not DM.QR_Consultas.IsEmpty Then //Produto j� vendido
  Begin
    if DM.Configuracao1.ItemAutomatico <> 1 then //N�o � ItemAutom�tico
    Begin
      CdIPV  := DM.QR_Consultas.FieldByName('IPV_CODIGO').asInteger;
      QtdAnt := DM.QR_Consultas.FieldByName('IPV_QUANTIDADE').asFloat;
      Item_Pedido_Venda1.CancelaEdicao;
      Item_Pedido_Venda1.Close;
      Item_Pedido_Venda1.Open;
      Item_Pedido_Venda1.LocalizarCod(CdIPV,Entidade.CodigoCNC);
      CarregarItemVenda;
      Item_Pedido_Venda1.PreparaAlteracao;
      ShowMessage('Produto j� inserido, corrija a quantidade!');
    end
    else //Venda com c�digo de Barras ItemAutom�tico
    Begin
      CdCNC := DM.Configuracao1.CodigoCNC;
      CdPRD := StrToInt(edtCodigoPRD.Text);
      with Item_de_Estoque1 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').AsInteger := CdCNC;
        ParamByName('PRD_CODIGO').AsInteger := CdPRD;
        open;
        If isempty then
        begin
          if not Inserir(CdCNC, CdPRD,0(*CdFUN*),
            0,0,0,0,0,DM.Configuracao1.DataHora,0,0,0,0,0,0) then
          Begin
            ShowMessage('Falha ao inserir IES! CNC:'+IntToStr(CdCNC)+' PRD:'+IntToStr(CdPRD));
            Raise exception.Create('');
          end;
          Close;
          ParamByName('CNC_CODIGO').AsInteger := CdCNC;
          ParamByName('PRD_CODIGO').AsInteger := CdPRD;
          open;
        end;
      end;
      SB_Canc.SetFocus;
      SB_CancClick(sender);
      Trans:=false;
      with DM.Database2 do
      begin
        try
          StartTransaction;
          Trans:=True;

          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
            ' IPV_QUANTIDADE=IPV_QUANTIDADE+1 '+
            ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
            ' AND PRD_CODIGO='+IntToStr(CdPRD));

          //Fazer reserva no estoque (Versao que evita concorrencia)
          if edtDiasOrcamento.Text = '0' then
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SRESERVADO=IES_SRESERVADO+1 '+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND CNC_CODIGO='+IntToStr(CdCNC));

          ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
            ' PDV_SITUACAO=0 '+
            ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
            ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND PDV_CODIGO='+edtCodigoPDV.Text);

          Commit;
          Trans := False;

          Item_Pedido_Venda1.Close;
          Item_Pedido_Venda1.Open;
          SB_NovoClick(sender);
        except
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados n�o foram salvos! Anote os c�digos e ligue para o suporte');
          end;
        end;
      End;
      Exit;
    end;
  End
  else
  Begin
    if DM.Configuracao1.Empresa = empEletro then
      edtProduto.text := Trim(Produto1.Descricao+' '+Produto1.Caracteristica)
    else
      edtProduto.text := Produto1.Descricao;

    edtUnidade.text       := Produto1.Unidade;
    edtReferencia.text    := Produto1.Referencia;
    edtMarca.text         := Produto1.Marca;
    edtPrecoUnitario.text := Format('%.2f',[Produto1.Precovenda]);
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
  end;

  if Forma_de_Pagamento1.CodigoTBP > 0 then
    edtCodigoTBP.Text := IntToStr(Forma_de_Pagamento1.CodigoTBP);

  //C�lculo de Pre�os
  edtCodigoTBPExit(sender);

  if edtQuantidade.Enabled then
  Begin
    edtCodigoPRD.Enabled := False;
    edtQuantidade.SetFocus;
    edtQuantidade.SelectAll;
  end;
end;

procedure TfMxPedidoRapido.Item_Pedido_Venda1AfterScroll(DataSet: TDataSet);
begin
  try
    CarregarItemVenda;
  except
  end;
end;

procedure TfMxPedidoRapido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  aux:TDataSetNotifyEvent;
begin
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
  If SB_SalvaPed.Enabled or SB_Salva.Enabled then
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
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_CODIGO='+edtCodigoPDV.Text);
          Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.Text), 'Vazio');
        except
        end;
      end
      // Situacao; 3-Salvo; 4-Finalizado; 6-Exclu�do
      Else If (DM.Configuracao1.CodigoCNC=DM.Usuario1.CentroDeCusto) and //Se for de outro centro n�o pode ser salvo
              ((Entidade.Situacao<>3) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6)) then
      Begin
        Showmessage('Salve ou cancele o pedido antes de continuar');
        canclose:=false;
        exit;
      End;
      if not Entidade.FecharPedido then
      Begin
        Showmessage('N�o foi poss�vel liberar o pedido atual.');
        Canclose:=False;
        exit;
      end;
    end;
  end;
end;

procedure TfMxPedidoRapido.dblFormaPagamentoClick(Sender: TObject);
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

  if (DM.Configuracao1.Empresa >= 4) or
     (DM.Configuracao1.Empresa = empEletro) then
  Begin
    if (dblTipoPagamento.KeyValue = 5) then //Dinheiro/Promiss�ria
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                  ' WHERE (AGF_TIPOPAG_EXCLUSIVO=0 OR AGF_TIPOPAG_EXCLUSIVO='+IntToStr(dblTipoPagamento.KeyValue)+') '+
                  ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)'+
                  sFiltroAGFMossoro;
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
    else If dblTipoPagamento.KeyValue = 13 then //Cart�o
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                  ' WHERE AGF_TIPOPAG_EXCLUSIVO=13 '+
                  ' AND AGF_CODIGO<>1 '+
                  ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL) '+
                  sFiltroAGFMossoro;
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
                    ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)'+
                    sFiltroAGFMossoro;
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
                      ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)'+
                      sFiltroAGFMossoro;
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
                      ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)'+
                      sFiltroAGFMossoro;
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
                  ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)'+
                  sFiltroAGFMossoro;
        Open;
      End;
    End;
  end
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
                    ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)'+
                    sFiltroAGFMossoro;
          Open;
        End
      Else
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
                    ' WHERE (AGF_TIPOPAG_EXCLUSIVO=0 OR AGF_TIPOPAG_EXCLUSIVO='+IntToStr(dblTipoPagamento.KeyValue)+') '+
                    ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)'+
                    sFiltroAGFMossoro;
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
                    ' AND (AGF_SITUACAO=0 OR AGF_SITUACAO IS NULL)'+
                    sFiltroAGFMossoro;
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

procedure TfMxPedidoRapido.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if not (DM.Configuracao1.Empresa IN [empEletro,empPetromax]) then
    ckbEntregue.Visible := False;
end;

procedure TfMxPedidoRapido.ckbMelhorDataClick(Sender: TObject);
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


procedure TfMxPedidoRapido.AgenteFin1FilterRecord(DataSet: TDataSet;
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

procedure TfMxPedidoRapido.AgenteFin1BeforeOpen(DataSet: TDataSet);
begin
  AgenteFin1.OnFilterRecord:=AgenteFin1FilterRecord;
  AgenteFin1.Filtered:=True;
end;


procedure TfMxPedidoRapido.edtCodigoCLIExit(Sender: TObject);
var
  Foto: string;
begin
  if (SB_CancPed.Focused) then
    Exit;

  If Trim(edtCodigoCLI.Text)<>'' then
  Begin
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      try
        edtCodigoCLI.SetFocus;
      except
      end;
      Raise Exception.Create('C�digo de Cliente inv�lido!');
    end;

    if not VerificaInteiroBranco(edtClienteCNC.Text) then
      edtClienteCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);

    edtRazaoSocial.Clear;
    edtConvenio.Clear;
    mskCNPJCPF.Clear;

    with Cliente1 do
    Begin
      Close;
      ParamByName('CLI_CODIGO').AsInteger := StrToInt(edtCodigoCLI.Text);
      ParamByName('CNC_CODIGO').AsInteger := StrToInt(edtClienteCNC.Text);
      Open;
      If IsEmpty then
      Begin
        try
          edtCodigoCLI.SetFocus;
        except
        end;
        edtCodigoCLI.Text := '0';
        ShowMessage('Cliente n�o cadastrado!');
      End;
    end;

    with Informacoes1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Cliente1.CodigoCNC;
      ParamByName('CLI_CODIGO').asInteger := Cliente1.CodigoCLI;
      Open;
    end;

    edtRazaoSocial.text:= Cliente1.RazaoSocial;
    edtConvenio.Text   := IntToStr(Cliente1.Convenio);
    ckbAtacado.Checked := Cliente1.VendaAtacado;
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
        imgCliente.Picture.LoadFromFile(Foto)
      else
        imgCliente.Picture:=nil;
    Except
      imgCliente.Picture:=nil;
    end;
  End;

  if (CodCliente <> '') then
  Begin
    if (CodCliente <> edtCodigoCLI.Text) and (not ckbAtacado.Checked) and (not Item_Pedido_Venda1.IsEmpty) then
    Begin
      edtCodigoCLI.Text := CodCliente;
      edtCodigoCLIExit(sender);
      Raise Exception.Create('Essa Venda foi feita para Atacado!');
    end;
  end;
end;

procedure TfMxPedidoRapido.edtDescontoChange(Sender: TObject);
Var
  Descont:Double;
begin
  if edtPrecoDesconto.Focused then
    Exit;

  If not VerificaFloatBranco(edtDesconto.Text) then
  Begin
    Descont := 0;
    edtDesconto.Text := '0';
    edtPrecoDesconto.text := edtSugestao.Text;
  end
  else
    Descont := StrToFloat(edtDesconto.text);

  if (Descont >= 100) or
     (Descont  = 0) then
    edtPrecoDesconto.Text := edtSugestao.Text
  Else If VerificaFloatBranco(edtSugestao.Text) then
    edtPrecoDesconto.Text := Format('%.2f',[StrToFloat(edtSugestao.Text)-
      StrToFloat(edtSugestao.Text)*Descont/100])
  else
    edtPrecoDesconto.Text := '0,00';
end;

procedure TfMxPedidoRapido.Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
var
  PrecoUnit:string;
begin
  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> Item_Pedido_Venda1.CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda1.CodigoPRD;
      Open;
    end;
    Item_Pedido_Venda1.FieldByName('Produto').asString        := Descricao;
    Item_Pedido_Venda1.FieldByName('Caracteristica').asString := Caracteristica;
    Item_Pedido_Venda1.FieldByName('Unidade').asString        := Unidade;
    Item_Pedido_Venda1.FieldByName('Referencia').asString     := Referencia;
    Item_Pedido_Venda1.FieldByName('Marca').asString          := Marca;
    Item_Pedido_Venda1.FieldByName('LocalEstoque').asString   := Local;
    try
      Item_Pedido_Venda1.FieldByName('Aliquota').asString     := format('%.2f',[FieldByName('Aliquota').asFloat]);
    except
      Item_Pedido_Venda1.FieldByName('Aliquota').asString     := '0,00';
    end;
  end;
  with Vendedor2 do
  Begin
    if (not Active) or
       (CodigoFUN <> Item_Pedido_Venda1.CodigoFUN) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Item_Pedido_Venda1.CodigoFUN;
      Open;
    end;
    Item_Pedido_Venda1.FieldByName('Vendedor').asString := FieldByName('FUN_APELIDO').asString;
  end;

  if Item_Pedido_Venda1.Entrega then
    Item_Pedido_Venda1.FieldByName('Entrega').asString:='Sim'
  else
    Item_Pedido_Venda1.FieldByName('Entrega').asString:='N�o';
  with Item_Pedido_Venda1 do
  Begin
    PrecoUnit := Format('%.2f',[PrecoDesc]);

    FieldByName('TotalItem').asString := Format('%.2f',[Arredonda(StrToFloat(PrecoUnit)*Quantidade)-Arredonda(StrToFloat(PrecoUnit)*Bonificacao)])
  end;
end;

procedure TfMxPedidoRapido.edtCodigoTBPExit(Sender: TObject);
var
  vPrecoSug: Double;
  iQtdParcelas: integer;
begin
  if not SB_Salva.Enabled then
    Exit;
  if SB_Canc.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoTBP.Text) then
    edtCodigoTBP.Text := '0';
  if not VerificaFloatBranco(edtDesconto.Text) then
    edtDesconto.Text := '0';

  If Forma_de_Pagamento1.Prazo[1]='0' then
    iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
  else
    iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);

  with Produto1 do
  Begin
    if CodigoPRD <> StrToInt(edtCodigoPRD.Text) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
      Open;
      if IsEmpty then
        Raise exception.Create('Produto n�o encontrado! '+edtCodigoPRD.Text);
    end;

    vPrecoSug := PrecoVenda;

    //Pre�o em Dolar
    if FieldByName('SGP_PRECO_DOLAR').asInteger = 1 then
    Begin
      with DM.Indexador_Economico1 do
      Begin
        Close;
        ParamByName('IDE_CODIGO').asInteger := 1; //Dolar
        Open;
        if isEmpty or (Taxa = 0) then
        Begin
          Showmessage('N�o foi definido o Pre�o do Dolar!');
          edtCodigoTBP.SetFocus;
          Exit;
        End;
        vPrecoSug  := Arredonda(Taxa*PrecoVenda);
      end;
    end;
  end;

  if (DM.Configuracao1.Empresa = empHope) and
     (Produto1.ForaDeLinha) then
    vPrecoSug := Arredonda(vPrecoSug*0.5) //Desconto de 50% Fora de Linha
  else
  Begin
    if (StrToInt(edtCodigoTBP.Text) <> 0) then
    Begin
      DM.qr_consultas2.Close;
      DM.qr_consultas2.SQL.Text:='SELECT * '+
        ' FROM ITEM_DE_TABELA_DE_PRECO T1,TABELA_DE_PRECO T2 '+
        ' WHERE T1.TBP_CODIGO='+edtCodigoTBP.Text+
        ' AND T1.PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND T2.TBP_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' OR '+sTabelaPrecoCPD+') '+
        ' AND T2.TBP_CODIGO=T1.TBP_CODIGO '+
        ' AND T2.CNC_CODIGO=T1.CNC_CODIGO ';
      DM.qr_consultas2.Open;
      if DM.qr_consultas2.IsEmpty or
         ((not AgenteFin1.RecebimentoAVista) and
          (DM.qr_consultas2.FieldByName('TBP_PRAZO_MEDIO').asInteger < iQtdParcelas)) then //Qtd m�xima de parcelas
      Begin
        edtCodigoTBP.Text := '0';
        ShowMessage('Tabela inv�lida ou vencida!');
      end;
      if (DM.qr_consultas2.FieldByName('TBP_AGF_EXCLUSIVO').asInteger > 0) and
         (dblCodigoAGF.Text <> '') then
      Begin
        if (DM.qr_consultas2.FieldByName('TBP_AGF_EXCLUSIVO').asInteger <> dblCodigoAGF.KeyValue) then
        Begin
          edtCodigoTBP.Text := '0';
          ShowMessage('Tabela exclusiva para outro agente financeiro!');
        end;
      end;
      if edtCodigoTBP.Text <> '0' then
        vPrecoSug := DM.qr_consultas2.FieldByName('ITP_PRECO').asFloat;
    end;

    if (Forma_de_Pagamento1.Desconto <> 0) and
       ((AgenteFin1.LiberarDescontoFPG) or
        ((DM.Configuracao1.Empresa = empEletro) and
         (Forma_de_Pagamento1.Prazo = '0'))) then
      vPrecoSug := Arredonda(vPrecoSug-vPrecoSug*Forma_de_Pagamento1.Desconto/100);

    if (Cliente1.Desconto > 0) and
       ((Cliente1.VendaAtacado) or
        (Forma_de_Pagamento1.Prazo = '0')) then
      vPrecoSug := Arredonda(vPrecoSug-vPrecoSug*Cliente1.Desconto/100);
  end;

  edtSugestao.Text := format('%.2f',[vPrecoSug]);
  if StrToFloat(edtDesconto.Text) <> 0 then
    edtPrecoDesconto.Text := Format('%.2f',[StrToFloat(edtSugestao.Text)-
      (StrToFloat(edtSugestao.Text)*StrToFloat(edtDesconto.Text)/100)])
  else
    edtPrecoDesconto.Text := edtSugestao.Text;
end;

procedure TfMxPedidoRapido.edtDescontoExit(Sender: TObject);
begin
  if not VerificaFloatBranco(edtDesconto.Text) then
    edtDesconto.Text := '0';

  if StrToFloat(edtDesconto.Text) = 0 then
    edtPrecoDesconto.Text := edtSugestao.Text;
end;

procedure TfMxPedidoRapido.Titulo_receber2BeforeOpen(DataSet: TDataSet);
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

procedure TfMxPedidoRapido.imgClienteDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgCliente.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Nome Fantasia/Apelido: '+Cliente1.NomeFantasia);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Endere�o: '+Cliente1.Endereco+' - '+
    Cliente1.Bairro+' - '+Cliente1.Cidade+'/'+Cliente1.Uf);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observa��o: '+Cliente1.OBS);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxPedidoRapido.Titulo_receber4BeforeOpen(DataSet: TDataSet);
begin
  Titulo_receber4.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Titulo_receber4.ParamByName('PDV_CODIGO').asInteger:=StrToInt(edtCodigoPDV.Text);
end;

procedure TfMxPedidoRapido.edtBonificacaoExit(Sender: TObject);
begin
  if not VerificaFloatBranco(edtBonificacao.Text) then
    edtBonificacao.Text:='0';
end;

procedure TfMxPedidoRapido.Parametro2BeforeOpen(DataSet: TDataSet);
begin
  if Cliente1.Logradouro > 0 then
    Parametro2.ParamByName('PAR_CODIGO').asInteger := Cliente1.Logradouro;
end;

procedure TfMxPedidoRapido.dbgItensDblClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
  Foto:string;
  PrecoUnit:String;
begin
  if Item_Pedido_Venda1.IsEmpty then
    Exit;
  if (SB_SalvarPedido.Enabled) then
  Begin
    SB_SalvarPedido.SetFocus;
    SB_SalvarPedidoClick(sender);
  end;
  Application.CreateForm(TfMxResumoPedido, fMxResumoPedido);
  with fMxResumoPedido do
  Begin
    tag := 0;
    edtCodigoPDV.Text        := self.edtCodigoPDV.Text;
    edtCodigoCNC.Text        := IntToStr(self.Entidade.CodigoCNC);
    edtDataHota.Text         := self.edtDataHora.Text;
    edtTipoPagamento.Text    := self.dblTipoPagamento.Text;
    edtFormaPagamento.Text   := self.dblFormaPagamento.Text;
    edtAgenteFinanceiro.Text := self.dblCodigoAGF.Text;
    edtCodigoCLI.Text        := self.edtCodigoCLI.Text;
    edtRazaoSocial.Text      := self.edtRazaoSocial.Text;
    libItensPedido.Clear;
  end;
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
        PreencheEspacoEsq(8,format('%.2f',[StrToFloat(PrecoUnit)*Quantidade]))+' '+
        PreencheEspacoEsq(5,format('%.2f',[FieldByName('Aliquota').asFloat])));
      Next;
    end;
    fMxResumoPedido.memResumo.Text:=memResumo.Text;
    First;
    AfterScroll:=Aux;
    CarregaDados;
    if DM.Configuracao1.Empresa = 1 then
      edtProduto.Text := Trim(Item_Pedido_Venda1.FieldByName('Produto').asString+' '+
                              Item_Pedido_Venda1.FieldByName('Caracteristica').asString)
    else
      edtProduto.Text := Item_Pedido_Venda1.FieldByName('Produto').asString;
    edtUnidade.Text:=Item_Pedido_Venda1.FieldByName('Unidade').asString;
    edtReferencia.Text:=Item_Pedido_Venda1.FieldByName('Referencia').asString;
    edtMarca.Text:=Item_Pedido_Venda1.FieldByName('Marca').asString;
    try
      foto:=DM.Configuracao1.PastaImagens+'\Produto\00'+
           '-'+IntToStr(Item_Pedido_Venda1.CodigoPRD)+'.JPG';
      imgProduto.Picture.LoadFromFile(foto);
    Except
      try
        with Produto1 do
        Begin
          if CodigoPRD <> Item_Pedido_Venda1.CodigoPRD then
          Begin
            Close;
            ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda1.CodigoPRD;
            Open;
          end;
        end;
        foto:=DM.Configuracao1.PastaImagens+'\Grupo\00'+
           '-'+IntToStr(Produto1.CodigoGRP)+'.JPG';
        if FileExists(Foto) then
          imgProduto.Picture.LoadFromFile(foto)
        else
          imgProduto.Picture:=nil;
      except
        imgProduto.Picture:=nil;
      end;
    end;
  end;
  fMxResumoPedido.ShowModal;
end;

procedure TfMxPedidoRapido.CarregarItemVenda;
var
  Foto:string;
Begin
  with Item_Pedido_Venda1 do
  Begin
    If not IsEmpty Then
    Begin
      CarregaDados;
      if DM.Configuracao1.Empresa = empEletro then
        edtProduto.text  := Trim(FieldByName('Produto').asString+' '+FieldByName('Caracteristica').asString)
      else if DM.Configuracao1.Empresa = empPetromax then
        edtProduto.text  := FieldByName('Produto').asString+' '+FieldByName('LocalEstoque').asString
      else
        edtProduto.text  := FieldByName('Produto').asString;
      edtUnidade.text    := FieldByName('Unidade').asString;
      edtReferencia.text := FieldByName('Referencia').asString;
      edtMarca.text      := FieldByName('Marca').asString;
      try
        foto:=DM.Configuracao1.PastaImagens+'\Produto\00'+
           '-'+IntToStr(CodigoPRD)+'.JPG';
        imgProduto.Picture.LoadFromFile(foto);
      Except
        try
          foto:=DM.Configuracao1.PastaImagens+'\Grupo\00'+
             '-'+IntToStr(FieldByName('CodigoGrupo').asInteger)+'.JPG';
          imgProduto.Picture.LoadFromFile(foto);
        except
          imgProduto.Picture:=nil;
        end;
      end;
    end;
  End;
end;


procedure TfMxPedidoRapido.imgProdutoDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgProduto.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Caracter�sticas: '+Produto1.Caracteristica);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Peso L�quido: '+format('%.2f',[Produto1.PesoLiquido]));
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observa��o: '+Produto1.Obs);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxPedidoRapido.edtCodigoCLIEnter(Sender: TObject);
begin
  if ckbAtacado.Checked then
    CodCliente := edtCodigoCLI.Text
  else
    CodCliente := '';
end;

procedure TfMxPedidoRapido.edtDiasOrcamentoExit(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtDiasOrcamento.Text) then
    edtDiasOrcamento.Text := '0';
end;

procedure TfMxPedidoRapido.Produto1CalcFields(DataSet: TDataSet);
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

procedure TfMxPedidoRapido.FormKeyPress(Sender: TObject; var Key: Char);
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
        edtQuantidade.SetFocus;
        if DM.Configuracao1.Empresa <> empEletro then
          Exit;
      end;
      if not VerificaFloatBranco(edtQuantidade.Text) then
        edtQuantidade.Text:='1';
      if (dblCodigoFUN.KeyValue <> NULL) and
         (dblCodigoFUN.KeyValue > 0) then
      Begin
        SB_Salva.SetFocus;
        SB_SalvaClick(sender);
      end
      else
        dblCodigoFUN.SetFocus;
    end;
  end
  else if Key=chr(27) then
  Begin
    Key := #0;
    if SB_CancPed.Enabled then
      SB_CancPedClick(sender)
    else if SB_Canc.Enabled then
      SB_CancClick(sender)
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
      fCadCli.tag:=2;
      fCadCli.CentroCusto2.open;
      fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
      fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
      With fCadCli.Cliente1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM CLIENTE '+
          ' WHERE CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
          ' AND CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC);
        Open;
      End;
      fCadCli.Showmodal;
      edtCodigoCLIExit(sender);
    End;
    if edtCodigoPRD.Focused then
    Begin
      edtCodigoPRD.Clear;
      key:=chr(0);
      if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
      Begin
        Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
        with fMxSPedProdMotcal do
        Begin
          Tag:=13;
          ShowModal;
        end;
      end
      else
      Begin
        Application.CreateForm(TfMxSPedProd, fMxSPedProd);
        with fMxSPedProd do
        Begin
          Tag:=13;
          ShowModal;
        end;
      end;
      try
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
        Tag:=4;
        edtProduto.Text    :=  self.edtProduto.Text;
        edtUnidade.Text    :=  self.edtUnidade.Text;
        edtMarca.Text      :=  self.edtMarca.Text;
        edtReferencia.Text :=  self.edtReferencia.Text;
        edtPreco.Text      :=  self.edtSugestao.Text;
        edtPrecoComDesconto.Text   :=  self.edtSugestao.Text;
        if VerificaFloatBranco(self.edtDesconto.Text) then
          edtDescontoPercentual.Text := self.edtDesconto.Text;
        ShowModal;
      end;
    end
    else if (edtCodigoTBP.Focused) and (edtCodigoPRD.Text <> '') then
    Begin
      Begin
        key:=chr(0);
        edtCodigoTBP.Text:='0';
        Application.CreateForm(TfMxSPedTab, fMxSPedTab);
        with fMxSPedTab do
        begin
          Item_Tabela_de_Precos1.Close;
          Item_Tabela_de_Precos1.SQL.Text:='SELECT * '+
               ' FROM ITEM_DE_TABELA_DE_PRECO T1,TABELA_DE_PRECO T2 '+
               ' WHERE T1.TBP_CODIGO=T2.TBP_CODIGO '+
               ' AND T1.PRD_CODIGO='+edtCodigoPRD.Text+
               ' AND T2.TBP_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
               ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
               '      OR '+sTabelaPrecoCPD+') '+
               ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
               ' ORDER BY T2.TBP_DESCRICAO ';
          Tag:=1;
          ShowModal;
        end;
        dblCodigoFUN.SetFocus;
      End;
    end;
  End
  else if edtCodigoPRD.Focused then
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
  end
  else if memObservacao.Focused then
    Key := UpCase(Key);  
end;
procedure TfMxPedidoRapido.AtualizaControles(Cabecalho, Habilitar: Boolean);
begin
  IncluirCab1.Enabled          := not Habilitar;
  AlterarCab1.Enabled          := not Habilitar;
  Localizar1.Enabled           := not Habilitar;
  Salvarcabecalho1.Enabled     := (Cabecalho and Habilitar);
  CancelarCabecalho1.Enabled   := (Cabecalho and Habilitar);
  DescontonoPedido1.Enabled    := not Habilitar;
  SalvarPedido1.Enabled        := not Habilitar;
  FinalizarPedido1.Enabled     := not Habilitar;
  CancelarPedido1.Enabled      := not Habilitar;
  InfCrdito1.Enabled           := not Habilitar;
  DetalhePedidoCab.Enabled     := not Habilitar;
  Incluir1.Enabled             := not Habilitar;
  Alterar1.Enabled             := not Habilitar;
  Excluir1.Enabled             := not Habilitar;
  ImprimirPedido1.Enabled      := not Habilitar;
  ImprimirPromissoria1.Enabled := not Habilitar;
  ImprimirCarnnet1.Enabled     := not Habilitar;
  ImprimirCupom1.Enabled       := not Habilitar;
  ResumoCab.Enabled            := not Habilitar;
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

procedure TfMxPedidoRapido.SB_NovoPedClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Voc� n�o pode inserir vendas neste centro de custo.');
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
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      Open;
      if IsEmpty then
      Begin
        try
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_CODIGO='+edtCodigoPDV.Text);
          Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.Text), 'Vazio');
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
    raise Exception.Create('N�o foi poss�vel liberar o pedido atual.');
  Item_Pedido_Venda1.Active:=False;
  with Pedido_de_Venda1 do
  Begin
    if not Inserir(DM.Configuracao1.CodigoCNC,0,0,0,0,0,
       DM.Usuario1.CodigoUSU,0,0,''(*OBS*),''(*Documento*),
       DM.Configuracao1.Orcamento,DM.Configuracao1.CodigoCNC,
       DM.Configuracao1.DataHora,0(*DataPrevis�o*)) then
      Raise Exception.Create('Erro ao gerar Pedido. Entre em contato com o suporte t�cnico!');
    Close;
    SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(SCodigo);
    Open;
    CarregaDados;
    AbrirPedido;
  end;
  NumeroOficial := 0;
  Entidade.AtualizaControles(True);
  ckbMelhorData.Checked := False;
  ckbMelhorDataClick(sender);
  dblTipoPagamento.KeyValue:=5;
  dblFormaPagamento.KeyValue:=1;
  dblTipoPagamentoClick(sender);
  if DM.Configuracao1.Empresa = empEletro then
    dblCodigoAGF.KeyValue := 54;
//  dblFormaPagamentoClick(sender);
  edtCodigoCLI.Clear;
  edtRazaoSocial.Clear;
  edtConvenio.Clear;
  mskCNPJCPF.Clear;
  if DM.Configuracao1.CodigoCliAVista > 0 then
  Begin
    edtClienteCNC.Text:=IntToStr(DM.Configuracao1.CodigoCNC);
    edtCodigoCLI.Text:=IntToStr(DM.Configuracao1.CodigoCliAVista);
    edtCodigoCLIExit(sender);
  end;
  ckbEntregue.Checked:=False;
  ckbAtacado.Checked:=False;
  imgProduto.Picture:=nil;
  edtCodigoTBP.Text  :='0';
  edtCodigoPRD.Clear;
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;
  edtQuantidade.Clear;
  edtDesconto.Text :='0';
  edtPrecoUnitario.Clear;
  edtSugestao.Clear;
  edtBonificacao.Clear;
  memResumo.Enabled:=False;
  memResumo.Clear;
  memObservacao.Clear;
  Alteracao:=False;
  AtualizaControles(True, True);
  edtDiasOrcamento.Enabled := True;
  edtDiasOrcamento.Color := clWindow;
  edtCodigoCLI.SetFocus;
end;

procedure TfMxPedidoRapido.SB_LocPedClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
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
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_CODIGO='+edtCodigoPDV.Text);
          Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.Text), 'Vazio');
        except
        end;
        edtCodigoPDV.Clear;
        edtDataHora.Clear;
        edtCodigoCLI.Clear;
        edtRazaoSocial.Clear;
        edtConvenio.Clear;
        edtDiasOrcamento.Clear;
        dblCodigoAGF.KeyValue := 0;
        dblFormaPagamento.KeyValue := 0;
        dblTipoPagamento.KeyValue := 0;
        imgCliente.Picture:=nil;
        mskDataReferencia.Clear;
        mskCNPJCPF.Clear;
      end;
    end;
  end;

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
    If (DM.Configuracao1.CodigoCNC=DM.Usuario1.CentroDeCusto) and //Se for de outro centro n�o pode ser salvo
       ((Entidade.Situacao<>3) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6)) then
      Raise Exception.Create('Salve ou cancele o pedido antes de continuar')
    Else If (DM.Configuracao1.CodigoCNC=DM.Usuario1.CentroDeCusto) and //Se for de outro centro n�o pode ser salvo
            ((Entidade.Situacao<>1) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6)) then
        if MessageDlg('Deseja sair sem finalizar o Pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
  End;
  cancelarloc:=True;
  Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
  fMxSPedLoc.tag:=2;
  fMxSPedLoc.sFiltrarServico := ' AND (PDV_SERVICO=0 OR PDV_SERVICO IS NULL) ';
  fMxSPedLoc.Showmodal;

  If not cancelarloc Then
  Begin
    if not Entidade.FecharPedido then
      raise Exception.Create('N�o foi poss�vel liberar o pedido atual.')
    else
      AtualizaControles(False,False);
    Aux:=Item_Pedido_Venda1.AfterScroll;
    Item_Pedido_Venda1.AfterScroll:=nil;
    try
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
    finally
      Item_Pedido_Venda1.AfterScroll:=Aux;
    end;

    // Carregar informa��es do Produto
    CarregarItemVenda;

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
  if VerificaDataBranco(mskDataReferencia.Text) then
    ckbMelhorData.Checked := True
  else
    ckbMelhorData.Checked := False;
  ckbMelhorDataClick(sender);

  NumeroOficial := 0;  
end;

procedure TfMxPedidoRapido.SB_AltPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Fa�a o Pedido primeiro!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Voc� n�o pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido n�o pode ser alterado!');
  Entidade.PreparaAlteracao;
  AtualizaControles(True, True);
  if (Forma_de_Pagamento1.Prazo<>'') and
     (Forma_de_Pagamento1.Prazo<>'0') then
  Begin
    ckbMelhorData.Enabled := True;
    ckbMelhorDataClick(sender);
  end;
  memResumo.Enabled:=False;
  Alteracao:=True;
  edtCodigoCLI.SetFocus;
end;

procedure TfMxPedidoRapido.SB_SalvaPedClick(Sender: TObject);
Var
  Aux:TDataSetNotifyEvent;
  CdCNC, CdPDV, iEntregaDeposito: integer;
  sMelhorData :string;
begin
  if (not VerificaInteiroBranco(edtCodigoCLI.Text)) or
     (edtCodigoCLI.Text = '0') then
  Begin
    edtCodigoCLI.SetFocus;
    Raise exception.Create('C�digo do Cliente inv�lido!');
  end;
  If (dblTipoPagamento.Text = '') then
    Raise Exception.Create('Tipo de pagamento faltando!');
  If (dblFormaPagamento.Text = '')then
    Raise Exception.Create('Forma de pagamento faltando!');
  if (dblCodigoAGF.Text = '') then
    Raise exception.Create('Agente Financeiro inv�lido!');
  if ((Forma_de_Pagamento1.Prazo<>'0') or  //Forma de Pagamento
      (dblTipoPagamento.KeyValue<>5)) and  //Tipo de Pagamento Dinheiro
     (StrToInt(edtCodigoCLI.Text) = DM.Configuracao1.CodigoCliAVista) then
    Raise Exception.Create('N�o � poss�vel atribuir uma venda � prazo ao Cliente Balc�o!');

  if ckbEntregaDeposito.Checked then
  Begin
    if DM.Configuracao1.CodigoCNC = 11 then
      Raise exception.Create('No dep�sito esta op��o n�o pode ser marcada!');
    iEntregaDeposito := 1;
  end
  else
    iEntregaDeposito := 0;

  if not VerificaData(mskDataReferencia.Text) then
    Raise Exception.Create('Data de Refer�ncia inv�lida!')
  else if VerificaDataBranco(mskDataReferencia.Text) then
  Begin
    if (Abs(StrToDate(mskDataReferencia.Text)-DM.Configuracao1.Data) > DM.Configuracao1.MelhorData) then
      ShowMessage('Data de Refer�ncia acima do permitido!');
    if (StrToDate(mskDataReferencia.Text) < DM.Configuracao1.Data) and
       (Forma_de_Pagamento1.Prazo[1] = '0') then
      Raise exception.Create('Data de Refer�ncia inv�lida!');
  end;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CLI_CODIGO').AsInteger := StrToInt(edtCodigoCLI.Text);
    ParamByName('CNC_CODIGO').AsInteger := StrToInt(edtClienteCNC.Text);
    Open;
    if isEmpty then
      Raise exception.Create('Cliente n�o encontrado!');
  end;

  RecalcularPrecos;

  CdCNC     := DM.Configuracao1.codigoCNC;
  CdPDV     := StrToInt(edtCodigoPDV.Text);

  if (dblTipoPagamento.KeyValue <> 412) and  //Boleto Banc�rio
     ((dblTipoPagamento.KeyValue <> 5) or    //Dinheiro/Promiss�ria
      (dblFormaPagamento.KeyValue <> 1)) and //Dif. A Vista
     (Informacoes1.Boleto) then
  Begin
    ShowMessage('Tipo de Pagamento inv�lido para o cliente! (Boleto)!');
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=11;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0)then
          begin
            free;
            raise Exception.Create('O usu�rio n�o tem permiss�o Trocar TipoPag/FormaPag na Venda!');
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
  end;

  if (Informacoes1.CodigoFPG = 1) and //A Vista
     (dblTipoPagamento.KeyValue = 13) or    //Cart�o
     ((dblFormaPagamento.KeyValue = 1) and  //Dinheiro A Vista
      (dblTipoPagamento.KeyValue = 5)) then
  Begin
   // Libera para Cart�o e A Vista
  end
  else
  Begin
    if (Informacoes1.CodigoFPG > 0) and
       (dblTipoPagamento.KeyValue <> 13) and //Dif. Cart�o
       (not ((dblFormaPagamento.KeyValue = 1) and
             (dblTipoPagamento.KeyValue = 5))) then //Dif. de A Vista
    Begin
      if (dblFormaPagamento.KeyValue <> Informacoes1.CodigoFPG) or
         ((Informacoes1.CodigoFPG = 1) and
          (dblTipoPagamento.KeyValue = 6)) then
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT * FROM FORMA_DE_PAGAMENTO '+
            ' WHERE FPG_CODIGO='+IntToStr(Informacoes1.CodigoFPG);
          Open;
        end;
        ShowMessage('Forma de Pagamento inv�lida para o cliente! ('+DM.QR_Consultas.FieldByName('FPG_DESCRICAO').asString+')');
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=11;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0)then
              begin
                free;
                raise Exception.Create('O usu�rio n�o tem permiss�o Trocar TipoPag/FormaPag na Venda!');
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
    end;
  end;

  if (Entidade.CodigoFPG > 0) and
     (dblFormaPagamento.KeyValue <> Entidade.CodigoFPG) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FPG_PRAZO AS PRAZO '+
        ' FROM FORMA_DE_PAGAMENTO '+
        ' WHERE FPG_CODIGO='+IntToStr(Entidade.CodigoFPG);
      Open;
      if FieldByName('PRAZO').asString = '0' then
      Begin
        ShowMessage('Alterando Venda A Vista para venda A Prazo!');
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8380)) < 0) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=11;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(8380)) < 0)then
              begin
                free;
                raise Exception.Create('O usu�rio n�o tem permiss�o alterar Venda A Vista para Venda A Prazo!');
              end
              else
                DM.Usuario1.GeraLog(8380, CdCNC, CdPDV,
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
          DM.Usuario1.GeraLog(8380, CdCNC, CdPDV,
            'VENDA-FORMA_PAG');
      end;
    end;
  end;

  Entidade.AtualizaControles(False);
  AtualizaControles(True, False);
  ckbMelhorData.Enabled:=False;
  ckbMelhorDataClick(sender);
  dblCodigoAGF.Enabled:=False;
  memResumo.Enabled:=True;
  Aux:=Item_Pedido_Venda1.AfterScroll;
  Item_Pedido_Venda1.AfterScroll:=nil;
  try
    Item_Pedido_Venda1.Close;
    With Entidade do
    Begin
      if ckbMelhorData.Checked then
        sMelhorData := '"'+MesDia(mskDataReferencia.Text)+'" '
      else
        sMelhorData := 'NULL';

      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' CLI_CODIGO='+edtCodigoCLI.Text+
        ',CNC_CLIENTE='+edtClienteCNC.Text+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',FPG_CODIGO='+IntToStr(Forma_de_Pagamento1.CodigoFPG)+
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',PDV_DIAS_RESERV='+edtDiasOrcamento.Text+
        ',PDV_TIPO_PAG='+IntToStr(Parametro1.CodigoPAR)+
        ',AGF_CODIGO='+IntToStr(AgenteFin1.CodigoAGF)+
        ',PDV_OBS="'+memObservacao.Text+'" '+
        ',PDV_SITUACAO=0'+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_MELHOR_DATA='+sMelhorData+
        ',PDV_ENTREGA_DEPOSITO='+IntToStr(iEntregaDeposito)+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
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
  finally
    Item_Pedido_Venda1.AfterScroll:=Aux;
  end;

  if not Item_Pedido_Venda1.IsEmpty then
  Begin
    CarregarItemVenda;
    SB_SalvarPedido.SetFocus;
    SB_SalvarPedidoClick(sender);
  end
  else
    SB_NovoClick(sender);
  edtDiasOrcamento.Enabled := False;
  edtDiasOrcamento.Color := AlteraCorComponentes;
end;

procedure TfMxPedidoRapido.SB_CancPedClick(Sender: TObject);
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
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text);
      Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.text), 'Vazio');
    except
    end;
  end;
  memResumo.Enabled:=True;
  ckbMelhorData.Enabled:=False;
  ckbMelhorDataClick(sender);
  edtDiasOrcamento.Enabled := False;
  edtDiasOrcamento.Color := AlteraCorComponentes;
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtRazaoSocial.Clear;
    edtConvenio.Clear;
    mskCNPJCPF.Clear;
  end
  else
    Entidade.CarregaDados;
end;

procedure TfMxPedidoRapido.SB_EntradaClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Voc� n�o pode alterar vendas neste centro de custo.');
  if (Entidade.IsEmpty) then
    Raise Exception.Create('Fa�a o Pedido primeiro!');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido n�o pode ser alterado!');
  if Item_Pedido_Venda1.IsEmpty then
    ShowMessage('Coloque os itens primeiro!')
  else
  Begin
    Application.CreateForm(TfMXValorEntrada, fMXValorEntrada);
    fMXValorEntrada.Tag:=1;
    aux:=Item_Pedido_Venda1.AfterScroll;
    Item_Pedido_Venda1.AfterScroll:=Nil;
    try
      fMXValorEntrada.Showmodal;
      Item_Pedido_Venda1.First;
    finally
      Item_Pedido_Venda1.AfterScroll:=Aux;
    end;
    CarregarItemVenda;
  end;
end;

procedure TfMxPedidoRapido.SB_NovoClick(Sender: TObject);
begin
  QtdAnt := 0;
  if not Item_Pedido_Venda1.Active then
    Raise Exception.Create('Crie primeiro o Cabe�alho');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido n�o pode ser alterado!');
  if Item_Pedido_Venda1.RecordCount >= DM.Configuracao1.MaxItensNota then
    Raise Exception.Create('Quantidade M�xima de itens por nota!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Voc� n�o pode alterar vendas neste centro de custo.');
  if Entidade.IsEmpty then
    Raise Exception.Create('Crie primeiro o cabe�alho do Pedido!');
  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
  Begin
    ShowMessage('Cliente inv�lido!');
    Exit;
  end
  else
  Begin
    AtualizaControles(False, True);
    Item_Pedido_Venda1.PreparaInsercao;
    if AgenteFin1.JurosEntrada then
    Begin
      edtBonificacao.Enabled := False;
      edtDesconto.Enabled := False;
      ckbEntregue.Checked := False;
      ckbEntregue.Enabled := False;
    end;
    if (DM.Configuracao1.Empresa = 2) and (not Item_Pedido_Venda1.IsEmpty) then
      dblCodigoFUN.Enabled := False;
    edtProduto.Clear;
    edtUnidade.Clear;
    edtReferencia.Clear;
    edtMarca.Clear;
    imgProduto.Picture:=nil;
    memResumo.Enabled:=False;
    edtCodigoPRD.SetFocus;

    //verificar se a venda � a vista
    If (Forma_de_Pagamento1.Prazo='0') or (Forma_de_Pagamento1.Prazo='') then
      ckbVendaAVista.Checked:=true
    Else
      ckbVendaAVista.Checked:=false;
    if not VerificaFloatBranco(edtDesconto.Text) then
      edtDesconto.Text := '0';
  end;
end;

procedure TfMxPedidoRapido.SB_ExcClick(Sender: TObject);
var
  QTD:Double;
  CdCNC, CdPDV, PRD:Integer;
  Trans:Boolean;
  vMotivo: string;
begin
  If Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('N�o existem registros para serem deletados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Voc� n�o pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido n�o pode ser alterado!');
  if Item_Pedido_Venda1.RecordCount = 1 then
    Raise exception.Create('N�o � permitido excluir o �ltimo item!'+#13+
                           'Cancele o pedido!');
  // Verifica se o Pedido foi impresso
  if (Entidade.Impresso) or
     (DM.Configuracao1.Caixa) then
  Begin
    // Verifica permiss�o para excluir item
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3640)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=11;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (usuario1.Permissoes.IndexOf(IntToStr(3640)) < 0) then
          begin
            free;
            raise Exception.Create('O usu�rio n�o tem permiss�o para Excluir Item de Pedido de Venda!');
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

  CdCNC := Item_Pedido_Venda1.CodigoCNC;
  CdPDV := Item_Pedido_Venda1.CodigoPDV;
  PRD := Item_Pedido_Venda1.CodigoPRD;
  QTD := Item_Pedido_Venda1.Quantidade;

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

        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
          ' PDV_SITUACAO=3 '+
          ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
          ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PDV_CODIGO='+IntToStr(CdPDV));

        If DM.Configuracao1.ControleTransacao then
          Commit;

        if Item_Pedido_Venda1.IsEmpty then
        begin
           memResumo.Clear;
           dblCodigoFUN.KeyValue := 0;
           imgProduto.Picture:=nil;
           edtCodigoTBP.Clear;
           edtCodigoPRD.Clear;
           edtProduto.Clear;
           edtUnidade.Clear;
           edtReferencia.Clear;
           edtMarca.Clear;
           edtQuantidade.Clear;
           edtDesconto.Clear;
           edtPrecoUnitario.Clear;
           edtSugestao.Clear;
           edtBonificacao.Clear;
           edtPrecoDesconto.Text := '0';
        end;
      except
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados n�o foram salvos! Anote os c�digos e ligue para o suporte');
          end;
      end;
    end;
  end;
end;

procedure TfMxPedidoRapido.SB_SalvaClick(Sender: TObject);
Var
  mensagem,TAM:String;
  trans:boolean;
  vDesconto, vLimSimples, vLimEspecial, vLimSimplesPrazo, vLimEspecialPrazo,vQtdVendida, vPrecoPRD:Double;
  i, CdPRD, CdCNC, CdPDV, CdCLICNC, CdCLI, iQtdParcelas, iEstado: integer;
begin
  iEstado := Item_Pedido_Venda1.Estado;

  if not VerificaFloatBranco(edtPrecoUnitario.Text) then
    Exit;
  if not VerificaFloatBranco(edtSugestao.Text) then
    Exit;
  if not VerificaInteiroBranco(edtCodigoTBP.Text) then
    edtCodigoTBP.Text := '0';
  if not VerificaFloatBranco(edtBonificacao.Text) then
    edtBonificacao.Text := '0';

  mensagem:='';
  if edtQuantidade.Text = '' then
    edtQuantidade.Text:='1';
  if not VerificaFloatBranco(edtCodigoPRD.Text) then
    mensagem:= mensagem + 'C�digo do Produto inv�lido!'+#13;
  if not VerificaFloatBranco(edtQuantidade.Text) then
    mensagem:= mensagem + 'Quantidade inv�lida!'+#13;
  if (not ckbEntregue.Checked) then
    if Cliente1.IsEmpty then
      mensagem:=mensagem+'Selecione o Cliente para entrega posterior!'+#13
    else if (DM.Configuracao1.CodigoCliAVista=StrToInt(edtCodigoCLI.Text)) then
      mensagem:=mensagem+'Para entrega posterior � necess�rio selecionar o cliente!'+#13;
  if (DM.Configuracao1.Empresa <> empHOPE) and
     (edtBonificacao.Text <> '0') and
     (StrToInt(edtCodigoTBP.Text)=0) then
    mensagem:=mensagem+'A bonifica��o somente � permitida quando especificada na tabela de pre�o!'+#13;

  if mensagem <> '' then
    Raise Exception.Create(mensagem);

  if (StrToFloat(edtQuantidade.Text) <= 0) or
     (StrToFloat(edtBonificacao.Text) < 0) then
    raise Exception.Create('Quantidade/Bonifica��o digitada incorretamente!');

  if StrToFloat(edtBonificacao.Text) > StrToFloat(edtQuantidade.Text) then
    raise Exception.Create('Bonifica��o superior a quantidade entregue!');

  if DM.Configuracao1.Empresa = empEletro then //Eletro Guerra
  Begin
    if not ckbEntregue.Checked then
      If MessageDlg('Aten��o!!!'+#13+
                    'Essa mercadoria ser� entregue pelo Dep�sito?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Begin
        ckbEntregue.Checked := True;
        Exit;
      end;
  end;

  If Forma_de_Pagamento1.Prazo[1]='0' then
    iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
  else
    iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);

  //Verificar se a Forma de Pagamento exige uma tabela promocional
  if Forma_de_Pagamento1.CodigoTBP > 0 then
    if StrToInt(edtCodigoTBP.Text) <> Forma_de_Pagamento1.CodigoTBP then
      Raise exception.Create('Forma de Pagamento exige tabela '+IntToStr(Forma_de_Pagamento1.CodigoTBP));

  if not VerificaFloatBranco(edtDesconto.Text) then
    vDesconto := 0
  else
    vDesconto := Arredonda(StrToFloat(edtDesconto.Text),4);

  vLimSimples  := Arredonda(DM.Configuracao1.JurosNorm);
  vLimEspecial := Arredonda(DM.Configuracao1.JurosEsp);
  if (DM.Configuracao1.Empresa = empEletro) and
     (AgenteFin1.RecebimentoAVista) then
  Begin
    vLimSimplesPrazo  := Arredonda(DM.Configuracao1.JurosNorm);
    vLimEspecialPrazo := Arredonda(DM.Configuracao1.JurosEsp);
  end
  else
  Begin
    vLimSimplesPrazo  := Arredonda(DM.Configuracao1.LBMDesconto60);
    vLimEspecialPrazo := Arredonda(DM.Configuracao1.LBMJuros60);
  end;

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;
  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;
  CdPRD    := StrToInt(edtCodigoPRD.Text);
  vPrecoPRD:= StrToFloat(edtPrecoDesconto.Text);

  //Petromax n�o permite desconto quando o cliente tem desconto
  if (DM.Configuracao1.Empresa = empPetromax) and
     (vDesconto > 0) and
     ((Cliente1.Desconto > 0) OR (Cliente1.VendaAtacado)) then
  Begin
    if MessageDlg('Cliente com Desconto em Cadastro!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
       (not vCentraliza) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        DigCdPDVCNC := CdCNC;
        DigCdPDV    := CdPDV;
        DigCdCLICNC := CdCLICNC;
        DigCdCLI    := CdCLI;
        DigCdPRD    := CdPRD;
        DigvPrecoPRD:= vPrecoPRD;
        DigiTipoPendencia := 2; //Desconto Pedido
        onClose:=nil;
        Tag:=11;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
          begin
            free;
            raise Exception.Create('O usu�rio n�o tem permiss�o esse Desconto!');
          end
          else
          Begin
            if DigCdPEN > 0 then
              ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                ' PEN_SITUACAO=3 '+ //Processado
                ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
            DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE C/DESCONTO EM CADASTRO');
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
      DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
        ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE C/DESCONTO EM CADASTRO');
  end
  Else if vDesconto > 0 then
  Begin
    if StrToFloat(edtPrecoDesconto.Text) < Arredonda(Produto1.Precomedio) then
    Begin
      ShowMessage('Produto: '+Produto1.Descricao+#13'com pre�o abaixo do M�nimo!');
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Desconto Total
         (not vCentraliza) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          DigCdPDVCNC := CdCNC;
          DigCdPDV    := CdPDV;
          DigCdCLICNC := CdCLICNC;
          DigCdCLI    := CdCLI;
          DigCdPRD    := CdPRD;
          DigvPrecoPRD:= vPrecoPRD;
          DigiTipoPendencia := 2; //Desconto Pedido
          onClose:=nil;
          Tag:=11;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
               (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then //Desconto Total
            begin
              free;
              raise Exception.Create('O usu�rio n�o tem permiss�o vender abaixo do Pre�o M�nimo!');
            end
            else
            Begin
              if DigCdPEN > 0 then
                ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                  ' PEN_SITUACAO=3 '+ //Processado
                  ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                  ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                  ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                  ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                  ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
              DM.Usuario1.GeraLog(3740, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-ABAIXO PRECO MINIMO');
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
        DM.Usuario1.GeraLog(3740, CdCNC, CdPDV,
          ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-ABAIXO PRECO MINIMO');
    End;
  end
  else
  Begin
    if Arredonda(StrToFloat(edtPrecoUnitario.Text)) < Arredonda(Produto1.Precomedio) then
    Begin
      ShowMessage('Pre�o de Venda abaixo do M�nimo!');
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Desconto Total
         (not vCentraliza) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          DigCdPDVCNC := CdCNC;
          DigCdPDV    := CdPDV;
          DigCdCLICNC := CdCLICNC;
          DigCdCLI    := CdCLI;
          DigCdPRD    := CdPRD;
          DigvPrecoPRD:= vPrecoPRD;
          DigiTipoPendencia := 2; //Desconto Pedido
          onClose:=nil;
          Tag:=11;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
               (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then //Desconto Total
            begin
              free;
              raise Exception.Create('O usu�rio n�o tem permiss�o vender abaixo do Pre�o M�nimo!');
            end
            else
            Begin
              if DigCdPEN > 0 then
                ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                  ' PEN_SITUACAO=3 '+ //Processado
                  ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                  ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                  ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                  ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                  ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
              DM.Usuario1.GeraLog(3740, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-PRECO UNIT. ABAIXO PRECO MINIMO');
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
        DM.Usuario1.GeraLog(3740, CdCNC, CdPDV,
          ' PRD: '+IntToStr(Produto1.CodigoPRD)+' VENDA-PRECO UNIT. ABAIXO PRECO MINIMO');
    End;
  end;

  if (DM.Configuracao1.Empresa = empHope) and
     (Produto1.ForaDeLinha) then
  Begin
    edtCodigoTBP.Text := '0'; //N�o � permitido o usu de tabela de pre�o para produtos Fora de Linha
    vLimSimples       := 0;
    vLimEspecial      := 0;
    vLimSimplesPrazo  := 0;
    vLimEspecialPrazo := 0;
  end
  else
  Begin
    // Sendo Tabela de Pre�o verifica Permiss�o para o desconto. PS: Verifica��o do prazo j� foi feita...
    if StrToInt(edtCodigoTBP.Text) > 0 then
    Begin
      DM.qr_consultas2.Close;
      DM.qr_consultas2.SQL.Text:='SELECT * '+
        ' FROM ITEM_DE_TABELA_DE_PRECO T1,TABELA_DE_PRECO T2 '+
        ' WHERE T1.TBP_CODIGO='+edtCodigoTBP.Text+
        ' AND T1.PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND T2.TBP_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' OR '+sTabelaPrecoCPD+') '+
        ' AND T2.TBP_CODIGO=T1.TBP_CODIGO '+
        ' AND T2.CNC_CODIGO=T1.CNC_CODIGO ';
      DM.qr_consultas2.Open;
      if DM.qr_consultas2.IsEmpty or
         ((not AgenteFin1.RecebimentoAVista) and
          (DM.qr_consultas2.FieldByName('TBP_PRAZO_MEDIO').asInteger < iQtdParcelas)) then //Qtd m�xima de parcelas
        Raise exception.Create('Tabela inv�lida ou Vencida!');
      if (DM.qr_consultas2.FieldByName('TBP_AGF_EXCLUSIVO').asInteger > 0) and
         (dblCodigoAGF.Text <> '') then
      Begin
        if (DM.qr_consultas2.FieldByName('TBP_AGF_EXCLUSIVO').asInteger <> dblCodigoAGF.KeyValue) then
          Raise exception.Create('Tabela exclusiva para outro agente financeiro!');
      end;

      vLimSimples       := DM.qr_consultas2.FieldByName('TBP_DESCONTO_SIMPLES').asFloat;
      vLimEspecial      := DM.qr_consultas2.FieldByName('TBP_DESCONTO_ESPECIAL').asFloat;
      if (DM.Configuracao1.Empresa = empEletro) and
         (AgenteFin1.RecebimentoAVista) then //Dez Dias
      Begin
        vLimSimplesPrazo  := DM.qr_consultas2.FieldByName('TBP_DESCONTO_SIMPLES').asFloat;
        vLimEspecialPrazo := DM.qr_consultas2.FieldByName('TBP_DESCONTO_ESPECIAL').asFloat;
      end
      else
      Begin
        vLimSimplesPrazo  := DM.qr_consultas2.FieldByName('TBP_DESCONTO_SIMPLES_PRAZO').asFloat;
        vLimEspecialPrazo := DM.qr_consultas2.FieldByName('TBP_DESCONTO_ESPECIAL_PRAZO').asFloat;
      end;
      if (Cliente1.Desconto > 0) and
         ((Cliente1.VendaAtacado) or
          (Forma_de_Pagamento1.Prazo = '0')) then
      Begin
        vLimSimples       := 0;                                             //Cliente com desconto permite somente
        vLimSimplesPrazo  := 0;                                             //desconto especial
      end;
    end;
  end;

  if (vDesconto > 0) then
  Begin
    //� Vista
    if (Forma_de_Pagamento1.Prazo = '0') or
       (Forma_de_Pagamento1.Prazo = '') or
       AgenteFin1.RecebimentoAVista then //Usando Financeira trabalhar com pre�o de A Vista
    Begin
      If (vDesconto > vLimEspecial) then
      Begin
        if MessageDlg('Produto: '+Produto1.Descricao+#13+
                      'Desconto atribu�do (Total)!'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Desconto TOTAL
           (not vCentraliza) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            DigCdPDVCNC := CdCNC;
            DigCdPDV    := CdPDV;
            DigCdCLICNC := CdCLICNC;
            DigCdCLI    := CdCLI;
            DigCdPRD    := CdPRD;
            DigvPrecoPRD:= vPrecoPRD;
            DigiTipoPendencia := 2; //Desconto Pedido
            onClose:=nil;
            Tag:=11;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then //Desconto Total
              begin
                free;
                raise Exception.Create('O usu�rio n�o tem permiss�o para liberar o desconto!');
              end
              else
              Begin
                if DigCdPEN > 0 then
                  ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                    ' PEN_SITUACAO=3 '+ //Processado
                    ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                    ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                    ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                    ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                    ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
                DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO TOTAL');
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
          DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO TOTAL');
      end
      else If (vDesconto >  vLimSimples) and
              (vDesconto <= vLimEspecial) then
      Begin
        if MessageDlg('Produto: '+Produto1.Descricao+#13+
                      'Desconto atribu�do (Especial)!'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and //Desconto Especial
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Desconto Total
           (not vCentraliza) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            DigCdPDVCNC := CdCNC;
            DigCdPDV    := CdPDV;
            DigCdCLICNC := CdCLICNC;
            DigCdCLI    := CdCLI;
            DigCdPRD    := CdPRD;
            DigvPrecoPRD:= vPrecoPRD;
            DigiTipoPendencia := 2; //Desconto Pedido
            onClose:=nil;
            Tag:=11;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and //Desconto Especial
                 (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then //Desconto Total
              begin
                free;
                raise Exception.Create('O usu�rio n�o tem permiss�o para liberar o desconto (Especial)!');
              end
              else
              Begin
                if DigCdPEN > 0 then
                  ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                    ' PEN_SITUACAO=3 '+ //Processado
                    ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                    ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                    ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                    ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                    ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
                DM.Usuario1.GeraLog(1810, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO ESPECIAL');
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
          DM.Usuario1.GeraLog(1810, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO ESPECIAL');
      End
      Else If (vDesconto <= vLimSimples) then
      Begin
        //N�o exibir mensagem para desconto simples
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND //Desconto Total
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) AND //Desconto Especial
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) AND //Desconto Simples
           (not vCentraliza) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            DigCdPDVCNC := CdCNC;
            DigCdPDV    := CdPDV;
            DigCdCLICNC := CdCLICNC;
            DigCdCLI    := CdCLI;
            DigCdPRD    := CdPRD;
            DigvPrecoPRD:= vPrecoPRD;
            DigiTipoPendencia := 2; //Desconto Pedido
            onClose:=nil;
            Tag:=11;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and  //Desconto Total
                 (Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and  //Desconta Especial
                 (Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) then //Desconta Simples
              begin
                free;
                raise Exception.Create('Usu�rio n�o tem Permiss�o para Liberar Desconto (Simples)!');
              end
              else
              Begin
                if DigCdPEN > 0 then
                  ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                    ' PEN_SITUACAO=3 '+ //Processado
                    ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                    ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                    ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                    ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                    ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
                DM.Usuario1.GeraLog(3800, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO SIMPLES');
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
          DM.Usuario1.GeraLog(3800, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO SIMPLES');
      end;
    end
    else //� PRAZO com Desconto e N�o � Financeira
    Begin
      If (vDesconto > vLimEspecialPrazo) then
      Begin
        if MessageDlg('Produto: '+Produto1.Descricao+#13+
                      'Desconto atribu�do (TOTAL-Prazo)!'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Desconto Total
           (not vCentraliza) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            DigCdPDVCNC := CdCNC;
            DigCdPDV    := CdPDV;
            DigCdCLICNC := CdCLICNC;
            DigCdCLI    := CdCLI;
            DigCdPRD    := CdPRD;
            DigvPrecoPRD:= vPrecoPRD;
            DigiTipoPendencia := 2; //Desconto Pedido
            onClose:=nil;
            Tag:=11;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Desconto Total
              begin
                free;
                raise Exception.Create('O usu�rio n�o tem permiss�o para liberar o desconto (Total-Prazo)!');
              end
              else
              Begin
                if DigCdPEN > 0 then
                  ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                    ' PEN_SITUACAO=3 '+ //Processado
                    ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                    ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                    ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                    ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                    ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
                DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO A PRAZO ACIMA DO ESPECIAL');
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
          DM.Usuario1.GeraLog(3540, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO A PRAZO ACIMA DO ESPECIAL');
      end
      else If (vDesconto >  vLimSimplesPrazo) and
              (vDesconto <= vLimEspecialPrazo) then
      Begin
        if MessageDlg('Produto: '+Produto1.Descricao+#13+
                      'Desconto atribu�do (Especial-Prazo)!'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Liberacao Total
           (not vCentraliza) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            DigCdPDVCNC := CdCNC;
            DigCdPDV    := CdPDV;
            DigCdCLICNC := CdCLICNC;
            DigCdCLI    := CdCLI;
            DigCdPRD    := CdPRD;
            DigvPrecoPRD:= vPrecoPRD;
            DigiTipoPendencia := 2; //Desconto Pedido
            onClose:=nil;
            Tag:=11;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
                 (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Liberacao Total
              begin
                free;
                raise Exception.Create('O usu�rio n�o tem permiss�o para liberar o desconto (Especial-Prazo)!');
              end
              else
              Begin
                if DigCdPEN > 0 then
                  ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                    ' PEN_SITUACAO=3 '+ //Processado
                    ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                    ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                    ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                    ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                    ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
                DM.Usuario1.GeraLog(7370, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO ESPECIAL-PRAZO');
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
          DM.Usuario1.GeraLog(7370, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO ESPECIAL-PRAZO');
      end
      else //Desconto Simples Prazo
      Begin
        if MessageDlg('Produto: '+Produto1.Descricao+#13+
                      'Desconto atribu�do (Simples-Prazo)!'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3600)) < 0) and //Desconto Simples-Prazo
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and //Liberacao Total
           (not vCentraliza) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            DigCdPDVCNC := CdCNC;
            DigCdPDV    := CdPDV;
            DigCdCLICNC := CdCLICNC;
            DigCdCLI    := CdCLI;
            DigCdPRD    := CdPRD;
            DigvPrecoPRD:= vPrecoPRD;
            DigiTipoPendencia := 2; //Desconto Pedido
            onClose:=nil;
            Tag:=11;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3600)) < 0) and //Desconto Simples-Prazo
                 (Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
                 (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Liberacao Total
              begin
                free;
                raise Exception.Create('O usu�rio n�o tem permiss�o para liberar o desconto (Simples-Prazo)!');
              end
              else
              Begin
                if DigCdPEN > 0 then
                  ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                    ' PEN_SITUACAO=3 '+ //Processado
                    ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                    ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                    ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                    ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                    ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
                DM.Usuario1.GeraLog(3600, CdCNC, CdPDV,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO SIMPLES-PRAZO');
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
          DM.Usuario1.GeraLog(3600, CdCNC, CdPDV,
            ' PRD: '+IntToStr(Produto1.CodigoPRD)+' Desc:'+format('%.2f',[vDesconto])+'% VENDA-DESCONTO SIMPLES-PRAZO');
      end;
    end;
  end;

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
      Begin
        Raise exception.Create('Falha ao inserir IES! CNC:'+IntToStr(DM.Configuracao1.CodigoCNC)+
                    ' PRD:'+edtCodigoPRD.Text);
      end;
      Close;
      ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
      open;
    end;

    if (DM.Configuracao1.Empresa = empEletro) and
       (DM.Usuario1.Mafalda = 0) and
       (SFisico = 0) and
       (SComercial = 0) then
    Begin
      if MessageDlg('C�digo antigo do produto.'+#13+
                    'Deseja continuar!',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=11;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0)then
            begin
              free;
              raise Exception.Create('O usu�rio n�o tem permiss�o Venda com C�digo do Produto antigo!');
            end
            else
              DM.Usuario1.GeraLog(3820, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' VENDA-ESTOQUE 0');
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
        DM.Usuario1.GeraLog(3820, CdCNC, CdPDV,
          'VENDA-ESTOQUE 0');
    end;
  end;


  vQtdVendida := Arredonda(StrToFloat(edtQuantidade.Text) - QtdAnt);
  if DM.Configuracao1.DiretoImpFiscal then
  Begin
    if vQtdVendida <= 0 then
      Raise exception.Create('N�o � permitido diminuir a quantidade de itens!')
    else if vQtdVendida > 0 then
    Begin
//      DM.ImpFiscalB1.MonitoramentoPapel;
//      if not DM.ImpFiscalB1.Analisa_iRetorno then
//        Raise exception.Create('Falha de Comunica��o com a impressora!');

//      case DM.ImpFiscalB1.Retorno_Impressora of
//        -1: Raise exception.Create('Impressora sem papel ou desligada!');
//         0: Begin
              //Papel est� acabando
//            end;
      end;

      if Item_Pedido_Venda1.IsEmpty then
      Begin
//        DM.ImpFiscalB1.LimpaItens;

//        if not DM.ImpFiscalB1.AbreCupom(Cliente1.CPFCGC) then //CNPJ_CPF
//          Raise exception.Create('Falha ao Abrir o Cupom Fiscal!');

//        if (DM.ImpFiscalB1.iRetorno <> 1) then // Se n�o for aberto o Cupom
//          Raise exception.Create('Falha ao Abrir o Cupom Fiscal!');

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
//        DM.ImpFiscalB1.MensagemPromocional:=mensagem;
//        NumeroOficial := DM.ImpFiscalB1.RetornoNumeroCupom;
        if NumeroOficial <= 0 then
        Begin
          sleep(300);
          Application.ProcessMessages;
//          NumeroOficial := DM.ImpFiscalB1.RetornoNumeroCupom;
          if NumeroOficial <= 0 then
          Begin
            Raise exception.Create('ATEN��O !!!'+#13+
                                   'Impressora retornou N�mero do Cupom inv�lido!');
          end;
        end;
      end;
    end;
//    if StrToFloat(edtPrecoDesconto.Text) < StrToFloat(edtSugestao.Text) then
//      DM.ImpFiscalB1.VendaDeItem(Produto1.CodigoPRD, Produto1.Descricao, Produto1.Unidade,
//        Produto1.Referencia, '1700', vQtdVendida,
//        StrToFloat(edtPrecoDesconto.Text),StrToFloat(edtSugestao.Text)-StrToFloat(edtPrecoDesconto.Text))
//    else
//      DM.ImpFiscalB1.VendaDeItem(Produto1.CodigoPRD, Produto1.Descricao, Produto1.Unidade,
//        Produto1.Referencia, '1700', vQtdVendida,
//        StrToFloat(edtPrecoDesconto.Text),0);
//  end;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if Item_Pedido_Venda1.FinalizaEdicao(0,0,0,Produto1.Servico) then
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
      end;
      If DM.Configuracao1.ControleTransacao then
        if trans then
          Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados n�o foram salvos! Anote os c�digos e ligue para o suporte');
        end;
    end;
  End;
  memResumo.Enabled:=True;
  memResumo.Clear;
end;

procedure TfMxPedidoRapido.SB_CancClick(Sender: TObject);
var
  aux:TNotifyEvent;
begin
  aux := edtCodigoPRD.OnExit;
  edtCodigoPRD.OnExit := nil;
  QtdAnt := 0;
  Item_Pedido_Venda1.CancelaEdicao;
  AtualizaControles(False, False);

  If Item_Pedido_Venda1.IsEmpty Then
  Begin
    imgProduto.Picture:=nil;
    edtProduto.Clear;
    edtUnidade.Clear;
    edtReferencia.Clear;
    edtMarca.Clear;
    edtPrecoDesconto.Text := '0,00';
    dbgItens.SetFocus;
  End
  else
    CarregarItemVenda;
  memResumo.Enabled:=True;
  edtCodigoPRD.OnExit := aux;
end;

procedure TfMxPedidoRapido.SB_SalvarPedidoClick(Sender: TObject);
Var
  Soma, VAVista, VAPrazo, Entra:Double;
  aux,aux2:TDataSetNotifyEvent;
  trans, cCartao, TemEntrada, vGrupoEspecial, vCentavosNaPrimeira:Boolean;
  iQtdParcelas: integer;
  ObsTrc:string;
begin
  ObsTrc := '';
  If Entidade.IsEmpty then
    Raise Exception.Create('Fa�a o Pedido primeiro!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Voc� n�o pode alterar vendas neste centro de custo.');
  If not (VerificaInteiroBranco(edtCodigoCLI.Text)) or (Cliente1.IsEmpty) or
     (edtCodigoCLI.Text='0') then
    Raise Exception.Create('N�o foi selecionado nenhum cliente para este pedido!');
  If Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('N�o existem itens para este pedido!');
  if not VerificaData(mskDataReferencia.Text) then
    Raise Exception.Create('Data de Refer�ncia inv�lida!')
  else if VerificaDataBranco(mskDataReferencia.Text) then
  Begin
    if (Abs(StrToDate(mskDataReferencia.Text)-DM.Configuracao1.Data) > DM.Configuracao1.MelhorData) then
      ShowMessage('Data de Refer�ncia acima do permitido!');
    if (StrToDate(mskDataReferencia.Text) < DM.Configuracao1.Data) and
       (Forma_de_Pagamento1.Prazo[1] = '0') then
      Raise exception.Create('Data de Refer�ncia inv�lida!');
  end;


  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_SITUACAO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
    Open;
    if FieldByName('PDV_SITUACAO').asInteger >= 4 then
    Begin
      ShowMessage('Pedido em situa��o n�o esperada!'+#13+
        'Anote essa mensagem e entre em contato com o suporte!');
      Application.Terminate;
    end;
  end;

  if Entidade.Situacao > 3 then
    Raise Exception.Create('N�o pode mais ser Salvo!');
  if (Trunc(Entidade.DataHora)<Trunc(DM.Configuracao1.Data)) and
     (Trunc(Entidade.DataAlterado)<Trunc(DM.Configuracao1.Data)) then
    Raise exception.Create('Renove o Cabe�alho!'+#13+
                           'Clicar em <Alterar> e em seguida clicar em <Salvar>!!!');
  Soma:=0;

  if Trunc(Entidade.DataAlterado) < DM.Configuracao1.Data then
    dblFormaPagamentoClick(sender);

  //Selecionar Fator Financeiro
  With FatorFinanceira1 do
  Begin
    Close;
    ParamByName('AGF_CODIGO').AsInteger:=AgenteFin1.CodigoAGF;
    If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
      iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
    Else
      iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);
    ParamByName('FAF_NPARC').AsInteger := iQtdParcelas;
    Open;
  End;

  //Verificar, caso o Pedido seja antigo, se a Tabela de pre�o est� v�lida!!!
  if Trunc(Entidade.DataAlterado) < Trunc(DM.Configuracao1.Data) then
    Raise exception.Create('Pedido Antigo!'+#13+
                           'Atualize o Cabe�alho!');

  //Verificar se tem algum item do Grupo Especial
  vGrupoEspecial := False;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT MAX(GRP_ESPECIAL) AS ESPECIAL '+
      ' FROM GRUPO G1, ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1 '+
      ' WHERE I1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND I1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
      ' AND (I1.TBP_CODIGO=0 OR I1.TBP_CODIGO IS NULL) '+ 
      ' AND P1.PRD_CODIGO=I1.PRD_CODIGO '+
      ' AND G1.GRP_CODIGO=P1.GRP_CODIGO ';
    Open;
    if FieldByName('ESPECIAL').asInteger = 1 then
      vGrupoEspecial := True;

    if (DM.Configuracao1.Empresa = empEletro) and
       (not AgenteFin1.RecebimentoAVista) and
       (iQtdParcelas > 8) and
       (vGrupoEspecial) then
      ShowMessage('ATEN��O!!!'+#13+#13+
                  'Grupo Especial em mais de 8 parcelas.');
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

      If not Item_Pedido_Venda1.IsEmpty then
      Begin
        //Petromax venda pelo REAL = Boleto
        if (DM.Configuracao1.Empresa = empPetromax) then
        Begin
          if Entidade.TipoPag = 412 then //Boleto Banc�rio
            ObsTrc := 'BOLETO - '+AgenteFin1.Descricao
          else if (Entidade.TipoPag = 5) and (Entidade.CodigoAGF > 5) then //Dinheiro/Dep�sito
            ObsTrc := 'DEPOSITO - '+AgenteFin1.Descricao;
        end;

        //Deletar os t�tulos gerados na tabela temporaria por este item antes de ger�-los novamente
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM TRCTEMP '+
          ' WHERE PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC));

        //Gerar titulos tempor�rios
        With Item_Pedido_Venda1 do
        Begin
          aux:=AfterScroll;
          AfterScroll:=Nil;
          aux2:=OnCalcFields;
          OnCalcFields:=nil;
          first;
          VAVista := 0;
          VAPrazo := 0;
          cCartao := False;
          while not eof do
          Begin
            //verifica se a forma de pagamento � a vista
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

            Soma:=Soma+Arredonda(Quantidade*Arredonda(PrecoDesc));
            if Bonificacao > 0 then
              Soma := Soma - Arredonda(Bonificacao * Arredonda(PrecoDesc));
            next;
          end;

          if AgenteFin1.RecebimentoAVista or
             (not Forma_de_Pagamento1.CentavosEntrada) or
             (not AgenteFin1.CentavosEntrada) then
            vCentavosNaPrimeira := False
          else
            vCentavosNaPrimeira := True;

          AfterScroll:=aux;
          OnCalcFields:=aux2;
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

          if VAVista > 0 then
            Titulo_receber1.GerarTitVista(Entidade.ClienteCNC, Entidade.CodigoCLI,
              ''(*Cart�oCV*), VAVista)
          else
            Titulo_receber1.GerarTitPrazo(Entidade.ClienteCNC, Entidade.CodigoCLI,
              ''(*Cart�oCV*), VAPrazo+Arredonda(AgenteFin1.TaxaADM) (*Total + TAC*), Entra, TemEntrada, cCartao, ObsTrc, 'TRT_CODIGO',
              0(*TipoPedido*), vCentavosNaPrimeira);

          //Muda situacao para pedido aprovado e coloca o valor total do pedido
          Titulo_receber4.Close;
          Titulo_receber4.Open;        

          // Evitar erros no acr�scimo por arredondamento
          if (ABS(Titulo_receber4.FieldByName('TotalPedido').asFloat-Soma) > 0.2) and
             (not AgenteFin1.RecebimentoAVista) then
            ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_SITUACAO=3 '+                                    
              ',PDV_TOTAL='+VirgPonto(Soma)+
              ',PDV_ACRESCIMO='+VirgPonto(Titulo_receber4.FieldByName('TotalPedido').asFloat-Soma)+
              ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
              ',CLI_CODIGO='+edtCodigoCLI.Text+
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
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
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND PDV_CODIGO='+edtCodigoPDV.Text)
        end; // Fim do With Item_Pedido_Venda1
      End; // Fim do If not Item_Pedido_Venda1.isEmpty
      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados n�o foram salvos! Anote os c�digos e ligue para o suporte');
        end;
    end;
  End;

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
  //Gerar resumo
  Titulo_receber2.Close;
  Titulo_receber2.Open;
  Entidade.Resumo(Titulo_receber2);
  if AgenteFin1.RecebimentoAVista then
  Begin
    memResumo.Lines.Add('-------------------------');
    memResumo.Lines.Add('Tot.Pedido : R$ '+Format('%.2f', [Entidade.Total]));
    memResumo.Lines.Add('T.A.C.     : R$ '+Format('%.2f', [AgenteFin1.TaxaADM]));
    memResumo.Lines.Add('Taxa Mensal: R$ '+Format('%.2f', [AgenteFin1.TaxaMensal]));
    memResumo.Lines.Add(AgenteFin1.Observacao);
  end;
end;

procedure TfMxPedidoRapido.SB_InformacoesClick(Sender: TObject);
var
  CdCLI, CdCLICNC: integer;
begin
  if (Entidade.IsEmpty) then
    Raise Exception.Create('Fa�a o Pedido primeiro!');
  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
  Begin
    edtCodigoCLI.Clear;
    edtRazaoSocial.Clear;
    edtConvenio.Clear;
    mskCNPJCPF.Clear;
    ShowMessage('Selecione o Cliente!');
    Exit;
  end
  else if StrToInt(edtCodigoCLI.Text) <> DM.Configuracao1.CodigoCliAVista then
  Begin
    CdCLI    := StrToInt(edtCodigoCLI.Text);
    CdCLICNC := StrToInt(edtClienteCNC.Text);
    if Cliente1.SPC = 1 then
    Begin
      ShowMessage('Esta venda n�o ser� permitida!'+#13+
                  'Procure a ger�ncia!');
      Exit;
    end
    else
    Begin
      Titulo_receber5.Close;
      Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger := CdCLICNC;
      Titulo_receber5.ParamByName('CLI_CODIGO').asInteger  := CdCLI;
      Titulo_receber5.ParamByName('DATA').asDate           := DM.Configuracao1.Data;
      Titulo_receber5.Open;
      if (not Titulo_receber5.IsEmpty) then
      Begin
        ShowMessage('Ser� necess�rio autoriza��o para efetuar essa venda!'+#13+
                    'Procure a ger�ncia!');
        Exit;
      end
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
              ShowMessage('Falha ao inserir Informa��es de Cr�dito!');
            end;
            Close;
            ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
            ParamByName('CLI_CODIGO').asInteger := CdCLI;
            Open;
          end;
          if Proibido then
          Begin
            ShowMessage('Esta venda n�o ser� permitida (PROIB)!'+#13+
                        'Procure a ger�ncia!');
            Exit;
          end
          Else if not IsEmpty then
          Begin
            if (CreditoUtil > LimiteCredito) and
               (LimiteCredito > 0) then
            Begin
              ShowMessage('Verifique Limite de Cr�dito com a Ger�ncia!');
              Exit;
            end;
          end;
        end;
        ShowMessage('Cliente est� OK!');
      end;
    end;
  end
  else
    ShowMessage('Cliente � Vista!');
end;

procedure TfMxPedidoRapido.SB_FecharPedidoClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxPedidoRapido.SB_FinalizarPedidoClick(Sender: TObject);
Var
  i,j,CdCLICNC, CdCLI, CdCNC, CdPDV, SEQ, IEB, CdArquiteto, iQtdTRC, iOpcaoFin, iGerarTitulos, iQtdParcelas:Integer;
  Trans, vGrupoEspecial, vExigirEntrada:Boolean; //, Lib3790, Lib3540, Lib3830, Lib3740, Lib3820, Lib3800, Lib1810, Lib3600, Lib7370 :Boolean;
  CreditoUtilizado, vValorPagar, vEntrada:Double;
  sCheques, sDescCredito, sCodigoCARTAO: string;
begin
{  Lib3790:=False; //Liberar Venda Cliente Inadiplente
  Lib3540:=False; //Liberar Juros Total
  Lib3830:=False; //Entrada Menor que a Presta��o
  Lib3740:=False; //Abaixo do Pre�o M�nimo
  Lib3820:=False; //Venda sem Estoque
  Lib3800:=False; //Liberar Desconto Simpes
  Lib1810:=False; //Liberar Desconto Especial
  Lib3600:=False; //Liberar Desconto Simples-Prazo
  Lib7370:=False; //Liberar Desconto Especial-Prazo
}

  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Voc� n�o pode alterar vendas neste centro de custo.');
  if (not Item_Pedido_Venda1.Active) or (not Entidade.Active) then
    Raise Exception.Create('Fa�a o Pedido primeiro!');
  if (Item_Pedido_Venda1.IsEmpty) or (Entidade.IsEmpty) then
    Raise Exception.Create('Fa�a o Pedido primeiro!');
  if StrToInt(edtDiasOrcamento.Text) > 0 then
    If MessageDlg('Aten��o!!!'+#13+
                  'Se esse or�amento for finalizado passar� a ser uma venda conclu�da.'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

  CreditoUtilizado:=0;
  SB_SalvarPedido.SetFocus;
  SB_SalvarPedidoClick(sender);

  //Verifica permiss�o para finalizar o pedido
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1980)) < 0 then
    raise Exception.Create('O usu�rio n�o tem permiss�o para finalizar o pedido!');
  If not (VerificaInteiroBranco(edtCodigoCLI.Text)) or (Cliente1.IsEmpty) or
    (edtCodigoCLI.Text = '0') then
    Raise Exception.Create('N�o foi selecionado nenhum cliente para este pedido!');
  If Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('N�o existem itens de pedido a serem processados!');
  If (dblTipoPagamento.Text = '') then
    Raise Exception.Create('Tipo de pagamento faltando!');
  If dblFormaPagamento.KeyValue=0 then
    Raise Exception.Create('Forma de pagamento faltando!');
  If Entidade.Situacao<>3 then
    Raise Exception.Create('Salve o pedido antes de finalizar!');
  if (Forma_de_Pagamento1.Prazo <> '0') and
     (StrToInt(edtCodigoCLI.Text) = DM.Configuracao1.CodigoCliAVista) then
    Raise Exception.Create('N�o � poss�vel atribuir uma venda � prazo ao cliente Balc�o!');


  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;
  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;
  IEB := 0;

  //Impedir venda com entrada menor que as presta��es para clientes sem hist�rico de compra
  if (DM.Configuracao1.Empresa = empEletro) and
     (DM.Usuario1.Mafalda = 0) then
  Begin
    vExigirEntrada := False;
    //Venda a Prazo com entrada definida
    if (Forma_de_Pagamento1.Prazo[1] <> '0') then  //Sem Entrada
      vExigirEntrada := True
    else if (Entidade.Entrada > 0.01) then //Entrada definida
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT SUM(PDV_TOTAL) AS TOTAL '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_SITUACAO=4 '+
          ' AND CNC_CLIENTE='+IntToStr(CdCLICNC)+
          ' AND CLI_CODIGO='+IntToStr(CdCLI)+
          ' AND PDV_TIPO_PAG=5 '+ //Dinheiro/Banco
          ' AND FPG_CODIGO<>0 ';
        Open;
        if FieldByName('TOTAL').asFloat < 50 then
        Begin
          //Verificar se a entrada � menor que as presta��es
          Titulo_receber7.Close;
          Titulo_receber7.ParamByName('CNC_CODIGO').asInteger := CdCNC;
          Titulo_receber7.ParamByName('PDV_CODIGO').asInteger := CdPDV;
          Titulo_receber7.Open;
          if (Titulo_receber7.FieldByName('MEDIA').asFloat > Entidade.Entrada) then
            vExigirEntrada := True;
        end;
      end;
    end;
    if vExigirEntrada then
    Begin
      if MessageDlg('Total de compras � prazo do cliente � inferior a R$ 50,00!'+#13+
                    'A venda foi feita sem entrada ou entrada menor que o valor das presta��es!'+#13+
                    'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=11;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0)then
            begin
              free;
              raise Exception.Create('O usu�rio n�o tem permiss�o Entrada menor que a presta��o!');
            end
            else
              DM.Usuario1.GeraLog(3830, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' VENDA');
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
        DM.Usuario1.GeraLog(3830, CdCNC, CdPDV,
          'VENDA');
    end;
  end;

  if not VerificaData(mskDataReferencia.Text) then
    Raise Exception.Create('Data de Refer�ncia inv�lida!')
  else if VerificaDataBranco(mskDataReferencia.Text) then
  Begin
    if (StrToDate(mskDataReferencia.Text) < DM.Configuracao1.Data) and
       (Forma_de_Pagamento1.Prazo[1] = '0') then
      Raise Exception.Create('Data de Refer�ncia inv�lida!');
    if (Abs(StrToDate(mskDataReferencia.Text)-DM.Configuracao1.Data) > DM.Configuracao1.MelhorData) then
    Begin
      if MessageDlg('Data de Refer�ncia acima do permitido!'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8280)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=11;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(8280)) < 0)then
            begin
              free;
              raise Exception.Create('O usu�rio n�o tem permiss�o Data de refer�ncia acima do permitido!');
            end
            else
              DM.Usuario1.GeraLog(8280, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' VENDA-DT REF '+mskDataReferencia.Text);
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
          'VENDA-DT REF '+mskDataReferencia.Text);
    end;
  end;

  //Verificar permiss�o para finalizar Venda � Vista (Petromax)
  {if (DM.Configuracao1.Empresa = empPetromax) and
     (dblFormaPagamento.KeyValue = 1) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(6000)) < 0) then
  Begin
    ShowMessage('Usu�rio n�o tem permiss�o para Finalizar � Vista!');
    Exit;
  end;}

  with Informacoes1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
    ParamByName('CLI_CODIGO').asInteger := CdCLI;
    Open;
    if IsEmpty and (Entidade.CodigoCLI > 0) then
    Begin
      if not Inserir(CdCLICNC,CdCLI,0,0,0,0,
          0,0,0,0(*Renda*),0,'','','','','','',False,False,0) then
        Exit;
      Close;
      ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
      ParamByName('CLI_CODIGO').asInteger := CdCLI;
      Open;
    end;
  end;

  if Informacoes1.Proibido then
  Begin
    if MessageDlg('Cliente Bloqueado!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8920)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=11;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(8920)) < 0)then
          begin
            free;
            raise Exception.Create('O usu�rio n�o tem permiss�o para vender a Cliente Bloqueado!');
          end
          else
            DM.Usuario1.GeraLog(8920, CdCNC, CdPDV,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE BLOQUEADO');
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
      DM.Usuario1.GeraLog(8920, CdCNC, CdPDV,
        ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE BLOQUEADO');
  end;

  iOpcaoFin     := 0;
  iGerarTitulos := 1;

  if (DM.Configuracao1.Empresa = empHOPE) and
     (CLiente1.Convenio > 0) then
  Begin
    Application.CreateForm(TfMxFinalizaPedido, fMxFinalizaPedido);
    with fMxFinalizaPedido do
    Begin
      Tag:=0;
      iCdCLI    := CdCLI;
      iCdCLICNC := CdCLICNC;
      rdbPrePago.Enabled := False;
      rdbRemessa.Enabled := False;
      ShowModal;
      if iOpcaoEscolhida < 0 then
        Raise exception.Create('Opera��o Cancelada!');

      iOpcaoFin := iOpcaoEscolhida;
    end;

    if iOpcaoFin in [0,3] then  //Normal ou Pr�-Paga
      iGerarTitulos := 1
    else                              //Faturamento Pendente
      iGerarTitulos := 0;

    if iOpcaoFin = 1 then //Pendente
    Begin
      Titulo_receber5.Close;
      Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger := Cliente1.ConvenioCNC;
      Titulo_receber5.ParamByName('CLI_CODIGO').asInteger  := Cliente1.Convenio;
      Titulo_receber5.ParamByName('DATA').asDate           := DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente;
      Titulo_receber5.Open;
      if not Titulo_receber5.IsEmpty then
        Raise exception.Create('Conv�nio inadiplente!');

      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT SUM(ROUND(IPV_QUANTIDADE*IPV_PRECO_DESC,2)) AS TOTAL '+
          ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE P1.PDV_TIPO_VENDA=1 '+ //Pendente
          ' AND P1.FPE_CODIGO=0 '+       //N�o processado
          ' AND P1.PDV_SITUACAO=4 '+     //Finalizado
          ' AND P1.CNC_CLIENTE='+IntToStr(CdCLICNC)+
          ' AND P1.CLI_CODIGO='+IntToStr(CdCLI)+
          ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
          ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
        Open;
        if Arredonda(Informacoes1.LimiteCreditoConvenio) < Arredonda(FieldByName('TOTAL').asFloat+Entidade.Total) then
          Raise exception.Create('Verificar Limite de Cr�dito de conv�nio!');
      end;
    end;
  end;

  if (iOpcaoFin <> 1) and //Dif. Faturamento Pendente
     (StrToInt(edtCodigoCLI.Text) <> DM.Configuracao1.CodigoCliAVista) and
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
          DigCdPDVCNC := CdCNC;
          DigCdPDV    := CdPDV;
          DigCdCLICNC := CdCLICNC;
          DigCdCLI    := CdCLI;
          DigiTipoPendencia := 7; //Lib. Venda SPC
          onClose:=nil;
          Tag:=11;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0)then
            begin
              free;
              raise Exception.Create('O usu�rio n�o tem permiss�o para vender a Cliente no SPC!');
            end
            else
            Begin
              if DigCdPEN > 0 then
                ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                  ' PEN_SITUACAO=3 '+ //Processado
                  ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                  ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                  ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                  ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                  ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
              DM.Usuario1.GeraLog(8930, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE NO SPC');
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
        DM.Usuario1.GeraLog(8930, CdCNC, CdPDV,
          ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE NO SPC');
    end;
    with Titulo_receber5 do
    Begin
      Close;
      ParamByName('CNC_CLIENTE').asInteger := StrToInt(edtClienteCNC.Text);
      ParamByName('CLI_CODIGO').asInteger  := StrToInt(edtCodigoCLI.Text);
      ParamByName('DATA').asDate           := DM.Configuracao1.Data;
      Open;
    end;
    if not Informacoes1.IsEmpty then
    Begin
      if VerificaInteiroBranco(Cliente1.CGFRG) or
         VerificaCPFCNPJBranco(mskCNPJCPF.Text) then
      Begin
        with DM.Avalista1 do
        Begin
          Close;
          if VerificaInteiroBranco(Cliente1.CGFRG) then
            SQL.Text := 'SELECT * FROM AVALISTA '+
              ' WHERE CNC_CODIGO='+IntToStr(Informacoes1.CodigoCNC)+
              ' AND AVL_CGF_RG="'+Cliente1.CGFRG+'"'
          else
            SQL.Text := 'SELECT * FROM AVALISTA '+
              ' WHERE AVL_CGC_CPF="'+mskCNPJCPF.Text+'"';
          Open;
          if not IsEmpty then
          Begin
            DM.QR_Consultas.Close;
            DM.QR_Consultas.SQL.Text := 'SELECT T1.CLI_CODIGO '+
              ' FROM INFORMACOES_DE_CREDITO T1 '+
              ' WHERE T1.CNC_CODIGO='+IntToStr(CdCLICNC)+
              ' AND T1.AVL_CODIGO='+IntToStr(CodigoAVL)+
              ' AND EXISTS (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
              ' WHERE CNC_CLIENTE=T1.CNC_CODIGO AND CLI_CODIGO=T1.CLI_CODIGO '+
              ' AND TRC_SITUACAO IN (0,1,8,9) AND '+
              ' TRC_VENCIMENTO>"'+MesDia(DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente)+'") ';
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

      if (DM.Configuracao1.Empresa > 2) and
         (Informacoes1.CreditoUtil > Informacoes1.LimiteCredito) and
         (Informacoes1.LimiteCredito > 0) and
         (Forma_de_Pagamento1.Prazo<> '0') and
         (dblTipoPagamento.KeyValue <> 13) then
        Raise Exception.Create('Limite de Cr�dito Ultrapassado!');
    end
    else if (DM.Configuracao1.Empresa <> empPetromax) and (Forma_de_Pagamento1.Prazo<>'0') and
            (dblTipoPagamento.KeyValue <> 13) then
      Raise Exception.Create('Cliente sem Limite de Cr�dito Definido!');

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
          Tag:=11;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0)then
            begin
              free;
              raise Exception.Create('O usu�rio n�o tem permiss�o para vender a Cliente Inadiplente!');
            end
            else
              DM.Usuario1.GeraLog(3790, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' CLI: '+PreencheZero(2,CdCLICNC)+'-'+IntToStr(CdCLI)+' VENDA-CLIENTE INADIPLENTE');
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
          ' CLI: '+PreencheZero(2,CdCLICNC)+'-'+IntToStr(CdCLI)+' VENDA-CLIENTE INADIPLENTE');
    end;
  end;

  sCheques := '';
  if (DM.Configuracao1.Empresa = empEletro) and
     (DM.Usuario1.Mafalda <> 1) and       //N�o � Mafalda
     (dblTipoPagamento.KeyValue = 6) then //Cheque
  Begin
    iQtdTRC := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);
    while True do
    Begin
       sCheques := Trim(InputBox('Entre com a Numera��o dos Cheques', 'Cheques (Ex:003229;008765):', ''));
       if Length(sCheques) = (iQtdTRC * 7 - 1) then
       Begin
         j := 1;
         for i:=1 to Length(sCheques) do
         Begin
           if sCheques[i] = ';' then
             inc(j);
         end;
         if j = iQtdTRC then
           Break;
       end;
       if MessageDlg('Numera��o incorreta!'+#13+
                     'Deseja desistir da Finaliza��o?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin

         exit;
       end;
    end;
    sCheques := '(CHQ:'+sCheques+')';
  end;

  if SB_FinalizarPedido.Enabled then
  Begin
    SB_SalvarPedido.Enabled := False;
    SB_Informacoes.Enabled := False;
    SB_FinalizarPedido.Enabled := False;
  end
  else
    Exit;

  //Verificar dados do Cliente para Compra a Prazo
  if (dblFormaPagamento.KeyValue <> 1) and //Diferente de A Vista
     (dblTipoPagamento.KeyValue <> 13) and //Diferente de Cartao de Credito
     (not VerificaCPFCNPJBranco(Cliente1.CPFCGC)) then
  Begin
    if MessageDlg('Dados do Cliente incompletos!'+#13+
                  'Deseja Continuar?' ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(7350)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=11;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(7350)) < 0)then
          begin
            free;
            raise Exception.Create('O usu�rio n�o tem permiss�o Venda � cliente com dados incompletos!');
          end
          else
            DM.Usuario1.GeraLog(7350, CdCNC, CdPDV,
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
      DM.Usuario1.GeraLog(7350, CdCNC, CdPDV,
        'VENDA-DADOS CLIENTE');
  end;

  If Forma_de_Pagamento1.Prazo[1]='0' then
    iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
  else
    iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);

  //Verificar se tem algum item do Grupo Especial
  vGrupoEspecial := False;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT MAX(GRP_ESPECIAL) AS ESPECIAL '+
      ' FROM GRUPO G1, ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1 '+
      ' WHERE I1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND I1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
      ' AND (I1.TBP_CODIGO=0 OR I1.TBP_CODIGO IS NULL) '+
      ' AND P1.PRD_CODIGO=I1.PRD_CODIGO '+
      ' AND G1.GRP_CODIGO=P1.GRP_CODIGO ';
    Open;
    if FieldByName('ESPECIAL').asInteger = 1 then
      vGrupoEspecial := True;

    if (DM.Configuracao1.Empresa = empEletro) and
       (not AgenteFin1.RecebimentoAVista) and
       (iQtdParcelas > 8) and
       (vGrupoEspecial) then
    Begin
      if MessageDlg('Grupo Especial em mais de 8 parcelas.'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Begin
        SB_SalvarPedido.Enabled    := True;
        SB_Informacoes.Enabled     := True;
        SB_FinalizarPedido.Enabled := True;
        exit;
      end;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8260)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=11;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(8260)) < 0)then
            begin
              free;
              SB_SalvarPedido.Enabled    := True;
              SB_Informacoes.Enabled     := True;
              SB_FinalizarPedido.Enabled := True;
              raise Exception.Create('O usu�rio n�o tem permiss�o para vender grupo especial em mais de 8 parcelas!');
            end
            else
              DM.Usuario1.GeraLog(8260, CdCNC, CdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-GRP.ESP. > 8 PARC.');
          end
          else
          begin
            free;
            SB_SalvarPedido.Enabled    := True;
            SB_Informacoes.Enabled     := True;
            SB_FinalizarPedido.Enabled := True;
            exit;
          end;
          free;
        End;
      end
      else
        DM.Usuario1.GeraLog(8260, CdCNC, CdPDV,
          ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-VENDA-GRP.ESP. > 8 PARC.');
    end;
  end;

  /////////////////////////////////////////////////////////
  //Verifica��o PETROMAX
  if vCentraliza then
  Begin

  end;

  sCodigoCARTAO := '';
{  if dblTipoPagamento.KeyValue = 13 then //Cartao
  Begin
    sCodigoCARTAO := Trim(UpperCase(InputBox('Comprovante de Venda' , 'CV:', '')));
    if Length(sCodigoCARTAO) < 5 then
    Begin
      ShowMessage('Comprovante de Venda (CV) inv�lido!');
      SB_SalvarPedido.Enabled    := True;
      SB_Informacoes.Enabled     := True;
      SB_FinalizarPedido.Enabled := True;
      Exit;
    end;
  end;
}  

  /////////////////////////////////////////////////////////

  CdArquiteto := 0;
  //Sistema de Comiss�o Mudou.
{  if (DM.Configuracao1.Empresa = empEletro) and
     (DM.Usuario1.Mafalda <> 1) then
    if MessageDlg('Vai ter Comiss�o para Montador?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      try
        CdArquiteto := StrToInt(InputBox('Servi�o de Montagem', 'C�digo do Montador:', ''));
      except
        CdArquiteto := 0;
        ShowMessage('C�digo do Montador inv�lido!');
      end;
}

  if (DM.Configuracao1.Empresa = empEletro) and
     (Entidade.Mafalda <> 1) and
     (dblTipoPagamento.KeyValue = 13) then
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
      ' IPV_PRECO_DESC=ROUND(IPV_PRECO_DESC-(IPV_PRECO_DESC*'+VirgPonto(AgenteFin1.Juros)+'/100),2) '+
      ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV));

    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_TOTAL=(SELECT SUM(ROUND(IPV_PRECO_DESC*(IPV_QUANTIDADE-IPV_BONIFICACAO),2)) '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV)+') '+
      ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV));
    Item_Pedido_Venda1.Close;
    Item_Pedido_Venda1.Open;
    SB_SalvarPedidoClick(sender);
  end;

  sDescCredito := '';

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
          if AgenteFin1.RecebimentoAVista then
          Begin
            if (Forma_de_Pagamento1.Prazo[1] = '0') and
               (Forma_de_Pagamento1.Prazo <> '0') then
              SQL.Text:='SELECT  '+
                        ' TRC_SEQUENCIA '+
                        ',TRC_VALOR '+
                        ',TRC_VENCIMENTO '+
                        ',TRC_TIPO_DOC '+
                        ',CCX_CODIGO '+
                        ',CCX_CODIGO_REC '+
                        ',AGF_CODIGO '+
                        ',PDV_CODIGO '+
                        ',CNC_CLIENTE '+
                        ',CLI_CODIGO '+
                        ',TRC_OBSERVACAO '+
                        ' FROM TRCTEMP '+
                        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                        ' AND PDV_CODIGO='+IntToStr(CdPDV)+
                        ' AND TRC_SEQUENCIA="01" '+ //Pegar somente a entrada

                        ' UNION '+

                        ' SELECT '+
                        ' "02" AS TRC_SEQUENCIA '+
                        ','+VirgPonto(Arredonda(Entidade.Total))+' TRC_VALOR '+
                        ',"'+MesDia(DM.Configuracao1.Data+AgenteFin1.DiaPagamento)+'" AS TRC_VENCIMENTO '+
                        ','+IntToStr(DM.Configuracao1.TipoDocumento)+' AS TRC_TIPO_DOC '+
                        ','+IntToStr(DM.Configuracao1.ContRecCli)+' AS CCX_CODIGO '+
                        ','+IntToStr(DM.Configuracao1.ContRecCli)+' AS CCX_CODIGO_REC '+
                        ','+IntToStr(Entidade.CodigoAGF)+' AS AGF_CODIGO '+
                        ','+IntToStr(Entidade.CodigoPDV)+' AS PDV_CODIGO '+
                        ','+IntToStr(Entidade.ClienteCNC)+' AS CNC_CLIENTE '+
                        ','+IntToStr(Entidade.CodigoCLI)+' AS CLI_CODIGO '+
                        ',"" AS TRC_OBSERVACAO '

            else //Gerar uma consulta Vazia
              SQL.Text:='SELECT '+
                        ' "01" AS TRC_SEQUENCIA '+
                        ','+VirgPonto(Arredonda(Entidade.Total))+' TRC_VALOR '+
                        ',"'+DateToStr(DM.Configuracao1.Data+AgenteFin1.DiaPagamento)+'" AS TRC_VENCIMENTO '+
                        ','+IntToStr(DM.Configuracao1.TipoDocumento)+' AS TRC_TIPO_DOC '+
                        ','+IntToStr(DM.Configuracao1.ContRecCli)+' AS CCX_CODIGO '+
                        ','+IntToStr(DM.Configuracao1.ContRecCli)+' AS CCX_CODIGO_REC '+
                        ','+IntToStr(Entidade.CodigoAGF)+' AS AGF_CODIGO '+
                        ','+IntToStr(Entidade.CodigoPDV)+' AS PDV_CODIGO '+
                        ','+IntToStr(Entidade.ClienteCNC)+' AS CNC_CLIENTE '+
                        ','+IntToStr(Entidade.CodigoCLI)+' AS CLI_CODIGO '+
                        ',"" AS TRC_OBSERVACAO ';
          end
          else
          Begin
            SQL.Text:='SELECT * '+
                      ' FROM TRCTEMP '+
                      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                      ' AND PDV_CODIGO='+IntToStr(CdPDV)+
                      ' ORDER BY TRC_VENCIMENTO';
          end;
          Open;
          First;
          if not Titulo_receber3.Active then
            Titulo_receber3.Open;

          SEQ:=1;
          vEntrada := 0;
          While not EOF do
          Begin
            if FieldByName('TRC_VALOR').AsFloat <= 0 then
            Begin
              ShowMessage('Presta��o com valor zerado!');
              Raise exception.Create('');
            end;
            // Cart�o (Petromax) (T�tulo Pago)
            if (dblTipoPagamento.KeyValue = 13) and
               (DM.Configuracao1.Empresa = empPetromax) then
            Begin
              if not Titulo_receber3.Inserir(DM.Configuracao1.CodigoCNC,0,
                 FieldByName('CLI_CODIGO').AsInteger,FieldByName('PDV_CODIGO').AsInteger,
                 FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
                 dblTipoPagamento.KeyValue,FieldByName('TRC_TIPO_DOC').AsInteger,0(*TRF*),0(*Reabertura*),
                 FieldByName('TRC_VENCIMENTO').AsDateTime,DM.Configuracao1.DataHora,
                 0(*DtOrigem*),0(*DtVerificado*),
                 'Cart�o de Cr�dito-AUTO '+FieldByName('TRC_OBSERVACAO').AsString,
                 PreencheZero(2,SEQ),''(*Numero*),sCodigoCARTAO,
                 FieldByName('TRC_VALOR').AsFloat-vEntrada,FieldByName('TRC_VALOR').AsFloat-vEntrada(*Valor Pago*),
                 0(*Cr�dito*),FieldByName('AGF_CODIGO').AsInteger,
                 Cliente1.CodigoCNC,2(*Situacao*),0(*titAnt*),0(*TitOrig*),0(*TipoPedido*),True(*MovCaixa*), False(*CHQDev*)) then
              Begin
                ShowMessage('Falha ao inseir TRC!');
                Raise Exception.Create('');
              end;

              if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,FieldByName('CCX_CODIGO').AsInteger,
                     FieldByName('CCX_CODIGO').AsInteger,DM.Configuracao1.CodigoCAX,
                     FieldByName('TRC_TIPO_PAG').AsInteger,FieldByName('TRC_TIPO_DOC').AsInteger,
                     FieldByName('CNC_CODIGO').AsInteger,0 (*CdCHQCNC*),0 (*CdCHQ*),
                     'Recebimento do t�tulo -AUTO- '+IntToStr(Titulo_receber3.SCodigo),
                     '1' (*Flag*),''(*Numero*),'',
                     PreencheZero(2,SEQ),'C',FieldByName('TRC_VALOR').AsFloat-vEntrada,0(*Desconto*),0(*Juros*),
                     0(*CredCli*),FieldByName('TRC_VALOR').AsFloat-vEntrada(*ValorDoc*),
                     DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Compet�ncia*),
                     0(*DtCheque*),Titulo_receber3.SCodigo,DM.Configuracao1.CodigoCNC,'V') then
              Begin
                ShowMessage('Falha ao Gerar Mov. de Caixa!');
                Raise Exception.Create('');
              end;
            end

            // � Vista c/Dinheiro/Banco
            else if (dblFormaPagamento.KeyValue = 1) and
                    (dblTipoPagamento.KeyValue = 5) then
            Begin
              if (StrToInt(edtCodigoCLI.Text) <> DM.Configuracao1.CodigoCliAVista) and
                 (Cliente1.Credito > 0) then
              Begin
                vValorPagar := Pedido_de_Venda1.Total+Pedido_de_Venda1.Acrescimo-Cliente1.Credito;
                if vValorPagar < 0 then
                  vValorPagar := 0;
                If MessageDlg('O Cliente possui R$ '+format('%.2f',[Cliente1.Credito])+' de Cr�dito!'+#13+#13+
                  'O Cliente ter� que pagar R$ '+format('%.2f',[vValorPagar])+#13+#13+
                  'Deseja utiliz�-lo?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                Begin
                  if Trunc(Cliente1.Credito*100)<=Trunc((FieldByName('TRC_VALOR').AsFloat-vEntrada)*100) then
                    CreditoUtilizado:=Cliente1.Credito
                  else
                    CreditoUtilizado:=(FieldByName('TRC_VALOR').AsFloat-vEntrada);

                  sDescCredito := ' (Credito='+format('%.2f',[CreditoUtilizado])+')';

                  ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
                    ' CLI_CREDITO=(CLI_CREDITO-'+VirgPonto(CreditoUtilizado)+') '+
                    ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
                    ' AND CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC));

                  if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
                      Cliente1.CodigoCNC,Cliente1.CodigoCLI,1003(*Tipo PAG.TRC*),
                      0,0,FieldByName('CNC_CODIGO').AsInteger,
                      FieldByName('PDV_CODIGO').AsInteger,'D',
                      Cliente1.Credito,CreditoUtilizado(*Valor*)) then
                  Begin
                    ShowMessage('Falha ao Gerar Mov. de Cr�dito!');
                    Raise Exception.Create('');
                  end;
                end
                else
                  CreditoUtilizado:=0;
              end;

              if not Titulo_receber3.Inserir(DM.Configuracao1.CodigoCNC,0,
                 FieldByName('CLI_CODIGO').AsInteger,FieldByName('PDV_CODIGO').AsInteger,
                 FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
                 dblTipoPagamento.KeyValue,FieldByName('TRC_TIPO_DOC').AsInteger,0(*TRF*),0(*Reabertura*),
                 FieldByName('TRC_VENCIMENTO').AsDateTime,DM.Configuracao1.Data,0(*DtOrig*),
                 0(*DtVerificado*),'� VISTA-AUTO '+FieldByName('TRC_OBSERVACAO').AsString,
                 PreencheZero(2,SEQ),''(*Numero*),sCodigoCARTAO,
                 FieldByName('TRC_VALOR').AsFloat-vEntrada,
                 FieldByName('TRC_VALOR').AsFloat-vEntrada-CreditoUtilizado,CreditoUtilizado,
                 FieldByName('AGF_CODIGO').AsInteger,Cliente1.CodigoCNC,2(*Situacao*),
                 0(*TitAnt*),0(*TitOrig*),0(*TipoPedido*),True(*MovCaixa*), False(*CHQDev*)) then
              Begin
                ShowMessage('Falha ao Gerar Mov. de Caixa!');
                Raise Exception.Create('');
              end;

              if CreditoUtilizado = 0 then
              Begin
                if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,FieldByName('CCX_CODIGO').AsInteger,
                       FieldByName('CCX_CODIGO').AsInteger,DM.Configuracao1.CodigoCAX,
                       FieldByName('TRC_TIPO_PAG').AsInteger,FieldByName('TRC_TIPO_DOC').AsInteger,
                       FieldByName('CNC_CODIGO').AsInteger,0 (*CdCHQCNC*),0 (*CdCHQ*),
                       'Recebimento do t�tulo -AUTO- '+IntToStr(Titulo_receber3.SCodigo),
                       '1' (*Flag*),''(*Numero*),'',
                       PreencheZero(2,SEQ),'C',FieldByName('TRC_VALOR').AsFloat-vEntrada,0(*Desconto*),0(*Juros*),
                       CreditoUtilizado(*CredCli*),FieldByName('TRC_VALOR').AsFloat-vEntrada(*ValorDoc*),
                       DM.Configuracao1.DataHora,DM.Configuracao1.Data,0(*DtCheque*),
                       Titulo_receber3.SCodigo,DM.Configuracao1.CodigoCNC,'V') then
                Begin
                  ShowMessage('Falha ao inseir MVC!');
                  Raise Exception.Create('');
                end;
              end
              else
              Begin
                if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,FieldByName('CCX_CODIGO').AsInteger,
                       FieldByName('CCX_CODIGO').AsInteger,DM.Configuracao1.CodigoCAX,
                       FieldByName('TRC_TIPO_PAG').AsInteger,FieldByName('TRC_TIPO_DOC').AsInteger,
                       FieldByName('CNC_CODIGO').AsInteger,0 (*CdCHQCNC*),0 (*CdCHQ*),
                       'Recebimento do t�tulo -AUTO- '+IntToStr(Titulo_receber3.SCodigo)+sDescCredito,
                       '1' (*Flag*),''(*Numero*),''(*OBS*),
                       PreencheZero(2,SEQ),'C',FieldByName('TRC_VALOR').AsFloat-vEntrada-CreditoUtilizado,
                       0(*Desconto*),0(*Juros*),
                       CreditoUtilizado(*CredCli*),FieldByName('TRC_VALOR').AsFloat-vEntrada(*ValorDoc*),
                       DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Compet�ncia*),
                       0(*DtCheque*),Titulo_receber3.SCodigo,DM.Configuracao1.CodigoCNC,'V') then
                Begin
                  ShowMessage('Falha ao inseir TRC!');
                  Raise Exception.Create('');
                end;
              end;
            end
            else if (SEQ = 1) and   //Entrada da Venda com cart�o
                    (dblTipoPagamento.KeyValue = 13) and
                    (Forma_de_Pagamento1.Prazo[1] = '0') and
                    (Forma_de_Pagamento1.Prazo <> '0') then
            Begin
              if not Titulo_receber3.Inserir(DM.Configuracao1.CodigoCNC,0,
                 FieldByName('CLI_CODIGO').AsInteger,FieldByName('PDV_CODIGO').AsInteger,
                 FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
                 5(*TipoPag-Dinheiro*),FieldByName('TRC_TIPO_DOC').AsInteger,0(*TRF*),0(*Reabertura*),
                 FieldByName('TRC_VENCIMENTO').AsDateTime,0(*DtPag*),0(*DtOrig*),0(*DtVerificado*),
                 FieldByName('TRC_OBSERVACAO').AsString,PreencheZero(2,SEQ),
                 ''(*Numero*), ''(*CV*),
                 FieldByName('TRC_VALOR').AsFloat-vEntrada,0(*ValorPag*),
                 0(*Cr�ditoCLI*),FieldByName('AGF_CODIGO').AsInteger,
                 Cliente1.CodigoCNC,0(*Situacao*),0(*TitAnt*),0(*TitOrig*),
                 0(*TipoPedido*),False(*MovCaixa*), False(*CHQDev*)) then
              Begin
                ShowMessage('Falha ao inseir TRC!');
                Raise Exception.Create('');
              end;
            end
            else
            Begin
              if not Titulo_receber3.Inserir(DM.Configuracao1.CodigoCNC,0,
                 FieldByName('CLI_CODIGO').AsInteger,FieldByName('PDV_CODIGO').AsInteger,
                 FieldByName('CCX_CODIGO').AsInteger,FieldByName('CCX_CODIGO_REC').AsInteger,
                 dblTipoPagamento.KeyValue,FieldByName('TRC_TIPO_DOC').AsInteger,0(*TRF*),0(*Reabertura*),
                 FieldByName('TRC_VENCIMENTO').AsDateTime,0(*DtPag*),0(*DtOrig*),0(*DtVerificado*),
                 FieldByName('TRC_OBSERVACAO').AsString,PreencheZero(2,SEQ),
                 ''(*Numero*), sCodigoCARTAO,
                 FieldByName('TRC_VALOR').AsFloat-vEntrada,0(*ValorPag*),
                 0(*Cr�ditoCLI*),FieldByName('AGF_CODIGO').AsInteger,
                 Cliente1.CodigoCNC,0(*Situacao*),0(*TitAnt*),0(*TitOrig*),
                 0(*TipoPedido*),False(*MovCaixa*), False(*CHQDev*)) then
              Begin
                ShowMessage('Falha ao inseir TRC!');
                Raise Exception.Create('');
              end;
            end;
            
            if (AgenteFin1.RecebimentoAVista) and
               (SEQ = 1) then
              vEntrada := FieldByName('TRC_VALOR').AsFloat
            else
              vEntrada := 0;

            SEQ:=SEQ+1;
            Next;
          End;

          //Deletar do arquivo tempor�rio
          Close;
        end;
      end;

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
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
          Item_de_Estoque1.open;
          If Item_de_Estoque1.IsEmpty Then
            Raise exception.Create('Produto sem Item de Estoque!');

          //N�o movimentar Estoque na Eletro Guerra se for para embarcar
          if (Entrega) or (DM.Configuracao1.Empresa <> 1) or
             (DM.Usuario1.Mafalda = 1) then
          Begin
          //Gerar MEC
            If not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,
                CodigoPRD,0(*CdFUN*),361,CdCNC,CdPDV,'S', Quantidade,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, Bonificacao) Then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;
          end;

          //Gerar movimento de estoque f�sico e baixa estoque f�sico
          //para aqueles que forem de entrega imediata e
          //o Local de estoque for o pr�prio centro de custo
          If (Entrega) then // and (LocEst = DM.Configuracao1.CodigoCNC)Then
          Begin
            If not DM.Movimento_Fisico1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoPRD,0(*CdFUN*),
                CodigoCNC,CodigoPDV,361(*Venda*),'S',
                Quantidade, Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Falha ao Gerar Mov. F�sico!');
              Raise Exception.Create('');
            end;

            //Atualizar estoque comercial e excluir Reserva
            if edtDiasOrcamento.Text = '0' then
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
                ',IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(Quantidade)+
                ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
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
          End
          Else
          Begin
            //Gerar os itens de embarque dos que n�o s�o de entrega imediata
            //e se o local de estoque n�o � o centro de custo atual
            //gera o item no centro de custo especificado pelo local de estoque
            Parametro2.Close;
            Parametro2.Open;
            if not DM.Item_de_Embarque1.Active then
              DM.Item_de_Embarque1.Open;
            if not DM.Item_de_Embarque1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoPRD,0,0,
                      CodigoCNC,CodigoIPV,Quantidade,
                      Cliente1.RazaoSocial+' / '+Parametro2.Descricao+' '+Cliente1.Endereco+
                      ' '+Cliente1.Bairro+' / '+Cliente1.Cidade+'-'+Cliente1.Uf,0)  then
            Begin
              ShowMessage('Falha ao inserir Item de Embarque!');
              Raise Exception.Create('');
            end;
            IEB:=DM.Item_de_Embarque1.SCodigo;

            //Eletro Guerra N�o Gerar Movimento, somente tirar da reserva (se for o caso)
            if (DM.Configuracao1.Empresa = empEletro) and
               (DM.Usuario1.Mafalda <> 1) then
            Begin
              if edtDiasOrcamento.Text = '0' then
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(Quantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque1.CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC))
            end
            else
            Begin
              //Atualizar estoque comercial e excluir Reserva
              if edtDiasOrcamento.Text = '0' then
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                  ',IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque1.CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC))
              else
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque1.CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));
            end;
          End;

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
        ',PDV_LISTADO=0 '+
        ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_DT_ENTREGA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',FUN_ARQUITETO='+IntToStr(CdArquiteto)+
        ',PDV_DIAS_RESERV=0 '+
        ',PDV_TIPO_VENDA='+IntToStr(iOpcaoFin)+ // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pr�-Pago
        ',PDV_TITULO_GERADO='+IntToStr(iGerarTitulos)+
        ',PDV_TITULO_GERADO2='+IntToStr(iGerarTitulos)+        
        ',PDV_OBS=PDV_OBS+"'+sCheques+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

      Entidade.GeraLog(1980,CdCNC,CdPDV); //Log Finalizar Pedido

      If FatorFinanceira1.Active then
        FatorFinanceira1.Close;


      With Cliente1 do
      Begin
        //Mudar situacao de cliente
        if Cliente1.Situacao = 0 then
          ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
            ' CLI_SITUACAO=1 '+
            ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
            ' AND CLI_CODIGO='+IntToStr(CdCLI)+
            ' AND CLI_SITUACAO=0 ');

        //Aumentar o cr�dito utilizado do cliente (Diferente de (� Vista ou Cart�o)
        if (Entidade.CodigoFPG <> 1) and (Entidade.TipoPag <> 13) then
        Begin
          ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
            ' ICR_CRED_UTIL='+VirgPonto(Informacoes1.CreditoUtil+Entidade.Total+Entidade.Acrescimo)+
            ',ICR_DT_ULT_CMP="'+MesDiaHora(Entidade.DataHora)+'" '+
            ',ICR_VL_ULT_CMP='+VirgPonto(Entidade.Total+Entidade.Acrescimo)+
            ' WHERE CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC)+
            ' AND CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI));
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

      //Desabilita bot�es
      if (Forma_de_Pagamento1.Prazo<>'0') and (Forma_de_Pagamento1.Prazo<>'') then
        SB_Promissoria.Enabled:=True;

      memResumo.Enabled:=False;

      //Fechar Cupom Fiscal
//      if DM.Configuracao1.DiretoImpFiscal and
//         (NumeroOficial > 0) then
//        DM.ImpFiscalB1.FecharCupomResumido('Dinheiro',DM.ImpFiscalB1.MensagemPromocional);

    except
      ShowMessage('Os dados n�o foram salvos! Anote os c�digos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          SB_SalvarPedido.Enabled := True;
          SB_Informacoes.Enabled := True;
          SB_FinalizarPedido.Enabled := True;
        end;
      Exit;
    end;
  End;

  //Verificar os t�tulos a receber do pedido se n�o foi � vista ou em Cheque
  if ((dblFormaPagamento.KeyValue<>1) or (dblTipoPagamento.KeyValue = 6)) and
     ((dblTipoPagamento.KeyValue <> 13) OR
      (DM.Configuracao1.Empresa = empEletro) or
      (Forma_de_Pagamento1.Prazo[1] = '0')) then //Com Entrada
  Begin
    If MessageDlg('Deseja ver os t�tulos desse Cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      Application.CreateForm(TfMxSRecPed, fMxSRecPed);
      with fMxSRecPed do
      Begin
        Tag :=2;
        edtCodigoCLI.Text     :=  self.edtCodigoCLI.Text;
        edtRazaoSocial.Text   :=  self.edtRazaoSocial.Text;
        mskCNPJ_CPF.Text      :=  self.mskCNPJCPF.Text;
        edtCGF_RG.Text        :=  self.Cliente1.CGFRG;
        edtObservacaoCLI.Text :=  self.Cliente1.OBS;
        Cliente1.Close;
        Cliente1.ParamByName('CNC_CODIGO').AsInteger := self.Entidade.ClienteCNC;
        Cliente1.ParamByName('CLI_CODIGO').AsInteger := self.Entidade.CodigoCLI;
        ShowModal;
      end;
    End;
  end;
  Entidade.Close;
  Entidade.Open;

  if (dblTipoPagamento.KeyValue = 1) then //A vista
  Begin
    if DM.Configuracao1.Empresa = empCreator then
    Begin
      Application.CreateForm(TfMxCalculaTroco, fMxCalculaTroco);
      fMxCalculaTroco.Tag:=0;
      fMxCalculaTroco.edtPago.Text := '0,00';
      fMxCalculaTroco.edtCompra.Text := format('%.2f',[Entidade.Total+Entidade.Acrescimo]);
      fMxCalculaTroco.ShowModal;
    end;
  end;
end;

procedure TfMxPedidoRapido.DescontonoPedido1Click(Sender: TObject);
begin
  if Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('S� � v�lido para pedidos com itens j� cadastrados!');

  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido n�o pode ser alterado!');

  if ((Cliente1.Desconto > 0) OR (Cliente1.VendaAtacado)) then
  Begin
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
    Begin
      ShowMessage('Cliente com Desconto em Cadastro!');
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=11;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
          begin
            free;
            raise Exception.Create('O usu�rio n�o tem permiss�o esse Desconto!');
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
  Application.CreateForm(TfMxDescontoPedido, fMxDescontoPedido);
  with fMxDescontoPedido do
  Begin
    Entidade.Close;
    Entidade.ParamByName('CNC_CODIGO').asInteger := self.Pedido_de_Venda1.CodigoCNC;
    Entidade.ParamByName('PDV_CODIGO').asInteger := self.Pedido_de_Venda1.CodigoPDV;
    Entidade.Open;
    ShowModal;
  end;
end;

procedure TfMxPedidoRapido.Calculadora1Click(Sender: TObject);
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
    ShowMessage('Arquivo <Calc.exe> n�o encontrado!');
end;

procedure TfMxPedidoRapido.Calendrio1Click(Sender: TObject);
begin
  Application.CreateForm(TfMxFeriados, fMxFeriados);
  fMxFeriados.tag:=0;
  fMxFeriados.ShowModal;
end;

procedure TfMxPedidoRapido.SB_ImprimirPedidoClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
  CdCNC, CdPDV : integer;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Fa�a o Pedido primeiro!');
  If not Item_Pedido_Venda1.Active then
    Raise Exception.Create('N�o existem itens a serem impressos!');
  If Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('N�o existem itens a serem impressos!');
  if Entidade.Situacao < 4 then
  Begin
    SB_SalvarPedido.SetFocus;
    SB_SalvarPedidoClick(sender);
  end;
  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;
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
  if DM.Configuracao1.Daruma <> 1 then
  Begin
    Application.CreateForm(Trpt_PedidoVendaItemPDVRed2, rpt_PedidoVendaItemPDVRed2);
    with rpt_PedidoVendaItemPDVRed2 do
    Begin
      if DM.Configuracao1.Empresa = empAndrea then //Meia Folha
        report.Options.PageLength := 32;
      if (DM.Configuracao1.Empresa in [empEletro, empPetromax]) and
         (self.Entidade.mafalda <> 1) then
      Begin
        zrlValorUnit.Enabled := False;
        zrlTotalItem.Enabled := False;
        zrlDescTotalPedido.Enabled := False;
        zrlTotalPedido.Enabled := False;
      end;
      with Pedido_de_Venda1 do
      Begin
        close;
        parambyname('PDV_CODIGO').AsInteger := StrtoInt(self.edtCodigoPDV.text);
        parambyname('CNC_CODIGO').AsInteger := self.Entidade.CodigoCNC;
        open;
        report.Height := report.Height + 2*RecordCount;
      end;
      report.preview;
      Close;
    end;
  end
  else //Daruma
  Begin
    Application.CreateForm(Trpt_PedidoVendaCodigoPreco, rpt_PedidoVendaCodigoPreco);
    rpt_PedidoVendaCodigoPreco.SZRLabel2.Caption:=edtCodigoPDV.Text;
    rpt_PedidoVendaCodigoPreco.SZRLabel3.Caption:=edtDataHora.Text;
    rpt_PedidoVendaCodigoPreco.SZRLabel4.Caption:=format('%.2f',[Pedido_de_Venda1.Total+Pedido_de_Venda1.Acrescimo]);
    if StrToInt(edtDiasOrcamento.Text) > 0 then
      rpt_PedidoVendaCodigoPreco.SZRLabel5.Enabled:=True
    else
      rpt_PedidoVendaCodigoPreco.SZRLabel5.Enabled:=False;
    rpt_PedidoVendaCodigoPreco.report.Preview;
    rpt_PedidoVendaCodigoPreco.Close;
  end;
  //Alterar situa��o de Impresso para impedir excluir itens sem permiss�o
  ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
    ' PDV_IMPRESSO=1 '+
    ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
    ' AND PDV_CODIGO='+IntToStr(CdPDV));

  if (DM.Configuracao1.Empresa <> empHOPE) and
     (SB_FinalizarPedido.Enabled) then
  Begin
    SB_NovoPedClick(sender);
    imgCliente.Picture := nil;
    imgProduto.Picture := nil;
  end;
end;

procedure TfMxPedidoRapido.SB_CancelarPedidoClick(Sender: TObject);
var
  Trans:Boolean;
  aux:TDataSetNotifyEvent;
  CdCNC, CdPDV: integer;
  sAutorizacao: string;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('N�o existe pedido para cancelar!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Voc� n�o pode alterar vendas neste centro de custo.');
  if not (Entidade.situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido n�o pode ser alterado!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Voc� n�o pode alterar vendas neste centro de custo.');

  If MessageDlg('Tem certeza que deseja Cancelar esse Pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV);
    Open;
    If IsEmpty then
    Begin
      try
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND PDV_CODIGO='+edtCodigoPDV.Text);
        Entidade.RegistrarDel(DM.Configuracao1.CodigoCNC, 1860(*PedidoDeVenda*), StrToInt(edtCodigoPDV.text), 'Vazio');
      except
      end;
      SB_NovoPedClick(sender);
      Exit;
    end;
  end;

  // Verifica se o usu�rio que est� logado n�o tem permiss�o para cancelar o pedido
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3500)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      DigCdPDVCNC := CdCNC;
      DigCdPDV := CdPDV;
      DigCdCLICNC := self.Entidade.ClienteCNC;
      DigCdCLI := self.Entidade.CodigoCLI;
      DigiTipoPendencia := 3; //Cancelar Venda
      onClose:=nil;
      Tag:=11;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(3500)) < 0 then
        begin
          free;
          raise Exception.Create('O usu�rio n�o tem permiss�o para cancelar o pedido!');
        end
        else
        Begin
          if DigCdPEN > 0 then
            ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
              ' PEN_SITUACAO=3 '+ //Processado
              ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
              ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
              ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
              ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
              ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
          sAutorizacao := ' AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU);
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
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text);

      //Gerar Log Cancelar PDV
      if not Entidade.GeraLog(3500,DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPDV.Text),sAutorizacao) then
      Begin
        ShowMessage('Falha ao gerar Log!');
        Raise exception.Create('');
      end;
      If DM.Configuracao1.ControleTransacao then
        Commit;

//      try
//        if DM.Configuracao1.DiretoImpFiscal and
//           (NumeroOficial > 0) then
//          DM.ImpFiscalB1.CancelaCupom;
//      except
//      end;

      SB_NovoPedClick(sender);
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados n�o foram salvos! Anote os c�digos e ligue para o suporte');
        end;
    end;
  End;
end;

procedure TfMxPedidoRapido.SB_CupomClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
  vCupomEsp1: Boolean;
begin
  if Sender = CupomEletro1 then
    vCupomEsp1 := True
  else
    vCupomEsp1 := False;

  if not SB_Cupom.Enabled then
    Exit;
  if Entidade.Situacao <> 4 then
    Raise exception.Create('Pedido n�o finalizado!');

  if Entidade.EntregaDeposito and
     (DM.Configuracao1.CodigoCNC <> 11) then //Diferente do Dep�sito
    Raise exception.Create('O Faturamento desse pedido ser� feito no Dep�sito!');

  SB_Cupom.Enabled := False;
  Application.CreateForm(TfMxSNotaCupom, fMxSNotaCupom);
  with fMxSNotaCupom do
  Begin
    Tag:=2;
    Self.CancelarFatura := False;
    if (self.Cliente1.Uf <> DM.Configuracao1.UF) or
       ((not self.Cliente1.PessoaFisica) and (Trim(self.Cliente1.CGFRG) <> '')) then
    Begin
      rdgNota.Checked := True;
      rdgCupom.Enabled := False;
    end
    else
    Begin
      if self.Cliente1.PessoaFisica then //Pessoa F�sica sempre Cupom Primeiro
      Begin
        if DM.Configuracao1.Empresa <> 2 then
        Begin
          ckbManual.Checked := True;
          ckbManual.Enabled := False;
        end;
      end
      else if Trim(self.Cliente1.CGFRG) <> '' then  //Pessoa Jur�dica com CGF Somente Nota
      Begin
        rdgNota.Checked := True;
        rdgCupom.Enabled := False;
      end;
    end;

    CdCNC    := Self.Entidade.CodigoCNC;
    CdPDV    := Self.Entidade.CodigoPDV;
    iCdCNCCli := Self.Entidade.ClienteCNC;
    CdCLI    := Self.Entidade.CodigoCLI;
    CdFPG    := Self.Entidade.CodigoFPG;
    CdTipoPag:= Self.Entidade.TipoPag;
    Entrada  := Self.Entidade.entrada;
    CNPJ_CPF := Self.mskCNPJCPF.Text;
    ReducaoEletro := vCupomEsp1;
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
  dblCodigoFUN.KeyValue := -1;
end;

procedure TfMxPedidoRapido.SB_PromissoriaClick(Sender: TObject);
begin
  Application.CreateForm(TfmxSelProm, fmxSelProm);
  fmxSelProm.tag:=0;
  fmxSelProm.ShowModal;
end;

procedure TfMxPedidoRapido.Calculadora2Click(Sender: TObject);
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
    ShowMessage('Arquivo <Calc.exe> n�o encontrado!');
end;

procedure TfMxPedidoRapido.ObservaoItem1Click(Sender: TObject);
var
  CdCNC, CdIPV: integer;
  sObsItem: string;
begin
  if Item_Pedido_Venda1.IsEmpty or
     (not SB_SalvarPedido.Enabled) then
    Exit
  else
  Begin
    CdCNC := Item_Pedido_Venda1.CodigoCNC;
    CdIPV := Item_Pedido_Venda1.CodigoIPV;

    sObsItem := UpperCase(InputBox('Dados do Item', 'Observa��o:', ''));
    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
      ' IPV_OBSERVACAO="'+sObsItem+'" '+
      ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND IPV_CODIGO='+IntToStr(CdIPV));
    Item_Pedido_Venda1.Close;
    Item_Pedido_Venda1.Open;
    Item_Pedido_Venda1.LocalizarCod(CdIPV, CdCNC);
  end;
end;

procedure TfMxPedidoRapido.CupomEletro1Click(Sender: TObject);
begin
  if (DM.Configuracao1.Empresa = empEletro) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(3650)) > 0) then
  Begin
    if DM.Configuracao1.Empresa = empEletro then
      SB_CupomClick(CupomEletro1);
  end;
end;

procedure TfMxPedidoRapido.edtPrecoDescontoChange(Sender: TObject);
begin
  try
    if not edtDesconto.Focused then
      edtDesconto.Text := Format('%.4f',[100-(StrToFloat(edtPrecoDesconto.Text)/StrToFloat(edtSugestao.Text)*100)]);
  except
  end;
end;

procedure TfMxPedidoRapido.memObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfMxPedidoRapido.SB_AltClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Centro de Custo inv�lido!');
  if Item_Pedido_Venda1.IsEmpty then
    Raise Exception.Create('Selecione o Produto!');
  if Entidade.Situacao = 1 then
    Raise exception.Create('Pedido cancelado!');
  if Entidade.Situacao = 4 then
    Raise exception.Create('Pedido j� foi Entregue!');
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

function TfMxPedidoRapido.RecalcularPrecos:Boolean;
var
  vPrecoUnit, vPrecoSug, vPrecoDes, vTotal, vDesconto, vLimSimples, vLimEspecial, vLimSimplesPrazo, vLimEspecialPrazo: Double;
  vPrecosAlterados, vAlterarPrecos:Boolean;
  CdTBP, iQtdParcelas: integer;
begin
  Result := False;
  vTotal := 0;

  vLimSimples  := DM.Configuracao1.JurosNorm;
  vLimEspecial := DM.Configuracao1.JurosEsp;
  if (DM.Configuracao1.Empresa = empEletro) and
     (AgenteFin1.RecebimentoAVista) then
  Begin
    vLimSimplesPrazo  := DM.Configuracao1.JurosNorm;
    vLimEspecialPrazo := DM.Configuracao1.JurosEsp;
  end
  else
  Begin
    vLimSimplesPrazo  := DM.Configuracao1.LBMDesconto60;
    vLimEspecialPrazo := DM.Configuracao1.LBMJuros60;
  end;

  vPrecosAlterados := False;

  If Forma_de_Pagamento1.Prazo[1]='0' then
    iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
  else
    iQtdParcelas := Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);

  if not Item_Pedido_Venda1.IsEmpty then
  Begin
    Item_Pedido_Venda2.Close;
    Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    Item_Pedido_Venda2.ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
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
          Raise exception.Create('Produto n�o encontrado! '+IntToStr(Item_Pedido_Venda2.CodigoPRD));

        vPrecoUnit     := Arredonda(PrecoVenda); //Pre�o Unit�rio
        vPrecoSug      := Arredonda(PrecoVenda); //Pre�o Sugest�o
        vAlterarPrecos := False;

        //Pre�o em Dolar
        if FieldByName('SGP_PRECO_DOLAR').asInteger = 1 then
        Begin
          with dm.Indexador_Economico1 do
          Begin
            Close;
            ParamByName('IDE_CODIGO').asInteger := 1; //Dolar
            Open;
            if isEmpty or (Taxa = 0) then
            Begin
              Showmessage('N�o foi definido o Pre�o do Dolar!');
              edtCodigoPRD.SetFocus;
              Exit;
            End;
            vPrecoUnit := Arredonda(Taxa*PrecoVenda);
            vPrecoSug  := Arredonda(Taxa*PrecoVenda);
          end;
        end;
      end;

      //Verificar se a Forma de Pagamento exige uma tabela promocional
      if Forma_de_Pagamento1.CodigoTBP > 0 then
        if Item_Pedido_Venda2.CodigoTBP <> Forma_de_Pagamento1.CodigoTBP then
          Raise exception.Create('Forma de Pagamento exige tabela '+IntToStr(Forma_de_Pagamento1.CodigoTBP));

      CdTBP := 0;
      if (DM.Configuracao1.Empresa = empHope) and
         (Produto1.ForaDeLinha) then
      Begin
        CdTBP := 0; //N�o � permitido o usu de tabela de pre�o para produtos Fora de Linha
        vPrecoSug := Arredonda(vPrecoSug*0.5); //Desconto de 50% Fora de Linha
        vLimSimples       := 0;
        vLimEspecial      := 0;
        vLimSimplesPrazo  := 0;
        vLimEspecialPrazo := 0;
      end
      else
      Begin
        if (Item_Pedido_Venda2.CodigoTBP <> 0) then
        Begin
          DM.qr_consultas2.Close;
          DM.qr_consultas2.SQL.Text:='SELECT * '+
            ' FROM ITEM_DE_TABELA_DE_PRECO T1,TABELA_DE_PRECO T2 '+
            ' WHERE T1.TBP_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoTBP)+
            ' AND T1.PRD_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
            ' AND T2.TBP_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
            ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' OR '+sTabelaPrecoCPD+') '+
            ' AND T2.TBP_CODIGO=T1.TBP_CODIGO '+
            ' AND T2.CNC_CODIGO=T1.CNC_CODIGO ';
          DM.qr_consultas2.Open;
          if DM.qr_consultas2.IsEmpty or
             ((not AgenteFin1.RecebimentoAVista) and
              (DM.qr_consultas2.FieldByName('TBP_PRAZO_MEDIO').asInteger < iQtdParcelas)) then //Qtd m�xima de parcelas
            ShowMessage('Um dos Itens est� vinculado a uma Tabela inv�lida ou que passou da Validade!')
          else
          Begin
            if (DM.qr_consultas2.FieldByName('TBP_AGF_EXCLUSIVO').asInteger > 0) and
               (dblCodigoAGF.Text <> '') and
               (DM.qr_consultas2.FieldByName('TBP_AGF_EXCLUSIVO').asInteger <> dblCodigoAGF.KeyValue) then
              ShowMessage('Tabela exclusiva para outro agente financeiro!')
            else
            Begin
              CdTBP             := DM.qr_consultas2.FieldByName('TBP_CODIGO').asInteger;
              vPrecoSug         := DM.qr_consultas2.FieldByName('ITP_PRECO').asFloat;
              vLimSimples       := DM.qr_consultas2.FieldByName('TBP_DESCONTO_SIMPLES').asFloat;
              vLimEspecial      := DM.qr_consultas2.FieldByName('TBP_DESCONTO_ESPECIAL').asFloat;
              if (DM.Configuracao1.Empresa = empEletro) and
                 (AgenteFin1.RecebimentoAVista) then
              Begin
                vLimSimplesPrazo  := DM.qr_consultas2.FieldByName('TBP_DESCONTO_SIMPLES').asFloat;
                vLimEspecialPrazo := DM.qr_consultas2.FieldByName('TBP_DESCONTO_ESPECIAL').asFloat;
              end
              else
              Begin
                vLimSimplesPrazo  := DM.qr_consultas2.FieldByName('TBP_DESCONTO_SIMPLES_PRAZO').asFloat;
                vLimEspecialPrazo := DM.qr_consultas2.FieldByName('TBP_DESCONTO_ESPECIAL_PRAZO').asFloat;
              end;
            end;
          end;
        end;

        if (Forma_de_Pagamento1.Desconto <> 0) and
           ((AgenteFin1.LiberarDescontoFPG) or
            ((DM.Configuracao1.Empresa = empEletro) and
             (Forma_de_Pagamento1.Prazo = '0'))) then
          vPrecoSug := Arredonda(vPrecoSug-vPrecoSug*Forma_de_Pagamento1.Desconto/100);

        if (Cliente1.Desconto > 0) and
           ((Cliente1.VendaAtacado) or
            (Forma_de_Pagamento1.Prazo = '0')) then
        Begin
          vPrecoSug := Arredonda(vPrecoSug-vPrecoSug*Cliente1.Desconto/100);
          vLimSimples       := 0;                                             //Cliente com desconto permite somente
          vLimSimplesPrazo  := 0;                                             //desconto especial
        end;
      end;
      //Os pre�os somente ser�o alterados caso o usu�rio n�o tenha permiss�o
      //para os descontos na forma de pagamento planejada
      vPrecoDes := Arredonda(Item_Pedido_Venda2.PrecoDesc);
      vDesconto := Arredonda(100-(vPrecoDes/vPrecoSug*100));
      // Verifica se o usu�rio tem permiss�o para liberar desconto � prazo
      If (Forma_de_Pagamento1.Prazo = '0') or //A Vista
         (AgenteFin1.RecebimentoAVista) Then  //Financeira
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
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and //Abaixo do M�nimo
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
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3600)) < 0) and //Liberacao Simples-Prazo
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(7370)) < 0) and //Liberacao Especial-Prazo
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then //Liberacao Total
            vAlterarPrecos := True;
        end;
      end;

      if (vAlterarPrecos) and
         (vPrecoDes < vPrecoSug) then
      Begin
        vPrecosAlterados :=True;
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_PRECO='+VirgPonto(vPrecoUnit)+
          ',IPV_PRECO_SUGERIDO='+VirgPonto(vPrecoSug)+
          ',IPV_DESCONTO=0 '+
          ',IPV_PRECO_DESC='+VirgPonto(vPrecoSug)+
          ',TBP_CODIGO='+IntToStr(CdTBP)+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoCNC)+
          ' AND IPV_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoIPV));

        Entidade.GeraLog(6580, Item_Pedido_Venda2.CodigoCNC, Item_Pedido_Venda2.CodigoPDV,
          'IPV:'+IntToStr(Item_Pedido_Venda2.CodigoIPV)+
          ' PRD:'+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' Qtd:'+format('%.2f',[Item_Pedido_Venda2.Quantidade])+
          ' Preco:'+format('%.2f',[vPrecoUnit])+
          ' PrecoDesc:'+format('%.2f',[vPrecoSug])+
          ' Sug: '+format('%.2f',[vPrecoSug]));
        Result := True;
      end
      else if (Item_Pedido_Venda2.PrecoSugerido <> vPrecoSug) or
              (Item_Pedido_Venda2.Preco <> vPrecoUnit) or
              (Item_Pedido_Venda2.Desconto <> vDesconto) or
              (Item_Pedido_Venda2.CodigoTBP <> CdTBP) then
      Begin
        //N�o altera o pre�o de venda final
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_PRECO='+VirgPonto(vPrecoUnit)+
          ',IPV_PRECO_SUGERIDO='+VirgPonto(vPrecoSug)+
          ',IPV_DESCONTO='+VirgPonto(vDesconto)+
          ',TBP_CODIGO='+IntToStr(CdTBP)+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoCNC)+
          ' AND IPV_CODIGO='+IntToStr(Item_Pedido_Venda2.CodigoIPV));

        Entidade.GeraLog(6580, Item_Pedido_Venda2.CodigoCNC, Item_Pedido_Venda2.CodigoPDV,
          'IPV:'+IntToStr(Item_Pedido_Venda2.CodigoIPV)+
          ' PRD:'+IntToStr(Item_Pedido_Venda2.CodigoPRD)+
          ' Qtd:'+format('%.2f',[Item_Pedido_Venda2.Quantidade])+
          ' Preco:'+format('%.2f',[vPrecoUnit])+
          ' PrecoDesc:'+format('%.2f',[vPrecoDes])+
          ' Sug: '+format('%.2f',[vPrecoSug]));
      end;
      vTotal := vTotal + vPrecoDes * Item_Pedido_Venda2.Quantidade;
      if Item_Pedido_Venda2.Bonificacao > 0 then
        vTotal := vTotal - (vPrecoDes * Item_Pedido_Venda2.Bonificacao);

      Item_Pedido_Venda2.Next;
    end;
  end;
  if Entidade.Total <> vTotal then
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_TOTAL='+VirgPonto(vTotal)+
      ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));

  if vPrecosAlterados then
    ShowMessage('Aten��o!!! '+#13+
                'Os pre�os foram atualizados, verifique!');
end;

procedure TfMxPedidoRapido.DetalhePedidoCabClick(Sender: TObject);
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

procedure TfMxPedidoRapido.dbgItensTitleClick(Column: TColumn);
begin
  try
    if Item_Pedido_Venda1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_Pedido_Venda1.SOrdemdoGrid(Item_Pedido_Venda1.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxPedidoRapido.dblTipoPagamentoClick(Sender: TObject);
begin
  Forma_de_Pagamento1.Close;
  Forma_de_Pagamento1.Open;
  dblFormaPagamentoClick(sender);
end;

procedure TfMxPedidoRapido.Forma_de_Pagamento1BeforeOpen(
  DataSet: TDataSet);
begin
  Forma_de_Pagamento1.OnFilterRecord:=Forma_de_Pagamento1FilterRecord;
  Forma_de_Pagamento1.Filtered:=True;
end;

procedure TfMxPedidoRapido.Forma_de_Pagamento1FilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
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

end.
