////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: PSACI                                                //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: PSACI                                                //
// UNIT................: Unit inicial do projeto                              //
// ANALISTA............: Anderson Gonçalves                                   //
// DESENVOLVEDOR.......: Anderson Gonçalves                                   //
// DATA DAS ALTERAÇÕES.: 07/04/2010                                           //
//============================================================================//
// COMENTÁRIOS..: O Pacote de venda, é somente para empresas Óticas           //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//============================================================================//
////////////////////////////////////////////////////////////////////////////////
unit UPrinc2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, ExtCtrls, StdCtrls, {ImpFiscB, }Db, DBTables, SQuery,
  ToolWin, ComObj, MMSystem, JPEG, ShellAPI, ImgList, ActnList, ActnMan,
  Mask, DBCtrls, XPStyleActnCtrls, ActnCtrls, Buttons, WinSkinData, u_Resources,
  ActnMenus, Inifiles, SiacReport_TLB;

type
  TSIAC = class(TForm)
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    tmrTimer: TTimer;
    QR_DesativarProdutos: TQuery;
    //ImpFiscalB1: TImpFiscalB;
    tmrDispararAcao: TTimer;
    imlMenu: TImageList;
    SkinData: TSkinData;
    ActionManager1: TActionManager;
    AR_MudarUsuario: TAction;
    CP_Cadastros: TAction;
    VE_Cadastros: TAction;
    SE_Cadastros: TAction;
    CX_Cadastros: TAction;
    FI_CadIdenxadorEconomico: TAction;
    ES_Cadastros: TAction;
    GE_Cadastros: TAction;
    AC_RelPendencia: TAction;
    AJ_Ajuda: TAction;
    AR_MudarCentroCusto: TAction;
    AR_AlterarSenha: TAction;
    AR_SelecionarImpressora: TAction;
    AR_Sair: TAction;
    AJ_AtualizarSistema: TAction;
    AJ_Sobre: TAction;
    AC_RelTarefas: TAction;
    AC_RelTestarImpressora: TAction;
    AC_Pendencia: TAction;
    AC_AgendaTarefa: TAction;
    AC_Mensagens: TAction;
    AC_ComunicacaoClienteFornecedor: TAction;
    AC_Calendario: TAction;
    AC_Calculadora: TAction;
    AC_BlocoNotas: TAction;
    AC_AcertarRelogio: TAction;
    AC_VisiteNossoSite: TAction;
    AC_Internet: TAction;
    CB_RelCobadores: TAction;
    CB_RelComissaoCobradores: TAction;
    CB_RelTitulosEmAtraso: TAction;
    CB_RelClientesEmAtraso: TAction;
    CB_RelClientesInadimplentes: TAction;
    CB_ControleDeCobranca: TAction;
    AC_Relatorios: TAction;
    CB_Relatorios: TAction;
    GE_Usuarios: TAction;
    GE_Funcionarios: TAction;
    GE_Parametros: TAction;
    GE_ModuloDoSistema: TAction;
    GE_SubModuloDoSistema: TAction;
    GE_OperacaoDoSistema: TAction;
    GE_Relatorios: TAction;
    GE_RelUsuarios: TAction;
    GE_RelFuncionarios: TAction;
    GE_RelParametros: TAction;
    GE_RelOperacoesDoSistema: TAction;
    GE_RelPermissoesDeUsuarios: TAction;
    GE_RelLogDeOperacoes: TAction;
    GE_Permissoes: TAction;
    GE_Configuracoes: TAction;
    GE_RegistroDeBalanco: TAction;
    GE_ListaDeUsuarios: TAction;
    GE_ImportacaoDeDados: TAction;
    GE_ExportacaoDeDados: TAction;
    CP_Fornecedor: TAction;
    CP_Transportador: TAction;
    CP_ICMSCompraVenda: TAction;
    CP_Relatorios: TAction;
    CP_RelFornecedor: TAction;
    CP_RelTransportador: TAction;
    CP_RelICMSCompraVenda: TAction;
    CP_RelContatos: TAction;
    CP_RelFornecedorProduto: TAction;
    CP_RelPrevisaoCompras: TAction;
    CP_RelQtdCompraXQtdVendas: TAction;
    CP_RelSugestaoCompra: TAction;
    CP_RelHistoricoCompra: TAction;
    CP_RelProdutosIndisponibilizados: TAction;
    CP_Cotacao: TAction;
    CP_PedidoDeCompra: TAction;
    CP_FaturarPendentes: TAction;
    CP_EnviarFornecedor: TAction;
    CP_ReposicaoFornecedor: TAction;
    CP_CalculadoraDeFrete: TAction;
    SE_Servico: TAction;
    SE_Relatorios: TAction;
    SE_RelServicos: TAction;
    SE_RelPedidoServico: TAction;
    SE_RelServicosEfetuados: TAction;
    SE_RelProdutosXServicos: TAction;
    SE_PedidodeServicoMenu: TAction;
    SE_PedidodeServico: TAction;
    SE_AlterarSituacaoPedido: TAction;
    SE_LiberarPedidoServico: TAction;
    SE_LocalizacaoServicos: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    VE_Clientes: TAction;
    VE_Avalista: TAction;
    VE_Veiculo: TAction;
    VE_Profissao: TAction;
    VE_CreditoCliente: TAction;
    VE_TabelaDesconto: TAction;
    VE_ControleCotaComissao: TAction;
    VE_QuantidadeNormalVenda: TAction;
    VE_AtendimentoVendedor: TAction;
    VE_CatracaNotaFiscal: TAction;
    VE_Relatorios: TAction;
    VE_RelClientes: TAction;
    VE_RelAvalistas: TAction;
    VE_RelVendedores: TAction;
    VE_RelVeiculosMenu: TAction;
    VE_RelVeiculos: TAction;
    VE_RelControleVeiculos: TAction;
    VE_RelProfissao: TAction;
    VE_RelQuantidadeNormalVenda: TAction;
    VE_RelComissaoFaturamento: TAction;
    VE_RelHistoricoVendedor: TAction;
    VE_RelBonusVendedor: TAction;
    VE_RelComissaoVendas: TAction;
    VE_RelComissaoTitulosRecebidos: TAction;
    VE_RelComissaoVendasCompleta: TAction;
    VE_RelFaturamentoVendedor: TAction;
    VE_RelFaturamentoFornecedor: TAction;
    VE_RelComparativoFornecedor: TAction;
    VE_RelReservaExterna: TAction;
    VE_RelDevolucaoParcial: TAction;
    VE_RelPacoteVenda: TAction;
    VE_RelPacoteCredito: TAction;
    VE_RelRelatorioEspecialVenda: TAction;
    VE_RelNotasFiscais: TAction;
    VE_RelMapaTributosFederais: TAction;
    VE_RelEspeciaisMenu: TAction;
    VE_relSaldoVendas: TAction;
    VE_RelVendasExtratificadas: TAction;
    VE_relCurvaABCProdutos: TAction;
    VE_RelMovimentacaoCredito: TAction;
    VE_RelPreferenciaCliente: TAction;
    VE_RelComparativoAnual: TAction;
    VE_RelTabelaPromocional: TAction;
    VE_RelRegistroProcura: TAction;
    VE_RelAtendimentoVendedor: TAction;
    VE_Graficos: TAction;
    VE_GraVendasVendedor: TAction;
    VE_Gra3TitulosPagosVendedor: TAction;
    VE_GraProdutosMaisVendidos: TAction;
    VE_GraFaturamentoMensal: TAction;
    VE_GraMediaFaturamento: TAction;
    VE_GraMetaQuinzenalVendedor: TAction;
    VE_GraAtendimentoVendedor: TAction;
    VE_RelPedidoVendaMenu: TAction;
    VE_DevolucaoTotal: TAction;
    VE_DevolucaoParcial: TAction;
    VE_CorrigirParcelas: TAction;
    VE_PedidoVenda: TAction;
    VE_PacoteVenda: TAction;
    VE_PacoteCredito: TAction;
    VE_CotacaoVenda: TAction;
    VE_FaturarPendente: TAction;
    VE_FaturarPendentesConvenios: TAction;
    VE_ReabrirPedidoFinalizado: TAction;
    VE_ReabrirPacoteVenda: TAction;
    VE_PromissoriaCarneCupom: TAction;
    VE_LiberarPedido: TAction;
    VE_LiberarPacote: TAction;
    VE_RegistroProcura: TAction;
    VE_ReservaPedidoExterno: TAction;
    VE_ControleVeiculos: TAction;
    VE_TabelaPromocional: TAction;
    VE_ListaPresentes: TAction;
    VE_PesquisaProdutos: TAction;
    VE_PesquisaEstoque: TAction;
    VE_LocalizacaoPedido: TAction;
    VE_LocalizacaoPacote: TAction;
    VE_EmissaoConhecimento: TAction;
    VE_EmissaoNotasFiscais: TAction;
    VE_EmissaoNotasFiscaisExterna: TAction;
    VE_LocalizacaoNotasFiscais: TAction;
    VE_LocalizaDetalhePedido: TAction;
    CX_Caixas: TAction;
    CX_ContasCaixa: TAction;
    CX_Relatorios: TAction;
    CX_RelCaixa: TAction;
    CX_RelContasCaixa: TAction;
    CX_RelFluxoCaixa: TAction;
    CX_RelMDF: TAction;
    CX_RelFluxoCaixaBoletimDiario: TAction;
    CX_RelRelacaoDespesas: TAction;
    CX_RelRelacaoRecebimento: TAction;
    CX_Graficos: TAction;
    CX_GraDespesas: TAction;
    CX_GraRecebimentos: TAction;
    CX_RecebimentoCliente: TAction;
    CX_PagamentoTitulos: TAction;
    CX_MovimentoCaixa: TAction;
    CX_RecebimentoAvulso: TAction;
    CX_PagamentoAvulso: TAction;
    CX_ExtornoMovimentoAvulso: TAction;
    CX_ControleCheque: TAction;
    CX_AberturaCaixa: TAction;
    CX_FechamentoCaixa: TAction;
    CX_VerificacaoCaixa: TAction;
    CX_ImpressoraFiscal: TAction;
    Action28: TAction;
    Action29: TAction;
    Action30: TAction;
    Action31: TAction;
    Action32: TAction;
    Action33: TAction;
    Action34: TAction;
    Action35: TAction;
    Action36: TAction;
    Action37: TAction;
    Action38: TAction;
    Action39: TAction;
    Action40: TAction;
    Action41: TAction;
    Action42: TAction;
    Action43: TAction;
    Action44: TAction;
    Action45: TAction;
    Action46: TAction;
    Action47: TAction;
    Action48: TAction;
    Action49: TAction;
    Action50: TAction;
    Action51: TAction;
    Action52: TAction;
    ES_CadProdutos: TAction;
    ES_CadFornecedores: TAction;
    ES_CadBonusVenda: TAction;
    ES_CadProdutoFornecedor: TAction;
    ES_CadOrigemFiscal: TAction;
    ES_CadOperacaoFiscal: TAction;
    ES_CadGrupos: TAction;
    ES_CadSubGrupo: TAction;
    ES_CadClassificacaoFiscal: TAction;
    ES_CadTabelaCusto: TAction;
    ES_CadOficinasAutorizadas: TAction;
    ES_CadGrau: TAction;
    ES_Relatorios: TAction;
    ES_RelEstoqueMenu: TAction;
    ES_RelPosicaoEstoque: TAction;
    ES_RelPosicaoEstoqueAnterior: TAction;
    ES_RelPosicaoEstoqueLote: TAction;
    ES_RelMovimentoEstoque: TAction;
    ES_RelParametrosProdutosMenu: TAction;
    ES_RelGrupo: TAction;
    ES_RelSubGrupo: TAction;
    ES_RelProdutosSite: TAction;
    ES_RelOrigemFiscal: TAction;
    ES_RelOperacaoFiscal: TAction;
    ES_RelCodigoBarras: TAction;
    ES_RelClassificacaoFiscal: TAction;
    ES_RelCategoriaProdutos: TAction;
    ES_RelTabelaCusto: TAction;
    ES_RelProdutos: TAction;
    ES_RelEmbarque: TAction;
    ES_RelInventario: TAction;
    ES_RelDemostracaoEmprestimo: TAction;
    ES_RelRecebimentos: TAction;
    ES_RelTransferencia: TAction;
    ES_RelBonusVenda: TAction;
    ES_RelPreRecebimento_Recebimento: TAction;
    ES_RelTransferenciaNecessaria: TAction;
    ES_RelAssistenciaTecnica: TAction;
    ES_RelVerificarEstoque: TAction;
    ES_RelBaseReal: TAction;
    ES_RelGrau: TAction;
    ES_AssistenciaTecnica: TAction;
    ES_Inventario: TAction;
    ES_Embarque: TAction;
    ES_Recebimento: TAction;
    ES_PreRecebimento: TAction;
    ES_ControleVitrine: TAction;
    ES_ManufaturarProduto: TAction;
    ES_IndisponibilizarEstoque: TAction;
    ES_DemostracaoEmprestimo: TAction;
    ES_TransferenciaNercadoria: TAction;
    ES_VerificarMercadoria: TAction;
    ES_CorrigirReserva: TAction;
    ES_AjustePreco: TAction;
    ES_AjustePrecoCusto: TAction;
    ES_DesativarAutomaticamente: TAction;
    ES_MovimentacaoMercadoriaAvulsa: TAction;
    ES_MovimentacaoBonificacao: TAction;
    FI_Cadastros: TAction;
    FI_CadBancos: TAction;
    FI_CadAgencia: TAction;
    FI_CadContaCorrente: TAction;
    FI_CadAgenteFinanceiro: TAction;
    FI_CadFormasPagto: TAction;
    FI_CadBancoBoleto: TAction;
    FI_CadBancoBoletoCBR45: TAction;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    Action18: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    Action23: TAction;
    Action24: TAction;
    Action25: TAction;
    Action26: TAction;
    Action27: TAction;
    Action53: TAction;
    Action54: TAction;
    Action55: TAction;
    Action56: TAction;
    Action57: TAction;
    Action58: TAction;
    Action59: TAction;
    Action60: TAction;
    FI_SPC: TAction;
    FI_SERASA: TAction;
    FI_EQUIFAX: TAction;
    Action64: TAction;
    Action65: TAction;
    Action66: TAction;
    VE_Consignacao: TAction;
    Image2: TImage;
    VE_RelConsignacao: TAction;
    VE_ReceberConsignacao: TAction;
    OpenDialog1: TOpenDialog;
    Query1: TQuery;
    qExec: TQuery;
    AR_EnviaComunicacao: TAction;
    AR_RecebeComunicacao: TAction;
    FS_CupomFiscal: TAction;
    FS_ImportacaoDados: TAction;
    FS_ExportacaoDados: TAction;
    FS_SPED: TAction;
    Image1: TImage;
    CX_CupomFiscal: TAction;
    FS_NFe: TAction;
    AC_SQL: TAction;
    CX_NFe: TAction;
    AC_Backup: TAction;
    VE_LocalizacaoCuponsFiscais: TAction;
    Action67: TAction;
    Action68: TAction;
    Action69: TAction;
    Action70: TAction;
    Action71: TAction;
    Action72: TAction;
    imlButton: TImageList;
    ToolBar1: TToolBar;
    tbClientes: TToolButton;
    tbPedidoVenda: TToolButton;
    tbReceimentoCliente: TToolButton;
    tbAberturaCaixa: TToolButton;
    tbEnviaComunicacao: TToolButton;
    tbRecebeComunicacao: TToolButton;
    tbPermissoes: TToolButton;
    tbProdutos: TToolButton;
    tbAtualizarSistema: TToolButton;
    tbBakup: TToolButton;
    tbFechamentoCaixa: TToolButton;
    tbTitulosReceber: TToolButton;
    tbTitulosPagar: TToolButton;
    procedure Usuarios2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pedidorapido1Click(Sender: TObject);
    procedure Cancelarltimocupom1Click(Sender: TObject);
    procedure ImprimirLeituraX1Click(Sender: TObject);
    procedure ImprimirMemriaFiscal1Click(Sender: TObject);
    procedure AjustarHorriodeVero1Click(Sender: TObject);
    procedure ReduoZ1Click(Sender: TObject);
    procedure ExibirltimaReduo1Click(Sender: TObject);
    procedure ExibirAlquotas1Click(Sender: TObject);
    procedure ExibirNmerodeSrie1Click(Sender: TObject);
    procedure ProgramarparaTruncamento1Click(Sender: TObject);
    procedure ProgramarparaArredondar1Click(Sender: TObject);
    procedure ExibirNmeroValordeCancelamentos1Click(Sender: TObject);
    procedure ResetarCasodeTravamento1Click(Sender: TObject);
    procedure AdicionarAlquotas1Click(Sender: TObject);
    procedure ConfigurarSmbolodaMoeda1Click(Sender: TObject);
    procedure ConfigurarNmerodeLinhasentreCupons1Click(Sender: TObject);
    procedure ConfigurarGrficodeAutenticao1Click(Sender: TObject);
    procedure ConfigurarIntensidadedeImpresso1Click(Sender: TObject);
    procedure ImprimirRelatrioGerencial1Click(Sender: TObject);
    procedure ExibirLeituraX1Click(Sender: TObject);
    procedure WMWindowPosChanging (var Msg :
       TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
    procedure EnviarEMail1Click(Sender: TObject);
    procedure Navegador1Click(Sender: TObject);
    procedure imgUsuarioDblClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Mapa1Click(Sender: TObject);
    procedure ImprimirConfiguraes1Click(Sender: TObject);
    procedure RelatrioTipo60Mestre1Click(Sender: TObject);
    procedure RelatrioTipo60Analtico1Click(Sender: TObject);
    procedure VerificarArredondamento1Click(Sender: TObject);
    procedure VerificarFirmware1Click(Sender: TObject);
    procedure tmrDispararAcaoTimer(Sender: TObject);
    procedure SaldodeVendas1Click(Sender: TObject);
    procedure PacotedeCrditoMotCal1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrTimerTimer(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DesativarAutomaticamente1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AR_MudarUsuarioExecute(Sender: TObject);
    procedure AR_MudarCentroCustoExecute(Sender: TObject);
    procedure AR_AlterarSenhaExecute(Sender: TObject);
    procedure AR_SelecionarImpressoraExecute(Sender: TObject);
    procedure AR_SairExecute(Sender: TObject);
    procedure CP_FornecedorExecute(Sender: TObject);
    procedure CP_TransportadorExecute(Sender: TObject);
    procedure CP_ICMSCompraVendaExecute(Sender: TObject);
    procedure CP_RelFornecedorExecute(Sender: TObject);
    procedure CP_RelTransportadorExecute(Sender: TObject);
    procedure CP_RelICMSCompraVendaExecute(Sender: TObject);
    procedure CP_RelContatosExecute(Sender: TObject);
    procedure CP_RelFornecedorProdutoExecute(Sender: TObject);
    procedure CP_RelPrevisaoComprasExecute(Sender: TObject);
    procedure CP_RelQtdCompraXQtdVendasExecute(Sender: TObject);
    procedure CP_RelSugestaoCompraExecute(Sender: TObject);
    procedure CP_RelHistoricoCompraExecute(Sender: TObject);
    procedure CP_RelProdutosIndisponibilizadosExecute(Sender: TObject);
    procedure CP_CotacaoExecute(Sender: TObject);
    procedure CP_PedidoDeCompraExecute(Sender: TObject);
    procedure CP_FaturarPendentesExecute(Sender: TObject);
    procedure CP_EnviarFornecedorExecute(Sender: TObject);
    procedure CP_ReposicaoFornecedorExecute(Sender: TObject);
    procedure CP_CalculadoraDeFreteExecute(Sender: TObject);
    procedure SE_ServicoExecute(Sender: TObject);
    procedure SE_RelServicosExecute(Sender: TObject);
    procedure SE_RelPedidoServicoExecute(Sender: TObject);
    procedure SE_RelServicosEfetuadosExecute(Sender: TObject);
    procedure SE_RelProdutosXServicosExecute(Sender: TObject);
    procedure SE_AlterarSituacaoPedidoExecute(Sender: TObject);
    procedure SE_PedidodeServicoExecute(Sender: TObject);
    procedure SE_LiberarPedidoServicoExecute(Sender: TObject);
    procedure SE_LocalizacaoServicosExecute(Sender: TObject);
    procedure AC_RelatoriosExecute(Sender: TObject);
    procedure AC_InternetExecute(Sender: TObject);
    procedure CP_CadastrosExecute(Sender: TObject);
    procedure CP_RelatoriosExecute(Sender: TObject);
    procedure SE_CadastrosExecute(Sender: TObject);
    procedure SE_RelatoriosExecute(Sender: TObject);
    procedure SE_PedidodeServicoMenuExecute(Sender: TObject);
    procedure CB_RelatoriosExecute(Sender: TObject);
    procedure GE_CadastrosExecute(Sender: TObject);
    procedure GE_RelatoriosExecute(Sender: TObject);
    procedure GE_ExportacaoDeDadosExecute(Sender: TObject);
    procedure CB_RelCobadoresExecute(Sender: TObject);
    procedure CB_RelComissaoCobradoresExecute(Sender: TObject);
    procedure CB_RelTitulosEmAtrasoExecute(Sender: TObject);
    procedure CB_RelClientesEmAtrasoExecute(Sender: TObject);
    procedure CB_RelClientesInadimplentesExecute(Sender: TObject);
    procedure CB_ControleDeCobrancaExecute(Sender: TObject);
    procedure AJ_AjudaExecute(Sender: TObject);
    procedure AJ_SobreExecute(Sender: TObject);
    procedure AC_RelPendenciaExecute(Sender: TObject);
    procedure AC_RelTestarImpressoraExecute(Sender: TObject);
    procedure AC_PendenciaExecute(Sender: TObject);
    procedure AC_AgendaTarefaExecute(Sender: TObject);
    procedure AC_MensagensExecute(Sender: TObject);
    procedure AC_ComunicacaoClienteFornecedorExecute(Sender: TObject);
    procedure AC_CalendarioExecute(Sender: TObject);
    procedure AC_CalculadoraExecute(Sender: TObject);
    procedure AC_BlocoNotasExecute(Sender: TObject);
    procedure AJ_AtualizarSistemaExecute(Sender: TObject);
    procedure AC_AcertarRelogioExecute(Sender: TObject);
    procedure GE_UsuariosExecute(Sender: TObject);
    procedure GE_FuncionariosExecute(Sender: TObject);
    procedure GE_ParametrosExecute(Sender: TObject);
    procedure GE_ModuloDoSistemaExecute(Sender: TObject);
    procedure GE_SubModuloDoSistemaExecute(Sender: TObject);
    procedure GE_OperacaoDoSistemaExecute(Sender: TObject);
    procedure GE_RelUsuariosExecute(Sender: TObject);
    procedure GE_RelFuncionariosExecute(Sender: TObject);
    procedure GE_RelParametrosExecute(Sender: TObject);
    procedure GE_RelOperacoesDoSistemaExecute(Sender: TObject);
    procedure GE_RelPermissoesDeUsuariosExecute(Sender: TObject);
    procedure GE_RelLogDeOperacoesExecute(Sender: TObject);
    procedure GE_PermissoesExecute(Sender: TObject);
    procedure GE_ConfiguracoesExecute(Sender: TObject);
    procedure GE_RegistroDeBalancoExecute(Sender: TObject);
    procedure GE_ListaDeUsuariosExecute(Sender: TObject);
    procedure GE_ImportacaoDeDadosExecute(Sender: TObject);
    procedure VE_CadastrosExecute(Sender: TObject);
    procedure VE_ClientesExecute(Sender: TObject);
    procedure VE_AvalistaExecute(Sender: TObject);
    procedure VE_VeiculoExecute(Sender: TObject);
    procedure VE_ProfissaoExecute(Sender: TObject);
    procedure VE_CreditoClienteExecute(Sender: TObject);
    procedure VE_TabelaDescontoExecute(Sender: TObject);
    procedure VE_ControleCotaComissaoExecute(Sender: TObject);
    procedure VE_QuantidadeNormalVendaExecute(Sender: TObject);
    procedure VE_AtendimentoVendedorExecute(Sender: TObject);
    procedure VE_CatracaNotaFiscalExecute(Sender: TObject);
    procedure VE_RelatoriosExecute(Sender: TObject);
    procedure VE_RelClientesExecute(Sender: TObject);
    procedure VE_RelAvalistasExecute(Sender: TObject);
    procedure VE_RelVendedoresExecute(Sender: TObject);
    procedure VE_RelVeiculosMenuExecute(Sender: TObject);
    procedure VE_RelVeiculosExecute(Sender: TObject);
    procedure VE_RelControleVeiculosExecute(Sender: TObject);
    procedure VE_RelProfissaoExecute(Sender: TObject);
    procedure VE_RelQuantidadeNormalVendaExecute(Sender: TObject);
    procedure VE_RelComissaoFaturamentoExecute(Sender: TObject);
    procedure VE_RelHistoricoVendedorExecute(Sender: TObject);
    procedure VE_RelBonusVendedorExecute(Sender: TObject);
    procedure VE_RelComissaoVendasExecute(Sender: TObject);
    procedure VE_RelComissaoTitulosRecebidosExecute(Sender: TObject);
    procedure VE_RelComissaoVendasCompletaExecute(Sender: TObject);
    procedure VE_RelFaturamentoVendedorExecute(Sender: TObject);
    procedure VE_RelFaturamentoFornecedorExecute(Sender: TObject);
    procedure VE_RelComparativoFornecedorExecute(Sender: TObject);
    procedure VE_RelReservaExternaExecute(Sender: TObject);
    procedure VE_RelDevolucaoParcialExecute(Sender: TObject);
    procedure VE_RelPacoteVendaExecute(Sender: TObject);
    procedure VE_RelPacoteCreditoExecute(Sender: TObject);
    procedure VE_RelRelatorioEspecialVendaExecute(Sender: TObject);
    procedure VE_RelNotasFiscaisExecute(Sender: TObject);
    procedure VE_RelMapaTributosFederaisExecute(Sender: TObject);
    procedure VE_RelEspeciaisMenuExecute(Sender: TObject);
    procedure VE_relSaldoVendasExecute(Sender: TObject);
    procedure VE_RelVendasExtratificadasExecute(Sender: TObject);
    procedure VE_relCurvaABCProdutosExecute(Sender: TObject);
    procedure VE_RelMovimentacaoCreditoExecute(Sender: TObject);
    procedure VE_RelPreferenciaClienteExecute(Sender: TObject);
    procedure VE_RelComparativoAnualExecute(Sender: TObject);
    procedure VE_RelTabelaPromocionalExecute(Sender: TObject);
    procedure VE_RelRegistroProcuraExecute(Sender: TObject);
    procedure VE_RelAtendimentoVendedorExecute(Sender: TObject);
    procedure VE_GraficosExecute(Sender: TObject);
    procedure VE_GraVendasVendedorExecute(Sender: TObject);
    procedure VE_Gra3TitulosPagosVendedorExecute(Sender: TObject);
    procedure VE_GraProdutosMaisVendidosExecute(Sender: TObject);
    procedure VE_GraFaturamentoMensalExecute(Sender: TObject);
    procedure VE_GraMediaFaturamentoExecute(Sender: TObject);
    procedure VE_GraMetaQuinzenalVendedorExecute(Sender: TObject);
    procedure VE_GraAtendimentoVendedorExecute(Sender: TObject);
    procedure VE_DevolucaoTotalExecute(Sender: TObject);
    procedure VE_RelPedidoVendaMenuExecute(Sender: TObject);
    procedure VE_DevolucaoParcialExecute(Sender: TObject);
    procedure VE_CorrigirParcelasExecute(Sender: TObject);
    procedure VE_PedidoVendaExecute(Sender: TObject);
    procedure VE_PacoteVendaExecute(Sender: TObject);
    procedure VE_PacoteCreditoExecute(Sender: TObject);
    procedure VE_CotacaoVendaExecute(Sender: TObject);
    procedure VE_FaturarPendenteExecute(Sender: TObject);
    procedure VE_FaturarPendentesConveniosExecute(Sender: TObject);
    procedure VE_ReabrirPedidoFinalizadoExecute(Sender: TObject);
    procedure VE_ReabrirPacoteVendaExecute(Sender: TObject);
    procedure VE_PromissoriaCarneCupomExecute(Sender: TObject);
    procedure VE_LiberarPedidoExecute(Sender: TObject);
    procedure VE_LiberarPacoteExecute(Sender: TObject);
    procedure VE_RegistroProcuraExecute(Sender: TObject);
    procedure VE_ReservaPedidoExternoExecute(Sender: TObject);
    procedure VE_ControleVeiculosExecute(Sender: TObject);
    procedure VE_TabelaPromocionalExecute(Sender: TObject);
    procedure VE_TabelaPromocionalSubGrupoExecute(Sender: TObject);
    procedure VE_ListaPresentesExecute(Sender: TObject);
    procedure VE_PesquisaProdutosExecute(Sender: TObject);
    procedure VE_PesquisaEstoqueExecute(Sender: TObject);
    procedure VE_LocalizacaoPedidoExecute(Sender: TObject);
    procedure VE_LocalizacaoPacoteExecute(Sender: TObject);
    procedure VE_LocalizaDetalhePedidoExecute(Sender: TObject);
    procedure VE_EmissaoConhecimentoExecute(Sender: TObject);
    procedure VE_EmissaoNotasFiscaisExecute(Sender: TObject);
    procedure VE_EmissaoNotasFiscaisExternaExecute(Sender: TObject);
    procedure VE_LocalizacaoNotasFiscaisExecute(Sender: TObject);
    procedure CX_CadastrosExecute(Sender: TObject);
    procedure CX_CaixasExecute(Sender: TObject);
    procedure CX_ContasCaixaExecute(Sender: TObject);
    procedure CX_RelatoriosExecute(Sender: TObject);
    procedure CX_RelCaixaExecute(Sender: TObject);
    procedure CX_RelContasCaixaExecute(Sender: TObject);
    procedure CX_RelMDFExecute(Sender: TObject);
    procedure CX_RelFluxoCaixaExecute(Sender: TObject);
    procedure CX_RelFluxoCaixaBoletimDiarioExecute(Sender: TObject);
    procedure CX_RelRelacaoDespesasExecute(Sender: TObject);
    procedure CX_RelRelacaoRecebimentoExecute(Sender: TObject);
    procedure CX_GraficosExecute(Sender: TObject);
    procedure CX_GraDespesasExecute(Sender: TObject);
    procedure CX_GraRecebimentosExecute(Sender: TObject);
    procedure CX_ImpressoraFiscalExecute(Sender: TObject);
    procedure CX_RecebimentoClienteExecute(Sender: TObject);
    procedure CX_PagamentoTitulosExecute(Sender: TObject);
    procedure CX_MovimentoCaixaExecute(Sender: TObject);
    procedure CX_RecebimentoAvulsoExecute(Sender: TObject);
    procedure CX_PagamentoAvulsoExecute(Sender: TObject);
    procedure CX_ExtornoMovimentoAvulsoExecute(Sender: TObject);
    procedure CX_ControleChequeExecute(Sender: TObject);
    procedure CX_AberturaCaixaExecute(Sender: TObject);
    procedure CX_FechamentoCaixaExecute(Sender: TObject);
    procedure CX_VerificacaoCaixaExecute(Sender: TObject);
    procedure Action28Execute(Sender: TObject);
    procedure Action29Execute(Sender: TObject);
    procedure Action30Execute(Sender: TObject);
    procedure Action31Execute(Sender: TObject);
    procedure Action32Execute(Sender: TObject);
    procedure Action33Execute(Sender: TObject);
    procedure Action34Execute(Sender: TObject);
    procedure Action35Execute(Sender: TObject);
    procedure Action36Execute(Sender: TObject);
    procedure Action37Execute(Sender: TObject);
    procedure Action38Execute(Sender: TObject);
    procedure Action39Execute(Sender: TObject);
    procedure Action40Execute(Sender: TObject);
    procedure Action41Execute(Sender: TObject);
    procedure Action42Execute(Sender: TObject);
    procedure Action43Execute(Sender: TObject);
    procedure Action44Execute(Sender: TObject);
    procedure Action45Execute(Sender: TObject);
    procedure Action46Execute(Sender: TObject);
    procedure Action47Execute(Sender: TObject);
    procedure Action48Execute(Sender: TObject);
    procedure Action49Execute(Sender: TObject);
    procedure Action50Execute(Sender: TObject);
    procedure Action51Execute(Sender: TObject);
    procedure Action52Execute(Sender: TObject);
    procedure ES_CadastrosExecute(Sender: TObject);
    procedure ES_CadProdutosExecute(Sender: TObject);
    procedure ES_CadFornecedoresExecute(Sender: TObject);
    procedure ES_CadBonusVendaExecute(Sender: TObject);
    procedure ES_CadProdutoFornecedorExecute(Sender: TObject);
    procedure ES_CadOrigemFiscalExecute(Sender: TObject);
    procedure ES_CadOperacaoFiscalExecute(Sender: TObject);
    procedure ES_CadGruposExecute(Sender: TObject);
    procedure ES_CadSubGrupoExecute(Sender: TObject);
    procedure ES_CadClassificacaoFiscalExecute(Sender: TObject);
    procedure ES_CadTabelaCustoExecute(Sender: TObject);
    procedure ES_CadOficinasAutorizadasExecute(Sender: TObject);
    procedure ES_CadGrauExecute(Sender: TObject);
    procedure ES_RelatoriosExecute(Sender: TObject);
    procedure ES_RelParametrosProdutosMenuExecute(Sender: TObject);
    procedure ES_RelGrupoExecute(Sender: TObject);
    procedure ES_RelSubGrupoExecute(Sender: TObject);
    procedure ES_RelProdutosSiteExecute(Sender: TObject);
    procedure ES_RelOrigemFiscalExecute(Sender: TObject);
    procedure ES_RelOperacaoFiscalExecute(Sender: TObject);
    procedure ES_RelCodigoBarrasExecute(Sender: TObject);
    procedure ES_RelClassificacaoFiscalExecute(Sender: TObject);
    procedure ES_RelCategoriaProdutosExecute(Sender: TObject);
    procedure ES_RelTabelaCustoExecute(Sender: TObject);
    procedure ES_RelEstoqueMenuExecute(Sender: TObject);
    procedure ES_RelPosicaoEstoqueExecute(Sender: TObject);
    procedure ES_RelPosicaoEstoqueAnteriorExecute(Sender: TObject);
    procedure ES_RelPosicaoEstoqueLoteExecute(Sender: TObject);
    procedure ES_RelMovimentoEstoqueExecute(Sender: TObject);
    procedure ES_RelProdutosExecute(Sender: TObject);
    procedure ES_RelEmbarqueExecute(Sender: TObject);
    procedure ES_RelInventarioExecute(Sender: TObject);
    procedure ES_RelDemostracaoEmprestimoExecute(Sender: TObject);
    procedure ES_RelRecebimentosExecute(Sender: TObject);
    procedure ES_RelPreRecebimento_RecebimentoExecute(Sender: TObject);
    procedure ES_RelTransferenciaExecute(Sender: TObject);
    procedure ES_RelBonusVendaExecute(Sender: TObject);
    procedure ES_RelTransferenciaNecessariaExecute(Sender: TObject);
    procedure ES_RelAssistenciaTecnicaExecute(Sender: TObject);
    procedure ES_RelVerificarEstoqueExecute(Sender: TObject);
    procedure ES_RelBaseRealExecute(Sender: TObject);
    procedure ES_RelGrauExecute(Sender: TObject);
    procedure ES_AssistenciaTecnicaExecute(Sender: TObject);
    procedure ES_InventarioExecute(Sender: TObject);
    procedure ES_EmbarqueExecute(Sender: TObject);
    procedure ES_RecebimentoExecute(Sender: TObject);
    procedure ES_PreRecebimentoExecute(Sender: TObject);
    procedure ES_ControleVitrineExecute(Sender: TObject);
    procedure ES_ManufaturarProdutoExecute(Sender: TObject);
    procedure ES_IndisponibilizarEstoqueExecute(Sender: TObject);
    procedure ES_DemostracaoEmprestimoExecute(Sender: TObject);
    procedure ES_TransferenciaNercadoriaExecute(Sender: TObject);
    procedure ES_VerificarMercadoriaExecute(Sender: TObject);
    procedure ES_CorrigirReservaExecute(Sender: TObject);
    procedure ES_AjustePrecoExecute(Sender: TObject);
    procedure ES_AjustePrecoCustoExecute(Sender: TObject);
    procedure ES_DesativarAutomaticamenteExecute(Sender: TObject);
    procedure ES_MovimentacaoMercadoriaAvulsaExecute(Sender: TObject);
    procedure ES_MovimentacaoBonificacaoExecute(Sender: TObject);
    procedure FI_CadastrosExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action26Execute(Sender: TObject);
    procedure Action54Execute(Sender: TObject);
    procedure Action58Execute(Sender: TObject);
    procedure FI_CadBancosExecute(Sender: TObject);
    procedure FI_CadAgenciaExecute(Sender: TObject);
    procedure FI_CadContaCorrenteExecute(Sender: TObject);
    procedure FI_CadAgenteFinanceiroExecute(Sender: TObject);
    procedure FI_CadFormasPagtoExecute(Sender: TObject);
    procedure FI_CadIdenxadorEconomicoExecute(Sender: TObject);
    procedure FI_CadBancoBoletoExecute(Sender: TObject);
    procedure FI_CadBancoBoletoCBR45Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
    procedure Action13Execute(Sender: TObject);
    procedure Action14Execute(Sender: TObject);
    procedure Action15Execute(Sender: TObject);
    procedure Action16Execute(Sender: TObject);
    procedure Action17Execute(Sender: TObject);
    procedure Action18Execute(Sender: TObject);
    procedure Action19Execute(Sender: TObject);
    procedure Action20Execute(Sender: TObject);
    procedure Action21Execute(Sender: TObject);
    procedure Action22Execute(Sender: TObject);
    procedure Action23Execute(Sender: TObject);
    procedure Action24Execute(Sender: TObject);
    procedure Action25Execute(Sender: TObject);
    procedure Action27Execute(Sender: TObject);
    procedure Action53Execute(Sender: TObject);
    procedure Action55Execute(Sender: TObject);
    procedure Action56Execute(Sender: TObject);
    procedure Action57Execute(Sender: TObject);
    procedure Action59Execute(Sender: TObject);
    procedure Action60Execute(Sender: TObject);
    procedure FI_SPCExecute(Sender: TObject);
    procedure FI_SERASAExecute(Sender: TObject);
    procedure FI_EQUIFAXExecute(Sender: TObject);
    procedure Action64Execute(Sender: TObject);
    procedure Action66Execute(Sender: TObject);
    procedure Action65Execute(Sender: TObject);
    procedure AC_VisiteNossoSiteExecute(Sender: TObject);
    procedure AC_MandeSuaMensagemExecute(Sender: TObject);
    procedure VE_ConsignacaoExecute(Sender: TObject);
    procedure VE_RelConsignacaoExecute(Sender: TObject);
    procedure VE_ReceberConsignacaoExecute(Sender: TObject);
    procedure AR_EnviaComunicacaoExecute(Sender: TObject);
    procedure AR_RecebeComunicacaoExecute(Sender: TObject);
    procedure FS_PAFExecute(Sender: TObject);
    procedure FS_ExportacaoDadosExecute(Sender: TObject);
    procedure FS_CupomFiscalExecute(Sender: TObject);
    procedure FS_ImportacaoDadosExecute(Sender: TObject);
    procedure FS_SPEDExecute(Sender: TObject);
    procedure FS_NFeExecute(Sender: TObject);
    procedure AC_SQLExecute(Sender: TObject);
    procedure AC_BackupExecute(Sender: TObject);
    procedure VE_LocalizacaoCuponsFiscaisExecute(Sender: TObject);
    procedure Action69Execute(Sender: TObject);
  private
    iContaTimer: integer;
    function AllTrim(pP1:String):String;
    (*Para ativar os subMenus*)
    procedure mn_SubMenu;
    (*Menu Arquivo*)
    procedure mn_MudarUsuarioCorrente(Sender: TObject);
    procedure mn_Sair;
    (*Menu Venda*)
    procedure mn_CadVeiculos;
    procedure mn_CadProfissao;
    procedure mn_CadTabelaDesconto;
    procedure mn_CadQuantidadeNormalVenda;
    procedure mn_CadAtendimentoVendedor;
    procedure mn_CadCatracaNotaFiscal;
    procedure mn_RelComissaoFaturamentoVendedor(Sender: TObject);
    procedure mn_RelEspeciaisSaldoVendas(Sender: TObject);
    procedure mn_PacoteCredito;
    procedure mn_VendaFaturarPendentes;
    procedure mn_VendaFaturarPendentesConvenio;
    procedure mn_ReabrirPacoteVenda;
    procedure mn_LiberarPedidoVenda;
    procedure mn_LiberarPacote;
    procedure mn_RegistrProcura;
    procedure mn_ReservaPedidoExterno;
    procedure mn_ControleVeiculos;
    procedure mn_ListaPresente;
    procedure mn_EmissaoConhecimento;
    (*Menu Serviço*)
    procedure mn_RelServicosEfetuados(Sender: TObject; iTag: Integer);
    procedure mn_LiberarPedido(iTag: Integer);
    (*Menu Cobrança*)
    procedure mn_RelTitulosEmAtraso(iTag: Integer; sCaption: string);
    (*Menu Financeiro*)
    procedure mn_CadBancoBoletoCBR454;
    procedure mn_BaixaAutomatica;

    (*Menu Estoque*)
    procedure mn_CadTabelaCusto;
    procedure mn_CadOficinasAutorizadas;
    procedure mn_CadGrau;
    procedure mn_RelPosicaoEstoqueLote(Sender: TObject);
    procedure mn_Embarque;
    procedure mn_PreRecebimento(Sender: TObject);
    procedure mn_ControleVitrine;
    procedure mn_ManufaturarProduto;
    procedure mn_DemostracaoEmprestimo;
    procedure mn_TransferenciaMercadoria;
    procedure mn_VerificarMercadoria;
    procedure mn_DesativarAutomaticamente;
    (*Menu Gerencia*)
    procedure mn_CF_ReducaoZ;
    procedure mn_CF_LeituraX;
    procedure mn_CF_CancelarUltimoCupom;
    procedure mn_CF_Rel60Mestre;
    procedure mn_CF_Rel60Analitico;
    procedure mn_CF_MapaResumo;
    procedure mn_CF_ExibirAliquota;
    procedure mn_CF_ExibirLeituraX;
    procedure mn_CF_ExibirUltimaReducao;
    procedure mn_CF_ExibirNumeroSerie;
    procedure mn_CF_ExibirNumeroValorCancelamento;
    procedure mn_CF_ResetarErro;
    procedure mn_CF_AdicionarAliquota;
    procedure mn_CF_VerificarFirmware;
    procedure mn_CF_VerificarArredondamento;
    procedure mn_CF_ProgramarParaArredondamento;
    procedure mn_CF_ProgramarParaTruncamento;
    procedure mn_CF_ConfigurarHorarioVerao;
    procedure mn_CF_ConfigurarSimboloMoeda;
    procedure mn_CF_ConfigurarLinhasEntreCupom;
    procedure mn_CF_ConfigurarGraficoAutenticacao;
    procedure mn_CF_ConfigurarIntensidadeImpressao;
    procedure mn_CF_ImprimirConfiguracoes;
    procedure mn_CF_ImprimirMemoriaFiscal;
    procedure mn_CF_ImprimirRelatorioGerencial;
    procedure MenuInvisivel;
    procedure ShowHint(Sender: TObject);
    procedure AdicionarCampos;
    procedure ExecutaSript;
  public
    { Public declarations }
    DataOk: Boolean;
    Cancelar: Boolean;
  end;

  function LucianoOtica_AguaDeCheiro: Boolean;
  function LucianoOtica_AguaDeCheiro_AnaCristina: Boolean;

var
  SIAC: TSIAC;

implementation

uses CdContato, CdTransportador, MxCotacao, MxPedCompra, CdAvalista,
  CdForPagam, CdCntCaixa, CdCaixa, CdAgFinanceiro, CdCatProduto,
  CdClasFisc, CdGrupo,  CdOrFiscal, CdProduto, CdSubGrupo,
  CdFuncionario, CdParametro, CdUsuario, CdRegProcura,
  MxRecebPedido, MxNotaFiscal, MxMovCaixa, MxCobCobrador, MxReceber,
  MxBaixaRec, MxPagar, MxBaixaPag,  MxTransferencia, MxEmbarque,
  MxRecebimento,  CdSolPReposicao, CdAutorizada, 
  CdFornecedor, CdCliente,  CdAgencia, CdBanco, CdConta, CdSecao,
  MxDevolucaoPed, MxRelPermissao, MxReserva, MxRelProduto,
  MxRelCliente, CdOperFiscal, UContato, UFornecedor, UTransportadoras, UPrev_vendas,
  UPendencia_reposicao, UProcura_Mercadoria, UAvalista, UVendedor, UCliente,
  UForma_de_pagamento, UCaixa, UAgencia,UBancos,
  UAplic_Financeira, UConta_bancaria, UCentro_de_custo, UIndex_economico,
  UCateg_de_produtos, UClass_fiscal, UOrigem_fiscal, UProduto, 
  UGrupo, UParametro, UFuncionario, USecao, UTipo_parametro, UUsuario,
  MxInventario, UOperacao_sistema, UReceber, UBaixaRec, UPagar, UBaixaPag,
  UFluxoCaixaDia, UFluxoCaixa, UComissao, URelData, funcoes, UDM, DigSenha,
  MxTabPreco, CdItemTab, UConta_de_Caixa, UCobrador,
  UCli_Inadimp, MxVirarData, MxLog, UProdForn, UOp_Relator, UFornProd,
  UOp_RelatGrup, UProdGrupo, URelData2, UOp_RelatSubGrp, UProdSubGrup,
  UCarnet, MxCredCli, URelDataVend,
  UOp_RelatProd, USugestaoCmp, MxPedidoRapido, UPromissoria,
  MxSPediLocImpPromis, MxSPediLocLibPed, MxSPediCliHist, MxMudaSenha,
  MxSTitAtrazo, MxSelecionarData, MxBoletimAbreCaixa,
  MxBoletimFechaCaixa, MxSPediLocComp, uEstoque, URel_Embar, MxCheque,
  URelTransReceb, URelacaoDespesas, URelDataCobr, MxSelIntMemFisc,
  MxSelConta, UMxAjustePreco, URelDataProd, Urpt_Cotacao, URelDataCompra,
  MxPreRecebimento, UDescontos, MxSPreRecRec, UVendasCliente,
  MxSVendasCliente, MxSelClienteInad, MxTrocaProduto, MxSTituloPagar,
  MxSelInadiplencia, UfMxSProdutoData, MxSelDataCentro, MxAdicionaAliquota,
  MxSimboloMoeda, MxEspacoEntreCupom, MxGraficoAutenticacao,
  MxReducaoUltima, MxItensidadeImpressoraFiscal, MxRelatorioGerencial,
  MxSelCliente, MxBonus, MxCancelarRenegociacao, MxSelImpressora,
  MxControleSPC, MxEstoqueGeral, MxSelTitulos,
  MxTabelaDescontos, MxManufaturado, MxCota, MxEmprestimo, MxSelEmprestimo,
  MxSelData, Urpt_bonus, MxSelBonus, MxSelBonusVendedor,
  MxCentralMensagem, MxLocalizaUsuario, MxSobre, CdUF_ICMS, UUF_ICMS,
  MxSelDataComissao, MxLocalizaCEP, MxFotoAmpliada, MxCatraca,
  MxLocalizaNotaCupom, MxReabrirPedido, MxSEstEntrada, MxSelNotaFiscal,
  MxSelCheques, MxSelPedido, MxAgendaTarefas, MxSelPedidos, MxSPediProd,
  MxEditorTexto, MxMensagemTempo, MxSelLog, MxFeriados,
  MxAlterarParcelas, MxTabelaQtdNormal, MxBaixaAutomatica,
  MxAjustaPrecoCusto, MxControleSerasa, MxSelMapaTributos, MxServico,
  UOperacaoFiscal, MxSCadastroExtratificado,
  UQtdNormalVenda, CdGrau, UGrau,
  CdCodigoBarras, CdConhecimento, UCodigoBarras, MxLista_de_Presente,
  CdOperSist, MxSelOperacao_do_Sistema, MxSelProdutoCurva, CdModulo,
  CdSubModulo, MxSelPecasReposicao, MxPedidoMotCal, MxSituacaoServico,
  MxVerificaEstoque, CdControle_de_Vitrine, MxFluxoDeCaixa, MxPacoteVenda,
  MxSelFaturamentoFornecedor, MxSelFaturarPendentes, MxSelSubGrupo,
  MxSPediProdMotCal, MxExtornoAvulso, MxBalanco,
  MxSelReservaExterna, MxSelEstoqueAnterior, MxSelPacote,
  MxSelMovimentoCredito, MxPacoteCredito, MxSelPacoteCredito,
  MxTabPrecoSubGrupo, UBaseReal, CdServico, CdIndexador, CdBancoBoleto,
  MxSelInventario, MxSelMDF, MxControleEquifax, MxFactoring,
  MxSelRegistroBoleto, MxSelMovimentoCheque, MxPrecoCusto, MxServicoLBM,
  MXSelCentroCusto, MxSelPermissao, MxTestarImpressora, MxSelDataProduto,
  MxSelTitulosReceberRecebidos, MxSelGrau, MxMovimentoContaCorrente,
  MxImportarDados, MxVerificarMercadoria, MxSelComparativoForn,
  MxSelFuncionario, MxReabrirPacote, MxSelTarefa, MxLocalizarPacoteVenda,
  MxBonificacaoAmostra, CdComunicacao, CdEnviarFornecedor,
  CdBancoBoletoCBR454, MxVerificaCaixa, MxSelFaturarPendentesCompra,
  MxSelDetalhePedido, MxSelAgenteFinanceiro, MxAssistenciaTecnica,
  MxSelAssitenciaTecnica, CdVeiculo, CdAtendimentosPorVendedor,
  MxSelAtendimentoPorVendedor, MxControleVeiculo, CdReposicaoFornecedor,
  MxCalculadoraFrete, CdProfissao, UProfissao, UVeiculo,
  MxSelControleVeiculo, MxPendencia, MxSelPendencia, UPosEstoqueLote,
  UPedidoRX, ULimite_de_Gasto, MxPedidoMotCal_2,
  MxSelGerencial, MxPagarAvulsoCPD1, u_DefLibWebBrowser,
  MxRecebAvulsoCPD1, Variants, MxExportarDados, Configuracao,
  MxConsignacao, URelConsignacao, CdEnviaComunicacao, CdRecebeComunicacao,
  u_Framework, {u_Boleto,} uSQL, UDMFB, u_ListaPedidoPAF;

{$R *.DFM}

procedure TSIAC.WMWindowPosChanging(var Msg:TWMWindowPosChanged);
Begin
  with Msg.WindowPos^ do
  Begin
    x := -4;
    y := -4;
    Msg.Result := 0;
  end;
end;

procedure TSIAC.Usuarios2Click(Sender: TObject);
begin
  Application.CreateForm(TFCadUsuario, FCadUsuario);
  with fCadUsuario do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.FormCreate(Sender: TObject);
begin
  //Application.OnHint := ShowHint;//TODO Hint no StatusBar
  //Aplicando o Skin

  AdicionarCampos;
  ExecutaSript;
  
  if f_SkinGerenciador then
    SkinData.Active := True
  else
    SkinData.Active := False;

  //Configurações Regionais
  ThousandSeparator:='.';
  DecimalSeparator :=',';
  DateSeparator    :='/';
  ShortDateFormat  :='dd/mm/yyyy';
  TimeSeparator    :=':';
  ShortTimeFormat  :='hh:mm:ss';

  if screen.width >= 800 then
    StatusBar1.Panels[0].Width := 280 + screen.width - 800;
  StatusBar1.Panels[0].Text:='  '+EmpresaDesenvolvedora;
  StatusBar1.Panels[1].Text:='  CNC: '+ IntToStr(DM.CentroCusto1.CodigoCNC) + ' (' + DM.CentroCusto1.RazaoSocial + ')';
  StatusBar1.Panels[2].Text:='  Login: '+UpperCase(DM.Usuario1.NomeUSU)+' / Maq: '+PreencheZero(3,DM.Usuario1.Maquina);
  StatusBar1.Panels[3].Text:='  '+DateTimetoStr(DM.Configuracao1.DataHora);
  Top:=0;
  Left:=0;

  MenuInvisivel;
end;

procedure TSIAC.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[3].Text:='  '+DateTimetoStr(DM.Configuracao1.DataHora);
end;

procedure TSIAC.FormShow(Sender: TObject);
var
  sLogo: string;

  procedure subTemporario; //HIPERCARD
  begin
    qExec.Close;
    qExec.SQL.Clear;
    qExec.SQL.Add('SELECT AGF_CODIGO FROM AGENTE_FINANCEIRO');
    qExec.SQL.Add('WHERE');
    qExec.SQL.Add('  AGF_CODIGO = 23');
    qExec.Open;
    if qExec.IsEmpty then
    begin
      qExec.Close;
      qExec.SQL.Clear;
      qExec.SQL.Add('INSERT INTO AGENTE_FINANCEIRO');
      qExec.SQL.Add('(AGF_CODIGO,');
      qExec.SQL.Add('CNC_CODIGO,');
      qExec.SQL.Add('AGF_DESCRICAO,');
      qExec.SQL.Add('AGF_TAXA_ADM,');
      qExec.SQL.Add('AGF_JUROS,');
      qExec.SQL.Add('AGF_DIA_PAGAMENTO,');
      qExec.SQL.Add('AGF_ANTECIPACAO,');
      qExec.SQL.Add('USU_CODIGO,');
      qExec.SQL.Add('AGF_DT_ALTERADO,');
      qExec.SQL.Add('AGF_DT_CADASTRO,');
      qExec.SQL.Add('AGF_JUROS_ENTRADA,');
      qExec.SQL.Add('AGF_CONTABIL_1,');
      qExec.SQL.Add('AGF_CONTABIL_2,');
      qExec.SQL.Add('AGF_CONTABIL_3,');
      qExec.SQL.Add('AGF_CONTABIL_4,');
      qExec.SQL.Add('AGF_HISTORICO_CONTABIL,');
      qExec.SQL.Add('AGF_LIBERAR_DESCONTO_FPG,');
      qExec.SQL.Add('AGF_SITUACAO,');
      qExec.SQL.Add('AGF_ESPECIAL,');
      qExec.SQL.Add('AGF_OBSERVACAO,');
      qExec.SQL.Add('AGF_REC_AVISTA,');
      qExec.SQL.Add('AGF_TAXA_MENSAL,');
      qExec.SQL.Add('AGF_TIPOPAG_EXCLUSIVO,');
      qExec.SQL.Add('AGF_CENTAVOS_ENTRADA)');
      qExec.SQL.Add('VALUES');
      qExec.SQL.Add('(23,1,''HIPERCARD'',0,4,30,'''',2,'''','''',0,'''','''','''','''','''',0,0,0,'''',0,0,13,1)');
      qExec.ExecSQL
    end;
  end;

begin
  if DM.Configuracao1.Empresa <> empTeste then
  Begin
    //Caption:='SIAC - Sistema Integrado de Automação Comercial / Versão: ' + f_VersaoSistema + ' - ' + DM.CentroCusto1.RazaoSocial;
    Caption:='SIAC - Sistema Integrado de Automação Comercial / Versão: ' + f_VersaoSistema;
  end;

  DM.Usuario1.ConfiguraTela(SIAC);

  if DM.Configuracao1.Empresa IN TEmpresasOtica then
  Begin
    //LocalizarDetalhedePedido1.Visible := True;
    //VerificaEstoqueEletro1.Visible := False;
    //TabeladePreos1.Visible := False;
    //if DM.Configuracao1.Empresa = empMotical then
      //CorrigirReservas1.Visible := True;
    //FaturarPendentes2.Visible := False;
  end
  else
  Begin
    //PedidodeVendaMotCal1.Visible := False;
    //LocalizarDetalhedePedido1.Visible := False;
    //PacotedeVendaMotCal1.Visible := False;
    //LocalizaodePacotes1.Visible := False;
    //PacotedeCrditoMotCal1.Visible := False;
    //RelatriodePacotesCrdito1.Visible := False;
    //RelatriodePacote1.Visible := False;
    //TabeladePreoSubGrupo1.Visible := False;
    //BaseReal1.Visible := False;
    //Grau1.Visible := False;
    //Grau2.Visible := False;
    //LiberarPacote1.Visible := False;
    //FaturarPendentes1.Visible := False;
  end;

  //Ativar o verificador de Mensagem caso o usuário tenha permissão !!!
  If not DM.Usuario1.Permissoes.IndexOf(IntToStr(2150)) < 0 then
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE MENSAGEM SET '+
      ' MSG_ALERTADO = 0 '+
      ',MSG_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE MSG_CNC_DESTINO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND MSG_USU_DESTINO='+IntToStr(DM.Configuracao1.CodigoUSU)+
      ' AND MSG_ALERTADO = 1 '+
      ' AND MSG_SITUACAO_RECEBER = 0 '+
      ' AND MSG_SITUACAO_ENVIAR = 1 ');

    DM.Mensagem1.Close;
    DM.tmrMensagem.Enabled := True;
    DM.tmrMensagemTimer(sender);
  end;
//  imgUsuario.Left := Width - 130;

  tmrDispararAcao.Enabled := True;


  //Verifica se tem a logo na pasta \Imagens\Centro de Custo\
  sLogo := '..\Imagens\Centro de Custo\Logo';
  if fileexists(sLogo + '.bmp') then
    rptArquivoLogo := sLogo + '.bmp'
  else if fileexists(sLogo + '.jpg') then
    rptArquivoLogo := sLogo + '.jpg'
  else if fileexists(sLogo + '.png') then
    rptArquivoLogo := sLogo + '.png'
  else
  begin
    sLogo := '..\Imagens\Centro de Custo\' + FormatFloat('00',StrToFloat(IntToStr(DM.Configuracao1.CodigoCNC))) + '-Logo';
    if fileexists(sLogo + '.bmp') then
      rptArquivoLogo := sLogo + '.bmp'
    else if fileexists(sLogo + '.jpg') then
      rptArquivoLogo := sLogo + '.jpg'
    else if fileexists(sLogo + '.png') then
      rptArquivoLogo := sLogo + '.png'
    else
      rptArquivoLogo := '';
  end;
  //


  try
    CorrigeRegistroDeletado(DM.QR_Comandos);
  except
  end;


  //Alteração em: 01/08/2013 - Na comunicação importa a data de pagamento = 1899-12-30
  {
  PDV_MELHOR_DATA
  PDV_DT_EMISSAO_VENDA
  PDV_DT_DEVOLUCAO
  PDV_DT_PREVISAO
  PDV_DT_FPE
  PDV_DT_FPE2
  }
  Try
    ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET TRC_PAGAMENTO = NULL WHERE TRC_PAGAMENTO = ''1899-12-30'' AND TRC_VALOR_PAGO = 0');
  Except
  end;
  //Alteração em: 01/08/2013 - Na comunicação importa a data de antecipado = 1899-12-30
  Try
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET PDV_DT_ANTECIPADO = NULL WHERE PDV_DT_ANTECIPADO = ''1899-12-30''');
  Except
  end;

  try
    //subTemporario; {não usar mais}


    //Alteração em 27/07/2013
    //Código para o laboratório, e luciano ótica
    if GetEmpresaComunicacao(DM.QR_Consultas) = 'LO' then
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM PEDIDO_DE_VENDA '+
                                ' WHERE CNC_CODIGO = 3 AND NOT PDV_CODIGO IN '+
                                ' (SELECT T2.PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA T2 '+
                                ' WHERE PEDIDO_DE_VENDA.CNC_CODIGO = T2.CNC_CODIGO AND PEDIDO_DE_VENDA.PDV_CODIGO = T2.PDV_CODIGO)');
  except
  end;
end;

procedure TSIAC.Pedidorapido1Click(Sender: TObject);
begin
  Application.CreateForm(TfMxPedidoRapido, fMxPedidoRapido);
  with fMxPedidoRapido do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.Cancelarltimocupom1Click(Sender: TObject);
begin
  mn_CF_CancelarUltimoCupom;
end;

procedure TSIAC.ImprimirLeituraX1Click(Sender: TObject);
begin
  mn_CF_LeituraX;
end;

procedure TSIAC.ImprimirMemriaFiscal1Click(Sender: TObject);
begin
  mn_CF_ImprimirMemoriaFiscal;
end;

procedure TSIAC.AjustarHorriodeVero1Click(Sender: TObject);
begin
  mn_CF_ConfigurarHorarioVerao;
end;

procedure TSIAC.ReduoZ1Click(Sender: TObject);
begin
  mn_CF_ReducaoZ;
end;

procedure TSIAC.ExibirltimaReduo1Click(Sender: TObject);
Begin
  mn_CF_ExibirUltimaReducao;
end;

procedure TSIAC.ExibirAlquotas1Click(Sender: TObject);
begin
  mn_CF_ExibirAliquota;
end;

procedure TSIAC.ExibirNmerodeSrie1Click(Sender: TObject);
begin
  mn_CF_ExibirNumeroSerie;
end;

procedure TSIAC.ProgramarparaTruncamento1Click(Sender: TObject);
begin
  mn_CF_ProgramarParaArredondamento;
end;

procedure TSIAC.ProgramarparaArredondar1Click(Sender: TObject);
begin
  mn_CF_ProgramarParaTruncamento;
end;

procedure TSIAC.ExibirNmeroValordeCancelamentos1Click(Sender: TObject);
begin
  mn_CF_ExibirNumeroValorCancelamento;
End;

procedure TSIAC.ResetarCasodeTravamento1Click(Sender: TObject);
begin
  mn_CF_ResetarErro;
end;

procedure TSIAC.AdicionarAlquotas1Click(Sender: TObject);
begin
  mn_CF_AdicionarAliquota;
end;

procedure TSIAC.ConfigurarSmbolodaMoeda1Click(Sender: TObject);
begin
  mn_CF_ConfigurarSimboloMoeda;
end;

procedure TSIAC.ConfigurarNmerodeLinhasentreCupons1Click(Sender: TObject);
begin
  mn_CF_ConfigurarLinhasEntreCupom;
end;

procedure TSIAC.ConfigurarGrficodeAutenticao1Click(Sender: TObject);
begin
  mn_CF_ConfigurarGraficoAutenticacao;
end;

procedure TSIAC.ConfigurarIntensidadedeImpresso1Click(Sender: TObject);
begin
  mn_CF_ConfigurarIntensidadeImpressao;
end;

procedure TSIAC.ImprimirRelatrioGerencial1Click(Sender: TObject);
begin
  mn_CF_ImprimirRelatorioGerencial;
end;

procedure TSIAC.ExibirLeituraX1Click(Sender: TObject);
begin
  mn_CF_ExibirLeituraX;
end;

procedure TSIAC.EnviarEMail1Click(Sender: TObject);
begin
  showmessage('Em desenvolvimento!');
  (*
  ShellExecute(Handle,'open','mailto:andersoun@hotmail.com',nil,'',Sw_ShowNormal);
  *)

//Mandar email direto
{
  if not NMSMTP1.Connected then
  Begin
    NMSMTP1.Host := 'smtp.for.terra.com.br';
    NMSMTP1.UserID := 'xxxxx';
    NMSMTP1.Connect;
  end;
  if NMSMTP1.Connected then
  begin
//    NMSMTP1.ClearParams := false;//CheckBox1.Checked;

//    NMSMTP1.SubType := mtPlain;
//    case RadioGroup1.ItemIndex of
//      0: NMSMTP1.EncodeType := uuMime;
//      1: NMSMTP1.EncodeType := uuCode;
//    end;
    NMSMTP1.PostMessage.FromAddress := 'lilica@asmeninas.com.br';//Edit4.Text;
//    NMSMTP1.PostMessage.FromName := 'xxxxx';//Edit5.Text;
    NMSMTP1.PostMessage.ToAddress.Text := 'lennard@hotmail.com';//Memo1.Text;
//    NMSMTP1.PostMessage.ToCarbonCopy.Text := '';//Memo3.Text;
    NMSMTP1.PostMessage.ToBlindCarbonCopy.Text := 'xxxxxx@terra.com.br';//Memo2.Text;
    NMSMTP1.PostMessage.Body.Text := 'Um de seus amigos cadastrou seu e-mail no nosso site'+
      ' e nos falou sobre o seu interesse nos nossos serviços. Agradecemos a preferência e a '+
      ' credibilidade nas nossas habilidades. Aguarde contato em breve pelo número: 9104-9433 '+
      ' PS: Este e-mail está configurado para não receber resposta. Aguarde. Beijos LILICA';//Memo4.Text;

    NMSMTP1.PostMessage.Attachments.Text := 'C:\autoexec.bat';//ListBox1.Items.Text;
    NMSMTP1.PostMessage.Subject := 'Primeiro contato!!!';//Edit8.Text;
//    NMSMTP1.PostMessage.LocalProgram := '';//Edit6.Text;
//    NMSMTP1.PostMessage.Date := '01/01/2001';//Edit3.Text;
//    NMSMTP1.PostMessage.ReplyTo := '';//Edit7.Text;
    NMSMTP1.SendMail;
  end
  else
    ShowMessage('Você não está conectado!!!');

  NMSMTP1.Disconnect;
}

end;

procedure TSIAC.Navegador1Click(Sender: TObject);
begin
  showmessage('Em desenvolvimento!');
end;

procedure TSIAC.imgUsuarioDblClick(Sender: TObject);
begin
{  if imgUsuario.Picture.Graphic <> nil then
  begin
    Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
    fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgUsuario.Picture;
    fMxFotoAmpliada.memRodapeFoto.Lines.Add('Usuário: '+DM.Usuario1.NomeUSU);
    fMxFotoAmpliada.memRodapeFoto.Lines.Add('Máquina: '+IntToStr(DM.Usuario1.MaquinaLogado));
    fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+DM.Usuario1.OBS);
    fMxFotoAmpliada.ShowModal;
  end;
}  
end;

