unit CdReposicaoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Grupo, Menus, JPEG, SubGrupo, CentroCusto, DBCtrls,
  Reposica;

type
  TfCadReposicaoFornecedor = class(TForm)
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
    edtDescricao: TEdit;
    edtCodigoREP: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    DSReposicao1: TDataSource;
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
    Panel2: TPanel;
    Label44: TLabel;
    dblCentroDeCusto: TDBLookupComboBox;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigoFOR: TEdit;
    edtFornecedor: TEdit;
    Reposicao1: TReposicao;
    Reposicao1CNC_ORIGEM: TIntegerField;
    Reposicao1CNC_CODIGO: TIntegerField;
    Reposicao1REP_CODIGO: TIntegerField;
    Reposicao1USU_CODIGO: TIntegerField;
    Reposicao1FOR_CODIGO: TIntegerField;
    Reposicao1PRD_CODIGO: TIntegerField;
    Reposicao1REP_DESCRICAO: TStringField;
    Reposicao1REP_DT_CADASTRO: TDateTimeField;
    Reposicao1REP_DT_ALTERADO: TDateTimeField;
    Reposicao1REP_SITUACAO: TIntegerField;
    Reposicao1REP_OBSERVACAO: TStringField;
    Reposicao1Fornecedor: TStringField;
    Reposicao1Produto: TStringField;
    SB_Liberar: TSpeedButton;
    ckbSomentePendentes: TCheckBox;
    Imprimir1: TMenuItem;
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
    procedure dblCentroDeCustoClick(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure Reposicao1AfterScroll(DataSet: TDataSet);
    procedure Reposicao1BeforeOpen(DataSet: TDataSet);
    procedure Reposicao1CalcFields(DataSet: TDataSet);
    procedure SB_LiberarClick(Sender: TObject);
    procedure ckbSomentePendentesClick(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TReposicao;
  end;

var
  fCadReposicaoFornecedor: TfCadReposicaoFornecedor;

implementation

Uses UDM,funcoes, MxSPediProdMotCal, MxSPediProd, MxSCotaFor,
  UReposicaoFornecedor, UReposicaoGrafico;
  
{$R *.DFM}

procedure TfCadReposicaoFornecedor.SB_PrimClick(Sender: TObject);
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

procedure TfCadReposicaoFornecedor.SB_AntClick(Sender: TObject);
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

procedure TfCadReposicaoFornecedor.SB_ProxClick(Sender: TObject);
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

procedure TfCadReposicaoFornecedor.SB_UltClick(Sender: TObject);
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

procedure TfCadReposicaoFornecedor.AtualizaControles(Habilitar:Boolean);
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

  ckbSomentePendentes.Enabled:=not habilitar;
  SB_Liberar.Enabled:=not habilitar;

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

procedure TfCadReposicaoFornecedor.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8630)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
    
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtCodigoFOR.SetFocus;
end;

procedure TfCadReposicaoFornecedor.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  if Entidade.CNCOrigem <> DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8640)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');

  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtDescricao.SetFocus;
end;

procedure TfCadReposicaoFornecedor.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  if Entidade.CNCOrigem <> DM.Configuracao1.CodigoCNC then
    Raise exception.Create('Centro de Custo inválido!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8650)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');

  Entidade.Deletar(Entidade.CodigoCNC, Entidade.CodigoREP);
  if Entidade.IsEmpty then
  Begin
    edtFornecedor.Clear;
    edtProduto.Clear;
  end;
end;

procedure TfCadReposicaoFornecedor.SB_SalvaCabClick(Sender: TObject);
begin
  If not Entidade.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');
    
  AtualizaControles(False);
end;

procedure TfCadReposicaoFornecedor.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
  Begin
    edtFornecedor.Clear;
    edtProduto.Clear;
  end;  
end;

procedure TfCadReposicaoFornecedor.FormCreate(Sender: TObject);
begin
  Entidade := Reposicao1;
  CentroCusto2.Open;
end;

procedure TfCadReposicaoFornecedor.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadReposicaoFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfCadReposicaoFornecedor.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadReposicaoFornecedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadReposicaoFornecedor.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
  dblCentroDeCustoClick(sender);

  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadReposicaoFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancCab.Enabled then
    Begin
      Key := #0;
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
      Key := #0;
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfCadReposicaoFornecedor.dblCentroDeCustoClick(Sender: TObject);
begin
  Entidade.Close;
  if ckbSomentePendentes.Checked then
    Entidade.Selecao.Text := ' AND CNC_CODIGO=:CNC_CODIGO '+
                             ' AND REP_SITUACAO=0 '
  else
    Entidade.Selecao.Text := ' AND CNC_CODIGO=:CNC_CODIGO ';

  Entidade.SQL.Text := 'SELECT * FROM REPOSICAO '+
                       ' WHERE REP_CODIGO>0 '+
                       Entidade.Selecao.Text;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtFornecedor.Clear;
    edtProduto.Clear;
  end;
end;

