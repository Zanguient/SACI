unit MxSVendasCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  Variants, AgenteFin, Forma_de_Pagamento, Parametro, SQuery, Vendedor,
  SubGrupo, Grupo, ComCtrls;

type
  TfMxSVendasCliente = class(TForm)
    Panel2: TPanel;
    bitConfirma: TBitBtn;
    bitCancelar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Panel3: TPanel;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    DSGrupo: TDataSource;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    rdgDataCadastro1: TRadioButton;
    rdgDataAlterado: TRadioButton;
    rdgDataEmissao: TRadioButton;
    rdgDataDevolucao: TRadioButton;
    rdgDataEntrega: TRadioButton;
    rdgDataPrevisao: TRadioButton;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    rdgUltimaCompra: TRadioButton;
    PageControl1: TPageControl;
    tbsCabecalho: TTabSheet;
    tbsItens: TTabSheet;
    GroupBox4: TGroupBox;
    rdgPedidoInteiro: TRadioButton;
    rdgQualquerParcela: TRadioButton;
    ckbSomenteInadiplentes: TCheckBox;
    ckbDataOrigemInadiplente: TCheckBox;
    GroupBox5: TGroupBox;
    ckbSomenteAdiplentes: TCheckBox;
    rdgSemParcelas: TRadioButton;
    rdgTodasParcelas: TRadioButton;
    ckbDataOrigemAdiplente: TCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    ckbSituacao: TCheckBox;
    ckbTipoPagamento: TCheckBox;
    ckbCodigoFPG: TCheckBox;
    dblTipoPagamento: TDBLookupComboBox;
    dblCodigoFPG: TDBLookupComboBox;
    ckbCodigoAGF: TCheckBox;
    dblCodigoAGF: TDBLookupComboBox;
    cmbSituacao: TComboBox;
    ckbNumeroNota: TCheckBox;
    edtNumeroNota: TEdit;
    ckbValorTotal: TCheckBox;
    cmbValorTotal: TComboBox;
    edtValorTotal: TEdit;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    cmbAgenteFinanceiro: TComboBox;
    cmbCodigoFPG: TComboBox;
    ckbPacote: TCheckBox;
    edtPacote: TEdit;
    cmbTipoPag: TComboBox;
    ckbDocumento: TCheckBox;
    edtDocumento: TEdit;
    ckbCaixa: TCheckBox;
    edtCaixa: TEdit;
    cmbTipoSituacao: TComboBox;
    ckbTipoPessoa: TCheckBox;
    cmbTipoPessoa: TComboBox;
    ckbConvenio: TCheckBox;
    edtConvenio: TEdit;
    dblTipo: TDBLookupComboBox;
    ckbTipo: TCheckBox;
    tbsApresentacao: TTabSheet;
    GroupBox3: TGroupBox;
    ckbSintetico: TCheckBox;
    ckbExibirParcelas: TCheckBox;
    ckbNaoExibirItens: TCheckBox;
    ckbVendedorPorPagina: TCheckBox;
    ckbSomenteItens: TCheckBox;
    ckbProdutosMaisVendidos: TCheckBox;
    ckbPorFornecedor: TCheckBox;
    ckbSuperSintetico: TCheckBox;
    ckbSaltarLinha: TCheckBox;
    edtQuantidadeMaiores: TEdit;
    ckbMalaDireta: TCheckBox;
    edtArquivoMalaDireta: TEdit;
    GroupBox1: TGroupBox;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbCodigoFOR: TCheckBox;
    edtCodigoFOR: TEdit;
    dblCodigoGRP: TDBLookupComboBox;
    ckbCodigoSGP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoGRP: TCheckBox;
    ckbQuantidadeAcima: TCheckBox;
    ckbEntregaEmbarque: TCheckBox;
    ckbGrupoEspecial: TCheckBox;
    ckbGrupoNorma: TCheckBox;
    edtMarca: TEdit;
    ckbMarca: TCheckBox;
    edtCaracteristica: TEdit;
    ckbCaracteristica: TCheckBox;
    edtObsItem: TEdit;
    ckbObsItem: TCheckBox;
    ckbSomenteLinha: TCheckBox;
    ckbSomenteForaLinha: TCheckBox;
    ckbSomenteCatalogo: TCheckBox;
    ckbReferencia: TCheckBox;
    GroupBox6: TGroupBox;
    ckbVendasSemTitulos: TCheckBox;
    ckbTipoVenda: TCheckBox;
    cmbTipoVenda: TComboBox;
    ckbArquiteto: TCheckBox;
    edtArquiteto: TEdit;
    cmbTipoTipoVenda: TComboBox;
    ckbCodigoFPE: TCheckBox;
    edtCodigoFPE: TEdit;
    dblCodigoVEN: TDBLookupComboBox;
    ckbCodigoVEN: TCheckBox;
    edtReferencia: TEdit;
    ckbCodigoTBP: TCheckBox;
    edtCodigoTBP: TEdit;
    ckbAgrupar: TCheckBox;
    cmbAgrupar: TComboBox;
    ckbAgruparPorCliente: TCheckBox;
    ckbExibirSubGrupo: TCheckBox;
    ckbSomenteBonificados: TCheckBox;
    ckbObservacao: TCheckBox;
    edtObservacao: TEdit;
    ckbCPF: TCheckBox;
    edtCPF: TEdit;
    ckbEspelhoPedido: TCheckBox;
    Vendedor2: TVendedor;
    DSVendedor2: TDataSource;
    dblIndicacao: TDBLookupComboBox;
    ckbIndicacao: TCheckBox;
    ckbGarantia: TCheckBox;
    cmbGarantia: TComboBox;
    edtGarantia: TEdit;
    ckbVendasPorFaturar: TCheckBox;
    ckbVendasFaturadas: TCheckBox;
    ckbLJ3: TCheckBox;
    ckbSomentePDV: TCheckBox;
    ckbSomentePDS: TCheckBox;
    ckbSomentePRD: TCheckBox;
    ckbSomenteSER: TCheckBox;
    ckbLJ4: TCheckBox;
    ckbEntregaDeposito: TCheckBox;
    dblClassificacao: TDBLookupComboBox;
    ckbClassificacao: TCheckBox;
    DSParametro4: TDataSource;
    Parametro4: TParametro;
    ckbDescPRD: TCheckBox;
    edtDescPRD: TEdit;
    Super_Grupo: TQuery;
    Super_GrupoSUG_CODIGO: TIntegerField;
    Super_GrupoSUG_DESCRICAO: TStringField;
    Super_GrupoUSU_CODIGO: TIntegerField;
    Super_GrupoSUG_DT_CADASTRO: TDateTimeField;
    Super_GrupoSUG_DT_ALTERADO: TDateTimeField;
    Super_GrupoSUG_OBS: TStringField;
    Super_GrupoSUG_SITUACAO: TIntegerField;
    dsSuper_Grupo: TDataSource;
    Bevel1: TBevel;
    cbxAguaCheiro: TCheckBox;
    cbxCOO: TCheckBox;
    edtCOO: TEdit;
    cbxCCF: TCheckBox;
    edtCCF: TEdit;
    ckbTotalParcela: TCheckBox;
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbCodigoVENClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitConfirmaClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbTipoPagamentoClick(Sender: TObject);
    procedure ckbCodigoFPGClick(Sender: TObject);
    procedure ckbCodigoAGFClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure ckbNumeroNotaClick(Sender: TObject);
    procedure ckbValorTotalClick(Sender: TObject);
    procedure ckbVendasPorFaturarClick(Sender: TObject);
    procedure ckbVendasFaturadasClick(Sender: TObject);
    procedure ckbSinteticoClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbNaoExibirItensClick(Sender: TObject);
    procedure ckbSomenteItensClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbSomenteAdiplentesClick(Sender: TObject);
    procedure ckbSomenteInadiplentesClick(Sender: TObject);
    procedure ckbProdutosMaisVendidosClick(Sender: TObject);
    procedure ckbLJ3Click(Sender: TObject);
    procedure ckbAgruparClick(Sender: TObject);
    procedure ckbQuantidadeAcimaClick(Sender: TObject);
    procedure ckbArquitetoClick(Sender: TObject);
    procedure ckbTipoVendaClick(Sender: TObject);
    procedure ckbGrupoEspecialClick(Sender: TObject);
    procedure ckbGrupoNormaClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure SubGrupo1BeforeOpen(DataSet: TDataSet);
    procedure ckbSomentePDVClick(Sender: TObject);
    procedure ckbSomentePDSClick(Sender: TObject);
    procedure ckbPacoteClick(Sender: TObject);
    procedure ckbDocumentoClick(Sender: TObject);
    procedure ckbCaixaClick(Sender: TObject);
    procedure ckbMarcaClick(Sender: TObject);
    procedure ckbCaracteristicaClick(Sender: TObject);
    procedure ckbObsItemClick(Sender: TObject);
    procedure ckbSomentePRDClick(Sender: TObject);
    procedure ckbSomenteSERClick(Sender: TObject);
    procedure ckbExibirSubGrupoClick(Sender: TObject);
    procedure ckbPorFornecedorClick(Sender: TObject);
    procedure ckbCodigoFPEClick(Sender: TObject);
    procedure cmbSituacaoChange(Sender: TObject);
    procedure ckbSomenteLinhaClick(Sender: TObject);
    procedure ckbSomenteForaLinhaClick(Sender: TObject);
    procedure ckbMalaDiretaClick(Sender: TObject);
    procedure ckbTipoPessoaClick(Sender: TObject);
    procedure ckbConvenioClick(Sender: TObject);
    procedure rdgDataPrevisaoClick(Sender: TObject);
    procedure ckbTipoClick(Sender: TObject);
    procedure ckbLJ4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure ckbCodigoTBPClick(Sender: TObject);
    procedure ckbObservacaoClick(Sender: TObject);
    procedure ckbCPFClick(Sender: TObject);
    procedure ckbEspelhoPedidoClick(Sender: TObject);
    procedure ckbIndicacaoClick(Sender: TObject);
    procedure ckbGarantiaClick(Sender: TObject);
    procedure ckbClassificacaoClick(Sender: TObject);
    procedure ckbDescPRDClick(Sender: TObject);
    procedure cbxCOOClick(Sender: TObject);
    procedure cbxCCFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSVendasCliente: TfMxSVendasCliente;

implementation

uses UDM, UVendasCliente, funcoes, MxSPediProd, CdCliente, MxSCotaFor,
  UVendasClienteProduto, MxGraficoProdutosMaisVendidos,
  UPreferencia_Cliente, MxSPediProdMotCal, UPedidoServicoCompleto,
  UPedidoServicoLBM, UPedidoVendaMotical, UPedidoServicoLBMEsp;

{$R *.DFM}

procedure TfMxSVendasCliente.ckbCodigoCLIClick(Sender: TObject);
begin
  if ckbCodigoCLI.Checked then
  Begin
    edtCodigoCLI.Color:=clWindow;
    edtCodigoCLI.Enabled:=True;
    try
      edtCodigoCLI.SetFocus;
    except
    end;
  end
  else
  Begin
    edtCodigoCLI.Color:=AlteraCorComponentes;
    edtCodigoCLI.Text:='';
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.Enabled:=True;
    try
      edtCodigoPRD.SetFocus;
    except
    end;
  end
  else
  Begin
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Clear;
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbCodigoVENClick(Sender: TObject);
begin
  if ckbCodigoVEN.Checked then
  Begin
    Vendedor1.Close;
    Vendedor1.SQL.Text := 'SELECT * FROM FUNCIONARIO '+
      ' WHERE (FUN_APARECE_VENDAS=1 '+
      '  OR FUN_APARECE_SERVICOS=1) '+
      ' AND FUN_SITUACAO<>1 ';

    if ckbCodigoCNC.Checked then
      Vendedor1.SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
        '  OR  FUN_TODOS_CENTROS=1) ');

    Vendedor1.SQL.ADD(' ORDER BY FUN_APELIDO ASC');
    Vendedor1.Open;
    dblCodigoVEN.Color:=clWindow;
    dblCodigoVEN.Enabled:=True;
    dblCodigoVEN.KeyValue:=Vendedor1.CodigoFUN;
    try
      dblCodigoVEN.SetFocus;
    except
    end;      
  end
  else
  Begin
    Vendedor1.Close;
    dblCodigoVEN.Color:=AlteraCorComponentes;
    dblCodigoVEN.KeyValue:=-1;
    dblCodigoVEN.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if not (DM.Configuracao1.Empresa IN [empEletro, empLBM, empPetromax]) then
  Begin
    ckbCodigoCNC.Checked := True;
    ckbArquiteto.Enabled := False;
  end;

  if DM.Configuracao1.Empresa = empLuciano then
  Begin
    ckbExibirParcelas.Checked := True;
  end
  else
  Begin
    ckbSintetico.Checked := True;
    ckbNaoExibirItens.Checked := True;
  end;

  if (DM.Configuracao1.Empresa in [empEletro, empMotical]) then
    ckbCodigoCNC.Checked := True;
  ckbSituacao.Checked:=True;

  if tag = 1 then //Gráfico Mais Vendidos
  Begin
    ckbSintetico.Checked := True;
    ckbSintetico.Enabled := False;
    ckbNaoExibirItens.Enabled := False;
    ckbSomenteItens.Checked := True;
    ckbSomenteItens.Enabled := False;
    ckbProdutosMaisVendidos.Checked := True;
    ckbProdutosMaisVendidos.Enabled := False;
    if DM.Configuracao1.Empresa IN [empEletro,empPetromax] then
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
        ' IPV_PRECO_DESC=IPV_PRECO '+
        ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE ((IPV_PRECO_DESC IS NULL) OR (IPV_PRECO_DESC=0))');
  end;
  if tag = 2 then //Preferencias
  Begin
    ckbExibirParcelas.checked:=false;
    ckbExibirParcelas.Enabled:=false;
    ckbSintetico.checked:=false;
    ckbSintetico.enabled:=false;
    ckbNaoExibirItens.checked:=false;
    ckbNaoExibirItens.enabled:=false;
    ckbProdutosMaisVendidos.checked:=false;
    ckbSaltarLinha.checked:=false;
    ckbVendedorPorPagina.checked:=false;
    ckbSomenteItens.checked:=false;
    ckbPorFornecedor.checked:=false;
    GroupBox3.Enabled:=false;
  end;
  try
    mskDataINI.SetFocus;
  except
  end;

  if (DM.Configuracao1.Empresa = empLuciano) and (DM.Configuracao1.CodigoCNC = 3) then
    cbxAguaCheiro.Visible := true
  else
    cbxAguaCheiro.Visible := false;


  ckbCodigoGRP.Enabled := true;

  Grupo1.Close;
  Grupo1.SQL.Text := 'SELECT * FROM GRUPO ' +
  ' ORDER BY GRP_DESCRICAO ';

end;

procedure TfMxSVendasCliente.bitConfirmaClick(Sender: TObject);
var
  mensagem,CdSUG,CdSGP,CdGRP,CNC,DescPRD,PRD,sRef,CdFOR,CdTBP,CLI,sCPF,sConvenio,sTipoPessoa,
    sTipoCliente,sClassificacao,FUN,PDV,SIT,TPG,FPG,AGF,NTF,Valor,CdFPE,
    Group,DataINI,DataFIM,AcimaNormal, Devedor, CdArquiteto, sOrdem,
    sEntregaEmbarque, sVendasSemTitulos, sTipoVenda, sGrupoEspecial,
    sSomentePDV, sPacote, sMaisVendidos, sDocumento,sCaixa,
    sMarca,sCaracteristica,sOBSItem,sSomentePRDSER,sSomenteBonus,sSomenteLinha,
    sTop,sSomenteCatalogo,sEntregaDeposito,sObs,sServico,CdIndicacao,sGarantia,sFiltros:string;

  sDescricao, sRegistro, sCodigoBarras, sDetalhe, sReferencia: string;
  vData: TDateTime;
  vCompra, vQtd, vBonificacao, vValorVenda, vValorCompra: Double;
  iPRD, iQtdRegistros: integer;
  Arq: TextFile;
  vMultiplosDetalhes: Boolean;

  COO, CCF: string;
