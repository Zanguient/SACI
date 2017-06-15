program PSACI;

(*
GetEmpresaComunicacao(DM.QR_Consultas) = 'AA' ==== Teste
GetEmpresaComunicacao(DM.QR_Consultas) = 'LO' ==== Luciano Ótica
GetEmpresaComunicacao(DM.QR_Consultas) = 'AC' ==== Água de Cheiro
GetEmpresaComunicacao(DM.QR_Consultas) = '01' ==== Água de Cheiro - Quixeramobim
*)

uses
  ShareMem,
  Forms,
  Windows,
  IniFiles,
  SysUtils,
  Dialogs,
  Classes,
  ShellAPI,
  Controls,
  SiacReport_TLB in 'C:\Arquivos de programas\Borland\Delphi7\Imports\SiacReport_TLB.pas',
  uDefKeyGen in 'uDefKeyGen.pas',
  funcoes in 'Funcoes.pas',
  u_ManutencaoNFe in 'u_ManutencaoNFe.pas',
  u_Resources in 'u_Resources.pas',
  DigSenha in 'DigSenha.pas' {DigitaSenha},
  UDM in 'UDM.pas' {DM: TDataModule},
  UPrinc2 in 'UPrinc2.pas' {SIAC},
  u_protecao in '..\Protecao\u_Protecao.pas',
  u_ProtecSerial in '..\Protecao\u_ProtecSerial.pas' {frProtecSerial},
  u_Serial in '..\Protecao\u_Serial.pas',
  CdCliente in 'CdCliente.pas' {fCadCli},
  CdFornecedor in 'CdFornecedor.pas' {fCadFor},
  CdFuncionario in 'CdFuncionario.pas' {fCadFunc},
  CdBanco in 'CdBanco.pas' {fCadBnc},
  CdConta in 'CdConta.pas' {fCadCnt},
  CdTransportador in 'CdTransportador.pas' {fCadTran},
  CdAvalista in 'CdAvalista.pas' {fCadAvalista},
  CdContato in 'CdContato.pas' {fCadCont},
  CdAplFinanc in 'CdAplFinanc.pas' {fCadAplFin},
  CdSolPReposicao in 'CdSolPReposicao.pas' {fCadSolPRep},
  CdSecao in 'CdSecao.pas' {fCadSec},
  CdRegProcura in 'CdRegProcura.pas' {fCadRegProc},
  CdAutorizada in 'CdAutorizada.pas' {fCadAutorizada},
  CdEnviarFornecedor in 'CdEnviarFornecedor.pas' {fCadEnviarFornecedor},
  CdUF_ICMS in 'CdUF_ICMS.pas' {fCadUF_ICMS},
  CdAgFinanceiro in 'CdAgFinanceiro.pas' {fCadAgFinan},
  CdCatProduto in 'CdCatProduto.pas' {fCadCatprod},
  CdUsuario in 'CdUsuario.pas' {fCadUsuario},
  CdParametro in 'CdParametro.pas' {fCadParametro},
  CdOperSist in 'CdOperSist.pas' {fCadOperSist},
  CdCntCaixa in 'CdCntCaixa.pas' {fCadCntCaixa},
  CdOrFiscal in 'CdOrFiscal.pas' {fCadOrFiscal},
  CdServico in 'CdServico.pas' {fCadServico},
  CdTabelaPrecoCliente in 'CdTabelaPrecoCliente.pas' {fCadTabelaPrecoCliente},
  CdCaixa in 'CdCaixa.pas' {fCadCaixa},
  CdClasFisc in 'CdClasFisc.pas' {fCadClasFisc},
  CdForPagam in 'CdForPagam.pas' {fCadForPag},
  CdModulo in 'CdModulo.pas' {fCadModulo},
  CdSubModulo in 'CdSubModulo.pas' {fCadSubModulo},
  CdOperFiscal in 'CdOperFiscal.pas' {fCadOperfiscal},
  CdBancoBoletoCBR454 in 'CdBancoBoletoCBR454.pas' {fCadBancoBoletoCBR454},
  CdConhecimento in 'CdConhecimento.pas' {fCadConhecimento},
  CdControle_de_Vitrine in 'CdControle_de_Vitrine.pas' {fcadControleVitrine},
  CdAgencia in 'CdAgencia.pas' {fCadAgn},
  CdProduto in 'CdProduto.pas' {fCadProdutos},
  CdItemTab in 'CdItemTab.pas' {fCadItemTab},
  CdComunicacao in 'CdComunicacao.pas' {fCadComunicacao},
  CdInfCredito in 'CdInfCredito.pas' {fCadInfCred},
  CdIndexador in 'CdIndexador.pas' {fCadIndex},
  CdGrau in 'CdGrau.pas' {fCadGrau},
  CdBancoBoleto in 'CdBancoBoleto.pas' {fCadBancoBoleto},
  CdAtendimentosPorVendedor in 'CdAtendimentosPorVendedor.pas' {fCadAtendimentosPorVendedor},
  CdReposicaoFornecedor in 'CdReposicaoFornecedor.pas' {fCadReposicaoFornecedor},
  CdLimiteGasto in 'CdLimiteGasto.pas' {fCadLimiteGasto},
  CdVeiculo in 'CdVeiculo.pas' {fCadVeiculo},
  CdProfissao in 'CdProfissao.pas' {fCadProfissao},
  CdLote in 'CdLote.pas' {fCadLote},
  CdGrupo in 'CdGrupo.pas' {fCadGrupo},
  CdSubGrupo in 'CdSubGrupo.pas' {fCadSubGrupo},
  CdCodigoBarras in 'CdCodigoBarras.pas' {fCadCodigoBarras},
  CdInsumos in 'CdInsumos.pas' {fCadInsumos},
  MxSelRegCob in 'MxSelRegCob.pas' {fmxSelRegCob},
  MxSelTransferencia in 'MxSelTransferencia.pas' {fmxSelTransferencia},
  MxSelecionaCheques in 'MxSelecionaCheques.pas' {fMxSelecionaCheques},
  MxSelRegVisitado in 'MxSelRegVisitado.pas' {fmxSelRegVisitado},
  MxSelFaturarPendentesCompra in 'MxSelFaturarPendentesCompra.pas' {fMxSelFaturarPendentesCompra},
  MxSelClienteInad in 'MxSelClienteInad.pas' {fMxSelClienteInad},
