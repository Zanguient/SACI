unit MxSPreRecRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, Db, DBTables, SQuery,
  CentroCusto, Variants;

type
  TfMxSPreRecRec = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataInicial: TMaskEdit;
    mskDataFinal: TMaskEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ckbSomenteNaoRecebidos: TCheckBox;
    ckbCNCDestino: TCheckBox;
    dblCNCDestino: TDBLookupComboBox;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    ckbCNCOrigem: TCheckBox;
    dblCNCOrigem: TDBLookupComboBox;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    edtCodigoPRD: TEdit;
    ckbProduto: TCheckBox;
    ckbSomenteFaturados: TCheckBox;
    edtCodigoFOR: TEdit;
    ckbCodigoFOR: TCheckBox;
    ckbSomenteEmAberto: TCheckBox;
    ckbSemItens: TCheckBox;
    edtNotaFiscal: TEdit;
    ckbNotaFiscal: TCheckBox;
    ckbExibirPreco: TCheckBox;
    cmbExibirPreco: TComboBox;
    edtCodigoTRF: TEdit;
    ckbCodigoTRF: TCheckBox;
    ckbSomenteManual: TCheckBox;
    ckbSomenteAutomatico: TCheckBox;
    Bevel1: TBevel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ckbCNCDestinoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbCNCOrigemClick(Sender: TObject);
    procedure ckbProdutoClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure ckbNotaFiscalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbSemItensClick(Sender: TObject);
    procedure ckbExibirPrecoClick(Sender: TObject);
    procedure ckbCodigoTRFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSPreRecRec: TfMxSPreRecRec;

implementation

uses UPreRecRec, UDM, funcoes, URel_Transferencias, Urpt_Recebimento,
  MxSPediProd, MxSCotaFor, MxSPediProdMotCal;

{$R *.DFM}



procedure TfMxSPreRecRec.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSPreRecRec.BitBtn1Click(Sender: TObject);
var
  mensagem,DataINI,DataFIM,CNC,CNC2,PRD,CdFOR,CdTRF,sEmAberto,sNotaFiscal,sAutomatico,sFiltros:string;
