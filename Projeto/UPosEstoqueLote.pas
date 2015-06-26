unit UPosEstoqueLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, SQuery, SubGrupo,
  DBTables, Mask, Menus;

type
  TfmxProdEstoqueLote = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    grpDetalhe: TGroupBox;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbCodigoFOR: TCheckBox;
    edtCodigoFOR: TEdit;
    ckbDescricao: TCheckBox;
    edtDescricao: TEdit;
    ckbMarca: TCheckBox;
    edtMarca: TEdit;
    ckbCodigoGRP: TCheckBox;
    dblCodigoGRP: TDBLookupComboBox;
    ckbCodigoSGP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtValorX: TEdit;
    rdgEstoque: TRadioGroup;
    ckbDataVencimento: TCheckBox;
    Grupo: TQuery;
    SubGrupo1: TSubGrupo;
    DSGrupo: TDataSource;
    DSSubGrupo1: TDataSource;
    DSCentro_de_Custo: TDataSource;
    Centro_de_Custo: TQuery;
    mskDTINI: TMaskEdit;
    mskDTFIM: TMaskEdit;
    Label2: TLabel;
    cmbParametroProduto: TComboBox;
    PopupMenu1: TPopupMenu;
    sair1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbDataVencimentoClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbDescricaoClick(Sender: TObject);
    procedure ckbMarcaClick(Sender: TObject);
    procedure rdgEstoqueClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmxProdEstoqueLote: TfmxProdEstoqueLote;

implementation

uses Funcoes, UDM, URelPosEstoqueLote;

{$R *.dfm}

procedure TfmxProdEstoqueLote.BitBtn1Click(Sender: TObject);
var
  CodProd, CodFor, DescProd, DescMarc, CodGrp, CodSgp,
  CodCNC, DtValidade, mensagem, Filtro, EstMenos: string;
