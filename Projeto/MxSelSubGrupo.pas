unit MxSelSubGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Menus, Variants;

type
  TfMxSelSubGrupo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Grupo: TQuery;
    DSGrupo: TDataSource;
    Centro_de_Custo: TQuery;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    GroupBox3: TGroupBox;
    dblCodigoGRP: TDBLookupComboBox;
    ckbCodigoGRP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoSGP: TCheckBox;
    ckbBase: TCheckBox;
    edtBase: TEdit;
    ckbDesativados: TCheckBox;
    edtDescricao: TEdit;
    ckbDescricao: TCheckBox;
    ckbFamilia: TCheckBox;
    edtFamilia: TEdit;
    Label6: TLabel;
    cmbOrdem: TComboBox;
    ckbObs: TCheckBox;
    edtObs: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbBaseClick(Sender: TObject);
    procedure ckbDescricaoClick(Sender: TObject);
    procedure ckbFamiliaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbObsClick(Sender: TObject);
  private
    { Private declarations }
  public
    Centro: string;
  end;

var
  fMxSelSubGrupo: TfMxSelSubGrupo;

implementation

uses
  UProduto, funcoes, uEstoque, MxSPediProd, MxSCotaFor, UDM, UPrev_vendas,
  USugestaoCmp, UFornProd, UTransferenciaNecessaria, UProdutoSite,
  UProduto_Colunas, UProdutoSubGrupo, USubgrupo;

{$R *.DFM}


procedure TfMxSelSubGrupo.BitBtn1Click(Sender: TObject);
var
  sSituacao,cGRP,cSGP, sDescricao, sBase, sFamilia, sFiltros, sOrdem, sObs :string;
begin
  sDescricao:='';
  cGRP:='';
  cSGP:='';
  sBase:='';
  sFamilia:='';
  sOrdem:='';
  sFiltros:='';
  sObs:='';

  if ckbDesativados.Checked then
  Begin
    sSituacao := ' AND (S1.SGP_SITUACAO = 1) ';
    sFiltros := '(Desativados) ';
  end
  else
  Begin
    sSituacao := ' AND (S1.SGP_SITUACAO <> 1) ';
    sFiltros := '(Ativados) ';
  end;

  if ckbDescricao.Checked then
  Begin
    sDescricao := ' AND (S1.SGP_DESCRICAO LIKE "%'+edtDescricao.Text+'%") ';
    sFiltros := '(Desc='+edtDescricao.Text+') ';
  end;

  if ckbBase.Checked then
  Begin
    sBase := ' AND (S1.SGP_BASE_CHAVE LIKE "%'+edtBase.Text+'%") ';
    sFiltros := '(Base='+edtBase.Text+') ';
  end;

  if ckbFamilia.Checked then
  Begin
    sFamilia := ' AND (S1.SGP_FAMILIA LIKE "%'+edtFamilia.Text+'%") ';
    sFiltros := '(Fam='+edtFamilia.Text+') ';
  end;

  if ckbCodigoGRP.Checked then
    if dblCodigoGRP.Text = '' then
      Raise Exception.Create('Grupo inválido!')
    else
    Begin
      cGRP := ' AND (S1.GRP_CODIGO ='+IntToStr(dblCodigoGRP.KeyValue)+') ';
      sFiltros := '(GRP='+dblCodigoGRP.Text+') ';
    end;

  if ckbCodigoSGP.Checked then
    if dblCodigoSGP.Text = '' then
      Raise Exception.Create('SubGrupo inválido!')
    else
    Begin
      cSGP := ' AND (S1.SGP_CODIGO ='+IntToStr(dblCodigoSGP.KeyValue)+') ';
      sFiltros := '(SGP='+dblCodigoSGP.Text+') ';
    end;

  if ckbObs.Checked then
  Begin
    sObs := ' AND (S1.SGP_OBSERVACAO LIKE "%'+edtObs.Text+'%") ';
    sFiltros := '(Obs='+edtObs.Text+') ';
  end;

  case cmbOrdem.ItemIndex of
    0: sOrdem := ' ORDER BY S1.SGP_CODIGO ';
    1: sOrdem := ' ORDER BY S1.SGP_DESCRICAO ';
    2: sOrdem := ' ORDER BY S1.GRP_CODIGO, S1.SGP_DESCRICAO ';
  end;

  // Relatório de SubGrupo
  if Tag = 0 then
  begin
    Application.CreateForm(Trpt_SubGrupo,rpt_SubGrupo);
    with rpt_SubGrupo do
    Begin
      zrlfiltros.Caption := sFiltros;
      Entidade.Close;

      Entidade.SQL.Text:='SELECT * FROM SUBGRUPO S1 '+
        ' WHERE (S1.SGP_CODIGO <> -1) '+
        sSituacao+cGRP+cSGP+sDescricao+sFamilia+sBase+sObs+
        sOrdem;

      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelSubGrupo.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TfMxSelSubGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo.Close;
  SubGrupo1.Close;
  Action := caFree;
