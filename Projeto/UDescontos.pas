unit UDescontos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Configuracao, Variants,
  DBCtrls, Mask, ComCtrls, SQuery, CentroCusto, Parametro, Qt,
  ExtDlgs, MMSystem, IniFiles, UOperacao_sistema, ShellAPI;

type
  TfMxDescontos = class(TForm)
    Panel2: TPanel;
    bitFechar: TBitBtn;
    Configuracao1: TConfiguracao;
    PageControl1: TPageControl;
    tbsGeral: TTabSheet;
    tbsImpressoraFiscal: TTabSheet;
    Label14: TLabel;
    memMensagemPromocional: TMemo;
    tbsCentroDeCusto: TTabSheet;
    tbsVendas: TTabSheet;
    tbsParametros: TTabSheet;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label34: TLabel;
    edtCCXPagFOR: TEdit;
    edtCCXPagTRN: TEdit;
    edtContaRecCli: TEdit;
    edtContaRecCliAnt: TEdit;
    edtPARTipoDocumento: TEdit;
    edtContaRecServico: TEdit;
    tbsMaquina: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    labDescontoSimples: TLabel;
    labDescontoEspecial: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    labDescontoLBM: TLabel;
    labJurosLBM: TLabel;
    labPercentualDescLBM: TLabel;
    labPercentualJurosLBM: TLabel;
    edtDescontoSimples: TEdit;
    edtDescontoEspecial: TEdit;
    edtDescontoSimpresPag: TEdit;
    edtDescontoEspecialPag: TEdit;
    edtPrazoDevolucao: TEdit;
    edtLimiteMelhorData: TEdit;
    edtEnviarSPC: TEdit;
    edtLBMDesconto60: TEdit;
    edtLBMJuros60: TEdit;
    Label18: TLabel;
    edtClienteBalcao: TEdit;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edtCodigoCAX: TEdit;
    edtMaquina: TEdit;
    edtMaxItensNota: TEdit;
    edtPastaSistema: TEdit;
    edtEmpresa: TEdit;
    Label42: TLabel;
    Label43: TLabel;
    edtPastaImagens: TEdit;
    Label44: TLabel;
    edtPastaSons: TEdit;
    Label45: TLabel;
    edtCentroDeCusto: TEdit;
    labEmpresa: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    edtRazaoSocial: TEdit;
    edtCodigoCNC: TEdit;
    edtNomeFantasia: TEdit;
    mskCNPJ: TMaskEdit;
    edtCGF: TEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    mskCEP: TMaskEdit;
    mskFone: TMaskEdit;
    cmbUF: TComboBox;
    edtBairro: TEdit;
    dblLogradouro: TDBLookupComboBox;
    mskFax: TMaskEdit;
    Label59: TLabel;
    CentroCusto1: TCentroCusto;
    labClienteBalcao: TLabel;
    labTipoDocumento: TLabel;
    labCCXPagFor: TLabel;
    labCCXPagTRN: TLabel;
    labCCXRecVenda: TLabel;
    labCCXRecServico: TLabel;
    labCCXRecVendaAnt: TLabel;
    SB_Alt: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    labCaixa: TLabel;
    ckbDaruma: TCheckBox;
    SB_AltMaquina: TSpeedButton;
    SB_SalvaMaquina: TBitBtn;
    SB_CancMaquina: TBitBtn;
    Label60: TLabel;
    Label61: TLabel;
    edtImpCheque: TEdit;
    edtLeitoraCheque: TEdit;
    Label62: TLabel;
    Label63: TLabel;
    ckbCaixa: TCheckBox;
    ckbMafalda: TCheckBox;
    SB_LocPastaSistema: TSpeedButton;
    SB_LocPastaImagens: TSpeedButton;
    SB_LocPastaSons: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Label64: TLabel;
    Label65: TLabel;
    edtPapelDeParede: TEdit;
    SB_PapelParede: TSpeedButton;
    Label66: TLabel;
    edtSomAbertura: TEdit;
    SB_SomAbertura: TSpeedButton;
    Label67: TLabel;
    edtSomSaida: TEdit;
    SB_SomSaida: TSpeedButton;
    Label68: TLabel;
    edtSomErro: TEdit;
    SB_SomErro: TSpeedButton;
    Label69: TLabel;
    edtSomMensagem: TEdit;
    SB_SomMensagem: TSpeedButton;
    Label70: TLabel;
    edtSomRegistradora: TEdit;
    SB_SomRegistradora: TSpeedButton;
    Label71: TLabel;
    edtSomSinos: TEdit;
    SB_SomSinos: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    OpenDialogSom1: TOpenDialog;
    SB_RepSomAbertura: TSpeedButton;
    SB_RepSomSaida: TSpeedButton;
    SB_RepSomErro: TSpeedButton;
    SB_RepSomMensagem: TSpeedButton;
    SB_RepSomRegistradora: TSpeedButton;
    SB_RepSomSinos: TSpeedButton;
    bitPadrao: TBitBtn;
    SB_RepPapelParede: TSpeedButton;
    tbsConfiguracoes: TTabSheet;
    Label36: TLabel;
    ckbCPD: TCheckBox;
    labNFerramenta: TLabel;
    edtNFerramenta: TEdit;
    Label30: TLabel;
    edtOrcamento: TEdit;
    ckbItemAutomatico: TCheckBox;
    Label31: TLabel;
    edtContaFactoring: TEdit;
    labCCXFactoring: TLabel;
    Label32: TLabel;
    edtTempoOcioso: TEdit;
    edtMaxLinhasImp: TEdit;
    Label76: TLabel;
    edtEMail: TEdit;
    Label77: TLabel;
    edtSite: TEdit;
    Label78: TLabel;
    edtDiasLibVendaInadiplencia: TEdit;
    Label79: TLabel;
    edtLimiteCreditoBasico: TEdit;
    Label33: TLabel;
    edtCodigoImpFiscal: TEdit;
    labImpressoraFiscal: TLabel;
    DSCentroCusto2: TDataSource;
    CentroCusto2: TCentroCusto;
    dblCodigoCNC: TDBLookupComboBox;
    Label84: TLabel;
    edtLimiteMediaVenda: TEdit;
    Label85: TLabel;
    Label86: TLabel;
    edtContaTransfere: TEdit;
    labCCXTransfere: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    labCCXAberturaCaixa: TLabel;
    labCCXFechamentoCaixa: TLabel;
    edtCCXAberturaCaixa: TEdit;
    edtCCXFechamentoCaixa: TEdit;
    Label93: TLabel;
    Label94: TLabel;
    labGrupoRepasse: TLabel;
    edtGrupoRepasse: TEdit;
    ckbPRDRefUnica: TCheckBox;
    ckbEstoqueDetalhado: TCheckBox;
    TabSheet1: TTabSheet;
    Label97: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    edtTaxaJuros: TEdit;
    edtDiasSemJuros: TEdit;
    edtPercentualCusto: TEdit;
    edtPercentualLucro: TEdit;
    edtAliquotaISS: TEdit;
    ckbIgnorarCheques: TCheckBox;
    edtCustoOperacional: TEdit;
    edtCustoOperacionalLJ3: TEdit;
    ckbIgnorarDepositos: TCheckBox;
    edtAliquotaPIS: TEdit;
    edtAliquotaCOFINS: TEdit;
    edtDiasSemCobranca: TEdit;
    cbxTipoCobranca: TComboBox;
    Label98: TLabel;
    Label99: TLabel;
    edtAliquotaCPMF: TEdit;
    Label100: TLabel;
    Label101: TLabel;
    labCCXVerificaCaixa: TLabel;
    edtContaVerificaCaixa: TEdit;
    TabSheet2: TTabSheet;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    labLaboratorio: TLabel;
    labMontagem: TLabel;
    edtLaboratorio: TEdit;
    edtMontagem: TEdit;
    Label105: TLabel;
    edtMeta1: TEdit;
    Label106: TLabel;
    edtCota1: TEdit;
    edtCota2: TEdit;
    ckbDiretoImpFiscal: TCheckBox;
    Label111: TLabel;
    edtIP: TEdit;
    Label112: TLabel;
    edtObservacao: TEdit;
    Label113: TLabel;
    Label114: TLabel;
    edtMeta2: TEdit;
    edtCota3: TEdit;
    edtCota4: TEdit;
    rbCPD1: TRadioButton;
    rbCPD2: TRadioButton;
    QueryExec: TQuery;
    SaveDialog1: TSaveDialog;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label115: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Bevel14: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ckbNotaFiscalEletronica: TCheckBox;
    ckbEstoqueIdeal: TCheckBox;
    TabSheet3: TTabSheet;
    cbxEmpresa: TComboBox;
    Label107: TLabel;
    bitConfirmar: TBitBtn;
    btnComunicacao: TBitBtn;
    qComunicacoes: TQuery;
    gbxComunicacao: TGroupBox;
    cbxComunicacao: TComboBox;
    cbxAutomatico: TCheckBox;
    cbxRelatorioGrafico: TCheckBox;
    Label108: TLabel;
    edtPastaPAF: TEdit;
    SB_LocPastaPAF: TSpeedButton;
    Label109: TLabel;
    edtNomeLoja: TEdit;
    btnAjustarEstoque: TBitBtn;
    edtProduto: TEdit;
    Label110: TLabel;
    qEstoque: TQuery;
    qEstoqueExec: TQuery;
    qProduto: TQuery;
    btnServico: TBitBtn;
    Label116: TLabel;
    Bevel15: TBevel;
    procedure FormShow(Sender: TObject);
    procedure bitFecharClick(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtClienteBalcaoChange(Sender: TObject);
    procedure edtPARTipoDocumentoChange(Sender: TObject);
    procedure edtCCXPagFORChange(Sender: TObject);
    procedure edtCCXPagTRNChange(Sender: TObject);
    procedure edtContaRecCliChange(Sender: TObject);
    procedure edtContaRecServicoChange(Sender: TObject);
    procedure edtContaRecCliAntChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoCAXChange(Sender: TObject);
    procedure SB_AltMaquinaClick(Sender: TObject);
    procedure SB_SalvaMaquinaClick(Sender: TObject);
    procedure SB_CancMaquinaClick(Sender: TObject);
    procedure SB_LocPastaSistemaClick(Sender: TObject);
    procedure SB_LocPastaImagensClick(Sender: TObject);
    procedure SB_LocPastaSonsClick(Sender: TObject);
    procedure SB_PapelParedeClick(Sender: TObject);
    procedure SB_SomAberturaClick(Sender: TObject);
    procedure SB_SomSaidaClick(Sender: TObject);
    procedure SB_SomErroClick(Sender: TObject);
    procedure SB_SomMensagemClick(Sender: TObject);
    procedure SB_SomRegistradoraClick(Sender: TObject);
    procedure SB_SomSinosClick(Sender: TObject);
    procedure SB_RepSomAberturaClick(Sender: TObject);
    procedure SB_RepSomSaidaClick(Sender: TObject);
    procedure SB_RepSomErroClick(Sender: TObject);
    procedure SB_RepSomMensagemClick(Sender: TObject);
    procedure SB_RepSomRegistradoraClick(Sender: TObject);
    procedure SB_RepSomSinosClick(Sender: TObject);
    procedure bitPadraoClick(Sender: TObject);
    procedure SB_RepPapelParedeClick(Sender: TObject);
    procedure Configuracao1BeforeOpen(DataSet: TDataSet);
    procedure edtContaFactoringChange(Sender: TObject);
    procedure edtCodigoImpFiscalChange(Sender: TObject);
    procedure dblCodigoCNCClick(Sender: TObject);
    procedure edtContaTransfereChange(Sender: TObject);
    procedure edtCCXAberturaCaixaChange(Sender: TObject);
    procedure edtCCXFechamentoCaixaChange(Sender: TObject);
    procedure edtGrupoRepasseChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtContaVerificaCaixaChange(Sender: TObject);
    procedure edtLaboratorioChange(Sender: TObject);
    procedure edtMontagemChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnComunicacaoClick(Sender: TObject);
    procedure SB_LocPastaPAFClick(Sender: TObject);
    procedure btnAjustarEstoqueClick(Sender: TObject);
    procedure btnServicoClick(Sender: TObject);
  private
    ArqConf:TIniFile;
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    procedure CarregaDadosMaquina;
    function FinalizaEdicaoMaquina: Boolean;
    function FinalizaEdicaoGeral: Boolean;
    procedure CarregaDados;
  public
    Entidade: TConfiguracao;
  end;

var
  fMxDescontos: TfMxDescontos;

implementation

uses funcoes, UDM, Cliente, UPrinc2, MxFotoAmpliada, Math, UComunicacao,
  CdServico;

{$R *.DFM}

procedure TfMxDescontos.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if (DM.Configuracao1.Empresa <> empMotical) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT USU_CODIGO FROM USUARIO '+
        ' WHERE USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ' AND (USU_NOME="ANDERSON") ';
      Open;
      if IsEmpty then
      Begin
        ckbCPD.Enabled := False;
      end;
    end;
  end;

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8110)) < 0 then
    ckbEstoqueDetalhado.Enabled := False;

  PageControl1.ActivePage := tbsGeral;
  if Entidade.Empresa = empEletro then
  Begin
    ckbCaixa.Visible := True;
    ckbMafalda.Visible := True;
  end;
  Parametro1.Open;
  if not (Entidade.Empresa in [empLBM, empMotical, empLuciano, empEletro,empPetromax,empCreator,empHope]) then //terá limite desconto a Prazo
  Begin
    labDescontoLBM.Visible := False;
    edtLBMDesconto60.Visible := False;
    labPercentualDescLBM.Visible := False;
    labJurosLBM.Visible := False;
    edtLBMJuros60.Visible := False;
    labPercentualJurosLBM.Visible := False;
  end;

  if Entidade.Empresa in [empMotical] then
  Begin
    labDescontoSimples.Caption  := 'À Vista:';
    labDescontoEspecial.Caption := 'À Prazo:';
    labDescontoLBM.Caption := 'Lentes:';
    labJurosLBM.Caption := 'Lentes:';
  end
  else if Entidade.Empresa in [empEletro,empLuciano,empPetromax,empCreator,empHope] then
  Begin
    labDescontoLBM.Caption := 'Prazo:';
    labJurosLBM.Caption := 'Prazo:';
  end;

  if not (Entidade.Empresa IN TEmpresasOtica) then
  Begin
    labNFerramenta.Visible := False;
    edtNFerramenta.Visible := False;
  end;

  if DM.Configuracao1.CPD then
  Begin
    dblCodigoCNC.Color := clWindow;
    dblCodigoCNC.Enabled := True;
  end;
  if (Entidade.Empresa IN [empPetromax, empLBM, empCreator]) then
    dblCodigoCNC.Visible := False
  else
  Begin
    CentroCusto2.Close;
    CentroCusto2.SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO IN (SELECT CNC_CODIGO FROM CONFIGURACAO) ';
    CentroCusto2.Open;
  end;
  //Anderson
  if DM.Configuracao1.FieldByName('CNF_QUALCPD').AsInteger=1 then
    rbCPD1.Checked:=true;

  if DM.Configuracao1.FieldByName('CNF_QUALCPD').AsInteger=2 then
    rbCPD2.Checked:=true;
  //


  qComunicacoes.Close;
  qComunicacoes.Open;
  if qComunicacoes.FieldByName('COM_PREFIXO').AsString = 'LO' then //Luciano Ótica
    cbxEmpresa.ItemIndex := 0
  else if qComunicacoes.FieldByName('COM_PREFIXO').AsString = 'AC' then //Água de Cheiro
    cbxEmpresa.ItemIndex := 1
  else if qComunicacoes.FieldByName('COM_PREFIXO').AsString = '01' then //Água de Cheiro - Quixeramobim
    cbxEmpresa.ItemIndex := 2
  else if qComunicacoes.FieldByName('COM_PREFIXO').AsString = 'AA' then //TESTE
    cbxEmpresa.ItemIndex := 3

  else
    cbxEmpresa.ItemIndex := -1;


  //01/06/2012
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    if ( DM.Configuracao1.CodigoUSU = 1 ) then //somente ADM
    begin
      btnComunicacao.Enabled := true;
      Label107.Enabled := true;
      cbxEmpresa.Enabled := true;

      gbxComunicacao.visible := true;
    end
    else
    begin
      btnComunicacao.Enabled := false;
      Label107.Enabled := false;
      cbxEmpresa.Enabled := false;

      gbxComunicacao.visible := false;
    end;
  end
  else
  begin
    btnComunicacao.Enabled := false;
    Label107.Enabled := false;
    cbxEmpresa.Enabled := false;

    gbxComunicacao.visible := false;
  end;
  //

  //Corrigir estoque fisico
  Label110.visible := ( DM.Configuracao1.CodigoUSU = 1 );
  edtProduto.visible := ( DM.Configuracao1.CodigoUSU = 1 );
  btnAjustarEstoque.visible := ( DM.Configuracao1.CodigoUSU = 1 );
  //

  dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
  dblCodigoCNCClick(sender);
