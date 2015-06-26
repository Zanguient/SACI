unit MxGraficoTitulosVendedor;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, Chart, Series, DbChart, Teengine, TeeProcs, Printers,
  ActnList, ActnMan, Menus, CustomizeDlg, ActnCtrls, ToolWin, ActnMenus,
  Spin;

type
  TfMxGraficoTitulosVendedor = class(TForm)
    DBChart1: TDBChart;
    DataSource1: TDataSource;
    BarSeries1: TBarSeries;
    Query1: TQuery;
    Query1DESCRICAO: TStringField;
    Query1TOTAL: TFloatField;
    ControlBar1: TControlBar;
    ActionMainMenuBar1: TActionMainMenuBar;
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
    Label2: TLabel;
    Label3: TLabel;
    ckbLegenda: TCheckBox;
    rdgPosicaoLegenda: TRadioGroup;
    cmbTipoLegenda: TComboBox;
    clbCorLegendaFundo: TColorBox;
    clbCorLegendaTexto: TColorBox;
    rdgBarra: TRadioGroup;
    GroupBox5: TGroupBox;
    cmbStyle: TComboBox;
    ckbMarcas: TCheckBox;
    cmbTipoMarcas: TComboBox;
    ActionManager1: TActionManager;
    aAjuda2: TAction;
    aSobre2: TAction;
    aCopiar3: TAction;
    aImprimir1: TAction;
    aFechar1: TAction;
    aExibirBarra4: TAction;
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
    procedure cmbTipoLegendaChange(Sender: TObject);
    procedure rdgPosicaoLegendaClick(Sender: TObject);
    procedure clbCorLegendaTextoChange(Sender: TObject);
    procedure clbCorLegendaFundoChange(Sender: TObject);
    procedure rdgBarraClick(Sender: TObject);
    procedure cmbStyleChange(Sender: TObject);
    procedure ckbMarcasClick(Sender: TObject);
    procedure cmbTipoMarcasChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aExibirBarra4Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxGraficoTitulosVendedor:TfMxGraficoTitulosVendedor;

implementation

uses UDM, Funcoes, MxSobre;

{$R *.DFM}


procedure TfMxGraficoTitulosVendedor.FormShow(Sender: TObject);
begin
  Query1.Active := True;
  cmbTipoLegendaChange(sender);
  cmbStyleChange(sender);
  cmbTipoMarcasChange(sender);
  clbCorLegendaFundoChange(sender);
  clbCorLegendaTextoChange(sender);
  LendoProps := False;
  aExibirBarra4Execute(sender);
  LendoProps := True;    
end;

procedure TfMxGraficoTitulosVendedor.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=chr(27) then
    Close;
end;

procedure TfMxGraficoTitulosVendedor.aImprimir1Execute(Sender: TObject);
begin
  DBChart1.PrintLandscape;
end;

procedure TfMxGraficoTitulosVendedor.aFechar1Execute(Sender: TObject);
begin
  Close;
end;

procedure TfMxGraficoTitulosVendedor.aCopiar3Execute(Sender: TObject);
begin
  DBChart1.CopyToClipboardMetafile(True);
end;

procedure TfMxGraficoTitulosVendedor.aAjuda2Execute(Sender: TObject);
begin
  Application.HelpCommand(HELP_FINDER, 1);
end;

procedure TfMxGraficoTitulosVendedor.aSobre2Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSobre, fMxSobre);
  fMxSobre.ShowModal;
end;

procedure TfMxGraficoTitulosVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;
  Action := caFree;
end;

procedure TfMxGraficoTitulosVendedor.ckb3DClick(Sender: TObject);
begin
  DBChart1.View3D := ckb3D.Checked;
  spe3D.Enabled   := ckb3D.Checked;   
end;

procedure TfMxGraficoTitulosVendedor.spe3DChange(Sender: TObject);
begin
  DBChart1.Chart3DPercent := spe3D.Value;
end;

procedure TfMxGraficoTitulosVendedor.spePtsPageChange(Sender: TObject);
begin
  DBChart1.MaxPointsPerPage := spePtsPage.Value;
end;

