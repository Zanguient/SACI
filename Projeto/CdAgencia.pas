unit CdAgencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Agencia, Banco, Parametro, Menus, Usuario, Variants, ToolWin,
  ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadAgn = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtNome: TEdit;
    edtNumero: TEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mskCEP: TMaskEdit;
    Label11: TLabel;
    Label13: TLabel;
    mskfone: TMaskEdit;
    edtBairro: TEdit;
    Label16: TLabel;
    Label3: TLabel;
    mskFAX: TMaskEdit;
    Label2: TLabel;
    Label5: TLabel;
    edtContato: TEdit;
    Agencia1: TAgencia;
    DSAgencia1: TDataSource;
    dblLogradouro: TDBLookupComboBox;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    Banco1: TBanco;
    DSBanco1: TDataSource;
    Panel2: TPanel;
    Label4: TLabel;
    dblBanco: TDBLookupComboBox;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Agencia1AGN_CODIGO: TIntegerField;
    Agencia1CNC_CODIGO: TIntegerField;
    Agencia1BNC_NUMERO: TIntegerField;
    Agencia1AGN_NOME: TStringField;
    Agencia1AGN_LOGRADOURO: TIntegerField;
    Agencia1AGN_BAIRRO: TStringField;
    Agencia1AGN_CIDADE: TStringField;
    Agencia1AGN_UF: TStringField;
    Agencia1AGN_CEP: TStringField;
    Agencia1AGN_FONE: TStringField;
    Agencia1AGN_CONTATO: TStringField;
    Agencia1AGN_FAX: TStringField;
    Agencia1AGN_NUMERO: TIntegerField;
    Agencia1AGN_ENDERECO: TStringField;
    Label6: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    cmbUF: TComboBox;
    edtUsuario: TEdit;
    Label12: TLabel;
    Agencia1AGN_DT_CADASTRO: TDateTimeField;
    Agencia1AGN_DT_ALTERADO: TDateTimeField;
    Agencia1USU_CODIGO: TIntegerField;
    Agencia1Usuario: TStringField;
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
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure Agencia1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Agencia1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblBancoClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TAgencia;
  end;

var
  fCadAgn: TfCadAgn;

implementation
Uses UDM, funcoes;
{$R *.DFM}

procedure TfCadAgn.AtualizaControles(Habilitar: Boolean);
begin
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

procedure TfCadAgn.SB_PrimClick(Sender: TObject);
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

procedure TfCadAgn.SB_AntClick(Sender: TObject);
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

procedure TfCadAgn.SB_ProxClick(Sender: TObject);
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

procedure TfCadAgn.SB_UltClick(Sender: TObject);
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



procedure TfCadAgn.SB_NovoCabClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(660)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (dblBanco.Text = '')  then
    Raise Exception.Create('Selecione o Banco!');

  Entidade.PreparaInsercao;
  AtualizaControles(True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtNumero.SetFocus;
end;

procedure TfCadAgn.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(680)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');

  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtNumero.SetFocus;
end;

procedure TfCadAgn.SB_SalvaCabClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(False);
    edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
  end
  else
    ShowMessage('As alterações não foram salvas!');
End;

procedure TfCadAgn.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadAgn.FormCreate(Sender: TObject);
begin
  Entidade := Agencia1;
end;

procedure TfCadAgn.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');

  Entidade.Localizar;
end;

procedure TfCadAgn.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(670)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 CBN_CODIGO '+
      ' FROM CONTA_BANCARIA '+
      ' WHERE AGN_NUMERO='+edtNumero.Text;
    Open;
    if not IsEmpty then
      Raise exception.Create('Existe(m) Conta(s) cadastrada para essa Agência!');
  end;
  Entidade.deletarauto;
end;

procedure TfCadAgn.Agencia1AfterScroll(DataSet: TDataSet);
begin
  Entidade.carregadados;
  edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
end;


procedure TfCadAgn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Banco1.Active:=False;
  Entidade.Active:=False;
  Parametro1.Active:=False;
  Action:=cafree;
end;

procedure TfCadAgn.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCadAgn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadAgn.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Banco1.Open;
  Parametro1.Open;
  Entidade.Open;
  dblBanco.KeyValue := Banco1.NumeroBanco;
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;  
end;

procedure TfCadAgn.Agencia1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfCadAgn.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadAgn.dblBancoClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
  Begin
    Entidade.CarregaDados;
    edtNumero.Clear;
    edtUsuario.Clear;
  end;
end;

procedure TfCadAgn.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