begin
  CodProd := '';
  CodFor := '';
  DescProd := '';
  DescMarc := '';
  CodGrp := '';
  CodSgp := '';
  CodCNC := '';
  DtValidade := '';
  Filtro := '';

  if ckbCodigoPRD.Checked then
  begin
    if (cmbParametroProduto.text<>'=') and (cmbParametroProduto.text<>'IN') then
      Raise Exception.Create('Parametro de pesquisa inválido!');

    if cmbParametroProduto.text<>'IN' then
      if not VerificaInteiroBranco(edtCodigoPRD.text) then
        raise Exception.Create('Código do produto inválido!');

    Filtro := Filtro + '(Cod.Produto)';

    if cmbParametroProduto.text = '=' then
      CodProd := ' AND IED.PRD_CODIGO='+edtCodigoPRD.text
    else
      if cmbParametroProduto.text = 'IN' then
        CodProd := ' AND IED.PRD_CODIGO IN ('+edtCodigoPRD.text+')';
  end;

  if ckbCodigoFOR.Checked then
  begin
    if not VerificaInteiroBranco(edtCodigoFOR.text) then
      Raise Exception.Create('Código do Fornecedor inválido!');
    with DM.QR_Consultas do
    begin
      Close;
      SQL.Text := 'SELECT FOR_RZ_SOCIAL '+
        ' FROM FORNECEDOR '+
        ' WHERE FOR_CODIGO='+edtCodigoFOR.Text;
      Open;

      if IsEmpty then
        Raise exception.Create('Fornecedor não cadastrado!');
      CodFor := ' AND PRD.FOR_CODIGO='+edtCodigoFOR.Text;
      Filtro := Filtro + '(Cod.Fornecedor)';
    end;
  end;

  if ckbDescricao.Checked then
  begin
    if not VerificaInteiroBranco(edtDescricao.text) then
      Raise Exception.Create('Parametro de pesquisa inválido!');
    Filtro := Filtro + '(Desc.Produto)';
    DescProd := ' AND PRD_DESCRICAO LIKE "%'+edtDescricao.text+'%"';
  end;

  if ckbMarca.Checked then
  begin
    if not VerificaInteiroBranco(edtMarca.text) then
      Raise Exception.Create('Marca inválida!');
    Filtro := Filtro + '(Marca)';
    DescMarc := ' AND PRD_MARCA LIKE "%'+edtMarca.text+'%"';
  end;

  if ckbCodigoGRP.Checked then
  begin
    if dblCodigoGRP.KeyValue = Null then
      Raise Exception.Create('Grupo inválida!');
    Filtro := Filtro + '(Grupo)';
    CodGrp := ' AND PRD.GRP_CODIGO='+inttostr(dblCodigoGRP.KeyValue);
  end;

  if ckbCodigoSGP.Checked then
  begin
    if dblCodigoSGP.KeyValue = Null then
      Raise Exception.Create('Sub-Grupo inválida!');
    Filtro := Filtro + '(Sub-Grupo)';
    CodSgp := ' AND PRD.SGP_CODIGO='+inttostr(dblCodigoSGP.KeyValue);
  end;

  if ckbCodigoCNC.Checked then
  begin
    if dblCodigoCNC.KeyValue = Null then
      Raise Exception.Create('Centro de Custo inválida!');
    Filtro := Filtro + '(Centro)';
    CodCNC := '='+inttostr(dblCodigoCNC.KeyValue);
  end
  else
    CodCNC := ' IS NOT NULL';

  if not VerificaData(mskDTINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDTFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;

  if ckbDataVencimento.Checked then
  begin
    if not VerificaDataBranco(mskDTINI.Text) then
      Raise exception.Create('Data de vencimento inicial inválida!');
    if not VerificaDataBranco(mskDTFIM.Text) then
      Raise exception.Create('Data de vencimento final inválida!');
    Filtro := Filtro + '(Validade)';
    DtValidade := ' AND LOT_DT_VALIDADE>="'+MesDia(mskDTINI.Text)+'"'+
      ' AND LOT_DT_VALIDADE<"'+MesDia(StrToDate(mskDTFIM.Text)+1)+'"';
  end;

  case rdgEstoque.ItemIndex of
    0: Begin
         EstMenos:=' AND (IED.IED_QTD_FISICO < '+VirgPonto(edtValorX.Text)+')';
         Filtro := Filtro + '(QtdLote)(<'+edtValorX.Text+')';
       end;
    1: Begin
         EstMenos:=' AND (IED.IED_QTD_FISICO = '+VirgPonto(edtValorX.Text)+')';
         Filtro := Filtro + '(QtdLote)(='+edtValorX.Text+')';
       end;
    2: Begin
         EstMenos:=' AND (IED.IED_QTD_FISICO > '+VirgPonto(edtValorX.Text)+')';
         Filtro := Filtro + '(QtdLote)(>'+edtValorX.Text+')';
       end;
    3: Begin
         EstMenos:=' AND (IED.IED_QTD_FISICO <= '+VirgPonto(edtValorX.Text)+')';
         Filtro := Filtro + '(QtdLote)(<='+edtValorX.Text+')';
       end;
    4: Begin
         EstMenos:=' AND (IED.IED_QTD_FISICO >= '+VirgPonto(edtValorX.Text)+')';
         Filtro := Filtro + '(QtdLote)(>='+edtValorX.Text+')';
       end;
    5: Begin
         EstMenos:=' AND (IED.IED_QTD_FISICO <> '+VirgPonto(edtValorX.Text)+')';
         Filtro := Filtro + '(QtdLote)(<>'+edtValorX.Text+')';
       end;
  end;

  Application.CreateForm(Trpt_PosEstoqueLote, rpt_PosEstoqueLote);
  with rpt_PosEstoqueLote do
  begin
    zrlFiltros.Caption := Filtro;
    SZRLabel13.Caption := mskDTINI.Text;
    SZRLabel15.Caption := mskDTINI.Text;

    with Item_de_Estoque_Detalhe1 do
    begin
      Close;
      SQL.Add('WHERE IED.CNC_CODIGO'+CodCNC+CodProd+EstMenos+
        CodFor+DescProd+DescMarc+CodGrp+CodSgp+DtValidade);
      SQL.Add('ORDER BY IED.PRD_CODIGO,IED.LOT_CODIGO');
      Open;
    end;

    if Item_de_Estoque_Detalhe1.IsEmpty then
      Raise Exception.Create('Consulta vazia!');

    report.Preview;
  end;
end;

procedure TfmxProdEstoqueLote.ckbCodigoGRPClick(Sender: TObject);
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

procedure TfmxProdEstoqueLote.ckbCodigoSGPClick(Sender: TObject);
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

procedure TfmxProdEstoqueLote.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  begin
    Centro_de_Custo.Open;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.Color:=clWindow;

    if DM.Configuracao1.Empresa <> empLBM then
      dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC
    else if DM.Configuracao1.CodigoCNC = 1 then
      dblCodigoCNC.KeyValue := 2
    else
      dblCodigoCNC.KeyValue := 1;

    if DM.Configuracao1.CodigoCNC = 1 then
      dblCodigoCNC.SetFocus;
  end
  else
  begin
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfmxProdEstoqueLote.ckbDataVencimentoClick(Sender: TObject);
begin
  if ckbDataVencimento.Checked then
  begin
    mskDTINI.Text := '  /  /    ';
    mskDTFIM.Text := '  /  /    ';
    Label2.Enabled := True;
    mskDTINI.Enabled := True;
    mskDTFIM.Enabled := True;
  end
  else
  begin
    mskDTINI.Text := '  /  /    ';
    mskDTFIM.Text := '  /  /    ';
    Label2.Enabled := True;
    mskDTINI.Enabled := False;
    mskDTFIM.Enabled := False;
  end;
end;

procedure TfmxProdEstoqueLote.ckbCodigoPRDClick(Sender: TObject);
begin
  edtCodigoPRD.Text := '';
  if ckbCodigoPRD.Checked then
  begin
    cmbParametroProduto.Enabled := True;
    cmbParametroProduto.ItemIndex := 0;
    edtCodigoPRD.Enabled := True;
    edtCodigoPRD.SetFocus;
  end
  else
  begin
    cmbParametroProduto.ItemIndex := -1;
    edtCodigoPRD.Enabled := False;
    cmbParametroProduto.Enabled := False;
  end;
end;

procedure TfmxProdEstoqueLote.ckbCodigoFORClick(Sender: TObject);
begin
  edtCodigoFOR.Text := '';
  if ckbCodigoFOR.Checked then
  begin
    edtCodigoFOR.Enabled := True;
    edtCodigoFOR.SetFocus;
  end
  else
    edtCodigoFOR.Enabled := False;
end;

procedure TfmxProdEstoqueLote.ckbDescricaoClick(Sender: TObject);
begin
  edtDescricao.Text := '';
  if ckbDescricao.Checked then
  begin
    edtDescricao.Enabled := True;
    edtDescricao.SetFocus;
  end
  else
    edtDescricao.Enabled := False;
end;

procedure TfmxProdEstoqueLote.ckbMarcaClick(Sender: TObject);
begin
  edtMarca.Text := '';
  if ckbMarca.Checked then
  begin
    edtMarca.Enabled := True;
    edtMarca.SetFocus;
  end
  else
    edtMarca.Enabled := False;
end;

procedure TfmxProdEstoqueLote.rdgEstoqueClick(Sender: TObject);
begin
  if not edtValorX.Enabled then
  begin
    edtValorX.Enabled := True;
    edtValorX.Text := '0';
  end;
end;

procedure TfmxProdEstoqueLote.dblCodigoGRPClick(Sender: TObject);
begin
  SubGrupo1.Close;
  SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
  SubGrupo1.Open;
end;

procedure TfmxProdEstoqueLote.sair1Click(Sender: TObject);
begin
  fmxProdEstoqueLote.Close;
end;

procedure TfmxProdEstoqueLote.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

procedure TfmxProdEstoqueLote.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1.OnClick(BitBtn1);
end;

procedure TfmxProdEstoqueLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