procedure TfMxGraficoTitulosVendedor.bbtnPreviousPageClick(Sender: TObject);
begin
  if (Sender as TBitBtn) = bbtnPreviousPage then
    DBChart1.PreviousPage
  else
    DBChart1.NextPage;
end;

procedure TfMxGraficoTitulosVendedor.rdgBarraClick(Sender: TObject);
begin
  BarSeries1.MultiBar := TMultibar(rdgBarra.ItemIndex);
end;

procedure TfMxGraficoTitulosVendedor.ckbLegendaClick(Sender: TObject);
begin
  DBChart1.Legend.Visible    := ckbLegenda.Checked;
  cmbTipoLegenda.Enabled     := ckbLegenda.Checked;
  rdgPosicaoLegenda.Enabled  := ckbLegenda.Checked;
  clbCorLegendaTexto.Enabled := ckbLegenda.Checked;
  clbCorLegendaFundo.Enabled := ckbLegenda.Checked;
end;

procedure TfMxGraficoTitulosVendedor.rdgPosicaoLegendaClick(Sender: TObject);
begin
  DBChart1.Legend.Alignment := TLegendAlignment(rdgPosicaoLegenda.ItemIndex);
end;

procedure TfMxGraficoTitulosVendedor.ckbMarcasClick(Sender: TObject);
begin
  BarSeries1.Marks.Visible := ckbMarcas.Checked;
  cmbTipoMarcas.Enabled    := ckbMarcas.Checked;
end;

procedure TfMxGraficoTitulosVendedor.aExibirBarra4Execute(Sender: TObject);
begin
  if LendoProps then
    aExibirBarra4.Checked := (not aExibirBarra4.Checked);
  Panel1.Visible := aExibirBarra4.Checked;
end;

procedure TfMxGraficoTitulosVendedor.cmbStyleChange(Sender: TObject);
begin
  BarSeries1.BarStyle := TBarStyle(cmbStyle.itemindex);
end;

procedure TfMxGraficoTitulosVendedor.cmbTipoMarcasChange(Sender: TObject);
begin
  case cmbTipoMarcas.ItemIndex of
    0: BarSeries1.Marks.Style := smsLabel;
    1: BarSeries1.Marks.Style := smsLabelPercent;
    2: BarSeries1.Marks.Style := smsLabelValue;
    3: BarSeries1.Marks.Style := smsLegend;
    4: BarSeries1.Marks.Style := smsPercent;
    5: BarSeries1.Marks.Style := smsValue;
    6: BarSeries1.Marks.Style := smsXValue;
  end;
end;

procedure TfMxGraficoTitulosVendedor.cmbTipoLegendaChange(Sender: TObject);
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

procedure TfMxGraficoTitulosVendedor.clbCorLegendaFundoChange(Sender: TObject);
begin
  DBChart1.Legend.Color := clbCorLegendaFundo.Selected;
end;

procedure TfMxGraficoTitulosVendedor.clbCorLegendaTextoChange(
  Sender: TObject);
begin
  DBChart1.Legend.Font.Color := clbCorLegendaTexto.Selected;
end;

procedure TfMxGraficoTitulosVendedor.FormCreate(Sender: TObject);
begin
  LendoProps := False;
  LerPreferencias(self,DM.Configuracao1.PastaSistema+'\GraficoTitulosVendedor.cfg');
  LendoProps := True;
end;

procedure TfMxGraficoTitulosVendedor.FormDestroy(Sender: TObject);
begin
  SalvarPreferencias(self,DM.Configuracao1.PastaSistema+'\GraficoTitulosVendedor.cfg',
    ['ckb3D.Checked','spe3D.Value','spePtsPage.Value','ckbLegenda.Checked',
    'cmbTipoLegenda.ItemIndex','rdgPosicaoLegenda.ItemIndex',
    'clbCorLegendaTexto.Selected','clbCorLegendaFundo.Selected',
    'rdgBarra.ItemIndex','cmbStyle.ItemIndex','ckbMarcas.Checked',
    'cmbTipoMarcas.ItemIndex','aExibirBarra4.Checked']);
end;


end.


