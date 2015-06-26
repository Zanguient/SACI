unit UBalancete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, AgenteFin, Parametro, CentroCusto, Pedido_de_Venda,
  Pacote_de_venda;

type
  Trpt_Balancete = class(TForm)
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
    Titulo_receber1: TTitulo_receber;
    zrlSumario: TSZRBand;
    ZRLabel5: TSZRLabel;
    zrlDescCredito: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupoTipo: TSZRGroup;
    SZRLabel9: TSZRLabel;
    zrbRodapeTipo: TSZRBand;
    zrlDescricaoGrupoConta: TSZRLabel;
    zrlDebitoGrupo: TSZRLabel;
    zrlCreditoGrupo: TSZRLabel;
    zrlDescDesconto: TSZRLabel;
    zrlDescDebito: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlSaldoGrupo: TSZRLabel;
    zrlLinha3: TSZRLabel;
    zrlDescReceita: TSZRLabel;
    zrlSaldoGeral: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlCreditoMovimento: TSZRLabel;
    zrlDebitoMovimento: TSZRLabel;
    zrlSaldoMovimento: TSZRLabel;
    zrlDescContaCaixa: TSZRLabel;
    zrlCreditoGeral: TSZRLabel;
    zrlDebitoGeral: TSZRLabel;
    Titulo_receber2: TTitulo_receber;
    zrlDescricaoGrupoConta2: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoTipoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeTipoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
      vDebitoGrupo, vCreditoGrupo, vDebitoGeral, vCreditoGeral, vCreditoRepasse, vDebitoRepasse: Double;
  public
    Entidade: TTitulo_receber;
  end;

var
  rpt_Balancete: Trpt_Balancete;

implementation
Uses
  UDM, Funcoes, DateUtils;

{$R *.DFM}


procedure Trpt_Balancete.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  vDebitoGeral  := 0;
  vCreditoGeral := 0;
  vCreditoRepasse := 0;
  vDebitoRepasse := 0;
end;

procedure Trpt_Balancete.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Balancete.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Balancete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_Balancete.zrbGrupoTipoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vDebitoGrupo  := 0;
  vCreditoGrupo := 0;

  if Entidade.FieldByName('CCX_GRUPO').AsInteger = DM.Configuracao1.GrupoRepasse then
  Begin
    DoPrint := False;
    Exit;
  end
  else
    DoPrint := True;

  DM.SelecionaParametro(Entidade.FieldByName('CCX_GRUPO').asInteger);
  if DM.Parametro1.IsEmpty then
    zrlDescricaoGrupoConta2.Caption := 'SEM GRUPO DE CONTA'
  else
    zrlDescricaoGrupoConta2.Caption := DM.Parametro1.Descricao;
end;

procedure Trpt_Balancete.zrbRodapeTipoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.FieldByName('CCX_GRUPO').AsInteger = DM.Configuracao1.GrupoRepasse then
  Begin
    DoPrint := False;
    Exit;
  end
  else
    DoPrint := True;

  DM.SelecionaParametro(Entidade.FieldByName('CCX_GRUPO').asInteger);
  if DM.Parametro1.IsEmpty then
    zrlDescricaoGrupoConta.Caption  := 'SEM GRUPO DE CONTA'
  else
    zrlDescricaoGrupoConta.Caption  := DM.Parametro1.Descricao;
      
  zrlDebitoGrupo.Caption  := Format('%.2f', [vDebitoGrupo]);
  zrlCreditoGrupo.Caption := Format('%.2f', [vCreditoGrupo]);
  zrlSaldoGrupo.Caption   := Format('%.2f', [vCreditoGrupo-vDebitoGrupo]);
end;

procedure Trpt_Balancete.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vDebito, vCredito: Double;
begin
  if Entidade.FieldByName('CCX_GRUPO').AsInteger = DM.Configuracao1.GrupoRepasse then
  Begin
    vCreditoRepasse := vCreditoRepasse + Arredonda(Entidade.FieldByName('CREDITO_MVC').asFloat+Entidade.FieldByName('CREDITO_TRC').asFloat);
    vDebitoRepasse  := vDebitoRepasse  + Arredonda(Entidade.FieldByName('DEBITO_MVC').asFloat+Entidade.FieldByName('DEBITO_TPG').asFloat);
    DoPrint := False;
    Exit;
  end
  else
    DoPrint := True;

  zrlDescContaCaixa.Caption := Entidade.FieldByName('CCX_DESCRICAO').AsString;

  vDebito  := Arredonda(Entidade.FieldByName('DEBITO_MVC').asFloat+Entidade.FieldByName('DEBITO_TPG').asFloat);

  vCredito := Arredonda(Entidade.FieldByName('CREDITO_MVC').asFloat+Entidade.FieldByName('CREDITO_TRC').asFloat);

  vDebitoGrupo  := vDebitoGrupo  + vDebito;
  vCreditoGrupo := vCreditoGrupo + vCredito;

  vDebitoGeral  := vDebitoGeral  + vDebito;
  vCreditoGeral := vCreditoGeral + vCredito;

  zrlDebitoMovimento.Caption  := Format('%.2f', [vDebito]);
  zrlCreditoMovimento.Caption := Format('%.2f', [vCredito]);
  zrlSaldoMovimento.Caption   := Format('%.2f', [vCredito-vDebito]);
end;

procedure Trpt_Balancete.zrlSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlDebitoGeral.Caption  := Format('%.2f',[vDebitoGeral]);
  zrlCreditoGeral.Caption := Format('%.2f',[vCreditoGeral]);
  zrlSaldoGeral.Caption   := Format('%.2f',[vCreditoGeral-vDebitoGeral]);

{
  with Titulo_receber2 do
  Begin
    Close;
    ParamByName('TRC_TIPO_PAG').asInteger := 5; //Dinheiro/Promissoria
    Open;
    zrlCreditoDinheiro.Caption := Format('%.2f',[FieldByName('TOTAL').asFloat]);

    Close;
    ParamByName('TRC_TIPO_PAG').asInteger := 6; //Cheque
    Open;
    zrlCreditoCheque.Caption := Format('%.2f',[FieldByName('TOTAL').asFloat]);

    Close;
    ParamByName('TRC_TIPO_PAG').asInteger := 13; //Cartão de Crédito
    Open;
    zrlCreditoCartao.Caption := Format('%.2f',[FieldByName('TOTAL').asFloat]);

    Close;
    ParamByName('TRC_TIPO_PAG').asInteger := 412; //Boleto Bancário
    Open;
    zrlCreditoBoleto.Caption := Format('%.2f',[FieldByName('TOTAL').asFloat]);

    Close;
    ParamByName('TRC_TIPO_PAG').asInteger := 416; //Depósito em Conta
    Open;
    zrlCreditoDeposito.Caption := Format('%.2f',[FieldByName('TOTAL').asFloat]);
  end;

  zrlDebitoRepasse.Caption  := Format('%.2f',[vDebitoRepasse]);
  zrlCreditoRepasse.Caption := Format('%.2f',[vCreditoRepasse]);
  zrlSaldoRepasse.Caption := Format('%.2f',[StrToFloat(zrlCreditoRepasse.Caption)-StrToFloat(zrlDebitoRepasse.Caption)]);
}
end;

end.
