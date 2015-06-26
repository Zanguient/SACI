unit UFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Caixa, Conta_de_Caixa, Pedido_de_Compra, Titulo_receber,
  Pedido_de_Venda, Titulo_a_Pagar;

type
  Trpt_FluxoCaixa = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Movimento_caixa1: TMovimento_caixa;
    ZRLabel6: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel14: TSZRLabel;
    zrbRodapePagina: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrbSumario: TSZRBand;
    ZRLabel17: TSZRLabel;
    zrbGrupoData1: TSZRGroup;
    ZRGroup2: TSZRGroup;
    ZRLabel7: TSZRLabel;
    ZRLabel12: TSZRLabel;
    Movimento_caixa1dtmovi: TStringField;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    Movimento_caixa1MVC_CODIGO: TIntegerField;
    Movimento_caixa1CNC_CODIGO: TIntegerField;
    Movimento_caixa1CCX_CODIGO: TIntegerField;
    Movimento_caixa1CAX_CODIGO: TIntegerField;
    Movimento_caixa1MVC_DESCRICAO: TStringField;
    Movimento_caixa1MVC_DATA: TDateTimeField;
    Movimento_caixa1MVC_DC: TStringField;
    Movimento_caixa1MVC_VALOR: TFloatField;
    Movimento_caixa1MVC_FLAG: TStringField;
    Movimento_caixa1MVC_TIT_TIPO: TIntegerField;
    Movimento_caixa1MVC_TIT_CC: TIntegerField;
    Movimento_caixa1MVC_TIT_NUMERO: TStringField;
    Movimento_caixa1MVC_TIPO_PGTO: TIntegerField;
    Movimento_caixa1MVC_TIT_SEQUENCIA: TStringField;
    Movimento_caixa1MVC_OBSERVACAO1: TStringField;
    Movimento_caixa1TIT_CODIGO: TIntegerField;
    Movimento_caixa1CNC_TITULO: TIntegerField;
    Movimento_caixa1MVC_PT: TStringField;
    Movimento_caixa1MVC_COMPETENCIA: TDateTimeField;
    Conta_de_Caixa1: TConta_de_Caixa;
    Caixa1: TCaixa;
    zrlCreditoGeral: TSZRLabel;
    zrlDebitoGeral: TSZRLabel;
    Movimento_caixa1USU_CODIGO: TIntegerField;
    Movimento_caixa1MVC_DT_ALTERADO: TDateTimeField;
    zrlUsuario: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlSaldoGeral: TSZRLabel;
    zrlCreditoDetalhe: TSZRLabel;
    zrlDebitoDetalhe: TSZRLabel;
    zrlSaldoDetalhe: TSZRLabel;
    zrbTitulo: TSZRBand;
    SZRLabel5: TSZRLabel;
    zrlSaldoGeralAnterior: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlContaAgendada: TSZRLabel;
    zrlDescricao: TSZRLabel;
    Movimento_caixa1CCX_CODIGO_REC: TIntegerField;
    Movimento_caixa1MVC_NAO_CONTABIL: TIntegerField;
    Movimento_caixa1MVC_ORIGEM_EXTORNO: TIntegerField;
    Movimento_caixa1MVC_JUROS: TFloatField;
    Movimento_caixa1MVC_DESCONTO: TFloatField;
    Movimento_caixa1MVC_CRED_CLI: TFloatField;
    Movimento_caixa1MVC_VALOR_DOC: TFloatField;
    zrbGrupoCAX: TSZRGroup;
    zrlDescricaoCaixa: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    zrlCredito: TSZRLabel;
    zrlDebito: TSZRLabel;
    zrlSaldo: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlSaldoDia: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlLinha1: TSZRLabel;
    zrlLinha2: TSZRLabel;
    Movimento_caixa1MVC_MAQUINA: TIntegerField;
    Movimento_caixa1MVC_DT_CHEQUE: TDateTimeField;
    Movimento_caixa1CHQ_CODIGO: TIntegerField;
    Movimento_caixa1CNC_CHEQUE: TIntegerField;
    Movimento_caixa1ObsTitulo: TStringField;
    Movimento_caixa1PDV: TStringField;
    Movimento_caixa1CodigoCliente: TStringField;
    Titulo_receber1: TTitulo_receber;
    Pedido_de_Compra1: TPedido_de_Compra;
    Pedido_de_Venda1: TPedido_de_Venda;
    Titulo_a_pagar1: TTitulo_a_pagar;
    Movimento_caixa1Nota: TStringField;
    SZRLabel8: TSZRLabel;
    zrlTotalCredito: TSZRLabel;
    zrlDescTotalCreditoExtorno: TSZRLabel;
    zrlTotalCreditoExtorno: TSZRLabel;
    zrlCodigoMVC: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoData1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalhe1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTituloBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Movimento_caixa1CalcFields(DataSet: TDataSet);
    procedure zrbGrupoCAXBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vTotalCredito: Double;
  public
    Entidade :TMovimento_caixa;
    SaldoGeral, Credito,Debito,CreditoTotal,DebitoTotal,vSomaCredito:Double;
    vSomenteCredito: Boolean;
  end;

