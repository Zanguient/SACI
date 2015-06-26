-------------------------------------------------------------------------------------------------------
UPDATE AGENCIA_CONF SET AGN_CODIGO = (SELECT ISNULL(MAX(AGN_CODIGO),0) FROM AGENCIA)
-------------------------------------------------------------------------------------------------------
UPDATE AGENTE_FINANCEIRO_CONF SET AGF_CODIGO = (SELECT ISNULL(MAX(AGF_CODIGO),0) FROM AGENTE_FINANCEIRO)
-------------------------------------------------------------------------------------------------------
UPDATE ASSISTENCIA_TECNICA_CONF SET AST_CODIGO = (SELECT ISNULL(MAX(AST_CODIGO),0) FROM ASSISTENCIA_TECNICA)
-------------------------------------------------------------------------------------------------------
UPDATE ASSISTENCIA_TECNICA_DEPOSITO_CONF SET ASD_CODIGO = (SELECT ISNULL(MAX(ASD_CODIGO),0) FROM ASSISTENCIA_TECNICA_DEPOSITO)
-------------------------------------------------------------------------------------------------------
UPDATE ATENDIMENTO_POR_VENDEDOR_CONF SET APV_CODIGO = (SELECT ISNULL(MAX(APV_CODIGO),0) FROM ATENDIMENTO_POR_VENDEDOR)
-------------------------------------------------------------------------------------------------------
UPDATE AUTENTICACAO_CONF SET ATN_CODIGO = (SELECT ISNULL(MAX(ATN_CODIGO),0) FROM AUTENTICACAO)
-------------------------------------------------------------------------------------------------------
UPDATE AUTORIZADA_CONF SET AUT_CODIGO = (SELECT ISNULL(MAX(AUT_CODIGO),0) FROM AUTORIZADA)
-------------------------------------------------------------------------------------------------------
UPDATE AVALISTA_CONF SET AVL_CODIGO = (SELECT ISNULL(MAX(AVL_CODIGO),0) FROM AVALISTA)
-------------------------------------------------------------------------------------------------------
UPDATE BAIXA_TITULO_CONF SET BXT_CODIGO = (SELECT ISNULL(MAX(BXT_CODIGO),0) FROM BAIXA_TITULO)
-------------------------------------------------------------------------------------------------------
UPDATE BALANCO_CONF SET BLC_CODIGO = (SELECT ISNULL(MAX(BLC_CODIGO),0) FROM BALANCO)
-------------------------------------------------------------------------------------------------------
UPDATE BANCO_CONF SET BNC_CODIGO = (SELECT ISNULL(MAX(BNC_CODIGO),0) FROM BANCO)
-------------------------------------------------------------------------------------------------------
UPDATE BANCO_BOLETO_CONF SET BNB_CODIGO = (SELECT ISNULL(MAX(BNB_CODIGO),0) FROM BANCO_BOLETO)
-------------------------------------------------------------------------------------------------------
UPDATE BOLETIM_DIARIO_CONF SET BLD_CODIGO = (SELECT ISNULL(MAX(BLD_CODIGO),0) FROM BOLETIM_DIARIO)
-------------------------------------------------------------------------------------------------------
UPDATE BONUS_CONF SET BON_CODIGO = (SELECT ISNULL(MAX(BON_CODIGO),0) FROM BONUS)
-------------------------------------------------------------------------------------------------------
UPDATE CAIXA_CONF SET CAX_CODIGO = (SELECT ISNULL(MAX(CAX_CODIGO),0) FROM CAIXA)
-------------------------------------------------------------------------------------------------------
UPDATE CATEGORIA_DE_PRODUTO_CONF SET CTP_CODIGO = (SELECT ISNULL(MAX(CTP_CODIGO),0) FROM CATEGORIA_DE_PRODUTO)
-------------------------------------------------------------------------------------------------------
UPDATE CENTRO_DE_CUSTO_CONF SET CNC_CODIGO = (SELECT ISNULL(MAX(CNC_CODIGO),0) FROM CENTRO_DE_CUSTO)
-------------------------------------------------------------------------------------------------------
UPDATE CHEQUE_CONF SET CHQ_CODIGO = (SELECT ISNULL(MAX(CHQ_CODIGO),0) FROM CHEQUE)
-------------------------------------------------------------------------------------------------------
UPDATE CLASSIFICACAO_FISCAL_CONF SET CLF_CODIGO = (SELECT ISNULL(MAX(CLF_CODIGO),0) FROM CLASSIFICACAO_FISCAL)
-------------------------------------------------------------------------------------------------------
UPDATE CLIENTE_CONF SET CLI_CODIGO = (SELECT ISNULL(MAX(CLI_CODIGO),0) FROM CLIENTE)
-------------------------------------------------------------------------------------------------------
UPDATE COBRANCA_POR_COBRADOR_CONF SET CPC_CODIGO = (SELECT ISNULL(MAX(CPC_CODIGO),0) FROM COBRANCA_POR_COBRADOR)
-------------------------------------------------------------------------------------------------------
UPDATE CODIGO_DE_BARRAS_CONF SET CDB_CODIGO = (SELECT ISNULL(MAX(CDB_CODIGO),0) FROM CODIGO_DE_BARRAS)
-------------------------------------------------------------------------------------------------------
UPDATE COMPRA_CONF SET CMP_CODIGO = (SELECT ISNULL(MAX(CMP_CODIGO),0) FROM COMPRA)
-------------------------------------------------------------------------------------------------------
UPDATE COMUNICACAO_CONF SET COM_CODIGO = (SELECT ISNULL(MAX(COM_CODIGO),0) FROM COMUNICACAO)
-------------------------------------------------------------------------------------------------------
UPDATE CONTA_BANCARIA_CONF SET CBN_CODIGO = (SELECT ISNULL(MAX(CBN_CODIGO),0) FROM CONTA_BANCARIA)
-------------------------------------------------------------------------------------------------------
UPDATE CONTA_CONTABIL_CONF SET CCT_CODIGO = (SELECT ISNULL(MAX(CCT_CODIGO),0) FROM CONTA_CONTABIL)
-------------------------------------------------------------------------------------------------------
UPDATE CONTA_CORRENTE_DO_CC_CONF SET CCC_CODIGO = (SELECT ISNULL(MAX(CCC_CODIGO),0) FROM CONTA_CORRENTE_DO_CC)
-------------------------------------------------------------------------------------------------------
UPDATE CONTA_DE_CAIXA_CONF SET CCX_CODIGO = (SELECT ISNULL(MAX(CCX_CODIGO),0) FROM CONTA_DE_CAIXA)
-------------------------------------------------------------------------------------------------------
UPDATE CONTATO_CONF SET CNT_CODIGO = (SELECT ISNULL(MAX(CNT_CODIGO),0) FROM CONTATO)
-------------------------------------------------------------------------------------------------------
UPDATE CONTROLE_DE_VITRINE_CONF SET CVT_CODIGO = (SELECT ISNULL(MAX(CVT_CODIGO),0) FROM CONTROLE_DE_VITRINE)
-------------------------------------------------------------------------------------------------------
UPDATE CONTROLE_ENVIO_CPD_CONF SET CEC_CODIGO = (SELECT ISNULL(MAX(CEC_CODIGO),0) FROM CONTROLE_ENVIO_CPD)
-------------------------------------------------------------------------------------------------------
UPDATE CONTROLE_ENVIO_FILIAL_CONF SET CEF_CODIGO = (SELECT ISNULL(MAX(CEF_CODIGO),0) FROM CONTROLE_ENVIO_FILIAL)
-------------------------------------------------------------------------------------------------------
UPDATE CONTROLE_RECEBIMENTO_CPD_CONF SET CRC_CODIGO = (SELECT ISNULL(MAX(CRC_CODIGO),0) FROM CONTROLE_RECEBIMENTO_CPD)
-------------------------------------------------------------------------------------------------------
UPDATE CONTROLE_RECEBIMENTO_FILIAL_CONF SET CRF_CODIGO = (SELECT ISNULL(MAX(CRF_CODIGO),0) FROM CONTROLE_RECEBIMENTO_FILIAL)
-------------------------------------------------------------------------------------------------------
UPDATE CONTROLE_VEICULO_CONF SET MTV_CODIGO = (SELECT ISNULL(MAX(MTV_CODIGO),0) FROM CONTROLE_VEICULO)
-------------------------------------------------------------------------------------------------------
UPDATE COTA_CONF SET COT_CODIGO = (SELECT ISNULL(MAX(COT_CODIGO),0) FROM COTA)
-------------------------------------------------------------------------------------------------------
UPDATE CUSTO_CONF SET CUS_CODIGO = (SELECT ISNULL(MAX(CUS_CODIGO),0) FROM CUSTO)
-------------------------------------------------------------------------------------------------------
UPDATE DESCONTOS_CONF SET DES_CODIGO = (SELECT ISNULL(MAX(DES_CODIGO),0) FROM DESCONTOS)
-------------------------------------------------------------------------------------------------------
UPDATE DIREITO_DE_BONUS_CONF SET DIB_CODIGO = (SELECT ISNULL(MAX(DIB_CODIGO),0) FROM DIREITO_DE_BONUS)
-------------------------------------------------------------------------------------------------------
UPDATE EMBARQUE_CONF SET EMB_CODIGO = (SELECT ISNULL(MAX(EMB_CODIGO),0) FROM EMBARQUE)
-------------------------------------------------------------------------------------------------------
UPDATE EMPRESTIMO_CONF SET EMP_CODIGO = (SELECT ISNULL(MAX(EMP_CODIGO),0) FROM EMPRESTIMO)
-------------------------------------------------------------------------------------------------------
UPDATE ENVIA_DADOS_EMBARQUE_CONF SET CDE_CODIGO = (SELECT ISNULL(MAX(CDE_CODIGO),0) FROM ENVIA_DADOS_EMBARQUE)
-------------------------------------------------------------------------------------------------------
UPDATE ENVIA_DADOS_NOTA_CONF SET CDN_CODIGO = (SELECT ISNULL(MAX(CDN_CODIGO),0) FROM ENVIA_DADOS_NOTA)
-------------------------------------------------------------------------------------------------------
UPDATE ENVIA_FORNECEDOR_CONF SET ENF_CODIGO = (SELECT ISNULL(MAX(ENF_CODIGO),0) FROM ENVIA_FORNECEDOR)
-------------------------------------------------------------------------------------------------------
UPDATE FACTORING_CONF SET FCT_CODIGO = (SELECT ISNULL(MAX(FCT_CODIGO),0) FROM FACTORING)
-------------------------------------------------------------------------------------------------------
UPDATE FATOR_DE_FINANCEIRA_CONF SET FAF_CODIGO = (SELECT ISNULL(MAX(FAF_CODIGO),0) FROM FATOR_DE_FINANCEIRA)
-------------------------------------------------------------------------------------------------------
UPDATE FATOR_DE_FINANCEIRA_CONF SET FAF_CODIGO = 0
-------------------------------------------------------------------------------------------------------
UPDATE FORMA_DE_PAGAMENTO_CONF SET FPG_CODIGO = (SELECT ISNULL(MAX(FPG_CODIGO),0) FROM FORMA_DE_PAGAMENTO)
-------------------------------------------------------------------------------------------------------
UPDATE FORNECEDOR_CONF SET FOR_CODIGO = (SELECT ISNULL(MAX(FOR_CODIGO),0) FROM FORNECEDOR)
-------------------------------------------------------------------------------------------------------
UPDATE FUNCIONARIO_CONF SET FUN_CODIGO = (SELECT ISNULL(MAX(FUN_CODIGO),0) FROM FUNCIONARIO)
-------------------------------------------------------------------------------------------------------
UPDATE GRAU_CONF SET GRA_CODIGO = (SELECT ISNULL(MAX(GRA_CODIGO),0) FROM GRAU)
-------------------------------------------------------------------------------------------------------
UPDATE GRUPO_CONF SET GRP_CODIGO = (SELECT ISNULL(MAX(GRP_CODIGO),0) FROM GRUPO)
-------------------------------------------------------------------------------------------------------
UPDATE INDEXADOR_ECONOMICO_CONF SET IDE_CODIGO = (SELECT ISNULL(MAX(IDE_CODIGO),0) FROM INDEXADOR_ECONOMICO)
-------------------------------------------------------------------------------------------------------
UPDATE INFORMACOES_DE_CREDITO_CONF SET CLI_CODIGO = (SELECT ISNULL(MAX(CLI_CODIGO),0) FROM INFORMACOES_DE_CREDITO)
-------------------------------------------------------------------------------------------------------
UPDATE INSUMO_CONF SET INS_CODIGO = (SELECT ISNULL(MAX(INS_CODIGO),0) FROM INSUMO)
-------------------------------------------------------------------------------------------------------
UPDATE INVENTARIO_CONF SET INV_CODIGO = (SELECT ISNULL(MAX(INV_CODIGO),0) FROM INVENTARIO)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_BONUS_CONF SET IBN_CODIGO = (SELECT ISNULL(MAX(IBN_CODIGO),0) FROM ITEM_DE_BONUS)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_COBRANCA_COBRADOR_CONF SET ICC_CODIGO = (SELECT ISNULL(MAX(ICC_CODIGO),0) FROM ITEM_DE_COBRANCA_COBRADOR)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_COTA_CONF SET ICA_CODIGO = (SELECT ISNULL(MAX(ICA_CODIGO),0) FROM ITEM_DE_COTA)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_EMBARQUE_CONF SET IEB_CODIGO = (SELECT ISNULL(MAX(IEB_CODIGO),0) FROM ITEM_DE_EMBARQUE)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_ESTOQUE_CONF SET PRD_CODIGO = (SELECT ISNULL(MAX(PRD_CODIGO),0) FROM ITEM_DE_ESTOQUE)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_ESTOQUE_DETALHE_CONF SET IED_CODIGO = (SELECT ISNULL(MAX(IED_CODIGO),0) FROM ITEM_DE_ESTOQUE_DETALHE)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_FACTORING_CONF SET IFC_CODIGO = (SELECT ISNULL(MAX(IFC_CODIGO),0) FROM ITEM_DE_FACTORING)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_INVENTARIO_CONF SET IIV_CODIGO = (SELECT ISNULL(MAX(IIV_CODIGO),0) FROM ITEM_DE_INVENTARIO)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_LISTA_DE_PRESENTE_CONF SET ILP_CODIGO = (SELECT ISNULL(MAX(ILP_CODIGO),0) FROM ITEM_DE_LISTA_DE_PRESENTE)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_MANUFATURADO_CONF SET IMF_CODIGO = (SELECT ISNULL(MAX(IMF_CODIGO),0) FROM ITEM_DE_MANUFATURADO)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_MAPA_DE_COTACAO_CONF SET ICT_CODIGO = (SELECT ISNULL(MAX(ICT_CODIGO),0) FROM ITEM_DE_MAPA_DE_COTACAO)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_NOTA_FISCAL_CONF SET INF_CODIGO = (SELECT ISNULL(MAX(INF_CODIGO),0) FROM ITEM_DE_NOTA_FISCAL)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_PEDIDO_DE_COMPRA_CONF SET IPC_CODIGO = (SELECT ISNULL(MAX(IPC_CODIGO),0) FROM ITEM_DE_PEDIDO_DE_COMPRA)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_PEDIDO_DE_VENDA_CONF SET IPV_CODIGO = (SELECT ISNULL(MAX(IPV_CODIGO),0) FROM ITEM_DE_PEDIDO_DE_VENDA)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_PRE_RECEBIMENTO_CONF SET IPR_CODIGO = (SELECT ISNULL(MAX(IPR_CODIGO),0) FROM ITEM_DE_PRE_RECEBIMENTO)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_RECEBIMENTO_CONF SET IRC_CODIGO = (SELECT ISNULL(MAX(IRC_CODIGO),0) FROM ITEM_DE_RECEBIMENTO)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_TABELA_DE_PRECO_CONF SET ITP_CODIGO = (SELECT ISNULL(MAX(ITP_CODIGO),0) FROM ITEM_DE_TABELA_DE_PRECO)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_TABELA_DE_PRECO_SUBGRUPO_CONF SET ITS_CODIGO = (SELECT ISNULL(MAX(ITS_CODIGO),0) FROM ITEM_DE_TABELA_DE_PRECO_SUBGRUPO)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_TRANSFERENCIA_CONF SET ITR_CODIGO = (SELECT ISNULL(MAX(ITR_CODIGO),0) FROM ITEM_DE_TRANSFERENCIA)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_TROCA_CONF SET ITO_CODIGO = (SELECT ISNULL(MAX(ITO_CODIGO),0) FROM ITEM_DE_TROCA)
-------------------------------------------------------------------------------------------------------
UPDATE LIMITE_GASTO_CONF SET LMG_CODIGO = (SELECT ISNULL(MAX(LMG_CODIGO),0) FROM LIMITE_GASTO)
-------------------------------------------------------------------------------------------------------
UPDATE LISTA_DE_PRESENTE_CONF SET LSP_CODIGO = (SELECT ISNULL(MAX(LSP_CODIGO),0) FROM LISTA_DE_PRESENTE)
-------------------------------------------------------------------------------------------------------
UPDATE LIVRO_CAIXA_CONF SET LCX_CODIGO = (SELECT ISNULL(MAX(LCX_CODIGO),0) FROM LIVRO_CAIXA)
-------------------------------------------------------------------------------------------------------
UPDATE LOG_CONF SET LOG_CODIGO = (SELECT ISNULL(MAX(LOG_CODIGO),0) FROM LOG)
-------------------------------------------------------------------------------------------------------
UPDATE LOTE_CONF SET LOT_CODIGO = (SELECT ISNULL(MAX(LOT_CODIGO),0) FROM LOTE)
-------------------------------------------------------------------------------------------------------
UPDATE MANUFATURADO_CONF SET MFA_CODIGO = (SELECT ISNULL(MAX(MFA_CODIGO),0) FROM MANUFATURADO)
-------------------------------------------------------------------------------------------------------
UPDATE MAPA_DE_COTACAO_CONF SET MCT_CODIGO = (SELECT ISNULL(MAX(MCT_CODIGO),0) FROM MAPA_DE_COTACAO)
-------------------------------------------------------------------------------------------------------
UPDATE MENSAGEM_CONF SET MSG_CODIGO = (SELECT ISNULL(MAX(MSG_CODIGO),0) FROM MENSAGEM)
-------------------------------------------------------------------------------------------------------
UPDATE MENSAGEM_CPD_CONF SET MSC_CODIGO = (SELECT ISNULL(MAX(MSG_CODIGO),0) FROM MENSAGEM_CPD)
-------------------------------------------------------------------------------------------------------
UPDATE MODULO_CONF SET MDL_CODIGO = (SELECT ISNULL(MAX(MDL_CODIGO),0) FROM MODULO)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_CONTA_CORRENTE_CONF SET MCC_CODIGO = (SELECT ISNULL(MAX(MCC_CODIGO),0) FROM MOVIMENTO_CONTA_CORRENTE)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_CAIXA_CONF SET MVC_CODIGO = (SELECT ISNULL(MAX(MVC_CODIGO),0) FROM MOVIMENTO_DE_CAIXA)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_CHEQUE_CONF SET MCH_CODIGO = (SELECT ISNULL(MAX(MCH_CODIGO),0) FROM MOVIMENTO_DE_CHEQUE)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_CREDITO_CONF SET MCR_CODIGO = (SELECT ISNULL(MAX(MCR_CODIGO),0) FROM MOVIMENTO_DE_CREDITO)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_ESTOQUE_COM_CONF SET MEC_CODIGO = (SELECT ISNULL(MAX(MEC_CODIGO),0) FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_ESTOQUE_FISC_CONF SET MES_CODIGO = (SELECT ISNULL(MAX(MES_CODIGO),0) FROM MOVIMENTO_DE_ESTOQUE_FISCAL)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_ESTOQUE_FIS_CONF SET MEF_CODIGO = (SELECT ISNULL(MAX(MEF_CODIGO),0) FROM MOVIMENTO_DE_ESTOQUE_FISICO)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_ESTOQUE_IND_CONF SET MEI_CODIGO = (SELECT ISNULL(MAX(MEI_CODIGO),0) FROM MOVIMENTO_DE_ESTOQUE_INDISP)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_ESTOQUE_LJ4_CONF SET ML4_CODIGO = (SELECT ISNULL(MAX(ML4_CODIGO),0) FROM MOVIMENTO_DE_ESTOQUE_LJ4)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_ESTOQUE_SN_CONF SET MSN_CODIGO = (SELECT ISNULL(MAX(MSN_CODIGO),0) FROM MOVIMENTO_DE_ESTOQUE_SN)
-------------------------------------------------------------------------------------------------------
UPDATE MOVIMENTO_DE_LIVRO_CAIXA_CONF SET MLC_CODIGO = (SELECT ISNULL(MAX(MLC_CODIGO),0) FROM MOVIMENTO_DE_LIVRO_CAIXA)
-------------------------------------------------------------------------------------------------------
UPDATE NOTA_FISCAL_CONF SET NTF_CODIGO = (SELECT ISNULL(MAX(NTF_CODIGO),0) FROM NOTA_FISCAL)
-------------------------------------------------------------------------------------------------------
UPDATE ORIGEM_FISCAL_CONF SET ORF_CODIGO = (SELECT ISNULL(MAX(ORF_CODIGO),0) FROM ORIGEM_FISCAL)
-------------------------------------------------------------------------------------------------------
UPDATE PACOTE_DE_CREDITO_CONF SET PCR_CODIGO = (SELECT ISNULL(MAX(PCR_CODIGO),0) FROM PACOTE_DE_CREDITO)
-------------------------------------------------------------------------------------------------------
UPDATE PARAMETRO_CONF SET PAR_CODIGO = (SELECT ISNULL(MAX(PAR_CODIGO),0) FROM PARAMETRO)
-------------------------------------------------------------------------------------------------------
UPDATE PEDIDO_DE_COMPRA_CONF SET PCP_CODIGO = (SELECT ISNULL(MAX(PCP_CODIGO),0) FROM PEDIDO_DE_COMPRA)
-------------------------------------------------------------------------------------------------------
UPDATE PEDIDO_DE_VENDA_CONF SET PDV_CODIGO = (SELECT ISNULL(MAX(PDV_CODIGO),0) FROM PEDIDO_DE_VENDA)
-------------------------------------------------------------------------------------------------------
UPDATE PENDENCIA_CONF SET PEN_CODIGO = (SELECT ISNULL(MAX(PEN_CODIGO),0) FROM PENDENCIA)
-------------------------------------------------------------------------------------------------------
UPDATE PENDENCIA_CPD_CONF SET PEC_CODIGO = (SELECT ISNULL(MAX(PEC_CODIGO),0) FROM PENDENCIA_CPD)
-------------------------------------------------------------------------------------------------------
UPDATE PERMISSAO_CONF SET PRM_CODIGO = (SELECT ISNULL(MAX(PRM_CODIGO),0) FROM PERMISSAO)
-------------------------------------------------------------------------------------------------------
UPDATE PRE_RECEBIMENTO_CONF SET PRC_CODIGO = (SELECT ISNULL(MAX(PRC_CODIGO),0) FROM PRE_RECEBIMENTO)
-------------------------------------------------------------------------------------------------------
UPDATE PRODUTO_CONF SET PRD_CODIGO = (SELECT ISNULL(MAX(PRD_CODIGO),0) FROM PRODUTO)
-------------------------------------------------------------------------------------------------------
UPDATE PRODUTO_POR_FORNECEDOR_CONF SET PRD_CODIGO = (SELECT ISNULL(MAX(PRD_CODIGO),0) FROM PRODUTO_POR_FORNECEDOR)
-------------------------------------------------------------------------------------------------------
UPDATE PROFISSAO_CONF SET PRF_CODIGO = (SELECT ISNULL(MAX(PRF_CODIGO),0) FROM PROFISSAO)
-------------------------------------------------------------------------------------------------------
UPDATE QUANTIDADE_NORMAL_VENDA_CONF SET QNV_CODIGO = (SELECT ISNULL(MAX(QNV_CODIGO),0) FROM QUANTIDADE_NORMAL_VENDA)
-------------------------------------------------------------------------------------------------------
UPDATE RECEBIMENTO_CONF SET REC_CODIGO = (SELECT ISNULL(MAX(REC_CODIGO),0) FROM RECEBIMENTO)
-------------------------------------------------------------------------------------------------------
UPDATE RECIBO_CONF SET RCB_CODIGO = (SELECT ISNULL(MAX(RCB_CODIGO),0) FROM RECIBO)
-------------------------------------------------------------------------------------------------------
UPDATE REGISTRO_BOLETO_CONF SET RBO_CODIGO = (SELECT ISNULL(MAX(RBO_CODIGO),0) FROM REGISTRO_BOLETO)
-------------------------------------------------------------------------------------------------------
UPDATE REGISTRO_DE_PROCURA_CONF SET RGP_CODIGO = (SELECT ISNULL(MAX(RGP_CODIGO),0) FROM REGISTRO_DE_PROCURA)
-------------------------------------------------------------------------------------------------------
UPDATE REGISTRO_DELETADO_CONF SET RDL_CODIGO = (SELECT ISNULL(MAX(RDL_CODIGO),0) FROM REGISTRO_DELETADO)
-------------------------------------------------------------------------------------------------------
UPDATE REPOSICAO_CONF SET REP_CODIGO = (SELECT ISNULL(MAX(REP_CODIGO),0) FROM REPOSICAO)
-------------------------------------------------------------------------------------------------------
UPDATE SUBGRUPO_CONF SET SGP_CODIGO = (SELECT ISNULL(MAX(SGP_CODIGO),0) FROM SUBGRUPO)
-------------------------------------------------------------------------------------------------------
UPDATE SUBMODULO_CONF SET SML_CODIGO = (SELECT ISNULL(MAX(SML_CODIGO),0) FROM SUBMODULO)
-------------------------------------------------------------------------------------------------------
UPDATE TABELA_DE_PRECO_SUBGRUPO_CONF SET TPS_CODIGO = (SELECT ISNULL(MAX(TPS_CODIGO),0) FROM TABELA_DE_PRECO_SUBGRUPO)
-------------------------------------------------------------------------------------------------------
UPDATE TAREFA_CONF SET TAR_CODIGO = (SELECT ISNULL(MAX(TAR_CODIGO),0) FROM TAREFA)
-------------------------------------------------------------------------------------------------------
UPDATE TIPO_DE_PARAMETRO_CONF SET TPR_CODIGO = (SELECT ISNULL(MAX(TPR_CODIGO),0) FROM TIPO_DE_PARAMETRO)
-------------------------------------------------------------------------------------------------------
UPDATE TITULO_A_PAGAR_CONF SET TPG_CODIGO = (SELECT ISNULL(MAX(TPG_CODIGO),0) FROM TITULO_A_PAGAR)
-------------------------------------------------------------------------------------------------------
UPDATE TITULO_A_RECEBER_CONF SET TRC_CODIGO = (SELECT ISNULL(MAX(TRC_CODIGO),0) FROM TITULO_A_RECEBER)
-------------------------------------------------------------------------------------------------------
UPDATE TRANSFERENCIA_CONF SET TRF_CODIGO = (SELECT ISNULL(MAX(TRF_CODIGO),0) FROM TRANSFERENCIA)
-------------------------------------------------------------------------------------------------------
UPDATE TRANSPORTADORA_CONF SET TRN_CODIGO = (SELECT ISNULL(MAX(TRN_CODIGO),0) FROM TRANSPORTADORA)
-------------------------------------------------------------------------------------------------------
UPDATE TRCTEMP_CONF SET TRT_CODIGO = (SELECT ISNULL(MAX(TRC_CODIGO),0) FROM TRCTEMP)
-------------------------------------------------------------------------------------------------------
UPDATE TROCA_CONF SET TRO_CODIGO = (SELECT ISNULL(MAX(TRO_CODIGO),0) FROM TROCA)
-------------------------------------------------------------------------------------------------------
UPDATE USUARIO_CONF SET USU_CODIGO = (SELECT ISNULL(MAX(USU_CODIGO),0) FROM USUARIO)
-------------------------------------------------------------------------------------------------------
UPDATE VEICULO_CONF SET VEI_CODIGO = (SELECT ISNULL(MAX(VEI_CODIGO),0) FROM VEICULO)
-------------------------------------------------------------------------------------------------------
UPDATE CONSIGNACAO_CONF SET CSG_CODIGO = (SELECT ISNULL(MAX(CSG_CODIGO),0) FROM CONSIGNACAO)
-------------------------------------------------------------------------------------------------------
UPDATE ITEM_DE_CONSIGNACAO_CONF SET ICS_CODIGO = (SELECT ISNULL(MAX(ICS_CODIGO),0) FROM ITEM_DE_CONSIGNACAO)
-------------------------------------------------------------------------------------------------------
