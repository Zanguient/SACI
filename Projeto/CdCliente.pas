unit CdCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Parametro, Menus, CentroCusto, Titulo_receber,
  NotaFiscal, Pedido_de_Venda, Funcionario, Usuario, Contato, ToolWin,
  ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadCli = class(Tform)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    mskDataCadastro: TMaskEdit;
    mskDataNascimento: TMaskEdit;
    ckbPessoaFisica: TCheckBox;
    Label1: TLabel;
    edtCliente: TEdit;
    edtCodigoCLI: TEdit;
    edtNomeFantasia: TEdit;
    mskCPF_CNPJ: TMaskEdit;
    edtRG_CGF: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mskCEP: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    mskFone: TMaskEdit;
    Label15: TLabel;
    cmbUF: TComboBox;
    memObservacao: TMemo;
    edtBairro: TEdit;
    Label16: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    labDesNascimento: TLabel;
    cmbSituacao: TComboBox;
    DS_cliente1: TDataSource;
    dblLogradouro: TDBLookupComboBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    Cliente1: TCliente;
    CentroCusto2: TCentroCusto;
    DSCentroCusto: TDataSource;
    dblCentroDeCusto: TDBLookupComboBox;
    SB_LocCab: TSpeedButton;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    edtPaiContato1: TEdit;
    edtMaeContato2: TEdit;
    edtConjuge: TEdit;
    Label17: TLabel;
    Pai: TLabel;
    Label21: TLabel;
    lblDescConjuge: TLabel;
    SB_Credito: TSpeedButton;
    SB_Afim: TSpeedButton;
    Label24: TLabel;
    Bevel1: TBevel;
    imgFotoCliente: TImage;
    Label25: TLabel;
    mskFax: TMaskEdit;
    Label14: TLabel;
    mskCelular: TMaskEdit;
    Label26: TLabel;
    mskDataAlterado: TMaskEdit;             
    Label27: TLabel;
    edtSite: TEdit;
    labDescSite: TLabel;
    edtEMail: TEdit;
    labDesEMail: TLabel;
    Cliente1CLI_CODIGO: TIntegerField;
    Cliente1CNC_CODIGO: TIntegerField;
    Cliente1CLI_PESSOA_FISICA: TSmallintField;
    Cliente1CLI_DT_CADASTRO: TDateTimeField;
    Cliente1CLI_DATA_NASC: TDateTimeField;
    Cliente1CLI_RZ_SOCIAL: TStringField;
    Cliente1CLI_NOME_FAN: TStringField;
    Cliente1CLI_CGC_CPF: TStringField;
    Cliente1CLI_CGF_RG: TStringField;
    Cliente1CLI_LOGRADOURO: TIntegerField;
    Cliente1CLI_ENDERECO: TStringField;
    Cliente1CLI_BAIRRO: TStringField;
    Cliente1CLI_CIDADE: TStringField;
    Cliente1CLI_UF: TStringField;
    Cliente1CLI_CEP: TStringField;
    Cliente1CLI_FONE: TStringField;
    Cliente1CLI_SITUACAO: TIntegerField;
    Cliente1CLI_CREDITO: TFloatField;
    Cliente1CLI_PAI: TStringField;
    Cliente1CLI_MAE: TStringField;
    Cliente1CLI_CONJUGE: TStringField;
    Cliente1CLI_OBS1: TStringField;
    Cliente1CLI_LOCALTRABALHO: TStringField;
    Cliente1CLI_FAX: TStringField;
    Cliente1CLI_SITE: TStringField;
    Cliente1CLI_EMAIL: TStringField;
    Cliente1USU_CODIGO: TIntegerField;
    Cliente1CLI_DT_ALTERADO: TDateTimeField;
    Cliente1CLI_CELULAR: TStringField;
    ckbAtacado: TCheckBox;
    Cliente1CLI_SPC: TIntegerField;
    Cliente1CLI_VENDA_ATACADO: TSmallintField;
    edtDesconto: TEdit;
    labDesconto: TLabel;
    Cliente1CLI_DESCONTO: TFloatField;
    Funcionario1: TFuncionario;
    edtVendedor: TEdit;
    bitConfirmar: TBitBtn;
    Cliente1Usuario: TStringField;
    Parametro3: TParametro;
    Cliente1Logradouro: TStringField;
    cmbOrgao: TComboBox;
    Label31: TLabel;
    SB_Resumo: TSpeedButton;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edtReferencia1: TEdit;
    edtReferencia2: TEdit;
    edtReferencia3: TEdit;
    Cliente1CLI_ORGAO: TIntegerField;
    Cliente1CLI_DT_SPC: TDateTimeField;
    Cliente1CLI_REFERENCIA1: TStringField;
    Cliente1CLI_REFERENCIA2: TStringField;
    Cliente1CLI_REFERENCIA3: TStringField;
    Cliente1CLI_IDENTIFICACAO: TStringField;
    edtIdentificacao: TEdit;
    Label36: TLabel;
    Cliente1CLI_PROFISSAO: TStringField;
    ckbQuinzenal: TCheckBox;
    Cliente1CLI_QUINZENAL: TIntegerField;
    ckbMensal: TCheckBox;
    Cliente1CLI_MENSAL: TIntegerField;
    ckbNota: TCheckBox;
    Cliente1CLI_NOTA: TIntegerField;
    Label30: TLabel;
    dblClassificacao: TDBLookupComboBox;
    Cliente1CLI_CLASSIFICACAO: TIntegerField;
    Parametro4: TParametro;
    DSParametro4: TDataSource;
    SB_Contato: TSpeedButton;
    Label28: TLabel;
    dblTipo: TDBLookupComboBox;
    Parametro5: TParametro;
    DSParametro5: TDataSource;
    Cliente1CLI_MAQUINA: TIntegerField;
    Cliente1CLI_TIPO: TIntegerField;
    Cliente1CNC_CONVENIO: TIntegerField;
    Cliente1CLI_CONVENIO: TIntegerField;
    Label18: TLabel;
    edtConvenio: TEdit;
    edtConvenioCNC: TEdit;
    Cliente1CNC_ORIGEM: TIntegerField;
    Cliente1CLI_DT_IMPORTACAO_INS: TDateTimeField;
    Cliente1CLI_DT_IMPORTACAO_ALT: TDateTimeField;
    Cliente1CLI_DESCONTO_PRAZO: TFloatField;
    labDescontoPrazo: TLabel;
    edtDescontoPrazo: TEdit;
    ckbConsignatario: TCheckBox;
    Cliente1CLI_CONSIGNATARIO: TIntegerField;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    Sair1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    Cli_InfCredito: TAction;
    Cli_Afim: TAction;
    procedure ckbPessoaFisicaClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_CreditoClick(Sender: TObject);
    procedure SB_AfimClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblCentroDeCustoClick(Sender: TObject);
    procedure imgFotoClienteDblClick(Sender: TObject);
    procedure Cliente1BeforeOpen(DataSet: TDataSet);
    procedure edtClienteExit(Sender: TObject);
    procedure edtConjugeExit(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure Cliente1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ResumoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckbQuinzenalClick(Sender: TObject);
    procedure ckbMensalClick(Sender: TObject);
    procedure SB_ContatoClick(Sender: TObject);
    procedure edtLocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure ckbAtacadoClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure Parametro4BeforeOpen(DataSet: TDataSet);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Cancelar,CancelarCEP:boolean;
    Entidade:TCliente;
  end;

var
  fCadCli: TfCadCli;

implementation

Uses
  UDM, CdAvalista, MxRelCliente, CdInfCredito, funcoes, DigSenha,
  MxFotoAmpliada, MxSFuncionario, MxPedidoRapido, MxReceber,
  MxSelRegCob, MxCobrancaAdiciona, MxSVendasCliente,
  MxNotaFiscal, URelDataPromessa, MxCancelarRenegociacao, MxSelCliente,
  MxSelTitulos, MxEmprestimo, MxSelEmprestimo,
  MxSelBonusVendedor, MxLocalizaCEP, MxSaldoDev, MxSelPedido,
  MxSelPedidos, UHistCliEmbarque, MxCotacao, MxServico,
  MxSelClienteCurva, MxPedidoMotCal, MxSelNotaFiscal,
  MxPacoteVenda, MxSelFaturarPendentes, MxSelPacote,
  MxCredCli, MxSelMovimentoCredito, MxPacoteCredito, MxSelPacoteCredito,
  MxCheque, MxSelResumo, MxFactoring, MxTabPrecoSubGrupo,
  MxSelMovimentoCheque, MxSelCheques, CdContato, MxServicoLBM,
  MxSCadastroExtratificado, CdTabelaPrecoCliente, URelData,
  MxBonificacaoAmostra, CdComunicacao, MxAssistenciaTecnica,
  MxSelAssitenciaTecnica, URelDataVend, MxSelPendencia, MxSelInadiplencia,
  MxPedidoMotCal_2, URelConsignacao;

{$R *.DFM}

procedure TfCadCli.ckbPessoaFisicaClick(Sender: TObject);
begin
  If ckbPessoaFisica.Checked then
  Begin
    mskCPF_CNPJ.Editmask := '999-999-999-99;0;_';
    cmbOrgao.Enabled:=False;
    cmbOrgao.ItemIndex:=0;
    labDesNascimento.Caption := 'Nascimento';
  end
  Else
  Begin
    mskCPF_CNPJ.Editmask := '99-999-999/9999-99;0;_';
    if SB_SalvaCab.Enabled then
      cmbOrgao.Enabled:=True
    else
      cmbOrgao.Enabled:=False;
    labDesNascimento.Caption := 'Fundação';
  end;
end;

procedure TfCadCli.SB_NovoCabClick(Sender: TObject);
begin
  if (DM.Configuracao1.Empresa <> empLuciano) and (dblCentroDeCusto.KeyValue = 1) then
    raise Exception.Create('Você não pode inserir clientes no CPD.');

  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) or
     ((DM.Configuracao1.CodigoCNC<>dblCentroDeCusto.KeyValue) and
     (DM.Configuracao1.Empresa <> empMotical)) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  if (not DM.Configuracao1.CPD) and
     (DM.Configuracao1.Empresa = empMotical) then
    raise Exception.Create('Somente no CPD!');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(20)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  Entidade.PreparaInsercao(True);
  AtualizaControles(1, True);
  if DM.Usuario1.Permissoes.IndexOf(IntToStr(3780)) < 0 then
  Begin
    edtDesconto.Enabled := False;
    edtDescontoPrazo.Enabled := False;
  end;
  if DM.Usuario1.Permissoes.IndexOf(IntToStr(3720)) < 0 then
    ckbAtacado.Enabled := False;
  if (DM.Usuario1.Permissoes.IndexOf(IntToStr(8010)) < 0) and
     (DM.Configuracao1.Empresa <> empEletro) and
     (edtVendedor.Visible) then
    edtConjuge.Enabled := False;


  if GetEmpresaComunicacao(DM.QR_Consultas) = '01' then
    dblClassificacao.KeyValue := 458; //Loja

  edtVendedor.Clear;
  edtCliente.SetFocus;
