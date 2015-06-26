unit MxCompDeposito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, NotaFiscal, NotaFiscalSaida, Menus;

type
  TfMxComprDepos = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    MaskEdit1: TMaskEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Panel1: TPanel;
    SB_Loc: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_Novo: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Exc: TSpeedButton;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label4: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Edit3: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Comprovante1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    ImprimirComprovante1: TMenuItem;
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
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotaFiscalSaida1AfterScroll(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TNotaFiscalSaida;
  end;

var
  fMxComprDepos: TfMxComprDepos;

implementation
Uses
  UDM,MxItemNF;
{$R *.DFM}



procedure TfMxComprDepos.SB_PrimClick(Sender: TObject);
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

procedure TfMxComprDepos.SB_AntClick(Sender: TObject);
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

procedure TfMxComprDepos.SB_ProxClick(Sender: TObject);
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

procedure TfMxComprDepos.SB_UltClick(Sender: TObject);
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

procedure TfMxComprDepos.SB_NovoClick(Sender: TObject);
begin
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Loc.Enabled:=False;
  DbGrid5.Enabled:=False;
  Edit11.Enabled:=False;
  Edit11.Color:=clMenu;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=clMenu;
  Entidade.PreparaInsercao;
end;

procedure TfMxComprDepos.SB_AltClick(Sender: TObject);
begin
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Loc.Enabled:=False;
  DbGrid5.Enabled:=False;
  Edit11.Enabled:=False;
  Edit11.Color:=clMenu;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=clMenu;
  Entidade.PreparaAlteracao;
end;

procedure TfMxComprDepos.SB_ExcClick(Sender: TObject);
begin
  Entidade.deletarauto;
end;

procedure TfMxComprDepos.SB_SalvaClick(Sender: TObject);
begin
  Incluir1.Enabled:=true;
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Localizar1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Loc.Enabled:=True;
  DbGrid5.Enabled:=True;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  Entidade.FinalizaEdicao;
end;

procedure TfMxComprDepos.SB_CancClick(Sender: TObject);
begin
  Incluir1.Enabled:=true;
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Localizar1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Loc.Enabled:=True;
  DbGrid5.Enabled:=True;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  Entidade.CancelaEdicao;
end;


procedure TfMxComprDepos.FormCreate(Sender: TObject);
begin
  Entidade:=NotaFiscalSaida1;
  Entidade.Active:=true;
end;

procedure TfMxComprDepos.ComboBox2Change(Sender: TObject);
begin
  Edit11.SetFocus;
end;

procedure TfMxComprDepos.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfMxComprDepos.SB_LocClick(Sender: TObject);
begin
 Entidade.Localizar;
end;


procedure TfMxComprDepos.Cliente1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxComprDepos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;



































procedure TfMxComprDepos.NotaFiscalSaida1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxComprDepos.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfMxSItemNF, fMxSItemNF);
  fMxSItemNF.Edit2.text:=IntToStr(NotaFiscalSaida1.CodigoNTF);
  fMxSItemNF.Edit3.text:=IntToStr(NotaFiscalSaida1.Selo);
  fMxSItemNF.ShowModal;
end;



















procedure TfMxComprDepos.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxComprDepos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If SB_Salva.Enabled=true then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

end.
