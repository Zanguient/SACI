unit MxSelPacote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  Variants, AgenteFin, Forma_de_Pagamento, Parametro, SQuery, Vendedor,
  SubGrupo, Grupo;

type
  TfMxSelPacote = class(TForm)
    Panel2: TPanel;
    bitConfirma: TBitBtn;
    bitCancelar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Panel3: TPanel;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    DSGrupo: TDataSource;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    GroupBox1: TGroupBox;
    dblCodigoGRP: TDBLookupComboBox;
    ckbCodigoSGP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoGRP: TCheckBox;
    GroupBox2: TGroupBox;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    Label3: TLabel;
    ckbSituacao: TCheckBox;
    ckbTipoPagamento: TCheckBox;
    ckbCodigoFPG: TCheckBox;
    dblTipoPagamento: TDBLookupComboBox;
    dblCodigoFPG: TDBLookupComboBox;
    ckbCodigoAGF: TCheckBox;
    dblCodigoAGF: TDBLookupComboBox;
    cmbSituacao: TComboBox;
    ckbNumeroNota: TCheckBox;
    edtNumeroNota: TEdit;
    ckbVendasPorFaturar: TCheckBox;
    ckbValorTotal: TCheckBox;
    cmbValorTotal: TComboBox;
    edtValorTotal: TEdit;
    ckbVendasFaturadas: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    GroupBox3: TGroupBox;
    ckbSintetico: TCheckBox;
    ckbExibirParcelas: TCheckBox;
    ckbVendedorPorPagina: TCheckBox;
    cmbAgenteFinanceiro: TComboBox;
    rdgDataCadastro: TRadioButton;
    rdgDataAlterado: TRadioButton;
    rdgDataEmissao: TRadioButton;
    rdgDataDevolucao: TRadioButton;
    ckbSaltarLinha: TCheckBox;
    cmbCodigoFPG: TComboBox;
    ckbSuperSintetico: TCheckBox;
    dblCodigoVEN: TDBLookupComboBox;
    ckbCodigoVEN: TCheckBox;
    Vendedor2: TVendedor;
    DSVendedor2: TDataSource;
    ckbSN: TCheckBox;
    ckbExibirRemessas: TCheckBox;
    ckbNaoExibirItens: TCheckBox;
    ckbAgruparVendedor: TCheckBox;
    Bevel1: TBevel;
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbCodigoVENClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitConfirmaClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbTipoPagamentoClick(Sender: TObject);
    procedure ckbCodigoFPGClick(Sender: TObject);
    procedure ckbCodigoAGFClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure ckbNumeroNotaClick(Sender: TObject);
    procedure ckbValorTotalClick(Sender: TObject);
    procedure ckbVendasPorFaturarClick(Sender: TObject);
    procedure ckbVendasFaturadasClick(Sender: TObject);
    procedure ckbSinteticoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbSNClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure SubGrupo1BeforeOpen(DataSet: TDataSet);
    procedure ckbExibirRemessasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelPacote: TfMxSelPacote;

implementation

uses UDM, funcoes, CdCliente, UPacotesCliente, UPacoteRemessa;

{$R *.DFM}

procedure TfMxSelPacote.ckbCodigoCLIClick(Sender: TObject);
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

procedure TfMxSelPacote.ckbCodigoVENClick(Sender: TObject);
begin
  if ckbCodigoVEN.Checked then
  Begin
    Vendedor1.Open;
    dblCodigoVEN.Color:=clWindow;
    dblCodigoVEN.Enabled:=True;
    dblCodigoVEN.KeyValue:=Vendedor1.CodigoFUN;
    dblCodigoVEN.SetFocus;
  end
  else
  Begin
    Vendedor1.Close;
    dblCodigoVEN.Color:=AlteraCorComponentes;
    dblCodigoVEN.KeyValue:=-1;
    dblCodigoVEN.Enabled:=False;
  end;
end;

procedure TfMxSelPacote.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  ckbCodigoCNC.Checked := True;
  ckbSintetico.Checked := True;
  ckbNaoExibirItens.Checked := True;

  mskDataINI.SetFocus;
end;

