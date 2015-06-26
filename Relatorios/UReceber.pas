unit UReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, AgenteFin, Parametro, CentroCusto, Pedido_de_Venda,
  Pacote_de_venda;

type
  Trpt_Receber = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    zrlTitulo: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrdVencimento: TSZRDBText;
    zrdCodigoTRC: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    zrdSequencia: TSZRDBText;
    zreValor: TSZRExpression;
    zrbSumario: TSZRBand;
    ZRLabel12: TSZRLabel;
    zrlTotal: TSZRLabel;
    zrlValorComJuros: TSZRLabel;
    zrlTotalJuros: TSZRLabel;
    AgenteFin1: TAgenteFin;
    zrlAgenteFin: TSZRLabel;
    zrbGrupoCodigoCNC: TSZRGroup;
    ZRLabel6: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    ZRLabel5: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlTotalValorCNC: TSZRLabel;
    zrlTotalComJurosCNC: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrbGrupo: TSZRGroup;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrbRodapeDia: TSZRBand;
    SZRLabel22: TSZRLabel;
    zrlSubTotalDia: TSZRLabel;
    zrlSubTotalDiaJuros: TSZRLabel;
    zrlLinhaRodapeDia: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlDescVencimento: TSZRLabel;
    zrlDescCodigo: TSZRLabel;
    zrlDescSeq: TSZRLabel;
    zrlDescCliente: TSZRLabel;
    zrlDescAgente: TSZRLabel;
    zrlDescNumero: TSZRLabel;
    zrlDescOrigem: TSZRLabel;
    zrlDescValor: TSZRLabel;
    zrlDescComJuros: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlDescTotPedido: TSZRLabel;
    zrlTotalPedido: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    zrlDescVendedor: TSZRLabel;
    zrlCodigoFUN: TSZRLabel;
    zrdNumero: TSZRDBText;
    SZRLabel5: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupoCaixa: TSZRGroup;
    SZRLabel8: TSZRLabel;
    zrlGrupoCaixa: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel9: TSZRLabel;
    Pacote_de_venda1: TPacote_de_venda;
    zrbRodapeGrupoGrupoConta: TSZRBand;
    SZRLabel4: TSZRLabel;
    zrlSubTotalGrupo: TSZRLabel;
    zrlSubTotalGrupoJuros: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlDataOrigem: TSZRLabel;
    zrlContato: TSZRLabel;
    zrlContaAgendada: TSZRLabel;
    zrlObservacao: TSZRLabel;
    zrlSequenc: TSZRLabel;
    Titulo_receber2: TTitulo_receber;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCodigoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeDiaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCaixaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoGrupoContaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    CdCLICNC, CdCLI, TotalRegistros : integer;
    SomaTotalGrupoPago, SomaTotalGrupo, SomaJurosGrupo: Double;
    vNaoExibirNome: Boolean;
  public
    Entidade: TTitulo_receber;
    SomaTotalMes,SomaJurosMes,SubTotal,SubTotalJuros,Total,TotalJuros:Double;
    vNaoExibirNomePublico: Boolean;
  end;

var
  rpt_Receber: Trpt_Receber;

implementation
Uses
  UDM, Funcoes, MxSelTitulos;

{$R *.DFM}


procedure Trpt_Receber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_Receber.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Receber.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sCidade: string;
  iGrupoEspecial: integer;
