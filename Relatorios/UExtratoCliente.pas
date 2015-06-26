unit UExtratoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Cliente, Contato,
  Pedido_de_Venda, CentroCusto, AgenteFin, Titulo_receber;

type
  Trpt_ExtratoCliente = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    ZRDBText4: TSZRDBText;
    zrbSumario: TSZRBand;
    zrlValorComJuros: TSZRLabel;
    AgenteFin1: TAgenteFin;
    zrlCentroBanco: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrdDataOrigem: TSZRDBText;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel22: TSZRLabel;
    zrlSaldoAnterior: TSZRLabel;
    zrlLinhaRodapeDia: TSZRLabel;
    SZRLabel26: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    SZRLabel5: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupoCliente: TSZRGroup;
    SZRLabel8: TSZRLabel;
    zrlCliente: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlValorDoc: TSZRLabel;
    zrlDataPagamento: TSZRLabel;
    SZRDBText1: TSZRDBText;
    zrlAL: TSZRLabel;
    zrlDiasAtraso: TSZRLabel;
    zrlChequeDinheiro: TSZRLabel;
    zdbCodigoPDV: TSZRDBText;
    zrlComentario: TSZRLabel;
    zrlValorPago: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlEndereco: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlFones: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlContato: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlTotalLancado: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlTotalRecebido: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrlTotalVencido: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlTotalAVencer: TSZRLabel;
    SZRLabel27: TSZRLabel;
    zrlSaldoAtual: TSZRLabel;
    SZRLabel29: TSZRLabel;
    zrlSadoAtualComJuros: TSZRLabel;
    SZRLabel31: TSZRLabel;
    zrlValorMaiorPDV: TSZRLabel;
    SZRLabel33: TSZRLabel;
    zrlDataPrimeiroPDV: TSZRLabel;
    SZRLabel37: TSZRLabel;
    zrlValorUltimoPDV: TSZRLabel;
    SZRLabel39: TSZRLabel;
    zrlDataUltimoPDV: TSZRLabel;
    SZRLabel41: TSZRLabel;
    zrlMaiorAtraso: TSZRLabel;
    Titulo_receber2: TTitulo_receber;
    zrlDataEmissao: TSZRLabel;
    zrlDataEnvBanco: TSZRLabel;
    zrlDataRecBanco: TSZRLabel;
    zrlTipo: TSZRLabel;
    zrlVencimentoOrigem: TSZRLabel;
    zrlCodigoFPE: TSZRLabel;
    zrlVencimento: TSZRLabel;
    zrlDescCodigo: TSZRLabel;
    zrlDescSeq: TSZRLabel;
    zrlDescAgente: TSZRLabel;
    zrlDescNumero: TSZRLabel;
    zrlDescOrigem: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel35: TSZRLabel;
    zrlVendedor: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrlDescCodigoFPE: TSZRLabel;
    SZRLabel25: TSZRLabel;
    zrlLinha3: TSZRLabel;
    zrlDadosCheque: TSZRLabel;
    Contato1: TContato;
    Cliente1: TCliente;
    zrlDataFIM: TSZRLabel;
    zrlDataINI: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlProfissao: TSZRLabel;
    zrlDescPaiMae: TSZRLabel;
    zrlPaiMae: TSZRLabel;
    zrlDescObservacao: TSZRLabel;
    zrlObservacao: TSZRLabel;
    SZRPontoRef: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRClassificacao: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRRG: TSZRLabel;
    SZRCPF1: TSZRLabel;
    SZRCPF: TSZRLabel;
    lblTIPO: TSZRLabel;
    SZRLabel36: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoClienteBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros : integer;
    DtReferencia: TDateTime;
  public
    Entidade: TTitulo_receber;
    SubTotalDoc,SubTotalPago,SubTotalComJuros,SubVencidos,SubAVencer:Double;
  end;

var
  rpt_ExtratoCliente: Trpt_ExtratoCliente;

implementation
Uses
  UDM, Funcoes, MxSelTitulos;

{$R *.DFM}


