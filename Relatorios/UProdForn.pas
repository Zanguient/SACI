unit UProdForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Item_de_Estoque, funcoes;

type
  Trpt_prodforn = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
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
    Produto1: TProduto;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRDBText9: TSZRDBText;
    ZRGroup1: TSZRGroup;
    ZRBand4: TSZRBand;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRLabel18: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRFrameLine1: TSZRFrameLine;
    ZRLabel12: TSZRLabel;
    ZRDBText5: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRDBText8: TSZRDBText;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRExpression1: TSZRExpression;
    Produto1PRD_CODIGO: TIntegerField;
    Produto1CNC_CODIGO: TIntegerField;
    Produto1FOR_CODIGO: TIntegerField;
    Produto1CTP_CODIGO: TIntegerField;
    Produto1SGP_CODIGO: TIntegerField;
    Produto1GRP_CODIGO: TIntegerField;
    Produto1CLF_CODIGO: TIntegerField;
    Produto1ORF_CODIGO: TIntegerField;
    Produto1PRD_DESCRICAO: TStringField;
    Produto1PRD_UNIDADE: TStringField;
    Produto1PRD_MARCA: TStringField;
    Produto1PRD_PRECO_COMPRA: TFloatField;
    Produto1PRD_REFERENCIA: TStringField;
    Produto1PRD_DT_ULT_COMPRA: TDateTimeField;
    Produto1PRD_CUSTO: TFloatField;
    Produto1PRD_PRECO_MEDIO: TFloatField;
    Produto1PRD_PRECO_VENDA: TFloatField;
    Produto1PRD_EST_MINIMO: TFloatField;
    Produto1PRD_EST_MEDIO: TFloatField;
    Produto1PRD_COMISSAO: TFloatField;
    Produto1FOR_NOME_FAN: TStringField;
    Produto1FOR_RZ_SOCIAL: TStringField;
    Produto1IES_SCOMERCIAL: TFloatField;
    Produto1IES_SFISICO: TFloatField;
    Produto1IES_SRESERVADO: TFloatField;
    Item_de_Estoque1: TItem_de_Estoque;
    Produto1PRD_SITUACAO: TIntegerField;
    Produto1USU_CODIGO: TIntegerField;
    Produto1PRD_DT_ALTERADO: TDateTimeField;
    Produto1PRD_LOCAL: TStringField;
    Produto1PRD_DETALHE: TStringField;
    Produto1PRD_DT_CADASTRO: TDateTimeField;
    Produto1PRD_PESO_LIQUIDO: TFloatField;
    Produto1PRD_CARACTERISTICA: TStringField;
    Produto1PRD_OBSERVACAO: TStringField;
    Produto1PRD_FORA_TABELA: TIntegerField;
    Produto1PRD_FORA_PREVISAO: TIntegerField;
    Produto1PRD_INSUMO: TIntegerField;
    Produto1PRD_BASE_REAL: TFloatField;
    Produto1PRD_SERVICO: TIntegerField;
    Produto1PRD_TEMPO_MEDIO: TIntegerField;
    Produto1PRD_NIVEL: TIntegerField;
    Produto1PRD_FORA_DE_LINHA: TIntegerField;
    Produto1PRD_CATALOGO: TIntegerField;
    Produto1PRD_PREVISAO: TIntegerField;
    Produto1PRD_CLASSIFICACAO: TIntegerField;
    Produto1PRD_ESTOQUE_DETALHADO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel12BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Produto1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_prodforn: Trpt_prodforn;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_prodforn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Produto1.Active:=false;
end;

procedure Trpt_prodforn.ZRLabel12BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel12.Caption:=  Format('%.2f',[Produto1.FieldbyName('PRD_PRECO_VENDA').AsFloat]);
end;

procedure Trpt_prodforn.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_prodforn.Produto1CalcFields(DataSet: TDataSet);
begin
  With Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
    ParamByName('PRD_CODIGO').asInteger := Produto1.CodigoPRD;
    Open;
    Produto1.FieldByName('IES_SCOMERCIAL').AsFloat := SComercial;
    Produto1.FieldByName('IES_SFISICO').AsFloat := SFisico;
    Produto1.FieldByName('IES_SRESERVADO').AsFloat := SReservado;
  end;
end;

procedure Trpt_prodforn.FormCreate(Sender: TObject);
begin
  Item_de_Estoque1.Open;
end;

procedure Trpt_prodforn.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_prodforn.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