begin
  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;

  Inc(TotalRegistros);
  zrlCodigoFUN.Caption := '';
  zrlTotalPedido.Caption := '';

  if (not vNaoExibirNome) then
  Begin
    sCidade := '';
    if DM.Configuracao1.EMpresa = empMotical then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC);
        Open;
        sCidade := FieldByName('CNC_CIDADE').asString;
      end;
      zrlCliente.Caption := PreencheZero(7,Entidade.CodigoCLI)+'-'+
                            PreencheEspaco(35,Entidade.FieldByName('CLI_RZ_SOCIAL').asString)+
                            ' ('+sCidade+')';
    end
    else
      zrlCliente.Caption := Entidade.FieldByName('CLI_RZ_SOCIAL').asString+
                            '('+IntToStr(Entidade.CodigoCLI)+')'+sCidade;
  end
  else
    zrlCliente.Caption := '';

  if vNaoExibirNomePublico then
    vNaoExibirNome := True;

  If (Entidade.Vencimento+DM.Configuracao1.QuantDiasSemJuros<DM.Configuracao1.Data) or
     ((Entidade.Vencimento<DM.Configuracao1.Data) and
     (DM.Configuracao1.Empresa = empLBM)) then
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

    if (DM.Configuracao1.Empresa = empLBM) and //LBM
       (DM.Conta_de_Caixa1.Grupo = 452) then //CONDOMINIO/ALUGUEIS SALAS
    Begin
      //1% ao mês + 10% multa
      zrlValorComJuros.Caption:=Format('%.2f', [Arredonda(Entidade.Valor)+Arredonda(Entidade.Valor)*(1*(DM.Configuracao1.Data-Entidade.Vencimento)/3000)+
                               (Arredonda(Entidade.Valor)*0.1)]);
      SubTotalJuros:=SubTotalJuros+(Arredonda(Entidade.Valor)*(1*(DM.Configuracao1.Data-Entidade.Vencimento)/3000)+
                     (Arredonda(Entidade.Valor)*0.1));
      TotalJuros  := TotalJuros+Arredonda(Entidade.Valor)+
                     (Arredonda(Entidade.Valor)*(1*(DM.Configuracao1.Data-Entidade.Vencimento)/3000)+
        (Entidade.Valor*0.1));
      SomaJurosMes:= SomaJurosMes+Arredonda(Entidade.Valor)+
                     (Arredonda(Entidade.Valor)*(1*(DM.Configuracao1.Data-Entidade.Vencimento)/3000)+
                     (Arredonda(Entidade.Valor)*0.1));
      SomaJurosGrupo := SomaJurosGrupo+Arredonda(Entidade.Valor)+
                     (Arredonda(Entidade.Valor)*(1*(DM.Configuracao1.Data-Entidade.Vencimento)/3000)+
                     (Arredonda(Entidade.Valor)*0.1));
    end
    else
    Begin
      zrlValorComJuros.Caption:=format('%.2f',[Arredonda(Entidade.Valor)+
                       (Arredonda(Entidade.Valor)*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-Entidade.Vencimento)/3000))]);
      SubTotalJuros := SubTotalJuros+Arredonda(Entidade.Valor)+
                       (Arredonda(Entidade.Valor)*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-Entidade.Vencimento)/3000));
      TotalJuros    := TotalJuros   +Arredonda(Entidade.Valor)+
                       (Arredonda(Entidade.Valor)*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-Entidade.Vencimento)/3000));
      SomaJurosMes  := SomaJurosMes +Arredonda(Entidade.Valor)+
                       (Arredonda(Entidade.Valor)*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-Entidade.Vencimento)/3000));
      SomaJurosGrupo := SomaJurosGrupo+Arredonda(Entidade.Valor)+
                       (Arredonda(Entidade.Valor)*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-Entidade.Vencimento)/3000));
    end;
  end
  Else
  Begin
    zrlValorComJuros.Caption:=format('%.2f',[Entidade.Valor]);
    SubTotalJuros  := SubTotalJuros  + Arredonda(Entidade.Valor);
    TotalJuros     := TotalJuros     + Arredonda(Entidade.Valor);
    SomaJurosMes   := SomaJurosMes   + Arredonda(Entidade.Valor);
    SomaJurosGrupo := SomaJurosGrupo + Arredonda(Entidade.Valor);
  end;

  zrlDataOrigem.Caption := '';
  iGrupoEspecial := 0;
  if DM.Configuracao1.Empresa <> empEletro then
  Begin
    if Entidade.CodigoPDV > 0 then
    Begin
      with Pedido_de_Venda1 do
      Begin
        Close;
        if Entidade.TipoPedido = 1 then //Pacote de Venda
          SQL.Text := 'SELECT SUM(ROUND(IPC_PRECO_DESCONTO,2)*IPC_QUANTIDADE) AS TOTAL '+
            ',MAX(P1.FUN_CODIGO) AS VENDEDOR '+
            ',MAX(P1.PCT_DT_EMISSAO_VENDA) AS EMISSAO '+
            ',MAX(P1.PCT_GRUPO_ESPECIAL) AS GRUPO_ESPECIAL '+
            ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
            ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
            ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '
        else if Entidade.TipoPedido = 2 then //Pacote de Crédito
          SQL.Text := 'SELECT SUM(ROUND(P1.PCR_VALOR,2)) AS TOTAL '+
            ',MAX(P1.FUN_CODIGO) AS VENDEDOR '+
            ',0 AS EMISSAO '+
            ',0 AS GRUPO_ESPECIAL '+
            ' FROM PACOTE_DE_CREDITO P1 '+
            ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.PCR_CODIGO='+IntToStr(Entidade.CodigoPDV)
        else if Entidade.CodigoFPE > 0 then
          SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC*(IPV_QUANTIDADE-IPV_BONIFICACAO),2)) AS TOTAL '+
            ',MAX(I1.FUN_CODIGO) AS VENDEDOR '+
            ',MAX(P1.PDV_DT_EMISSAO_VENDA) AS EMISSAO '+
            ',MAX(P1.PDV_GRUPO_ESPECIAL) AS GRUPO_ESPECIAL '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.FPE_CODIGO='+IntToStr(Entidade.CodigoFPE)+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '
        else
          SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC*(IPV_QUANTIDADE-IPV_BONIFICACAO),2)) AS TOTAL '+
            ',MAX(I1.FUN_CODIGO) AS VENDEDOR '+
            ',MAX(P1.PDV_DT_EMISSAO_VENDA) AS EMISSAO '+
            ',MAX(P1.PDV_GRUPO_ESPECIAL) AS GRUPO_ESPECIAL '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
        Open;
        zrlCodigoFUN.Caption   := FieldByName('VENDEDOR').asString;
        zrlTotalPedido.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);
        iGrupoEspecial := FieldByName('GRUPO_ESPECIAL').asInteger;
        if (DM.Configuracao1.Empresa = empMotical) then
        Begin
          if (FieldByName('EMISSAO').asString <> '0') then
            if FieldByName('EMISSAO').asDateTime > 0 then
              zrlDataOrigem.Caption := DateToStr(FieldByName('EMISSAO').asDateTime);
        end;
      end;
    end
    else
      zrlTotalPedido.Caption := '-';
  end
  else
    zrlTotalPedido.Caption := '-';

  if (zrlDescOrigem.Caption = 'Pedido') then
    zrlDataOrigem.Caption := IntToStr(Entidade.CodigoPDV)
  else if (zrlDataOrigem.Caption = '') and
          (Entidade.DataOriginal > 0) then
    zrlDataOrigem.Caption := DateToStr(Entidade.DataOriginal)
  else if (zrlDataOrigem.Caption = '') and
          (Entidade.DataCadastro > 0) then
    zrlDataOrigem.Caption := DateToStr(Entidade.DataCadastro);

  zrlAgenteFin.Caption := '';
  if Entidade.Situacao = 2 then
    zrlAgenteFin.Caption := 'PG';
  if DM.Configuracao1.Empresa <> empMotical then
  Begin
    if DM.Configuracao1.Empresa <> empEletro then
    Begin
      if Entidade.CodigoAGF > 0 then
      Begin
        with AgenteFin1 do
        Begin
          if (not Active) or
             (Entidade.CodigoAGF <> CodigoAGF) then
          Begin
            Close;
            ParamByName('AGF_CODIGO').asInteger := Entidade.CodigoAGF;
            Open;
          end;
          if Length(Descricao) <= zrlAgenteFin.Width then
            zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + Descricao
          else
            zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + Copy(Descricao, 1, zrlAgenteFin.Width);
        end;
      end;
    end
    else if Entidade.CodigoAGF > 0 then
      zrlAgenteFin.Caption := Trim(zrlAgenteFin.Caption + ' ' + IntToStr(Entidade.CodigoAGF));
  end
  else
  Begin
    if Entidade.DataEmissaoBoleto > 0 then
      zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + 'BB'+IntToStr(iGrupoEspecial)
    else if Entidade.DataVerificado > 0 then
      zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + '00 '
    else
      zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' ' + PreencheZero(2,Entidade.CodigoCNC)+' ';
    if (Entidade.Situacao = 2) and //Pago
       (Entidade.CodigoCHQ > 0) then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM CHEQUE '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.ChequeCNC)+
          ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ);
        Open;
        zrlAgenteFin.Caption := zrlAgenteFin.Caption + ' CH' + FieldByName('CHQ_NUMERO').asString;
      end;
    end;
  end;


  //Conta de Caixa
  if zrlContaAgendada.Enabled then
  Begin
    with DM.Conta_de_Caixa1 do
    Begin
      //Conta Agendada
      if Entidade.CodigoCCX <> CodigoCCX then
      Begin
        Close;
        ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
        Open;
      end;
      if Length(Descricao) <= zrlContaAgendada.Width then
        zrlContaAgendada.Caption := Descricao
      else
        zrlContaAgendada.Caption := Copy(Descricao,1,zrlContaAgendada.Width);
    end;
  end;

  zrlObservacao.Caption := '';
  if Trim(Entidade.CV) <> '' then
    zrlObservacao.Caption := 'CV:'+Trim(Entidade.CV);
  if Trim(Entidade.Local) <> '' then
    zrlObservacao.Caption := Trim(zrlObservacao.Caption + ' (' + Entidade.Local+')');
  zrlObservacao.Caption := Trim(zrlObservacao.Caption + ' ' + Entidade.OBS);
  //
  zrlSequenc.Caption := '';
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    Titulo_receber2.Close;
    if Entidade.FieldByName('PDV_CODIGO').AsInteger > 0 then
    begin
      Titulo_receber2.ParamByName('PDV_CODIGO').asInteger :=  Entidade.FieldByName('PDV_CODIGO').AsInteger;
      Titulo_receber2.ParamByName('CNC_CODIGO').asInteger :=  Entidade.FieldByName('CNC_CODIGO').AsInteger;
      Titulo_receber2.Open;
      if not Titulo_receber2.IsEmpty then
        zrlSequenc.Caption := '/'+PreencheZero(2,Titulo_Receber2.RecordCount);
    end;
  end
  else
  begin
    zrlSequenc.Enabled := False;
    zrdSequencia.Width := 6;
  end;
  //
  SubTotal       := SubTotal       + Arredonda(Entidade.Valor);
  SomaTotalMes   := SomaTotalMes   + Arredonda(Entidade.Valor);
  SomaTotalGrupo := SomaTotalGrupo + Arredonda(Entidade.Valor);
  Total          := Total          + Arredonda(Entidade.Valor);
  if Entidade.Situacao = 2 then
    SomaTotalGrupoPago := SomaTotalGrupoPago + Arredonda(Entidade.Valor);
