unit UAtualizaLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Db, DBTables, SQuery, Titulo_receber, Produto, Grupo,
  Registry, StdCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Query2: TQuery;
    Query1: TQuery;
    Panel1: TPanel;
    edtContador: TEdit;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure Versao_Maior_Igual_91;
    procedure Versao_Maior_Igual_92;
    procedure Versao_Maior_Igual_93;
    procedure Versao_Maior_Igual_94;
    procedure Versao_Maior_Igual_95;
    procedure Versao_Maior_Igual_96;
    procedure Versao_Maior_Igual_97;
    procedure Versao_Maior_Igual_98;
    procedure Versao_Maior_Igual_99;
    procedure Versao_Maior_Igual_100;
    procedure Versao_Maior_Igual_101;
    procedure Versao_Maior_Igual_102;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sTbNFe, sTbItemNFe, sTbConsignacao, sTbItemConsignacao: String;

implementation

uses UDM, Funcoes, CentroCusto;

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
  //Animate1.Active:=True;

  Label1.caption := 'Atualizando tabelas, aguarde. . .';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i:integer;
begin
  //iVersaoBase := 89;
  Timer1.Enabled:=False;
  for i:=0 to 5 do
  Begin
    if i = 1 then
      if (DM.Configuracao1.Empresa <> empEletro) or
         ((DM.Usuario1.CentroDeCusto <> 0) and
          (DM.Usuario1.CentroDeCusto <> 18)) then
         Break;
    with DM.Database2 do
    Begin
      Connected := False;
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
        if DM.Configuracao1.VersaoBase > cVersaoBase then
        Begin
          ShowMessage('Base já atualizada com versão superior!');
          Raise exception.Create('');
        end;
      except
        if i > 0 then
        begin

          Label1.caption := '';
          Self.Visible := false;

          ShowMessage('Fim das atualizações! Versão ('+IntToStr(cVersaoBase)+')');
        end
        else
          ShowMessage('Falha na conexão com a base!');
        Application.Terminate;
        Exit;
      end;
    end;

    Versao_Maior_Igual_102;
    Versao_Maior_Igual_101;
    Versao_Maior_Igual_100;
    Versao_Maior_Igual_99;
    Versao_Maior_Igual_98;
    Versao_Maior_Igual_97;
    Versao_Maior_Igual_96;
    Versao_Maior_Igual_95;
    Versao_Maior_Igual_94;
    Versao_Maior_Igual_93;
    Versao_Maior_Igual_92;
    Versao_Maior_Igual_91;

    if (DM.Configuracao1.VersaoBase <= 90) then
    Begin
      //Anderson NFe - 06/04/2010
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_NFE INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_NFE=0');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 89) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_ESTOQUE_IDEAL INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_ESTOQUE_IDEAL=0');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 88) then
    Begin

      //Anderson Ajustando Base de Dados - 11/04/2010
      try
        ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Cad/Alt/Exc Cotas'' WHERE OPS_CODIGO = 3870');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Cad/Alt/Exc Tabela de Descontos'' WHERE OPS_CODIGO = 3840');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Cupom Especial'' WHERE OPS_CODIGO = 3650');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Entrada Menor que as Prestações'' WHERE OPS_CODIGO = 3830');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Liberar Desconto Gerente'' WHERE OPS_CODIGO = 3930');
      except
      end;
      try
        ExecutaSQL(Query1,'DELETE OPERACAO_DO_SISTEMA WHERE OPS_CODIGO = 3810');
      except
      end;
      try
        ExecutaSQL(Query1,'DELETE OPERACAO_DO_SISTEMA WHERE OPS_CODIGO = 3820');
      except
      end;
      try
        ExecutaSQL(Query1,'DELETE OPERACAO_DO_SISTEMA WHERE OPS_CODIGO = 6000');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE MODULO SET MDL_DESCRICAO = ''Arquivo'' WHERE MDL_CODIGO = 8');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET MDL_CODIGO = 12, SML_CODIGO = 100 WHERE OPS_CODIGO =  4680');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET OPS_OPERACAO = ''Gerar Servico Automático'' WHERE OPS_CODIGO =  7930');
      except
      end;
      //////////////////////////////////////////////////////////////////////////

      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISICO ADD CNC_DESTINO INT DEFAULT 0 NULL');
      except
      end;
      //awof
      try
        ExecutaSQL(Query1,'CREATE TABLE LIMITE_MES ( '+
          ' COD_LIMITE INTEGER IDENTITY (1, 1) NOT NULL, '+
          ' CCX_CODIGO INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' MES INTEGER NOT NULL, '+
          ' VALOR_LIMITE DECIMAL(14, 2) NULL, '+
          ' ILIMITADO CHAR(1) NULL) ');
        ExecutaSQL(Query1,'ALTER TABLE LIMITE_MES ADD PRIMARY KEY (COD_LIMITE)');
      except
      end;
      //Hertz
      try
        ExecutaSQL(Query1,'UPDATE OPERACAO_DO_SISTEMA SET SML_CODIGO=21 WHERE OPS_CODIGO=8420');
      except
      end;
      //Anderson
      try
        ExecutaSQL(Query1,'ALTER TABLE CENTRO_DE_CUSTO ADD CNC_EXTERNO INT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_CLASSIFICACAO INT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_DT_ANTECIPADO DATETIME NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_QUALCPD INT DEFAULT 1 NULL');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_QUALCPD=1 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_PEDIDO_DE_VENDA ADD INF_N_ITEM INT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRANSFERENCIA ADD TRF_FRETE FLOAT DEFAULT 0 ');
        ExecutaSQL(Query1,'UPDATE TRANSFERENCIA SET TRF_FRETE=0 ');
      except
      end;
      // // // // //
    end;

    if (DM.Configuracao1.VersaoBase <= 81) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE LOG ADD CNC_ORIGEM INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE LOG SET CNC_ORIGEM=CNC_CODIGO ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_LABORATORIO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_LABORATORIO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_MONTAGEM INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_MONTAGEM=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_LAB_META FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_LAB_META=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_LAB_COTA1 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_LAB_COTA1=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_LAB_COTA2 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_LAB_COTA2=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_COMPRA ADD FPE_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_COMPRA SET FPE_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_COMPRA ADD PCP_DT_FPE DATETIME NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_PAGAR ADD FPE_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TITULO_A_PAGAR SET FPE_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRANSFERENCIA ADD TRF_TIPO_DOCUMENTO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TRANSFERENCIA SET TRF_TIPO_DOCUMENTO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TABELA_DE_PRECO_SUBGRUPO ADD PRD_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_TABELA_DE_PRECO_SUBGRUPO SET PRD_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TABELA_DE_PRECO ADD TBP_AGF_EXCLUSIVO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TABELA_DE_PRECO SET TBP_AGF_EXCLUSIVO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE FORMA_DE_PAGAMENTO ADD FPG_TIPOPAG_EXCLUSIVO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE FORMA_DE_PAGAMENTO SET FPG_TIPOPAG_EXCLUSIVO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_AUXILIAR ADD FUN_CODIGO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD TRF_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET TRF_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRCTEMP ADD TRF_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TRCTEMP SET TRF_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_ESPECIAL INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE AGENTE_FINANCEIRO SET AGF_ESPECIAL=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_OBSERVACAO VARCHAR(255) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET AGF_CODIGO=54 '+
          ' WHERE AGF_CODIGO IS NULL OR AGF_CODIGO=0 ');
        ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET AGF_CODIGO=54 '+
          ' WHERE AGF_CODIGO IS NULL OR AGF_CODIGO=0 ');
        ExecutaSQL(Query1,'UPDATE TRCTEMP SET AGF_CODIGO=54 '+
          ' WHERE AGF_CODIGO IS NULL OR AGF_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_REC_AVISTA INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE AGENTE_FINANCEIRO SET AGF_REC_AVISTA=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_TAXA_MENSAL FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE AGENTE_FINANCEIRO SET AGF_TAXA_MENSAL=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_OBSERVACAO VARCHAR(255) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_TIPOPAG_EXCLUSIVO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE AGENTE_FINANCEIRO SET AGF_TIPOPAG_EXCLUSIVO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AUTORIZADA ADD AUT_SITUACAO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE AUTORIZADA SET AUT_SITUACAO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AUTORIZADA ADD AUT_OBSERVACAO VARCHAR(255) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AUTORIZADA ADD AUT_DT_CADASTRO DATETIME DEFAULT GETDATE() NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AUTORIZADA ADD AUT_DT_ALTERADO DATETIME NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AUTORIZADA ADD USU_CODIGO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE ATENDIMENTO_POR_VENDEDOR ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' APV_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' FUN_CODIGO INTEGER NOT NULL, '+
          ' APV_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' APV_DT_ALTERADO DATETIME NULL, '+
          ' APV_ATENDIMENTOS INTEGER DEFAULT 0 NULL, '+
          ' APV_SITUACAO INTEGER DEFAULT 0 NULL, '+
          ' APV_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE ATENDIMENTO_POR_VENDEDOR_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' APV_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO ATENDIMENTO_POR_VENDEDOR_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE REPOSICAO ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' REP_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' FOR_CODIGO INTEGER NOT NULL, '+
          ' PRD_CODIGO INTEGER NOT NULL, '+
          ' REP_DESCRICAO VARCHAR(255) NULL, '+
          ' REP_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' REP_DT_ALTERADO DATETIME NULL, '+
          ' REP_SITUACAO INTEGER DEFAULT 0 NULL, '+
          ' REP_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE REPOSICAO_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' REP_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO REPOSICAO_CONF VALUES (0,0)');
      except
      end;
      try
        if (DM.Configuracao1.Empresa = empEletro) and
           (DM.Titulo_receber1.CentroDeCusto = 21) then //Mag_Pacajus
        Begin
          ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET CCX_CODIGO=326 '+
            ' WHERE CCX_CODIGO NOT IN (SELECT CCX_CODIGO FROM CONTA_DE_CAIXA) ');
          ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET CCX_CODIGO_REC=326 '+
            ' WHERE CCX_CODIGO_REC NOT IN (SELECT CCX_CODIGO FROM CONTA_DE_CAIXA) ');
        end;
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 81) then
    Begin
      try
        ExecutaSQL(Query1,'CREATE TABLE ASSISTENCIA_TECNICA ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' AST_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' CNC_PEDIDO INTEGER DEFAULT 0 NULL, '+
          ' PDV_CODIGO INTEGER DEFAULT 0 NULL, '+
          ' PRD_CODIGO INTEGER NOT NULL, '+
          ' AST_RETORNO INTEGER DEFAULT 0 NULL, '+
          ' AST_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' AST_DT_ALTERADO DATETIME NULL, '+
          ' AST_DT_DEPOSITO_ENVIADO DATETIME NULL, '+
          ' AST_DT_DEPOSITO_RECEBIDO DATETIME NULL, '+
          ' AST_DT_ASSISTENCIA_ENVIADO DATETIME NULL, '+
          ' AST_DT_ASSISTENCIA_RETORNADO DATETIME NULL, '+
          ' AST_DT_DEPOSITO_DEVOLVIDO DATETIME NULL, '+
          ' AST_DT_LOJA_RECEBIDO DATETIME NULL, '+
          ' AST_DT_PREVISAO DATETIME NULL, '+
          ' AST_DT_ENTREGA DATETIME NULL, '+
          ' AST_NUMERO_SERIE VARCHAR(100) NULL, '+
          ' AST_ESTADO_PRODUTO VARCHAR(255) NULL, '+
          ' AST_DEFEITO VARCHAR(255) NULL, '+
          ' AST_SITUACAO INTEGER DEFAULT 0 NULL, '+
          ' AST_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE ASSISTENCIA_TECNICA_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' AST_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO ASSISTENCIA_TECNICA_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ASSISTENCIA_TECNICA ADD CNC_CLIENTE INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ASSISTENCIA_TECNICA ADD CLI_CODIGO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ASSISTENCIA_TECNICA ADD AUT_CODIGO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE ASSISTENCIA_TECNICA_DEPOSITO ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' ASD_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' CNC_ASSISTENCIA INTEGER DEFAULT 0 NULL, '+
          ' AST_CODIGO INTEGER DEFAULT 0 NULL, '+
          ' ASD_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' ASD_DT_ALTERADO DATETIME NULL, '+
          ' ASD_DT_DEPOSITO_RECEBIDO DATETIME NULL, '+
          ' ASD_DT_ASSISTENCIA_ENVIADO DATETIME NULL, '+
          ' ASD_DT_ASSISTENCIA_RETORNADO DATETIME NULL, '+
          ' ASD_DT_DEPOSITO_DEVOLVIDO DATETIME NULL, '+
          ' ASD_SITUACAO INTEGER DEFAULT 0 NULL, '+
          ' ASD_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE ASSISTENCIA_TECNICA_DEPOSITO_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' ASD_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO ASSISTENCIA_TECNICA_DEPOSITO_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRCTEMP ADD CNC_FATURAMENTO_PENDENTE INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TRCTEMP SET CNC_FATURAMENTO_PENDENTE=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRCTEMP ADD FPE_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TRCTEMP SET FPE_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRCTEMP ADD TRC_DESCONTO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TRCTEMP SET TRF_DESCONTO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRCTEMP ADD TRC_JUROS FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TRCTEMP SET TRF_JUROS=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE VEICULO ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' VEI_CODIGO INTEGER NOT NULL, '+
          ' VEI_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' VEI_DT_ALTERADO DATETIME NULL, '+
          ' VEI_PLACA VARCHAR(100) NULL, '+
          ' VEI_MARCA VARCHAR(255) NULL, '+
          ' VEI_MODELO VARCHAR(255) NULL, '+
          ' VEI_DESCRICAO VARCHAR(100) NULL, '+
          ' VEI_NUMERO_CHASSIS VARCHAR(100) NULL, '+
          ' VEI_NUMERO_RENAVAN VARCHAR(100) NULL, '+
          ' VEI_SITUACAO INTEGER DEFAULT 0 NULL, '+
          ' VEI_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE VEICULO_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' VEI_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO VEICULO_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE VEICULO ADD VEI_CONSUMO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE VEICULO SET VEI_CONSUMO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE VEICULO ADD VEI_COMBUSTIVEL INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE VEICULO SET VEI_COMBUSTIVEL=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_VEICULO ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' MTV_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' VEI_CODIGO INTEGER DEFAULT 0 NULL, '+
          ' MTV_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' MTV_DT_ALTERADO DATETIME NULL, '+
          ' MTV_PLACA VARCHAR(100) NULL, '+
          ' MTV_KILOMETRAGEM_INI INTEGER DEFAULT 0 NULL, '+
          ' MTV_KILOMETRAGEM_FIM INTEGER DEFAULT 0 NULL, '+
          ' MTV_TIPO INTEGER DEFAULT 0 NULL, '+ //0-ControleDiário;1-Outros;2-Gasolina;3-Alcool;4-Disel;5-Óleo Motor;6-Serviços
          ' MTV_DETALHE VARCHAR(100) NULL, '+
          ' MTV_QUANTIDADE FLOAT DEFAULT 0 NULL, '+
          ' MTV_VALOR_TOTAL FLOAT DEFAULT 0 NULL, '+
          ' MTV_SITUACAO INTEGER DEFAULT 0 NULL, '+
          ' MTV_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_VEICULO_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' MTV_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO CONTROLE_VEICULO_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_VEICULO_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' MTV_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO CONTROLE_VEICULO_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_LIM_DESC_JR_SIMPLES FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_LIM_DESC_JR_SIMPLES=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_LIM_DESC_JR_ESPECIAL FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_LIM_DESC_JR_ESPECIAL=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CENTRO_DE_CUSTO ADD CNC_META_QUINZENA_1 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CENTRO_DE_CUSTO SET CNC_META_QUINZENA_1=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CENTRO_DE_CUSTO ADD CNC_META_QUINZENA_2 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CENTRO_DE_CUSTO SET CNC_META_QUINZENA_2=0 ');
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE FUNCIONARIO ADD FUN_APARECE_SERVICOS INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE FUNCIONARIO SET FUN_APARECE_SERVICOS=0');
        ExecutaSQL(Query1,'UPDATE FUNCIONARIO SET FUN_APARECE_SERVICOS=1 '+
          ' WHERE FUN_FUNCAO IN (45, 56, 58) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE FUNCIONARIO ADD FUN_APARECE_VENDAS INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE FUNCIONARIO SET FUN_APARECE_VENDAS=0');
        ExecutaSQL(Query1,'UPDATE FUNCIONARIO SET FUN_APARECE_VENDAS=1 '+
          ' WHERE FUN_FUNCAO IN (45, 58, 56) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE SUBGRUPO ADD SGP_SERVICO_OBRIGATORIO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE SUBGRUPO SET SGP_SERVICO_OBRIGATORIO=0 ');
      except
      end;

      try
        ExecutaSQL(Query1,'CREATE TABLE LIMITE_GASTO ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' LMG_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' CCX_CODIGO INTEGER NOT NULL, '+
          ' LMG_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' LMG_DT_ALTERADO DATETIME NULL, '+
          ' LMG_LIMITE_MENSAL FLOAT DEFAULT 0, '+
          ' LMG_SITUACAO INTEGER DEFAULT 0 NULL, '+
          ' LMG_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE LIMITE_GASTO_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' LMG_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO LIMITE_GASTO_CONF VALUES (0,0)');
        ExecutaSQL(Query1,'ALTER TABLE LIMITE_GASTO ADD PRIMARY KEY (CNC_ORIGEM,CNC_CODIGO,CCX_CODIGO)');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 82) then
    Begin
      try
        ExecutaSQL(Query1,'CREATE TABLE PROFISSAO ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' PRF_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' PRF_DESCRICAO VARCHAR(50) NOT NULL UNIQUE, '+
          ' PRF_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' PRF_DT_ALTERADO DATETIME NULL, '+
          ' PRF_SALARIO_INI FLOAT DEFAULT 0 NULL, '+
          ' PRF_SALARIO_FIM FLOAT DEFAULT 0 NULL, '+
          ' PRF_SITUACAO INTEGER DEFAULT 0 NULL, '+
          ' PRF_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE PROFISSAO_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' PRF_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO PROFISSAO_CONF VALUES (0,0)');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 87) then
    Begin
      try
        ExecutaSQL(Query1,'CREATE TABLE LOTE ( '+
          ' LOT_CODIGO INTEGER NOT NULL '+
          ',PRD_CODIGO INTEGER NOT NULL '+
          ',USU_CODIGO INTEGER NOT NULL '+
          ',LOT_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL '+
          ',LOT_DT_ALTERADO DATETIME NULL '+
          ',LOT_DT_VALIDADE DATETIME NULL '+
          ',LOT_DESCRICAO VARCHAR(50) NOT NULL '+
          ',LOT_REFERENCIA VARCHAR(100) NULL '+ //CÓDIGO DO LOTE DO FORNECEDOR
          ',LOT_PRECO_COMPRA FLOAT DEFAULT 0 NULL '+
          ',LOT_PRECO_CUSTO FLOAT DEFAULT 0 NULL '+
          ',LOT_PRECO_VENDA FLOAT DEFAULT 0 NULL '+
          ',LOT_SITUACAO INTEGER DEFAULT 0 NOT NULL '+
          ',LOT_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE LOTE_CONF ( '+
          ' LOT_CODIGO INTEGER NOT NULL '+
          ',CNC_CODIGO INTEGER NOT NULL)');
        ExecutaSQL(Query1,'INSERT INTO LOTE_CONF VALUES (0,0) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_PEDIDO_DE_COMPRA ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_PEDIDO_DE_VENDA ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_PRE_RECEBIMENTO ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_RECEBIMENTO ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TRANSFERENCIA ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_INVENTARIO ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_NOTA_FISCAL ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TROCA ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISICO ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISICO ADD MEF_QTD_ANT_LOTE FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD MEC_QTD_ANT_LOTE FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISCAL ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISCAL ADD MES_QTD_ANT_LOTE FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_SN ADD MSN_QTD_ANT_LOTE FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_LJ4 ADD ML4_QTD_ANT_LOTE FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE EMPRESTIMO ADD LOT_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE EMPRESTIMO SET LOT_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE FORMA_DE_PAGAMENTO ADD TBP_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE FORMA_DE_PAGAMENTO SET TBP_CODIGO=0 ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 83) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE FORMA_DE_PAGAMENTO ADD FPG_CENTAVOS_ENTRADA INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE FORMA_DE_PAGAMENTO SET FPG_CENTAVOS_ENTRADA=1 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_CENTAVOS_ENTRADA INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE AGENTE_FINANCEIRO SET AGF_CENTAVOS_ENTRADA=1 ');
      except
      end;

      try
        ExecutaSQL(Query1,'DROP TABLE ITEM_DE_ESTOQUE_DETALHE');
        ExecutaSQL(Query1,'CREATE TABLE ITEM_DE_ESTOQUE_DETALHE ( '+
          ' CNC_CODIGO int NOT NULL '+
          ',IED_CODIGO int NOT NULL '+
          ',CNC_ORIGEM int NOT NULL '+
          ',LOT_CODIGO INTEGER NOT NULL '+
          ',IED_MAQUINA int NOT NULL '+
          ',USU_CODIGO int NOT NULL '+
          ',PRD_CODIGO int NOT NULL '+
          ',IED_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL '+
          ',IED_DT_ALTERADO DATETIME NULL '+
          ',IED_QTD_FISICO float DEFAULT 0 NOT NULL'+
          ',IED_QTD_FISCAL float DEFAULT 0 NOT NULL'+
          ',IED_OBSERVACAO VARCHAR(100) NULL) ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 84) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE TABELA_DE_PRECO_SUBGRUPO ADD TPS_DESCONTO_ESPECIAL_PRAZO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TABELA_DE_PRECO_SUBGRUPO SET TPS_DESCONTO_ESPECIAL_PRAZO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TABELA_DE_PRECO_SUBGRUPO ADD TPS_DESCONTO_SIMPLES_PRAZO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TABELA_DE_PRECO_SUBGRUPO SET TPS_DESCONTO_SIMPLES_PRAZO=0 ');
      except
      end;

    end;

    if (DM.Configuracao1.VersaoBase <= 79) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_CCX_VERIFICA_CAIXA INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_CCX_VERIFICA_CAIXA=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_DT_ALTERADO DATETIME NULL ');
      except
      end;

      try
        if (DM.Configuracao1.Empresa = empEletro) and
           (DM.Configuracao1.CodigoCNC > 0) then
        Begin
          ExecutaSQL(Query1,'CREATE TABLE TABELA_DE_PRECO ( '+
            ' TBP_CODIGO int, '+
            ' CNC_CODIGO int, '+
            ' TBP_DESCRICAO char(50) NULL, '+
            ' TBP_INDICE float NULL, '+
            ' TBP_PRAZO_MEDIO int NULL, '+
            ' TBP_VALIDADE datetime NULL, '+
            ' TBP_DESCONTO_ESPECIAL float NULL, '+
            ' TBP_DESCONTO_SIMPLES float NULL, '+
            ' USU_CODIGO int NULL, '+
            ' TBP_DT_ALTERADO datetime NULL, '+
            ' TBP_DESCONTO_SIMPLES_PRAZO float NULL, '+
            ' TBP_DESCONTO_ESPECIAL_PRAZO float NULL) ');
        end;
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRANSFERENCIA ADD PCP_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TRANSFERENCIA SET PCP_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE ADD FUN_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_ESTOQUE SET FUN_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE_DEPOSITO ADD FUN_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_ESTOQUE_DEPOSITO SET FUN_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD FUN_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET FUN_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISICO ADD FUN_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET FUN_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISCAL ADD FUN_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET FUN_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_SN ADD FUN_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET FUN_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_LJ4 ADD FUN_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_LJ4 SET FUN_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRANSFERENCIA ADD FUN_ORIGEM INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TRANSFERENCIA SET FUN_ORIGEM=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRANSFERENCIA ADD FUN_DESTINO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TRANSFERENCIA SET FUN_DESTINO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_ENTREGA_DEPOSITO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET PDV_ENTREGA_DEPOSITO=0 ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 78) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_COMPRA ADD PCP_PERCENTUAL_CUSTO FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_COMPRA SET PCP_PERCENTUAL_CUSTO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_COMPRA ADD PCP_PERCENTUAL_VENDA FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_COMPRA SET PCP_PERCENTUAL_VENDA=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD USU_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE INFORMACOES_DE_CREDITO SET USU_CODIGO=0 ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 78) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_PEDIDO_DE_COMPRA ADD IPC_AMOSTRA FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_PEDIDO_DE_COMPRA SET IPC_AMOSTRA=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_PEDIDO_DE_COMPRA ADD IPC_PRECO_FINAL FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_PEDIDO_DE_COMPRA SET IPC_PRECO_FINAL=IPC_PRECO');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_COMPRA ADD PCP_PRECO_FINAL_DEFINIDO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_COMPRA SET PCP_PRECO_FINAL_DEFINIDO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_NOTA_FISCAL ADD INF_AMOSTRA FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_NOTA_FISCAL SET INF_AMOSTRA=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CUSTO ADD CUS_PRECO_FINAL FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE CUSTO SET CUS_PRECO_FINAL=CUS_VALOR_COMPRA ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_COMPRA ADD PCP_TOTAL_FINAL FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_COMPRA SET PCP_TOTAL_FINAL=PCP_TOTAL_NOTA ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE COMUNICACAO ( '+
          ' CNC_ORIGEM INTEGER NOT NULL '+
          ',CNC_CODIGO INTEGER NOT NULL '+
          ',COM_CODIGO INTEGER NOT NULL '+
          ',COM_MAQUINA INTEGER NOT NULL '+
          ',USU_CODIGO INTEGER NOT NULL '+
          //Funcionário que manteve o contato
          ',FUN_CODIGO INTEGER NOT NULL '+
          //CNC do Cliente ou Fornecedor ou Transportadora
          ',COM_CNC_ENTRADA INTEGER NOT NULL '+
          //Código do Cliente ou Fornecedor ou Transportadora
          ',COM_COD_ENTRADA INTEGER NOT NULL '+
          //CNC do Contato
          ',COM_CNC_CONTATO INTEGER DEFAULT 0 NOT NULL '+
          //Código do Contato
          ',CNT_CODIGO INTEGER DEFAULT 0 NOT NULL '+
          //CNC do Pedido (Compra,Venda) ou Pacote
          ',COM_CNC_PEDIDO INTEGER DEFAULT 0 NOT NULL '+
          //Código do Pedido (Compra, Venda) ou Pacote
          ',COM_COD_PEDIDO INTEGER DEFAULT 0 NOT NULL '+
          //CNC do Título (Receber, Pagar-se for Forn. ou Transp.)
          ',COM_CNC_TITULO INTEGER DEFAULT 0 NOT NULL '+
          //Código do Título (Receber, Pagar-se for Forn. ou Transp.)
          ',COM_COD_TITULO INTEGER DEFAULT 0 NOT NULL '+
          //Código do Produto
          ',PRD_CODIGO INTEGER DEFAULT 0 NOT NULL '+
          //CNC da Comunicação que deu origem a essa
          ',COM_CNC_ORIGEM INTEGER DEFAULT 0 NOT NULL '+
          //Código da Comunicação que deu origem a essa
          ',COM_COD_ORIGEM INTEGER DEFAULT 0 NOT NULL '+
          ',COM_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL '+
          ',COM_DT_ALTERADO DATETIME NULL '+
          ',COM_DT_COMUNICACAO DATETIME DEFAULT GETDATE() NOT NULL '+
          //0-Cliente; 1-Fornecedor; 3-Transportadora
          ',COM_TIPO INTEGER DEFAULT 0 NOT NULL '+
          //Tab.Parâmetro (Comunicacao Meio): Pessoalmente; Telefone; EMail; Carta; Cobrador
          ',COM_MEIO_DE_CONTATO INTEGER DEFAULT 0 NOT NULL '+
          //Bina do Telefone ou EMail ou Local da Conversa
          ',COM_MEIO_DETALHE VARCHAR(255) NULL '+
          //Tab.Parâmetro (Comunicaçao Motivo): Reclamação Cliente; Cobrança; Telemarketing;
          ',COM_MOTIVO INTEGER DEFAULT 0 NOT NULL '+
          //Tab.Parâmetro (Comunicação Perguntas)
          //Utilizar o Campo Informação (PARAMETRO) para definir o código do Motivo
          //em que a pergunta deva aparecer - Se for 0 (zero) pararecer sempre
          ',COM_PERGUNTA_1 INTEGER DEFAULT 0 NOT NULL '+
          ',COM_RESPOSTA_1 VARCHAR(255) NULL '+
          ',COM_PERGUNTA_2 INTEGER DEFAULT 0 NOT NULL '+
          ',COM_RESPOSTA_2 VARCHAR(255) NULL '+
          ',COM_PERGUNTA_3 INTEGER DEFAULT 0 NOT NULL '+
          ',COM_RESPOSTA_3 VARCHAR(255) NULL '+
          //Se gerar tarefa registrar o código
          ',COM_CNC_TAREFA INTEGER DEFAULT 0 NOT NULL '+
          //Se gerar tarefa registrar o código
          ',TAR_CODIGO INTEGER DEFAULT 0 NOT NULL '+
          //Campo livre para registrar a conversa
          ',COM_DETALHE VARCHAR(255) NULL '+
          //0-Solucionado; 1-Solução da Comunicação Anterior; 2-Necessita Nova Comunicação Origem Cliente; 3-Necessita nova comunicação Origem Empresa
          ',COM_NIVEL_ACERTO INTEGER DEFAULT 0 NULL '+
          ',COM_SITUACAO INTEGER DEFAULT 0 NULL '+
          ',COM_OBSERVACAO VARCHAR(255) NULL) ');
      except
      end;

      try
        ExecutaSQL(Query1,'CREATE TABLE ENVIA_FORNECEDOR ( '+
          ' CNC_ORIGEM int NOT NULL '+
          ',CNC_CODIGO int NOT NULL '+
          ',ENF_CODIGO int NOT NULL '+
          ',USU_CODIGO int NOT NULL '+
          ',ENF_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL '+
          ',ENF_DT_ALTERADO DATETIME NULL '+
          ',ENF_DT_ENVIADO DATETIME NULL '+
          ',ENF_DT_RECEBIDO DATETIME NULL '+
          ',FOR_CODIGO int NOT NULL '+
          ',ENF_CNC_PEDIDO int DEFAULT 0 NOT NULL '+
          ',PDV_CODIGO int DEFAULT 0 NOT NULL '+
          ',PRD_CODIGO int NOT NULL '+
          ',ENF_QUANTIDADE FLOAT DEFAULT 0 NOT NULL '+
          ',ENF_SITUACAO int DEFAULT 0 NOT NULL '+
          ',ENF_OBSERVACAO VARCHAR(255) NULL) ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE ENVIA_FORNECEDOR_CONF ( '+
          ' CNC_CODIGO int '+
          ',ENF_CODIGO int) ');
        ExecutaSQL(Query1,'INSERT INTO ENVIA_FORNECEDOR_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE REGISTRO_BOLETO ADD RBO_DADOS_TITULO VARCHAR(255) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_NUMERO_BANCO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_ID_CSP VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FORMA_CAD_TIT_BANCO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_ID_EMISSAO_BLOQUETO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_ID_DISTRIBUICAO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_DIAS_MULTA INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_INSTRUCAO1 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_INSTRUCAO1 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_INSTRUCAO2 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_INSTRUCAO2 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_INSTRUCAO3 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_INSTRUCAO3 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_INSTRUCAO4 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_INSTRUCAO4 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_INSTRUCAO5 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_INSTRUCAO5 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_INSTRUCAO6 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_INSTRUCAO6 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_INSTRUCAO7 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_INSTRUCAO7 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_INSTRUCAO8 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_INSTRUCAO8 INTEGER DEFAULT 0 NULL ');
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM5 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM6 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM7 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM8 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM9 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM10 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM11 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM12 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM13 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM14 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM15 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM16 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM17 VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_MENSAGEM18 VARCHAR(100) NULL ');
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM2 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM3 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM4 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM5 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM6 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM7 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM8 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM9 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM10 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM11 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM12 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM13 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM14 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM15 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM16 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM17 INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE BANCO_BOLETO ADD BNB_FONTE_MENSAGEM18 INTEGER DEFAULT 0 NULL ');
      except
      end;

      try
        if DM.Configuracao1.Empresa = empHOPE then
          ExecutaSQL(Query1,'UPDATE NOTA_FISCAL SET NTF_SERIE="D" '+
            ' WHERE (NTF_SERIE="" OR NTF_SERIE IS NULL) '+
            ' AND NTF_NOTA_CUPOM=1 '+ //Nota
            ' AND NTF_AIDF=0 '); //Não é avulso
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COBRANCA_COBRADOR ADD CNC_TITULO INTEGER DEFAULT 0 NULL ');
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE USUARIO ADD USU_TODOS_CENTROS INTEGER DEFAULT 1 NULL ');
        if DM.Configuracao1.Empresa = empEletro then
          ExecutaSQL(Query1,'UPDATE USUARIO SET USU_TODOS_CENTROS=0')
        else
          ExecutaSQL(Query1,'UPDATE USUARIO SET USU_TODOS_CENTROS=1');        
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE FUNCIONARIO ADD FUN_TODOS_CENTROS INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNC_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNC_CODIGO=CNF_CODIGO');
      except
      end;
      try
        ExecutaSQL(Query1,'SELECT * INTO MENSAGEM_CPD FROM MENSAGEM ');
        ExecutaSQL(Query1,'DELETE FROM MENSAGEM');
        ExecutaSQL(Query1,'DELETE FROM MENSAGEM_CPD');
      except
      end;
      try
        ExecutaSQL(Query1,'SELECT * INTO MENSAGEM_CPD FROM MENSAGEM');
        ExecutaSQL(Query1,'DELETE FROM MENSAGEM');
        ExecutaSQL(Query1,'DELETE FROM MENSAGEM_CPD');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PERMISSAO ADD PRM_PERFIL INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PERMISSAO SET PRM_PERFIL=0 ');
        ExecutaSQL(Query1,'UPDATE PERMISSAO SET PRM_DT_CADASTRO="01/01/2003" '+
          ' WHERE PRM_DT_CADASTRO IS NULL ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 78) then
    Begin
      try
        ExecutaSQL(Query1,'CREATE TABLE ITEM_DE_COBRANCA_COBRADOR ( '+
          ' CNC_CODIGO int NOT NULL '+
          ',ICC_CODIGO int NOT NULL '+
          ',CPC_CODIGO int NOT NULL '+
          ',CNC_TITULO int NOT NULL '+
          ',TRC_CODIGO int NOT NULL '+
          ',ICC_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL '+
          ',USU_CODIGO int NOT NULL) ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE ITEM_DE_COBRANCA_COBRADOR_CONF ( '+
          ' CNC_CODIGO int '+
          ',ICC_CODIGO int) ');
        ExecutaSQL(Query1,'INSERT INTO ITEM_DE_COBRANCA_COBRADOR_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE ITEM_DE_ESTOQUE_DETALHE_CONF ( '+
          ' CNC_CODIGO int '+
          ',IED_CODIGO int) ');
        ExecutaSQL(Query1,'INSERT INTO ITEM_DE_ESTOQUE_DETALHE_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_ESTOQUE_DETALHADO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_ESTOQUE_DETALHADO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PRODUTO ADD PRD_ESTOQUE_DETALHADO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_ESTOQUE_DETALHADO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET PDV_DT_ENTREGA=PDV_DATA_HORA '+
          ' WHERE (PDV_DT_ENTREGA IS NULL OR PDV_DT_ENTREGA=0) '+
          ' AND PDV_SITUACAO>3 ');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET PDV_DT_ALTERADO=PDV_DATA_HORA '+
          ' WHERE (PDV_DT_ALTERADO IS NULL OR PDV_DT_ALTERADO=0) ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE ITEM_DE_MAPA_DE_COTACAO ( '+
          ' CNC_CODIGO int, '+
          ' ICT_CODIGO int, '+
          ' CNC_ORIGEM int NULL, '+
          ' MCT_CODIGO int NULL, '+
          ' USU_CODIGO int NULL, '+
          ' ICT_DT_CADASTRO datetime NULL, '+
          ' ICT_DT_ALTERADO datetime NULL, '+
          ' PRD_CODIGO int NULL, '+
          ' ICT_PRODUTO varchar(255) NULL, '+
          ' ICT_DESCONTO varchar(40) NULL, '+
          ' ICT_QUANTIDADE int NULL, '+
          ' ICT_IPI float NULL, '+
          ' ICT_PRECO float NULL) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD MEC_RESERVADO FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET MEC_RESERVADO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD MEC_INDISPONIVEL FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET MEC_INDISPONIVEL=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE FUNCIONARIO ADD FUN_SUPERIOR INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE FUNCIONARIO SET FUN_SUPERIOR=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE FUNCIONARIO ADD FUN_PARCEIRO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE FUNCIONARIO SET FUN_PARCEIRO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_CPMF FLOAT DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_CPMF=0.38');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_COBRANCA INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_COBRANCA=0');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_CAIXA SET MVC_PT="D" '+
          ' WHERE MVC_DESCRICAO LIKE "Tro-Ext.Dev.Par.: %" ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE ADD IES_SAMOSTRA FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_ESTOQUE SET IES_SAMOSTRA=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE ADD IES_SBONIFICACAO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_ESTOQUE SET IES_SBONIFICACAO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE ADD IES_SAMOSTRA_FISCAL FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_ESTOQUE SET IES_SAMOSTRA_FISCAL=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE ADD IES_SBONIFICACAO_FISCAL FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_ESTOQUE SET IES_SBONIFICACAO_FISCAL=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD MEC_AMOSTRA_ANTERIOR FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET MEC_AMOSTRA_ANTERIOR=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD MEC_AMOSTRA FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET MEC_AMOSTRA=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD MEC_BONIFICACAO_ANTERIOR FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET MEC_BONIFICACAO_ANTERIOR=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD MEC_BONIFICACAO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET MEC_BONIFICACAO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISCAL ADD MES_AMOSTRA_ANTERIOR FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET MES_AMOSTRA_ANTERIOR=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISCAL ADD MES_AMOSTRA FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET MES_AMOSTRA=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISCAL ADD MES_BONIFICACAO_ANTERIOR FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET MES_BONIFICACAO_ANTERIOR=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISCAL ADD MES_BONIFICACAO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET MES_BONIFICACAO=0');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 74) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE COBRANCA_POR_COBRADOR ADD CNC_ORIGEM INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_QNT_DIAS_SEM_COBRA INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_QNT_DIAS_SEM_COBRA = CNF_QNT_DIAS_SEM_JUROS');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_COMERCIAL ADD PRIMARY KEY (CNC_CODIGO,MEC_CODIGO)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISICO ADD PRIMARY KEY (CNC_CODIGO,MEF_CODIGO)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_FISCAL ADD PRIMARY KEY (CNC_CODIGO,MES_CODIGO)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MOVIMENTO_DE_ESTOQUE_SN ADD PRIMARY KEY (CNC_CODIGO,MSN_CODIGO)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE ADD PRIMARY KEY (CNC_CODIGO,PRD_CODIGO)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CHEQUE ADD CHQ_CPF_CNPJ VARCHAR(20) NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE TABELA_DE_PRECO_CLIENTE ( '+
          ' CNC_CODIGO int '+
          ',TBC_CODIGO int '+
          ',USU_CODIGO int '+
          ',TBC_DT_CADASTRO DATETIME '+
          ',CNC_TABELA int '+
          ',TBP_CODIGO int '+
          ',CNC_CLIENTE int '+
          ',CLI_CODIGO int) ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE TABELA_DE_PRECO_CLIENTE_CONF ( '+
          ' CNC_CODIGO int '+
          ',TBC_CODIGO int) ');
        ExecutaSQL(Query1,'INSERT INTO TABELA_DE_PRECO_CLIENTE_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_COMPRA ADD TPG_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_COMPRA ADD PCP_LJ4 INTEGER DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_AUXILIAR ADD PDV_PASCIENTE VARCHAR(60) NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE DETALHE_DE_PEDIDO_DE_VENDA ADD DPV_PASCIENTE VARCHAR(60) NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TAREFA ADD TAR_RESPONSAVEL INTEGER NULL ');
        ExecutaSQL(Query1,'UPDATE TAREFA SET TAR_RESPONSAVEL=USU_CODIGIO ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TAREFA ADD TAR_DT_FINAL DATETIME NULL ');
        ExecutaSQL(Query1,'UPDATE TAREFA SET TAR_DT_FINAL=TAR_DT_AGENDADO ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TAREFA ADD TAR_ORIGEM INTEGER NULL ');
        ExecutaSQL(Query1,'UPDATE TAREFA SET TAR_ORIGEM=TAR_CODIGO ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TAREFA ADD CNC_ORIGEM INTEGER NULL ');
        ExecutaSQL(Query1,'UPDATE TAREFA SET CNC_ORIGEM=CNC_CODIGO ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TAREFA ADD TAR_OBSERVACAO VARCHAR(255) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE TIPO_DE_PARAMETRO SET TPR_DESCRICAO=UPPER(TPR_DESCRICAO) ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE PARAMETRO SET PAR_DESCRICAO=UPPER(PAR_DESCRICAO) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE OPERACAO_FISCAL ADD OPF_SITUACAO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE OPERACAO_FISCAL SET OPF_SITUACAO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE COMUNICACAO ( '+
          ' CNC_ORIGEM INTEGER NOT NULL '+
          ',CNC_CODIGO INTEGER NOT NULL '+
          ',COM_CODIGO INTEGER NOT NULL '+
          ',COM_MAQUINA INTEGER NOT NULL '+
          ',USU_CODIGO INTEGER NOT NULL '+
          //Funcionário que manteve o contato
          ',FUN_CODIGO INTEGER NOT NULL '+
          //CNC do Cliente ou Fornecedor ou Transportadora
          ',COM_CNC_ENTRADA INTEGER NOT NULL '+
          //Código do Cliente ou Fornecedor ou Transportadora
          ',COM_COD_ENTRADA INTEGER NOT NULL '+
          //CNC do Contato
          ',COM_CNC_CONTATO INTEGER DEFAULT 0 NOT NULL '+
          //Código do Contato
          ',CNT_CODIGO INTEGER DEFAULT 0 NOT NULL '+
          //CNC do Pedido (Compra,Venda) ou Pacote
          ',COM_CNC_PEDIDO INTEGER DEFAULT 0 NOT NULL '+
          //Código do Pedido (Compra, Venda) ou Pacote
          ',COM_COD_PEDIDO INTEGER DEFAULT 0 NOT NULL '+
          //CNC do Título (Receber, Pagar-se for Forn. ou Transp.)
          ',COM_CNC_TITULO INTEGER DEFAULT 0 NOT NULL '+
          //Código do Título (Receber, Pagar-se for Forn. ou Transp.)
          ',COM_COD_TITULO INTEGER DEFAULT 0 NOT NULL '+
          //Código do Produto
          ',PRD_CODIGO INTEGER DEFAULT 0 NOT NULL '+
          //CNC da Comunicação que deu origem a essa
          ',COM_CNC_ORIGEM INTEGER DEFAULT 0 NOT NULL '+
          //Código da Comunicação que deu origem a essa
          ',COM_COD_ORIGEM INTEGER DEFAULT 0 NOT NULL '+
          ',COM_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL '+
          ',COM_DT_ALTERADO DATETIME NULL '+
          ',COM_DT_COMUNICACAO DATETIME DEFAULT GETDATE() NOT NULL '+
          //0-Cliente; 1-Fornecedor; 3-Transportadora
          ',COM_TIPO INTEGER DEFAULT 0 NOT NULL '+
          //Tab.Parâmetro (Comunicacao Meio): Pessoalmente; Telefone; EMail; Carta; Cobrador
          ',COM_MEIO_DE_CONTATO INTEGER DEFAULT 0 NOT NULL '+
          //Bina do Telefone ou EMail ou Local da Conversa
          ',COM_MEIO_DETALHE VARCHAR(255) NULL '+
          //Tab.Parâmetro (Comunicaçao Motivo): Reclamação Cliente; Cobrança; Telemarketing;
          ',COM_MOTIVO INTEGER DEFAULT 0 NOT NULL '+
          //Tab.Parâmetro (Comunicação Perguntas)
          //Utilizar o Campo Informação (PARAMETRO) para definir o código do Motivo
          //em que a pergunta deva aparecer - Se for 0 (zero) pararecer sempre
          ',COM_PERGUNTA_1 INTEGER DEFAULT 0 NOT NULL '+
          ',COM_RESPOSTA_1 VARCHAR(255) NULL '+
          ',COM_PERGUNTA_2 INTEGER DEFAULT 0 NOT NULL '+
          ',COM_RESPOSTA_2 VARCHAR(255) NULL '+
          ',COM_PERGUNTA_3 INTEGER DEFAULT 0 NOT NULL '+
          ',COM_RESPOSTA_3 VARCHAR(255) NULL '+
          //Se gerar tarefa registrar o código
          ',COM_CNC_TAREFA INTEGER DEFAULT 0 NOT NULL '+
          //Se gerar tarefa registrar o código
          ',TAR_CODIGO INTEGER DEFAULT 0 NOT NULL '+
          //Campo livre para registrar a conversa
          ',COM_DETALHE VARCHAR(255) NULL '+
          //0-Solucionado; 1-Solução da Comunicação Anterior; 2-Necessita Nova Comunicação Origem Cliente; 3-Necessita nova comunicação Origem Empresa
          ',COM_NIVEL_ACERTO INTEGER DEFAULT 0 NULL '+
          ',COM_SITUACAO DEFAULT 0 NULL '+
          ',COM_OBSERVACAO VARCHAR(255) NULL) ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE COMUNICACAO_CONF ( '+
          ' CNC_CODIGO INTEGER '+
          ',COM_CODIGO INTEGER) ');
        ExecutaSQL(Query1,'INSERT INTO COMUNICACAO_CONF VALUES (1,1) ');
      except
      end;

      try
        ExecutaSQL(Query1,'CREATE TABLE MOVIMENTO_DE_ESTOQUE_LJ4 ( '+
          'ML4_CODIGO int,'+
          'CNC_CODIGO int,'+
          'PRD_CODIGO int,'+
          'USU_CODIGO int NULL,'+
          'ML4_MAQUINA INTEGER DEFAULT 0 NULL,'+
          'ML4_DATA_HORA datetime NULL,'+
          'ML4_ES varchar(20) NULL,'+
          'ML4_TIPO_MOV int NULL,'+
          'ML4_QUANTIDADE float DEFAULT 0 NULL,'+
          'ML4_SALDO_ANT float DEFAULT 0 NULL,'+
          'ML4_TIPO_ENT int NULL,'+
          'ML4_CNC_CODIGO_ENT int NULL,'+
          'ML4_ENT_CODIGO int NULL, '+
          'ML4_OBSERVACAO varchar(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE MOVIMENTO_DE_ESTOQUE_LJ4_CONF ( '+
          'ML4_CODIGO int,'+
          'CNC_CODIGO int)');
        ExecutaSQL(Query1,'INSERT INTO MOVIMENTO_DE_ESTOQUE_LJ4_CONF '+
          ' VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE ADD IES_SLJ4 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_ESTOQUE SET IES_SLJ4=0 ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 73) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE BOLETIM_DIARIO ADD BLD_TIPO VARCHAR(1) NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PRODUTO ADD PRD_CLASSIFICACAO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_CLASSIFICACAO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_GRUPO_REPASSE integer DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_GRUPO_REPASSE=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_PRD_REF_UNICA integer DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_PRD_REF_UNICA=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE ADD USU_CODIGO integer NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_ESTOQUE ADD IES_MAQUINA integer DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_ESTOQUE SET IES_MAQUINA=0 ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 72) then
    Begin
       //Alterar as notas de Compra para transferência
      if DM.Configuracao1.Empresa = empHOPE then
      Begin
        try
          ExecutaSQL(Query1,'UPDATE NOTA_FISCAL SET '+
            ' NTF_TIPO_NOTA=365 '+
            ',NTF_CFOP=1152 '+
            ' WHERE NTF_TIPO_NOTA=360 '+
            ' AND NTF_CFOP=1102 ');
        except
        end;
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 71) then
    Begin
      try
        ExecutaSQL(Query1,'UPDATE CLIENTE SET CNC_ORIGEM=CNC_CODIGO '+
          ' WHERE CNC_ORIGEM IS NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE NOTA_FISCAL SET CNC_ORIGEM=CNC_CODIGO '+
          ' WHERE CNC_ORIGEM IS NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE ITEM_DE_NOTA_FISCAL SET CNC_ORIGEM=CNC_CODIGO '+
          ' WHERE CNC_ORIGEM IS NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET CNC_ORIGEM=CNC_CODIGO '+
          ' WHERE CNC_ORIGEM IS NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE TITULO_A_PAGAR SET CNC_ORIGEM=CNC_CODIGO '+
          ' WHERE CNC_ORIGEM IS NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE USUARIO_SENHA SET CNC_ORIGEM=CNC_CODIGO '+
          ' WHERE CNC_ORIGEM IS NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE REGISTRO_DELETADO SET CNC_ORIGEM=CNC_CODIGO '+
          ' WHERE CNC_ORIGEM IS NULL');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 70) then
    Begin
      try
        ExecutaSQL(Query1,'DROP TABLE CONTROLE_ENVIO_FILIAL ');
        ExecutaSQL(Query1,'DROP TABLE CONTROLE_ENVIO_CPD ');
        ExecutaSQL(Query1,'DROP TABLE CONTROLE_RECEBIMENTO_FILIAL ');
        ExecutaSQL(Query1,'DROP TABLE CONTROLE_RECEBIMENTO_CPD ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_RECEBIMENTO ADD USU_CODIGO INTEGER NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_RECEBIMENTO SET USU_CODIGO=1');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE ITEM_DE_NOTA_FISCAL SET INF_DT_CADASTRO="01/01/2000" '+
          ' WHERE INF_DT_CADASTRO IS NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET TRC_DT_CADASTRO="01/01/2000" '+
          ' WHERE TRC_DT_CADASTRO IS NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE ITEM_DE_RECEBIMENTO SET IRC_DT_CADASTRO="01/01/2000" '+
          ' WHERE IRC_DT_CADASTRO IS NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE TRANSFERENCIA SET TRF_DATA="01/01/2000" '+
          ' WHERE TRF_DATA IS NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET IPV_DT_CADASTRO="01/01/2000" '+
          ' WHERE IPV_DT_CADASTRO IS NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE ITEM_DE_INVENTARIO SET IIV_DT_CADASTRO="01/01/2000" '+
          ' WHERE IIV_DT_CADASTRO IS NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE TITULO_A_PAGAR SET TPG_DT_CADASTRO="01/01/2000" '+
          ' WHERE TPG_DT_CADASTRO IS NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TRANSFERENCIA ADD USU_CODIGO INTEGER NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_TRANSFERENCIA SET USU_CODIGO=1');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TRANSFERENCIA ADD ITR_DT_CADASTRO DATETIME NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_TRANSFERENCIA SET ITR_DT_CADASTRO="01/01/2000"');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TRANSFERENCIA ADD ITR_DT_ALTERADO DATETIME NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE FUNCIONARIO ADD FUN_DT_CADASTRO DATETIME NULL ');
        ExecutaSQL(Query1,'UPDATE FUNCIONARIO SET FUN_DT_CADASTRO="01/01/2000"');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE LOG ADD LOG_MAQUINA INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE LOG SET LOG_MAQUINA=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE LOG ADD LOG_DT_WINDOWS DATETIME NULL ');
      except
      end;
      try
        //Tabela gerada e mantida na FILIAL
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_ENVIO_FILIAL ( '+
          ' CNC_CODIGO int '+
          ',CEF_CODIGO int '+
          ',CNC_ORIGEM int '+
          ',USU_CODIGO int '+
          ',CEF_MAQUINA int DEFAULT 0 '+
          ',CEF_DT_CADASTRO datetime DEFAULT GetDate() NOT NULL '+
          ',CEF_DT_ALTERADO datetime NULL '+
          ',CEF_DT_DADOS_INICIAL datetime NULL '+ //Data inicial da consulta na exportação
          ',CEF_TABELA int DEFAULT 0 '+           //Código da Tabela
          ',CEF_SITUACAO int DEFAULT 0 '+
          ',CEF_OBSERVACAO varchar(255) NULL) ');
      except
      end;
      try
        //Tabela gerada e mantida na FILIAL
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_ENVIO_FILIAL_CONF ( '+
          ' CNC_CODIGO int '+
          ',CEF_CODIGO int) ');
        ExecutaSQL(Query1,'INSERT INTO CONTROLE_ENVIO_FILIAL_CONF VALUES (0,0) ');
      except
      end;
      try
        //Tabela gerada e mantida no CPD
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_ENVIO_CPD ( '+
          ' CNC_CODIGO int '+
          ',CEC_CODIGO int '+
          ',CNC_ORIGEM int '+
          ',USU_CODIGO int '+
          ',CEC_MAQUINA int DEFAULT 0 '+
          ',CEC_DT_CADASTRO datetime DEFAULT GetDate() NOT NULL '+
          ',CEC_DT_ALTERADO datetime NULL '+
          ',CEC_DT_DADOS_INICIAL datetime NULL '+ //Data inicial da consulta na exportação
          ',CEC_TABELA int DEFAULT 0 '+           //Código da Tabela
          ',CEC_SITUACAO int DEFAULT 0 '+
          ',CEC_OBSERVACAO varchar(255) NULL) ');
      except
      end;
      try
        //Tabela gerada e mantida no CPD
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_ENVIO_CPD_CONF ( '+
          ' CNC_CODIGO int '+
          ',CEC_CODIGO int) ');
        ExecutaSQL(Query1,'INSERT INTO CONTROLE_ENVIO_CPD_CONF VALUES (0,0) ');
      except
      end;
      try
        //Tabela gerada e mantida no CPD
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_RECEBIMENTO_FILIAL ( '+
          ' CNC_CODIGO int '+
          ',CRF_CODIGO int '+
          ',CNC_ORIGEM int '+
          ',USU_CODIGO int '+
          ',CRF_MAQUINA int DEFAULT 0 '+
          ',CRF_DT_CADASTRO datetime DEFAULT GetDate() NOT NULL '+
          ',CRF_DT_ALTERADO datetime NULL '+
          ',CNC_CONTROLE_ENVIO int NULL '+        //CNC do Registro de Envio desse recebimento, para saber quando os dados foram gerados.
          ',CEF_CODIGO int NULL '+                //Código do Registro de Envio desse recebimento, para saber quando os dados foram gerados.
          ',CRF_DT_DADOS_INICIAL datetime NULL '+ //Data inicial da consulta na exportação
          ',CRF_TABELA int DEFAULT 0 '+           //Código da Tabela
          ',CRF_SITUACAO int DEFAULT 0 '+
          ',CRF_OBSERVACAO varchar(255) NULL) ');
      except
      end;
      try
        //Tabela gerada e mantida no CPD
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_RECEBIMENTO_FILIAL_CONF ( '+
          ' CNC_CODIGO int '+
          ',CRF_CODIGO int) ');
        ExecutaSQL(Query1,'INSERT INTO CONTROLE_RECEBIMENTO_FILIAL_CONF VALUES (0,0) ');
      except
      end;
      try
        //Tabela gerada e mantida na FILIAL
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_RECEBIMENTO_CPD ( '+
          ' CNC_CODIGO int '+
          ',CRC_CODIGO int '+
          ',CNC_ORIGEM int '+
          ',USU_CODIGO int '+
          ',CRC_MAQUINA int DEFAULT 0 '+
          ',CRC_DT_CADASTRO datetime DEFAULT GetDate() NOT NULL '+
          ',CRC_DT_ALTERADO datetime NULL '+
          ',CNC_CONTROLE_ENVIO int NULL '+        //CNC do Registro de Envio desse recebimento, para saber quando os dados foram gerados.
          ',CEC_CODIGO int NULL '+                //Código do Registro de Envio desse recebimento, para saber quando os dados foram gerados.
          ',CRC_DT_DADOS_INICIAL datetime NULL '+ //Data inicial da consulta na exportação
          ',CRC_TABELA int DEFAULT 0 '+           //Código da Tabela
          ',CRC_SITUACAO int DEFAULT 0 '+
          ',CRC_OBSERVACAO varchar(255) NULL) ');
      except
      end;
      try
        //Tabela gerada e mantida na FILIAL
        ExecutaSQL(Query1,'CREATE TABLE CONTROLE_RECEBIMENTO_CPD_CONF ( '+
          ' CNC_CODIGO int '+
          ',CRC_CODIGO int) ');
        ExecutaSQL(Query1,'INSERT INTO CONTROLE_RECEBIMENTO_CPD_CONF VALUES (0,0) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CENTRO_DE_CUSTO ADD CNC_RECEBE_DADOS INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CENTRO_DE_CUSTO SET CNC_RECEBE_DADOS=1 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE REGISTRO_DELETADO ADD RDL_MAQUINA INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE REGISTRO_DELETADO SET RDL_MAQUINA=0 ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 69) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ADD CNC_ORIGEM INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CLIENTE SET CNC_ORIGEM=CNC_CODIGO ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ADD CLI_DT_IMPORTACAO_INS DATETIME NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ADD CLI_DT_IMPORTACAO_ALT DATETIME NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PRODUTO ADD PRD_PREVISAO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_PREVISAO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET PDV_DT_ENTREGA=PDV_DATA_HORA '+
          ' WHERE PDV_DT_ENTREGA IS NULL OR PDV_DT_ENTREGA=0');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 84) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CENTRO_DE_CUSTO ADD CNC_IP VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CENTRO_DE_CUSTO ADD CNC_OBSERVACAO VARCHAR(255) NULL ');
      except
      end;

    end;

    if (DM.Configuracao1.VersaoBase <= 68) then
    Begin
      if DM.Configuracao1.Empresa = 8 then
      Begin
        ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_EST_MINIMO=12 '+
          ' WHERE PRD_FORA_DE_LINHA=1 '+
          ' AND (PRD_EST_MINIMO=9 OR PRD_EST_MINIMO=0 OR PRD_EST_MINIMO IS NULL)');

        ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_EST_MINIMO=9 '+
          ' WHERE PRD_FORA_DE_LINHA=0 '+
          ' AND PRD_CATALOGO=1 '+
          ' AND (PRD_EST_MINIMO=3 OR PRD_EST_MINIMO=0 OR PRD_EST_MINIMO IS NULL)');

        ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_EST_MINIMO=3 '+
          ' WHERE PRD_FORA_DE_LINHA=0 '+
          ' AND (PRD_CATALOGO=0 OR PRD_CATALOGO IS NULL) '+
          ' AND (PRD_EST_MINIMO=3 OR PRD_EST_MINIMO=0 OR PRD_EST_MINIMO IS NULL)');
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_AUXILIAR ADD FUN_CODIGO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE ITEM_DE_PACOTE_DE_VENDA ( '+
          ' CNC_CODIGO int '+
          ',IPV_CODIGO int '+
          ',PDV_CODIGO int '+
          ',USU_CODIGO int '+
          ',GRP_CODIGO int '+
          ',SGP_CODIGO_1 int '+
          ',SGP_CODIGO_2 int DEFAULT 0 '+
          ',SGP_CODIGO_3 int DEFAULT 0 '+
          ',SGP_CODIGO_4 int DEFAULT 0 '+
          ',IPC_DT_CADASTRO datetime DEFAULT GetDate() '+
          ',IPC_DT_ALTERADO datetime NULL '+
          ',IPC_QUANTIDADE int DEFAULT 0'+
          ',IPC_QUANTIDADE_ENTREGUE int DEFAULT 0'+
          ',IPC_PRECO FLOAT DEFAULT 0 '+
          ',IPC_DESCONTO FLOAT DEFAULT 0 '+
          ',IPC_PRECO_DESCONTO FLOAT DEFAULT 0 '+
          ',IPC_SITUACAO int DEFAULT 0 '+
          ',IPC_OBSERVACAO varchar(255) NULL) ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 67) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ADD CNC_CONVENIO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CLIENTE SET CNC_CONVENIO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ADD CLI_CONVENIO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CLIENTE SET CLI_CONVENIO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_LIM_CRD_CONVENIO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE INFORMACOES_DE_CREDITO SET ICR_LIM_CRD_CONVENIO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_VERSAO_INCLUIROPER integer DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_VERSAO_INCLUIROPER=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AVALISTA ADD AVL_DT_CADASTRO DATETIME NULL ');
        ExecutaSQL(Query1,'UPDATE AVALISTA SET AVL_DT_CADASTRO="01/01/2003" ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AVALISTA ADD AVL_DT_ALTERADO DATETIME NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AVALISTA ADD AVL_FAX VARCHAR(20) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AVALISTA ADD AVL_CELULAR VARCHAR(20) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AVALISTA ADD USU_CODIGO INTEGER NULL ');
        ExecutaSQL(Query1,'UPDATE AVALISTA SET USU_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AVALISTA ADD AVL_SITUACAO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE AVALISTA SET AVL_SITUACAO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AVALISTA ADD AVL_OBSERVACAO VARCHAR(255) NULL ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 66) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD TRC_LOCAL VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PRODUTO ADD PRD_CATALOGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_CATALOGO=0 ');
      except
      end;
      if DM.Configuracao1.Empresa = 8 then
      Begin
        ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_EST_MINIMO=10 '+
          ' WHERE PRD_FORA_DE_LINHA=1 '+
          ' AND (PRD_EST_MINIMO=9 OR PRD_EST_MINIMO=0 OR PRD_EST_MINIMO IS NULL)');
      end;
    end;
    if (DM.Configuracao1.VersaoBase <= 65) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_PIS FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_PIS=0.65 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_COFINS FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_COFINS=3 ');
      except
      end;
    end;
    if (DM.Configuracao1.VersaoBase <= 64) then
    Begin
      try
        ExecutaSQL(Query1,'CREATE TABLE VERIFICAR_MERCADORIA ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' VER_TIPO INTEGER DEFAULT 0 NOT NULL, '+ //0-Compra; 1-Transferencia; 2-Pre-recebimento; 3-Recebimento; 4-Inventário
          ' VER_PEDIDO INTEGER NOT NULL, '+
          ' PRD_CODIGO INTEGER NOT NULL, '+
          ' VER_VOLUME INTEGER DEFAULT 1 NOT NULL, '+
          ' VER_QUANTIDADE FLOAT DEFAULT 1 NOT NULL) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRANSFERENCIA ADD FPG_CODIGO INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COTA4 FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COTA10 FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COTA20 FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COTA30 FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COTA40 FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COMISSAO4 FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COMISSAO10 FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COMISSAO20 FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COMISSAO30 FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_COTA ADD ICA_COMISSAO40 FLOAT DEFAULT 0 NULL');
      except
      end;
    end;
    if (DM.Configuracao1.VersaoBase <= 63) then
    Begin
      try
        if DM.Configuracao1.Empresa = empEletro then
          ExecutaSQL(Query1,'UPDATE PRODUTO SET GRP_CODIGO=35 ,SGP_CODIGO=186 '+
            ' WHERE GRP_CODIGO NOT IN (SELECT GRP_CODIGO FROM GRUPO) '+
            ' OR SGP_CODIGO NOT IN (SELECT SGP_CODIGO FROM SUBGRUPO) ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 62) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_CONT_TRANSFERE INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_CONT_TRANSFERE=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD TRC_CV VARCHAR(20) NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRCTEMP ADD TRC_CV VARCHAR(20) NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ADD CLI_TIPO INTEGER DEFAULT 0 ');
        ExecutaSQL(Query1,'UPDATE CLIENTE SET CLI_TIPO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'DELETE FROM ITEM_DE_TABELA_DE_PRECO '+
          ' WHERE NOT EXISTS (SELECT TBP_CODIGO FROM TABELA_DE_PRECO T1 '+
          ' WHERE T1.CNC_CODIGO=ITEM_DE_TABELA_DE_PRECO.CNC_CODIGO '+
          ' AND T1.TBP_CODIGO=ITEM_DE_TABELA_DE_PRECO.TBP_CODIGO)' );
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 61) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE TABELA_DE_PRECO ADD TBP_DESCONTO_SIMPLES_PRAZO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TABELA_DE_PRECO SET TBP_DESCONTO_SIMPLES_PRAZO=TBP_DESCONTO_SIMPLES ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TABELA_DE_PRECO ADD TBP_DESCONTO_ESPECIAL_PRAZO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TABELA_DE_PRECO SET TBP_DESCONTO_ESPECIAL_PRAZO=TBP_DESCONTO_ESPECIAL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TABELA_DE_PRECO ADD ITP_DT_CADASTRO DATETIME DEFAULT GETDATE() NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TABELA_DE_PRECO ADD ITP_DT_ALTERADO DATETIME NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TABELA_DE_PRECO ADD USU_CODIGO INTEGER NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_LIMITE_MEDIA_VENDA INTEGER DEFAULT 60 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_LIMITE_MEDIA_VENDA=60 ')
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_TRANSFERENCIA ADD ITR_PRECO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_TRANSFERENCIA SET ITR_PRECO=0 ')
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_ANTECIPADO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET PDV_ANTECIPADO=0 ')
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 60) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_FRETE FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET PDV_FRETE=0 ');
      except
      end;

      try
        ExecutaSQL(Query1,'CREATE TABLE USUARIO_SENHA ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' CNC_USUARIO INTEGER NOT NULL, '+
          ' USU_USUARIO INTEGER NOT NULL, '+
          ' SNH_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' SNH_DT_ALTERADO DATETIME NULL, '+
          ' SNH_SENHA VARCHAR(100) NOT NULL, '+
          ' SNH_SITUACAO INTEGER DEFAULT 0 NOT NULL, '+
          ' SNH_OBSERVACAO VARCHAR(255) NULL) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE USUARIO ADD USU_DT_SENHA_ALTERADA DATETIME NULL ');
        ExecutaSQL(Query1,'UPDATE USUARIO SET USU_DT_SENHA_ALTERADA="'+MesDiaHora(Now)+'" ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 59) then
    Begin
      try
        ExecutaSQL(Query1,'DROP TABLE MOVIMENTO_CC');
      except
      end;
      try
        ExecutaSQL(Query1,'DROP TABLE MOVIMENTO_CC_CONF');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE MOVIMENTO_CONTA_CORRENTE ( '+
          ' CNC_CODIGO int NOT NULL, '+
          ' CNC_ORIGEM int NOT NULL, '+
          ' MCC_CODIGO int NOT NULL, '+
          ' USU_CODIGO int NOT NULL, '+
          ' CBN_CODIGO int DEFAULT 0 NOT NULL,'+         //Código da Conta Bancária
          ' MCC_MAQUINA INTEGER DEFAULT 0 NOT NULL, '+
          ' MCC_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' MCC_DT_COMPETENCIA DATETIME NULL, '+
          //Informação está na Tabela PARAMETROS
          ' MCC_DC VARCHAR(1) NOT NULL, '+ //D-Débito; C-Crédito
          ' MCC_TIPO INTEGER DEFAULT 0 NOT NULL, '+
          ' MCC_DOCUMENTO VARCHAR(100) NULL, '+ //Número do Doumento de Depósito/Retirada
          ' MCC_SALDO_ANT FLOAT DEFAULT 0 NOT NULL, '+
          ' MCC_VALOR FLOAT DEFAULT 0 NOT NULL, '+
          ' MCC_SALDO_MOVIMENTO FLOAT DEFAULT 0 NOT NULL, '+                    
          ' MCC_SITUACAO INTEGER DEFAULT 0, '+
          ' MCC_OBSERVACAO VARCHAR(255) NULL)');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE MOVIMENTO_CONTA_CORRENTE_CONF ( '+
          ' MCC_CODIGO int, '+
          ' CNC_CODIGO int)');
        ExecutaSQL(Query1,'INSERT INTO MOVIMENTO_CONTA_CORRENTE_CONF VALUES (0,0) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PARAMETRO ADD PAR_DT_CADASTRO DATETIME DEFAULT GETDATE() NULL ');
        ExecutaSQL(Query1,'UPDATE PARAMETRO SET PAR_DT_CADASTRO="01/01/2003" ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PARAMETRO ADD PAR_DT_ALTERADO DATETIME NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PARAMETRO ADD PAR_INFORMACAO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PARAMETRO SET PAR_INFORMACAO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PARAMETRO ADD PAR_OBSERVACAO VARCHAR(255) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_IGNORAR_DEPOSITOS INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_IGNORAR_DEPOSITOS=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD CNC_MOVIMENTO_CONTA_CORRENTE INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET CNC_MOVIMENTO_CONTA_CORRENTE=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD MCC_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET MCC_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_PAGAR ADD CNC_MOVIMENTO_CONTA_CORRENTE INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TITULO_A_PAGAR SET CNC_MOVIMENTO_CONTA_CORRENTE=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_PAGAR ADD MCC_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TITULO_A_PAGAR SET MCC_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE MODULO ADD PRIMARY KEY (MDL_CODIGO) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE SUBMODULO ADD PRIMARY KEY (MDL_CODIGO,SML_CODIGO) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE OPERACAO_DO_SISTEMA ADD PRIMARY KEY (MDL_CODIGO,SML_CODIGO,OPS_CODIGO) ');
      except
      end;
    end;
    ////////////////////////

    if (DM.Configuracao1.VersaoBase <= 58) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE PRODUTO ADD PRD_FORA_DE_LINHA INTEGER DEFAULT 0 NULL ');
        if DM.Configuracao1.Empresa <> empHope then
          ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_FORA_DE_LINHA=0 '+
            ' WHERE PRD_FORA_DE_LINHA IS NULL ')
        else
        Begin
          ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_FORA_DE_LINHA=1 '+
            ' WHERE PRD_DETALHE="FL" '+
            ' AND PRD_FORA_DE_LINHA IS NULL ');
          ExecutaSQL(Query1,'UPDATE PRODUTO SET PRD_FORA_DE_LINHA=0 '+
            ' WHERE PRD_FORA_DE_LINHA IS NULL ')
        end;
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD TRC_PAGAMENTO_PARCIAL INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET TRC_PAGAMENTO_PARCIAL=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRCTEMP ADD TRC_PAGAMENTO_PARCIAL INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TRCTEMP SET TRC_PAGAMENTO_PARCIAL=0 ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 57) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE SUBGRUPO ADD SGP_EIXOS VARCHAR(100) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD TRC_CHEQUE_DEVOLVIDO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET TRC_CHEQUE_DEVOLVIDO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE TRCTEMP ADD TRC_CHEQUE_DEVOLVIDO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE TRCTEMP SET TRC_CHEQUE_DEVOLVIDO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_JUROS_ENTRADA INTEGER DEFAULT 0 NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_CONTABIL_1 VARCHAR(20) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_CONTABIL_2 VARCHAR(20) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_CONTABIL_3 VARCHAR(20) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_CONTABIL_4 VARCHAR(20) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_HISTORICO_CONTABIL VARCHAR(20) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_LIBERAR_DESCONTO_FPG INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE AGENTE_FINANCEIRO SET AGF_LIBERAR_DESCONTO_FPG=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE AGENTE_FINANCEIRO ADD AGF_SITUACAO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE AGENTE_FINANCEIRO SET AGF_SITUACAO=0 ');
      except
      end;
      try
        if DM.Configuracao1.Empresa = empHOPE then
          ExecutaSQL(Query1,'DELETE FROM CODIGO_DE_BARRAS '+
            ' WHERE CDB_TIPO=0 '+
            ' AND CDB_CODIGO_ENTRADA NOT IN '+
            ' (SELECT PRD_CODIGO FROM PRODUTO) ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 55) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CENTRO_DE_CUSTO ADD CNC_EMAIL VARCHAR(100) NULL ');
        if DM.Configuracao1.Empresa = empLBM then
          ExecutaSQL(Query1,'UPDATE CENTRO_DE_CUSTO SET CNC_EMAIL="lbm@lbmmoveis.com.br"');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CENTRO_DE_CUSTO ADD CNC_SITE VARCHAR(100) NULL ');
        if DM.Configuracao1.Empresa = empLBM then
          ExecutaSQL(Query1,'UPDATE CENTRO_DE_CUSTO SET CNC_SITE="www.lbmmoveis.com.br"');
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE NOTA_FISCAL ADD TRO_CODIGO INTEGER DEFAULT 0 NULL');
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE CONTA_DE_CAIXA ADD CCX_AVULSO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE CONTA_DE_CAIXA SET CCX_AVULSO=0 ');
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_IGNORAR_CHEQUES INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_IGNORAR_CHEQUES=0 ');
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_DIAS_VENDA_INADIPLENTE INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_DIAS_VENDA_INADIPLENTE=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_LIMITE_CREDITO_BASICO FLOAT DEFAULT 0 NULL ');
        if DM.Configuracao1.Empresa = empLBM then
          ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_LIMITE_CREDITO_BASICO=999 ')
        else
          ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_LIMITE_CREDITO_BASICO=500 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_CUSTO_OPERACIONAL FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_CUSTO_OPERACIONAL=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_CUSTO_OPERACIONAL_LJ3 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_CUSTO_OPERACIONAL_LJ3=0 ');
      except
      end;

      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_INVENTARIO ADD IIV_OBSERVACAO VARCHAR(255) NULL');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 86) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD FUN_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE TITULO_A_RECEBER SET FUN_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ADD CLI_DESCONTO_PRAZO FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CLIENTE SET CLI_DESCONTO_PRAZO=0 ');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 86) then
    Begin
      try
        ExecutaSQL(Query1,'CREATE TABLE PENDENCIA ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' PEN_CODIGO INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' FUN_CODIGO INTEGER NOT NULL, '+
          ' PEN_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' PEN_DT_ALTERADO DATETIME NULL, '+
          ' PEN_DT_REFERENCIA DATETIME NULL, '+
          ' PEN_TIPO INTEGER DEFAULT 0 NULL, '+ //0 Dev.Total; 1 DevParcial; 2 DescontoVenda; 3 CancelarVenda; 4 DescontoTRC; 5 ExcTRC
          ' PEN_DESCRICAO VARCHAR(255) NULL, '+
          ' PEN_CREDITO_EXTORNO INTEGER DEFAULT 0 NULL, '+ //-1 Não interfere; 0 Credito; 1 Extorno; 2 Ignora
          ' CLI_CODIGO INTEGER DEFAULT 0 NULL, '+
          ' CNC_CLIENTE INTEGER DEFAULT 0 NULL, '+
          ' PDV_CODIGO INTEGER DEFAULT 0 NULL, '+
          ' CNC_PEDIDO INTEGER DEFAULT 0 NULL, '+
          ' PEN_TIPO_PAG INTEGER DEFAULT 0 NULL, '+
          ' FPG_CODIGO INTEGER DEFAULT 0 NULL, '+
          ' AGF_CODIGO INTEGER DEFAULT 0 NULL, '+
          ' PRD_CODIGO_1 INTEGER DEFAULT 0 NULL, '+
          ' PEN_PRECO_PRD1 FLOAT DEFAULT 0 NULL, '+
          ' PRD_CODIGO_2 INTEGER DEFAULT 0 NULL, '+
          ' PEN_PRECO_PRD2 FLOAT DEFAULT 0 NULL, '+
          ' PRD_CODIGO_3 INTEGER DEFAULT 0 NULL, '+
          ' PEN_PRECO_PRD3 FLOAT DEFAULT 0 NULL, '+
          ' TRC_CODIGO INTEGER DEFAULT 0 NULL, '+
          ' PEN_VALOR_TRC FLOAT DEFAULT 0 NULL, '+
          ' PEN_USU_LIBEROU INTEGER DEFAULT 0 NULL, '+
          ' PEN_CAMPO_VERIFICADOR VARCHAR(100) NULL, '+
          ' PEN_SITUACAO INTEGER DEFAULT 0 NULL, '+ //0 EmAberto; 1 Desativado; 2 Executado
          ' PEN_OBSERVACAO VARCHAR(255) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE PENDENCIA_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' PEN_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO PENDENCIA_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'CREATE TABLE PENDENCIA_CPD ( '+
          ' CNC_ORIGEM INTEGER NOT NULL, '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' PEC_CODIGO INTEGER NOT NULL, '+
          ' PEN_CODIGO INTEGER NOT NULL, '+
          ' CNC_PENDENCIA INTEGER NOT NULL, '+
          ' USU_CODIGO INTEGER NOT NULL, '+
          ' PEC_DT_CADASTRO DATETIME DEFAULT GETDATE() NOT NULL, '+
          ' PEC_DT_ALTERADO DATETIME NULL, '+
          ' PEC_CAMPO_VERIFICADOR VARCHAR(100) NULL) ');
        ExecutaSQL(Query1,'CREATE TABLE PENDENCIA_CPD_CONF ( '+
          ' CNC_CODIGO INTEGER NOT NULL, '+
          ' PEC_CODIGO INTEGER NOT NULL) ');
        ExecutaSQL(Query1,'INSERT INTO PENDENCIA_CPD_CONF VALUES (0,0)');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_MONT_META FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_MONT_META=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_MONT_COTA1 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_MONT_COTA1=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_MONT_COTA2 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_MONT_COTA2=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_INVENTARIO ADD FUN_CODIGO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE ITEM_DE_INVENTARIO SET FUN_CODIGO=0');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_TITULO_GERADO2 INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET PDV_TITULO_GERADO2=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD CNC_FATURAMENTO_PENDENTE2 INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET CNC_FATURAMENTO_PENDENTE2=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD FPE_CODIGO2 INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE PEDIDO_DE_VENDA SET FPE_CODIGO2=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_DT_FPE2 DATETIME NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD FUN_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_DT_CADASTRO DATETIME NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_DT_ALTERADO DATETIME NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_DT_REFERENCIA DATETIME NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_TIPO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_DESCRICAO VARCHAR(255) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_CREDITO_EXTORNO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD CLI_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD CNC_CLIENTE INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PDV_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD CNC_PEDIDO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_TIPO_PAG INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD FPG_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD AGF_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PRD_CODIGO_1 INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_PRECO_PRD1 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PRD_CODIGO_2 INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_PRECO_PRD2 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PRD_CODIGO_3 INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_PRECO_PRD3 FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD TRC_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_VALOR_TRC FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_CAMPO_VERIFICADOR VARCHAR(100) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_SITUACAO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEN_OBSERVACAO VARCHAR(255) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA ADD PRIMARY KEY (CNC_ORIGEM,CNC_CODIGO,PEN_CODIGO) ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PRIMARY KEY (CNC_ORIGEM,CNC_CODIGO,PEC_CODIGO) ');
      except
      end;
      try
        if (DM.Configuracao1.Empresa = empEletro) and
           (not DM.Configuracao1.CPD) then
        Begin
          ExecutaSQL(Query1,'DELETE FROM PRODUTO '+
            ' WHERE PRD_CODIGO IN (SELECT PRD_CODIGO '+
            '                      FROM PRODUTO '+
            '                      GROUP BY PRD_CODIGO '+
            '                      HAVING COUNT(*) > 1) ');
          ExecutaSQL(Query1,'ALTER TABLE PRODUTO ADD PRIMARY KEY (PRD_CODIGO)');
        end;
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA ADD PRIMARY KEY (CNC_ORIGEM, CNC_CODIGO, PEN_CODIGO)');
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PRIMARY KEY (CNC_ORIGEM, CNC_CODIGO, PEC_CODIGO)');
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 87) then
    Begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_MAGAZINE INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_MAGAZINE=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONTROLE_VEICULO ADD MTV_DT_INICIAL DATETIME NULL ');
        ExecutaSQL(Query1,'UPDATE CONTROLE_VEICULO SET MTV_DT_INICIAL=MTV_DT_CADASTRO ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CONTROLE_VEICULO ADD MTV_DT_FINAL DATETIME NULL ');
        ExecutaSQL(Query1,'UPDATE CONTROLE_VEICULO SET MTV_DT_FINAL=MTV_DT_ALTERADO ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PENDENCIA_CPD ADD PEC_SITUACAO INTEGER DEFAULT 0 NULL');
        ExecutaSQL(Query1,'UPDATE PENDENCIA_CPD SET PEC_SITUACAO=2 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD PRF_CODIGO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE INFORMACOES_DE_CREDITO SET PRF_CODIGO=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_RENDA_EXTRA FLOAT DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE INFORMACOES_DE_CREDITO SET ICR_RENDA_EXTRA=0 ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_ORIGEM_EXTRA VARCHAR(50) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_REFERENCIA1 VARCHAR(100) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_FONE_REFERENCIA1 VARCHAR(20) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_REFERENCIA2 VARCHAR(100) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_FONE_REFERENCIA2 VARCHAR(20) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_REFERENCIA3 VARCHAR(100) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_FONE_REFERENCIA3 VARCHAR(20) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_REFERENCIA4 VARCHAR(100) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_FONE_REFERENCIA4 VARCHAR(20) NULL ');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_LOCAL_TRABALHO VARCHAR(100) NULL ');
        ExecutaSQL(Query1,'ALTER TABLE INFORMACOES_DE_CREDITO ADD ICR_TEMPO_TRABALHO INTEGER DEFAULT 0 NULL ');
        ExecutaSQL(Query1,'UPDATE INFORMACOES_DE_CREDITO SET ICR_TEMPO_TRABALHO=0 ');
      except
      end;
      try
        with Query1 do
        Begin
          Close;
          SQL.Text := 'SELECT * FROM CLIENTE '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CentroDeCusto)+
            ' AND (CLI_PROFISSAO<>"" '+
            '   OR CLI_LOCALTRABALHO<>"") ';
          Open;
          edtContador.Text := '0';
          while not Eof do
          Begin
            Query2.Close;
            Query2.SQL.Text := 'SELECT * FROM INFORMACOES_DE_CREDITO '+
              ' WHERE CNC_CODIGO='+FieldByName('CNC_CODIGO').asString+
              ' AND CLI_CODIGO='+FieldByName('CLI_CODIGO').asString;
            Query2.Open;
            if Query2.IsEmpty then
              ExecutaSQL(DM.Query1,'INSERT INTO INFORMACOES_DE_CREDITO '+
                '(CNC_CODIGO,CLI_CODIGO,AVL_CODIGO,ICR_DT_ALTERADO,ICR_LOCAL_TRABALHO) VALUES ('+
                '  '+FieldByName('CNC_CODIGO').asString+
                ', '+FieldByName('CLI_CODIGO').asString+
                ',0'+//Avalista+
                ',"'+MesDiaHora(Now)+'" '+
                ',"'+Trim(RetiraAspas(FieldByName('CLI_PROFISSAO').asString+' '+FieldByName('CLI_LOCALTRABALHO').asString))+'")')
            else
              ExecutaSQL(DM.Query1,'UPDATE INFORMACOES_DE_CREDITO SET '+
                ' ICR_LOCAL_TRABALHO="'+Trim(RetiraAspas(FieldByName('CLI_PROFISSAO').asString+' '+FieldByName('CLI_LOCALTRABALHO').asString))+'" '+
                ' WHERE CNC_CODIGO='+FieldByName('CNC_CODIGO').asString+
                ' AND CLI_CODIGO='+FieldByName('CLI_CODIGO').asString);
            edtContador.Text := IntToStr(StrToInt(edtContador.Text)+1);
            edtContador.Refresh;
            Next;
          end;
        end;
      except
      end;
    end;

    if (DM.Configuracao1.VersaoBase <= 88) then
    begin
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ALTER COLUMN CLI_PAI VARCHAR(60) NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ALTER COLUMN CLI_MAE VARCHAR(60) NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE CLIENTE ALTER COLUMN CLI_CONJUGE VARCHAR(60) NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_PEDIDO_DE_COMPRA ADD IPC_HOYAT FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_COMPRA ADD PCP_TOTAL_HOYAT FLOAT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1,'ALTER TABLE ITEM_DE_PEDIDO_DE_VENDA ADD IPV_FISCAL INT DEFAULT 0 NULL');
      except
      end;
      try
        ExecutaSQL(Query1, 'ALTER TABLE CONTA_DE_CAIXA ADD ACC_CODIGO INTEGER NULL');
      except
      end;
      try
        ExecutaSQL(Query1, 'CREATE TABLE GRUPO_CONTA_DE_CAIXA ('+
          '  GCC_CODIGO INTEGER CONSTRAINT PK_GCC_CODIGO PRIMARY KEY NOT NULL,'+
          '  GCC_DESCRICAO VARCHAR(80) NULL ,'+
          '  GCC_SITUACAO INTEGER NULL ,'+
          '  USU_CODIGO INTEGER NULL ,'+
          '  GCC_DT_CADASTRO DATETIME NULL ,'+
          '  GCC_DT_ALTERADO DATETIME NULL ,'+
          '  GCC_OBS TEXT NULL)');
      except
      end;
      try
        ExecutaSQL(Query1, 'CREATE TABLE SUBGRUPO_CONTA_DE_CAIXA ('+
          '  SCC_CODIGO INTEGER CONSTRAINT PK_SCC_CODIGO PRIMARY KEY NOT NULL,'+
          '  GCC_CODIGO INTEGER NOT NULL ,'+
          '  SCC_DESCRICAO VARCHAR(50) NULL ,'+
          '  USU_CODIGO INTEGER NULL ,'+
          '  SCC_DT_CADASTRO DATETIME NULL ,'+
          '  SCC_DT_ALTERADO DATETIME NULL ,'+
          '  SCC_OBS TEXT NULL ,'+
          '  SCC_SITUACAO INTEGER NULL)');
      except
      end;
      try
        ExecutaSQL(Query1, 'CREATE TABLE ABRANGENTES_CONTA_DE_CAIXA ('+
          '  ACC_CODIGO INTEGER CONSTRAINT PK_ACC_CODIGO PRIMARY KEY NOT NULL,'+
          '  SCC_CODIGO INTEGER NOT NULL ,'+
          '  ACC_DESCRICAO VARCHAR(50) NULL ,'+
          '  USU_CODIGO INTEGER NULL ,'+
          '  ACC_DT_CADASTRO DATETIME NULL ,'+
          '  ACC_DT_ALTERADO DATETIME NULL ,'+
          '  ACC_OBS TEXT NULL ,'+
          '  ACC_SITUACAO INTEGER NULL)');
      except
      end;
      try
        ExecutaSQL(Query1, 'CREATE TABLE ORCAMENTO ('+
          ' ORC_CODIGO INTEGER CONSTRAINT PK_ORC_CODIGO PRIMARY KEY NOT NULL ,'+
          ' CNC_CENTRO_ORCADO INTEGER NOT NULL ,'+
          ' ORC_DESCRICAO VARCHAR(80) NULL ,'+
          ' ORC_DT_CADASTRO DATETIME NULL ,'+
          ' ORC_DT_ALTERADO DATETIME NULL ,'+
          ' ORC_OBS VARCHAR(255) NULL ,'+
          ' ORC_SITUACAO INTEGER NULL'+
          ' )');
      except
      end;
      try
        ExecutaSQL(Query1, 'CREATE TABLE ITEM_DE_ORCAMENTO ('+
          ' IOR_CODIGO INTEGER CONSTRAINT PK_IOR_CODIGO PRIMARY KEY NOT NULL ,'+
          ' ORC_CODIGO INTEGER NOT NULL ,'+
          ' IOR_ITEM INTEGER NOT NULL ,'+
          ' IOR_TOTAL FLOAT NULL ,'+
          ' IOR_TIPO_ITEM INTEGER NULL ,'+
          ' IOR_OBS VARCHAR(255) NULL'+
          ' )');
      except
      end;
      try
        ExecutaSQL(Query1, 'CREATE TABLE DATA_DE_ORCAMENTO ('+
          ' DOR_CODIGO INTEGER NOT NULL ,'+
          ' IOR_CODIGO INTEGER NULL ,'+
          ' DOR_VALOR FLOAT NULL ,'+
          ' DOR_MES_ANO VARCHAR(7) NULL'+
          ' )');
      except
      end;
      try
        ExecutaSQL(Query1, 'ALTER TABLE CONFIGURACAO ADD CNF_AVISTA INTEGER NULL');
      except
      end;
      try
        ExecutaSQL(Query1, 'ALTER TABLE CONFIGURACAO ADD CNF_CHEQUE INTEGER NULL');
      except
      end;
      try
        ExecutaSQL(Query1, 'ALTER TABLE CONFIGURACAO ADD CNF_CCREDITO INTEGER NULL');
      except
      end;
      try
        ExecutaSQL(Query1, 'ALTER TABLE CONFIGURACAO ADD CNF_CARNE INTEGER NULL');
      except
      end;
      try
        ExecutaSQL(Query1, 'ALTER TABLE CONFIGURACAO ADD CNF_BOLETO INTEGER NULL');
      except
      end;
      try
        ExecutaSQL(Query1, 'ALTER TABLE GRUPO ADD SUG_CODIGO INTEGER NULL');
      except
      end;
      try
        ExecutaSQL(Query1, 'CREATE TABLE SUPER_GRUPO ('+
          ' SUG_CODIGO INTEGER NOT NULL ,'+
          ' SUG_DESCRICAO VARCHAR(80) NULL ,'+
          ' USU_CODIGO INTEGER NULL ,'+
          ' SUG_DT_CADASTRO DATETIME NULL ,'+
          ' SUG_DT_ALTERADO DATETIME NULL ,'+
          ' SUG_OBS VARCHAR(255) NULL ,'+
          ' SUG_SITUACAO INTEGER NULL'+
          ' )');
      except
      end;
    end;
    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_VERSAO_BASE='+IntToStr(cVersaoBase));
    except
    end;

  end;

  Label1.caption := '';
  Self.Visible := false;

  ShowMessage('Fim das atualizações! Versão ('+IntToStr(cVersaoBase)+')');
  Application.Terminate;
