unit MxTabPrecoSubGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Transportadora, DBCtrls, Parametro, Solicitacao_de_Garantia,
  Tabela_de_Precos, Item_Tabela_de_Precos, Menus, CentroCusto,
  Item_Pedido_Venda, Produto, Tabela_de_Precos_SubGrupo, SubGrupo, Grupo,
  Item_Tabela_de_Precos_SubGrupo, Usuario, Cliente, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfMxTabPrecoSubGrupo = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoTPS: TEdit;
    Label13: TLabel;
    mskValidade: TMaskEdit;
    Label4: TLabel;
    edtDescricao: TEdit;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Panel2: TPanel;
    DSItem_Tabela_de_Precos_SubGrupo1: TDataSource;
    dblCodigoCNC: TDBLookupComboBox;
    Label3: TLabel;
    Ds_CentroCusto: TDataSource;
    CentroCusto1: TCentroCusto;
    Panel3: TPanel;
    DSTabela_de_Precos_SubGrupo1: TDataSource;
    SB_AlterarPrecos: TSpeedButton;
    CentroCusto2: TCentroCusto;
    Label9: TLabel;
    edtDescontoSimples: TEdit;
    Label11: TLabel;
    edtDescontoEspecial: TEdit;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    SB_Imprimir: TSpeedButton;
    Tabela_de_Precos_SubGrupo1: TTabela_de_Precos_SubGrupo;
    Tabela_de_Precos_SubGrupo1TPS_CODIGO: TIntegerField;
    Tabela_de_Precos_SubGrupo1CNC_CODIGO: TIntegerField;
    Tabela_de_Precos_SubGrupo1CNC_CLIENTE: TIntegerField;
    Tabela_de_Precos_SubGrupo1CLI_CODIGO: TIntegerField;
    Tabela_de_Precos_SubGrupo1USU_CODIGO: TIntegerField;
    Tabela_de_Precos_SubGrupo1TPS_DESCRICAO: TStringField;
    Tabela_de_Precos_SubGrupo1TPS_DT_CADASTRO: TDateTimeField;
    Tabela_de_Precos_SubGrupo1TPS_DT_ALTERADO: TDateTimeField;
    Tabela_de_Precos_SubGrupo1TPS_DT_VALIDADE: TDateTimeField;
    Tabela_de_Precos_SubGrupo1TPS_LABORATORIO: TIntegerField;
    Tabela_de_Precos_SubGrupo1TPS_DESCONTO_SIMPLES: TFloatField;
    Tabela_de_Precos_SubGrupo1TPS_DESCONTO_ESPECIAL: TFloatField;
    Tabela_de_Precos_SubGrupo1TPS_DESCONTO_SIMPLES_PRAZO: TFloatField;
    Tabela_de_Precos_SubGrupo1TPS_DESCONTO_ESPECIAL_PRAZO: TFloatField;
    Tabela_de_Precos_SubGrupo1TPS_SITUACAO: TIntegerField;
    Tabela_de_Precos_SubGrupo1TPS_OBSERVACAO: TStringField;
    Tabela_de_Precos_SubGrupo1Centro: TStringField;
    DBGrid5: TDBGrid;
    Grupo1: TGrupo;
    DSGrupo1: TDataSource;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    Label18: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label17: TLabel;
    edtPreco: TEdit;
    dblGrupo: TDBLookupComboBox;
    dblSubGrupo: TDBLookupComboBox;
    edtPrecoOriginal: TEdit;
    Label14: TLabel;
    SB_NovoItem: TSpeedButton;
    SB_ExcItem: TSpeedButton;
    SB_SalvaItem: TBitBtn;
    SB_CancItem: TBitBtn;
    ckbLaboratorio: TCheckBox;
    Label6: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    Label7: TLabel;
    edtUsuario: TEdit;
    edtQuantidadeMinima: TEdit;
    Item_Tabela_de_Precos_SubGrupo1: TItem_Tabela_de_Precos_SubGrupo;
    edtBonificacao: TEdit;
    Item_Tabela_de_Precos_SubGrupo1ITS_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1CNC_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1TPS_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1USU_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1ITS_DT_CADASTRO: TDateTimeField;
    Item_Tabela_de_Precos_SubGrupo1ITS_DT_ALTERADO: TDateTimeField;
    Item_Tabela_de_Precos_SubGrupo1ITS_PRECO_ORIGINAL: TFloatField;
    Item_Tabela_de_Precos_SubGrupo1ITS_PRECO_VENDA: TFloatField;
    Item_Tabela_de_Precos_SubGrupo1ITS_BONIFICACAO: TFloatField;
    Item_Tabela_de_Precos_SubGrupo1ITS_QUANTIDADE_MINIMA: TFloatField;
    Item_Tabela_de_Precos_SubGrupo1ITS_SITUACAO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1ITS_OBSERVACAO: TStringField;
    Item_Tabela_de_Precos_SubGrupo1Grupo: TStringField;
    Item_Tabela_de_Precos_SubGrupo1SubGrupo: TStringField;
    Grupo2: TGrupo;
    SubGrupo2: TSubGrupo;
    edtCodigoCLI: TEdit;
    edtClienteCNC: TEdit;
    Produto1: TProduto;
    Item_Tabela_de_Precos_SubGrupo1GRP_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1SGP_CODIGO: TIntegerField;
    Tabela_de_Precos_SubGrupo1TPS_PRINCIPAL: TIntegerField;
    ckbPrincipal: TCheckBox;
    Label8: TLabel;
    Cliente1: TCliente;
    SB_CopiarItens: TSpeedButton;
    Item_Tabela_de_Precos_SubGrupo2: TItem_Tabela_de_Precos_SubGrupo;
    SB_LocPed: TSpeedButton;
    SB_DefinirCLientes: TSpeedButton;
    Label10: TLabel;
    Label12: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    Item_Tabela_de_Precos_SubGrupo1PRD_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1Produto: TStringField;
    Produto2: TProduto;
    Label15: TLabel;
    Label16: TLabel;
    edtDescontoSimplesPrazo: TEdit;
    edtDescontoEspecialPrazo: TEdit;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    SairCab: TAction;
    IncluirItem: TAction;
    ExcluirItem: TAction;
    SalvarItem: TAction;
    CancelarItem: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SB_AlterarPrecosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure Tabela_de_Precos_SubGrupo1AfterScroll(DataSet: TDataSet);
    procedure Item_Tabela_de_Precos_SubGrupo1BeforeOpen(DataSet: TDataSet);
    procedure Item_Tabela_de_Precos_SubGrupo1CalcFields(DataSet: TDataSet);
    procedure SB_NovoItemClick(Sender: TObject);
    procedure SB_ExcItemClick(Sender: TObject);
    procedure SB_SalvaItemClick(Sender: TObject);
    procedure SB_CancItemClick(Sender: TObject);
    procedure dblSubGrupoClick(Sender: TObject);
    procedure dblGrupoClick(Sender: TObject);
    procedure SubGrupo1BeforeOpen(DataSet: TDataSet);
    procedure Item_Tabela_de_Precos_SubGrupo1AfterScroll(
      DataSet: TDataSet);
    procedure Item_Tabela_de_Precos_SubGrupo1AfterOpen(DataSet: TDataSet);
    procedure ckbLaboratorioClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure SB_CopiarItensClick(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure SB_DefinirCLientesClick(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
  public
    cancelarloc: Boolean;
    Entidade:TTabela_de_Precos_SubGrupo;
  end;

var
  fMxTabPrecoSubGrupo: TfMxTabPrecoSubGrupo;

implementation

Uses UDM, Funcoes, CdCliente, MxS_Tpreco, UMxAjustePreco, UTabelaPreco, UTabelaPrecoSubGrupo,
  MxLocalizaTabelaPrecoSGP, CdTabelaPrecoCliente, MxSPediProdMotCal,
  MxSPediProd;

{$R *.DFM}

procedure TfMxTabPrecoSubGrupo.SB_NovoCabClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6910)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir Tabela Promocional!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  Item_Tabela_de_Precos_SubGrupo1.Close;
  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  try
    edtDescricao.SetFocus;
  except
    edtCodigoCLI.SetFocus;
  end;
end;

procedure TfMxTabPrecoSubGrupo.SB_AltCabClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6910)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir Tabela Promocional!');
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TBP_CODIGO '+
      ' FROM TABELA_DE_PRECO_CLIENTE '+
      ' WHERE CNC_TABELA='+IntToStr(Entidade.CodigoCNC)+
      ' AND TBP_CODIGO='+IntToStr(Entidade.CodigoTPS);
    Open;
    if not IsEmpty then
      edtCodigoCLI.Enabled := False;
  end;
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  if edtDescricao.Enabled then
    edtDescricao.SetFocus
  else if edtCodigoCLI.Enabled then
    edtCodigoCLI.SetFocus
  else
    mskValidade.SetFocus;