procedure TfMxSelPacote.bitConfirmaClick(Sender: TObject);
var
  mensagem,CNC,CdFOR,CLI,FUN,PDV,SIT,TPG,FPG,AGF,NTF,Valor,
    Group, DataINI, DataFIM, Ordem,
    sFiltros:string;
begin
  sFiltros   :='';
  CNC        :='';
  CdFOR      :='';
  CLI        :='';
  FUN        :='';
  PDV        :='';
  SIT        :='';
  TPG        :='';
  FPG        :='';
  AGF        :='';
  NTF        :='';
  Valor      :='';
  Group      :='';
  Ordem      :=' P1.CNC_CODIGO,C1.CLI_RZ_SOCIAL,P1.PDV_CODIGO ASC';
  mensagem   :='';
  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;

  if not VerificaDataBranco(mskDataINI.Text)then
    DataINI := ''
  else if rdgDataAlterado.Checked then
    DataINI := ' AND (P1.PCT_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") '
  else if rdgDataCadastro.Checked then
    DataINI := ' AND (P1.PCT_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") '
  else if rdgDataEmissao.Checked then
    DataINI := ' AND (P1.PCT_DT_EMISSAO_VENDA>="'+MesDia(mskDataINI.Text)+'") '
  else
    DataINI := ' AND (P1.PCT_DT_DEVOLUCAO>="'+MesDia(mskDataINI.Text)+'") ';


  if not VerificaDataBranco(mskDataFIM.Text)then
    DataFIM := ''
  else if rdgDataAlterado.Checked then
    DataFIM := ' AND (P1.PCT_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else if rdgDataCadastro.Checked then
    DataFIM := ' AND (P1.PCT_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else if rdgDataEmissao.Checked then
    DataFIM := ' AND (P1.PCT_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else
    DataFIM := ' AND (P1.PCT_DT_DEVOLUCAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

  if mensagem<>'' then
    raise exception.Create(mensagem);

  if rdgDataCadastro.Checked then
    sFiltros := sFiltros + '(Cad)'
  else if rdgDataAlterado.Checked then
    sFiltros := sFiltros + '(Cad)'
  else if rdgDataEmissao.Checked then
    sFiltros := sFiltros + '(Emi)'
  else
    sFiltros := sFiltros + '(Dev)';

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Código do Cliente inválido!');
    end
    else
      CLI:=' AND (P1.CLI_CODIGO='+edtCodigoCLI.Text+') ';

  if ckbCodigoGRP.Checked then //Com Grupo e Sem Fornecedor
  Begin
    if ckbCodigoSGP.Checked then //Com SubGrupo
    Begin
      if not (dblCodigoSGP.KeyValue > 0) then
        Raise Exception.Create('SubGrupo inválido!')
      else
        CdFOR:=' AND (I1.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+
          ' AND (I1.SGP_CODIGO_1='+IntToStr(dblCodigoSGP.KeyValue)+
          ' OR I1.SGP_CODIGO_2='+IntToStr(dblCodigoSGP.KeyValue)+
          ' OR I1.SGP_CODIGO_3='+IntToStr(dblCodigoSGP.KeyValue)+
          ' OR I1.SGP_CODIGO_4='+IntToStr(dblCodigoSGP.KeyValue)+'))';
    end
    else //Com Grupo e Sem SubGrupo
      CdFOR:=' AND (I1.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+') ';
  end;

  if ckbCodigoVEN.Checked then
  Begin
    if not (dblCodigoVEN.KeyValue > 0) then
    Begin
      dblCodigoVEN.SetFocus;
      raise Exception.Create('Vendedor(a) inválido(a)!');
    end
    else
      FUN:=' AND (P1.FUN_CODIGO='+IntToStr(dblCodigoVEN.KeyValue)+') ';
    sFiltros := sFiltros + '(VEN:'+IntToStr(dblCodigoVEN.KeyValue)+')';
  end;

  if ckbCodigoPDV.Checked then
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Begin
      edtCodigoPDV.SetFocus;
      raise Exception.Create('Código do pedido inválido!');
    end
    else
      PDV:=' AND (P1.PDV_CODIGO='+edtCodigoPDV.Text+') ';

  if ckbSituacao.Checked then
  Begin
    case cmbSituacao.ItemIndex of
      0: SIT:=' AND (P1.PCT_SITUACAO<4) ';
      1: SIT:=' AND (P1.PCT_SITUACAO=4) ';
      2: SIT:=' AND (P1.PCT_SITUACAO=6) ';
      3: SIT:=' AND (P1.PCT_SITUACAO=8) ';
    end;
  end;


  if ckbTipoPagamento.Checked then
  Begin
    if dblTipoPagamento.Text = '' then
    Begin
      dblTipoPagamento.SetFocus;
      raise Exception.Create('Tipo de Pagamento inválido!');
    end
    else
      TPG:=' AND (P1.PCT_TIPO_PAG='+IntToStr(dblTipoPagamento.KeyValue)+') ';
    sFiltros := sFiltros + '(TipoPag:'+dblTipoPagamento.Text+')';
  end;

  if ckbCodigoFPG.Checked then
  Begin
    if dblCodigoFPG.Text = '' then
    Begin
      dblCodigoFPG.SetFocus;
      raise Exception.Create('Forma de Pagamento inválido!');
    end
    else
    Begin
      if cmbCodigoFPG.ItemIndex = 0 then
      Begin
        FPG:=' AND (P1.FPG_CODIGO='+IntToStr(dblCodigoFPG.KeyValue)+') ';
        sFiltros := sFiltros + '(FPG:='+dblCodigoFPG.Text+')';
      end
      else
      Begin
        FPG:=' AND (P1.FPG_CODIGO<>'+IntToStr(dblCodigoFPG.KeyValue)+') ';
        sFiltros := sFiltros + '(FPG:<>'+dblCodigoFPG.Text+')';
      end;
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
        AGF:=' AND (P1.AGF_CODIGO='+IntToStr(dblCodigoAGF.KeyValue)+') ';
        sFiltros := sFiltros + '(AGF:='+dblCodigoAGF.Text+')';
      end
      else
      Begin
        AGF:=' AND (P1.AGF_CODIGO<>'+IntToStr(dblCodigoAGF.KeyValue)+') ';
        sFiltros := sFiltros + '(AGF:<>'+dblCodigoAGF.Text+')';
      end;
    end;
  end;


  if ckbCodigoCNC.Checked then
  Begin
    if dblCodigoCNC.Text = '' then
    Begin
      dblCodigoCNC.SetFocus;
      raise Exception.Create('Centro de Custo inválido!');
    end
    else
      CNC:=' AND (P1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
    sFiltros := sFiltros + '(CNC:='+IntToStr(dblCodigoCNC.KeyValue)+')';
  end;

  if ckbNumeroNota.Checked then
  Begin
    if not VerificaInteiroBranco(edtNumeroNota.Text) then
    Begin
      edtNumeroNota.SetFocus;
      raise Exception.Create('Número da Nota inválido!');
    end
    else
      NTF:=' AND (P1.NTF_CODIGO IN (SELECT NTF_CODIGO '+
        ' FROM NOTA_FISCAL WHERE NTF_NOTA_FISCAL='+edtNumeroNota.Text+
        ' AND NTF_TIPO_NOTA=361))'; //Tipo Venda
    sFiltros := sFiltros + ' (Nota:='+edtNumeroNota.Text+')';
  end;

  if ckbVendasPorFaturar.Checked then
  Begin
    NTF:=' AND (P1.NTF_CODIGO=0 OR P1.NTF_CODIGO IS NULL) ';
    sFiltros := sFiltros + ' (NTF=0)';
  end;

  if ckbVendasFaturadas.Checked then
    if ckbSN.Checked then
    Begin
      NTF:=' AND (P1.NTF_CODIGO>0 OR P1.NTF_CODIGO=-1) ';
      sFiltros := sFiltros + ' (Fat.)';
    end
    else
    Begin
      NTF:=' AND (P1.NTF_CODIGO>0) ';
      sFiltros := sFiltros + ' (NTF>0)';
    end
  else if ckbSN.Checked then
  Begin
    NTF:=' AND (P1.NTF_CODIGO=-1) ';
    sFiltros := sFiltros + ' (NTF=LJ3)';
  end;

  if ckbValorTotal.Checked then
  Begin
    if not VerificaFloatBranco(edtValorTotal.Text) then
    Begin
      edtValorTotal.SetFocus;
      Raise Exception.Create('Valor Total do pedido inválido!');
    end
    else
      case cmbValorTotal.ItemIndex of
        0: Begin
             Valor:=' AND (TOTAL_SERVICO+TOTAL_ACRESCIMO < '+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total<'+edtValorTotal.Text+')';
           end;
        1: Begin
             Valor:=' AND (TOTAL_SERVICO+TOTAL_ACRESCIMO = '+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total='+edtValorTotal.Text+')';
           end;
        2: Begin
             Valor:=' AND (TOTAL_SERVICO+TOTAL_ACRESCIMO > '+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total>'+edtValorTotal.Text+')';
           end;
        3: Begin
             Valor:=' AND (TOTAL_SERVICO+TOTAL_ACRESCIMO <='+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total<='+edtValorTotal.Text+')';
           end;
        4: Begin
             Valor:=' AND (TOTAL_SERVICO+TOTAL_ACRESCIMO >='+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Total>='+edtValorTotal.Text+')';
           end;
      end;
  end;                                        

  Dt_ini := mskDataINI.Text;
  Dt_fim := mskDataFIM.Text;
  if (tag = 0) and (not ckbExibirRemessas.Checked) then
  Begin
    Application.CreateForm(Trpt_PacotesCliente, rpt_PacotesCliente);
    with rpt_PacotesCliente do
    Begin
      tag := 0;
      zrlFiltros.Caption := sFiltros;

      if not ckbExibirParcelas.Checked then
      Begin
        if ckbSintetico.Checked then
        Begin
          if ckbNaoExibirItens.Checked then
            zrbParcelas.Height := 0
          else
            zrbParcelas.Height := 2;
        end
        else
        Begin
          zrbParcelas.Height := 4;
          zrlTracoDuploParcela.top := 3;
        end;
      end;

      if ckbSintetico.Checked then
      Begin
        if (ckbCodigoCNC.Checked) and
           ckbAgruparVendedor.Checked then
          zrbCabecalhoFUN1.Expression := 'CNC_CODIGO+FUN_CODIGO '
        else
        Begin
          zrbCabecalhoFUN1.Expression := '';
          zrbCabecalhoFUN1.Height := 0;
        end;

        if ckbAgruparVendedor.Checked then
          Ordem := ' P1.CNC_CODIGO,P1.FUN_CODIGO,C1.CLI_RZ_SOCIAL,P1.PDV_CODIGO ASC'
        else
          Ordem := ' P1.CNC_CODIGO,C1.CLI_RZ_SOCIAL,P1.PDV_CODIGO ASC';

        SZRLabel4.Enabled  := False; //Label do PDV
        SZRDBText3.Left    := 0;     //PDV
        SZRLabel8.Enabled  := False; //Label da Data
        zrlData.Left    := 8;     //Data
        zrlData.Width   := 10;    //Data
        zrlTotalPedido.Left   := 19;    //Valor
        zrlTotalPedido.Enabled:= True;
        SZRLabel56.Enabled := True;  //Vendedor
        SZRLabel56.Left    := 29;    //Vendedor
        zrlRazaoSocial.Top     := 0;     //Cliente
        zrlRazaoSocial.Left    := 36;    //Cliente
        zrlRazaoSocial.Width   := 40;    //Cliente
        szrNota.Enabled := False; //Label Nota
        zrlNotaCupom.Left    := 77;    //TipoNota
        zrlNotaFiscal.Left    := 79;    //Nota
        zrlFone.Top     := 0;     //Telefone
        zrlFone.Left    := 88;    //Telefone
        zrlPaiMae.Top     := 0;     //Contato
        zrlPaiMae.Left    := 104;   //Contato
        zrlPaiMae.Width   := 15;    //Contato
        SZRLabel42.Enabled := False; //Label Situação
        zrlSituacao.Left    := 120;   //Situação
        zrlSituacao.Width   := 16;    //Situação
        if ckbSuperSintetico.Checked then
          zrbCabecalhoPedido.Height := 0
        else if ckbSaltarLinha.Checked then
          zrbCabecalhoPedido.Height := 2
        else
          zrbCabecalhoPedido.Height := 1;
      end
      else
      Begin
        zrbCabecalhoFUN1.Expression := '';
        zrlDtAlteracao.Enabled  := True;
        zrbTotalCentro.Height      := 0;  //SubTotal por Centro de Custo
        if ckbCodigoPDV.Checked then
        Begin
          zrbCabecalhoPagina.Height := 3;
          ZRLabel5.Top   := 2;
          ZRLabel21.Enabled := False;
          zrlTotalCentro.Enabled := False;
          zrlFiltros.Enabled := False;
          ZRLabel4.Caption := 'Total:';
          if DM.Configuracao1.Empresa = empMotical then //Motical - Meia Folha
          Begin
            report.Options.PageLength := 32;
            zrbParcelas.Height := 2;
            zrlTracoDuploParcela.top := 3;
            zrbCabecalhoCNC.Height := 0;
            zrbTotalGeral.Height   := 0;
            szrNota.Enabled:=False;
            zrlNotaFiscal.Enabled:=False;
            zrlNotaCupom.Enabled:=False;
            ZRLabel5.Top   := 2;
            zrbCabecalhoPagina.Height := 3;
          end;
        end
        else
        Begin
          zrbCabecalhoPagina.Height := 4;
          ZRLabel5.Top   := 3;
        end;
        zrbCabecalhoPedido.Height:= 11;
      end;
      if ckbNaoExibirItens.Checked then  //Esconder itens
      Begin
        zrb_detalhePacote.Height := 0;
        if not ckbSintetico.Checked then
          zrbCabecalhoPedido.Height    := 9; //Esconde Cabeçalho de Produto
      end;

      Entidade.Close;
      Entidade.SQL.Text:='SELECT P1.*,I1.* '+
        ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1, CLIENTE C1 '+
        ' WHERE (P1.CLI_CODIGO<>0) '+
        DataINI+DataFIM+CdFOR+CNC+SIT+CLI+FUN+PDV+TPG+FPG+AGF+NTF+Valor+
        ' AND (P1.CNC_CODIGO=I1.CNC_CODIGO) '+
        ' AND (P1.PDV_CODIGO=I1.PDV_CODIGO) '+
        ' AND (P1.CNC_CLIENTE=C1.CNC_CODIGO) '+
        ' AND (P1.CLI_CODIGO=C1.CLI_CODIGO) '+
        ' ORDER BY '+Ordem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      report.preview;
      Close;
    end;
  end
  else if tag = 0 then //Exibir Remessas
  Begin
    Application.CreateForm(Trpt_PacoteRemessa, rpt_PacoteRemessa);
    with rpt_PacoteRemessa do
    Begin
      tag := 0;
      zrlFiltros.Caption := sFiltros;

      Ordem := ' P1.CNC_CODIGO,C1.CLI_RZ_SOCIAL,P1.PDV_CODIGO ASC';

      Entidade.Close;
      Entidade.SQL.Text:='SELECT P1.*,I1.* '+
        ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1, CLIENTE C1 '+
        ' WHERE (P1.CLI_CODIGO<>0) '+
        DataINI+DataFIM+CdFOR+CNC+SIT+CLI+FUN+PDV+TPG+FPG+AGF+NTF+Valor+
        ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
        ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
        ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO '+
        ' AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
        ' ORDER BY '+Ordem;
      Entidade.Open;
      Item_Pedido_Venda1.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');

      if VerificaDataBranco(mskDataINI.Text) or
         VerificaDataBranco(mskDataINI.Text) then
      Begin
        if VerificaDataBranco(mskDataINI.Text) then
          qrlDescricaoPeriodo.Caption := 'De '+mskDataINI.Text;
        if VerificaDataBranco(mskDataFIM.Text) then
          qrlDescricaoPeriodo.Caption := qrlDescricaoPeriodo.Caption + ' a '+mskDataFIM.Text;
      end
      else
      Begin
        qrlDescricaoPeriodo.Caption := '';
        qrlPeriodoDesc.Caption := '';
        zrlFiltros.Caption := '';
        zrlLinhaCabecalho.Top := 36;
        zrbCabecalho.Height := 56;
      end;
      report.preview;
      Close;
    end;
  end;