end;

procedure TfCadCli.SB_AltCabClick(Sender: TObject);
var
  LiberarTudo : Boolean;
begin
  LiberarTudo := True;
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem alterados!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) or
     ((DM.Configuracao1.CodigoCNC<>dblCentroDeCusto.KeyValue) and
     (DM.Configuracao1.Empresa <> empMotical)) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  if (not DM.Configuracao1.CPD) and
     (DM.Configuracao1.Empresa = empMotical) then
    raise Exception.Create('Somente no CPD.');

  if (Entidade.CodigoCLI = DM.Configuracao1.CodigoCliAVista) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(7750)) < 0) then
    Raise exception.Create('Usuário não tem permissão para alterar cliente Balcão!');

  if (VerificaCPFCNPJBranco(mskCPF_CNPJ.Text)) and (DM.Configuracao1.Empresa = empLBM) then
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(40)) < 0 then
      LiberarTudo := False;

  Entidade.PreparaAlteracao(LiberarTudo);
  AtualizaControles(1, True);

  //Não permitir alterar o código do convênio se tiver pedido não faturado
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CLI_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE PDV_TIPO_VENDA=1 '+ //Pedido pendente
      ' AND PDV_SITUACAO=4 '+
      ' AND FPE_CODIGO=0 '+       //Ainda não Faturado
      ' AND CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
      ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI);
    Open;
    if not IsEmpty then
      edtConvenio.Enabled := False;
  end;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(3780)) < 0 then
  Begin
    edtDesconto.Enabled := False;
    edtDescontoPrazo.Enabled := False;
  end;
  if DM.Usuario1.Permissoes.IndexOf(IntToStr(3720)) < 0 then
    ckbAtacado.Enabled := False;
  if (DM.Usuario1.Permissoes.IndexOf(IntToStr(8010)) < 0) and
     (DM.Configuracao1.Empresa <> empEletro) and
     (edtVendedor.Visible) then
    edtConjuge.Enabled := False;


  try
    ckbPessoaFisica.SetFocus;
  except
  end;