begin
  COO        := '';
  CCF        := '';
  sFiltros   :='';
  sTop       :='';
  CNC        :='';
  DescPRD    :='';
  PRD        :='';
  CdTBP      :='';
  sReferencia:='';
  CdFOR      :='';
  CLI        :='';
  sConvenio  :='';
  sTipoPessoa:='';
  sTipoCliente:='';
  sClassificacao:='';
  sDocumento :='';
  sCaixa     :='';
  FUN        :='';
  sSomentePRDSER := '';
  PDV        :='';
  sPacote    :='';
  SIT        :='';
  TPG        :='';
  FPG        :='';
  AGF        :='';
  NTF        :='';
  Valor      :='';
  AcimaNormal:='';
  Devedor    :='';
  sMarca     :='';
  sOBS       :='';
  sOBSItem   :='';
  sCaracteristica :='';
  sSomenteLinha := '';
  sSomenteCatalogo := '';
  sMaisVendidos := '';
  sEntregaEmbarque := '';
  sVendasSemTitulos := '';
  sSomentePDV := '';
  sGrupoEspecial := '';
  sSomenteBonus := '';
  CdFPE := '';
  sEntregaDeposito := '';
  sGarantia := '';
  Group      :='';
  CdSUG      :='';
  
  if DM.Configuracao1.Empresa <> empLBM then
    sOrdem      :=' T1.CNC_CODIGO,T1.PDV_CODIGO ASC'
  else
    sOrdem      :=' T1.CNC_CODIGO,T1.PDV_CODIGO ASC';
  mensagem   :='';
  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;

  if not VerificaDataBranco(mskDataINI.Text)then
    DataINI := ''
  else if rdgDataAlterado.Checked then
    DataINI := ' AND (T2.PDV_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") '
  else if rdgDataCadastro1.Checked then
    DataINI := ' AND (T2.PDV_DATA_HORA>="'+MesDia(mskDataINI.Text)+'") '
  else if rdgDataEmissao.Checked then
    DataINI := ' AND (T2.PDV_DT_EMISSAO_VENDA>="'+MesDia(mskDataINI.Text)+'") '
  else if rdgDataDevolucao.Checked then
    DataINI := ' AND (T2.PDV_DT_DEVOLUCAO>="'+MesDia(mskDataINI.Text)+'") '
  else if rdgDataEntrega.Checked then
    DataINI := ' AND (T2.PDV_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'") '
  else if rdgDataPrevisao.Checked then
    DataINI := ' AND (T2.PDV_DT_PREVISAO>="'+MesDia(mskDataINI.Text)+'") '
  else if rdgUltimaCompra.Checked then
    DataFIM := ' AND ((SELECT TOP 1 P9.PDV_DATA_HORA FROM PEDIDO_DE_VENDA P9 WHERE P9.PDV_SITUACAO=4 AND P9.CLI_CODIGO=T2.CLI_CODIGO ORDER BY P9.PDV_DATA_HORA DESC) IS NOT NULL) '+
               ' AND ((SELECT TOP 1 P9.PDV_DATA_HORA FROM PEDIDO_DE_VENDA P9 WHERE P9.PDV_SITUACAO=4 AND P9.CLI_CODIGO=T2.CLI_CODIGO ORDER BY P9.PDV_DATA_HORA DESC) >="'+MesDia(mskDataFIM.Text)+'") ';



  if not VerificaDataBranco(mskDataFIM.Text)then
    DataFIM := ''
  else if rdgDataAlterado.Checked then
    DataFIM := ' AND (T2.PDV_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else if rdgDataCadastro1.Checked then
    DataFIM := ' AND (T2.PDV_DATA_HORA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else if rdgDataEmissao.Checked then
    DataFIM := ' AND (T2.PDV_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else if rdgDataDevolucao.Checked then
    DataFIM := ' AND (T2.PDV_DT_DEVOLUCAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else if rdgDataEntrega.Checked then
    DataFIM := ' AND (T2.PDV_DT_ENTREGA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else if rdgDataPrevisao.Checked then
    DataFIM := ' AND (T2.PDV_DT_PREVISAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else if rdgUltimaCompra.Checked then
    DataFIM := ' AND ((SELECT TOP 1 P9.PDV_DATA_HORA FROM PEDIDO_DE_VENDA P9 WHERE P9.PDV_SITUACAO=4 AND P9.CLI_CODIGO=T2.CLI_CODIGO ORDER BY P9.PDV_DATA_HORA DESC) <"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

  if mensagem<>'' then
    raise exception.Create(mensagem);

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      try
        edtCodigoCLI.SetFocus;
      except
      end;
      raise Exception.Create('Código do Cliente inválido!');
    end
    else
    Begin
      CLI:=' AND T2.CLI_CODIGO='+edtCodigoCLI.Text+' ';
      sFiltros := sFiltros + '(CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbConvenio.Checked then
  begin
    if not VerificaInteiroBranco(edtConvenio.Text) then
    Begin
      try
        edtConvenio.SetFocus;
      except
      end;
      raise Exception.Create('Código do Convênio inválido!');
    end
    else
    Begin
      sConvenio:= ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE CLI_CONVENIO='+edtConvenio.Text+') ';
      //Para visualizar somente vendas do convênio escolher a opção Tipo de Venda: Pendente
      sFiltros := sFiltros + '(Convenio:'+edtConvenio.Text+')';
    end;
  end;

  //Filtrar Tipo Pessoa
  if ckbTipoPessoa.Checked then
    if cmbTipoPessoa.ItemIndex = 0 then
    Begin
      STipoPessoa := ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE CLI_PESSOA_FISICA=1) ';
      sFiltros := sFiltros + '(P.Fisico)';
    end
    else if cmbTipoPessoa.ItemIndex = 1 then
    Begin
      sTipoPessoa := ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE CLI_PESSOA_FISICA=0) ';
      sFiltros := sFiltros + '(P.Juridica)';
    end
    else
    Begin
      sTipoPessoa := ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE CLI_VENDA_ATACADO=1) ';
      sFiltros := sFiltros + '(Atacado)';
    end;

  if ckbTipo.Checked then
    if dblTipo.Text = '' then
    Begin
      sTipoCliente := ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE (CLI_TIPO=0 OR CLI_TIPO IS NULL)) ';
      sFiltros := sFiltros + '(Tipo=0)';
    end
    else
    Begin
      sTipoCliente := ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE CLI_TIPO='+IntToStr(dblTipo.KeyValue)+') ';
      sFiltros := sFiltros + '(Tipo='+dblTipo.Text+')';
    end;

  if ckbClassificacao.Checked then
  begin
    if dblClassificacao.Text = '' then
    Begin
      sClassificacao := ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE (CLI_CLASSIFICACAO=0 OR CLI_CLASSIFICACAO IS NULL)) ';
      sFiltros := sFiltros + '(Class=0)';
    end
    else
    Begin
      sClassificacao := ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE CLI_CLASSIFICACAO='+IntToStr(dblClassificacao.KeyValue)+') ';
      sFiltros := sFiltros + '(Class='+dblClassificacao.Text+')';
    end;
  end;
  if ckbCPF.Checked then
  Begin
    edtCPF.Text := RetiraMascara(edtCPF.Text);
    sCPF := ' AND EXISTS (SELECT TOP 1 CLI_CODIGO '+
      ' FROM CLIENTE '+
      ' WHERE CLI_CODIGO=T2.CLI_CODIGO '+
      ' AND CNC_CODIGO=T2.CNC_CLIENTE '+
      ' AND CLI_CGC_CPF LIKE "%'+edtCPF.Text+'%") ';
    sFiltros := sFiltros + '(CPF:'+edtCPF.Text+')';
  end;

  if ckbDocumento.Checked then
    if not VerificaInteiroBranco(edtDocumento.Text) then
    Begin
      try
        edtDocumento.SetFocus;
      except
      end;
      raise Exception.Create('Documento inválido!');
    end
    else
    Begin
      sDocumento:=' AND (T2.PDV_DOCUMENTO LIKE "%'+edtDocumento.Text+'%") ';
      sFiltros := sFiltros + '(Documento:'+edtDocumento.Text+')';
    end;

  if ckbCaixa.Checked then
    if not VerificaInteiroBranco(edtCaixa.Text) then
    Begin
      try
        edtCaixa.SetFocus;
      except
      end;
      raise Exception.Create('Caixa inválida!');
    end
    else
    Begin
      sCaixa:=' AND (T2.PDV_CAIXA LIKE "%'+edtCaixa.Text+'%") ';
      sFiltros := sFiltros + '(Caixa:'+edtCaixa.Text+')';
    end;

  if ckbCodigoPRD.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Begin
      try
        edtCodigoPRD.SetFocus;
      except
      end;
      raise Exception.Create('Código do produto inválido!');
    end
    else
    Begin
      PRD:=' AND T1.PRD_CODIGO='+edtCodigoPRD.Text;
      sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;
  end;

  if ckbCodigoTBP.Checked then
  Begin
    if not VerificaInteiro(edtCodigoTBP.Text) then
    Begin
      try
        edtCodigoTBP.SetFocus;
      except
      end;
      raise Exception.Create('Código da Tabela inválido!');
    end
    else if not VerificaInteiroBranco(edtCodigoTBP.Text) then
    Begin
      CdTBP:=' AND T1.TBP_CODIGO>0 ';
      sFiltros := sFiltros + '(TBP:>0)';
    end
    else
    Begin
      CdTBP:=' AND T1.TBP_CODIGO='+edtCodigoTBP.Text;
      sFiltros := sFiltros + '(TBP:'+edtCodigoTBP.Text+')';
    end;
  end;

  if ckbReferencia.Checked then
  Begin
    sReferencia:=' AND EXISTS (SELECT TOP 1 PRD_CODIGO '+
      ' FROM PRODUTO PRD1 '+
      ' WHERE T1.PRD_CODIGO=PRD1.PRD_CODIGO '+
      ' AND PRD1.PRD_REFERENCIA LIKE "%'+edtReferencia.Text+'%") ';
    sFiltros := sFiltros + '(Ref.:'+edtReferencia.Text+')';
  end;

  if ckbObsItem.Checked then
  Begin
    if edtObsItem.Text = '' then
      sObsItem := ' AND (T1.IPV_OBSERVACAO="") '
    else
      sObsItem := ' AND (T1.IPV_OBSERVACAO LIKE "%'+edtObsItem.Text+'%") ';
    sFiltros := sFiltros + '(ObsItem='+edtObsItem.Text+')';
  end;

  //Será integrado na consulta abaixo e não na consulta principal
  if ckbMarca.Checked then
  Begin
    sMarca := ' AND (T5.PRD_MARCA LIKE "%'+edtMarca.Text+'%") ';
    sFiltros := sFiltros + '(Marca='+edtMarca.Text+')';
  end;

  //Alan - Filtro Descricao do Produto
  if ckbDescPRD.Checked then
  begin
    if edtDescPRD.Text = '' then
    begin
      raise Exception.Create('Descrição do Produto inválido!');
      edtDescPRD.SetFocus;
    end
    else
    Begin
      DescPRD:=' AND (T5.PRD_DESCRICAO LIKE "%'+edtDescPRD.Text+'%") ';
      sFiltros := sFiltros + '(Desc. PRD:'+edtDescPRD.Text+')';
    end;
  end;

  //Será integrado na consulta abaixo e não na consulta principal
  if ckbCaracteristica.Checked then
  Begin
    sCaracteristica := ' AND (T5.PRD_CARACTERISTICA LIKE "%'+edtCaracteristica.Text+'%") ';
    sFiltros := sFiltros + '(Caracteristica='+edtCaracteristica.Text+')';
  end;

  if ckbSomenteLinha.Checked then
  Begin
    sSomenteLinha := ' AND (T5.PRD_FORA_DE_LINHA=0 OR T5.PRD_FORA_DE_LINHA IS NULL) ';
    sFiltros := sFiltros + '(Linha)';
  end
  else if ckbSomenteForaLinha.Checked then
  Begin
    sSomenteLinha := ' AND T5.PRD_FORA_DE_LINHA=1 ';
    sFiltros := sFiltros + '(ForaLinha)';
  end;

  if ckbSomenteCatalogo.Checked then
  Begin
    sSomenteCatalogo := ' AND (T5.PRD_CATALOGO=1) ';
    sFiltros := sFiltros + '(Catalogo)';
  end;

  //Será integrado na consulta abaixo e não na consulta principal
  if ckbCodigoSGP.Checked then
  Begin
    if dblCodigoSGP.Text = '' then
      Raise Exception.Create('SubGrupo inválido!');
    CdSGP := ' AND T5.SGP_CODIGO='+IntToStr(dblCodigoSGP.KeyValue)+' ';
    sFiltros := sFiltros + '(SGP='+dblCodigoSGP.Text+')';
  end;

  //Será integrado na consulta abaixo e não na consulta principal
  if ckbCodigoGRP.Checked then
  Begin
    if dblCodigoGRP.Text = '' then
      Raise Exception.Create('Grupo inválido!');
    CdGRP := ' AND T5.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+' ';
    sFiltros := sFiltros + '(GRP='+dblCodigoGRP.Text+')';
  end;

  if ckbCodigoFOR.Checked then //Fornecedor
  Begin
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
    Begin
      try
        edtCodigoFOR.SetFocus;
      except
      end;
      raise Exception.Create('Código do Fornecedor inválido!');
    end;
    CdFOR:=' AND (T1.PRD_CODIGO IN (SELECT T5.PRD_CODIGO FROM PRODUTO T5 '+
      ' WHERE T5.FOR_CODIGO='+edtCodigoFOR.Text+
      CdGRP+CdSGP+sMarca+sCaracteristica+sSomenteLinha+sSomenteCatalogo+')) ';
    sFiltros := sFiltros + '(FOR='+edtCodigoFOR.Text+')';
  end
  else if ckbCodigoGRP.Checked or
       ckbCodigoSGP.Checked or
       ckbMarca.Checked or
       ckbCaracteristica.Checked or
       ckbSomenteLinha.Checked or
       ckbSomenteForaLinha.Checked or
       ckbSomenteCatalogo.Checked then
    CdFOR:=' AND (T1.PRD_CODIGO IN (SELECT T5.PRD_CODIGO FROM PRODUTO T5 '+
      ' WHERE T5.PRD_CODIGO<>0 '+
      CdGRP+CdSGP+DescPRD+sMarca+sCaracteristica+sSomenteLinha+sSomenteCatalogo+')) ';
      //Alan - Acrescentado DescPRD
  if ckbCodigoVEN.Checked then
  Begin
    if not (dblCodigoVEN.KeyValue > 0) then
    Begin
      try
        dblCodigoVEN.SetFocus;
      except
      end;
      raise Exception.Create('Vendedor(a) inválido(a)!');
    end
    else
      FUN:=' AND T1.FUN_CODIGO='+IntToStr(dblCodigoVEN.KeyValue);
    sFiltros := sFiltros + '(VEN:'+IntToStr(dblCodigoVEN.KeyValue)+')';
  end;

  if ckbSomentePRD.Checked then
  Begin
    sSomentePRDSER := ' AND T1.PRD_CODIGO NOT IN (SELECT PRD_CODIGO FROM PRODUTO '+
      ' WHERE PRD_SERVICO=1) ';
    sFiltros := sFiltros + '(PRD)';
  end
  else if ckbSomenteSER.Checked then
  Begin
    sSomentePRDSER := ' AND T1.PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO '+
      ' WHERE PRD_SERVICO=1) ';
    sFiltros := sFiltros + '(SER)';
  end;

  if ckbArquiteto.Checked then
  Begin
    if not VerificaInteiro(edtArquiteto.Text) then
      Raise exception.Create('Código do Arquiteto/Projetista/Montador inválido!')
    else if (Trim(edtArquiteto.Text) <> '') then
      CdArquiteto:=' AND T2.FUN_ARQUITETO='+edtArquiteto.Text
    else
      CdArquiteto:=' AND T2.FUN_ARQUITETO>0 ';
    sFiltros := sFiltros + '(ARQ/MONT:'+edtArquiteto.Text+')';
  end;

  if ckbCodigoPDV.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Begin
      try
        edtCodigoPDV.SetFocus;
      except
      end;
      raise Exception.Create('Código do pedido inválido!');
    end
    else
      PDV:=' AND T1.PDV_CODIGO='+edtCodigoPDV.Text;
    sFiltros := sFiltros + '(PDV:'+edtCodigoPDV.Text+')';
  end;


  //25-03-2013
  if cbxCOO.Checked then
  Begin
    if not VerificaInteiroBranco(edtCOO.Text) then
    Begin
      try
        edtCOO.SetFocus;
      except
      end;
      raise Exception.Create('Código do COO inválido!');
    end
    else
      COO:=' AND T2.PDV_COO='+edtCOO.Text;
    sFiltros := sFiltros + '(COO:'+edtCOO.Text+')';
  end;
  if cbxCCF.Checked then
  Begin
    if not VerificaInteiroBranco(edtCCF.Text) then
    Begin
      try
        edtCCF.SetFocus;
      except
      end;
      raise Exception.Create('Código do CCF inválido!');
    end
    else
      CCF:=' AND T2.PDV_CCF='+edtCCF.Text;
    sFiltros := sFiltros + '(CCF:'+edtCCF.Text+')';
  end;


  if ckbPacote.Checked then
    if not VerificaInteiroBranco(edtPacote.Text) then
    Begin
      try
        edtPacote.SetFocus;
      except
      end;
      raise Exception.Create('Código do pacote inválido!');
    end
    else
    Begin
      sPacote:=' AND T2.PDV_PACOTE='+edtPacote.Text;
      sFiltros := sFiltros + '(PACOTE:'+edtPacote.Text+')';
    end;

  if ckbSituacao.Checked then
  Begin
    if cmbTipoSituacao.ItemIndex = 0 then //Igual
    Begin
      case cmbSituacao.ItemIndex of
        0: Begin
             SIT:=' AND (T2.PDV_SITUACAO<4) AND (T2.PDV_DIAS_RESERV<=0 OR T2.PDV_DIAS_RESERV IS NULL) ';
             sFiltros := sFiltros + '(=Em Aberto)';
           end;
        1: Begin
             SIT:=' AND (T2.PDV_SITUACAO=4) ';
             sFiltros := sFiltros + '(=Finalizado)';
           end;
        2: Begin
             SIT:=' AND (T2.PDV_SITUACAO=6) ';
             sFiltros := sFiltros + '(=Cancelado)';
           end;
        3: Begin
             SIT:=' AND (T2.PDV_SITUACAO=8) ';
             sFiltros := sFiltros + '(=Devolvido)';
           end;
        4: Begin
             SIT:=' AND (T2.PDV_SITUACAO < 4 AND T2.PDV_DIAS_RESERV > 0) ';
             sFiltros := sFiltros + '(=Orcamento)';
           end;
        5: Begin
             SIT:=' AND (T2.PDV_SITUACAO=2) AND T2.PDV_SERVICO=1 AND EXISTS '+
                ' (SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I10 '+
                ' WHERE I10.CNC_CODIGO=T2.CNC_CODIGO '+
                ' AND I10.PDV_CODIGO=T2.PDV_CODIGO '+
                ' AND I10.IPV_SITUACAO<>3 '+
                ' AND I10.IPV_SERVICO=1)';
             sFiltros := sFiltros + '(=Laboratorio)';
           end;
        6: Begin
             SIT:=' AND (T2.PDV_SITUACAO=2) AND T2.PDV_SERVICO=1 AND NOT EXISTS '+
                ' (SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I10 '+
                ' WHERE I10.CNC_CODIGO=T2.CNC_CODIGO '+
                ' AND I10.PDV_CODIGO=T2.PDV_CODIGO '+
                ' AND I10.IPV_SITUACAO<>3 '+
                ' AND I10.IPV_SERVICO=1)';
             sFiltros := sFiltros + '(=Qualidade)';
           end;
        7: Begin
             SIT:=' AND (T2.PDV_SITUACAO=3) AND T2.PDV_SERVICO=1 ';
             sFiltros := sFiltros + '(=Pronto)';
           end;
        8: Begin
             SIT:=' AND ((T2.PDV_SITUACAO<4 AND (T2.PDV_DIAS_RESERV<=0 OR T2.PDV_DIAS_RESERV IS NULL)) '+
                  '  OR T2.PDV_SITUACAO=4) ';
             sFiltros := sFiltros + '(=EmAberto/Finalizado)';
           end;
      end;
    end
    else //Diferente
    Begin
      case cmbSituacao.ItemIndex of
        0: Begin
             SIT:=' AND (T2.PDV_SITUACAO>=4) AND (T2.PDV_DIAS_RESERV<=0 OR T2.PDV_DIAS_RESERV IS NULL) ';
             sFiltros := sFiltros + '(<>Em Aberto)';
           end;
        1: Begin
             SIT:=' AND (T2.PDV_SITUACAO<>4) ';
             sFiltros := sFiltros + '(<>Finalizado)';
           end;
        2: Begin
             SIT:=' AND (T2.PDV_SITUACAO<>6) ';
             sFiltros := sFiltros + '(<>Cancelado)';
           end;
        3: Begin
             SIT:=' AND (T2.PDV_SITUACAO<>8) ';
             sFiltros := sFiltros + '(<>Devolvido)';
           end;
        4: Begin
             SIT:=' AND (T2.PDV_SITUACAO < 4 AND (T2.PDV_DIAS_RESERV = 0 OR T2.PDV_DIAS_RESERV IS NULL)) ';
             sFiltros := sFiltros + '(<>Orcamento)';
           end;
        5: Begin
             SIT:=' AND (T2.PDV_SITUACAO=2) AND T2.PDV_SERVICO=1 AND EXISTS '+
                ' (SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I10 '+
                ' WHERE I10.CNC_CODIGO=T2.CNC_CODIGO '+
                ' AND I10.PDV_CODIGO=T2.PDV_CODIGO '+
                ' AND I10.IPV_SITUACAO<>3 '+
                ' AND I10.IPV_SERVICO=1)';
             sFiltros := sFiltros + '(<>Laboratorio)';
           end;
        6: Begin
             SIT:=' AND T2.PDV_SITUACAO=2 AND T2.PDV_SERVICO=1 AND EXISTS '+
                ' (SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I10 '+
                ' WHERE I10.CNC_CODIGO=T2.CNC_CODIGO '+
                ' AND I10.PDV_CODIGO=T2.PDV_CODIGO '+
                ' AND I10.IPV_SITUACAO<>3 '+
                ' AND I10.IPV_SERVICO=1)';
             sFiltros := sFiltros + '(<>Qualidade)';
           end;
        7: Begin
             SIT:=' AND (T2.PDV_SITUACAO<>3 AND T2.PDV_SERVICO=1) ';
             sFiltros := sFiltros + '(<>Pronto)';
           end;
        8: Begin
             SIT:=' AND (T2.PDV_SITUACAO>4) AND (T2.PDV_DIAS_RESERV<=0 OR T2.PDV_DIAS_RESERV IS NULL) ';
             sFiltros := sFiltros + '(<>EmAberto/Finalizado)';
           end;
      end;
    end;
  end;

  if ckbTipoPagamento.Checked then
  Begin
    if dblTipoPagamento.Text = '' then
    Begin
      try
        dblTipoPagamento.SetFocus;
      except
      end;
      raise Exception.Create('Tipo de Pagamento inválido!');
    end;
    if cmbTipoPag.ItemIndex = 0 then
    Begin
      TPG:=' AND T2.PDV_TIPO_PAG='+IntToStr(dblTipoPagamento.KeyValue);
      sFiltros := sFiltros + '(TipoPag:='+dblTipoPagamento.Text+')';
    end
    else
    Begin
      TPG:=' AND T2.PDV_TIPO_PAG<>'+IntToStr(dblTipoPagamento.KeyValue);
      sFiltros := sFiltros + '(TipoPag:<>'+dblTipoPagamento.Text+')';
    end;
  end;

  if ckbCodigoFPG.Checked then
  Begin
    if dblCodigoFPG.Text = '' then
    Begin
      try
        dblCodigoFPG.SetFocus;
      except
      end;
      raise Exception.Create('Forma de Pagamento inválido!');
    end
    else
    Begin
      if cmbCodigoFPG.ItemIndex = 0 then
      Begin
        FPG:=' AND T2.FPG_CODIGO='+IntToStr(dblCodigoFPG.KeyValue);
        sFiltros := sFiltros + '(FPG:='+dblCodigoFPG.Text+')';
      end
      else
      Begin
        FPG:=' AND T2.FPG_CODIGO<>'+IntToStr(dblCodigoFPG.KeyValue);
        sFiltros := sFiltros + '(FPG:<>'+dblCodigoFPG.Text+')';
      end;
    end;
  end;

  if ckbCodigoAGF.Checked then
  Begin
    if dblCodigoAGF.Text = '' then
    Begin
      try
        dblCodigoAGF.SetFocus;
      except
      end;
      raise Exception.Create('Agente Financeiro inválido!');
    end
    else
    Begin
      if cmbAgenteFinanceiro.ItemIndex = 0 then
      Begin
        AGF:=' AND T2.AGF_CODIGO='+IntToStr(dblCodigoAGF.KeyValue);
        sFiltros := sFiltros + '(AGF:='+dblCodigoAGF.Text+')';
      end
      else
      Begin
        AGF:=' AND T2.AGF_CODIGO<>'+IntToStr(dblCodigoAGF.KeyValue);
        sFiltros := sFiltros + '(AGF:<>'+dblCodigoAGF.Text+')';
      end;
    end;
  end;

  if ckbCodigoCNC.Checked then
  Begin
    if dblCodigoCNC.Text = '' then
    Begin
      try
        dblCodigoCNC.SetFocus;
      except
      end;
      raise Exception.Create('Centro de Custo inválido!');
    end
    else
      CNC:=' AND T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue);
    sFiltros := sFiltros + '(CNC:='+IntToStr(dblCodigoCNC.KeyValue)+')';
  end;

  if ckbObservacao.Checked then
  Begin
    if edtObservacao.Text = '' then
      sOBS:=' AND T2.PDV_OBS="" '
    else
      sOBS:=' AND T2.PDV_OBS LIKE "%'+edtObservacao.Text+'%" ';
    sFiltros := sFiltros + '(OBS:'+edtObservacao.Text+')';
  end;

  //Somente Motical
  if ckbVendasSemTitulos.Checked then
  Begin
    sVendasSemTitulos := ' AND T2.PDV_TITULO_GERADO=0 ';
    sFiltros := sFiltros + '(Sem Titulos)';
  end;

  //CodigoFPE
  if ckbcodigoFPE.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoFPE.Text) then
      Raise exception.Create('CodigoFPE inválido!');
    CdFPE := ' AND T2.FPE_CODIGO='+edtCodigoFPE.Text;
    sFiltros := sFiltros + '(FPE:'+edtCodigoFPE.Text+')';
  end;

  //Somente Motical
  if ckbTipoVenda.Checked then
  Begin
    case cmbTipoVenda.ItemIndex of
      0: Begin //Normal
           if cmbTipoTipoVenda.ItemIndex = 0 then
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA=0) ';
             sFiltros := sFiltros + '(=Normal)';
           end
           else
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA<>0) ';
             sFiltros := sFiltros + '(<>Normal)';
           end;
         end;
      1: Begin //Pendente
           if cmbTipoTipoVenda.ItemIndex = 0 then
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA=1) ';
             sFiltros := sFiltros + '(=Pendente)';
           end
           else
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA<>1) ';
             sFiltros := sFiltros + '(<>Pendente)';
           end;
         end;
      2: Begin //Remessa
           if cmbTipoTipoVenda.ItemIndex = 0 then
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA=2) ';
             sFiltros := sFiltros + '(=Remessa)';
           end
           else
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA<>2) ';
             sFiltros := sFiltros + '(<>Remessa)';
           end;
         end;
      3: Begin //Pré-Pago
           if cmbTipoTipoVenda.ItemIndex = 0 then
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA=3) ';
             sFiltros := sFiltros + '(=Pre-Pago)';
           end
           else
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA<>3) ';
             sFiltros := sFiltros + '(<>Pre-Pago)';
           end;
         end;
      4: Begin //Qualquer Remessa
           if cmbTipoTipoVenda.ItemIndex = 0 then
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA=2 OR T2.PDV_TIPO_VENDA=3) ';
             sFiltros := sFiltros + '(=QualquerRemessa)';
           end
           else
           Begin
             sTipoVenda:=' AND (T2.PDV_TIPO_VENDA<>2 AND T2.PDV_TIPO_VENDA<>3) ';
             sFiltros := sFiltros + '(<>QualquerRemessa)';
           end;
         end;
    end;
  end;

  if ckbIndicacao.Checked then
  Begin
    if dblIndicacao.Text = '' then
      Raise exception.Create('Indicação inválida!');
    CdIndicacao := ' AND EXISTS (SELECT PDV_CODIGO '+
      ' FROM DETALHE_DE_PEDIDO_DE_VENDA DPV '+
      ' WHERE DPV.FUN_CODIGO_1='+IntToStr(dblIndicacao.KeyValue)+
      ' AND DPV.CNC_CODIGO=T2.CNC_CODIGO '+
      ' AND DPV.PDV_CODIGO=T2.PDV_CODIGO) ';
    sFiltros := sFiltros + '(Ind/Promotor(a):'+dblIndicacao.Text+')';
  end;

  if ckbGrupoEspecial.Checked then
  Begin
    if DM.Configuracao1.Empresa = empEletro then
      sGrupoEspecial := ' AND T1.PRD_CODIGO IN '+
                        '(SELECT P1.PRD_CODIGO FROM PRODUTO P1 INNER JOIN GRUPO G1 '+
                        ' ON G1.GRP_ESPECIAL=1 '+
                        ' AND P1.GRP_CODIGO=G1.GRP_CODIGO) '
    else
      sGrupoEspecial := ' AND T2.PDV_GRUPO_ESPECIAL=1 ';
    sFiltros := sFiltros + '(Grupo Esp)';
  end
  else if ckbGrupoNorma.Checked then
  Begin
    if DM.Configuracao1.Empresa = empEletro then
      sGrupoEspecial := ' AND T1.PRD_CODIGO NOT IN '+
                        '(SELECT P1.PRD_CODIGO FROM PRODUTO P1 INNER JOIN GRUPO G1 '+
                        ' ON G1.GRP_ESPECIAL=1 '+
                        ' AND P1.GRP_CODIGO=G1.GRP_CODIGO) '
    else
      sGrupoEspecial := ' AND T2.PDV_GRUPO_ESPECIAL=0 ';
    sFiltros := sFiltros + '(Grupo Nao Esp)';
  end;

  if ckbSomentePDV.Checked then
  Begin
    sSomentePDV := ' AND T2.PDV_SERVICO=0 ';
    sFiltros := sFiltros + '(SomentePDV)';
  end
  else if ckbSomentePDS.Checked then
  Begin
    sSomentePDV := ' AND T2.PDV_SERVICO=1 ';
    sFiltros := sFiltros + '(SomentePDS)';
  end;

  if ckbNumeroNota.Checked then
  Begin
    if not VerificaInteiroBranco(edtNumeroNota.Text) then
    Begin
      try
        edtNumeroNota.SetFocus;
      except
      end;
      raise Exception.Create('Número da Nota inválido!');
    end
    else
      NTF:=' AND T2.PDV_NOTA_FISCAL='+edtNumeroNota.Text;
    sFiltros := sFiltros + ' (Nota:='+edtNumeroNota.Text+')';
  end;

  if ckbEntregaDeposito.Checked then
  Begin
    sEntregaDeposito := ' AND T2.PDV_ENTREGA_DEPOSITO=1 ';
    if (DM.Configuracao1.CodigoCNC = 11) and
       (edtNumeroNota.Text = '0') then //Depósito
      sEntregaDeposito := sEntregaDeposito + ' AND NOT EXISTS (SELECT NTF_CODIGO '+
        ' FROM NOTA_FISCAL '+
        ' WHERE NTF_PEDIDO=T2.PDV_CODIGO '+
        ' AND CNC_PEDIDO=T2.CNC_CODIGO '+
        ' AND NTF_TIPO=361 '+
        ' AND NTF_SITUACAO=2) ';
    sFiltros := sFiltros + '(Ent.Deposito)';
  end;

  if ckbVendasPorFaturar.Checked then
  Begin
    NTF:=' AND (T2.PDV_NOTA_FISCAL=0 OR T2.PDV_NOTA_FISCAL IS NULL) ';
    sFiltros := sFiltros + ' (NTF=0)';
  end;

  if ckbVendasFaturadas.Checked then
  Begin
    if ckbLJ3.Checked and
       ckbLJ4.Checked then
    Begin
      NTF:=' AND (T2.PDV_NOTA_FISCAL>0 OR T2.PDV_NOTA_FISCAL=-1 OR T2.PDV_NOTA_FISCAL=-2) ';
      sFiltros := sFiltros + ' (Fat./LJ3/LJ4)';
    end
    else if ckbLJ3.Checked then
    Begin
      NTF:=' AND (T2.PDV_NOTA_FISCAL>0 OR T2.PDV_NOTA_FISCAL=-1) ';
      sFiltros := sFiltros + ' (Fat./LJ3)';
    end
    else if ckbLJ4.Checked then
    Begin
      NTF:=' AND (T2.PDV_NOTA_FISCAL>0 OR T2.PDV_NOTA_FISCAL=-2) ';
      sFiltros := sFiltros + ' (Fat./LJ4)';
    end
    else
    Begin
      NTF:=' AND (T2.PDV_NOTA_FISCAL>0) ';
      sFiltros := sFiltros + ' (NTF>0)';
    end
  end
  else if ckbLJ3.Checked and
          ckbLJ4.Checked then
  Begin
    NTF:=' AND (T2.PDV_NOTA_FISCAL=-1 OR T2.PDV_NOTA_FISCAL=-2) ';
    sFiltros := sFiltros + ' (NTF=LJ3/LJ4)';
  end
  else if ckbLJ3.Checked then
  Begin
    NTF:=' AND (T2.PDV_NOTA_FISCAL=-1) ';
    sFiltros := sFiltros + ' (NTF=LJ3)';
  end
  else if ckbLJ4.Checked then
  Begin
    NTF:=' AND (T2.PDV_NOTA_FISCAL=-2) ';
    sFiltros := sFiltros + ' (NTF=LJ4)';
  end;

  if ckbQuantidadeAcima.Checked then
  Begin
    AcimaNormal:=
      //Verificar com PRD
      ' AND (EXISTS (SELECT T4.QNV_CODIGO FROM QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T4.PRD_CODIGO=T1.PRD_CODIGO) OR '+
      //Verificar com SGP
      ' EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T4.FOR_CODIGO=T3.FOR_CODIGO '+
      ' AND T4.GRP_CODIGO=T3.GRP_CODIGO AND T4.SGP_CODIGO=T3.SGP_CODIGO AND T4.PRD_CODIGO=0) '+
      //Verificar com GRP
      ' OR EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T4.FOR_CODIGO=T3.FOR_CODIGO '+
      ' AND T4.GRP_CODIGO=T3.GRP_CODIGO AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0) '+
      //Verificar com FOR
      ' OR EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T4.FOR_CODIGO=T3.FOR_CODIGO '+
      ' AND T4.GRP_CODIGO=0 AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0)) '+

      //Verificar Quantidade com PRD
      ' AND (NOT EXISTS (SELECT T4.QNV_CODIGO FROM QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T4.PRD_CODIGO) '+
      ' OR T1.IPV_QUANTIDADE>(SELECT MAX(T4.QNV_QUANTIDADE) '+
      ' FROM QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T4.PRD_CODIGO)) '+

      //Verificar Quantidade com SGP
      ' AND (NOT EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T3.GRP_CODIGO=T4.GRP_CODIGO AND T3.SGP_CODIGO=T4.SGP_CODIGO AND T4.PRD_CODIGO=0) '+
      ' OR T1.IPV_QUANTIDADE>(SELECT MAX(T4.QNV_QUANTIDADE) '+
      ' FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T3.GRP_CODIGO=T4.GRP_CODIGO AND T3.SGP_CODIGO=T4.SGP_CODIGO AND T4.PRD_CODIGO=0)) '+

      //Verificar Quantidade com GRP
      ' AND (NOT EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T3.GRP_CODIGO=T4.GRP_CODIGO AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0) '+
      ' OR T1.IPV_QUANTIDADE>(SELECT MAX(T4.QNV_QUANTIDADE) '+
      ' FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T3.GRP_CODIGO=T4.GRP_CODIGO AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0)) '+

      //Verificar Quantidade com FOR
      ' AND (NOT EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T3.FOR_CODIGO=T4.FOR_CODIGO AND T4.GRP_CODIGO=0 '+
      ' AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0) '+
      ' OR T1.IPV_QUANTIDADE>(SELECT MAX(T4.QNV_QUANTIDADE) '+
      ' FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T4.GRP_CODIGO=0 AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0)) ';
    sFiltros := sFiltros + '(QtdAcimaNormal)';
  end;

  if ckbEntregaEmbarque.Checked then
  Begin
    sEntregaEmbarque := ' AND T1.IPV_ENTREGA=0 ';
    sFiltros := sFiltros + ' (Entrega)';
  end;

  if ckbValorTotal.Checked then
  Begin
    if not VerificaFloatBranco(edtValorTotal.Text) then
    Begin
      try
        edtValorTotal.SetFocus;
      except
      end;
      Raise Exception.Create('Valor Total do pedido inválido!');
    end
    else
      case cmbValorTotal.ItemIndex of
        0: Begin
             Valor:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO < '+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total<'+edtValorTotal.Text+')';
           end;
        1: Begin
             Valor:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO = '+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total='+edtValorTotal.Text+')';
           end;
        2: Begin
             Valor:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO > '+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total>'+edtValorTotal.Text+')';
           end;
        3: Begin
             Valor:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO <='+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total<='+edtValorTotal.Text+')';
           end;
        4: Begin
             Valor:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO >='+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total>='+edtValorTotal.Text+')';
           end;
      end;
  end;

  if ckbGarantia.Checked then
  Begin
    if not VerificaInteiroBranco(edtGarantia.Text) then
    Begin
      try
        edtGarantia.SetFocus;
      except
      end;
      Raise Exception.Create('Garantia do pedido inválida!');
    end
    else
      case cmbGarantia.ItemIndex of
        0: Begin
             sGarantia:=' AND (T2.PDV_GARANTIA < '+VirgPonto(edtGarantia.Text)+') ';
             sFiltros := sFiltros + ' (Garantia<'+edtGarantia.Text+')';
           end;
        1: Begin
             sGarantia:=' AND (T2.PDV_GARANTIA = '+VirgPonto(edtGarantia.Text)+') ';
             sFiltros := sFiltros + ' (Garantia='+edtGarantia.Text+')';
           end;
        2: Begin
             sGarantia:=' AND (T2.PDV_GARANTIA > '+VirgPonto(edtGarantia.Text)+') ';
             sFiltros := sFiltros + ' (Garantia>'+edtGarantia.Text+')';
           end;
        3: Begin
             sGarantia:=' AND (T2.PDV_GARANTIA <='+VirgPonto(edtGarantia.Text)+') ';
             sFiltros := sFiltros + ' (Garantia<='+edtGarantia.Text+')';
           end;
        4: Begin
             sGarantia:=' AND (T2.PDV_GARANTIA >='+VirgPonto(edtGarantia.Text)+') ';
             sFiltros := sFiltros + ' (Garantia>='+edtGarantia.Text+')';
           end;
      end;
  end;

  if ckbSomenteAdiplentes.Checked then //Adiplente
  Begin
    sFiltros := sFiltros + '(SomAdiplente)';
    if rdgSemParcelas.Checked then //Sem nenhuma parcela em aberto
      Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
          ' WHERE TRC_SITUACAO IN (0,8)) '
    else if ckbDataOrigemAdiplente.Checked then //Data de Origem
      Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
          ' WHERE TRC_SITUACAO IN (0,8) AND (TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" '+
          ' OR TRC_DTORIGINAL<"'+MesDia(DM.Configuracao1.Data)+'")) '
    else
      Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
          ' WHERE TRC_SITUACAO IN (0,8) AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") ';
  end
  else if ckbSomenteInadiplentes.Checked then //Inadiplente
  Begin
    sFiltros := sFiltros + '(SomInadiplente)';
    if rdgQualquerParcela.Checked then // Inadiplente qualquer título
      if ckbDataOrigemInadiplente.Checked then //Data de Origem
        Devedor:=' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE TRC_SITUACAO IN (0,8) '+
            ' AND PDV_CODIGO=T2.PDV_CODIGO '+
            ' AND CNC_CODIGO=T2.CNC_CLIENTE '+
            ' AND (TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" '+
            ' OR TRC_DTORIGINAL<"'+MesDia(DM.Configuracao1.Data)+'")) '
      else
        Devedor:=' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE TRC_SITUACAO IN (0,8) '+
            ' AND PDV_CODIGO=T2.PDV_CODIGO '+
            ' AND CNC_CODIGO=T2.CNC_CLIENTE '+
            ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") '
    else  //Inadiplente Pedido Inteiro
      if ckbDataOrigemInadiplente.Checked then //Data de Origem
        Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T4 '+
            ' WHERE T4.TRC_SITUACAO IN (1,2) '+
            ' AND PDV_CODIGO=T2.PDV_CODIGO '+
            ' AND (T4.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'"'+
            ' OR T4.TRC_DTORIGINAL<"'+MesDia(DM.Configuracao1.Data)+'") '+
            ' AND T4.CNC_CODIGO=T2.CNC_CLIENTE AND T4.PDV_CODIGO=T2.PDV_CODIGO) '+
            ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T6 '+
            ' WHERE T6.TRC_SITUACAO IN (0,8) '+
            ' AND T6.CNC_CODIGO=T2.CNC_CODIGO AND T6.PDV_CODIGO=T2.PDV_CODIGO) '
      else
        Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T4 '+
            ' WHERE T4.TRC_SITUACAO IN (1,2) '+
            ' AND PDV_CODIGO=T2.PDV_CODIGO '+
            ' AND T4.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'"'+
            ' AND T4.CNC_CODIGO=T2.CNC_CLIENTE AND T4.PDV_CODIGO=T2.PDV_CODIGO) '+
            ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T6 '+
            ' WHERE T6.TRC_SITUACAO IN (0,8) '+
            ' AND T6.CNC_CODIGO=T2.CNC_CLIENTE AND T6.PDV_CODIGO=T2.PDV_CODIGO) ';
  end;

  if ckbAgruparPorCliente.Checked then
    sFiltros := sFiltros + '(Agrupar CLI)';

  if ckbSomenteBonificados.Checked then
  Begin
    sSomenteBonus := ' AND T1.IPV_BONIFICACAO>0 ';
    sFiltros := sFiltros + '(Bonificacao)';
  end;

  if ckbMalaDireta.Checked then
  Begin
    if Trim(edtArquivoMalaDireta.Text) = '' then
      Raise exception.Create('Nome do Arquivo inválido!');

    if ckbProdutosMaisVendidos.Checked and
       (not ckbPorFornecedor.Checked) then
    Begin
      with DM.qr_consultas2 do
      Begin
        Close;
        if edtQuantidadeMaiores.Text <> '0' then
          sTop := ' TOP '+edtQuantidadeMaiores.Text;
        SQL.Text:='SELECT '+sTop+
          ' T1.PRD_CODIGO '+
          ',SUM(T1.IPV_QUANTIDADE) IPV_QUANTIDADE '+
          ',SUM(T1.IPV_BONIFICACAO) IPV_BONIFICACAO '+
          ',SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) IPV_PRECO '+
          ',MAX(T2.PDV_DT_ENTREGA) AS DATA '+
          ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
          ' WHERE T2.CLI_CODIGO<>0 '+
          DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
          Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
          PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
          CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
          sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
          ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
          ' AND T2.PDV_CODIGO=T1.PDV_CODIGO '+
          ' AND T1.PRD_CODIGO=T3.PRD_CODIGO '+
          ' GROUP BY T1.PRD_CODIGO '+
          ' ORDER BY SUM(T1.IPV_QUANTIDADE) DESC ';
        Open;
        if IsEmpty then
          Raise Exception.Create('Consulta vazia!');

        iQtdRegistros := 0;
        try
          AssignFile(Arq, edtArquivoMalaDireta.Text);
          Rewrite(Arq);
          Writeln(Arq, 'PRD;DESCRICAO;REFERENCIA;DETALHE;CARACTERISTICA;MARCA;COD_BARRAS;QTD;BONUS;TOTAL_VENDA;TOTAL_COMPRA');

          while not EOF do
          begin
            iPRD         := FieldByName('PRD_CODIGO').asInteger;
            vQtd         := FieldByName('IPV_QUANTIDADE').asFloat;
            vBonificacao := FieldByName('IPV_BONIFICACAO').asFloat;
            vValorVenda  := FieldByName('IPV_PRECO').asFloat;
            vData        := FieldByName('DATA').asDateTime;

            with DM.QR_Consultas do
            Begin
              Close;
              SQL.Text := 'SELECT * FROM PRODUTO '+
                ' WHERE PRD_CODIGO='+IntToStr(iPRD);
              Open;
              sDescricao      := FieldByName('PRD_DESCRICAO').asString;
              sCaracteristica := FieldByName('PRD_CARACTERISTICA').asString;
              sReferencia     := FieldByName('PRD_REFERENCIA').asString;
              sDetalhe        := FieldByName('PRD_DETALHE').asString;
              vCompra         := FieldByName('PRD_PRECO_COMPRA').asFloat;

              //Código de Barras
              Close;
              SQL.Text := 'SELECT TOP 1 * '+
                ' FROM CODIGO_DE_BARRAS '+
                ' WHERE CDB_CODIGO_ENTRADA='+IntToStr(iPRD)+
                ' AND CDB_TIPO=0 ';
              Open;
              sCodigoBarras := FieldByName('CDB_CODIGO_BARRAS').asString;

              //Preço de Compra
              Close;
              SQL.Text := 'SELECT TOP 1 CUS_VALOR_MEDIO AS CUSTO '+
                ',CUS_VALOR_COMPRA AS COMPRA '+
                ' FROM CUSTO '+
                ' WHERE PRD_CODIGO='+IntToStr(iPRD)+
                ' AND CUS_DT_CADASTRO<="'+MesDia(vData+1)+'" '+
                ' ORDER BY CUS_DT_CADASTRO DESC ';
              Open;
              if not IsEmpty then
              Begin
                vCompra := Arredonda(FieldByName('COMPRA').asFloat);
