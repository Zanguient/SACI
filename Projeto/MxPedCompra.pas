unit MxPedCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, StrUtils, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Variants, Item_de_Estoque, Item_Nota_Fiscal, NotaFiscal,
  Contato, Custo, UF_ICMS, Forma_de_Pagamento, Usuario, OperFisc,DateUtils,
  Item_Pre_Recebimento, Produto_por_Fornecedor, Titulo_a_Pagar,
  Menus, Produto, Item_Pedido_Compra, Pedido_de_Compra, CentroCusto,
  Fornecedor, Pre_Recebimento, Transportadora, Parametro, Transferencia,
  Item_de_Transferencia;

type
  TfMxPedComp = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtCodigoPRD: TEdit;
    Label5: TLabel;
    Label16: TLabel;
    edtProduto: TEdit;
    Label17: TLabel;
    edtUnidade: TEdit;
    edtReferencia: TEdit;
    Panel3: TPanel;
    Label20: TLabel;
    Label10: TLabel;
    edtQuantidade: TEdit;
    SB_SalvaItem: TBitBtn;
    SB_CancItem: TBitBtn;
    edtDetalhe: TEdit;
    memObservacao: TMemo;
    Label27: TLabel;
    Panel5: TPanel;
    SB_Processar: TSpeedButton;
    SB_Cancelar: TSpeedButton;
    SB_NovoItem: TSpeedButton;
    SB_ExcItem: TSpeedButton;
    Label11: TLabel;
    edtIPI: TEdit;
    edtPrecoUnit: TEdit;
    Pedido_de_Compra1: TPedido_de_Compra;
    DSPedido_de_Compra1: TDataSource;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    DSItem_Pedido_Compra1: TDataSource;
    Item_Pedido_Compra1: TItem_Pedido_Compra;
    Produto1: TProduto;
    SB_AltPed: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    SB_NovoPed: TSpeedButton;
    SB_ExcPed: TSpeedButton;
    dblCodigoFOR: TDBLookupComboBox;
    Label3: TLabel;
    dblCNCEntrega: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label23: TLabel;
    Fornecedor1: TFornecedor;
    DSFornecedor1: TDataSource;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Pedido1: TMenuItem;
    IncluirPed: TMenuItem;
    AlterarPed: TMenuItem;
    ExcluirPed: TMenuItem;
    N1: TMenuItem;
    SalvarPed: TMenuItem;
    CancelarPed: TMenuItem;
    Itens1: TMenuItem;
    IncluirItem: TMenuItem;
    ExcluirItem: TMenuItem;
    N3: TMenuItem;
    SalvarItem: TMenuItem;
    CancelarItem: TMenuItem;
    Titulo_a_pagar1: TTitulo_a_pagar;
    mskEntrega: TMaskEdit;
    SB_Fechar: TSpeedButton;
    Label8: TLabel;
    edtCodigoPCP: TEdit;
    Label9: TLabel;
    mskEntrada: TMaskEdit;
    Label22: TLabel;
    edtSituacao: TEdit;
    Transportadora1: TTransportadora;
    DSTransportadora1: TDataSource;
    SB_Imprimir: TSpeedButton;
    SB_LocPed: TSpeedButton;
    N2: TMenuItem;
    LocalizarPedido: TMenuItem;
    Panel1: TPanel;
    DBGrid5: TDBGrid;
    ProcessarPedido: TMenuItem;
    ImprimirPedido: TMenuItem;
    CancelarPedido: TMenuItem;
    N4: TMenuItem;
    edtNotaFiscal: TEdit;
    Label30: TLabel;
    Produto_por_Fornecedor1: TProduto_por_Fornecedor;
    Pre_Recebimento1: TPre_Recebimento;
    Item_Pre_Recebimento1: TItem_Pre_Recebimento;
    Item_Pedido_Compra1Produto: TStringField;
    Item_Pedido_Compra1Referencia: TStringField;
    Produto3: TProduto;
    Item_Pedido_Compra1Detalhe: TStringField;
    Label12: TLabel;
    edtDesconto: TEdit;
    labDescPrecoCusto: TLabel;
    edtPrecoCusto: TEdit;
    Label18: TLabel;
    edtSelo: TEdit;
    edtMarca: TEdit;
    Label19: TLabel;
    mskEmissao: TMaskEdit;
    Label26: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtICMSSub: TEdit;
    edtBaseCalculoSub: TEdit;
    mskCadastro: TMaskEdit;
    Label31: TLabel;
    edtUsuario: TEdit;
    lblDesUsuario: TLabel;
    Item_Pedido_Compra1IPC_CODIGO: TIntegerField;
    Item_Pedido_Compra1CNC_CODIGO: TIntegerField;
    Item_Pedido_Compra1PRD_CODIGO: TIntegerField;
    Item_Pedido_Compra1PCP_CODIGO: TIntegerField;
    Item_Pedido_Compra1IPC_QUANTIDADE: TFloatField;
    Item_Pedido_Compra1IPC_PRECO: TFloatField;
    Item_Pedido_Compra1IPC_IPI: TFloatField;
    Item_Pedido_Compra1USU_CODIGO: TIntegerField;
    Item_Pedido_Compra1IPC_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Compra1IPC_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Compra1Unidade: TStringField;
    Item_Pedido_Compra1Marca: TStringField;
    Item_Pedido_Compra1IPC_DESCONTOS: TStringField;
    OperFiscal1: TOperFiscal;
    Pedido_de_Compra1Usuario: TStringField;
    SB_Frete: TSpeedButton;
    SB_InfAdicionais: TSpeedButton;
    dblFormaDePagamento: TDBLookupComboBox;
    dblNaturezaOperacao: TDBLookupComboBox;
    DSOperFiscal1: TDataSource;
    edtFretePerc: TEdit;
    Label24: TLabel;
    edtICMSFretePrec: TEdit;
    Label25: TLabel;
    Pedido_de_Compra1PCP_CODIGO: TIntegerField;
    Pedido_de_Compra1CNC_CODIGO: TIntegerField;
    Pedido_de_Compra1FOR_CODIGO: TIntegerField;
    Pedido_de_Compra1CNT_CODIGO: TIntegerField;
    Pedido_de_Compra1TRN_CODIGO: TIntegerField;
    Pedido_de_Compra1USU_CODIGO: TIntegerField;
    Pedido_de_Compra1FPG_CODIGO: TIntegerField;
    Pedido_de_Compra1OPF_CODIGO: TIntegerField;
    Pedido_de_Compra1PCP_NOTA_FISCAL: TIntegerField;
    Pedido_de_Compra1PCP_SERIE: TStringField;
    Pedido_de_Compra1PCP_DT_CADASTRO: TDateTimeField;
    Pedido_de_Compra1PCP_DT_ALTERADO: TDateTimeField;
    Pedido_de_Compra1PCP_DT_EMISSAO: TDateTimeField;
    Pedido_de_Compra1PCP_DT_SAIDA: TDateTimeField;
    Pedido_de_Compra1PCP_DT_ENTREGA: TDateTimeField;
    Pedido_de_Compra1CNC_ENTREGA: TIntegerField;
    Pedido_de_Compra1PCP_BASE_CALCULO: TFloatField;
    Pedido_de_Compra1PCP_BASE_CALCULO_SUB: TFloatField;
    Pedido_de_Compra1PCP_ICMS: TFloatField;
    Pedido_de_Compra1PCP_ICMS_FRETE: TFloatField;
    Pedido_de_Compra1PCP_ICMS_SUB: TFloatField;
    Pedido_de_Compra1PCP_FRETE: TFloatField;
    Pedido_de_Compra1PCP_TIPO_FRETE: TSmallintField;
    Pedido_de_Compra1PCP_SITUACAO: TIntegerField;
    Pedido_de_Compra1PCP_OBSERVACAO: TStringField;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    Pedido_de_Compra1PCP_CONHECIMENTO: TIntegerField;
    Label28: TLabel;
    Label29: TLabel;
    edtICMS: TEdit;
    edtBaseCalculo: TEdit;
    Label35: TLabel;
    edtTotalProduto: TEdit;
    Label36: TLabel;
    edtTotalNota: TEdit;
    SB_CalculaFrete: TSpeedButton;
    cmbTipoICMS: TComboBox;
    Label37: TLabel;
    UF_ICMS1: TUF_ICMS;
    Pedido_de_Compra1PCP_TOTAL_PRODUTO: TFloatField;
    Pedido_de_Compra1PCP_TOTAL_NOTA: TFloatField;
    Item_Pedido_Compra1IPC_TIPO_ICMS: TIntegerField;
    Label38: TLabel;
    edtFreteReal: TEdit;
    UF_ICMS2: TUF_ICMS;
    Custo1: TCusto;
    Pedido_de_Compra1FPG_CODIGO_TRN: TIntegerField;
    Label21: TLabel;
    edtICMSFreteReal: TEdit;
    Forma_de_Pagamento2: TForma_de_Pagamento;
    Contato1: TContato;
    NotaFiscal1: TNotaFiscal;
    Pedido_de_Compra1PCP_SUBSERIE: TStringField;
    Pedido_de_Compra1PCP_SELO: TIntegerField;
    Item_Nota_Fiscal1: TItem_Nota_Fiscal;
    Label39: TLabel;
    edtSerie: TEdit;
    Label40: TLabel;
    edtSubSerie: TEdit;
    SB_Etiquetas: TSpeedButton;
    Etiquetas1: TProduto;
    Pedido_de_Compra2: TPedido_de_Compra;
    Pedido_de_Compra2UltimoPCP: TIntegerField;
    edtTotalIPI: TEdit;
    Pedido_de_Compra1PCP_TOTAL_IPI: TFloatField;
    Item_de_Estoque1: TItem_de_Estoque;
    ckbSN: TCheckBox;
    Pedido_de_Compra1PCP_SN: TIntegerField;
    Item_Pedido_Compra1TotalItem: TStringField;
    Label41: TLabel;
    edtTotalItem: TEdit;
    SB_AltItem: TSpeedButton;
    AlterarItem: TMenuItem;
    Pedido_de_Compra1CNC_ORIGEM: TIntegerField;
    Item_Pedido_Compra1CNC_ORIGEM: TIntegerField;
    Label42: TLabel;
    edtVPC: TEdit;
    Pedido_de_Compra1PCP_VPC: TFloatField;
    Item_Pedido_Compra1IPC_BONIFICACAO: TFloatField;
    Label43: TLabel;
    edtBonificacao: TEdit;
    DefinirIPIPedido: TMenuItem;
    Pedido_de_Compra1PCP_FABRICAR: TIntegerField;
    Item_Pedido_Compra1IPC_OBSERVACAO: TStringField;
    Pedido_de_Compra1PCP_ARQUIVO_GERADO: TIntegerField;
    Item_Pedido_Compra1Caracteristica: TStringField;
    Pedido_de_Compra1PCP_DOCUMENTO: TStringField;
    Label44: TLabel;
    edtDocumento: TEdit;
    Pedido_de_Compra1PCP_FRETE_NOTA: TIntegerField;
    ckbFreteNota: TCheckBox;
    Item_Pedido_Compra2: TItem_Pedido_Compra;
    Item_de_Estoque2: TItem_de_Estoque;
    N5: TMenuItem;
    DefinirDescontoAcrescimo1: TMenuItem;
    SB_Verificar: TSpeedButton;
    VerificarMercadoria1: TMenuItem;
    Parametro1: TParametro;
    dsParametro1: TDataSource;
    dblTipoDeDocumento: TDBLookupComboBox;
    Pedido_de_Compra1TPG_CODIGO: TIntegerField;
    Label13: TLabel;
    ckbLJ4: TCheckBox;
    Pedido_de_Compra1PCP_LJ4: TIntegerField;
    Label32: TLabel;
    edtObservacaoItem: TEdit;
    Label45: TLabel;
    edtAmostra: TEdit;
    Label46: TLabel;
    edtPrecoFinal: TEdit;
    Item_Pedido_Compra1IPC_AMOSTRA: TFloatField;
    Item_Pedido_Compra1IPC_PRECO_FINAL: TFloatField;
    Pedido_de_Compra1PCP_TOTAL_FINAL: TFloatField;
    Label47: TLabel;
    edtTotalFinal: TEdit;
    Pedido_de_Compra1PCP_PRECO_FINAL_DEFINIDO: TIntegerField;
    Label48: TLabel;
    edtPercentualVenda: TEdit;
    Label49: TLabel;
    edtPercentualCusto: TEdit;
    Pedido_de_Compra1PCP_PERCENTUAL_CUSTO: TFloatField;
    Pedido_de_Compra1PCP_PERCENTUAL_VENDA: TFloatField;
    GerarTransferncia1: TMenuItem;
    Transferencia1: TTransferencia;
    Item_de_Transferencia1: TItem_de_Transferencia;
    Item_Pedido_Compra1LOT_CODIGO: TIntegerField;
    lblDescLote: TLabel;
    edtCodigoLOT: TEdit;
    Item_Pedido_Compra3: TItem_Pedido_Compra;
    Label50: TLabel;
    EditHoyat: TEdit;
    Item_Pedido_Compra1IPC_HOYAT: TFloatField;
    Label51: TLabel;
    edtTotalHoyat: TEdit;
    Pedido_de_Compra1PCP_TOTAL_HOYAT: TFloatField;
    Label52: TLabel;
    EditTotalHoyat: TEdit;
    SB_Transferencia: TSpeedButton;
    procedure SB_SalvaItemClick(Sender: TObject);
    procedure SB_CancItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure SB_NovoItemClick(Sender: TObject);
    procedure SB_ExcItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pedido_de_Compra1AfterScroll(DataSet: TDataSet);
    procedure Item_Pedido_Compra1AfterScroll(DataSet: TDataSet);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure SB_ProcessarClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_ExcPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure Pedido_de_Compra1BeforeOpen(DataSet: TDataSet);
    procedure Item_Pedido_Compra1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dblCodigoFORClick(Sender: TObject);
    procedure Pedido_de_Compra1CalcFields(DataSet: TDataSet);
    procedure SB_FreteClick(Sender: TObject);
    procedure SB_InfAdicionaisClick(Sender: TObject);
    procedure SB_CalculaFreteClick(Sender: TObject);
    procedure edtFretePercChange(Sender: TObject);
    procedure edtFreteRealChange(Sender: TObject);
    procedure Recalcula;
    function CalculaPrecoCusto(PPrecoUnit, PPrecoFinal, PQtd, PBonus, PAmostra, PIPI, PICMSCompra,
      PICMSVenda, PFretePerc, PFreteReal: Double; PDesconto: string;PSomaNoPedido:Boolean=False):Double;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_EtiquetasClick(Sender: TObject);
    procedure Pedido_de_Compra2BeforeOpen(DataSet: TDataSet);
    procedure edtTotalIPIExit(Sender: TObject);
    procedure edtPrecoUnitChange(Sender: TObject);
    procedure SB_AltItemClick(Sender: TObject);
    procedure edtICMSChange(Sender: TObject);
    procedure edtTotalNotaChange(Sender: TObject);
    procedure DefinirIPIPedidoClick(Sender: TObject);
    procedure DefinirDescontoAcrescimo1Click(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_VerificarClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure ckbSNClick(Sender: TObject);
    procedure ckbLJ4Click(Sender: TObject);
    procedure GerarTransferncia1Click(Sender: TObject);
    procedure edtCodigoLOTExit(Sender: TObject);
    procedure edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
    procedure EditHoyatKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtBonificacaoExit(Sender: TObject);
    procedure edtAmostraExit(Sender: TObject);
  private
    vRecalculado: Boolean;
    CdUltimoGRP, CdUltimoSGP, iSomarDataBase: integer;
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    function GerarTitulosPrazoMedio:Boolean;
  public
    Entidade:TPedido_de_Compra;
    Cancelar : Boolean;
    CentroTRF: integer;
    function FormatarCBarra(CodProduto: string): string;
  end;

var
  fMxPedComp: TfMxPedComp;
  IPITOT,FRETETOT,ICMTOT,TOTALPED,TOTALPEDANT:Double;

implementation
Uses
  UDM, MxS_Tpreco, MxSPediDesc, MxSPediProd, MxSPediTab,
  MxSPediCtCus, MxPagar,funcoes, UPedidoCompra,
  MxPedSCompra, CdCliente, MxFrete, MxInformacoesPedidoDeCompra,
  MxCalculaFrete, DigSenha, MxSPediProdMotCal, MxCliObs,
  MxDescontoPedidoCompra, MxVerificarMercadoria, MxSelRelatorioCompra,
  MXSelCentroCusto, Configuracao, MxFinalizaPedido, CdLote;

{$R *.DFM}

function TfMxPedComp.FormatarCBarra(CodProduto: string): string;
var
  i, aux: integer;
  codigo, part1, part2, CBarras, Digito: string;

function DigitoEAN8(Codigo: string): string;
var
  Soma1   : integer;
  Soma2   : integer;
  Soma    : integer;
  Digito    : integer;
begin
  { Calcula digito Verificador }
  Soma1 := StrToInt(Codigo[ 1])+
           StrToInt(Codigo[ 3])+
           StrToInt(Codigo[ 5])+
           StrToInt(Codigo[ 7]);

  Soma2 := StrToInt(Codigo[ 2])+
           StrToInt(Codigo[ 4])+
           StrToInt(Codigo[ 6]);

  Soma1 := Soma1 * 3;
  Soma  := Soma1 + Soma2;
  Digito  := 0;

  if ((Soma mod 10) <> 0) and (Soma > 9)
    then Digito := 10 - (Soma mod 10);
  if (Soma < 10) and (Soma > 0)
    then Digito := 10 - Soma;

  Result := IntToStr(Digito);
end;  

begin
  Digito := DigitoEAN8(DupeString('0', 7 - Length(CodProduto)) + CodProduto);

  CodProduto := CodProduto + Digito;

  Codigo := DupeString('0', 8 - Length(CodProduto)) + CodProduto;

  part1 := Copy(Codigo,1,4);
  part2 := Copy(Codigo,5,4);

  CBarras := '<';

  for i := 1 to Length(Part1) do
  begin
    aux := strtoint(copy(Part1, i, 1));

    case aux of
      1: CBarras := CBarras + 'B';
      2: CBarras := CBarras + 'C';
      3: CBarras := CBarras + 'D';
      4: CBarras := CBarras + 'E';
      5: CBarras := CBarras + 'F';
      6: CBarras := CBarras + 'G';
      7: CBarras := CBarras + 'H';
      8: CBarras := CBarras + 'I';
      9: CBarras := CBarras + 'J';
      0: CBarras := CBarras + 'A';
    end;
  end;

  CBarras := CBarras + '=';

  for i := 1 to length(Part2) do
  begin
    aux := strtoint(copy(Part2, i, 1));

    case aux of
      1: CBarras := CBarras + 'b';
      2: CBarras := CBarras + 'c';
      3: CBarras := CBarras + 'd';
      4: CBarras := CBarras + 'e';
      5: CBarras := CBarras + 'f';
      6: CBarras := CBarras + 'g';
      7: CBarras := CBarras + 'h';
      8: CBarras := CBarras + 'i';
      9: CBarras := CBarras + 'j';
      0: CBarras := CBarras + 'a';
    end;
  end;

  CBarras := CBarras + '>';

  Result := CBarras;
end;

procedure TfMxPedComp.SB_SalvaItemClick(Sender: TObject);
var
  vInserir, vMarcaAceita: Boolean;
  i, j, CdIPC, CdFUN: integer;
  vMarcas: array of string;
  sMarca, CodIPC: string;
  HoyatItem: Double;
Begin
  if not SB_SalvaItem.Enabled then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Exit
  else if StrToInt(edtCodigoPRD.Text) <= 0 then
    Exit;

  if not VerificaFloatBranco(EditHoyat.Text) then
    EditHoyat.Text := '0';

  if not VerificaFloatBranco(edtIPI.Text) then
    edtIPI.Text := '0';
  if not VerificaFloatBranco(edtSelo.Text) then
    edtSelo.Text := '0';
  if not VerificaFloatBranco(edtPrecoCusto.Text) then
    edtPrecoCusto.Text := '0';

  if not VerificaFloatBranco(edtQuantidade.Text) then
    edtQuantidade.Text := '1';
  if not VerificaFloatBranco(edtBonificacao.Text) then
    edtBonificacao.Text := '0';
  if not VerificaFloatBranco(edtAmostra.Text) then
    edtAmostra.Text := '0';

  if Item_Pedido_Compra1.Estado  = 1 then
    vInserir := True
  else
    vInserir := False;

  if vInserir = True then
  begin
    //Alan - Verifica se o produto existe.
    with DM.QR_Consultas do
    begin
      Close;
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM ITEM_DE_PEDIDO_DE_COMPRA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PCP_CODIGO='+IntToStr(Entidade.CodigoPCP)+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND LOT_CODIGO='+edtCodigoLOT.Text;
      Open;
      if not IsEmpty Then
      begin
        Application.MessageBox('Este produto já foi incluído!'+#13+
          'Sendo necessário você pode alterá-lo!','Aviso',MB_OK+MB_ICONWARNING);
        Exit;
      end;
    end;
  end;

  if DM.Configuracao1.Empresa = empLBM then
  Begin
    SetLength(vMarcas, 1);
    vMarcas[0] := '';
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FOR_MARCA AS MARCA '+
        ' FROM FORNECEDOR '+
        ' WHERE FOR_CODIGO='+IntToStr(dblCodigoFOR.KeyValue);
      Open;
      sMarca := Trim(FieldByName('MARCA').asString);
      if Trim(sMarca) = '' then
        Raise Exception.Create('Marca do Produto diferente da Marca do Fornecedor!');
      j := 0;
      for i:=1 to Length(sMarca) do
      Begin
        if sMarca[i] = ';' then
        Begin
          SetLength(vMarcas, High(vMarcas)+2);
          inc(j);
        end
        else
          vMarcas[j] := vMarcas[j] + sMarca[i];
      end;
      vMarcaAceita := False;
      for i:=0 to High(vMarcas) do
      Begin
        if (edtMarca.Text = vMarcas[i]) then
        Begin
          vMarcaAceita := True;
          Break;
        end;
      end;
      if not vMarcaAceita then
        Raise Exception.Create('Marca do Produto diferente da Marca do Fornecedor!');
    end;
  end;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUN := dblCNCEntrega.KeyValue
  else
    CdFUN := 0;

  Item_de_Estoque1.Close;
  Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CNCEntrega;
  Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
  Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
  Item_de_Estoque1.open;
  If Item_de_Estoque1.isempty then
  begin
    Item_de_Estoque1.Inserir(Entidade.CNCEntrega,StrToInt(edtCodigoPRD.Text),CdFUN,0,0,0,0,0,
      DM.Configuracao1.DataHora,0,0,0,0,0,0);
    Item_de_Estoque1.Close;
    Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CNCEntrega;
    Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
    Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
    Item_de_Estoque1.open;
  end;

  if DM.Configuracao1.Empresa = empLuciano then
  Begin
    Item_de_Estoque1.Close;
    Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := 1; //CPD
    Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
    Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
    Item_de_Estoque1.open;
    If Item_de_Estoque1.isempty then
    begin
      Item_de_Estoque1.Inserir(1 (*CPD*),StrToInt(edtCodigoPRD.Text),CdFUN,0,0,0,0,0,
        DM.Configuracao1.DataHora,0,0,0,0,0,0);
      Item_de_Estoque1.Close;
      Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := 1; //CPD
      Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
      Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
      Item_de_Estoque1.open;
    end;
  end;

  CdIPC := Item_Pedido_Compra1.CodigoIPC;

  //Alan - Variaveis para o calculo do Hoayt
  HoyatItem := strtofloat(EditHoyat.Text);

  if Item_Pedido_Compra1.FinalizaEdicao then
  Begin
    AtualizaControles(2,False);
    if vInserir then
      edtPrecoCusto.Text := format('%.2f',[CalculaPrecoCusto(StrToFloat(edtPrecoUnit.Text),StrToFloat(edtPrecoFinal.Text),
        StrToFloat(edtQuantidade.Text),StrToFloat(edtBonificacao.Text),StrToFloat(edtAmostra.Text),
        StrToFloat(edtIPI.Text),UF_ICMS2.ICMSCompra,
        UF_ICMS2.ICMSVenda, StrToFloat(edtFretePerc.Text), StrToFloat(edtFreteReal.Text),
        edtDesconto.Text, True)])
    else
    Begin
//      Recalcula;
      Item_Pedido_Compra1.LocalizarCod(CdIPC, Entidade.CodigoCNC);
    end;

    //Codigo do item para Atualizar
    CodIPC := inttostr(Item_Pedido_Compra1.CodigoIPC);

    //Colocar Hoyat no produto
    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_COMPRA SET '+
      ' IPC_HOYAT='+VirgPonto(HoyatItem)+
      ' WHERE CNC_CODIGO='+inttostr(DM.Configuracao1.CodigoCNC)+
      ' AND IPC_CODIGO='+CodIPC);

    edtFretePercChange(sender);
    Recalcula;

    if vInserir then
      SB_NovoItemClick(sender);
  end
  else
    ShowMessage('As alterações não foram salvas!');