end;

procedure TfMxSelPacote.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=29;
    fCadCli.CentroCusto2.open;
    if DM.Configuracao1.Empresa = empLBM then
      fCadCli.CentroCusto2.LocalizarCod(0)
    else
      fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
    fCadCli.dblCentroDeCusto.KeyValue:=fCadCli.CentroCusto2.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxSelPacote.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelPacote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Vendedor1.Active := False;
  CentroCusto1.Active := False;
  Action := cafree;
end;

procedure TfMxSelPacote.ckbCodigoPDVClick(Sender: TObject);
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

procedure TfMxSelPacote.ckbTipoPagamentoClick(Sender: TObject);
begin
  if ckbTipoPagamento.Checked then
  Begin
    Parametro1.Open;
    dblTipoPagamento.Color:=clWindow;
    dblTipoPagamento.Enabled:=True;
    dblTipoPagamento.KeyValue:=Parametro1.CodigoPAR;
    dblTipoPagamento.SetFocus;
  end
  else
  Begin
    Parametro1.Close;
    dblTipoPagamento.Color:=AlteraCorComponentes;
    dblTipoPagamento.KeyValue:=-1;
    dblTipoPagamento.Enabled:=False;
  end;
end;

procedure TfMxSelPacote.ckbCodigoFPGClick(Sender: TObject);
begin
  if ckbCodigoFPG.Checked then
  Begin
    Forma_de_Pagamento1.Open;
    cmbCodigoFPG.Enabled := True;
    cmbCodigoFPG.Color := clWindow;
    cmbCodigoFPG.ItemIndex := 0;
    dblCodigoFPG.Color:=clWindow;
    dblCodigoFPG.Enabled:=True;
    dblCodigoFPG.KeyValue:=Forma_de_Pagamento1.CodigoFPG;
    dblCodigoFPG.SetFocus;
  end
  else
  Begin
    Forma_de_Pagamento1.Close;
    cmbCodigoFPG.Enabled := False;
    cmbCodigoFPG.Color := AlteraCorComponentes;
    cmbCodigoFPG.ItemIndex := -1;
    dblCodigoFPG.Color:=AlteraCorComponentes;
    dblCodigoFPG.KeyValue:=-1;
    dblCodigoFPG.Enabled:=False;
  end;