//                vCusto  := Arredonda(FieldByName('CUSTO').asFloat);
              end;
              vValorCompra := Arredonda(vCompra*(vQtd-vBonificacao));
            end;

            sRegistro := '"'+IntToStr(iPRD)+'";"'+
              sDescricao+'";"'+
              sReferencia+'";"'+
              sDetalhe+'";"'+
              sCaracteristica+'";"'+
              sMarca+'";"'+
              sCodigoBarras+'";"'+
              Format('%.2f',[vQtd])+'";"'+
              Format('%.2f',[vBonificacao])+'";"'+
              Format('%.2f',[vValorVenda])+'";"'+
              Format('%.2f',[vValorCompra])+'";"'+
              Format('%.2f',[vCompra])+'"';
            Writeln(Arq, sRegistro);

            inc(iQtdRegistros);
            Next;
          end;
        finally
          CloseFile(Arq);
          if iQtdRegistros > 0 then
            ShowMessage('Gerado '+IntToStr(iQtdRegistros)+' registros(s)!')
          else
            ShowMessage('Não foi gerado nenhum registro!');
        end;
      end;
    end;
    Exit;
  end;

  //Não é Mala Direta
  Dt_ini := mskDataINI.Text;
  Dt_fim := mskDataFIM.Text;
  if (tag = 0) and (not ckbSomenteItens.Checked)then //Não Somente Produtos
  Begin
    if ckbEspelhoPedido.Checked then
    Begin
      //Cópia do Pedido impresso na tela de venda/serviço
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT PDV_CODIGO '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
          ' AND PDV_CODIGO='+edtCodigoPDV.Text+
          ' AND PDV_SERVICO=1 ';
        Open;
        if (not IsEmpty) or
           (DM.Configuracao1.Empresa = empLuciano) then
        Begin
          if DM.Configuracao1.Empresa IN [empLuciano, empMotical] then
          Begin
            with DM.qr_consultas2 do
            Begin
              Close;
              SQL.Text := 'SELECT * '+
                ' FROM DETALHE_DE_PEDIDO_DE_VENDA '+
                ' WHERE CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                ' AND PDV_CODIGO='+edtCodigoPDV.Text;
              Open;
              if RecordCount > 1 then
                vMultiplosDetalhes := True
              else
                vMultiplosDetalhes := False;
            end;
            if not vMultiplosDetalhes then
            Begin
              Application.CreateForm(Trpt_PedidoServicoCompleto, rpt_PedidoServicoCompleto);
              with rpt_PedidoServicoCompleto do
              begin
                Entidade.Close;
                if DM.Configuracao1.Empresa = empLuciano then
                  sServico := ' T2.PDV_CODIGO<>-1 '
                else
                  sServico := ' T2.PDV_SERVICO=1 ';
                Entidade.SQL.Text := 'SELECT T1.*, T2.* '+
                  ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto P1 '+
                  ' WHERE '+sServico+
                  DataINI+DataFIM+CdFOR+Devedor+sEntregaEmbarque+sSomentePDV+sPacote+sEntregaDeposito+
                  CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
                  PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+CdArquiteto+
                  sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+sDocumento+sCaixa+sObsItem+sSomenteBonus+
                  sSomentePRDSER+CdFPE+COO+CCF+
                  ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
                  ' AND T1.PDV_CODIGO=T2.PDV_CODIGO '+
                  ' AND T1.PRD_CODIGO=P1.PRD_CODIGO '+
                  ' ORDER BY T2.CNC_CODIGO, T2.PDV_CODIGO ';
                Entidade.Open;
                if Entidade.IsEmpty then
                  Raise exception.Create('Consulta Vazia!');
                if (report.Height > DM.Configuracao1.MaxLinhasImp) and
                   (DM.Configuracao1.MaxLinhasImp <> 65) then
                  report.Height := DM.Configuracao1.MaxLinhasImp;
                report.preview;
                Exit;
              end;
            end
            else //Múltiplos Detalhes
            Begin
              Application.CreateForm(Trpt_PedidoServicoCompleto, rpt_PedidoServicoCompleto);
              with rpt_PedidoServicoCompleto do
              begin
                Entidade.Close;
                if DM.Configuracao1.Empresa = empLuciano then
                  sServico := ' T2.PDV_CODIGO<>-1 '
                else
                  sServico := ' T2.PDV_SERVICO=1 ';
                Entidade.SQL.Text := 'SELECT T1.*, T2.* '+
                  ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto P1 '+
                  ' WHERE '+sServico+
                  DataINI+DataFIM+CdFOR+Devedor+sEntregaEmbarque+sSomentePDV+sPacote+sEntregaDeposito+
                  CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
                  PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+CdArquiteto+
                  sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+sDocumento+sCaixa+sObsItem+sSomenteBonus+
                  sSomentePRDSER+CdFPE+COO+CCF+
                  ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
                  ' AND T1.PDV_CODIGO=T2.PDV_CODIGO '+
                  ' AND T1.PRD_CODIGO=P1.PRD_CODIGO '+
                  ' ORDER BY T2.CNC_CODIGO, T2.PDV_CODIGO ';
                Entidade.Open;
                if Entidade.IsEmpty then
                  Raise exception.Create('Consulta Vazia!');
                if (report.Height > DM.Configuracao1.MaxLinhasImp) and
                   (DM.Configuracao1.MaxLinhasImp <> 65) then
                  report.Height := DM.Configuracao1.MaxLinhasImp;
                report.preview;
                Exit;
              end;
            end;
          end
          else //Diferente de Motical
          Begin
            Application.CreateForm(Trpt_PedidoServicoLBMEsp, rpt_PedidoServicoLBMEsp);
            with rpt_PedidoServicoLBMEsp do
            begin
              Entidade.Close;
              Entidade.SQL.Text := 'SELECT *, '+
                '  CASE IPV_VINCULO '+
                '    WHEN -1 THEN IPV_SEQUENCIA*100 '+
                '    ELSE (IPV_VINCULO*100)+IPV_SEQUENCIA '+
                '   END ORDEM '+
                ' FROM PEDIDO_DE_VENDA T2, ITEM_DE_PEDIDO_DE_VENDA T1, PRODUTO P1 '+
                ' WHERE T2.PDV_SERVICO=1 '+
                DataINI+DataFIM+CdFOR+Devedor+sEntregaEmbarque+sSomentePDV+sPacote+sEntregaDeposito+
                CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
                PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+CdArquiteto+
                sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+sDocumento+sCaixa+sObsItem+sSomenteBonus+
                sSomentePRDSER+CdFPE+COO+CCF+
                ' AND (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+
                ' AND T1.PRD_CODIGO=P1.PRD_CODIGO '+
                ' ORDER BY T1.CNC_CODIGO, T1.PDV_CODIGO, ORDEM ';
              Entidade.Open;
              if Entidade.IsEmpty then
                Raise exception.Create('Consulta Vazia!');
              if (report.Height > DM.Configuracao1.MaxLinhasImp) and
                 (DM.Configuracao1.MaxLinhasImp <> 65) then
                report.Height := DM.Configuracao1.MaxLinhasImp;
              report.preview;
              Exit;
            end;
          end;
        end
        else if (DM.Configuracao1.Empresa = empMotical) and
                (not ckbSintetico.Checked) and
                (not ckbNaoExibirItens.Checked) and
                (not ckbQuantidadeAcima.Checked) and
                (not ckbExibirParcelas.Checked) then //Pedido de Venda (Cópia do impresso no pedido
        Begin
          Application.CreateForm(Trpt_PedidoVendaMotical, rpt_PedidoVendaMotical);
          with rpt_PedidoVendaMotical do
          Begin
            tag := 0;
            if (DM.Configuracao1.Empresa IN [empMotical,empAndrea]) then //Motical - Meia Folha
              report.Options.PageLength := 32;

            Item_Pedido_Venda1.Close;
            Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
              ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
              ' WHERE (T2.CLI_CODIGO<>0) '+
              DataINI+DataFIM+CdFOR+Devedor+sEntregaEmbarque+sSomentePDV+sPacote+sEntregaDeposito+
              CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
              PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+CdArquiteto+
              sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+sDocumento+sCaixa+sObsItem+sSomenteBonus+
              sSomentePRDSER+CdFPE+COO+CCF+
              ' AND (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+
              ' ORDER BY '+sOrdem;
            Item_Pedido_Venda1.Open;
            if Item_Pedido_Venda1.IsEmpty then
              Raise Exception.Create('Consulta Vazia!');
            if (report.Height > DM.Configuracao1.MaxLinhasImp) and
               (DM.Configuracao1.MaxLinhasImp <> 65) then
              report.Height := DM.Configuracao1.MaxLinhasImp;
            report.preview;
            Close;
            Exit;
          end;
        end;
      end;
    end;

    Application.CreateForm(Trpt_VendasCliente, rpt_VendasCliente);
    with rpt_VendasCliente do
    Begin
      tag := 0;


      if ckbTotalParcela.Checked then
      begin
        bTotalParcela := true;
        zrbTotalGeral.Height := 10;
      end
      else
      begin
        bTotalParcela := false;
        zrbTotalGeral.Height := 2;
      end;


      if DM.Configuracao1.Empresa = empHOPE then
        zrlDescReimpressao.Enabled := True;

      if rdgDataCadastro1.Checked then
        zrlFiltros.Caption := '(Cad)'+sFiltros
      else if rdgDataAlterado.Checked then
        zrlFiltros.Caption := '(Alt)'+sFiltros
      else if rdgDataEmissao.Checked then
        zrlFiltros.Caption := '(Emi)'+sFiltros
      else if rdgDataDevolucao.Checked then
        zrlFiltros.Caption := '(Dev)'+sFiltros
      else if rdgDataEntrega.Checked then
        zrlFiltros.Caption := '(Ent)'+sFiltros
      else if rdgDataPrevisao.Checked then
        zrlFiltros.Caption := '(Pre)'+sFiltros;

      if not ckbExibirParcelas.Checked then
      Begin
        if ckbSintetico.Checked then
        Begin
          if ckbNaoExibirItens.Checked then
            zrbParcelas.Height := 0
          else
            zrbParcelas.Height := 2;
        end
        else
        Begin
          zrbParcelas.Height := 4;
          zrlTracoDuploParcela.top := 3;
        end;
      end;
      if ckbCodigoPRD.Checked then
      Begin
        SZRLabel54.Enabled:=True;
        SZRLabel55.Enabled:=True;
      end
      else
      Begin
        SZRLabel54.Enabled:=False;
        SZRLabel55.Enabled:=False;
      end;

      if ckbSintetico.Checked then
      Begin
        if (DM.Configuracao1.Empresa <> empLBM) or (ckbCodigoCNC.Checked) then
        Begin
          if ckbAgruparPorCliente.Checked or
             ckbSomenteAdiplentes.Checked or
             ckbSomenteInadiplentes.Checked then
          Begin
            zrbCabecalhoFUN.Width := 0;
            zrbCabecalhoFUN.Expression := 'CNC_CODIGO+CLI_CODIGO ';
          end
          else
            zrbCabecalhoFUN.Expression := 'CNC_CODIGO+FUN_CODIGO ';
        end
        else if ckbAgruparPorCliente.Checked or
                ckbSomenteAdiplentes.Checked or
                ckbSomenteInadiplentes.Checked then
          zrbCabecalhoFUN.Expression := 'CLI_CODIGO'
        else if (not ckbQuantidadeAcima.Checked) then
          zrbCabecalhoFUN.Expression := 'FUN_CODIGO'
        else
          zrbCabecalhoFUN.Expression := '';

        if DM.Configuracao1.Empresa <> empLBM then
        Begin
          if ckbAgruparPorCliente.Checked or
             ckbSomenteAdiplentes.Checked or
             ckbSomenteInadiplentes.Checked then
            sOrdem := ' T1.CNC_CODIGO,T2.CLI_CODIGO,T2.PDV_DATA_HORA,T1.PDV_CODIGO ASC'
          else
            sOrdem := ' T1.CNC_CODIGO,T1.FUN_CODIGO,T2.PDV_DATA_HORA,T1.PDV_CODIGO ASC';
        end
        else if not ckbQuantidadeAcima.Checked then
        Begin
          if ckbAgruparPorCliente.Checked then
            sOrdem := ' T1.CLI_CODIGO,T1.CNC_CODIGO,T2.PDV_DATA_HORA,T1.PDV_CODIGO ASC'
          else
            sOrdem := ' T1.FUN_CODIGO,T1.CNC_CODIGO,T2.PDV_DATA_HORA,T1.PDV_CODIGO ASC';
        end
        else
          sOrdem := ' P1.PRD_MARCA,P1.GRP_CODIGO,P1.PRD_DESCRICAO,P1.PRD_DETALHE,T2.PDV_DATA_HORA,T2.PDV_CODIGO ASC';

        zrlDescCodigoPDV.Enabled := False; //Label do PDV
        zdbCodigoPDV.Left        := 0;     //PDV
        zrlDescData.Enabled      := False; //Label da Data
        zrlData.Left             := 8;     //Data
        zrlData.Width            := 10;    //Data
        zrlTotalPedido.Left      := 19;    //Valor
        zrlTotalPedido.Enabled   := True;
        zrlCodigoFUN.Enabled     := True;  //Vendedor
        zrlCodigoFUN.Left        := 29;    //Vendedor
        zrlAV_PZ.Enabled         := True;  //A Vista ou A Prazo
        zrlAV_PZ.Left            := 33;    //A Vista ou A Prazo
        zrlCliente.Top           := 0;     //Cliente
        zrlCliente.Left          := 36;    //Cliente
        zrlCliente.Width         := 40;    //Cliente
        szrNota.Enabled          := False; //Label Nota
        zrlNotaCupom.Left        := 77;    //TipoNota
        zrlNotaFiscal.Left       := 79;    //Nota
        zrlFone.Top              := 0;     //Telefone
        zrlFone.Left             := 88;    //Telefone
        if DM.Configuracao1.Empresa IN TEmpresasOtica then
        Begin
          zrlCaixa.Enabled       := True;
          zrlCaixa.Top           := 0;
          zrlCaixa.Left          := 104;
          zrlCaixa.Width         := 15;
        end
        else
        Begin
          zrlPaiMae.Top          := 0;
          zrlPaiMae.Left         := 104;
          zrlPaiMae.Width        := 15;
        end;
        zrlOK.Enabled            := False; //OK
        if DM.Configuracao1.Empresa <> empLBM then
        Begin
          zrlPaiMae.Enabled   := False;    //Contato
          SZRLabel160.Enabled  := False;    //Contato
        end;
        SZRLabel42.Enabled := False; //Label Situação
        zrlSituacao.Left    := 120;   //Situação
        zrlSituacao.Width   := 16;    //Situação
        if ckbSuperSintetico.Checked then
          zrbCabecalhoPedido.Height := 0
        else if ckbSaltarLinha.Checked then
          zrbCabecalhoPedido.Height := 2
        else
          zrbCabecalhoPedido.Height := 1;
      end
      else
      Begin
        zrbCabecalhoFUN.Expression := '';
        zrlDtAlteracao.Enabled  := True;
        zrbTotalCentro.Height      := 0;  //SubTotal por Centro de Custo
        if ckbCodigoPDV.Checked then
        Begin
          zrbCabecalhoPagina.Height := 3;
          ZRLabel5.Top   := 2;
          ZRLabel21.Enabled := False;
          zrlTotalGeral.Enabled := False;
          zrlFiltros.Enabled := False;
          ZRLabel4.Caption := 'Total:';

          if (DM.Configuracao1.Empresa IN [empMotical,empAndrea]) then //Motical - Meia Folha
          Begin
            report.Options.PageLength := 32;
            zrbParcelas.Height := 2;
            zrlTracoDuploParcela.top := 3;
            zrbCabecalhoCNC.Height := 0;
            zrbTotalGeral.Height   := 0;
            szrNota.Enabled:=False;
            zrlNotaFiscal.Enabled:=False;
            zrlNotaCupom.Enabled:=False;
            ZRLabel5.Top   := 2;
            zrbCabecalhoPagina.Height := 3;
          end;
        end
        else
        Begin
          zrbCabecalhoPagina.Height := 4;
          ZRLabel5.Top   := 3;
        end;
        zrbCabecalhoPedido.Height:= 11;
      end;
      if DM.Configuracao1.Empresa = empLBM then
      Begin
        zrbCabecalhoCNC.Height := 0;
        zrbCabecalhoCNC.Expression := '';
        if ckbQuantidadeAcima.Checked then
        Begin
          QtdAcimaNormal := True;
          zrlFiltros.Caption := zrlFiltros.Caption+'(Quantidade Acima do Normal - Vendas Especiais) ';
          ZRLabel5.Top := 3;
          zrbCabecalhoPagina.Height := 4;
          zrbCabecalhoFUN.Height := 0;
          zrbCabecalhoFUN.Expression := '';
          zrbCabecalhoPedido.Height := 0;
          if ckbSaltarLinha.Checked then
            zrb_detalhe.Height := 2;
          zrbParcelas.Height := 0;
          zrbTotalVendedor.Height := 0;
          zrlOK.Enabled := False;
          zrlOK.Height := 0;
          zrlValorUnitario.Height := 0;
          zrlValorUnitario.Visible := False;
          zrlTotalItem.Height := 0;
          zrlTotalItem.Visible := False;
          zrbTotalCentro.Height := 0;
          SZRLabel55.Enabled := False;
          SZRLabel54.Enabled := False;
          ZRLabel21.Enabled := False;
          zrlTotalGeral.Enabled := False;
          SZRLabel19.Enabled := True;
          zrlTotalRegistros.Enabled := True;
        end
        else if ckbAgruparPorCliente.Checked then
        Begin
          zrbCabecalhoFUN.Width := 0;
          zrbCabecalhoFUN.Expression := 'CLI_CODIGO';
        end
        else
          zrbCabecalhoFUN.Expression := 'FUN_CODIGO';
      end;
      if ckbNaoExibirItens.Checked then  //Esconder itens
      Begin
        zrb_detalhe.Height := 0;
        if not ckbSintetico.Checked then
          zrbCabecalhoPedido.Height    := 9; //Esconde Cabeçalho de Produto
      end;

      //Alan
      if (DM.Configuracao1.Empresa = empLuciano) and (DM.Configuracao1.CodigoCNC = 3) and
        (ckbSintetico.Checked = True) and (not cbxAguaCheiro.Checked) then
      begin
        SZRLabel49.Enabled := False;
        zrlTipoDePagamento.Enabled := False;
        SZRLabel52.Enabled := False;
        zrlFormaDePagamento.Enabled := False;
        SZRLabel50.Enabled := False;
        zrlAgenteFinanceiro.Enabled := False;
        zrbCabecalhoPedido.Height := 2;
        zrlObservacao.Top := 1;
      end;

      Item_Pedido_Venda1.Close;
      if not ckbQuantidadeAcima.Checked then
        Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
          ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
          ' WHERE (T2.CLI_CODIGO<>0) '+
          DataINI+DataFIM+CdFOR+Devedor+sEntregaEmbarque+sSomentePDV+sPacote+sEntregaDeposito+
          CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
          PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+CdArquiteto+
          sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+sDocumento+sCaixa+sObsItem+sSomenteBonus+
          sSomentePRDSER+CdFPE+COO+CCF+
          ' AND (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+
          ' ORDER BY '+sOrdem
      else
        Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
          ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto P1 '+
          ' WHERE (T2.CLI_CODIGO<>0) '+
          DataINI+DataFIM+CdFOR+Devedor+sEntregaEmbarque+sSomentePDV+sPacote+sEntregaDeposito+
          CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
          PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+CdArquiteto+
          sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+sDocumento+sCaixa+sObsItem+sSomenteBonus+
          sSomentePRDSER+CdFPE+COO+CCF+
          ' AND (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+
          ' AND T1.PRD_CODIGO=P1.PRD_CODIGO '+
          ' ORDER BY '+sOrdem;
      Item_Pedido_Venda1.Open;
      if Item_Pedido_Venda1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;






      {TODO
      if ckbTotalParcela.Checked then
        begin
          QrParcelas5.SQL.Text := 'SELECT '+
                                  ' COUNT(T1.TRC_CODIGO) AS TRC_SEQUENCIA, '+
                                  ' SUM(COALESCE(T1.TRC_VALOR_PAGO,0)) AS TOTAL '+
            ' FROM TITULO_A_RECEBER T1, PEDIDO_DE_VENDA T4 '+
            ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
            ' AND T1.TRC_SITUACAO=2 '+
            DataINI+DataFIM+
            ' AND T1.PDV_CODIGO=T4.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=T4.CNC_CODIGO '+
            ' AND EXISTS (SELECT T2.PDV_CODIGO '+
            '   FROM ITEM_DE_PEDIDO_DE_VENDA T2, PEDIDO_DE_VENDA T3 '+
            '   WHERE T3.PDV_CODIGO<>-10 '+
            '   AND T3.PDV_SITUACAO=4 '+
            '   AND T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                CdFUN+CdAGF+sSomenteLinha+sSomenteCatalogo+
            '   AND T3.PDV_CODIGO=T2.PDV_CODIGO '+
            '   AND T2.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T2.PDV_CODIGO=T1.PDV_CODIGO)'+
            ' GROUP BY T4.PDV_CODIGO '+
            ' HAVING COUNT(T1.TRC_CODIGO) = ''5'' ';
          QrParcelas5.Open;

          QrParcelas6.SQL.Text := 'SELECT '+
                                  ' COUNT(T1.TRC_CODIGO) AS TRC_SEQUENCIA, '+
                                  ' SUM(COALESCE(T1.TRC_VALOR_PAGO,0)) AS TOTAL '+
            ' FROM TITULO_A_RECEBER T1, PEDIDO_DE_VENDA T4 '+
            ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
            ' AND T1.TRC_SITUACAO=2 '+
            DataINI+DataFIM+
            ' AND T1.PDV_CODIGO=T4.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=T4.CNC_CODIGO '+
            ' AND EXISTS (SELECT T2.PDV_CODIGO '+
            '   FROM ITEM_DE_PEDIDO_DE_VENDA T2, PEDIDO_DE_VENDA T3 '+
            '   WHERE T3.PDV_CODIGO<>-10 '+
            '   AND T3.PDV_SITUACAO=4 '+
            '   AND T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                CdFUN+CdAGF+sSomenteLinha+sSomenteCatalogo+
            '   AND T3.PDV_CODIGO=T2.PDV_CODIGO '+
            '   AND T2.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T2.PDV_CODIGO=T1.PDV_CODIGO)'+
            ' GROUP BY T4.PDV_CODIGO '+
            ' HAVING COUNT(T1.TRC_CODIGO) = ''6'' ';
          QrParcelas6.Open;

          QrParcelas7.SQL.Text := 'SELECT '+
                                  ' COUNT(T1.TRC_CODIGO) AS TRC_SEQUENCIA, '+
                                  ' SUM(COALESCE(T1.TRC_VALOR_PAGO,0)) AS TOTAL '+
            ' FROM TITULO_A_RECEBER T1, PEDIDO_DE_VENDA T4 '+
            ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
            ' AND T1.TRC_SITUACAO=2 '+
            DataINI+DataFIM+
            ' AND T1.PDV_CODIGO=T4.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=T4.CNC_CODIGO '+
            ' AND EXISTS (SELECT T2.PDV_CODIGO '+
            '   FROM ITEM_DE_PEDIDO_DE_VENDA T2, PEDIDO_DE_VENDA T3 '+
            '   WHERE T3.PDV_CODIGO<>-10 '+
            '   AND T3.PDV_SITUACAO=4 '+
            '   AND T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                CdFUN+CdAGF+sSomenteLinha+sSomenteCatalogo+
            '   AND T3.PDV_CODIGO=T2.PDV_CODIGO '+
            '   AND T2.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T2.PDV_CODIGO=T1.PDV_CODIGO)'+
            ' GROUP BY T4.PDV_CODIGO '+
            ' HAVING COUNT(T1.TRC_CODIGO) = ''7'' ';
          QrParcelas7.Open;

          QrParcelas8.SQL.Text := 'SELECT '+
                                  ' COUNT(T1.TRC_CODIGO) AS TRC_SEQUENCIA, '+
                                  ' SUM(COALESCE(T1.TRC_VALOR_PAGO,0)) AS TOTAL '+
            ' FROM TITULO_A_RECEBER T1, PEDIDO_DE_VENDA T4 '+
            ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
            ' AND T1.TRC_SITUACAO=2 '+
            DataINI+DataFIM+
            ' AND T1.PDV_CODIGO=T4.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=T4.CNC_CODIGO '+
            ' AND EXISTS (SELECT T2.PDV_CODIGO '+
            '   FROM ITEM_DE_PEDIDO_DE_VENDA T2, PEDIDO_DE_VENDA T3 '+
            '   WHERE T3.PDV_CODIGO<>-10 '+
            '   AND T3.PDV_SITUACAO=4 '+
            '   AND T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                CdFUN+CdAGF+sSomenteLinha+sSomenteCatalogo+
            '   AND T3.PDV_CODIGO=T2.PDV_CODIGO '+
            '   AND T2.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T2.PDV_CODIGO=T1.PDV_CODIGO)'+
            ' GROUP BY T4.PDV_CODIGO '+
            ' HAVING COUNT(T1.TRC_CODIGO) = ''8'' ';
          QrParcelas8.Open;

          QrParcelas9.SQL.Text := 'SELECT '+
                                  ' COUNT(T1.TRC_CODIGO) AS TRC_SEQUENCIA, '+
                                  ' SUM(COALESCE(T1.TRC_VALOR_PAGO,0)) AS TOTAL '+
            ' FROM TITULO_A_RECEBER T1, PEDIDO_DE_VENDA T4 '+
            ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
            ' AND T1.TRC_SITUACAO=2 '+
            DataINI+DataFIM+
            ' AND T1.PDV_CODIGO=T4.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=T4.CNC_CODIGO '+
            ' AND EXISTS (SELECT T2.PDV_CODIGO '+
            '   FROM ITEM_DE_PEDIDO_DE_VENDA T2, PEDIDO_DE_VENDA T3 '+
            '   WHERE T3.PDV_CODIGO<>-10 '+
            '   AND T3.PDV_SITUACAO=4 '+
            '   AND T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                CdFUN+CdAGF+sSomenteLinha+sSomenteCatalogo+
            '   AND T3.PDV_CODIGO=T2.PDV_CODIGO '+
            '   AND T2.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T2.PDV_CODIGO=T1.PDV_CODIGO)'+
            ' GROUP BY T4.PDV_CODIGO '+
            ' HAVING COUNT(T1.TRC_CODIGO) = ''9'' ';
          QrParcelas9.Open;

          QrParcelas10.SQL.Text := 'SELECT '+
                                  ' COUNT(T1.TRC_CODIGO) AS TRC_SEQUENCIA, '+
                                  ' SUM(COALESCE(T1.TRC_VALOR_PAGO,0)) AS TOTAL '+
            ' FROM TITULO_A_RECEBER T1, PEDIDO_DE_VENDA T4 '+
            ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
            ' AND T1.TRC_SITUACAO=2 '+
            DataINI+DataFIM+
            ' AND T1.PDV_CODIGO=T4.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=T4.CNC_CODIGO '+
            ' AND EXISTS (SELECT T2.PDV_CODIGO '+
            '   FROM ITEM_DE_PEDIDO_DE_VENDA T2, PEDIDO_DE_VENDA T3 '+
            '   WHERE T3.PDV_CODIGO<>-10 '+
            '   AND T3.PDV_SITUACAO=4 '+
            '   AND T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                CdFUN+CdAGF+sSomenteLinha+sSomenteCatalogo+
            '   AND T3.PDV_CODIGO=T2.PDV_CODIGO '+
            '   AND T2.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T2.PDV_CODIGO=T1.PDV_CODIGO)'+
            ' GROUP BY T4.PDV_CODIGO '+
            ' HAVING COUNT(T1.TRC_CODIGO) = ''10'' ';
          QrParcelas10.Open;
        end;
        }




      report.preview;
      Close;
    end;
  end
  else if (tag = 0) then //Somente Produtos
  Begin
    Application.CreateForm(Trpt_VendasClienteProduto, rpt_VendasClienteProduto);
    with rpt_VendasClienteProduto do
    Begin
      tag := 0;
      zrgProduto.Height := 0;
      zrb_detalhe.Height := 0;

      if rdgDataCadastro1.Checked then
        zrlFiltros.Caption := '(Cad)'+sFiltros
      else if rdgDataAlterado.Checked then
        zrlFiltros.Caption := '(Alt)'+sFiltros
      else if rdgDataEmissao.Checked then
        zrlFiltros.Caption := '(Emi)'+sFiltros
      else if rdgDataDevolucao.Checked then
        zrlFiltros.Caption := '(Dev)'+sFiltros
      else if rdgDataEntrega.Checked then
        zrlFiltros.Caption := '(Ent)'+sFiltros
      else if rdgDataPrevisao.Checked then
        zrlFiltros.Caption := '(Pre)'+sFiltros;


      sOrdem := ' T1.PRD_CODIGO ';
      if not ckbAgrupar.Checked then
      Begin
        zrgGrupoOpcional.Expression := '';
        zrgGrupoOpcional.Height := 0;
        zrbRodapeGrupoOpcional.Height := 0;
      end
      else
      Begin
        case cmbAgrupar.ItemIndex of
          0: Begin
               zrlTituloGrupo.Caption := 'Grupo:';
               zrgGrupoOpcional.Expression := 'GRP_CODIGO';
               sOrdem := ' T3.GRP_CODIGO,T1.PRD_CODIGO ';
             end;
          1: Begin
               zrlTituloGrupo.Caption := 'Vendedor(a):';
               zrgGrupoOpcional.Expression := 'FUN_CODIGO';
               sOrdem := ' T1.FUN_CODIGO,T1.PRD_CODIGO ';
             end;
          2: Begin
               zrlTituloGrupo.Caption := 'Fornecedor:';
               zrgGrupoOpcional.Expression := 'FOR_CODIGO';
               sOrdem := ' T3.FOR_CODIGO,T1.PRD_CODIGO ';
             end;
        end;
      end;

      if ckbSaltarLinha.Checked then
        zrbRodapeGrupoProduto.Height := 2;

      if DM.Configuracao1.Empresa IN [empEletro,empPetromax] then
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_PRECO_DESC=IPV_PRECO '+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE ((IPV_PRECO_DESC IS NULL) OR (IPV_PRECO_DESC=0))');
      Item_Pedido_Venda1.Close;

      //Somente HOPE a consulta será aberta
      qrySomenteLinha.Close;
      qrySomenteLinha.SQL.Text := 'SELECT SUM(T1.IPV_QUANTIDADE) AS QTD, '+
        ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) AS VALOR '+
        ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
        ' WHERE (T2.CLI_CODIGO<>0) '+
        DataINI+DataFIM+(*CdFOR - Para não filtrar*)sSomentePDV+sPacote+
        Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
        PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+
        CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
        sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
        ' AND (T3.PRD_FORA_DE_LINHA=0 OR T3.PRD_FORA_DE_LINHA IS NULL) '+
        ' AND T1.PDV_CODIGO=T2.PDV_CODIGO '+
        ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T1.PRD_CODIGO=T3.PRD_CODIGO ';

      //Somente HOPE a consulta será aberta
      qrySomenteForaLinha.Close;
      qrySomenteForaLinha.SQL.Text := 'SELECT SUM(T1.IPV_QUANTIDADE) AS QTD, '+
        ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) AS VALOR '+
        ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
        ' WHERE (T2.CLI_CODIGO<>0) '+
        DataINI+DataFIM+(*CdFOR - Para não filtrar*)sSomentePDV+sPacote+
        Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
        PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+
        CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
        sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
        ' AND T3.PRD_FORA_DE_LINHA=1 '+
        ' AND T1.PDV_CODIGO=T2.PDV_CODIGO '+
        ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T1.PRD_CODIGO=T3.PRD_CODIGO ';

      //Somente HOPE a consulta será aberta
      qrySomenteCatalogo.Close;
      qrySomenteCatalogo.SQL.Text := 'SELECT SUM(T1.IPV_QUANTIDADE) AS QTD, '+
        ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) AS VALOR '+
        ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
        ' WHERE (T2.CLI_CODIGO<>0) '+
        DataINI+DataFIM+(*CdFOR - Para não filtrar*)sSomentePDV+sPacote+
        Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
        PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+
        CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
        sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
        ' AND T3.PRD_CATALOGO=1 '+
        ' AND T1.PDV_CODIGO=T2.PDV_CODIGO '+
        ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T1.PRD_CODIGO=T3.PRD_CODIGO ';

      if ckbProdutosMaisVendidos.Checked then
      Begin
        if not VerificaInteiroBranco(edtQuantidadeMaiores.Text) then
          Raise exception.Create('Quantidade de Mais Vendidos inválida!');
        if edtQuantidadeMaiores.Text <> '0' then
          sTop := ' TOP '+edtQuantidadeMaiores.Text;
        if ckbPorFornecedor.Checked then
        Begin
          Item_Pedido_Venda1.SQL.Text:='SELECT '+sTop+
            ' T3.FOR_CODIGO AS PRD_CODIGO, '+
            ' SUM(T1.IPV_QUANTIDADE) IPV_QUANTIDADE, '+
            ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) IPV_PRECO '+
            ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
            ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) AND '+
            ' (T1.PDV_CODIGO = T2.PDV_CODIGO) '+DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
            Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
            PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
            CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
            sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
            ' AND T1.PRD_CODIGO=T3.PRD_CODIGO '+
            ' GROUP BY T3.FOR_CODIGO '+
            ' ORDER BY SUM(T1.IPV_QUANTIDADE) DESC ';
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT SUM(T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO) TOTAL '+
              ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
              ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) '+
              ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
              Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
              PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
              CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
              sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
              ' AND T1.PRD_CODIGO=T3.PRD_CODIGO ';
            Open;
            vTotal := FieldByName('TOTAL').asFloat; //Para Cálculo do Percentual por Item
          end;
        end
        else if not ckbExibirSubGrupo.Checked then
        Begin
          Item_Pedido_Venda1.SQL.Text:='SELECT '+sTop+
            ' T1.PRD_CODIGO, '+
            ' SUM(T1.IPV_QUANTIDADE) IPV_QUANTIDADE, '+
            ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) IPV_PRECO '+
            ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
            ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) '+
            ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
            Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
            PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
            CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
            sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
            ' AND T1.PRD_CODIGO=T3.PRD_CODIGO '+
            ' GROUP BY T1.PRD_CODIGO '+
            ' ORDER BY SUM(T1.IPV_QUANTIDADE) DESC ';
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT SUM(T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO) TOTAL '+
              ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
              ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) '+
              ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
              Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
              PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
              CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
              sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
              ' AND T1.PRD_CODIGO=T3.PRD_CODIGO ';
            Open;
            vTotal := FieldByName('TOTAL').asFloat; //Para Cálculo do Percentual por Item
          end;
        end
        else //SubGrupo Mais Vendido
        Begin
          Item_Pedido_Venda1.SQL.Text:='SELECT '+sTop+
            ' T3.SGP_CODIGO AS PRD_CODIGO, '+
            ' SUM(T1.IPV_QUANTIDADE) IPV_QUANTIDADE, '+
            ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) IPV_PRECO '+
            ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
            ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) '+
            ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
            Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
            PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
            CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
            sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
            ' AND T1.PRD_CODIGO=T3.PRD_CODIGO '+
            ' GROUP BY T3.SGP_CODIGO '+
            ' ORDER BY SUM(T1.IPV_QUANTIDADE) DESC ';
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT SUM(T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO) TOTAL '+
              ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
              ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) '+
              ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
              Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
              PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
              CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
              sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
              ' AND T1.PRD_CODIGO=T3.PRD_CODIGO ';
            Open;
            vTotal := FieldByName('TOTAL').asFloat; //Para Cálculo do Percentual por Item
          end;
        end;
      end
      else
      Begin
        Item_Pedido_Venda1.SQL.Text:='SELECT T1.PRD_CODIGO,T1.IPV_QUANTIDADE, '+
          ' ((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) AS IPV_PRECO,'+
          ' T1.FUN_CODIGO, T3.FOR_CODIGO, T3.GRP_CODIGO '+
          ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
          ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) '+
          ' AND (T2.CLI_CODIGO<>0) '+
          ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+
          DataINI+DataFIM+CdFOR+sSomentePDV+sPacote+sEntregaDeposito+
          Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
          PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+
          CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
          sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
          ' AND T1.PRD_CODIGO=T3.PRD_CODIGO '+
          ' ORDER BY '+sOrdem;
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT SUM(T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO) TOTAL '+
            ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
            ' WHERE T2.CLI_CODIGO<>0 '+
            DataINI+DataFIM+CdFOR+sSomentePDV+sPacote+sEntregaDeposito+
            Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
            PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+
            CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
            sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
            ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND T2.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND T1.PRD_CODIGO=T3.PRD_CODIGO ';
          Open;
          vTotal := FieldByName('TOTAL').asFloat; //Para Cálculo do Percentual por Item
        end;
      end;

      Item_Pedido_Venda1.Open;
      if Item_Pedido_Venda1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.preview;
      Close;
    end;
  end
  else if tag = 1 then //Gráfico de Produtos Mais Vendidos
  Begin
    Application.CreateForm(TfMxGraficoProdutosMaisVendidos, fMxGraficoProdutosMaisVendidos);
    with fMxGraficoProdutosMaisVendidos do
    Begin
      tag := 0;
      query1.Close;
      if ckbProdutosMaisVendidos.Checked then
      Begin
        if not VerificaInteiroBranco(edtQuantidadeMaiores.Text) then
          Raise exception.Create('Quantidade de Mais Vendido inválida!');
        if edtQuantidadeMaiores.Text <> '0' then
          sTop := ' TOP '+edtQuantidadeMaiores.Text;
        if ckbPorFornecedor.Checked then
          query1.SQL.Text:='SELECT '+sTop+
            ' T4.FOR_RZ_SOCIAL AS DESCRICAO, '+
            ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*T1.IPV_PRECO) TOTAL, '+
            ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*(T1.IPV_PRECO-T1.IPV_PRECO_DESC)) TOTAL2, '+
            ' SUM(T1.IPV_QUANTIDADE) QUANTIDADEVENDA '+
            ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3, Fornecedor T4 '+
            ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) AND '+
            ' (T1.PDV_CODIGO = T2.PDV_CODIGO) '+DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
            Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
            PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
            CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
            sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
            ' AND T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
            ' GROUP BY T4.FOR_RZ_SOCIAL '+
            ' ORDER BY SUM(T1.IPV_QUANTIDADE) DESC '
        else if not ckbExibirSubGrupo.Checked then
          query1.SQL.Text:='SELECT '+sTop+
            ' T3.PRD_DESCRICAO AS DESCRICAO, '+
            ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*T1.IPV_PRECO) TOTAL, '+
            ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*(T1.IPV_PRECO-T1.IPV_PRECO_DESC)) TOTAL2, '+
            ' SUM(T1.IPV_QUANTIDADE) QUANTIDADEVENDA '+
            ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3 '+
            ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) AND '+
            ' (T1.PDV_CODIGO = T2.PDV_CODIGO) '+DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
            Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
            PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
            CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
            sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
            ' AND T1.PRD_CODIGO=T3.PRD_CODIGO '+
            ' GROUP BY T3.PRD_DESCRICAO '+
            ' ORDER BY SUM(T1.IPV_QUANTIDADE) DESC '
        else //SubGrupo
          query1.SQL.Text:='SELECT '+sTop+
            ' T4.SGP_DESCRICAO AS DESCRICAO, '+
            ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*T1.IPV_PRECO) TOTAL, '+
            ' SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*(T1.IPV_PRECO-T1.IPV_PRECO_DESC)) TOTAL2, '+
            ' SUM(T1.IPV_QUANTIDADE) QUANTIDADEVENDA '+
            ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Produto T3, SubGrupo T4 '+
            ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) AND '+
            ' (T1.PDV_CODIGO = T2.PDV_CODIGO) '+DataINI+DataFIM+CdFOR+sSomentePDV+sEntregaDeposito+
            Devedor+CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
            PRD+CdTBP+sRef+FUN+PDV+sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+sPacote+
            CdArquiteto+sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+
            sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
            ' AND T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.SGP_CODIGO=T4.SGP_CODIGO '+
            ' GROUP BY T4.SGP_DESCRICAO '+
            ' ORDER BY SUM(T1.IPV_QUANTIDADE) DESC ';
      end;
      query1.Open;
      if query1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      ShowModal;
    end;
  end
  else if (tag = 2) then //Preferencias de clientes
  Begin
    Application.CreateForm(Trpt_PreferenciaCliente, rpt_PreferenciaCliente);
    with rpt_PreferenciaCliente do
    Begin
      tag := 2;

      Group:=' T2.CNC_CLIENTE, T2.CLI_CODIGO, T1.PRD_CODIGO ';
      sOrdem:=' T2.CNC_CLIENTE, T2.CLI_CODIGO, QTD desc, T1.PRD_CODIGO ';

      if rdgDataCadastro1.Checked then
        zrlFiltros.Caption := '(Cad)'+sFiltros
      else if rdgDataAlterado.Checked then
        zrlFiltros.Caption := '(Alt)'+sFiltros
      else if rdgDataEmissao.Checked then
        zrlFiltros.Caption := '(Emi)'+sFiltros
      else if rdgDataDevolucao.Checked then
        zrlFiltros.Caption := '(Dev)'+sFiltros
      else if rdgDataEntrega.Checked then
        zrlFiltros.Caption := '(Ent)'+sFiltros
      else if rdgDataPrevisao.Checked then
        zrlFiltros.Caption := '(Pre)'+sFiltros;

      Query1.Close;
      Query1.SQL.Text:='SELECT T2.CNC_CLIENTE, T2.CLI_CODIGO, T1.PRD_CODIGO,'+
        ' SUM(T1.IPV_QUANTIDADE)AS QTD'+
        ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
        ' WHERE (T2.CLI_CODIGO<>0) '+
        DataINI+DataFIM+CdFOR+Devedor+sSomentePDV+sEntregaDeposito+
        CNC+SIT+CLI+sCPF+sConvenio+sTipoPessoa+sTipoCliente+sClassificacao+
        PRD+CdTBP+sRef+FUN+PDV+
        sOBS+TPG+FPG+AGF+NTF+Valor+sGarantia+AcimaNormal+CdArquiteto+
        sEntregaEmbarque+sVendasSemTitulos+sTipoVenda+CdIndicacao+sGrupoEspecial+sPacote+
        sDocumento+sCaixa+sObsItem+sSomentePRDSER+CdFPE+sSomenteBonus+COO+CCF+
        ' AND (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T1.PDV_CODIGO = T2.PDV_CODIGO) '+
        ' GROUP BY '+Group+
        ' ORDER BY '+sOrdem;
       Query1.Open;
      if Query1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      SZRLabel15.Caption := mskDataINI.Text;
      SZRLabel17.Caption := mskDataFIM.Text;
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.preview;
      Close;
    end;
  end;
