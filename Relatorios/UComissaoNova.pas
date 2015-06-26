unit UComissaoNova;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, SQuery, Funcionario,
  QRExport, Item_de_Cota;

type
  Trpt_ComissaoNova = class(TForm)
    report: TQuickRep;
    QRBand1: TQRBand;
    qrlDescricaoRelatorio: TQRLabel;
    qrlNomeLoja: TQRLabel;
    qrlNomeCentroDeCusto: TQRLabel;
    qrsDataHoraImpressao: TQRSysData;
    Funcionario1: TFuncionario;
    QRBand2: TQRBand;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    qrsLinhaHorizontalRodape: TQRShape;
    qrsNumeroPagina: TQRSysData;
    qrsLinhaHorizontalCabecalho1: TQRShape;
    qrlPeriodoDesc: TQRLabel;
    qrlDescricaoPeriodo: TQRLabel;
    QRBand3: TQRBand;
    DSFuncionario1: TDataSource;
    QRDBText1: TQRDBText;
    qrsLinhaHorizontalCabecalho2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlOutros: TQRLabel;
    qrlFaturamento: TQRLabel;
    qrlDevolucoes: TQRLabel;
    qrlLiquido: TQRLabel;
    qrlComissao: TQRLabel;
    qrlPremio: TQRLabel;
    qrlSubTotal: TQRLabel;
    qrlPercentual1: TQRLabel;
    qrlBonus: TQRLabel;
    qrlTotal: TQRLabel;
    qrlPercentual2: TQRLabel;
    QRBand4: TQRBand;
    QRShape4: TQRShape;
    QRLabel15: TQRLabel;
    qrlTotalRegistros: TQRLabel;
    Item_de_Cota1: TItem_de_Cota;
    qrlGeralOutros: TQRLabel;
    qrlGeralFaturamento: TQRLabel;
    qrlGeralDevolucoes: TQRLabel;
    qrlGeralLiquido: TQRLabel;
    qrlGeralComissao: TQRLabel;
    qrlGeralPremio: TQRLabel;
    qrlGeralSubTotal: TQRLabel;
    qrlGeralPercentual1: TQRLabel;
    qrlGeralBonus: TQRLabel;
    qrlGeralTotal: TQRLabel;
    qrlGeralPercentual2: TQRLabel;
    qrlApelido: TQRLabel;
    zrlFiltro: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    TotalRegistros : integer;
    GeralOutros, GeralFaturado, GeralDevolvido, GeralComissao, GeralPremio, GeralBonus: Double;
  public
    DataINI, DataFIM: TDateTime;
    Entidade : TFuncionario;
  end;

var
  rpt_ComissaoNova: Trpt_ComissaoNova;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_ComissaoNova.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNomeLoja.Caption:=DM.Configuracao1.LojaNome;
  qrlNomeCentroDeCusto.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ComissaoNova.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_ComissaoNova.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  TotalOutros, TotalFaturado, TotalDevolvido, vLiquido, vComissao, vPremio,
    vSubTotal, vBonus, vTotalComissao: Double;
  sFuncionario, sFuncionarioNota : string;