end;

procedure TfCadCli.SB_ExcCabClick(Sender: TObject);
var
  CdCNC, CdCLI: integer;
begin
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem deletados!');

  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) or
     ((DM.Configuracao1.CodigoCNC<>dblCentroDeCusto.KeyValue) and
     (DM.Configuracao1.Empresa <> empMotical)) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  if (not DM.Configuracao1.CPD) and
     (DM.Configuracao1.Empresa = empMotical) then
    raise Exception.Create('Somente no CPD.');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(30)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  CdCNC := Entidade.CodigoCNC;
  CdCLI := Entidade.CodigoCLI;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CLI_CODIGO='+IntToStr(CdCLI)+
      ' AND CNC_CLIENTE='+IntToStr(CdCNC);
    Open;
    if not IsEmpty then
      Raise Exception.Create('Esse cliente foi utilizado em um Pedido de Venda! ('+FieldByName('PDV_CODIGO').asString+')');

    Close;
    SQL.Text := 'SELECT CLI_CODIGO '+
      ' FROM CLIENTE '+
      ' WHERE CLI_CONVENIO='+IntToStr(CdCLI)+
      ' AND CNC_CONVENIO='+IntToStr(CdCNC);
    Open;
    if not IsEmpty then
      Raise Exception.Create('Esse convênio foi utilizado em um cliente! ('+FieldByName('CLI_CODIGO').asString+')');

    Close;
    SQL.Text := 'SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
      ' WHERE CLI_CODIGO='+IntToStr(CdCLI)+
      ' AND CNC_CLIENTE='+IntToStr(CdCNC);
    Open;
    if not IsEmpty then
      Raise Exception.Create('Exite(m) título(s) em nome desse Cliente!');

    Close;
    SQL.Text := 'SELECT CLI_CODIGO FROM NOTA_FISCAL '+
      ' WHERE CLI_CODIGO='+IntToStr(CdCLI)+
      ' AND CNC_CLIENTE='+IntToStr(CdCNC);
    Open;
    if not IsEmpty then
      Raise Exception.Create('Existem Notas Fiscais em nome desse Cliente!');
  end;

  if Entidade.deletarauto then
  Begin
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM CONTATO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND FOR_CODIGO='+IntToStr(CdCLI)+
      ' AND CNT_TIPO=1 ');
  end;

  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtVendedor.Clear;
  end;
end;

procedure TfCadCli.SB_SalvaCabClick(Sender: TObject);
Var
  CLI :Integer;
  mensagem :string;
begin
  mensagem:='';
  CLI:=StrToInt(edtCodigoCLI.Text);

  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(1, False);
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM CLIENTE '+
      ' WHERE CNC_CODIGO=:CNC_CODIGO'+
      ' AND CLI_CODIGO='+IntToStr(CLI);
    Entidade.Open;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadCli.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtVendedor.Clear;
  end;
end;

procedure TfCadCli.SB_LocCabClick(Sender: TObject);
begin
  if (VerificaInteiroBranco(edtLocalizar.Text)) and (cmbCampo.ItemIndex = 1) then
    cmbCampo.ItemIndex := 0
  else if (not VerificaInteiroBranco(edtLocalizar.Text)) and (cmbCampo.ItemIndex = 0) then
    cmbCampo.ItemIndex := 1;
  If (cmbCampo.ItemIndex=0) and (edtLocalizar.Text<>'*') then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  if (edtLocalizar.Text='*') then
  Begin
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM CLIENTE '+
      ' WHERE CNC_CODIGO<>-1 '+
      Entidade.Selecao.Text+
      ' ORDER BY CLI_RZ_SOCIAL ASC ';
    Entidade.Open;
  end
  else
    Entidade.Selecionar;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtVendedor.Clear;
  end;
end;

procedure TfCadCli.Cliente1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  ckbPessoaFisicaClick(ckbPessoaFisica);
  if (DM.Configuracao1.Empresa IN [empLBM, empMotical, empHOPE]) and
     (VerificaInteiroBranco(Cliente1.Conjuge))then
  Begin
    Funcionario1.Close;
    Funcionario1.ParamByName('FUN_CODIGO').asInteger:=StrToInt(edtConjuge.Text);
    Funcionario1.Open;
    if not Funcionario1.IsEmpty then
      edtVendedor.Text:=Funcionario1.Apelido
    else
      edtVendedor.Clear;
  end
  else
    edtVendedor.Clear;
end;