end;

procedure TfMxTabPrecoSubGrupo.SB_SalvaCabClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
    AtualizaControles(1,False)
  else
    ShowMessage('Os dados não foram salvos!');
  if not Item_Tabela_de_Precos_SubGrupo1.Active then
    Item_Tabela_de_Precos_SubGrupo1.Open;
end;

procedure TfMxTabPrecoSubGrupo.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
  if not Item_Tabela_de_Precos_SubGrupo1.Active then
    Item_Tabela_de_Precos_SubGrupo1.Open;
end;

procedure TfMxTabPrecoSubGrupo.SB_ExcCabClick(Sender: TObject);
var
  CdCNC, CdTPS: integer;
  Trans: Boolean;
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6930)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Tabela Promocional!');
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem deletados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');

  CdCNC := Entidade.CodigoCNC;
  CdTPS := Entidade.CodigoTPS;

  // Verificar se a Tabela já foi utilizada em alguma venda
  with DM.QR_Consultas do
  Begin
    Close;
    if CdCNC = 0 then
      SQL.Text := 'SELECT PDV_CODIGO AS PEDIDO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE TBP_CODIGO='+IntToStr(CdTPS)
    else
      SQL.Text := 'SELECT PDV_CODIGO AS PEDIDO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE TBP_CODIGO='+IntToStr(CdTPS)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC);
    Open;
    if not DM.QR_Consultas.IsEmpty then
      Raise exception.Create('Essa Tabela não pode ser apagada!'+#13+
                             'Já foi usada em um Pedido de Venda. ('+FieldByName('PEDIDO').asString+')');
    Close;
  end;

  Trans:=false;
  with DM.Database2 do
  Begin
    try
      StartTransaction;
      Trans:=True;

      if not Entidade.Deletar(CdCNC, CdTPS) then
        Raise exception.Create('');

      ExecutaSQL(DM.QR_Comandos, 'DELETE FROM ITEM_DE_TABELA_DE_PRECO_SUBGRUPO '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TPS_CODIGO='+IntToStr(CdTPS));

      Commit;
      Trans := False;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  End;
end;

procedure TfMxTabPrecoSubGrupo.FormCreate(Sender: TObject);
begin
  Entidade:=Tabela_de_Precos_SubGrupo1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_TabPrecoSGP_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxTabPrecoSubGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_TabPrecoSGP_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  CentroCusto1.Close;
  Item_Tabela_de_Precos_SubGrupo1.Close;
  Grupo1.Close;
  SubGrupo1.Close;
  Action:=Cafree;
end;

procedure TfMxTabPrecoSubGrupo.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxTabPrecoSubGrupo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxTabPrecoSubGrupo.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto1.Open;
  Grupo1.Open;
  SubGrupo1.Open;
  Entidade.Open;
end;

procedure TfMxTabPrecoSubGrupo.SB_AlterarPrecosClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione a Tabela primeiro!');
  if Item_Tabela_de_Precos_SubGrupo1.IsEmpty then
    Raise Exception.Create('Tabela sem itens!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');    
  Application.CreateForm(TfMxAjustePreco,fMxAjustePreco);
  with fMxAjustePreco do
  Begin
    tag:=2;
    ShowModal;
  end;
  Item_Tabela_de_Precos_SubGrupo1.Close;
  Item_Tabela_de_Precos_SubGrupo1.Open;
end;

procedure TfMxTabPrecoSubGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancItem.Enabled then
    Begin
      SB_CancItem.SetFocus;
      SB_CancItemClick(sender);
    end
    else if SB_SalvaCab.Enabled then
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
    end
    else if SB_SalvaItem.Enabled then
    Begin
      SB_SalvaItem.SetFocus;
      SB_SalvaItemClick(sender);
    end;
  end;
end;

procedure TfMxTabPrecoSubGrupo.SB_ImprimirClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
  Begin
    ShowMessage('Selecione a Tabela de Preço!');
    Exit;
  end;
  Application.CreateForm(Trpt_TabelaPrecoSubGrupo,rpt_TabelaPrecoSubGrupo);
  with rpt_TabelaPrecoSubGrupo do
  Begin
    labCodigoTBP.Caption        := edtCodigoTPS.Text;
    labDescricao.Caption        := edtDescricao.Text;
    labCodigoCNC.Caption        := IntToStr(dblCodigoCNC.KeyValue);
    labValidade.Caption         := mskValidade.Text;
    labDescontoSimples.Caption  := edtDescontoSimples.Text;
    labDescontoEspecial.Caption := edtDescontoEspecial.Text;
    Entidade.Close;
    Entidade.ParamByName('TPS_CODIGO').AsInteger := STrToInt(edtCodigoTPS.Text);
    Entidade.Active := true;
    if Entidade.IsEmpty then
    Begin
      ShowMessage('Tabela sem Itens!');
      Exit;
    end;
    report.Preview;
    Close;
  end;
end;

procedure TfMxTabPrecoSubGrupo.Tabela_de_Precos_SubGrupo1AfterScroll(
  DataSet: TDataSet);
begin
  Item_Tabela_de_Precos_SubGrupo1.Close;
  Item_Tabela_de_Precos_SubGrupo1.Open;
  Entidade.CarregaDados;
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxTabPrecoSubGrupo.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  SairCab.Enabled       := not Habilitar;
  IncluirCab.Enabled    := not Habilitar;
  LocalizarCab.Enabled  := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocPed.Enabled     := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_ExcCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);

  //Item
  IncluirItem.Enabled    := not Habilitar;
  ExcluirItem.Enabled    := not Habilitar;
  SalvarItem.Enabled     := ((Cabecalho=0) and Habilitar);
  CancelarItem.Enabled   := ((Cabecalho=0) and Habilitar);
  SB_NovoItem.Enabled    := not Habilitar;
  SB_ExcItem.Enabled     := not Habilitar;
  SB_SalvaItem.Enabled   := ((Cabecalho=0) and Habilitar);
  SB_CancItem.Enabled    := ((Cabecalho=0) and Habilitar);

  SB_AlterarPrecos.Enabled    := not Habilitar;
  SB_Imprimir.Enabled      := not Habilitar;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1BeforeOpen(
  DataSet: TDataSet);
