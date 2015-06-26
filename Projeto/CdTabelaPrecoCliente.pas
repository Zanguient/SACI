unit CdTabelaPrecoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, DBCtrls, Parametro, Indexador_Economico, Menus, Usuario,
  Tabela_de_Preco_Cliente, Cliente;

type
  TfCadTabelaPrecoCliente = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoTBC: TEdit;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    edtRazaoSocial: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mskDataCadastro: TMaskEdit;
    edtCodigoCLI: TEdit;
    DSabela_de_Preco_Cliente1: TDataSource;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Clientes1: TMenuItem;
    IncluirCab: TMenuItem;
    ExcluirCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Label8: TLabel;
    edtUsuario: TEdit;
    Tabela_de_Preco_Cliente1: TTabela_de_Preco_Cliente;
    edtClienteCNC: TEdit;
    Label6: TLabel;
    edtCodigoTBP: TEdit;
    Label7: TLabel;
    edtDescricaoTabela: TEdit;
    edtTabelaCNC: TEdit;
    Cliente1: TCliente;
    Tabela_de_Preco_Cliente1CNC_CODIGO: TIntegerField;
    Tabela_de_Preco_Cliente1TBC_CODIGO: TIntegerField;
    Tabela_de_Preco_Cliente1USU_CODIGO: TIntegerField;
    Tabela_de_Preco_Cliente1TBC_DT_CADASTRO: TDateTimeField;
    Tabela_de_Preco_Cliente1CNC_TABELA: TIntegerField;
    Tabela_de_Preco_Cliente1TBP_CODIGO: TIntegerField;
    Tabela_de_Preco_Cliente1CNC_CLIENTE: TIntegerField;
    Tabela_de_Preco_Cliente1CLI_CODIGO: TIntegerField;
    Tabela_de_Preco_Cliente1Cliente: TStringField;
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure Fornecedor1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Tabela_de_Preco_Cliente1AfterScroll(DataSet: TDataSet);
    procedure Tabela_de_Preco_Cliente1BeforeOpen(DataSet: TDataSet);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure Tabela_de_Preco_Cliente1CalcFields(DataSet: TDataSet);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TTabela_de_Preco_Cliente;
  end;

var
  fCadTabelaPrecoCliente: TfCadTabelaPrecoCliente;

implementation
Uses UDM,funcoes,CdCLiente;
{$R *.DFM}

procedure TfCadTabelaPrecoCliente.SB_NovoCabClick(Sender: TObject);
begin                                                                                   
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(420)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  edtRazaoSocial.Clear;
  AtualizaControles(1, True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtCodigoCLI.SetFocus;
end;

procedure TfCadTabelaPrecoCliente.SB_ExcCabClick(Sender: TObject);
var
  CdCNC, CdTBC, CdTBPCNC, CdTBP, CdCLICNC, CdCLI: integer;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6910)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar tabela promocional!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');

  CdCNC := Entidade.CodigoCNC;
  CdTBC := Entidade.CodigoTBC;
  CdTBPCNC := Entidade.TabelaCNC;
  CdTBP    := Entidade.CodigoTBP;
  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;

  Entidade.Deletarauto;

  Entidade.GeraLog(6910,CdTBPCNC,CdTBP,'Excluir Cliente '+
    ' CLI:'+PreencheZero(2,CdCLICNC)+'-'+IntToStr(CdCLI)+
    ' TBC:'+PreencheZero(2,CdCNC)+'-'+IntToStr(CdTBC));

  if Entidade.IsEmpty then
  Begin
    edtUsuario.Clear;
    edtRazaoSocial.Clear;
  end;
end;

procedure TfCadTabelaPrecoCliente.SB_SalvaCabClick(Sender: TObject);
var
  CdCNC, CdTBC, CdCNCCLI, CdCLI: integer;
begin
  try
    CdCNC := DM.Configuracao1.CodigoCNC;
    CdTBC := StrToInt(edtCodigoTBC.Text);
    CdCNCCLI := StrToInt(edtCLienteCNC.Text);
    CdCLI    := StrToInt(edtCodigoCLI.Text);
  except
    CdCNC := -1;
    CdTBC := -1;
    CdCNCCLI := -1;
    CdCLI    := -1;
  end;
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(1, False);
    Entidade.GeraLog(6910, StrToInt(edtTabelaCNC.Text), StrToInt(edtCodigoTBP.Text),
      'Incluir Cliente '+
      ' CLI:'+PreencheZero(2,CdCNCCLI)+'-'+IntToStr(CdCLI)+
      ' TBC:'+PreencheZero(2,CdCNC)+'-'+IntToStr(CdTBC));
  end;
end;

procedure TfCadTabelaPrecoCliente.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
  if Entidade.IsEmpty then
  Begin
    edtUsuario.Clear;
    edtRazaoSocial.Clear;
  end;
end;

procedure TfCadTabelaPrecoCliente.FormCreate(Sender: TObject);
begin
  Entidade := Tabela_de_Preco_Cliente1;
end;

procedure TfCadTabelaPrecoCliente.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;


procedure TfCadTabelaPrecoCliente.Fornecedor1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadTabelaPrecoCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=false;
  Action:=Cafree;
end;

procedure TfCadTabelaPrecoCliente.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfCadTabelaPrecoCliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadTabelaPrecoCliente.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Open;
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfCadTabelaPrecoCliente.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarCab.Enabled  := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
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

procedure TfCadTabelaPrecoCliente.FormKeyPress(Sender: TObject; var Key: Char);
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
  end
  else if Key = '.' then
    Key := ',';
end;

procedure TfCadTabelaPrecoCliente.Tabela_de_Preco_Cliente1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtRazaoSocial.Text := Entidade.FieldByName('Cliente').asString;
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfCadTabelaPrecoCliente.Tabela_de_Preco_Cliente1BeforeOpen(
  DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_TABELA').asInteger := StrToInt(edtTabelaCNC.Text);
  Entidade.ParamByName('TBP_CODIGO').asInteger := StrToInt(edtCodigoTBP.Text);  
end;

procedure TfCadTabelaPrecoCliente.edtCodigoCLIExit(Sender: TObject);
begin
  if (SB_CancCab.Focused) then
    Exit;

  edtRazaoSocial.Clear;

  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
  Begin
    edtCodigoCLI.SetFocus;
    Raise Exception.Create('Código de Cliente inválido!');
  end;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
    ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtClienteCNC.Text);
    Open;
    edtRazaoSocial.Text := RazaoSocial;
  end;
end;

procedure TfCadTabelaPrecoCliente.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=42;
    fCadCli.CentroCusto2.open;
    fCadCli.CentroCusto2.LocalizarCod(StrToInt(edtClienteCNC.Text));
    fCadCli.dblCentroDeCusto.KeyValue:=StrToInt(edtClienteCNC.Text);
    With fCadCli.Cliente1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM CLIENTE WHERE CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
        ' AND CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC);
      Open;
    End;
    fCadCli.Showmodal;
    if VerificaInteiroBranco(edtCodigoCLI.Text) then
      edtCodigoCLIExit(sender);
  End
  else if Key = chr(13) then
  Begin
    SelectNext(ActiveControl,true,true);
    Key := #0;
  end;
end;

procedure TfCadTabelaPrecoCliente.Tabela_de_Preco_Cliente1CalcFields(
  DataSet: TDataSet);
begin
  with Cliente1 do                 
  Begin
    if (not Active) or
       (Entidade.ClienteCNC <> CodigoCNC) or
       (Entidade.CodigoCLI <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    Entidade.FieldByName('Cliente').asString := RazaoSocial;
  end;
end;

end.
