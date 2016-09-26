unit URelDataVend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, Db, DBTables, SQuery,
  Vendedor, AgenteFin, CentroCusto;

type
  Trpt_DataVend = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bitConfirma: TBitBtn;
    bitFechar: TBitBtn;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    dblVendedor: TDBLookupComboBox;
    chk_sintetico: TCheckBox;
    DSAgenteFin1: TDataSource;
    AgenteFin1: TAgenteFin;
    ckbCodigoAGF: TCheckBox;
    dblCodigoAGF: TDBLookupComboBox;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    dblCOdigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    cmbCodigoAGF: TComboBox;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    dblIndicacao: TDBLookupComboBox;
    ckbIndicacao: TCheckBox;
    Vendedor2: TVendedor;
    DSVendedor2: TDataSource;
    dblPromotor: TDBLookupComboBox;
    ckbPromotor: TCheckBox;
    Vendedor3: TVendedor;
    DSVendedor3: TDataSource;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    ckbCodigoVEN: TCheckBox;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbSomenteCreditos: TCheckBox;
    ckbSomenteDebitos: TCheckBox;
    ckbCodigoFPE: TCheckBox;
    edtCodigoFPE: TEdit;
    dblSuperior: TDBLookupComboBox;
    ckbSuperior: TCheckBox;
    DSVendedor4: TDataSource;
    Vendedor4: TVendedor;
    ckbSomenteLinha: TCheckBox;
    ckbSomenteForaLinha: TCheckBox;
    ckbSomenteCatalogo: TCheckBox;
    ckbServicoProducao: TCheckBox;
    ckbAgruparPorDia: TCheckBox;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbMetaPeriodo: TCheckBox;
    edtMetaPeriodo: TEdit;
    ckbSuperSintetico: TCheckBox;
    ckbCodigoFOR: TCheckBox;
    edtCodigoFOR: TEdit;
    ckbTotalParcela: TCheckBox;
    procedure bitConfirmaClick(Sender: TObject);
    procedure bitFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ckbCodigoAGFClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbIndicacaoClick(Sender: TObject);
    procedure ckbPromotorClick(Sender: TObject);
    procedure ckbCodigoVENClick(Sender: TObject);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbSomenteCreditosClick(Sender: TObject);
    procedure ckbSomenteDebitosClick(Sender: TObject);
    procedure ckbCodigoFPEClick(Sender: TObject);
    procedure ckbSuperiorClick(Sender: TObject);
    procedure ckbSomenteLinhaClick(Sender: TObject);
    procedure ckbSomenteForaLinhaClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbMetaPeriodoClick(Sender: TObject);
    procedure ckbServicoProducaoClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    DataOk: Boolean;
    DataINI, DataINITroca, DataINITroca2, DataINIAlterado, DataFIM,
      DataFIMTroca, DataFIMTroca2, DataFIMAlterado, CdFUN, CdFUNITO,
      DataINIDevolvido, DataFIMDevolvido :string;
  end;

var
  rpt_DataVend: Trpt_DataVend;

implementation

uses funcoes, UComissao, UDM, UComissao2, UComissaoMotical,
  UComissaoVendaCompleto, MxSPediProdMotCal, MxSPediProd, CdCliente,
  ZReport, UComissaoVendaCompletoQtd, MxSCotaFor;

{$R *.DFM}


procedure Trpt_DataVend.bitConfirmaClick(Sender: TObject);
var
  CdCNC, CdCLI, CdPRD, CdFOR, CdPDV, CdAGF, CdFPE, sFiltros, CdIndicacao,
    CdPromotor, sUNION, sSuperior, sSomenteLinha, sSomenteCatalogo,
    sSomenteLinhaITO, sMetaPeriodo, sSomenteCatalogoITO, sServicoProducao: String;
