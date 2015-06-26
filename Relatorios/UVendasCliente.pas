unit UVendasCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Variants, Titulo_receber,
  AgenteFin, Forma_de_Pagamento, Funcionario, Parametro, Cliente, Produto,
  Item_Pedido_Venda, CentroCusto;

type
  Trpt_VendasCliente = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrb_detalhe: TSZRBand;
    zrlTitulo: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrbParcelas: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    ZRDBText10: TSZRDBText;
    zrbTotalGeral: TSZRBand;
    ZRLabel21: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    zrlSubTotal: TSZRLabel;
    Produto1: TProduto;
    SZRLabel1: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Cliente1: TCliente;
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
    Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField;
    Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1IPV_NOTA: TIntegerField;
    Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1CNC_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1CLI_CODIGO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_DATA_HORA: TDateTimeField;
    Item_Pedido_Venda1PDV_LISTADO: TIntegerField;
    Item_Pedido_Venda1PDV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1PDV_DIAS_RESERV: TIntegerField;
    Item_Pedido_Venda1PDV_NOTA_FISCAL: TSmallintField;
    Item_Pedido_Venda1AGF_CODIGO: TIntegerField;
    Item_Pedido_Venda1FPG_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_TIPO_PAG: TIntegerField;
    Item_Pedido_Venda1PDV_ENTRADA: TFloatField;
    Item_Pedido_Venda1CNC_CLIENTE: TIntegerField;
    Item_Pedido_Venda1PDV_EM_USO: TIntegerField;
    zrlTracoDuploParcela: TSZRLabel;
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1PDV_ACRESCIMO: TFloatField;
    Item_Pedido_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1PDV_MAQUINA: TIntegerField;
    zrlVendedor: TSZRLabel;
    Funcionario1: TFuncionario;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    SZRLabel54: TSZRLabel;
    SZRLabel55: TSZRLabel;
    zrbCabecalhoPedido: TSZRGroup;
    ZRLabel24: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel19: TSZRLabel;
    zrlDescData: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlData: TSZRLabel;
    zrlApelido: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCidade: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlConjuge: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlPaiMae: TSZRLabel;
    SZRLabel28: TSZRLabel;
    zrlProfissaoLocalTrabalho: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel32: TSZRLabel;
    zrlRGCGF: TSZRLabel;
    SZRLabel34: TSZRLabel;
    zrlCPFCNPJ: TSZRLabel;
    SZRLabel36: TSZRLabel;
    zrlFone: TSZRLabel;
    SZRLabel38: TSZRLabel;
    zrlDataNascimento: TSZRLabel;
    SZRLabel42: TSZRLabel;
    zrlSituacao: TSZRLabel;
    szrVendedor: TSZRLabel;
    SZRLabel47: TSZRLabel;
    zrlFormaDePagamento: TSZRLabel;
    SZRLabel49: TSZRLabel;
    SZRLabel50: TSZRLabel;
    zrlAgenteFinanceiro: TSZRLabel;
    SZRLabel52: TSZRLabel;
    zrlTipoDePagamento: TSZRLabel;
    szrOK: TSZRLabel;
    zrlOK: TSZRLabel;
    szrNota: TSZRLabel;
    zrlNotaFiscal: TSZRLabel;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField;
    Item_Pedido_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    SZRLabel2: TSZRLabel;
    zrlDescCodigoPDV: TSZRLabel;
    zdbCodigoPDV: TSZRDBText;
    SZRLabel64: TSZRLabel;
    SZRLabel65: TSZRLabel;
    SZRLabel66: TSZRLabel;
    zrlCondicaoDePagamento: TSZRLabel;
    SZRLabel68: TSZRLabel;
    SZRLabel69: TSZRLabel;
    SZRLabel70: TSZRLabel;
    SZRLabel71: TSZRLabel;
    SZRLabel72: TSZRLabel;
    SZRLabel73: TSZRLabel;
    SZRLabel74: TSZRLabel;
    SZRLabel75: TSZRLabel;
    SZRLabel76: TSZRLabel;
    SZRLabel77: TSZRLabel;
    SZRLabel78: TSZRLabel;
    SZRLabel79: TSZRLabel;
    SZRLabel80: TSZRLabel;
    SZRLabel81: TSZRLabel;
    SZRLabel82: TSZRLabel;
    SZRLabel83: TSZRLabel;
    SZRLabel84: TSZRLabel;
    SZRLabel85: TSZRLabel;
    SZRLabel86: TSZRLabel;
    SZRLabel87: TSZRLabel;
    SZRLabel88: TSZRLabel;
    SZRLabel90: TSZRLabel;
    SZRLabel91: TSZRLabel;
    SZRLabel92: TSZRLabel;
    SZRLabel93: TSZRLabel;
    SZRLabel94: TSZRLabel;
    SZRLabel95: TSZRLabel;
    SZRLabel96: TSZRLabel;
    SZRLabel97: TSZRLabel;
    SZRLabel98: TSZRLabel;
    SZRLabel99: TSZRLabel;
    SZRLabel100: TSZRLabel;
    SZRLabel101: TSZRLabel;
    SZRLabel102: TSZRLabel;
    SZRLabel103: TSZRLabel;
    SZRLabel104: TSZRLabel;
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
    SZRLabel126: TSZRLabel;
    SZRLabel127: TSZRLabel;
    SZRLabel128: TSZRLabel;
    SZRLabel129: TSZRLabel;
    SZRLabel130: TSZRLabel;
    SZRLabel131: TSZRLabel;
    SZRLabel132: TSZRLabel;
    SZRLabel133: TSZRLabel;
    SZRLabel134: TSZRLabel;
    SZRLabel135: TSZRLabel;
    SZRLabel136: TSZRLabel;
    SZRLabel137: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    SZRLabel138: TSZRLabel;
    SZRLabel139: TSZRLabel;
    Item_Pedido_Venda1PDV_NOTA_CUPOM: TIntegerField;
    zrlNotaCupom: TSZRLabel;
    SZRLabel140: TSZRLabel;
    SZRLabel141: TSZRLabel;
    SZRLabel142: TSZRLabel;
    SZRLabel143: TSZRLabel;
    SZRLabel144: TSZRLabel;
    SZRLabel145: TSZRLabel;
    SZRLabel146: TSZRLabel;
    SZRLabel147: TSZRLabel;
    SZRLabel148: TSZRLabel;
    SZRLabel149: TSZRLabel;
    SZRLabel150: TSZRLabel;
    SZRLabel151: TSZRLabel;
    SZRLabel152: TSZRLabel;
    SZRLabel153: TSZRLabel;
    SZRLabel154: TSZRLabel;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    SZRLabel3: TSZRLabel;
    zrlDescDataCabecalho: TSZRLabel;
    SZRLabel156: TSZRLabel;
    SZRLabel157: TSZRLabel;
    SZRLabel158: TSZRLabel;
    SZRLabel159: TSZRLabel;
    SZRLabel160: TSZRLabel;
    SZRLabel161: TSZRLabel;
    SZRLabel162: TSZRLabel;
    SZRLabel163: TSZRLabel;
    zrlCodigoFUN: TSZRLabel;
    zrlAV_PZ: TSZRLabel;
    zrbCabecalhoFUN: TSZRGroup;
    zrbTotalVendedor: TSZRBand;
    zrlTotalPedido: TSZRLabel;
    SZRLabel165: TSZRLabel;
    zrlTotalVendedor: TSZRLabel;
    SZRLabel167: TSZRLabel;
    zrlDtAlteracao: TSZRLabel;
    zrlDescVendedorCabecalho: TSZRLabel;
    zrlVendedorCabecalho: TSZRLabel;
    zrbCabecalhoCNC: TSZRGroup;
    SZRLabel171: TSZRLabel;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrbTotalCentro: TSZRBand;
    SZRLabel173: TSZRLabel;
    zrlTotalCentro: TSZRLabel;
    Item_Pedido_Venda1PDV_OBS: TStringField;
    Item_Pedido_Venda1PDV_TOTAL: TFloatField;
    Item_Pedido_Venda1PDV_IMPRESSO: TIntegerField;
    zrlCEP: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlProduto: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel22: TSZRLabel;
    zrlCodigoPRD: TSZRLabel;
    SZRLabel40: TSZRLabel;
    zrlNumeroItem: TSZRLabel;
    SZRLabel41: TSZRLabel;
    zrlCodigoCNC: TSZRDBText;
    SZRLabel44: TSZRLabel;
    zrlTotalRegistro: TSZRLabel;
    SZRLabel45: TSZRLabel;
    zrlValorUnitario: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlUsuario: TSZRLabel;
    Item_Pedido_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Item_Pedido_Venda1PDV_CONTATO: TStringField;
    Item_Pedido_Venda1PDV_CREDITO: TFloatField;
    Item_Pedido_Venda1FUN_ARQUITETO: TIntegerField;
    Item_Pedido_Venda1PDV_TITULO_GERADO: TIntegerField;
    Item_Pedido_Venda1PDV_TIPO_VENDA: TIntegerField;
    Item_Pedido_Venda1PDV_PACOTE: TIntegerField;
    Item_Pedido_Venda1PDV_GRUPO_ESPECIAL: TIntegerField;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_PREVISAO: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_ENTREGA: TDateTimeField;
    Item_Pedido_Venda1PDV_DOCUMENTO: TStringField;
    Item_Pedido_Venda1PDV_CAIXA: TStringField;
    Item_Pedido_Venda1PDV_SERVICO: TIntegerField;
    Item_Pedido_Venda1PDV_FONE_CONTATO: TStringField;
    zrlDescFax: TSZRLabel;
    zrlFax: TSZRLabel;
    SZRLabel46: TSZRLabel;
    zrlCelular: TSZRLabel;
    zrlObservacao: TSZRLabel;
    zrlPacote: TSZRLabel;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1FPE_CODIGO: TIntegerField;
    Item_Pedido_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    zrlAssinatura: TSZRLabel;
    zrlDescReimpressao: TSZRLabel;
    Item_Pedido_Venda1IPV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Venda1IPV_VINCULO: TIntegerField;
    Item_Pedido_Venda1IPV_SEQUENCIA: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1PDV_DT_FPE: TDateTimeField;
    Item_Pedido_Venda1CNT_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_GARANTIA: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Item_Pedido_Venda1PDV_FRETE: TFloatField;
    labPrecoSugerido: TSZRLabel;
    zrlPrecoSugerido: TSZRLabel;
    zrlCaixa: TSZRLabel;
    zrlFiscal: TSZRLabel;
    Item_Pedido_Venda1IPV_FISCAL: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbTotalGeralBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrb_detalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbParcelasBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPedidoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalVendedorAfterPrint(Sender: TObject; Printed: Boolean);
    procedure zrbCabecalhoFUNBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalVendedorBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalCentroBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure LimpaCampos;
    procedure FormCreate(Sender: TObject);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistrosGrupo, TotalRegistros, TotalItens, NumeroItem : integer;
  public
    Total,SubTotal, TotalCentro, TotMov, TotQtd, TotalFUN:Double;
    QtdAcimaNormal : Boolean;
  end;

