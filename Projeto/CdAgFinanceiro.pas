unit CdAgFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, StdCtrls, Mask,
  Fornecedor, AgenteFin, Menus, FatFin, SQuery, Usuario, Pedido_de_Venda,
  Titulo_a_Pagar, Titulo_receber, Parametro, DBCtrls, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadAgFinan = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    edtDescricao: TEdit;
    edtCodigoAGF: TEdit;
    edtPrazo: TEdit;
    edtJuros: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtTaxa: TEdit;
    Label16: TLabel;
    Label3: TLabel;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    Label4: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtFatorCorrecao: TEdit;
    edtNumeroPrestacoes: TEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    SB_NovoItem: TSpeedButton;
    SB_AltItem: TSpeedButton;
    SB_ExcItem: TSpeedButton;
    SB_SalvaItem: TBitBtn;
    SB_CancItem: TBitBtn;
    FatorFinanceira1: TFatorFinanceira;
    DSFatorFinanceira1: TDataSource;
    FatorFinanceira1CNC_CODIGO: TIntegerField;
    FatorFinanceira1FAF_CODIGO: TIntegerField;
    FatorFinanceira1AGF_CODIGO: TIntegerField;
    FatorFinanceira1FAF_NPARC: TIntegerField;
    FatorFinanceira1FAF_FATOR: TFloatField;
    FatorFinanceira1USU_CODIGO: TIntegerField;
    FatorFinanceira1FAF_DT_ALTERADO: TDateTimeField;
    Label10: TLabel;
    Label2: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    Label6: TLabel;
    edtUsuario: TEdit;
    AgenteFin1AGF_CODIGO: TIntegerField;
    AgenteFin1CNC_CODIGO: TIntegerField;
    AgenteFin1AGF_DESCRICAO: TStringField;
    AgenteFin1AGF_TAXA_ADM: TFloatField;
    AgenteFin1AGF_JUROS: TFloatField;
    AgenteFin1AGF_DIA_PAGAMENTO: TIntegerField;
    AgenteFin1AGF_ANTECIPACAO: TFloatField;
    AgenteFin1USU_CODIGO: TIntegerField;
    AgenteFin1AGF_DT_ALTERADO: TDateTimeField;
    AgenteFin1Usuario: TStringField;
    SB_LocCab: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    AgenteFin1AGF_DT_CADASTRO: TDateTimeField;
    FatorFinanceira1FAF_DT_CADASTRO: TDateTimeField;
    ckbJurosEntrada: TCheckBox;
    AgenteFin1AGF_JUROS_ENTRADA: TIntegerField;
    Label11: TLabel;
    Label12: TLabel;
    edtContabil1: TEdit;
    edtContabil2: TEdit;
    Label15: TLabel;
    Label17: TLabel;
    edtContabil3: TEdit;
    edtContabil4: TEdit;
    AgenteFin1AGF_CONTABIL_1: TStringField;
    AgenteFin1AGF_CONTABIL_2: TStringField;
    AgenteFin1AGF_CONTABIL_3: TStringField;
    AgenteFin1AGF_CONTABIL_4: TStringField;
    AgenteFin1AGF_HISTORICO_CONTABIL: TStringField;
    Label9: TLabel;
    edtHistoricoContabil: TEdit;
    AgenteFin1AGF_LIBERAR_DESCONTO_FPG: TIntegerField;
    ckbLiberarDescontoFPG: TCheckBox;
    AgenteFin1AGF_SITUACAO: TIntegerField;
    Label22: TLabel;
    cmbSituacao: TComboBox;
    ckbEspecial: TCheckBox;
    AgenteFin1AGF_ESPECIAL: TIntegerField;
    AgenteFin1AGF_OBSERVACAO: TStringField;
    AgenteFin1AGF_REC_AVISTA: TIntegerField;
    AgenteFin1AGF_TAXA_MENSAL: TFloatField;
    Label18: TLabel;
    edtTaxaMensal: TEdit;
    Label21: TLabel;
    edtObservacao: TEdit;
    ckbRecebimentoAVsita: TCheckBox;
    Label23: TLabel;
    dblTipoExclusivo: TDBLookupComboBox;
    btnLimpaTipoPag: TBitBtn;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    AgenteFin1AGF_TIPOPAG_EXCLUSIVO: TIntegerField;
    ckbSomenteAtivos: TCheckBox;
    ckbCentavosEntrada: TCheckBox;
    AgenteFin1AGF_CENTAVOS_ENTRADA: TIntegerField;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    SairCab: TAction;
    IncluirItem: TAction;
    AlterarItem: TAction;
    ExcluirItem: TAction;
    SalvarItem: TAction;
    CancelarItem: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AgenteFin1AfterScroll(DataSet: TDataSet);
    procedure SairCabClick(Sender: TObject);
    procedure SB_NovoItemClick(Sender: TObject);
    procedure SB_AltItemClick(Sender: TObject);
    procedure SB_ExcItemClick(Sender: TObject);
    procedure SB_SalvaItemClick(Sender: TObject);
    procedure SB_CancItemClick(Sender: TObject);
    procedure FatorFinanceira1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure AgenteFin1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure edtNumeroPrestacoesExit(Sender: TObject);
    procedure btnLimpaTipoPagClick(Sender: TObject);
    procedure ckbSomenteAtivosClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho, Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TAgenteFin;
  end;

