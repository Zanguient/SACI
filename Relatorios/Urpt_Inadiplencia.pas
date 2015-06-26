unit Urpt_Inadiplencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, Db, DBTables, SQuery, Titulo_receber, ZRCtrls,
  StrUtils, NotaFiscal, Pedido_de_Venda, Cliente;

type
  Trpt_Inadiplencia = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrbRodapePagina: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    TRCRenegociadoPago: TTitulo_receber;
    TRCRenegociadoParcial: TTitulo_receber;
    TRCRenegociadoParcialTOTAL: TFloatField;
    TRCRenegociadoPagoTOTAL: TFloatField;
    zrlDetalhe: TSZRBand;
    zrbSumario: TSZRBand;
    ZRLabel9: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlTotal: TSZRLabel;
    zrlDiferenca: TSZRLabel;
    zrlInadiplencia: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    Titulo_receber1TRC_CODIGO: TIntegerField;
    Titulo_receber1TRC_VENCIMENTO: TDateTimeField;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber1TRC_VALOR: TFloatField;
    Titulo_receber1TRC_SITUACAO: TIntegerField;
    Titulo_receber1TRC_VALOR_PAGO: TFloatField;
    SZRLabel17: TSZRLabel;
    Titulo_receber1CLI_CODIGO: TIntegerField;
    zrbGrupoSituacao: TSZRGroup;
    zrlRodapeGrupoSituacao: TSZRBand;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel24: TSZRLabel;
    zrlAberto: TSZRLabel;
    zrlCliente: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRDBText8: TSZRDBText;
    Titulo_receber1CNC_CODIGO: TIntegerField;
    Titulo_receber1PDV_CODIGO: TIntegerField;
    Titulo_receber1AGF_CODIGO: TIntegerField;
    Titulo_receber1CCX_CODIGO: TIntegerField;
    Titulo_receber1TRC_NUMERO: TStringField;
    Titulo_receber1TRC_SEQUENCIA: TStringField;
    Titulo_receber1TRC_PAGAMENTO: TDateTimeField;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    Titulo_receber1TRC_CUSTODIA: TStringField;
    Titulo_receber1TRC_TIPO_DOC: TIntegerField;
    Titulo_receber1TRC_CRED_CLI: TFloatField;
    Titulo_receber1TRC_TIPO_PAG: TIntegerField;
    Titulo_receber1CNC_CLIENTE: TIntegerField;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1USU_CODIGO: TIntegerField;
    Titulo_receber1TRC_DT_ALTERADO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_INICIO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_SITUACAO: TDateTimeField;
    Titulo_receber1CPC_CODIGO: TIntegerField;
    Titulo_receber1TRC_RGB_SITUACAO: TIntegerField;
    Titulo_receber1TRC_RGB_VISITADO: TSmallintField;
    Titulo_receber1TRC_RGB_DT_PROMESSA: TDateTimeField;
    Titulo_receber1TRC_PROCESSO: TIntegerField;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    SZRLabel12: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel27: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRLabel28: TSZRLabel;
    zrlDataPedido: TSZRLabel;
    SZRLabel30: TSZRLabel;
    zrlDataEmissao: TSZRLabel;
    Cliente1: TCliente;
    Pedido_de_Venda1: TPedido_de_Venda;
    NotaFiscal1: TNotaFiscal;
    zrlSituacao: TSZRLabel;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
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
    Titulo_receber1TRC_DT_CHEQUE: TDateTimeField;
    Titulo_receber1TRC_SIT_CHEQUE: TIntegerField;
    Titulo_receber1TRC_REABERTURA: TIntegerField;
    Titulo_receber1TRC_VERIFICADO: TIntegerField;
    Titulo_receber1TRC_DT_VERIFICADO: TDateTimeField;
    Titulo_receber1CHQ_CODIGO: TIntegerField;
    Titulo_receber1CNC_CHEQUE: TIntegerField;
    Titulo_receber1TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CV: TStringField;
    SZRLabel1: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel25: TSZRLabel;
    zrlVlrJur: TSZRLabel;
    SZRLabel31: TSZRLabel;
    ZRDBText9: TSZRDBText;
    zrlSequenc: TSZRLabel;
    Titulo_receber4: TTitulo_receber;
    zrlTipoPag: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlCobrador: TSZRLabel;
    zrlFormaPagamento: TSZRLabel;
    Titulo_receber1TRC_LOCAL: TStringField;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlRodapeGrupoSituacaoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoSituacaoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TTitulo_receber;
    Total,TotalAberto,vJuros,T1,T2,Q1:Double;
    { Public declarations }
  end;

var
  rpt_Inadiplencia: Trpt_Inadiplencia;

implementation

uses UDM, Funcoes, URelData, MxSelInadiplencia;

{$R *.DFM}

procedure Trpt_Inadiplencia.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Begin
  Total:=0;
  TotalAberto:=0;
  vJuros:=Arredonda(TRCRenegociadoParcial.FieldByName('TOTAL').asFloat)-
          Arredonda(TRCRenegociadoPago.FieldByName('TOTAL').asFloat);
