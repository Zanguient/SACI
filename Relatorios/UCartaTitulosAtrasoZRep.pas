unit UCartaTitulosAtrasoZRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZRCtrls, ZReport, Parametro, DB, DBTables, SQuery, Cliente;

type
  Trpt_CartaTitulosAtrasoZRep = class(TForm)
    report: TSZReport;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRLabel4: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRBand1: TSZRBand;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    Etiquetas2: TCliente;
    Etiquetas2CLI_CODIGO: TIntegerField;
    Etiquetas2CNC_CODIGO: TIntegerField;
    Etiquetas2CLI_PESSOA_FISICA: TSmallintField;
    Etiquetas2CLI_DT_CADASTRO: TDateTimeField;
    Etiquetas2CLI_DATA_NASC: TDateTimeField;
    Etiquetas2CLI_RZ_SOCIAL: TStringField;
    Etiquetas2CLI_NOME_FAN: TStringField;
    Etiquetas2CLI_CGC_CPF: TStringField;
    Etiquetas2CLI_CGF_RG: TStringField;
    Etiquetas2CLI_LOGRADOURO: TIntegerField;
    Etiquetas2CLI_ENDERECO: TStringField;
    Etiquetas2CLI_BAIRRO: TStringField;
    Etiquetas2CLI_CIDADE: TStringField;
    Etiquetas2CLI_UF: TStringField;
    Etiquetas2CLI_CEP: TStringField;
    Etiquetas2CLI_FONE: TStringField;
    Etiquetas2CLI_SITUACAO: TIntegerField;
    Etiquetas2CLI_CREDITO: TFloatField;
    Etiquetas2CLI_PAI: TStringField;
    Etiquetas2CLI_MAE: TStringField;
    Etiquetas2CLI_CONJUGE: TStringField;
    Etiquetas2CLI_OBS1: TStringField;
    Etiquetas2CLI_LOCALTRABALHO: TStringField;
    Etiquetas2CLI_FAX: TStringField;
    Etiquetas2CLI_SITE: TStringField;
    Etiquetas2CLI_EMAIL: TStringField;
    Etiquetas2USU_CODIGO: TIntegerField;
    Etiquetas2CLI_DT_ALTERADO: TDateTimeField;
    Etiquetas2CLI_CELULAR: TStringField;
    Etiquetas2CLI_SPC: TIntegerField;
    Etiquetas2CLI_VENDA_ATACADO: TIntegerField;
    Etiquetas2CLI_DESCONTO: TFloatField;
    Etiquetas2CLI_ORGAO: TIntegerField;
    Etiquetas2CLI_DT_SPC: TDateTimeField;
    Etiquetas2CLI_REFERENCIA1: TStringField;
    Etiquetas2CLI_REFERENCIA2: TStringField;
    Etiquetas2CLI_REFERENCIA3: TStringField;
    Etiquetas2CLI_IDENTIFICACAO: TStringField;
    Etiquetas2CLI_PROFISSAO: TStringField;
    Etiquetas2CLI_QUINZENAL: TIntegerField;
    Etiquetas2CLI_MENSAL: TIntegerField;
    Etiquetas2CLI_NOTA: TIntegerField;
    Etiquetas2CLI_CLASSIFICACAO: TIntegerField;
    Etiquetas2CLI_MAQUINA: TIntegerField;
    Etiquetas2CLI_TIPO: TIntegerField;
    Etiquetas2CNC_CONVENIO: TIntegerField;
    Etiquetas2CLI_CONVENIO: TIntegerField;
    Etiquetas2CNC_ORIGEM: TIntegerField;
    Etiquetas2CLI_DT_IMPORTACAO_INS: TDateTimeField;
    Etiquetas2CLI_DT_IMPORTACAO_ALT: TDateTimeField;
    Etiquetas2TRC_CODIGO: TIntegerField;
    Etiquetas2CNC_CODIGO_1: TIntegerField;
    Etiquetas2PDV_CODIGO: TIntegerField;
    Etiquetas2AGF_CODIGO: TIntegerField;
    Etiquetas2CCX_CODIGO: TIntegerField;
    Etiquetas2TRC_NUMERO: TStringField;
    Etiquetas2TRC_SEQUENCIA: TStringField;
    Etiquetas2CLI_CODIGO_1: TIntegerField;
    Etiquetas2TRC_VENCIMENTO: TDateTimeField;
    Etiquetas2TRC_VALOR: TFloatField;
    Etiquetas2TRC_PAGAMENTO: TDateTimeField;
    Etiquetas2TRC_VALOR_PAGO: TFloatField;
    Etiquetas2TRC_SITUACAO: TIntegerField;
    Etiquetas2TRC_OBSERVACAO: TStringField;
    Etiquetas2TRC_CUSTODIA: TStringField;
    Etiquetas2TRC_TIPO_DOC: TIntegerField;
    Etiquetas2TRC_CRED_CLI: TFloatField;
    Etiquetas2TRC_TIPO_PAG: TIntegerField;
    Etiquetas2CNC_CLIENTE: TIntegerField;
    Etiquetas2TRC_TITULOANT: TIntegerField;
    Etiquetas2BOL_CODIGO: TIntegerField;
    Etiquetas2TRC_TRCORIGINAL: TIntegerField;
    Etiquetas2TRC_DTORIGINAL: TDateTimeField;
    Etiquetas2USU_CODIGO_1: TIntegerField;
    Etiquetas2TRC_DT_ALTERADO: TDateTimeField;
    Etiquetas2TRC_RGB_DT_INICIO: TDateTimeField;
    Etiquetas2TRC_RGB_DT_SITUACAO: TDateTimeField;
    Etiquetas2CPC_CODIGO: TIntegerField;
    Etiquetas2TRC_RGB_SITUACAO: TIntegerField;
    Etiquetas2TRC_RGB_VISITADO: TSmallintField;
    Etiquetas2TRC_RGB_DT_PROMESSA: TDateTimeField;
    Etiquetas2TRC_PROCESSO: TIntegerField;
    Etiquetas2TRC_RGB_DT_VISITADO: TDateTimeField;
    Etiquetas2CCX_CODIGO_REC: TIntegerField;
    Etiquetas2TRC_GEROU_MOVIMENTO: TSmallintField;
    Etiquetas2TRC_NOTA_SERVICO: TIntegerField;
    Etiquetas2TRC_DT_CADASTRO: TDateTimeField;
    Etiquetas2TRC_DESCONTO: TFloatField;
    Etiquetas2TRC_JUROS: TFloatField;
    Etiquetas2CNC_ORIGEM_1: TIntegerField;
    Etiquetas2TRC_PEDIDO_SERVICO: TIntegerField;
    Etiquetas2TRC_TIPO_PEDIDO: TIntegerField;
    Etiquetas2TRC_DT_EMISSAO_BOLETO: TDateTimeField;
    Etiquetas2TRC_DT_RECEBIMENTO_BOLETO: TDateTimeField;
    Etiquetas2FPE_CODIGO: TIntegerField;
    Etiquetas2CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Etiquetas2TRC_DT_COMPETENCIA: TDateTimeField;
    Etiquetas2TRC_EQUIFAX: TIntegerField;
    Etiquetas2TRC_DT_EQUIFAX: TDateTimeField;
    Etiquetas2TRC_AGENCIA_NUMERO: TStringField;
    Etiquetas2TRC_DT_CHEQUE: TDateTimeField;
    Etiquetas2TRC_SIT_CHEQUE: TIntegerField;
    Etiquetas2TRC_REABERTURA: TIntegerField;
    Etiquetas2TRC_VERIFICADO: TIntegerField;
    Etiquetas2TRC_DT_VERIFICADO: TDateTimeField;
    Etiquetas2CHQ_CODIGO: TIntegerField;
    Etiquetas2CNC_CHEQUE: TIntegerField;
    Etiquetas2CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Etiquetas2MCC_CODIGO: TIntegerField;
    Etiquetas2TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Etiquetas2TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Etiquetas2TRC_CV: TStringField;
    Etiquetas2TRC_LOCAL: TStringField;
    Etiquetas2TRF_CODIGO: TIntegerField;
    Etiquetas2CNC_CODIGO_2: TIntegerField;
    Etiquetas2ICC_CODIGO: TIntegerField;
    Etiquetas2CPC_CODIGO_1: TIntegerField;
    Etiquetas2CNC_TITULO: TIntegerField;
    Etiquetas2TRC_CODIGO_1: TIntegerField;
    Etiquetas2ICC_DT_CADASTRO: TDateTimeField;
    Etiquetas2USU_CODIGO_2: TIntegerField;
    Etiquetas2razaosocial: TStringField;
    Etiquetas2bairrocidadecep: TStringField;
    Etiquetas2enderecocompleto: TStringField;
    Parametro2: TParametro;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRSysData1: TSZRSysData;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRDBText9: TSZRDBText;
    CentroCusto1: TParametro;
    CentroCusto1CNC_RZ_SOCIAL: TStringField;
    CentroCusto1CNC_NOME_FAN: TStringField;
    CentroCusto1PAR_DESCRICAO: TStringField;
    CentroCusto1CNC_ENDERECO: TStringField;
    CentroCusto1CNC_BAIRRO: TStringField;
    CentroCusto1CNC_CIDADE: TStringField;
    CentroCusto1CNC_UF: TStringField;
    CentroCusto1CNC_FONE: TStringField;
    CentroCusto1CNC_CEP: TStringField;
    procedure Etiquetas2CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_CartaTitulosAtrasoZRep: Trpt_CartaTitulosAtrasoZRep;

