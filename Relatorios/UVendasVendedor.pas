unit UVendasVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Variants, Funcionario,
  Titulo_receber, AgenteFin, Forma_de_Pagamento, Cliente, Produto,
  Item_Pedido_Venda;

type
  Trpt_VendasVendedor = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrb_detalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    ZRDBText1: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRDBText10: TSZRDBText;
    ZRBand3: TSZRBand;
    ZRLabel21: TSZRLabel;
    ZRLabel25: TSZRLabel;
    ZRLabel26: TSZRLabel;
    Produto1: TProduto;
    SZRLabel1: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Item_Pedido_Venda1Produto: TStringField;
    Cliente1: TCliente;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_CODIGO: TIntegerField;
    Item_Pedido_Venda1FUN_CODIGO: TIntegerField;
    Item_Pedido_Venda1IEB_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
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
    Item_Pedido_Venda1IPV_NOTA: TIntegerField;
    Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1CNC_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1CLI_CODIGO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_DATA_HORA: TDateTimeField;
    Item_Pedido_Venda1PDV_TOTAL: TFloatField;
    Item_Pedido_Venda1PDV_LISTADO: TIntegerField;
    Item_Pedido_Venda1PDV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1PDV_DIAS_RESERV: TIntegerField;
    Item_Pedido_Venda1PDV_NOTA_FISCAL: TSmallintField;
    Item_Pedido_Venda1AGF_CODIGO: TIntegerField;
    Item_Pedido_Venda1FPG_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_TIPO_PAG: TIntegerField;
    Item_Pedido_Venda1PDV_ENTRADA: TFloatField;
    Item_Pedido_Venda1CNC_CLIENTE: TIntegerField;
    Item_Pedido_Venda1PDV_EM_USO: TIntegerField;
    ZRLabel8: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1PDV_ACRESCIMO: TFloatField;
    Item_Pedido_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1PDV_MAQUINA: TIntegerField;
    Item_Pedido_Venda1Unidade: TStringField;
    SZRExpression1: TSZRExpression;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    SZRLabel54: TSZRLabel;
    SZRLabel55: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRLabel24: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel35: TSZRLabel;
    SZRLabel36: TSZRLabel;
    SZRLabel37: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel46: TSZRLabel;
    SZRLabel47: TSZRLabel;
    SZRLabel48: TSZRLabel;
    SZRLabel49: TSZRLabel;
    SZRLabel50: TSZRLabel;
    SZRLabel51: TSZRLabel;
    SZRLabel52: TSZRLabel;
    SZRLabel53: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel61: TSZRLabel;
    SZRLabel62: TSZRLabel;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField;
    Item_Pedido_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    SZRLabel58: TSZRLabel;
    SZRLabel63: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    Item_Pedido_Venda1Referencia: TStringField;
    Item_Pedido_Venda1Detalhe: TStringField;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel64: TSZRLabel;
    SZRLabel65: TSZRLabel;
    SZRLabel66: TSZRLabel;
    SZRLabel67: TSZRLabel;
    SZRLabel68: TSZRLabel;
    SZRLabel69: TSZRLabel;
    SZRLabel70: TSZRLabel;
    SZRLabel71: TSZRLabel;
    SZRLabel72: TSZRLabel;
    SZRLabel73: TSZRLabel;
    SZRLabel74: TSZRLabel;
    SZRLabel75: TSZRLabel;
    SZRLabel76: TSZRLabel;
    SZRLabel77: TSZRLabel;
    SZRLabel78: TSZRLabel;
    SZRLabel79: TSZRLabel;
    SZRLabel80: TSZRLabel;
    SZRLabel81: TSZRLabel;
    SZRLabel82: TSZRLabel;
    SZRLabel83: TSZRLabel;
    SZRLabel84: TSZRLabel;
    SZRLabel85: TSZRLabel;
    SZRLabel86: TSZRLabel;
    SZRLabel87: TSZRLabel;
    SZRLabel88: TSZRLabel;
    SZRLabel90: TSZRLabel;
    SZRLabel91: TSZRLabel;
    SZRLabel92: TSZRLabel;
    SZRLabel93: TSZRLabel;
    SZRLabel94: TSZRLabel;
    SZRLabel95: TSZRLabel;
    SZRLabel96: TSZRLabel;
    SZRLabel97: TSZRLabel;
    SZRLabel98: TSZRLabel;
    SZRLabel99: TSZRLabel;
    SZRLabel100: TSZRLabel;
    SZRLabel101: TSZRLabel;
    SZRLabel102: TSZRLabel;
    SZRLabel103: TSZRLabel;
    SZRLabel104: TSZRLabel;
    SZRLabel105: TSZRLabel;
    SZRLabel106: TSZRLabel;
    SZRLabel107: TSZRLabel;
    SZRLabel108: TSZRLabel;
    SZRLabel109: TSZRLabel;
    SZRLabel110: TSZRLabel;
    SZRLabel111: TSZRLabel;
    SZRLabel112: TSZRLabel;
    SZRLabel113: TSZRLabel;
    SZRLabel114: TSZRLabel;
    SZRLabel115: TSZRLabel;
    SZRLabel116: TSZRLabel;
    SZRLabel117: TSZRLabel;
    SZRLabel118: TSZRLabel;
    SZRLabel119: TSZRLabel;
    SZRLabel120: TSZRLabel;
    SZRLabel121: TSZRLabel;
    SZRLabel122: TSZRLabel;
    SZRLabel123: TSZRLabel;
    SZRLabel124: TSZRLabel;
    SZRLabel125: TSZRLabel;
    SZRLabel126: TSZRLabel;
    SZRLabel127: TSZRLabel;
    SZRLabel128: TSZRLabel;
    SZRLabel129: TSZRLabel;
    SZRLabel130: TSZRLabel;
    SZRLabel131: TSZRLabel;
    SZRLabel132: TSZRLabel;
    SZRLabel133: TSZRLabel;
    SZRLabel134: TSZRLabel;
    SZRLabel135: TSZRLabel;
    SZRLabel136: TSZRLabel;
    SZRLabel137: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    SZRLabel138: TSZRLabel;
    SZRLabel139: TSZRLabel;
    Item_Pedido_Venda1PDV_NOTA_CUPOM: TIntegerField;
    SZRLabel89: TSZRLabel;
    SZRLabel140: TSZRLabel;
    SZRLabel141: TSZRLabel;
    SZRLabel142: TSZRLabel;
    SZRLabel143: TSZRLabel;
    SZRLabel144: TSZRLabel;
    SZRLabel145: TSZRLabel;
    SZRLabel146: TSZRLabel;
    SZRLabel147: TSZRLabel;
    SZRLabel148: TSZRLabel;
    SZRLabel149: TSZRLabel;
    SZRLabel150: TSZRLabel;
    SZRLabel151: TSZRLabel;
    SZRLabel152: TSZRLabel;
    SZRLabel153: TSZRLabel;
    SZRLabel154: TSZRLabel;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel156: TSZRLabel;
    SZRLabel157: TSZRLabel;
    SZRLabel158: TSZRLabel;
    SZRLabel159: TSZRLabel;
    SZRLabel160: TSZRLabel;
    SZRLabel162: TSZRLabel;
    SZRLabel163: TSZRLabel;
    SZRLabel56: TSZRLabel;
    SZRLabel57: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRBand1: TSZRBand;
    SZRLabel164: TSZRLabel;
    SZRLabel165: TSZRLabel;
    SZRLabel166: TSZRLabel;
    SZRLabel167: TSZRLabel;
    SZRLabel168: TSZRLabel;
    SZRLabel42: TSZRLabel;
    Funcionario1: TFuncionario;
    SZRLabel43: TSZRLabel;
    Item_Pedido_Venda1PDV_OBS: TStringField;
    SZRLabel44: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel45: TSZRLabel;
    Item_Pedido_Venda1PDV_IMPRESSO: TIntegerField;
    Item_Pedido_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Item_Pedido_Venda1PDV_CONTATO: TStringField;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
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
    Item_Pedido_Venda1IPV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Venda1IPV_VINCULO: TIntegerField;
    Item_Pedido_Venda1IPV_SEQUENCIA: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1PDV_DT_FPE: TDateTimeField;
    Item_Pedido_Venda1CNT_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_GARANTIA: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Item_Pedido_Venda1PDV_FRETE: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrb_detalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    procedure LimpaCampos;
    { Private declarations }
  public
    { Public declarations }
    Total,SubTotal, TotMov, TotQtd, TotalFUN:Double;
  end;