procedure TSIAC.Image1DblClick(Sender: TObject);
begin
  AJ_SobreExecute(sender);
end;

procedure TSIAC.Mapa1Click(Sender: TObject);
begin
  mn_CF_MapaResumo;
end;

procedure TSIAC.ImprimirConfiguraes1Click(Sender: TObject);
begin
  mn_CF_ImprimirConfiguracoes;
end;

procedure TSIAC.RelatrioTipo60Mestre1Click(Sender: TObject);
Begin
  mn_CF_Rel60Mestre;
end;

procedure TSIAC.RelatrioTipo60Analtico1Click(Sender: TObject);
begin
  mn_CF_Rel60Analitico;
end;

procedure TSIAC.VerificarArredondamento1Click(Sender: TObject);
begin
  mn_CF_VerificarArredondamento;
end;

procedure TSIAC.VerificarFirmware1Click(Sender: TObject);
begin
  mn_CF_VerificarFirmware;
end;

procedure TSIAC.tmrDispararAcaoTimer(Sender: TObject);
var
  foto : string;
begin
  tmrDispararAcao.Enabled := False;
  try
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 SNH_DT_CADASTRO AS DATA '+
        ' FROM USUARIO_SENHA '+
        ' WHERE USU_CODIGO='+IntToStr(DM.Usuario1.CodigoUSU)+
        ' ORDER BY SNH_DT_CADASTRO DESC ';
      Open;
      if FieldByName('DATA').AsDateTime <= DM.Usuario1.DataSenhaAlterada then
        if DM.Usuario1.Senha = Encrypt('1234') then
          AR_AlterarSenhaExecute(sender);
    end;

    If (DM.Configuracao1.Empresa = empEletro) and
       (DM.Usuario1.Mafalda <> 1) and
       (DM.Usuario1.CentroDeCusto <> 0) then
    Begin
      //Verificar Pendência de Pre Recebimento
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text:='SELECT TOP 1 P1.PRC_DATA '+
          ' FROM PRE_RECEBIMENTO P1 '+
          ' WHERE P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND P1.PRC_SITUACAO<>1 '+

          ' AND NOT EXISTS (SELECT PRC_CODIGO '+
          ' FROM RECEBIMENTO R1 '+
          ' WHERE R1.CNC_CODIGO=P1.CNC_CODIGO '+
          ' AND R1.REC_COD_ORIGEM=P1.PRC_COD_ORIGEM '+
          ' AND R1.REC_CNC_ORIGEM=P1.PRC_CNC_ORIGEM '+
          ' AND R1.REC_TIPO=P1.PRC_TIPO) '+

          ' AND EXISTS (SELECT PRC_CODIGO FROM ITEM_DE_PRE_RECEBIMENTO I1 '+
          '  WHERE P1.CNC_CODIGO=I1.CNC_CODIGO '+
          '  AND P1.PRC_CODIGO=I1.PRC_CODIGO) ';
        Open;
        if (not IsEmpty) then
        Begin
          ShowMessage('Atenção !!!'+#13+
                      'Existe(m) pendência(s) de Pre-Recebimento!');
          //PrRecebimento1Click(SIAC);
        end;
      end;
    end;

    Application.ProcessMessages;

    //Atualizar e verificar Tarefas !!!
    If not DM.Usuario1.Permissoes.IndexOf(IntToStr(4570)) < 0 then
    Begin
      with DM.Tarefa1 do
      Begin
        Close;
        SQL.Text := 'SELECT TAR_CODIGO '+
          ' FROM TAREFA '+
          ' WHERE TAR_SITUACAO=1 '+
          ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ' AND TAR_DT_AGENDADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
          ' AND TAR_DT_AGENDADO<"'+MesDia(DM.Configuracao1.Data+1)+'" ';
        Open;
        if not IsEmpty then
        Begin
          StatusBar1.Panels[2].Text:=StatusBar1.Panels[2].Text+' (Tarefa)';
          ShowMessage('Verifique a Agenda de Tarefas!');
        end;
      end;
    end;

    Application.ProcessMessages;

    {Removido a configuração do papel de parede do sistema, foi desabilitado na tela de configurações os campos onde escolhe o papel de parede
    try
      if cPapelDeParede = '.' then
      Begin
        if FileExists(DM.Configuracao1.PastaImagens+'\Fundo.JPG') then
          Image1.Picture.LoadFromFile(DM.Configuracao1.PastaImagens+'\Fundo.JPG')
        else if FileExists(DM.Configuracao1.PastaImagens+'\Fundo.BMP') then
          Image1.Picture.LoadFromFile(DM.Configuracao1.PastaImagens+'\Fundo.BMP');
      end
      else if cPapelDeParede <> '' then
        if FileExists(cPapelDeParede) then
          Image1.Picture.LoadFromFile(cPapelDeParede);
    except
    end;
    }

    {try
      foto:=DM.Configuracao1.PastaImagens+'\Usuario\01-'+IntToStr(DM.Configuracao1.CodigoUSU)+'.JPG';
      if FileExists(foto) then
        imgUsuario.Picture.LoadFromFile(foto);
    Except
      imgUsuario.Picture:=nil;
    end;}

    Application.ProcessMessages;

    if not DM.Mensagem3.Active then
      DM.Mensagem3.Open;
    Application.ProcessMessages;
    if not DM.Item_de_Embarque1.Active then
      DM.Item_de_Embarque1.Open;
    Application.ProcessMessages;
    tmrTimer.Enabled := True;
  finally
    Screen.Cursor:=crArrow;
  end;
  cLogado := 1;
