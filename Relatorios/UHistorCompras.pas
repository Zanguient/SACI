unit UHistorCompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Classificacao_fiscal,
  Origem_Fiscal, Fornecedor, Produto, Item_Pedido_Compra, CentroCusto;

type
  Trpt_HistorCompras = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    slrPreco: TSZRLabel;
    ZRDBText1: TSZRDBText;
    zrgGrupoPCP: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    Item_Pedido_Compra1: TItem_Pedido_Compra;
    ZRLabel15: TSZRLabel;
    ZRDBText8: TSZRDBText;
    zrlFornecedor: TSZRLabel;
    srlQuantidade: TSZRLabel;
    ZRDBText11: TSZRDBText;
    ZRDBText12: TSZRDBText;
    zrlDescTotalProduto: TSZRLabel;
    SZRDBText1: TSZRDBText;
    CentroCusto1: TCentroCusto;
    Item_Pedido_Compra1Entrega: TStringField;
    Fornecedor1: TFornecedor;
    SZRLabel3: TSZRLabel;
    SZRLabel6: TSZRLabel;
    Item_Pedido_Compra1Situacao: TStringField;
    SZRDBText3: TSZRDBText;
    Item_Pedido_Compra1IPC_CODIGO: TIntegerField;
    Item_Pedido_Compra1CNC_CODIGO: TIntegerField;
    Item_Pedido_Compra1PRD_CODIGO: TIntegerField;
    Item_Pedido_Compra1PCP_CODIGO: TIntegerField;
    Item_Pedido_Compra1USU_CODIGO: TIntegerField;
    Item_Pedido_Compra1IPC_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Compra1IPC_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Compra1IPC_QUANTIDADE: TFloatField;
    Item_Pedido_Compra1IPC_PRECO: TFloatField;
    Item_Pedido_Compra1IPC_IPI: TFloatField;
    Item_Pedido_Compra1IPC_DESCONTOS: TStringField;
    Item_Pedido_Compra1IPC_TIPO_ICMS: TIntegerField;
    Item_Pedido_Compra1FOR_CODIGO: TIntegerField;
    Item_Pedido_Compra1CNT_CODIGO: TIntegerField;
    Item_Pedido_Compra1TRN_CODIGO: TIntegerField;
    Item_Pedido_Compra1FPG_CODIGO: TIntegerField;
    Item_Pedido_Compra1OPF_CODIGO: TIntegerField;
    Item_Pedido_Compra1PCP_NOTA_FISCAL: TIntegerField;
    Item_Pedido_Compra1PCP_SERIE: TStringField;
    Item_Pedido_Compra1PCP_SUBSERIE: TStringField;
    Item_Pedido_Compra1PCP_SELO: TIntegerField;
    Item_Pedido_Compra1PCP_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Compra1PCP_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Compra1PCP_DT_EMISSAO: TDateTimeField;
    Item_Pedido_Compra1PCP_DT_SAIDA: TDateTimeField;
    Item_Pedido_Compra1PCP_DT_ENTREGA: TDateTimeField;
    Item_Pedido_Compra1CNC_ENTREGA: TIntegerField;
    Item_Pedido_Compra1PCP_BASE_CALCULO: TFloatField;
    Item_Pedido_Compra1PCP_BASE_CALCULO_SUB: TFloatField;
    Item_Pedido_Compra1PCP_ICMS: TFloatField;
    Item_Pedido_Compra1PCP_ICMS_FRETE: TFloatField;
    Item_Pedido_Compra1PCP_ICMS_SUB: TFloatField;
    Item_Pedido_Compra1PCP_FRETE: TFloatField;
    Item_Pedido_Compra1PCP_TIPO_FRETE: TSmallintField;
    Item_Pedido_Compra1PCP_SITUACAO: TIntegerField;
    Item_Pedido_Compra1PCP_CONHECIMENTO: TIntegerField;
    Item_Pedido_Compra1PCP_TOTAL_PRODUTO: TFloatField;
    Item_Pedido_Compra1PCP_TOTAL_NOTA: TFloatField;
    Item_Pedido_Compra1FPG_CODIGO_TRN: TIntegerField;
    Item_Pedido_Compra1PCP_OBSERVACAO: TStringField;
    SZRDBText6: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRDBText7: TSZRDBText;
    zrlProduto: TSZRLabel;
    Produto1: TProduto;
    zrlTotalSintetico: TSZRDBText;
    zrbSumario: TSZRBand;
    zrlTotalProdutoGeral: TSZRLabel;
    zrlDataINI: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlTotalProdutoNota: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Item_Pedido_Compra1CNC_ORIGEM: TIntegerField;
    Item_Pedido_Compra1IPC_BONIFICACAO: TFloatField;
    Item_Pedido_Compra1PCP_TOTAL_IPI: TFloatField;
    Item_Pedido_Compra1PCP_SN: TIntegerField;
    Item_Pedido_Compra1PCP_VPC: TFloatField;
    SZRDBText2: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRLabel10: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlQtdProdutosGeral: TSZRLabel;
    zrlPrecoCompra: TSZRLabel;
    Item_Pedido_Compra1IPC_OBSERVACAO: TStringField;
    Item_Pedido_Compra1IPC_AMOSTRA: TFloatField;
    Item_Pedido_Compra1IPC_PRECO_FINAL: TFloatField;
    Item_Pedido_Compra1PCP_FABRICAR: TIntegerField;
    Item_Pedido_Compra1PCP_ARQUIVO_GERADO: TIntegerField;
    Item_Pedido_Compra1PCP_DOCUMENTO: TStringField;
    Item_Pedido_Compra1PCP_FRETE_NOTA: TIntegerField;
    Item_Pedido_Compra1PCP_LJ4: TIntegerField;
    SZRLabel12: TSZRLabel;
    SZRDBText5: TSZRDBText;
    Item_Pedido_Compra1TPG_CODIGO: TIntegerField;
    Item_Pedido_Compra1PCP_TOTAL_FINAL: TFloatField;
    zrlQtdProdutosNota: TSZRLabel;
    zrlTotalBonificacaoNota: TSZRLabel;
    zrlTotalAmostraNota: TSZRLabel;
    zrlBonificacaoGeral: TSZRLabel;
    zrlAmostraGeral: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Item_Pedido_Compra1CalcFields(DataSet: TDataSet);
    procedure zrgGrupoPCPBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vQtdProdutosNota, vTotalProdutosNota, vQtdBonificacaoNota, vQtdAmostraNota, vQtdBonificacaoGeral, vQtdAmostraGeral, vQtdProdutosGeral, vTotalProdutosGeral: Double;
  public
    Entidade: TItem_Pedido_Compra;
  end;

