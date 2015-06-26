unit UPacoteRemessa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, SQuery, Funcionario,
  QRExport, Item_de_Cota, Item_Pedido_Venda, Item_Pacote_Venda, Cliente,
  SubGrupo, AgenteFin, Forma_de_Pagamento;

type
  Trpt_PacoteRemessa = class(TForm)
    report: TQuickRep;
    zrbCabecalho: TQRBand;
    qrlDescricaoRelatorio: TQRLabel;
    qrlNomeLoja: TQRLabel;
    qrlNomeCentroDeCusto: TQRLabel;
    qrsDataHoraImpressao: TQRSysData;
    zrbRodapePagina: TQRBand;
    QRLabel1: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    qrsNumeroPagina: TQRSysData;
    zrbDetalhe: TQRBand;
    Item_Pacote_Venda1: TItem_Pacote_Venda;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    DSItem_Pacote_Venda1: TDataSource;
    zrbGrupoPDV: TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    zrlCliente: TQRLabel;
    Cliente1: TCliente;
    zrbRodapeGrupoPDV: TQRBand;
    Item_Pacote_Venda1CNC_CODIGO: TIntegerField;
    Item_Pacote_Venda1PDV_CODIGO: TIntegerField;
    Item_Pacote_Venda1USU_CODIGO: TIntegerField;
    Item_Pacote_Venda1PCT_DT_CADASTRO: TDateTimeField;
    Item_Pacote_Venda1PCT_DT_ALTERADO: TDateTimeField;
    Item_Pacote_Venda1PCT_DT_EMISSAO_VENDA: TDateTimeField;
    Item_Pacote_Venda1CNC_CLIENTE: TIntegerField;
    Item_Pacote_Venda1CLI_CODIGO: TIntegerField;
    Item_Pacote_Venda1FUN_CODIGO: TIntegerField;
    Item_Pacote_Venda1PCT_ENTRADA: TFloatField;
    Item_Pacote_Venda1PCT_ACRESCIMO: TFloatField;
    Item_Pacote_Venda1PCT_TOTAL: TFloatField;
    Item_Pacote_Venda1PCT_NOTA_FISCAL: TIntegerField;
    Item_Pacote_Venda1PCT_NOTA_CUPOM: TIntegerField;
    Item_Pacote_Venda1AGF_CODIGO: TIntegerField;
    Item_Pacote_Venda1FPG_CODIGO: TIntegerField;
    Item_Pacote_Venda1PCT_TIPO_PAG: TIntegerField;
    Item_Pacote_Venda1PCT_MAQUINA: TIntegerField;
    Item_Pacote_Venda1PCT_EM_USO: TIntegerField;
    Item_Pacote_Venda1PCT_VENCIMENTOS: TStringField;
    Item_Pacote_Venda1PCT_SITUACAO: TIntegerField;
    Item_Pacote_Venda1PCT_OBSERVACAO: TStringField;
    Item_Pacote_Venda1CNC_CODIGO_1: TIntegerField;
    Item_Pacote_Venda1IPV_CODIGO: TIntegerField;
    Item_Pacote_Venda1PDV_CODIGO_1: TIntegerField;
    Item_Pacote_Venda1USU_CODIGO_1: TIntegerField;
    Item_Pacote_Venda1GRP_CODIGO: TIntegerField;
    Item_Pacote_Venda1SGP_CODIGO_1: TIntegerField;
    Item_Pacote_Venda1SGP_CODIGO_2: TIntegerField;
    Item_Pacote_Venda1SGP_CODIGO_3: TIntegerField;
    Item_Pacote_Venda1SGP_CODIGO_4: TIntegerField;
    Item_Pacote_Venda1IPC_DT_CADASTRO: TDateTimeField;
    Item_Pacote_Venda1IPC_DT_ALTERADO: TDateTimeField;
    Item_Pacote_Venda1IPC_QUANTIDADE: TIntegerField;
    Item_Pacote_Venda1IPC_QUANTIDADE_ENTREGUE: TIntegerField;
    Item_Pacote_Venda1IPC_PRECO: TFloatField;
    Item_Pacote_Venda1IPC_DESCONTO: TFloatField;
    Item_Pacote_Venda1IPC_PRECO_DESCONTO: TFloatField;
    Item_Pacote_Venda1IPC_SITUACAO: TIntegerField;
    Item_Pacote_Venda1IPC_OBSERVACAO: TStringField;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    zrlSubGrupo: TQRLabel;
    SubGrupo1: TSubGrupo;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1CLI_CODIGO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_DATA_HORA: TDateTimeField;
    Item_Pedido_Venda1PDV_TOTAL: TFloatField;
    Item_Pedido_Venda1PDV_LISTADO: TIntegerField;
    Item_Pedido_Venda1PDV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1PDV_OBS: TStringField;
    Item_Pedido_Venda1PDV_DIAS_RESERV: TIntegerField;
    Item_Pedido_Venda1PDV_NOTA_FISCAL: TIntegerField;
    Item_Pedido_Venda1AGF_CODIGO: TIntegerField;
    Item_Pedido_Venda1FPG_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_TIPO_PAG: TIntegerField;
    Item_Pedido_Venda1PDV_ENTRADA: TFloatField;
    Item_Pedido_Venda1CNC_CLIENTE: TIntegerField;
    Item_Pedido_Venda1PDV_EM_USO: TIntegerField;
    Item_Pedido_Venda1PDV_ACRESCIMO: TFloatField;
    Item_Pedido_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1PDV_MAQUINA: TIntegerField;
    Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField;
    Item_Pedido_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Item_Pedido_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Item_Pedido_Venda1PDV_IMPRESSO: TIntegerField;
    Item_Pedido_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Item_Pedido_Venda1PDV_CONTATO: TStringField;
    Item_Pedido_Venda1PDV_CREDITO: TFloatField;
    Item_Pedido_Venda1FUN_ARQUITETO: TIntegerField;
    Item_Pedido_Venda1PDV_TITULO_GERADO: TIntegerField;
    Item_Pedido_Venda1PDV_TIPO_VENDA: TIntegerField;
    Item_Pedido_Venda1PDV_PACOTE: TIntegerField;
    Item_Pedido_Venda1PDV_GRUPO_ESPECIAL: TIntegerField;
    Item_Pedido_Venda1PDV_DT_PREVISAO: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_ENTREGA: TDateTimeField;
    Item_Pedido_Venda1PDV_DOCUMENTO: TStringField;
    Item_Pedido_Venda1PDV_CAIXA: TStringField;
    Item_Pedido_Venda1PDV_SERVICO: TIntegerField;
    Item_Pedido_Venda1PDV_FONE_CONTATO: TStringField;
    Item_Pedido_Venda1CNC_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1IPV_CODIGO: TIntegerField;
    Item_Pedido_Venda1FUN_CODIGO: TIntegerField;
    Item_Pedido_Venda1IEB_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO_1: TIntegerField;
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
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1PRD_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1PRD_DESCRICAO: TStringField;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    Item_Pacote_Venda1PCT_BLOQUEADO: TIntegerField;
    Item_Pedido_Venda1FPE_CODIGO: TIntegerField;
    Item_Pedido_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    zrlLinhaCabecalho: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    zrlTipoDePagamento: TQRLabel;
    QRLabel21: TQRLabel;
    zrlFormaDePagamento: TQRLabel;
    QRLabel22: TQRLabel;
    zrlAgenteFinanceiro: TQRLabel;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    QRLabel23: TQRLabel;
    zrlFone: TQRLabel;
    QRLabel24: TQRLabel;
    zrlRGCGF: TQRLabel;
    QRLabel25: TQRLabel;
    zrlCPFCNPJ: TQRLabel;
    QRLabel26: TQRLabel;
    zrlEndereco: TQRLabel;
    QRLabel27: TQRLabel;
    zrlBairro: TQRLabel;
    QRLabel29: TQRLabel;
    zrlCidade: TQRLabel;
    qrlPeriodoDesc: TQRLabel;
    qrlDescricaoPeriodo: TQRLabel;
    zrlFiltros: TQRLabel;
    zrlProduto: TQRLabel;
    QRLabel16: TQRLabel;
    procedure zrbCabecalhoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbGrupoPDVBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
    Entidade : TItem_Pacote_Venda;
  end;

