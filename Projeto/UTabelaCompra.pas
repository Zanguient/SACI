unit UTabelaCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Classificacao_fiscal,
  Origem_Fiscal, Fornecedor, Produto, Item_Pedido_Compra, CentroCusto,
  Transportadora, Contato, Forma_de_Pagamento;

type
  Trpt_TabelaCompra = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRGroup1: TSZRGroup;
    ZRDBText6: TSZRDBText;
    ZRLabel18: TSZRLabel;
    Item_Pedido_Compra1: TItem_Pedido_Compra;
    ZRDBText8: TSZRDBText;
    ZRLabel14: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRDBText11: TSZRDBText;
    ZRDBText12: TSZRDBText;
    ZRLabel23: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    CentroCusto1: TCentroCusto;
    Item_Pedido_Compra1Entrega: TStringField;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    Item_Pedido_Compra1Situacao: TStringField;
    SZRDBText3: TSZRDBText;
    SZRFrameLine1: TSZRFrameLine;
    Transportadora1: TTransportadora;
    SZRFrameLine2: TSZRFrameLine;
    SZRLabel4: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel5: TSZRLabel;
    Fornecedor1: TFornecedor;
    zrlFornecedor: TSZRLabel;
    zrlTransportadora: TSZRLabel;
    SZRLabel13: TSZRLabel;
    Item_Pedido_Compra1CNC_CODIGO: TIntegerField;
    Item_Pedido_Compra1IPC_IPI: TFloatField;
    Item_Pedido_Compra1IPC_DESCONTOS: TStringField;
    Item_Pedido_Compra1IPC_PRECO: TFloatField;
    Item_Pedido_Compra1IPC_QUANTIDADE: TFloatField;
    Item_Pedido_Compra1PRD_CODIGO: TIntegerField;
    Item_Pedido_Compra1FOR_CODIGO: TIntegerField;
    Item_Pedido_Compra1PCP_CODIGO: TIntegerField;
    Item_Pedido_Compra1PCP_DT_ENTREGA: TDateTimeField;
    Item_Pedido_Compra1PCP_DT_EMISSAO: TDateTimeField;
    Item_Pedido_Compra1PCP_SITUACAO: TIntegerField;
    Item_Pedido_Compra1PCP_TOTAL_PRODUTO: TFloatField;
    Item_Pedido_Compra1PCP_TOTAL_NOTA: TFloatField;
    Item_Pedido_Compra1CNC_ENTREGA: TIntegerField;
    Item_Pedido_Compra1TRN_CODIGO: TIntegerField;
    Item_Pedido_Compra1PCP_FRETE: TFloatField;
    Item_Pedido_Compra1PCP_ICMS: TFloatField;
    Item_Pedido_Compra1PCP_ICMS_FRETE: TFloatField;
    Item_Pedido_Compra1PCP_ICMS_SUB: TFloatField;
    SZRLabel19: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    Contato1: TContato;
    Item_Pedido_Compra1CNT_CODIGO: TIntegerField;
    SZRLabel25: TSZRLabel;
    SZRDBText9: TSZRDBText;
    Item_Pedido_Compra1PCP_NOTA_FISCAL: TIntegerField;
    Item_Pedido_Compra1PCP_TOTAL_IPI: TFloatField;
    zrlPrecoVenda: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRDBText5: TSZRDBText;
    Item_Pedido_Compra1USU_CODIGO: TIntegerField;
    Item_Pedido_Compra1FPG_CODIGO: TIntegerField;
    Item_Pedido_Compra1OPF_CODIGO: TIntegerField;
    Item_Pedido_Compra1PCP_SERIE: TStringField;
    Item_Pedido_Compra1PCP_SUBSERIE: TStringField;
    Item_Pedido_Compra1PCP_SELO: TIntegerField;
    Item_Pedido_Compra1PCP_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Compra1PCP_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Compra1PCP_DT_SAIDA: TDateTimeField;
    Item_Pedido_Compra1PCP_BASE_CALCULO: TFloatField;
    Item_Pedido_Compra1PCP_BASE_CALCULO_SUB: TFloatField;
    Item_Pedido_Compra1PCP_TIPO_FRETE: TSmallintField;
    Item_Pedido_Compra1PCP_CONHECIMENTO: TIntegerField;
    Item_Pedido_Compra1FPG_CODIGO_TRN: TIntegerField;
    Item_Pedido_Compra1PCP_OBSERVACAO: TStringField;
    zrlLoja3: TSZRLabel;
    Item_Pedido_Compra1PCP_SN: TIntegerField;
    zrlUsuario: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlFormaPagamento: TSZRLabel;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    Item_Pedido_Compra1CNC_ORIGEM: TIntegerField;
    Item_Pedido_Compra1PCP_VPC: TFloatField;
    Item_Pedido_Compra1IPC_BONIFICACAO: TFloatField;
    zrlDescVPC: TSZRLabel;
    zdbVPC: TSZRDBText;
    Item_Pedido_Compra1PCP_FABRICAR: TIntegerField;
    Item_Pedido_Compra1PCP_ARQUIVO_GERADO: TIntegerField;
    Item_Pedido_Compra1IPC_CODIGO: TIntegerField;
    Item_Pedido_Compra1IPC_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Compra1IPC_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Compra1IPC_TIPO_ICMS: TIntegerField;
    Item_Pedido_Compra1IPC_OBSERVACAO: TStringField;
    zrlProduto: TSZRLabel;
    Produto1: TProduto;
    zrlReferencia: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRDBText4: TSZRDBText;
    Item_Pedido_Compra1PCP_DOCUMENTO: TStringField;
    Item_Pedido_Compra1PCP_FRETE_NOTA: TIntegerField;
    Item_Pedido_Compra1IPC_AMOSTRA: TFloatField;
    Item_Pedido_Compra1IPC_PRECO_FINAL: TFloatField;
    Item_Pedido_Compra1PCP_LJ4: TIntegerField;
    Item_Pedido_Compra1TPG_CODIGO: TIntegerField;
    Item_Pedido_Compra1PCP_TOTAL_FINAL: TFloatField;
    SZRLabel20: TSZRLabel;
    zrlPrecoCalculado: TSZRLabel;
    Item_Pedido_Compra1PCP_PRECO_FINAL_DEFINIDO: TIntegerField;
    Item_Pedido_Compra1PCP_PERCENTUAL_CUSTO: TFloatField;
    Item_Pedido_Compra1PCP_PERCENTUAL_VENDA: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Item_Pedido_Compra1CalcFields(DataSet: TDataSet);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private

  public
    Entidade: TItem_Pedido_Compra;
  end;