var
  rpt_VendasCliente: Trpt_VendasCliente;

implementation
Uses
  UDM, MxSVendasCliente, Funcoes;
{$R *.DFM}

procedure Trpt_VendasCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Active := False;
  Cliente1.Active := False;
  Item_Pedido_Venda1.Active := False;
  Action := cafree;
end;

procedure Trpt_VendasCliente.zrbTotalGeralBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbCabecalhoPedido.Height = 0 then
    zrlTotalRegistros.Caption := IntToStr(TotalItens)
  else
    zrlTotalRegistros.Caption := IntToStr(TotalRegistros);

  if self.tag <> 1 then
  Begin
    zrlTotalGeral.Caption:=Format('%.2f',[Total]);
    SZRLabel54.Caption:=Format('%.2f',[TotQtd]);
  end
  else
    zrbTotalGeral.Height := 0;
end;

procedure Trpt_VendasCliente.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sProduto, sDesco: string;
begin
  zrlNumeroItem.Caption:=preencheZero(3,NumeroItem);
  inc(NumeroItem);

  //Contar total de itens
  inc(TotalItens);

  zrlCodigoPRD.Caption := preencheZero(7,Item_Pedido_Venda1.CodigoPRD);

  if QtdAcimaNormal then
  Begin
    if Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').asDateTime > 0 then
    Begin
      zrlVendedor.Enabled := True;
      zrlVendedor.Left := 125;
      zrlVendedor.Caption := DateToStr(Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').asDateTime);
    end
    else
      zrlVendedor.Caption := '';
  end;

  with Produto1 do
  Begin
    if Item_Pedido_Venda1.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
      Open;
    end;
    if not QtdAcimaNormal then
    Begin
      if DM.Configuracao1.Empresa = empEletro then
        sProduto := Trim(Trim(Descricao+' '+' '+Caracteristica)+' '+Referencia+', '+Marca)
      else if DM.Configuracao1.Empresa = empPetromax then
        sProduto := Trim(Descricao+' '+Referencia)
      else if DM.Configuracao1.Empresa = empMotical then
      Begin
        sDesco := '';
        if (Item_Pedido_Venda1.FieldByName('PDV_SERVICO').asInteger = 1) and //Produto vendido no Laboratório
           (not Item_Pedido_Venda1.Servico) then
        Begin
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT * '+
              ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
              ' WHERE I1.GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
              ' AND I1.SGP_CODIGO='+IntToStr(Produto1.CodigoSGP)+
              ' AND I1.ITS_SITUACAO=0 '+
              ' AND T1.TPS_SITUACAO=0 '+
              ' AND T1.TPS_LABORATORIO=1 '+  //Laboratório Principal
              ' AND T1.TPS_PRINCIPAL=1 '+    //Tabela Principal
              ' AND (T1.CNC_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoCNC)+
              ' OR T1.CNC_CODIGO=1) '+
              ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND T1.TPS_CODIGO=I1.TPS_CODIGO ';
            Open;
            if not IsEmpty then
              if (Arredonda(Item_Pedido_Venda1.PrecoDesc) < Arredonda(FieldByName('ITS_PRECO_VENDA').asFloat)) then
                sDesco := ' ('+format('%.2f',[(1-Item_Pedido_Venda1.PrecoDesc/FieldByName('ITS_PRECO_VENDA').asFloat)*100])+'%)';
          end;
        end
        else
          if Arredonda(Item_Pedido_Venda1.PrecoDesc) < Arredonda(Produto1.Precovenda) then
            sDesco := ' ('+format('%.2f',[(1-Item_Pedido_Venda1.PrecoDesc/Produto1.Precovenda)*100])+'%)';

        if Item_Pedido_Venda1.Observacao <> '' then
          sProduto := Descricao+' '+'('+Item_Pedido_Venda1.Observacao+')'+sDesco//Nome do Paciente
        else
          sProduto := Trim(Descricao+' '+sDesco);
      end
      else if DM.Configuracao1.Empresa = empLuciano then
      begin
        sProduto := trim('L'+IntToStr(Item_Pedido_Venda1.CodigoLOT)+' '+Descricao+' '+Referencia+', '+Marca);
        if Item_Pedido_Venda1.FieldByName('IPV_FISCAL').AsInteger = 1 then
          zrlFiscal.Enabled := True
        else
          if Item_Pedido_Venda1.FieldByName('IPV_FISCAL').AsInteger = 0 then
            zrlFiscal.Enabled := False
          else
            zrlFiscal.Enabled := False;
      end
      else
        sProduto := trim(Descricao+' '+Referencia+', '+Marca);
    end
    else
    Begin
      zrlProduto.Width := 92;
      if DM.Configuracao1.Empresa = 1 then
        sProduto := PreencheEspaco(40,Trim(Descricao+' '+Caracteristica))+' '+PreencheEspaco(20,Referencia)+
                      ' '+PreencheEspaco(20,Marca)
      else
        sProduto := PreencheEspaco(40,Descricao)+' '+PreencheEspaco(20,Referencia)+
                      ' '+PreencheEspaco(20,Marca);
      Exit;
    end;
  end;

  //
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    zrlPrecoSugerido.Enabled := True;
    zrlPrecoSugerido.Caption := format('%.2f',[Item_Pedido_Venda1.PrecoSugerido]);
  end
  else
  begin
    zrlPrecoSugerido.Enabled := False;
    zrlProduto.Width := zrlProduto.Width + 11;
  end;

  if Item_Pedido_Venda1.Bonificacao > 0 then
    sProduto := sProduto + '(B:'+Format('%.2f',[Item_Pedido_Venda1.Bonificacao])+')';

  if Length(sProduto) <= zrlProduto.Width then
    zrlProduto.Caption := sProduto
  else
    zrlProduto.Caption := Copy(sProduto,1,zrlProduto.Width);

  If (Item_Pedido_Venda1.PrecoDesc<>0) or (DM.Configuracao1.Empresa <> empEletro) THEN
  Begin
    TotalFUN   :=TotalFUN+   Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao));
    SubTotal   :=SubTotal+   Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao));
    Total      :=Total+      Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao));
    TotalCentro:=TotalCentro+Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao));
  end
  Else
  Begin
    TotalFUN   :=TotalFUN+   Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao));
    SubTotal   :=SubTotal+   Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao));
    Total      :=Total+      Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao));
    TotalCentro:=TotalCentro+Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao));
  end;

  if DM.Configuracao1.Empresa = empEletro then
  Begin
    with Funcionario1 do
    Begin
      if (Item_Pedido_Venda1.CodigoFUN <> CodigoFUN) then
      Begin
        Close;
        ParamByName('FUN_CODIGO').asInteger := Item_Pedido_Venda1.CodigoFUN;
        Open;
      end;
      zrlVendedor.Caption := Apelido;
    end;
  end
  //Alan - Acrescentado em 24/02/2006 Quase Carnaval
  else
  begin
    //Percentual de Desconto
    zrlVendedor.Alignment := taRightJustify;
    zrlVendedor.Left := 92;
    zrlVendedor.Top := 0;
    zrlVendedor.Enabled := True;
    zrlVendedor.Caption := Format('%.2f', [Item_Pedido_Venda1.FieldByName('IPV_DESCONTO').AsFloat]);
  end;

  TotQtd:=TotQtd+Item_Pedido_Venda1.Quantidade;

  if (DM.Configuracao1.Empresa = empLBM) then
  Begin
    case Item_Pedido_Venda1.Pendencia of
      0:zrlOK.Caption:='OK';
      1:zrlOK.Caption:='PD';
      2:zrlOK.Caption:='PQ';
      3:zrlOK.Caption:='PT';
    end;
  end
  else
    zrlOK.Enabled := False;

  //
  //Definir Preço Unitário
  if (Item_Pedido_Venda1.PrecoDesc > 0) or (DM.Configuracao1.Empresa <> empEletro) then
  Begin
    zrlValorUnitario.Caption := format('%.2f',[Item_Pedido_Venda1.PrecoDesc]);
    zrlTotalItem.Caption     := format('%.2f',[Arredonda(Item_Pedido_Venda1.PrecoDesc)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao)]);
  end
  else
  Begin
    zrlValorUnitario.Caption := format('%.2f',[Item_Pedido_Venda1.Preco]);
    zrlTotalItem.Caption     := format('%.2f',[Arredonda(Item_Pedido_Venda1.Preco)*(Item_Pedido_Venda1.Quantidade-Item_Pedido_Venda1.Bonificacao)]);
  end;
