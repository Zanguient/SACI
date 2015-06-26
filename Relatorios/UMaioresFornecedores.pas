unit UMaioresFornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Classificacao_fiscal,
  Origem_Fiscal, Fornecedor, Produto, Item_Pedido_Compra, CentroCusto;

type
  Trpt_MaioresFornecedores = class(TForm)
    Item_Pedido_Compra1: TItem_Pedido_Compra;
    CentroCusto1: TCentroCusto;
    Fornecedor1: TFornecedor;
    Produto1: TProduto;
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    slrPreco: TSZRLabel;
    srlQuantidade: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlDataINI: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrbDetalhe: TSZRBand;
    ZRDBText1: TSZRDBText;
    zrlProduto: TSZRLabel;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    zrgCodigoFOR: TSZRGroup;
    ZRDBText8: TSZRDBText;
    zrlFornecedor: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel21: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel8: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlTotalProduto: TSZRLabel;
    zrlPrecoCompra: TSZRLabel;
    SZRLabel4: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgCodigoFORBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    TotalProduto, TotalGeral: Double;
  public
    Entidade: TItem_Pedido_Compra;
  end;

var
  rpt_MaioresFornecedores: Trpt_MaioresFornecedores;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_MaioresFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Fornecedor1.Close;
  CentroCusto1.Close;
  Action:=cafree;
end;

procedure Trpt_MaioresFornecedores.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_MaioresFornecedores.zrgCodigoFORBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalProduto := 0;
  with Fornecedor1 do
  Begin
    Close;
    ParamByName('FOR_CODIGO').asInteger := Entidade.FieldByName('FOR_CODIGO').asInteger;
    Open;
    zrlFornecedor.Caption:=RazaoSocial+'('+IntToStr(CodigoFOR)+')';
  end;
end;

procedure Trpt_MaioresFornecedores.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlQuantidade.Caption  := format('%.2f',[Entidade.Quantidade]);
  zrlPrecoCompra.Caption := format('%.4f',[Arredonda(CalculaDesconto(Entidade.Preco,Entidade.Descontos),4)]);
  zrlTotalItem.Caption   := format('%.2f',[Entidade.Quantidade*Arredonda(CalculaDesconto(Entidade.Preco,Entidade.Descontos),4)]);

  TotalGeral   := TotalGeral +   Entidade.Quantidade*(Arredonda(CalculaDesconto(Entidade.Preco,Entidade.Descontos),4));
  TotalProduto := TotalProduto + Entidade.Quantidade*(Arredonda(CalculaDesconto(Entidade.Preco,Entidade.Descontos),4));

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
    zrlProduto.Caption := Trim(Descricao)+' '+Trim(Referencia)+' '+Trim(Marca)+
      ' '+Trim(Unidade);
  end;
end;

procedure Trpt_MaioresFornecedores.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGeral.Caption := format('%.2f',[TotalGeral]);
end;

procedure Trpt_MaioresFornecedores.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Compra1;
  TotalGeral := 0;
end;

procedure Trpt_MaioresFornecedores.zrbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_MaioresFornecedores.zrbRodapeGrupoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlTotalProduto.Caption := format('%.2f',[TotalProduto]);
end;

end.