end;

procedure TForm1.Versao_Maior_Igual_100;
begin
  if (DM.Configuracao1.VersaoBase <= 100) then
  begin
    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_URL=''lantech.eti.br''');
    except
    end;

    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_USUARIO=''lantech''');
    except
    end;

    try
      //ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_SENHA='''+Encrypt('pipoca0001')+'''');
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_SENHA=''pipoca0001''');
    except
    end;

    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_PASSIVO=''S''');
    except
    end;
  end;
end;

procedure TForm1.Versao_Maior_Igual_101;
begin
  if (DM.Configuracao1.VersaoBase <= 101) then
  begin

//TODO if exists  
    try
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.Text := 'SELECT MDL_CODIGO FROM MODULO WHERE MDL_CODIGO = 14';
      Query1.Open;
      if Query1.IsEmpty then
        ExecutaSQL(Query1,'INSERT INTO MODULO VALUES (0,14,''Fiscal'')');
    except
    end;
    try
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.Text := 'SELECT SML_CODIGO FROM SUBMODULO WHERE MDL_CODIGO = 14 AND SML_CODIGO = 250';
      Query1.Open;
      if Query1.IsEmpty then
        ExecutaSQL(Query1,'INSERT INTO SUBMODULO VALUES (0,250,14,''Principal'')');
    except
    end;
    try
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.Text := 'SELECT SML_CODIGO FROM SUBMODULO WHERE MDL_CODIGO = 14 AND SML_CODIGO = 251';
      Query1.Open;
      if Query1.IsEmpty then
        ExecutaSQL(Query1,'INSERT INTO SUBMODULO VALUES (0,251,14,''PAF'')');
    except
    end;
    try
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.Text := 'SELECT SML_CODIGO FROM SUBMODULO WHERE MDL_CODIGO = 14 AND SML_CODIGO = 252';
      Query1.Open;
      if Query1.IsEmpty then
        ExecutaSQL(Query1,'INSERT INTO SUBMODULO VALUES (0,252,14,''SPED'')');
    except
    end;
    try
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.Text := 'SELECT SML_CODIGO FROM SUBMODULO WHERE MDL_CODIGO = 14 AND SML_CODIGO = 253';
      Query1.Open;
      if Query1.IsEmpty then
        ExecutaSQL(Query1,'INSERT INTO SUBMODULO VALUES (0,253,14,''NFe'')');
    except
    end;

    try
      with DM.Operacao_do_Sistema1 do
      Begin
        Open;
        if not LocalizarCod(8990) then
          Inserir(0,8990,14,251,Now,'Acessar Menu Fiscal','');
        if not LocalizarCod(9000) then
          Inserir(0,9000,14,251,Now,'Acessar SubMenu PAF','');
        if not LocalizarCod(9010) then
          Inserir(0,9010,14,251,Now,'Acessar Cupom Fiscal','');
        if not LocalizarCod(9020) then
          Inserir(0,9020,14,251,Now,'Acessar Exportação de Dados','');
        if not LocalizarCod(9030) then
          Inserir(0,9030,14,251,Now,'Acessar Importação de Dados','');
        if not LocalizarCod(9040) then
          Inserir(0,9040,14,252,Now,'Acessar SPED','');
        if not LocalizarCod(9050) then
          Inserir(0,9050,14,253,Now,'Acessar NFe','');
      end;
    except
    end;
  end;
