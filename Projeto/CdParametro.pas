unit CdParametro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Parametro, TipoParam, Menus, Variants, ToolWin,
  ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadParametro = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    edtCodigoPAR: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    TipoParam1: TTipoParam;
    DSTipoParam1: TDataSource;
    Panel2: TPanel;
    dblTipoParametro: TDBLookupComboBox;
    Label2: TLabel;
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
    Label22: TLabel;
    cmbSituacao: TComboBox;
    Label4: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    Label5: TLabel;
    edtInformacao: TEdit;
    Label6: TLabel;
    edtObservacao: TEdit;
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
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Parametro1AfterScroll(DataSet: TDataSet);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblTipoParametroClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TParametro;
  end;

var
  fCadParametro: TfCadParametro;

implementation

Uses UDM,funcoes;

{$R *.DFM}

procedure TfCadParametro.SB_PrimClick(Sender: TObject);
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

procedure TfCadParametro.SB_AntClick(Sender: TObject);
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

procedure TfCadParametro.SB_ProxClick(Sender: TObject);
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

procedure TfCadParametro.SB_UltClick(Sender: TObject);
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

procedure TfCadParametro.SB_NovoCabClick(Sender: TObject);
begin
  if not (dblTipoParametro.KeyValue > 0) then
    Raise Exception.Create('Selecione o Tipo de Parâmetro!');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(540)) < 0) then
    Raise exception.Create('Usuário não tem permissão para inserir Parametro!');

  Entidade.PreparaInsercao;
  AtualizaControles(1, True);
  edtDescricao.SetFocus;
end;

procedure TfCadParametro.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(560)) < 0) then
    Raise exception.Create('Usuário não tem permissão para alterar Parametro!');

  Entidade.PreparaAlteracao;
  AtualizaControles(1, True);
  edtDescricao.SetFocus;
end;

procedure TfCadParametro.SB_ExcCabClick(Sender: TObject);
var
  CdPAR: integer;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if Entidade.CodigoPAR IN [5,6,13] then
    Raise Exception.Create('Parâmetro obrigatório do sistema!');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(550)) < 0) then
    Raise exception.Create('Usuário não tem permissão para excluir Parametro!');

  CdPAR := Entidade.CodigoPAR;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE PDV_TIPO_PAG='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Pagamento utilizado!');

    Close;
    SQL.Text := 'SELECT TRC_CODIGO '+
      ' FROM TITULO_A_RECEBER '+
      ' WHERE TRC_TIPO_DOC='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Documento utilizado!');

    Close;
    SQL.Text := 'SELECT TPG_CODIGO '+
      ' FROM TITULO_A_PAGAR '+
      ' WHERE TPG_TIPO_DOC='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Documento utilizado!');

    Close;
    SQL.Text := 'SELECT CLI_CODIGO '+
      ' FROM CLIENTE '+
      ' WHERE CLI_CLASSIFICACAO='+IntToStr(CdPAR)+
      ' OR CLI_TIPO='+IntToStr(CdPAR)+
      ' OR CLI_LOGRADOURO='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Classiicação/Tipo/Logradouro de cliente utilizado!');

    Close;
    SQL.Text := 'SELECT FUN_CODIGO '+
      ' FROM FUNCIONARIO '+
      ' WHERE FUN_FUNCAO='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Função utilizada!');

    Close;
    SQL.Text := 'SELECT MEC_CODIGO '+
      ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL '+
      ' WHERE MEC_TIPO_MOV='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Movimento utilizado!');

    Close;
    SQL.Text := 'SELECT MES_CODIGO '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISCAL '+
      ' WHERE MES_TIPO_MOV='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Movimento utilizado!');

    Close;
    SQL.Text := 'SELECT MEF_CODIGO '+
      ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
      ' WHERE MEF_TIPO_MOV='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Movimento utilizado!');

    Close;
    SQL.Text := 'SELECT MSN_CODIGO '+
      ' FROM MOVIMENTO_DE_ESTOQUE_SN '+
      ' WHERE MSN_TIPO_MOV='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Movimento utilizado!');

    Close;
    SQL.Text := 'SELECT ML4_CODIGO '+
      ' FROM MOVIMENTO_DE_ESTOQUE_LJ4 '+
      ' WHERE ML4_TIPO_MOV='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Movimento utilizado!');

    Close;
    SQL.Text := 'SELECT CCX_CODIGO '+
      ' FROM CONTA_DE_CAIXA '+
      ' WHERE CCX_GRUPO='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Grupo de Conta de Caixa utilizado!');

    Close;
    SQL.Text := 'SELECT MCH_CODIGO '+
      ' FROM MOVIMENTO_DE_CHEQUE '+
      ' WHERE MCH_TIPO='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Movimento utilizado!');

    Close;
    SQL.Text := 'SELECT MCC_CODIGO '+
      ' FROM MOVIMENTO_CONTA_CORRENTE '+
      ' WHERE MCC_TIPO='+IntToStr(CdPAR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Tipo de Movimento utilizado!');
  end;
  Entidade.deletarauto;
end;

procedure TfCadParametro.SB_SalvaCabClick(Sender: TObject);
begin
  if dblTipoParametro.KeyValue = 100 then //Tipo Mov. de Conta Corrente
  Begin
    if not VerificaInteiroBranco(edtInformacao.Text) then
      Raise exception.Create('Informação inválida!'+#13+
                             'Opções possíveis (0,1):'+#13+
                             '0 - Débito'+#13+
                             '1 - Crédito')
    else if (not (StrToInt(edtInformacao.Text) in [0,1])) then
      Raise exception.Create('Informação inválida!'+#13+
                             'Opções possíveis (0,1):'+#13+
                             '0 - Débito'+#13+
                             '1 - Crédito');    
  end;
  if Entidade.FinalizaEdicao then
    AtualizaControles(1, False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadParametro.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
end;

procedure TfCadParametro.FormCreate(Sender: TObject);
begin
  Entidade:=Parametro1;
  TipoParam1.Active:=true;
  Entidade.Active:=true;
end;

procedure TfCadParametro.SB_LocCabClick(Sender: TObject);
begin
 If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
 Entidade.Localizar;
end;

procedure TfCadParametro.Cliente1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadParametro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  TipoParam1.Active:=False;
  Action:=Cafree;
end;

procedure TfCadParametro.Parametro1AfterScroll(DataSet: TDataSet);
begin
  Parametro1.CarregaDados;
end;

procedure TfCadParametro.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadParametro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadParametro.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  dblTipoParametro.KeyValue := TipoParam1.CodigoTPR;
  dblTipoParametroClick(sender);
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadParametro.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadParametro.dblTipoParametroClick(Sender: TObject);
begin
  Parametro1.close;
  Parametro1.ParamByName('TPR_CODIGO').AsInteger:=dblTipoParametro.KeyValue;
  Parametro1.Open;
  if Parametro1.IsEmpty then
    Parametro1.LimpaCampos;
end;

procedure TfCadParametro.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
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

end.
