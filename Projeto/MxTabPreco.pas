unit MxTabPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Transportadora, DBCtrls, Parametro, Solicitacao_de_Garantia,
  Tabela_de_Precos, Item_Tabela_de_Precos, Menus, CentroCusto,
  Item_Pedido_Venda, Produto, AgenteFin;

type
  TfMxTabPreco = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;                                           
    edtCodigoTBP: TEdit;
    Label5: TLabel;
    Label13: TLabel;
    mskValidade: TMaskEdit;
    Label4: TLabel;
    edtDescricao: TEdit;
    edtIndicePrecificacao: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Panel2: TPanel;
    edtNumeroPrestacoes: TEdit;
    DSItem_Tabela_de_Precos1: TDataSource;
    Tabela_de_Precos1: TTabela_de_Precos;
    Item_Tabela_de_Precos1: TItem_Tabela_de_Precos;
    MainMenu2: TMainMenu;
    SairCab: TMenuItem;
    MenuItem2: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    MenuItem6: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    dblCodigoCNC: TDBLookupComboBox;
    Label3: TLabel;
    Ds_CentroCusto: TDataSource;
    CentroCusto1: TCentroCusto;
    Panel3: TPanel;
    SB_CadastrarItens: TSpeedButton;
    DBGrid5: TDBGrid;
    SB_AlterarPrecos: TSpeedButton;
    Label6: TLabel;
    Tabela_de_Precos1TBP_CODIGO: TIntegerField;
    Tabela_de_Precos1CNC_CODIGO: TIntegerField;
    Tabela_de_Precos1TBP_DESCRICAO: TStringField;
    Tabela_de_Precos1TBP_INDICE: TFloatField;
    Tabela_de_Precos1TBP_PRAZO_MEDIO: TIntegerField;
    Tabela_de_Precos1TBP_VALIDADE: TDateTimeField;
    Tabela_de_Precos1Centro: TStringField;
    Label9: TLabel;
    edtDescontoSimples: TEdit;
    Label11: TLabel;
    edtDescontoEspecial: TEdit;
    Tabela_de_Precos1TBP_DESCONTO_SIMPLES: TFloatField;
    Tabela_de_Precos1TBP_DESCONTO_ESPECIAL: TFloatField;
    Label7: TLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    SB_Imprimir: TSpeedButton;
    SB_Etiquetas: TSpeedButton;
    Etiquetas1: TProduto;
    Label8: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtPrecoTabela: TEdit;
    edtPrecoOriginal: TEdit;
    SB_NovoItem: TSpeedButton;
    SB_ExcItem: TSpeedButton;
    SB_SalvaItem: TBitBtn;
    SB_CancItem: TBitBtn;
    Label12: TLabel;
    edtBonificacao: TEdit;
    Item_Tabela_de_Precos1ITP_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1CNC_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1PRD_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1TBP_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1ITP_PRECO: TFloatField;
    Item_Tabela_de_Precos1ITP_BONIFICACAO: TFloatField;
    Item_Tabela_de_Precos1ITP_QUANT_MIN: TFloatField;
    Item_Tabela_de_Precos1ITP_PRECO_ORIGINAL: TFloatField;
    Item_Tabela_de_Precos1Produto: TStringField;
    SB_AltItem: TSpeedButton;
    ItemTabela1: TMenuItem;
    IncluirItem: TMenuItem;
    AlterarItem: TMenuItem;
    ExcluirItem: TMenuItem;
    N1: TMenuItem;
    SalvarItem: TMenuItem;
    CancelarItem: TMenuItem;
    Label14: TLabel;
    Label15: TLabel;
    edtDescontoSimplesPrazo: TEdit;
    edtDescontoEspecialPrazo: TEdit;
    Tabela_de_Precos1USU_CODIGO: TIntegerField;
    Tabela_de_Precos1TBP_DT_ALTERADO: TDateTimeField;
    Tabela_de_Precos1TBP_DESCONTO_SIMPLES_PRAZO: TFloatField;
    Tabela_de_Precos1TBP_DESCONTO_ESPECIAL_PRAZO: TFloatField;
    Item_Tabela_de_Precos1ITP_DT_CADASTRO: TDateTimeField;
    Item_Tabela_de_Precos1ITP_DT_ALTERADO: TDateTimeField;
    Item_Tabela_de_Precos1USU_CODIGO: TIntegerField;
    SB_LocPed: TSpeedButton;
    Label17: TLabel;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Item_Tabela_de_Precos1Detalhe: TStringField;
    Item_Tabela_de_Precos1Caracteristica: TStringField;
    Item_Tabela_de_Precos1Referencia: TStringField;
    SB_LocItem: TSpeedButton;
    Label16: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    N3: TMenuItem;
    LocalizarItem: TMenuItem;
    Label21: TLabel;
    dblAgenteExclusivo: TDBLookupComboBox;
    btnLimpaAgente: TBitBtn;
    Tabela_de_Precos1TBP_AGF_EXCLUSIVO: TIntegerField;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    SB_RetirarDesconto: TSpeedButton;
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Tabela_de_Precos1AfterScroll(DataSet: TDataSet);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SB_CadastrarItensClick(Sender: TObject);
    procedure Item_Tabela_de_Precos1BeforeOpen(DataSet: TDataSet);
    procedure SB_AlterarPrecosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure SB_EtiquetasClick(Sender: TObject);
    procedure SB_NovoItemClick(Sender: TObject);
    procedure SB_AltItemClick(Sender: TObject);
    procedure SB_ExcItemClick(Sender: TObject);
    procedure SB_SalvaItemClick(Sender: TObject);
    procedure SB_CancItemClick(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure Item_Tabela_de_Precos1AfterScroll(DataSet: TDataSet);
    procedure Item_Tabela_de_Precos1CalcFields(DataSet: TDataSet);
    procedure SB_LocPedClick(Sender: TObject);
    procedure Tabela_de_Precos1AfterOpen(DataSet: TDataSet);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure SB_LocItemClick(Sender: TObject);
    procedure btnLimpaAgenteClick(Sender: TObject);
    procedure SB_RetirarDescontoClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    Entidade : TTabela_de_precos;
    CancelarLoc: Boolean;
  end;

var
  fMxTabPreco: TfMxTabPreco;

implementation
Uses UDM, Funcoes, MxS_Tpreco, CdItemTab, UMxAjustePreco, UTabelaPreco,
  MxSPediProdMotCal, MxSPediProd, MxLocalizaTabelaPreco;
{$R *.DFM}

procedure TfMxTabPreco.SB_NovoCabClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6910)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir Tabela de Preços!');
  //
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  //
  Item_Tabela_de_Precos1.Close;
  Item_Tabela_de_Precos1.LimpaCampos;
  AtualizaControles(1, True);
  edtDescricao.SetFocus;
