unit URelData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes,
  DBCtrls, DB, DBTables, SQuery, CentroCusto, AgenteFin, Parametro;

type
  Trpt_Data = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    ckbSintetico: TCheckBox;
    ckbSaltarPagina: TCheckBox;
    ckbMeiaFolha: TCheckBox;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    ckbCodigoCNC: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCLI: TCheckBox;
    ckbDiasAtrazo: TCheckBox;
    ComboOrdem: TComboBox;
    edtCodigoCLI: TEdit;
    edtDiasAtrazo: TEdit;
    Label5: TLabel;
    ckbLiquidado: TCheckBox;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    ckbCodigoAGF: TCheckBox;
    dblCodigoAGF: TDBLookupComboBox;
    cmbAgenteFinanceiro: TComboBox;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    ckbTipoPagamento: TCheckBox;
    dblTipoPagamento: TDBLookupComboBox;
    cmbTipoPag: TComboBox;
    ckbSomenteComTelefone: TCheckBox;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    CheckBox3: TCheckBox;
    dblTipo: TDBLookupComboBox;
    Parametro5: TParametro;
    DSParametro5: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbDiasAtrazoClick(Sender: TObject);
    procedure ckbCodigoAGFClick(Sender: TObject);
    procedure ckbTipoPagamentoClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Data: Trpt_Data;
  CNC:string;

implementation

uses UDM, UTitAtrazo, UVendasDesconto, UFaturamentoLBM,
  USaldoVendas, UServicosEfetuados, UServicoEProduto, CdCliente;

{$R *.DFM}


procedure Trpt_Data.BitBtn1Click(Sender: TObject);
var
  sFiltros, sDataINI, sDataFIM, CdCNC, sTipoPag, CdAGF, Ordem, CdCLI, CdPDV, Sit,
    sLiquida, sDataINIT2, sDataFIMT2, sSomenteComFone,CLI_TIPO, CLI_TIPO_C: string;
