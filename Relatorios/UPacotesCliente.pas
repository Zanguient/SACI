unit UPacotesCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Variants, Item_Pedido_Venda,
  SubGrupo, Item_Pacote_Venda, CentroCusto, Titulo_receber, AgenteFin,
  Forma_de_Pagamento, Funcionario, Cliente;

type
  Trpt_PacotesCliente = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrb_detalhePacote: TSZRBand;
    zrlTitulo: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrbParcelas: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    zrbTotalGeral: TSZRBand;
    ZRLabel21: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    zrlSubTotal: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Cliente1: TCliente;
    zrlTracoDuploParcela: TSZRLabel;
    Funcionario1: TFuncionario;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    zrbCabecalhoPedido: TSZRGroup;
    ZRLabel24: TSZRLabel;
    zrlDescSubGrupos: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlRazaoSocial: TSZRLabel;
    zrlData: TSZRLabel;
    zrlApelido: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCidade: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlConjuge: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlPaiMae: TSZRLabel;
    SZRLabel28: TSZRLabel;
    zrlTrabalho: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel32: TSZRLabel;
    zrlCGFRG: TSZRLabel;
    SZRLabel34: TSZRLabel;
    zrlCNPJCPF: TSZRLabel;
    SZRLabel36: TSZRLabel;
    zrlFone: TSZRLabel;
    SZRLabel38: TSZRLabel;
    zrlDataNascimento: TSZRLabel;
    SZRLabel42: TSZRLabel;
    zrlSituacao: TSZRLabel;
    SZRLabel47: TSZRLabel;
    zrlFormaPag: TSZRLabel;
    SZRLabel49: TSZRLabel;
    SZRLabel50: TSZRLabel;
    zrlCodigoAGF: TSZRLabel;
    SZRLabel52: TSZRLabel;
    zrlTipoPag: TSZRLabel;
    szrNota: TSZRLabel;
    zrlNotaFiscal: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel64: TSZRLabel;
    SZRLabel65: TSZRLabel;
    SZRLabel66: TSZRLabel;
    SZRLabel67: TSZRLabel;
    SZRLabel68: TSZRLabel;
    SZRLabel69: TSZRLabel;
    SZRLabel70: TSZRLabel;
    SZRLabel71: TSZRLabel;
    SZRLabel72: TSZRLabel;
    SZRLabel73: TSZRLabel;
    SZRLabel74: TSZRLabel;
    SZRLabel75: TSZRLabel;
    SZRLabel76: TSZRLabel;
    SZRLabel77: TSZRLabel;
    SZRLabel78: TSZRLabel;
    SZRLabel79: TSZRLabel;
    SZRLabel80: TSZRLabel;
    SZRLabel81: TSZRLabel;
    SZRLabel82: TSZRLabel;
    SZRLabel83: TSZRLabel;
    SZRLabel84: TSZRLabel;
    SZRLabel85: TSZRLabel;
    SZRLabel86: TSZRLabel;
    SZRLabel87: TSZRLabel;
    SZRLabel88: TSZRLabel;
    SZRLabel90: TSZRLabel;
    SZRLabel91: TSZRLabel;
    SZRLabel92: TSZRLabel;
    SZRLabel93: TSZRLabel;
    SZRLabel94: TSZRLabel;
    SZRLabel95: TSZRLabel;
    SZRLabel96: TSZRLabel;
    SZRLabel97: TSZRLabel;
    SZRLabel98: TSZRLabel;
    SZRLabel99: TSZRLabel;
    SZRLabel100: TSZRLabel;
    SZRLabel101: TSZRLabel;
    SZRLabel102: TSZRLabel;
    SZRLabel103: TSZRLabel;
    SZRLabel104: TSZRLabel;
    SZRLabel105: TSZRLabel;
    SZRLabel106: TSZRLabel;
    SZRLabel107: TSZRLabel;
    SZRLabel108: TSZRLabel;
    SZRLabel109: TSZRLabel;
    SZRLabel110: TSZRLabel;
    SZRLabel111: TSZRLabel;
    SZRLabel112: TSZRLabel;
    SZRLabel113: TSZRLabel;
    SZRLabel114: TSZRLabel;
    SZRLabel115: TSZRLabel;
    SZRLabel116: TSZRLabel;
    SZRLabel117: TSZRLabel;
    SZRLabel118: TSZRLabel;
    SZRLabel119: TSZRLabel;
    SZRLabel120: TSZRLabel;
    SZRLabel121: TSZRLabel;
    SZRLabel122: TSZRLabel;
    SZRLabel123: TSZRLabel;
    SZRLabel124: TSZRLabel;
    SZRLabel125: TSZRLabel;
    SZRLabel126: TSZRLabel;
    SZRLabel127: TSZRLabel;
    SZRLabel128: TSZRLabel;
    SZRLabel129: TSZRLabel;
    SZRLabel130: TSZRLabel;
    SZRLabel131: TSZRLabel;
    SZRLabel132: TSZRLabel;
    SZRLabel133: TSZRLabel;
    SZRLabel134: TSZRLabel;
    SZRLabel135: TSZRLabel;
    SZRLabel136: TSZRLabel;
    SZRLabel137: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    zrlNotaCupom: TSZRLabel;
    SZRLabel140: TSZRLabel;
    SZRLabel141: TSZRLabel;
    SZRLabel142: TSZRLabel;
    SZRLabel143: TSZRLabel;
    SZRLabel144: TSZRLabel;
    SZRLabel145: TSZRLabel;
    SZRLabel146: TSZRLabel;
    SZRLabel147: TSZRLabel;
    SZRLabel148: TSZRLabel;
    SZRLabel149: TSZRLabel;
    SZRLabel150: TSZRLabel;
    SZRLabel151: TSZRLabel;
    SZRLabel152: TSZRLabel;
    SZRLabel153: TSZRLabel;
    SZRLabel154: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel156: TSZRLabel;
    SZRLabel157: TSZRLabel;
    zrlDescNota: TSZRLabel;
    zrlDescTelefone: TSZRLabel;
    zrlDescContato: TSZRLabel;
    zrlDescSituacao: TSZRLabel;
    SZRLabel162: TSZRLabel;
    SZRLabel163: TSZRLabel;
    SZRLabel56: TSZRLabel;
    zrbCabecalhoFUN1: TSZRGroup;
    zrbTotalVendedor1: TSZRBand;
    zrlTotalPedido: TSZRLabel;
    SZRLabel165: TSZRLabel;
    zrlTotalVendedor: TSZRLabel;
    SZRLabel167: TSZRLabel;
    zrlDtAlteracao: TSZRLabel;
    zrlDescVendedorCabecalho: TSZRLabel;
    zrlVendedorCabecalho: TSZRLabel;
    zrbCabecalhoCNC: TSZRGroup;
    SZRLabel171: TSZRLabel;
    SZRLabel172: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrbTotalCentro: TSZRBand;
    SZRLabel173: TSZRLabel;
    zrlTotalCentro: TSZRLabel;
    zrlCEP: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    zrlCodigoCNC: TSZRDBText;
    SZRLabel44: TSZRLabel;
    zrlTotalRegistro: TSZRLabel;
    SZRLabel45: TSZRLabel;
    zrlUsuario: TSZRLabel;
    Item_Pacote_Venda1: TItem_Pacote_Venda;
    SubGrupo1: TSubGrupo;
    SZRLabel1: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrbSubDetalhe: TSZRBand;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    DSItem_Pacote_Venda1: TDataSource;
    SZRDBText1: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    zrlSubGrupo1: TSZRLabel;
    zrlNumeroItem: TSZRLabel;
    zrlValorUnitario: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlEntregues: TSZRLabel;
    zrlSaldo: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrb_detalhePacoteBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbParcelasBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPedidoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalVendedor1AfterPrint(Sender: TObject; Printed: Boolean);
    procedure zrbCabecalhoFUN1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalVendedor1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure LimpaCampos;
    procedure FormCreate(Sender: TObject);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalGeralBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbTotalCentroBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    TotalRegistrosGrupo, TotalRegistros, TotalItens, NumeroItem : integer;
    vSubTotal, vTotalVendedor, vTotalCentro, vTotal: Double;
  public
    Entidade: TItem_Pacote_Venda;
  end;