end;

procedure TSIAC.SaldodeVendas1Click(Sender: TObject);
begin
  mn_RelEspeciaisSaldoVendas(Sender);
end;

procedure TSIAC.PacotedeCrditoMotCal1Click(Sender: TObject);
begin
  mn_PacoteCredito;
end;

procedure TSIAC.FormClose(Sender: TObject; var Action: TCloseAction);
var
  UsuCodAnt: integer;
begin
  try
    UsuCodAnt := DM.Configuracao1.CodigoUSU;
    //Liberar usuario que estava logado
    ExecutaSQL(DM.QR_Comandos,'UPDATE USUARIO SET '+
      ' USU_SITUACAO=0 '+
      ',USU_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE USU_CODIGO='+IntToStr(UsuCodAnt));
    //Criar Log de Saída do Sistema
    DM.Usuario1.GeraLog(2,0,0,'IP:'+GetIP);
    CorrigeRegistroDeletado(DM.QR_Comandos);
  except
  end;
end;

procedure TSIAC.tmrTimerTimer(Sender: TObject);
begin
  if SIAC.Active and
     (cSegundosInoperante > 0) then
  Begin
    inc(iContaTimer);
    if (iContaTimer > cSegundosInoperante*20) then
    Begin
      tmrTimer.Enabled := False;
      iContaTimer := 0;
      AR_MudarUsuarioExecute(sender);
    end;
  end
  else if iContaTimer > 0 then
    iContaTimer := 0;
end;

procedure TSIAC.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  iContaTimer := 0;
end;

procedure TSIAC.DesativarAutomaticamente1Click(Sender: TObject);
begin
  mn_DesativarAutomaticamente;
end;

procedure TSIAC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
  if (key = VK_F2) and (Vendas1.Visible) and (PedidodeVendaMotCal1.Visible) then
    PedidodeVendaMotCal1Click(Sender);
  if (key = VK_F3) and (Vendas1.Visible) and (NostasFiscais1.Visible) then
    NostasFiscais1Click(Sender);
  if (key = VK_F4) and (Vendas1.Visible) and (TabeladeProdutos1.Visible) then
    TabeladeProdutos1Click(Sender);
  if (key = VK_F5) and (Vendas1.Visible) and (Clientes2.Visible) then
    Clientes2Click(Sender);
  if (key = VK_F6) and (Financeiro1.Visible) and (TtulosaReceber1.Visible) then
    TtulosaReceber1Click(Sender);
  if (key = VK_F7) and (Financeiro1.Visible) and (TtulosaPagar1.Visible) then
    TtulosaPagar1Click(Sender);
  if (key = VK_F8) and (Estoque1.Visible) and (Produtos2.Visible) then
    Produtos2Click(Sender);
  if (key = VK_F9) and (Estoque1.Visible) and (Recebimento1.Visible) then
    Recebimento1Click(Sender);
  if (key = VK_F10) and (Estoque1.Visible) and (PrRecebimento1.Visible) then
    PrRecebimento1Click(Sender);
  if (key = VK_F11) and (Estoque1.Visible) and (Transferncia1.Visible) then
    Transferncia1Click(Sender);
  if (key = VK_F12) and (Gerncia1.Visible) and (Permisses1.Visible) then
    Permisses1Click(Sender);
}
end;

procedure TSIAC.mn_MudarUsuarioCorrente(Sender: TObject);
Var
  UsuCodAnt: Integer;
  foto:string;
  x: Byte;
