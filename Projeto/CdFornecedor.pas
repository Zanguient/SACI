unit CdFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, DBCtrls, Parametro, Menus, Conta_de_Caixa, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadFor = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcPed: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_LocPed: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    edtFornecedor: TEdit;
    edtCodigoFOR: TEdit;
    edtNomeFantasia: TEdit;
    mskCNPJ: TMaskEdit;
    edtCGF: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mskCEP: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    mskFone: TMaskEdit;
    Label15: TLabel;
    cmbUF: TComboBox;
    memObservacao: TMemo;
    edtBairro: TEdit;
    Label16: TLabel;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    cmbSituacao: TComboBox;
    Fornecedor1: TFornecedor;
    DSFornecedor1: TDataSource;
    dblLogradouro: TDBLookupComboBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Fornecedor1FOR_CODIGO: TIntegerField;
    Fornecedor1CNC_CODIGO: TIntegerField;
    Fornecedor1FOR_RZ_SOCIAL: TStringField;
    Fornecedor1FOR_NOME_FAN: TStringField;
    Fornecedor1FOR_CGC: TStringField;
    Fornecedor1FOR_IE: TStringField;
    Fornecedor1FOR_LOGRADOURO: TIntegerField;
    Fornecedor1FOR_ENDERECO: TStringField;
    Fornecedor1FOR_BAIRRO: TStringField;
    Fornecedor1FOR_CIDADE: TStringField;
    Fornecedor1FOR_UF: TStringField;
    Fornecedor1FOR_CEP: TStringField;
    Fornecedor1FOR_FONE: TStringField;
    Fornecedor1FOR_SITUACAO: TIntegerField;
    Fornecedor1FOR_OBSERVACAO1: TStringField;
    Parametro2: TParametro;
    Fornecedor1Logradouro: TStringField;
    Fornecedor1Situacao: TStringField;
    mskFax: TMaskEdit;
    Label2: TLabel;
    edtSite: TEdit;
    Label14: TLabel;
    edtEMail: TEdit;
    Label17: TLabel;
    Fornecedor1FOR_FAX: TStringField;
    Fornecedor1FOR_SITE: TStringField;
    Fornecedor1FOR_EMAIL: TStringField;
    Fornecedor1USU_CODIGO: TIntegerField;
    Fornecedor1FOR_DT_ALTERADO: TDateTimeField;
    Label18: TLabel;
    mskDataCadastro: TMaskEdit;
    Fornecedor1FOR_DT_CADASTRO: TDateTimeField;
    Label21: TLabel;
    dblCodigoCCX: TDBLookupComboBox;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    Fornecedor1PCP_CONHECIMENTO: TIntegerField;
    Fornecedor1CCX_CODIGO: TIntegerField;
    Label22: TLabel;
    edtMarca: TEdit;
    Label23: TLabel;
    edtMaxItensNota: TEdit;
    Fornecedor1FOR_MAX_ITENS_NOTA: TIntegerField;
    Fornecedor1FOR_MARCA: TStringField;
    Label24: TLabel;
    edtReducaoICMS: TEdit;
    Fornecedor1FOR_REDUCAO_ICMS: TFloatField;
    Fornecedor1FOR_BANCO: TIntegerField;
    Fornecedor1FOR_NUMERO_AGENCIA: TStringField;
    Fornecedor1FOR_NUMERO_CONTA: TStringField;
    Label25: TLabel;
    mskBanco: TMaskEdit;
    mskAgencia: TMaskEdit;
    Label26: TLabel;
    mskConta: TMaskEdit;
    Label27: TLabel;
    Label28: TLabel;
    mskDataAlterado: TMaskEdit;
    SB_ContatoPed: TSpeedButton;
    Bevel1: TBevel;
    Label29: TLabel;
    imgFotoFornecedor: TImage;
    SpeedButton1: TSpeedButton;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    Sair1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_ExcPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure Fornecedor1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_ContatoPedClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFornecedorExit(Sender: TObject);
    procedure Fornecedor1CalcFields(DataSet: TDataSet);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure imgFotoFornecedorDblClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TFornecedor;
    CancelarCEP:Boolean;
  end;

var
  fCadFor: TfCadFor;

implementation

Uses
  UDM, CdContato,funcoes, CdProduto, MxLocalizaCEP, MxFotoAmpliada,
  MxRelProduto;

{$R *.DFM}

procedure TfCadFor.SB_PrimClick(Sender: TObject);
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

procedure TfCadFor.SB_AntClick(Sender: TObject);
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

procedure TfCadFor.SB_ProxClick(Sender: TObject);
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

procedure TfCadFor.SB_UltClick(Sender: TObject);
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

procedure TfCadFor.SB_NovoPedClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(140)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(1, True);
  edtFornecedor.SetFocus;
end;

procedure TfCadFor.SB_AltPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(160)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1, True);
  edtFornecedor.SetFocus;
end;