var
  rpt_PacotesCliente: Trpt_PacotesCliente;

implementation
Uses
  UDM, Funcoes, MxSelPacote;
{$R *.DFM}

procedure Trpt_PacotesCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SubGrupo1.Close;
  Cliente1.Close;
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_PacotesCliente.zrb_detalhePacoteBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNumeroItem.Caption:=preencheZero(3,NumeroItem);
  inc(NumeroItem);

  //Contar total de itens
  inc(TotalItens);

  with SubGrupo1 do
  Begin
    if Entidade.CodigoSGP1 <> CodigoSGP then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Entidade.CodigoSGP1;
      Open;
    end;
    zrlSubGrupo1.Caption := Descricao;

    if Entidade.CodigoSGP2 > 0 then
    Begin
      if Entidade.CodigoSGP2 <> CodigoSGP then
      Begin
        Close;
        ParamByName('SGP_CODIGO').asInteger := Entidade.CodigoSGP2;
        Open;
      end;
      zrlSubGrupo1.Caption := zrlSubGrupo1.Caption + ' / ' + Descricao;
    end;

    if Entidade.CodigoSGP3 > 0 then
    Begin
      if Entidade.CodigoSGP3 <> CodigoSGP then
      Begin
        Close;
        ParamByName('SGP_CODIGO').asInteger := Entidade.CodigoSGP3;
        Open;
      end;
      zrlSubGrupo1.Caption := zrlSubGrupo1.Caption + ' / ' + Descricao;
    end;

    if Entidade.CodigoSGP4 > 0 then
    Begin
      if Entidade.CodigoSGP4 <> CodigoSGP then
      Begin
        Close;
        ParamByName('SGP_CODIGO').asInteger := Entidade.CodigoSGP4;
        Open;
      end;
      zrlSubGrupo1.Caption := zrlSubGrupo1.Caption + ' / ' + Descricao;
    end;
  end;
  zrlEntregues.Caption := IntToStr(Trunc(Entidade.QuantidadeEntregue));
  zrlQuantidade.Caption := IntToStr(Trunc(Entidade.Quantidade));
  zrlSaldo.Caption := IntToStr(Trunc(Entidade.Quantidade-Entidade.QuantidadeEntregue));
  zrlValorUnitario.Caption := format('%.2f',[Entidade.PrecoDesc]);
  zrlTotalItem.Caption := format('%.2f',[Entidade.Quantidade*Entidade.PrecoDesc]);
  vSubTotal := vSubTotal + Arredonda(Entidade.Quantidade*Entidade.PrecoDesc);
  vTotal := vTotal + Arredonda(Entidade.Quantidade*Entidade.PrecoDesc);
  vTotalCentro := vTotalCentro + Arredonda(Entidade.Quantidade*Entidade.PrecoDesc);
  vTotalVendedor := vTotalVendedor + Arredonda(Entidade.Quantidade*Entidade.PrecoDesc);
