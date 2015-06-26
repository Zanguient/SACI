unit CdCntCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, StdCtrls, Mask,
  DBCtrls, Parametro, Menus, SQuery, Conta_de_Caixa, Titulo_receber,
  Titulo_a_Pagar, Movimento_caixa, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  ActnList, XPStyleActnCtrls;

type
  TfCadCntCaixa = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoCCX: TEdit;
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
    edtDescricao: TEdit;
    Label2: TLabel;
    edtLimiteGasto: TEdit;
    Label3: TLabel;
    cmbTipo: TComboBox;
    Label4: TLabel;
    DSConta_de_Caixa1: TDataSource;
    Conta_de_Caixa1: TConta_de_Caixa;
    Label6: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    edtContabil1: TEdit;
    labContabil2: TLabel;
    edtContabil2: TEdit;
    labContabil1: TLabel;
    ckbVisualizarFinanceiro: TCheckBox;
    ckbVisualizarCaixa: TCheckBox;
    labHistoricoContabil: TLabel;
    edtHistoricoContabil: TEdit;
    ckbAvulso: TCheckBox;
    labContabil4: TLabel;
    labContabil3: TLabel;
    edtContabil3: TEdit;
    edtContabil4: TEdit;
    dblGrupo: TDBLookupComboBox;
    Label12: TLabel;
    Parametro1: TParametro;
    Parametro2: TParametro;
    DSParametro1: TDataSource;
    Conta_de_Caixa1CCX_CODIGO: TIntegerField;
    Conta_de_Caixa1CNC_CODIGO: TIntegerField;
    Conta_de_Caixa1CCX_DC: TStringField;
    Conta_de_Caixa1CCX_DESCRICAO: TStringField;
    Conta_de_Caixa1CCX_LIMITE_GASTO: TFloatField;
    Conta_de_Caixa1CCX_DISPONIVEL: TFloatField;
    Conta_de_Caixa1USU_CODIGO: TIntegerField;
    Conta_de_Caixa1CCX_DT_ALTERADO: TDateTimeField;
    Conta_de_Caixa1CCX_CONTABIL_1: TStringField;
    Conta_de_Caixa1CCX_CONTABIL_2: TStringField;
    Conta_de_Caixa1CCX_VISUALIZAR_FINANCEIRO: TSmallintField;
    Conta_de_Caixa1CCX_VISUALIZAR_CAIXA: TSmallintField;
    Conta_de_Caixa1CCX_HISTORICO_CONTABIL: TStringField;
    Conta_de_Caixa1CCX_AVULSO: TIntegerField;
    Conta_de_Caixa1CCX_DT_CADASTRO: TDateTimeField;
    Conta_de_Caixa1CCX_CONTABIL_3: TStringField;
    Conta_de_Caixa1CCX_CONTABIL_4: TStringField;
    Conta_de_Caixa1GrupoNome: TStringField;
    Conta_de_Caixa1CCX_GRUPO: TIntegerField;
    Conta_de_Caixa1CCX_OBSERVACAO: TStringField;
    edtObservacao: TEdit;
    Label13: TLabel;
    Label22: TLabel;
    cmbSituacao: TComboBox;
    Conta_de_Caixa1CCX_SITUACAO: TIntegerField;
    SB_GerarSubGrupo: TSpeedButton;
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Conta_de_Caixa1AfterScroll(DataSet: TDataSet);
    procedure SairCabClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Conta_de_Caixa1CalcFields(DataSet: TDataSet);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure SB_GerarSubGrupoClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TConta_de_Caixa;
  end;

var
  fCadCntCaixa: TfCadCntCaixa;

implementation

Uses
  UDM, funcoes, CdLimiteGasto;

{$R *.DFM}

procedure TfCadCntCaixa.SB_PrimClick(Sender: TObject);
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

procedure TfCadCntCaixa.SB_AntClick(Sender: TObject);
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

procedure TfCadCntCaixa.SB_ProxClick(Sender: TObject);
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

procedure TfCadCntCaixa.SB_UltClick(Sender: TObject);
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

procedure TfCadCntCaixa.SB_NovoCabClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(940)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(1, True);
  edtDescricao.SetFocus;
end;

procedure TfCadCntCaixa.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(960)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');

  Entidade.PreparaAlteracao;
  AtualizaControles(1, True);  
  edtDescricao.SetFocus;
end;