end;

procedure TForm1.Versao_Maior_Igual_102;
begin
  if (DM.Configuracao1.VersaoBase <= 102) then
  begin
    try
      ExecutaSQL(Query1,'ALTER TABLE PRODUTO ADD PRD_COD_PAF INT;');
    except
    end;
  end;
end;

procedure TForm1.Versao_Maior_Igual_91;
begin
(*</CONSIGNAÇÃO*)
  if (DM.Configuracao1.VersaoBase <= 91) then
  Begin
    try
      with DM.Operacao_do_Sistema1 do
      Begin
        Open;
        if not LocalizarCod(8940) then
          Inserir(0,8940,1,104,Now,'Inserir/Alterar Consignação','');
        if not LocalizarCod(8950) then
          Inserir(0,8950,1,104,Now,'Excluir Consignação','');
        if not LocalizarCod(8960) then
          Inserir(0,8960,1,104,Now,'Inserir/Alterar Item de Consignação','');
        if not LocalizarCod(8970) then
          Inserir(0,8970,1,104,Now,'Excluir Item de Consignação','');
        if not LocalizarCod(8980) then
          Inserir(0,8980,1,104,Now,'Acessar Consignação','');
      end;
    except
    end;
    try
      with DM.Parametro2 do
      Begin
        Open;
        if not LocalizarCod(4590) then
          Inserir(4590, 80, 'CONSIGNACAO');
        if not LocalizarCod(4600) then
          Inserir(4600, 80, 'ITEM_DE_CONSIGNACAO');
      end;
    except
    end;
    try
      ExecutaSQL(Query1,'CREATE TABLE dbo.CONSIGNACAO ( '+
                        ' CNC_CODIGO INTEGER NOT NULL, '+
                        ' CSG_CODIGO INTEGER NOT NULL, '+
                        ' USU_CODIGO INTEGER NOT NULL, '+
                        ' FUN_CODIGO INTEGER NOT NULL, '+
                        ' CSG_DATA DATETIME DEFAULT GETDATE() NOT NULL, '+
                        ' CSG_DT_ALTERADO DATETIME NULL, '+
                        ' CSG_VALOR FLOAT DEFAULT 0 NULL, '+
                        ' CSG_SITUACAO INTEGER DEFAULT 0 NULL, '+ //0-Aberto / 1-confirmado / 2-finalizado / 3-cancelado
                        ' CSG_OBSERVACAO VARCHAR(255) NULL) ');
    except
    end;

    try
      ExecutaSQL(Query1,'CREATE TABLE dbo.CONSIGNACAO_CONF ( '+
        ' CNC_CODIGO INTEGER NOT NULL, '+
        ' CSG_CODIGO INTEGER NOT NULL) ');
      ExecutaSQL(Query1,'INSERT INTO dbo.CONSIGNACAO_CONF VALUES (0,0)');
    except
    end;

    try
      ExecutaSQL(Query1,'CREATE TABLE dbo.ITEM_DE_CONSIGNACAO ( '+
                        ' CNC_CODIGO INTEGER NOT NULL, '+
                        ' ICS_CODIGO INTEGER NOT NULL, '+
                        ' CSG_CODIGO INTEGER NOT NULL, '+
                        ' PRD_CODIGO INTEGER NOT NULL, '+
                        ' USU_CODIGO INTEGER NOT NULL, '+
                        ' ICS_DATA DATETIME DEFAULT GETDATE() NOT NULL, '+
                        ' ICS_QUANTIDADE FLOAT DEFAULT 0 NULL, '+
                        ' ICS_VALOR FLOAT DEFAULT 0 NULL, '+
                        ' ICS_OBSERVACAO VARCHAR(255) NULL) ');
    except
    end;

    try
      ExecutaSQL(Query1,'CREATE TABLE dbo.ITEM_DE_CONSIGNACAO_CONF ( '+
        ' CNC_CODIGO INTEGER NOT NULL, '+
        ' ICS_CODIGO INTEGER NOT NULL) ');
      ExecutaSQL(Query1,'INSERT INTO dbo.ITEM_DE_CONSIGNACAO_CONF VALUES (0,0)');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD CSG_CODIGO INT NULL');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE CONSIGNACAO ADD CLI_CODIGO INT NULL');
    except
    end;
    try
      ExecutaSQL(Query1,'ALTER TABLE CLIENTE ADD CLI_CONSIGNATARIO INT NULL');
    except
    end;
  end;
