unit CdAplFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls,
  DBCtrls, AplicFin, Agencia, Banco, Menus;

type
  TfCadAplFin = class(TForm)
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
    Label5: TLabel;
    Edit3: TEdit;
    Label12: TLabel;
    ComboBox2: TComboBox;
    Memo1: TMemo;
    Label15: TLabel;
    AplicFin1: TAplicFin;
    DSAplicFin1: TDataSource;
    Banco1: TBanco;
    Agencia1: TAgencia;                
    DS_Banco1: TDataSource;
    DS_Agencia1: TDataSource;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Aplicacoes1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Panel2: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    AplicFin1APF_CODIGO: TIntegerField;
    AplicFin1CNC_CODIGO: TIntegerField;
    AplicFin1APF_SALDO: TFloatField;
    AplicFin1BNC_NUMERO: TIntegerField;
    AplicFin1APF_SITUACAO: TIntegerField;
    AplicFin1AGN_NUMERO: TIntegerField;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AplicFin1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TAplicFin;
  end;

var
  fCadAplFin: TfCadAplFin;

implementation

{$R *.DFM}

uses UDM, funcoes;

procedure TfCadAplFin.SB_PrimClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  Entidade.First;
end;

procedure TfCadAplFin.SB_AntClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  Entidade.Prior;
end;

procedure TfCadAplFin.SB_ProxClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  Entidade.Next;
end;

procedure TfCadAplFin.SB_UltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  Entidade.Last;
end;

procedure TfCadAplFin.SB_NovoClick(Sender: TObject);
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
  Entidade.PreparaInsercao;
  Edit3.SetFocus;  
end;

procedure TfCadAplFin.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
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
  Entidade.PreparaAlteracao;
  Edit3.SetFocus;  
end;

procedure TfCadAplFin.SB_SalvaClick(Sender: TObject);
begin
  Entidade.FinalizaEdicao;
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

procedure TfCadAplFin.SB_CancClick(Sender: TObject);
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
  Entidade.CancelaEdicao;
end;

procedure TfCadAplFin.ComboBox1Enter(Sender: TObject);
begin
  ComboBox1.Text:='';
end;

procedure TfCadAplFin.SB_LocClick(Sender: TObject);
begin
  If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit1.Text) then
      raise Exception.create('Código a ser localizado inválido!');

  Entidade.Localizar;
end;

procedure TfCadAplFin.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  Entidade.deletarauto;
end;

procedure TfCadAplFin.FormCreate(Sender: TObject);
begin
  Entidade:=AplicFin1;
  Banco1.Active:=true;
  Agencia1.ParamByName('BNC_NUMERO').AsInteger:=Banco1.fieldByName('BNC_NUMERO').AsInteger;
  Agencia1.Active:=true;
  Entidade.ParamByName('AGN_NUMERO').AsInteger:=Agencia1.fieldByName('AGN_NUMERO').AsInteger;
  Entidade.Active:=True;
end;

procedure TfCadAplFin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Banco1.Active:=false;
  Agencia1.Active:=false;
  Action:=caFree;
end;

procedure TfCadAplFin.DBLookupComboBox1Click(Sender: TObject);
begin
  Agencia1.Close;
  Agencia1.ParamByName('BNC_NUMERO').AsInteger:=Banco1.fieldByName('BNC_NUMERO').AsInteger;
  Agencia1.Open;
  Entidade.Close;
  Entidade.ParamByName('AGN_NUMERO').AsInteger:=Agencia1.fieldByName('AGN_NUMERO').AsInteger;
  Entidade.Open;
end;

procedure TfCadAplFin.DBLookupComboBox2Click(Sender: TObject);
begin
  Entidade.Close;
  Entidade.ParamByName('AGN_NUMERO').AsInteger:=Agencia1.fieldByName('AGN_NUMERO').AsInteger;
  Entidade.Open;
end;


procedure TfCadAplFin.Sair1Click(Sender: TObject);
begin
 FCadAplFin.Close;
end;

procedure TfCadAplFin.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadAplFin.AplicFin1AfterScroll(DataSet: TDataSet);
begin
  AplicFin1.CarregaDados;
end;

procedure TfCadAplFin.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
end;

end.