var
  rpt_PacoteRemessa: Trpt_PacoteRemessa;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_PacoteRemessa.zrbCabecalhoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNomeLoja.Caption:=DM.Configuracao1.LojaNome;
  qrlNomeCentroDeCusto.Caption:=DM.CentroCusto1.RazaoSocial;
  if qrlDescricaoPeriodo.Caption = '' then
    qrlPeriodoDesc.Visible := False
  else
    qrlPeriodoDesc.Visible := True;
end;

procedure Trpt_PacoteRemessa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_PacoteRemessa.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pacote_Venda1;
end;

procedure Trpt_PacoteRemessa.zrbGrupoPDVBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  zrlTipoDePagamento.Caption := DM.SelecionaParametro(Entidade.FieldByName('PCT_TIPO_PAG').asInteger);

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

  with Cliente1 do
  Begin
    if (CodigoCNC <> Entidade.FieldByName('CNC_CLIENTE').asInteger) or
       (CodigoCLI <> Entidade.FieldByName('CLI_CODIGO').asInteger) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByName('CNC_CLIENTE').asInteger;
      ParamByName('CLI_CODIGO').asInteger := Entidade.FieldByName('CLI_CODIGO').asInteger;
      Open;
    end;
    zrlCliente.Caption := RazaoSocial;
    zrlFone.Caption:=Fone;
    zrlRGCGF.Caption:=CGFRG;
    zrlCPFCNPJ.Caption:=CPFCGC;

    DM.SelecionaParametro(Logradouro);
    if not DM.Parametro1.IsEmpty then
      zrlEndereco.Caption := DM.Parametro1.Descricao+' '+Endereco
    else
      zrlEndereco.Caption := Endereco;
    zrlBairro.Caption:=Bairro;
    zrlCidade.Caption:=Trim(Cidade)+'/'+Trim(Uf);
  end;