end;

procedure Trpt_PacotesCliente.zrbParcelasBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  i:integer;
begin
  zrlSubTotal.Caption := format('%.2f',[vSubTotal]);

  if tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSelPacote.ckbCodigoPDV.Checked then
    Begin
      if report.CurrentY <= 42 then
        report.CurrentY := 42
      else
        report.NewPage;
      zrlTracoDuploParcela.Enabled := False;
      zrbTotalVendedor1.Height := 0;
      zrbTotalCentro.Height := 0;
      zrbTotalGeral.Height  := 0;
    end;
  end
  else if (tag in [1,2,3,4]) then //LBM
  Begin
    if (self.tag <> 4) then //Imprimir a partir do Pedido de Venda
    Begin
      if report.CurrentY <= 42 then
        report.CurrentY := 42
      else
      Begin
        report.NewPage;
        report.CurrentY := 42;
      end;
    end;
    zrlTracoDuploParcela.Enabled := False;
    zrbTotalVendedor1.Height := 0;
    zrbTotalCentro.Height := 0;
    zrbTotalGeral.Height  := 0;
  end;
  SZRLabel67.Caption:=AgenteFin1.Descricao;
  if tag = 0 then
    if not fMxSelPacote.ckbExibirParcelas.Checked then
      Exit;

  Titulo_receber1.Close;
  Titulo_receber1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
  Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=Entidade.CodigoPDV;
  Titulo_receber1.Open;
  Titulo_receber1.First;
  LimpaCampos;
  for i:=1 to Titulo_receber1.RecordCount do
  Begin
    if i = 1 then
    Begin
      SZRLabel143.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel102.Caption:=Titulo_receber1.Sequencia;
      SZRLabel103.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel104.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 2 then
    Begin
      SZRLabel144.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel105.Caption:=Titulo_receber1.Sequencia;
      SZRLabel106.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel107.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 3 then
    Begin
      SZRLabel145.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel108.Caption:=Titulo_receber1.Sequencia;
      SZRLabel109.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel110.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 4 then
    Begin
      SZRLabel146.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel111.Caption:=Titulo_receber1.Sequencia;
      SZRLabel112.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel113.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 5 then
    Begin
      SZRLabel147.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel114.Caption:=Titulo_receber1.Sequencia;
      SZRLabel115.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel116.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 6 then
    Begin
      SZRLabel148.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel117.Caption:=Titulo_receber1.Sequencia;
      SZRLabel118.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel119.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 7 then
    Begin
      SZRLabel149.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel120.Caption:=Titulo_receber1.Sequencia;
      SZRLabel121.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel122.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 8 then
    Begin
      SZRLabel150.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel123.Caption:=Titulo_receber1.Sequencia;
      SZRLabel124.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel125.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 9 then
    Begin
      SZRLabel151.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel126.Caption:=Titulo_receber1.Sequencia;
      SZRLabel127.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel128.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 10 then
    Begin
      SZRLabel152.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel129.Caption:=Titulo_receber1.Sequencia;
      SZRLabel130.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel131.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 11 then
    Begin
      SZRLabel153.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel132.Caption:=Titulo_receber1.Sequencia;
      SZRLabel133.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel134.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 12 then
    Begin
      SZRLabel154.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel135.Caption:=Titulo_receber1.Sequencia;
      SZRLabel136.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel137.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end;
    Titulo_receber1.Next;
  end;