begin
  CLI_TIPO := '';
  CLI_TIPO_C := '';
  sDataINI := '';
  sDataFIM := '';
  sDataINIT2 := '';
  sDataFIMT2 := '';
  sFiltros := '';
  CdCLI := '';
  CdCNC := '';
  Sit := '';
  sLiquida := '';
  sTipoPag := '';
  CdAGF := '';
  CdPDV := '';
  sSomenteComFone := '';


  //TIPO
  if CheckBox3.Checked then
  begin
    CLI_TIPO := ' AND T2.CLI_TIPO = ''' +inttostr(dblTipo.Keyvalue) +''' ';
    CLI_TIPO_C := ' AND C.CLI_TIPO = ''' +inttostr(dblTipo.Keyvalue) +''' ';
  end
  else
  begin
    CLI_TIPO := '';
    CLI_TIPO_C := '';
  end;
  //

  if not VerificaData(mskDataINI.Text) then
    raise exception.Create('Data inicial inválida!');
  if not VerificaData(mskDataFIM.Text) then
    raise exception.Create('Data final inválida!');

  if VerificaDataBranco(mskDataINI.Text) then
    sFiltros := sFiltros + '(DtINI:'+mskDataINI.Text+')';
  if VerificaDataBranco(mskDataFIM.Text) then
    sFiltros := sFiltros + '(DtFIM:'+mskDataFIM.Text+')';

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      CdCNC:=' AND T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+'-'+dblCodigoCNC.Text+')';
    end;

  if ckbTipoPagamento.Checked then
  Begin
    if dblTipoPagamento.Text = '' then
    Begin
      dblTipoPagamento.SetFocus;
      raise Exception.Create('Tipo de Pagamento inválido!');
    end;
    if cmbTipoPag.ItemIndex = 0 then
    Begin
      if self.Tag <> 16 then //Titulos em Atrazo - Cobrança
        sTipoPag := ' AND T1.PDV_TIPO_PAG='+IntToStr(dblTipoPagamento.KeyValue)+' '
      else
        sTipoPag := ' AND T1.TRC_TIPO_PAG='+IntToStr(dblTipoPagamento.KeyValue)+' ';
      sFiltros := sFiltros + '(TipoPag:='+dblTipoPagamento.Text+')';
    end
    else
    Begin
      if self.Tag <> 16 then //Titulos em Atrazo - Cobrança
        sTipoPag := ' AND T1.PDV_TIPO_PAG<>'+IntToStr(dblTipoPagamento.KeyValue)+' '
      else
        sTipoPag := ' AND T1.TRC_TIPO_PAG<>'+IntToStr(dblTipoPagamento.KeyValue)+' ';
      sFiltros := sFiltros + '(TipoPag:<>'+dblTipoPagamento.Text+')';
    end;
  end;

  if ckbCodigoAGF.Checked then
  Begin
    if dblCodigoAGF.Text = '' then
    Begin
      dblCodigoAGF.SetFocus;
      raise Exception.Create('Agente Financeiro inválido!');
    end
    else
    Begin
      if cmbAgenteFinanceiro.ItemIndex = 0 then
      Begin
        CdAGF := ' AND T1.AGF_CODIGO='+IntToStr(dblCodigoAGF.KeyValue)+' ';
        sFiltros := sFiltros + '(AGF:='+dblCodigoAGF.Text+')';
      end
      else
      Begin
        CdAGF := ' AND T1.AGF_CODIGO<>'+IntToStr(dblCodigoAGF.KeyValue)+' ';
        sFiltros := sFiltros + '(AGF:<>'+dblCodigoAGF.Text+')';
      end;
    end;
  end;

  if ckbSomenteComTelefone.Checked then
  Begin
    if self.Tag = 16 then
      sSomenteComFone := ' AND LEN(T2.CLI_FONE)>1 '
    else
      sSomenteComFone := ' AND LEN(C.CLI_FONE)>1 ';
    sFiltros := sFiltros + ' (ComFone)';
  end;

  if ckbCodigoCLI.Checked then
    if edtCodigoCLI.Text = '' then
      raise Exception.Create('Codigo do Cliente inválido!')
    else
    Begin
      CdCLI := ' AND T1.CLI_CODIGO='+edtCodigoCLI.Text+' ';
      sFiltros := sFiltros + ' (CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbDiasAtrazo.Checked then
    if not VerificaInteiroBranco(edtDiasAtrazo.Text) then
      raise Exception.Create('Valor de Dias de Atrazo inválido!')
    else
    Begin
      mskDataFIM.Text := DateToStr(DM.Configuracao1.Data-StrToInt(edtDiasAtrazo.Text));
      sFiltros := sFiltros + ' (Dias de Atrazo:'+edtDiasAtrazo.Text+')';
    end;

  if ckbCodigoPDV.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
      raise Exception.Create('Código do Pedido inválido!');
    CdPDV := ' AND T1.PDV_CODIGO='+edtCodigoPDV.Text;
    sFiltros := sFiltros + ' (PDV:'+edtCodigoPDV.Text+')';
  end;

  if Tag=16 then  //Titulos em Atrazo - Cobrança
  Begin
    Application.CreateForm(Trpt_TitAtrazo, rpt_TitAtrazo);
    with rpt_TitAtrazo do
    Begin
      if ckbSaltarPagina.Checked then
      Begin
        zrbGrupoCLI.ForceNewPage := True;
      end;

      if ckbMeiaFolha.Checked then
        report.Height := 32;

      if ComboOrdem.ItemIndex = 0 then
        Ordem:= ' ORDER BY T1.CNC_CODIGO, T1.CLI_CODIGO,T1.PDV_CODIGO,T1.TRC_VENCIMENTO '
      else if ComboOrdem.ItemIndex = 1 then
        Ordem:= ' ORDER BY T1.CNC_CODIGO, T2.CLI_RZ_SOCIAL,T1.PDV_CODIGO,T1.TRC_VENCIMENTO '
      else if ComboOrdem.ItemIndex = 2 then
        Ordem:= ' ORDER BY T2.CLI_BAIRRO,T2.CLI_ENDERECO,T1.CNC_CLIENTE,T1.CLI_CODIGO,T1.PDV_CODIGO,T1.TRC_VENCIMENTO ';

      if not ckbLiquidado.Checked then
      begin
        if VerificaDataBranco(mskDataINI.Text) then
          sDataINI := ' AND (T1.TRC_VENCIMENTO>="'+MesDia(self.mskDataINI.text)+'") ';
        if VerificaDataBranco(mskDataFIM.Text) then
          sDataFIM := ' AND (T1.TRC_VENCIMENTO<"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'") '
        else
          sDataFIM := ' AND (T1.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemJuros+1)+'") ';
      end
      else
      begin
        if VerificaDataBranco(mskDataINI.Text) then
          sDataINIT2 := ' AND (T2.TRC_VENCIMENTO>="'+MesDia(self.mskDataINI.text)+'") ';
        if VerificaDataBranco(mskDataFIM.Text) then
          sDataFIMT2 := ' AND (T2.TRC_VENCIMENTO<"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'") '
        else
          sDataFIMT2 := ' AND (T2.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemJuros+1)+'") ';
        Sit := ',2';
        if not ckbCodigoCLI.Checked then
          sLiquida := ' AND T1.CLI_CODIGO IN (SELECT T2.CLI_CODIGO FROM TITULO_A_RECEBER T2 WHERE (T2.TRC_SITUACAO IN (0,1,8)) '+sDataINIT2+sDataFIMT2+' )'
        else
          sLiquida := '';
      end;

      Entidade.Close;
      Entidade.SQL.Text := 'SELECT T1.*,T2.* '+
        ' FROM TITULO_A_RECEBER T1, CLIENTE T2 '+
        ' WHERE (T1.TRC_SITUACAO IN (0,1,8'+Sit+')) '+
        sDataINI+sDataFIM+CdCNC+CdCLI+sLiquida+sTipoPag+CdAGF+CdPDV+sSomenteComFone+CLI_TIPO+
        ' AND T1.CLI_CODIGO=T2.CLI_CODIGO '+
        ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
        Ordem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.Preview;
      Close;
    end;
  end
  else if Tag=17 then  // Servicos Efetuados - Servicos
  begin
    Application.CreateForm(Trpt_ServicosEfetuados, rpt_ServicosEfetuados);
    with rpt_ServicosEfetuados do
    Begin
      //Quantidade Total de Recebidos
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.SQL.Text := 'SELECT COUNT(PDV_CODIGO) AS QTD_ENTRA FROM PEDIDO_DE_VENDA '+
                                   ' WHERE PDV_SERVICO=1 AND PDV_DATA_HORA >="'+MesDia(self.mskDataINI.text)+'" '+
                                   ' AND PDV_DATA_HORA <"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'" ';
      Pedido_de_Venda1.Open;
      zrlQtdEnt.Caption := IntToStr(Pedido_de_Venda1.FieldByName('QTD_ENTRA').asInteger);

      //Quantidade Total de Soldas Recebidas - CODIGO DO PRODUTO SOLDA=18767
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.SQL.Text := 'SELECT COUNT(DISTINCT (PDV.PDV_CODIGO)) AS QTD_ENTRA_SOLDA FROM PEDIDO_DE_VENDA PDV'+
                                   ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA IPV'+
                                   ' ON IPV.PDV_CODIGO=PDV.PDV_CODIGO'+
                                   ' WHERE PDV_SERVICO=1 AND PDV_DATA_HORA >="'+MesDia(self.mskDataINI.text)+'" '+
                                   ' AND PDV_DATA_HORA <"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'" '+
                                   ' AND (PRD_CODIGO = 18767)';
      Pedido_de_Venda1.Open;
      zrlQtdEntS.Caption := IntToStr(Pedido_de_Venda1.FieldByName('QTD_ENTRA_SOLDA').asInteger);

      //Quantidade Total de Entregues
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.SQL.Text := 'SELECT COUNT(PDV_CODIGO) AS QTD_SAI FROM PEDIDO_DE_VENDA '+
                                   ' WHERE PDV_SERVICO=1 AND PDV_DT_ENTREGA >="'+MesDia(self.mskDataINI.text)+'" '+
                                   ' AND PDV_DT_ENTREGA <"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'" ';
      Pedido_de_Venda1.Open;
      zrlQtdSai.Caption := IntToStr(Pedido_de_Venda1.FieldByName('QTD_SAI').asInteger);

      //Quantidade Total de Soldas Entregues - CODIGO DO PRODUTO SOLDA=18767
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.SQL.Text := 'SELECT COUNT(DISTINCT (PDV.PDV_CODIGO)) AS QTD_SAI_SOLDA FROM PEDIDO_DE_VENDA PDV'+
                                   ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA IPV'+
                                   ' ON IPV.PDV_CODIGO=PDV.PDV_CODIGO'+
                                   ' WHERE PDV_SERVICO=1 AND PDV_DT_ENTREGA >="'+MesDia(self.mskDataINI.text)+'" '+
                                   ' AND PDV_DT_ENTREGA <"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'" '+
                                   ' AND (PRD_CODIGO = 18767)';
      Pedido_de_Venda1.Open;
      zrlQtdSaiS.Caption := IntToStr(Pedido_de_Venda1.FieldByName('QTD_SAI_SOLDA').asInteger);

      zrlQtdEntSS.Caption := Format('%.0f',[strtofloat(zrlQtdEnt.Caption) - strtofloat(zrlQtdEntS.Caption)]);
      zrlQtdSaiSS.Caption := Format('%.0f',[strtofloat(zrlQtdSai.Caption) - strtofloat(zrlQtdSaiS.Caption)]);

      //
      if ckbSaltarPagina.Checked then
      Begin
        ZRGroup1.ForceNewPage := True;
      end;

      //Não Apagar que não tem linha Filtro
      zrlDataINI.Caption := mskDataINI.Text;
      zrlDataFIM.Caption := mskDataFIM.Text;

      if VerificaDataBranco(mskDataINI.Text) then
        sDataINI := ' AND (T1.PDV_DT_ENTREGA>="'+MesDia(self.mskDataINI.text)+'") ';
      if VerificaDataBranco(mskDataFIM.Text) then
        sDataFIM := ' AND (T1.PDV_DT_ENTREGA<"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'") ';

      Entidade.Close;
      Entidade.SQL.Text := 'SELECT T1.CNC_CODIGO, T1.CLI_CODIGO, C.CLI_RZ_SOCIAL, R.PRD_NIVEL, I.PRD_CODIGO,R.PRD_DESCRICAO, R.PRD_PRECO_VENDA, SUM(I.IPV_QUANTIDADE) QTD, '+
        ' SUM(I.IPV_QUANTIDADE* R.PRD_PRECO_VENDA) AS VALOR '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA I, PEDIDO_DE_VENDA T1, PRODUTO R, CLIENTE C  '+
        ' WHERE T1.PDV_CODIGO=I.PDV_CODIGO '+
        ' AND T1.CNC_CODIGO=I.CNC_CODIGO '+
        ' AND I.PRD_CODIGO=R.PRD_CODIGO '+
        ' AND T1.CLI_CODIGO=C.CLI_CODIGO '+
        ' AND T1.CNC_CODIGO=C.CNC_CODIGO '+
        ' AND R.GRP_CODIGO=23 '+
        ' AND T1.PDV_SERVICO=1 '+
        sDataINI+sDataFIM+CdCNC+CdCLI+sTipoPag+CdAGF+CdPDV+sSomenteComFone+CLI_TIPO_C+
        ' AND T1.PDV_SITUACAO>=0 '+
        ' GROUP BY T1.CNC_CODIGO, T1.CLI_CODIGO, C.CLI_RZ_SOCIAL, R.PRD_NIVEL, I.PRD_CODIGO, R.PRD_DESCRICAO, R.PRD_PRECO_VENDA '+
        ' ORDER BY T1.CNC_CODIGO, T1.CLI_CODIGO ';
      Entidade.Open;

      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.Preview;
      Close;
    end;
  end
  else if Tag=18 then  //Servicos e Produtos - Servicos
  begin
    Application.CreateForm(Trpt_ServicoEProduto, rpt_ServicoEProduto);
    with rpt_ServicoEProduto do
    Begin
      //
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.SQL.Text := 'SELECT COUNT(PDV_CODIGO) AS QTD_ENTRA FROM PEDIDO_DE_VENDA '+
                                   ' WHERE PDV_SERVICO=1 AND PDV_DATA_HORA >="'+MesDia(self.mskDataINI.text)+'" '+
                                   ' AND PDV_DATA_HORA <"'+MesDia(self.mskDataFIM.text)+'" ';
      Pedido_de_Venda1.Open;
      zrlQtdEnt.Caption := IntToStr(Pedido_de_Venda1.FieldByName('QTD_ENTRA').asInteger);
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.SQL.Text := 'SELECT COUNT(PDV_CODIGO) AS QTD_SAI FROM PEDIDO_DE_VENDA '+
                                   ' WHERE PDV_SERVICO=1 AND PDV_DT_ENTREGA >="'+MesDia(self.mskDataINI.text)+'" '+
                                   ' AND PDV_DT_ENTREGA <"'+MesDia(self.mskDataFIM.text)+'" ';
      Pedido_de_Venda1.Open;
      zrlQtdSai.Caption := IntToStr(Pedido_de_Venda1.FieldByName('QTD_SAI').asInteger);
      //
      if ckbSaltarPagina.Checked then
      Begin
        ZRGroup1.ForceNewPage := True;
      end;

      //Não Apagar que não tem linha Filtro
      zrlDataINI.Caption := mskDataINI.Text;
      zrlDataFIM.Caption := mskDataFIM.Text;

      if VerificaDataBranco(mskDataINI.Text) then
        sDataINI := ' AND (T1.PDV_DT_ENTREGA>="'+MesDia(self.mskDataINI.text)+'") ';
      if VerificaDataBranco(mskDataFIM.Text) then
        sDataFIM := ' AND (T1.PDV_DT_ENTREGA<"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'") ';

      Entidade.Close;
      Entidade.SQL.Text := 'SELECT T1.CNC_CODIGO, T1.CLI_CODIGO, C.CLI_RZ_SOCIAL, R.PRD_NIVEL, R.GRP_CODIGO, G.GRP_DESCRICAO, I.PRD_CODIGO,R.PRD_DESCRICAO, I.IPV_PRECO_DESC, SUM(I.IPV_QUANTIDADE) QTD, '+
        ' SUM((I.IPV_QUANTIDADE-IPV_BONIFICACAO)* I.IPV_PRECO_DESC) AS VALOR '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA I, PEDIDO_DE_VENDA T1, PRODUTO R, CLIENTE C, GRUPO G '+
        ' WHERE T1.PDV_SERVICO=1 '+
        ' AND T1.PDV_SITUACAO>=0 '+
        sDataINI+sDataFIM+CdCNC+CdCLI+sTipoPag+CdAGF+CdPDV+sSomenteComFone+CLI_TIPO_C+
        ' AND T1.PDV_CODIGO=I.PDV_CODIGO '+
        ' AND T1.CNC_CODIGO=I.CNC_CODIGO '+
        ' AND I.PRD_CODIGO=R.PRD_CODIGO '+
        ' AND G.GRP_CODIGO=R.GRP_CODIGO '+
        ' AND T1.CLI_CODIGO=C.CLI_CODIGO '+
        ' AND T1.CNC_CODIGO=C.CNC_CODIGO '+
        ' GROUP BY T1.CNC_CODIGO, T1.CLI_CODIGO, C.CLI_RZ_SOCIAL, R.PRD_NIVEL, R.GRP_CODIGO, G.GRP_DESCRICAO, I.PRD_CODIGO, R.PRD_DESCRICAO, I.IPV_PRECO_DESC '+
        ' ORDER BY T1.CNC_CODIGO, T1.CLI_CODIGO, R.GRP_CODIGO DESC, R.PRD_NIVEL ';
      Entidade.Open;

      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.Preview;
      Close;
    end;
  end
  else If Tag=23 then //Faturamento p/ Vendedor
  begin
    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      Application.CreateForm(Trpt_VendasDesconto,rpt_VendasDesconto);
      with rpt_VendasDesconto do
      Begin
        if ckbSintetico.Checked then
          zrbDetalhe.Height := 0
        else
        Begin
          zrbGrupoCNC.ForceNewPage := False;
          zrbGrupoFUN.ForceNewPage := True;
        end;

        zrlFiltros.Caption := sFiltros;

        if VerificaDataBranco(mskDataINI.Text) then
          sDataINI := ' AND T1.PDV_DATA_HORA>="'+MesDia(self.mskDataINI.text)+'" ';
        if VerificaDataBranco(mskDataFIM.Text) then
          sDataFIM := ' AND T1.PDV_DATA_HORA<"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'" ';

        with Item_Pedido_Venda1 do
        Begin
          Close;
          SQL.Text := 'SELECT T2.*, T1.PDV_NOTA_FISCAL '+
            ' FROM Item_de_pedido_de_venda T2, Pedido_de_Venda T1 '+
            ' WHERE T1.PDV_SITUACAO=4 '+
            CdCNC+sDataINI+sDataFIM+CdCLI+sTipoPag+CdAGF+CdPDV+
            ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
            ' AND T1.PDV_CODIGO=T2.PDV_CODIGO '+
            ' ORDER BY T2.CNC_CODIGO,T2.FUN_CODIGO ASC ';
          Open;
          if IsEmpty then
          Begin
            ShowMessage('Consulta Vazia!');
            Exit;
          end;
        end;
        if (report.Height > DM.Configuracao1.MaxLinhasImp) and
           (DM.Configuracao1.MaxLinhasImp <> 65) then
          report.Height := DM.Configuracao1.MaxLinhasImp;
        report.Preview;
        rpt_VendasDesconto.Close;
      end;
    end
    else //LBM
    Begin
      Application.CreateForm(Trpt_FaturamentoLBM,rpt_FaturamentoLBM);
      with rpt_FaturamentoLBM do
      Begin
        zrlFiltros.Caption := sFiltros;
        DataINI := StrToDate(mskDataINI.Text);
        DataFIM := StrToDate(mskDataFIM.Text);
        Funcionario1.Open;
        if (report.Height > DM.Configuracao1.MaxLinhasImp) and
           (DM.Configuracao1.MaxLinhasImp <> 65) then
          report.Height := DM.Configuracao1.MaxLinhasImp;
        report.Preview;
        Close;
      end;
    end;
  end
  else If Tag=24 then
  begin
    Application.CreateForm(Trpt_SaldoVendas,rpt_SaldoVendas);
    with rpt_SaldoVendas do
    Begin
      zrlFiltros.Caption := sFiltros;
      DataINI := StrToDate(mskDataINI.Text);
      DataFIM := StrToDate(mskDataFIM.Text);
      Produto1.Open;
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.Preview;
      Close;
    end;
  end;
end;

procedure Trpt_Data.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure Trpt_Data.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  CentroCusto1.Open;

  if self.Tag in [23,24] then
    ckbSomenteComTelefone.Enabled := False;

  if self.Tag <> 16 then
  Begin
    ckbDiasAtrazo.Enabled := False;
    ckbLiquidado.Enabled := False;
  end;

  if DM.Configuracao1.Empresa = empEletro then
    ComboOrdem.ItemIndex := 2
  else
  begin
    ckbCodigoCNC.Checked := True;
    ckbCodigoCNCClick(Sender);
    ComboOrdem.ItemIndex := 1;
    mskDataINI.Text := '01/01/2004';
    mskDataFIM.Text := DateToStr(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran);
  end;
  ckbSintetico.Checked := True;
  
  mskDataINI.SetFocus;
end;

procedure Trpt_Data.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
  end;
end;

procedure Trpt_Data.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=43;
    fCadCli.CentroCusto2.open;
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure Trpt_Data.ckbCodigoCLIClick(Sender: TObject);
begin
  if ckbCodigoCLI.Checked then
  Begin
    edtCodigoCLI.Color:=clWindow;
    edtCodigoCLI.Enabled:=True;
    edtCodigoCLI.SetFocus;
  end
  else
  Begin
    edtCodigoCLI.Color:=AlteraCorComponentes;
    edtCodigoCLI.Text:='';
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure Trpt_Data.ckbDiasAtrazoClick(Sender: TObject);
begin
  if ckbDiasAtrazo.Checked then
  Begin
    edtDiasAtrazo.Color:=clWindow;
    edtDiasAtrazo.Enabled:=True;
    edtDiasAtrazo.SetFocus;
  end
  else
  Begin
    edtDiasAtrazo.Color:=AlteraCorComponentes;
    edtDiasAtrazo.Text:='';
    edtDiasAtrazo.Enabled:=False;
  end;
end;

procedure Trpt_Data.ckbCodigoAGFClick(Sender: TObject);
begin
  if ckbCodigoAGF.Checked then
  Begin
    AgenteFin1.Open;
    cmbAgenteFinanceiro.Enabled := True;
    cmbAgenteFinanceiro.Color := clWindow;
    cmbAgenteFinanceiro.ItemIndex := 0;
    dblCodigoAGF.Color:=clWindow;
    dblCodigoAGF.Enabled:=True;
    dblCodigoAGF.KeyValue:=AgenteFin1.CodigoAGF;
    dblCodigoAGF.SetFocus;
  end
  else
  Begin
    AgenteFin1.Close;
    cmbAgenteFinanceiro.Enabled := False;
    cmbAgenteFinanceiro.Color := AlteraCorComponentes;
    cmbAgenteFinanceiro.ItemIndex := -1;
    dblCodigoAGF.Color:=AlteraCorComponentes;
    dblCodigoAGF.KeyValue:=-1;
    dblCodigoAGF.Enabled:=False;
  end;
end;

procedure Trpt_Data.ckbTipoPagamentoClick(Sender: TObject);
begin
  if ckbTipoPagamento.Checked then
  Begin
    Parametro1.Open;
    cmbTipoPag.Enabled := True;
    cmbTipoPag.Color := clWindow;
    cmbTipoPag.ItemIndex := 0;
    dblTipoPagamento.Color:=clWindow;
    dblTipoPagamento.Enabled:=True;
    dblTipoPagamento.KeyValue:=Parametro1.CodigoPAR;
    dblTipoPagamento.SetFocus;
  end
  else
  Begin
    Parametro1.Close;
    cmbTipoPag.Enabled := False;
    cmbTipoPag.Color := AlteraCorComponentes;
    cmbTipoPag.ItemIndex := -1;
    dblTipoPagamento.Color:=AlteraCorComponentes;
    dblTipoPagamento.KeyValue:=-1;
    dblTipoPagamento.Enabled:=False;
  end;
end;

procedure Trpt_Data.ckbCodigoPDVClick(Sender: TObject);
begin
  if ckbCodigoPDV.Checked then
  Begin
    edtCodigoPDV.Color:=clWindow;
    edtCodigoPDV.Enabled:=True;
    edtCodigoPDV.SetFocus;
  end
  else
  Begin
    edtCodigoPDV.Color:=AlteraCorComponentes;
    edtCodigoPDV.Clear;
    edtCodigoPDV.Enabled:=False;
  end;
end;

procedure Trpt_Data.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  Begin
    Parametro5.Open;
    dblTipo.Color:=clWindow;
    dblTipo.Enabled:=True;
    try
      dblTipo.SetFocus;
    except
    end;
  end
  else
  Begin
    Parametro5.Close;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.Enabled:=False;
    dblTipo.KeyValue:=-1;
  end;
end;

procedure Trpt_Data.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
