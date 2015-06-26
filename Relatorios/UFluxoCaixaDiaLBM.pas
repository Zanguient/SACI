unit UFluxoCaixaDiaLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Pedido_de_Venda, Titulo_receber, Conta_de_Caixa,
  Titulo_a_Pagar, Pedido_de_Compra, Pacote_de_Credito;

type
  Trpt_FluxoCaixaDiaLBM = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Movimento_caixa1: TMovimento_caixa;
    ZRLabel14: TSZRLabel;
    ZRExpression1: TSZRExpression;
    ZRExpression2: TSZRExpression;
    zrbSubTotal: TSZRBand;
    zrbTotal: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel17: TSZRLabel;
    zrbGrupoCAX: TSZRGroup;
    ZRBand5: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRSysData3: TSZRSysData;
    ZRLabel18: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRDBText7: TSZRDBText;
    ZRDBText8: TSZRDBText;
    Pedido_de_Venda1: TPedido_de_Venda;
    zrlCodigoPDV: TSZRDBText;
    ZRLabel21: TSZRLabel;
    ZRLabel22: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
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
    ZRLabel30: TSZRLabel;
    ZRLabel31: TSZRLabel;
    ZRLabel34: TSZRLabel;
    Movimento_caixa1CNC_TITULO: TIntegerField;
    Movimento_caixa1TIT_CODIGO: TIntegerField;
    Movimento_caixa1MVC_PT: TStringField;
    zrlDiaFluxo: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Movimento_caixa1MVC_OBSERVACAO1: TStringField;
    Movimento_caixa1MVC_COMPETENCIA: TDateTimeField;
    Movimento_caixa1USU_CODIGO: TIntegerField;
    Movimento_caixa1MVC_DT_ALTERADO: TDateTimeField;
    SZRLabel14: TSZRLabel;
    zrlContaAgendada: TSZRLabel;
    Conta_de_Caixa1: TConta_de_Caixa;
    Movimento_caixa1CCX_CODIGO_REC: TIntegerField;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    ZRLabel6: TSZRLabel;
    Titulo_a_pagar1: TTitulo_a_pagar;
    SZRDBText1: TSZRDBText;
    SZRLabel12: TSZRLabel;
    zrlDescCodigoCLI: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrlNumero: TSZRDBText;
    zrlCodigoMVC: TSZRDBText;
    Movimento_caixa1PDV: TStringField;
    zrlCD: TSZRLabel;
    zrlDescDinheiro: TSZRLabel;
    zrlDescCheque: TSZRLabel;
    zrlDescOutros: TSZRLabel;
    zrlDescAtual: TSZRLabel;
    zrlGeralDinheiro: TSZRLabel;
    zrlGeralCheque: TSZRLabel;
    zrlGeralOutros: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    zrlOutros: TSZRLabel;
    zrlDinheiro: TSZRLabel;
    zrlCheque: TSZRLabel;
    zrlDescAnterior: TSZRLabel;
    zrlGeralDinheiroAnt: TSZRLabel;
    zrlGeralChequeAnt: TSZRLabel;
    zrlGeralOutrosAnt: TSZRLabel;
    zrlTotalGeralAnt: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    Movimento_caixa1CodigoCliente: TStringField;
    zdbCodigoCLI: TSZRDBText;
    Pedido_de_Compra1: TPedido_de_Compra;
    Movimento_caixa1Nota: TStringField;
    SZRLabel1: TSZRLabel;
    Movimento_caixa1MVC_NAO_CONTABIL: TIntegerField;
    Movimento_caixa1MVC_ORIGEM_EXTORNO: TIntegerField;
    Movimento_caixa1MVC_JUROS: TFloatField;
    Movimento_caixa1MVC_DESCONTO: TFloatField;
    Movimento_caixa1MVC_CRED_CLI: TFloatField;
    Movimento_caixa1MVC_VALOR_DOC: TFloatField;
    Pacote_de_Credito1: TPacote_de_Credito;
    Movimento_caixa1MVC_MAQUINA: TIntegerField;
    Movimento_caixa1MVC_DT_CHEQUE: TDateTimeField;
    zrlDescricao: TSZRLabel;
    Movimento_caixa1ObsTitulo: TStringField;
    SZRLabel13: TSZRLabel;
    zrlTotParc: TSZRLabel;
    Titulo_receber2: TTitulo_receber;
    SZRLabel15: TSZRLabel;
    zrlTotalCredito: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbSubTotalAfterPrint(Sender: TObject; Printed: Boolean);
    procedure Movimento_caixa1CalcFields(DataSet: TDataSet);
    procedure zrbSubTotalBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros : integer;
    vTotalCredito: Double;
  public
    sOficial, sCCXRel, sGrupoRel, sNumTitulo, CdCodTitulo, sDescricao, sValorMVC : string;
    Entidade:TMovimento_caixa;
    SubTotMovCred, SomaMovCred, SomaMovDeb, SomaMovDebSub, TotalDinheiro,
      TotalCheque, TotalOutros:Double;
    vContaAgendada, vSomenteCredito: Boolean;
  end;