end;

procedure Trpt_VendasCliente.zrbParcelasBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  i:integer;
begin
  if self.tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSVendasCliente.ckbCodigoPDV.Checked then
    Begin
      if not (DM.Configuracao1.Empresa in [empLuciano,empMotical]) then
        if report.CurrentY <= 42 then
          report.CurrentY := 42
        else
          report.NewPage;
      zrlTracoDuploParcela.Enabled := False;
      zrbTotalVendedor.Height := 0;
      zrbTotalCentro.Height := 0;
      zrbTotalGeral.Height  := 0;
    end;
  end
  else if (self.tag in [1,2,3]) then //LBM
  Begin
    if (self.tag <> 3) then //Imprimir a partir do Pedido de Venda
    Begin
      if not (DM.Configuracao1.Empresa in [empLuciano,empMotical]) then
      Begin
        if (report.CurrentY <= 42) then
          report.CurrentY := 42
        else
        Begin
          report.NewPage;
          report.CurrentY := 42;
        end;
      end;
    end;
    zrlTracoDuploParcela.Enabled := False;
    zrbTotalVendedor.Height := 0;
    zrbTotalCentro.Height := 0;
    zrbTotalGeral.Height  := 0;
  end;
  zrlCondicaoDePagamento.Caption := AgenteFin1.Descricao;
  zrlSubTotal.Caption:=Format('%.2f',[SubTotal]);
  SubTotal:=0;
  if self.tag = 0 then
    if not fMxSVendasCliente.ckbExibirParcelas.Checked then
      Exit;
  if (DM.Configuracao1.Empresa = empLBM) and
     (Item_Pedido_Venda1.FieldByName('PDV_SITUACAO').asInteger=2) then
  Begin
    SZRLabel138.Enabled:=False;
    SZRLabel139.Enabled:=False;
  end;

  if zrbParcelas.Height > 3 then
  Begin
    Titulo_receber1.Close;
    Titulo_receber1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
    Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPDV;
    Titulo_receber1.Open;
    Titulo_receber1.First;
    LimpaCampos;
    for i:=1 to Titulo_receber1.RecordCount do
    Begin
      if i = 1 then
      Begin
        SZRLabel143.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel102.Caption:=Titulo_receber1.Sequencia;
        SZRLabel103.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel104.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 2 then
      Begin
        SZRLabel144.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel105.Caption:=Titulo_receber1.Sequencia;
        SZRLabel106.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel107.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 3 then
      Begin
        SZRLabel145.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel108.Caption:=Titulo_receber1.Sequencia;
        SZRLabel109.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel110.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 4 then
      Begin
        SZRLabel146.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel111.Caption:=Titulo_receber1.Sequencia;
        SZRLabel112.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel113.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 5 then
      Begin
        SZRLabel147.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel114.Caption:=Titulo_receber1.Sequencia;
        SZRLabel115.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel116.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 6 then
      Begin
        SZRLabel148.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel117.Caption:=Titulo_receber1.Sequencia;
        SZRLabel118.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel119.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 7 then
      Begin
        SZRLabel149.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel120.Caption:=Titulo_receber1.Sequencia;
        SZRLabel121.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel122.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 8 then
      Begin
        SZRLabel150.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel123.Caption:=Titulo_receber1.Sequencia;
        SZRLabel124.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel125.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 9 then
      Begin
        SZRLabel151.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel126.Caption:=Titulo_receber1.Sequencia;
        SZRLabel127.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel128.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 10 then
      Begin
        SZRLabel152.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel129.Caption:=Titulo_receber1.Sequencia;
        SZRLabel130.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel131.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 11 then
      Begin
        SZRLabel153.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel132.Caption:=Titulo_receber1.Sequencia;
        SZRLabel133.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel134.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 12 then
      Begin
        SZRLabel154.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel135.Caption:=Titulo_receber1.Sequencia;
        SZRLabel136.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel137.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end;
      Titulo_receber1.Next;
    end;
  end;