begin
  iContaTimer := 0;
  if MDIChildCount > 0 then
  begin
    for x := 0 to Pred(MDIChildCount) do
      MDIChildren[x].Close;
  end;

  UsuCodAnt := DM.Configuracao1.CodigoUSU;
  //Liberar usuario que estava logado
  ExecutaSQL(DM.QR_Comandos,'UPDATE USUARIO SET '+
    ' USU_SITUACAO=0 '+
    ',USU_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE USU_CODIGO='+IntToStr(UsuCodAnt));
  //Criar Log de Saída do Sistema
  DM.Usuario1.GeraLog(2,0,0,'IP:'+GetIP);

  Application.CreateForm(TDigitaSenha, DigitaSenha);
  With DigitaSenha do
  Begin
    Tag:=2;
    HelpContext:=1100;
    onClose:=nil;
    Cancelar := True;
    Showmodal;
    If Cancelar then
    Begin
      Application.Terminate;
      Free;
      Exit;
    End;
    free;
  End;

  //Carregar Permissões
  With DM do
  Begin
    Configuracao1.CodigoUSU:=UsuLogin;
    Usuario1.Close;
    Usuario1.Open;

    DM.Configuracao1.Close;
    DM.Configuracao1.Open;

    Usuario1.LocalizarCod(UsuLogin);
    Usuario1.CarregaPermissoes(UsuLogin);
    StatusBar1.Panels[2].Text:='  Login: '+UpperCase(Usuario1.NomeUSU)+' / Maq: '+PreencheZero(3,DM.Usuario1.Maquina);
    StatusBar1.Refresh;
    Usuario1.ConfiguraTela(self);
    Usuario1.GeraLog(1,0,0,'IP:'+GetIP);
    // Ativar o verificador de Mensagem caso o usuário tenha permissão !!!
    If not DM.Usuario1.Permissoes.IndexOf(IntToStr(2150)) < 0 then
    Begin
      DM.tmrMensagem.Enabled := True;
      DM.tmrMensagemTimer(sender);
    end;
  End;

  StatusBar1.Panels[1].Text:='  CNC: '+ IntToStr(DM.CentroCusto1.CodigoCNC) + ' (' + DM.CentroCusto1.RazaoSocial + ')';
  {try
    foto:=DM.Configuracao1.PastaImagens+'\Usuario\01-'+IntToStr(DM.Configuracao1.CodigoUSU)+'.JPG';
    if FileExists(foto) then
      imgUsuario.Picture.LoadFromFile(foto)
    else
      imgUsuario.Picture:=nil;
  Except
    imgUsuario.Picture:=nil;
  end;}

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 SNH_DT_CADASTRO AS DATA '+
      ' FROM USUARIO_SENHA '+
      ' WHERE USU_CODIGO='+IntToStr(DM.Usuario1.CodigoUSU)+
      ' ORDER BY SNH_DT_CADASTRO DESC ';
    Open;
    if FieldByName('DATA').AsDateTime <= DM.Usuario1.DataSenhaAlterada then
      if DM.Usuario1.Senha = Encrypt('1234') then
        AR_AlterarSenhaExecute(sender);
  end;

  try
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT USU_CODIGO '+
        ' FROM USUARIO '+
        ' WHERE (USU_NOME="ANDERSON") ';
      Open;
      if FieldByName('USU_CODIGO').asInteger <> DM.Configuracao1.CodigoUSU then
      Begin
        {N51.Visible := False;
        Mdulo1.Visible := False;
        SubMdulo1.Visible := False;
        OperaesdoSistema1.Visible := False;
        OperaesdoSistema2.Visible := False;}
      end
      else
      Begin
        {N51.Visible := True;
        Mdulo1.Visible := True;
        SubMdulo1.Visible := True;
        OperaesdoSistema1.Visible := True;
        OperaesdoSistema2.Visible := True;}
      end;
    end;

    if DM.Configuracao1.Empresa <> empEletro then
    Begin
      //ReservaporPedidoExterno1.Visible := False;
  //    VerificaEstoqueEletro1.Visible := False;
    end;

    //TabeladeDescontos1.Visible := False;
    //SaldodeVendas1.Visible := False;
    //BnusdeVenda1.Visible := False;
    //BnusdeVenda2.Visible := False;

    if DM.Configuracao1.Empresa IN TEmpresasOtica then
    Begin
      //LocalizarDetalhedePedido1.Visible := True;
      //VerificaEstoqueEletro1.Visible := False;
      //TabeladePreos1.Visible := False;
      //if DM.Configuracao1.Empresa = empMotical then
        //CorrigirReservas1.Visible := True;
      //FaturarPendentes2.Visible := False;
    end
    else
    Begin
      //PedidodeVendaMotCal1.Visible := False;
      //N23.Visible := False;
      //LocalizarDetalhedePedido1.Visible := False;
      //PacotedeVendaMotCal1.Visible := False;
      //LocalizaodePacotes1.Visible := False;
      //PacotedeCrditoMotCal1.Visible := False;
      //RelatriodePacotesCrdito1.Visible := False;
      //RelatriodePacote1.Visible := False;
      //TabeladePreoSubGrupo1.Visible := False;
      //BaseReal1.Visible := False;
      //N47.Visible := False; //Linha em cima do Grau
      //Grau1.Visible := False;
      //N48.Visible := False; //Linha em cima do Grau
      //Grau2.Visible := False;
      //LiberarPacote1.Visible := False;
      //N42.Visible := False;
      //FaturarPendentes1.Visible := False;
    end;
  except
  end;

  MenuInvisivel;
end;

procedure TSIAC.mn_Sair;
begin
  Close;
end;

procedure TSIAC.AR_MudarUsuarioExecute(Sender: TObject);
begin
  mn_MudarUsuarioCorrente(Sender);
end;

procedure TSIAC.AR_MudarCentroCustoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMXSelCentroCusto, fMXSelCentroCusto);
  with fMXSelCentroCusto do
  Begin
    Tag := 0;
    HelpContext:=1300;
    ShowModal;
  end;

  StatusBar1.Panels[1].Text:='  CNC: '+ IntToStr(DM.CentroCusto1.CodigoCNC) + ' (' + DM.CentroCusto1.RazaoSocial + ')';
end;

procedure TSIAC.AR_AlterarSenhaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxMudaSenha, fMxMudaSenha);
  with fMxMudaSenha do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.AR_SelecionarImpressoraExecute(Sender: TObject);
begin
  Application.CreateForm(TfmxSelImpressora, fmxSelImpressora);
  with fmxSelImpressora do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.AR_SairExecute(Sender: TObject);
begin
  mn_Sair;
end;

procedure TSIAC.CP_FornecedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadFor, fCadFor);
  with fCadFor do
  Begin
    tag := 0;
    DM.Usuario1.MDI(fCadFor);
    Show;
  end;
end;

procedure TSIAC.CP_TransportadorExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadTran, fCadTran);
  with fCadTran do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadTran);
    Show;
  end;
end;

procedure TSIAC.CP_ICMSCompraVendaExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadUF_ICMS, fCadUF_ICMS);
  with fCadUF_ICMS do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadUF_ICMS);
    Show;
  end;
end;

procedure TSIAC.CP_RelFornecedorExecute(Sender: TObject);
var
  SQL: string;
  stiReport: CoSiacReport_; //TSiacReport;
begin
  if RelatorioGrafico then
  begin
    SQL := 'SELECT ' +
           '  T1.*, ' +
           '  T2.PAR_DESCRICAO AS LOGRADOURO ' +
           'FROM ' +
           '  FORNECEDOR T1 ' +
           'INNER JOIN PARAMETRO T2 ON ' +
           '  T1.FOR_LOGRADOURO = T2.PAR_CODIGO ' +
           'WHERE T1.FOR_SITUACAO<>2 ' +
           'ORDER BY T1.FOR_RZ_SOCIAL';

    stiReport.Create.ReportFornecedores(false,
                                        false,
                                        SQL,
                                        EmpresaDesenvolvedora,
                                        'Relatório de fornecedores do sistema',
                                        DM.CentroCusto1.RazaoSocial,
                                        '',//DM.Configuracao1.LojaNome
                                        'Relatório de Fornecedores',
                                        DM.Usuario1.NomeUSU,
                                        '',//Filtros
                                        rptArquivoLogo);
  end
  else
  begin
    Application.CreateForm(Trpt_fornecedor, rpt_fornecedor);
    with rpt_fornecedor do
    Begin
      report.Preview;
    end;
  end;
end;

procedure TSIAC.CP_RelTransportadorExecute(Sender: TObject);
var
  SQL: string;
  stiReport: CoSiacReport_; //TSiacReport;
begin
  if RelatorioGrafico then
  begin
    SQL := 'SELECT ' +
           '  T1.*, ' +
           '  T2.PAR_DESCRICAO AS LOGRADOURO ' +
           'FROM ' +
           '  TRANSPORTADORA T1 ' +
           'INNER JOIN PARAMETRO T2 ON ' +
           '  T1.TRN_LOGRADOURO = T2.PAR_CODIGO ' +
           'ORDER BY T1.CNC_CODIGO, T1.TRN_CODIGO';


    stiReport.Create.ReportTransportadoras(false,
                                           false,
                                           SQL,
                                           EmpresaDesenvolvedora,
                                           'Relatório de transportadoras do sistema',
                                           DM.CentroCusto1.RazaoSocial,
                                           '',//DM.Configuracao1.LojaNome
                                           'Relatório de Transportadoras',
                                           DM.Usuario1.NomeUSU,
                                           '',//Filtros
                                           rptArquivoLogo);
  end
  else
  begin
    Application.CreateForm(Trpt_transportadoras, rpt_transportadoras);
    with rpt_transportadoras do
    Begin
      report.Preview;
    end;
  end;
end;

procedure TSIAC.CP_RelICMSCompraVendaExecute(Sender: TObject);
var
  SQL: string;
  stiReport: CoSiacReport_; //TSiacReport;
begin
  if RelatorioGrafico then
  begin
    SQL := 'SELECT T1.*, T2.USU_NOME FROM UF_ICMS T1 '+
           ' INNER JOIN USUARIO T2 ON T1.USU_CODIGO = T2.USU_CODIGO';

    stiReport.Create.ReportICMSCompraVenda(false,
                                           false,
                                           SQL,
                                           EmpresaDesenvolvedora,
                                           'Relatório de ICMS de Compra e Venda do sistema',
                                           DM.CentroCusto1.RazaoSocial,
                                           '',//DM.Configuracao1.LojaNome
                                           'Relatório de ICMS de Compra e Venda',
                                           DM.Usuario1.NomeUSU,
                                           '',//Filtros
                                           rptArquivoLogo);
  end
  else
  begin
    Application.CreateForm(Trpt_UF_ICMS, rpt_UF_ICMS);
    rpt_UF_ICMS.tag:=0;
    rpt_UF_ICMS.report.Preview;
    rpt_UF_ICMS.Close;
  end;
end;


procedure TSIAC.CP_RelContatosExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_contato, rpt_contato);
  with rpt_contato do
  Begin
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.CP_RelFornecedorProdutoExecute(Sender: TObject);
begin
  Application.CreateForm(TOp_RelatProd,Op_RelatProd);
  with Op_RelatProd do
  Begin
    Tag:=3;
    HelpContext:=2700;
    //Op_RelatProd.Caption := 'Fornecedor p/ Produto';
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(Op_RelatProd);
    Show;
  end;
end;

procedure TSIAC.CP_RelPrevisaoComprasExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSProdutoData, fMxSProdutoData);
  with fMxSProdutoData do
  Begin
    Tag:=0;
    HelpContext:=2800;
    //fMxSProdutoData.Caption := 'Previsão de Compas';
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSProdutoData);
    Show;
  end;
end;

procedure TSIAC.CP_RelQtdCompraXQtdVendasExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSProdutoData, fMxSProdutoData);
  with fMxSProdutoData do
  Begin
    Tag:=3;
    //fMxSProdutoData.Caption := 'Qtd Compras X Qtd Vendas';
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSProdutoData);
    Show;
  end;
end;

procedure TSIAC.CP_RelSugestaoCompraExecute(Sender: TObject);
begin
  Application.CreateForm(TOp_RelatProd,Op_RelatProd);
  with Op_RelatProd do
  Begin
    Tag:=2;
    HelpContext:=2900;
    //Op_RelatProd.Caption := 'Sugestão de Compra';
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(Op_RelatProd);
    Show;
  end;
end;

procedure TSIAC.CP_RelHistoricoCompraExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_DataCompra,rpt_DataCompra);
  with rpt_DataCompra do
  Begin
    Tag:=1;
    HelpContext:=3000;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_DataCompra);
    Show;
  end;
end;

procedure TSIAC.CP_RelProdutosIndisponibilizadosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPecasReposicao,fMxSelPecasReposicao);
  with fMxSelPecasReposicao do
  Begin
    Tag:=0;
    //fMxSelPecasReposicao.Caption := 'Produtos Indisponibilizados';
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelPecasReposicao);
    Show;
  end;
end;

procedure TSIAC.CP_CotacaoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxCotacao,fMxCotacao);
  with fMxCotacao do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxCotacao);
    Show;
  end;
end;

procedure TSIAC.CP_PedidoDeCompraExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxPedComp,fMxPedComp);
  with fMxPedComp do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.CP_FaturarPendentesExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelFaturarPendentesCompra, fMxSelFaturarPendentesCompra);
  with fMxSelFaturarPendentesCompra do
  Begin
    Tag:=0;
    DM.Usuario1.MDI(fMxSelFaturarPendentesCompra);
    Show;
  end;
end;

procedure TSIAC.CP_EnviarFornecedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadEnviarFornecedor,fCadEnviarFornecedor);
  with fCadEnviarFornecedor do
  Begin
    Tag:=0;
    DM.Usuario1.MDI(fCadEnviarFornecedor);
    Show;
  end;
end;

procedure TSIAC.CP_ReposicaoFornecedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadReposicaoFornecedor, fCadReposicaoFornecedor);
  with fCadReposicaoFornecedor do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.CP_CalculadoraDeFreteExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxCalculadoraFrete, fMxCalculadoraFrete);
  with fMxCalculadoraFrete do
  Begin
    Tag:=5;
    DM.Usuario1.MDI(fMxCalculadoraFrete);
    Show;
  end;
end;
                
procedure TSIAC.mn_RelServicosEfetuados(Sender: TObject; iTag: Integer);
begin
  //Servicos Efetuados
  Application.CreateForm(Trpt_Data, rpt_Data);
  with rpt_Data do
  Begin
    Tag:= iTag;//17;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_Data);
    Show;
  end;
end;

procedure TSIAC.mn_LiberarPedido(iTag: Integer);
begin
  Application.CreateForm(TfMxSelecionarData, fMxSelecionarData);
  with fMxSelecionarData do
  Begin
    Tag:=iTag;
    ckbTodos.Visible:=True;
    ShowModal;
  end;
end;

procedure TSIAC.SE_ServicoExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadServico, fCadServico);
  with fCadServico do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.SE_RelServicosExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_Produto, rpt_Produto);
  with rpt_Produto do
  Begin
    tag := 7;
    zrlfiltros.Caption := '(Somente Servicos)';
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM PRODUTO '+
      ' WHERE PRD_SERVICO=1 '+
      ' ORDER BY GRP_CODIGO,PRD_DESCRICAO ';
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.SE_RelPedidoServicoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSVendasCliente,fMxSVendasCliente);
  with fMxSVendasCliente do
  Begin
    Tag:=0;
    ckbSomentePDS.Checked := True;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSVendasCliente);
    Show;
  end;
end;

procedure TSIAC.SE_RelServicosEfetuadosExecute(Sender: TObject);
begin
  mn_RelServicosEfetuados(Sender,17);
end;

procedure TSIAC.SE_RelProdutosXServicosExecute(Sender: TObject);
begin
  mn_RelServicosEfetuados(Sender,18);
end;

procedure TSIAC.SE_PedidodeServicoExecute(Sender: TObject);
begin
  if DM.Configuracao1.Empresa IN TEmpresasOtica then
  Begin
    Application.CreateForm(TfMxServico, fMxServico);
    with fMxServico do
    Begin
      Tag:=0;
      ShowModal;
    end;
  end
  else
  Begin
    Application.CreateForm(TfMxServicoLBM, fMxServicoLBM);
    with fMxServicoLBM do
    Begin
      Tag:=0;
      ShowModal;
    end;
  end;
end;

procedure TSIAC.SE_AlterarSituacaoPedidoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSituacaoServico, fMxSituacaoServico);
  with fMxSituacaoServico do
  Begin
    tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.SE_LiberarPedidoServicoExecute(Sender: TObject);
begin
  mn_LiberarPedido(3);
end;

procedure TSIAC.SE_LocalizacaoServicosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSPedLocComp, fMxSPedLocComp);
  with fMxSPedLocComp do
  Begin
    Tag := 1;
    HelpContext:=6400;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSPedLocComp);
    Show;
  end;
end;

procedure TSIAC.mn_SubMenu;
begin
  (*Não apagar essa procedure, sempre deixar ela em branco*)
end;

procedure TSIAC.AC_RelatoriosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.AC_InternetExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.CP_CadastrosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.CP_RelatoriosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.SE_CadastrosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.SE_RelatoriosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.SE_PedidodeServicoMenuExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.CB_RelatoriosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.GE_CadastrosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.GE_RelatoriosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.GE_ExportacaoDeDadosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxExportarDados, fMxExportarDados);
  fMxExportarDados.Tag := 0;
  fMxExportarDados.ShowModal;
  fMxExportarDados.Free;
end;

procedure TSIAC.mn_RelTitulosEmAtraso(iTag: Integer; sCaption: string);
begin
  Application.CreateForm(Trpt_Data,rpt_Data);
  with rpt_Data do
  Begin
    Tag:=iTag;
    Caption := TiraCaracter(sCaption,'&');
    DM.Usuario1.MDI(rpt_Data);
    Show;
  end;
end;

procedure TSIAC.CB_RelCobadoresExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_Cobrador, rpt_Cobrador);
  with rpt_cobrador do
  Begin
    report.Preview;
  end;
end;

procedure TSIAC.CB_RelComissaoCobradoresExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_DataCobr, rpt_DataCobr);
  with rpt_DataCobr do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_DataCobr);
    Show;
  end;
end;

procedure TSIAC.CB_RelTitulosEmAtrasoExecute(Sender: TObject);
begin
  //Títulos Atrasados
  mn_RelTitulosEmAtraso(16,(Sender as TAction).Caption);
end;

procedure TSIAC.CB_RelClientesEmAtrasoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelInadiplencia, fMxSelInadiplencia);
  with fMxSelInadiplencia do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelInadiplencia);
    Show;
  end;
end;

procedure TSIAC.CB_RelClientesInadimplentesExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelClienteInad,fMxSelClienteInad);
  with fMxSelClienteInad do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelClienteInad);
    Show;
  end;
end;

procedure TSIAC.CB_ControleDeCobrancaExecute(Sender: TObject);
begin
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRCCNCSITVENTRC ON TITULO_A_RECEBER (CNC_CODIGO,TRC_SITUACAO,TRC_VENCIMENTO,TRC_CODIGO)');
  Except
  end;

  Application.CreateForm(TfMxCobCobrador, fMxCobCobrador);
  with fMxCobCobrador do
  Begin

    if DM.Configuracao1.TipoCobranca = 1 then
      fMxCobCobrador.Caption := 'Cobrança - Centralizada'
    else
      fMxCobCobrador.Caption := 'Cobrança - Descentralizada';

    Tag := 0;

    DM.Usuario1.MDI(fMxCobCobrador);
    ShowModal;
    Free;
  end;
end;

procedure TSIAC.AJ_AjudaExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_FINDER, 0);
end;

procedure TSIAC.AJ_SobreExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSobre, fMxSobre);
  with fMxSobre do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.AC_RelPendenciaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPendencia, fMxSelPendencia);
  with fMxSelPendencia do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelPendencia);
    Show;
  end;
end;

procedure TSIAC.AC_RelTestarImpressoraExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxTestarImpressora, fMxTestarImpressora);
  with fMxTestarImpressora do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxTestarImpressora);
    Show;
  end;
end;

procedure TSIAC.AC_PendenciaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxPendencia, fMxPendencia);
  with fMxPendencia do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    ShowModal;
  end;
end;

procedure TSIAC.AC_AgendaTarefaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxAgendaTarefas, fMxAgendaTarefas);
  fMxAgendaTarefas.Tag := 0;
  fMxAgendaTarefas.Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(fMxAgendaTarefas);
  fMxAgendaTarefas.Show;
end;

procedure TSIAC.AC_MensagensExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxCentralMensagem, fMxCentralMensagem);
  with fMxCentralMensagem do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxCentralMensagem);
    Show;
  end;
end;

procedure TSIAC.AC_ComunicacaoClienteFornecedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadComunicacao,fCadComunicacao);
  with fCadComunicacao do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    ShowModal;
  end;
end;

procedure TSIAC.AC_CalendarioExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxFeriados, fMxFeriados);
  with fMxFeriados do
  Begin
    tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxFeriados);
    Show;
  end;
end;

procedure TSIAC.AC_CalculadoraExecute(Sender: TObject);
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

procedure TSIAC.AC_BlocoNotasExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxEditorTexto, fMxEditorTexto);
  fMxEditorTexto.Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(fMxEditorTexto);
  fMxEditorTexto.Show;
end;

procedure TSIAC.AJ_AtualizarSistemaExecute(Sender: TObject);
var
  arquivo: string;
begin
  arquivo := ExtractFilePath(ParamStr(0)) + 'AtualizaSistema.exe';

  if Application.MessageBox('Deseja realmente fazer a atualização do sistema?'#13'Mas atenção, seu sistema será finalizado!',
                            'Atenção',
                            MB_ICONQUESTION+MB_YESNO) = id_Yes then
  begin
    winExec(PChar(arquivo),SW_NORMAL);
    Application.Terminate;
  end;
end;

procedure TSIAC.AC_AcertarRelogioExecute(Sender: TObject);
var
  vDataInternet: TDateTime;
begin
  vDataInternet := HoraInternet;
  if vDataInternet > 0 then
    if AcertarRelogio(vDataInternet) then
      ShowMessage('Relógio Acertado!');
end;

procedure TSIAC.GE_UsuariosExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadUsuario, fCadUsuario);
  with fCadUsuario do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadUsuario);
    Show;
  end;

  DM.Usuario1.Close;
  DM.Usuario1.Open;
end;

procedure TSIAC.GE_FuncionariosExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadFunc, fCadFunc);
  with fcadfunc do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fcadfunc);
    show;
  end;
end;

procedure TSIAC.GE_ParametrosExecute(Sender: TObject);
begin
  Application.CreateForm(TFCadParametro, FCadParametro);
  with fCadParametro do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadParametro);
    Show;
  end;
end;

procedure TSIAC.GE_ModuloDoSistemaExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadModulo,fCadModulo);
  with fCadModulo do
  Begin
    Tag:=0;
    DM.Usuario1.MDI(fCadModulo);
    Show;
  end;
end;

procedure TSIAC.GE_SubModuloDoSistemaExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadSubModulo,fCadSubModulo);
  with fCadSubModulo do
  Begin
    Tag:=0;
    DM.Usuario1.MDI(fCadSubModulo);
    Show;
  end;
end;

procedure TSIAC.GE_OperacaoDoSistemaExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadOperSist, fCadOperSist);
  with fCadOperSist do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadOperSist);
    Show;
  end;
end;

procedure TSIAC.GE_RelUsuariosExecute(Sender: TObject);
var
  SQL: string;
  stiReport: CoSiacReport_; //TSiacReport;
begin
  if RelatorioGrafico then
  begin
    SQL := 'SELECT '+
           '  T1.*, '+
           '  T2.CNC_RZ_SOCIAL, '+
           '  T2.CNC_NOME_FAN, '+
           '  T2.CNC_FONE '+
           'FROM '+
           '  USUARIO T1 '+
           'INNER JOIN CENTRO_DE_CUSTO T2 ON '+
           '  T1.CNC_CODIGO = T2.CNC_CODIGO '+
           'ORDER BY T1.CNC_CODIGO, T1.USU_NOME';

    stiReport.Create.ReportUsuarios(false,
                                    false,
                                    SQL,
                                    EmpresaDesenvolvedora,
                                    'Relatório de usuários do sistema',
                                    DM.CentroCusto1.RazaoSocial,
                                    '',//DM.Configuracao1.LojaNome
                                    'Relatório de Usuários',
                                    DM.Usuario1.NomeUSU,
                                    '',//Filtros
                                    rptArquivoLogo);
  end
  else
  begin
    Application.CreateForm(Trpt_usuario,rpt_usuario);
    with rpt_usuario do
    Begin
      Entidade.Open;
      report.Preview;
      Close;
    end;
  end;
end;

procedure TSIAC.GE_RelFuncionariosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelfuncionario,fMxSelfuncionario);
  with fMxSelfuncionario do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelfuncionario);
    Show;
  end;
end;

procedure TSIAC.GE_RelParametrosExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_parametro,rpt_parametro);
  with rpt_parametro do
  Begin
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.GE_RelOperacoesDoSistemaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelOperSist, fMxSelOperSist);
  with fMxSelOperSist do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelOperSist);
    Show;
  end;
end;

procedure TSIAC.GE_RelPermissoesDeUsuariosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPermissao, fMxSelPermissao);
  with fMxSelPermissao do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelPermissao);
    Show;
  end;
end;

procedure TSIAC.GE_RelLogDeOperacoesExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelLog, fMxSelLog);
  with fMxSelLog do
  Begin
    tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelLog);
    Show;
  end;
end;

procedure TSIAC.GE_PermissoesExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxRelPermis, fMxRelPermis);
  with fMxRelPermis do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxRelPermis);
    Show;
  end;
end;

procedure TSIAC.GE_ConfiguracoesExecute(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise exception.Create('Não é possível alterar configurações desse centro de custo!');

  if (not (DM.Configuracao1.Empresa IN TEmpresasConfiguracaoUnica)) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONFIGURACAO '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
      Open;
      if IsEmpty then
        Raise exception.Create('Registro de Configuração não determinado para este Centro de Custo!');
    end;
  end;

  Application.CreateForm(TfMxDescontos, fMxDescontos);
  with fMxDescontos do
  Begin
    tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.GE_RegistroDeBalancoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxBalanco, fMxBalanco);
  with fMxBalanco do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.GE_ListaDeUsuariosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxLocalizaUsuario, fMxLocalizaUsuario);
  with fMxLocalizaUsuario do
  Begin
    tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxLocalizaUsuario);
    Show;
  end;
end;

procedure TSIAC.GE_ImportacaoDeDadosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxImportarDados, fMxImportarDados);
  with fMxImportarDados do
  Begin
    tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_CadVeiculos;
begin
  Application.CreateForm(TfCadVeiculo, fCadVeiculo);
  with fCadVeiculo do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_CadProfissao;
begin
  Application.CreateForm(TfCadProfissao, fCadProfissao);
  with fCadProfissao do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_CadTabelaDesconto;
begin
  Application.CreateForm(TfMxTabelaDescontos, fMxTabelaDescontos);
  with fMxTabelaDescontos do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_CadQuantidadeNormalVenda;
begin
  Application.CreateForm(TfMxTabelaQtdNormal, fMxTabelaQtdNormal);
  with fMxTabelaQtdNormal do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_CadAtendimentoVendedor;
begin
  Application.CreateForm(TfCadAtendimentosPorVendedor, fCadAtendimentosPorVendedor);
  fCadAtendimentosPorVendedor.tag := 0;
  fCadAtendimentosPorVendedor.ShowModal;
end;

procedure TSIAC.mn_CadCatracaNotaFiscal;
begin
  Application.CreateForm(TfMxCatraca, fMxCatraca);
  fMxCatraca.tag := 0;
  fMxCatraca.ShowModal;
end;

