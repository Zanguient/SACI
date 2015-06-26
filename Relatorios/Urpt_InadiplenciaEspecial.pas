unit Urpt_InadiplenciaEspecial;

{
* DtOrigem  = Data do vencimento. Se tiver data de origem.
* Valor     = Valor do título. Se for parcial pode conter juros.
* Pagamento = Data de Pagamento.
* ValorPG   = Valor do Pagamento. Pode conter juros.
* Principal = Valor referente ao título principal sem juros menos tudo que foi recebido referente a esse título.
* P         = - Normal; S Parcial (independente de está em aberto ou não) (tanto para a origem como para o gerado)
* TP        = A  Aberto
              AR AbertoReaberto (gerado)
              E  Excluído
              R  Reaberto (excluído - Data da exclusão)
              P  Pago
              PR PagoReaberto (excluído - Data do Pagamento)
              PX Pago Extornado (existe um MVC de extorno desse título)
              X  Extorno (MVC de extorno)

}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, Db, DBTables, SQuery, Titulo_receber, ZRCtrls,
  StrUtils, NotaFiscal, Pedido_de_Venda, Cliente;

type
  Trpt_InadiplenciaEspecial = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlNomeEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrbRodapePagina: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    zrlDetalhe: TSZRBand;
    zrbSumario: TSZRBand;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    zrlLinhaDupla: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlLinhaSumario: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlCliente: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRDBText8: TSZRDBText;
    SZRLabel12: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRLabel28: TSZRLabel;
    zrlDataPedido: TSZRLabel;
    SZRLabel30: TSZRLabel;
    zrlDataOrigem: TSZRLabel;
    Cliente1: TCliente;
    Pedido_de_Venda1: TPedido_de_Venda;
    NotaFiscal1: TNotaFiscal;
    zrlValorCalculado: TSZRLabel;
    SZRLabel31: TSZRLabel;
    ZRDBText9: TSZRDBText;
    zrlTipoPag: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlCobrador: TSZRLabel;
    zrlFormaPagamento: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel29: TSZRLabel;
    zrlValorPrincipal: TSZRLabel;
    zrlDataPagamento: TSZRLabel;
    zrlValor: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlTipo: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlValorRecebido: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlParcial: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlCredito: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrbGrupoFUN: TSZRGroup;
    zrbRodapeVendedor: TSZRBand;
    zrlVendedor: TSZRLabel;
    SZRLabel54: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel19: TSZRLabel;
    zrlInadiplencia: TSZRLabel;
    zrlDescTotalQtdTRC: TSZRLabel;
    zrlDescTotalQtdCLI: TSZRLabel;
    zrlTotalQtdTRC: TSZRLabel;
    zrlTotalQtdCLI: TSZRLabel;
    zrlDescTotalAReceber: TSZRLabel;
    zrlTotalAReceber: TSZRLabel;
    zrlTotalRecebido: TSZRLabel;
    zrlDescTotalPrincipal: TSZRLabel;
    zrlDescTotalPrincipalRecebido: TSZRLabel;
    zrlTotalPrincipal: TSZRLabel;
    zrlTotalPrincipalRecebido: TSZRLabel;
    zrlDescTotalRecebido: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlJurosTotal: TSZRLabel;
    zrlTotalComJuros: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlTotalCredito: TSZRLabel;
    zrlTotalComCredito: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlPrincipalTotal: TSZRLabel;
    zrlTotalCalculado: TSZRLabel;
    zrlPrincipalExibido: TSZRLabel;
    zrlRecebidoExibido: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrlGInadiplencia: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlGTotalQtdTRC: TSZRLabel;
    zrlGTotalQtdCLI: TSZRLabel;
    SZRLabel33: TSZRLabel;
    zrlGTotalAReceber: TSZRLabel;
    zrlGTotalRecebido: TSZRLabel;
    SZRLabel36: TSZRLabel;
    SZRLabel37: TSZRLabel;
    zrlGTotalPrincipal: TSZRLabel;
    zrlGTotalPrincipalRecebido: TSZRLabel;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    zrlGJurosTotal: TSZRLabel;
    zrlGTotalComJuros: TSZRLabel;
    SZRLabel44: TSZRLabel;
    SZRLabel45: TSZRLabel;
    zrlGTotalCredito: TSZRLabel;
    zrlGTotalComCredito: TSZRLabel;
    SZRLabel48: TSZRLabel;
    SZRLabel49: TSZRLabel;
    zrlGPrincipalTotal: TSZRLabel;
    zrlGTotalCalculado: TSZRLabel;
    zrlGPrincipalExibido: TSZRLabel;
    zrlGRecebidoExibido: TSZRLabel;
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoSituacaoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbGrupoFUNBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeVendedorBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vGRecebidoExibido, vGPrincipalExibido,vGTotalJuros,vGTotalAberto,vGTotalRecebido,
      vGTotalCredito,vGPrincipalAberto,vGPrincipalRecebido,vGTotalCalculado,
      vTotalAberto, vTotalRecebido, vTotalCredito, vPrincipalAberto, vPrincipalRecebido,
      vTotalJuros, vTotalCalculado, vRecebidoExibido, vPrincipalExibido: Double;
    iQtdTRC, iQtdCLI, iGQtdTRC, iGQtdCLI: integer;
  public
    vCdFUN: integer;
    Entidade: TTitulo_receber;
    { Public declarations }
  end;