end;

procedure TfMxSelPacote.ckbCodigoAGFClick(Sender: TObject);
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

procedure TfMxSelPacote.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
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

procedure TfMxSelPacote.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Color:=clWindow;
    cmbSituacao.Enabled:=True;
    cmbSituacao.ItemIndex:=1;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
    cmbSituacao.Enabled:=False;
  end;
end;

procedure TfMxSelPacote.ckbNumeroNotaClick(Sender: TObject);
begin
  if ckbNumeroNota.Checked then
  Begin
    ckbVendasPorFaturar.Checked := False;
    edtNumeroNota.Color:=clWindow;
    edtNumeroNota.Enabled:=True;
    edtNumeroNota.SetFocus;
  end
  else
  Begin
    edtNumeroNota.Color:=AlteraCorComponentes;
    edtNumeroNota.Text:='';
    edtNumeroNota.Enabled:=False;
  end;
end;

procedure TfMxSelPacote.ckbValorTotalClick(Sender: TObject);
begin
  if ckbValorTotal.Checked then
  Begin
    cmbValorTotal.Color:=clWindow;
    cmbValorTotal.Enabled:=True;
    cmbValorTotal.ItemIndex:=4;
    edtValorTotal.Color:=clWindow;
    edtValorTotal.Enabled:=True;
    edtValorTotal.SetFocus;
  end
  else
  Begin
    cmbValorTotal.Color:=AlteraCorComponentes;
    cmbValorTotal.Enabled:=False;
    cmbValorTotal.ItemIndex:=-1;
    edtValorTotal.Color:=AlteraCorComponentes;
    edtValorTotal.Text:='';
    edtValorTotal.Enabled:=False;
  end;