begin
  sUNION:= '';
  CdFUN := '';
  CdPDV := '';
  CdCLI := '';
  CdFPE := '';
  CdPRD := '';
  CdFOR := '';
  CdFUNITO := '';
  CdAGF := '';
  CdCNC := '';
  CdIndicacao := '';
  CdPromotor  := '';
  DataINI          := '';
  DataINITroca     := '';
  DataINITroca2    := '';
  DataINIAlterado  := '';
  DataINIDevolvido := '';
  DataFIM          := '';
  DataFIMTroca     := '';
  DataFIMTroca2    := '';
  DataFIMAlterado  := '';
  DataFIMDevolvido := '';
  sSuperior := '';
  sSomenteLinha := '';
  sSomenteCatalogo := '';
  sSomenteLinhaITO := '';
  sSomenteCatalogoITO := '';
  sServicoProducao := '';
  sFiltros := '';

  if not VerificaData(mskDataINI.Text) then
    Raise Exception.Create('Data Inicial inválida!');
  if not VerificaData(mskDataFIM.Text) then
    Raise Exception.Create('Data Final inválida!');

  if VerificaDataBranco(mskDataINI.Text)then
  Begin
    sFiltros := sFiltros + '(DtINI:'+mskDataINI.Text+')';
    if self.tag = 0 then
    Begin
      DataINI          := ' AND T2.PDV_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'" ';
      DataINITroca     := ' AND T1.TRO_DATA>="'+MesDia(mskDataINI.Text)+'" ';
      DataINITroca2    := ' AND T3.PDV_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'" ';
      DataINIAlterado  := ' AND T1.PDV_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'" ';
      DataINIDevolvido := ' AND T1.PDV_DT_DEVOLUCAO>="'+MesDia(mskDataINI.Text)+'" ';
    end
    else if self.Tag IN [1,2] then
      DataINI          := ' AND T1.TRC_PAGAMENTO>="'+MesDia(mskDataINI.Text)+'" '
    else if self.Tag = 3 then //Comissão Completo
    Begin
      DataINI          := ' AND PDV.PDV_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'" ';
      DataINITroca     := ' AND TRO.TRO_DATA>="'+MesDia(mskDataINI.Text)+'" ';
      DataINIDevolvido := ' AND PDV.PDV_DT_DEVOLUCAO>="'+MesDia(mskDataINI.Text)+'" ';
    end;
  end;

  if VerificaDataBranco(mskDataFIM.Text)then
  Begin
    sFiltros := sFiltros + '(DtFIM:'+mskDataFIM.Text+')';
    if self.tag = 0 then
    Begin
      DataFIM          := ' AND T2.PDV_DT_ENTREGA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      DataFIMTroca     := ' AND T1.TRO_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      DataFIMTroca2    := ' AND T3.PDV_DT_ENTREGA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      DataFIMAlterado  := ' AND T1.PDV_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      DataFIMDevolvido := ' AND T1.PDV_DT_DEVOLUCAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
    end
    else if self.Tag in [1,2] then
      DataFIM :=          ' AND T1.TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if self.Tag = 3 then //Comissão Completo
    Begin
      DataFIM          := ' AND PDV.PDV_DT_ENTREGA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      DataFIMTroca     := ' AND TRO.TRO_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      DataFIMDevolvido := ' AND PDV.PDV_DT_DEVOLUCAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
    end;
  end;

  if (ckbCodigoVEN.Checked) then
  Begin
    if (dblVendedor.Text = '') then
      Raise exception.Create('Vendedor inválido!');
    if self.tag = 0 then   //Comissão Normal
      CdFUN      := ' AND (T1.FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+') '
    else if self.tag = 1 then//Comissão Títulos rpt_Comissão2
      CdFUN := ' AND (T2.FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+') '
    else if self.tag = 2 then//Comissão Títulos Motical
      CdFUN := ' AND (T1.TRC_TIPO_PEDIDO<>2 '+
        ' AND (T1.PDV_CODIGO IN (SELECT I10.PDV_CODIGO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA I10 '+
        ' WHERE I10.FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+
        ' AND I10.CNC_CODIGO=T1.CNC_CODIGO) '+
        ' OR T1.PDV_CODIGO IN (SELECT P10.PDV_CODIGO '+
        ' FROM PACOTE_DE_VENDA P10 '+
        ' WHERE P10.FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+
        ' AND P10.CNC_CODIGO=T1.CNC_CODIGO)) '+
        ' OR (T1.TRC_TIPO_PEDIDO=2 AND T1.PDV_CODIGO IN (SELECT P10.PCR_CODIGO '+
        ' FROM PACOTE_DE_CREDITO P10 '+
        ' WHERE FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+
        ' AND P10.CNC_CODIGO=T1.CNC_CODIGO))) '
    else if self.Tag = 3 then //Comissão Completo
    Begin
      CdFUN    := ' AND (IPV.FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+') ';
      CdFUNITO := ' AND (ITO.FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+') ';
    end;
    sFiltros := sFiltros + '(VENDEDOR:'+dblVendedor.Text+')';
  end;

  if ckbCodigoPDV.Checked then
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Begin
      edtCodigoPDV.SetFocus;
      raise Exception.Create('Código do pedido inválido!');
    end
    else
    Begin
      CdPDV := ' AND (PDV.PDV_CODIGO='+edtCodigoPDV.Text+') ';
      sFiltros := sFiltros + '(PDV:'+edtCodigoPDV.Text+')';
    end;

  if ckbCodigoFPE.Checked then
    if not VerificaInteiroBranco(edtCodigoFPE.Text) then
    Begin
      edtCodigoFPE.SetFocus;
      raise Exception.Create('Código do Faturamento Pendente inválido!');
    end
    else
    Begin
      CdFPE := ' AND (PDV.FPE_CODIGO='+edtCodigoFPE.Text+') ';
      sFiltros := sFiltros + '(FPE:'+edtCodigoFPE.Text+')';
    end;

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Código do cliente inválido!');
    end
    else
    Begin
      CdCLI := ' AND (PDV.CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + '(CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Begin
      edtCodigoPRD.SetFocus;
      raise Exception.Create('Código do Produto inválido!');
    end
    else
    Begin
      CdPRD := ' AND (PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbCodigoFOR.Checked then
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
    Begin
      edtCodigoFOR.SetFocus;
      raise Exception.Create('Código do Fornecedor inválido!');
    end
    else
    Begin
      CdFOR := ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
               '                    FROM PRODUTO '+
               '                    WHERE FOR_CODIGO='+edtCodigoFOR.Text+') ';
      sFiltros := sFiltros + '(FOR:'+edtCodigoFOR.Text+')';
    end;

  if ckbCodigoAGF.Checked then
  Begin
    if self.tag = 0 then //Comissão de Vendas
    Begin
      if cmbCodigoAGF.ItemIndex = 0 then //igual
        CdAGF := ' AND (T2.AGF_CODIGO='+IntToStr(dblCodigoAGF.KeyValue)+') '
      else if cmbCodigoAGF.ItemIndex = 1 then //Diferente
        CdAGF := ' AND (T2.AGF_CODIGO<>'+IntToStr(dblCodigoAGF.KeyValue)+') '
    end
    else if self.tag = 1 then //Comissão de Títulos
    Begin
      if cmbCodigoAGF.ItemIndex = 0 then //igual
        CdAGF := ' AND (T3.AGF_CODIGO='+IntToStr(dblCodigoAGF.KeyValue)+') '
      else if cmbCodigoAGF.ItemIndex = 1 then //Diferente
        CdAGF := ' AND (T3.AGF_CODIGO<>'+IntToStr(dblCodigoAGF.KeyValue)+') ';
    end
    else if self.tag = 3 then //Comissão de Vendas Completo
    Begin
      if cmbCodigoAGF.ItemIndex = 0 then //igual
        CdAGF := ' AND (PDV.AGF_CODIGO='+IntToStr(dblCodigoAGF.KeyValue)+') '
      else if cmbCodigoAGF.ItemIndex = 1 then //Diferente
        CdAGF := ' AND (PDV.AGF_CODIGO<>'+IntToStr(dblCodigoAGF.KeyValue)+') ';
    end;
    sFiltros := sFiltros + '(AGF:'+dblCodigoAGF.Text+')';
  end;

  if ckbCodigoCNC.Checked then
  Begin
    if self.Tag in [0,1,2] then
      CdCNC := ' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') '
    else if self.Tag = 3 then //Comissão Completo
      CdCNC := ' AND (PDV.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
    sFiltros := sFiltros + '(CNC:'+dblCodigoCNC.Text+')';
  end;

  if ckbIndicacao.Checked then
  Begin
    if dblIndicacao.Text = '' then
      Raise exception.Create('Indicação inválida!');
    CdIndicacao := ' AND EXISTS (SELECT PDV_CODIGO '+
      ' FROM DETALHE_DE_PEDIDO_DE_VENDA DPV '+
      ' WHERE DPV.FUN_CODIGO_1='+IntToStr(dblIndicacao.KeyValue)+
      ' AND DPV.CNC_CODIGO=PDV.CNC_CODIGO '+
      ' AND DPV.PDV_CODIGO=PDV.PDV_CODIGO) ';
    sFiltros := sFiltros + '(Ind/Promotor(a):'+dblIndicacao.Text+')';
  end;

  if ckbPromotor.Checked then
  Begin
    if dblPromotor.Text = '' then
      Raise exception.Create('Promotor(a) inválido(a)!');
    CdPromotor := ' AND EXISTS (SELECT CLI.CLI_CODIGO '+
      ' FROM CLIENTE CLI '+
      ' WHERE CLI.FUN_CODIGO='+IntToStr(dblPromotor.KeyValue)+
      ' AND CLI.CNC_CODIGO=PDV.CNC_CLIENTE '+
      ' AND CLI.CLI_CODIGO=PDV.CLI_CODIGO) ';
    sFiltros := sFiltros + '(Promotor(a):'+dblPromotor.Text+')';
  end;

  if ckbSuperior.Checked then
  Begin
    if DM.Configuracao1.Empresa = empHOPE then
    Begin
      ExecutaSQL(DM.QR_Comandos, 'UPDATE CLIENTE SET '+
        ' CLI_CONJUGE=0 '+
        ' WHERE CLI_CONJUGE="." '+
        ' OR LEN(CLI_CONJUGE)>=4 '+
        ' OR CLI_CONJUGE IS NULL '+
        ' OR CLI_CONJUGE=""');
    end;

    if dblSuperior.Text = '' then
    Begin
      sSuperior := ' AND EXISTS (SELECT CLI.CLI_CODIGO '+
        ' FROM CLIENTE CLI, FUNCIONARIO FUN '+
        ' WHERE FUN.FUN_SUPERIOR=0 '+
        ' AND CLI.CLI_CONJUGE=FUN.FUN_CODIGO '+
        ' AND CLI.CNC_CODIGO=PDV.CNC_CLIENTE '+
        ' AND CLI.CLI_CODIGO=PDV.CLI_CODIGO) ';
      sFiltros := sFiltros + '(Superior:0)';
    end
    else
    Begin
      sSuperior := ' AND EXISTS (SELECT CLI.CLI_CODIGO '+
        ' FROM CLIENTE CLI, FUNCIONARIO FUN '+
        ' WHERE FUN.FUN_SUPERIOR='+IntToStr(dblSuperior.KeyValue)+
        ' AND CLI.CLI_CONJUGE=FUN.FUN_CODIGO '+
        ' AND CLI.CNC_CODIGO=PDV.CNC_CLIENTE '+
        ' AND CLI.CLI_CODIGO=PDV.CLI_CODIGO) ';
      sFiltros := sFiltros + '(Superior:'+dblSuperior.Text+')';
    end;
  end;

  if ckbSomenteCreditos.Checked then
    sFiltros := sFiltros + '(Creditos)';

  if ckbSomenteDebitos.Checked then
    sFiltros := sFiltros + '(Debitos)';

  if ckbSomenteLinha.Checked then
  Begin
    if self.tag = 0 then
      sSomenteLinha := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE T1.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND (PRD.PRD_FORA_DE_LINHA=0 '+
        ' OR PRD.PRD_FORA_DE_LINHA IS NULL)) '
    else if self.Tag IN [1,2] then
      sSomenteLinha := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE T2.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND (PRD.PRD_FORA_DE_LINHA=0 '+
        ' OR PRD.PRD_FORA_DE_LINHA IS NULL)) '
    else if self.Tag = 3 then //Comissão Completo
    Begin
      sSomenteLinha := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE IPV.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND (PRD.PRD_FORA_DE_LINHA=0 '+
        ' OR PRD.PRD_FORA_DE_LINHA IS NULL)) ';
      sSomenteLinhaITO := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE ITO.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND (PRD.PRD_FORA_DE_LINHA=0 '+
        ' OR PRD.PRD_FORA_DE_LINHA IS NULL)) ';
    end;
    sFiltros := sFiltros + '(Linha)';
  end
  else if ckbSomenteForaLinha.Checked then
  Begin
    if self.tag = 0 then
      sSomenteLinha := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE T1.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND PRD.PRD_FORA_DE_LINHA=1) '
    else if self.Tag IN [1,2] then
      sSomenteLinha := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE T2.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND PRD.PRD_FORA_DE_LINHA=1) '
    else if self.Tag = 3 then //Comissão Completo
    Begin
      sSomenteLinha := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE IPV.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND PRD.PRD_FORA_DE_LINHA=1) ';
      sSomenteLinhaITO := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE ITO.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND PRD.PRD_FORA_DE_LINHA=1) ';
    end;
    sFiltros := sFiltros + '(ForaLinha)';
  end;

  if ckbSomenteCatalogo.Checked then
  Begin
    if self.tag = 0 then
      sSomenteCatalogo := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE T1.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND PRD.PRD_CATALOGO=1) '
    else if self.Tag IN [1,2] then
      sSomenteCatalogo := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE T2.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND PRD.PRD_CATALOGO=1) '
    else if self.Tag = 3 then //Comissão Completo
    Begin
      sSomenteCatalogo := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE IPV.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND PRD.PRD_CATALOGO=1) ';
      sSomenteCatalogoITO := ' AND EXISTS (SELECT PRD_CODIGO '+
        ' FROM PRODUTO PRD '+
        ' WHERE ITO.PRD_CODIGO=PRD.PRD_CODIGO '+
        ' AND PRD.PRD_CATALOGO=1) ';
    end;
    sFiltros := sFiltros + '(Catalogo)';
  end;

  if ckbServicoProducao.Checked then
  Begin
    sServicoProducao    := ' AND PRD.SGP_CODIGO IN ('+IntToStr(DM.Configuracao1.Laboratorio)+','+IntToStr(DM.Configuracao1.Montagem)+') ';
    sFiltros := sFiltros + '(PorProducao)';
  end;

  if ckbMetaPeriodo.Checked then
  Begin
    if not VerificaFloatBranco(edtMetaPeriodo.Text) then
      Raise exception.Create('Meta do Período inválida!');
    sMetaPeriodo := format('%.2f',[StrToFloat(edtMetaPeriodo.Text)]);
    sFiltros := sFiltros + '(Meta:'+sMetaPeriodo+')';
  end
  else
    sMetaPeriodo := '0,00';

  If self.tag = 0 then
  begin
    Application.CreateForm(Trpt_Comissao,rpt_Comissao);
    with rpt_Comissao do
    Begin
      Tag := 0;

      zrlFiltros.Caption := sFiltros;

      SZRGroup1.Height := 0;
      if ckbCodigoCNC.Checked then
        SZRBand1.Height := 0;
      if chk_sintetico.Checked then
      Begin
        zrb_detalhe.Height:=0;
        ZRGroup1.Height:=1;
        ZRLabel5.Width:=78;
        ZRLabel24.Width:=78;
        ZRLabel11.Width:=78;
        ZRLabel8.Width:=78;
        ZRLabel15.Width:=78;
        report.Width:=80;
        ZRLabel11.Enabled:=False;
      end
      else
        ZRGroup1.ForceNewPage := True;
      Funcionario1.Open;
      Produto1.Open;
      Total:=0;

      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
        ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
        ' WHERE T2.PDV_SITUACAO IN (4,8) '+
        DataINI+DataFIM+CdFUN+CdCNC+CdAGF+sSomenteLinha+sSomenteCatalogo+
        ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T1.PDV_CODIGO = t2.PDV_CODIGO '+
        ' ORDER BY t1.CNC_CODIGO,t1.FUN_CODIGO,t1.PDV_CODIGO ASC';

      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');

      report.Preview;
      Close;
    end;
  end
  //Comissão de Venda Esp. Título
  else if self.tag=1 then
  Begin
    Application.CreateForm(Trpt_Comissao2,rpt_Comissao2);
    with rpt_Comissao2 do
    Begin
      Tag := 0;

      zrlFiltros.Caption := sFiltros;

      if chk_sintetico.Checked then
        zrb_detalhe.Height:=0;


      if ckbTotalParcela.Checked then
      begin
        bTotalParcela := true;
        ZRBand5.Height := 9
      end
      else
      begin
        bTotalParcela := false;
        ZRBand5.Height := 4;
      end;

      Total:=0;

      if self.ckbCodigoVEN.Checked then
      begin
        SZRLabel2.Caption := IntToStr(dblVendedor.KeyValue);
        SZRLabel3.Caption := dblVendedor.Text;
        Entidade.Close;
        Entidade.SQL.Text := 'SELECT T1.*, T4.PDV_TIPO_PAG, T4.FPG_CODIGO '+
          ' FROM TITULO_A_RECEBER T1, PEDIDO_DE_VENDA T4 '+
          ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
          ' AND T1.TRC_SITUACAO=2 '+
          DataINI+DataFIM+
          ' AND T1.PDV_CODIGO=T4.PDV_CODIGO '+
          ' AND T1.CNC_CODIGO=T4.CNC_CODIGO '+
          ' AND EXISTS (SELECT T2.PDV_CODIGO '+
          '   FROM ITEM_DE_PEDIDO_DE_VENDA T2, PEDIDO_DE_VENDA T3 '+
          '   WHERE T3.PDV_CODIGO<>-10 '+
          '   AND T3.PDV_SITUACAO=4 '+
          '   AND T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
              CdFUN+CdAGF+sSomenteLinha+sSomenteCatalogo+
          '   AND T3.PDV_CODIGO=T2.PDV_CODIGO '+
          '   AND T2.CNC_CODIGO=T3.CNC_CODIGO '+
          '   AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
          '   AND T2.PDV_CODIGO=T1.PDV_CODIGO)'+
          ' ORDER BY T1.TRC_PAGAMENTO, T1.TRC_CODIGO ';
        Entidade.Open;    


        if ckbTotalParcela.Checked then
        begin
          QrParcelas.SQL.Text := 'SELECT T1.TRC_SEQUENCIA, SUM(T1.TRC_VALOR_PAGO) AS TOTAL '+
            ' FROM TITULO_A_RECEBER T1, PEDIDO_DE_VENDA T4 '+
            ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
            ' AND T1.TRC_SITUACAO=2 '+
            DataINI+DataFIM+
            ' AND T1.PDV_CODIGO=T4.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=T4.CNC_CODIGO '+
            ' AND EXISTS (SELECT T2.PDV_CODIGO '+
            '   FROM ITEM_DE_PEDIDO_DE_VENDA T2, PEDIDO_DE_VENDA T3 '+
            '   WHERE T3.PDV_CODIGO<>-10 '+
            '   AND T3.PDV_SITUACAO=4 '+
            '   AND T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                CdFUN+CdAGF+sSomenteLinha+sSomenteCatalogo+
            '   AND T3.PDV_CODIGO=T2.PDV_CODIGO '+
            '   AND T2.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
            '   AND T2.PDV_CODIGO=T1.PDV_CODIGO)'+
            ' GROUP BY T1.TRC_SEQUENCIA '+
            ' HAVING T1.TRC_SEQUENCIA IN (''05'', ''06'', ''07'', ''08'', ''09'', ''10'') '+
            ' ORDER BY T1.TRC_SEQUENCIA ';
          QrParcelas.Open;
        end;


        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        Vendedor1.Close;
        Vendedor1.parambyname('FUN_CODIGO').AsInteger := dblVendedor.KeyValue;
        Vendedor1.Open; //Centro de Custo no BeforeOpen
      end;
      report.Preview;
      Close;
    end;
  end
  //Comissão de Venda Esp.
  else if self.tag=2 then
  Begin
    Application.CreateForm(Trpt_ComissaoMotical,rpt_ComissaoMotical);
    with rpt_ComissaoMotical do
    Begin
      if chk_sintetico.Checked then
        zrbDetalhe.Height:=0;

      zrlFiltros.Caption := sFiltros;

      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * '+
        ' FROM TITULO_A_RECEBER T1 '+
        ' WHERE T1.TRC_SITUACAO IN (2,5) '+ //Também Títulos Excluídos para serem extornados
        ' AND T1.PDV_CODIGO>=0 '+ //Pedido -1 é cadastrado do sistema antigo em duplicidade
        CdCNC+DataINI+DataFIM+CdFUN+
        ' ORDER BY T1.CNC_CLIENTE, T1.CLI_CODIGO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');

      report.Preview;
      Close;
    end;
  end
  //Comissão de Venda mostrando todas as vendas e devoluções
  else if self.tag=3 then
  Begin
    if not ckbServicoProducao.Checked then
    Begin
      Application.CreateForm(Trpt_ComissaoVendaCompleto, rpt_ComissaoVendaCompleto);
      with rpt_ComissaoVendaCompleto do
      Begin
        Tag := 0;
        zrlFiltros.Caption := sFiltros;

        if chk_sintetico.Checked then
          zrbDetalhe.Height:=0;

        if not ckbAgruparPorDia.Checked then
        Begin
          zrbGrupoDia.Expression := '';
          zrbGrupoDia.Height := 0;
          zrbRodapeGrupoDia.Height := 0;
        end
        else
          zrbGrupoDia.Expression := 'DATA_ORDEM';

         zrlMeta.Caption := sMetaPeriodo;

        if DM.Configuracao1.Empresa = empEletro then
        Begin
          zrlFaturado1.Enabled := False;
          zrlSinalMais3.Enabled := False;
          zrlFaturado2.Enabled := False;
          zrlSinalIgual3.Enabled := False;
          zrlFaturado.Left := zrlFaturado1.Left;

          zrlDevolvido1.Enabled := False;
          zrlSinalMais5.Enabled := False;
          zrlDevolvido2.Enabled := False;
          zrlSinalIgual5.Enabled := False;
          zrlDevolvido.Left := zrlDevolvido1.Left;

          zrlQtdFaturado1.Enabled := False;
          zrlSinalMais4.Enabled := False;
          zrlQtdFaturado2.Enabled := False;
          zrlSinalIgual4.Enabled := False;
          zrlQtdFaturado.Left := zrlQtdFaturado1.Left;

          zrlQtdDevolvido1.Enabled := False;
          zrlSinalMais6.Enabled := False;
          zrlQtdDevolvido2.Enabled := False;
          zrlSinalIgual6.Enabled := False;
          zrlQtdDevolvido.Left := zrlQtdDevolvido1.Left;

          zrlSaldo1.Enabled := False;
          zrlSinalMais7.Enabled := False;
          zrlSaldo2.Enabled := False;
          zrlSinalIgual7.Enabled := False;
          zrlSaldo.Left := zrlSaldo1.Left;

          zrlComissao1.Enabled := False;
          zrlSinalMais8.Enabled := False;
          zrlComissao2.Enabled := False;
          zrlSinalIgual8.Enabled := False;
          zrlComissao.Left := zrlComissao1.Left;



          zrlFaturadoTotal1.Enabled := False;
          zrlSinalMais9.Enabled := False;
          zrlFaturadoTotal2.Enabled := False;
          zrlSinalIgual9.Enabled := False;
          zrlFaturadoTotal.Left := zrlFaturadoTotal1.Left;

          zrlDevolvidoTotal1.Enabled := False;
          zrlSinalMais10.Enabled := False;
          zrlDevolvidoTotal2.Enabled := False;
          zrlSinalIgual10.Enabled := False;
          zrlDevolvidoTotal.Left := zrlDevolvidoTotal1.Left;

          zrlTotalQtdFaturado1.Enabled := False;
          zrlSinalMais11.Enabled := False;
          zrlTotalQtdFaturado2.Enabled := False;
          zrlSinalIgual11.Enabled := False;
          zrlTotalQtdFaturado.Left := zrlTotalQtdFaturado1.Left;

          zrlTotalQtdDevolvido1.Enabled := False;
          zrlSinalMais12.Enabled := False;
          zrlTotalQtdDevolvido2.Enabled := False;
          zrlSinalIgual12.Enabled := False;
          zrlTotalQtdDevolvido.Left := zrlTotalQtdDevolvido1.Left;

          zrlTotalSaldo1.Enabled := False;
          zrlSinalMais13.Enabled := False;
          zrlTotalSaldo2.Enabled := False;
          zrlSinalIgual13.Enabled := False;
          zrlTotalSaldo.Left := zrlTotalSaldo1.Left;

          zrlComissaoTotal1.Enabled := False;
          zrlSinalMais14.Enabled := False;
          zrlComissaoTotal2.Enabled := False;
          zrlSinalIgual14.Enabled := False;
          zrlComissaoTotal.Left := zrlComissaoTotal1.Left;
        end;

        Entidade.Close;

        Entidade.SQL.Text := '';

        //Vendas ainda confirmadas
        if not ckbSomenteDebitos.Checked then
          Entidade.SQL.Text := 'SELECT '+
            ' 0                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, PDV.PDV_DT_ENTREGA, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',PDV.PDV_DT_DEVOLUCAO     AS PDV_DT_DEVOLUCAO '+
            ',IPV.FUN_CODIGO           AS FUN_CODIGO '+
            ',IPV.PRD_CODIGO           AS PRD_CODIGO '+
            ',IPV.IPV_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',IPV.IPV_BONIFICACAO      AS IPV_BONIFICACAO '+
            ',IPV.IPV_PRECO_DESC       AS IPV_PRECO_DESC '+
            ' FROM PEDIDO_DE_VENDA PDV, ITEM_DE_PEDIDO_DE_VENDA IPV '+
            ' WHERE PDV.PDV_SITUACAO=4 '+ //Finalizados
            CdCNC+DataINI+DataFIM+CdFUN+CdPDV+CdAGF+CdFPE+CdCLI+CdPRD+CdFOR+CdIndicacao+CdPromotor+
            sSuperior+sSomenteLinha+sSomenteCatalogo+
            ' AND PDV.CNC_CODIGO=IPV.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=IPV.PDV_CODIGO ';

        //Vendas que foram devolvidas parciais Entregues no Período
        if not ckbSomenteDebitos.Checked then
        Begin
          if Entidade.SQL.Text <> '' then
            Entidade.SQL.Add(' UNION ');
          Entidade.SQL.Add(' SELECT '+
            ' 1                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, PDV.PDV_DT_ENTREGA, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',TRO.TRO_DATA             AS PDV_DT_DEVOLUCAO '+
            ',ITO.FUN_CODIGO           AS FUN_CODIGO '+
            ',ITO.PRD_CODIGO           AS PRD_CODIGO '+
            ',ITO.ITO_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',0                        AS IPV_BONIFICACAO '+
            ',ITO.ITO_VALOR            AS IPV_PRECO_DESC '+
            ' FROM PEDIDO_DE_VENDA PDV, TROCA TRO, ITEM_DE_TROCA ITO '+
            ' WHERE TRO.TRO_SITUACAO=1 '+ //Troca Processada
            CdCNC+DataINI+DataFIM+CdFUNITO+CdPDV+CdAGF+CdFPE+CdCLI+CdPRD+CdFOR+CdIndicacao+CdPromotor+
            sSuperior+sSomenteLinhaITO+sSomenteCatalogoITO+
            ' AND PDV.CNC_CODIGO=TRO.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=TRO.PDV_CODIGO '+
            ' AND TRO.CNC_CODIGO=ITO.CNC_CODIGO '+
            ' AND TRO.TRO_CODIGO=ITO.TRO_CODIGO ');
        end;

        //Vendas que foram devolvidas Total Entregues no Período
        if not ckbSomenteDebitos.Checked then
        Begin
          if Entidade.SQL.Text <> '' then
            Entidade.SQL.Add(' UNION ');
          Entidade.SQL.Add(' SELECT '+
            ' 2                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, PDV.PDV_DT_ENTREGA, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',PDV.PDV_DT_DEVOLUCAO     AS PDV_DT_DEVOLUCAO '+
            ',IPV.FUN_CODIGO           AS FUN_CODIGO '+
            ',IPV.PRD_CODIGO           AS PRD_CODIGO '+
            ',IPV.IPV_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',IPV.IPV_BONIFICACAO      AS IPV_BONIFICACAO '+
            ',IPV.IPV_PRECO_DESC       AS IPV_PRECO_DESC '+
            ' FROM PEDIDO_DE_VENDA PDV, ITEM_DE_PEDIDO_DE_VENDA IPV '+
            ' WHERE PDV.PDV_SITUACAO=8 '+ //Devolvidos
            CdCNC+DataINI+DataFIM+CdFUN+CdPDV+CdAGF+CdFPE+CdCLI+CdPRD+CdFOR+CdIndicacao+CdPromotor+
            sSuperior+sSomenteLinha+sSomenteCatalogo+
            ' AND PDV.CNC_CODIGO=IPV.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=IPV.PDV_CODIGO ');
        end;

        //Vendas que foram devolvidas parciais Realizadas no Período
        if not ckbSomenteCreditos.Checked then
        Begin
          if Entidade.SQL.Text <> '' then
            Entidade.SQL.Add(' UNION ');
          Entidade.SQL.Add(' SELECT '+
            ' 3                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, TRO.TRO_DATA, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',TRO.TRO_DATA             AS PDV_DT_DEVOLUCAO '+
            ',ITO.FUN_CODIGO           AS FUN_CODIGO '+
            ',ITO.PRD_CODIGO           AS PRD_CODIGO '+
            ',ITO.ITO_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',0                        AS IPV_BONIFICACAO '+
            ',ITO.ITO_VALOR            AS IPV_PRECO_DESC '+
            ' FROM PEDIDO_DE_VENDA PDV, TROCA TRO, ITEM_DE_TROCA ITO '+
            ' WHERE TRO.TRO_SITUACAO=1 '+ //Troca Processada
            CdCNC+DataINITroca+DataFIMTroca+CdFUNITO+CdPDV+CdAGF+CdFPE+CdCLI+CdPRD+CdFOR+CdIndicacao+
            CdPromotor+sSuperior+sSomenteLinhaITO+sSomenteCatalogoITO+
            ' AND PDV.CNC_CODIGO=TRO.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=TRO.PDV_CODIGO '+
            ' AND TRO.CNC_CODIGO=ITO.CNC_CODIGO '+
            ' AND TRO.TRO_CODIGO=ITO.TRO_CODIGO ');
        end;

        //Vendas que foram devolvidas Total Realizadas no Período
        if not ckbSomenteCreditos.Checked then
        Begin
          if Entidade.SQL.Text <> '' then
            Entidade.SQL.Add(' UNION ');
          Entidade.SQL.Add(' SELECT '+
            ' 4                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, PDV.PDV_DT_DEVOLUCAO, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',PDV.PDV_DT_DEVOLUCAO     AS PDV_DT_DEVOLUCAO '+
            ',IPV.FUN_CODIGO           AS FUN_CODIGO '+
            ',IPV.PRD_CODIGO           AS PRD_CODIGO '+
            ',IPV.IPV_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',IPV.IPV_BONIFICACAO      AS IPV_BONIFICACAO '+
            ',IPV.IPV_PRECO_DESC       AS IPV_PRECO_DESC '+
            ' FROM PEDIDO_DE_VENDA PDV, ITEM_DE_PEDIDO_DE_VENDA IPV '+
            ' WHERE PDV.PDV_SITUACAO=8 '+ //Devolvidos
            CdCNC+DataINIDevolvido+DataFIMDevolvido+CdFUN+CdPDV+CdAGF+CdFPE+CdCLI+CdPRD+CdFOR+CdIndicacao+
            CdPromotor+sSuperior+sSomenteLinha+sSomenteCatalogo+
            ' AND PDV.CNC_CODIGO=IPV.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=IPV.PDV_CODIGO ');
        end;

        //Ordenar
        if ckbIndicacao.Checked or
           ckbPromotor.Checked then
        Begin
          zrbGrupoFUN.Expression := '';
          zrbGrupoFUN.Height := 0;
          zrbRodapeGrupo.Height := 0;
          if ckbAgruparPorDia.Checked then
            Entidade.SQL.Add(' ORDER BY DATA_ORDEM, PDV.CNC_CODIGO, PDV.PDV_CODIGO ')
          else
            Entidade.SQL.Add(' ORDER BY PDV.CNC_CODIGO, PDV.PDV_CODIGO ');
        end
        else
          if ckbAgruparPorDia.Checked then
            Entidade.SQL.Add(' ORDER BY FUN_CODIGO, DATA_ORDEM, PDV.CNC_CODIGO, PDV.PDV_CODIGO ')
          else
            Entidade.SQL.Add(' ORDER BY FUN_CODIGO, PDV.CNC_CODIGO, PDV.PDV_CODIGO ');
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end
    else //Comissão por Qtd produzida
    Begin
      Application.CreateForm(Trpt_ComissaoVendaCompletoQtd, rpt_ComissaoVendaCompletoQtd);
      with rpt_ComissaoVendaCompletoQtd do
      Begin
        Tag := 0;
        zrlFiltros.Caption := sFiltros;

        if VerificaDataBranco(mskDataINI.Text) then
          sDtINIMeta := mskDataINI.Text
        else
          sDtINIMeta := '01/01/1980';

        if VerificaDataBranco(mskDataFIM.Text) then
          sDtFIMMeta := mskDataFIM.Text
        else
          sDtFIMMeta := '31/12/2050';

        Funcionario1.Close;
        Funcionario1.ParamByName('FUN_CODIGO').asInteger := 10; //Código da Diana Laboratório
        Funcionario1.Open;

        if chk_sintetico.Checked then
        Begin
          zrbDetalhe.Height:=0;
        end;

        if ckbSuperior.Checked then
        Begin
        end;


         zrlMeta.Caption := sMetaPeriodo;

        Entidade.Close;

        Entidade.SQL.Text := '';

        //Vendas ainda confirmadas
        if not ckbSomenteDebitos.Checked then
          Entidade.SQL.Text := 'SELECT '+
            ' 0                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, PDV.PDV_DT_ENTREGA, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',PDV.PDV_DT_DEVOLUCAO     AS PDV_DT_DEVOLUCAO '+
            ',IPV.FUN_CODIGO           AS FUN_CODIGO '+
            ',IPV.PRD_CODIGO           AS PRD_CODIGO '+
            ',IPV.IPV_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',IPV.IPV_BONIFICACAO      AS IPV_BONIFICACAO '+
            ',IPV.IPV_PRECO_DESC       AS IPV_PRECO_DESC '+
            ',PRD.SGP_CODIGO           AS SGP_CODIGO '+
            ' FROM PEDIDO_DE_VENDA PDV '+
            ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA IPV '+
            ' ON PDV.PDV_SITUACAO=4 '+ //Finalizados
            CdCNC+DataINI+DataFIM+CdFUN+CdPDV+CdAGF+CdFPE+CdCLI+CdPRD+CdFOR+CdIndicacao+CdPromotor+
            sSuperior+sSomenteLinha+sSomenteCatalogo+
            ' AND PDV.CNC_CODIGO=IPV.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=IPV.PDV_CODIGO '+

            ' INNER JOIN PRODUTO PRD '+
            ' ON IPV.PRD_CODIGO=PRD.PRD_CODIGO '+
            sServicoProducao;

        //Vendas que foram devolvidas parciais Entregues no Período
        if not ckbSomenteDebitos.Checked then
        Begin
          if Entidade.SQL.Text <> '' then
            Entidade.SQL.Add(' UNION ');
          Entidade.SQL.Add(' SELECT '+
            ' 1                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, PDV.PDV_DT_ENTREGA, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',TRO.TRO_DATA             AS PDV_DT_DEVOLUCAO '+
            ',ITO.FUN_CODIGO           AS FUN_CODIGO '+
            ',ITO.PRD_CODIGO           AS PRD_CODIGO '+
            ',ITO.ITO_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',0                        AS IPV_BONIFICACAO '+
            ',ITO.ITO_VALOR            AS IPV_PRECO_DESC '+
            ',PRD.SGP_CODIGO           AS SGP_CODIGO '+
            ' FROM PEDIDO_DE_VENDA PDV '+
            ' INNER JOIN TROCA TRO '+
            ' ON TRO.TRO_SITUACAO=1 '+ //Troca Processada
            CdCNC+DataINI+DataFIM+CdPDV+CdAGF+CdFPE+CdCLI+CdIndicacao+CdPromotor+
            sSuperior+
            ' AND PDV.CNC_CODIGO=TRO.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=TRO.PDV_CODIGO '+

            ' INNER JOIN ITEM_DE_TROCA ITO '+
            ' ON ITO.PRD_CODIGO<>-1 '+
            CdPRD+CdFOR+sSomenteLinhaITO+sSomenteCatalogoITO+CdFUNITO+
            ' AND TRO.CNC_CODIGO=ITO.CNC_CODIGO '+
            ' AND TRO.TRO_CODIGO=ITO.TRO_CODIGO '+

            ' INNER JOIN PRODUTO PRD '+
            ' ON ITO.PRD_CODIGO=PRD.PRD_CODIGO '+
            sServicoProducao);
        end;

        //Vendas que foram devolvidas Total Entregues no Período
        if not ckbSomenteDebitos.Checked then
        Begin
          if Entidade.SQL.Text <> '' then
            Entidade.SQL.Add(' UNION ');
          Entidade.SQL.Add(' SELECT '+
            ' 2                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, PDV.PDV_DT_ENTREGA, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',PDV.PDV_DT_DEVOLUCAO     AS PDV_DT_DEVOLUCAO '+
            ',IPV.FUN_CODIGO           AS FUN_CODIGO '+
            ',IPV.PRD_CODIGO           AS PRD_CODIGO '+
            ',IPV.IPV_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',IPV.IPV_BONIFICACAO      AS IPV_BONIFICACAO '+
            ',IPV.IPV_PRECO_DESC       AS IPV_PRECO_DESC '+
            ',PRD.SGP_CODIGO           AS SGP_CODIGO '+
            ' FROM PEDIDO_DE_VENDA PDV '+
            ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA IPV '+
            ' ON PDV.PDV_SITUACAO=8 '+ //Devolvidos
            CdCNC+DataINI+DataFIM+CdFUN+CdPDV+CdAGF+CdFPE+CdCLI+CdPRD+CdFOR+CdIndicacao+CdPromotor+
            sSuperior+sSomenteLinha+sSomenteCatalogo+
            ' AND PDV.CNC_CODIGO=IPV.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=IPV.PDV_CODIGO '+

            ' INNER JOIN PRODUTO PRD '+
            ' ON IPV.PRD_CODIGO=PRD.PRD_CODIGO '+
            sServicoProducao);
        end;

        //Vendas que foram devolvidas parciais Realizadas no Período
        if not ckbSomenteCreditos.Checked then
        Begin
          if Entidade.SQL.Text <> '' then
            Entidade.SQL.Add(' UNION ');
          Entidade.SQL.Add(' SELECT '+
            ' 3                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, TRO.TRO_DATA, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',TRO.TRO_DATA             AS PDV_DT_DEVOLUCAO '+
            ',ITO.FUN_CODIGO           AS FUN_CODIGO '+
            ',ITO.PRD_CODIGO           AS PRD_CODIGO '+
            ',ITO.ITO_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',0                        AS IPV_BONIFICACAO '+
            ',ITO.ITO_VALOR            AS IPV_PRECO_DESC '+
            ',PRD.SGP_CODIGO           AS SGP_CODIGO '+
            ' FROM PEDIDO_DE_VENDA PDV '+
            ' INNER JOIN TROCA TRO '+
            ' ON TRO.TRO_SITUACAO=1 '+ //Troca Processada
            CdCNC+DataINITroca+DataFIMTroca+CdPDV+CdAGF+CdFPE+CdCLI+CdIndicacao+
            CdPromotor+sSuperior+
            ' AND PDV.CNC_CODIGO=TRO.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=TRO.PDV_CODIGO '+

            ' INNER JOIN ITEM_DE_TROCA ITO '+
            ' ON ITO.PRD_CODIGO<>-1 '+
            CdPRD+CdFOR+sSomenteLinhaITO+sSomenteCatalogoITO+CdFUNITO+
            ' AND TRO.CNC_CODIGO=ITO.CNC_CODIGO '+
            ' AND TRO.TRO_CODIGO=ITO.TRO_CODIGO '+

            ' INNER JOIN PRODUTO PRD '+
            ' ON ITO.PRD_CODIGO=PRD.PRD_CODIGO '+
            sServicoProducao);
        end;

        //Vendas que foram devolvidas Total Realizadas no Período
        if not ckbSomenteCreditos.Checked then
        Begin
          if Entidade.SQL.Text <> '' then
            Entidade.SQL.Add(' UNION ');
          Entidade.SQL.Add(' SELECT '+
            ' 4                        AS TIPO '+       //0-Venda; 1-DevParcialEntregues; 2-DevTotalEntregues; 3-DevParcialRealizadas; 4=DevTotalRealizadas
            ',CONVERT(CHAR, PDV.PDV_DT_DEVOLUCAO, 2) AS DATA_ORDEM '+
            ',PDV.CNC_CODIGO           AS CNC_CODIGO '+
            ',PDV.PDV_CODIGO           AS PDV_CODIGO '+
            ',PDV.PDV_DATA_HORA        AS PDV_DATA_HORA '+
            ',PDV.PDV_DT_ENTREGA       AS PDV_DT_ENTREGA '+
            ',PDV.PDV_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
            ',PDV.PDV_DT_DEVOLUCAO     AS PDV_DT_DEVOLUCAO '+
            ',IPV.FUN_CODIGO           AS FUN_CODIGO '+
            ',IPV.PRD_CODIGO           AS PRD_CODIGO '+
            ',IPV.IPV_QUANTIDADE       AS IPV_QUANTIDADE '+
            ',IPV.IPV_BONIFICACAO      AS IPV_BONIFICACAO '+
            ',IPV.IPV_PRECO_DESC       AS IPV_PRECO_DESC '+
            ',PRD.SGP_CODIGO           AS SGP_CODIGO '+
            ' FROM PEDIDO_DE_VENDA PDV '+
            ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA IPV '+
            ' ON PDV.PDV_SITUACAO=8 '+ //Devolvidos
            CdCNC+DataINIDevolvido+DataFIMDevolvido+CdFUN+CdPDV+CdAGF+CdFPE+CdCLI+CdPRD+CdFOR+CdIndicacao+
            CdPromotor+sSuperior+sSomenteLinha+sSomenteCatalogo+
            ' AND PDV.CNC_CODIGO=IPV.CNC_CODIGO '+
            ' AND PDV.PDV_CODIGO=IPV.PDV_CODIGO '+

            ' INNER JOIN PRODUTO PRD '+
            ' ON IPV.PRD_CODIGO=PRD.PRD_CODIGO '+
            sServicoProducao);
        end;

        //Ordenar
        if ckbIndicacao.Checked or
           ckbPromotor.Checked then
        Begin
          if ckbAgruparPorDia.Checked then
            Entidade.SQL.Add(' ORDER BY DATA_ORDEM, PDV.CNC_CODIGO, PDV.PDV_CODIGO ')
          else
            Entidade.SQL.Add(' ORDER BY PDV.CNC_CODIGO, PDV.PDV_CODIGO ');
        end
        else
          if ckbAgruparPorDia.Checked then
            Entidade.SQL.Add(' ORDER BY DATA_ORDEM, PDV.CNC_CODIGO, PDV.PDV_CODIGO ')
          else
            Entidade.SQL.Add(' ORDER BY PDV.CNC_CODIGO, PDV.PDV_CODIGO ');
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end;
  end;