end;

procedure Trpt_Receber.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotal.Caption:=Format('%.2f',[Total]);
  zrlTotalJuros.Caption:=Format('%.2f',[TotalJuros]);
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_Receber.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Receber.zrbGrupoCodigoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SubTotal:=0;
  SubTotalJuros:=0;
  
  if zrbGrupoCodigoCNC.Height = 0 then
    exit;

  with CentroCusto1 do
  Begin
    if CodigoCNC <> Entidade.CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
    end;
    SZRLabel12.Caption := RazaoSocial;
  end;
end;

procedure Trpt_Receber.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalValorCNC.Caption:=Format('%.2f',[SubTotal]);
  zrlTotalComJurosCNC.Caption:=Format('%.2f',[SubTotalJuros]);
end;

procedure Trpt_Receber.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if UpperCase(zrbGrupo.Expression) = 'MES+ANO' then
    SZRLabel20.Caption := '* '+PreencheZero(2,Entidade.FieldByName('Mes').AsString)+'/'+
      Entidade.FieldByName('Ano').AsString
  else if UpperCase(zrbGrupo.Expression) = 'DIA+MES+ANO' then
    SZRLabel20.Caption := '* '+PreencheZero(2,Entidade.FieldByName('Dia').AsString)+'/'+
      PreencheZero(2,Entidade.FieldByName('Mes').AsString)+'/'+
      Entidade.FieldByName('Ano').AsString;
  SomaTotalMes := 0;
  SomaJurosMes  := 0;
