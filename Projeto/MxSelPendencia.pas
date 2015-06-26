unit MxSelPendencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, DBTables, SQuery, CentroCusto, DBCtrls, ExtCtrls,
  Mask, Usuario;

type
  TfMxSelPendencia = class(TForm)
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Panel1: TPanel;
    dblCodigoCNC: TDBLookupComboBox;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    ckbCodigoCNC: TCheckBox;
    ckbCodigoUSU: TCheckBox;
    dblCodigoUSU: TDBLookupComboBox;
    Usuario1: TUsuario;
    DSUsuario1: TDataSource;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    edtClienteCNC: TEdit;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbCodigoPEN: TCheckBox;
    edtCodigoPEN: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    rdgDataCadastro: TRadioButton;
    rdgDataAlterado: TRadioButton;
    SB_Cancelar: TBitBtn;
    rdgDataReferencia: TRadioButton;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    ckbTipo: TCheckBox;
    cmbTipo: TComboBox;
    ckbSituacao: TCheckBox;
    cmbSituacao: TComboBox;
    ckbCodigoUSU2: TCheckBox;
    dblCodigoUSU2: TDBLookupComboBox;
    Usuario2: TUsuario;
    DSUsuario2: TDataSource;
    Bevel1: TBevel;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoUSUClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoPENClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_CancelarClick(Sender: TObject);
    procedure ckbTipoClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure ckbCodigoUSU2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelPendencia: TfMxSelPendencia;

implementation
Uses UDM, funcoes, UPendencia, MxSPediProdMotCal, MxSPediProd, CdCliente;
{$R *.DFM}

procedure TfMxSelPendencia.SB_ConfirmarClick(Sender: TObject);
Var
  Centro,USU,CdUSU2,CdPEN,CdCLI,CdPRD,CdPDV,DtINI,DtFIM,sTipo,Sit,sFiltros:string;
begin
  sFiltros := '';
  USU := '';
  CdUSU2:='';
  CdCLI:='';
  CdPRD:='';
  CdPDV:='';
  CdPEN:='';
  sTipo:='';
  Sit:='';
  DtINI := '';
  DtFIM := '';

  if rdgDataCadastro.Checked then
    sFiltros := sFiltros + '(Cad)'
  else if rdgDataAlterado.Checked then
    sFiltros := sFiltros + '(Alt)'
  else
    sFiltros := sFiltros + '(Ref)';

  if not VerificaData(mskDataINI.Text) then
    Raise exception.Create('Data inicial inválida!')
  else if VerificaDataBranco(mskDataINI.Text) then
  Begin
    sFiltros := sFiltros + '(DtINI'+mskDataINI.Text+')';
    if rdgDataCadastro.Checked then
      DtINI:=' AND PEN_DT_CADASTRO>="' +MesDia(mskDataINI.Text)+'" '
    else if rdgDataAlterado.Checked then
      DtINI:=' AND PEN_DT_ALTERADO>="' +MesDia(mskDataINI.Text)+'" '
    else
      DtINI:=' AND PEN_DT_REFERENCIA>="' +MesDia(mskDataINI.Text)+'" ';
  end;

  if not VerificaData(mskDataFIM.Text) then
    Raise exception.Create('Data final inválida!')
  else if VerificaDataBranco(mskDataFIM.Text) then
  Begin
    sFiltros := sFiltros + '(DtFIM'+mskDataFIM.Text+')';
    if rdgDataAlterado.Checked then
      DtFIM := ' AND PEN_DT_CADASTRO<"' +MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataAlterado.Checked then
      DtFIM := ' AND PEN_DT_ALTERADO<"' +MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else
      DtFIM := ' AND PEN_DT_REFERENCIA<"' +MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
  end;

  if ckbCodigoPEN.Checked then
    if not VerificaInteiroBranco(edtCodigoPEN.Text) then
      Raise Exception.Create('Código da Pendência inválido!')
    else
    Begin
      CdPEN:=' AND (PEN_CODIGO='+edtCodigoPEN.Text+') ';
      sFiltros := sFiltros + '(PEN:'+edtCodigoPEN.Text+')';
    end;

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI:=' AND (CLI_CODIGO='+edtCodigoCLI.Text+') AND (CNC_CLIENTE='+edtClienteCNC.Text+') ';
      sFiltros := sFiltros + '(CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoPDV.Checked then
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
      Raise Exception.Create('Código do Pedido inválido!')
    else
    Begin
      CdPDV:=' AND PDV_CODIGO='+edtCodigoPDV.Text;
      sFiltros := sFiltros + '(PDV:'+edtCodigoPDV.Text+')';
    end;

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      Raise Exception.Create('Código do Produto inválido!')
    else
    Begin
      CdPRD:=' AND (PRD_CODIGO_1='+edtCodigoPRD.Text+
             '   OR PRD_CODIGO_2='+edtCodigoPRD.Text+
             '   OR PRD_CODIGO_3='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbCodigoCNC.Checked then
  Begin
    Centro := ' WHERE CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';
    sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
  end
  else
    Centro := ' WHERE (CNC_CODIGO<>-1 OR CNC_CODIGO IS NULL) ';

  if ckbCodigoUSU.Checked then
    if dblCodigoUSU.Text = '' then
      Raise Exception.Create('Usuário inválido!')
    else
    Begin
      USU := ' AND USU_CODIGO='+IntToStr(dblCodigoUSU.KeyValue)+' ';
      sFiltros := sFiltros + '(USU:'+IntToStr(dblCodigoUSU.KeyValue)+')';
    end;

  if ckbCodigoUSU2.Checked then
    if dblCodigoUSU2.Text = '' then
      Raise Exception.Create('Usuário Autoriza inválido!')
    else
    Begin
      CdUSU2 := ' AND PEN_USU_LIBEROU='+IntToStr(dblCodigoUSU2.KeyValue)+' ';
      sFiltros := sFiltros + '(USUAutorizou:'+IntToStr(dblCodigoUSU2.KeyValue)+')';
    end;

  if ckbTipo.Checked then
  Begin
    sTipo := ' AND PEN_TIPO='+IntToStr(cmbTipo.ItemIndex);
    sFiltros := sFiltros + '(Tipo:'+cmbTipo.Text+')';
  end;

  if ckbSituacao.Checked then
  Begin
    sit := ' AND PEN_SITUACAO='+IntToStr(cmbSituacao.ItemIndex);
    sFiltros := sFiltros + '(Sit:'+cmbSituacao.Text+')';
  end;

  Application.CreateForm(Trpt_Pendencia, rpt_Pendencia);
  with rpt_Pendencia do
  Begin
    tag := 0;
    zrlFiltros.Caption := sFiltros;
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM PENDENCIA '+
      Centro+USU+CdUSU2+DtINI+DtFIM+CdPEN+CdCLI+CdPRD+CdPDV+Sit+sTipo+
      ' ORDER BY CNC_CODIGO, PEN_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta Vazia!');
    report.Preview;
    Close;
  end;
