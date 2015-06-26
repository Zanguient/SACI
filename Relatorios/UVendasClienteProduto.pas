unit UVendasClienteProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Variants, Titulo_receber,
  AgenteFin, Forma_de_Pagamento, Funcionario, Parametro, Cliente, Produto,
  Item_Pedido_Venda, Fornecedor, Grupo, SubGrupo;

type
  Trpt_VendasClienteProduto = class(TForm)
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
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Produto1: TProduto;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel156: TSZRLabel;
    zrgProduto: TSZRGroup;
    zrbRodapeGrupoProduto: TSZRBand;
    SZRLabel2: TSZRLabel;
    ZRDBText6: TSZRDBText;
    SZRLabel1: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    SZRLabel9: TSZRLabel;
    Fornecedor1: TFornecedor;
    zrbSumario: TSZRBand;
    ZRLabel21: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    SZRLabel175: TSZRLabel;
    Funcionario1: TFuncionario;
    Grupo1: TGrupo;
    zrgGrupoOpcional: TSZRGroup;
    zrlTituloGrupo: TSZRLabel;
    zrlValorGrupo: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrbRodapeGrupoOpcional: TSZRBand;
    SZRLabel8: TSZRLabel;
    zrlSubTotal: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SubGrupo1: TSubGrupo;
    SZRLabel19: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlSubTotalQTD: TSZRLabel;
    zrlTotalGeralQTD: TSZRLabel;
    zrlDescTotalLinha: TSZRLabel;
    zrlTotalLinha: TSZRLabel;
    zrlDescTotalForaLinha: TSZRLabel;
    zrlTotalForaLinha: TSZRLabel;
    zrlDesTotalCatalogo: TSZRLabel;
    zrlTotalCatalogo: TSZRLabel;
    zrlDescTotalIgual: TSZRLabel;
    zrlTotalIgual: TSZRLabel;
    qrySomenteLinha: TQuery;
    qrySomenteForaLinha: TQuery;
    qrySomenteCatalogo: TQuery;
    SZRLabel14: TSZRLabel;
    zrlPercentual: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlPercentualSubTotal: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlPercentualTotal: TSZRLabel;
    SZRLabel15: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrb_detalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrgProdutoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoProdutoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrgGrupoOpcionalBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoOpcionalBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros: integer;
    SubTotalGeral, SubTotalGeralQTD, TotalGeral, TotalGeralQTD, TotalQtd, TotalValor: Double;
  public
    vTotal: Double;
  end;

var
  rpt_VendasClienteProduto: Trpt_VendasClienteProduto;

implementation
Uses
  UDM, MxSVendasCliente, Funcoes;
{$R *.DFM}

procedure Trpt_VendasClienteProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Active := False;
  Item_Pedido_Venda1.Active := False;
  Action := cafree;
end;

procedure Trpt_VendasClienteProduto.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_VendasClienteProduto.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if fMxSVendasCliente.ckbPorFornecedor.Checked then
    ZRLabel2.Caption := 'SIAC - Relatorio de Vendas (Fornecedor)';
end;

procedure Trpt_VendasClienteProduto.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalQtd := TotalQtd + Item_Pedido_Venda1.Quantidade;
  //Na Verdade esse preço é o de Desconto.
  TotalValor := TotalValor + Item_Pedido_Venda1.Preco;
  TotalGeral    := TotalGeral    + Item_Pedido_Venda1.Preco;
  TotalGeralQTD := TotalGeralQTD + Item_Pedido_Venda1.Quantidade;
  SubTotalGeral    := SubTotalGeral    + Item_Pedido_Venda1.Preco;
  SubTotalGeralQTD := SubTotalGeralQTD + Item_Pedido_Venda1.Quantidade;
end;

procedure Trpt_VendasClienteProduto.zrgProdutoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalQtd := 0;
  TotalValor := 0;
end;

