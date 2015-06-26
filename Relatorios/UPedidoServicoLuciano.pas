unit UPedidoServicoLuciano;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZReport, ZRCtrls, Funcionario, Produto, DB, DBTables,
  SQuery, Forma_de_Pagamento, Parametro, AgenteFin,
  Cliente, Pedido_de_Venda, Item_Pedido_Venda,
  Detalhe_Venda, Titulo_receber;

type
  Trpt_PedidoServicoLuciano = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupoPDV: TSZRGroup;
    zrbRodapeGrupoPDV: TSZRBand;
    Funcionario1: TFuncionario;
    zrlFiltros: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel1: TSZRLabel;
    zrlDBDataCadastro: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlCliente: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlEndereco: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlTipoLente: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlObsLente: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlTipoArmacao: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlObsArmacao: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlODEsf: TSZRLabel;
    zrlOEEsf: TSZRLabel;
    SZRLabel25: TSZRLabel;
    zrlODCil: TSZRLabel;
    zrlOECil: TSZRLabel;
    SZRLabel28: TSZRLabel;
    zrlODEixo: TSZRLabel;
    zrlOEEixo: TSZRLabel;
    SZRLabel31: TSZRLabel;
    zrlODDnp: TSZRLabel;
    zrlOEDnp: TSZRLabel;
    SZRLabel34: TSZRLabel;
    zrlODAlt: TSZRLabel;
    zrlOEAlt: TSZRLabel;
    SZRLabel37: TSZRLabel;
    zrlODAdicao: TSZRLabel;
    zrlOEAdicao: TSZRLabel;
    zrlDataEntrega: TSZRLabel;
    zrlDataPrevisao: TSZRLabel;
    SZRLabel49: TSZRLabel;
    zrlTipoPag: TSZRLabel;
    SZRLabel52: TSZRLabel;
    zrlFormaPag: TSZRLabel;
    SZRLabel50: TSZRLabel;
    zrlAgenteFinanceiro: TSZRLabel;
    SZRLabel40: TSZRLabel;
    zrlTotalPedido: TSZRLabel;
    AgenteFin1: TAgenteFin;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    SZRLabel8: TSZRLabel;
    Cliente1: TCliente;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel13: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel27: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel35: TSZRLabel;
    SZRLabel36: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel43: TSZRLabel;
    SZRLabel44: TSZRLabel;
    SZRLabel45: TSZRLabel;
    SZRLabel46: TSZRLabel;
    SZRLabel47: TSZRLabel;
    SZRLabel48: TSZRLabel;
    SZRLabel51: TSZRLabel;
    SZRLabel53: TSZRLabel;
    SZRLabel54: TSZRLabel;
    SZRLabel55: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    Detalhe_Venda1: TDetalhe_Venda;
    SZRLabel56: TSZRLabel;
    SZRLabel57: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrlMedico: TSZRLabel;
    zrlProduto1: TSZRLabel;
    zrlProduto2: TSZRLabel;
    zrlProduto4: TSZRLabel;
    zrlProduto3: TSZRLabel;
    zrlProduto6: TSZRLabel;
    zrlProduto5: TSZRLabel;
    zrlQtdPrd1: TSZRLabel;
    zrlQtdPrd2: TSZRLabel;
    zrlQtdPrd4: TSZRLabel;
    zrlQtdPrd3: TSZRLabel;
    zrlQtdPrd6: TSZRLabel;
    zrlQtdPrd5: TSZRLabel;
    zrlTotalPRD1: TSZRLabel;
    zrlTotalPRD2: TSZRLabel;
    zrlTotalPRD4: TSZRLabel;
    zrlTotalPRD3: TSZRLabel;
    zrlTotalPRD6: TSZRLabel;
    zrlTotalPRD5: TSZRLabel;
    zrlServico1: TSZRLabel;
    zrlServico2: TSZRLabel;
    zrlServico4: TSZRLabel;
    zrlServico3: TSZRLabel;
    zrlServico6: TSZRLabel;
    zrlServico5: TSZRLabel;
    zrlQtdSer1: TSZRLabel;
    zrlQtdSer2: TSZRLabel;
    zrlQtdSer4: TSZRLabel;
    zrlQtdSer3: TSZRLabel;
    zrlQtdSer6: TSZRLabel;
    zrlQtdSer5: TSZRLabel;
    zrlTotalSER1: TSZRLabel;
    zrlTotalSER2: TSZRLabel;
    zrlTotalSER4: TSZRLabel;
    zrlTotalSER3: TSZRLabel;
    zrlTotalSER6: TSZRLabel;
    zrlTotalSER5: TSZRLabel;
    SZRLabel61: TSZRLabel;
    SZRLabel62: TSZRLabel;
    SZRLabel63: TSZRLabel;
    SZRLabel64: TSZRLabel;
    SZRLabel65: TSZRLabel;
    SZRLabel66: TSZRLabel;
    zrlObservacao: TSZRLabel;
    SZRLabel67: TSZRLabel;
    zrlPasciente: TSZRLabel;
    Item_Pedido_Venda3: TItem_Pedido_Venda;
    SZRLabel21: TSZRLabel;
    zrlTipoLente2: TSZRLabel;
    SZRLabel69: TSZRLabel;
    zrlObsLente2: TSZRLabel;
    SZRLabel71: TSZRLabel;
    zrlTipoArmacao2: TSZRLabel;
    SZRLabel73: TSZRLabel;
    zrlObsArmacao2: TSZRLabel;
    SZRLabel75: TSZRLabel;
    SZRLabel76: TSZRLabel;
    SZRLabel77: TSZRLabel;
    zrlODEsf2: TSZRLabel;
    zrlOEEsf2: TSZRLabel;
    SZRLabel80: TSZRLabel;
    zrlODCil2: TSZRLabel;
    zrlOECil2: TSZRLabel;
    SZRLabel83: TSZRLabel;
    zrlODEixo2: TSZRLabel;
    zrlOEEixo2: TSZRLabel;
    SZRLabel86: TSZRLabel;
    zrlODDnp2: TSZRLabel;
    zrlOEDnp2: TSZRLabel;
    SZRLabel89: TSZRLabel;
    zrlODAlt2: TSZRLabel;
    zrlOEAlt2: TSZRLabel;
    SZRLabel92: TSZRLabel;
    zrlODAdicao2: TSZRLabel;
    zrlOEAdicao2: TSZRLabel;
    SZRLabel95: TSZRLabel;
    SZRLabel105: TSZRLabel;
    SZRLabel106: TSZRLabel;
    SZRLabel107: TSZRLabel;
    SZRLabel108: TSZRLabel;
    SZRLabel109: TSZRLabel;
    SZRLabel110: TSZRLabel;
    SZRLabel111: TSZRLabel;
    SZRLabel112: TSZRLabel;
    SZRLabel113: TSZRLabel;
    SZRLabel114: TSZRLabel;
    SZRLabel115: TSZRLabel;
    SZRLabel116: TSZRLabel;
    SZRLabel117: TSZRLabel;
    SZRLabel118: TSZRLabel;
    SZRLabel119: TSZRLabel;
    SZRLabel120: TSZRLabel;
    SZRLabel121: TSZRLabel;
    SZRLabel122: TSZRLabel;
    SZRLabel123: TSZRLabel;
    SZRLabel124: TSZRLabel;
    SZRLabel125: TSZRLabel;
    zrlMedico2: TSZRLabel;
    zrlVencimento1: TSZRLabel;
    zrlNumeroTitulo1: TSZRLabel;
    zrlValor1: TSZRLabel;
    zrlVencimento2: TSZRLabel;
    zrlNumeroTitulo2: TSZRLabel;
    zrlValor2: TSZRLabel;
    zrlVencimento3: TSZRLabel;
    zrlNumeroTitulo3: TSZRLabel;
    zrlValor3: TSZRLabel;
    zrlVencimento4: TSZRLabel;
    zrlNumeroTitulo4: TSZRLabel;
    zrlValor4: TSZRLabel;
    zrlVencimento5: TSZRLabel;
    zrlNumeroTitulo5: TSZRLabel;
    zrlVencimento6: TSZRLabel;
    zrlNumeroTitulo6: TSZRLabel;
    zrlVencimento7: TSZRLabel;
    zrlNumeroTitulo7: TSZRLabel;
    zrlVencimento8: TSZRLabel;
    zrlNumeroTitulo8: TSZRLabel;
    zrlValor8: TSZRLabel;
    zrlValor7: TSZRLabel;
    zrlValor6: TSZRLabel;
    zrlValor5: TSZRLabel;
    zrlVencimento9: TSZRLabel;
    zrlNumeroTitulo9: TSZRLabel;
    zrlValor9: TSZRLabel;
    SZRLabel130: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoPDVBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbRodapeGrupoPDVBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrlTotalSER1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vTotalPedido: Double;
  public
    Entidade: TPedido_de_Venda;
    vExibirParcelas: Boolean;
  end;