var
  rpt_InadiplenciaEspecial: Trpt_InadiplenciaEspecial;

implementation

uses UDM, Funcoes, URelData, MxSelInadiplencia;

{$R *.DFM}

procedure Trpt_InadiplenciaEspecial.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Begin
//
end;

procedure Trpt_InadiplenciaEspecial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_InadiplenciaEspecial.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  zrlNomeEmpresa.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_InadiplenciaEspecial.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  vValorPrincipal, vValorCalculado: Double;
  sCliente: string;
  CdTRCAux, CdFUNCNC, CdFUN: integer;
begin
  if vCdFUN > 0 then //Foi colocado filtro de Funcionário
  Begin
{    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 PDV_CODIGO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE FUN_CODIGO='+IntToStr(vCdFUN)+
        ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      Open;
      if isEmpty then
        Exit;
    end;
}
    if Entidade.FieldByName('FUN').asInteger <> vCdFUN then
      Exit;
  end;

  //Somente Cálculos
  with Entidade do
  begin
    if FieldByName('TIPO').asInteger = 0 then
    Begin
      inc(iQtdTRC);
      if ((not Active) or
          (Cliente1.CodigoCNC <> Entidade.ClienteCNC) or
          (Cliente1.CodigoCLI <> Entidade.CodigoCLI)) and
          (Entidade.CodigoCLI > 0) then
      Begin
        inc(iQtdCLI);
        inc(iGQtdCLI);
      end;

      if Situacao = 0 then //Aberto
      Begin
        vTotalAberto  := vTotalAberto + Arredonda(Valor);
        vTotalJuros   := vTotalJuros + (Valor*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-Vencimento)/3000));

        vGTotalAberto := vGTotalAberto + Arredonda(Valor);
        vGTotalJuros  := vGTotalJuros + (Valor*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-Vencimento)/3000));
      end
      else if Situacao = 2 then //Recebido
      Begin
        vTotalRecebido  := vTotalRecebido + Arredonda(ValorPG);
        vGTotalRecebido := vGTotalRecebido + Arredonda(ValorPG);
        if Credcli > 0 then
        Begin
          vTotalCredito  := vTotalCredito + Arredonda(Credcli);
          vGTotalCredito := vGTotalCredito + Arredonda(Credcli);
        end;
      end;
    end;

    //Verificar do valor do título o que corresponde ao valor principal
    if TituloORI = 0 then //Não é parcial
      vValorPrincipal := Valor
    else
    Begin
      CdTRCAux := TituloORI;
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * '+
          ' FROM TITULO_A_RECEBER '+
          ' WHERE CNC_CODIGO='+IntTostr(CodigoCNC)+
          ' AND TRC_CODIGO='+IntToStr(CdTRCAux);
        Open;
        vValorPrincipal := FieldByName('TRC_VALOR').asFloat;
        if FieldByName('TRC_SITUACAO').asInteger <> 5 then
          vValorPrincipal := vValorPrincipal - FieldByName('TRC_VALOR_PAGO').asFloat - FieldByName('TRC_CRED_CLI').asFloat;
        Repeat
          Close;
          SQL.Text := 'SELECT * '+
            ' FROM TITULO_A_RECEBER '+
            ' WHERE CNC_CODIGO='+IntTostr(CodigoCNC)+
            ' AND TRC_TITULOANT='+IntToStr(CdTRCAux);
          Open;
          if FieldByName('TRC_SITUACAO').asInteger <> 5 then
          Begin
            if (vValorPrincipal <= 0) or
               (FieldByName('TRC_CODIGO').asInteger = CodigoTRC) then
              Break
            else
            Begin
              vValorPrincipal := vValorPrincipal - FieldByName('TRC_VALOR_PAGO').asFloat - FieldByName('TRC_CRED_CLI').asFloat;
              CdTRCAux := FieldByName('TRC_CODIGO').asInteger;
            end;
          end
          else
            CdTRCAux := FieldByName('TRC_CODIGO').asInteger;
        until (isEmpty) or
              (vValorPrincipal <= 0);
      end;
    end;

    if vValorPrincipal < 0 then
      vValorPrincipal := 0;

    zrlValorPrincipal.Caption := Format('%.2f',[vValorPrincipal]);

    if Situacao = 0 then
    Begin
      vPrincipalAberto  := vPrincipalAberto + StrToFloat(zrlValorPrincipal.Caption);
      vGPrincipalAberto := vGPrincipalAberto + StrToFloat(zrlValorPrincipal.Caption);
    end;
    if Situacao = 2 then
    Begin
      if Arredonda(StrToFloat(zrlValorPrincipal.Caption)) <= Arredonda(ValorPG+Credcli) then
      Begin
        vPrincipalRecebido  := vPrincipalRecebido     + StrToFloat(zrlValorPrincipal.Caption);
        vGPrincipalRecebido := vGPrincipalRecebido    + StrToFloat(zrlValorPrincipal.Caption);
      end
      else
      Begin
        vPrincipalRecebido  := vPrincipalRecebido     + Arredonda(ValorPG+Credcli);
        vGPrincipalRecebido := vGPrincipalRecebido    + Arredonda(ValorPG+Credcli);
      end;
    end;

    zrlTipo.Caption := '';
    vValorCalculado := 0;
    if (FieldByName('TIPO').asInteger = 3) then //Movimento de extorno
    Begin
      zrlTipo.Caption := 'X';
      vValorCalculado := Arredonda(-1 * ValorPG); //Valor do Movimento incluindo o crédito
    end
    else if (Situacao = 0) then //Em aberto
    Begin
      if Reabertura > 0 then
        zrlTipo.Caption := 'AR' //Não afeta a comissão
      else
        zrlTipo.Caption := 'A'; //Não afeta a comissão
    end
    else if (Situacao = 5) then //Excluído
    Begin
      if (Reabertura > 0) then
      Begin
        if FieldByName('TIPO').asInteger = 1 then  //0 Aberto/Pago; 1 Excluído (Reaberto DtReabrir); 2 Excluído (Reaberto DtPago)
        Begin
          zrlTipo.Caption := 'R'; //Data Reabertura
          vValorCalculado := Arredonda(-1 * ValorPG); //Valor do recebido sem o crédito
        end
        else
        Begin
          zrlTipo.Caption := 'PR'; //Data do Recebimento antes de ser reaberto
          vValorCalculado := Arredonda(ValorPG); //Valor do recebido sem o crédito
        end
      end
      else
        zrlTipo.Caption := 'E'; //Não afeta a comissão
    end
    else if (Situacao = 2) then //Título Recebido
    Begin
      zrlTipo.Caption := 'P';
      vValorCalculado  := vValorCalculado  + Arredonda(ValorPG); //Valor recebido sem credito
    end;


    if vValorCalculado = 0 then
      zrlValorCalculado.Caption := '-'
    else
      zrlValorCalculado.Caption := Format('%.2f',[vValorCalculado]);
  end;

  if (zrlDetalhe.Height = 0) then
    Exit;

  sCliente := '';
  if Entidade.CodigoCLI > 0 then
  Begin
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
      sCliente := '('+IntToStr(Entidade.CodigoCLI)+')'+RazaoSocial;

      if Length(sCliente) > zrlCliente.Width then
        zrlCliente.Caption := Copy(sCliente,1,zrlCliente.Width)
      else
        zrlCliente.Caption := sCliente;
    end;
  end;

  with Entidade do
  begin
    if Credcli > 0 then
      zrlCredito.Caption := Format('%.2f',[Credcli])
    else
      zrlCredito.Caption := '';

    if (DataOriginal > 0) then
      zrlDataOrigem.Caption := DateToStr(DataOriginal)
    else
      zrlDataOrigem.Caption := DateToStr(Vencimento);

    zrlValor.Caption := Format('%.2f',[Valor]);

    if Pagamento > 0 then
      zrlDataPagamento.Caption := DateToStr(Pagamento)
    else
      zrlDataPagamento.Caption := '';

    if ValorPG > 0 then
      zrlValorRecebido.Caption := Format('%.2f',[ValorPG])
    else
      zrlValorRecebido.Caption := '';

    if (TituloORI > 0) or
       (PagamentoParcial) then
      zrlParcial.Caption := 'S'
    else
      zrlParcial.Caption := '';
  end;

  if (zrlDetalhe.Height > 1) or
     (zrlFormaPagamento.Enabled) then
  Begin
    zrlFormaPagamento.Caption := '';
    //Localizar Data do Pedido
    with Pedido_de_Venda1 do
    Begin
      if (not Active) or
         (CodigoCNC <> Entidade.CodigoCNC) or
         (CodigoPDV <> Entidade.CodigoPDV) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
        ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
        Open;
      end;
      zrlFormaPagamento.Caption := DM.SelecionaFormaPagamento(CodigoFPG);
    end;

    zrlDataPedido.Caption := DateToStr(Pedido_de_Venda1.DataEntrega);

    zrlCobrador.Caption := '';
    //Localizar Data de Emissão da Nota LBM
    if (DM.Configuracao1.Empresa = empLuciano) then
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
    end;
  end;

  zrlTipoPag.Caption := Copy(DM.SelecionaParametro(Entidade.TipoPag),1,5);

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

  if DoPrint then
  Begin
    vTotalCalculado  := vTotalCalculado  + vValorCalculado;
    vGTotalCalculado := vGTotalCalculado + vValorCalculado;
    try
      vRecebidoExibido  := vRecebidoExibido  + StrToFloat(zrlValorRecebido.Caption);
      vGRecebidoExibido := vGRecebidoExibido + StrToFloat(zrlValorRecebido.Caption);
    except
    end;
    try
      vPrincipalExibido  := vPrincipalExibido  + StrToFloat(zrlValorPrincipal.Caption);
      vGPrincipalExibido := vGPrincipalExibido + StrToFloat(zrlValorPrincipal.Caption);
    except
    end;
  end;
