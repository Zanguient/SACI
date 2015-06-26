unit MxSelBonusVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, CentroCusto, DBCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Vendedor, Variants;

type
  TfMxSelBonusVendedor = class(TForm)
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Panel2: TPanel;
    ckbCodigoCNC: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbSomenteBonus1: TCheckBox;
    ckbSomenteBonus2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    dblVendedor: TDBLookupComboBox;
    ckbVendedor: TCheckBox;
    ckbCodigoPedido: TCheckBox;
    edtCodigoPedido: TEdit;
    ckbSintetico: TCheckBox;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    Bevel1: TBevel;
    procedure SB_CancelarClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbSomenteBonus1Click(Sender: TObject);
    procedure ckbSomenteBonus2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoPedidoClick(Sender: TObject);
    procedure ckbVendedorClick(Sender: TObject);
    procedure Vendedor1BeforeOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelBonusVendedor: TfMxSelBonusVendedor;

implementation
uses UDM, funcoes, MxSPediProd, Urpt_bonusvendedor, CdCliente,
  MxSPediProdMotCal;
{$R *.DFM}

procedure TfMxSelBonusVendedor.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelBonusVendedor.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
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
        Tag:=34;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=34;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfMxSelBonusVendedor.SB_ConfirmarClick(Sender: TObject);
var
  DataINI,DataFIM,CdPRD,CdCNC,CdPDV,Vend,sFiltros:string;
begin
  CdPRD:='';
  CdCNC:='';
  Vend:='';
  CdPDV:='';
  sFiltros:='';

  if not VerificaData(mskDataINI.Text) then
    Raise Exception.Create('Data inicial inválida!')
  else if VerificaDataBranco(mskDataINI.Text) then
    DataINI := ' AND DIB_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'" ';

  if not VerificaData(mskDataFIM.Text) then
    Raise Exception.Create('Data final inválida!')
  else if VerificaDataBranco(mskDataINI.Text) then
    DataFIM := ' AND DIB_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';

  if ckbCodigoPRD.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      Raise Exception.Create('Código de Produto inválido!')
    else
    Begin
      CdPRD:=' AND (PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;
  end;

  if ckbCodigoCNC.Checked then
  Begin
    CdCNC:=' AND (CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
    sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
  end;

  if ckbVendedor.Checked then
  Begin
    if dblVendedor.Text = '' then
      Raise Exception.Create('Vendedor inválido!')
    else
    Begin
      Vend:=' AND (FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+') ';
      sFiltros := sFiltros + '(Vend:'+dblVendedor.Text+')';
    end;
  end;

  if ckbCodigoPedido.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPedido.Text) then
      Raise Exception.Create('Código do pedido inválido!')
    else
    Begin
      CdPDV:=' AND (PDV_CODIGO='+edtCodigoPedido.Text+') ';
      sFiltros := sFiltros + '(PDV:'+edtCodigoPedido.Text+')';
    end;
  end;

  Application.CreateForm(Trpt_BonusVendedor,rpt_BonusVendedor);
  with rpt_BonusVendedor do
  Begin
    tag:=0;
    zrlFiltros.Caption := sFiltros;
    if ckbSintetico.Checked then
    Begin
      zrgGrupoFUN.Height := 2;
      zrbDetalhe.Height := 0;
    end;
    zrldataINI.Caption := mskDataINI.Text;
    zrldataFIM.Caption := mskDataFIM.Text;
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM DIREITO_DE_BONUS D1 '+
      ' WHERE D1.DIB_SITUACAO=0 '+
      DataINI+DataFIM+CdCNC+CdPRD+Vend+CdPDV+
      ' ORDER BY D1.CNC_CODIGO,D1.FUN_CODIGO,D1.PDV_CODIGO,D1.PRD_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxSelBonusVendedor.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Enabled:=False;
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Clear;
  end;
end;

procedure TfMxSelBonusVendedor.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
    ckbVendedor.Enabled:=True;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
    ckbVendedor.Checked:=False;
    ckbVendedor.Enabled:=False;
  end;
end;

procedure TfMxSelBonusVendedor.ckbSomenteBonus1Click(Sender: TObject);
begin
  if ckbSomenteBonus1.Checked then
    ckbSomenteBonus2.Checked := False;
end;

procedure TfMxSelBonusVendedor.ckbSomenteBonus2Click(Sender: TObject);
begin
  if ckbSomenteBonus2.Checked then
    ckbSomenteBonus1.Checked := False;
end;

procedure TfMxSelBonusVendedor.FormShow(Sender: TObject);
var
  cDia,cMes,cMes2,cAno:string;
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cDia:=formatDateTime('dd',DM.Configuracao1.Data);
  cMes:=formatDateTime('mm',DM.Configuracao1.Data);
  cAno:=formatDateTime('yyyy',DM.Configuracao1.Data);
  if StrToInt(cMes) > 9 then
    cMes2:=IntToStr(StrToInt(cMes)-1)
  else
    cMes2:='0'+IntToStr(StrToInt(cMes)-1);
  if (StrToInt(cMes)=1) then
  Begin
    mskDataINI.Text:='21/12/'+IntToStr(StrToInt(cAno)-1);
    mskDataFIM.Text:='20/'+cMes+'/'+cAno;
  end
  else
  Begin
    mskDataINI.Text:='21/'+cMes2+'/'+cAno;
    mskDataFIM.Text:='20/'+cMes+'/'+cAno;
  end;
end;

procedure TfMxSelBonusVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure TfMxSelBonusVendedor.ckbCodigoPedidoClick(Sender: TObject);
begin
  if ckbCodigoPedido.Checked then
  Begin
    edtCodigoPedido.Enabled:=True;
    edtCodigoPedido.Color:=clWindow;
    edtCodigoPedido.SetFocus;
  end
  else
  Begin
    edtCodigoPedido.Enabled:=False;
    edtCodigoPedido.Color:=AlteraCorComponentes;
    edtCodigoPedido.Clear;
  end;
end;

procedure TfMxSelBonusVendedor.ckbVendedorClick(Sender: TObject);
begin
  if ckbVendedor.Checked then
  Begin
    Vendedor1.Open;
    dblVendedor.Enabled:=True;
    dblVendedor.Color:=clWindow;
    dblVendedor.KeyValue:=Vendedor1.CodigoFUN;
    dblVendedor.SetFocus;
  end
  else
  Begin
    Vendedor1.Close;
    dblVendedor.Enabled:=False;
    dblVendedor.Color:=AlteraCorComponentes;
    dblVendedor.KeyValue:=-1;
  end;
end;

procedure TfMxSelBonusVendedor.Vendedor1BeforeOpen(DataSet: TDataSet);
begin
  Vendedor1.ParamByName('CNC_CODIGO').asInteger:=dblCodigoCNC.KeyValue;
end;

procedure TfMxSelBonusVendedor.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
    SB_ConfirmarClick(sender)
  else if key =#27 then
    SB_CancelarClick(sender);
end;

end.