end;

procedure Trpt_VendasCliente.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_VendasCliente.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if self.tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSVendasCliente.rdgDataCadastro1.Checked then
      zrlDescDataCabecalho.Caption := 'Data'
    else if fMxSVendasCliente.rdgDataAlterado.Checked then
      zrlDescDataCabecalho.Caption := 'Dt.Alt'
    else if fMxSVendasCliente.rdgDataEmissao.Checked then
      zrlDescDataCabecalho.Caption := 'Dt.Emi'
    else if fMxSVendasCliente.rdgDataDevolucao.Checked then
      zrlDescDataCabecalho.Caption := 'Dt.Dev'
    else if fMxSVendasCliente.rdgDataEntrega.Checked then
      zrlDescDataCabecalho.Caption := 'Dt.Ent'
    else if fMxSVendasCliente.rdgDataPrevisao.Checked then
      zrlDescDataCabecalho.Caption := 'Dt.Pre';
  end
  else
    zrlDescDataCabecalho.Caption := 'Data';
end;

procedure Trpt_VendasCliente.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=0;
  SubTotal:=0;
  TotQtd:=0;
end;

procedure Trpt_VendasCliente.zrbCabecalhoPedidoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vTotalPed : Double;
  sTitulo, sTipoVenda: string;
begin
  NumeroItem := 1;
  inc(TotalRegistros);
  inc(TotalRegistrosGrupo);  
  if Item_Pedido_Venda1.FieldByName('PDV_DT_ALTERADO').AsDateTime > 0 then
    zrlDtAlteracao.Caption := formatDateTime('dd/mm/yyyy',Item_Pedido_Venda1.FieldByName('PDV_DT_ALTERADO').AsDateTime)
  else
    zrlDtAlteracao.Caption := '';

  zrlCodigoFUN.Caption := IntToStr(Item_Pedido_Venda1.CodigoFUN);

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM((IPV_QUANTIDADE-IPV_BONIFICACAO)*ROUND(IPV_PRECO_DESC,2)) AS TOTAL '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPDV);
    Open;
    vTotalPed := FieldByName('TOTAL').asFloat;
    zrlTotalPedido.Caption := format('%.2f',[vTotalPed+Item_Pedido_Venda1.FieldByName('PDV_ACRESCIMO').asFloat]);
  end;

  case Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger of
    1 : zrlAV_PZ.Caption := 'AV'
  else
    zrlAV_PZ.Caption := 'PZ';
  end;

  //Código do Pacote
  if Item_Pedido_Venda1.FieldByName('PDV_PACOTE').asInteger > 0 then
    zrlPacote.Caption := IntToStr(Item_Pedido_Venda1.FieldByName('PDV_PACOTE').asInteger);

  with Cliente1 do
  Begin
    if (Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger <> CodigoCLI) or
       (Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger;
      Open;
    end;
    zrlCliente.Caption:=RazaoSocial+' ('+IntToStr(Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger)+')';
    zrlApelido.Caption:=NomeFantasia;
    zrlFone.Caption:=Fone;
    if Fax = '' then
      zrlDescFax.Enabled := False
    else
    Begin
      zrlDescFax.Enabled := True;    
      zrlFax.Caption:=Fax;
    end;
    zrlCelular.Caption:=Celular;
    zrlRGCGF.Caption:=CGFRG;
    zrlCPFCNPJ.Caption:=CPFCGC;
    if DataNascimento > 0 then
      zrlDataNascimento.Caption:=formatDateTime('dd/mm/yyyy',DataNascimento)
    else
      zrlDataNascimento.Caption:='';

    zrlEndereco.Caption := Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);
    zrlBairro.Caption:=Bairro;
    zrlCidade.Caption:=Trim(Cidade)+'/'+Trim(Uf);
    zrlCEP.Caption := CEP;
    if (self.tag = 0) then
    Begin
      if fMxSVendasCliente.ckbSintetico.Checked and PessoaFisica then
        zrlPaiMae.Caption:=AbreviarNome(RazaoSocial)
      else
      Begin
        if Trim(Pai) <> '' then
          if Trim(Mae) <> '' then
            zrlPaiMae.Caption:=Trim(Pai)+'/'+Trim(Mae)
          else
            zrlPaiMae.Caption:=Trim(Pai)
        else
          zrlPaiMae.Caption:=Trim(Mae);
      end;
    end
    else
    Begin
      if Trim(Pai) <> '' then
        if Trim(Mae) <> '' then
          zrlPaiMae.Caption:=Trim(Pai)+'/'+Trim(Mae)
        else
          zrlPaiMae.Caption:=Trim(Pai)
      else
        zrlPaiMae.Caption:=Trim(Mae);
    end;
    if PessoaFisica then
      zrlProfissaoLocalTrabalho.Caption := Trim(Profissao+' '+LocalTrabalho)
    else
      zrlProfissaoLocalTrabalho.Caption := '';


    if zrlCaixa.Enabled then //Sintético para ótica
    Begin
      if Item_Pedido_Venda1.FieldByName('PDV_CAIXA').asString <> '' then
        zrlCaixa.Caption := 'C:'+Item_Pedido_Venda1.FieldByName('PDV_CAIXA').asString;
      if Item_Pedido_Venda1.FieldByName('PDV_DOCUMENTO').asString <> '' then
      Begin
        if zrlCaixa.Caption <> '' then
          zrlCaixa.Caption := zrlCaixa.Caption + '|';
        zrlCaixa.Caption := zrlCaixa.Caption + 'D:'+Item_Pedido_Venda1.FieldByName('PDV_DOCUMENTO').asString;
      end;
    end;

    zrlObservacao.Caption := '';
    if Trim(Item_Pedido_Venda1.FieldByName('PDV_DOCUMENTO').asString) <> '' then
      zrlObservacao.Caption := 'Doc: '+Trim(Item_Pedido_Venda1.FieldByName('PDV_DOCUMENTO').asString)+' ';
    if Trim(Item_Pedido_Venda1.FieldByName('PDV_CAIXA').asString) <> '' then
      zrlObservacao.Caption := zrlObservacao.Caption + 'Caixa: '+Trim(Item_Pedido_Venda1.FieldByName('PDV_CAIXA').asString)+' ';

    if Item_Pedido_Venda1.FieldByName('PDV_GARANTIA').asInteger > 0 then
      zrlObservacao.Caption := zrlObservacao.Caption + 'Gt: '+Item_Pedido_Venda1.FieldByName('PDV_GARANTIA').asString+' ';

    if DM.Configuracao1.Empresa = empEletro then
    Begin
      zrlObservacao.Caption := zrlObservacao.Caption + Trim(Referencia1);
      if (zrlObservacao.Caption <> '') then
        zrlObservacao.Caption := zrlObservacao.Caption + ' / ';
      zrlObservacao.Caption := zrlObservacao.Caption + Referencia2;
      if (zrlObservacao.Caption <> '') then
        zrlObservacao.Caption := zrlObservacao.Caption + ' / ';
      zrlObservacao.Caption := zrlObservacao.Caption + Referencia3;
      if (zrlObservacao.Caption <> '') then
        zrlObservacao.Caption := zrlObservacao.Caption + ' / ';
      zrlObservacao.Caption := zrlObservacao.Caption + OBS + ' ';
    end;
  end;

  zrlObservacao.Caption := zrlObservacao.Caption + Item_Pedido_Venda1.FieldByName('PDV_OBS').asString;  

  if self.tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSVendasCliente.rdgDataCadastro1.Checked then
      if Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime > 0 then
        zrlData.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataAlterado.Checked then
      if Item_Pedido_Venda1.FieldByName('PDV_DT_ALTERADO').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DT_ALTERADO').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataEmissao.Checked then
      if Item_Pedido_Venda1.FieldByName('PDV_DT_EMISSAO_VENDA').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DT_EMISSAO_VENDA').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataDevolucao.Checked then
      if Item_Pedido_Venda1.FieldByName('PDV_DT_DEVOLUCAO').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DT_DEVOLUCAO').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataEntrega.Checked then
      if Item_Pedido_Venda1.FieldByName('PDV_DT_ENTREGA').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DT_ENTREGA').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataPrevisao.Checked then
      if Item_Pedido_Venda1.FieldByName('PDV_DT_PREVISAO').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DT_PREVISAO').AsDateTime)
      else
        zrlData.Caption := '';
  end
  else if Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime > 0 then
    zrlData.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime)
  else
    zrlData.Caption := '';

  sTitulo := '';
  if (DM.Configuracao1.Empresa in [empMotical,empLuciano,empHOPE])  then
    if (Item_Pedido_Venda1.FieldByName('PDV_TIPO_VENDA').asInteger <> 2) and //Remessa
       (Item_Pedido_Venda1.FieldByName('PDV_TITULO_GERADO').asInteger = 0) then
      sTitulo := ' S/T';

  if DM.Configuracao1.Empresa in [empMotical,empLuciano,empHOPE] then
  Begin
    //0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
    if Item_Pedido_Venda1.FieldByName('PDV_TIPO_VENDA').asInteger = 0 then
      sTipoVenda := 'NO-'
    else if Item_Pedido_Venda1.FieldByName('PDV_TIPO_VENDA').asInteger = 1 then
      sTipoVenda := 'PE-'
    else if Item_Pedido_Venda1.FieldByName('PDV_TIPO_VENDA').asInteger = 2 then
      sTipoVenda := 'RE-'
    else if Item_Pedido_Venda1.FieldByName('PDV_TIPO_VENDA').asInteger = 3 then
      sTipoVenda := 'PP-'
    else
      sTipoVenda := '---'
  end
  else
    sTipoVenda := '';
  //
  if DM.Configuracao1.Empresa = empLuciano then
    labPrecoSugerido.Enabled := True
  else
    labPrecoSugerido.Enabled := False;
  //
  case Item_Pedido_Venda1.FieldByName('PDV_SITUACAO').asInteger of
    -1: zrlSituacao.Caption := sTipoVenda+'Reserva'+sTitulo;
     0: if Item_Pedido_Venda1.FieldByName('PDV_DIAS_RESERV').asInteger > 0 then
          zrlSituacao.Caption := sTipoVenda+'ORCAMENTO'
        else
          zrlSituacao.Caption := sTipoVenda+'Em Aberto';
     1: zrlSituacao.Caption := sTipoVenda+'Em Aberto';
     2: if Item_Pedido_Venda1.FieldByName('PDV_SERVICO').asInteger = 1 then
        Begin
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT TOP 1 PRD_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA '+
              ' WHERE CNC_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoCNC)+
              ' AND PDV_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPDV)+
              ' AND IPV_SITUACAO<>3 '+
              ' AND IPV_SERVICO=1 ';
            Open;
            if isEmpty then
              zrlSituacao.Caption := sTipoVenda+'Qualidade'
            else
              zrlSituacao.Caption := sTipoVenda+'Laboratorio';
          end;
        end
        else
          zrlSituacao.Caption := sTipoVenda+'Em Aberto';
     3: if Item_Pedido_Venda1.FieldByName('PDV_SERVICO').asInteger = 1 then
          zrlSituacao.Caption := sTipoVenda+'Pronto p/Entrega'
        else if Item_Pedido_Venda1.FieldByName('PDV_DIAS_RESERV').asInteger > 0 then
          zrlSituacao.Caption := sTipoVenda+'ORCAMENTO'
        else
          zrlSituacao.Caption := sTipoVenda+'Em Aberto';
     4: zrlSituacao.Caption := sTipoVenda+'Final.'+sTitulo;
     5: zrlSituacao.Caption := sTipoVenda+'Cons. Fin.'+sTitulo;
     6: zrlSituacao.Caption := sTipoVenda+'Cancelada'+sTitulo;
     7: zrlSituacao.Caption := sTipoVenda+'Cons. Canc.'+sTitulo;
     8: zrlSituacao.Caption := sTipoVenda+'Devolvida'+sTitulo;
     9: zrlSituacao.Caption := sTipoVenda+'Cons. Dev.'+sTitulo;
    10: zrlSituacao.Caption := sTipoVenda+'Canc.Não Apr.'+sTitulo;
    11: zrlSituacao.Caption := sTipoVenda+'Finalizado'+sTitulo;
  end;

  with Forma_de_Pagamento1 do
  Begin
    if Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger <> CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger;
      Open;
    end;
    zrlFormaDePagamento.Caption := Descricao;
  end;

  with AgenteFin1 do
  Begin
    if Item_Pedido_Venda1.FieldByName('AGF_CODIGO').asInteger <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('AGF_CODIGO').asInteger;
      Open;
    end;
    zrlAgenteFinanceiro.Caption := Descricao;
  end;

  with DM.Parametro1 do
  Begin
    if CodigoPAR <> Item_Pedido_Venda1.FieldByName('PDV_TIPO_PAG').asInteger then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Item_Pedido_Venda1.FieldByName('PDV_TIPO_PAG').asInteger;
      Open;
    end;
    zrlTipoDePagamento.Caption := Descricao;
  end;

  if (Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString = '0') OR
     (Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString = '') then
  Begin
    zrlNotaCupom.Enabled:=False;
    szrNota.Enabled:=False;
    zrlNotaFiscal.Enabled:=False;
  end
  else
  Begin
    zrlNotaCupom.Enabled:=True;
    if zrlCliente.Top <> 0 then
      szrNota.Enabled:=True;
    zrlNotaFiscal.Enabled:=True;
    if Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString = '-1' then
      zrlNotaFiscal.Caption:='LJ3'
    else if Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString = '-2' then
      zrlNotaFiscal.Caption:='LJ4'
    else
      zrlNotaFiscal.Caption:=Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString;
  end;
  if not (DM.Configuracao1.Empresa IN [empEletro,empPetromax]) then
  Begin
    SZRLabel24.Enabled := False;
    zrlConjuge.Enabled := False;
    if Cliente1.PessoaFisica then
      SZRLabel26.Caption := 'Pai/Mae:'
    else
      SZRLabel26.Caption := 'Contato:';
    if self.tag = 0 then
    Begin
      if not fMxSVendasCliente.ckbSintetico.Checked then //Não Sintético
      Begin
        SZRLabel26.Left    := 0;
        zrlPaiMae.Left    := 10;
      end;
    end
    else
    Begin
      SZRLabel26.Left    := 0;
      zrlPaiMae.Left    := 10;
    end;
  end
  else
    zrlConjuge.Caption:=Cliente1.Conjuge;

  if (Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString <> '') and
     (Item_Pedido_Venda1.FieldByName('PDV_NOTA_FISCAL').asString <> '-1') then
  Begin
    case Item_Pedido_Venda1.FieldByName('PDV_NOTA_CUPOM').asInteger of
      1: zrlNotaCupom.Caption:='N';
      2: zrlNotaCupom.Caption:='C';
      else
        zrlNotaCupom.Caption:='';
    end;
  end
  else
    zrlNotaCupom.Caption:='';

  if DM.Configuracao1.Empresa = empEletro then
    szrOK.Enabled := False
  else
    //Alan - Acrescentado 24/02/2006 quase Carnaval 
    if DM.Configuracao1.Empresa = empLuciano then
    begin
      szrVendedor.Left := 92;
      szrVendedor.Top := 9;
      szrVendedor.Enabled := True;
      szrVendedor.Caption := 'Desconto (%)';
      zrlVendedor.Enabled := True;
    end
    else
    begin
      szrVendedor.Enabled := False;
      zrlVendedor.Enabled := False;
    end;

  if (DM.Configuracao1.Empresa <> empLBM) then
    szrOK.Enabled := False;