end;

procedure Trpt_DataVend.bitFecharClick(Sender: TObject);
begin
  mskDataINI.Clear;
  mskDataFIM.Clear;
  mskDataINI.SetFocus;
  DataOk := False;
  Close;
end;


procedure Trpt_DataVend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Vendedor1.Close;
  Action := caFree;
end;

procedure Trpt_DataVend.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if self.tag = 1 then
  Begin
    ckbCodigoVEN.Checked:=True;
    ckbCodigoCNC.Checked := True;
    ckbCodigoCNC.Enabled := False;
  end;

  if self.Tag <> 3 then
  Begin
    ckbIndicacao.Enabled := False;
    ckbPromotor.Enabled  := False;
    ckbSomenteCreditos.Enabled  := False;
    ckbSomenteDebitos.Enabled   := False;
    ckbServicoProducao.Enabled  := False;
  end;
  mskDataINI.SetFocus;
end;

procedure Trpt_DataVend.ckbCodigoAGFClick(Sender: TObject);
begin
  if ckbCodigoAGF.Checked then
  Begin
    AgenteFin1.Open;
    cmbCodigoAGF.Enabled := True;
    cmbCodigoAGF.Color   := clWindow;
    if self.tag = 0 then
      cmbCodigoAGF.ItemIndex := 1
    else
      cmbCodigoAGF.ItemIndex := 0;
    dblCodigoAGF.Color:=clWindow;
    dblCodigoAGF.Enabled:=True;
    dblCodigoAGF.KeyValue:=AgenteFin1.CodigoAGF;
    dblCodigoAGF.SetFocus;
  end
  else
  Begin
    AgenteFin1.Close;
    cmbCodigoAGF.Enabled := False;
    cmbCodigoAGF.Color   := AlteraCorComponentes;
    cmbCodigoAGF.ItemIndex := -1;
    dblCodigoAGF.Color:=AlteraCorComponentes;
    dblCodigoAGF.KeyValue:=-1;
    dblCodigoAGF.Enabled:=False;
  end;
