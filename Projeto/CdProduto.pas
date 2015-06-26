unit CdProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, ExtCtrls, Db, DBTables,
  SQuery, Produto, CategProd, Classificacao_fiscal, Origem_Fiscal,
  SubGrupo, Grupo, Fornecedor, Menus, Produto_por_Fornecedor,
  Item_de_Estoque, Item_Pedido_Venda, JPEG, Usuario, Mensagem, ComCtrls,
  Parametro, ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,
  ActnMenus;

type
  vetorBaseRealEixo = array[1..3] of string;
  TfCadProdutos = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoPRD: TEdit;
    dblOrigemFiscal: TDBLookupComboBox;
    dblGrupo: TDBLookupComboBox;
    dblClassificacaoFiscal: TDBLookupComboBox;
    edtProduto: TEdit;
    edtUnidade: TEdit;
    mskUltimaCompra: TMaskEdit;
    edtPrecoCompra: TEdit;
    edtPrecoCusto: TEdit;
    edtPrecoMinimo: TEdit;
    edtPrecoVenda: TEdit;
    edtEstoqueMinimo: TEdit;
    edtVolume: TEdit;
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
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    labDescPrecoCusto: TLabel;
    labDescPrecoMinimo: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    labDescPrecoCompra: TLabel;
    Produto1: TProduto;
    Fornecedor1: TFornecedor;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    Origem_Fiscal1: TOrigem_Fiscal;
    DSProduto1: TDataSource;
    DSGrupo1: TDataSource;
    DSSubgrupo1: TDataSource;
    DSOrigemFiscal1: TDataSource;
    DsClassificacaoFiscal1: TDataSource;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Label18: TLabel;
    Label21: TLabel;
    edtMarca: TEdit;
    edtReferencia: TEdit;
    Produto_por_Fornecedor1: TProduto_por_Fornecedor;
    SB_CalcularPreco: TSpeedButton;
    Item_de_Estoque1: TItem_de_Estoque;
    edtCodigoFOR: TEdit;
    cmbSituacao: TComboBox;
    Label22: TLabel;
    edtLocalEstoque: TEdit;
    Label23: TLabel;
    Produto1PRD_CODIGO: TIntegerField;
    Produto1CNC_CODIGO: TIntegerField;
    Produto1FOR_CODIGO: TIntegerField;
    Produto1CTP_CODIGO: TIntegerField;
    Produto1SGP_CODIGO: TIntegerField;
    Produto1GRP_CODIGO: TIntegerField;
    Produto1CLF_CODIGO: TIntegerField;
    Produto1ORF_CODIGO: TIntegerField;
    Produto1PRD_DESCRICAO: TStringField;
    Produto1PRD_UNIDADE: TStringField;
    Produto1PRD_MARCA: TStringField;
    Produto1PRD_PRECO_COMPRA: TFloatField;
    Produto1PRD_REFERENCIA: TStringField;
    Produto1PRD_DT_ULT_COMPRA: TDateTimeField;
    Produto1PRD_CUSTO: TFloatField;
    Produto1PRD_PRECO_MEDIO: TFloatField;
    Produto1PRD_PRECO_VENDA: TFloatField;
    Produto1PRD_EST_MINIMO: TFloatField;
    Produto1PRD_EST_MEDIO: TFloatField;
    Produto1PRD_COMISSAO: TFloatField;
    Produto1USU_CODIGO: TIntegerField;
    Produto1PRD_DT_ALTERADO: TDateTimeField;
    Produto1PRD_SITUACAO: TIntegerField;
    Produto1PRD_LOCAL: TStringField;
    Produto1PRD_DETALHE: TStringField;
    edtDetalhe: TEdit;
    Label24: TLabel;
    Label5: TLabel;
    dblCategoriaProduto: TDBLookupComboBox;
    Classificacao_fiscal2: TClassificacao_fiscal;
    DSClassificacao_fiscal2: TDataSource;
    Bevel1: TBevel;
    Label17: TLabel;
    Image1: TImage;
    Label25: TLabel;
    edtCaracteristicas: TEdit;
    labObservacao: TLabel;
    edtObservacao: TEdit;
    Label27: TLabel;
    edtPesoLiquido: TEdit;
    Produto1PRD_DT_CADASTRO: TDateTimeField;
    Produto1PRD_CARACTERISTICA: TStringField;
    Produto1PRD_OBSERVACAO: TStringField;
    Produto1PRD_PESO_LIQUIDO: TFloatField;
    ckbForaPrevisao: TCheckBox;
    ckbForaTabela: TCheckBox;
    Produto1PRD_FORA_TABELA: TIntegerField;
    Produto1PRD_FORA_PREVISAO: TIntegerField;
    Panel3: TPanel;
    Etiquetas1: TProduto;
    SB_GerarProdutos: TSpeedButton;
    ckbInsumo: TCheckBox;
    Produto1PRD_INSUMO: TIntegerField;
    dblSubGrupo: TDBLookupComboBox;
    Produto1PRD_BASE_REAL: TFloatField;
    edtBaseReal: TEdit;
    Produto1PRD_SERVICO: TIntegerField;
    Produto1PRD_TEMPO_MEDIO: TIntegerField;
    Produto1PRD_NIVEL: TIntegerField;
    Mensagem3: TMensagem;
    Usuario3: TUsuario;
    ckbForaDeLinha: TCheckBox;
    Produto1PRD_FORA_DE_LINHA: TIntegerField;
    ckbCatalogo: TCheckBox;
    Produto1PRD_CATALOGO: TIntegerField;
    Produto1PRD_PREVISAO: TIntegerField;
    Label10: TLabel;
    dblClassificacao: TDBLookupComboBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Produto1PRD_CLASSIFICACAO: TIntegerField;
    Produto1PRD_ESTOQUE_DETALHADO: TIntegerField;
    ckbEstoqueDetalhado: TCheckBox;
    ckbSomenteAtivados: TCheckBox;
    bitEstoqueGeral: TBitBtn;
    SB_EnviarSite: TSpeedButton;
    SB_Insumos: TSpeedButton;
    SB_CodigoBarras: TSpeedButton;
    SB_Imprimir: TSpeedButton;
    SB_Etiquetas: TSpeedButton;
    SB_Fechar: TBitBtn;
    Label11: TLabel;
    edtNCM: TEdit;
    edtPrevisao: TEdit;
    Produto1PRD_NCM: TStringField;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    SairCab: TAction;
    CadastrarLote1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
