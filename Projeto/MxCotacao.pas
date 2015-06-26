unit MxCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Db,
  DBTables, SQuery, MapaCotacao, Mask, Produto, Fornecedor, Menus,
  Item_de_Mapa_de_Cotacao, Cliente, DBCtrls, AgenteFin, Forma_de_Pagamento,
  Parametro, ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,
  ActnMenus;

type
  TfMxCotacao = class(TForm)
    Panel13: TPanel;
    Label14: TLabel;
    Label17: TLabel;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    edtProduto: TEdit;
    Label9: TLabel;
    edtPrecoCompra: TEdit;
    Panel6: TPanel;
    Panel3: TPanel;
    Label20: TLabel;
    Label10: TLabel;
    DSItem_de_Mapa_de_Cotacao1: TDataSource;
    mskCadastro: TMaskEdit;
    MapaCotacao1: TMapaCotacao;
    DSMapaCotacao1: TDataSource;
    SB_Fehcar: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Exc2: TSpeedButton;
    SB_Alt2: TSpeedButton;
    SB_Novo2: TSpeedButton;
    SB_Salva2: TBitBtn;
    SB_Canc2: TBitBtn;
    edtCodigoMCT: TEdit;
    Label7: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    edtDesconto: TEdit;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    SB_Imprimir: TSpeedButton;
    Label8: TLabel;
    edtFornecedor: TEdit;
    edtCodigoFOR: TEdit;
    mskAlterado: TMaskEdit;
    Label4: TLabel;
    Label3: TLabel;
    Label25: TLabel;
    edtPrazoEntrega: TEdit;
    edtFrete: TEdit;
    Label11: TLabel;
    edtCodigoPRD: TEdit;
    Label12: TLabel;
    edtObservacao: TEdit;
    Label18: TLabel;
    Item_de_Mapa_de_Cotacao1: TItem_de_Mapa_de_Cotacao;
    Label19: TLabel;
    edtQuantidade: TEdit;
    Item_de_Mapa_de_Cotacao1CNC_CODIGO: TIntegerField;
    Item_de_Mapa_de_Cotacao1ICT_CODIGO: TIntegerField;
    Item_de_Mapa_de_Cotacao1MCT_CODIGO: TIntegerField;
    Item_de_Mapa_de_Cotacao1USU_CODIGO: TIntegerField;
    Item_de_Mapa_de_Cotacao1ICT_DT_CADASTRO: TDateTimeField;
    Item_de_Mapa_de_Cotacao1ICT_DT_ALTERADO: TDateTimeField;
    Item_de_Mapa_de_Cotacao1PRD_CODIGO: TIntegerField;
    Item_de_Mapa_de_Cotacao1ICT_PRODUTO: TStringField;
    Item_de_Mapa_de_Cotacao1ICT_DESCONTO: TStringField;
    Item_de_Mapa_de_Cotacao1ICT_QUANTIDADE: TIntegerField;
    Fornecedor1: TFornecedor;
    Produto1: TProduto;
    Item_de_Mapa_de_Cotacao1PrecoFinal: TStringField;
    Item_de_Mapa_de_Cotacao1ICT_PRECO: TFloatField;
    ckbVenda: TCheckBox;
    Cliente1: TCliente;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    dblTipoPagamento: TDBLookupComboBox;
    dblFormaDePagamento: TDBLookupComboBox;
    dblAgenteFinanceiro: TDBLookupComboBox;
    Label28: TLabel;
    Label5: TLabel;
    Label26: TLabel;
    Item_de_Mapa_de_Cotacao1ICT_IPI: TFloatField;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    Action1: TAction;
    IncluirItem: TAction;
    AlterarItem: TAction;
    ExcluirItem: TAction;
    SalvarItem: TAction;
    CancelarItem: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MapaCotacao1AfterScroll(DataSet: TDataSet);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_FehcarClick(Sender: TObject);
    procedure SB_Novo2Click(Sender: TObject);
    procedure SB_Alt2Click(Sender: TObject);
    procedure SB_Exc2Click(Sender: TObject);
    procedure SB_Salva2Click(Sender: TObject);
    procedure SB_Canc2Click(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure Item_de_Mapa_de_Cotacao1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoFORChange(Sender: TObject);
    procedure Item_de_Mapa_de_Cotacao1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MapaCotacao1AfterOpen(DataSet: TDataSet);
    procedure dblTipoPagamentoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    procedure AtualizaControles(Cabecalho, Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TItem_de_Mapa_de_Cotacao;
  end;

var
  fMxCotacao: TfMxCotacao;

implementation

uses
  MxSPediProd, MxSCotaFor, UDM, funcoes, MxSSelCotacao, Urpt_Cotacao, CdCliente,
  Urpt_CotacaoCompleta, MxSelOrcamento, MxSPediProdMotCal;

{$R *.DFM}

procedure TfMxCotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  MapaCotacao1.Active:=False;
  Action:=caFree;
end;

procedure TfMxCotacao.SB_PrimClick(Sender: TObject);
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

procedure TfMxCotacao.SB_AntClick(Sender: TObject);
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

procedure TfMxCotacao.SB_ProxClick(Sender: TObject);
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

procedure TfMxCotacao.SB_UltClick(Sender: TObject);
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

procedure TfMxCotacao.SB_NovoClick(Sender: TObject);
begin
  if MapaCotacao1.IsEmpty then
    raise Exception.Create('Não existe Mapa de Cotação!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode incluir Cotação neste centro de custo.');
  if (MapaCotacao1.CodigoCNC<>DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Você não pode incluir Cotação neste centro de custo.');
  Entidade.PreparaInsercao;
  AtualizaControles(False,True);
  edtCodigoPRD.SetFocus;
end;

procedure TfMxCotacao.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar cotação deste centro de custo.');
  Entidade.PreparaAlteracao;
  AtualizaControles(False, True);
  edtCodigoPRD.SetFocus;
end;

procedure TfMxCotacao.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode excluir cotação neste centro de custo.');
  if Entidade.deletarauto then
  Begin
    Entidade.Close;
    Entidade.Open;
  end;
  If Entidade.IsEmpty Then
  Begin
    edtDesconto.Clear;
    edtCodigoPRD.Clear;
    edtProduto.Clear;
    edtPrecoCompra.Clear;
    edtQuantidade.Clear;
  End;
end;

procedure TfMxCotacao.SB_SalvaClick(Sender: TObject);
var
   mensagem:string;
begin
  mensagem:='';
  if edtProduto.text = '' then
    mensagem:=mensagem+'Nome do produto digitado incorretamente!'+#13;
  if not VerificaFloat(edtQuantidade.text) then
    mensagem:=mensagem+'Quantidade digitada incorretamente!'+#13;
  if not VerificaFloat(edtPrecoCompra.text) then
    mensagem:=mensagem+'Preço digitado incorretamente!'+#13;
  if not VerificaFloat(edtFrete.text) then
    mensagem:=mensagem+'Frete digitado incorretamente!'+#13;
  if edtFornecedor.text = '' then
    mensagem:=mensagem+'Nome do fornecedor digitado incorretamente!';
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if Entidade.FinalizaEdicao then
    AtualizaControles(False,False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxCotacao.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False,False);
  If Entidade.IsEmpty Then
  Begin
    edtDesconto.Clear;
    edtCodigoPRD.Clear;
    edtProduto.Clear;
    edtPrecoCompra.Clear;
    edtQuantidade.Clear;
  End;
end;

procedure TfMxCotacao.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  {
  if tag = 0 then
    self.Caption := 'Cotação/Proposta de compra';
  if tag = 1 then
    self.Caption := 'Cotação/Proposta de venda';
  }
  Parametro1.Open;
  Forma_de_Pagamento1.Open;
  AgenteFin1.Open;
  MapaCotacao1.Close;
  MapaCotacao1.SQL.Text := 'SELECT * FROM MAPA_DE_COTACAO '+
    ' WHERE MCT_CODIGO=-1 ';
  MapaCotacao1.Open;
end;

procedure TfMxCotacao.MapaCotacao1AfterScroll(DataSet: TDataSet);
begin
  MapaCotacao1.CarregaDados;
  If Entidade.IsEmpty Then
  Begin
    edtDesconto.Clear;
    edtCodigoPRD.Clear;
    edtProduto.Clear;
    edtPrecoCompra.Clear;
    edtQuantidade.Clear;
  End;  
end;

procedure TfMxCotacao.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxCotacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxCotacao.SB_FehcarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxCotacao.SB_Novo2Click(Sender: TObject);
begin
  MapaCotacao1.Close;
  MapaCotacao1.SQL.Text := 'SELECT * FROM MAPA_DE_COTACAO '+
    ' WHERE MCT_CODIGO=-1 ';
  MapaCotacao1.Open;
  MapaCotacao1.PreparaInsercao;  
  edtCodigoPRD.Clear;
  edtProduto.Clear;
  edtQuantidade.Clear;
  edtPrecoCompra.Clear;
  edtDesconto.Clear;
  if tag = 1 then
    ckbVenda.Checked := True
  else
    ckbVenda.Checked := False;
  AtualizaControles(True,True);
  dblTipoPagamento.KeyValue := 5;
  dblTipoPagamentoClick(sender);
  edtDescricao.SetFocus;
end;

procedure TfMxCotacao.SB_Alt2Click(Sender: TObject);
begin
  if MapaCotacao1.IsEmpty then
    Raise Exception.Create('Selecione uma cotação para ser alterada!');
  MapaCotacao1.PreparaAlteracao;
  AtualizaControles(True,True);
  edtDescricao.SetFocus;
end;

procedure TfMxCotacao.SB_Exc2Click(Sender: TObject);
var
  CdCNC, CdMCT:integer;
begin
  if MapaCotacao1.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  CdCNC := MapaCotacao1.CodigoCNC;
  CdMCT := MapaCotacao1.CodigoMCT;
  if MapaCotacao1.deletarauto then
  Begin
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_MAPA_DE_COTACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND MCT_CODIGO='+IntToStr(CdMCT));
    MapaCotacao1.Close;
    MapaCotacao1.sql.Text := 'SELECT * FROM MAPA_DE_COTACAO '+
      ' WHERE MCT_CODIGO=-1 ';
    MapaCotacao1.Open;
  end;
end;

procedure TfMxCotacao.SB_Salva2Click(Sender: TObject);
var
   CdCNC, CdMCT:integer;
begin
  CdCNC := DM.Configuracao1.CodigoCNC;
  CdMCT := StrToInt(edtCodigoMCT.Text);
  if MapaCotacao1.FinalizaEdicao then
  Begin
    AtualizaControles(True,False);
    MapaCotacao1.Close;
    MapaCotacao1.SQL.Text := 'SELECT * FROM MAPA_DE_COTACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND MCT_CODIGO='+IntToStr(CdMCT);
    MapaCotacao1.Open;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxCotacao.SB_Canc2Click(Sender: TObject);
begin
  MapaCotacao1.CancelaEdicao;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  SB_Novo2.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Alt2.Enabled:=True;
  SB_Exc2.Enabled:=True;
  SB_Salva2.Enabled:=False;
  SB_Canc2.Enabled:=False;
  Incluir1.Enabled:=True;
  Alterar1.Enabled:=True;
  Excluir1.Enabled:=True;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  IncluirItem.Enabled:=True;
  AlterarItem.Enabled:=True;
  ExcluirItem.Enabled:=True;
  SalvarItem.Enabled:=False;
  CancelarItem.Enabled:=False;
end;

procedure TfMxCotacao.SB_LocClick(Sender: TObject);
begin
  if SB_Salva.Enabled or SB_Salva2.Enabled then
    raise Exception.Create('Salve antes de sair!');
  Application.CreateForm(TfMxSSelCotacao, fMxSSelCotacao);
  if tag = 1 then // Cotação de Venda
  begin
    fMxSSelCotacao.CotacaoVenda := True;
    fMxSSelCotacao.Caption := 'Pesquisa de Cotação de venda';
  end
  else
  begin
    fMxSSelCotacao.CotacaoVenda := False;
    fMxSSelCotacao.Caption := 'Pesquisa de Cotação de compra';
  end;

  fMxSSelCotacao.ShowModal;
end;

procedure TfMxCotacao.SB_ImprimirClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione a Cotação!');
  if not ckbVenda.Checked then
  Begin
    Application.CreateForm(Trpt_Cotacao, rpt_Cotacao);
    with rpt_Cotacao do
    Begin
      qry_cotacao.ParamByName('MCT_CODIGO').asInteger := fMxCotacao.MapaCotacao1.CodigoMCT;
      qry_cotacao.Open;
      qry_Icotacao.ParamByName('MCT_CODIGO').asInteger := fMxCotacao.MapaCotacao1.CodigoMCT;
      qry_Icotacao.Open;
      report.Preview;
      Close;
    end;
  end
  else
  Begin
    Application.CreateForm(TfMxSelOrcamento, fMxSelOrcamento);
    with fMxSelOrcamento do
    Begin
      tag := 0;
      edtContato.Text := edtDescricao.Text;
      CdCNC := fMxCotacao.Entidade.CodigoCNC;
      CdMCT := fMxCotacao.Entidade.CodigoMCT;
      ShowModal;
    end;
  end;
end;

procedure TfMxCotacao.edtCodigoFORExit(Sender: TObject);
begin
  if SB_Canc2.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoFOR.Text) then
    edtCodigoFOR.Text := '0';

  if (StrToInt(edtCodigoFOR.Text) = 0) and (not ckbVenda.Checked) then
  Begin
    edtFornecedor.Enabled:=True;
    edtFornecedor.Color:=clWindow;
    edtFornecedor.SetFocus;
  end
  else
  Begin
    if not ckbVenda.Checked then
    Begin
      with Fornecedor1 do
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger:=StrToInt(edtCodigoFOR.Text);
        Open;
        if IsEmpty then
        Begin
          ShowMessage('Código de Fornecedor inválido!');
          edtCodigoFOR.SetFocus;
          Exit;
        end
        else
          edtFornecedor.Text := RazaoSocial;
      end;
    end
    else
    Begin
      with Cliente1 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
        ParamByName('CLI_CODIGO').asInteger:=StrToInt(edtCodigoFOR.Text);
        Open;
        if IsEmpty then
        Begin
          ShowMessage('Código de Cliente inválido!');
          edtCodigoFOR.SetFocus;
          Exit;
        end
        else
          edtFornecedor.Text := RazaoSocial;
      end;
    end;
    edtFornecedor.Enabled:=False;
    edtFornecedor.Color:=AlteraCorComponentes;
    if edtDescricao.Text = '' then
      edtDescricao.SetFocus
    else
      edtObservacao.SetFocus;
  end;
end;

procedure TfMxCotacao.Item_de_Mapa_de_Cotacao1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxCotacao.FormCreate(Sender: TObject);
begin
  Entidade:=Item_de_Mapa_de_Cotacao1;
end;

procedure TfMxCotacao.edtCodigoPRDExit(Sender: TObject);
begin
  if SB_Canc.Focused then
    Exit;
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
  Begin
    edtProduto.Clear;
    edtCodigoPRD.Text := '0';
  end;

  if StrToInt(edtCodigoPRD.Text) = 0 then
  Begin
    edtProduto.Enabled:=True;
    edtProduto.Color:=clWindow;
    edtProduto.SetFocus;
  end
  else
  Begin
    Produto1.Close;
    Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
    Produto1.Open;
    if Produto1.IsEmpty then
    Begin
      ShowMessage('Código do Produto inválido!');
      edtProduto.Clear;
      edtCodigoPRD.SetFocus;
    end
    else
    Begin
      if DM.Configuracao1.Empresa = 1 then
        edtProduto.Text:=Trim(Produto1.Descricao+' '+Produto1.Caracteristica)
      else if DM.Configuracao1.Empresa = empLBM then
        edtProduto.Text := Produto1.Descricao+' '+Produto1.Referencia+', '+Produto1.Marca+' '+Produto1.Unidade
      else
        edtProduto.Text:=Produto1.Descricao;
      edtProduto.Enabled:=False;
      edtProduto.Color:=AlteraCorComponentes;
      edtQuantidade.SetFocus;
    end;
  end;
end;

procedure TfMxCotacao.edtCodigoFORChange(Sender: TObject);
begin
  if SB_Salva2.Enabled then
    edtFornecedor.Clear;
end;

procedure TfMxCotacao.Item_de_Mapa_de_Cotacao1CalcFields(
  DataSet: TDataSet);
var
  vPreco:double;
begin
  with Entidade do
  Begin
    vPreco:=(CalculaDesconto(Preco,Desconto));
    vPreco:=vPreco+vPreco*MapaCotacao1.FRETE/100;
    FieldByName('PrecoFinal').asString:=format('%.2f',[vPreco*Quantidade]);
  end;
end;

procedure TfMxCotacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=chr(27)) and (SB_Canc2.Enabled) then
  Begin
    key:=chr(0);
    SB_Canc2.SetFocus;
    SB_Canc2Click(sender);
  end
  else if (key=chr(27)) and (SB_Canc.Enabled) then
  Begin
    key:=chr(0);
    SB_Canc.SetFocus;
    SB_CancClick(sender);
  end
  else if key=chr(27) then
  Begin
    key:=chr(0);
    Close;
  end
  else if Key=chr(13) then
  Begin
    if SB_Salva2.Enabled then
    begin
      key:=chr(0);
      SB_Salva2Click(SB_Salva2);
    end
    else
    begin
      if SB_Salva.Enabled then
      Begin
        key:=chr(0);
        if edtQuantidade.Text = '' then
          edtQuantidade.Text := '1';
        if edtPrecoCompra.Text = '' then
          edtPrecoCompra.SetFocus
        else
        Begin
          SB_Salva.SetFocus;
          SB_SalvaClick(sender);
        end;
      end;
    end;
  end
  Else If (edtCodigoFOR.Focused) and (key=chr(32)) then
  Begin
    key:=chr(0);
    edtFornecedor.Clear;
    if ckbVenda.Checked then
    Begin
      key:=chr(0);
      Application.CreateForm(TfCadCli, fCadCli);
      fCadCli.tag:=20;
      fCadCli.CentroCusto2.open;
      if DM.Configuracao1.Empresa = empLBM then
        fCadCli.CentroCusto2.LocalizarCod(0)
      else
        fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
      fCadCli.dblCentroDeCusto.KeyValue:=fCadCli.CentroCusto2.CodigoCNC;
      fCadCli.Showmodal;
    end
    else
    Begin
      Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
      with fMxSCotaFor do
      Begin
        tag:=10;
        Fornecedor1.Close;
        Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
        Fornecedor1.Open;
        ShowModal;
      end;
    end;
  end
  else If (edtCodigoPRD.Focused) and (key=chr(32)) then
  Begin
    key:=chr(0);
    edtCodigoPRD.Clear;
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=1;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=1;
        ShowModal;
      end;
    end;
    edtQuantidade.SetFocus;
  End
  else if (Key = '"') then
    key:=chr(0);
end;

procedure TfMxCotacao.AtualizaControles(Cabecalho, Habilitar: Boolean);
begin
  SB_Novo2.Enabled    := not Habilitar;
  SB_Loc.Enabled      := not Habilitar;
  SB_Alt2.Enabled     := not Habilitar;
  SB_Exc2.Enabled     := not Habilitar;
  SB_Salva2.Enabled   := ((Cabecalho) AND (Habilitar));
  SB_Canc2.Enabled    := ((Cabecalho) AND (Habilitar));
  SB_Prim.Enabled     := not Habilitar;
  SB_Ant.Enabled      := not Habilitar;
  SB_Prox.Enabled     := not Habilitar;
  SB_Ult.Enabled      := not Habilitar;
  SB_Novo.Enabled     := not Habilitar;
  SB_Alt.Enabled      := not Habilitar;
  SB_Exc.Enabled      := not Habilitar;
  SB_Salva.Enabled    := ((not Cabecalho) AND (Habilitar));
  SB_Canc.Enabled     := ((not Cabecalho) AND (Habilitar));
  Incluir1.Enabled    := not Habilitar;
  Alterar1.Enabled    := not Habilitar;
  Excluir1.Enabled    := not Habilitar;
  Localizar1.Enabled  := not Habilitar;
  Salvar1.Enabled     := ((Cabecalho) AND (Habilitar));
  Cancelar1.Enabled   := ((Cabecalho) AND (Habilitar));
  IncluirItem.Enabled    := not Habilitar;
  AlterarItem.Enabled    := not Habilitar;
  ExcluirItem.Enabled    := not Habilitar;
  SalvarItem.Enabled     := ((not Cabecalho) AND (Habilitar));
  CancelarItem.Enabled   := ((not Cabecalho) AND (Habilitar));
  SB_Imprimir.Enabled := not Habilitar;
  SB_Fehcar.Enabled   := not Habilitar;
end;

procedure TfMxCotacao.MapaCotacao1AfterOpen(DataSet: TDataSet);
begin
  MapaCotacao1.CarregaDados;
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxCotacao.dblTipoPagamentoClick(Sender: TObject);
begin
  dblAgenteFinanceiro.KeyValue:=0;
  if (dblTipoPagamento.KeyValue = 5) then //Dinheiro
  Begin
    With AgenteFin1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_CODIGO=1'; //Carteira
      Open;
    end;
    dblFormaDePagamento.KeyValue := 1; //Á Vista
    dblFormaDePagamento.Enabled := False;
    dblAgenteFinanceiro.KeyValue := 1;
    dblAgenteFinanceiro.Enabled := False;
  end
  else
  Begin
    dblFormaDePagamento.Enabled := True;
    dblAgenteFinanceiro.Enabled := True;
    If dblTipoPagamento.KeyValue = 13 then //Cartão
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_DIA_PAGAMENTO > 0 AND AGF_CODIGO<>1';
        Open;
      End;
      if dblTipoPagamento.Focused then
      Begin
        dblFormaDePagamento.KeyValue := 8; // Forma em 0 + 1
        dblAgenteFinanceiro.KeyValue := 8; //Mastercard
      end;
    end
    Else if dblTipoPagamento.KeyValue = 6 then//Cheque
    Begin
      if dblFormaDePagamento.KeyValue = 1 then
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_CODIGO=1'; //Carteiro ou Cheque-PRE
          Open;
          dblAgenteFinanceiro.KeyValue:=1;
        End
      else if dblFormaDePagamento.KeyValue > 1 then
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_CODIGO=6'; //Cheque-PRE
          Open;
          dblAgenteFinanceiro.KeyValue:=6;
        End;
    end
    else
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE (AGF_DIA_PAGAMENTO = 0 OR AGF_DIA_PAGAMENTO IS NULL) AND AGF_CODIGO<>1 AND AGF_CODIGO<>6'; //Diferente de Carteira
        Open;
      End;
  End;
end;

procedure TfMxCotacao.DBGrid1TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
