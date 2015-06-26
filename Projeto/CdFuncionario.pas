unit CdFuncionario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Funcionario, DBCtrls, Parametro, Secao, Menus, CentroCusto, Usuario,
  ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadFunc = class(TForm)
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
    mskNascimento: TMaskEdit;
    Label1: TLabel;
    edtNome: TEdit;
    edtCodigoFUN: TEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    mskCep: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    mskTelefone: TMaskEdit;
    Label15: TLabel;
    cmbUF: TComboBox;
    edtBairro: TEdit;
    Label16: TLabel;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    cmbSituacao: TComboBox;
    DSFuncionario1: TDataSource;
    dblLogradouro: TDBLookupComboBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    dblFuncao: TDBLookupComboBox;
    edtIdentidade: TEdit;
    mskCPF: TMaskEdit;
    Label6: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    dblSecao: TDBLookupComboBox;
    Secao1: TSecao;
    DSSecao1: TDataSource;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    Funcionario1: TFuncionario;
    CentroCusto1: TCentroCusto;
    Label30: TLabel;
    Bevel2: TBevel;
    Image1: TImage;
    Parametro3: TParametro;
    Funcionario1FUN_CODIGO: TIntegerField;
    Funcionario1CNC_CODIGO: TIntegerField;
    Funcionario1FUN_NOME: TStringField;
    Funcionario1SEC_CODIGO: TIntegerField;
    Funcionario1FUN_FUNCAO: TIntegerField;
    Funcionario1FUN_DT_NASC: TDateTimeField;
    Funcionario1FUN_LOGRADOURO: TIntegerField;
    Funcionario1FUN_ENDERECO: TStringField;
    Funcionario1FUN_BAIRRO: TStringField;
    Funcionario1FUN_CIDADE: TStringField;
    Funcionario1FUN_UF: TStringField;
    Funcionario1FUN_CEP: TStringField;
    Funcionario1FUN_FONE: TStringField;
    Funcionario1FUN_SITUACAO: TIntegerField;
    Funcionario1FUN_CPF: TStringField;
    Funcionario1FUN_RG: TStringField;
    Funcionario1FUN_COTA: TFloatField;
    Funcionario1FUN_PERC_ABAIXO: TFloatField;
    Funcionario1FUN_PERC_ACIMA: TFloatField;
    Funcionario1FUN_ULT_EMPR: TStringField;
    Funcionario1FUN_REFERENCIA: TStringField;
    Funcionario1FUN_ROTA: TIntegerField;
    Funcionario1FUN_OBSERVACAO1: TStringField;
    Funcionario1USU_CODIGO: TIntegerField;
    Funcionario1FUN_DT_ALTERADO: TDateTimeField;
    Funcionario1Logradouro: TStringField;
    Funcionario1Funcao: TStringField;
    Funcionario1Situacao: TStringField;
    edtApelido: TEdit;
    Label14: TLabel;
    Funcionario1FUN_APELIDO: TStringField;
    Label17: TLabel;
    Label21: TLabel;
    edtUltimoEmprego: TEdit;
    edtReferencias: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtCota: TEdit;
    edtComissao: TEdit;
    edtComissaoEsp: TEdit;
    Funcionario1Usuario: TStringField;
    Funcionario1FUN_EMAIL: TStringField;
    edtOBS: TEdit;
    mskCelular: TMaskEdit;
    Label25: TLabel;
    Funcionario1FUN_CELULAR: TStringField;
    dblUsuarioVinculado: TDBLookupComboBox;
    Usuario2: TUsuario;
    DSUsuario2: TDataSource;
    Funcionario1FUN_USU_CODIGO: TIntegerField;
    SB_Equipe: TSpeedButton;
    Panel2: TPanel;
    Label44: TLabel;
    dblCentroDeCusto: TDBLookupComboBox;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    Funcionario1FUN_DT_CADASTRO: TDateTimeField;
    Label11: TLabel;
    Label26: TLabel;
    edtSuperior: TEdit;
    edtSuperiorNome: TEdit;
    Label27: TLabel;
    edtParceiro: TEdit;
    edtParceiroNome: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Funcionario1FUN_SUPERIOR: TIntegerField;
    Funcionario1FUN_PARCEIRO: TIntegerField;
    Funcionario1Superior: TStringField;
    Funcionario1Parceiro: TStringField;
    Funcionario2: TFuncionario;
    ckbTodosCentros: TCheckBox;
    Funcionario1FUN_TODOS_CENTROS: TIntegerField;
    ckbApareceVendas: TCheckBox;
    ckbApareceServicos: TCheckBox;
    Funcionario1FUN_APARECE_SERVICOS: TIntegerField;
    Funcionario1FUN_APARECE_VENDAS: TIntegerField;
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
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Funcionario1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Funcionario1BeforeOpen(DataSet: TDataSet);
    procedure Image1DblClick(Sender: TObject);
    procedure Funcionario1CalcFields(DataSet: TDataSet);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_EquipeClick(Sender: TObject);
    procedure dblCentroDeCustoClick(Sender: TObject);
    procedure edtSuperiorExit(Sender: TObject);
    procedure edtParceiroExit(Sender: TObject);
    procedure dblFuncaoClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TFuncionario;
    CancelarCEP:Boolean;
  end;

