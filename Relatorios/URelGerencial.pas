unit URelGerencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, AgenteFin, Parametro, CentroCusto, Pedido_de_Venda,
  Pacote_de_venda;

type
  Trpt_Gerencial = class(TForm)
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
    ZRLabel12: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    zrlDataINI: TSZRLabel;
    ZRLabel5: TSZRLabel;
    zrlDescCredito: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrbRodapeTipo: TSZRBand;
    zrlDescricaoGrupoConta: TSZRLabel;
    zrlDebitoGrupo: TSZRLabel;
    zrlCreditoGrupo: TSZRLabel;
    zrlDescDesconto: TSZRLabel;
    zrlDescDebito: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlSaldoDinheiro: TSZRLabel;
    zrlSaldoCheque: TSZRLabel;
    zrlDebitoDinherio: TSZRLabel;
    zrlDebitoCheque: TSZRLabel;
    zrlDebitoCartao: TSZRLabel;
    zrlCreditoDinheiro: TSZRLabel;
    zrlCreditoCheque: TSZRLabel;
    zrlCreditoCartao: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlCreditoDeposito: TSZRLabel;
    zrlDebitoDeposito: TSZRLabel;
    zrlSaldoGrupo: TSZRLabel;
    zrlLinha3: TSZRLabel;
    zrlDescReceita: TSZRLabel;
    zrlSaldoCartao: TSZRLabel;
    zrlSaldoDeposito: TSZRLabel;
    zrlCreditoRepasse: TSZRLabel;
    zrlDebitoRepasse: TSZRLabel;
    zrlSaldoRepasse: TSZRLabel;
    zrlSaldoGeral: TSZRLabel;
    SZRLabel1: TSZRLabel;
    Parametro1: TParametro;
    zrlCreditoMovimento: TSZRLabel;
    zrlDebitoMovimento: TSZRLabel;
    zrlSaldoMovimento: TSZRLabel;
    zrlDescContaCaixa: TSZRLabel;
    zrlCreditoGeral: TSZRLabel;
    zrlDebitoGeral: TSZRLabel;
    Titulo_receber2: TTitulo_receber;
    SZRLabel7: TSZRLabel;
    zrlCreditoBoleto: TSZRLabel;
    zrlDebitoBoleto: TSZRLabel;
    zrlSaldoBoleto: TSZRLabel;
    Titulo_receber3: TTitulo_receber;
    SZRLabel10: TSZRLabel;
    QuerySelect: TQuery;
    QueryGrupo: TQuery;
    QuerySubGrupo: TQuery;
    QueryAbrangente: TQuery;
    zrbGrupo: TSZRGroup;
    SZRLabel11: TSZRLabel;
    SZRLabel14: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeTipoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
      vDebitoGrupo, vCreditoGrupo, vDebitoGeral, vCreditoGeral: Double;
  public
    Entidade: TTitulo_receber;
  end;

var
  rpt_Gerencial: Trpt_Gerencial;

implementation
Uses
  UDM, Funcoes, DateUtils, MxSelGerencial;

{$R *.DFM}


procedure Trpt_Gerencial.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  //zrbGrupoTipo.Height := 0;
  vDebitoGeral  := 0;
  vCreditoGeral := 0;
end;

procedure Trpt_Gerencial.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  //
  if tag=1 then
  begin
    if not fMxSelGerencial.ckbLimite.checked then
    begin
      zrlDescDebito.Caption:='Debito';
      zrlDescCredito.Caption:='Credito';
    end
    else
    begin
      zrlDescDebito.Caption:='Gasto';
      zrlDescCredito.Caption:='Limite';
    end;
  end;
end;

procedure Trpt_Gerencial.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
  with DM.Usuario2 do
  Begin
    if DM.Configuracao1.CodigoUSU <> CodigoUSU then
    Begin
      Close;
      ParamByName('USU_CODIGO').asInteger := DM.Configuracao1.CodigoUSU;
      Open;
    end;
    zrlUsuario.Caption := 'Usuario: '+UpperCase(NomeUSU);
  end;
end;

procedure Trpt_Gerencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_Gerencial.zrbRodapeTipoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
{  with Parametro1 do
  Begin
    if (not Active) or
       (CodigoPAR <> Entidade.FieldByName('CCX_GRUPO').asInteger) then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Entidade.FieldByName('CCX_GRUPO').asInteger;
      Open;
    end;
    if IsEmpty then
      zrlDescricaoGrupoConta.Caption := 'SEM GRUPO DE CONTA'
    else
      zrlDescricaoGrupoConta.Caption := Descricao;
  end;}

  zrlDebitoGrupo.Caption  := Format('%.2f', [vDebitoGrupo]);
  zrlCreditoGrupo.Caption := Format('%.2f', [vCreditoGrupo]);
  zrlSaldoGrupo.Caption   := Format('%.2f', [vCreditoGrupo-vDebitoGrupo]);
end;

procedure Trpt_Gerencial.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vDebito, vCredito: Double;
begin
  zrlDescContaCaixa.Caption := Entidade.FieldByName('CCX_DESCRICAO').AsString;
  //
  if tag=1 then
  begin
    if not fMxSelGerencial.ckbLimite.checked then
    begin
      vDebito  := Arredonda(Entidade.FieldByName('DEBITO_MVC').asFloat+Entidade.FieldByName('DEBITO_TPG').asFloat);
      vCredito := Arredonda(Entidade.FieldByName('CREDITO_MVC').asFloat+Entidade.FieldByName('CREDITO_TRC').asFloat);

      vDebitoGrupo  := vDebitoGrupo  + vDebito;
      vCreditoGrupo := vCreditoGrupo + vCredito;

      vDebitoGeral  := vDebitoGeral  + vDebito;
      vCreditoGeral := vCreditoGeral + vCredito;
    end
    else
    begin
      QuerySelect.Active:=false;
      QuerySelect.SQL.Clear;
      QuerySelect.SQL.Add('SELECT * FROM CONTA_DE_CAIXA WHERE CCX_CODIGO='''+inttostr(entidade.CodigoCCX)+'''');
      QuerySelect.Active:=true;

      vDebito  := Arredonda(Entidade.FieldByName('DEBITO_MVC').asFloat+Entidade.FieldByName('DEBITO_TPG').asFloat);
      vCredito := QuerySelect.fieldbyname('CCX_LIMITE_GASTO').AsFloat;

      vDebitoGrupo  := vDebitoGrupo  + vDebito;
      vCreditoGrupo := vCreditoGrupo + vCredito;

      vDebitoGeral  := vDebitoGeral  + vDebito;
      vCreditoGeral := vCreditoGeral + vCredito;
      // // //
    end;
  end;

  zrlDebitoMovimento.Caption  := Format('%.2f', [vDebito]);
  zrlCreditoMovimento.Caption := Format('%.2f', [vCredito]);
  zrlSaldoMovimento.Caption   := Format('%.2f', [vCredito-vDebito]);
end;

procedure Trpt_Gerencial.zrlSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlDebitoGeral.Caption  := Format('%.2f',[vDebitoGeral]);
  zrlCreditoGeral.Caption := Format('%.2f',[vCreditoGeral]);
  zrlSaldoGeral.Caption   := Format('%.2f',[vCreditoGeral-vDebitoGeral]);

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

  with Titulo_receber3 do
  Begin
    Close;
    ParamByName('CCX_GRUPO').asInteger := DM.Configuracao1.GrupoRepasse;
    Open;
    zrlCreditoRepasse.Caption := Format('%.2f',[FieldByName('TOTAL').asFloat]);
  end;
end;

end.