end;

procedure TfMxSVendasCliente.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=8;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxSVendasCliente.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=21;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=21;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfMxSVendasCliente.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSVendasCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Vendedor1.Close;
  CentroCusto1.Close;
  Action := cafree;
end;

procedure TfMxSVendasCliente.ckbCodigoPDVClick(Sender: TObject);
begin
  if ckbCodigoPDV.Checked then
  Begin
    edtCodigoPDV.Color:=clWindow;
    edtCodigoPDV.Enabled:=True;
    try
      edtCodigoPDV.SetFocus;
    except
    end;
  end
  else
  Begin
    edtCodigoPDV.Color:=AlteraCorComponentes;
    edtCodigoPDV.Clear;
    edtCodigoPDV.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbTipoPagamentoClick(Sender: TObject);
begin
  if ckbTipoPagamento.Checked then
  Begin
    Parametro1.Open;
    cmbTipoPag.Enabled := True;
    cmbTipoPag.Color := clWindow;
    cmbTipoPag.ItemIndex := 0;
    dblTipoPagamento.Color:=clWindow;
    dblTipoPagamento.Enabled:=True;
    dblTipoPagamento.KeyValue:=Parametro1.CodigoPAR;
    try
      dblTipoPagamento.SetFocus;
    except
    end;
  end
  else
  Begin
    Parametro1.Close;
    cmbTipoPag.Enabled := False;
    cmbTipoPag.Color := AlteraCorComponentes;
    cmbTipoPag.ItemIndex := -1;
    dblTipoPagamento.Color:=AlteraCorComponentes;
    dblTipoPagamento.KeyValue:=-1;
    dblTipoPagamento.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbCodigoFPGClick(Sender: TObject);
