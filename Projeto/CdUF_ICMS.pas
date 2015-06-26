unit CdUF_ICMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Menus, UF_ICMS, Usuario, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  ActnList, XPStyleActnCtrls;

type
  TfCadUF_ICMS = class(TForm)
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
    Label1: TLabel;
    Edit2: TEdit;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    DSUF_ICMS1: TDataSource;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Edit1: TEdit;
    Label27: TLabel;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    MaskEdit2: TMaskEdit;
    UF_ICMS1: TUF_ICMS;
    UF_ICMS1UFI_UF: TStringField;
    UF_ICMS1UFI_ICMS_COMPRA: TFloatField;
    UF_ICMS1UFI_ICMS_VENDA: TFloatField;
    UF_ICMS1USU_CODIGO: TIntegerField;
    UF_ICMS1UFI_DT_CADASTRO: TDateTimeField;
    UF_ICMS1UFI_DT_ALTERADO: TDateTimeField;
    Edit3: TEdit;
    Label6: TLabel;
    UF_ICMS1Usuario: TStringField;
    UF_ICMS1CNC_CODIGO: TIntegerField;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    Sair1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
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
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure UF_ICMS1AfterScroll(DataSet: TDataSet);
    procedure UF_ICMS1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TUF_ICMS;
  end;

var
  fCadUF_ICMS: TfCadUF_ICMS;

implementation
Uses UDM,funcoes, MxFotoAmpliada;
{$R *.DFM}



procedure TfCadUF_ICMS.SB_PrimClick(Sender: TObject);
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

procedure TfCadUF_ICMS.SB_AntClick(Sender: TObject);
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

procedure TfCadUF_ICMS.SB_ProxClick(Sender: TObject);
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

procedure TfCadUF_ICMS.SB_UltClick(Sender: TObject);
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

procedure TfCadUF_ICMS.SB_NovoClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3920)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Edit3.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  Entidade.PreparaInsercao;
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
  Edit11.Enabled:=False;
  Edit11.Color:=AlteraCorComponentes;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=AlteraCorComponentes;
  Edit3.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  try
    ComboBox1.SetFocus;
  except
    Edit2.SetFocus;
  end;
end;

procedure TfCadUF_ICMS.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3920)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
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
  Edit11.Enabled:=False;
  Edit11.Color:=AlteraCorComponentes;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=AlteraCorComponentes;
  try
    ComboBox1.SetFocus;
  except
    Edit2.SetFocus;
  end;
end;

procedure TfCadUF_ICMS.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');    
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(510)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.Deletarauto;
end;

procedure TfCadUF_ICMS.SB_SalvaClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
  Begin
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
    Edit11.Enabled:=True;
    Edit11.Color:=clWindow;
    ComboBox2.Enabled:=True;
    ComboBox2.Color:=clWindow;
  end
  else
    ShowMessage('As alterações não foram salvas!');  
end;

procedure TfCadUF_ICMS.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
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
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
end;

procedure TfCadUF_ICMS.FormCreate(Sender: TObject);
begin
  Entidade:=UF_ICMS1;
  Entidade.Active:=true;
end;

procedure TfCadUF_ICMS.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfCadUF_ICMS.SB_LocClick(Sender: TObject);
begin
  Entidade.Localizar;
end;

procedure TfCadUF_ICMS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadUF_ICMS.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfCadUF_ICMS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadUF_ICMS.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ComboBox2.ItemIndex := 0;
  Edit11.SetFocus;
end;

procedure TfCadUF_ICMS.UF_ICMS1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  Edit3.Text:=Entidade.FieldByName('Usuario').asString;
end;

procedure TfCadUF_ICMS.UF_ICMS1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfCadUF_ICMS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    if SB_Salva.Enabled then
      SB_CancClick(sender)
    else
      Close;
end;

end.
