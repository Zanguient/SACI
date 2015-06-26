unit URelDataCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, SubGrupo, DBCtrls, CentroCusto, Grupo, Variants,
  Forma_de_Pagamento, SiacReport_TLB;

type
  Trpt_DataCompra = class(TForm)
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Panel3: TPanel;
    SubGrupo1: TSubGrupo;
    DSSubGrupo: TDataSource;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Grupo1: TGrupo;
    DSGrupo1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label6: TLabel;
    Label8: TLabel;
    rdbDataCadastro: TRadioButton;
    rdbDataAlterado: TRadioButton;
    rdbDataEntrega: TRadioButton;
    rdbDataEmissao: TRadioButton;
    rdbDataEntrada: TRadioButton;
    GroupBox1: TGroupBox;
    ckbCNCEntrega: TCheckBox;
    dblCNCEntrega: TDBLookupComboBox;
    ckbSomenteConfirmado: TCheckBox;
    ckbLJ3: TCheckBox;
    ckbSomentePendentes: TCheckBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    ckbSintetico: TCheckBox;
    cmbOrdem: TComboBox;
    ckbMaioresFornecedores: TCheckBox;
    GroupBox3: TGroupBox;
    edtCodigoFOR: TEdit;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoFOR: TCheckBox;
    ckbCodigoGRP: TCheckBox;
    ckbCodigoSGP: TCheckBox;
    dblCodigoGRP: TDBLookupComboBox;
    edtCodigoPRD: TEdit;
    ckbCodigoPRD: TCheckBox;
    ckbCodigoCNC: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    edtCodigoPCP: TEdit;
    ckbCodigoPCP: TCheckBox;
    edtNotaFiscal: TEdit;
    ckbNotaFiscal: TCheckBox;
    edtSelo: TEdit;
    ckbSelo: TCheckBox;
    ckbSomenteFaturado: TCheckBox;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    ckbCodigoFPG: TCheckBox;
    dblCodigoFPG: TDBLookupComboBox;
    cmbCodigoFPG: TComboBox;
    ckbSomenteBonificacao: TCheckBox;
    Label3: TLabel;
    ckbValorVPC: TCheckBox;
    cmbValorVPC: TComboBox;
    edtValorVPC: TEdit;
    edtDocumento: TEdit;
    ckbDocumento: TCheckBox;
    edtReferencia: TEdit;
    ckbReferencia: TCheckBox;
    ckbLJ4: TCheckBox;
    ckbSomenteAmostra: TCheckBox;
    edtCodigoFPE: TEdit;
    ckbCodigoFPE: TCheckBox;
    Bevel1: TBevel;
    cbxRelatorioGrafico: TCheckBox;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCNCEntregaClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure SubGrupo1BeforeOpen(DataSet: TDataSet);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure ckbSomenteConfirmadoClick(Sender: TObject);
    procedure ckbSomentePendentesClick(Sender: TObject);
    procedure ckbMaioresFornecedoresClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoPCPClick(Sender: TObject);
    procedure ckbNotaFiscalClick(Sender: TObject);
    procedure ckbSeloClick(Sender: TObject);
    procedure ckbCodigoFPGClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbValorVPCClick(Sender: TObject);
    procedure ckbDocumentoClick(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure ckbCodigoFPEClick(Sender: TObject);
    procedure ReportHistoricoCompras(filtrosSQL, filtros: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_DataCompra: Trpt_DataCompra;

implementation

uses UDM, UPrinc2, UHistorCompras, MxSCotaFor, MxSPediProd,
  MxSPediProdMotCal, UMaioresFornecedores;

{$R *.DFM}


procedure Trpt_DataCompra.SB_ConfirmarClick(Sender: TObject);
 var
  mensagem,CdPCP,CdPCP2,sNotaFiscal,sNotaFiscal2,sSelo,sSelo2,CdCNC,CdCNC2,
    CdCNCEntrega,CdCNCEntrega2,DtINI,DtINI2,DtFIM,DtFIM2,CdGRP,CdSGP,
    CdFOR, CdFOR2, CdPRD, sReferencia, Pendentes, Pendentes2, sSN, sSN2, CdFPG, CdFPG2,
    sSomenteBonificacao, sSomenteAmostra, sVPC, sVPC2, sDoc, sDoc2, CdFPE, CdFPE2, sFiltros, sOrdem :string;
begin
  mensagem:='';
  CdPCP := '';
  CdPCP2 := '';
  CdFPE  := '';
  sNotaFiscal := '';
  sSelo := '';
  CdCNC := '';
  CdCNCEntrega := '';
  sNotaFiscal2 := '';
  sSelo2 := '';
  CdCNC2 := '';
  CdCNCEntrega2 := '';
  CdGRP := '';
  CdSGP := '';
  CdFOR := '';
  CdFOR2 := '';
  CdPRD := '';
  sReferencia := '';
  Pendentes := '';
  sSN := '';
  sFiltros := '';
  DtINI := '';
  DtFIM := '';
  CdFPG := '';
  CdFPG2 := '';
  sDoc := ''; sDoc2 := '';
  sSomenteBonificacao := '';
  sSomenteAmostra := '';
  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text) then
  Begin
    if rdbDataCadastro.Checked then
    Begin
      DtINI := ' AND (T2.PCP_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") ';
      DtINI2 := ' AND (P1.PCP_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") ';
    end
    else if rdbDataAlterado.Checked then
    Begin
      DtINI := ' AND (T2.PCP_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") ';
      DtINI2 := ' AND (P1.PCP_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") ';
    end
    else if rdbDataEntrega.Checked then
    Begin
      DtINI := ' AND (T2.PCP_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'") ';
      DtINI2 := ' AND (P1.PCP_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'") ';
    end
    else if rdbDataEmissao.Checked then
    Begin
      DtINI := ' AND (T2.PCP_DT_EMISSAO>="'+MesDia(mskDataINI.Text)+'") ';
      DtINI2 := ' AND (P1.PCP_DT_EMISSAO>="'+MesDia(mskDataINI.Text)+'") ';
    end
    else if rdbDataEntrada.Checked then
    Begin
      DtINI := ' AND (T2.PCP_DT_SAIDA>="'+MesDia(mskDataINI.Text)+'") ';
      DtINI2 := ' AND (P1.PCP_DT_SAIDA>="'+MesDia(mskDataINI.Text)+'") ';
    end;
  end;

  if VerificaDataBranco(mskDataFIM.Text) then
  Begin
    if rdbDataCadastro.Checked then
    Begin
      DtFIM := ' AND (T2.PCP_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DtFIM2 := ' AND (P1.PCP_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end
    else if rdbDataAlterado.Checked then
    Begin
      DtFIM := ' AND (T2.PCP_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DtFIM2 := ' AND (P1.PCP_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end
    else if rdbDataEntrega.Checked then
    Begin
      DtFIM := ' AND (T2.PCP_DT_ENTREGA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DtFIM2 := ' AND (P1.PCP_DT_ENTREGA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end
    else if rdbDataEmissao.Checked then
    Begin
      DtFIM := ' AND (T2.PCP_DT_EMISSAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DtFIM2 := ' AND (P1.PCP_DT_EMISSAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end
    else if rdbDataEntrada.Checked then
    Begin
      DtFIM := ' AND (T2.PCP_DT_SAIDA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DtFIM2 := ' AND (P1.PCP_DT_SAIDA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end;
  end;

  if rdbDataCadastro.Checked then
    sFiltros := sFiltros + '(Cadastro)'
  else if rdbDataAlterado.Checked then
    sFiltros := sFiltros + '(Alterado)'
  else if rdbDataEntrega.Checked then
    sFiltros := sFiltros + '(Entrega)'
  else if rdbDataEmissao.Checked then
    sFiltros := sFiltros + '(Emissao)'
  else if rdbDataEntrada.Checked then
    sFiltros := sFiltros + '(Entrada)';

  if ckbCodigoPCP.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPCP.Text) then
    Begin
      edtCodigoPCP.SetFocus;
      Raise Exception.Create('Código do Pedido inválido!');
    end;
    CdPCP  := ' AND (T2.PCP_CODIGO='+edtCodigoPCP.Text+') ';
    CdPCP2 := ' AND (P1.PCP_CODIGO='+edtCodigoPCP.Text+') ';
    sFiltros := sFiltros + '(PCP:'+edtCodigoPCP.Text+')';
  end;

  if ckbNotaFiscal.Checked then
  Begin
    sNotaFiscal := ' AND (T2.PCP_NOTA_FISCAL LIKE "%'+edtNotaFiscal.Text+'%") ';
    sNotaFiscal2 := ' AND (P1.PCP_NOTA_FISCAL LIKE "%'+edtNotaFiscal.Text+'%") ';
    sFiltros := sFiltros + '(Nota:'+edtNotaFiscal.Text+')';
  end;

  if ckbSelo.Checked then
  Begin
    sSelo := ' AND (T2.PCP_SELO LIKE "%'+edtSelo.Text+'%") ';
    sSelo2 := ' AND (P1.PCP_SELO LIKE "%'+edtSelo.Text+'%") ';
    sFiltros := sFiltros + '(Selo:'+edtSelo.Text+')';
  end;

  if ckbDocumento.Checked then
  Begin
    sDoc := ' AND (T2.PCP_DOCUMENTO LIKE "%'+edtDocumento.Text+'%") ';
    sDoc2 := ' AND (P1.PCP_DOCUMENTO LIKE "%'+edtDocumento.Text+'%") ';
    sFiltros := sFiltros + '(Doc:'+edtDocumento.Text+')';
  end;

  if ckbCodigoFPE.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoFPE.Text) then
    Begin
      edtCodigoFOR.SetFocus;
      Raise Exception.Create('Código do Faturamento Pendente inválido!');
    end;
    CdFPE :=' AND (T2.FPE_CODIGO='+edtCodigoFPE.Text+') ';
    CdFPE2 :=' AND (P1.FPE_CODIGO='+edtCodigoFPE.Text+') ';
    sFiltros := sFiltros + '(FPE:'+edtCodigoFPE.Text+')';
  end;

  if ckbCodigoFOR.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
    Begin
      edtCodigoFOR.SetFocus;
      Raise Exception.Create('Fornecedor inválido!');
    end;
    CdFOR :=' AND (T2.FOR_CODIGO='+edtCodigoFOR.Text+') ';
    CdFOR2 :=' AND (P1.FOR_CODIGO='+edtCodigoFOR.Text+') ';
    sFiltros := sFiltros + '(FOR:'+edtCodigoFOR.Text+')';
  end;

  if ckbCodigoPRD.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Begin
      edtCodigoPRD.SetFocus;
      Raise Exception.Create('Produto inválido!');
    end;
    CdPRD:=' AND (T3.PRD_CODIGO='+edtCodigoPRD.Text+') ';
    sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
  end;

  if ckbReferencia.Checked then
  Begin
    sReferencia:=' AND (T3.PRD_REFERENCIA LIKE "%'+edtReferencia.Text+'%") ';
    sFiltros := sFiltros + '(Referencia:'+edtReferencia.Text+')';
  end;

  if ckbCodigoCNC.Checked then
  Begin
    CdCNC := ' AND (T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
    CdCNC2 := ' AND (P1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
    sFiltros := sFiltros + '(CNC:'+dblCodigoCNC.Text+')';
  end;

  if ckbCNCEntrega.Checked then
  Begin
    CdCNCEntrega := ' AND (T2.CNC_ENTREGA='+IntToStr(dblCNCEntrega.KeyValue)+') ';
    CdCNCEntrega2 := ' AND (P1.CNC_ENTREGA='+IntToStr(dblCNCEntrega.KeyValue)+') ';
    sFiltros := sFiltros + '(Entrega:'+dblCNCEntrega.Text+')';
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
        CdFPG :=' AND (T2.FPG_CODIGO='+IntToStr(dblCodigoFPG.KeyValue)+') ';
        CdFPG2:=' AND (P1.FPG_CODIGO='+IntToStr(dblCodigoFPG.KeyValue)+') ';
        sFiltros := sFiltros + '(FPG:='+dblCodigoFPG.Text+')';
      end
      else
      Begin
        CdFPG :=' AND (T2.FPG_CODIGO<>'+IntToStr(dblCodigoFPG.KeyValue)+') ';
        CdFPG2:=' AND (P1.FPG_CODIGO<>'+IntToStr(dblCodigoFPG.KeyValue)+') ';
        sFiltros := sFiltros + '(FPG:<>'+dblCodigoFPG.Text+')';
      end;
    end;
  end;

  if ckbValorVPC.Checked then
  Begin
    if not VerificaFloatBranco(edtValorVPC.Text) then
    Begin
      edtValorVPC.SetFocus;
      Raise Exception.Create('VPC do pedido inválido!');
    end
    else
      case cmbValorVPC.ItemIndex of
        0: Begin
             sVPC :=' AND (T2.PCP_VPC < '+VirgPonto(edtValorVPC.Text)+') ';
             sVPC2:=' AND (P1.PCP_VPC < '+VirgPonto(edtValorVPC.Text)+') ';
             sFiltros := sFiltros + ' (VPC<'+edtValorVPC.Text+')';
           end;
        1: Begin
             sVPC :=' AND (T2.PCP_VPC = '+VirgPonto(edtValorVPC.Text)+') ';
             sVPC2:=' AND (P1.PCP_VPC = '+VirgPonto(edtValorVPC.Text)+') ';
             sFiltros := sFiltros + ' (VPC='+edtValorVPC.Text+')';
           end;
        2: Begin
             sVPC :=' AND (T2.PCP_VPC > '+VirgPonto(edtValorVPC.Text)+') ';
             sVPC2:=' AND (P1.PCP_VPC > '+VirgPonto(edtValorVPC.Text)+') ';
             sFiltros := sFiltros + ' (VPC>'+edtValorVPC.Text+')';
           end;
        3: Begin
             sVPC :=' AND (T2.PCP_VPC <='+VirgPonto(edtValorVPC.Text)+') ';
             sVPC2:=' AND (P1.PCP_VPC <='+VirgPonto(edtValorVPC.Text)+') ';
             sFiltros := sFiltros + ' (VPC<='+edtValorVPC.Text+')';
           end;
        4: Begin
             sVPC :=' AND (T2.PCP_VPC >='+VirgPonto(edtValorVPC.Text)+') ';
             sVPC2:=' AND (P1.PCP_VPC >='+VirgPonto(edtValorVPC.Text)+') ';
             sFiltros := sFiltros + ' (VPC>='+edtValorVPC.Text+')';
           end;
      end;
  end;


  if ckbSomenteConfirmado.Checked then
  Begin
    Pendentes := ' AND (T2.PCP_SITUACAO=2) ';
    Pendentes2 := ' AND (P1.PCP_SITUACAO=2) ';
    sFiltros := sFiltros + '(Processados)';
  end
  else if ckbSomentePendentes.Checked then
  Begin
    Pendentes := ' AND (T2.PCP_SITUACAO=0) ';
    Pendentes2 := ' AND (P1.PCP_SITUACAO=0) ';
    sFiltros := sFiltros + '(Pendentes)';
  end;

  if ckbSomenteFaturado.Checked then
  Begin
    sSN := ' AND T2.PCP_SN<>1 AND T2.PCP_LJ4<>1 ';
    sSN2 := ' AND P1.PCP_SN<>1 AND P1.PCP_LJ4<>1 ';
    sFiltros := sFiltros + '(Fat.)';
  end
  else
  Begin
    if ckbLJ3.Checked and
       ckbLJ4.Checked then
    Begin
      sSN := ' AND (T2.PCP_SN=1 OR T2.PCP_LJ4=1) ';
      sSN2 := ' AND (P1.PCP_SN=1 OR P1.PCP_LJ4=1) ';
      sFiltros := sFiltros + '(LJ3/LJ4)';
    end
    else if ckbLJ3.Checked then
    Begin
      sSN := ' AND (T2.PCP_SN=1) ';
      sSN2 := ' AND (P1.PCP_SN=1) ';
      sFiltros := sFiltros + '(LJ3)';
    end
    else if ckbLJ4.Checked then
    Begin
      sSN := ' AND (T2.PCP_LJ4=1) ';
      sSN2 := ' AND (P1.PCP_LJ4=1) ';
      sFiltros := sFiltros + '(LJ4)';
    end;
  end;

  if ckbCodigoGRP.Checked then
  Begin
    if dblCodigoGRP.Text = '' then
    Begin
      dblCodigoGRP.SetFocus;
      Raise Exception.Create('Selecione o Grupo!');
    end;
    CdGRP:=' AND (T3.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+') ';
    sFiltros := sFiltros + '(GRP:'+IntToStr(dblCodigoGRP.KeyValue)+')';
  end;

  if ckbCodigoSGP.Checked then
  Begin
    if dblCodigoSGP.Text = '' then
    Begin
      dblCodigoSGP.SetFocus;
      Raise Exception.Create('Selecione o SubGrupo!');
    end;
    CdSGP:=' AND (T3.SGP_CODIGO='+IntToStr(dblCodigoSGP.KeyValue)+') ';
    sFiltros := sFiltros + '(SGP:'+IntToStr(dblCodigoSGP.KeyValue)+')';
  end;

  if ckbSomenteBonificacao.Checked then
  Begin
    sSomenteBonificacao := ' AND T1.IPC_BONIFICACAO>0 ';
    sFiltros := sFiltros + '(Som.Bonif.)';
  end;

  if ckbSomenteAmostra.Checked then
  Begin
    sSomenteAmostra := ' AND T1.IPC_AMOSTRA>0 ';
    sFiltros := sFiltros + '(Som.Amostra.)';
  end;

  if ckbMaioresFornecedores.Checked then
  Begin
    sOrdem := 'TOTAL DESC,';
    sFiltros := sFiltros + '(Maiores)';
  end;

  case cmbOrdem.ItemIndex of
    0: sOrdem := sOrdem + 'T1.PCP_CODIGO,T1.IPC_CODIGO ASC';
    1: sOrdem := sOrdem + 'T2.FOR_CODIGO,T1.PCP_CODIGO,T1.IPC_CODIGO ASC';
  end;

  sOrdem := ' ORDER BY '+sOrdem;

  Dt_ini := mskDataINI.Text;
  Dt_fim := mskDataFIM.Text;

  if Tag=1 then
  begin
    if cbxRelatorioGrafico.Checked then //if RelatorioGrafico then
    begin
      if not ckbMaioresFornecedores.Checked then
      begin
        ReportHistoricoCompras(DtINI+DtFIM+CdPCP+sNotaFiscal+sSelo+CdGRP+CdSGP+CdFOR+CdFPE+CdPRD+sReferencia+sDoc+
                               Pendentes+CdCNC+CdCNCEntrega+sSN+CdFPG+sSomenteBonificacao+sSomenteAmostra+sVPC,
                               sFiltros);
      end
      else
      begin
        //TODO
        showmessage('Relatório de histórico de compras dos maiores fornecedores, em desenvolvimento!')
      end;
    end
    else
    begin
      if not ckbMaioresFornecedores.Checked then
      Begin
        Application.CreateForm(Trpt_HistorCompras,rpt_HistorCompras);
        with rpt_HistorCompras do
        Begin
          zrlDataINI.Caption  := mskDataINI.Text;
          zrlDataFIM.Caption  := mskDataFIM.Text;
          zrlFiltros.Caption  := sFiltros;
          if ckbSomenteBonificacao.Checked then
          Begin
            zrlDescTotalProduto.Enabled := False;
            zrlTotalProdutoNota.Enabled := False;
            zrlTotalProdutoGeral.Enabled := False;
          end;
          if ckbSintetico.Checked then
          Begin
            zrbDetalhe.Height := 0;
            zrbRodapeGrupo.Height := 0;
            srlQuantidade.Enabled := False;
            slrPreco.Caption := 'Tot. Prod.';
            zrlTotalSintetico.Enabled := True;
          end
          else
            zrlTotalSintetico.Enabled := False;

          Item_Pedido_Compra1.Close;
          Item_Pedido_Compra1.SQL.Text:='SELECT T1.*,'+
             ' T2.*,T3.PRD_DESCRICAO,T3.PRD_MARCA,T3.PRD_REFERENCIA,T3.PRD_UNIDADE '+
             ' FROM Item_de_Pedido_de_Compra T1,Pedido_de_Compra T2,Produto T3 '+
             ' WHERE T2.PCP_CODIGO<>-10 '+
             DtINI+DtFIM+CdPCP+sNotaFiscal+sSelo+CdGRP+CdSGP+CdFOR+CdFPE+CdPRD+sReferencia+sDoc+
             Pendentes+CdCNC+CdCNCEntrega+sSN+CdFPG+sSomenteBonificacao+sSomenteAmostra+sVPC+
             ' AND (T1.PRD_CODIGO=T3.PRD_CODIGO) '+
             ' AND (T1.PCP_CODIGO=T2.PCP_CODIGO) '+
             sOrdem;
          Item_Pedido_Compra1.Open;
          if Item_Pedido_Compra1.IsEmpty then
            Raise Exception.Create('Consulta vazia!');
          report.Preview;
          Close;
        end;
      end
      else //Maiores Fornecedores
      Begin
        Application.CreateForm(Trpt_MaioresFornecedores,rpt_MaioresFornecedores);
        with rpt_MaioresFornecedores do
        Begin
          zrlDataINI.Caption  := mskDataINI.Text;
          zrlDataFIM.Caption  := mskDataFIM.Text;
          zrlFiltros.Caption  := sFiltros;
          if ckbSintetico.Checked then
          Begin
            zrbDetalhe.Height := 0;
            slrPreco.Caption := 'Tot. Prod.';
          end;

          Entidade.Close;
          Entidade.SQL.Text:='SELECT T1.*,'+
             ' T2.*,T3.PRD_DESCRICAO,T3.PRD_MARCA,T3.PRD_REFERENCIA,T3.PRD_UNIDADE '+
             ',(SELECT SUM(IPC_QUANTIDADE*IPC_PRECO) '+
             ' FROM Item_de_Pedido_de_Compra T1,Pedido_de_Compra P1,Produto T3 '+
             ' WHERE P1.FOR_CODIGO=T2.FOR_CODIGO '+
             DtINI2+DtFIM2+CdPCP2+sNotaFiscal2+sSelo2+sDoc2+CdFOR2+CdFPE2+
             Pendentes2+CdCNC2+CdCNCEntrega2+sSN2+CdFPG2+sVPC2+
             ' AND (T1.PRD_CODIGO=T3.PRD_CODIGO) '+
             ' AND (T1.PCP_CODIGO=P1.PCP_CODIGO)) AS TOTAL '+
             ' FROM Item_de_Pedido_de_Compra T1,Pedido_de_Compra T2,Produto T3 '+
             ' WHERE T2.PCP_CODIGO<>-10 '+
             DtINI+DtFIM+CdPCP+sNotaFiscal+sSelo+CdGRP+CdSGP+CdFOR+CdFPE+CdPRD+sReferencia+sDoc+
             Pendentes+CdCNC+CdCNCEntrega+sSN+CdFPG+sVPC+
             ' AND (T1.PRD_CODIGO=T3.PRD_CODIGO) '+
             ' AND (T1.PCP_CODIGO=T2.PCP_CODIGO) '+
             sOrdem;
          Entidade.Open;
          if Entidade.IsEmpty then
            Raise Exception.Create('Consulta vazia!');
          report.Preview;
          Close;
        end;
      end;
    end;
  end;
end;

procedure Trpt_DataCompra.SB_CancelarClick(Sender: TObject);
begin
 Close;
end;

procedure Trpt_DataCompra.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  mskDataINI.SetFocus;
  cmbOrdem.ItemIndex := 0;
end;

procedure Trpt_DataCompra.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=9;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure Trpt_DataCompra.ckbCNCEntregaClick(Sender: TObject);
begin
  if ckbCNCEntrega.Checked then
  Begin
    CentroCusto1.Open;
    dblCNCEntrega.Color:=clWindow;
    dblCNCEntrega.Enabled:=True;
    dblCNCEntrega.KeyValue:=DM.Configuracao1.CodigoCNC;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCNCEntrega.Color:=AlteraCorComponentes;
    dblCNCEntrega.Enabled:=False;
    dblCNCEntrega.KeyValue:=-1;
  end;
end;

procedure Trpt_DataCompra.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if not (dblCodigoGRP.KeyValue > 0) then
    Begin
      dblCodigoGRP.SetFocus;
      Raise Exception.Create('Selecione o Grupo!');
    end;
    SubGrupo1.Open;
    dblCodigoSGP.Enabled:=True;
    dblCodigoSGP.Color:=clWindow;
    dblCodigoSGP.KeyValue := SubGrupo1.CodigoSGP;
    dblCodigoSGP.SetFocus;
  end
  else
  Begin
    SubGrupo1.Close;
    dblCodigoSGP.Enabled:=False;
    dblCodigoSGP.Color:=AlteraCorComponentes;
    dblCodigoSGP.KeyValue := 0;
  end;
end;

procedure Trpt_DataCompra.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    Grupo1.Open;
    ckbCodigoSGP.Enabled := True;
    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    dblCodigoGRP.KeyValue := Grupo1.CodigoGRP;
    dblCodigoGRP.SetFocus;
  end
  else
  Begin
    Grupo1.Close;
    ckbCodigoSGP.Enabled := False;
    ckbCodigoSGP.Checked := False;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    dblCodigoGRP.KeyValue := 0;
    dblCodigoSGP.Enabled:=False;
    dblCodigoSGP.Color:=AlteraCorComponentes;
    dblCodigoSGP.KeyValue := 0;
  end;
end;

procedure Trpt_DataCompra.SubGrupo1BeforeOpen(DataSet: TDataSet);
begin
  SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
end;

procedure Trpt_DataCompra.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Color:=clWindow;
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.Color:=AlteraCorComponentes;
    edtCodigoFOR.Enabled:=False;
    edtCodigoFOR.Clear;;
  end;
end;

procedure Trpt_DataCompra.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Enabled:=False;
    edtCodigoPRD.Clear;;
  end;
end;

procedure Trpt_DataCompra.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=38;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=38;
        ShowModal;
      end;
    end;
  End;
end;

procedure Trpt_DataCompra.ckbSomenteConfirmadoClick(Sender: TObject);
begin
  if ckbSomenteConfirmado.Checked then
    ckbSomentePendentes.Checked := False;
end;

procedure Trpt_DataCompra.ckbSomentePendentesClick(Sender: TObject);
begin
  if ckbSomentePendentes.Checked then
    ckbSomenteConfirmado.Checked := False;
end;

procedure Trpt_DataCompra.ckbMaioresFornecedoresClick(Sender: TObject);
begin
  if ckbMaioresFornecedores.Checked then
  Begin
    ckbSintetico.Checked := True;
    cmbOrdem.Enabled := False;
    cmbOrdem.ItemIndex := 1;
  end
  else
    cmbOrdem.Enabled := True;
end;

procedure Trpt_DataCompra.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto2.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
  end
  else
  Begin
    CentroCusto2.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure Trpt_DataCompra.ckbCodigoPCPClick(Sender: TObject);
begin
  if ckbCodigoPCP.Checked then
  Begin
    edtCodigoPCP.Color:=clWindow;
    edtCodigoPCP.Enabled:=True;
    edtCodigoPCP.SetFocus;
  end
  else
  Begin
    edtCodigoPCP.Color:=AlteraCorComponentes;
    edtCodigoPCP.Enabled:=False;
    edtCodigoPCP.Clear;;
  end;
end;

procedure Trpt_DataCompra.ckbNotaFiscalClick(Sender: TObject);
begin
  if ckbNotaFiscal.Checked then
  Begin
    edtNotaFiscal.Color:=clWindow;
    edtNotaFiscal.Enabled:=True;
    edtNotaFiscal.SetFocus;
  end
  else
  Begin
    edtNotaFiscal.Color:=AlteraCorComponentes;
    edtNotaFiscal.Enabled:=False;
    edtNotaFiscal.Clear;;
  end;
end;

procedure Trpt_DataCompra.ckbSeloClick(Sender: TObject);
begin
  if ckbSelo.Checked then
  Begin
    edtSelo.Color:=clWindow;
    edtSelo.Enabled:=True;
    edtSelo.SetFocus;
  end
  else
  Begin
    edtSelo.Color:=AlteraCorComponentes;
    edtSelo.Enabled:=False;
    edtSelo.Clear;
  end;
end;

procedure Trpt_DataCompra.ckbCodigoFPGClick(Sender: TObject);
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

procedure Trpt_DataCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure Trpt_DataCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_DataCompra.ckbValorVPCClick(Sender: TObject);
begin
  if ckbValorVPC.Checked then
  Begin
    cmbValorVPC.Color:=clWindow;
    cmbValorVPC.Enabled:=True;
    cmbValorVPC.ItemIndex:=2;
    edtValorVPC.Color:=clWindow;
    edtValorVPC.Enabled:=True;
    edtValorVPC.Text := '0';
    edtValorVPC.SetFocus;
  end
  else
  Begin
    cmbValorVPC.Color:=AlteraCorComponentes;
    cmbValorVPC.Enabled:=False;
    cmbValorVPC.ItemIndex:=-1;
    edtValorVPC.Color:=AlteraCorComponentes;
    edtValorVPC.Clear;
    edtValorVPC.Enabled:=False;
  end;
end;

procedure Trpt_DataCompra.ckbDocumentoClick(Sender: TObject);
begin
  if ckbDocumento.Checked then
  Begin
    edtDocumento.Color:=clWindow;
    edtDocumento.Enabled:=True;
    edtDocumento.SetFocus;
  end
  else
  Begin
    edtDocumento.Color:=AlteraCorComponentes;
    edtDocumento.Enabled:=False;
    edtDocumento.Clear;
  end;
end;

procedure Trpt_DataCompra.ckbReferenciaClick(Sender: TObject);
begin
  if ckbReferencia.Checked then
  Begin
    edtReferencia.Color:=clWindow;
    edtReferencia.Enabled:=True;
    edtReferencia.SetFocus;
  end
  else
  Begin
    edtReferencia.Color:=AlteraCorComponentes;
    edtReferencia.Enabled:=False;
    edtReferencia.Clear;;
  end;
end;

procedure Trpt_DataCompra.ckbCodigoFPEClick(Sender: TObject);
begin
  if ckbCodigoFPE.Checked then
  Begin
    edtCodigoFPE.Color:=clWindow;
    edtCodigoFPE.Enabled:=True;
    edtCodigoFPE.SetFocus;
  end
  else
  Begin
    edtCodigoFPE.Color:=AlteraCorComponentes;
    edtCodigoFPE.Enabled:=False;
    edtCodigoFPE.Clear;
  end;
end;

procedure Trpt_DataCompra.ReportHistoricoCompras(filtrosSQL, filtros: string);
var
  SQL: string;
  stiReport: CoSiacReport_;
begin
  SQL := 'SELECT '+
         ' CNC.CNC_CODIGO, '+
         ' CNC.CNC_RZ_SOCIAL, '+
         ' CNC.CNC_NOME_FAN, '+
         ' CNC.CNC_FONE, '+
         ' T1.*,'+
         ' T2.*, T3.PRD_DESCRICAO, T3.PRD_MARCA, T3.PRD_REFERENCIA, T3.PRD_UNIDADE '+
         ' FROM Item_de_Pedido_de_Compra T1, '+
         ' Pedido_de_Compra T2, '+
         ' Produto T3, '+
         ' CENTRO_DE_CUSTO CNC '+
         ' WHERE T2.PCP_CODIGO<>-10 '+
         ' AND T1.PRD_CODIGO=T3.PRD_CODIGO '+
         ' AND T1.PCP_CODIGO=T2.PCP_CODIGO '+
         ' AND CNC.CNC_CODIGO = T2.CNC_CODIGO '+ filtrosSQL +
         ' ORDER BY CNC.CNC_CODIGO';


  stiReport.Create.ReportHistoricoCompras(false,
                                          false,
                                          SQL,
                                          EmpresaDesenvolvedora,
                                          'Relatório de histórico de compras do sistema',
                                          DM.CentroCusto1.RazaoSocial,
                                          '',//DM.Configuracao1.LojaNome
                                          'Relatório de Histórico de Compras',
                                          DM.Usuario1.NomeUSU,
                                          'Filtros: ' +LowerCase(filtros),
                                          rptArquivoLogo);
end;

end.
