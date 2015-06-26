unit UTitulosReceberRecebidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, AgenteFin, Parametro, CentroCusto, Pedido_de_Venda,
  Pacote_de_venda;

type
  Trpt_TitulosReceberRecebidos = class(TForm)
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
    zrdVencimento: TSZRDBText;
    zrdCodigoTRC: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    zrbSumario: TSZRBand;
    ZRLabel12: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    zrlDataINI: TSZRLabel;
    zrlCredito: TSZRLabel;
    AgenteFin1: TAgenteFin;
    zrlAgenteFin: TSZRLabel;
    ZRLabel5: TSZRLabel;
    zrbGrupoDia: TSZRGroup;
    zrlDiaMovimento: TSZRLabel;
    zrbRodapeDia: TSZRBand;
    zrlDebitoDia: TSZRLabel;
    zrlCreditoDia: TSZRLabel;
    zrlDescVencimento: TSZRLabel;
    zrlDescCodigo: TSZRLabel;
    zrlDescSeq: TSZRLabel;
    zrlDescCliente: TSZRLabel;
    zrlDescAgente: TSZRLabel;
    zrlDescNumero: TSZRLabel;
    zrlDescCredito: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrdNumero: TSZRDBText;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupoTipo: TSZRGroup;
    SZRLabel9: TSZRLabel;
    zrbRodapeTipo: TSZRBand;
    zrlDescricaoGrupoTipo: TSZRLabel;
    zrlDebitoTipo: TSZRLabel;
    zrlCreditoTipo: TSZRLabel;
    zrlDescJuros: TSZRLabel;
    zrlDescDesconto: TSZRLabel;
    zrlDescDebito: TSZRLabel;
    zrlDebito: TSZRLabel;
    zrlJuros: TSZRLabel;
    zrlDesconto: TSZRLabel;
    zrlDescricaoGrupoDia: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlJurosBanco: TSZRLabel;
    zrlJurosNBanco: TSZRLabel;
    zrlDescontoBanco: TSZRLabel;
    zrlDescontoNBanco: TSZRLabel;
    zrlDebitoBanco: TSZRLabel;
    zrlDebitoNBanco: TSZRLabel;
    zrlDebitoDevolvido: TSZRLabel;
    zrlCreditoBanco: TSZRLabel;
    zrlCreditoNBanco: TSZRLabel;
    zrlCreditoDevolvido: TSZRLabel;
    Cliente1: TCliente;
    SZRLabel8: TSZRLabel;
    zrlCreditoFaturado: TSZRLabel;
    zrlDebitoFaturado: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlCreditoGeral: TSZRLabel;
    zrlDebitoGeral: TSZRLabel;
    zrlJurosGeral: TSZRLabel;
    zrlDescontoGeral: TSZRLabel;
    zrlJurosTipo: TSZRLabel;
    zrlDescontoTipo: TSZRLabel;
    zrlJurosDia: TSZRLabel;
    zrlDescontoDia: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRDBText1: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoDiaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeDiaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoTipoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeTipoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vCreditoDia, vDebitoDia, vJurosDia, vDescontoDia, vCreditoTipo, vDebitoTipo,
      vJurosTipo, vDescontoTipo, vJurosGeral, vDescontoGeral, vCreditoGeral,
      vDebitoGeral, vJurosBanco, vDescontoBanco, vCreditoBanco, vDebitoBanco,
                    vJurosNBanco, vDescontoNBanco, vCreditoNBanco, vDebitoNBanco,
                    vCreditoDevolucao, vDebitoDevolucao,
                    vCreditoFaturado, vDebitoFaturado :Double;
  public
    Entidade: TTitulo_receber;
  end;

var
  rpt_TitulosReceberRecebidos: Trpt_TitulosReceberRecebidos;

implementation
Uses
  UDM, Funcoes;

{$R *.DFM}


procedure Trpt_TitulosReceberRecebidos.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  vCreditoGeral  := 0;
  vDebitoGeral   := 0;
  vJurosGeral    := 0;
  vDescontoGeral := 0;

  vJurosBanco        := 0;
  vDescontoBanco     := 0;
  vCreditoBanco      := 0;
  vDebitoBanco       := 0;
  vJurosNBanco       := 0;
  vDescontoNBanco    := 0;
  vCreditoNBanco     := 0;
  vDebitoNBanco      := 0;
  vCreditoDevolucao  := 0;
  vDebitoDevolucao   := 0;
  vCreditoFaturado   := 0;
  vDebitoFaturado    := 0;
end;