begin
  if ckbCodigoFPG.Checked then
  Begin
    Forma_de_Pagamento1.Open;
    cmbCodigoFPG.Enabled := True;
    cmbCodigoFPG.Color := clWindow;
    cmbCodigoFPG.ItemIndex := 0;
    dblCodigoFPG.Color:=clWindow;
    dblCodigoFPG.Enabled:=True;
    dblCodigoFPG.KeyValue:=Forma_de_Pagamento1.CodigoFPG;
    try
      dblCodigoFPG.SetFocus;
    except
    end;      
  end
  else
  Begin
    Forma_de_Pagamento1.Close;
    cmbCodigoFPG.Enabled := False;
    cmbCodigoFPG.Color := AlteraCorComponentes;
    cmbCodigoFPG.ItemIndex := -1;
    dblCodigoFPG.Color:=AlteraCorComponentes;
    dblCodigoFPG.KeyValue:=-1;
    dblCodigoFPG.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbCodigoAGFClick(Sender: TObject);
begin
  if ckbCodigoAGF.Checked then
  Begin
    AgenteFin1.Open;
    cmbAgenteFinanceiro.Enabled := True;
    cmbAgenteFinanceiro.Color := clWindow;
    cmbAgenteFinanceiro.ItemIndex := 0;
    dblCodigoAGF.Color:=clWindow;
    dblCodigoAGF.Enabled:=True;
    dblCodigoAGF.KeyValue:=AgenteFin1.CodigoAGF;
    try
      dblCodigoAGF.SetFocus;
    except
    end;      
  end
  else
  Begin
    AgenteFin1.Close;
    cmbAgenteFinanceiro.Enabled := False;
    cmbAgenteFinanceiro.Color := AlteraCorComponentes;
    cmbAgenteFinanceiro.ItemIndex := -1;
    dblCodigoAGF.Color:=AlteraCorComponentes;
    dblCodigoAGF.KeyValue:=-1;
    dblCodigoAGF.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    try
      dblCodigoCNC.SetFocus;
    except
    end;      
  end
  else
  Begin
    if tag<>2 then
    begin
      CentroCusto1.Close;
      dblCodigoCNC.Color:=AlteraCorComponentes;
      dblCodigoCNC.KeyValue:=-1;
      dblCodigoCNC.Enabled:=False;
    end;
  end;
