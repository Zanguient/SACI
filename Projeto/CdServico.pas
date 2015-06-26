unit CdServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, ExtCtrls, Db, DBTables,
  SQuery, Produto, SubGrupo, Grupo, Menus, Item_Pedido_Venda, JPEG,
  Parametro, Item_de_Estoque;

type
  vetorBaseReal = array[1..2] of string;
  TfCadServico = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoPRD: TEdit;
    dblGrupo: TDBLookupComboBox;
    edtProduto: TEdit;
    edtUnidade: TEdit;
    edtPrecoCusto: TEdit;
    edtPrecoMinimo: TEdit;
    edtPrecoVenda: TEdit;
    Panel14: TPanel;
    DBGrid5: TDBGrid;
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
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    labPrecoCusto: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Produto1: TProduto;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    DSProduto1: TDataSource;
    DSGrupo1: TDataSource;
    DSSubgrupo1: TDataSource;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label21: TLabel;
    edtReferencia: TEdit;
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
    cmbSituacao: TComboBox;
    Label22: TLabel;
    Produto1PRD_CODIGO: TIntegerField;
    Produto1CNC_CODIGO: TIntegerField;
    Produto1SGP_CODIGO: TIntegerField;
    Produto1GRP_CODIGO: TIntegerField;
    Produto1PRD_DESCRICAO: TStringField;
    Produto1PRD_UNIDADE: TStringField;
    Produto1PRD_REFERENCIA: TStringField;
    Produto1PRD_DT_ULT_COMPRA: TDateTimeField;
    Produto1PRD_CUSTO: TFloatField;
    Produto1PRD_PRECO_MEDIO: TFloatField;
    Produto1PRD_PRECO_VENDA: TFloatField;
    Produto1USU_CODIGO: TIntegerField;
    Produto1PRD_DT_ALTERADO: TDateTimeField;
    Produto1PRD_SITUACAO: TIntegerField;
    Produto1PRD_LOCAL: TStringField;
    Produto1PRD_DETALHE: TStringField;
    edtDetalhe: TEdit;
    Label24: TLabel;
    Bevel1: TBevel;
    Label17: TLabel;
    Image1: TImage;
    Label25: TLabel;
    edtCaracteristicas: TEdit;
    Label26: TLabel;
    edtObservacao: TEdit;
    Produto1PRD_DT_CADASTRO: TDateTimeField;
    Produto1PRD_CARACTERISTICA: TStringField;
    Produto1PRD_OBSERVACAO: TStringField;
    Produto1PRD_PESO_LIQUIDO: TFloatField;
    ckbForaPrevisao: TCheckBox;
    ckbForaTabela: TCheckBox;
    Produto1PRD_FORA_TABELA: TIntegerField;
    Produto1PRD_FORA_PREVISAO: TIntegerField;
    Panel3: TPanel;
    SB_Fechar: TBitBtn;
    SB_Imprimir: TSpeedButton;
    Produto1PRD_INSUMO: TIntegerField;
    dblSubGrupo: TDBLookupComboBox;
    Produto1PRD_BASE_REAL: TFloatField;
    Produto1PRD_SERVICO: TIntegerField;
    Produto1PRD_TEMPO_MEDIO: TIntegerField;
    Produto1PRD_NIVEL: TIntegerField;
    Label14: TLabel;
    Label5: TLabel;
    edtTempoMedio: TEdit;
    edtNivel: TEdit;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Produto1FOR_CODIGO: TIntegerField;
    Produto1CTP_CODIGO: TIntegerField;
    Produto1CLF_CODIGO: TIntegerField;
    Produto1ORF_CODIGO: TIntegerField;
    Produto1PRD_MARCA: TStringField;
    Produto1PRD_PRECO_COMPRA: TFloatField;
    Produto1PRD_EST_MINIMO: TFloatField;
    Produto1PRD_EST_MEDIO: TFloatField;
    Produto1PRD_COMISSAO: TFloatField;
    Label4: TLabel;
    edtPrevisao: TEdit;
    Produto1PRD_FORA_DE_LINHA: TIntegerField;
    Produto1PRD_CATALOGO: TIntegerField;
    Produto1PRD_PREVISAO: TIntegerField;
    Produto1PRD_CLASSIFICACAO: TIntegerField;
    Label10: TLabel;
    dblClassificacao: TDBLookupComboBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Produto1PRD_ESTOQUE_DETALHADO: TIntegerField;
    Item_de_Estoque1: TItem_de_Estoque;
    edtNCM: TEdit;
    Label8: TLabel;
    ckbForaDeLinha: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Produto1AfterScroll(DataSet: TDataSet);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure Grupo1AfterScroll(DataSet: TDataSet);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TProduto;
end;