end;

procedure TfMxSelSubGrupo.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    Grupo.Open;
    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    ckbCodigoSGP.Enabled:=True;
    dblCodigoGRP.KeyValue:=Grupo.FieldByName('GRP_CODIGO').asInteger;
    dblCodigoGRP.SetFocus;
  end
  else
  Begin
    Grupo.Close;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    ckbCodigoSGP.Checked:=False;
    ckbCodigoSGP.Enabled:=False;
    dblCodigoGRP.KeyValue:=0;
  end;
end;

procedure TfMxSelSubGrupo.dblCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    if dblCodigoGRP.KeyValue > 0 then
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
    end;
  end;
end;

procedure TfMxSelSubGrupo.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if not (dblCodigoGRP.KeyValue > 0)then
    Begin
      ShowMessage('Selecione primeiro o grupo!');
      ckbCodigoGRP.Checked:=False;
      exit;
    end
    else
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
      dblCodigoSGP.Enabled:=True;
      dblCodigoSGP.color:=clWindow;
      dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
      dblCodigoSGP.SetFocus;
    end;
  end
  else
  Begin
      dblCodigoSGP.Enabled:=False;
      dblCodigoSGP.color:=AlteraCorComponentes;
      dblCodigoSGP.KeyValue:=0;
  end;
end;

procedure TfMxSelSubGrupo.ckbBaseClick(Sender: TObject);
begin
  if ckbBase.Checked then
  Begin
    edtBase.Enabled:=True;
    edtBase.Color:=clWindow;
    edtBase.SetFocus;
  end
  else
  Begin
    edtBase.Enabled:=False;
    edtBase.Color:=AlteraCorComponentes;
    edtBase.Clear;
  end;
end;

procedure TfMxSelSubGrupo.ckbDescricaoClick(Sender: TObject);
begin
  if ckbDescricao.Checked then
  Begin
    edtDescricao.Color:=clWindow;
    edtDescricao.Enabled:=True;
    edtDescricao.SetFocus;
  end
  else
  Begin
    edtDescricao.Color:=AlteraCorComponentes;
    edtDescricao.Enabled:=False;
    edtDescricao.Clear;
  end;
end;

procedure TfMxSelSubGrupo.ckbFamiliaClick(Sender: TObject);
begin
  if ckbFamilia.Checked then
  Begin
    edtFamilia.Color:=clWindow;
    edtFamilia.Enabled:=True;
    edtFamilia.SetFocus;
  end
  else
  Begin
    edtFamilia.Color:=AlteraCorComponentes;
    edtFamilia.Enabled:=False;
    edtFamilia.Clear;
  end;
end;

procedure TfMxSelSubGrupo.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa = empLBM then
    cmbOrdem.ItemIndex := 0
  else
    cmbOrdem.ItemIndex := 1;
  ckbDescricao.SetFocus;
end;

procedure TfMxSelSubGrupo.ckbObsClick(Sender: TObject);
begin
  if ckbObs.Checked then
  Begin
    edtObs.Color:=clWindow;
    edtObs.Enabled:=True;
    edtObs.SetFocus;
  end
  else
  Begin
    edtObs.Color:=AlteraCorComponentes;
    edtObs.Enabled:=False;
    edtObs.Clear;
  end;
end;

end.