//    Label11: TLabel;
//    edtNCM: TEdit;
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
    procedure SB_CalcularPrecoClick(Sender: TObject);
    procedure dblClassificacaoFiscalClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Label23DblClick(Sender: TObject);
    procedure SB_EtiquetasClick(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure SB_GerarProdutosClick(Sender: TObject);
    procedure SB_InsumosClick(Sender: TObject);
    procedure SB_CodigoBarrasClick(Sender: TObject);
    procedure SB_EnviarSiteClick(Sender: TObject);
    procedure Grupo1AfterScroll(DataSet: TDataSet);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure ckbSomenteAtivadosClick(Sender: TObject);
    procedure CadastrarLote1Click(Sender: TObject);
    procedure bitEstoqueGeralClick(Sender: TObject);
  private
    vPrecoVendaAnt: Double;
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
  public
    Entidade:TProduto;
    vInsumo:Boolean;
end;

var
  fCadProdutos: TfCadProdutos;

implementation
uses UDM, CdFornecedor, funcoes, MxCalcPrecoVenda, MxSCotaFor,
  MxFotoAmpliada, MxProdutoSite, UProduto, Grau, CdInsumos, CdCodigoBarras,
  MxSPediProd, CdLote, MxEstoqueGeral, MxSPediProdMotCal;
{$R *.DFM}




procedure TfCadProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if self.Tag = 1 then //Pedido de Compra
  Begin
    if DM.Configuracao1.Empresa in TEmpresasLocProdutoEsp then
    begin
      fMxSPedProdMotCal.edtLocalizar.Text := IntToStr(Entidade.CodigoPRD);
      fMxSPedProdMotCal.cmbCampo.ItemIndex := 0;
    end
    else
    begin
      fMxSPedProd.edtLocalizar.Text := IntToStr(Entidade.CodigoPRD);
      fMxSPedProd.cmbCampo.ItemIndex := 0;
    end;
  end;
  if self.Tag <> 1 then //Pedido de Compra
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_CadPRD_');
  except
  end;

  Entidade.Close;
  Fornecedor1.Close;
  SubGrupo1.Close;
  Grupo1.Active:=false;
  Classificacao_Fiscal1.Close;
  Classificacao_Fiscal2.Close;
  Origem_Fiscal1.Close;
  Produto_por_Fornecedor1.Close;
  Action:=Cafree;
end;


procedure TfCadProdutos.FormCreate(Sender: TObject);
begin
  Entidade:=Produto1;
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    labDescPrecoCusto.Caption := 'Preço Tabela';
    DBGrid5.Columns[14].Title.Caption := 'Tabela';//Custo
  end;
  Parametro1.Open;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_CadPRD_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfCadProdutos.Produto1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadProdutos.SB_PrimClick(Sender: TObject);
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

procedure TfCadProdutos.SB_AntClick(Sender: TObject);
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

procedure TfCadProdutos.SB_ProxClick(Sender: TObject);
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

procedure TfCadProdutos.SB_UltClick(Sender: TObject);
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

procedure TfCadProdutos.SB_AltCabClick(Sender: TObject);
begin
  vInsumo:=ckbInsumo.Checked;

  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(480)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Produto!');

  vPrecoVendaAnt := Arredonda(Entidade.Precovenda,iCasasDecimaisVenda);

  Entidade.PreparaAlteracao;
  if DM.Configuracao1.Empresa IN [empMotical] then //Luciano permite preços diferentes no Mesmo SubGrupo
  Begin
    edtPrecoMinimo.Enabled := False;
    edtPrecoVenda.Enabled := False;
  end;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7720)) < 0 then //Alterar Preço de Compra
    edtPrecoCompra.Enabled := False;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7730)) < 0 then //Alterar Preço de Custo
    edtPrecoCusto.Enabled := False;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7740)) < 0 then //Alterar Preço de Mínimo
    edtPrecoMinimo.Enabled := False;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(8000)) < 0 then //Alterar Preço de Venda  - EXTORNO DE MOVIMENTO DE CONTA CORRENTE (7880)
    edtPrecoVenda.Enabled := False;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(6130)) < 0 then //Alterar Origem e CLF
  Begin
    dblOrigemFiscal.Enabled := False;
    dblClassificacaoFiscal.Enabled := False;
  end;
  AtualizaControles(1,True);
  edtProduto.SetFocus;