var
  rpt_FluxoCaixaDiaLBM: Trpt_FluxoCaixaDiaLBM;

implementation
Uses
  URelData,UDM, fUNCOES, MxFluxoDeCaixa, NotaFiscal;
{$R *.DFM}

procedure Trpt_FluxoCaixaDiaLBM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active := False;
  Titulo_receber1.Active := False;
  Pedido_de_Venda1.Active := False;
  Action := cafree;
end;

procedure Trpt_FluxoCaixaDiaLBM.zrbSubTotalAfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  if zrbSubTotal.Height = 0 then
    Exit;
    
//  if not Entidade.EOF then
//    report.NewPage;
end;

procedure Trpt_FluxoCaixaDiaLBM.Movimento_caixa1CalcFields(DataSet: TDataSet);
var
  vPagamentoAntecipado: Boolean;
begin
  Titulo_receber1.Close;
  Entidade.FieldByName('PDV').AsString:='';
  Entidade.FieldByName('CodigoCliente').asString := '';
  Entidade.FieldByName('ObsTitulo').AsString := '';

  vPagamentoAntecipado := False;
  try
    if Length(Entidade.Descricao) > 19 then
      if (Copy(Entidade.Descricao,1,19) = 'PAG ANTECIPADO PDV:') or
         (Copy(Entidade.Descricao,1,23) = 'EXT.PAG ANTECIPADO PDV:') then
        vPagamentoAntecipado := True;
  except

  end;

  if vPagamentoAntecipado then
  Begin
    if Copy(Entidade.Descricao,1,4) = 'EXT.' then
      Entidade.FieldByName('PDV').AsString := Trim(Copy(Entidade.Descricao,24,Length(Entidade.Descricao)-23))
    else
      Entidade.FieldByName('PDV').AsString := Trim(Copy(Entidade.Descricao,20,Length(Entidade.Descricao)-19));    
  end
  else If (Entidade.FieldByName('TIT_CODIGO').asString<>'') and
          (Entidade.FieldByName('CNC_TITULO').asString<>'') and
          (Entidade.Flag <> '2') then //Título a Receber
  Begin
    with Titulo_receber1 do
    Begin
      Close;
      SQL.Text:='SELECT CNC_CODIGO,CLI_CODIGO,PDV_CODIGO,TRC_OBSERVACAO,TRC_SEQUENCIA '+
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
          else if Pedido_de_Compra1.NotaFiscal > 0 then
            Entidade.FieldByName('Nota').AsString:= 'N'+IntToStr(Pedido_de_Compra1.NotaFiscal);
        end;
      end;
    end;
  end;
end;