var
  rpt_FluxoCaixa: Trpt_FluxoCaixa;

implementation
Uses
  UDM, Funcoes, URelData;
{$R *.DFM}

procedure Trpt_FluxoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Caixa1.Close;
  Conta_de_Caixa1.Close;
  Entidade.Close;
  Action := caFree;
end;

procedure Trpt_FluxoCaixa.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FluxoCaixa.zrbGrupoData1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel12.Caption:=Datetostr(Entidade.Data);
end;

procedure Trpt_FluxoCaixa.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;

  if vSomenteCredito then
  Begin
    zrlContaAgendada.Alignment := taRightJustify;
    zrlContaAgendada.Width := 10;
  end;
end;

procedure Trpt_FluxoCaixa.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalCredito.Caption := Format('%.2f',[vTotalCredito]);

  zrlCreditoGeral.Caption:=format('%.2f',[CreditoTotal]);
  zrlDebitoGeral.Caption:=format('%.2f',[DebitoTotal]);
  zrlSaldoGeral.Caption:=format('%.2f',[SaldoGeral]);

  if vSomenteCredito then
    zrlTotalCreditoExtorno.Caption := Format('%.2f',[StrToFloat(zrlTotalCredito.Caption)+StrToFloat(zrlDebitoGeral.Caption)])
  else
  Begin
    zrlDescTotalCreditoExtorno.Caption := '';
    zrlTotalCreditoExtorno.Caption := '';
  end;
end;

procedure Trpt_FluxoCaixa.FormCreate(Sender: TObject);
begin
  Entidade := Movimento_caixa1;
  SaldoGeral := 0;
  CreditoTotal:=0;
  DebitoTotal:=0;
  vSomaCredito:=0;
  vSomenteCredito := False;
  vTotalCredito := 0;
end;

procedure Trpt_FluxoCaixa.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSaldoDia.Caption:=format('%.2f',[Credito-Debito]);
  zrlCredito.Caption:=format('%.2f',[Credito]);
  zrlDebito.Caption:=format('%.2f',[Debito]);
  zrlSaldo.Caption:=format('%.2f',[SaldoGeral]);
end;

