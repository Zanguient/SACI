unit CdRegProcura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  RegProc, Menus;

type
  TfCadRegProc = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Memo1: TMemo;
    Label15: TLabel;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    RegProc1: TRegProc;
    DSRegProc1: TDataSource;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure RegProc1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RegProc1BeforeOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TSquery;
  end;

var
  fCadRegProc: TfCadRegProc;

implementation

Uses
  UDM,funcoes;

{$R *.DFM}

procedure TfCadRegProc.SB_PrimClick(Sender: TObject);
begin
 if RegProc1.IsEmpty then
   abort;
 If RegProc1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    RegProc1.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not RegProc1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfCadRegProc.SB_AntClick(Sender: TObject);
begin
 if RegProc1.IsEmpty then
   abort;
 If RegProc1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    RegProc1.Prior;
    If RegProc1.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not RegProc1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfCadRegProc.SB_ProxClick(Sender: TObject);
begin
  if RegProc1.IsEmpty then
   abort;
  If RegProc1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    RegProc1.Next;
    If RegProc1.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not RegProc1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfCadRegProc.SB_UltClick(Sender: TObject);
begin
  if RegProc1.IsEmpty then
   abort;
  If RegProc1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    RegProc1.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not RegProc1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfCadRegProc.SB_NovoClick(Sender: TObject);
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
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit1.Enabled:=False;
  Edit1.Color:=AlteraCorComponentes;
  ComboBox1.Enabled:=False;
  ComboBox1.Color:=AlteraCorComponentes;
  RegProc1.PreparaInsercao;
  MaskEdit1.Text:=FormatDateTime('dd/mm/yyyy',DM.Configuracao1.Data);
  Edit3.SetFocus;  
end;

procedure TfCadRegProc.SB_AltClick(Sender: TObject);
begin
  If RegProc1.IsEmpty then
    Raise Exception.Create('Não existem registros para serem alterados!');
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
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit1.Enabled:=False;
  Edit1.Color:=AlteraCorComponentes;
  ComboBox1.Enabled:=False;
  ComboBox1.Color:=AlteraCorComponentes;
  RegProc1.PreparaAlteracao;
  Edit3.SetFocus;
end;

procedure TfCadRegProc.SB_SalvaClick(Sender: TObject);
begin
  if Edit3.Text = '' then
    Raise Exception.Create('Descrição inválida!');
  if not VerificaDataBranco(MaskEdit1.Text) then
    Raise Exception.Create('Data inválida!');
  RegProc1.FinalizaEdicao;
  Incluir1.Enabled:=True;
  Alterar1.Enabled:=True;
  Excluir1.Enabled:=True;
  Localizar1.Enabled:=True;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
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
  Edit1.Enabled:=True;
  Edit1.Color:=clWindow;
  ComboBox1.Enabled:=True;
  ComboBox1.Color:=clWindow;
end;

procedure TfCadRegProc.SB_CancClick(Sender: TObject);
begin
  Incluir1.Enabled:=True;
  Alterar1.Enabled:=True;
  Excluir1.Enabled:=True;
  Localizar1.Enabled:=True;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
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
  Edit1.Enabled:=True;
  Edit1.Color:=clWindow;
  ComboBox1.Enabled:=True;
  ComboBox1.Color:=clWindow;
  RegProc1.CancelaEdicao;
end;

procedure TfCadRegProc.ComboBox1Enter(Sender: TObject);
begin
  ComboBox1.Text:='';
end;

procedure TfCadRegProc.RegProc1AfterScroll(DataSet: TDataSet);
begin
  RegProc1.CarregaDados;
end;

procedure TfCadRegProc.FormCreate(Sender: TObject);
begin
//  Entidade:=RegProc1;
  RegProc1.Active:=True;
end;

procedure TfCadRegProc.SB_LocClick(Sender: TObject);
begin
If ComboBox1.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit1.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  RegProc1.Localizar;
end;

procedure TfCadRegProc.SB_ExcClick(Sender: TObject);
begin
  If RegProc1.IsEmpty then
    Raise Exception.Create('Não existem registros para serem deletados!');
  RegProc1.deletarauto;
end;



procedure TfCadRegProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RegProc1.Active:=False;
  Action:=Cafree;
end;


procedure TfCadRegProc.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfCadRegProc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadRegProc.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ComboBox1.ItemIndex:=1;
  Edit1.SetFocus;
end;

procedure TfCadRegProc.RegProc1BeforeOpen(DataSet: TDataSet);
begin
  RegProc1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfCadRegProc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

end.