end;

procedure TfCadProdutos.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(470)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Produto!');

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existe(m) pedido(s) de venda com esse produto!');

    Close;
    SQL.Text := 'SELECT PCP_CODIGO '+
      ' FROM ITEM_DE_PEDIDO_DE_COMPRA '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existe(m) pedido(s) de compra com esse produto!');

    Close;
    SQL.Text := 'SELECT NTF_CODIGO '+
      ' FROM ITEM_DE_NOTA_FISCAL '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existem Notas Fiscais com esse produto!');

    Close;
    SQL.Text := 'SELECT CDB_CODIGO_ENTRADA '+
      ' FROM CODIGO_DE_BARRAS '+
      ' WHERE CDB_CODIGO_ENTRADA='+IntToStr(Entidade.CodigoPRD);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existe(m) Código(s) de Barras com esse produto!');

    Close;
    SQL.Text := 'SELECT TRF_CODIGO '+
      ' FROM ITEM_DE_TRANSFERENCIA '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existe(m) Código(s) de Barras com esse produto!');

    Close;
    SQL.Text := 'SELECT MEC_CODIGO '+
      ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existe(m) Movimento(s) com esse produto!');
  end;

  Entidade.Deletarauto;

  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadProdutos.SB_SalvaCabClick(Sender: TObject);
var
  CdPRD, Sit, iEstado : integer;
begin
  CdPRD := StrToInt(edtCodigoPRD.Text);
  Sit  := cmbSituacao.ItemIndex;
  iEstado := Entidade.Estado;

  if (Entidade.Estado = 2) and //Alterar
     (Entidade.EstoqueDetalhado <> ckbEstoqueDetalhado.Checked) then
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(8110)) < 0 then
      raise Exception.Create('O usuário não tem permissão para definir Estoque Detalhado!');
    If MessageDlg('O tipo Estoque Detalhado está sendo alterado.'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    if not ckbEstoqueDetalhado.Checked then
    Begin
      ExecutaSQL(DM.QR_Comandos, 'DELETE FROM ITEM_DE_ESTOQUE_DETALHE '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD));
      Entidade.GeraLog(8110, DM.Configuracao1.CodigoCNC, CdPRD, '.DESMARCAR Desc: '+Entidade.Descricao);
    end
    else
    Begin
      with Item_de_Estoque1 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
        ParamByName('PRD_CODIGO').AsInteger := CdPRD;
        open;
      end;
      Entidade.GeraLog(8110, DM.Configuracao1.CodigoCNC, CdPRD, '.MARCAR Desc: '+Entidade.Descricao);
    end;
  end;

  if ckbInsumo.Checked<>vInsumo then
  begin
    if vInsumo then
    begin
      with DM.QR_Consultas do
      begin
        close;
        sql.Text:='SELECT * FROM INSUMO '+
          ' WHERE INS_PRD_CODIGO ='+ IntToStr(Entidade.CodigoPRD)+
          ' AND CNC_CODIGO ='+IntToStr(Entidade.CodigoCNC);
        open;
        if not IsEmpty then
        begin
          ShowMessage('Este produto é insumo de outros!');
          ckbInsumo.SetFocus;
          exit;
        end;
      end;
    end
    else
    begin
      with DM.QR_Consultas do
      begin
        close;
        sql.Text:='SELECT * FROM INSUMO '+
          ' WHERE PRD_CODIGO ='+ IntToStr(Entidade.CodigoPRD)+
          ' AND CNC_CODIGO ='+IntToStr(Entidade.CodigoCNC);
        open;
        if not IsEmpty then
        begin
          ShowMessage('Este produto possui insumos!');
          ckbInsumo.SetFocus;
          exit;
        end;
      end;
    end;
  end;

  //Verificar Fornecedor Existe
  If VerificaInteiroBranco(edtCodigoFOR.Text) then
  Begin
    with Fornecedor1 do
    Begin
      if CodigoFOR <> StrToInt(edtCodigoFOR.Text) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').AsInteger := StrToInt(edtCodigoFOR.Text);
        Open;
      end;
      If IsEmpty then
      Begin
        edtCodigoFOR.Clear;
        Raise Exception.create('Fornecedor não cadastrado!');
      End;
      edtCodigoFOR.text:=IntToStr(CodigoFor);
    end;
  End;

  if Entidade.FinalizaEdicao then
  Begin
    if Sit = 1 then
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_TABELA_DE_PRECO '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD));
    AtualizaControles(1,False);
    with Entidade do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD);
      Open;
    end;

    if (iEstado = 2) and //Produto Novo
       (vPrecoVendaAnt <> Arredonda(Entidade.Precovenda,iCasasDecimaisVenda)) then
    Begin
      If MessageDlg('Deseja << NÃO >> enviar Mensagem informando o novo preço?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Exit;
      Usuario3.Close;
      Usuario3.Open;
      Usuario3.First;
      Mensagem3.Open;
      while not Usuario3.Eof do
      Begin
        if not((Usuario3.CodigoCNC=DM.Configuracao1.CodigoCNC) and
               (Usuario3.CodigoUSU=DM.Configuracao1.CodigoUSU)) then
          Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,Usuario3.CodigoCNC,
            Usuario3.CodigoUSU,1,0,'AJUSTE DE PRECO PRD:'+IntToStr(CdPRD),
            'Preço Ant:'+format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[vPrecoVendaAnt])+#13+#10+
            'Preço Atual:'+format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Entidade.Precovenda])+#13+#10+
            'Produto '+Entidade.Descricao+' '+Entidade.Referencia ,
            ''(*OBS*),True,False,False);
        Usuario3.Next;
      end;
    end;

    //Cadastrar Código de Barras
    if (iEstado = 1) and
       (DM.Configuracao1.Empresa = empHOPE) then
      SB_CodigoBarrasClick(SB_SalvaCab);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadProdutos.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);

  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadProdutos.SB_LocCabClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
  CdPRD: integer;