end;

procedure Trpt_DataVend.ckbCodigoCNCClick(Sender: TObject);
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

procedure Trpt_DataVend.ckbCodigoPDVClick(Sender: TObject);
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

procedure Trpt_DataVend.ckbIndicacaoClick(Sender: TObject);
begin
  if ckbIndicacao.Checked then
  Begin
    with Vendedor2 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM FUNCIONARIO '+
        ' WHERE FUN_SITUACAO <> 1 '+
      ' AND (FUN_APARECE_VENDAS=1 '+
      '  OR FUN_APARECE_SERVICOS=1) ';
      if ckbCodigoCNC.Checked then
        SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+
                '  OR  FUN_TODOS_CENTROS=1) ');
      if DM.Configuracao1.Empresa = empLuciano then
        SQL.Add(' AND FUN_FUNCAO=4220 ');
      SQL.Add(' ORDER BY FUN_APELIDO ASC ');
      Open;
    end;
    dblIndicacao.Color:=clWindow;
    dblIndicacao.Enabled:=True;
    dblIndicacao.KeyValue := Vendedor2.CodigoFUN;
    dblIndicacao.SetFocus;
  end
  else
  Begin
    Vendedor2.Close;
    dblIndicacao.Color:=AlteraCorComponentes;
    dblIndicacao.KeyValue:=-1;
    dblIndicacao.Enabled:=False;
  end;
