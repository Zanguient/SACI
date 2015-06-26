unit CdCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, DBCtrls, Parametro, Funcionario, Caixa, Menus, CentroCusto,
  Usuario, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfCadCaixa = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoCAX: TEdit;
    Panel1: TPanel;
    SB_ExcPed: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_LocPed: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    edtDescricao: TEdit;
    Label2: TLabel;
    dblUsuario: TDBLookupComboBox;
    Label3: TLabel;
    Caixa1: TCaixa;
    DSCaixa1: TDataSource;
    CentroCusto1: TCentroCusto;
    Ds_CentroCusto: TDataSource;
    Usuario1: TUsuario;
    DSUsuario1: TDataSource;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    Panel2: TPanel;
    Label44: TLabel;
    dblCentroDeCusto: TDBLookupComboBox;
    Caixa1CAX_CODIGO: TIntegerField;
    Caixa1CNC_CODIGO: TIntegerField;
    Caixa1FUN_CODIGO: TIntegerField;
    Caixa1CAX_DESCRICAO: TStringField;
    Caixa1CAX_DATA: TDateTimeField;
    Caixa1USU_CODIGO: TIntegerField;
    Caixa1CAX_DT_ALTERADO: TDateTimeField;
    Caixa1Responsavel: TStringField;
    ActionManager1: TActionManager;
    IncluirPed: TAction;
    AlterarPed: TAction;
    ExcluirPed: TAction;
    SalvarPed: TAction;
    CancelarPed: TAction;
    LocalizarPed: TAction;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_ExcPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure Fornecedor1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairPedClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Caixa1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure Caixa1CalcFields(DataSet: TDataSet);
    procedure dblCentroDeCustoClick(Sender: TObject);
    procedure Caixa1BeforeOpen(DataSet: TDataSet);
    procedure Usuario1BeforeOpen(DataSet: TDataSet);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:Tcaixa;
  end;

var
  fCadCaixa: TfCadCaixa;

implementation

Uses UDM, funcoes;

{$R *.DFM}

procedure TfCadCaixa.SB_PrimClick(Sender: TObject);
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

procedure TfCadCaixa.SB_AntClick(Sender: TObject);
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

procedure TfCadCaixa.SB_ProxClick(Sender: TObject);
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

procedure TfCadCaixa.SB_UltClick(Sender: TObject);
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

procedure TfCadCaixa.SB_NovoPedClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  if not DM.Configuracao1.CPD then
    raise Exception.Create('Somente no CPD.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1300)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(True);
  edtDescricao.SetFocus;
end;

procedure TfCadCaixa.SB_AltPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1320)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtDescricao.SetFocus;
end;

procedure TfCadCaixa.SB_ExcPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1310)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.Deletarauto;
end;

procedure TfCadCaixa.SB_SalvaPedClick(Sender: TObject);
begin
  if not Entidade.FinalizaEdicao then
    Raise exception.Create('Os dados não foram salvos');
    
  AtualizaControles(False);
end;

procedure TfCadCaixa.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadCaixa.FormCreate(Sender: TObject);
begin
  Entidade:=Caixa1;
end;

procedure TfCadCaixa.SB_LocPedClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');

  Entidade.Localizar;
end;

procedure TfCadCaixa.Fornecedor1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=false;
  CentroCusto1.Active:=false;
  Action:=Cafree;
end;

procedure TfCadCaixa.SairPedClick(Sender: TObject);
begin
 fCadCaixa.Close;
end;

procedure TfCadCaixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaPed.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadCaixa.Caixa1AfterScroll(DataSet: TDataSet);
begin
  Caixa1.CarregaDados;
end;

procedure TfCadCaixa.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  Usuario1.Open;
  CentroCusto1.Open;
  CentroCusto2.Open;  
  dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
  dblCentroDeCustoClick(sender);
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else
      Close;
  end
  else if key=chr(13) then
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end;
  end;
end;

procedure TfCadCaixa.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfCadCaixa.AtualizaControles(Habilitar: Boolean);
begin
  Action1.Enabled          := not Habilitar;
  dblCentroDeCusto.Enabled := not Habilitar;

  IncluirPed.Enabled    := not Habilitar;
  AlterarPed.Enabled    := not Habilitar;
  ExcluirPed.Enabled    := not Habilitar;
  SalvarPed.Enabled     := Habilitar;
  CancelarPed.Enabled   := Habilitar;
  LocalizarPed.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoPed.Enabled    := not Habilitar;
  SB_LocPed.Enabled     := not Habilitar;
  SB_AltPed.Enabled     := not Habilitar;
  SB_ExcPed.Enabled     := not Habilitar;
  SB_SalvaPed.Enabled   := Habilitar;
  SB_CancPed.Enabled    := Habilitar;

  edtLocalizar.Enabled := not Habilitar;
  if Habilitar then
    edtLocalizar.Color := AlteraCorComponentes
  else
    edtLocalizar.Color := clWindow;
  cmbCampo.Enabled     := not Habilitar;
  if Habilitar then
    cmbCampo.Color     :=AlteraCorComponentes
  else
    cmbCampo.Color     :=clWindow;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfCadCaixa.Caixa1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Responsavel').asString := UpperCase(DM.NomeUsuario(Entidade.CodigoFUN));
end;

procedure TfCadCaixa.dblCentroDeCustoClick(Sender: TObject);
begin
  Usuario1.Close;
  Usuario1.Open;
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadCaixa.Caixa1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger := dblCentroDeCusto.KeyValue;
  except
    Entidade.ParamByName('CNC_CODIGO').asInteger := -1;
  end;
end;

procedure TfCadCaixa.Usuario1BeforeOpen(DataSet: TDataSet);
begin
  try
    Usuario1.ParamByName('CNC_CODIGO').asInteger := dblCentroDeCusto.KeyValue;
  except
    Usuario1.ParamByName('CNC_CODIGO').asInteger := -1;
  end;
end;

end.