end;

procedure TfMxSVendasCliente.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbTipoSituacao.Enabled := True;
    cmbTipoSituacao.Color := clWindow;
    cmbTipoSituacao.ItemIndex := 0;
    cmbSituacao.Color:=clWindow;
    cmbSituacao.Enabled:=True;
    cmbSituacao.ItemIndex:=1;
    try
      cmbSituacao.SetFocus;
    except
    end;      
  end
  else
  Begin
    cmbTipoSituacao.Enabled := False;
    cmbTipoSituacao.Color := AlteraCorComponentes;
    cmbTipoSituacao.ItemIndex := -1;
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
    cmbSituacao.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbNumeroNotaClick(Sender: TObject);
begin
  if ckbNumeroNota.Checked then
  Begin
    ckbVendasPorFaturar.Checked := False;
    edtNumeroNota.Color:=clWindow;
    edtNumeroNota.Enabled:=True;
    try
      edtNumeroNota.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtNumeroNota.Color:=AlteraCorComponentes;
    edtNumeroNota.Text:='';
    edtNumeroNota.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbValorTotalClick(Sender: TObject);
begin
  if ckbValorTotal.Checked then
  Begin
    cmbValorTotal.Color:=clWindow;
    cmbValorTotal.Enabled:=True;
    cmbValorTotal.ItemIndex:=4;
    edtValorTotal.Color:=clWindow;
    edtValorTotal.Enabled:=True;
    try
      edtValorTotal.SetFocus;
    except
    end;
  end
  else
  Begin
    cmbValorTotal.Color:=AlteraCorComponentes;
    cmbValorTotal.Enabled:=False;
    cmbValorTotal.ItemIndex:=-1;
    edtValorTotal.Color:=AlteraCorComponentes;
    edtValorTotal.Text:='';
    edtValorTotal.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbVendasPorFaturarClick(Sender: TObject);