end;

procedure Trpt_Inadiplencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_Inadiplencia.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if (DM.Configuracao1.Empresa = empLuciano) then
  begin
    SZRLabel30.Caption := 'Dias Atrz.';
    SZRLabel27.Caption := 'Sequenc.';
    SZRLabel8.Caption := 'Tip.Pg';
  end;
end;

procedure Trpt_Inadiplencia.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  vAuxJur: Double;
  sCliente: string;
  CdFUNCNC, CdFUN: integer;
begin
  with Entidade do
  begin
    if (TituloORI = 0) and (TituloANT = 0) then
      Total:=Total+Arredonda(Valor);
    if (ValorPG = 0) and (situacao <> 2) and (situacao <> 4) and (situacao <> 5) then
      TotalAberto:=TotalAberto+Arredonda(Valor);
    T1 := T1 + Arredonda(Valor);
    T2 := T2 + Arredonda(ValorPG);
    Q1 := Q1 + 1;
    //
    if Situacao = 0 then
    begin
      vAuxJur := Valor+(Valor*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-Vencimento)/3000));
      zrlVlrJur.Caption := Format('%.2f',[vAuxJur]);
    end
    else
      zrlVlrJur.Caption := '0,00';
  end;
  //
  if zrlDetalhe.Height = 0 then
    Exit;

  sCliente := '';
  if Entidade.CodigoCLI > 0 then
  Begin
    with Cliente1 do
    Begin
      if (CodigoCNC <> Entidade.ClienteCNC) and
         (CodigoCLI <> Entidade.CodigoCLI) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
        ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
        Open;
      end;
      sCliente := '('+IntToStr(Entidade.CodigoCLI)+')'+RazaoSocial;
    end;
  end;

  if Length(sCliente) > zrlCliente.Width then
    zrlCliente.Caption := Copy(sCliente,1,zrlCliente.Width)
  else
    zrlCliente.Caption := sCliente;

  zrlFormaPagamento.Caption := '';
  //Localizar Data do Pedido
  with Pedido_de_Venda1 do
  Begin
    if (CodigoCNC <> Entidade.CodigoCNC) or
       (CodigoPDV <> Entidade.CodigoPDV) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
      Open;
    end;
    if zrlDetalhe.Height > 1 then
      zrlFormaPagamento.Caption := 'FPG:'+DM.SelecionaFormaPagamento(CodigoFPG);
  end;
  if (DM.Configuracao1.Empresa = empLBM) and (Entidade.CodigoPDV > 0) then
    zrlDataPedido.Caption := DateToStr(Pedido_de_Venda1.DataHora)
  else if DM.Configuracao1.Empresa = empLBM then
    zrlDataPedido.Caption := DateToStr(Entidade.DataCadastro)
  else
    zrlDataPedido.Caption := DateToStr(Pedido_de_Venda1.DataHora);

  zrlDataEmissao.Caption := '';
  zrlCobrador.Caption := '';
  //Localizar Data de Emissão da Nota LBM
  if (DM.Configuracao1.Empresa = empLBM) and (Pedido_de_Venda1.NotaFiscal > 0) then
  Begin
    with NotaFiscal1 do
    Begin
      if (PedidoCNC <> Entidade.CodigoCNC) or
         (Pedido    <> Entidade.CodigoPDV) then
      Begin
        Close;
        ParamByName('CNC_PEDIDO').asInteger := Entidade.CodigoCNC;
        ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
        Open;
      end;
      if DataEmissao > 0 then
        zrlDataEmissao.Caption := DateToStr(DataEmissao);
    end;
  end
  else if (DM.Configuracao1.Empresa = empLuciano) then
  begin
    //Nome do Cobrador
    if zrlDetalhe.Height > 1 then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT CPC.CNC_CODIGO, CPC.FUN_CODIGO '+
          ' FROM COBRANCA_POR_COBRADOR CPC, ITEM_DE_COBRANCA_COBRADOR ICC '+
          ' WHERE ICC.CNC_TITULO='+IntToStr(Entidade.CodigoCNC)+
          ' AND ICC.TRC_CODIGO='+IntToStr(Entidade.CodigoTRC)+
          ' AND CPC.CNC_CODIGO=ICC.CNC_CODIGO '+
          ' AND CPC.CPC_CODIGO=ICC.CPC_CODIGO ';
        Open;
        CdFUNCNC := FieldByName('CNC_CODIGO').asInteger;
        CdFUN := FieldByName('FUN_CODIGO').asInteger;

        Close;
        SQL.Text := 'SELECT FUN_NOME '+
          ' FROM FUNCIONARIO '+
          ' WHERE CNC_CODIGO='+IntToStr(CdFUNCNC)+
          ' AND FUN_CODIGO='+IntToStr(CdFUN);
        Open;
        if not IsEmpty then
          zrlCobrador.Caption := 'COB:'+FieldByName('FUN_NOME').asString;
      end;
    end;

    SZRDBText1.Enabled := False;
    zrlTipoPag.Enabled := True;
    zrlTipoPag.Caption := Copy(DM.SelecionaParametro(Entidade.FieldByName('TRC_TIPO_PAG').AsInteger),1,5);
    //Dias de Atraso
    if (Entidade.DataOriginal > 0) then
      zrlDataEmissao.Caption := Format('%.0f',[DM.Configuracao1.Data-Entidade.DataOriginal])
    else
      zrlDataEmissao.Caption := Format('%.0f',[DM.Configuracao1.Data-Entidade.Vencimento]);
    szrDBText9.Enabled := False;
    zrDBText9.Enabled := True;
    zrlSequenc.Enabled := True;
    //
    zrlSequenc.Caption := '';
    Titulo_receber4.Close;
    if Entidade.FieldByName('PDV_CODIGO').AsInteger > 0 then
    begin
      Titulo_receber4.ParamByName('PDV_CODIGO').asInteger :=  Entidade.FieldByName('PDV_CODIGO').AsInteger;
      Titulo_receber4.ParamByName('CNC_CODIGO').asInteger :=  Entidade.FieldByName('CNC_CODIGO').AsInteger;
      Titulo_receber4.Open;
      if not Titulo_receber4.IsEmpty then
        zrlSequenc.Caption := '/'+PreencheZero(2,Titulo_Receber4.RecordCount);
    end;
  end;

  //
  // Exibicao do Relatorio
  if fMxSelInadiplencia.rdgVisualizar.ItemIndex = 1 then
  begin
    if Entidade.Situacao in [0,8] then  //Somente Abertos
      DoPrint := True  else  DoPrint := False;
  end
  else if fMxSelInadiplencia.rdgVisualizar.ItemIndex = 2 then
  begin
    if Entidade.Situacao in [2,4] then
      DoPrint := True  else  DoPrint := False;
  end;