end;

procedure Trpt_DataVend.ckbPromotorClick(Sender: TObject);
begin
  if ckbPromotor.Checked then
  Begin
    with Vendedor3 do
    Begin
      Close;
      if DM.Configuracao1.empresa = empHope then
      Begin
        SQL.Text := 'SELECT * FROM FUNCIONARIO '+
          ' WHERE FUN_SITUACAO <> 1 '+
          ' AND FUN_FUNCAO = 4400 ';
        if ckbCodigoCNC.Checked then
          SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+
                  '  OR  FUN_TODOS_CENTROS=1) ');
        SQL.Add(' ORDER BY FUN_APELIDO ASC ');
      end
      else
      Begin
        SQL.Text := 'SELECT * FROM FUNCIONARIO '+
          ' WHERE FUN_SITUACAO <> 1 '+
          ' AND (FUN_APARECE_VENDAS=1 '+
          '  OR FUN_APARECE_SERVICOS=1) ';
        if ckbCodigoCNC.Checked then
          SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+
                  '  OR  FUN_TODOS_CENTROS=1) ');
        SQL.Add(' ORDER BY FUN_APELIDO ASC ');
      end;
      Open;
    end;
    dblPromotor.Color:=clWindow;
    dblPromotor.Enabled:=True;
    dblPromotor.KeyValue := Vendedor3.CodigoFUN;
    dblPromotor.SetFocus;
  end
  else
  Begin
    Vendedor3.Close;
    dblPromotor.Color:=AlteraCorComponentes;
    dblPromotor.KeyValue:=-1;
    dblPromotor.Enabled:=False;
  end;
