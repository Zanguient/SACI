unit UComprasXVendasLuciano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Item_Pedido_Venda, CentroCusto, Item_de_Estoque, Item_Pedido_Compra,
  Produto;

type
  Trpt_Compras_X_VendasLuciano = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrlDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    zrlDescricao: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlNomeDaEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    zrlUsuario: TSZRLabel;
    Produto1: TProduto;
    SZRLabel1: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlQtdVendas: TSZRLabel;
    zrlQtdCompras: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlQtdDevolucao: TSZRLabel;
    zlrFiltros: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlSaldo: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrbGrupo: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlPRDQtdVendas: TSZRLabel;
    zrlPRDQtdCompras: TSZRLabel;
    zrlPRDQtdDevolucao: TSZRLabel;
    zrlPRDSaldo: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlPrecos: TSZRLabel;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrbSumario: TSZRBand;
    zrlGeralQtdVendas: TSZRLabel;
    zrlGeralQtdCompras: TSZRLabel;
    zrlGeralQtdDevolucao: TSZRLabel;
    zrlGeralSaldo: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlEstoque: TSZRLabel;
    zrlDescQuantidade: TSZRLabel;
    zrlTotalEstoque: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlRef: TSZRLabel;
    zrlDetail: TSZRLabel;
    zrlCarac: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vGeralQTDVendas, vGeralQTDDevolucao, vGeralQTDCompras: integer;
    vGeralCompraPreco, vGeralVendaPreco: Double;
    vPRDQTDVendas, vPRDQTDDevolucao, vPRDQTDCompras: integer;
    vPRDEstoque, vPRDCompraPreco, vPRDVendaPreco: Double;
  public
    DataINI, DataFIM : TDateTime;
    Entidade : TProduto;
    aTRansferencia2 : string;
  end;

var
  rpt_Compras_X_VendasLuciano: Trpt_Compras_X_VendasLuciano;

implementation

uses UDM, Funcoes, UfMxSProdutoData;

{$R *.DFM}

procedure Trpt_Compras_X_VendasLuciano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := caFree;
end;

procedure Trpt_Compras_X_VendasLuciano.FormCreate(Sender: TObject);
begin
  Entidade := Produto1;
  zrlProduto.WordWrap := False;
  DataINI := 0;
  DataFIM := 0;

  vGeralQTDVendas    := 0;
  vGeralQTDDevolucao := 0;
  vGeralQTDCompras   := 0;
  vGeralCompraPreco  := 0;
  vGeralVendaPreco   := 0;
end;

procedure Trpt_Compras_X_VendasLuciano.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vQTDVendas, vQTDDevolucao, vQTDCompras: integer;
  vTotalCompraPreco, vTotalVendaPreco: Double;