procedure TfCadCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_CADCLI_');
  except
  end;
  try
    Entidade.Active:=False;
    Parametro1.Active:=False;
    Parametro2.Active:=False;
    Parametro3.Active:=False;    
    Parametro4.Active:=False;
    Parametro5.Active:=False;        
  finally
    Action:=Cafree;
  end;  
end;

procedure TfCadCli.Sair1Click(Sender: TObject);
begin
 fCadCli.Close;
end;

procedure TfCadCli.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadCli.SB_CreditoClick(Sender: TObject);
begin
  if (Entidade.IsEmpty) then
    Raise Exception.Create('Selecione o Cliente!');
  if (Entidade.CodigoCLI = DM.Configuracao1.CodigoCliAVista) then
    Raise Exception.Create('Cliente Balcão não tem Crédito!');
  if (not DM.Configuracao1.CPD) and
     (DM.Configuracao1.Empresa = empMotical) then
    raise Exception.Create('Somente no CPD.');

  //Verifica se o usuário que está logado não tem permissão para mudar as informações de crédito do cliente
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1090)) < 0) then //Acessar Informações de Crédito
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=9;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        If (Usuario1.Permissoes.IndexOf(IntToStr(1090)) < 0) then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para acessar as informações de crédito do cliente!');
        end
        else
          DM.Usuario1.GeraLog(1090, self.Entidade.CodigoCNC, self.Entidade.CodigoCLI,
            'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU));
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
    DM.Usuario1.GeraLog(1090, self.Entidade.CodigoCNC, self.Entidade.CodigoCLI);

  Application.CreateForm(TfCadInfCred, fCadInfCred);
  with fCadInfCred do
  Begin
    edtClienteCNC.Text     := IntToStr(self.dblCentroDeCusto.KeyValue);
    edtCodigoCLI.Text      := self.edtCodigoCLI.Text;
    edtConvenioCNC.Text    := IntToStr(self.Entidade.ConvenioCNC);
    edtConvenio.Text       := IntToStr(self.Entidade.Convenio);
    edtRazaoSocial.Text    := self.edtCliente.Text;
    dblLogradouro.KeyValue := self.dblLogradouro.KeyValue;
    edtEndereco.Text       := self.edtEndereco.Text;
    edtBairro.Text         := self.edtBairro.Text;
    edtCidade.Text         := self.edtCidade.Text;
    cmbUF.ItemIndex        := self.cmbUF.ItemIndex;
    mskCEP.Text            := self.mskCEP.Text;
    edtCredito.Text        :=format('%.2f',[self.Entidade.FieldByName('CLI_CREDITO').asFloat]);
    Showmodal;
  end;
end;

procedure TfCadCli.SB_AfimClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Cliente!');
  if (not DM.Configuracao1.CPD) and
     (DM.Configuracao1.Empresa = empMotical) then
    raise Exception.Create('Somente no CPD.');    
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) or
     ((DM.Configuracao1.CodigoCNC<>dblCentroDeCusto.KeyValue) and
     (DM.Configuracao1.Empresa <> empMotical)) then 
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');

  Application.CreateForm(TfMxRelCli, fMxRelCli);
  with fMxRelCli do
  Begin
    Cliente1.Close;
    Cliente1.ParamByName('CLI_CODIGO').asInteger := self.Entidade.CodigoCLI;
    Cliente1.ParamByName('CNC_CODIGO').asInteger := self.Entidade.CodigoCNC;
    Cliente1.Open;
    Showmodal;
  end;
end;

procedure TfCadCli.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if tag = 0 then
    bitConfirmar.Visible := False;
  Parametro1.Open;
  Parametro2.Open;
  Parametro4.Open;
  Parametro5.Open;
  edtLocalizar.SetFocus;
  if (DM.Configuracao1.Empresa in [empEletro, empLBM, empCreator]) then
  Begin
    ckbAtacado.Visible := False;
    labDesconto.Visible := False;
    labDescontoPrazo.Visible := False;
    edtDesconto.Visible := False;
    edtDescontoPrazo.Visible := False;
    edtEMail.Width := 171;
  end;
  if DM.Configuracao1.Empresa IN [empLBM, empMotical, empHope] then
  Begin
    if DM.Configuracao1.Empresa = empHOPE then
    Begin
      lblDescConjuge.Caption:='Código Promotor(a)';
      DBGrid5.Columns[17].Title.Caption:='Promotor(a)';
    end
    else
    Begin
      lblDescConjuge.Caption:='Código Vendedor(a)';
      DBGrid5.Columns[17].Title.Caption:='Vendedor(a)';
    end;
    edtVendedor.Visible:=True;
    edtRG_CGF.Width := 172;
    if (DM.Configuracao1.Empresa = empLBM) and //LBM
       (DM.Usuario1.CentroDeCusto <> 3) then //Somente na LBM Móveis
    Begin
      CentroCusto2.LocalizarCod(1);
      dblCentroDeCusto.KeyValue:=CentroCusto2.CodigoCNC;
      dblCentroDeCusto.OnClick(dblCentroDeCusto);
    end
    else if dblCentroDeCusto.Text = '' then //Motical ou Hope
    Begin
      CentroCusto2.LocalizarCod(DM.CentroCusto1.CodigoCNC);
      dblCentroDeCusto.KeyValue:=CentroCusto2.CodigoCNC;
      dblCentroDeCusto.OnClick(dblCentroDeCusto);
    end;
  end
  else if dblCentroDeCusto.Text = '' then
  Begin
    CentroCusto2.LocalizarCod(DM.CentroCusto1.CodigoCNC);
    dblCentroDeCusto.KeyValue:=CentroCusto2.CodigoCNC;
    dblCentroDeCusto.OnClick(dblCentroDeCusto);
  end;

  if DM.Configuracao1.Empresa = empEletro then
  Begin
    labDescSite.Visible := False;
    edtSite.Visible := False;
    labDesEMail.Visible := False;
    edtEMail.Visible := False;
    labDesconto.Visible := False;
    labDescontoPrazo.Visible := False;
    edtDesconto.Visible := False;
    edtDescontoPrazo.Visible := False;
    edtReferencia1.Width := 692;
  end;

  if DM.Configuracao1.Empresa = empMotical then
  Begin
    ckbQuinzenal.Visible := True;
    ckbMensal.Visible := True;
    ckbNota.Visible := True;
  end;

  if self.Tag = 49 then
    SB_LocCabClick(sender);

  if not Entidade.Active then
    Entidade.Open;
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;

