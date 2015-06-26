unit UMDF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo,
  CentroCusto;

type
  Trpt_MDF = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupoCNC: TSZRGroup;
    CentroCusto1: TCentroCusto;
    SZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlMVCCartaoAvulsoC: TSZRLabel;
    zrlMVCCartaoAvulsoD: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlMVCCartaoAvulsoS: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel44: TSZRLabel;
    zrlTRCCredito: TSZRLabel;
    zrlTotalVendas: TSZRLabel;
    zrlTRCTotalCredito: TSZRLabel;
    SZRLabel48: TSZRLabel;
    SZRLabel49: TSZRLabel;
    SZRLabel50: TSZRLabel;
    zrlMVCChequeAvulsoC: TSZRLabel;
    zrlMVCChequeAvulsoD: TSZRLabel;
    zrlMVCChequeAvulsoS: TSZRLabel;
    zrlMVCDinheiroAvulsoC: TSZRLabel;
    zrlMVCDinheiroAvulsoD: TSZRLabel;
    zrlMVCDinheiroAvulsoS: TSZRLabel;
    SZRLabel57: TSZRLabel;
    zrlMVCCreditoAvulso: TSZRLabel;
    zrlMVCDebitoAvulso: TSZRLabel;
    zrlMVCSaldoAvulso: TSZRLabel;
    SZRLabel61: TSZRLabel;
    SZRFrameLine1: TSZRFrameLine;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlTRCCartao: TSZRLabel;
    zrlMVCCartaoTRCD: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlMVCCartaoTRCS: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlTRCCheque: TSZRLabel;
    zrlMVCChequeTRCD: TSZRLabel;
    zrlMVCChequeTRCS: TSZRLabel;
    zrlTRCDinheiro: TSZRLabel;
    zrlMVCDinheiroTRCD: TSZRLabel;
    zrlMVCDinheiroTRCS: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlMVCCreditoTRC: TSZRLabel;
    zrlMVCDebitoTRC: TSZRLabel;
    zrlMVCSaldoTRC: TSZRLabel;
    SZRFrameLine2: TSZRFrameLine;
    zrlMVCCartaoC: TSZRLabel;
    zrlMVCCartaoD: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel31: TSZRLabel;
    zrlMVCCartaoS: TSZRLabel;
    SZRLabel33: TSZRLabel;
    zrlMVCChequeC: TSZRLabel;
    zrlMVCChequeD: TSZRLabel;
    zrlMVCChequeS: TSZRLabel;
    zrlMVCDinheiroC: TSZRLabel;
    zrlMVCDinheiroD: TSZRLabel;
    zrlMVCDinheiroS: TSZRLabel;
    SZRLabel40: TSZRLabel;
    zrlMVCCredito: TSZRLabel;
    zrlMVCDebito: TSZRLabel;
    zrlMVCSaldo: TSZRLabel;
    SZRLabel45: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlVendasDinheiro: TSZRLabel;
    zrlDevVendasDinheiro: TSZRLabel;
    zrlSaldoVendasDinheiro: TSZRLabel;
    zrlVendasCheque: TSZRLabel;
    zrlDevVendasCheque: TSZRLabel;
    zrlSaldoVendasCheque: TSZRLabel;
    zrlVendasCartao: TSZRLabel;
    zrlDevVendasCartao: TSZRLabel;
    zrlSaldoVendasCartao: TSZRLabel;
    zrlVendasBoleto: TSZRLabel;
    zrlDevVendasBoleto: TSZRLabel;
    zrlSaldoVendasBoleto: TSZRLabel;
    zrlVendasDeposito: TSZRLabel;
    zrlDevVendasDeposito: TSZRLabel;
    zrlSaldoVendasDeposito: TSZRLabel;
    zrlTRCBoleto: TSZRLabel;
    zrlTRCDeposito: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel43: TSZRLabel;
    zrlTotalDevVendas: TSZRLabel;
    zrlSaldoVendas: TSZRLabel;
    SZRLabel51: TSZRLabel;
    zrlChequesDoDia: TSZRLabel;
    zrlChequesPreDatados: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlMVCCartaoTRCC: TSZRLabel;
    zrlMVCChequeTRCC: TSZRLabel;
    zrlMVCDinheiroTRCC: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrlVendasOutras: TSZRLabel;
    zrlDevVendasOutras: TSZRLabel;
    zrlSaldoVendasOutras: TSZRLabel;
    zrlTRCOutras: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    zrlRemessaPacoteVenda: TSZRLabel;
    zrlRemessaPacoteVendaDev: TSZRLabel;
    zrlSaldoRemessaVenda: TSZRLabel;
    SZRLabel27: TSZRLabel;
    zrlRemessaPacoteCredito: TSZRLabel;
    zrlRemessaPacoteCreditoDev: TSZRLabel;
    zrlSaldoRemessaCredito: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel35: TSZRLabel;
    zrlVendasPacote: TSZRLabel;
    zrlDevVendasPacote: TSZRLabel;
    zrlSaldoVendasPacote: TSZRLabel;
    SZRLabel39: TSZRLabel;
    zrlVendasPrePago: TSZRLabel;
    zrlDevVendasPrePago: TSZRLabel;
    zrlSaldoVendasPreVenda: TSZRLabel;
    SZRLabel55: TSZRLabel;
    zrlTRCPacoteVenda: TSZRLabel;
    zrlTRCPacoteCredito: TSZRLabel;
    SZRLabel36: TSZRLabel;
    SZRLabel37: TSZRLabel;
    zrlSaldoAberto: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel28: TSZRLabel;
    zrlTRCCartaoExt: TSZRLabel;
    zrlTRCChequeExt: TSZRLabel;
    zrlTRCDinheiroExt: TSZRLabel;
    zrlTRCBoletoExt: TSZRLabel;
    zrlTRCDepositoExt: TSZRLabel;
    zrlTRCOutrasExt: TSZRLabel;
    zrlTRCPacoteVendaExt: TSZRLabel;
    zrlTRCPacoteCreditoExt: TSZRLabel;
    zrlTRCTotalExt: TSZRLabel;
    zrlTRCCartaoSaldo: TSZRLabel;
    zrlTRCChequeSaldo: TSZRLabel;
    zrlTRCDinheiroSaldo: TSZRLabel;
    zrlTRCBoletoSaldo: TSZRLabel;
    zrlTRCDepositoSaldo: TSZRLabel;
    zrlTRCOutrasSaldo: TSZRLabel;
    zrlTRCPacoteVendaSaldo: TSZRLabel;
    zrlTRCPacoteCreditoSaldo: TSZRLabel;
    zrlTRCTotalSaldo: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel41: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    vData: TDateTime;
    CdCNC: integer;
    Entidade: TCentroCusto;
  end;