end;

procedure Trpt_InadiplenciaEspecial.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if vGRecebidoExibido > 0 then
    zrlGRecebidoExibido.Caption := Format('%.2f',[vGRecebidoExibido])
  else
    zrlGRecebidoExibido.Caption := '';
  if vGPrincipalExibido > 0 then
    zrlGPrincipalExibido.Caption := Format('%.2f',[vGPrincipalExibido])
  else
    zrlGPrincipalExibido.Caption := '';

  zrlGTotalAReceber.Caption := Format('%.2f',[vGTotalAberto]);
  zrlGJurosTotal.Caption := Format('%.2f',[vGTotalJuros]);
  zrlGTotalComJuros.Caption := Format('%.2f',[vGTotalAberto + vGTotalJuros]);

  zrlGTotalRecebido.Caption := Format('%.2f',[vGTotalRecebido]);
  zrlGTotalCredito.Caption := Format('%.2f',[vGTotalCredito]);
  zrlGTotalComCredito.Caption := Format('%.2f',[vGTotalRecebido + vGTotalCredito]);

  zrlGTotalQtdTRC.Caption := IntToStr(iGQtdTRC);
  zrlGTotalQtdCLI.Caption := IntToStr(iGQtdCLI);

  zrlGTotalPrincipal.Caption := Format('%.2f',[vGPrincipalAberto]);
  zrlGTotalPrincipalRecebido.Caption := Format('%.2f',[vGPrincipalRecebido]);
  zrlGPrincipalTotal.Caption := Format('%.2f',[vGPrincipalAberto + vGPrincipalRecebido]);

  if StrToFloat(zrlGPrincipalTotal.Caption) <> 0 then
    zrlGInadiplencia.Caption := Format('%.2f',[vGPrincipalAberto/StrToFloat(zrlGPrincipalTotal.Caption)*100])+'%'
  else
    zrlGInadiplencia.Caption := '-';

  zrlGTotalCalculado.Caption := Format('%.2f',[vGTotalCalculado]);
