unit UEnviaCobrador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Titulo_receber;

type
  Trpt_CartaCobranca = class(TForm)
    report: TSZReport;
    Titulo_receber1: TTitulo_receber;
    SZRBand1: TSZRBand;
    ZRLabel19: TSZRLabel;
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
    ZRLabel4: TSZRLabel;
    SZRGroup1: TSZRGroup;
    ZRLabel6: TSZRLabel;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRDBText10: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRGroup2: TSZRGroup;
    SZRLabel14: TSZRLabel;
    SZRDBText13: TSZRDBText;
    ZRBand2: TSZRBand;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRDBText1: TSZRDBText;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber1CLI_CIDADE: TStringField;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRDBText2: TSZRDBText;
    Titulo_receber1CLI_DATA_NASC: TDateTimeField;
    Titulo_receber1CLI_CGC_CPF: TStringField;
    Titulo_receber1CLI_CGF_RG: TStringField;
    Titulo_receber1CLI_LOGRADOURO: TIntegerField;
    Titulo_receber1CLI_CEP: TStringField;
    Titulo_receber1CLI_FONE: TStringField;
    Titulo_receber1CLI_LOCALTRABALHO: TStringField;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRDBText8: TSZRDBText;
    SZRLabel22: TSZRLabel;
    SZRDBText11: TSZRDBText;
    Titulo_receber1CLI_UF: TStringField;
    Titulo_receber1CLI_OBS1: TStringField;
    SZRLabel23: TSZRLabel;
    SZRDBText12: TSZRDBText;
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
    Titulo_receber1CLI_CODIGO_1: TIntegerField;
    Titulo_receber1CNC_CODIGO_1: TIntegerField;
    Titulo_receber1CLI_PESSOA_FISICA: TSmallintField;
    Titulo_receber1CLI_DT_CADASTRO: TDateTimeField;
    Titulo_receber1CLI_SITUACAO: TIntegerField;
    Titulo_receber1CLI_CREDITO: TFloatField;
    Titulo_receber1CLI_CONJUGE: TStringField;
    Titulo_receber1CLI_FAX: TStringField;
    Titulo_receber1CLI_SITE: TStringField;
    Titulo_receber1CLI_EMAIL: TStringField;
    Titulo_receber1USU_CODIGO_1: TIntegerField;
    Titulo_receber1CLI_DT_ALTERADO: TDateTimeField;
    Titulo_receber1CLI_CELULAR: TStringField;
    Titulo_receber1CLI_VENDA_ATACADO: TIntegerField;
    Titulo_receber1CLI_SPC: TIntegerField;
    Titulo_receber1CLI_DESCONTO: TFloatField;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRDBText9: TSZRDBText;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    SZRLabel26: TSZRLabel;
    Titulo_receber1TRC_PEDIDO_SERVICO: TIntegerField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
    Titulo_receber1CNC_ORIGEM: TIntegerField;
    Titulo_receber1TRC_TIPO_PEDIDO: TIntegerField;
    Titulo_receber1CLI_ORGAO: TIntegerField;
    Titulo_receber1CLI_DT_SPC: TDateTimeField;
    Titulo_receber1CLI_REFERENCIA1: TStringField;
    Titulo_receber1CLI_REFERENCIA2: TStringField;
    Titulo_receber1CLI_REFERENCIA3: TStringField;
    Titulo_receber1CLI_PROFISSAO: TStringField;
    Titulo_receber1CLI_IDENTIFICACAO: TStringField;
    Titulo_receber1CLI_QUINZENAL: TIntegerField;
    Titulo_receber1CLI_MENSAL: TIntegerField;
    Titulo_receber1CLI_NOTA: TIntegerField;
    Titulo_receber1TRC_DT_EMISSAO_BOLETO: TDateTimeField;
    Titulo_receber1TRC_DT_RECEBIMENTO_BOLETO: TDateTimeField;
    Titulo_receber1FPE_CODIGO: TIntegerField;
    Titulo_receber1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Titulo_receber1TRC_DT_COMPETENCIA: TDateTimeField;
    Titulo_receber1TRC_EQUIFAX: TIntegerField;
    Titulo_receber1TRC_DT_EQUIFAX: TDateTimeField;
    Titulo_receber1TRC_AGENCIA_NUMERO: TStringField;
    Titulo_receber1CLI_CLASSIFICACAO: TIntegerField;
    Titulo_receber1CLI_MAQUINA: TIntegerField;
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
    procedure SZRSubDetailBand1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TTitulo_receber;
  end;

var
  rpt_CartaCobranca: Trpt_CartaCobranca;
  UltPedido: Integer;
  Imprimir : Boolean;

implementation
uses
 UDM, funcoes, MxCobCobrador;

{$R *.DFM}

procedure Trpt_CartaCobranca.SZRSubDetailBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  DoPrint := Imprimir;
end;

procedure Trpt_CartaCobranca.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  ValorComJuros:Double;
begin
  ValorComJuros := Entidade.FieldByname('TRC_VALOR').AsFloat+
  Entidade.FieldByname('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
  Entidade.FieldByName('TRC_VENCIMENTO').AsDateTime)/3000);
  SZRLabel5.Caption:=Format('%.2f',[Entidade.FieldByname('TRC_VALOR').AsFloat]);
  SZRLabel6.Caption:=Format('%.2f',[ValorComJuros]);
  Height := 20;
end;


procedure Trpt_CartaCobranca.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin

  ZRLabel1.Caption:=DM.CentroCusto1.NomeFantasia;
  SZRLabel24.Caption:=Entidade.FieldByName('CLI_RZ_SOCIAL').asString+
                      ' ('+Entidade.FieldByName('CLI_CODIGO').asString+')';
  SZRLabel1.Caption:='Endereco: '+Trim(DM.SelecionaParametro(DM.CentroCusto1.Logradouro)+' '+DM.CentroCusto1.Endereco);
  SZRLabel1.Caption:=SZRLabel1.Caption+'   Bairro: '+DM.CentroCusto1.Bairro;
  SZRLabel2.Caption:='Cidade: '+DM.CentroCusto1.Cidade+'/'+DM.CentroCusto1.Uf+'   '+'Fone: '+DM.CentroCusto1.Fone;
  SZRLabel19.Caption:=Trim(DM.SelecionaParametro(Entidade.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                           Entidade.FieldByName('CLI_ENDERECO').asString);


  if tag = 1 then
  begin

    DM.QuerySelect.Close;
    DM.QuerySelect.SQL.Text := 'SELECT T1.* FROM CENTRO_DE_CUSTO T1 '+
                               ' INNER JOIN CLIENTE T2 ON T1.CNC_CODIGO = T2.CNC_CODIGO '+
                               ' WHERE T1.CNC_CODIGO = '''+inttostr(Entidade.CodigoCNC)+''''+
                               ' AND T2.CLI_CODIGO = '''+inttostr(Entidade.CodigoCLI)+'''';
    DM.QuerySelect.Open;
    ZRLabel1.Caption:=DM.QuerySelect.Fieldbyname('CNC_RZ_SOCIAL').AsString;
    
  end;

end;

procedure Trpt_CartaCobranca.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
end;

procedure Trpt_CartaCobranca.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
