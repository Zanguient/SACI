unit UFluxoCaixaDia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Pedido_de_Venda, Titulo_receber, Conta_de_Caixa,
  Titulo_a_Pagar, Pacote_de_Credito, Pedido_de_Compra;

type
  Trpt_FluxoCaixaDia = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Movimento_caixa1: TMovimento_caixa;
    zrlDescDescricao: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel12: TSZRLabel;
    zrbSubTotal: TSZRBand;
    ZRBand3: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel17: TSZRLabel;
    zrbGrupoCAX: TSZRGroup;
    ZRBand5: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRSysData3: TSZRSysData;
    ZRLabel18: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRDBText7: TSZRDBText;
    ZRDBText8: TSZRDBText;
    Pedido_de_Venda1: TPedido_de_Venda;
    ZRLabel21: TSZRLabel;
    ZRLabel22: TSZRLabel;
    zrlDescCodigoCLI: TSZRLabel;
    ZRLabel7: TSZRLabel;
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
    ZRLabel10: TSZRLabel;
    ZRLabel23: TSZRLabel;
    ZRLabel28: TSZRLabel;
    zrlBalcaoGeral: TSZRLabel;
    zrlDebitoDiaGeral: TSZRLabel;
    zrlCreditoDiaGeral: TSZRLabel;
    ZRLabel32: TSZRLabel;
    ZRLabel33: TSZRLabel;
    zrlDebitos: TSZRLabel;
    Movimento_caixa1CNC_TITULO: TIntegerField;
    Movimento_caixa1TIT_CODIGO: TIntegerField;
    ZRLabel35: TSZRLabel;
    Movimento_caixa1MVC_PT: TStringField;
    ZRDBText12: TSZRDBText;
    zrlDiaFluxo: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlGeralDia: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlCreditos: TSZRLabel;
    Movimento_caixa1MVC_OBSERVACAO1: TStringField;
    Movimento_caixa1MVC_COMPETENCIA: TDateTimeField;
    Movimento_caixa1USU_CODIGO: TIntegerField;
    Movimento_caixa1MVC_DT_ALTERADO: TDateTimeField;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlContaRecebimento: TSZRLabel;
    Conta_de_Caixa1: TConta_de_Caixa;
    Movimento_caixa1CCX_CODIGO_REC: TIntegerField;
    zrlDescRazaoSocial: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    ZRLabel6: TSZRLabel;
    Titulo_a_pagar1: TTitulo_a_pagar;
    zrlUsuario: TSZRLabel;
    zrlDescDinheiro: TSZRLabel;
    zrlDescCheque: TSZRLabel;
    zrlDescOutros: TSZRLabel;
    zrlDescAtual: TSZRLabel;
    zrlGeralDinheiro: TSZRLabel;
    zrlGeralCheque: TSZRLabel;
    zrlGeralOutros: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    zrlDescAnterior: TSZRLabel;
    zrlGeralDinheiroAnt: TSZRLabel;
    zrlGeralChequeAnt: TSZRLabel;
    zrlGeralOutrosAnt: TSZRLabel;
    zrlTotalGeralAnt: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlFiltros: TSZRLabel;
    ZRLabel20: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlSequencia: TSZRLabel;
    zrlCodigoCLI: TSZRLabel;
    zrlRazaoSocial: TSZRLabel;
    zrlValorTitulo: TSZRLabel;
    zrlAtrazo: TSZRLabel;
    zrlValorComJuros: TSZRLabel;
    zrlCodigoPDV: TSZRLabel;
    zrlDataPedido: TSZRLabel;
    zrlValor: TSZRLabel;
    zrlCreditoDebito: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlSubTotal: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlTotal: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel4: TSZRLabel;
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
    Movimento_caixa1CHQ_CODIGO: TIntegerField;
    Movimento_caixa1CNC_CHEQUE: TIntegerField;
    Movimento_caixa1ObsTitulo: TStringField;
    Movimento_caixa1PDV: TStringField;
    Movimento_caixa1CodigoCliente: TStringField;
    Pedido_de_Compra1: TPedido_de_Compra;
    Movimento_caixa1Nota: TStringField;
    zrlTotalCredito: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlDescTotalCreditoExtorno: TSZRLabel;
    zrlTotalCreditoExtorno: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbSubTotalAfterPrint(Sender: TObject; Printed: Boolean);
    procedure zrbSubTotalBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Movimento_caixa1CalcFields(DataSet: TDataSet);
  private
    TotalRegistros : integer;
    vTotalCredito :Double;
  public
    Entidade:TMovimento_caixa;
    SomaTit, SomaTitJur, SomaTitTot, SomaTitJurTot, TotAVista, SubTotAVista,
      SubTotMovCred, SomaMovCred, SomaMovDeb, SomaMovDebSub:Double;
    sOficial,sCCXRel,sGrupoRel,sNumTitulo,CdCodTitulo,sDescricao,sValorMVC: string;
    vAcumularClienteBalcao, vSomenteCredito: Boolean;
  end;