procedure Trpt_ExtratoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_ExtratoCliente.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vSaldoCHQ: Double;
begin
  Inc(TotalRegistros);

  zrlTipo.Caption             := '';
  zrlDataPagamento.Caption    := '';
  zrlDiasAtraso.Caption       := '';
  zrlChequeDinheiro.Caption   := '';
  zrlDataEmissao.Caption      := '';
  zrlDataEnvBanco.Caption     := '';
  zrlDataRecBanco.Caption     := '';
  zrlDadosCheque.Caption      := '';
  zrlValorComJuros.Caption    := '-';
  zrlValorPago.Caption        := '-';
  zrlCodigoFPE.Caption        := '';
  zrlVencimentoOrigem.Caption := '';

  if (Entidade.CodigoCHQ > 0) and
     (Entidade.ChequeDevolvido) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM TITULO_A_RECEBER T1, CHEQUE C1 '+
        ' WHERE T1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND T1.TRC_REABERTURA='+IntToStr(Entidade.CodigoTRC)+
        ' AND C1.CNC_CODIGO=T1.CNC_CHEQUE '+
        ' AND C1.CHQ_CODIGO=T1.CHQ_CODIGO ';
      Open;
      if not IsEmpty then
        zrlDadosCheque.Caption := 'CH'+FieldByName('CHQ_NUMERO').asString;
    end;
  end;

  if Entidade.VencimentoORI > StrToDate('01/01/1901') then
    zrlVencimentoOrigem.Caption := DateToStr(Entidade.VencimentoORI);

  if Entidade.CodigoFPE > 0 then
    zrlCodigoFPE.Caption := IntToStr(Entidade.CodigoFPE);

  if Entidade.CodigoPDV > 0 then
  Begin
    zdbCodigoPDV.Enabled := True;
    with DM.QR_Consultas do
    Begin
      if Entidade.TipoPedido = 2 then //Pacote de Crédito
        zrlTipo.Caption := 'C'
      else //Pacote ou Pedido de Venda
      Begin
        if Entidade.TipoPedido = 1 then //Pacote de Crédito
        Begin
          zrlTipo.Caption := 'P';
          Close;
          SQL.Text := 'SELECT PCT_DT_EMISSAO_VENDA AS EMISSAO '+
            ' FROM PACOTE_DE_VENDA P1 '+
            ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
          Open;
        end
        else //Pedido de Venda
        Begin
          zrlTipo.Caption := 'V';
          Close;
          SQL.Text := 'SELECT PDV_DT_EMISSAO_VENDA AS EMISSAO '+
            ' FROM PEDIDO_DE_VENDA P1 '+
            ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
          Open;
        end;
        if Trim(FieldByName('EMISSAO').asString) <> '' then
          if FieldByName('EMISSAO').asDateTime > StrToDate('01/01/1901') then
            zrlDataEmissao.Caption := DateToStr(FieldByName('EMISSAO').asDateTime);
      end;
    end;
  end
  else
    zdbCodigoPDV.Enabled := False;

  if Entidade.FieldByName('ORDEM').asInteger <> 0 then  //Cheques
  Begin
    if Entidade.DataEmissaoBoleto > StrToDate('01/01/2004') then
      zrlDataEnvBanco.Caption := DateToStr(Entidade.DataEmissaoBoleto);

    if Entidade.DataRecebimentoBoleto > StrToDate('01/01/2004') then
      zrlDataRecBanco.Caption := DateToStr(Entidade.DataRecebimentoBoleto);

    if Entidade.TipoPag = 5 then
      zrlChequeDinheiro.Caption := 'DI'
    else if Entidade.TipoPag = 6 then
      zrlChequeDinheiro.Caption := 'CH'
    else if Entidade.TipoPag = 13 then
      zrlChequeDinheiro.Caption := 'CA'
    else if Entidade.TipoPag = 412 then
      zrlChequeDinheiro.Caption := 'BO'
    else if Entidade.TipoPag = 416 then
      zrlChequeDinheiro.Caption := 'DC';

    SubTotalDoc  := SubTotalDoc  + Arredonda(Entidade.Valor);
    SubTotalPago := SubTotalPago + Arredonda(Entidade.ValorPG);

    zrlValorDoc.Caption := format('%.2f',[Entidade.Valor]);

    if (Entidade.Situacao = 2) then
      zrlValorPago.Caption := format('%.2f',[Entidade.ValorPG+Entidade.Cred_Cli]);

    if (Entidade.DataEmissaoBoleto > StrToDate('01/01/1901')) then
    Begin
      if (Entidade.DataRecebimentoBoleto > StrToDate('01/01/1901')) then
        zrlCentroBanco.Caption := 'BANCO-EMI'
      else
        zrlCentroBanco.Caption := 'BANCO-RET';
    end
    else if Entidade.Verificado >= 1 then
      zrlCentroBanco.Caption := 'CPD-VERIF.'+PreencheZero(2,Entidade.Verificado)
    else
      zrlCentroBanco.Caption := IntToStr(Entidade.CodigoCNC);

    if Entidade.Pagamento > StrToDate('01/01/1901') then
    Begin
      zrlDataPagamento.Caption := DateToStr(Entidade.Pagamento);
      if Trunc(Entidade.Pagamento) > Trunc(Entidade.Vencimento) then
        zrlDiasAtraso.Caption := IntToStr(Trunc(Entidade.pagamento-Entidade.Vencimento));
    end
    else if Trunc(Entidade.Vencimento) < Trunc(DtReferencia) then
      zrlDiasAtraso.Caption := IntToStr(Trunc(DtReferencia-Entidade.Vencimento));

    If (Entidade.Vencimento<DtReferencia) then
    Begin

      with DM.Conta_de_Caixa1 do
      Begin
        if (not Active) or
           (CodigoCCX <> Entidade.CodigoCCX) then
        Begin
          Close;
          ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
          Open;
        end;
      end;

      if Entidade.Situacao = 0 then
        SubVencidos := SubVencidos + Arredonda(Entidade.Valor);
      if (DM.Configuracao1.Empresa = empLBM) and //LBM
         (DM.Conta_de_Caixa1.Grupo = 452) then //CONDOMINIO/ALUGUEIS SALAS
      Begin
        //1% ao mês + 10% multa
        zrlValorComJuros.Caption:=Format('%.2f', [Arredonda(Entidade.Valor)*(1*(DtReferencia-Entidade.Vencimento)/3000)+
                                 (Arredonda(Entidade.Valor)*0.1)]);
        if Entidade.Situacao = 0 then
          SubTotalComJuros := SubTotalComJuros+(Arredonda(Entidade.Valor)*(1*(DtReferencia-Entidade.Vencimento)/3000)+
                              (Arredonda(Entidade.Valor)*0.1));
      end
      else
      Begin
        zrlValorComJuros.Caption:=format('%.2f',[Arredonda(Entidade.Valor)+
                         (Arredonda(Entidade.Valor)*(DM.Configuracao1.TaxaJuros*(DtReferencia-Entidade.Vencimento)/3000))]);
        if Entidade.Situacao = 0 then
          SubTotalComJuros := SubTotalComJuros+Arredonda(Entidade.Valor)+
                              (Arredonda(Entidade.Valor)*(DM.Configuracao1.TaxaJuros*(DtReferencia-Entidade.Vencimento)/3000));
      end;
    end
    Else
    Begin
      zrlValorComJuros.Caption:=format('%.2f',[Entidade.Valor]);
      if Entidade.Situacao = 0 then
        SubAVencer := SubAVencer + Arredonda(Entidade.Valor);
    end;
  end
  else //Cheque
  Begin
    zrlValorDoc.Caption := format('%.2f',[Entidade.Valor]);
    vSaldoCHQ := CalculaSaldoCheque(DM.QR_Consultas2, Entidade.ChequeCNC, Entidade.CodigoCHQ);
    if vSaldoCHQ > 0 then
    Begin
      zrlValorComJuros.Caption := 'Saldo:';
      zrlValorPago.Caption := Format('%.2f',[vSaldoCHQ]);
    end;
  end;