//  MxSelIntMemFisc in 'MxSelIntMemFisc.pas' {fMxSelIntMemFisc},
  MxSelConta in 'MxSelConta.pas' {fMxSelConta},
  MxSSelCotacao in 'MxSSelCotacao.pas' {fMxSSelCotacao},
  MxSelLiberarPed in 'MxSelLiberarPed.pas' {fMxSelLiberarReg},
  MxSelImpressora in 'MxSelImpressora.pas' {fmxSelImpressora},
  MxSelInventario in 'MxSelInventario.pas' {fMxSelInventario},
  MxSelMDF in 'MxSelMDF.pas' {fMxSelMDF},
  MxSelFactoring in 'MxSelFactoring.pas' {fMxSelFactoring},
  MxSelInadiplencia in 'MxSelInadiplencia.pas' {fMxSelInadiplencia},
  MxSelPacoteCredito in 'MxSelPacoteCredito.pas' {fMxSelPacoteCredito},
  MxSelDataCentro in 'MxSelDataCentro.pas' {fMxSelDataCentro},
  MxSelEstoqueAnterior in 'MxSelEstoqueAnterior.pas' {fMxSelEstoqueAnterior},
  MxSelFaturamentoFornecedor in 'MxSelFaturamentoFornecedor.pas' {fMxSelFaturamentoFornecedor},
  MxSelDataComissao in 'MxSelDataComissao.pas' {fMxSelDataComissao},
  MxSelSubGrupo in 'MxSelSubGrupo.pas' {fMxSelSubGrupo},
  MxSelCliente in 'MxSelCliente.pas' {fMxSelCliente},
  MxSelAniversario in 'MxSelAniversario.pas' {fMxSelAniversario},
  MxSelBonusVendedor in 'MxSelBonusVendedor.pas' {fMxSelBonusVendedor},
  MxSelQtdEmbarque in 'MxSelQtdEmbarque.pas' {fMxSelQtdEmbarque},
  MxSelDetalhePedido in 'MxSelDetalhePedido.pas' {fMxSelDetalhePedido},
  MxSelMapaTributos in 'MxSelMapaTributos.pas' {fMxSelMapaTributos},
  MxSelPedido in 'MxSelPedido.pas' {fMxSelPedido},
  MxSelPedidos in 'MxSelPedidos.pas' {fMxSelPedidos},
  MxSelPromissoriaRecibo in 'MxSelPromissoriaRecibo.pas' {fMxSelPromissoriaRecibo},
  MxSelOrcamento in 'MxSelOrcamento.pas' {fmxSelOrcamento},
  MxSelResumo in 'MxSelResumo.pas' {fmxSelResumo},
  MxSelOperacao_do_Sistema in 'MxSelOperacao_do_Sistema.pas' {fMxSelOperSist},
  MxSelPacote in 'MxSelPacote.pas' {fMxSelPacote},
  MxSelNotaFiscal in 'MxSelNotaFiscal.pas' {fMxSelNotaFiscal},
  MxSelClienteCurva in 'MxSelClienteCurva.pas' {fMxSelClienteCurva},
  MxSelReservaExterna in 'MxSelReservaExterna.pas' {fMxSelReservaExterna},
  MxSelInsumo in 'MxSelInsumo.pas' {fMxSelInsumo},
  MxSelecionarData in 'MxSelecionarData.pas' {fMxSelecionarData},
  MxSelAgenteFinanceiro in 'MxSelAgenteFinanceiro.pas' {fMxSelAgenteFinanceiro},
  MxSelAssitenciaTecnica in 'MxSelAssitenciaTecnica.pas' {fMxSelAssistenciaTecnica},
  MxSelPendencia in 'MxSelPendencia.pas' {fMxSelPendencia},
  MxSelMovimentoCheque in 'MxSelMovimentoCheque.pas' {fMxSelMovimentoCheque},
  MxSelRegistroBoleto in 'MxSelRegistroBoleto.pas' {fMxSelRegistroBoleto},
  MxSelTitulosReceberRecebidos in 'MxSelTitulosReceberRecebidos.pas' {fMxSelTitulosReceberRecebidos},
  MxSelRelatorioFactoring in 'MxSelRelatorioFactoring.pas' {fMxSelRelatorioFactoring},
  MxSelRelatorioCompra in 'MxSelRelatorioCompra.pas' {fmxSelRelatorioCompra},
  MXSelCentroCusto in 'MXSelCentroCusto.pas' {fMXSelCentroCusto},
  MxSelTitulos in 'MxSelTitulos.pas' {fMxSelTitulos},
  MxSelLog in 'MxSelLog.pas' {fMxSelLog},
  MxSelPermissao in 'MxSelPermissao.pas' {fMxSelPermissao},
  MxSelTarefa in 'MxSelTarefa.pas' {fMxSelTarefa},
  MxSelProm in 'MxSelProm.pas' {fmxSelProm},
  MxSelProdutoCurva in 'MxSelProdutoCurva.pas' {fMxSelProdutoCurva},
  MxSelComparativoForn in 'MxSelComparativoForn.pas' {fMxSelComparativoForn},
  MxSelGrau in 'MxSelGrau.pas' {fMxSelGrau},
  MxSelData in 'MxSelData.pas' {fMxSelData},
  MxSelCobranca in 'MxSelCobranca.pas' {fmxSelCobranca},
  MxSelRecibo in 'MxSelRecibo.pas' {fmxSelRecibo},
  MxSelFaturarPendentes in 'MxSelFaturarPendentes.pas' {fMxSelFaturarPendentes},
  MxSelBonus in 'MxSelBonus.pas' {fMxSelBonus},
  MxSelFornecedor in 'MxSelFornecedor.pas' {fMxSelFornecedor},
  MxSelFuncionario in 'MxSelFuncionario.pas' {fMxSelFuncionario},
  MxSelControleVeiculo in 'MxSelControleVeiculo.pas' {fMxSelControleVeiculo},
  MxSelAtendimentoPorVendedor in 'MxSelAtendimentoPorVendedor.pas' {fMxSelAtendimentoPorVendedor},
  MxSelEmprestimo in 'MxSelEmprestimo.pas' {fMxSelEmprestimo},
  MxSelGerencial in 'MxSelGerencial.pas' {fMxSelGerencial},
  MxSelMovimentoCredito in 'MxSelMovimentoCredito.pas' {fMxSelMovimentoCredito},
  MxCredCli in 'MxCredCli.pas' {fMXCredCli},
  MxBalanco in 'MxBalanco.pas' {fMxBalanco},
  MxDetalhePedidoLuciano in 'MxDetalhePedidoLuciano.pas' {fMxDetalhePedidoLuciano},
  MxAssistenciaTecnica in 'MxAssistenciaTecnica.pas' {fMxAssistenciaTecnica},
  MxSPediDesc in 'MxSPediDesc.pas' {fMxSPedDesc},
  MxTabPrecoSubGrupo in 'MxTabPrecoSubGrupo.pas' {fMxTabPrecoSubGrupo},
  MxLocalizaTabelaPrecoSGP in 'MxLocalizaTabelaPrecoSGP.pas' {fMxLocalizaTabelaPrecoSGP},
  MxSPediCtCus in 'MxSPediCtCus.pas' {fMxSPedCtCus},
  MxCobrancaAdiciona in 'MxCobrancaAdiciona.pas' {fMxCobrancaAdiciona},
  MxS_Tpreco in 'MxS_Tpreco.pas' {fMxSTPreco},
  MxSFuncionario in 'MxSFuncionario.pas' {fMxSFuncionario},
  MxCotacao in 'MxCotacao.pas' {fMxCotacao},
  MxPagar in 'MxPagar.pas' {fMxPagar},
  MxBaixaAutomatica in 'MxBaixaAutomatica.pas' {fMxBaixaAutomatica},
  MxPagBai in 'MxPagBai.pas' {fMxSPagBai},
  MxRecebPedido in 'MxRecebPedido.pas' {fMxRecPed},
  MxSRecParcela in 'MxSRecParcela.pas' {fMxSRecPParc},
  MxCobCobrador in 'MxCobCobrador.pas' {fMxCobCobrador},
  MxNotaFiscal in 'MxNotaFiscal.pas' {fMxNotaFiscal},
  MxItemNF in 'MxItemNF.pas' {fMxSItemNF},
  MxMovCaixa in 'MxMovCaixa.pas' {fMxMovCx},
  MxReserva in 'MxReserva.pas' {fMxReserva},
  MxSRecPedido in 'MxSRecPedido.pas' {fMxSRecPed},
  MxLista_de_Presente in 'MxLista_de_Presente.pas' {fMxListadePresente},
  MxFactoring in 'MxFactoring.pas' {fMxFactoring},
  MxBonus in 'MxBonus.pas' {fMxBonus},
  MxRelPermissao in 'MxRelPermissao.pas' {fMxRelPermis},
  MxRelProduto in 'MxRelProduto.pas' {fMxRelProd},
  MxRelCliente in 'MxRelCliente.pas' {fMxRelCli},
  MxExtornoAvulso in 'MxExtornoAvulso.pas' {fMxExtornoAvulso},
  MxBaixaRec in 'MxBaixaRec.pas' {fMxBaixaRec},
  MxAjustaPrecoCusto in 'MxAjustaPrecoCusto.pas' {fMxAjustaPrecoCusto},
  MxRenegoc in 'MxRenegoc.pas' {fMxReneg},
  MxBaixaPag in 'MxBaixaPag.pas' {fMxBaixaPag},
  MxPerfil in 'MxPerfil.pas' {fMxPerfil},
  MxConfEmb in 'MxConfEmb.pas' {fMxConfEmb},
  MxPreRecebimento in 'MxPreRecebimento.pas' {fMxPreRecebim},
  MxSPediLocImpPromis in 'MxSPediLocImpPromis.pas' {fMxSPedLocImpPromis},
  MxSPediLocLibPed in 'MxSPediLocLibPed.pas' {fMxSPedLocLibPed},
  MxCalcPrecoVenda in 'MxCalcPrecoVenda.pas' {fMxCalcPrecoVenda},
  MxMensagem in 'MxMensagem.pas' {fMxMensagem},
  MxSPediCliHist in 'MxSPediClihist.pas' {fMxSPedCliHist},
  MxMudaSenha in 'MxMudaSenha.pas' {fMxMudaSenha},
  MxSTitAtrazo in 'MxSTitAtrazo.pas' {fMxTitAtrazo},
  MxBoletimAbreCaixa in 'MxBoletimAbreCaixa.pas' {fMxBoletimAbreCaixa},
  MxSInventario in 'MxSInventario.pas' {fMxSInventario},
  MxMovimentoContaCorrente in 'MxMovimentoContaCorrente.pas' {fMxMovimentoContaCorrente},
  MxRegObs in 'MxRegObs.pas' {fmxRegObs},
  MxCliObs in 'MxCliObs.pas' {fmxCliObs},
  MxSNotaFiscal in 'MxSNotaFiscal.pas' {fMxSNotaFiscal},
  MxSTransportadora in 'MxSTransportadora.pas' {fMxSTransportadora},
  MxTrocaProduto in 'MxTrocaProduto.pas' {fmxTrocaProduto},
  MxTrocaProdutoProc in 'MxTrocaProdutoProc.pas' {fMxTrocaProdutoProc},
  MxSaldoDev in 'MxSaldoDev.pas' {fMxSaldoDev},
  MxSTituloPagar in 'MxSTituloPagar.pas' {fMxSTituloPagar},
  MxFotoAmpliada in 'MxFotoAmpliada.pas' {fMxFotoAmpliada},
