unit UComprovanteLJ3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Variants, Titulo_receber,
  AgenteFin, Forma_de_Pagamento, Funcionario, Parametro, Cliente, Produto,
  Item_Pedido_Venda, CentroCusto;

type
  Trpt_ComprovanteLJ3 = class(TForm)
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
    zrbParcelas: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    ZRDBText10: TSZRDBText;
    zrlSubTotal: TSZRLabel;
    Produto1: TProduto;
    SZRLabel1: TSZRLabel;
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
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1PDV_ACRESCIMO: TFloatField;
    Item_Pedido_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1PDV_MAQUINA: TIntegerField;
    Funcionario1: TFuncionario;
    zrbCabecalhoPedido: TSZRGroup;
    ZRLabel24: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlData: TSZRLabel;
    SZRLabel42: TSZRLabel;
    zrlSituacao: TSZRLabel;
    SZRLabel47: TSZRLabel;
    szrOK: TSZRLabel;
    zrlOK: TSZRLabel;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField;
    Item_Pedido_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    SZRLabel4: TSZRLabel;
    SZRDBText3: TSZRDBText;
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
    SZRLabel139: TSZRLabel;
    Item_Pedido_Venda1PDV_NOTA_CUPOM: TIntegerField;
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
    CentroCusto1: TCentroCusto;
    Item_Pedido_Venda1PDV_OBS: TStringField;
    Item_Pedido_Venda1PDV_TOTAL: TFloatField;
    Item_Pedido_Venda1PDV_IMPRESSO: TIntegerField;
    zrlProduto: TSZRLabel;
    zrlCodigoPRD: TSZRLabel;
    SZRLabel40: TSZRLabel;
    zrlNumeroItem: TSZRLabel;
    SZRLabel41: TSZRLabel;
    zrlCodigoCNC: TSZRDBText;
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
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1FPE_CODIGO: TIntegerField;
    Item_Pedido_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
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
    zrlAss1: TSZRLabel;
    zrlAss2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlClienteCab: TSZRLabel;
    zrlDataCab: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel16: TSZRLabel;
    zrlEndereco: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlPaiMae: TSZRLabel;
    SZRLabel36: TSZRLabel;
    zrlFone: TSZRLabel;
    AgenteFin1: TAgenteFin;
    SZRLabel30: TSZRLabel;
    zrlObservacao: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrb_detalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbParcelasBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPedidoBeforePrint(Sender: TObject; var DoPrint: Boolean);
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
  rpt_ComprovanteLJ3: Trpt_ComprovanteLJ3;

implementation
Uses
  UDM, MxSVendasCliente, Funcoes;
{$R *.DFM}

procedure Trpt_ComprovanteLJ3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Active := False;
  Cliente1.Active := False;
  Item_Pedido_Venda1.Active := False;
  Action := cafree;
end;

procedure Trpt_ComprovanteLJ3.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDesco: string;
begin
  zrlNumeroItem.Caption:=preencheZero(3,NumeroItem);
  inc(NumeroItem);

  //Contar total de itens
  inc(TotalItens);

  zrlCodigoPRD.Caption := preencheZero(7,Item_Pedido_Venda1.CodigoPRD);

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
      if DM.Configuracao1.Empresa = 1 then
        zrlProduto.Caption := Trim(Descricao+' '+' '+Caracteristica)+' '+Referencia+', '+Marca+' '+Unidade
      else if DM.Configuracao1.Empresa = 2 then //Petromax
        zrlProduto.Caption := Descricao+' '+Referencia+', '+Unidade
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
          zrlProduto.Caption := Descricao+' '+Unidade+' ('+Item_Pedido_Venda1.Observacao+')'+sDesco//Nome do Paciente
        else
          zrlProduto.Caption := Descricao+' '+Unidade+sDesco;
      end
      else
        zrlProduto.Caption := Descricao+' '+Referencia+', '+Marca+' '+Unidade;
    end
    else
    Begin
      zrlProduto.Width := 92;
      if DM.Configuracao1.Empresa = 1 then
        zrlProduto.Caption := PreencheEspaco(40,Trim(Descricao+' '+Caracteristica))+' '+PreencheEspaco(20,Referencia)+
                      ' '+PreencheEspaco(20,Marca)
      else
        zrlProduto.Caption := PreencheEspaco(40,Descricao)+' '+PreencheEspaco(20,Referencia)+
                      ' '+PreencheEspaco(20,Marca);
      Exit;
    end;
  end;

  if Item_Pedido_Venda1.Bonificacao > 0 then
    zrlProduto.Caption := zrlProduto.Caption + '(BONUS:'+Format('%.2f',[Item_Pedido_Venda1.Bonificacao])+')';

  If (Item_Pedido_Venda1.PrecoDesc<>0) or (DM.Configuracao1.Empresa <> empEletro) THEN
  Begin
    TotalFUN   :=TotalFUN+   Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade)-
                             Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Bonificacao);
    SubTotal   :=SubTotal+   Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade)-
                             Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Bonificacao);
    Total      :=Total+      Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade)-
                             Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Bonificacao);
    TotalCentro:=TotalCentro+Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade)-
                             Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Bonificacao);
  end
  Else
  Begin
    TotalFUN   :=TotalFUN+   Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade)-
                             Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Bonificacao);
    SubTotal   :=SubTotal+   Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade)-
                             Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Bonificacao);
    Total      :=Total+      Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade)-
                             Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Bonificacao);
    TotalCentro:=TotalCentro+Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade)-
                             Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Bonificacao);
  end;

  TotQtd:=TotQtd+Item_Pedido_Venda1.Quantidade;

  case Item_Pedido_Venda1.Pendencia of
    0:zrlOK.Caption:='OK';
    1:zrlOK.Caption:='PD';
    2:zrlOK.Caption:='PQ';
    3:zrlOK.Caption:='PT';
  end;

  //Definir Preço Unitário
  if (Item_Pedido_Venda1.PrecoDesc > 0) or (DM.Configuracao1.Empresa <> empEletro) then
  Begin
    zrlValorUnitario.Caption := format('%.2f',[Item_Pedido_Venda1.PrecoDesc]);
    zrlTotalItem.Caption     := format('%.2f',[(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade)-
                                               (Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Bonificacao)]);
  end
  else
  Begin
    zrlValorUnitario.Caption := format('%.2f',[Item_Pedido_Venda1.Preco]);
    zrlTotalItem.Caption     := format('%.2f',[(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade)-
                                               (Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Bonificacao)]);
  end;