procedure TfCadCntCaixa.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(950)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT COUNT(MVC_CODIGO) AS QTD '+
      ' FROM MOVIMENTO_DE_CAIXA '+
      ' WHERE CCX_CODIGO='+IntToStr(Entidade.CodigoCCX)+
      ' OR CCX_CODIGO_REC='+IntToStr(Entidade.CodigoCCX);
    Open;
    if FieldByName('QTD').asInteger > 0 then
      Raise exception.Create('Conta utilizada em '+FieldByName('QTD').asString+' Movimento(s) de caixa!');

    Close;
    SQL.Text := 'SELECT COUNT(TRC_CODIGO) AS QTD '+
      ' FROM TITULO_A_RECEBER '+
      ' WHERE CCX_CODIGO='+IntToStr(Entidade.CodigoCCX)+
      ' OR CCX_CODIGO_REC='+IntToStr(Entidade.CodigoCCX);
    Open;
    if FieldByName('QTD').asInteger > 0 then
      Raise exception.Create('Conta utilizada em '+FieldByName('QTD').asString+' Título(s) a Receber!');

    Close;
    SQL.Text := 'SELECT COUNT(TPG_CODIGO) AS QTD '+
      ' FROM TITULO_A_PAGAR '+
      ' WHERE CCX_CODIGO='+IntToStr(Entidade.CodigoCCX)+
      ' OR CCX_CODIGO_REC='+IntToStr(Entidade.CodigoCCX);
    Open;
    if FieldByName('QTD').asInteger > 0 then
      Raise exception.Create('Conta utilizada em '+FieldByName('QTD').asString+' Título(s) a Pagar!');

    Close;
    SQL.Text := 'SELECT COUNT(LMG_CODIGO) AS QTD '+
      ' FROM LIMITE_GASTO '+
      ' WHERE CCX_CODIGO='+IntToStr(Entidade.CodigoCCX);
    Open;
    if FieldByName('QTD').asInteger > 0 then
      Raise exception.Create('Conta com '+FieldByName('QTD').asString+' Limites de Gasto!');
  end;
  Entidade.Deletarauto;
end;

procedure TfCadCntCaixa.SB_SalvaCabClick(Sender: TObject);
begin
  if VerificaFloatBranco(edtLimiteGasto.Text) and
     (cmbTipo.ItemIndex = 0) then //Crédito
    Raise exception.Create('Só é permitido Limite de Gasto para Contas de Débito!');

  if Entidade.FinalizaEdicao then
    AtualizaControles(1, False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadCntCaixa.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
end;

procedure TfCadCntCaixa.FormCreate(Sender: TObject);
begin
  Entidade := Conta_de_Caixa1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_CADCCX_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfCadCntCaixa.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');

  Entidade.Selecionar;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadCntCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_CADCCX_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Parametro1.Close;
  Parametro2.Close;
  Action := Cafree;
end;

procedure TfCadCntCaixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadCntCaixa.Conta_de_Caixa1AfterScroll(DataSet: TDataSet);
begin
  Conta_de_Caixa1.CarregaDados;
end;

procedure TfCadCntCaixa.SairCabClick(Sender: TObject);
begin
  fCadCntCaixa.Close;
end;

procedure TfCadCntCaixa.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Parametro1.Open;
  Entidade.Open;
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    labContabil1.Visible := False;
    edtContabil1.Visible := False;
    labContabil2.Visible := False;
    edtContabil2.Visible := False;
    labContabil3.Visible := False;
    edtContabil3.Visible := False;
    labContabil4.Visible := False;
    edtContabil4.Visible := False;
    labHistoricoContabil.Visible := False;
    edtHistoricoContabil.Visible := False;
    ckbVisualizarFinanceiro.Visible := False;
    ckbVisualizarCaixa.Visible := False;
    DBGrid5.Columns[5].Visible := False;
    DBGrid5.Columns[6].Visible := False;
    DBGrid5.Columns[7].Visible := False;
    DBGrid5.Columns[8].Visible := False;
    DBGrid5.Columns[9].Visible := False;
  end;
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadCntCaixa.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadCntCaixa.Conta_de_Caixa1CalcFields(DataSet: TDataSet);
begin
  if Entidade.Grupo > 0 then
  Begin
    with Parametro2 do
    Begin
      if CodigoPAR <> Entidade.Grupo then
      Begin
        Close;
        ParamByName('PAR_CODIGO').asInteger := Entidade.Grupo;
        Open;
      end;
      Entidade.FieldByName('GrupoNome').asString := Descricao;
    end;
  end
  else
    Entidade.FieldByName('GrupoNome').asString:='';
end;

procedure TfCadCntCaixa.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  SairCab.Enabled       := not Habilitar;
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarCab.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_ExcCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);

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

procedure TfCadCntCaixa.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfCadCntCaixa.SB_GerarSubGrupoClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(960)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if cmbTipo.ItemIndex = 0 then //Crédito
    Raise exception.Create('Só é permitido Limite de Gasto para Contas de Débito!');

  Application.CreateForm(TfCadLimiteGasto, fCadLimiteGasto);
  with fCadLimiteGasto do
  Begin
    Tag:=0;
    dblCodigoCCX.KeyValue := self.Entidade.CodigoCCX;
    ShowModal;
  end;
end;

end.