procedure TSIAC.mn_RelComissaoFaturamentoVendedor(Sender: TObject);
begin
  //VendasDesconto
  Application.CreateForm(Trpt_Data,rpt_Data);
  with rpt_Data do
  Begin
    Tag:=23;
    ckbSintetico.Visible := True;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_Data);
    Show;
  end;
end;

procedure TSIAC.mn_RelEspeciaisSaldoVendas(Sender: TObject);
begin
  //Saldo Vendas
  Application.CreateForm(Trpt_Data,rpt_Data);
  with rpt_Data do
  Begin
    Tag:=24;
    ckbSintetico.Visible := False;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_Data);
    Show;
  end;
end;

procedure TSIAC.mn_PacoteCredito;
begin
  Application.CreateForm(TfMxPacoteCredito, fMxPacoteCredito);
  with fMxPacoteCredito do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_VendaFaturarPendentes;
begin
  Application.CreateForm(TfMxSelFaturarPendentes, fMxSelFaturarPendentes);
  with fMxSelFaturarPendentes do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_VendaFaturarPendentesConvenio;
begin
  Application.CreateForm(TfMxSelFaturarPendentes, fMxSelFaturarPendentes);
  with fMxSelFaturarPendentes do
  Begin
    Tag:=1;
    ShowModal;
  end;
end;

procedure TSIAC.mn_ReabrirPacoteVenda;
begin
  Application.CreateForm(TfMxReabrirPacote,fMxReabrirPacote);
  with fMxReabrirPacote do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_LiberarPedidoVenda;
begin
  Application.CreateForm(TfMxSelecionarData, fMxSelecionarData);
  with fMxSelecionarData do
  Begin
    Tag:=2;
    HelpContext:=5600;
    ckbTodos.Visible:=True;
    ShowModal;
  end;
end;

procedure TSIAC.mn_LiberarPacote;
begin
  Application.CreateForm(TfMxSelecionarData, fMxSelecionarData);
  with fMxSelecionarData do
  Begin
    Tag:=4;
    ckbTodos.Visible:=True;
    ShowModal;
  end;
end;

procedure TSIAC.mn_RegistrProcura;
begin
  Application.CreateForm(TFCadRegProc, FCadRegProc);
  with fcadRegProc do
  Begin
    Tag := 0;
    showmodal;
  end;
end;

procedure TSIAC.mn_ReservaPedidoExterno;
begin
  Application.CreateForm(TfMxReserva, fMxReserva);
  with fMxReserva do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.mn_ControleVeiculos;
begin
  Application.CreateForm(TfMxControleVeiculo, fMxControleVeiculo);
  fMxControleVeiculo.tag := 0;
  fMxControleVeiculo.ShowModal;
end;

procedure TSIAC.mn_ListaPresente;
begin
  Application.CreateForm(TfMxListadePresente, fMxListadePresente);
  with fMxListadePresente do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.mn_EmissaoConhecimento;
begin
  Application.CreateForm(TfCadConhecimento, fCadConhecimento);
  with fCadConhecimento do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.VE_CadastrosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.VE_ClientesExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadCli, fCadCli);
  with fCadCli do
  Begin
    tag := 0;
    HelpContext:=3700;
    //Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fCadCli);
    Show;
  end;
end;

procedure TSIAC.VE_AvalistaExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadAvalista, fCadAvalista);
  with fCadAvalista do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadAvalista);
    Show;
  end;
end;

procedure TSIAC.VE_VeiculoExecute(Sender: TObject);
begin
  mn_CadVeiculos;
end;

procedure TSIAC.VE_ProfissaoExecute(Sender: TObject);
begin
  mn_CadProfissao;
end;

procedure TSIAC.VE_CreditoClienteExecute(Sender: TObject);
begin
  Application.CreateForm(TfMXCredCli, fMXCredCli);
  with fMXCredCli do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMXCredCli);
    Show;
  end;
end;

procedure TSIAC.VE_TabelaDescontoExecute(Sender: TObject);
begin
  mn_CadTabelaDesconto;
end;

procedure TSIAC.VE_ControleCotaComissaoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxCota, fMxCota);
  with fMxCota do
  Begin
    tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.VE_QuantidadeNormalVendaExecute(Sender: TObject);
begin
  mn_CadQuantidadeNormalVenda;
end;

procedure TSIAC.VE_AtendimentoVendedorExecute(Sender: TObject);
begin
  mn_CadAtendimentoVendedor;
end;

procedure TSIAC.VE_CatracaNotaFiscalExecute(Sender: TObject);
begin
  mn_CadCatracaNotaFiscal;
end;

procedure TSIAC.VE_RelatoriosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.VE_RelClientesExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelCliente, fMxSelCliente);
  with fMxSelCliente do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelCliente);
    Show;
  end;
end;

procedure TSIAC.VE_RelAvalistasExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_avalista, rpt_avalista);
  with rpt_avalista do
  Begin
    report.Preview;
  end;
end;

procedure TSIAC.VE_RelVendedoresExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_vendedor, rpt_vendedor);
  with rpt_vendedor do
  Begin
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.VE_RelVeiculosMenuExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.VE_RelVeiculosExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_Veiculo, rpt_Veiculo);
  with rpt_Veiculo do
  Begin
    Tag := 0;
    Entidade.SQL.Text := 'SELECT * '+
      ' FROM VEICULO '+
      ' ORDER BY VEI_DESCRICAO, VEI_PLACA ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise exception.Create('Consulta Vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.VE_RelControleVeiculosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelControleVeiculo, fMxSelControleVeiculo);
  with fMxSelControleVeiculo do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelControleVeiculo);
    Show;
  end;
end;

procedure TSIAC.VE_RelProfissaoExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_Profissao, rpt_Profissao);
  with rpt_Profissao do
  Begin
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.VE_RelQuantidadeNormalVendaExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_QtdNormalVenda, rpt_QtdNormalVenda);
  with rpt_QtdNormalVenda do
  Begin
    Tag := 0;
    Entidade.Open;

    if not Entidade.IsEmpty then
      report.Preview
    else
      Showmessage('Consulta Vazia!');

    Close;
  end;
end;

procedure TSIAC.VE_RelComissaoFaturamentoExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.VE_RelHistoricoVendedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPedidos, fMxSelPedidos);
  fMxSelPedidos.tag := 0;
  fMxSelPedidos.Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(fMxSelPedidos);
  fMxSelPedidos.Show;
end;

procedure TSIAC.VE_RelBonusVendedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelBonusVendedor, fMxSelBonusVendedor);
  with fMxSelBonusVendedor do
  Begin
    tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelBonusVendedor);
    Show;
  end;
end;

procedure TSIAC.VE_RelComissaoVendasExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_DataVend,rpt_DataVend);
  with rpt_DataVend do
  Begin
    Tag := 2;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_DataVend);
    Show;
  end;
end;

procedure TSIAC.VE_RelComissaoTitulosRecebidosExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_DataVend,rpt_DataVend);
  with rpt_DataVend do
  Begin
    Tag := 1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_DataVend);
    Show;
  end;
end;

procedure TSIAC.VE_RelComissaoVendasCompletaExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_DataVend,rpt_DataVend);
  with rpt_DataVend do
  Begin
    Tag := 3;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_DataVend);
    Show;
  end;
end;

procedure TSIAC.VE_RelFaturamentoVendedorExecute(Sender: TObject);
begin
  mn_RelComissaoFaturamentoVendedor(Sender);
end;

procedure TSIAC.VE_RelFaturamentoFornecedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelFaturamentoFornecedor, fMxSelFaturamentoFornecedor);
  with fMxSelFaturamentoFornecedor do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelFaturamentoFornecedor);
    Show;
  end;
end;

procedure TSIAC.VE_RelComparativoFornecedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelComparativoForn, fMxSelComparativoForn);
  with fMxSelComparativoForn do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelComparativoForn);
    Show;
  end;
end;

procedure TSIAC.VE_RelReservaExternaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelReservaExterna, fMxSelReservaExterna);
  with fMxSelReservaExterna do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelReservaExterna);
    Show;
  end;
end;

procedure TSIAC.VE_RelDevolucaoParcialExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPedido, fMxSelPedido);
  with fMxSelPedido do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelPedido);
    Show;
  end;
end;

procedure TSIAC.VE_RelPacoteVendaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPacote, fMxSelPacote);
  with fMxSelPacote do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelPacote);
    Show;
  end;
end;

procedure TSIAC.VE_RelPacoteCreditoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPacoteCredito, fMxSelPacoteCredito);
  with fMxSelPacoteCredito do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelPacoteCredito);
    Show;
  end;
end;

procedure TSIAC.VE_RelRelatorioEspecialVendaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSVendasCliente,fMxSVendasCliente);
  with fMxSVendasCliente do
  Begin
    Tag:=0;
    //Caption := TiraCaracter((Sender as TAction).Caption,'&');
    Caption := 'Relatório Especial de Vendas';
    DM.Usuario1.MDI(fMxSVendasCliente);
    Show;
  end;
end;

procedure TSIAC.VE_RelNotasFiscaisExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelNotaFiscal,fMxSelNotaFiscal);
  fMxSelNotaFiscal.Tag:=0;
  fMxSelNotaFiscal.Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(fMxSelNotaFiscal);
  fMxSelNotaFiscal.Show;
end;

procedure TSIAC.VE_RelMapaTributosFederaisExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelMapaTributos, fMxSelMapaTributos);
  with fMxSelMapaTributos do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelMapaTributos);
    Show;
  end;
end;

procedure TSIAC.VE_RelEspeciaisMenuExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.VE_relSaldoVendasExecute(Sender: TObject);
begin
  mn_RelEspeciaisSaldoVendas(Sender);
end;

procedure TSIAC.VE_RelVendasExtratificadasExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSExtratoExtratificado, fMxSExtratoExtratificado);
  with fMxSExtratoExtratificado do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSExtratoExtratificado);
    Show;
  end;
end;

procedure TSIAC.VE_relCurvaABCProdutosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelProdutoCurva, fMxSelProdutoCurva);
  with fMxSelProdutoCurva do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelProdutoCurva);
    Show;
  end;

  //ATENÇÃO
  //Separar Produto de Servico (somente PRD ou Somente SER)
  //ABC por SubGrupo
end;

procedure TSIAC.VE_RelMovimentacaoCreditoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelMovimentoCredito, fMxSelMovimentoCredito);
  with fMxSelMovimentoCredito do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelMovimentoCredito);
    Show;
  end;
end;

procedure TSIAC.VE_RelPreferenciaClienteExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSVendasCliente,fMxSVendasCliente);
  with fMxSVendasCliente do
  Begin
    Tag:=2;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSVendasCliente);
    Show;
  end;
end;

procedure TSIAC.VE_RelComparativoAnualExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSProdutoData, fMxSProdutoData);
  with fMxSProdutoData do
  Begin
    Tag:=4;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSProdutoData);
    Show;
  end;
end;

procedure TSIAC.VE_RelTabelaPromocionalExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSProdutoData, fMxSProdutoData);
  with fMxSProdutoData do
  Begin
    Tag:=5;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSProdutoData);
    Show;
  end;
end;

procedure TSIAC.VE_RelRegistroProcuraExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelDataCentro, fMxSelDataCentro);
  with fMxSelDataCentro do
  Begin
    tag:=0;
    HelpContext:=3100;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelDataCentro);
    Show;
  end;
end;

procedure TSIAC.VE_RelAtendimentoVendedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelAtendimentoPorVendedor, fMxSelAtendimentoPorVendedor);
  fMxSelAtendimentoPorVendedor.tag := 0;
  fMxSelAtendimentoPorVendedor.Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(fMxSelAtendimentoPorVendedor);
  fMxSelAtendimentoPorVendedor.Show;
end;

procedure TSIAC.VE_GraficosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.VE_GraVendasVendedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPedidos, fMxSelPedidos);
  fMxSelPedidos.tag := 1;
  fMxSelPedidos.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSelPedidos);
  fMxSelPedidos.Show;
end;

procedure TSIAC.VE_Gra3TitulosPagosVendedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTitulos,fMxSelTitulos);
  fMxSelTitulos.Tag:=3;
  fMxSelTitulos.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSelTitulos);
  fMxSelTitulos.Show;
end;

procedure TSIAC.VE_GraProdutosMaisVendidosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSVendasCliente,fMxSVendasCliente);
  with fMxSVendasCliente do
  Begin
    Tag:=1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
    DM.Usuario1.MDI(fMxSVendasCliente);
    Show;
  end;
end;

procedure TSIAC.VE_GraFaturamentoMensalExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPedidos, fMxSelPedidos);
  fMxSelPedidos.tag := 2;
  fMxSelPedidos.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSelPedidos);
  fMxSelPedidos.Show;
end;

procedure TSIAC.VE_GraMediaFaturamentoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPedidos, fMxSelPedidos);
  fMxSelPedidos.tag := 3;
  fMxSelPedidos.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSelPedidos);
  fMxSelPedidos.Show;
end;

procedure TSIAC.VE_GraMetaQuinzenalVendedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPedidos, fMxSelPedidos);
  fMxSelPedidos.tag := 4;
  fMxSelPedidos.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSelPedidos);
  fMxSelPedidos.Show;
end;

procedure TSIAC.VE_GraAtendimentoVendedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelAtendimentoPorVendedor, fMxSelAtendimentoPorVendedor);
  fMxSelAtendimentoPorVendedor.tag := 1;
  fMxSelAtendimentoPorVendedor.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSelAtendimentoPorVendedor);
  fMxSelAtendimentoPorVendedor.Show;
end;

procedure TSIAC.VE_RelPedidoVendaMenuExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.VE_DevolucaoTotalExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxDevPed, fMxDevPed);
  with fMxDevPed do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxDevPed);
    Show;
  end;
end;

procedure TSIAC.VE_DevolucaoParcialExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxTrocaProduto, fMxTrocaProduto);
  with fMxTrocaProduto do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxTrocaProduto);
    Show;
  end;
end;

procedure TSIAC.VE_CorrigirParcelasExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxAlterarParcelas, fMxAlterarParcelas);
  with fMxAlterarParcelas do
  Begin
    Tag:=0;
    DM.Usuario1.MDI(fMxAlterarParcelas);
    Show;
  end;
end;

procedure TSIAC.VE_PedidoVendaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxPedidoMotCal, fMxPedidoMotCal);
  with fMxPedidoMotCal do
  Begin
    Tag := 0;
    Showmodal;
  end;

{Não funciona ecf
  if not DM.Configuracao1.DiretoImpFiscal then
  begin
    Application.CreateForm(TfMxPedidoMotCal, fMxPedidoMotCal);
    with fMxPedidoMotCal do
    Begin
      Tag := 0;
      Showmodal;
    end;
  end
  else
  begin
    Application.CreateForm(TfMxPedidoMotCal_2, fMxPedidoMotCal_2);
    with fMxPedidoMotCal_2 do
    Begin
      Tag := 0;
      Showmodal;
    end;
  end;
}
  {if DM.Configuracao1.Empresa IN TEmpresasOtica then
  begin
  end
  else
  begin
    Application.CreateForm(TfMxPedidoRapido, fMxPedidoRapido);
    with fMxPedidoRapido do
    Begin
      Tag := 0;
      Showmodal;
    end;
  end;}
end;

procedure TSIAC.VE_PacoteVendaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxPacoteVenda, fMxPacoteVenda);
  with fMxPacoteVenda do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.VE_PacoteCreditoExecute(Sender: TObject);
begin
  mn_PacoteCredito;
end;

procedure TSIAC.VE_CotacaoVendaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxCotacao,fMxCotacao);
  with fMxCotacao do
  Begin
    Tag := 1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxCotacao);
    Show;
  end;
end;

procedure TSIAC.VE_FaturarPendenteExecute(Sender: TObject);
begin
  mn_VendaFaturarPendentes;
end;

procedure TSIAC.VE_FaturarPendentesConveniosExecute(Sender: TObject);
begin
  mn_VendaFaturarPendentesConvenio;
end;

procedure TSIAC.VE_ReabrirPedidoFinalizadoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxReabrirPedido,fMxReabrirPedido);
  with fMxReabrirPedido do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.VE_ReabrirPacoteVendaExecute(Sender: TObject);
begin
  mn_ReabrirPacoteVenda;
end;

procedure TSIAC.VE_PromissoriaCarneCupomExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSPedLocImpPromis, fMxSPedLocImpPromis);
  with fMxSPedLocImpPromis do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.VE_LiberarPedidoExecute(Sender: TObject);
begin
  mn_LiberarPedidoVenda;
end;

procedure TSIAC.VE_LiberarPacoteExecute(Sender: TObject);
begin
  mn_LiberarPacote;
end;

procedure TSIAC.VE_RegistroProcuraExecute(Sender: TObject);
begin
  mn_RegistrProcura;
end;

procedure TSIAC.VE_ReservaPedidoExternoExecute(Sender: TObject);
begin
  mn_ReservaPedidoExterno;
end;

procedure TSIAC.VE_ControleVeiculosExecute(Sender: TObject);
begin
  mn_ControleVeiculos;
end;

procedure TSIAC.VE_TabelaPromocionalExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxTabPrecoSubGrupo,fMxTabPrecoSubGrupo);
  with fMxTabPrecoSubGrupo do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxTabPrecoSubGrupo);
    Show;
  end;
end;

procedure TSIAC.VE_TabelaPromocionalSubGrupoExecute(Sender: TObject);
begin
  (*Não utiliza mais, no lugar dela está a por subgrupo*)
{  Application.CreateForm(TfMxTabPreco,fMxTabPreco);
  with fMxTabPreco do
  Begin
    Tag := 0;
    ShowModal;
  end;
}  
end;

procedure TSIAC.VE_ListaPresentesExecute(Sender: TObject);
begin
  mn_ListaPresente;
end;

procedure TSIAC.VE_PesquisaProdutosExecute(Sender: TObject);
begin
  if DM.Configuracao1.Empresa in TEmpresasLocProdutoEsp then
  Begin
    Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
    with fMxSPedProdMotcal do
    Begin
      Tag:=36;
      DM.Usuario1.MDI(fMxSPedProdMotcal);
      Show;
    end;
  end
  else
  Begin
    Application.CreateForm(TfMxSPedProd, fMxSPedProd);
    with fMxSPedProd do
    Begin
      Tag:=36;
      DM.Usuario1.MDI(fMxSPedProd);
      Show;
    end;
  end;
end;

procedure TSIAC.VE_PesquisaEstoqueExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxEstoqueGeral, fMxEstoqueGeral);
  with fMxEstoqueGeral do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxEstoqueGeral);
    Show;
  end;
end;

procedure TSIAC.VE_LocalizacaoPedidoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSPedLocComp, fMxSPedLocComp);
  with fMxSPedLocComp do
  Begin
    Tag := 0;
    HelpContext:=6400;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSPedLocComp);
    Show;
  end;
end;

procedure TSIAC.VE_LocalizacaoPacoteExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxLocalizarPacoteVenda,fMxLocalizarPacoteVenda);
  with fMxLocalizarPacoteVenda do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxLocalizarPacoteVenda);
    Show;
  end;
end;

procedure TSIAC.VE_LocalizaDetalhePedidoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelDetalhePedido, fMxSelDetalhePedido);
  with fMxSelDetalhePedido do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelDetalhePedido);
    Show;
  end;
end;

procedure TSIAC.VE_EmissaoConhecimentoExecute(Sender: TObject);
begin
  mn_EmissaoConhecimento;
end;

procedure TSIAC.VE_EmissaoNotasFiscaisExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxNotaFiscal, fMxNotaFiscal);
  with fMxNotaFiscal do
  Begin
    HelpContext:=6500;
    tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    //DM.Usuario1.MDI(fMxNotaFiscal); Não utilizar MDI
    showmodal;
    free;
  end;
end;

procedure TSIAC.VE_EmissaoNotasFiscaisExternaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxNotaFiscal, fMxNotaFiscal);
  with fMxNotaFiscal do
  Begin
    tag := 2;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    //DM.Usuario1.MDI(fMxNotaFiscal); Não utilizar MDI
    showmodal;
    free;
  end;
end;

procedure TSIAC.VE_LocalizacaoNotasFiscaisExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxLocalizaNotaCupom, fMxLocalizaNotaCupom);
  fMxLocalizaNotaCupom.tag:=0;
  fMxLocalizaNotaCupom.Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(fMxLocalizaNotaCupom);
  fMxLocalizaNotaCupom.Show;
end;

procedure TSIAC.CX_CadastrosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.CX_CaixasExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadCaixa, fCadCaixa);
  with fCadCaixa do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadCaixa);
    Show;
  end;
end;

procedure TSIAC.CX_ContasCaixaExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadCntCaixa, fCadCntCaixa);
  with fCadCntCaixa do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadCntCaixa);
    Show;
  end;
end;

procedure TSIAC.CX_RelatoriosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.CX_RelCaixaExecute(Sender: TObject);
var
  SQL: string;
  stiReport: CoSiacReport_; //TSiacReport;
begin
  if RelatorioGrafico then
  begin
    SQL := 'SELECT T1.*, '+
           '  T2.CNC_RZ_SOCIAL, '+
           '  T2.CNC_NOME_FAN, '+
           '  T2.CNC_FONE, '+
           '  T3.FUN_NOME '+
           'FROM CAIXA T1 '+
           'INNER JOIN CENTRO_DE_CUSTO T2 ON '+
           'T1.CNC_CODIGO = T2.CNC_CODIGO '+
           'LEFT JOIN FUNCIONARIO T3 ON '+
           'T1.CNC_CODIGO = T3.CNC_CODIGO AND '+
           'T1.FUN_CODIGO = T3.FUN_CODIGO '+
           'ORDER BY T1.CAX_DESCRICAO';

    stiReport.Create.ReportCaixas(false,
                                  false,
                                  SQL,
                                  EmpresaDesenvolvedora,
                                  'Relatório de Caixa do sistema',
                                  DM.CentroCusto1.RazaoSocial,
                                  '',//DM.Configuracao1.LojaNome
                                  'Relatório de Caixa',
                                  DM.Usuario1.NomeUSU,
                                  '',//Filtros
                                  rptArquivoLogo);
  end
  else
  begin
    Application.CreateForm(Trpt_caixa, rpt_caixa);
    rpt_caixa.report.Preview;
    rpt_caixa.Close;
  end;
end;

procedure TSIAC.CX_RelContasCaixaExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja visualizar o Relatório de Limite de Gastos?',
    'Informaçães', MB_YESNO + MB_ICONINFORMATION) = IDYes then
  begin
    Application.CreateForm(Trpt_Limite_Gasto, rpt_Limite_Gasto);
    with rpt_Limite_Gasto do
    begin
      with Limite_Gasto1 do
      begin
        Close;
        Open;
      end;

      report.Preview;
      Close;
    end;
  end
  else
  begin
    Application.CreateForm(Trpt_cnt_caixa, rpt_cnt_caixa);
    with rpt_cnt_caixa do
    begin
      report.Preview;
      Close;
    end;
  end;
end;

procedure TSIAC.CX_RelMDFExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelMDF,fMxSelMDF);
  with fMxSelMDF do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelMDF);
    Show;
  end;
end;

procedure TSIAC.CX_RelFluxoCaixaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxFluxoDeCaixa, fMxFluxoDeCaixa);
  with fMxFluxoDeCaixa do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxFluxoDeCaixa);
    Show;
  end;
end;

procedure TSIAC.CX_RelFluxoCaixaBoletimDiarioExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_Data2,rpt_Data2);
  with rpt_Data2 do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_Data2);
    Show;
  end;
end;

procedure TSIAC.CX_RelRelacaoDespesasExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelConta, fMxSelConta);
  with fMxSelConta do
  Begin
    tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelConta);
    Conta_de_Caixa1.Close;
    Conta_de_Caixa1.SQL.Text:='SELECT * '+
      ' FROM CONTA_DE_CAIXA '+
      ' WHERE CCX_DC="D" '+
      ' ORDER BY CCX_DESCRICAO';
    Show;
  end;
end;

procedure TSIAC.CX_RelRelacaoRecebimentoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelConta, fMxSelConta);
  with fMxSelConta do
  Begin
    tag:=1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelConta);
    Conta_de_Caixa1.Close;
    Conta_de_Caixa1.SQL.Text:='SELECT * '+
      ' FROM CONTA_DE_CAIXA '+
      ' WHERE CCX_DC="C" '+
      ' ORDER BY CCX_DESCRICAO';
    Show;
  end;
end;

procedure TSIAC.CX_GraficosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.CX_GraDespesasExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelConta, fMxSelConta);
  fMxSelConta.tag:=2;
  fMxSelConta.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSelConta);
  fMxSelConta.Conta_de_Caixa1.Close;
  fMxSelConta.Conta_de_Caixa1.SQL.Text:='SELECT * FROM CONTA_DE_CAIXA '+
    'WHERE CCX_DC="D" ORDER BY CCX_DESCRICAO';
  fMxSelConta.Show;
end;

procedure TSIAC.CX_GraRecebimentosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelConta, fMxSelConta);
  fMxSelConta.tag:=3;
  fMxSelConta.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSelConta);
  fMxSelConta.Conta_de_Caixa1.Close;
  fMxSelConta.Conta_de_Caixa1.SQL.Text:='SELECT * FROM CONTA_DE_CAIXA '+
    'WHERE CCX_DC="C" ORDER BY CCX_DESCRICAO';
  fMxSelConta.Show;
end;

procedure TSIAC.CX_ImpressoraFiscalExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.CX_RecebimentoClienteExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxRecPed, fMxRecPed);
  with fMxRecPed do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxRecPed);
    show;
  end;
end;

procedure TSIAC.CX_PagamentoTitulosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxPagar, fMxPagar);
  with fMxPagar do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Caixa)';
    DM.Usuario1.MDI(fMxPagar);
    Show;
  end;
end;

