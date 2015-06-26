unit CdAvalista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Parametro, Avalista, Menus, Usuario, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadAvalista = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    mskNascimento: TMaskEdit;
    Label1: TLabel;
    edtNome: TEdit;
    edtCodigoAVL: TEdit;
    mskCPF: TMaskEdit;
    edtIdentidade: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mskCEP: TMaskEdit;
    Label13: TLabel;
    mskTelefone: TMaskEdit;
    cmbUF: TComboBox;
    edtBairro: TEdit;
    Label16: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    ckbPessoaFisica: TCheckBox;
    DSAvalista1: TDataSource;
    dblLogradouro: TDBLookupComboBox;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    Avalista1: TAvalista;
    Label11: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    Label4: TLabel;
    mskFax: TMaskEdit;
    Label14: TLabel;
    mskCelular: TMaskEdit;
    Label15: TLabel;
    edtUsuario: TEdit;
    Label17: TLabel;
    edtObservacao: TEdit;
    Avalista1AVL_CODIGO: TIntegerField;
    Avalista1CNC_CODIGO: TIntegerField;
    Avalista1AVL_NOME: TStringField;
    Avalista1AVL_CGC_CPF: TStringField;
    Avalista1AVL_CGF_RG: TStringField;
    Avalista1AVL_LOGRADOURO: TIntegerField;
    Avalista1AVL_ENDERECO: TStringField;
    Avalista1AVL_BAIRRO: TStringField;
    Avalista1AVL_CIDADE: TStringField;
    Avalista1AVL_UF: TStringField;
    Avalista1AVL_CEP: TStringField;
    Avalista1AVL_FONE: TStringField;
    Avalista1AVL_PFISICA: TSmallintField;
    Avalista1AVL_DT_NASC: TDateTimeField;
    Avalista1AVL_DT_ALTERADO: TDateTimeField;
    Avalista1AVL_FAX: TStringField;
    Avalista1AVL_CELULAR: TStringField;
    Avalista1AVL_SITUACAO: TIntegerField;
    Avalista1AVL_OBSERVACAO: TStringField;
    Avalista1AVL_DT_CADASTRO: TDateTimeField;
    Avalista1USU_CODIGO: TIntegerField;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    Sair1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure ckbPessoaFisicaClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure Avalista1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Avalista1BeforeOpen(DataSet: TDataSet);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TAvalista;
    CancelarCEP:Boolean;
  end;

var
  fCadAvalista: TfCadAvalista;

implementation
Uses
  UDM,Funcoes, CdInfCredito, MxLocalizaCEP;

{$R *.DFM}

procedure TfCadAvalista.AtualizaControles(Habilitar: Boolean);
begin
  IncluirCab.Enabled:=not Habilitar;
  AlterarCab.Enabled:=not Habilitar;
  ExcluirCab.Enabled:=not Habilitar;
  LocalizarCab.Enabled:=not Habilitar;
  SalvarCab.Enabled:=Habilitar;
  CancelarCab.Enabled:=Habilitar;
  SB_NovoCab.Enabled:=not Habilitar;
  SB_LocCab.Enabled:=not Habilitar;
  SB_AltCab.Enabled:=not Habilitar;
  SB_ExcCab.Enabled:=not Habilitar;
  SB_SalvaCab.Enabled:=Habilitar;
  SB_CancCab.Enabled:=Habilitar;
  edtLocalizar.Enabled:=not Habilitar;
  cmbCampo.Enabled:=not Habilitar;
  DBGrid5.Enabled:=not Habilitar;

  if Habilitar then
  begin
    edtLocalizar.Color:=AlteraCorComponentes;
    cmbCampo.Color:=AlteraCorComponentes;
  end
  else
  begin
    edtLocalizar.Color:=clWindow;
    cmbCampo.Color:=clWindow;
  end;
end;

procedure TfCadAvalista.FormCreate(Sender: TObject);
begin
  Entidade:=Avalista1;
  Entidade.Active:=True;
  Parametro1.Active:=True;
end;

procedure TfCadAvalista.ckbPessoaFisicaClick(Sender: TObject);
begin
  If ckbPessoaFisica.Checked then
    mskCPF.Editmask:='999-999-999-99;0;_'
  Else
    mskCPF.Editmask:='99-999-999/9999-99;0;_';
end;

procedure TfCadAvalista.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(980)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(True);

  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);

  EdtNome.SetFocus;
end;

procedure TfCadAvalista.SB_AltCabClick(Sender: TObject);
begin
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1000)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);

  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);

  edtNome.SetFocus;
end;

procedure TfCadAvalista.SB_SalvaCabClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then //Já gera LOG
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');

  edtLocalizar.SetFocus;
end;

procedure TfCadAvalista.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(false);

  edtLocalizar.SetFocus;
end;

procedure TfCadAvalista.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');

  Entidade.Selecionar;
end;

procedure TfCadAvalista.SB_ExcCabClick(Sender: TObject);
var
  CdCNC, CdAVL: integer;
begin
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem deletados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(990)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) and
     (DM.Configuracao1.Empresa = empMotical) then
    raise Exception.Create('Somente no CPD!');

  CdCNC := Entidade.CodigoCNC;
  CdAVL := Entidade.CodigoAVL;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CLI_CODIGO '+
      ' FROM INFORMACOES_DE_CREDITO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND AVL_CODIGO='+IntToStr(CdAVL);
    Open;
    if not IsEmpty then
      Raise exception.Create('Avalista do Cliente '+FieldByName('CLI_CODIGO').asString);
  end;

  Entidade.deletarauto;
end;


procedure TfCadAvalista.Avalista1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU); 
end;

procedure TfCadAvalista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not Entidade.IsEmpty then
    if tag = 1 then
      fCadInfCred.AVL:=Entidade.CodigoAVL;
  Entidade.Close;
  Parametro1.Close;
  Action:=Cafree;
end;

procedure TfCadAvalista.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCadAvalista.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadAvalista.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;

  if tag = 1 then
    SB_NovoCabClick(sender);
end;

procedure TfCadAvalista.edtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=chr(32)) and (edtEndereco.Text = '') then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxLocalizaCEP, fMxLocalizaCEP);
    fMxLocalizaCEP.tag:=7;
    fMxLocalizaCEP.ShowModal;
    if not CancelarCEP then
    Begin
      edtEndereco.Text:=edtEndereco.Text+', ';
    end;
  end;
end;

procedure TfCadAvalista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  Begin
    key:=#0;
    if (SB_CancCab.Enabled) then
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
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
    else
      Close;
  end
  else if (Key = '"') then
    Key := #0;
end;

procedure TfCadAvalista.Avalista1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfCadAvalista.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