end;

procedure TfCadCli.dblCentroDeCustoClick(Sender: TObject);
begin
  Parametro4.Close;
  Parametro4.Open;
  Entidade.close;
  Entidade.Open;
  Entidade.CarregaDados;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtVendedor.Clear;
  end;
end;

procedure TfCadCli.imgFotoClienteDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgFotoCliente.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Nome Fantasia/Apelido: '+Cliente1.NomeFantasia);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Endereço: '+Cliente1.Endereco+' - '+
    Cliente1.Bairro+' - '+Cliente1.Cidade+'/'+Cliente1.Uf);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Cliente1.OBS);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfCadCli.Cliente1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger:=dblCentroDeCusto.KeyValue;
  except
  end;
end;

procedure TfCadCli.edtClienteExit(Sender: TObject);
begin
  if (edtNomeFantasia.Text = '') and (edtCliente.Text <> '') and (not ckbPessoaFisica.Checked) then
    edtNomeFantasia.Text := edtCliente.Text;
end;

procedure TfCadCli.edtConjugeExit(Sender: TObject);
begin
  if (DM.Configuracao1.Empresa IN [empLBM, empMotical]) and (VerificaInteiroBranco(edtConjuge.Text))then
  Begin
    Funcionario1.Close;
    Funcionario1.ParamByName('FUN_CODIGO').asInteger:=StrToInt(edtConjuge.Text);
    Funcionario1.Open;
    if not Funcionario1.IsEmpty then
      edtVendedor.Text:=Funcionario1.Apelido
    else
      edtVendedor.Clear;
  end
  else
    edtVendedor.Clear;
end;

procedure TfCadCli.bitConfirmarClick(Sender: TObject);
var
  Foto: string;
begin
  if Entidade.IsEmpty then
  Begin
    edtLocalizar.SetFocus;
    Raise exception.Create('Selecione o cliente!');
  end;

  If tag=2 Then
  Begin
    fMxPedidoRapido.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);  
    fMxPedidoRapido.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli);
    fMxPedidoRapido.edtRazaoSocial.text:=Entidade.RazaoSocial;
    fMxPedidoRapido.mskCNPJCPF.text:=Entidade.CPFCGC;
    fMxPedidoRapido.Cliente1.Close;
    fMxPedidoRapido.Cliente1.ParamByName('CLI_CODIGO').AsInteger:=Cliente1.CodigoCLI;
    fMxPedidoRapido.Cliente1.ParamByName('CNC_CODIGO').AsInteger:=Cliente1.CodigoCNC;
    fMxPedidoRapido.Cliente1.Open;
    try
      if Cliente1.CodigoCNC < 10 then
        Foto := DM.Configuracao1.PastaImagens+'\Cliente\0'+
          IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG'
      else
        Foto := DM.Configuracao1.PastaImagens+'\Cliente\'+
          IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG';
      if FileExists(Foto) then
        fMxPedidoRapido.imgCliente.Picture.LoadFromFile(Foto)
      else
        fMxPedidoRapido.imgCliente.Picture:=nil;
    Except
      fMxPedidoRapido.imgCliente.Picture:=nil;
    end;
  End
  else If tag=3 Then
    fMxReceber.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli)
  else If tag=5 Then
    fMxSelRegCob.Edit1.text:=IntToStr(Entidade.CodigoCli)
  else If tag=6 Then
    fMxCobrancaAdiciona.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli)
  else If tag=8 Then
    fMxSVendasCliente.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli)
  else If tag=9 Then
  Begin
    fMxNotaFiscal.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);
    fMxNotaFiscal.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli);
  end
  else If tag=10 Then
    rpt_DataPromessa.Edit1.text:=IntToStr(Entidade.CodigoCli)
  else If tag=11 Then
    fMxCancelarRenegociacao.Edit1.text:=IntToStr(Entidade.CodigoCli)
  else If tag=12 Then
    fMxSelCliente.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli)
  Else If tag=13 Then
  Begin
    (*with fMxPedidoLBM do
    Begin
      edtCodigoCLI.text:=IntToStr(fCadCli.Entidade.CodigoCli);
      edtRazaoSocial.text:=fCadCli.Entidade.RazaoSocial;
      mskCPF_CNPJ.text:=fCadCli.Entidade.CPFCGC;
      edtClienteCNC.text:=IntToStr(fCadCli.Entidade.CodigoCNC);
      try
        if Cliente1.CodigoCNC < 10 then
          Foto := DM.Configuracao1.PastaImagens+'\Cliente\0'+
            IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG'
        else
          Foto := DM.Configuracao1.PastaImagens+'\Cliente\'+
            IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG';

        if FileExists(Foto) then
          fMxPedidoLBM.imgFotoCliente.Picture.LoadFromFile(Foto)
        else
          fMxPedidoLBM.imgFotoCliente.Picture:=nil;
      Except
        fMxPedidoLBM.imgFotoCliente.Picture:=nil;
      end;
    end;*)
  End
  else If tag=14 Then
    fMxSelTitulos.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli)
  else If tag=15 Then
  Begin
    fMxEmprestimo.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);
    fMxEmprestimo.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli);
    fMxEmprestimo.edtRazaoSocial.text:=Entidade.RazaoSocial;
  end
  else If tag=16 Then
  Begin
    fMxSelEmprestimo.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);
    fMxSelEmprestimo.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli);
  end
  //else If tag=17 Then