begin
  with CentroCusto1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.FieldByName('CNC_LOJA').asInteger) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByName('CNC_LOJA').asInteger;
      Open;
    end;
    zrlCentroDeCusto.Caption := RazaoSocial+'('+IntToStr(CodigoCNC)+')';
  end;
  try
    zrlEstoque.Caption := format('%.2f',[Entidade.FieldByName('ESTOQUE').asFloat]);
    vPRDEstoque := vPRDEstoque + Entidade.FieldByName('ESTOQUE').asFloat;
  except
    zrlEstoque.Caption := '';
  end;

  with DM.QR_Consultas do
  begin
    //Totalizar as Vendas
    close;
    SQL.Text:=' SELECT SUM(I1.IPV_QUANTIDADE) AS QTD '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PEDIDO_DE_VENDA P1 '+
      ' WHERE I1.PRD_CODIGO= '+IntToStr(Produto1.CodigoPRD)+
      ' AND P1.PDV_SITUACAO=4 '+
      ' AND P1.CNC_CODIGO='+Entidade.FieldByName('CNC_LOJA').asString+
      ' AND P1.PDV_DATA_HORA>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DATA_HORA<"'+MesDia(DataFIM+1)+'" '+
      ' AND I1.PDV_CODIGO=P1.PDV_CODIGO ' +
      ' AND I1.CNC_CODIGO=P1.CNC_CODIGO ';
    open;
    vQTDVendas := FieldByName('QTD').asInteger;
    vTotalVendaPreco := Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);
    vPRDQTDVendas    := vPRDQTDVendas    + FieldByName('QTD').asInteger;
    vGeralQTDVendas  := vGeralQTDVendas  + FieldByName('QTD').asInteger;
    vPRDVendaPreco   := vPRDVendaPreco   + Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);
    vGeralVendaPreco := vGeralVendaPreco + Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);

    //Totalizar as Vendas
    close;
    SQL.Text:=' SELECT SUM(I1.ITO_QUANTIDADE) AS QTD '+
      ' FROM ITEM_DE_TROCA I1, TROCA P1 '+
      ' WHERE I1.PRD_CODIGO= '+IntToStr(Produto1.CodigoPRD)+
      ' AND P1.TRO_SITUACAO=1 '+
      ' AND P1.CNC_CODIGO='+Entidade.FieldByName('CNC_LOJA').asString+
      ' AND P1.TRO_DATA>="'+MesDia(DataINI)+'" '+
      ' AND P1.TRO_DATA<"'+MesDia(DataFIM+1)+'" '+
      ' AND P1.PDV_CODIGO IN '+
      ' (SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE PDV_DATA_HORA>="'+MesDia(DataINI)+'" '+
      ' AND PDV_DATA_HORA<"'+MesDia(DataFIM+1)+'") '+
      ' AND I1.TRO_CODIGO=P1.TRO_CODIGO ' +
      ' AND I1.CNC_CODIGO=P1.CNC_CODIGO ';
    open;
    vQTDVendas := vQTDVendas + FieldByName('QTD').asInteger;
    vTotalVendaPreco := vTotalVendaPreco + Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);
    vPRDQTDVendas    := vPRDQTDVendas    + FieldByName('QTD').asInteger;
    vGeralQTDVendas  := vGeralQTDVendas  + FieldByName('QTD').asInteger;
    vPRDVendaPreco   := vPRDVendaPreco   + Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);
    vGeralVendaPreco := vGeralVendaPreco + Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);

    //Totalizar as Devoluções Totais
    close;
    SQL.Text:=' SELECT SUM(I1.IPV_QUANTIDADE) AS QTD '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PEDIDO_DE_VENDA P1 '+
      ' WHERE I1.PRD_CODIGO= '+IntToStr(Produto1.CodigoPRD)+
      ' AND P1.PDV_SITUACAO=8 '+
      ' AND P1.CNC_CODIGO='+Entidade.FieldByName('CNC_LOJA').asString+
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(DataFIM+1)+'" '+
      ' AND I1.PDV_CODIGO=P1.PDV_CODIGO ' +
      ' AND I1.CNC_CODIGO=P1.CNC_CODIGO ';
    open;
    vQTDDevolucao := FieldByName('QTD').asinteger;
    vTotalVendaPreco := vTotalVendaPreco - Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);
    vPRDQTDDevolucao   := vPRDQTDDevolucao   + FieldByName('QTD').asinteger;
    vGeralQTDDevolucao := vGeralQTDDevolucao + FieldByName('QTD').asinteger;
    vPRDVendaPreco     := vPRDVendaPreco     - Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);
    vGeralVendaPreco   := vGeralVendaPreco   - Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);

    //Totalizar as Devoluções Parciais
    close;
    SQL.Text:=' SELECT SUM(I1.ITO_QUANTIDADE) AS QTD '+
      ' FROM ITEM_DE_TROCA I1, TROCA P1 '+
      ' WHERE I1.PRD_CODIGO= '+IntToStr(Produto1.CodigoPRD)+
      ' AND P1.TRO_SITUACAO=1 '+
      ' AND P1.CNC_CODIGO='+Entidade.FieldByName('CNC_LOJA').asString+
      ' AND P1.TRO_DATA>="'+MesDia(DataINI)+'" '+
      ' AND P1.TRO_DATA<"'+MesDia(DataFIM+1)+'" '+
      ' AND I1.TRO_CODIGO=P1.TRO_CODIGO ' +
      ' AND I1.CNC_CODIGO=P1.CNC_CODIGO ';
    open;
    vQTDDevolucao := vQTDDevolucao + FieldByName('QTD').asinteger;
    vTotalVendaPreco := vTotalVendaPreco - Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);
    vPRDQTDDevolucao   := vPRDQTDDevolucao   + FieldByName('QTD').asinteger;
    vGeralQTDDevolucao := vGeralQTDDevolucao + FieldByName('QTD').asinteger;
    vPRDVendaPreco     := vPRDVendaPreco     - Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);
    vGeralVendaPreco   := vGeralVendaPreco   - Arredonda(FieldByName('QTD').asInteger*Produto1.Precovenda);

    //Totalizar Compras
    close;
    {SQL.Text:=' SELECT SUM(I1.IPC_QUANTIDADE) AS QTD '+
      ' FROM ITEM_DE_PEDIDO_DE_COMPRA I1, PEDIDO_DE_COMPRA C1 '+
      ' WHERE I1.PRD_CODIGO= '+IntToStr(Produto1.CodigoPRD)+
      ' AND C1.PCP_SITUACAO=2 '+
      ' AND C1.CNC_ENTREGA='+Entidade.FieldByName('CNC_LOJA').asString+
      ' AND C1.PCP_DT_ENTREGA>="'+MesDia(DataINI)+'" '+
      ' AND C1.PCP_DT_ENTREGA<"'+MesDia(DataFIM+1)+'" '+
      ' AND I1.PCP_CODIGO=C1.PCP_CODIGO ' +
      ' AND I1.CNC_CODIGO=C1.CNC_CODIGO';}

      SQL.Text:=' SELECT SUM(I1.ITR_QUANTIDADE) AS QTD '+
      ' FROM ITEM_DE_TRANSFERENCIA I1, TRANSFERENCIA C1 '+
      ' WHERE I1.PRD_CODIGO= '+IntToStr(Produto1.CodigoPRD)+
      ' AND C1.TRF_SITUACAO=1 '+ aTransferencia2 +
      ' AND C1.TRF_CNC_DESTINO='+Entidade.FieldByName('CNC_LOJA').asString+
      ' AND C1.TRF_DATA>="'+MesDia(DataINI)+'" '+
      ' AND C1.TRF_DATA<"'+MesDia(DataFIM+1)+'" '+
      ' AND I1.TRF_CODIGO=C1.TRF_CODIGO ' +
      ' AND I1.CNC_CODIGO=C1.CNC_CODIGO';

    open;

    vQTDCompras := FieldByName('QTD').asInteger;
    vTotalCompraPreco := Arredonda(FieldByName('QTD').asInteger*Produto1.Custo);
    vPRDQTDCompras    := vPRDQTDCompras    + FieldByName('QTD').asInteger;
    vGeralQTDCompras  := vGeralQTDCompras  + FieldByName('QTD').asInteger;
    vPRDCompraPreco   := vPRDCompraPreco   + Arredonda(FieldByName('QTD').asInteger*Produto1.Custo);
    vGeralCompraPreco := vGeralCompraPreco + Arredonda(FieldByName('QTD').asInteger*Produto1.Custo);

    if (vQTDVendas = 0) and (vQTDDevolucao = 0) and (vQTDCompras = 0) and
       ((zrlEstoque.Caption = '') or (zrlEstoque.Caption = '0,00')) then
    Begin
      DoPrint := False;
      Exit;
    end
    else
      DoPrint := True;

    zrlQtdVendas.Caption    := IntToStr(vQTDVendas);
    zrlQtdDevolucao.Caption := IntToStr(vQTDDevolucao);
    zrlQtdCompras.Caption   := IntToStr(vQTDCompras);
    zrlSaldo.Caption        := IntToStr(vQTDCompras+vQTDDevolucao-vQTDVendas);
  end;

  zrlRef.Caption := Entidade.FieldByName('PRD_REFERENCIA').asString;
  zrlDetail.Caption := Entidade.FieldByName('PRD_DETALHE').asString;
  zrlCarac.Caption := Entidade.FieldByName('PRD_CARACTERISTICA').asString;