begin
  Item_Tabela_de_Precos_SubGrupo1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CodigoCNC;
  Item_Tabela_de_Precos_SubGrupo1.ParamByName('TPS_CODIGO').AsInteger := Entidade.CodigoTPS;  
end;

procedure TfMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1CalcFields(
  DataSet: TDataSet);
begin
  with Grupo2 do
  Begin
    if CodigoGRP <> Item_Tabela_de_Precos_SubGrupo1.CodigoGRP then
    Begin
      Close;
      ParamByName('GRP_CODIGO').asInteger := Item_Tabela_de_Precos_SubGrupo1.CodigoGRP;
      Open;
    end;
    Item_Tabela_de_Precos_SubGrupo1.FieldByName('Grupo').asString := Descricao;
  end;

  with SubGrupo2 do
  Begin
    if CodigoSGP <> Item_Tabela_de_Precos_SubGrupo1.CodigoSGP then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Item_Tabela_de_Precos_SubGrupo1.CodigoSGP;
      Open;
    end;
    Item_Tabela_de_Precos_SubGrupo1.FieldByName('SubGrupo').asString := Descricao;
  end;

  with Produto2 do
  Begin
    if CodigoPRD <> Item_Tabela_de_Precos_SubGrupo1.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Item_Tabela_de_Precos_SubGrupo1.CodigoPRD;
      Open;
    end;
    Item_Tabela_de_Precos_SubGrupo1.FieldByName('Produto').asString := Descricao;
  end;
