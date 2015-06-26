unit UPedidoVendaMotical;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Variants, Titulo_receber,
  AgenteFin, Forma_de_Pagamento, Funcionario, Parametro, Cliente, Produto,
  Item_Pedido_Venda, CentroCusto;

type
  Trpt_PedidoVendaMotical = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrlTituloRelatorio: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrlbRodapePagina: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
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
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
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
    zrlDescEndereco: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCidade: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrlDescPaiMae: TSZRLabel;
    zrlPaiMae: TSZRLabel;
    zrlDescObservacao: TSZRLabel;
    zrlDescRG: TSZRLabel;
    zrlRGCGF: TSZRLabel;
    SZRLabel34: TSZRLabel;
    zrlCPFCNPJ: TSZRLabel;
    SZRLabel36: TSZRLabel;
    zrlFone: TSZRLabel;
    SZRLabel38: TSZRLabel;
    zrlDataNascimento: TSZRLabel;
    zrlDescSituacao: TSZRLabel;
    zrlSituacao: TSZRLabel;
    SZRLabel47: TSZRLabel;
    zrlFormaDePagamento: TSZRLabel;
    zrlDesTipoPag: TSZRLabel;
    SZRLabel50: TSZRLabel;
    zrlAgenteFinanceiro: TSZRLabel;
    SZRLabel52: TSZRLabel;
    zrlTipoDePagamento: TSZRLabel;
    szrNota: TSZRLabel;
    zrlNotaFiscal: TSZRLabel;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField;
    Item_Pedido_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    zrlDescCliente: TSZRLabel;
    zrlDescCodigoPDV: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel64: TSZRLabel;
    Item_Pedido_Venda1PDV_NOTA_CUPOM: TIntegerField;
    zrlNotaCupom: TSZRLabel;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    CentroCusto1: TCentroCusto;
    Item_Pedido_Venda1PDV_OBS: TStringField;
    Item_Pedido_Venda1PDV_TOTAL: TFloatField;
    Item_Pedido_Venda1PDV_IMPRESSO: TIntegerField;
    zrlCEP: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlCodigoPRD: TSZRLabel;
    SZRLabel40: TSZRLabel;
    zrlNumeroItem: TSZRLabel;
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
    SZRLabel27: TSZRLabel;
    zrlFax: TSZRLabel;
    SZRLabel46: TSZRLabel;
    zrlCelular: TSZRLabel;
    zrlObservacao: TSZRLabel;
    zrlPacote: TSZRLabel;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1FPE_CODIGO: TIntegerField;
    Item_Pedido_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    szrVendedor: TSZRLabel;
    zrlVendedor: TSZRLabel;
    zrlDescDesconto: TSZRLabel;
    zrlDesconto: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlAssinatura: TSZRLabel;
    zrlMensagemContinua: TSZRLabel;
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
    Item_Pedido_Venda1PDV_ANTECIPADO: TFloatField;
    Item_Pedido_Venda1LOT_CODIGO: TIntegerField;
    SZRPontoRef: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRClassificacao: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbParcelasBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPedidoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrlbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    NumeroItem : integer;
    vPaginaForcada: Boolean;
  public
    Entidade: TItem_Pedido_Venda;
    SubTotal:Double;
  end;

var
  rpt_PedidoVendaMotical: Trpt_PedidoVendaMotical;

implementation
Uses
  UDM, MxSVendasCliente, Funcoes;
{$R *.DFM}

procedure Trpt_PedidoVendaMotical.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Close;
  Cliente1.Close;
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_PedidoVendaMotical.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sPrecoCheio, sDesco, sEntAnt, sBonus: string;
  vQtdSaldo: Double;
