unit MxTransferencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Classificacao_fiscal, Mov_Est_Fiscal, NotaFiscal, Item_Nota_Fiscal,
  Movimento_Estoque_Comercial, Movimento_Fisico, Item_de_Estoque, Menus,
  Produto, CentroCusto, Item_de_Transferencia, Transferencia, ComCtrls,
  DBCtrls, Variants, Cod_Barr, Forma_de_Pagamento, Funcionario, Parametro,
  IniFiles, ShellApi;

type
  TfMxTransfer = class(TForm)
    Panel3: TPanel;
    Label20: TLabel;
    Label10: TLabel;
    memObservacao: TMemo;
    Label27: TLabel;
    Panel5: TPanel;
    SB_Processar: TSpeedButton;
    Panel6: TPanel;
    DBGrid5: TDBGrid;
    Label23: TLabel;
    Label19: TLabel;
    edtCodigoTRF: TEdit;
    Label22: TLabel;
    Label21: TLabel;
    edtNumeroItens: TEdit;
    Label14: TLabel;
    dblCNCOrigem: TDBLookupComboBox;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    edtCodigoPRD: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    edtProduto: TEdit;
    edtUnidade: TEdit;
    Label16: TLabel;
    Label5: TLabel;
    edtMarca: TEdit;
    edtQuantidade: TEdit;
    Label18: TLabel;
    dblCNCDestino: TDBLookupComboBox;
    Label2: TLabel;
    SB_PrimPed: TSpeedButton;
    SB_AntPed: TSpeedButton;
    SB_ProxPed: TSpeedButton;
    SB_UltPed: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    Transferencia1: TTransferencia;
    Item_de_Transferencia1: TItem_de_Transferencia;
    DSTransferencia1: TDataSource;
    mskCadastro: TMaskEdit;
    CentroCusto1: TCentroCusto;
    CentroCusto2: TCentroCusto;
    DSCentroCusto1: TDataSource;
    DSCentroCusto2: TDataSource;
    Produto1: TProduto;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Transfere1: TMenuItem;
    IncluirPed: TMenuItem;
    AlterarPed: TMenuItem;
    N1: TMenuItem;
    SalvarPed: TMenuItem;
    CancelarPed: TMenuItem;
    Itens1: TMenuItem;
    Incluir1: TMenuItem;
    Excluir1: TMenuItem;
    N3: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    Item_de_Estoque1: TItem_de_Estoque;
    edtDisponivel: TEdit;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Transferencia1TRF_CODIGO: TIntegerField;
    Transferencia1CNC_CODIGO: TIntegerField;
    Transferencia1TRF_DATA: TDateTimeField;
    Transferencia1TRF_SITUACAO: TIntegerField;
    Transferencia1TRF_TOT_ITENS: TIntegerField;
    Transferencia1TRF_CNC_ORIGEM: TIntegerField;
    Transferencia1TRF_CNC_DESTINO: TIntegerField;
    SB_Fechar: TSpeedButton;
    DSItem_de_Transferencia1: TDataSource;
    Label6: TLabel;
    edtSituacao: TEdit;
    SB_Imprimir: TSpeedButton;
    mskAlterado: TMaskEdit;
    Label7: TLabel;
    Transferencia1CCOri: TStringField;
    Transferencia1CCDest: TStringField;
    CentroCusto3: TCentroCusto;
    Transferencia1Situacao: TStringField;
    Transferencia1USU_CODIGO: TIntegerField;
    Transferencia1TRF_DT_ALTERADO: TDateTimeField;
    Item_de_Transferencia1CNC_CODIGO: TIntegerField;
    Item_de_Transferencia1ITR_CODIGO: TIntegerField;
    Item_de_Transferencia1PRD_CODIGO: TIntegerField;
    Item_de_Transferencia1TRF_CODIGO: TIntegerField;
    Item_de_Transferencia1ITR_SITUACAO: TIntegerField;
    Item_de_Transferencia1Produto: TStringField;
    Produto2: TProduto;
    Item_de_Transferencia1ITR_QUANTIDADE: TFloatField;
    ckbAutomatica: TCheckBox;
    Transferencia1TRF_AUTOMATICA: TIntegerField;
    Transferencia1TRF_OBSERVACAO: TStringField;
    SB_Faturar: TSpeedButton;
    Label8: TLabel;
    edtReferencia: TEdit;
    Label9: TLabel;
    edtDetalhe: TEdit;
    Item_de_Transferencia1Referencia: TStringField;
    Item_de_Transferencia1Detalhe: TStringField;
    Item_de_Transferencia1Marca: TStringField;
    Label11: TLabel;
    edtNotaFiscal: TEdit;
    Item_Nota_Fiscal1: TItem_Nota_Fiscal;
    NotaFiscal1: TNotaFiscal;
    Transferencia1TRF_NOTA_FISCAL: TIntegerField;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Classificacao_fiscal2: TClassificacao_fiscal;
    Panel1: TPanel;
    Label12: TLabel;
    DateTimePicker1: TDateTimePicker;
    SB_Etiquetas: TSpeedButton;
    Etiquetas1: TProduto;
    PopupMenu1: TPopupMenu;
    Faturar1: TMenuItem;
    NotaFiscal2: TNotaFiscal;
    Item_Nota_Fiscal2: TItem_Nota_Fiscal;
    Item_de_Estoque2: TItem_de_Estoque;
    Item_de_Transferencia1Caracteristica: TStringField;
    edtPreco: TEdit;
    edtTotalTransf: TEdit;
    labDescTotalTranferencia: TLabel;
    labDesPreco: TLabel;
    Item_de_Transferencia1ITR_PRECO: TFloatField;
    Item_de_Transferencia1TotalItem: TFloatField;
    SB_Verificar: TSpeedButton;
    N2: TMenuItem;
    VerificarMercadoria1: TMenuItem;
    DSForma_de_Pagamento1: TDataSource;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    Label13: TLabel;
    dblFormaDePagamento: TDBLookupComboBox;
    Transferencia1FPG_CODIGO: TIntegerField;
    Item_de_Transferencia1ITR_DT_ALTERADO: TDateTimeField;
    Item_de_Transferencia1USU_CODIGO: TIntegerField;
    Item_de_Transferencia1ITR_DT_CADASTRO: TDateTimeField;
    SB_ExcCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    Transferencia1PCP_CODIGO: TIntegerField;
    Label15: TLabel;
    edtCodigoPCP: TEdit;
    Label17: TLabel;
    dblFuncionarioOrigem: TDBLookupComboBox;
    Label24: TLabel;
    dblFuncionarioDestino: TDBLookupComboBox;
    Funcionario1: TFuncionario;
    Funcionario2: TFuncionario;
    DSFuncionario1: TDataSource;
    DSFuncionario2: TDataSource;
    Transferencia1FUN_ORIGEM: TIntegerField;
    Transferencia1FUN_DESTINO: TIntegerField;
    Parametro1: TParametro;
    dsParametro1: TDataSource;
    Label25: TLabel;
    dblTipodePagamento: TDBLookupComboBox;
    Transferencia1TRF_TIPO_DOCUMENTO: TIntegerField;
    Localizar1: TMenuItem;
    Item_de_Transferencia1LOT_CODIGO: TIntegerField;
    lblDescLote: TLabel;
    edtCodigoLOT: TEdit;
    edtFrete: TEdit;
    Label26: TLabel;
    QueryExec: TQuery;
    Transferencia1TRF_FRETE: TFloatField;
    spExportacao: TSpeedButton;
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_PrimPedClick(Sender: TObject);
    procedure SB_AntPedClick(Sender: TObject);
    procedure SB_ProxPedClick(Sender: TObject);
    procedure SB_UltPedClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure Transferencia1AfterScroll(DataSet: TDataSet);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure SB_ProcessarClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure Item_de_Transferencia1AfterScroll(DataSet: TDataSet);
    procedure Transferencia1CalcFields(DataSet: TDataSet);
    procedure Item_de_Transferencia1CalcFields(DataSet: TDataSet);
    procedure SB_FaturarClick(Sender: TObject);
    procedure Transferencia1BeforeOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure SB_EtiquetasClick(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure SB_VerificarClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure Funcionario1BeforeOpen(DataSet: TDataSet);
    procedure Funcionario2BeforeOpen(DataSet: TDataSet);
    procedure dblCNCOrigemClick(Sender: TObject);
    procedure dblCNCDestinoClick(Sender: TObject);
    procedure edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoLOTExit(Sender: TObject);
    procedure edtFreteKeyPress(Sender: TObject; var Key: Char);
    procedure mostrar_frete;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure spExportacaoClick(Sender: TObject);
  private
    CdUltimoGRP, CdUltimoSGP: integer;
    procedure ApagaProduto;
    procedure AtualizaTotal;
    procedure AtualizaControles(Cabecalho, Habilitar: Boolean);
    procedure CarregaProduto;
    { Private declarations }
  public
    CdTRN: integer;
    Entidade:TTransferencia;
    ValorAnt:Double;
    impresso:boolean;
  end;

var
  fMxTransfer: TfMxTransfer;

implementation
Uses
  UDM, funcoes, MxSPediProd, URel_Transf, UNotaFiscalLBM,
  UNotaFiscalPetromax, UNotaFiscalMotCal, MxSPediProdMotCal,
  UNotaFiscalEletro, MxSTransportadora, UNotaFiscalLuciano,
  MxVerificarMercadoria, MxSelTransferencia, CdLote, MxPedCompra;
{$R *.DFM}



procedure TfMxTransfer.SB_SalvaClick(Sender: TObject);
var
   CdCNC,CDTRF, CdPRD, CdFUNOrigem, CdLOT: Integer;
   Trans, Inserindo : Boolean;
   vQuantidade:Double;
begin
  if not SB_Salva.Enabled then
    Exit;

  if edtCodigoPRD.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Exit
  else if StrToInt(edtCodigoPRD.Text) <= 0 then
    Exit;

  if not VerificaFloatBranco(edtQuantidade.Text) then
    edtQuantidade.Text:='1';
  If not VerificaFloatBranco(edtPreco.Text) then
    edtPreco.Text := '0,00';

  CdCNC := Entidade.CodigoCNC;
  CdTRF := Entidade.CodigoTRF;
  CdLOT := StrToInt(edtCodigoLOT.Text);
  CdPRD := StrToInt(edtCodigoPRD.Text);
  vQuantidade := StrToFloat(edtQuantidade.Text);

  if Entidade.Estado = 1 then
    Inserindo := True
  else
    Inserindo := False;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUNOrigem := Entidade.FuncionarioOrigem
  else
    CdFUNOrigem := 0;

  //Fazer reserva do item no estoque
  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCNC;
    ParamByName('PRD_CODIGO').asInteger := CdPRD;
    ParamByName('FUN_CODIGO').asInteger := CdFUNOrigem;
    Open;
    If IsEmpty then
    Begin
      if not Inserir(CdCNC, CdPRD,CdFUNOrigem,
               0,0,0,0,0,0,0,0,0,0,0,0) then
        Raise Exception.Create('Falha ao gerar Item de Estoque');
      Close;
      ParamByName('CNC_CODIGO').asInteger := CdCNC;
      ParamByName('PRD_CODIGO').asInteger := CdPRD;
      Open;
    end;
    if DM.Configuracao1.Empresa = empTeste then
    Begin
      if Arredonda(Saldo,5) < Arredonda(StrToFloat(edtQuantidade.Text),5) then
        Raise exception.Create('Saldo insuficiente!');
    end;
  end;

  if CdLOT > 0 then
  Begin
    DM.Item_de_Estoque_Detalhe1.Close;
    DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
    DM.Item_de_Estoque_Detalhe1.open;
    If DM.Item_de_Estoque_Detalhe1.isempty then
    begin
      DM.Item_de_Estoque_Detalhe1.Inserir(CdCNC,CdLOT,CdPRD);
      DM.Item_de_Estoque_Detalhe1.Close;
      DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
      DM.Item_de_Estoque_Detalhe1.open;
    end;
  end
  else if DM.Configuracao1.Empresa = empLuciano then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE_DETALHE '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND IED_QTD_FISICO>0 ';
      Open;
      if not isEmpty then
        if MessageDlg('Existe lote para esse produto.'+
                      'Deseja continuar sem definir o Lote?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
    end;
  end;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if not Item_de_Transferencia1.FinalizaEdicao then
        Raise Exception.Create('');

      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
         ' IES_SRESERVADO=IES_SRESERVADO+'+VirgPonto(vQuantidade-ValorAnt)+
         ',IES_DH_ATUALIZADO="'+MesDia(DM.Configuracao1.DataHora)+'" '+
         ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
         ' AND PRD_CODIGO='+IntToStr(CdPRD)+
         ' AND FUN_CODIGO='+IntToStr(CdFUNOrigem));         

      if Inserindo then
        edtNumeroItens.Text := IntToStr(StrToInt(edtNumeroItens.Text)+1);
      ExecutaSQL(DM.QR_Comandos,'UPDATE TRANSFERENCIA SET '+
        ' TRF_TOT_ITENS='+edtNumeroItens.Text+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TRF_CODIGO='+IntToStr(CdTRF));

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

      Transferencia1.Close;
      Transferencia1.Open;
      Transferencia1.LocalizarCod(CdTRF, CdCNC);

      AtualizaControles(False,False);
      trans := False; //Caso dê problema no SB_Novo não executar o RollBack

      if Item_de_Transferencia1.RecordCount < DM.Configuracao1.MaxItensNota then
        SB_NovoClick(sender);
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
      exit;
    end;
  End;
  //
  AtualizaTotal;
end;

procedure TfMxTransfer.SB_CancClick(Sender: TObject);
begin
  Item_de_Transferencia1.CancelaEdicao;
  AtualizaControles(False,False);
  if Item_de_Transferencia1.IsEmpty then
    ApagaProduto
  else
    CarregaProduto;
  //
  AtualizaTotal;
end;

procedure TfMxTransfer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=false;
  Item_de_Transferencia1.Active:=false;
  Produto1.Active:=false;
  Action:=Cafree;
end;

procedure TfMxTransfer.SB_PrimClick(Sender: TObject);
begin
 if Item_de_Transferencia1.IsEmpty then
   abort;

 If Item_de_Transferencia1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Item_de_Transferencia1.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Item_de_Transferencia1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxTransfer.SB_AntClick(Sender: TObject);
begin
 if Item_de_Transferencia1.IsEmpty then
   abort;

 If Item_de_Transferencia1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Item_de_Transferencia1.Prior;
    If Item_de_Transferencia1.bof Then
    begin
      SB_Ant.Enabled:=False;
      SB_Prim.Enabled:=False;
    end;
  end;
  If not Item_de_Transferencia1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxTransfer.SB_ProxClick(Sender: TObject);
begin
 if Item_de_Transferencia1.IsEmpty then
   abort;

  If Item_de_Transferencia1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Item_de_Transferencia1.Next;
    If Item_de_Transferencia1.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Item_de_Transferencia1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxTransfer.SB_UltClick(Sender: TObject);
begin
 if Item_de_Transferencia1.IsEmpty then
   abort;

  If Item_de_Transferencia1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Item_de_Transferencia1.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Item_de_Transferencia1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxTransfer.SB_NovoClick(Sender: TObject);
begin
  If Transferencia1.Situacao>0 then
    raise exception.Create('Não é possível a inclusão de itens nesta transferencia,pois já foi processada!');
  if ckbAutomatica.Checked then
    raise exception.Create('Essa transferência foi gerada automaticamente, não pode ser alterada!');
  if Item_de_Transferencia1.RecordCount >= DM.Configuracao1.MaxItensNota then
    Raise Exception.Create('Quantidade Máxima de itens por nota máximo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8050)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir/alterar Item de Transferência!');

  ValorAnt:=0;
  Item_de_Transferencia1.PreparaInsercao;
  AtualizaControles(False,True);
  ApagaProduto;
  edtCodigoPRD.SetFocus;
end;

procedure TfMxTransfer.SB_ExcClick(Sender: TObject);
Var
  CdCNC,CdTRF, CdPRD, CdFUNOrigem, CdLOT:Integer;
  Trans : Boolean;
  vQTD: Double;
begin
  if Item_de_Transferencia1.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir transferência neste centro de custo.');
  If Transferencia1.Situacao>0 then
    raise exception.Create('Não é possível a delecao de itens nesta transferencia,pois já foi processada ou cancelada!');
  if ckbAutomatica.Checked then
    raise exception.Create('Essa transferência foi gerada automaticamente, não pode ser alterada!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8060)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Item de Transferência!');
  if Item_de_Transferencia1.RecordCount <= 1 then
    Raise exception.Create('Não é possível excluir o último item!');

  CdCNC := Item_de_Transferencia1.CodigoCNC;
  CdTRF := Item_de_Transferencia1.CodigoTRF;
  CdPRD := Item_de_Transferencia1.CodigoPRD;
  vQTD  := Item_de_Transferencia1.Quantidade;
  CdLOT := Item_de_Transferencia1.CodigoLOT;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUNOrigem := Entidade.FuncionarioOrigem
  else
    CdFUNOrigem := 0;

  If Item_de_Transferencia1.deletarauto then
  Begin
    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        Item_de_Estoque1.Close;
        Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=CdCNC;
        Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=CdPRD;
        Item_de_Estoque1.ParamByName('FUN_CODIGO').asInteger:=CdFUNOrigem;
        Item_de_Estoque1.Open;
        If Item_de_Estoque1.IsEmpty then
        Begin
          if not Item_de_Estoque1.Inserir(CdCNC,CdPRD,CdFUNOrigem,
                    0,0,0,0,0,0,0,0,0,0,0,0) then
            Raise Exception.Create('');
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=CdCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=CdPRD;
          Item_de_Estoque1.ParamByName('FUN_CODIGO').asInteger:=CdFUNOrigem;
          Item_de_Estoque1.Open;
        end;

        if CdLOT > 0 then
        Begin
          DM.Item_de_Estoque_Detalhe1.Close;
          DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
          DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
          DM.Item_de_Estoque_Detalhe1.open;
          If DM.Item_de_Estoque_Detalhe1.isempty then
          begin
            DM.Item_de_Estoque_Detalhe1.Inserir(CdCNC,CdLOT,CdPRD);
            DM.Item_de_Estoque_Detalhe1.Close;
            DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
            DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
            DM.Item_de_Estoque_Detalhe1.open;
          end;
        end;

        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
          ' IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(vQTD)+
          ',IES_DH_ATUALIZADO="'+MesDia(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND FUN_CODIGO='+IntToStr(CdFUNOrigem));          

        edtNumeroItens.Text := IntToStr(StrToInt(edtNumeroItens.Text)-1);
        ExecutaSQL(DM.QR_Comandos,'UPDATE TRANSFERENCIA SET '+
          ' TRF_TOT_ITENS='+edtNumeroItens.Text+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND TRF_CODIGO='+IntToStr(CdTRF));

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
    end;
    if Item_de_Transferencia1.IsEmpty then
      ApagaProduto;
  End;
  //
  AtualizaTotal;
end;

procedure TfMxTransfer.FormCreate(Sender: TObject);
begin
  Entidade := Transferencia1;
  CentroCusto1.Open;
  CentroCusto2.Open;
  Forma_de_Pagamento1.Open;
  Parametro1.Open;
  //
  Entidade.Open;
  Item_de_Transferencia1.Open;

  //Anderson Gonçalves - 21/02/2013
  edtCodigoPRD.MaxLength := 0;
end;

procedure TfMxTransfer.SB_PrimPedClick(Sender: TObject);
begin
 if Transferencia1.IsEmpty then
   abort;

 If Transferencia1.bof Then
  begin
    SB_AntPed.Enabled:=False;
    SB_PrimPed.Enabled:=False;
  end
  Else
  begin
    Transferencia1.First;
    SB_AntPed.Enabled:=False;
    SB_PrimPed.Enabled:=False;
  end;
  If not Transferencia1.eof Then
  begin
    SB_ProxPed.Enabled:=True;
    SB_UltPed.Enabled:=True;
  end;
end;

procedure TfMxTransfer.SB_AntPedClick(Sender: TObject);
begin
 if Transferencia1.IsEmpty then
   abort;

 If Transferencia1.bof Then
  begin
    SB_AntPed.Enabled:=False;
    SB_PrimPed.Enabled:=False;
  end
  Else
  begin
    Transferencia1.Prior;
    If Transferencia1.bof Then
    begin
      SB_AntPed.Enabled:=False;
      SB_PrimPed.Enabled:=False;
    end;
  end;
  If not Transferencia1.eof Then
  begin
    SB_ProxPed.Enabled:=True;
    SB_UltPed.Enabled:=True;
  end;
end;

procedure TfMxTransfer.SB_ProxPedClick(Sender: TObject);
begin
 if Transferencia1.IsEmpty then
   abort;

  If Transferencia1.eof Then
  begin
    SB_ProxPed.Enabled:=False;
    SB_UltPed.Enabled:=False;
  end
  Else
  begin
    Transferencia1.Next;
    If Transferencia1.eof Then
    begin
      SB_ProxPed.Enabled:=False;
      SB_UltPed.Enabled:=False;
    end;
  end;
  If not Transferencia1.bof Then
  begin
    SB_AntPed.Enabled:=True;
    SB_PrimPed.Enabled:=True;
  end;
end;

procedure TfMxTransfer.SB_UltPedClick(Sender: TObject);
begin
 if Transferencia1.IsEmpty then
   abort;

  If Transferencia1.eof Then
  begin
    SB_ProxPed.Enabled:=False;
    SB_UltPed.Enabled:=False;
  end
  Else
  begin
    Transferencia1.Last;
    SB_ProxPed.Enabled:=False;
    SB_UltPed.Enabled:=False;
  end;
  If not Transferencia1.bof Then
  begin
    SB_AntPed.Enabled:=True;
    SB_PrimPed.Enabled:=True;
  end;
end;

procedure TfMxTransfer.SB_NovoPedClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir transferência neste centro de custo.');
  if Trunc(DateTimePicker1.Date) <> DM.Configuracao1.Data then
    DateTimePicker1.date := DM.Configuracao1.Data;
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8040)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir/alterar Transferência!');

  Transferencia1.PreparaInsercao;
  dblCNCOrigemClick(sender);
  Item_de_Transferencia1.Close;
  AtualizaControles(True,True);
  edtNotaFiscal.text := '0';
  edtTotalTransf.text := '0,00';
  ApagaProduto;
  dblCNCDestino.SetFocus;
  //frete
  edtFrete.Enabled:=true;
  edtfrete.text:='';
end;

procedure TfMxTransfer.SB_AltPedClick(Sender: TObject);
begin
  if Transferencia1.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar transferência neste centro de custo.');
  if Transferencia1.Situacao=1 then
    raise exception.Create('Essa transferência já foi confirmada e não pode ser alterada!');
  if Transferencia1.Situacao=4 then
    raise exception.Create('Essa transferência foi cancelada e não pode ser alterada!');
  if ckbAutomatica.Checked then
    raise exception.Create('Essa transferência foi gerada automaticamente, não pode ser alterada!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8040)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir/alterar Transferência!');

  Transferencia1.PreparaAlteracao;
  AtualizaControles(True,True);
  dblCNCDestino.SetFocus;
  //frete
  edtFrete.Enabled:=true;
end;

procedure TfMxTransfer.SB_SalvaPedClick(Sender: TObject);
 var
   mensagem:string;
begin
  mensagem := '';
  if dblCNCOrigem.Text = '' then
    mensagem:=mensagem+'Selecione o centro de custo de origem!'+#13;
  if dblCNCDestino.Text = '' then
    mensagem:=mensagem+'Selecione o centro de custo de destino!'+#13;
  if (dblFormaDePagamento.Text = '') and (DM.Configuracao1.Empresa = empLuciano) then
    mensagem:=mensagem+'Selecione Forma de Pagamento a ser gerados os Títulos a Receber!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if (dblCNCOrigem.KeyValue = dblCNCDestino.KeyValue) and
     (not (DM.Configuracao1.Empresa in TEmpresasEstFUN)) then
    Raise Exception.Create('Transferência com Destino igual a Origem!');
  if (DM.Configuracao1.Empresa in TEmpresasEstFUN) and
     ((dblFuncionarioOrigem.Text = '') or
      (dblFuncionarioDestino.Text = '')) then
    Raise exception.Create('Funcionario Origem/Destino inválido!');

  if Transferencia1.FinalizaEdicao then
  Begin
    AtualizaControles(True,False);
    if not Item_de_Transferencia1.Active then
      Item_de_Transferencia1.Open;
    //frete
    edtFrete.Enabled:=false;

    QueryExec.Active:=false;
    QueryExec.SQL.Clear;
    QueryExec.SQL.Text:='UPDATE TRANSFERENCIA SET TRF_FRETE='+VirgPonto(edtFrete.Text)+' WHERE TRF_CODIGO='+inttostr(entidade.CodigoTRF);
    try
      QueryExec.ExecSQL;
    except
      raise exception.Create('Atenção, o campo frete não foi atualizado.');
    end;
    mostrar_frete;
    // // //
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxTransfer.SB_CancPedClick(Sender: TObject);
begin
  Transferencia1.CancelaEdicao;
  AtualizaControles(True,False);
  if not Item_de_Transferencia1.Active then
    Item_de_Transferencia1.Open;
  //frete
  edtFrete.Enabled:=false;
  mostrar_frete;
end;

procedure TfMxTransfer.Transferencia1AfterScroll(DataSet: TDataSet);
begin
  if Item_de_Transferencia1.IsEmpty then
  Begin
    ApagaProduto;
    edtNumeroItens.Text := '0';
  end;
  Transferencia1.Carregadados;
  dblCNCOrigemClick(dblCNCOrigem);
  dblFuncionarioOrigem.KeyValue := Transferencia1.FuncionarioOrigem;
  dblCNCDestinoClick(dblCNCDestino);
  dblFuncionarioDestino.KeyValue := Transferencia1.FuncionarioDestino;
  AtualizaTotal;
end;

procedure TfMxTransfer.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=4;
        dblCodigoGRP.KeyValue := CdUltimoGRP;
        dblCodigoGRPClick(sender);
        dblCodigoSGP.KeyValue := CdUltimoSGP;
        dblCodigoSGPClick(sender);
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=4;
        ShowModal;
      end;
    end;
    edtQuantidade.SetFocus;
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

procedure TfMxTransfer.edtCodigoPRDExit(Sender: TObject);
var
  CdCNC,CdPRD,CdITR,CdFUNOrigem: integer;
  Trans: Boolean;
begin
  if SB_Canc.Focused or
     (not SB_Canc.Enabled) then
    Exit;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUNOrigem := dblFuncionarioOrigem.KeyValue
  else
    CdFUNOrigem := 0;

  with Produto1 do
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
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
          Produto1.Open;
        end;
      end;
    End;
    if IsEmpty and
       (Length(edtCodigoPRD.Text) > 4) then //Referências maiores que 4 caracteres
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
    End
    else if Situacao = 1 then
    Begin
      Showmessage('Produto desativado!');
      edtCodigoPRD.SetFocus;
      Exit;
    End;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    if DM.Configuracao1.Empresa = empLuciano then
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM ITEM_DE_TRANSFERENCIA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND TRF_CODIGO='+edtCodigoTRF.text+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND LOT_CODIGO='+edtCodigoLOT.Text
    else
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM ITEM_DE_TRANSFERENCIA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND TRF_CODIGO='+edtCodigoTRF.text+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text;
    Open;
  end;
  If not DM.QR_Consultas.IsEmpty Then //Produto já vendido
  Begin
    if DM.Configuracao1.ItemAutomatico = 1 then
    Begin
      CdCNC := DM.Configuracao1.CodigoCNC;
      CdPRD := StrToInt(edtCodigoPRD.Text);
      SB_Canc.SetFocus;
      SB_CancClick(sender);
      Trans:=false;
      with DM.Database2 do
      begin
        try
          StartTransaction;
          Trans:=True;


          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TRANSFERENCIA SET '+
            ' ITR_QUANTIDADE=ITR_QUANTIDADE+1 '+
            ',ITR_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND TRF_CODIGO='+IntToStr(Entidade.CodigoTRF)+
            ' AND PRD_CODIGO='+IntToStr(CdPRD));

          //Fazer reserva no estoque (Versao que evita concorrencia)
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
            ' IES_SRESERVADO=IES_SRESERVADO+1 '+
            ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND FUN_CODIGO='+IntToStr(CdFUNOrigem));            

          Commit;
          Trans := False;

          Item_de_Transferencia1.Close;
          Item_de_Transferencia1.Open;
          AtualizaTotal;

          SB_NovoClick(sender);
        except
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          end;
        end;
      End;
      exit;
    end;
    CdITR    := DM.QR_Consultas.FieldByName('ITR_CODIGO').asInteger;
    ValorAnt := DM.QR_Consultas.FieldByName('ITR_QUANTIDADE').asFloat;
    Item_de_Transferencia1.CancelaEdicao;
    Item_de_Transferencia1.Close;
    Item_de_Transferencia1.Open;
    Item_de_Transferencia1.LocalizarCod(CdITR,Entidade.CodigoCNC);
    Item_de_Transferencia1.PreparaAlteracao;
    ShowMessage('Item já cadastrado, corrija a quantidade!');
    edtQuantidade.SetFocus;
    Exit;
  End;

  CdUltimoGRP := Produto1.CodigoGRP;
  CdUltimoSGP := Produto1.CodigoSGP;
  if DM.Configuracao1.Empresa = 1 then
    edtProduto.text := Trim(Produto1.Descricao+' '+Produto1.Caracteristica)
  else
    edtProduto.text := Produto1.Descricao;
  edtUnidade.text:=Produto1.Unidade;
  edtReferencia.text:=Produto1.Referencia;
  edtDetalhe.text:=Produto1.Detalhe;
  edtMarca.text:=Produto1.Marca;
  //Preco defaut do item de transferencia:
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    edtPreco.text := Format('%.2f',[Produto1.Custo]);
    if DM.Configuracao1.CodigoCNC = 1 then  //CPD
    begin
      DM.QR_Consultas.Close;
      DM.QR_Consultas.SQL.Text := ' SELECT PRD_CODIGO, IPC_PRECO, IPC_DESCONTOS '+
        ' FROM ITEM_DE_PEDIDO_DE_COMPRA '+
        ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+' ORDER BY IPC_CODIGO DESC';
      DM.QR_Consultas.Open;
      DM.QR_Consultas.First;
      if not DM.QR_Consultas.IsEmpty then
        edtPreco.text := Format('%.2f',[CalculaDesconto(DM.QR_Consultas.FieldByName('IPC_PRECO').asFloat,DM.QR_Consultas.FieldByName('IPC_DESCONTOS').asString)]);
    end;
  end
  else
  begin
    DM.QR_Consultas.Close;
    DM.QR_Consultas.SQL.Text:='SELECT TOP 1 * '+
      ' FROM CUSTO '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+
      ' ORDER BY CUS_CODIGO DESC';
    DM.QR_Consultas.Open;
    if DM.QR_Consultas.IsEmpty then
      edtPreco.Text:=Format('%.2f',[Produto1.Custo + (Produto1.Custo*(DM.Configuracao1.CustoOperacional/100))])
    else
      edtPreco.Text:=Format('%.2f',[DM.QR_Consultas.FieldByName('CUS_VALOR_MEDIO').asFloat + (DM.QR_Consultas.FieldByName('CUS_VALOR_MEDIO').asFloat*(DM.Configuracao1.CustoOperacional/100))]);
  end;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUNOrigem := dblFuncionarioOrigem.KeyValue
  else
    CdFUNOrigem := 0;

  //
  //Verifica se tem produto disponível no estoque
  Item_de_Estoque1.Close;
  Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := Strtoint(edtCodigoPRD.Text);
  Item_de_Estoque1.ParamByName('FUN_CODIGO').asInteger := CdFUNOrigem;
  Item_de_Estoque1.Open;
  If not Item_de_Estoque1.IsEmpty Then
  begin
    if DM.Configuracao1.Empresa = empLuciano then
      edtDisponivel.Text:=FloatToStr(Item_de_Estoque1.SFisico)
    else
      edtDisponivel.Text:=FloatToStr(Item_de_Estoque1.Saldo);
  end
  else
  Begin
    edtDisponivel.Text:='0';
    if not Item_de_Estoque1.Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPRD.Text),CdFUNOrigem,0,0,0,0,0,0,
       0,0,0,0,0,0) then
      Raise Exception.Create('Não foi possível criar Item de Estoque para esse produto!');
  end;
  edtCodigoPRD.Enabled:=False;