end;

procedure TfMxTabPrecoSubGrupo.SB_NovoItemClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione a Tabela!');
  Item_Tabela_de_Precos_SubGrupo1.PreparaInsercao;
  AtualizaControles(0,True);
  if dblGrupo.Text = '' then
    dblGrupo.SetFocus
  else
    dblSubGrupo.SetFocus;
end;

procedure TfMxTabPrecoSubGrupo.SB_ExcItemClick(Sender: TObject);
begin
  If Item_Tabela_de_Precos_SubGrupo1.IsEmpty then
    Raise Exception.Create('Não existe registro para sere deletado!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  // Verificar se a Tabela já foi utilizada em alguma venda
  Item_Pedido_Venda1.Close;
  if Entidade.CodigoCNC = 0 then
    DM.QR_Consultas.SQL.Text := 'SELECT TPB_CODIGO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE TBP_CODIGO='+IntToStr(Entidade.CodigoTPS)+
      ' AND PRD_CODIGO IN '+
      ' (SELECT PRD_CODIGO FROM PRODUTO '+
      ' WHERE SGP_CODIGO='+IntToStr(Item_Tabela_de_Precos_SubGrupo1.CodigoSGP)+') '
  else
    DM.QR_Consultas.SQL.Text := 'SELECT TBP_CODIGO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE TBP_CODIGO='+IntToStr(Entidade.CodigoTPS)+
      ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PRD_CODIGO IN '+
      ' (SELECT PRD_CODIGO FROM PRODUTO '+
      ' WHERE SGP_CODIGO='+IntToStr(Item_Tabela_de_Precos_SubGrupo1.CodigoSGP)+') ';
  DM.QR_Consultas.Open;
  if DM.QR_Consultas.IsEmpty then
    Item_Tabela_de_Precos_SubGrupo1.Deletar(Entidade.CodigoCNC, Item_Tabela_de_Precos_SubGrupo1.CodigoITS)
  else
    ShowMessage('Esse registro não pode ser apagado!'+#13+#13+
                'Já foi usada em um Pedido de Venda.');
  DM.QR_Consultas.Close;
  if Item_Tabela_de_Precos_SubGrupo1.IsEmpty then
    edtProduto.Clear;  
end;

procedure TfMxTabPrecoSubGrupo.SB_SalvaItemClick(Sender: TObject);
begin
  if Item_Tabela_de_Precos_SubGrupo1.FinalizaEdicao then
  Begin
    AtualizaControles(0,False);
    SB_NovoItemClick(sender);
  end
  else
    ShowMessage('Os dados não foram salvos!');
end;

procedure TfMxTabPrecoSubGrupo.SB_CancItemClick(Sender: TObject);
begin
  Item_Tabela_de_Precos_SubGrupo1.CancelaEdicao;
  AtualizaControles(0,False);
  if Item_Tabela_de_Precos_SubGrupo1.IsEmpty then
    edtProduto.Clear;
end;

procedure TfMxTabPrecoSubGrupo.dblSubGrupoClick(Sender: TObject);
begin
  if not edtPreco.Enabled then
    Exit;

  if edtCodigoPRD.Focused then
    Exit;

  if dblSubGrupo.Enabled then
  Begin
    with Produto1 do
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := dblSubGrupo.KeyValue;
      Open;
      if RecordCount > 1 then
      Begin
        ShowMessage('SubGrupo com diferentes preços!');
        edtPrecoOriginal.Text := '0';
      end
      else
      Begin
        edtPreco.Text := format('%.2f',[PrecoVenda]);
        edtPrecoOriginal.Text := format('%.2f',[PrecoVenda]);
      end;
    end;
  end;
end;

procedure TfMxTabPrecoSubGrupo.dblGrupoClick(Sender: TObject);
begin
  SubGrupo1.Close;
  SubGrupo1.Open;
  if edtPreco.Enabled then
  Begin
    dblSubGrupo.KeyValue := SubGrupo1.CodigoSGP;
    dblSubGrupoClick(sender);
  end;
end;

procedure TfMxTabPrecoSubGrupo.SubGrupo1BeforeOpen(DataSet: TDataSet);
begin
  SubGrupo1.ParamByName('GRP_CODIGO').asInteger := Grupo1.CodigoGRP;
end;

procedure TfMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1AfterScroll(
  DataSet: TDataSet);
begin
  dblGrupo.KeyValue := Item_Tabela_de_Precos_SubGrupo1.CodigoGRP;
  dblGrupoClick(dblGrupo);
  Item_Tabela_de_Precos_SubGrupo1.CarregaDados;
  edtProduto.Text := Item_Tabela_de_Precos_SubGrupo1.FieldByName('Produto').asString;
end;

procedure TfMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1AfterOpen(
  DataSet: TDataSet);
begin
  if Item_Tabela_de_Precos_SubGrupo1.IsEmpty then
    Item_Tabela_de_Precos_SubGrupo1.LimpaCampos;
end;

procedure TfMxTabPrecoSubGrupo.ckbLaboratorioClick(Sender: TObject);
begin
  if ckbLaboratorio.Enabled and ckbLaboratorio.Checked then
    ckbPrincipal.Enabled := True
  else
  Begin
    if not ckbLaboratorio.Checked then
      ckbPrincipal.Checked := False;
    ckbPrincipal.Enabled := False;
  end;
end;

procedure TfMxTabPrecoSubGrupo.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=37;
    fCadCli.CentroCusto2.open;
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxTabPrecoSubGrupo.edtCodigoCLIExit(Sender: TObject);
begin
  if edtCodigoCLI.Enabled then
  Begin
    if VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      if StrToInt(edtCodigoCLI.Text) > 0 then
      Begin
        edtDescricao.Enabled := False;
        with Cliente1 do
        Begin
          if (CodigoCNC <> StrToInt(edtClienteCNC.Text)) or
             (CodigoCLI <> StrToInt(edtCodigoCLI.Text)) then
          Begin
            Close;
            ParamByName('CNC_CODIGO').asInteger := StrToInt(edtClienteCNC.Text);
            ParamByName('CLI_CODIGO').asInteger := StrToInt(edtCodigoCLI.Text);
            Open;
            if IsEmpty then
            Begin
              ShowMessage('Cliente não encontrado!');
              edtCodigoCLI.Text := '0';
              edtCodigoCLI.SetFocus;
            end;
          end;
          edtDescricao.Text := RazaoSocial;
        end;
      end
      else
        edtDescricao.Enabled := True;
    end;
  end;
end;

procedure TfMxTabPrecoSubGrupo.SB_CopiarItensClick(Sender: TObject);
var
  CdCNC, CdCNCOrigem, CdTPSOrigem : integer;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecionar Tabela!');

  CdCNC := Entidade.CodigoCNC;
//  CdTPS := Entidade.CodigoTPS;

  try
    CdCNCOrigem := CdCNC;
    CdTPSOrigem := StrToInt(InputBox('Tabela de Origem' ,  'Código da Tabela de Origem:', '0'));
  except
    ShowMessage('Código da Tabela inválido!');
    Exit;
  end;

  with Item_Tabela_de_Precos_SubGrupo2 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCNCOrigem;
    ParamByName('TPS_CODIGO').asInteger := CdTPSOrigem;
    Open;
    if isEmpty then
      Raise exception.Create('Tabela de Origem não encontrada!');
    First;
    while not Eof do
    Begin
      SB_NovoItemClick(sender);
      dblGrupo.KeyValue    := CodigoGRP;
      dblGrupoClick(sender);
      dblSubGrupo.KeyValue := CodigoSGP;
      dblSubGrupoClick(sender);
      edtPreco.Text := format('%.2f',[Preco]);
      SB_SalvaItemClick(sender);
      Next;
    end;
    SB_CancItemClick(sender);
    ShowMessage('Cópia concluída!');
  end;
end;

procedure TfMxTabPrecoSubGrupo.DBGrid5DblClick(Sender: TObject);
begin
  if Item_Tabela_de_Precos_SubGrupo1.IsEmpty then
    Raise Exception.Create('Tabela sem itens!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Application.CreateForm(TfMxSTPreco, fMxSTPreco);
  with fMxSTPreco do
  Begin
    tag := 1;
    edtDescricao.Text   :=Item_Tabela_de_Precos_SubGrupo1.fieldByName('SubGrupo').AsString;
    edtPreco.Text       := format('%.2f',[self.Item_Tabela_de_Precos_SubGrupo1.fieldByName('ITS_PRECO_VENDA').AsFloat]);
    edtBonificacao.Text := self.Item_Tabela_de_Precos_SubGrupo1.fieldByName('ITS_BONIFICACAO').Asstring;
    ShowModal;
  end;
end;

procedure TfMxTabPrecoSubGrupo.SB_LocPedClick(Sender: TObject);
begin
  cancelarloc:=True;
  Application.CreateForm(TfMxLocalizaTabelaPrecoSGP, fMxLocalizaTabelaPrecoSGP);
  with fMxLocalizaTabelaPrecoSGP do
  begin
    Tag:=1;
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM TABELA_DE_PRECO_SUBGRUPO  '+
      ' WHERE (TPS_DT_CADASTRO>="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' OR TPS_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'") '+
      ' AND TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" ';
    Entidade.Open;
    ShowModal;
    If not cancelarloc Then
    Begin
      self.Item_Tabela_de_Precos_SubGrupo1.Close;
      self.Entidade.Close;
      self.Entidade.SQL.Text:='SELECT * FROM TABELA_DE_PRECO_SUBGRUPO '+
        ' WHERE TPS_CODIGO='+self.edtCodigoTPS.Text;
      self.Entidade.Open;
      self.Item_Tabela_de_Precos_SubGrupo1.Open;
    end;
  end;
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxTabPrecoSubGrupo.SB_DefinirCLientesClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecionar Tabela!');

  if Entidade.CodigoCLI = 0 then
    Raise exception.Create('Tabela definida para todos os cliente!')
  else if Entidade.CodigoCLI > 0 then
    Raise exception.Create('Tabela específica para um cliente!');

  Application.CreateForm(TfCadTabelaPrecoCliente, fCadTabelaPrecoCliente);
  with fCadTabelaPrecoCliente do
  Begin
    Tag := 0;
    edtTabelaCNC.Text := IntToStr(self.Entidade.CodigoCNC);
    edtCodigoTBP.Text := IntToStr(self.Entidade.CodigoTPS);
    edtDescricaoTabela.Text := self.Entidade.Descricao;
    Showmodal;
  end;
end;

procedure TfMxTabPrecoSubGrupo.edtCodigoPRDExit(Sender: TObject);
begin
  if SB_CancItem.Focused then
    Exit;
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Text := '0';
  if StrToInt(edtCodigoPRD.Text) <= 0 then
  Begin
    edtCodigoPRD.Text := '0';
    Exit;
  end;

  with Produto2 do
  Begin
    if (not Active) or
       (CodigoPRD <> StrToInt(edtCodigoPRD.Text)) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
      Open;
    end;
    edtProduto.Text := Descricao;
    if SB_SalvaItem.Enabled then
    Begin
      dblGrupo.KeyValue := CodigoGRP;

      SubGrupo1.Close;
      SubGrupo1.Open;

      dblSubGrupo.KeyValue := CodigoSGP;
      edtPreco.Text := Format('%.2f',[Precovenda]);
      edtPrecoOriginal.Text := Format('%.2f',[Precovenda]);
    end;
  end;
end;

procedure TfMxTabPrecoSubGrupo.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Clear;
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=67;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=67;
        ShowModal;
      end;
    end;
  End
  else
  Begin
    if DM.Configuracao1.Empresa <> empHope then
    Begin
      If key='-' then
        key:='0'
      else If UpperCase(key)='C' then
        key:='0'
      else If UpperCase(key)='D' then
        key:='6';
    end;
  end;
end;

end.
