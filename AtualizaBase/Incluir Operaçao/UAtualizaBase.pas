unit UAtualizaBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Db, DBTables;

type
  TForm1 = class(TForm)
    Animate1: TAnimate;
    Timer1: TTimer;
    Query1: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UDM, Funcoes, Modulo, Parametro, Classificacao_fiscal,
  Forma_de_Pagamento;

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
  Animate1.Active:=True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
 i, iVersao:integer;
begin
  iVersao := 14;
  Timer1.Enabled:=False;
  for i:=0 to 5 do
  Begin
    with DM.Database2 do
    Begin
      Connected := False;
      if (i >= 1) and
         ((DM.Configuracao1.Empresa <> empEletro) or
          ((DM.Modulo1.CentroDeCusto <> 0) and
           (DM.Modulo1.CentroDeCusto <> 18))) then //Pegar CPD e ITAPIPOCA
      Begin
        ShowMessage('Fim das inclusões! Versão: '+IntToStr(iVersao));
        Application.Terminate;
        Exit;
      end;
      if i = 0 then
        AliasName := 'SACI'
      else if i = 1 then
        AliasName := 'SACI_T'
      else if i = 2 then
        AliasName := 'ITAPIPOCA'
      else if i = 3 then
        AliasName := 'BATURITE'
      else if i = 4 then
        AliasName := 'NAYARA'
      else if i = 5 then
        AliasName := 'SOLONOPOLES';
      try
        Connected := true;
        DM.Configuracao1.Open;
      except
        ShowMessage('Fim das inclusões! Versão: '+IntToStr(iVersao));
        Application.Terminate;
        Exit;
      end;
    end;

    if (DM.Configuracao1.VersaoIncluirOper <= 14) then
    Begin
      with DM.Submodulo1 do
      Begin
        Open;
        if not LocalizarCod(160) then
          Inserir(0,160,9,'Enviar Fornecedor');
        if not LocalizarCod(170) then
          Inserir(0,170,4,'Assitência Técnica');
        if not LocalizarCod(180) then
          Inserir(0,180,4,'Cadastro Autorizadas');
        if not LocalizarCod(200) then
          Inserir(0,200,1,'Cadastro Atendimento/Vendedor');
        if not LocalizarCod(210) then
          Inserir(0,210,9,'Reposicao Fornecedor');
        if not LocalizarCod(220) then
          Inserir(0,220,1,'Cadastro Profissao');
        if not LocalizarCod(230) then
          Inserir(0,230,4,'Cadastro Lote');
        if not LocalizarCod(240) then
          Inserir(0,240,12,'Controle de Pendencias'); //Acessórios
      end;

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' MDL_CODIGO=4 '+  //Estoque
        ',SML_CODIGO=93 '+ //Principa
        ',OPS_OPERACAO="Consultar Estoque" '+
        ' WHERE OPS_CODIGO = 3730 ');

      with DM.Submodulo1 do
      Begin
        Open;
        if not LocalizarCod(190) then
          Inserir(0,190,1,'Veículos');
      end;

      with DM.Operacao_do_Sistema1 do
      Begin
        Open;
        if not LocalizarCod(8110) then
          Inserir(0,8110,4,41,Now,'Definir Estoque Detalhado','');
        if not LocalizarCod(8120) then
          Inserir(0,8120,8,89,Now,'Retroceder a data','');
        if not LocalizarCod(8130) then
          Inserir(0,8130,4,93,Now,'Movimentação Bonificação/Amostra Grátis','');
        if not LocalizarCod(8140) then
          Inserir(0,8140,1,5,Now,'Excluir Comunicação','');
        if not LocalizarCod(8150) then
          Inserir(0,8150,9,160,Now,'Acessar Enviar Fornecedor',''); //Enviar Fornecedor
        if not LocalizarCod(8160) then
          Inserir(0,8160,9,160,Now,'Inserir Enviar Fornecedor',''); //Enviar Fornecedor
        if not LocalizarCod(8170) then
          Inserir(0,8170,9,160,Now,'Alterar Enviar Fornecedor',''); //Enviar Fornecedor
        if not LocalizarCod(8180) then
          Inserir(0,8180,9,160,Now,'Excluir Enviar Fornecedor',''); //Enviar Fornecedor
        if not LocalizarCod(8190) then
          Inserir(0,8190,9,160,Now,'Enviar Lote Enviar Fornecedor',''); //Enviar Fornecedor
        if not LocalizarCod(8200) then
          Inserir(0,8200,9,160,Now,'Receber Lote Enviar Fornecedor',''); //Enviar Fornecedor
        if not LocalizarCod(8210) then
          Inserir(0,8210,1,1,Now,'Liberar Bonificacao',''); //Venda
        if not LocalizarCod(8220) then
          Inserir(0,8220,4,114,Now,'Posição de Estoque',''); //Relatório
        if not LocalizarCod(8230) then
          Inserir(0,8230,4,114,Now,'Liberar Filtro Cod.Produto',''); //Relatório
        if not LocalizarCod(8240) then
          Inserir(0,8240,4,114,Now,'Movimento de Estoque',''); //Relatório
        if not LocalizarCod(8250) then
          Inserir(0,8250,2,91,Now,'Verificação do Caixa',''); //Caixa - Relatorios
        if not LocalizarCod(8260) then
          Inserir(0,8260,1,1,Now,'Venda > 6 Parcelas Grupo Especial.',''); //Venda
        if not LocalizarCod(8270) then
          Inserir(0,8270,1,104,Now,'Devolução após o prazo.',''); //Pedido de Venda
        if not LocalizarCod(8280) then
          Inserir(0,8280,1,104,Now,'Data de Referência acima do permitido.',''); //Pedido de Venda
        if not LocalizarCod(8290) then
          Inserir(0,8290,4,170,Now,'Acessar Assistência Técnica',''); //Assistência Técnica
        if not LocalizarCod(8300) then
          Inserir(0,8300,4,180,Now,'Acessar Oficinas Autorizadas',''); //Assistência Técnica
        if not LocalizarCod(8310) then
          Inserir(0,8310,4,170,Now,'Cadastrar Ordem de Serviço',''); //Assistência Técnica
        if not LocalizarCod(8320) then
          Inserir(0,8320,4,170,Now,'Alterar Ordem de Serviço',''); //Assistência Técnica
        if not LocalizarCod(8330) then
          Inserir(0,8330,4,170,Now,'Excluir Ordem de Serviço',''); //Assistência Técnica
        if not LocalizarCod(8340) then
          Inserir(0,8340,4,170,Now,'Mudar Situação de Ordem de Serviço',''); //Assistência Técnica
        if not LocalizarCod(8350) then
          Inserir(0,8350,4,180,Now,'Incluir Oficinas Autorizadas',''); //Assistência Técnica
        if not LocalizarCod(8360) then
          Inserir(0,8360,4,180,Now,'Alterar Oficinas Autorizadas',''); //Assistência Técnica
        if not LocalizarCod(8370) then
          Inserir(0,8370,4,180,Now,'Excluir Oficinas Autorizadas',''); //Assistência Técnica
        if not LocalizarCod(8380) then
          Inserir(0,8380,1,1,Now,'Alterar Venda A Vista para venda A PRazo',''); //Venda
        if not LocalizarCod(8390) then
          Inserir(0,8390,1,5,Now,'Definir Liberar Inadiplência',''); //Cadastro de Cliente
        if not LocalizarCod(8400) then
          Inserir(0,8400,6,81,Now,'Desbloquear Usuário',''); //Cadastro de Usuário
        if not LocalizarCod(8410) then
          Inserir(0,8410,1,1,Now,'Liberar Juros Total',''); //Venda
        if not LocalizarCod(8420) then
          Inserir(0,8420,3,20,Now,'Pag. Acima do Limite de Gasto',''); //Titulo a Receber
        if not LocalizarCod(8430) then
          Inserir(0,8430,1,190,Now,'Acessar Cadastro Veículos',''); //Veículo
        if not LocalizarCod(8440) then
          Inserir(0,8440,1,190,Now,'Inserir Veículos',''); //Veículo
        if not LocalizarCod(8450) then
          Inserir(0,8450,1,190,Now,'Alterar Veículos',''); //Veículo
        if not LocalizarCod(8460) then
          Inserir(0,8460,1,190,Now,'Excluir Veículos',''); //Veículo
        if not LocalizarCod(8470) then
          Inserir(0,8470,1,190,Now,'Acessar Controle de Veículos',''); //Veículo
        if not LocalizarCod(8480) then
          Inserir(0,8480,1,190,Now,'Inserir Controle de Veículos',''); //Veículo
        if not LocalizarCod(8490) then
          Inserir(0,8490,1,190,Now,'Alterar Controle de Veículos',''); //Veículo
        if not LocalizarCod(8500) then
          Inserir(0,8500,1,190,Now,'Excluir Controle de Veículos',''); //Veículo
        if not LocalizarCod(8510) then
        Begin
        end;
        if not LocalizarCod(8520) then
          Inserir(0,8520,1,200,Now,'Acessar Cadastro de Atendimento/Vendedor',''); //Atendimento por Vendedor
        if not LocalizarCod(8530) then
          Inserir(0,8530,1,200,Now,'Inserir Atendimento/Vendedor',''); //Atendimento por Vendedor
        if not LocalizarCod(8540) then
          Inserir(0,8540,1,200,Now,'Alterar Atendimento/Vendedor',''); //Atendimento por Vendedor
        if not LocalizarCod(8550) then
          Inserir(0,8550,1,200,Now,'Excluir Atendimento/Vendedor',''); //Atendimento por Vendedor
        if not LocalizarCod(8560) then
          Inserir(0,8560,1,119,Now,'Relatório Atendimento/Vendedor',''); //Atendimento por Vendedor
        if not LocalizarCod(8570) then
          Inserir(0,8570,3,20,Now,'Receber Títulos sem seguir a ordem',''); //Titulo a Receber
        if not LocalizarCod(8580) then
          Inserir(0,8580,1,140,Now,'Atendimento por Vendedor',''); //GRÁFICOS
        if not LocalizarCod(8590) then
          Inserir(0,8590,1,119,Now,'Veículos',''); //Relatório Venda
        if not LocalizarCod(8600) then
          Inserir(0,8600,1,119,Now,'Controle de Veículos',''); //Relatório Venda
        if not LocalizarCod(8610) then
          Inserir(0,8610,1,119,Now,'Comparativo Anual',''); //Relatório Venda
        if not LocalizarCod(8620) then
          Inserir(0,8620,9,210,Now,'Acessar Reposição Fornecedor',''); //Reposição Fornecedor
        if not LocalizarCod(8630) then
          Inserir(0,8630,9,210,Now,'Inserir Reposição Fornecedor',''); //Reposição Fornecedor
        if not LocalizarCod(8640) then
          Inserir(0,8640,9,210,Now,'Alterar Reposição Fornecedor',''); //Reposição Fornecedor
        if not LocalizarCod(8650) then
          Inserir(0,8650,9,210,Now,'Excluir Reposição Fornecedor',''); //Reposição Fornecedor
        if not LocalizarCod(8660) then
          Inserir(0,8660,9,210,Now,'Receber Reposição Fornecedor',''); //Reposição Fornecedor
        if not LocalizarCod(8670) then
          Inserir(0,8670,9,97,Now,'Faturar Pendentes Compra','');
        if not LocalizarCod(8680) then
          Inserir(0,8680,1,220,Now,'Acessar Profissao','');
        if not LocalizarCod(8690) then
          Inserir(0,8690,1,220,Now,'Inserir Profissao','');
        if not LocalizarCod(8700) then
          Inserir(0,8700,1,220,Now,'Alterar Profissao','');
        if not LocalizarCod(8710) then
          Inserir(0,8710,1,220,Now,'Excluir Profissao','');
        if not LocalizarCod(8720) then
          Inserir(0,8720,1,119,Now,'Profissao',''); //Relatório Venda
        if not LocalizarCod(8730) then
          Inserir(0,8730,4,230,Now,'Inserir Lote',''); //Cadastro Lote
        if not LocalizarCod(8740) then
          Inserir(0,8740,4,230,Now,'Alterar Lote',''); //Cadastro Lote
        if not LocalizarCod(8750) then
          Inserir(0,8750,4,230,Now,'Excluir Lote',''); //Cadastro Lote
        if not LocalizarCod(8760) then
          Inserir(0,8760,3,125,Now,'Extrato de Cliente',''); //Relatório Financeiro
        if not LocalizarCod(8770) then
          Inserir(0,8770,3,125,Now,'Inadiplência',''); //Relatório Financeiro
        if not LocalizarCod(8780) then
          Inserir(0,8780,3,125,Now,'Previsão de Receita',''); //Relatório Financeiro
        if not LocalizarCod(8790) then
          Inserir(0,8790,3,125,Now,'Balancete',''); //Relatório Financeiro
        if not LocalizarCod(8800) then
          Inserir(0,8800,3,125,Now,'Registro de Boleto',''); //Relatório Financeiro
        if not LocalizarCod(8810) then
          Inserir(0,8810,3,125,Now,'Título Excluído',''); //Relatório Financeiro
        if not LocalizarCod(8820) then
          Inserir(0,8820,3,125,Now,'Cheque',''); //Relatório Financeiro
        if not LocalizarCod(8830) then
          Inserir(0,8830,3,125,Now,'Movimento de Cheque',''); //Relatório Financeiro
        if not LocalizarCod(8840) then
          Inserir(0,8840,2,121,Now,'Fluxo antes do fechamento',''); //Relatório Caixa
        if not LocalizarCod(8850) then
          Inserir(0,8850,9,153,Now,'Processar Pedido c/dados da Nota',''); //Pedido de Compra
        if not LocalizarCod(8860) then
          Inserir(0,8860,12,240,Now,'Inserir Pendencia',''); //Controle de Pendência
        if not LocalizarCod(8870) then
          Inserir(0,8870,12,240,Now,'Desativar Pendencia',''); //Controle de Pendência
        if not LocalizarCod(8880) then
          Inserir(0,8880,12,240,Now,'Autorizar Pendencia',''); //Controle de Pendência
        if not LocalizarCod(8890) then
          Inserir(0,8890,12,240,Now,'Acessar Pendencia',''); //Controle de Pendência
        if not LocalizarCod(8910) then
          Inserir(0,8910,12,152,Now,'Pendencia',''); //Relatórios de Pendência
        if not LocalizarCod(8920) then
          Inserir(0,8920,1,104,Now,'Liberar Venda Cliente Bloqueado',''); //Pedido de Venda
        if not LocalizarCod(8930) then
          Inserir(0,8930,1,104,Now,'Liberar Venda para Cliente no SPC.','');
      end;

      with DM.TipoParam1 do
      Begin
        Open;
        if not LocalizarCod(130) then
          Inserir(130, 'TIPO ESTOQUE DETALHADO');
        if not LocalizarCod(140) then
          Inserir(140, 'COMUNICACAO PERGUNTAS');
        if not LocalizarCod(150) then
          Inserir(150, 'COMUNICACAO MOTIVOS');
        if not LocalizarCod(160) then
          Inserir(160, 'COMUNICACAO MEIO');
      end;

      with DM.Parametro1 do
      Begin
        Open;
        if not LocalizarCod(4460) then
          Inserir(4460, 130, 'PADRAO');  //Tipo de Estoque Detalhado
        if not LocalizarCod(416) then
          Inserir(416, 4, 'DEPOSITO EM CONTA');  //Tipo de Pagamento
        if not LocalizarCod(412) then
          Inserir(412, 4, 'BOLETO BANCARIO');  //Tipo de Pagamento
        if not LocalizarCod(4470) then
          Inserir(4470, 14, 'BONIFICACAO');  //Tipo de Estoque
        if not LocalizarCod(4480) then
          Inserir(4480, 14, 'AMOSTRA GRATIS');  //Tipo de Estoque
        if not LocalizarCod(4490) then
          Inserir(4490, 14, 'REMESSA EM GARANTIA');  //Tipo de Estoque
        if not LocalizarCod(4500) then
          Inserir(4500, 150, 'COBRANCA');  //COMUNICACAO MOTIVOS
        if not LocalizarCod(4510) then
          Inserir(4510, 150, 'TELEMARKETING');  //COMUNICACAO MOTIVOS
        if not LocalizarCod(4520) then
          Inserir(4520, 150, 'RECLAMACAO CLIENTE');  //COMUNICACAO MOTIVOS
        if not LocalizarCod(4530) then
          Inserir(4530, 160, 'PESSOALMENTE');  //COMUNICACAO MEIO
        if not LocalizarCod(4540) then
          Inserir(4540, 160, 'TELEFONE');  //COMUNICACAO MEIO
        if not LocalizarCod(4550) then
          Inserir(4550, 160, 'E-MAIL');  //COMUNICACAO MEIO
        if not LocalizarCod(4560) then
          Inserir(4560, 160, 'CARTA');  //COMUNICACAO MEIO
        if not LocalizarCod(4570) then
          Inserir(4570, 160, 'COBRADOR');  //COMUNICACAO MEIO
        if not LocalizarCod(4580) then
          Inserir(4580, 30, 'LIGAR P/ CLIENTE');  //Tipo de Tarefa
      end;

      with DM.OperFiscal1 do
      Begin
        Open;
        if not LocalizarCod( 6910 ) then
          Inserir( 6910 ,    4470   ,'REMESSA EM BONIFICACAO (FORA UF)         ', 1 (*Saída*));
        if not LocalizarCod( 5910 ) then
          Inserir( 5910 ,    4470   ,'REMESSA EM BONIFICACAO (UF)              ', 1 (*Saída*));
        if not LocalizarCod( 2910 ) then
          Inserir( 2910 ,    4470   ,'REMESSA EM BONIFICACAO (FORA UF)         ', 0 (*Entrada*));
        if not LocalizarCod( 1910 ) then
          Inserir( 1910 ,    4470   ,'REMESSA EM BONIFICACAO (UF)              ', 0 (*Entrada*));

        if not LocalizarCod( 6911 ) then
          Inserir( 6911 ,    4480   ,'REMESSA DE AMOSTRA GRATIS (FORA UF)      ', 1 (*Saída*));
        if not LocalizarCod( 5911 ) then
          Inserir( 5911 ,    4480   ,'REMESSA DE AMOSTRA GRATIS (UF)           ', 1 (*Saída*));
        if not LocalizarCod( 2911 ) then
          Inserir( 2911 ,    4480   ,'REMESSA DE AMOSTRA GRATIS (FORA UF)      ', 0 (*Entrada*));
        if not LocalizarCod( 1911 ) then
          Inserir( 1911 ,    4480   ,'REMESSA DE AMOSTRA GRATIS (UF)           ', 0 (*Entrada*));

        if not LocalizarCod( 5553 ) then
          Inserir( 5553 ,    451   ,'DEVOLUCAO DE COMPRA BENS DE ATIVO (UF)    ', 1 (*Saída*));          
      end;

      //Venda
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=361 '+
          ' WHERE (MEF_TIPO_MOV=94 OR MEF_TIPO_MOV=22 OR MEF_TIPO_MOV=500 OR MEF_TIPO_MOV=510)');  //VENDA
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=361 '+
          ' WHERE (MEC_TIPO_MOV=94 OR MEC_TIPO_MOV=22 OR MEC_TIPO_MOV=500 OR MEC_TIPO_MOV=510)');  //VENDA
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=361 '+
          ' WHERE (MES_TIPO_MOV=94 OR MES_TIPO_MOV=22 OR MES_TIPO_MOV=500 OR MES_TIPO_MOV=510)');  //VENDA
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=361 '+
          ' WHERE (MSN_TIPO_MOV=94 OR MSN_TIPO_MOV=22 OR MSN_TIPO_MOV=500 OR MSN_TIPO_MOV=510)');  //VENDA
      except
      end;

      //Compra
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=360 '+
          ' WHERE (MEF_TIPO_MOV=92 OR MEF_TIPO_MOV=14)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=360 '+
          ' WHERE (MEC_TIPO_MOV=92 OR MEC_TIPO_MOV=14)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=360 '+
          ' WHERE (MES_TIPO_MOV=92 OR MES_TIPO_MOV=14)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=360 '+
          ' WHERE (MSN_TIPO_MOV=92 OR MSN_TIPO_MOV=14)');
      except
      end;

      try
        ExecutaSQL(Query1, 'UPDATE OPERACAO_FISCAL SET '+
          ' OPF_TIPO=451 '+
          ' WHERE OPF_CODIGO IN (1551,2551,1552,5552,5555,5553)');
      except
      end;
    end;
















