unit MxSelPecasReposicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus, Parametro, Variants;

type
  TfMxSelPecasReposicao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label2: TLabel;
    Panel2: TPanel;
    bitConfirma: TBitBtn;
    bitCancelar: TBitBtn;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Panel3: TPanel;
    edtCodigoPRD: TEdit;
    ckbCodigoPRD: TCheckBox;
    ckbDescricao: TCheckBox;
    edtDescricao: TEdit;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    edtCodigoSPR: TEdit;
    ckbCodigoSPR: TCheckBox;
    Label3: TLabel;
    cmbOrdem: TComboBox;
    edtCodigoFOR: TEdit;
    ckbCodigoFOR: TCheckBox;
    ckbDevolvidos: TCheckBox;
    procedure bitConfirmaClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbDescricaoClick(Sender: TObject);
    procedure ckbCodigoSPRClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelPecasReposicao: TfMxSelPecasReposicao;

implementation

uses UDM, UPrinc2, MxSPediProd, UPendencia_reposicao, MxSCotaFor,
  UControleVitrine, MxSPediProdMotCal;

{$R *.DFM}


procedure TfMxSelPecasReposicao.bitConfirmaClick(Sender: TObject);
var
  mensagem, CdPRD, CdFOR, sDesc, cDtINI, cDtFIM, CdSituacao, sFiltros, Centro, sOrdem :string;
