unit UTipoVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,funcoes,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Produto, Item_Pedido_Venda, Variants;

type
  Trpt_TipoVendas = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrb_detalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRBand5: TSZRBand;
    ZRLabel7: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel4: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRDBText10: TSZRDBText;
    ZRLabel19: TSZRLabel;
    ZRLabel24: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRLabel21: TSZRLabel;
    ZRLabel25: TSZRLabel;
    ZRLabel26: TSZRLabel;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_CODIGO: TIntegerField;
    Item_Pedido_Venda1FUN_CODIGO: TIntegerField;
    Item_Pedido_Venda1IEB_CODIGO: TIntegerField;
    Item_Pedido_Venda1SEC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1TBP_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_ENTREGA: TSmallintField;
    Item_Pedido_Venda1IPV_AVISTA: TSmallintField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_DESCONTO: TFloatField;
    Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField;
    Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1PDV_DATA_HORA: TDateTimeField;
    Produto1: TProduto;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_TOTAL: TFloatField;
    Item_Pedido_Venda1FPG_CODIGO: TIntegerField;
    SZRLabel1: TSZRLabel;
    Item_Pedido_Venda1FPG_DESCRICAO: TStringField;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    Item_Pedido_Venda1Unidade: TStringField;
    Item_Pedido_Venda1Produto: TStringField;
    SZRGroup1: TSZRGroup;
    SZRBand1: TSZRBand;
    SZRLabel4: TSZRLabel;
    ZRDBText4: TSZRDBText;
    SZRLabel8: TSZRLabel;
    ZRDBText5: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRDBText3: TSZRDBText;
    Item_Pedido_Venda1Referencia: TStringField;
    Item_Pedido_Venda1IPV_NOTA: TIntegerField;
    Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1CNC_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1CLI_CODIGO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_LISTADO: TIntegerField;
    Item_Pedido_Venda1PDV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1PDV_OBS: TStringField;
    Item_Pedido_Venda1PDV_DIAS_RESERV: TIntegerField;
    Item_Pedido_Venda1PDV_NOTA_FISCAL: TIntegerField;
    Item_Pedido_Venda1AGF_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_TIPO_PAG: TIntegerField;
    Item_Pedido_Venda1PDV_ENTRADA: TFloatField;
    Item_Pedido_Venda1CNC_CLIENTE: TIntegerField;
    Item_Pedido_Venda1PDV_EM_USO: TIntegerField;
    Item_Pedido_Venda1PDV_ACRESCIMO: TFloatField;
    Item_Pedido_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1PDV_MAQUINA: TIntegerField;
    Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField;
    Item_Pedido_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Item_Pedido_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Item_Pedido_Venda1PDV_IMPRESSO: TIntegerField;
    Item_Pedido_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Item_Pedido_Venda1PDV_CONTATO: TStringField;
    Item_Pedido_Venda1PDV_CREDITO: TFloatField;
    Item_Pedido_Venda1FUN_ARQUITETO: TIntegerField;
    Item_Pedido_Venda1PDV_TITULO_GERADO: TIntegerField;
    Item_Pedido_Venda1PDV_TIPO_VENDA: TIntegerField;
    Item_Pedido_Venda1PDV_PACOTE: TIntegerField;
    Item_Pedido_Venda1PDV_GRUPO_ESPECIAL: TIntegerField;
    Item_Pedido_Venda1PDV_DT_PREVISAO: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_ENTREGA: TDateTimeField;
    Item_Pedido_Venda1PDV_DOCUMENTO: TStringField;
    Item_Pedido_Venda1PDV_CAIXA: TStringField;
    Item_Pedido_Venda1PDV_SERVICO: TIntegerField;
    Item_Pedido_Venda1PDV_FONE_CONTATO: TStringField;
    Item_Pedido_Venda1FPE_CODIGO: TIntegerField;
    Item_Pedido_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrb_detalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Total,SubTotal, TotMov:Double;
    Entidade : TItem_Pedido_Venda;
  end;

var
  rpt_TipoVendas: Trpt_TipoVendas;

implementation
Uses
  UDM;
{$R *.DFM}

procedure Trpt_TipoVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active := False;
  Action := cafree;
end;




procedure Trpt_TipoVendas.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel25.Caption:=Format('%.2f',[Total]);
end;

procedure Trpt_TipoVendas.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  If (Entidade.fieldbyname('IPV_PRECO_DESC').AsFloat<>0) and (Entidade.fieldbyname('IPV_PRECO_DESC').AsFloat<>null) THEN
    SubTotal:=SubTotal+Entidade.fieldbyname('IPV_PRECO_DESC').AsFloat*(Entidade.fieldbyname('IPV_QUANTIDADE').AsFloat-Entidade.fieldbyname('IPV_BONIFICACAO').AsFloat)
  Else
    SubTotal:=SubTotal+Entidade.fieldbyname('IPV_PRECO').AsFloat*(Entidade.fieldbyname('IPV_QUANTIDADE').AsFloat-Entidade.fieldbyname('IPV_BONIFICACAO').AsFloat);
end;


procedure Trpt_TipoVendas.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel26.Caption:=Format('%.2f',[SubTotal]);
  Total:=Total+Subtotal;
  SubTotal:=0;
end;

procedure Trpt_TipoVendas.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_TipoVendas.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_TipoVendas.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=0;
  SubTotal:=0;
end;

procedure Trpt_TipoVendas.Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
begin
  try
    Produto1.Close;
    Produto1.ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
    Produto1.Open;
    Entidade.FieldByName('Produto').asString:=Produto1.Descricao;
    Entidade.FieldByName('Unidade').asString:=Produto1.Unidade;
    Entidade.FieldByName('Referencia').asString:=Produto1.Referencia;
  except
    Entidade.FieldByName('Produto').asString:='';
    Entidade.FieldByName('Unidade').asString:='';
    Entidade.FieldByName('Referencia').asString:='';    
  end;
end;

procedure Trpt_TipoVendas.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;
end;

procedure Trpt_TipoVendas.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel16.Caption := EmpresaDesenvolvedora;
end;

end.