var
  fCadFunc: TfCadFunc;

implementation
Uses UDM,funcoes, MxFotoAmpliada, MxLocalizaCEP, MxEquipe, MxSFuncionario;
{$R *.DFM}

procedure TfCadFunc.AtualizaControles(Habilitar: Boolean);
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
  edtLocalizar.Enabled:=not Habilitar;
  cmbCampo.Enabled:=not Habilitar;
  DBGrid5.Enabled:=not Habilitar;

  if Habilitar then
  begin
    edtLocalizar.Color:=AlteraCorComponentes;
    cmbCampo.Color:=AlteraCorComponentes;
  end
  else
  begin
    edtLocalizar.Color:=clWindow;
    cmbCampo.Color:=clWindow;
  end;
end;

procedure TfCadFunc.SB_PrimClick(Sender: TObject);
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

procedure TfCadFunc.SB_AntClick(Sender: TObject);
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

procedure TfCadFunc.SB_ProxClick(Sender: TObject);
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

procedure TfCadFunc.SB_UltClick(Sender: TObject);
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



procedure TfCadFunc.SB_NovoClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
    
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(180)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  if (not DM.Configuracao1.CPD) and
     (not (DM.Configuracao1.Empresa IN [empHOPE])) then
    Raise exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  AtualizaControles(True);
  edtNome.SetFocus;
end;

procedure TfCadFunc.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(200)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) and
     (not (DM.Configuracao1.Empresa IN [empHOPE])) then
    Raise exception.Create('Somente no CPD!');    
  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtNome.SetFocus;
end;

procedure TfCadFunc.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(190)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) and
     (not (DM.Configuracao1.Empresa IN [empHOPE])) then
    Raise exception.Create('Somente no CPD!');

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE FUN_CODIGO='+IntToStr(Entidade.CodigoFUN);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existe(m) pedido(s) de venda com esse vendedor(a)! '+FieldByName('PDV_CODIGO').asString);
  end;

  Entidade.Deletarauto;

  if Entidade.IsEmpty then
  Begin
    edtSuperiorNome.Clear;
    edtParceiro.Clear;
  end;
end;

procedure TfCadFunc.SB_SalvaClick(Sender: TObject);
var
  CdFUN, iFuncao : integer;
begin
  CdFUN := Entidade.CodigoFUN;
  iFuncao := dblFuncao.KeyValue;
  If Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(False);
    if iFuncao <> 56 then
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM EQUIPE_GERENCIA '+
        ' WHERE FUN_CODIGO='+IntToStr(CdFUN));
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadFunc.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);

  if Entidade.IsEmpty then
  Begin
    edtSuperiorNome.Clear;
    edtParceiro.Clear;
  end;
end;

procedure TfCadFunc.FormCreate(Sender: TObject);
begin
  Entidade := Funcionario1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_CAD_FUN_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Usuario2.Open;
end;

procedure TfCadFunc.SB_LocClick(Sender: TObject);
begin
  If (cmbCampo.ItemIndex=0) and (edtLocalizar.Text<>'*') then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;