begin
  Aux := Entidade.AfterScroll;
  Entidade.AfterScroll := nil;
  if edtLocalizar.Text <> '*' then
  Begin
    If cmbCampo.ItemIndex=0 then
    Begin
      if not VerificaInteiroBranco(edtLocalizar.Text) then
      Begin
        Entidade.AfterScroll := Aux;
        raise Exception.create('Código a ser localizado inválido!');
      end;
    end;
    if cmbCampo.ItemIndex=12 then //Código de Barras
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT MAX(P1.PRD_CODIGO) as PRD '+
          ' FROM PRODUTO P1, CODIGO_DE_BARRAS C1 '+
          ' WHERE P1.PRD_SERVICO=0 '+
          ' AND C1.CDB_CODIGO_BARRAS="'+edtLocalizar.Text+'" '+
          ' AND P1.PRD_CODIGO=C1.CDB_CODIGO_ENTRADA ';
        Open;
        try
          CdPRD := FieldByName('PRD').asInteger;
        except
          CdPRD := 0;
        end;
        with Entidade do
        Begin
          Close;
          SQL.Text := 'SELECT * FROM PRODUTO '+
            ' WHERE PRD_SERVICO=0 '+
            ' AND PRD_CODIGO='+IntToStr(CdPRD);
          Open;
        end;
      end;
    end
    else
      Entidade.Selecionar;
  end
  else
  Begin
    with Entidade do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM PRODUTO '+
        ' WHERE PRD_SERVICO=0 '+
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

procedure TfCadProdutos.SB_NovoCabClick(Sender: TObject);
begin
  vPrecoVendaAnt := -999;
  SB_Insumos.Enabled:=true;
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(460)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir Produto!');

  Entidade.PreparaInsercao;
  if DM.Usuario1.Permissoes.IndexOf(IntToStr(6130)) < 0 then //Alterar Origem e CLF
  Begin
    dblOrigemFiscal.Enabled := False;
    dblClassificacaoFiscal.Enabled := False;
  end;
  AtualizaControles(1,True);
  edtProduto.SetFocus;
end;

procedure TfCadProdutos.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfCadProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadProdutos.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ckbSomenteAtivados.Checked := True;

  if ( GetEmpresaComunicacao(DM.QR_Consultas) = 'LO' ) or
     ( GetEmpresaComunicacao(DM.QR_Consultas) = 'AC' ) then
    CadastrarLote1.Visible := true
  else
    CadastrarLote1.Visible := False;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7690)) < 0 then //Visualizar Preço de Compra
  Begin
    SB_CalcularPreco.Visible := False;
    labDescPrecoCompra.Visible := False;
    DBGrid5.Columns[12].Visible := False;
  end;
  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7700)) < 0 then //Visualizar Preço de Custo
  Begin
    labDescPrecoCusto.Visible := False;
    DBGrid5.Columns[14].Visible := False;
  end;
  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7710)) < 0 then //Visualizar Preço de Mínimo
  Begin
    labDescPrecoMinimo.Visible := False;
    DBGrid5.Columns[15].Visible := False;
  end;