procedure Trpt_TitulosReceberRecebidos.zrbGrupoDiaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlDiaMovimento.Caption := 'MOVIMENTO DIA: '+PreencheZero(2,Entidade.FieldByName('Dia').AsString)+'/'+
    PreencheZero(2,Entidade.FieldByName('Mes').AsString)+'/'+
    Entidade.FieldByName('Ano').AsString;

  vCreditoDia  := 0;
  vDebitoDia   := 0;
  vJurosDia    := 0;
  vDescontoDia := 0;
end;

procedure Trpt_TitulosReceberRecebidos.zrbGrupoTipoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  vCreditoTipo  := 0;
  vDebitoTipo   := 0;
  vJurosTipo    := 0;
  vDescontoTipo := 0;

  case Entidade.FieldByName('TIPO').asInteger of
    0:  zrlDescricaoGrupoTipo.Caption := 'SUBTOTAL RECEBIDO BANCO: ';
    1:  zrlDescricaoGrupoTipo.Caption := 'SUBTOTAL RECEBIDO N/BANCO: ';
    10: zrlDescricaoGrupoTipo.Caption := 'SUBTOTAL DEVOLUCOES: ';
    20: zrlDescricaoGrupoTipo.Caption := 'SUBTOTAL FATURADO: ';
    else
      zrlDescricaoGrupoTipo.Caption := 'TIPO DESCONHECIDO';
  end;
end;