begin
  TotalOutros    := 0;
  TotalFaturado  := 0;
  TotalDevolvido := 0;
  sFuncionario     := ' AND I1.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+' ';
  sFuncionarioNota := ' AND N1.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+' ';
  qrlComissao.Caption := '-';
  qrlPremio.Caption  := '-';

  if Entidade.Funcao = 56 then //Gerente
    qrlApelido.Caption := 'G-'+Entidade.Apelido
  else
    qrlApelido.Caption := Entidade.Apelido;

  with DM.QR_Consultas do
  Begin
    //Calcular Faturado (LJ3/LJ4)
    Close;
    SQL.Text := 'SELECT SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_SITUACAO=4 OR P1.PDV_SITUACAO=8) '+
      sFuncionario+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2)'+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    TotalOutros := TotalOutros + FieldByName('TOTAL').asFloat;

    //Calcular Faturado (Itens Trocados - Devolvidos Parciais SN)
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE*I1.ITO_VALOR) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_TROCA I1 '+
      ' WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(DataFIM+1)+'" '+
      ' AND ((P1.PDV_SITUACAO=4) OR (P1.PDV_SITUACAO=8)) '+
      sFuncionario+
      ' AND I1.ITO_SITUACAO=1 '+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2)'+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    TotalOutros := TotalOutros + FieldByName('TOTAL').asFloat;

    //Calcular Faturado (Nota)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*(I1.INF_PRECO-I1.INF_DESCONTO)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(DataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(DataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA IN (361,368)) '+
      sFuncionarioNota+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    TotalFaturado := TotalFaturado + FieldByName('TOTAL').asFloat;

    //Calcular Devolvido (Troca SN)
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE*I1.ITO_VALOR) AS TOTAL '+
      ' FROM TROCA T1, ITEM_DE_TROCA I1, PEDIDO_DE_VENDA P1 '+
      ' WHERE T1.TRO_DATA>="'+MesDia(DataINI)+'" '+
      ' AND T1.TRO_DATA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      sFuncionario+
      ' AND I1.ITO_SITUACAO=1 '+
      ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
      ' AND T1.TRO_CODIGO=I1.TRO_CODIGO ';
    Open;
    TotalDevolvido := TotalDevolvido + FieldByName('TOTAL').asFloat;

    //Calcular Devolvidos Total (LJ3/LJ4)
    Close;
    SQL.Text := 'SELECT SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_DT_DEVOLUCAO>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_SITUACAO=8) '+
      sFuncionario+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    TotalDevolvido := TotalDevolvido + FieldByName('TOTAL').asFloat;

    //Calcular Devolvido (Nota Não Avulsa)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*(I1.INF_PRECO-I1.INF_DESCONTO)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(DataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(DataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      sFuncionarioNota+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA<>1 '+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    TotalDevolvido := TotalDevolvido + FieldByName('TOTAL').asFloat;

    //Calcular Devolvido (Nota Avulsa)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*(I1.INF_PRECO-I1.INF_DESCONTO)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_ENTRADA_SAIDA>="'+MesDia(DataINI)+'" '+
      ' AND N1.NTF_DT_ENTRADA_SAIDA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      sFuncionarioNota+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA=1 '+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    TotalDevolvido := TotalDevolvido + FieldByName('TOTAL').asFloat;
  end;

  if (TotalOutros = 0) and (TotalFaturado = 0) and (TotalDevolvido = 0) then
  Begin
    PrintBand := False;
    Exit;
  end
  else
    PrintBand := True;

  //Definir Liquido
  qrlOutros.Caption := format('%.2f',[TotalOutros]);
  qrlFaturamento.Caption := format('%.2f',[TotalFaturado]);
  qrlDevolucoes.Caption := format('%.2f',[TotalDevolvido]);
  vLiquido := TotalOutros+TotalFaturado-TotalDevolvido;
  qrlLiquido.Caption := format('%.2f',[vLiquido]);

  GeralOutros    := GeralOutros    + TotalOutros;
  GeralFaturado  := GeralFaturado  + TotalFaturado;
  GeralDevolvido := GeralDevolvido + TotalDevolvido;

  vComissao      := 0;
  vPremio        := 0;
  //Calcular Comissão e Prêmio (Não Gerente)
  if Entidade.Funcao <> 56 then
  Begin
    with Item_de_Cota1 do
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
      ParamByName('MES').asInteger := StrToInt(Copy(DateToStr(DataFIM),4,2));
      ParamByName('ANO').asInteger := StrToInt(Copy(DateToStr(DataFIM),7,4));
      Open;
      if IsEmpty then
      Begin
        qrlComissao.Caption := '-';
        qrlPremio.Caption  := '-';
      end
      else
      Begin
        if vLiquido <= Cota1 then
          vComissao := vLiquido*Comissao1/100
        else if vLiquido <= Cota2 then
          vComissao := vLiquido*Comissao2/100
        else if vLiquido <= Cota3 then
          vComissao := vLiquido*Comissao3/100
        else
          vComissao := vLiquido*Comissao4/100;
        qrlComissao.Caption := format('%.2f',[vComissao]);

        if vLiquido > Cota40 then
          vPremio := Comissao40
        else if vLiquido > Cota30 then
          vPremio := Comissao30
        else if vLiquido > Cota20 then
          vPremio := Comissao20
        else if vLiquido > Cota10 then
          vPremio := Comissao10;
        qrlPremio.Caption  := format('%.2f',[vPremio]);
      end;
    end;
  end
  else
  Begin
    qrlPremio.Caption  := '-';
    if (Entidade.FieldByName('FUN_PERC_ABAIXO').AsString = '') or
       (Entidade.FieldByName('FUN_PERC_ACIMA').AsString = '') then
      qrlComissao.Caption := '-'
    else
    Begin
      if vLiquido <= Entidade.Cota then
        vComissao := vLiquido*Entidade.FieldByName('FUN_PERC_ABAIXO').asFloat/100
      else
        vComissao := vLiquido*Entidade.FieldByName('FUN_PERC_ACIMA').asFloat/100;
    end;
  end;
  GeralComissao := GeralComissao + vComissao;
  GeralPremio   := GeralPremio + vPremio;
  vSubTotal := vComissao+vPremio;
  if vSubTotal > 0 then
  Begin
    qrlSubTotal.Caption := format('%.2f',[vSubTotal]);
    qrlPercentual1.Caption  := format('%.2f',[vSubTotal/vLiquido*100]);
  end
  else
  Begin
    qrlSubTotal.Caption := '-';
    qrlPercentual1.Caption  := '-';
  end;

  vBonus         := 0;
  //Calcular Bônus (R$)
  with DM.QR_Consultas do
  Begin
    //Calcular Bônus
    Close;
    SQL.Text := 'SELECT SUM(ROUND(ROUND(DIB_QUANTIDADE_BONUS*DIB_PRECO,2)*DIB_BONUS_1/100,2)) AS TOTAL '+
      ' FROM DIREITO_DE_BONUS '+
      ' WHERE DIB_DT_ALTERADO>="'+MesDia(DataINI)+'" '+
      ' AND DIB_DT_ALTERADO<"'+MesDia(DataFIM+1)+'" '+
      ' AND DIB_SITUACAO=0 '+
      ' AND FUN_CODIGO='+IntToStr(Funcionario1.CodigoFUN);
    Open;
    vBonus := vBonus + FieldByName('TOTAL').asFloat;
  end;
  GeralBonus := GeralBonus + vBonus;
  if vBonus > 0 then
    qrlBonus.Caption := format('%.2f',[vBonus])
  else
    qrlBonus.Caption := '-';

  vTotalComissao := vSubTotal+vBonus;
  if vTotalComissao > 0 then
  Begin
    qrlTotal.Caption := format('%.2f',[vTotalComissao]);
    qrlPercentual2.Caption := format('%.2f',[vTotalComissao/vLiquido*100]);
  end
  else
  Begin
    qrlTotal.Caption := '-';
    qrlPercentual2.Caption := '-';
  end;

  inc(TotalRegistros);