procedure Trpt_FluxoCaixa.zrbDetalhe1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao, sConta: string;
begin
  zrlCodigoMVC.Caption := PreencheZero(2,Entidade.CodigoCNC)+'-'+IntToStr(Entidade.CodigoMVC);

  if Entidade.Dc = 'C' then
  Begin
    vTotalCredito := vTotalCredito + Arredonda(Entidade.CreditoCliente);
    zrlCreditoDetalhe.Caption := format('%.2f',[Entidade.Valor]);
    zrlDebitoDetalhe.Caption := '';
    Credito := Credito + Arredonda(Entidade.Valor);
    CreditoTotal := CreditoTotal + Arredonda(Entidade.Valor);
    SaldoGeral := SaldoGeral + Entidade.Valor;
  end
  else if Entidade.Dc = 'D' then
  Begin
    vTotalCredito := vTotalCredito - Arredonda(Entidade.CreditoCliente);
    zrlCreditoDetalhe.Caption := '';
    zrlDebitoDetalhe.Caption := format('%.2f',[Entidade.Valor]);
    Debito := Debito + Arredonda(Entidade.Valor);
    DebitoTotal := DebitoTotal + Arredonda(Entidade.Valor);
    SaldoGeral := SaldoGeral - Entidade.Valor;
  end;
  zrlSaldoDetalhe.Caption := format('%.2f',[SaldoGeral]);

  //Conta Agendada
  with Conta_de_Caixa1 do
  Begin
    if CodigoCCX <> Entidade.CodigoCCX then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
      Open;
    end;
    sConta := Descricao;
  end;

  //Conta Recebida
  if Entidade.CodigoCCX <> Entidade.CodigoCCXRecebimento then
  Begin
    with Conta_de_Caixa1 do
    Begin
      if CodigoCCX <> Entidade.CodigoCCXRecebimento then
      Begin
        Close;
        ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCXRecebimento;
        Open;
      end;
      sConta := sConta + ' - ' + Descricao;
    end;
  end;

  vSomaCredito := vSomaCredito + Arredonda(Entidade.CreditoCliente);
  if vSomenteCredito then
    zrlContaAgendada.Caption := Format('%.2f',[Entidade.CreditoCliente])
  else
  Begin
    if Length(sConta) > zrlContaAgendada.Width then
      zrlContaAgendada.Caption := Copy(sConta,1,zrlContaAgendada.Width)
    else
      zrlContaAgendada.Caption := sConta;
  end;

  if DM.Configuracao1.Empresa = empLBM then
    sDescricao := Trim(Entidade.FieldByName('ObsTitulo').asString+' '+Entidade.Descricao)
  else
    sDescricao := Trim(Entidade.Descricao+' '+Entidade.FieldByName('ObsTitulo').asString);

  if Length(sDescricao) > zrlDescricao.Width then
    zrlDescricao.Caption := Copy(sDescricao,1,zrlDescricao.Width)
  else
    zrlDescricao.Caption := sDescricao;
end;

procedure Trpt_FluxoCaixa.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_FluxoCaixa.zrbTituloBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSaldoGeralAnterior.Caption := format('%.2f',[SaldoGeral]);
end;