end;

procedure Trpt_Inadiplencia.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotal.Caption:=Format('%.2f',[Total]);
  zrlAberto.Caption:=Format('%.2f',[TotalAberto]);
  zrlDiferenca.Caption:=Format('%.2f',[vJuros]);
  zrlInadiplencia.Caption:=Format('%.2f',[(TotalAberto/Total)*100])+'%';
end;

procedure Trpt_Inadiplencia.zrlRodapeGrupoSituacaoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  Posi: Integer;
begin
  SZRLabel22.Caption:=Format('%.2f',[T1]);
  SZRLabel23.Caption:=Format('%.2f',[T2]);
  SZRLabel10.Caption:=Format('%.0f',[Q1]);
  //
  Posi:=PosEx('ORDER',Entidade.SQL.Text);
  DM.QR_Consultas.Close;
  DM.QR_Consultas.SQL.Text := 'SELECT COUNT(CLI_CODIGO) AS QTDCLI FROM ('+Copy(Entidade.SQL.Text, 0,Posi-1)+') AS TABELA '+
    ' WHERE TRC_SITUACAO='+IntToStr(Entidade.Situacao)+' GROUP BY CLI_CODIGO';
  DM.QR_Consultas.Open;
  SZRLabel25.Caption:=IntToStr(DM.QR_Consultas.RecordCount);
  //
  // Exibicao do Relatorio
  if fMxSelInadiplencia.rdgVisualizar.ItemIndex = 1 then
  begin
    if Entidade.Situacao in [0,8] then  //Somente Abertos
      DoPrint := True  else  DoPrint := False;
  end
  else if fMxSelInadiplencia.rdgVisualizar.ItemIndex = 2 then
  begin
    if Entidade.Situacao in [2,4] then
      DoPrint := True  else  DoPrint := False;
  end;
end;

procedure Trpt_Inadiplencia.zrbGrupoSituacaoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  case Entidade.Situacao of
    0: zrlSituacao.Caption:='Em aberto';
    1: zrlSituacao.Caption:='Consignação';
    2: zrlSituacao.Caption:='Liquidado';
    3: zrlSituacao.Caption:='Liquidado';
    4: zrlSituacao.Caption:='Liquidado Reneg.';
    5: zrlSituacao.Caption:='Cancelado';
    6: zrlSituacao.Caption:='A Renegociar';
    7: zrlSituacao.Caption:='Perdoado';
    8: zrlSituacao.Caption:='Aberto Reneg.';
    else
      zrlSituacao.Caption := '';
  end;
  T1:=0;
  T2:=0;
  Q1:=0;
  //
  // Exibicao do Relatorio
  if fMxSelInadiplencia.rdgVisualizar.ItemIndex = 1 then
  begin
    if Entidade.Situacao in [0,8] then  //Somente Abertos
      DoPrint := True  else  DoPrint := False;
  end
  else if fMxSelInadiplencia.rdgVisualizar.ItemIndex = 2 then
  begin
    if Entidade.Situacao in [2,4] then
      DoPrint := True  else  DoPrint := False;
  end;
end;

procedure Trpt_Inadiplencia.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
end;

procedure Trpt_Inadiplencia.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.