//  if not ckbInsumo.Visible then
//  Begin
//    labObservacao.Left  := 404;
//    edtObservacao.Left  := 404;
//    edtObservacao.Width := 349;
//  end;

  Grupo1.Open;
  SubGrupo1.Open;
  Classificacao_Fiscal1.Open;
  Classificacao_Fiscal2.Open;
  Origem_Fiscal1.Open;
  Entidade.Open;
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    cmbCampo.ItemIndex := 0
  else if DM.Configuracao1.Empresa in TEmpresasOtica then
  Begin
    SB_GerarProdutos.Visible := True;
    cmbCampo.ItemIndex := 1;
  end
  else if DM.Configuracao1.Empresa = empHope then
    cmbCampo.ItemIndex := 4
  else
    cmbCampo.ItemIndex := 1;

  if tag = 1 then //Localiza Produto
  Begin
    cmbCampo.ItemIndex := 0;

    if DM.Configuracao1.Empresa in TEmpresasLocProdutoEsp then
      edtLocalizar.Text := IntToStr(fMxSPedProdMotCal.Entidade.CodigoPRD)
    else
      edtLocalizar.Text := IntToStr(fMxSPedProd.Entidade.CodigoPRD);

    SB_LocCabClick(sender);
  end;
  try
    edtLocalizar.SetFocus;
  except
  end;
  //Anderson Gonçalves - 21/02/2013
  SB_EnviarSite.visible := false;
end;

procedure TfCadProdutos.SB_CalcularPrecoClick(Sender: TObject);
var
  vCusto: Double;
begin
  try
    vCusto := Arredonda(Arredonda(StrToFloat(edtPrecoCusto.Text)+Arredonda(StrToFloat(edtPrecoCusto.Text),iCasasDecimaisVenda)*DM.Configuracao1.PercentualLucro/100),iCasasDecimaisVenda);
    if (vCusto > 0) and (DM.Configuracao1.PercentualLucro > 0)then
      edtPrecoVenda.Text := format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[vCusto])
    else
      ShowMessage('Preço de Custo ou Percentual de Lucro zerado!');
  except
  end;
end;

procedure TfCadProdutos.dblClassificacaoFiscalClick(Sender: TObject);
begin
  if SB_SalvaCab.Enabled then
    if dblClassificacaoFiscal.KeyValue = 5 then
    Begin
      dblCategoriaProduto.Enabled  := True;
      dblCategoriaProduto.KeyValue := 1;
    end
    else
    Begin
      dblCategoriaProduto.Enabled  := False;
      dblCategoriaProduto.KeyValue := 0;
    end;
end;

procedure TfCadProdutos.Image1DblClick(Sender: TObject);
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

procedure TfCadProdutos.FormKeyPress(Sender: TObject; var Key: Char);
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
  else if (key=chr(32)) then
  Begin
    If (edtCodigoFOR.Focused) then
    Begin
      Key:=#0;
      Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
      fMxSCotaFor.Fornecedor1.Close;
      if DM.Configuracao1.Empresa = 2 then
        fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_NOME_FAN'
      else
        fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      fMxSCotaFor.Fornecedor1.Open;
      if VerificaInteiroBranco(edtCodigoFOR.Text) then
        fMxSCotaFor.Fornecedor1.LocalizarCod(StrToInt(edtCodigoFOR.Text));
      edtCodigoFOR.Clear;
      fMxSCotaFor.tag:=3;
      fMxSCotaFor.ShowModal;
    end;
  end
  else if Key=chr(13) then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end
  else if ((edtPrecoCompra.Focused)or(edtPrecoCusto.Focused)or(edtPrecoMinimo.Focused)or
           (edtPrecoVenda.Focused)or(edtEstoqueMinimo.Focused)or(edtVolume.Focused)or
           (edtPesoLiquido.Focused))and(Key = '.') then
    Key := ','
  else if (key = '"') then
    Key:=#0;
end;

procedure TfCadProdutos.Label23DblClick(Sender: TObject);
var
  foto:string;
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  try
    foto:=DM.Configuracao1.PastaImagens+'\Loja\'+
         edtLocalEstoque.Text+'.JPG';
    fMxFotoAmpliada.imgFotoAmpliada.Picture.LoadFromFile(foto);
  Except
    try
      foto:=DM.Configuracao1.PastaImagens+'\Loja\'+
         Copy(edtLocalEstoque.Text,1,3) +'.JPG';
      fMxFotoAmpliada.imgFotoAmpliada.Picture.LoadFromFile(foto);
    except
      fMxFotoAmpliada.imgFotoAmpliada.Picture:=nil;
    end;
  end;
  fMxFotoAmpliada.memRodapeFoto.Text := 'Local de Estoque: '+edtLocalEstoque.Text;
  fMxFotoAmpliada.ShowModal;
end;