procedure Trpt_FluxoCaixaDiaLBM.zrbSubTotalBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  GeralDinheiro, GeralCheque, GeralOutros : Double;
begin
  ZRLabel34.Caption:=Format('%.2f', [SubTotMovCred]);
  SZRLabel7.Caption:=Format('%.2f', [SomaMovDebSub]);
  SZRLabel6.Caption:=Format('%.2f', [SubTotMovCred-Somamovdebsub]);
  zrlDinheiro.Caption := Format('%.2f', [TotalDinheiro]);
  zrlCheque.Caption   := Format('%.2f', [TotalCheque]);
  zrlOutros.Caption   := Format('%.2f', [TotalOutros]);
  SubTotMovCred:=0;
  SomaMovDebSub:=0;

  if zrlDescDinheiro.Enabled then
  Begin
    with DM.QR_Consultas do
    Begin
      //Movimentos Gerais Anteriores
      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO=5 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralDinheiro := FieldByName('CREDITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO=5 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralDinheiro := GeralDinheiro - FieldByName('DEBITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO=6 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralCheque := FieldByName('CREDITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO=6 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralCheque := GeralCheque - FieldByName('DEBITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO<>5 '+
        ' AND MVC_TIPO_PGTO<>6 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralOutros := FieldByName('CREDITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO<>5 '+
        ' AND MVC_TIPO_PGTO<>6 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralOutros := GeralOutros - FieldByName('DEBITO').asFloat;

      zrlGeralDinheiroAnt.Caption := format('%.2f',[GeralDinheiro]);
      zrlGeralChequeAnt.Caption   := format('%.2f',[GeralCheque]);
      zrlGeralOutrosAnt.Caption   := format('%.2f',[GeralOutros]);
      zrlTotalGeralAnt.Caption    := format('%.2f',[GeralDinheiro+GeralCheque+GeralOutros]);

      //Movimentos Gerais
      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO=5 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralDinheiro := FieldByName('CREDITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO=5 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralDinheiro := GeralDinheiro - FieldByName('DEBITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO=6 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralCheque := FieldByName('CREDITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO=6 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralCheque := GeralCheque - FieldByName('DEBITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO<>5 '+
        ' AND MVC_TIPO_PGTO<>6 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralOutros := FieldByName('CREDITO').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO<>5 '+
        ' AND MVC_TIPO_PGTO<>6 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralOutros := GeralOutros - FieldByName('DEBITO').asFloat;

      zrlGeralDinheiro.Caption := format('%.2f',[GeralDinheiro]);
      zrlGeralCheque.Caption   := format('%.2f',[GeralCheque]);
      zrlGeralOutros.Caption   := format('%.2f',[GeralOutros]);
      zrlTotalGeral.Caption    := format('%.2f',[GeralDinheiro+GeralCheque+GeralOutros]);
    end;
  end;
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_FluxoCaixaDiaLBM.zrbTotalBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalCredito.Caption:=Format('%.2f', [vTotalCredito]);

  ZRLabel30.Caption:=Format('%.2f', [SomaMovCred]);
  ZRLabel31.Caption:=Format('%.2f', [SomaMovDeb]);
  SZRLabel4.Caption:=Format('%.2f', [SomaMovCred-SomaMovDeb]);
end;

procedure Trpt_FluxoCaixaDiaLBM.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FluxoCaixaDiaLBM.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  If Entidade.FieldByName('MVC_DC').AsString='C' then
    vTotalCredito := vTotalCredito + Arredonda(Entidade.CreditoCliente)
  else
    vTotalCredito := vTotalCredito - Arredonda(Entidade.CreditoCliente);

  if fmxFluxoDeCaixa.rdgNaoOficial.Checked and
     ((Entidade.CodigoCCX = DM.Configuracao1.ContaAbreCaixa) or
      (Entidade.CodigoCCX = DM.Configuracao1.ContaFechaCaixa)) then
  Begin
    DoPrint := False;
    Exit;
  end;

  If Entidade.FieldByName('MVC_DC').AsString='C' then
  begin
    SomaMovCred := SomaMovCred + Entidade.FieldByName('MVC_VALOR').AsFloat;
    SubTotMovCred := SubTotMovCred + Entidade.FieldByName('MVC_VALOR').AsFloat;
  end
  else If Entidade.FieldByName('MVC_DC').AsString='D' then
  Begin
    SomaMovDeb  := SomaMovDeb  + Entidade.FieldByName('MVC_VALOR').AsFloat;
    SomaMovDebSub  := somaMovDebSub + Entidade.FieldByName('MVC_VALOR').AsFloat;
  End;

  if vContaAgendada then
  Begin
    with Conta_de_Caixa1 do
    Begin
      if Entidade.CodigoCCX <> CodigoCCX then
      Begin
        Close;
        ParamByName('CCX_CODIGO').asInteger:=Entidade.CodigoCCX;
        Open;
      end;
      zrlContaAgendada.Caption := Descricao;
    end;
  end
  else
  Begin
    with Conta_de_Caixa1 do
    Begin
      if Entidade.CodigoCCXRecebimento <> CodigoCCX then
      Begin
        Close;
        ParamByName('CCX_CODIGO').asInteger:=Entidade.CodigoCCXRecebimento;
        Open;
      end;
      zrlContaAgendada.Caption := Descricao;
    end;
  end;

  case Entidade.TipoPGTO of
    5: Begin
         zrlCD.caption := 'DI';
         if (Entidade.CodigoCCX <> DM.Configuracao1.ContaFechaCaixa) then
         Begin
           if Entidade.FieldByName('MVC_DC').AsString='C' then
             TotalDinheiro := TotalDinheiro + Entidade.Valor
           else
             TotalDinheiro := TotalDinheiro - Entidade.Valor;
         end;
       end;
    6: Begin
         zrlCD.caption := 'CH';
         if (Entidade.CodigoCCX <> DM.Configuracao1.ContaFechaCaixa) then
         Begin
           if Entidade.FieldByName('MVC_DC').AsString='C' then
             TotalCheque   := TotalCheque + Entidade.Valor
           else
             TotalCheque   := TotalCheque - Entidade.Valor;
         end;
       end;
    else
    Begin
      zrlCD.caption := 'OU';
      if (Entidade.CodigoCCX <> DM.Configuracao1.ContaFechaCaixa) then
      Begin
        if Entidade.FieldByName('MVC_DC').AsString='C' then
          TotalOutros   := TotalOutros + Entidade.Valor
        else
          TotalOutros   := TotalOutros - Entidade.Valor;
      end;
    end;
  end;
  //
  Titulo_receber2.Close;
  if Entidade.FieldByName('PDV').AsString = '' then
    Titulo_receber2.ParamByName('PDV_CODIGO').asInteger :=  0
  else
    Titulo_receber2.ParamByName('PDV_CODIGO').asInteger :=  StrToInt(Entidade.FieldByName('PDV').AsString);
  Titulo_receber2.ParamByName('CNC_CODIGO').asInteger :=  Entidade.FieldByName('CNC_CODIGO').AsInteger;
  Titulo_receber2.Open;
  if not Titulo_receber2.IsEmpty then
    zrlTotParc.Caption := Titulo_receber1.Sequencia+'/'+PreencheZero(2,Titulo_Receber2.RecordCount)
  else
    zrlTotParc.Caption := '';
  //
  if DM.Configuracao1.Empresa = empLBM then
    zrlDescricao.Caption := Trim(Entidade.FieldByName('ObsTitulo').asString+' '+Entidade.Descricao)
  else
    zrlDescricao.Caption := Trim(Entidade.Descricao+' '+Entidade.FieldByName('ObsTitulo').asString);

  inc(TotalRegistros);
end;

procedure Trpt_FluxoCaixaDiaLBM.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SomaMovCred:=0;
  SubTotMovCred:=0;
  SomaMovDeb:=0;
end;

procedure Trpt_FluxoCaixaDiaLBM.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if vContaAgendada then
    SZRLabel14.Caption := 'Conta Agendada';
end;

procedure Trpt_FluxoCaixaDiaLBM.FormCreate(Sender: TObject);
begin
  TotalRegistros := 0;
  Entidade := Movimento_caixa1;
  TotalDinheiro := 0;
  TotalCheque   := 0;
  TotalOutros   := 0;
  sOficial      := '';
  sCCXRel       := '';
  sGrupoRel     := '';
  sNumTitulo    := '';
  sDescricao    := '';
  sValorMVC     := '';
  CdCodTitulo   := '';
  vSomenteCredito := False;
  vTotalCredito := 0;
end;

procedure Trpt_FluxoCaixaDiaLBM.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