end;

procedure TfMxPedComp.SB_CancItemClick(Sender: TObject);
begin
  Item_Pedido_Compra1.CancelaEdicao;
  if Item_Pedido_Compra1.IsEmpty then
  Begin
    edtPrecoCusto.Clear;
    edtMarca.Clear;
    edtProduto.Clear;
    edtUnidade.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtTotalItem.Clear;
  end
  else
  Begin
    Produto1.Close;
    try
      Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
    except
    end;
    Produto1.Open;
    If not Produto1.IsEmpty Then
    Begin
      if DM.Configuracao1.Empresa = 1 then
        edtProduto.text := Trim(Produto1.Descricao+' '+Produto1.Caracteristica)
      else
        edtProduto.text  := Produto1.Descricao;
      edtUnidade.text    :=Produto1.Unidade;
      edtReferencia.text :=Produto1.Referencia;
      edtDetalhe.text    :=Produto1.Detalhe;
      edtMarca.Text      :=Produto1.Marca;
      edtPrecoCusto.Text := format('%.2f',[CalculaPrecoCusto(StrToFloat(edtPrecoUnit.Text),StrToFloat(edtPrecoFinal.Text),
        StrToFloat(edtQuantidade.Text),StrToFloat(edtBonificacao.Text),StrToFloat(edtAmostra.Text),
        StrToFloat(edtIPI.Text),UF_ICMS2.ICMSCompra,
        UF_ICMS2.ICMSVenda,StrToFloat(edtFretePerc.Text),StrToFloat(edtFreteReal.Text),
        edtDesconto.Text)]);
      edtPrecoUnitChange(sender);
    end;
  end;
  AtualizaControles(2,False);
end;

procedure TfMxPedComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_PCP_');
  except
  end;
  Fornecedor1.Close;
  Entidade.CLose;
  CentroCusto1.Close;
  Item_Pedido_Compra1.Close;
  produto1.Close;
  Pre_Recebimento1.Close;
  Item_Pre_Recebimento1.Close;
  Action:=Cafree;
end;

procedure TfMxPedComp.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        tag:=3;
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
        tag:=3;
        ShowModal;
      end;
    end;
    try
      if SB_NovoItem.Enabled then
        SB_NovoItemClick(sender)
      else if VerificaInteiroBranco(edtCodigoPRD.Text) then
        edtQuantidade.SetFocus;
    except
    end;
  End
  else if edtCodigoPRD.Focused then
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

procedure TfMxPedComp.SB_NovoItemClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione o Pedido antes!');
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3670)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Pedido de Compra!');
  If Entidade.Situacao>=1 Then
    raise Exception.Create('Esse Pedido já foi Processado ou Cancelado!');
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT MAX(FOR_MAX_ITENS_NOTA) AS MAXIMO '+
      ' FROM FORNECEDOR '+
      ' WHERE FOR_CODIGO='+IntToStr(dblCodigoFOR.KeyValue);
    Open;
    if Item_Pedido_Compra1.RecordCount >= FieldByName('MAXIMO').asInteger then
      Raise Exception.Create('Quantidade Máxima de itens por Nota!');
  end;
  if Item_Pedido_Compra1.IsEmpty then
    cmbTipoICMS.ItemIndex := 0;
  Item_Pedido_Compra1.PreparaInsercao;
  AtualizaControles(2,True);
  edtPrecoCusto.Clear;
  edtMarca.Clear;
  EditHoyat.Enabled := True;
  EditHoyat.Text := '0,0';
  //EditTotalHoyat.Enabled := True;
  EditTotalHoyat.Text := '0,00';
  edtDesconto.Text := '0';
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtDetalhe.Clear;
  edtTotalItem.Clear;
  try
    edtCodigoPRD.SetFocus;
  except
  end;
end;

procedure TfMxPedComp.SB_ExcItemClick(Sender: TObject);
begin
  if Item_Pedido_Compra1.RecordCount = 1 then
    Raise Exception.Create('Esse pedido tem somente um item!');
  if Item_Pedido_Compra1.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3670)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Pedido de Compra!');
  If Entidade.Situacao>=1 Then
    raise Exception.Create('Esse Pedido já foi Processado ou Cancelado!');
  if Item_Pedido_Compra1.deletarauto then
  Begin
    if Item_Pedido_Compra1.IsEmpty then
    Begin
      edtBaseCalculo.Text:='0';
      edtICMS.Text:='0';
      edtBaseCalculoSub.Text:='0';
      edtICMSSub.Text:='0';
      edtTotalProduto.Text:='0';
      edtTotalIPI.Text := '0';
      edtTotalNota.Text:='0';
      edtTotalFinal.Text:='0';
      edtTotalHoyat.Text := '0';
    end;
    Recalcula;
  end;

  if Item_Pedido_Compra1.IsEmpty then
  Begin
    edtPrecoCusto.Clear;
    edtMarca.Clear;
    edtProduto.Clear;
    edtUnidade.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtTotalItem.Clear;
  end;
end;

procedure TfMxPedComp.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  if DM.Configuracao1.Empresa <> empLuciano then
  Begin
    lblDescLote.Visible := False;
    edtCodigoLOT.Visible := False;

    Label50.Left := lblDescLote.Left;
    EditHoyat.Left := edtCodigoLOT.Left;
  end;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7700)) < 0 then //Visualizar Preço de Custo
  Begin
    labDescPrecoCusto.Visible := False;
    edtPrecoCusto.Visible := False;
  end;

  if DM.Configuracao1.Empresa = empLBM then
  Begin
    with Fornecedor1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM FORNECEDOR '+
        ' WHERE (FOR_MARCA <> "") '+
        ' ORDER BY FOR_RZ_SOCIAL ';
    end;
  end
  else
    ckbLJ4.Visible := False;

  Fornecedor1.Open;
  CentroCusto1.Open;
  Forma_de_Pagamento1.Open;
  Parametro1.Open;
  OperFiscal1.Open;
  Pedido_de_Compra2.Close;
  Pedido_de_Compra2.Open;
  Entidade.Close;
  Entidade.ParamByName('PCP_CODIGO').asInteger := Pedido_de_Compra2UltimoPCP.AsInteger;
  Entidade.Open;

  //Valor total do hoyat
  if Entidade.fieldbyname('PCP_TOTAL_HOYAT').AsFloat = 0 then
    edtTotalHoyat.Text := '0,00'
  else
    edtTotalHoyat.Text := Format('%.2f' ,[Entidade.fieldbyname('PCP_TOTAL_HOYAT').AsFloat]);

  Item_Pedido_Compra1.Open;
  CdUltimoGRP := 0;
  CdUltimoSGP := 0;

  if ( DM.Configuracao1.Empresa = empTodas ) and ( DM.Configuracao1.EstoqueIdeal ) then
  begin
    ckbSN.Checked := false;
    ckbSN.Visible := false;
  end;
end;

procedure TfMxPedComp.Pedido_de_Compra1AfterScroll(DataSet: TDataSet);
begin
  if not Entidade.EOF then
  Begin
    Entidade.CarregaDados;
    edtUsuario.Text := Entidade.FieldByName('Usuario').asString;
  end;
  if Item_Pedido_Compra1.IsEmpty then
  Begin
    edtPrecoCusto.Clear;
    edtMarca.Clear;
    edtProduto.Clear;
    edtUnidade.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtTotalItem.Clear;
  end;
  UF_ICMS1.Close;
  UF_ICMS1.ParamByName('UFI_UF').asString:=DM.Configuracao1.UF;
  UF_ICMS1.Open;
  UF_ICMS2.Close;
  if Fornecedor1.Uf <> '' then
    UF_ICMS2.ParamByName('UFI_UF').asString:=Fornecedor1.Uf
  else
    UF_ICMS2.ParamByName('UFI_UF').asString:='CE';
  UF_ICMS2.Open;
end;

