unit CdLimiteGasto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Menus, JPEG, LimiteGasto, DBCtrls, CentroCusto, Conta_de_Caixa;

type
  TfCadLimiteGasto = class(TForm)
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
    edtLimiteMensal: TEdit;
    edtCodigoLMG: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    DSLimiteGasto1: TDataSource;
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
    Label4: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    edtObservacao: TEdit;
    LimiteGasto1: TLimiteGasto;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    Panel2: TPanel;
    Label44: TLabel;
    dblCentroDeCusto: TDBLookupComboBox;
    Label5: TLabel;
    dblCodigoCCX: TDBLookupComboBox;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    LimiteGasto1CNC_ORIGEM: TIntegerField;
    LimiteGasto1CNC_CODIGO: TIntegerField;
    LimiteGasto1LMG_CODIGO: TIntegerField;
    LimiteGasto1USU_CODIGO: TIntegerField;
    LimiteGasto1CCX_CODIGO: TIntegerField;
    LimiteGasto1LMG_DT_CADASTRO: TDateTimeField;
    LimiteGasto1LMG_DT_ALTERADO: TDateTimeField;
    LimiteGasto1LMG_LIMITE_MENSAL: TFloatField;
    LimiteGasto1LMG_SITUACAO: TIntegerField;
    LimiteGasto1LMG_OBSERVACAO: TStringField;
    LimiteGasto1Centro: TStringField;
    GroupBox1: TGroupBox;
    cbMes: TComboBox;
    cbILIMITADO: TCheckBox;
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure LimiteGasto1AfterScroll(DataSet: TDataSet);
    procedure dblCodigoCCXClick(Sender: TObject);
    procedure LimiteGasto1BeforeOpen(DataSet: TDataSet);
    procedure LimiteGasto1CalcFields(DataSet: TDataSet);
  private
    tipo, vlrLimite:string;
    procedure AtualizaControles(Habilitar: Boolean);

    { Private declarations }
  public
    { Public declarations }
    Entidade:TLimiteGasto;
  end;

var
  fCadLimiteGasto: TfCadLimiteGasto;

implementation

Uses UDM,funcoes;

{$R *.DFM}

procedure TfCadLimiteGasto.SB_PrimClick(Sender: TObject);
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

procedure TfCadLimiteGasto.SB_AntClick(Sender: TObject);
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

procedure TfCadLimiteGasto.SB_ProxClick(Sender: TObject);
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

procedure TfCadLimiteGasto.SB_UltClick(Sender: TObject);
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

procedure TfCadLimiteGasto.AtualizaControles(Habilitar:Boolean);
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

procedure TfCadLimiteGasto.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(960)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtLimiteMensal.SetFocus;
  //awof
  cbMes.Enabled:= False;
  cbILIMITADO.Enabled:= True;
  cbILIMITADO.Checked:= true;
  tipo:='NOVO';
end;

procedure TfCadLimiteGasto.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(960)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtLimiteMensal.SetFocus;
  //awof - tratar recebimento valor Limite Mensal e o mês caso seja alterado
  cbMes.Enabled:= true;
  cbILIMITADO.Enabled:= true;
  tipo:='ALTERAR' ;
end;

procedure TfCadLimiteGasto.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(960)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  //AWOF LIMPA A TABLEA LIMITE_MÊS
  {DM.QR_Comandos.Close;
  DM.QR_Comandos.SQL.Text:= ' DELETE FROM LIMITE_MES WHERE '+
                            ' CCX_CODIGO= '''+IntToStr(dblCodigoCCX.KeyValue)+''' '+
                            ' AND CNC_CODIGO= '''+IntToStr(dblCentroDeCusto.KeyValue)+''' ';
  DM.QR_Comandos.execSql;}

  Entidade.Deletar(Entidade.CodigoLMG);
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadLimiteGasto.SB_SalvaCabClick(Sender: TObject);
begin
  vlrLimite:= edtLimiteMensal.Text; // awof - variavel para receber valor limite
  //PlanejarLimiteMensal;

  
  If Entidade.FinalizaEdicao then
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');

  if edtLimiteMensal.Text = '0,00' then
  begin
    ExecutaSQL(DM.QR_Comandos, ' UPDATE LIMITE_GASTO SET LMG_LIMITE_MENSAL = '+ vlrLimite +
                              ' where CCX_CODIGO = '+IntToStr(dblCodigoCCX.KeyValue)+
                              ' AND CNC_CODIGO= '+IntToStr(dblCentroDeCusto.KeyValue));
    LimiteGasto1.Close;
    LimiteGasto1.Open;
  end;

end;

procedure TfCadLimiteGasto.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
  //awof
  cbMes.Enabled:= False;
  cbILIMITADO.Enabled:= False;
  tipo:='CANCELAR';
end;

procedure TfCadLimiteGasto.FormCreate(Sender: TObject);
begin
  Entidade:=LimiteGasto1;
  CentroCusto2.Open;
  Conta_de_Caixa1.Open;
end;

procedure TfCadLimiteGasto.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadLimiteGasto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadLimiteGasto.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfCadLimiteGasto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadLimiteGasto.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if dblCentroDeCusto.Text = '' then
    dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
  if dblCodigoCCX.Text = '' then
    dblCodigoCCX.KeyValue := Conta_de_Caixa1.CodigoCCX;
  dblCodigoCCXClick(sender);

  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadLimiteGasto.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadLimiteGasto.LimiteGasto1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadLimiteGasto.dblCodigoCCXClick(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadLimiteGasto.LimiteGasto1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger := dblCentroDeCusto.KeyValue;
  except
    Entidade.ParamByName('CNC_CODIGO').asInteger := -1;
  end;
  try
    Entidade.ParamByName('CCX_CODIGO').asInteger := dblCodigoCCX.KeyValue;
  except
    Entidade.ParamByName('CCX_CODIGO').asInteger := -1;
  end;
end;

procedure TfCadLimiteGasto.LimiteGasto1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Centro').asString := DM.SelecionaCentroDeCusto(Entidade.CodigoCNC); 
end;

end.