begin
  zrlNumeroItem.Caption:=preencheZero(3,NumeroItem);
  inc(NumeroItem);

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

  if DM.Configuracao1.Empresa = empLuciano then
    //sEntAnt := 'L' + IntToStr(Entidade.CodigoLOT) + ' ' +sEntAnt;
    sEntAnt := '(L ' + IntToStr(Item_Pedido_Venda1.FieldByName('LOT_CODIGO').AsInteger) + ') ';

  zrlCodigoPRD.Caption := preencheZero(7,Entidade.CodigoPRD);

  if Entidade.Bonificacao > 0 then
    sBonus := '(BONUS:'+Format('%.2f',[Entidade.Bonificacao])+')';

  zrlDesconto.Caption := '';
  with Produto1 do
  Begin
    if Entidade.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
      Open;
    end;
    if DM.Configuracao1.Empresa = empEletro then
      zrlProduto.Caption := sEntAnt+Trim(Descricao+' '+' '+Caracteristica)+' '+Referencia+', '+Marca+' '+Unidade+sBonus
    else if DM.Configuracao1.Empresa in [empPetromax, empHOPE] then //Petromax
      zrlProduto.Caption := sEntAnt+Descricao+' '+Referencia+', '+Unidade+sBonus
    else if DM.Configuracao1.Empresa = empMotical then //Motical
    Begin
      sDesco := '';
      if (Entidade.FieldByName('PDV_SERVICO').asInteger = 1) and //Produto vendido no Laboratório
         (not Entidade.Servico) then
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
            ' AND (T1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' OR T1.CNC_CODIGO=1) '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO ';
          Open;
          if not IsEmpty then
            if (Arredonda(Entidade.PrecoDesc) < Arredonda(FieldByName('ITS_PRECO_VENDA').asFloat)) then
            Begin
              sPrecoCheio := format('%.2f',[FieldByName('ITS_PRECO_VENDA').asFloat]);
              sDesco := format('%.2f',[(1-Entidade.PrecoDesc/FieldByName('ITS_PRECO_VENDA').asFloat)*100]);
            end;
        end;
      end
      else
      Begin
        if Arredonda(Entidade.PrecoDesc) < Arredonda(Produto1.Precovenda) then
        Begin
          sPrecoCheio := format('%.2f',[Produto1.Precovenda]);
          sDesco := format('%.2f',[(1-Entidade.PrecoDesc/Produto1.Precovenda)*100]);
        end
        else
        Begin
          sDesco := '0,00';
          sPrecoCheio := format('%.2f',[Entidade.PrecoDesc]);
        end;
      end;

      if Entidade.Observacao <> '' then
        zrlProduto.Caption := sEntAnt+Descricao+' '+Unidade+' ('+Entidade.Observacao+')'+sBonus//Nome do Paciente
      else
        zrlProduto.Caption := sEntAnt+Descricao+' '+Unidade+sBonus;

      zrlDesconto.Caption := sDesco;
    end
    else
    Begin
      zrlProduto.Width := 92;
      zrlProduto.Caption := sEntAnt+PreencheEspaco(40,Descricao)+' '+PreencheEspaco(20,Referencia)+
                            ' '+PreencheEspaco(20,Marca)+sBonus;

      if Entidade.Observacao <> '' then
        zrlProduto.Caption := sEntAnt+Descricao+' '+Unidade+' ('+Entidade.Observacao+')'+sBonus//Nome do Paciente
      else
        zrlProduto.Caption := sEntAnt+Descricao+' '+Unidade+sBonus;
    end;
  end;

  if zrlDesconto.Caption = '' then
  Begin
    if Entidade.PrecoDesc > Entidade.PrecoSugerido then
    Begin
      sPrecoCheio := Format('%.2f',[Entidade.PrecoDesc]);
      zrlDesconto.Caption := '0,00';
    end
    else
    Begin
      sPrecoCheio := Format('%.2f',[Entidade.PrecoSugerido]);
      zrlDesconto.Caption := format('%.2f',[100-Entidade.PrecoDesc/Entidade.PrecoSugerido*100]);
    end;
  end;

  SubTotal   :=SubTotal+   Arredonda(Arredonda(Entidade.PrecoDesc)*Entidade.Quantidade);

  //Definir Preço Unitário
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    if Entidade.PrecoDesc > 0 then
    Begin
      if DM.Configuracao1.Empresa = empMotical then
        zrlValorUnitario.Caption := sPrecoCheio
      else
        zrlValorUnitario.Caption := format('%.2f',[Entidade.PrecoDesc]);
      zrlTotalItem.Caption     := format('%.2f',[Arredonda(Entidade.PrecoDesc)*Entidade.Quantidade]);
    end
    else
    Begin
      if DM.Configuracao1.Empresa = empMotical then
        zrlValorUnitario.Caption := sPrecoCheio
      else
        zrlValorUnitario.Caption := format('%.2f',[Entidade.Preco]);
      zrlTotalItem.Caption     := format('%.2f',[Arredonda(Entidade.Preco)*Entidade.Quantidade]);
    end;
  end
  else
  Begin
    if DM.Configuracao1.Empresa = empMotical then
      zrlValorUnitario.Caption := sPrecoCheio
    else
      zrlValorUnitario.Caption := format('%.2f',[Entidade.PrecoDesc]);
    zrlTotalItem.Caption     := format('%.2f',[Arredonda(Entidade.PrecoDesc)*Entidade.Quantidade]);
  end;
end;

