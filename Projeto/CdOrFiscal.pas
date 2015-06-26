unit CdOrFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, DBCtrls, Parametro, Origem_Fiscal, Menus, Usuario, ActnList,
  XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, ActnMenus;

type
  TfCadOrFiscal = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    Label2: TLabel;
    Origem_Fiscal1: TOrigem_Fiscal;
    DSOrigem_Fiscal1: TDataSource;
    Label3: TLabel;
    Label27: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label8: TLabel;
    Edit7: TEdit;
    Origem_Fiscal1ORF_CODIGO: TIntegerField;
    Origem_Fiscal1CNC_CODIGO: TIntegerField;
    Origem_Fiscal1ORF_DESCRICAO: TStringField;
    Origem_Fiscal1USU_CODIGO: TIntegerField;
    Origem_Fiscal1ORF_DT_CADASTRO: TDateTimeField;
    Origem_Fiscal1ORF_DT_ALTERADO: TDateTimeField;
    Origem_Fiscal1Usuario: TStringField;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    Action1: TAction;
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
    procedure Fornecedor1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Origem_Fiscal1AfterScroll(DataSet: TDataSet);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Origem_Fiscal1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TOrigem_Fiscal;
  end;

var
  fCadOrFiscal: TfCadOrFiscal;

implementation

Uses UDM,funcoes;

{$R *.DFM}

procedure TfCadOrFiscal.SB_PrimClick(Sender: TObject);
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

procedure TfCadOrFiscal.SB_AntClick(Sender: TObject);
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

procedure TfCadOrFiscal.SB_ProxClick(Sender: TObject);
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

procedure TfCadOrFiscal.SB_UltClick(Sender: TObject);
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

procedure TfCadOrFiscal.SB_NovoClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1420)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');

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
  Edit7.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);   
  Edit2.SetFocus;
end;

procedure TfCadOrFiscal.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1440)) < 0 then
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
  Edit2.SetFocus;
end;

procedure TfCadOrFiscal.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1430)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.Deletarauto;
end;

procedure TfCadOrFiscal.SB_SalvaClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
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

procedure TfCadOrFiscal.SB_CancClick(Sender: TObject);
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

procedure TfCadOrFiscal.FormCreate(Sender: TObject);
begin
  Entidade:=Origem_Fiscal1;
  Entidade.Active:=true;
end;

procedure TfCadOrFiscal.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfCadOrFiscal.SB_LocClick(Sender: TObject);
begin
  If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadOrFiscal.Fornecedor1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadOrFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=false;
  Action:=Cafree;
end;
procedure TfCadOrFiscal.Origem_Fiscal1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  Edit7.Text := Entidade.FieldByName('Usuario').asString;
end;

procedure TfCadOrFiscal.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfCadOrFiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadOrFiscal.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
end;

procedure TfCadOrFiscal.Origem_Fiscal1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfCadOrFiscal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

end.