(*CONSIGNAÇÃO/>*)

end;

procedure TForm1.Versao_Maior_Igual_92;
begin
  if (DM.Configuracao1.VersaoBase <= 92) then
  begin
    try
      ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_FTP_URL VARCHAR(150) NULL ');
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_URL=''siac.buildsistemas.com.br''');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_FTP_USUARIO VARCHAR(50) NULL ');
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_USUARIO=''siac''');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_FTP_SENHA VARCHAR(50) NULL ');
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_SENHA='''+Encrypt('s2f1303')+'''');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_FTP_PASSIVO VARCHAR(2) NULL ');
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_PASSIVO=''N''');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_ARQUIVO_PRINCIPAL VARCHAR(150) NULL ');
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_ARQUIVO_PRINCIPAL=''/httpdocs/Sistema/PSACI.exe''');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE CONFIGURACAO ADD CNF_ARQUIVO_CHAVE VARCHAR(150) NULL ');
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_ARQUIVO_CHAVE=''/httpdocs/Sistema/Chave.dll''');
    except
    end;
  end;
end;

procedure TForm1.Versao_Maior_Igual_93;
begin
  if (DM.Configuracao1.VersaoBase <= 93) then
  begin
    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_URL=''buildsistemas.com.br''');
    except
    end;

    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_USUARIO=''siac@buildsistemas.com.br''');
    except
    end;

    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_SENHA='''+Encrypt('s2f1303')+'''');
    except
    end;

    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_FTP_PASSIVO=''N''');
    except
    end;

    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_ARQUIVO_PRINCIPAL=''/Sistema/PSACI.exe''');
    except
    end;

    try
      ExecutaSQL(Query1,'UPDATE CONFIGURACAO SET CNF_ARQUIVO_CHAVE=''/Sistema/Chave.dll''');
    except
    end;
  end;
