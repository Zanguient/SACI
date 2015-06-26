unit MxSelRegistroBoleto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  SQuery, Vendedor, AgenteFin, Forma_de_Pagamento, Parametro,
  Conta_de_Caixa, Variants;

type
  TfMxSelRegistroBoleto = class(TForm)
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Panel3: TPanel;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    GroupBox1: TGroupBox;
    dblCOdigoCNC: TDBLookupComboBox;
    ckbNossoNumero: TCheckBox;
    edtNossoNumero: TEdit;
    ckbCentroDeCusto: TCheckBox;
    rdgAlterado: TRadioButton;
    ckbNumeroEmpresa: TCheckBox;
    edtNumeroEmpresa: TEdit;
    rdgCadastro: TRadioButton;
    ckbSequenciaArquivo: TCheckBox;
    edtSequenciaArquivo: TEdit;
    ckbTipo: TCheckBox;
    cmbTipo: TComboBox;
    rdgGeracao: TRadioButton;
    ckbMovimento: TCheckBox;
    cmbMovimento: TComboBox;
    ckbSintetico: TCheckBox;
    ckbSituacao: TCheckBox;
    cmbSituacao: TComboBox;
    cmbTipoSituacao: TComboBox;
    ckbSaltarPagina: TCheckBox;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbSequenciaArquivoClick(Sender: TObject);
    procedure ckbNossoNumeroClick(Sender: TObject);
    procedure ckbNumeroEmpresaClick(Sender: TObject);
    procedure ckbTipoClick(Sender: TObject);
    procedure ckbMovimentoClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelRegistroBoleto: TfMxSelRegistroBoleto;

implementation

uses UDM, UVendasCliente, funcoes, MxSPediProd, UReceber,
  UBaixaRec, CdCliente, UPrevisaoReceita, MxGraficoTitulosVendedor,
  MxGraficoTitulosRecebidos, UExtratoCliente,
  URegistroBoleto;

{$R *.DFM}

procedure TfMxSelRegistroBoleto.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if tag = 0 then
    rdgCadastro.Checked := True;

  ckbSintetico.Checked := True;
  mskDataINI.SetFocus;
end;

procedure TfMxSelRegistroBoleto.SB_ConfirmarClick(Sender: TObject);
var
  mensagem,CNC,sSeqArq,sNossoNumero,sNumeroEmpresa,sTipo,sMovimento,SIT,sOrdem,DataINI,DataFIM,sFiltros:string;
begin
  CNC   := '';
  sSeqArq := '';
  sNossoNumero := '';
  sNumeroEmpresa := '';
  sTipo := '';
  sMovimento := '';
  sFiltros := '';
  sOrdem := '';
  mensagem:='';
  SIT := '';
  DataINI    :='';
  DataFIM    :='';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;

  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text) then
    if rdgCadastro.Checked then
      DataINI := ' AND (R1.RBO_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") '
    else if rdgAlterado.Checked then
      DataINI := ' AND (R1.RBO_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") '
    else if rdgGeracao.Checked then
      DataINI := ' AND (R1.RBO_DT_GERACAO_ARQUIVO>="'+MesDia(mskDataINI.Text)+'") ';

  if VerificaDataBranco(mskDataFIM.Text) then
    if rdgCadastro.Checked then
      DataFIM := ' AND (R1.RBO_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
    else if rdgAlterado.Checked then
      DataFIM := ' AND (R1.RBO_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
    else if rdgGeracao.Checked then
      DataFIM := ' AND (R1.RBO_DT_GERACAO_ARQUIVO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

  if ckbSequenciaArquivo.Checked then
  Begin
    if edtSequenciaArquivo.Text = '' then
      Raise Exception.Create('Seqência do Arquivo inválida!')
    else
    Begin
      sNossoNumero:=' AND (R1.RBO_SEQUENCIA_ARQUIVO='+Trim(edtSequenciaArquivo.Text)+') ';
      sFiltros := sFiltros + ' (SeqArquivo:'+edtSequenciaArquivo.Text+')';
    end;
  end;

  if ckbNossoNumero.Checked then
  Begin
    if edtNossoNumero.Text = '' then
      Raise Exception.Create('Nosso número inválido!')
    else
    Begin
//      sNossoNumero:=' AND (T1.TRC_NUMER LIKE "%'+Trim(edtNumero.Text)+'%") ';
      sFiltros := sFiltros + ' (NossoNumero:'+edtNossoNumero.Text+')';
    end;
  end;

  if ckbNumeroEmpresa.Checked then
  Begin
    if edtNumeroEmpresa.Text = '' then
      Raise Exception.Create('Número do Título na Empresa inválido!')
    else
    Begin