var
  rpt_TabelaCompra: Trpt_TabelaCompra;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_TabelaCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := caFree;
end;

procedure Trpt_TabelaCompra.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlEmpresa.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_TabelaCompra.Item_Pedido_Compra1CalcFields(
  DataSet: TDataSet);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Entidade.FieldByName('CNC_ENTREGA').asInteger;
  CentroCusto1.Open;
  Entidade.FieldByName('Entrega').asString:=CentroCusto1.RazaoSocial;
  Case Entidade.FieldByname('PCP_SITUACAO').asInteger of
    0: Entidade.FieldByName('Situacao').asString:='Pedido Gerado';
    1: Entidade.FieldByName('Situacao').asString:='Pedido Cancelado';
    2: Entidade.FieldByName('Situacao').asString:='Pedido Processado';
   End;
end;

procedure Trpt_TabelaCompra.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.FieldByName('PCP_VPC').asFloat = 0 then
  Begin
    zrlDescVPC.Enabled := False;
    zdbVPC.Enabled := False;
  end
  else
  Begin
    zrlDescVPC.Enabled := True;
    zdbVPC.Enabled := True;
  end;

  if Entidade.FieldByName('FOR_CODIGO').asInteger > 0 then
  Begin
    Fornecedor1.Close;
    Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=Entidade.FieldByName('FOR_CODIGO').asInteger;
    Fornecedor1.Open;
    zrlFornecedor.Caption:=Fornecedor1.RazaoSocial;
  end
  else
    zrlFornecedor.Caption:='';
  if Entidade.FieldByName('CNT_CODIGO').asInteger > 0 then
  Begin
    Contato1.Close;
    Contato1.ParamByName('CNT_CODIGO').asInteger:=Entidade.FieldByName('CNT_CODIGO').asInteger;
    Contato1.Open;
    SZRLabel23.Caption:=Contato1.Nome;
  end
  else
    SZRLabel23.Caption:='';
  if Entidade.FieldByName('TRN_CODIGO').asInteger > 0 then
  Begin
    Transportadora1.Close;
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=Entidade.FieldByName('TRN_CODIGO').asInteger;
    Transportadora1.Open;
    zrlTransportadora.Caption:=Transportadora1.RazaoSocial;
  end
  else
    zrlTransportadora.Caption:='';

  //Forma de pagamento
  with Forma_de_Pagamento1 do
  Begin
    if CodigoFPG <> Entidade.FieldByName('FPG_CODIGO').asInteger then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger := Entidade.FieldByName('FPG_CODIGO').asInteger;
      Open;
    end;
    zrlFormaPagamento.Caption := Descricao;
  end;

  if Entidade.FieldByName('PCP_SN').asInteger = 1 then
    zrlLoja3.Enabled := True
  else
    zrlLoja3.Enabled := False;
