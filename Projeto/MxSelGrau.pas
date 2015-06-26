unit MxSelGrau;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Menus, Variants, Grau;

type
  TfMxSelGrau = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    BitBtn2: TBitBtn;
    Grupo: TQuery;
    DSGrupo: TDataSource;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    cmbOrdem: TComboBox;
    GroupBox3: TGroupBox;
    dblCodigoGRP: TDBLookupComboBox;
    ckbCodigoGRP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoSGP: TCheckBox;
    dblCodigoGRA: TDBLookupComboBox;
    ckbCodigoGRA: TCheckBox;
    Grau1: TGrau;
    DSGrau1: TDataSource;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoGRAClick(Sender: TObject);
  private
    { Private declarations }
  public
    Centro: string;
  end;

var
  fMxSelGrau: TfMxSelGrau;

implementation

uses
  UProduto, funcoes, uEstoque, MxSPediProd, MxSCotaFor, UDM, UPrev_vendas,
  USugestaoCmp, UFornProd, UTransferenciaNecessaria, UProdutoSite,
  UProduto_Colunas, UProdutoSubGrupo, MxSPediProdMotCal, UListaoInvent,
  UGrau;

{$R *.DFM}


procedure TfMxSelGrau.SB_ConfirmarClick(Sender: TObject);
var
  cGRP,cSGP,cGRA,Ordem, sFiltros:string;
begin
  cGRP:='';
  cSGP:='';
  cGRA:='';
  sFiltros:='';

  if ckbCodigoGRP.Checked then
    if dblCodigoGRP.Text = '' then
      Raise Exception.Create('Grupo inválido!')
    else
    Begin
      cGRP := ' AND (G1.GRP_CODIGO ='+IntToStr(dblCodigoGRP.KeyValue)+') ';
      sFiltros := sFiltros + '(GRP='+dblCodigoGRP.Text+') ';
    end;

  if ckbCodigoSGP.Checked then
    if dblCodigoSGP.Text = '' then
      Raise Exception.Create('SubGrupo inválido!')
    else
    Begin
      cSGP := ' AND (G1.SGP_CODIGO ='+IntToStr(dblCodigoSGP.KeyValue)+') ';
      sFiltros := sFiltros + '(SGP='+dblCodigoSGP.Text+') ';
    end;

  if ckbCodigoGRA.Checked then
    if dblCodigoGRA.Text = '' then
      Raise Exception.Create('Grau inválido!')
    else
    Begin
      cGRA := ' AND (G1.GRA_CODIGO ='+IntToStr(dblCodigoGRA.KeyValue)+') ';
      sFiltros := sFiltros + '(GRA='+dblCodigoGRA.Text+') ';
    end;


  case cmbOrdem.itemIndex of
    0: Ordem := ' ORDER BY G2.GRP_DESCRICAO, G2.GRP_CODIGO, S1.SGP_DESCRICAO, S1.SGP_CODIGO, G1.GRA_CODIGO ';
    1: Ordem := ' ORDER BY G2.GRP_DESCRICAO, G2.GRP_CODIGO, S1.SGP_DESCRICAO, S1.SGP_CODIGO, G1.GRA_GRAU ';
  end;

  if tag = 0 then
  begin
    Application.CreateForm(Trpt_Grau, rpt_Grau);
    with rpt_Grau do
    Begin
      Tag := 0;
      zrlfiltros.Caption := sFiltros;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
        ' FROM  GRAU G1, GRUPO G2, SUBGRUPO S1 '+
        ' WHERE G1.GRA_CODIGO>0 '+
        cGRP+cSGP+cGRA+
        ' AND G1.GRP_CODIGO=G2.GRP_CODIGO '+
        ' AND G1.SGP_CODIGO=S1.SGP_CODIGO '+
        ' AND G2.GRP_CODIGO=S1.GRP_CODIGO '+
        Ordem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelGrau.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelGrau.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo.Close;
  SubGrupo1.Close;
  Grau1.Close;
  Action := caFree;
end;


procedure TfMxSelGrau.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbOrdem.ItemIndex:=0;
  ckbCodigoGRP.SetFocus;
end;

procedure TfMxSelGrau.ckbCodigoGRPClick(Sender: TObject);
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

procedure TfMxSelGrau.ckbCodigoSGPClick(Sender: TObject);
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

procedure TfMxSelGrau.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxSelGrau.ckbCodigoGRAClick(Sender: TObject);
begin
  if ckbCodigoGRA.Checked then
  Begin
    Grau1.Open;
    dblCodigoGRA.Enabled:=True;
    dblCodigoGRA.Color:=clWindow;
    dblCodigoGRA.KeyValue:=Grau1.CodigoGRA;
    dblCodigoGRA.SetFocus;
  end
  else
  Begin
    Grau1.Close;
    dblCodigoGRA.Enabled:=False;
    dblCodigoGRA.Color:=AlteraCorComponentes;
    dblCodigoGRA.KeyValue:=0;
  end;
end;

end.