var
  rpt_HistorCompras: Trpt_HistorCompras;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_HistorCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Fornecedor1.Close;
  CentroCusto1.Close;
  Action:=cafree;
end;

procedure Trpt_HistorCompras.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_HistorCompras.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_HistorCompras.Item_Pedido_Compra1CalcFields(
  DataSet: TDataSet);
begin
  with CentroCusto1 do
  Begin
    if CodigoCNC <> Entidade.FieldByName('CNC_ENTREGA').asInteger then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByName('CNC_ENTREGA').asInteger;
      Open;
    end;
    Entidade.FieldByName('Entrega').asString := RazaoSocial;
  end;

  case Entidade.FieldByName('PCP_SITUACAO').asInteger of
    0: Entidade.FieldByName('Situacao').asString:='Aberto';
    1: Entidade.FieldByName('Situacao').asString:='Cancelado';
    2: Entidade.FieldByName('Situacao').asString:='Processado';
  end;
end;


procedure Trpt_HistorCompras.zrgGrupoPCPBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vQtdProdutosNota    := 0;
  vTotalProdutosNota  := 0;
  vQtdBonificacaoNota := 0;
  vQtdAmostraNota     := 0;
  with Fornecedor1 do
  Begin
    Close;
    ParamByName('FOR_CODIGO').asInteger := Entidade.FieldByName('FOR_CODIGO').asInteger;
    Open;
    zrlFornecedor.Caption:=RazaoSocial+'('+IntToStr(CodigoFOR)+')';
  end;
end;

