unit MxSCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, CentroCusto, DBCtrls, Parametro, ComCtrls;

type
  TfMxSCheque = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    Edit7: TEdit;
    ComboBox1: TComboBox;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    ComboBox3: TComboBox;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    ComboBox4: TComboBox;
    Panel9: TPanel;
    DBGrid4: TDBGrid;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CentroCusto1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TCentroCusto;
  end;

var
  fMxSCheque: TfMxSCheque;

implementation
Uses UDM;
{$R *.DFM}



procedure TfMxSCheque.SB_PrimClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxSCheque.SB_AntClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.Prior;
    If Entidade.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxSCheque.SB_ProxClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Next;
    If Entidade.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxSCheque.SB_UltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxSCheque.SB_NovoClick(Sender: TObject);
begin
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  DbGrid5.Enabled:=False;
  Edit11.Enabled:=False;
  Edit11.Color:=clMenu;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=clMenu;
  Entidade.PreparaInsercao;
end;

procedure TfMxSCheque.SB_AltClick(Sender: TObject);
begin
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  DbGrid5.Enabled:=False;
  Edit11.Enabled:=False;
  Edit11.Color:=clMenu;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=clMenu;
  Entidade.PreparaAlteracao;
end;

procedure TfMxSCheque.SB_ExcClick(Sender: TObject);
begin
  Entidade.Deletarauto;
end;

procedure TfMxSCheque.SB_SalvaClick(Sender: TObject);
begin
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  DbGrid5.Enabled:=True;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  Entidade.FinalizaEdicao;
end;

procedure TfMxSCheque.SB_CancClick(Sender: TObject);
begin
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  DbGrid5.Enabled:=True;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  Entidade.CancelaEdicao;
end;

procedure TfMxSCheque.FormCreate(Sender: TObject);
begin
  Entidade:=CentroCusto1;
  Parametro1.Active:=True;
  Entidade.Active:=True;
end;

procedure TfMxSCheque.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfMxSCheque.ComboBox2Change(Sender: TObject);
begin
  Edit11.SetFocus;
end;

procedure TfMxSCheque.SB_LocClick(Sender: TObject);
begin
  Entidade.Localizar;
end;


procedure TfMxSCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active:=False;
  CentroCusto1.Active:=False;
  Action:=Cafree;
end;

procedure TfMxSCheque.CentroCusto1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;


















end.