end;

procedure Trpt_ComissaoNova.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vGeralLiquido, vGeralSubTotal, vGeralTotalComissao: Double;
begin
  qrlTotalRegistros.Caption := IntToStr(TotalRegistros);

  qrlGeralOutros.Caption      := format('%.2f',[GeralOutros]);
  qrlGeralFaturamento.Caption := format('%.2f',[GeralFaturado]);
  qrlGeralDevolucoes.Caption  := format('%.2f',[GeralDevolvido]);
  vGeralLiquido := GeralOutros + GeralFaturado - GeralDevolvido;
  qrlGeralLiquido.Caption     := format('%.2f',[vGeralLiquido]);
  qrlGeralComissao.Caption    := format('%.2f',[GeralComissao]);
  qrlGeralPremio.Caption      := format('%.2f',[GeralPremio]);
  vGeralSubTotal := GeralComissao + GeralPremio;
  qrlGeralSubTotal.Caption    := format('%.2f',[vGeralSubTotal]);
  qrlGeralPercentual1.Caption := format('%.2f',[vGeralSubTotal/vGeralLiquido*100]);
  qrlGeralBonus.Caption       := format('%.2f',[GeralBonus]);
  vGeralTotalComissao := vGeralSubTotal + GeralBonus;
  qrlGeralTotal.Caption       := format('%.2f',[vGeralTotalComissao]);
  qrlGeralPercentual2.Caption := format('%.2f',[vGeralTotalComissao/vGeralLiquido*100]);

  qrlTotalRegistros.Caption := '';

  qrlGeralOutros.Caption      := '';
  qrlGeralFaturamento.Caption := '';
  qrlGeralDevolucoes.Caption  := '';
  qrlGeralLiquido.Caption     := '';
  qrlGeralComissao.Caption    := '';
  qrlGeralPremio.Caption      := '';
  qrlGeralSubTotal.Caption    := '';
  qrlGeralPercentual1.Caption := '';
  qrlGeralBonus.Caption       := '';
  qrlGeralTotal.Caption       := '';
  qrlGeralPercentual2.Caption := '';

end;

procedure Trpt_ComissaoNova.FormCreate(Sender: TObject);
begin
  Entidade := Funcionario1;
end;

end.