//  MxAdicionaAliquota in 'MxAdicionaAliquota.pas' {fMxAdicionaAliquota},
  MxSimboloMoeda in 'MxSimboloMoeda.pas' {fMxSimboloMoeda},
//  MxEspacoEntreCupom in 'MxEspacoEntreCupom.pas' {fMxEspacoEntreCupom},
//  MxGraficoAutenticacao in 'MxGraficoAutenticacao.pas' {fMxGraficoAutenticacao},
//  MxItensidadeImpressoraFiscal in 'MxItensidadeImpressoraFiscal.pas' {fMxItensidadeImpressoraFiscal},
//  MxRelatorioGerencial in 'MxRelatorioGerencial.pas' {fMxRelatorioGerencial},
  MxRetCobrador in 'MxRetCobrador.pas' {fMxRetCobr},
  MxInventario in 'MxInventario.pas' {fMxInvent},
  MxValorEntrada in 'MxValorEntrada.pas' {fMxValorEntrada},
  MxVirarData in 'MxVirarData.pas' {fMxVirarData},
  MxCatraca in 'MxCatraca.pas' {fMxCatraca},
  MxCancelarRenegociacao in 'MxCancelarRenegociacao.pas' {fMxCancelarRenegociacao},
//  MxReducaoUltima in 'MxReducaoUltima.pas' {fMxReducaoUltima},
  MxResumoPedido in 'MxResumoPedido.pas' {fMxResumoPedido},
  MxControleEquifax in 'MxControleEquifax.pas' {fMxControleEquifax},
  MxDescontoPedidoCompra in 'MxDescontoPedidoCompra.pas' {fMxDescontoPedidoCompra},
  MxPedidoRapido in 'MxPedidoRapido.pas' {fMxPedidoRapido},
  MxEstoqueGeral in 'MxEstoqueGeral.pas' {fMxEstoqueGeral},
  MxPacoteCredito in 'MxPacoteCredito.pas' {fMxPacoteCredito},
  MxRecebimento in 'MxRecebimento.pas' {fMxRecebim},
  MxTabelaQtdNormal in 'MxTabelaQtdNormal.pas' {fMxTabelaQtdNormal},
  MxCota in 'MxCota.pas' {fMxCota},
  MxEquipe in 'MxEquipe.pas' {fMxEquipe},
  MxLocalizaUsuario in 'MxLocalizaUsuario.pas' {fMxLocalizaUsuario},
  MxMensagemTempo in 'MxMensagemTempo.pas' {fMxMensagemTempo},
  MxManufaturado in 'MxManufaturado.pas' {fMxManufaturado},
  MxInformacoesPedidoDeCompra in 'MxInformacoesPedidoDeCompra.pas' {fMxInformacoesPedidoDeCompra},
  MxFrete in 'MxFrete.pas' {fMxFrete},
  MxCentralMensagem in 'MxCentralMensagem.pas' {fMxCentralMensagem},
  MxCalculadoraFrete in 'MxCalculadoraFrete.pas' {fMxCalculadoraFrete},
  MxAgendaTarefas in 'MxAgendaTarefas.pas' {fMxAgendaTarefas},
  MxLocalizaCEP in 'MxLocalizaCEP.pas' {fMxLocalizaCEP},
  MxLocalizarPacoteVenda in 'MxLocalizarPacoteVenda.pas' {fMxLocalizarPacoteVenda},
  MxSListaPresente in 'MxSListaPresente.pas' {fMxSListaPresente},
  MxSCadastroExtratificado in 'MxSCadastroExtratificado.pas' {fMxSExtratoExtratificado},
  MxSNotaCupom in 'MxSNotaCupom.pas' {fMxSNotaCupom},
  MxGraficoTitulosPagos in 'MxGraficoTitulosPagos.pas' {fMxGraficoTitulosPagos},
  MxGraficoProdutosMaisVendidos in 'MxGraficoProdutosMaisVendidos.pas' {fMxGraficoProdutosMaisVendidos},
  MxEditorTexto in 'MxEditorTexto.pas' {fMxEditorTexto},
  MxProdutoSite in 'MxProdutoSite.pas' {fMxProdutoSite},
  MxTestarImpressora in 'MxTestarImpressora.pas' {fMxTestarImpressora},
  MxFeriados in 'MxFeriados.pas' {fMxFeriados},
  MxAdicionaFeriado in 'MxAdicionaFeriado.pas' {fMxAdicionaFeriado},
  MxGraficoCaixaCD in 'MxGraficoCaixaCD.pas' {fMxGraficoCaixaCD},
  MxGraficoTitulosRecebidos in 'MxGraficoTitulosRecebidos.pas' {fMxGraficoTitulosRecebidos},
  MxGraficoCaixaCDBarras in 'MxGraficoCaixaCDBarras.pas' {fMxGraficoCaixaCDBarras},
  MxGraficoAtendimentosPorVendedor in 'MxGraficoAtendimentosPorVendedor.pas' {fMxGraficoAtendimentosPorVendedor},
  MxDevolucaoPed in 'MxDevolucaoPed.pas' {fMxDevPed},
  MxFinalizaPedido in 'MxFinalizaPedido.pas' {fMxFinalizaPedido},
  MxReceber in 'MxReceber.pas' {fMxReceber},
  MxTabelaDescontos in 'MxTabelaDescontos.pas' {fMxTabelaDescontos},
  MxSCotaFor in 'MxSCotaFor.pas' {fMxSCotaFor},
  MxAlterarParcelas in 'MxAlterarParcelas.pas' {fMxAlterarParcelas},
  MxBonificacaoAmostra in 'MxBonificacaoAmostra.pas' {fMxBonificacaoAmostra},
  MxControleSPC in 'MxControleSPC.pas' {fMxControleSPC},
  MxImpresoraCheque in 'MxImpresoraCheque.pas' {fMxImpressoraCheque},
  MxEmbarque in 'MxEmbarque.pas' {fMxEmbarque},
  MxLocalizaPacote in 'MxLocalizaPacote.pas' {fMxLocalizaPacote},
  MxSPediProdMotCal in 'MxSPediProdMotCal.pas' {fMxSPedProdMotCal},
  MxSobre in 'MxSobre.pas' {fMxSobre},
  MxPedCompra in 'MxPedCompra.pas' {fMxPedComp},
  MxServicoLBM in 'MxServicoLBM.pas' {fMxServicoLBM},
  MxFaturarPendentesConvenio in 'MxFaturarPendentesConvenio.pas' {fMxFaturarPendentesConvenio},
  MxVerificaEstoque in 'MxVerificaEstoque.pas' {fMxVerificaEstoque},
  MxPacoteVenda in 'MxPacoteVenda.pas' {fMxPacoteVenda},
  MxSituacaoServico in 'MxSituacaoServico.pas' {fMxSituacaoServico},
  MxCalculaTroco in 'MxCalculaTroco.pas' {fMxCalculaTroco},
  MxFluxoDeCaixa in 'MxFluxoDeCaixa.pas' {fMxFluxoDeCaixa},
  MxSPediLoc in 'MxSPediLoc.pas' {fMxSPedLoc},
  MxFiltraCobranca in 'MxFiltraCobranca.pas' {fMxFiltraCobranca},
  MxSPediProd in 'MxSPediProd.pas' {fMxSPedProd},
  MxSVendasCliente in 'MxSVendasCliente.pas' {fMxSVendasCliente},
  MxVerificaCaixa in 'MxVerificaCaixa.pas' {fMxVerificaCaixa},
  MxEmprestimo in 'MxEmprestimo.pas' {fMxEmprestimo},
  MxVerificarMercadoria in 'MxVerificarMercadoria.pas' {fMxVerificarMercadoria},
  MxPrecoCusto in 'MxPrecoCusto.pas' {fMxPrecoCusto},
  MxSPreRecRec in 'MxSPreRecRec.pas' {fMxSPreRecRec},
  MxImportarDados in 'MxImportarDados.pas' {fMxImportarDados},
  MxCalculoAdicao in 'MxCalculoAdicao.pas' {fMxCaluloAdicao},
  MxBoletimFechaCaixa in 'MxBoletimFechaCaixa.pas' {fMxBoletimFechaCaixa},
  MxTransferencia in 'MxTransferencia.pas' {fMxTransfer},
  MxServico in 'MxServico.pas' {fMxServico},
  MxPedSCompra in 'MxPedSCompra.pas' {fMxPedSCompra},
  MxDescontoPedido in 'MxDescontoPedido.pas' {fMxDescontoPedido},
  MxLocalizaNotaCupom in 'MxLocalizaNotaCupom.pas' {fMxLocalizaNotaCupom},
  MxCheque in 'MxCheque.pas' {fMxCheque},
  MxDetalhePedido in 'MxDetalhePedido.pas' {fMxDetalhePedido},
  MxSPediTab in 'MxSPediTab.pas' {fMxSPedTab},
  MxLocalizaTabelaPreco in 'MxLocalizaTabelaPreco.pas' {fMxLocalizaTabelaPreco},
  MxTabPreco in 'MxTabPreco.pas' {fMxTabPreco},
  MxGraficoMediaAnual in 'MxGraficoMediaAnual.pas' {fMxGraficoMediaAnual},
  MxGraficoFaturamentoVendas in 'MxGraficoFaturamentoVendas.pas' {fMxGraficoFaturamentoVendas},
  MxControleSerasa in 'MxControleSerasa.pas' {fMxControleSerasa},
  MxFaturarPendentesCompra in 'MxFaturarPendentesCompra.pas' {fMxFaturarPendentesCompra},
  MxReabrirPedido in 'MxReabrirPedido.pas' {fMxReabrirPedido},
  MxControleVeiculo in 'MxControleVeiculo.pas' {fMxControleVeiculo},
  MxReabrirPacote in 'MxReabrirPacote.pas' {fMxReabrirPacote},
  MxSEstEntrada in 'MxSEstEntrada.pas' {fMxSEstEntrada},
  MxFaturarPendentes in 'MxFaturarPendentes.pas' {fMxFaturarPendentes},
  MxSPediLocComp in 'MxSPediLocComp.pas' {fMxSPedLocComp},
  MxGraficoVendasVendedor in 'MxGraficoVendasVendedor.pas' {fMxGraficoVendasVendedor},
  MxGraficoMetaPorVendedor in 'MxGraficoMetaPorVendedor.pas' {fMxGraficoMetaPorVendedor},
  MxCalculaFrete in 'MxCalculaFrete.pas' {fMxCalculaFrete},
  MxPendencia in 'MxPendencia.pas' {fMxPendencia},
  MxPedidoMotCal_2 in 'MxPedidoMotCal_2.pas' {fMxPedidoMotCal_2},
  MxPedidoMotCal in 'MxPedidoMotCal.pas' {fMxPedidoMotCal},
  MxPagarAvulsoCPD1 in 'MxPagarAvulsoCPD1.pas' {fMxPagarAvulsoCPD1},
  MxRecebAvulsoCPD1 in 'MxRecebAvulsoCPD1.pas' {fMxRecebAvulsoCPD1},
  MxSelPecasReposicao in 'MxSelPecasReposicao.pas' {fMxSelPecasReposicao},
  MxSelEnviaCobranca in 'MxSelEnviaCobranca.pas' {fMxSelEnviaCobranca},
  MxExportarDados in 'MxExportarDados.pas' {fMxExportarDados},
  URecebidosSPC in '..\Relatorios\URecebidosSPC.pas' {rpt_RecebidosSPC},
  URelData2 in 'URelData2.pas' {rpt_Data2},
  ULista_de_Presente in '..\Relatorios\ULista_de_Presente.pas' {rpt_ListaPresente},
  UComissaoLBM in '..\Relatorios\UComissaoLBM.pas' {rpt_ComissaoVsadfLBM},
  UEnviaCobradorProd in 'UEnviaCobradorProd.pas' {rpt_EnviaCoradorProd},
  UMxAjustePreco in 'UMxAjustePreco.pas' {fMxAjustePreco},
  UBoletoBancarioLBM in '..\Relatorios\UBoletoBancarioLBM.pas' {rpt_BoletoBancarioLBM},
  URelDataCobr in 'URelDataCobr.pas' {rpt_DataCobr},
  UContato in '..\Relatorios\UContato.pas' {rpt_contato},
  UFornecedor in '..\Relatorios\UFornecedor.pas' {rpt_fornecedor},
  UTransportadoras in '..\Relatorios\UTransportadoras.pas' {rpt_transportadoras},
  UEstoqueAnterior in '..\Relatorios\UEstoqueAnterior.pas' {rpt_EstoqueAnterior},
  UReservaExterna in '..\Relatorios\UReservaExterna.pas' {rpt_ReservaExterna},
  UProcura_Mercadoria in '..\Relatorios\UProcura_Mercadoria.pas' {rpt_Procura_Mercadoria},
  UAvalista in '..\Relatorios\UAvalista.pas' {rpt_avalista},
  UVendedor in '..\Relatorios\UVendedor.pas' {rpt_vendedor},
  UClienteEtiquetas in '..\Relatorios\UClienteEtiquetas.pas' {rpt_clienteEtiquetas},
  UUF_ICMS in '..\Relatorios\UUF_ICMS.pas' {rpt_UF_ICMS},
  Urpt_bonusvendedor in '..\Relatorios\Urpt_bonusvendedor.pas' {rpt_BonusVendedor},
  UAgencia in '..\Relatorios\UAgencia.pas' {rpt_agencia},
  UAplic_Financeira in '..\Relatorios\UAplic_Financeira.pas' {rpt_Aplic_financeira},
  UBancos in '..\Relatorios\UBancos.pas' {rpt_Bancos},
  UCentro_de_custo in '..\Relatorios\UCentro_de_custo.pas' {rpt_Centro_de_custo},
  UIndex_economico in '..\Relatorios\UIndex_economico.pas' {rpt_Index_economico},
  UConta_bancaria in '..\Relatorios\UConta_bancaria.pas' {rpt_Conta},
  UCateg_de_produtos in '..\Relatorios\UCateg_de_produtos.pas' {rpt_Cat_de_produtos},
  UClass_fiscal in '..\Relatorios\UClass_fiscal.pas' {rpt_Class_fiscal},
  UOrigem_fiscal in '..\Relatorios\UOrigem_fiscal.pas' {rpt_Origem_fiscal},
  UProdutoSite in '..\Relatorios\UProdutoSite.pas' {rpt_ProdutoSite},
  UOperacaoFiscal in '..\Relatorios\UOperacaoFiscal.pas' {rpt_OperacaoFiscal},
  UComparativoForn in '..\Relatorios\UComparativoForn.pas' {rpt_ComparativoForn},
  UFuncionario in '..\Relatorios\UFuncionario.pas' {rpt_Funcionario},
  USecao in '..\Relatorios\USecao.pas' {rpt_secao},
  UTipo_parametro in '..\Relatorios\UTipo_parametro.pas' {rpt_Tipo_param},
  UUsuario in '..\Relatorios\UUsuario.pas' {rpt_Usuario},
  UPreferencia_Cliente in '..\Relatorios\UPreferencia_Cliente.pas' {rpt_PreferenciaCliente},
  UTitulosExcluidos in '..\Relatorios\UTitulosExcluidos.pas' {rpt_TitulosExcluidos},
  UPagar in '..\Relatorios\UPagar.pas' {rpt_Pagar},
  UPrevisaoReceita in '..\Relatorios\UPrevisaoReceita.pas' {rpt_PrevisaoReceita},
  UBaixaPag in '..\Relatorios\UBaixaPag.pas' {rpt_BaixaPag},
  UFluxoCaixa in '..\Relatorios\UFluxoCaixa.pas' {rpt_FluxoCaixa},
  UComissaoMotical in '..\Relatorios\UComissaoMotical.pas' {rpt_ComissaoMotical},
  UFluxoCaixaDiaLBM in '..\Relatorios\UFluxoCaixaDiaLBM.pas' {rpt_FluxoCaixaDiaLBM},
  UAnalSAfim in '..\Relatorios\UAnalSAfim.pas' {rpt_SAfim},
  UAnalSCliente in '..\Relatorios\UAnalSCliente.pas' {rpt_DadosCli},
  UAnalSHistorico in '..\Relatorios\UAnalSHistorico.pas' {rpt_SHistorico},
  UAnalSRegCobran in '..\Relatorios\UAnalSRegCobran.pas' {rpt_SCobran},
  UCobrador in '..\Relatorios\UCobrador.pas' {rpt_cobrador},
  UCli_Inadimp in '..\Relatorios\UCli_Inadimp.pas' {rpt_cli_Inadimp},
  UConta_de_Caixa in '..\Relatorios\UConta_de_Caixa.pas' {rpt_cnt_caixa},
  UConta_contabil in '..\Relatorios\UConta_contabil.pas' {rpt_conta_contabil},
  UFornProd in '..\Relatorios\UFornProd.pas' {rpt_fornprod},
  UServicoEProduto in '..\Relatorios\UServicoEProduto.pas' {rpt_ServicoEProduto},
  UProdForn in '..\Relatorios\UProdForn.pas' {rpt_prodforn},
  UOp_Relator in '..\Relatorios\UOp_Relator.pas' {Op_Relator},
  UOp_RelatSubGrp in '..\Relatorios\UOp_RelatSubGrp.pas' {Op_RelatSubGrp},
  UProdSubGrup in '..\Relatorios\UProdSubGrup.pas' {rpt_prodSubGrup},
  UPromissoria2 in '..\Relatorios\UPromissoria2.pas' {rpt_Promissoria2},
  UAgen_Financeiro in '..\Relatorios\UAgen_Financeiro.pas' {rpt_agen_financeiro},
  UVerificaCaixa in '..\Relatorios\UVerificaCaixa.pas' {rpt_VerificaCaixa},
  UFluxoCaixaDia2 in '..\Relatorios\UFluxoCaixaDia2.pas' {rpt_FluxoCaixaDia2},
  UOp_RelatGrup in '..\Relatorios\UOp_RelatGrup.pas' {Op_RelatGrup},
  UTransferenciaNecessaria in '..\Relatorios\UTransferenciaNecessaria.pas' {rpt_TransferenciaNecessaria},
  UTituloAbertos in '..\Relatorios\UTituloAbertos.pas' {rpt_TituloAbertos},
  UCarnet in '..\Relatorios\Ucarnet.pas' {rpt_carnet},
  UHistCliResumo in '..\Relatorios\UHistCliResumo.pas' {rpt_HistCliResumo},
  uMovCheque in '..\Relatorios\uMovCheque.pas' {rpt_MovCheque},
  UItemEmbarque in '..\Relatorios\UItemEmbarque.pas' {rpt_ItemEmbarque},
  Urpt_Recebimento in '..\Relatorios\Urpt_Recebimento.pas' {rpt_Recebimentos},
  URelTransReceb in '..\Relatorios\URelTransReceb.pas' {rpt_TransReceb},
  UHistCliTit in '..\Relatorios\UHistCliTit.pas' {rpt_HistCliTit},
  UListaoInvent in '..\Relatorios\UListaoInvent.pas' {rpt_ListaoInvent},
  URelacaoDespesas in '..\Relatorios\URelacaoDespesas.pas' {rpt_RelacaoDespesas},
  UReceberMensal2 in '..\Relatorios\UReceberMensal2.pas' {rpt_ReceberMensal2},
  URecebidosMensal2 in '..\Relatorios\URecebidosMensal2.pas' {rpt_RecebidosMensal2},
  UPagarMensal2 in '..\Relatorios\UPagarMensal2.pas' {rpt_PagarMensal2},
  UPagosMensal2 in '..\Relatorios\UPagosMensal2.pas' {rpt_PagosMensal2},
  UPedidosMensal in '..\Relatorios\UPedidosMensal.pas' {rpt_PedidosMensal},
  UProdutosInvent in '..\Relatorios\UProdutosInvent.pas' {rpt_ProdutosInvent},
  URetornoCobrador in '..\Relatorios\URetornoCobrador.pas' {rpt_RetornoCobrador},
  UComisCobr in '..\Relatorios\UComisCobr.pas' {rpt_ComisCobr},
  UOrcamento in '..\Relatorios\UOrcamento.pas' {rpt_Orcamento},
  Urpt_InadiplenciaCliente in '..\Relatorios\Urpt_InadiplenciaCliente.pas' {rpt_InadiplenciaCliente},
  UEnviaCobrador in '..\Relatorios\UEnviaCobrador.pas' {rpt_CartaCobranca},
  Urpt_CotacaoCompleta in 'Urpt_CotacaoCompleta.pas' {rpt_CotacaoCompleta},
  uEstoqueDetalhado in '..\Relatorios\uEstoqueDetalhado.pas' {rpt_estoqueDetalhado},
  UPedidoVendaItemPDV in '..\Relatorios\UPedidoVendaItemPDV.pas' {rpt_PedidoVendaItemPDV},
  UComissaoVendaCompletoQtd in '..\Relatorios\UComissaoVendaCompletoQtd.pas' {rpt_ComissaoVendaCompletoQtd},
  URel_Transferencias in '..\Relatorios\URel_Transferencias.pas' {rpt_transferencias},
  UPromissoria in '..\Relatorios\UPromissoria.pas' {rpt_Promissoria},
  UCarnetMotical in '..\Relatorios\UCarnetMotical.pas' {rpt_CarnetMotical},
  UReceberMensal in '..\Relatorios\UReceberMensal.pas' {rpt_ReceberMensal},
  URecebidosMensal in '..\Relatorios\URecebidosMensal.pas' {rpt_RecebidosMensal},
  UPagarMensal in '..\Relatorios\UPagarMensal.pas' {rpt_PagarMensal},
  UPagosMensal in '..\Relatorios\UPagosMensal.pas' {rpt_PagosMensal},
  UPreRecRec in '..\Relatorios\UPreRecRec.pas' {rpt_PreRecRec},
  UMaioresFornecedores in '..\Relatorios\UMaioresFornecedores.pas' {rpt_MaioresFornecedores},
  Urpt_PreReceb in '..\Relatorios\Urpt_PreReceb.pas' {rpt_PreRecebimento},
  UInventario in '..\Relatorios\UInventario.pas' {rpt_Inventario},
  Urpt_Receb in '..\Relatorios\Urpt_Receb.pas' {rpt_Recebimento},
  UTipoVendas in '..\Relatorios\UTipoVendas.pas' {rpt_TipoVendas},
  Urpt_InadiplenciaEspecial in '..\Relatorios\Urpt_InadiplenciaEspecial.pas' {rpt_InadiplenciaEspecial},
  UTitAtrazo in '..\Relatorios\UTitAtrazo.pas' {rpt_TitAtrazo},
  Urpt_TestarImpressora in '..\Relatorios\Urpt_TestarImpressora.pas' {rpt_TestarImpressora},
  uPedidoVendaCodigoPreco in '..\Relatorios\uPedidoVendaCodigoPreco.pas' {rpt_PedidoVendaCodigoPreco},
  uMovEstoqueFisico in '..\Relatorios\uMovEstoqueFisico.pas' {rpt_MovEstoqueFisico},
  uMovAmostraFiscal in '..\Relatorios\uMovAmostraFiscal.pas' {rpt_MovEstoqueAmostraFiscal},
  UCartaCobranca in '..\Relatorios\UCartaCobranca.pas' {rpt_EnviaCobrador},
  URelDataPromessa in 'URelDataPromessa.pas' {rpt_DataPromessa},
  UPacote in '..\Relatorios\UPacote.pas' {rpt_Pacote},
  UEnviaSPC in '..\Relatorios\UEnviaSPC.pas' {rpt_EnviaSPC},
  uPedidoVendaDARUMA in '..\Relatorios\uPedidoVendaDARUMA.pas' {rpt_PedidoVendaDARUMA},
  UPacoteCredito in '..\Relatorios\UPacoteCredito.pas' {rpt_PacoteCredito},
  UEnviadosSPC in '..\Relatorios\UEnviadosSPC.pas' {rpt_EnviadosSPC},
  UCredito in '..\Relatorios\UCredito.pas' {rpt_Credito},
  UReciboLBMGrafica in '..\Relatorios\UReciboLBMGrafica.pas' {rpt_ReciboLBMGrafica},
  UCadastroExtratificado in '..\Relatorios\UCadastroExtratificado.pas' {rpt_CadastroExtratificado},
  UClienteAniversariante in '..\Relatorios\UClienteAniversariante.pas' {rpt_clienteAniversariante},
  UClienteAniversarianteRelatorio in '..\Relatorios\UClienteAniversarianteRelatorio.pas' {rpt_clienteAniversarianteRelatorio},
  URenegociacao in '..\Relatorios\URenegociacao.pas' {rpt_Renegociacao},
  URelData in 'URelData.pas' {rpt_Data},
  USugestaoCmp in '..\Relatorios\USugestaoCmp.pas' {rpt_SugestaoCmp},
  UCaixa in '..\Relatorios\UCaixa.pas' {rpt_caixa},
  Urpt_bonus in '..\Relatorios\Urpt_bonus.pas' {rpt_Bonus},
  UCalculaFrete in '..\Relatorios\UCalculaFrete.pas' {rpt_CalculaFrete},
  UBaseReal in '..\Relatorios\UBaseReal.pas' {rpt_BaseReal},
  UComissao in '..\Relatorios\UComissao.pas' {rpt_Comissao},
  URelDataVend in 'URelDataVend.pas' {rpt_DataVend},
  UNotaFiscalPetromax in '..\Relatorios\UNotaFiscalPetromax.pas' {rpt_NotaFiscalPetromax},
  UDescontos in 'UDescontos.pas' {fMxDescontos},
  UTelaCalculaFrete in '..\Relatorios\UTelaCalculaFrete.pas' {rpt_TelaCalculaFrete},
  UNotaFiscalAgruparAgente in '..\Relatorios\UNotaFiscalAgruparAgente.pas' {rpt_NotaFiscalAgruparAgente},
  UTelaEstoque in '..\Relatorios\UTelaEstoque.pas' {rpt_TelaEstoque},
  UNotaFiscal in '..\Relatorios\UNotaFiscal.pas' {rpt_NotaFiscal},
  UDevolucaoParcial in '..\Relatorios\UDevolucaoParcial.pas' {rpt_DevolucaoParcial},
  UVendasVendedor in '..\Relatorios\UVendasVendedor.pas' {rpt_VendasVendedor},
  UFactoring in '..\Relatorios\UFactoring.pas' {rpt_Factoring},
  UHistCliEmbarque in '..\Relatorios\UHistCliEmbarque.pas' {rpt_HistCliEmbarque},
  UImprimirCopiaCheque in '..\Relatorios\UImprimirCopiaCheque.pas' {rpt_ImprimirCopiaCheque},
  UNotaFiscalLBM in '..\Relatorios\UNotaFiscalLBM.pas' {rpt_NotaFiscalLBM},
  UNotaFiscalCompleta in '..\Relatorios\UNotaFiscalCompleta.pas' {rpt_NotaFiscalCompleta},
  UVendasClienteProduto in '..\Relatorios\UVendasClienteProduto.pas' {rpt_VendasClienteProduto},
  UProdutoSubGrupo in '..\Relatorios\UProdutoSubGrupo.pas' {rpt_produtoSubGrupo},
  USaldoVendas in 'USaldoVendas.pas' {rpt_SaldoVendas},
  UExtratoCliente in '..\Relatorios\UExtratoCliente.pas' {rpt_ExtratoCliente},
  URegistroDuplicata in '..\Relatorios\URegistroDuplicata.pas' {rpt_RegistroDuplicata},
  UForma_de_pagamento in '..\Relatorios\UForma_de_pagamento.pas' {rpt_forma_pagamento},
  URel_Embar in '..\Relatorios\URel_Embar.pas' {rpt_embarque},
  UReciboCompletoLBM in '..\Relatorios\UReciboCompletoLBM.pas' {rpt_ReciboCompletoLBM},
  UReciboTotalLBM in '..\Relatorios\UReciboTotalLBM.pas' {rpt_ReciboTotalLBM},
  UBoletoBancario in 'UBoletoBancario.pas' {rpt_BoletoBancario},
  UVendasDesconto in '..\Relatorios\UVendasDesconto.pas' {rpt_VendasDesconto},
  UFluxoCaixaDia in '..\Relatorios\UFluxoCaixaDia.pas' {rpt_FluxoCaixaDia},
  UImprimirChequeBNB in '..\Relatorios\UImprimirChequeBNB.pas' {rpt_ImprimirChequeBNB},
  UImprimirCheque in '..\Relatorios\UImprimirCheque.pas' {rpt_ImprimirCheque},
  UImprimirChequeBEC in '..\Relatorios\UImprimirChequeBEC.pas' {rpt_ImprimirChequeBEC},
  UImprimirChequeCEF in '..\Relatorios\UImprimirChequeCEF.pas' {rpt_ImprimirChequeCEF},
  UReciboLBM in '..\Relatorios\UReciboLBM.pas' {rpt_ReciboLBM},
  Urpt_Cotacao in '..\Relatorios\Urpt_Cotacao.pas' {rpt_Cotacao},
  UImprimirChequeBradesco in '..\Relatorios\UImprimirChequeBradesco.pas' {rpt_ImprimirChequeBradesco},
  UNotaFiscalRel in '..\Relatorios\UNotaFiscalRel.pas' {rpt_NotaFiscalRel},
  UMapaTributos in '..\Relatorios\UMapaTributos.pas' {rpt_MapaTributos},
  UPrev_vendas in '..\Relatorios\UPrev_vendas.pas' {rpt_prev_vendas},
  UHistCli in '..\Relatorios\UHistCli.pas' {rpt_HistCli},
  UFactoringGrafico in '..\Relatorios\UFactoringGrafico.pas' {rpt_FactoringGrafico},
  UFaturamentoLBM in '..\Relatorios\UFaturamentoLBM.pas' {rpt_FaturamentoLBM},
  UFaturarPendentesConvenio in '..\Relatorios\UFaturarPendentesConvenio.pas' {rpt_FaturarPendentesConvenio},
  UCotaComissao in '..\Relatorios\UCotaComissao.pas' {rpt_CotaComissao},
  UCliente in '..\Relatorios\UCliente.pas' {rpt_cliente},
  USubgrupo in '..\Relatorios\USubgrupo.pas' {rpt_subgrupo},
  UQtdNormalVenda in '..\Relatorios\UQtdNormalVenda.pas' {rpt_QtdNormalVenda},
  UTabelaDeCusto in '..\Relatorios\UTabelaDeCusto.pas' {rpt_TabelaDeCusto},
  UGrau in '..\Relatorios\UGrau.pas' {rpt_Grau},
  UCodigoBarras in '..\Relatorios\UCodigoBarras.pas' {rpt_CodigoBarras},
  UTabelaCompra in 'UTabelaCompra.pas' {rpt_TabelaCompra},
  UCurvaABCCliente in '..\Relatorios\UCurvaABCCliente.pas' {rpt_CurvaAbcCliente},
  UCurvaABCProduto in '..\Relatorios\UCurvaABCProduto.pas' {rpt_CurvaAbcProduto},
  UOperacao_sistema in '..\Relatorios\UOperacao_sistema.pas' {rpt_OperSist},
  UInsumos in '..\Relatorios\UInsumos.pas' {rpt_Insumos},
  UProduto_Colunas in '..\Relatorios\UProduto_Colunas.pas' {rpt_produto_Colunas},
  UComparativoAnual in '..\Relatorios\UComparativoAnual.pas' {rpt_ComparativoAnual},
  UControleVitrine in '..\Relatorios\UControleVitrine.pas' {rpt_Controle_de_Vitrine},
  UFaturamentoFornecedor2 in '..\Relatorios\UFaturamentoFornecedor2.pas' {rpt_FaturamentoFornecedor2},
  URelDataCompra in 'URelDataCompra.pas' {rpt_DataCompra},
  UTabelaDescontos in '..\Relatorios\UTabelaDescontos.pas' {rpt_TabelaDescontos},
  UPacotesCliente in '..\Relatorios\UPacotesCliente.pas' {rpt_PacotesCliente},
  UPedidoVendaItemPDVRed2 in '..\Relatorios\uPedidoVendaItemPDVRed2.pas' {rpt_PedidoVendaItemPDVRed2},
  UNotaFiscalMotCalServico in '..\Relatorios\UNotaFiscalMotCalServico.pas' {rpt_NotaFiscalMotCalServico},
  UNotaFiscalEletro in '..\Relatorios\UNotaFiscalEletro.pas' {rpt_NotaFiscalEletro},
  UPedidoVendaMotical in '..\Relatorios\UPedidoVendaMotical.pas' {rpt_PedidoVendaMotical},
  UPacoteRemessa in '..\Relatorios\UPacoteRemessa.pas' {rpt_PacoteRemessa},
  UReposicaoGrafico in '..\Relatorios\UReposicaoGrafico.pas' {rpt_ReposicaoGrafico},
  UHistorCompras in '..\Relatorios\UHistorCompras.pas' {rpt_HistorCompras},
  UPendencia_reposicao in '..\Relatorios\UPendencia_reposicao.pas' {rpt_pendencia_reposicao},
  UfMxSProdutoData in 'UfMxSProdutoData.pas' {fMxSProdutoData},
  uMovEstoqueLJ4 in '..\Relatorios\uMovEstoqueLJ4.pas' {rpt_MovEstoqueLJ4},
  UEmprestimoCompleto in '..\Relatorios\UEmprestimoCompleto.pas' {rpt_EmprestimoCompleto},
  UPedidoServicoLBMEsp in '..\Relatorios\UPedidoServicoLBMEsp.pas' {rpt_PedidoServicoLBMEsp},
  UTabelaPreco in '..\Relatorios\UTabelaPreco.pas' {rpt_TabelaPreco},
  UTabelaPrecoSubGrupo in '..\Relatorios\UTabelaPrecoSubGrupo.pas' {rpt_TabelaPrecoSubGrupo},
  UEtiquetaServico in '..\Relatorios\UEtiquetaServico.pas' {rpt_EtiquetaServico},
  UComissaoNova in '..\Relatorios\UComissaoNova.pas' {rpt_ComissaoNova},
  UVerificarMercadoria in '..\Relatorios\UVerificarMercadoria.pas' {rpt_VerificarMercadoria},
  URegistroBoleto in '..\Relatorios\URegistroBoleto.pas' {rpt_RegistroBoleto},
  UMDF in '..\Relatorios\UMDF.pas' {rpt_MDF},
  UReposicaoFornecedor in '..\Relatorios\UReposicaoFornecedor.pas' {rpt_ReposicaoFornecedor},
  UPapeletaDeRecebimento in '..\Relatorios\UPapeletaDeRecebimento.pas' {rpt_PapeletaDeRecebimento},
  URel_Transf in '..\Relatorios\URel_Transf.pas' {rpt_transferencia},
  UPendencia in '..\Relatorios\UPendencia.pas' {rpt_Pendencia},
  UNotaFiscalLuciano in '..\Relatorios\UNotaFiscalLuciano.pas' {rpt_NotaFiscalLuciano},
  UReciboPagamento in '..\Relatorios\UReciboPagamento.pas' {rpt_ReciboPagamento},
  UBalancete in '..\Relatorios\UBalancete.pas' {rpt_Balancete},
  UCarnetLuciano in '..\Relatorios\UCarnetLuciano.pas' {rpt_CarnetLuciano},
  UTarefa in '..\Relatorios\UTarefa.pas' {rpt_Tarefa},
  UComissao2 in '..\Relatorios\UComissao2.pas' {rpt_Comissao2},
  uMovCredito in '..\Relatorios\uMovCredito.pas' {rpt_MovCredito},
  UFaturamentoFornecedor in '..\Relatorios\UFaturamentoFornecedor.pas' {rpt_FaturamentoFornecedor},
  UImprimirChequeReal in '..\Relatorios\UImprimirChequeReal.pas' {rpt_ImprimirChequeReal},
  UCheques in '..\Relatorios\UCheques.pas' {rpt_cheques},
  UPedidoServicoLuciano in '..\Relatorios\UPedidoServicoLuciano.pas' {rpt_PedidoServicoLuciano},
  UComissaoGerente in '..\Relatorios\UComissaoGerente.pas' {rpt_ComissaoGerente},
  UEtiquetaUsuario in '..\Relatorios\UEtiquetaUsuario.pas' {rpt_EtiquetaUsuario},
  Urpt_Log in '..\Relatorios\Urpt_Log.pas' {rpt_Log},
  UImprimirChequeBB in '..\Relatorios\UImprimirChequeBB.pas' {rpt_ImprimirChequeBB},
  Urpt_Permissao in '..\Relatorios\Urpt_Permissao.pas' {rpt_Permissao},
  UVendasCliente in '..\Relatorios\UVendasCliente.pas' {rpt_VendasCliente},
  uMovEstoqueAmostra in '..\Relatorios\uMovEstoqueAmostra.pas' {rpt_MovEstoqueAmostra},
  UReceber in '..\Relatorios\UReceber.pas' {rpt_Receber},
  UBaixaRec in '..\Relatorios\UBaixaRec.pas' {rpt_BaixaRec},
  UPedidoServicoLBM in '..\Relatorios\UPedidoServicoLBM.pas' {rpt_PedidoServicoLBM},
  UOp_RelatProd in '..\Relatorios\UOp_RelatProd.pas' {Op_RelatProd},
  UNotaFiscalMotCal in '..\Relatorios\UNotaFiscalMotCal.pas' {rpt_NotaFiscalMotCal},
  UCotacaoGrafico in 'UCotacaoGrafico.pas' {rpt_CotacaoGrafico},
  UPedidoServicoGrafico in '..\Relatorios\UPedidoServicoGrafico.pas' {rpt_PedidoServicoGrafico},
  UCarnetCont in '..\Relatorios\UCarnetCont.pas' {rpt_CarnetCont},
  UMapaTributosGeral in '..\Relatorios\UMapaTributosGeral.pas' {rpt_MapaTributosGeral},
  UComprovanteLJ3 in '..\Relatorios\UComprovanteLJ3.pas' {rpt_ComprovanteLJ3},
  UClienteAniversarianteLUOTICA in '..\Relatorios\UClienteAniversarianteLUOTICA.pas' {rpt_clienteAniversarianteLUOTICA},
  UProduto in '..\Relatorios\UProduto.pas' {rpt_produto},
  UFaturarPendentesCompras in '..\Relatorios\UFaturarPendentesCompras.pas' {rpt_FaturarPendentesCompras},
  UTitulosReceberRecebidos in '..\Relatorios\UTitulosReceberRecebidos.pas' {rpt_TitulosReceberRecebidos},
  UParametro in '..\Relatorios\UParametro.pas' {rpt_Parametro},
  UFormSplash in 'UFormSplash.pas' {fmxFormSplash},
  UProdGrupo in '..\Relatorios\UProdGrupo.pas' {rpt_prodgrupo},
  UComissaoVendaLBM in '..\Relatorios\UComissaoVendaLBM.pas' {rpt_ComissaoLBM},
  UServicosEfetuados in '..\Relatorios\UServicosEfetuados.pas' {rpt_ServicosEfetuados},
  UAssistenciaTecnica in '..\Relatorios\UAssistenciaTecnica.pas' {rpt_AssistenciaTecnica},
  uMovEstoqueSN in '..\Relatorios\uMovEstoqueSN.pas' {rpt_MovEstoqueSN},
  uEstoque in '..\Relatorios\uEstoque.pas' {rpt_estoque},
  uMovEstoqueComercial in '..\Relatorios\uMovEstoqueComercial.pas' {rpt_MovEstoqueComercial},
  uMovBonificacaoFiscal in '..\Relatorios\uMovBonificacaoFiscal.pas' {rpt_MovEstoqueBonificacaoFiscal},
  uMovEstoque in '..\Relatorios\uMovEstoque.pas' {rpt_MovEstoque},
  uMovEstoqueBonificacao in '..\Relatorios\uMovEstoqueBonificacao.pas' {rpt_MovEstoqueBonificacao},
  UPedidoCompra in 'UPedidoCompra.pas' {rpt_PedidoCompra},
  UBoletim in '..\Relatorios\UBoletim.pas' {rpt_Boletim},
  UFaturarPendentes in '..\Relatorios\UFaturarPendentes.pas' {rpt_FaturarPendentes},
  UAtendimentosPorVendedor in '..\Relatorios\UAtendimentosPorVendedor.pas' {rpt_AtendimentosPorVendedor},
  URelDataProd in 'URelDataProd.pas' {rpt_DataProd},
  UOrdemDeServico in '..\Relatorios\UOrdemDeServico.pas' {rpt_OrdemDeServico},
  UPedidoServicoCompleto in '..\Relatorios\UPedidoServicoCompleto.pas' {rpt_PedidoServicoCompleto},
  UProfissao in '..\Relatorios\UProfissao.pas' {rpt_Profissao},
  UComprovanteMovimento in '..\Relatorios\UComprovanteMovimento.pas' {rpt_ComprovanteMovimento},
  UComprasXVendas in '..\Relatorios\UComprasXVendas.pas' {rpt_Compras_X_Vendas},
  UComprovanteControleVeiculo in '..\Relatorios\UComprovanteControleVeiculo.pas' {rpt_ComprovanteControleVeiculo},
  UReciboGrafico in '..\Relatorios\UReciboGrafico.pas' {rpt_ReciboGrafico},
  UOrcamentoGrafico in '..\Relatorios\UOrcamentoGrafico.pas' {rpt_OrcamentoGrafico},
  UControleVeiculo in '..\Relatorios\UControleVeiculo.pas' {rpt_ControleVeiculo},
  Urpt_Inadiplencia in '..\Relatorios\Urpt_Inadiplencia.pas' {rpt_Inadiplencia},
  URecibo in '..\Relatorios\URecibo.pas' {rpt_Recibo},
  UGrupo in '..\Relatorios\UGrupo.pas' {rpt_grupo},
  UVeiculo in '..\Relatorios\UVeiculo.pas' {rpt_Veiculo},
  uEstoqueLote1 in '..\Relatorios\uEstoqueLote1.pas' {rpt_estoqueLote1},
  UComissaoVendaCompleto in '..\Relatorios\UComissaoVendaCompleto.pas' {rpt_ComissaoVendaCompleto},
  UClienteCadastro in '..\Relatorios\UClienteCadastro.pas' {rpt_clienteCadastro},
  UEmprestimo in '..\Relatorios\UEmprestimo.pas' {rpt_Emprestimo},
  UCartaTitulosAtrasoZRep in '..\Relatorios\UCartaTitulosAtrasoZRep.pas' {rpt_CartaTitulosAtrasoZRep},
  UPedidoVendaParcelasPDV in '..\Relatorios\UPedidoVendaParcelasPDV.pas' {rpt_PedidoVendaParcelasPDV},
  UPosEstoqueLote in 'UPosEstoqueLote.pas' {fmxProdEstoqueLote},
  URelPosEstoqueLote in '..\Relatorios\URelPosEstoqueLote.pas' {rpt_PosEstoqueLote},
  UPedidoRX in '..\Relatorios\UPedidoRX.pas' {fmxPedidoRX},
  ULimite_de_Gasto in '..\Relatorios\ULimite_de_Gasto.pas' {rpt_Limite_Gasto},
  UBoletoBancarioLuciano in '..\Relatorios\UBoletoBancarioLuciano.pas' {rpt_BoletoBancarioLuciano},
  URelGerencial in '..\Relatorios\URelGerencial.pas' {rpt_Gerencial},
  untRelPlanoContas in '..\Relatorios\untRelPlanoContas.pas' {frmRelPlanoContas},
  untTransferirCobranca in 'untTransferirCobranca.pas' {frmTransferirCobranca},
  UComprasXVendasLuciano in '..\Relatorios\UComprasXVendasLuciano.pas' {rpt_Compras_X_VendasLuciano},
  u_pesquisa_subgrupo in 'u_pesquisa_subgrupo.pas' {f_pesquisa_subgrupo},
  untCarta in 'untCarta.pas' {frmCarta},
  untCarta2 in '..\Relatorios\untCarta2.pas' {rpt_Carta2},
  MxConsignacao in 'MxConsignacao.pas' {fMxConsignacao},
  MxSConsignacao in 'MxSConsignacao.pas' {fMxSConsignacao},
  MxSelConsignacaoVenda in 'MxSelConsignacaoVenda.pas' {fMxSelConsignacaoVenda},
  URelConsignacao in 'URelConsignacao.pas' {fMxRelConsignacao},
  UConsignacao in '..\Relatorios\UConsignacao.pas' {rpt_Consignacao},
  URelConsignacaoAnalitico in '..\Relatorios\URelConsignacaoAnalitico.pas' {rpt_URelConsignacaoAnalitico},
  UConsignacaoSomenteItens in '..\Relatorios\UConsignacaoSomenteItens.pas' {rpt_UConsignacaoSomenteItens},
  CdEnviaComunicacao in '..\Comunicação\CdEnviaComunicacao.pas' {frmEnviaComunicacao},
  UComunicacao in '..\Comunicação\UComunicacao.pas',
  CdRecebeComunicacao in '..\Comunicação\CdRecebeComunicacao.pas' {frmRecebeComunicacao},
  UPrincComunicacao in '..\Comunicação\UPrincComunicacao.pas' {frmPrincComunicacao},
  UConfComunicacao in '..\Comunicação\UConfComunicacao.pas' {frmConfComunicacao},
  ULogComunicacao in '..\Comunicação\ULogComunicacao.pas' {frmLogComunicacao},
  UDM_Comunicacao in '..\Comunicação\UDM_Comunicacao.pas' {DMComunicacao: TDataModule},
  u_DefLibWebBrowser in '..\LibWebBrowser\u_DefLibWebBrowser.pas',
  u_Framework in '..\Projeto\u_Framework.pas',
  uSQL in 'uSQL.pas' {frmSQL},
  UDMFB in 'UDMFB.pas' {DMFB: TDataModule},
  u_ListaPedidoPAF in 'u_ListaPedidoPAF.pas' {frmListaPedidoPAF};