procedure TSIAC.CX_MovimentoCaixaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxMovCx, fMxMovCx);
  with fMxMovCx do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxMovCx);
    Show;
  end;
end;

procedure TSIAC.CX_RecebimentoAvulsoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxRecebAvulsoCPD1, fMxRecebAvulsoCPD1);
  with fMxRecebAvulsoCPD1 do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxRecebAvulsoCPD1);
    Show;
  end;
end;

procedure TSIAC.CX_PagamentoAvulsoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxPagarAvulsoCPD1, fMxPagarAvulsoCPD1);
  with fMxPagarAvulsoCPD1 do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxPagarAvulsoCPD1);
    Show;
  end;
end;

procedure TSIAC.CX_ExtornoMovimentoAvulsoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxExtornoAvulso, fMxExtornoAvulso);
  with fMxExtornoAvulso do
  Begin
    Tag:=0;
    DM.Usuario1.MDI(fMxExtornoAvulso);
    Show;
  end;
end;

procedure TSIAC.CX_ControleChequeExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxCheque, fMxCheque);
  with fMxCheque do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxCheque);
    Show;
  end;
end;

procedure TSIAC.CX_AberturaCaixaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxBoletimAbreCaixa, fMxBoletimAbreCaixa);
  with fMxBoletimAbreCaixa do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxBoletimAbreCaixa);
    Show;
  end;
end;

procedure TSIAC.CX_FechamentoCaixaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxBoletimFechaCaixa, fMxBoletimFechaCaixa);
  with fMxBoletimFechaCaixa do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxBoletimFechaCaixa);
    Show;
  end;
end;

procedure TSIAC.CX_VerificacaoCaixaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxVerificaCaixa,fMxVerificaCaixa);
  with fMxVerificaCaixa do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxVerificaCaixa);
    Show;
  end;
end;

procedure TSIAC.mn_CF_ReducaoZ;
//var
  //Linhas, iNumero :integer;
begin
{  Linhas := ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    case ImpFiscalB1.Retorno_Impressora of
      -1: Exit;
       0: If MessageDlg('O Papel está acabando!'+#13+#13+'Linhas Impressas em Baixa: '+PreencheZero(5,Linhas)+#13+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
    end;
  end;
  ImpFiscalB1.ImprimeReducaoZ;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    iNumero := ImpFiscalB1.RetornoNumeroCupom;
    DM.Usuario1.GeraLog(7040,DM.Configuracao1.CodigoCNC,iNumero);
  end;}
end;

procedure TSIAC.mn_CF_LeituraX;
//var
  //Linhas, iNumero:integer;
begin
{  Linhas := ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    case ImpFiscalB1.Retorno_Impressora of
      -1: Exit;
       0: If MessageDlg('O Papel está acabando!'+#13+#13+'Linhas Impressas em Baixa: '+PreencheZero(5,Linhas)+#13+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
    end;
  end
  else
    Exit;
  ImpFiscalB1.ImprimeLeituraX;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    iNumero := ImpFiscalB1.RetornoNumeroCupom;
    DM.Usuario1.GeraLog(7050,DM.Configuracao1.CodigoCNC,iNumero);
  end;
  }
end;

procedure TSIAC.mn_CF_CancelarUltimoCupom;
//var
  //iNumero: integer;
begin
{  iNumero := ImpFiscalB1.RetornoNumeroCupom;
  ImpFiscalB1.CancelaCupom;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    DM.Usuario1.GeraLog(7060,DM.Configuracao1.CodigoCNC,iNumero);
    ShowMessage('Pronto !!!'+#13+'Agora será necessário cancelar o Cupom pelo sistema!');
  end;
  }
end;

procedure TSIAC.mn_CF_Rel60Mestre;
begin
{  Application.CreateForm(TfMxMensagemTempo, fMxMensagemTempo);
  fMxMensagemTempo.mensagem:='Aguarde...';
  fMxMensagemTempo.Show;
  fMxMensagemTempo.Refresh;
  ImpFiscalB1.ArquivoRelatorio60Mestre;
  Application.CreateForm(TfMxEditorTexto, fMxEditorTexto);
  with fMxEditorTexto do
  Begin
    try
      Editor.Lines.LoadFromFile('C:\retorno.txt');
    except
    end;
    fMxMensagemTempo.Close;
    ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_Rel60Analitico;
begin
{  Application.CreateForm(TfMxMensagemTempo, fMxMensagemTempo);
  fMxMensagemTempo.mensagem:='Aguarde...';
  fMxMensagemTempo.Show;
  fMxMensagemTempo.Refresh;
  ImpFiscalB1.ArquivoRelatorio60Analitico;
  Application.CreateForm(TfMxEditorTexto, fMxEditorTexto);
  with fMxEditorTexto do
  Begin
    try
      Editor.Lines.LoadFromFile('C:\retorno.txt');
    except
    end;
    fMxMensagemTempo.Close;
    ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_MapaResumo;
begin
{  Application.CreateForm(TfMxMensagemTempo, fMxMensagemTempo);
  fMxMensagemTempo.mensagem:='Aguarde...';
  fMxMensagemTempo.Show;
  fMxMensagemTempo.Refresh;
  ImpFiscalB1.ArquivoMapaResumo;
  Application.CreateForm(TfMxEditorTexto, fMxEditorTexto);
  with fMxEditorTexto do
  Begin
    try
      Editor.Lines.LoadFromFile('C:\retorno.txt');
    except
    end;
    fMxMensagemTempo.Close;
    ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_ExibirAliquota;
var
  cAliquotas, Palavra, AliquotasOrdem:string;
  i         :integer;
begin
{  Palavra        := '';
  AliquotasOrdem := '';
  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    cAliquotas:=Trim(ImpFiscalB1.RetornoAliquotas);
    if ImpFiscalB1.IRetorno <> 1 then
      Exit;
    if cAliquotas = '' then
      AliquotasOrdem := 'Nenhuma Alíquota Cadastrada!'
    else
    Begin
      for i:=1 to Length(cAliquotas) do
        if (cAliquotas[i] = ',') or (i = Length(cAliquotas)) then
        Begin
          Palavra := format('%.2f',[StrToFloat(Palavra)/100])+'% ; ';
          AliquotasOrdem := AliquotasOrdem+Palavra;
          Palavra := '';
        end
        else
          Palavra := Palavra + cAliquotas[i];
    end;
    ShowMessage('Alíquotas Cadastradas: '+AliquotasOrdem);
  end;
  }
end;

procedure TSIAC.mn_CF_ExibirLeituraX;
begin
{  Application.CreateForm(TfMxMensagemTempo, fMxMensagemTempo);
  fMxMensagemTempo.mensagem:='Aguarde...';
  fMxMensagemTempo.Show;
  fMxMensagemTempo.Refresh;
  ImpFiscalB1.ArquivoLeituraX;
  Application.CreateForm(TfMxEditorTexto, fMxEditorTexto);
  with fMxEditorTexto do
  Begin
    try
      Editor.Lines.LoadFromFile('C:\retorno.txt');
    except
    end;
    fMxMensagemTempo.Close;
    ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_ExibirUltimaReducao;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    Application.CreateForm(TfMxReducaoUltima, fMxReducaoUltima);
    fMxReducaoUltima.ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_ExibirNumeroSerie;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
    ShowMessage('Número de Série: '+Trim(ImpFiscalB1.RetornoNumeroSerie));}
end;

procedure TSIAC.mn_CF_ExibirNumeroValorCancelamento;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
    ShowMessage('Número de Cupons Cancelados: '+IntToStr(ImpFiscalB1.RetornoCuponsCanceladosNumero)+#13+#13+
                'Valor dos Cupons Cancelados: '+format('%.2f',[ImpFiscalB1.RetornoCuponsCanceladosValor]));
                }
end;

procedure TSIAC.mn_CF_ResetarErro;
begin
//  ImpFiscalB1.ResetarErro;
end;

procedure TSIAC.mn_CF_AdicionarAliquota;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    Application.CreateForm(TfMxAdicionaAliquota, fMxAdicionaAliquota);
    fMxAdicionaAliquota.ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_VerificarFirmware;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
    ImpFiscalB1.VerificaVersaoFirmware;
    }
end;

procedure TSIAC.mn_CF_VerificarArredondamento;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
    ImpFiscalB1.VerificaTruncamento;
    }
end;

procedure TSIAC.mn_CF_ProgramarParaArredondamento;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
    ImpFiscalB1.ProgramaArredondamento;
    }
end;

procedure TSIAC.mn_CF_ProgramarParaTruncamento;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
    ImpFiscalB1.ProgramaTruncamento;
    }
end;

procedure TSIAC.mn_CF_ConfigurarHorarioVerao;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    case ImpFiscalB1.Retorno_Impressora of
      -1: Exit;
    end;
  end;
  ImpFiscalB1.ProgramaHorarioVerao;}
end;

procedure TSIAC.mn_CF_ConfigurarSimboloMoeda;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    Application.CreateForm(TfMxSimboloMoeda, fMxSimboloMoeda);
    fMxSimboloMoeda.ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_ConfigurarLinhasEntreCupom;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    Application.CreateForm(TfMxEspacoEntreCupom, fMxEspacoEntreCupom);
    fMxEspacoEntreCupom.ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_ConfigurarGraficoAutenticacao;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    Application.CreateForm(TfMxGraficoAutenticacao, fMxGraficoAutenticacao);
    fMxGraficoAutenticacao.ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_ConfigurarIntensidadeImpressao;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    Application.CreateForm(TfMxItensidadeImpressoraFiscal, fMxItensidadeImpressoraFiscal);
    fMxItensidadeImpressoraFiscal.ShowModal;
  end;}
end;

procedure TSIAC.mn_CF_ImprimirConfiguracoes;
var
  Linhas :integer;
begin
{  Linhas := ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    case ImpFiscalB1.Retorno_Impressora of
      -1: Exit;
       0: If MessageDlg('O Papel está acabando!'+#13+#13+'Linhas Impressas em Baixa: '+PreencheZero(5,Linhas)+#13+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
    end;
  end;
  ImpFiscalB1.ImprimeConfiguracoesImpressora;
  }
end;

procedure TSIAC.mn_CF_ImprimirMemoriaFiscal;

var
  Linhas :integer;
begin
{  Linhas := ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    case ImpFiscalB1.Retorno_Impressora of
      -1: Exit;
       0: If MessageDlg('O Papel está acabando!'+#13+#13+'Linhas Impressas em Baixa: '+PreencheZero(5,Linhas)+#13+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
    end;
  end;
  Application.CreateForm(TfMxSelIntMemFisc, fMxSelIntMemFisc);
  with fMxSelIntMemFisc do
  Begin
    Tag := 0;
    ShowModal;
  end;
  }
end;

procedure TSIAC.mn_CF_ImprimirRelatorioGerencial;
begin
{  ImpFiscalB1.MonitoramentoPapel;
  if ImpFiscalB1.Analisa_iRetorno then
  Begin
    Application.CreateForm(TfMxRelatorioGerencial, fMxRelatorioGerencial);
    fMxRelatorioGerencial.ShowModal;
  end;
  }
end;

procedure TSIAC.Action28Execute(Sender: TObject);
begin
  mn_CF_ReducaoZ;
end;

procedure TSIAC.Action29Execute(Sender: TObject);
begin
  mn_CF_LeituraX;
end;

procedure TSIAC.Action30Execute(Sender: TObject);
begin
  mn_CF_CancelarUltimoCupom;
end;

procedure TSIAC.Action31Execute(Sender: TObject);
begin
  mn_CF_Rel60Mestre;
end;

procedure TSIAC.Action32Execute(Sender: TObject);
begin
  mn_CF_Rel60Analitico;
end;

procedure TSIAC.Action33Execute(Sender: TObject);
begin
  mn_CF_MapaResumo;
end;

procedure TSIAC.Action34Execute(Sender: TObject);
begin
  mn_CF_ExibirAliquota;
end;

procedure TSIAC.Action35Execute(Sender: TObject);
begin
  mn_CF_ExibirLeituraX;
end;

procedure TSIAC.Action36Execute(Sender: TObject);
begin
  mn_CF_ExibirUltimaReducao
end;

procedure TSIAC.Action37Execute(Sender: TObject);
begin
  mn_CF_ExibirNumeroSerie;
end;

procedure TSIAC.Action38Execute(Sender: TObject);
begin
  mn_CF_ExibirNumeroValorCancelamento;
end;

procedure TSIAC.Action39Execute(Sender: TObject);
begin
  mn_CF_ResetarErro;
end;

procedure TSIAC.Action40Execute(Sender: TObject);
begin
  mn_CF_AdicionarAliquota;
end;

procedure TSIAC.Action41Execute(Sender: TObject);
begin
  mn_CF_VerificarFirmware;
end;

procedure TSIAC.Action42Execute(Sender: TObject);
begin
  mn_CF_VerificarArredondamento;
end;

procedure TSIAC.Action43Execute(Sender: TObject);
begin
  mn_CF_ProgramarParaTruncamento;
end;

procedure TSIAC.Action44Execute(Sender: TObject);
begin
 mn_CF_ProgramarParaArredondamento;
end;

procedure TSIAC.Action45Execute(Sender: TObject);
begin
 mn_CF_ConfigurarHorarioVerao;
end;

procedure TSIAC.Action46Execute(Sender: TObject);
begin
 mn_CF_ConfigurarSimboloMoeda;
end;

procedure TSIAC.Action47Execute(Sender: TObject);
begin
 mn_CF_ConfigurarLinhasEntreCupom;
end;

procedure TSIAC.Action48Execute(Sender: TObject);
begin
  mn_CF_ConfigurarGraficoAutenticacao;
end;

procedure TSIAC.Action49Execute(Sender: TObject);
begin
  mn_CF_ConfigurarIntensidadeImpressao;
end;

procedure TSIAC.Action50Execute(Sender: TObject);
begin
  mn_CF_ImprimirConfiguracoes;
end;

procedure TSIAC.Action51Execute(Sender: TObject);
begin
  mn_CF_ImprimirMemoriaFiscal;
end;

procedure TSIAC.Action52Execute(Sender: TObject);
begin
  mn_CF_ImprimirRelatorioGerencial;
end;

procedure TSIAC.mn_CadTabelaCusto;
begin
  Application.CreateForm(TfMxPrecoCusto, fMxPrecoCusto);
  with fMxPrecoCusto do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_CadOficinasAutorizadas;
begin
  Application.CreateForm(TfCadAutorizada, fCadAutorizada);
  with fCadAutorizada do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.mn_CadGrau;
begin
  Application.CreateForm(TfCadGrau, fCadGrau);
  with FCadGrau do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.mn_RelPosicaoEstoqueLote(Sender: TObject);
begin
  {Application.CreateForm(TOp_RelatProd,Op_RelatProd);
  with Op_RelatProd do
  Begin
    Tag:=9;
    ShowModal;
  end;}

  Application.CreateForm(TfmxProdEstoqueLote, fmxProdEstoqueLote);

  if DM.Configuracao1.CodigoCNC <> 1 then
  begin
    with fmxProdEstoqueLote do
    begin
      ckbCodigoCNC.Checked := True;
      ckbCodigoCNCClick(Sender);
      ckbCodigoCNC.Enabled := False;
      dblCodigoCNC.Enabled := False;
    end;
  end;

  DM.Usuario1.MDI(fmxProdEstoqueLote);
  fmxProdEstoqueLote.Show;
end;

procedure TSIAC.mn_Embarque;
begin
  Application.CreateForm(TfMxEmbarque, fMxEmbarque);
  with fMxEmbarque do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.mn_PreRecebimento(Sender: TObject);
begin
  if (DM.Configuracao1.CodigoCNC <> 0) and //Diferente CPD da Eletro
     (DM.Configuracao1.Empresa <> empLBM) then
  Begin
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM RECEBIMENTO '+
      ' WHERE REC_CODIGO NOT IN '+
      '(SELECT REC_CODIGO FROM ITEM_DE_RECEBIMENTO)');
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM PRE_RECEBIMENTO '+
      ' WHERE PRC_CODIGO NOT IN '+
      '(SELECT PRC_CODIGO FROM ITEM_DE_PRE_RECEBIMENTO)');
    ExecutaSQL(DM.QR_Comandos,'UPDATE PRE_RECEBIMENTO SET '+
      ' PRC_SITUACAO=1 '+
      ' WHERE PRC_CODIGO IN '+
      '(SELECT PRC_CODIGO FROM RECEBIMENTO R1 '+
      ' WHERE PRE_RECEBIMENTO.CNC_CODIGO=R1.CNC_CODIGO)'+
      ' OR PRC_DATA<"01/06/2004"');
  end;

  Application.CreateForm(TfMxPreRecebim, fMxPreRecebim);
  with fMxPreRecebim do
  Begin
    vPendentes := (TComponent(sender).Name = 'SACI');
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_ControleVitrine;
begin
  Application.CreateForm(TfcadControleVitrine, fcadControleVitrine);
  with fcadControleVitrine do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_ManufaturarProduto;
begin
  Application.CreateForm(TfMxManufaturado, fMxManufaturado);
  with fMxManufaturado do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_DemostracaoEmprestimo;
begin
  Application.CreateForm(TfMxEmprestimo, fMxEmprestimo);
  with fMxEmprestimo do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.mn_TransferenciaMercadoria;
begin
  Application.CreateForm(TfMxTransfer, fMxTransfer);
  with fMxTransfer do
  Begin
    Tag := 0;
    showmodal;
  end;
end;

procedure TSIAC.mn_VerificarMercadoria;
begin
  //  if Item_Recebimento1.isEmpty then
//    Raise exception.Create('Selecione Pedido com Itens!');

  Application.CreateForm(TfMxVerificarMercadoria, fMxVerificarMercadoria);
  with fMxVerificarMercadoria do
  Begin
    Tag := 5; //Tipo Tela Principal
    if DM.Configuracao1.Empresa <> empLuciano then
    Begin
      //Limpar Tabela
      ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
        ' AND VER_PEDIDO='+IntToStr(DM.Usuario1.Maquina));
    end;
    edtCodigoCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);
    edtPedido.Text    := IntToStr(DM.Usuario1.Maquina);
    edtDescricao.Text := 'Máquina: '+IntToStr(DM.Usuario1.Maquina);
    Showmodal;
    if DM.Configuracao1.Empresa <> empLuciano then
    Begin
      //Limpar Tabela
      ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
        ' AND VER_PEDIDO='+IntToStr(DM.Usuario1.Maquina));
    end;
  end;
end;

procedure TSIAC.mn_DesativarAutomaticamente;
var
  CdPRD, iQtdProdutos: integer;
  Trans: Boolean;
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(480)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Produto!');


  if MessageDlg('ATENÇÃO!!!'#13+
                'Deseja realmente desativar os produtos sem movimentação a mais de 90 dias? ',mtConfirmation, [mbYes, mbNo], 0)  <> mrYes then
    Exit;

  QR_DesativarProdutos.Close;
  QR_DesativarProdutos.SQL.Text := 'SELECT PRD_CODIGO '+
    ' FROM PRODUTO '+
    ' WHERE PRD_SITUACAO=0 '+
    ' AND PRD_DT_CADASTRO<"'+MesDia(Now-90)+'" '+
    ' AND (PRD_DT_ALTERADO IS NULL '+
    '   OR PRD_DT_ALTERADO<"'+MesDia(Now-90)+'") ';
  QR_DesativarProdutos.Open;
  if QR_DesativarProdutos.isEmpty then
    Raise exception.Create('Consutla vazia!');

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      iQtdProdutos := 0;
      while not QR_DesativarProdutos.Eof do
      Begin
        CdPRD := QR_DesativarProdutos.FieldByName('PRD_CODIGO').asInteger;
        DM.qr_consultas.Close;
        DM.qr_consultas.SQL.Text := 'SELECT PRD_CODIGO '+
          ' FROM ITEM_DE_ESTOQUE '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND (IES_SFISICO<>0 '+
          '   OR IES_SCOMERCIAL<>0 '+
          '   OR IES_SRESERVADO<>0 '+
          '   OR IES_INDISPONIVEL<>0) ';
        DM.qr_consultas.Open;
        if DM.qr_consultas.isEmpty then //Sem estoque em nenhuma Loja
        Begin
          DM.qr_consultas.Close;
          DM.qr_consultas.SQL.Text := 'SELECT MAX(IES_DH_ATUALIZADO) AS DATA '+
            ' FROM ITEM_DE_ESTOQUE '+
            ' WHERE PRD_CODIGO='+IntToStr(CdPRD);
          DM.qr_consultas.Open;
          if DM.qr_consultas.FieldByName('DATA').asDateTime < (Now-90) then
          Begin
            inc(iQtdProdutos);
            ExecutaSQL(DM.QR_Comandos, 'UPDATE PRODUTO SET '+
              ' PRD_SITUACAO=1 '+
              ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CdPRD));
            if not DM.Usuario1.GeraLog(480,0,CdPRD,'DESATIVAR AUTOMATICO ') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;
          end;
        end;
        QR_DesativarProdutos.Next;
      end;

      Commit;
      Trans:= False;

      ShowMessage('Foram desativados '+IntToStr(iQtdProdutos)+' produtos!');
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  end;
end;

procedure TSIAC.ES_CadastrosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.ES_CadProdutosExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadProdutos, fCadProdutos);
  with fCadProdutos do
  Begin
    DM.Usuario1.MDI(fCadProdutos);
    Show;
  end;
end;

procedure TSIAC.ES_CadFornecedoresExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadFor, fCadFor);
  with fCadFor do
  Begin
    tag := 0;
    DM.Usuario1.MDI(fCadFor);
    Show;
  end;
end;

procedure TSIAC.ES_CadBonusVendaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxBonus, fMxBonus);
  with fMxBonus do
  Begin
    tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.ES_CadProdutoFornecedorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxRelProd, fMxRelProd);
  with fMxRelProd do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxRelProd);
    Show;
  end;
end;

procedure TSIAC.ES_CadOrigemFiscalExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadOrFiscal, fCadOrFiscal);
  with fCadOrFiscal do
  Begin
    Tag := 0;
    //Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fCadOrFiscal);
    Show;
  end;
end;

procedure TSIAC.ES_CadOperacaoFiscalExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadOperFiscal, fCadOperFiscal);
  with fCadOperFiscal do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadOperFiscal);
    Show;
  end;
end;

procedure TSIAC.ES_CadGruposExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadGrupo, fCadGrupo);
  with FCadGrupo do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(FCadGrupo);
    Show;
  end;
end;

procedure TSIAC.ES_CadSubGrupoExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadSubGrupo, fCadSubGrupo);
  with FCadSubGrupo do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(FCadSubGrupo);
    Show;
  end;
end;

procedure TSIAC.ES_CadClassificacaoFiscalExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadClasFisc, fCadClasFisc);
  with fCadClasFisc do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadClasFisc);
    Show;
  end;
end;

procedure TSIAC.ES_CadTabelaCustoExecute(Sender: TObject);
begin
  mn_CadTabelaCusto;
end;

procedure TSIAC.ES_CadOficinasAutorizadasExecute(Sender: TObject);
begin
  mn_CadOficinasAutorizadas;
end;

procedure TSIAC.ES_CadGrauExecute(Sender: TObject);
begin
  mn_CadGrau;
end;

procedure TSIAC.ES_RelatoriosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.ES_RelParametrosProdutosMenuExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.ES_RelGrupoExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_grupo,rpt_grupo);
  with rpt_grupo do
  Begin
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.ES_RelSubGrupoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelSubGrupo,fMxSelSubGrupo);
  with fMxSelSubGrupo do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelSubGrupo);
    Show;
  end;
end;

procedure TSIAC.ES_RelProdutosSiteExecute(Sender: TObject);
begin
  Application.CreateForm(TOp_RelatProd,Op_RelatProd);
  Op_RelatProd.Tag:=6;
  Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(Op_RelatProd);
  Op_RelatProd.Show;
end;

procedure TSIAC.ES_RelOrigemFiscalExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_origem_fiscal,rpt_origem_fiscal);
  with rpt_origem_fiscal do
  Begin
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.ES_RelOperacaoFiscalExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_OperacaoFiscal, rpt_OperacaoFiscal);
  with rpt_OperacaoFiscal do
  Begin
    tag := 0;
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.ES_RelCodigoBarrasExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_CodigoBarras, rpt_CodigoBarras);
  with rpt_CodigoBarras do
  Begin
    Tag := 0;
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.ES_RelClassificacaoFiscalExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_class_fiscal,rpt_class_fiscal);
  with rpt_class_fiscal do
  Begin
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.ES_RelCategoriaProdutosExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_cat_de_produtos,rpt_cat_de_produtos);
  with rpt_cat_de_produtos do
  Begin
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.ES_RelTabelaCustoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelDataProduto, fMxSelDataProduto);
  with fMxSelDataProduto do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    Show;
  end;
end;

procedure TSIAC.ES_RelEstoqueMenuExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.ES_RelPosicaoEstoqueExecute(Sender: TObject);
begin
  Application.CreateForm(TOp_RelatProd,Op_RelatProd);
  with Op_RelatProd do
  Begin
    Tag:=1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(Op_RelatProd);
    Show;
  end;
end;

procedure TSIAC.ES_RelPosicaoEstoqueAnteriorExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelEstoqueAnterior, fMxSelEstoqueAnterior);
  with fMxSelEstoqueAnterior do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelEstoqueAnterior);
    Show;
  end;
end;

procedure TSIAC.ES_RelPosicaoEstoqueLoteExecute(Sender: TObject);
begin
  mn_RelPosicaoEstoqueLote(sender);
end;

procedure TSIAC.ES_RelMovimentoEstoqueExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_DataProd, rpt_DataProd);
  with rpt_DataProd do
  Begin
    Tag:=1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(rpt_DataProd);
    Show;
  end;
end;

