unit MxGraficoMetaPorVendedor;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, Chart, Series, DbChart, Teengine, TeeProcs, Printers,
  ActnList, ActnMan, Menus, CustomizeDlg, ActnCtrls, ToolWin, ActnMenus,
  Spin, ExtDlgs, XPStyleActnCtrls;

type
  TfMxGraficoMetaPorVendedor = class(TForm)
    DBChart1: TDBChart;
    DataSource1: TDataSource;
    Query1: TQuery;
    ControlBar1: TControlBar;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManager1: TActionManager;
    aAjuda2: TAction;
    aSobre2: TAction;
    aCopiar3: TAction;
    aImprimir1: TAction;
    aFechar1: TAction;
    aExibirBarra4: TAction;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ckb3D: TCheckBox;
    spe3D: TSpinEdit;
    GroupBox3: TGroupBox;
    spePtsPage: TSpinEdit;
    bbtnPreviousPage: TBitBtn;
    bbthNextPage: TBitBtn;
    GroupBox4: TGroupBox;
    ckbLegenda: TCheckBox;
    rdgPosicaoLegenda: TRadioGroup;
    rdgBarra: TRadioGroup;
    GroupBox5: TGroupBox;
    cmbStyle1: TComboBox;
    ckbMarcas1: TCheckBox;
    cmbTipoMarcas1: TComboBox;
    cmbTipoLegenda: TComboBox;
    clbCorLegendaFundo: TColorBox;
    Label2: TLabel;
    clbCorLegendaTexto: TColorBox;
    Label3: TLabel;
    Query1DESCRICAO: TStringField;
    Query1TOTAL: TFloatField;
    Series1: TBarSeries;
    ckbSeries1: TCheckBox;
    ckbSeries3: TCheckBox;
    ckbMarcas3: TCheckBox;
    cmbTipoMarcas3: TComboBox;
    Bevel1: TBevel;
    cmbStyle3: TComboBox;
    Action1: TAction;
    SavePictureDialog1: TSavePictureDialog;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure aImprimir1Execute(Sender: TObject);
    procedure aFechar1Execute(Sender: TObject);
    procedure aCopiar3Execute(Sender: TObject);
    procedure aAjuda2Execute(Sender: TObject);
    procedure aSobre2Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckb3DClick(Sender: TObject);
    procedure spe3DChange(Sender: TObject);
    procedure spePtsPageChange(Sender: TObject);
    procedure bbtnPreviousPageClick(Sender: TObject);
    procedure ckbLegendaClick(Sender: TObject);
    procedure rdgPosicaoLegendaClick(Sender: TObject);
    procedure rdgBarraClick(Sender: TObject);
    procedure ckbMarcas1Click(Sender: TObject);
    procedure aExibirBarra4Execute(Sender: TObject);
    procedure cmbStyle1Change(Sender: TObject);
    procedure cmbTipoMarcas1Change(Sender: TObject);
    procedure cmbTipoLegendaChange(Sender: TObject);
    procedure clbCorLegendaFundoChange(Sender: TObject);
    procedure clbCorLegendaTextoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ckbSeries1Click(Sender: TObject);
    procedure ckbSeries3Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxGraficoMetaPorVendedor:TfMxGraficoMetaPorVendedor;

implementation

uses UDM, Funcoes, MxSobre, Windows;

{$R *.DFM}


procedure TfMxGraficoMetaPorVendedor.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Query1.Active := True;
  LendoProps := False;
  aExibirBarra4Execute(sender);
  LendoProps := True;
  cmbTipoLegendaChange(sender);
  cmbStyle1Change(sender);
  cmbTipoMarcas1Change(sender);
  clbCorLegendaFundoChange(sender);
  clbCorLegendaTextoChange(sender);
end;

procedure TfMxGraficoMetaPorVendedor.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=chr(27) then
    Close;
end;

procedure TfMxGraficoMetaPorVendedor.aImprimir1Execute(Sender: TObject);
begin
  DBChart1.PrintLandscape;
end;

procedure TfMxGraficoMetaPorVendedor.aFechar1Execute(Sender: TObject);
begin
  Close;
end;

procedure TfMxGraficoMetaPorVendedor.aCopiar3Execute(Sender: TObject);
begin
  DBChart1.CopyToClipboardMetafile(True);
end;

procedure TfMxGraficoMetaPorVendedor.aAjuda2Execute(Sender: TObject);
begin
  Application.HelpCommand(HELP_FINDER, 1);
end;

procedure TfMxGraficoMetaPorVendedor.aSobre2Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSobre, fMxSobre);
  fMxSobre.ShowModal;
end;

procedure TfMxGraficoMetaPorVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxGraficoMetaPorVendedor.ckb3DClick(Sender: TObject);
begin
  DBChart1.View3D := ckb3D.Checked;
  spe3D.Enabled   := ckb3D.Checked;
end;

procedure TfMxGraficoMetaPorVendedor.spe3DChange(Sender: TObject);
begin
  DBChart1.Chart3DPercent := spe3D.Value;
end;

procedure TfMxGraficoMetaPorVendedor.spePtsPageChange(Sender: TObject);
begin
  DBChart1.MaxPointsPerPage := spePtsPage.Value;
end;

procedure TfMxGraficoMetaPorVendedor.bbtnPreviousPageClick(Sender: TObject);
begin
  if (Sender as TBitBtn) = bbtnPreviousPage then
    DBChart1.PreviousPage
  else
    DBChart1.NextPage;
end;

procedure TfMxGraficoMetaPorVendedor.rdgBarraClick(Sender: TObject);
begin
  Series1.MultiBar := TMultibar(rdgBarra.ItemIndex);
end;

