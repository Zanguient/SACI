unit CdBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Banco, Menus, Usuario, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfCadBnc = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    DSBanco1: TDataSource;
    Banco1: TBanco;
    Label6: TLabel;
    Label27: TLabel;
    Label12: TLabel;
    Banco1BNC_CODIGO: TIntegerField;
    Banco1CNC_CODIGO: TIntegerField;
    Banco1BNC_NOME: TStringField;
    Banco1BNC_NUMERO: TIntegerField;
    Banco1USU_CODIGO: TIntegerField;
    Banco1BNC_DT_CADASTRO: TDateTimeField;
    Banco1BNC_DT_ALTERADO: TDateTimeField;
    Banco1Usuario: TStringField;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    edtNumero: TEdit;
    edtDescricao: TEdit;
    edtUsuario: TEdit;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure Banco1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Banco1BeforeOpen(DataSet: TDataSet);
    procedure Banco1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TBanco;
  end;

var
  fCadBnc: TfCadBnc;

implementation

Uses UDM,funcoes;

{$R *.DFM}

procedure TfCadBnc.AtualizaControles(Habilitar: Boolean);
Begin
  IncluirCab.Enabled:=not Habilitar;
  AlterarCab.Enabled:=not Habilitar;
  ExcluirCab.Enabled:=not Habilitar;
  LocalizarCab.Enabled:=not Habilitar;
  SalvarCab.Enabled:=Habilitar;
  CancelarCab.Enabled:=Habilitar;
  SB_Prim.Enabled:=not Habilitar;
  SB_Ant.Enabled:=not Habilitar;
  SB_Prox.Enabled:=not Habilitar;
  SB_Ult.Enabled:=not Habilitar;
  SB_NovoCab.Enabled:=not Habilitar;
  SB_LocCab.Enabled:=not Habilitar;
  SB_AltCab.Enabled:=not Habilitar;
  SB_ExcCab.Enabled:=not Habilitar;
  SB_SalvaCab.Enabled:=Habilitar;
  SB_CancCab.Enabled:=Habilitar;

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
end;

procedure TfCadBnc.SB_PrimClick(Sender: TObject);
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

procedure TfCadBnc.SB_AntClick(Sender: TObject);
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

procedure TfCadBnc.SB_ProxClick(Sender: TObject);
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

procedure TfCadBnc.SB_UltClick(Sender: TObject);
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

procedure TfCadBnc.SB_NovoCabClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(620)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtNumero.SetFocus;
end;

procedure TfCadBnc.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(640)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtNumero.SetFocus;
end;

procedure TfCadBnc.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(630)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 AGN_CODIGO '+
      ' FROM AGENCIA '+
      ' WHERE BNC_NUMERO='+edtNumero.Text;
    Open;
    if not IsEmpty then
      Raise exception.Create('Existe(m) Agência(s) cadastrada para esse banco!');
  end;
  Entidade.deletarauto;
end;

procedure TfCadBnc.SB_SalvaCabClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(False);
    edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadBnc.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadBnc.Banco1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
end;

procedure TfCadBnc.FormCreate(Sender: TObject);
begin
  Entidade:=Banco1;
end;

procedure TfCadBnc.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Número a ser localizado inválido!');

  Entidade.Localizar;
end;


procedure TfCadBnc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadBnc.Sair1Click(Sender: TObject);
begin
 fCadBnc.Close;
end;

procedure TfCadBnc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadBnc.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Open;
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
end;

procedure TfCadBnc.Banco1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.Filtered := False;
end;

procedure TfCadBnc.Banco1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfCadBnc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    Key:=#0;
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if Key=chr(13) then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      Key:=#0;
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfCadBnc.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
