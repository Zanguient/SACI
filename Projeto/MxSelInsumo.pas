unit MxSelInsumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Menus, Variants, CategProd,
  Funcionario, Classificacao_fiscal;

type
  TfMxSelInsumo = class(TForm)
    Panel1: TPanel;
    edtCodigoPRD: TEdit;
    edtCodigoFOR: TEdit;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Grupo: TQuery;
    DSGrupo: TDataSource;
    dblCodigoGRP: TDBLookupComboBox;
    dblCodigoCNC: TDBLookupComboBox;
    Centro_de_Custo: TQuery;
    DSCentro_de_Custo: TDataSource;
    ckbCodigoCNC: TCheckBox;
    ckbCodigoGRP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    ckbProdutosDesativados: TCheckBox;
    ckbCodigoSGP: TCheckBox;
    ckbCodigoFOR: TCheckBox;
    ckbCodigoPRD: TCheckBox;
    ckbReferencia: TCheckBox;
    edtReferencia: TEdit;
    ckbCategoria: TCheckBox;
    dblCategoria: TDBLookupComboBox;
    CategProd1: TCategProd;
    DSCategor: TDataSource;
    Funcionario1: TFuncionario;
    DSVendedor: TDataSource;
    ckbClassificacaoFiscal: TCheckBox;
    dblClassificacaoFiscal: TDBLookupComboBox;
    dsClassific: TDataSource;
    Classificacao_fiscal1: TClassificacao_fiscal;
    cmbOrdem: TComboBox;
    Label3: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    rdgDataCadastro: TRadioButton;
    rdgDataAlterado: TRadioButton;
    Bevel1: TBevel;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure ckbCategoriaClick(Sender: TObject);
    procedure ckbClassificacaoFiscalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelInsumo: TfMxSelInsumo;
  Centro:string;

implementation

uses
  UProduto, funcoes, UDM, UInsumos, MxSPediProd, MxSCotaFor ,
  MxSPediProdMotCal;

{$R *.DFM}


procedure TfMxSelInsumo.SB_ConfirmarClick(Sender: TObject);
var
  DataINI,DataFIM,cCLF,cCTP,cPRD,cFOR,cGRP,cSGP,cRef, sFiltros:string;
begin
  Centro:='';
  cPRD:='';
  cCTP:='';
  cCLF:='';
  cGRP:='';
  cSGP:='';
  cRef:='';
  sFiltros:='';

  if not VerificaData(mskDataINI.Text) then
    Raise Exception.Create('Data inicial inválida!')
  else
    if not VerificaDataBranco(mskDataINI.Text)then
      DataINI := ''
    else
      if rdgDataAlterado.Checked then
        DataINI := ' AND T1.INS_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'" '
      else
      if rdgDataCadastro.Checked then
        DataINI := ' AND T1.INS_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'" ';

  if not VerificaData(mskDataFIM.Text) then
    Raise Exception.Create('Data final inválida!')
  else
    if not VerificaDataBranco(mskDataFIM.Text)then
      DataFIM := ''
    else
      if rdgDataAlterado.Checked then
        DataFIM := ' AND T1.INS_DT_ALTERADO>="'+MesDia(mskDataFIM.Text)+'" '
      else
      if rdgDataCadastro.Checked then
        DataFIM := ' AND T1.INS_DT_CADASTRO>="'+MesDia(mskDataFIM.Text)+'" ';

  //filtro produto
  if ckbCodigoPRD.Checked=True then
    if not VerificaInteiroBranco(edtCodigoPRD.text) then
      Raise Exception.Create('Código do produto inválido!')
    else
    begin
      cPRD:=' AND (T1.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros:=sfiltros+' (Produto) ';
    end;

  //filtro referencia
  if ckbReferencia.Checked then
  begin
    cRef := ' AND (T2.PRD_REFERENCIA ="'+edtReferencia.Text+'") ';
    sFiltros:=sfiltros+' (Referência:'+edtReferencia.Text+') ';
  end;

  //filtro fornecedor
  if ckbCodigoFOR.Checked=True then
    if not VerificaInteiroBranco(edtCodigoFOR.text) then
      Raise Exception.Create('Código do Fornecedor inválido!')
    else
    begin
      cFOR:=' AND (T2.FOR_CODIGO = '+edtCodigoFOR.Text+') ';
      sFiltros:=sfiltros+' (Fornec.:'+edtCodigoFOR.Text+') ';
    end;

  ///filtro grupo
  if ckbCodigoGRP.Checked then
    if dblCodigoGRP.Text = '' then
      Raise Exception.Create('Grupo inválido!')
    else
    begin
       cGRP := ' AND (T2.GRP_CODIGO ='+IntToStr(dblCodigoGRP.KeyValue)+') ';
       sFiltros:=sfiltros+' (Grupo:'+dblCodigoGRP.Text+') ';
    end;

  //filtro subgrupo
  if ckbCodigoSGP.Checked then
    if dblCodigoSGP.Text = '' then
      Raise Exception.Create('SubGrupo inválido!')
    else
    begin
      cSGP := ' AND (T2.SGP_CODIGO ='+IntToStr(dblCodigoSGP.KeyValue)+') ';
      sFiltros:=sfiltros+' (SubGrupo:'+dblCodigoSGP.Text+') ';
    end;

  //filtro CNC
  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    begin
      Centro:=' AND (T2.CNC_CODIGO = '+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros:=sfiltros+' (CNC:'+dblCodigoCNC.Text+') ';
    end;

  //filtro categoria
  if ckbCategoria.Checked then
    if dblCategoria.Text = '' then
      Raise Exception.Create('Categoria inválida!')
    else
    begin
      cCTP:=' AND (T2.CTP_CODIGO = '+IntToStr(dblCategoria.KeyValue)+') ';
      sFiltros:=sfiltros+' (Categ.:'+dblCategoria.Text+') ';
    end;

  //filtro classificação fiscal
  if ckbClassificacaoFiscal.Checked then
    if dblClassificacaoFiscal.Text = '' then
      Raise Exception.Create('Classificacao Fiscal inválida!')
    else
    begin
      cCLF:=' AND (T2.CLF_CODIGO = '+IntToStr(dblClassificacaoFiscal.KeyValue)+') ';
      sFiltros:=sfiltros+' (CLF:'+dblClassificacaoFiscal.Text+') ';
    end;



  // Relatório Insumos de Produtos
  if Tag = 0 then
  begin
    Application.CreateForm(Trpt_Insumos,rpt_Insumos);
    rpt_Insumos.Insumos1.Close;
    rpt_Insumos.Insumos1.SQL.Text:='SELECT T1.PRD_CODIGO,'+
      ' INS_PRD_CODIGO,INS_QUANTIDADE,INS_DT_ALTERADO,T2.GRP_CODIGO,'+
      ' INS_DT_cADASTRO, T2.SGP_CODIGO'+
      ' FROM INSUMO T1, PRODUTO T2' +
      ' WHERE (T1.INS_PRD_CODIGO<>-1) ' +
      ' AND T1.PRD_CODIGO=T2.PRD_CODIGO '+
      DataINI+DataFIM+Centro+cRef+cPRD+cCTP+cCLF+cGRP+cSGP+cFOR+
      ' AND (T1.PRD_CODIGO=T2.PRD_CODIGO) '+
      ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
      ' GROUP BY T1.PRD_CODIGO,T1.INS_QUANTIDADE, T2.GRP_CODIGO,T2.SGP_CODIGO,'+
      ' T1.INS_PRD_CODIGO,T1.INS_PRD_CODIGO, INS_DT_ALTERADO, INS_DT_CADASTRO';
     rpt_Insumos.Insumos1.Open;
    if rpt_Insumos.Insumos1.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    rpt_Insumos.SZRLabel15.Caption:=mskDataINI.Text;
    rpt_Insumos.SZRLabel17.Caption:=mskDataFIM.Text;
    rpt_Insumos.zrlFiltros.Caption:=sFiltros;
    rpt_Insumos.report.Preview;
    rpt_Insumos.Close;
  end
