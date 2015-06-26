////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: PSACI                                                //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: PSACI                                                //
// UNIT................: Unit de comunicação                                  //
// ANALISTA............: Anderson Gonçalves                                   //
// DESENVOLVEDOR.......: Anderson Gonçalves                                   //
// DATA DE INÍCIO......: 20/04/2012                                           //
// DATA DE FIM.........: 15/04/2013                                           //
//============================================================================//
// COMENTÁRIOS..: CPD01ELJ_21042012233515.RAR (CPD envia p/ LJ - DATA_HORA)   //
//              : LJ02ECPD_21042012233515.RAR (LJ 02 envia p/ CPD - DATA_HORA)//
//              :                                                             //
//              : ENTENDENDO O PROCESSO DO PRÉ-RECEBIMENTO:                   //
//              :    CPD gera uma transferência, no envio o sistema executa   //
//              :    o PGeraPre.exe e alimenta as tabelas de pre-recebimento  //
//              :                                                             //
//              :-------------------------------------------------------------//
//              :  ATENÇÃO PARA OS DADOS E SENHAS DO FTP                      //
//              :-------------------------------------------------------------//
//              :                                                             //
//              :     *Principal                                              //
//              :     Host/URL: buildsistema.com.br                           //
//              :     Login: buildsis                                         //
//              :     Senha: @gfm1901                                         //
//              :                                                             //
//              :     *siac                                                   //
//              :     Host/URL: siac.buildsistema.com.br                      //
//              :     Login: buildsis                                         //
//              :     Senha: @gfm1901                                         //
//              :                                                             //
//============================================================================//
////////////////////////////////////////////////////////////////////////////////

{
UPDATE CONFIGURACAO SET
CNF_FTP_URL = 'buildsistema.com.br',
CNF_FTP_USUARIO = 'buildsis',
CNF_FTP_SENHA = '@gfm1901'

------------------------------------
******TABELAS QUE O CPD RECEBE******
------------------------------------
  ITEM_DE_ESTOQUE
  ITEM_DE_PEDIDO_DE_VENDA
  MOVIMENTO_DE_CAIXA
  MOVIMENTO_DE_ESTOQUE_COMERCIAL
  MOVIMENTO_DE_ESTOQUE_FISICO
  PEDIDO_DE_VENDA
  DETALHE_DE_PEDIDO_DE_VENDA
  TITULO_A_RECEBER
  CLIENTE
  USUARIO_SENHA
  CHEQUE
  MOVIMENTO_DE_CREDITO
  INVENTARIO
  ITEM_DE_INVENTARIO
  MOVIMENTO_DE_ESTOQUE_FISCAL
  BOLETIM_DIARIO

-------------------------------------
******TABELAS QUE A LOJA RECEBE******
-------------------------------------
  PRODUTO
  FUNCIONARIO
  USUARIO
  PEDIDO_AUXILIAR (Somente o laboratório deve receber essa tabela)
  GRUPO
  SUBGRUPO
  CLIENTE
  FORNECEDOR
  AGENTE_FINANCEIRO
  FATOR_DE_FINANCEIRA
  FORMA_DE_PAGAMENTO
  CONTA_DE_CAIXA
  PARAMETRO
  PERMISSAO
  PRE_RECEBIMENTO
  ITEM_DE_PRE_RECEBIMENTO
  MENSAGEM
  CENTRO_DE_CUSTO
  CONFIGURACAO
  TABELA_DE_PRECO_SUBGRUPO
  ITEM_DE_TABELA_DE_PRECO_SUBGRUPO
  TABELA_DE_PRECO
  ITEM_DE_TABELA_DE_PRECO
}


{Não grava
grTab_MSG - MENSAGEM
grTab_TPG - TITULO_A_PAGAR}

unit UComunicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Db, DBTables, ComCtrls, StdCtrls, funcoes, ZipForge,
  ADODB, Gauges, StrUtils;

type
  TComunicacao = class(TPersistent)
  private
    FArquivo          : TStringList;
    FDataReferencia   : TDateTime;
    FCabecalho        : string;
    FPastaLOG         : string;
    FPastaComunicacao : string;
  public
    constructor Create;
    procedure SetLog(sTipo: string; sLegenda: TStatusBar; sListLog: TStringList; sMsg: string);
    property Arquivo          : TStringList read FArquivo          write FArquivo;
    property DataReferencia   : TDateTime   read FDataReferencia   write FDataReferencia;
    property Cabecalho        : string      read FCabecalho        write FCabecalho;
    property PastaComunicacao : string      read FPastaComunicacao write FPastaComunicacao;
    property PastaLOG         : string      read FPastaLOG         write FPastaLOG;
  end;

  TEnviaComunicacao = class(TComunicacao)
  private
    {CDP para LOJA/LABORATORIO}
    procedure grArq_PRD(QSelect: TADOQuery; pBar: TGauge);                             //PRODUTO
    procedure grArq_FUN(QSelect: TADOQuery; pBar: TGauge);                             //FUNCIONARIO
    procedure grArq_USU(QSelect: TADOQuery; pBar: TGauge);                             //USUARIO
    procedure grArq_PDA(QSelect: TADOQuery; pBar: TGauge);                             //PEDIDO_AUXILIAR
    procedure grArq_GRP(QSelect: TADOQuery; pBar: TGauge);                             //GRUPO
    procedure grArq_SGP(QSelect: TADOQuery; pBar: TGauge);                             //SUBGRUPO
    procedure grArq_FOR(QSelect: TADOQuery; pBar: TGauge);                             //FORNECEDOR
    procedure grArq_AGF(QSelect: TADOQuery; pBar: TGauge);                             //AGENTE_FINANCEIRO
    procedure grArq_FAF(QSelect: TADOQuery; pBar: TGauge);                             //FATOR_DE_FINANCEIRA
    procedure grArq_FPG(QSelect: TADOQuery; pBar: TGauge);                             //FORMA_DE_PAGAMENTO
    procedure grArq_CCX(QSelect: TADOQuery; pBar: TGauge);                             //CONTA_DE_CAIXA
    procedure grArq_TPR(QSelect: TADOQuery; pBar: TGauge);                             //TIPO_DE_PARAMETRO
    procedure grArq_PAR(QSelect: TADOQuery; pBar: TGauge);                             //PARAMETRO
    procedure grArq_PRM(QSelect: TADOQuery; pBar: TGauge);                             //PERMISSAO
    procedure grArq_MSG(QSelect: TADOQuery; pBar: TGauge);                             //MENSAGEM
    procedure grArq_CNC(QSelect: TADOQuery; pBar: TGauge);                             //CENTRO_DE_CUSTO
    procedure grArq_CNF(QSelect: TADOQuery; pBar: TGauge);                             //CONFIGURACAO
    procedure grArq_CDB(QSelect: TADOQuery; pBar: TGauge);                             //CODIGO_DE_BARRAS
    procedure grArq_TPS(QSelect, QSelectItem: TADOQuery; pBar: TGauge);                //TABELA_DE_PRECO_SUBGRUPO, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO
    procedure grArq_PRC(QSelect, QSelectItem: TADOQuery; pBar: TGauge);                //PRE_RECEBIMENTO, ITEM_DE_PRE_RECEBIMENTO
    procedure grArq_LOT(QSelect: TADOQuery; pBar: TGauge);                             //LOTE
    {LOJA para CPD}
    procedure grArq_IES(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //ITEM_DE_ESTOQUE
    procedure grArq_BLD(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //BOLETIM_DIARIO
    procedure grArq_MVC(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //MOVIMENTO_DE_CAIXA
    procedure grArq_MCR(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //MOVIMENTO_DE_CREDITO
    procedure grArq_MEC(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //MOVIMENTO_DE_ESTOQUE_COMERCIAL
    procedure grArq_MEF(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //MOVIMENTO_DE_ESTOQUE_FISICO
    procedure grArq_MES(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //MOVIMENTO_DE_ESTOQUE_FISCAL
    procedure grArq_DPV(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //DETALHE_DE_PEDIDO_DE_VENDA
    procedure grArq_SNH(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //USUARIO_SENHA
    procedure grArq_TRC(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //TITULO_A_RECEBER
    procedure grArq_TPG(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //TITULO_A_PAGAR
    procedure grArq_CLI(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //CLIENTE
    procedure grArq_CHQ(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);              //CHEQUE
    procedure grArq_CSG(QSelect, QSelectItem: TADOQuery; pBar: TGauge; iCNC: Integer); //CONSIGNACAO, ITEM_DE_CONSIGNACAO
    procedure grArq_INV(QSelect, QSelectItem: TADOQuery; pBar: TGauge; iCNC: Integer); //INVENTARIO, ITEM_DE_INVENTARIO
    procedure grArq_PDV(QSelect, QSelectItem: TADOQuery; pBar: TGauge; iCNC: Integer); //PEDIDO_DE_VENDA, ITEM_DE_PEDIDO_DE_VENDA
    procedure grArq_NTF(QSelect, QSelectItem: TADOQuery; pBar: TGauge; iCNC: Integer); //NOTA_FISCAL, ITEM_DE_NOTA_FISCAL
    function Compacta(sNomeArquivo: string): boolean;
  public
    function Exporta_Arquivo_CPD_para_LOJA(QSelect, QSelectItem: TADOQuery; pBarRegistro: TGauge; lbTabela: TListBox; sPrefixo: string; sLegenda: TStatusBar; out sListLog: TStringList; var sArquivoZIP, sPathArquivoZIP: string; iDias: integer = 0): boolean;
    function Exporta_Arquivo_LOJA_para_CPD(QSelect, QSelectItem: TADOQuery; pBarRegistro: TGauge; lbTabela: TListBox; sPrefixo: string; sLegenda: TStatusBar; out sListLog: TStringList; var sArquivoZIP, sPathArquivoZIP: string; LJ: integer; iDias: integer = 0): boolean;
  end;

  TRecebeComunicacao = class(TComunicacao)
  private
    FPastaRecebe      : string;
    bExcluirPermissao, bExcluirCodBarras : boolean;
    {CDP para LOJA/LABORATORIO}
    procedure grTab_PRD(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //PRODUTO
    procedure grTab_FUN(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //FUNCIONARIO
    procedure grTab_USU(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //USUARIO
    procedure grTab_PDA(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //PEDIDO_AUXILIAR
    procedure grTab_GRP(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //GRUPO
    procedure grTab_SGP(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //SUBGRUPO
    procedure grTab_FOR(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //FORNECEDOR
    procedure grTab_AGF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //AGENTE_FINANCEIRO
    procedure grTab_FAF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //FATOR_DE_FINANCEIRA
    procedure grTab_FPG(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //FORMA_DE_PAGAMENTO
    procedure grTab_CCX(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //CONTA_DE_CAIXA
    procedure grTab_TPR(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //TIPO_DE_PARAMETRO
    procedure grTab_PAR(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //PARAMETRO
    procedure grTab_PRM(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //PERMISSAO
    procedure grTab_MSG(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //MENSAGEM
    procedure grTab_CNC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //CENTRO_DE_CUSTO
    procedure grTab_CNF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //CONFIGURACAO
    procedure grTab_CDB(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //CODIGO_DE_BARRAS
    procedure grTab_TPS(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //TABELA_DE_PRECO_SUBGRUPO, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO
    procedure grTab_PRC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //PRE_RECEBIMENTO, ITEM_DE_PRE_RECEBIMENTO
    procedure grTab_LOT(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //LOTE
    {LOJA para CPD}
    procedure grTab_IES(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //ITEM_DE_ESTOQUE
    procedure grTab_BLD(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //BOLETIM_DIARIO
    procedure grTab_MVC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //MOVIMENTO_DE_CAIXA
    procedure grTab_MCR(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //MOVIMENTO_DE_CREDITO
    procedure grTab_MEC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //MOVIMENTO_DE_ESTOQUE_COMERCIAL
    procedure grTab_MEF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //MOVIMENTO_DE_ESTOQUE_FISICO
    procedure grTab_MES(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //MOVIMENTO_DE_ESTOQUE_FISCAL
    procedure grTab_DPV(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //DETALHE_DE_PEDIDO_DE_VENDA
    procedure grTab_SNH(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //USUARIO_SENHA
    procedure grTab_TRC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //TITULO_A_RECEBER
    procedure grTab_TPG(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //TITULO_A_PAGAR
    procedure grTab_CLI(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //CLIENTE
    procedure grTab_CHQ(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //CHEQUE
    procedure grTab_CSG(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //CONSIGNACAO, ITEM_DE_CONSIGNACAO
    procedure grTab_INV(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //INVENTARIO, ITEM_DE_INVENTARIO
    procedure grTab_PDV(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //PEDIDO_DE_VENDA, ITEM_DE_PEDIDO_DE_VENDA
    procedure grTab_NTF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);  //NOTA_FISCAL, ITEM_DE_NOTA_FISCAL
    procedure RetornaCAB(sLinha: string);
    procedure Descompacta(sNomeArquivo: string);
    function CopyCampo(sLinha: string; var iPosicao: integer; iQtde: integer): string;
  public
    constructor Create;
    function Importa_Arquivo_CPD_para_LOJA(sArquivoZIP: string; pBar: TGauge; sLegenda: TStatusBar; var sListLog: TStringList; QSelect, QExec: TADOQuery; lbTabela: TListBox; var LogSQL: string): boolean;
    function Importa_Arquivo_LOJA_para_CPD(sArquivoZIP: string; pBar: TGauge; sLegenda: TStatusBar; var sListLog: TStringList; QSelect, QExec: TADOQuery; lbTabela: TListBox; var LogSQL: string): boolean;
    property PastaRecebe: string read FPastaRecebe write FPastaRecebe;
  end;

const
  versao        = '01';
  extensao      = 'TXT';
  delimitador   = '|';
  PATH          = 'Comunicação\';
  PATH_LOG      = PATH + 'LOG\';
  PATH_ENVIA    = PATH + 'Envia\';
  PATH_RECEBE   = PATH + 'Recebe\';
  PasswordZIP   = 's2f1303';
  CHAR_1        = 1;
  CHAR_2        = 2;
  CHAR_10       = 10;
  CHAR_20       = 20;
  CHAR_30       = 30;
  CHAR_40       = 40;
  CHAR_50       = 50;
  CHAR_60       = 60;
  CHAR_70       = 70;
  CHAR_80       = 80;
  CHAR_90       = 90;
  CHAR_100      = 100;
  CHAR_150      = 150;
  TAM_INT_1     = 1;
  TAM_INT_2     = 2;
  TAM_INT_3     = 3;
  TAM_INT_4     = 4;
  TAM_INT       = 8;
  TAM_FLOAT_5   = 5;
  TAM_FLOAT_6   = 6;
  TAM_FLOAT     = 12;
  TAM_DATA      = 10; //dd/mm/yyyy
  TAM_DATA_HORA = 19; //dd/mm/yyyy hh:nn:ss

implementation

uses UConfComunicacao;

{ TEnviaComunicacao }

function TEnviaComunicacao.Exporta_Arquivo_CPD_para_LOJA(QSelect, QSelectItem: TADOQuery; pBarRegistro: TGauge;
  lbTabela: TListBox; sPrefixo: string; sLegenda: TStatusBar; out sListLog: TStringList; var sArquivoZIP,
  sPathArquivoZIP: string; iDias: integer): boolean;
var
  sFileName: string;

  procedure subGeraArquivos;
  begin
    lbTabela.ItemIndex := 0;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_CNC(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 1;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_CNF(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 2;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_TPR(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 3;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_PAR(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 4;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_FOR(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 5;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_GRP(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 6;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_SGP(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 7;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_PRD(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 8;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_FUN(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 9;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_USU(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 10;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_PRM(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 11;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_PDA(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 12;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_AGF(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 13;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_FAF(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 14;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_FPG(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 15;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_CCX(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 16;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_PRC(QSelect, QSelectItem, pBarRegistro);

    lbTabela.ItemIndex := 17;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_MSG(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 18;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_TPS(QSelect, QSelectItem, pBarRegistro);

    lbTabela.ItemIndex := 19;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_CDB(QSelect, pBarRegistro);

    lbTabela.ItemIndex := 20;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_LOT(QSelect, pBarRegistro);

  end;

begin
  ExcluiArquivos(PATH_ENVIA,'*');

  if iDias > 0 then
    DataReferencia := now - (iDias + 1);

  FCabecalho :=
    'CAB'                                           + delimitador +
    versao                                          + delimitador +
    Copy(sPrefixo,0,2) + 'CPD01ELJ'                 + delimitador +
    FormatDateTime('ddmmyyyhhnnss',now)             + delimitador +
    PreencheEsq(8,IntToStr(iDias))                  + delimitador +
    FormatDateTime('ddmmyyyhhnnss',FDataReferencia) + delimitador ;

  lbTabela.Items.Clear;
  lbTabela.Items.Add('CENTRO_DE_CUSTO');
  lbTabela.Items.Add('CONFIGURACAO');
  lbTabela.Items.Add('TIPO_DE_PARAMETRO');
  lbTabela.Items.Add('PARAMETRO');
  lbTabela.Items.Add('FORNECEDOR');
  lbTabela.Items.Add('GRUPO');
  lbTabela.Items.Add('SUBGRUPO');
  lbTabela.Items.Add('PRODUTO');
  lbTabela.Items.Add('FUNCIONARIO');
  lbTabela.Items.Add('USUARIO');
  lbTabela.Items.Add('PERMISSAO');
  lbTabela.Items.Add('PEDIDO_AUXILIAR');
  lbTabela.Items.Add('AGENTE_FINANCEIRO');
  lbTabela.Items.Add('FATOR_DE_FINANCEIRA');
  lbTabela.Items.Add('FORMA_DE_PAGAMENTO');
  lbTabela.Items.Add('CONTA_DE_CAIXA');
  lbTabela.Items.Add('PRE_RECEBIMENTO');
  lbTabela.Items.Add('MENSAGEM');
  lbTabela.Items.Add('TABELA_DE_PRECO_SUBGRUPO');
  lbTabela.Items.Add('CODIGO_DE_BARRAS');
  lbTabela.Items.Add('LOTE');
  lbTabela.Refresh;

  subGeraArquivos;

  sFileName := Copy(sPrefixo,0,2) + 'CPD01ELJ_' + FormatDateTime('ddmmyyyyhhnnss',now);

  SetLog('Env', sLegenda, sListLog, 'Compactando arquivo...');
  result := Compacta(sFileName);

  SetLog('Env', sLegenda, sListLog, 'Excluindo arquivos temporários...');
  if not result then
    DeleteFile(PChar(PATH_ENVIA + sFileName  + '.ZIP'));
  ExcluiArquivos(PATH_ENVIA,extensao);

  if FileExists(PChar(PATH_ENVIA + sFileName  + '.ZIP')) then
    SetLog('Env', sLegenda, sListLog, 'Arquivo gerado com sucesso!');

  if result then
  begin
    sArquivoZIP     := sFileName  + '.ZIP';
    sPathArquivoZIP := PATH_ENVIA;
  end
  else
  begin
    sArquivoZIP     := '';
    sPathArquivoZIP := '';
  end;
end;

function TEnviaComunicacao.Exporta_Arquivo_LOJA_para_CPD(QSelect, QSelectItem: TADOQuery; pBarRegistro: TGauge;
  lbTabela: TListBox; sPrefixo: string; sLegenda: TStatusBar; out sListLog: TStringList; var sArquivoZIP, sPathArquivoZIP: string;
  LJ, iDias: integer):boolean;
var
  sFileName: string;

  procedure subGeraArquivos;
  begin
    lbTabela.ItemIndex := 0;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_CLI(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 1;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_PDV(QSelect, QSelectItem, pBarRegistro, LJ);

    lbTabela.ItemIndex := 2;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_DPV(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 3;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_NTF(QSelect, QSelectItem, pBarRegistro, LJ);

    lbTabela.ItemIndex := 4;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_IES(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 5;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_MES(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 6;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_MEF(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 7;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_MEC(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 8;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_MVC(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 9;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_MCR(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 10;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_TRC(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 11;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_TPG(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 12;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_SNH(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 13;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_CHQ(QSelect, pBarRegistro, LJ);

    lbTabela.ItemIndex := 14;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_CSG(QSelect, QSelectItem, pBarRegistro, LJ);

    lbTabela.ItemIndex := 15;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_INV(QSelect, QSelectItem, pBarRegistro, LJ);

    lbTabela.ItemIndex := 16;
    SetLog('Env', sLegenda, sListLog, 'Exportando tabela ' + lbTabela.Items.Strings[lbTabela.ItemIndex] + '...');
    grArq_BLD(QSelect, pBarRegistro, LJ);
  end;

begin
  ExcluiArquivos(PATH_ENVIA,'*');

  if iDias > 0 then
    FDataReferencia := now - (iDias + 1);

  FCabecalho :=
    'CAB'                                                                           + delimitador +
    versao                                                                          + delimitador +
    Copy(sPrefixo,0,2) + 'LJ' + FormatFloat('00',StrToFloat(IntToStr(LJ))) + 'ECPD' + delimitador +
    FormatDateTime('ddmmyyyhhnnss',now)                                             + delimitador +
    PreencheEsq(8,IntToStr(iDias))                                                  + delimitador +
    FormatDateTime('ddmmyyyhhnnss',FDataReferencia)                                 + delimitador ;

  lbTabela.Items.Clear;
  lbTabela.Items.Add('CLIENTE');

  if sPrefixo = 'LO' then //Luciano Ótica
  begin
    (*Não envia a tabela PEDIDO_DE_VENDA se for laboratório, cnc 3 = laboratório*)
    if LJ <> 3 then
      lbTabela.Items.Add('PEDIDO_DE_VENDA');
  end
  else
    lbTabela.Items.Add('PEDIDO_DE_VENDA');

  lbTabela.Items.Add('DETALHE_DE_PEDIDO_DE_VENDA');
  lbTabela.Items.Add('NOTA_FISCAL');
  lbTabela.Items.Add('ITEM_DE_ESTOQUE');
  lbTabela.Items.Add('MOVIMENTO_DE_ESTOQUE_FISCAL');
  lbTabela.Items.Add('MOVIMENTO_DE_ESTOQUE_FISICO');
  lbTabela.Items.Add('MOVIMENTO_DE_ESTOQUE_COMERCIAL');
  lbTabela.Items.Add('MOVIMENTO_DE_CAIXA');
  lbTabela.Items.Add('MOVIMENTO_DE_CREDITO');
  lbTabela.Items.Add('TITULO_A_RECEBER');
  lbTabela.Items.Add('TITULO_A_PAGAR');
  lbTabela.Items.Add('USUARIO_SENHA');
  lbTabela.Items.Add('CHEQUE');
  lbTabela.Items.Add('CONSIGNACAO');
  lbTabela.Items.Add('INVENTARIO');
  lbTabela.Items.Add('BOLETIM_DIARIO');
  lbTabela.Refresh;

  subGeraArquivos;

  sFileName := Copy(sPrefixo,0,2) + 'LJ' + FormatFloat('00',StrToFloat(IntToStr(LJ))) + 'ECPD_' + FormatDateTime('ddmmyyyyhhnnss',now);

  SetLog('Env', sLegenda, sListLog, 'Compactando arquivo...');
  result := Compacta(sFileName);

  SetLog('Env', sLegenda, sListLog, 'Excluindo arquivos temporários...');
  if not result then
    DeleteFile(PChar(PATH_ENVIA + sFileName  + '.ZIP'));
  ExcluiArquivos(PATH_ENVIA,extensao);

  if FileExists(PChar(PATH_ENVIA + sFileName  + '.ZIP')) then
    SetLog('Env', sLegenda, sListLog, 'Arquivo gerado com sucesso!');

  if result then
  begin
    sArquivoZIP     := sFileName  + '.ZIP';
    sPathArquivoZIP := PATH_ENVIA;
  end
  else
  begin
    sArquivoZIP     := '';
    sPathArquivoZIP := '';
  end;
end;

procedure TEnviaComunicacao.grArq_PRD(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (PRD_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR PRD_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PRODUTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  PRD_CODIGO,');
    QSelect.SQL.Add('  FOR_CODIGO,');
    QSelect.SQL.Add('  CTP_CODIGO,');
    QSelect.SQL.Add('  GRP_CODIGO,');
    QSelect.SQL.Add('  SGP_CODIGO,');
    QSelect.SQL.Add('  CLF_CODIGO,');
    QSelect.SQL.Add('  ORF_CODIGO,');
    QSelect.SQL.Add('  PRD_DESCRICAO,');
    QSelect.SQL.Add('  PRD_UNIDADE,');
    QSelect.SQL.Add('  PRD_MARCA,');
    QSelect.SQL.Add('  PRD_PRECO_COMPRA,');
    QSelect.SQL.Add('  PRD_REFERENCIA,');
    QSelect.SQL.Add('  PRD_DT_ULT_COMPRA,');
    QSelect.SQL.Add('  PRD_CUSTO,');
    QSelect.SQL.Add('  PRD_PRECO_MEDIO,');
    QSelect.SQL.Add('  PRD_PRECO_VENDA,');
    QSelect.SQL.Add('  PRD_EST_MINIMO,');
    QSelect.SQL.Add('  PRD_EST_MEDIO,');
    QSelect.SQL.Add('  PRD_COMISSAO,');
    QSelect.SQL.Add('  PRD_SITUACAO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  PRD_DT_ALTERADO,');
    QSelect.SQL.Add('  PRD_LOCAL,');
    QSelect.SQL.Add('  PRD_DETALHE,');
    QSelect.SQL.Add('  PRD_DT_CADASTRO,');
    QSelect.SQL.Add('  PRD_PESO_LIQUIDO,');
    QSelect.SQL.Add('  PRD_CARACTERISTICA,');
    QSelect.SQL.Add('  PRD_OBSERVACAO,');
    QSelect.SQL.Add('  PRD_FORA_TABELA,');
    QSelect.SQL.Add('  PRD_FORA_PREVISAO,');
    QSelect.SQL.Add('  PRD_INSUMO,');
    QSelect.SQL.Add('  PRD_BASE_REAL,');
    QSelect.SQL.Add('  PRD_SERVICO,');
    QSelect.SQL.Add('  PRD_TEMPO_MEDIO,');
    QSelect.SQL.Add('  PRD_NIVEL,');
    QSelect.SQL.Add('  PRD_FORA_DE_LINHA,');
    QSelect.SQL.Add('  PRD_CATALOGO,');
    QSelect.SQL.Add('  PRD_PREVISAO,');
    QSelect.SQL.Add('  PRD_CLASSIFICACAO,');
    QSelect.SQL.Add('  PRD_ESTOQUE_DETALHADO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PRODUTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'PRD'                                                                                                        + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FOR_CODIGO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CTP_CODIGO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('GRP_CODIGO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('SGP_CODIGO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLF_CODIGO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('ORF_CODIGO').AsString)                                                      + delimitador +
        PreencheDir(CHAR_60,Trim(RetiraAspas(FieldByName('PRD_DESCRICAO').AsString)))                                + delimitador +
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('PRD_UNIDADE').AsString)))                                  + delimitador +(*TAM = 20*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('PRD_MARCA').AsString)))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PRD_PRECO_COMPRA').AsString))                                   + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('PRD_REFERENCIA').AsString)))                               + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PRD_DT_ULT_COMPRA').AsDateTime)) + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PRD_CUSTO').AsString))                                          + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PRD_PRECO_MEDIO').AsString))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PRD_PRECO_VENDA').AsString))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PRD_EST_MINIMO').AsString))                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PRD_EST_MEDIO').AsString))                                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PRD_COMISSAO').AsString))                                       + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('PRD_SITUACAO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PRD_DT_ALTERADO').AsDateTime))   + delimitador +
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('PRD_LOCAL').AsString)))                                    + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('PRD_DETALHE').AsString)))                                 + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PRD_DT_CADASTRO').AsDateTime))   + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PRD_PESO_LIQUIDO').AsString))                                   + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('PRD_CARACTERISTICA').AsString)))                          + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('PRD_OBSERVACAO').AsString)))                              + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT_3,FieldByName('PRD_FORA_TABELA').AsString)                                               + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_FORA_PREVISAO').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_INSUMO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PRD_BASE_REAL').AsString))                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_SERVICO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_TEMPO_MEDIO').AsString)                                               + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_NIVEL').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_FORA_DE_LINHA').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_CATALOGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_PREVISAO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_CLASSIFICACAO').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRD_ESTOQUE_DETALHADO').AsString)                                         + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'PRODUTO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_PDV(QSelect, QSelectItem: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (PDV_DATA_HORA >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR PDV_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PEDIDO_DE_VENDA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  PDV_CODIGO,');
    QSelect.SQL.Add('  CLI_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  PDV_DATA_HORA,');
    QSelect.SQL.Add('  PDV_TOTAL,');
    QSelect.SQL.Add('  PDV_LISTADO,');
    QSelect.SQL.Add('  PDV_SITUACAO,');
    QSelect.SQL.Add('  PDV_OBS,');
    QSelect.SQL.Add('  PDV_DIAS_RESERV,');
    QSelect.SQL.Add('  PDV_NOTA_FISCAL,');
    QSelect.SQL.Add('  AGF_CODIGO,');
    QSelect.SQL.Add('  FPG_CODIGO,');
    QSelect.SQL.Add('  PDV_TIPO_PAG,');
    QSelect.SQL.Add('  PDV_ENTRADA,');
    QSelect.SQL.Add('  CNC_CLIENTE,');
    QSelect.SQL.Add('  PDV_EM_USO,');
    QSelect.SQL.Add('  PDV_ACRESCIMO,');
    QSelect.SQL.Add('  PDV_DT_ALTERADO,');
    QSelect.SQL.Add('  PDV_MAQUINA,');
    QSelect.SQL.Add('  PDV_MELHOR_DATA,');
    QSelect.SQL.Add('  PDV_VENCIMENTOS,');
    QSelect.SQL.Add('  PDV_MEDIA_PAGAMENTO,');
    QSelect.SQL.Add('  PDV_NOTA_CUPOM,');
    QSelect.SQL.Add('  PDV_IMPRESSO,');
    QSelect.SQL.Add('  PDV_DT_EMISSAO_VENDA,');
    QSelect.SQL.Add('  PDV_DT_DEVOLUCAO,');
    QSelect.SQL.Add('  PDV_CONTATO,');
    QSelect.SQL.Add('  PDV_CREDITO,');
    QSelect.SQL.Add('  FUN_ARQUITETO,');
    QSelect.SQL.Add('  PDV_TITULO_GERADO,');
    QSelect.SQL.Add('  PDV_TIPO_VENDA,');
    QSelect.SQL.Add('  PDV_PACOTE,');
    QSelect.SQL.Add('  PDV_GRUPO_ESPECIAL,');
    QSelect.SQL.Add('  PDV_DT_PREVISAO,');
    QSelect.SQL.Add('  PDV_DT_ENTREGA,');
    QSelect.SQL.Add('  PDV_DOCUMENTO,');
    QSelect.SQL.Add('  PDV_CAIXA,');
    QSelect.SQL.Add('  PDV_SERVICO,');
    QSelect.SQL.Add('  PDV_FONE_CONTATO,');
    QSelect.SQL.Add('  FPE_CODIGO,');
    QSelect.SQL.Add('  CNC_FATURAMENTO_PENDENTE,');
    QSelect.SQL.Add('  PDV_DT_FPE,');
    QSelect.SQL.Add('  CNT_CODIGO,');
    QSelect.SQL.Add('  PDV_GARANTIA,');
    QSelect.SQL.Add('  PDV_CODIGO_ORIGEM,');
    QSelect.SQL.Add('  PDV_FRETE,');
    QSelect.SQL.Add('  PDV_ANTECIPADO,');
    QSelect.SQL.Add('  PDV_ENTREGA_DEPOSITO,');
    QSelect.SQL.Add('  PDV_TITULO_GERADO2,');
    QSelect.SQL.Add('  CNC_FATURAMENTO_PENDENTE2,');
    QSelect.SQL.Add('  FPE_CODIGO2,');
    QSelect.SQL.Add('  PDV_DT_FPE2,');
    QSelect.SQL.Add('  PDV_DT_ANTECIPADO,');
    QSelect.SQL.Add('  PDV_CLASSIFICACAO,');
    QSelect.SQL.Add('  CSG_CODIGO,');
    QSelect.SQL.Add('  PDV_COO,');
    QSelect.SQL.Add('  PDV_CCF,');
    QSelect.SQL.Add('  PDV_PAF');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PEDIDO_DE_VENDA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  function subSQLitem(iCod: integer): boolean;
  begin
    QSelectItem.Close;
    QSelectItem.SQL.Clear;
    QSelectItem.SQL.Add('SELECT');
    QSelectItem.SQL.Add('  CNC_CODIGO,');
    QSelectItem.SQL.Add('  PDV_CODIGO,');
    QSelectItem.SQL.Add('  IPV_CODIGO,');
    QSelectItem.SQL.Add('  FUN_CODIGO,');
    QSelectItem.SQL.Add('  IEB_CODIGO,');
    QSelectItem.SQL.Add('  SEC_CODIGO,');
    QSelectItem.SQL.Add('  PRD_CODIGO,');
    QSelectItem.SQL.Add('  TBP_CODIGO,');
    QSelectItem.SQL.Add('  IPV_ENTREGA,');
    QSelectItem.SQL.Add('  IPV_AVISTA,');
    QSelectItem.SQL.Add('  IPV_QUANTIDADE,');
    QSelectItem.SQL.Add('  IPV_DESCONTO,');
    QSelectItem.SQL.Add('  IPV_BONIFICACAO,');
    QSelectItem.SQL.Add('  CNC_LOCAL_ESTOQUE,');
    QSelectItem.SQL.Add('  IPV_PRECO,');
    QSelectItem.SQL.Add('  IPV_SITUACAO,');
    QSelectItem.SQL.Add('  IPV_PRECO_DESC,');
    QSelectItem.SQL.Add('  IPV_NOTA,');
    QSelectItem.SQL.Add('  IPV_ITEMNOTA,');
    QSelectItem.SQL.Add('  IPV_PRECO_NOTA,');
    QSelectItem.SQL.Add('  IPV_PENDENCIA,');
    QSelectItem.SQL.Add('  IPV_ESTOQUE_LOCAL,');
    QSelectItem.SQL.Add('  IPV_ESTOQUE_EXTERNO,');
    QSelectItem.SQL.Add('  IPV_PRECO_SUGERIDO,');
    QSelectItem.SQL.Add('  IPV_DIAS_ENTREGA,');
    QSelectItem.SQL.Add('  IPV_DT_ENTRADA,');
    QSelectItem.SQL.Add('  IPV_DT_SAIDA,');
    QSelectItem.SQL.Add('  IPV_SERVICO,');
    QSelectItem.SQL.Add('  USU_CODIGO,');
    QSelectItem.SQL.Add('  IPV_OBSERVACAO,');
    QSelectItem.SQL.Add('  IPV_DT_ALTERADO,');
    QSelectItem.SQL.Add('  IPV_DT_CADASTRO,');
    QSelectItem.SQL.Add('  IPV_VINCULO,');
    QSelectItem.SQL.Add('  IPV_SEQUENCIA,');
    QSelectItem.SQL.Add('  LOT_CODIGO,');
    QSelectItem.SQL.Add('  IPV_FISCAL,');
    QSelectItem.SQL.Add('  INF_N_ITEM');
    QSelectItem.SQL.Add('FROM');
    QSelectItem.SQL.Add('  ITEM_DE_PEDIDO_DE_VENDA');
    QSelectItem.SQL.Add('WHERE 1=1');
    QSelectItem.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelectItem.SQL.Add('  AND PDV_CODIGO = ' + IntToStr(iCod));
    QSelectItem.Open;
    result := not QSelectItem.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'PDV'                                                                                                           + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DATA_HORA').AsDateTime))        + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_TOTAL').AsString))                                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_LISTADO').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('PDV_SITUACAO').AsString)                                                     + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('PDV_OBS').AsString)))                                        + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('PDV_DIAS_RESERV').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_NOTA_FISCAL').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('AGF_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPG_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_TIPO_PAG').AsString)                                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_ENTRADA').AsString))                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNC_CLIENTE').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_EM_USO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_ACRESCIMO').AsString))                                         + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_ALTERADO').AsDateTime))      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_MAQUINA').AsString)                                                        + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_MELHOR_DATA').AsDateTime))      + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('PDV_VENCIMENTOS').AsString)))                                + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('PDV_MEDIA_PAGAMENTO').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_NOTA_CUPOM').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_IMPRESSO').AsString)                                                       + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_EMISSAO_VENDA').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_DEVOLUCAO').AsDateTime))     + delimitador +
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('PDV_CONTATO').AsString)))                                     + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_CREDITO').AsString))                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_ARQUITETO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_TITULO_GERADO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_TIPO_VENDA').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_PACOTE').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_GRUPO_ESPECIAL').AsString)                                                 + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_PREVISAO').AsDateTime))      + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_ENTREGA').AsDateTime))       + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('PDV_DOCUMENTO').AsString)))                                   + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('PDV_CAIXA').AsString)))                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_SERVICO').AsString)                                                        + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('PDV_FONE_CONTATO').AsString)))                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPE_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNC_FATURAMENTO_PENDENTE').AsString)                                           + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_FPE').AsDateTime))           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNT_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_GARANTIA').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_CODIGO_ORIGEM').AsString)                                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_FRETE').AsString))                                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_ANTECIPADO').AsString))                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_ENTREGA_DEPOSITO').AsString)                                               + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_TITULO_GERADO2').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNC_FATURAMENTO_PENDENTE2').AsString)                                          + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPE_CODIGO2').AsString)                                                        + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_FPE2').AsDateTime))          + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_ANTECIPADO').AsDateTime))    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_CLASSIFICACAO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CSG_CODIGO').AsString)                                                         + delimitador +
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('PDV_COO').AsString)))                                         + delimitador + (*TAM = 20*)
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('PDV_CCF').AsString)))                                         + delimitador + (*TAM = 20*)
        PreencheDir(CHAR_1,Trim(RetiraAspas(FieldByName('PDV_PAF').AsString)))                                          + delimitador );
    end;
  end;

  procedure subAddItem;
  begin
    with QSelectItem do
    begin
      Arquivo.Add(
        'IPV'                                                                                                     + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IEB_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('SEC_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TBP_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_ENTREGA').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_AVISTA').AsString)                                                   + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPV_QUANTIDADE').AsString))                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPV_DESCONTO').AsString))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPV_BONIFICACAO').AsString))                                 + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_LOCAL_ESTOQUE').AsString)                                          + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPV_PRECO').AsString))                                       + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('IPV_SITUACAO').AsString)                                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPV_PRECO_DESC').AsString))                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_NOTA').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_ITEMNOTA').AsString)                                                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPV_PRECO_NOTA').AsString))                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_PENDENCIA').AsString)                                                + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPV_ESTOQUE_LOCAL').AsString))                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPV_ESTOQUE_EXTERNO').AsString))                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPV_PRECO_SUGERIDO').AsString))                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_DIAS_ENTREGA').AsString)                                             + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IPV_DT_ENTRADA').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IPV_DT_SAIDA').AsDateTime))   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_SERVICO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                   + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('IPV_OBSERVACAO').AsString)))                           + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IPV_DT_ALTERADO').AsDateTime))+ delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IPV_DT_CADASTRO').AsDateTime))+ delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_VINCULO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_SEQUENCIA').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('LOT_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPV_FISCAL').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('INF_N_ITEM').AsString)                                                   + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;

      if subSQLitem(QSelect.FieldByName('PDV_CODIGO').AsInteger) then
      begin
        QSelectItem.First;
        while not QSelectItem.Eof do
        begin
          subAddItem;
          QSelectItem.Next;
        end;
      end;

      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'PEDIDO_DE_VENDA.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_CLI(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (CLI_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR CLI_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CLIENTE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CLI_CODIGO,');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  CLI_PESSOA_FISICA,');
    QSelect.SQL.Add('  CLI_DT_CADASTRO,');
    QSelect.SQL.Add('  CLI_DATA_NASC,');
    QSelect.SQL.Add('  CLI_RZ_SOCIAL,');
    QSelect.SQL.Add('  CLI_NOME_FAN,');
    QSelect.SQL.Add('  CLI_CGC_CPF,');
    QSelect.SQL.Add('  CLI_CGF_RG,');
    QSelect.SQL.Add('  CLI_LOGRADOURO,');
    QSelect.SQL.Add('  CLI_ENDERECO,');
    QSelect.SQL.Add('  CLI_BAIRRO,');
    QSelect.SQL.Add('  CLI_CIDADE,');
    QSelect.SQL.Add('  CLI_UF,');
    QSelect.SQL.Add('  CLI_CEP,');
    QSelect.SQL.Add('  CLI_FONE,');
    QSelect.SQL.Add('  CLI_SITUACAO,');
    QSelect.SQL.Add('  CLI_CREDITO,');
    QSelect.SQL.Add('  CLI_PAI,');
    QSelect.SQL.Add('  CLI_MAE,');
    QSelect.SQL.Add('  CLI_CONJUGE,');
    QSelect.SQL.Add('  CLI_OBS1,');
    QSelect.SQL.Add('  CLI_LOCALTRABALHO,');
    QSelect.SQL.Add('  CLI_FAX,');
    QSelect.SQL.Add('  CLI_SITE,');
    QSelect.SQL.Add('  CLI_EMAIL,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  CLI_DT_ALTERADO,');
    QSelect.SQL.Add('  CLI_CELULAR,');
    QSelect.SQL.Add('  CLI_SPC,');
    QSelect.SQL.Add('  CLI_VENDA_ATACADO,');
    QSelect.SQL.Add('  CLI_DESCONTO,');
    QSelect.SQL.Add('  CLI_ORGAO,');
    QSelect.SQL.Add('  CLI_DT_SPC,');
    QSelect.SQL.Add('  CLI_REFERENCIA1,');
    QSelect.SQL.Add('  CLI_REFERENCIA2,');
    QSelect.SQL.Add('  CLI_REFERENCIA3,');
    QSelect.SQL.Add('  CLI_IDENTIFICACAO,');
    QSelect.SQL.Add('  CLI_PROFISSAO,');
    QSelect.SQL.Add('  CLI_QUINZENAL,');
    QSelect.SQL.Add('  CLI_MENSAL,');
    QSelect.SQL.Add('  CLI_NOTA,');
    QSelect.SQL.Add('  CLI_CLASSIFICACAO,');
    QSelect.SQL.Add('  CLI_MAQUINA,');
    QSelect.SQL.Add('  CLI_TIPO,');
    QSelect.SQL.Add('  CNC_CONVENIO,');
    QSelect.SQL.Add('  CLI_CONVENIO,');
    QSelect.SQL.Add('  CNC_ORIGEM,');
    QSelect.SQL.Add('  CLI_DT_IMPORTACAO_INS,');
    QSelect.SQL.Add('  CLI_DT_IMPORTACAO_ALT,');
    QSelect.SQL.Add('  CLI_DESCONTO_PRAZO,');
    QSelect.SQL.Add('  CLI_CONSIGNATARIO,');
    QSelect.SQL.Add('  CLI_NUMERO_END');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CLIENTE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'CLI'                                                                                                            + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CODIGO').AsString)                                                          + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_PESSOA_FISICA').AsString)                                                   + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CLI_DT_CADASTRO').AsDateTime))       + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CLI_DATA_NASC').AsDateTime))         + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CLI_RZ_SOCIAL').AsString)))                                    + delimitador +(*TAM = 60*)
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CLI_NOME_FAN').AsString)))                                     + delimitador +(*TAM = 60*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_CGC_CPF').AsString)))                                      + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_CGF_RG').AsString)))                                       + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CLI_LOGRADOURO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CLI_ENDERECO').AsString)))                                     + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_BAIRRO').AsString)))                                       + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_CIDADE').AsString)))                                       + delimitador +
        PreencheDir(CHAR_2,Trim(RetiraAspas(FieldByName('CLI_UF').AsString)))                                            + delimitador +(*TAM = 20*)
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('CLI_CEP').AsString)))                                          + delimitador +(*TAM = 20*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_FONE').AsString)))                                         + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CLI_SITUACAO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('CLI_CREDITO').AsString))                                            + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_PAI').AsString)))                                          + delimitador +(*TAM = 60*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_MAE').AsString)))                                          + delimitador +(*TAM = 60*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_CONJUGE').AsString)))                                      + delimitador +(*TAM = 60*)
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('CLI_OBS1').AsString)))                                        + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CLI_LOCALTRABALHO').AsString)))                                + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_FAX').AsString)))                                          + delimitador +
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CLI_SITE').AsString)))                                         + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CLI_EMAIL').AsString)))                                        + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                          + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CLI_DT_ALTERADO').AsDateTime))       + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_CELULAR').AsString)))                                      + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CLI_SPC').AsString)                                                           + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CLI_VENDA_ATACADO').AsString)                                                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('CLI_DESCONTO').AsString))                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_ORGAO').AsString)                                                           + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CLI_DT_SPC').AsDateTime))            + delimitador +
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CLI_REFERENCIA1').AsString)))                                  + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CLI_REFERENCIA2').AsString)))                                  + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CLI_REFERENCIA3').AsString)))                                  + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CLI_IDENTIFICACAO').AsString)))                                + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CLI_PROFISSAO').AsString)))                                    + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_INT,FieldByName('CLI_QUINZENAL').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_MENSAL').AsString)                                                          + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_NOTA').AsString)                                                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CLASSIFICACAO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_MAQUINA').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_TIPO').AsString)                                                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNC_CONVENIO').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CONVENIO').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_ORIGEM').AsString)                                                        + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CLI_DT_IMPORTACAO_INS').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CLI_DT_IMPORTACAO_ALT').AsDateTime)) + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('CLI_DESCONTO_PRAZO').AsString))                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CONSIGNATARIO').AsString)                                                   + delimitador +
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('CLI_NUMERO_END').AsString)))                                   + delimitador )
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'CLIENTE.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_IES(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND IES_DH_ATUALIZADO >= '''+MesDia(FDataReferencia)+'''');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  ITEM_DE_ESTOQUE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  PRD_CODIGO,');
    QSelect.SQL.Add('  IES_SCOMERCIAL,');
    QSelect.SQL.Add('  IES_SFISICO,');
    QSelect.SQL.Add('  IES_SRESERVADO,');
    QSelect.SQL.Add('  IES_SFISCAL,');
    QSelect.SQL.Add('  IES_INDISPONIVEL,');
    QSelect.SQL.Add('  IES_DH_ATUALIZADO,');
    QSelect.SQL.Add('  IES_INVENT_FISICO,');
    QSelect.SQL.Add('  IES_INVENT_COMERCIAL,');
    QSelect.SQL.Add('  IES_INVENT_RESERV,');
    QSelect.SQL.Add('  IES_INVENT_DATA_FISICO,');
    QSelect.SQL.Add('  IES_INVENT_DATA_COMERCIAL,');
    QSelect.SQL.Add('  IES_INVENT_DATA_RESERV,');
    QSelect.SQL.Add('  IES_SSN,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  IES_MAQUINA,');
    QSelect.SQL.Add('  IES_SLJ4,');
    QSelect.SQL.Add('  IES_SAMOSTRA,');
    QSelect.SQL.Add('  IES_SBONIFICACAO,');
    QSelect.SQL.Add('  IES_SAMOSTRA_FISCAL,');
    QSelect.SQL.Add('  IES_SBONIFICACAO_FISCAL,');
    QSelect.SQL.Add('  FUN_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  ITEM_DE_ESTOQUE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'IES'                                                                                                                + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SCOMERCIAL').AsString))                                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SFISICO').AsString))                                                + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SRESERVADO').AsString))                                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SFISCAL').AsString))                                                + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_INDISPONIVEL').AsString))                                           + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IES_DH_ATUALIZADO').AsDateTime))         + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_INVENT_FISICO').AsString))                                          + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_INVENT_COMERCIAL').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_INVENT_RESERV').AsString))                                          + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IES_INVENT_DATA_FISICO').AsDateTime))    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IES_INVENT_DATA_COMERCIAL').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IES_INVENT_DATA_RESERV').AsDateTime))    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SSN').AsString))                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IES_MAQUINA').AsString)                                                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SLJ4').AsString))                                                   + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SAMOSTRA').AsString))                                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SBONIFICACAO').AsString))                                           + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SAMOSTRA_FISCAL').AsString))                                        + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IES_SBONIFICACAO_FISCAL').AsString))                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                              + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'ITEM_DE_ESTOQUE.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_INV(QSelect, QSelectItem: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (INV_DATA >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR INV_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  INVENTARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  INV_CODIGO,');
    QSelect.SQL.Add('  INV_DATA,');
    QSelect.SQL.Add('  FUN_CODIGO,');
    QSelect.SQL.Add('  INV_SITUACAO,');
    QSelect.SQL.Add('  INV_OBSERVACAO1,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  INV_DT_ALTERADO,');
    QSelect.SQL.Add('  INV_TIPO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  INVENTARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  function subSQLitem(iCod: integer): boolean;
  begin
    QSelectItem.Close;
    QSelectItem.SQL.Clear;
    QSelectItem.SQL.Add('SELECT');
    QSelectItem.SQL.Add('  CNC_CODIGO,');
    QSelectItem.SQL.Add('  INV_CODIGO,');
    QSelectItem.SQL.Add('  IIV_CODIGO,');
    QSelectItem.SQL.Add('  PRD_CODIGO,');
    QSelectItem.SQL.Add('  IIV_QUANT_SIST,');
    QSelectItem.SQL.Add('  IIV_QUANT_INF,');
    QSelectItem.SQL.Add('  USU_CODIGO,');
    QSelectItem.SQL.Add('  IIV_DT_CADASTRO,');
    QSelectItem.SQL.Add('  IIV_DT_ALTERADO,');
    QSelectItem.SQL.Add('  IIV_OBSERVACAO,');
    QSelectItem.SQL.Add('  LOT_CODIGO,');
    QSelectItem.SQL.Add('  FUN_CODIGO');
    QSelectItem.SQL.Add('FROM');
    QSelectItem.SQL.Add('  ITEM_DE_INVENTARIO');
    QSelectItem.SQL.Add('WHERE 1=1');
    QSelectItem.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelectItem.SQL.Add('  AND INV_CODIGO = ' + IntToStr(iCod));
    QSelectItem.Open;
    result := not QSelectItem.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'INV'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('INV_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('INV_DATA').AsDateTime))        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('INV_SITUACAO').AsString)                                                  + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('INV_OBSERVACAO1').AsString)))                           + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('INV_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('INV_TIPO').AsString)                                                      + delimitador );
    end;
  end;

  procedure subAddItem;
  begin
    with QSelectItem do
    begin
      Arquivo.Add(
        'IIV'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('INV_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IIV_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IIV_QUANT_SIST').AsString))                                   + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IIV_QUANT_INF').AsString))                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IIV_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('IIV_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('IIV_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('LOT_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                    + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;

      if subSQLitem(QSelect.FieldByName('INV_CODIGO').AsInteger) then
      begin
        QSelectItem.First;
        while not QSelectItem.Eof do
        begin
          subAddItem;
          QSelectItem.Next;
        end;
      end;

      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'INVENTARIO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_MEC(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND MEC_DATA_HORA >= '''+MesDia(FDataReferencia)+'''');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_ESTOQUE_COMERCIAL');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  MEC_CODIGO,');
    QSelect.SQL.Add('  PRD_CODIGO,');
    QSelect.SQL.Add('  MEC_DATA_HORA,');
    QSelect.SQL.Add('  MEC_ES,');
    QSelect.SQL.Add('  MEC_TIPO_MOV,');
    QSelect.SQL.Add('  MEC_QUANTIDADE,');
    QSelect.SQL.Add('  MEC_SALDO_ANT,');
    QSelect.SQL.Add('  MEC_TIPO_ENT,');
    QSelect.SQL.Add('  MEC_CNC_CODIGO_ENT,');
    QSelect.SQL.Add('  MEC_ENT_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  MEC_OBSERVACAO,');
    QSelect.SQL.Add('  MEC_MAQUINA,');
    QSelect.SQL.Add('  MEC_RESERVADO,');
    QSelect.SQL.Add('  MEC_INDISPONIVEL,');
    QSelect.SQL.Add('  MEC_AMOSTRA_ANTERIOR,');
    QSelect.SQL.Add('  MEC_AMOSTRA,');
    QSelect.SQL.Add('  MEC_BONIFICACAO_ANTERIOR,');
    QSelect.SQL.Add('  MEC_BONIFICACAO,');
    QSelect.SQL.Add('  FUN_CODIGO,');
    QSelect.SQL.Add('  LOT_CODIGO,');
    QSelect.SQL.Add('  MEC_QTD_ANT_LOTE');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_ESTOQUE_COMERCIAL');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'MEC'                                                                                                    + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MEC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MEC_DATA_HORA').AsDateTime)) + delimitador +
        PreencheDir(CHAR_1,Trim(RetiraAspas(FieldByName('MEC_ES').AsString)))                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MEC_TIPO_MOV').AsString)                                                + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEC_QUANTIDADE').AsString))                                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEC_SALDO_ANT').AsString))                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MEC_TIPO_ENT').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('MEC_CNC_CODIGO_ENT').AsString)                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MEC_ENT_CODIGO').AsString)                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                  + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('MEC_OBSERVACAO').AsString)))                          + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('MEC_MAQUINA').AsString)                                                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEC_RESERVADO').AsString))                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEC_INDISPONIVEL').AsString))                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEC_AMOSTRA_ANTERIOR').AsString))                           + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEC_AMOSTRA').AsString))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEC_BONIFICACAO_ANTERIOR').AsString))                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEC_BONIFICACAO').AsString))                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('LOT_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEC_QTD_ANT_LOTE').AsString))                               + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'MOVIMENTO_DE_ESTOQUE_COMERCIAL.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_MEF(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND MEF_DATA >= '''+MesDia(FDataReferencia)+'''');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_ESTOQUE_FISICO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  MEF_CODIGO,');
    QSelect.SQL.Add('  PRD_CODIGO,');
    QSelect.SQL.Add('  MEF_DATA,');
    QSelect.SQL.Add('  MEF_ES,');
    QSelect.SQL.Add('  MEF_QUANTIDADE,');
    QSelect.SQL.Add('  MEF_SALDO_ANT,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  MEF_CNC_CODIGO_ENT,');
    QSelect.SQL.Add('  MEF_ENT_CODIGO,');
    QSelect.SQL.Add('  MEF_TIPO_MOV,');
    QSelect.SQL.Add('  MEF_OBSERVACAO,');
    QSelect.SQL.Add('  MEF_MAQUINA,');
    QSelect.SQL.Add('  FUN_CODIGO,');
    QSelect.SQL.Add('  LOT_CODIGO,');
    QSelect.SQL.Add('  MEF_QTD_ANT_LOTE,');
    QSelect.SQL.Add('  CNC_DESTINO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_ESTOQUE_FISICO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'MEF'                                                                                               + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MEF_CODIGO').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                             + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MEF_DATA').AsDateTime)) + delimitador +
        PreencheDir(CHAR_1,Trim(RetiraAspas(FieldByName('MEF_ES').AsString)))                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEF_QUANTIDADE').AsString))                            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEF_SALDO_ANT').AsString))                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('MEF_CNC_CODIGO_ENT').AsString)                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MEF_ENT_CODIGO').AsString)                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MEF_TIPO_MOV').AsString)                                           + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('MEF_OBSERVACAO').AsString)))                     + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('MEF_MAQUINA').AsString)                                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('LOT_CODIGO').AsString)                                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MEF_QTD_ANT_LOTE').AsString))                          + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_DESTINO').AsString)                                          + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'MOVIMENTO_DE_ESTOQUE_FISICO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_MES(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND MES_DATA_HORA >= '''+MesDia(FDataReferencia)+'''');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_ESTOQUE_FISCAL');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  MES_CODIGO,');
    QSelect.SQL.Add('  PRD_CODIGO,');
    QSelect.SQL.Add('  MES_DATA_HORA,');
    QSelect.SQL.Add('  MES_ES,');
    QSelect.SQL.Add('  MES_TIPO_MOV,');
    QSelect.SQL.Add('  MES_QUANTIDADE,');
    QSelect.SQL.Add('  MES_SALDO_ANT,');
    QSelect.SQL.Add('  MES_TIPO_ENT,');
    QSelect.SQL.Add('  MES_CNC_CODIGO_ENT,');
    QSelect.SQL.Add('  MES_ENT_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  MES_OBSERVACAO,');
    QSelect.SQL.Add('  MES_MAQUINA,');
    QSelect.SQL.Add('  MES_AMOSTRA_ANTERIOR,');
    QSelect.SQL.Add('  MES_AMOSTRA,');
    QSelect.SQL.Add('  MES_BONIFICACAO_ANTERIOR,');
    QSelect.SQL.Add('  MES_BONIFICACAO,');
    QSelect.SQL.Add('  FUN_CODIGO,');
    QSelect.SQL.Add('  LOT_CODIGO,');
    QSelect.SQL.Add('  MES_QTD_ANT_LOTE');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_ESTOQUE_FISCAL');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'MES'                                                                                                    + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MES_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MES_DATA_HORA').AsDateTime)) + delimitador +
        PreencheDir(CHAR_1,Trim(RetiraAspas(FieldByName('MES_ES').AsString)))                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MES_TIPO_MOV').AsString)                                                + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MES_QUANTIDADE').AsString))                                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MES_SALDO_ANT').AsString))                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MES_TIPO_ENT').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('MES_CNC_CODIGO_ENT').AsString)                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MES_ENT_CODIGO').AsString)                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                  + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('MES_OBSERVACAO').AsString)))                          + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('MES_MAQUINA').AsString)                                                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MES_AMOSTRA_ANTERIOR').AsString))                           + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MES_AMOSTRA').AsString))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MES_BONIFICACAO_ANTERIOR').AsString))                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MES_BONIFICACAO').AsString))                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('LOT_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MES_QTD_ANT_LOTE').AsString))                               + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'MOVIMENTO_DE_ESTOQUE_FISCAL.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_MVC(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (MVC_DATA >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR MVC_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_CAIXA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  MVC_CODIGO,');
    QSelect.SQL.Add('  CCX_CODIGO,');
    QSelect.SQL.Add('  CAX_CODIGO,');
    QSelect.SQL.Add('  MVC_DESCRICAO,');
    QSelect.SQL.Add('  MVC_DATA,');
    QSelect.SQL.Add('  MVC_DC,');
    QSelect.SQL.Add('  MVC_VALOR,');
    QSelect.SQL.Add('  MVC_FLAG,');
    QSelect.SQL.Add('  MVC_TIT_TIPO,');
    QSelect.SQL.Add('  MVC_TIT_CC,');
    QSelect.SQL.Add('  MVC_TIT_NUMERO,');
    QSelect.SQL.Add('  MVC_TIPO_PGTO,');
    QSelect.SQL.Add('  MVC_TIT_SEQUENCIA,');
    QSelect.SQL.Add('  MVC_OBSERVACAO1,');
    QSelect.SQL.Add('  TIT_CODIGO,');
    QSelect.SQL.Add('  CNC_TITULO,');
    QSelect.SQL.Add('  MVC_PT,');
    QSelect.SQL.Add('  MVC_COMPETENCIA,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  MVC_DT_ALTERADO,');
    QSelect.SQL.Add('  CCX_CODIGO_REC,');
    QSelect.SQL.Add('  MVC_NAO_CONTABIL,');
    QSelect.SQL.Add('  MVC_ORIGEM_EXTORNO,');
    QSelect.SQL.Add('  MVC_JUROS,');
    QSelect.SQL.Add('  MVC_DESCONTO,');
    QSelect.SQL.Add('  MVC_CRED_CLI,');
    QSelect.SQL.Add('  MVC_VALOR_DOC,');
    QSelect.SQL.Add('  MVC_MAQUINA,');
    QSelect.SQL.Add('  MVC_DT_CHEQUE,');
    QSelect.SQL.Add('  CHQ_CODIGO,');
    QSelect.SQL.Add('  CNC_CHEQUE');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_CAIXA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'MVC'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MVC_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CCX_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CAX_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_60,Trim(RetiraAspas(FieldByName('MVC_DESCRICAO').AsString)))                              + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MVC_DATA').AsDateTime))        + delimitador +
        PreencheDir(CHAR_1,Trim(RetiraAspas(FieldByName('MVC_DC').AsString)))                                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MVC_VALOR').AsString))                                        + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('MVC_FLAG').AsString)))                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MVC_TIT_TIPO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MVC_TIT_CC').AsString)                                                    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('MVC_TIT_NUMERO').AsString)))                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MVC_TIPO_PGTO').AsString)                                                 + delimitador +
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('MVC_TIT_SEQUENCIA').AsString)))                          + delimitador +(*TAM = 20*)
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('MVC_OBSERVACAO1').AsString)))                           + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('TIT_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_TITULO').AsString)                                                  + delimitador +
        PreencheDir(CHAR_1,Trim(RetiraAspas(FieldByName('MVC_PT').AsString)))                                      + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MVC_COMPETENCIA').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MVC_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CCX_CODIGO_REC').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MVC_NAO_CONTABIL').AsString)                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MVC_ORIGEM_EXTORNO').AsString)                                            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MVC_JUROS').AsString))                                        + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MVC_DESCONTO').AsString))                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MVC_CRED_CLI').AsString))                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MVC_VALOR_DOC').AsString))                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MVC_MAQUINA').AsString)                                                   + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MVC_DT_CHEQUE').AsDateTime))   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNC_CHEQUE').AsString)                                                    + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'MOVIMENTO_DE_CAIXA.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_NTF(QSelect, QSelectItem: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (NTF_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR NTF_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  NOTA_FISCAL');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  NTF_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  CNC_CLIENTE,');
    QSelect.SQL.Add('  CLI_CODIGO,');
    QSelect.SQL.Add('  FOR_CODIGO,');
    QSelect.SQL.Add('  FUN_CODIGO,');
    QSelect.SQL.Add('  TRN_CODIGO,');
    QSelect.SQL.Add('  CAG_CODIGO,');
    QSelect.SQL.Add('  NTF_PEDIDO,');
    QSelect.SQL.Add('  NTF_DT_CADASTRO,');
    QSelect.SQL.Add('  NTF_DT_ALTERADO,');
    QSelect.SQL.Add('  NTF_DT_EMISSAO,');
    QSelect.SQL.Add('  NTF_DT_ENTRADA_SAIDA,');
    QSelect.SQL.Add('  NTF_ENTRADA_SAIDA,');
    QSelect.SQL.Add('  NTF_TIPO_NOTA,');
    QSelect.SQL.Add('  NTF_NOTA_FISCAL,');
    QSelect.SQL.Add('  NTF_SERIE,');
    QSelect.SQL.Add('  NTF_SUBSERIE,');
    QSelect.SQL.Add('  NTF_SELO,');
    QSelect.SQL.Add('  NTF_AIDF,');
    QSelect.SQL.Add('  NTF_CFOP,');
    QSelect.SQL.Add('  NTF_BASE_ICMS,');
    QSelect.SQL.Add('  NTF_ICMS,');
    QSelect.SQL.Add('  NTF_BASE_ICMS_SUB,');
    QSelect.SQL.Add('  NTF_ICMS_SUB,');
    QSelect.SQL.Add('  NTF_TOTAL_PRODUTO,');
    QSelect.SQL.Add('  NTF_TOTAL_NOTA,');
    QSelect.SQL.Add('  NTF_FRETE,');
    QSelect.SQL.Add('  NTF_SEGURO,');
    QSelect.SQL.Add('  NTF_OUTRAS,');
    QSelect.SQL.Add('  NTF_IPI,');
    QSelect.SQL.Add('  NTF_TIPO_TRANSPORTE,');
    QSelect.SQL.Add('  NTF_TIPO_FRETE,');
    QSelect.SQL.Add('  NTF_PLACA,');
    QSelect.SQL.Add('  NTF_PLACA_UF,');
    QSelect.SQL.Add('  NTF_QUANTIDADE,');
    QSelect.SQL.Add('  NTF_ESPECIE,');
    QSelect.SQL.Add('  NTF_MARCA,');
    QSelect.SQL.Add('  NTF_NUMERO,');
    QSelect.SQL.Add('  NTF_PESO_BRUTO,');
    QSelect.SQL.Add('  NTF_PESO_LIQUIDO,');
    QSelect.SQL.Add('  NTF_SITUACAO,');
    QSelect.SQL.Add('  NTF_OBSERVACAO,');
    QSelect.SQL.Add('  NTF_ICMS_FRETE,');
    QSelect.SQL.Add('  NTF_CONHECIMENTO,');
    QSelect.SQL.Add('  NTF_ISS,');
    QSelect.SQL.Add('  NTF_BASE_ISS,');
    QSelect.SQL.Add('  CNC_PEDIDO,');
    QSelect.SQL.Add('  NTF_ENDERECO,');
    QSelect.SQL.Add('  NTF_BAIRRO,');
    QSelect.SQL.Add('  NTF_MUNICIPIO,');
    QSelect.SQL.Add('  NTF_UF,');
    QSelect.SQL.Add('  NTF_CEP,');
    QSelect.SQL.Add('  NTF_NOTA_CUPOM,');
    QSelect.SQL.Add('  NTF_AVULSA,');
    QSelect.SQL.Add('  NTF_COD_PAGAMENTO,');
    QSelect.SQL.Add('  NTF_TOTAL_SERVICO,');
    QSelect.SQL.Add('  FUN_ARQUITETO,');
    QSelect.SQL.Add('  CNC_ORIGEM,');
    QSelect.SQL.Add('  NTF_COD_PAGAMENTO_2,');
    QSelect.SQL.Add('  NTF_MAQUINA,');
    QSelect.SQL.Add('  TRO_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  NOTA_FISCAL');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  function subSQLitem(iCod: integer): boolean;
  begin
    QSelectItem.Close;
    QSelectItem.SQL.Clear;
    QSelectItem.SQL.Add('SELECT');
    QSelectItem.SQL.Add('  CNC_CODIGO,');
    QSelectItem.SQL.Add('  NTF_CODIGO,');
    QSelectItem.SQL.Add('  INF_CODIGO,');
    QSelectItem.SQL.Add('  PRD_CODIGO,');
    QSelectItem.SQL.Add('  INF_SERVICO,');
    QSelectItem.SQL.Add('  INF_QUANTIDADE,');
    QSelectItem.SQL.Add('  INF_PRECO,');
    QSelectItem.SQL.Add('  INF_DESCONTO,');
    QSelectItem.SQL.Add('  INF_TIPO_ALIQUOTA,');
    QSelectItem.SQL.Add('  INF_ALIQUOTA,');
    QSelectItem.SQL.Add('  INF_ALIQUOTA_IPI,');
    QSelectItem.SQL.Add('  CNC_ORIGEM,');
    QSelectItem.SQL.Add('  INF_BONIFICACAO,');
    QSelectItem.SQL.Add('  INF_ALIQUOTA_ISS,');
    QSelectItem.SQL.Add('  INF_DT_CADASTRO,');
    QSelectItem.SQL.Add('  INF_DT_ALTERADO,');
    QSelectItem.SQL.Add('  USU_CODIGO,');
    QSelectItem.SQL.Add('  INF_AMOSTRA,');
    QSelectItem.SQL.Add('  LOT_CODIGO');
    QSelectItem.SQL.Add('FROM');
    QSelectItem.SQL.Add('  ITEM_DE_NOTA_FISCAL');
    QSelectItem.SQL.Add('WHERE 1=1');
    QSelectItem.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelectItem.SQL.Add('  AND NTF_CODIGO = ' + IntToStr(iCod));
    QSelectItem.Open;
    result := not QSelectItem.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'NTF'                                                                                                           + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CLIENTE').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FOR_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRN_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CAG_CODIGO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_PEDIDO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('NTF_DT_CADASTRO').AsDateTime))      + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('NTF_DT_ALTERADO').AsDateTime))      + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('NTF_DT_EMISSAO').AsDateTime))       + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('NTF_DT_ENTRADA_SAIDA').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_ENTRADA_SAIDA').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_TIPO_NOTA').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_NOTA_FISCAL').AsString)                                                    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('NTF_SERIE').AsString)))                                       + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('NTF_SUBSERIE').AsString)))                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_SELO').AsString)                                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_AIDF').AsString)                                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_CFOP').AsString)                                                           + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_BASE_ICMS').AsString))                                         + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_ICMS').AsString))                                              + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_BASE_ICMS_SUB').AsString))                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_ICMS_SUB').AsString))                                          + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_TOTAL_PRODUTO').AsString))                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_TOTAL_NOTA').AsString))                                        + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_FRETE').AsString))                                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_SEGURO').AsString))                                            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_OUTRAS').AsString))                                            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_IPI').AsString))                                               + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_TIPO_TRANSPORTE').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_TIPO_FRETE').AsString)                                                     + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('NTF_PLACA').AsString)))                                       + delimitador +
        PreencheDir(CHAR_2,Trim(RetiraAspas(FieldByName('NTF_PLACA_UF').AsString)))                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_QUANTIDADE').AsString))                                        + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('NTF_ESPECIE').AsString)))                                     + delimitador +(*TAM = 30*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('NTF_MARCA').AsString)))                                       + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('NTF_NUMERO').AsString)))                                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_PESO_BRUTO').AsString))                                        + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_PESO_LIQUIDO').AsString))                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_SITUACAO').AsString)                                                       + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('NTF_OBSERVACAO').AsString)))                                 + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_ICMS_FRETE').AsString))                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_CONHECIMENTO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_ISS').AsString))                                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_BASE_ISS').AsString))                                          + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNC_PEDIDO').AsString)                                                         + delimitador +
        PreencheDir(CHAR_50,Trim(RetiraAspas(FieldByName('NTF_ENDERECO').AsString)))                                    + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('NTF_BAIRRO').AsString)))                                      + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('NTF_MUNICIPIO').AsString)))                                   + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_2,Trim(RetiraAspas(FieldByName('NTF_UF').AsString)))                                           + delimitador +(*TAM = 20*)
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('NTF_CEP').AsString)))                                         + delimitador +(*TAM = 25*)
        PreencheEsq(TAM_INT,FieldByName('NTF_NOTA_CUPOM').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_AVULSA').AsString)                                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_COD_PAGAMENTO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('NTF_TOTAL_SERVICO').AsString))                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_ARQUITETO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_ORIGEM').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_COD_PAGAMENTO_2').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_MAQUINA').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRO_CODIGO').AsString)                                                         + delimitador );
    end;
  end;

  procedure subAddItem;
  begin
    with QSelectItem do
    begin
      Arquivo.Add(
        'INF'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('NTF_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('INF_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('INF_SERVICO').AsString)))                                + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('INF_QUANTIDADE').AsString))                                   + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('INF_PRECO').AsString))                                        + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('INF_DESCONTO').AsString))                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('INF_TIPO_ALIQUOTA').AsString)                                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('INF_ALIQUOTA').AsString))                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('INF_ALIQUOTA_IPI').AsString))                                 + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_ORIGEM').AsString)                                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('INF_BONIFICACAO').AsString))                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('INF_ALIQUOTA_ISS').AsString))                                 + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('INF_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('INF_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('INF_AMOSTRA').AsString))                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('LOT_CODIGO').AsString)                                                    + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;

      if subSQLitem(QSelect.FieldByName('NTF_CODIGO').AsInteger) then
      begin
        QSelectItem.First;
        while not QSelectItem.Eof do
        begin
          subAddItem;
          QSelectItem.Next;
        end;
      end;

      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'NOTA_FISCAL.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_TPG(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (TPG_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR TPG_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TITULO_A_PAGAR');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  TPG_CODIGO,');
    QSelect.SQL.Add('  PCP_CODIGO,');
    QSelect.SQL.Add('  FOR_CODIGO,');
    QSelect.SQL.Add('  CCX_CODIGO,');
    QSelect.SQL.Add('  TPG_NUMERO,');
    QSelect.SQL.Add('  BNF_CODIGO,');
    QSelect.SQL.Add('  TPG_SEQUENCIA,');
    QSelect.SQL.Add('  TPG_VENCIMENTO,');
    QSelect.SQL.Add('  TPG_VALOR,');
    QSelect.SQL.Add('  TPG_TIPO_PERIODO,');
    QSelect.SQL.Add('  TPG_PAGAMENTO,');
    QSelect.SQL.Add('  TPG_VALOR_PAGO,');
    QSelect.SQL.Add('  TPG_FORMA_PGTO,');
    QSelect.SQL.Add('  TPG_SITUACAO,');
    QSelect.SQL.Add('  TPG_CUSTODIA,');
    QSelect.SQL.Add('  TPG_TIPO_DOC,');
    QSelect.SQL.Add('  TPG_TIPO_PAG,');
    QSelect.SQL.Add('  TRN_CODIGO,');
    QSelect.SQL.Add('  TPG_OBSERVACAO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  TPG_DT_ALTERADO,');
    QSelect.SQL.Add('  CHQ_CODIGO,');
    QSelect.SQL.Add('  CCX_CODIGO_REC,');
    QSelect.SQL.Add('  TPG_GEROU_MOVIMENTO,');
    QSelect.SQL.Add('  TPG_DT_CADASTRO,');
    QSelect.SQL.Add('  TPG_DESCONTO,');
    QSelect.SQL.Add('  TPG_JUROS,');
    QSelect.SQL.Add('  CNC_ORIGEM,');
    QSelect.SQL.Add('  TPG_TITULOANT,');
    QSelect.SQL.Add('  TPG_TPGORIGINAL,');
    QSelect.SQL.Add('  TPG_DTORIGINAL,');
    QSelect.SQL.Add('  TPG_DT_COMPETENCIA,');
    QSelect.SQL.Add('  TPG_AGENCIA_CONTA,');
    QSelect.SQL.Add('  CNC_CHEQUE,');
    QSelect.SQL.Add('  CNC_MOVIMENTO_CONTA_CORRENTE,');
    QSelect.SQL.Add('  MCC_CODIGO,');
    QSelect.SQL.Add('  FPE_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TITULO_A_PAGAR');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'TPG'                                                                                                         + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPG_CODIGO').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PCP_CODIGO').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FOR_CODIGO').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CCX_CODIGO').AsString)                                                       + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('TPG_NUMERO').AsString)))                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('BNF_CODIGO').AsString)                                                       + delimitador +
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('TPG_SEQUENCIA').AsString)))                                 + delimitador +(*TAM = 20*)
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TPG_VENCIMENTO').AsDateTime))     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TPG_VALOR').AsString))                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPG_TIPO_PERIODO').AsString)                                                 + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TPG_PAGAMENTO').AsDateTime))      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TPG_VALOR_PAGO').AsString))                                      + delimitador +
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('TPG_FORMA_PGTO').AsString)))                                + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('TPG_SITUACAO').AsString)                                                   + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('TPG_CUSTODIA').AsString)))                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPG_TIPO_DOC').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPG_TIPO_PAG').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRN_CODIGO').AsString)                                                       + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('TPG_OBSERVACAO').AsString)))                               + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                       + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TPG_DT_ALTERADO').AsDateTime))    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CHQ_CODIGO').AsString)))                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CCX_CODIGO_REC').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('TPG_GEROU_MOVIMENTO').AsString)                                            + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TPG_DT_CADASTRO').AsDateTime))    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TPG_DESCONTO').AsString))                                        + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TPG_JUROS').AsString))                                           + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_ORIGEM').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPG_TITULOANT').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPG_TPGORIGINAL').AsString)                                                  + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TPG_DTORIGINAL').AsDateTime))     + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TPG_DT_COMPETENCIA').AsDateTime)) + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('TPG_AGENCIA_CONTA').AsString)))                             + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CHEQUE').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNC_MOVIMENTO_CONTA_CORRENTE').AsString)                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MCC_CODIGO').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPE_CODIGO').AsString)                                                       + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'TITULO_A_PAGAR.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_TRC(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (TRC_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR TRC_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TITULO_A_RECEBER');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  TRC_CODIGO,');
    QSelect.SQL.Add('  PDV_CODIGO,');
    QSelect.SQL.Add('  AGF_CODIGO,');
    QSelect.SQL.Add('  CCX_CODIGO,');
    QSelect.SQL.Add('  TRC_NUMERO,');
    QSelect.SQL.Add('  TRC_SEQUENCIA,');
    QSelect.SQL.Add('  CLI_CODIGO,');
    QSelect.SQL.Add('  TRC_VENCIMENTO,');
    QSelect.SQL.Add('  TRC_VALOR,');
    QSelect.SQL.Add('  TRC_PAGAMENTO,');
    QSelect.SQL.Add('  TRC_VALOR_PAGO,');
    QSelect.SQL.Add('  TRC_SITUACAO,');
    QSelect.SQL.Add('  TRC_OBSERVACAO,');
    QSelect.SQL.Add('  TRC_CUSTODIA,');
    QSelect.SQL.Add('  TRC_TIPO_DOC,');
    QSelect.SQL.Add('  TRC_CRED_CLI,');
    QSelect.SQL.Add('  TRC_TIPO_PAG,');
    QSelect.SQL.Add('  CNC_CLIENTE,');
    QSelect.SQL.Add('  TRC_TITULOANT,');
    QSelect.SQL.Add('  BOL_CODIGO,');
    QSelect.SQL.Add('  TRC_TRCORIGINAL,');
    QSelect.SQL.Add('  TRC_DTORIGINAL,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  TRC_DT_ALTERADO,');
    QSelect.SQL.Add('  TRC_RGB_DT_INICIO,');
    QSelect.SQL.Add('  TRC_RGB_DT_SITUACAO,');
    QSelect.SQL.Add('  CPC_CODIGO,');
    QSelect.SQL.Add('  TRC_RGB_SITUACAO,');
    QSelect.SQL.Add('  TRC_RGB_VISITADO,');
    QSelect.SQL.Add('  TRC_RGB_DT_PROMESSA,');
    QSelect.SQL.Add('  TRC_PROCESSO,');
    QSelect.SQL.Add('  TRC_RGB_DT_VISITADO,');
    QSelect.SQL.Add('  CCX_CODIGO_REC,');
    QSelect.SQL.Add('  TRC_GEROU_MOVIMENTO,');
    QSelect.SQL.Add('  TRC_NOTA_SERVICO,');
    QSelect.SQL.Add('  TRC_DT_CADASTRO,');
    QSelect.SQL.Add('  TRC_DESCONTO,');
    QSelect.SQL.Add('  TRC_JUROS,');
    QSelect.SQL.Add('  CNC_ORIGEM,');
    QSelect.SQL.Add('  TRC_PEDIDO_SERVICO,');
    QSelect.SQL.Add('  TRC_TIPO_PEDIDO,');
    QSelect.SQL.Add('  TRC_DT_EMISSAO_BOLETO,');
    QSelect.SQL.Add('  TRC_DT_RECEBIMENTO_BOLETO,');
    QSelect.SQL.Add('  FPE_CODIGO,');
    QSelect.SQL.Add('  CNC_FATURAMENTO_PENDENTE,');
    QSelect.SQL.Add('  TRC_DT_COMPETENCIA,');
    QSelect.SQL.Add('  TRC_EQUIFAX,');
    QSelect.SQL.Add('  TRC_DT_EQUIFAX,');
    QSelect.SQL.Add('  TRC_AGENCIA_NUMERO,');
    QSelect.SQL.Add('  TRC_DT_CHEQUE,');
    QSelect.SQL.Add('  TRC_SIT_CHEQUE,');
    QSelect.SQL.Add('  TRC_REABERTURA,');
    QSelect.SQL.Add('  TRC_VERIFICADO,');
    QSelect.SQL.Add('  TRC_DT_VERIFICADO,');
    QSelect.SQL.Add('  CHQ_CODIGO,');
    QSelect.SQL.Add('  CNC_CHEQUE,');
    QSelect.SQL.Add('  CNC_MOVIMENTO_CONTA_CORRENTE,');
    QSelect.SQL.Add('  MCC_CODIGO,');
    QSelect.SQL.Add('  TRC_PAGAMENTO_PARCIAL,');
    QSelect.SQL.Add('  TRC_CHEQUE_DEVOLVIDO,');
    QSelect.SQL.Add('  TRC_CV,');
    QSelect.SQL.Add('  TRC_LOCAL,');
    QSelect.SQL.Add('  TRF_CODIGO,');
    QSelect.SQL.Add('  FUN_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TITULO_A_RECEBER');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'TRC'                                                                                                                + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('AGF_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CCX_CODIGO').AsString)                                                              + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('TRC_NUMERO').AsString)))                                           + delimitador +
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('TRC_SEQUENCIA').AsString)))                                        + delimitador +(*TAM = 20*)
        PreencheEsq(TAM_INT,FieldByName('CLI_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_VENCIMENTO').AsDateTime))            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TRC_VALOR').AsString))                                                  + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_PAGAMENTO').AsDateTime))             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TRC_VALOR_PAGO').AsString))                                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_SITUACAO').AsString)                                                            + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('TRC_OBSERVACAO').AsString)))                                      + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('TRC_CUSTODIA').AsString)))                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_TIPO_DOC').AsString)                                                            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TRC_CRED_CLI').AsString))                                               + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_TIPO_PAG').AsString)                                                            + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CLIENTE').AsString)                                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_TITULOANT').AsString)                                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('BOL_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_TRCORIGINAL').AsString)                                                         + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_DTORIGINAL').AsDateTime))            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_DT_ALTERADO').AsDateTime))           + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_RGB_DT_INICIO').AsDateTime))         + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_RGB_DT_SITUACAO').AsDateTime))       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CPC_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_RGB_SITUACAO').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_RGB_VISITADO').AsString)                                                        + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_RGB_DT_PROMESSA').AsDateTime))       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_PROCESSO').AsString)                                                            + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_RGB_DT_VISITADO').AsDateTime))       + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CCX_CODIGO_REC').AsString)                                                          + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('TRC_GEROU_MOVIMENTO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_NOTA_SERVICO').AsString)                                                        + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_DT_CADASTRO').AsDateTime))           + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TRC_DESCONTO').AsString))                                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TRC_JUROS').AsString))                                                  + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_ORIGEM').AsString)                                                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_PEDIDO_SERVICO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_TIPO_PEDIDO').AsString)                                                         + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_DT_EMISSAO_BOLETO').AsDateTime))     + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_DT_RECEBIMENTO_BOLETO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPE_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_FATURAMENTO_PENDENTE').AsString)                                              + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_DT_COMPETENCIA').AsDateTime))        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_EQUIFAX').AsString)                                                             + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_DT_EQUIFAX').AsDateTime))            + delimitador +
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('TRC_AGENCIA_NUMERO').AsString)))                                   + delimitador +(*TAM = 20*)
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_DT_CHEQUE').AsDateTime))             + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('TRC_SIT_CHEQUE').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TRC_REABERTURA').AsString)                                                          + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('TRC_VERIFICADO').AsString)                                                        + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TRC_DT_VERIFICADO').AsDateTime))         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CHEQUE').AsString)                                                            + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_MOVIMENTO_CONTA_CORRENTE').AsString)                                          + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MCC_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('TRC_PAGAMENTO_PARCIAL').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('TRC_CHEQUE_DEVOLVIDO').AsString)                                                  + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('TRC_CV').AsString)))                                               + delimitador +
        PreencheDir(CHAR_50,Trim(RetiraAspas(FieldByName('TRC_LOCAL').AsString)))                                            + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_INT,FieldByName('TRF_CODIGO').AsString)                                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                              + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'TITULO_A_RECEBER.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_AGF(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (AGF_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR AGF_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  AGENTE_FINANCEIRO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  AGF_CODIGO,');
    QSelect.SQL.Add('  AGF_DESCRICAO,');
    QSelect.SQL.Add('  AGF_TAXA_ADM,');
    QSelect.SQL.Add('  AGF_JUROS,');
    QSelect.SQL.Add('  AGF_DIA_PAGAMENTO,');
    QSelect.SQL.Add('  AGF_ANTECIPACAO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  AGF_DT_ALTERADO,');
    QSelect.SQL.Add('  AGF_DT_CADASTRO,');
    QSelect.SQL.Add('  AGF_JUROS_ENTRADA,');
    QSelect.SQL.Add('  AGF_CONTABIL_1,');
    QSelect.SQL.Add('  AGF_CONTABIL_2,');
    QSelect.SQL.Add('  AGF_CONTABIL_3,');
    QSelect.SQL.Add('  AGF_CONTABIL_4,');
    QSelect.SQL.Add('  AGF_HISTORICO_CONTABIL,');
    QSelect.SQL.Add('  AGF_LIBERAR_DESCONTO_FPG,');
    QSelect.SQL.Add('  AGF_SITUACAO,');
    QSelect.SQL.Add('  AGF_ESPECIAL,');
    QSelect.SQL.Add('  AGF_OBSERVACAO,');
    QSelect.SQL.Add('  AGF_REC_AVISTA,');
    QSelect.SQL.Add('  AGF_TAXA_MENSAL,');
    QSelect.SQL.Add('  AGF_TIPOPAG_EXCLUSIVO,');
    QSelect.SQL.Add('  AGF_CENTAVOS_ENTRADA');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  AGENTE_FINANCEIRO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'AGF'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('AGF_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('AGF_DESCRICAO').AsString)))                              + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('AGF_TAXA_ADM').AsString))                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('AGF_JUROS').AsString))                                        + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('AGF_DIA_PAGAMENTO').AsString)                                           + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('AGF_ANTECIPACAO').AsString))                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('AGF_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('AGF_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('AGF_JUROS_ENTRADA').AsString)                                           + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('AGF_CONTABIL_1').AsString)))                             + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('AGF_CONTABIL_2').AsString)))                             + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('AGF_CONTABIL_3').AsString)))                             + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('AGF_CONTABIL_4').AsString)))                             + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('AGF_HISTORICO_CONTABIL').AsString)))                     + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('AGF_LIBERAR_DESCONTO_FPG').AsString)                                    + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('AGF_SITUACAO').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('AGF_ESPECIAL').AsString)                                                + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('AGF_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT_2,FieldByName('AGF_REC_AVISTA').AsString)                                              + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('AGF_TAXA_MENSAL').AsString))                                  + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('AGF_TIPOPAG_EXCLUSIVO').AsString)                                       + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('AGF_CENTAVOS_ENTRADA').AsString)                                        + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'AGENTE_FINANCEIRO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_CCX(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (CCX_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR CCX_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CONTA_DE_CAIXA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  CCX_CODIGO,');
    QSelect.SQL.Add('  CCX_DC,');
    QSelect.SQL.Add('  CCX_DESCRICAO,');
    QSelect.SQL.Add('  CCX_LIMITE_GASTO,');
    QSelect.SQL.Add('  CCX_DISPONIVEL,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  CCX_DT_ALTERADO,');
    QSelect.SQL.Add('  CCX_CONTABIL_1,');
    QSelect.SQL.Add('  CCX_CONTABIL_2,');
    QSelect.SQL.Add('  CCX_VISUALIZAR_FINANCEIRO,');
    QSelect.SQL.Add('  CCX_VISUALIZAR_CAIXA,');
    QSelect.SQL.Add('  CCX_HISTORICO_CONTABIL,');
    QSelect.SQL.Add('  CCX_AVULSO,');
    QSelect.SQL.Add('  CCX_DT_CADASTRO,');
    QSelect.SQL.Add('  CCX_CONTABIL_3,');
    QSelect.SQL.Add('  CCX_CONTABIL_4,');
    QSelect.SQL.Add('  CCX_GRUPO,');
    QSelect.SQL.Add('  CCX_OBSERVACAO,');
    QSelect.SQL.Add('  CCX_SITUACAO,');
    QSelect.SQL.Add('  ACC_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CONTA_DE_CAIXA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'CCX'                                                                                                     + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CCX_CODIGO').AsString)                                                   + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CCX_DC').AsString)))                                    + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CCX_DESCRICAO').AsString)))                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('CCX_LIMITE_GASTO').AsString))                                + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('CCX_DISPONIVEL').AsString))                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CCX_DT_ALTERADO').AsDateTime))+ delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CCX_CONTABIL_1').AsString)))                            + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CCX_CONTABIL_2').AsString)))                            + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CCX_VISUALIZAR_FINANCEIRO').AsString)                                  + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CCX_VISUALIZAR_CAIXA').AsString)                                       + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CCX_HISTORICO_CONTABIL').AsString)))                    + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CCX_AVULSO').AsString)                                                 + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CCX_DT_CADASTRO').AsDateTime))+ delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CCX_CONTABIL_3').AsString)))                            + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CCX_CONTABIL_4').AsString)))                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CCX_GRUPO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('CCX_OBSERVACAO').AsString)))                           + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT_2,FieldByName('CCX_SITUACAO').AsString)                                               + delimitador +
        PreencheEsq(TAM_INT,FieldByName('ACC_CODIGO').AsString)                                                   + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'CONTA_DE_CAIXA.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_CHQ(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (CHQ_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR CHQ_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;
  
  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CHEQUE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  CHQ_CODIGO,');
    QSelect.SQL.Add('  CHQ_NUMERO,');
    QSelect.SQL.Add('  CHQ_VALOR,');
    QSelect.SQL.Add('  CHQ_DATA,');
    QSelect.SQL.Add('  CHQ_ER,');
    QSelect.SQL.Add('  CHQ_SITUACAO,');
    QSelect.SQL.Add('  CBN_NUMERO,');
    QSelect.SQL.Add('  CHQ_OBSERVACAO,');
    QSelect.SQL.Add('  CHQ_CNC_TITULO,');
    QSelect.SQL.Add('  BNC_NUMERO,');
    QSelect.SQL.Add('  AGN_NUMERO,');
    QSelect.SQL.Add('  CHQ_COD_TITULO,');
    QSelect.SQL.Add('  CHQ_TERCEIRO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  CHQ_DT_ALTERADO,');
    QSelect.SQL.Add('  CHQ_DT_CADASTRO,');
    QSelect.SQL.Add('  CHQ_NOMINAL,');
    QSelect.SQL.Add('  CHQ_DONO_CHEQUE,');
    QSelect.SQL.Add('  CHQ_COMP,');
    QSelect.SQL.Add('  CHQ_BANCO,');
    QSelect.SQL.Add('  CHQ_AGENCIA,');
    QSelect.SQL.Add('  CHQ_C1,');
    QSelect.SQL.Add('  CHQ_CONTA,');
    QSelect.SQL.Add('  CHQ_C2,');
    QSelect.SQL.Add('  CHQ_C3,');
    QSelect.SQL.Add('  CHQ_CODIGO_BARRAS,');
    QSelect.SQL.Add('  CHQ_ENVIADO,');
    QSelect.SQL.Add('  CHQ_DT_ENVIADO,');
    QSelect.SQL.Add('  CHQ_UTILIZADO,');
    QSelect.SQL.Add('  CNC_CLIENTE,');
    QSelect.SQL.Add('  CLI_CODIGO,');
    QSelect.SQL.Add('  CNC_FACTORING,');
    QSelect.SQL.Add('  FCT_CODIGO,');
    QSelect.SQL.Add('  CHQ_CPF_CNPJ');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CHEQUE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'CHQ'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CHQ_NUMERO').AsString)))                                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('CHQ_VALOR').AsString))                                        + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CHQ_DATA').AsDateTime))        + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CHQ_ER').AsString)))                                     + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CHQ_SITUACAO').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CBN_NUMERO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('CHQ_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT_3,FieldByName('CHQ_CNC_TITULO').AsString)                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('BNC_NUMERO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('AGN_NUMERO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_COD_TITULO').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_TERCEIRO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CHQ_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CHQ_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CHQ_NOMINAL').AsString)))                                + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CHQ_DONO_CHEQUE').AsString)))                            + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_INT,FieldByName('CHQ_COMP').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_BANCO').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_AGENCIA').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_C1').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_CONTA').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_C2').AsString)                                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_C3').AsString)                                                        + delimitador +
        PreencheDir(CHAR_50,Trim(RetiraAspas(FieldByName('CHQ_CODIGO_BARRAS').AsString)))                          + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_INT_2,FieldByName('CHQ_ENVIADO').AsString)                                                 + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CHQ_DT_ENVIADO').AsDateTime))  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CHQ_UTILIZADO').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CLIENTE').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNC_FACTORING').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FCT_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CHQ_CPF_CNPJ').AsString)))                               + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'CHEQUE.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_CNC(QSelect: TADOQuery; pBar: TGauge);

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CENTRO_DE_CUSTO');
    QSelect.SQL.Add('WHERE 1=1');
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  CNC_RZ_SOCIAL,');
    QSelect.SQL.Add('  CNC_NOME_FAN,');
    QSelect.SQL.Add('  CNC_CGC,');
    QSelect.SQL.Add('  CNC_IE,');
    QSelect.SQL.Add('  CNC_LOGRADOURO,');
    QSelect.SQL.Add('  CNC_ENDERECO,');
    QSelect.SQL.Add('  CNC_BAIRRO,');
    QSelect.SQL.Add('  CNC_CIDADE,');
    QSelect.SQL.Add('  CNC_UF,');
    QSelect.SQL.Add('  CNC_CEP,');
    QSelect.SQL.Add('  CNC_FONE,');
    QSelect.SQL.Add('  CNC_FAX,');
    QSelect.SQL.Add('  CNC_EMAIL,');
    QSelect.SQL.Add('  CNC_SITE,');
    QSelect.SQL.Add('  CNC_RECEBE_DADOS,');
    QSelect.SQL.Add('  CNC_META_QUINZENA_1,');
    QSelect.SQL.Add('  CNC_META_QUINZENA_2,');
    QSelect.SQL.Add('  CNC_IP,');
    QSelect.SQL.Add('  CNC_OBSERVACAO,');
    QSelect.SQL.Add('  CNC_EXTERNO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CENTRO_DE_CUSTO');
    QSelect.SQL.Add('WHERE 1=1');
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'CNC'                                                                           + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                       + delimitador +
        PreencheDir(CHAR_60,Trim(RetiraAspas(FieldByName('CNC_RZ_SOCIAL').AsString)))   + delimitador +
        PreencheDir(CHAR_60,Trim(RetiraAspas(FieldByName('CNC_NOME_FAN').AsString)))    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CNC_CGC').AsString)))         + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CNC_IE').AsString)))          + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CNC_LOGRADOURO').AsString)                     + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CNC_ENDERECO').AsString)))    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CNC_BAIRRO').AsString)))      + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CNC_CIDADE').AsString)))      + delimitador +
        PreencheDir(CHAR_2,Trim(RetiraAspas(FieldByName('CNC_UF').AsString)))           + delimitador +(*TAM = 20*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CNC_CEP').AsString)))         + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CNC_FONE').AsString)))        + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('CNC_FAX').AsString)))         + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CNC_EMAIL').AsString)))       + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CNC_SITE').AsString)))        + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_INT_2,FieldByName('CNC_RECEBE_DADOS').AsString)                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('CNC_META_QUINZENA_1').AsString))   + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('CNC_META_QUINZENA_2').AsString))   + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CNC_IP').AsString)))          + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('CNC_OBSERVACAO').AsString))) + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('CNC_EXTERNO').AsString)                        + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'CENTRO_DE_CUSTO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_CNF(QSelect: TADOQuery; pBar: TGauge);

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CONFIGURACAO');
    QSelect.SQL.Add('WHERE 1=1');
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  CNF_CODIGO,');
    QSelect.SQL.Add('  CNF_TAXAJUROS,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  CNF_VLMORA,');
    QSelect.SQL.Add('  CNF_COD_ULT_REC,');
    QSelect.SQL.Add('  CNF_CONT_REC_CLI,');
    QSelect.SQL.Add('  CNF_CONT_PAG_FOR,');
    QSelect.SQL.Add('  CNF_JUR_NORM,');
    QSelect.SQL.Add('  CNF_JUR_ESP,');
    QSelect.SQL.Add('  CNF_CONT_PAG_VEN,');
    QSelect.SQL.Add('  DIAS_RESERV,');
    QSelect.SQL.Add('  CNC_CODIGO_ULT,');
    //QSelect.SQL.Add('  DATA,');
    QSelect.SQL.Add('  CNF_QNT_DIAS_DEV,');
    QSelect.SQL.Add('  CNC_DEPOSITO,');
    QSelect.SQL.Add('  CNF_QNT_DIAS_SEM_JUROS,');
    QSelect.SQL.Add('  CNF_JUR_NORM_PAG,');
    QSelect.SQL.Add('  CNF_JUR_ESP_PAG,');
    QSelect.SQL.Add('  CNF_SQL,');
    QSelect.SQL.Add('  EXPORTAR,');
    QSelect.SQL.Add('  GERARLOG,');
    QSelect.SQL.Add('  CNF_LOJACOD,');
    QSelect.SQL.Add('  CNF_LOJANOME,');
    QSelect.SQL.Add('  CNF_VERIFICA_ESTOQUE,');
    QSelect.SQL.Add('  CNF_CONT_ABER_CX,');
    QSelect.SQL.Add('  CNF_CONT_FECH_CX,');
    QSelect.SQL.Add('  CNF_CLI_A_VISTA,');
    QSelect.SQL.Add('  CNF_MENSAGEMCUPOM,');
    QSelect.SQL.Add('  CNF_MELHORDATA,');
    QSelect.SQL.Add('  CNF_POPUPMENU,');
    QSelect.SQL.Add('  CNF_CPD,');
    QSelect.SQL.Add('  CNF_MENSAGEMRODAPE,');
    QSelect.SQL.Add('  CNF_CONT_PAG_TRN,');
    QSelect.SQL.Add('  CNF_CONTROLE_TRANSACAO,');
    QSelect.SQL.Add('  CNF_ENVIAR_SPC,');
    QSelect.SQL.Add('  CNF_CIDADE,');
    QSelect.SQL.Add('  CNF_UF,');
    QSelect.SQL.Add('  CNF_CONT_REC_CLI_ANT,');
    QSelect.SQL.Add('  CNF_TIPO_DOCUMENTO,');
    QSelect.SQL.Add('  CNF_LBM_DESC_60,');
    QSelect.SQL.Add('  CNF_LBM_JUROS_60,');
    QSelect.SQL.Add('  CNF_CONT_REC_SERVICO,');
    QSelect.SQL.Add('  CNF_PERCENTUAL_CUSTO,');
    QSelect.SQL.Add('  CNF_PERCENTUAL_LUCRO,');
    QSelect.SQL.Add('  CNF_NFERRAMENTA,');
    QSelect.SQL.Add('  CNF_VERSAO_BASE,');
    QSelect.SQL.Add('  CNF_ALIQUOTA_ISS,');
    QSelect.SQL.Add('  CNF_CONT_FACTORING,');
    QSelect.SQL.Add('  CNF_IGNORAR_CHEQUES,');
    QSelect.SQL.Add('  CNF_DIAS_VENDA_INADIPLENTE,');
    QSelect.SQL.Add('  CNF_LIMITE_CREDITO_BASICO,');
    QSelect.SQL.Add('  CNF_CUSTO_OPERACIONAL,');
    QSelect.SQL.Add('  CNF_CUSTO_OPERACIONAL_LJ3,');
    QSelect.SQL.Add('  CNF_IGNORAR_DEPOSITOS,');
    QSelect.SQL.Add('  CNF_LIMITE_MEDIA_VENDA,');
    QSelect.SQL.Add('  CNF_CONT_TRANSFERE,');
    QSelect.SQL.Add('  CNF_PIS,');
    QSelect.SQL.Add('  CNF_COFINS,');
    QSelect.SQL.Add('  CNF_VERSAO_INCLUIROPER,');
    QSelect.SQL.Add('  CNF_GRUPO_REPASSE,');
    QSelect.SQL.Add('  CNF_PRD_REF_UNICA,');
    QSelect.SQL.Add('  CNF_QNT_DIAS_SEM_COBRA,');
    QSelect.SQL.Add('  CNF_ESTOQUE_DETALHADO,');
    QSelect.SQL.Add('  CNF_CPMF,');
    QSelect.SQL.Add('  CNF_COBRANCA,');
    QSelect.SQL.Add('  CNF_CCX_VERIFICA_CAIXA,');
    QSelect.SQL.Add('  CNF_LABORATORIO,');
    QSelect.SQL.Add('  CNF_MONTAGEM,');
    QSelect.SQL.Add('  CNF_LAB_META,');
    QSelect.SQL.Add('  CNF_LAB_COTA1,');
    QSelect.SQL.Add('  CNF_LAB_COTA2,');
    QSelect.SQL.Add('  CNF_LIM_DESC_JR_SIMPLES,');
    QSelect.SQL.Add('  CNF_LIM_DESC_JR_ESPECIAL,');
    QSelect.SQL.Add('  CNF_MONT_META,');
    QSelect.SQL.Add('  CNF_MONT_COTA1,');
    QSelect.SQL.Add('  CNF_MONT_COTA2,');
    QSelect.SQL.Add('  CNF_MAGAZINE,');
    QSelect.SQL.Add('  CNF_AVISTA,');
    QSelect.SQL.Add('  CNF_CHEQUE,');
    QSelect.SQL.Add('  CNF_CCREDITO,');
    QSelect.SQL.Add('  CNF_CARNE,');
    QSelect.SQL.Add('  CNF_BOLETO,');
    QSelect.SQL.Add('  CNF_QUALCPD,');
    QSelect.SQL.Add('  CNF_NFE,');
    QSelect.SQL.Add('  CNF_ESTOQUE_IDEAL,');
    QSelect.SQL.Add('  CNF_FTP_URL,');
    QSelect.SQL.Add('  CNF_FTP_USUARIO,');
    QSelect.SQL.Add('  CNF_FTP_SENHA,');
    QSelect.SQL.Add('  CNF_FTP_PASSIVO,');
    QSelect.SQL.Add('  CNF_ARQUIVO_PRINCIPAL,');
    QSelect.SQL.Add('  CNF_ARQUIVO_CHAVE');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CONFIGURACAO');
    QSelect.SQL.Add('WHERE 1=1');
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'CNF'                                                                                    + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNF_CODIGO').AsString)                                + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_TAXAJUROS').AsString))                + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('USU_CODIGO').AsString)                                + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_VLMORA').AsString))                   + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_COD_ULT_REC').AsString)                           + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CONT_REC_CLI').AsString)                          + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CONT_PAG_FOR').AsString)                          + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_JUR_NORM').AsString))                 + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_JUR_ESP').AsString))                  + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CONT_PAG_VEN').AsString)                          + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('DIAS_RESERV').AsString)                               + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO_ULT').AsString)                            + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_QNT_DIAS_DEV').AsString)                          + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_DEPOSITO').AsString)                              + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_QNT_DIAS_SEM_JUROS').AsString)                    + delimitador +
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('CNF_JUR_NORM_PAG').AsString)))         + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_10,Trim(RetiraAspas(FieldByName('CNF_JUR_ESP_PAG').AsString)))          + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT_3,FieldByName('CNF_SQL').AsString)                                   + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('EXPORTAR').AsString)                                  + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('GERARLOG').AsString)                                  + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNF_LOJACOD').AsString)                               + delimitador +
        PreencheEsq(CHAR_30,FieldByName('CNF_LOJANOME').AsString)                                + delimitador +(*TAM = 60*)
        PreencheEsq(TAM_INT_2,FieldByName('CNF_VERIFICA_ESTOQUE').AsString)                      + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CONT_ABER_CX').AsString)                          + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CONT_FECH_CX').AsString)                          + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CLI_A_VISTA').AsString)                           + delimitador +
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('CNF_MENSAGEMCUPOM').AsString)))        + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT_2,FieldByName('CNF_MELHORDATA').AsString)                            + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CNF_POPUPMENU').AsString)                             + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CNF_CPD').AsString)                                   + delimitador +
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('CNF_MENSAGEMRODAPE').AsString)))       + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT_2,FieldByName('CNF_CONT_PAG_TRN').AsString)                          + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CNF_CONTROLE_TRANSACAO').AsString)                    + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CNF_ENVIAR_SPC').AsString)                            + delimitador +
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CNF_CIDADE').AsString)))               + delimitador +(*TAM = 50*)
        PreencheDir(CHAR_2,Trim(RetiraAspas(FieldByName('CNF_UF').AsString)))                    + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CONT_REC_CLI_ANT').AsString)                      + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_TIPO_DOCUMENTO').AsString)                        + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_LBM_DESC_60').AsString))              + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_LBM_JUROS_60').AsString))             + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CONT_REC_SERVICO').AsString)                      + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_PERCENTUAL_CUSTO').AsString))         + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_PERCENTUAL_LUCRO').AsString))         + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_NFERRAMENTA').AsString))              + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNF_VERSAO_BASE').AsString)                           + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_ALIQUOTA_ISS').AsString))             + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CONT_FACTORING').AsString)                        + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_IGNORAR_CHEQUES').AsString)                       + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_DIAS_VENDA_INADIPLENTE').AsString)                + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_LIMITE_CREDITO_BASICO').AsString))    + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_CUSTO_OPERACIONAL').AsString))        + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_CUSTO_OPERACIONAL_LJ3').AsString))    + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_IGNORAR_DEPOSITOS').AsString)                     + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_LIMITE_MEDIA_VENDA').AsString)                    + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CONT_TRANSFERE').AsString)                        + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_PIS').AsString))                      + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_COFINS').AsString))                   + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_VERSAO_INCLUIROPER').AsString)                    + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_GRUPO_REPASSE').AsString)                         + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_PRD_REF_UNICA').AsString)                         + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_QNT_DIAS_SEM_COBRA').AsString)                    + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_ESTOQUE_DETALHADO').AsString)                     + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_CPMF').AsString))                     + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_COBRANCA').AsString)                              + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CCX_VERIFICA_CAIXA').AsString)                    + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_LABORATORIO').AsString)                           + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_MONTAGEM').AsString)                              + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_LAB_META').AsString))                 + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_LAB_COTA1').AsString))                + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_LAB_COTA2').AsString))                + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_LIM_DESC_JR_SIMPLES').AsString))      + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_LIM_DESC_JR_ESPECIAL').AsString))     + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_MONT_META').AsString))                + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_MONT_COTA1').AsString))               + delimitador +
        PreencheEsq(TAM_FLOAT_5,VirgPonto(FieldByName('CNF_MONT_COTA2').AsString))               + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_MAGAZINE').AsString)                              + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_AVISTA').AsString)                                + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CHEQUE').AsString)                                + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CCREDITO').AsString)                              + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_CARNE').AsString)                                 + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_BOLETO').AsString)                                + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_QUALCPD').AsString)                               + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_NFE').AsString)                                   + delimitador +
        PreencheEsq(TAM_INT_4,FieldByName('CNF_ESTOQUE_IDEAL').AsString)                         + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('CNF_FTP_URL').AsString)))              + delimitador +(*TAM = 150*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CNF_FTP_USUARIO').AsString)))          + delimitador +(*TAM = 50*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CNF_FTP_SENHA').AsString)))            + delimitador +(*TAM = 50*)
        PreencheDir(CHAR_1,Trim(RetiraAspas(FieldByName('CNF_FTP_PASSIVO').AsString)))           + delimitador +
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CNF_ARQUIVO_PRINCIPAL').AsString)))    + delimitador +(*TAM = 150*)
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('CNF_ARQUIVO_CHAVE').AsString)))        + delimitador );(*TAM = 150*)
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'CONFIGURACAO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_CSG(QSelect, QSelectItem: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (CSG_DATA >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR CSG_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CONSIGNACAO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  CSG_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  FUN_CODIGO,');
    QSelect.SQL.Add('  CSG_DATA,');
    QSelect.SQL.Add('  CSG_DT_ALTERADO,');
    QSelect.SQL.Add('  CSG_VALOR,');
    QSelect.SQL.Add('  CSG_SITUACAO,');
    QSelect.SQL.Add('  CSG_OBSERVACAO,');
    QSelect.SQL.Add('  CLI_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CONSIGNACAO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  function subSQLitem(iCod: integer): boolean;
  begin
    QSelectItem.Close;
    QSelectItem.SQL.Clear;
    QSelectItem.SQL.Add('SELECT');
    QSelectItem.SQL.Add('  CNC_CODIGO,');
    QSelectItem.SQL.Add('  CSG_CODIGO,');
    QSelectItem.SQL.Add('  ICS_CODIGO,');
    QSelectItem.SQL.Add('  PRD_CODIGO,');
    QSelectItem.SQL.Add('  USU_CODIGO,');
    QSelectItem.SQL.Add('  ICS_DATA,');
    QSelectItem.SQL.Add('  ICS_QUANTIDADE,');
    QSelectItem.SQL.Add('  ICS_VALOR,');
    QSelectItem.SQL.Add('  ICS_OBSERVACAO');
    QSelectItem.SQL.Add('FROM');
    QSelectItem.SQL.Add('  ITEM_DE_CONSIGNACAO');
    QSelectItem.SQL.Add('WHERE 1=1');
    QSelectItem.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelectItem.SQL.Add('  AND CSG_CODIGO = ' + IntToStr(iCod));
    QSelectItem.Open;
    result := not QSelectItem.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'CSG'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CSG_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CSG_DATA').AsDateTime))        + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CSG_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('CSG_VALOR').AsString))                                        + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CSG_SITUACAO').AsString)                                                + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('CSG_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('CLI_CODIGO').AsString)                                                    + delimitador );
    end;
  end;

  procedure subAddItem;
  begin
    with QSelectItem do
    begin
      Arquivo.Add(
        'ICS'                                                                                               + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                           + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CSG_CODIGO').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('ICS_CODIGO').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                             + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('ICS_DATA').AsDateTime)) + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('ICS_QUANTIDADE').AsString))                            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('ICS_VALOR').AsString))                                 + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('ICS_OBSERVACAO').AsString)))                     + delimitador );(*TAM = 255*)
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;

      if subSQLitem(QSelect.FieldByName('CSG_CODIGO').AsInteger) then
      begin
        QSelectItem.First;
        while not QSelectItem.Eof do
        begin
          subAddItem;
          QSelectItem.Next;
        end;
      end;

      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'CONSIGNACAO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_DPV(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (DPV_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR DPV_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  DETALHE_DE_PEDIDO_DE_VENDA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  PDV_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  DPV_DT_CADASTRO,');
    QSelect.SQL.Add('  DPV_DT_ALTERADO,');
    QSelect.SQL.Add('  DPV_TIPO_ARMACAO,');
    QSelect.SQL.Add('  DPV_OBS_ARMACAO,');
    QSelect.SQL.Add('  DPV_TIPO_LENTES,');
    QSelect.SQL.Add('  DPV_OBS_LENTES,');
    QSelect.SQL.Add('  DPV_MEDICO_CRM,');
    QSelect.SQL.Add('  DPV_MEDICO_NOME,');
    QSelect.SQL.Add('  DPV_MEDICO_FONE,');
    QSelect.SQL.Add('  DPV_OD_ESF,');
    QSelect.SQL.Add('  DPV_OE_ESF,');
    QSelect.SQL.Add('  DPV_OD_CIL,');
    QSelect.SQL.Add('  DPV_OE_CIL,');
    QSelect.SQL.Add('  DPV_OD_EIXO,');
    QSelect.SQL.Add('  DPV_OE_EIXO,');
    QSelect.SQL.Add('  DPV_OD_DNP,');
    QSelect.SQL.Add('  DPV_OE_DNP,');
    QSelect.SQL.Add('  DPV_OD_ALT,');
    QSelect.SQL.Add('  DPV_OE_ALT,');
    QSelect.SQL.Add('  DPV_OD_ADICAO,');
    QSelect.SQL.Add('  DPV_OE_ADICAO,');
    QSelect.SQL.Add('  DPV_SITUACAO,');
    QSelect.SQL.Add('  DPV_OBSERVACAO,');
    QSelect.SQL.Add('  FUN_CODIGO_1,');
    QSelect.SQL.Add('  FUN_CODIGO_2,');
    QSelect.SQL.Add('  DPV_COMISSAO_1,');
    QSelect.SQL.Add('  DPV_COMISSAO_2,');
    QSelect.SQL.Add('  DPV_MEIO,');
    QSelect.SQL.Add('  DPV_MEIO_OUTRO,');
    QSelect.SQL.Add('  DPV_PASCIENTE');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  DETALHE_DE_PEDIDO_DE_VENDA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'DPV'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('DPV_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('DPV_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('DPV_TIPO_ARMACAO').AsString)))                           + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('DPV_OBS_ARMACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('DPV_TIPO_LENTES').AsString)))                            + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('DPV_OBS_LENTES').AsString)) )                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('DPV_MEDICO_CRM').AsString)                                                + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('DPV_MEDICO_NOME').AsString)))                            + delimitador +(*TAM = 60*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('DPV_MEDICO_FONE').AsString)))                            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OD_ESF').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OE_ESF').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OD_CIL').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OE_CIL').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OD_EIXO').AsString))                                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OE_EIXO').AsString))                                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OD_DNP').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OD_DNP').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OD_ALT').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OE_ALT').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OD_ADICAO').AsString))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_OE_ADICAO').AsString))                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('DPV_SITUACAO').AsString)                                                  + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('DPV_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO_1').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO_2').AsString)                                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_COMISSAO_1').AsString))                                   + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('DPV_COMISSAO_2').AsString))                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('DPV_MEIO').AsString)                                                      + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('DPV_MEIO_OUTRO').AsString)))                             + delimitador +(*TAM = 60*)
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('DPV_PASCIENTE').AsString)))                              + delimitador );(*TAM = 60*)
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'DETALHE_DE_PEDIDO_DE_VENDA.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_FAF(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (FAF_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR FAF_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FATOR_DE_FINANCEIRA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  FAF_CODIGO,');
    QSelect.SQL.Add('  AGF_CODIGO,');
    QSelect.SQL.Add('  FAF_NPARC,');
    QSelect.SQL.Add('  FAF_FATOR,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  FAF_DT_ALTERADO,');
    QSelect.SQL.Add('  FAF_DT_CADASTRO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FATOR_DE_FINANCEIRA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'FAF'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FAF_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('AGF_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FAF_NPARC').AsString)                                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('FAF_FATOR').AsString))                                        + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('FAF_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('FAF_DT_CADASTRO').AsDateTime)) + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'FATOR_DE_FINANCEIRA.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_FOR(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (FOR_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR FOR_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FORNECEDOR');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  FOR_CODIGO,');
    QSelect.SQL.Add('  FOR_RZ_SOCIAL,');
    QSelect.SQL.Add('  FOR_NOME_FAN,');
    QSelect.SQL.Add('  FOR_CGC,');
    QSelect.SQL.Add('  FOR_IE,');
    QSelect.SQL.Add('  FOR_LOGRADOURO,');
    QSelect.SQL.Add('  FOR_ENDERECO,');
    QSelect.SQL.Add('  FOR_BAIRRO,');
    QSelect.SQL.Add('  FOR_CIDADE,');
    QSelect.SQL.Add('  FOR_UF,');
    QSelect.SQL.Add('  FOR_CEP,');
    QSelect.SQL.Add('  FOR_FONE,');
    QSelect.SQL.Add('  FOR_SITUACAO,');
    QSelect.SQL.Add('  FOR_OBSERVACAO1,');
    QSelect.SQL.Add('  FOR_FAX,');
    QSelect.SQL.Add('  FOR_SITE,');
    QSelect.SQL.Add('  FOR_EMAIL,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  FOR_DT_ALTERADO,');
    QSelect.SQL.Add('  PCP_CONHECIMENTO,');
    QSelect.SQL.Add('  FOR_DT_CADASTRO,');
    QSelect.SQL.Add('  CCX_CODIGO,');
    QSelect.SQL.Add('  FOR_MAX_ITENS_NOTA,');
    QSelect.SQL.Add('  FOR_MARCA,');
    QSelect.SQL.Add('  FOR_REDUCAO_ICMS,');
    QSelect.SQL.Add('  FOR_BANCO,');
    QSelect.SQL.Add('  FOR_NUMERO_AGENCIA,');
    QSelect.SQL.Add('  FOR_NUMERO_CONTA');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FORNECEDOR');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'FOR'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FOR_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_60,Trim(RetiraAspas(FieldByName('FOR_RZ_SOCIAL').AsString)))                              + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('FOR_NOME_FAN').AsString)))                               + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FOR_CGC').AsString)))                                    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FOR_IE').AsString)))                                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FOR_LOGRADOURO').AsString)                                                + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('FOR_ENDERECO').AsString)))                               + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FOR_BAIRRO').AsString)))                                 + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FOR_CIDADE').AsString)))                                 + delimitador +
        PreencheDir(CHAR_2,Trim(RetiraAspas(FieldByName('FOR_UF').AsString)))                                      + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FOR_CEP').AsString)))                                    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FOR_FONE').AsString)))                                   + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('FOR_SITUACAO').AsString)                                                + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('FOR_OBSERVACAO1').AsString)))                           + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FOR_FAX').AsString)))                                    + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('FOR_SITE').AsString)))                                   + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('FOR_EMAIL').AsString)))                                  + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('FOR_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PCP_CONHECIMENTO').AsString)                                              + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('FOR_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CCX_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FOR_MAX_ITENS_NOTA').AsString)                                            + delimitador +
        PreencheDir(CHAR_50,Trim(RetiraAspas(FieldByName('FOR_MARCA').AsString)))                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('FOR_REDUCAO_ICMS').AsString))                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FOR_BANCO').AsString)                                                     + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FOR_NUMERO_AGENCIA').AsString)))                         + delimitador +(*TAM = 40*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FOR_NUMERO_CONTA').AsString)))                           + delimitador );(*TAM = 40*)
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'FORNECEDOR.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_FPG(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (FPG_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR FPG_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FORMA_DE_PAGAMENTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;
  
  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  FPG_CODIGO,');
    QSelect.SQL.Add('  FPG_PRAZO,');
    QSelect.SQL.Add('  FPG_DESCRICAO,');
    QSelect.SQL.Add('  FPG_PRAZO_MEDIO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  FPG_DT_ALTERADO,');
    QSelect.SQL.Add('  FPG_DT_CADASTRO,');
    QSelect.SQL.Add('  FPG_COMPRA,');
    QSelect.SQL.Add('  FPG_SITUACAO,');
    QSelect.SQL.Add('  FPG_DESCONTO,');
    QSelect.SQL.Add('  FPG_TIPOPAG_EXCLUSIVO,');
    QSelect.SQL.Add('  TBP_CODIGO,');
    QSelect.SQL.Add('  FPG_CENTAVOS_ENTRADA');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FORMA_DE_PAGAMENTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'FPG'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPG_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_60,Trim(RetiraAspas(FieldByName('FPG_PRAZO').AsString)))                                  + delimitador +
        PreencheDir(CHAR_60,Trim(RetiraAspas(FieldByName('FPG_DESCRICAO').AsString)))                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPG_PRAZO_MEDIO').AsString)                                               + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('FPG_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('FPG_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPG_COMPRA').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('FPG_SITUACAO').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPG_DESCONTO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPG_TIPOPAG_EXCLUSIVO').AsString)                                         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TBP_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FPG_CENTAVOS_ENTRADA').AsString)                                          + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'FORMA_DE_PAGAMENTO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_FUN(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (FUN_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR FUN_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FUNCIONARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  FUN_CODIGO,');
    QSelect.SQL.Add('  FUN_NOME,');
    QSelect.SQL.Add('  SEC_CODIGO,');
    QSelect.SQL.Add('  FUN_FUNCAO,');
    QSelect.SQL.Add('  FUN_DT_NASC,');
    QSelect.SQL.Add('  FUN_LOGRADOURO,');
    QSelect.SQL.Add('  FUN_ENDERECO,');
    QSelect.SQL.Add('  FUN_BAIRRO,');
    QSelect.SQL.Add('  FUN_CIDADE,');
    QSelect.SQL.Add('  FUN_UF,');
    QSelect.SQL.Add('  FUN_CEP,');
    QSelect.SQL.Add('  FUN_FONE,');
    QSelect.SQL.Add('  FUN_SITUACAO,');
    QSelect.SQL.Add('  FUN_CPF,');
    QSelect.SQL.Add('  FUN_RG,');
    QSelect.SQL.Add('  FUN_COTA,');
    QSelect.SQL.Add('  FUN_PERC_ABAIXO,');
    QSelect.SQL.Add('  FUN_PERC_ACIMA,');
    QSelect.SQL.Add('  FUN_ULT_EMPR,');
    QSelect.SQL.Add('  FUN_REFERENCIA,');
    QSelect.SQL.Add('  FUN_ROTA,');
    QSelect.SQL.Add('  FUN_OBSERVACAO1,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  FUN_DT_ALTERADO,');
    QSelect.SQL.Add('  FUN_APELIDO,');
    QSelect.SQL.Add('  FUN_EMAIL,');
    QSelect.SQL.Add('  FUN_CELULAR,');
    QSelect.SQL.Add('  FUN_USU_CODIGO,');
    QSelect.SQL.Add('  FUN_DT_CADASTRO,');
    QSelect.SQL.Add('  FUN_SUPERIOR,');
    QSelect.SQL.Add('  FUN_PARCEIRO,');
    QSelect.SQL.Add('  FUN_TODOS_CENTROS,');
    QSelect.SQL.Add('  FUN_APARECE_SERVICOS,');
    QSelect.SQL.Add('  FUN_APARECE_VENDAS');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FUNCIONARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'FUN'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('FUN_NOME').AsString)))                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('SEC_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_FUNCAO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('FUN_DT_NASC').AsDateTime))     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_LOGRADOURO').AsString)                                                + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FUN_ENDERECO').AsString)))                               + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FUN_BAIRRO').AsString)))                                 + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FUN_CIDADE').AsString)))                                 + delimitador +
        PreencheDir(CHAR_2,Trim(RetiraAspas(FieldByName('FUN_UF').AsString)))                                      + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FUN_CEP').AsString)))                                    + delimitador +
        PreencheDir(CHAR_20,FieldByName('FUN_FONE').AsString)                                                      + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('FUN_SITUACAO').AsString)                                                + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FUN_CPF').AsString)))                                    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FUN_RG').AsString)))                                     + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('FUN_COTA').AsString))                                         + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('FUN_PERC_ABAIXO').AsString))                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('FUN_PERC_ACIMA').AsString))                                   + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('FUN_ULT_EMPR').AsString)))                              + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('FUN_REFERENCIA').AsString)))                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_ROTA').AsString)                                                      + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('FUN_OBSERVACAO1').AsString)))                           + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('FUN_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheDir(CHAR_50,Trim(RetiraAspas(FieldByName('FUN_APELIDO').AsString)))                                + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('FUN_EMAIL').AsString)))                                  + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('FUN_CELULAR').AsString)))                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_USU_CODIGO').AsString)                                                + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('FUN_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_SUPERIOR').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_PARCEIRO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_TODOS_CENTROS').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_APARECE_SERVICOS').AsString)                                          + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_APARECE_VENDAS').AsString)                                            + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'FUNCIONARIO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_GRP(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (GRP_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR GRP_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  GRUPO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  GRP_CODIGO,');
    QSelect.SQL.Add('  GRP_DESCRICAO,');
    QSelect.SQL.Add('  GRP_OBSERVACAO,');
    QSelect.SQL.Add('  GRP_ESPECIAL,');
    QSelect.SQL.Add('  GRP_SITUACAO,');
    QSelect.SQL.Add('  GRP_DT_CADASTRO,');
    QSelect.SQL.Add('  GRP_DT_ALTERADO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  GRP_SERVICO,');
    QSelect.SQL.Add('  SUG_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  GRUPO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'GRP'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('GRP_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('GRP_DESCRICAO').AsString)))                              + delimitador +
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('GRP_OBSERVACAO').AsString)))                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('GRP_ESPECIAL').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('GRP_SITUACAO').AsString)                                                + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('GRP_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('GRP_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('GRP_SERVICO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('SUG_CODIGO').AsString)                                                    + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'GRUPO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_MCR(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (MCR_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR MCR_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_CREDITO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  MCR_CODIGO,');
    QSelect.SQL.Add('  CLI_CODIGO,');
    QSelect.SQL.Add('  CNC_CLIENTE,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  MCR_DT_CADASTRO,');
    QSelect.SQL.Add('  MCR_DT_ALTERADO,');
    QSelect.SQL.Add('  MCR_DC,');
    QSelect.SQL.Add('  MCR_TIPO,');
    QSelect.SQL.Add('  MCR_VALOR_ANT,');
    QSelect.SQL.Add('  MCR_VALOR,');
    QSelect.SQL.Add('  CNC_ENT_CODIGO,');
    QSelect.SQL.Add('  MCR_ENT_CODIGO,');
    QSelect.SQL.Add('  MCR_SITUACAO,');
    QSelect.SQL.Add('  MCR_OBSERVACAO,');
    QSelect.SQL.Add('  MCR_MAQUINA,');
    QSelect.SQL.Add('  CNC_PEDIDO,');
    QSelect.SQL.Add('  PDV_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_CREDITO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'MCR'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MCR_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CLIENTE').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MCR_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MCR_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheDir(CHAR_1,Trim(RetiraAspas(FieldByName('MCR_DC').AsString)))                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MCR_TIPO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MCR_VALOR_ANT').AsString))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('MCR_VALOR').AsString))                                        + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_ENT_CODIGO').AsString)                                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MCR_ENT_CODIGO').AsString)                                                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MCR_SITUACAO').AsString)                                                  + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('MCR_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('MCR_MAQUINA').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_PEDIDO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_CODIGO').AsString)                                                    + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'MOVIMENTO_DE_CREDITO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_PAR(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (PAR_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR PAR_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PARAMETRO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  TPR_CODIGO,');
    QSelect.SQL.Add('  PAR_CODIGO,');
    QSelect.SQL.Add('  PAR_DESCRICAO,');
    QSelect.SQL.Add('  PAR_SITUACAO,');
    QSelect.SQL.Add('  PAR_DT_CADASTRO,');
    QSelect.SQL.Add('  PAR_DT_ALTERADO,');
    QSelect.SQL.Add('  PAR_INFORMACAO,');
    QSelect.SQL.Add('  PAR_OBSERVACAO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PARAMETRO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'PAR'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPR_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PAR_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('PAR_DESCRICAO').AsString)))                              + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('PAR_SITUACAO').AsString)                                                + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PAR_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PAR_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PAR_INFORMACAO').AsString)                                                + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('PAR_OBSERVACAO').AsString)))                            + delimitador );(*TAM = 255*)
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'PARAMETRO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_PDA(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (PDV_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR PDV_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PEDIDO_AUXILIAR');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  CNC_ORIGEM,');
    QSelect.SQL.Add('  PDV_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  PDV_MAQUINA,');
    QSelect.SQL.Add('  PDV_DT_CADASTRO,');
    QSelect.SQL.Add('  PDV_DT_ALTERADO,');
    QSelect.SQL.Add('  PDV_DT_PEDIDO,');
    QSelect.SQL.Add('  PDV_DT_PREVISAO,');
    QSelect.SQL.Add('  CNC_CLIENTE,');
    QSelect.SQL.Add('  CLI_CODIGO,');
    QSelect.SQL.Add('  PDV_DOCUMENTO,');
    QSelect.SQL.Add('  PDV_TIPO_ARMACAO,');
    QSelect.SQL.Add('  PDV_OBS_ARMACAO,');
    QSelect.SQL.Add('  PDV_TIPO_LENTES,');
    QSelect.SQL.Add('  PDV_OBS_LENTES,');
    QSelect.SQL.Add('  PDV_MEDICO_CRM,');
    QSelect.SQL.Add('  PDV_MEDICO_NOME,');
    QSelect.SQL.Add('  PDV_MEDICO_FONE,');
    QSelect.SQL.Add('  PDV_OD_ESF,');
    QSelect.SQL.Add('  PDV_OE_ESF,');
    QSelect.SQL.Add('  PDV_OD_CIL,');
    QSelect.SQL.Add('  PDV_OE_CIL,');
    QSelect.SQL.Add('  PDV_OD_EIXO,');
    QSelect.SQL.Add('  PDV_OE_EIXO,');
    QSelect.SQL.Add('  PDV_OD_DNP,');
    QSelect.SQL.Add('  PDV_OE_DNP,');
    QSelect.SQL.Add('  PDV_OD_ALT,');
    QSelect.SQL.Add('  PDV_OE_ALT,');
    QSelect.SQL.Add('  PDV_OD_ADICAO,');
    QSelect.SQL.Add('  PDV_OE_ADICAO,');
    QSelect.SQL.Add('  PDV_SITUACAO,');
    QSelect.SQL.Add('  PDV_OBSERVACAO,');
    QSelect.SQL.Add('  FUN_CODIGO,');
    QSelect.SQL.Add('  PDV_PASCIENTE');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PEDIDO_AUXILIAR');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'PDA'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_ORIGEM').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PDV_MAQUINA').AsString)                                                   + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_PEDIDO').AsDateTime))   + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PDV_DT_PREVISAO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CLIENTE').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('PDV_DOCUMENTO').AsString)))                              + delimitador +
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('PDV_TIPO_ARMACAO').AsString)))                           + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('PDV_OBS_ARMACAO').AsString)))                           + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_80,Trim(RetiraAspas(FieldByName('PDV_TIPO_LENTES').AsString)))                            + delimitador +(*TAM = 100*)
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('PDV_OBS_LENTES').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('PDV_MEDICO_CRM').AsString)                                                + delimitador +
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('PDV_MEDICO_NOME').AsString)))                            + delimitador +(*TAM = 60*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('PDV_MEDICO_FONE').AsString)))                            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OD_ESF').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OE_ESF').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OD_CIL').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OE_CIL').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OD_EIXO').AsString))                                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OE_EIXO').AsString))                                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OD_DNP').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OE_DNP').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OD_ALT').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OE_ALT').AsString))                                       + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OD_ADICAO').AsString))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('PDV_OE_ADICAO').AsString))                                    + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('PDV_SITUACAO').AsString)                                                + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('PDV_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_60,Trim(RetiraAspas(FieldByName('PDV_PASCIENTE').AsString)))                              + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'PEDIDO_AUXILIAR.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_PRC(QSelect, QSelectItem: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND PRC_DATA >= '''+MesDia(FDataReferencia)+'''');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PRE_RECEBIMENTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  PRC_CODIGO,');
    QSelect.SQL.Add('  PRC_DATA,');
    QSelect.SQL.Add('  FOR_CODIGO,');
    QSelect.SQL.Add('  PRC_SITUACAO,');
    QSelect.SQL.Add('  PRC_TOT_ITEM,');
    QSelect.SQL.Add('  PRC_TIPO,');
    QSelect.SQL.Add('  PRC_CNC_ORIGEM,');
    QSelect.SQL.Add('  PRC_COD_ORIGEM,');
    QSelect.SQL.Add('  PRC_DATA_SAIDA,');
    QSelect.SQL.Add('  PRC_DATA_EMISSAO,');
    QSelect.SQL.Add('  PRC_NUM_DOC,');
    QSelect.SQL.Add('  PRC_OBSERVACAO,');
    QSelect.SQL.Add('  PRC_NOTA_FISCAL');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PRE_RECEBIMENTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  function subSQLitem(iCNC,iCod: integer): boolean;
  begin
    QSelectItem.Close;
    QSelectItem.SQL.Clear;
    QSelectItem.SQL.Add('SELECT');
    QSelectItem.SQL.Add('  CNC_CODIGO,');
    QSelectItem.SQL.Add('  PRC_CODIGO,');
    QSelectItem.SQL.Add('  IPR_CODIGO,');
    QSelectItem.SQL.Add('  PRD_CODIGO,');
    QSelectItem.SQL.Add('  IPR_QUANTIDADE,');
    QSelectItem.SQL.Add('  IPR_SITUACAO,');
    QSelectItem.SQL.Add('  IPR_TIPO,');
    QSelectItem.SQL.Add('  LOT_CODIGO');
    QSelectItem.SQL.Add('FROM');
    QSelectItem.SQL.Add('  ITEM_DE_PRE_RECEBIMENTO');
    QSelectItem.SQL.Add('WHERE 1=1');
    QSelectItem.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelectItem.SQL.Add('  AND PRC_CODIGO = ' + IntToStr(iCod));
    QSelectItem.Open;
    result := not QSelectItem.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'PRC'                                                                                                       + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRC_CODIGO').AsString)                                                     + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PRC_DATA').AsDateTime))         + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FOR_CODIGO').AsString)                                                     + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('PRC_SITUACAO').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRC_TOT_ITEM').AsString)                                                   + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRC_TIPO').AsString)                                                       + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('PRC_CNC_ORIGEM').AsString)                                               + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRC_COD_ORIGEM').AsString)                                                 + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PRC_DATA_SAIDA').AsDateTime))   + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PRC_DATA_EMISSAO').AsDateTime)) + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('PRC_NUM_DOC').AsString)))                                 + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('PRC_OBSERVACAO').AsString)))                             + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('PRC_NOTA_FISCAL').AsString)                                                + delimitador );
    end;
  end;

  procedure subAddItem;
  begin
    with QSelectItem do
    begin
      Arquivo.Add(
        'IPR'                                                                    + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRC_CODIGO').AsString)                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPR_CODIGO').AsString)                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('IPR_QUANTIDADE').AsString)) + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('IPR_SITUACAO').AsString)              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('IPR_TIPO').AsString)                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('LOT_CODIGO').AsString)                  + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;

      if subSQLitem(QSelect.FieldByName('CNC_CODIGO').AsInteger,
                    QSelect.FieldByName('PRC_CODIGO').AsInteger) then
      begin
        QSelectItem.First;
        while not QSelectItem.Eof do
        begin
          subAddItem;
          QSelectItem.Next;
        end;
      end;

      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'PRE_RECEBIMENTO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_LOT(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (LOT_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR LOT_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  LOTE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  LOT_CODIGO,');
    QSelect.SQL.Add('  PRD_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  LOT_DT_CADASTRO,');
    QSelect.SQL.Add('  LOT_DT_ALTERADO,');
    QSelect.SQL.Add('  LOT_DT_VALIDADE,');
    QSelect.SQL.Add('  LOT_DESCRICAO,');
    QSelect.SQL.Add('  LOT_REFERENCIA,');
    QSelect.SQL.Add('  LOT_PRECO_COMPRA,');
    QSelect.SQL.Add('  LOT_PRECO_CUSTO,');
    QSelect.SQL.Add('  LOT_PRECO_VENDA,');
    QSelect.SQL.Add('  LOT_SITUACAO,');
    QSelect.SQL.Add('  LOT_OBSERVACAO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  LOTE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'LOT'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT,FieldByName('LOT_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('LOT_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('LOT_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('LOT_DT_VALIDADE').AsDateTime)) + delimitador +
        PreencheDir(CHAR_50,Trim(RetiraAspas(FieldByName('LOT_DESCRICAO').AsString)))                              + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('LOT_REFERENCIA').AsString)))                            + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('LOT_PRECO_COMPRA').AsString))                                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('LOT_PRECO_CUSTO').AsString))                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('LOT_PRECO_VENDA').AsString))                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('LOT_SITUACAO').AsString)                                                  + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('LOT_OBSERVACAO').AsString)))                            + delimitador );(*TAM = 255*)
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'LOTE.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_PRM(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    //Permissão, é enviado todos os registros
    //QSelect.SQL.Add('  AND PRM_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PERMISSAO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  OPS_CODIGO,');
    QSelect.SQL.Add('  PRM_CODIGO,');
    QSelect.SQL.Add('  PRM_DT_CADASTRO,');
    QSelect.SQL.Add('  PRM_PERFIL');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PERMISSAO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'PRM'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('OPS_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRM_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('PRM_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('PRM_PERFIL').AsString)                                                    + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'PERMISSAO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_SGP(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (SGP_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR SGP_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  SUBGRUPO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  GRP_CODIGO,');
    QSelect.SQL.Add('  SGP_CODIGO,');
    QSelect.SQL.Add('  SGP_DESCRICAO,');
    QSelect.SQL.Add('  SGP_OBSERVACAO,');
    QSelect.SQL.Add('  SGP_QUANTIDADE_NORMAL,');
    QSelect.SQL.Add('  SGP_BASE_CHAVE,');
    QSelect.SQL.Add('  SGP_FAMILIA,');
    QSelect.SQL.Add('  SGP_SITUACAO,');
    QSelect.SQL.Add('  SGP_DT_CADASTRO,');
    QSelect.SQL.Add('  SGP_DT_ALTERADO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  SGP_INDICE_REFRACAO,');
    QSelect.SQL.Add('  SGP_FABRICAR,');
    QSelect.SQL.Add('  SGP_PRECO_DOLAR,');
    QSelect.SQL.Add('  SGP_EIXOS,');
    QSelect.SQL.Add('  SGP_SERVICO_OBRIGATORIO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  SUBGRUPO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'SGP'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('GRP_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('SGP_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_40,Trim(RetiraAspas(FieldByName('SGP_DESCRICAO').AsString)))                              + delimitador +
        PreencheDir(CHAR_30,Trim(RetiraAspas(FieldByName('SGP_OBSERVACAO').AsString)))                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('SGP_QUANTIDADE_NORMAL').AsString))                            + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('SGP_BASE_CHAVE').AsString)))                            + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('SGP_FAMILIA').AsString)))                               + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('SGP_SITUACAO').AsString)                                                + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('SGP_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('SGP_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('SGP_INDICE_REFRACAO').AsString))                              + delimitador +
        PreencheEsq(TAM_INT,FieldByName('SGP_FABRICAR').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('SGP_PRECO_DOLAR').AsString)                                               + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('SGP_EIXOS').AsString)))                                 + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('SGP_SERVICO_OBRIGATORIO').AsString)                                     + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'SUBGRUPO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_SNH(QSelect: TADOQuery; pBar: TGauge; iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND (SNH_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR SNH_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  USUARIO_SENHA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  CNC_ORIGEM,');
    QSelect.SQL.Add('  CNC_USUARIO,');
    QSelect.SQL.Add('  USU_USUARIO,');
    QSelect.SQL.Add('  SNH_DT_CADASTRO,');
    QSelect.SQL.Add('  SNH_DT_ALTERADO,');
    QSelect.SQL.Add('  SNH_SENHA,');
    QSelect.SQL.Add('  SNH_SITUACAO,');
    QSelect.SQL.Add('  SNH_OBSERVACAO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  USUARIO_SENHA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'SNH'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_ORIGEM').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_USUARIO').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_USUARIO').AsString)                                                   + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('SNH_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('SNH_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('SNH_SENHA').AsString)))                                  + delimitador +(*TAM = 100*)
        PreencheEsq(TAM_INT_2,FieldByName('SNH_SITUACAO').AsString)                                                + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('SNH_OBSERVACAO').AsString)))                             + delimitador );(*TAM = 255*)
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'USUARIO_SENHA.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_TPR(QSelect: TADOQuery; pBar: TGauge);

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TIPO_DE_PARAMETRO');
    QSelect.SQL.Add('WHERE 1=1');
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  TPR_CODIGO,');
    QSelect.SQL.Add('  TPR_DESCRICAO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TIPO_DE_PARAMETRO');
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'TPR'                                                                         + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                     + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPR_CODIGO').AsString)                       + delimitador +
        PreencheDir(CHAR_50,Trim(RetiraAspas(FieldByName('TPR_DESCRICAO').AsString))) + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'TIPO_DE_PARAMETRO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_TPS(QSelect, QSelectItem: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (TPS_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR TPS_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TABELA_DE_PRECO_SUBGRUPO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  TPS_CODIGO,');
    QSelect.SQL.Add('  CNC_CLIENTE,');
    QSelect.SQL.Add('  CLI_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  TPS_DESCRICAO,');
    QSelect.SQL.Add('  TPS_DT_CADASTRO,');
    QSelect.SQL.Add('  TPS_DT_ALTERADO,');
    QSelect.SQL.Add('  TPS_DT_VALIDADE,');
    QSelect.SQL.Add('  TPS_LABORATORIO,');
    QSelect.SQL.Add('  TPS_DESCONTO_SIMPLES,');
    QSelect.SQL.Add('  TPS_DESCONTO_ESPECIAL,');
    QSelect.SQL.Add('  TPS_SITUACAO,');
    QSelect.SQL.Add('  TPS_OBSERVACAO,');
    QSelect.SQL.Add('  TPS_PRINCIPAL,');
    QSelect.SQL.Add('  TPS_DESCONTO_ESPECIAL_PRAZO,');
    QSelect.SQL.Add('  TPS_DESCONTO_SIMPLES_PRAZO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TABELA_DE_PRECO_SUBGRUPO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  function subSQLitem(iCNC,iCod: integer): boolean;
  begin
    QSelectItem.Close;
    QSelectItem.SQL.Clear;
    QSelectItem.SQL.Add('SELECT');
    QSelectItem.SQL.Add('  CNC_CODIGO,');
    QSelectItem.SQL.Add('  TPS_CODIGO,');
    QSelectItem.SQL.Add('  ITS_CODIGO,');
    QSelectItem.SQL.Add('  USU_CODIGO,');
    QSelectItem.SQL.Add('  GRP_CODIGO,');
    QSelectItem.SQL.Add('  SGP_CODIGO,');
    QSelectItem.SQL.Add('  ITS_DT_CADASTRO,');
    QSelectItem.SQL.Add('  ITS_DT_ALTERADO,');
    QSelectItem.SQL.Add('  ITS_PRECO_ORIGINAL,');
    QSelectItem.SQL.Add('  ITS_PRECO_VENDA,');
    QSelectItem.SQL.Add('  ITS_BONIFICACAO,');
    QSelectItem.SQL.Add('  ITS_QUANTIDADE_MINIMA,');
    QSelectItem.SQL.Add('  ITS_SITUACAO,');
    QSelectItem.SQL.Add('  ITS_OBSERVACAO,');
    QSelectItem.SQL.Add('  PRD_CODIGO');
    QSelectItem.SQL.Add('FROM');
    QSelectItem.SQL.Add('  ITEM_DE_TABELA_DE_PRECO_SUBGRUPO');
    QSelectItem.SQL.Add('WHERE 1=1');
    QSelectItem.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelectItem.SQL.Add('  AND TPS_CODIGO = ' + IntToStr(iCod));
    QSelectItem.Open;
    result := not QSelectItem.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'TPS'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPS_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CLIENTE').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CLI_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('TPS_DESCRICAO').AsString)))                             + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TPS_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TPS_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('TPS_DT_VALIDADE').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPS_LABORATORIO').AsString)                                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TPS_DESCONTO_SIMPLES').AsString))                             + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TPS_DESCONTO_ESPECIAL').AsString))                            + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('TPS_SITUACAO').AsString)                                                + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('TPS_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT_2,FieldByName('TPS_PRINCIPAL').AsString)                                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TPS_DESCONTO_ESPECIAL_PRAZO').AsString))                      + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('TPS_DESCONTO_SIMPLES_PRAZO').AsString))                       + delimitador );
    end;
  end;

  procedure subAddItem;
  begin
    with QSelectItem do
    begin
      Arquivo.Add(
        'ITS'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('TPS_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('ITS_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('GRP_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('SGP_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('ITS_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('ITS_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('ITS_PRECO_ORIGINAL').AsString))                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('ITS_PRECO_VENDA').AsString))                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('ITS_BONIFICACAO').AsString))                                  + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('ITS_QUANTIDADE_MINIMA').AsString))                            + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('ITS_SITUACAO').AsString)                                                + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('ITS_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('PRD_CODIGO').AsString)                                                    + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;

      if subSQLitem(QSelect.FieldByName('CNC_CODIGO').AsInteger,
                    QSelect.FieldByName('TPS_CODIGO').AsInteger) then
      begin
        QSelectItem.First;
        while not QSelectItem.Eof do
        begin
          subAddItem;
          QSelectItem.Next;
        end;
      end;

      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'TABELA_DE_PRECO_SUBGRUPO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_USU(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (USU_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR USU_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  USUARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  USU_NOME,');
    QSelect.SQL.Add('  USU_SENHA,');
    QSelect.SQL.Add('  USU_PERFIL,');
    QSelect.SQL.Add('  USU_SITUACAO,');
    QSelect.SQL.Add('  USU_OBSERVACAO,');
    QSelect.SQL.Add('  USU_MAQUINA,');
    QSelect.SQL.Add('  USU_DT_CADASTRO,');
    QSelect.SQL.Add('  USU_DT_ALTERADO,');
    QSelect.SQL.Add('  USU_FONE,');
    QSelect.SQL.Add('  USU_DT_SENHA_ALTERADA,');
    QSelect.SQL.Add('  USU_TODOS_CENTROS');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  USUARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'USU'                                                                                                                + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                              + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('USU_NOME').AsString)))                                             + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('USU_SENHA').AsString)))                                            + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('USU_PERFIL').AsString)                                                            + delimitador +
        PreencheEsq(TAM_INT_2,IfThen(FieldByName('USU_SITUACAO').AsString = '2','0', FieldByName('USU_SITUACAO').AsString))  + delimitador +
        PreencheDir(CHAR_150,Trim(RetiraAspas(FieldByName('USU_OBSERVACAO').AsString)))                                      + delimitador +(*TAM = 255*)
        PreencheEsq(TAM_INT,FieldByName('USU_MAQUINA').AsString)                                                             + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('USU_DT_CADASTRO').AsDateTime))           + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('USU_DT_ALTERADO').AsDateTime))           + delimitador +
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('USU_FONE').AsString)))                                             + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('USU_DT_SENHA_ALTERADA').AsDateTime))     + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('USU_TODOS_CENTROS').AsString)                                                     + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'USUARIO.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_MSG(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND (MSG_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
    QSelect.SQL.Add('  OR MSG_DT_ALTERADO >= '''+MesDia(FDataReferencia)+''')');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MENSAGEM');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  MSG_CODIGO,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  MSG_DT_CADASTRO,');
    QSelect.SQL.Add('  MSG_DT_ALTERADO,');
    QSelect.SQL.Add('  MSG_CNC_DESTINO,');
    QSelect.SQL.Add('  MSG_USU_DESTINO,');
    QSelect.SQL.Add('  MSG_SITUACAO_ENVIAR,');
    QSelect.SQL.Add('  MSG_SITUACAO_RECEBER,');
    QSelect.SQL.Add('  MSG_PUBLICA,');
    QSelect.SQL.Add('  MSG_AVISO_LEITURA,');
    QSelect.SQL.Add('  MSG_URGENTE,');
    QSelect.SQL.Add('  MSG_APAGADA,');
    QSelect.SQL.Add('  MSG_ALERTADO,');
    QSelect.SQL.Add('  MSG_ASSUNTO,');
    QSelect.SQL.Add('  MSG_MENSAGEM,');
    QSelect.SQL.Add('  MSG_OBSERVACAO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MENSAGEM');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'MSG'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MSG_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MSG_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('MSG_DT_ALTERADO').AsDateTime)) + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('MSG_CNC_DESTINO').AsString)                                             + delimitador +
        PreencheEsq(TAM_INT,FieldByName('MSG_USU_DESTINO').AsString)                                               + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('MSG_SITUACAO_ENVIAR').AsString)                                         + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('MSG_SITUACAO_RECEBER').AsString)                                        + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('MSG_PUBLICA').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('MSG_AVISO_LEITURA').AsString)                                           + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('MSG_URGENTE').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('MSG_APAGADA').AsString)                                                 + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('MSG_ALERTADO').AsString)                                                + delimitador +
        PreencheDir(CHAR_50,Trim(RetiraAspas(FieldByName('MSG_ASSUNTO').AsString)))                                + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_20,Trim(RetiraAspas(FieldByName('MSG_MENSAGEM').AsString)))                               + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('MSG_OBSERVACAO').AsString)))                            + delimitador );(*TAM = 255*)
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'MENSAGEM.' + extensao);
  end;
end;

function TEnviaComunicacao.Compacta(sNomeArquivo: string): boolean;
var
  arquivoZIP : TZipForge;
begin
  arquivoZIP := TZipForge.Create(nil);
  try
    with arquivoZIP do
    begin
      FileName := PATH_ENVIA + UpperCase(sNomeArquivo) + '.ZIP';
      Password := PasswordZIP;
      OpenArchive(fmCreate);
      BaseDir := PATH_ENVIA;
      AddFiles('*.' + extensao);

      result := arquivoZIP.FileCount > 0;

      CloseArchive();
    end;
  finally
    FreeAndNil(arquivoZIP);
  end;
end;

procedure TEnviaComunicacao.grArq_CDB(QSelect: TADOQuery; pBar: TGauge);

  procedure subWhere;
  begin
    QSelect.SQL.Add('  AND CDB_DT_CADASTRO >= '''+MesDia(FDataReferencia)+'''');
  end;

  function subTot: integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CODIGO_DE_BARRAS');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  CDB_CODIGO,');
    QSelect.SQL.Add('  CDB_CODIGO_ENTRADA,');
    QSelect.SQL.Add('  USU_CODIGO,');
    QSelect.SQL.Add('  CDB_TIPO,');
    QSelect.SQL.Add('  CDB_DT_CADASTRO,');
    QSelect.SQL.Add('  CDB_CODIGO_BARRAS,');
    QSelect.SQL.Add('  CDB_SITUACAO,');
    QSelect.SQL.Add('  CDB_OBSERVACAO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CODIGO_DE_BARRAS');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere;
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'CDB'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CDB_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CDB_CODIGO_ENTRADA').AsString)                                            + delimitador +
        PreencheEsq(TAM_INT,FieldByName('USU_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CDB_TIPO').AsString)                                                      + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('CDB_DT_CADASTRO').AsDateTime)) + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('CDB_CODIGO_BARRAS').AsString)))                         + delimitador +
        PreencheEsq(TAM_INT_2,FieldByName('CDB_SITUACAO').AsString)                                                + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('CDB_OBSERVACAO').AsString)))                            + delimitador );(*TAM = 255*)
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot;

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'CODIDO_DE_BARRAS.' + extensao);
  end;
end;

procedure TEnviaComunicacao.grArq_BLD(QSelect: TADOQuery; pBar: TGauge;
  iCNC: Integer);

  procedure subWhere(iCNC: Integer);
  begin
    QSelect.SQL.Add('  AND CNC_CODIGO = ' + IntToStr(iCNC));
    QSelect.SQL.Add('  AND BLD_DATA >= '''+MesDia(FDataReferencia)+'''');
  end;

  function subTot(iCNC: Integer): integer;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  COUNT(*) AS TOT');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  BOLETIM_DIARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := QSelect.FieldByName('TOT').AsInteger;
  end;

  function subSQL: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO,');
    QSelect.SQL.Add('  BLD_CODIGO,');
    QSelect.SQL.Add('  FUN_CODIGO,');
    QSelect.SQL.Add('  CAX_CODIGO,');
    QSelect.SQL.Add('  BLD_DATA,');
    QSelect.SQL.Add('  BLD_TOTAL_CARTAO,');
    QSelect.SQL.Add('  BLD_TOTAL_DINHEIRO,');
    QSelect.SQL.Add('  BLD_TOTAL_CHEQUE,');
    QSelect.SQL.Add('  BLD_OBSERVACAO,');
    QSelect.SQL.Add('  BLD_TIPO,');
    QSelect.SQL.Add('  BLD_TOTAL_PREDATADO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  BOLETIM_DIARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(iCNC);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subAdd;
  begin
    with QSelect do
    begin
      Arquivo.Add(
        'BLD'                                                                                                      + delimitador +
        PreencheEsq(TAM_INT_3,FieldByName('CNC_CODIGO').AsString)                                                  + delimitador +
        PreencheEsq(TAM_INT,FieldByName('BLD_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('FUN_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_INT,FieldByName('CAX_CODIGO').AsString)                                                    + delimitador +
        PreencheEsq(TAM_DATA_HORA,FormatDateTime('dd/mm/yyyy hh:nn:ss',FieldByName('BLD_DATA').AsDateTime))        + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('BLD_TOTAL_CARTAO').AsString))                                 + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('BLD_TOTAL_DINHEIRO').AsString))                               + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('BLD_TOTAL_CHEQUE').AsString))                                 + delimitador +
        PreencheDir(CHAR_100,Trim(RetiraAspas(FieldByName('BLD_OBSERVACAO').AsString)))                            + delimitador +(*TAM = 255*)
        PreencheDir(CHAR_1,Trim(RetiraAspas(FieldByName('BLD_TIPO').AsString)))                                    + delimitador +
        PreencheEsq(TAM_FLOAT,VirgPonto(FieldByName('BLD_TOTAL_PREDATADO').AsString))                              + delimitador );
    end;
  end;

begin
  pBar.Progress := 0;
  pBar.MaxValue := subTot(iCNC);

  Arquivo.Clear;
  if subSQL then
  begin
    Arquivo.Add(FCabecalho);
    QSelect.First;
    while not QSelect.Eof do
    begin
      subAdd;
      pBar.Progress := pBar.Progress + 1;
      QSelect.Next;
    end;
    Arquivo.SaveToFile(PATH_ENVIA + 'BOLETIM_DIARIO.' + extensao);
  end;
end;

{ TComunicacao }

constructor TComunicacao.Create;
begin
  FArquivo := TStringList.Create;

  FDataReferencia := StrToDate('01/01/1910');

  if not DirectoryExists(PATH) then
    CreateDir(PATH);

  if not DirectoryExists(PATH_LOG) then
    CreateDir(PATH_LOG);

  if not DirectoryExists(PATH_ENVIA) then
    CreateDir(PATH_ENVIA);

  if not DirectoryExists(PATH_RECEBE) then
    CreateDir(PATH_RECEBE);

  FPastaLOG         := PATH_LOG;
  FPastaComunicacao := PATH;
end;

procedure TComunicacao.SetLog(sTipo: string; sLegenda: TStatusBar; sListLog: TStringList; sMsg: string);
begin
  sLegenda.Panels[0].Text := sMsg;
  sLegenda.Refresh;
  sListLog.Add(sTipo + ': ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now) + ' - ' + sMsg);
end;

{ TRecebeComunicacao }

constructor TRecebeComunicacao.Create;
begin
  FPastaRecebe      := PATH_RECEBE;
  FPastaLOG         := PATH_LOG;
  FPastaComunicacao := PATH;
end;

function TRecebeComunicacao.CopyCampo(sLinha: string; var iPosicao: integer; iQtde: integer): string;
begin
  result   := Copy(sLinha,iPosicao,iQtde);
  iPosicao := iPosicao + iQtde + 1(*Delimitador*);
end;

procedure TRecebeComunicacao.Descompacta(sNomeArquivo: string);
var
  arquivoZIP : TZipForge;
begin
  arquivoZIP := TZipForge.Create(nil);
  try
    with arquivoZIP do
    begin
      FileName := PATH_RECEBE + UpperCase(sNomeArquivo);// + '.ZIP';
      Password := PasswordZIP;
      OpenArchive(fmOpenRead);
      BaseDir := PATH_RECEBE;
      ExtractFiles('*.' + extensao);
      CloseArchive();
    end;
  finally
    FreeAndNil(arquivoZIP);
  end;
end;

function TRecebeComunicacao.Importa_Arquivo_CPD_para_LOJA(sArquivoZIP: string; pBar: TGauge; sLegenda: TStatusBar;
  var sListLog: TStringList; QSelect, QExec: TADOQuery; lbTabela: TListBox; var LogSQL: string): boolean;
var
  sList, sListArquivo: TStringList;
  i,j: integer;
  sLinha: string;
begin
  bExcluirPermissao := true;
  bExcluirCodBarras := true;
  SetLog('Rec', sLegenda, sListLog, 'Descompactando arquivo...');
  Descompacta(sArquivoZIP);

  sList        := TStringList.Create;
  sListArquivo := TStringList.Create;
  ListSomenteArquivos(PATH_RECEBE,extensao,sList);

  //adiciona as tabelas no ListBox
  lbTabela.Items.Clear;
  for i := 0 to sList.Count - 1 do
    lbTabela.Items.Add(Copy(sList.Strings[i], 0, length(sList.Strings[i]) - 4));
  lbTabela.Refresh;
  Sleep(1000);

  for i := 0 to sList.Count - 1 do
  begin
    lbTabela.ItemIndex := i;
    lbTabela.Refresh;

    SetLog('Rec', sLegenda, sListLog, 'Lendo arquivo ' + sList.Strings[i] + '...');
    sListArquivo.LoadFromFile(PATH_RECEBE + sList.Strings[i]);

    pBar.Progress := 0;
    pBar.MaxValue := sListArquivo.Count;

    SetLog('Rec', sLegenda, sListLog, 'Importando tabela ' + Copy(sList.Strings[i], 0, Length(sList.Strings[i]) - 4) + '...');
    for j := 0 to sListArquivo.Count - 1 do
    begin
      sLinha := sListArquivo.Strings[j];

      if Copy(sLinha,0,3) = 'CAB' then
        RetornaCAB(sLinha)
      else
      begin
        grTab_PRD(sLinha, QSelect, QExec, LogSQL);
        grTab_FUN(sLinha, QSelect, QExec, LogSQL);
        grTab_USU(sLinha, QSelect, QExec, LogSQL);
        grTab_PDA(sLinha, QSelect, QExec, LogSQL);
        grTab_GRP(sLinha, QSelect, QExec, LogSQL);
        grTab_SGP(sLinha, QSelect, QExec, LogSQL);
        grTab_FOR(sLinha, QSelect, QExec, LogSQL);
        grTab_AGF(sLinha, QSelect, QExec, LogSQL);
        grTab_FAF(sLinha, QSelect, QExec, LogSQL);
        grTab_FPG(sLinha, QSelect, QExec, LogSQL);
        grTab_CCX(sLinha, QSelect, QExec, LogSQL);
        grTab_TPR(sLinha, QSelect, QExec, LogSQL);
        grTab_PAR(sLinha, QSelect, QExec, LogSQL);
        grTab_PRM(sLinha, QSelect, QExec, LogSQL);
        //grTab_MSG(sLinha, QSelect, QExec, LogSQL);
        grTab_CNC(sLinha, QSelect, QExec, LogSQL);
        grTab_CNF(sLinha, QSelect, QExec, LogSQL);
        grTab_TPS(sLinha, QSelect, QExec, LogSQL);
        grTab_PRC(sLinha, QSelect, QExec, LogSQL);
        grTab_CDB(sLinha, QSelect, QExec, LogSQL);
        grTab_LOT(sLinha, QSelect, QExec, LogSQL);
      end;

      pBar.Progress := pBar.Progress + 1;
    end;
  end;

  SetLog('Rec', sLegenda, sListLog, 'Fim da importação do arquivo ' + sArquivoZIP);
  result := true; //so retorna true se TODOS os registros forem enviados para as suas tabelas

  if result then
    pBar.Progress := 0;
end;

function TRecebeComunicacao.Importa_Arquivo_LOJA_para_CPD(sArquivoZIP: string; pBar: TGauge; sLegenda: TStatusBar;
  var sListLog: TStringList; QSelect, QExec: TADOQuery; lbTabela: TListBox; var LogSQL: string): boolean;
var
  sList, sListArquivo: TStringList;
  i,j: integer;
  sLinha: string;
begin
  SetLog('Rec', sLegenda, sListLog, 'Descompactando arquivo...');
  Descompacta(sArquivoZIP);

  sList        := TStringList.Create;
  sListArquivo := TStringList.Create;
  ListSomenteArquivos(PATH_RECEBE,extensao,sList);

  //adiciona as tabelas no ListBox
  lbTabela.Items.Clear;
  for i := 0 to sList.Count - 1 do
    lbTabela.Items.Add(Copy(sList.Strings[i], 0, length(sList.Strings[i]) - 4));
  lbTabela.Refresh;
  Sleep(1000);

  for i := 0 to sList.Count - 1 do
  begin
    lbTabela.ItemIndex := i;
    lbTabela.Refresh;
    
    SetLog('Rec', sLegenda, sListLog, 'Lendo arquivo ' + sList.Strings[i] + '...');
    sListArquivo.LoadFromFile(PATH_RECEBE + sList.Strings[i]);

    pBar.Progress := 0;
    pBar.MaxValue := sListArquivo.Count;

    SetLog('Rec', sLegenda, sListLog, 'Importando tabela ' + Copy(sList.Strings[i], 0, Length(sList.Strings[i]) - 4) + '...');
    for j := 0 to sListArquivo.Count - 1 do
    begin
      sLinha := sListArquivo.Strings[j];

      if Copy(sLinha,0,3) = 'CAB' then
        RetornaCAB(sLinha)
      else
      begin
        grTab_IES(sLinha, QSelect, QExec, LogSQL);
        grTab_BLD(sLinha, QSelect, QExec, LogSQL);
        grTab_MVC(sLinha, QSelect, QExec, LogSQL);
        grTab_MEC(sLinha, QSelect, QExec, LogSQL);
        grTab_MEF(sLinha, QSelect, QExec, LogSQL);
        grTab_MES(sLinha, QSelect, QExec, LogSQL);
        grTab_MCR(sLinha, QSelect, QExec, LogSQL);
        grTab_DPV(sLinha, QSelect, QExec, LogSQL);
        grTab_SNH(sLinha, QSelect, QExec, LogSQL);
        grTab_TRC(sLinha, QSelect, QExec, LogSQL);
        //grTab_TPG(sLinha, QSelect, QExec, LogSQL);
        grTab_CLI(sLinha, QSelect, QExec, LogSQL);
        grTab_CHQ(sLinha, QSelect, QExec, LogSQL);
        grTab_CSG(sLinha, QSelect, QExec, LogSQL);
        grTab_INV(sLinha, QSelect, QExec, LogSQL);
        grTab_PDV(sLinha, QSelect, QExec, LogSQL);
        grTab_NTF(sLinha, QSelect, QExec, LogSQL);
      end;

      pBar.Progress := pBar.Progress + 1;
    end;
  end;

  SetLog('Rec', sLegenda, sListLog, 'Fim da importação do arquivo ' + sArquivoZIP);
  result := true; //so retorna true se TODOS os registros forem enviados para as suas tabelas

  if result then
    pBar.Progress := 0;
end;

procedure TRecebeComunicacao.grTab_AGF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND AGF_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  AGF_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  AGENTE_FINANCEIRO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO AGENTE_FINANCEIRO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  AGF_CODIGO,');
    QExec.SQL.Add('  AGF_DESCRICAO,');
    QExec.SQL.Add('  AGF_TAXA_ADM,');
    QExec.SQL.Add('  AGF_JUROS,');
    QExec.SQL.Add('  AGF_DIA_PAGAMENTO,');
    QExec.SQL.Add('  AGF_ANTECIPACAO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  AGF_DT_ALTERADO,');
    QExec.SQL.Add('  AGF_DT_CADASTRO,');
    QExec.SQL.Add('  AGF_JUROS_ENTRADA,');
    QExec.SQL.Add('  AGF_CONTABIL_1,');
    QExec.SQL.Add('  AGF_CONTABIL_2,');
    QExec.SQL.Add('  AGF_CONTABIL_3,');
    QExec.SQL.Add('  AGF_CONTABIL_4,');
    QExec.SQL.Add('  AGF_HISTORICO_CONTABIL,');
    QExec.SQL.Add('  AGF_LIBERAR_DESCONTO_FPG,');
    QExec.SQL.Add('  AGF_SITUACAO,');
    QExec.SQL.Add('  AGF_ESPECIAL,');
    QExec.SQL.Add('  AGF_OBSERVACAO,');
    QExec.SQL.Add('  AGF_REC_AVISTA,');
    QExec.SQL.Add('  AGF_TAXA_MENSAL,');
    QExec.SQL.Add('  AGF_TIPOPAG_EXCLUSIVO,');
    QExec.SQL.Add('  AGF_CENTAVOS_ENTRADA)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //AGF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //AGF_DESCRICAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //AGF_TAXA_ADM
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //AGF_JUROS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_DIA_PAGAMENTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //AGF_ANTECIPACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //AGF_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //AGF_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_JUROS_ENTRADA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_CONTABIL_1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_CONTABIL_2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_CONTABIL_3
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_CONTABIL_4
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_HISTORICO_CONTABIL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_LIBERAR_DESCONTO_FPG
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_ESPECIAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //AGF_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_REC_AVISTA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))     + ','); //AGF_TAXA_MENSAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_TIPOPAG_EXCLUSIVO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ')'); //AGF_CENTAVOS_ENTRADA
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE AGENTE_FINANCEIRO SET');
    QExec.SQL.Add('  AGF_DESCRICAO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //AGF_DESCRICAO
    QExec.SQL.Add('  AGF_TAXA_ADM = '             + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //AGF_TAXA_ADM
    QExec.SQL.Add('  AGF_JUROS = '                + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //AGF_JUROS
    QExec.SQL.Add('  AGF_DIA_PAGAMENTO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_DIA_PAGAMENTO
    QExec.SQL.Add('  AGF_ANTECIPACAO = '          + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //AGF_ANTECIPACAO
    QExec.SQL.Add('  USU_CODIGO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  AGF_DT_ALTERADO = '          + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //AGF_DT_ALTERADO
    QExec.SQL.Add('  AGF_DT_CADASTRO = '          + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //AGF_DT_CADASTRO
    QExec.SQL.Add('  AGF_JUROS_ENTRADA = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_JUROS_ENTRADA
    QExec.SQL.Add('  AGF_CONTABIL_1 = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_CONTABIL_1
    QExec.SQL.Add('  AGF_CONTABIL_2 = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_CONTABIL_2
    QExec.SQL.Add('  AGF_CONTABIL_3 = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_CONTABIL_3
    QExec.SQL.Add('  AGF_CONTABIL_4 = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_CONTABIL_4
    QExec.SQL.Add('  AGF_HISTORICO_CONTABIL = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //AGF_HISTORICO_CONTABIL
    QExec.SQL.Add('  AGF_LIBERAR_DESCONTO_FPG = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_LIBERAR_DESCONTO_FPG
    QExec.SQL.Add('  AGF_SITUACAO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_SITUACAO
    QExec.SQL.Add('  AGF_ESPECIAL = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_ESPECIAL
    QExec.SQL.Add('  AGF_OBSERVACAO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //AGF_OBSERVACAO
    QExec.SQL.Add('  AGF_REC_AVISTA = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_REC_AVISTA
    QExec.SQL.Add('  AGF_TAXA_MENSAL = '          + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))     + ','); //AGF_TAXA_MENSAL
    QExec.SQL.Add('  AGF_TIPOPAG_EXCLUSIVO = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //AGF_TIPOPAG_EXCLUSIVO
    QExec.SQL.Add('  AGF_CENTAVOS_ENTRADA = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                      ); //AGF_CENTAVOS_ENTRADA
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'AGF' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_CCX(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND CCX_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CCX_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CONTA_DE_CAIXA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO CONTA_DE_CAIXA (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  CCX_CODIGO,');
    QExec.SQL.Add('  CCX_DC,');
    QExec.SQL.Add('  CCX_DESCRICAO,');
    QExec.SQL.Add('  CCX_LIMITE_GASTO,');
    QExec.SQL.Add('  CCX_DISPONIVEL,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  CCX_DT_ALTERADO,');
    QExec.SQL.Add('  CCX_CONTABIL_1,');
    QExec.SQL.Add('  CCX_CONTABIL_2,');
    QExec.SQL.Add('  CCX_VISUALIZAR_FINANCEIRO,');
    QExec.SQL.Add('  CCX_VISUALIZAR_CAIXA,');
    QExec.SQL.Add('  CCX_HISTORICO_CONTABIL,');
    QExec.SQL.Add('  CCX_AVULSO,');
    QExec.SQL.Add('  CCX_DT_CADASTRO,');
    QExec.SQL.Add('  CCX_CONTABIL_3,');
    QExec.SQL.Add('  CCX_CONTABIL_4,');
    QExec.SQL.Add('  CCX_GRUPO,');
    QExec.SQL.Add('  CCX_OBSERVACAO,');
    QExec.SQL.Add('  CCX_SITUACAO,');
    QExec.SQL.Add('  ACC_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_DC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //CCX_DESCRICAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //CCX_LIMITE_GASTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //CCX_DISPONIVEL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //CCX_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_CONTABIL_1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_CONTABIL_2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CCX_VISUALIZAR_FINANCEIRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CCX_VISUALIZAR_CAIXA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_HISTORICO_CONTABIL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CCX_AVULSO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //CCX_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_CONTABIL_3
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_CONTABIL_4
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_GRUPO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //CCX_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CCX_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //ACC_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE CONTA_DE_CAIXA SET');
    QExec.SQL.Add('  CCX_DC = '                    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_DC
    QExec.SQL.Add('  CCX_DESCRICAO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //CCX_DESCRICAO
    QExec.SQL.Add('  CCX_LIMITE_GASTO = '          + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //CCX_LIMITE_GASTO
    QExec.SQL.Add('  CCX_DISPONIVEL = '            + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //CCX_DISPONIVEL
    QExec.SQL.Add('  USU_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  CCX_DT_ALTERADO = '           + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //CCX_DT_ALTERADO
    QExec.SQL.Add('  CCX_CONTABIL_1 = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_CONTABIL_1
    QExec.SQL.Add('  CCX_CONTABIL_2 = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_CONTABIL_2
    QExec.SQL.Add('  CCX_VISUALIZAR_FINANCEIRO = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CCX_VISUALIZAR_FINANCEIRO
    QExec.SQL.Add('  CCX_VISUALIZAR_CAIXA = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CCX_VISUALIZAR_CAIXA
    QExec.SQL.Add('  CCX_HISTORICO_CONTABIL = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_HISTORICO_CONTABIL
    QExec.SQL.Add('  CCX_AVULSO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CCX_AVULSO
    QExec.SQL.Add('  CCX_DT_CADASTRO = '           + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //CCX_DT_CADASTRO
    QExec.SQL.Add('  CCX_CONTABIL_3 = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_CONTABIL_3
    QExec.SQL.Add('  CCX_CONTABIL_4 = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CCX_CONTABIL_4
    QExec.SQL.Add('  CCX_GRUPO = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_GRUPO
    QExec.SQL.Add('  CCX_OBSERVACAO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //CCX_OBSERVACAO
    QExec.SQL.Add('  CCX_SITUACAO = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CCX_SITUACAO
    QExec.SQL.Add('  ACC_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        ); //ACC_CODIGO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'CCX' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_CHQ(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND CHQ_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CHQ_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CHEQUE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO CHEQUE (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  CHQ_CODIGO,');
    QExec.SQL.Add('  CHQ_NUMERO,');
    QExec.SQL.Add('  CHQ_VALOR,');
    QExec.SQL.Add('  CHQ_DATA,');
    QExec.SQL.Add('  CHQ_ER,');
    QExec.SQL.Add('  CHQ_SITUACAO,');
    QExec.SQL.Add('  CBN_NUMERO,');
    QExec.SQL.Add('  CHQ_OBSERVACAO,');
    QExec.SQL.Add('  CHQ_CNC_TITULO,');
    QExec.SQL.Add('  BNC_NUMERO,');
    QExec.SQL.Add('  AGN_NUMERO,');
    QExec.SQL.Add('  CHQ_COD_TITULO,');
    QExec.SQL.Add('  CHQ_TERCEIRO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  CHQ_DT_ALTERADO,');
    QExec.SQL.Add('  CHQ_DT_CADASTRO,');
    QExec.SQL.Add('  CHQ_NOMINAL,');
    QExec.SQL.Add('  CHQ_DONO_CHEQUE,');
    QExec.SQL.Add('  CHQ_COMP,');
    QExec.SQL.Add('  CHQ_BANCO,');
    QExec.SQL.Add('  CHQ_AGENCIA,');
    QExec.SQL.Add('  CHQ_C1,');
    QExec.SQL.Add('  CHQ_CONTA,');
    QExec.SQL.Add('  CHQ_C2,');
    QExec.SQL.Add('  CHQ_C3,');
    QExec.SQL.Add('  CHQ_CODIGO_BARRAS,');
    QExec.SQL.Add('  CHQ_ENVIADO,');
    QExec.SQL.Add('  CHQ_DT_ENVIADO,');
    QExec.SQL.Add('  CHQ_UTILIZADO,');
    QExec.SQL.Add('  CNC_CLIENTE,');
    QExec.SQL.Add('  CLI_CODIGO,');
    QExec.SQL.Add('  CNC_FACTORING,');
    QExec.SQL.Add('  FCT_CODIGO,');
    QExec.SQL.Add('  CHQ_CPF_CNPJ)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                    + ',');//CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CHQ_NUMERO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))         + ',');//CHQ_VALOR
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CHQ_DATA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CHQ_ER
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ',');//CHQ_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CBN_NUMERO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                     + ',');//CHQ_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                    + ',');//CHQ_CNC_TITULO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//BNC_NUMERO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//AGN_NUMERO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_COD_TITULO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_TERCEIRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CHQ_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CHQ_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ',');//CHQ_NOMINAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ',');//CHQ_DONO_CHEQUE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_COMP
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_BANCO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_AGENCIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_C1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_CONTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_C2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_C3
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                      + ',');//CHQ_CODIGO_BARRAS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ',');//CHQ_ENVIADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CHQ_DT_ENVIADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_UTILIZADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                    + ',');//CNC_CLIENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CNC_FACTORING
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//FCT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ')');//CHQ_CPF_CNPJ
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE CHEQUE SET');
    QExec.SQL.Add('  CHQ_NUMERO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CHQ_NUMERO
    QExec.SQL.Add('  CHQ_VALOR = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))         + ',');//CHQ_VALOR
    QExec.SQL.Add('  CHQ_DATA = '         + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CHQ_DATA
    QExec.SQL.Add('  CHQ_ER = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CHQ_ER
    QExec.SQL.Add('  CHQ_SITUACAO = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ',');//CHQ_SITUACAO
    QExec.SQL.Add('  CBN_NUMERO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CBN_NUMERO
    QExec.SQL.Add('  CHQ_OBSERVACAO = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                     + ',');//CHQ_OBSERVACAO
    QExec.SQL.Add('  CHQ_CNC_TITULO = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                    + ',');//CHQ_CNC_TITULO
    QExec.SQL.Add('  BNC_NUMERO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//BNC_NUMERO
    QExec.SQL.Add('  AGN_NUMERO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//AGN_NUMERO
    QExec.SQL.Add('  CHQ_COD_TITULO = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_COD_TITULO
    QExec.SQL.Add('  CHQ_TERCEIRO = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_TERCEIRO
    QExec.SQL.Add('  USU_CODIGO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//USU_CODIGO
    QExec.SQL.Add('  CHQ_DT_ALTERADO = '  + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CHQ_DT_ALTERADO
    QExec.SQL.Add('  CHQ_DT_CADASTRO = '  + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CHQ_DT_CADASTRO
    QExec.SQL.Add('  CHQ_NOMINAL = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ',');//CHQ_NOMINAL
    QExec.SQL.Add('  CHQ_DONO_CHEQUE = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ',');//CHQ_DONO_CHEQUE
    QExec.SQL.Add('  CHQ_COMP = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_COMP
    QExec.SQL.Add('  CHQ_BANCO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_BANCO
    QExec.SQL.Add('  CHQ_AGENCIA = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_AGENCIA
    QExec.SQL.Add('  CHQ_C1 = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_C1
    QExec.SQL.Add('  CHQ_CONTA = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_CONTA
    QExec.SQL.Add('  CHQ_C2 = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_C2
    QExec.SQL.Add('  CHQ_C3 = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_C3
    QExec.SQL.Add('  CHQ_CODIGO_BARRAS = '+ QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                      + ',');//CHQ_CODIGO_BARRAS
    QExec.SQL.Add('  CHQ_ENVIADO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ',');//CHQ_ENVIADO
    QExec.SQL.Add('  CHQ_DT_ENVIADO = '   + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CHQ_DT_ENVIADO
    QExec.SQL.Add('  CHQ_UTILIZADO = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CHQ_UTILIZADO
    QExec.SQL.Add('  CNC_CLIENTE = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                    + ',');//CNC_CLIENTE
    QExec.SQL.Add('  CLI_CODIGO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_CODIGO
    QExec.SQL.Add('  CNC_FACTORING = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CNC_FACTORING
    QExec.SQL.Add('  FCT_CODIGO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//FCT_CODIGO
    QExec.SQL.Add('  CHQ_CPF_CNPJ = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                           );//CHQ_CPF_CNPJ
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'CHQ' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_CLI(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND CLI_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CLI_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CLIENTE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO CLIENTE (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  CLI_CODIGO,');
    QExec.SQL.Add('  CLI_PESSOA_FISICA,');
    QExec.SQL.Add('  CLI_DT_CADASTRO,');
    QExec.SQL.Add('  CLI_DATA_NASC,');
    QExec.SQL.Add('  CLI_RZ_SOCIAL,');
    QExec.SQL.Add('  CLI_NOME_FAN,');
    QExec.SQL.Add('  CLI_CGC_CPF,');
    QExec.SQL.Add('  CLI_CGF_RG,');
    QExec.SQL.Add('  CLI_LOGRADOURO,');
    QExec.SQL.Add('  CLI_ENDERECO,');
    QExec.SQL.Add('  CLI_BAIRRO,');
    QExec.SQL.Add('  CLI_CIDADE,');
    QExec.SQL.Add('  CLI_UF,');
    QExec.SQL.Add('  CLI_CEP,');
    QExec.SQL.Add('  CLI_FONE,');
    QExec.SQL.Add('  CLI_SITUACAO,');
    QExec.SQL.Add('  CLI_CREDITO,');
    QExec.SQL.Add('  CLI_PAI,');
    QExec.SQL.Add('  CLI_MAE,');
    QExec.SQL.Add('  CLI_CONJUGE,');
    QExec.SQL.Add('  CLI_OBS1,');
    QExec.SQL.Add('  CLI_LOCALTRABALHO,');
    QExec.SQL.Add('  CLI_FAX,');
    QExec.SQL.Add('  CLI_SITE,');
    QExec.SQL.Add('  CLI_EMAIL,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  CLI_DT_ALTERADO,');
    QExec.SQL.Add('  CLI_CELULAR,');
    QExec.SQL.Add('  CLI_SPC,');
    QExec.SQL.Add('  CLI_VENDA_ATACADO,');
    QExec.SQL.Add('  CLI_DESCONTO,');
    QExec.SQL.Add('  CLI_ORGAO,');
    QExec.SQL.Add('  CLI_DT_SPC,');
    QExec.SQL.Add('  CLI_REFERENCIA1,');
    QExec.SQL.Add('  CLI_REFERENCIA2,');
    QExec.SQL.Add('  CLI_REFERENCIA3,');
    QExec.SQL.Add('  CLI_IDENTIFICACAO,');
    QExec.SQL.Add('  CLI_PROFISSAO,');
    QExec.SQL.Add('  CLI_QUINZENAL,');
    QExec.SQL.Add('  CLI_MENSAL,');
    QExec.SQL.Add('  CLI_NOTA,');
    QExec.SQL.Add('  CLI_CLASSIFICACAO,');
    QExec.SQL.Add('  CLI_MAQUINA,');
    QExec.SQL.Add('  CLI_TIPO,');
    QExec.SQL.Add('  CNC_CONVENIO,');
    QExec.SQL.Add('  CLI_CONVENIO,');
    QExec.SQL.Add('  CNC_ORIGEM,');
    QExec.SQL.Add('  CLI_DT_IMPORTACAO_INS,');
    QExec.SQL.Add('  CLI_DT_IMPORTACAO_ALT,');
    QExec.SQL.Add('  CLI_DESCONTO_PRAZO,');
    QExec.SQL.Add('  CLI_CONSIGNATARIO,');
    QExec.SQL.Add('  CLI_NUMERO_END)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                    + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_PESSOA_FISICA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ','); //CLI_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ','); //CLI_DATA_NASC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ','); //CLI_RZ_SOCIAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ','); //CLI_NOME_FAN
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_CGC_CPF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_CGF_RG
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))                    + ','); //CLI_LOGRADOURO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ','); //CLI_ENDERECO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_BAIRRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_CIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                       + ','); //CLI_UF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                      + ','); //CLI_CEP
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_FONE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ','); //CLI_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))         + ','); //CLI_CREDITO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_PAI
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_MAE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_CONJUGE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                     + ','); //CLI_OBS1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ','); //CLI_LOCALTRABALHO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_FAX
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ','); //CLI_SITE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ','); //CLI_EMAIL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ','); //CLI_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_CELULAR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ','); //CLI_SPC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ','); //CLI_VENDA_ATACADO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))         + ','); //CLI_DESCONTO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_ORGAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ','); //CLI_DT_SPC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ','); //CLI_REFERENCIA1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ','); //CLI_REFERENCIA2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ','); //CLI_REFERENCIA3
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ','); //CLI_IDENTIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ','); //CLI_PROFISSAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_QUINZENAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_MENSAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_NOTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_CLASSIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_TIPO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CNC_CONVENIO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_CONVENIO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                    + ','); //CNC_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ','); //CLI_DT_IMPORTACAO_INS
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ','); //CLI_DT_IMPORTACAO_ALT
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))         + ','); //CLI_DESCONTO_PRAZO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ','); //CLI_CONSIGNATARIO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                      + ')'); //CLI_NUMERO_END
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE CLIENTE SET');
    QExec.SQL.Add('  CLI_PESSOA_FISICA = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_PESSOA_FISICA
    QExec.SQL.Add('  CLI_DT_CADASTRO = '         + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CLI_DT_CADASTRO
    QExec.SQL.Add('  CLI_DATA_NASC = '           + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CLI_DATA_NASC
    QExec.SQL.Add('  CLI_RZ_SOCIAL = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ',');//CLI_RZ_SOCIAL
    QExec.SQL.Add('  CLI_NOME_FAN = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ',');//CLI_NOME_FAN
    QExec.SQL.Add('  CLI_CGC_CPF = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_CGC_CPF
    QExec.SQL.Add('  CLI_CGF_RG = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_CGF_RG
    QExec.SQL.Add('  CLI_LOGRADOURO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))                    + ',');//CLI_LOGRADOURO
    QExec.SQL.Add('  CLI_ENDERECO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ',');//CLI_ENDERECO
    QExec.SQL.Add('  CLI_BAIRRO = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_BAIRRO
    QExec.SQL.Add('  CLI_CIDADE = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_CIDADE
    QExec.SQL.Add('  CLI_UF = '                  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                       + ',');//CLI_UF
    QExec.SQL.Add('  CLI_CEP = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                      + ',');//CLI_CEP
    QExec.SQL.Add('  CLI_FONE = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_FONE
    QExec.SQL.Add('  CLI_SITUACAO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ',');//CLI_SITUACAO
    QExec.SQL.Add('  CLI_CREDITO = '             + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))         + ',');//CLI_CREDITO
    QExec.SQL.Add('  CLI_PAI = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_PAI
    QExec.SQL.Add('  CLI_MAE = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_MAE
    QExec.SQL.Add('  CLI_CONJUGE = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_CONJUGE
    QExec.SQL.Add('  CLI_OBS1 = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                     + ',');//CLI_OBS1
    QExec.SQL.Add('  CLI_LOCALTRABALHO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                      + ',');//CLI_LOCALTRABALHO
    QExec.SQL.Add('  CLI_FAX = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_FAX
    QExec.SQL.Add('  CLI_SITE = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ',');//CLI_SITE
    QExec.SQL.Add('  CLI_EMAIL = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ',');//CLI_EMAIL
    QExec.SQL.Add('  USU_CODIGO = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//USU_CODIGO
    QExec.SQL.Add('  CLI_DT_ALTERADO = '         + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CLI_DT_ALTERADO
    QExec.SQL.Add('  CLI_CELULAR = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_CELULAR
    QExec.SQL.Add('  CLI_SPC = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ',');//CLI_SPC
    QExec.SQL.Add('  CLI_VENDA_ATACADO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                    + ',');//CLI_VENDA_ATACADO
    QExec.SQL.Add('  CLI_DESCONTO = '            + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))         + ',');//CLI_DESCONTO
    QExec.SQL.Add('  CLI_ORGAO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_ORGAO
    QExec.SQL.Add('  CLI_DT_SPC = '              + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CLI_DT_SPC
    QExec.SQL.Add('  CLI_REFERENCIA1 = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ',');//CLI_REFERENCIA1
    QExec.SQL.Add('  CLI_REFERENCIA2 = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ',');//CLI_REFERENCIA2
    QExec.SQL.Add('  CLI_REFERENCIA3 = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ',');//CLI_REFERENCIA3
    QExec.SQL.Add('  CLI_IDENTIFICACAO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                      + ',');//CLI_IDENTIFICACAO
    QExec.SQL.Add('  CLI_PROFISSAO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                      + ',');//CLI_PROFISSAO
    QExec.SQL.Add('  CLI_QUINZENAL = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_QUINZENAL
    QExec.SQL.Add('  CLI_MENSAL = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_MENSAL
    QExec.SQL.Add('  CLI_NOTA = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_NOTA
    QExec.SQL.Add('  CLI_CLASSIFICACAO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_CLASSIFICACAO
    QExec.SQL.Add('  CLI_MAQUINA = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_MAQUINA
    QExec.SQL.Add('  CLI_TIPO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_TIPO
    QExec.SQL.Add('  CNC_CONVENIO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CNC_CONVENIO
    QExec.SQL.Add('  CLI_CONVENIO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_CONVENIO
    QExec.SQL.Add('  CNC_ORIGEM = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                    + ',');//CNC_ORIGEM
    QExec.SQL.Add('  CLI_DT_IMPORTACAO_INS = '   + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CLI_DT_IMPORTACAO_INS
    QExec.SQL.Add('  CLI_DT_IMPORTACAO_ALT = '   + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))    + ',');//CLI_DT_IMPORTACAO_ALT
    QExec.SQL.Add('  CLI_DESCONTO_PRAZO = '      + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))         + ',');//CLI_DESCONTO_PRAZO
    QExec.SQL.Add('  CLI_CONSIGNATARIO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                      + ',');//CLI_CONSIGNATARIO
    QExec.SQL.Add('  CLI_NUMERO_END = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                           );//CLI_NUMERO_END
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'CLI' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_CNC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNC_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CENTRO_DE_CUSTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO CENTRO_DE_CUSTO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  CNC_RZ_SOCIAL,');
    QExec.SQL.Add('  CNC_NOME_FAN,');
    QExec.SQL.Add('  CNC_CGC,');
    QExec.SQL.Add('  CNC_IE,');
    QExec.SQL.Add('  CNC_LOGRADOURO,');
    QExec.SQL.Add('  CNC_ENDERECO,');
    QExec.SQL.Add('  CNC_BAIRRO,');
    QExec.SQL.Add('  CNC_CIDADE,');
    QExec.SQL.Add('  CNC_UF,');
    QExec.SQL.Add('  CNC_CEP,');
    QExec.SQL.Add('  CNC_FONE,');
    QExec.SQL.Add('  CNC_FAX,');
    QExec.SQL.Add('  CNC_EMAIL,');
    QExec.SQL.Add('  CNC_SITE,');
    QExec.SQL.Add('  CNC_RECEBE_DADOS,');
    QExec.SQL.Add('  CNC_META_QUINZENA_1,');
    QExec.SQL.Add('  CNC_META_QUINZENA_2,');
    QExec.SQL.Add('  CNC_IP,');
    QExec.SQL.Add('  CNC_OBSERVACAO,');
    QExec.SQL.Add('  CNC_EXTERNO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))             + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))               + ','); //CNC_RZ_SOCIAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))               + ','); //CNC_NOME_FAN
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_CGC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_IE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))               + ','); //CNC_LOGRADOURO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))               + ','); //CNC_ENDERECO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_BAIRRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_CIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                + ','); //CNC_UF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_CEP
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_FONE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_FAX
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))               + ','); //CNC_EMAIL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))               + ','); //CNC_SITE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))             + ','); //CNC_RECEBE_DADOS
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))  + ','); //CNC_META_QUINZENA_1
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))  + ','); //CNC_META_QUINZENA_2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))               + ','); //CNC_IP
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))              + ','); //CNC_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))               + ')'); //CNC_EXTERNO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 9;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE CENTRO_DE_CUSTO SET');
    QExec.SQL.Add('  CNC_RZ_SOCIAL = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))               + ','); //CNC_RZ_SOCIAL
    QExec.SQL.Add('  CNC_NOME_FAN = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))               + ','); //CNC_NOME_FAN
    QExec.SQL.Add('  CNC_CGC = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_CGC
    QExec.SQL.Add('  CNC_IE = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_IE
    QExec.SQL.Add('  CNC_LOGRADOURO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))               + ','); //CNC_LOGRADOURO
    QExec.SQL.Add('  CNC_ENDERECO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))               + ','); //CNC_ENDERECO
    QExec.SQL.Add('  CNC_BAIRRO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_BAIRRO
    QExec.SQL.Add('  CNC_CIDADE = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_CIDADE
    QExec.SQL.Add('  CNC_UF = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                + ','); //CNC_UF
    QExec.SQL.Add('  CNC_CEP = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_CEP
    QExec.SQL.Add('  CNC_FONE = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_FONE
    QExec.SQL.Add('  CNC_FAX = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))               + ','); //CNC_FAX
    QExec.SQL.Add('  CNC_EMAIL = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))               + ','); //CNC_EMAIL
    QExec.SQL.Add('  CNC_SITE = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))               + ','); //CNC_SITE
    QExec.SQL.Add('  CNC_RECEBE_DADOS = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))             + ','); //CNC_RECEBE_DADOS
    QExec.SQL.Add('  CNC_META_QUINZENA_1 = '  + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))  + ','); //CNC_META_QUINZENA_1
    QExec.SQL.Add('  CNC_META_QUINZENA_2 = '  + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))  + ','); //CNC_META_QUINZENA_2
    QExec.SQL.Add('  CNC_IP = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))               + ','); //CNC_IP
    QExec.SQL.Add('  CNC_OBSERVACAO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))              + ','); //CNC_OBSERVACAO
    QExec.SQL.Add('  CNC_EXTERNO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                    ); //CNC_EXTERNO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'CNC' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_CNF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND CNF_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CNF_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CONFIGURACAO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO CONFIGURACAO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  CNF_CODIGO,');
    QExec.SQL.Add('  CNF_TAXAJUROS,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  CNF_VLMORA,');
    QExec.SQL.Add('  CNF_COD_ULT_REC,');
    QExec.SQL.Add('  CNF_CONT_REC_CLI,');
    QExec.SQL.Add('  CNF_CONT_PAG_FOR,');
    QExec.SQL.Add('  CNF_JUR_NORM,');
    QExec.SQL.Add('  CNF_JUR_ESP,');
    QExec.SQL.Add('  CNF_CONT_PAG_VEN,');
    QExec.SQL.Add('  DIAS_RESERV,');
    QExec.SQL.Add('  CNC_CODIGO_ULT,');
    QExec.SQL.Add('  CNF_QNT_DIAS_DEV,');
    QExec.SQL.Add('  CNC_DEPOSITO,');
    QExec.SQL.Add('  CNF_QNT_DIAS_SEM_JUROS,');
    QExec.SQL.Add('  CNF_JUR_NORM_PAG,');
    QExec.SQL.Add('  CNF_JUR_ESP_PAG,');
    QExec.SQL.Add('  CNF_SQL,');
    QExec.SQL.Add('  EXPORTAR,');
    QExec.SQL.Add('  GERARLOG,');
    QExec.SQL.Add('  CNF_LOJACOD,');
    QExec.SQL.Add('  CNF_LOJANOME,');
    QExec.SQL.Add('  CNF_VERIFICA_ESTOQUE,');
    QExec.SQL.Add('  CNF_CONT_ABER_CX,');
    QExec.SQL.Add('  CNF_CONT_FECH_CX,');
    QExec.SQL.Add('  CNF_CLI_A_VISTA,');
    QExec.SQL.Add('  CNF_MENSAGEMCUPOM,');
    QExec.SQL.Add('  CNF_MELHORDATA,');
    QExec.SQL.Add('  CNF_POPUPMENU,');
    QExec.SQL.Add('  CNF_CPD,');
    QExec.SQL.Add('  CNF_MENSAGEMRODAPE,');
    QExec.SQL.Add('  CNF_CONT_PAG_TRN,');
    QExec.SQL.Add('  CNF_CONTROLE_TRANSACAO,');
    QExec.SQL.Add('  CNF_ENVIAR_SPC,');
    QExec.SQL.Add('  CNF_CIDADE,');
    QExec.SQL.Add('  CNF_UF,');
    QExec.SQL.Add('  CNF_CONT_REC_CLI_ANT,');
    QExec.SQL.Add('  CNF_TIPO_DOCUMENTO,');
    QExec.SQL.Add('  CNF_LBM_DESC_60,');
    QExec.SQL.Add('  CNF_LBM_JUROS_60,');
    QExec.SQL.Add('  CNF_CONT_REC_SERVICO,');
    QExec.SQL.Add('  CNF_PERCENTUAL_CUSTO,');
    QExec.SQL.Add('  CNF_PERCENTUAL_LUCRO,');
    QExec.SQL.Add('  CNF_NFERRAMENTA,');
    QExec.SQL.Add('  CNF_VERSAO_BASE,');
    QExec.SQL.Add('  CNF_ALIQUOTA_ISS,');
    QExec.SQL.Add('  CNF_CONT_FACTORING,');
    QExec.SQL.Add('  CNF_IGNORAR_CHEQUES,');
    QExec.SQL.Add('  CNF_DIAS_VENDA_INADIPLENTE,');
    QExec.SQL.Add('  CNF_LIMITE_CREDITO_BASICO,');
    QExec.SQL.Add('  CNF_CUSTO_OPERACIONAL,');
    QExec.SQL.Add('  CNF_CUSTO_OPERACIONAL_LJ3,');
    QExec.SQL.Add('  CNF_IGNORAR_DEPOSITOS,');
    QExec.SQL.Add('  CNF_LIMITE_MEDIA_VENDA,');
    QExec.SQL.Add('  CNF_CONT_TRANSFERE,');
    QExec.SQL.Add('  CNF_PIS,');
    QExec.SQL.Add('  CNF_COFINS,');
    QExec.SQL.Add('  CNF_VERSAO_INCLUIROPER,');
    QExec.SQL.Add('  CNF_GRUPO_REPASSE,');
    QExec.SQL.Add('  CNF_PRD_REF_UNICA,');
    QExec.SQL.Add('  CNF_QNT_DIAS_SEM_COBRA,');
    QExec.SQL.Add('  CNF_ESTOQUE_DETALHADO,');
    QExec.SQL.Add('  CNF_CPMF,');
    QExec.SQL.Add('  CNF_COBRANCA,');
    QExec.SQL.Add('  CNF_CCX_VERIFICA_CAIXA,');
    QExec.SQL.Add('  CNF_LABORATORIO,');
    QExec.SQL.Add('  CNF_MONTAGEM,');
    QExec.SQL.Add('  CNF_LAB_META,');
    QExec.SQL.Add('  CNF_LAB_COTA1,');
    QExec.SQL.Add('  CNF_LAB_COTA2,');
    QExec.SQL.Add('  CNF_LIM_DESC_JR_SIMPLES,');
    QExec.SQL.Add('  CNF_LIM_DESC_JR_ESPECIAL,');
    QExec.SQL.Add('  CNF_MONT_META,');
    QExec.SQL.Add('  CNF_MONT_COTA1,');
    QExec.SQL.Add('  CNF_MONT_COTA2,');
    QExec.SQL.Add('  CNF_MAGAZINE,');
    QExec.SQL.Add('  CNF_AVISTA,');
    QExec.SQL.Add('  CNF_CHEQUE,');
    QExec.SQL.Add('  CNF_CCREDITO,');
    QExec.SQL.Add('  CNF_CARNE,');
    QExec.SQL.Add('  CNF_BOLETO,');
    QExec.SQL.Add('  CNF_QUALCPD,');
    QExec.SQL.Add('  CNF_NFE,');
    QExec.SQL.Add('  CNF_ESTOQUE_IDEAL,');
    QExec.SQL.Add('  CNF_FTP_URL,');
    QExec.SQL.Add('  CNF_FTP_USUARIO,');
    QExec.SQL.Add('  CNF_FTP_SENHA,');
    QExec.SQL.Add('  CNF_FTP_PASSIVO,');
    QExec.SQL.Add('  CNF_ARQUIVO_PRINCIPAL,');
    QExec.SQL.Add('  CNF_ARQUIVO_CHAVE)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_TAXAJUROS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_VLMORA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_COD_ULT_REC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_REC_CLI
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_PAG_FOR
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_JUR_NORM
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_JUR_ESP
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_PAG_VEN
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //DIAS_RESERV
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNC_CODIGO_ULT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_QNT_DIAS_DEV
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNC_DEPOSITO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_QNT_DIAS_SEM_JUROS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                + ','); //CNF_JUR_NORM_PAG
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                + ','); //CNF_JUR_ESP_PAG
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNF_SQL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //EXPORTAR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //GERARLOG
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNF_LOJACOD
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_LOJANOME
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_VERIFICA_ESTOQUE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_ABER_CX
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_FECH_CX
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CLI_A_VISTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                + ','); //CNF_MENSAGEMCUPOM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_MELHORDATA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_POPUPMENU
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_CPD
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                + ','); //CNF_MENSAGEMRODAPE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_CONT_PAG_TRN
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_CONTROLE_TRANSACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_ENVIAR_SPC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_CIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                 + ','); //CNF_UF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_REC_CLI_ANT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_TIPO_DOCUMENTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LBM_DESC_60
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LBM_JUROS_60
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_REC_SERVICO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_PERCENTUAL_CUSTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_PERCENTUAL_LUCRO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_NFERRAMENTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNF_VERSAO_BASE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_ALIQUOTA_ISS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_FACTORING
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_IGNORAR_CHEQUES
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_DIAS_VENDA_INADIPLENTE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LIMITE_CREDITO_BASICO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_CUSTO_OPERACIONAL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_CUSTO_OPERACIONAL_LJ3
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_IGNORAR_DEPOSITOS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_LIMITE_MEDIA_VENDA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_TRANSFERE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_PIS
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_COFINS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_VERSAO_INCLUIROPER
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_GRUPO_REPASSE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_PRD_REF_UNICA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_QNT_DIAS_SEM_COBRA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_ESTOQUE_DETALHADO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_CPMF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_COBRANCA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CCX_VERIFICA_CAIXA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_LABORATORIO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_MONTAGEM
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LAB_META
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LAB_COTA1
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LAB_COTA2
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LIM_DESC_JR_SIMPLES
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LIM_DESC_JR_ESPECIAL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_MONT_META
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_MONT_COTA1
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_MONT_COTA2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_MAGAZINE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_AVISTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CHEQUE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CCREDITO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CARNE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_BOLETO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_QUALCPD
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_NFE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_ESTOQUE_IDEAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                + ','); //CNF_FTP_URL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_FTP_USUARIO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_FTP_SENHA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                 + ','); //CNF_FTP_PASSIVO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_ARQUIVO_PRINCIPAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ')'); //CNF_ARQUIVO_CHAVE
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 13;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE CONFIGURACAO SET');
    QExec.SQL.Add('  CNF_TAXAJUROS = '              + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_TAXAJUROS
    QExec.SQL.Add('  USU_CODIGO = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //USU_CODIGO
    QExec.SQL.Add('  CNF_VLMORA = '                 + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_VLMORA
    QExec.SQL.Add('  CNF_COD_ULT_REC = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_COD_ULT_REC
    QExec.SQL.Add('  CNF_CONT_REC_CLI = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_REC_CLI
    QExec.SQL.Add('  CNF_CONT_PAG_FOR = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_PAG_FOR
    QExec.SQL.Add('  CNF_JUR_NORM = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_JUR_NORM
    QExec.SQL.Add('  CNF_JUR_ESP = '                + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_JUR_ESP
    QExec.SQL.Add('  CNF_CONT_PAG_VEN = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_PAG_VEN
    QExec.SQL.Add('  DIAS_RESERV = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //DIAS_RESERV
    QExec.SQL.Add('  CNC_CODIGO_ULT = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNC_CODIGO_ULT
    QExec.SQL.Add('  CNF_QNT_DIAS_DEV = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_QNT_DIAS_DEV
    QExec.SQL.Add('  CNC_DEPOSITO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNC_DEPOSITO
    QExec.SQL.Add('  CNF_QNT_DIAS_SEM_JUROS = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_QNT_DIAS_SEM_JUROS
    QExec.SQL.Add('  CNF_JUR_NORM_PAG = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                + ','); //CNF_JUR_NORM_PAG
    QExec.SQL.Add('  CNF_JUR_ESP_PAG = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                + ','); //CNF_JUR_ESP_PAG
    QExec.SQL.Add('  CNF_SQL = '                    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNF_SQL
    QExec.SQL.Add('  EXPORTAR = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //EXPORTAR
    QExec.SQL.Add('  GERARLOG = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //GERARLOG
    QExec.SQL.Add('  CNF_LOJACOD = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNF_LOJACOD
    QExec.SQL.Add('  CNF_LOJANOME = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_LOJANOME
    QExec.SQL.Add('  CNF_VERIFICA_ESTOQUE = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_VERIFICA_ESTOQUE
    QExec.SQL.Add('  CNF_CONT_ABER_CX = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_ABER_CX
    QExec.SQL.Add('  CNF_CONT_FECH_CX = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_FECH_CX
    QExec.SQL.Add('  CNF_CLI_A_VISTA = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CLI_A_VISTA
    QExec.SQL.Add('  CNF_MENSAGEMCUPOM = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                + ','); //CNF_MENSAGEMCUPOM
    QExec.SQL.Add('  CNF_MELHORDATA = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_MELHORDATA
    QExec.SQL.Add('  CNF_POPUPMENU = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_POPUPMENU
    QExec.SQL.Add('  CNF_CPD = '                    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_CPD
    QExec.SQL.Add('  CNF_MENSAGEMRODAPE = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                + ','); //CNF_MENSAGEMRODAPE
    QExec.SQL.Add('  CNF_CONT_PAG_TRN = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_CONT_PAG_TRN
    QExec.SQL.Add('  CNF_CONTROLE_TRANSACAO = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_CONTROLE_TRANSACAO
    QExec.SQL.Add('  CNF_ENVIAR_SPC = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))              + ','); //CNF_ENVIAR_SPC
    QExec.SQL.Add('  CNF_CIDADE = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_CIDADE
    QExec.SQL.Add('  CNF_UF = '                     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                 + ','); //CNF_UF
    QExec.SQL.Add('  CNF_CONT_REC_CLI_ANT = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_REC_CLI_ANT
    QExec.SQL.Add('  CNF_TIPO_DOCUMENTO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_TIPO_DOCUMENTO
    QExec.SQL.Add('  CNF_LBM_DESC_60 = '            + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LBM_DESC_60
    QExec.SQL.Add('  CNF_LBM_JUROS_60 = '           + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LBM_JUROS_60
    QExec.SQL.Add('  CNF_CONT_REC_SERVICO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_REC_SERVICO
    QExec.SQL.Add('  CNF_PERCENTUAL_CUSTO = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_PERCENTUAL_CUSTO
    QExec.SQL.Add('  CNF_PERCENTUAL_LUCRO = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_PERCENTUAL_LUCRO
    QExec.SQL.Add('  CNF_NFERRAMENTA = '            + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_NFERRAMENTA
    QExec.SQL.Add('  CNF_VERSAO_BASE = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))              + ','); //CNF_VERSAO_BASE
    QExec.SQL.Add('  CNF_ALIQUOTA_ISS = '           + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_ALIQUOTA_ISS
    QExec.SQL.Add('  CNF_CONT_FACTORING = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_FACTORING
    QExec.SQL.Add('  CNF_IGNORAR_CHEQUES = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_IGNORAR_CHEQUES
    QExec.SQL.Add('  CNF_DIAS_VENDA_INADIPLENTE = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_DIAS_VENDA_INADIPLENTE
    QExec.SQL.Add('  CNF_LIMITE_CREDITO_BASICO = '  + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LIMITE_CREDITO_BASICO
    QExec.SQL.Add('  CNF_CUSTO_OPERACIONAL = '      + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_CUSTO_OPERACIONAL
    QExec.SQL.Add('  CNF_CUSTO_OPERACIONAL_LJ3 = '  + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_CUSTO_OPERACIONAL_LJ3
    QExec.SQL.Add('  CNF_IGNORAR_DEPOSITOS = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_IGNORAR_DEPOSITOS
    QExec.SQL.Add('  CNF_LIMITE_MEDIA_VENDA = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_LIMITE_MEDIA_VENDA
    QExec.SQL.Add('  CNF_CONT_TRANSFERE = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CONT_TRANSFERE
    QExec.SQL.Add('  CNF_PIS = '                    + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_PIS
    QExec.SQL.Add('  CNF_COFINS = '                 + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_COFINS
    QExec.SQL.Add('  CNF_VERSAO_INCLUIROPER = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_VERSAO_INCLUIROPER
    QExec.SQL.Add('  CNF_GRUPO_REPASSE = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_GRUPO_REPASSE
    QExec.SQL.Add('  CNF_PRD_REF_UNICA = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_PRD_REF_UNICA
    QExec.SQL.Add('  CNF_QNT_DIAS_SEM_COBRA = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_QNT_DIAS_SEM_COBRA
    QExec.SQL.Add('  CNF_ESTOQUE_DETALHADO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_ESTOQUE_DETALHADO
    QExec.SQL.Add('  CNF_CPMF = '                   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_CPMF
    QExec.SQL.Add('  CNF_COBRANCA = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_COBRANCA
    QExec.SQL.Add('  CNF_CCX_VERIFICA_CAIXA = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CCX_VERIFICA_CAIXA
    QExec.SQL.Add('  CNF_LABORATORIO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_LABORATORIO
    QExec.SQL.Add('  CNF_MONTAGEM = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_MONTAGEM
    QExec.SQL.Add('  CNF_LAB_META = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LAB_META
    QExec.SQL.Add('  CNF_LAB_COTA1 = '              + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LAB_COTA1
    QExec.SQL.Add('  CNF_LAB_COTA2 = '              + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LAB_COTA2
    QExec.SQL.Add('  CNF_LIM_DESC_JR_SIMPLES = '    + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LIM_DESC_JR_SIMPLES
    QExec.SQL.Add('  CNF_LIM_DESC_JR_ESPECIAL = '   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_LIM_DESC_JR_ESPECIAL
    QExec.SQL.Add('  CNF_MONT_META = '              + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_MONT_META
    QExec.SQL.Add('  CNF_MONT_COTA1 = '             + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_MONT_COTA1
    QExec.SQL.Add('  CNF_MONT_COTA2 = '             + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT_5)))) + ','); //CNF_MONT_COTA2
    QExec.SQL.Add('  CNF_MAGAZINE = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_MAGAZINE
    QExec.SQL.Add('  CNF_AVISTA = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_AVISTA
    QExec.SQL.Add('  CNF_CHEQUE = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CHEQUE
    QExec.SQL.Add('  CNF_CCREDITO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CCREDITO
    QExec.SQL.Add('  CNF_CARNE = '                  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_CARNE
    QExec.SQL.Add('  CNF_BOLETO = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_BOLETO
    QExec.SQL.Add('  CNF_QUALCPD = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_QUALCPD
    QExec.SQL.Add('  CNF_NFE = '                    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_NFE
    QExec.SQL.Add('  CNF_ESTOQUE_IDEAL = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_4)))              + ','); //CNF_ESTOQUE_IDEAL
    QExec.SQL.Add('  CNF_FTP_URL = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                + ','); //CNF_FTP_URL
    QExec.SQL.Add('  CNF_FTP_USUARIO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_FTP_USUARIO
    QExec.SQL.Add('  CNF_FTP_SENHA = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_FTP_SENHA
    QExec.SQL.Add('  CNF_FTP_PASSIVO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                 + ','); //CNF_FTP_PASSIVO
    QExec.SQL.Add('  CNF_ARQUIVO_PRINCIPAL = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                + ','); //CNF_ARQUIVO_PRINCIPAL
    QExec.SQL.Add('  CNF_ARQUIVO_CHAVE = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                     ); //CNF_ARQUIVO_CHAVE
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'CNF' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_CSG(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND CSG_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  CSG_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  CONSIGNACAO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;


  procedure subDeleteItem;
  begin
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('DELETE FROM');
    QExec.SQL.Add('  ITEM_DE_CONSIGNACAO');
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsertItem;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO ITEM_DE_CONSIGNACAO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  CSG_CODIGO,');
    QExec.SQL.Add('  ICS_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  ICS_DATA,');
    QExec.SQL.Add('  ICS_QUANTIDADE,');
    QExec.SQL.Add('  ICS_VALOR,');
    QExec.SQL.Add('  ICS_OBSERVACAO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CSG_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //ICS_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //ICS_DATA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //ICS_QUANTIDADE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //ICS_VALOR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ')'); //ICS_OBSERVACAO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO CONSIGNACAO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  CSG_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  CSG_DATA,');
    QExec.SQL.Add('  CSG_DT_ALTERADO,');
    QExec.SQL.Add('  CSG_VALOR,');
    QExec.SQL.Add('  CSG_SITUACAO,');
    QExec.SQL.Add('  CSG_OBSERVACAO,');
    QExec.SQL.Add('  CLI_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CSG_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //CSG_DATA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //CSG_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //CSG_VALOR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CSG_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //CSG_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //CLI_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE CONSIGNACAO SET');
    QExec.SQL.Add('  USU_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  FUN_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  CSG_DATA = '              + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //CSG_DATA
    QExec.SQL.Add('  CSG_DT_ALTERADO = '       + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //CSG_DT_ALTERADO
    QExec.SQL.Add('  CSG_VALOR = '             + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //CSG_VALOR
    QExec.SQL.Add('  CSG_SITUACAO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CSG_SITUACAO
    QExec.SQL.Add('  CSG_OBSERVACAO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //CSG_OBSERVACAO
    QExec.SQL.Add('  CLI_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        ); //CLI_CODIGO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if ( Copy(sLinha,0,3) = 'CSG' ) or ( Copy(sLinha,0,3) = 'ICS' ) then
  begin
    if ( Copy(sLinha,0,3) = 'CSG' ) then
    begin
      subDeleteItem;
      if not subExisteRegistro then
        subInsert
      else
        subUpdate;
    end
    else
      subInsertItem;
  end;
end;

procedure TRecebeComunicacao.grTab_DPV(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND PDV_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  PDV_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  DETALHE_DE_PEDIDO_DE_VENDA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO DETALHE_DE_PEDIDO_DE_VENDA (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  PDV_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  DPV_DT_CADASTRO,');
    QExec.SQL.Add('  DPV_DT_ALTERADO,');
    QExec.SQL.Add('  DPV_TIPO_ARMACAO,');
    QExec.SQL.Add('  DPV_OBS_ARMACAO,');
    QExec.SQL.Add('  DPV_TIPO_LENTES,');
    QExec.SQL.Add('  DPV_OBS_LENTES,');
    QExec.SQL.Add('  DPV_MEDICO_CRM,');
    QExec.SQL.Add('  DPV_MEDICO_NOME,');
    QExec.SQL.Add('  DPV_MEDICO_FONE,');
    QExec.SQL.Add('  DPV_OD_ESF,');
    QExec.SQL.Add('  DPV_OE_ESF,');
    QExec.SQL.Add('  DPV_OD_CIL,');
    QExec.SQL.Add('  DPV_OE_CIL,');
    QExec.SQL.Add('  DPV_OD_EIXO,');
    QExec.SQL.Add('  DPV_OE_EIXO,');
    QExec.SQL.Add('  DPV_OD_DNP,');
    QExec.SQL.Add('  DPV_OE_DNP,');
    QExec.SQL.Add('  DPV_OD_ALT,');
    QExec.SQL.Add('  DPV_OE_ALT,');
    QExec.SQL.Add('  DPV_OD_ADICAO,');
    QExec.SQL.Add('  DPV_OE_ADICAO,');
    QExec.SQL.Add('  DPV_SITUACAO,');
    QExec.SQL.Add('  DPV_OBSERVACAO,');
    QExec.SQL.Add('  FUN_CODIGO_1,');
    QExec.SQL.Add('  FUN_CODIGO_2,');
    QExec.SQL.Add('  DPV_COMISSAO_1,');
    QExec.SQL.Add('  DPV_COMISSAO_2,');
    QExec.SQL.Add('  DPV_MEIO,');
    QExec.SQL.Add('  DPV_MEIO_OUTRO,');
    QExec.SQL.Add('  DPV_PASCIENTE)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //DPV_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //DPV_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //DPV_TIPO_ARMACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //DPV_OBS_ARMACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //DPV_TIPO_LENTES
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //DPV_OBS_LENTES
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //DPV_MEDICO_CRM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //DPV_MEDICO_NOME
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //DPV_MEDICO_FONE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_ESF
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_ESF
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_CIL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_CIL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_EIXO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_EIXO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_DNP
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_DNP
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_ALT
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_ALT
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_ADICAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_ADICAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //DPV_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //DPV_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO_1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO_2
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_COMISSAO_1
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_COMISSAO_2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //DPV_MEIO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //DPV_MEIO_OUTRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ')'); //DPV_PASCIENTE
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE DETALHE_DE_PEDIDO_DE_VENDA SET');
    QExec.SQL.Add('  USU_CODIGO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  DPV_DT_CADASTRO = '  + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //DPV_DT_CADASTRO
    QExec.SQL.Add('  DPV_DT_ALTERADO = '  + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //DPV_DT_ALTERADO
    QExec.SQL.Add('  DPV_TIPO_ARMACAO = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //DPV_TIPO_ARMACAO
    QExec.SQL.Add('  DPV_OBS_ARMACAO = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //DPV_OBS_ARMACAO
    QExec.SQL.Add('  DPV_TIPO_LENTES = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //DPV_TIPO_LENTES
    QExec.SQL.Add('  DPV_OBS_LENTES = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //DPV_OBS_LENTES
    QExec.SQL.Add('  DPV_MEDICO_CRM = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //DPV_MEDICO_CRM
    QExec.SQL.Add('  DPV_MEDICO_NOME = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //DPV_MEDICO_NOME
    QExec.SQL.Add('  DPV_MEDICO_FONE = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //DPV_MEDICO_FONE
    QExec.SQL.Add('  DPV_OD_ESF = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_ESF
    QExec.SQL.Add('  DPV_OE_ESF = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_ESF
    QExec.SQL.Add('  DPV_OD_CIL = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_CIL
    QExec.SQL.Add('  DPV_OE_CIL = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_CIL
    QExec.SQL.Add('  DPV_OD_EIXO = '      + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_EIXO
    QExec.SQL.Add('  DPV_OE_EIXO = '      + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_EIXO
    QExec.SQL.Add('  DPV_OD_DNP = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_DNP
    QExec.SQL.Add('  DPV_OE_DNP = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_DNP
    QExec.SQL.Add('  DPV_OD_ALT = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_ALT
    QExec.SQL.Add('  DPV_OE_ALT = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_ALT
    QExec.SQL.Add('  DPV_OD_ADICAO = '    + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OD_ADICAO
    QExec.SQL.Add('  DPV_OE_ADICAO = '    + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_OE_ADICAO
    QExec.SQL.Add('  DPV_SITUACAO = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //DPV_SITUACAO
    QExec.SQL.Add('  DPV_OBSERVACAO = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //DPV_OBSERVACAO
    QExec.SQL.Add('  FUN_CODIGO_1 = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO_1
    QExec.SQL.Add('  FUN_CODIGO_2 = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO_2
    QExec.SQL.Add('  DPV_COMISSAO_1 = '   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_COMISSAO_1
    QExec.SQL.Add('  DPV_COMISSAO_2 = '   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //DPV_COMISSAO_2
    QExec.SQL.Add('  DPV_MEIO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //DPV_MEIO
    QExec.SQL.Add('  DPV_MEIO_OUTRO = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //DPV_MEIO_OUTRO
    QExec.SQL.Add('  DPV_PASCIENTE = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                        ); //DPV_PASCIENTE
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'DPV' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_FAF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND FAF_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  FAF_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FATOR_DE_FINANCEIRA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO FATOR_DE_FINANCEIRA (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  FAF_CODIGO,');
    QExec.SQL.Add('  AGF_CODIGO,');
    QExec.SQL.Add('  FAF_NPARC,');
    QExec.SQL.Add('  FAF_FATOR,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  FAF_DT_ALTERADO,');
    QExec.SQL.Add('  FAF_DT_CADASTRO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //AGF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FAF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FAF_NPARC
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FAF_FATOR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FAF_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ')'); //FAF_DT_CADASTRO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE FATOR_DE_FINANCEIRA SET');
    QExec.SQL.Add('  AGF_CODIGO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //AGF_CODIGO
    QExec.SQL.Add('  FAF_NPARC = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FAF_NPARC
    QExec.SQL.Add('  FAF_FATOR = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FAF_FATOR
    QExec.SQL.Add('  USU_CODIGO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  FAF_DT_ALTERADO = ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FAF_DT_ALTERADO
    QExec.SQL.Add('  FAF_DT_CADASTRO = ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))      ); //FAF_DT_CADASTRO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'FAF' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_FOR(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND FOR_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  FOR_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FORNECEDOR');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO FORNECEDOR (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  FOR_CODIGO,');
    QExec.SQL.Add('  FOR_RZ_SOCIAL,');
    QExec.SQL.Add('  FOR_NOME_FAN,');
    QExec.SQL.Add('  FOR_CGC,');
    QExec.SQL.Add('  FOR_IE,');
    QExec.SQL.Add('  FOR_LOGRADOURO,');
    QExec.SQL.Add('  FOR_ENDERECO,');
    QExec.SQL.Add('  FOR_BAIRRO,');
    QExec.SQL.Add('  FOR_CIDADE,');
    QExec.SQL.Add('  FOR_UF,');
    QExec.SQL.Add('  FOR_CEP,');
    QExec.SQL.Add('  FOR_FONE,');
    QExec.SQL.Add('  FOR_SITUACAO,');
    QExec.SQL.Add('  FOR_OBSERVACAO1,');
    QExec.SQL.Add('  FOR_FAX,');
    QExec.SQL.Add('  FOR_SITE,');
    QExec.SQL.Add('  FOR_EMAIL,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  FOR_DT_ALTERADO,');
    QExec.SQL.Add('  PCP_CONHECIMENTO,');
    QExec.SQL.Add('  FOR_DT_CADASTRO,');
    QExec.SQL.Add('  CCX_CODIGO,');
    QExec.SQL.Add('  FOR_MAX_ITENS_NOTA,');
    QExec.SQL.Add('  FOR_MARCA,');
    QExec.SQL.Add('  FOR_REDUCAO_ICMS,');
    QExec.SQL.Add('  FOR_BANCO,');
    QExec.SQL.Add('  FOR_NUMERO_AGENCIA,');
    QExec.SQL.Add('  FOR_NUMERO_CONTA)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO                          
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ','); //FOR_RZ_SOCIAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FOR_NOME_FAN
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_CGC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_IE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_LOGRADOURO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FOR_ENDERECO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_BAIRRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_CIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                    + ','); //FOR_UF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_CEP
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_FONE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //FOR_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //FOR_OBSERVACAO1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_FAX
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FOR_SITE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FOR_EMAIL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FOR_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PCP_CONHECIMENTO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FOR_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_MAX_ITENS_NOTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //FOR_MARCA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FOR_REDUCAO_ICMS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_BANCO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_NUMERO_AGENCIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ')'); //FOR_NUMERO_CONTA
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE FORNECEDOR SET');
    QExec.SQL.Add('  FOR_RZ_SOCIAL = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ','); //FOR_RZ_SOCIAL
    QExec.SQL.Add('  FOR_NOME_FAN = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FOR_NOME_FAN
    QExec.SQL.Add('  FOR_CGC = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_CGC
    QExec.SQL.Add('  FOR_IE = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_IE
    QExec.SQL.Add('  FOR_LOGRADOURO = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_LOGRADOURO
    QExec.SQL.Add('  FOR_ENDERECO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FOR_ENDERECO
    QExec.SQL.Add('  FOR_BAIRRO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_BAIRRO
    QExec.SQL.Add('  FOR_CIDADE = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_CIDADE
    QExec.SQL.Add('  FOR_UF = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                    + ','); //FOR_UF
    QExec.SQL.Add('  FOR_CEP = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_CEP
    QExec.SQL.Add('  FOR_FONE = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_FONE
    QExec.SQL.Add('  FOR_SITUACAO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //FOR_SITUACAO
    QExec.SQL.Add('  FOR_OBSERVACAO1 = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //FOR_OBSERVACAO1
    QExec.SQL.Add('  FOR_FAX = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_FAX
    QExec.SQL.Add('  FOR_SITE = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FOR_SITE
    QExec.SQL.Add('  FOR_EMAIL = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FOR_EMAIL
    QExec.SQL.Add('  USU_CODIGO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  FOR_DT_ALTERADO = '    + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FOR_DT_ALTERADO
    QExec.SQL.Add('  PCP_CONHECIMENTO = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PCP_CONHECIMENTO
    QExec.SQL.Add('  FOR_DT_CADASTRO = '    + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FOR_DT_CADASTRO
    QExec.SQL.Add('  CCX_CODIGO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO
    QExec.SQL.Add('  FOR_MAX_ITENS_NOTA = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_MAX_ITENS_NOTA
    QExec.SQL.Add('  FOR_MARCA = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //FOR_MARCA
    QExec.SQL.Add('  FOR_REDUCAO_ICMS = '   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FOR_REDUCAO_ICMS
    QExec.SQL.Add('  FOR_BANCO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_BANCO
    QExec.SQL.Add('  FOR_NUMERO_AGENCIA = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FOR_NUMERO_AGENCIA
    QExec.SQL.Add('  FOR_NUMERO_CONTA = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                        ); //FOR_NUMERO_CONTA
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'FOR' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_FPG(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND FPG_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  FPG_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FORMA_DE_PAGAMENTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO FORMA_DE_PAGAMENTO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  FPG_CODIGO,');
    QExec.SQL.Add('  FPG_PRAZO,');
    QExec.SQL.Add('  FPG_DESCRICAO,');
    QExec.SQL.Add('  FPG_PRAZO_MEDIO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  FPG_DT_ALTERADO,');
    QExec.SQL.Add('  FPG_DT_CADASTRO,');
    QExec.SQL.Add('  FPG_COMPRA,');
    QExec.SQL.Add('  FPG_SITUACAO,');
    QExec.SQL.Add('  FPG_DESCONTO,');
    QExec.SQL.Add('  FPG_TIPOPAG_EXCLUSIVO,');
    QExec.SQL.Add('  TBP_CODIGO,');
    QExec.SQL.Add('  FPG_CENTAVOS_ENTRADA)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_CODIGO,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ','); //FPG_PRAZO,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ','); //FPG_DESCRICAO,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_PRAZO_MEDIO,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO,');
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FPG_DT_ALTERADO,');
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FPG_DT_CADASTRO,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_COMPRA,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //FPG_SITUACAO,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_DESCONTO,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_TIPOPAG_EXCLUSIVO,')
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TBP_CODIGO,');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //FPG_CENTAVOS_ENTRADA');
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE FORMA_DE_PAGAMENTO SET');
    QExec.SQL.Add('  FPG_PRAZO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ','); //FPG_PRAZO,');
    QExec.SQL.Add('  FPG_DESCRICAO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ','); //FPG_DESCRICAO,');
    QExec.SQL.Add('  FPG_PRAZO_MEDIO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_PRAZO_MEDIO,');
    QExec.SQL.Add('  USU_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO,');
    QExec.SQL.Add('  FPG_DT_ALTERADO = '       + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FPG_DT_ALTERADO,');
    QExec.SQL.Add('  FPG_DT_CADASTRO = '       + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FPG_DT_CADASTRO,');
    QExec.SQL.Add('  FPG_COMPRA = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_COMPRA,');
    QExec.SQL.Add('  FPG_SITUACAO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //FPG_SITUACAO,');
    QExec.SQL.Add('  FPG_DESCONTO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_DESCONTO,');
    QExec.SQL.Add('  FPG_TIPOPAG_EXCLUSIVO = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_TIPOPAG_EXCLUSIVO,')
    QExec.SQL.Add('  TBP_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TBP_CODIGO,');
    QExec.SQL.Add('  FPG_CENTAVOS_ENTRADA = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        ); //FPG_CENTAVOS_ENTRADA');
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'FPG' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_FUN(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND FUN_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  FUN_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  FUNCIONARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO FUNCIONARIO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  FUN_NOME,');
    QExec.SQL.Add('  SEC_CODIGO,');
    QExec.SQL.Add('  FUN_FUNCAO,');
    QExec.SQL.Add('  FUN_DT_NASC,');
    QExec.SQL.Add('  FUN_LOGRADOURO,');
    QExec.SQL.Add('  FUN_ENDERECO,');
    QExec.SQL.Add('  FUN_BAIRRO,');
    QExec.SQL.Add('  FUN_CIDADE,');
    QExec.SQL.Add('  FUN_UF,');
    QExec.SQL.Add('  FUN_CEP,');
    QExec.SQL.Add('  FUN_FONE,');
    QExec.SQL.Add('  FUN_SITUACAO,');
    QExec.SQL.Add('  FUN_CPF,');
    QExec.SQL.Add('  FUN_RG,');
    QExec.SQL.Add('  FUN_COTA,');
    QExec.SQL.Add('  FUN_PERC_ABAIXO,');
    QExec.SQL.Add('  FUN_PERC_ACIMA,');
    QExec.SQL.Add('  FUN_ULT_EMPR,');
    QExec.SQL.Add('  FUN_REFERENCIA,');
    QExec.SQL.Add('  FUN_ROTA,');
    QExec.SQL.Add('  FUN_OBSERVACAO1,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  FUN_DT_ALTERADO,');
    QExec.SQL.Add('  FUN_APELIDO,');
    QExec.SQL.Add('  FUN_EMAIL,');
    QExec.SQL.Add('  FUN_CELULAR,');
    QExec.SQL.Add('  FUN_USU_CODIGO,');
    QExec.SQL.Add('  FUN_DT_CADASTRO,');
    QExec.SQL.Add('  FUN_SUPERIOR,');
    QExec.SQL.Add('  FUN_PARCEIRO,');
    QExec.SQL.Add('  FUN_TODOS_CENTROS,');
    QExec.SQL.Add('  FUN_APARECE_SERVICOS,');
    QExec.SQL.Add('  FUN_APARECE_VENDAS)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FUN_NOME
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SEC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_FUNCAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FUN_DT_NASC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_LOGRADOURO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_ENDERECO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_BAIRRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_CIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                    + ','); //FUN_UF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_CEP
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_FONE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //FUN_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_CPF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_RG
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FUN_COTA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FUN_PERC_ABAIXO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FUN_PERC_ACIMA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //FUN_ULT_EMPR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //FUN_REFERENCIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_ROTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //FUN_OBSERVACAO1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FUN_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //FUN_APELIDO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FUN_EMAIL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_CELULAR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FUN_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_SUPERIOR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_PARCEIRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_TODOS_CENTROS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_APARECE_SERVICOS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //FUN_APARECE_VENDAS
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE FUNCIONARIO SET');
    QExec.SQL.Add('  FUN_NOME = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FUN_NOME
    QExec.SQL.Add('  SEC_CODIGO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SEC_CODIGO
    QExec.SQL.Add('  FUN_FUNCAO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_FUNCAO
    QExec.SQL.Add('  FUN_DT_NASC = '          + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FUN_DT_NASC
    QExec.SQL.Add('  FUN_LOGRADOURO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_LOGRADOURO
    QExec.SQL.Add('  FUN_ENDERECO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_ENDERECO
    QExec.SQL.Add('  FUN_BAIRRO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_BAIRRO
    QExec.SQL.Add('  FUN_CIDADE = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_CIDADE
    QExec.SQL.Add('  FUN_UF = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                    + ','); //FUN_UF
    QExec.SQL.Add('  FUN_CEP = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_CEP
    QExec.SQL.Add('  FUN_FONE = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_FONE
    QExec.SQL.Add('  FUN_SITUACAO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //FUN_SITUACAO
    QExec.SQL.Add('  FUN_CPF = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_CPF
    QExec.SQL.Add('  FUN_RG = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_RG
    QExec.SQL.Add('  FUN_COTA = '             + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FUN_COTA
    QExec.SQL.Add('  FUN_PERC_ABAIXO = '      + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FUN_PERC_ABAIXO
    QExec.SQL.Add('  FUN_PERC_ACIMA = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //FUN_PERC_ACIMA
    QExec.SQL.Add('  FUN_ULT_EMPR = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //FUN_ULT_EMPR
    QExec.SQL.Add('  FUN_REFERENCIA = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //FUN_REFERENCIA
    QExec.SQL.Add('  FUN_ROTA = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_ROTA
    QExec.SQL.Add('  FUN_OBSERVACAO1 = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //FUN_OBSERVACAO1
    QExec.SQL.Add('  USU_CODIGO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  FUN_DT_ALTERADO = '      + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FUN_DT_ALTERADO
    QExec.SQL.Add('  FUN_APELIDO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //FUN_APELIDO
    QExec.SQL.Add('  FUN_EMAIL = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //FUN_EMAIL
    QExec.SQL.Add('  FUN_CELULAR = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //FUN_CELULAR
    QExec.SQL.Add('  FUN_USU_CODIGO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_USU_CODIGO
    QExec.SQL.Add('  FUN_DT_CADASTRO = '      + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //FUN_DT_CADASTRO
    QExec.SQL.Add('  FUN_SUPERIOR = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_SUPERIOR
    QExec.SQL.Add('  FUN_PARCEIRO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_PARCEIRO
    QExec.SQL.Add('  FUN_TODOS_CENTROS = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_TODOS_CENTROS
    QExec.SQL.Add('  FUN_APARECE_SERVICOS = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_APARECE_SERVICOS
    QExec.SQL.Add('  FUN_APARECE_VENDAS = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        ); //FUN_APARECE_VENDAS
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'FUN' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_GRP(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND GRP_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  GRP_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  GRUPO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO GRUPO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  GRP_CODIGO,');
    QExec.SQL.Add('  GRP_DESCRICAO,');
    QExec.SQL.Add('  GRP_OBSERVACAO,');
    QExec.SQL.Add('  GRP_ESPECIAL,');
    QExec.SQL.Add('  GRP_SITUACAO,');
    QExec.SQL.Add('  GRP_DT_CADASTRO,');
    QExec.SQL.Add('  GRP_DT_ALTERADO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  GRP_SERVICO,');
    QExec.SQL.Add('  SUG_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //GRP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //GRP_DESCRICAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //GRP_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //GRP_ESPECIAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //GRP_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //GRP_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //GRP_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //GRP_SERVICO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //SUG_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE GRUPO SET');
    QExec.SQL.Add('  GRP_DESCRICAO = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //GRP_DESCRICAO
    QExec.SQL.Add('  GRP_OBSERVACAO = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //GRP_OBSERVACAO
    QExec.SQL.Add('  GRP_ESPECIAL = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //GRP_ESPECIAL
    QExec.SQL.Add('  GRP_SITUACAO = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //GRP_SITUACAO
    QExec.SQL.Add('  GRP_DT_CADASTRO = ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //GRP_DT_CADASTRO
    QExec.SQL.Add('  GRP_DT_ALTERADO = ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //GRP_DT_ALTERADO
    QExec.SQL.Add('  USU_CODIGO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  GRP_SERVICO = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //GRP_SERVICO
    QExec.SQL.Add('  SUG_CODIGO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        ); //SUG_CODIGO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'GRP' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_IES(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND PRD_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  PRD_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  ITEM_DE_ESTOQUE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO ITEM_DE_ESTOQUE (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  IES_SCOMERCIAL,');
    QExec.SQL.Add('  IES_SFISICO,');
    QExec.SQL.Add('  IES_SRESERVADO,');
    QExec.SQL.Add('  IES_SFISCAL,');
    QExec.SQL.Add('  IES_INDISPONIVEL,');
    QExec.SQL.Add('  IES_DH_ATUALIZADO,');
    QExec.SQL.Add('  IES_INVENT_FISICO,');
    QExec.SQL.Add('  IES_INVENT_COMERCIAL,');
    QExec.SQL.Add('  IES_INVENT_RESERV,');
    QExec.SQL.Add('  IES_INVENT_DATA_FISICO,');
    QExec.SQL.Add('  IES_INVENT_DATA_COMERCIAL,');
    QExec.SQL.Add('  IES_INVENT_DATA_RESERV,');
    QExec.SQL.Add('  IES_SSN,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  IES_MAQUINA,');
    QExec.SQL.Add('  IES_SLJ4,');
    QExec.SQL.Add('  IES_SAMOSTRA,');
    QExec.SQL.Add('  IES_SBONIFICACAO,');
    QExec.SQL.Add('  IES_SAMOSTRA_FISCAL,');
    QExec.SQL.Add('  IES_SBONIFICACAO_FISCAL,');
    QExec.SQL.Add('  FUN_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SCOMERCIAL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SFISICO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SRESERVADO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SFISCAL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_INDISPONIVEL
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IES_DH_ATUALIZADO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_INVENT_FISICO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_INVENT_COMERCIAL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_INVENT_RESERV
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IES_INVENT_DATA_FISICO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IES_INVENT_DATA_COMERCIAL
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IES_INVENT_DATA_RESERV
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SSN
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IES_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SLJ4
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SAMOSTRA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SBONIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SAMOSTRA_FISCAL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SBONIFICACAO_FISCAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //FUN_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE ITEM_DE_ESTOQUE SET');
    QExec.SQL.Add('  IES_SCOMERCIAL = '            + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SCOMERCIAL
    QExec.SQL.Add('  IES_SFISICO = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SFISICO
    QExec.SQL.Add('  IES_SRESERVADO = '            + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SRESERVADO
    QExec.SQL.Add('  IES_SFISCAL = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SFISCAL
    QExec.SQL.Add('  IES_INDISPONIVEL = '          + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_INDISPONIVEL
    QExec.SQL.Add('  IES_DH_ATUALIZADO = '         + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IES_DH_ATUALIZADO
    QExec.SQL.Add('  IES_INVENT_FISICO = '         + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_INVENT_FISICO
    QExec.SQL.Add('  IES_INVENT_COMERCIAL = '      + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_INVENT_COMERCIAL
    QExec.SQL.Add('  IES_INVENT_RESERV = '         + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_INVENT_RESERV
    QExec.SQL.Add('  IES_INVENT_DATA_FISICO = '    + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IES_INVENT_DATA_FISICO
    QExec.SQL.Add('  IES_INVENT_DATA_COMERCIAL = ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IES_INVENT_DATA_COMERCIAL
    QExec.SQL.Add('  IES_INVENT_DATA_RESERV = '    + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IES_INVENT_DATA_RESERV
    QExec.SQL.Add('  IES_SSN = '                   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SSN
    QExec.SQL.Add('  USU_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  IES_MAQUINA = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IES_MAQUINA
    QExec.SQL.Add('  IES_SLJ4 = '                  + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SLJ4
    QExec.SQL.Add('  IES_SAMOSTRA = '              + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SAMOSTRA
    QExec.SQL.Add('  IES_SBONIFICACAO = '          + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SBONIFICACAO
    QExec.SQL.Add('  IES_SAMOSTRA_FISCAL = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SAMOSTRA_FISCAL
    QExec.SQL.Add('  IES_SBONIFICACAO_FISCAL = '   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IES_SBONIFICACAO_FISCAL
    QExec.SQL.Add('  FUN_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        ); //FUN_CODIGO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'IES' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_INV(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND INV_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  INV_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  INVENTARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;


  procedure subDeleteItem;
  begin
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('DELETE FROM');
    QExec.SQL.Add('  ITEM_DE_INVENTARIO');
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsertItem;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO ITEM_DE_INVENTARIO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  INV_CODIGO,');
    QExec.SQL.Add('  IIV_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  IIV_QUANT_SIST,');
    QExec.SQL.Add('  IIV_QUANT_INF,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  IIV_DT_CADASTRO,');
    QExec.SQL.Add('  IIV_DT_ALTERADO,');
    QExec.SQL.Add('  IIV_OBSERVACAO,');
    QExec.SQL.Add('  LOT_CODIGO,');
    QExec.SQL.Add('  FUN_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //INV_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IIV_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IIV_QUANT_SIST
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IIV_QUANT_INF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IIV_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IIV_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //IIV_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //LOT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //FUN_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO INVENTARIO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  INV_CODIGO,');
    QExec.SQL.Add('  INV_DATA,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  INV_SITUACAO,');
    QExec.SQL.Add('  INV_OBSERVACAO1,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  INV_DT_ALTERADO,');
    QExec.SQL.Add('  INV_TIPO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //INV_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //INV_DATA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //INV_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //INV_OBSERVACAO1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //INV_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //INV_TIPO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE INVENTARIO SET');
    QExec.SQL.Add('  INV_DATA = '        + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //INV_DATA
    QExec.SQL.Add('  FUN_CODIGO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  INV_SITUACAO = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //INV_SITUACAO
    QExec.SQL.Add('  INV_OBSERVACAO1 = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //INV_OBSERVACAO1
    QExec.SQL.Add('  USU_CODIGO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  INV_DT_ALTERADO = ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //INV_DT_ALTERADO
    QExec.SQL.Add('  INV_TIPO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        ); //INV_TIPO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if ( Copy(sLinha,0,3) = 'INV' ) or ( Copy(sLinha,0,3) = 'IIV' ) then
  begin
    if ( Copy(sLinha,0,3) = 'INV' ) then
    begin
      subDeleteItem;
      if not subExisteRegistro then
        subInsert
      else
        subUpdate;
    end
    else
      subInsertItem;
  end;
end;

procedure TRecebeComunicacao.grTab_MCR(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND MCR_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  MCR_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_CREDITO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO MOVIMENTO_DE_CREDITO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  MCR_CODIGO,');
    QExec.SQL.Add('  CLI_CODIGO,');
    QExec.SQL.Add('  CNC_CLIENTE,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  MCR_DT_CADASTRO,');
    QExec.SQL.Add('  MCR_DT_ALTERADO,');
    QExec.SQL.Add('  MCR_DC,');
    QExec.SQL.Add('  MCR_TIPO,');
    QExec.SQL.Add('  MCR_VALOR_ANT,');
    QExec.SQL.Add('  MCR_VALOR,');
    QExec.SQL.Add('  CNC_ENT_CODIGO,');
    QExec.SQL.Add('  MCR_ENT_CODIGO,');
    QExec.SQL.Add('  MCR_SITUACAO,');
    QExec.SQL.Add('  MCR_OBSERVACAO,');
    QExec.SQL.Add('  MCR_MAQUINA,');
    QExec.SQL.Add('  CNC_PEDIDO,');
    QExec.SQL.Add('  PDV_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MCR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CLIENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MCR_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MCR_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                    + ','); //MCR_DC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MCR_TIPO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MCR_VALOR_ANT
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MCR_VALOR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_ENT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MCR_ENT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MCR_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //MCR_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MCR_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_PEDIDO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //PDV_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'MCR' then
  begin
    if not subExisteRegistro then
      subInsert;
  end;
end;

procedure TRecebeComunicacao.grTab_MEC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND MEC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  MEC_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_ESTOQUE_COMERCIAL');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);

    //showmessage(QSelect.SQL.gettext);

    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO MOVIMENTO_DE_ESTOQUE_COMERCIAL (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  MEC_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  MEC_DATA_HORA,');
    QExec.SQL.Add('  MEC_ES,');
    QExec.SQL.Add('  MEC_TIPO_MOV,');
    QExec.SQL.Add('  MEC_QUANTIDADE,');
    QExec.SQL.Add('  MEC_SALDO_ANT,');
    QExec.SQL.Add('  MEC_TIPO_ENT,');
    QExec.SQL.Add('  MEC_CNC_CODIGO_ENT,');
    QExec.SQL.Add('  MEC_ENT_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  MEC_OBSERVACAO,');
    QExec.SQL.Add('  MEC_MAQUINA,');
    QExec.SQL.Add('  MEC_RESERVADO,');
    QExec.SQL.Add('  MEC_INDISPONIVEL,');
    QExec.SQL.Add('  MEC_AMOSTRA_ANTERIOR,');
    QExec.SQL.Add('  MEC_AMOSTRA,');
    QExec.SQL.Add('  MEC_BONIFICACAO_ANTERIOR,');
    QExec.SQL.Add('  MEC_BONIFICACAO,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  LOT_CODIGO,');
    QExec.SQL.Add('  MEC_QTD_ANT_LOTE)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MEC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MEC_DATA_HORA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                    + ','); //MEC_ES
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MEC_TIPO_MOV
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEC_QUANTIDADE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEC_SALDO_ANT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MEC_TIPO_ENT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //MEC_CNC_CODIGO_ENT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MEC_ENT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //MEC_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MEC_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEC_RESERVADO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEC_INDISPONIVEL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEC_AMOSTRA_ANTERIOR
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEC_AMOSTRA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEC_BONIFICACAO_ANTERIOR
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEC_BONIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //LOT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ')'); //MEC_QTD_ANT_LOTE
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'MEC' then
  begin
    if not subExisteRegistro then
      subInsert;
  end;
end;

procedure TRecebeComunicacao.grTab_MEF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND MEF_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  MEF_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_ESTOQUE_FISICO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO MOVIMENTO_DE_ESTOQUE_FISICO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  MEF_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  MEF_DATA,');
    QExec.SQL.Add('  MEF_ES,');
    QExec.SQL.Add('  MEF_QUANTIDADE,');
    QExec.SQL.Add('  MEF_SALDO_ANT,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  MEF_CNC_CODIGO_ENT,');
    QExec.SQL.Add('  MEF_ENT_CODIGO,');
    QExec.SQL.Add('  MEF_TIPO_MOV,');
    QExec.SQL.Add('  MEF_OBSERVACAO,');
    QExec.SQL.Add('  MEF_MAQUINA,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  LOT_CODIGO,');
    QExec.SQL.Add('  MEF_QTD_ANT_LOTE,');
    QExec.SQL.Add('  CNC_DESTINO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MEF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MEF_DATA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                    + ','); //MEF_ES
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEF_QUANTIDADE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEF_SALDO_ANT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //MEF_CNC_CODIGO_ENT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MEF_ENT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MEF_TIPO_MOV
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //MEF_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MEF_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //LOT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MEF_QTD_ANT_LOTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ')'); //CNC_DESTINO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'MEF' then
  begin
    if not subExisteRegistro then
      subInsert;
  end;
end;

procedure TRecebeComunicacao.grTab_MES(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND MES_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  MES_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_ESTOQUE_FISCAL');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO MOVIMENTO_DE_ESTOQUE_FISCAL (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  MES_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  MES_DATA_HORA,');
    QExec.SQL.Add('  MES_ES,');
    QExec.SQL.Add('  MES_TIPO_MOV,');
    QExec.SQL.Add('  MES_QUANTIDADE,');
    QExec.SQL.Add('  MES_SALDO_ANT,');
    QExec.SQL.Add('  MES_TIPO_ENT,');
    QExec.SQL.Add('  MES_CNC_CODIGO_ENT,');
    QExec.SQL.Add('  MES_ENT_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  MES_OBSERVACAO,');
    QExec.SQL.Add('  MES_MAQUINA,');
    QExec.SQL.Add('  MES_AMOSTRA_ANTERIOR,');
    QExec.SQL.Add('  MES_AMOSTRA,');
    QExec.SQL.Add('  MES_BONIFICACAO_ANTERIOR,');
    QExec.SQL.Add('  MES_BONIFICACAO,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  LOT_CODIGO,');
    QExec.SQL.Add('  MES_QTD_ANT_LOTE)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MES_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MES_DATA_HORA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                    + ','); //MES_ES
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MES_TIPO_MOV
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MES_QUANTIDADE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MES_SALDO_ANT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MES_TIPO_ENT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //MES_CNC_CODIGO_ENT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MES_ENT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //MES_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MES_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MES_AMOSTRA_ANTERIOR
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MES_AMOSTRA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MES_BONIFICACAO_ANTERIOR
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MES_BONIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //LOT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ')'); //MES_QTD_ANT_LOTE
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'MES' then
  begin
    if not subExisteRegistro then
      subInsert;
  end;
end;

procedure TRecebeComunicacao.grTab_MSG(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND MSG_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  MSG_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MENSAGEM');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO MENSAGEM (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  MSG_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  MSG_DT_CADASTRO,');
    QExec.SQL.Add('  MSG_DT_ALTERADO,');
    QExec.SQL.Add('  MSG_CNC_DESTINO,');
    QExec.SQL.Add('  MSG_USU_DESTINO,');
    QExec.SQL.Add('  MSG_SITUACAO_ENVIAR,');
    QExec.SQL.Add('  MSG_SITUACAO_RECEBER,');
    QExec.SQL.Add('  MSG_PUBLICA,');
    QExec.SQL.Add('  MSG_AVISO_LEITURA,');
    QExec.SQL.Add('  MSG_URGENTE,');
    QExec.SQL.Add('  MSG_APAGADA,');
    QExec.SQL.Add('  MSG_ALERTADO,');
    QExec.SQL.Add('  MSG_ASSUNTO,');
    QExec.SQL.Add('  MSG_MENSAGEM,');
    QExec.SQL.Add('  MSG_OBSERVACAO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MSG_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MSG_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MSG_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //MSG_CNC_DESTINO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MSG_USU_DESTINO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_SITUACAO_ENVIAR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_SITUACAO_RECEBER
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_PUBLICA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_AVISO_LEITURA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_URGENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_APAGADA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_ALERTADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //MSG_ASSUNTO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //MSG_MENSAGEM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ')'); //MSG_OBSERVACAO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE MENSAGEM SET');
    QExec.SQL.Add('  USU_CODIGO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  MSG_DT_CADASTRO = '      + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MSG_DT_CADASTRO
    QExec.SQL.Add('  MSG_DT_ALTERADO = '      + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MSG_DT_ALTERADO
    QExec.SQL.Add('  MSG_CNC_DESTINO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //MSG_CNC_DESTINO
    QExec.SQL.Add('  MSG_USU_DESTINO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MSG_USU_DESTINO
    QExec.SQL.Add('  MSG_SITUACAO_ENVIAR = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_SITUACAO_ENVIAR
    QExec.SQL.Add('  MSG_SITUACAO_RECEBER = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_SITUACAO_RECEBER
    QExec.SQL.Add('  MSG_PUBLICA = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_PUBLICA
    QExec.SQL.Add('  MSG_AVISO_LEITURA = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_AVISO_LEITURA
    QExec.SQL.Add('  MSG_URGENTE = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_URGENTE
    QExec.SQL.Add('  MSG_APAGADA = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_APAGADA
    QExec.SQL.Add('  MSG_ALERTADO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //MSG_ALERTADO
    QExec.SQL.Add('  MSG_ASSUNTO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //MSG_ASSUNTO
    QExec.SQL.Add('  MSG_MENSAGEM = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //MSG_MENSAGEM
    QExec.SQL.Add('  MSG_OBSERVACAO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                       ); //MSG_OBSERVACAO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'MSG' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_MVC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND MVC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  MVC_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  MOVIMENTO_DE_CAIXA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO MOVIMENTO_DE_CAIXA (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  MVC_CODIGO,');
    QExec.SQL.Add('  CCX_CODIGO,');
    QExec.SQL.Add('  CAX_CODIGO,');
    QExec.SQL.Add('  MVC_DESCRICAO,');
    QExec.SQL.Add('  MVC_DATA,');
    QExec.SQL.Add('  MVC_DC,');
    QExec.SQL.Add('  MVC_VALOR,');
    QExec.SQL.Add('  MVC_FLAG,');
    QExec.SQL.Add('  MVC_TIT_TIPO,');
    QExec.SQL.Add('  MVC_TIT_CC,');
    QExec.SQL.Add('  MVC_TIT_NUMERO,');
    QExec.SQL.Add('  MVC_TIPO_PGTO,');
    QExec.SQL.Add('  MVC_TIT_SEQUENCIA,');
    QExec.SQL.Add('  MVC_OBSERVACAO1,');
    QExec.SQL.Add('  TIT_CODIGO,');
    QExec.SQL.Add('  CNC_TITULO,');
    QExec.SQL.Add('  MVC_PT,');
    QExec.SQL.Add('  MVC_COMPETENCIA,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  MVC_DT_ALTERADO,');
    QExec.SQL.Add('  CCX_CODIGO_REC,');
    QExec.SQL.Add('  MVC_NAO_CONTABIL,');
    QExec.SQL.Add('  MVC_ORIGEM_EXTORNO,');
    QExec.SQL.Add('  MVC_JUROS,');
    QExec.SQL.Add('  MVC_DESCONTO,');
    QExec.SQL.Add('  MVC_CRED_CLI,');
    QExec.SQL.Add('  MVC_VALOR_DOC,');
    QExec.SQL.Add('  MVC_MAQUINA,');
    QExec.SQL.Add('  MVC_DT_CHEQUE,');
    QExec.SQL.Add('  CHQ_CODIGO,');
    QExec.SQL.Add('  CNC_CHEQUE)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MVC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CAX_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ','); //MVC_DESCRICAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MVC_DATA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                    + ','); //MVC_DC
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MVC_VALOR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //MVC_FLAG
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MVC_TIT_TIPO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MVC_TIT_CC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //MVC_TIT_NUMERO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MVC_TIPO_PGTO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //MVC_TIT_SEQUENCIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //MVC_OBSERVACAO1
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TIT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_TITULO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                    + ','); //MVC_PT
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MVC_COMPETENCIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MVC_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO_REC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MVC_NAO_CONTABIL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MVC_ORIGEM_EXTORNO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MVC_JUROS
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MVC_DESCONTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MVC_CRED_CLI
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //MVC_VALOR_DOC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MVC_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //MVC_DT_CHEQUE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CHQ_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //CNC_CHEQUE
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'MVC' then
  begin
    if not subExisteRegistro then
      subInsert;
  end;
end;

procedure TRecebeComunicacao.grTab_NTF(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND NTF_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  NTF_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  NOTA_FISCAL');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subDeleteItem;
  begin
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('DELETE FROM');
    QExec.SQL.Add('  ITEM_DE_NOTA_FISCAL');
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsertItem;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO ITEM_DE_NOTA_FISCAL (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  NTF_CODIGO,');
    QExec.SQL.Add('  INF_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  INF_SERVICO,');
    QExec.SQL.Add('  INF_QUANTIDADE,');
    QExec.SQL.Add('  INF_PRECO,');
    QExec.SQL.Add('  INF_DESCONTO,');
    QExec.SQL.Add('  INF_TIPO_ALIQUOTA,');
    QExec.SQL.Add('  INF_ALIQUOTA,');
    QExec.SQL.Add('  INF_ALIQUOTA_IPI,');
    QExec.SQL.Add('  CNC_ORIGEM,');
    QExec.SQL.Add('  INF_BONIFICACAO,');
    QExec.SQL.Add('  INF_ALIQUOTA_ISS,');
    QExec.SQL.Add('  INF_DT_CADASTRO,');
    QExec.SQL.Add('  INF_DT_ALTERADO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  INF_AMOSTRA,');
    QExec.SQL.Add('  LOT_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //INF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //INF_SERVICO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //INF_QUANTIDADE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //INF_PRECO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //INF_DESCONTO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //INF_TIPO_ALIQUOTA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //INF_ALIQUOTA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //INF_ALIQUOTA_IPI
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //INF_BONIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //INF_ALIQUOTA_ISS
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //INF_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //INF_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //INF_AMOSTRA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //LOT_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO NOTA_FISCAL (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  NTF_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  CNC_CLIENTE,');
    QExec.SQL.Add('  CLI_CODIGO,');
    QExec.SQL.Add('  FOR_CODIGO,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  TRN_CODIGO,');
    QExec.SQL.Add('  CAG_CODIGO,');
    QExec.SQL.Add('  NTF_PEDIDO,');
    QExec.SQL.Add('  NTF_DT_CADASTRO,');
    QExec.SQL.Add('  NTF_DT_ALTERADO,');
    QExec.SQL.Add('  NTF_DT_EMISSAO,');
    QExec.SQL.Add('  NTF_DT_ENTRADA_SAIDA,');
    QExec.SQL.Add('  NTF_ENTRADA_SAIDA,');
    QExec.SQL.Add('  NTF_TIPO_NOTA,');
    QExec.SQL.Add('  NTF_NOTA_FISCAL,');
    QExec.SQL.Add('  NTF_SERIE,');
    QExec.SQL.Add('  NTF_SUBSERIE,');
    QExec.SQL.Add('  NTF_SELO,');
    QExec.SQL.Add('  NTF_AIDF,');
    QExec.SQL.Add('  NTF_CFOP,');
    QExec.SQL.Add('  NTF_BASE_ICMS,');
    QExec.SQL.Add('  NTF_ICMS,');
    QExec.SQL.Add('  NTF_BASE_ICMS_SUB,');
    QExec.SQL.Add('  NTF_ICMS_SUB,');
    QExec.SQL.Add('  NTF_TOTAL_PRODUTO,');
    QExec.SQL.Add('  NTF_TOTAL_NOTA,');
    QExec.SQL.Add('  NTF_FRETE,');
    QExec.SQL.Add('  NTF_SEGURO,');
    QExec.SQL.Add('  NTF_OUTRAS,');
    QExec.SQL.Add('  NTF_IPI,');
    QExec.SQL.Add('  NTF_TIPO_TRANSPORTE,');
    QExec.SQL.Add('  NTF_TIPO_FRETE,');
    QExec.SQL.Add('  NTF_PLACA,');
    QExec.SQL.Add('  NTF_PLACA_UF,');
    QExec.SQL.Add('  NTF_QUANTIDADE,');
    QExec.SQL.Add('  NTF_ESPECIE,');
    QExec.SQL.Add('  NTF_MARCA,');
    QExec.SQL.Add('  NTF_NUMERO,');
    QExec.SQL.Add('  NTF_PESO_BRUTO,');
    QExec.SQL.Add('  NTF_PESO_LIQUIDO,');
    QExec.SQL.Add('  NTF_SITUACAO,');
    QExec.SQL.Add('  NTF_OBSERVACAO,');
    QExec.SQL.Add('  NTF_ICMS_FRETE,');
    QExec.SQL.Add('  NTF_CONHECIMENTO,');
    QExec.SQL.Add('  NTF_ISS,');
    QExec.SQL.Add('  NTF_BASE_ISS,');
    QExec.SQL.Add('  CNC_PEDIDO,');
    QExec.SQL.Add('  NTF_ENDERECO,');
    QExec.SQL.Add('  NTF_BAIRRO,');
    QExec.SQL.Add('  NTF_MUNICIPIO,');
    QExec.SQL.Add('  NTF_UF,');
    QExec.SQL.Add('  NTF_CEP,');
    QExec.SQL.Add('  NTF_NOTA_CUPOM,');
    QExec.SQL.Add('  NTF_AVULSA,');
    QExec.SQL.Add('  NTF_COD_PAGAMENTO,');
    QExec.SQL.Add('  NTF_TOTAL_SERVICO,');
    QExec.SQL.Add('  FUN_ARQUITETO,');
    QExec.SQL.Add('  CNC_ORIGEM,');
    QExec.SQL.Add('  NTF_COD_PAGAMENTO_2,');
    QExec.SQL.Add('  NTF_MAQUINA,');
    QExec.SQL.Add('  TRO_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CLIENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CAG_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_PEDIDO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //NTF_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //NTF_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //NTF_DT_EMISSAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //NTF_DT_ENTRADA_SAIDA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_ENTRADA_SAIDA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_TIPO_NOTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_NOTA_FISCAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_SERIE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_SUBSERIE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_SELO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_AIDF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_CFOP
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_BASE_ICMS
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_ICMS
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_BASE_ICMS_SUB
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_ICMS_SUB
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_TOTAL_PRODUTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_TOTAL_NOTA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_FRETE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_SEGURO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_OUTRAS
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_IPI
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_TIPO_TRANSPORTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_TIPO_FRETE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_PLACA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                    + ','); //NTF_PLACA_UF
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_QUANTIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_ESPECIE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //NTF_MARCA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_NUMERO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_PESO_BRUTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_PESO_LIQUIDO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //NTF_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_ICMS_FRETE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_CONHECIMENTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_ISS
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_BASE_ISS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNC_PEDIDO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //NTF_ENDERECO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //NTF_BAIRRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //NTF_MUNICIPIO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                    + ','); //NTF_UF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //NTF_CEP
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_NOTA_CUPOM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_AVULSA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_COD_PAGAMENTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_TOTAL_SERVICO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_ARQUITETO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_COD_PAGAMENTO_2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //TRO_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE NOTA_FISCAL SET');
    QExec.SQL.Add('  USU_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  CNC_CLIENTE = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CLIENTE
    QExec.SQL.Add('  CLI_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  FOR_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_CODIGO
    QExec.SQL.Add('  FUN_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  TRN_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRN_CODIGO
    QExec.SQL.Add('  CAG_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CAG_CODIGO
    QExec.SQL.Add('  NTF_PEDIDO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_PEDIDO
    QExec.SQL.Add('  NTF_DT_CADASTRO = '       + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //NTF_DT_CADASTRO
    QExec.SQL.Add('  NTF_DT_ALTERADO = '       + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //NTF_DT_ALTERADO
    QExec.SQL.Add('  NTF_DT_EMISSAO = '        + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //NTF_DT_EMISSAO
    QExec.SQL.Add('  NTF_DT_ENTRADA_SAIDA = '  + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //NTF_DT_ENTRADA_SAIDA
    QExec.SQL.Add('  NTF_ENTRADA_SAIDA = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_ENTRADA_SAIDA
    QExec.SQL.Add('  NTF_TIPO_NOTA = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_TIPO_NOTA
    QExec.SQL.Add('  NTF_NOTA_FISCAL = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_NOTA_FISCAL
    QExec.SQL.Add('  NTF_SERIE = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_SERIE
    QExec.SQL.Add('  NTF_SUBSERIE = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_SUBSERIE
    QExec.SQL.Add('  NTF_SELO = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_SELO
    QExec.SQL.Add('  NTF_AIDF = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_AIDF
    QExec.SQL.Add('  NTF_CFOP = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_CFOP
    QExec.SQL.Add('  NTF_BASE_ICMS = '         + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_BASE_ICMS
    QExec.SQL.Add('  NTF_ICMS = '              + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_ICMS
    QExec.SQL.Add('  NTF_BASE_ICMS_SUB = '     + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_BASE_ICMS_SUB
    QExec.SQL.Add('  NTF_ICMS_SUB = '          + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_ICMS_SUB
    QExec.SQL.Add('  NTF_TOTAL_PRODUTO = '     + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_TOTAL_PRODUTO
    QExec.SQL.Add('  NTF_TOTAL_NOTA = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_TOTAL_NOTA
    QExec.SQL.Add('  NTF_FRETE = '             + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_FRETE
    QExec.SQL.Add('  NTF_SEGURO = '            + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_SEGURO
    QExec.SQL.Add('  NTF_OUTRAS = '            + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_OUTRAS
    QExec.SQL.Add('  NTF_IPI = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_IPI
    QExec.SQL.Add('  NTF_TIPO_TRANSPORTE = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_TIPO_TRANSPORTE
    QExec.SQL.Add('  NTF_TIPO_FRETE = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_TIPO_FRETE
    QExec.SQL.Add('  NTF_PLACA = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_PLACA
    QExec.SQL.Add('  NTF_PLACA_UF = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                    + ','); //NTF_PLACA_UF
    QExec.SQL.Add('  NTF_QUANTIDADE = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_QUANTIDADE
    QExec.SQL.Add('  NTF_ESPECIE = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_ESPECIE
    QExec.SQL.Add('  NTF_MARCA = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //NTF_MARCA
    QExec.SQL.Add('  NTF_NUMERO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //NTF_NUMERO
    QExec.SQL.Add('  NTF_PESO_BRUTO = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_PESO_BRUTO
    QExec.SQL.Add('  NTF_PESO_LIQUIDO = '      + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_PESO_LIQUIDO
    QExec.SQL.Add('  NTF_SITUACAO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_SITUACAO
    QExec.SQL.Add('  NTF_OBSERVACAO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //NTF_OBSERVACAO
    QExec.SQL.Add('  NTF_ICMS_FRETE = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_ICMS_FRETE
    QExec.SQL.Add('  NTF_CONHECIMENTO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_CONHECIMENTO
    QExec.SQL.Add('  NTF_ISS = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_ISS
    QExec.SQL.Add('  NTF_BASE_ISS = '          + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_BASE_ISS
    QExec.SQL.Add('  CNC_PEDIDO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNC_PEDIDO
    QExec.SQL.Add('  NTF_ENDERECO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //NTF_ENDERECO
    QExec.SQL.Add('  NTF_BAIRRO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //NTF_BAIRRO
    QExec.SQL.Add('  NTF_MUNICIPIO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //NTF_MUNICIPIO
    QExec.SQL.Add('  NTF_UF = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_2)))                    + ','); //NTF_UF
    QExec.SQL.Add('  NTF_CEP = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //NTF_CEP
    QExec.SQL.Add('  NTF_NOTA_CUPOM = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_NOTA_CUPOM
    QExec.SQL.Add('  NTF_AVULSA = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_AVULSA
    QExec.SQL.Add('  NTF_COD_PAGAMENTO = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_COD_PAGAMENTO
    QExec.SQL.Add('  NTF_TOTAL_SERVICO = '     + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //NTF_TOTAL_SERVICO
    QExec.SQL.Add('  FUN_ARQUITETO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_ARQUITETO
    QExec.SQL.Add('  CNC_ORIGEM = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_ORIGEM
    QExec.SQL.Add('  NTF_COD_PAGAMENTO_2 = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_COD_PAGAMENTO_2
    QExec.SQL.Add('  NTF_MAQUINA = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //NTF_MAQUINA
    QExec.SQL.Add('  TRO_CODIGO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        ); //TRO_CODIGO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if ( Copy(sLinha,0,3) = 'NTF' ) or ( Copy(sLinha,0,3) = 'INF' ) then
  begin
    if ( Copy(sLinha,0,3) = 'NTF' ) then
    begin
      subDeleteItem;
      if not subExisteRegistro then
        subInsert
      else
        subUpdate;
    end
    else
      subInsertItem;
  end;
end;

procedure TRecebeComunicacao.grTab_PAR(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND TPR_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
    qQuery.SQL.Add('  AND PAR_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  PAR_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PARAMETRO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO PARAMETRO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  TPR_CODIGO,');
    QExec.SQL.Add('  PAR_CODIGO,');
    QExec.SQL.Add('  PAR_DESCRICAO,');
    QExec.SQL.Add('  PAR_SITUACAO,');
    QExec.SQL.Add('  PAR_DT_CADASTRO,');
    QExec.SQL.Add('  PAR_DT_ALTERADO,');
    QExec.SQL.Add('  PAR_INFORMACAO,');
    QExec.SQL.Add('  PAR_OBSERVACAO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //PAR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //PAR_DESCRICAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //PAR_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PAR_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PAR_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PAR_INFORMACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ')'); //PAR_OBSERVACAO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 27;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE PARAMETRO SET');
    QExec.SQL.Add('  PAR_DESCRICAO = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //PAR_DESCRICAO
    QExec.SQL.Add('  PAR_SITUACAO = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //PAR_SITUACAO
    QExec.SQL.Add('  PAR_DT_CADASTRO = ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PAR_DT_CADASTRO
    QExec.SQL.Add('  PAR_DT_ALTERADO = ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PAR_DT_ALTERADO
    QExec.SQL.Add('  PAR_INFORMACAO = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PAR_INFORMACAO
    QExec.SQL.Add('  PAR_OBSERVACAO = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                       ); //PAR_OBSERVACAO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'PAR' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_PDA(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND CNC_ORIGEM = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND PDV_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  PDV_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PEDIDO_AUXILIAR');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QSelect.Close;
    QSelect.SQL.Clear;
    QExec.SQL.Add('INSERT INTO PEDIDO_AUXILIAR (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  CNC_ORIGEM,');
    QExec.SQL.Add('  PDV_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  PDV_MAQUINA,');
    QExec.SQL.Add('  PDV_DT_CADASTRO,');
    QExec.SQL.Add('  PDV_DT_ALTERADO,');
    QExec.SQL.Add('  PDV_DT_PEDIDO,');
    QExec.SQL.Add('  PDV_DT_PREVISAO,');
    QExec.SQL.Add('  CNC_CLIENTE,');
    QExec.SQL.Add('  CLI_CODIGO,');
    QExec.SQL.Add('  PDV_DOCUMENTO,');
    QExec.SQL.Add('  PDV_TIPO_ARMACAO,');
    QExec.SQL.Add('  PDV_OBS_ARMACAO,');
    QExec.SQL.Add('  PDV_TIPO_LENTES,');
    QExec.SQL.Add('  PDV_OBS_LENTES,');
    QExec.SQL.Add('  PDV_MEDICO_CRM,');
    QExec.SQL.Add('  PDV_MEDICO_NOME,');
    QExec.SQL.Add('  PDV_MEDICO_FONE,');
    QExec.SQL.Add('  PDV_OD_ESF,');
    QExec.SQL.Add('  PDV_OE_ESF,');
    QExec.SQL.Add('  PDV_OD_CIL,');
    QExec.SQL.Add('  PDV_OE_CIL,');
    QExec.SQL.Add('  PDV_OD_EIXO,');
    QExec.SQL.Add('  PDV_OE_EIXO,');
    QExec.SQL.Add('  PDV_OD_DNP,');
    QExec.SQL.Add('  PDV_OE_DNP,');
    QExec.SQL.Add('  PDV_OD_ALT,');
    QExec.SQL.Add('  PDV_OE_ALT,');
    QExec.SQL.Add('  PDV_OD_ADICAO,');
    QExec.SQL.Add('  PDV_OE_ADICAO,');
    QExec.SQL.Add('  PDV_SITUACAO,');
    QExec.SQL.Add('  PDV_OBSERVACAO,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  PDV_PASCIENTE)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_PEDIDO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_PREVISAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CLIENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_DOCUMENTO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //PDV_TIPO_ARMACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //PDV_OBS_ARMACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //PDV_TIPO_LENTES
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //PDV_OBS_LENTES
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_MEDICO_CRM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //PDV_MEDICO_NOME
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_MEDICO_FONE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_ESF
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_ESF
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_CIL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_CIL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_EIXO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_EIXO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_DNP
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_DNP
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_ALT
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_ALT
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_ADICAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_ADICAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //PDV_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //PDV_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ')'); //PDV_PASCIENTE
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 22;//27
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE PEDIDO_AUXILIAR SET');
    QExec.SQL.Add('  USU_CODIGO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  PDV_MAQUINA = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_MAQUINA
    QExec.SQL.Add('  PDV_DT_CADASTRO = '   + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_CADASTRO
    QExec.SQL.Add('  PDV_DT_ALTERADO = '   + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_ALTERADO
    QExec.SQL.Add('  PDV_DT_PEDIDO = '     + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_PEDIDO
    QExec.SQL.Add('  PDV_DT_PREVISAO = '   + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_PREVISAO
    QExec.SQL.Add('  CNC_CLIENTE = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CLIENTE
    QExec.SQL.Add('  CLI_CODIGO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  PDV_DOCUMENTO = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_DOCUMENTO
    QExec.SQL.Add('  PDV_TIPO_ARMACAO = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //PDV_TIPO_ARMACAO
    QExec.SQL.Add('  PDV_OBS_ARMACAO = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //PDV_OBS_ARMACAO
    QExec.SQL.Add('  PDV_TIPO_LENTES = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //PDV_TIPO_LENTES
    QExec.SQL.Add('  PDV_OBS_LENTES = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //PDV_OBS_LENTES
    QExec.SQL.Add('  PDV_MEDICO_CRM = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_MEDICO_CRM
    QExec.SQL.Add('  PDV_MEDICO_NOME = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //PDV_MEDICO_NOME
    QExec.SQL.Add('  PDV_MEDICO_FONE = '   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_MEDICO_FONE
    QExec.SQL.Add('  PDV_OD_ESF = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_ESF
    QExec.SQL.Add('  PDV_OE_ESF = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_ESF
    QExec.SQL.Add('  PDV_OD_CIL = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_CIL
    QExec.SQL.Add('  PDV_OE_CIL = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_CIL
    QExec.SQL.Add('  PDV_OD_EIXO = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_EIXO
    QExec.SQL.Add('  PDV_OE_EIXO = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_EIXO
    QExec.SQL.Add('  PDV_OD_DNP = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_DNP
    QExec.SQL.Add('  PDV_OE_DNP = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_DNP
    QExec.SQL.Add('  PDV_OD_ALT = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_ALT
    QExec.SQL.Add('  PDV_OE_ALT = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_ALT
    QExec.SQL.Add('  PDV_OD_ADICAO = '     + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OD_ADICAO
    QExec.SQL.Add('  PDV_OE_ADICAO = '     + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_OE_ADICAO
    QExec.SQL.Add('  PDV_SITUACAO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //PDV_SITUACAO
    QExec.SQL.Add('  PDV_OBSERVACAO = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //PDV_OBSERVACAO
    QExec.SQL.Add('  FUN_CODIGO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  PDV_PASCIENTE = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                        ); //PDV_PASCIENTE
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'PDA' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_PDV(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND PDV_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  PDV_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PEDIDO_DE_VENDA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;


  procedure subDeleteItem;
  begin
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('DELETE FROM');
    QExec.SQL.Add('  ITEM_DE_PEDIDO_DE_VENDA');
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsertItem;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO ITEM_DE_PEDIDO_DE_VENDA (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  PDV_CODIGO,');
    QExec.SQL.Add('  IPV_CODIGO,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  IEB_CODIGO,');
    QExec.SQL.Add('  SEC_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  TBP_CODIGO,');
    QExec.SQL.Add('  IPV_ENTREGA,');
    QExec.SQL.Add('  IPV_AVISTA,');
    QExec.SQL.Add('  IPV_QUANTIDADE,');
    QExec.SQL.Add('  IPV_DESCONTO,');
    QExec.SQL.Add('  IPV_BONIFICACAO,');
    QExec.SQL.Add('  CNC_LOCAL_ESTOQUE,');
    QExec.SQL.Add('  IPV_PRECO,');
    QExec.SQL.Add('  IPV_SITUACAO,');
    QExec.SQL.Add('  IPV_PRECO_DESC,');
    QExec.SQL.Add('  IPV_NOTA,');
    QExec.SQL.Add('  IPV_ITEMNOTA,');
    QExec.SQL.Add('  IPV_PRECO_NOTA,');
    QExec.SQL.Add('  IPV_PENDENCIA,');
    QExec.SQL.Add('  IPV_ESTOQUE_LOCAL,');
    QExec.SQL.Add('  IPV_ESTOQUE_EXTERNO,');
    QExec.SQL.Add('  IPV_PRECO_SUGERIDO,');
    QExec.SQL.Add('  IPV_DIAS_ENTREGA,');
    QExec.SQL.Add('  IPV_DT_ENTRADA,');
    QExec.SQL.Add('  IPV_DT_SAIDA,');
    QExec.SQL.Add('  IPV_SERVICO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  IPV_OBSERVACAO,');
    QExec.SQL.Add('  IPV_DT_ALTERADO,');
    QExec.SQL.Add('  IPV_DT_CADASTRO,');
    QExec.SQL.Add('  IPV_VINCULO,');
    QExec.SQL.Add('  IPV_SEQUENCIA,');
    QExec.SQL.Add('  LOT_CODIGO,');
    QExec.SQL.Add('  IPV_FISCAL,');
    QExec.SQL.Add('  INF_N_ITEM)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IEB_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SEC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TBP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_ENTREGA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_AVISTA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IPV_QUANTIDADE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IPV_DESCONTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IPV_BONIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_LOCAL_ESTOQUE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IPV_PRECO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //IPV_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IPV_PRECO_DESC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_NOTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_ITEMNOTA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IPV_PRECO_NOTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_PENDENCIA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IPV_ESTOQUE_LOCAL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IPV_ESTOQUE_EXTERNO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //IPV_PRECO_SUGERIDO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_DIAS_ENTREGA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IPV_DT_ENTRADA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IPV_DT_SAIDA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_SERVICO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //IPV_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IPV_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //IPV_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_VINCULO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_SEQUENCIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //LOT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //IPV_FISCAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //INF_N_ITEM
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO PEDIDO_DE_VENDA (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  PDV_CODIGO,');
    QExec.SQL.Add('  CLI_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  PDV_DATA_HORA,');
    QExec.SQL.Add('  PDV_TOTAL,');
    QExec.SQL.Add('  PDV_LISTADO,');
    QExec.SQL.Add('  PDV_SITUACAO,');
    QExec.SQL.Add('  PDV_OBS,');
    QExec.SQL.Add('  PDV_DIAS_RESERV,');
    QExec.SQL.Add('  PDV_NOTA_FISCAL,');
    QExec.SQL.Add('  AGF_CODIGO,');
    QExec.SQL.Add('  FPG_CODIGO,');
    QExec.SQL.Add('  PDV_TIPO_PAG,');
    QExec.SQL.Add('  PDV_ENTRADA,');
    QExec.SQL.Add('  CNC_CLIENTE,');
    QExec.SQL.Add('  PDV_EM_USO,');
    QExec.SQL.Add('  PDV_ACRESCIMO,');
    QExec.SQL.Add('  PDV_DT_ALTERADO,');
    QExec.SQL.Add('  PDV_MAQUINA,');
    QExec.SQL.Add('  PDV_MELHOR_DATA,');
    QExec.SQL.Add('  PDV_VENCIMENTOS,');
    QExec.SQL.Add('  PDV_MEDIA_PAGAMENTO,');
    QExec.SQL.Add('  PDV_NOTA_CUPOM,');
    QExec.SQL.Add('  PDV_IMPRESSO,');
    QExec.SQL.Add('  PDV_DT_EMISSAO_VENDA,');
    QExec.SQL.Add('  PDV_DT_DEVOLUCAO,');
    QExec.SQL.Add('  PDV_CONTATO,');
    QExec.SQL.Add('  PDV_CREDITO,');
    QExec.SQL.Add('  FUN_ARQUITETO,');
    QExec.SQL.Add('  PDV_TITULO_GERADO,');
    QExec.SQL.Add('  PDV_TIPO_VENDA,');
    QExec.SQL.Add('  PDV_PACOTE,');
    QExec.SQL.Add('  PDV_GRUPO_ESPECIAL,');
    QExec.SQL.Add('  PDV_DT_PREVISAO,');
    QExec.SQL.Add('  PDV_DT_ENTREGA,');
    QExec.SQL.Add('  PDV_DOCUMENTO,');
    QExec.SQL.Add('  PDV_CAIXA,');
    QExec.SQL.Add('  PDV_SERVICO,');
    QExec.SQL.Add('  PDV_FONE_CONTATO,');
    QExec.SQL.Add('  FPE_CODIGO,');
    QExec.SQL.Add('  CNC_FATURAMENTO_PENDENTE,');
    QExec.SQL.Add('  PDV_DT_FPE,');
    QExec.SQL.Add('  CNT_CODIGO,');
    QExec.SQL.Add('  PDV_GARANTIA,');
    QExec.SQL.Add('  PDV_CODIGO_ORIGEM,');
    QExec.SQL.Add('  PDV_FRETE,');
    QExec.SQL.Add('  PDV_ANTECIPADO,');
    QExec.SQL.Add('  PDV_ENTREGA_DEPOSITO,');
    QExec.SQL.Add('  PDV_TITULO_GERADO2,');
    QExec.SQL.Add('  CNC_FATURAMENTO_PENDENTE2,');
    QExec.SQL.Add('  FPE_CODIGO2,');
    QExec.SQL.Add('  PDV_DT_FPE2,');
    QExec.SQL.Add('  PDV_DT_ANTECIPADO,');
    QExec.SQL.Add('  PDV_CLASSIFICACAO,');
    QExec.SQL.Add('  CSG_CODIGO,');
    QExec.SQL.Add('  PDV_COO,');
    QExec.SQL.Add('  PDV_CCF,');
    QExec.SQL.Add('  PDV_PAF)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DATA_HORA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_TOTAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_LISTADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //PDV_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //PDV_OBS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_DIAS_RESERV
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_NOTA_FISCAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //AGF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_TIPO_PAG
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_ENTRADA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNC_CLIENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_EM_USO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_ACRESCIMO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_MELHOR_DATA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //PDV_VENCIMENTOS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_MEDIA_PAGAMENTO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_NOTA_CUPOM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_IMPRESSO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_EMISSAO_VENDA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_DEVOLUCAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //PDV_CONTATO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_CREDITO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_ARQUITETO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_TITULO_GERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_TIPO_VENDA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_PACOTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_GRUPO_ESPECIAL
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_PREVISAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_ENTREGA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_DOCUMENTO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_CAIXA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_SERVICO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_FONE_CONTATO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPE_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNC_FATURAMENTO_PENDENTE
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_FPE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_GARANTIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CODIGO_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_FRETE
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_ANTECIPADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_ENTREGA_DEPOSITO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_TITULO_GERADO2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNC_FATURAMENTO_PENDENTE2
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPE_CODIGO2
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_FPE2
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_ANTECIPADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CLASSIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CSG_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //PDV_COO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //PDV_CCF
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                    + ')'); //PDV_PAF
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE PEDIDO_DE_VENDA SET');
    QExec.SQL.Add('  CLI_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  USU_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  PDV_DATA_HORA = '             + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DATA_HORA
    QExec.SQL.Add('  PDV_TOTAL = '                 + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_TOTAL
    QExec.SQL.Add('  PDV_LISTADO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_LISTADO
    QExec.SQL.Add('  PDV_SITUACAO = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //PDV_SITUACAO
    QExec.SQL.Add('  PDV_OBS = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //PDV_OBS
    QExec.SQL.Add('  PDV_DIAS_RESERV = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_DIAS_RESERV
    QExec.SQL.Add('  PDV_NOTA_FISCAL = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_NOTA_FISCAL
    QExec.SQL.Add('  AGF_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //AGF_CODIGO
    QExec.SQL.Add('  FPG_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPG_CODIGO
    QExec.SQL.Add('  PDV_TIPO_PAG = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_TIPO_PAG
    QExec.SQL.Add('  PDV_ENTRADA = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_ENTRADA
    QExec.SQL.Add('  CNC_CLIENTE = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNC_CLIENTE
    QExec.SQL.Add('  PDV_EM_USO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_EM_USO
    QExec.SQL.Add('  PDV_ACRESCIMO = '             + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_ACRESCIMO
    QExec.SQL.Add('  PDV_DT_ALTERADO = '           + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_ALTERADO
    QExec.SQL.Add('  PDV_MAQUINA = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_MAQUINA
    QExec.SQL.Add('  PDV_MELHOR_DATA = '           + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_MELHOR_DATA
    QExec.SQL.Add('  PDV_VENCIMENTOS = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //PDV_VENCIMENTOS
    QExec.SQL.Add('  PDV_MEDIA_PAGAMENTO = '       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_MEDIA_PAGAMENTO
    QExec.SQL.Add('  PDV_NOTA_CUPOM = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_NOTA_CUPOM
    QExec.SQL.Add('  PDV_IMPRESSO = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_IMPRESSO
    QExec.SQL.Add('  PDV_DT_EMISSAO_VENDA = '      + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_EMISSAO_VENDA
    QExec.SQL.Add('  PDV_DT_DEVOLUCAO = '          + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_DEVOLUCAO
    QExec.SQL.Add('  PDV_CONTATO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_80)))                   + ','); //PDV_CONTATO
    QExec.SQL.Add('  PDV_CREDITO = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_CREDITO
    QExec.SQL.Add('  FUN_ARQUITETO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_ARQUITETO
    QExec.SQL.Add('  PDV_TITULO_GERADO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_TITULO_GERADO
    QExec.SQL.Add('  PDV_TIPO_VENDA = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_TIPO_VENDA
    QExec.SQL.Add('  PDV_PACOTE = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_PACOTE
    QExec.SQL.Add('  PDV_GRUPO_ESPECIAL = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_GRUPO_ESPECIAL
    QExec.SQL.Add('  PDV_DT_PREVISAO = '           + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_PREVISAO
    QExec.SQL.Add('  PDV_DT_ENTREGA = '            + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_ENTREGA
    QExec.SQL.Add('  PDV_DOCUMENTO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_DOCUMENTO
    QExec.SQL.Add('  PDV_CAIXA = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_CAIXA
    QExec.SQL.Add('  PDV_SERVICO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_SERVICO
    QExec.SQL.Add('  PDV_FONE_CONTATO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PDV_FONE_CONTATO
    QExec.SQL.Add('  FPE_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPE_CODIGO
    QExec.SQL.Add('  CNC_FATURAMENTO_PENDENTE = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNC_FATURAMENTO_PENDENTE
    QExec.SQL.Add('  PDV_DT_FPE = '                + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_FPE
    QExec.SQL.Add('  CNT_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNT_CODIGO
    QExec.SQL.Add('  PDV_GARANTIA = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_GARANTIA
    QExec.SQL.Add('  PDV_CODIGO_ORIGEM = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CODIGO_ORIGEM
    QExec.SQL.Add('  PDV_FRETE = '                 + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_FRETE
    QExec.SQL.Add('  PDV_ANTECIPADO = '            + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PDV_ANTECIPADO
    QExec.SQL.Add('  PDV_ENTREGA_DEPOSITO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_ENTREGA_DEPOSITO
    QExec.SQL.Add('  PDV_TITULO_GERADO2 = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_TITULO_GERADO2
    QExec.SQL.Add('  CNC_FATURAMENTO_PENDENTE2 = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNC_FATURAMENTO_PENDENTE2
    QExec.SQL.Add('  FPE_CODIGO2 = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPE_CODIGO2
    QExec.SQL.Add('  PDV_DT_FPE2 = '               + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_FPE2
    QExec.SQL.Add('  PDV_DT_ANTECIPADO = '         + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PDV_DT_ANTECIPADO
    QExec.SQL.Add('  PDV_CLASSIFICACAO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CLASSIFICACAO
    QExec.SQL.Add('  CSG_CODIGO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CSG_CODIGO
    QExec.SQL.Add('  PDV_COO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //PDV_COO
    QExec.SQL.Add('  PDV_CCF = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //PDV_CCF
    QExec.SQL.Add('  PDV_PAF = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                         ); //PDV_PAF
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if ( Copy(sLinha,0,3) = 'PDV' ) or ( Copy(sLinha,0,3) = 'IPV' ) then
  begin
    if ( Copy(sLinha,0,3) = 'PDV' ) then
    begin
      subDeleteItem;
      if not subExisteRegistro then
        subInsert
      else
        subUpdate;
    end
    else
      subInsertItem;
  end;
end;

procedure TRecebeComunicacao.grTab_PRC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND PRC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  procedure subWhereItem(qQuery: TADOQuery; iPos: integer);
  begin
    subWhere(qQuery,iPos);
    qQuery.SQL.Add('  AND IPR_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  PRC_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PRE_RECEBIMENTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  function subExisteRegistroItem: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  IPR_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  ITEM_DE_PRE_RECEBIMENTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhereItem(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsertItem;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO ITEM_DE_PRE_RECEBIMENTO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  PRC_CODIGO,');
    QExec.SQL.Add('  IPR_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  IPR_QUANTIDADE,');
    QExec.SQL.Add('  IPR_SITUACAO,');
    QExec.SQL.Add('  IPR_TIPO,');
    QExec.SQL.Add('  LOT_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))             + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))               + ','); //PRC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))               + ','); //IPR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))               + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))  + ','); //IPR_QUANTIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))             + ','); //IPR_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))               + ','); //IPR_TIPO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))               + ')'); //LOT_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO PRE_RECEBIMENTO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  PRC_CODIGO,');
    QExec.SQL.Add('  PRC_DATA,');
    QExec.SQL.Add('  FOR_CODIGO,');
    QExec.SQL.Add('  PRC_SITUACAO,');
    QExec.SQL.Add('  PRC_TOT_ITEM,');
    QExec.SQL.Add('  PRC_TIPO,');
    QExec.SQL.Add('  PRC_CNC_ORIGEM,');
    QExec.SQL.Add('  PRC_COD_ORIGEM,');
    QExec.SQL.Add('  PRC_DATA_SAIDA,');
    QExec.SQL.Add('  PRC_DATA_EMISSAO,');
    QExec.SQL.Add('  PRC_NUM_DOC,');
    QExec.SQL.Add('  PRC_OBSERVACAO,');
    QExec.SQL.Add('  PRC_NOTA_FISCAL)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRC_DATA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //PRC_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRC_TOT_ITEM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRC_TIPO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRC_CNC_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRC_COD_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRC_DATA_SAIDA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRC_DATA_EMISSAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PRC_NUM_DOC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //PRC_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //PRC_NOTA_FISCAL
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if ( Copy(sLinha,0,3) = 'PRC' ) or ( Copy(sLinha,0,3) = 'IPR' ) then
  begin
    if ( Copy(sLinha,0,3) = 'PRC' ) then
    begin
      if not subExisteRegistro then
        subInsert;
    end
    else
    begin
      if not subExisteRegistroItem then
        subInsertItem;
    end;
  end;
end;

procedure TRecebeComunicacao.grTab_LOT(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND LOT_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
    qQuery.SQL.Add('  AND PRD_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  LOT_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  LOTE');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO LOTE (');
    QExec.SQL.Add('  LOT_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  LOT_DT_CADASTRO,');
    QExec.SQL.Add('  LOT_DT_ALTERADO,');
    QExec.SQL.Add('  LOT_DT_VALIDADE,');
    QExec.SQL.Add('  LOT_DESCRICAO,');
    QExec.SQL.Add('  LOT_REFERENCIA,');
    QExec.SQL.Add('  LOT_PRECO_COMPRA,');
    QExec.SQL.Add('  LOT_PRECO_CUSTO,');
    QExec.SQL.Add('  LOT_PRECO_VENDA,');
    QExec.SQL.Add('  LOT_SITUACAO,');
    QExec.SQL.Add('  LOT_OBSERVACAO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //LOT_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //LOT_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //LOT_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //LOT_DT_VALIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //LOT_DESCRICAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //LOT_REFERENCIA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //LOT_PRECO_COMPRA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //LOT_PRECO_CUSTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //LOT_PRECO_VENDA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //LOT_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ')'); //LOT_OBSERVACAO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 23;//18
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE LOTE SET');
    QExec.SQL.Add('  USU_CODIGO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                    + ','); //USU_CODIGO
    QExec.SQL.Add('  LOT_DT_CADASTRO = '   + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))  + ','); //LOT_DT_CADASTRO
    QExec.SQL.Add('  LOT_DT_ALTERADO = '   + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))  + ','); //LOT_DT_ALTERADO
    QExec.SQL.Add('  LOT_DT_VALIDADE = '   + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA))))  + ','); //LOT_DT_VALIDADE
    QExec.SQL.Add('  LOT_DESCRICAO = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                    + ','); //LOT_DESCRICAO
    QExec.SQL.Add('  LOT_REFERENCIA = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                   + ','); //LOT_REFERENCIA
    QExec.SQL.Add('  LOT_PRECO_COMPRA = '  + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))       + ','); //LOT_PRECO_COMPRA
    QExec.SQL.Add('  LOT_PRECO_CUSTO = '   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))       + ','); //LOT_PRECO_CUSTO
    QExec.SQL.Add('  LOT_PRECO_VENDA = '   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))       + ','); //LOT_PRECO_VENDA
    QExec.SQL.Add('  LOT_SITUACAO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                    + ','); //LOT_SITUACAO
    QExec.SQL.Add('  LOT_OBSERVACAO = '    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                        ); //LOT_OBSERVACAO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;
begin
  if Copy(sLinha,0,3) = 'LOT' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_PRD(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND PRD_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  PRD_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  PRODUTO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO PRODUTO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  PRD_CODIGO,');
    QExec.SQL.Add('  FOR_CODIGO,');
    QExec.SQL.Add('  CTP_CODIGO,');
    QExec.SQL.Add('  GRP_CODIGO,');
    QExec.SQL.Add('  SGP_CODIGO,');
    QExec.SQL.Add('  CLF_CODIGO,');
    QExec.SQL.Add('  ORF_CODIGO,');
    QExec.SQL.Add('  PRD_DESCRICAO,');
    QExec.SQL.Add('  PRD_UNIDADE,');
    QExec.SQL.Add('  PRD_MARCA,');
    QExec.SQL.Add('  PRD_PRECO_COMPRA,');
    QExec.SQL.Add('  PRD_REFERENCIA,');
    QExec.SQL.Add('  PRD_DT_ULT_COMPRA,');
    QExec.SQL.Add('  PRD_CUSTO,');
    QExec.SQL.Add('  PRD_PRECO_MEDIO,');
    QExec.SQL.Add('  PRD_PRECO_VENDA,');
    QExec.SQL.Add('  PRD_EST_MINIMO,');
    QExec.SQL.Add('  PRD_EST_MEDIO,');
    QExec.SQL.Add('  PRD_COMISSAO,');
    QExec.SQL.Add('  PRD_SITUACAO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  PRD_DT_ALTERADO,');
    QExec.SQL.Add('  PRD_LOCAL,');
    QExec.SQL.Add('  PRD_DETALHE,');
    QExec.SQL.Add('  PRD_DT_CADASTRO,');
    QExec.SQL.Add('  PRD_PESO_LIQUIDO,');
    QExec.SQL.Add('  PRD_CARACTERISTICA,');
    QExec.SQL.Add('  PRD_OBSERVACAO,');
    QExec.SQL.Add('  PRD_FORA_TABELA,');
    QExec.SQL.Add('  PRD_FORA_PREVISAO,');
    QExec.SQL.Add('  PRD_INSUMO,');
    QExec.SQL.Add('  PRD_BASE_REAL,');
    QExec.SQL.Add('  PRD_SERVICO,');
    QExec.SQL.Add('  PRD_TEMPO_MEDIO,');
    QExec.SQL.Add('  PRD_NIVEL,');
    QExec.SQL.Add('  PRD_FORA_DE_LINHA,');
    QExec.SQL.Add('  PRD_CATALOGO,');
    QExec.SQL.Add('  PRD_PREVISAO,');
    QExec.SQL.Add('  PRD_CLASSIFICACAO,');
    QExec.SQL.Add('  PRD_ESTOQUE_DETALHADO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CTP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //GRP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SGP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //ORF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ','); //PRD_DESCRICAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //PRD_UNIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PRD_MARCA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_PRECO_COMPRA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PRD_REFERENCIA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRD_DT_ULT_COMPRA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_CUSTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_PRECO_MEDIO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_PRECO_VENDA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_EST_MINIMO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_EST_MEDIO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_COMISSAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //PRD_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRD_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //PRD_LOCAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //PRD_DETALHE
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRD_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_PESO_LIQUIDO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //PRD_CARACTERISTICA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //PRD_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_FORA_TABELA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_FORA_PREVISAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_INSUMO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_BASE_REAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_SERVICO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_TEMPO_MEDIO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_NIVEL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_FORA_DE_LINHA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_CATALOGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_PREVISAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_CLASSIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ')'); //PRD_ESTOQUE_DETALHADO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE PRODUTO SET');
    QExec.SQL.Add('  FOR_CODIGO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_CODIGO
    QExec.SQL.Add('  CTP_CODIGO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CTP_CODIGO
    QExec.SQL.Add('  GRP_CODIGO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //GRP_CODIGO
    QExec.SQL.Add('  SGP_CODIGO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SGP_CODIGO
    QExec.SQL.Add('  CLF_CODIGO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLF_CODIGO
    QExec.SQL.Add('  ORF_CODIGO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //ORF_CODIGO
    QExec.SQL.Add('  PRD_DESCRICAO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_60)))                   + ','); //PRD_DESCRICAO
    QExec.SQL.Add('  PRD_UNIDADE = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //PRD_UNIDADE
    QExec.SQL.Add('  PRD_MARCA = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PRD_MARCA
    QExec.SQL.Add('  PRD_PRECO_COMPRA = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_PRECO_COMPRA
    QExec.SQL.Add('  PRD_REFERENCIA = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //PRD_REFERENCIA
    QExec.SQL.Add('  PRD_DT_ULT_COMPRA = '      + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRD_DT_ULT_COMPRA
    QExec.SQL.Add('  PRD_CUSTO = '              + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_CUSTO
    QExec.SQL.Add('  PRD_PRECO_MEDIO = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_PRECO_MEDIO
    QExec.SQL.Add('  PRD_PRECO_VENDA = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_PRECO_VENDA
    QExec.SQL.Add('  PRD_EST_MINIMO = '         + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_EST_MINIMO
    QExec.SQL.Add('  PRD_EST_MEDIO = '          + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_EST_MEDIO
    QExec.SQL.Add('  PRD_COMISSAO = '           + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_COMISSAO
    QExec.SQL.Add('  PRD_SITUACAO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //PRD_SITUACAO
    QExec.SQL.Add('  USU_CODIGO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  PRD_DT_ALTERADO = '        + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRD_DT_ALTERADO
    QExec.SQL.Add('  PRD_LOCAL = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //PRD_LOCAL
    QExec.SQL.Add('  PRD_DETALHE = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //PRD_DETALHE
    QExec.SQL.Add('  PRD_DT_CADASTRO = '        + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRD_DT_CADASTRO
    QExec.SQL.Add('  PRD_PESO_LIQUIDO = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_PESO_LIQUIDO
    QExec.SQL.Add('  PRD_CARACTERISTICA = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //PRD_CARACTERISTICA
    QExec.SQL.Add('  PRD_OBSERVACAO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //PRD_OBSERVACAO
    QExec.SQL.Add('  PRD_FORA_TABELA = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_FORA_TABELA
    QExec.SQL.Add('  PRD_FORA_PREVISAO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_FORA_PREVISAO
    QExec.SQL.Add('  PRD_INSUMO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_INSUMO
    QExec.SQL.Add('  PRD_BASE_REAL = '          + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //PRD_BASE_REAL
    QExec.SQL.Add('  PRD_SERVICO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_SERVICO
    QExec.SQL.Add('  PRD_TEMPO_MEDIO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_TEMPO_MEDIO
    QExec.SQL.Add('  PRD_NIVEL = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_NIVEL
    QExec.SQL.Add('  PRD_FORA_DE_LINHA = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_FORA_DE_LINHA
    QExec.SQL.Add('  PRD_CATALOGO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_CATALOGO
    QExec.SQL.Add('  PRD_PREVISAO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_PREVISAO
    QExec.SQL.Add('  PRD_CLASSIFICACAO = '      + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //PRD_CLASSIFICACAO
    QExec.SQL.Add('  PRD_ESTOQUE_DETALHADO = '  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                      ); //PRD_ESTOQUE_DETALHADO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'PRD' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_PRM(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO PERMISSAO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  OPS_CODIGO,');
    QExec.SQL.Add('  PRM_CODIGO,');
    QExec.SQL.Add('  PRM_DT_CADASTRO,');
    QExec.SQL.Add('  PRM_PERFIL)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //OPS_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PRM_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //PRM_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //PRM_PERFIL
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subDelete;
  begin
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('DELETE FROM PERMISSAO');
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'PRM' then
  begin
    if bExcluirPermissao then
    begin
      subDelete;
      bExcluirPermissao := false;
    end;
    subInsert;
  end;
end;

procedure TRecebeComunicacao.grTab_SGP(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND GRP_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
    qQuery.SQL.Add('  AND SGP_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  SGP_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  SUBGRUPO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO SUBGRUPO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  GRP_CODIGO,');
    QExec.SQL.Add('  SGP_CODIGO,');
    QExec.SQL.Add('  SGP_DESCRICAO,');
    QExec.SQL.Add('  SGP_OBSERVACAO,');
    QExec.SQL.Add('  SGP_QUANTIDADE_NORMAL,');
    QExec.SQL.Add('  SGP_BASE_CHAVE,');
    QExec.SQL.Add('  SGP_FAMILIA,');
    QExec.SQL.Add('  SGP_SITUACAO,');
    QExec.SQL.Add('  SGP_DT_CADASTRO,');
    QExec.SQL.Add('  SGP_DT_ALTERADO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  SGP_INDICE_REFRACAO,');
    QExec.SQL.Add('  SGP_FABRICAR,');
    QExec.SQL.Add('  SGP_PRECO_DOLAR,');
    QExec.SQL.Add('  SGP_EIXOS,');
    QExec.SQL.Add('  SGP_SERVICO_OBRIGATORIO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //GRP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SGP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //SGP_DESCRICAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //SGP_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //SGP_QUANTIDADE_NORMAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //SGP_BASE_CHAVE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //SGP_FAMILIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //SGP_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //SGP_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //SGP_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //SGP_INDICE_REFRACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SGP_FABRICAR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SGP_PRECO_DOLAR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //SGP_EIXOS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ')'); //SGP_SERVICO_OBRIGATORIO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 27;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE SUBGRUPO SET');
    QExec.SQL.Add('  SGP_DESCRICAO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_40)))                   + ','); //SGP_DESCRICAO
    QExec.SQL.Add('  SGP_OBSERVACAO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //SGP_OBSERVACAO
    QExec.SQL.Add('  SGP_QUANTIDADE_NORMAL = '   + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //SGP_QUANTIDADE_NORMAL
    QExec.SQL.Add('  SGP_BASE_CHAVE = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //SGP_BASE_CHAVE
    QExec.SQL.Add('  SGP_FAMILIA = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //SGP_FAMILIA
    QExec.SQL.Add('  SGP_SITUACAO = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //SGP_SITUACAO
    QExec.SQL.Add('  SGP_DT_CADASTRO = '         + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //SGP_DT_CADASTRO
    QExec.SQL.Add('  SGP_DT_ALTERADO = '         + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //SGP_DT_ALTERADO
    QExec.SQL.Add('  USU_CODIGO = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  SGP_INDICE_REFRACAO = '     + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //SGP_INDICE_REFRACAO
    QExec.SQL.Add('  SGP_FABRICAR = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SGP_FABRICAR
    QExec.SQL.Add('  SGP_PRECO_DOLAR = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SGP_PRECO_DOLAR
    QExec.SQL.Add('  SGP_EIXOS = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //SGP_EIXOS
    QExec.SQL.Add('  SGP_SERVICO_OBRIGATORIO = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                      ); //SGP_SERVICO_OBRIGATORIO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'SGP' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_SNH(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND USU_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  USU_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  USUARIO_SENHA');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO USUARIO_SENHA (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  CNC_ORIGEM,');
    QExec.SQL.Add('  CNC_USUARIO,');
    QExec.SQL.Add('  USU_USUARIO,');
    QExec.SQL.Add('  SNH_DT_CADASTRO,');
    QExec.SQL.Add('  SNH_DT_ALTERADO,');
    QExec.SQL.Add('  SNH_SENHA,');
    QExec.SQL.Add('  SNH_SITUACAO,');
    QExec.SQL.Add('  SNH_OBSERVACAO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_USUARIO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_USUARIO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //SNH_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //SNH_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //SNH_SENHA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //SNH_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ')'); //SNH_OBSERVACAO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'SNH' then
  begin
    if not subExisteRegistro then
      subInsert;
  end;
end;

procedure TRecebeComunicacao.grTab_TPG(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND TPG_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  TPG_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TITULO_A_PAGAR');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO TITULO_A_RECEBER (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  TPG_CODIGO,');
    QExec.SQL.Add('  PCP_CODIGO,');
    QExec.SQL.Add('  FOR_CODIGO,');
    QExec.SQL.Add('  CCX_CODIGO,');
    QExec.SQL.Add('  TPG_NUMERO,');
    QExec.SQL.Add('  BNF_CODIGO,');
    QExec.SQL.Add('  TPG_SEQUENCIA,');
    QExec.SQL.Add('  TPG_VENCIMENTO,');
    QExec.SQL.Add('  TPG_VALOR,');
    QExec.SQL.Add('  TPG_TIPO_PERIODO,');
    QExec.SQL.Add('  TPG_PAGAMENTO,');
    QExec.SQL.Add('  TPG_VALOR_PAGO,');
    QExec.SQL.Add('  TPG_FORMA_PGTO,');
    QExec.SQL.Add('  TPG_SITUACAO,');
    QExec.SQL.Add('  TPG_CUSTODIA,');
    QExec.SQL.Add('  TPG_TIPO_DOC,');
    QExec.SQL.Add('  TPG_TIPO_PAG,');
    QExec.SQL.Add('  TRN_CODIGO,');
    QExec.SQL.Add('  TPG_OBSERVACAO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  TPG_DT_ALTERADO,');
    QExec.SQL.Add('  CHQ_CODIGO,');
    QExec.SQL.Add('  CCX_CODIGO_REC,');
    QExec.SQL.Add('  TPG_GEROU_MOVIMENTO,');
    QExec.SQL.Add('  TPG_DT_CADASTRO,');
    QExec.SQL.Add('  TPG_DESCONTO,');
    QExec.SQL.Add('  TPG_JUROS,');
    QExec.SQL.Add('  CNC_ORIGEM,');
    QExec.SQL.Add('  TPG_TITULOANT,');
    QExec.SQL.Add('  TPG_TPGORIGINAL,');
    QExec.SQL.Add('  TPG_DTORIGINAL,');
    QExec.SQL.Add('  TPG_DT_COMPETENCIA,');
    QExec.SQL.Add('  TPG_AGENCIA_CONTA,');
    QExec.SQL.Add('  CNC_CHEQUE,');
    QExec.SQL.Add('  CNC_MOVIMENTO_CONTA_CORRENTE,');
    QExec.SQL.Add('  MCC_CODIGO,');
    QExec.SQL.Add('  FPE_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPG_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PCP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FOR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //TPG_NUMERO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //BNF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //TPG_SEQUENCIA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPG_VENCIMENTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPG_VALOR
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPG_TIPO_PERIODO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPG_PAGAMENTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPG_VALOR_PAGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ','); //TPG_FORMA_PGTO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TPG_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //TPG_CUSTODIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPG_TIPO_DOC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPG_TIPO_PAG
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //TPG_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPG_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //CHQ_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO_REC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TPG_GEROU_MOVIMENTO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPG_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPG_DESCONTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPG_JUROS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPG_TITULOANT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPG_TPGORIGINAL
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPG_DTORIGINAL
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPG_DT_COMPETENCIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //TPG_AGENCIA_CONTA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CHEQUE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CNC_MOVIMENTO_CONTA_CORRENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MCC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //FPE_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE TITULO_A_PAGAR SET');
    QExec.SQL.Add('  PCP_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//PCP_CODIGO
    QExec.SQL.Add('  FOR_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//FOR_CODIGO
    QExec.SQL.Add('  CCX_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//CCX_CODIGO
    QExec.SQL.Add('  TPG_NUMERO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ',');//TPG_NUMERO
    QExec.SQL.Add('  BNF_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//BNF_CODIGO
    QExec.SQL.Add('  TPG_SEQUENCIA = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ',');//TPG_SEQUENCIA
    QExec.SQL.Add('  TPG_VENCIMENTO = '               + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ',');//TPG_VENCIMENTO
    QExec.SQL.Add('  TPG_VALOR = '                    + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ',');//TPG_VALOR
    QExec.SQL.Add('  TPG_TIPO_PERIODO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//TPG_TIPO_PERIODO
    QExec.SQL.Add('  TPG_PAGAMENTO = '                + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ',');//TPG_PAGAMENTO
    QExec.SQL.Add('  TPG_VALOR_PAGO = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ',');//TPG_VALOR_PAGO
    QExec.SQL.Add('  TPG_FORMA_PGTO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_30)))                   + ',');//TPG_FORMA_PGTO
    QExec.SQL.Add('  TPG_SITUACAO = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ',');//TPG_SITUACAO
    QExec.SQL.Add('  TPG_CUSTODIA = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ',');//TPG_CUSTODIA
    QExec.SQL.Add('  TPG_TIPO_DOC = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//TPG_TIPO_DOC
    QExec.SQL.Add('  TPG_TIPO_PAG = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//TPG_TIPO_PAG
    QExec.SQL.Add('  TRN_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//TRN_CODIGO
    QExec.SQL.Add('  TPG_OBSERVACAO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ',');//TPG_OBSERVACAO
    QExec.SQL.Add('  USU_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//USU_CODIGO
    QExec.SQL.Add('  TPG_DT_ALTERADO = '              + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ',');//TPG_DT_ALTERADO
    QExec.SQL.Add('  CHQ_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ',');//CHQ_CODIGO
    QExec.SQL.Add('  CCX_CODIGO_REC = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//CCX_CODIGO_REC
    QExec.SQL.Add('  TPG_GEROU_MOVIMENTO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ',');//TPG_GEROU_MOVIMENTO
    QExec.SQL.Add('  TPG_DT_CADASTRO = '              + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ',');//TPG_DT_CADASTRO
    QExec.SQL.Add('  TPG_DESCONTO = '                 + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ',');//TPG_DESCONTO
    QExec.SQL.Add('  TPG_JUROS = '                    + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ',');//TPG_JUROS
    QExec.SQL.Add('  CNC_ORIGEM = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ',');//CNC_ORIGEM
    QExec.SQL.Add('  TPG_TITULOANT = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//TPG_TITULOANT
    QExec.SQL.Add('  TPG_TPGORIGINAL = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//TPG_TPGORIGINAL
    QExec.SQL.Add('  TPG_DTORIGINAL = '               + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ',');//TPG_DTORIGINAL
    QExec.SQL.Add('  TPG_DT_COMPETENCIA = '           + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ',');//TPG_DT_COMPETENCIA
    QExec.SQL.Add('  TPG_AGENCIA_CONTA = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ',');//TPG_AGENCIA_CONTA
    QExec.SQL.Add('  CNC_CHEQUE = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ',');//CNC_CHEQUE
    QExec.SQL.Add('  CNC_MOVIMENTO_CONTA_CORRENTE = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//CNC_MOVIMENTO_CONTA_CORRENTE
    QExec.SQL.Add('  MCC_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ',');//MCC_CODIGO
    QExec.SQL.Add('  FPE_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        );//FPE_CODIGO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'TPG' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_TPR(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND TPR_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  TPR_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TIPO_DE_PARAMETRO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO TIPO_DE_PARAMETRO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  TPR_CODIGO,');
    QExec.SQL.Add('  TPR_DESCRICAO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))) + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))   + ','); //TPR_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))   + ')'); //TPR_DESCRICAO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE TIPO_DE_PARAMETRO SET');
    QExec.SQL.Add('  TPR_DESCRICAO = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))); //TPR_DESCRICAO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'TPR' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_TPS(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND TPS_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  TPS_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TABELA_DE_PRECO_SUBGRUPO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subDeleteItem;
  begin
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('DELETE FROM');
    QExec.SQL.Add('  ITEM_DE_TABELA_DE_PRECO_SUBGRUPO');
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsertItem;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO ITEM_DE_TABELA_DE_PRECO_SUBGRUPO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  TPS_CODIGO,');
    QExec.SQL.Add('  ITS_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  GRP_CODIGO,');
    QExec.SQL.Add('  SGP_CODIGO,');
    QExec.SQL.Add('  ITS_DT_CADASTRO,');
    QExec.SQL.Add('  ITS_DT_ALTERADO,');
    QExec.SQL.Add('  ITS_PRECO_ORIGINAL,');
    QExec.SQL.Add('  ITS_PRECO_VENDA,');
    QExec.SQL.Add('  ITS_BONIFICACAO,');
    QExec.SQL.Add('  ITS_QUANTIDADE_MINIMA,');
    QExec.SQL.Add('  ITS_SITUACAO,');
    QExec.SQL.Add('  ITS_OBSERVACAO,');
    QExec.SQL.Add('  PRD_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPS_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //ITS_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //GRP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //SGP_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //ITS_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //ITS_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //ITS_PRECO_ORIGINAL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //ITS_PRECO_VENDA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //ITS_BONIFICACAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //ITS_QUANTIDADE_MINIMA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //ITS_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //ITS_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //PRD_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO TABELA_DE_PRECO_SUBGRUPO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  TPS_CODIGO,');
    QExec.SQL.Add('  CNC_CLIENTE,');
    QExec.SQL.Add('  CLI_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  TPS_DESCRICAO,');
    QExec.SQL.Add('  TPS_DT_CADASTRO,');
    QExec.SQL.Add('  TPS_DT_ALTERADO,');
    QExec.SQL.Add('  TPS_DT_VALIDADE,');
    QExec.SQL.Add('  TPS_LABORATORIO,');
    QExec.SQL.Add('  TPS_DESCONTO_SIMPLES,');
    QExec.SQL.Add('  TPS_DESCONTO_ESPECIAL,');
    QExec.SQL.Add('  TPS_SITUACAO,');
    QExec.SQL.Add('  TPS_OBSERVACAO,');
    QExec.SQL.Add('  TPS_PRINCIPAL,');
    QExec.SQL.Add('  TPS_DESCONTO_ESPECIAL_PRAZO,');
    QExec.SQL.Add('  TPS_DESCONTO_SIMPLES_PRAZO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPS_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CLIENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //TPS_DESCRICAO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPS_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPS_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPS_DT_VALIDADE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPS_LABORATORIO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPS_DESCONTO_SIMPLES
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPS_DESCONTO_ESPECIAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TPS_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //TPS_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TPS_PRINCIPAL
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPS_DESCONTO_ESPECIAL_PRAZO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ')'); //TPS_DESCONTO_SIMPLES_PRAZO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE TABELA_DE_PRECO_SUBGRUPO SET');
    QExec.SQL.Add('  CNC_CLIENTE = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CLIENTE
    QExec.SQL.Add('  CLI_CODIGO = '                  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  USU_CODIGO = '                  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  TPS_DESCRICAO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //TPS_DESCRICAO
    QExec.SQL.Add('  TPS_DT_CADASTRO = '             + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPS_DT_CADASTRO
    QExec.SQL.Add('  TPS_DT_ALTERADO = '             + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPS_DT_ALTERADO
    QExec.SQL.Add('  TPS_DT_VALIDADE = '             + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TPS_DT_VALIDADE
    QExec.SQL.Add('  TPS_LABORATORIO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TPS_LABORATORIO
    QExec.SQL.Add('  TPS_DESCONTO_SIMPLES = '        + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPS_DESCONTO_SIMPLES
    QExec.SQL.Add('  TPS_DESCONTO_ESPECIAL = '       + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPS_DESCONTO_ESPECIAL
    QExec.SQL.Add('  TPS_SITUACAO = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TPS_SITUACAO
    QExec.SQL.Add('  TPS_OBSERVACAO = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //TPS_OBSERVACAO
    QExec.SQL.Add('  TPS_PRINCIPAL = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TPS_PRINCIPAL
    QExec.SQL.Add('  TPS_DESCONTO_ESPECIAL_PRAZO = ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TPS_DESCONTO_ESPECIAL_PRAZO
    QExec.SQL.Add('  TPS_DESCONTO_SIMPLES_PRAZO = '  + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))           ); //TPS_DESCONTO_SIMPLES_PRAZO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;
  
begin
  if ( Copy(sLinha,0,3) = 'TPS' ) or ( Copy(sLinha,0,3) = 'ITS' ) then
  begin
    if ( Copy(sLinha,0,3) = 'TPS' ) then
    begin
      subDeleteItem;
      if not subExisteRegistro then
        subInsert
      else
        subUpdate;
    end
    else
      subInsertItem;
  end;
end;

procedure TRecebeComunicacao.grTab_TRC(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND TRC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  TRC_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  TITULO_A_RECEBER');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO TITULO_A_RECEBER (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  TRC_CODIGO,');
    QExec.SQL.Add('  PDV_CODIGO,');
    QExec.SQL.Add('  AGF_CODIGO,');
    QExec.SQL.Add('  CCX_CODIGO,');
    QExec.SQL.Add('  TRC_NUMERO,');
    QExec.SQL.Add('  TRC_SEQUENCIA,');
    QExec.SQL.Add('  CLI_CODIGO,');
    QExec.SQL.Add('  TRC_VENCIMENTO,');
    QExec.SQL.Add('  TRC_VALOR,');
    QExec.SQL.Add('  TRC_PAGAMENTO,');
    QExec.SQL.Add('  TRC_VALOR_PAGO,');
    QExec.SQL.Add('  TRC_SITUACAO,');
    QExec.SQL.Add('  TRC_OBSERVACAO,');
    QExec.SQL.Add('  TRC_CUSTODIA,');
    QExec.SQL.Add('  TRC_TIPO_DOC,');
    QExec.SQL.Add('  TRC_CRED_CLI,');
    QExec.SQL.Add('  TRC_TIPO_PAG,');
    QExec.SQL.Add('  CNC_CLIENTE,');
    QExec.SQL.Add('  TRC_TITULOANT,');
    QExec.SQL.Add('  BOL_CODIGO,');
    QExec.SQL.Add('  TRC_TRCORIGINAL,');
    QExec.SQL.Add('  TRC_DTORIGINAL,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  TRC_DT_ALTERADO,');
    QExec.SQL.Add('  TRC_RGB_DT_INICIO,');
    QExec.SQL.Add('  TRC_RGB_DT_SITUACAO,');
    QExec.SQL.Add('  CPC_CODIGO,');
    QExec.SQL.Add('  TRC_RGB_SITUACAO,');
    QExec.SQL.Add('  TRC_RGB_VISITADO,');
    QExec.SQL.Add('  TRC_RGB_DT_PROMESSA,');
    QExec.SQL.Add('  TRC_PROCESSO,');
    QExec.SQL.Add('  TRC_RGB_DT_VISITADO,');
    QExec.SQL.Add('  CCX_CODIGO_REC,');
    QExec.SQL.Add('  TRC_GEROU_MOVIMENTO,');
    QExec.SQL.Add('  TRC_NOTA_SERVICO,');
    QExec.SQL.Add('  TRC_DT_CADASTRO,');
    QExec.SQL.Add('  TRC_DESCONTO,');
    QExec.SQL.Add('  TRC_JUROS,');
    QExec.SQL.Add('  CNC_ORIGEM,');
    QExec.SQL.Add('  TRC_PEDIDO_SERVICO,');
    QExec.SQL.Add('  TRC_TIPO_PEDIDO,');
    QExec.SQL.Add('  TRC_DT_EMISSAO_BOLETO,');
    QExec.SQL.Add('  TRC_DT_RECEBIMENTO_BOLETO,');
    QExec.SQL.Add('  FPE_CODIGO,');
    QExec.SQL.Add('  CNC_FATURAMENTO_PENDENTE,');
    QExec.SQL.Add('  TRC_DT_COMPETENCIA,');
    QExec.SQL.Add('  TRC_EQUIFAX,');
    QExec.SQL.Add('  TRC_DT_EQUIFAX,');
    QExec.SQL.Add('  TRC_AGENCIA_NUMERO,');
    QExec.SQL.Add('  TRC_DT_CHEQUE,');
    QExec.SQL.Add('  TRC_SIT_CHEQUE,');
    QExec.SQL.Add('  TRC_REABERTURA,');
    QExec.SQL.Add('  TRC_VERIFICADO,');
    QExec.SQL.Add('  TRC_DT_VERIFICADO,');
    QExec.SQL.Add('  CHQ_CODIGO,');
    QExec.SQL.Add('  CNC_CHEQUE,');
    QExec.SQL.Add('  CNC_MOVIMENTO_CONTA_CORRENTE,');
    QExec.SQL.Add('  MCC_CODIGO,');
    QExec.SQL.Add('  TRC_PAGAMENTO_PARCIAL,');
    QExec.SQL.Add('  TRC_CHEQUE_DEVOLVIDO,');
    QExec.SQL.Add('  TRC_CV,');
    QExec.SQL.Add('  TRC_LOCAL,');
    QExec.SQL.Add('  TRF_CODIGO,');
    QExec.SQL.Add('  FUN_CODIGO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //AGF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //TRC_NUMERO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //TRC_SEQUENCIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_VENCIMENTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_VALOR
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_PAGAMENTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_VALOR_PAGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //TRC_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //TRC_CUSTODIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TIPO_DOC
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_CRED_CLI
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TIPO_PAG
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CLIENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TITULOANT
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //BOL_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TRCORIGINAL
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DTORIGINAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_RGB_DT_INICIO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_RGB_DT_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CPC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_RGB_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_RGB_VISITADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_RGB_DT_PROMESSA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_PROCESSO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_RGB_DT_VISITADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO_REC
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_GEROU_MOVIMENTO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_NOTA_SERVICO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_DESCONTO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_JUROS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_ORIGEM
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_PEDIDO_SERVICO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TIPO_PEDIDO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_EMISSAO_BOLETO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_RECEBIMENTO_BOLETO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPE_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_FATURAMENTO_PENDENTE
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_COMPETENCIA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_EQUIFAX
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_EQUIFAX
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //TRC_AGENCIA_NUMERO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_CHEQUE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_SIT_CHEQUE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_REABERTURA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_VERIFICADO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_VERIFICADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CHQ_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CHEQUE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_MOVIMENTO_CONTA_CORRENTE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MCC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_PAGAMENTO_PARCIAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_CHEQUE_DEVOLVIDO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //TRC_CV
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //TRC_LOCAL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRF_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ')'); //FUN_CODIGO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE TITULO_A_RECEBER SET');
    QExec.SQL.Add('  PDV_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //PDV_CODIGO
    QExec.SQL.Add('  AGF_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //AGF_CODIGO
    QExec.SQL.Add('  CCX_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO
    QExec.SQL.Add('  TRC_NUMERO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //TRC_NUMERO
    QExec.SQL.Add('  TRC_SEQUENCIA = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //TRC_SEQUENCIA
    QExec.SQL.Add('  CLI_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CLI_CODIGO
    QExec.SQL.Add('  TRC_VENCIMENTO = '               + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_VENCIMENTO
    QExec.SQL.Add('  TRC_VALOR = '                    + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_VALOR
    QExec.SQL.Add('  TRC_PAGAMENTO = '                + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_PAGAMENTO
    QExec.SQL.Add('  TRC_VALOR_PAGO = '               + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_VALOR_PAGO
    QExec.SQL.Add('  TRC_SITUACAO = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_SITUACAO
    QExec.SQL.Add('  TRC_OBSERVACAO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //TRC_OBSERVACAO
    QExec.SQL.Add('  TRC_CUSTODIA = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //TRC_CUSTODIA
    QExec.SQL.Add('  TRC_TIPO_DOC = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TIPO_DOC
    QExec.SQL.Add('  TRC_CRED_CLI = '                 + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_CRED_CLI
    QExec.SQL.Add('  TRC_TIPO_PAG = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TIPO_PAG
    QExec.SQL.Add('  CNC_CLIENTE = '                  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CLIENTE
    QExec.SQL.Add('  TRC_TITULOANT = '                + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TITULOANT
    QExec.SQL.Add('  BOL_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //BOL_CODIGO
    QExec.SQL.Add('  TRC_TRCORIGINAL = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TRCORIGINAL
    QExec.SQL.Add('  TRC_DTORIGINAL = '               + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DTORIGINAL
    QExec.SQL.Add('  USU_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  TRC_DT_ALTERADO = '              + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_ALTERADO
    QExec.SQL.Add('  TRC_RGB_DT_INICIO = '            + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_RGB_DT_INICIO
    QExec.SQL.Add('  TRC_RGB_DT_SITUACAO = '          + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_RGB_DT_SITUACAO
    QExec.SQL.Add('  CPC_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CPC_CODIGO
    QExec.SQL.Add('  TRC_RGB_SITUACAO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_RGB_SITUACAO
    QExec.SQL.Add('  TRC_RGB_VISITADO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_RGB_VISITADO
    QExec.SQL.Add('  TRC_RGB_DT_PROMESSA = '          + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_RGB_DT_PROMESSA
    QExec.SQL.Add('  TRC_PROCESSO = '                 + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_PROCESSO
    QExec.SQL.Add('  TRC_RGB_DT_VISITADO = '          + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_RGB_DT_VISITADO
    QExec.SQL.Add('  CCX_CODIGO_REC = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CCX_CODIGO_REC
    QExec.SQL.Add('  TRC_GEROU_MOVIMENTO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_GEROU_MOVIMENTO
    QExec.SQL.Add('  TRC_NOTA_SERVICO = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_NOTA_SERVICO
    QExec.SQL.Add('  TRC_DT_CADASTRO = '              + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_CADASTRO
    QExec.SQL.Add('  TRC_DESCONTO = '                 + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_DESCONTO
    QExec.SQL.Add('  TRC_JUROS = '                    + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //TRC_JUROS
    QExec.SQL.Add('  CNC_ORIGEM = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_ORIGEM
    QExec.SQL.Add('  TRC_PEDIDO_SERVICO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_PEDIDO_SERVICO
    QExec.SQL.Add('  TRC_TIPO_PEDIDO = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_TIPO_PEDIDO
    QExec.SQL.Add('  TRC_DT_EMISSAO_BOLETO = '        + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_EMISSAO_BOLETO
    QExec.SQL.Add('  TRC_DT_RECEBIMENTO_BOLETO = '    + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_RECEBIMENTO_BOLETO
    QExec.SQL.Add('  FPE_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FPE_CODIGO
    QExec.SQL.Add('  CNC_FATURAMENTO_PENDENTE = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_FATURAMENTO_PENDENTE
    QExec.SQL.Add('  TRC_DT_COMPETENCIA = '           + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_COMPETENCIA
    QExec.SQL.Add('  TRC_EQUIFAX = '                  + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_EQUIFAX
    QExec.SQL.Add('  TRC_DT_EQUIFAX = '               + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_EQUIFAX
    QExec.SQL.Add('  TRC_AGENCIA_NUMERO = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_10)))                   + ','); //TRC_AGENCIA_NUMERO
    QExec.SQL.Add('  TRC_DT_CHEQUE = '                + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_CHEQUE
    QExec.SQL.Add('  TRC_SIT_CHEQUE = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_SIT_CHEQUE
    QExec.SQL.Add('  TRC_REABERTURA = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRC_REABERTURA
    QExec.SQL.Add('  TRC_VERIFICADO = '               + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_VERIFICADO
    QExec.SQL.Add('  TRC_DT_VERIFICADO = '            + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //TRC_DT_VERIFICADO
    QExec.SQL.Add('  CHQ_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CHQ_CODIGO
    QExec.SQL.Add('  CNC_CHEQUE = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CHEQUE
    QExec.SQL.Add('  CNC_MOVIMENTO_CONTA_CORRENTE = ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_MOVIMENTO_CONTA_CORRENTE
    QExec.SQL.Add('  MCC_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //MCC_CODIGO
    QExec.SQL.Add('  TRC_PAGAMENTO_PARCIAL = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_PAGAMENTO_PARCIAL
    QExec.SQL.Add('  TRC_CHEQUE_DEVOLVIDO = '         + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //TRC_CHEQUE_DEVOLVIDO
    QExec.SQL.Add('  TRC_CV = '                       + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //TRC_CV
    QExec.SQL.Add('  TRC_LOCAL = '                    + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_50)))                   + ','); //TRC_LOCAL
    QExec.SQL.Add('  TRF_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //TRF_CODIGO
    QExec.SQL.Add('  FUN_CODIGO = '                   + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                        ); //FUN_CODIGO
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'TRC' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_USU(sLinha: string; QSelect, QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND USU_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  USU_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  USUARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO USUARIO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  USU_NOME,');
    QExec.SQL.Add('  USU_SENHA,');
    QExec.SQL.Add('  USU_PERFIL,');
    QExec.SQL.Add('  USU_SITUACAO,');
    QExec.SQL.Add('  USU_OBSERVACAO,');
    QExec.SQL.Add('  USU_MAQUINA,');
    QExec.SQL.Add('  USU_DT_CADASTRO,');
    QExec.SQL.Add('  USU_DT_ALTERADO,');
    QExec.SQL.Add('  USU_FONE,');
    QExec.SQL.Add('  USU_DT_SENHA_ALTERADA,');
    QExec.SQL.Add('  USU_TODOS_CENTROS)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //USU_NOME
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //USU_SENHA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //USU_PERFIL
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //USU_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //USU_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_MAQUINA
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //USU_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //USU_DT_ALTERADO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //USU_FONE
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //USU_DT_SENHA_ALTERADA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ')'); //USU_TODOS_CENTROS
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subUpdate;
  begin
    iPosicao := 18;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('UPDATE USUARIO SET');
    QExec.SQL.Add('  USU_NOME = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //USU_NOME
    QExec.SQL.Add('  USU_SENHA = '             + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //USU_SENHA
    QExec.SQL.Add('  USU_PERFIL = '            + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //USU_PERFIL
    QExec.SQL.Add('  USU_SITUACAO = '          + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //USU_SITUACAO
    QExec.SQL.Add('  USU_OBSERVACAO = '        + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_150)))                  + ','); //USU_OBSERVACAO
    QExec.SQL.Add('  USU_MAQUINA = '           + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_MAQUINA
    QExec.SQL.Add('  USU_DT_CADASTRO = '       + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //USU_DT_CADASTRO
    QExec.SQL.Add('  USU_DT_ALTERADO = '       + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //USU_DT_ALTERADO
    QExec.SQL.Add('  USU_FONE = '              + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_20)))                   + ','); //USU_FONE
    QExec.SQL.Add('  USU_DT_SENHA_ALTERADA = ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //USU_DT_SENHA_ALTERADA
    QExec.SQL.Add('  USU_TODOS_CENTROS = '     + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                      ); //USU_TODOS_CENTROS
    QExec.SQL.Add('WHERE 1=1');
    subWhere(QExec,5);
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'USU' then
  begin
    if not subExisteRegistro then
      subInsert
    else
      subUpdate;
  end;
end;

procedure TRecebeComunicacao.grTab_CDB(sLinha: string; QSelect,QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO CODIGO_DE_BARRAS (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  CDB_CODIGO,');
    QExec.SQL.Add('  CDB_CODIGO_ENTRADA,');
    QExec.SQL.Add('  USU_CODIGO,');
    QExec.SQL.Add('  CDB_TIPO,');
    QExec.SQL.Add('  CDB_DT_CADASTRO,');
    QExec.SQL.Add('  CDB_CODIGO_BARRAS,');
    QExec.SQL.Add('  CDB_SITUACAO,');
    QExec.SQL.Add('  CDB_OBSERVACAO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CDB_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CDB_CODIGO_ENTRADA
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //USU_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CDB_TIPO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //CDB_DT_CADASTRO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //CDB_CODIGO_BARRAS
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_2)))                 + ','); //CDB_SITUACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ')'); //CDB_OBSERVACAO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

  procedure subDelete;
  begin
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('DELETE FROM CODIGO_DE_BARRAS');
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'CDB' then
  begin
    if bExcluirCodBarras then
    begin
      subDelete;
      bExcluirCodBarras := false;
    end;
    subInsert;
  end;
end;

procedure TRecebeComunicacao.grTab_BLD(sLinha: string; QSelect,
  QExec: TADOQuery; var LogSQL: string);
var
  iPosicao: integer;

  procedure subWhere(qQuery: TADOQuery; iPos: integer);
  begin
    iPosicao := iPos;
    qQuery.SQL.Add('  AND CNC_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT_3))));
    qQuery.SQL.Add('  AND BLD_CODIGO = ' + QuotedStr(AllTrim(CopyCampo(sLinha,iPosicao,TAM_INT))));
  end;

  function subExisteRegistro: boolean;
  begin
    QSelect.Close;
    QSelect.SQL.Clear;
    QSelect.SQL.Add('SELECT');
    QSelect.SQL.Add('  BLD_CODIGO');
    QSelect.SQL.Add('FROM');
    QSelect.SQL.Add('  BOLETIM_DIARIO');
    QSelect.SQL.Add('WHERE 1=1');
    subWhere(QSelect,5);
    QSelect.Open;
    result := not QSelect.IsEmpty;
  end;

  procedure subInsert;
  begin
    iPosicao := 5;
    QExec.Close;
    QExec.SQL.Clear;
    QExec.SQL.Add('INSERT INTO BOLETIM_DIARIO (');
    QExec.SQL.Add('  CNC_CODIGO,');
    QExec.SQL.Add('  BLD_CODIGO,');
    QExec.SQL.Add('  FUN_CODIGO,');
    QExec.SQL.Add('  CAX_CODIGO,');
    QExec.SQL.Add('  BLD_DATA,');
    QExec.SQL.Add('  BLD_TOTAL_CARTAO,');
    QExec.SQL.Add('  BLD_TOTAL_DINHEIRO,');
    QExec.SQL.Add('  BLD_TOTAL_CHEQUE,');
    QExec.SQL.Add('  BLD_OBSERVACAO,');
    QExec.SQL.Add('  BLD_TIPO,');
    QExec.SQL.Add('  BLD_TOTAL_PREDATADO)');
    QExec.SQL.Add('VALUES (');
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT_3)))                 + ','); //CNC_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //BLD_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //FUN_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,TAM_INT)))                   + ','); //CAX_CODIGO
    QExec.SQL.Add('  ' + QuotedStr(MesDiaHora(Alltrim(CopyCampo(sLinha,iPosicao,TAM_DATA_HORA)))) + ','); //BLD_DATA
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //BLD_TOTAL_CARTAO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //BLD_TOTAL_DINHEIRO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ','); //BLD_TOTAL_CHEQUE
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_100)))                  + ','); //BLD_OBSERVACAO
    QExec.SQL.Add('  ' + QuotedStr(Alltrim(CopyCampo(sLinha,iPosicao,CHAR_1)))                    + ','); //BLD_TIPO
    QExec.SQL.Add('  ' + QuotedStr(VirgPonto(Alltrim(CopyCampo(sLinha,iPosicao,TAM_FLOAT))))      + ')'); //BLD_TOTAL_PREDATADO
    LogSQL := QExec.SQL.GetText;
    QExec.ExecSQL;
  end;

begin
  if Copy(sLinha,0,3) = 'BLD' then
  begin
    if not subExisteRegistro then
      subInsert;
  end;
end;

procedure TRecebeComunicacao.RetornaCAB(sLinha: string);
begin
  //TODO
end;

end.