procedure TfCadReposicaoFornecedor.edtCodigoPRDExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtProduto.Clear;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
  Begin
    edtCodigoPRD.Text := '0';
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoPRD.Text := '0';
      edtCodigoPRD.SetFocus;
      Raise exception.Create('Produto inválido!');
    end
    else if StrToInt(edtCodigoFOR.Text) <> FieldByName('FOR_CODIGO').AsInteger then
    Begin
      edtCodigoPRD.Text := '0';
      edtCodigoPRD.SetFocus;
      Raise exception.Create('Produto não está vinculado a esse fornecedor!');
    end;
    edtProduto.Text := Trim(FieldByName('PRD_DESCRICAO').asString+' '+FieldByName('PRD_CARACTERISTICA').asString);
  end;
end;

procedure TfCadReposicaoFornecedor.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=68;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=68;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfCadReposicaoFornecedor.edtCodigoFORExit(Sender: TObject);
begin
  If SB_CancCab.Focused then
    Exit;

  edtFornecedor.Clear;
  if not VerificaInteiroBranco(edtCodigoFOR.Text) then
  Begin
    edtCodigoFOR.SetFocus;
    Raise exception.Create('Código do Fornecedor inválido!');
  end;

  with DM.Fornecedor1 do
  Begin
    Close;
    ParamByName('FOR_CODIGO').asInteger:=StrToInt(edtCodigoFOR.Text);
    Open;
    If IsEmpty then
    Begin
      edtCodigoFOR.setFocus;
      ShowMessage('Fornecedor inválido!');
    End
    else
      edtFornecedor.Text := RazaoSocial;
  end;
end;

procedure TfCadReposicaoFornecedor.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=40;
    fMxSCotaFor.ShowModal;
    if edtCodigoFOR.Text <> '' then
    Begin
      edtCodigoPRD.Enabled:=True;
      edtCodigoPRD.SetFocus;
    end;
  end;
end;

procedure TfCadReposicaoFornecedor.Reposicao1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtFornecedor.Text := Entidade.FieldByName('Fornecedor').asString;
  edtProduto.Text    := Entidade.FieldByName('Produto').asString;  
end;

procedure TfCadReposicaoFornecedor.Reposicao1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger := dblCentroDeCusto.KeyValue;
  except
  end;
end;

procedure TfCadReposicaoFornecedor.Reposicao1CalcFields(DataSet: TDataSet);
begin
  with DM.Fornecedor1 do
  Begin
    if (not Active) or
       (Entidade.CodigoFOR <> CodigoFOR) then
    Begin
      Close;
      ParamByName('FOR_CODIGO').AsInteger := Entidade.CodigoFOR;
      Open;
    end;
    Entidade.FieldByName('Fornecedor').asString := RazaoSocial;
  end;

  with DM.Produto1 do
  Begin
    if (not Active) or
       (Entidade.CodigoPRD <> CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').AsInteger := Entidade.CodigoPRD;
      Open;
    end;
    Entidade.FieldByName('Produto').asString := Trim(Descricao+' '+Caracteristica);
  end;
end;

procedure TfCadReposicaoFornecedor.SB_LiberarClick(Sender: TObject);
var
  CdCNC, CdREP: integer;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');

  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  if Entidade.CNCOrigem <> DM.Configuracao1.CodigoCNC then
    Raise exception.Create('Centro de Custo inválido!');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8660)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para receber Reposição Fornecedor!');

  CdCNC := Entidade.CodigoCNC;
  CdREP := Entidade.CodigoREP;
  ExecutaSQL(DM.QR_Comandos, 'UPDATE REPOSICAO SET '+
    ' REP_SITUACAO=2 '+
    ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
    ' AND REP_CODIGO='+IntToStr(CdREP));

  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtFornecedor.Clear;
    edtProduto.Clear;
  end;
end;

procedure TfCadReposicaoFornecedor.ckbSomentePendentesClick(
  Sender: TObject);
begin
  dblCentroDeCustoClick(sender);
end;

procedure TfCadReposicaoFornecedor.Imprimir1Click(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');

  //Imprimir Comprovante
  if DM.Configuracao1.Empresa = empEletro then
  Begin
    Application.CreateForm(Trpt_ReposicaoGrafico, rpt_ReposicaoGrafico);
    with rpt_ReposicaoGrafico do
    Begin
      Tag := 0;
      Entidade.CLose;
      Entidade.ParamByName('CNC_ORIGEM').asInteger := self.Entidade.CNCOrigem;
      Entidade.ParamByName('CNC_CODIGO').asInteger := self.Entidade.CodigoCNC;
      Entidade.ParamByName('REP_CODIGO').asInteger := self.Entidade.CodigoREP;
      Entidade.Open;
      report.Preview;
      Close;
    end;
  end
  else
  Begin
    Application.CreateForm(Trpt_ReposicaoFornecedor, rpt_ReposicaoFornecedor);
    with rpt_ReposicaoFornecedor do
    Begin
      Tag := 0;
      Entidade.CLose;
      Entidade.ParamByName('CNC_ORIGEM').asInteger := self.Entidade.CNCOrigem;
      Entidade.ParamByName('CNC_CODIGO').asInteger := self.Entidade.CodigoCNC;
      Entidade.ParamByName('REP_CODIGO').asInteger := self.Entidade.CodigoREP;
      Entidade.Open;
      report.Preview;
      Close;
    end;
  end;
end;

end.