var
  rpt_PedidoServicoLuciano: Trpt_PedidoServicoLuciano;

implementation

uses UDM, Funcoes, Configuracao, MxPedidoMotCal;

{$R *.dfm}

procedure Trpt_PedidoServicoLuciano.zrbCabecalhoPaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;

  if not vExibirParcelas then
    zrbGrupoPDV.Height := 28;
end;

procedure Trpt_PedidoServicoLuciano.zrbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_PedidoServicoLuciano.zrbGrupoPDVBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
var
  vQtdSaldo: Double;
  i: integer;
  sTitulo, sDesco, sEntAnt: string;
begin
  vTotalPedido := 0;

  //Previsão e Data de Entrega
  if Entidade.DataPrevisao > 0 then
    zrlDataPrevisao.Caption := formatDateTime('dd/mm/yyyy',Entidade.DataPrevisao)
  else
    zrlDataPrevisao.Caption := '';

  if Entidade.DataEntrega > 0 then
    zrlDataEntrega.Caption := formatDateTime('dd/mm/yyyy hh:mm',Entidade.DataEntrega)
  else
    zrlDataEntrega.Caption := '';

  //Dados do Cliente
  with Cliente1 do
  Begin
    if (CodigoCLI <> Entidade.CodigoCLI) or
       (CodigoCNC <> Entidade.ClienteCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      Open;
    end;
    zrlCliente.Caption := RazaoSocial + ' ('+IntToStr(CodigoCLI)+')';
    zrlEndereco.Caption := Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);
    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + Bairro);
    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + Cidade)+'/'+Trim(Uf);
    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + CEP);
  end;

  //TipoPag
  zrlTipoPag.Caption := DM.SelecionaParametro(Entidade.TipoPag);

  //Forma de pagamento
  with Forma_de_Pagamento1 do
  Begin
    if CodigoFPG <> Entidade.CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger := Entidade.CodigoFPG;
      Open;
    end;
    zrlFormaPag.Caption := Descricao;
  end;

  //Agente Financeiro
  with AgenteFin1 do
  Begin
    if CodigoAGF <> Entidade.CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger := Entidade.CodigoAGF;
      Open;
    end;
    zrlAgenteFinanceiro.Caption := Descricao;
  end;

  if (Entidade.PagamentoAntecipado > 0) then
    zrlObservacao.Caption := 'PAG.ATECIPADO:R$ '+Format('%.2f',[Entidade.PagamentoAntecipado])+' '+Entidade.OBS
  else
    zrlObservacao.Caption := Entidade.OBS;  

  //Detalhes do Pedido
  with Detalhe_Venda1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Open;

    zrlMedico.Caption := MedicoNome;

    zrlTipoLente.Caption := TipoLentes;
    zrlObsLente.Caption := OBSLentes;
    zrlTipoArmacao.Caption := TipoArmacao;
    zrlObsArmacao.Caption := OBSArmacao;
    zrlPasciente.Caption := Pasciente;
    //
    if DM.Configuracao1.Empresa = empLuciano then
    begin
      zrlODEsf.Caption := format('%.2f',[OD_ESF]);
      zrlOEEsf.Caption := format('%.2f',[OE_ESF]);
      zrlODCil.Caption := format('%.2f',[OD_CIL]);
      zrlOECil.Caption := format('%.2f',[OE_CIL]);
      zrlODEixo.Caption := format('%.2f',[OD_EIXO]);
      zrlOEEixo.Caption := format('%.2f',[OE_EIXO]);
    end
    else
    begin
      zrlODEsf.Caption := format('%.2f',[OD_ESF+OD_CIL]);
      zrlOEEsf.Caption := format('%.2f',[OE_ESF+OE_CIL]);
      zrlODCil.Caption := format('%.2f',[-1*OD_CIL]);
      zrlOECil.Caption := format('%.2f',[-1*OE_CIL]);
      if OD_EIXO < 90 then
        zrlODEixo.Caption := format('%.2f',[OD_EIXO+90])
      else
        zrlODEixo.Caption := format('%.2f',[OD_EIXO-90]);
      if OE_EIXO < 90 then
        zrlOEEixo.Caption := format('%.2f',[OE_EIXO+90])
      else
        zrlOEEixo.Caption := format('%.2f',[OE_EIXO-90]);
    end;
    //
    zrlODDnp.Caption := format('%.2f',[OD_DNP]);
    zrlOEDnp.Caption := format('%.2f',[OE_DNP]);
    zrlODAlt.Caption := format('%.2f',[OD_ALT]);
    zrlOEAlt.Caption := format('%.2f',[OE_ALT]);
    zrlODAdicao.Caption := format('%.2f',[OD_ADICAO]);
    zrlOEAdicao.Caption := format('%.2f',[OD_ADICAO]);

    ////////////////////////
    Next;
    if not Eof then
    Begin
      zrlMedico2.Caption := MedicoNome;

      zrlTipoLente2.Caption := TipoLentes;
      zrlObsLente2.Caption := OBSLentes;
      zrlTipoArmacao2.Caption := TipoArmacao;
      zrlObsArmacao2.Caption := OBSArmacao;
      //
      if DM.Configuracao1.Empresa = empLuciano then
      begin
        zrlODEsf2.Caption := format('%.2f',[OD_ESF]);
        zrlOEEsf2.Caption := format('%.2f',[OE_ESF]);
        zrlODCil2.Caption := format('%.2f',[OD_CIL]);
        zrlOECil2.Caption := format('%.2f',[OE_CIL]);
        zrlODEixo2.Caption := format('%.2f',[OD_EIXO]);
        zrlOEEixo2.Caption := format('%.2f',[OE_EIXO]);
      end
      else
      begin
        zrlODEsf2.Caption := format('%.2f',[OD_ESF+OD_CIL]);
        zrlOEEsf2.Caption := format('%.2f',[OE_ESF+OE_CIL]);
        zrlODCil2.Caption := format('%.2f',[-1*OD_CIL]);
        zrlOECil2.Caption := format('%.2f',[-1*OE_CIL]);
        if OD_EIXO < 90 then
          zrlODEixo2.Caption := format('%.2f',[OD_EIXO+90])
        else
          zrlODEixo2.Caption := format('%.2f',[OD_EIXO-90]);
        if OE_EIXO < 90 then
          zrlOEEixo2.Caption := format('%.2f',[OE_EIXO+90])
        else
          zrlOEEixo2.Caption := format('%.2f',[OE_EIXO-90]);
      end;
      //
      zrlODDnp2.Caption := format('%.2f',[OD_DNP]);
      zrlOEDnp2.Caption := format('%.2f',[OE_DNP]);
      zrlODAlt2.Caption := format('%.2f',[OD_ALT]);
      zrlOEAlt2.Caption := format('%.2f',[OE_ALT]);
      zrlODAdicao2.Caption := format('%.2f',[OD_ADICAO]);
      zrlOEAdicao2.Caption := format('%.2f',[OD_ADICAO]);
    end;
  end;

  sTitulo := '';
  if DM.Configuracao1.Empresa = empMotical then
    if (Entidade.TipoDeVenda <> 2) and //Remessa
       (Entidade.FieldByName('PDV_TITULO_GERADO').asInteger = 0) then
      sTitulo := ' S/TRC';

  case Entidade.Situacao of
    -1: zrlSituacao.Caption:='Reserva'+sTitulo;
   0,1: zrlSituacao.Caption:='Recepcao';
     2: with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT TOP 1 PRD_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
            ' AND IPV_SITUACAO<>3 '+
            ' AND IPV_SERVICO=1 ';
          Open;
          if isEmpty then
            zrlSituacao.Caption:='Qualidade'
          else
            zrlSituacao.Caption:='Laboratorio';
        end;
     3: zrlSituacao.Caption:='Pronto p/Entrega';
     4: zrlSituacao.Caption:='Finalizada'+sTitulo;
     5: zrlSituacao.Caption:='Cons. Fin.'+sTitulo;
     6: zrlSituacao.Caption:='Cancelada'+sTitulo;
     7: zrlSituacao.Caption:='Cons. Canc.'+sTitulo;
     8: zrlSituacao.Caption:='Devolvida'+sTitulo;
     9: zrlSituacao.Caption:='Cons. Dev.'+sTitulo;
    10: zrlSituacao.Caption:='Canc.Não Apr.'+sTitulo;
    11: zrlSituacao.Caption:='Finalizado'+sTitulo;
  end;

  with Item_Pedido_Venda1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Open;
    i := 1;
    while not EOF do
    Begin
      if DM.Configuracao1.Empresa = empMotical then //Motical
      Begin
        sDesco := '';
        DM.QR_Consultas.Close;
        DM.QR_Consultas.SQL.Text := 'SELECT * '+
            ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
            ' WHERE I1.GRP_CODIGO='+IntToStr(FieldByName('GRP_CODIGO').asInteger)+
            ' AND I1.SGP_CODIGO='+IntToStr(FieldByName('SGP_CODIGO').asInteger)+
            ' AND I1.ITS_SITUACAO=0 '+
            ' AND T1.TPS_SITUACAO=0 '+
            ' AND T1.TPS_LABORATORIO=1 '+  //Laboratório Principal
            ' AND T1.TPS_PRINCIPAL=1 '+    //Tabela Principal
            ' AND (T1.CNC_CODIGO='+IntToStr(CodigoCNC)+
            ' OR T1.CNC_CODIGO=1) '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO ';
        DM.QR_Consultas.Open;
        if not DM.QR_Consultas.IsEmpty then
          if (Arredonda(PrecoDesc) < Arredonda(DM.QR_Consultas.FieldByName('ITS_PRECO_VENDA').asFloat)) then
            sDesco := ' ('+format('%.2f',[(1-PrecoDesc/DM.QR_Consultas.FieldByName('ITS_PRECO_VENDA').asFloat)*100])+'%)';
      end
      else //Não é Motical
      Begin
        if Trim(FieldByName('IPV_OBSERVACAO').asString) <> '' then
          sDesco := '('+FieldByName('IPV_OBSERVACAO').asString+')'
        else
          sDesco := '';
      end;

      sEntAnt := '';
      //Verificar Entrega Antecipada
      if DM.Configuracao1.Empresa = empLuciano then
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
            ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
            ' WHERE MEF_ENT_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPDV)+
            ' AND CNC_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoCNC)+
            ' AND PRD_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPRD)+
            ' AND MEF_TIPO_MOV=4200 '; //Entrega Antecipada
          Open;
          vQtdSaldo := FieldByName('QTD').asFloat;

          Close;
          SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
            ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
            ' WHERE MEF_ENT_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPDV)+
            ' AND CNC_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoCNC)+
            ' AND PRD_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPRD)+
            ' AND MEF_TIPO_MOV=4210 '; //Ext. Entrega Antecipada
          Open;
          vQtdSaldo := vQtdSaldo - FieldByName('QTD').asFloat;

          if vQtdSaldo > 0 then
            sEntAnt := '['+IntToStr(Trunc(vQtdSaldo))+']';
        end;
      end;

      vTotalPedido := vTotalPedido + Arredonda((Quantidade-Bonificacao)*Arredonda(PrecoDesc));
      case i of
        1: Begin
             zrlProduto1.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd1.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD1.Caption := format('%.2f',[(Quantidade-Bonificacao)*Arredonda(PrecoDesc)]);
           end;
        2: Begin
             zrlProduto2.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd2.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD2.Caption := format('%.2f',[(Quantidade-Bonificacao)*Arredonda(PrecoDesc)]);
           end;
        3: Begin
             zrlProduto3.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd3.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD3.Caption := format('%.2f',[(Quantidade-Bonificacao)*Arredonda(PrecoDesc)]);
           end;
        4: Begin
             zrlProduto4.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd4.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD4.Caption := format('%.2f',[(Quantidade-Bonificacao)*Arredonda(PrecoDesc)]);
           end;
        5: Begin
             zrlProduto5.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd5.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD5.Caption := format('%.2f',[(Quantidade-Bonificacao)*Arredonda(PrecoDesc)]);
           end;
        6: Begin
             zrlProduto6.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd6.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD6.Caption := format('%.2f',[(Quantidade-Bonificacao)*Arredonda(PrecoDesc)]);
           end;
      end;
      inc(i);
      Next;
    end;
  end;

  with Item_Pedido_Venda2 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Open;
    i := 1;
    while not EOF do
    Begin
      if DM.Configuracao1.Empresa = empMotical then //Motical
      Begin
        sDesco := '';
        if Arredonda(PrecoDesc) < Arredonda(FieldByName('PRD_PRECO_VENDA').asFloat) then
          sDesco := ' ('+format('%.2f',[(1-PrecoDesc/FieldByName('PRD_PRECO_VENDA').asFloat)*100])+'%)';
      end;
      vTotalPedido := vTotalPedido + Arredonda((Quantidade-Bonificacao)*PrecoDesc);
      case i of
        1: Begin
             zrlServico1.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER1.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER1.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        2: Begin
             zrlServico2.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER2.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER2.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        3: Begin
             zrlServico3.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER3.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER3.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        4: Begin
             zrlServico4.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER4.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER4.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        5: Begin
             zrlServico5.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER5.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER5.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        6: Begin
             zrlServico6.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER6.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER6.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
      end;
      inc(i);
      Next;
    end;
  end;

  if vExibirParcelas then
  Begin
    Titulo_receber1.Close;
    Titulo_receber1.ParamByName('CNC_CODIGO').asInteger:= Entidade.CodigoCNC;
    Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:= Entidade.CodigoPDV;
    Titulo_receber1.Open;
    for i:=1 to Titulo_receber1.RecordCount do
    Begin
      if i = 1 then
      Begin
        zrlNumeroTitulo1.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento1.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor1.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 2 then
      Begin
        zrlNumeroTitulo2.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento2.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor2.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 3 then
      Begin
        zrlNumeroTitulo3.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento3.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor3.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 4 then
      Begin
        zrlNumeroTitulo4.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento4.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor4.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 5 then
      Begin
        zrlNumeroTitulo5.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento5.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor5.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 6 then
      Begin
        zrlNumeroTitulo6.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento6.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor6.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 7 then
      Begin
        zrlNumeroTitulo7.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento7.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor7.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 8 then
      Begin
        zrlNumeroTitulo8.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento8.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor8.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 9 then
      Begin
        zrlNumeroTitulo9.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento9.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor9.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end;
      Titulo_receber1.Next;
    end;
  end;
end;

procedure Trpt_PedidoServicoLuciano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := CaFree;
end;

procedure Trpt_PedidoServicoLuciano.zrbRodapeGrupoPDVBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlTotalPedido.Caption := format('%.2f',[vTotalPedido]);
end;

procedure Trpt_PedidoServicoLuciano.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  zrbDetalhe.Height := 0;
  vExibirParcelas := False;
end;

procedure Trpt_PedidoServicoLuciano.zrlTotalSER1BeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  If not DM.Usuario1.Permissoes.IndexOf(IntToStr(7960)) = 0 then
    DoPrint := False
  else
  begin
    if (Tag = 1) and (fMxPedidoMotCal.SairPreco=False) then
      DoPrint := False;
  end;
end;

end.
