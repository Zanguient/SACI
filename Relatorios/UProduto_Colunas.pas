unit UProduto_Colunas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Item_de_Estoque,
  Produto, funcoes;

type
  Trpt_produto_Colunas = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRDBText2: TSZRDBText;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    LabelC1: TSZRLabel;
    LabelC2: TSZRLabel;
    LabelC3: TSZRLabel;
    LabelC4: TSZRLabel;
    LabelC5: TSZRLabel;
    LabelC6: TSZRLabel;
    C1: TSZRLabel;
    C2: TSZRLabel;
    C3: TSZRLabel;
    C4: TSZRLabel;
    C5: TSZRLabel;
    C6: TSZRLabel;
    Produto1: TProduto;
    Item_de_Estoque1: TItem_de_Estoque;
    SZRLabel1: TSZRLabel;
    C7: TSZRLabel;
    SZRLabel3: TSZRLabel;
    C8: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private

  public
    Entidade: TProduto;
  end;

var
  rpt_produto_Colunas: Trpt_produto_Colunas;

implementation
uses
 UDM, UOp_RelatProd;

{$R *.DFM}

procedure Trpt_produto_Colunas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_produto_Colunas.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_produto_Colunas.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_produto_Colunas.FormCreate(Sender: TObject);
begin
  Entidade := Produto1;
end;

procedure Trpt_produto_Colunas.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_produto_Colunas.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vTotal, vTotalProduto, vOutros: Double;
  sCamposSomados: string;
