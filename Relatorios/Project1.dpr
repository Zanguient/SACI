program Project1;

uses
  Forms,
  Utemppas in 'Utemppas.pas' {Form1},
  UAgencia in 'UAgencia.pas' {rpt_agencia},
  UBancos in 'UBancos.pas' {rpt_bancos},
  UAgen_Financeiro in 'UAgen_Financeiro.pas' {rpt_agen_financeiro},
  UAplic_Financeira in 'UAplic_Financeira.pas' {rpt_aplic_financeira},
  UAutorizada in 'UAutorizada.pas' {rpt_autorizada},
  UAvalista in 'UAvalista.pas' {rpt_avalista},
  UCaixa in 'UCaixa.pas' {rpt_caixa},
  UCateg_de_produtos in 'UCateg_de_produtos.pas' {rpt_cat_de_produtos},
  UCentro_de_custo in 'UCentro_de_custo.pas' {rpt_centro_de_custo},
  UClass_fiscal in 'UClass_fiscal.pas' {rpt_class_fiscal},
  UConsorciado in 'UConsorciado.pas' {rpt_consorciado},
  UConta_bancaria in 'UConta_bancaria.pas' {rpt_conta},
  UConta_contabil in 'UConta_contabil.pas' {rpt_conta_contabil},
  UContato in 'UContato.pas' {rpt_contato},
  UForma_de_pagamento in 'UForma_de_pagamento.pas' {rpt_forma_pagamento},
  UGrupo in 'UGrupo.pas' {rpt_grupo},
  UGrupo_consorcio in 'UGrupo_consorcio.pas' {rpt_grupo_consorcio},
  UIndex_economico in 'UIndex_economico.pas' {rpt_index_economico},
  ULivro_caixa in 'ULivro_caixa.pas' {rpt_livro_caixa},
  UOperacao_sistema in 'UOperacao_sistema.pas' {rpt_op_sistema},
  UOrigem_fiscal in 'UOrigem_fiscal.pas' {rpt_origem_fiscal},
  UParametro in 'UParametro.pas' {rpt_parametro},
  URegistro_procura in 'URegistro_procura.pas' {rpt_reg_procura},
  USecao in 'USecao.pas' {rpt_secao},
  USol_pecas_rep in 'USol_pecas_rep.pas' {rpt_sol_pecas_rep},
  USubclass_fiscal in 'USubclass_fiscal.pas' {rpt_subclass_fiscal},
  USubgrupo in 'USubgrupo.pas' {rpt_subgrupo},
  USubtarefas in 'USubtarefas.pas' {rpt_subtarefa},
  UTipo_parametro in 'UTipo_parametro.pas' {rpt_tipo_param},
  UUsuario in 'UUsuario.pas' {rpt_usuario},
  UInform_de_credito in 'UInform_de_credito.pas' {rpt_inf_credito},
  UTarefa in 'UTarefa.pas' {rpt_tarefa},
  UFornecedor in 'UFornecedor.pas' {rpt_fornecedor},
  UFuncionario in 'UFuncionario.pas' {rpt_funcionario},
  USol_de_garantia in 'USol_de_garantia.pas' {rpt_sol_de_garantia},
  UTransportadoras in 'UTransportadoras.pas' {rpt_transportadoras},
  UBeneficiario in 'UBeneficiario.pas' {rpt_beneficiario},
  UCliente in 'UCliente.pas' {rpt_cliente},
  UVendedor in 'UVendedor.pas' {rpt_vendedor},
  UProduto in 'UProduto.pas' {rpt_produto},
  umodulo in 'umodulo.pas' {rpt_modulo_submodulo},
  UProcura_Mercadoria in 'UProcura_Mercadoria.pas' {rpt_Procura_Mercadoria},
  UPendencia_reposicao in 'UPendencia_reposicao.pas' {rpt_pendencia_reposicao},
  URel_Fiscal in 'URel_Fiscal.pas' {rpt_fiscal},
  UHist_compra in 'UHist_compra.pas' {rpt_hist_compra},
  UPrev_vendas in 'UPrev_vendas.pas' {rpt_prev_vendas};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Trpt_agencia, rpt_agencia);
  Application.CreateForm(Trpt_bancos, rpt_bancos);
  Application.CreateForm(Trpt_agen_financeiro, rpt_agen_financeiro);
  Application.CreateForm(Trpt_aplic_financeira, rpt_aplic_financeira);
  Application.CreateForm(Trpt_autorizada, rpt_autorizada);
  Application.CreateForm(Trpt_avalista, rpt_avalista);
  Application.CreateForm(Trpt_caixa, rpt_caixa);
  Application.CreateForm(Trpt_cat_de_produtos, rpt_cat_de_produtos);
  Application.CreateForm(Trpt_centro_de_custo, rpt_centro_de_custo);
  Application.CreateForm(Trpt_class_fiscal, rpt_class_fiscal);
  Application.CreateForm(Trpt_consorciado, rpt_consorciado);
  Application.CreateForm(Trpt_conta, rpt_conta);
  Application.CreateForm(Trpt_conta_contabil, rpt_conta_contabil);
  Application.CreateForm(Trpt_contato, rpt_contato);
  Application.CreateForm(Trpt_forma_pagamento, rpt_forma_pagamento);
  Application.CreateForm(Trpt_grupo, rpt_grupo);
  Application.CreateForm(Trpt_grupo_consorcio, rpt_grupo_consorcio);
  Application.CreateForm(Trpt_index_economico, rpt_index_economico);
  Application.CreateForm(Trpt_livro_caixa, rpt_livro_caixa);
  Application.CreateForm(Trpt_op_sistema, rpt_op_sistema);
  Application.CreateForm(Trpt_origem_fiscal, rpt_origem_fiscal);
  Application.CreateForm(Trpt_parametro, rpt_parametro);
  Application.CreateForm(Trpt_reg_procura, rpt_reg_procura);
  Application.CreateForm(Trpt_secao, rpt_secao);
  Application.CreateForm(Trpt_sol_pecas_rep, rpt_sol_pecas_rep);
  Application.CreateForm(Trpt_subclass_fiscal, rpt_subclass_fiscal);
  Application.CreateForm(Trpt_subgrupo, rpt_subgrupo);
  Application.CreateForm(Trpt_subtarefa, rpt_subtarefa);
  Application.CreateForm(Trpt_tipo_param, rpt_tipo_param);
  Application.CreateForm(Trpt_usuario, rpt_usuario);
  Application.CreateForm(Trpt_inf_credito, rpt_inf_credito);
  Application.CreateForm(Trpt_tarefa, rpt_tarefa);
  Application.CreateForm(Trpt_fornecedor, rpt_fornecedor);
  Application.CreateForm(Trpt_funcionario, rpt_funcionario);
  Application.CreateForm(Trpt_sol_de_garantia, rpt_sol_de_garantia);
  Application.CreateForm(Trpt_transportadoras, rpt_transportadoras);
  Application.CreateForm(Trpt_beneficiario, rpt_beneficiario);
  Application.CreateForm(Trpt_cliente, rpt_cliente);
  Application.CreateForm(Trpt_vendedor, rpt_vendedor);
  Application.CreateForm(Trpt_produto, rpt_produto);
  Application.CreateForm(Trpt_modulo_submodulo, rpt_modulo_submodulo);
  Application.CreateForm(Trpt_Procura_Mercadoria, rpt_Procura_Mercadoria);
  Application.CreateForm(Trpt_pendencia_reposicao, rpt_pendencia_reposicao);
  Application.CreateForm(Trpt_fiscal, rpt_fiscal);
  Application.CreateForm(Trpt_hist_compra, rpt_hist_compra);
  Application.CreateForm(Trpt_prev_vendas, rpt_prev_vendas);
  Application.Run;
end.