end;

procedure TfMxTabPreco.SB_AltCabClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6910)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Tabela de Preços!');
  //
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1, True);
  edtDescricao.SetFocus;
end;

procedure TfMxTabPreco.SB_SalvaCabClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(1, False);
    //
    if Item_Tabela_de_Precos1.isEmpty then
      edtProduto.Clear;
  end
  else
    ShowMessage('Os dados não foram salvos!');
end;

procedure TfMxTabPreco.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
  if Item_Tabela_de_Precos1.isEmpty then
    edtProduto.Clear;
  //
  if Entidade.isEmpty then
  begin
    Entidade.LimpaCampos;
    dblCodigoCNC.KeyValue := -1; 
  end
  else
    Entidade.CarregaDados;
end;

procedure TfMxTabPreco.SB_ExcCabClick(Sender: TObject);
var
  CdCNC, CdTBP: integer;
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6930)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Tabela de Preços!');
  //
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem deletados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  // Verificar se a Tabela já foi utilizada em alguma venda
  Item_Pedido_Venda1.Close;
  if Entidade.CodigoCNC = 0 then
    DM.QR_Consultas.SQL.Text := 'SELECT TBP_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE TBP_CODIGO='+IntToStr(Entidade.CodigoTBP)
  else
    DM.QR_Consultas.SQL.Text := 'SELECT TBP_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE TBP_CODIGO='+IntToStr(Entidade.CodigoTBP)+' AND CNC_CODIGO='+
      IntToStr(Entidade.CodigoCNC);
  DM.QR_Consultas.Open;
  CdCNC := Entidade.CodigoCNC;
  CdTBP := Entidade.CodigoTBP;

  if DM.QR_Consultas.IsEmpty then
  Begin
    if Entidade.Deletar(CdCNC, CdTBP) then
    Begin
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_TABELA_DE_PRECO '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TBP_CODIGO='+IntToStr(CdTBP));
    end;
  end
  else
    ShowMessage('Essa Tabela não pode ser apagada!'+#13+#13+
                'Já foi usada em um Pedido de Venda.');
  DM.QR_Consultas.Close;
  //
  if Entidade.isEmpty then
  begin
    Entidade.LimpaCampos;
    dblCodigoCNC.KeyValue := -1;
  end
  else
    Entidade.CarregaDados;
