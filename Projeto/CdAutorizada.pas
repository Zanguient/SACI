unit CdAutorizada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Funcionario,Autorizada, Parametro, DBCtrls, Menus;

type
  TfCadAutorizada = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    Label1: TLabel;
    edtNome: TEdit;
    edtCodigoAUT: TEdit;
    edtContato: TEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mskCEP: TMaskEdit;
    Label11: TLabel;
    Label13: TLabel;
    mskTelefone: TMaskEdit;
    Label15: TLabel;
    cmbUF: TComboBox;
    edtBairro: TEdit;
    Label16: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    mskFax: TMaskEdit;
    edtRepresentadas: TEdit;
    Label2: TLabel;
    Autorizada1: TAutorizada;
    DSAutorizada1: TDataSource;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    dblLogradouro: TDBLookupComboBox;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Autorizadas1: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Label5: TLabel;
    Label12: TLabel;
    cmbSituacao: TComboBox;
    edtObservacao: TEdit;
    bitConfirmar: TBitBtn;
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Autorizada1AfterScroll(DataSet: TDataSet);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bitConfirmarClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:Tautorizada;
  end;

var
  fCadAutorizada: TfCadAutorizada;

implementation

Uses UDM, funcoes, MxAssistenciaTecnica, MxSelAssitenciaTecnica;

{$R *.DFM}

procedure TfCadAutorizada.SB_NovoCabClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8350)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir registro!');

  Entidade.PreparaInsercao;
  AtualizaControles(True);
  edtNome.SetFocus;
end;

procedure TfCadAutorizada.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8360)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtNome.SetFocus;  
end;

procedure TfCadAutorizada.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8370)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.Deletarauto;
end;

procedure TfCadAutorizada.SB_SalvaCabClick(Sender: TObject);
begin
  Entidade.FinalizaEdicao;
  AtualizaControles(False);
end;

procedure TfCadAutorizada.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadAutorizada.FormCreate(Sender: TObject);
begin
  Entidade:=Autorizada1;
end;

procedure TfCadAutorizada.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');

  Entidade.Localizar;
end;

procedure TfCadAutorizada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Parametro1.Close;
  Action:=Cafree;
end;

procedure TfCadAutorizada.Autorizada1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadAutorizada.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadAutorizada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadAutorizada.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Parametro1.Open;
  if not Entidade.Active then
    Entidade.Open;

  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;

  if self.Tag = 0 then
    bitConfirmar.Visible := False;
end;

procedure TfCadAutorizada.AtualizaControles(Habilitar: Boolean);
begin
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := Habilitar;
  CancelarCab.Enabled   := Habilitar;
  LocalizarCab.Enabled  := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_ExcCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := Habilitar;
  SB_CancCab.Enabled    := Habilitar;

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

procedure TfCadAutorizada.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  Begin
    key:=chr(0);
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if key = #13 then
  Begin
    key:=chr(0);
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
    else if bitConfirmar.Visible then
    Begin
      bitConfirmar.SetFocus;
      bitConfirmarClick(sender);
    end;
  end
  else if (Key = '"') then
    Key := #0;
end;

procedure TfCadAutorizada.bitConfirmarClick(Sender: TObject);
begin
  if Entidade.isEmpty then
    Raise exception.Create('Selecione o registro!');

  if self.Tag = 1 then
    fMxAssistenciaTecnica.edtCodigoAUT.Text := IntToStr(Entidade.CodigoAUT)
  else if self.Tag = 2 then
    fMxSelAssistenciaTecnica.edtCodigoAUT.Text := IntToStr(Entidade.CodigoAUT);

  Close;
end;

end.
