unit CdGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Grupo, Menus, JPEG, SubGrupo, DBCtrls, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadGrupo = class(TForm)
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
    edtCodigoGRP: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Grupo1: TGrupo;
    DSGrupo: TDataSource;
    Bevel1: TBevel;
    Label24: TLabel;
    Image1: TImage;
    ckbEspecial: TCheckBox;
    Label4: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    edtObservacao: TEdit;
    ckbServico: TCheckBox;
    SB_GerarSubGrupo: TSpeedButton;
    SubGrupo1: TSubGrupo;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    SairCab: TAction;
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
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Grupo1AfterScroll(DataSet: TDataSet);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_GerarSubGrupoClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:Tgrupo;
  end;

var
  fCadGrupo: TfCadGrupo;

implementation
Uses UDM,funcoes, MxFotoAmpliada;
{$R *.DFM}



procedure TfCadGrupo.SB_PrimClick(Sender: TObject);
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

procedure TfCadGrupo.SB_AntClick(Sender: TObject);
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

procedure TfCadGrupo.SB_ProxClick(Sender: TObject);
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

procedure TfCadGrupo.SB_UltClick(Sender: TObject);
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

procedure TfCadGrupo.AtualizaControles(Habilitar:Boolean);
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

procedure TfCadGrupo.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(500)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtDescricao.SetFocus;
end;

procedure TfCadGrupo.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(520)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtDescricao.SetFocus;
end;

procedure TfCadGrupo.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(510)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  with DM.QR_Consultas do
  Begin
    //Verificar a existência de SubGrupos para esse Grupo
    Close;
    SQL.Text := 'SELECT GRP_CODIGO '+
      ' FROM SUBGRUPO '+
      ' WHERE GRP_CODIGO='+IntToStr(Entidade.CodigoGRP);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existem SubGrupo para esse Grupo! ('+FieldByName('GRP_CODIGO').asString+')');

    //Verificar a existência de PRODUTOS para esse Grupo      
    Close;
    SQL.Text := 'SELECT GRP_CODIGO '+
      ' FROM PRODUTO '+
      ' WHERE GRP_CODIGO='+IntToStr(Entidade.CodigoGRP);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existem Produto nesse Grupo! ('+FieldByName('GRP_CODIGO').asString+')');
  end;
  Entidade.Deletarauto;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadGrupo.SB_SalvaCabClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadGrupo.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadGrupo.FormCreate(Sender: TObject);
begin
  Entidade:=Grupo1;
  Entidade.Active:=true;
end;

procedure TfCadGrupo.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadGrupo.Grupo1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadGrupo.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfCadGrupo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadGrupo.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if DM.Configuracao1.Empresa <> empLBM then
    SB_GerarSubGrupo.Visible := False;
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadGrupo.Image1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=Image1.Picture;
  fMxFotoAmpliada.ShowModal;
end;

procedure TfCadGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancCab.Enabled then
    Begin
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
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfCadGrupo.SB_GerarSubGrupoClick(Sender: TObject);
var
  CdGRP, CdGRPNovo: integer;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Grupo!');

  If MessageDlg('Deseja repetir SubGrupo de outro Grupo?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    CdGRP := StrToInt(InputBox('Repetir SubGrupos', 'Cód. Grupo:', '0'));
    if CdGRP <= 0 then
      Exit;
  except
    ShowMessage('Código do Grupo inválido!');
    Exit;
  end;

  if CdGRP = Entidade.CodigoGRP then
    Raise exception.Create('Grupo selecionado igual ao marcado!');

  CdGRPNovo := Entidade.CodigoGRP;

  with SubGrupo1 do
  Begin
    //Verificar se já existem SubGrupo
    Close;
    ParamByName('GRP_CODIGO').asInteger := CdGRPNovo;
    Open;
    if not IsEmpty then
      Raise exception.Create('Grupo já contém subgrupos cadastrados!');

    //Carregar SubGrupo do Grupo Selecionado
    Close;
    ParamByName('GRP_CODIGO').asInteger := CdGRP;
    Open;
    if IsEmpty then
      Raise exception.Create('Grupo sem subgrupos cadastrados!');

    while not Eof do
    Begin
      if not inserir(DM.Configuracao1.CodigoCNC,CodigoSGP,CdGRPNovo,Descricao,OBS,BaseChave,Familia) then
        Raise exception.Create('Falha ao Cadastrar SubGrupo!');
      Next;
    end;
    ShowMessage('Processo Concluído!');
  end;
end;


end.