end;

procedure TfMxTabPreco.FormCreate(Sender: TObject);
begin
  Entidade := Tabela_de_precos1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_TabPreco_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxTabPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_TabPreco_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  CentroCusto1.Close;
  Item_Tabela_de_Precos1.Close;
  Action:=Cafree;
end;

procedure TfMxTabPreco.Tabela_de_Precos1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxTabPreco.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxTabPreco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxTabPreco.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  AgenteFin1.Open;
  CentroCusto1.Open;
  Entidade.Open;

  cmbCampo.ItemIndex := 2;
end;

procedure TfMxTabPreco.SB_CadastrarItensClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione/Crie uma Tabela de Preço!');
  if Entidade.Validade < DM.Configuracao1.Data then
    raise Exception.Create('Validade Vencida!');

  Application.CreateForm(TfCadItemTab,fCadItemTab);
  with fCadItemTab do
  Begin
    Tag := 1;
    dblCodigoTBP.KeyValue := self.Entidade.CodigoTBP;
    ShowModal;
  end;

  Item_Tabela_de_Precos1.Close;
  Item_Tabela_de_Precos1.Open;
  if Item_Tabela_de_Precos1.IsEmpty then
  Begin
    Item_Tabela_de_Precos1.LimpaCampos;
    edtProduto.Clear;
    edtPrecoOriginal.Clear;
  end
  else
    Item_Tabela_de_Precos1.CarregaDados;
end;

procedure TfMxTabPreco.Item_Tabela_de_Precos1BeforeOpen(DataSet: TDataSet);
begin
  Item_Tabela_de_Precos1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CodigoCNC;
  Item_Tabela_de_Precos1.ParamByName('TBP_CODIGO').AsInteger := Entidade.CodigoTBP;  
end;

