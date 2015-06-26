unit UVendasDesconto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Item_Pedido_Venda, Funcionario,
  Secao, Produto, Forma_de_Pagamento, Parametro, AgenteFin, CentroCusto,
  Titulo_receber;

type
  Trpt_VendasDesconto = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrbRodapePagina: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    ZRDBText6: TSZRDBText;
    zrlFiltros: TSZRLabel;
    zrbGrupoFUN: TSZRGroup;
    zrlDescVendedor: TSZRLabel;
    SZRLabel57: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrbRodapeGrupoFUN: TSZRBand;
    SZRLabel12: TSZRLabel;
    zrlSubTotalVenda: TSZRLabel;
    zrlSubTotalDesconto: TSZRLabel;
    zrlFuncionario: TSZRLabel;
    Funcionario1: TFuncionario;
    SZRLabel4: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlSubTotalLiquido: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlDesconto: TSZRLabel;
    zrlDescQtd: TSZRLabel;
    zrlDescValor: TSZRLabel;
    zrlDescDesconto: TSZRLabel;
    zrlPercentual: TSZRLabel;
    Produto1: TProduto;
    SZRDBText1: TSZRDBText;
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
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel17: TSZRLabel;
    zrlDescPrecoDesc: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrbGrupoCNC: TSZRGroup;
    zrlDescCentro: TSZRLabel;
    zrlCentro: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrbRodapeGrupoCNC: TSZRBand;
    zrlDescTotalCentro: TSZRLabel;
    zrlTotalVenda: TSZRLabel;
    zrlTotalDesconto: TSZRLabel;
    zrlTotalLiquido: TSZRLabel;
    Item_Pedido_Venda1PDV_NOTA_FISCAL: TIntegerField;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoFUNBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoFUNBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TItem_Pedido_Venda;
    Total,TotalCentro,Descontos,DescontosCentro:Double;
  end;

var
  rpt_VendasDesconto: Trpt_VendasDesconto;

implementation
Uses
  UDM, MxSVendasCliente, Funcoes;
{$R *.DFM}

procedure Trpt_VendasDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_VendasDesconto.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbDetalhe.Height > 0 then
  Begin
    with Produto1 do
    Begin
      if (not Active) or
         (CodigoPRD <> Entidade.CodigoPRD) then
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
        Open;
      end;
      if DM.Configuracao1.Empresa = empEletro then
        zrlProduto.Caption := Trim(Descricao+' '+Caracteristica)
      else
        zrlProduto.Caption := Descricao;
    end;
    if Entidade.PrecoDesc > 0 then
      zrlDesconto.Caption:=format('%.2f',[(1-(Entidade.PrecoDesc/Entidade.Preco))*100])
    else
      zrlDesconto.Caption:='0,00';
  end;
  if (DM.Configuracao1.Empresa = empLBM) AND
     ((Entidade.FieldByName('PDV_NOTA_FISCAL').asString = '0') OR
     (Entidade.FieldByName('PDV_NOTA_FISCAL').asString = '')) then
  Begin
    //
  end
  else
  Begin
    Total:=Total+((Entidade.Quantidade-Entidade.Bonificacao)*Entidade.Preco);
    TotalCentro:=TotalCentro+((Entidade.Quantidade-Entidade.Bonificacao)*Entidade.Preco);
    if Entidade.PrecoDesc > 0 then
    Begin
      Descontos:=Descontos+((Entidade.Quantidade-Entidade.Bonificacao)*Entidade.PrecoDesc);
      DescontosCentro:=DescontosCentro+((Entidade.Quantidade-Entidade.Bonificacao)*Entidade.PrecoDesc);
    end
    else
    Begin
      Descontos:=Descontos+((Entidade.Quantidade-Entidade.Bonificacao)*Entidade.Preco);
      DescontosCentro:=DescontosCentro+((Entidade.Quantidade-Entidade.Bonificacao)*Entidade.Preco);      
    end;
  end;
end;

procedure Trpt_VendasDesconto.zrbRodapeGrupoFUNBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSubTotalVenda.Caption:=format('%.2f',[Total]);
  zrlSubTotalDesconto.Caption:=format('%.2f',[Total-Descontos]);
  zrlSubTotalLiquido.Caption:=format('%.2f',[Total-(Total-Descontos)]);
end;

procedure Trpt_VendasDesconto.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption := DM.Configuracao1.LojaNome;
  ZRLabel1.Caption := DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_VendasDesconto.zrbGrupoFUNBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=0;
  Descontos:=0;

  Funcionario1.Close;
  Funcionario1.ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
  Funcionario1.Open;
  zrlFuncionario.Caption:=Funcionario1.Apelido+' ('+IntToStr(Entidade.CodigoFUN)+')';

  if zrbDetalhe.Height = 0 then
  Begin
    zrlDescQtd.Enabled := False;
    zrlDescValor.Enabled := False;
    zrlDescDesconto.Enabled := False;
    zrlDescPrecoDesc.Enabled := False;
  end;
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    SZRLabel57.Enabled := False;
    SZRDBText5.Enabled := False;
  end;
end;

procedure Trpt_VendasDesconto.zrbGrupoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalCentro     := 0;
  DescontosCentro := 0;

  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
  CentroCusto1.Open;
  zrlCentro.Caption:=CentroCusto1.RazaoSocial;
end;

procedure Trpt_VendasDesconto.zrbRodapeGrupoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalVenda.Caption:=format('%.2f',[TotalCentro]);
  zrlTotalDesconto.Caption:=format('%.2f',[TotalCentro-DescontosCentro]);
  zrlTotalLiquido.Caption:=format('%.2f',[TotalCentro-(TotalCentro-DescontosCentro)]);
end;

procedure Trpt_VendasDesconto.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;
end;

procedure Trpt_VendasDesconto.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