var
  rpt_VendasVendedor: Trpt_VendasVendedor;

implementation
Uses
  UDM, MxSelPedidos, Funcoes;
{$R *.DFM}

procedure Trpt_VendasVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Close;
  Cliente1.Close;
  Item_Pedido_Venda1.Close;
  Action := cafree;
end;

procedure Trpt_VendasVendedor.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel25.Caption:=Format('%.2f',[Total]);
  SZRLabel54.Caption:=Format('%.2f',[TotQtd]);
end;

procedure Trpt_VendasVendedor.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  If (Item_Pedido_Venda1.PrecoDesc<>0) or (DM.Configuracao1.Empresa = empLBM) THEN
  Begin
    TotalFUN:=TotalFUN+Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade);
    SubTotal:=SubTotal+Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade);
    Total:=Total      +Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade);
  end
  Else
  Begin
    TotalFUN:=TotalFUN+Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade);
    SubTotal:=SubTotal+Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade);
    Total:=Total      +Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade);
  end;
  TotQtd:=TotQtd+Item_Pedido_Venda1.Quantidade;
end;


procedure Trpt_VendasVendedor.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  i:integer;
begin
  if tag = 2 then
    report.CurrentY := 42;
  SZRLabel67.Caption:=AgenteFin1.Descricao;
  ZRLabel26.Caption:=Format('%.2f',[SubTotal]);
  SubTotal:=0;
  if tag = 0 then
    if not fMxSelPedidos.CheckBox6.Checked then
      Exit;
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    SZRLabel138.Enabled:=False;
    SZRLabel139.Enabled:=False;
  end;
  Titulo_receber1.Close;
  Titulo_receber1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
  Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPDV;
  Titulo_receber1.Open;
  Titulo_receber1.First;
  LimpaCampos;
  for i:=1 to Titulo_receber1.RecordCount do
  Begin
    if i = 1 then
    Begin
      SZRLabel143.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel102.Caption:=Titulo_receber1.Sequencia;
      SZRLabel103.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel104.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 2 then
    Begin
      SZRLabel144.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel105.Caption:=Titulo_receber1.Sequencia;
      SZRLabel106.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel107.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 3 then
    Begin
      SZRLabel145.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel108.Caption:=Titulo_receber1.Sequencia;
      SZRLabel109.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel110.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 4 then
    Begin
      SZRLabel146.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel111.Caption:=Titulo_receber1.Sequencia;
      SZRLabel112.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel113.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 5 then
    Begin
      SZRLabel147.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel114.Caption:=Titulo_receber1.Sequencia;
      SZRLabel115.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel116.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 6 then
    Begin
      SZRLabel148.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel117.Caption:=Titulo_receber1.Sequencia;
      SZRLabel118.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel119.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 7 then
    Begin
      SZRLabel149.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel120.Caption:=Titulo_receber1.Sequencia;
      SZRLabel121.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel122.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 8 then
    Begin
      SZRLabel150.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel123.Caption:=Titulo_receber1.Sequencia;
      SZRLabel124.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel125.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 9 then
    Begin
      SZRLabel151.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel126.Caption:=Titulo_receber1.Sequencia;
      SZRLabel127.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel128.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 10 then
    Begin
      SZRLabel152.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel129.Caption:=Titulo_receber1.Sequencia;
      SZRLabel130.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel131.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 11 then
    Begin
      SZRLabel153.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel132.Caption:=Titulo_receber1.Sequencia;
      SZRLabel133.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel134.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 12 then
    Begin
      SZRLabel154.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel135.Caption:=Titulo_receber1.Sequencia;
      SZRLabel136.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel137.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end;
    Titulo_receber1.Next;
  end;