end;

procedure TfMxSelPacote.ckbVendasPorFaturarClick(Sender: TObject);
begin
  if ckbVendasPorFaturar.Checked then
  Begin
    ckbNumeroNota.Checked := False;
    ckbVendasFaturadas.Checked := False;
    ckbSN.Checked := False;
  end;
end;

procedure TfMxSelPacote.ckbVendasFaturadasClick(Sender: TObject);
begin
  if ckbVendasFaturadas.Checked then
  Begin
    ckbVendasPorFaturar.Checked := False;
    ckbSN.Checked := True;
  end;
end;

procedure TfMxSelPacote.ckbSinteticoClick(Sender: TObject);
begin
  if ckbSintetico.Checked then
  Begin
    ckbExibirParcelas.Checked := False;
    ckbExibirParcelas.Enabled := False;
    ckbVendedorPorPagina.Enabled := True;
    ckbSaltarLinha.Enabled := True;
    ckbSuperSintetico.Enabled := True;
  end
  else
  Begin
    ckbVendedorPorPagina.Enabled := False;
    ckbVendedorPorPagina.Checked := False;
    ckbExibirParcelas.Enabled := True;
    ckbSuperSintetico.Checked := False;
    ckbSuperSintetico.Enabled := False;
  end;
end;

procedure TfMxSelPacote.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(27) then
    Close;