end;

procedure Trpt_DataVend.ckbCodigoVENClick(Sender: TObject);
begin
  if ckbCodigoVEN.Checked then
  Begin
    with Vendedor1 do
    Begin
      Close;
      SQL.Text := 'SELECT * '+
        ' FROM FUNCIONARIO '+
        //' WHERE (FUN_APARECE_VENDAS=1 '+
        //'  OR FUN_APARECE_SERVICOS=1) '+
        ' WHERE FUN_FUNCAO IN (56,58,45)';
        if ckbCodigoCNC.Checked then
          SQL.ADD(' AND (CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+
                  '  OR  FUN_TODOS_CENTROS=1) ');
        SQL.ADD(' ORDER BY FUN_APELIDO ');
      Open;
    end;
    dblVendedor.Color:=clWindow;
    dblVendedor.Enabled:=True;
    dblVendedor.KeyValue := Vendedor1.CodigoFUN;
    dblVendedor.SetFocus;
  end
  else
  Begin
    Vendedor1.Close;
    dblVendedor.Color:=AlteraCorComponentes;
    dblVendedor.Enabled:=False;
    dblVendedor.KeyValue := 0;
  end;
end;

procedure Trpt_DataVend.ckbCodigoCLIClick(Sender: TObject);
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
    edtCodigoCLI.Clear;
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure Trpt_DataVend.ckbSomenteCreditosClick(Sender: TObject);
begin
  if ckbSomenteCreditos.Checked then
    ckbSomenteDebitos.Checked := False;
