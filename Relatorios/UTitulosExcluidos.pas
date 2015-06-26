unit UTitulosExcluidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa;

type
  Trpt_TitulosExcluidos = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRDBText5: TSZRDBText;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRLabel11: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRDBText3: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    ZRDBText4: TSZRDBText;
    ZRLabel16: TSZRLabel;
    ZRExpression1: TSZRExpression;
    ZRBand4: TSZRBand;
    ZRLabel17: TSZRLabel;
    ZRLabel12: TSZRLabel;
    zrlTotalPago: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel1: TSZRLabel;
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
    Titulo_receber1TRC_CUSTODIA: TStringField;
    Titulo_receber1TRC_TIPO_DOC: TIntegerField;
    Titulo_receber1TRC_CRED_CLI: TFloatField;
    Titulo_receber1TRC_TIPO_PAG: TIntegerField;
    Titulo_receber1CNC_CLIENTE: TIntegerField;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber1CLI_RZ_SOCIAL: TStringField;
    SZRDBText2: TSZRDBText;
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
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
    Titulo_receber1CNC_ORIGEM: TIntegerField;
    Titulo_receber1TRC_PEDIDO_SERVICO: TIntegerField;
    zrlFiltros: TSZRLabel;
    Titulo_receber1TRC_TIPO_PEDIDO: TIntegerField;
    Titulo_receber1TRC_DT_EMISSAO_BOLETO: TDateTimeField;
    Titulo_receber1TRC_DT_RECEBIMENTO_BOLETO: TDateTimeField;
    Titulo_receber1FPE_CODIGO: TIntegerField;
    Titulo_receber1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Titulo_receber1TRC_DT_COMPETENCIA: TDateTimeField;
    Titulo_receber1TRC_EQUIFAX: TIntegerField;
    Titulo_receber1TRC_DT_EQUIFAX: TDateTimeField;
    Titulo_receber1TRC_AGENCIA_NUMERO: TStringField;
    Titulo_receber1TRC_DT_CHEQUE: TDateTimeField;
    Titulo_receber1TRC_SIT_CHEQUE: TIntegerField;
    Titulo_receber1TRC_REABERTURA: TIntegerField;
    Titulo_receber1TRC_VERIFICADO: TIntegerField;
    Titulo_receber1TRC_DT_VERIFICADO: TDateTimeField;
    Titulo_receber1CHQ_CODIGO: TIntegerField;
    Titulo_receber1CNC_CHEQUE: TIntegerField;
    zrlUsuario: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRExpression1: TSZRExpression;
    zrlTotalDoc: TSZRLabel;
    zrlTotalDesc: TSZRLabel;
    zrlTotalJuros: TSZRLabel;
    zrlCliente: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRDBText6: TSZRDBText;
    zrlTotalCredito: TSZRLabel;
    Titulo_receber1TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    Titulo_receber1TRC_CV: TStringField;
    Titulo_receber1TRC_LOCAL: TStringField;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    zrlObservacao: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    vTotalDoc, vTotalPago, vTotalDesc, vTotalJuros, vTotalCredito:Double;
  public
    Entidade: TTitulo_receber;
  end;

var
  rpt_TitulosExcluidos: Trpt_TitulosExcluidos;

implementation
Uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_TitulosExcluidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_TitulosExcluidos.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_TitulosExcluidos.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlCliente.Caption := Entidade.FieldByName('CLI_RZ_SOCIAL').asString+' ('+IntToStr(Entidade.CodigoCLI)+')';

  zrlObservacao.Caption := 'PDV:'+IntToStr(Entidade.CodigoPDV)+' '+Entidade.OBS;
  vTotalDoc     := vTotalDoc     + Arredonda(Entidade.Valor);
  vTotalDesc    := vTotalDesc    + Arredonda(Entidade.Desconto);
  vTotalJuros   := vTotalJuros   + Arredonda(Entidade.Juros);
  vTotalPago    := vTotalPago    + Arredonda(Entidade.ValorPG);
  vTotalCredito := vTotalCredito + Arredonda(Entidade.Credcli);
end;

procedure Trpt_TitulosExcluidos.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalDoc.Caption     := Format('%.2f',[vTotalDoc]);
  zrlTotalDesc.Caption    := Format('%.2f',[vTotalDesc]);
  zrlTotalJuros.Caption   := Format('%.2f',[vTotalJuros]);
  zrlTotalPago.Caption    := Format('%.2f',[vTotalPago]);
  zrlTotalCredito.Caption := Format('%.2f',[vTotalCredito]);
end;

procedure Trpt_TitulosExcluidos.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_TitulosExcluidos.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_TitulosExcluidos.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  vTotalDoc   := 0;
  vTotalPago  := 0;
  vTotalDesc  := 0;
  vTotalJuros := 0;
end;

end.