//    fMxSelBonusVendedor.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=18 then
    fMxSelPedido.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=19 then
    fMxSelPedidos.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=20 then
  Begin
    fMxCotacao.edtCodigoFOR.text:=IntToStr(Entidade.CodigoCLI); //Também usado para FOR
    fMxCotacao.edtFornecedor.text:=Entidade.RazaoSocial; //Também usado para FOR
  end
  else if tag=21 then
  Begin
    if (fMxServico.dblResponsavel.Text = '') and
       VerificaInteiroBranco(self.Entidade.Conjuge) then
      fMxServico.dblResponsavel.KeyValue := StrToInt(self.Entidade.Conjuge);
    fMxServico.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);
    fMxServico.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI);
    fMxServico.edtRazaoSocial.text:=Entidade.RazaoSocial;
    fMxServico.mskFone.text:=Entidade.Fone;
    if Entidade.PessoaFisica and (Trim(fMxServico.edtContato.text) = '')then
    Begin
      fMxServico.edtContato.text:=Entidade.RazaoSocial;
      fMxServico.mskFoneContato.text:=Entidade.Fone;
    end
    else if (Trim(fMxServico.edtContato.text) = '') then
      fMxServico.edtContato.text:=Entidade.Pai; //Contato 1
  end
  else if tag=22 then
  Begin
    //Receita
  end
  else if tag=23 then
  Begin
    fMxSelClienteCurva.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI);
  end
  else if tag=24 Then
  Begin
    fMxPedidoMotCal.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);
    fMxPedidoMotCal.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli);
    fMxPedidoMotCal.edtRazaoSocial.text:=Entidade.RazaoSocial;
    fMxPedidoMotCal.mskCNPJCPF.text:=Entidade.CPFCGC;
    fMxPedidoMotCal.Cliente1.Close;
    fMxPedidoMotCal.Cliente1.ParamByName('CLI_CODIGO').AsInteger:=Cliente1.CodigoCLI;
    fMxPedidoMotCal.Cliente1.ParamByName('CNC_CODIGO').AsInteger:=Cliente1.CodigoCNC;
    fMxPedidoMotCal.Cliente1.Open;
    try
      if Cliente1.CodigoCNC < 10 then
        Foto := DM.Configuracao1.PastaImagens+'\Cliente\0'+
          IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG'
      else
        Foto := DM.Configuracao1.PastaImagens+'\Cliente\'+
          IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG';
      if FileExists(Foto) then
        fMxPedidoMotCal.imgFotoCliente.Picture.LoadFromFile(Foto)
      else
        fMxPedidoMotCal.imgFotoCliente.Picture:=nil;
    Except
      fMxPedidoMotCal.imgFotoCliente.Picture:=nil;
    end;
  End
  else if tag=25 then
  Begin
    fMxSelNotaFiscal.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI);
  end
  else If tag=26 Then
  Begin
    with fMxPacoteVenda do
    Begin
      edtClienteCNC.text  := IntToStr(self.Entidade.CodigoCNC);    
      edtCodigoCLI.text   := IntToStr(self.Entidade.CodigoCli);
      edtRazaoSocial.text := self.Entidade.RazaoSocial;
      mskCNPJCPF.text     := self.Entidade.CPFCGC;
      if (dblCodigoFUN.Text = '') and
         VerificaInteiroBranco(self.Entidade.Conjuge) then
        dblCodigoFUN.KeyValue := StrToInt(self.Entidade.Conjuge);
      Cliente1.Close;
      Cliente1.ParamByName('CLI_CODIGO').AsInteger := self.Cliente1.CodigoCLI;
      Cliente1.ParamByName('CNC_CODIGO').AsInteger := self.Cliente1.CodigoCNC;
      Cliente1.Open;
      try
        if Cliente1.CodigoCNC < 10 then
          Foto := DM.Configuracao1.PastaImagens+'\Cliente\0'+
            IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG'
        else
          Foto := DM.Configuracao1.PastaImagens+'\Cliente\'+
            IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG';
        if FileExists(Foto) then
          imgCliente.Picture.LoadFromFile(Foto)
        else
          imgCliente.Picture:=nil;
      Except
        imgCliente.Picture:=nil;
      end;
    end;
  End
  else if tag=27 then
    fMxSelFaturarPendentes.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  //else if tag=28 then
