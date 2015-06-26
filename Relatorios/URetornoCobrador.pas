unit URetornoCobrador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Titulo_receber, Item_Pedido_Venda, funcoes;

type
  Trpt_RetornoCobrador = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRBand4: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRSysData1: TSZRSysData;
    SZRSubDetailBand1: TSZRSubDetailBand;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText3: TSZRDBText;
    ZRBand2: TSZRBand;
    SZRDBText5: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRDBText9: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRDBText12: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRDBText11: TSZRDBText;
    SZRDBText14: TSZRDBText;
    SZRLabel14: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRGroup2: TSZRGroup;
    SZRLabel1: TSZRLabel;
    SZRDBText15: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRBand1: TSZRBand;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText16: TSZRDBText;
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
    Titulo_receber1CLI_RZ_SOCIAL: TStringField;
    Titulo_receber1CLI_NOME_FAN: TStringField;
    Titulo_receber1CLI_ENDERECO: TStringField;
    Titulo_receber1CLI_BAIRRO: TStringField;
    Titulo_receber1CLI_PAI: TStringField;
    Titulo_receber1CLI_MAE: TStringField;
    Titulo_receber1Situacao: TStringField;
    SZRLabel8: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRDBText18: TSZRDBText;
    SZRLabel22: TSZRLabel;
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
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRDBText6: TSZRDBText;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    SZRLabel27: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel35: TSZRLabel;
    SZRDBText13: TSZRDBText;
    SZRDBText17: TSZRDBText;
    Titulo_receber1CLI_OBS1: TStringField;
    SZRLabel15: TSZRLabel;
    SZRDBText19: TSZRDBText;
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
    Titulo_receber1TRC_LOCAL: TStringField;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Soma,ValorSemJuros:Double;
    UltPedido:Integer;
  end;

var
  rpt_RetornoCobrador: Trpt_RetornoCobrador;
  Imprimir:Boolean;

implementation
uses
 UDM, MxCobCobrador;

{$R *.DFM}

procedure Trpt_RetornoCobrador.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ValorSemJuros:=0;
end;

procedure Trpt_RetornoCobrador.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=Dm.Configuracao1.LojaNome;
end;

procedure Trpt_RetornoCobrador.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  ValorComJuros:Double;
begin
  if Titulo_receber1.DtPromessa > 0 then
    SZRLabel22.Caption:=DateToStr(Titulo_receber1.DtPromessa)
  else
    SZRLabel22.Caption:='-';
  ValorSemJuros:=ValorSemJuros+Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat;
  ValorComJuros:=Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat+
  Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
  Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsDateTime)/3000);
  soma:=Soma+ValorComjuros;
  SZRLabel5.Caption:=Format('%.2f',[Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat]);
  SZRLabel6.Caption:=Format('%.2f',[ValorComJuros]);
  
end;

procedure Trpt_RetornoCobrador.FormShow(Sender: TObject);
begin
  Soma:=0;
  ValorSemJuros:=0;
end;

procedure Trpt_RetornoCobrador.Titulo_receber1CalcFields(
  DataSet: TDataSet);
begin
   Case Titulo_receber1.Situacao of
    0: Titulo_receber1.FieldByName('SITUA').AsString:='Em aberto, normal';
    1: Titulo_receber1.FieldByName('SITUA').AsString:='Em aberto, por consignação';
    2: Titulo_receber1.FieldByName('SITUA').AsString:='Liquidado, normal';
    3: Titulo_receber1.FieldByName('SITUA').AsString:='Liquidado, por consignação';
    4: Titulo_receber1.FieldByName('SITUA').AsString:='Liquidado por renegociação';
    5: Titulo_receber1.FieldByName('SITUA').AsString:='Cancelado';
    6: Titulo_receber1.FieldByName('SITUA').AsString:='A Renegociar';
    7: Titulo_receber1.FieldByName('SITUA').AsString:='Perdoado';
    8: Titulo_receber1.FieldByName('SITUA').AsString:='Aberto por renegociação';
   end;
end;

procedure Trpt_RetornoCobrador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Trpt_RetornoCobrador.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