{$R *.RES}
{$R ..\Resources\PATUAL.RES} //PAtualizaSACI.exe
{$R ..\Resources\UPLOAD.RES} //DownloadSACI.exe é renomeado para AtualizaSistema.exe
{$R ..\Resources\SIACDA.RES} //Dal.dll
{$R ..\Resources\SIACRP.RES} //SiacReport.dll
{$R ..\Resources\BACKUP.RES} //Backup.exe    

Var
  Login: TDigitaSenha;
  Hand1, Hand2: HWND;
  FormSplash: TfmxFormSplash;

  (*ESSE CÓDIGO DEVE SER REMOVIDO DEPOIS QUE FOR ENVIADO ESSA VERSÃO PARA A LUCIANO ÓTICA*)
  procedure CodTemporario;
  var
    ServerIni: TIniFile;
  begin
    if FileExists(cArquivoConfiguracao) then
    begin
      ServerIni := TIniFile.Create(cArquivoConfiguracao);
      try
        ServerIni.WriteString('PROTECAO','COD_01','2BC09D9B');
        ServerIni.WriteString('PROTECAO','COD_02','C4BD');
        ServerIni.WriteString('PROTECAO','COD_03','4906');
        ServerIni.WriteString('PROTECAO','COD_04','A871');
        ServerIni.WriteString('PROTECAO','COD_05','8514DEDC0509');
        ServerIni.WriteString('PROTECAO','SENHA_01','0');
        ServerIni.WriteString('PROTECAO','SENHA_02','0');
      finally
        ServerIni.Free;
      end;
    end;
  end;
  (**)

  procedure ExtraiArquivos;
  begin
    Extrai_AtualizaSistema;
    Extrai_PAtualizaSACI;
    Extrai_Dal;
    Extrai_SiacReport;
    Extrai_Backup;
  end;