end;

procedure Trpt_ComprovanteLJ3.zrbParcelasBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  i:integer;
begin
  if DM.Configuracao1.Empresa <> empMotical then
  Begin
    if (report.CurrentY <= 42) then
      report.CurrentY := 42
    else 
    Begin
      report.NewPage;
      report.CurrentY := 42;
    end;
  end;

  zrlSubTotal.Caption:=Format('%.2f',[SubTotal]);
  SubTotal:=0;

  with AgenteFin1 do
  Begin
    if Item_Pedido_Venda1.FieldByName('AGF_CODIGO').asInteger <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('AGF_CODIGO').asInteger;
      Open;
    end;
    zrlCondicaoDePagamento.Caption := Descricao;
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

procedure Trpt_ComprovanteLJ3.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;

  if Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime > 0 then
    zrlDataCab.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime)
  else
    zrlDataCab.Caption := '';
      
  //
  with Cliente1 do
  Begin
    if (not Active) or
       (Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger <> CodigoCLI) or
       (Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger;
      Open;
    end;
    zrlClienteCab.Caption:=RazaoSocial+' ('+IntToStr(CodigoCLI)+')';
    zrlFone.Caption:=Fone;
    zrlFone.Caption := Trim(zrlFone.Caption + ' '+ Fax + ' ' + Celular);

    with DM.Parametro1 do
    Begin
      if CodigoPAR <> Logradouro then
      Begin
        Close;
        ParamByName('PAR_CODIGO').asInteger:=Logradouro;
        Open;
      end;
      if not DM.Parametro1.IsEmpty then
        zrlEndereco.Caption := Descricao+' '+Endereco
      else
        zrlEndereco.Caption := Endereco;
    end;

    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + Bairro + ' ' + Cidade + '/' + Uf + ' CEP:' + CEP);
    if Trim(Pai) <> '' then
      if Trim(Mae) <> '' then
        zrlPaiMae.Caption:=Trim(Pai)+'/'+Trim(Mae)
      else
        zrlPaiMae.Caption:=Trim(Pai)
    else
      zrlPaiMae.Caption:=Trim(Mae);

    zrlObservacao.Caption := '';
    if Trim(Item_Pedido_Venda1.FieldByName('PDV_DOCUMENTO').asString) <> '' then
      zrlObservacao.Caption := 'Doc: '+Trim(Item_Pedido_Venda1.FieldByName('PDV_DOCUMENTO').asString)+' ';
    if Trim(Item_Pedido_Venda1.FieldByName('PDV_CAIXA').asString) <> '' then
      zrlObservacao.Caption := zrlObservacao.Caption + 'Caixa: '+Trim(Item_Pedido_Venda1.FieldByName('PDV_CAIXA').asString)+' ';

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

    zrlObservacao.Caption := zrlObservacao.Caption + Item_Pedido_Venda1.FieldByName('PDV_OBS').asString;
  end;
end;

procedure Trpt_ComprovanteLJ3.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=0;
  SubTotal:=0;
  TotQtd:=0;
end;

procedure Trpt_ComprovanteLJ3.zrbCabecalhoPedidoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sTitulo, sTipoVenda: string;
begin
  NumeroItem := 1;
  inc(TotalRegistros);
  inc(TotalRegistrosGrupo);
  if Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime > 0 then
    zrlData.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime)
  else
    zrlData.Caption := '';

  sTitulo := '';
  if DM.Configuracao1.Empresa = empMotical then
    if (Item_Pedido_Venda1.FieldByName('PDV_TIPO_VENDA').asInteger <> 2) and //Remessa
       (Item_Pedido_Venda1.FieldByName('PDV_TITULO_GERADO').asInteger = 0) then
      sTitulo := ' S/T';

  if DM.Configuracao1.Empresa = empMotical then
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
end;

procedure Trpt_ComprovanteLJ3.LimpaCampos;
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

procedure Trpt_ComprovanteLJ3.FormCreate(Sender: TObject);
begin
  TotalRegistros := 0;
  TotalItens := 0;
  QtdAcimaNormal := False;
end;

procedure Trpt_ComprovanteLJ3.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

end.