end;

procedure TForm1.Versao_Maior_Igual_94;
begin
  if (DM.Configuracao1.VersaoBase <= 94) then
  begin
    try
      ExecutaSQL(Query1,'CREATE TABLE dbo.COMUNICACOES ( '+
                        ' COM_PREFIXO VARCHAR(2) NULL ) ');
    except
    end;
  end;
end;

procedure TForm1.Versao_Maior_Igual_95;
begin
  if (DM.Configuracao1.VersaoBase <= 95) then
  begin
    try
      ExecutaSQL(Query1,'CREATE TABLE dbo.COMUNICACOES_ARQUIVOS ( '+
                        ' CMA_ARQUIVO_RECEBIDO VARCHAR(30) NULL) ');
    except
    end;
  end;
end;

procedure TForm1.Versao_Maior_Igual_96;
begin
  if (DM.Configuracao1.VersaoBase <= 96) then
  begin
    try
       ExecutaSQL(Query1,'UPDATE USUARIO SET USU_NOME = ''ADM'', USU_SENHA = ''' + Encrypt('s2f1303') + ''' WHERE USU_CODIGO = 1');
    except
    end;
  end;
end;

procedure TForm1.Versao_Maior_Igual_97;
begin
  if (DM.Configuracao1.VersaoBase <= 97) then
  begin
    try
      ExecutaSQL(Query1,'ALTER TABLE CLIENTE ADD CLI_NUMERO_END VARCHAR(10)');
    except
    end;
  end;
end;

procedure TForm1.Versao_Maior_Igual_98;
begin
  if (DM.Configuracao1.VersaoBase <= 98) then
  begin
    try
      ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD TRC_NOSSO_NUMERO INTEGER NULL');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD TRC_BOLETO CHAR(1) NULL');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE TITULO_A_RECEBER ADD TRC_BOLETO_EMITIDO CHAR(1) NULL');
    except
    end;

    try
      ExecutaSQL(Query1,'CREATE TABLE BOLETO_CONFIG ( ' +
                          'ID               INTEGER IDENTITY (1, 1) NOT NULL, ' +
                          'PATH_REMESSA     VARCHAR(100), ' +
                          'PATH_RETORNO     VARCHAR(100), ' +
                          'PATH_LOGOTIPO    VARCHAR(100), ' +
                          'PATH_GERARPDF    VARCHAR(100), ' +
                          'MENSAGEM         VARCHAR(250), ' +
                          'DIAS_PROTESTO    INTEGER, ' +
                          'ESPECIE          VARCHAR(3), ' +
                          'MOEDA            VARCHAR(3), ' +
                          'ACEITE           CHAR(3), ' +
                          'CARTEIRA         CHAR(3), ' +
                          'LOCAL_PAGTO      VARCHAR(100), ' +
                          'INSTRUCAO_1      VARCHAR(100), ' +
                          'INSTRUCAO_2      VARCHAR(100), ' +
                          'MSG_MULTA_JUROS  CHAR(1), ' +
                          'PERCENTUAL_JUROS FLOAT, ' +
                          'PERCENTUAL_MULTA FLOAT)');
      ExecutaSQL(Query1,'ALTER TABLE BOLETO_CONFIG ADD PRIMARY KEY (ID)');
    except
    end;

    try
      ExecutaSQL(Query1,'CREATE TABLE BOLETO_BANCO ( '+
                          'ID                   INTEGER IDENTITY (1, 1) NOT NULL, ' +
                          'NOME_BANCO			     VARCHAR(50), ' +
                          'NOME_AGENCIA		     VARCHAR(50), ' +
                          'NUMERO_AGENCIA	     VARCHAR(10), ' +
                          'DIGITO_AGENCIA	     CHAR(1), ' +
                          'NUMERO_CONTA		     VARCHAR(20), ' +
                          'DIGITO_CONTA		     CHAR(1), ' +
                          'CIDADE_AGENCIA		   VARCHAR(20), ' +
                          'UF_AGENCIA			     CHAR(2), ' +
                          'NOSSO_NUMERO		     VARCHAR(20), ' +
                          'CEDENTE              VARCHAR(50), ' +
                          'CONVENIO             VARCHAR(50), ' +
                          'CNPJCIC              VARCHAR(20), ' +
                          'MODALIDADE           VARCHAR(20), ' +
                          'TIPO_INSCRICAO       CHAR(1), ' +
                          'LAYOUT_REMESSA       VARCHAR(2), ' +
                          'COD_CEDENTE          VARCHAR(20), ' +
                          'CONT_REMESSA     INTEGER)');//esse campo guarda o número da ultima remessa emitida
      ExecutaSQL(Query1,'ALTER TABLE BOLETO_BANCO ADD PRIMARY KEY (ID)');
    except
    end;


    try
      ExecutaSQL(Query1,'ALTER TABLE PRODUTO ADD PRD_NCM VARCHAR(20)');
    except
    end;

  end;
end;

procedure TForm1.Versao_Maior_Igual_99;
begin
  if (DM.Configuracao1.VersaoBase <= 99) then
  begin
    try
      ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_COO VARCHAR(20) NULL');
    except
    end;

    try
      ExecutaSQL(Query1,'ALTER TABLE PEDIDO_DE_VENDA ADD PDV_CCF VARCHAR(20) NULL');
    except
    end;
  end;
end;

{
procedure TForm1.SetNFe;
begin
  sTbNFe := ' CREATE TABLE dbo.NFE (                                       ' +
            ' NFE_CODIGO                 INTEGER NOT NULL, ' +
            ' PDV_CODIGO                 INTEGER,                          ' +
            ' PCP_CODIGO                 INTEGER,                          ' +
            ' NTF_CODIGO                 INTEGER,                          ' +
            ' USU_CODIGO                 INTEGER,                          ' +
            ' NFE_ENTRADA_SAIDA          VARCHAR(1),                       ' +
            ' NFE_ESPECIE_DOCUMENTO      VARCHAR(5),                       ' +
            ' NFE_DOCUMENTO_PROPRIO      VARCHAR(1),                       ' +
            ' NFE_NUMERO_AIDF            VARCHAR(20),                      ' +
            ' NFE_SERIE                  VARCHAR(3),                       ' +
            ' NFE_SUBSERIE               VARCHAR(3),                       ' +
            ' NFE_NUMERO                 INTEGER NOT NULL,                 ' +
            ' NFE_NATUREZA_OPERACAO      VARCHAR(60),                      ' +
            ' NFE_OBSERVACAO             VARCHAR(255),                     ' +
            ' NFE_FORMULARIO_INI         INTEGER,                          ' +
            ' NFE_FORMULARIO_FIM         INTEGER,                          ' +
            ' NFE_DATA_EMISSAO           DATETIME,                         ' +
            ' NFE_CANCELADO              VARCHAR(1),                       ' +
            ' NFE_DATA_ENTRADA_SAIDA     DATETIME,                         ' +
            ' NFE_CHAVE_NFE              VARCHAR(50),                      ' +
            ' NFE_PROTOCOLO_NFE          VARCHAR(50),                      ' +
            ' NFE_XML                    TEXT,                             ' +

            ' NFE_EMIT_CNC_CODIGO        INTEGER,                          ' +
            ' NFE_EMIT_FOR_CODIGO        INTEGER,                          ' +
            ' NFE_EMIT_RAZAO_SOCIAL      VARCHAR(100),                     ' +
            ' NFE_EMIT_CNPJ              VARCHAR(20),                      ' +
            ' NFE_EMIT_IE                VARCHAR(20),                      ' +
            ' NFE_EMIT_IM                VARCHAR(20),                      ' +
            ' NFE_EMIT_COD_MUN_IBGE      INTEGER,                          ' +
            ' NFE_EMIT_CIDADE            VARCHAR(20),                      ' +
            ' NFE_EMIT_UF                VARCHAR(2),                       ' +
            ' NFE_EMIT_CEP               INTEGER,                          ' +
            ' NFE_EMIT_LOGRADOURO        VARCHAR(60),                      ' +
            ' NFE_EMIT_NUMERO            VARCHAR(10),                      ' +
            ' NFE_EMIT_COMPLEMENTO       VARCHAR(60),                      ' +
            ' NFE_EMIT_BAIRRO            VARCHAR(60),                      ' +
            ' NFE_EMIT_TELEFONE          VARCHAR(20),                      ' +
            ' NFE_EMIT_FAX               VARCHAR(20),                      ' +
            ' NFE_EMIT_EMAIL             VARCHAR(50),                      ' +

            ' NFE_DEST_CLI_CODIGO        INTEGER,                          ' +
            ' NFE_DEST_CNC_CODIGO        INTEGER,                          ' +
            ' NFE_DEST_RAZAO_SOCIAL      VARCHAR(100),                     ' +
            ' NFE_DEST_CNPJ              VARCHAR(20),                      ' +
            ' NFE_DEST_CPF               VARCHAR(20),                      ' +
            ' NFE_DEST_RG                VARCHAR(20),                      ' +
            ' NFE_DEST_IE                VARCHAR(20),                      ' +
            ' NFE_DEST_IM                VARCHAR(20),                      ' +
            ' NFE_DEST_COD_MUN_IBGE      INTEGER,                          ' +
            ' NFE_DEST_CIDADE            VARCHAR(20),                      ' +
            ' NFE_DEST_UF                VARCHAR(2),                       ' +
            ' NFE_DEST_CEP               INTEGER,                          ' +
            ' NFE_DEST_LOGRADOURO        VARCHAR(60),                      ' +
            ' NFE_DEST_NUMERO            VARCHAR(10),                      ' +
            ' NFE_DEST_COMPLEMENTO       VARCHAR(60),                      ' +
            ' NFE_DEST_BAIRRO            VARCHAR(60),                      ' +
            ' NFE_DEST_TELEFONE          VARCHAR(20),                      ' +
            ' NFE_DEST_FAX               VARCHAR(20),                      ' +
            ' NFE_DEST_EMAIL             VARCHAR(50),                      ' +

            ' NFE_TRAN_TRN_CODIGO        INTEGER,                          ' +
            ' NFE_TRAN_RAZAO_SOCIAL      VARCHAR(100),                     ' +
            ' NFE_TRAN_CNPJ              VARCHAR(20),                      ' +
            ' NFE_TRAN_CPF               VARCHAR(20),                      ' +
            ' NFE_TRAN_RG                VARCHAR(20),                      ' +
            ' NFE_TRAN_IE                VARCHAR(20),                      ' +
            ' NFE_TRAN_IM                VARCHAR(20),                      ' +
            ' NFE_TRAN_COD_MUN_IBGE      INTEGER,                          ' +
            ' NFE_TRAN_CIDADE            VARCHAR(20),                      ' +
            ' NFE_TRAN_UF                VARCHAR(2),                       ' +
            ' NFE_TRAN_CEP               INTEGER,                          ' +
            ' NFE_TRAN_LOGRADOURO        VARCHAR(60),                      ' +
            ' NFE_TRAN_NUMERO            VARCHAR(10),                      ' +
            ' NFE_TRAN_COMPLEMENTO       VARCHAR(60),                      ' +
            ' NFE_TRAN_BAIRRO            VARCHAR(60),                      ' +
            ' NFE_TRAN_TELEFONE          VARCHAR(20),                      ' +
            ' NFE_TRAN_FAX               VARCHAR(20),                      ' +
            ' NFE_TRAN_EMAIL             VARCHAR(50),                      ' +
            ' NFE_TRAN_PLACA_VEICULO     VARCHAR(7),                       ' +
            ' NFE_TRAN_PLACA_VEICULO_UF  VARCHAR(2),                       ' +

            ' NFE_VOLUME_ESPECIE         VARCHAR(25),                      ' +
            ' NFE_VOLUME_MARCA           VARCHAR(25),                      ' +
            ' NFE_VOLUME_NUMERACAO       VARCHAR(25),                      ' +
            ' NFE_VOLUME_PESO_BRUTO      DECIMAL(14, 3),                   ' +
            ' NFE_VOLUME_PESO_LIQUIDO    DECIMAL(14, 3),                   ' +

            ' NFE_INDICADOR_PAGTO        CHAR,                             ' +
            ' NFE_VALOR_DOCUMENTO        DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_DESCONTO         DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_ABATIMENTO       DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_PRODUTO          DECIMAL(14, 2),                   ' +
            ' NFE_TIPO_FRETE             CHAR,                             ' +
            ' NFE_VALOR_FRETE            DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_SEGURO           DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_OUTRAS           DECIMAL(14, 2),                   ' +
            ' NFE_BASE_IPI               DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_IPI              DECIMAL(14, 2),                   ' +
            ' NFE_BASE_ICMS              DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_ICMS             DECIMAL(14, 2),                   ' +
            ' NFE_BASE_ICMS_SUBST        DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_ICMS_SUBST       DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_PIS              DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_PIS_SUBST        DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_COFINS           DECIMAL(14, 2),                   ' +
            ' NFE_VALOR_COFINS_SUBST     DECIMAL(14, 2))                   ' ;

  sTbItemNFe := ' CREATE TABLE dbo.ITEM_DE_NFE (                           ' +
                ' INE_CODIGO             INTEGER NOT NULL, ' +
                ' NFE_CODIGO             INTEGER,                          ' +
                ' INE_SEQ_ITEM           INTEGER,                          ' +
                ' INE_PRD_CODIGO         INTEGER,                          ' +
                ' INE_CFOP               INTEGER,                          ' +
                ' INE_DESCRICAO          VARCHAR(60),                      ' +
                ' INE_UNIDADE_MEDIDA     VARCHAR(6),                       ' +
                ' INE_QUANTIDADE         DECIMAL(14, 2),                   ' +
                ' INE_VALOR_UNITARIO     DECIMAL(14, 2),                   ' +
                ' INE_VALOR_DESCONTO     DECIMAL(14, 2),                   ' +
                ' INE_VALOR_TOTAL        DECIMAL(14, 2),                   ' +
                ' INE_INFO_ADICIONAL     VARCHAR(255),                     ' +
                ' INE_IPI_CST            VARCHAR(2),                       ' +
                ' INE_IPI_VALOR_UNITARIO DECIMAL(14, 2),                   ' +
                ' INE_IPI_BASE           DECIMAL(14, 2),                   ' +
                ' INE_IPI_ALIQ           DECIMAL(14, 2),                   ' +
                ' INE_IPI_VALOR          DECIMAL(14, 2),                   ' +
                ' INE_ICMS_CST           VARCHAR(3),                       ' +
                ' INE_ICMS_BASE          DECIMAL(14, 2),                   ' +
                ' INE_ICMS_ALIQ          DECIMAL(14, 2),                   ' +
                ' INE_ICMS_VALOR         DECIMAL(14, 2),                   ' +
                ' INE_ICMS_BASE_SUBST    DECIMAL(14, 2),                   ' +
                ' INE_ICMS_ALIQ_SUBST    DECIMAL(14, 2),                   ' +
                ' INE_ICMS_VALOR_SUBST   DECIMAL(14, 2),                   ' +
                ' INE_PIS_CST            VARCHAR(2),                       ' +
                ' INE_PIS_BASE           DECIMAL(14, 2),                   ' +
                ' INE_PIS_VALOR          DECIMAL(14, 2),                   ' +
                ' INE_COFINS_CST         VARCHAR(2),                       ' +
                ' INE_COFINS_BASE        DECIMAL(14, 2),                   ' +
                ' INE_COFINS_VALOR       DECIMAL(14, 2))                   ' ;
end;
}

end.



