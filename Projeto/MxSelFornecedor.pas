unit MxSelFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Menus, Variants, Parametro,
  CentroCusto;

type
  TfMxSelFornecedor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    cmbOrdem: TComboBox;
    GroupBox3: TGroupBox;
    ckbCodigoFOR: TCheckBox;
    edtCodigoFOR: TEdit;
    ckbSintetico: TCheckBox;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    ckbSituacao: TCheckBox;
    cmbSituacao: TComboBox;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    Centro: string;
  end;

var
  fMxSelFornecedor: TfMxSelFornecedor;

implementation

uses
  UDM, Funcoes, UFornecedor, MxSCotaFor;

{$R *.DFM}


procedure TfMxSelFornecedor.SB_ConfirmarClick(Sender: TObject);
var
  CdCNC, CdFOR, sSituacao, Ordem, sFiltros:string;
begin
  CdCNC:='';
  CdFOR:='';
  sSituacao:='';
  sFiltros:='';

  if ckbCodigoFOR.Checked then
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
      Raise Exception.Create('Código do Fornecedor inválido!')
    else
    Begin
      CdFOR := ' AND (FOR.FOR_CODIGO ='+edtCodigoFOR.Text+') ';
      sFiltros := sFiltros + '(FOR='+edtCodigoFOR.Text+') ';
    end;

  if ckbCodigoCNC.Checked then
  Begin
    if dblCodigoCNC.Text = '' then
      Raise exception.Create('Centro de Custo inválido!');
    CdCNC := ' AND FOR.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';
    sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
  end;

  if ckbSituacao.Checked then
  Begin
    sSituacao := ' AND FOR.FOR_SITUACAO='+IntToStr(cmbSituacao.ItemIndex);
    sFiltros := sFiltros + '(Sit:'+cmbSituacao.text+') ';
  end;

  case cmbOrdem.itemIndex of
    0: Ordem := ' ORDER BY FOR.CNC_CODIGO, FOR.FOR_CODIGO ';
    1: Ordem := ' ORDER BY FOR.CNC_CODIGO, FOR.FOR_RZ_SOCIAL, FOR.FOR_CODIGO ';
    2: Ordem := ' ORDER BY FOR.CNC_CODIGO, FOR.FOR_NOME_FANTASIA, FOR.FOR_CODIGO ';
  end;

  if tag = 0 then
  begin
    Application.CreateForm(Trpt_Fornecedor, rpt_Fornecedor);
    with rpt_Fornecedor do
    Begin
      Tag := 0;
      zrlfiltros.Caption := sFiltros;

      if ckbSintetico.Checked then
      Begin
        zrbCabecalhoPagina.Height := 6;
        zrlLinhaDupla.Top := 5;
        zrbDetalhe.Height   := 1;
      end;

      Entidade.Close;
      Entidade.SQL.Text:='SELECT FOR.* '+
        ' FROM  FORCEDOR FOR '+
        ' WHERE FOR.FOR_CODIGO>0 '+
        CdCNC+CdFOR+sSituacao+
        Ordem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelFornecedor.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxSelFornecedor.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbOrdem.ItemIndex := 1;
  ckbCodigoFOR.SetFocus;
end;

procedure TfMxSelFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxSelFornecedor.ckbCodigoFORClick(Sender: TObject);
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

procedure TfMxSelFornecedor.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=41;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxSelFornecedor.ckbCodigoCNCClick(Sender: TObject);
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

procedure TfMxSelFornecedor.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Enabled:=True;
    cmbSituacao.Color:=clWindow;
    cmbSituacao.ItemIndex:=0;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Enabled:=False;
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
  end;
end;

end.
