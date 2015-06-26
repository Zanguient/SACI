unit UBaixaRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, Parametro;

type
  Trpt_BaixaRec = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    zrlTituloRelatorio: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrlLinhaCabecalho: TSZRLabel;
    ZRDBText5: TSZRDBText;
    zrlDescVencimento: TSZRLabel;
    zrlDescCodigo: TSZRLabel;
    ZRDBText6: TSZRDBText;
    zrlDescSeq: TSZRLabel;
    zrlDescPedido: TSZRLabel;
    zrlDescCliente: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRDBText4: TSZRDBText;
    zrlDescValorDoc: TSZRLabel;
    ZRLabel17: TSZRLabel;
    zrlDescValorPag: TSZRLabel;
    zrlDescTipoPag: TSZRLabel;
    ZRDBText8: TSZRDBText;
    zrlValorDoc: TSZRExpression;
    Titulo_receber1CCX_CODIGO: TIntegerField;
    Titulo_receber1CLI_CODIGO: TIntegerField;
    Titulo_receber1CNC_CODIGO: TIntegerField;
    Titulo_receber1PDV_CODIGO: TIntegerField;
    Titulo_receber1TRC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CRED_CLI: TFloatField;
    Titulo_receber1TRC_CUSTODIA: TStringField;
    Titulo_receber1TRC_PAGAMENTO: TDateTimeField;
    Titulo_receber1TRC_SEQUENCIA: TStringField;
    Titulo_receber1TRC_SITUACAO: TIntegerField;
    Titulo_receber1TRC_TIPO_DOC: TIntegerField;
    Titulo_receber1TRC_TIPO_PAG: TIntegerField;
    Titulo_receber1TRC_VALOR: TFloatField;
    Titulo_receber1TRC_VALOR_PAGO: TFloatField;
    Titulo_receber1TRC_VENCIMENTO: TDateTimeField;
    ZRLabel7: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRLabel21: TSZRLabel;
    zrlTotalValor: TSZRLabel;
    zrlTotalPago: TSZRLabel;
    Titulo_receber1AGF_CODIGO: TIntegerField;
    Titulo_receber1CNC_CLIENTE: TIntegerField;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    SZRLabel4: TSZRLabel;
    Titulo_receber1CPC_CODIGO: TIntegerField;
    Titulo_receber1CLI_RZ_SOCIAL: TStringField;
    SZRDBText2: TSZRDBText;
    zrlDescCobranca: TSZRLabel;
    SZRDBText3: TSZRDBText;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber1USU_CODIGO: TIntegerField;
    Titulo_receber1TRC_DT_ALTERADO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_INICIO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_SITUACAO: TDateTimeField;
    Titulo_receber1TRC_RGB_SITUACAO: TIntegerField;
    Titulo_receber1TRC_RGB_VISITADO: TSmallintField;
    Titulo_receber1TRC_RGB_DT_PROMESSA: TDateTimeField;
    Titulo_receber1TRC_PROCESSO: TIntegerField;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    zrbGrupo: TSZRGroup;
    Titulo_receber1Mes: TIntegerField;
    Titulo_receber1Ano: TIntegerField;
    SZRLabel7: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel8: TSZRLabel;
    zrlSubTotalValor: TSZRLabel;
    zrlTotalValorPago: TSZRLabel;
    zrlLinhaSubTotal: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel5: TSZRLabel;
    Titulo_receber1TRC_NUMERO: TStringField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    zrlDescDesconto: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlTipoPagamento: TSZRLabel;
    zrlContaRecebida: TSZRLabel;
    Conta_de_Caixa1: TConta_de_Caixa;
    SZRLabel16: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    Titulo_receber1Dia: TIntegerField;
    zrlFiltros: TSZRLabel;
    zrbGrupoCaixa: TSZRGroup;
    SZRLabel10: TSZRLabel;
    zrlGrupoCaixa: TSZRLabel;
    Titulo_receber1ccx_grupo: TIntegerField;
    SZRLabel18: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlGerouMovimento: TSZRLabel;
    zrlDataPagamento: TSZRLabel;
    zrlContaAgendada: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlDescNumero: TSZRLabel;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
    Titulo_receber1CNC_ORIGEM: TIntegerField;
    Titulo_receber1TRC_PEDIDO_SERVICO: TIntegerField;
    Titulo_receber1TRC_TIPO_PEDIDO: TIntegerField;
    Titulo_receber1TRC_DT_EMISSAO_BOLETO: TDateTimeField;
    Titulo_receber1TRC_DT_RECEBIMENTO_BOLETO: TDateTimeField;
    Titulo_receber1FPE_CODIGO: TIntegerField;
    Titulo_receber1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Titulo_receber1TRC_DT_COMPETENCIA: TDateTimeField;
    Titulo_receber1TRC_EQUIFAX: TIntegerField;
    Titulo_receber1TRC_DT_EQUIFAX: TDateTimeField;
    Titulo_receber1TRC_AGENCIA_NUMERO: TStringField;
    zrlObservacao: TSZRLabel;
    Titulo_receber1TRC_DT_CHEQUE: TDateTimeField;
    Titulo_receber1TRC_SIT_CHEQUE: TIntegerField;
    Titulo_receber1TRC_REABERTURA: TIntegerField;
    Titulo_receber1TRC_VERIFICADO: TIntegerField;
    Titulo_receber1TRC_DT_VERIFICADO: TDateTimeField;
    Titulo_receber1CHQ_CODIGO: TIntegerField;
    Titulo_receber1CNC_CHEQUE: TIntegerField;
    zrlDesconto: TSZRLabel;
    zrlJuros: TSZRLabel;
    zrlDescJuros: TSZRLabel;
    ZRDBText1: TSZRDBText;
    zrlSubTotalDesconto: TSZRLabel;
    zrlSubTotalJuros: TSZRLabel;
    zrlTotalDesconto: TSZRLabel;
    zrlTotalJuros: TSZRLabel;
    Titulo_receber1TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CV: TStringField;
    Titulo_receber1TRC_LOCAL: TStringField;
    zrlValorPago: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlSubTotalCredito: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlTotalCredito: TSZRLabel;
    SZRLabel1: TSZRLabel;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    Titulo_receber1FUN_CODIGO: TIntegerField;
    zrlCodigoFUN: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbGrupoCaixaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros : integer;
    vSubTotalCredito, vTotalCredito: Double;
  public
    Entidade: TTitulo_receber;
    SomaTotalMes, SomaJurosMes, SomaDescontoMes, SomaPagoMes, SomaTotal, SomaJuros, SomaDesconto, SomaPago, SomaDif:Double;
  end;