end;

procedure TfMxTransfer.SB_ProcessarClick(Sender: TObject);
Var
  CdTRF,CdFUNOrigem,CdFUNDestino,CdLOT:Integer;
  Trans:Boolean;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode processar transferência neste centro de custo.');
  if Item_de_Transferencia1.IsEmpty then
    Raise Exception.Create('Transferência sem itens');
  if DM.Configuracao1.Empresa = empLuciano then
    if not VerificaFloatBranco(edtTotalTransf.Text) then
      Raise Exception.Create('Impossível Gerar Título a Receber da Transferência com Valor Total Zerado!');
  If (Transferencia1.Situacao>0) and (Transferencia1.Situacao<>10) then
    Raise Exception.Create('Transferência já foi processada ou cancelada!!');
  if (dblCNCOrigem.KeyValue = dblCNCDestino.KeyValue) and
     (not (DM.Configuracao1.Empresa in TEmpresasEstFUN)) then
    Raise Exception.Create('Transferência com Destino igual a Origem!');
  if (DM.Configuracao1.Empresa in TEmpresasEstFUN) and
     ((dblFuncionarioOrigem.Text = '') or
      (dblFuncionarioDestino.Text = '')) then
    Raise exception.Create('Funcionario Origem/Destino inválido!');

  if MessageDlg('Deseja, realmente, Processar essa transferência?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUNOrigem := Entidade.FuncionarioOrigem
  else
    CdFUNOrigem := 0;

  Item_de_Transferencia1.Close;
  Item_de_Transferencia1.Open;
  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      with Item_de_Transferencia1 do
      begin
        first;
        while not eof do
        begin
          CdLOT := CodigoLOT;
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          Item_de_Estoque1.ParamByName('FUN_CODIGO').asInteger := CdFUNOrigem;
          Item_de_Estoque1.Open;
          If Item_de_Estoque1.IsEmpty then
          Begin
            ShowMessage('Item sem estoque!('+IntToStr(CodigoPRD)+')');
            Raise exception.Create('');
          end;
          if (DM.Configuracao1.Empresa <> empLBM) or
             (not ckbAutomatica.Checked) then //Se não foi gerado automático
          Begin
            //Gerar MEC
            if not DM.Movimento_Estoque_Comercial1.Inserir(CodigoCNC,
                   0,CodigoPRD,CdFUNOrigem,365,CodigoCNC,CodigoTRF, 'S',Quantidade,
                   Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                   Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*)) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;
            //Gerar MEF
            if not DM.Movimento_Fisico1.Inserir(CodigoCNC,0,CodigoPRD,CdFUNOrigem,
                CodigoCNC,CodigoTRF,365(*Transferencia*),'S',
                Quantidade,Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end
            else
            begin
                DM.QR_Consultas.Close;
                DM.QR_Consultas.SQL.Text := 'SELECT MAX(MEF_CODIGO) COD FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
                                            ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                                            ' AND CNC_CODIGO='+IntToStr(CodigoCNC);
                DM.QR_Consultas.Open;

                ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
                  ' CNC_DESTINO='''+inttostr(dblCNCDestino.KeyValue)+''' '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CodigoCNC)+
                  ' AND MEF_CODIGO='+IntToStr(DM.QR_Consultas.FieldByName('COD').AsInteger));
            end;

            if CdLOT>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISICO=IED_QTD_FISICO-'+VirgPonto(Quantidade)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CodigoCNC)+
                ' AND LOT_CODIGO='+IntToStr(CdLOT));
            end;

            //Excluir estoque físico e comercial
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
              ',IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
              ',IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
              ' AND PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND FUN_CODIGO='+IntToStr(CdFUNOrigem));

            if (DM.Configuracao1.Empresa = empLBM) or (DM.Configuracao1.Empresa = 11) or //Gerar Movimentos de Entrada na LBM
               ((DM.Configuracao1.Empresa in TEmpresasEstFUN) and
                (dblCNCOrigem.KeyValue=dblCNCDestino.KeyValue)) then
            Begin
              if DM.Configuracao1.Empresa in TEmpresasEstFUN then
                CdFUNDestino := Entidade.FuncionarioDestino
              else
                CdFUNDestino := 0;

              Item_de_Estoque2.Close;
              Item_de_Estoque2.ParamByName('CNC_CODIGO').AsInteger := dblCNCDestino.KeyValue;
              Item_de_Estoque2.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
              Item_de_Estoque2.ParamByName('FUN_CODIGO').AsInteger := CdFUNDestino;
              Item_de_Estoque2.open;
              If Item_de_Estoque2.isempty then
              begin
                Item_de_Estoque2.Inserir(dblCNCDestino.KeyValue,CodigoPRD,CdFUNDestino,0,0,0,0,0,
                  DM.Configuracao1.DataHora,0,0,0,0,0,0);
                Item_de_Estoque2.Close;
                Item_de_Estoque2.ParamByName('CNC_CODIGO').AsInteger := dblCNCDestino.KeyValue;
                Item_de_Estoque2.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
                Item_de_Estoque2.ParamByName('FUN_CODIGO').AsInteger := CdFUNDestino;
                Item_de_Estoque2.open;
              end;
              //Gerar Movimentos de Entrada Física e Comercial
              If not DM.Movimento_Estoque_Comercial1.Inserir(dblCNCDestino.KeyValue,0,
                  CodigoPRD,CdFUNDestino,365,CodigoCNC,CodigoTRF,'E',Quantidade,
                  Item_de_Estoque2.SComercial,Item_de_Estoque2.SReservado,Item_de_Estoque2.Indisponivel,
                  Item_de_Estoque2.SAmostra, 0(*Amostra*), Item_de_Estoque2.SBonificacao, 0(*Bonus*)) Then
              Begin
                ShowMessage('Falha ao Gerar Mov. Comercial!');
                Raise Exception.Create('');
              end;
              If not DM.Movimento_Fisico1.Inserir(dblCNCDestino.KeyValue,0,CodigoPRD,CdFUNDestino,
                  CodigoCNC,CodigoTRF,365(*Transferencia*),'E',Quantidade,
                  Item_de_Estoque2.SFisico) then
              Begin
                ShowMessage('Falha ao Gerar Mov. Físico!');
                Raise Exception.Create('');
              end;

              if CdLOT>0 then
              Begin
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                  ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
                  ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CodigoCNC)+
                  ' AND LOT_CODIGO='+IntToStr(CdLOT));
              end;

              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(dblCNCDestino.KeyValue)+
                ' AND FUN_CODIGO='+IntToStr(CdFUNDestino));
            end;
          end;
          next;
        end;
      end;

      //Mudar situação da transferência para processada
      CdTRF:=Transferencia1.CodigoTRF;
      ExecutaSQL(DM.QR_Comandos,'UPDATE TRANSFERENCIA SET '+
        ' TRF_TOT_ITENS= '+IntToStr(Item_de_Transferencia1.RecordCount)+
        ',TRF_SITUACAO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND TRF_CODIGO='+IntToStr(CdTRF));

      If DM.Configuracao1.ControleTransacao then
        Commit;

      Transferencia1.Close;
      Transferencia1.Open;
      Transferencia1.LocalizarCod(CdTRF, DM.Configuracao1.CodigoCNC);


      if ( DM.Configuracao1.Empresa = empTodas ) and ( DM.Configuracao1.EstoqueIdeal ) then
        SB_FaturarClick(SB_Faturar);
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
end;

procedure TfMxTransfer.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxTransfer.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If (SB_SalvaPed.Enabled) or (SB_Salva.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxTransfer.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  spExportacao.Visible := DM.Configuracao1.Empresa = empLuciano;

  if DM.Configuracao1.Empresa <> empLuciano then
  Begin
    lblDescLote.Visible := False;
    edtCodigoLOT.Visible := False;
  end;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7700)) < 0 then //Visualizar Preço de Custo
  Begin
    labDesPreco.Visible := False;
    edtPreco.Visible := False;
    labDescTotalTranferencia.Visible := False;
    edtTotalTransf.Visible := False;
    if DM.Usuario1.Permissoes.IndexOf(IntToStr(7700)) < 0 then //Visualizar Preço de Custo
    Begin
      DBGrid5.Columns[7].Visible := False;
      DBGrid5.Columns[8].Visible := False;
    end;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 TRF_DATA AS DATA '+
      ' FROM TRANSFERENCIA '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND TRF_SITUACAO=0 ';
    Open;
    if not isEmpty then
    Begin
      ShowMessage('ATENÇÃO!!!'+#13+
                  'Existe(m) transferência(s) em aberto! ('+FieldByName('DATA').asString+')');
      DateTimePicker1.Date := Trunc(FieldByName('DATA').asDateTime);
    end
    else
      DateTimePicker1.Date := DM.Configuracao1.Data;
  end;

  DateTimePicker1Change(sender);
  CdUltimoGRP := 0;
  CdUltimoSGP := 0;
  AtualizaTotal;

  if DM.Configuracao1.Empresa = empLuciano then
    Label26.Caption:='Despesa Extra'
  else
    Label26.Caption:='Frete';
  //frete
  mostrar_frete;

  if ( DM.Configuracao1.Empresa = empTodas ) and ( DM.Configuracao1.EstoqueIdeal ) then
  begin
    SB_Faturar.visible := false;
    SB_Processar.Left  := SB_Verificar.Left;
    SB_Verificar.Left  := SB_Faturar.Left;
  end;
end;

procedure TfMxTransfer.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxTransfer.SB_ImprimirClick(Sender: TObject);
begin
  if Item_de_Transferencia1.IsEmpty then
    Raise Exception.Create('Transferência sem itens');
  Application.CreateForm(Trpt_transferencia, rpt_transferencia);

  rpt_transferencia.SomaQuantidades := 0;
  with rpt_transferencia do
  Begin
    Produto1.Open;
    CentroCusto1.Open;
    Transferencia1.ParamByName('CNC_CODIGO').AsInteger := self.Transferencia1.CodigoCNC;
    Transferencia1.ParamByName('TRF_CODIGO').AsInteger := self.Transferencia1.CodigoTRF;
    Transferencia1.Open;
    Report.Preview;
  end;
  impresso:=true;
end;

procedure TfMxTransfer.edtQuantidadeExit(Sender: TObject);
begin
  If SB_Canc.Focused then
    Exit;
  if not VerificaFloatBranco(edtQuantidade.Text) then
    edtQuantidade.Text := '1';
end;

procedure TfMxTransfer.Item_de_Transferencia1AfterScroll(
  DataSet: TDataSet);
begin
  Item_de_Transferencia1.CarregaDados;
  CarregaProduto;
end;

procedure TfMxTransfer.Transferencia1CalcFields(DataSet: TDataSet);
begin
  CentroCusto3.Close;
  CentroCusto3.ParamByName('CNC_CODIGO').asInteger:=Entidade.CNCOri;
  CentroCusto3.Open;
  Entidade.FieldByName('CCOri').asString:=CentroCusto3.RazaoSocial;
  CentroCusto3.Close;
  CentroCusto3.ParamByName('CNC_CODIGO').asInteger:=Entidade.CNCDest;
  CentroCusto3.Open;
  Entidade.FieldByName('CCDest').asString:=CentroCusto3.RazaoSocial;
  Case Entidade.Situacao of
    0: Entidade.FieldByName('Situacao').asString:='Solicitada';
    1: Entidade.FieldByName('Situacao').asString:='Processada';
    2: Entidade.FieldByName('Situacao').asString:='Embarcada';
    3: Entidade.FieldByName('Situacao').asString:='Recebida';
    4: Entidade.FieldByName('Situacao').asString:='Cancelada';
  End;
end;

procedure TfMxTransfer.Item_de_Transferencia1CalcFields(DataSet: TDataSet);
begin
  Produto2.Close;
  Produto2.ParamByName('PRD_CODIGO').asInteger:=Item_de_Transferencia1.CodigoPRD;
  Produto2.Open;
  Item_de_Transferencia1.FieldByName('Produto').asString:=Produto2.Descricao;
  Item_de_Transferencia1.FieldByName('Caracteristica').asString:=Produto2.Caracteristica;
  Item_de_Transferencia1.FieldByName('Referencia').asString:=Produto2.Referencia;
  Item_de_Transferencia1.FieldByName('Detalhe').asString:=Produto2.Detalhe;
  Item_de_Transferencia1.FieldByName('Marca').asString:=Produto2.Marca;
  Item_de_Transferencia1.FieldByName('TotalItem').asFloat := Item_de_Transferencia1.Quantidade*Item_de_Transferencia1.Preco;
end;

procedure TfMxTransfer.SB_FaturarClick(Sender: TObject);
var
  vPrecoUnit, ValorICMS, PLiquido,PrecoP,PrecoPS,PrecoICMS,PrecoICMSS:Double;
  CdTRF, vCFOP, vTipo, iTipoFrete, iVolume, CdFUNOrigem, CdFUNDestino, CdLOT:Integer;
  sProduto: string;
  Trans: Boolean;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione a transferência!');
  if (DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto) then
    Raise Exception.Create('Não pode alterar registros desse Centro de Custo!');
  if Item_de_Transferencia1.IsEmpty then
    Raise Exception.Create('Tranferência sem itens');
  if Entidade.Situacao <> 1 then
    Raise Exception.Create('Tranferência não processada!');
  if Entidade.NotaFiscal > 0 then
    Raise Exception.Create('Transferência já Faturada!');

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT NTF_CODIGO '+
      ' FROM NOTA_FISCAL '+
      ' WHERE NTF_SITUACAO=0 '+
      ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Open;
    if not IsEmpty then
      Raise exception.Create('Falha ao tentar gerar nota!'+#13+
                             'Existe um nota em aberto!');
  end;

  vTipo := 365; //Transferência
  if ( not DM.Configuracao1.EstoqueIdeal ) then
  begin
    If MessageDlg('Tem certeza que deseja Faturar essa Transferência?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Begin
      if DM.Configuracao1.Empresa <> 1 then
        Exit
      else If MessageDlg('Deseja Faturar como venda?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit
      else
        vTipo := 361; //Venda
    end;
  end;

  ValorICMS := 0;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CNCDest)+
      ' AND CLI_CODIGO='+IntToStr(Entidade.CNCDest);
    Open;
    if (FieldByName('CLI_UF').asString <> DM.Configuracao1.UF) then //Fora do Estado
    Begin
      ValorICMS := 12;
      if vTipo = 361 then //Venda
      Begin
        if (Trim(FieldByName('CLI_CGF_RG').asString) = '') then //Isento
          vCFOP := 6108
        else
          vCFOP := 6102;
      end
      else                //Transferência
        vCFOP := 6152;
    end
    else
    Begin
      if vTipo = 361 then //Venda
        vCFOP := 5102
      else                //Transferência
        vCFOP := 5152;
    end;
  end;

  CdTRN := 1;
  iTipoFrete := 0;
  iVolume := 0;
  If MessageDlg('Será necessário definir Transportadora?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    Application.CreateForm(TfMxSTransportadora, fMxSTransportadora);
    with fMxSTransportadora do
    Begin
      tag:=3;
      Transportadora1.Close;
      Transportadora1.Open;
      Showmodal;
      if CdTRN = 1 then //Padrão
        iTipoFrete := 0
      else
        iTipoFrete := 1;
    end;
    try
      iVolume := StrToInt(InputBox('Volume de Mercadorias', 'Volume:', '0'));
    except
      Raise exception.Create('Volume inválido!');
    end;
  end;

  CdTRF:=Entidade.CodigoTRF;
  PLiquido  := 0;
  PrecoP    := 0;
  PrecoPS   := 0;
  PrecoICMS := 0;
  PrecoICMSS:= 0;

  with Item_de_Transferencia1 do
  Begin
    First;
    while not EOF do
    Begin
      Produto1.Close;
      Produto1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
      Produto1.Open;
      vPrecoUnit := Arredonda(Produto1.Precocompra);
      if vPrecoUnit <= 0 then
        Raise Exception.Create('Produto '+Produto1.Descricao+' com preço de Compra igual a zero!');

      Classificacao_fiscal1.Close;
      if Produto1.CodigoCLF = 0 then
        Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=1
      else
        Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCLF;
      Classificacao_fiscal1.Open;
      if ValorICMS <> 12 then
        ValorICMS := Classificacao_fiscal1.ICMS;

      PLiquido:=PLiquido+Produto1.PesoLiquido;
      if Produto1.CodigoCLF = 5 then
      Begin
        Classificacao_fiscal2.Close;
        if Produto1.CodigoCTP = 0 then
          Classificacao_fiscal2.ParamByName('CLF_CODIGO').asInteger:=1
        else
          Classificacao_fiscal2.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCTP;
        Classificacao_fiscal2.Open;
        if ValorICMS <> 12 then
          ValorICMS := Classificacao_fiscal2.ICMS;
        PrecoPS:=PrecoPS+Arredonda(Arredonda(vPrecoUnit)*Quantidade);
        PrecoICMSS:=PrecoICMSS+Arredonda(Arredonda(vPrecoUnit)*Quantidade*ValorICMS/100);
      end
      else
      Begin
        PrecoP:=PrecoP+Arredonda(Arredonda(vPrecoUnit)*Quantidade);
        PrecoICMS:=PrecoICMS+Arredonda(Arredonda(vPrecoUnit)*Quantidade*ValorICMS/100);
      end;
      Next;
    end;
  end;

  //Não errar na LBM
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    vCFOP := 5152;
  end;

  DM.QR_Consultas.Close;
  DM.QR_Consultas.SQL.Text:='SELECT * FROM CATRACA '+
    ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
    ' AND CTR_TIPO_NOTA=0';
  DM.QR_Consultas.Open;
  if DM.QR_Consultas.IsEmpty then
  Begin
    edtNotaFiscal.Text:='0';
    ShowMessage('Catraca inválida!');
    Raise Exception.Create('');
  end;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUNOrigem := Entidade.FuncionarioOrigem
  else
    CdFUNOrigem := 0;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;
      with Entidade do
      Begin
        NotaFiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoCNC,CodigoTRF,vCFOP,0(*CodigoFOR*),
          CdTRN(*CodigoTRN*),CNCDest(*ClienteCNC*),CNCDest(*CodigoCLI*),
          0(*CodigoFUN*),DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asInteger,
          DM.QR_Consultas.FieldByName('CTR_NOTA_AIDF').asInteger,1,vTipo(*Tipo*),
          0,iTipoFrete,DM.QR_Consultas.FieldByName('CTR_NOTA_SELO').asInteger,2,0,1 (*Nota*), 0(*CodPagamento*), 0(*CodPagamento2*),
          0(*Arquiteto*),PrecoP(*Base*),PrecoICMS(*ICMS*),PrecoPS(*BaseS*),PrecoICMSS(*ICMSS*),
          0,PrecoP+PrecoPS,PrecoP+PrecoPS,0(*IPI*),0,0,iVolume,0 (*Base ISS*),
          0 (*ISS*),0(*Outras*),
          DM.QR_Consultas.FieldByName('CTR_NOTA_SERIE').asString,
          DM.QR_Consultas.FieldByName('CTR_NOTA_SUBSERIE').asString,
          Observacao,''(*UF*),DM.Configuracao1.Data,DM.Configuracao1.Data);

        //Gerar Nota de Transferência de Entrada
        if DM.Configuracao1.Empresa = empLBM then
          NotaFiscal2.Inserir(CNCDest, 0, CodigoCNC,CodigoTRF,1152(*cfop*),0(*CodigoFOR*),
            CdTRN(*CodigoTRN*),CNCOri(*ClienteCNC*),CNCOri(*CodigoCLI*),
            0(*CodigoFUN*),DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asInteger,
            DM.QR_Consultas.FieldByName('CTR_NOTA_AIDF').asInteger,0,365(*Tipo*),
            0,iTipoFrete,DM.QR_Consultas.FieldByName('CTR_NOTA_SELO').asInteger,2,0,1 (*Nota*), 0(*CodPagamento*), 0(*CodPagamento2*),
            0(*Arquiteto*),PrecoP(*Base*),PrecoICMS(*ICMS*),PrecoPS(*BaseS*),
            PrecoICMSS(*ICMSS*),0,PrecoP+PrecoPS,PrecoP+PrecoPS,0(*IPI*),0,0,iVolume,
            0 (*Base ISS*),0 (*ISS*),0(*Outras*),
            DM.QR_Consultas.FieldByName('CTR_NOTA_SERIE').asString,
            DM.QR_Consultas.FieldByName('CTR_NOTA_SUBSERIE').asString,
            Observacao,''(*UF*),DM.Configuracao1.Data,DM.Configuracao1.Data);
      end;

      with Item_de_Transferencia1 do
      Begin
        First;
        while not EOF do
        Begin
          CdLOT := CodigoLOT;
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
          Produto1.Open;
          vPrecoUnit := Arredonda(Produto1.Precocompra);

          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          Item_de_Estoque1.ParamByName('FUN_CODIGO').asInteger := CdFUNOrigem;
          Item_de_Estoque1.Open;
          If Item_de_Estoque1.IsEmpty then
          Begin
            if not Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,CdFUNOrigem,
                     0,0,0,0,0,0,0,0,0,0,0,0) then
              Raise Exception.Create('');
            Item_de_Estoque1.Close;
            Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
            Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
            Item_de_Estoque1.ParamByName('FUN_CODIGO').asInteger := CdFUNOrigem;
            Item_de_Estoque1.Open;
          end;

          if CdLOT > 0 then
          Begin
            DM.Item_de_Estoque_Detalhe1.Close;
            DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CodigoCNC;
            DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
            DM.Item_de_Estoque_Detalhe1.open;
            If DM.Item_de_Estoque_Detalhe1.isempty then
            begin
              DM.Item_de_Estoque_Detalhe1.Inserir(CodigoCNC,CdLOT,CodigoPRD);
              DM.Item_de_Estoque_Detalhe1.Close;
              DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CodigoCNC;
              DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
              DM.Item_de_Estoque_Detalhe1.open;
            end;
          end;

          if not ckbAutomatica.Checked then // não automática
          Begin
            if not DM.Mov_Est_Fiscal1.Inserir(CodigoCNC,CodigoPRD,CdFUNOrigem,0, CodigoCNC,
               DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asInteger,365, 'S', Quantidade,
               Item_de_Estoque1.SFiscal,
               Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*)) then
            Begin
              ShowMessage('Falha ao inserir Movimento Fiscal!');
              Raise  exception.Create('');
            end;

            if CdLOT>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISCAL=IED_QTD_FISCAL-'+VirgPonto(Quantidade)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CodigoCNC)+
                ' AND LOT_CODIGO='+IntToStr(CdLOT));
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SFISCAL=IES_SFISCAL-'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(CodigoCNC)+
              ' AND FUN_CODIGO='+IntToStr(CdFUNOrigem));

            if (DM.Configuracao1.Empresa = empLBM) or //Entrada no Estoque Fiscal p/ Não Aut.
               ((DM.Configuracao1.Empresa in TEmpresasEstFUN) and
                (dblCNCOrigem.KeyValue=dblCNCDestino.KeyValue)) then
            Begin
              if DM.Configuracao1.Empresa in TEmpresasEstFUN then
                CdFUNDestino := Entidade.FuncionarioDestino
              else
                CdFUNDestino := 0;

              Item_de_Estoque2.Close;
              Item_de_Estoque2.ParamByName('CNC_CODIGO').asInteger := Entidade.CNCDest;
              Item_de_Estoque2.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
              Item_de_Estoque2.ParamByName('FUN_CODIGO').AsInteger := CdFUNDestino;
              Item_de_Estoque2.Open;
              If Item_de_Estoque2.IsEmpty then
              Begin
                if not Item_de_Estoque2.Inserir(Entidade.CNCDest, CodigoPRD,CdFUNDestino,
                         0,0,0,0,0,0,0,0,0,0,0,0) then
                  Raise Exception.Create('');
                Item_de_Estoque2.Close;
                Item_de_Estoque2.ParamByName('CNC_CODIGO').asInteger := Entidade.CNCDest;
                Item_de_Estoque2.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
                Item_de_Estoque2.ParamByName('FUN_CODIGO').AsInteger := CdFUNDestino;
                Item_de_Estoque2.Open;
              end;
              if not DM.Mov_Est_Fiscal1.Inserir(Entidade.CNCDest,CodigoPRD,CdFUNDestino,0, CodigoCNC,
                 DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asInteger,365, 'E', Quantidade,
                 Item_de_Estoque2.SFiscal,
                 Item_de_Estoque2.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque2.SBonificacaoFiscal, 0(*BonusFiscal*)) then
              Begin
                ShowMessage('Falha ao inserir Movimento Fiscal!');
                Raise  exception.Create('');
              end;

              if CdLOT>0 then
              Begin
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                  ' IED_QTD_FISCAL=IED_QTD_FISCAL+'+VirgPonto(Quantidade)+
                  ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CodigoCNC)+
                  ' AND LOT_CODIGO='+IntToStr(CdLOT));
              end;

              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(Entidade.CNCDest)+
                ' AND FUN_CODIGO='+IntToStr(CdFUNDestino));
            end;
          end;

          if DM.Configuracao1.Empresa = empEletro then
            sProduto := Produto1.Descricao
          else
            sProduto := Produto1.Descricao+' - '+Produto1.Referencia+' - '+Produto1.Marca;

          Item_Nota_Fiscal1.Inserir(CodigoCNC,0,NotaFiscal1.SCodigo,CodigoPRD,CodigoLOT,
            0,ValorICMS(*AliquotaICMS*),0(*AliquotaISS*),
            Quantidade,vPrecoUnit,0(*Desconto*),0(*AliquotaIPI*),0(*Bonificação*),0(*Amostra*),
            sProduto);

          if DM.Configuracao1.Empresa = empLBM then //Gerar Nota de Transferência de Entrada
          Begin
            Item_Nota_Fiscal2.Inserir(dblCNCDestino.KeyValue,0,NotaFiscal2.SCodigo,CodigoPRD,CodigoLOT,
              0,ValorICMS(*AliquotaICMS*),0(*AliquotaISS*),
              Quantidade,vPrecoUnit,0(*Desconto*),0(*AliquotaIPI*),0(*Bonificação*),0(*Amostra*),
              sProduto);
          end;

          Next;
        end;
      end;

      edtNotaFiscal.Text:=DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asString;
      ExecutaSQL(DM.QR_Comandos,'UPDATE TRANSFERENCIA SET '+
        ' TRF_NOTA_FISCAL='+edtNotaFiscal.Text+
        ',TRF_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND TRF_CODIGO='+IntToStr(Entidade.CodigoTRF));
      ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
        ' CTR_NOTA_FISCAL=CTR_NOTA_FISCAL+1, '+
        ' CTR_NOTA_SELO=CTR_NOTA_SELO+1 '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND CTR_TIPO_NOTA=0');

      If DM.Configuracao1.ControleTransacao then
        if trans then
          Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          Exit;
        end;
    end;
  End;

  if DM.Configuracao1.Empresa in [empEletro,empCreator,empAndrea,empHOPE] then //Eletro ou Creator ou Andrea ou HOPE
  Begin
    Application.CreateForm(Trpt_NotaFiscalEletro, rpt_NotaFiscalEletro);
    with rpt_NotaFiscalEletro do
    Begin
      tag := 1;
      Desc1:=0;
      //Não exibir Títulos
      Titulo_receber1.Close;
      Titulo_receber1.SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
        ' WHERE TRC_CODIGO=-1 '+
        ' AND CNC_CLIENTE=:CNC_CLIENTE '+
        ' AND CLI_CODIGO=:CLI_CODIGO '+
        ' AND PDV_CODIGO=:PDV_CODIGO '+
        ' ORDER BY TRC_CODIGO ASC ';
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := fMxTransfer.Entidade.CodigoCNC;      
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := fMxTransfer.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := fMxTransfer.NotaFiscal1.SCodigo;
      Item_Nota_Fiscal10.Open;
      report.Preview;
      Close;
    end;
  end
  else if DM.Configuracao1.Empresa = empPetromax then //Petromax
  Begin
    Application.CreateForm(Trpt_NotaFiscalPetromax, rpt_NotaFiscalPetromax);
    with rpt_NotaFiscalPetromax do
    Begin
      tag := 1;
      Desc1:=0;
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := fMxTransfer.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := fMxTransfer.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := fMxTransfer.NotaFiscal1.SCodigo;
      Item_Nota_Fiscal10.Open;
      report.Preview;
      Close;
    end;
  end
  else if DM.Configuracao1.Empresa = empLBM then
  Begin
    Application.CreateForm(Trpt_NotaFiscalLBM, rpt_NotaFiscalLBM);
    with rpt_NotaFiscalLBM do
    Begin
      tag:=2;
      Desc1:=0;
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := fMxTransfer.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := fMxTransfer.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := fMxTransfer.NotaFiscal1.SCodigo;
      Item_Nota_Fiscal10.Open;
      report.Preview;
      Close;
    end;
  end
  else if DM.Configuracao1.Empresa = empMotical then
  Begin
    Application.CreateForm(Trpt_NotaFiscalMotCal, rpt_NotaFiscalMotCal);
    with rpt_NotaFiscalMotCal do
    Begin
      tag:=2;
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := fMxTransfer.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := fMxTransfer.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := fMxTransfer.NotaFiscal1.SCodigo;
      Item_Nota_Fiscal10.Open;
      report.Preview;
      Close;
    end;
  end
  else //if DM.Configuracao1.Empresa = empLuciano then
  Begin
    Application.CreateForm(Trpt_NotaFiscalLuciano, rpt_NotaFiscalLuciano);
    with rpt_NotaFiscalLuciano do
    Begin
      tag:=2;
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := fMxTransfer.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := fMxTransfer.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := fMxTransfer.NotaFiscal1.SCodigo;
      Item_Nota_Fiscal10.Open;
      report.Preview;
      Close;
    end;
  end;
  //else //Não Identificada
    //ShowMessage('Impressao de Nota não configurada!');

  Transferencia1.Close;
  Transferencia1.Open;
  Transferencia1.LocalizarCod(CdTRF, DM.Configuracao1.CodigoCNC);

end;

procedure TfMxTransfer.Transferencia1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Entidade.ParamByName('DataINI').asDate:=DateTimePicker1.Date;
  Entidade.ParamByName('DataFIM').asDate:=DateTimePicker1.Date+1;
end;

procedure TfMxTransfer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      Key := #0;
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else if SB_Canc.Enabled then
    Begin
      Key := #0;
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end
  else if Key = #13 then
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      Key := #0;
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end
    else if SB_Salva.Enabled then
    Begin
      Key := #0;
      if edtCodigoPRD.Focused then
      Begin
        edtQuantidade.SetFocus;
        if DM.Configuracao1.Empresa <> empEletro then
          Exit;
      end;
      if edtCodigoPRD.Focused then //Significa que deu problema na escolha do produto
        Exit;
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
    end;
  end
  else if (edtQuantidade.Focused) and (Key = '.') then
    Key := ','
  else if (edtPreco.Focused) and (Key = '.') then
    Key := ',';
end;

procedure TfMxTransfer.DateTimePicker1Change(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    ApagaProduto;
  end;
  //frete
  mostrar_frete;
end;

procedure TfMxTransfer.SB_EtiquetasClick(Sender: TObject);
var
  sProduto, sCodigoBarras, Linha: string;
  PUmPoQuantidade: Boolean;
  iQuantidade, i: integer;

  Arq: TextFile;
begin
  if Item_de_Transferencia1.IsEmpty then
    Raise Exception.Create('Transferência sem itens!');

  Etiquetas1.Close;
  Etiquetas1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CodigoCNC;
  Etiquetas1.ParamByName('TRF_CODIGO').AsInteger := Entidade.CodigoTRF;
  Etiquetas1.Open;

  if Etiquetas1.IsEmpty then
    Raise Exception.Create('Arquivo NÃO gerado!');

  //try
  PUmPoQuantidade := (MessageDlg('Deseja um registro para cada item do produto?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes);

  if MessageDlg('Gerar etiquetas EAN RED?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    {EAN RED}
    Linha := '';
    AssignFile (Arq, 'C:\Etiquetas.txt');
    Rewrite(Arq);

    Writeln(Arq, 'produto1;produto2;preco;descricao;Referencia;Detalhe;Caracteristica;'+
      'Marca;CodBarras;Quantidade;QtdxPreco');

    while not Etiquetas1.EOF do
    begin
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

      iQuantidade := Etiquetas1.FieldByName('ITR_QUANTIDADE').asInteger;

      for i := 1 to iQuantidade do
      begin
        Linha := fMxPedComp.FormatarCBarra(inttostr(Etiquetas1.CodigoPRD))+';'+inttostr(Etiquetas1.CodigoPRD)+';'+
          Format('%.2f',[Etiquetas1.Precovenda])+';'+sProduto+';'+
          Etiquetas1.Referencia+';'+Etiquetas1.Detalhe+';'+
          Etiquetas1.Caracteristica+';'+Etiquetas1.Marca+';'+sCodigoBarras+';'+inttostr(iQuantidade)+';'+
          Format('%.2f',[iQuantidade*Etiquetas1.Precovenda]);

        Write (Arq, Linha);

        WriteLn (Arq);
      end;

      Etiquetas1.Next;
    end;
    CloseFile(Arq);
    ShowMessage('Arquivo gerado com sucesso !');
    Etiquetas1.Close;
  end
  else
  begin
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

      iQuantidade := Etiquetas1.FieldByName('ITR_QUANTIDADE').asInteger;

      if (DM.Configuracao1.Empresa = empEletro) and
         (iQuantidade > 0) and
         (Etiquetas1.Estmedio > 1) then //Volume
        iQuantidade := Trunc(iQuantidade*Etiquetas1.Estmedio); //Volume

      Etiquetas1.AdicionaEtiqueta(Etiquetas1.CodigoPRD, Etiquetas1.Precovenda,
         iQuantidade, sProduto,
         Etiquetas1.Detalhe, Etiquetas1.Caracteristica, Etiquetas1.Referencia, Etiquetas1.Marca, sCodigoBarras, PUmPoQuantidade);
      Etiquetas1.Next;
    end;
    Etiquetas1.FechaEtiquetas;
    Etiquetas1.Close;
    ShowMessage('Arquivo gerado com sucesso !');
  end;
  //except
  //end;
end;

procedure TfMxTransfer.ApagaProduto;
Begin
  edtCodigoPRD.Clear;
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtDetalhe.Clear;
  edtMarca.Clear;
  edtDisponivel.Clear;
  edtQuantidade.Clear;
  edtPreco.Clear;
end;

procedure TfMxTransfer.AtualizaControles(Cabecalho, Habilitar: Boolean);
begin
  DateTimePicker1.Enabled      := not Habilitar;

  SB_LocCab.Enabled            := not Habilitar;
  Sair1.Enabled                := not Habilitar;
  IncluirPed.Enabled           := not Habilitar;
  AlterarPed.Enabled           := not Habilitar;
  SalvarPed.Enabled            := (Cabecalho and Habilitar);
  CancelarPed.Enabled          := (Cabecalho and Habilitar);
  Incluir1.Enabled             := not Habilitar;
  Excluir1.Enabled             := not Habilitar;
  Salvar1.Enabled              := ((not Cabecalho) and Habilitar);
  Cancelar1.Enabled            := ((not Cabecalho) and Habilitar);

  SB_Prim.Enabled              := not Habilitar;
  SB_Ant.Enabled               := not Habilitar;
  SB_Prox.Enabled              := not Habilitar;
  SB_Ult.Enabled               := not Habilitar;
  SB_Novo.Enabled              := not Habilitar;
  SB_Exc.Enabled               := not Habilitar;
  SB_Salva.Enabled             := ((not Cabecalho) and Habilitar);
  SB_Canc.Enabled              := ((not Cabecalho) and Habilitar);

  SB_PrimPed.Enabled           := not Habilitar;
  SB_AntPed.Enabled            := not Habilitar;
  SB_ProxPed.Enabled           := not Habilitar;
  SB_UltPed.Enabled            := not Habilitar;
  SB_NovoPed.Enabled           := not Habilitar;
  SB_AltPed.Enabled            := not Habilitar;
  SB_SalvaPed.Enabled          := (Cabecalho and Habilitar);
  SB_CancPed.Enabled           := (Cabecalho and Habilitar);

  VerificarMercadoria1.Enabled := not Habilitar;
  SB_Processar.Enabled         := not Habilitar;
  SB_Verificar.Enabled         := not Habilitar;
  SB_Faturar.Enabled           := not Habilitar;
  SB_Etiquetas.Enabled         := not Habilitar;
  SB_Imprimir.Enabled          := not Habilitar;
  SB_Fechar.Enabled            := not Habilitar;

  DBGrid1.Enabled              := not Habilitar;
  DBGrid5.Enabled              := not Habilitar;
end;

procedure TfMxTransfer.CarregaProduto;
var
  CdFUNOrigem: integer;
begin
  With Produto2 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger := Item_de_Transferencia1.CodigoPRD;
    Open;
    If not IsEmpty then
    Begin
      if DM.Configuracao1.Empresa = 1 then
        edtProduto.text := Trim(Produto2.Descricao+' '+Produto2.Caracteristica)
      else
        edtProduto.text := Produto2.Descricao;
      edtUnidade.text:=Produto2.Unidade;
      edtReferencia.text:=Produto2.Referencia;
      edtDetalhe.text:=Produto2.Detalhe;
      edtMarca.text:=Produto2.Marca;
    End;
  End;
  //
  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUNOrigem := Entidade.FuncionarioOrigem
  else
    CdFUNOrigem := 0;

  With Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger := Item_de_Transferencia1.CodigoPRD;
    ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    ParamByName('FUN_CODIGO').asInteger := CdFUNOrigem;
    Open;
    if not IsEmpty then
      edtDisponivel.Text := format('%.2f',[Saldo])
    else
      edtDisponivel.Text := '0,00';
  End;
end;

procedure TfMxTransfer.edtPrecoExit(Sender: TObject);
begin
  If SB_Canc.Focused then
    Exit;
  if not VerificaFloatBranco(edtPreco.Text) then
    edtPreco.Text := '0,00';
end;

procedure TfMxTransfer.AtualizaTotal;
begin
  if not Entidade.IsEmpty then
  begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT SUM(ROUND(ITR_QUANTIDADE*ITR_PRECO,2)) AS TOTAL '+
        ' FROM ITEM_DE_TRANSFERENCIA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND TRF_CODIGO='+IntToStr(Entidade.CodigoTRF);
      Open;
      edtTotalTransf.Text := Format('%.2f',[FieldByName('TOTAL').asFloat]);
    end;
  end;
  //
end;

procedure TfMxTransfer.SB_VerificarClick(Sender: TObject);
begin
  if Item_de_Transferencia1.isEmpty then
    Raise exception.Create('Selecione Transferência com Itens!');

  Application.CreateForm(TfMxVerificarMercadoria, fMxVerificarMercadoria);
  with fMxVerificarMercadoria do
  Begin
    Tag := 1; //Tipo Transferência
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Entidade.CodigoTRF));
    edtCodigoCNC.Text := IntToStr(self.Entidade.CodigoCNC);
    edtPedido.Text    := IntToStr(self.Entidade.CodigoTRF);
    edtDescricao.Text := 'Origem: '+dblCNCOrigem.Text+' // Destino: '+dblCNCDestino.Text;
    Showmodal;
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Entidade.CodigoCNC));
  end;
end;

procedure TfMxTransfer.SB_ExcCabClick(Sender: TObject);
var
  CdCNC, CdTRF: integer;
  Trans: Boolean;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir transferência neste centro de custo.');
  If Transferencia1.Situacao>0 then
    raise exception.Create('Já foi processada ou cancelada!');
  if ckbAutomatica.Checked then
    raise exception.Create('Essa transferência foi gerada automaticamente, não pode ser alterada!');
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8070)) < 0) and
     (not Item_de_Transferencia1.IsEmpty) then
    raise Exception.Create('O usuário não tem permissão para excluir Transferência!');

  CdCNC := Entidade.CodigoCNC;
  CdTRF := Entidade.CodigoTRF;

  if MessageDlg('Deseja excluir essa transferência?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      Item_de_Transferencia1.First;
      while not Item_de_Transferencia1.Eof do
      begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
            ' IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(Item_de_Transferencia1.Quantidade)+
            ',IES_DH_ATUALIZADO="'+MesDia(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND PRD_CODIGO='+IntToStr(Item_de_Transferencia1.CodigoPRD));
        Item_de_Transferencia1.Next;
      end;

      ExecutaSQL(DM.QR_Comandos, 'DELETE FROM ITEM_DE_TRANSFERENCIA '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TRF_CODIGO='+IntToStr(CdTRF));

      ExecutaSQL(DM.QR_Comandos, 'DELETE FROM TRANSFERENCIA '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TRF_CODIGO='+IntToStr(CdTRF));

      if not Entidade.GeraLog(8070, CdCNC, CdTRF, 'CNCOrigem:'+IntToStr(dblCNCOrigem.KeyValue)+
                                                 ' CNCDestino:'+IntToStr(dblCNCDestino.KeyValue)) then
      Begin
        ShowMessage('Falha ao gerar LOG!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

      DateTimePicker1Change(sender);
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
      exit;
    end;
  End;
  //frete
  mostrar_frete;
end;

procedure TfMxTransfer.SB_LocCabClick(Sender: TObject);
begin
  Application.CreateForm(TfmxSelTransferencia, fmxSelTransferencia);
  fMxSelTransferencia.Tag := 0;
  fMxSelTransferencia.ShowModal;
end;

procedure TfMxTransfer.Funcionario1BeforeOpen(DataSet: TDataSet);
begin
  try
    Funcionario1.ParamByName('CNC_CODIGO').asInteger := dblCNCOrigem.KeyValue;
  except
    Funcionario1.ParamByName('CNC_CODIGO').asInteger := -1;
  end;
end;

procedure TfMxTransfer.Funcionario2BeforeOpen(DataSet: TDataSet);
begin
  try
    Funcionario2.ParamByName('CNC_CODIGO').asInteger := dblCNCDestino.KeyValue;
  except
    Funcionario2.ParamByName('CNC_CODIGO').asInteger := -1;
  end;
end;

procedure TfMxTransfer.dblCNCOrigemClick(Sender: TObject);
begin
  Funcionario1.Close;
  Funcionario1.Open;
end;

procedure TfMxTransfer.dblCNCDestinoClick(Sender: TObject);
begin
  Funcionario2.Close;
  Funcionario2.Open;
end;

procedure TfMxTransfer.edtCodigoLOTKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadLote, fCadLote);
    with fCadLote do
    Begin
      tag:=5;
      edtCodigoPRD.text := self.edtCodigoPRD.Text;
      edtProduto.Text := self.edtProduto.Text;
      ShowModal;
    end;
  end;
end;

procedure TfMxTransfer.edtCodigoLOTExit(Sender: TObject);
begin
  if (not VerificaInteiroBranco(edtCodigoPRD.Text)) or
     (not VerificaInteiroBranco(edtCodigoLOT.Text)) then
    edtCodigoLOT.Text := '0';

  if StrToInt(edtCodigoLOT.Text) <= 0 then
  Begin
    edtCodigoLOT.Text := '0';
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT LOT_CODIGO '+
      ' FROM LOTE '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+
      ' AND LOT_CODIGO='+edtCodigoLOT.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoLOT.Text := '0';
      Exit;
    end;
  end;
end;

procedure TfMxTransfer.edtFreteKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',','.',#8]) then
    key:=#0;
  if (key='.') or (key=',') then
  begin
    key:=',';
    if (pos(key,(sender as tedit).Text)<>0) or ((sender as tedit).Text='') then
      key:=#0;
  end;
end;

procedure TfMxTransfer.mostrar_frete;
begin
  QueryExec.Active:=false;
  QueryExec.SQL.Clear;
  QueryExec.SQL.Text:='SELECT TRF_FRETE FROM TRANSFERENCIA WHERE TRF_CODIGO='+inttostr(entidade.CodigoTRF)+'';
  QueryExec.Active:=true;

  edtFrete.Text:=formatfloat('###,###,###0.00',QueryExec.FieldByName('TRF_FRETE').AsFloat);
end;

procedure TfMxTransfer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //frete
  mostrar_frete;
end;

procedure TfMxTransfer.DBGrid1CellClick(Column: TColumn);
begin
  //frete
  mostrar_frete;
end;

procedure TfMxTransfer.spExportacaoClick(Sender: TObject);
var
  sDirAtual, sBanco, sDescricao, sNomeArquivo : String;
  IniFile : TIniFile;
  fArq :TextFile;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione a transferência!');
  if Item_de_Transferencia1.IsEmpty then
    Raise Exception.Create('Tranferência sem itens');
  if Entidade.Situacao <> 1 then
    Raise Exception.Create('Tranferência não processada!');
  if Entidade.NotaFiscal <= 0 then
    Raise Exception.Create('Transferência não Faturada!');

  {GetDir(0,sDirAtual);
  if not DirectoryExists(sDirAtual + '\Exportação') then
    CreateDir(sDirAtual + '\Exportação');
  sDirAtual := sDirAtual + '\Exportação';}

  sDirAtual := 'C:\Importação';
  if not DirectoryExists(sDirAtual) then
    CreateDir(sDirAtual);


  sNomeArquivo := sDirAtual+'\TRANSF_'+edtCodigoTRF.Text+'_CNC_'+dblCNCDestino.Text+'.TXT';
  AssignFile(fArq,sNomeArquivo);
  Rewrite(fArq);

  with Item_de_Transferencia1 do
  Begin
    First;
    while not EOF do
    begin
      WriteLn(FArq,
      Copy(IntToStr(CodigoPRD)    +'                                              ',1,5) +' '+
      'E '                                                                                   +
      Copy(VirgPonto(Quantidade)  +'                                              ',1,10)+' ');
      Next;
    end;
    Closefile(fArq);

    ShellExecute( 0, 'Open',pChar(sNomeArquivo),'','', SW_SHOWNORMAL);
  end;
end;

end.