procedure TfMxPedComp.Item_Pedido_Compra1AfterScroll(DataSet: TDataSet);
begin
  if edtFretePerc.Text = '' then
    edtFretePerc.Text := '0';
  if Trim(edtICMSFretePrec.Text) = '' then
    edtICMSFretePrec.Text := '0';
  with Item_Pedido_Compra1 do
  Begin
    CarregaDados;
    if DM.Configuracao1.Empresa = 1 then
      edtProduto.Text  := Trim(FieldByName('Produto').asString+' '+
                              FieldByName('Caracteristica').asString)
    else
      edtProduto.Text  := FieldByName('Produto').asString;
    edtUnidade.Text    := FieldByName('Unidade').asString;
    edtReferencia.Text := FieldByName('Referencia').asString;
    edtDetalhe.Text    := FieldByName('Detalhe').asString;
    edtMarca.Text      := FieldByName('Marca').asString;
    edtTotalItem.Text  := FieldByName('TotalItem').asString;
    EditHoyat.Text     := format('%.1f',[FieldByName('IPC_HOYAT').AsFloat]);

    EditTotalHoyat.Text := format('%.2f',[FieldByName('TotalItem').AsFloat * FieldByName('IPC_HOYAT').AsFloat/100]);

    if not VerificaFloatBranco(edtFreteReal.Text) then
      edtFreteReal.Text := '0';
    edtPrecoCusto.Text := format('%.4f',[CalculaPrecoCusto(Preco, PrecoFinal,Quantidade,
      Bonificacao,Amostra, IPI, UF_ICMS2.ICMSCompra, UF_ICMS2.ICMSVenda,
      StrToFloat(edtFretePerc.Text), StrToFloat(edtFreteReal.Text), Descontos)]);
  end;
end;

procedure TfMxPedComp.edtCodigoPRDExit(Sender: TObject);
begin
  if SB_CancItem.Focused or
     (not SB_CancItem.Enabled) then
    Exit;

  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtDetalhe.Clear;
  edtMarca.Clear;

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

  //Alan
  {CdCNC := DM.Configuracao1.CodigoCNC;
  CdPRD := StrToInt(edtCodigoPRD.Text);
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 * '+
      ' FROM ITEM_DE_PEDIDO_DE_COMPRA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PCP_CODIGO='+IntToStr(Entidade.CodigoPCP)+
      ' AND PRD_CODIGO='+IntToStr(CdPRD);
    Open;
    If not IsEmpty Then
    Begin
      if DM.Configuracao1.ItemAutomatico = 1 then
      Begin
        SB_CancItem.SetFocus;
        SB_CancItemClick(sender);
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_COMPRA SET '+
              ' IPC_QUANTIDADE=IPC_QUANTIDADE+1 '+
              ',IPC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PCP_CODIGO='+IntToStr(Entidade.CodigoPCP)+
              ' AND PRD_CODIGO='+IntToStr(CdPRD));

            Commit;
            Trans := False;

            Recalcula; //Irá atualizar Item_Pedido_Compra1

            SB_NovoItemClick(sender);
          except
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        End;
        Exit;
      end;

      try
        edtCodigoPRD.SetFocus;
      except
      end;
      Raise exception.Create('Este produto já foi incluído!'+#13+'Sendo necessário você pode alterá-lo!');
    end;
  end;}

  CdUltimoGRP := Produto1.CodigoGRP;
  CdUltimoSGP := Produto1.CodigoSGP;
  if DM.Configuracao1.Empresa = empEletro then
    edtProduto.text := Trim(Produto1.Descricao+' '+Produto1.Caracteristica)
  else
    edtProduto.text := Produto1.Descricao;
  edtUnidade.text:=Produto1.Unidade;
  edtReferencia.text:=Produto1.Referencia;
  edtDetalhe.text:=Produto1.Detalhe;
  edtMarca.Text:=Produto1.Marca;
  edtPrecoUnit.Text:=format('%.2f',[Produto1.PrecoCompra]);
  edtPrecoFinal.Text:=format('%.2f',[Produto1.PrecoCompra]);
end;