end;

procedure TfMxSelPacote.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    Grupo1.Open;
    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    dblCodigoGRP.KeyValue:=Grupo1.CodigoGRP;
    ckbCodigoSGP.Enabled:=True;
    dblCodigoGRP.SetFocus;
  end
  else
  Begin
    Grupo1.Close;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    ckbCodigoSGP.Enabled:=False;
    dblCodigoGRP.KeyValue := 0;
  end;
end;

procedure TfMxSelPacote.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    SubGrupo1.Open;
    dblCodigoSGP.Enabled:=True;
    dblCodigoSGP.color:=clWindow;
    dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
  end
  else
  Begin
    SubGrupo1.Close;
    dblCodigoSGP.Enabled:=False;
    dblCodigoSGP.color:=AlteraCorComponentes;
    dblCodigoSGP.KeyValue:=0;
  end;
end;

procedure TfMxSelPacote.ckbSNClick(Sender: TObject);
begin
  if ckbSN.Checked then
    ckbVendasPorFaturar.Checked := False;
end;

procedure TfMxSelPacote.dblCodigoGRPClick(Sender: TObject);
begin
  SubGrupo1.Close;
  SubGrupo1.Open;
  if ckbCodigoSGP.Checked and (dblCodigoSGP.Text = '') then
    dblCodigoSGP.KeyValue := SubGrupo1.CodigoSGP;