var
  rpt_BaixaRec: Trpt_BaixaRec;

implementation
Uses
  UDM, Funcoes, MxSelTitulos;

{$R *.DFM}

procedure Trpt_BaixaRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_BaixaRec.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_BaixaRec.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if fmxSelTitulos.ckbPagosCredito.Checked then
    zrlDescDesconto.Caption := 'Credito';
end;

procedure Trpt_BaixaRec.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  iGrupoEspecial: integer;
begin
  inc(TotalRegistros);
  if fmxSelTitulos.ckbPagosCredito.Checked then
    zrlDesconto.Caption := format('%.2f',[Entidade.Credcli])
  else
  Begin
    if Entidade.Desconto > 0 then
      zrlDesconto.Caption := format('%.2f',[Entidade.Desconto])
    else
      zrlDesconto.Caption := '-';
  end;

  if Entidade.Juros > 0 then
    zrlJuros.Caption := format('%.2f',[Entidade.Juros])
  else
    zrlJuros.Caption := '-';

  if Entidade.GerouMovimento then
    zrlGerouMovimento.Caption := 'S'
  else
    zrlGerouMovimento.Caption := 'N';

  if Entidade.Pagamento > 0 then
    zrlDataPagamento.Caption := DateToStr(Entidade.Pagamento)
  else
    zrlDataPagamento.Caption := '-';

  iGrupoEspecial := 0;
  if Entidade.CodigoPDV > 0 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT MAX(P1.PDV_GRUPO_ESPECIAL) AS GRUPO_ESPECIAL '+
        ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
        ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND P1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
        ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
      Open;
      if IsEmpty then //Pacote
      Begin
        Close;
        SQL.Text := 'SELECT MAX(P1.PCT_GRUPO_ESPECIAL) AS GRUPO_ESPECIAL '+
          ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
          ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND P1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
        Open;
      end;
      iGrupoEspecial := FieldByName('GRUPO_ESPECIAL').asInteger;
    end;
  end;

  if (DM.Configuracao1.Empresa = empMotical) and
     (zrbDetalhe.Height = 1) then
  Begin
    //No Campo Tipo de Pagamento exibir o Agente financeiro
    if Entidade.DataEmissaoBoleto > 0 then
      zrlTipoPagamento.Caption := 'BB'+IntToStr(iGrupoEspecial)
    else if Entidade.DataVerificado > 0 then
      zrlTipoPagamento.Caption := '00 '
    else
      zrlTipoPagamento.Caption := PreencheZero(2,Entidade.CodigoCNC)+' ';
  end
  else
  Begin
    //Tipo de Pagamento
    DM.SelecionaParametro(Entidade.TipoPag);
    if Length(DM.Parametro1.Descricao) <= zrlTipoPagamento.Width then
      zrlTipoPagamento.Caption := DM.Parametro1.Descricao
    else
      zrlTipoPagamento.Caption := Copy(DM.Parametro1.Descricao,1,zrlTipoPagamento.Width);
  end;

  //Conta de Caixa
  with Conta_de_Caixa1 do
  Begin
    //Conta Agendada
    if Entidade.CodigoCCX <> CodigoCCX then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
      Open;
    end;
    if Length(Descricao) <= zrlContaAgendada.Width then
      zrlContaAgendada.Caption := Descricao
    else
      zrlContaAgendada.Caption := Copy(Descricao,1,zrlContaAgendada.Width);

    //Conta Recebida
    if Entidade.CodigoCCX <> Entidade.CodigoCCXRecebimento then
    Begin
      if Entidade.CodigoCCXRecebimento <> CodigoCCX then
      Begin
          Close;
        ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCXRecebimento;
        Open;
      end;
      if Length(Descricao) <= zrlContaRecebida.Width then
        zrlContaRecebida.Caption := Descricao
      else
        zrlContaRecebida.Caption := Copy(Descricao,1,zrlContaRecebida.Width);
    end
    else
      zrlContaRecebida.Caption := '';
  end;

  if Entidade.CodigoFUN > 0 then
    zrlCodigoFUN.Caption := IntToStr(Entidade.CodigoFUN)
  else
    zrlCodigoFUN.Caption := '';

  if Entidade.CredCli > 0 then
    zrlObservacao.Caption := '(CRED:'+format('%.2f',[Entidade.CredCli])+')'
  else
    zrlObservacao.Caption := '';

  if Trim(Entidade.Local) <> '' then
    zrlObservacao.Caption := Trim(zrlObservacao.Caption + ' (' + Entidade.Local+')');

  zrlObservacao.Caption := Trim(zrlObservacao.Caption + ' ' + Entidade.OBS);

  vSubTotalCredito := vSubTotalCredito + Arredonda(Entidade.CredCli);
  vTotalCredito    := vTotalCredito    + Arredonda(Entidade.CredCli);

  if DM.Configuracao1.Empresa = empLuciano then
    zrlValorPago.Caption := Format('%.2f',[Entidade.ValorPG+Entidade.CredCli])
  else
    zrlValorPago.Caption := Format('%.2f',[Entidade.ValorPG]);


  if DM.Configuracao1.Empresa = empLuciano then
  begin
    SomaPagoMes     := SomaPagoMes + Arredonda(Entidade.ValorPG+Entidade.CredCli);
    SomaPago     := SomaPago     + Arredonda(Entidade.ValorPG+Entidade.CredCli);
  end
  else
  begin
    SomaPagoMes     := SomaPagoMes + Arredonda(Entidade.ValorPG);
    SomaPago     := SomaPago     + Arredonda(Entidade.ValorPG);
  end;
  SomaTotalMes    := SomaTotalMes    + Arredonda(Entidade.Valor);
  SomaJurosMes    := SomaJurosMes    + Arredonda(Entidade.Juros);
  SomaDescontoMes := SomaDescontoMes + Arredonda(Entidade.Desconto);
  SomaTotal    := SomaTotal    + Arredonda(Entidade.Valor);
  SomaJuros    := SomaJuros    + Arredonda(Entidade.Juros);
  SomaDesconto := SomaDesconto + Arredonda(Entidade.Desconto);