var
  fCadAgFinan: TfCadAgFinan;

implementation
Uses UDM, funcoes;
{$R *.DFM}



procedure TfCadAgFinan.SB_NovoCabClick(Sender: TObject);
begin
  if not DM.Configuracao1.CPD then
    Raise Exception.Create('Somente no CPD');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Somente no Centro de Custo CPD');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(380)) < 0) then
    Raise exception.Create('Usuário não tem permissão para inserir Agente Financeiro!');

  edtUsuario.text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  Entidade.PreparaInsercao;
  AtualizaControles(True, True);
  edtDescricao.SetFocus;
end;

procedure TfCadAgFinan.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');

  if not DM.Configuracao1.CPD then
    Raise Exception.Create('Somente no CPD');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Somente no Centro de Custo CPD');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(400)) < 0) then
    Raise exception.Create('Usuário não tem permissão para alterar Agente Financeiro!');

  edtUsuario.text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  Entidade.PreparaAlteracao;
  AtualizaControles(True, True);
  edtDescricao.SetFocus;
end;

procedure TfCadAgFinan.SB_ExcCabClick(Sender: TObject);
var
  CdAGF:integer;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if not DM.Configuracao1.CPD then
    Raise Exception.Create('Somente no CPD');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Somente no Centro de Custo CPD');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(390)) < 0) then
    Raise exception.Create('Usuário não tem permissão para excluir Agente Financeiro!');

  CdAGF:=Entidade.CodigoAGF;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE AGF_CODIGO='+IntToStr(CdAGF);
    Open;
    if not IsEmpty then
      Raise Exception.Create('Esse agente financeiro foi utilizado em um Pedido de Venda! ('+FieldByName('PDV_CODIGO').asString+')');

    Close;
    SQL.Text := 'SELECT TRC_CODIGO '+
      ' FROM TITULO_A_RECEBER '+
      ' WHERE AGF_CODIGO='+IntToStr(CdAGF);
    Open;
    if not IsEmpty then
      Raise Exception.Create('Esse agente financeiro foi utilizado em um Título a Receber! ('+FieldByName('TRC_CODIGO').asString+')');
  end;

  if Entidade.Deletarauto then
  Begin
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM FATOR_DE_FINANCEIRA '+
      ' WHERE AGF_CODIGO='+IntToStr(CdAGF));
    FatorFinanceira1.Close;
    Entidade.Close;
    Entidade.Open;
    FatorFinanceira1.Open;
  end;
end;

procedure TfCadAgFinan.SB_SalvaCabClick(Sender: TObject);
begin
  if edtPrazo.Text = '' then
    edtPrazo.Text := '0';
  if edtTaxa.Text = '' then
    edtTaxa.Text := '0';
  if edtJuros.Text = '' then
    edtJuros.Text := '0';
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(True, False);
  end
  else
    ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
end;

procedure TfCadAgFinan.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False, False);
end;

procedure TfCadAgFinan.FormCreate(Sender: TObject);
begin
  Entidade:=AgenteFin1;
end;

procedure TfCadAgFinan.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');

  Entidade.Localizar;
end;

procedure TfCadAgFinan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active:=False;
  FatorFinanceira1.Active:=False;
  Action:=Cafree;
end;

procedure TfCadAgFinan.AgenteFin1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
end;

procedure TfCadAgFinan.SairCabClick(Sender: TObject);
begin
 fCadAgFinan.Close;
end;

procedure TfCadAgFinan.SB_NovoItemClick(Sender: TObject);
begin
  if not DM.Configuracao1.CPD then
    Raise Exception.Create('Somente no CPD');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Somente no Centro de Custo CPD');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(400)) < 0) then
    Raise exception.Create('Usuário não tem permissão para alterar Agente Financeiro!');


  FatorFinanceira1.PreparaInsercao;
  AtualizaControles(False, True);
  edtNumeroPrestacoes.SetFocus;
end;

procedure TfCadAgFinan.SB_AltItemClick(Sender: TObject);
begin
  if FatorFinanceira1.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if not DM.Configuracao1.CPD then
    Raise Exception.Create('Somente no CPD');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Somente no Centro de Custo CPD');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(400)) < 0) then
    Raise exception.Create('Usuário não tem permissão para alterar Agente Financeiro!');

  FatorFinanceira1.PreparaAlteracao;
  AtualizaControles(False, True);
  edtNumeroPrestacoes.SetFocus;
