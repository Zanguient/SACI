unit UComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Item_Pedido_Venda, Funcionario,
  Produto, Item_de_Troca, CentroCusto;

type
  Trpt_Comissao = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrb_detalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRBand5: TSZRBand;
    ZRLabel7: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    ZRDBText4: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRDBText10: TSZRDBText;
    ZRLabel20: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel24: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRLabel21: TSZRLabel;
    ZRExpression5: TSZRExpression;
    ZRLabel23: TSZRLabel;
    ZRLabel18: TSZRLabel;
    Funcionario1: TFuncionario;
    ZRLabel25: TSZRLabel;
    ZRLabel26: TSZRLabel;
    Produto1: TProduto;
    zrlFiltros: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlVendedor: TSZRLabel;
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
    Item_Pedido_Venda1PDV_DATA_HORA: TDateTimeField;
    Item_Pedido_Venda1PDV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField;
    ZRLabel14: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel5: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    Item_Pedido_Venda1FUN_COTA: TFloatField;
    Item_Pedido_Venda1FUN_PERC_ABAIXO: TFloatField;
    Item_Pedido_Venda1FUN_PERC_ACIMA: TFloatField;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    Item_de_Troca1: TItem_de_Troca;
    Item_de_Troca1SOMA: TFloatField;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    Item_de_Troca2: TItem_de_Troca;
    FloatField1: TFloatField;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRBand1: TSZRBand;
    SZRGroup1: TSZRGroup;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel172: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlDetalhe: TSZRLabel;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrb_detalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TItem_Pedido_Venda;
    Total, TotalGeral, TotalCentro, SaldoGeral, SaldoCentro:Double;
  end;

var
  rpt_Comissao: Trpt_Comissao;

implementation
Uses
  UDM, Funcoes, URelDataVend;
{$R *.DFM}

procedure Trpt_Comissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_Comissao.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel1.Caption :=  Format('%.2f',[TotalGeral]);
  SZRLabel19.Caption :=  Format('%.2f',[SaldoGeral]);
end;


procedure Trpt_Comissao.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  If (Entidade.fieldbyname('IPV_PRECO_DESC').AsFloat>0) THEN
    Total:=Total+(Entidade.fieldbyname('IPV_PRECO_DESC').AsFloat*(Entidade.fieldbyname('IPV_QUANTIDADE').AsFloat-Entidade.fieldbyname('IPV_BONIFICACAO').AsFloat))
  Else
    Total:=Total+(Entidade.fieldbyname('IPV_PRECO').AsFloat*(Entidade.fieldbyname('IPV_QUANTIDADE').AsFloat-Entidade.fieldbyname('IPV_BONIFICACAO').AsFloat));


  if zrb_detalhe.Height = 0 then
    Exit;

  with Produto1 do
  Begin
    if CodigoPRD <> Entidade.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    zrlProduto.Caption    := Descricao;
    zrlReferencia.Caption := Referencia;
    zrlDetalhe.Caption    := Detalhe;
  end;
end;