Begin
  sListLog := TStringList.Create;
  CodTemporario;
  ExtraiArquivos;

  if not TemProtecao then
    TfrProtecSerial.Execute;

  if TemProtecao then
  begin
    f_SkinGerenciador := False; (*Será parametrizado*)
    f_InformacoesProduto;

    DataLimite := GetDataLimite;
    f_Sistema  := tsGerenciador;
    Login      := nil;
    Hand1      := FindWindow('TSIAC',PChar('SIAC - Sistema Integrado de Automação Comercial / Versão: ' + f_VersaoSistema));
    Hand2      := FindWindow('TDigitaSenha','SIAC - Senha de Acesso');
    if Hand1 <> 0 then
    Begin
      ShowMessage('O Sistema já está ativo!');
      SetForegroundWindow(Hand1);
      ShowWindow(Hand1, SW_RESTORE);
    end
    else if Hand2 <> 0 then
    Begin
      ShowMessage('O Sistema já está ativo!');
      SetForegroundWindow(Hand2);
      ShowWindow(Hand2, SW_RESTORE);
    end
    else
    Begin
      Try
        Login := TDigitaSenha.Create(Application);
        formLogin:=Login;
        Login.ShowModal;
      finally
        Login.Free;
      end;

      FormSplash := TfMxFormSplash.Create(Application);
      if UsuLogin > 0 then
      Begin
        FormSplash.Show;
        FormSplash.Refresh;
        if not ComputadorDoProgramador then
          Sleep(1000);
      end;

      Application.Initialize;
      FormSplash.Gauge1.Progress:= 20;
      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      Application.Title := 'SIAC';
      FormSplash.Gauge1.Progress:= 25;
      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      FormSplash.Gauge1.Progress:= 30;
      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      FormSplash.Gauge1.Progress:= 40;
      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      Application.CreateForm(TDM, DM);
      FormSplash.Gauge1.Progress:= 50;

      Application.CreateForm(TDMFB, DMFB);
      FormSplash.Gauge1.Progress:= 55;

      {Caso o arquivo de conexão com o banco não exista, ele chama a tela de conexão e cria o arquivo}
      if not FileExists('Siac.udl') then
        TStringList.Create().SaveToFile('Siac.udl')
      else
      begin
        if ExecutaComunicacao then
          Application.CreateForm(TDMComunicacao, DMComunicacao);
      end;
      FormSplash.Gauge1.Progress:= 60;

      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      FormSplash.Gauge1.Progress:= 70;
      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      FormSplash.Gauge1.Progress:= 80;
      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      Application.CreateForm(TSIAC, SIAC);
      FormSplash.Gauge1.Progress:= 85;
      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      FormSplash.Gauge1.Progress:= 90;
      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      FormSplash.Gauge1.Progress:= 95;
      FormSplash.Refresh;
      if not ComputadorDoProgramador then
        Sleep(100);

      if FormSplash <> nil then
      Begin
        if UsuLogin > 0 then
        Begin
          FormSplash.Gauge1.Progress:= 100;
          FormSplash.Refresh;
          if not ComputadorDoProgramador then
            Sleep(100);

          FormSplash.Hide;
          if not ComputadorDoProgramador then
            Sleep(1000);
        end;
        FormSplash.free;
      end;

      Application.Run;
    end;
  end
  else
    Application.MessageBox('Proteção não inicializada!','Proteção',MB_ICONERROR + MB_OK);
end.