end;

procedure TfMxSelPacote.SubGrupo1BeforeOpen(DataSet: TDataSet);
begin
  try
    SubGrupo1.ParamByName('GRP_CODIGO').asInteger := Grupo1.CodigoGRP
  except
    SubGrupo1.ParamByName('GRP_CODIGO').asInteger := -1;
  end;
end;

procedure TfMxSelPacote.ckbExibirRemessasClick(Sender: TObject);
begin
  if ckbExibirRemessas.Checked then
  Begin
    ckbSintetico.Checked := True;
    ckbSintetico.Enabled := False;
    ckbNaoExibirItens.Checked := False;
    ckbNaoExibirItens.Enabled := False;
    ckbSuperSintetico.Checked := False;
    ckbSuperSintetico.Enabled := False;
    ckbSaltarLinha.Checked := False;
    ckbSaltarLinha.Enabled := False;
    ckbVendedorPorPagina.Checked := False;
    ckbVendedorPorPagina.Enabled := False;
  end
  else
  Begin
    ckbSintetico.Enabled := True;
    ckbNaoExibirItens.Enabled := True;
    ckbSuperSintetico.Enabled := True;
    ckbSaltarLinha.Enabled := True;
    ckbVendedorPorPagina.Enabled := True;
  end;
end;

end.


