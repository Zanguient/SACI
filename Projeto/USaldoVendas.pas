unit USaldoVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls,
  Produto, CentroCusto, funcoes;

type
  Trpt_SaldoVendas = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrb_detalhe: TSZRBand;
    zrlLiquido: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlFaturadoSN: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRBand1: TSZRBand;
    zrlTotalLiquido: TSZRLabel;
    zrlTotalOutros: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlDevolvidoSN: TSZRLabel;
    zrlTotalDevolvidoSN: TSZRLabel;
    Produto1: TProduto;
    zrlProduto: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlDinheiro: TSZRLabel;
    zrlTotalDinheiro: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrb_detalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    GeralSN, GeralDevolvidoSN, GeralDinheiro : Double;
    TotalRegistros : integer;
  public
    DataINI, DataFIM : TDateTime;
  end;

var
  rpt_SaldoVendas: Trpt_SaldoVendas;

implementation

Uses
  UDM, MxSVendasCliente;

{$R *.DFM}

procedure Trpt_SaldoVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure Trpt_SaldoVendas.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  TotalDinheiro, TotalSN, TotalDevolvidoSN: Double;
begin
  with DM.QR_Consultas do
  Begin
    //Calcular Faturado (SN)
    Close;
    SQL.Text := 'SELECT SUM(I1.IPV_QUANTIDADE) AS TOTAL, '+
      ' SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) AS TOTAL_DINHEIRO '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_SITUACAO=4 OR P1.PDV_SITUACAO=8) '+
      ' AND I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    TotalSN := FieldByName('TOTAL').asFloat;
    TotalDinheiro := FieldByName('TOTAL_DINHEIRO').asFloat;

    //Calcular Faturado (Itens Trocados - Devolvidos Parciais SN)
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE) AS TOTAL, '+
      ' SUM(I1.ITO_QUANTIDADE*I1.ITO_VALOR) AS TOTAL_DINHEIRO '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_TROCA I1 '+
      ' WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(DataFIM+1)+'" '+
      ' AND ((P1.PDV_SITUACAO=4) OR (P1.PDV_SITUACAO=8)) '+
      ' AND I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+
      ' AND I1.ITO_SITUACAO=1 '+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    TotalSN := TotalSN + FieldByName('TOTAL').asFloat;
    TotalDinheiro := TotalDinheiro + FieldByName('TOTAL_DINHEIRO').asFloat;

    //Calcular Devolvido (Troca SN)
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE) AS TOTAL, '+
      ' SUM(I1.ITO_QUANTIDADE*I1.ITO_VALOR) AS TOTAL_DINHEIRO '+
      ' FROM TROCA T1, ITEM_DE_TROCA I1, PEDIDO_DE_VENDA P1 '+
      ' WHERE T1.TRO_DATA>="'+MesDia(DataINI)+'" '+
      ' AND T1.TRO_DATA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      ' AND I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+
      ' AND I1.ITO_SITUACAO=1 '+
      ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
      ' AND T1.TRO_CODIGO=I1.TRO_CODIGO ';
    Open;
    TotalDevolvidoSN := FieldByName('TOTAL').asFloat;
    TotalDinheiro := TotalDinheiro - FieldByName('TOTAL_DINHEIRO').asFloat;

    //Calcular Devolvidos Total (SN)
    Close;
    SQL.Text := 'SELECT SUM(I1.IPV_QUANTIDADE) AS TOTAL, '+
      ' SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) AS TOTAL_DINHEIRO '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_DT_DEVOLUCAO>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_SITUACAO=8) '+
      ' AND I1.PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    TotalDevolvidoSN := TotalDevolvidoSN + FieldByName('TOTAL').asFloat;
    TotalDinheiro := TotalDinheiro - FieldByName('TOTAL_DINHEIRO').asFloat;
  end;

  if (TotalSN = 0) and (TotalDevolvidoSN = 0) then
  Begin
    DoPrint := False;
    Exit;
  end
  else
  Begin
    DoPrint := True;
    inc(TotalRegistros);
  end;

  if Produto1.Situacao <> 1 then
    zrlProduto.Caption := Trim(Produto1.Descricao)+' '+Trim(Produto1.Referencia)+' '+Produto1.Marca
  else
    zrlProduto.Caption := '*'+Trim(Produto1.Descricao)+' '+Trim(Produto1.Referencia)+' '+Produto1.Marca;

  //Definir Liquido
  zrlDinheiro.Caption  := format('%.2f',[TotalDinheiro]);
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    zrlFaturadoSN.Caption  := format('%.2f',[TotalSN]);
    zrlDevolvidoSN.Caption := format('%.2f',[TotalDevolvidoSN]);
    zrlLiquido.Caption     := format('%.2f',[TotalSN-TotalDevolvidoSN]);
  end
  else
  Begin
    zrlFaturadoSN.Caption  := IntToStr(Trunc(TotalSN));
    zrlDevolvidoSN.Caption := IntToStr(Trunc(TotalDevolvidoSN));
    zrlLiquido.Caption     := IntToStr(Trunc(TotalSN-TotalDevolvidoSN));
  end;

  GeralSN          := GeralSN          + TotalSN;
  GeralDevolvidoSN := GeralDevolvidoSN + TotalDevolvidoSN;
  GeralDinheiro    := GeralDinheiro    + TotalDinheiro;

end;

procedure Trpt_SaldoVendas.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_SaldoVendas.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_SaldoVendas.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalDinheiro.Caption := 'R$ ' + format('%.2f',[GeralDinheiro]);                                   
  zrlTotalOutros.Caption := format('%.2f',[GeralSN]);
  zrlTotalDevolvidoSN.Caption := format('%.2f',[GeralDevolvidoSN]);
  zrlTotalLiquido.Caption := format('%.2f',[GeralSN-GeralDevolvidoSN]);
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_SaldoVendas.FormCreate(Sender: TObject);
begin
  TotalRegistros := 0;
  GeralDinheiro := 0;
  GeralSN := 0;
  GeralDevolvidoSN := 0;
end;

procedure Trpt_SaldoVendas.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel16.Caption := EmpresaDesenvolvedora;
end;

end.
