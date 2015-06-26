unit CdConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Conta, Banco, Agencia, Menus, CentroCusto, Usuario, Variants,
  ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadCnt = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtSaldo: TEdit;
    edtNumeroConta: TEdit;
    Label12: TLabel;
    Label15: TLabel;
    memObservacao: TMemo;
    Label3: TLabel;
    cmbSituacao: TComboBox;
    Conta1: TConta;
    DSConta1: TDataSource;
    DSAgencia1: TDataSource;
    DSBanco1: TDataSource;
    Banco1: TBanco;
    Banco1BNC_CODIGO: TIntegerField;
    Banco1CNC_CODIGO: TIntegerField;
    Banco1BNC_NUMERO: TIntegerField;
    Agencia1: TAgencia;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    dblBanco: TDBLookupComboBox;
    dblAgencia: TDBLookupComboBox;
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
    Banco1BNC_NOME: TStringField;
    Banco1USU_CODIGO: TIntegerField;
    Banco1BNC_DT_CADASTRO: TDateTimeField;
    Banco1BNC_DT_ALTERADO: TDateTimeField;
    Label6: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    Label5: TLabel;
    edtUsuario: TEdit;
    Conta1CBN_CODIGO: TIntegerField;
    Conta1CNC_CODIGO: TIntegerField;
    Conta1CBN_SALDO: TIntegerField;
    Conta1CBN_SITUACAO: TIntegerField;
    Conta1CBN_NUMERO: TIntegerField;
    Conta1BNC_NUMERO: TIntegerField;
    Conta1CBN_OBSERVACAO: TStringField;
    Conta1AGN_NUMERO: TIntegerField;
    Conta1CBN_DT_ALTERADO: TDateTimeField;
    Conta1CBN_DT_CADASTRO: TDateTimeField;
    Conta1USU_CODIGO: TIntegerField;
    Conta1Usuario: TStringField;
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
    procedure SB_LocCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Conta1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sair1Click(Sender: TObject);
    procedure Conta1BeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Conta1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblAgenciaClick(Sender: TObject);
    procedure dblBancoClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TConta;
  end;

var
  fCadCnt: TfCadCnt;

implementation

Uses UDM, funcoes;

{$R *.DFM}

procedure TfCadCnt.SB_PrimClick(Sender: TObject);
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

procedure TfCadCnt.SB_AntClick(Sender: TObject);
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

procedure TfCadCnt.SB_ProxClick(Sender: TObject);
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

procedure TfCadCnt.SB_UltClick(Sender: TObject);
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

procedure TfCadCnt.SB_NovoCabClick(Sender: TObject);
begin
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(300)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtNumeroConta.SetFocus;
end;

procedure TfCadCnt.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(320)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');

  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtNumeroConta.SetFocus;
end;

procedure TfCadCnt.SB_SalvaCabClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(False);
    edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadCnt.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadCnt.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');

  Entidade.Localizar;
end;

procedure TfCadCnt.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(310)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.deletarauto;
end;

procedure TfCadCnt.FormCreate(Sender: TObject);
begin
  Entidade:=Conta1;
end;

procedure TfCadCnt.Conta1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
end;

procedure TfCadCnt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Banco1.Active:=False;
  Agencia1.Active:=False;
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadCnt.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadCnt.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCadCnt.Conta1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
  if dblBanco.Text <> '' then
    Entidade.ParamByName('BNC_NUMERO').AsInteger:=dblBanco.KeyValue;
  if dblAgencia.Text <> '' then
    Entidade.ParamByName('AGN_NUMERO').AsInteger:=dblAgencia.KeyValue;
end;

procedure TfCadCnt.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Banco1.Open;
  Agencia1.Open;
  Entidade.Open;
  dblBanco.KeyValue := Banco1.NumeroBanco;
  dblBancoClick(sender);
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadCnt.Conta1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfCadCnt.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadCnt.AtualizaControles(Habilitar: Boolean);
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

procedure TfCadCnt.dblAgenciaClick(Sender: TObject);
begin
  Entidade.close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadCnt.dblBancoClick(Sender: TObject);
begin
  Agencia1.close;
  Agencia1.ParamByName('BNC_NUMERO').AsInteger:=Banco1.NumeroBanco;
  Agencia1.Open;
  dblAgencia.KeyValue := Agencia1.NumeroAgencia;
  dblAgenciaClick(sender);
end;

end.