end;

procedure Trpt_BaixaRec.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalValor.Caption     := Format('%.2f',[Somatotal]);
  if SomaJuros > 0 then
    zrlTotalJuros.Caption   := Format('%.2f',[SomaJuros])
  else
    zrlTotalJuros.Caption   := '-';
  if SomaDesconto > 0 then
    zrlTotalDesconto.Caption:= Format('%.2f',[SomaDesconto])
  else
    zrlTotalDesconto.Caption:= '-';
  zrlTotalPago.Caption      := Format('%.2f',[SomaPago]);

  zrlTotalCredito.Caption   := Format('%.2f',[vTotalCredito]);

  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_BaixaRec.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Somatotal    :=0;
  SomaJuros    :=0;
  SomaDesconto :=0;
  SomaPago     :=0;
end;

procedure Trpt_BaixaRec.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if UpperCase(zrbGrupo.Expression) = 'MES+ANO' then
    SZRLabel7.Caption := '* '+PreencheZero(2,Entidade.FieldByName('Mes').AsString)+'/'+
      Entidade.FieldByName('Ano').AsString
  else if UpperCase(zrbGrupo.Expression) = 'DIA+MES+ANO' then
    SZRLabel7.Caption := '* '+PreencheZero(2,Entidade.FieldByName('Dia').AsString)+'/'+
      PreencheZero(2,Entidade.FieldByName('Mes').AsString)+'/'+
      Entidade.FieldByName('Ano').AsString;
  SomaTotalMes := 0;
  SomaJurosMes := 0;
  SomaDescontoMes := 0;
  SomaPagoMes  := 0;
  vSubTotalCredito := 0;