begin
  if ckbVendasPorFaturar.Checked then
  Begin
    ckbNumeroNota.Checked := False;
    ckbVendasFaturadas.Checked := False;
    ckbLJ3.Checked := False;
    ckbLJ4.Checked := False;
  end;
end;

procedure TfMxSVendasCliente.ckbVendasFaturadasClick(Sender: TObject);
begin
  if ckbVendasFaturadas.Checked then
  Begin
    ckbVendasPorFaturar.Checked := False;
    ckbLJ3.Checked := True;
    ckbLJ4.Checked := True;
  end;
end;

procedure TfMxSVendasCliente.ckbSinteticoClick(Sender: TObject);
begin
  if ckbSintetico.Checked then
  Begin
    ckbExibirParcelas.Checked := False;
    ckbExibirParcelas.Enabled := False;
    ckbVendedorPorPagina.Enabled := True;
    ckbSomenteItens.Enabled := True;
    if tag <> 1 then //Não é gráfico
      ckbSaltarLinha.Enabled := True;
    ckbSuperSintetico.Enabled := True;
  end
  else
  Begin
    ckbVendedorPorPagina.Enabled := False;
    ckbVendedorPorPagina.Checked := False;
    if tag<>2 then
      ckbExibirParcelas.Enabled := True;
    ckbSomenteItens.Enabled := False;
    ckbSomenteItens.Checked := False;
    if not ckbSomenteItens.Checked then
    Begin
      ckbSaltarLinha.Checked := False;
      ckbSaltarLinha.Enabled := False;
    end;
    ckbSuperSintetico.Checked := False;
    ckbSuperSintetico.Enabled := False;
  end;
end;

procedure TfMxSVendasCliente.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Color:=clWindow;
    edtCodigoFOR.Enabled:=True;
    try
      edtCodigoFOR.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtCodigoFOR.Color:=AlteraCorComponentes;
    edtCodigoFOR.Text:='';
    edtCodigoFOR.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.tag:=15;
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxSVendasCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  Begin
    Key := #0;
    Close;
  end
  else if key = #13 then
  Begin
    Key := #0;
    bitConfirmaClick(sender);
  end;
end;

procedure TfMxSVendasCliente.ckbNaoExibirItensClick(Sender: TObject);
begin
  if ckbNaoExibirItens.Checked then
    ckbSomenteItens.Checked := False;
end;

procedure TfMxSVendasCliente.ckbSomenteItensClick(Sender: TObject);
begin
  if ckbSomenteItens.Checked then
  Begin
    ckbExibirParcelas.Checked := False;
    ckbExibirParcelas.Enabled := False;
    ckbNaoExibirItens.Checked := False;
    ckbVendedorPorPagina.Checked := False;
    ckbVendedorPorPagina.Enabled := False;
    ckbProdutosMaisVendidos.Enabled := True;
    ckbAgrupar.Enabled := True;
    if tag <> 1 then //Não é gráfico
      ckbSaltarLinha.Enabled := True;
  end
  else
  Begin
    ckbExibirParcelas.Enabled := True;
    ckbProdutosMaisVendidos.Checked := False;
    ckbProdutosMaisVendidos.Enabled := False;
    ckbAgrupar.Checked := False;
    ckbAgrupar.Enabled := False;
    if not ckbSintetico.Checked then
    Begin
      ckbSaltarLinha.Checked := False;
      ckbSaltarLinha.Enabled := False;
    end;
  end;
end;

procedure TfMxSVendasCliente.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin

    Grupo1.Open;

    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    dblCodigoGRP.KeyValue:=Grupo1.CodigoGRP;
    ckbCodigoSGP.Enabled:=True;
    try
      dblCodigoGRP.SetFocus;
    except
    end;
  end
  else
  Begin
    Grupo1.Close;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    ckbCodigoSGP.Enabled:=False;
    dblCodigoGRP.KeyValue := 0;
  end;
end;

procedure TfMxSVendasCliente.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    SubGrupo1.Open;
    dblCodigoSGP.Enabled:=True;
    dblCodigoSGP.color:=clWindow;
    dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
  end
  else
  Begin
    SubGrupo1.Close;
    dblCodigoSGP.Enabled:=False;
    dblCodigoSGP.color:=AlteraCorComponentes;
    dblCodigoSGP.KeyValue:=0;
  end;
end;

procedure TfMxSVendasCliente.ckbSomenteAdiplentesClick(Sender: TObject);
begin
  if ckbSomenteAdiplentes.Checked then
  Begin
    ckbSomenteInadiplentes.Checked := False;
    ckbDataOrigemAdiplente.Enabled := True;
    rdgSemParcelas.Enabled := True;
    rdgTodasParcelas.Enabled := True;
  end
  else
  Begin
    ckbDataOrigemAdiplente.Enabled := False;
    ckbDataOrigemAdiplente.Checked := False;
    rdgSemParcelas.Enabled := False;
    rdgTodasParcelas.Enabled := False;
  end;
end;

procedure TfMxSVendasCliente.ckbSomenteInadiplentesClick(Sender: TObject);
begin
  if ckbSomenteInadiplentes.Checked then
  Begin
    ckbSomenteAdiplentes.Checked := False;
    ckbDataOrigemInadiplente.Enabled := True;
    rdgPedidoInteiro.Enabled := True;
    rdgQualquerParcela.Enabled := True;
  end
  else
  Begin
    ckbDataOrigemInadiplente.Enabled := False;
    ckbDataOrigemInadiplente.Checked := False;
    rdgPedidoInteiro.Enabled := False;
    rdgQualquerParcela.Enabled := False;
  end;
end;

procedure TfMxSVendasCliente.ckbProdutosMaisVendidosClick(Sender: TObject);
begin
  if ckbProdutosMaisVendidos.Checked then
  Begin
    ckbPorFornecedor.Enabled := True;
    ckbAgrupar.Checked := False;
    ckbAgrupar.Enabled := False;
    edtQuantidadeMaiores.Color:=clWindow;
    edtQuantidadeMaiores.Enabled:=True;
    edtQuantidadeMaiores.Text := '20';
    try
      edtQuantidadeMaiores.SetFocus;
    except
    end;
    ckbExibirSubGrupo.Enabled := True;
  end
  else
  Begin
    ckbAgrupar.Enabled := True;
    ckbPorFornecedor.Checked := False;
    ckbPorFornecedor.Enabled := False;
    edtQuantidadeMaiores.Color:=AlteraCorComponentes;
    edtQuantidadeMaiores.Clear;
    edtQuantidadeMaiores.Enabled:=False;
    ckbExibirSubGrupo.Checked := False;
    ckbExibirSubGrupo.Enabled := False;
  end;
end;

procedure TfMxSVendasCliente.ckbLJ3Click(Sender: TObject);
begin
  if ckbLJ3.Checked then
    ckbVendasPorFaturar.Checked := False;
end;