var
  fCadServico: TfCadServico;

implementation

uses UDM, funcoes, MxFotoAmpliada, UProduto, MxSPediProd;

{$R *.DFM}

procedure TfCadServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_CadSER_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  SubGrupo1.Close;
  Grupo1.Active:=false;
  Action:=Cafree;
end;

procedure TfCadServico.FormCreate(Sender: TObject);
begin
  Entidade:=Produto1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_CadSER_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Parametro1.Open;
end;

procedure TfCadServico.Produto1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadServico.SB_PrimClick(Sender: TObject);
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

procedure TfCadServico.SB_AntClick(Sender: TObject);
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

procedure TfCadServico.SB_ProxClick(Sender: TObject);
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

procedure TfCadServico.SB_UltClick(Sender: TObject);
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

procedure TfCadServico.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(480)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Produto!');

  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  edtProduto.SetFocus;
end;

procedure TfCadServico.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(470)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Produto!');

  with Item_Pedido_Venda1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
    Open;
    if not IsEmpty then
      Raise exception.Create('Existem pedidos de venda com esse produto!');
  end;

  Entidade.Deletarauto;

  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadServico.SB_SalvaCabClick(Sender: TObject);
var
  CdPRD: integer;
  mensagem:string;
begin
  edtNCM.text := '0';
  mensagem:='';
  if mensagem <> '' then
    Raise Exception.Create(mensagem);

  CdPRD := StrToInt(edtCodigoPRD.Text);

  if Entidade.FinalizaEdicao(True) then
  Begin
    AtualizaControles(1,False);
    with Entidade do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD);
      Open;
    end;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadServico.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);

  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadServico.SB_LocCabClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  Aux := Entidade.AfterScroll;
  Entidade.AfterScroll := nil;
  if edtLocalizar.Text <> '*' then
  Begin
    If cmbCampo.ItemIndex=0 then
      if not VerificaInteiroBranco(edtLocalizar.Text) then
      Begin
        Entidade.AfterScroll := Aux;
        raise Exception.create('Código a ser localizado inválido!');
      end;
    Entidade.Selecionar;
  end
  else
  Begin
    with Entidade do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM PRODUTO '+
        ' WHERE PRD_SERVICO=1 '+
        ' ORDER BY PRD_DESCRICAO ';
      Open;
    end;
  end;
  Entidade.AfterScroll := Aux;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos
  else
    Entidade.CarregaDados;
end;

procedure TfCadServico.SB_NovoCabClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(460)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir Produto!');

  Entidade.PreparaInsercao(True);
  AtualizaControles(1,True);
  edtProduto.SetFocus;
end;

procedure TfCadServico.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfCadServico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadServico.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  Grupo1.Open;
  SubGrupo1.Open;
  Entidade.Open;
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    cmbCampo.ItemIndex := 0
  else
    cmbCampo.ItemIndex := 1;
    
  if tag = 1 then //Localiza Produto
  Begin
    cmbCampo.ItemIndex := 0;
    edtLocalizar.Text := IntToStr(fMxSPedProd.Entidade.CodigoPRD);
    SB_LocCabClick(sender);
  end
  else
    edtLocalizar.SetFocus;
end;

procedure TfCadServico.Image1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=Image1.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Produto: '+Entidade.Descricao+' '+
    Entidade.Unidade+' '+Entidade.Referencia+' '+Entidade.Detalhe+' '+
    Entidade.Marca);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Local Estoque: '+Entidade.Local);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Características: '+Entidade.Caracteristica);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Entidade.Obs);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfCadServico.FormKeyPress(Sender: TObject; var Key: Char);
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
  else if Key=chr(13) then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end
  else if ((edtPrecoCusto.Focused)or(edtPrecoMinimo.Focused)or
           (edtPrecoVenda.Focused))and
           (Key = '.') then
    Key := ','
  else if (key = '"') then
    Key:=#0;
end;

procedure TfCadServico.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadServico.SB_ImprimirClick(Sender: TObject);
begin
  Application.CreateForm(Trpt_produto,rpt_produto);
  with rpt_produto do
  Begin
    tag := 6;
    Entidade.Close;
    Entidade.SQL.Text := self.Entidade.SQL.Text;
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfCadServico.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
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

  SB_Imprimir.Enabled      := not Habilitar;
  SB_Fechar.Enabled        := not Habilitar;

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

procedure TfCadServico.Grupo1AfterScroll(DataSet: TDataSet);
begin
  with SubGrupo1 do
  Begin
    Close;
    ParamByName('GRP_CODIGO').asInteger := Grupo1.CodigoGRP;
    Open;
    if dblSubGrupo.Enabled then
      dblSubGrupo.KeyValue := CodigoSGP;
  end;
end;

end.
