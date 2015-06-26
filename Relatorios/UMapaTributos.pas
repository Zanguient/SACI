unit UMapaTributos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, SQuery, Funcionario,
  QRExport, Item_de_Cota, NotaFiscal, Usuario, DateUtils;

type
  Trpt_MapaTributos = class(TForm)
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    NotaFiscal1: TNotaFiscal;
    report: TQuickRep;
    QRBand1: TQRBand;
    qrlDescricaoRelatorio: TQRLabel;
    qrlNomeLoja: TQRLabel;
    qrlNomeCentroDeCusto: TQRLabel;
    qrsDataHoraImpressao: TQRSysData;
    qrsLinhaHorizontalCabecalho1: TQRShape;
    qrlPeriodoDesc: TQRLabel;
    qrsLinhaHorizontalCabecalho2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    qrsLinhaHorizontalRodape: TQRShape;
    QRLabel15: TQRLabel;
    qrlUsuario: TQRLabel;
    qrlDescricaoPeriodo: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlMtReceitasComerciais: TQRLabel;
    qrlMtDevolucoesVendas: TQRLabel;
    qrlMtReceitasServicos: TQRLabel;
    qrlMtDevolucoesServicos: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlF1ReceitaLiquidaVendas: TQRLabel;
    qrlF1ReceitasServicos: TQRLabel;
    qrlF1DevolucoesServicos: TQRLabel;
    qrlF1ReceitaLiquidaServicos: TQRLabel;
    QRShape3: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    qrlReceitasComerciais: TQRLabel;
    qrlDevolucoesVendas: TQRLabel;
    qrlDevolucoesServicos: TQRLabel;
    qrlReceitaLiquida: TQRLabel;
    QRShape4: TQRShape;
    QRLabel26: TQRLabel;
    QRShape5: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    qrlMtAliqPIS: TQRLabel;
    qrlMtAliqCOFINS: TQRLabel;
    qrlMtAliqISS: TQRLabel;
    QRLabel41: TQRLabel;
    qrlF1AliqPIS: TQRLabel;
    qrlF1AliqCOFINS: TQRLabel;
    qrlF1AliqISS: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    qrlMtPIS: TQRLabel;
    qrlMtCOFINS: TQRLabel;
    qrlMtISS: TQRLabel;
    qrlF1PIS: TQRLabel;
    qrlF1COFINS: TQRLabel;
    qrlF1ISS: TQRLabel;
    QRLabel56: TQRLabel;
    qrlMtDeducaoPIS: TQRLabel;
    qrlMtDeducaoCOFINS: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel62: TQRLabel;
    qrlMtRecolherPIS: TQRLabel;
    qrlMtRecolherCOFINS: TQRLabel;
    qrlMtRecolherISS: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    qrlF1DeducaoPIS: TQRLabel;
    qrlF1DeducaoCOFINS: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel74: TQRLabel;
    qrlF1RecolherPIS: TQRLabel;
    qrlF1RecolherCOFINS: TQRLabel;
    qrlF1RecolherISS: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape9: TQRShape;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    qrlReceitasAtividadesVendas: TQRLabel;
    qrlLucroPresumidoVendas: TQRLabel;
    qrlIRPJVendas: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel88: TQRLabel;
    qrlContribuicaoSocialVendas: TQRLabel;
    qrlAliqLucroPresumidoVendas: TQRLabel;
    qrlAliqIRPJVendas: TQRLabel;
    qrlAliqContribuicaoSocialVendas: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    qrlReceitasAtividadesServicos: TQRLabel;
    qrlLucroPresumidoServicos: TQRLabel;
    qrlIRPJServicos: TQRLabel;
    QRLabel107: TQRLabel;
    qrlContribuicaoSocialServicos: TQRLabel;
    qrlAliqLucroPresumidoServicos: TQRLabel;
    qrlAliqIRPJServicos: TQRLabel;
    qrlAliqContribuicaoSocialServicos: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    qrlIRPJ: TQRLabel;
    qrlContribuicaoSocial: TQRLabel;
    QRLabel125: TQRLabel;
    qrlIRPJDeducoes: TQRLabel;
    qrlContribuicaoSocialDeducoes: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    qrlIRPJRecolher: TQRLabel;
    qrlContribuicaoSocialRecolher: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel97: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel117: TQRLabel;
    qrlRecolherPIS: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRShape14: TQRShape;
    QRLabel137: TQRLabel;
    QRShape15: TQRShape;
    QRLabel139: TQRLabel;
    QRShape16: TQRShape;
    QRLabel140: TQRLabel;
    QRShape17: TQRShape;
    qrlTotalImposto: TQRLabel;
    QRLabel142: TQRLabel;
    qrlRecolherISSMt: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel138: TQRLabel;
    QRShape18: TQRShape;
    QRLabel147: TQRLabel;
    qrlRecolherISSF1: TQRLabel;
    QRLabel149: TQRLabel;
    qrlRecolherCOFINS: TQRLabel;
    qrlVencimentoPIS: TQRLabel;
    qrlVencimentoISSMt: TQRLabel;
    qrlVencimentoISSF1: TQRLabel;
    qrlVencimentoCOFINS: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    qrlPrimeiroMes: TQRLabel;
    qrlSegundoMes: TQRLabel;
    qrlTerceiroMes: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    qrlSegundoIRPJ: TQRLabel;
    qrlSegundoContribuicaoSocial: TQRLabel;
    qrlSegundoCOFINS: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    qrlTerceiroIRPJ: TQRLabel;
    qrlTerceiroContribuicaoSocial: TQRLabel;
    qrlTerceiroCOFINS: TQRLabel;
    qrlTrimestreIRPJ: TQRLabel;
    qrlTrimestreContribuicaoSocial: TQRLabel;
    qrlTrimestreCOFINS: TQRLabel;
    qrlRecolherIRPJGeral: TQRLabel;
    qrlRecolherContribuicaoSocialGeral: TQRLabel;
    qrlRecolherCOFINSGeral: TQRLabel;
    qrlPrimeiroIRPJ: TQRLabel;
    qrlPrimeiroContribuicaoSocial: TQRLabel;
    qrlPrimeiroCOFINS: TQRLabel;
    QRShape19: TQRShape;
    QRLabel192: TQRLabel;
    qrmObservacao: TQRMemo;
    QRLabel12: TQRLabel;
    qrlMtReceitaLiquidaVendas: TQRLabel;
    QRLabel14: TQRLabel;
    qrlMtReceitaLiquidaServicos: TQRLabel;
    QRLabel22: TQRLabel;
    qrlReceitasServicos: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    qrlF1ReceitasComerciais: TQRLabel;
    qrlF1DevolucoesVendas: TQRLabel;
    qrlReceitaLiquidaVendas: TQRLabel;
    QRLabel16: TQRLabel;
    QrLabel344: TQRLabel;
    qrlReceitaLiquidaServicos: TQRLabel;
    QRLabel13: TQRLabel;
    qrlPrimeiroIR: TQRLabel;
    qrlSegundoIR: TQRLabel;
    qrlTerceiroIR: TQRLabel;
    qrlTrimestreIR: TQRLabel;
    qrlRecolherIRGeral: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public
    vDataINI, vDataFIM: TDateTime;
    Entidade : TNotaFiscal;
  end;

