unit UTabelaPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Item_Tabela_de_Precos;

type
  Trpt_TabelaPreco = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrlDescProduto: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRDBText4: TSZRDBText;
    ZRLabel11: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    Item_Tabela_de_Precos1: TItem_Tabela_de_Precos;
    Item_Tabela_de_Precos1ITP_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1CNC_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1PRD_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1TBP_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1ITP_PRECO: TFloatField;
    Item_Tabela_de_Precos1ITP_BONIFICACAO: TFloatField;
    Item_Tabela_de_Precos1ITP_QUANT_MIN: TFloatField;
    Item_Tabela_de_Precos1ITP_PRECO_ORIGINAL: TFloatField;
    Item_Tabela_de_Precos1PRD_DESCRICAO: TStringField;
    zrlUsuario: TSZRLabel;
    zrlProduto: TSZRLabel;
    Item_Tabela_de_Precos1PRD_CARACTERISTICA: TStringField;
    Item_Tabela_de_Precos1ITP_DT_CADASTRO: TDateTimeField;
    Item_Tabela_de_Precos1ITP_DT_ALTERADO: TDateTimeField;
    Item_Tabela_de_Precos1PRD_REFERENCIA: TStringField;
    SZRGroup1: TSZRGroup;
    SZRLabel6: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRDBText4: TSZRDBText;
    Item_Tabela_de_Precos1TBP_DESCRICAO: TStringField;
    Item_Tabela_de_Precos1TBP_INDICE: TFloatField;
    Item_Tabela_de_Precos1TBP_PRAZO_MEDIO: TIntegerField;
    Item_Tabela_de_Precos1TBP_VALIDADE: TDateTimeField;
    Item_Tabela_de_Precos1TBP_DESCONTO_ESPECIAL: TFloatField;
    Item_Tabela_de_Precos1TBP_DESCONTO_SIMPLES: TFloatField;
    Item_Tabela_de_Precos1USU_CODIGO_1: TIntegerField;
    Item_Tabela_de_Precos1TBP_DT_ALTERADO: TDateTimeField;
    Item_Tabela_de_Precos1TBP_DESCONTO_SIMPLES_PRAZO: TFloatField;
    Item_Tabela_de_Precos1TBP_DESCONTO_ESPECIAL_PRAZO: TFloatField;
    Item_Tabela_de_Precos1TBP_AGF_EXCLUSIVO: TIntegerField;
    Item_Tabela_de_Precos1USU_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1TBP_CODIGO_1: TIntegerField;
    Item_Tabela_de_Precos1CNC_CODIGO_1: TIntegerField;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRDBText11: TSZRDBText;
    SZRDBText12: TSZRDBText;
    ZRLabel6: TSZRLabel;
    zrlFiltros: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TItem_Tabela_de_Precos;
  end;

var
  rpt_TabelaPreco: Trpt_TabelaPreco;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}


procedure Trpt_TabelaPreco.FormCreate(Sender: TObject);
begin
  Entidade := Item_Tabela_de_Precos1;
end;

procedure Trpt_TabelaPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_TabelaPreco.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_TabelaPreco.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_TabelaPreco.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa = empEletro then
    zrlProduto.Caption := Entidade.FieldByName('PRD_DESCRICAO').asString+' '+
                          Entidade.FieldByName('PRD_CARACTERISTICA').asString
  else if DM.Configuracao1.Empresa = empHope then
    zrlProduto.Caption := Entidade.FieldByName('PRD_DESCRICAO').asString+' '+
                          Entidade.FieldByName('PRD_REFERENCIA').asString
  else
    zrlProduto.Caption := Entidade.FieldByName('PRD_DESCRICAO').asString;
end;

end.