procedure Trpt_Comissao.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  Devolvido,DevParc:Double;
begin
  with Item_de_Troca2 do
  Begin
    Close;
    SQL.Text:='SELECT SUM(ROUND(T2.ITO_VALOR,2)*T2.ITO_QUANTIDADE) as SOMA '+
      ' FROM TROCA T1, ITEM_DE_TROCA T2 '+
      ' WHERE T1.TRO_CODIGO=T2.TRO_CODIGO '+
      ' AND T1.TRO_SITUACAO=1 '+
      ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
      ' AND (T2.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+') '+
      rpt_DataVend.DataINITroca+rpt_DataVend.DataFIMTroca+
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND T1.PDV_CODIGO IN '+
      ' (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA T3 '+
      ' WHERE T3.CNC_CODIGO=T1.CNC_CODIGO '+
      ' AND T3.PDV_CODIGO=T1.PDV_CODIGO '+
      rpt_DataVend.DataINITroca2+rpt_DataVend.DataFIMTroca2+')';
    Open;
    DevParc := FieldByName('SOMA').asFloat;
  end;

  SZRLabel15.Caption:=Format('%.2f',[DevParc]);
  ZRLabel26.Caption:=Format('%.2f',[Total]);

  with Item_Pedido_Venda2 do
  Begin
    Close;
    SQL.Text:=' SELECT ROUND(T2.IPV_PRECO,2) AS IPV_PRECO,'+
      ' ROUND(T2.IPV_PRECO_DESC,2) AS IPV_PRECO_DESC,'+
      ' T2.IPV_QUANTIDADE '+
      ' FROM PEDIDO_DE_VENDA t1, ITEM_DE_PEDIDO_DE_VENDA T2 '+
      ' WHERE (T1.CNC_CODIGO=T2.CNC_CODIGO) '+
      ' AND (T1.PDV_CODIGO=T2.PDV_CODIGO) '+
      ' AND (T1.PDV_SITUACAO=8)  '+
      ' AND (T2.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+')'+
      rpt_DataVend.DataINIDevolvido+rpt_DataVend.DataFIMDevolvido+
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC);
    Open;
    Devolvido:=0;
    if not IsEmpty then
    Begin
      while not EOF do
      Begin
        if PrecoDesc > 0 then
          Devolvido:=Devolvido+(PrecoDesc*(Quantidade-Bonificacao))
        else
          Devolvido:=Devolvido+(Preco*(Quantidade-Bonificacao));
        Next;
      end;
    end;
  end;

  with Item_de_Troca1 do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T2.ITO_VALOR,2)*T2.ITO_QUANTIDADE) as SOMA '+
      ' FROM TROCA T1, ITEM_DE_TROCA T2 '+
      ' WHERE T1.TRO_CODIGO=T2.TRO_CODIGO '+
      ' AND T1.TRO_SITUACAO=1 '+
      ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
      ' AND (T2.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+')'+
      rpt_DataVend.DataINITroca+rpt_DataVend.DataFIMTroca+
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC);
    Open;
    Devolvido := Devolvido + FieldByName('SOMA').asFloat;
  end;

  SZRLabel12.Caption:=Format('%.2f',[Devolvido]);
  SZRLabel17.Caption:=Format('%.2f',[Total+DevParc-Devolvido]);
  SaldoGeral := SaldoGeral+(Total+DevParc-Devolvido);
  SaldoCentro := SaldoCentro+(Total+DevParc-Devolvido);
  if not VerificaFloatBranco(Entidade.FieldByName('FUN_COTA').asString) then
  Begin
    if (not VerificaFloatBranco(Entidade.FieldByName('FUN_PERC_ABAIXO').asString)) OR
       (Entidade.FieldByName('FUN_PERC_ABAIXO').asString = '0') then
      SZRLabel13.Caption:='Sem Comissao1'
    else
      SZRLabel13.Caption:=Format('%.2f',[(Total+DevParc-Devolvido)*Entidade.FieldByName('FUN_PERC_ABAIXO').asFloat/100]);
  end
  else if (Total+DevParc-Devolvido) >= Entidade.FieldByName('FUN_COTA').asFloat then
  Begin
    if (not VerificaFloatBranco(Entidade.FieldByName('FUN_PERC_ACIMA').asString)) OR
       (Entidade.FieldByName('FUN_PERC_ACIMA').asString = '0') then
      SZRLabel13.Caption:='Sem Comissao2'
    else
      SZRLabel13.Caption:=Format('%.2f',[(Total+DevParc-Devolvido)*Entidade.FieldByName('FUN_PERC_ACIMA').asFloat/100]);
  end
  else
    if (not VerificaFloatBranco(Entidade.FieldByName('FUN_PERC_ABAIXO').asString)) OR
       (Entidade.FieldByName('FUN_PERC_ABAIXO').asString = '0') then
      SZRLabel13.Caption:='Sem Comissao1'
    else
      SZRLabel13.Caption:=Format('%.2f',[(Total+DevParc-Devolvido)*Entidade.FieldByName('FUN_PERC_ABAIXO').asFloat/100]);
  TotalGeral:=TotalGeral+Total;
  TotalCentro:=TotalCentro+Total;
  Total:=0;
end;

procedure Trpt_Comissao.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Comissao.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Comissao.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=0;
  with Funcionario1 do
  Begin
    if (CodigoCNC <> Entidade.CodigoCNC) or
       (CodigoFUN <> Entidade.CodigoFUN) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
      Open;
    end;
    zrlVendedor.Caption := NomeFun;
  end;

  if (Entidade.CodigoCNC <> CentroCusto1.CodigoCNC) or (CentroCusto1.RazaoSocial<>'') then
  Begin
    CentroCusto1.Close;
    CentroCusto1.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    CentroCusto1.Open;
  end;
  SZRLabel172.Caption:=CentroCusto1.RazaoSocial;
end;

procedure Trpt_Comissao.Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
begin
  with Funcionario1 do
  Begin
    if (CodigoCNC <> Entidade.CodigoCNC) or
       (CodigoFUN <> Entidade.CodigoFUN) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
      Open;
    end;
    Entidade.FieldByName('FUN_COTA').AsFloat := FieldByName('FUN_COTA').asFloat;
    Entidade.FieldByName('FUN_PERC_ABAIXO').AsFloat := FieldByName('FUN_PERC_ABAIXO').asFloat;
    Entidade.FieldByName('FUN_PERC_ACIMA').AsFloat := FieldByName('FUN_PERC_ACIMA').asFloat;
  end;
end;

procedure Trpt_Comissao.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel21.Caption :=  Format('%.2f',[TotalCentro]);
  SZRLabel23.Caption :=  Format('%.2f',[SaldoCentro]);
  TotalCentro := 0;
  SaldoCentro := 0;
end;

procedure Trpt_Comissao.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;
  TotalGeral:=0;
  SaldoGeral:=0;
  TotalCentro := 0;
  SaldoCentro := 0;
end;

procedure Trpt_Comissao.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;  
end;

end.