var
  rpt_MapaTributos: Trpt_MapaTributos;

implementation

uses UDM, Funcoes, MxSelMapaTributos;

{$R *.dfm}

procedure Trpt_MapaTributos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vReceitasComerciais,   vReceitasComerciaisMt,   vReceitasComerciaisF1,
    vDevolucoesVendas,   vDevolucoesVendasMt,     vDevolucoesVendasF1,
    vReceitasServicos,   vReceitasServicosMt,     vReceitasServicosF1,
    vDevolucoesServicos, vDevolucoesServicosMt,   vDevolucoesServicosF1,
                         vReceitaLiquidaVendasMt,   vReceitaLiquidaVendasF1,
                         vReceitaLiquidaServicosMt, vReceitaLiquidaServicosF1,
    vReceitaLiquidaGeral: Double;
  F: TextFile;
  NomeArquivo, Linha: string;
begin
  QRLabel1.Caption   := EmpresaDesenvolvedora;
  qrlNomeLoja.Caption:=DM.Configuracao1.LojaNome;
  qrlNomeCentroDeCusto.Caption:=DM.CentroCusto1.RazaoSocial;

  //Definir Usuário
  qrlUsuario.Caption := 'Usuario: '+DM.NomeUsuario(DM.Configuracao1.CodigoUSU);

  //Calcular Faturamento
  with DM.QR_Consultas do
  Begin
    //Calcular Faturado (Nota) - Matriz - Vendas
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*(ROUND(I1.INF_PRECO,2)-I1.INF_DESCONTO)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=361) '+
      ' AND I1.PRD_CODIGO>0 '+  //Vendas
      ' AND N1.NTF_SITUACAO=2 '+
      fmxSelMapaTributos.sCNC+ //Matriz
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vReceitasComerciaisMt := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Faturado (Nota) - Filial - Vendas
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=361) '+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND I1.PRD_CODIGO>0 '+  //Vendas
      ' AND N1.CNC_CODIGO=2 '+  //Filial
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vReceitasComerciaisF1 := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Faturado (Nota) - Matriz - Servicos
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=361) '+
      ' AND I1.PRD_CODIGO=0 '+  //Serviços
      ' AND N1.NTF_SITUACAO=2 '+
      fmxSelMapaTributos.sCNC+ //Matriz
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vReceitasServicosMt   := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Faturado (Nota) - Filial - Servicos
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=361) '+
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND I1.PRD_CODIGO=0 '+  //Serviços
      ' AND N1.CNC_CODIGO=2 '+  //Filial
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vReceitasServicosF1 := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Faturado (Nota) - Matriz - Somente Servicos
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=368) '+ //Serviço
      ' AND N1.NTF_SITUACAO=2 '+
      fmxSelMapaTributos.sCNC+ //Matriz
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vReceitasServicosMt   := vReceitasServicosMt + Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Faturado (Nota) - Filial - Somente Servicos
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=368) '+ //Serviço
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.CNC_CODIGO=2 '+  //Filial
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vReceitasServicosF1 := vReceitasServicosF1 + Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Não Avulsa) - Matriz - Vendas
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND I1.PRD_CODIGO>0 '+  //Vendas
      fmxSelMapaTributos.sCNC+ //Matriz
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA<>1 '+
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vDevolucoesVendasMt := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Avulsa) - Matriz - Vendas
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_ENTRADA_SAIDA>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_ENTRADA_SAIDA<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND I1.PRD_CODIGO>0 '+  //Vendas
      fmxSelMapaTributos.sCNC+ //Matriz
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA=1 '+
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vDevolucoesVendasMt := vDevolucoesVendasMt + Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Não Avulsa) - Filial - Vendas
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND I1.PRD_CODIGO>0 '+  //Vendas
      ' AND N1.CNC_CODIGO=2 '+  //Filial
      ' AND N1.NTF_SITUACAO=2 AND '+
      ' N1.NTF_AVULSA<>1 '+
      fmxSelMapaTributos.sValor+
      ' AND N1.NTF_CFOP<>6202 '+ //Devolução de Compra
      ' AND N1.NTF_CFOP<>5202 '+ //Devolução de Compra
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vDevolucoesVendasF1 := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Avulsa) - Filial - Vendas
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_ENTRADA_SAIDA>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_ENTRADA_SAIDA<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND I1.PRD_CODIGO>0 '+  //Vendas
      ' AND N1.CNC_CODIGO=2 '+  //Filial
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA=1 '+
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vDevolucoesVendasF1 := vDevolucoesVendasF1 + Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Não Avulsa) - Matriz - Servicos
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND I1.PRD_CODIGO=0 '+  //Servicos
      fmxSelMapaTributos.sCNC+ //Matriz
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA<>1 '+
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vDevolucoesServicosMt := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Avulsa) - Matriz - Servicos
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_ENTRADA_SAIDA>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_ENTRADA_SAIDA<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND I1.PRD_CODIGO=0 '+  //Servicos
      fmxSelMapaTributos.sCNC+ //Matriz
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA=1 '+
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vDevolucoesServicosMt := vDevolucoesServicosMt + Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Não Avulsa) - Filial - Servicos
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_EMISSAO>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_EMISSAO<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND I1.PRD_CODIGO=0 '+  //Servicos
      ' AND N1.CNC_CODIGO=2 '+  //Filial
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA<>1 '+
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vDevolucoesServicosF1 := Arredonda(FieldByName('TOTAL').asFloat);

    //Calcular Devolvido (Nota Avulsa) - Filial - Servicos
    Close;
    SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS TOTAL '+
      ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE N1.NTF_DT_ENTRADA_SAIDA>="'+MesDia(vDataINI)+'" '+
      ' AND N1.NTF_DT_ENTRADA_SAIDA<"'+MesDia(vDataFIM+1)+'" '+
      ' AND (N1.NTF_TIPO_NOTA=362) '+
      ' AND I1.PRD_CODIGO=0 '+  //Servicos
      ' AND N1.CNC_CODIGO=2 '+  //Filial
      ' AND N1.NTF_SITUACAO=2 '+
      ' AND N1.NTF_AVULSA=1 '+
      fmxSelMapaTributos.sValor+
      ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
      ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
    Open;
    vDevolucoesServicosF1 := vDevolucoesServicosF1 + Arredonda(FieldByName('TOTAL').asFloat);

    vReceitaLiquidaVendasMt   := vReceitasComerciaisMt - vDevolucoesVendasMt;
    vReceitaLiquidaServicosMt := vReceitasServicosMt   - vDevolucoesServicosMt;
    vReceitaLiquidaVendasF1   := vReceitasComerciaisF1 - vDevolucoesVendasF1;
    vReceitaLiquidaServicosF1 := vReceitasServicosF1   - vDevolucoesServicosF1;

    //Exibir Base de Cálculo da Matriz
    qrlMtReceitasComerciais.Caption     := format('%.2f',[vReceitasComerciaisMt]);
    qrlMtDevolucoesVendas.Caption       := format('%.2f',[vDevolucoesVendasMt]);
    qrlMtReceitaLiquidaVendas.Caption   := format('%.2f',[vReceitaLiquidaVendasMt]);
    qrlMtReceitasServicos.Caption       := format('%.2f',[vReceitasServicosMt]);
    qrlMtDevolucoesServicos.Caption     := format('%.2f',[vDevolucoesServicosMt]);
    qrlMtReceitaLiquidaServicos.Caption := format('%.2f',[vReceitaLiquidaServicosMt]);

    //Exibir Base de Cálculo da Filial
    qrlF1ReceitasComerciais.Caption     := format('%.2f',[vReceitasComerciaisF1]);
    qrlF1DevolucoesVendas.Caption       := format('%.2f',[vDevolucoesVendasF1]);
    qrlF1ReceitaLiquidaVendas.Caption   := format('%.2f',[vReceitaLiquidaVendasF1]);
    qrlF1ReceitasServicos.Caption       := format('%.2f',[vReceitasServicosF1]);
    qrlF1DevolucoesServicos.Caption     := format('%.2f',[vDevolucoesServicosF1]);
    qrlF1ReceitaLiquidaServicos.Caption := format('%.2f',[vReceitaLiquidaServicosF1]);

    vReceitasComerciais  := StrToFloat(qrlMtReceitasComerciais.Caption) +
                            StrToFloat(qrlF1ReceitasComerciais.Caption);
    vDevolucoesVendas    := StrToFloat(qrlMtDevolucoesVendas.Caption) +
                            StrToFloat(qrlF1DevolucoesVendas.Caption);
    vReceitasServicos    := StrToFloat(qrlMtReceitasServicos.Caption) +
                            StrToFloat(qrlF1ReceitasServicos.Caption);
    vDevolucoesServicos  := StrToFloat(qrlMtDevolucoesServicos.Caption) +
                            StrToFloat(qrlF1DevolucoesServicos.Caption);
    vReceitaLiquidaGeral := vReceitasComerciais - vDevolucoesVendas +
                            vReceitasServicos   - vDevolucoesServicos;

    //Total Geral
    qrlReceitasComerciais.Caption := format('%.2f',[vReceitasComerciais]);
    qrlDevolucoesVendas.Caption   := format('%.2f',[vDevolucoesVendas]);
    qrlReceitaLiquidaVendas.Caption := format('%.2f',[vReceitasComerciais-vDevolucoesVendas]);
    qrlReceitasServicos.Caption   := format('%.2f',[vReceitasServicos]);
    qrlDevolucoesServicos.Caption := format('%.2f',[vDevolucoesServicos]);
    qrlReceitaLiquidaServicos.Caption := format('%.2f',[vReceitasServicos-vDevolucoesServicos]);
    qrlReceitaLiquida.Caption     := format('%.2f',[vReceitaLiquidaGeral]);
  end;

  //Calcular Impostos Sobre Faturamento
  //Matriz
  qrlMtPIS.Caption := format('%.2f',[(vReceitaLiquidaVendasMt+vReceitaLiquidaServicosMt)*StrToFloat(qrlMtAliqPIS.Caption)/100]);
  qrlMtRecolherPIS.Caption := format('%.2f',[StrToFloat(qrlMtPIS.Caption)-StrToFloat(qrlMtDeducaoPIS.Caption)]);
  qrlMtCOFINS.Caption := format('%.2f',[(vReceitaLiquidaVendasMt+vReceitaLiquidaServicosMt)*StrToFloat(qrlMtAliqCOFINS.Caption)/100]);
  qrlMtRecolherCOFINS.Caption := format('%.2f',[StrToFloat(qrlMtCOFINS.Caption)-StrToFloat(qrlMtDeducaoCOFINS.Caption)]);
  qrlMtISS.Caption := format('%.2f',[vReceitaLiquidaServicosMt*StrToFloat(qrlMtAliqISS.Caption)/100]);
  qrlMtRecolherISS.Caption := format('%.2f',[StrToFloat(qrlMtISS.Caption)]);
  //Filial
  qrlF1PIS.Caption := format('%.2f',[(vReceitaLiquidaVendasF1+vReceitaLiquidaServicosF1)*StrToFloat(qrlF1AliqPIS.Caption)/100]);
  qrlF1RecolherPIS.Caption := format('%.2f',[StrToFloat(qrlF1PIS.Caption)-StrToFloat(qrlF1DeducaoPIS.Caption)]);
  qrlF1COFINS.Caption := format('%.2f',[(vReceitaLiquidaVendasF1+vReceitaLiquidaServicosF1)*StrToFloat(qrlF1AliqCOFINS.Caption)/100]);
  qrlF1RecolherCOFINS.Caption := format('%.2f',[StrToFloat(qrlF1COFINS.Caption)-StrToFloat(qrlF1DeducaoCOFINS.Caption)]);
  qrlF1ISS.Caption := format('%.2f',[vReceitaLiquidaServicosF1*StrToFloat(qrlF1AliqISS.Caption)/100]);
  qrlF1RecolherISS.Caption := format('%.2f',[StrToFloat(qrlF1ISS.Caption)]);

  //Impostos Com Base no Lucro Presumido
  qrlReceitasAtividadesVendas.Caption := format('%.2f',[vReceitasComerciais-vDevolucoesVendas]);
  qrlReceitasAtividadesServicos.Caption := format('%.2f',[vReceitasServicos-vDevolucoesServicos]);
  qrlLucroPresumidoVendas.Caption := format('%.2f',[StrToFloat(qrlReceitasAtividadesVendas.Caption)*StrToFloat(qrlAliqLucroPresumidoVendas.Caption)/100]);
  qrlLucroPresumidoServicos.Caption := format('%.2f',[StrToFloat(qrlReceitasAtividadesServicos.Caption)*StrToFloat(qrlAliqLucroPresumidoServicos.Caption)/100]);
  qrlIRPJVendas.Caption := format('%.2f',[StrToFloat(qrlLucroPresumidoVendas.Caption)*StrToFloat(qrlAliqIRPJVendas.Caption)/100]);
  qrlIRPJServicos.Caption := format('%.2f',[StrToFloat(qrlLucroPresumidoServicos.Caption)*StrToFloat(qrlAliqIRPJServicos.Caption)/100]);
  qrlContribuicaoSocialVendas.Caption := format('%.2f',[StrToFloat(qrlReceitasAtividadesVendas.Caption)*StrToFloat(qrlAliqContribuicaoSocialVendas.Caption)/100]);
  qrlContribuicaoSocialServicos.Caption := format('%.2f',[StrToFloat(qrlReceitasAtividadesServicos.Caption)*StrToFloat(qrlAliqContribuicaoSocialServicos.Caption)/100]);

  //Impostos Com Base no Lucro Presumido (Venda + Servico)
  qrlIRPJ.Caption := format('%.2f',[StrToFloat(qrlIRPJVendas.Caption)+StrToFloat(qrlIRPJServicos.Caption)]);
  qrlContribuicaoSocial.Caption := format('%.2f',[StrToFloat(qrlContribuicaoSocialVendas.Caption)+StrToFloat(qrlContribuicaoSocialServicos.Caption)]);

  //Deduções

  //Imposto a Recolher
  qrlIRPJRecolher.Caption := format('%.2f',[StrToFloat(qrlIRPJ.Caption)-StrToFloat(qrlIRPJDeducoes.Caption)]);
  qrlContribuicaoSocialRecolher.Caption := format('%.2f',[StrToFloat(qrlContribuicaoSocial.Caption)-StrToFloat(qrlContribuicaoSocialDeducoes.Caption)]);

  //Resumo
  qrlRecolherPIS.Caption := format('%.2f',[StrToFloat(qrlMtRecolherPIS.Caption)+StrToFloat(qrlF1RecolherPIS.Caption)]);
  qrlRecolherISSMt.Caption := format('%.2f',[StrToFloat(qrlMtRecolherISS.Caption)]);
  qrlRecolherISSF1.Caption := format('%.2f',[StrToFloat(qrlF1RecolherISS.Caption)]);
  qrlRecolherCOFINS.Caption := format('%.2f',[StrToFloat(qrlMtRecolherCOFINS.Caption)+StrToFloat(qrlF1RecolherCOFINS.Caption)]);

  fMxSelMapaTributos.vTotalIRPJ       := StrToFloat(qrlIRPJRecolher.Caption);
  fMxSelMapaTributos.vTotalContSocial := StrToFloat(qrlContribuicaoSocialRecolher.Caption);
  fMxSelMapaTributos.vTotalConfins    := StrToFloat(qrlRecolherCOFINS.Caption);
  fMxSelMapaTributos.vTotalIRRecolher := StrToFloat(qrlLucroPresumidoVendas.Caption)+StrToFloat(qrlLucroPresumidoServicos.Caption);
  if (MonthOf(vDataINI) IN [1,4,7,10]) then
  Begin
    qrlPrimeiroIRPJ.Caption := qrlIRPJRecolher.Caption;
    qrlPrimeiroContribuicaoSocial.Caption := qrlContribuicaoSocialRecolher.Caption;
    qrlPrimeiroCOFINS.Caption := qrlRecolherCOFINS.Caption;
    qrlPrimeiroIR.Caption := format('%.2f',[StrToFloat(qrlLucroPresumidoVendas.Caption)+StrToFloat(qrlLucroPresumidoServicos.Caption)]);
    qrlSegundoIRPJ.Caption := qrlIRPJRecolher.Caption;
    qrlSegundoContribuicaoSocial.Caption := qrlContribuicaoSocialRecolher.Caption;
    qrlSegundoCOFINS.Caption := qrlRecolherCOFINS.Caption;
    qrlSegundoIR.Caption := format('%.2f',[StrToFloat(qrlLucroPresumidoVendas.Caption)+StrToFloat(qrlLucroPresumidoServicos.Caption)]);
    qrlTerceiroIRPJ.Caption := qrlIRPJRecolher.Caption;
    qrlTerceiroContribuicaoSocial.Caption := qrlContribuicaoSocialRecolher.Caption;
    qrlTerceiroCOFINS.Caption := qrlRecolherCOFINS.Caption;
    qrlRecolherCOFINSGeral.Caption := qrlRecolherCOFINS.Caption;
    qrlTerceiroIR.Caption := format('%.2f',[StrToFloat(qrlLucroPresumidoVendas.Caption)+StrToFloat(qrlLucroPresumidoServicos.Caption)]);
  end
  else if (MonthOf(vDataINI) IN [2,5,8,11]) then
  Begin
    NomeArquivo := DM.Configuracao1.PastaSistema+'\TRB_'+
                   PreencheZero(2,StrToInt(Copy(DateToStr(vDataINI),4,2))-1)+
                   Copy(DateToStr(vDataINI),7,4)+'.SAC';
    if FileExists(NomeArquivo) then
      try
        AssignFile(F, NomeArquivo);
        Reset(F);
        Readln(F, Linha);
        qrlPrimeiroIRPJ.Caption := Linha;
        Readln(F, Linha);
        qrlPrimeiroContribuicaoSocial.Caption := Linha;
        Readln(F, Linha);
        qrlPrimeiroCOFINS.Caption := Linha;
        Readln(F, Linha);
        qrlPrimeiroIR.Caption := Linha;
      finally
        try
          CloseFile(F);
        except
        end;
      end;
    qrlSegundoIRPJ.Caption := qrlIRPJRecolher.Caption;
    qrlSegundoContribuicaoSocial.Caption := qrlContribuicaoSocialRecolher.Caption;
    qrlSegundoCOFINS.Caption := qrlRecolherCOFINS.Caption;
    qrlSegundoIR.Caption := format('%.2f',[StrToFloat(qrlLucroPresumidoVendas.Caption)+StrToFloat(qrlLucroPresumidoServicos.Caption)]);
    qrlTerceiroIRPJ.Caption := format('%.2f',[(StrToFloat(qrlPrimeiroIRPJ.Caption)+StrToFloat(qrlSegundoIRPJ.Caption))/2]);
    qrlTerceiroContribuicaoSocial.Caption := format('%.2f',[(StrToFloat(qrlPrimeiroContribuicaoSocial.Caption)+StrToFloat(qrlSegundoContribuicaoSocial.Caption))/2]);
    qrlTerceiroCOFINS.Caption := format('%.2f',[(StrToFloat(qrlPrimeiroCOFINS.Caption)+StrToFloat(qrlSegundoCOFINS.Caption))/2]);
    qrlRecolherCOFINSGeral.Caption := qrlRecolherCOFINS.Caption;
    qrlTerceiroIR.Caption := format('%.2f',[(StrToFloat(qrlPrimeiroIR.Caption)+StrToFloat(qrlSegundoIR.Caption))/2]);
  end
  else if (MonthOf(vDataINI) IN [3,6,9,12]) then
  Begin
    NomeArquivo := DM.Configuracao1.PastaSistema+'\TRB_'+
                   PreencheZero(2,StrToInt(Copy(DateToStr(vDataINI),4,2))-2)+
                   Copy(DateToStr(vDataINI),7,4)+'.SAC';
    if FileExists(NomeArquivo) then
      try
        AssignFile(F, NomeArquivo);
        Reset(F);
        Readln(F, Linha);
        qrlPrimeiroIRPJ.Caption := Linha;
        Readln(F, Linha);
        qrlPrimeiroContribuicaoSocial.Caption := Linha;
        Readln(F, Linha);
        qrlPrimeiroCOFINS.Caption := Linha;
        Readln(F, Linha);
        qrlPrimeiroIR.Caption := Linha;
      finally
        try
          CloseFile(F);
        except
        end;
      end;
    NomeArquivo := DM.Configuracao1.PastaSistema+'\TRB_'+
                   PreencheZero(2,StrToInt(Copy(DateToStr(vDataINI),4,2))-1)+
                   Copy(DateToStr(vDataINI),7,4)+'.SAC';
    if FileExists(NomeArquivo) then
      try
        AssignFile(F, NomeArquivo);
        Reset(F);
        Readln(F, Linha);
        qrlSegundoIRPJ.Caption := Linha;
        Readln(F, Linha);
        qrlSegundoContribuicaoSocial.Caption := Linha;
        Readln(F, Linha);
        qrlSegundoCOFINS.Caption := Linha;
        Readln(F, Linha);
        qrlSegundoIR.Caption := Linha;
      finally
        try
          CloseFile(F);
        except
        end;
      end;
    qrlTerceiroIRPJ.Caption := qrlIRPJRecolher.Caption;
    qrlTerceiroContribuicaoSocial.Caption := qrlContribuicaoSocialRecolher.Caption;
    qrlTerceiroCOFINS.Caption := qrlRecolherCOFINS.Caption;
    qrlRecolherCOFINSGeral.Caption := qrlRecolherCOFINS.Caption;
    qrlTerceiroIR.Caption := format('%.2f',[StrToFloat(qrlLucroPresumidoVendas.Caption)+StrToFloat(qrlLucroPresumidoServicos.Caption)]);
  end;
  qrlRecolherIRPJGeral.Caption := format('%.2f',[StrToFloat(qrlPrimeiroIRPJ.Caption)+StrToFloat(qrlSegundoIRPJ.Caption)+StrToFloat(qrlTerceiroIRPJ.Caption)]);
  qrlRecolherContribuicaoSocialGeral.Caption := format('%.2f',[StrToFloat(qrlPrimeiroContribuicaoSocial.Caption)+StrToFloat(qrlSegundoContribuicaoSocial.Caption)+StrToFloat(qrlTerceiroContribuicaoSocial.Caption)]);

  //Total Imposto
  qrlTotalImposto.Caption := format('%.2f',[StrToFloat(qrlRecolherPIS.Caption)+
                                            StrToFloat(qrlRecolherISSMt.Caption)+
                                            StrToFloat(qrlRecolherISSF1.Caption)+StrToFloat(qrlRecolherCOFINS.Caption)]);

  qrlTrimestreIRPJ.Caption := format('%.2f',[StrToFloat(qrlPrimeiroIRPJ.Caption)+
                                            StrToFloat(qrlSegundoIRPJ.Caption)+
                                            StrToFloat(qrlTerceiroIRPJ.Caption)]);

  qrlTrimestreContribuicaoSocial.Caption := format('%.2f',[StrToFloat(qrlPrimeiroContribuicaoSocial.Caption)+
                                            StrToFloat(qrlSegundoContribuicaoSocial.Caption)+
                                            StrToFloat(qrlTerceiroContribuicaoSocial.Caption)]);

  qrlTrimestreCOFINS.Caption := format('%.2f',[StrToFloat(qrlPrimeiroCOFINS.Caption)+
                                             StrToFloat(qrlSegundoCOFINS.Caption)+
                                             StrToFloat(qrlTerceiroCOFINS.Caption)]);

  qrlTrimestreIR.Caption := format('%.2f',[StrToFloat(qrlPrimeiroIR.Caption)+
                                             StrToFloat(qrlSegundoIR.Caption)+
                                             StrToFloat(qrlTerceiroIR.Caption)]);

  //
  if StrToFloat(qrlTrimestreIR.Caption) > StrToFloat(fMxSelMapaTributos.edtDeducaoIRAdicional.Text) then
    qrlRecolherIRGeral.Caption := format('%.2f',[(StrToFloat(qrlTrimestreIR.Caption)-StrToFloat(fMxSelMapaTributos.edtDeducaoIRAdicional.Text))*(10/100)]);
end;

procedure Trpt_MapaTributos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_MapaTributos.FormCreate(Sender: TObject);
begin
  Entidade := NotaFiscal1;
  vDataINI := 0;
  vDataFIM := 0;
end;

end.