////////////////////////////////////////////////////////////////
    if (DM.Configuracao1.VersaoIncluirOper <= 14) then
    Begin
      with DM.TipoParam1 do
      Begin
        Open;
        if not LocalizarCod(14) then
          Inserir(14, 'MOVIMENTO DE ESTOQUE');
        if not LocalizarCod(120) then
          Inserir(120, 'CLASSIFICACAO DE PRODUTO');
      end;
      with DM.Operacao_do_Sistema1 do
      Begin
        Open;
        if not LocalizarCod(5000) then
          Inserir(0,5000,3,20,Now,'Receber Pagamento de Cliente (Somente CARTÃO)','');
        if not LocalizarCod(7970) then
          Inserir(0,7970,12,152,Now,'Relatório Tarefas Todos Usuários','');
        if not LocalizarCod(8000) then
          Inserir(0,8000,4,41,Now,'Alterar Preco de Venda',''); //
        if not LocalizarCod(8010) then
          Inserir(0,8010,1,5,Now,'Definir Vendedor/Promotor do cliente',''); //Cadastro de Cliente
        if not LocalizarCod(8020) then
          Inserir(0,8020,1,119,Now,'.Comissão de Vendas Completo',''); //Relatório de Comissão/Faturamento
        if not LocalizarCod(8030) then
          Inserir(0,8030,1,149,Now,'Reabrir Pacote de Venda',''); //Pacote de Venda
        if not LocalizarCod(8040) then
          Inserir(0,8040,4,34,Now,'Inserir/Alterar Transferencia',''); //Transferência
        if not LocalizarCod(8050) then
          Inserir(0,8050,4,34,Now,'Inserir/Alterar Item de Transferencia',''); //Transferência
        if not LocalizarCod(8060) then
          Inserir(0,8060,4,34,Now,'Excluir Item de Transferencia',''); //Transferência
        if not LocalizarCod(8070) then
          Inserir(0,8070,4,34,Now,'Cancelar Transferencia',''); //Transferência
        if not LocalizarCod(8080) then
          Inserir(0,8080,1,5,Now,'Inserir/Alterar Comunicacao',''); //Cadastro de Cliente
        if not LocalizarCod(8090) then
          Inserir(0,8090,1,106,Now,'Marcar Pedido LJ4',''); //Emissão de Notas Fiscais
        if not LocalizarCod(8100) then
          Inserir(0,8100,1,106,Now,'Desmarcar Pedido LJ4',''); //Emissão de Notas Fiscais
      end;
      with DM.OperFiscal1 do
      Begin
        Open;
        if not LocalizarCod( 5209 ) then
          Inserir( 5209 ,    365   ,'DEVOLUCAO DE MERCADORIA RECEBIDA EM TRANF.', 1 (*Saída*));
        if not LocalizarCod( 6557 ) then
          Inserir( 6557 ,    365   ,'TRANFERENCIA DE MAT. USO/CONSUMO (FORA UF)', 1 (*Saída*));
        if not LocalizarCod( 5557 ) then
          Inserir( 5557 ,    365   ,'TRANFERENCIA DE MATERIAL USO/CONSUMO (UF) ', 1 (*Saída*));
        if not LocalizarCod( 2557 ) then
          Inserir( 2557 ,    365   ,'TRANFERENCIA DE MAT. USO/CONSUMO (FORA UF)', 0 (*Entrada*));
      end;
      with DM.Parametro1 do
      Begin
        Open;
        if not LocalizarCod(4400) then
          Inserir(4400, 6, 'PROMOTOR(A)');  //Função de Funcionário
        if not LocalizarCod(4410) then
          Inserir(4410, 14, 'CANCELAR LJ3');  //MOVIMENTO DE ESTOQUE
        if not LocalizarCod(4420) then
          Inserir(4420, 14, 'CANCELAR LJ4');  //MOVIMENTO DE ESTOQUE
        if not LocalizarCod(4430) then
          Inserir(4430, 14, 'EMISSAO LJ3');  //MOVIMENTO DE ESTOQUE
        if not LocalizarCod(4440) then
          Inserir(4440, 14, 'EMISSAO LJ4');  //MOVIMENTO DE ESTOQUE
        if not LocalizarCod(4450) then
          Inserir(4450, 14, 'REMESSA DE TROCA');  //MOVIMENTO DE ESTOQUE  Utilizado para gerar a Nota
      end;

      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=120 '+  //EMPRESTIMO DEVOLVIDO
          ' OR PAR_CODIGO=21 '+   //Permuta do indisp.
          ' OR PAR_CODIGO=41 '+   //permuta p/ comercial
          ' OR PAR_CODIGO=95 '+   //item cancelado
          ' OR PAR_CODIGO=39 '+   //cliente
          ' OR PAR_CODIGO=32 ');   //atend. ped. externo
      except
      end;

      try
        ExecutaSQL(Query1, 'DELETE FROM TIPO_DE_PARAMETRO '+
          ' WHERE TPR_CODIGO=8 '+
          ' OR TPR_CODIGO=9 '+
          ' OR TPR_CODIGO=10 '+
          ' OR TPR_CODIGO=11 '+
          ' OR TPR_CODIGO=12 '+
          ' OR TPR_CODIGO=13 ');
      except
      end;

      try
        ExecutaSQL(Query1, 'UPDATE PARAMETRO SET TPR_CODIGO=14 '+
          ' WHERE PAR_CODIGO=4090 '+ //COMPRA CANCELADA
          ' OR PAR_CODIGO=93 '+      //ABASTECIMENTO
          ' OR PAR_CODIGO=98 '+      //CUPOM CANCELADO
          ' OR PAR_CODIGO=4200 '+      //CUPOM CANCELADO
          ' OR PAR_CODIGO=96 '+      //CUPOM CANCELADO
          ' OR PAR_CODIGO=374 '+      //REABERTURA
          ' OR PAR_CODIGO=30 '+      //FURTO
          ' OR PAR_CODIGO=29 '+      //DOAÇÃO
          ' OR PAR_CODIGO=4100 '+      //EMBARQUE
          ' OR PAR_CODIGO=1010 '+      //INVENTÁRIO
          ' OR PAR_CODIGO=380 '+      //entrada avulsa
          ' OR PAR_CODIGO=385 '+      //saída avulsa
          ' OR PAR_CODIGO=1050 ');   //DANIFICADO/PERCA
      except
      end;

      try
        ExecutaSQL(Query1, 'UPDATE PARAMETRO SET TPR_CODIGO=14, PAR_DESCRICAO="MANUFATURADO" '+
          ' WHERE PAR_CODIGO=110 '); //ENTRADA MANUFATURADO
      except
      end;

      //Venda
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=361 '+
          ' WHERE (MEF_TIPO_MOV=94 OR MEF_TIPO_MOV=22 OR MEF_TIPO_MOV=500 OR MEF_TIPO_MOV=510)');  //VENDA
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=361 '+
          ' WHERE (MEC_TIPO_MOV=94 OR MEC_TIPO_MOV=22 OR MEC_TIPO_MOV=500 OR MEC_TIPO_MOV=510)');  //VENDA
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=361 '+
          ' WHERE (MES_TIPO_MOV=94 OR MES_TIPO_MOV=22 OR MES_TIPO_MOV=500 OR MES_TIPO_MOV=510)');  //VENDA
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=361 '+
          ' WHERE (MSN_TIPO_MOV=94 OR MSN_TIPO_MOV=22 OR MSN_TIPO_MOV=500 OR MSN_TIPO_MOV=510)');  //VENDA
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=94 OR PAR_CODIGO=22 OR PAR_CODIGO=500 OR PAR_CODIGO=510 ');  //VENDA
      except
      end;

      //Compra
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=360 '+
          ' WHERE (MEF_TIPO_MOV=92 OR MEF_TIPO_MOV=14)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=360 '+
          ' WHERE (MEC_TIPO_MOV=92 OR MEC_TIPO_MOV=14)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=360 '+
          ' WHERE (MES_TIPO_MOV=92 OR MES_TIPO_MOV=14)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=360 '+
          ' WHERE (MSN_TIPO_MOV=92 OR MSN_TIPO_MOV=14)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=92 OR PAR_CODIGO=14 ');
      except
      end;

      //Transferência
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=365 '+
          ' WHERE (MEF_TIPO_MOV=99 OR MEF_TIPO_MOV=97 OR MEF_TIPO_MOV=37 OR MEF_TIPO_MOV=42 OR MEF_TIPO_MOV=16 OR MEF_TIPO_MOV=23)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=365 '+
          ' WHERE (MEC_TIPO_MOV=99 OR MEC_TIPO_MOV=97 OR MEC_TIPO_MOV=37 OR MEC_TIPO_MOV=42 OR MEC_TIPO_MOV=16 OR MEC_TIPO_MOV=23)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=365 '+
          ' WHERE (MES_TIPO_MOV=99 OR MES_TIPO_MOV=97 OR MES_TIPO_MOV=37 OR MES_TIPO_MOV=42 OR MES_TIPO_MOV=16 OR MES_TIPO_MOV=23)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=365 '+
          ' WHERE (MSN_TIPO_MOV=99 OR MSN_TIPO_MOV=97 OR MSN_TIPO_MOV=37 OR MSN_TIPO_MOV=42 OR MSN_TIPO_MOV=16 OR MSN_TIPO_MOV=23)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=99 OR PAR_CODIGO=97 OR PAR_CODIGO=37 OR PAR_CODIGO=42 OR PAR_CODIGO=16 OR PAR_CODIGO=23 ');
      except
      end;

      //Abastecimento
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=93 '+
          ' WHERE (MEF_TIPO_MOV=15 OR MEF_TIPO_MOV=24)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=93 '+
          ' WHERE (MEC_TIPO_MOV=15 OR MEC_TIPO_MOV=24)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=93 '+
          ' WHERE (MES_TIPO_MOV=15 OR MES_TIPO_MOV=24)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=93 '+
          ' WHERE (MSN_TIPO_MOV=15 OR MSN_TIPO_MOV=24)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=15 OR PAR_CODIGO=24 ');
      except
      end;

      //Assitência Técnica (Remessa para Conserto)
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=367 '+
          ' WHERE (MEF_TIPO_MOV=18 OR MEF_TIPO_MOV=26 OR MEF_TIPO_MOV=35 OR MEF_TIPO_MOV=38 OR MEF_TIPO_MOV=20 OR MEF_TIPO_MOV=36)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=367 '+
          ' WHERE (MEC_TIPO_MOV=18 OR MEC_TIPO_MOV=26 OR MEC_TIPO_MOV=35 OR MEC_TIPO_MOV=38 OR MEC_TIPO_MOV=20 OR MEC_TIPO_MOV=36)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=367 '+
          ' WHERE (MES_TIPO_MOV=18 OR MES_TIPO_MOV=26 OR MES_TIPO_MOV=35 OR MES_TIPO_MOV=38 OR MES_TIPO_MOV=20 OR MES_TIPO_MOV=36)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=367 '+
          ' WHERE (MSN_TIPO_MOV=18 OR MSN_TIPO_MOV=26 OR MSN_TIPO_MOV=35 OR MSN_TIPO_MOV=38 OR MSN_TIPO_MOV=20 OR MSN_TIPO_MOV=36)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=18 OR PAR_CODIGO=26 OR PAR_CODIGO=35 OR PAR_CODIGO=38 OR PAR_CODIGO=20 OR PAR_CODIGO=36 ');
      except
      end;

      //Dano Parcial (danificado/perca)
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=1050 '+
          ' WHERE (MEF_TIPO_MOV=31 OR MEF_TIPO_MOV=33 OR MEF_TIPO_MOV=28 OR MEF_TIPO_MOV=40)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=1050 '+
          ' WHERE (MEC_TIPO_MOV=31 OR MEC_TIPO_MOV=33 OR MEC_TIPO_MOV=28 OR MEC_TIPO_MOV=40)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=1050 '+
          ' WHERE (MES_TIPO_MOV=31 OR MES_TIPO_MOV=33 OR MES_TIPO_MOV=28 OR MES_TIPO_MOV=40)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=1050 '+
          ' WHERE (MSN_TIPO_MOV=31 OR MSN_TIPO_MOV=33 OR MSN_TIPO_MOV=28 OR MSN_TIPO_MOV=40)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=31 OR PAR_CODIGO=33 OR PAR_CODIGO=28 OR PAR_CODIGO=40');
      except
      end;

      //Devolução
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=362 '+
          ' WHERE (MEF_TIPO_MOV=34 OR MEF_TIPO_MOV=17 OR MEF_TIPO_MOV=25 OR MEF_TIPO_MOV=373 OR MEF_TIPO_MOV=90 OR MEF_TIPO_MOV=91)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=362 '+
          ' WHERE (MEC_TIPO_MOV=34 OR MEC_TIPO_MOV=17 OR MEC_TIPO_MOV=25 OR MEC_TIPO_MOV=373 OR MEC_TIPO_MOV=90 OR MEC_TIPO_MOV=91)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=362 '+
          ' WHERE (MES_TIPO_MOV=34 OR MES_TIPO_MOV=17 OR MES_TIPO_MOV=25 OR MES_TIPO_MOV=373 OR MES_TIPO_MOV=90 OR MES_TIPO_MOV=91)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=362 '+
          ' WHERE (MSN_TIPO_MOV=34 OR MSN_TIPO_MOV=17 OR MSN_TIPO_MOV=25 OR MSN_TIPO_MOV=373 OR MSN_TIPO_MOV=90 OR MSN_TIPO_MOV=91)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=34 OR PAR_CODIGO=17 OR PAR_CODIGO=25 OR PAR_CODIGO=373 OR PAR_CODIGO=90 OR PAR_CODIGO=91');
      except
      end;

      //INVENTARIO
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=1010 '+
          ' WHERE (MEF_TIPO_MOV=19 OR MEF_TIPO_MOV=27)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=1010 '+
          ' WHERE (MEC_TIPO_MOV=19 OR MEC_TIPO_MOV=27)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=1010 '+
          ' WHERE (MES_TIPO_MOV=19 OR MES_TIPO_MOV=27)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=1010 '+
          ' WHERE (MSN_TIPO_MOV=19 OR MSN_TIPO_MOV=27)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=19 OR PAR_CODIGO=27 ');
      except
      end;

      //SAIDA EMPRESTIMO (EMPRESTIMO SAI)
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=520 '+
          ' WHERE (MEF_TIPO_MOV=121)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=520 '+
          ' WHERE (MEC_TIPO_MOV=121)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=520 '+
          ' WHERE (MES_TIPO_MOV=121)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=520 '+
          ' WHERE (MSN_TIPO_MOV=121)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=121 ');
      except
      end;

      //SAIDA MANUFATURADO (MANUFATURADO)
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=110 '+
          ' WHERE (MEF_TIPO_MOV=111)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=110 '+
          ' WHERE (MEC_TIPO_MOV=111)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=110 '+
          ' WHERE (MES_TIPO_MOV=111)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=110 '+
          ' WHERE (MSN_TIPO_MOV=111)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=111 ');
      except
      end;

      //EXT ENTREGA ANTECIPADA (ENTREGA ANTECIPADO)
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
          ' MEF_TIPO_MOV=4200 '+
          ' WHERE (MEF_TIPO_MOV=4210)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
          ' MEC_TIPO_MOV=4200 '+
          ' WHERE (MEC_TIPO_MOV=4210)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
          ' MES_TIPO_MOV=4200 '+
          ' WHERE (MES_TIPO_MOV=4210)');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=4200 '+
          ' WHERE (MSN_TIPO_MOV=4210)');
      except
      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO '+
          ' WHERE PAR_CODIGO=4210 ');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=4210 '+
          ' WHERE MSN_TIPO_MOV=17');
      except
      end;
      try
        ExecutaSQL(Query1, 'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
          ' MSN_TIPO_MOV=4230 '+
          ' WHERE MSN_TIPO_MOV=22');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoIncluirOper <= 12) then
    Begin
      with DM.Parametro1 do
      Begin
        //Recriar os parâmetros do tipo 80, para que as descrições caibam em 40 espaços
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO WHERE TPR_CODIGO=80');
        Open;
        if not LocalizarCod(1130) then
          Inserir(1130, 80, 'AGENCIA');
        if not LocalizarCod(1140) then
          Inserir(1140, 80, 'AGENTE_FINANCEIRO');
        if not LocalizarCod(1150) then
          Inserir(1150, 80, 'AVALISTA');
        if not LocalizarCod(1170) then
          Inserir(1170, 80, 'BANCO');
        if not LocalizarCod(1180) then
          Inserir(1180, 80, 'BANCO_BOLETO');
        if not LocalizarCod(1190) then
          Inserir(1190, 80, 'BONUS');
        if not LocalizarCod(1200) then
          Inserir(1200, 80, 'CAIXA');
        if not LocalizarCod(1210) then
          Inserir(1210, 80, 'CATEGORIA_DE_PRODUTO');
        if not LocalizarCod(1220) then
          Inserir(1220, 80, 'CENTRO_DE_CUSTO');
        if not LocalizarCod(1230) then
          Inserir(1230, 80, 'CHEQUE');
        if not LocalizarCod(1240) then
          Inserir(1240, 80, 'CLASSIFICACAO_FISCAL');
        if not LocalizarCod(1250) then
          Inserir(1250, 80, 'CLIENTE');
        if not LocalizarCod(1260) then
          Inserir(1260, 80, 'CLIENTE_AFIM');
        if not LocalizarCod(1270) then
          Inserir(1270, 80, 'COBRANCA_POR_COBRADOR');
        if not LocalizarCod(1280) then
          Inserir(1280, 80, 'CODIGO_DE_BARRAS');
        if not LocalizarCod(1290) then
          Inserir(1290, 80, 'CONTATO');
        if not LocalizarCod(1300) then
          Inserir(1300, 80, 'CONTA_BANCARIA');
        if not LocalizarCod(1310) then
          Inserir(1310, 80, 'CONTA_CORRENTE_DO_CC');
        if not LocalizarCod(1320) then
          Inserir(1320, 80, 'CONTA_DE_CAIXA');
        if not LocalizarCod(1330) then
          Inserir(1330, 80, 'CONTROLE_DE_VITRINE');
        if not LocalizarCod(1340) then
          Inserir(1340, 80, 'COTA');
        if not LocalizarCod(1350) then
          Inserir(1350, 80, 'CUSTO');
        if not LocalizarCod(1360) then
          Inserir(1360, 80, 'DESCONTOS');
        if not LocalizarCod(1370) then
          Inserir(1370, 80, 'DETALHE_DE_PEDIDO_DE_VENDA');
        if not LocalizarCod(1380) then
          Inserir(1380, 80, 'DIREITO_DE_BONUS');
        if not LocalizarCod(1390) then
          Inserir(1390, 80, 'EMBARQUE');
        if not LocalizarCod(1400) then
          Inserir(1400, 80, 'EMPRESTIMO');
        if not LocalizarCod(1410) then
          Inserir(1410, 80, 'ENVIA_DADOS_EMBARQUE');
        if not LocalizarCod(1420) then
          Inserir(1420, 80, 'ENVIA_DADOS_NOTA');
        if not LocalizarCod(1430) then
          Inserir(1430, 80, 'EQUIPE_GERENCIA');
        if not LocalizarCod(1440) then
          Inserir(1440, 80, 'FACTORING');
        if not LocalizarCod(1450) then
          Inserir(1450, 80, 'FATOR_DE_FINANCEIRA');
        if not LocalizarCod(1460) then
          Inserir(1460, 80, 'FORMA_DE_PAGAMENTO');
        if not LocalizarCod(1470) then
          Inserir(1470, 80, 'FORNECEDOR');
        if not LocalizarCod(1480) then
          Inserir(1480, 80, 'FUNCIONARIO');
        if not LocalizarCod(1490) then
          Inserir(1490, 80, 'GRAU');
        if not LocalizarCod(1500) then
          Inserir(1500, 80, 'GRUPO');
        if not LocalizarCod(1510) then
          Inserir(1510, 80, 'INFORMACOES_DE_CREDITO');
        if not LocalizarCod(1520) then
          Inserir(1520, 80, 'INSUMO');
        if not LocalizarCod(1530) then
          Inserir(1530, 80, 'INVENTARIO');
        if not LocalizarCod(1540) then
          Inserir(1540, 80, 'ITEM_DE_BONUS');
        if not LocalizarCod(1550) then
          Inserir(1550, 80, 'ITEM_DE_COTA');
        if not LocalizarCod(1560) then
          Inserir(1560, 80, 'ITEM_DE_EMBARQUE');
        if not LocalizarCod(1570) then
          Inserir(1570, 80, 'ITEM_DE_INVENTARIO');
        if not LocalizarCod(1580) then
          Inserir(1580, 80, 'ITEM_DE_LISTA_DE_PRESENTE');
        if not LocalizarCod(1590) then
          Inserir(1590, 80, 'ITEM_DE_MANUFATURADO');
        if not LocalizarCod(1600) then
          Inserir(1600, 80, 'ITEM_DE_MAPA_DE_COTACAO');
        if not LocalizarCod(1610) then
          Inserir(1610, 80, 'ITEM_DE_NOTA_FISCAL');
        if not LocalizarCod(1620) then
          Inserir(1620, 80, 'ITEM_DE_PACOTE_DE_VENDA');
        if not LocalizarCod(1630) then
          Inserir(1630, 80, 'ITEM_DE_PEDIDO_DE_COMPRA');
        if not LocalizarCod(1640) then
          Inserir(1640, 80, 'ITEM_DE_PEDIDO_DE_VENDA');
        if not LocalizarCod(1650) then
          Inserir(1650, 80, 'ITEM_DE_PRE_RECEBIMENTO');
        if not LocalizarCod(1660) then
          Inserir(1660, 80, 'ITEM_DE_RECEBIMENTO');
        if not LocalizarCod(1670) then
          Inserir(1670, 80, 'ITEM_DE_TABELA_DE_PRECO');
        if not LocalizarCod(1680) then
          Inserir(1680, 80, 'ITEM_DE_TABELA_DE_PRECO_SUBGRUPO');
        if not LocalizarCod(1690) then
          Inserir(1690, 80, 'ITEM_DE_TRANSFERENCIA');
        if not LocalizarCod(1700) then
          Inserir(1700, 80, 'ITEM_DE_TROCA');
        if not LocalizarCod(1710) then
          Inserir(1710, 80, 'LISTA_DE_PRESENTE');
        if not LocalizarCod(1720) then
          Inserir(1720, 80, 'MANUFATURADO');
        if not LocalizarCod(1730) then
          Inserir(1730, 80, 'MAPA_DE_COTACAO');
        if not LocalizarCod(1740) then
          Inserir(1740, 80, 'MAPA_FATURAMENTO');
        if not LocalizarCod(1750) then
          Inserir(1750, 80, 'MENSAGEM');
        if not LocalizarCod(1760) then
          Inserir(1760, 80, 'MENSAGEM_CPD');
        if not LocalizarCod(1770) then
          Inserir(1770, 80, 'MODULO');
        if not LocalizarCod(1780) then
          Inserir(1780, 80, 'NOTA_FISCAL');
        if not LocalizarCod(1790) then
          Inserir(1790, 80, 'OPERACAO_DO_SISTEMA');
        if not LocalizarCod(1800) then
          Inserir(1800, 80, 'OPERACAO_DO_FISCAL');
        if not LocalizarCod(1810) then
          Inserir(1810, 80, 'ORIGEM_FISCAL');
        if not LocalizarCod(1820) then
          Inserir(1820, 80, 'PACOTE_DE_CREDITO');
        if not LocalizarCod(1830) then
          Inserir(1830, 80, 'PACOTE_DE_VENDA');
        if not LocalizarCod(1840) then
          Inserir(1840, 80, 'PARAMETRO');
        if not LocalizarCod(1850) then
          Inserir(1850, 80, 'PEDIDO_DE_COMPRA');
        if not LocalizarCod(1860) then
          Inserir(1860, 80, 'PEDIDO_DE_VENDA');
        if not LocalizarCod(1870) then
          Inserir(1870, 80, 'PERMISSAO');
        if not LocalizarCod(1880) then
          Inserir(1880, 80, 'PRE_RECEBIMENTO');
        if not LocalizarCod(1890) then
          Inserir(1890, 80, 'PRODUTO');
        if not LocalizarCod(1900) then
          Inserir(1900, 80, 'PRODUTO_SITE');
        if not LocalizarCod(1910) then
          Inserir(1910, 80, 'QUANTIDADE_NORMAL_VENDA');
        if not LocalizarCod(1920) then
          Inserir(1920, 80, 'RECEBIMENTO');
        if not LocalizarCod(1930) then
          Inserir(1930, 80, 'REGISTRO_DE_PROCURA');
        if not LocalizarCod(1940) then
          Inserir(1940, 80, 'RESERVA_EXTERNA');
        if not LocalizarCod(1950) then
          Inserir(1950, 80, 'SOLICITACAO_DE_PECAS_DE_REP');
        if not LocalizarCod(1960) then
          Inserir(1960, 80, 'SUBGRUPO');
        if not LocalizarCod(1970) then
          Inserir(1970, 80, 'SUBMODULO');
        if not LocalizarCod(1980) then
          Inserir(1980, 80, 'TABELA_DE_PRECO');
        if not LocalizarCod(1990) then
          Inserir(1990, 80, 'TABELA_DE_PRECO_SUBGRUPO');
        if not LocalizarCod(2000) then
          Inserir(2000, 80, 'TAREFA');
        if not LocalizarCod(2010) then
          Inserir(2010, 80, 'TIPO_DE_PARAMETRO');
        if not LocalizarCod(2020) then
          Inserir(2020, 80, 'TITULO_A_PAGAR');
        if not LocalizarCod(2030) then
          Inserir(2030, 80, 'TITULO_A_RECEBER');
        if not LocalizarCod(2040) then
          Inserir(2040, 80, 'TRANSFERENCIA');
        if not LocalizarCod(2050) then
          Inserir(2050, 80, 'TRANSFERENCIA_DE_DADOS');
        if not LocalizarCod(2060) then
          Inserir(2060, 80, 'TRANSPORTADORA');
        if not LocalizarCod(2070) then
          Inserir(2070, 80, 'TROCA');
        if not LocalizarCod(2080) then
          Inserir(2080, 80, 'UF_ICMS');
        if not LocalizarCod(2090) then
          Inserir(2090, 80, 'USUARIO');
        if not LocalizarCod(4250) then
          Inserir(4250, 80, 'CONTROLE_ENVIO_CPD');
        if not LocalizarCod(4260) then
          Inserir(4260, 80, 'CONTROLE_ENVIO_FILIAL');
        if not LocalizarCod(4270) then
          Inserir(4270, 80, 'CONTROLE_RECEBIMENTO_CPD');
        if not LocalizarCod(4280) then
          Inserir(4280, 80, 'CONTROLE_RECEBIMENTO_FILIAL');
        if not LocalizarCod(4290) then
          Inserir(4290, 80, 'REGISTRO_DELETADO');
        if not LocalizarCod(4300) then
          Inserir(4300, 80, 'USUARIO_SENHA');
        if not LocalizarCod(4310) then
          Inserir(4310, 80, 'LOG');
        if not LocalizarCod(4330) then
          Inserir(4330, 80, 'MOVIMENTO_DE_CAIXA');
        if not LocalizarCod(4350) then
          Inserir(4350, 80, 'ITEM_DE_ESTOQUE');
        if not LocalizarCod(4360) then
          Inserir(4360, 80, 'MOVIMENTO_DE_ESTOQUE_COMERCIAL');
        if not LocalizarCod(4370) then
          Inserir(4370, 80, 'MOVIMENTO_DE_ESTOQUE_FISICO');
        if not LocalizarCod(4380) then
          Inserir(4380, 80, 'MOVIMENTO_DE_ESTOQUE_FISCAL');
        if not LocalizarCod(4390) then
          Inserir(4390, 80, 'MOVIMENTO_DE_ESTOQUE_SN');
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT * FROM PARAMETRO '+
            ' WHERE TPR_CODIGO=80 '+
            ' AND PAR_DESCRICAO="ITEM_DE_PEDIDO_DE_VENDA"';
          Open;
          if IsEmpty then
            Raise exception.Create('Será necessária uma conexão o suporte para corrigir a tabela de parâmetros!'+#13+
              'Entre em contato com o suporte informando sobre esta mensagem!');
        end;
      end;
    end;

    if (DM.Configuracao1.VersaoIncluirOper <= 11) then
    Begin
      with DM.Operacao_do_Sistema1 do
      Begin
        Open;
        if not LocalizarCod(8000) then
          Inserir(0,8000,4,41,Now,'Alterar Preco de Venda',''); //????
        if not LocalizarCod(3190) then
          Inserir(0,3190,2,121,Now,'Relação de Despesas',''); //Caixa - Relatorios
        if not LocalizarCod(3200) then
          Inserir(0,3200,2,121,Now,'Relação de Recebimentos',''); //Caixa - Relatorios


        if not LocalizarCod(7930) then
          Inserir(0,7930,13,157,Now,'Gerar Serviço Automáico',''); //Pedido de Serviço
        if not LocalizarCod(7940) then
          Inserir(0,7940,6,95,Now,'Importação de Dados',''); //Principal - Gerência
        if not LocalizarCod(7950) then
          Inserir(0,7950,1,106,Now,'Reimprimir Comprovante LJ3',''); //Principal - Gerência

        if not LocalizarCod(7960) then //Antigo 7950
          Inserir(0,7960,13,157,Now,'Visualizar Preços no Pedido de Serviço',''); //Caixa - Relatorios
      end;

      with DM.OperFiscal1 do
      Begin
        Open;
        if not LocalizarCod( 5555 ) then
          Inserir( 5555 ,    451   ,'DEVOLUCAO DE TRANSF. BENS DE ATIVO (UF) ', 1 (*Saída*));
        if not LocalizarCod( 5556 ) then
          Inserir( 5556 ,    362   ,'DEVOLUCAO DE COMPRA MAT. CONSUMO (UF)   ', 1 (*Saída*));
      end;

      with DM.Parametro1 do
      Begin
        //Recriar os parâmetros do tipo 80, para que as descrições caibam em 40 espaços
        ExecutaSQL(Query1, 'DELETE FROM PARAMETRO WHERE TPR_CODIGO=80');
        Open;
        if not LocalizarCod(1130) then
          Inserir(1130, 80, 'AGENCIA');
        if not LocalizarCod(1140) then
          Inserir(1140, 80, 'AGENTE_FINANCEIRO');
        if not LocalizarCod(1150) then
          Inserir(1150, 80, 'AVALISTA');

        if not LocalizarCod(1170) then
          Inserir(1170, 80, 'BANCO');
        if not LocalizarCod(1180) then
          Inserir(1180, 80, 'BANCO_BOLETO');
        if not LocalizarCod(1190) then
          Inserir(1190, 80, 'BONUS');

        if not LocalizarCod(1200) then
          Inserir(1200, 80, 'CAIXA');
        if not LocalizarCod(1210) then
          Inserir(1210, 80, 'CATEGORIA_DE_PRODUTO');
        if not LocalizarCod(1220) then
          Inserir(1220, 80, 'CENTRO_DE_CUSTO');
        if not LocalizarCod(1230) then
          Inserir(1230, 80, 'CHEQUE');
        if not LocalizarCod(1240) then
          Inserir(1240, 80, 'CLASSIFICACAO_FISCAL');
        if not LocalizarCod(1250) then
          Inserir(1250, 80, 'CLIENTE');
        if not LocalizarCod(1260) then
          Inserir(1260, 80, 'CLIENTE_AFIM');
        if not LocalizarCod(1270) then
          Inserir(1270, 80, 'COBRANCA_POR_COBRADOR');
        if not LocalizarCod(1280) then
          Inserir(1280, 80, 'CODIGO_DE_BARRAS');
        if not LocalizarCod(1290) then
          Inserir(1290, 80, 'CONTATO');
        if not LocalizarCod(1300) then
          Inserir(1300, 80, 'CONTA_BANCARIA');
        if not LocalizarCod(1310) then
          Inserir(1310, 80, 'CONTA_CORRENTE_DO_CC');
        if not LocalizarCod(1320) then
          Inserir(1320, 80, 'CONTA_DE_CAIXA');
        if not LocalizarCod(1330) then
          Inserir(1330, 80, 'CONTROLE_DE_VITRINE');
        if not LocalizarCod(1340) then
          Inserir(1340, 80, 'COTA');
        if not LocalizarCod(1350) then
          Inserir(1350, 80, 'CUSTO');

        if not LocalizarCod(1360) then
          Inserir(1360, 80, 'DESCONTOS');
        if not LocalizarCod(1370) then
          Inserir(1370, 80, 'DETALHE_DE_PEDIDO_DE_VENDA');
        if not LocalizarCod(1380) then
          Inserir(1380, 80, 'DIREITO_DE_BONUS');

        if not LocalizarCod(1390) then
          Inserir(1390, 80, 'EMBARQUE');
        if not LocalizarCod(1400) then
          Inserir(1400, 80, 'EMPRESTIMO');
        if not LocalizarCod(1410) then
          Inserir(1410, 80, 'ENVIA_DADOS_EMBARQUE');
        if not LocalizarCod(1420) then
          Inserir(1420, 80, 'ENVIA_DADOS_NOTA');
        if not LocalizarCod(1430) then
          Inserir(1430, 80, 'EQUIPE_GERENCIA');

        if not LocalizarCod(1440) then
          Inserir(1440, 80, 'FACTORING');
        if not LocalizarCod(1450) then
          Inserir(1450, 80, 'FATOR_DE_FINANCEIRA');
        if not LocalizarCod(1460) then
          Inserir(1460, 80, 'FORMA_DE_PAGAMENTO');
        if not LocalizarCod(1470) then
          Inserir(1470, 80, 'FORNECEDOR');
        if not LocalizarCod(1480) then
          Inserir(1480, 80, 'FUNCIONARIO');

        if not LocalizarCod(1490) then
          Inserir(1490, 80, 'GRAU');
        if not LocalizarCod(1500) then
          Inserir(1500, 80, 'GRUPO');

        if not LocalizarCod(1510) then
          Inserir(1510, 80, 'INFORMACOES_DE_CREDITO');
        if not LocalizarCod(1520) then
          Inserir(1520, 80, 'INSUMO');
        if not LocalizarCod(1530) then
          Inserir(1530, 80, 'INVENTARIO');
        if not LocalizarCod(1540) then
          Inserir(1540, 80, 'ITEM_DE_BONUS');
        if not LocalizarCod(1550) then
          Inserir(1550, 80, 'ITEM_DE_COTA');
        if not LocalizarCod(1560) then
          Inserir(1560, 80, 'ITEM_DE_EMBARQUE');
        if not LocalizarCod(1570) then
          Inserir(1570, 80, 'ITEM_DE_INVENTARIO');
        if not LocalizarCod(1580) then
          Inserir(1580, 80, 'ITEM_DE_LISTA_DE_PRESENTE');
        if not LocalizarCod(1590) then
          Inserir(1590, 80, 'ITEM_DE_MANUFATURADO');
        if not LocalizarCod(1600) then
          Inserir(1600, 80, 'ITEM_DE_MAPA_DE_COTACAO');
        if not LocalizarCod(1610) then
          Inserir(1610, 80, 'ITEM_DE_NOTA_FISCAL');
        if not LocalizarCod(1620) then
          Inserir(1620, 80, 'ITEM_DE_PACOTE_DE_VENDA');
        if not LocalizarCod(1630) then
          Inserir(1630, 80, 'ITEM_DE_PEDIDO_DE_COMPRA');
        if not LocalizarCod(1640) then
          Inserir(1640, 80, 'ITEM_DE_PEDIDO_DE_VENDA');
        if not LocalizarCod(1650) then
          Inserir(1650, 80, 'ITEM_DE_PRE_RECEBIMENTO');
        if not LocalizarCod(1660) then
          Inserir(1660, 80, 'ITEM_DE_RECEBIMENTO');
        if not LocalizarCod(1670) then
          Inserir(1670, 80, 'ITEM_DE_TABELA_DE_PRECO');
        if not LocalizarCod(1680) then
          Inserir(1680, 80, 'ITEM_DE_TABELA_DE_PRECO_SUBGRUPO');
        if not LocalizarCod(1690) then
          Inserir(1690, 80, 'ITEM_DE_TRANSFERENCIA');
        if not LocalizarCod(1700) then
          Inserir(1700, 80, 'ITEM_DE_TROCA');

        if not LocalizarCod(1710) then
          Inserir(1710, 80, 'LISTA_DE_PRESENTE');

        if not LocalizarCod(1720) then
          Inserir(1720, 80, 'MANUFATURADO');
        if not LocalizarCod(1730) then
          Inserir(1730, 80, 'MAPA_DE_COTACAO');
        if not LocalizarCod(1740) then
          Inserir(1740, 80, 'MAPA_FATURAMENTO');
        if not LocalizarCod(1750) then
          Inserir(1750, 80, 'MENSAGEM');
        if not LocalizarCod(1760) then
          Inserir(1760, 80, 'MENSAGEM_CPD');
        if not LocalizarCod(1770) then
          Inserir(1770, 80, 'MODULO');

        if not LocalizarCod(1780) then
          Inserir(1780, 80, 'NOTA_FISCAL');

        if not LocalizarCod(1790) then
          Inserir(1790, 80, 'OPERACAO_DO_SISTEMA');
        if not LocalizarCod(1800) then
          Inserir(1800, 80, 'OPERACAO_DO_FISCAL');
        if not LocalizarCod(1810) then
          Inserir(1810, 80, 'ORIGEM_FISCAL');

        if not LocalizarCod(1820) then
          Inserir(1820, 80, 'PACOTE_DE_CREDITO');
        if not LocalizarCod(1830) then
          Inserir(1830, 80, 'PACOTE_DE_VENDA');
        if not LocalizarCod(1840) then
          Inserir(1840, 80, 'PARAMETRO');
        if not LocalizarCod(1850) then
          Inserir(1850, 80, 'PEDIDO_DE_COMPRA');
        if not LocalizarCod(1860) then
          Inserir(1860, 80, 'PEDIDO_DE_VENDA');
        if not LocalizarCod(1870) then
          Inserir(1870, 80, 'PERMISSAO');
        if not LocalizarCod(1880) then
          Inserir(1880, 80, 'PRE_RECEBIMENTO');
        if not LocalizarCod(1890) then
          Inserir(1890, 80, 'PRODUTO');
        if not LocalizarCod(1900) then
          Inserir(1900, 80, 'PRODUTO_SITE');

        if not LocalizarCod(1910) then
          Inserir(1910, 80, 'QUANTIDADE_NORMAL_VENDA');

        if not LocalizarCod(1920) then
          Inserir(1920, 80, 'RECEBIMENTO');
        if not LocalizarCod(1930) then
          Inserir(1930, 80, 'REGISTRO_DE_PROCURA');
        if not LocalizarCod(1940) then
          Inserir(1940, 80, 'RESERVA_EXTERNA');

        if not LocalizarCod(1950) then
          Inserir(1950, 80, 'SOLICITACAO_DE_PECAS_DE_REP');
        if not LocalizarCod(1960) then
          Inserir(1960, 80, 'SUBGRUPO');
        if not LocalizarCod(1970) then
          Inserir(1970, 80, 'SUBMODULO');

        if not LocalizarCod(1980) then
          Inserir(1980, 80, 'TABELA_DE_PRECO');
        if not LocalizarCod(1990) then
          Inserir(1990, 80, 'TABELA_DE_PRECO_SUBGRUPO');
        if not LocalizarCod(2000) then
          Inserir(2000, 80, 'TAREFA');
        if not LocalizarCod(2010) then
          Inserir(2010, 80, 'TIPO_DE_PARAMETRO');
        if not LocalizarCod(2020) then
          Inserir(2020, 80, 'TITULO_A_PAGAR');
        if not LocalizarCod(2030) then
          Inserir(2030, 80, 'TITULO_A_RECEBER');
        if not LocalizarCod(2040) then
          Inserir(2040, 80, 'TRANSFERENCIA');
        if not LocalizarCod(2050) then
          Inserir(2050, 80, 'TRANSFERENCIA_DE_DADOS');
        if not LocalizarCod(2060) then
          Inserir(2060, 80, 'TRANSPORTADORA');
        if not LocalizarCod(2070) then
          Inserir(2070, 80, 'TROCA');

        if not LocalizarCod(2080) then
          Inserir(2080, 80, 'UF_ICMS');
        if not LocalizarCod(2090) then
          Inserir(2090, 80, 'USUARIO');

        if not LocalizarCod(4250) then
          Inserir(4250, 80, 'CONTROLE_ENVIO_CPD');
        if not LocalizarCod(4260) then
          Inserir(4260, 80, 'CONTROLE_ENVIO_FILIAL');
        if not LocalizarCod(4270) then
          Inserir(4270, 80, 'CONTROLE_RECEBIMENTO_CPD');
        if not LocalizarCod(4280) then
          Inserir(4280, 80, 'CONTROLE_RECEBIMENTO_FILIAL');
        if not LocalizarCod(4290) then
          Inserir(4290, 80, 'REGISTRO_DELETADO');
        if not LocalizarCod(4300) then
          Inserir(4300, 80, 'USUARIO_SENHA');
        if not LocalizarCod(4310) then
          Inserir(4310, 80, 'LOG');
        if not LocalizarCod(4330) then
          Inserir(4330, 80, 'MOVIMENTO_DE_CAIXA');
        if not LocalizarCod(4350) then
          Inserir(4350, 80, 'ITEM_DE_ESTOQUE');
        if not LocalizarCod(4360) then
          Inserir(4360, 80, 'MOVIMENTO_DE_ESTOQUE_COMERCIAL');
        if not LocalizarCod(4370) then
          Inserir(4370, 80, 'MOVIMENTO_DE_ESTOQUE_FISICO');
        if not LocalizarCod(4380) then
          Inserir(4380, 80, 'MOVIMENTO_DE_ESTOQUE_FISCAL');
        if not LocalizarCod(4390) then
          Inserir(4390, 80, 'MOVIMENTO_DE_ESTOQUE_SN');

      end;

      try
        ExecutaSQL(Query1, 'UPDATE OPERACAO_FISCAL SET '+
          ' OPF_TIPO=451 '+
          ' WHERE OPF_CODIGO IN (1551,2551,1552,5552,5555,5553)');
      except
      end;
    end;











    //////////////////////////////////////////

    if (DM.Configuracao1.VersaoIncluirOper <= 10) then
    Begin
      try
        ExecutaSQL(Query1,'UPDATE SUBMODULO SET CNC_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'DELETE FROM MODULO');
      except
      end;
      with DM.Modulo1 do
      Begin
        Open;
        if not LocalizarCod(1) then
          Inserir(0,1,'Venda');
        if not LocalizarCod(2) then
          Inserir(0,2,'Caixa');
        if not LocalizarCod(3) then
          Inserir(0,3,'Financeiro');
        if not LocalizarCod(4) then
          Inserir(0,4,'Estoque');
        if not LocalizarCod(6) then
          Inserir(0,6,'Gerência');
        if not LocalizarCod(8) then
          Inserir(0,8,'Principal');
        if not LocalizarCod(9) then
          Inserir(0,9,'Compra');
        if not LocalizarCod(10) then
          Inserir(0,10,'Cobrança');
        if not LocalizarCod(12) then
          Inserir(0,12,'Acessórios');
        if not LocalizarCod(13) then
          Inserir(0,13,'Serviços');
      end;
      with DM.Submodulo1 do
      Begin
        Open;
        if not LocalizarCod(140) then
          Inserir(0,140,1,'Gráficos');
        if not LocalizarCod(141) then
          Inserir(0,141,2,'Gráficos');
        if not LocalizarCod(143) then
          Inserir(0,143,13,'Relatórios');
        if not LocalizarCod(144) then
          Inserir(0,144,13,'Gráficos');
        if not LocalizarCod(145) then
          Inserir(0,145,13,'Principal');
        if not LocalizarCod(146) then
          Inserir(0,146,3,'Cadastro de Indexador Econômico');
        if not LocalizarCod(147) then
          Inserir(0,147,3,'Controle de Cheques');
        if not LocalizarCod(148) then
          Inserir(0,148,3,'Factoring');
        if not LocalizarCod(149) then
          Inserir(0,149,1,'Pacote de Venda');
        if not LocalizarCod(150) then
          Inserir(0,150,1,'Pacote de Crédito');
        if not LocalizarCod(151) then
          Inserir(0,151,4,'Tabela de Custo');
        if not LocalizarCod(152) then
          Inserir(0,152,12,'Relatórios');
        if not LocalizarCod(153) then
          Inserir(0,153,9,'Pedido de Compra');
        if not LocalizarCod(154) then
          Inserir(0,154,9,'Cotacao');
        if not LocalizarCod(155) then
          Inserir(0,155,10,'Cobrança por Cobrador');
        if not LocalizarCod(156) then
          Inserir(0,156,2,'Impressora Fiscal');
        if not LocalizarCod(157) then
          Inserir(0,157,13,'Pedido de Serviço');
        if not LocalizarCod(158) then
          Inserir(0,158,1,'Faturamento Pendente');
        if not LocalizarCod(159) then
          Inserir(0,159,3,'Banco - Boleto');
      end;
      with DM.Operacao_do_Sistema1 do
      Begin
        Open;
        if not LocalizarCod(410) then
          Inserir(0,410,3,92,Now,'Acessar Indexador Econômico','');
        if not LocalizarCod(420) then
          Inserir(0,420,3,146,Now,'Inserir Indexador Econômico','');
        if not LocalizarCod(430) then
          Inserir(0,430,3,146,Now,'Excluir Indexador Econômico','');
        if not LocalizarCod(440) then
          Inserir(0,440,3,146,Now,'Alterar Indexador Econômico','');
        if not LocalizarCod(1180) then
          Inserir(0,1180,4,36,Now,'Inserir Estoque Indisponível','');
        if not LocalizarCod(1190) then
          Inserir(0,1190,4,36,Now,'Excuir Estoque Indisponível','');
        if not LocalizarCod(1200) then
          Inserir(0,1200,4,36,Now,'Alterar Estoque Indisponível','');
        if not LocalizarCod(3460) then
          Inserir(0,3460,1,5,Now,'Crédito de Cliente',''); //Cadastro de Cliente
        if not LocalizarCod(3470) then
          Inserir(0,3470,1,1,Now,'Renegociar Menos que o Valor','');
        if not LocalizarCod(3540) then
          Inserir(0,3540,1,1,Now,'Liberar Desconto Total','');
        if not LocalizarCod(3550) then
          Inserir(0,3550,4,93,Now,'Ajuste de Preço','');
        if not LocalizarCod(3560) then
          Inserir(0,3560,4,37,Now,'Processar Inventário','');
        if not LocalizarCod(3570) then
          Inserir(0,3570,4,32,Now,'Recebimento','');
        if not LocalizarCod(3580) then
          Inserir(0,3580,1,104,Now,'Imprimir Promissória/Carnet/Cupom','');
        if not LocalizarCod(3600) then
          Inserir(0,3600,1,1,Now,'Liberar Desconto à prazo Simples','');
        if not LocalizarCod(3610) then
          Inserir(0,3610,1,104,Now,'Troca de Mercadoria','');
        if not LocalizarCod(3720) then
          Inserir(0,3720,1,5,Now,'Definir Cliente Atacado','');
        if not LocalizarCod(3630) then
          Inserir(0,3630,10,155,Now,'Excluir Registro de Cobrança Pago','');
        if not LocalizarCod(3640) then
          Inserir(0,3640,1,1,Now,'Excluir Item de Pedido de Venda','');
        if not LocalizarCod(3740) then
          Inserir(0,3740,1,1,Now,'Venda abaixo do Preço Mínimo','');
        if not LocalizarCod(3750) then
          Inserir(0,3750,1,1,Now,'Renegociar Título','');
//        if not LocalizarCod(3760) then
//          Inserir(0,3760,3,20,Now,'Cancelar Renegociações','');
        if not LocalizarCod(3770) then
          Inserir(0,3770,2,156,Now,'Acessar Impressora Fiscal','');
        if not LocalizarCod(3780) then
          Inserir(0,3780,1,5,Now,'Definir Desconto Cliente','');
        if not LocalizarCod(3790) then
          Inserir(0,3790,1,1,Now,'Liberar Venda Cliente Inadiplente','');
        if not LocalizarCod(3800) then
          Inserir(0,3800,1,1,Now,'Liberar Desconto Simples','');
        {if not LocalizarCod(3810) then
          Inserir(0,3810,1,104,Now,'Pedido de Venda (LBM)','');}
        if not LocalizarCod(3820) then
          Inserir(0,3820,1,104,Now,'Venda sem Estoque (LBM)','');
        if not LocalizarCod(3830) then
          Inserir(0,3830,1,104,Now,'Entrada menor Prestação','');
        if not LocalizarCod(3840) then
          Inserir(0,3840,1,1,Now,'Cad/Alt/Exc Tabela Desconto','');
        if not LocalizarCod(3850) then
          Inserir(0,3850,4,93,Now,'Cad/Alt/Exc Manufaturamento','');
        if not LocalizarCod(3860) then
          Inserir(0,3860,4,93,Now,'Cad/Alt/Exc Empréstimos','');
        if not LocalizarCod(3870) then
          Inserir(0,3870,1,104,Now,'Cad/Alt/Exc Cotas','');
        if not LocalizarCod(3880) then
          Inserir(0,3880,4,93,Now,'Cad/Alt/Exc Bônus','');
        if not LocalizarCod(3890) then
          Inserir(0,3890,4,114,Now,'Relatório Bônus/Vendedor','');
        if not LocalizarCod(3900) then
          Inserir(0,3900,1,5,Now,'Liberar Limite Crédito Básico','');
        if not LocalizarCod(3910) then
          Inserir(0,3910,1,5,Now,'Liberar Limite Crédito Total','');
        if not LocalizarCod(3920) then
          Inserir(0,3920,9,97,Now,'Cad/Alt/Exc UF-ICMS','');
        if not LocalizarCod(3930) then
          Inserir(0,3930,1,104,Now,'Liberar Desconto Gerente','');
        if not LocalizarCod(3940) then
          Inserir(0,3940,3,132,Now,'Reabrir Títulos Pagos','');
        if not LocalizarCod(3950) then
          Inserir(0,3950,3,133,Now,'Reabrir Títulos Recebidos','');
        if not LocalizarCod(3960) then
          Inserir(0,3960,3,132,Now,'Acessar Títulos Pagos','');
        if not LocalizarCod(3970) then
          Inserir(0,3970,3,133,Now,'Acessar Títulos Recebidos','');
        if not LocalizarCod(3980) then
          Inserir(0,3980,3,21,Now,'Acessar Títulos a Pagar','');
        if not LocalizarCod(3990) then
          Inserir(0,3990,9,115,Now,'ICMS Compra e Venda','');
        if not LocalizarCod(4000) then
          Inserir(0,4000,1,119,Now,'Comissão de Vendas (LBM)','');
        if not LocalizarCod(4010) then
          Inserir(0,4010,6,95,Now,'Cad/Alt/Exc CEP','');
        if not LocalizarCod(4020) then
          Inserir(0,4020,1,106,Now,'Gerar qualquer Nota','');
        if not LocalizarCod(4030) then
          Inserir(0,4030,1,1,Now,'Reabrir Pedido(LBM)','');
        if not LocalizarCod(4040) then
          Inserir(0,4040,1,1,Now,'Localizar Todos Pedidos(LBM)','');
        if not LocalizarCod(4050) then
          Inserir(0,4050,4,93,Now,'Mov. Mercadoria Avulso','');
        if not LocalizarCod(4060) then
          Inserir(0,4060,1,119,Now,'Notas Fiscais','');
        if not LocalizarCod(4500) then
          Inserir(0,4500,3,20,Now,'Cadastro Títulos a Receber','');
        if not LocalizarCod(4510) then
          Inserir(0,4510,3,20,Now,'Alterar Títulos a Receber','');
        if not LocalizarCod(4520) then
          Inserir(0,4520,3,20,Now,'Excluir Títulos a Receber','');
        if not LocalizarCod(4530) then
          Inserir(0,4530,3,21,Now,'Cadastro Títulos a Pagar','');
        if not LocalizarCod(4540) then
          Inserir(0,4540,3,21,Now,'Alterar Títulos a Pagar','');
        if not LocalizarCod(4550) then
          Inserir(0,4550,3,21,Now,'Excluir Títulos a Pagar','');
//        if not LocalizarCod(4560) then    3610
//          Inserir(0,4560,1,119,Now,'Devolução Parcial','');
        if not LocalizarCod(4570) then
          Inserir(0,4570,8,89,Now,'Agenda de Tarefas','');
        if not LocalizarCod(4580) then
          Inserir(0,4580,4,37,Now,'Processar Inventário Esp.','');
//        if not LocalizarCod(4600) then  8780
//          Inserir(0,4600,3,125,Now,'Previsão de Receita','');
        if not LocalizarCod(4610) then
          Inserir(0,4610,1,106,Now,'Definir Catracas (Nota Fiscal)','');
        if not LocalizarCod(4620) then
          Inserir(0,4620,1,90,Now,'Acessar Menu Gráficos Venda','');
        if not LocalizarCod(4630) then
          Inserir(0,4630,1,140,Now,'Vendas Por Vendedor','');
        if not LocalizarCod(4640) then
          Inserir(0,4640,2,91,Now,'Acessar Menu Gráficos Caixa','');
        if not LocalizarCod(4650) then
          Inserir(0,4650,2,141,Now,'Despesas (Caixa)','');
        if not LocalizarCod(4660) then
          Inserir(0,4660,2,141,Now,'Recebimentos (Caixa)','');
        if not LocalizarCod(4670) then
          Inserir(0,4670,1,140,Now,'Títulos(Pagos)/Vendedor','');
        if not LocalizarCod(4680) then
          Inserir(0,4680,8,89,Now,'Cad/Alt/Exc Feriados','');
        if not LocalizarCod(4690) then
          Inserir(0,4690,2,91,Now,'Alterar Tipo de Pagamento','');
        {if not LocalizarCod(6000) then
          Inserir(0,6000,1,104,Now,'Finalizar Venda A Vista','');}
        if not LocalizarCod(6010) then
          Inserir(0,6010,1,106,Now,'Acessar Cancelar Nota','');
        if not LocalizarCod(6020) then
          Inserir(0,6020,1,106,Now,'Marcar Pedido LJ3','');
        if not LocalizarCod(6030) then
          Inserir(0,6030,1,104,Now,'Reabrir Pedido de Venda','');
        if not LocalizarCod(6040) then
          Inserir(0,6040,3,20,Now,'Alterar Vencimento > 5 dias','');
        if not LocalizarCod(6050) then
          Inserir(0,6050,3,20,Now,'Alterar Dt Pagamento 5 dias (LBM)','');
        if not LocalizarCod(6060) then
          Inserir(0,6060,3,20,Now,'Alterar Dt Pagamento Total (LBM)','');
        if not LocalizarCod(6070) then
          Inserir(0,6070,1,90,Now,'Corrigir Parcelas de um Pedido','');
        if not LocalizarCod(6100) then
          Inserir(0,6100,1,104,Now,'Cad/Alt/Exc Quantidade Normal Venda','');
        if not LocalizarCod(6110) then
          Inserir(0,6110,1,10,Now,'Definir Equipe de Gerente','');
        if not LocalizarCod(6120) then
          Inserir(0,6120,3,20,Now,'Baixa Automática de Títulos','');
        if not LocalizarCod(6130) then
          Inserir(0,6130,4,41,Now,'Alterar Origem e Classificação Fiscal','');
        if not LocalizarCod(6140) then
          Inserir(0,6140,3,21,Now,'Desconto Especial Pagamento','');
        if not LocalizarCod(6150) then
          Inserir(0,6150,3,21,Now,'Desconto Total Pagamento','');
        if not LocalizarCod(6160) then
          Inserir(0,6160,1,106,Now,'Desmarcar Pedido SN','');
        if not LocalizarCod(6170) then
          Inserir(0,6170,1,106,Now,'Cancelar Nota Fiscal','');
        if not LocalizarCod(6180) then
          Inserir(0,6180,1,106,Now,'Emitir Nota Fiscal','');
        if not LocalizarCod(6190) then
          Inserir(0,6190,4,93,Now,'Ajustar Preço de Custo','');
        if not LocalizarCod(6200) then
          Inserir(0,6200,1,106,Now,'Cancelar Cupom Fiscal','');
        if not LocalizarCod(6210) then
          Inserir(0,6210,1,104,Now,'Cotação de Venda','');
        if not LocalizarCod(6220) then
          Inserir(0,6220,1,106,Now,'Emitir Nota Externa','');
        if not LocalizarCod(6230) then
          Inserir(0,6230,1,104,Now,'Liberar Venda com Boleto (LBM)','');
        if not LocalizarCod(6240) then
          Inserir(0,6240,1,104,Now,'Liberar Média Acima de 60 dias (LBM)','');
        if not LocalizarCod(6250) then
          Inserir(0,6250,1,90,Now,'Alterar Valor do Título <> Pedido','');
        if not LocalizarCod(6260) then
          Inserir(0,6260,9,97,Now,'Confirmar Compra sem Dados da Nota','');
        if not LocalizarCod(6270) then
          Inserir(0,6270,4,114,Now,'Posição de Estoque Anterior','');
//        if not LocalizarCod(6280) then  3760  TAMBÉM FOI EXCLUÍDO
//          Inserir(0,6280,3,92,Now,'Cancelar Renegociações','');
        if not LocalizarCod(6290) then
          Inserir(0,6290,3,92,Now,'Controle do SPC','');
        if not LocalizarCod(6300) then
          Inserir(0,6300,3,92,Now,'Acessar SubMenu Contas a Pagar Financ.','');
        if not LocalizarCod(6320) then
          Inserir(0,6320,3,92,Now,'Controle da SERASA','');
        if not LocalizarCod(6330) then
          Inserir(0,6330,3,92,Now,'Optar por não Gerar Movimento de Caixa','');
        if not LocalizarCod(6340) then
          Inserir(0,6340,1,119,Now,'Mapa de Tributos Federais (LBM)','');
        if not LocalizarCod(6350) then
          Inserir(0,6350,1,106,Now,'Liberar Nota para Cliente sem CGF','');
        if not LocalizarCod(6360) then
          Inserir(0,6360,1,145,Now,'Acessar Menu Servico','');
        if not LocalizarCod(6370) then
          Inserir(0,6370,1,145,Now,'Acessar SubMenu Relatório Servico','');
        if not LocalizarCod(6380) then
          Inserir(0,6380,1,145,Now,'Acessar SubMenu Gráfico Servico','');
        if not LocalizarCod(6390) then
          Inserir(0,6390,1,145,Now,'Acessar SubMenu Cadastro Servico','');
        if not LocalizarCod(6400) then
          Inserir(0,6400,1,142,Now,'Servico','');
        if not LocalizarCod(6410) then
          Inserir(0,6410,1,145,Now,'Pedido de Servico','');
        if not LocalizarCod(6420) then
          Inserir(0,6420,1,106,Now,'Ignorar Impressão de Nota','');
        if not LocalizarCod(6500) then
          Inserir(0,6500,1,106,Now,'Alterar Nota/Selo de Nota Fiscal','');
        if not LocalizarCod(6510) then
          Inserir(0,6510,3,92,Now,'Controle da EQUIFAX','');
        if not LocalizarCod(6520) then
          Inserir(0,6520,1,145,Now,'Entrada/Saida no Servico','');
        if not LocalizarCod(6530) then
          Inserir(0,6530,1,145,Now,'Cont. de Qualidade do Servico','');
        if not LocalizarCod(6540) then
          Inserir(0,6540,1,145,Now,'Voltar Situacao do Servico','');
        if not LocalizarCod(6550) then
          Inserir(0,6550,6,95,Now,'Atualizar Tabelas','');
        if not LocalizarCod(6560) then
          Inserir(0,6560,3,159,Now,'Enviar Remessa Boleto','');
        if not LocalizarCod(6570) then
          Inserir(0,6570,3,159,Now,'Receber Remessa Boleto','');
        if not LocalizarCod(6580) then
          Inserir(0,6580,1,104,Now,'Alterar Item','');
        if not LocalizarCod(6600) then
          Inserir(0,6600,1,104,Now,'Inserir/Alterar Pedido','');
        if not LocalizarCod(6610) then
          Inserir(0,6610,1,104,Now,'Perca de Produto','');
        if not LocalizarCod(6620) then
          Inserir(0,6620,3,20,Now,'Definir Título Verificado','');
        if not LocalizarCod(6630) then
          Inserir(0,6630,3,20,Now,'Definir Título Não Verificado','');
        if not LocalizarCod(6640) then
          Inserir(0,6640,3,147,Now,'Acessar Controle de Cheque','');
        if not LocalizarCod(6650) then
          Inserir(0,6650,3,147,Now,'Inserir Cheque Recebido','');
        if not LocalizarCod(6670) then
          Inserir(0,6670,3,147,Now,'Alterar Cheque Recebido','');
        if not LocalizarCod(6680) then
          Inserir(0,6680,3,147,Now,'Excluir Cheque Recebido','');
        if not LocalizarCod(6690) then
          Inserir(0,6690,3,148,Now,'Acessar Factoring','');
        if not LocalizarCod(6700) then
          Inserir(0,6700,3,148,Now,'Inserir Factoring','');
        if not LocalizarCod(6710) then
          Inserir(0,6710,3,148,Now,'Alterar Factoring','');
        if not LocalizarCod(6720) then
          Inserir(0,6720,3,148,Now,'Processar Factoring','');
        if not LocalizarCod(6730) then
          Inserir(0,6730,3,148,Now,'Inserir Item Factoring','');
        if not LocalizarCod(6740) then
          Inserir(0,6740,3,148,Now,'Excluir Item Factoring','');
        if not LocalizarCod(6750) then
          Inserir(0,6750,1,104,Now,'Trocar TipoPag/FormaPag na Venda','');
        if not LocalizarCod(6760) then
          Inserir(0,6760,1,106,Now,'Excluir Nota Nao Impressa','');
        if not LocalizarCod(6770) then
          Inserir(0,6770,1,149,Now,'Finalizar Pacote de Venda','');
        if not LocalizarCod(6780) then
          Inserir(0,6780,1,149,Now,'Acessar Pacote de Venda','');
        if not LocalizarCod(6790) then
          Inserir(0,6790,1,149,Now,'Inserir/Alterar Pacote de Venda','');
        if not LocalizarCod(6800) then
          Inserir(0,6800,1,149,Now,'Cancelar Pacote de Venda','');
        if not LocalizarCod(6810) then
          Inserir(0,6810,1,150,Now,'Acessar Pacote de Crédito','');
        if not LocalizarCod(6820) then
          Inserir(0,6820,1,150,Now,'Finalizar Pacote de Crédito','');
        if not LocalizarCod(6830) then
          Inserir(0,6830,1,150,Now,'Inserir/Alterar Pacote de Crédito','');
        if not LocalizarCod(6840) then
          Inserir(0,6840,1,150,Now,'Cancelar Pacote de Crédito','');
        if not LocalizarCod(6850) then
          Inserir(0,6850,4,151,Now,'Acessar Tabela Custo','');
        if not LocalizarCod(6860) then
          Inserir(0,6860,4,151,Now,'Inserir Registro Tabela Custo','');
        if not LocalizarCod(6870) then
          Inserir(0,6870,4,151,Now,'Alterar Registro Tabela Custo','');
        if not LocalizarCod(6880) then
          Inserir(0,6880,4,151,Now,'Excluir Registro Tabela Custo','');
        if not LocalizarCod(6890) then
          Inserir(0,6890,9,97,Now,'Cancelar Pedido de Compra','');
        if not LocalizarCod(6900) then
          Inserir(0,6900,6,95,Now,'Alterar Configuracoes','');
        if not LocalizarCod(6910) then
          Inserir(0,6910,1,7,Now,'Inserir/Alterar Tabela de Preco','');
        if not LocalizarCod(6920) then
          Inserir(0,6920,1,7,Now,'Inserir/Alterar Item Tabela de Preco','');
        if not LocalizarCod(6930) then
          Inserir(0,6930,1,7,Now,'Excluir Tabela de Preco','');
        if not LocalizarCod(6940) then
          Inserir(0,6940,1,7,Now,'Excluir Item Tabela de Preco','');
        if not LocalizarCod(6950) then
          Inserir(0,6950,6,81,Now,'Imprimir Etiqueta Usuario','');
        if not LocalizarCod(6960) then
          Inserir(0,6960,3,21,Now,'Alterar Dt Pagamento 5 dias TPG','');
        if not LocalizarCod(6970) then
          Inserir(0,6970,3,21,Now,'Alterar Dt Pagamento Total TPG','');
        if not LocalizarCod(6980) then
          Inserir(0,6980,12,100,Now,'Acessar Relatórios','');
        if not LocalizarCod(6990) then
          Inserir(0,6990,12,152,Now,'Relatório Tarefas','');
        if not LocalizarCod(7000) then
          Inserir(0,7000,3,114,Now,'Tabela de Custo','');
        if not LocalizarCod(7010) then
          Inserir(0,7010,3,147,Now,'Inserir Cheque Emitido','');
        if not LocalizarCod(7020) then
          Inserir(0,7020,3,147,Now,'Alterar Cheque Emitido','');
        if not LocalizarCod(7030) then
          Inserir(0,7030,3,147,Now,'Excluir Cheque Emitido','');
        if not LocalizarCod(7040) then
          Inserir(0,7040,2,156,Now,'Reduçao Z','');
        if not LocalizarCod(7050) then
          Inserir(0,7050,2,156,Now,'Imprimir Leitura X','');
        if not LocalizarCod(7060) then
          Inserir(0,7060,2,156,Now,'Cancelar Último Cupom','');
        if not LocalizarCod(7070) then
          Inserir(0,7070,2,156,Now,'Relatório Tipo 60 - Mestre','');
        if not LocalizarCod(7080) then
          Inserir(0,7080,2,156,Now,'Relatório Tipo 60 - Analítico','');
        if not LocalizarCod(7090) then
          Inserir(0,7090,2,156,Now,'Mapa Resumo','');
        if not LocalizarCod(7100) then
          Inserir(0,7100,2,156,Now,'Exibir Alíquota','');
        if not LocalizarCod(7110) then
          Inserir(0,7110,2,156,Now,'Exibir Leitura X','');
        if not LocalizarCod(7120) then
          Inserir(0,7120,2,156,Now,'Exibir Última Redução','');
        if not LocalizarCod(7130) then
          Inserir(0,7130,2,156,Now,'Exibir Número de Série','');
        if not LocalizarCod(7140) then
          Inserir(0,7140,2,156,Now,'Exibir Número/Valor de Cancelamentos','');
        if not LocalizarCod(7150) then
          Inserir(0,7150,2,156,Now,'Resetar (Erro)','');
        if not LocalizarCod(7160) then
          Inserir(0,7160,2,156,Now,'Adicionar Alíquota','');
        if not LocalizarCod(7170) then
          Inserir(0,7170,2,156,Now,'Verificar Firmware','');
        if not LocalizarCod(7180) then
          Inserir(0,7180,2,156,Now,'Verificar Arredondamento','');
        if not LocalizarCod(7190) then
          Inserir(0,7190,2,156,Now,'Programar para Truncamento','');
        if not LocalizarCod(7200) then
          Inserir(0,7200,2,156,Now,'Programar para Arredondamento','');
        if not LocalizarCod(7210) then
          Inserir(0,7210,2,156,Now,'Configurar Horário de Verão','');
        if not LocalizarCod(7220) then
          Inserir(0,7220,2,156,Now,'Configurar Símbolo da Moeda','');
        if not LocalizarCod(7230) then
          Inserir(0,7230,2,156,Now,'Configurar Linhas entre Cupons','');
        if not LocalizarCod(7240) then
          Inserir(0,7240,2,156,Now,'Configurar Gráfico de Autenticação','');
        if not LocalizarCod(7250) then
          Inserir(0,7250,2,156,Now,'Configurar Intensidade de Impressão','');
        if not LocalizarCod(7260) then
          Inserir(0,7260,2,156,Now,'Imprimir Configurações','');
        if not LocalizarCod(7270) then
          Inserir(0,7270,2,156,Now,'Imprimir Memória Fiscal','');
        if not LocalizarCod(7280) then
          Inserir(0,7280,2,156,Now,'Imprimir Relatório Gerencial','');
        if not LocalizarCod(7290) then
          Inserir(0,7290,2,91,Now,'Abertura de Caixa','');
        if not LocalizarCod(7300) then
          Inserir(0,7300,2,91,Now,'Fechamento de Caixa','');
        if not LocalizarCod(7310) then
          Inserir(0,7310,2,121,Now,'MDF','');

        if not LocalizarCod(7320) then
          Inserir(0,7320,3,125,Now,'Diário Auxiliar','');
        if not LocalizarCod(7330) then
          Inserir(0,7330,3,125,Now,'Registros de Duplicatas','');

        if not LocalizarCod(7340) then
          Inserir(0,7340,4,93,Now,'Acerto Reserva',''); //Estoque

        if not LocalizarCod(7350) then
          Inserir(0,7350,1,104,Now,'Dados do Cliente incompletos - VENDA',''); //Pedido de Venda
        if not LocalizarCod(7360) then
          Inserir(0,7360,13,157,Now,'Dados do Cliente incompletos - SERVIÇO',''); //Pedido de Serviço
        if not LocalizarCod(7370) then
          Inserir(0,7370,1,1,Now,'Liberar Desconto à Prazo Especial',''); //Venda

        if not LocalizarCod(7380) then
          Inserir(0,7380,4,41,Now,'Definir Insumos',''); //Cadastro de Produto
        if not LocalizarCod(7390) then
          Inserir(0,7390,4,41,Now,'Dados para Enviar ao Site',''); //Cadastro de Produto

        if not LocalizarCod(7400) then
          Inserir(0,7400,3,21,Now,'Desconto Simples Pagamento',''); //Título a Pagar

        if not LocalizarCod(7410) then
          Inserir(0,7410,3,20,Now,'Desconto Simples Recebimento',''); //Título a Receber
        if not LocalizarCod(7420) then
          Inserir(0,7420,3,20,Now,'Desconto Especial Recebimento',''); //Título a Receber
        if not LocalizarCod(7430) then
          Inserir(0,7430,3,20,Now,'Desconto Total Recebimento',''); //Título a Receber

        if not LocalizarCod(7440) then
          Inserir(0,7440,1,158,Now,'Acessar Faturamento Pendente',''); //Faturamento Pendente
        if not LocalizarCod(7450) then
          Inserir(0,7450,1,158,Now,'Processar Faturamento Pendente',''); //Faturamento Pendente

        if not LocalizarCod(7460) then
          Inserir(0,7460,2,91,Now,'Acessar Pagamento pelo Caixa',''); //Caixa / Principal
        if not LocalizarCod(7470) then
          Inserir(0,7470,2,91,Now,'Acessar Controle de Cheques pelo Caixa',''); //Caixa / Principal

        if not LocalizarCod(7480) then
          Inserir(0,7480,3,92,Now,'Acessar Movimentos em Conta Corrente',''); //
        if not LocalizarCod(7490) then
          Inserir(0,7490,3,20,Now,'Inserir Crédito Manual em Conta Corrente',''); //
        if not LocalizarCod(7500) then
          Inserir(0,7500,2,21,Now,'Inserir Débito Manual em Conta Corrente',''); //

        if not LocalizarCod(7510) then
          Inserir(0,7510,1,119,Now,'Quantidade Normal Venda',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7520) then
          Inserir(0,7520,1,90,Now,'SubMenu Comissões/Faturamento',''); //Principal VENDA
        if not LocalizarCod(7530) then
          Inserir(0,7530,1,119,Now,'.Histórico p/ Vendedor',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7540) then
          Inserir(0,7540,1,119,Now,'.Bônus p/ Vendedor',''); //RELATÓRIOS VENDA

        if not LocalizarCod(7550) then
          Inserir(0,7550,1,106,Now,'Emitir Nota de Conhecimento',''); //Emissão de Nota

        if not LocalizarCod(7560) then
          Inserir(0,7560,1,119,Now,'Reserva Externa',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7570) then
          Inserir(0,7570,1,119,Now,'Pacote de Venda',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7580) then
          Inserir(0,7580,1,119,Now,'Pacote de Crédito',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7590) then
          Inserir(0,7590,1,119,Now,'Vendas',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7600) then
          Inserir(0,7600,1,119,Now,'Vendas Extratificadas',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7610) then
          Inserir(0,7610,1,119,Now,'Curva ABC Produtos',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7620) then
          Inserir(0,7620,1,119,Now,'Preferência do Cliente',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7630) then
          Inserir(0,7630,1,119,Now,'Movimentação de Crédito',''); //RELATÓRIOS VENDA

        if not LocalizarCod(7640) then
          Inserir(0,7640,1,119,Now,'.Faturamento P/ Vendedor',''); //RELATÓRIOS VENDA
        if not LocalizarCod(7650) then
          Inserir(0,7650,1,119,Now,'.Faturamento P/ Fornecedor',''); //RELATÓRIOS VENDA

        if not LocalizarCod(7660) then
          Inserir(0,7660,2,91,Now,'Extorno Movimento Avulso',''); //Caixa

        if not LocalizarCod(7670) then
          Inserir(0,7670,1,104,Now,'Entrega Antecipada','');
        if not LocalizarCod(7680) then
          Inserir(0,7680,1,104,Now,'Extorno Entrega Antecipada','');

        if not LocalizarCod(7690) then
          Inserir(0,7690,4,41,Now,'Visualizar Preços Compra',''); //Cadastro de Produto
        if not LocalizarCod(7700) then
          Inserir(0,7700,4,41,Now,'Visualizar Preços Custo',''); //Cadastro de Produto
        if not LocalizarCod(7710) then
          Inserir(0,7710,4,41,Now,'Visualizar Preços Mínimo',''); //Cadastro de Produto
        if not LocalizarCod(7720) then
          Inserir(0,7720,4,41,Now,'Alterar Preços Compra',''); //Cadastro de Produto
        if not LocalizarCod(7730) then
          Inserir(0,7730,4,41,Now,'Alterar Preços Custo',''); //Cadastro de Produto
        if not LocalizarCod(7740) then
          Inserir(0,7740,4,41,Now,'Alterar Preços Mínimo',''); //Cadastro de Produto

        if not LocalizarCod(7750) then
          Inserir(0,7750,1,5,Now,'Alterar Cliente Balcão',''); //Cadastro de Cliente

        if not LocalizarCod(7760) then
          Inserir(0,7760,3,159,Now,'Inserir Banco-Boleto',''); //Banco - Boleto
        if not LocalizarCod(7770) then
          Inserir(0,7770,3,159,Now,'Alterar Banco-Boleto',''); //Banco - Boleto
        if not LocalizarCod(7780) then
          Inserir(0,7780,3,159,Now,'Excluir Banco-Boleto',''); //Banco - Boleto
        if not LocalizarCod(7790) then
          Inserir(0,7790,3,159,Now,'Acessar Banco-Boleto',''); //Banco - Boleto

        if not LocalizarCod(7800) then
          Inserir(0,7800,4,37,Now,'Inserir/Alterar Inventário',''); //Inventário
        if not LocalizarCod(7810) then
          Inserir(0,7810,4,37,Now,'Excluir Inventário',''); //Inventário
        if not LocalizarCod(7820) then
          Inserir(0,7820,4,37,Now,'Inserir Item de Inventário',''); //Inventário
        if not LocalizarCod(7830) then
          Inserir(0,7830,4,37,Now,'Alterar Item de Inventário',''); //Inventário
        if not LocalizarCod(7840) then
          Inserir(0,7840,4,37,Now,'Excluir Item de Inventário',''); //Inventário

        if not LocalizarCod(7850) then
          Inserir(0,7850,1,104,Now,'Pagamento Antecipado',''); //Pedido de Venda
        if not LocalizarCod(7860) then
          Inserir(0,7860,1,104,Now,'Extorno Pagamento Antecipado',''); //Pedido de Venda

        //Assis
        if not LocalizarCod(7870) then
          Inserir(0,7870,3,20,Now,'Geração de Custos Extras/Cartório',''); //Pedido de Venda

        if not LocalizarCod(7880) then
          Inserir(0,7880,4,41,Now,'Alterar Preço de Venda',''); //Cadastro de Produto

        if not LocalizarCod(7890) then
          Inserir(0,7890,1,106,Now,'Imprimir Espelho de Nota Fiscal',''); //Emissão de Nota Fiscal

        if not LocalizarCod(7900) then
          Inserir(0,7900,1,5,Now,'Alterar Lim. Crédito Convênio Manualmente',''); //Cadastro de Cliente

        if not LocalizarCod(7910) then
          Inserir(0,7910,1,104,Now,'Liberar Pedido de Venda',''); //Pedido de Venda

        if not LocalizarCod(7920) then
          Inserir(0,7920,1,149,Now,'Liberar Pacote de Venda',''); //Pacote de Venda
      end;

      with DM.TipoParam1 do
      Begin
        Open;
        if not LocalizarCod(31) then
          Inserir(31, 'GRUPO CONTA DE CAIXA');
        if not LocalizarCod(50) then
          Inserir(50, 'MOVIMENTO DE CREDITO');
        if not LocalizarCod(60) then
          Inserir(60, 'CLASSIFICAÇÃO DE CLIENTE');
        if not LocalizarCod(70) then
          Inserir(70, 'MOVIMENTO DE CHEQUE');
        if not LocalizarCod(80) then
          Inserir(80, 'TABELAS');
        if not LocalizarCod(90) then
          Inserir(90, 'MEIO DE CONHECIMENTO'); //Jornal / Revista / Panfleto
        if not LocalizarCod(100) then
          Inserir(100, 'MOVIMENTO DE CONTA CORRENTE'); //REC CLIENTE / PAG FORNECEDOR / ... (Juros,CPMF)
        if not LocalizarCod(110) then
          Inserir(110, 'TIPO DE CLIENTE'); //Oftamologista/
      end;

      WITH DM.Parametro1 do
      Begin
        Open;
        if not LocalizarCod(360) then
          Inserir(360, 14, 'COMPRA');  //Tipo de Nota
        if not LocalizarCod(361) then
          Inserir(361, 14, 'VENDA');  //Tipo de Nota
        if not LocalizarCod(362) then
          Inserir(362, 14, 'DEVOLUCAO');  //Tipo de Nota
        if not LocalizarCod(363) then
          Inserir(363, 14, 'CORRECAO DE DADOS');  //Tipo de Nota
        if not LocalizarCod(364) then
          Inserir(364, 14, 'SIMPLES REMESSA');  //Tipo de Nota
        if not LocalizarCod(365) then
          Inserir(365, 14, 'TRANSFERENCIA');  //Tipo de Nota
        if not LocalizarCod(366) then
          Inserir(366, 14, 'DEMONSTRACAO');  //Tipo de Nota
        if not LocalizarCod(367) then
          Inserir(367, 14, 'CONSERTO');  //Tipo de Nota
        if not LocalizarCod(368) then
          Inserir(368, 14, 'SERVICO');  //Tipo de Nota
        if not LocalizarCod(369) then
          Inserir(369, 14, 'FRETE');  //Tipo de Nota
        if not LocalizarCod(374) then
          Inserir(374, 14, 'REABERTURA'); //movimento de estoque
        if not LocalizarCod(380) then
          Inserir(380, 14, 'ENTRADA AVULSA');
        if not LocalizarCod(385) then
          Inserir(385, 14, 'SAIDA AVULSA');
        if not LocalizarCod(418) then
          Inserir(418, 14, 'DIVERSOS');  //Tipo de Nota
        if not LocalizarCod(451) then
          Inserir(451, 14, 'IMOBILIZADO');  //Tipo de Nota
        if not LocalizarCod(460) then
          Inserir(460, 14, 'PACOTE_DE_VENDA'); //Tipo de Nota
        if not LocalizarCod(520) then
          Inserir(520, 14, 'EMPRESTIMO SAI'); //Tipo de Nota
        if not LocalizarCod(530) then
          Inserir(530, 14, 'EMPRESTIMO ENT'); //Tipo de Nota
        if not LocalizarCod(1000) then
          Inserir(1000, 50, 'VENDA PACOTE');
        if not LocalizarCod(1001) then
          Inserir(1001, 50, 'MANUAL');
        if not LocalizarCod(1002) then
          Inserir(1002, 50, 'DEV. PEDIDO');
        if not LocalizarCod(1003) then
          Inserir(1003, 50, 'PAG. TITULO');
        if not LocalizarCod(1004) then
          Inserir(1004, 50, 'DEV. PACOTE');
        if not LocalizarCod(1010) then
          Inserir(1010, 14, 'INVENTARIO'); //movimento de estoque
        if not LocalizarCod(1020) then
          Inserir(1020, 14, 'BENEFICIAMENTO'); //Tipo de Nota
        if not LocalizarCod(1030) then
          Inserir(1030, 14, 'MOSTRUARIO'); //Tipo de Nota
        if not LocalizarCod(1040) then
          Inserir(1040, 14, 'DEMONSTRACAO EXT'); //Tipo de Nota
        if not LocalizarCod(1050) then
          Inserir(1050, 14, 'DANIFICADO/PERCA'); //movimento de estoque
        if not LocalizarCod(1060) then
          Inserir(1060, 70, 'BAIXA TITULO');
        if not LocalizarCod(1070) then
          Inserir(1070, 70, 'EXCLUIDO/ENTREGUE');
        if not LocalizarCod(1080) then
          Inserir(1080, 70, 'MUDAR CENTRO');
        if not LocalizarCod(1090) then
          Inserir(1090, 70, 'FACTORING');
        if not LocalizarCod(1100) then
          Inserir(1100, 70, 'DEPOSITADO');
        if not LocalizarCod(1110) then
          Inserir(1110, 70, 'DEVOLVIDO 1a');
        if not LocalizarCod(1120) then
          Inserir(1120, 70, 'DEVOLVIDO 2a');

        if not LocalizarCod(4000) then
          Inserir(4000, 14, 'COMODATO'); //Tipo de Nota


        if not LocalizarCod(4010) then
          Inserir(4010, 70, 'REC AVULSO');  //Tipo de Mov. de Cheque

        if not LocalizarCod(4020) then
          Inserir(4020, 14, 'CONSIGNACAO');  //Tipo de Nota

        if not LocalizarCod(4030) then
          Inserir(4030, 50, 'EXT. TITULO'); //Movimento de Crédito

        if not LocalizarCod(4040) then
          Inserir(4040, 70, 'EXC FACTORING'); //Factoring

        if not LocalizarCod(4050) then
          Inserir(4050, 70, 'PAGAR TITULO');    //Tipo de Mov. de Cheque
        if not LocalizarCod(4060) then
          Inserir(4060, 70, 'PAG AVULSO');      //Tipo de Mov. de Cheque
        if not LocalizarCod(4070) then
          Inserir(4070, 70, 'EXT RECEBIMENTO'); //Tipo de Mov. de Cheque
        if not LocalizarCod(4080) then
          Inserir(4080, 70, 'EXT PAGAMENTO');   //Tipo de Mov. de Cheque

        if not LocalizarCod(4090) then
          Inserir(4090, 14, 'COMPRA CANCELADA');   //Movimento de Esotuque

        if not LocalizarCod(4100) then
          Inserir(4100, 14, 'EMBARQUE');   //Mov.


        //Tipo de Movimento de Cheque 0 = Débito e 1 = Crédito
        if not LocalizarCod(4110) then
          Inserir(4110, 100, 'REC CLIENTE', 1);    //Tipo de Mov. de Conta Corrente
        if not LocalizarCod(4120) then
          Inserir(4120, 100, 'PAG FORNECEDOR', 0);      //Tipo de Mov. de Conta Corrente
        if not LocalizarCod(4130) then
          Inserir(4130, 100, 'PAG TRANSPORTADORA', 0);      //Tipo de Mov. de Conta Corrente
        if not LocalizarCod(4140) then
          Inserir(4140, 100, 'CPMF', 0);      //Tipo de Mov. de Conta Corrente
        if not LocalizarCod(4150) then
          Inserir(4150, 100, 'JUROS/IOF', 0);      //Tipo de Mov. de Conta Corrente
        if not LocalizarCod(4160) then
          Inserir(4160, 100, 'DEPOSITO AVULSO', 1);      //Tipo de Mov. de Conta Corrente
        if not LocalizarCod(4170) then
          Inserir(4170, 100, 'CHEQUE DEPOSITADO', 1);      //Tipo de Mov. de Conta Corrente
        if not LocalizarCod(4180) then
          Inserir(4180, 100, 'CHEQUE EMITIDO', 0);      //Tipo de Mov. de Conta Corrente

        if not LocalizarCod(4190) then
          Inserir(4190, 50, 'PAG. ANTECIPADO');  //Movimento de Crédito de Cliente

        if not LocalizarCod(4200) then
          Inserir(4200, 14, 'ENTREGA ANTECIPADA');  //Movimento de estoque

        if not LocalizarCod(4220) then
          Inserir(4220, 6, 'INDICADOR/CORRETOR');  //Função de Funcionário

        if not LocalizarCod(4230) then
          Inserir(4230, 50, 'EXT.PAG. ANTECIPADO');  //Movimento de Crédito de Cliente

        if not LocalizarCod(4240) then
          Inserir(4240, 14, 'AQUISICAO');  //Tipo de Nota

      end;
      try
        ExecutaSQL(Query1, 'DELETE FROM OPERACAO_FISCAL '+
          ' WHERE OPF_CODIGO<999');
      except
      end;

      with DM.OperFiscal1 do
      Begin
        Open;
        if not LocalizarCod( 1102 ) then
          Inserir( 1102 ,    360  ,'COMPRA PARA COMERCIALIZAÇÃO (UF)         ', 0 (*Entrada*));
        if not LocalizarCod( 1152 ) then
          Inserir( 1152 ,    365  ,'TRANSFERENCIA DE MERCADORIA (UF)         ', 0 (*Entrada*));
        if not LocalizarCod( 1202 ) then
          Inserir( 1202 ,    362  ,'DEVOLUCAO DE VENDA (UF)                  ', 0 (*Entrada*));
        if not LocalizarCod( 1253 ) then
          Inserir( 1253 ,    369  ,'AQUISICAO ENERGIA ELETRICA (UF)          ', 0 (*Entrada*));
        if not LocalizarCod( 1303 ) then
          Inserir( 1303 ,    369  ,'AQUISICAO SERVICOS DE COMUNICACAO (UF)   ', 0 (*Entrada*));
        if not LocalizarCod( 1353 ) then
          Inserir( 1353 ,    369  ,'AQUISICAO SERVICOS TRANSPORTE (UF)       ', 0 (*Entrada*));
        if not LocalizarCod( 1551 ) then
          Inserir( 1551 ,    451  ,'COMPRA BEM ATIVO IMOBILIZADO (UF)        ', 0 (*Entrada*));
        if not LocalizarCod( 1913 ) then
          Inserir( 1913 ,    366  ,'RETORNO DEMONSTRACAO (UF)                ', 0 (*Entrada*));
        if not LocalizarCod( 1916 ) then
          Inserir( 1916 ,    367  ,'RETORNO DE MERC. P/ CONSERTO (UF)        ', 0 (*Entrada*));
        if not LocalizarCod( 1949 ) then
          Inserir( 1949 ,    418  ,'OUTRAS ENT. MERC./PREST. (UF)            ', 0 (*Entrada*));
        if not LocalizarCod( 2102 ) then
          Inserir( 2102 ,    360  ,'COMPRA PARA COMERCIALIZAÇÃO (FORA UF)    ', 0 (*Entrada*));
        if not LocalizarCod( 2202 ) then
          Inserir( 2202 ,    362  ,'DEVOLUÇÃO DE VENDA (FORA UF)             ', 0 (*Entrada*));
        if not LocalizarCod( 2353 ) then
          Inserir( 2353 ,    369  ,'AQUISICAO SERVICOS TRANSPORTE (FORA UF)  ', 0 (*Entrada*));
        if not LocalizarCod( 2551 ) then
          Inserir( 2551 ,    451  ,'COMPRA BEM ATIVO IMOBILIZADO (FORA UF)   ', 0 (*Entrada*));
        if not LocalizarCod( 2913 ) then
          Inserir( 2913 ,    366  ,'RETORNO DEMONSTRACAO (FORA UF)           ', 0 (*Entrada*));
        if not LocalizarCod( 2916 ) then
          Inserir( 2916 ,    367  ,'RETORNO DE MERC. P/ CONSERTO (FORA UF)   ', 0 (*Entrada*));
        if not LocalizarCod( 2949 ) then
          Inserir( 2949 ,    418  ,'OUTRAS ENT. MERC./PREST. (FORA UF)       ', 0 (*Entrada*));
        if not LocalizarCod( 5102 ) then
          Inserir( 5102 ,    361  ,'VENDA DE MERCADORIA (UF)                 ', 1 (*Saída*));
        if not LocalizarCod( 5117 ) then
          Inserir( 5117 ,    361  ,'VENDA DE MERC. ENTREGA FUTURA (UF)       ', 1 (*Saída*));
        if not LocalizarCod( 5152 ) then
          Inserir( 5152 ,    365  ,'TRANSFERENCIA DE MERCADORIA SAIDA (UF)   ', 1 (*Saída*));
        if not LocalizarCod( 5202 ) then
          Inserir( 5202 ,    362  ,'DEVOLUCAO DE COMPRA (UF)                 ', 1 (*Saída*));
        if not LocalizarCod( 5912 ) then
          Inserir( 5912 ,    366  ,'REMESSA DEMONSTRACAO (UF)                ', 1 (*Saída*));
        if not LocalizarCod( 5915 ) then
          Inserir( 5915 ,    367  ,'REMESSA DE MERC. P/ CONSERTO  (UF)       ', 1 (*Saída*));
        if not LocalizarCod( 5922 ) then
          Inserir( 5922 ,    361  ,'MERC. DE VENDA ENTREGA FUT. (UF)         ', 1 (*Saída*));
        if not LocalizarCod( 5923 ) then
          Inserir( 5923 ,    364  ,'SIMPLES REMESSA (UF)                     ', 1 (*Saída*));
        if not LocalizarCod( 5929 ) then
          Inserir( 5929 ,    364  ,'VENDA DE MERCADORIA REGISTRADA EM CUPOM  ', 1 (*Saída*));
        if not LocalizarCod( 5949 ) then
          Inserir( 5949 ,    368  ,'OUTRAS SAIDAS MERC./PREST. (UF)          ', 1 (*Saída*));
        if not LocalizarCod( 6102 ) then
          Inserir( 6102 ,    361  ,'VENDA DE MERCADORIAS (FORA UF)           ', 1 (*Saída*));
        if not LocalizarCod( 6108 ) then
          Inserir( 6108 ,    361  ,'VENDA MERCADORIA P/NÂO CONTRIB(FORA UF)  ', 1 (*Saída*));
        if not LocalizarCod( 6117 ) then
          Inserir( 6117 ,    361  ,'VENDA DE MERC. ENTREGA FUTURA (FORA UF)  ', 1 (*Saída*));
        if not LocalizarCod( 6202 ) then
          Inserir( 6202 ,    362  ,'DEVOLUCAO DE COMPRA (FORA UF)            ', 1 (*Saída*));
        if not LocalizarCod( 6912 ) then
          Inserir( 6912 ,    366  ,'REMESSA DEMONSTRACAO (FORA UF)           ', 1 (*Saída*));
        if not LocalizarCod( 6915 ) then
          Inserir( 6915 ,    367  ,'REMESSA DE MERC. P/ CONSERTO  (FORA UF)  ', 1 (*Saída*));
        if not LocalizarCod( 6922 ) then
          Inserir( 6922 ,    361  ,'MERC. DE VENDA ENTREGA FUTURA (FORA UF)  ', 1 (*Saída*));
        if not LocalizarCod( 6923 ) then
          Inserir( 6923 ,    364  ,'SIMPLES REMESSA (FORA UF)                ', 1 (*Saída*));
        if not LocalizarCod( 6949 ) then
          Inserir( 6949 ,    363  ,'OUTRAS SAIDAS MERC./PREST. (FORA UF)     ', 1 (*Saída*));
        if not LocalizarCod( 5901 ) then
          Inserir( 5901 ,    1020  ,'BENEFICIAMENTO SAIDA (UF)               ', 1 (*Saída*));
        if not LocalizarCod( 6901 ) then
          Inserir( 6901 ,    1020  ,'BENEFICIAMENTO SAIDA (FORA UF)          ', 1 (*Saída*));
        if not LocalizarCod( 5902 ) then
          Inserir( 5902 ,    1020  ,'BENEFICIAMENTO ENTRADA (UF)             ', 0 (*Entrada*));
        if not LocalizarCod( 6902 ) then
          Inserir( 6902 ,    1020  ,'BENEFICIAMENTO ENTRADA (FORA UF)        ', 0 (*Entrada*));
        if not LocalizarCod( 1912 ) then
          Inserir( 1912 ,    1040  ,'MERCADORIA REC. EM DEMONSTRACAO (UF)    ', 0 (*Entrada*));
        if not LocalizarCod( 5913 ) then
          Inserir( 5913 ,    1040  ,'RETORNO MERC. REC. EM DEMONSTRACAO (UF) ', 1 (*Saída*));
        if not LocalizarCod( 5909 ) then
          Inserir( 5909 ,    4000  ,'RETORNO BENS REC.CONT.COMODATO (UF)     ', 1 (*Saída*));
        if not LocalizarCod( 6917 ) then
          Inserir( 6917 ,    4020  ,'REMESSA EM CONSIGNACAO (FORA UF)        ', 1 (*Saída*));
        if not LocalizarCod( 6918 ) then
          Inserir( 6918 ,    4020  ,'RETORNO REMESSA EM CONSIGNACAO (FORA UF)', 0 (*Entrada*));
        if not LocalizarCod( 5102 ) then
          Inserir( 5102 ,    361  ,'VENDA DE MERCADORIA (UF)                 ', 1 (*Saída*));
        if not LocalizarCod( 1556 ) then
          Inserir( 1556 ,    4240  ,'COMPRA DE MATERIAL USO/CONSUMO (UF)     ', 0 (*Entrada*));
        if not LocalizarCod( 2556 ) then
          Inserir( 2556 ,    4240  ,'COMPRA DE MATERIAL USO/CONSUMO (FORA UF)', 0 (*Entrada*));
        if not LocalizarCod( 1552 ) then
          Inserir( 1552 ,    451   ,'TRANSFERENCIA DE BEM ATIVO IMOBIL. (UF) ', 0 (*Entrada*));
        if not LocalizarCod( 5552 ) then
          Inserir( 5552 ,    451   ,'TRANSFERENCIA DE BEM DO ATIVO IMOBIL(UF)', 1 (*Saída*));
      end;

      with DM.Forma_de_Pagamento1 do
      Begin
        Open;
        if not LocalizarCod(1) then
          Inserir(DM.Configuracao1.CodigoCNC, 1, False, False, '0', 'A Vista');
      end;


      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=21 '+
        'WHERE OPS_CODIGO = 2230 ');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=21 '+
        'WHERE OPS_CODIGO = 2220 ');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=20 '+
        'WHERE OPS_CODIGO = 2200 ');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=20 '+
        'WHERE OPS_CODIGO = 2190 ');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=100,MDL_CODIGO=12 '+
        'WHERE OPS_CODIGO = 4570 ');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=90,MDL_CODIGO=1 '+
        'WHERE OPS_CODIGO = 2250 ');

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=159 '+
        'WHERE OPS_CODIGO = 6560 '); //Banco Boleto
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=159 '+
        'WHERE OPS_CODIGO = 6570 '); //Banco Boleto

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=3,MDL_CODIGO=125 '+
        'WHERE OPS_CODIGO = 3050 ');  //Relatório Forma de Pagamento


      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=103,MDL_CODIGO=1 '+
        'WHERE OPS_CODIGO = 2240 '); //Acessar Registro de Procura

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Liberar Desconto à prazo Simples" '+
        'WHERE OPS_CODIGO = 3600 ');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Liberar Desconto Total" '+
        'WHERE OPS_CODIGO = 3540 ');

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Alterar Dt Pagamento 5 dias" '+
        'WHERE OPS_CODIGO = 6050 ');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Alterar Dt Pagamento Total" '+
        'WHERE OPS_CODIGO = 6060 ');

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Mapa de Tributos Federais" '+
        'WHERE OPS_CODIGO = 6340 ');

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=121 '+
        'WHERE OPS_CODIGO = 7310 ');

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=95,MDL_CODIGO=6 '+
        'WHERE OPS_CODIGO = 4010 ');

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=10,MDL_CODIGO=6 '+
        'WHERE OPS_CODIGO = 170 '); //Acessar Funcionários

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=49,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 570 '); //Acessar Contato

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=153,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 2380 '); //Acessar Pedido de Compra
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=153,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 3660 '); //Inserir Pedido de Compra
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=153,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 3670 '); //Alterar Pedido de Compra
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=153,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 3680 '); //Excluir Pedido de Compra
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=153,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 6260 '); //Confirmar sem Nota
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=153,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 6890 '); //Cancelar Pedido de Compra

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=156,MDL_CODIGO=2, '+
        ' OPS_OPERACAO="Acessar Impressora Fiscal" '+
        'WHERE OPS_CODIGO = 3770 '); //Acessar Impressora Fiscal

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Inserir Cheque Recebido" '+
        'WHERE OPS_CODIGO = 6650 '); //Inserir Cheque Recebido
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Alterar Cheque Recebido" '+
        'WHERE OPS_CODIGO = 6670 '); //Alterar Cheque Recebido
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Excluir Cheque Recebido" '+
        'WHERE OPS_CODIGO = 6680 '); //Excluir Cheque Recebido


      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Acessar Emissão de Nota Externa" '+
        ' WHERE OPS_CODIGO = 6220 '); //Emissão Nota Avulsa

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=20,MDL_CODIGO=3 '+
        'WHERE OPS_CODIGO = 3760 '); //Cancelar Renegociação
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=20,MDL_CODIGO=3 '+
        'WHERE OPS_CODIGO = 3750 '); //Renegociar Título
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=20,MDL_CODIGO=3 '+
        'WHERE OPS_CODIGO = 3470 '); //Renegociação menor que o valor principal

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=155,MDL_CODIGO=10 '+
        'WHERE OPS_CODIGO = 3690 '); //Inserir Cobrança por Cobrador
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=155,MDL_CODIGO=10 '+
        'WHERE OPS_CODIGO = 3700 '); //Alterar Cobrança por Cobrador
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=155,MDL_CODIGO=10 '+
        'WHERE OPS_CODIGO = 3710 '); //Excluir Cobrança por Cobrador
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=155,MDL_CODIGO=10 '+
        'WHERE OPS_CODIGO = 3630 '); //Excluir Registro de Cobrança Pago

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=9,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 130 '); //Acessar Fornecedores

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=154,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 2360 '); //Acessar Cotação
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=97,MDL_CODIGO=9, '+
        ' OPS_OPERACAO="Cad/Alt/Exc UF-ICMS" '+
        'WHERE OPS_CODIGO = 3920 '); //Acessar Cad/Alt/Exc ICMS UF

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=11,MDL_CODIGO=9 '+
        'WHERE OPS_CODIGO = 210 '); //Acessar Transportadora

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=93,MDL_CODIGO=4 '+
        'WHERE OPS_CODIGO = 3880 '); //Cad/Alt/Exc Bonu
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=93,MDL_CODIGO=4 '+
        'WHERE OPS_CODIGO = 3860 '); //Cad/Alt/Exc Emprestimo
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=93,MDL_CODIGO=4 '+
        'WHERE OPS_CODIGO = 3850 '); //Cad/Alt/Exc Manufaturar Produtos

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=36,MDL_CODIGO=4, '+
        'OPS_OPERACAO="Acessar Estoque Indisponível" '+
        'WHERE OPS_CODIGO = 2590 '); //Acessar Sol. Pecas de Rep.
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=36,MDL_CODIGO=4, '+
        'OPS_OPERACAO="Alterar Estoque Indisponível" '+
        'WHERE OPS_CODIGO = 1200 '); //Alterar Sol. Pecas de Rep.
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=36,MDL_CODIGO=4, '+
        'OPS_OPERACAO="Excluir Estoque Indisponível" '+
        'WHERE OPS_CODIGO = 1190 '); //Excluir Sol. Pecas de Rep.
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=36,MDL_CODIGO=4, '+
        'OPS_OPERACAO="Inserir Estoque Indisponível" '+
        'WHERE OPS_CODIGO = 1180 '); //Inserir Sol. Pecas de Rep.

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=119,MDL_CODIGO=1, '+
        ' OPS_OPERACAO="Registro de Procura" '+
        'WHERE OPS_CODIGO = 2940 '); //Relatório de Registro de Procura


      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Definir Cliente Atacado" '+
        'WHERE OPS_CODIGO = 3720 ');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Definir Desconto Cliente" '+
        'WHERE OPS_CODIGO = 3780 ');


      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET  '+
        ' OPS_OPERACAO=".Histórico P/ Vendedor" '+
        'WHERE OPS_CODIGO = 7530');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET  '+
        ' OPS_OPERACAO=".Bônus P/ Vendedor" '+
        'WHERE OPS_CODIGO = 7540');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET  '+
        ' OPS_OPERACAO=".Comissão de Vendas" '+
        'WHERE OPS_CODIGO = 3380');
      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET  '+
        ' OPS_OPERACAO=".Comissão de Vendas (Nota/LJ3)" '+
        'WHERE OPS_CODIGO = 4000');

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=3 '+
        'WHERE SML_CODIGO = 65 ');
      ExecutaSQL(Query1,'UPDATE SUBMODULO SET MDL_CODIGO=3 '+
        'WHERE SML_CODIGO = 65 ');

      ExecutaSQL(Query1,'UPDATE SUBMODULO SET SML_DESCRICAO="Indisponibilizar Estoque" '+
        'WHERE SML_CODIGO = 36 '); //Sol. Pec. de Rep.

      ExecutaSQL(Query1,'DELETE FROM SUBMODULO WHERE SML_CODIGO=118 '); //Cadastros

      ExecutaSQL(Query1,'DELETE FROM SUBMODULO WHERE SML_CODIGO=117 '); //Cadastros

      ExecutaSQL(Query1,'DELETE FROM SUBMODULO WHERE SML_CODIGO=126 '); //Cadastros

      ExecutaSQL(Query1,'DELETE FROM SUBMODULO WHERE SML_CODIGO=68 '); //Cadastros Sol. pecas de Rep

      ExecutaSQL(Query1,'DELETE FROM SUBMODULO WHERE SML_CODIGO=8 '); //Seções
      ExecutaSQL(Query1,'DELETE FROM OPERACAO_DO_SISTEMA '+
        ' WHERE SML_CODIGO=8 OR OPS_CODIGO=90 '); //Seções

      ExecutaSQL(Query1,'DELETE FROM OPERACAO_DO_SISTEMA '+
        ' WHERE OPS_CODIGO=1170 '); //Solc. Percas Rep. errado

      ExecutaSQL(Query1,'DELETE FROM OPERACAO_DO_SISTEMA '+
        ' WHERE OPS_CODIGO=3190 '); //Fluxo de Caixa Mensal

      ExecutaSQL(Query1,'DELETE FROM OPERACAO_DO_SISTEMA '+
        ' WHERE OPS_CODIGO=2400 '); //Acessar Controle de Cobrança

      ExecutaSQL(Query1,'UPDATE SUBMODULO SET SML_DESCRICAO="Registro de Procura"'+
        ' WHERE SML_CODIGO=103'); //Registro de Procura

      ExecutaSQL(Query1,'DELETE FROM SUBMODULO WHERE SML_CODIGO=102 '); //Registro de Procura

      ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET '+
        ' OPS_OPERACAO="Acessar Pacote de Venda" '+
        'WHERE OPS_CODIGO = 6780 ');
    end;