procedure TfMxTabPreco.SB_AlterarPrecosClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione a Tabela primeiro!');
  if Item_Tabela_de_Precos1.IsEmpty then
    Raise Exception.Create('Tabela sem itens!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Application.CreateForm(TfMxAjustePreco,fMxAjustePreco);
  fMxAjustePreco.tag:=1;
  fMxAjustePreco.ShowModal;
  Item_Tabela_de_Precos1.Close;
  Item_Tabela_de_Precos1.Open;  
end;

procedure TfMxTabPreco.FormKeyPress(Sender: TObject; var Key: Char);
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
  else if key=#13 then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      Key := #0;
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
    else if SB_SalvaItem.Enabled then
    Begin
      Key := #0;
      SB_SalvaItem.SetFocus;
      SB_SalvaItemClick(sender);
    end;
  end
  else if ((edtPrecoTabela.Focused)) and (Key = '.') then
    Key := ',';
end;

procedure TfMxTabPreco.SB_ImprimirClick(Sender: TObject);
begin
  if (edtCodigoTBP.Text = '') or (edtCodigoTBP.Text = '0') then
  Begin
    ShowMessage('Selecione a Tabela de Preço!');
    Exit;
  end;
  Application.CreateForm(Trpt_TabelaPreco,rpt_TabelaPreco);
  with rpt_TabelaPreco do
  Begin
    Item_Tabela_de_Precos1.Close;
    Item_Tabela_de_Precos1.ParamByName('CNC_CODIGO').AsInteger := self.Entidade.CodigoCNC;
    Item_Tabela_de_Precos1.ParamByName('TBP_CODIGO').AsInteger := self.Entidade.CodigoTBP;
    Item_Tabela_de_Precos1.Open;
    if Item_Tabela_de_Precos1.IsEmpty then
    Begin
      ShowMessage('Tabela sem Itens!');
      Exit;
    end;
    report.Preview;
    Close;
  end;
end;

procedure TfMxTabPreco.SB_EtiquetasClick(Sender: TObject);
var
  iQuantidade: integer;
  sProduto, sCodigoBarras: string;
  PUmPoQuantidade: Boolean;
begin
  if Item_Tabela_de_Precos1.IsEmpty then
    Raise Exception.Create('Tabela sem Produtos!');
  Etiquetas1.Close;
  Etiquetas1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CodigoCNC;
  Etiquetas1.ParamByName('TBP_CODIGO').AsInteger := Entidade.CodigoTBP;
  Etiquetas1.Open;
  if Etiquetas1.IsEmpty then
    Raise Exception.Create('Etiquetas NÃO foram geradas!');
  try
    iQuantidade := StrToInt(InputBox('Etiquetas', 'Quantidade', '1'));
  except
    ShowMessage('Quantidade inválida!');
    Exit;
  end;

  PUmPoQuantidade := (MessageDlg('Deseja um registro para cada item do produto?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes);

  Etiquetas1.LimpaEtiquetas;
  while not Etiquetas1.EOF do
  begin
    if DM.Configuracao1.Empresa = empEletro then
      sProduto := Etiquetas1.Descricao+' '+Etiquetas1.Caracteristica
    else
      sProduto := Etiquetas1.Descricao;

    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM CODIGO_DE_BARRAS '+
        ' WHERE CDB_CODIGO_ENTRADA='+IntToStr(Etiquetas1.CodigoPRD)+
        ' AND CDB_TIPO=0 ';
      Open;
      sCodigoBarras := FieldByName('CDB_CODIGO_BARRAS').asString;
    end;

    if (DM.Configuracao1.Empresa = empEletro) and
       (iQuantidade > 0) and
       (Etiquetas1.Estmedio > 1) then //Volume
      iQuantidade := Trunc(iQuantidade*Etiquetas1.Estmedio); //Volume

    Etiquetas1.AdicionaEtiqueta(Etiquetas1.CodigoPRD, Etiquetas1.Precovenda,iQuantidade,
      sProduto, Etiquetas1.Referencia, Etiquetas1.Detalhe, Etiquetas1.Caracteristica, Etiquetas1.Marca, sCodigoBarras, PUmPoQuantidade);
    Etiquetas1.Next;
  end;
  Etiquetas1.FechaEtiquetas;
  ShowMessage('Arquivo gerado com sucesso !');
  Etiquetas1.Close;
end;

procedure TfMxTabPreco.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  btnLimpaAgente.Enabled := Habilitar;
  SairCab.Enabled        := not Habilitar;
  IncluirCab.Enabled     := not Habilitar;
  LocalizarCab.Enabled   := not Habilitar;
  AlterarCab.Enabled     := not Habilitar;
  ExcluirCab.Enabled     := not Habilitar;
  SalvarCab.Enabled      := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled    := ((Cabecalho=1) and Habilitar);
  SB_NovoCab.Enabled     := not Habilitar;
  SB_AltCab.Enabled      := not Habilitar;
  SB_LocPed.Enabled      := not Habilitar;
  SB_ExcCab.Enabled      := not Habilitar;
  SB_SalvaCab.Enabled    := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled     := ((Cabecalho=1) and Habilitar);
  IncluirItem.Enabled    := not Habilitar;
  AlterarItem.Enabled    := not Habilitar;
  ExcluirItem.Enabled    := not Habilitar;
  SalvarItem.Enabled     := ((Cabecalho<>1) and Habilitar);
  CancelarItem.Enabled   := ((Cabecalho<>1) and Habilitar);
  SB_NovoItem.Enabled    := not Habilitar;
  SB_AltItem.Enabled     := not Habilitar;
  SB_ExcItem.Enabled     := not Habilitar;
  SB_SalvaItem.Enabled   := ((Cabecalho<>1) and Habilitar);
  SB_CancItem.Enabled    := ((Cabecalho<>1) and Habilitar);

  LocalizarItem.Enabled  := not Habilitar;
  edtLocalizar.Enabled   := not Habilitar;
  if Habilitar then
    edtLocalizar.Color := AlteraCorComponentes
  else
    edtLocalizar.Color := clWindow;
  cmbCampo.Enabled     := not Habilitar;
  if Habilitar then
    cmbCampo.Color     :=AlteraCorComponentes
  else
    cmbCampo.Color     :=clWindow;
      
  //
  SB_CadastrarItens.Enabled := not Habilitar;
  SB_AlterarPrecos.Enabled  := not Habilitar;
  SB_RetirarDesconto.Enabled  := not Habilitar;
  SB_Imprimir.Enabled       := not Habilitar;
  SB_Etiquetas.Enabled      := not Habilitar;
  //
  DBGrid5.Enabled    := not Habilitar;
end;


procedure TfMxTabPreco.SB_NovoItemClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6920)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir/alterar Item de Tabela de Preços!');
  //
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione a tabela!');
  if not DM.Configuracao1.CPD then
    raise Exception.Create('Somente no CPD.');

  if not Item_Tabela_de_Precos1.Active then
    Item_Tabela_de_Precos1.Open;

  Item_Tabela_de_Precos1.PreparaInsercao;
  edtProduto.Clear;
  AtualizaControles(2,True);
  try
    edtCodigoPRD.SetFocus;
  except
  end;
end;

procedure TfMxTabPreco.SB_AltItemClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6920)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir/alterar Item de Tabela de Preços!');
  //
  if Item_Tabela_de_Precos1.IsEmpty then
    Raise Exception.Create('Selecione o Produto!');
  if not DM.Configuracao1.CPD then
    raise Exception.Create('Somente no CPD.');
  Item_Tabela_de_Precos1.PreparaAlteracao;
  AtualizaControles(2,True);
  edtCodigoPRD.Enabled := False;
  try
    edtPrecoTabela.SetFocus;
  except
  end;
end;

procedure TfMxTabPreco.SB_ExcItemClick(Sender: TObject);
var
  CdCNC, CdITP: integer;
  Trans: Boolean;
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6940)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Item de Tabela de Preços!');
  //
  if Item_Tabela_de_Precos1.IsEmpty then
    Raise Exception.Create('Selecione o Produto!');
  if not DM.Configuracao1.CPD then
    raise Exception.Create('Somente no CPD.');

  CdCNC := Item_Tabela_de_Precos1.CodigoCNC;
  CdITP := Item_Tabela_de_Precos1.CodigoITP;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Log Gerado na Função
      Item_Tabela_de_Precos1.Deletar(CdCNC, CdITP);

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
  if Item_Tabela_de_Precos1.isEmpty then
    edtProduto.Clear;
