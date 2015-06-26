unit UEnviaCobrador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Titulo_receber, Item_Pedido_Venda, Registro_de_Cobranca;

type
  Trpt_CartaCobranca = class(TForm)
    report: TSZReport;
    Titulo_receber1: TTitulo_receber;
    SZRBand1: TSZRBand;
    ZRLabel19: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    DSTitulo_receber1: TDataSource;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1PRD_DESCRICAO: TStringField;
    SZRSubDetailBand1: TSZRSubDetailBand;
    ZRBand2: TSZRBand;
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
    Titulo_receber1CLI_RZ_SOCIAL: TStringField;
    Titulo_receber1CLI_NOME_FAN: TStringField;
    Titulo_receber1CLI_ENDERECO: TStringField;
    Titulo_receber1CLI_BAIRRO: TStringField;
    Titulo_receber1CLI_PAI: TStringField;
    Titulo_receber1CLI_MAE: TStringField;
    ZRLabel4: TSZRLabel;
    SZRBand2: TSZRBand;
    Registro_de_Cobranca1: TRegistro_de_Cobranca;
    SZRGroup1: TSZRGroup;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRDBText11: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Soma,ValorSemJuros:Real;
  end;

var
  rpt_CartaCobranca: Trpt_CartaCobranca;

implementation
uses
 UDM, funcoes, MxSelCartaCob, MxCobCobrador;

{$R *.DFM}

procedure Trpt_CartaCobranca.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=Dm.Configuracao1.LojaNome;
end;

procedure Trpt_CartaCobranca.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ValorSemJuros:=0;
end;


procedure Trpt_CartaCobranca.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;


procedure Trpt_CartaCobranca.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  ValorComJuros:Real;
begin
  ValorSemJuros:=ValorSemJuros+Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat;
  ValorComJuros:=Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat+
  Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
  Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsDateTime)/30);
  soma:=Soma+ValorComjuros;
  SZRLabel5.Caption:=Format('%.2f',[Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat]);
  SZRLabel6.Caption:=Format('%.2f',[ValorComJuros]);
  Height := 20;
end;

procedure Trpt_CartaCobranca.FormShow(Sender: TObject);
begin
  Soma:=0;
  ValorSemJuros:=0;
end;
















procedure Trpt_CartaCobranca.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  Carta:Integer;
begin
  If Tag = 0 then
  Begin
    If fMxSelCartaCob.Edit1.Text <> '3' then
      ExecutaSQL(DM.QR_Comandos,'UPDATE REGISTRO_DE_COBRANCA SET RGB_CARTA_COB=RGB_CARTA_COB+1 '+
             ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND TRC_CODIGO='+IntToStr(Titulo_receber1.CodigoTRC))
    else
      ExecutaSQL(DM.QR_Comandos,'UPDATE REGISTRO_DE_COBRANCA SET RGB_CARTA_COB=RGB_CARTA_COB+1,RGB_SITUACAO=2 '+
             ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND TRC_CODIGO='+IntToStr(Titulo_receber1.CodigoTRC));
  End
  Else
    ExecutaSQL(DM.QR_Comandos,'UPDATE REGISTRO_DE_COBRANCA SET RGB_CARTA_COB=RGB_CARTA_COB+1 '+
           ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND TRC_CODIGO='+IntToStr(Titulo_receber1.CodigoTRC));
end;







end.