{    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=90, '+
      'OPS_OPERACAO="Acessar SubMenu Cadastros Venda" '+
      'WHERE OPS_CODIGO = 3010 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=90, '+
      'OPS_OPERACAO="Acessar SubMenu Relatórios Venda" '+
      'WHERE OPS_CODIGO = 3020 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=91, '+
      'OPS_OPERACAO="Acessar SubMenu Cadastros Caixa" '+
      'WHERE OPS_CODIGO = 3120 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=91, '+
      'OPS_OPERACAO="Acessar SubMenu Relatórios Caixa" '+
      'WHERE OPS_CODIGO = 3130 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=98, '+
      'OPS_OPERACAO="Acessar SubMenu Relatórios Cobrança" '+
      'WHERE OPS_CODIGO = 3210 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=92, '+
      'OPS_OPERACAO="Acessar SubMenu Cadastros Financeiro" '+
      'WHERE OPS_CODIGO = 3240 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=92, '+
      'OPS_OPERACAO="Acessar SubMenu Relatórios Financeiro" '+
      'WHERE OPS_CODIGO = 3250 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=92, '+
      'OPS_OPERACAO="Acessar SubMenu Contas à Receber Financ." '+
      'WHERE OPS_CODIGO = 2300 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=93, '+
      'OPS_OPERACAO="Acessar SubMenu Cadastros Estoque" '+
      'WHERE OPS_CODIGO = 3390 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=93, '+
      'OPS_OPERACAO="Acessar SubMenu Relatórios Estoque" '+
      'WHERE OPS_CODIGO = 2840 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=95, '+
      'OPS_OPERACAO="Acessar SubMenu Cadastros Gerência" '+
      'WHERE OPS_CODIGO = 3410 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=97, '+
      'OPS_OPERACAO="Acessar SubMenu Cadastros Compra" '+
      'WHERE OPS_CODIGO = 2990 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=97, '+
      'OPS_OPERACAO="Acessar SubMenu Relatórios Compra" '+
      'WHERE OPS_CODIGO = 3000 ');
    //Cadastro de Seção
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=6 ,'+
      'SML_CODIGO=95 '+
      'WHERE OPS_CODIGO = 90 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=6 ,'+
      'SML_CODIGO=8 '+
      'WHERE OPS_CODIGO IN (100,110,120) ');
    //Cadastro de Funcionário
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=6 ,'+
      'SML_CODIGO=10 '+
      'WHERE OPS_CODIGO IN (180,190,200) ');
    //Cadastro de Transportadora
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=9 ,'+
      'SML_CODIGO=117 '+
      'WHERE OPS_CODIGO = 210 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=9 ,'+
      'SML_CODIGO=11 '+
      'WHERE OPS_CODIGO IN (220,230,240) ');
    //Cadastro de Fornecedores
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=9 ,'+
      'SML_CODIGO=117 '+
      'WHERE OPS_CODIGO = 130 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=9 ,'+
      'SML_CODIGO=9 '+
      'WHERE OPS_CODIGO IN (140,150,160) ');
    //Cadastro de Contato
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=9 ,'+
      'SML_CODIGO=117 '+
      'WHERE OPS_CODIGO = 570 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=9 ,'+
      'SML_CODIGO=49 '+
      'WHERE OPS_CODIGO IN (580,590,600) ');
    //Recebimento,Recibo,Autenticar,Renegociar de Cliente p/ Caixa/Principal
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=2 ,'+
      'SML_CODIGO=91 '+
      'WHERE OPS_CODIGO = 3100 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=2 ,'+
      'SML_CODIGO=91 '+
      'WHERE OPS_CODIGO = 2170 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=2 ,'+
      'SML_CODIGO=91 '+
      'WHERE OPS_CODIGO = 2180 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=2 ,'+
      'SML_CODIGO=91 '+
      'WHERE OPS_CODIGO = 3470 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=2 ,'+
      'SML_CODIGO=91 '+
      'WHERE OPS_CODIGO = 3750 ');
    //Cadastro de Cotas(LBM)/Tabela de Desconto Venda/Principal
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=1 ,'+
      'SML_CODIGO=90 '+
      'WHERE OPS_CODIGO = 3870 ');
    ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO=1 ,'+
      'SML_CODIGO=90 '+
      'WHERE OPS_CODIGO = 3840 ');
    try
      ExecutaSQL(Query1,'DELETE FROM SUBMODULO WHERE SML_CODIGO NOT IN '+
        '(SELECT SML_CODIGO FROM OPERACAO_DO_SISTEMA)');
    except
    end;
}

    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_VERSAO_INCLUIROPER='+IntToStr(iVersao));
    except
    end;

  end;
  Animate1.Enabled := False;
  ShowMessage('Fim das inclusões! Versão: '+IntToStr(iVersao));
  Application.Terminate;
end;

end.