end;

procedure Trpt_ExtratoCliente.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;

  if not VerificaDataBranco(zrlDataFIM.Caption) then
    DtReferencia := DM.Configuracao1.Data
  else
    DtReferencia := StrToDate(zrlDataFIM.Caption);
end;

procedure Trpt_ExtratoCliente.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  TotalRegistros := 0;
end;

procedure Trpt_ExtratoCliente.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_ExtratoCliente.zrbGrupoClienteBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SubTotalDoc      := 0;
  SubTotalComJuros := 0;
  SubVencidos      := 0;
  SubAVencer       := 0;
  SubTotalPago     := 0;

  with Cliente1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.ClienteCNC) or
       (CodigoCLI <> Entidade.CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    zrlCliente.Caption := PreencheZero(2,Entidade.ClienteCNC)+'-'+IntToStr(Entidade.CodigoCLI)+'='+RazaoSocial+
                        '('+NomeFantasia+')';
    zrlProfissao.Caption := Profissao;
    zrlReferencia.Caption := Trim(Referencia1+' '+Referencia2+' '+Referencia3);
  end;


  //Contato
  with Contato1 do
  Begin
    Close;
    ParamByName('CNC_FOR').asInteger    := Entidade.ClienteCNC;
    ParamByName('FOR_CODIGO').asInteger := Entidade.CodigoCLI;
    Open;
    zrlContato.Caption := '';
    while not Eof do
    Begin
      if zrlContato.Caption <> '' then
        zrlContato.Caption := zrlContato.Caption + ' | ';
      zrlContato.Caption := zrlContato.Caption + Nome;
      Next;
    end;
  end;

  if zrlContato.Caption = '' then
  Begin
    zrlContato.Caption := Trim(Cliente1.Pai);
    if zrlContato.Caption <> '' then
      zrlContato.Caption := zrlContato.Caption +' / ';
    zrlContato.Caption := Trim(Cliente1.Mae);
  end;

  //Endereco
  zrlEndereco.Caption := Trim(DM.SelecionaParametro(Cliente1.Logradouro)+' '+Cliente1.Endereco+
                         ' '+Cliente1.Bairro+
                         ' '+Cliente1.Cidade+
                         ' '+Cliente1.Uf+
                         ' '+Cliente1.CEP);
  zrlFones.Caption := Trim(Cliente1.Fone);
  if Trim(Cliente1.Fax) <> '' then
    zrlFones.Caption :=  zrlFones.Caption + ' Fax: '+Trim(Cliente1.Fax);
  if Trim(Cliente1.Celular) <> '' then
    zrlFones.Caption :=  zrlFones.Caption + ' Celular: '+Trim(Cliente1.Celular);


  //HERE
  SZRPontoRef.Caption := Cliente1.FieldByName('CLI_REFERENCIA1').AsString;

  DM.QuerySelect.Close;
  DM.QuerySelect.SQL.Text := 'SELECT PAR_DESCRICAO FROM PARAMETRO WHERE PAR_CODIGO = '''+Cliente1.FieldByName('CLI_CLASSIFICACAO').AsString+'''';
  DM.QuerySelect.Open;
  SZRClassificacao.Caption := DM.QuerySelect.FieldByName('PAR_DESCRICAO').AsString;

  zrlObservacao.Caption := Cliente1.FieldByName('CLI_OBS1').AsString;
  zrlPaiMae.Caption := Cliente1.FieldByName('CLI_PAI').AsString + ' - ' + Cliente1.FieldByName('CLI_MAE').AsString;
  SZRRG.Caption := Cliente1.FieldByName('CLI_CGF_RG').AsString;
  SZRCPF.Caption := Cliente1.FieldByName('CLI_CGC_CPF').AsString;

  try
    DM.QuerySelect.Close;
    DM.QuerySelect.SQL.Text := 'SELECT PAR_DESCRICAO FROM PARAMETRO WHERE PAR_CODIGO = '''+Cliente1.FieldByName('CLI_TIPO').AsString+'''';
    DM.QuerySelect.Open;
    lblTIPO.Caption := DM.QuerySelect.FieldByName('PAR_DESCRICAO').AsString;
  except
  end;
end;

procedure Trpt_ExtratoCliente.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vSaldoAnterior: Double;
  iMaiorAtraso: integer;
begin
  if zrbRodapeGrupo.Height = 1 then  //Somente Linha
    Exit;

  vSaldoAnterior := 0;
  with Titulo_receber2 do
  Begin
    //Saldo Anterior
    if zrlDataINI.Caption = '  /  /    ' then
      zrlSaldoAnterior.Caption := '-'
    else
    Begin
      Close;
      SQL.Text := 'SELECT SUM(ROUND(TRC_VALOR,2)) AS TOTAL '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CLIENTE='+IntToStr(Entidade.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
        ' AND TRC_SITUACAO IN (0,1) '+
        ' AND TRC_DT_CADASTRO<"'+MesDia(zrlDataINI.Caption)+'" ';
      Open;
      vSaldoAnterior := FieldByName('TOTAL').asFloat;
      zrlSaldoAnterior.Caption := format('%.2f',[vSaldoAnterior]);
    end;

    //Lançados
    zrlTotalLancado.Caption := format('%.2f',[SubTotalDoc]);

    //Recebidos
    zrlTotalRecebido.Caption := format('%.2f',[SubTotalPago]);

    //Vencidos
    zrlTotalVencido.Caption := format('%.2f',[SubTotalComJuros]);

    //A Vencer
    zrlTotalAVencer.Caption := format('%.2f',[SubAVencer]);

    //Saldo Atual
    zrlSaldoAtual.Caption := format('%.2f',[vSaldoAnterior+SubAVencer+SubVencidos]);

    //Saldo Com Juros
    zrlSadoAtualComJuros.Caption := format('%.2f',[vSaldoAnterior+SubAVencer+SubTotalComJuros]);

    //Maior Pedido
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 (SELECT SUM((IPV_QUANTIDADE-IPV_BONIFICACAO)*ROUND(IPV_PRECO_DESC,2)) '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
        ' WHERE I1.CNC_CODIGO=P1.CNC_CODIGO '+
        ' AND I1.PDV_CODIGO=P1.PDV_CODIGO) AS TOTAL '+
        ' FROM PEDIDO_DE_VENDA P1 '+
        ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.ClienteCNC)+
        ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
        ' AND P1.PDV_SITUACAO=4 '+
        ' ORDER BY TOTAL DESC ';
      Open;
      zrlValorMaiorPDV.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);
    end;

    //Primeiro Pedido
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT MIN(PDV_DT_ENTREGA) AS DATA '+
        ' FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CLIENTE='+IntToStr(Entidade.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
        ' AND PDV_SITUACAO=4 ';
      Open;
      zrlDataPrimeiroPDV.Caption := formatDateTime('DD/MM/YYYY',FieldByName('DATA').AsDateTime);
    end;

    //Último Pedido
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT P1.PDV_DT_ENTREGA AS DATA, (SELECT SUM((IPV_QUANTIDADE-IPV_BONIFICACAO)*ROUND(IPV_PRECO_DESC,2)) '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
        ' WHERE I1.CNC_CODIGO=P1.CNC_CODIGO '+
        ' AND I1.PDV_CODIGO=P1.PDV_CODIGO) AS TOTAL '+ 
        ' FROM PEDIDO_DE_VENDA P1 '+
        ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.ClienteCNC)+
        ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
        ' AND P1.PDV_SITUACAO=4 ';
      Open;
      zrlValorUltimoPDV.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);
      if FieldByName('DATA').asDateTime > StrToDate('01/01/1901') then
        zrlDataUltimoPDV.Caption := DateToStr(FieldByName('DATA').asDateTime)
      else
        zrlDataUltimoPDV.Caption := '';
    end;

    //Maior Atraso
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 DATEDIFF(Day,TRC_VENCIMENTO,TRC_PAGAMENTO) AS ATRASO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE TRC_PAGAMENTO>TRC_VENCIMENTO+1 '+
        ' AND CNC_CLIENTE='+IntToStr(Entidade.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
        ' ORDER BY ATRASO DESC ';
      Open;
      iMaiorAtraso := FieldByName('ATRASO').asInteger;

      Close;
      SQL.Text := 'SELECT TOP 1 DATEDIFF(Day,TRC_VENCIMENTO,"'+MesDia(DtReferencia)+'") AS ATRASO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE TRC_SITUACAO=0 '+
        ' AND CNC_CLIENTE='+IntToStr(Entidade.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
        ' AND TRC_VENCIMENTO<"'+MesDia(DtReferencia)+'" '+
        ' ORDER BY ATRASO DESC ';
      Open;
      if FieldByName('ATRASO').asInteger > iMaiorAtraso then
        iMaiorAtraso := FieldByName('ATRASO').asInteger;

      zrlMaiorAtraso.Caption := IntToStr(iMaiorAtraso);
    end;
  end;
end;

procedure Trpt_ExtratoCliente.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

end.
