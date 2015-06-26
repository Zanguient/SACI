unit UCarnet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Parametro,
  Titulo_receber;

type
  Trpt_carnet = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRDBText1: TSZRDBText;
    Parametro1: TParametro;
    ZRDBText9: TSZRDBText;
    Button1: TButton;
    ZRFrameLine1: TSZRFrameLine;
    ZRFrameLine2: TSZRFrameLine;
    ZRFrameLine3: TSZRFrameLine;
    ZRFrameLine5: TSZRFrameLine;
    ZRFrameLine6: TSZRFrameLine;
    ZRFrameLine7: TSZRFrameLine;
    ZRFrameLine8: TSZRFrameLine;
    ZRFrameLine9: TSZRFrameLine;
    ZRFrameLine4: TSZRFrameLine;
    ZRDBText7: TSZRDBText;
    ZRFrameLine12: TSZRFrameLine;
    ZRLabel13: TSZRLabel;
    ZRFrameLine13: TSZRFrameLine;
    ZRFrameLine17: TSZRFrameLine;
    ZRFrameLine18: TSZRFrameLine;
    ZRFrameLine15: TSZRFrameLine;
    ZRFrameLine16: TSZRFrameLine;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRDBText13: TSZRDBText;
    ZRDBText14: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRLabel9: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel23: TSZRLabel;
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
    Titulo_receber1CLI_CODIGO_1: TIntegerField;
    Titulo_receber1CNC_CODIGO_1: TIntegerField;
    Titulo_receber1CLI_PESSOA_FISICA: TSmallIntField;
    Titulo_receber1CLI_RZ_SOCIAL: TStringField;
    Titulo_receber1CLI_NOME_FAN: TStringField;
    Titulo_receber1CLI_CGC_CPF: TStringField;
    Titulo_receber1CLI_CGF_RG: TStringField;
    Titulo_receber1CLI_LOGRADOURO: TIntegerField;
    Titulo_receber1CLI_ENDERECO: TStringField;
    Titulo_receber1CLI_BAIRRO: TStringField;
    Titulo_receber1CLI_CIDADE: TStringField;
    Titulo_receber1CLI_UF: TStringField;
    Titulo_receber1CLI_CEP: TStringField;
    Titulo_receber1CLI_FONE: TStringField;
    Titulo_receber1CLI_SITUACAO: TIntegerField;
    Titulo_receber1CLI_CREDITO: TFloatField;
    Titulo_receber1Logradouro: TStringField;
    ZRLabel15: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRDBText10: TSZRDBText;
    ZRDBText2: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Parametro1BeforeOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_carnet: Trpt_carnet;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_carnet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Titulo_Receber1.Active:= false;
 Action := cafree;
end;

procedure Trpt_carnet.Parametro1BeforeOpen(DataSet: TDataSet);
begin
  Parametro1.Filtered:=False;
end;

procedure Trpt_carnet.Button1Click(Sender: TObject);
begin
Report.Report.Preview;
end;


end.