procedure TfMxPedComp.SB_CancelarClick(Sender: TObject);
var
  CdPCP,CdCNC,CdFOR,CdFUN,CdLOT:integer;
  sCdCNC, sAutorizado: string;
  Trans:Boolean;
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione primeiro o registro!');
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  if Entidade.Situacao = 1 then
    raise Exception.Create('Pedido já Cancelado!');

  if (Entidade.CNCEntrega <> DM.Configuracao1.CodigoCNC) and
     (DM.Configuracao1.Empresa <> empLBM) then
    raise Exception.Create('Temporariamente não é permitido Cancelar Compra!');

  If MessageDlg('ATENÇÃO!!!'+#13+'Deseja cancelar esse pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdPCP:=Entidade.CodigoPCP;
  CdCNC:=Entidade.CodigoCNC;
  CdFOR:=Entidade.CodigoFOR;

  sAutorizado := '';
  if DM.Usuario1.Permissoes.IndexOf(IntToStr(6890)) < 0 then //Cancelar Pedido
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=29;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(6890)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para cancelar Pedido!');
        end
        else
          sAutorizado := 'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU);
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end;

  if DM.Configuracao1.Empresa <> empLBM then
    sCdCNC := ' AND CNC_CODIGO='+IntToStr(CdCNC)+' '
  else
    sCdCNC := '';

  if (Entidade.NotaFiscal > 0) and
     (Entidade.Situacao = 2) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT NTF_CODIGO '+
        ' FROM NOTA_FISCAL '+
        ' WHERE CNC_PEDIDO='+IntToStr(CdCNC)+
        ' AND NTF_PEDIDO='+IntToStr(CdPCP)+
        ' AND NTF_TIPO_NOTA=360 '+ //Compra
        ' AND NTF_SITUACAO=2 '+ //Nota Impressa
        ' AND FOR_CODIGO='+IntToStr(CdFOR);
      Open;
      if not IsEmpty then
        ShowMessage('É necessário cancelar a nota primeiro!');
    end;
  end;

  if (Entidade.Situacao = 2) then
  Begin
    With DM.QR_Consultas do
    Begin
      Close;
      SQL.Text:='SELECT * FROM TITULO_A_PAGAR '+
        ' WHERE PCP_CODIGO='+IntToStr(CdPCP)+
        sCdCNC+
        ' AND TPG_SITUACAO=1 ';
      Open;
    End;
    If not DM.QR_Consultas.IsEmpty then
      Raise Exception.Create('Não é permitido o cancelamento do pedido após o pagamento de um título referente a ele!');
  end;

  Item_Pedido_Compra1.Close;
  Item_Pedido_Compra1.Open;
  Item_Pedido_Compra1.First;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if (Entidade.Situacao = 2) then
      Begin
        //Cancelar títulos da compra
        ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_PAGAR SET '+
          ' TPG_SITUACAO=2 '+
          ' WHERE TPG_SITUACAO=0 '+
          ' AND PCP_CODIGO='+IntToStr(CdPCP)+
          sCdCNC);

        //Cancelar Preço de Custo
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM CUSTO '+
          ' WHERE CNC_PEDIDO='+IntToStr(CdCNC)+
          ' AND PCP_CODIGO='+IntToStr(CdPCP));

        //Modificar a situação para pedido em aberto
        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
          ' PCP_SITUACAO=0 '+
          ',PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PCP_CODIGO='+IntToStr(CdPCP));

        //Gerar Extorno Físico, Comercial e LJ3/LJ4 (Se for o caso)
        //O extorno fiscal foi feito no Cancelar Nota
        if DM.Configuracao1.Empresa in TEmpresasEstFUN then
          CdFUN := dblCNCEntrega.KeyValue
        else
          CdFUN := 0;

        with Item_Pedido_Compra1 do
        Begin
          while not Eof do
          Begin
            CdLOT := CodigoLOT;
            Item_de_Estoque1.Close;
            Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CNCEntrega;
            Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
            Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
            Item_de_Estoque1.open;
            If Item_de_Estoque1.isempty then
            begin
              Item_de_Estoque1.Inserir(Entidade.CNCEntrega,CodigoPRD,CdFUN,0,0,0,0,0,
                DM.Configuracao1.DataHora,0,0,0,0,0,0);
              Item_de_Estoque1.Close;
              Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CNCEntrega;
              Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
              Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
              Item_de_Estoque1.open;
            end;

            if CdLOT > 0 then
            Begin
              DM.Item_de_Estoque_Detalhe1.Close;
              DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CNCEntrega;
              DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
              DM.Item_de_Estoque_Detalhe1.open;
              If DM.Item_de_Estoque_Detalhe1.isempty then
              begin
                DM.Item_de_Estoque_Detalhe1.Inserir(Entidade.CNCEntrega,CdLOT,CodigoPRD);
                DM.Item_de_Estoque_Detalhe1.Close;
                DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CNCEntrega;
                DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
                DM.Item_de_Estoque_Detalhe1.open;
              end;
            end;

            If not DM.Movimento_Estoque_Comercial1.Inserir(Entidade.CNCEntrega,0,
                CodigoPRD,CdFUN,4090(*Compra Cancelada*),CodigoCNC,CodigoPCP,'S',Quantidade,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, Amostra, Item_de_Estoque1.SBonificacao, Bonificacao) Then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;
            If not DM.Movimento_Fisico1.Inserir(Entidade.CNCEntrega,0,CodigoPRD,CdFUN,
                CodigoCNC,CodigoPCP,4090(*Compra Cancelada*),'S', Quantidade,
                Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end;

            if Entidade.NotaFiscal > 0 then
            Begin

              if CdLOT>0 then
              Begin
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                  ' IED_QTD_FISICO=IED_QTD_FISICO-'+VirgPonto(Quantidade)+
                  ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                  ' AND LOT_CODIGO='+IntToStr(CdLOT));
              end;

              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
                ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
                ',IES_SAMOSTRA=IES_SAMOSTRA-'+VirgPonto(Amostra)+
                ',IES_SFISCAL=IES_SFISCAL-'+VirgPonto(Quantidade)+
                ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL-'+VirgPonto(Bonificacao)+
                ',IES_SAMOSTRA_FISCAL=IES_SAMOSTRA_FISCAL-'+VirgPonto(Amostra)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));
            end
            //LJ3
            else if Entidade.NotaFiscal = -1 then
            Begin
              If not DM.Movimento_Estoque_SN1.Inserir(Entidade.CNCEntrega,CodigoPRD,CdFUN,
                  4090(*Compra Cancelada*),CodigoCNC,CodigoPCP,
                  'S',Quantidade,
                  Item_de_Estoque1.SSN) then
              Begin
                ShowMessage('Falha ao Gerar Mov. LJ3!');
                Raise Exception.Create('');
              end;

              if CdLOT>0 then
              Begin
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                  ' IED_QTD_FISICO=IED_QTD_FISICO-'+VirgPonto(Quantidade)+
                  ',IED_QTD_FISCAL=IED_QTD_FISCAL-'+VirgPonto(Quantidade)+
                  ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                  ' AND LOT_CODIGO='+IntToStr(CdLOT));
              end;

              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
                ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
                ',IES_SAMOSTRA=IES_SAMOSTRA-'+VirgPonto(Amostra)+
                ',IES_SSN=IES_SSN-'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));
            end
            //LJ4
            else if Entidade.NotaFiscal = -2 then
            Begin
              If not DM.Movimento_Estoque_LJ41.Inserir(Entidade.CNCEntrega,CodigoPRD,CdFUN,
                  4090(*Compra Cancelada*),CodigoCNC,CodigoPCP,
                  'S',Quantidade,
                  Item_de_Estoque1.SLJ4) then
              Begin
                ShowMessage('Falha ao Gerar Mov. LJ4!');
                Raise Exception.Create('');
              end;

              if CdLOT>0 then
              Begin
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                  ' IED_QTD_FISICO=IED_QTD_FISICO-'+VirgPonto(Quantidade)+
                  ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                  ' AND LOT_CODIGO='+IntToStr(CdLOT));
              end;

              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
                ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
                ',IES_SAMOSTRA=IES_SAMOSTRA-'+VirgPonto(Amostra)+
                ',IES_SLJ4=IES_SLJ4-'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));
            end;
            Next;
          end;
        end;
      end
      else
        //Modificar a situação para pedido em aberto
        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
          ' PCP_SITUACAO=1 '+
          ',PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PCP_CODIGO='+IntToStr(CdPCP));

      if not Entidade.GeraLog(6890, CdCNC, CdPCP, sAutorizado) then
      Begin
        ShowMessage('Falha ao gerar Log!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

      Entidade.Close;
      Entidade.ParamByName('PCP_CODIGO').asInteger := CdPCP;
      Entidade.Open;
      Entidade.CarregaDados;
      ProcessarPedido.Enabled:=False;
      SB_Processar.Enabled:=False;
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

procedure TfMxPedComp.SB_ProcessarClick(Sender: TObject);
Var
  Trans:Boolean;
  PrecoCus,CustoMedio,vValorItemBonus,
    vTotalBonificacao,vFreteReal,
    vPercFrete,vPercICMSFrete,vQtdAnterior,vCustoAnterior,vCustoTotal,vPrecoFinal,vPrecoMinimo:Double;
  mensagem, sAutorizado, Sequencia:string;
  Aux:TDataSetNotifyEvent;
  DataValida, TPGVencimento, vVencimentoHoyat: TDateTime;
  CdCNC, CdPCP, CNCNota, iCNCEntrega, iCFOP, iTipoNota, CdFUN, CdFPE, CdLOT, vPrazoMedio, CodCCX, CodTPG: integer;
  vTotalItemHoyat: Double;
begin
  vCustoTotal := 0;
  if entidade.IsEmpty then
    Raise Exception.Create('Selecione o Pedido de Compra!');

  try
    vPercFrete := StrToFloat(edtFretePerc.Text);
  except
    vPercFrete := 0;
  end;

  try
    vPercICMSFrete := StrToFloat(edtICMSFretePrec.Text);
  except
    vPercICMSFrete := 0;
  end;

  try
    vFreteReal := StrToFloat(edtFreteReal.Text);
  except
    vFreteReal := 0;
  end;

  //Valor do Hoyat para gerar o titulo
  vTotalItemHoyat := strtofloat(edtTotalHoyat.Text);
  vVencimentoHoyat := StrToDateTime(mskEmissao.Text);

  mensagem:='';
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) or
     (Entidade.CodigoCNC <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Você não pode Processar Pedido de Compra deste centro de custo.');
  If Entidade.Situacao=1 Then
    raise Exception.Create('Esse Pedido foi Cancelado!')
  Else If Entidade.Situacao=2 Then
    raise Exception.Create('Esse Pedido já foi Processado!');
  If Item_Pedido_Compra1.IsEmpty then
    raise Exception.Create('Não foram criados itens do pedido de compra!');
  If dblNaturezaOperacao.Text = '' Then
    mensagem:=mensagem+'Natureza da Operação incorreta!'+#13;
  if not VerificaDataBranco(mskEntrega.Text) then
    mensagem:=mensagem+'Data de Entrega inválida!'+#13;
  If dblFormaDePagamento.Text = '' Then
    mensagem:=mensagem+'Forma de Pagamento incorreta!'+#13;
  If dblTipoDeDocumento.Text = '' Then
    mensagem:=mensagem+'Tipo de Documento incorreta!'+#13;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CCX_CODIGO AS CONTA '+
      ' FROM FORNECEDOR '+
      ' WHERE FOR_CODIGO='+IntToStr(dblCodigoFOR.KeyValue);
    Open;
    if not (FieldByName('CONTA').asInteger > 0) then
      mensagem:=mensagem+'Fornecedor sem Conta de Caixa!'+#13;
  end;
  if mensagem <> '' then
    Raise Exception.Create(mensagem);

  mensagem := '' ;

  if ( DM.Configuracao1.Empresa = empTodas ) and ( DM.Configuracao1.EstoqueIdeal ) then
  begin
    if (edtNotaFiscal.Text = '0') or (edtNotaFiscal.Text = '') then
    begin
      SB_AltPedClick(SB_AltPed);
      edtNotaFiscal.SetFocus;
      Raise Exception.Create('Informe o número da nota fiscal do fornecedor!')
    end;
  end
  else
  begin
    if (edtNotaFiscal.Text = '0') and
       (not (ckbSN.Checked or ckbLJ4.Checked)) then
      Raise Exception.Create('Incompatibilidade de LOJA (LJ3/LJ4)!')
    else if (edtNotaFiscal.Text <> '0') and
            (ckbSN.Checked or ckbLJ4.Checked) then
      Raise Exception.Create('Incompatibilidade de LOJA (LJ3/LJ4)!');
  end;

  sAutorizado := '';
  if (edtNotaFiscal.Text = '0') then
  Begin
    If MessageDlg('ATENÇÃO!!!'+#13+
                  'Não foram inseridos os Dados da Nota!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    if DM.Usuario1.Permissoes.IndexOf(IntToStr(6260)) < 0 then //Confirmar Sem Nota
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=29;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if usuario1.Permissoes.IndexOf(IntToStr(6260)) < 0 then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para confirmar Pedido sem Dados da Nota!');
          end
          else
            sAutorizado := 'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU);
        end
        else
        begin
          free;
          exit;
        end;
        free;
      End;
    end;
  end
  else
  Begin
    If MessageDlg('ATENÇÃO!!!'+#13+
                  'Deseja processar esse pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    if DM.Usuario1.Permissoes.IndexOf(IntToStr(8850)) < 0 then //Confirmar com Nota
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=29;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if usuario1.Permissoes.IndexOf(IntToStr(8850)) < 0 then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para confirmar Pedido com Dados da Nota!');
          end
          else
            sAutorizado := 'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU);
        end
        else
        begin
          free;
          exit;
        end;
        free;
      End;
    end;

    if not VerificaDataBranco(mskEmissao.Text) then
      mensagem:=mensagem+'Data de Emissão inválida!'+#13;
    if not VerificaDataBranco(mskEntrada.Text) then
      mensagem:=mensagem+'Data de Entrada inválida!'+#13;
  end;
  if mensagem <> '' then
    Raise Exception.Create(mensagem);

  If MessageDlg('ATENÇÃO!!!'+#13+
                'Esse processo é irreversível!'+#13+
                'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  Entidade.Close;
  Entidade.Open;

  try
    DataValida := StrToDate(mskEmissao.Text);
  except
    DataValida := StrToDate(mskEntrega.Text);
  end;

  try
    if StrToFloat(InputBox('Conferir Valores', 'Total da Nota:', '')) <> StrToFloat(edtTotalNota.Text) then
    Begin
      ShowMessage('Valor não confere!');
      Exit;
    end;
  except
    ShowMessage('Valor inválido!');
    Exit;
  end;

  CdCNC := Entidade.CodigoCNC;
  CdPCP := Entidade.CodigoPCP;
  Aux:=Item_Pedido_Compra1.AfterScroll;
  Item_Pedido_Compra1.AfterScroll:=Nil;
  Item_Pedido_Compra1.Close;
  Item_Pedido_Compra1.Open;

  vTotalBonificacao := 0;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT IPC_BONIFICACAO,IPC_AMOSTRA,IPC_PRECO,IPC_PRECO_FINAL,IPC_DESCONTOS,IPC_IPI '+
      ' FROM ITEM_DE_PEDIDO_DE_COMPRA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PCP_CODIGO='+IntToStr(Entidade.CodigoPCP)+
      ' AND (IPC_BONIFICACAO>0 OR IPC_AMOSTRA>0) ';
    Open;
    while not Eof do
    Begin
      vValorItemBonus :=  Arredonda(CalculaDesconto(FieldByName('IPC_PRECO').asFloat,
                                                    FieldByName('IPC_DESCONTOS').asString),4);
      vTotalBonificacao := vTotalBonificacao + vValorItemBonus*(FieldByName('IPC_BONIFICACAO').asFloat+FieldByName('IPC_AMOSTRA').asFloat);
      if (Trim(FieldByName('IPC_IPI').asString) <> '') and
         (Trim(FieldByName('IPC_IPI').asString) <> '0') then
        vTotalBonificacao := vTotalBonificacao + ((FieldByName('IPC_BONIFICACAO').asFloat+FieldByName('IPC_AMOSTRA').asFloat)*
                             Arredonda(vValorItemBonus*FieldByName('IPC_IPI').asFloat/100));
      Next;
    end;
  end;

  Item_Pedido_Compra2.Close;
  Item_Pedido_Compra2.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
  Item_Pedido_Compra2.ParamByName('PCP_CODIGO').asInteger := Entidade.CodigoPCP;
  Item_Pedido_Compra2.Open;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUN := dblCNCEntrega.KeyValue
  else
    CdFUN := 0;
  //Criar Itens de Estoque dos produtos que não tem.
  if (DM.Configuracao1.Empresa = empLBM) or
     (DM.Configuracao1.Empresa = empLUCIANO) or
     (Entidade.CNCEntrega=DM.Configuracao1.CodigoCNC) then
  Begin
    with Item_Pedido_Compra2 do
    Begin
      First;
      while not EOF do
      Begin
        Item_de_Estoque1.Close;
        Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CNCEntrega;
        Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
        Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
        Item_de_Estoque1.open;
        If Item_de_Estoque1.isempty then
        begin
          if not Item_de_Estoque1.Inserir(Entidade.CNCEntrega,CodigoPRD,CdFUN,0,0,0,0,0,
            DM.Configuracao1.DataHora,0,0,0,0,0,0) then
          Begin
            Raise exception.Create('Falha ao inserir Item de Estoque! CNC:'+IntToStr(Entidade.CNCEntrega)+
                                   ' PRD:'+IntToStr(CodigoPRD));
          end;
        end;

        if CodigoLOT > 0 then
        Begin
          DM.Item_de_Estoque_Detalhe1.Close;
          DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CNCEntrega;
          DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CodigoLOT;
          DM.Item_de_Estoque_Detalhe1.open;
          If DM.Item_de_Estoque_Detalhe1.isempty then
          Begin
            if not DM.Item_de_Estoque_Detalhe1.Inserir(Entidade.CNCEntrega,CodigoLOT,CodigoPRD) then
            Begin
              Raise exception.Create('Falha ao inserir Item de Estoque Detalhe! CNC:'+IntToStr(Entidade.CNCEntrega)+
                                     ' PRD:'+IntToStr(CodigoPRD)+' LOT:'+IntToStr(CodigoLOT));
            end;
          end;
        end;

        Next;
      end;

      if CConfiguracao.Empresa = empLUCIANO then
      Begin
        First;
        while not EOF do
        Begin
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := 1;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
          Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
          Item_de_Estoque1.open;
          If Item_de_Estoque1.isempty then
          Begin
            if not Item_de_Estoque1.Inserir(1,CodigoPRD,CdFUN,0,0,0,0,0,
              DM.Configuracao1.DataHora,0,0,0,0,0,0) then
            Begin
              Raise exception.Create('Falha ao inserir Item de Estoque! CNC:1 '+
                                     ' PRD:'+IntToStr(CodigoPRD));
            end;
          end;

          if CodigoLOT > 0 then
          Begin
            DM.Item_de_Estoque_Detalhe1.Close;
            DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := 1;
            DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CodigoLOT;
            DM.Item_de_Estoque_Detalhe1.open;
            If DM.Item_de_Estoque_Detalhe1.isempty then
            begin
              DM.Item_de_Estoque_Detalhe1.Inserir(1,CodigoLOT,CodigoPRD);
              DM.Item_de_Estoque_Detalhe1.Close;
              DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := 1;
              DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CodigoLOT;
              DM.Item_de_Estoque_Detalhe1.open;
            end;
          end;

          Next;
        end;
      end;
    end;
  end;

  CdFPE     := 0;
  if DM.Configuracao1.Empresa = empLuciano then
  Begin
    Application.CreateForm(TfMxFinalizaPedido, fMxFinalizaPedido);
    with fMxFinalizaPedido do
    Begin
      Tag:=2;
      iCdCLI    := 0;
      iCdCLICNC := 0;
      //Verificar a Vista
      if dblFormaDePagamento.KeyValue = 1 then
        rdbPendente.Enabled := False;
      rdbPrePago.Enabled := False;
      rdbRemessa.Enabled := False;

      ShowModal;
      if iOpcaoEscolhida < 0 then
        Raise exception.Create('Operação Cancelada!');

      if iOpcaoEscolhida = 1 then
        CdFPE := -1;
    end;
  end;

  vPrazoMedio := -1;
  iSomarDataBase := 0;
  if DM.Configuracao1.Empresa = empEletro then
  Begin
    If MessageDlg('Deseja gerar os títulos pelo prazo médio?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      vPrazoMedio := Forma_de_Pagamento1.PrazoMedio;
      try
        iSomarDataBase := StrToInt(InputBox('Ajuste de Data Base', 'Dias da DataBase:', ''));
      except
        ShowMessage('Número de dias inválido!');
        Exit;
      end;
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

      if CdFPE <> -1 then
      Begin
        //Gerar título a pagar
        Titulo_a_pagar1.Close;
        Titulo_a_pagar1.SQL.Text:='SELECT * FROM TITULO_A_PAGAR '+
                                  'WHERE TPG_CODIGO = -1';
        Titulo_a_pagar1.Open;
        Forma_de_Pagamento2.Open;
        if vPrazoMedio > 0 then
        Begin
          if not GerarTitulosPrazoMedio then
          Begin
            ShowMessage('Erro ao gerar Títulos a Pagar pelo prazo médio!');
            Raise Exception.Create('');
          end;
        end
        else if not Entidade.GerarTitulos(Entidade.TotalFinal,StrToFloat(edtFreteReal.Text),False(*Pendentes*)) then
        Begin
          ShowMessage('Erro ao gerar Títulos a Pagar!');
          Raise Exception.Create('');
        end;
        Titulo_a_pagar1.Close;
      end;

      //Mudar situação para pedido com títulos gerados
      With Entidade do
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
          ' PCP_SITUACAO=2 '+
          ',FPE_CODIGO='+IntToStr(CdFPE)+ //Quando for faturamento pendente será -1
          ',PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND PCP_CODIGO='+IntToStr(CodigoPCP));

        {if (DM.Configuracao1.Empresa <> empLBM) and
           (Entidade.CNCEntrega<>DM.Configuracao1.CodigoCNC) and //Entrega fora
           ((CConfiguracao.Empresa <> empLuciano) OR (edtNotaFiscal.Text <> '0')) then //Luciano gera Pre-Recebimento somente se for Fiscal}

        if (DM.Configuracao1.Empresa <> empLBM) and
           (Entidade.CNCEntrega<>DM.Configuracao1.CodigoCNC) then //Entrega fora
        Begin
          if not Pre_Recebimento1.Active then
            Pre_Recebimento1.Open;
          if not Pre_Recebimento1.Inserir(0,CNCEntrega,0,Item_Pedido_Compra1.RecordCount,2,CodigoCNC,CodigoPCP,
              StrToInt(edtNotaFiscal.Text),OBS,CodigoFOR,DataEntrega,DataSaida,DataValida,IntToStr(CodigoPCP)) then
          Begin
            ShowMessage('Erro ao gerar Pre-Recebimento');
            Raise Exception.Create('');
          end;
        end;
      end;
      with Item_Pedido_Compra2 do
      Begin
        First;
        while not EOF do
        Begin
          CdLOT := CodigoLOT;
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
          Produto1.Open;
          PrecoCus := CalculaPrecoCusto(Preco, PrecoFinal, Quantidade, Bonificacao, Amostra,
            IPI, UF_ICMS2.ICMSCompra, UF_ICMS2.ICMSVenda, vPercICMSFrete,
            vFreteReal, Descontos);

          //Verificar o Estoque Fiscal Atual
          Item_de_Estoque2.Close;
          Item_de_Estoque2.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          Item_de_Estoque2.Open;
          vQtdAnterior := Item_de_Estoque2.FieldByName('QTD').asFloat;
          vCustoAnterior := 0;
          Custo1.Close;
          Custo1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
          Custo1.Open;
          Custo1.First;
          if vQtdAnterior > 0 then
          Begin
            if not Custo1.IsEmpty then
            Begin
              vCustoAnterior := Custo1.PrecoMedio;
              CustoMedio := ((PrecoCus*Quantidade) + (vCustoAnterior*vQtdAnterior)) / (Quantidade+vQtdAnterior);
            end
            else
              CustoMedio:=PrecoCus;
          end
          else
            CustoMedio:=PrecoCus;
          //
          if edtNotaFiscal.Text <> '0' then
          Begin
            if not Custo1.Inserir(0,CodigoPCP,CodigoCNC,CodigoPRD,dblCodigoFOR.KeyValue,
               vCustoAnterior,vQtdAnterior,Quantidade,CalculaDesconto(Preco,Descontos),PrecoFinal,
               PrecoCus,CustoMedio,vPercFrete,UF_ICMS2.ICMSVenda,vPercICMSFrete,IPI) then
            Begin
              ShowMessage('Erro ao gerar Custo!');
              Raise Exception.Create('');
            end;
            vCustoTotal := vCustoTotal + CustoMedio;
          end
          else
            vCustoTotal := vCustoTotal + (Custo1.FieldByName('CUS_VALOR_MEDIO').asFloat*Quantidade);

          if Entidade.PrecoFinalDefinido then
          Begin
            vPrecoMinimo := PrecoFinal;
            vPrecoFinal  := PrecoFinal;
          end
          else
          Begin
            vPrecoFinal  := CalculaDesconto(Preco, Descontos, 4);
            vPrecoFinal  := vPrecoFinal + Arredonda(vPrecoFinal*IPI/100,4);
            vPrecoMinimo := CalculaDesconto(Preco, Descontos, 4);
            vPrecoMinimo := vPrecoMinimo + Arredonda(vPrecoMinimo*IPI/100,4);
          end;
          vPrecoMinimo := vPrecoMinimo + Arredonda(vPrecoMinimo*Entidade.Frete/100,4);
          vPrecoMinimo := vPrecoMinimo + Arredonda(vPrecoMinimo*Entidade.PercentualCusto/100,4);

          if DM.Configuracao1.Empresa = empLBM then
            ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
              ' PRD_DT_ULT_COMPRA="'+MesDia(DataValida)+'" '+
              ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD))
          else if (DM.Configuracao1.Empresa=empEletro) then
            ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
              ' PRD_DT_ULT_COMPRA="'+MesDia(DataValida)+'" '+
              ',PRD_CUSTO='+VirgPonto(vPrecoFinal)+
              ',PRD_PRECO_COMPRA='+VirgPonto(CalculaDesconto(Preco,Descontos,2))+
              ',PRD_PRECO_MEDIO='+VirgPonto(vPrecoMinimo)+ //Preço Mínimo
              ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD))
          else if (DM.Configuracao1.Empresa=empLuciano) then
            ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
              ' PRD_DT_ULT_COMPRA="'+MesDia(DataValida)+'" '+
              ',PRD_PRECO_COMPRA='+VirgPonto(CalculaDesconto(Preco,Descontos))+
              (*',PRD_CUSTO='+VirgPonto(PrecoCus)+*)
              ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD))
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
              ' PRD_DT_ULT_COMPRA="'+MesDia(DataValida)+'" '+
              ',PRD_PRECO_COMPRA='+VirgPonto(CalculaDesconto(Preco,Descontos))+
              ',PRD_CUSTO='+VirgPonto(PrecoCus)+
              ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD));

          //MOTICAL
          //Alterar o preço de todos os produtos do subgrupo
          if DM.Configuracao1.Empresa = empMotical then
          Begin
            ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
              ' PRD_PRECO_COMPRA='+VirgPonto(CalculaDesconto(Preco,Descontos))+
              ',PRD_CUSTO='+VirgPonto(PrecoCus)+
              ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE SGP_CODIGO='+IntToStr(Produto1.CodigoSGP));
          end;

          if (DM.Configuracao1.Empresa <> empLBM) and
             (DM.Configuracao1.Empresa <> empLuciano) and
             (Entidade.CNCEntrega<>DM.Configuracao1.CodigoCNC) then
          Begin
            if not Item_Pre_Recebimento1.Active then
              Item_Pre_Recebimento1.Open;
            if not Item_Pre_Recebimento1.Inserir(Entidade.CNCEntrega,0,Pre_Recebimento1.SCodigo,CodigoPRD,Quantidade,0,2) then
            Begin
              ShowMessage('Erro ao gerar Item de Pre-Recebimento');
              Raise Exception.Create('');
            end;
          end
          else  //LBM ou LUCIANO ou Entrega no Local
          Begin
            if (DM.Configuracao1.Empresa <> empLuciano) then
              iCNCEntrega := Entidade.CNCEntrega
            else
              iCNCEntrega := DM.Configuracao1.CodigoCNC;
            Item_de_Estoque1.Close;
            Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := iCNCEntrega;
            Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
            Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
            Item_de_Estoque1.open;
            If Item_de_Estoque1.isempty then
            begin
              ShowMessage('Produto sem item de estoque!');
              Raise exception.Create('');
            end;

            //Luciano Gera Pre Recebimento para dar entrada Fiscal na Loja e gera Movimento Fisico/COmercial no CPD.
            if (DM.Configuracao1.Empresa = empLuciano) and
               (iCNCEntrega <> Entidade.CNCEntrega) and
               (edtNotaFiscal.Text <> '0') then
            Begin
              if not Item_Pre_Recebimento1.Active then
                Item_Pre_Recebimento1.Open;
              if not Item_Pre_Recebimento1.Inserir(Entidade.CNCEntrega,0,Pre_Recebimento1.SCodigo,CodigoPRD,Quantidade,0,2) then
              Begin
                ShowMessage('Erro ao gerar Item de Pre-Recebimento');
                Raise Exception.Create('');
              end;
            end;

            //Gerar Movimentos de Entrada Física, Comercial e Fiscal (se tiver Nota)
            If not DM.Movimento_Estoque_Comercial1.Inserir(iCNCEntrega,0,
                CodigoPRD,CdFUN,360,CodigoCNC,CodigoPCP,'E', Quantidade,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, Amostra, Item_de_Estoque1.SBonificacao, Bonificacao) Then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;

            If not DM.Movimento_Fisico1.Inserir(iCNCEntrega,0,CodigoPRD,CdFUN,
                CodigoCNC,CodigoPCP,360(*Compra*),'E',Quantidade,
                Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end;

            if (edtNotaFiscal.Text <> '0') then
            Begin
              if not DM.Mov_Est_Fiscal1.Inserir(Entidade.CNCEntrega,CodigoPRD,CdFUN,0,
                 CodigoCNC,StrToInt(edtNotaFiscal.Text),360, 'E', Quantidade,
                 Item_de_Estoque1.SFiscal,
                 Item_de_Estoque1.SAmostraFiscal, Amostra, Item_de_Estoque1.SBonificacaoFiscal, Bonificacao) then
              Begin
                ShowMessage('Falha ao inserir Movimento Fiscal!');
                Raise  exception.Create('');
              end;
              //
              if (iCNCEntrega = Entidade.CNCEntrega) then
              Begin

                if CdLOT>0 then
                Begin
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                    ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
                    ',IED_QTD_FISCAL=IED_QTD_FISCAL+'+VirgPonto(Quantidade)+
                    ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                    ' AND LOT_CODIGO='+IntToStr(CdLOT));
                end;

                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                  ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(Amostra)+
                  ',IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA_FISCAL=IES_SAMOSTRA_FISCAL+'+VirgPonto(Amostra)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN));
              end
              else
              begin

                if CdLOT>0 then
                Begin
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                    ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
                    ',IED_QTD_FISCAL=IED_QTD_FISCAL+'+VirgPonto(Quantidade)+
                    ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(iCNCEntrega)+
                    ' AND LOT_CODIGO='+IntToStr(CdLOT));
                end;

                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA_FISCAL=IES_SAMOSTRA_FISCAL+'+VirgPonto(Amostra)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega));
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                  ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(Amostra)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(iCNCEntrega)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN));
              end;
            end
            else if ckbSN.Checked then
            Begin
              If not DM.Movimento_Estoque_SN1.Inserir(Entidade.CNCEntrega,CodigoPRD,CdFUN,
                  14(*Compra*),CodigoCNC,CodigoPCP,
                  'E',Quantidade,
                  Item_de_Estoque1.SSN) then
              Begin
                ShowMessage('Falha ao Gerar Mov. SN!');
                Raise Exception.Create('');
              end;
              //
              if (iCNCEntrega = Entidade.CNCEntrega) then
              Begin

                if CdLOT>0 then
                Begin
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                    ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
                    ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                    ' AND LOT_CODIGO='+IntToStr(CdLOT));
                end;

                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                  ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(Amostra)+
                  ',IES_SSN=IES_SSN+'+VirgPonto(Quantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN));
              end
              else
              begin

                if CdLOT>0 then
                Begin
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                    ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
                    ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(iCNCEntrega)+
                    ' AND LOT_CODIGO='+IntToStr(CdLOT));
                end;

                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SSN=IES_SSN+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(Amostra)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega));
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                  ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(Amostra)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(iCNCEntrega)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN));
              end;
            end
            else if ckbLJ4.Checked then
            Begin
              If not DM.Movimento_Estoque_LJ41.Inserir(Entidade.CNCEntrega,CodigoPRD,CdFUN,
                  14(*Compra*),CodigoCNC,CodigoPCP,
                  'E',Quantidade,
                  Item_de_Estoque1.SLJ4) then
              Begin
                ShowMessage('Falha ao Gerar Mov. LJ4!');
                Raise Exception.Create('');
              end;
              //
              if (iCNCEntrega = Entidade.CNCEntrega) then
              Begin

                if CdLOT>0 then
                Begin
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                    ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
                    ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                    ' AND LOT_CODIGO='+IntToStr(CdLOT));
                end;

                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                  ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(Amostra)+
                  ',IES_SLJ4=IES_SLJ4+'+VirgPonto(Quantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN));
              end
              else
              begin

                if CdLOT>0 then
                Begin
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                    ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
                    ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(iCNCEntrega)+
                    ' AND LOT_CODIGO='+IntToStr(CdLOT));
                end;

                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SLJ4=IES_SLJ4+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(Amostra)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(Entidade.CNCEntrega));
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                  ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                  ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(Bonificacao)+
                  ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(Amostra)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(iCNCEntrega)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN));
              end;
            end;
          end;

          // Atualizar Produto por Fornecedor
          Produto_por_Fornecedor1.Close;
          Produto_por_Fornecedor1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
          Produto_por_Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=dblCodigoFOR.KeyValue;
          Produto_por_Fornecedor1.Open;
          If Produto_por_Fornecedor1.isEmpty then
          Begin
            if not Produto_por_Fornecedor1.Inserir(0,CodigoPRD,dblCodigoFOR.KeyValue) then
            Begin
              ShowMessage('Erro ao gerar Produto por Fornecedor');
              Raise Exception.Create('');
            end;
          end;
          Next;
        end;
      end;
      //
      if edtNotaFiscal.Text <> '0' then
      Begin
        with Entidade do
        Begin
          Close;
          Open;
          if DM.Configuracao1.Empresa = empEletro then
            CNCNota := DM.Configuracao1.CodigoCNC
          else
            CNCNota := CNCEntrega;

          if DM.Configuracao1.Empresa = empHOPE then
          Begin
            iTipoNota := 365;
            iCFOP     := 1152;
          end
          else
          Begin
            iTipoNota := 360;
            iCFOP     := dblNaturezaOperacao.KeyValue;
          end;

          if not NotaFiscal1.Inserir(CNCNota,0,CodigoCNC,CodigoPCP,
            iCFOP (*CFOP*),CodigoFOR,CodigoTRN,0(*ClienteCNC*),
            0(*CodigoCLI*),0(*CodigoFUN*), NotaFiscal,0,0,iTipoNota,0,TipoFrete,Selo,
            2,Conhecimento,1 (*Nota*), 0(*CodPagamento*), 0(*CodPagamento2*),0(*Arquiteto*),
            BaseCalculo,ICMS,BaseCalculoSub,ICMSSub,0,TotalProduto,
            TotalNota,TotalIPI,Frete,ICMSFrete,0(*Quantidade*),0 (*Base ISS*),
            0 (*ISS*),0(*Outras*),Serie,SubSerie, OBS,''(*UF*),DataEmissao,DataSaida) then
          Begin
            ShowMessage('Erro ao gerar Nota Fiscal');
            Raise Exception.Create('');
          end;
        end;
        with Item_Pedido_Compra2 do
        Begin
          First;
          while not EOF do
          Begin
            Produto1.Close;
            Produto1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
            Produto1.Open;
            if TipoICMS = 0 then
            Begin
              if not Item_Nota_Fiscal1.Inserir(CNCNota,0,NotaFiscal1.SCodigo,CodigoPRD,CodigoLOT,
                TipoICMS,UF_ICMS2.ICMSVenda(*AliquotaICMS*),0(*AliquotaISS*),
                Quantidade,Preco,Preco-CalculaDesconto(Preco,Descontos),
                Arredonda(IPI),Bonificacao,Amostra,
                Produto1.Descricao) then
              Begin
                ShowMessage('Erro ao gerar Item de Nota Fiscal (a)');
                Raise Exception.Create('');
              end;
            end
            else
            Begin
              if not Item_Nota_Fiscal1.Inserir(CNCNota,0,NotaFiscal1.SCodigo,CodigoPRD,CodigoLOT,
                TipoICMS,UF_ICMS2.ICMSVenda(*AliquotaICMS*),0(*AliquotaISS*),
                Quantidade,Preco,Preco-CalculaDesconto(Preco,Descontos),
                Arredonda(IPI),Bonificacao,Amostra,Produto1.Descricao) then
              Begin
                ShowMessage('Erro ao gerar Item de Nota Fiscal (b)');
                Raise Exception.Create('');
              end;
            end;
            Next;
          end;
        end;
      end;

      if (edtNotaFiscal.Text = '0') then
      Begin
        //Processar Pedido de Compra sem dados da Nota
        if not Entidade.GeraLog(6890, CdCNC, CdPCP, sAutorizado) then
        Begin
          ShowMessage('Falha ao gerar Log!');
          Raise exception.Create('');
        end;
      end
      else
      Begin
        //Processar Pedido de Compra com dados da Nota
        if not Entidade.GeraLog(8850, CdCNC, CdPCP, sAutorizado) then
        Begin
          ShowMessage('Falha ao gerar Log!');
          Raise exception.Create('');
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

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


  //Alan - Criar o título so com o Hoyat
  if vTotalItemHoyat > 0 then
  begin
    try
      CodCCX := 0;

      with DM.QR_Consultas do
      begin
        Close;
        SQL.Text := 'SELECT CCX_CODIGO AS CONTA '+
          ' FROM FORNECEDOR '+
          ' WHERE FOR_CODIGO='+IntToStr(Entidade.CodigoFOR);
        Open;

        CodCCX := FieldByName('CONTA').asInteger;
      end;

      CodTPG := Titulo_a_Pagar1.ProximoCodigo('TPG_CODIGO');
      TPGVencimento := vVencimentoHoyat+45;

      with DM.QR_Consultas do
      begin
        Close;
        SQL.Text := 'SELECT COUNT(PCP_CODIGO) AS QUANTIDADE FROM TITULO_A_PAGAR'+
          ' WHERE PCP_CODIGO='+inttostr(CdPCP)+
          ' AND CNC_CODIGO='+inttostr(CdCNC);
        Open;

        Sequencia := inttostr(FieldByName('QUANTIDADE').AsInteger + 1);
      end;

      if strtoint(Sequencia) <= 9 then
        Insert('0',Sequencia,0);

      ExecutaSQL(DM.QR_Comandos,'INSERT INTO TITULO_A_PAGAR (CNC_CODIGO,TPG_CODIGO,PCP_CODIGO,BNF_CODIGO,CCX_CODIGO,'+
        'CCX_CODIGO_REC,FOR_CODIGO,TRN_CODIGO,TPG_TIPO_DOC,TPG_TIPO_PERIODO,TPG_OBSERVACAO,TPG_CUSTODIA,'+
        'TPG_NUMERO,TPG_VENCIMENTO,TPG_PAGAMENTO,TPG_DTORIGINAL,TPG_DT_COMPETENCIA,TPG_VALOR,TPG_VALOR_PAGO,'+
        'TPG_FORMA_PGTO,TPG_SEQUENCIA,TPG_TIPO_PAG,TPG_TITULOANT,TPG_TPGORIGINAL,TPG_GEROU_MOVIMENTO,CNC_ORIGEM,'+
        'TPG_SITUACAO,USU_CODIGO,TPG_DT_CADASTRO,TPG_DESCONTO,TPG_JUROS)'+
        ' VALUES('+inttostr(CdCNC)+','+inttostr(CodTPG)+','+inttostr(CdPCP)+',0,'+inttostr(CodCCX)+','+
        '0,'+inttostr(Entidade.CodigoFOR)+',0,78,0,''HOYAT Ped. de Compra '+inttostr(CdPCP)+''','''','+
        ''''+{inttostr(CdPCP)+'Z}''','''+MesDia(TPGVencimento)+''',NULL,0,'''+MesDia(DM.Configuracao1.DataHora)+''','+VirgPonto(vTotalItemHoyat)+',0,'+
        '''45'','''+Sequencia+''',5,0,0,0,1,0,'+inttostr(DM.Configuracao1.CodigoUSU)+','''+MesDia(DM.Configuracao1.DataHora)+''','+
        '0,0)');

    except
      ShowMessage('Erro ao gerar Títulos a Pagar (Hoyat)!');
      Raise Exception.Create('');
    end;
  end;
  //
  //Verificar os títulos a pagar do pedido
  Item_Pedido_Compra1.AfterScroll:=aux;
  if CdFPE <> -1 then
  Begin
    If MessageDlg('Deseja ver os títulos desse Pedido?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      with fMxPagar do
      Begin
        Application.CreateForm(TfMxPagar, fMxPagar);
        Tag := 0;
        fMxPagar.edtLocalizar.Text  := fMxPedComp.edtCodigoPCP.Text;
        fMxPagar.cmbCampo.ItemIndex := 2;
        fMxPagar.SB_LocClick(sender);


  //      edtCodigoPCP.Text := fMxPedComp.edtCodigoPCP.Text;
        {Entidade.Close;
        if DM.Configuracao1.Empresa <> empLBM then
          Entidade.Sql.Text := 'SELECT * FROM TITULO_A_PAGAR '+
            ' WHERE CNC_CODIGO='+IntToStr(dblCNCEntrega.KeyValue)+
            ' AND PCP_CODIGO='+fMxPedComp.edtCodigoPCP.Text+
            ' ORDER BY TPG_CODIGO '
        else
          Entidade.Sql.Text := 'SELECT * FROM TITULO_A_PAGAR '+
            ' WHERE PCP_CODIGO='+fMxPedComp.edtCodigoPCP.Text+
            ' ORDER BY TPG_CODIGO';}
        ShowModal;
      end;
    End;
  end;
  Entidade.Close;
  Entidade.ParamByName('PCP_CODIGO').asInteger := CdPCP;
  Entidade.Open;

  //Enviar mensagem para os gerente informando a compra da Mercadoria
  if (DM.Configuracao1.Empresa = empEletro) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT CNC_CODIGO, FUN_USU_CODIGO '+
        ' FROM FUNCIONARIO '+
        ' WHERE FUN_FUNCAO=56 '+
        ' AND FUN_SITUACAO=0 '+
        ' AND FUN_USU_CODIGO>0 '; //Gerente
      Open;
      while not Eof do
      Begin
        DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,FieldByName('CNC_CODIGO').asInteger, FieldByName('FUN_USU_CODIGO').asInteger,
          1,0,'Pedido de Compra','Foi confirmado um Pedido de Compra do Fornecedor '+dblCodigoFOR.Text);
        Next;
      end;
    end;
  end;
end;

procedure TfMxPedComp.SB_NovoPedClick(Sender: TObject);
begin
  vRecalculado := False;
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3660)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir Pedido de Compra!');
  Entidade.Close;
  Entidade.ParamByName('PCP_CODIGO').asInteger := -1;
  Entidade.Open;
  Entidade.PreparaInsercao;
  if (not DM.Configuracao1.CPD) then
    dblCNCEntrega.Enabled := False;
  if DM.Configuracao1.Empresa = empLBM then
    dblCNCEntrega.KeyValue := 2;

  if (DM.Configuracao1.Empresa = empTodas) then
  begin
    dblCNCEntrega.KeyValue := 1;
    dblCNCEntrega.Enabled := false;
  end;

  edtUsuario.Text:=DM.Usuario1.NomeUSU;
  Item_Pedido_Compra1.Close;
  AtualizaControles(1,True);
  TOTALPED:=0;
  IPITOT:=0;
  FRETETOT:=0;
  ICMTOT:=0;
  edtFretePerc.Text:='0';
  edtICMSFretePrec.Text:='0';

  //Alan
  edtTotalFinal.Text := '0';
  edtTotalHoyat.Text := '0';
  edtCodigoPRD.Text := '0';
  edtQuantidade.Text := '0';
  edtPrecoUnit.Text := '0';
  edtPrecoFinal.Text := '0';
  edtPrecoCusto.Text := '0';
  EditHoyat.Text := '0';
  EditTotalHoyat.Text := '0';

  edtMarca.Clear;
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtDetalhe.Clear;
  edtTotalItem.Clear;
  edtFreteReal.Text:='0';
  edtICMSFreteReal.Text:='0';
  if DM.Configuracao1.Empresa <> empLBM then
    mskEntrega.Text:=FormatDateTime('dd/mm/yyyy',DM.Configuracao1.Data+30)
  else
    mskEntrega.Clear;
  cmbTipoICMS.ItemIndex:=-1;
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  try
    dblCNCEntrega.SetFocus;
  except
    try
      mskEntrega.SetFocus;
    except
    end;
  end;
end;

procedure TfMxPedComp.SB_AltPedClick(Sender: TObject);
var
  CdPCP:integer;
begin
  vRecalculado := False;
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If Entidade.Situacao>=1 Then
    raise Exception.Create('Esse Pedido de Compra já foi processado ou cancelado!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3670)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Pedido de Compra!');
  //Atualizar Campos
  CdPCP := Entidade.CodigoPCP;
  Entidade.Close;
  Entidade.ParamByName('PCP_CODIGO').asInteger := CdPCP;
  Entidade.Open;

  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);

  if (DM.Configuracao1.Empresa = empTodas) then
    dblCNCEntrega.Enabled := false;
    
  try
    dblCNCEntrega.SetFocus;
  except
    mskEntrega.SetFocus;
  end;
end;

procedure TfMxPedComp.SB_ExcPedClick(Sender: TObject);
var
  CdPCP:integer;
begin
if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Não é permitido excluir registros de outro Centro de Custo!');
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  If Entidade.Situacao>=1 Then
    raise Exception.Create('Esse Pedido já foi Processado ou Cancelado!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3680)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Pedido de Compra!');

  CdPCP:=Entidade.CodigoPCP;
  Entidade.Close;
  Entidade.ParamByName('PCP_CODIGO').asInteger := CdPCP;
  Entidade.Open;

  if Entidade.deletarauto then
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_PEDIDO_DE_COMPRA WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PCP_CODIGO='+IntToStr(Entidade.CodigoPCP));

  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    Item_Pedido_Compra1.LimpaCampos;
    mskEntrega.Clear;
    mskEntrada.Clear;
    edtTotalItem.Clear;
    edtSituacao.Clear;
    edtCodigoPCP.Clear;
    edtFretePerc.Clear;
    edtICMSFretePrec.Clear;
    edtMarca.Clear;
    edtProduto.Clear;
    edtUnidade.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtTotalProduto.Clear;
    edtTotalIPI.Clear;
    edtTotalNota.Clear;
    edtTotalFinal.Clear;
    edtFreteReal.Clear;
    edtTotalHoyat.Clear;
    edtICMSFreteReal.Clear;
    memObservacao.Clear;
    cmbTipoICMS.ItemIndex := -1;
  end;
end;

procedure TfMxPedComp.SB_SalvaPedClick(Sender: TObject);
var
  vMarcas: array of string;
  i, j, iEstado: integer;
  sMarca: string;
  vMarcaAceita: Boolean;
begin
  if Trim(edtTotalIPI.Text) = '' then
    edtIPI.Text := '0,00';
  if not VerificaFloatBranco(edtTotalIPI.Text) then
    raise Exception.Create('Total do IPI inválido!');
  if not vRecalculado then
  Begin
    if ABS(StrToFloat(edtICMS.Text)-Entidade.ICMS) > 0.99 then
      raise Exception.Create('Diferença do ICMS muito elevada!'+#13+'Verifique Itens!');
    if ABS(StrToFloat(edtTotalIPI.Text)-Entidade.TotalIPI) > 0.99 then
      raise Exception.Create('Diferença do Total do IPI muito elevada!'+#13+'Verifique Itens!');
  end;
  if VerificaDataBranco(mskEmissao.Text) and VerificaDataBranco(mskEntrega.Text) then
    if StrToDate(mskEntrega.Text) < StrToDate(mskEmissao.Text) then
      Raise exception.Create('Data de Entrega inferior a data de emissão!');

  if (DM.Configuracao1.Empresa = empLBM) and
     (not Item_Pedido_Compra1.IsEmpty) then
  Begin
    SetLength(vMarcas, 1);
    vMarcas[0] := '';
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FOR_MARCA AS MARCA '+
        ' FROM FORNECEDOR '+
        ' WHERE FOR_CODIGO='+IntToStr(dblCodigoFOR.KeyValue);
      Open;
      sMarca := Trim(FieldByName('MARCA').asString);
      if Trim(sMarca) = '' then
        Raise Exception.Create('Marca do Produto diferente da Marca do Fornecedor!');
      j := 0;
      for i:=1 to Length(sMarca) do
      Begin
        if sMarca[i] = ';' then
        Begin
          SetLength(vMarcas, High(vMarcas)+2);
          inc(j);
        end
        else
          vMarcas[j] := vMarcas[j] + sMarca[i];
      end;
      vMarcaAceita := False;

      Close;
      SQL.Text := 'SELECT DISTINCT P1.PRD_MARCA AS PRD_CODIGO '+
        ' FROM PRODUTO P1, ITEM_DE_PEDIDO_DE_COMPRA I1 '+
        ' WHERE I1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND I1.PCP_CODIGO='+IntToStr(Entidade.CodigoPCP)+
        ' AND P1.PRD_CODIGO=I1.PRD_CODIGO ';
      Open;
      while not Eof do
      Begin
        vMarcaAceita := False;
        for i:=0 to High(vMarcas) do
        Begin
          if (Trim(FieldByName('PRD_CODIGO').asString) = Trim(vMarcas[i])) then
          Begin
            vMarcaAceita := True;
            Break;
          end;
        end;
        if not vMarcaAceita then
          Raise Exception.Create('Marca do Produto diferente da Marca do Fornecedor!');
        Next;
      end;
      if not vMarcaAceita then
        Raise Exception.Create('Marca do Produto diferente da Marca do Fornecedor!');
    end;
  end;

  if edtDesconto.Text = '' then
    edtDesconto.Text := '0';

  if VerificaInteiroBranco(edtNotaFiscal.Text) and
     VerificaInteiroBranco(edtSelo.Text) and
     (Trim(edtNotaFiscal.Text)<>'0') and
     (Trim(edtSelo.Text)<>'0') then
  Begin
    NotaFiscal1.Close;
    NotaFiscal1.ParamByName('NTF_NOTA_FISCAL').asInteger:=StrToInt(edtNotaFiscal.Text);
    NotaFiscal1.ParamByName('NTF_SELO').asInteger:=StrToInt(edtSelo.Text);
    if DM.Configuracao1.Empresa = empHOPE then
      NotaFiscal1.ParamByName('NTF_TIPO_NOTA').asInteger := 365    //Transferência
    else
      NotaFiscal1.ParamByName('NTF_TIPO_NOTA').asInteger := 360; //Compra
    NotaFiscal1.Open;
    if not NotaFiscal1.IsEmpty then
      Raise Exception.Create('Já exite um nota gerada com esse número e esse selo!');
  end;

  iEstado := Entidade.Estado;
  if not Entidade.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');
    
  If not Item_Pedido_Compra1.Active then
    Item_Pedido_Compra1.Open;
  AtualizaControles(1,False);
  Item_Pedido_Compra1.Open;
  edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
  if iEstado = 1 then
    SB_NovoItemClick(sender);
end;

procedure TfMxPedComp.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
  If Item_Pedido_Compra1.Active=False then
    Item_Pedido_Compra1.Open;
end;


procedure TfMxPedComp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If (SB_SalvaItem.Enabled) or (SB_SalvaPed.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxPedComp.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxPedComp.SB_ImprimirClick(Sender: TObject);
begin
  if entidade.IsEmpty then
    Raise Exception.Create('Selecione o Pedido de Compra!');

  Application.CreateForm(TfmxSelRelatorioCompra,fmxSelRelatorioCompra);
  with fmxSelRelatorioCompra do
  Begin
    Tag := 0;
    CdCNC := self.Entidade.CodigoCNC;
    CdPCP := self.Entidade.CodigoPCP;
    vLJ4  := self.ckbLJ4.Checked;
    ShowModal;
  end;
end;


procedure TfMxPedComp.SB_LocPedClick(Sender: TObject);
begin
  Application.CreateForm(TfMxPedSCompra, fMxPedSCompra);
  with fMxPedSCompra do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

procedure TfMxPedComp.Pedido_de_Compra1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxPedComp.Item_Pedido_Compra1CalcFields(DataSet: TDataSet);
begin
  with Produto3 do
  Begin
    if (not Active) or
       (CodigoPRD <> Item_Pedido_Compra1.CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Compra1.CodigoPRD;
      Open;
    end;
    Item_Pedido_Compra1.FieldByName('Produto').asString        := Descricao;
    Item_Pedido_Compra1.FieldByName('Caracteristica').asString := Caracteristica;
    Item_Pedido_Compra1.FieldByName('Referencia').asString     := Referencia;
    Item_Pedido_Compra1.FieldByName('Detalhe').asString        := Detalhe;
    Item_Pedido_Compra1.FieldByName('Unidade').asString        := Unidade;
    Item_Pedido_Compra1.FieldByName('Marca').asString          := Marca;
  end;

  try
    Item_Pedido_Compra1.FieldByName('TotalItem').asString := format('%.2f',[
      Arredonda(CalculaDesconto(Item_Pedido_Compra1.Preco, Item_Pedido_Compra1.Descontos), 4)*Item_Pedido_Compra1.Quantidade]);
  except
    Item_Pedido_Compra1.FieldByName('TotalItem').asString := '0,00';
  end;
end;

procedure TfMxPedComp.FormCreate(Sender: TObject);
begin
  Entidade:=Pedido_de_Compra1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_PCP_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxPedComp.dblCodigoFORClick(Sender: TObject);
var
  CdFOR: integer;
begin
  if UpperCase(Fornecedor1.Uf) = DM.Configuracao1.UF then
    dblNaturezaOperacao.KeyValue := 1102
  else
    dblNaturezaOperacao.KeyValue := 2102;

  if dblCodigoFOR.Text <> '' then
    CdFOR := dblCodigoFOR.KeyValue
  else
    CdFOR := 0;

  with Contato1 do
  Begin
    if (CodigoCNT <> Entidade.CodigoCNT) or
       (CodigoFOR <> CdFOR) then
    Begin
      Close;
      ParamByName('CNT_CODIGO').asInteger := Entidade.CodigoCNT;
      ParamByName('FOR_CODIGO').asInteger := CdFOR;
      Open;
    end;
    if IsEmpty then
      Entidade.CdCNT := 0
    else
      Entidade.CdCNT := CodigoCNT;
  end;

  with UF_ICMS1 do
  Begin
    Close;
    ParamByName('UFI_UF').asString := DM.Configuracao1.UF;
    Open;
  end;

  with UF_ICMS2 do
  Begin
    Close;
    ParamByName('UFI_UF').asString := Fornecedor1.Uf;
    Open;
  end;
end;

procedure TfMxPedComp.Pedido_de_Compra1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);

  edtTotalHoyat.Text := Format('%.2f' ,[Entidade.fieldbyname('PCP_TOTAL_HOYAT').AsFloat]);
end;

procedure TfMxPedComp.SB_FreteClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Seleciona primeiro o Pedido de Compra!');
  Application.CreateForm(TfMxFrete, fMxFrete);
  fMxFrete.Tag:=0;
  with fMxFrete do
  Begin
    fMxFrete.ckbFreteNota.Checked := self.ckbFreteNota.Checked;
    ShowModal;
  end;
end;

procedure TfMxPedComp.SB_InfAdicionaisClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Seleciona primeiro o Pedido de Compra!');
  Application.CreateForm(TfMxInformacoesPedidoDeCompra, fMxInformacoesPedidoDeCompra);
  fMxInformacoesPedidoDeCompra.Tag:=0;
  with fMxInformacoesPedidoDeCompra do
  Begin
    Edit1.Text := IntToStr(Fornecedor1.CodigoFOR);
    edit2.Text := Fornecedor1.RazaoSocial;
    Contato1.ParamByName('FOR_CODIGO').asInteger:=Fornecedor1.CodigoFOR;
    Contato1.Open;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3670)) >= 0) and
       (Entidade.Situacao = 0)  then
    Begin
      dblContato.Enabled := True;
      dblContato.Color   := clWindow;
      BitBtn1.Enabled     := True;
    end;
    dblContato.KeyValue := Entidade.CodigoCNT;
    dblContatoClick(Sender);
    ShowModal;    
  end;
end;

procedure TfMxPedComp.SB_CalculaFreteClick(Sender: TObject);
begin
  Application.CreateForm(TfMxCalculaFrete, fMxCalculaFrete);
  fMxCalculaFrete.ShowModal;
end;

procedure TfMxPedComp.edtFretePercChange(Sender: TObject);
begin
  if (VerificaFloatBranco(edtFretePerc.text)) and (VerificaFloatBranco(edtTotalProduto.text)) and
     (VerificaFloatBranco(edtTotalNota.text)) then
  Begin
    if DM.Configuracao1.Empresa = empEletro then
      edtFreteReal.Text := format('%.2f',[StrToFloat(edtTotalNota.Text)*StrToFloat(edtFretePerc.Text)/100])
    else
      edtFreteReal.Text := format('%.2f',[StrToFloat(edtTotalProduto.Text)*StrToFloat(edtFretePerc.Text)/100]);
  end;
end;

procedure TfMxPedComp.edtFreteRealChange(Sender: TObject);
begin
  if (VerificaFloatBranco(edtFreteReal.text)) and (VerificaFloatBranco(edtICMSFretePrec.text)) then
    edtICMSFreteReal.Text := format('%.2f',[StrToFloat(edtFreteReal.Text)*StrToFloat(edtICMSFretePrec.Text)/100]);
end;


function TfMxPedComp.CalculaPrecoCusto(PPrecoUnit, PPrecoFinal, PQtd, PBonus, PAmostra, PIPI, PICMSCompra,
  PICMSVenda, PFretePerc, PFreteReal: Double; PDesconto: string;PSomaNoPedido:Boolean=False):Double;
var
  PrecoCus,Preco1,Preco2,Preco3,Preco4,ICMS1,ICMS2,ICMS3,
    PrecoIPISemICMS,PrecoFrete: Double;
  iPrecoFinalDefinido: integer;
begin
  if Entidade.Situacao <> 0 then
    PSomaNoPedido := False;

  if Entidade.PrecoFinalDefinido then
    iPrecoFinalDefinido := 1
  else
    iPrecoFinalDefinido := 0;

  PrecoCus := 0;

  Preco1:=Arredonda(CalculaDesconto(PPrecoUnit,PDesconto), 4);

  Preco2:=Arredonda(Preco1+(Preco1*PIPI/100), 4);

  Preco3:=Arredonda(Preco2*PQtd, 4);

  if PSomaNoPedido then
  Begin
    edtTotalProduto.Text := format('%.2f',[StrToFloat(edtTotalProduto.Text)+(Preco1*PQtd)]);
    edtTotalIPI.Text := format('%.2f',[StrToFloat(edtTotalIPI.Text)+
                        (Preco2-Preco1)*PQtd]);
  end;

  case cmbTipoICMS.ItemIndex of
    0:Begin
        if DM.Configuracao1.Empresa = empEletro then             //Frete em cima do IPI
          PrecoCus:=Preco1+Arredonda(Arredonda(Preco1*PIPI/100,4)*PFretePerc/100,4)+
            Arredonda(Preco1*PIPI/100,4)-
            Arredonda(Preco1*PICMSVenda(*UF_ICMS2.ICMSVenda*)/100,4)-
            Arredonda(Arredonda(Preco1*PIPI/100,4)*PFretePerc/100,4)
        else
          PrecoCus:=Preco1+Arredonda(Preco1*PFretePerc/100,4)+
            Arredonda(Preco1*PIPI/100,4)-
            Arredonda(Preco1*PICMSVenda(*UF_ICMS2.ICMSVenda*)/100,4)-
            Arredonda(Preco1*PFretePerc/100,4);
        if PSomaNoPedido then
        Begin
          edtBaseCalculo.Text:=format('%.2f',[StrToFloat(edtBaseCalculo.Text)+
            (Preco1-Preco1*Fornecedor1.ReducaoICMS/100)*PQtd]);
          edtICMS.Text:=format('%.2f',[StrToFloat(edtICMS.Text)+
            Arredonda((Preco1-Preco1*Fornecedor1.ReducaoICMS/100)*PQtd)*
            UF_ICMS2.ICMSVenda/100]);
        end;
      end;
    1:Begin
        Preco4:=Preco3*1.3; // ( adiciona 30%)
        if PSomaNoPedido then
        Begin
          edtBaseCalculoSub.Text:=format('%.2f',[StrToFloat(edtBaseCalculoSub.Text)+
            (Preco4-Preco4*Fornecedor1.ReducaoICMS/100)]);
          edtICMSSub.Text:=format('%.2f',[StrToFloat(edtICMSSub.Text)+
            Arredonda(Preco4-Preco4*Fornecedor1.ReducaoICMS/100)]);
        end;
        ICMS1:=(Preco4*PICMSVenda/100);
        ICMS2:=((Preco1*PICMSCompra/100)*PQtd)+(PFreteReal*PICMSCompra/100);
        ICMS3:=ICMS1 - ICMS2;
        //Preço Básico + Frete + IPI + Diferença ICMS
        PrecoCus:=Preco3/PQtd  + ICMS3;
      end;
  end;

  if PSomaNoPedido then
  Begin
    if Entidade.FreteNota then
    Begin
      edtFretePercChange(edtFretePerc);
      edtBaseCalculo.Text := format('%.2f',[StrToFloat(edtBaseCalculo.Text)+StrToFloat(edtFreteReal.Text)]);
      edtICMS.Text := format('%.2f',[StrToFloat(edtICMS.Text)+StrToFloat(edtICMSFreteReal.Text)]);
      edtTotalNota.Text  := format('%.2f',[StrToFloat(edtTotalNota.Text)+(Preco1*PQtd)+StrToFloat(edtTotalIPI.Text)+StrToFloat(edtFreteReal.Text)]);
      if (PPrecoUnit <> PPrecoFinal) or
         (iPrecoFinalDefinido = 1) then
        edtTotalFinal.Text := format('%.2f',[StrToFloat(edtTotalFinal.Text)+(PPrecoFinal*(PQtd-PBonus-PAmostra))+StrToFloat(edtFreteReal.Text)])
      else
        edtTotalFinal.Text := format('%.2f',[StrToFloat(edtTotalFinal.Text)+(CalculaDesconto(PPrecoUnit, PDesconto)*(PQtd-PBonus-PAmostra))+StrToFloat(edtTotalIPI.Text)+StrToFloat(edtFreteReal.Text)])
    end
    else
    Begin
      edtTotalNota.Text:=format('%.2f',[StrToFloat(edtTotalNota.Text)+(Preco1*PQtd)+StrToFloat(edtTotalIPI.Text)]);
      if (PPrecoUnit <> PPrecoFinal) or
         (iPrecoFinalDefinido = 1) then
        edtTotalFinal.Text := format('%.2f',[StrToFloat(edtTotalFinal.Text)+(PPrecoFinal*(PQtd-PBonus-PAmostra))])
      else
        edtTotalFinal.Text := format('%.2f',[StrToFloat(edtTotalFinal.Text)+(CalculaDesconto(PPrecoUnit, PDesconto)*(PQtd-PBonus-PAmostra))+StrToFloat(edtTotalIPI.Text)]);
    end;
  end;

  if DM.Configuracao1.PercentualCusto > 0 then
  Begin
    //Preço Com IPI - ICMS (Usado somente na Eletro)
    if DM.Configuracao1.Empresa = empEletro then
    Begin
      PrecoIPISemICMS := Preco2*PQtd -
        Preco1*PQtd*PICMSVenda/100 -
        Preco2*PQtd*PFretePerc/100;
      PrecoFrete := Preco2*PQtd*PFretePerc/100;
    end
    else
    Begin
      PrecoIPISemICMS := Preco2*PQtd -
        Preco1*PQtd*PICMSVenda/100 -
        Preco1*PQtd*PFretePerc/100;
      PrecoFrete := Preco1*PQtd*PFretePerc/100;
    end;
    //(Preco Com IPI - ICMS de Compra + Frete) / (1 - Perc.Custo)% / Preco Com IPI
    try
      PrecoCus:=100*Preco1*
        ((PrecoIPISemICMS+PrecoFrete)/
        (100-DM.Configuracao1.PercentualCusto)/
        (Preco1*PQtd));
    except
      PrecoCus := 0;
    end;
  end;
  if PSomaNoPedido then
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
      ' PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ',PCP_TOTAL_PRODUTO='+VirgPonto(edtTotalProduto.Text)+
      ',PCP_TOTAL_IPI='+VirgPonto(edtTotalIPI.Text)+
      ',PCP_TOTAL_NOTA='+VirgPonto(edtTotalNota.Text)+
      ',PCP_TOTAL_FINAL='+VirgPonto(edtTotalFinal.Text)+
      ',PCP_BASE_CALCULO='+VirgPonto(edtBaseCalculo.Text)+
      ',PCP_BASE_CALCULO_SUB='+VirgPonto(edtBaseCalculoSub.Text)+
      ',PCP_ICMS='+VirgPonto(edtICMS.Text)+
      ',PCP_ICMS_SUB='+VirgPonto(edtICMSSub.Text)+
      ',PCP_FRETE='+VirgPonto(edtFretePerc.Text)+
      ',PCP_PRECO_FINAL_DEFINIDO='+IntToStr(iPrecoFinalDefinido)+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND PCP_CODIGO='+IntToStr(Entidade.CodigoPCP));
    Entidade.Close;
    Entidade.Open;
    edtFretePercChange(edtFretePerc);
  end;
  Result := Arredonda(PrecoCus,4);

  if PSomaNoPedido then
  Begin
    if (not Entidade.PrecoFinalDefinido) and
       (PPrecoUnit<>PPrecoFinal) then
      Recalcula;
  end;
end;

procedure TfMxPedComp.Recalcula;
var
  Preco1,Preco2,Preco3,Preco4,vTotalFinal, vPrecoTotalItem, vTotalHoyat: Double;
  aux:TDataSetNotifyEvent;
  iPrecoFinalDefinido: integer;
Begin
  if Entidade.Situacao <> 0 then
    Exit;

  aux:=Item_Pedido_Compra1.AfterScroll;
  Item_Pedido_Compra1.AfterScroll:=nil;
  try
    Item_Pedido_Compra1.Close;
    Item_Pedido_Compra1.Open;
    edtICMS.Text           :='0';
    edtBaseCalculo.Text    :='0';
    edtTotalProduto.Text   :='0';
    edtTotalIPI.Text       :='0';
    edtTotalNota.Text      :='0';
    edtTotalFinal.Text     :='0';
    edtICMSSub.Text        :='0';
    edtBaseCalculoSub.Text :='0';
    edtTotalHoyat.Text     :='0';

    vTotalHoyat := 0;
    vTotalFinal := 0;

    iPrecoFinalDefinido := 0;

    with Item_Pedido_Compra2 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      ParamByName('PCP_CODIGO').asInteger := Entidade.CodigoPCP;
      Open;
      while not EOF do
      Begin
        //Calculo do Hoyat
        vPrecoTotalItem := Arredonda(CalculaDesconto(Item_Pedido_Compra2.Preco, Item_Pedido_Compra2.Descontos), 4)*Item_Pedido_Compra2.Quantidade;
        vTotalHoyat := vTotalHoyat + (Item_Pedido_Compra2.fieldByName('IPC_HOYAT').AsFloat * vPrecoTotalItem/100);

        if Arredonda(Preco) <> Arredonda(PrecoFinal) then
          vTotalFinal := vTotalFinal + PrecoFinal*(Quantidade-Bonificacao-Amostra)
        else
          vTotalFinal := vTotalFinal + CalculaDesconto(Preco, Descontos)*(Quantidade-Bonificacao-Amostra);
        //Preço Básico = Preço de Compra - Desconto
        Preco1:=Arredonda(CalculaDesconto(Preco,Descontos), 4);
        //Preço C/ IPI = Preço Básico + IPI
        Preco2:=Arredonda(Preco1+(Preco1*IPI/100), 4);
        //Preco C/ IPI * Quantidade
        Preco3:=Arredonda(Preco2*Quantidade, 4);
        case cmbTipoICMS.ItemIndex of
          0: Begin
              edtTotalProduto.Text:= format('%.2f',[StrToFloat(edtTotalProduto.Text)+Preco1*Quantidade]);
              edtTotalIPI.Text    := format('%.2f',[StrToFloat(edtTotalIPI.Text)+(Preco2-Preco1)*Quantidade]);
              edtBaseCalculo.Text := format('%.2f',[StrToFloat(edtBaseCalculo.Text)+
                (Preco1-Preco1*Fornecedor1.ReducaoICMS/100)*Quantidade]);
              edtICMS.Text        := format('%.2f',[StrToFloat(edtICMS.Text)+
                Arredonda((Preco1-Preco1*Fornecedor1.ReducaoICMS/100)*Quantidade*UF_ICMS2.ICMSVenda/100)]);
             end;
          1: Begin
              Preco4:=Preco3*1.3; // ( adiciona 30%)
              edtTotalProduto.Text:=format('%.2f',[StrToFloat(edtTotalProduto.Text)+Preco1*Quantidade]);
              edtTotalIPI.Text    :=format('%.2f',[StrToFloat(edtTotalIPI.Text)+(Preco2-Preco1)*Quantidade]);
              edtBaseCalculoSub.Text:=format('%.2f',[StrToFloat(edtBaseCalculoSub.Text)+
                (Preco4-Preco4*Fornecedor1.ReducaoICMS/100)]);
              edtICMSSub.Text:=format('%.2f',[(StrToFloat(edtICMSSub.Text)+
                Arredonda((Preco4-Preco4*Fornecedor1.ReducaoICMS/100)*UF_ICMS2.ICMSVenda)/100)]);
             end;
        end;
        if Preco <> PrecoFinal then
          iPrecoFinalDefinido := 1;
        Next;
      end;
    end;

    if Entidade.FreteNota then
    Begin
      edtFretePercChange(edtFretePerc);
      edtBaseCalculo.Text := format('%.2f',[StrToFloat(edtBaseCalculo.Text)+StrToFloat(edtFreteReal.Text)]);
      edtICMS.Text := format('%.2f',[StrToFloat(edtICMS.Text)+StrToFloat(edtICMSFreteReal.Text)]);
      edtTotalNota.Text:=format('%.2f',[StrToFloat(edtTotalProduto.Text)+StrToFloat(edtTotalIPI.Text)+StrToFloat(edtFreteReal.Text)]);
      if iPrecoFinalDefinido = 1 then
        edtTotalFinal.Text := format('%.2f',[vTotalFinal+StrToFloat(edtFreteReal.Text)])
      else
        edtTotalFinal.Text := format('%.2f',[vTotalFinal+StrToFloat(edtTotalIPI.Text)+StrToFloat(edtFreteReal.Text)]);
    end
    else
    Begin
      edtTotalNota.Text:=format('%.2f',[StrToFloat(edtTotalProduto.Text)+StrToFloat(edtTotalIPI.Text)]);
      if iPrecoFinalDefinido = 1 then
        edtTotalFinal.Text := format('%.2f',[vTotalFinal])
      else
        edtTotalFinal.Text := format('%.2f',[vTotalFinal+StrToFloat(edtTotalIPI.Text)]);
    end;

    edtTotalHoyat.Text := format('%.2f',[vTotalHoyat]);

    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
      ' PCP_TOTAL_PRODUTO='+VirgPonto(edtTotalProduto.Text)+
      ',PCP_TOTAL_IPI='+VirgPonto(edtTotalIPI.Text)+
      ',PCP_TOTAL_NOTA='+VirgPonto(edtTotalNota.Text)+
      ',PCP_TOTAL_HOYAT='+VirgPonto(edtTotalHoyat.Text)+
      ',PCP_TOTAL_FINAL='+VirgPonto(edtTotalFinal.Text)+
      ',PCP_PRECO_FINAL_DEFINIDO='+IntToStr(iPrecoFinalDefinido)+
      ',PCP_BASE_CALCULO='+VirgPonto(edtBaseCalculo.Text)+
      ',PCP_BASE_CALCULO_SUB='+VirgPonto(edtBaseCalculoSub.Text)+
      ',PCP_ICMS='+VirgPonto(edtICMS.Text)+
      ',PCP_ICMS_SUB='+VirgPonto(edtICMSSub.Text)+
      ',PCP_FRETE='+VirgPonto(edtFretePerc.Text)+
      ',PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PCP_CODIGO='+IntToStr(Entidade.CodigoPCP));
    Entidade.Close;
    Entidade.Open;
  finally
    Item_Pedido_Compra1.AfterScroll:=aux;
  end;

  if not Item_Pedido_Compra1.IsEmpty then
    Item_Pedido_Compra1.First;
  edtFretePercChange(edtFretePerc);
end;

procedure TfMxPedComp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancItem.Enabled then
    Begin
      try
        SB_CancItem.SetFocus;
      except
      end;
      SB_CancItemClick(sender);
    end
    else if SB_SalvaPed.Enabled then
    Begin
      try
        SB_CancPed.SetFocus;
      except
      end;
      SB_CancPedClick(sender);
    end
    else
      Close;
  end
  else if Key=chr(13) then
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      try
        SB_SalvaPed.SetFocus;
      except
      end;
      SB_SalvaPedClick(sender);
    end
    else if SB_SalvaItem.Enabled then
    Begin
      try
        SB_SalvaItem.SetFocus;
      except
      end;
      SB_SalvaItemClick(sender);
    end;
  end
  else if ((edtIPI.Focused)or(edtPrecoUnit.Focused)or(edtICMS.Focused)or
           (edtQuantidade.Focused)or(edtBaseCalculo.Focused)or(edtICMSSub.Focused)or
           (edtBonificacao.Focused)or(edtAmostra.Focused)or
           (edtBaseCalculoSub.Focused))and(Key = '.') then
    Key := ',';
end;

procedure TfMxPedComp.SB_EtiquetasClick(Sender: TObject);
var
  sProduto, sCodigoBarras, Linha: string;
  PUmPoQuantidade: Boolean;
  iQuantidade, i: integer;
  Arq: TextFile;
begin
  if Item_Pedido_Compra1.IsEmpty then
    Raise Exception.Create('Pedido sem itens!');
  Etiquetas1.Close;
  Etiquetas1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CodigoCNC;
  Etiquetas1.ParamByName('PCP_CODIGO').AsInteger := Entidade.CodigoPCP;
  Etiquetas1.Open;
  if Etiquetas1.IsEmpty then
    Raise Exception.Create('Arquivo NÃO gerado!');

  PUmPoQuantidade := (MessageDlg('Deseja um registro para cada item do produto?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes);

  if MessageDlg('Gerar etiquetas EAN RED?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    {EAN RED}
    Linha := '';
    AssignFile (Arq, 'C:\Etiquetas.txt' );
    Rewrite(Arq);

    Writeln(Arq, 'produto1;produto2;preco;descricao;Referencia;Detalhe;Caracteristica;'+
      'Marca;CodBarras;Quantidade;QtdxPreco');

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

      iQuantidade := Etiquetas1.FieldByName('IPC_QUANTIDADE').asInteger;

      for i := 1 to iQuantidade do
      begin
        Linha := FormatarCBarra(inttostr(Etiquetas1.CodigoPRD))+';'+inttostr(Etiquetas1.CodigoPRD)+';'+
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
    {Abri Barcode39a}
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

      iQuantidade := Etiquetas1.FieldByName('IPC_QUANTIDADE').asInteger;

      if (DM.Configuracao1.Empresa = empEletro) and
         (iQuantidade > 0) and
         (Etiquetas1.Estmedio > 1) then //Volume
        iQuantidade := Trunc(iQuantidade*Etiquetas1.Estmedio); //Volume

      Etiquetas1.AdicionaEtiqueta(Etiquetas1.CodigoPRD, Etiquetas1.Precovenda,
         iQuantidade, sProduto,
         Etiquetas1.Referencia, Etiquetas1.Detalhe, Etiquetas1.Caracteristica, Etiquetas1.Marca, sCodigoBarras, PUmPoQuantidade);
      Etiquetas1.Next;
    end;
    Etiquetas1.FechaEtiquetas;
    ShowMessage('Arquivo gerado com sucesso !');
    Etiquetas1.Close;
  end;
end;

procedure TfMxPedComp.Pedido_de_Compra2BeforeOpen(DataSet: TDataSet);
begin
  Pedido_de_Compra2.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
end;

procedure TfMxPedComp.edtTotalIPIExit(Sender: TObject);
begin
  if edtTotalIPI.Enabled then
    try
      if Entidade.FreteNota then
        edtTotalNota.Text := format('%.2f',[StrToFloat(edtTotalProduto.Text)+StrToFloat(edtTotalIPI.Text)+
                                            Arredonda(Entidade.Frete*StrToFloat(edtTotalProduto.Text)/100)])
      else
        edtTotalNota.Text := format('%.2f',[StrToFloat(edtTotalProduto.Text)+StrToFloat(edtTotalIPI.Text)]);
    except
    end;
end;

procedure TfMxPedComp.edtPrecoUnitChange(Sender: TObject);
begin
  try
    edtTotalItem.Text := format('%.2f',[
      CalculaDesconto(StrToFloat(edtPrecoUnit.Text),edtDesconto.Text)*StrToFloat(edtQuantidade.Text)]);
    if edtPrecoUnit.Enabled and
       edtPrecoUnit.Focused then
      edtPrecoFinal.Text := edtPrecoUnit.Text;
  except
    edtTotalItem.Clear;
  end;
end;

procedure TfMxPedComp.SB_AltItemClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione o Pedido antes!');
  if Item_Pedido_Compra1.IsEmpty then
    raise exception.Create('Não há dados para Alteração!');
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3670)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Pedido de Compra!');
  If Entidade.Situacao>=1 Then
    raise Exception.Create('Esse Pedido já foi Processado ou Cancelado!');

  try
    if (StrToInt(edtCodigoPRD.text) > 0) and
       (StrToInt(edtCodigoPRD.text) <> Item_Pedido_Compra1.CodigoPRD) then
      Item_Pedido_Compra1.CarregaDados;
  except
  end;

  EditHoyat.Enabled := True;
  //EditTotalHoyat.Enabled := True;

  Item_Pedido_Compra1.PreparaAlteracao;
  AtualizaControles(2,True);
  try
    edtQuantidade.SetFocus;
  except
  end;
end;

procedure TfMxPedComp.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirPed.Enabled    := not Habilitar;
  AlterarPed.Enabled    := not Habilitar;
  ExcluirPed.Enabled    := not Habilitar;
  SalvarPed.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarPed.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarPedido.Enabled    := not Habilitar;
  SB_NovoPed.Enabled    := not Habilitar;
  SB_LocPed.Enabled     := not Habilitar;
  SB_AltPed.Enabled     := not Habilitar;
  SB_ExcPed.Enabled     := not Habilitar;
  SB_SalvaPed.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled    := ((Cabecalho=1) and Habilitar);

  IncluirItem.Enabled   := not Habilitar;
  AlterarItem.Enabled   := not Habilitar;
  ExcluirItem.Enabled   := not Habilitar;
  SalvarItem.Enabled    := ((Cabecalho=2) and Habilitar);
  CancelarItem.Enabled  := ((Cabecalho=2) and Habilitar);
  SB_NovoItem.Enabled   := not Habilitar;
  SB_AltItem.Enabled    := not Habilitar;
  SB_ExcItem.Enabled    := not Habilitar;
  SB_SalvaItem.Enabled  := ((Cabecalho=2) and Habilitar);
  SB_CancItem.Enabled   := ((Cabecalho=2) and Habilitar);

  VerificarMercadoria1.Enabled := not Habilitar;
  DefinirIPIPedido.Enabled := not Habilitar;
  ImprimirPedido.Enabled   := not Habilitar;
  CancelarPedido.Enabled   := not Habilitar;
  DefinirDescontoAcrescimo1.Enabled := not Habilitar;
//  SB_Recalcula.Enabled     := ((Cabecalho=1) and Habilitar);
  SB_Frete.Enabled         := not Habilitar;
  SB_InfAdicionais.Enabled := not Habilitar;
  SB_CalculaFrete.Enabled  := not Habilitar;
  SB_Verificar.Enabled     := not Habilitar;
  SB_Imprimir.Enabled      := not Habilitar;
  SB_Etiquetas.Enabled     := not Habilitar;
  SB_Cancelar.Enabled      := not Habilitar;
  SB_Fechar.Enabled        := not Habilitar;
  SB_Transferencia.Enabled := not Habilitar;

  if not Entidade.IsEmpty then
  begin
    if (Entidade.Situacao = 2) or Habilitar then
    Begin
      ProcessarPedido.Enabled := False;
      SB_Processar.Enabled := False;
    end
    else
    Begin
      ProcessarPedido.Enabled := True;
      SB_Processar.Enabled := True;
    end;
  end
  else
  Begin
    ProcessarPedido.Enabled := False;
    SB_Processar.Enabled := False;
  end;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfMxPedComp.edtICMSChange(Sender: TObject);
begin
  vRecalculado := False;
end;

procedure TfMxPedComp.edtTotalNotaChange(Sender: TObject);
begin
  vRecalculado := False;
end;

procedure TfMxPedComp.DefinirIPIPedidoClick(Sender: TObject);
var
  vIPI: Double;
begin
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3670)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Pedido de Compra!');
  If Entidade.Situacao>=1 Then
    raise Exception.Create('Esse Pedido já foi Processado ou Cancelado!');

  If MessageDlg('ATENÇÃO!!!'+#13+'Esse procedimento irá alterar o IPI de todos os Itens!'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    vIPI := StrToFloat(InputBox('Percentual do IPI', 'IPI (%):', '0'));
  except
    ShowMessage('Valor do IPI inválido!');
    Exit;
  end;

  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_COMPRA SET '+
    ' IPC_IPI='+VirgPonto(vIPI)+
    ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
    ' AND PCP_CODIGO='+IntToStr(Entidade.CodigoPCP));
  Recalcula;
end;

procedure TfMxPedComp.DefinirDescontoAcrescimo1Click(Sender: TObject);
begin
  if Item_Pedido_Compra1.IsEmpty then
    Raise Exception.Create('Só é válido para pedidos com itens já cadastrados!');

  if Entidade.Situacao <> 0 then
    Raise Exception.Create('Pedido não pode ser alterado!');

  Application.CreateForm(TfMxDescontoPedidoCompra, fMxDescontoPedidoCompra);
  with fMxDescontoPedidoCompra do
  Begin
    Entidade.Close;
    Entidade.ParamByName('CNC_CODIGO').asInteger := self.Entidade.CodigoCNC;
    Entidade.ParamByName('PCP_CODIGO').asInteger := self.Entidade.CodigoPCP;
    Entidade.Open;
    ShowModal;
  end;
  Recalcula;
end;

procedure TfMxPedComp.memObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfMxPedComp.SB_VerificarClick(Sender: TObject);
begin
  if Item_Pedido_Compra1.isEmpty then
    Raise exception.Create('Selecione Pedido com Itens!');

  Application.CreateForm(TfMxVerificarMercadoria, fMxVerificarMercadoria);
  with fMxVerificarMercadoria do
  Begin
    Tag := 0; //Tipo Compra
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Entidade.CodigoPCP));
    edtCodigoCNC.Text := IntToStr(self.Entidade.CodigoCNC);
    edtPedido.Text    := IntToStr(self.Entidade.CodigoPCP);
    edtDescricao.Text := IntToStr(self.Entidade.CodigoFOR);
    Showmodal;
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Entidade.CodigoPCP));
  end;
end;

procedure TfMxPedComp.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Item_Pedido_Compra1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_Pedido_Compra1.SOrdemdoGrid(Item_Pedido_Compra1.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxPedComp.ckbSNClick(Sender: TObject);
begin
  if ckbSN.Checked then
    ckbLJ4.Checked := False;
end;

procedure TfMxPedComp.ckbLJ4Click(Sender: TObject);
begin
  if ckbLJ4.Checked then
    ckbSN.Checked := False;
end;

procedure TfMxPedComp.GerarTransferncia1Click(Sender: TObject);
var
  Trans:Boolean;
  CdCNC, CdFUN, vTipoDoc: integer;
  vGerarFPE: Boolean;
begin
  if (DM.Configuracao1.Empresa <> empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) or
     (Entidade.CodigoCNC <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Você não pode gerar transferência de Pedido de Compra deste centro de custo.');
  If Entidade.Situacao<>2 Then
    raise Exception.Create('Esse Pedido ainda não foi Processado!');

  CentroTRF := -1;
  Application.CreateForm(TfMXSelCentroCusto, fMXSelCentroCusto);
  with fMXSelCentroCusto do
  Begin
    Tag := 1;
    ShowModal;
  end;

  if fMXSelCentroCusto.dblCodigoCNC.KeyValue = DM.Configuracao1.CodigoCNC then
      Raise Exception.Create('Transferência com Destino igual a Origem!');

  if CentroTRF < 0 then
    Raise exception.Create('Cancelada a geração da transferência!');


  CdCNC := DM.Configuracao1.CodigoCNC;

  If not Transferencia1.Active then
    Transferencia1.Open;
  if not Item_de_Transferencia1.Active then
    Item_de_Transferencia1.Open;

  vGerarFPE := False;
  if Entidade.CodigoFPE > 0 then
    If MessageDlg('Deseja gerar transferência para todos os pedidos do faturamento de pendentes?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      vGerarFPE := True;

  with Item_Pedido_Compra3 do
  Begin
    Close;
    if vGerarFPE then
      SQL.Text := 'SELECT * '+
        ' FROM ITEM_DE_PEDIDO_DE_COMPRA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND FPE_CODIGO='+IntToStr(Entidade.CodigoFPE)
    else
    Begin
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      ParamByName('PCP_CODIGO').asInteger := Entidade.CodigoPCP;
    end;
    Open;
  end;

  if dblTipoDeDocumento.Text <> '' then
    vTipoDoc := dblTipoDeDocumento.KeyValue
  else
    vTipoDoc := DM.Configuracao1.TipoDocumento;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Inserir Cabecalho
      if not Transferencia1.Inserir(CdCNC, 0, Item_Pedido_Compra3.RecordCount,
          CdCNC, CentroTRF,CdCNC(*CdFUNOrigem*),CentroTRF(*CdFUNDestino*), ''(*OBS*),
          False (*Automática*), Entidade.CodigoPCP, 0(*Sit*), vTipoDoc, Entidade.CodigoFPG) then
      Begin
        ShowMessage('Falha ao gerar Transferência!');
        raise exception.Create('');
      end;

      if DM.Configuracao1.Empresa in TEmpresasEstFUN then
        CdFUN := CentroTRF
      else
        CdFUN := 0;

      //Inserir Itens
      with Item_Pedido_Compra3 do
      Begin
        First;
        while not EOF do
        Begin
          if not Item_de_Transferencia1.Inserir(CdCNC,0,Transferencia1.SCodigo,
            CodigoPRD,CodigoLOT,Quantidade,0, CalculaDesconto(Preco,Descontos)) then
          Begin
            ShowMessage('Falha ao gerar Item de Transferência!');
            raise exception.Create('');
          end;
          //Reservar
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
          Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
          Item_de_Estoque1.open;
          If Item_de_Estoque1.isempty then
          begin
            ShowMessage('Produto sem item de estoque!');
            Raise exception.Create('');
          end;
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
             ' IES_SRESERVADO=IES_SRESERVADO+'+VirgPonto(Quantidade)+
             ',IES_DH_ATUALIZADO="'+MesDia(DM.Configuracao1.DataHora)+'" '+
             ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
             ' AND PRD_CODIGO='+IntToStr(CodigoPRD)+
             ' AND FUN_CODIGO='+IntToStr(CdFUN));

          Next;
        end;
      end;


      If DM.Configuracao1.ControleTransacao then
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
end;

procedure TfMxPedComp.edtCodigoLOTExit(Sender: TObject);
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

procedure TfMxPedComp.edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadLote, fCadLote);
    with fCadLote do
    Begin
      tag:=1;
      edtCodigoPRD.text := self.edtCodigoPRD.Text;
      edtProduto.Text := self.edtProduto.Text;
      ShowModal;
    end;
  end;
end;

function TfMxPedComp.GerarTitulosPrazoMedio:Boolean;
var
  i, k, CdCNC, CdPCP, CdCCX, iQtdParcelas, iPrazoMedio, iDiferencaDias, iMenorDif,
    iMaiorDif, vLimiteCheque, vLimiteDia: Integer;
  vPrimeiraParcela, vValorParcela, vValor, vTotal: Double;
  Seq: string;
  DtAux: TDateTime;
begin
  Result := False;

  if DM.Configuracao1.Magazine then
  Begin
    vLimiteCheque := 600;
    vLimiteDia    := 3000;
  end
  else
  Begin
    vLimiteCheque := 2400;
    vLimiteDia    := 12000;
  end;

  try
    CdCNC  := dblCNCEntrega.KeyValue;
    CdPCP  := StrToInt(edtCodigoPCP.Text);
    vTotal := Arredonda(StrToFloat(edtTotalFinal.Text));

    iPrazoMedio := Forma_de_Pagamento1.PrazoMedio + iSomarDataBase;

    with DM.qr_consultas2 do
    Begin
      Close;
      SQL.Text := 'SELECT CCX_CODIGO AS CONTA '+
        ' FROM FORNECEDOR '+
        ' WHERE FOR_CODIGO='+IntToStr(dblCodigoFOR.KeyValue);
      Open;
      CdCCX := FieldByName('CONTA').asInteger;
    end;

    if vTotal <= (vLimiteCheque*1.1) then //10% do valor do Limite dia
      iQtdParcelas := 1
    else if (vTotal - (vLimiteCheque * (Trunc(vTotal) div vLimiteCheque))) > 0 then
      iQtdParcelas := (Trunc(vTotal) div vLimiteCheque) + 1
    else
      iQtdParcelas := (Trunc(vTotal) div vLimiteCheque);

    vValorParcela := 0;
    if iQtdParcelas = 1 then
      vPrimeiraParcela := vTotal
    else
    Begin
      vValorParcela := Arredonda(vTotal/iQtdParcelas);
      vPrimeiraParcela := vValorParcela + (Arredonda(vTotal)-(Arredonda(vValorParcela)*iQtdParcelas));
    end;

    for i:=1 to High(vVetorDatas) do
      vVetorDatas[i] := 0;

    //Gerar Vencimentos
    iDiferencaDias := 0;
    iMenorDif := 0;
    iMaiorDif := 0;
    for i:=1 to iQtdParcelas do
    Begin
      if iQtdParcelas = 1 then
        vVetorDatas[1] := RetornaDataBoaPagamento(DM.qr_consultas2, DM.Configuracao1.PastaSistema,
          mskEntrega.Text, CdCNC, iPrazoMedio, False, vLimiteDia)
      else
      Begin
        if (i = iQtdParcelas) and //Última Parcela
           (iDiferencaDias <= 0) then
          iDiferencaDias := 1;   //Forçar que o último vencimento diminua a diferença em dias

        if (iDiferencaDias > 0) then
          vVetorDatas[i] := RetornaDataBoaPagamento(DM.qr_consultas2, DM.Configuracao1.PastaSistema,
            mskEntrega.Text, CdCNC, iPrazoMedio-iMenorDif-iDiferencaDias, False, vLimiteDia)
        else
          vVetorDatas[i] := RetornaDataBoaPagamento(DM.qr_consultas2, DM.Configuracao1.PastaSistema,
            mskEntrega.Text, CdCNC, iPrazoMedio+iMaiorDif+iDiferencaDias, True, vLimiteDia);

        if vVetorDatas[i] > (StrToDate(mskEntrega.Text)+iPrazoMedio) then
        Begin
          iDiferencaDias := DaysBetween(vVetorDatas[i],StrToDate(mskEntrega.Text)+iPrazoMedio);
          if iDiferencaDias > iMaiorDif then
            iMaiorDif := iDiferencaDias;
        end
        else
        Begin
          iDiferencaDias := (-1)*DaysBetween(vVetorDatas[i],StrToDate(mskEntrega.Text)+iPrazoMedio);
          if iDiferencaDias < iMenorDif then
            iMenorDif := iDiferencaDias;
        end;
      end;
      if vVetorDatas[i] < DM.Configuracao1.Data then
      Begin
        vVetorDatas[i] := DM.Configuracao1.Data;
        ShowMessage('Não foi possível encontrar uma data ideal!'+#13+
                    'Depois de finalizado verifique os vencimentos!');
      end;
    end;

    //Colocar vencimentos em ordem
    if iQtdParcelas > 1 then
      for k:=1 to iQtdParcelas-1 do
        for i:=k+1 to iQtdParcelas do
          if vVetorDatas[i] < vVetorDatas[k] then
          Begin
            DtAux          := vVetorDatas[k];
            vVetorDatas[k] := vVetorDatas[i];
            vVetorDatas[i] := DtAux;
          end;

    //Gerar Títulos
    for i:=1 to iQtdParcelas do
    Begin
      If i<=9 then
        Seq := '0'+IntToStr(i)
      Else
        Seq := IntToStr(i);

      if i = 1 then
        vValor := vPrimeiraParcela
      else
        vValor := vValorParcela;

      //Gerar título a pagar
      with Titulo_a_pagar1 do
      Begin
        if not Inserir(CdCNC,0, CdPCP, 0(*BNF*), CdCCX, 0(*CdCCXRec*), dblCodigoFOR.KeyValue,
          0, dblTipoDeDocumento.KeyValue, 0(*Período*), 'PARC:'+Seq+'/'+IntToStr(iQtdParcelas)+' PZ MEDIO:'+IntToStr(iPrazoMedio+iDiferencaDias),
          ''(*custodia*),edtNotaFiscal.Text, vVetorDatas[i], 0(*DtPAG*), 0(*DtOri*),
          DM.Configuracao1.Data, vValor, 0(*ValorPG*), 'PRAZO MEDIO:'+IntToStr(iPrazoMedio+iDiferencaDias),
          Seq, 5 (*TipoPag Cheque*), 0 (*Anterior*), 0(*Origem*), False(*MovCaixa*)) then
        Begin
          ShowMessage('Erro ao gerar Títulos a Pagar!');
          Exit;
        end;
      end;
    end;
  except
    Exit;
  end;
  Result := True;
end;

procedure TfMxPedComp.EditHoyatKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#35,#36,#37,#38,#39,#40,#44]) then
    key := #0;
end;

procedure TfMxPedComp.edtDescontoExit(Sender: TObject);
begin
  if edtDesconto.Text='' then
    edtDesconto.Text := '0';
end;

procedure TfMxPedComp.edtBonificacaoExit(Sender: TObject);
begin
  if edtBonificacao.Text='' then
    edtBonificacao.Text := '0';
end;

procedure TfMxPedComp.edtAmostraExit(Sender: TObject);
begin
  if edtAmostra.Text='' then
    edtAmostra.Text := '0';
end;

end.
