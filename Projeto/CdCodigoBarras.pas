unit CdCodigoBarras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Menus, JPEG, Cod_Barr, Produto, Usuario;

type
  TfCadCodigoBarras = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    edtCodigoCDB: TEdit;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label15: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    Incluir1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    mskDataCadastro: TMaskEdit;
    Label6: TLabel;
    cmbSituacao: TComboBox;
    Label12: TLabel;
    edtCodigoCDB_Barras: TEdit;
    Label5: TLabel;
    edtTipo: TEdit;
    Codigo_Barras1: TCodigo_Barras;
    edtUsuario: TEdit;
    Label8: TLabel;
    DSCodigoBarras: TDataSource;
    Produto1: TProduto;
    edtOBS: TEdit;
    Panel3: TPanel;
    SB_Imprimir: TSpeedButton;
    SB_Fechar: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edtDescricao: TEdit;
    edtCodigoCDB_Entrada: TEdit;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Codigo_Barras1AfterScroll(DataSet: TDataSet);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure Codigo_Barras1BeforeOpen(DataSet: TDataSet);
    procedure edtCodigoCDB_BarrasKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TCodigo_Barras;
  end;

var
  fCadCodigoBarras: TfCadCodigoBarras;

implementation

Uses UDM,funcoes, MxSPediProd, UCodigoBarras, MxSPediProdMotCal;

{$R *.DFM}

procedure TfCadCodigoBarras.SB_PrimClick(Sender: TObject);
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

procedure TfCadCodigoBarras.SB_AntClick(Sender: TObject);
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

procedure TfCadCodigoBarras.SB_ProxClick(Sender: TObject);
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

procedure TfCadCodigoBarras.SB_UltClick(Sender: TObject);
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

procedure TfCadCodigoBarras.AtualizaControles(Habilitar:Boolean);
begin
  Incluir1.Enabled:=not habilitar;
  Excluir1.Enabled:=not habilitar;
  Localizar1.Enabled:=not habilitar;
  Salvar1.Enabled:=habilitar;
  Cancelar1.Enabled:=habilitar;
  SB_Prim.Enabled:=not habilitar;
  SB_Ant.Enabled:=not habilitar;
  SB_Prox.Enabled:=not habilitar;
  SB_Ult.Enabled:=not habilitar;
  SB_Novo.Enabled:=not habilitar;
  SB_Loc.Enabled:=not habilitar;
  SB_Exc.Enabled:=not habilitar;
  SB_Salva.Enabled:=habilitar;
  SB_Canc.Enabled:=habilitar;

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

procedure TfCadCodigoBarras.SB_NovoClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
//  If DM.Usuario1.Permissoes.IndexOf(IntToStr(500)) < 0 then
//    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtLocalizar.Color:=AlteraCorComponentes;
  cmbCampo.Color:=AlteraCorComponentes;
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtCodigoCDB_Barras.SetFocus;
end;

procedure TfCadCodigoBarras.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
//  If DM.Usuario1.Permissoes.IndexOf(IntToStr(510)) < 0 then
 //   Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.Deletarauto;
  if Entidade.IsEmpty then
    edtUsuario.Clear;
end;

procedure TfCadCodigoBarras.SB_SalvaClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(False);
    if (tag = 0) and
       (DM.Configuracao1.Empresa = empHope) then
      SB_FecharClick(sender);
  end
  else
    ShowMessage('As alterações não foram salvas!')
end;

procedure TfCadCodigoBarras.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadCodigoBarras.FormCreate(Sender: TObject);
begin
  Entidade:=Codigo_Barras1;
end;

procedure TfCadCodigoBarras.SB_LocClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  if not Entidade.Active then
    Entidade.Open;
  Entidade.Localizar;
end;

procedure TfCadCodigoBarras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadCodigoBarras.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfCadCodigoBarras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadCodigoBarras.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbCampo.ItemIndex := 1;

  Entidade.Open;
  if (Entidade.IsEmpty) then
    SB_NovoClick(sender)
  else
    edtLocalizar.SetFocus;
end;

procedure TfCadCodigoBarras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=chr(27)) and (SB_Canc.Enabled) then
  Begin
    key:=chr(0);
    SB_CancClick(sender);
  end
  else if key=chr(27) then
  Begin
    key:=chr(0);
    Close;
  end
  else if (key=chr(13)) and (SB_Salva.Enabled) then
  Begin
    key:=chr(0);
    SB_SalvaClick(sender);
  end
  else if (edtCodigoCDB_Entrada.Focused) and (key=chr(32)) then
  Begin
    key:=chr(0);
    edtCodigoCDB_Entrada.Clear;
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        tag := 40;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        tag := 40;
        ShowModal;
      end;
    end;
  end;
end;

procedure TfCadCodigoBarras.Codigo_Barras1AfterScroll(DataSet: TDataSet);
begin
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtUsuario.Clear;
  end
  else
  Begin
    Entidade.CarregaDados;
    edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
  end;
end;

procedure TfCadCodigoBarras.SB_FecharClick(Sender: TObject);
begin
  close;
end;

procedure TfCadCodigoBarras.SB_ImprimirClick(Sender: TObject);
begin
  Application.CreateForm(Trpt_CodigoBarras, rpt_CodigoBarras);
  with rpt_CodigoBarras do
  begin
    Tag
     := 1;
    with entidade do
    begin
      Close;
      sql.Text:='SELECT * FROM CODIGO_DE_BARRAS '+
        ' WHERE CDB_CODIGO_ENTRADA='+edtCodigoCDB_Entrada.Text+
        ' ORDER BY CDB_CODIGO_ENTRADA ';
      Open;
    end;
    report.Preview;
    Close;
  end;
end;

procedure TfCadCodigoBarras.Codigo_Barras1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CDB_CODIGO_ENTRADA').asInteger := StrToInt(edtCodigoCDB_Entrada.Text);
  except
  end;
end;

procedure TfCadCodigoBarras.edtCodigoCDB_BarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (DM.Configuracao1.Empresa = empHOPE) and
     (Length(edtCodigoCDB_Barras.Text) >= 13) then
  Begin
    Key := #0;
    ShowMessage('Tamanho máximo do código de barras!');
  end;
end;

end.