implementation

{$R *.dfm}

procedure Trpt_CartaTitulosAtrasoZRep.Etiquetas2CalcFields(
  DataSet: TDataSet);
begin
  Etiquetas2.FieldByName('razaosocial').AsString := 'Prezado(a) Senhor(a): '+
    Etiquetas2.FieldByName('CLI_CODIGO').AsString + ' ' +
    Etiquetas2.FieldByName('CLI_RZ_SOCIAL').AsString;

  Etiquetas2.FieldByName('bairrocidadecep').AsString :=
    Etiquetas2.FieldByName('CLI_BAIRRO').AsString+', '+
    Etiquetas2.FieldByName('CLI_CIDADE').AsString+'  CEP.: '+
    copy(Etiquetas2.FieldByName('CLI_CEP').AsString,1,5)+'-'+
    copy(Etiquetas2.FieldByName('CLI_CEP').AsString,6,3);

  with Parametro2 do
  begin
    Close;
    ParamByName('PAR_CODIGO').asInteger:=Etiquetas2.FieldByName('CLI_LOGRADOURO').asinteger;
    Open;
  end;

  Etiquetas2.FieldByName('enderecocompleto').AsString := Trim(Parametro2.Descricao+' '+
    Etiquetas2.FieldByName('CLI_ENDERECO').AsString);
end;

procedure Trpt_CartaTitulosAtrasoZRep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CAFree;
end;

procedure Trpt_CartaTitulosAtrasoZRep.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with CentroCusto1 do
  begin
    Close;
    ParamByName('CNC_CODIGO').AsInteger := Etiquetas2.FieldByName('CNC_CODIGO').AsInteger;
    Open;
  end;

  SZRLabel4.Caption := CentroCusto1.FieldByName('PAR_DESCRICAO').AsString + ' ' +
    CentroCusto1.FieldByName('CNC_ENDERECO').AsString + ' - ' +
    CentroCusto1.FieldByName('CNC_BAIRRO').AsString + ' - ' +
    CentroCusto1.FieldByName('CNC_CIDADE').AsString + '/' +
    CentroCusto1.FieldByName('CNC_UF').AsString;

  SZRLabel5.Caption := 'CEP: ' + CentroCusto1.FieldByName('CNC_CEP').AsString + ' - ' +
    '  FONE: ' + CentroCusto1.FieldByName('CNC_FONE').AsString;

end;

end.