procedure TfCadProdutos.SB_EtiquetasClick(Sender: TObject);
var
  iQuantidade: integer;
  sProduto, sCodigoBarras: string;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o produto!');
  Etiquetas1.Close;
  If MessageDlg('Deseja gerar etiquetas para todos os produtos selecionados?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Etiquetas1.SQL.Text := Entidade.SQL.Text
  else
    Etiquetas1.SQL.Text := 'SELECT * FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
  Etiquetas1.Open;
  if Etiquetas1.IsEmpty then
    Raise Exception.Create('Etiquetas NÃO foram geradas!');
  try
    iQuantidade := StrToInt(InputBox('Mala Direta', 'Quantidade', '1'));
  except
    ShowMessage('Quantidade inválida!');
    Exit;
  end;

  if (DM.Configuracao1.Empresa = empEletro) and
     (iQuantidade > 0) and
     (Etiquetas1.Estmedio > 1) then //Volume
    iQuantidade := Trunc(iQuantidade*Etiquetas1.Estmedio); //Volume

  Etiquetas1.LimpaEtiquetas;
  while not Etiquetas1.EOF do
  begin
    if DM.Configuracao1.Empresa = 1 then
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

    Etiquetas1.AdicionaEtiqueta(Etiquetas1.CodigoPRD, Etiquetas1.Precovenda,
      iQuantidade, sProduto, Etiquetas1.Referencia, Etiquetas1.Detalhe, Etiquetas1.Caracteristica, sCodigoBarras);
    Etiquetas1.Next;
  end;
  Etiquetas1.FechaEtiquetas;
  ShowMessage('Arquivo gerado com sucesso !');
  Etiquetas1.Close;
end;

procedure TfCadProdutos.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadProdutos.SB_ImprimirClick(Sender: TObject);
begin
  Application.CreateForm(Trpt_produto,rpt_produto);
  with rpt_produto do
  Begin
    tag := 6;
    Entidade.Close;
    Entidade.SQL.Text := fCadProdutos.Entidade.SQL.Text;
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfCadProdutos.SB_GerarProdutosClick(Sender: TObject);
var
  CdPRD, CdGRP, CdSGP, i, j, k, iQtdBases : integer;
  sDescSubGrupo, sDescEixo : string;
  sBaseChaveEixo: array of vetorBaseRealEixo;
  sEixos: array of string;
  Trans,vCompletarPRD:Boolean;
begin
  if Trim(edtProduto.Text) <> '' then
    Raise exception.Create('Produto com descrição!');
  If MessageDlg('Esse processo irá criar Produtos Automaticamente.'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  if dblSubGrupo.Text = '' then
    Raise exception.Create('Selecione o SubGrupo!');
  CdGRP := dblGrupo.KeyValue;
  CdSGP := dblSubGrupo.KeyValue;
  try
    CdPRD := StrToInt(edtCodigoPRD.Text);
  except
    ShowMessage('Código do Produto inválido!');
    Exit;
  end;

  //Verificar se já foram criados os produtos desse subgrupo
  vCompletarPRD := False;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 PRD_CODIGO '+
      ' FROM PRODUTO '+
      ' WHERE SGP_CODIGO='+IntToStr(dblSubGrupo.KeyValue);
    Open;
    if not IsEmpty then
    Begin
      If MessageDlg('Atenção!!!'+#13+
                    'SubGrupo com produtos já Cadastrados!'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit
      else
        vCompletarPRD := True;
    end;
  end;

  SetLength(sEixos, 1);
  sEixos[0] := '';
  j := 0;

  if Trim(SubGrupo1.Eixos) <> '' then
  Begin
    for i:=1 to Length(SubGrupo1.Eixos) do
      if SubGrupo1.Eixos[i] <> ';' then
        sEixos[j] := sEixos[j] + SubGrupo1.Eixos[i]
      else
      Begin
        SetLength(sEixos, High(sEixos)+2);
        inc(j);
        sEixos[j] := '';
      end;
  end;

  sDescSubGrupo := dblSubGrupo.Text;
  SetLength(sBaseChaveEixo, 1);
  sBaseChaveEixo[0][1] := '';
  sBaseChaveEixo[0][2] := '';
  sBaseChaveEixo[0][3] := sEixos[0];
  j := 0;

  for k:=0 to High(sEixos) do
  Begin
    if Trim(SubGrupo1.BaseChave) <> '' then
    Begin
      if sBaseChaveEixo[0][1] <> '' then
      Begin
        SetLength(sBaseChaveEixo, High(sBaseChaveEixo)+2);
        inc(j);
        sBaseChaveEixo[j][1] := '';
        sBaseChaveEixo[j][2] := '';
        sBaseChaveEixo[j][3] := '';
      end;
      for i:=1 to Length(SubGrupo1.BaseChave) do
        if SubGrupo1.BaseChave[i] <> ';' then
        Begin
          sBaseChaveEixo[j][1] := sBaseChaveEixo[j][1] + SubGrupo1.BaseChave[i];
          sBaseChaveEixo[j][2] := sBaseChaveEixo[j][2] + SubGrupo1.BaseChave[i];
          sBaseChaveEixo[j][3] := sEixos[k];
        end
        else
        Begin
          SetLength(sBaseChaveEixo, High(sBaseChaveEixo)+2);
          inc(j);
          sBaseChaveEixo[j][1] := '';
          sBaseChaveEixo[j][2] := '';
          sBaseChaveEixo[j][3] := '';
        end;
    end;
  end;

  if sBaseChaveEixo[0][3] = '' then
  Begin
    for i:=0 to High(sBaseChaveEixo) do
    Begin
      try
        sBaseChaveEixo[i][2] := format('%.2f',[
                            StrToFloat(InputBox('Definir Base Real', 'Base ('+sBaseChaveEixo[i][1]+'):', VirgPonto(sBaseChaveEixo[i][2],'.',',')))]);
      except
        ShowMessage('Base real inválida!');
        Exit;
      end;
    end;
  end;

  with DM.Grau1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM GRAU '+
      ' WHERE GRP_CODIGO=:GRP_CODIGO '+
      ' AND SGP_CODIGO=:SGP_CODIGO '+
      ' AND GRA_SITUACAO=0 '+
      ' ORDER BY GRA_GRAU ';
    ParamByName('GRP_CODIGO').asInteger := CdGRP;
    ParamByName('SGP_CODIGO').asInteger := CdSGP;
    Open;
    if IsEmpty then
      Raise exception.Create('Nenhum grau cadastrado para esse SubGrupo!');

    Trans:=false;
    with DM.Database2 do
    begin
      try
        Begin
          StartTransaction;
          Trans:=True;
        end;

        for i:=0 to High(sBaseChaveEixo) do
        Begin
          if Trim(sBaseChaveEixo[i][3]) <> '' then
            sDescEixo := ' EIXO '+Trim(sBaseChaveEixo[i][3])
          else
            sDescEixo := '';
          First;
          edtBaseReal.Text := sBaseChaveEixo[i][2];
          if i > 0 then
            Entidade.Estado := 1;
            Entidade.ProximoCodigo('PRD_CODIGO');
          if CH then
            edtProduto.Text := Trim(sDescSubGrupo)+' CH '
          else if Base then
            edtProduto.Text := Trim(sDescSubGrupo)+' Base '
          else if CB then //Curva Base (Lente de Contato)
            edtProduto.Text := Trim(sDescSubGrupo)+' CB '
          else
            edtProduto.Text := Trim(sDescSubGrupo)+' ';

          if DefinirOlho then
            edtProduto.Text := edtProduto.Text + Trim(sBaseChaveEixo[i][1])+sDescEixo+' '+Grau+' OD'
          else
            edtProduto.Text := edtProduto.Text + Trim(sBaseChaveEixo[i][1])+sDescEixo+' '+Grau;
          edtCodigoPRD.Refresh;
          edtProduto.Refresh;
          if Entidade.FinalizaEdicao then
          Begin
            with Entidade do
            Begin
              Close;
              SQL.TExt := 'SELECT * FROM PRODUTO '+
                ' WHERE PRD_CODIGO='+IntToStr(CdPRD);
              Open;
            end;
            if DefinirOlho then
            Begin
              Entidade.Estado := 1;
              Entidade.ProximoCodigo('PRD_CODIGO');
              if CH then
                edtProduto.Text := Trim(sDescSubGrupo)+' CH '
              else if Base then
                edtProduto.Text := Trim(sDescSubGrupo)+' Base '
              else if CB then
                edtProduto.Text := Trim(sDescSubGrupo)+' CB '
              else
                edtProduto.Text := Trim(sDescSubGrupo)+' ';

              edtProduto.Text := edtProduto.Text + Trim(sBaseChaveEixo[i][1])+sDescEixo+' '+Grau+' OE';

              edtCodigoPRD.Refresh;
              edtProduto.Refresh;
              SB_SalvaCabClick(sender);
            end;
            Next;
            while not Eof do
            Begin
              Entidade.Estado := 1;
              Entidade.ProximoCodigo('PRD_CODIGO');
              if CH then
                edtProduto.Text := Trim(sDescSubGrupo)+' CH '
              else if Base then
                edtProduto.Text := Trim(sDescSubGrupo)+' Base '
              else if CB then
                edtProduto.Text := Trim(sDescSubGrupo)+' CB '
              else
                edtProduto.Text := Trim(sDescSubGrupo)+' ';
              if DefinirOlho then
                edtProduto.Text := edtProduto.Text + Trim(sBaseChaveEixo[i][1])+sDescEixo+' '+Grau+' OD'
              else
                edtProduto.Text := edtProduto.Text + Trim(sBaseChaveEixo[i][1])+sDescEixo+' '+Grau;
              try
                SB_SalvaCab.SetFocus;
              except
              end;
              edtCodigoPRD.Refresh;
              edtProduto.Refresh;
              SB_SalvaCabClick(sender);
              if DefinirOlho then
              Begin
                Entidade.Estado := 1;
                Entidade.ProximoCodigo('PRD_CODIGO');
                if CH then
                  edtProduto.Text := Trim(sDescSubGrupo)+' CH '
                else if Base then
                  edtProduto.Text := Trim(sDescSubGrupo)+' Base '
              else if CB then
                edtProduto.Text := Trim(sDescSubGrupo)+' CB '
                else
                  edtProduto.Text := Trim(sDescSubGrupo)+' ';
                edtProduto.Text := edtProduto.Text + Trim(sBaseChaveEixo[i][1])+sDescEixo+' '+Grau+' OE';
                try
                  SB_SalvaCab.SetFocus;
                except
                end;
                edtCodigoPRD.Refresh;
                edtProduto.Refresh;
                SB_SalvaCabClick(sender);
              end;
              Next;
            end;
          end;
        end;

        Commit;
      except
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
      end;
    End;
  end;
  Entidade.Close;
  Entidade.SQL.TExt := 'SELECT * FROM PRODUTO '+
    ' WHERE GRP_CODIGO='+IntToStr(CdGRP)+
    ' AND SGP_CODIGO='+IntToStr(CdSGP)+
    ' ORDER BY PRD_DESCRICAO ';
  Entidade.Open;
end;

procedure TfCadProdutos.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
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
  SB_CalcularPreco.Enabled := Habilitar;
  ckbSomenteAtivados.Enabled := not Habilitar;

  if (not DM.Configuracao1.EstoqueDetalhado) or
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(8110)) < 0) then
    ckbEstoqueDetalhado.Enabled := False
  else
    ckbEstoqueDetalhado.Enabled := Habilitar;

  SB_GerarProdutos.Enabled := Habilitar;
  SB_CodigoBarras.Enabled  := not Habilitar;
  SB_Insumos.Enabled       := not Habilitar;
  SB_EnviarSite.Enabled    := not Habilitar;
  SB_Imprimir.Enabled      := not Habilitar;
  SB_Etiquetas.Enabled     := not Habilitar;
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

procedure TfCadProdutos.SB_InsumosClick(Sender: TObject);
begin
  if (ckbInsumo.Checked) then
    Raise exception.Create('Este produto não pode ter insumos!');

  if (not (entidade.IsEmpty)) then
  begin
    Application.CreateForm(TfcadInsumos, fcadInsumos);
    fcadInsumos.tag := 0;
    fcadInsumos.imgPRD.Picture:=Image1.Picture;
    fcadInsumos.edtCodigoPRD.Text:=edtCodigoPRD.text;
    fcadInsumos.edtDescricaoPRD.Text:=edtProduto.Text;
    fcadInsumos.edtPrecoCompra.Text:=edtPrecoCompra.Text;
    fcadInsumos.ShowModal;
  end
  else
  begin
    Showmessage('Selecione um Produto!');
    edtLocalizar.SetFocus;
    exit;
  end;
end;

procedure TfCadProdutos.SB_CodigoBarrasClick(Sender: TObject);
begin
  if Entidade.isEmpty then
    raise Exception.Create('Selecione um produto!');

  Application.CreateForm(TfCadCodigoBarras, fCadCodigoBarras);
  with fcadCodigoBarras do
  Begin
    if Sender = SB_SalvaCab then
      Tag := 0
    else
      Tag := 1;
    edtCodigoCDB_Entrada.Text := IntToStr(self.Entidade.CodigoPRD);
    edtDescricao.Text         := self.edtProduto.Text;
    Showmodal;
  end;
end;

procedure TfCadProdutos.SB_EnviarSiteClick(Sender: TObject);
begin
  Application.CreateForm(TfMxProdutoSite, fMxProdutoSite);
  fMxProdutoSite.Tag:=0;
  fMxProdutoSite.Showmodal;
end;

procedure TfCadProdutos.Grupo1AfterScroll(DataSet: TDataSet);
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

procedure TfCadProdutos.DBGrid5TitleClick(Column: TColumn);
begin
  if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
    Exit;
  Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
end;

procedure TfCadProdutos.ckbSomenteAtivadosClick(Sender: TObject);
begin
  if ckbSomenteAtivados.Checked then
    Entidade.Selecao.Text := ' AND PRD_SERVICO=0 AND (PRD_SITUACAO=0 OR PRD_SITUACAO IS NULL) '
  else
    Entidade.Selecao.Text := ' AND PRD_SERVICO=0 ';
  if Trim(edtLocalizar.Text) <> '' then
    SB_LocCabClick(sender);
end;

procedure TfCadProdutos.CadastrarLote1Click(Sender: TObject);
begin
  if DM.Configuracao1.Empresa <> empLuciano then
    Exit;
    
  if Entidade.isempty then
    Raise exception.Create('Selecione o Produto!');

  Application.CreateForm(TfCadLote, fCadLote);
  with fCadLote do
  Begin
    tag:=0;
    edtCodigoPRD.text := self.edtCodigoPRD.Text;
    edtProduto.Text := self.edtProduto.Text;
    ShowModal;
  end;
end;

procedure TfCadProdutos.bitEstoqueGeralClick(Sender: TObject);
begin
  Application.CreateForm(TfMxEstoqueGeral, fMxEstoqueGeral);
  with fMxEstoqueGeral do
  Begin
    Tag := 1;
    if VerificaInteiroBranco(self.edtCodigoPRD.Text) then
      edtCodigoPRD.Text := self.edtCodigoPRD.Text
    else
      edtCodigoPRD.Text := '0';
    SB_LocClick(sender);
    ShowModal;
  end;
end;

end.
