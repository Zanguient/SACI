unit MxGraficoTitulosRecebidos;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, Chart, Series, DbChart, Teengine, TeeProcs, Printers,
  ActnList, ActnMan, Menus, CustomizeDlg, ActnCtrls, ToolWin, ActnMenus,
  Spin, XPStyleActnCtrls;

type
  TfMxGraficoTitulosRecebidos = class(TForm)
    DBChart1: TDBChart;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query1DESCRICAO: TStringField;
    Query1TOTAL: TFloatField;
    ActionManager1: TActionManager;
    aImprimir1: TAction;
    aFechar1: TAction;
    ControlBar1: TControlBar;
    ActionMainMenuBar1: TActionMainMenuBar;
    aAjuda2: TAction;
    aSobre2: TAction;
    aCopiar3: TAction;
    aExibirBarra4: TAction;
    Series1: TPieSeries;
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
    procedure rsgBarraClick(Sender: TObject);
    procedure ckbLegendaClick(Sender: TObject);
    procedure rdgPosicaoLegendaClick(Sender: TObject);
    procedure ckbMarcasClick(Sender: TObject);
    procedure aExibirBarra4Execute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbStyleChange(Sender: TObject);
    procedure cmbTipoMarcasChange(Sender: TObject);
    procedure cmbTipoLegendaChange(Sender: TObject);
    procedure clbCorLegendaFundoChange(Sender: TObject);
    procedure clbCorLegendaTextoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxGraficoTitulosRecebidos:TfMxGraficoTitulosRecebidos;

implementation

uses UDM, Funcoes, MxSobre;

{$R *.DFM}


procedure TfMxGraficoTitulosRecebidos.FormShow(Sender: TObject);
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

  rdgBarra.Enabled := False;
  cmbStyle.Enabled := False;
end;

procedure TfMxGraficoTitulosRecebidos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=chr(27) then
    Close;
end;

procedure TfMxGraficoTitulosRecebidos.aImprimir1Execute(Sender: TObject);
begin
  DBChart1.PrintLandscape;
end;

procedure TfMxGraficoTitulosRecebidos.aFechar1Execute(Sender: TObject);
begin
  Close;
end;

procedure TfMxGraficoTitulosRecebidos.aCopiar3Execute(Sender: TObject);
begin
  DBChart1.CopyToClipboardMetafile(True);
end;

procedure TfMxGraficoTitulosRecebidos.aAjuda2Execute(Sender: TObject);
begin
  Application.HelpCommand(HELP_FINDER, 1);
end;

procedure TfMxGraficoTitulosRecebidos.aSobre2Execute(Sender: TObject);
begin
  Application.CreateForm(TfMxSobre, fMxSobre);
  fMxSobre.ShowModal;
end;

procedure TfMxGraficoTitulosRecebidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;
  Action := caFree;
end;

procedure TfMxGraficoTitulosRecebidos.ckb3DClick(Sender: TObject);
begin
  DBChart1.View3D := ckb3D.Checked;
  spe3D.Enabled   := ckb3D.Checked;  
end;

procedure TfMxGraficoTitulosRecebidos.spe3DChange(Sender: TObject);
begin
  DBChart1.Chart3DPercent := spe3D.Value;
end;

procedure TfMxGraficoTitulosRecebidos.spePtsPageChange(Sender: TObject);
begin
  DBChart1.MaxPointsPerPage := spePtsPage.Value;
end;

procedure TfMxGraficoTitulosRecebidos.bbtnPreviousPageClick(Sender: TObject);
begin
  if (Sender as TBitBtn) = bbtnPreviousPage then
    DBChart1.PreviousPage
  else
    DBChart1.NextPage;
end;

procedure TfMxGraficoTitulosRecebidos.rsgBarraClick(Sender: TObject);
begin
//  Series1.MultiBar := TMultibar(rdgBarra.ItemIndex);
end;

procedure TfMxGraficoTitulosRecebidos.ckbLegendaClick(Sender: TObject);
begin
  DBChart1.Legend.Visible    := ckbLegenda.Checked;
  cmbTipoLegenda.Enabled     := ckbLegenda.Checked;
  rdgPosicaoLegenda.Enabled  := ckbLegenda.Checked;
  clbCorLegendaTexto.Enabled := ckbLegenda.Checked;
  clbCorLegendaFundo.Enabled := ckbLegenda.Checked;
end;

procedure TfMxGraficoTitulosRecebidos.rdgPosicaoLegendaClick(Sender: TObject);
begin
  DBChart1.Legend.Alignment := TLegendAlignment(rdgPosicaoLegenda.ItemIndex);
end;

procedure TfMxGraficoTitulosRecebidos.ckbMarcasClick(Sender: TObject);
begin
  Series1.Marks.Visible    := ckbMarcas.Checked;
  cmbTipoMarcas.Enabled    := ckbMarcas.Checked;
end;

procedure TfMxGraficoTitulosRecebidos.aExibirBarra4Execute(Sender: TObject);
begin
  if LendoProps then
    aExibirBarra4.Checked := (not aExibirBarra4.Checked);
  Panel1.Visible := aExibirBarra4.Checked;
end;

procedure TfMxGraficoTitulosRecebidos.cmbStyleChange(Sender: TObject);
begin
//  Series1.Style := TStyle( BarStyle := TBarStyle(cmbStyle.itemindex);
end;

procedure TfMxGraficoTitulosRecebidos.cmbTipoMarcasChange(Sender: TObject);
begin
  case cmbTipoMarcas.ItemIndex of
    0: Series1.Marks.Style := smsLabel;
    1: Series1.Marks.Style := smsLabelPercent;
    2: Series1.Marks.Style := smsLabelValue;
    3: Series1.Marks.Style := smsLegend;
    4: Series1.Marks.Style := smsPercent;
    5: Series1.Marks.Style := smsValue;
    6: Series1.Marks.Style := smsXValue;
  end;
end;

procedure TfMxGraficoTitulosRecebidos.cmbTipoLegendaChange(Sender: TObject);
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

procedure TfMxGraficoTitulosRecebidos.clbCorLegendaFundoChange(Sender: TObject);
begin
  DBChart1.Legend.Color := clbCorLegendaFundo.Selected;
end;

procedure TfMxGraficoTitulosRecebidos.clbCorLegendaTextoChange(Sender: TObject);
begin
  DBChart1.Legend.Font.Color := clbCorLegendaTexto.Selected;
end;

procedure TfMxGraficoTitulosRecebidos.FormCreate(Sender: TObject);
begin
  LendoProps := False;
  LerPreferencias(Self,DM.Configuracao1.PastaSistema+'\GraficoTitulosRecebidos.cfg');
  LendoProps := True;
end;

procedure TfMxGraficoTitulosRecebidos.FormDestroy(Sender: TObject);
begin
  SalvarPreferencias(Self,DM.Configuracao1.PastaSistema+'\GraficoTitulosRecebidos.cfg',
    ['ckb3D.Checked','spe3D.Value','spePtsPage.Value','ckbLegenda.Checked',
    'cmbTipoLegenda.ItemIndex','rdgPosicaoLegenda.ItemIndex',
    'clbCorLegendaTexto.Selected','clbCorLegendaFundo.Selected',
    'rdgBarra.ItemIndex','cmbStyle.ItemIndex','ckbMarcas.Checked',
    'cmbTipoMarcas.ItemIndex','aExibirBarra4.Checked']);
end;

end.