end;

procedure Trpt_VendasVendedor.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_VendasVendedor.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_VendasVendedor.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=0;
  SubTotal:=0;
  TotQtd:=0;
end;

procedure Trpt_VendasVendedor.Item_Pedido_Venda1CalcFields(
  DataSet: TDataSet);
begin
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
  Produto1.Open;
  Item_Pedido_Venda1.FieldByName('Produto').asString:=Produto1.Descricao;
  Item_Pedido_Venda1.FieldByName('Unidade').asString:=Produto1.Unidade;
  Item_Pedido_Venda1.FieldByName('Referencia').asString:=Produto1.Referencia;
  Item_Pedido_Venda1.FieldByName('Detalhe').asString:=Produto1.Detalhe;
end;

procedure Trpt_VendasVendedor.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Pedido_Venda1.FieldByName('PDV_DT_ALTERADO').AsDateTime > 0 then
    SZRLabel168.Caption := formatDateTime('dd/mm/yyyy',Item_Pedido_Venda1.FieldByName('PDV_DT_ALTERADO').AsDateTime)
  else
    SZRLabel168.Caption := '';

  SZRLabel56.Caption := IntToStr(Item_Pedido_Venda1.CodigoFUN);
  SZRLabel164.Caption := format('%.2f',[Item_Pedido_Venda1.FieldByName('PDV_TOTAL').asFloat+Item_Pedido_Venda1.FieldByName('PDV_ACRESCIMO').asFloat]);
  case Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger of
    0 : SZRLabel57.Caption := 'AV'
  else
    SZRLabel57.Caption := 'PZ';
  end;
  Cliente1.Close;
  Cliente1.ParamByName('CLI_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger;
  Cliente1.Open;
  SZRLabel10.Caption:=Cliente1.RazaoSocial+' ('+IntToStr(Cliente1.CodigoCLI)+')';
  SZRLabel14.Caption:=Cliente1.NomeFantasia;
  SZRLabel37.Caption:=Cliente1.Fone;
  SZRLabel33.Caption:=Cliente1.CGFRG;
  SZRLabel35.Caption:=Cliente1.CPFCGC;
  if Cliente1.DataNascimento > 0 then
    SZRLabel39.Caption:=formatDateTime('dd/mm/yyyy',Cliente1.DataNascimento)
  else
    SZRLabel39.Caption:='';
  case Cliente1.Situacao of
    0: SZRLabel41.Caption:='Novo';
    1: SZRLabel41.Caption:='Antigo';
    2: SZRLabel41.Caption:='Adimplente';
    3: SZRLabel41.Caption:='Inadimplente';
  end;

  SZRLabel17.Caption:=Trim(DM.SelecionaParametro(Cliente1.Logradouro)+' '+Cliente1.Endereco);
  SZRLabel18.Caption:=Cliente1.Bairro;
  SZRLabel19.Caption:=Cliente1.Cidade;
  SZRLabel22.Caption:=Cliente1.Uf;
  if DM.Configuracao1.Empresa = empLBM then
    SZRLabel27.Caption := Item_Pedido_Venda1.FieldByName('PDV_CONTATO').asString
  else
  Begin
    if (Trim(Cliente1.Pai)+'/'+Trim(Cliente1.Mae) <> '/') then
      SZRLabel27.Caption:=Trim(Cliente1.Pai)+'/'+Trim(Cliente1.Mae)
    else
      SZRLabel27.Caption:='';
  end;
  
  SZRLabel29.Caption:=Cliente1.LocalTrabalho;

  SZRLabel11.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime);

  Forma_de_Pagamento1.Close;
  Forma_de_Pagamento1.ParamByName('FPG_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger;
  Forma_de_Pagamento1.Open;
  SZRLabel48.Caption:=Forma_de_Pagamento1.Descricao;

  AgenteFin1.Close;
  AgenteFin1.ParamByName('AGF_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('AGF_CODIGO').asInteger;
  AgenteFin1.Open;
  SZRLabel51.Caption:=AgenteFin1.Descricao;

  SZRLabel53.Caption:=DM.SelecionaParametro(Item_Pedido_Venda1.FieldByName('PDV_TIPO_PAG').asInteger);

  if (Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString = '0') OR
     (Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString = '') then
  Begin
    SZRLabel89.Enabled:=False;
    SZRLabel61.Enabled:=False;
    SZRLabel62.Enabled:=False;
  end
  else
    SZRLabel62.Caption:=Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString;
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    SZRLabel24.Enabled := False;
    SZRLabel25.Enabled := False;
    SZRLabel26.Caption := 'Contato:';
    if tag = 0 then
    Begin
      if not fMxSelPedidos.CheckBox10.Checked then //Não Sintético
      Begin
        SZRLabel26.Left    := 0;
        SZRLabel27.Left    := 10;
      end;
    end
    else
    Begin
      SZRLabel26.Left    := 0;
      SZRLabel27.Left    := 10;
    end;
  end
  else
    SZRLabel25.Caption:=Cliente1.Conjuge;
  case Item_Pedido_Venda1.FieldByName('PDV_NOTA_CUPOM').asInteger of
    0: if Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString <> '' then
         SZRLabel89.Caption:='N'
       else
         SZRLabel89.Caption:='';
    1: SZRLabel89.Caption:='C';
  else
    SZRLabel89.Caption:='';
  end;
end;

procedure Trpt_VendasVendedor.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
//  SZRGroup1.Height := 0;
//  report.CurrentY := 7;
  TotalFUN := 0;
  Funcionario1.Close;
  Funcionario1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
  Funcionario1.ParamByName('FUN_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoFUN;
  Funcionario1.Open;
  SZRLabel43.Caption:=Funcionario1.Apelido;
end;

procedure Trpt_VendasVendedor.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if not fMxSelPedidos.CheckBox10.Checked then
  Begin
    SZRLabel165.Enabled := False;
    SZRBand1.Height := 0;
  end
  else
    SZRLabel166.Caption := format('%.2f',[TotalFUN]);
end;

procedure Trpt_VendasVendedor.LimpaCampos;
begin
  SZRLabel143.Caption:='';
  SZRLabel102.Caption:='';
  SZRLabel103.Caption:='';
  SZRLabel104.Caption:='';
  SZRLabel144.Caption:='';
  SZRLabel105.Caption:='';
  SZRLabel106.Caption:='';
  SZRLabel107.Caption:='';
  SZRLabel145.Caption:='';
  SZRLabel108.Caption:='';
  SZRLabel109.Caption:='';
  SZRLabel110.Caption:='';
  SZRLabel146.Caption:='';
  SZRLabel111.Caption:='';
  SZRLabel112.Caption:='';
  SZRLabel113.Caption:='';
  SZRLabel147.Caption:='';
  SZRLabel114.Caption:='';
  SZRLabel115.Caption:='';
  SZRLabel116.Caption:='';
  SZRLabel148.Caption:='';
  SZRLabel117.Caption:='';
  SZRLabel118.Caption:='';
  SZRLabel119.Caption:='';
  SZRLabel149.Caption:='';
  SZRLabel120.Caption:='';
  SZRLabel121.Caption:='';
  SZRLabel122.Caption:='';
  SZRLabel150.Caption:='';
  SZRLabel123.Caption:='';
  SZRLabel124.Caption:='';
  SZRLabel125.Caption:='';
  SZRLabel151.Caption:='';
  SZRLabel126.Caption:='';
  SZRLabel127.Caption:='';
  SZRLabel128.Caption:='';
  SZRLabel152.Caption:='';
  SZRLabel129.Caption:='';
  SZRLabel130.Caption:='';
  SZRLabel131.Caption:='';
  SZRLabel153.Caption:='';
  SZRLabel132.Caption:='';
  SZRLabel133.Caption:='';
  SZRLabel134.Caption:='';
  SZRLabel154.Caption:='';
  SZRLabel135.Caption:='';
  SZRLabel136.Caption:='';
  SZRLabel137.Caption:='';
end;

procedure Trpt_VendasVendedor.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
