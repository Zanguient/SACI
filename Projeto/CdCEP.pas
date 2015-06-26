unit CdCEP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Usuario, Menus, CentroCusto, CEP, Parametro;

type
  TfCadCEP = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    Label6: TLabel;
    DSCEP1: TDataSource;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Usuario1: TUsuario;
    Label3: TLabel;
    Label32: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label12: TLabel;
    ComboBox3: TComboBox;
    MaskEdit3: TMaskEdit;
    Label8: TLabel;
    Edit3: TEdit;
    Edit5: TEdit;
    Label4: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    Edit8: TEdit;
    Label5: TLabel;
    CEP1: TCEP;
    CEP1Usuario: TStringField;
    CEP1Situacao: TStringField;
    CEP1CEP_CODIGO: TIntegerField;
    CEP1USU_CODIGO: TIntegerField;
    CEP1CEP_DT_CADASTRO: TDateTimeField;
    CEP1CEP_DT_ALTERADO: TDateTimeField;
    CEP1CEP_CEP: TStringField;
    CEP1CEP_ENDERECO: TStringField;
    CEP1CEP_BAIRRO: TStringField;
    CEP1CEP_BAIRRO2: TStringField;
    CEP1CEP_SITUACAO: TIntegerField;
    CEP1CEP_OBSERVACAO: TStringField;
    CEP1CEP_CIDADE: TStringField;
    CEP1CEP_UF: TStringField;
    SB_Localiza: TSpeedButton;
    LocalizarAvanada1: TMenuItem;
    CEP1CNC_CODIGO: TIntegerField;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    CEP1CEP_LOGRADOURO: TIntegerField;
    CEP1CEP_COMPLEMENTO: TStringField;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Label11: TLabel;
    Edit2: TEdit;
    CEP1Logradouro: TStringField;
    Parametro3: TParametro;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CEP1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_LocalizaClick(Sender: TObject);
    procedure CEP1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TCEP;
  end;

var
  fCadCEP: TfCadCEP;

implementation
Uses UDM,funcoes, MxLocalizaCEP;
{$R *.DFM}



procedure TfCadCEP.SB_PrimClick(Sender: TObject);
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

procedure TfCadCEP.SB_AntClick(Sender: TObject);
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

procedure TfCadCEP.SB_ProxClick(Sender: TObject);
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

procedure TfCadCEP.SB_UltClick(Sender: TObject);
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

procedure TfCadCEP.SB_NovoClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');  
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4010)) < 0 then
    Raise Exception.Create('Usuário não tem permissão!');

  Entidade.PreparaInsercao;
  Incluir1.Enabled:=False;
  Alterar1.Enabled:=False;
  Excluir1.Enabled:=False;
  Localizar1.Enabled:=False;
  LocalizarAvanada1.Enabled:=False;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Localiza.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit11.Enabled:=False;
  ComboBox2.Enabled:=False;
  MaskEdit3.SetFocus;
end;

procedure TfCadCEP.SB_AltClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4010)) < 0 then
    Raise Exception.Create('Usuário não tem permissão!');
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');

  Entidade.PreparaAlteracao;
  Incluir1.Enabled:=False;
  Alterar1.Enabled:=False;
  Excluir1.Enabled:=False;
  Localizar1.Enabled:=False;
  LocalizarAvanada1.Enabled:=False;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Localiza.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit11.Enabled:=False;
  ComboBox2.Enabled:=False;
  MaskEdit3.SetFocus;
end;

procedure TfCadCEP.SB_ExcClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4010)) < 0 then
    Raise Exception.Create('Usuário não tem permissão!');
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  Entidade.deletarauto;    
end;                            

procedure TfCadCEP.SB_SalvaClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
  Begin
    Incluir1.Enabled:=true;
    Alterar1.Enabled:=true;
    Excluir1.Enabled:=true;
    Localizar1.Enabled:=true;
    LocalizarAvanada1.Enabled:=True;
    Salvar1.Enabled:=false;
    Cancelar1.Enabled:=false;
    SB_Prim.Enabled:=True;
    SB_Ant.Enabled:=True;
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
    SB_Novo.Enabled:=True;
    SB_Loc.Enabled:=True;
    SB_Localiza.Enabled:=True;    
    SB_Alt.Enabled:=True;
    SB_Exc.Enabled:=True;
    SB_Salva.Enabled:=False;
    SB_Canc.Enabled:=False;
    Edit11.Enabled:=True;
    Edit11.Color:=clWindow;
    ComboBox2.Enabled:=True;
    ComboBox2.Color:=clWindow;
  end
  else
  Begin
    ShowMessage('As alterações não foram salvas!');
    MaskEdit3.SetFocus;
  end;
end;

procedure TfCadCEP.SB_CancClick(Sender: TObject);
begin
  Incluir1.Enabled:=true;
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Localizar1.Enabled:=true;
  LocalizarAvanada1.Enabled:=True;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Localiza.Enabled:=True;  
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  Entidade.CancelaEdicao;
  if Entidade.IsEmpty then
  Begin
    Edit1.Clear;
    ComboBox3.ItemIndex:=-1;
  end;
end;


procedure TfCadCEP.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfCadCEP.SB_LocClick(Sender: TObject);
begin
 If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');
 Entidade.Localizar;
end;


procedure TfCadCEP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Usuario1.Close;
  Action:=Cafree;
end;

procedure TfCadCEP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled=true then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadCEP.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(fCadCEP);
  Parametro1.Open;
  Entidade:=CEP1;
  Entidade.Active:=true;
  ComboBox2.ItemIndex:=1;
  Edit11.SetFocus;
end;

procedure TfCadCEP.CEP1CalcFields(DataSet: TDataSet);
begin
  Usuario1.Close;
  Usuario1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Usuario1.ParamByName('USU_CODIGO').asInteger:=Entidade.CodigoUSU;
  Usuario1.Open;
  Entidade.FieldByName('Usuario').asString:=Usuario1.NomeUSU;
  case Entidade.Situacao of
    0: Entidade.FieldByName('Situacao').asString:='Ativada';
    1: Entidade.FieldByName('Situacao').asString:='Desativada';
  end;
  if Entidade.Logradouro > 0 then
  Begin
    Parametro3.Close;
    Parametro3.ParamByName('PAR_CODIGO').asInteger:=Entidade.Logradouro;
    Parametro3.Open;
    Entidade.FieldByName('Logradouro').asString:=Parametro3.Descricao;
  end
  else
    Entidade.FieldByName('Logradouro').asString:='';
end;

procedure TfCadCEP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  Begin
    if SB_Salva.Enabled then
      SB_SalvaClick(sender);
  end
  else if (Key = #27) and (not SB_Salva.Enabled) then
    Close
  else if (Key = #27) then
    SB_CancClick(sender);
end;

procedure TfCadCEP.SB_LocalizaClick(Sender: TObject);
begin
  Application.CreateForm(TfMxLocalizaCEP, fMxLocalizaCEP);
  fMxLocalizaCEP.tag:=0;
  fMxLocalizaCEP.ShowModal;
end;

procedure TfCadCEP.CEP1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

end.