end;

procedure TfMxDescontos.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxDescontos.bitConfirmarClick(Sender: TObject);
var
  mensagem,mensagem2,sIgnorarCheques,sIgnorarDepositos,sReferenciaUnica,sEstoqueDetalhado,sEstoqueIdeal,
    sNFE, sCPD,sCNC: String;
  sTipoCobr: Integer;
begin
  mensagem:='';
  mensagem2:='';
  sCPD:='';
  if (not (Entidade.Empresa IN TEmpresasConfiguracaoUnica)) then
    sCNC := ' WHERE (CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';

  if not VerificaFloatBranco(edtDescontoSimples.Text) then
    mensagem:=mensagem+'Desconto simples em venda inválido!'+#13;
  if not VerificaFloatBranco(edtDescontoEspecial.Text) then
    mensagem:=mensagem+'Desconto especial em venda inválido!'+#13;
  if not VerificaFloatBranco(edtLBMDesconto60.Text) then
    mensagem:=mensagem+'Desconto para Venda abaixo de '+edtLimiteMediaVenda.Text+' dias inválido!'+#13;
  if not VerificaFloatBranco(edtLBMJuros60.Text) then
    mensagem:=mensagem+'Juros para Venda acima de '+edtLimiteMediaVenda.Text+' dias inválido!'+#13;
  if not VerificaFloatBranco(edtDescontoSimpresPag.Text) then
    mensagem:=mensagem+'Desconto simples em pagamento inválido!'+#13;
  if not VerificaFloatBranco(edtDescontoEspecialPag.Text) then
    mensagem:=mensagem+'Desconto especial em pagamento inválido!'+#13;
  if not VerificaInteiroBranco(edtPrazoDevolucao.Text) then
    mensagem:=mensagem+'Quantidade de dias para devolução inválido!'+#13;
  if not VerificaInteiroBranco(edtLimiteMelhorData.Text) then
    mensagem:=mensagem+'Quantidade de dias para Melhor Data inválido!'+#13;
  if not VerificaInteiroBranco(edtEnviarSPC.Text) then
    mensagem:=mensagem+'Dias para Enviar ao SPC inválido!'+#13;
  if not VerificaInteiroBranco(edtPARTipoDocumento.Text) then
    mensagem:=mensagem+'Tipo de Documento inválido!'+#13;
  if not VerificaInteiroBranco(edtClienteBalcao.Text) then
    mensagem:=mensagem+'Código do Cliente à Vista inválido!'+#13;
  if not VerificaInteiroBranco(edtDiasLibVendaInadiplencia.Text) then
    mensagem:=mensagem+'Dias de Liberação para venda Inadiplente inválido!'+#13;
  if not VerificaFloatBranco(edtLimiteCreditoBasico.Text) then
    mensagem:=mensagem+'Limite de Crédito básico inválido!'+#13;
  if not VerificaInteiroBranco(edtLimiteMediaVenda.Text) then
    mensagem:=mensagem+'Limite de Média de Venda inválido!'+#13;
  if not VerificaInteiroBranco(edtCCXAberturaCaixa.Text) then
    mensagem:=mensagem+'Conta de Abertura de Caixa inválido!'+#13;
  if not VerificaInteiroBranco(edtCCXFechamentoCaixa.Text) then
    mensagem:=mensagem+'Conta de Fechamento de Caixa inválido!'+#13;
  if not VerificaInteiroBranco(edtCCXPagFOR.Text) then
    mensagem:=mensagem+'Conta de Pagamento de Fornecedor inválido!'+#13;
  if not VerificaInteiroBranco(edtCCXPagTRN.Text) then
    mensagem:=mensagem+'Conta de Pagamento de Transportadora inválido!'+#13;
  if not VerificaInteiroBranco(edtContaRecCli.Text) then
    mensagem:=mensagem+'Conta de Recebimento de Cliente inválido!'+#13;
  if not VerificaInteiroBranco(edtContaRecServico.Text) then
    mensagem:=mensagem+'Conta de Recebimento de Serviço inválido!'+#13;
  if not VerificaInteiroBranco(edtContaRecCliAnt.Text) then
    mensagem:=mensagem+'Conta de Recebimento de Cliente Antecipado inválido!'+#13;
  if not VerificaInteiroBranco(edtContaFactoring.Text) then
    mensagem:=mensagem+'Conta de Recebimento de Factoring inválido!'+#13;
  if not VerificaInteiroBranco(edtContaTransfere.Text) then
    mensagem:=mensagem+'Conta de Recebimento de Transferencia inválido!'+#13;
  if not VerificaInteiroBranco(edtContaVerificaCaixa.Text) then
    mensagem:=mensagem+'Conta de Verifica Caixa inválido!'+#13;
  if not VerificaInteiroBranco(edtGrupoRepasse.Text) then
    mensagem:=mensagem+'Grupo de Conta de Caixa Repasse inválido!'+#13;
  if not VerificaInteiroBranco(edtLaboratorio.Text) then
    mensagem:=mensagem+'Código do Serviço de Laboratório inválido!'+#13;
  if not VerificaInteiroBranco(edtMontagem.Text) then
    mensagem:=mensagem+'Código do Serviço de Montagem inválido!'+#13;
  if not VerificaFloatBranco(edtMeta1.Text) then
    mensagem:=mensagem+'Meta1 inválida!'+#13;
  if not VerificaFloatBranco(edtMeta2.Text) then
    mensagem:=mensagem+'Meta2 inválida!'+#13;
  if not VerificaFloatBranco(edtCota1.Text) then
    mensagem:=mensagem+'Cota1 inválida!'+#13;
  if not VerificaFloatBranco(edtCota2.Text) then
    mensagem:=mensagem+'Cota2 inválida!'+#13;
  if not VerificaFloatBranco(edtCota3.Text) then
    mensagem:=mensagem+'Cota3 inválida!'+#13;
  if not VerificaFloatBranco(edtCota4.Text) then
    mensagem:=mensagem+'Cota4 inválida!'+#13;
  if not VerificaFloatBranco(edtTaxaJuros.Text) then
    mensagem:=mensagem+'Taxa de Juros/Mês inválida!'+#13;
  if not VerificaInteiroBranco(edtDiasSemJuros.Text) then
    mensagem:=mensagem+'Quantidade de dias sem juros inválido!'+#13;
  if not VerificaInteiroBranco(edtDiasSemCobranca.Text) then
    mensagem:=mensagem+'Quantidade de dias sem Cobrança inválido!'+#13;
  if memMensagemPromocional.Lines.Text = '' then
    mensagem:=mensagem+'Mensagem Promocional inválida!';
  if not VerificaFloatBranco(edtPercentualCusto.Text) then
    mensagem:=mensagem+'Percentual de Custo inválido!';
  if not VerificaFloatBranco(edtPercentualLucro.Text) then
    mensagem:=mensagem+'Percentual de Lucro inválido!';
  if not VerificaFloatBranco(edtCustoOperacional.Text) then
    mensagem:=mensagem+'Percentual de Custo Operacional inválido!';
  if not VerificaFloatBranco(edtCustoOperacionalLJ3.Text) then
    mensagem:=mensagem+'Percentual de Custo Operacional LJ3 inválido!';
  if not VerificaFloatBranco(edtAliquotaISS.Text) then
    mensagem:=mensagem+'Alíquota de ISS inválido!';
  if not VerificaFloatBranco(edtAliquotaPIS.Text) then
    mensagem:=mensagem+'Alíquota de PIS inválido!';
  if not VerificaFloatBranco(edtAliquotaCOFINS.Text) then
    mensagem:=mensagem+'Alíquota de COFINS inválido!';
  if not VerificaFloatBranco(edtAliquotaCPMF.Text) then
    mensagem:=mensagem+'Alíquota de CPMF inválido!';
  if not VerificaFloatBranco(edtNFerramenta.Text) then
    mensagem:=mensagem+'NFerramenta inválido!';
  if edtNomeLoja.Text = '' then
    mensagem:=mensagem+'Nome da Loja inválido!';

  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    if (StrToFloat(edtDescontoSimples.Text)<0) or (StrToFloat(edtDescontoSimples.Text)>100)  then
      mensagem2:=mensagem2+'Desconto simples em venda inválido!'+#13;
    if (StrToFloat(edtDescontoEspecial.Text)<0) or (StrToFloat(edtDescontoEspecial.Text)>100)  then
      mensagem2:=mensagem2+'Desconto especial em venda inválido!'+#13;
    if (StrToFloat(edtDescontoSimpresPag.Text)<0) or (StrToFloat(edtDescontoSimpresPag.Text)>100)  then
      mensagem2:=mensagem2+'Desconto simples em pagamento inválido!'+#13;
    if (StrToFloat(edtDescontoEspecialPag.Text)<0) or (StrToFloat(edtDescontoEspecialPag.Text)>100)  then
      mensagem2:=mensagem2+'Desconto especial em pagamento inválido!'+#13;
    if (StrToFloat(edtPrazoDevolucao.Text)<0) then
      mensagem2:=mensagem2+'Quantidade de dias para devolução inválido!'+#13;
    if (StrToFloat(edtLimiteMelhorData.Text)<0) then
      mensagem2:=mensagem2+'Quantidade de dias para Melhor Data inválido!'+#13;
    if (StrToFloat(edtEnviarSPC.Text)<0) then
      mensagem2:=mensagem2+'Dias para Enviar ao SPC inválido!'+#13;
    if mensagem2 <> '' then
      ShowMessage(mensagem2);
  end;

  if ckbPRDRefUnica.Checked and
     (not Entidade.PrdReferenciaUnica) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT PRD_REFERENCIA '+
        ' FROM PRODUTO '+
        ' WHERE PRD_REFERENCIA IS NOT NULL '+
        ' AND PRD_REFERENCIA<>"" '+
        ' GROUP BY PRD_REFERENCIA '+
        ' HAVING COUNT(*)>1 ';
      Open;
      if not isEmpty then
        Raise exception.Create('Existem produtos com a mesma referencia! ('+FieldByName('PRD_REFERENCIA').asString+')');
    end;
  end;

  if (not ckbEstoqueDetalhado.Checked) and
     (Entidade.EstoqueDetalhado) then
  Begin
    If MessageDlg('O tipo Estoque Detalhado está sendo DESMARCADO.'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    ExecutaSQL(DM.QR_Comandos, 'UPDATE PRODUTO SET PRD_ESTOQUE_DETALHADO=0 '+
                               ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" ');
    ExecutaSQL(DM.QR_Comandos, 'DELETE FROM ITEM_DE_ESTOQUE_DETALHADO ');
    DM.Usuario1.GeraLog(8110, Entidade.CodigoCNC, 0, '.DESMARCAR TODOS');
  end;

  if (mensagem = '') and (mensagem2 = '') then
  Begin
    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET '+
         'CNF_JUR_NORM='+VirgPonto(edtDescontoSimples.Text)+
         ',CNF_JUR_ESP='+VirgPonto(edtDescontoEspecial.Text)+
         sCNC);
    except
      ShowMessage('Não Salvou Desconto em Vendas!');
    end;
    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET '+
         'CNF_LBM_DESC_60='+VirgPonto(edtLBMDesconto60.Text)+
         ',CNF_LBM_JUROS_60='+VirgPonto(edtLBMJuros60.Text)+
         sCNC);
    except
      ShowMessage('Não Salvou Desconto/Juros LBM em Vendas!');
    end;
    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET '+
         'CNF_JUR_NORM_PAG="'+edtDescontoSimpresPag.Text+'"'+
         ',CNF_JUR_ESP_PAG="'+edtDescontoEspecialPag.Text+'"'+
         sCNC);
    except
      try
        ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET '+
           'CNF_JUR_NORM_PAG='+VirgPonto(edtDescontoSimpresPag.Text)+
           ',CNF_JUR_ESP_PAG='+VirgPonto(edtDescontoEspecialPag.Text)+
           sCNC);
      except
        ShowMessage('Não Salvou Desconto em Pagamentos!');
      end;
    end;

    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET '+
         'CNF_LOJANOME='''+edtNomeLoja.Text+'''');
    except
      ShowMessage('Não Salvou nome da Loja!');
    end; 
    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET '+
         'CNF_QNT_DIAS_DEV='+edtPrazoDevolucao.Text+
         ',CNF_MELHORDATA='+edtLimiteMelhorData.Text+
         ',CNF_ENVIAR_SPC='+edtEnviarSPC.Text+
         ',CNF_MENSAGEMCUPOM="'+memMensagemPromocional.Lines.Text+'"'+
         sCNC);
    except
      ShowMessage('Não Salvou Qtd. de Dias, Melhor Data e Mensagem Cupom!');
    end;
    try
      sTipoCobr := cbxTipoCobranca.IteMIndex;
      if ckbCPD.Checked then
        sCPD := '1'
      else
        sCPD := '0';
      if ckbIgnorarCheques.Checked then
        sIgnorarCheques := '1'
      else
        sIgnorarCheques := '0';
      if ckbIgnorarDepositos.Checked then
        sIgnorarDepositos := '1'
      else
        sIgnorarDepositos := '0';
      if ckbPRDRefUnica.Checked then
        sReferenciaUnica := '1'
      else
        sReferenciaUnica := '0';
      if ckbEstoqueDetalhado.Checked then
        sEstoqueDetalhado := '1'
      else
        sEstoqueDetalhado := '0';

      if ckbEstoqueIdeal.Checked then
        sEstoqueIdeal := '1'
      else
        sEstoqueIdeal := '0';

      if ckbNotaFiscalEletronica.Checked then
        sNFE := '1'
      else
        sNFE := '0';

      ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET '+
         ' CNF_CLI_A_VISTA=' +edtClienteBalcao.Text+
         ',CNF_DIAS_VENDA_INADIPLENTE='+edtDiasLibVendaInadiplencia.Text+
         ',CNF_LIMITE_CREDITO_BASICO='+VirgPonto(edtLimiteCreditoBasico.Text)+
         ',CNF_LIMITE_MEDIA_VENDA='+edtLimiteMediaVenda.Text+
         ',CNF_CONT_ABER_CX='+edtCCXAberturaCaixa.Text+
         ',CNF_CONT_FECH_CX='+edtCCXFechamentoCaixa.Text+
         ',CNF_CONT_PAG_FOR='+edtCCXPagFOR.Text+
         ',CNF_CONT_PAG_TRN='+edtCCXPagTRN.Text+
         ',CNF_CONT_REC_CLI='+edtContaRecCli.Text+
         ',CNF_CONT_REC_SERVICO='+edtContaRecServico.Text+
         ',CNF_CONT_REC_CLI_ANT='+edtContaRecCliAnt.Text+
         ',CNF_CONT_FACTORING='+edtContaFactoring.Text+
         ',CNF_CONT_TRANSFERE='+edtContaTransfere.Text+
         ',CNF_CCX_VERIFICA_CAIXA='+edtContaVerificaCaixa.Text+
         ',CNF_GRUPO_REPASSE='+edtGrupoRepasse.Text+
         ',CNF_LABORATORIO='+edtLaboratorio.Text+
         ',CNF_MONTAGEM='+edtMontagem.Text+
         ',CNF_LAB_META='+VirgPonto(edtMeta1.Text)+
         ',CNF_LAB_COTA1='+VirgPonto(edtCota1.Text)+
         ',CNF_LAB_COTA2='+VirgPonto(edtCota2.Text)+
         ',CNF_MONT_META='+VirgPonto(edtMeta2.Text)+
         ',CNF_MONT_COTA1='+VirgPonto(edtCota3.Text)+
         ',CNF_MONT_COTA2='+VirgPonto(edtCota4.Text)+
         ',CNF_TIPO_DOCUMENTO='+edtPARTipoDocumento.Text+
         ',CNF_TAXAJUROS='+VirgPonto(edtTaxaJuros.Text)+
         ',CNF_PERCENTUAL_CUSTO='+VirgPonto(edtPercentualCusto.Text)+
         ',CNF_PERCENTUAL_LUCRO='+VirgPonto(edtPercentualLucro.Text)+
         ',CNF_CUSTO_OPERACIONAL='+VirgPonto(edtCustoOperacional.Text)+
         ',CNF_CUSTO_OPERACIONAL_LJ3='+VirgPonto(edtCustoOperacionalLJ3.Text)+
         ',CNF_ALIQUOTA_ISS='+VirgPonto(edtAliquotaISS.Text)+
         ',CNF_PIS='+VirgPonto(edtAliquotaPIS.Text)+
         ',CNF_COFINS='+VirgPonto(edtAliquotaCOFINS.Text)+
         ',CNF_CPMF='+VirgPonto(edtAliquotaCPMF.Text)+
         ',CNF_NFERRAMENTA='+VirgPonto(edtNFerramenta.Text)+
         ',CNF_CPD='+sCPD+
         ',CNF_IGNORAR_CHEQUES='+sIgnorarCheques+
         ',CNF_IGNORAR_DEPOSITOS='+sIgnorarDepositos+
         ',CNF_PRD_REF_UNICA='+sReferenciaUnica+
         ',CNF_ESTOQUE_DETALHADO='+sEstoqueDetalhado+
         ',CNF_ESTOQUE_IDEAL='+sEstoqueIdeal+
         ',CNF_NFE='+sNFE+
         ',CNF_QNT_DIAS_SEM_COBRA='+edtDiasSemCobranca.Text+
         ',CNF_COBRANCA='+IntToStr(sTipoCobr)+
         ',CNF_QNT_DIAS_SEM_JUROS='+edtDiasSemJuros.Text+
         sCNC);
    except
      ShowMessage('Não salvou os Parâmetros do sistema!');
    end;
    Entidade.Close;
    DM.Configuracao1.Close;
    DM.Configuracao1.Open;
    DM.Configuracao1.CodigoCNC := DM.Usuario1.CentroDeCusto;
    DM.Configuracao1.CodigoUSU := DM.Usuario1.CodigoUSU;
    DM.Usuario1.GeraLog(6900,Entidade.CodigoCNC,Entidade.CodigoCNF);
  end;
  if not FinalizaEdicaoGeral then
    ShowMessage('Não foi possível gravar o arquivo '+cArquivoConfiguracao+' !')
  else
    try
      sndPlaySound(PChar(cSomSinos),SND_ASYNC);
    except
    end;

  ShowMessage('É necessário sair do sistema para atualizar as configurações!');
end;

procedure TfMxDescontos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=caFree;
end;

procedure TfMxDescontos.edtClienteBalcaoChange(Sender: TObject);
begin
  try
    with DM.Cliente1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CLIENTE '+
        ' WHERE CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
        ' AND CLI_CODIGO='+edtClienteBalcao.Text;
      Open;
      labClienteBalcao.Caption := RazaoSocial;
    end;
  except
  end;
end;

procedure TfMxDescontos.edtPARTipoDocumentoChange(Sender: TObject);
begin
  try
    labTipoDocumento.Caption := DM.SelecionaParametro(StrToInt(edtPARTipoDocumento.Text));
  except
  end;
end;

procedure TfMxDescontos.edtCCXPagFORChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtCCXPagFOR.Text);
      Open;
      labCCXPagFor.Caption := Descricao;
    end;
  except
    labCCXPagFor.Caption := '';
  end;
end;

procedure TfMxDescontos.edtCCXPagTRNChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtCCXPagTRN.Text);
      Open;
      labCCXPagTRN.Caption := Descricao;
    end;
  except
    labCCXPagTRN.Caption := '';
  end;
end;

procedure TfMxDescontos.edtContaRecCliChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtContaRecCli.Text);
      Open;
      labCCXRecVenda.Caption := Descricao;
    end;
  except
    labCCXRecVenda.Caption := '';
  end;
end;

procedure TfMxDescontos.edtContaRecServicoChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtContaRecServico.Text);
      Open;
      labCCXRecServico.Caption := Descricao;
    end;
  except
    labCCXRecServico.Caption := '';
  end;
end;

procedure TfMxDescontos.edtContaRecCliAntChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtContaRecCliAnt.Text);
      Open;
      labCCXRecVendaAnt.Caption := Descricao;
    end;
  except
    labCCXRecVendaAnt.Caption := '';
  end;
end;

procedure TfMxDescontos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    PageControl1.ActivePage := tbsCentroDeCusto;
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End
  else if SB_SalvaMaquina.Enabled then
  Begin
    PageControl1.ActivePage := tbsMaquina;
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxDescontos.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  if Cabecalho = 1 then //Centro de Custo
  Begin
    SB_Ant.Enabled     := not Habilitar;
    SB_Prox.Enabled    := not Habilitar;
    SB_Alt.Enabled     := not Habilitar;
    SB_Salva.Enabled   := Habilitar;
    SB_Canc.Enabled    := Habilitar;
  end
  else if Cabecalho = 2 then //Maquina
  Begin
    edtMaquina.Enabled         := Habilitar;
    edtCodigoCAX.Enabled       := Habilitar;
    edtMaxItensNota.Enabled    := Habilitar;
    edtMaxLinhasImp.Enabled    := Habilitar;
    edtImpCheque.Enabled       := Habilitar;
    edtLeitoraCheque.Enabled   := Habilitar;
    edtOrcamento.Enabled       := Habilitar;
    edtTempoOcioso.Enabled     := Habilitar;
    edtCodigoImpFiscal.Enabled := Habilitar;
    edtPastaSistema.Enabled    := Habilitar;
    edtPastaImagens.Enabled    := Habilitar;
    edtPastaSons.Enabled       := Habilitar;
    edtPastaPAF.Enabled        := Habilitar;
    ckbDaruma.Enabled          := Habilitar;
    ckbItemAutomatico.Enabled  := Habilitar;
    ckbCaixa.Enabled           := Habilitar;
    ckbMafalda.Enabled         := Habilitar;
    SB_LocPastaSistema.Enabled := Habilitar;
    SB_LocPastaImagens.Enabled := Habilitar;
    SB_LocPastaSons.Enabled    := Habilitar;
    SB_LocPastaPAF.Enabled     := Habilitar;
    SB_AltMaquina.Enabled      := not Habilitar;
    SB_SalvaMaquina.Enabled    := Habilitar;
    SB_CancMaquina.Enabled     := Habilitar;
    ckbDiretoImpFiscal.Enabled := Habilitar;
    //19/05/2012
    cbxComunicacao.Enabled     := Habilitar;
    cbxAutomatico.Enabled      := Habilitar;
    cbxRelatorioGrafico.Enabled:= Habilitar;

    rbCPD1.Enabled:= Habilitar;
    rbCPD2.Enabled:= Habilitar;
  end;
end;


procedure TfMxDescontos.SB_AltClick(Sender: TObject);
begin
  CentroCusto1.PreparaAlteracao;
  AtualizaControles(1,True);
  edtRazaoSocial.SetFocus;
end;

procedure TfMxDescontos.SB_SalvaClick(Sender: TObject);
begin
  if CentroCusto1.FinalizaEdicao then
  Begin
    DM.Usuario1.GeraLog(6900,0,0,'Centro de Custo');
    AtualizaControles(1,False);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxDescontos.SB_CancClick(Sender: TObject);
begin
  CentroCusto1.CancelaEdicao;
  AtualizaControles(1,False);
end;

procedure TfMxDescontos.SB_AntClick(Sender: TObject);
var
  CdCNC:integer;
begin
  CdCNC := CentroCusto1.CodigoCNC;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CNC_CODIGO FROM CENTRO_DE_CUSTO ORDER BY CNC_CODIGO DESC';
    Open;
    Locate('CNC_CODIGO',IntToStr(CdCNC),[]);
    Next;
    if not EOF then
      CdCNC := FieldByName('CNC_CODIGO').asInteger
    else
    Begin
      ShowMessage('Primeiro Centro de Custo!');
      Exit;
    end;
  end;

  with CentroCusto1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC);
    Open;
    CarregaDados;
  end;
end;

procedure TfMxDescontos.SB_ProxClick(Sender: TObject);
var
  CdCNC:integer;
begin
  CdCNC := CentroCusto1.CodigoCNC;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CNC_CODIGO FROM CENTRO_DE_CUSTO ORDER BY CNC_CODIGO ASC';
    Open;
    Locate('CNC_CODIGO',IntToStr(CdCNC),[]);
    Next;
    if not EOF then
      CdCNC := FieldByName('CNC_CODIGO').asInteger
    else
    Begin
      ShowMessage('Último Centro de Custo!');
      Exit;
    end;
  end;

  with CentroCusto1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC);
    Open;
    CarregaDados;
  end;
end;

procedure TfMxDescontos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if PageControl1.ActivePage = tbsCentroDeCusto then
  Begin
    if key = #27 then
    Begin
      if SB_Canc.Enabled then
      Begin
        SB_Canc.SetFocus;
        SB_CancClick(sender);
      end
      else
        Close;
    end
    else if key = #13 then
    Begin
      if SB_Salva.Enabled then
      Begin
        SB_Salva.SetFocus;
        SB_SalvaClick(sender);
      end;
    end;
  end
  else if PageControl1.ActivePage = tbsMaquina then
  Begin
    if key = #27 then
    Begin
      if SB_CancMaquina.Enabled then
      Begin
        SB_CancMaquina.SetFocus;
        SB_CancMaquinaClick(sender);
      end
      else
        Close;
    end
    else if key = #13 then
    Begin
      if SB_SalvaMaquina.Enabled then
      Begin
        SB_SalvaMaquina.SetFocus;
        SB_SalvaMaquinaClick(sender);
      end;
    end;
  end
  else if key = #27 then
  Begin
    bitFechar.SetFocus;
    bitFecharClick(sender);
  end;

end;

procedure TfMxDescontos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 117) then
  Begin
    if (PageControl1.ActivePage = tbsCentroDeCusto) then
      SB_AltClick(sender)
    else if (PageControl1.ActivePage = tbsMaquina) then
      SB_AltMaquinaClick(sender);
  end;
end;

procedure TfMxDescontos.edtCodigoCAXChange(Sender: TObject);
begin
  try
    with DM.Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CAIXA '+
        ' WHERE CAX_CODIGO=:CAX_CODIGO ';
      ParamByName('CAX_CODIGO').asInteger := StrToInt(edtCodigoCAX.Text);
      Open;
      labCaixa.Caption := Descricao;
    end;
  except
  end;
end;

procedure TfMxDescontos.SB_AltMaquinaClick(Sender: TObject);
begin
  AtualizaControles(2,True);
  edtMaquina.SetFocus;
end;

procedure TfMxDescontos.SB_SalvaMaquinaClick(Sender: TObject);
var
 cpd:integer;
 //comunicacao: TComunicacao;
 Hand1: HWND;
begin
  //Anderson
  cpd:=1;
  if rbCPD1.Checked then
    cpd:=1;
  if rbCPD2.Checked then
    cpd:=2;

  if DM.Configuracao1.FieldByName('CNF_QUALCPD').AsInteger<>cpd then
  begin
    if Application.MessageBox(Pchar('Essa alteração é de sua responsabilidade, você tem certeza que deseja mudar de CPD?'),'Atenção!!!',MB_YESNO+MB_ICONQUESTION)<>id_yes then
      exit;
  end;

  if FinalizaEdicaoMaquina then
  Begin

    //19/05/2012
    try
      if cbxComunicacao.ItemIndex = 1 then
      begin
        //comunicacao := TComunicacao.Create;

        if not FileExists('Siac.udl') then
          TStringList.Create().SaveToFile('Siac.udl');
        ShellExecute(Hand1,'open',PChar('Siac.udl'), '','',SW_SHOWNORMAL);
      end;


      QueryExec.Close;
      QueryExec.SQL.Text:='UPDATE CONFIGURACAO SET CNF_QUALCPD='+inttostr(cpd);
      QueryExec.ExecSQL;
      // //
      DM.Usuario1.GeraLog(6900,0,0,'Maquina');
      AtualizaControles(2,False);
      CarregaDadosMaquina;

    finally
      //if Assigned(comunicacao) then
        //FreeAndNil(comunicacao);
    end;
  end;
end;

procedure TfMxDescontos.SB_CancMaquinaClick(Sender: TObject);
begin
  AtualizaControles(2,False);
  CarregaDadosMaquina;
end;

procedure TfMxDescontos.CarregaDadosMaquina;
var
  sComu, sAut, sRelGrafico: string;
begin
  if FileExists(cArquivoConfiguracao) then
  Begin
    ArqConf := TIniFile.Create(cArquivoConfiguracao);
    try
      edtPapelDeParede.Text   := ArqConf.ReadString('IMAGEM', 'PapelDeParede', '.');
      edtSomAbertura.Text     := ArqConf.ReadString('SOM', 'Abertura', '.');
      edtSomSaida.Text        := ArqConf.ReadString('SOM', 'Saida', '.');
      edtSomErro.Text         := ArqConf.ReadString('SOM', 'Erro', '.');
      edtSomMensagem.Text     := ArqConf.ReadString('SOM', 'Mensagem', '.');
      edtSomRegistradora.Text := ArqConf.ReadString('SOM', 'Registradora', '.');
      edtSomSinos.Text        := ArqConf.ReadString('SOM', 'Sinos', '.');

      //19/05/2012
      sComu       := ArqConf.ReadString('MAQUINA', 'Comunicacao', 'N');
      sAut        := ArqConf.ReadString('MAQUINA', 'ComAutomatico', 'N');


      edtPastaPAF.Text  := ArqConf.ReadString('MAQUINA', 'PastaPAF', '');

      //23/07/2013
      sRelGrafico := ArqConf.ReadString('MAQUINA', 'RelGrafico', 'N');

      cbxComunicacao.ItemIndex := IfThen(sComu = 'N', 0, 1);
      cbxAutomatico.Checked := (sAut = 'S');

      cbxRelatorioGrafico.Checked := (sRelGrafico = 'S');
    finally
      ArqConf.Free;
    end;
  end
  else
  Begin
    edtPapelDeParede.Text   := '.';
    edtSomAbertura.Text     := '.';
    edtSomSaida.Text        := '.';
    edtSomErro.Text         := '.';
    edtSomMensagem.Text     := '.';
    edtSomRegistradora.Text := '.';
    edtSomSinos.Text        := '.';
  end;

  edtEmpresa.Text := IntToStr(Entidade.Empresa);
  case Entidade.Empresa of
    0: labEmpresa.Caption := 'Não Registrada.';
    1: if DM.Usuario1.Mafalda <> 1 then
         labEmpresa.Caption := 'ELETRO GUERRA'
       else
         labEmpresa.Caption := 'MAFALDA MAGAZINE';
    2: labEmpresa.Caption := 'PETROMAX';
    3: Begin
         if Entidade.CodigoCNC <> 3 then
           labEmpresa.Caption := 'LBM MÓVEIS'
         else
           labEmpresa.Caption := 'LBM SERVIÇOS';
       end;
    4: labEmpresa.Caption := 'MOTICAL';
    5: labEmpresa.Caption := 'CREATOR';
    6: labEmpresa.Caption := 'ANDREA';
    7: labEmpresa.Caption := 'LUCIANO';
    8: labEmpresa.Caption := 'HOPE';
  end;

  edtMaquina.Text           := IntToStr(DM.Usuario1.Maquina);
  edtCodigoCAX.Text         := IntToStr(Entidade.CodigoCAX);
  edtMaxItensNota.Text      := IntToStr(Entidade.MaxItensNota);
  edtMaxLinhasImp.Text      := IntToStr(Entidade.MaxLinhasImp);
  edtImpCheque.Text         := IntToStr(Entidade.ImpCheque);
  edtLeitoraCheque.Text     := IntToStr(Entidade.LeitoraCheque);
  edtOrcamento.Text         := IntToStr(Entidade.Orcamento);
  edtTempoOcioso.Text       := IntToStr(Entidade.TempoOcioso);
  edtCodigoImpFiscal.Text   := IntToStr(Entidade.CodigoImpFiscal);
  edtPastaSistema.Text      := Entidade.PastaSistema;
  edtPastaImagens.Text      := Entidade.PastaImagens;
  edtPastaSons.Text         := Entidade.PastaSons;
  edtCentroDeCusto.Text     := CentroCusto1.RazaoSocial;
  ckbDaruma.Checked         := (Entidade.Daruma = 1);
  ckbItemAutomatico.Checked := (Entidade.ItemAutomatico = 1);
  ckbCaixa.Checked          := Entidade.Caixa;
  ckbMafalda.Checked        := (DM.Usuario1.Mafalda = 1);
  cSegundosInoperante       := (Entidade.TempoOcioso);
  ckbDiretoImpFiscal.Checked:= Entidade.DiretoImpFiscal;
end;

function TfMxDescontos.FinalizaEdicaoMaquina:Boolean;
var
  F: TextFile;
  mensagem,sImpDaruma,sItemAutomatico,sCaixa,sMafalda,sDiretoImpFiscal, sAut, sRelGrafico:string;
begin
  mensagem:='';
  if not VerificaInteiroBranco(edtMaquina.Text) then
    mensagem := mensagem + 'Máquina inválida!'+#13;
  if not VerificaInteiroBranco(edtCodigoCAX.Text) then
    mensagem := mensagem + 'Código de Caixa inválido!'+#13;
  if not VerificaInteiroBranco(edtMaxItensNota.Text) then
    mensagem := mensagem + 'Máximo Itens de Nota inválido!'+#13;
  if not VerificaInteiroBranco(edtMaxLinhasImp.Text) then
    mensagem := mensagem + 'Máximo de Linhas por página na impressora inválido!'+#13;
  if not VerificaInteiroBranco(edtImpCheque.Text) then
    mensagem := mensagem + 'Porta COM da Imp. de Cheques inválida!'+#13;
  if not VerificaInteiroBranco(edtLeitoraCheque.Text) then
    mensagem := mensagem + 'Porta COM da Leitora de Cheques inválida!'+#13;
  if not VerificaInteiroBranco(edtOrcamento.Text) then
    mensagem := mensagem + 'Validade do Orçamento inválida!'+#13;
  if not VerificaInteiroBranco(edtTempoOcioso.Text) then
    mensagem := mensagem + 'Tempo Ocioso inválido!'+#13;
  if not VerificaInteiroBranco(edtCodigoImpFiscal.Text) then
    mensagem := mensagem + 'Código da Impressora Fiscal inválido!'+#13
  else if not StrToInt(edtCodigoImpFiscal.Text) in [0,1] then
    mensagem := mensagem + 'Código da Impressora Fiscal não esperado!'+#13;
  if Trim(edtPastaSistema.Text) = '' then
    mensagem := mensagem + 'Pasta de Sistema inválida!'+#13;
  if Trim(edtPastaImagens.Text) = '' then
    mensagem := mensagem + 'Pasta de Imagens inválida!'+#13;
  if Trim(edtPastaSons.Text) = '' then
    mensagem := mensagem + 'Pasta de Sons inválida!'+#13;
  if Trim(edtPastaPAF.Text) = '' then
    mensagem := mensagem + 'Pasta do PAF inválida!'+#13;
  if mensagem <> '' then
  Begin
    ShowMessage(mensagem);
    Result := False;
    Exit;
  end;

  //Identificar se tem Mini Impressora DARUMA
  if ckbDaruma.Checked then
    sImpDaruma := '1'
  else
    sImpDaruma := '0';

  //Identificar o uso de Leito de Código de Barras
  if ckbItemAutomatico.Checked then
    sItemAutomatico := '1'
  else
    sItemAutomatico := '0';

  //Identificar se é um Caixa
  if ckbCaixa.Checked then
    sCaixa := '1'
  else
    sCaixa := '0';

  //Identificar se é a Loja da Mafalda
  if ckbMafalda.Checked then
    sMafalda := '1'
  else
    sMafalda := '0';

  if ckbDiretoImpFiscal.Checked then
    sDiretoImpFiscal := '1'
  else
    sDiretoImpFiscal := '0';

  if not FileExists(cArquivoConfiguracao) then
  Begin
    AssignFile(F, cArquivoConfiguracao);
    Rewrite(F);
    CloseFile(F);
  end;
  try
    ArqConf := TIniFile.Create(cArquivoConfiguracao);
    Result := True;
    try
      //Configurações de Máquina
      ArqConf.WriteString('MAQUINA', 'CAX_CODIGO', edtCodigoCAX.Text);
      ArqConf.WriteString('MAQUINA', 'Daruma', sImpDaruma);
      ArqConf.WriteString('MAQUINA', 'ImpCheque', edtImpCheque.Text);
      ArqConf.WriteString('MAQUINA', 'LeitoraCheque', edtLeitoraCheque.Text);
      ArqConf.WriteString('MAQUINA', 'Maquina', edtMaquina.Text);
      ArqConf.WriteString('MAQUINA', 'MaxItensNota', edtMaxItensNota.Text);
      ArqConf.WriteString('MAQUINA', 'MaxLinhasImp', edtMaxLinhasImp.Text);
      ArqConf.WriteString('MAQUINA', 'Orcamento', edtOrcamento.Text);
      ArqConf.WriteString('MAQUINA', 'PastaImagens', edtPastaImagens.Text);
      ArqConf.WriteString('MAQUINA', 'PastaSistema', edtPastaSistema.Text);
      ArqConf.WriteString('MAQUINA', 'PastaSons', edtPastaSons.Text);
      ArqConf.WriteString('MAQUINA', 'TempoOcioso', edtTempoOcioso.Text);
      ArqConf.WriteString('MAQUINA', 'CodigoImpFiscal', edtCodigoImpFiscal.Text);
      ArqConf.WriteString('MAQUINA', 'ItemAutomatico', sItemAutomatico);
      ArqConf.WriteString('MAQUINA', 'DiretoImpFiscal', sDiretoImpFiscal);

      ArqConf.WriteString('MAQUINA', 'PastaPAF', edtPastaPAF.Text);

      if ckbCaixa.Visible then
        ArqConf.WriteString('MAQUINA', 'Caixa', sCaixa);
      if ckbMafalda.Visible then
        ArqConf.WriteString('MAQUINA', 'Mafalda', sMafalda);

      //19/05/2012
      if cbxAutomatico.Checked = false then
        sAut := 'N'
      else
        sAut := 'S';

      //23/07/2013
      if cbxRelatorioGrafico.Checked = false then
        sRelGrafico := 'N'
      else
        sRelGrafico := 'S';

      ArqConf.WriteString('MAQUINA', 'Comunicacao', Copy(cbxComunicacao.Text,0,1));
      ArqConf.WriteString('MAQUINA', 'ComAutomatico', sAut);

      ArqConf.WriteString('MAQUINA', 'RelGrafico', sRelGrafico);
    finally
      ArqConf.Free;
    end;
  except
    ShowMessage('Falha ao salvar registros!');
    Result := False;
  end;
end;

procedure TfMxDescontos.SB_LocPastaSistemaClick(Sender: TObject);
begin
  if Trim(edtPastaSistema.Text) <> '' then
    OpenDialog1.InitialDir := Trim(edtPastaSistema.Text)+'\';
  if OpenDialog1.Execute then
    edtPastaSistema.Text := OpenDialog1.FileName;
end;

procedure TfMxDescontos.SB_LocPastaImagensClick(Sender: TObject);
begin
  if Trim(edtPastaImagens.Text) <> '' then
    OpenDialog1.InitialDir := Trim(edtPastaImagens.Text)+'\';
  if OpenDialog1.Execute then
    edtPastaImagens.Text := OpenDialog1.FileName;
end;

procedure TfMxDescontos.SB_LocPastaSonsClick(Sender: TObject);
begin
  if Trim(edtPastaSons.Text) <> '' then
    OpenDialog1.InitialDir := Trim(edtPastaSons.Text)+'\';
  if OpenDialog1.Execute then
    edtPastaSons.Text := OpenDialog1.FileName;
end;

procedure TfMxDescontos.SB_PapelParedeClick(Sender: TObject);
begin
  if (Trim(edtPapelDeParede.Text) = '.') or (Trim(edtPapelDeParede.Text) = '') then
    OpenPictureDialog1.InitialDir := Trim(Entidade.PastaImagens)+'\'
  else
    OpenPictureDialog1.InitialDir := Trim(edtPapelDeParede.Text);
  if OpenPictureDialog1.Execute then
    edtPapelDeParede.Text := OpenPictureDialog1.FileName;
end;

procedure TfMxDescontos.SB_SomAberturaClick(Sender: TObject);
begin
  if (Trim(edtSomAbertura.Text) = '.') or (Trim(edtSomAbertura.Text) = '') then
    OpenDialogSom1.InitialDir := Trim(Entidade.PastaSons)+'\'
  else
    OpenDialogSom1.InitialDir := Trim(edtSomAbertura.Text);
  if OpenDialogSom1.Execute then
    edtSomAbertura.Text := OpenDialogSom1.FileName;
end;

procedure TfMxDescontos.SB_SomSaidaClick(Sender: TObject);
begin
  if (Trim(edtSomSaida.Text) = '.') or (Trim(edtSomSaida.Text) = '') then
    OpenDialogSom1.InitialDir := Trim(Entidade.PastaSons)+'\'
  else
    OpenDialogSom1.InitialDir := Trim(edtSomSaida.Text);
  if OpenDialogSom1.Execute then
    edtSomSaida.Text := OpenDialogSom1.FileName;
end;

procedure TfMxDescontos.SB_SomErroClick(Sender: TObject);
begin
  if (Trim(edtSomErro.Text) = '.') or (Trim(edtSomErro.Text) = '') then
    OpenDialogSom1.InitialDir := Trim(Entidade.PastaSons)+'\'
  else
    OpenDialogSom1.InitialDir := Trim(edtSomErro.Text);
  if OpenDialogSom1.Execute then
    edtSomErro.Text := OpenDialogSom1.FileName;
end;

procedure TfMxDescontos.SB_SomMensagemClick(Sender: TObject);
begin
  if (Trim(edtSomMensagem.Text) = '.') or (Trim(edtSomMensagem.Text) = '') then
    OpenDialogSom1.InitialDir := Trim(Entidade.PastaSons)+'\'
  else
    OpenDialogSom1.InitialDir := Trim(edtSomMensagem.Text);
  if OpenDialogSom1.Execute then
    edtSomMensagem.Text := OpenDialogSom1.FileName;
end;

procedure TfMxDescontos.SB_SomRegistradoraClick(Sender: TObject);
begin
  if (Trim(edtSomRegistradora.Text) = '.') or (Trim(edtSomRegistradora.Text) = '') then
    OpenDialogSom1.InitialDir := Trim(Entidade.PastaSons)+'\'
  else
    OpenDialogSom1.InitialDir := Trim(edtSomRegistradora.Text);
  if OpenDialogSom1.Execute then
    edtSomRegistradora.Text := OpenDialogSom1.FileName;
end;

procedure TfMxDescontos.SB_SomSinosClick(Sender: TObject);
begin
  if (Trim(edtSomSinos.Text) = '.') or (Trim(edtSomSinos.Text) = '') then
    OpenDialogSom1.InitialDir := Trim(Entidade.PastaSons)+'\'
  else
    OpenDialogSom1.InitialDir := Trim(edtSomSinos.Text);
  if OpenDialogSom1.Execute then
    edtSomSinos.Text := OpenDialogSom1.FileName;
end;

procedure TfMxDescontos.SB_RepSomAberturaClick(Sender: TObject);
begin
  try
    if Trim(edtSomAbertura.Text) = '.' then
      sndPlaySound(Pchar(Entidade.PastaSons+'\Abertura.wav'),SND_SYNC)
    else
      sndPlaySound(Pchar(edtSomAbertura.Text),SND_SYNC);
  except
  end;
end;

procedure TfMxDescontos.SB_RepSomSaidaClick(Sender: TObject);
begin
  try
    if Trim(edtSomSaida.Text) = '.' then
      sndPlaySound(Pchar(Entidade.PastaSons+'\Sair.wav'),SND_SYNC)
    else
      sndPlaySound(Pchar(edtSomSaida.Text),SND_SYNC);
  except
  end;
end;

procedure TfMxDescontos.SB_RepSomErroClick(Sender: TObject);
begin
  try
    if Trim(edtSomErro.Text) = '.' then
      sndPlaySound(Pchar(Entidade.PastaSons+'\Erro.wav'),SND_SYNC)
    else
      sndPlaySound(Pchar(edtSomErro.Text),SND_SYNC);
  except
  end;
end;

procedure TfMxDescontos.SB_RepSomMensagemClick(Sender: TObject);
begin
  try
    if Trim(edtSomMensagem.Text) = '.' then
      sndPlaySound(Pchar(Entidade.PastaSons+'\Mensagem.wav'),SND_SYNC)
    else
      sndPlaySound(Pchar(edtSomMensagem.Text),SND_SYNC);
  except
  end;
end;

procedure TfMxDescontos.SB_RepSomRegistradoraClick(Sender: TObject);
begin
  try
    if Trim(edtSomRegistradora.Text) = '.' then
      sndPlaySound(Pchar(Entidade.PastaSons+'\Registradora.wav'),SND_SYNC)
    else
      sndPlaySound(Pchar(edtSomRegistradora.Text),SND_SYNC);
  except
  end;
end;

procedure TfMxDescontos.SB_RepSomSinosClick(Sender: TObject);
begin
  try
    if Trim(edtSomSinos.Text) = '.' then
      sndPlaySound(Pchar(Entidade.PastaSons+'\Sinos.wav'),SND_SYNC)
    else
      sndPlaySound(Pchar(edtSomSinos.Text),SND_SYNC);
  except
  end;
end;

procedure TfMxDescontos.bitPadraoClick(Sender: TObject);
begin
  edtPapelDeParede.Text   := '.';
  edtSomAbertura.Text     := '.';
  edtSomSaida.Text        := '.';
  edtSomErro.Text         := '.';
  edtSomMensagem.Text     := '.';
  edtSomRegistradora.Text := '.';
  edtSomSinos.Text        := '.';
end;

function TfMxDescontos.FinalizaEdicaoGeral:Boolean;
var
  F: TextFile;
  sServidor: string;
begin
  Result := True;
  sServidor := '';
  try
    if not FileExists(cArquivoConfiguracao) then
    Begin
      AssignFile(F, cArquivoConfiguracao);
      Rewrite(F);
      CloseFile(F);
    end;
    ArqConf := TIniFile.Create(cArquivoConfiguracao);
    try
      ArqConf.WriteString('IMAGEM', 'PapelDeParede', Trim(edtPapelDeParede.Text));
      ArqConf.WriteString('SOM', 'Abertura', Trim(edtSomAbertura.Text));
      ArqConf.WriteString('SOM', 'Saida', Trim(edtSomSaida.Text));
      ArqConf.WriteString('SOM', 'Erro', Trim(edtSomErro.Text));
      ArqConf.WriteString('SOM', 'Mensagem', Trim(edtSomMensagem.Text));
      ArqConf.WriteString('SOM', 'Registradora', Trim(edtSomRegistradora.Text));
      ArqConf.WriteString('SOM', 'Sinos', Trim(edtSomSinos.Text));
    finally
      ArqConf.Free;
    end;
    CarregaSACIConf(Entidade.PastaImagens, Entidade.PastaSons, sServidor);
    try
      if (cPapelDeParede = '.') then
        if FileExists(Entidade.PastaImagens+'\Fundo.JPG') then
          SIAC.Image1.Picture.LoadFromFile(Entidade.PastaImagens+'\Fundo.JPG')
        else
          SIAC.Image1.Picture.LoadFromFile(Entidade.PastaImagens+'\Fundo.BMP')
      else if (cPapelDeParede <> '') then
        SIAC.Image1.Picture.LoadFromFile(cPapelDeParede);
    except
    end;
  except
    Result := False;
  end;
end;

procedure TfMxDescontos.SB_RepPapelParedeClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  try
    if Trim(edtPapelDeParede.Text) = '.' then
    Begin
      fMxFotoAmpliada.memRodapeFoto.Lines.Add('Papel de Parede Padrão.');
      if FileExists(Entidade.PastaImagens+'\Fundo.JPG') then
        fMxFotoAmpliada.imgFotoAmpliada.Picture.LoadFromFile(Entidade.PastaImagens+'\Fundo.JPG')
      else
        fMxFotoAmpliada.imgFotoAmpliada.Picture.LoadFromFile(Entidade.PastaImagens+'\Fundo.BMP');
    end
    else if Trim(edtPapelDeParede.Text) = '' then
      fMxFotoAmpliada.memRodapeFoto.Lines.Add('LogoMarca da EmpresaDesenvolvedora')
    else
    Begin
      fMxFotoAmpliada.imgFotoAmpliada.Picture.LoadFromFile(edtPapelDeParede.Text);
      fMxFotoAmpliada.memRodapeFoto.Lines.Add('Papel de Parede');
    end;
  except
    fMxFotoAmpliada.memRodapeFoto.Lines.Add('Falha ao Abrir o Arquivo');
  end;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add(edtPapelDeParede.Text);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxDescontos.Configuracao1BeforeOpen(DataSet: TDataSet);
begin
  if (not (Entidade.Empresa IN TEmpresasConfiguracaoUnica)) then
    Entidade.SQL.Text := 'SELECT * FROM CONFIGURACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue);
end;

procedure TfMxDescontos.edtContaFactoringChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtContaFactoring.Text);
      Open;
      labCCXFactoring.Caption := Descricao;
    end;
  except
    labCCXFactoring.Caption := '';
  end;
end;

procedure TfMxDescontos.edtCodigoImpFiscalChange(Sender: TObject);
begin
  try
    case StrToInt(edtCodigoImpFiscal.Text) of
      0: labImpressoraFiscal.Caption := 'BEMATECH';
      1: labImpressoraFiscal.Caption := 'DARUMA';
      else
        labImpressoraFiscal.Caption := '.';
    end;
  except
    labImpressoraFiscal.Caption := '.';
  end;
end;

procedure TfMxDescontos.CarregaDados;
var
  vDescontoSimples,vDescontoEspecial,vDescontoSimplesPag,vDescontoEspecialPag,vLBMDesc60, vLBMJuros60:Double;
  iPrazoDevolucao,iMelhorData,iEnviarSPC:Integer;
begin
  vDescontoSimples     := 0;
  vDescontoEspecial    := 0;
  vDescontoSimplesPag  := 0;
  vDescontoEspecialPag := 0;
  iPrazoDevolucao      := 0;
  iMelhorData          := 0;
  iEnviarSPC           := 0;
  vLBMDesc60           := 0;
  vLBMJuros60          := 0;

  try
    if Entidade.FieldByName('CNF_JUR_NORM').asFloat <> null then
      vDescontoSimples := Entidade.FieldByName('CNF_JUR_NORM').asFloat;
  except
    ShowMessage('Erro em Juros de Venda Normal!');
  end;
  try
    if Entidade.FieldByName('CNF_JUR_ESP').asFloat <> null then
      vDescontoEspecial := Entidade.FieldByName('CNF_JUR_ESP').asFloat;
  except
    ShowMessage('Erro em Juros de Venda Especial!');
  end;
  //LBM
  try
    if Entidade.FieldByName('CNF_LBM_DESC_60').asFloat <> null then
      vLBMDesc60 := Entidade.FieldByName('CNF_LBM_DESC_60').asFloat;
  except
    ShowMessage('Erro em LBMDesconto60!');
  end;
  //LBM
  try
    if Entidade.FieldByName('CNF_LBM_JUROS_60').asFloat <> null then
      vLBMJuros60 := Entidade.FieldByName('CNF_LBM_JUROS_60').asFloat;
  except
    ShowMessage('Erro em LBMJuros60!');
  end;
  try
    if Entidade.FieldByName('CNF_JUR_NORM_PAG').asString <> null then
      if VerificaFloat(Entidade.FieldByName('CNF_JUR_NORM_PAG').asString) then
        vDescontoSimplesPag := Entidade.FieldByName('CNF_JUR_NORM_PAG').asFloat;
  except
    ShowMessage('Erro em Juros de Pagamento Normal!');
  end;
  try
    if Entidade.FieldByName('CNF_JUR_ESP_PAG').asString <> null then
      if VerificaFloat(Entidade.FieldByName('CNF_JUR_ESP_PAG').asString) then
        vDescontoEspecialPag := Entidade.FieldByName('CNF_JUR_ESP_PAG').asFloat;
  except
    ShowMessage('Erro em Juros de Pagamento Especial!');
  end;
  try
    if Entidade.FieldByName('CNF_QNT_DIAS_DEV').asInteger <> null then
      iPrazoDevolucao := Entidade.FieldByName('CNF_QNT_DIAS_DEV').asInteger;
  except
    ShowMessage('Erro em Quantidade de dias para devolução!');
  end;
  try
    if Entidade.FieldByName('CNF_MELHORDATA').asInteger <> null then
      iMelhorData := Entidade.FieldByName('CNF_MELHORDATA').asInteger;
  except
    ShowMessage('Erro em Melhor data!');
  end;
  try
    if Entidade.FieldByName('CNF_ENVIAR_SPC').asInteger <> null then
      iEnviarSPC := Entidade.FieldByName('CNF_ENVIAR_SPC').asInteger;
  except
    ShowMessage('Erro em Enviar SPC!');
  end;
  edtDescontoSimples.Text          := format('%.2f',[vDescontoSimples]);
  edtDescontoEspecial.Text         := format('%.2f',[vDescontoEspecial]);
  edtLBMDesconto60.Text            := format('%.2f',[vLBMDesc60]);
  edtLBMJuros60.Text               := format('%.2f',[vLBMJuros60]);
  edtDescontoSimpresPag.Text       := format('%.2f',[vDescontoSimplesPag]);
  edtDescontoEspecialPag.Text      := format('%.2f',[vDescontoEspecialPag]);
  edtPrazoDevolucao.Text           := IntToStr(iPrazoDevolucao);
  edtLimiteMelhorData.Text         := IntToStr(iMelhorData);
  edtEnviarSPC.Text                := IntToStr(iEnviarSPC);
  edtClienteBalcao.Text            := IntToStr(Entidade.CodigoCliAVista);
  edtDiasLibVendaInadiplencia.Text := IntToStr(Entidade.DiasLibVendaInadiplente);
  edtLimiteCreditoBasico.Text      := format('%.2f',[Entidade.LimiteCreditoBasico]);
  edtLimiteMediaVenda.Text         := IntToStr(Entidade.LimiteMediaVenda);
  edtCCXAberturaCaixa.Text         := IntToStr(Entidade.ContaAbreCaixa);
  edtCCXFechamentoCaixa.Text       := IntToStr(Entidade.ContaFechaCaixa);
  edtCCXPagFOR.Text                := IntToStr(Entidade.ContPagFor);
  edtCCXPagTRN.Text                := IntToStr(Entidade.ContPagTrn);
  edtContaRecCli.Text              := IntToStr(Entidade.ContRecCli);
  edtContaRecServico.Text          := IntToStr(Entidade.ContRecServico);
  edtContaRecCliAnt.Text           := IntToStr(Entidade.ContRecCliAnt);
  edtContaFactoring.Text           := IntToStr(Entidade.ContFactoring);
  edtContaTransfere.Text           := IntToStr(Entidade.ContTransfere);
  edtContaVerificaCaixa.Text       := IntToStr(Entidade.ContaVerificaCaixa);  
  edtGrupoRepasse.Text             := IntToStr(Entidade.GrupoRepasse);
  edtLaboratorio.Text              := IntToStr(Entidade.Laboratorio);
  edtMontagem.Text                 := IntToStr(Entidade.Montagem);
  edtMeta1.Text                     := Format('%.2f',[Entidade.LaboratorioMeta]);
  edtMeta2.Text                     := Format('%.2f',[Entidade.MontagemMeta]);
  edtCota1.Text                    := Format('%.2f',[Entidade.LaboratorioCota1]);
  edtCota2.Text                    := Format('%.2f',[Entidade.LaboratorioCota2]);
  edtCota3.Text                    := Format('%.2f',[Entidade.MontagemCota1]);
  edtCota4.Text                    := Format('%.2f',[Entidade.MontagemCota2]);
  edtPARTipoDocumento.Text         := IntToStr(Entidade.TipoDocumento);
  try
    memMensagemPromocional.Lines.Text := Entidade.FieldByName('CNF_MENSAGEMCUPOM').asString;
  except
    ShowMessage('Erro em Mensagem Promocional do Cupom!');
  end;
  edtTaxaJuros.Text               := Format('%.2f',[Entidade.TaxaJuros]);
  edtPercentualCusto.Text         := Format('%.2f',[Entidade.PercentualCusto]);
  edtPercentualLucro.Text         := Format('%.2f',[Entidade.PercentualLucro]);
  edtCustoOperacional.Text        := Format('%.2f',[Entidade.CustoOperacional]);
  edtCustoOperacionalLJ3.Text     := Format('%.2f',[Entidade.CustoOperacionalLJ3]);
  edtAliquotaISS.Text             := Format('%.2f',[Entidade.AliquotaISS]);
  edtAliquotaPIS.Text             := Format('%.2f',[Entidade.AliquotaPIS]);
  edtAliquotaCOFINS.Text          := Format('%.2f',[Entidade.AliquotaCOFINS]);
  edtAliquotaCPMF.Text            := Format('%.2f',[Entidade.AliquotaCPMF]);
  edtNFerramenta.Text             := Format('%.3f',[Entidade.NFerramenta]);

  edtNomeLoja.Text                := Entidade.LojaNome;
  edtNomeLoja.Enabled             := Entidade.CodigoCNC = 1;

  edtDiasSemJuros.Text            := IntToStr(Entidade.QuantDiasSemJuros);
  edtDiasSemCobranca.Text         := IntToStr(Entidade.QuantDiasSemCobran);
  ckbIgnorarCheques.Checked       := Entidade.IgnorarCheques;
  cbxTipoCobranca.ItemIndex       := Entidade.TipoCobranca;
  ckbIgnorarDepositos.Checked     := Entidade.IgnorarDepositos;
  ckbPrdRefUnica.Checked          := Entidade.PrdReferenciaUnica;
  ckbEstoqueDetalhado.Checked     := Entidade.EstoqueDetalhado;
  ckbEstoqueIdeal.Checked         := Entidade.EstoqueIdeal;
  ckbNotaFiscalEletronica.Checked := Entidade.NFE;
  ckbCPD.Checked                  := Entidade.CPD;
  if (Entidade.Empresa = empLBM) and
     (Entidade.CodigoCNC <> 3) then
  Begin
    edtDescontoSimples.Enabled  := False;
    edtDescontoEspecial.Enabled := False;
  end;

  with CentroCusto1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Usuario1.CentroDeCusto);
    Open;
    CarregaDados;
  end;
  CarregaDadosMaquina;
end;

procedure TfMxDescontos.dblCodigoCNCClick(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  CarregaDados;
end;

procedure TfMxDescontos.edtContaTransfereChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtContaTransfere.Text);
      Open;
      labCCXTransfere.Caption := Descricao;
    end;
  except
    labCCXTransfere.Caption := '';
  end;
end;

procedure TfMxDescontos.edtCCXAberturaCaixaChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtCCXAberturaCaixa.Text);
      Open;
      labCCXAberturaCaixa.Caption := Descricao;
    end;
  except
    labCCXAberturaCaixa.Caption := '';
  end;
end;

procedure TfMxDescontos.edtCCXFechamentoCaixaChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtCCXFechamentoCaixa.Text);
      Open;
      labCCXFechamentoCaixa.Caption := Descricao;
    end;
  except
    labCCXFechamentoCaixa.Caption := '';
  end;
end;

procedure TfMxDescontos.edtGrupoRepasseChange(Sender: TObject);
begin
  try
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM PARAMETRO '+
        ' WHERE PAR_CODIGO='+edtGrupoRepasse.Text;
      Open;
      labGrupoRepasse.Caption := FieldByName('PAR_DESCRICAO').asString;
    end;
  except
    labGrupoRepasse.Caption := '';
  end;
end;

procedure TfMxDescontos.FormCreate(Sender: TObject);
begin
  Entidade := Configuracao1;
  //Para as outras empresas essa configuração é no Cadastro de Usuário
end;

procedure TfMxDescontos.edtContaVerificaCaixaChange(Sender: TObject);
begin
  try
    with DM.Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO=:CCX_CODIGO';
      ParamByName('CCX_CODIGO').asInteger := StrToInt(edtContaVerificaCaixa.Text);
      Open;
      labCCXVerificaCaixa.Caption := Descricao;
    end;
  except
    labCCXVerificaCaixa.Caption := '';
  end;
end;

procedure TfMxDescontos.edtLaboratorioChange(Sender: TObject);
begin
  try
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT SGP_DESCRICAO '+
        ' FROM SUBGRUPO '+
        ' WHERE SGP_CODIGO='+IntToStr(StrToInt(edtLaboratorio.Text));
      Open;
      labLaboratorio.Caption := FieldByName('SGP_DESCRICAO').asString;
    end;
  except
    labMontagem.Caption := '';
  end;
end;

procedure TfMxDescontos.edtMontagemChange(Sender: TObject);
begin
  try
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT SGP_DESCRICAO '+
        ' FROM SUBGRUPO '+
        ' WHERE SGP_CODIGO='+IntToStr(StrToInt(edtMontagem.Text));
      Open;
      labMontagem.Caption := FieldByName('SGP_DESCRICAO').asString;
    end;
  except
    labMontagem.Caption := '';
  end;
end;

procedure TfMxDescontos.BitBtn1Click(Sender: TObject);
var
  Trans:Boolean;
  iPrazo: integer;
begin
  Trans:=False;
  if MessageDlg('Atenção!!!'+#13+'Só realize essa operação tendo somente 1 micro no sistema(esse).'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if MessageDlg('Deseja atualizar tabelas CONF?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE CLIENTE_CONF SET '+
        ' CLI_CODIGO=(SELECT MAX(CLI_CODIGO) FROM CLIENTE)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE CLIENTE_CONF SET '+
        ' CLI_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA_CONF SET '+
        ' PDV_CODIGO=(SELECT MAX(PDV_CODIGO) FROM PEDIDO_DE_VENDA)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA_CONF SET '+
        ' PDV_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA_CONF SET '+
        ' IPV_CODIGO=(SELECT MAX(IPV_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA_CONF SET '+
        ' IPV_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_COMPRA_CONF SET '+
        ' PCP_CODIGO=(SELECT MAX(PCP_CODIGO) FROM PEDIDO_DE_COMPRA)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_COMPRA_CONF SET '+
        ' PCP_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_COMPRA_CONF SET '+
        ' IPC_CODIGO=(SELECT MAX(IPC_CODIGO) FROM ITEM_DE_PEDIDO_DE_COMPRA)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_COMPRA_CONF SET '+
        ' IPC_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE CUSTO_CONF SET '+
        ' CUS_CODIGO=(SELECT MAX(CUS_CODIGO) FROM CUSTO)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE CUSTO_CONF SET '+
        ' CUS_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE NOTA_FISCAL_CONF SET '+
        ' NTF_CODIGO=(SELECT MAX(NTF_CODIGO) FROM NOTA_FISCAL)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE NOTA_FISCAL_CONF SET '+
        ' NTF_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_NOTA_FISCAL_CONF SET '+
        ' INF_CODIGO=(SELECT MAX(INF_CODIGO) FROM ITEM_DE_NOTA_FISCAL)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_NOTA_FISCAL_CONF SET '+
        ' INF_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MOVIMENTO_DE_CAIXA_CONF SET '+
        ' MVC_CODIGO=(SELECT MAX(MVC_CODIGO) FROM MOVIMENTO_DE_CAIXA)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MOVIMENTO_DE_CAIXA_CONF SET '+
        ' MVC_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_RECEBER_CONF SET '+
        ' TRC_CODIGO=(SELECT MAX(TRC_CODIGO) FROM TITULO_A_RECEBER) ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_RECEBER_CONF SET '+
        ' TRC_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_PAGAR_CONF SET '+
        ' TPG_CODIGO=(SELECT MAX(TPG_CODIGO) FROM TITULO_A_PAGAR)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_PAGAR_CONF SET '+
        ' TPG_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MOVIMENTO_DE_ESTOQUE_COM_CONF SET '+
        ' MEC_CODIGO=(SELECT MAX(MEC_CODIGO) FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MOVIMENTO_DE_ESTOQUE_COM_CONF SET '+
        ' MEC_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISC_CONF SET '+
        ' MES_CODIGO=(SELECT MAX(MES_CODIGO) FROM MOVIMENTO_DE_ESTOQUE_FISCAL)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISC_CONF SET '+
        ' MES_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MOVIMENTO_DE_ESTOQUE_FIS_CONF SET '+
        ' MEF_CODIGO=(SELECT MAX(MEF_CODIGO) FROM MOVIMENTO_DE_ESTOQUE_FISICO)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MOVIMENTO_DE_ESTOQUE_FIS_CONF SET '+
        ' MEF_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MENSAGEM_CONF SET '+
        ' MSG_CODIGO=(SELECT MAX(MSG_CODIGO) FROM MENSAGEM)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE MENSAGEM_CONF SET '+
        ' MSG_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE LOG_CONF SET '+
        ' LOG_CODIGO=(SELECT MAX(LOG_CODIGO) FROM LOG)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE LOG_CONF SET '+
        ' LOG_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE RECEBIMENTO_CONF SET '+
        ' REC_CODIGO=(SELECT MAX(REC_CODIGO) FROM RECEBIMENTO)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE RECEBIMENTO_CONF SET '+
        ' REC_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_RECEBIMENTO_CONF SET '+
        ' IRC_CODIGO=(SELECT MAX(IRC_CODIGO) FROM ITEM_DE_RECEBIMENTO)+1000 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_RECEBIMENTO_CONF SET '+
        ' IRC_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE PRODUTO_CONF SET '+
        ' PRD_CODIGO=(SELECT MAX(PRD_CODIGO) FROM PRODUTO)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE PRODUTO_CONF SET '+
        ' PRD_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE GRUPO_CONF SET '+
        ' GRP_CODIGO=(SELECT MAX(GRP_CODIGO) FROM GRUPO)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE GRUPO_CONF SET '+
        ' GRP_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE SUBGRUPO_CONF SET '+
        ' SGP_CODIGO=(SELECT MAX(SGP_CODIGO) FROM SUBGRUPO)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE SUBGRUPO_CONF SET '+
        ' SGP_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE CONTA_DE_CAIXA_CONF SET '+
        ' CCX_CODIGO=(SELECT MAX(CCX_CODIGO) FROM CONTA_DE_CAIXA)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE CONTA_DE_CAIXA_CONF SET '+
        ' CCX_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE PARAMETRO_CONF SET '+
        ' PAR_CODIGO=(SELECT MAX(PAR_CODIGO) FROM PARAMETRO)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE PARAMETRO_CONF SET '+
        ' PAR_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE FORMA_DE_PAGAMENTO_CONF SET '+
        ' FPG_CODIGO=(SELECT MAX(FPG_CODIGO) FROM FORMA_DE_PAGAMENTO)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE FORMA_DE_PAGAMENTO_CONF SET '+
        ' FPG_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE AGENTE_FINANCEIRO_CONF SET '+
        ' AGF_CODIGO=(SELECT MAX(AGF_CODIGO) FROM AGENTE_FINANCEIRO)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE AGENTE_FINANCEIRO_CONF SET '+
        ' AGF_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE REGISTRO_DELETADO_CONF SET '+
        ' RDL_CODIGO=(SELECT MAX(RDL_CODIGO) FROM REGISTRO_DELETADO)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE REGISTRO_DELETADO_CONF SET '+
        ' RDL_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE INVENTARIO_CONF SET '+
        ' INV_CODIGO=(SELECT MAX(INV_CODIGO) FROM INVENTARIO)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE INVENTARIO_CONF SET '+
        ' INV_CODIGO=1000 ');
    end;

    try
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_INVENTARIO_CONF SET '+
        ' IIV_CODIGO=(SELECT MAX(IIV_CODIGO) FROM ITEM_DE_INVENTARIO)+10 ');
    except
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_INVENTARIO_CONF SET '+
        ' IIV_CODIGO=1000 ');
    end;
  end;




  //Excluir Orçamentos Vencidos!!!!
  if MessageDlg('Deseja excluir os Orçamentos vencidos?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    try
      iPrazo := StrToInt(InputBox('Orçamento vencidos', 'Dias de Vencido:', '30'));
    except
      ShowMessage('Prazo inválido!');
      Exit;
    end;

    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT IPV_CODIGO,PDV_CODIGO,PRD_CODIGO '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_CODIGO IN '+
            ' (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_DIAS_RESERV>0 AND PDV_SITUACAO IN (0,3) '+
            ' AND PDV_DATA_HORA+PDV_DIAS_RESERV<"'+MesDia(DM.Configuracao1.Data-iPrazo)+'")';
          Open;
          while not Eof do
          Begin
            DM.Usuario1.RegistrarDel(DM.Configuracao1.CodigoCNC,1640(*ItemDePedidoDeVenda*),
              FieldByName('IPV_CODIGO').asInteger,'PDV:'+FieldByName('PDV_CODIGO').asString+
              ' PRD:'+FieldByName('PRD_CODIGO').asString);
            Next;
          end;
          Close;
        end;

        ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND PDV_CODIGO IN '+
          ' (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND PDV_DIAS_RESERV>0 AND PDV_SITUACAO IN (0,3) '+
          ' AND PDV_DATA_HORA+PDV_DIAS_RESERV<"'+MesDia(DM.Configuracao1.Data-iPrazo)+'")');

        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT PDV_CODIGO,CLI_CODIGO '+
            ' FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_DIAS_RESERV>0 '+
            ' AND PDV_SITUACAO IN (0,3) '+
            ' AND PDV_DATA_HORA+PDV_DIAS_RESERV<"'+MesDia(DM.Configuracao1.Data-iPrazo)+'"';
          Open;
          while not Eof do
          Begin
            DM.Usuario1.RegistrarDel(DM.Configuracao1.CodigoCNC,1860(*PedidoDeVenda*),
              FieldByName('PDV_CODIGO').asInteger,'CLI:'+FieldByName('CLI_CODIGO').asString);
            Next;
          end;
          Close;
        end;

        ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND PDV_DIAS_RESERV>0 '+
          ' AND PDV_SITUACAO IN (0,3) '+
          ' AND PDV_DATA_HORA+PDV_DIAS_RESERV<"'+MesDia(DM.Configuracao1.Data-iPrazo)+'"');

        DM.Usuario1.GeraLog(6550,0,0,'Excluir Orcamentos Vencidos');

        If DM.Configuracao1.ControleTransacao then
          Commit;
      except
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Erro no processo! Ligue para o suporte');
          end;
      end;
    end;
  end;

  //Reabrir Títulos renegociados não pagos
  if MessageDlg('Deseja reabrir Títulos Renegociados não pagos?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text:='SELECT * FROM TITULO_A_RECEBER T '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND TRC_SITUACAO=4 '+
        ' AND TRC_CODIGO IN '+
        ' (SELECT TRC_TRCORIGINAL FROM TITULO_A_RECEBER '+
        ' WHERE TRC_SITUACAO = 8 '+
        ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") '+
        ' AND NOT EXISTS (SELECT TRC_CODIGO FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND TRC_SITUACAO <> 8 '+
        ' AND TRC_CODIGO<>T.TRC_CODIGO'+
        ' AND TRC_TRCORIGINAL=T.TRC_CODIGO)';
      Open;
    end;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        if not DM.QR_Consultas.IsEmpty then
        Begin
          while not EOF do
          Begin
            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_SITUACAO=5 '+
              ',TRC_OBSERVACAO="Exc.P/'+DM.Usuario1.NomeUSU+' Canc.Reneg." '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE TRC_TRCORIGINAL='+DM.QR_Consultas.FieldByname('TRC_CODIGO').asString+
              ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));
            (* Estava dando erro
            Entidade.GeraLog(4520,0,0,'CANCELAR RENEGOCIACAO - ORIGEM:'+DM.QR_Consultas.FieldByname('TRC_CODIGO').asString);
            *)

            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_SITUACAO=0 '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE TRC_CODIGO='+DM.QR_Consultas.FieldByname('TRC_CODIGO').asString+
              ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));
            Next;
          end;
          DM.Usuario1.GeraLog(6550,0,0,'Cancelar Renegociacoes');
        end
        else
          DM.Usuario1.GeraLog(6550,0,0,'Tentativa de Cancelar Renegociações');

        If DM.Configuracao1.ControleTransacao then
          Commit;
      except
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Erro no processo! Ligue para o suporte');
          end;
      end;
    end;
  end;
end;

procedure TfMxDescontos.BitBtn2Click(Sender: TObject);
var
  arquivo: string;
begin
  arquivo := ExtractFilePath(ParamStr(0)) + 'PAtualizaSACI.exe';

  winExec(PChar(arquivo),SW_NORMAL);
end;

procedure TfMxDescontos.BitBtn3Click(Sender: TObject);
var
  arquivo: string;
begin
  arquivo := ExtractFilePath(ParamStr(0)) + 'PIncluirOper.exe'; 

  winExec(PChar(arquivo),SW_NORMAL);
end;

procedure TfMxDescontos.btnComunicacaoClick(Sender: TObject);
var
  sPrefixo: string;
begin
  if cbxEmpresa.ItemIndex = 0 then
    sPrefixo := 'LO'                    //Luciano Ótica
  else if cbxEmpresa.ItemIndex = 1 then
    sPrefixo := 'AC'                    //Água de Cheiro
  else if cbxEmpresa.ItemIndex = 2 then
    sPrefixo := '01'                    //Água de Cheiro - Quixeramobim
  else if cbxEmpresa.ItemIndex = 3 then
    sPrefixo := 'AA'                    //TESTE
  else
    sPrefixo := '';

  if qComunicacoes.IsEmpty then
    ExecutaSQL(DM.QR_Comandos, 'INSERT INTO COMUNICACOES (COM_PREFIXO) VALUES ("'+sPrefixo+'")')
  else
    ExecutaSQL(DM.QR_Comandos, 'UPDATE COMUNICACOES SET COM_PREFIXO = "'+sPrefixo+'" ');
end;

procedure TfMxDescontos.SB_LocPastaPAFClick(Sender: TObject);
begin
  if Trim(edtPastaPAF.Text) <> '' then
    OpenDialog1.InitialDir := Trim(edtPastaPAF.Text)+'\';
  if OpenDialog1.Execute then
    edtPastaPAF.Text := OpenDialog1.FileName;
end;

procedure TfMxDescontos.btnAjustarEstoqueClick(Sender: TObject);
var
  iEstoque, iEstoque2: integer;
begin
  qProduto.Close;
  qProduto.SQL.Clear;
  qProduto.SQL.Add('SELECT * FROM PRODUTO');
  if edtProduto.Text <> '' then
    qProduto.SQL.Add('WHERE PRD_CODIGO = ''' + edtProduto.Text + '''');
  qProduto.SQL.Add('ORDER BY PRD_CODIGO');
  qProduto.Open;
  qProduto.First;
  while not qProduto.Eof do
  begin
    //FISICO
    qEstoque.Close;
    qEstoque.SQL.Clear;
    qEstoque.SQL.Add('SELECT TOP 1 * FROM MOVIMENTO_DE_ESTOQUE_FISICO');
    qEstoque.SQL.Add('WHERE CNC_CODIGO = ''' + edtCodigoCNC.Text + ''' AND');
    qEstoque.SQL.Add('PRD_CODIGO = ''' + qProduto.FieldByName('PRD_CODIGO').AsString + '''');
    qEstoque.SQL.Add('ORDER BY MEF_DATA DESC');
    qEstoque.Open;

    if qEstoque.FieldByName('MEF_ES').AsString = 'S' then
      iEstoque := qEstoque.FieldByName('MEF_SALDO_ANT').AsInteger - qEstoque.FieldByName('MEF_QUANTIDADE').AsInteger
    else
      iEstoque := qEstoque.FieldByName('MEF_SALDO_ANT').AsInteger + qEstoque.FieldByName('MEF_QUANTIDADE').AsInteger;

    //COMERCIAL
    qEstoque.Close;
    qEstoque.SQL.Clear;
    qEstoque.SQL.Add('SELECT TOP 1 * FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL');
    qEstoque.SQL.Add('WHERE CNC_CODIGO = ''' + edtCodigoCNC.Text + ''' AND');
    qEstoque.SQL.Add('PRD_CODIGO = ''' + qProduto.FieldByName('PRD_CODIGO').AsString + '''');
    qEstoque.SQL.Add('ORDER BY MEC_DATA_HORA DESC');
    qEstoque.Open;

    if qEstoque.FieldByName('MEC_ES').AsString = 'S' then
      iEstoque2 := qEstoque.FieldByName('MEC_SALDO_ANT').AsInteger - qEstoque.FieldByName('MEC_QUANTIDADE').AsInteger
    else
      iEstoque2 := qEstoque.FieldByName('MEC_SALDO_ANT').AsInteger + qEstoque.FieldByName('MEC_QUANTIDADE').AsInteger;



    qEstoqueExec.Close;
    qEstoqueExec.SQL.Clear;
    qEstoqueExec.SQL.Add('UPDATE ITEM_DE_ESTOQUE SET IES_SFISICO = ''' + IntToStr(iEstoque) + ''',');
    qEstoqueExec.SQL.Add('IES_SCOMERCIAL = ''' + IntToStr(iEstoque2) + '''');
    qEstoqueExec.SQL.Add('WHERE CNC_CODIGO = ''' + edtCodigoCNC.Text + ''' AND');
    qEstoqueExec.SQL.Add('PRD_CODIGO = ''' + qProduto.FieldByName('PRD_CODIGO').AsString + '''');
    qEstoqueExec.ExecSQL;

    qProduto.Next;
  end;

  showmessage('Fim do processo!');
end;

procedure TfMxDescontos.btnServicoClick(Sender: TObject);
begin
  Application.CreateForm(TfCadServico, fCadServico);
  with fCadServico do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

end.