procedure Trpt_FluxoCaixa.Movimento_caixa1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('DTMOVI').AsString:=FormatDateTime('dd/mm/yyyy',Entidade.FieldByName('MVC_DATA').AsDateTime);
  Titulo_receber1.Close;
  Entidade.FieldByName('PDV').AsString:='';
  Entidade.FieldByName('CodigoCliente').asString := '';
  Entidade.FieldByName('ObsTitulo').AsString := '';

  If (Entidade.FieldByName('TIT_CODIGO').asString<>'') and
     (Entidade.FieldByName('CNC_TITULO').asString<>'') and
     (Entidade.Flag <> '2') then //Título a Receber
  Begin
    with Titulo_receber1 do
    Begin
      Close;
      SQL.Text:='SELECT CNC_CODIGO,CLI_CODIGO,PDV_CODIGO,TRC_OBSERVACAO '+
        'FROM TITULO_A_RECEBER '+
        'WHERE CNC_CODIGO='+Entidade.FieldByName('CNC_TITULO').asString+
        ' AND TRC_CODIGO='+Entidade.FieldByName('TIT_CODIGO').asString;
      Open;
      If not IsEmpty then
      Begin
        Entidade.FieldByName('ObsTitulo').AsString := OBS;
        if CodigoPDV > 0 then
          Entidade.FieldByName('PDV').AsString:=IntToStr(CodigoPDV)
        else
          Entidade.FieldByName('PDV').AsString:='';
        Entidade.FieldByName('CodigoCliente').asString := 'CLI:'+IntToStr(CodigoCLI);

        if TipoPedido = 0 then //Pedido de Venda
        Begin
          Pedido_de_Venda1.Close;
          Pedido_de_Venda1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
          Pedido_de_Venda1.ParamByName('PDV_CODIGO').asInteger := CodigoPDV;
          Pedido_de_Venda1.Open;
          If not Pedido_de_Venda1.IsEmpty then
          Begin
            if Pedido_de_Venda1.NotaFiscal = -1 then
              Entidade.FieldByName('Nota').AsString:= 'LJ3'
            else if Pedido_de_Venda1.NotaFiscal = -2 then
              Entidade.FieldByName('Nota').AsString:= 'LJ4'
            else if Pedido_de_Venda1.NotaFiscal > 0 then
            Begin
              case Pedido_de_Venda1.NotaCupom of
                1: Entidade.FieldByName('Nota').AsString:= 'N'+IntToStr(Pedido_de_Venda1.NotaFiscal);
                2: Entidade.FieldByName('Nota').AsString:= 'C'+IntToStr(Pedido_de_Venda1.NotaFiscal);
              end;
            end;
          end;
        end
        else if TipoPedido = 0 then //Pedido de Serviço
        Begin
          //É o Mesmo de PDV
        end
        else if TipoPedido = 2 then //Pacote de Crédito
          Entidade.FieldByName('Nota').AsString:= '';
      end;
    end;
  end
  else If (Entidade.FieldByName('TIT_CODIGO').asString<>'') and
          (Entidade.FieldByName('CNC_TITULO').asString<>'') and
          (Entidade.Flag = '2') then //Título a Pagar
  Begin
    with Titulo_a_pagar1 do
    Begin
      Close;
      SQL.Text:='SELECT CNC_CODIGO,FOR_CODIGO,TRN_CODIGO,PCP_CODIGO,TPG_OBSERVACAO '+
        'FROM TITULO_A_PAGAR '+
        'WHERE CNC_CODIGO='+Entidade.FieldByName('CNC_TITULO').asString+
        ' AND TPG_CODIGO='+Entidade.FieldByName('TIT_CODIGO').asString;
      Open;
      if not IsEmpty then
      Begin
        Entidade.FieldByName('ObsTitulo').AsString := OBS;
        if CodigoPCP > 0 then
          Entidade.FieldByName('PDV').AsString:=IntToStr(CodigoPCP)
        else
          Entidade.FieldByName('PDV').AsString:='';
        if CodigoFOR > 0 then
          Entidade.FieldByName('CodigoCliente').asString := 'FOR:'+IntToStr(CodigoFOR)
        else if CodigoTRN > 0 then
          Entidade.FieldByName('CodigoCliente').asString := 'TRN:'+IntToStr(CodigoTRN);

        Pedido_de_Compra1.Close;
        Pedido_de_Compra1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
        Pedido_de_Compra1.ParamByName('PCP_CODIGO').asInteger := CodigoPCP;
        Pedido_de_Compra1.Open;
        If not Pedido_de_Compra1.IsEmpty then
        Begin
          if Pedido_de_Compra1.SN then
            Entidade.FieldByName('Nota').AsString:= 'LJ3'
          else if Pedido_de_Compra1.LJ4 then
            Entidade.FieldByName('Nota').AsString:= 'LJ4'
          else if Pedido_de_Compra1.NotaFiscal > 0 then
            Entidade.FieldByName('Nota').AsString:= 'N'+IntToStr(Pedido_de_Compra1.NotaFiscal);
        end;
      end;
    end;
  end;
end;

procedure Trpt_FluxoCaixa.zrbGrupoCAXBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Credito := 0;
  Debito := 0;
  with Caixa1 do
  Begin
    if (CodigoCAX <> Entidade.CodigoCAX) or
       (CodigoCNC <> Entidade.CodigoCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
      ParamByName('CAX_CODIGO').asInteger:=Entidade.CodigoCAX;
      Open;
    end;
    if not IsEmpty then
      zrlDescricaoCaixa.Caption := 'Caixa: '+Descricao+'('+IntToStr(Entidade.CodigoCAX)+')'
    else
      zrlDescricaoCaixa.Caption := 'Caixa: *NAO CADASTRADO ('+IntToStr(Entidade.CodigoCAX)+')';
  end;
end;

end.