end;

procedure Trpt_BaixaRec.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSubTotalValor.Caption    := Format('%.2f',[SomaTotalMes]);
  if SomaJurosMes > 0 then
    zrlSubTotalJuros.Caption  := Format('%.2f',[SomaJurosMes])
  else
    zrlSubTotalJuros.Caption  := '-';
  if SomaDescontoMes > 0 then
    zrlSubTotalDesconto.Caption := Format('%.2f',[SomaDescontoMes])
  else
    zrlSubTotalDesconto.Caption := '-';
  zrlTotalValorPago.Caption   := Format('%.2f',[SomaPagoMes]);

  zrlSubTotalCredito.Caption   := Format('%.2f',[vSubTotalCredito]);
end;

procedure Trpt_BaixaRec.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  TotalRegistros := 0;
  vTotalCredito := 0;
end;

procedure Trpt_BaixaRec.zrbGrupoCaixaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrlGrupoCaixa.Height <= 0 then
    Exit;

  DM.SelecionaParametro(Entidade.fieldbyname('CCX_GRUPO').AsInteger);
  if not DM.Parametro1.IsEmpty then
    zrlGrupoCaixa.Caption := DM.Parametro1.Descricao
  else
    zrlGrupoCaixa.Caption := 'SEM GRUPO';
end;

procedure Trpt_BaixaRec.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
