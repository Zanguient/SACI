unit MxSelCheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  SQuery, Vendedor, AgenteFin, Forma_de_Pagamento, Parametro, Variants;

type
  TfMxSelCheques = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    edtCodigoTitulo: TEdit;
    dblCentroDeCusto: TDBLookupComboBox;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    ckbCentroDeCusto: TCheckBox;
    ckbDataDeposito: TCheckBox;
    CheckBox2: TCheckBox;
    edtNumeroCheque: TEdit;
    cmbTipo: TComboBox;
    ckbTipo: TCheckBox;
    cmbSituacao: TComboBox;
    ckbSituacao: TCheckBox;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    Label6: TLabel;
    cmbOrdem: TComboBox;
    ckbSintetico: TCheckBox;
    ckbNominal: TCheckBox;
    edtNominal: TEdit;
    ckbDonoCheque: TCheckBox;
    edtDonoCheque: TEdit;
    ckbValor: TCheckBox;
    edtValor: TEdit;
    ckbObservacao: TCheckBox;
    edtObservacao: TEdit;
    ckbSaldoDiferenteZero: TCheckBox;
    ckbCodigoFCT: TCheckBox;
    edtCodigoFCT: TEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ckbTipoClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbNominalClick(Sender: TObject);
    procedure ckbDonoChequeClick(Sender: TObject);
    procedure ckbValorClick(Sender: TObject);
    procedure ckbObservacaoClick(Sender: TObject);
    procedure ckbCodigoFCTClick(Sender: TObject);
    procedure edtCodigoFCTKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelCheques: TfMxSelCheques;

implementation

uses UDM, funcoes, UCheques, CdCliente, MxSelFactoring;

{$R *.DFM}

procedure TfMxSelCheques.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  Begin
    edtCodigoTitulo.Color:=clWindow;
    edtCodigoTitulo.Enabled:=True;
    edtCodigoTitulo.SetFocus;
  end
  else
  Begin
    edtCodigoTitulo.Color:=AlteraCorComponentes;
    edtCodigoTitulo.Text:='';
    edtCodigoTitulo.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  ckbCentroDeCusto.Checked := True;
  ckbCentroDeCusto.Checked:=True;
  cmbOrdem.ItemIndex := 0;
  MaskEdit1.SetFocus;
end;

procedure TfMxSelCheques.BitBtn1Click(Sender: TObject);
var
  mensagem,CNC,TRC,CdCLI,CdFCT,NUM,DataINI,DataFIM,cTipo,cSit,sNominal,sDonoCheque,
    sValor,sObs,sOrdem,sFiltros:string;