end;

procedure Trpt_PacotesCliente.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_PacotesCliente.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSelPacote.rdgDataCadastro.Checked then
      SZRLabel31.Caption := 'Data'
    else if fMxSelPacote.rdgDataAlterado.Checked then
      SZRLabel31.Caption := 'Dt.Alt'
    else if fMxSelPacote.rdgDataEmissao.Checked then
      SZRLabel31.Caption := 'Dt.Emi'
    else
      SZRLabel31.Caption := 'Dt.Dev'
  end
  else
    SZRLabel31.Caption := 'Data';
end;

procedure Trpt_PacotesCliente.zrbCabecalhoPedidoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vSubTotal := 0;
  NumeroItem := 1;
  inc(TotalRegistros);
  inc(TotalRegistrosGrupo);  
  if Entidade.FieldByName('PCT_DT_ALTERADO').AsDateTime > 0 then
    zrlDtAlteracao.Caption := formatDateTime('dd/mm/yyyy',Entidade.FieldByName('PCT_DT_ALTERADO').AsDateTime)
  else
    zrlDtAlteracao.Caption := '';

  SZRLabel56.Caption := IntToStr(Entidade.FieldByName('FUN_CODIGO').AsInteger);

  zrlTotalPedido.Caption := format('%.2f',[Entidade.FieldByname('PCT_TOTAL').asFloat+Entidade.FieldByname('PCT_ACRESCIMO').asFloat]);

  with Cliente1 do
  Begin
    if (Entidade.FieldByname('CLI_CODIGO').asInteger <> CodigoCLI) or
       (Entidade.FieldByname('CNC_CLIENTE').asInteger <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByname('CNC_CLIENTE').asInteger;
      ParamByName('CLI_CODIGO').asInteger := Entidade.FieldByname('CLI_CODIGO').asInteger;
      Open;
    end;
    zrlRazaoSocial.Caption:=RazaoSocial+' ('+IntToStr(CodigoCLI)+')';
    zrlApelido.Caption:=NomeFantasia;
    zrlFone.Caption:=Fone;
    zrlCGFRG.Caption:=CGFRG;
    zrlCNPJCPF.Caption:=CPFCGC;
    if DataNascimento > 0 then
      zrlDataNascimento.Caption:=formatDateTime('dd/mm/yyyy',DataNascimento)
    else
      zrlDataNascimento.Caption:='';

    zrlEndereco.Caption := Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);
    zrlBairro.Caption:=Bairro;
    zrlCidade.Caption:=Trim(Cidade)+'/'+Trim(Uf);
    zrlCEP.Caption := CEP;
    if (self.tag = 0) then
    Begin
      if fMxSelPacote.ckbSintetico.Checked and PessoaFisica then
        zrlPaiMae.Caption:=AbreviarNome(RazaoSocial)
      else
      Begin
        if Trim(Pai) <> '' then
          if Trim(Mae) <> '' then
            zrlPaiMae.Caption:=Trim(Pai)+'/'+Trim(Mae)
          else
            zrlPaiMae.Caption:=Trim(Pai)
        else
          zrlPaiMae.Caption:=Trim(Mae);
      end;
    end
    else
    Begin
      if Trim(Pai) <> '' then
        if Trim(Mae) <> '' then
          zrlPaiMae.Caption:=Trim(Pai)+'/'+Trim(Mae)
        else
          zrlPaiMae.Caption:=Trim(Pai)
      else
        zrlPaiMae.Caption:=Trim(Mae);
    end;
    if PessoaFisica then
      zrlTrabalho.Caption := LocalTrabalho
    else
      zrlTrabalho.Caption := ''
  end;

  if tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSelPacote.rdgDataCadastro.Checked then
      if Entidade.FieldByname('PCT_DT_CADASTRO').asDateTime > 0 then
        zrlData.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByname('PCT_DT_CADASTRO').asDateTime)
      else
        zrlData.Caption := ''
    else if fMxSelPacote.rdgDataAlterado.Checked then
      if Entidade.FieldByname('PCT_DT_ALTERADO').asDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByname('PCT_DT_ALTERADO').asDateTime)
      else
        zrlData.Caption := ''
    else if fMxSelPacote.rdgDataEmissao.Checked then
      if Entidade.FieldByname('PCT_DT_EMISSAO_VENDA').asDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByname('PCT_DT_EMISSAO_VENDA').asDateTime)
      else
        zrlData.Caption := ''
    else
      if Entidade.FieldByname('PCT_DT_DEVOLUCAO').asDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByname('PCT_DT_DEVOLUCAO').asDateTime)
      else
        zrlData.Caption := ''
  end
  else if Entidade.FieldByname('PCT_DT_CADASTRO').asDateTime > 0 then
    zrlData.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByname('PCT_DT_CADASTRO').asDateTime)
  else
    zrlData.Caption := '';

  case Entidade.FieldByName('PCT_SITUACAO').AsInteger of
     0,1,2,3: zrlSituacao.Caption:='Em Aberto';
     4: zrlSituacao.Caption:='Finalizada';
     6: zrlSituacao.Caption:='Cancelada';
     8: zrlSituacao.Caption:='Devolvida';
    else
      zrlSituacao.Caption := 'XX';
  end;

  with Forma_de_Pagamento1 do
  Begin
    if Entidade.FieldByName('FPG_CODIGO').AsInteger <> CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger := Entidade.FieldByName('FPG_CODIGO').AsInteger;
      Open;
    end;
    zrlFormaPag.Caption := Descricao;
  end;

  with AgenteFin1 do
  Begin
    if Entidade.FieldByName('AGF_CODIGO').AsInteger <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger := Entidade.FieldByName('AGF_CODIGO').AsInteger;
      Open;
    end;
    zrlCodigoAGF.Caption := Descricao;
  end;

  zrlTipoPag.Caption := DM.SelecionaParametro(Entidade.FieldByName('PCT_TIPO_PAG').AsInteger);

  if (Entidade.FieldByname('PCT_NOTA_FISCAL').asInteger = 0) Then
  Begin
    zrlNotaCupom.Enabled:=False;
    szrNota.Enabled:=False;
    zrlNotaFiscal.Enabled:=False;
  end
  else
  Begin
    zrlNotaCupom.Enabled:=True;
    if zrlRazaoSocial.Top <> 0 then
      szrNota.Enabled:=True;
    zrlNotaFiscal.Enabled:=True;
    if Entidade.FieldByname('PCT_NOTA_FISCAL').asInteger = -1 then
      zrlNotaFiscal.Caption:='SN'
    else
      zrlNotaFiscal.Caption := IntToStr(Entidade.FieldByname('PCT_NOTA_FISCAL').asInteger);
  end;

  SZRLabel24.Enabled := False;
  zrlConjuge.Enabled := False;
  if Cliente1.PessoaFisica then
    SZRLabel26.Caption := 'Pai/Mae:'
  else
    SZRLabel26.Caption := 'Contato:';
  if tag = 0 then
  Begin
    if not fMxSelPacote.ckbSintetico.Checked then //Não Sintético
    Begin
      SZRLabel26.Left    := 0;
      zrlPaiMae.Left    := 10;
    end;
  end
  else
  Begin
    SZRLabel26.Left    := 0;
    zrlPaiMae.Left    := 10;
  end;

  if (Entidade.FieldByname('PCT_NOTA_FISCAL').asInteger > 0) then
  Begin
    case Entidade.FieldByname('PCT_NOTA_CUPOM').asInteger of
      1: zrlNotaCupom.Caption:='N';
      2: zrlNotaCupom.Caption:='C';
      else
        zrlNotaCupom.Caption:='';
    end;
  end
  else
    zrlNotaCupom.Caption:='';