begin
  mensagem:='';
  cdPRD:='';
  CdFOR:='';
  sDesc:='';
  Centro:='';
  CdSituacao:='';
  sFiltros:='';
  sOrdem:='';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if not VerificaDataBranco(mskDataINI.Text)then
    cDtINI:=''
  else
    if tag in [0,1] then
      cDtINI:=' AND (T1.SPR_DATA>="'+MesDia(mskDataINI.Text)+'") '
    else
      if not ckbDevolvidos.Checked then
        cDtINI:=' AND (T1.CVT_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") '
      else
        cDtINI:=' AND (T1.CVT_DT_RETORNO>="'+MesDia(mskDataINI.Text)+'") ';

  if not VerificaDataBranco(mskDataFIM.Text)then
    cDtFIM:=''
  else
    if tag in [0,1] then
      cDtFIM:=' AND (SPR_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
    else
      if not ckbDevolvidos.Checked then
        cDtFIM:=' AND (T1.CVT_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
      else
        cDtFIM:=' AND (T1.CVT_DT_RETORNO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.text) then
      Raise Exception.Create('Código do produto inválido!')
    else
    Begin
      CdPRD:=' AND (T1.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + ' (PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbCodigoFOR.Checked then
    if not VerificaInteiroBranco(edtCodigoFOR.text) then
      Raise Exception.Create('Código do Fornecedor inválido!')
    else
    Begin
      if tag in [0,1] then
      begin
      CdFOR:=' AND (T1.FOR_CODIGO='+edtCodigoFOR.Text+') ';
      sFiltros := sFiltros + ' (FOR:'+edtCodigoFOR.Text+')';
      end;
    end;

  if ckbDescricao.Checked then
  Begin
    if tag in [0,1] then
      sDesc:=' AND (T1.SPR_DESCRICAO LIKE "%'+edtDescricao.Text+'%") '
    else
      sDesc:=' AND (T1.CVT_DESCRICAO LIKE "%'+edtDescricao.Text+'%") ';
    sFiltros := sFiltros + ' (Desc.:'+edtDescricao.Text+')';
  end;

  if ckbCodigoCNC.Checked then
    if not (dblCodigoCNC.KeyValue > 0) then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      Centro:=' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  if tag = 2 then
    if ckbDevolvidos.Checked then
      CdSituacao:=' AND CVT_SITUACAO=2 '
    else
      CdSituacao:=' AND CVT_SITUACAO=0 ';

  if tag in [0,1]then
    case cmbOrdem.ItemIndex of
      0: sOrdem := ' T1.CNC_CODIGO,T1.SPR_CODIGO ASC ';
      1: sOrdem := ' T1.CNC_CODIGO,T1.PRD_CODIGO ASC ';
      2: sOrdem := ' T1.CNC_CODIGO,T1.FOR_CODIGO ASC ';
      3: sOrdem := ' T1.CNC_CODIGO,T1.SPR_DESCRICAO ASC ';
      else
        sOrdem := ' T1.CNC_CODIGO ASC';
    end;

  If tag IN [0,1] then
  begin
    Application.CreateForm(Trpt_pendencia_reposicao, rpt_pendencia_reposicao);
    with rpt_pendencia_reposicao do
    Begin
      zrlFiltros.Caption := sFiltros;
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      SolicitPecRep1.Close;
      SolicitPecRep1.SQL.Text:='SELECT * '+
        ' FROM SOLICITACAO_DE_PECAS_DE_REP T1 '+
        ' WHERE T1.SPR_CODIGO<>-1 '+
        cDtINI+cDtFIM+CdPRD+CdFOR+sDesc+Centro+
        ' ORDER BY '+sOrdem;
      SolicitPecRep1.Open;
      if SolicitPecRep1.IsEmpty then
        Raise exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end
  else
  if tag=2 then
  begin
    Application.CreateForm(Trpt_Controle_de_Vitrine, rpt_Controle_de_Vitrine);
    with rpt_Controle_de_Vitrine do
    Begin
      zrlFiltros.Caption := sFiltros;
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
        ' FROM CONTROLE_DE_VITRINE T1 '+
        ' WHERE T1.CVT_CODIGO<>-1 '+
        cDtINI+cDtFIM+CdPRD+sDesc+Centro+CdSituacao;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelPecasReposicao.bitCancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelPecasReposicao.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  
  if DM.Configuracao1.Empresa <> empLBM then
    ckbCodigoCNC.Checked := True;

  cmbOrdem.ItemIndex := 0;
  mskDataINI.SetFocus;
  if tag in [0,1] then
    ckbDevolvidos.Visible:=false
  else
  if tag=2 then
  begin
    Label3.Visible:=false;
    cmbOrdem.Visible:=false;
    ckbDevolvidos.Top:=118;
    ckbCodigoFOR.Enabled:=false;
    edtCodigoFOR.Enabled:=false;
  end;
end;

procedure TfMxSelPecasReposicao.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=43;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=43;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxSelPecasReposicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure TfMxSelPecasReposicao.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.KeyValue:=CentroCusto1.CentroDeCusto;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelPecasReposicao.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Enabled := True;
    edtCodigoPRD.Color   := clWindow;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Enabled := False;
    edtCodigoPRD.Color   := AlteraCorComponentes;
    edtCodigoPRD.Clear;
  end;
end;

procedure TfMxSelPecasReposicao.ckbDescricaoClick(Sender: TObject);
begin
  if ckbDescricao.Checked then
  Begin
    edtDescricao.Enabled := True;
    edtDescricao.Color   := clWindow;
    edtDescricao.SetFocus;
  end
  else
  Begin
    edtDescricao.Enabled := False;
    edtDescricao.Color   := AlteraCorComponentes;
    edtDescricao.Clear;
  end;
end;

procedure TfMxSelPecasReposicao.ckbCodigoSPRClick(Sender: TObject);
begin
  if ckbCodigoSPR.Checked then
  Begin
    edtCodigoSPR.Enabled := True;
    edtCodigoSPR.Color   := clWindow;
    edtCodigoSPR.SetFocus;
  end
  else
  Begin
    edtCodigoSPR.Enabled := False;
    edtCodigoSPR.Color   := AlteraCorComponentes;
    edtCodigoSPR.Clear;
  end;
end;

procedure TfMxSelPecasReposicao.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Enabled := True;
    edtCodigoFOR.Color   := clWindow;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.Enabled := False;
    edtCodigoFOR.Color   := AlteraCorComponentes;
    edtCodigoFOR.Clear;
  end;
end;

procedure TfMxSelPecasReposicao.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=19;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxSelPecasReposicao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    bitConfirmaClick(sender);
end;

end.