begin
  vTotalProduto:=0;
  vOutros:=0;
  if Op_RelatProd.rdbEstoqueFiscal.Checked then
    sCamposSomados := ' SUM(T2.IES_SFISCAL) AS Estoque '
  else if Op_RelatProd.rdbEstoqueLJ3.Checked then
    sCamposSomados := ' SUM(T2.IES_SSN) AS Estoque '
  else if Op_RelatProd.rdbEstoqueLJ4.Checked then
    sCamposSomados := ' SUM(T2.IES_SLJ4) AS Estoque '
  else if Op_RelatProd.rdbEstoqueFisico1.Checked then
    sCamposSomados := ' SUM(T2.IES_SFISICO) AS ESTOQUE '
  else if Op_RelatProd.rdbEstoqueComercial.Checked then
    sCamposSomados := ' SUM(T2.IES_SCOMERCIAL-t2.IES_SRESERVADO-'+
                      't2.IES_INDISPONIVEL) AS Estoque '
  else if Op_RelatProd.rdbEstoqueIndisponivel.Checked then
    sCamposSomados := ' SUM(T2.IES_INDISPONIVEL) AS ESTOQUE '
  else if Op_RelatProd.rdbEstoqueReserva.Checked then
    sCamposSomados := ' SUM(T2.IES_SRESERVADO) AS ESTOQUE '
  else if Op_RelatProd.rdbEstoqueBonificacao.Checked then
    sCamposSomados := ' SUM(T2.IES_SBONIFICACAO) AS ESTOQUE '
  else if Op_RelatProd.rdbEstoqueAmostra.Checked then
    sCamposSomados := ' SUM(T2.IES_SAMOSTRA) AS ESTOQUE '
  else if Op_RelatProd.rdbEstoqueBonificacaoF1.Checked then
    sCamposSomados := ' SUM(T2.IES_SBONIFICACAO_FISCAL) AS ESTOQUE '
  else if Op_RelatProd.rdbEstoqueAmostraF1.Checked then
    sCamposSomados := ' SUM(T2.IES_SAMOSTRA_FISCAL) AS ESTOQUE ';

  if LabelC1.Caption<>'' then
  begin
    with Item_de_Estoque1 do
    begin
      close;
      sql.Text:='SELECT '+sCamposSomados+
        ' FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
        ' WHERE T1.PRD_CODIGO=T2.PRD_CODIGO '+
        ' AND T1.PRD_DESCRICAO="'+Produto1.Descricao+'" '+
        ' AND T1.PRD_DETALHE ="'+LabelC1.Caption+'" '+
        Op_RelatProd.Centro;
      Open;
      if FieldByName('Estoque').AsString<>'' then
      begin
        C1.Caption:=FieldByName('Estoque').AsString;
        vTotalProduto:=vTotalProduto+FieldByName('Estoque').AsFloat;
      end
      else
        C1.Caption:='-';
    end;
  end;
  if LabelC2.Caption<>'' then
  begin
    with Item_de_Estoque1 do
    begin
      close;
      sql.Text:='SELECT '+sCamposSomados+
        ' FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
        ' WHERE T1.PRD_CODIGO=T2.PRD_CODIGO '+
        ' AND T1.PRD_DESCRICAO="'+Produto1.Descricao+'" '+
        ' AND T1.PRD_DETALHE ="'+LabelC2.Caption+'" '+
        Op_RelatProd.Centro;
      Open;
      if FieldByName('Estoque').AsString<>'' then
      begin
        C2.Caption:=Item_de_Estoque1.FieldByName('Estoque').AsString;
        vTotalProduto:=vTotalProduto+FieldByName('Estoque').AsFloat;
      end
      else
        C2.Caption:='-';
    end;
  end;
  if LabelC3.Caption<>'' then
  begin
    with Item_de_Estoque1 do
    begin
      close;
      sql.Text:='SELECT '+sCamposSomados+
        ' FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
        ' WHERE T1.PRD_CODIGO=T2.PRD_CODIGO '+
        ' AND T1.PRD_DESCRICAO="'+Produto1.Descricao+'" '+
        ' AND T1.PRD_DETALHE ="'+LabelC3.Caption+'" '+
        Op_RelatProd.Centro;
      Open;
      if FieldByName('Estoque').AsString<>'' then
      begin
        C3.Caption:=Item_de_Estoque1.FieldByName('Estoque').AsString;
        vTotalProduto:=vTotalProduto+FieldByName('Estoque').AsFloat;
      end
      else
        C3.Caption:='-';
    end;
  end;
  if LabelC4.Caption<>'' then
  begin
    with Item_de_Estoque1 do
    begin
      close;
      sql.Text:='SELECT '+sCamposSomados+
        ' FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
        ' WHERE T1.PRD_CODIGO=T2.PRD_CODIGO '+
        ' AND T1.PRD_DESCRICAO="'+Produto1.Descricao+'" '+
        ' AND T1.PRD_DETALHE ="'+LabelC4.Caption+'" '+
        Op_RelatProd.Centro;
      Open;
      if FieldByName('Estoque').AsString<>'' then
      begin
        C4.Caption:=Item_de_Estoque1.FieldByName('Estoque').AsString;
        vTotalProduto:=vTotalProduto+FieldByName('Estoque').AsFloat;
      end
      else
        C4.Caption:='-';
    end;
  end;
  if LabelC5.Caption<>'' then
  begin
    with Item_de_Estoque1 do
    begin
      close;
      sql.Text:='SELECT '+sCamposSomados+
        ' FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
        ' WHERE T1.PRD_CODIGO=T2.PRD_CODIGO '+
        ' AND T1.PRD_DESCRICAO="'+Produto1.Descricao+'" '+
        ' AND T1.PRD_DETALHE ="'+LabelC5.Caption+'" '+
        Op_RelatProd.Centro;
      Open;
      if FieldByName('Estoque').AsString<>'' then
      begin
        C5.Caption:=Item_de_Estoque1.FieldByName('Estoque').AsString;
        vTotalProduto:=vTotalProduto+FieldByName('Estoque').AsFloat;
      end
      else
        C5.Caption:='-';
    end;
  end;

  if LabelC6.Caption<>'' then
  begin
    with Item_de_Estoque1 do
    begin
      close;
      sql.Text:='SELECT '+sCamposSomados+
        ' FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
        ' WHERE T1.PRD_CODIGO=T2.PRD_CODIGO '+
        ' AND T1.PRD_DESCRICAO="'+Produto1.Descricao+'" '+
        ' AND T1.PRD_DETALHE ="'+LabelC6.Caption+'" '+
        Op_RelatProd.Centro;
      Open;
      if FieldByName('Estoque').AsString<>'' then
      begin
        C6.Caption:=Item_de_Estoque1.FieldByName('Estoque').AsString;
        vTotalProduto:=vTotalProduto+FieldByName('Estoque').AsFloat;
      end
      else
        C6.Caption:='-';
    end;
  end;

  //Calcular Total do Produto independente do detalhe
  with Item_de_Estoque1 do
  begin
    close;
    sql.Text:='SELECT '+sCamposSomados+
      ' FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
      ' WHERE T1.PRD_CODIGO=T2.PRD_CODIGO '+
      ' AND T1.PRD_DESCRICAO="'+Produto1.Descricao+'" '+
      Op_RelatProd.Centro;
    Open;
    if (FieldByName('Estoque').AsString <> '') then
      vTotal:=Item_de_Estoque1.FieldByName('Estoque').AsFloat
    else
      vTotal:=0;
  end;

  if vTotal<>vTotalProduto then
  begin
    vOutros:=vTotal-vTotalProduto;
  end;
  C7.Caption:=FloatToStr(vOutros);
  C8.Caption:=FloatToStr(vTotal);
  DoPrint:=True;
  case Op_RelatProd.rdgEstoque.ItemIndex of
    0: if vTotal >= StrToFloat(Op_RelatProd.edtValorX.text) then
         DoPrint:=False;
    1: if vTotal <> StrToFloat(Op_RelatProd.edtValorX.text) then
         DoPrint:=False;
    2: if vTotal <= StrToFloat(Op_RelatProd.edtValorX.text) then
         DoPrint:=False;
    3: if vTotal >  StrToFloat(Op_RelatProd.edtValorX.text) then
         DoPrint:=False;
    4: if vTotal <  StrToFloat(Op_RelatProd.edtValorX.text) then
         DoPrint:=False;
    5: if vTotal =  StrToFloat(Op_RelatProd.edtValorX.text) then
         DoPrint:=False;
  end;
end;

end.