end;

procedure Trpt_PacotesCliente.zrbTotalVendedor1AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  if tag = 0 then
    if (fMxSelPacote.ckbSintetico.Checked) and
       (fMxSelPacote.ckbVendedorPorPagina.Checked) then
      report.NewPage;
end;

procedure Trpt_PacotesCliente.zrbCabecalhoFUN1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vTotalVendedor := 0;
  TotalRegistrosGrupo := 0;
  if (tag = 0) then
    if (fMxSelPacote.ckbVendedorPorPagina.Checked) then
      report.CurrentY := 7;
  with Funcionario1 do
  Begin
    if (Entidade.FieldByname('FUN_CODIGO').asInteger <> CodigoFUN) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger:=Entidade.FieldByname('FUN_CODIGO').asInteger;
      Open;
    end;
    if Trim(Fone) <> '' then
      zrlVendedorCabecalho.Caption:=Apelido+' - Fone: '+Fone
    else
      zrlVendedorCabecalho.Caption:=Apelido;
  end;
end;

procedure Trpt_PacotesCliente.zrbTotalVendedor1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbCabecalhoFUN1.Height = 0 then
    zrbTotalVendedor1.Height := 0;

  zrlTotalVendedor.Caption := format('%.2f',[vTotalVendedor]);
  zrlTotalRegistro.Caption := IntToStr(TotalRegistrosGrupo);