//    fMxSelPedidoServico.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=29 then
    fMxSelPacote.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=30 then
    fMxCredCli.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=31 then
    fMxSelMovimentoCredito.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=32 then
  Begin
    fMxPacoteCredito.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);  
    fMxPacoteCredito.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI);
  end
  else if tag=33 then
    fMxSelPacoteCredito.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=34 then
    fMxSelPacoteCredito.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=35 then
  Begin
    fMxCheque.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);
    fMxCheque.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI);
    fMxCheque.edtDonoCheque.Text:=Entidade.RazaoSocial;
    fMxCheque.mskCPF_CNPJ.Text:=Entidade.CPFCGC;
  end
  else if tag=36 then
  Begin
    fMxFactoring.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);
    fMxFactoring.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI);
    fMxFactoring.edtRazaoSocial.Text:=Entidade.RazaoSocial;
  end
  else if tag=37 then
  Begin
    fMxTabPrecoSubGrupo.edtClienteCNC.text := IntToStr(Entidade.CodigoCNC);
    fMxTabPrecoSubGrupo.edtCodigoCLI.text  := IntToStr(Entidade.CodigoCLI);
    fMxTabPrecoSubGrupo.edtDescricao.Text  := Entidade.RazaoSocial;
  end
  else if tag=38 then
    fMxSelMovimentoCheque.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=39 then
    fMxSelCheques.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=40 then
  Begin
    if (fMxServicoLBM.dblResponsavel.Text = '') and
       VerificaInteiroBranco(self.Entidade.Conjuge) then
      fMxServicoLBM.dblResponsavel.KeyValue := StrToInt(self.Entidade.Conjuge);
    fMxServicoLBM.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);
    fMxServicoLBM.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI);
    fMxServicoLBM.edtRazaoSocial.text:=Entidade.RazaoSocial;
    fMxServicoLBM.mskFone.text:=Entidade.Fone;

    //Contato
    fMxServicoLBM.Contato1.Close;
    fMxServicoLBM.Contato1.SQL.Text := 'SELECT * FROM CONTATO '+
      ' WHERE CNC_FOR='+IntToStr(Entidade.CodigoCNC)+
      ' AND FOR_CODIGO='+IntToStr(Entidade.CodigoCLI);
    fMxServicoLBM.Contato1.Open;
    fMxServicoLBM.edtCodigoCNT.Text := IntToStr(fMxServicoLBM.Contato1.CodigoCNT);
    fMxServicoLBM.edtNomeContato.Text := fMxServicoLBM.Contato1.Nome;
  end
  else if tag=41 then
    fMxSExtratoExtratificado.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCLI)
  else if tag=42 then
  Begin
    fCadTabelaPrecoCliente.edtClienteCNC.Text  := IntToStr(Entidade.CodigoCNC);
    fCadTabelaPrecoCliente.edtCodigoCLI.text   := IntToStr(Entidade.CodigoCLI);
    fCadTabelaPrecoCliente.edtRazaoSocial.Text := Entidade.RazaoSocial;
  end
  else If tag=43 Then
    rpt_Data.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli)
  else If tag=44 Then
    fMxBonificacaoAmostra.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli)
  else if tag=45 then
  Begin
    fCadComunicacao.edtCodEntradaCNC.Text  := IntToStr(Entidade.CodigoCNC);
    fCadComunicacao.edtCodEntrada.text   := IntToStr(Entidade.CodigoCLI);
    fCadComunicacao.edtRazaoSocial.Text := Entidade.RazaoSocial;
  end
  else if tag=46 then
  Begin
    fMxAssistenciaTecnica.edtClienteCNC.text  := IntToStr(Entidade.CodigoCNC);
    fMxAssistenciaTecnica.edtCodigoCLI.text   := IntToStr(Entidade.CodigoCLI);
    fMxAssistenciaTecnica.edtRazaoSocial.Text := Entidade.RazaoSocial;
  end
  else if tag=47 then
    fMxAssistenciaTecnica.edtCodigoCLI.text  := IntToStr(Entidade.CodigoCLI)
  else if tag=48 then
    rpt_DataVend.edtCodigoCLI.text  := IntToStr(Entidade.CodigoCLI)
  else if tag=49 then
  Begin
  end
  else if tag=50 then
    fMxSelPendencia.edtCodigoCLI.text  := IntToStr(Entidade.CodigoCLI)
  else if tag=51 then
    fMxSelInadiplencia.edtCodigoCLI.text  := IntToStr(Entidade.CodigoCLI)
  else if tag=52 Then
  Begin
    fMxPedidoMotCal_2.edtClienteCNC.text:=IntToStr(Entidade.CodigoCNC);
    fMxPedidoMotCal_2.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli);
    fMxPedidoMotCal_2.edtRazaoSocial.text:=Entidade.RazaoSocial;
    fMxPedidoMotCal_2.mskCNPJCPF.text:=Entidade.CPFCGC;
    fMxPedidoMotCal_2.Cliente1.Close;
    fMxPedidoMotCal_2.Cliente1.ParamByName('CLI_CODIGO').AsInteger:=Cliente1.CodigoCLI;
    fMxPedidoMotCal_2.Cliente1.ParamByName('CNC_CODIGO').AsInteger:=Cliente1.CodigoCNC;
    fMxPedidoMotCal_2.Cliente1.Open;
    try
      if Cliente1.CodigoCNC < 10 then
        Foto := DM.Configuracao1.PastaImagens+'\Cliente\0'+
          IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG'
      else
        Foto := DM.Configuracao1.PastaImagens+'\Cliente\'+
          IntToStr(Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+'.JPG';
      if FileExists(Foto) then
        fMxPedidoMotCal_2.imgFotoCliente.Picture.LoadFromFile(Foto)
      else
        fMxPedidoMotCal_2.imgFotoCliente.Picture:=nil;
    Except
      fMxPedidoMotCal_2.imgFotoCliente.Picture:=nil;
    end;
  End
  else If tag=53 Then
    fMxRelConsignacao.edtCodigoCLI.text:=IntToStr(Entidade.CodigoCli);
  //
  Close;
end;

procedure TfCadCli.Cliente1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);

  if Entidade.Logradouro > 0 then
  Begin
    with Parametro3 do
    Begin
      if CodigoPAR <> Entidade.Logradouro then
      Begin
        Close;
        ParamByName('PAR_CODIGO').asInteger:=Entidade.Logradouro;
        Open;
      end;
      Entidade.FieldByName('Logradouro').asString := Descricao;
    end;
  end
  else
    Entidade.FieldByName('Logradouro').asString:='';
end;

