unit UFaturamentoLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Item_Pedido_Venda, Funcionario,
  Secao, Produto, Forma_de_Pagamento, Parametro, AgenteFin, CentroCusto,
  Titulo_receber;

type
  Trpt_FaturamentoLBM = class(TForm)
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
    Funcionario1: TFuncionario;
    SZRLabel4: TSZRLabel;
    zrb_detalhe: TSZRBand;
    SZRDBText1: TSZRDBText;
    zrlFaturado: TSZRLabel;
    zrlDevolvido: TSZRLabel;
    zrlLiquido: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlFaturadoSN: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRBand1: TSZRBand;
    zrlTotalFaturamento: TSZRLabel;
    zrlTotalDevolucao: TSZRLabel;
    zrlTotalLiquido: TSZRLabel;
    zrlTotalOutros: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlDevolvidoSN: TSZRLabel;
    zrlTotalDevolvidoSN: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrb_detalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    GeralSN, GeralFaturado, GeralDevolvido, GeralDevolvidoSN : Double;
    TotalRegistros : integer;
  public
    DataINI, DataFIM : TDateTime;
  end;

var
  rpt_FaturamentoLBM: Trpt_FaturamentoLBM;

implementation
Uses
  UDM, MxSVendasCliente, Funcoes;
{$R *.DFM}

procedure Trpt_FaturamentoLBM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure Trpt_FaturamentoLBM.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  TotalSN, TotalFaturado, TotalDevolvido, TotalDevolvidoSN: Double;
begin
  TotalSN          := 0;
  TotalFaturado    := 0;
  TotalDevolvido   := 0;
  TotalDevolvidoSN := 0;
  with DM.QR_Consultas do
  Begin
    //Calcular Faturado (SN) - FATUR
    Close;
    SQL.Text := 'SELECT SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_SITUACAO=4 OR P1.PDV_SITUACAO=8) '+
      ' AND I1.FUN_CODIGO='+IntToStr(Funcionario1.CodigoFUN)+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    TotalSN := TotalSN + FieldByName('TOTAL').asFloat;

    //Calcular Faturado (Itens Trocados - Devolvidos Parciais SN)  - FATPARC
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE*ROUND(I1.ITO_VALOR,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_TROCA I1 '+
      ' WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(DataFIM+1)+'" '+
      ' AND ((P1.PDV_SITUACAO=4) OR (P1.PDV_SITUACAO=8)) '+
      ' AND I1.FUN_CODIGO='+IntToStr(Funcionario1.CodigoFUN)+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      ' AND I1.ITO_SITUACAO=1 '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    TotalSN := TotalSN + FieldByName('TOTAL').asFloat;

    //Calcular Faturado (Nota)  - FATURNF
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(DataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(DataFIM+1)+'" '+
      ' AND ((N1.NTF_TIPO_NOTA=361) or (N1.NTF_TIPO_NOTA=368)) '+ //Vendas e Serviços
      ' AND N1.FUN_CODIGO='+IntToStr(Funcionario1.CodigoFUN)+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    TotalFaturado := TotalFaturado + FieldByName('TOTAL').asFloat;

    //Calcular Devolvido (Troca SN) - DEVOLTROCA
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE*ROUND(I1.ITO_VALOR,2)) AS TOTAL '+
      ' FROM TROCA T1, ITEM_DE_TROCA I1, PEDIDO_DE_VENDA P1 '+
      ' WHERE T1.TRO_DATA>="'+MesDia(DataINI)+'" '+
      ' AND T1.TRO_DATA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      ' AND I1.FUN_CODIGO='+IntToStr(Funcionario1.CodigoFUN)+
      ' AND I1.ITO_SITUACAO=1 '+
      ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
      ' AND T1.TRO_CODIGO=I1.TRO_CODIGO ';
    Open;
    TotalDevolvidoSN := TotalDevolvidoSN + FieldByName('TOTAL').asFloat;

    //Calcular Devolvidos Total (SN)  -  DEVOLSN
    Close;
    SQL.Text := 'SELECT SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_DT_DEVOLUCAO>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_SITUACAO=8) '+
      ' AND I1.FUN_CODIGO='+IntToStr(Funcionario1.CodigoFUN)+
      ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    TotalDevolvidoSN := TotalDevolvidoSN + FieldByName('TOTAL').asFloat;

    //Calcular Devolvido (Nota Não Avulsa)  -  DEVOLNF
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(DataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(DataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND N1.FUN_CODIGO='+IntToStr(Funcionario1.CodigoFUN)+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA<>1 '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    TotalDevolvido := TotalDevolvido + FieldByName('TOTAL').asFloat;

    //Calcular Devolvido (Nota Avulsa)
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_ENTRADA_SAIDA>="'+MesDia(DataINI)+'" '+
      ' AND N1.NTF_DT_ENTRADA_SAIDA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND N1.FUN_CODIGO='+IntToStr(Funcionario1.CodigoFUN)+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA=1 '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+      
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    TotalDevolvido := TotalDevolvido + FieldByName('TOTAL').asFloat;
  end;

  //Definir Liquido
  zrlFaturadoSN.Caption := format('%.2f',[TotalSN]);
  zrlDevolvidoSN.Caption := format('%.2f',[TotalDevolvidoSN]);
  zrlFaturado.Caption := format('%.2f',[TotalFaturado]);
  zrlDevolvido.Caption := format('%.2f',[TotalDevolvido]);
  zrlLiquido.Caption := format('%.2f',[TotalSN+TotalFaturado-TotalDevolvido-TotalDevolvidoSN]);

  GeralSN          := GeralSN          + TotalSN;
  GeralFaturado    := GeralFaturado    + TotalFaturado;
  GeralDevolvido   := GeralDevolvido   + TotalDevolvido;
  GeralDevolvidoSN := GeralDevolvidoSN + TotalDevolvidoSN;

  if (TotalSN = 0) and (TotalFaturado = 0) and (TotalDevolvido = 0) and (TotalDevolvidoSN = 0) then
  Begin
    DoPrint := False;
    Exit;
  end
  else
    DoPrint := True;

  inc(TotalRegistros);
end;

procedure Trpt_FaturamentoLBM.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FaturamentoLBM.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FaturamentoLBM.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalOutros.Caption := format('%.2f',[GeralSN]);
  zrlTotalDevolvidoSN.Caption := format('%.2f',[GeralDevolvidoSN]);
  zrlTotalFaturamento.Caption := format('%.2f',[GeralFaturado]);
  zrlTotalDevolucao.Caption := format('%.2f',[GeralDevolvido]);
  zrlTotalLiquido.Caption := format('%.2f',[GeralSN+GeralFaturado-GeralDevolvido-GeralDevolvidoSN]);
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_FaturamentoLBM.FormCreate(Sender: TObject);
begin
  TotalRegistros := 0;
  GeralSN := 0;
  GeralFaturado := 0;
  GeralDevolvido := 0;
  GeralDevolvidoSN := 0;
end;

procedure Trpt_FaturamentoLBM.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
