unit MxSelInventario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, Db, DBTables, SQuery,
  CentroCusto, Variants;

type
  TfMxSelInventario = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataInicial: TMaskEdit;
    mskDataFinal: TMaskEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ckbProcessados: TCheckBox;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    ckbCentroDeCusto: TCheckBox;
    dblCentroDeCusto: TDBLookupComboBox;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    edtCodigoPRD: TEdit;
    ckbProduto: TCheckBox;
    edtCodigoFOR: TEdit;
    ckbCodigoFOR: TCheckBox;
    ckbSemItens: TCheckBox;
    edtCodigoINV: TEdit;
    ckbCodigoINV: TCheckBox;
    ckbNaoProcessados: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure ckbProdutoClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoINVClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelInventario: TfMxSelInventario;

implementation

uses UDM, funcoes, UInventario, MxSPediProd, MxSPediProdMotCal, MxSCotaFor;

{$R *.DFM}



procedure TfMxSelInventario.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelInventario.BitBtn1Click(Sender: TObject);
var
  mensagem,DataINI,DataFIM,CNC,PRD,CdFOR,CdINV,sSituacao,sFiltros:string;
begin
  mensagem:='';
  CNC:='';
  PRD:='';
  CdFOR:='';
  CdINV:='';
  sSituacao := '';
  DataINI := '';
  DataFIM := '';
  sFiltros := '';
  if not VerificaData(mskDataInicial.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13
  else if VerificaDataBranco(mskDataInicial.Text) then
    DataINI := ' AND (T1.INV_DATA>="'+MesDia(mskDataInicial.Text)+'") ';

  if not VerificaData(mskDataFinal.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13
  else if VerificaDataBranco(mskDataFinal.text) then
    DataFIM := ' AND (T1.INV_DATA<"'+MesDia(StrToDate(mskDataFinal.Text)+1)+'") ';
    
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if ckbCentroDeCusto.Checked then
  Begin
    if dblCentroDeCusto.Text = '' then
      raise Exception.Create('Centro de Custo da origem inválido!')
    else
    Begin
      CNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCentroDeCusto.KeyValue)+') ';
      sFiltros := sFiltros + '(CNC:'+dblCentroDeCusto.Text+')';
    end;
  end;    

  if ckbCodigoINV.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoINV.Text) then
      raise Exception.Create('Código do Inventário inválido!')
    else
    Begin
      CdINV:=' AND (T1.INV_CODIGO='+edtCodigoINV.Text+') ';
      sFiltros := sFiltros + '(INV:'+edtCodigoINV.Text+')';
    end;
  end;

  if ckbCodigoFOR.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
      raise Exception.Create('Código do Fornecedor inválido!')
    else
    Begin
      CdFOR:=' AND (T2.PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO '+
        ' WHERE FOR_CODIGO='+edtCodigoFOR.Text+')) ';
      sFiltros := sFiltros + '(FOR:'+edtCodigoFOR.Text+')';
    end;
  end;

  if ckbProduto.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      raise Exception.Create('Código do produto inválido!')
    else
    Begin
      PRD:=' AND (T2.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;
  end;

  if ckbProcessados.Checked then
    sSituacao := ' AND (T1.INV_SITUACAO=1) '
  else if ckbNaoProcessados.Checked then
    sSituacao := ' AND (T1.INV_SITUACAO=0 OR T1.INV_SITUACAO IS NULL) ';

  Dt_ini := mskDataInicial.Text;
  Dt_fim := mskDataFinal.Text;
  if tag = 0 then
  Begin
    Application.CreateForm(Trpt_Inventario, rpt_Inventario);
    with rpt_Inventario do
    Begin
      zrlFiltros.caption := sFiltros;
      if ckbSemItens.Checked then
        zrbDetalhe.Height := 0;
      zrlDataINI.Caption := mskDataInicial.Text;
      zrlDataFIM.Caption := mskDataFinal.Text;
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM INVENTARIO T1, ITEM_DE_INVENTARIO T2 '+
        ' WHERE T1.INV_CODIGO<>0 '+
        CNC+CdFOR+PRD+DataINI+DataFIM+sSituacao+
        ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
        ' AND T1.INV_CODIGO=T2.INV_CODIGO '+
        ' ORDER BY T1.CNC_CODIGO,T1.INV_CODIGO,T2.IIV_CODIGO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.preview;
      Close;
    end;
  end;
end;

procedure TfMxSelInventario.ckbCentroDeCustoClick(Sender: TObject);
begin
  if ckbCentroDeCusto.Checked then
  Begin
    CentroCusto2.Open;
    dblCentroDeCusto.Color:=clWindow;
    dblCentroDeCusto.Enabled:=True;
    dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
    dblCentroDeCusto.SetFocus;
  end
  else
  Begin
    CentroCusto2.Close;
    dblCentroDeCusto.KeyValue:=-1;
    dblCentroDeCusto.Color:=AlteraCorComponentes;
    dblCentroDeCusto.Enabled:=False;
  end;
end;



procedure TfMxSelInventario.ckbProdutoClick(Sender: TObject);
begin
  if ckbProduto.Checked then
  Begin
    edtCodigoPRD.color  :=clWindow;
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.color  :=AlteraCorComponentes;
    edtCodigoPRD.Text   :='';
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSelInventario.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then 
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=53;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=53;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfMxSelInventario.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.color  :=clWindow;
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.color  :=AlteraCorComponentes;
    edtCodigoFOR.Text   :='';
    edtCodigoFOR.Enabled:=False;
  end;
end;

procedure TfMxSelInventario.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoFOR.Text:='';
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    edtCodigoFOR.Clear;
    fMxSCotaFor.tag:=33;
    fMxSCotaFor.ShowModal;
  End;
end;

procedure TfMxSelInventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxSelInventario.ckbCodigoINVClick(Sender: TObject);
begin
  if ckbCodigoINV.Checked then
  Begin
    edtCodigoINV.color  :=clWindow;
    edtCodigoINV.Enabled:=True;
    edtCodigoINV.SetFocus;
  end
  else
  Begin
    edtCodigoINV.color  :=AlteraCorComponentes;
    edtCodigoINV.Clear;
    edtCodigoINV.Enabled:=False;
  end;
end;

procedure TfMxSelInventario.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