procedure TfMxGraficoMetaPorVendedor.ckbLegendaClick(Sender: TObject);
begin
  DBChart1.Legend.Visible    := ckbLegenda.Checked;
  cmbTipoLegenda.Enabled     := ckbLegenda.Checked;
  rdgPosicaoLegenda.Enabled  := ckbLegenda.Checked;
  clbCorLegendaTexto.Enabled := ckbLegenda.Checked;
  clbCorLegendaFundo.Enabled := ckbLegenda.Checked;
end;

procedure TfMxGraficoMetaPorVendedor.rdgPosicaoLegendaClick(Sender: TObject);
begin
  DBChart1.Legend.Alignment := TLegendAlignment(rdgPosicaoLegenda.ItemIndex);
end;

procedure TfMxGraficoMetaPorVendedor.ckbMarcas1Click(Sender: TObject);
begin
  Series1.Marks.Visible := ckbMarcas1.Checked;
  cmbTipoMarcas1.Enabled    := ckbMarcas1.Checked;
end;

procedure TfMxGraficoMetaPorVendedor.aExibirBarra4Execute(Sender: TObject);
begin
  if LendoProps then
    aExibirBarra4.Checked := (not aExibirBarra4.Checked);
  Panel1.Visible := aExibirBarra4.Checked;
end;

procedure TfMxGraficoMetaPorVendedor.cmbStyle1Change(Sender: TObject);
begin
  Series1.BarStyle := TBarStyle(cmbStyle1.itemindex);
end;

procedure TfMxGraficoMetaPorVendedor.cmbTipoMarcas1Change(Sender: TObject);
begin
  case cmbTipoMarcas1.ItemIndex of
    0: Series1.Marks.Style := smsLabel;
    1: Series1.Marks.Style := smsLabelPercent;
    2: Series1.Marks.Style := smsLabelValue;
    3: Series1.Marks.Style := smsLegend;
    4: Series1.Marks.Style := smsPercent;
    5: Series1.Marks.Style := smsValue;
    6: Series1.Marks.Style := smsXValue;
  end;
end;

procedure TfMxGraficoMetaPorVendedor.cmbTipoLegendaChange(Sender: TObject);
begin
  case cmbTipoLegenda.ItemIndex of
    0: DBChart1.Legend.TextStyle := ltsLeftPercent;
    1: DBChart1.Legend.TextStyle := ltsLeftValue;
    2: DBChart1.Legend.TextStyle := ltsPlain;
    3: DBChart1.Legend.TextStyle := ltsRightPercent;
    4: DBChart1.Legend.TextStyle := ltsRightValue;
    5: DBChart1.Legend.TextStyle := ltsXValue;
  end;
end;

procedure TfMxGraficoMetaPorVendedor.clbCorLegendaFundoChange(Sender: TObject);
begin
  DBChart1.Legend.Color := clbCorLegendaFundo.Selected;
end;

procedure TfMxGraficoMetaPorVendedor.clbCorLegendaTextoChange(
  Sender: TObject);
begin
  DBChart1.Legend.Font.Color := clbCorLegendaTexto.Selected;
end;

procedure TfMxGraficoMetaPorVendedor.FormCreate(Sender: TObject);
begin
  LendoProps := False;
  LerPreferencias(self,DM.Configuracao1.PastaSistema+'\GraficoMetasVendedor.cfg');
  LendoProps := True;
end;

procedure TfMxGraficoMetaPorVendedor.FormDestroy(Sender: TObject);
begin
  SalvarPreferencias(self,DM.Configuracao1.PastaSistema+'\GraficoMetasVendedor.cfg',
    ['ckb3D.Checked','spe3D.Value','spePtsPage.Value','ckbLegenda.Checked',
    'cmbTipoLegenda.ItemIndex','rdgPosicaoLegenda.ItemIndex',
    'clbCorLegendaTexto.Selected','clbCorLegendaFundo.Selected',
    'rdgBarra.ItemIndex','cmbStyle1.ItemIndex','cmbStyle2.ItemIndex',
    'ckbMarcas1.Checked','ckbMarcas2.Checked','ckbMarcas3.Checked',
    'cmbTipoMarcas1.ItemIndex','cmbTipoMarcas2.ItemIndex',
    'cmbTipoMarcas3.ItemIndex','aExibirBarra4.Checked','ckbSeries1.Checked',
    'ckbSeries2.Checked','ckbSeries3.Checked']);
end;

procedure TfMxGraficoMetaPorVendedor.ckbSeries1Click(Sender: TObject);
begin
  Series1.Active     := ckbSeries1.Checked;
  cmbStyle1.Enabled  := ckbSeries1.Checked;
  ckbMarcas1.Enabled := ckbSeries1.Checked;
  cmbTipoMarcas1.Enabled := ckbSeries1.Checked AND ckbMarcas1.Checked;
end;

procedure TfMxGraficoMetaPorVendedor.ckbSeries3Click(Sender: TObject);
begin
  cmbStyle3.Enabled  := ckbSeries3.Checked;
  ckbMarcas3.Enabled := ckbSeries3.Checked;
  cmbTipoMarcas3.Enabled := ckbSeries3.Checked AND ckbMarcas3.Checked;  
end;

procedure TfMxGraficoMetaPorVendedor.Action1Execute(Sender: TObject);
begin
  if aExibirBarra4.Checked then
    aExibirBarra4Execute(sender);
  if DM.Configuracao1.Empresa = 2 then
    SavePictureDialog1.FileName := '\\PETROMAX-SERVER\SACI\IMAGENS\GRAFICO_VENDAS.BMP';
  if SavePictureDialog1.Execute then
    DBChart1.SaveToBitmapFile(SavePictureDialog1.FileName);
end;

end.