var
  rpt_MDF: Trpt_MDF;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}


procedure Trpt_MDF.FormCreate(Sender: TObject);
begin
  vData := 0;
  CdCNC := 0;
  Entidade := CentroCusto1;
  Entidade.Open;
end;

procedure Trpt_MDF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_MDF.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_MDF.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption := EmpresaDesenvolvedora;  
end;

procedure Trpt_MDF.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vMVCDinCredAvu, vMVCDinDevAvu, vMVCCheCredAvu, vMVCCheDevAvu, vMVCOutCredAvu, vMVCOutDevAvu,
    vMVCDinCredTRC, vMVCDinDevTRC, vMVCCheCredTRC, vMVCCheDevTRC, vMVCOutCredTRC, vMVCOutDevTRC: Double;
begin
  with DM.QR_Consultas do
  Begin
    //Vendas
    //Dinheiro/Promissoria
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=5 '+ //Dinheiro/Promissoria
      ' AND P1.PDV_SITUACAO=4 '+     //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA IN (0,1) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_ENTREGA>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_ENTREGA<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlVendasDinheiro.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Cheque
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=6 '+ //Cheque
      ' AND P1.PDV_SITUACAO=4 '+     //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA IN (0,1) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_ENTREGA>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_ENTREGA<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=i1.PDV_CODIGO ';
    Open;
    zrlVendasCheque.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Cartão
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=13 '+ //Cartão
      ' AND P1.PDV_SITUACAO=4 '+     //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_ENTREGA>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_ENTREGA<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlVendasCartao.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Boleto
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=412 '+ //Boleto
      ' AND P1.PDV_SITUACAO=4 '+     //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_ENTREGA>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_ENTREGA<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=i1.PDV_CODIGO ';
    Open;
    zrlVendasBoleto.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Depósito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=416 '+ //Depósito
      ' AND P1.PDV_SITUACAO=4 '+     //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_ENTREGA>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_ENTREGA<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlVendasDeposito.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Outras
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG NOT IN (5,6,13,412,416) '+ //Outras
      ' AND P1.PDV_SITUACAO=4 '+                           //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_ENTREGA>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_ENTREGA<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlVendasOutras.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Pacote
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPC_PRECO_DESCONTO,2)*IPC_QUANTIDADE) AS TOTAL '+
      ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
      ' WHERE P1.PCT_SITUACAO=4 '+     //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      //' AND P1.PCT_DT_FINALIZADO>="'+MesDia(vData)+'" '+
      //' AND P1.PCT_DT_FINALIZADO<"'+MesDia(vData+1)+'" '+
      ' AND P1.PCT_DT_ALTERADO>="'+MesDia(vData)+'" '+
      ' AND P1.PCT_DT_ALTERADO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlVendasPacote.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Pre-Pago
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_SITUACAO=4 '+     //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA = 3 '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_ENTREGA>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_ENTREGA<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlVendasPrePago.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Totalizar Vendas
    zrlTotalVendas.Caption := format('%.2f',[StrToFloat(zrlVendasDinheiro.Caption)+
                                             StrToFloat(zrlVendasCheque.Caption)+
                                             StrToFloat(zrlVendasCartao.Caption)+
                                             StrToFloat(zrlVendasBoleto.Caption)+
                                             StrToFloat(zrlVendasDeposito.Caption)+
                                             StrToFloat(zrlVendasOutras.Caption)+
                                             StrToFloat(zrlVendasPacote.Caption)+
                                             StrToFloat(zrlVendasPrePago.Caption)]);

    //Devolucões
    //Dinheiro/Promissoria
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=5 '+ //Dinheiro/Promissoria
      ' AND P1.PDV_SITUACAO=8 '+     //Devolvido
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlDevVendasDinheiro.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Cheque
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=6 '+ //Cheque
      ' AND P1.PDV_SITUACAO=8 '+     //Devolvido
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlDevVendasCheque.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Cartão
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=13 '+ //Cartão
      ' AND P1.PDV_SITUACAO=8 '+      //Devolvido
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlDevVendasCartao.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Boleto
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=412 '+ //Boleto
      ' AND P1.PDV_SITUACAO=8 '+       //Devolvido
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlDevVendasBoleto.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Depósito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG=416 '+ //Depósito
      ' AND P1.PDV_SITUACAO=8 '+       //Devolvido
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlDevVendasDeposito.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Outras
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_TIPO_PAG NOT IN (5,6,13,412,416) '+ //Outras
      ' AND P1.PDV_SITUACAO=8 '+                           //Devolvido
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA NOT IN (2,3) '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlDevVendasOutras.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Pacote
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPC_PRECO_DESCONTO,2)*IPC_QUANTIDADE) AS TOTAL '+
      ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
      ' WHERE P1.PCT_SITUACAO=8 '+     //Devolucao
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PCT_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PCT_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlDevVendasPacote.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Pre-Pago
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_SITUACAO=4 '+     //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA = 3 '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlDevVendasPrePago.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Totalizar Devoluções de Vendas
    zrlTotalDevVendas.Caption := format('%.2f',[StrToFloat(zrlDevVendasDinheiro.Caption)+
                                             StrToFloat(zrlDevVendasCheque.Caption)+
                                             StrToFloat(zrlDevVendasCartao.Caption)+
                                             StrToFloat(zrlDevVendasBoleto.Caption)+
                                             StrToFloat(zrlDevVendasDeposito.Caption)+
                                             StrToFloat(zrlDevVendasOutras.Caption)+
                                             StrToFloat(zrlDevVendasPacote.Caption)+
                                             StrToFloat(zrlDevVendasPrePago.Caption)]);

    //Totalizar Saldos de Vendas
    zrlSaldoVendasDinheiro.Caption := format('%.2f',[StrToFloat(zrlVendasDinheiro.Caption)-
                                                     StrToFloat(zrlDevVendasDinheiro.Caption)]);
    zrlSaldoVendasCheque.Caption := format('%.2f',[StrToFloat(zrlVendasCheque.Caption)-
                                                   StrToFloat(zrlDevVendasCheque.Caption)]);
    zrlSaldoVendasCartao.Caption := format('%.2f',[StrToFloat(zrlVendasCartao.Caption)-
                                                   StrToFloat(zrlDevVendasCartao.Caption)]);
    zrlSaldoVendasBoleto.Caption := format('%.2f',[StrToFloat(zrlVendasBoleto.Caption)-
                                                   StrToFloat(zrlDevVendasBoleto.Caption)]);
    zrlSaldoVendasDeposito.Caption := format('%.2f',[StrToFloat(zrlVendasDeposito.Caption)-
                                                     StrToFloat(zrlDevVendasDeposito.Caption)]);
    zrlSaldoVendasOutras.Caption := format('%.2f',[StrToFloat(zrlVendasOutras.Caption)-
                                                   StrToFloat(zrlDevVendasOutras.Caption)]);
    zrlSaldoVendasPacote.Caption := format('%.2f',[StrToFloat(zrlVendasPacote.Caption)-
                                                   StrToFloat(zrlDevVendasPacote.Caption)]);
    zrlSaldoVendasPreVenda.Caption := format('%.2f',[StrToFloat(zrlVendasPrePago.Caption)-
                                                     StrToFloat(zrlDevVendasPrePago.Caption)]);

    zrlSaldoVendas.Caption := format('%.2f',[StrToFloat(zrlTotalVendas.Caption)-
                                             StrToFloat(zrlTotalDevVendas.Caption)]);


    //Remessa Pacote de Venda
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_SITUACAO=4 '+       //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA = 2 '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlRemessaPacoteVenda.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Devolução de Remessa Pacote de Venda
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_SITUACAO=8 '+       //Devolvido
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA = 2 '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlRemessaPacoteVendaDev.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    zrlSaldoRemessaVenda.Caption := format('%.2f',[StrToFloat(zrlRemessaPacoteVenda.Caption)-
                                                   StrToFloat(zrlRemessaPacoteVendaDev.Caption)]);


    //Remessa Pacote de Credito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_SITUACAO=4 '+       //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA = 3 '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlRemessaPacoteCredito.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    //Devolução de Remessa Pacote de Crédito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_SITUACAO=8 '+       //Devolvido
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_TIPO_VENDA = 3 '+   // 0 - Normal; 1 - Pendente; 2 - Remessa; 3 - Pré-Pago
      ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlRemessaPacoteCreditoDev.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

    zrlSaldoRemessaCredito.Caption := format('%.2f',[StrToFloat(zrlRemessaPacoteCredito.Caption)-
                                                     StrToFloat(zrlRemessaPacoteCreditoDev.Caption)]);


    //Pedidos em Aberto
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_SITUACAO<4 '+     //Finalizado
      ' AND P1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND P1.PDV_DATA_HORA>="'+MesDia(vData)+'" '+
      ' AND P1.PDV_DATA_HORA<"'+MesDia(vData+1)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    zrlSaldoAberto.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);



    //Cheque do Dia
    Close;
    SQL.Text := 'SELECT SUM(CHQ_VALOR) AS TOTAL '+
      ' FROM CHEQUE '+
      ' WHERE CHQ_DT_CADASTRO>="'+MesDia(vData)+'" '+
      ' AND CHQ_DT_CADASTRO<"'+MesDia(vData+1)+'" '+
      ' AND CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND CHQ_DATA<="'+MesDia(vData)+'" ';
    Open;
    zrlChequesDoDia.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);


    //Cheques Pré-Datados
    Close;
    SQL.Text := 'SELECT SUM(CHQ_VALOR) AS TOTAL '+
      ' FROM CHEQUE '+
      ' WHERE CHQ_DT_CADASTRO>="'+MesDia(vData)+'" '+
      ' AND CHQ_DT_CADASTRO<"'+MesDia(vData+1)+'" '+
      ' AND CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND CHQ_DATA>"'+MesDia(vData)+'" ';
    Open;
    zrlChequesPreDatados.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);

  end;



  //Títulos Recebidos
  with DM.QR_Consultas do
  Begin
    //Dinheiro/Promissória
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=2 '+
      ' AND T1.TRC_TIPO_PAG=5 '+                       //Dinheiro
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_PAGAMENTO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_PAGAMENTO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCDinheiro.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    //Dinheiro/Promissória Extorno
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=5 '+
      ' AND T1.TRC_TIPO_PAG=5 '+                       //Dinheiro
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_DT_ALTERADO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_DT_ALTERADO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCDinheiroExt.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    zrlTRCDinheiroSaldo.Caption := format('%.2f',[StrToFloat(zrlTRCDinheiro.Caption)-StrToFloat(zrlTRCDinheiroExt.Caption)]);

    //Cheque
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=2 '+
      ' AND T1.TRC_TIPO_PAG=6 '+                       //Cheque
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_PAGAMENTO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_PAGAMENTO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCCheque.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    //Extorno
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=5 '+
      ' AND T1.TRC_TIPO_PAG=6 '+                       //Cheque
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_DT_ALTERADO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_DT_ALTERADO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCChequeExt.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    zrlTRCChequeSaldo.Caption := format('%.2f',[StrToFloat(zrlTRCCheque.Caption)-StrToFloat(zrlTRCChequeExt.Caption)]);

    //Cartão
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=2 '+
      ' AND T1.TRC_TIPO_PAG=13 '+                       //Cartão
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_PAGAMENTO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_PAGAMENTO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCCartao.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    //Extorno
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=5 '+
      ' AND T1.TRC_TIPO_PAG=13 '+                       //Cartao
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_DT_ALTERADO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_DT_ALTERADO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCCartaoExt.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    zrlTRCCartaoSaldo.Caption := format('%.2f',[StrToFloat(zrlTRCCartao.Caption)-StrToFloat(zrlTRCCartaoExt.Caption)]);

    //Boleto
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=2 '+
      ' AND T1.TRC_TIPO_PAG=412 '+                       //Boleto
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_PAGAMENTO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_PAGAMENTO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCBoleto.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    //Extorno
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=5 '+
      ' AND T1.TRC_TIPO_PAG=412 '+                       //Boleto
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_DT_ALTERADO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_DT_ALTERADO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCBoletoExt.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    zrlTRCBoletoSaldo.Caption := format('%.2f',[StrToFloat(zrlTRCBoleto.Caption)-StrToFloat(zrlTRCBoletoExt.Caption)]);

    //Depósito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=2 '+
      ' AND T1.TRC_TIPO_PAG=416 '+                       //Depósito
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_PAGAMENTO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_PAGAMENTO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCDeposito.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    //Extorno
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=5 '+
      ' AND T1.TRC_TIPO_PAG=414 '+                       //Depósito
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_DT_ALTERADO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_DT_ALTERADO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCDepositoExt.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    zrlTRCDepositoSaldo.Caption := format('%.2f',[StrToFloat(zrlTRCDeposito.Caption)-StrToFloat(zrlTRCDepositoExt.Caption)]);

    //Outras
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=2 '+
      ' AND T1.TRC_TIPO_PAG NOT IN (5,6,13,412,416) '+  //Outras
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_PAGAMENTO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_PAGAMENTO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCOutras.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    //Extorno
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=5 '+
      ' AND T1.TRC_TIPO_PAG NOT IN (5,6,13,412,416) '+  //Outras
      ' AND T1.TRC_TIPO_PEDIDO=0 '+  //Pedido de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_DT_ALTERADO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_DT_ALTERADO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCOutrasExt.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    zrlTRCOutrasSaldo.Caption := format('%.2f',[StrToFloat(zrlTRCOutras.Caption)-StrToFloat(zrlTRCOutrasExt.Caption)]);

    //Pacote de Venda
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=2 '+
      ' AND T1.TRC_TIPO_PEDIDO=1 '+  //Pacote de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_PAGAMENTO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_PAGAMENTO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCPacoteVenda.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    //Extorno
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=5 '+
      ' AND T1.TRC_TIPO_PEDIDO=1 '+  //Pacote de Venda
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_DT_ALTERADO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_DT_ALTERADO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCPacoteVendaExt.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    zrlTRCPacoteVendaSaldo.Caption := format('%.2f',[StrToFloat(zrlTRCPacoteVenda.Caption)-StrToFloat(zrlTRCPacoteVendaExt.Caption)]);

    //Pacote de Crédito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=2 '+
      ' AND T1.TRC_TIPO_PEDIDO=2 '+  //Pacote de Crédito
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_PAGAMENTO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_PAGAMENTO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCPacoteCredito.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    //Extorno
    Close;
    SQL.Text := 'SELECT SUM(ROUND(T1.TRC_VALOR_PAGO,2)) AS TOTAL '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.TRC_SITUACAO=5 '+
      ' AND T1.TRC_TIPO_PEDIDO=2 '+  //Pacote de Crédito
      ' AND T1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND T1.TRC_DT_ALTERADO>="'+MesDia(vData)+'" '+
      ' AND T1.TRC_DT_ALTERADO<"'+MesDia(vData+1)+'" ';
    Open;
    zrlTRCPacoteCreditoExt.Caption := format('%.2f',[FieldByName('TOTAL').AsFloat]);
    zrlTRCPacoteCreditoSaldo.Caption := format('%.2f',[StrToFloat(zrlTRCPacoteCredito.Caption)-StrToFloat(zrlTRCPacoteCreditoExt.Caption)]);

    //Totalizar Baixa de Títulos
    zrlTRCTotalCredito.Caption := format('%.2f',[StrToFloat(zrlTRCDinheiro.Caption)+
                                          StrToFloat(zrlTRCCheque.Caption)+
                                          StrToFloat(zrlTRCCartao.Caption)+
                                          StrToFloat(zrlTRCBoleto.Caption)+
                                          StrToFloat(zrlTRCDeposito.Caption)+
                                          StrToFloat(zrlTRCOutras.Caption)]);

    //Totalizar Baixa de Títulos Extorno
    zrlTRCTotalExt.Caption := format('%.2f',[StrToFloat(zrlTRCDinheiroExt.Caption)+
                                          StrToFloat(zrlTRCChequeExt.Caption)+
                                          StrToFloat(zrlTRCCartaoExt.Caption)+
                                          StrToFloat(zrlTRCBoletoExt.Caption)+
                                          StrToFloat(zrlTRCDepositoExt.Caption)+
                                          StrToFloat(zrlTRCOutrasExt.Caption)]);

    //Totalizar Baixa de Títulos Saldo
    zrlTRCTotalSaldo.Caption := Format('%.2f',[StrToFloat(zrlTRCTotalCredito.Caption)-StrToFloat(zrlTRCTotalExt.Caption)]);
  end;

  //Movimento de Caixa
  with DM.QR_Consultas do
  Begin
    //Movimentos Avulsos
    //Dinheiro
    //Crédito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO=5 '+   //Dinheiro
      ' AND M1.MVC_DC="C" '+        //Crédito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO=0 '+  //Avulso
      ' AND M1.CCX_CODIGO NOT IN ('+IntToStr(DM.Configuracao1.ContaAbreCaixa)+','+IntToStr(DM.Configuracao1.ContaFechaCaixa)+') '+
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCDinCredAvu := FieldByName('TOTAL').AsFloat;

    //Débito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO=5 '+ //Dinheiro
      ' AND M1.MVC_DC="D" '+      //Débito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO=0 '+  //Avulso
      ' AND M1.CCX_CODIGO NOT IN ('+IntToStr(DM.Configuracao1.ContaAbreCaixa)+','+IntToStr(DM.Configuracao1.ContaFechaCaixa)+') '+
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCDinDevAvu := FieldByName('TOTAL').AsFloat;

    //Cheque
    //Crédito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO=6 '+   //Cheque
      ' AND M1.MVC_DC="C" '+        //Crédito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO=0 '+  //Avulso
      ' AND M1.CCX_CODIGO NOT IN ('+IntToStr(DM.Configuracao1.ContaAbreCaixa)+','+IntToStr(DM.Configuracao1.ContaFechaCaixa)+') '+
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCCheCredAvu := FieldByName('TOTAL').AsFloat;

    //Débito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO=6 '+   //Cheque
      ' AND M1.MVC_DC="D" '+        //Débito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO=0 '+  //Avulso
      ' AND M1.CCX_CODIGO NOT IN ('+IntToStr(DM.Configuracao1.ContaAbreCaixa)+','+IntToStr(DM.Configuracao1.ContaFechaCaixa)+') '+
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCCheDevAvu := FieldByName('TOTAL').AsFloat;

    //Outros
    //Crédito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO>6 '+   //Outros
      ' AND M1.MVC_DC="C" '+        //Crédito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO=0 '+  //Avulso
      ' AND M1.CCX_CODIGO NOT IN ('+IntToStr(DM.Configuracao1.ContaAbreCaixa)+','+IntToStr(DM.Configuracao1.ContaFechaCaixa)+') '+
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCOutCredAvu := FieldByName('TOTAL').AsFloat;

    //Débito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO>6 '+ //Outros
      ' AND M1.MVC_DC="D" '+      //Débito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO=0 '+  //Avulso
      ' AND M1.CCX_CODIGO NOT IN ('+IntToStr(DM.Configuracao1.ContaAbreCaixa)+','+IntToStr(DM.Configuracao1.ContaFechaCaixa)+') '+
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCOutDevAvu := FieldByName('TOTAL').AsFloat;

    //Movimentos Títulos
    //Dinheiro
    //Crédito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO=5 '+   //Dinheiro
      ' AND M1.MVC_DC="C" '+        //Crédito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO>0 '+  //Não Avulso
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCDinCredTRC := FieldByName('TOTAL').AsFloat;

    //Débito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO=5 '+ //Dinheiro
      ' AND M1.MVC_DC="D" '+      //Débito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO>0 '+  //Não Avulso
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCDinDevTRC := FieldByName('TOTAL').AsFloat;

    //Cheque
    //Crédito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO=6 '+   //Cheque
      ' AND M1.MVC_DC="C" '+        //Crédito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO>0 '+  //Não Avulso
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCCheCredTRC := FieldByName('TOTAL').AsFloat;

    //Débito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO=6 '+   //Cheque
      ' AND M1.MVC_DC="D" '+        //Débito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO>0 '+  //Não Avulso
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCCheDevTRC := FieldByName('TOTAL').AsFloat;

    //Outros
    //Crédito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO>6 '+   //Outros
      ' AND M1.MVC_DC="C" '+        //Crédito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO>0 '+  //Não Avulso
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCOutCredTRC := FieldByName('TOTAL').AsFloat;

    //Débito
    Close;
    SQL.Text := 'SELECT SUM(ROUND(MVC_VALOR,2)) AS TOTAL '+
      ' FROM MOVIMENTO_DE_CAIXA M1 '+
      ' WHERE M1.MVC_CODIGO>0 '+
      ' AND M1.MVC_TIPO_PGTO>6 '+ //Outros
      ' AND M1.MVC_DC="D" '+      //Débito
      ' AND M1.CNC_CODIGO='+IntToStr(Entidade.codigoCNC)+
      ' AND M1.TIT_CODIGO>0 '+  //Não Avulso
      ' AND M1.MVC_DATA>="'+MesDia(vData)+'" '+
      ' AND M1.MVC_DATA<"'+MesDia(vData+1)+'" ';
    Open;
    vMVCOutDevTRC := FieldByName('TOTAL').AsFloat;
  end;
  zrlMVCDinheiroAvulsoC.Caption := format('%.2f',[vMVCDinCredAvu]);
  zrlMVCChequeAvulsoC.Caption := format('%.2f',[vMVCCheCredAvu]);
  zrlMVCCartaoAvulsoC.Caption := format('%.2f',[vMVCOutCredAvu]);
  zrlMVCCreditoAvulso.Caption := format('%.2f',[vMVCDinCredAvu+vMVCCheCredAvu+vMVCOutCredAvu]);

  zrlMVCDinheiroAvulsoD.Caption := format('%.2f',[vMVCDinDevAvu]);
  zrlMVCChequeAvulsoD.Caption := format('%.2f',[vMVCCheDevAvu]);
  zrlMVCCartaoAvulsoD.Caption := format('%.2f',[vMVCOutDevAvu]);
  zrlMVCDebitoAvulso.Caption := format('%.2f',[vMVCDinDevAvu+vMVCCheDevAvu+vMVCOutDevAvu]);

  zrlMVCDinheiroAvulsoS.Caption := format('%.2f',[vMVCDinCredAvu-vMVCDinDevAvu]);
  zrlMVCChequeAvulsos.Caption := format('%.2f',[vMVCCheCredAvu-vMVCCheDevAvu]);
  zrlMVCCartaoAvulsoS.Caption := format('%.2f',[vMVCOutCredAvu-vMVCOutDevAvu]);
  zrlMVCSaldoAvulso.Caption := format('%.2f',[vMVCDinCredAvu-vMVCDinDevAvu+
                                              vMVCCheCredAvu-vMVCCheDevAvu+
                                              vMVCOutCredAvu-vMVCOutDevAvu]);

  zrlMVCDinheiroTRCC.Caption := format('%.2f',[vMVCDinCredTRC]);
  zrlMVCChequeTRCC.Caption := format('%.2f',[vMVCCheCredTRC]);
  zrlMVCCartaoTRCC.Caption := format('%.2f',[vMVCOutCredTRC]);
  zrlMVCCreditoTRC.Caption := format('%.2f',[vMVCDinCredTRC+vMVCCheCredTRC+vMVCOutCredTRC]);

  zrlMVCDinheiroTRCD.Caption := format('%.2f',[vMVCDinDevTRC]);
  zrlMVCChequeTRCD.Caption := format('%.2f',[vMVCCheDevTRC]);
  zrlMVCCartaoTRCD.Caption := format('%.2f',[vMVCOutDevTRC]);
  zrlMVCDebitoTRC.Caption := format('%.2f',[vMVCDinDevTRC+vMVCCheDevTRC+vMVCOutDevTRC]);

  zrlMVCDinheiroTRCS.Caption := format('%.2f',[vMVCDinCredTRC-vMVCDinDevTRC]);
  zrlMVCChequeTRCS.Caption := format('%.2f',[vMVCCheCredTRC-vMVCOutDevTRC]);
  zrlMVCCartaoTRCS.Caption := format('%.2f',[vMVCOutCredTRC-vMVCOutDevTRC]);
  zrlMVCSaldoTRC.Caption := format('%.2f',[vMVCDinCredTRC-vMVCDinDevTRC+
                                           vMVCCheCredTRC-vMVCCheDevTRC+
                                           vMVCOutCredTRC-vMVCOutDevTRC]);

  zrlMVCDinheiroC.Caption := format('%.2f',[vMVCDinCredAvu+vMVCDinCredTRC]);
  zrlMVCChequeC.Caption := format('%.2f',[vMVCCheCredAvu+vMVCCheCredTRC]);
  zrlMVCCartaoC.Caption := format('%.2f',[vMVCOutCredAvu+vMVCOutCredTRC]);
  zrlMVCCredito.Caption := format('%.2f',[vMVCDinCredAvu+vMVCDinCredTRC+
                                          vMVCCheCredAvu+vMVCCheCredTRC+
                                          vMVCOutCredAvu+vMVCOutCredTRC]);

  zrlMVCDinheiroD.Caption := format('%.2f',[vMVCDinDevAvu+vMVCDinDevTRC]);
  zrlMVCChequeD.Caption := format('%.2f',[vMVCCheDevAvu+vMVCCheDevTRC]);
  zrlMVCCartaoD.Caption := format('%.2f',[vMVCOutDevAvu+vMVCOutDevTRC]);
  zrlMVCDebito.Caption := format('%.2f',[vMVCDinDevAvu+vMVCDinDevTRC+
                                         vMVCCheDevAvu+vMVCCheDevTRC+
                                         vMVCOutDevAvu+vMVCOutDevTRC]);

  zrlMVCDinheiroS.Caption := format('%.2f',[vMVCDinCredAvu+vMVCDinCredTRC-
                                            vMVCDinDevAvu+vMVCDinDevTRC]);
  zrlMVCChequeS.Caption := format('%.2f',[vMVCCheCredAvu+vMVCCheCredTRC-
                                            vMVCCheDevAvu+vMVCCheDevTRC]);
  zrlMVCCartaoS.Caption := format('%.2f',[vMVCOutCredAvu+vMVCOutCredTRC-
                                            vMVCOutDevAvu+vMVCOutDevTRC]);
  zrlMVCSaldo.Caption := format('%.2f',[vMVCDinCredAvu+vMVCDinCredTRC-
                                        vMVCDinDevAvu+vMVCDinDevTRC+
                                        vMVCCheCredAvu+vMVCCheCredTRC-
                                        vMVCCheDevAvu+vMVCCheDevTRC+
                                        vMVCOutCredAvu+vMVCOutCredTRC-
                                        vMVCOutDevAvu+vMVCOutDevTRC]);
end;

end.