procedure Trpt_TitulosReceberRecebidos.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_TitulosReceberRecebidos.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  iGrupoEspecial, CdCNC, CdPDV, CdCNCCLI, CdCLI, CdAGF: integer;
begin
  CdCNC    := Entidade.FieldByName('CENTRO').asInteger;
  CdPDV    := Entidade.FieldByName('PEDIDO').asInteger;
  CdCNCCLI := Entidade.FieldByName('CLICNC').asInteger;
  CdCLI    := Entidade.FieldByName('CLI').asInteger;
  CdAGF    := Entidade.FieldByName('AGF').asInteger;

  with Cliente1 do
  Begin
    if (not Active) or
       (CodigoCNC <> CdCNCCLI) or
       (CodigoCLI <> CdCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := CdCNCCLI;
      ParamByName('CLI_CODIGO').asInteger := CdCLI;
      Open;
    end;
    zrlCliente.Caption := PreencheZero(2,CdCNCCLI)+'-'+PreencheZero(7,CdCLI)+
                          ' '+RazaoSocial;
  end;

  iGrupoEspecial := 0;
  if CdPDV > 0 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT MAX(AGF_CODIGO) AS AGF1, '+
        ' MAX(P1.PDV_GRUPO_ESPECIAL) AS GRUPO_ESPECIAL '+
        ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
        ' WHERE P1.CNC_CODIGO='+IntToStr(cdCNC)+
        ' AND P1.PDV_CODIGO='+IntToStr(CdPDV)+
        ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
      Open;
      if IsEmpty then //Pacote
      Begin
        Close;
        SQL.Text := 'SELECT MAX(AGF_CODIGO) AS AGF1, '+
          ' MAX(P1.PCT_GRUPO_ESPECIAL) AS GRUPO_ESPECIAL '+
          ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
          ' WHERE P1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND P1.PDV_CODIGO='+IntToStr(CdPDV)+
          ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
        Open;
      end;
      CdAGF          := FieldByName('AGF1').asInteger;
      iGrupoEspecial := FieldByName('GRUPO_ESPECIAL').asInteger;
    end;
  end;

  zrlAgenteFin.Caption := '';
  if Entidade.FieldByName('TIPO').asInteger < 10 then
  Begin
    if DM.Configuracao1.Empresa <> empMotical then
    Begin
      if DM.Configuracao1.Empresa <> 1 then
      Begin
        if CdAGF > 0 then
        Begin
          with AgenteFin1 do
          Begin
            if (not Active) or
               (CdAGF <> CodigoAGF) then
            Begin
              Close;
              ParamByName('AGF_CODIGO').asInteger := CdAGF;
              Open;
            end;
            if Length(Descricao) <= zrlAgenteFin.Width then
              zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + Descricao
            else
              zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + Copy(Descricao, 1, zrlAgenteFin.Width);
          end;
        end;
      end
      else if CdAGF > 0 then  //Somente ELETRO GUERRA
        zrlAgenteFin.Caption := IntToStr(CdAGF);
    end
    else //Somente MOTICAL
    Begin
      if Entidade.FieldByName('DT_BOLETO').asDateTime > 0 then
        zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + 'BB'+IntToStr(iGrupoEspecial)
      else if Entidade.FieldByName('DT_VERIFICADO').asDateTime > 0 then
        zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + '00 '
      else
        zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + PreencheZero(2,CdCNC)+' ';
    end;
  end;

  case Entidade.FieldByName('TIPO').asInteger of
    0: Begin
         vJurosBanco    := vJurosBanco    + Arredonda(Entidade.FieldByName('JUROS').asFloat);
         vDescontoBanco := vDescontoBanco + Arredonda(Entidade.FieldByName('DESCONTO').asFloat);
         vCreditoBanco  := vCreditoBanco  + Arredonda(Entidade.FieldByName('CREDITO').asFloat);
         vDebitoBanco   := vDebitoBanco   + Arredonda(Entidade.FieldByName('DEBITO').asFloat);
       end;
    1:Begin
         vJurosNBanco    := vJurosNBanco    + Arredonda(Entidade.FieldByName('JUROS').asFloat);
         vDescontoNBanco := vDescontoNBanco + Arredonda(Entidade.FieldByName('DESCONTO').asFloat);
         vCreditoNBanco  := vCreditoNBanco  + Arredonda(Entidade.FieldByName('CREDITO').asFloat);
         vDebitoNBanco   := vDebitoNBanco   + Arredonda(Entidade.FieldByName('DEBITO').asFloat);
       end;
    10:Begin
         vCreditoDevolucao  := vCreditoDevolucao  + Arredonda(Entidade.FieldByName('CREDITO').asFloat);
         vDebitoDevolucao   := vDebitoDevolucao   + Arredonda(Entidade.FieldByName('DEBITO').asFloat);
       end;
    20:Begin
         vCreditoFaturado  := vCreditoFaturado  + Arredonda(Entidade.FieldByName('CREDITO').asFloat);
         vDebitoFaturado   := vDebitoFaturado   + Arredonda(Entidade.FieldByName('DEBITO').asFloat);
       end;
  end;


  //Juros
  if Entidade.FieldByName('JUROS').asFloat > 0 then
  Begin
    zrlJuros.Caption := format('%.2f',[Entidade.FieldByName('JUROS').asFloat]);
    vJurosTipo  := vJurosTipo  + Arredonda(Entidade.FieldByName('JUROS').asFloat);
    vJurosDia   := vJurosDia   + Arredonda(Entidade.FieldByName('JUROS').asFloat);
    vJurosGeral := vJurosGeral + Arredonda(Entidade.FieldByName('JUROS').asFloat);
  end
  else
    zrlJuros.Caption := '-';

  //Desconto
  if Entidade.FieldByName('DESCONTO').asFloat > 0 then
  Begin
    zrlDesconto.Caption := format('%.2f',[Entidade.FieldByName('DESCONTO').asFloat]);
    vDescontoTipo  := vDescontoTipo  + Arredonda(Entidade.FieldByName('DESCONTO').asFloat);
    vDescontoDia   := vDescontoDia   + Arredonda(Entidade.FieldByName('DESCONTO').asFloat);
    vDescontoGeral := vDescontoGeral + Arredonda(Entidade.FieldByName('DESCONTO').asFloat);
  end
  else
    zrlDesconto.Caption := '-';

  if Entidade.FieldByName('CREDITO').asFloat > 0 then
  Begin
    zrlCredito.Caption := format('%.2f',[Entidade.FieldByName('CREDITO').asFloat]);
    vCreditoTipo  := vCreditoTipo   + Arredonda(Entidade.FieldByName('CREDITO').asFloat);
    vCreditoDia   := vCreditoDia    + Arredonda(Entidade.FieldByName('CREDITO').asFloat);
    vCreditoGeral := vCreditoGeral  + Arredonda(Entidade.FieldByName('CREDITO').asFloat);
  end
  else
    zrlCredito.Caption := '-';

  if Entidade.FieldByName('DEBITO').asFloat > 0 then
  Begin
    zrlDebito.Caption  := format('%.2f',[Entidade.FieldByName('DEBITO').asFloat]);
    vDebitoTipo   := vDebitoTipo    + Arredonda(Entidade.FieldByName('DEBITO').asFloat);
    vDebitoDia    := vDebitoDia     + Arredonda(Entidade.FieldByName('DEBITO').asFloat);
    vDebitoGeral  := vDebitoGeral   + Arredonda(Entidade.FieldByName('DEBITO').asFloat);
  end
  else
    zrlDebito.Caption  := '-';
end;

procedure Trpt_TitulosReceberRecebidos.zrbRodapeTipoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  if vJurosTipo > 0 then
    zrlJurosTipo.Caption  := Format('%.2f',[vJurosTipo])
  else
    zrlJurosTipo.Caption  := '-';

  if vDescontoTipo > 0 then
    zrlDescontoTipo.Caption  := Format('%.2f',[vDescontoTipo])
  else
    zrlDescontoTipo.Caption  := '-';

  if vDebitoTipo > 0 then
    zrlDebitoTipo.Caption  := Format('%.2f',[vDebitoTipo])
  else
    zrlDebitoTipo.Caption  := '-';

  if vCreditoTipo > 0 then
    zrlCreditoTipo.Caption := Format('%.2f',[vCreditoTipo])
  else
    zrlCreditoTipo.Caption := '-';
end;

procedure Trpt_TitulosReceberRecebidos.zrbRodapeDiaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if vJurosDia > 0 then
    zrlJurosDia.Caption  := Format('%.2f',[vJurosDia])
  else
    zrlJurosDia.Caption  := '-';

  if vDescontoDia > 0 then
    zrlDescontoDia.Caption  := Format('%.2f',[vDescontoDia])
  else
    zrlDescontoDia.Caption  := '-';

  if vDebitoDia > 0 then
    zrlDebitoDia.Caption  := Format('%.2f',[vDebitoDia])
  else
    zrlDebitoDia.Caption  := '-';

  if vCreditoDia > 0 then
    zrlCreditoDia.Caption := Format('%.2f',[vCreditoDia])
  else
    zrlCreditoDia.Caption := '-';
end;

procedure Trpt_TitulosReceberRecebidos.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if vJurosBanco > 0 then
    zrlJurosBanco.Caption  := Format('%.2f',[vJurosBanco])
  else
    zrlJurosBanco.Caption  := '-';

  if vDescontoBanco > 0 then
    zrlDescontoBanco.Caption  := Format('%.2f',[vDescontoBanco])
  else
    zrlDescontoBanco.Caption  := '-';

  if vCreditoBanco > 0 then
    zrlCreditoBanco.Caption  := Format('%.2f',[vCreditoBanco])
  else
    zrlCreditoBanco.Caption  := '-';

  if vDebitoBanco > 0 then
    zrlDebitoBanco.Caption  := Format('%.2f',[vDebitoBanco])
  else
    zrlDebitoBanco.Caption  := '-';

  if vJurosNBanco > 0 then
    zrlJurosNBanco.Caption  := Format('%.2f',[vJurosNBanco])
  else
    zrlJurosNBanco.Caption  := '-';

  if vDescontoNBanco > 0 then
    zrlDescontoNBanco.Caption  := Format('%.2f',[vDescontoNBanco])
  else
    zrlDescontoNBanco.Caption  := '-';

  if vCreditoNBanco > 0 then
    zrlCreditoNBanco.Caption  := Format('%.2f',[vCreditoNBanco])
  else
    zrlCreditoNBanco.Caption  := '-';

  if vDebitoNBanco > 0 then
    zrlDebitoNBanco.Caption  := Format('%.2f',[vDebitoNBanco])
  else
    zrlDebitoNBanco.Caption  := '-';

  if vCreditoDevolucao > 0 then
    zrlCreditoDevolvido.Caption  := Format('%.2f',[vCreditoDevolucao])
  else
    zrlCreditoDevolvido.Caption  := '-';

  if vDebitoDevolucao > 0 then
    zrlDebitoDevolvido.Caption  := Format('%.2f',[vDebitoDevolucao])
  else
    zrlDebitoDevolvido.Caption  := '-';

  if vCreditoFaturado > 0 then
    zrlCreditoFaturado.Caption  := Format('%.2f',[vCreditoFaturado])
  else
    zrlCreditoFaturado.Caption  := '-';

  if vDebitoFaturado > 0 then
    zrlDebitoFaturado.Caption  := Format('%.2f',[vDebitoFaturado])
  else
    zrlDebitoFaturado.Caption  := '-';


  if vJurosGeral > 0 then
    zrlJurosGeral.Caption  := Format('%.2f',[vJurosGeral])
  else
    zrlJurosGeral.Caption  := '-';

  if vDescontoGeral > 0 then
    zrlDescontoGeral.Caption  := Format('%.2f',[vDescontoGeral])
  else
    zrlDescontoGeral.Caption  := '-';

  if vCreditoGeral > 0 then
    zrlCreditoGeral.Caption  := Format('%.2f',[vCreditoGeral])
  else
    zrlCreditoGeral.Caption  := '-';

  if vDebitoGeral > 0 then
    zrlDebitoGeral.Caption  := Format('%.2f',[vDebitoGeral])
  else
    zrlDebitoGeral.Caption  := '-';
end;

procedure Trpt_TitulosReceberRecebidos.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_TitulosReceberRecebidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

end.