end;

procedure Trpt_DataVend.ckbSomenteDebitosClick(Sender: TObject);
begin
  if ckbSomenteDebitos.Checked then
    ckbSomenteCreditos.Checked := False;
end;

procedure Trpt_DataVend.ckbCodigoFPEClick(Sender: TObject);
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
    edtCodigoFPE.Clear;
    edtCodigoFPE.Enabled:=False;
  end;
end;

procedure Trpt_DataVend.ckbSuperiorClick(Sender: TObject);
begin
  if ckbSuperior.Checked then
  Begin
    with Vendedor4 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM FUNCIONARIO '+
        ' WHERE FUN_SITUACAO <> 1 ';
      if ckbCodigoCNC.Checked then
        SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+
                '  OR  FUN_TODOS_CENTROS=1) ');
      SQL.Add(' ORDER BY FUN_APELIDO ASC ');
      Open;
    end;
    dblSuperior.Color:=clWindow;
    dblSuperior.Enabled:=True;
    dblSuperior.SetFocus;
  end
  else
  Begin
    Vendedor4.Close;
    dblSuperior.Color:=AlteraCorComponentes;
    dblSuperior.KeyValue:=-1;
    dblSuperior.Enabled:=False;
  end;
end;

procedure Trpt_DataVend.ckbSomenteLinhaClick(Sender: TObject);
begin
  if ckbSomenteLinha.Checked then
    ckbSomenteForaLinha.Checked := False;