procedure TfCadFunc.Funcionario1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtSuperiorNome.Text := Entidade.FieldByName('Superior').asString;
  edtParceiroNome.Text := Entidade.FieldByName('Parceiro').asString;
end;

procedure TfCadFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_CAD_FUN_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Parametro1.Close;
  Parametro2.Close;
  CentroCusto1.Close;
  Secao1.Close;
  Action:=Cafree;
end;




procedure TfCadFunc.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfCadFunc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadFunc.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Parametro1.Open;
  Parametro2.Open;
  CentroCusto2.Open;
  dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
  Secao1.Open;
  Entidade.Open;
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadFunc.Funcionario1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').AsInteger := dblCentroDeCusto.KeyValue;
end;

procedure TfCadFunc.Image1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=Image1.Picture;
  fMxFotoAmpliada.ShowModal;
end;

procedure TfCadFunc.Funcionario1CalcFields(DataSet: TDataSet);
begin
  with Parametro3 do
  Begin
    if Entidade.Logradouro > 0 then
    Begin
      if (not Active) or
         (CodigoPAR <> Entidade.Logradouro) then
      Begin
        Close;
        ParamByName('PAR_CODIGO').asInteger := Entidade.Logradouro;
        Open;
      end;
      Entidade.FieldByName('Logradouro').asString := Descricao;
    end
    else
      Entidade.FieldByName('Logradouro').asString:='';

    if Entidade.Funcao > 0 then
    Begin
      if (not Active) or
         (CodigoPAR <> Entidade.Funcao) then
      Begin
        Close;
        ParamByName('PAR_CODIGO').asInteger := Entidade.Funcao;
        Open;
      end;
      Entidade.FieldByName('Funcao').asString := Descricao;
    end
    else
      Entidade.FieldByName('Funcao').asString:='';
  end;

  case Entidade.Situacao of
    0: Entidade.FieldByName('Situacao').asString := 'Ativado';
    1: Entidade.FieldByName('Situacao').asString := 'Desativado';
  end;

  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);

  with Funcionario2 do
  Begin
    if Entidade.Superior > 0 then
    Begin
      if (not Active) or
         (CodigoFUN <> Entidade.Superior) then
      Begin
        Close;
        ParamByName('FUN_CODIGO').asInteger := Entidade.Superior;
        Open;
      end;
      Entidade.FieldByName('Superior').asString := Apelido;
    end
    else
      Entidade.FieldByName('Superior').asString := '';

    if Entidade.Parceiro > 0 then
    Begin
      if (not Active) or
         (CodigoFUN <> Entidade.Parceiro) then
      Begin
        Close;
        ParamByName('FUN_CODIGO').asInteger := Entidade.Parceiro;
        Open;
      end;
      Entidade.FieldByName('Parceiro').asString := Apelido;
    end
    else
      Entidade.FieldByName('Parceiro').asString := '';
  end;
end;

procedure TfCadFunc.edtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=chr(32)) and (edtEndereco.Text = '') then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxLocalizaCEP, fMxLocalizaCEP);
    fMxLocalizaCEP.tag:=5;
    fMxLocalizaCEP.ShowModal;
    if not CancelarCEP then
    Begin
      edtEndereco.Text:=edtEndereco.Text+', ';
    end;
  end;
end;

procedure TfCadFunc.FormKeyPress(Sender: TObject; var Key: Char);
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
    end;
  end
  else if Key = #32 then
  Begin
    if edtSuperior.Focused then
    Begin
      key := #0;
      edtSuperior.Clear;
      Application.CreateForm(TfMxSFuncionario, fMxSFuncionario);
      with fMxSFuncionario do
      Begin
        tag := 2;
        Funcionario1.Close;
        Funcionario1.SQL.Text:='SELECT CNC_CODIGO,FUN_CODIGO,FUN_NOME,FUN_APELIDO '+
          ' FROM FUNCIONARIO '+
          ' WHERE (FUN_SITUACAO=0 OR FUN_SITUACAO IS NULL) '+
          ' AND (CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          '  OR  FUN_TODOS_CENTROS=1) '+
          ' ORDER BY FUN_APELIDO ';
        Funcionario1.Open;
        ShowModal;
      end;
    end
    else if edtParceiro.Focused then
    Begin
      key := #0;
      edtParceiro.Clear;
      Application.CreateForm(TfMxSFuncionario, fMxSFuncionario);
      with fMxSFuncionario do
      Begin
        tag := 3;
        Funcionario1.Close;
        Funcionario1.SQL.Text:='SELECT CNC_CODIGO,FUN_CODIGO,FUN_NOME,FUN_APELIDO '+
          ' FROM FUNCIONARIO '+
          ' WHERE (FUN_SITUACAO=0 OR FUN_SITUACAO IS NULL) '+
          ' AND (CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          '  OR  FUN_TODOS_CENTROS=1) '+          
          ' ORDER BY FUN_APELIDO ';
        Funcionario1.Open;
        ShowModal;
      end;
    end;
  end;