procedure Trpt_HistorCompras.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vQtdProdutosNota     := vQtdProdutosNota     + Entidade.Quantidade;
  vQtdProdutosGeral    := vQtdProdutosGeral    + Entidade.Quantidade;
  vQtdBonificacaoNota  := vQtdBonificacaoNota  + Entidade.Bonificacao;
  vQtdBonificacaoGeral := vQtdBonificacaoGeral + Entidade.Bonificacao;
  vQtdAmostraNota      := vQtdAmostraNota      + Entidade.Amostra;
  vQtdAmostraGeral     := vQtdAmostraGeral     + Entidade.Amostra;
  if Arredonda(Entidade.FieldByName('PCP_TOTAL_NOTA').asFloat,4) = Arredonda(Entidade.FieldByName('PCP_TOTAL_FINAL').asFloat,4) then
  Begin
    vTotalProdutosGeral := vTotalProdutosGeral + (Entidade.Quantidade-Entidade.Bonificacao-Entidade.Amostra)*
                               Arredonda(CalculaDesconto(Entidade.Preco,Entidade.Descontos),4);
    vTotalProdutosNota := vTotalProdutosNota + (Entidade.Quantidade-Entidade.Bonificacao-Entidade.Amostra)*
                                    Arredonda(CalculaDesconto(Entidade.Preco,Entidade.Descontos),4);
  end
  else
  Begin
    vTotalProdutosGeral := vTotalProdutosGeral + (Entidade.Quantidade-Entidade.Bonificacao-Entidade.Amostra)*
                               Arredonda(Entidade.PrecoFinal,4);
    vTotalProdutosNota := vTotalProdutosNota + (Entidade.Quantidade-Entidade.Bonificacao-Entidade.Amostra)*
                                   Arredonda(Entidade.PrecoFinal,4);
  end;

  if zrbDetalhe.Height = 0 then
     Exit;

  with Produto1 do
  Begin
    if CodigoPRD <> Entidade.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    if (DM.Configuracao1.Empresa = empMotical) and
       (Produto1.CodigoGRP = 2) then
      zrlProduto.Caption := Trim(MostraGrauConvertido(Descricao)+' '+Caracteristica)+' '+Trim(Referencia)+' '+Trim(Marca)+
        ' '+Trim(Unidade)
    else
      zrlProduto.Caption := Trim(Descricao+' '+Caracteristica)+' '+Trim(Referencia)+' '+Trim(Marca)+
        ' '+Trim(Unidade);
    //
    if Arredonda(Entidade.FieldByName('PCP_TOTAL_NOTA').asFloat,4) = Arredonda(Entidade.FieldByName('PCP_TOTAL_FINAL').asFloat,4) then
      zrlPrecoCompra.Caption := format('%.2f',[(Arredonda(CalculaDesconto(Entidade.Preco,Entidade.Descontos),4))])
    else
      zrlPrecoCompra.Caption := format('%.2f',[(Arredonda(Entidade.PrecoFinal,4))]);
  end;
end;

procedure Trpt_HistorCompras.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlAmostraGeral.Caption := format('%.2f',[vQtdAmostraGeral]);
  zrlBonificacaoGeral.Caption := format('%.2f',[vQtdBonificacaoGeral]);
  zrlQtdProdutosGeral.Caption := format('%.2f',[vQtdProdutosGeral]);
  zrlTotalProdutoGeral.Caption := format('%.2f',[vTotalProdutosGeral]);
end;

procedure Trpt_HistorCompras.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Compra1;
  vQtdBonificacaoGeral := 0;
  vQtdAmostraGeral     := 0;
  vTotalProdutosGeral  := 0;
  vQtdProdutosGeral    := 0;
end;

procedure Trpt_HistorCompras.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_HistorCompras.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalAmostraNota.Caption     := format('%.2f',[vQtdAmostraNota]);
  zrlTotalBonificacaoNota.Caption := format('%.2f',[vQtdBonificacaoNota]);
  zrlQtdProdutosNota.Caption      := format('%.2f',[vQtdProdutosNota]);
  zrlTotalProdutoNota.Caption     := format('%.2f',[vTotalProdutosNota]);
end;

end.