end;

procedure TfMxTabPreco.SB_SalvaItemClick(Sender: TObject);
var
  iInserir: Boolean;
begin
  if Item_Tabela_de_Precos1.Estado = 1 then
    iInserir := True
  else
    iInserir := False;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Exit
  else if StrToInt(edtCodigoPRD.Text) <= 0 then
    Exit;
    
  if Item_Tabela_de_Precos1.FinalizaEdicao then
  Begin
    AtualizaControles(2,False);
    if iInserir then
      SB_NovoItemClick(sender);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxTabPreco.SB_CancItemClick(Sender: TObject);
begin
  Item_Tabela_de_Precos1.CancelaEdicao;
  AtualizaControles(2,False);
  if Item_Tabela_de_Precos1.isEmpty then
    edtProduto.Clear
  else
    edtProduto.Text := Item_Tabela_de_Precos1.FieldByName('Produto').asString;
end;

procedure TfMxTabPreco.edtCodigoPRDExit(Sender: TObject);
begin
  if SB_CancItem.Focused then
    Exit;

  edtProduto.Clear;

  with DM.Produto1 do
  Begin
    try
      if CodigoPRD <> StrToInt(edtCodigoPRD.Text) then
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
        Open;
      end;
    except
      Close;
      ParamByName('PRD_CODIGO').asInteger := -10;
      Open;
    end;
    if IsEmpty then
    Begin
      with DM.Codigo_Barras1 do
      Begin
        if CodigoCDB_Barras <> edtCodigoPRD.Text then
        Begin
          Close;
          paramByName('CDB_CODIGO_BARRAS').asString := edtCodigoPRD.Text;
          Open;
        end;
        if not IsEmpty then
        Begin
          edtCodigoPRD.Text := IntToStr(CodigoCDB_Entrada);
          Close;
          ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
          Open;
        end;
      end;
    End;
    if IsEmpty and
       (Length(edtCodigoPRD.Text) > 3) then //Referências maiores que 3 caracteres
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT PRD_CODIGO '+
          ' FROM PRODUTO '+
          ' WHERE PRD_REFERENCIA="'+edtCodigoPRD.Text+'"';
        Open;
        if not IsEmpty then
          edtCodigoPRD.Text := FieldByName('PRD_CODIGO').asString
        else
          edtCodigoPRD.Text := '-1';
      end;
      Close;
      ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
      Open;
    End;
    if IsEmpty then
    Begin
      Showmessage('Produto inexistente!');
      edtCodigoPRD.SetFocus;
      Exit;
    End;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PRD_CODIGO FROM ITEM_DE_TABELA_DE_PRECO '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND TBP_CODIGO='+IntToStr(Entidade.CodigoTBP)+
      ' AND PRD_CODIGO='+edtCodigoPRD.Text;
    Open;
    If not IsEmpty Then
    Begin
      try
        edtCodigoPRD.SetFocus;
      except
      end;
      Raise exception.Create('Este produto já foi incluído!'+#13+'Sendo necessário você pode alterá-lo!');
    end;
  end;

  if DM.Configuracao1.Empresa = empEletro then
    edtProduto.text := Trim(DM.Produto1.Descricao+' '+DM.Produto1.Caracteristica)
  else if DM.configuracao1.Empresa = empHope then
    edtProduto.text := DM.Produto1.Descricao+' '+DM.Produto1.Referencia
  else
    edtProduto.text := DM.Produto1.Descricao;
  edtPrecoOriginal.Text := format('%.2f',[DM.Produto1.PrecoVenda]);
  edtPrecoTabela.Text := edtPrecoOriginal.Text;
end;

procedure TfMxTabPreco.edtCodigoPRDKeyPress(Sender: TObject;
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
        Tag:=58;
//        dblCodigoGRP.KeyValue := CdUltimoGRP;
//        dblCodigoGRPClick(sender);
//        dblCodigoSGP.KeyValue := CdUltimoSGP;
//        dblCodigoSGPClick(sender);
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=58;
        ShowModal;
      end;
    end;
    edtPrecoTabela.SetFocus;
  End
  else If key=chr(13) then
  Begin
    Key := #0;
    edtPrecoTabela.SetFocus;
  end
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

procedure TfMxTabPreco.Item_Tabela_de_Precos1AfterScroll(
  DataSet: TDataSet);
begin
  Item_Tabela_de_Precos1.CarregaDados;
  if Item_Tabela_de_Precos1.isEmpty then
    edtProduto.Clear
  else
    edtProduto.Text := Item_Tabela_de_Precos1.FieldByName('Produto').asString;
end;

procedure TfMxTabPreco.Item_Tabela_de_Precos1CalcFields(DataSet: TDataSet);
begin
  with DM.Produto1 do
  Begin
    if (not Active) or
       (Item_Tabela_de_Precos1.CodigoPRD <> CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Item_Tabela_de_Precos1.CodigoPRD;
      Open;
    end;
    Item_Tabela_de_Precos1.FieldByName('Produto').asString        := Descricao;
    Item_Tabela_de_Precos1.FieldByName('Detalhe').asString        := Detalhe;
    Item_Tabela_de_Precos1.FieldByName('Referencia').asString     := Referencia;
    Item_Tabela_de_Precos1.FieldByName('Caracteristica').asString := Caracteristica;
  end;
end;

procedure TfMxTabPreco.SB_LocPedClick(Sender: TObject);
begin
  cancelarloc:=True;
  Application.CreateForm(TfMxLocalizaTabelaPreco, fMxLocalizaTabelaPreco);
  with fMxLocalizaTabelaPreco do
  begin
    Tag:=1;
    ShowModal;
    If not cancelarloc Then
    Begin
      self.Item_Tabela_de_Precos1.Close;
      self.Entidade.Close;
      self.Entidade.SQL.Text:='SELECT * FROM TABELA_DE_PRECO '+
        ' WHERE TBP_CODIGO='+self.edtCodigoTBP.Text;
      self.Entidade.Open;
      self.Item_Tabela_de_Precos1.Open;
    end;
  end;
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxTabPreco.Tabela_de_Precos1AfterOpen(DataSet: TDataSet);
begin
  if Entidade.isEmpty then
    Entidade.LimpaCampos
  else
    Entidade.CarregaDados;
end;

procedure TfMxTabPreco.DBGrid5DblClick(Sender: TObject);
var
  CdCNC, CdITP: integer;
begin
  if Item_Tabela_de_Precos1.IsEmpty then
    Raise Exception.Create('Tabela sem itens!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  CdCNC := Item_Tabela_de_Precos1.CodigoCNC;
  CdITP := Item_Tabela_de_Precos1.CodigoITP;
  Application.CreateForm(TfMxSTPreco, fMxSTPreco);
  with fMxSTPreco do
  Begin
    tag := 0;
    edtDescricao.Text   := self.Item_Tabela_de_Precos1.fieldByName('PRODUTO').AsString;
    DM.Produto1.Close;
    DM.Produto1.ParamByName('PRD_CODIGO').asInteger := self.Item_Tabela_de_Precos1.CodigoPRD;
    DM.Produto1.Open;
    edtUnidade.Text     := DM.Produto1.fieldByName('PRD_UNIDADE').AsString;
    edtReferencia.Text  := DM.Produto1.fieldByName('PRD_REFERENCIA').AsString;
    edtMarca.Text       := DM.Produto1.fieldByName('PRD_MARCA').AsString;
    edtPreco.Text       := format('%.2f',[self.Item_Tabela_de_Precos1.fieldByName('ITP_PRECO').AsFloat]);
    edtBonificacao.Text := self.Item_Tabela_de_Precos1.fieldByName('ITP_BONIFICACAO').Asstring;
    ShowModal;
  end;
  Item_Tabela_de_Precos1.Close;
  Item_Tabela_de_Precos1.Open;
  Item_Tabela_de_Precos1.LocalizarCod(CdITP, CdCNC);
end;

procedure TfMxTabPreco.SB_LocItemClick(Sender: TObject);
Var
  mensagem,Campo,Nome,campoloc :String;
  i, CdCNC, CdTBP, CdITP :Integer;
begin
  if not Item_Tabela_de_Precos1.Active then  //Item
    Exit;

  if not SB_LocItem.Enabled then
    Exit;

//Cód. Produto                                                                 PRD_CODIGO
//Descricao                                                                      PRD_DESCRICAO
//Referência                                                                     PRD_REFERENCIA
//Cód. Barras

  mensagem:='';
  If (cmbCampo.ItemIndex=0) then
     if not VerificaInteiroBranco(edtLocalizar.Text) then
       mensagem:= mensagem+'Código a ser localizado inválido!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  If (cmbCampo.Text<>'') Then
  Begin
    campoloc:=trim(cmbCampo.Text);
    for i:= length(campoloc) downto 1 do
      If campoloc[i]=' ' Then
      Begin
        Campo := Copy(campoloc,i+1,length(campoloc)-i);
        Break;
      End;
    Nome:=Trim(edtLocalizar.text);
  End
  else
    Raise Exception.Create('valor de localização faltando!');

  CdCNC := Item_Tabela_de_Precos1.CodigoCNC;
  CdTBP := Item_Tabela_de_Precos1.CodigoTBP;

  With Item_Tabela_de_Precos1 do
  Begin
    if Campo='PRD_DESCRICAO' then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT ITP_CODIGO '+
          ' FROM PRODUTO P1, ITEM_DE_TABELA_DE_PRECO I1 '+
          ' WHERE P1.PRD_DESCRICAO LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.TBP_CODIGO='+IntToStr(CdTBP)+
          ' AND P1.PRD_CODIGO=I1.PRD_CODIGO ';
        Open;
        CdITP := FieldByName('ITP_CODIGO').asInteger;
      end;
      LocalizarCod(CdITP, CdCNC);
    end
    else if Campo='PRD_REFERENCIA' then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT ITP_CODIGO '+
          ' FROM PRODUTO P1, ITEM_DE_TABELA_DE_PRECO I1 '+
          ' WHERE P1.PRD_REFERENCIA LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.TBP_CODIGO='+IntToStr(CdTBP)+
          ' AND P1.PRD_CODIGO=I1.PRD_CODIGO ';
        Open;
        CdITP := FieldByName('ITP_CODIGO').asInteger;
      end;
      LocalizarCod(CdITP, CdCNC);
    end
    else if Campo='PRD_REFERENCIA' then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT ITP_CODIGO '+
          ' FROM CODIGO_DE_BARRAS C1, ITEM_DE_TABELA_DE_PRECO I1 '+
          ' WHERE C1.CDB_CODIGO_BARRAS LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.TPB_CODIGO='+IntToStr(CdTBP)+
          ' AND C1.CDB_CODIGO_ENTRADA=I1.PRD_CODIGO ';
        Open;
        CdITP := FieldByName('ITP_CODIGO').asInteger;
      end;
      LocalizarCod(CdITP, CdCNC);
    end
    else
      Localizar;
  End;
  edtLocalizar.SetFocus;
end;

procedure TfMxTabPreco.btnLimpaAgenteClick(Sender: TObject);
begin
  dblAgenteExclusivo.KeyValue := 0;
  try
    dblAgenteExclusivo.SetFocus;
  except
  end;
end;

procedure TfMxTabPreco.SB_RetirarDescontoClick(Sender: TObject);
begin
  if MessageDlg('Deseja retirar os descontos dos produtos?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TABELA_DE_PRECO SET '+
    ' ITP_PRECO_ORIGINAL=ROUND((SELECT MAX(PRD_PRECO_VENDA) FROM PRODUTO '+
    '                     WHERE PRD_CODIGO=ITEM_DE_TABELA_DE_PRECO.PRD_CODIGO),2) '+
    ',ITP_PRECO=ROUND((SELECT MAX(PRD_PRECO_VENDA) FROM PRODUTO '+
    '            WHERE PRD_CODIGO=ITEM_DE_TABELA_DE_PRECO.PRD_CODIGO),2) '+
    ' WHERE TBP_CODIGO='+IntToStr(Entidade.CodigoTBP)+
    ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC));

  DM.Usuario1.GeraLog(3550, Entidade.CodigoCNC, Entidade.CodigoTBP,
    'TABELA DE PRECOS RET. DESC');

  Item_Tabela_de_Precos1.Close;
  Item_Tabela_de_Precos1.Open;
  ShowMessage('Preços alterados!');
end;

end.