end;

procedure TfCadFunc.SB_EquipeClick(Sender: TObject);
begin
  if (edtCodigoFUN.Text = '0') or (edtCodigoFUN.Text = '') or
     (dblFuncao.KeyValue <> 56) then //Gerente
  Begin
    ShowMessage('Somente para Gerentes!');
    Exit;
  end;

  Application.CreateForm(TfMxEquipe, fMxEquipe);
  with fMxEquipe do
  Begin
    Tag:=0;
    edtCodigoFUN.Text := self.edtCodigoFUN.Text;
    ShowModal;
  end;
end;

procedure TfCadFunc.dblCentroDeCustoClick(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadFunc.edtSuperiorExit(Sender: TObject);
begin
  if SB_Canc.Focused then
    Exit;

  if edtSuperior.Enabled then
  Begin
    edtSuperiorNome.Clear;
    if edtSuperior.Text = '0' then
      Exit;
    with Funcionario2 do
    Begin
      if not VerificaInteiroBranco(edtSuperior.Text) then
      Begin
        ShowMessage('Superior inválido!');
        edtSuperior.Text := '0';
        edtSuperior.SetFocus;
        Exit;
      end;
      if (not Active) or
         (CodigoFUN <> StrToInt(edtSuperior.Text)) then
      Begin
        Close;
        ParamByName('FUN_CODIGO').asInteger := StrToInt(edtSuperior.Text);
        Open;
      end;
      if IsEmpty then
      Begin
        ShowMessage('Superior não encontrado!');
        edtSuperior.Text := '0';
        edtSuperior.SetFocus;
        Exit;
      end;
      edtSuperiorNome.Text := Apelido;
    end;
  end;
end;

procedure TfCadFunc.edtParceiroExit(Sender: TObject);
begin
  if SB_Canc.Focused then
    Exit;

  if edtParceiro.Enabled then
  Begin
    edtParceiroNome.Clear;
    if edtParceiro.Text = '0' then
      Exit;
    with Funcionario2 do
    Begin
      if not VerificaInteiroBranco(edtParceiro.Text) then
      Begin
        ShowMessage('Parceiro inválido!');
        edtParceiro.Text := '0';
        edtParceiro.SetFocus;
        Exit;
      end;
      if (not Active) or
         (CodigoFUN <> StrToInt(edtParceiro.Text)) then
      Begin
        Close;
        ParamByName('FUN_CODIGO').asInteger := StrToInt(edtParceiro.Text);
        Open;
      end;
      if IsEmpty then
      Begin
        ShowMessage('Parceiro não encontrado!');
        edtParceiro.Text := '0';
        Exit;
      end;
      edtParceiroNome.Text := Apelido;
    end;
  end;
end;

procedure TfCadFunc.dblFuncaoClick(Sender: TObject);
begin
  if SB_Salva.Enabled then
  Begin
    if (Entidade.Estado = 1) then //Inserir
    Begin
      if (dblFuncao.KeyValue = 45) or
         (dblFuncao.KeyValue = 56) or
         (dblFuncao.KeyValue = 58) then
      Begin
        ckbApareceVendas.Checked := True;
        ckbApareceServicos.Checked := True;
      end
      else
      Begin
        ckbApareceVendas.Checked := False;
        ckbApareceServicos.Checked := False;
      end;
    end;
  end;
end;

end.
