unit UDM;

interface

uses                                                                     
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, SQuery, Operacao_do_Sistema, Configuracao,
  Item_Pedido_Venda, Pedido_de_Venda, Titulo_a_Pagar, Titulo_receber,
  Item_de_Estoque, Movimento_Estoque_Comercial, CentroCusto, Usuario,
  Parametro, Submodulo, Modulo;

type
  TDM = class(TDataModule)
    Database2: TDatabase;
    Configuracao1: TConfiguracao;
    Query1: TQuery;
    Query2: TQuery;
    Titulo_receber1: TTitulo_receber;
    Titulo_a_pagar1: TTitulo_a_pagar;
    Pedido_de_Venda1: TPedido_de_Venda;
    Titulo_a_pagar1CNC_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_CODIGO: TIntegerField;
    Titulo_a_pagar1PCP_CODIGO: TIntegerField;
    Titulo_a_pagar1FOR_CODIGO: TIntegerField;
    Titulo_a_pagar1CCX_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_NUMERO: TStringField;
    Titulo_a_pagar1BNF_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_SEQUENCIA: TStringField;
    Titulo_a_pagar1TPG_VENCIMENTO: TDateTimeField;
    Titulo_a_pagar1TPG_VALOR: TFloatField;
    Titulo_a_pagar1TPG_TIPO_PERIODO: TIntegerField;
    Titulo_a_pagar1TPG_PAGAMENTO: TDateTimeField;
    Titulo_a_pagar1TPG_VALOR_PAGO: TFloatField;
    Titulo_a_pagar1TPG_FORMA_PGTO: TStringField;
    Titulo_a_pagar1TPG_SITUACAO: TIntegerField;
    Titulo_a_pagar1TPG_CUSTODIA: TStringField;
    Titulo_a_pagar1TPG_TIPO_DOC: TIntegerField;
    Titulo_a_pagar1TPG_TIPO_PAG: TIntegerField;
    Titulo_a_pagar1TRN_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_OBSERVACAO: TStringField;
    Titulo_a_pagar1USU_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_DT_ALTERADO: TDateTimeField;
    Titulo_a_pagar1CHQ_CODIGO: TStringField;
    Titulo_a_pagar1CCX_CODIGO_REC: TIntegerField;
    Titulo_a_pagar1TPG_GEROU_MOVIMENTO: TSmallintField;
    Titulo_a_pagar1TPG_DT_CADASTRO: TDateTimeField;
    Titulo_a_pagar1TPG_DESCONTO: TFloatField;
    Titulo_a_pagar1TPG_JUROS: TFloatField;
    Titulo_a_pagar1CNC_ORIGEM: TIntegerField;
    Titulo_receber1TRC_CODIGO: TIntegerField;
    Titulo_receber1CNC_CODIGO: TIntegerField;
    Titulo_receber1PDV_CODIGO: TIntegerField;
    Titulo_receber1AGF_CODIGO: TIntegerField;
    Titulo_receber1CCX_CODIGO: TIntegerField;
    Titulo_receber1TRC_NUMERO: TStringField;
    Titulo_receber1TRC_SEQUENCIA: TStringField;
    Titulo_receber1CLI_CODIGO: TIntegerField;
    Titulo_receber1TRC_VENCIMENTO: TDateTimeField;
    Titulo_receber1TRC_VALOR: TFloatField;
    Titulo_receber1TRC_PAGAMENTO: TDateTimeField;
    Titulo_receber1TRC_VALOR_PAGO: TFloatField;
    Titulo_receber1TRC_SITUACAO: TIntegerField;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    Titulo_receber1TRC_CUSTODIA: TStringField;
    Titulo_receber1TRC_TIPO_DOC: TIntegerField;
    Titulo_receber1TRC_CRED_CLI: TFloatField;
    Titulo_receber1TRC_TIPO_PAG: TIntegerField;
    Titulo_receber1CNC_CLIENTE: TIntegerField;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber1USU_CODIGO: TIntegerField;
    Titulo_receber1TRC_DT_ALTERADO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_INICIO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_SITUACAO: TDateTimeField;
    Titulo_receber1CPC_CODIGO: TIntegerField;
    Titulo_receber1TRC_RGB_SITUACAO: TIntegerField;
    Titulo_receber1TRC_RGB_VISITADO: TSmallintField;
    Titulo_receber1TRC_RGB_DT_PROMESSA: TDateTimeField;
    Titulo_receber1TRC_PROCESSO: TIntegerField;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
    Titulo_receber1CNC_ORIGEM: TIntegerField;
    Titulo_receber1TRC_PEDIDO_SERVICO: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1USU_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1PDV_LISTADO: TIntegerField;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Pedido_de_Venda1PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_FISCAL: TIntegerField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1PDV_ENTRADA: TFloatField;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1PDV_EM_USO: TIntegerField;
    Pedido_de_Venda1PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda1PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda1PDV_CONTATO: TStringField;
    Pedido_de_Venda1PDV_CREDITO: TFloatField;
    Pedido_de_Venda1FUN_ARQUITETO: TIntegerField;
    Pedido_de_Venda1PDV_TITULO_GERADO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_VENDA: TIntegerField;
    Pedido_de_Venda1PDV_PACOTE: TIntegerField;
    Pedido_de_Venda1PDV_GRUPO_ESPECIAL: TIntegerField;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_CODIGO: TIntegerField;
    Item_Pedido_Venda1FUN_CODIGO: TIntegerField;
    Item_Pedido_Venda1IEB_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1SEC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1TBP_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_ENTREGA: TSmallintField;
    Item_Pedido_Venda1IPV_AVISTA: TSmallintField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_DESCONTO: TFloatField;
    Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField;
    Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1IPV_NOTA: TIntegerField;
    Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    Movimento_Estoque_Comercial1: TMovimento_Estoque_Comercial;
    Item_de_Estoque1: TItem_de_Estoque;
    Movimento_Estoque_Comercial1MEC_CODIGO: TIntegerField;
    Movimento_Estoque_Comercial1CNC_CODIGO: TIntegerField;
    Movimento_Estoque_Comercial1PRD_CODIGO: TIntegerField;
    Movimento_Estoque_Comercial1MEC_DATA_HORA: TDateTimeField;
    Movimento_Estoque_Comercial1MEC_ES: TStringField;
    Movimento_Estoque_Comercial1MEC_TIPO_MOV: TIntegerField;
    Movimento_Estoque_Comercial1MEC_QUANTIDADE: TFloatField;
    Movimento_Estoque_Comercial1MEC_SALDO_ANT: TFloatField;
    Movimento_Estoque_Comercial1MEC_TIPO_ENT: TIntegerField;
    Movimento_Estoque_Comercial1MEC_CNC_CODIGO_ENT: TIntegerField;
    Movimento_Estoque_Comercial1MEC_ENT_CODIGO: TIntegerField;
    Movimento_Estoque_Comercial1USU_CODIGO: TIntegerField;
    Movimento_Estoque_Comercial1MEC_OBSERVACAO: TStringField;
    Item_de_Estoque1PRD_CODIGO: TIntegerField;
    Item_de_Estoque1CNC_CODIGO: TIntegerField;
    Item_de_Estoque1IES_SCOMERCIAL: TFloatField;
    Item_de_Estoque1IES_SFISICO: TFloatField;
    Item_de_Estoque1IES_SRESERVADO: TFloatField;
    Item_de_Estoque1IES_SFISCAL: TFloatField;
    Item_de_Estoque1IES_INDISPONIVEL: TFloatField;
    Item_de_Estoque1IES_DH_ATUALIZADO: TDateTimeField;
    Item_de_Estoque1IES_INVENT_FISICO: TFloatField;
    Item_de_Estoque1IES_INVENT_COMERCIAL: TFloatField;
    Item_de_Estoque1IES_INVENT_RESERV: TFloatField;
    Item_de_Estoque1IES_INVENT_DATA_FISICO: TDateTimeField;
    Item_de_Estoque1IES_INVENT_DATA_COMERCIAL: TDateTimeField;
    Item_de_Estoque1IES_INVENT_DATA_RESERV: TDateTimeField;
    Item_de_Estoque1IES_SSN: TFloatField;
    CentroCusto1: TCentroCusto;
    Usuario1: TUsuario;
    Parametro1: TParametro;
    Operacao_do_Sistema1: TOperacao_do_Sistema;
    Modulo1: TModulo;
    Submodulo1: TSubmodulo;
    Parametro2: TParametro;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
{$R *.DFM}

end.