end;

procedure Trpt_Compras_X_VendasLuciano.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeDaEmpresa.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Compras_X_VendasLuciano.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Compras_X_VendasLuciano.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vPRDEstoque      := 0;
  vPRDQTDVendas    := 0;
  vPRDQTDDevolucao := 0;
  vPRDQTDCompras   := 0;
  vPRDCompraPreco  := 0;
  vPRDVendaPreco   := 0;
  
  if DM.Configuracao1.Empresa = 1 then
    zrlProduto.Caption:=Produto1.Descricao+' '+Produto1.Caracteristica+' '+Produto1.Referencia+' '+Produto1.Marca  
  else
    zrlProduto.Caption:=Produto1.Descricao+' '+Produto1.Referencia+' '+Produto1.Marca;

  zrlPrecos.Caption := format('%.2f',[Produto1.Custo])+'/'+format('%.2f',[Produto1.Precovenda]);
end;

procedure Trpt_Compras_X_VendasLuciano.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalEstoque.Caption    := format('%.2f',[vPRDEstoque]);
  zrlPRDQtdVendas.Caption    := IntToStr(vPRDQTDVendas);
  zrlPRDQtdDevolucao.Caption := IntToStr(vPRDQTDDevolucao);
  zrlPRDQtdCompras.Caption   := IntToStr(vPRDQTDCompras);
  zrlPRDSaldo.Caption        := IntToStr(vPRDQTDCompras+vPRDQTDDevolucao-vPRDQTDVendas);
end;

procedure Trpt_Compras_X_VendasLuciano.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlGeralQtdVendas.Caption    := IntToStr(vGeralQTDVendas);
  zrlGeralQtdDevolucao.Caption := IntToStr(vGeralQTDDevolucao);
  zrlGeralQtdCompras.Caption   := IntToStr(vGeralQTDCompras);
  zrlGeralSaldo.Caption        := IntToStr(vGeralQTDCompras+vGeralQTDDevolucao-vGeralQTDVendas);
end;

end.