//      sNumeroEmpresa:=' AND (T1.TRC_NUMER LIKE "%'+Trim(edtNumeroEmpresa.Text)+'%") ';
      sFiltros := sFiltros + ' (NumeroEmpresa:'+edtNumeroEmpresa.Text+')';
    end;
  end;

  if ckbCentroDeCusto.Checked then
    if dblCOdigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      CNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCOdigoCNC.KeyValue)+')';
    end;

  if ckbTipo.Checked then
  Begin
    sTipo:=' AND (R1.RBO_TIPO='+IntToStr(cmbTipo.ItemIndex)+') ';
    case cmbTipo.ItemIndex of
      0: sFiltros := sFiltros + ' (Saida)';
      1: sFiltros := sFiltros + ' (Entrada)';
    end;
  end;

  if ckbMovimento.Checked then
  Begin
    sMovimento:=' AND (SUBSTRING(R1.RBO_SEGMENTO_T,16,2)="'+Copy(cmbMovimento.Text,1,2)+'") ';
    sFiltros := sFiltros + ' (Movimento:'+Copy(cmbMovimento.Items.Text,1,2)+')';
  end;

  if ckbSituacao.Checked then
  Begin
    if cmbTipoSituacao.ItemIndex = 0 then //Igual
    Begin
      SIT:=' AND (R1.RBO_SITUACAO='+IntToStr(cmbTipo.ItemIndex)+') ';
      sFiltros := sFiltros + '(='+cmbTipo.Items[cmbTipo.ItemIndex]+')';
    end
    else //Diferente
    Begin
      SIT:=' AND (R1.RBO_SITUACAO<>'+IntToStr(cmbTipo.ItemIndex)+') ';
      sFiltros := sFiltros + '(<>'+cmbTipo.Items[cmbTipo.ItemIndex]+')';
    end;
  end;

  if tag = 0 then
  Begin
    Application.CreateForm(Trpt_RegistroBoleto,rpt_RegistroBoleto);
    with rpt_RegistroBoleto do
    Begin
      zrlFiltros.Caption := sFiltros;
      if ckbSaltarPagina.Checked then
        SZRGroup1.ForceNewPage := True;
      If ckbSintetico.Checked then
        zrbDetalhe.Height := 1;
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * '+
        ' FROM REGISTRO_BOLETO R1 '+
        ' WHERE R1.RBO_CODIGO>0 '+
        CNC+sSeqArq+sNossoNumero+sNumeroEmpresa+sTipo+sMovimento+SIT+DataINI+DataFIM+
        ' ORDER BY R1.RBO_DT_GERACAO_ARQUIVO,R1.RBO_CODIGO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Entidade.Close;
      Close;
    end;
  end;
end;

procedure TfMxSelRegistroBoleto.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelRegistroBoleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfMxSelRegistroBoleto.ckbCentroDeCustoClick(Sender: TObject);
begin
  if ckbCentroDeCusto.Checked then
  Begin
    CentroCusto1.Open;
    dblCOdigoCNC.Color:=clWindow;
    dblCOdigoCNC.Enabled:=True;
    dblCOdigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
    dblCOdigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCOdigoCNC.Color:=AlteraCorComponentes;
    dblCOdigoCNC.KeyValue:=-1;
    dblCOdigoCNC.Enabled:=False;
  end;
end;

procedure TfMxSelRegistroBoleto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(27) then
    Close;
end;

procedure TfMxSelRegistroBoleto.ckbSequenciaArquivoClick(Sender: TObject);
begin
  if ckbSequenciaArquivo.Checked then
  Begin
    edtSequenciaArquivo.Color:=clWindow;
    edtSequenciaArquivo.Enabled:=True;
    edtSequenciaArquivo.SetFocus;
  end
  else
  Begin
    edtSequenciaArquivo.Color:=AlteraCorComponentes;
    edtSequenciaArquivo.Clear;
    edtSequenciaArquivo.Enabled:=False;
  end;
end;

procedure TfMxSelRegistroBoleto.ckbNossoNumeroClick(Sender: TObject);
begin
  if ckbNossoNumero.Checked then
  Begin
    edtNossoNumero.Color:=clWindow;
    edtNossoNumero.Enabled:=True;
    edtNossoNumero.SetFocus;
  end
  else
  Begin
    edtNossoNumero.Color:=AlteraCorComponentes;
    edtNossoNumero.Clear;
    edtNossoNumero.Enabled:=False;
  end;
end;

procedure TfMxSelRegistroBoleto.ckbNumeroEmpresaClick(Sender: TObject);
begin
  if ckbNumeroEmpresa.Checked then
  Begin
    edtNumeroEmpresa.Color:=clWindow;
    edtNumeroEmpresa.Enabled:=True;
    edtNumeroEmpresa.SetFocus;
  end
  else
  Begin
    edtNumeroEmpresa.Color:=AlteraCorComponentes;
    edtNumeroEmpresa.Clear;
    edtNumeroEmpresa.Enabled:=False;
  end;
end;

procedure TfMxSelRegistroBoleto.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    cmbTipo.Color:=clWindow;
    cmbTipo.Enabled:=True;
    cmbTipo.ItemIndex := 1;
    cmbTipo.SetFocus;
  end
  else
  Begin
    cmbTipo.Color:=AlteraCorComponentes;
    cmbTipo.Clear;
    cmbTipo.ItemIndex := -1;
    cmbTipo.Enabled:=False;
  end;
end;

procedure TfMxSelRegistroBoleto.ckbMovimentoClick(Sender: TObject);
begin
  if ckbMovimento.Checked then
  Begin
    cmbMovimento.Color:=clWindow;
    cmbMovimento.Enabled:=True;
    cmbMovimento.ItemIndex := 0;
    cmbMovimento.SetFocus;
  end
  else
  Begin
    cmbMovimento.Color:=AlteraCorComponentes;
    cmbMovimento.ItemIndex := -1;
    cmbMovimento.Enabled:=False;
  end;
end;

procedure TfMxSelRegistroBoleto.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbTipoSituacao.Enabled := True;
    cmbTipoSituacao.Color := clWindow;
    cmbTipoSituacao.ItemIndex := 0;
    cmbSituacao.Color:=clWindow;
    cmbSituacao.Enabled:=True;
    cmbSituacao.ItemIndex:=1;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbTipoSituacao.Enabled := False;
    cmbTipoSituacao.Color := AlteraCorComponentes;
    cmbTipoSituacao.ItemIndex := -1;
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
    cmbSituacao.Enabled:=False;
  end;
end;

end.