end;

procedure Trpt_PacoteRemessa.zrbDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with SubGrupo1 do
  Begin
    if Entidade.CodigoSGP1 <> CodigoSGP then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Entidade.CodigoSGP1;
      Open;
    end;
    zrlSubGrupo.Caption := Descricao;

    if Entidade.CodigoSGP2 > 0 then
    Begin
      if Entidade.CodigoSGP2 <> CodigoSGP then
      Begin
        Close;
        ParamByName('SGP_CODIGO').asInteger := Entidade.CodigoSGP2;
        Open;
      end;
      zrlSubGrupo.Caption := zrlSubGrupo.Caption + ' / ' + Descricao;
    end;

    if Entidade.CodigoSGP3 > 0 then
    Begin
      if Entidade.CodigoSGP3 <> CodigoSGP then
      Begin
        Close;
        ParamByName('SGP_CODIGO').asInteger := Entidade.CodigoSGP3;
        Open;
      end;
      zrlSubGrupo.Caption := zrlSubGrupo.Caption + ' / ' + Descricao;
    end;

    if Entidade.CodigoSGP4 > 0 then
    Begin
      if Entidade.CodigoSGP4 <> CodigoSGP then
      Begin
        Close;
        ParamByName('SGP_CODIGO').asInteger := Entidade.CodigoSGP4;
        Open;
      end;
      zrlSubGrupo.Caption := zrlSubGrupo.Caption + ' / ' + Descricao;
    end;
  end;
end;

procedure Trpt_PacoteRemessa.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Item_Pedido_Venda1 do
  Begin
    if IsEmpty then
      PrintBand := False
    else
    Begin
      PrintBand := True;
      zrlProduto.Caption := PreencheZero(6,CodigoPRD)+'-'+FieldByName('PRD_DESCRICAO').asString+' / '+Observacao;
    end;
  end;
end;

procedure Trpt_PacoteRemessa.zrbRodapePaginaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel1.Caption   := EmpresaDesenvolvedora;
end;

end.
