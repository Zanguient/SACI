unit MxProdutoSite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Buttons, DB, SubGrupo, Grupo,
  DBTables, SQuery, Produto;

type
  TfMxProdutoSite = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtProduto: TEdit;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Produto1: TProduto;
    ProdutoSite1: TSQuery;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    SubGrupo2: TSubGrupo;
    Grupo2: TGrupo;
    DSGrupo1: TDataSource;
    DSGrupo2: TDataSource;
    DSSubGrupo1: TDataSource;
    DSSubGrupo2: TDataSource;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtCodigoPRD: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtCodigoPRDSite: TEdit;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxProdutoSite: TfMxProdutoSite;

implementation
uses UDM, Funcoes;

{$R *.dfm}

procedure TfMxProdutoSite.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Grupo1.Open;
  Grupo2.Open;
  SubGrupo1.Open;
  SubGrupo2.Open;
  edtCodigoPRD.Text := IntToStr(Produto1.CodigoPRD);
  edtProduto.Text := Produto1.Descricao;
  DBLookupComboBox1.KeyValue := Produto1.CodigoGRP;
  DBLookupComboBox2.KeyValue := Produto1.CodigoSGP;
  if RadioButton1.Checked then
  Begin
    edtCodigoPRDSite.Text := IntToStr(Produto1.CodigoPRD);
    Edit2.Text := Produto1.Descricao;
    DBLookupComboBox3.KeyValue := Produto1.CodigoGRP;
    DBLookupComboBox4.KeyValue := Produto1.CodigoSGP;
  end
  else
  Begin
    edtCodigoPRDSite.Text := ProdutoSite1.FieldByName('PRD_CODIGO').asString;
    Edit2.Text := ProdutoSite1.FieldByName('PRD_DESCRICAO').asString;
    DBLookupComboBox3.KeyValue := ProdutoSite1.FieldByName('GRP_CODIGO').asInteger;
    DBLookupComboBox4.KeyValue := ProdutoSite1.FieldByName('SGP_CODIGO').asInteger;
  end;
end;

procedure TfMxProdutoSite.BitBtn1Click(Sender: TObject);
begin
  if Edit2.Text = '' then
    Raise Exception.Create('Descrição inválida!');
  if not DBLookupComboBox3.KeyValue > 0 then
    Raise Exception.Create('Grupo inválido!');
  if RadioButton1.Checked then
    ExecutaSQL(DM.QR_Comandos,'INSERT INTO PRODUTO_SITE VALUES('+
      edtCodigoPRDSite.Text+',"'+Edit2.Text+'",'+IntToStr(DBLookupComboBox3.KeyValue)+
      ','+IntToStr(DBLookupComboBox4.KeyValue)+')')
  else
    ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO_SITE SET '+
      ' PRD_DESCRICAO="'+Edit2.Text+'"'+
      ',GRP_CODIGO='+IntToStr(DBLookupComboBox3.KeyValue)+
      ',SGP_CODIGO='+IntToStr(DBLookupComboBox4.KeyValue)+
      ' WHERE PRD_CODIGO='+edtCodigoPRDSite.Text);
  Close;
end;

procedure TfMxProdutoSite.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxProdutoSite.BitBtn3Click(Sender: TObject);
begin
  ExecutaSQL(DM.QR_Comandos,'DELETE FROM PRODUTO_SITE '+
    ' WHERE PRD_CODIGO='+edtCodigoPRDSite.Text);
  Close;
end;

end.