procedure TfCadCli.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  Begin
    key:=#0;
    if (SB_CancCab.Enabled) then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if (key=chr(32)) then
  Begin
    if (edtConjuge.Focused) and (DM.Configuracao1.Empresa IN [empLBM, empMotical]) then
    Begin
      key:=chr(0);
      edtConjuge.Clear;
      edtVendedor.Clear;
      Application.CreateForm(TfMxSFuncionario, fMxSFuncionario);
      with fMxSFuncionario do
      Begin
        tag := 0;
        Funcionario1.Close;
        if DM.Configuracao1.Empresa = empHOPE then
          Funcionario1.SQL.Text:='SELECT CNC_CODIGO,FUN_CODIGO,FUN_NOME,FUN_APELIDO '+
            ' FROM FUNCIONARIO '+
            ' WHERE FUN_FUNCAO = 4400 '+ //Promotor(a)
            ' ORDER BY FUN_NOME '
        else
          Funcionario1.SQL.Text:='SELECT CNC_CODIGO,FUN_CODIGO,FUN_NOME,FUN_APELIDO '+
            ' FROM FUNCIONARIO '+
            ' WHERE (FUN_APARECE_VENDAS=1 '+
            '  OR FUN_APARECE_SERVICOS=1) '+
            ' AND (CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            '  OR  FUN_TODOS_CENTROS=1) '+
            ' ORDER BY FUN_NOME ';
        Funcionario1.Open;
        ShowModal;
      end;
    end
    else if (edtEndereco.Focused) and (edtEndereco.Text = '') then
    Begin
      key:=chr(0);
      try
        if not DM.DatabaseCEP.Connected then
          DM.DatabaseCEP.Connected := True;
      except
       ShowMessage('Não foi possível conectar com SACI_CEP!');
      end;
      if (DM.DatabaseCEP.Connected) then
      Begin
        Application.CreateForm(TfMxLocalizaCEP, fMxLocalizaCEP);
        fMxLocalizaCEP.tag:=1;
        fMxLocalizaCEP.ShowModal;
        if not CancelarCEP then
          edtEndereco.Text:=edtEndereco.Text+', ';
      end;
    end;
  end
  else if Key=chr(13) then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
    else if bitConfirmar.Visible then
    Begin
      bitConfirmar.SetFocus;
      bitConfirmarClick(sender);
    end;
  end
  else if (Key = '"') then
    Key := #0
  else if memObservacao.Focused then
    Key := UpCase(Key);
end;

procedure TfCadCli.SB_ResumoClick(Sender: TObject);
begin
  If Cliente1.IsEmpty then
    raise Exception.Create('Selecione um cliente antes de continuar!');

  Application.CreateForm(TfMxSelResumo,fMxSelResumo);
  with fMxSelResumo do
  Begin
    Tag := 0;
    CdCNC := Cliente1.CodigoCNC;
    CdCLI := Cliente1.CodigoCLI;
    sRazaoSocial := Cliente1.RazaoSocial;
    vCredito := Cliente1.Credito;
    ShowModal;
  end;
end;

procedure TfCadCli.FormCreate(Sender: TObject);
begin
  Entidade := Cliente1;
  CentroCusto2.Open; //Não pode tirar daqui

  with Funcionario1 do
  Begin
    Close;
    if DM.Configuracao1.Empresa = empHope then
      SQL.Text := 'SELECT * FROM FUNCIONARIO '+
        ' WHERE FUN_CODIGO=:FUN_CODIGO '+
        ' AND FUN_FUNCAO = 4400 ' //Promotor(a)
    else
      SQL.Text := 'SELECT * FROM FUNCIONARIO '+
        ' WHERE FUN_CODIGO=:FUN_CODIGO '+
        ' AND FUN_APARECE_VENDAS=1 '+
        ' AND (CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        '  OR  FUN_TODOS_CENTROS=1) ';
  end;

  with Parametro4 do //Classificação
  Begin
    Close;
    if DM.Configuracao1.Empresa = empLuciano then
      SQL.Text := 'SELECT * FROM PARAMETRO '+
        ' WHERE TPR_CODIGO=60 '+
        ' AND PAR_SITUACAO<>1 '+
        ' AND (PAR_INFORMACAO=0 OR PAR_INFORMACAO=:PAR_INFORMACAO) '+
        ' ORDER BY PAR_DESCRICAO '
    else
      SQL.Text := 'SELECT * FROM PARAMETRO '+
        ' WHERE TPR_CODIGO=60 '+
        ' AND PAR_SITUACAO<>1 '+
        ' ORDER BY PAR_DESCRICAO ';
  end;

  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_CadCLI_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfCadCli.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarCab.Enabled  := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_ExcCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);

  bitConfirmar.Enabled     := not Habilitar;
  SB_Contato.Enabled       := not Habilitar;  
  SB_Resumo.Enabled       := not Habilitar;
  SB_Credito.Enabled       := not Habilitar;
  SB_Afim.Enabled          := not Habilitar;

  edtLocalizar.Enabled := not Habilitar;
  if Habilitar then
    edtLocalizar.Color := AlteraCorComponentes
  else
    edtLocalizar.Color := clWindow;
  cmbCampo.Enabled     := not Habilitar;
  if Habilitar then
    cmbCampo.Color     :=AlteraCorComponentes
  else
    cmbCampo.Color     :=clWindow;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfCadCli.ckbQuinzenalClick(Sender: TObject);
begin
  if ckbQuinzenal.Checked then
    ckbMensal.Checked := False;
end;

procedure TfCadCli.ckbMensalClick(Sender: TObject);
begin
  if ckbMensal.Checked then
    ckbQuinzenal.Checked := False;
end;

procedure TfCadCli.SB_ContatoClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Cliente!');

  Application.CreateForm(TFCadCont, FCadCont);
  with fCadCont do
  Begin
    tag := 1;
    edtFORCNC.Text      := IntToStr(self.Entidade.CodigoCNC);
    edtCodigoFOR.Text   := IntToStr(self.Entidade.CodigoCLI);
    edtRazaoSocial.Text := self.Entidade.RazaoSocial;
    showmodal;
  end;
end;

procedure TfCadCli.edtLocalizarKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfCadCli.ckbAtacadoClick(Sender: TObject);
begin
  if ckbAtacado.Enabled then
  Begin
    if ckbAtacado.Checked then
    Begin
      if (edtDesconto.Text = '0,00') and
         (DM.Configuracao1.Empresa = empHope) then
        edtDesconto.Text := '25,00'
    end
    else if (DM.Configuracao1.Empresa = empHope) then
    Begin
      edtDesconto.Text := '0,00';
      edtDescontoPrazo.Text := '0,00';
    end;
  end;
end;

procedure TfCadCli.DBGrid5TitleClick(Column: TColumn);
begin
  if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
    Exit;
  Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
end;

procedure TfCadCli.Parametro4BeforeOpen(DataSet: TDataSet);
begin
  try
    Parametro4.ParamByName('PAR_INFORMACAO').asInteger := dblCentroDeCusto.KeyValue;
  except
  end;
end;

end.