end;

procedure Trpt_TabelaCompra.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescBonAmo: string;
  vPrecoCalculado: Double;
begin
  with Entidade do
  Begin
    sDescBonAmo := '';
    if Bonificacao > 0 then
      sDescBonAmo := sDescBonAmo + '(B:'+Format('%.2f',[Bonificacao])+')';
    if Amostra > 0 then
      sDescBonAmo := sDescBonAmo + '(A:'+Format('%.2f',[Amostra])+')';

    Produto1.Close;
    Produto1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
    Produto1.Open;
    if DM.Configuracao1.Empresa = 1 then
      zrlProduto.Caption := Produto1.Descricao+' '+Produto1.Caracteristica+sDescBonAmo
    else if (DM.Configuracao1.Empresa = empMotical) and
            (Produto1.CodigoGRP = 2) then
      zrlProduto.Caption   := MostraGrauConvertido(Produto1.Descricao)+sDescBonAmo
    else
      zrlProduto.Caption   := Produto1.Descricao+sDescBonAmo;
    zrlReferencia.Caption  := Produto1.Referencia;
  end;

  if Arredonda(Item_Pedido_Compra1.FieldByName('PCP_TOTAL_NOTA').asFloat,4) = Arredonda(Item_Pedido_Compra1.FieldByName('PCP_TOTAL_FINAL').asFloat,4) then
  Begin
    vPrecoCalculado := CalculaDesconto(Item_Pedido_Compra1.Preco,Item_Pedido_Compra1.Descontos,4);
    vPrecoCalculado := vPrecoCalculado + Arredonda(vPrecoCalculado*Item_Pedido_Compra1.IPI/100,4);
  end
  else
    vPrecoCalculado := Arredonda(Item_Pedido_Compra1.PrecoFinal,4);

  vPrecoCalculado := vPrecoCalculado + Arredonda(vPrecoCalculado*Item_Pedido_Compra1.FieldByName('PCP_FRETE').asFLoat/100,4);
  vPrecoCalculado := vPrecoCalculado + Arredonda(vPrecoCalculado*Item_Pedido_Compra1.FieldByName('PCP_PERCENTUAL_CUSTO').asFloat/100,4);  
  vPrecoCalculado := vPrecoCalculado + Arredonda(vPrecoCalculado*Item_Pedido_Compra1.FieldByName('PCP_PERCENTUAL_VENDA').asFloat/100,4);

  zrlPrecoCalculado.Caption := Format('%.2f',[vPrecoCalculado]);
  zrlPrecoVenda.Caption     := Format('%.2f',[Produto1.Precovenda]);
end;

procedure Trpt_TabelaCompra.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

procedure Trpt_TabelaCompra.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Compra1;
end;

end.














































































































































































