end;

procedure TfMxSelInsumo.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelInsumo.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=46;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=46;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxSelInsumo.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.tag:=18;
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxSelInsumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo.Close;
  SubGrupo1.Close;
  Centro_de_Custo.Close;
  Action := caFree;
end;

procedure TfMxSelInsumo.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  begin
    Centro_de_Custo.Open;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  begin
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelInsumo.ckbCodigoGRPClick(Sender: TObject);
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

procedure TfMxSelInsumo.dblCodigoGRPClick(Sender: TObject);
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

procedure TfMxSelInsumo.ckbCodigoSGPClick(Sender: TObject);
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

procedure TfMxSelInsumo.ckbCodigoFORClick(Sender: TObject);
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
    edtCodigoFOR.Enabled:=False;
    edtCodigoFOR.Clear;
  end;
end;

procedure TfMxSelInsumo.ckbCodigoPRDClick(Sender: TObject);
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
    edtCodigoPRD.Enabled:=False;
    edtCodigoPRD.Clear;
  end;
end;

procedure TfMxSelInsumo.ckbReferenciaClick(Sender: TObject);
begin
  if ckbReferencia.Checked then
  Begin
    edtReferencia.Enabled:=True;
    edtReferencia.Color:=clWindow;
    edtReferencia.SetFocus;
  end
  else
  Begin
    edtReferencia.Enabled:=False;
    edtReferencia.Color:=AlteraCorComponentes;
    edtReferencia.Clear;
  end;
end;

procedure TfMxSelInsumo.ckbCategoriaClick(Sender: TObject);
begin
  if ckbCategoria.Checked then
  begin
    CategProd1.Open;
    dblCategoria.Enabled:=True;
    dblCategoria.Color:=clWindow;
    dblCategoria.KeyValue:=CategProd1.FieldByName('CTP_CODIGO').asInteger;
    dblCategoria.SetFocus;
  end
  else
  begin
    dblCategoria.Enabled:=False;
    dblCategoria.Color:=AlteraCorComponentes;
    dblCategoria.KeyValue:=-1;
  end;
end;

procedure TfMxSelInsumo.ckbClassificacaoFiscalClick(Sender: TObject);
begin
  if ckbClassificacaoFiscal.Checked then
  begin
    Classificacao_fiscal1.Open;
    dblClassificacaoFiscal.Enabled:=True;
    dblClassificacaoFiscal.Color:=clWindow;
    dblClassificacaoFiscal.KeyValue:=Classificacao_fiscal1.FieldByName('CLF_CODIGO').asInteger;
    dblClassificacaoFiscal.SetFocus;
  end
  else
  begin
    dblClassificacaoFiscal.Enabled:=False;
    dblClassificacaoFiscal.Color:=AlteraCorComponentes;
    dblClassificacaoFiscal.KeyValue:=-1;
  end;

end;

procedure TfMxSelInsumo.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
