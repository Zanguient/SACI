unit CdTransportador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Transportadora, DBCtrls, Parametro, Menus, Pedido_de_Compra, NotaFiscal,
  Titulo_a_Pagar, Conta_de_Caixa, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  ActnList, XPStyleActnCtrls;

type
  TfCadTran = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    edtRZSocial: TEdit;
    edtCodigoTRN: TEdit;
    edtFantasia: TEdit;
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
    mskTelefone: TMaskEdit;
    Label15: TLabel;
    cmbUF: TComboBox;
    memOBS: TMemo;
    edtBairro: TEdit;
    Label16: TLabel;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label19: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Label20: TLabel;
    edtSituacao: TComboBox;
    Transportadora1: TTransportadora;
    DSTransportadora1: TDataSource;
    dblLogradouro: TDBLookupComboBox;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    mskFAX: TMaskEdit;
    Label2: TLabel;
    edtSite: TEdit;
    Label14: TLabel;
    edtEmail: TEdit;
    Label17: TLabel;
    Transportadora1TRN_CODIGO: TIntegerField;
    Transportadora1CNC_CODIGO: TIntegerField;
    Transportadora1TRN_RZ_SOCIAL: TStringField;
    Transportadora1TRN_NOME_FAN: TStringField;
    Transportadora1TRN_CGC: TStringField;
    Transportadora1TRN_IE: TStringField;
    Transportadora1TRN_LOGRADOURO: TIntegerField;
    Transportadora1TRN_ENDERECO: TStringField;
    Transportadora1TRN_BAIRRO: TStringField;
    Transportadora1TRN_CIDADE: TStringField;
    Transportadora1TRN_UF: TStringField;
    Transportadora1TRN_CEP: TStringField;
    Transportadora1TRN_FONE: TStringField;
    Transportadora1TRN_SITUACAO: TIntegerField;
    Transportadora1TRN_OBSERVACAO1: TStringField;
    Transportadora1Logradouro: TStringField;
    Transportadora1Situacao: TStringField;
    Transportadora1TRN_FAX: TStringField;
    Transportadora1TRN_SITE: TStringField;
    Transportadora1TRN_EMAIL: TStringField;
    Parametro2: TParametro;
    Transportadora1USU_CODIGO: TIntegerField;
    Transportadora1TRN_DT_ALTERADO: TDateTimeField;
    Transportadora1TRN_DT_CADASTRO: TDateTimeField;
    Label18: TLabel;
    mskDataCadastro: TMaskEdit;
    Label21: TLabel;
    dblCodigoCCX: TDBLookupComboBox;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    Transportadora1CCX_CODIGO: TIntegerField;
    bitConfirmar: TBitBtn;
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
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure Transportadora1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edtRZSocialExit(Sender: TObject);
    procedure Transportadora1CalcFields(DataSet: TDataSet);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bitConfirmarClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure Sair1Execute(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TTransportadora;
    CancelarCEP:Boolean;
  end;

var
  fCadTran: TfCadTran;

implementation

Uses UDM,funcoes, MxLocalizaCEP, CdConhecimento;

{$R *.DFM}

procedure TfCadTran.AtualizaControles(Habilitar: Boolean);
begin
  Incluir1.Enabled:=not Habilitar;
  Alterar1.Enabled:=not Habilitar;
  Excluir1.Enabled:=not Habilitar;
  Localizar1.Enabled:=not Habilitar;
  Salvar1.Enabled:=Habilitar;
  Cancelar1.Enabled:=Habilitar;
  SB_Prim.Enabled:=not Habilitar;
  SB_Ant.Enabled:=not Habilitar;
  SB_Prox.Enabled:=not Habilitar;
  SB_Ult.Enabled:=not Habilitar;
  SB_Novo.Enabled:=not Habilitar;
  SB_Loc.Enabled:=not Habilitar;
  SB_Alt.Enabled:=not Habilitar;
  SB_Exc.Enabled:=not Habilitar;
  SB_Salva.Enabled:=Habilitar;
  SB_Canc.Enabled:=Habilitar;
  Edit11.Enabled:=not Habilitar;
  ComboBox2.Enabled:=not Habilitar;
  DBGrid5.Enabled:=not Habilitar;
  
  if Habilitar then
  begin
    Edit11.Color:=AlteraCorComponentes;
    ComboBox2.Color:=AlteraCorComponentes;
  end
  else
  begin
    Edit11.Color:=clWindow;
    ComboBox2.Color:=clWindow;
  end;
end;

procedure TfCadTran.SB_PrimClick(Sender: TObject);
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

procedure TfCadTran.SB_AntClick(Sender: TObject);
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

procedure TfCadTran.SB_ProxClick(Sender: TObject);
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

procedure TfCadTran.SB_UltClick(Sender: TObject);
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


procedure TfCadTran.SB_NovoClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(220)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtRZSocial.SetFocus;
end;

procedure TfCadTran.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(240)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtRZSocial.SetFocus;
end;

procedure TfCadTran.SB_SalvaClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadTran.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadTran.SB_LocClick(Sender: TObject);
begin
  If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Selecionar;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;  
end;

procedure TfCadTran.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');    
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(230)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');


  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TRN_CODIGO FROM NOTA_FISCAL '+
      ' WHERE TRN_CODIGO='+IntToStr(Entidade.CodigoTRN);
    Open;
    if not IsEmpty then
      Raise Exception.Create('Esta transportadora foi usada em uma Nota Fiscal!');

    Close;
    SQL.Text := 'SELECT TRN_CODIGO FROM PEDIDO_DE_COMPRA '+
      ' WHERE TRN_CODIGO='+IntToStr(Entidade.CodigoTRN);
    Open;
    if not IsEmpty then
      Raise Exception.Create('Esta transportadora foi usada em um Pedido de Compra!');

    Close;
    SQL.Text := 'SELECT TRN_CODIGO FROM TITULO_A_PAGAR '+
      ' WHERE TRN_CODIGO='+IntToStr(Entidade.CodigoTRN);
    Open;
    if not IsEmpty then
      Raise Exception.Create('Exite título(s) a pagar (ou pagos) para essa Transportadora!');
  end;

  Entidade.deletarauto;
end;

procedure TfCadTran.FormCreate(Sender: TObject);
begin
  Entidade:=Transportadora1;
  Conta_de_Caixa1.Open;  
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_CAD_TRN_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;


procedure TfCadTran.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfCadTran.Transportadora1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadTran.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_CAD_TRN_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Active:=false;
  Parametro1.Active:=False;
  Action:=Cafree;
end;



procedure TfCadTran.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadTran.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Active:=True;
  Parametro1.Active:=True;
  ComboBox2.ItemIndex:=1;
  Edit11.SetFocus;
  if tag = 0 then
    bitConfirmar.Visible := False;
end;

procedure TfCadTran.edtRZSocialExit(Sender: TObject);
begin
  if (edtFantasia.Text = '') and (edtRZSocial.Text <> '') then
    edtFantasia.text := edtRZSocial.Text;
end;

procedure TfCadTran.Transportadora1CalcFields(DataSet: TDataSet);
begin
  if Entidade.Logradouro > 0 then
  Begin
    Parametro2.Close;
    Parametro2.ParamByName('PAR_CODIGO').asInteger:=Entidade.Logradouro;
    Parametro2.Open;
    Entidade.FieldByName('Logradouro').asString:=Parametro2.Descricao;
  end
  else
    Entidade.FieldByName('Logradouro').asString:='';
  case Entidade.Situacao of
    0: Entidade.FieldByName('Situacao').asString:='Ativo';
    1: Entidade.FieldByName('Situacao').asString:='Inativo';
  end;
end;

procedure TfCadTran.edtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=chr(32)) and (edtEndereco.Text = '') then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxLocalizaCEP, fMxLocalizaCEP);
    fMxLocalizaCEP.tag:=4;
    fMxLocalizaCEP.ShowModal;
    if not CancelarCEP then
    Begin
      edtEndereco.Text:=edtEndereco.Text+', ';
    end;
  end;
end;

procedure TfCadTran.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
  Begin
    if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end
  else if key=#13 then
  Begin
    if SB_Salva.Enabled then
    Begin
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
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

procedure TfCadTran.bitConfirmarClick(Sender: TObject);
begin
  if tag=1 then //CadConhecimento
  Begin
    fCadConhecimento.edtCodigoTRN.Text   := IntTostr(Entidade.CodigoTRN);
    fCadConhecimento.edtRazaoSocial.Text := Entidade.RazaoSocial;
    fCadConhecimento.mskCNPJ.Text        := Entidade.CPFCGC;
    fCadConhecimento.edtUF.Text          := Entidade.Uf;
  end;
  Close;
end;

procedure TfCadTran.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfCadTran.Sair1Execute(Sender: TObject);
begin
  close;
end;

end.