end;

procedure TfCadAgFinan.SB_ExcItemClick(Sender: TObject);
begin
  if FatorFinanceira1.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if not DM.Configuracao1.CPD then
    Raise Exception.Create('Somente no CPD');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Somente no Centro de Custo CPD');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(400)) < 0) then
    Raise exception.Create('Usuário não tem permissão para alterar Agente Financeiro!');
            
  FatorFinanceira1.Deletarauto;
end;

procedure TfCadAgFinan.SB_SalvaItemClick(Sender: TObject);
Var
  Aux:TdataSetNotifyEvent;
begin
  If FatorFinanceira1.Estado=1 then
  Begin
    Aux:=FatorFinanceira1.AfterScroll;
    FatorFinanceira1.AfterScroll:=nil;
    Try
      If FatorFinanceira1.LocalizarNParc(StrToInt(FatorFinanceira1.ECodigoAGF.Text),StrToInt(FatorFinanceira1.ENumParc.Text)) Then
      Begin
        Showmessage('Já existe um número de parcelas cadastrado com este mesmo número!');
        FatorFinanceira1.AfterScroll:=Aux;
        Exit;
      End;
    Except
      FatorFinanceira1.AfterScroll:=Aux;
      Exit;
    End;
    FatorFinanceira1.AfterScroll:=Aux;
  End;
  if FatorFinanceira1.FinalizaEdicao then
  Begin
    AtualizaControles(False, False);
  end
  else
    ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
end;

procedure TfCadAgFinan.SB_CancItemClick(Sender: TObject);
begin
  FatorFinanceira1.CancelaEdicao;
  AtualizaControles(False, False);
end;


procedure TfCadAgFinan.FatorFinanceira1AfterScroll(DataSet: TDataSet);
begin
  FatorFinanceira1.CarregaDados;
end;

procedure TfCadAgFinan.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If (SB_SalvaCab.Enabled) or (SB_SalvaItem.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadAgFinan.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Parametro1.Open;
  Entidade.Open;
  FatorFinanceira1.Open;
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadAgFinan.AgenteFin1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfCadAgFinan.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else if SB_CancItem.Enabled then
    Begin
      SB_CancItem.SetFocus;
      SB_CancItemClick(sender);
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
    end
    else if SB_SalvaItem.Enabled then
    Begin
      SB_SalvaItem.SetFocus;
      SB_SalvaItemClick(sender);
    end;
  end
end;

procedure TfCadAgFinan.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfCadAgFinan.edtNumeroPrestacoesExit(Sender: TObject);
begin
  if edtNumeroPrestacoes.Enabled and
     (edtFatorCorrecao.Text = '') then
    try
      edtFatorCorrecao.Text := Format('%.7f',[1/StrToFloat(edtNumeroPrestacoes.Text)]);
    except
    end;
end;

procedure TfCadAgFinan.AtualizaControles(Cabecalho, Habilitar: Boolean);
begin
  btnLimpaTipoPag.Enabled  := (Cabecalho and Habilitar);
  ckbSomenteAtivos.Enabled := not Habilitar;
  SairCab.Enabled       := not Habilitar;
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  LocalizarCab.Enabled  := not Habilitar;
  SalvarCab.Enabled     := (Cabecalho and Habilitar);
  CancelarCab.Enabled   := (Cabecalho and Habilitar);
  SB_LocCab.Enabled     := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := (Cabecalho and Habilitar);
  SB_CancCab.Enabled    := (Cabecalho and Habilitar);

  IncluirItem.Enabled   := not Habilitar;
  AlterarItem.Enabled   := not Habilitar;
  ExcluirItem.Enabled   := not Habilitar;
  SB_NovoItem.Enabled   := not Habilitar;
  SB_AltItem.Enabled    := not Habilitar;
  SB_ExcItem.Enabled    := not Habilitar;
  SB_SalvaItem.Enabled  := ((not Cabecalho) and Habilitar);
  SB_CancItem.Enabled   := ((not Cabecalho) and Habilitar);

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

procedure TfCadAgFinan.btnLimpaTipoPagClick(Sender: TObject);
begin
  dblTipoExclusivo.KeyValue := 0;
  try
    dblTipoExclusivo.SetFocus;
  except
  end;
end;

procedure TfCadAgFinan.ckbSomenteAtivosClick(Sender: TObject);
begin
  with Entidade do
  Begin
    Close;
    if ckbSomenteAtivos.Checked then
      SQL.Text := 'SELECT * FROM AGENTE_FINANCEIRO '+
                  ' WHERE AGF_SITUACAO=0 '+
                  ' ORDER BY AGF_DESCRICAO '
    else
      SQL.Text := 'SELECT * FROM AGENTE_FINANCEIRO '+
                  ' ORDER BY AGF_DESCRICAO ';
    Open;
  end;
end;

end.