procedure TfCadFor.SB_ExcPedClick(Sender: TObject);
var
  CdFOR: integer;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(150)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  CdFOR := Entidade.CodigoFOR;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CNT_CODIGO '+
      ' FROM CONTATO '+
      ' WHERE FOR_CODIGO='+IntToStr(CdFOR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Fornecedor com contatos!');

    Close;
    SQL.Text := 'SELECT NTF_CODIGO '+
      ' FROM NOTA_FISCAL '+
      ' WHERE FOR_CODIGO='+IntToStr(CdFOR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Fornecedor com Nota Fiscal!');

    Close;
    SQL.Text := 'SELECT PCP_CODIGO '+
      ' FROM PEDIDO_DE_COMPRA '+
      ' WHERE FOR_CODIGO='+IntToStr(CdFOR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Fornecedor com Pedido de Compra!');

    Close;
    SQL.Text := 'SELECT TPG_CODIGO '+
      ' FROM TITULO_A_PAGAR '+
      ' WHERE FOR_CODIGO='+IntToStr(CdFOR);
    Open;
    if not IsEmpty then
      Raise exception.Create('Fornecedor com Título a Pagar!');
  end;

  Entidade.Deletarauto;
  if Entidade.IsEmpty then
  Begin
    edtCodigoFOR.Clear;
    cmbUF.ItemIndex := -1;
    cmbSituacao.ItemIndex := -1;
  end;  
end;

procedure TfCadFor.SB_SalvaPedClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
    AtualizaControles(1, False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadFor.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
  if Entidade.IsEmpty then
  Begin
    edtCodigoFOR.Clear;
    cmbUF.ItemIndex := -1;
    cmbSituacao.ItemIndex := -1;
  end;
end;

procedure TfCadFor.FormCreate(Sender: TObject);
begin
  Entidade:=Fornecedor1;
  Parametro1.Active:=True;
  Conta_de_Caixa1.Open;
  Entidade.Active:=true;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_CAD_FORN_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfCadFor.SB_LocPedClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Selecionar;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadFor.Fornecedor1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadFor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_CAD_FORN_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  if tag  = 1 then
    fCadProdutos.edtCodigoFOR.Text:=IntToStr(Entidade.CodigoFor);
  Entidade.Active:=false;
  Parametro1.Active:=False;
  Action:=Cafree;
end;

procedure TfCadFor.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCadFor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_SalvaPed.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadFor.SB_ContatoPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Fornecedor!');

  Application.CreateForm(TFCadCont, FCadCont);
  with fCadCont do
  Begin
    tag := 0;
    edtFORCNC.Text      := IntToStr(self.Entidade.CodigoCNC);
    edtCodigoFOR.Text   := IntToStr(self.Entidade.CodigoFOR);
    edtRazaoSocial.Text := self.Entidade.RazaoSocial;
    showmodal;
  end;
end;

procedure TfCadFor.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
end;

procedure TfCadFor.edtFornecedorExit(Sender: TObject);
begin
  if (edtNomeFantasia.text = '') and (edtFornecedor.text <> '') then
    edtNomeFantasia.Text := edtFornecedor.Text;
end;

procedure TfCadFor.Fornecedor1CalcFields(DataSet: TDataSet);
begin
  if Fornecedor1.Logradouro > 0 then
  Begin
    Parametro2.Close;
    Parametro2.ParamByName('PAR_CODIGO').asInteger:=Fornecedor1.Logradouro;
    Parametro2.Open;
    Fornecedor1.FieldByName('Logradouro').asString:=Parametro2.Descricao;
  end
  else
    Fornecedor1.FieldByName('Logradouro').asString:='';
  if Fornecedor1.Situacao = 0 then
    Fornecedor1.FieldByName('Situacao').asString:='Sem Pendências'
  else if Fornecedor1.Situacao = 1 then
    Fornecedor1.FieldByName('Situacao').asString:='Com Pendências'
  else
    Fornecedor1.FieldByName('Situacao').asString:='Desativado';
end;

procedure TfCadFor.edtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=chr(32)) and (edtEndereco.Text = '') then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxLocalizaCEP, fMxLocalizaCEP);
    fMxLocalizaCEP.tag:=3;
    fMxLocalizaCEP.ShowModal;
    if not CancelarCEP then
    Begin
      edtEndereco.Text:=edtEndereco.Text+', ';
    end;
  end;
end;

procedure TfCadFor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else
      Close;
  end
  else If key=chr(13) then
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end;
  end
  else if (Key = '"') then
    Key := #0;  
end;

procedure TfCadFor.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  Incluir1.Enabled    := not Habilitar;
  Alterar1.Enabled    := not Habilitar;
  Excluir1.Enabled    := not Habilitar;
  Salvar1.Enabled     := ((Cabecalho=1) and Habilitar);
  Cancelar1.Enabled   := ((Cabecalho=1) and Habilitar);
  Localizar1.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoPed.Enabled    := not Habilitar;
  SB_LocPed.Enabled     := not Habilitar;
  SB_AltPed.Enabled     := not Habilitar;
  SB_ExcPed.Enabled     := not Habilitar;
  SB_SalvaPed.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled    := ((Cabecalho=1) and Habilitar);

  SB_ContatoPed.Enabled := not Habilitar;
  SpeedButton1.Enabled  := not Habilitar;

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


procedure TfCadFor.imgFotoFornecedorDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgFotoFornecedor.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Nome Fantasia: '+Entidade.NomeFantasia);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Endereço: '+Entidade.Endereco+' - '+
    Entidade.Bairro+' - '+Entidade.Cidade+'/'+Entidade.Uf);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Entidade.OBS);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfCadFor.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfCadFor.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfMxRelProd, fMxRelProd);
  with fMxRelProd do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

end.