procedure TSIAC.ES_RelProdutosExecute(Sender: TObject);
begin
  Application.CreateForm(TOp_RelatProd,Op_RelatProd);
  with Op_RelatProd do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(Op_RelatProd);
    Show;
  end;
end;

procedure TSIAC.ES_RelEmbarqueExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSProdutoData, fMxSProdutoData);
  with fMxSProdutoData do
  Begin
    Tag:=1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSProdutoData);
    Show;
  end;
end;

procedure TSIAC.ES_RelInventarioExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelInventario,fMxSelInventario);
  with fMxSelInventario do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelInventario);
    Show;
  end;
end;

procedure TSIAC.ES_RelDemostracaoEmprestimoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelEmprestimo, fMxSelEmprestimo);
  with fMxSelEmprestimo do
  Begin
    tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelEmprestimo);
    Show;
  end;
end;

procedure TSIAC.ES_RelRecebimentosExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSPreRecRec, fMxSPreRecRec);
  with fMxSPreRecRec do
  Begin
    tag := 2;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSPreRecRec);
    Show;
  end;
end;

procedure TSIAC.ES_RelPreRecebimento_RecebimentoExecute(Sender: TObject);
begin
  //Mudar a situação dos pre-recebimentos no CPD
  ExecutaSQL(DM.QR_Comandos,'UPDATE PRE_RECEBIMENTO SET '+
    ' PRC_SITUACAO=1 '+
    ' WHERE PRC_DATA<"01/06/2004" '+
    ' OR EXISTS (SELECT PRC_CODIGO '+
    ' FROM RECEBIMENTO R1 '+
    ' WHERE R1.CNC_CODIGO=PRE_RECEBIMENTO.CNC_CODIGO '+
    ' AND R1.REC_COD_ORIGEM=PRE_RECEBIMENTO.PRC_COD_ORIGEM '+
    ' AND R1.REC_CNC_ORIGEM=PRE_RECEBIMENTO.PRC_CNC_ORIGEM '+
    ' AND R1.REC_TIPO=PRE_RECEBIMENTO.PRC_TIPO) ');

  Application.CreateForm(TfMxSPreRecRec, fMxSPreRecRec);
  with fMxSPreRecRec do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSPreRecRec);
    Show;
  end;
end;

procedure TSIAC.ES_RelTransferenciaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSPreRecRec, fMxSPreRecRec);
  with fMxSPreRecRec do
  Begin
    tag := 1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSPreRecRec);
    Show;
  end;
end;

procedure TSIAC.ES_RelBonusVendaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelBonus, fMxSelBonus);
  with fMxSelBonus do
  Begin
    tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelBonus);
    Show;
  end;
end;

procedure TSIAC.ES_RelTransferenciaNecessariaExecute(Sender: TObject);
begin
  Application.CreateForm(TOp_RelatProd,Op_RelatProd);
  with Op_RelatProd do
  Begin
    Tag:=4;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(Op_RelatProd);
    Show;
  end;
end;

procedure TSIAC.ES_RelAssistenciaTecnicaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelAssistenciaTecnica, fMxSelAssistenciaTecnica);
  with fMxSelAssistenciaTecnica do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelAssistenciaTecnica);
    Show;
  end;
end;

procedure TSIAC.ES_RelVerificarEstoqueExecute(Sender: TObject);
begin
(*desativado*)
end;

procedure TSIAC.ES_RelBaseRealExecute(Sender: TObject);
begin
  Application.CreateForm(Trpt_BaseReal, rpt_BaseReal);
  with rpt_BaseReal do
  Begin
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT G1.GRP_CODIGO, G1.GRP_DESCRICAO, '+
      ' S1.SGP_CODIGO, S1.SGP_DESCRICAO, P1.PRD_BASE_REAL, P1.PRD_DESCRICAO '+
      ' FROM GRUPO G1, SUBGRUPO S1, PRODUTO P1 '+
      ' WHERE P1.PRD_DESCRICAO LIKE "% BASE %" '+
      ' AND S1.SGP_BASE_CHAVE<>"" '+
      ' AND S1.SGP_CODIGO=P1.SGP_CODIGO '+
      ' AND G1.GRP_CODIGO=S1.GRP_CODIGO '+
      ' ORDER BY G1.GRP_DESCRICAO,S1.SGP_DESCRICAO, P1.PRD_BASE_REAL ';
    Entidade.Open;
    zrbDetalhe.Height := 0;
    report.Preview;
    Close;
  end;
end;

procedure TSIAC.ES_RelGrauExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelGrau, fMxSelGrau);
  with fMxSelGrau do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelGrau);
    Show;
  end;
end;

procedure TSIAC.ES_AssistenciaTecnicaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxAssistenciaTecnica, fMxAssistenciaTecnica);
  with fMxAssistenciaTecnica do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxAssistenciaTecnica);
    Show;
  end;
end;

procedure TSIAC.ES_InventarioExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxInvent, fMxInvent);
  with fMxInvent do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxInvent);
    Show;
  end;
end;

procedure TSIAC.ES_EmbarqueExecute(Sender: TObject);
begin
  mn_Embarque;
end;

procedure TSIAC.ES_RecebimentoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxRecebim, fMxRecebim);
  with fMxRecebim do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.ES_PreRecebimentoExecute(Sender: TObject);
begin
  mn_PreRecebimento(sender);
end;

procedure TSIAC.ES_ControleVitrineExecute(Sender: TObject);
begin
  mn_ControleVitrine;
end;

procedure TSIAC.ES_ManufaturarProdutoExecute(Sender: TObject);
begin
  mn_ManufaturarProduto;
end;

procedure TSIAC.ES_IndisponibilizarEstoqueExecute(Sender: TObject);
begin
  Application.CreateForm(TFCadSolPRep, FCadSolPRep);
  with FCadSolPRep do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.ES_DemostracaoEmprestimoExecute(Sender: TObject);
begin
  mn_DemostracaoEmprestimo;
end;

procedure TSIAC.ES_TransferenciaNercadoriaExecute(Sender: TObject);
begin
  mn_TransferenciaMercadoria;
end;

procedure TSIAC.ES_VerificarMercadoriaExecute(Sender: TObject);
begin
  mn_VerificarMercadoria;
end;

procedure TSIAC.ES_CorrigirReservaExecute(Sender: TObject);
var
  Trans : Boolean;
  CdCNC, CdPRD: integer;
  vQtd : Double;
begin
  if MessageDlg('ATENÇÃO!!!'#13+
                'Deseja realmente Ajustar as reservas desse centro de custo? ',mtConfirmation, [mbYes, mbNo], 0)  <> mrYes then
    Exit;

  CdCNC := DM.Configuracao1.CodigoCNC;

  with DM.QR_Consultas do
  Begin
    Close;
    Sql.Text := 'SELECT * FROM TRANSFERENCIA TRF, ITEM_DE_TRANSFERENCIA ITR '+
      ' WHERE TRF.TRF_SITUACAO=0 '+
      ' AND TRF.CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND TRF.CNC_CODIGO=ITR.CNC_CODIGO '+
      ' AND TRF.TRF_CODIGO=ITR.TRF_CODIGO ';
    Open;
    if not isEmpty then
      Raise exception.Create('Existem Transferências não processadas!');
  end;


  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
    ' IES_SRESERVADO=0 '+
    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE IES_SRESERVADO<>0 '+
    ' AND CNC_CODIGO='+IntToStr(CdCNC));

  //Pedidos Pendentes
  with DM.QR_Consultas do
  Begin
    Close;
    Sql.Text := 'SELECT PRD_CODIGO,SUM(IPV_QUANTIDADE) AS QTD '+ //Está incluído a Bonificação na quantidade
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_SITUACAO<4 '+
      ' AND P1.CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND (P1.PDV_DIAS_RESERV=0 OR P1.PDV_DIAS_RESERV IS NULL) '+
      ' AND (I1.IPV_SERVICO=0 OR I1.IPV_SERVICO IS NULL) '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
      ' GROUP BY I1.PRD_CODIGO '+
      ' ORDER BY I1.PRD_CODIGO ';
    Open;
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

      while not DM.QR_Consultas.Eof do
      Begin
        CdPRD := DM.QR_Consultas.FieldByName('PRD_CODIGO').asInteger;
        vQtd  := DM.QR_Consultas.FieldByName('QTD').asFloat;
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
          ' IES_SRESERVADO='+VirgPonto(vQtd)+
          ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PRD_CODIGO='+IntToStr(CdPRD));

        DM.Usuario1.GeraLog(7340,CdCNC,CdPRD,'Reserva:'+format('%.2f',[vQtd]));

        DM.QR_Consultas.Next;
      end;


      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
        end;
    end;
  End;


  //Reserva Externa
  with DM.QR_Consultas do
  Begin
    Close;
    Sql.Text := 'SELECT PRD_CODIGO,SUM(REX_QUANTIDADE) AS QTD '+
      ' FROM RESERVA_EXTERNA '+
      ' WHERE REX_SITUACAO=0 '+ //Não Liberada
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' GROUP BY PRD_CODIGO '+
      ' ORDER BY PRD_CODIGO ';
    Open;
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

      while not DM.QR_Consultas.Eof do
      Begin
        CdPRD := DM.QR_Consultas.FieldByName('PRD_CODIGO').asInteger;
        vQtd  := DM.QR_Consultas.FieldByName('QTD').asFloat;
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
          ' IES_SRESERVADO=IES_SRESERVADO+'+VirgPonto(vQtd)+
          ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PRD_CODIGO='+IntToStr(CdPRD));

        DM.Usuario1.GeraLog(7340,CdCNC,CdPRD,'Reserva:'+format('%.2f',[vQtd]));

        DM.QR_Consultas.Next;
      end;


      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
        end;
    end;
  End;
end;

procedure TSIAC.ES_AjustePrecoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxAjustePreco,fMxAjustePreco);
  with fMxAjustePreco do
  Begin
    tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxAjustePreco);
    Show;
  end;
end;

procedure TSIAC.ES_AjustePrecoCustoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxAjustaPrecoCusto, fMxAjustaPrecoCusto);
  with fMxAjustaPrecoCusto do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxAjustaPrecoCusto);
    Show;
  end;
end;

procedure TSIAC.ES_DesativarAutomaticamenteExecute(Sender: TObject);
begin
  mn_DesativarAutomaticamente;
end;

procedure TSIAC.ES_MovimentacaoMercadoriaAvulsaExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxSEstEntrada,fMxSEstEntrada);
  fMxSEstEntrada.Tag:=0;
  fMxSEstEntrada.Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(fMxSEstEntrada);
  fMxSEstEntrada.Show;
end;

procedure TSIAC.ES_MovimentacaoBonificacaoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxBonificacaoAmostra,fMxBonificacaoAmostra);
  with fMxBonificacaoAmostra do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxBonificacaoAmostra);
    Show;
  end;
end;

procedure TSIAC.FI_CadastrosExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.Action1Execute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.Action2Execute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.Action6Execute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.Action26Execute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.Action54Execute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.Action58Execute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.mn_CadBancoBoletoCBR454;
begin
  Application.CreateForm(TfCadBancoBoletoCBR454,fCadBancoBoletoCBR454);
  with fCadBancoBoletoCBR454 do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TSIAC.FI_CadBancosExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadBnc, fCadBnc);
  with fCadBnc do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadBnc);
    Show;
  end;
end;

procedure TSIAC.FI_CadAgenciaExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadAgn, fCadAgn);
  with fCadAgn do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadAgn);
    Show;
  end;
end;

procedure TSIAC.FI_CadContaCorrenteExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadCnt, fCadCnt);
  with fCadCnt do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadCnt);
    Show;
  end;
end;

procedure TSIAC.FI_CadAgenteFinanceiroExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadAgFinan, fCadAgFinan);
  with FCadAgFinan do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(FCadAgFinan);
    Show;
  end;
end;

procedure TSIAC.FI_CadFormasPagtoExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadForPag, fCadForPag);
  with fCadForPag do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadForPag);
    Show;
  end;
end;

procedure TSIAC.FI_CadIdenxadorEconomicoExecute(Sender: TObject);
begin
  Application.CreateForm(TfCadIndex,fCadIndex);
  with fCadIndex do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fCadIndex);
    Show;
  end;
end;

procedure TSIAC.FI_CadBancoBoletoExecute(Sender: TObject);
begin
{ Não está compilando por cusa do ACBr
  Application.CreateForm(TfrmBoleto, frmBoleto);
  with frmBoleto do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(frmBoleto);
    Show;
  end;
}
{//Ninguém usa
  Application.CreateForm(TfCadBancoBoleto,fCadBancoBoleto);
  with fCadBancoBoleto do
  Begin
    Tag := 0;
    ShowModal;
  end;}
end;

procedure TSIAC.FI_CadBancoBoletoCBR45Execute(Sender: TObject);
begin
  mn_CadBancoBoletoCBR454;
end;

procedure TSIAC.Action3Execute(Sender: TObject);
begin
//  mn_RelClientesEmAtraso;
end;

procedure TSIAC.Action4Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelInadiplencia, fMxSelInadiplencia);
  with fMxSelInadiplencia do
  Begin
    Tag := 1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelInadiplencia);
    Show;
  end;
end;

procedure TSIAC.Action5Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTitulos,fMxSelTitulos);
  with fMxSelTitulos do
  Begin
    Tag:=9;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelTitulos);
    Show;
  end;
end;

procedure TSIAC.Action7Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTitulosReceberRecebidos, fMxSelTitulosReceberRecebidos);
  with fMxSelTitulosReceberRecebidos do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelTitulosReceberRecebidos);
    Show;
  end;
end;

procedure TSIAC.Action8Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTitulos,fMxSelTitulos);
  with fMxSelTitulos do
  Begin
    Tag:=2;
    //Caption := 'Previsão de Receita';
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelTitulos);
    Show;
  end;
end;

procedure TSIAC.Action9Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTitulos,fMxSelTitulos);
  with fMxSelTitulos do
  Begin
    //Caption := 'Registro de Duplicatas';
    Tag:=8;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelTitulos);
    Show;
  end;
end;

procedure TSIAC.Action10Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelDataCentro, fMxSelDataCentro);
  with fMxSelDataCentro do
  Begin
    tag:=1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelDataCentro);
    Show;
  end;
end;

procedure TSIAC.Action11Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelGerencial, fMxSelGerencial);
  with fMxSelGerencial do
  begin
    fMxSelGerencial.Tag := 1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelGerencial);
    fMxSelGerencial.Show;
  end;
end;

procedure TSIAC.Action12Execute(Sender: TObject);
var
  SQL: string;
  stiReport: CoSiacReport_; //TSiacReport;
begin
  if RelatorioGrafico then
  begin
    SQL := 'SELECT '+
           '  T1.*, '+
           '  T2.CNC_RZ_SOCIAL, '+
           '  T2.CNC_NOME_FAN, '+
           '  T2.CNC_FONE '+
           'FROM '+
           '  BANCO T1 '+
           'INNER JOIN CENTRO_DE_CUSTO T2 ON '+
           '  T1.CNC_CODIGO = T2.CNC_CODIGO '+
           'ORDER BY BNC_NUMERO, BNC_NOME';

    stiReport.Create.ReportBanco(false,
                                    false,
                                    SQL,
                                    EmpresaDesenvolvedora,
                                    'Relatório de Bancos do sistema',
                                    DM.CentroCusto1.RazaoSocial,
                                    '',//DM.Configuracao1.LojaNome
                                    'Relatório de Bancos',
                                    DM.Usuario1.NomeUSU,
                                    '',//Filtros
                                    rptArquivoLogo);
  end
  else
  begin
    Application.CreateForm(Trpt_bancos,rpt_bancos);
    rpt_bancos.report.Preview;
  end;
end;

procedure TSIAC.Action13Execute(Sender: TObject);
begin
  Application.CreateForm(Trpt_agencia,rpt_agencia);
  with rpt_agencia do
  Begin
    report.Preview;
  end;
end;

procedure TSIAC.Action14Execute(Sender: TObject);
begin
  Application.CreateForm(Trpt_conta,rpt_conta);
  with rpt_conta do
  Begin
    report.Preview;
  end;
end;

procedure TSIAC.Action15Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelAgenteFinanceiro, fMxSelAgenteFinanceiro);
  with fMxSelAgenteFinanceiro do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelAgenteFinanceiro);
    Show;
  end;
end;

procedure TSIAC.Action16Execute(Sender: TObject);
begin
  Application.CreateForm(Trpt_forma_pagamento, rpt_forma_pagamento);
  with rpt_forma_pagamento do
  Begin
    report.Preview;
  end;
end;

procedure TSIAC.Action17Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelCheques, fMxSelCheques);
  fMxSelCheques.tag := 0;
  fMxSelCheques.Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(fMxSelCheques);
  fMxSelCheques.Show;
end;

procedure TSIAC.Action18Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelMovimentoCheque, fMxSelMovimentoCheque);
  with fMxSelMovimentoCheque do
  Begin
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelMovimentoCheque);
    Show;
  end;
end;

procedure TSIAC.Action19Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSTituloPagar,fMxSTituloPagar);
  with fMxSTituloPagar do
  Begin
    Tag:=1;
    //Caption := 'Títulos Pagos';
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSTituloPagar);
    Show;
  end;
end;

procedure TSIAC.Action20Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSTituloPagar,fMxSTituloPagar);
  with fMxSTituloPagar do
  Begin
    Tag:=2;
    //Caption := 'Títulos a Pagar';
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSTituloPagar);
    Show;
  end;
end;

procedure TSIAC.Action21Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTitulos,fMxSelTitulos);
  with fMxSelTitulos do
  Begin
    //Caption := 'Títulos Recebidos';
    Tag:=1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelTitulos);
    fMxSelTitulos.Show;
  end;
end;

procedure TSIAC.Action22Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTitulos,fMxSelTitulos);
  with fMxSelTitulos do
  Begin
    //Caption := 'Títulos a Receber';
    Tag:=0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelTitulos);
    Show;
  end;
end;

procedure TSIAC.Action23Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTitulos,fMxSelTitulos);
  with fMxSelTitulos do
  Begin
    //Caption := 'Extrato de Cliente';
    Tag:=7;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelTitulos);
    Show;
  end;
end;

procedure TSIAC.Action24Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelRegistroBoleto,fMxSelRegistroBoleto);
  with fMxSelRegistroBoleto do
  Begin
    Tag := 0;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelRegistroBoleto);
    Show;
  end;
end;

procedure TSIAC.Action25Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelData, fMxSelData);
  with fMxSelData do
  Begin
    Tag:=0;
    RadioGroup1.ItemIndex := 1;
    Caption := TiraCaracter((Sender as TAction).Caption,'&');
    DM.Usuario1.MDI(fMxSelData);
    Show;
  end;
end;

procedure TSIAC.Action27Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSTituloPagar,fMxSTituloPagar);
  fMxSTituloPagar.Tag:=3;
  fMxSTituloPagar.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSTituloPagar);
  fMxSTituloPagar.Show;
end;

procedure TSIAC.Action53Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTitulos,fMxSelTitulos);
  fMxSelTitulos.Tag:=6;
  fMxSelTitulos.Caption := TiraCaracter((Sender as TAction).Caption,'&') + ' (Gráfico)';
  DM.Usuario1.MDI(fMxSelTitulos);
  fMxSelTitulos.Show;
end;

procedure TSIAC.mn_BaixaAutomatica;
begin
  Application.CreateForm(TfMxBaixaAutomatica, fMxBaixaAutomatica);
  with fMxBaixaAutomatica do
  Begin
    Tag:=0;
    ShowModal;
  end;
end;

procedure TSIAC.Action55Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxReceber, fMxReceber);
  with fMxReceber do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxReceber);
    Show;
  end;
end;

procedure TSIAC.Action56Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxBaixaRec, fMxBaixaRec);
  with fMxBaixaRec do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxBaixaRec);
    Show;
  end;
end;

procedure TSIAC.Action57Execute(Sender: TObject);
begin
  mn_BaixaAutomatica;
end;

procedure TSIAC.Action59Execute(Sender: TObject);
begin
//Financeiro
  Application.CreateForm(TfMxPagar, fMxPagar);
  with fMxPagar do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxPagar);
    Show;
  end;
end;

procedure TSIAC.Action60Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxBaixaPag, fMxBaixaPag);
  with fMxBaixaPag do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxBaixaPag);
    Show;
  end;
end;

procedure TSIAC.FI_SPCExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxControleSPC, fMxControleSPC);
  with fMxControleSPC do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxControleSPC);
    Show;
  end;
end;

procedure TSIAC.FI_SERASAExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxControleSERASA, fMxControleSERASA);
  with fMxControleSERASA do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxControleSERASA);
    Show;
  end;
end;

procedure TSIAC.FI_EQUIFAXExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxControleEQUIFAX, fMxControleEQUIFAX);
  with fMxControleEQUIFAX do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxControleEQUIFAX);
    Show;
  end;
end;

procedure TSIAC.Action64Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxCheque, fMxCheque);
  with fMxCheque do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxCheque);
    Show;
  end;
end;

procedure TSIAC.Action66Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxFactoring, fMxFactoring);
  with fMxFactoring do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxFactoring);
    Show;
  end;
end;

procedure TSIAC.Action65Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxMovimentoContaCorrente, fMxMovimentoContaCorrente);
  with fMxMovimentoContaCorrente do
  Begin
    Tag := 0;
    DM.Usuario1.MDI(fMxMovimentoContaCorrente);
    Show;
  end;
end;

procedure TSIAC.AC_VisiteNossoSiteExecute(Sender: TObject);
begin
  VisiteNossoSite;
end;

procedure TSIAC.AC_MandeSuaMensagemExecute(Sender: TObject);
begin
  VisiteNossoSite;
end;

procedure TSIAC.VE_ConsignacaoExecute(Sender: TObject);
begin
  Application.CreateForm(TFMxConsignacao, FMxConsignacao);
  with FMxConsignacao do
  Begin
    Tag := 0;
    Showmodal;
  end;
end;

procedure TSIAC.VE_RelConsignacaoExecute(Sender: TObject);
begin
  Application.CreateForm(TfMxRelConsignacao, fMxRelConsignacao);
  fMxRelConsignacao.tag := 0;
  fMxRelConsignacao.Caption := TiraCaracter((Sender as TAction).Caption,'&');
  DM.Usuario1.MDI(fMxRelConsignacao);
  fMxRelConsignacao.Show;
end;

procedure TSIAC.VE_ReceberConsignacaoExecute(Sender: TObject);
var
  sLinha, sDirAtual, sValores, sBanco : String;
  Inifile : TIniFile;
  iAlte, iNovo, iMaxReg, iMaxCod : Integer;
  fArq :TextFile;