end;

procedure Trpt_InadiplenciaEspecial.zrbGrupoSituacaoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  //
  // Exibicao do Relatorio
  if fMxSelInadiplencia.rdgVisualizar.ItemIndex = 1 then
  begin
    if Entidade.Situacao in [0,8] then  //A Receber
      DoPrint := True  else  DoPrint := False;
  end
  else if fMxSelInadiplencia.rdgVisualizar.ItemIndex = 2 then
  begin
    if Entidade.Situacao in [2,4] then //Recebidos
      DoPrint := True  else  DoPrint := False;
  end;
end;

procedure Trpt_InadiplenciaEspecial.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;

  vRecebidoExibido  := 0;
  vPrincipalExibido := 0;

  iQtdTRC := 0;
  iQtdCLI := 0;

  vTotalAberto := 0;
  vTotalRecebido := 0;
  vTotalCredito := 0;
  vPrincipalAberto := 0;
  vPrincipalRecebido := 0;
  vTotalJuros := 0;

  vTotalCalculado := 0;

  vGRecebidoExibido  := 0;
  vGPrincipalExibido := 0;

  iGQtdTRC := 0;
  iGQtdCLI := 0;

  vGTotalAberto := 0;
  vGTotalRecebido := 0;
  vGTotalCredito := 0;
  vGPrincipalAberto := 0;
  vGPrincipalRecebido := 0;
  vGTotalJuros := 0;

  vGTotalCalculado := 0;

  vCdFUN := 0;