var
  rpt_FluxoCaixaDia: Trpt_FluxoCaixaDia;

implementation
Uses
  URelData, UDM, Funcoes;
{$R *.DFM}

procedure Trpt_FluxoCaixaDia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active := False;
  Titulo_receber1.Close;
  Pedido_de_Venda1.Close;
  Action := cafree;
end;

procedure Trpt_FluxoCaixaDia.zrbSubTotalAfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  if zrbSubTotal.Height = 0 then
    Exit;
    
//  if not Entidade.EOF then
//    report.NewPage;
end;

procedure Trpt_FluxoCaixaDia.zrbSubTotalBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  GeralDinheiro, GeralCheque, GeralOutros : Double;
begin
//  SubTotalTituloComJuros.Caption:=Format('%.2f', [SomaTitJur]);
  ZRLabel33.Caption:=Format('%.2f', [SubTotAVista]);
  zrlDebitos.Caption:=Format('%.2f', [SomaMovDebSub]);
  zrlCreditos.Caption:=Format('%.2f', [SubTotMovCred]);
  zrlSubTotal.Caption:=Format('%.2f', [SubTotMovCred-Somamovdebsub]);
  SZRLabel6.Caption:=Format('%.2f', [SubTotAVista+SubTotMovCred-Somamovdebsub]);
  SomaTitTot:=SomaTitTot+SomaTit;
  SomaTitJurTot:=SomaTitJurtot+SomaTitJur;
  TotAVista:=TotAVista+SubTotAVista;
  SubTotAVista :=0;
  SomaTit      :=0;
  SomaTitJur   :=0;
  SubTotMovCred:=0;
  SomaMovDebSub:=0;

  if zrlDescDinheiro.Enabled then
  Begin
    with DM.QR_Consultas do
    Begin
      //Movimentos Gerais Anteriores
      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO=5 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralDinheiro := Arredonda(FieldByName('CREDITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO=5 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralDinheiro := GeralDinheiro - Arredonda(FieldByName('DEBITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO=6 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralCheque := Arredonda(FieldByName('CREDITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO=6 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralCheque := GeralCheque - Arredonda(FieldByName('DEBITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO<>5 '+
        ' AND MVC_TIPO_PGTO<>6 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralOutros := Arredonda(FieldByName('CREDITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO<>5 '+
        ' AND MVC_TIPO_PGTO<>6 '+
        ' AND MVC_DATA<"'+MesDia(zrlDiaFluxo.Caption)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralOutros := GeralOutros - Arredonda(FieldByName('DEBITO').asFloat);

      zrlGeralDinheiroAnt.Caption := format('%.2f',[GeralDinheiro]);
      zrlGeralChequeAnt.Caption   := format('%.2f',[GeralCheque]);
      zrlGeralOutrosAnt.Caption   := format('%.2f',[GeralOutros]);
      zrlTotalGeralAnt.Caption    := format('%.2f',[GeralDinheiro+GeralCheque+GeralOutros]);

      //Movimentos Gerais
      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO=5 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralDinheiro := Arredonda(FieldByName('CREDITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO=5 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralDinheiro := GeralDinheiro - Arredonda(FieldByName('DEBITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO=6 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralCheque := Arredonda(FieldByName('CREDITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO=6 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralCheque := GeralCheque - Arredonda(FieldByName('DEBITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS CREDITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="C" '+
        ' AND MVC_TIPO_PGTO<>5 '+
        ' AND MVC_TIPO_PGTO<>6 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralOutros := Arredonda(FieldByName('CREDITO').asFloat);

      Close;
      SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS DEBITO '+
        ' FROM MOVIMENTO_DE_CAIXA T1 '+
        ' WHERE MVC_DC="D" '+
        ' AND MVC_TIPO_PGTO<>5 '+
        ' AND MVC_TIPO_PGTO<>6 '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(zrlDiaFluxo.Caption)+1)+'" '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        sOficial+sCCXRel+sGrupoRel+sNumTitulo+CdCodTitulo+sDescricao+sValorMVC;
      Open;
      GeralOutros := GeralOutros - Arredonda(FieldByName('DEBITO').asFloat);

      zrlGeralDinheiro.Caption := format('%.2f',[GeralDinheiro]);
      zrlGeralCheque.Caption   := format('%.2f',[GeralCheque]);
      zrlGeralOutros.Caption   := format('%.2f',[GeralOutros]);
      zrlTotalGeral.Caption    := format('%.2f',[GeralDinheiro+GeralCheque+GeralOutros]);
    end;
  end;

  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_FluxoCaixaDia.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalCredito.Caption := Format('%.2f',[vTotalCredito]);

  zrlBalcaoGeral.Caption:=Format('%.2f', [TotAVista]);
  zrlDebitoDiaGeral.Caption:=Format('%.2f', [SomaMovDeb]);
  zrlCreditoDiaGeral.Caption:=Format('%.2f', [SomaMovCred]);
  zrlTotal.Caption:=Format('%.2f', [SomaMovCred-SomaMovDeb]);
  zrlGeralDia.Caption:=Format('%.2f', [SomaMovCred+TotAVista-SomaMovDeb]);

  if vSomenteCredito then
    zrlTotalCreditoExtorno.Caption := Format('%.2f',[StrToFloat(zrlTotalCredito.Caption)+StrToFloat(zrlDebitoDiaGeral.Caption)])
  else
  Begin
    zrlDescTotalCreditoExtorno.Caption := '';
    zrlTotalCreditoExtorno.Caption := '';
  end;
end;

procedure Trpt_FluxoCaixaDia.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FluxoCaixaDia.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  ValorJur:Double;
begin
  zrlSequencia.Caption     := '';
  zrlCodigoCLI.Caption     := '';
  zrlRazaoSocial.Caption   := '';
  zrlValorTitulo.Caption   := '';
  zrlValorComJuros.Caption := '';
  zrlCodigoPDV.Caption     := '';
  zrlDataPedido.Caption    := '';
  zrlAtrazo.Caption        := '';

  if Entidade.Dc = 'C' then
    vTotalCredito := vTotalCredito + Arredonda(Entidade.CreditoCliente)
  else
    vTotalCredito := vTotalCredito - Arredonda(Entidade.CreditoCliente);


  if DM.Configuracao1.Empresa = empLBM then
    zrlDescricao.Caption := Trim(Entidade.FieldByName('ObsTitulo').asString+' '+Entidade.Descricao)
  else
    zrlDescricao.Caption := Trim(Entidade.Descricao+' '+Entidade.FieldByName('ObsTitulo').asString);

  If (Entidade.FieldByName('TIT_CODIGO').asString<>'') and
     (Entidade.FieldByName('CNC_TITULO').asString<>'') and
     (Entidade.Flag <> '2') then //Titulo a Receber
  Begin
    with Titulo_receber1 do
    Begin
      Close;
      SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL '+
        ' FROM TITULO_A_RECEBER T1, CLIENTE T2 '+
        ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
        ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
        ' AND T1.CNC_CODIGO='+Entidade.FieldByName('CNC_TITULO').asString+
        ' AND T1.TRC_CODIGO='+Entidade.FieldByName('TIT_CODIGO').asString;
      Open;
      If not IsEmpty then
      Begin
        zrlSequencia.Caption   := Sequencia;
        zrlCodigoCLI.Caption   := FieldbyName('CLI_CODIGO').AsString;
        zrlRazaoSocial.Caption := FieldbyName('CLI_RZ_SOCIAL').AsString;

        zrlValorTitulo.Caption := format('%.2f',[Valor]);

        If Trunc(Entidade.data)-Trunc(vencimento)>0 then
          zrlAtrazo.Caption := IntToStr(Trunc(Entidade.data-vencimento))
        else
          zrlAtrazo.Caption := '';
        If Trunc(Vencimento)+DM.Configuracao1.QuantDiasSemJuros<Trunc(Entidade.Data) then
        Begin
          ValorJur := Valor + (Valor*(DM.Configuracao1.TaxaJuros*(Trunc(Entidade.Data)-Trunc(Vencimento))/3000));
          zrlValorComJuros.Caption := Format('%.2f', [ValorJur]);
          SomaTitJur := SomaTitJur+ValorJur;
        End
        else
        Begin
          ValorJur   := Valor;
          SomaTitJur := SomaTitJur+ValorJur;
        End;
        if CodigoPDV > 0 then
        Begin
          if TipoPedido=0 then //Pedido de Venda
          Begin
            Pedido_de_Venda1.Close;
            Pedido_de_Venda1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
            Pedido_de_Venda1.ParamByName('PDV_CODIGO').asInteger := CodigoPDV;
            Pedido_de_Venda1.Open;
            If not Pedido_de_Venda1.IsEmpty then
            Begin
              zrlCodigoPDV.Caption  := IntToStr(Pedido_de_Venda1.CodigoPDV);
              zrlDataPedido.Caption := DateToStr(Pedido_de_Venda1.DataHora);
            End;
          end
          else if TipoPedido=1 then //Pedido de Serviço
          Begin
            //Mesmo do PDV
          end
          else if TipoPedido=2 then //Pacote de Crédito
          Begin
            Pacote_de_Credito1.Close;
            Pacote_de_Credito1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
            Pacote_de_Credito1.ParamByName('PCR_CODIGO').asInteger := CodigoPDV;
            Pacote_de_Credito1.Open;
            If not Pacote_de_Credito1.IsEmpty then
            Begin
              zrlCodigoPDV.Caption  := IntToStr(Pacote_de_Credito1.CodigoPCR);
              zrlDataPedido.Caption := DateToStr(Pacote_de_Credito1.DataCadastro);
            End;
          end;
        end;
        SomaTit    := SomaTit + Valor;
      end;
    end;
  end
  else If (Entidade.FieldByName('TIT_CODIGO').asString<>'') and
          (Entidade.FieldByName('CNC_TITULO').asString<>'') and
          (Entidade.Flag = '2') then //Titulo a Pagar
  Begin
    with Titulo_a_pagar1 do
    Begin
      Close;
      SQL.Text:='SELECT T1.*, F1.FoR_RZ_SOCIAL, T2.TRN_RZ_SOCIAL '+
        ' FROM TITULO_A_PAGAR T1, FORNECEDOR F1, TRANSPORTADORA T2 '+
        ' WHERE T1.CNC_CODIGO='+Entidade.FieldByName('CNC_TITULO').asString+
        ' AND T1.TPG_CODIGO='+Entidade.FieldByName('TIT_CODIGO').asString+
        ' AND T1.FOR_CODIGO*=F1.FOR_CODIGO '+
        ' AND T1.TRN_CODIGO*=T2.TRN_CODIGO ';
      Open;

      If not IsEmpty then
      Begin
        zrlSequencia.Caption   := Sequencia;
        if CodigoFOR > 0 then
        Begin
          zrlCodigoCLI.Caption   := IntToStr(CodigoFOR);
          zrlRazaoSocial.Caption := FieldByName('FOR_RZ_SOCIAL').asString;
        end
        else
        Begin
          zrlCodigoCLI.Caption   := IntToStr(CodigoTRN);
          zrlRazaoSocial.Caption := FieldByName('TRN_RZ_SOCIAL').asString;
        end;
        zrlValorTitulo.Caption := format('%.2f',[Valor]);
        If Trunc(Entidade.data)-Trunc(vencimento)>0 then
          zrlAtrazo.Caption := IntToStr(Trunc(Entidade.data-vencimento));
        If Trunc(Vencimento)+DM.Configuracao1.QuantDiasSemJuros<Trunc(Entidade.Data) then
        Begin
          ValorJur := Valor+(Valor*(DM.Configuracao1.TaxaJuros*(Trunc(Entidade.Data)-Trunc(Vencimento))/3000));
          zrlValorComJuros.Caption := Format('%.2f', [ValorJur]);
          SomaTitJur := SomaTitJur+ValorJur;
        End
        else
        Begin
          ValorJur   := Valor;
          SomaTitJur := SomaTitJur+ValorJur;
        End;
        SomaTit    := SomaTit + Valor;
      end
    end;
  end
  Else
  Begin
    zrlSequencia.Caption   := Entidade.Sequencia;
    zrlValorTitulo.Caption := format('%.2f',[Entidade.Valor]);
    ValorJur   := Entidade.Valor;
    SomaTitJur := SomaTitJur+ValorJur;
    SomaTit    := SomaTit+Entidade.Valor;
  end;

  zrlValor.Caption := format('%.2f',[Entidade.Valor]);
  If (Entidade.FieldByName('CCX_CODIGO').asInteger=DM.Configuracao1.ContRecCli) and
     (zrlCodigoCLI.Caption=IntToStr(DM.Configuracao1.CodigoCliAVista)) and
     (Entidade.FieldByName('MVC_DC').AsString='C') and
      vAcumularClienteBalcao then
  Begin
    SubTotAVista := SubTotAVista + Arredonda(Entidade.Valor);
    DoPrint := False;
    Exit;
  End
  else
  begin
    If Entidade.FieldByName('MVC_DC').AsString='C' then
    begin
      zrlCreditoDebito.Caption := 'C';
      SomaMovCred := SomaMovCred + Arredonda(Entidade.Valor);
      SubTotMovCred := SubTotMovCred + Arredonda(Entidade.Valor);
    end
    else If Entidade.FieldByName('MVC_DC').AsString='D' then
    Begin
      zrlCreditoDebito.Caption := 'D';    
      SomaMovDeb  := SomaMovDeb  + Arredonda(Entidade.Valor);
      SomaMovDebSub  := somaMovDebSub + Arredonda(Entidade.Valor);
    End
    else
      zrlCreditoDebito.Caption := '';
  end;
  with Conta_de_Caixa1 do
  begin
    //Descricao da Conta Agendada
    if CodigoCCX <> Entidade.CodigoCCX then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
      Open;
    end;
    SZRLabel15.Caption := Descricao;

    if vSomenteCredito then
      zrlContaRecebimento.Caption := Format('%.2f',[Entidade.CreditoCliente])
    else
    Begin
      //Descricao da Conta de Recebimento
      if CodigoCCX <> Entidade.CodigoCCXRecebimento then
      Begin
        Close;
        ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCXRecebimento;
        Open;
        zrlContaRecebimento.Caption := Descricao;
      end;
      //Não mostrar o nome da Conta se for igual a de agendamento
      if Entidade.CodigoCCX <> Entidade.CodigoCCXRecebimento then
        zrlContaRecebimento.Caption := '';
    end;
  end;

  inc(TotalRegistros);
end;

procedure Trpt_FluxoCaixaDia.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SomaTit:=0;
  SomaTitJur:=0;
  SomaTitTot:=0;
  SomaTitJurTot:=0;
  TotAVista:=0;
  SubTotAvista:=0;
  SomaMovCred:=0;
  SubTotMovCred:=0;
  SomaMovDeb:=0;
end;

procedure Trpt_FluxoCaixaDia.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;

  if vSomenteCredito then
  Begin
    zrlContaRecebimento.Alignment := taRightJustify;
    zrlContaRecebimento.Width := 10;
  end;
end;

procedure Trpt_FluxoCaixaDia.FormCreate(Sender: TObject);
begin
  Entidade := Movimento_caixa1;
  TotalRegistros := 0;
  sOficial   := '';
  sCCXRel    := '';
  sGrupoRel  := '';
  sNumTitulo := '';
  sDescricao := '';
  sValorMVC  := '';
  CdCodTitulo:= '';
  vAcumularClienteBalcao := False;
  vSomenteCredito := False;
  vTotalCredito := 0;
end;

procedure Trpt_FluxoCaixaDia.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_FluxoCaixaDia.Movimento_caixa1CalcFields(DataSet: TDataSet);
begin
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
          else if Pedido_de_Compra1.NotaFiscal > 0 then
            Entidade.FieldByName('Nota').AsString:= 'N'+IntToStr(Pedido_de_Compra1.NotaFiscal);
        end;
      end;
    end;
  end;
end;

end.
