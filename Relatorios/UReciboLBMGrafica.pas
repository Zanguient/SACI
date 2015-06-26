unit UReciboLBMGrafica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, Pedido_de_Venda, Titulo_receber, CentroCusto;

type
  Trpt_ReciboLBMGrafica = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel21: TSZRLabel;
    ZRDBText10: TSZRDBText;
    ZRLabel16: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRDBText13: TSZRDBText;
    ZRLabel17: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel11: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
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
    Titulo_receber1Cliente: TStringField;
    Titulo_receber1Cidade: TStringField;
    CentroCusto1: TCentroCusto;
    Cliente1: TCliente;
    zrlDataExtenso: TSZRLabel;
    Extenso1: TValorPorExtenso;
    SZRDBText1: TSZRDBText;
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
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
    Titulo_receber1CNC_ORIGEM: TIntegerField;
    Titulo_receber1TRC_PEDIDO_SERVICO: TIntegerField;
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
    Titulo_receber1TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CV: TStringField;
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_ReciboLBMGrafica: Trpt_ReciboLBMGrafica;

implementation

uses  UDM, MxSPediLocImpPromis;

{$R *.DFM}

procedure Trpt_ReciboLBMGrafica.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('janeiro','fevereiro','marco','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro');
var
  S : string;
begin
  Extenso1.Valor:=Titulo_receber1.fieldbyname('TRC_VALOR').asfloat;
  S := Extenso1.Texto;
  ZRlabel21.Caption:=UpperCase(S);

  zrlDataExtenso.Caption:=Titulo_receber1.FieldByName('Cidade').asString+', '+
    FormatDateTime('dd',DM.Configuracao1.Data)+' de '+mes[StrToInt(FormatDateTime('mm',DM.Configuracao1.Data))]+
    ' de '+FormatDateTime('yyyy',DM.Configuracao1.Data);
end;

procedure Trpt_ReciboLBMGrafica.Titulo_receber1CalcFields(DataSet: TDataSet);
Begin
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=Titulo_receber1.ClienteCNC;
  if tag = 0 then
    //Titulo_receber1.FieldByName('Cliente').asString:=fMxPedidoLBM.edtRazaoSocial.Text
  else if tag = 1 then
    Titulo_receber1.FieldByName('Cliente').asString:=fMxSPedLocImpPromis.Pedido_de_Venda1.FieldByName('Cliente').asString;
    
  with CentroCusto1 do
  Begin
    if DM.Configuracao1.CodigoCNC <> CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      Open;
    end;
    Titulo_receber1.FieldByName('Cidade').asString:=Cidade;
  end;
end;

procedure Trpt_ReciboLBMGrafica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Titulo_receber1.Close;
  CentroCusto1.Close;
  Cliente1.Close;
  action:=cafree;
end;

end.
