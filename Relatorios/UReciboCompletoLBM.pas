unit UReciboCompletoLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, funcoes,
  Movimento_caixa, Extenso, Pedido_de_Venda, Titulo_receber, CentroCusto;

type
  Trpt_ReciboCompletoLBM = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
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
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_ReciboCompletoLBM: Trpt_ReciboCompletoLBM;

implementation

uses  UDM, MxSPediLocImpPromis;
{$R *.DFM}

procedure Trpt_ReciboCompletoLBM.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ReciboCompletoLBM.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('janeiro','fevereiro','marco','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro');
var
  S : string;
begin
  Extenso1.Valor:=Titulo_receber1.fieldbyname('TRC_VALOR').asfloat;
  S := Extenso1.Texto;
  ZRlabel21.Caption:=UpperCase(S);
  
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  zrlDataExtenso.Caption:=Titulo_receber1.FieldByName('Cidade').asString+', '+
    FormatDateTime('dd',DM.Configuracao1.Data)+' de '+mes[StrToInt(FormatDateTime('mm',DM.Configuracao1.Data))]+
    ' de '+FormatDateTime('yyyy',DM.Configuracao1.Data);
end;

procedure Trpt_ReciboCompletoLBM.Titulo_receber1CalcFields(DataSet: TDataSet);
Begin
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=Titulo_receber1.ClienteCNC;

  if tag = 0 then
  //  Titulo_receber1.FieldByName('Cliente').asString:=fMxPedidoLBM.edtRazaoSocial.Text
  else if tag = 1 then
    Titulo_receber1.FieldByName('Cliente').asString:=fMxSPedLocImpPromis.Pedido_de_Venda1.FieldByName('Cliente').asString;
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  CentroCusto1.Open;
  Titulo_receber1.FieldByName('Cidade').asString:=CentroCusto1.Cidade;
end;

procedure Trpt_ReciboCompletoLBM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Titulo_receber1.Close;
  CentroCusto1.Close;
  Cliente1.Close;
  action:=cafree;
end;

procedure Trpt_ReciboCompletoLBM.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