procedure TfMxSVendasCliente.ckbAgruparClick(Sender: TObject);
begin
  if ckbAgrupar.Checked then
  Begin
    cmbAgrupar.Color:=clWindow;
    cmbAgrupar.Enabled:=True;
    cmbAgrupar.ItemIndex:=2;
    try
      cmbAgrupar.SetFocus;
    except
    end;      
  end
  else
  Begin
    cmbAgrupar.Color:=AlteraCorComponentes;
    cmbAgrupar.ItemIndex:=-1;
    cmbAgrupar.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbQuantidadeAcimaClick(Sender: TObject);
begin
  if tag<>2 then
  begin
    if ckbQuantidadeAcima.Checked then
    Begin
      ckbSintetico.Checked := True;
      ckbSintetico.Enabled := False;
      ckbNaoExibirItens.Checked := False;
      ckbNaoExibirItens.Enabled := False;
    end
    else
    Begin
      ckbSintetico.Enabled := True;
      ckbNaoExibirItens.Enabled := True;
    end;
  end;
  if DM.Configuracao1.empresa = empLBM then
  Begin
    if ckbQuantidadeAcima.Checked then
    Begin
      rdgDataCadastro1.Checked := True;
      rdgDataCadastro1.Enabled := False;
      rdgDataAlterado.Enabled  := False;
      rdgDataEmissao.Enabled   := False;
      rdgDataDevolucao.Enabled := False;
      rdgDataEntrega.Enabled   := False;
      rdgDataPrevisao.Enabled  := False;
    end
    else
    Begin
      rdgDataCadastro1.Enabled := True;
      rdgDataAlterado.Enabled  := True;
      rdgDataEmissao.Enabled   := True;
      rdgDataDevolucao.Enabled := True;
      rdgDataEntrega.Enabled   := True;
      rdgDataPrevisao.Enabled  := True;
    end;
  end;
end;

procedure TfMxSVendasCliente.ckbArquitetoClick(Sender: TObject);
begin
  if ckbArquiteto.Checked then
  Begin
    edtArquiteto.Color:=clWindow;
    edtArquiteto.Enabled:=True;
    try
      edtArquiteto.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtArquiteto.Color:=AlteraCorComponentes;
    edtArquiteto.Clear;
    edtArquiteto.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbTipoVendaClick(Sender: TObject);
begin
  if ckbTipoVenda.Checked then
  Begin
    cmbTipoTipoVenda.Color:=clWindow;
    cmbTipoTipoVenda.Enabled:=True;
    cmbTipoTipoVenda.ItemIndex:=0;
    cmbTipoVenda.Color:=clWindow;
    cmbTipoVenda.Enabled:=True;
    cmbTipoVenda.ItemIndex:=0;
    try
      cmbTipoVenda.SetFocus;
    except
    end;      
  end
  else
  Begin
    cmbTipoTipoVenda.Color:=AlteraCorComponentes;
    cmbTipoTipoVenda.Enabled:=False;
    cmbTipoTipoVenda.ItemIndex:=-1;
    cmbTipoVenda.Color:=AlteraCorComponentes;
    cmbTipoVenda.ItemIndex:=-1;
    cmbTipoVenda.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbGrupoEspecialClick(Sender: TObject);
begin
  if ckbGrupoEspecial.Checked then
    ckbGrupoNorma.Checked := False;
end;

procedure TfMxSVendasCliente.ckbGrupoNormaClick(Sender: TObject);
begin
  if ckbGrupoNorma.Checked then
    ckbGrupoEspecial.Checked := False;
end;

procedure TfMxSVendasCliente.dblCodigoGRPClick(Sender: TObject);
begin
  SubGrupo1.Close;
  SubGrupo1.Open;
  if ckbCodigoSGP.Checked and (dblCodigoSGP.Text = '') then
    dblCodigoSGP.KeyValue := SubGrupo1.CodigoSGP;
end;

procedure TfMxSVendasCliente.SubGrupo1BeforeOpen(DataSet: TDataSet);
begin
  try
    SubGrupo1.ParamByName('GRP_CODIGO').asInteger := Grupo1.CodigoGRP
  except
    SubGrupo1.ParamByName('GRP_CODIGO').asInteger := -1;
  end;
end;

procedure TfMxSVendasCliente.ckbSomentePDVClick(Sender: TObject);
begin
  if ckbSomentePDV.Checked then
    ckbSomentePDS.Checked := False;
end;

procedure TfMxSVendasCliente.ckbSomentePDSClick(Sender: TObject);
begin
  if ckbSomentePDS.Checked then
    ckbSomentePDV.Checked := False;
end;

procedure TfMxSVendasCliente.ckbPacoteClick(Sender: TObject);
begin
  if ckbPacote.Checked then
  Begin
    edtPacote.Color:=clWindow;
    edtPacote.Enabled:=True;
    try
      edtPacote.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtPacote.Color:=AlteraCorComponentes;
    edtPacote.Clear;
    edtPacote.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbDocumentoClick(Sender: TObject);
begin
  if ckbDocumento.Checked then
  Begin
    edtDocumento.Color:=clWindow;
    edtDocumento.Enabled:=True;
    try
      edtDocumento.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtDocumento.Color:=AlteraCorComponentes;
    edtDocumento.Clear;
    edtDocumento.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbCaixaClick(Sender: TObject);
begin
  if ckbCaixa.Checked then
  Begin
    edtCaixa.Color:=clWindow;
    edtCaixa.Enabled:=True;
    try
      edtCaixa.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtCaixa.Color:=AlteraCorComponentes;
    edtCaixa.Clear;
    edtCaixa.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbMarcaClick(Sender: TObject);
begin
  if ckbMarca.Checked then
  Begin
    edtMarca.Color:=clWindow;
    edtMarca.Enabled:=True;
    try
      edtMarca.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtMarca.Color:=AlteraCorComponentes;
    edtMarca.Enabled:=False;
    edtMarca.Clear;
  end;
end;

procedure TfMxSVendasCliente.ckbCaracteristicaClick(Sender: TObject);
begin
  if ckbCaracteristica.Checked then
  Begin
    edtCaracteristica.Color:=clWindow;
    edtCaracteristica.Enabled:=True;
    try
      edtCaracteristica.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtCaracteristica.Color:=AlteraCorComponentes;
    edtCaracteristica.Enabled:=False;
    edtCaracteristica.Clear;
  end;
end;

procedure TfMxSVendasCliente.ckbObsItemClick(Sender: TObject);
begin
  if ckbObsItem.Checked then
  Begin
    edtObsItem.Color:=clWindow;
    edtObsItem.Enabled:=True;
    try
      edtObsItem.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtObsItem.Color:=AlteraCorComponentes;
    edtObsItem.Enabled:=False;
    edtObsItem.Clear;
  end;
end;

procedure TfMxSVendasCliente.ckbSomentePRDClick(Sender: TObject);
begin
  if ckbSomentePRD.Checked then
    ckbSomenteSER.Checked := False;
end;

procedure TfMxSVendasCliente.ckbSomenteSERClick(Sender: TObject);
begin
  if ckbSomenteSER.Checked then
    ckbSomentePRD.Checked := False;
end;

procedure TfMxSVendasCliente.ckbExibirSubGrupoClick(Sender: TObject);
begin
  if ckbExibirSubGrupo.Checked then
    ckbPorFornecedor.Checked := False;
end;

procedure TfMxSVendasCliente.ckbPorFornecedorClick(Sender: TObject);
begin
  if ckbPorFornecedor.Checked then
    ckbExibirSubGrupo.Checked := False;
end;

procedure TfMxSVendasCliente.ckbCodigoFPEClick(Sender: TObject);
begin
  if ckbCodigoFPE.Checked then
  Begin
    edtCodigoFPE.Color:=clWindow;
    edtCodigoFPE.Enabled:=True;
    try
      edtCodigoFPE.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtCodigoFPE.Color:=AlteraCorComponentes;
    edtCodigoFPE.Clear;
    edtCodigoFPE.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.cmbSituacaoChange(Sender: TObject);
begin
  if cmbSituacao.Enabled and
     (cmbSituacao.ItemIndex = 3) and
     (not rdgDataDevolucao.Checked) then
    rdgDataDevolucao.Checked := True;
end;

procedure TfMxSVendasCliente.ckbSomenteLinhaClick(Sender: TObject);
begin
  if ckbSomenteLinha.Checked then
    ckbSomenteForaLinha.Checked := False;
end;

procedure TfMxSVendasCliente.ckbSomenteForaLinhaClick(Sender: TObject);
begin
  if ckbSomenteForaLinha.Checked then
    ckbSomenteLinha.Checked := False;
end;

procedure TfMxSVendasCliente.ckbMalaDiretaClick(Sender: TObject);
begin
  if ckbMalaDireta.Checked then
  Begin
    edtArquivoMalaDireta.Enabled:=True;
    edtArquivoMalaDireta.Color:=clWindow;
    edtArquivoMalaDireta.Text := 'C:\SIAC_Vendas.txt';
    try
      edtArquivoMalaDireta.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtArquivoMalaDireta.Enabled:=False;
    edtArquivoMalaDireta.Color:=AlteraCorComponentes;
    edtArquivoMalaDireta.Clear;
  end;
end;

procedure TfMxSVendasCliente.ckbTipoPessoaClick(Sender: TObject);
begin
  if ckbTipoPessoa.Checked then
  Begin
    cmbTipoPessoa.Enabled:=True;
    cmbTipoPessoa.Color:=clWindow;
    cmbTipoPessoa.ItemIndex:=0;
    try
      cmbTipoPessoa.SetFocus;
    except
    end;      
  end
  else
  Begin
    cmbTipoPessoa.Enabled:=False;
    cmbTipoPessoa.Color:=AlteraCorComponentes;
    cmbTipoPessoa.ItemIndex:=-1;
  end;
end;

procedure TfMxSVendasCliente.ckbConvenioClick(Sender: TObject);
begin
  if ckbConvenio.Checked then
  Begin
    edtConvenio.Color:=clWindow;
    edtConvenio.Enabled:=True;
    try
      edtConvenio.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtConvenio.Color:=AlteraCorComponentes;
    edtConvenio.Clear;
    edtConvenio.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.rdgDataPrevisaoClick(Sender: TObject);
begin
  if rdgDataPrevisao.Checked then
    if ckbSituacao.Checked then
      cmbSituacao.ItemIndex := 0;
end;

procedure TfMxSVendasCliente.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    Parametro2.Open;
    dblTipo.Color:=clWindow;
    dblTipo.Enabled:=True;
    try
      dblTipo.SetFocus;
    except
    end;      
  end
  else
  Begin
    Parametro2.Close;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.Enabled:=False;
    dblTipo.KeyValue:=-1;
  end;
end;

procedure TfMxSVendasCliente.ckbLJ4Click(Sender: TObject);
begin
  if ckbLJ4.Checked then
    ckbVendasPorFaturar.Checked := False;
end;

procedure TfMxSVendasCliente.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := tbsCabecalho;
end;

procedure TfMxSVendasCliente.ckbReferenciaClick(Sender: TObject);
begin
  if ckbReferencia.Checked then
  Begin
    edtReferencia.Color:=clWindow;
    edtReferencia.Enabled:=True;
    try
      edtReferencia.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtReferencia.Color:=AlteraCorComponentes;
    edtReferencia.Clear;
    edtReferencia.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbCodigoTBPClick(Sender: TObject);
begin
  if ckbCodigoTBP.Checked then
  Begin
    edtCodigoTBP.Color:=clWindow;
    edtCodigoTBP.Enabled:=True;
    try
      edtCodigoTBP.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtCodigoTBP.Color:=AlteraCorComponentes;
    edtCodigoTBP.Clear;
    edtCodigoTBP.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbObservacaoClick(Sender: TObject);
begin
  if ckbObservacao.Checked then
  Begin
    edtObservacao.Color:=clWindow;
    edtObservacao.Enabled:=True;
    try
      edtObservacao.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtObservacao.Color:=AlteraCorComponentes;
    edtObservacao.Clear;
    edtObservacao.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbCPFClick(Sender: TObject);
begin
  if ckbCPF.Checked then
  Begin
    edtCPF.Color:=clWindow;
    edtCPF.Enabled:=True;
    try
      edtCPF.SetFocus;
    except
    end;      
  end
  else
  Begin
    edtCPF.Color:=AlteraCorComponentes;
    edtCPF.Clear;
    edtCPF.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbEspelhoPedidoClick(Sender: TObject);
begin
  if ckbEspelhoPedido.Checked then
  Begin
    ckbCodigoPDV.Checked := True;
    ckbCodigoPDV.Enabled := False;
    ckbCodigoCNC.Checked := True;
    ckbCodigoCNC.Enabled := False;
    ckbSintetico.Checked := False;
    ckbSintetico.Enabled := False;
  end
  else
  Begin
    ckbCodigoPDV.Enabled := True;
    ckbCodigoCNC.Enabled := True;
    ckbSintetico.Enabled := True;    
  end;
end;

procedure TfMxSVendasCliente.ckbIndicacaoClick(Sender: TObject);
begin
  if ckbIndicacao.Checked then
  Begin
    with Vendedor2 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM FUNCIONARIO '+
        ' WHERE FUN_SITUACAO <> 1 '+
      ' AND (FUN_APARECE_VENDAS=1 '+
      '  OR FUN_APARECE_SERVICOS=1) ';
        if ckbCodigoCNC.Checked then
          SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+
                  '  OR  FUN_TODOS_CENTROS=1) ');
        if DM.Configuracao1.Empresa = empLuciano then
          SQL.Add(' AND FUN_FUNCAO=4220 ');
        SQL.Add(' ORDER BY FUN_APELIDO ASC ');
      Open;
    end;
    dblIndicacao.Color:=clWindow;
    dblIndicacao.Enabled:=True;
    dblIndicacao.KeyValue := Vendedor2.CodigoFUN;
    dblIndicacao.SetFocus;
  end
  else
  Begin
    Vendedor2.Close;
    dblIndicacao.Color:=AlteraCorComponentes;
    dblIndicacao.KeyValue:=-1;
    dblIndicacao.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbGarantiaClick(Sender: TObject);
begin
  if ckbGarantia.Checked then
  Begin
    cmbGarantia.Color:=clWindow;
    cmbGarantia.Enabled:=True;
    cmbGarantia.ItemIndex:=4;
    edtGarantia.Color:=clWindow;
    edtGarantia.Enabled:=True;
    try
      edtValorTotal.SetFocus;
    except
    end;
  end
  else
  Begin
    cmbGarantia.Color:=AlteraCorComponentes;
    cmbGarantia.Enabled:=False;
    cmbGarantia.ItemIndex:=-1;
    edtGarantia.Color:=AlteraCorComponentes;
    edtGarantia.Clear;
    edtGarantia.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.ckbClassificacaoClick(Sender: TObject);
begin
  if ckbClassificacao.Checked then
  Begin
    Parametro4.Close;
    Parametro4.SQL.Text := 'SELECT * FROM PARAMETRO '+
      ' WHERE TPR_CODIGO=60 '+
      ' AND PAR_SITUACAO<>1 ';
    if ckbCodigoCNC.Checked then
      Parametro4.SQL.ADD(' AND (PAR_INFORMACAO=0 OR PAR_INFORMACAO='+IntToStr(dblCodigoCNC.KeyValue)+')');
    Parametro4.SQL.ADD(' ORDER BY PAR_DESCRICAO ');
    Parametro4.Open;
    dblClassificacao.Color:=clWindow;
    dblClassificacao.Enabled:=True;
    dblClassificacao.SetFocus;
  end
  else
  Begin
    Parametro4.Close;
    dblClassificacao.Color:=AlteraCorComponentes;
    dblClassificacao.Enabled:=False;
    dblClassificacao.KeyValue:=-1;
  end;
end;

procedure TfMxSVendasCliente.ckbDescPRDClick(Sender: TObject);
begin
  if ckbDescPRD.Checked then
  Begin
    edtDescPRD.Color:=clWindow;
    edtDescPRD.Enabled:=True;
    try                         
      edtDescPRD.SetFocus;
    except
    end;
  end
  else
  Begin
    edtDescPRD.Color:=AlteraCorComponentes;
    edtDescPRD.Clear;
    edtDescPRD.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.cbxCOOClick(Sender: TObject);
begin
  if cbxCOO.Checked then
  Begin
    edtCOO.Color:=clWindow;
    edtCOO.Enabled:=True;
    try
      edtCOO.SetFocus;
    except
    end;
  end
  else
  Begin
    edtCOO.Color:=AlteraCorComponentes;
    edtCOO.Clear;
    edtCOO.Enabled:=False;
  end;
end;

procedure TfMxSVendasCliente.cbxCCFClick(Sender: TObject);
begin
  if cbxCCF.Checked then
  Begin
    edtCCF.Color:=clWindow;
    edtCCF.Enabled:=True;
    try
      edtCCF.SetFocus;
    except
    end;
  end
  else
  Begin
    edtCCF.Color:=AlteraCorComponentes;
    edtCCF.Clear;
    edtCCF.Enabled:=False;
  end;
end;

end.