end;


procedure TfMxSelPendencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Usuario1.Close;
  Action:=caFree;
end;

procedure TfMxSelPendencia.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ckbSituacao.Checked := True;
  edtClienteCNC.Text:=IntToStr(DM.Configuracao1.CodigoCNC);
  mskDataINI.SetFocus;
end;

procedure TfMxSelPendencia.ckbCodigoCNCClick(Sender: TObject);
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
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelPendencia.ckbCodigoUSUClick(Sender: TObject);
begin
  if ckbCodigoUSU.Checked then
  Begin
    Usuario1.Open;
    dblCodigoUSU.Color:=clWindow;
    dblCodigoUSU.Enabled:=True;
    dblCodigoUSU.KeyValue:=DM.Configuracao1.CodigoUSU;
    dblCodigoUSU.SetFocus;
  end
  else
  Begin
    Usuario1.Close;
    dblCodigoUSU.Color:=AlteraCorComponentes;
    dblCodigoUSU.Enabled:=False;
    dblCodigoUSU.KeyValue:=-1;
  end;
end;

procedure TfMxSelPendencia.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=50;
    fCadCli.CentroCusto2.open;
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxSelPendencia.ckbCodigoCLIClick(Sender: TObject);
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

procedure TfMxSelPendencia.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Clear;
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=69;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=69;
        ShowModal;
      end;
    end;
  End
end;

procedure TfMxSelPendencia.ckbCodigoPENClick(Sender: TObject);
begin
  if ckbCodigoPEN.Checked then
  Begin
    edtCodigoPEN.Color:=clWindow;
    edtCodigoPEN.Enabled:=True;
    edtCodigoPEN.SetFocus;
  end
  else
  Begin
    edtCodigoPEN.Color:=AlteraCorComponentes;
    edtCodigoPEN.Text:='';
    edtCodigoPEN.Enabled:=False;
  end;
end;

procedure TfMxSelPendencia.ckbCodigoPRDClick(Sender: TObject);
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
    edtCodigoPRD.Text:='';
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSelPendencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    Close
  else if key=#13 then
  Begin
    Key := #0;
    SB_ConfirmarClick(sender);
  end;
end;

procedure TfMxSelPendencia.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelPendencia.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    cmbTipo.Color:=clWindow;
    cmbTipo.Enabled:=True;
    cmbTipo.ItemIndex := 0;
    cmbTipo.SetFocus;
  end
  else
  Begin
    cmbTipo.Color:=AlteraCorComponentes;
    cmbTipo.Enabled:=False;
    cmbTipo.ItemIndex := -1;
  end;
end;

procedure TfMxSelPendencia.ckbCodigoPDVClick(Sender: TObject);
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
    edtCodigoPDV.Text:='';
    edtCodigoPDV.Enabled:=False;
  end;
end;

procedure TfMxSelPendencia.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Color:=clWindow;
    cmbSituacao.Enabled:=True;
    cmbSituacao.ItemIndex := 0;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.Enabled:=False;
    cmbSituacao.ItemIndex := -1;
  end;
end;

procedure TfMxSelPendencia.ckbCodigoUSU2Click(Sender: TObject);
begin
  if ckbCodigoUSU2.Checked then
  Begin
    Usuario2.Open;
    dblCodigoUSU2.Color:=clWindow;
    dblCodigoUSU2.Enabled:=True;
    dblCodigoUSU2.KeyValue:=DM.Configuracao1.CodigoUSU;
    dblCodigoUSU2.SetFocus;
  end
  else
  Begin
    Usuario2.Close;
    dblCodigoUSU2.Color:=AlteraCorComponentes;
    dblCodigoUSU2.Enabled:=False;
    dblCodigoUSU2.KeyValue:=-1;
  end;
end;

end.