end;

procedure Trpt_Receber.zrbRodapeDiaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSubTotalDia.Caption:=Format('%.2f',[SomaTotalMes]);
  zrlSubTotalDiaJuros.Caption:=Format('%.2f',[SomaJurosMes]);
end;

procedure Trpt_Receber.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  TotalRegistros := 0;
  Total:=0;
  TotalJuros:=0;
  zrbDetalhe.Width := 0; //Será definido o tamanho 3 quando o Rel. for agrupado por cliente
end;

procedure Trpt_Receber.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Receber.zrbGrupoCaixaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vNaoExibirNome := False;
  SomaTotalGrupo := 0;
  SomaTotalGrupoPago := 0;
  SomaJurosGrupo := 0;

  if zrbGrupoCaixa.Height <= 0 then
    Exit;

  if Entidade.fieldbyname('CCX_GRUPO').AsInteger = 0 then
    zrlGrupoCaixa.Caption := 'SEM GRUPO'
  else
    zrlGrupoCaixa.Caption := DM.SelecionaParametro(Entidade.fieldbyname('CCX_GRUPO').AsInteger);
end;

procedure Trpt_Receber.zrbRodapeGrupoGrupoContaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sContato: string;
begin
  zrlSubTotalGrupo.Caption:=Format('%.2f',[SomaTotalGrupo]);
  zrlSubTotalGrupoJuros.Caption:=Format('%.2f',[SomaJurosGrupo]);
  if (SomaTotalGrupoPago > 0) and
     (zrlSubTotalGrupo.Left = 126) then
  Begin
    zrlSubTotalGrupoJuros.Left := 116;
    zrlSubTotalGrupoJuros.Enabled := True;
    zrlSubTotalGrupoJuros.Caption := '('+Format('%.2f',[SomaTotalGrupo-SomaTotalGrupoPago])+')';
  end
  else if (zrlSubTotalGrupo.Left = 126) then
    zrlSubTotalGrupoJuros.Enabled := False;

  if zrlCliente.Left = 0 then //Agrupar por Cliente
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CLIENTE '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
        ' AND CLI_CODIGO='+IntToStr(CdCLI);
      Open;
      zrlContato.Caption := 'FONE:'+FieldByName('CLI_FONE').asString+' | ';
      sContato := FieldByName('CLI_PAI').asString;
      if (FieldByName('CLI_MAE').asString <> '') and
         (sContato <> '') then
        sContato := sContato + '/';
      sContato := sContato + FieldByName('CLI_MAE').asString;

      Close;
      SQL.Text := 'SELECT * FROM CONTATO '+
        ' WHERE CNT_TIPO=1 '+
        ' AND CNC_FOR='+IntToStr(CdCLICNC)+
        ' AND FOR_CODIGO='+IntToStr(CdCLI)+
        ' ORDER BY CNT_CODIGO ';
      Open;
      if not IsEmpty then
        sContato := FieldByName('CNT_NOME').asString+
                    ' ('+FieldByName('CNT_TELEFONE').asString+')';
      zrlContato.Caption := zrlContato.Caption + sContato;
    end;
  end;
end;

end.