begin
  CNC:='';
  TRC:='';
  NUM:='';
  CdCLI:='';
  CdFCT:='';
  cTipo := '';
  cSit := '';
  sFiltros := '';
  mensagem:='';
  if ckbDataDeposito.Checked then
    sFiltros := sFiltros + '(Dep) '
  else
    sFiltros := sFiltros + '(Cad) ';

  if not VerificaData(MaskEdit1.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(MaskEdit2.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if not VerificaDataBranco(MaskEdit1.Text)then
    DataINI := ''
  else if ckbDataDeposito.Checked then
    DataINI := ' AND (CHQ_DATA>="'+MesDia(MaskEdit1.Text)+'") '
  else
    DataINI := ' AND (CHQ_DT_CADASTRO>="'+MesDia(MaskEdit1.Text)+'") ';
  if not VerificaDataBranco(MaskEdit2.Text)then
    DataFIM := ''
  else if ckbDataDeposito.Checked then
    DataFIM := ' AND (CHQ_DATA<"'+MesDia(StrToDate(MaskEdit2.Text)+1)+'") '
  else
    DataFIM := ' AND (CHQ_DT_CADASTRO<"'+MesDia(StrToDate(MaskEdit2.Text)+1)+'") ';
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if CheckBox2.Checked then
    if not VerificaInteiroBranco(edtNumeroCheque.Text) then
    Begin
      edtNumeroCheque.SetFocus;
      raise Exception.Create('Número do Cheque inválido!');
    end
    else
    Begin
      NUM:=' AND (CHQ_NUMERO='+edtNumeroCheque.Text+') ';
      sFiltros := sFiltros + '(NumChq:'+edtNumeroCheque.Text+') ';
    end;

  if CheckBox1.Checked then
    if not VerificaInteiroBranco(edtCodigoTitulo.Text) then
    Begin
      edtCodigoTitulo.SetFocus;
      raise Exception.Create('Código do Título inválido!');
    end
    else
    Begin
      TRC:=' AND (CHQ_COD_TITULO='+edtCodigoTitulo.Text+') ';
      sFiltros := sFiltros + '(Titulo:'+edtCodigoTitulo.Text+') ';
    end;

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Código do Cliente inválido!');
    end
    else
    Begin
      CdCLI:=' AND (CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + '(Cli:'+edtCodigoCLI.Text+') ';
    end;

  if ckbCodigoFCT.Checked then
    if not VerificaInteiroBranco(edtCodigoFCT.Text) then
    Begin
      edtCodigoFCT.SetFocus;
      raise Exception.Create('Código da Factoring inválido!');
    end
    else
    Begin
      CdFCT:=' AND (FCT_CODIGO='+edtCodigoFCT.Text+') ';
      sFiltros := sFiltros + '(FCT:'+edtCodigoFCT.Text+') ';
    end;

  if ckbTipo.Checked then
    if cmbTipo.ItemIndex = 0 then
    Begin
      cTipo:=' AND (CHQ_ER="E") ';
      sFiltros := sFiltros + '(Emitidos) ';
    end
    else
    Begin
      cTipo:=' AND (CHQ_ER="R") ';
      sFiltros := sFiltros + '(Recebidos) ';
    end;

  if ckbSituacao.Checked then
  Begin
    cSit := ' AND (CHQ_SITUACAO='+IntToStr(cmbSituacao.ItemIndex)+') ';
    sFiltros := sFiltros + '(Sit:'+cmbSituacao.Items[cmbSituacao.ItemIndex]+') ';
  end;

  if ckbCentroDeCusto.Checked then
    if dblCentroDeCusto.Text = '' then
    Begin
      dblCentroDeCusto.SetFocus;
      raise Exception.Create('Centro de Custo inválido!');
    end
    else
    Begin
      CNC:=' AND (CNC_CODIGO='+IntToStr(dblCentroDeCusto.KeyValue)+') ';
      sFiltros := sFiltros + '(CNC:'+IntToStr(dblCentroDeCusto.KeyValue)+') ';
    end;

  if ckbNominal.Checked then
  Begin
    sNominal := ' AND (CHQ_NOMINAL="%'+edtNominal.Text+'%") ';
    sFiltros := sFiltros + '(Nominal:'+edtNominal.Text+') ';
  end;

  if ckbDonoCheque.Checked then
  Begin
    sDonoCheque := ' AND (CHQ_DONO_CHEQUE="%'+edtDonoCheque.Text+'%") ';
    sFiltros := sFiltros + '(Proprietario:'+edtDonoCheque.Text+') ';
  end;

  if ckbValor.Checked then
  Begin
    if not VerificaFloatBranco(edtValor.Text) then
      Raise exception.Create('Valor inválido!');
    sValor := ' AND (CHQ_VALOR='+VirgPonto(edtValor.Text)+') ';
    sFiltros := sFiltros + '(Valor:R$ '+edtValor.Text+') ';
  end;

  if ckbObservacao.Checked then
  Begin
    sObs := ' AND (CHQ_OBSERVACAO="%'+edtObservacao.Text+'%") ';
    sFiltros := sFiltros + '(Obs:'+edtObservacao.Text+') ';
  end;

  sOrdem := ' CNC_CODIGO ';
  case cmbOrdem.ItemIndex of
    0 : sOrdem := ' CNC_CODIGO,CHQ_CODIGO ';
    1 : sOrdem := ' CNC_CLIENTE,CLI_CODIGO ';
    2 : sOrdem := ' CHQ_DATA ';
    3 : sOrdem := ' CHQ_DATA ';
    4 : sOrdem := ' CHQ_VALOR ';
  end;

  Dt_ini := MaskEdit1.Text;
  Dt_fim := MaskEdit2.Text;
  if tag = 0 then
  Begin
    Application.CreateForm(Trpt_Cheques, rpt_Cheques);
    with rpt_Cheques do
    Begin
      tag := 0;
      zrlFiltros.Caption := sFiltros;
      if ckbSintetico.Checked then
        zrbDetalhe.Height := 1;
      vSaldoDifZero := ckbSaldoDiferenteZero.Checked;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
        ' FROM CHEQUE '+
        ' WHERE CHQ_CODIGO > 0 '+
        DataINI+DataFIM+CNC+TRC+NUM+cTipo+cSit+CdCLI+CdFCT+sNominal+sDonoCheque+sValor+
        sObs+
        ' ORDER BY '+sOrdem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      SZRLabel15.Caption := MaskEdit1.Text;
      SZRLabel17.Caption := MaskEdit2.Text;
      report.preview;
      rpt_Cheques.Close;
    end;
  end;
end;

procedure TfMxSelCheques.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelCheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Active := False;
  Action := cafree;
end;

procedure TfMxSelCheques.ckbCentroDeCustoClick(Sender: TObject);
begin
  if ckbCentroDeCusto.Checked then
  Begin
    CheckBox1.Enabled:=True;
    CentroCusto1.Open;
    dblCentroDeCusto.Color:=clWindow;
    dblCentroDeCusto.Enabled:=True;
    dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCentroDeCusto.SetFocus;
  end
  else
  Begin
    CheckBox1.Checked:=False;
    CheckBox1.Enabled:=False;
    CentroCusto1.Close;
    dblCentroDeCusto.Color:=AlteraCorComponentes;
    dblCentroDeCusto.KeyValue:=-1;
    dblCentroDeCusto.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  Begin
    edtNumeroCheque.Color:=clWindow;
    edtNumeroCheque.Enabled:=True;
    edtNumeroCheque.SetFocus;
  end
  else
  Begin
    edtNumeroCheque.Color:=AlteraCorComponentes;
    edtNumeroCheque.Text:='';
    edtNumeroCheque.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    cmbTipo.Color:=clWindow;
    cmbTipo.Enabled:=True;
    cmbTipo.ItemIndex:=0;
    cmbTipo.SetFocus;
  end
  else
  Begin
    cmbTipo.Color:=AlteraCorComponentes;
    cmbTipo.ItemIndex:=-1;
    cmbTipo.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Color:=clWindow;
    cmbSituacao.Enabled:=True;
    cmbSituacao.ItemIndex:=0;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
    cmbSituacao.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.ckbCodigoCLIClick(Sender: TObject);
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

procedure TfMxSelCheques.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=39;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxSelCheques.ckbNominalClick(Sender: TObject);
begin
  if ckbNominal.Checked then
  Begin
    edtNominal.Color:=clWindow;
    edtNominal.Enabled:=True;
    edtNominal.SetFocus;
  end
  else
  Begin
    edtNominal.Color:=AlteraCorComponentes;
    edtNominal.Clear;
    edtNominal.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.ckbDonoChequeClick(Sender: TObject);
begin
  if ckbDonoCheque.Checked then
  Begin
    edtDonoCheque.Color:=clWindow;
    edtDonoCheque.Enabled:=True;
    edtDonoCheque.SetFocus;
  end
  else
  Begin
    edtDonoCheque.Color:=AlteraCorComponentes;
    edtDonoCheque.Clear;
    edtDonoCheque.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.ckbValorClick(Sender: TObject);
begin
  if ckbValor.Checked then
  Begin
    edtValor.Color:=clWindow;
    edtValor.Enabled:=True;
    edtValor.SetFocus;
  end
  else
  Begin
    edtValor.Color:=AlteraCorComponentes;
    edtValor.Clear;
    edtValor.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.ckbObservacaoClick(Sender: TObject);
begin
  if ckbObservacao.Checked then
  Begin
    edtObservacao.Color:=clWindow;
    edtObservacao.Enabled:=True;
    edtObservacao.SetFocus;
  end
  else
  Begin
    edtObservacao.Color:=AlteraCorComponentes;
    edtObservacao.Clear;
    edtObservacao.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.ckbCodigoFCTClick(Sender: TObject);
begin
  if ckbCodigoFCT.Checked then
  Begin
    edtCodigoFCT.Color:=clWindow;
    edtCodigoFCT.Enabled:=True;
    edtCodigoFCT.SetFocus;
  end
  else
  Begin
    edtCodigoFCT.Color:=AlteraCorComponentes;
    edtCodigoFCT.Clear;
    edtCodigoFCT.Enabled:=False;
  end;
end;

procedure TfMxSelCheques.edtCodigoFCTKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoFCT.Clear;
    key:=chr(0);
    Application.CreateForm(TfMxSelFactoring, fMxSelFactoring);
    with fMxSelFactoring do
    Begin
      tag:=1;
      Showmodal;
    end;
  End;
end;

end.

