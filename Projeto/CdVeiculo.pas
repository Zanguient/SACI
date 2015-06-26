unit CdVeiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Grupo, Menus, JPEG, SubGrupo, Veiculo, CentroCusto, DBCtrls;

type
  TfCadVeiculo = class(TForm)
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
    edtDescricao: TEdit;
    edtCodigoVEI: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    DSVeiculo1: TDataSource;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Clientes1: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Bevel1: TBevel;
    Label24: TLabel;
    imgVeiculo: TImage;
    Label4: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    edtObservacao: TEdit;
    Veiculo1: TVeiculo;
    Label26: TLabel;
    mskPlaca: TMaskEdit;
    Label5: TLabel;
    edtMarca: TEdit;
    Label6: TLabel;
    edtModelo: TEdit;
    Label7: TLabel;
    edtNumeroChassis: TEdit;
    Label8: TLabel;
    edtNumeroRenavan: TEdit;
    Label9: TLabel;
    edtConsumo: TEdit;
    Veiculo1CNC_ORIGEM: TIntegerField;
    Veiculo1CNC_CODIGO: TIntegerField;
    Veiculo1USU_CODIGO: TIntegerField;
    Veiculo1VEI_CODIGO: TIntegerField;
    Veiculo1VEI_DT_CADASTRO: TDateTimeField;
    Veiculo1VEI_DT_ALTERADO: TDateTimeField;
    Veiculo1VEI_PLACA: TStringField;
    Veiculo1VEI_MARCA: TStringField;
    Veiculo1VEI_MODELO: TStringField;
    Veiculo1VEI_DESCRICAO: TStringField;
    Veiculo1VEI_NUMERO_CHASSIS: TStringField;
    Veiculo1VEI_NUMERO_RENAVAN: TStringField;
    Veiculo1VEI_SITUACAO: TIntegerField;
    Veiculo1VEI_OBSERVACAO: TStringField;
    Veiculo1VEI_CONSUMO: TFloatField;
    Label10: TLabel;
    cmbCombustivel: TComboBox;
    Veiculo1VEI_COMBUSTIVEL: TIntegerField;
    bitConfirmar: TBitBtn;
    Panel2: TPanel;
    Label44: TLabel;
    dblCentroDeCusto: TDBLookupComboBox;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure imgVeiculoDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Veiculo1AfterScroll(DataSet: TDataSet);
    procedure bitConfirmarClick(Sender: TObject);
    procedure Veiculo1BeforeOpen(DataSet: TDataSet);
    procedure dblCentroDeCustoClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TVeiculo;
  end;

var
  fCadVeiculo: TfCadVeiculo;

implementation
Uses UDM,funcoes, MxFotoAmpliada, MxControleVeiculo, MxSelControleVeiculo;
{$R *.DFM}



procedure TfCadVeiculo.SB_PrimClick(Sender: TObject);
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

procedure TfCadVeiculo.SB_AntClick(Sender: TObject);
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

procedure TfCadVeiculo.SB_ProxClick(Sender: TObject);
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

procedure TfCadVeiculo.SB_UltClick(Sender: TObject);
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

procedure TfCadVeiculo.AtualizaControles(Habilitar:Boolean);
begin
  SairCab.Enabled:=not habilitar;
  IncluirCab.Enabled:=not habilitar;
  AlterarCab.Enabled:=not habilitar;
  ExcluirCab.Enabled:=not habilitar;
  LocalizarCab.Enabled:=not habilitar;
  SalvarCab.Enabled:=habilitar;
  CancelarCab.Enabled:=habilitar;
  SB_Prim.Enabled:=not habilitar;
  SB_Ant.Enabled:=not habilitar;
  SB_Prox.Enabled:=not habilitar;
  SB_Ult.Enabled:=not habilitar;
  SB_NovoCab.Enabled:=not habilitar;
  SB_LocCab.Enabled:=not habilitar;
  SB_AltCab.Enabled:=not habilitar;
  SB_ExcCab.Enabled:=not habilitar;
  SB_SalvaCab.Enabled:=habilitar;
  SB_CancCab.Enabled:=habilitar;

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

procedure TfCadVeiculo.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8440)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtDescricao.SetFocus;
end;

procedure TfCadVeiculo.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8450)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtDescricao.SetFocus;
end;

procedure TfCadVeiculo.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8460)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT MTV_CODIGO '+
      ' FROM CONTROLE_VEICULO '+
      ' WHERE VEI_CODIGO='+IntToStr(Entidade.CodigoVEI);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existem Controles para esse Veículo! ('+FieldByName('MTV_CODIGO').asString+')');
  end;
  Entidade.Deletar(Entidade.CodigoVEI);
end;

procedure TfCadVeiculo.SB_SalvaCabClick(Sender: TObject);
begin
  If not Entidade.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');
    
  AtualizaControles(False);
end;

procedure TfCadVeiculo.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadVeiculo.FormCreate(Sender: TObject);
begin
  Entidade := Veiculo1;
  CentroCusto2.Open;
end;

procedure TfCadVeiculo.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfCadVeiculo.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadVeiculo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadVeiculo.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
  dblCentroDeCustoClick(sender);

  if self.Tag <> 0 then
    bitConfirmar.Visible := True;

  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadVeiculo.imgVeiculoDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgVeiculo.Picture;
  fMxFotoAmpliada.ShowModal;
end;

procedure TfCadVeiculo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancCab.Enabled then
    Begin
      Key := #0;
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if Key=#13 then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      Key := #0;
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
    else if bitConfirmar.Visible then
    Begin
      Key := #0;
      bitConfirmar.SetFocus;
      bitConfirmarClick(sender);
    end;
  end;
end;

procedure TfCadVeiculo.Veiculo1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadVeiculo.bitConfirmarClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o veículo!');

  if self.Tag = 1 then //ControleVeículo
  Begin
    fMxControleVeiculo.edtCodigoVEI.Text := IntToStr(Entidade.CodigoVEI);
    fMxControleVeiculo.mskPlaca.Text := Entidade.Placa;
    fMxControleVeiculo.edtMarcaModelo.Text := Trim(Entidade.Marca+' '+Entidade.Modelo);
  end
  else if self.Tag = 2 then //rel. Controle Veículo
    fMxSelControleVeiculo.edtCodigoVEI.Text := IntToStr(Entidade.CodigoVEI);
  Close;
end;

procedure TfCadVeiculo.Veiculo1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger := dblCentroDeCusto.KeyValue;
  except
  end;
end;

procedure TfCadVeiculo.dblCentroDeCustoClick(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

end.