end;

procedure Trpt_VendasCliente.zrbTotalVendedorAfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  if self.tag = 0 then
    if (fMxSVendasCliente.ckbSintetico.Checked) and
       (fMxSVendasCliente.ckbVendedorPorPagina.Checked) then
      report.NewPage;
end;

procedure Trpt_VendasCliente.zrbCabecalhoFUNBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalFUN := 0;
  TotalRegistrosGrupo := 0;
  if (self.tag = 0) then
    if (fMxSVendasCliente.ckbVendedorPorPagina.Checked) then
      report.CurrentY := 7;

  if (Trim(zrbCabecalhoFUN.Expression) <> 'CLI_CODIGO') and
     (Trim(zrbCabecalhoFUN.Expression) <> 'CNC_CODIGO+CLI_CODIGO') then
  Begin
    with Funcionario1 do
    Begin
      if (Item_Pedido_Venda1.CodigoFUN <> CodigoFUN) then
      Begin
        Close;
        ParamByName('FUN_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoFUN;
        Open;
      end;
      if Trim(Fone) <> '' then
        zrlVendedorCabecalho.Caption:=Apelido+' - Fone: '+Fone
      else
        zrlVendedorCabecalho.Caption:=Apelido;
    end;
  end
  else
  Begin
    zrlDescVendedorCabecalho.Caption := 'Cliente:';
    with Cliente1 do
    Begin
      if (Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger <> CodigoCLI) or
         (Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger <> CodigoCNC) then
      Begin
        Close;
        ParamByName('CLI_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger;
        ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger;
        Open;
      end;
      zrlVendedorCabecalho.Caption:=RazaoSocial+' ('+IntToStr(CodigoCLI)+')';
    end;
  end;
end;

procedure Trpt_VendasCliente.zrbTotalVendedorBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if self.tag = 0 then
  Begin
    if not fMxSVendasCliente.ckbSintetico.Checked then
    Begin
      SZRLabel165.Enabled := False;
      zrbTotalVendedor.Height := 0;
    end
    else
    Begin
      if (Trim(zrbCabecalhoFUN.Expression) = 'CLI_CODIGO') or
         (Trim(zrbCabecalhoFUN.Expression) = 'CNC_CODIGO+CLI_CODIGO') then
        SZRLabel165.Caption := 'Total P/ Cliente:';
      zrlTotalVendedor.Caption := format('%.2f',[TotalFUN]);
    end;
  end;
  zrlTotalRegistro.Caption := IntToStr(TotalRegistrosGrupo);
end;

procedure Trpt_VendasCliente.zrbCabecalhoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbCabecalhoCNC.Height > 0 then
  Begin
    CentroCusto1.Close;
    CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
    CentroCusto1.Open;
    zrlCentroDeCusto.Caption:=CentroCusto1.RazaoSocial;
  end;
  TotalCentro := 0;
end;

procedure Trpt_VendasCliente.zrbTotalCentroBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if self.tag <> 1 then
  Begin
    zrlTotalCentro.Caption := format('%.2f',[TotalCentro]);
    TotalCentro:=0;
  end
  else
    zrbTotalCentro.Height := 0;
end;

procedure Trpt_VendasCliente.LimpaCampos;
begin
  SZRLabel143.Caption:='';
  SZRLabel102.Caption:='';
  SZRLabel103.Caption:='';
  SZRLabel104.Caption:='';
  SZRLabel144.Caption:='';
  SZRLabel105.Caption:='';
  SZRLabel106.Caption:='';
  SZRLabel107.Caption:='';
  SZRLabel145.Caption:='';
  SZRLabel108.Caption:='';
  SZRLabel109.Caption:='';
  SZRLabel110.Caption:='';
  SZRLabel146.Caption:='';
  SZRLabel111.Caption:='';
  SZRLabel112.Caption:='';
  SZRLabel113.Caption:='';
  SZRLabel147.Caption:='';
  SZRLabel114.Caption:='';
  SZRLabel115.Caption:='';
  SZRLabel116.Caption:='';
  SZRLabel148.Caption:='';
  SZRLabel117.Caption:='';
  SZRLabel118.Caption:='';
  SZRLabel119.Caption:='';
  SZRLabel149.Caption:='';
  SZRLabel120.Caption:='';
  SZRLabel121.Caption:='';
  SZRLabel122.Caption:='';
  SZRLabel150.Caption:='';
  SZRLabel123.Caption:='';
  SZRLabel124.Caption:='';
  SZRLabel125.Caption:='';
  SZRLabel151.Caption:='';
  SZRLabel126.Caption:='';
  SZRLabel127.Caption:='';
  SZRLabel128.Caption:='';
  SZRLabel152.Caption:='';
  SZRLabel129.Caption:='';
  SZRLabel130.Caption:='';
  SZRLabel131.Caption:='';
  SZRLabel153.Caption:='';
  SZRLabel132.Caption:='';
  SZRLabel133.Caption:='';
  SZRLabel134.Caption:='';
  SZRLabel154.Caption:='';
  SZRLabel135.Caption:='';
  SZRLabel136.Caption:='';
  SZRLabel137.Caption:='';
end;

procedure Trpt_VendasCliente.FormCreate(Sender: TObject);
begin
  TotalRegistros := 0;
  TotalItens := 0;
  QtdAcimaNormal := False;
  Funcionario1.Close;
  if DM.configuracao1.Empresa <> empMotical then
    zrlAssinatura.Enabled := False;
end;

procedure Trpt_VendasCliente.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