end;

procedure Trpt_PacotesCliente.zrbCabecalhoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vTotalCentro := 0;
  if zrbCabecalhoCNC.Height > 0 then
  Begin
    CentroCusto1.Close;
    CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
    CentroCusto1.Open;
    SZRLabel172.Caption:=CentroCusto1.RazaoSocial;
  end;
end;

procedure Trpt_PacotesCliente.LimpaCampos;
begin
  SZRLabel143.Caption:='';
  SZRLabel102.Caption:='';
  SZRLabel103.Caption:='';
  SZRLabel104.Caption:='';
  SZRLabel144.Caption:='';
  SZRLabel105.Caption:='';
  SZRLabel106.Caption:='';
  SZRLabel107.Caption:='';
  SZRLabel145.Caption:='';
  SZRLabel108.Caption:='';
  SZRLabel109.Caption:='';
  SZRLabel110.Caption:='';
  SZRLabel146.Caption:='';
  SZRLabel111.Caption:='';
  SZRLabel112.Caption:='';
  SZRLabel113.Caption:='';
  SZRLabel147.Caption:='';
  SZRLabel114.Caption:='';
  SZRLabel115.Caption:='';
  SZRLabel116.Caption:='';
  SZRLabel148.Caption:='';
  SZRLabel117.Caption:='';
  SZRLabel118.Caption:='';
  SZRLabel119.Caption:='';
  SZRLabel149.Caption:='';
  SZRLabel120.Caption:='';
  SZRLabel121.Caption:='';
  SZRLabel122.Caption:='';
  SZRLabel150.Caption:='';
  SZRLabel123.Caption:='';
  SZRLabel124.Caption:='';
  SZRLabel125.Caption:='';
  SZRLabel151.Caption:='';
  SZRLabel126.Caption:='';
  SZRLabel127.Caption:='';
  SZRLabel128.Caption:='';
  SZRLabel152.Caption:='';
  SZRLabel129.Caption:='';
  SZRLabel130.Caption:='';
  SZRLabel131.Caption:='';
  SZRLabel153.Caption:='';
  SZRLabel132.Caption:='';
  SZRLabel133.Caption:='';
  SZRLabel134.Caption:='';
  SZRLabel154.Caption:='';
  SZRLabel135.Caption:='';
  SZRLabel136.Caption:='';
  SZRLabel137.Caption:='';
end;

procedure Trpt_PacotesCliente.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pacote_Venda1;
  TotalRegistros := 0;
  TotalItens := 0;
  vSubTotal := 0;
  vTotalVendedor := 0;
  vTotalCentro := 0;
  vTotal := 0;
end;

procedure Trpt_PacotesCliente.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption := EmpresaDesenvolvedora;  
end;

procedure Trpt_PacotesCliente.zrbTotalGeralBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  
  zrlTotalGeral.Caption := format('%.2f',[vTotal]);
end;

procedure Trpt_PacotesCliente.zrbTotalCentroBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalCentro.Caption := format('%.2f',[vTotalCentro]);
end;

end.