procedure Trpt_PedidoVendaMotical.zrbParcelasBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (report.CurrentY + 7) > report.Options.PageLength then
  Begin
    vPaginaForcada := True;
    report.ForceNewPage;
    zrlMensagemContinua.Enabled := True;
  end
  else
    vPaginaForcada := False;

  zrlSubTotal.Caption:=Format('%.2f',[SubTotal]);
  SubTotal:=0;
end;

procedure Trpt_PedidoVendaMotical.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_PedidoVendaMotical.zrbCabecalhoPedidoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sTitulo, sTipoVenda: string;
begin
  NumeroItem := 1;

  //Código do Pacote
  if Entidade.FieldByName('PDV_PACOTE').asInteger > 0 then
    zrlPacote.Caption := IntToStr(Entidade.FieldByName('PDV_PACOTE').asInteger)
  else
    zrlPacote.Caption := '';

  with Funcionario1 do
  Begin
    if (Entidade.CodigoFUN <> CodigoFUN) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
      Open;
    end;
    zrlVendedor.Caption := Apelido;
  end;

  with Cliente1 do
  Begin
    if (Entidade.FieldByName('CLI_CODIGO').asInteger <> CodigoCLI) or
       (Entidade.FieldByName('CNC_CLIENTE').asInteger <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger:=Entidade.FieldByName('CLI_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger:=Entidade.FieldByName('CNC_CLIENTE').asInteger;
      Open;
    end;
    zrlCliente.Caption:=RazaoSocial+' ('+IntToStr(CodigoCLI)+')';
    zrlApelido.Caption:=NomeFantasia;
    zrlFone.Caption:=Fone;
    zrlFax.Caption:=Fax;
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
    if Trim(Pai) <> '' then
      if Trim(Mae) <> '' then
        zrlPaiMae.Caption:=Trim(Pai)+'/'+Trim(Mae)
      else
        zrlPaiMae.Caption:=Trim(Pai)
    else
      zrlPaiMae.Caption:=Trim(Mae);

    if (DM.Configuracao1.Empresa = empEletro) and
       (Conjuge <> '') then
      zrlPaiMae.Caption := zrlPaiMae.Caption + ' Conjuge: '+Conjuge;

    zrlObservacao.Caption := '';
    if Trim(Entidade.FieldByName('PDV_DOCUMENTO').asString) <> '' then
      zrlObservacao.Caption := 'Doc: '+Trim(Entidade.FieldByName('PDV_DOCUMENTO').asString)+' ';
    if Trim(Entidade.FieldByName('PDV_CAIXA').asString) <> '' then
      zrlObservacao.Caption := zrlObservacao.Caption + 'Caixa: '+Trim(Entidade.FieldByName('PDV_CAIXA').asString)+' ';

    if Entidade.FieldByName('PDV_ANTECIPADO').asFloat > 0 then
      zrlObservacao.Caption := zrlObservacao.Caption + ' PAG.ANTECIPADO:R$ '+Format('%.2f',[Entidade.FieldByName('PDV_ANTECIPADO').asFloat]);

    if DM.Configuracao1.Empresa = 1 then
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

  zrlObservacao.Caption := zrlObservacao.Caption + Entidade.FieldByName('PDV_OBS').asString;  

  if self.tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSVendasCliente.rdgDataCadastro1.Checked then
      if Entidade.FieldByName('PDV_DATA_HORA').AsDateTime > 0 then
        zrlData.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByName('PDV_DATA_HORA').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataAlterado.Checked then
      if Entidade.FieldByName('PDV_DT_ALTERADO').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByName('PDV_DT_ALTERADO').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataEmissao.Checked then
      if Entidade.FieldByName('PDV_DT_EMISSAO_VENDA').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByName('PDV_DT_EMISSAO_VENDA').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataDevolucao.Checked then
      if Entidade.FieldByName('PDV_DT_DEVOLUCAO').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByName('PDV_DT_DEVOLUCAO').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataEntrega.Checked then
      if Entidade.FieldByName('PDV_DT_ENTREGA').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByName('PDV_DT_ENTREGA').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataPrevisao.Checked then
      if Entidade.FieldByName('PDV_DT_PREVISAO').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByName('PDV_DT_PREVISAO').AsDateTime)
      else
        zrlData.Caption := '';
  end
  else if Entidade.FieldByName('PDV_DATA_HORA').AsDateTime > 0 then
    zrlData.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByName('PDV_DATA_HORA').AsDateTime)
  else
    zrlData.Caption := '';

  sTitulo := '';
  if DM.Configuracao1.Empresa = empMotical then
    if (Entidade.FieldByName('PDV_TIPO_VENDA').asInteger <> 2) and //Remessa
       (Entidade.FieldByName('PDV_TITULO_GERADO').asInteger = 0) then
      sTitulo := ' S/T';

  if DM.Configuracao1.Empresa = empMotical then
  Begin
    //0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
    if Entidade.FieldByName('PDV_TIPO_VENDA').asInteger = 0 then
      sTipoVenda := 'NO-'
    else if Entidade.FieldByName('PDV_TIPO_VENDA').asInteger = 1 then
      sTipoVenda := 'PE-'
    else if Entidade.FieldByName('PDV_TIPO_VENDA').asInteger = 2 then
      sTipoVenda := 'RE-'
    else if Entidade.FieldByName('PDV_TIPO_VENDA').asInteger = 3 then
      sTipoVenda := 'PP-'
    else
      sTipoVenda := '---'
  end
  else
    sTipoVenda := '';


  case Entidade.FieldByName('PDV_SITUACAO').asInteger of
    -1: zrlSituacao.Caption := sTipoVenda+'Reserva'+sTitulo;
     0: if Entidade.FieldByName('PDV_DIAS_RESERV').asInteger > 0 then
          zrlSituacao.Caption := sTipoVenda+'ORCAMENTO'
        else
          zrlSituacao.Caption := sTipoVenda+'Em Aberto';
     1: zrlSituacao.Caption := sTipoVenda+'Em Aberto';
     2: if Entidade.FieldByName('PDV_SERVICO').asInteger = 1 then
        Begin
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT TOP 1 PRD_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA '+
              ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
              ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
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
     3: if Entidade.FieldByName('PDV_SERVICO').asInteger = 1 then
          zrlSituacao.Caption := sTipoVenda+'Pronto p/Entrega'
        else if Entidade.FieldByName('PDV_DIAS_RESERV').asInteger > 0 then
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
    if Entidade.FieldByName('FPG_CODIGO').asInteger <> CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger:=Entidade.FieldByName('FPG_CODIGO').asInteger;
      Open;
    end;
    zrlFormaDePagamento.Caption := Descricao;
  end;

  with AgenteFin1 do
  Begin
    if Entidade.FieldByName('AGF_CODIGO').asInteger <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger:=Entidade.FieldByName('AGF_CODIGO').asInteger;
      Open;
    end;
    zrlAgenteFinanceiro.Caption := Descricao;
  end;

  zrlTipoDePagamento.Caption := DM.SelecionaParametro(Entidade.FieldByName('PDV_TIPO_PAG').asInteger);

  if (Entidade.FieldByName('PDV_NOTA_FISCAL').asString = '0') OR
     (Entidade.FieldByName('PDV_NOTA_FISCAL').asString = '') then
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
    if Entidade.FieldByName('PDV_NOTA_FISCAL').asString = '-1' then
      zrlNotaFiscal.Caption:='SN'
    else
      zrlNotaFiscal.Caption:=Entidade.FieldByName('PDV_NOTA_FISCAL').asString;
  end;

  if Cliente1.PessoaFisica then
    zrlDescPaiMae.Caption := 'Pai/Mae :'
  else
    zrlDescPaiMae.Caption := 'Contato :';

  if (Entidade.FieldByName('PDV_NOTA_FISCAL').asString <> '') and
     (Entidade.FieldByName('PDV_NOTA_FISCAL').asString <> '-1') then
  Begin
    case Entidade.FieldByName('PDV_NOTA_CUPOM').asInteger of
      1: zrlNotaCupom.Caption:='N';
      2: zrlNotaCupom.Caption:='C';
      else
        zrlNotaCupom.Caption:='';
    end;
  end
  else
    zrlNotaCupom.Caption:='';

  if DM.Configuracao1.Empresa = empEletro then
  else
  Begin
    szrVendedor.Enabled := False;
    zrlVendedor.Enabled := False;
  end;

  //HERE
  SZRPontoRef.Caption := Cliente1.FieldByName('CLI_REFERENCIA1').AsString;

  DM.QuerySelect.Close;
  DM.QuerySelect.SQL.Text := 'SELECT PAR_DESCRICAO FROM PARAMETRO WHERE PAR_CODIGO = '''+Cliente1.FieldByName('CLI_CLASSIFICACAO').AsString+'''';
  DM.QuerySelect.Open;
  SZRClassificacao.Caption := DM.QuerySelect.FieldByName('PAR_DESCRICAO').AsString;
end;

procedure Trpt_PedidoVendaMotical.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;
  vPaginaForcada := False;
end;

procedure Trpt_PedidoVendaMotical.zrlbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (not Entidade.Eof) or
     (vPaginaForcada) then
  Begin
    vPaginaForcada := False;
    zrlMensagemContinua.Enabled := True;
  end
  else
    zrlMensagemContinua.Enabled := False;
    
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;
end;

end.