end;

procedure Trpt_DataVend.ckbSomenteForaLinhaClick(Sender: TObject);
begin
  if ckbSomenteForaLinha.Checked then
    ckbSomenteLinha.Checked := False;
end;

procedure Trpt_DataVend.ckbCodigoPRDClick(Sender: TObject);
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
    edtCodigoPRD.Clear;
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure Trpt_DataVend.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=66;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=66;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure Trpt_DataVend.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=48;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure Trpt_DataVend.ckbMetaPeriodoClick(Sender: TObject);
begin
  if ckbMetaPeriodo.Checked then
  Begin
    edtMetaPeriodo.Color:=clWindow;
    edtMetaPeriodo.Enabled:=True;
    edtMetaPeriodo.SetFocus;
  end
  else
  Begin
    edtMetaPeriodo.Color:=AlteraCorComponentes;
    edtMetaPeriodo.Clear;
    edtMetaPeriodo.Enabled:=False;
  end;
end;

procedure Trpt_DataVend.ckbServicoProducaoClick(Sender: TObject);
begin
  if ckbServicoProducao.Checked then
  Begin
    ckbAgruparPorDia.Checked := False;
    ckbAgruparPorDia.Enabled := False;
  end
  else
    ckbAgruparPorDia.Enabled := True;
end;

procedure Trpt_DataVend.ckbCodigoFORClick(Sender: TObject);
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
    edtCodigoFOR.Clear;
    edtCodigoFOR.Enabled:=False;
  end;
end;

procedure Trpt_DataVend.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    with fMxSCotaFor do
    Begin
      Fornecedor1.Close;
      Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      Fornecedor1.Open;
      tag:=42;
      ShowModal;
    end;
  end;
end;

end.