end;

procedure Trpt_InadiplenciaEspecial.zrbGrupoFUNBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbGrupoFUN.Height = 0 then
    Exit;

  if (vCdFUN > 0) and
     (Entidade.FieldByName('FUN').asInteger <> vCdFUN) then
  Begin
    DoPrint := False;
    Exit;
  end;

  zrlVendedor.Caption := 'Vendedor: '+PreencheZero(2,Entidade.FieldByName('FUN').asInteger)+'-'+DM.SelecionaFuncionario(Entidade.FieldByName('FUN').asInteger);

  vRecebidoExibido  := 0;
  vPrincipalExibido := 0;

  iQtdTRC := 0;
  iQtdCLI := 0;

  vTotalAberto := 0;
  vTotalRecebido := 0;
  vTotalCredito := 0;
  vPrincipalAberto := 0;
  vPrincipalRecebido := 0;
  vTotalJuros := 0;

  vTotalCalculado := 0;
end;

procedure Trpt_InadiplenciaEspecial.zrbRodapeVendedorBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  if zrbRodapeVendedor.Height = 0 then
    Exit;

  if (vCdFUN > 0) and
     (Entidade.FieldByName('FUN').asInteger <> vCdFUN) then
  Begin
    DoPrint := False;
    Exit;
  end;

  if vRecebidoExibido > 0 then
    zrlRecebidoExibido.Caption := Format('%.2f',[vRecebidoExibido])
  else
    zrlRecebidoExibido.Caption := '';
  if vPrincipalExibido > 0 then
    zrlPrincipalExibido.Caption := Format('%.2f',[vPrincipalExibido])
  else
    zrlPrincipalExibido.Caption := '';

  zrlTotalAReceber.Caption := Format('%.2f',[vTotalAberto]);
  zrlJurosTotal.Caption := Format('%.2f',[vTotalJuros]);
  zrlTotalComJuros.Caption := Format('%.2f',[vTotalAberto + vTotalJuros]);

  zrlTotalRecebido.Caption := Format('%.2f',[vTotalRecebido]);
  zrlTotalCredito.Caption := Format('%.2f',[vTotalCredito]);
  zrlTotalComCredito.Caption := Format('%.2f',[vTotalRecebido + vTotalCredito]);

  zrlTotalQtdTRC.Caption := IntToStr(iQtdTRC);
  zrlTotalQtdCLI.Caption := IntToStr(iQtdCLI);

  zrlTotalPrincipal.Caption := Format('%.2f',[vPrincipalAberto]);
  zrlTotalPrincipalRecebido.Caption := Format('%.2f',[vPrincipalRecebido]);
  zrlPrincipalTotal.Caption := Format('%.2f',[vPrincipalAberto + vPrincipalRecebido]);

  if StrToFloat(zrlPrincipalTotal.Caption) <> 0 then
    zrlInadiplencia.Caption := Format('%.2f',[vPrincipalAberto/StrToFloat(zrlPrincipalTotal.Caption)*100])+'%'
  else
    zrlInadiplencia.Caption := '-';

  zrlTotalCalculado.Caption := Format('%.2f',[vTotalCalculado]);
end;

procedure Trpt_InadiplenciaEspecial.zrbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.