procedure Trpt_VendasClienteProduto.zrbRodapeGrupoProdutoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  inc(TotalRegistros);
  if not fMxSVendasCliente.ckbPorFornecedor.Checked then
  Begin
    if fMxSVendasCliente.ckbExibirSubGrupo.Checked then
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('SGP_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
      SubGrupo1.Open;
      zrlProduto.Caption:=SubGrupo1.Descricao;
    end
    else
    Begin
      with Produto1 do
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
        Open;
        if DM.Configuracao1.empresa = empEletro then
          zrlProduto.Caption:=Descricao+' '+Caracteristica+' '+
            ', '+Marca+' '+Unidade
        else if DM.Configuracao1.empresa = empLuciano then
          zrlProduto.Caption:= 'L'+IntToStr(Item_Pedido_Venda1.CodigoLOT)+' '+Descricao+' '+
            ', '+Marca+' '+Unidade
        else
          zrlProduto.Caption:=Descricao+' '+
            ', '+Marca+' '+Unidade;
        zrlReferencia.Caption := Referencia;
      end;
    end;
  end
  else // O código do Fornecedor é passado como Código do Produto
  Begin
    Fornecedor1.Close;
    Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
    Fornecedor1.Open;
    if Fornecedor1.IsEmpty then
      zrlProduto.Caption:='SEM FORNECEDOR (Servico)'
    else
      zrlProduto.Caption:=Fornecedor1.RazaoSocial;
  end;
  zrlQuantidade.Caption := format('%.2f',[TotalQtd]);
  zrlTotalItem.Caption := format('%.2f',[TotalValor]);
  if vTotal > 0 then
    zrlPercentual.Caption := Format('%.3f',[StrToFloat(zrlQuantidade.Caption)/vTotal*100]);
end;

procedure Trpt_VendasClienteProduto.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa <> empHOPE then
  Begin
    zrlDescTotalLinha.Enabled     := False;
    zrlTotalLinha.Enabled         := False;
    zrlDescTotalForaLinha.Enabled := False;
    zrlTotalForaLinha.Enabled     := False;
    zrlDesTotalCatalogo.Enabled   := False;
    zrlTotalCatalogo.Enabled      := False;
    zrlDescTotalIgual.Enabled     := False;
    zrlTotalIgual.Enabled         := False;
  end
  else //Somente HOPE
  Begin
    qrySomenteLinha.Open;
    zrlTotalLinha.Caption := Format('%.2f',[qrySomenteLinha.FieldByName('QTD').asFloat]);

    qrySomenteForaLinha.Open;
    zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD').asFloat]);

    qrySomenteCatalogo.Open;
    zrlTotalCatalogo.Caption := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD').asFloat]);

    zrlTotalIgual.Caption := Format('%.2f',[StrToFloat(zrlTotalLinha.Caption)+StrToFloat(zrlTotalForaLinha.Caption)]);
  end;

  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
  zrlTotalGeral.Caption := format('%.2f',[TotalGeral]);
  zrlTotalGeralQTD.Caption := format('%.2f',[TotalGeralQTD]);

  if vTotal > 0 then
    zrlPercentualTotal.Caption := Format('%.2f',[StrToFloat(zrlTotalGeralQTD.Caption)/vTotal*100]);  
end;

procedure Trpt_VendasClienteProduto.FormCreate(Sender: TObject);
begin
  vTotal         := 0; //Para cálculo do Percentual
  TotalGeral     := 0;
  TotalGeralQTD  := 0;
  TotalRegistros := 0;
end;

procedure Trpt_VendasClienteProduto.zrgGrupoOpcionalBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  SubTotalGeral := 0;
  SubTotalGeralQTD := 0;
  if zrlTituloGrupo.Caption = 'Grupo:' then
    with Grupo1 do
    Begin
      Close;
      ParamByName('GRP_CODIGO').asInteger := Item_Pedido_Venda1.FieldByName('GRP_CODIGO').asInteger;
      Open;
      zrlValorGrupo.Caption := Descricao;
    end
  else if zrlTituloGrupo.Caption = 'Vendedor(a):' then
    with Funcionario1 do
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Item_Pedido_Venda1.FieldByName('FUN_CODIGO').asInteger;
      Open;
      zrlValorGrupo.Caption := Apelido;
    end
  else if zrlTituloGrupo.Caption = 'Fornecedor:' then
    with Fornecedor1 do
    Begin
      Close;
      ParamByName('FOR_CODIGO').asInteger := Item_Pedido_Venda1.FieldByName('FOR_CODIGO').asInteger;
      Open;
      zrlValorGrupo.Caption := RazaoSocial;
    end;
end;

procedure Trpt_VendasClienteProduto.zrbRodapeGrupoOpcionalBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlSubTotal.Caption    := format('%.2f',[SubTotalGeral]);
  zrlSubTotalQTD.Caption := format('%.2f',[SubTotalGeralQTD]);
  if vTotal > 0 then
    zrlPercentualSubTotal.Caption := Format('%.2f',[StrToFloat(zrlSubTotalQTD.Caption)/vTotal*100]);
end;

procedure Trpt_VendasClienteProduto.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