begin
  mensagem:='';
  CNC:='';
  CNC2:='';
  PRD:='';
  CdFOR:='';
  CdTRF:='';
  DataINI := '';
  DataFIM := '';
  sNotaFiscal := '';
  sAutomatico := '';
  sFiltros := '';
  if not VerificaData(mskDataInicial.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13
  else if VerificaDataBranco(mskDataInicial.Text) then
  Begin
    if tag = 0 then
      DataINI := ' AND (T2.PRC_DATA>="'+MesDia(mskDataInicial.Text)+'") '
    else if tag = 1 then
      DataINI := ' AND (T2.TRF_DATA>="'+MesDia(mskDataInicial.Text)+'") '
    else if tag = 2 then
      DataINI := ' AND (T2.REC_DATA>="'+MesDia(mskDataInicial.Text)+'") ';
    sFiltros := sFiltros + '(DtINI:'+mskDataInicial.Text+')';
  end;

  if not VerificaData(mskDataFinal.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13
  else if VerificaDataBranco(mskDataFinal.text) then
  Begin
    if tag = 0 then
      DataFIM := ' AND (T2.PRC_DATA<"'+MesDia(StrToDate(mskDataFinal.Text)+1)+'") '
    else if tag = 1 then
      DataFIM := ' AND (T2.TRF_DATA<"'+MesDia(StrToDate(mskDataFinal.Text)+1)+'") '
    else if tag = 2 then
      DataFIM := ' AND (T2.REC_DATA<"'+MesDia(StrToDate(mskDataFinal.Text)+1)+'") ';
    sFiltros := sFiltros + '(DtFIM:'+mskDataFinal.Text+')';
  end;

  if mensagem<>'' then
    raise exception.Create(mensagem);

  if ckbCNCOrigem.Checked then
  Begin
    if dblCNCOrigem.Text = '' then
      raise Exception.Create('Centro de Custo da origem inválido!')
    else
    Begin
      if tag = 0 then
        CNC2:=' AND (T2.PRC_CNC_ORIGEM='+IntToStr(dblCNCOrigem.KeyValue)+') '
      else if tag = 1 then
        CNC2:=' AND (T2.TRF_CNC_ORIGEM='+IntToStr(dblCNCOrigem.KeyValue)+') '
      else if tag = 2 then
        CNC2:=' AND (T2.REC_CNC_ORIGEM='+IntToStr(dblCNCOrigem.KeyValue)+') ';
      sFiltros := sFiltros + '(Origem:'+dblCNCOrigem.Text+')';
    end;
  end;    

  if ckbCNCDestino.Checked then
  Begin
    if dblCNCDestino.Text = '' then
      raise Exception.Create('Centro de Custo do destino inválido!')
    else
    Begin
      if tag = 0 then
        CNC:=' AND (T2.CNC_CODIGO='+IntToStr(dblCNCDestino.KeyValue)+') '
      else if tag = 1 then
        CNC:=' AND (T2.TRF_CNC_DESTINO='+IntToStr(dblCNCDestino.KeyValue)+') '
      else if tag = 2 then
        CNC:=' AND (T2.CNC_CODIGO='+IntToStr(dblCNCDestino.KeyValue)+') ';
      sFiltros := sFiltros + '(Destino:'+dblCNCDestino.Text+')';
    end;
  end;

  if ckbCodigoTRF.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoTRF.Text) then
      raise Exception.Create('Código da Transferência inválido!')
    else
    Begin
      CdTRF:=' AND (T2.TRF_CODIGO='+edtCodigoTRF.Text+') ';
      sFiltros := sFiltros + '(TRF:'+edtCodigoTRF.Text+')';
    end;
  end;

  if ckbCodigoFOR.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
      raise Exception.Create('Código do Fornecedor inválido!')
    else
    Begin
      CdFOR:=' AND (T1.PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO '+
        ' WHERE FOR_CODIGO='+edtCodigoFOR.Text+')) ';
      sFiltros := sFiltros + '(FOR:'+edtCodigoFOR.Text+')';
    end;
  end;

  if ckbProduto.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      raise Exception.Create('Código do produto inválido!')
    else
    Begin
      PRD:=' AND (T1.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;
  end;

  if ckbSomenteFaturados.Checked then
  Begin
    if ckbNotaFiscal.Checked then
    Begin
      if tag = 0 then
        sNotaFiscal := ' AND (T2.PRC_NOTA_FISCAL LIKE "%'+edtNotaFiscal.Text+'%" ) '
      else
        sNotaFiscal := ' AND (T2.TRF_NOTA_FISCAL LIKE "%'+edtNotaFiscal.Text+'%" ) ';
      sFiltros := sFiltros + '(Nota:'+edtNotaFiscal.Text+')';
    end
    else
    Begin
      if tag = 0 then
        sNotaFiscal := ' AND (T2.PRC_NOTA_FISCAL > 0 ) '
      else
        sNotaFiscal := ' AND (T2.TRF_NOTA_FISCAL > 0 ) ';
      sFiltros := sFiltros + '(Fat.)';
    end;
  end;

  if ckbSomenteEmAberto.Checked then
    if tag = 1 then
    Begin
      sEmAberto := ' AND (T2.TRF_SITUACAO = 0 ) ';
      sFiltros := sFiltros + '(EmAberto)';
    end;

  if ckbSomenteManual.Checked then
  Begin
    sAutomatico := ' AND (T2.TRF_AUTOMATICA = 0 OR T2.TRF_AUTOMATICA IS NULL) ';
    sFiltros := sFiltros + '(Manual)';
  end
  else if ckbSomenteAutomatico.Checked then
  Begin
    sAutomatico := ' AND (T2.TRF_AUTOMATICA = 1) ';
    sFiltros := sFiltros + '(Automatica)';
  end;

  if ckbSomenteNaoRecebidos.Checked then
    sFiltros := sFiltros + '(Pendentes)';


  Dt_ini := mskDataInicial.Text;
  Dt_fim := mskDataFinal.Text;
  if tag = 0 then
  Begin
    Application.CreateForm(Trpt_PreRecRec, rpt_PreRecRec);
    with rpt_PreRecRec do
    Begin
      zrlFiltros.caption := sFiltros;
      if ckbSemItens.Checked then
      Begin
        SZRGroup1.Height := 5;
        zrbDetalhe.Height := 0;
      end;
      SZRLabel1.Caption := mskDataInicial.Text;
      SZRLabel3.Caption := mskDataFinal.Text;
      Item_Pre_Recebimento1.Close;
      //Verifica se é somente não recebidos
      if ckbSomenteNaoRecebidos.Checked then
      Begin
        Item_Pre_Recebimento1.SQL.Text:='SELECT T1.*,T2.* '+
          ' FROM ITEM_DE_PRE_RECEBIMENTO T1, PRE_RECEBIMENTO T2 '+
          ' WHERE T2.PRC_SITUACAO<>1 '+
          CNC+CNC2+CdFOR+PRD+DataINI+DataFIM+sNotaFiscal+
          ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
          ' AND T1.PRC_CODIGO=T2.PRC_CODIGO '+

          //O Campo PRC_CODIGO não é comfiável. Verificar sempre pelo campo REC_COD_ORIGEM

          ' AND NOT EXISTS (SELECT PRC_CODIGO '+
          ' FROM RECEBIMENTO R1 '+
          ' WHERE R1.CNC_CODIGO=T2.CNC_CODIGO '+
          ' AND R1.REC_COD_ORIGEM=T2.PRC_COD_ORIGEM '+
          ' AND R1.REC_CNC_ORIGEM=T2.PRC_CNC_ORIGEM '+
          ' AND R1.REC_TIPO=T2.PRC_TIPO) '+

          ' ORDER BY T1.PRC_CODIGO,T1.IPR_CODIGO ASC';
      end
      else
      Begin
        Item_Pre_Recebimento1.SQL.Text:='SELECT T1.*,T2.* '+
          ' FROM ITEM_DE_PRE_RECEBIMENTO T1, PRE_RECEBIMENTO T2 '+
          ' WHERE T2.PRC_CODIGO<>-10 '+
          CNC+CNC2+CdFOR+PRD+DataINI+DataFIM+sNotaFiscal+
          ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
          ' AND T1.PRC_CODIGO=T2.PRC_CODIGO '+
          ' ORDER BY T1.PRC_CODIGO,T1.IPR_CODIGO ASC';
      end;
      Item_Pre_Recebimento1.Open;
      if Item_Pre_Recebimento1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.preview;
      Close;
    end;
  end
  else if tag = 1 then
  Begin
    Application.CreateForm(Trpt_transferencias, rpt_transferencias);
    with rpt_transferencias do
    Begin
      tag := 0;
      zrlFiltros.Caption := sFiltros;
      if ckbSemItens.Checked then
      Begin
        SZRGroup1.Height := 4;
        zrbDetalhe.Height := 0;
        zrbRodapeGrupo.Height := 0;
        zrbSumario.Height := 0;
        zrlDescPreco.Enabled := False;
        zrlDescTotalItem.Enabled := False;
        zrlPreco.Enabled := False;
        zrlTotalItem.Enabled := False;
      end;
      if not ckbExibirPreco.Checked then
      Begin
        zrbRodapeGrupo.Height := 0;
        zrbSumario.Height := 0;
        zrlDescPreco.Enabled := False;
        zrlDescTotalItem.Enabled := False;
        zrlPreco.Enabled := False;
        zrlTotalItem.Enabled := False;
      end;
      Transferencia1.Close;
      Transferencia1.SQL.Text:='SELECT * '+
          ' FROM ITEM_DE_TRANSFERENCIA T1, TRANSFERENCIA T2 '+
          ' WHERE T2.TRF_CODIGO<>-10 '+
          CNC+CNC2+CdTRF+CdFOR+PRD+sEmAberto+
          DataINI+DataFIM+sNotaFiscal+sAutomatico+
          ' AND T2.TRF_CODIGO=T1.TRF_CODIGO '+
          ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
          ' ORDER BY T1.CNC_CODIGO, T1.TRF_CODIGO ASC';
      Transferencia1.Open;
      if Transferencia1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      Report.Preview;
      Close;
    end;
  end
  else if tag = 2 then
  Begin
    Application.CreateForm(Trpt_recebimentos, rpt_recebimentos);
    with rpt_recebimentos do
    Begin
      zrlFiltros.Caption := sFiltros;
      if ckbSemItens.Checked then
      Begin
        SZRGroup1.Height := 4;
        zrbDetalhe.Height := 0;
      end;

      Recebimento1.Close;
      Recebimento1.SQL.Text:='SELECT * '+
          ' FROM ITEM_DE_RECEBIMENTO T1, RECEBIMENTO T2 '+
          ' WHERE T2.REC_CODIGO<>-10 '+
          CNC+CNC2+CdFOR+PRD+DataINI+DataFIM+
          ' AND T2.REC_CODIGO=T1.REC_CODIGO '+
          ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
          ' ORDER BY T1.REC_CODIGO ASC';
      Recebimento1.Open;
      if Recebimento1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      Report.Preview;
    end;
  end;
end;

procedure TfMxSPreRecRec.ckbCNCDestinoClick(Sender: TObject);
begin
  if ckbCNCDestino.Checked then
  Begin
    CentroCusto1.Open;
    dblCNCDestino.Color:=clWindow;
    dblCNCDestino.Enabled:=True;
    dblCNCDestino.KeyValue := DM.Configuracao1.CodigoCNC;
    dblCNCDestino.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCNCDestino.KeyValue:=-1;
    dblCNCDestino.Color:=AlteraCorComponentes;
    dblCNCDestino.Enabled:=False;
  end;
end;

procedure TfMxSPreRecRec.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if tag IN [1,2] then
  Begin
    ckbSomenteNaoRecebidos.Enabled:=False;
    if tag = 2 then
      ckbNotaFiscal.Enabled := False;
  end;
  if tag <> 1 then
  Begin
    ckbCodigoTRF.Enabled := False;
    ckbSomenteEmAberto.Enabled := False;
    ckbExibirPreco.Enabled := False;
    ckbSomenteManual.Enabled := False;
    ckbSomenteAutomatico.Enabled := False;
  end;
end;

procedure TfMxSPreRecRec.ckbCNCOrigemClick(Sender: TObject);
begin
  if ckbCNCOrigem.Checked then
  Begin
    CentroCusto2.Open;
    dblCNCOrigem.Color:=clWindow;
    dblCNCOrigem.Enabled:=True;
    dblCNCOrigem.KeyValue := DM.Configuracao1.CodigoCNC;
    dblCNCOrigem.SetFocus;
  end
  else
  Begin
    CentroCusto2.Close;
    dblCNCOrigem.KeyValue:=-1;
    dblCNCOrigem.Color:=AlteraCorComponentes;
    dblCNCOrigem.Enabled:=False;
  end;
end;



procedure TfMxSPreRecRec.ckbProdutoClick(Sender: TObject);
begin
  if ckbProduto.Checked then
  Begin
    edtCodigoPRD.color  :=clWindow;
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.color  :=AlteraCorComponentes;
    edtCodigoPRD.Text   :='';
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSPreRecRec.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
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
        Tag:=22;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=22;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfMxSPreRecRec.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.color  :=clWindow;
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.color  :=AlteraCorComponentes;
    edtCodigoFOR.Text   :='';
    edtCodigoFOR.Enabled:=False;
  end;
end;

procedure TfMxSPreRecRec.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoFOR.Text:='';
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    edtCodigoFOR.Clear;
    fMxSCotaFor.tag:=16;
    fMxSCotaFor.ShowModal;
  End;
end;

procedure TfMxSPreRecRec.ckbNotaFiscalClick(Sender: TObject);
begin
  if ckbNotaFiscal.Checked then
  Begin
    edtNotaFiscal.color   :=clWindow;
    edtNotaFiscal.Enabled :=True;
    edtNotaFiscal.SetFocus;
    ckbSomenteFaturados.Checked := True;
  end
  else
  Begin
    edtNotaFiscal.color   :=AlteraCorComponentes;
    edtNotaFiscal.Text    :='';
    edtNotaFiscal.Enabled :=False;
  end;
end;

procedure TfMxSPreRecRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxSPreRecRec.ckbSemItensClick(Sender: TObject);
begin
  if ckbSemItens.Checked then
  Begin
    ckbExibirPreco.Checked := False;
    ckbExibirPreco.Enabled := False;
  end
  else
  Begin
    if tag = 1 then //Rel. de Transferência
      ckbExibirPreco.Enabled := True;
  end;
end;

procedure TfMxSPreRecRec.ckbExibirPrecoClick(Sender: TObject);
begin
  if ckbExibirPreco.Checked then
  Begin
    cmbExibirPreco.Color:=clWindow;
    cmbExibirPreco.Enabled:=True;
    cmbExibirPreco.ItemIndex := 0;
    cmbExibirPreco.SetFocus;
  end
  else
  Begin
    cmbExibirPreco.ItemIndex := -1;
    cmbExibirPreco.Color:=AlteraCorComponentes;
    cmbExibirPreco.Enabled:=False;
  end;
end;

procedure TfMxSPreRecRec.ckbCodigoTRFClick(Sender: TObject);
begin
  if ckbCodigoTRF.Checked then
  Begin
    edtCodigoTRF.color  :=clWindow;
    edtCodigoTRF.Enabled:=True;
    edtCodigoTRF.SetFocus;
  end
  else
  Begin
    edtCodigoTRF.color  :=AlteraCorComponentes;
    edtCodigoTRF.Text   :='';
    edtCodigoTRF.Enabled:=False;
  end;
end;

end.