begin
  //
  GetDir(0,sDirAtual);
  //
  // Pede pelo nome do arquivo TXT
  //
  OpenDialog1.FileName := '';
  OpenDialog1.Title    := 'Selecionar o arquivo a ser importado!';
  OpenDialog1.Filter   := 'Produtos (CONSIGNACAO_CNC_*.TXT)|CONSIGNACAO_CNC_*.TXT';
  OpenDialog1.Execute;
  //
  if FileExists(pChar(OpenDialog1.FileName)) then
  begin
    //
    // Cursor
    //
    Screen.Cursor:= crHourGlass;
    //
    // Abre o arquivo TEXTO
    //
    AssignFile(fArq,OpenDialog1.FileName);
    Reset(fArq);
    //
    // Zera as variáveis de controle
    //
    iAlte           := 0;
    iNovo           := 0;
    //


    Readln(fArq,sLinha);
    qExec.Close;
    qExec.SQL.Clear;
    qExec.SQL.Add('DELETE FROM CONSIGNACAO');
    qExec.SQL.Add('WHERE');
    qExec.SQL.Add('  CNC_CODIGO = '          + QuotedStr(Alltrim(Copy(sLinha,5,6))));
    qExec.ExecSQL;

    qExec.Close;
    qExec.SQL.Clear;
    qExec.SQL.Add('DELETE FROM ITEM_DE_CONSIGNACAO');
    qExec.SQL.Add('WHERE');
    qExec.SQL.Add('  CNC_CODIGO = '          + QuotedStr(Alltrim(Copy(sLinha,5,6))));
    qExec.ExecSQL;

    while not eof(fArq) do
    begin
      Try
          //
          // Lê uma linha do arquivo TXT
          //
          ReadLn(fArq,sLinha);
          //
          // Verifica se a DESCRICAO já está cadastrada
          //  
          if copy(sLinha,0,3) = 'CSG' then
          begin
            {Query1.Close;
            Query1.SQL.Clear;
            Query1.SQL.Add('SELECT CSG_CODIGO FROM CONSIGNACAO WHERE CNC_CODIGO ='+QuotedStr(AllTrim(Copy(sLinha,5,6))) + ' AND CSG_CODIGO='+QuotedStr(AllTrim(Copy(sLinha,11,6))));
            Query1.Open;

            if not Query1.IsEmpty then
            begin
              iAlte:= iAlte +1;

              qExec.Close;
              qExec.SQL.Clear;
              qExec.SQL.Add('DELETE FROM ITEM_DE_CONSIGNACAO');
              qExec.SQL.Add('WHERE');
              qExec.SQL.Add('  CNC_CODIGO = '          + QuotedStr(Alltrim(Copy(sLinha,5,6))));
              qExec.SQL.Add('AND');
              qExec.SQL.Add('  CSG_CODIGO = '          + QuotedStr(Alltrim(Copy(sLinha,11,6))));
              qExec.ExecSQL;

              qExec.Close;
              qExec.SQL.Clear;
              qExec.SQL.Add('UPDATE CONSIGNACAO SET');
              qExec.SQL.Add('  USU_CODIGO = '          + QuotedStr(Alltrim(Copy(sLinha,17,6)))              + ',');
              qExec.SQL.Add('  FUN_CODIGO = '          + QuotedStr(Alltrim(Copy(sLinha,23,6)))              + ',');
              qExec.SQL.Add('  CSG_DATA = '            + QuotedStr(MesDiaHora(Alltrim(Copy(sLinha,29,12)))) + ',');
              qExec.SQL.Add('  CSG_DT_ALTERADO = '     + QuotedStr(MesDiaHora(Alltrim(Copy(sLinha,41,12)))) + ',');
              qExec.SQL.Add('  CSG_VALOR = '           + VirgPonto(QuotedStr(Alltrim(Copy(sLinha,53,10))))  + ',');
              qExec.SQL.Add('  CSG_SITUACAO = '        + QuotedStr(Alltrim(Copy(sLinha,63,2)))              + ',');
              qExec.SQL.Add('  CLI_CODIGO = '          + QuotedStr(Alltrim(Copy(sLinha,65,6)))              + ',');
              qExec.SQL.Add('  CSG_OBSERVACAO = '      + QuotedStr(Alltrim(Copy(sLinha,71,255))));
              qExec.SQL.Add('WHERE');
              qExec.SQL.Add('  CNC_CODIGO = '          + QuotedStr(Alltrim(Copy(sLinha,5,6))));
              qExec.SQL.Add('AND');
              qExec.SQL.Add('  CSG_CODIGO = '          + QuotedStr(Alltrim(Copy(sLinha,11,6))));
              qExec.ExecSQL;
            end
            else
            begin}
              iNovo:= iNovo +1;
              qExec.Close;
              qExec.SQL.Clear;
              qExec.SQL.Add('INSERT INTO CONSIGNACAO (');
              qExec.SQL.Add('  CNC_CODIGO,');
              qExec.SQL.Add('  CSG_CODIGO,');
              qExec.SQL.Add('  USU_CODIGO,');
              qExec.SQL.Add('  FUN_CODIGO,');
              qExec.SQL.Add('  CSG_DATA,');
              qExec.SQL.Add('  CSG_DT_ALTERADO,');
              qExec.SQL.Add('  CSG_VALOR,');
              qExec.SQL.Add('  CSG_SITUACAO,');
              qExec.SQL.Add('  CLI_CODIGO,');
              qExec.SQL.Add('  CSG_OBSERVACAO');
              qExec.SQL.Add(') VALUES (');
              qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,5,6)))               + ',');
              qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,11,6)))              + ',');
              qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,17,6)))              + ',');
              qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,23,6)))              + ',');
              qExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(Copy(sLinha,29,12)))) + ',');
              qExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(Copy(sLinha,41,12)))) + ',');
              qExec.SQL.Add('  ' + VirgPonto(QuotedStr(Alltrim(Copy(sLinha,53,10))))  + ',');
              qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,63,2)))              + ',');
              qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,65,6)))              + ',');
              qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,71,255))));
              qExec.SQL.Add(')');
              qExec.ExecSQL;
            //end;
          end
          else if copy(sLinha,0,3) = 'ICS' then
          begin
            iNovo:= iNovo +1;
            qExec.Close;
            qExec.SQL.Clear;
            qExec.SQL.Add('INSERT INTO ITEM_DE_CONSIGNACAO (');
            qExec.SQL.Add('  CNC_CODIGO,');
            qExec.SQL.Add('  ICS_CODIGO,');
            qExec.SQL.Add('  CSG_CODIGO,');
            qExec.SQL.Add('  PRD_CODIGO,');
            qExec.SQL.Add('  USU_CODIGO,');
            qExec.SQL.Add('  ICS_DATA,');
            qExec.SQL.Add('  ICS_QUANTIDADE,');
            qExec.SQL.Add('  ICS_VALOR,');
            qExec.SQL.Add('  ICS_OBSERVACAO');
            qExec.SQL.Add(') VALUES (');
            qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,5,6)))               + ',');
            qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,11,6)))              + ',');
            qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,17,6)))              + ',');
            qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,23,6)))              + ',');
            qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,29,6)))              + ',');
            qExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(Copy(sLinha,35,12)))) + ',');
            qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,47,6)))              + ',');
            qExec.SQL.Add('  ' + VirgPonto(QuotedStr(Alltrim(Copy(sLinha,53,10))))  + ',');
            qExec.SQL.Add('  ' + QuotedStr(Alltrim(Copy(sLinha,63,255))));
            qExec.SQL.Add(')');
            qExec.ExecSQL;
          end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
    CloseFile(fArq);
    Application.MessageBox(Pchar(Chr(13)+Chr(13)+Chr(13)+
    'Fim da importação, reinicie o sistema!'+Chr(13)+
    'Registros importados: '+IntToStr(iNovo)+chr(13)),'Informações sobre a importação',MB_ICONWARNING+mb_Ok);
    //
  end;
end;

function TSIAC.AllTrim(pP1: String): String;
begin
  While Copy(pP1,Length(pP1),1) = ' ' do
    pP1 := Copy(pP1,1,Length(pP1)-1);
  While Copy(pP1,1,1) = ' ' do
    pP1 := Copy(pP1,2,Length(pP1)-1);
  Result := pP1;
end;

procedure TSIAC.AR_EnviaComunicacaoExecute(Sender: TObject);
begin
  if ExecutaComunicacao then
  begin
    Application.CreateForm(TfrmEnviaComunicacao, frmEnviaComunicacao);
    with frmEnviaComunicacao do
    Begin
      Tag := 1;
      DM.Usuario1.MDI(frmEnviaComunicacao);
      Show;
    end;
  end
  else
    Application.MessageBox('Máquina não configurada para comunicação!',
                           'Atenção',
                           MB_ICONINFORMATION);


//  Application.MessageBox('Em desenvolvimento!',
//                           'Atenção',
//                           MB_ICONINFORMATION);
end;

procedure TSIAC.AR_RecebeComunicacaoExecute(Sender: TObject);
begin
  if ExecutaComunicacao then
  begin
    Application.CreateForm(TfrmRecebeComunicacao, frmRecebeComunicacao);
    with frmRecebeComunicacao do
    Begin
      Tag := 1;
      DM.Usuario1.MDI(frmRecebeComunicacao);
      Show;
    end;
  end
  else
    Application.MessageBox('Máquina não configurada para comunicação!',
                           'Atenção',
                           MB_ICONINFORMATION);

//  Application.MessageBox('Em desenvolvimento!',
//                         'Atenção',
//                         MB_ICONINFORMATION);
end;

{ Para testar o WebBrowser
  WEB_ShowWebBrowser(Application,
                     'http://localhost:32768/',
                     'Caption da Tela',
                     900, //Width
                     500, //Height
                     5, //Top
                     5  //Left
                     );
  //PostMessage(FindWindow(nil, 'CassiniDev Server - Port 32768'), WM_CLOSE, 0,0);                     
}

procedure TSIAC.FS_PAFExecute(Sender: TObject);
begin
  mn_SubMenu;
end;

procedure TSIAC.FS_ExportacaoDadosExecute(Sender: TObject);
var
  stiReport: CoSiacReport_;
  sBanco : WideString;
  Inifile : TIniFile;
begin
  IniFile := TIniFile.create(PAF_GetPasta + '\small.ini');
  sBanco := IniFile.ReadString('Firebird','Server IP','')                     +
                               ';Database='                                   +
                               IniFile.ReadString('Firebird','Server URL','') +
                               '\small.gdb; UserId=SYSDBA; password=masterkey';
  IniFile.Free;

  if ( NetFramework_v4 ) and ( FileExists('SiacReport.dll') ) then
    stiReport.Create.PAF_Export(sBanco,
                                DM.Configuracao1.Empresa,
                                DM.Configuracao1.CodigoCNC,
                                false,(*5 dias*)
                                'Fim do processo!')
  else
    showmessage('Arquivo ''SiacReport.dll'' não localizado e/ou Framework 4.0 não instalado!');
end;

procedure TSIAC.FS_CupomFiscalExecute(Sender: TObject);
begin
  PAF_ExecutaCupomFiscal;
end;

procedure TSIAC.FS_ImportacaoDadosExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmListaPedidoPAF, frmListaPedidoPAF);
  with frmListaPedidoPAF do
  begin
    DM.Usuario1.MDI(frmListaPedidoPAF);
    Show;
  end;
end;

procedure TSIAC.FS_SPEDExecute(Sender: TObject);
begin
  showmessage('Em Desenvolvimento!');
end;

procedure TSIAC.FS_NFeExecute(Sender: TObject);
var
  msg, sArquivo: string;
  OrigemIni, DestinoIni: string;
  OrigemGRAFICO, DestinoGRAFICO: string;
  OrigemRETAGUARDA_CHM, DestinoRETAGUARDA_CHM: string;
  Origemflat___1_bmp, Destinoflat___1_bmp: string;
begin
  if not DirectoryExists('INICIAL') then
    CreateDir('INICIAL');

  OrigemIni             := PAF_GetPasta + '\small.ini';
  DestinoIni            := ExtractFilePath(Application.ExeName)+'small.ini';
  OrigemGRAFICO         := PAF_GetPasta + '\GRAFICOS.EXE';
  DestinoGRAFICO        := ExtractFilePath(Application.ExeName)+'GRAFICOS.EXE';
  OrigemRETAGUARDA_CHM  := PAF_GetPasta + '\RETAGUARDA.CHM';
  DestinoRETAGUARDA_CHM := ExtractFilePath(Application.ExeName)+'RETAGUARDA.CHM';
  Origemflat___1_bmp    := PAF_GetPasta + '\INICIAL\flat___1.bmp';
  Destinoflat___1_bmp   := ExtractFilePath(Application.ExeName)+'INICIAL\flat___1.bmp';

  msg := '';
  try
    if not CopyFile(PChar(OrigemIni), PChar(DestinoIni), false) then
      msg := 'Erro ao copiar ' + OrigemIni + ' para ' + DestinoIni;
  except
  end;

  try
    if not CopyFile(PChar(OrigemGRAFICO), PChar(DestinoGRAFICO), false) then
      msg := msg + #13 + 'Erro ao copiar ' + OrigemGRAFICO + ' para ' + DestinoGRAFICO;
  except
  end;

  try
    if not CopyFile(PChar(OrigemRETAGUARDA_CHM), PChar(DestinoRETAGUARDA_CHM), false) then
      msg := msg + #13 + 'Erro ao copiar ' + OrigemRETAGUARDA_CHM + ' para ' + DestinoRETAGUARDA_CHM;
  except
  end;

  try
    if not CopyFile(PChar(Origemflat___1_bmp), PChar(Destinoflat___1_bmp), false) then
      msg := msg + #13 + 'Erro ao copiar ' + Origemflat___1_bmp + ' para ' + Destinoflat___1_bmp;
  except
  end;

  if msg = '' then
  begin
    sArquivo := PAF_GetPasta + '\Small Commerce.exe';

    if FileExists(sArquivo) then
      WinExec(PChar(sArquivo), SW_SHOWNORMAL); //ShellExecute(Handle,'open',PChar(sArquivo),'',NIL,SW_NORMAL);
  end
  else
    ShowMessage(msg);
end;

procedure TSIAC.ShowHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    StatusBar1.SimplePanel := True;
    StatusBar1.SimpleText := Application.Hint;
  end
  else StatusBar1.SimplePanel := False;
end;

procedure TSIAC.MenuInvisivel;
begin
  if ( GetEmpresaComunicacao(DM.QR_Consultas) = 'LO' ) or
     ( GetEmpresaComunicacao(DM.QR_Consultas) = 'AC' )then
  begin
    Action2.Visible := true; //Rel. Inadiplência
    Action6.Visible := true; //Rel. Especiais
    VE_FaturarPendentesConvenios.Visible := true;
    CX_RelMDF.Visible := true;
    CX_RelFluxoCaixaBoletimDiario.Visible := true;
    CX_VerificacaoCaixa.Visible := true;
    VE_RelComissaoTitulosRecebidos.Visible := true;
    VE_RelEspeciaisMenu.Visible := true;   
    VE_RelQuantidadeNormalVenda.Visible := true;
    VE_RelComparativoFornecedor.Visible := true;
    VE_RelReservaExterna.Visible := true;
    VE_RelPacoteVenda.Visible := true;
    VE_RelPacoteCredito.Visible := true;
    VE_RelMapaTributosFederais.Visible := true;
    
    ES_CadGrau.Visible := true;
    ES_CadOficinasAutorizadas.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(8300)) >= 0);
    ES_CadBonusVenda.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(3880)) >= 0);
    ES_CadTabelaCusto.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(6850)) >= 0);

    ES_AssistenciaTecnica.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(8290)) >= 0);
    ES_Embarque.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(2570)) >= 0);
    ES_DemostracaoEmprestimo.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(3860)) >= 0);

    ES_MovimentacaoBonificacao.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(8130)) >= 0);

    ES_VerificarMercadoria.Visible := true;
    ES_AjustePrecoCusto.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(6190)) >= 0);

    ES_RelPosicaoEstoqueLote.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(8220)) >= 0);
    ES_RelTabelaCusto.Visible := (DM.Usuario1.Permissoes.IndexOf(IntToStr(7000)) >= 0);
    ES_RelEmbarque.Visible := true;

    ES_RelAssistenciaTecnica.Visible := true;
    ES_RelEmbarque.Visible := true;
    ES_RelDemostracaoEmprestimo.Visible := true;
    ES_RelBonusVenda.Visible := true;
    ES_RelTransferenciaNecessaria.Visible := true;
    ES_RelBaseReal.Visible := true;
    ES_RelGrau.Visible := true;
  end
  else
  begin
    Action2.Visible := false; //Rel. Inadiplência
    Action6.Visible := false; //Rel. Especiais
    VE_FaturarPendentesConvenios.Visible := false;
    CX_RelMDF.Visible := false;
    CX_RelFluxoCaixaBoletimDiario.Visible := false;
    CX_VerificacaoCaixa.Visible := false;
    VE_RelComissaoTitulosRecebidos.Visible := false;
    VE_RelEspeciaisMenu.Visible := false;
    VE_RelQuantidadeNormalVenda.Visible := false;
    VE_RelComparativoFornecedor.Visible := false;
    VE_RelReservaExterna.Visible := false;
    VE_RelPacoteVenda.Visible := false;
    VE_RelPacoteCredito.Visible := false;
    VE_RelMapaTributosFederais.Visible := false;

    ES_CadGrau.Visible := false;
    ES_CadOficinasAutorizadas.Visible := false;
    ES_CadBonusVenda.Visible := false;
    ES_CadTabelaCusto.Visible := false;

    ES_AssistenciaTecnica.Visible := false;
    ES_Embarque.Visible := false;
    ES_DemostracaoEmprestimo.Visible := false;

    ES_MovimentacaoBonificacao.Visible := false;
    ES_VerificarMercadoria.Visible := false;
    ES_AjustePrecoCusto.Visible := false;

    ES_RelPosicaoEstoqueLote.Visible := false;
    ES_RelTabelaCusto.Visible := false;
    ES_RelEmbarque.Visible := false;
    ES_RelAssistenciaTecnica.Visible := false;
    ES_RelEmbarque.Visible := false;
    ES_RelDemostracaoEmprestimo.Visible := false;
    ES_RelBonusVenda.Visible := false;
    ES_RelTransferenciaNecessaria.Visible := false;
    ES_RelBaseReal.Visible := false;
    ES_RelGrau.Visible := false;
  end;

  //menu Arquivo
  //AR_SelecionarImpressora.Visible := false;

  //menu compra
  CP_EnviarFornecedor.Visible := false;
  CP_ReposicaoFornecedor.Visible := false;

  //Menu Gerência
  GE_RegistroDeBalanco.Visible := false;
  GE_ExportacaoDeDados.Visible := ( GetEmpresaComunicacao(DM.QR_Consultas) = 'LO' ) or ( GetEmpresaComunicacao(DM.QR_Consultas) = 'AC' );
  GE_ImportacaoDeDados.Visible := false;
  GE_ModuloDoSistema.Visible := false;
  GE_SubModuloDoSistema.Visible := false;
  GE_OperacaoDoSistema.Visible := false;
  GE_RelOperacoesDoSistema.Visible := false;

  AC_SQL.visible := DM.Configuracao1.CodigoUSU = 1; //somente ADM

  //Menu Acessório
  //AC_ComunicacaoClienteFornecedor.Visible := false;
  //AC_Pendencia.Visible := false;
  //AC_RelTestarImpressora.Visible := false;
  //AC_RelPendencia.Visible := false;
  //AC_AcertarRelogio.Visible := false;

  //Menu Caixa
  //if DM.Configuracao1.Empresa <> empLuciano then
    CX_ImpressoraFiscal.Visible := false;

  //Menu Estoque
  ES_AjustePrecoCusto.Visible := false;


  VE_LocalizaDetalhePedido.Visible := GetEmpresaComunicacao(DM.QR_Consultas) = 'LO';


  if GetEmpresaComunicacao(DM.QR_Consultas) = '01' then
  begin
    VE_DevolucaoTotal.Visible   := false;
    VE_DevolucaoParcial.Visible := false;
    VE_QuantidadeNormalVenda.Visible := false;
    VE_AtendimentoVendedor.Visible := false;
    VE_relSaldoVendas.Visible := false;
    VE_RelTabelaPromocional.Visible := false;
    VE_RelComparativoFornecedor.Visible := false;
    VE_RelConsignacao.Visible := false;
    CX_RelMDF.Visible := false;
    ES_VerificarMercadoria.Visible := false;
    ES_CorrigirReserva.Visible := false;
    ES_DesativarAutomaticamente.Visible := false;
    ES_CadGrau.Visible := false;
    ES_RelGrau.Visible := false;
    ES_RelBaseReal.Visible := false;
    ES_RelVerificarEstoque.Visible := false;
    ES_RelEmbarque.Visible := false;
    ES_RelInventario.Visible := false;
    ES_RelDemostracaoEmprestimo.Visible := false;
    ES_RelTransferencia.Visible := false;
    ES_RelBonusVenda.Visible := false;
    ES_RelAssistenciaTecnica.Visible := false;
    ES_RelProdutosSite.Visible := false;
    ES_RelOperacaoFiscal.Visible := false;
    ES_RelTransferenciaNecessaria.Visible := false;
  end;

  if GetEmpresaComunicacao(DM.QR_Consultas) = 'AC' then
  begin
    ES_CadGrau.Visible := false;
    ES_RelGrau.Visible := false;
  end;


  VE_Profissao.Visible := false;

  //////////////////////////////////////////////////////////////////////////////
  //se a Luciano Ótica usar descomentar, e depois de algum tempo excluir do Menu
  CP_RelQtdCompraXQtdVendas.Visible := false;
  CP_CalculadoraDeFrete.Visible     := false;
  //////////////////////////////////////////////////////////////////////////////

  CP_FaturarPendentes.Visible            := LucianoOtica_AguaDeCheiro_AnaCristina;
  CP_RelPrevisaoCompras.Visible          := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_CatracaNotaFiscal.Visible           := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_CorrigirParcelas.Visible            := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_FaturarPendente.Visible             := LucianoOtica_AguaDeCheiro_AnaCristina;
  FI_SPC.Visible                         := LucianoOtica_AguaDeCheiro_AnaCristina;
  FI_SERASA.Visible                      := LucianoOtica_AguaDeCheiro_AnaCristina;
  FI_EQUIFAX.Visible                     := LucianoOtica_AguaDeCheiro_AnaCristina;
  ES_ControleVitrine.Visible             := LucianoOtica_AguaDeCheiro_AnaCristina;
  ES_ManufaturarProduto.Visible          := LucianoOtica_AguaDeCheiro_AnaCristina;
  ES_DesativarAutomaticamente.Visible    := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_RelComissaoVendasCompleta.Visible   := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_EmissaoNotasFiscais.Visible         := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_EmissaoNotasFiscaisExterna.Visible  := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_LocalizacaoNotasFiscais.Visible     := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_LocalizacaoCuponsFiscais.Visible    := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_PromissoriaCarneCupom.Visible       := LucianoOtica_AguaDeCheiro_AnaCristina;
  Action69.Visible                       := LucianoOtica_AguaDeCheiro_AnaCristina;
  CP_ICMSCompraVenda.Visible             := LucianoOtica_AguaDeCheiro_AnaCristina;
  CP_RelICMSCompraVenda.Visible          := LucianoOtica_AguaDeCheiro_AnaCristina;
  VE_RelNotasFiscais.Visible             := LucianoOtica_AguaDeCheiro_AnaCristina;
end;

procedure TSIAC.AC_SQLExecute(Sender: TObject);
begin
  if ( DM.Configuracao1.CodigoUSU = 1 ) then //somente ADM
  begin
    Application.CreateForm(TfrmSQL, frmSQL);

    DM.Usuario1.MDI(frmSQL);
    //Show;

    //frmSQL.Showmodal;
    //frmSQL.Free;
  end
  else
    showmessage('Somente o administrador do sistema pode executar essa rotina.' + #13 +
                'Entre em contato com o suporte técnico!');
end;

procedure TSIAC.AC_BackupExecute(Sender: TObject);
var
  arquivo: string;
begin
  arquivo := ExtractFilePath(ParamStr(0)) + 'Backup.exe';

  if Application.MessageBox('Deseja realmente fazer o Backup do sistema agora?'#13'Mas atenção, seu sistema será finalizado!',
                            'Atenção',
                            MB_ICONQUESTION+MB_YESNO) = id_Yes then
  begin
    winExec(PChar(arquivo),SW_NORMAL);
    Application.Terminate;
  end;
end;

procedure TSIAC.AdicionarCampos;
begin
  try
    ExecutaSQL(DM.QR_Comandos,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_PAF CHAR(1)');
  except
  end;
end;

procedure TSIAC.ExecutaSript;
begin
  if GetEmpresaComunicacao(DM.QR_Consultas) = '01' then //Água de Cheiro - Quixeramobim
  begin
    try
      ExecutaSQL(DM.QR_Comandos,
        'IF (NOT EXISTS (SELECT * FROM CLIENTE WHERE CNC_CODIGO = 5 AND CLI_CODIGO = 1))' +#13+
        'BEGIN'                                                                           +#13+
        '	INSERT INTO CLIENTE	('                                                          +#13+
        '		CNC_CODIGO,'                                                                  +#13+
        '		CLI_CODIGO,'                                                                  +#13+
        '		CLI_NOME_FAN,'                                                                +#13+
        '		CLI_RZ_SOCIAL,'                                                               +#13+
        '		CLI_PESSOA_FISICA,'                                                           +#13+
        '		CLI_SITUACAO)'                                                                +#13+
        '	VALUES'                                                                         +#13+
        '		(5,'                                                                          +#13+
        '		1,'                                                                           +#13+
        '		''CLIENTE BALCÃO'','                                                          +#13+
        '		''CLIENTE BALCÃO'','                                                          +#13+
        '		1,'                                                                           +#13+
        '		1)'                                                                           +#13+
        'END'                                                                            );
    except
    end;

    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET CNF_CLI_A_VISTA = 1');
    except
    end;
  end;

  if DM.Configuracao1.VersaoBase = 102 then
  begin
    try
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM MODULO WHERE MDL_CODIGO = 12');
    except
    end;

    try
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM SUBMODULO WHERE SML_CODIGO IN (44,80,160)');
    except
    end;

    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Auditoria'' WHERE OPS_CODIGO = 2620');
    except
    end;

    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Configurações'' WHERE OPS_CODIGO = 6900');
    except
    end;

    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Acessar SubMenu Cadastro e Relatório'' WHERE OPS_CODIGO = 3410');
    except
    end;

    try
      ExecutaSQL(DM.QR_Comandos,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Acessar Recebimento de Cliente'' WHERE OPS_CODIGO = 3100');
    except
    end;

    try
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM OPERACAO_DO_SISTEMA WHERE OPS_CODIGO IN (6980,4570,3400,2150,8890,6990,8910,1730,1760,1750,1740,530,560,550,540,6950,7940,2630,6550)');
    except
    end;
  end;

  //05/11/2013
  try
    ExecutaSQL(DM.QR_Comandos,
      'IF (NOT EXISTS (SELECT * FROM PARAMETRO WHERE PAR_CODIGO = 495))' +#13+
      'BEGIN'                                                            +#13+
      '	INSERT INTO PARAMETRO'                                           +#13+
      '	VALUES'                                                          +#13+
      '		(495,'                                                         +#13+
      '		4,'                                                            +#13+
      '		0,'                                                            +#13+
      '		''FINANCEIRA'','                                               +#13+
      '		0,'                                                            +#13+
      '		NULL,'                                                         +#13+
      '		NULL,'                                                         +#13+
      '		0,'                                                            +#13+
      '		NULL)'                                                         +#13+
      'END'                                                              );
  except
  end;

  //Excluir as permissões dos menus (serviço e cobrança) para não aparecer o menu
  if not LucianoOtica_AguaDeCheiro_AnaCristina then
  begin
    try
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM PERMISSAO WHERE OPS_CODIGO = 6360');
    except
    end;

    try
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM PERMISSAO WHERE OPS_CODIGO = 2100');
    except
    end;
  end;
  ////////////////////////////////////////////////////////////////////////////////
end;

procedure TSIAC.VE_LocalizacaoCuponsFiscaisExecute(Sender: TObject);
begin
  showmessage('Em desenvolvimento!');
end;

procedure TSIAC.Action69Execute(Sender: TObject);
begin
  mn_SubMenu;
end;


function LucianoOtica_AguaDeCheiro: Boolean;
begin
  Result := (GetEmpresaComunicacao(DM.QR_Consultas) = 'LO') or
            (GetEmpresaComunicacao(DM.QR_Consultas) = 'AC');
end;

function LucianoOtica_AguaDeCheiro_AnaCristina: Boolean;
begin
  Result := (GetEmpresaComunicacao(DM.QR_Consultas) = 'LO') or
            (GetEmpresaComunicacao(DM.QR_Consultas) = 'AC') or
            (GetEmpresaComunicacao(DM.QR_Consultas) = '01');
end;

initialization
begin
end;

end.
