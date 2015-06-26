unit UOp_RelatProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Menus, Variants, Parametro,
  Item_de_Estoque_Detalhe, Funcionario, SiacReport_TLB;

type
  TOp_RelatProd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Fechar: TBitBtn;
    Grupo: TQuery;
    DSGrupo: TDataSource;
    Centro_de_Custo: TQuery;
    DSCentro_de_Custo: TDataSource;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    grpDetalhe: TGroupBox;
    edtColuna1: TEdit;
    edtColuna2: TEdit;
    edtColuna3: TEdit;
    edtColuna4: TEdit;
    edtColuna5: TEdit;
    edtColuna6: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    rdgPreco: TRadioGroup;
    Label6: TLabel;
    cmbOrdem: TComboBox;
    ckbAgruparDescricao: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtValorX: TEdit;
    rdgEstoque: TRadioGroup;
    ckbDetalhe: TCheckBox;
    edtDetalhe: TEdit;
    GroupBox3: TGroupBox;
    edtCodigoPRD: TEdit;
    edtCodigoFOR: TEdit;
    dblCodigoGRP: TDBLookupComboBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    ckbCodigoGRP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoSGP: TCheckBox;
    ckbCodigoFOR: TCheckBox;
    ckbCodigoPRD: TCheckBox;
    ckbReferencia: TCheckBox;
    edtReferencia: TEdit;
    ckbUltimoMovimento: TCheckBox;
    mskUltimoMovimento: TMaskEdit;
    ckbLocalDeEstoque: TCheckBox;
    edtLocalDeEstoque: TEdit;
    ckbDesativados: TCheckBox;
    ckbExibirForaTabela: TCheckBox;
    edtDescricao: TEdit;
    ckbDescricao: TCheckBox;
    rdbEstoqueFisico1: TRadioButton;
    rdbEstoqueComercial: TRadioButton;
    rdbEstoqueFiscal: TRadioButton;
    rdbEstoqueLJ3: TRadioButton;
    ckbSomenteSubGrupo: TCheckBox;
    edtMarca: TEdit;
    ckbMarca: TCheckBox;
    ckbExibirLocalEstoque: TCheckBox;
    rdbEstoqueIndisponivel: TRadioButton;
    rdbEstoqueReserva: TRadioButton;
    ckbSomenteSER: TCheckBox;
    ckbSomentePRD: TCheckBox;
    edtCaracteristica: TEdit;
    ckbCaracteristica: TCheckBox;
    ckbMalaDireta: TCheckBox;
    Etiquetas1: TProduto;
    edtArquivoMalaDireta: TEdit;
    ckbNaoInventariados: TCheckBox;
    mskDataInventario: TMaskEdit;
    ckbSomenteCatalogo: TCheckBox;
    ckbConsiderarSemEstoque: TCheckBox;
    ckbSomenteForaDeLinha: TCheckBox;
    ckbSomenteEmLinha: TCheckBox;
    dblClassificacao: TDBLookupComboBox;
    ckbClassificacao: TCheckBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    ckbSintetico: TCheckBox;
    rdbEstoqueLJ4: TRadioButton;
    dblDetalheEstoque: TDBLookupComboBox;
    ckbDetalheEstoque: TCheckBox;
    DSParametro2: TDataSource;
    Parametro2: TParametro;
    rdbEstoqueAmostra: TRadioButton;
    rdbEstoqueBonificacao: TRadioButton;
    rdbEstoqueAmostraF1: TRadioButton;
    rdbEstoqueBonificacaoF1: TRadioButton;
    ckbLinhaExtra: TCheckBox;
    Funcionario1: TFuncionario;
    DSFuncionario1: TDataSource;
    dblCodigoFUN: TDBLookupComboBox;
    ckbCodigoFUN: TCheckBox;
    ckbUltimaCompra: TCheckBox;
    mskUltimaCompra: TMaskEdit;
    cmbUltimoMovimento: TComboBox;
    cmbUltimaCompra: TComboBox;
    edtCodigoLOT: TEdit;
    ckbCodigoLOT: TCheckBox;
    cbxRelatorioGrafico: TCheckBox;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure ckbDetalheClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure ckbUltimoMovimentoClick(Sender: TObject);
    procedure ckbLocalDeEstoqueClick(Sender: TObject);
    procedure rdgEstoqueClick(Sender: TObject);
    procedure ckbAgruparDescricaoClick(Sender: TObject);
    procedure ckbDescricaoClick(Sender: TObject);
    procedure ckbSomenteSubGrupoClick(Sender: TObject);
    procedure ckbMarcaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbSomentePRDClick(Sender: TObject);
    procedure ckbSomenteSERClick(Sender: TObject);
    procedure ckbCaracteristicaClick(Sender: TObject);
    procedure ckbMalaDiretaClick(Sender: TObject);
    procedure ckbNaoInventariadosClick(Sender: TObject);
    procedure ckbSomenteForaDeLinhaClick(Sender: TObject);
    procedure ckbSomenteEmLinhaClick(Sender: TObject);
    procedure ckbClassificacaoClick(Sender: TObject);
    procedure ckbDetalheEstoqueClick(Sender: TObject);
    procedure ckbCodigoFUNClick(Sender: TObject);
    procedure ckbSinteticoClick(Sender: TObject);
    procedure ckbUltimaCompraClick(Sender: TObject);
    procedure ckbCodigoLOTClick(Sender: TObject);
    procedure edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
    procedure ReportProduto(filtrosSQL, filtros: string);
    procedure ReportFornecedorProduto(filtrosSQL, filtros: string);
    procedure ReportSugestaoCompras(filtrosSQL, filtros: string);
  private
    { Private declarations }
  public
    Centro: string;
  end;

var
  Op_RelatProd: TOp_RelatProd;

implementation

uses
  UProduto, funcoes, uEstoque, MxSPediProd, MxSCotaFor, UDM, UPrev_vendas,
  USugestaoCmp, UFornProd, UTransferenciaNecessaria, UProdutoSite,
  UProduto_Colunas, UProdutoSubGrupo, MxSPediProdMotCal, UListaoInvent,
  uEstoqueDetalhado, uEstoqueLote1, CdLote, MxPedCompra;

{$R *.DFM}


procedure TOp_RelatProd.SB_ConfirmarClick(Sender: TObject);
var
  EstMenos,Ativo,cPRD,cFOR,cGRP,cSGP,cDetalhe,cRef,UltimoMovimento,UltimaCompra,
    sUltimoMovimento2, sFiltroUltimoMovimento1,
    cLocalEstoque, Ordem, cEstoqueLoja, cExibirFora, sAgrupaDetalhe,
    sDescricao, sMarca, sCaracteristica, sClassificacao, sSomentePRD, sFiltros, sFiltroEstoque1,
    sProduto, sCodigoBarras, sNaoInventariado, sCatalogo, sConsiderarSemEstoque,
    sSomenteForaLinha, Centro20, sEstoqueDetalhe, sTabelaEstoque, sCampoEstoque, cFUN, CLOT: String;
  iQtdEtiquetas : Integer;
  vQuantidade, vPreco: Double;
  PUmPoQuantidade: Boolean;
  //Etiquetas
  CodBarras, Linha: string;
  iQuantidade, i: integer;
  Arq: TextFile;
begin
  if (rdgPreco.ItemIndex = 1) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(7690)) < 0) then
    Raise exception.Create('Usuário não tem permissão para visualizar Preço de Compra');

  if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7700)) < 0) and
     ((rdgPreco.ItemIndex = 2) or
      (rdgPreco.ItemIndex = 3)) then
    Raise exception.Create('Usuário não tem permissão para visualizar Preço de custo');


  Centro:='';
  Centro20:='';
  cDetalhe:='';
  cPRD:='';
  cLOT:='';
  sDescricao:='';
  sMarca := '';
  sCaracteristica := '';
  sClassificacao := '';
  sCatalogo := '';
  sSomenteForaLinha := '';
  cGRP:='';
  cSGP:='';
  cRef:='';
  Ativo:='';
  EstMenos:='';
  sUltimoMovimento2 := '';
  UltimoMovimento := '';
  UltimaCompra := '';
  sFiltroUltimoMovimento1 := '';
  cLocalEstoque := '';
  cEstoqueLoja := ' T10.IES_SFISICO ';
  cExibirFora := '';
  sFiltros:='';
  sAgrupaDetalhe:='';
  sSomentePRD := '';
  sFiltroEstoque1 := '';
  sNaoInventariado := '';
  cFUN := '';

  if ckbCodigoPRD.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPRD.text) then
      Raise Exception.Create('Código do produto inválido!');
    cPRD:=' AND (T1.PRD_CODIGO='+edtCodigoPRD.Text+')';
    sFiltros := sFiltros + '(PRD='+edtCodigoPRD.Text+')';
  end;

  if ckbCodigoLOT.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoLOT.text) then
      Raise Exception.Create('Código do Lote inválido!');
    cLOT:=' AND (T2.LOT_CODIGO='+edtCodigoLOT.Text+')';
    sFiltros := sFiltros + '(LOT='+edtCodigoLOT.Text+')';
  end;

  if ckbDesativados.Checked then
  Begin
    Ativo := ' AND T1.PRD_SITUACAO = 1 ';
    sFiltros := sFiltros + '(Desativados)';
  end
  else
  Begin
    Ativo := ' AND T1.PRD_SITUACAO <> 1 ';
    sFiltros := sFiltros + '(Ativados)';
  end;

  if ckbDescricao.Checked then
  Begin
    sDescricao := ' AND T1.PRD_DESCRICAO LIKE "%'+edtDescricao.Text+'%" ';
    sFiltros := sFiltros + '(Desc='+edtDescricao.Text+')';
  end;

  if ckbMarca.Checked then
  Begin
    sMarca := ' AND T1.PRD_MARCA LIKE "%'+edtMarca.Text+'%" ';
    sFiltros := sFiltros + '(Marca='+edtMarca.Text+')';
  end;

  if ckbCaracteristica.Checked then
  Begin
    sCaracteristica := ' AND T1.PRD_CARACTERISTICA LIKE "%'+edtCaracteristica.Text+'%" ';
    sFiltros := sFiltros + '(Caracteristica='+edtCaracteristica.Text+')';
  end;

  if ckbClassificacao.Checked then
  Begin
    if dblClassificacao.Text = '' then
      sClassificacao := ' AND (T1.PRD_CLASSIFICACAO=0 OR T1.PRD_CLASSIFICACAO IS NULL) '
    else
      sClassificacao := ' AND T1.PRD_CLASSIFICACAO='+IntToStr(dblClassificacao.KeyValue);
    sFiltros := sFiltros + '(Classificacao='+dblClassificacao.Text+')';
  end;

  if ckbSomenteCatalogo.Checked then
  Begin
    sCatalogo := ' AND T1.PRD_CATALOGO=1 ';
    sFiltros := sFiltros + '(Catalogo)';
  end;

  if ckbSomenteForaDeLinha.Checked then
  Begin
    sSomenteForaLinha := ' AND T1.PRD_FORA_DE_LINHA=1 ';
    sFiltros := sFiltros + '(SomenteForaLinha)';
  end
  else if ckbSomenteEmLinha.Checked then
  Begin
    sSomenteForaLinha := ' AND (T1.PRD_FORA_DE_LINHA=0 OR T1.PRD_FORA_DE_LINHA IS NULL) ';
    sFiltros := sFiltros + '(SomenteEmLinha)';
  end;

  if ckbDetalhe.Checked then
  Begin
    cDetalhe := ' AND T1.PRD_DETALHE LIKE "%'+edtDetalhe.Text+'%" ';
    sFiltros := sFiltros + '(Det='+edtDetalhe.Text+')';
  end;

  if ckbCodigoFUN.Checked then
  Begin
    if dblCodigoFUN.Text = '' then
      Raise Exception.Create('Funcionário(a) inválido(a)!');
    cFUN := ' AND (T2.FUN_CODIGO ='+IntToStr(dblCodigoFUN.KeyValue)+')';
    sFiltros := sFiltros + '(FUN='+dblCodigoFUN.Text+')';
  end;

  if ckbReferencia.Checked then
  Begin
    cRef := ' AND T1.PRD_REFERENCIA LIKE "%'+edtReferencia.Text+'%" ';
    sFiltros := sFiltros + '(Ref='+edtReferencia.Text+')';
  end;

  if ckbLocalDeEstoque.Checked then
  Begin
    if edtLocalDeEstoque.Text <> '' then
      cLocalEstoque := ' AND T1.PRD_LOCAL LIKE "%'+edtLocalDeEstoque.Text+'%" '
    else
      cLocalEstoque := ' AND (T1.PRD_LOCAL IS NULL OR T1.PRD_LOCAL="") ';
    sFiltros := sFiltros + '(LocEst='+edtLocalDeEstoque.Text+')';
  end;

  if ckbUltimoMovimento.Checked then
  Begin
    if not VerificaDataBranco(mskUltimoMovimento.Text) then
      Raise exception.Create('Data do Último Movimento inválida!');
    case cmbUltimoMovimento.ItemIndex of
      0: Begin // <
           sUltimoMovimento2 := ' AND NOT EXISTS (SELECT PRD_CODIGO '+
             ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL MEC '+
             ' WHERE T1.PRD_CODIGO=MEC.PRD_CODIGO '+
             ' AND MEC.MEC_DATA_HORA>="'+MesDia(mskUltimoMovimento.Text)+'") ';
           UltimoMovimento := ' AND T2.IES_DH_ATUALIZADO<"'+MesDia(mskUltimoMovimento.Text)+'" '+
             ' AND T2.IES_DH_ATUALIZADO>"'+MesDia(0)+'" ';
           sFiltroUltimoMovimento1 := ' AND IES_DH_ATUALIZADO<"'+MesDia(mskUltimoMovimento.Text)+'" '+
             ' AND IES_DH_ATUALIZADO>"'+MesDia(0)+'" ';
           sFiltros := sFiltros + '(UltMov<:'+mskUltimoMovimento.Text+')';
         end;
      1: Begin // =
           sUltimoMovimento2 := ' AND NOT EXISTS (SELECT PRD_CODIGO '+
             ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL MEC '+
             ' WHERE T1.PRD_CODIGO=MEC.PRD_CODIGO '+
             ' AND MEC.MEC_DATA_HORA>="'+MesDia(mskUltimoMovimento.Text)+'" '+
             ' AND MEC.MEC_DATA_HORA<"'+MesDia(StrToDate(mskUltimoMovimento.Text)+1)+'") ';
           UltimoMovimento := ' AND T2.IES_DH_ATUALIZADO>="'+MesDia(mskUltimoMovimento.Text)+'" '+
             ' AND T2.IES_DH_ATUALIZADO<"'+MesDia(StrToDate(mskUltimoMovimento.Text)+1)+'" ';
           sFiltroUltimoMovimento1 := ' AND IES_DH_ATUALIZADO>="'+MesDia(mskUltimoMovimento.Text)+'" '+
             ' AND IES_DH_ATUALIZADO<"'+MesDia(StrToDate(mskUltimoMovimento.Text)+1)+'" ';
           sFiltros := sFiltros + '(UltMov=:'+mskUltimoMovimento.Text+')';
         end;
      2: Begin // >
           sUltimoMovimento2 := ' AND NOT EXISTS (SELECT PRD_CODIGO '+
             ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL MEC '+
             ' WHERE T1.PRD_CODIGO=MEC.PRD_CODIGO '+
             ' AND MEC.MEC_DATA_HORA>"'+MesDiaHora(mskUltimoMovimento.Text+' 23:59:59')+'") ';
           UltimoMovimento := ' AND T2.IES_DH_ATUALIZADO>"'+MesDiaHora(mskUltimoMovimento.Text+' 23:59:59')+'" ';
           sFiltroUltimoMovimento1 := ' AND IES_DH_ATUALIZADO>"'+MesDiaHora(mskUltimoMovimento.Text+' 23:59:59')+'" ';
           sFiltros := sFiltros + '(UltMov>:'+mskUltimoMovimento.Text+')';
         end;
      3: Begin // <=
           sUltimoMovimento2 := ' AND NOT EXISTS (SELECT PRD_CODIGO '+
             ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL MEC '+
             ' WHERE T1.PRD_CODIGO=MEC.PRD_CODIGO '+
             ' AND MEC.MEC_DATA_HORA<="'+MesDia(mskUltimoMovimento.Text)+'") ';
           UltimoMovimento := ' AND T2.IES_DH_ATUALIZADO<="'+MesDia(mskUltimoMovimento.Text)+'" '+
             ' AND T2.IES_DH_ATUALIZADO>"'+MesDia(0)+'" ';
           sFiltroUltimoMovimento1 := ' AND IES_DH_ATUALIZADO<="'+MesDia(mskUltimoMovimento.Text)+'" '+
             ' AND IES_DH_ATUALIZADO>"'+MesDia(0)+'" ';
           sFiltros := sFiltros + '(UltMov<=:'+mskUltimoMovimento.Text+')';
         end;
      4: Begin // >=
           sUltimoMovimento2 := ' AND NOT EXISTS (SELECT PRD_CODIGO '+
             ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL MEC '+
             ' WHERE T1.PRD_CODIGO=MEC.PRD_CODIGO '+
             ' AND MEC.MEC_DATA_HORA>="'+MesDia(mskUltimoMovimento.Text)+'") ';
           UltimoMovimento := ' AND T2.IES_DH_ATUALIZADO>="'+MesDia(mskUltimoMovimento.Text)+'" ';
           sFiltroUltimoMovimento1 := ' AND IES_DH_ATUALIZADO>="'+MesDia(mskUltimoMovimento.Text)+'" ';
           sFiltros := sFiltros + '(UltMov>=:'+mskUltimoMovimento.Text+')';
         end;
    end;
  end;

  if ckbUltimaCompra.Checked then
  Begin
    if not VerificaDataBranco(mskUltimaCompra.Text) then
      Raise exception.Create('Data da Última Compra inválida!');
    case cmbUltimaCompra.ItemIndex of
      0: Begin // <
           if ckbCodigoCNC.Checked then
             UltimaCompra := ' AND NOT EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA>="'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND PCP.CNC_ENTREGA='+IntToStr(dblCodigoCNC.KeyValue)+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) '
           else
             UltimaCompra := ' AND NOT EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA>="'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) ';
           sFiltros := sFiltros + '(UltComp<:'+mskUltimaCompra.Text+')';
         end;
      1: Begin // =
           if ckbCodigoCNC.Checked then
             UltimaCompra := ' AND EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA="'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND PCP.CNC_ENTREGA='+IntToStr(dblCodigoCNC.KeyValue)+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) '
           else
             UltimaCompra := ' AND EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA="'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) ';
           sFiltros := sFiltros + '(UltComp=:'+mskUltimaCompra.Text+')';
         end;
      2: Begin // >
           if ckbCodigoCNC.Checked then
             UltimaCompra := ' AND EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA>"'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND PCP.CNC_ENTREGA='+IntToStr(dblCodigoCNC.KeyValue)+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) '
           else
             UltimaCompra := ' AND EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA>"'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) ';
           sFiltros := sFiltros + '(UltComp>:'+mskUltimaCompra.Text+')';
         end;
      3: Begin // <=
           if ckbCodigoCNC.Checked then
             UltimaCompra := ' AND NOT EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA>"'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND PCP.CNC_ENTREGA='+IntToStr(dblCodigoCNC.KeyValue)+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) '
           else
             UltimaCompra := ' AND NOT EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA>"'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) ';
           sFiltros := sFiltros + '(UltComp<=:'+mskUltimaCompra.Text+')';
         end;
      4: Begin // >=
           if ckbCodigoCNC.Checked then
             UltimaCompra := ' AND EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA>="'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND PCP.CNC_ENTREGA='+IntToStr(dblCodigoCNC.KeyValue)+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) '
           else
             UltimaCompra := ' AND EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
                  ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
                  ' WHERE PCP.PCP_SITUACAO=2 '+
                  ' AND PCP.PCP_DT_ENTREGA>="'+MesDia(mskUltimaCompra.Text)+'" '+
                  ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
                  ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) ';
           sFiltros := sFiltros + '(UltComp>=:'+mskUltimaCompra.Text+')';
         end;
    end;
  end;

  if ckbCodigoFOR.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoFOR.text) then
      Raise Exception.Create('Código do Fornecedor inválido!');
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FOR_RZ_SOCIAL '+
        ' FROM FORNECEDOR '+
        ' WHERE FOR_CODIGO='+edtCodigoFOR.Text;
      Open;
      if IsEmpty then
        Raise exception.Create('Fornecedor não cadastrado!');
      cFOR:=' AND (T1.FOR_CODIGO = '+edtCodigoFOR.Text+')';
      sFiltros := sFiltros + '(FOR='+edtCodigoFOR.Text+' '+Trim(FieldByName('FOR_RZ_SOCIAL').asString)+')';
    end;
  end;

  if ckbCodigoGRP.Checked then
  Begin
    if dblCodigoGRP.Text = '' then
      Raise Exception.Create('Grupo inválido!');
    cGRP := ' AND (T1.GRP_CODIGO ='+IntToStr(dblCodigoGRP.KeyValue)+')';
    sFiltros := sFiltros + '(GRP='+dblCodigoGRP.Text+')';
  end;

  if ckbCodigoSGP.Checked then
  Begin
    if dblCodigoSGP.Text = '' then
      Raise Exception.Create('SubGrupo inválido!');
    cSGP := ' AND (T1.SGP_CODIGO ='+IntToStr(dblCodigoSGP.KeyValue)+')';
    sFiltros := sFiltros + '(SGP='+dblCodigoSGP.Text+')';
  end;

  if ckbCodigoCNC.Checked then
  Begin
    if dblCodigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!');
    sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
    sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
    Centro   := ' AND (T2.CNC_CODIGO = '+IntToStr(dblCodigoCNC.KeyValue)+')';
    Centro20 := ' AND (T20.CNC_CODIGO = '+IntToStr(dblCodigoCNC.KeyValue)+')';
    sFiltros := sFiltros + '(CNC='+IntToStr(dblCodigoCNC.KeyValue)+')';
  end
  else if DM.Configuracao1.Empresa = empEletro then
  Begin
    sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
    sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
  end;

  if ckbNaoInventariados.Checked then
  Begin
    if not VerificaDataBranco(mskDataInventario.Text) then
    Begin
      mskDataInventario.Text := '';
      sNaoInventariado := ' AND T1.PRD_CODIGO NOT IN (SELECT PRD_CODIGO '+
        ' FROM ITEM_DE_INVENTARIO)';
    end
    else
      sNaoInventariado := ' AND T1.PRD_CODIGO NOT IN (SELECT PRD_CODIGO '+
        ' FROM ITEM_DE_INVENTARIO IIV, INVENTARIO INV '+
        ' WHERE INV.INV_DATA>="'+MesDia(mskDataInventario.Text)+'" '+
        ' AND INV.CNC_CODIGO=IIV.CNC_CODIGO '+
        ' AND INV.INV_CODIGO=IIV.INV_CODIGO)';

    sFiltros := sFiltros + '(Inventario>='+mskDataInventario.Text+')';
  end;

  if ckbSomentePRD.Checked then
  Begin
    sSomentePRD := ' AND T1.PRD_SERVICO=0 ';
    sFiltros := sFiltros + '(SomentePRD)';
  end
  else if ckbSomenteSER.Checked then
  Begin
    sSomentePRD := ' AND T1.PRD_SERVICO=1 ';
    sFiltros := sFiltros + '(SomenteSER)';
  end;

  if not ckbExibirForaTabela.Checked then
    cExibirFora := ' AND (T1.PRD_FORA_TABELA IS NULL OR T1.PRD_FORA_TABELA<>1) '
  else
    sFiltros := sFiltros + '(ForaTab)';


  if ckbCodigoLOT.Checked then
  Begin
    case rdgEstoque.ItemIndex of
      0: Begin
           EstMenos:=' AND (t2.IED_QTD_FISICO < '+VirgPonto(edtValorX.Text)+')';
           sFiltros := sFiltros + '(QtdLote)(<'+edtValorX.Text+')';
         end;
      1: Begin
           EstMenos:=' AND (t2.IED_QTD_FISICO = '+VirgPonto(edtValorX.Text)+')';
           sFiltros := sFiltros + '(QtdLote)(='+edtValorX.Text+')';
         end;
      2: Begin
           EstMenos:=' AND (t2.IED_QTD_FISICO > '+VirgPonto(edtValorX.Text)+')';
           sFiltros := sFiltros + '(QtdLote)(>'+edtValorX.Text+')';
         end;
      3: Begin
           EstMenos:=' AND (t2.IED_QTD_FISICO <= '+VirgPonto(edtValorX.Text)+')';
           sFiltros := sFiltros + '(QtdLote)(<='+edtValorX.Text+')';
         end;
      4: Begin
           EstMenos:=' AND (t2.IED_QTD_FISICO >= '+VirgPonto(edtValorX.Text)+')';
           sFiltros := sFiltros + '(QtdLote)(>='+edtValorX.Text+')';
         end;
      5: Begin
           EstMenos:=' AND (t2.IED_QTD_FISICO <> '+VirgPonto(edtValorX.Text)+')';
           sFiltros := sFiltros + '(QtdLote)(<>'+edtValorX.Text+')';
         end;
    end;
  end
  else
  Begin
    if not ckbDetalheEstoque.Checked then
    Begin
      if rdbEstoqueFisico1.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_SFISICO < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISICO < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fis)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_SFISICO = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISICO = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fis)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_SFISICO > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISICO > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fis)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_SFISICO <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISICO <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fis)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_SFISICO >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISICO >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fis)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_SFISICO <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISICO <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fis)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SFISICO ';
      end
      else if rdbEstoqueComercial.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND ((t2.IES_SCOMERCIAL-t2.IES_SRESERVADO-t2.IES_INDISPONIVEL) < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND ((IES_SCOMERCIAL-IES_SRESERVADO-IES_INDISPONIVEL) < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Com)(<>'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND ((t2.IES_SCOMERCIAL-t2.IES_SRESERVADO-t2.IES_INDISPONIVEL) = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND ((IES_SCOMERCIAL-IES_SRESERVADO-IES_INDISPONIVEL) = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Com)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND ((t2.IES_SCOMERCIAL-t2.IES_SRESERVADO-t2.IES_INDISPONIVEL) > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND ((IES_SCOMERCIAL-IES_SRESERVADO-IES_INDISPONIVEL) > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Com)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND ((t2.IES_SCOMERCIAL-t2.IES_SRESERVADO-t2.IES_INDISPONIVEL) <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND ((IES_SCOMERCIAL-IES_SRESERVADO-IES_INDISPONIVEL) <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Com)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND ((t2.IES_SCOMERCIAL-t2.IES_SRESERVADO-t2.IES_INDISPONIVEL) >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND ((IES_SCOMERCIAL-IES_SRESERVADO-IES_INDISPONIVEL) >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Com)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND ((t2.IES_SCOMERCIAL-t2.IES_SRESERVADO-t2.IES_INDISPONIVEL) <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND ((IES_SCOMERCIAL-IES_SRESERVADO-IES_INDISPONIVEL) <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Com)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SCOMERCIAL-T10.IES_SRESERVADO-T10.IES_INDISPONIVEL ';
      end
      else if rdbEstoqueFiscal.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_SFISCAL < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISCAL < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fisc)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_SFISCAL = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISCAL = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fisc)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_SFISCAL > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISCAL > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fisc)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_SFISCAL <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISCAL <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fisc)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_SFISCAL >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISCAL >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fisc)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_SFISCAL <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SFISCAL <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Fisc)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SFISCAL ';
      end
      else if rdbEstoqueLJ3.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_SSN < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SSN < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ3)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_SSN = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SSN = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ3)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_SSN > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SSN > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ3)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_SSN <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SSN <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ3)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_SSN >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SSN >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ3)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_SSN <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SSN <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ3)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SSN ';
      end
      else if rdbEstoqueLJ4.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_SLJ4 < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SLJ4 < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ4)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_SLJ4 = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SLJ4 = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ4)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_SLJ4 > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SLJ4 > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ4)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_SLJ4 <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SLJ4 <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ4)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_SLJ4 >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SLJ4 >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ4)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_SLJ4 <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SLJ4 <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(LJ4)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SLJ4 ';
      end
      else if rdbEstoqueIndisponivel.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_INDISPONIVEL < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_INDISPONIVEL < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Ind.)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_INDISPONIVEL = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_INDISPONIVEL = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Ind.)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_INDISPONIVEL > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_INDISPONIVEL > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Ind.)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_INDISPONIVEL <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_INDISPONIVEL <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Ind.)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_INDISPONIVEL >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_INDISPONIVEL >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Ind.)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_INDISPONIVEL <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_INDISPONIVEL <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Ind.)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_INDISPONIVEL ';
      end
      else if rdbEstoqueReserva.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_SRESERVADO < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SRESERVADO < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Res.)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_SRESERVADO = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SRESERVADO = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Res.)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_SRESERVADO > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SRESERVADO > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Res.)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_SRESERVADO <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SRESERVADO <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Res.)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_SRESERVADO >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SRESERVADO >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Res.)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_SRESERVADO <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SRESERVADO <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Res.)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SRESERVADO ';
      end
      else if rdbEstoqueBonificacao.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Bon.)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Bon.)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Bon.)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Bon.)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Bon.)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Bon.)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SBONIFICACAO ';
      end
      else if rdbEstoqueAmostra.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Amo.)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Amo.)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Amo.)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Amo.)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Amo.)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(Amo.)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SAMOSTRA ';
      end
      else if rdbEstoqueBonificacaoF1.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO_FISCAL < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO_FISCAL < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(BonF1.)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO_FISCAL = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO_FISCAL = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(BonF1.)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO_FISCAL > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO_FISCAL > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(BonF1.)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO_FISCAL <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO_FISCAL <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(BonF1.)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO_FISCAL >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO_FISCAL >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(BonF1.)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_SBONIFICACAO_FISCAL <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SBONIFICACAO_FISCAL <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(BonF1.)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SBONIFICACAO_FISCAL ';
      end
      else if rdbEstoqueAmostraF1.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA_FISCAL < '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA_FISCAL < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(AmoF1.)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA_FISCAL = '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA_FISCAL = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(AmoF1.)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA_FISCAL > '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA_FISCAL > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(AmoF1.)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA_FISCAL <= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA_FISCAL <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(AmoF1.)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA_FISCAL >= '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA_FISCAL >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(AmoF1.)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (t2.IES_SAMOSTRA_FISCAL <> '+VirgPonto(edtValorX.Text)+')';
               sFiltroEstoque1:=' AND (IES_SAMOSTRA_FISCAL <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(AmoF1.)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SAMOSTRA_FISCAL ';
      end;
    end
    else //Detalhe de Estoque
    Begin
      if rdbEstoqueFisico1.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (IED.IED_QTD_FISICO < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FisDetalhe)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (IED.IED_QTD_FISICO = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FisDetalhe)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (IED_QTD_FISICO > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FisDetalhe)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (IED.IED_QTD_FISICO <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FisDetalhe)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (IED.IED_QTD_FISICO >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FisDetalhe)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (IED.IED_QTD_FISICO <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FisDetalhe)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SFISICO ';
      end
      else if rdbEstoqueFiscal.Checked then
      Begin
        sTabelaEstoque := ',ITEM_DE_ESTOQUE T2 ';
        sCampoEstoque  := ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';
        case rdgEstoque.ItemIndex of
          0: Begin
               EstMenos:=' AND (IED.IED_QTD_FISCAL < '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FiscDetalhe)(<'+edtValorX.Text+')';
             end;
          1: Begin
               EstMenos:=' AND (IED.IED_QTD_FISCAL = '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FiscDetalhe)(='+edtValorX.Text+')';
             end;
          2: Begin
               EstMenos:=' AND (IED.IED_QTD_FISCAL > '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FiscDetalhe)(>'+edtValorX.Text+')';
             end;
          3: Begin
               EstMenos:=' AND (IED.IED_QTD_FISCAL <= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FiscDetalhe)(<='+edtValorX.Text+')';
             end;
          4: Begin
               EstMenos:=' AND (IED.IED_QTD_FISCAL >= '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FiscDetalhe)(>='+edtValorX.Text+')';
             end;
          5: Begin
               EstMenos:=' AND (IED.IED_QTD_FISCAL <> '+VirgPonto(edtValorX.Text)+')';
               sFiltros := sFiltros + '(FiscDetalhe)(<>'+edtValorX.Text+')';
             end;
        end;
        cEstoqueLoja := ' T10.IES_SFISCAL ';
        if dblDetalheEstoque.Text <> '' then
        Begin
          EstMenos := EstMenos + ' AND IED.IED_TIPO_ESTOQUE='+IntToStr(dblDetalheEstoque.KeyValue);
          sFiltros := sFiltros + '(Detalha:'+dblDetalheEstoque.Text+')';
        end;
      end;
    end;
  end;

  if ckbAgruparDescricao.Checked then
  begin
    sAgrupaDetalhe:=' AND (T1.PRD_CODIGO=-11 ';
    if edtColuna1.Text<>'' then
    Begin
      sAgrupaDetalhe:=sAgrupaDetalhe+ ' OR T1.PRD_DETALHE="' +  edtColuna1.Text+'" ';
      sFiltros := sFiltros + '(C1='+edtColuna1.Text+')';
    end;
    if edtColuna2.Text<>'' then
    Begin
      sAgrupaDetalhe:=sAgrupaDetalhe+ ' OR T1.PRD_DETALHE="' +  edtColuna2.Text+'" ';
      sFiltros := sFiltros + '(C2='+edtColuna2.Text+')';
    end;
    if edtColuna3.Text<>'' then
    Begin
      sAgrupaDetalhe:=sAgrupaDetalhe+ ' OR T1.PRD_DETALHE="' +  edtColuna3.Text+'" ';
      sFiltros := sFiltros + '(C3='+edtColuna3.Text+')';
    end;
    if edtColuna4.Text<>'' then
    Begin
      sAgrupaDetalhe:=sAgrupaDetalhe+ ' OR T1.PRD_DETALHE="' +  edtColuna4.Text+'" ';
      sFiltros := sFiltros + '(C4='+edtColuna4.Text+')';
    end;
    if edtColuna5.Text<>'' then
    Begin
      sAgrupaDetalhe:=sAgrupaDetalhe+ ' OR T1.PRD_DETALHE="' +  edtColuna5.Text+'" ';
      sFiltros := sFiltros + '(C5='+edtColuna5.Text+')';
    end;
    if edtColuna6.Text<>'' then
    Begin
      sAgrupaDetalhe:=sAgrupaDetalhe+ ' OR T1.PRD_DETALHE="' +  edtColuna6.Text+'" ';
      sFiltros := sFiltros + '(C6='+edtColuna6.Text+')';
    end;
    sAgrupaDetalhe:=sAgrupaDetalhe+ ' ) ';
  end;


  case cmbOrdem.itemIndex of
    0: Begin
         Ordem := ' ORDER BY T1.PRD_CODIGO ';
         sFiltros := sFiltros + '(Ordem:PRD)';
       end;
    1: Begin
         Ordem := ' ORDER BY T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA,T1.PRD_CODIGO ';
         sFiltros := sFiltros + '(Ordem:DESC/CARA/CODI)';
       end;
    2: Begin
         Ordem := ' ORDER BY T1.GRP_CODIGO,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA,T1.PRD_CODIGO ';
         sFiltros := sFiltros + '(Ordem:GRP/DESC/CARA/PRD)';
       end;
    3: Begin
         Ordem := ' ORDER BY T1.PRD_MARCA,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA,T1.PRD_CODIGO ';
         sFiltros := sFiltros + '(Ordem:MARC/DESC/CARA/PRD)';
       end;
    4: Begin
         Ordem := ' ORDER BY T1.PRD_REFERENCIA,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA,T1.PRD_CODIGO ';
         sFiltros := sFiltros + '(Ordem:REFE/DESC/CARA/PRD)';
       end;
    5: Begin
         Ordem := ' ORDER BY T1.PRD_LOCAL,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA,T1.PRD_CODIGO ';
         sFiltros := sFiltros + '(Ordem:LOCA/DESC/CARA/PRD)';
       end;
  end;

  if ckbConsiderarSemEstoque.Checked then
  Begin
    sConsiderarSemEstoque := '*';
    sFIltros := sFiltros + '(Considerar S/Est.)';
  end
  else
    sConsiderarSemEstoque := '';

  if ckbMalaDireta.Checked then
  Begin
    if Trim(edtArquivoMalaDireta.Text) = '' then
      Raise exception.Create('Nome do Arquivo inválido!');
    Etiquetas1.ArquivoDeEtiquetas := edtArquivoMalaDireta.Text;

    PUmPoQuantidade := (MessageDlg('Deseja um registro para cada item do produto?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes);

    if MessageDlg('Gerar etiquetas EAN RED?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      {EAN RED}
      Linha := '';
      AssignFile (Arq, edtArquivoMalaDireta.Text);
      Rewrite(Arq);

      Writeln(Arq, 'produto1;produto2;preco;descricao;Referencia;Detalhe;Caracteristica;'+
        'Marca;CodBarras;Quantidade;QtdxPreco');

      Etiquetas1.Close;

      if (self.tag = 0) or (self.tag = 1) then //Relatório de Produtos
        Etiquetas1.SQL.Text := 'SELECT T1.* '+
              ' FROM PRODUTO T1 '+
              ' WHERE T1.PRD_CODIGO <> -1 '+
              Centro+Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+UltimaCompra+
              sUltimoMovimento2+cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+sSomenteForaLinha+
              sSomentePRD+sNaoInventariado+
              Ordem
      else
      begin
        Application.MessageBox('Não foi possivel gerar a mala direta de produtos.','Informação',+
          MB_OK + MB_ICONINFORMATION);
        CloseFile(Arq);
        Exit;
      end;

      Etiquetas1.Open;

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

        iQuantidade := 1;

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
      Etiquetas1.Close;
      if self.tag = 0 then //Relatório de Produtos
        Etiquetas1.SQL.Text := 'SELECT T1.* '+
              ' FROM PRODUTO T1 '+
              ' WHERE T1.PRD_CODIGO<>-1 '+
              Centro+Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+UltimaCompra+
              sUltimoMovimento2+cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+sSomenteForaLinha+
              sSomentePRD+sNaoInventariado+
              Ordem
      else //Posição de Estoque      ou     Sugestão de Compras
        Etiquetas1.SQL.Text := 'SELECT T1.*'+
              ',T2.CNC_CODIGO as CNC'+
              ',T2.IES_SCOMERCIAL'+
              ',T2.IES_SFISICO'+
              ',T2.IES_SFISCAL'+
              ',T2.IES_SRESERVADO'+
              ',T2.IES_INDISPONIVEL '+
              ',T2.IES_SSN '+
              ',T2.IES_SLJ4 '+
              ',T2.IES_SBONIFICACAO '+
              ',T2.IES_SAMOSTRA '+
              ',T2.IES_SBONIFICACAO_FISCAL '+
              ',T2.IES_SAMOSTRA_FISCAL '+
              ' FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
              ' WHERE T1.PRD_CODIGO'+sConsiderarSemEstoque+'=T2.PRD_CODIGO '+
              ' AND T2.CNC_CODIGO<>0 '+
              Centro+EstMenos+cFUN+Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+UltimaCompra+
              UltimoMovimento+cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+sSomenteForaLinha+
              sSomentePRD+sNaoInventariado+
              Ordem;
      Etiquetas1.Open;
      if Etiquetas1.IsEmpty then
        Raise Exception.Create('O arquivo não foi gerado (Nenhum registro selecionado)!');
      iQtdEtiquetas := 0;
      //try (*Causa erro no report*)
        Etiquetas1.LimpaEtiquetas;
        while not Etiquetas1.EOF do
        begin
          if DM.Configuracao1.Empresa = empEletro then
            sProduto := Etiquetas1.Descricao+' '+Etiquetas1.Caracteristica
          else
            sProduto := Etiquetas1.Descricao;

          vQuantidade := 0;

          if self.tag = 0 then //Reatório de Produto
            vQuantidade := 1
          else //Posição de Estoque      ou     Sugestão de Compras
          Begin
            if rdbEstoqueFiscal.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SFISCAL').asfloat,0)
            else if rdbEstoqueLJ3.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SSN').asfloat,0)
            else if rdbEstoqueLJ4.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SLJ4').asfloat,0)
            else if rdbEstoqueFisico1.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SFISICO').asfloat,0)
            else if rdbEstoqueComercial.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SCOMERCIAL').asfloat-
                                       Etiquetas1.FieldByName('IES_SRESERVADO').asfloat-
                                       Etiquetas1.FieldByName('IES_INDISPONIVEL').asfloat,0)
            else if rdbEstoqueIndisponivel.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_INDISPONIVEL').asfloat,0)
            else if rdbEstoqueReserva.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SRESERVADO').asfloat,0)
            else if rdbEstoqueBonificacao.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SBONIFICACAO').asfloat,0)
            else if rdbEstoqueAmostra.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SAMOSTRA').asfloat,0)
            else if rdbEstoqueBonificacaoF1.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SBONIFICACAO_FISCAL').asfloat,0)
            else if rdbEstoqueAmostraF1.Checked then
              vQuantidade := Arredonda(Etiquetas1.FieldByName('IES_SAMOSTRA_FISCAL').asfloat,0);
          end;

          if (vQuantidade > 0) or
             (not PUmPoQuantidade) then
          Begin
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

            case rdgPreco.ItemIndex of
              0: vPreco := Etiquetas1.Precovenda;
              1: vPreco := Etiquetas1.Precocompra;
              2: vPreco := Etiquetas1.Custo;
              else
                vPreco := Etiquetas1.Precovenda;
            end;

            if (DM.Configuracao1.Empresa = empEletro) and
               (vQuantidade > 0) and
               (Etiquetas1.Estmedio > 1) then //Volume
              vQuantidade := Trunc(vQuantidade*Etiquetas1.Estmedio); //Volume

            Etiquetas1.AdicionaEtiqueta(Etiquetas1.CodigoPRD,vPreco,
               Trunc(vQuantidade), sProduto, Etiquetas1.Referencia,Etiquetas1.Detalhe,Etiquetas1.Caracteristica, Etiquetas1.Marca, sCodigoBarras, PUmPoQuantidade(*1 P/ Quantidade*));
            inc(iQtdEtiquetas);
          end;
          Etiquetas1.Next;
        end;
      //finally
        Etiquetas1.FechaEtiquetas;
        Etiquetas1.Close;
        if iQtdEtiquetas > 0 then
          ShowMessage('Gerado etiqueta(s) para '+IntToStr(iQtdEtiquetas)+' produto(s)!')
        else
          ShowMessage('Não foi gerado nenhuma etiqueta!');
      //end;
      Exit;
    end;
  end;

  // Relatório de Produto
  if Tag = 0 then
  begin
    if not ckbSomenteSubGrupo.Checked then
    Begin
      if cbxRelatorioGrafico.Checked then //if RelatorioGrafico then
      begin
        ReportProduto(Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+cExibirFora+
                 sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+
                 sSomenteForaLinha+sAgrupaDetalhe+sSomentePRD+sNaoInventariado+
                 sUltimoMovimento2+UltimaCompra+
                 Ordem, sFiltros);
      end
      else
      begin

        Application.CreateForm(Trpt_produto,rpt_produto);
        with rpt_produto do
        Begin
          zrlfiltros.Caption := sFiltros;
          if ckbExibirLocalEstoque.Checked then
          Begin
            zrlDescMarca.Caption := 'Loc.Estoque';
            zdbMarca.DataField := 'PRD_LOCAL';
          end;
          if cmbOrdem.ItemIndex = 2 then
            zrbGrupo.Expression := 'GRP_CODIGO'
          else
          Begin
            zrbGrupo.Expression := '';
            zrbGrupo.Height     := 0;
          end;

          Produto1.Close;

          Produto1.SQL.Text:='SELECT T1.* FROM PRODUTO T1 '+
                ' WHERE T1.PRD_CODIGO<>-1 '+
                Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+cExibirFora+
                sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+
                sSomenteForaLinha+sAgrupaDetalhe+sSomentePRD+sNaoInventariado+
                sUltimoMovimento2+UltimaCompra+
                Ordem;

          Produto1.Open;
          if Produto1.IsEmpty then
            Raise Exception.Create('Consulta vazia!');
          report.Preview;
          Close;
        end;
      end;
    end
    else //Somente SubGrupos (MOTICAL)
    Begin
      Application.CreateForm(Trpt_produtoSubGrupo,rpt_produtoSubGrupo);
      with rpt_produtoSubGrupo do
      Begin
        zrlfiltros.Caption := sFiltros;
        zrgSubGrupo.Height := 0;
        zrbDetalhe.Height := 0;
        Produto1.Close;
        Produto1.SQL.Text:='SELECT T1.*, G1.GRP_DESCRICAO, S1.SGP_DESCRICAO  '+
          ' FROM PRODUTO T1, GRUPO G1, SUBGRUPO S1 '+
          ' WHERE T1.PRD_CODIGO<>-1 '+
          Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+cExibirFora+
          sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+sUltimoMovimento2+UltimaCompra+
          sSomenteForaLinha+sAgrupaDetalhe+sSomentePRD+sNaoInventariado+
          ' AND T1.GRP_CODIGO=G1.GRP_CODIGO '+
          ' AND T1.SGP_CODIGO=S1.SGP_CODIGO '+
          ' ORDER BY G1.GRP_DESCRICAO, G1.GRP_CODIGO, S1.SGP_DESCRICAO, '+
          ' S1.SGP_CODIGO, T1.PRD_DESCRICAO ';
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise Exception.Create('Consulta vazia!');
        report.Preview;
        Close;
      end;
    end;
  end
  // Posição do Estoque
  else if tag = 1 then
  begin
    //Relatório de Detalhes em Colunas
    if ckbAgruparDescricao.Checked then
    Begin
      Application.CreateForm(Trpt_Produto_Colunas,rpt_Produto_Colunas);
      with rpt_Produto_Colunas do
      Begin
        if ckbAgruparDescricao.Checked then
        Begin
          LabelC1.Caption:=edtColuna1.Text;
          LabelC2.Caption:=edtColuna2.Text;
          LabelC3.Caption:=edtColuna3.Text;
          LabelC4.Caption:=edtColuna4.Text;
          LabelC5.Caption:=edtColuna5.Text;
          LabelC6.Caption:=edtColuna6.Text;
        end;
        zrlFiltros.Caption := sFiltros;
        Produto1.Close;
        Produto1.SQL.Text:='SELECT T1.PRD_DESCRICAO '+
          ' FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
          ' WHERE T1.PRD_CODIGO<>-1 '+
          Centro+Ativo+cDetalhe+cRef+sAgrupaDetalhe+cLocalEstoque+sSomentePRD+
          cPRD+cGRP+cSGP+cFOR+UltimoMovimento+cExibirFora+sDescricao+sMarca+UltimaCompra+
          sCaracteristica+sClassificacao+sCatalogo+sSomenteForaLinha+sNaoInventariado+
          ' AND T1.PRD_CODIGO'+sConsiderarSemEstoque+'=T2.PRD_CODIGO '+
          ' GROUP BY T1.PRD_DESCRICAO '+Ordem;
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise Exception.Create('Consulta vazia!');
        report.Preview;
        Close;
      end;
    end
    else if not ckbDetalheEstoque.Checked then //Posição de Estoque Padrão
    Begin
      Application.CreateForm(Trpt_estoque, rpt_estoque);
      with rpt_estoque do
      Begin
        Tag := 0;
        if rdbEstoqueFiscal.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (F)'
        else if rdbEstoqueLJ3.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (LJ3)'
        else if rdbEstoqueLJ4.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (LJ4)'
        else if rdbEstoqueFisico1.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (Fisico)'
        else if rdbEstoqueComercial.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (Saldo)'
        else if rdbEstoqueIndisponivel.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (Ind.)'
        else if rdbEstoqueReserva.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (Reservado)'
        else if rdbEstoqueBonificacao.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (Bonificacao)'
        else if rdbEstoqueAmostra.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (Amostra)'
        else if rdbEstoqueBonificacaoF1.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (BonificacaoF1)'
        else if rdbEstoqueAmostraF1.Checked then
          zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (AmostraF1)';

        if ckbSintetico.Checked then
        Begin
          zrbGrupo.Height := 0;
          if ckbLinhaExtra.Checked then
            zrlLinha.Enabled := False
          else
            zrbRodapeGrupo.Height := 1; //Esconder a linha
        end;

        if ckbCodigoCNC.Checked then
          sFiltroCNC := ' AND CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue);
        sFiltroEstoque := sFiltroEstoque1;
        sFiltroUltimoMovimento := sFiltroUltimoMovimento1;
        zrlfiltros.Caption := sFiltros;
        vPatrimonio:=0;
        if DM.Configuracao1.Empresa = empLBM then
          Item_de_Estoque1.SQL.Text:='SELECT * FROM ITEM_DE_ESTOQUE '+
            'WHERE PRD_CODIGO=:PRD_CODIGO AND CNC_CODIGO=:CNC_CODIGO'
        else
          Item_de_Estoque1.SQL.Text:='SELECT * FROM ITEM_DE_ESTOQUE_DEPOSITO '+
            'WHERE PRD_CODIGO=:PRD_CODIGO';

        if rdgPreco.ItemIndex in [0,1,2,3] then
        Begin
          zrlDescTotalPatrimonio.Enabled:=True;
          zrlTotalPatrimonio.Enabled:=True;
          if rdgPreco.ItemIndex = 3 then
            zrlDescPreco2.Caption := 'Venda';
        end
        else
        Begin
          zrlDescPrecoUnit.Enabled:=False;
          zrlDescPreco1.Enabled:=False;
          zrlDescPreco2.Enabled:=False;
          zrlPreco1.Enabled:=False;
          zrlPreco2.Enabled:=False;          
        end;

        //Somente HOPE a consulta será aberta
        qrySomenteLinha.Close;
        qrySomenteLinha.SQL.Text := 'SELECT SUM(T2.IES_SCOMERCIAL) AS QTD_COMERCIAL '+
          ',SUM(T2.IES_SFISICO) AS QTD_FISICO '+
          ',SUM(T2.IES_SFISCAL) AS QTD_FISCAL '+
          ',SUM(T2.IES_SSN) AS QTD_SN '+
          ',SUM(T2.IES_SLJ4) AS QTD_LJ4 '+
          ',SUM(T2.IES_INDISPONIVEL) AS QTD_INDISPONIVEL '+
          ',SUM(T2.IES_SRESERVADO) AS QTD_RESERVADO '+
          ',SUM(T2.IES_SBONIFICACAO) AS QTD_BONIFICACAO '+
          ',SUM(T2.IES_SAMOSTRA) AS QTD_AMOSTRA '+
          ',SUM(T2.IES_SBONIFICACAO_FISCAL) AS QTD_BONIFICACAO_FISCAL '+
          ',SUM(T2.IES_SAMOSTRA_FISCAL) AS QTD_AMOSTRA_FISCAL '+
          ' FROM Produto T1, ITEM_DE_ESTOQUE T2 '+
          ' WHERE T1.PRD_CODIGO'+sConsiderarSemEstoque+'=T2.PRD_CODIGO '+
          ' AND T2.CNC_CODIGO<>0 '+
          Centro+EstMenos+cFUN+Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+UltimaCompra+
          UltimoMovimento+cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+sSomenteForaLinha+
          sSomentePRD+sNaoInventariado+
          ' AND (T1.PRD_FORA_DE_LINHA=0 OR T1.PRD_FORA_DE_LINHA IS NULL) '+
          ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';

        //Somente HOPE a consulta será aberta
        qrySomenteForaLinha.Close;
        qrySomenteForaLinha.SQL.Text := 'SELECT SUM(T2.IES_SCOMERCIAL) AS QTD_COMERCIAL '+
          ',SUM(T2.IES_SFISICO) AS QTD_FISICO '+
          ',SUM(T2.IES_SFISCAL) AS QTD_FISCAL '+
          ',SUM(T2.IES_SSN) AS QTD_SN '+
          ',SUM(T2.IES_SLJ4) AS QTD_LJ4 '+
          ',SUM(T2.IES_INDISPONIVEL) AS QTD_INDISPONIVEL '+
          ',SUM(T2.IES_SRESERVADO) AS QTD_RESERVADO '+
          ',SUM(T2.IES_SBONIFICACAO) AS QTD_BONIFICACAO '+
          ',SUM(T2.IES_SAMOSTRA) AS QTD_AMOSTRA '+
          ',SUM(T2.IES_SBONIFICACAO_FISCAL) AS QTD_BONIFICACAO_FISCAL '+
          ',SUM(T2.IES_SAMOSTRA_FISCAL) AS QTD_AMOSTRA_FISCAL '+
          ' FROM Produto T1, ITEM_DE_ESTOQUE T2 '+
          ' WHERE T1.PRD_CODIGO'+sConsiderarSemEstoque+'=T2.PRD_CODIGO '+
          ' AND T2.CNC_CODIGO<>0 '+
          Centro+EstMenos+cFUN+Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+UltimaCompra+
          UltimoMovimento+cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+
          sClassificacao+sCatalogo+sSomenteForaLinha+sSomentePRD+sNaoInventariado+
          ' AND T1.PRD_FORA_DE_LINHA=1 '+
          ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';


        //Somente HOPE a consulta será aberta
        qrySomenteCatalogo.Close;
        qrySomenteCatalogo.SQL.Text := 'SELECT SUM(T2.IES_SCOMERCIAL) AS QTD_COMERCIAL '+
          ',SUM(T2.IES_SFISICO) AS QTD_FISICO '+
          ',SUM(T2.IES_SFISCAL) AS QTD_FISCAL '+
          ',SUM(T2.IES_SSN) AS QTD_SN '+
          ',SUM(T2.IES_SLJ4) AS QTD_LJ4 '+
          ',SUM(T2.IES_INDISPONIVEL) AS QTD_INDISPONIVEL '+
          ',SUM(T2.IES_SRESERVADO) AS QTD_RESERVADO '+
          ',SUM(T2.IES_SBONIFICACAO) AS QTD_BONIFICACAO '+
          ',SUM(T2.IES_SAMOSTRA) AS QTD_AMOSTRA '+
          ',SUM(T2.IES_SBONIFICACAO_FISCAL) AS QTD_BONIFICACAO_FISCAL '+
          ',SUM(T2.IES_SAMOSTRA_FISCAL) AS QTD_AMOSTRA_FISCAL '+
          ' FROM Produto T1, ITEM_DE_ESTOQUE T2 '+
          ' WHERE T1.PRD_CODIGO'+sConsiderarSemEstoque+'=T2.PRD_CODIGO '+
          ' AND T2.CNC_CODIGO<>0 '+
          Centro+EstMenos+cFUN+Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+UltimaCompra+
          UltimoMovimento+cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+
          sClassificacao+sCatalogo+sSomenteForaLinha+sSomentePRD+sNaoInventariado+
          ' AND T1.PRD_CATALOGO=1 '+
          ' AND T1.PRD_CODIGO=T2.PRD_CODIGO ';

        Produto1.Close;
        Produto1.SQL.Text:='SELECT t1.*,t2.CNC_CODIGO as CNC '+
          ',t2.IES_SCOMERCIAL,t2.IES_SFISICO,t2.IES_SFISCAL,t2.IES_SRESERVADO '+
          ',t2.IES_INDISPONIVEL,t2.IES_SSN,t2.IES_SLJ4,t2.IES_SBONIFICACAO '+
          ',t2.IES_SAMOSTRA,t2.IES_SBONIFICACAO_FISCAL,t2.IES_SAMOSTRA_FISCAL '+
          ',T2.FUN_CODIGO '+
          ' FROM  PRODUTO T1,ITEM_DE_ESTOQUE T2 '+
          ' WHERE T1.PRD_CODIGO'+sConsiderarSemEstoque+'=T2.PRD_CODIGO '+
          ' AND T2.CNC_CODIGO<>0 '+
          Centro+EstMenos+cFUN+Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+UltimaCompra+
          UltimoMovimento+cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+
          sClassificacao+sCatalogo+sSomenteForaLinha+sSomentePRD+sNaoInventariado+
          Ordem;
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise Exception.Create('Consulta vazia!');
        report.Preview;
        Close;
      end;
    end
    else //Detalhe de Estoque
    Begin
      Application.CreateForm(Trpt_estoqueDetalhado, rpt_estoqueDetalhado);
      with rpt_estoqueDetalhado do
      Begin
        Tag := 0;
        if ckbSintetico.Checked then
        Begin
          zrbGrupo.Height := 0;
          zrbRodapeGrupo.Height := 1; //Esconder a linha
        end;

        zrlfiltros.Caption := sFiltros;

        if rdbEstoqueFisico1.Checked then
          sEstoqueDetalhe := ',IED.IED_QTD_FISICO AS QTD '
        else
          sEstoqueDetalhe := ',IED.IED_QTD_FISCAL AS QTD ';

        Entidade.Close;
        Entidade.SQL.Text:='SELECT T1.*,T2.CNC_CODIGO as CNC '+
          ',T2.IES_SCOMERCIAL,T2.IES_SFISICO,T2.IES_SFISCAL,T2.IES_SRESERVADO '+
          ',T2.IES_INDISPONIVEL,T2.IES_SSN,T2.IES_SLJ4,T2.IES_SBONIFICACAO '+
          ',T2.IES_SAMOSTRA,T2.IES_SBONIFICACAO_FISCAL,T2.IES_SAMOSTRA_FISCAL '+
          ',T2.FUN_CODIGO,IED.* '+
          sEstoqueDetalhe+
          ' FROM  PRODUTO T1, ITEM_DE_ESTOQUE T2, ITEM_DE_ESTOQUE_DETALHE IED '+
          ' WHERE T2.CNC_CODIGO<>0 '+
          Centro+EstMenos+cFUN+Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+UltimaCompra+
          UltimoMovimento+cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+
          sClassificacao+sCatalogo+sSomenteForaLinha+sSomentePRD+sNaoInventariado+
          ' AND T1.PRD_CODIGO=T2.PRD_CODIGO '+
          ' AND IED.CNC_CODIGO=T2.CNC_CODIGO '+
          ' AND IED.PRD_CODIGO=T2.PRD_CODIGO '+
          Ordem;
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta vazia!');
        report.Preview;
        Close;
      end;
    end;
  end
  //Sugestão de Compra
  else if tag = 2 then
  begin
    if cbxRelatorioGrafico.Checked then //if RelatorioGrafico then
    begin
      ReportSugestaoCompras(Centro+cFUN+cPRD+Ativo+cDetalhe+cRef+cLocalEstoque+cFOR+cGRP+cSGP+
                            cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+sClassificacao+
                            sCatalogo+sSomenteForaLinha+sSomentePRD+sNaoInventariado+UltimoMovimento+UltimaCompra,
                            sFiltros);
    end
    else
    begin
      Application.CreateForm(Trpt_SugestaoCmp, rpt_SugestaoCmp);
      EstMenos := EstMenos + ' AND T1.PRD_EST_MINIMO>=(SELECT ISNULL(SUM(T20.IES_SCOMERCIAL-T20.IES_SRESERVADO-T20.IES_INDISPONIVEL),0.00) '+
        ' FROM ITEM_DE_ESTOQUE T20 '+
        ' WHERE T20.PRD_CODIGO=T1.PRD_CODIGO '+
        Centro20+')';
      rpt_SugestaoCmp.zrlfiltros.Caption := sFiltros;
      rpt_SugestaoCmp.Item_de_Estoque1.Close;
      rpt_SugestaoCmp.Item_de_Estoque1.SQL.Text:='SELECT T2.CNC_CODIGO '+
        ',ISNULL(T2.IES_INDISPONIVEL,0.00) AS IES_INDISPONIVEL '+
        ',ISNULL(T2.IES_SCOMERCIAL,0.00) AS IES_SCOMERCIAL '+
        ',ISNULL(T2.IES_SFISICO,0.00) AS IES_SFISICO '+
        ',ISNULL(T2.IES_SRESERVADO,0.00) AS IES_SRESERVADO '+
        ',ISNULL(t2.IES_SSN,0.00) AS IES_SSN '+
        ',ISNULL(t2.IES_SLJ4,0.00) AS IES_SLJ4 '+
        ',ISNULL(t2.IES_SBONIFICACAO,0.00) AS IES_SBONIFICACAO '+
        ',ISNULL(t2.IES_SAMOSTRA,0.00) AS IES_SAMOSTRA '+
        ',ISNULL(t2.IES_SBONIFICACAO_FISCAL,0.00) AS IES_SBONIFICACAO_FISCAL '+
        ',ISNULL(t2.IES_SAMOSTRA_FISCAL,0.00) AS IES_SAMOSTRA_FISCAL '+
        ',T1.PRD_CODIGO,T1.PRD_SITUACAO '+
        ',T1.GRP_CODIGO,T1.PRD_COMISSAO,T1.PRD_CUSTO,T1.PRD_DESCRICAO,T1.PRD_DT_ULT_COMPRA '+
        ',T1.PRD_EST_MINIMO,T1.PRD_MARCA,T1.PRD_PRECO_COMPRA,T1.PRD_REFERENCIA,T1.PRD_UNIDADE '+
        ',T1.PRD_PRECO_MEDIO,T1.PRD_DETALHE,T1.PRD_CARACTERISTICA,T3.GRP_DESCRICAO '+
        ' FROM PRODUTO T1,ITEM_DE_ESTOQUE T2,Grupo T3 '+
        ' WHERE T1.PRD_CODIGO'+sConsiderarSemEstoque+'=T2.PRD_CODIGO '+
        ' AND T1.GRP_CODIGO=T3.GRP_CODIGO '+
        Centro+EstMenos+cFUN+cPRD+Ativo+cDetalhe+cRef+cLocalEstoque+cFOR+cGRP+cSGP+
        cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+sClassificacao+
        sCatalogo+sSomenteForaLinha+sSomentePRD+sNaoInventariado+UltimoMovimento+UltimaCompra+
        Ordem;

      rpt_SugestaoCmp.Item_de_Estoque1.Open;
      if not rpt_SugestaoCmp.Item_de_Estoque1.IsEmpty then
      Begin
        rpt_SugestaoCmp.report.Preview;
        rpt_SugestaoCmp.Close;
      end
      else
      Begin
        ShowMessage('Nenhuma sugestão de compra com esse(s) filtro(s)!');
        rpt_SugestaoCmp.Close;
      end;
    end;
  end
  // Fornecedores por produto
  else if Tag = 3 then
  begin
    if cbxRelatorioGrafico.Checked then //if RelatorioGrafico then
    begin
      ReportFornecedorProduto(Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+cExibirFora+
                              sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+
                              sSomenteForaLinha+sAgrupaDetalhe+sSomentePRD+sNaoInventariado+
                              sUltimoMovimento2+UltimaCompra, sFiltros);
    end
    else
    begin
      Application.CreateForm(Trpt_fornprod,rpt_fornprod);
      rpt_fornprod.zrlFiltros.Caption := sFiltros;
      rpt_fornprod.Entidade.Close;
      rpt_fornprod.Entidade.SQL.Text:='SELECT T2.CNC_CODIGO,T2.FOR_CODIGO, '+
        'T2.PPF_CODIGO,T2.PRD_CODIGO,T1.PRD_CARACTERISTICA,T1.PRD_REFERENCIA,T1.PRD_UNIDADE, '+
        'T1.PRD_MARCA,T1.PRD_DESCRICAO,T1.PRD_PRECO_VENDA,T1.PRD_DETALHE, '+
        'T3.FOR_NOME_FAN,T3.FOR_RZ_SOCIAL,T3.FOR_FONE '+
        'FROM PRODUTO T1, PRODUTO_POR_FORNECEDOR T2, FORNECEDOR T3 '+
        'WHERE T2.PRD_CODIGO=T1.PRD_CODIGO AND T2.FOR_CODIGO=T3.FOR_CODIGO '+
        Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+cExibirFora+
        sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+
        sSomenteForaLinha+sSomentePRD+sNaoInventariado+sUltimoMovimento2+UltimaCompra+
        Ordem;

      rpt_fornprod.Entidade.Open;
      if rpt_fornprod.Entidade.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      rpt_fornprod.report.Preview;
      rpt_fornprod.Close;
    end;
  end
  // Transferência Necessária
  else if tag = 4 then
  begin
{    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      Application.CreateForm(Trpt_TransferenciaNecessaria, rpt_TransferenciaNecessaria);
      with rpt_TransferenciaNecessaria do
      Begin
        zrlFiltros.Caption := sFiltros;
        SZRLabel2.Caption  := dblCodigoCNC.Text;
        Item_de_Estoque1.Close;
        Item_de_Estoque1.SQL.Text:='SELECT T2.CNC_CODIGO,T2.IES_INDISPONIVEL'+
          ',T2.IES_SCOMERCIAL,T2.IES_SFISICO,T2.IES_SRESERVADO,T2.PRD_CODIGO'+
          ',t2.IES_SSN,t2.IES_SLJ4,t2.IES_SBONIFICACAO,t2.IES_SAMOSTRA,t2.IES_SBONIFICACAO,t2.IES_SAMOSTRA_FISCAL,T1.PRD_SITUACAO,T1.GRP_CODIGO,T1.PRD_COMISSAO'+
          ',T1.PRD_CUSTO,T1.PRD_DESCRICAO,T1.PRD_DT_ULT_COMPRA,T1.PRD_EST_MINIMO'+
          ',T1.PRD_MARCA,T1.PRD_PRECO_COMPRA,T1.PRD_REFERENCIA,T1.PRD_UNIDADE'+
          ',T1.PRD_PRECO_MEDIO,T1.PRD_DETALHE,T1.PRD_CARACTERISTICA '+
          'FROM PRODUTO T1,ITEM_DE_ESTOQUE_DEPOSITO T2 '+
          'WHERE T2.PRD_CODIGO=T1.PRD_CODIGO '+
          EstMenos+cFUN+cPRD+Ativo+cDetalhe+cRef+cLocalEstoque+cFOR+cGRP+cExibirFora+
          sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+sSomenteForaLinha+
          sAgrupaDetalhe+sSomentePRD+sNaoInventariado+sUltimoMovimento2+UltimaCompra+
          ' AND ((SELECT '+cEstoqueLoja+' FROM '+
          ' ITEM_DE_ESTOQUE T10 WHERE T10.PRD_CODIGO=T1.PRD_CODIGO AND T10.CNC_CODIGO='+
          IntToStr(dblCodigoCNC.KeyValue)+')<=0 OR NOT EXISTS '+
          '(SELECT PRD_CODIGO FROM ITEM_DE_ESTOQUE T10 WHERE '+
          'T10.PRD_CODIGO=T1.PRD_CODIGO AND T10.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+')) '+
          Ordem;

        Item_de_Estoque1.Open;
        if not Item_de_Estoque1.IsEmpty then
        Begin
          report.Preview;
          Close;
        end
        else
          ShowMessage('Nenhuma transferência necessária com esse(s) filtro(s)!');
      end;
    end
    else // LBM
}
    Begin
      Application.CreateForm(Trpt_TransferenciaNecessaria, rpt_TransferenciaNecessaria);
      with rpt_TransferenciaNecessaria do
      Begin
        zrlFiltros.Caption := sFiltros;
        SZRLabel4.Enabled := True;
        zrlDestino.Enabled := True;
        SZRLabel2.Caption:=dblCodigoCNC.Text;
        CdCNCDestino := dblCodigoCNC.KeyValue;
        Item_de_Estoque1.Close;
        Item_de_Estoque1.SQL.Text:='SELECT T2.CNC_CODIGO,T2.IES_INDISPONIVEL,'+
          'T2.IES_SCOMERCIAL,T2.IES_SFISICO,T2.IES_SRESERVADO,T2.PRD_CODIGO,t2.IES_SSN,'+
          't2.IES_SLJ4,t2.IES_SBONIFICACAO,t2.IES_SAMOSTRA,t2.IES_SBONIFICACAO,t2.IES_SAMOSTRA_FISCAL,'+
          'T1.PRD_SITUACAO,T1.GRP_CODIGO,T1.PRD_COMISSAO,T1.PRD_CUSTO,T1.PRD_DESCRICAO,T1.PRD_DT_ULT_COMPRA,'+
          'T1.PRD_EST_MINIMO,T1.PRD_MARCA,T1.PRD_PRECO_COMPRA,T1.PRD_REFERENCIA,T1.PRD_UNIDADE,'+
          'T1.PRD_PRECO_MEDIO,T1.PRD_DETALHE,PRD_CARACTERISTICA '+
          'FROM PRODUTO T1, ITEM_DE_ESTOQUE T2 '+
          'WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+ //Onde Tem o Estoque
          EstMenos+cFUN+cPRD+Ativo+cDetalhe+cRef+cLocalEstoque+cFOR+cGRP+cExibirFora+
          sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+sSomenteForaLinha+
          sAgrupaDetalhe+sSomentePRD+sNaoInventariado+UltimoMovimento+UltimaCompra+
          ' AND T2.PRD_CODIGO=T1.PRD_CODIGO '+
          ' AND ((SELECT '+cEstoqueLoja+' FROM '+
          ' ITEM_DE_ESTOQUE T10 WHERE T10.PRD_CODIGO=T1.PRD_CODIGO AND T10.CNC_CODIGO='+
          IntToStr(dblCodigoCNC.KeyValue)+')<=0 '+
          ' OR NOT EXISTS '+
          ' (SELECT PRD_CODIGO FROM ITEM_DE_ESTOQUE T10 WHERE '+
          ' T10.PRD_CODIGO=T1.PRD_CODIGO '+
          ' AND T10.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+')) '+
          Ordem;

        Item_de_Estoque1.Open;
        if not Item_de_Estoque1.IsEmpty then
        Begin
          report.Preview;
          Close;
        end
        else
          ShowMessage('Nenhuma transferência necessária com esse(s) filtro(s)!');
      end;
    end;
  end
  //Atenção Tag 5 usada no MxSPediProd
  //Produtos Site
  else if tag = 6 then
  Begin
    Application.CreateForm(Trpt_produtoSite,rpt_produtoSite);
    rpt_produtoSite.zrlFiltros.Caption := sFiltros;
    case cmbOrdem.itemIndex of
     0: Begin
          Ordem:=' ORDER BY PRD_CODIGO ';
          rpt_produtoSite.SZRGroup1.Expression := '';
          rpt_produtoSite.SZRGroup1.Height := 0;
          rpt_produtoSite.SZRGroup2.Expression := '';
          rpt_produtoSite.SZRGroup2.Height := 0;
        end;
     1: Ordem:=' ORDER BY GRP_CODIGO,SGP_CODIGO,PRD_DESCRICAO ';
    end;

    rpt_produtoSite.Produto1.Close;
    rpt_produtoSite.Produto1.SQL.Text:='SELECT * FROM PRODUTO_SITE '+
          ' WHERE PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO T1 '+
          ' WHERE T1.PRD_CODIGO<>-1 '
          +Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+sDescricao+
          sMarca+sCaracteristica+sClassificacao+sCatalogo+sSomenteForaLinha+sNaoInventariado+')'+
          Ordem;

    rpt_produtoSite.Produto1.Open;
    if rpt_produtoSite.Produto1.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    rpt_produtoSite.report.Preview;
    rpt_produtoSite.Close;
  end
  else if Tag = 8 then //Listão do Inventário
  Begin
    Application.CreateForm(Trpt_ListaoInvent, rpt_ListaoInvent);
    with rpt_ListaoInvent do
    Begin
      Tag := 0;
      zrlfiltros.Caption := sFiltros;
      if ckbLinhaExtra.Checked then
        zrbDetalhe.Height := 2;
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM PRODUTO T1 '+sTabelaEstoque+
        ' WHERE T1.PRD_CODIGO<>-1 '+
        Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+cExibirFora+
        sDescricao+sMarca+sCaracteristica+sClassificacao+sCatalogo+sSomenteForaLinha+
        sAgrupaDetalhe+sSomentePRD+sNaoInventariado+sUltimoMovimento2+EstMenos+Centro+
        sCampoEstoque+UltimaCompra+
        Ordem;
      Entidade.Open;
      if Entidade.isEmpty then
        Raise exception.Create('Consulta vazia!');
      report.preview;
      Close;
    end;
  end
  else if Tag = 9 then //Estoque de Lote
  Begin
    Application.CreateForm(Trpt_estoqueLote1, rpt_estoqueLote1);
    with rpt_estoqueLote1 do
    Begin
      Tag := 0;
      if rdbEstoqueFiscal.Checked then
        zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (F)'
      else if rdbEstoqueFisico1.Checked then
        zrlTituloRelatorio.Caption:=zrlTituloRelatorio.Caption+' (Fisico)';

      if ckbSintetico.Checked then
      Begin
        zrbGrupo.Height := 0;
        if ckbLinhaExtra.Checked then
          zrlLinha.Enabled := False
        else
          zrbRodapeGrupo.Height := 1; //Esconder a linha
      end;

      if ckbCodigoLOT.Checked then
        sFiltroLote := ' AND LOT_CODIGO='+edtCodigoLOT.Text;

      if ckbCodigoCNC.Checked then
        sFiltroCNC := ' AND CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue);
      sFiltroEstoque := sFiltroEstoque1;
      sFiltroUltimoMovimento := sFiltroUltimoMovimento1;
      zrlfiltros.Caption := sFiltros;
      vPatrimonio:=0;

      if rdgPreco.ItemIndex in [0,1,2,3] then
      Begin
        zrlDescTotalPatrimonio.Enabled:=True;
        zrlTotalPatrimonio.Enabled:=True;
        if rdgPreco.ItemIndex = 3 then
          zrlDescPreco2.Caption := 'Venda';
      end
      else
      Begin
        zrlDescPrecoUnit.Enabled:=False;
        zrlDescPreco1.Enabled:=False;
        zrlDescPreco2.Enabled:=False;
        zrlPreco1.Enabled:=False;
        zrlPreco2.Enabled:=False;
      end;

      Entidade.Close;
      Entidade.SQL.Text:='SELECT t1.*,t2.CNC_CODIGO as CNC '+
        ',t2.IED_QTD_FISICO, T2.IED_QTD_FISCAL '+
        ' FROM  PRODUTO T1 '+
        ' INNER JOIN ITEM_DE_ESTOQUE_DETALHE T2 '+
        ' ON T1.PRD_CODIGO'+sConsiderarSemEstoque+'=T2.PRD_CODIGO '+
        ' AND T2.CNC_CODIGO<>0 '+
        Centro+EstMenos+Ativo+cDetalhe+cRef+cLocalEstoque+cPRD+cGRP+cSGP+cFOR+UltimaCompra+cLOT+
        UltimoMovimento+cExibirFora+sAgrupaDetalhe+sDescricao+sMarca+sCaracteristica+
        sClassificacao+sCatalogo+sSomenteForaLinha+sSomentePRD+sNaoInventariado+
        ' AND T2.PRD_CODIGO=T2.PRD_CODIGO '+
        Ordem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TOp_RelatProd.SB_FecharClick(Sender: TObject);
begin
Close;
end;

procedure TOp_RelatProd.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=16;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=16;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TOp_RelatProd.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=7;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TOp_RelatProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo.Close;
  SubGrupo1.Close;
  Centro_de_Custo.Close;
  Action := caFree;
end;


procedure TOp_RelatProd.RadioButton5Click(Sender: TObject);
begin
  edtCodigoPRD.Color:=AlteraCorComponentes;
  edtCodigoPRD.Enabled:=False;
  edtCodigoFOR.Color:=AlteraCorComponentes;
  edtCodigoFOR.Enabled:=False;
  Centro_de_Custo.Open;
  dblCodigoGRP.Enabled:=False;
  dblCodigoGRP.Color:=AlteraCorComponentes;
  dblCodigoCNC.Enabled:=True;
  dblCodigoCNC.Color:=clWindow;
  dblCodigoCNC.SetFocus;
end;

procedure TOp_RelatProd.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if (not DM.Configuracao1.EstoqueDetalhado) or
     (self.Tag <> 1) then
    ckbDetalheEstoque.Enabled := False;

  if tag in [0,3] then  //Produtos ou Produtos/Fornecedor
  Begin
    ckbCodigoCNC.Enabled:=False;
    rdgEstoque.ItemIndex:=-1;
    rdgEstoque.Enabled:=False;
    rdbEstoqueFisico1.Checked:=False;
    rdbEstoqueFisico1.Enabled:=False;
    rdbEstoqueComercial.Checked:=False;
    rdbEstoqueComercial.Enabled:=False;
    rdbEstoqueFiscal.Checked:=False;
    rdbEstoqueFiscal.Enabled:=False;
    rdbEstoqueLJ3.Checked:=False;
    rdbEstoqueLJ3.Enabled:=False;
    rdbEstoqueLJ4.Checked:=False;
    rdbEstoqueLJ4.Enabled:=False;
    rdbEstoqueIndisponivel.Checked:=False;
    rdbEstoqueIndisponivel.Enabled:=False;
    rdbEstoqueReserva.Checked:=False;
    rdbEstoqueReserva.Enabled:=False;
    rdbEstoqueBonificacao.Checked:=False;
    rdbEstoqueBonificacao.Enabled:=False;
    rdbEstoqueAmostra.Checked:=False;
    rdbEstoqueAmostra.Enabled:=False;
    rdbEstoqueBonificacaoF1.Checked:=False;
    rdbEstoqueBonificacaoF1.Enabled:=False;
    rdbEstoqueAmostraF1.Checked:=False;
    rdbEstoqueAmostraF1.Enabled:=False;
    if Tag = 0 then
    Begin
      ckbMalaDireta.Enabled:=True;
      rdgPreco.Enabled:=True;
      if DM.Configuracao1.Empresa = empMotical then //MOTICAL
        ckbSomenteSubGrupo.Checked := True;
    end;
  end
  else if tag = 1 then //Posição de Estoque
  Begin
    rdgPreco.ItemIndex:=-1;
    rdgPreco.Enabled:=True;
    ckbMalaDireta.Enabled:=True;
    ckbExibirForaTabela.Checked := True;
    if DM.Configuracao1.Empresa = empEletro then
      rdbEstoqueComercial.Checked := True;
  end
{  else if tag = 2 then //Sugestão de Compra
  Begin
    ckbCodigoCNC.Checked:=True;
    ckbCodigoCNC.Enabled:=False;
    rdbEstoqueFisico.Checked:=False;
    rdbEstoqueFisico.Enabled:=False;
    rdbEstoqueComercial.Checked:=False;
    rdbEstoqueComercial.Enabled:=False;
    rdbEstoqueFiscal.Checked:=False;
    rdbEstoqueFiscal.Enabled:=False;
    rdbEstoqueSN.Checked:=False;
    rdbEstoqueSN.Enabled:=False;
    rdbEstoqueIndisponivel.Checked:=False;
    rdbEstoqueIndisponivel.Enabled:=False;
    rdbEstoqueReserva.Checked:=False;
    rdbEstoqueReserva.Enabled:=False;
  end
}  else if tag = 4 then //Transferencia Necessária
  Begin
    ckbCodigoCNC.Checked:=True;
    ckbCodigoCNC.Enabled:=False;
    rdgEstoque.ItemIndex := 2;
    ckbExibirForaTabela.Checked := True;
    rdgPreco.ItemIndex := -1;
  end
  else if tag in [6, 8] then //Produtos Site / Listao Inventário
  Begin
    ckbAgruparDescricao.Enabled := False;
    rdbEstoqueFisico1.Checked   := False;
  end
  else if tag = 9 then //Lote
  Begin
    ckbCodigoLOT.Enabled := True;
    rdbEstoqueComercial.Enabled := False;
    rdbEstoqueFiscal.Enabled := False;
    rdbEstoqueLJ3.Enabled := False;
    rdbEstoqueLJ4.Enabled := False;
    rdbEstoqueIndisponivel.Enabled := False;
    rdbEstoqueReserva.Enabled := False;
    rdbEstoqueAmostra.Enabled := False;
    rdbEstoqueBonificacao.Enabled := False;
    rdbEstoqueAmostraF1.Enabled := False;
    rdbEstoqueBonificacaoF1.Enabled := False;
    ckbCodigoFUN.Enabled := False;
  end;

  if tag <> 0 then
  Begin
    ckbExibirLocalEstoque.Checked := False;
    ckbExibirLocalEstoque.Enabled := False;
  end;

  if tag = 1 then //Posição de Estoque
  Begin
    cmbOrdem.ItemIndex:=0;
    ckbAgruparDescricao.Enabled := False;
    if DM.Configuracao1.Empresa = empEletro then
      rdgEstoque.ItemIndex := 2;
  end
  else
    cmbOrdem.ItemIndex:=1;

  if not (DM.Configuracao1.Empresa in TEmpresasEstFUN) then
    ckbCodigoFUN.Enabled := False;

  if (DM.Usuario1.Permissoes.IndexOf(IntToStr(8230)) < 0) and
     (tag = 1) then //Posição de Estoque
  Begin
    ckbCodigoPRD.Enabled := False;
    ckbCodigoPRD.Checked := True;
  end
  else
    ckbCodigoPRD.SetFocus;
end;

procedure TOp_RelatProd.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  begin
    Centro_de_Custo.Open;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.Color:=clWindow;

    if DM.Configuracao1.Empresa <> empLBM then
      dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC
    else if DM.Configuracao1.CodigoCNC = 1 then
      dblCodigoCNC.KeyValue := 2
    else
      dblCodigoCNC.KeyValue := 1;

    dblCodigoCNC.SetFocus;
  end
  else
  begin
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TOp_RelatProd.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    Grupo.Open;
    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    ckbCodigoSGP.Enabled:=True;
    dblCodigoGRP.KeyValue:=Grupo.FieldByName('GRP_CODIGO').asInteger;
    dblCodigoGRP.SetFocus;
  end
  else
  Begin
    Grupo.Close;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    ckbCodigoSGP.Checked:=False;
    ckbCodigoSGP.Enabled:=False;
    dblCodigoGRP.KeyValue:=0;
  end;
end;

procedure TOp_RelatProd.dblCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    if dblCodigoGRP.KeyValue > 0 then
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
    end;
  end;
end;

procedure TOp_RelatProd.ckbDetalheClick(Sender: TObject);
begin
  if ckbDetalhe.Checked then
  Begin
    edtDetalhe.Enabled:=True;
    edtDetalhe.Color:=clWindow;
    edtDetalhe.SetFocus;
  end
  else
  Begin
    edtDetalhe.Enabled:=False;
    edtDetalhe.Color:=AlteraCorComponentes;
    edtDetalhe.Clear;
  end;
end;

procedure TOp_RelatProd.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if not (dblCodigoGRP.KeyValue > 0)then
    Begin
      ShowMessage('Selecione primeiro o grupo!');
      ckbCodigoGRP.Checked:=False;
      exit;
    end
    else
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
      dblCodigoSGP.Enabled:=True;
      dblCodigoSGP.color:=clWindow;
      dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
      dblCodigoSGP.SetFocus;
    end;
  end
  else
  Begin
      dblCodigoSGP.Enabled:=False;
      dblCodigoSGP.color:=AlteraCorComponentes;
      dblCodigoSGP.KeyValue:=0;
  end;
end;

procedure TOp_RelatProd.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Color:=clWindow;
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.Color:=AlteraCorComponentes;
    edtCodigoFOR.Enabled:=False;
    edtCodigoFOR.Clear;
  end;
end;

procedure TOp_RelatProd.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Enabled:=False;
    edtCodigoPRD.Clear;
  end;
end;

procedure TOp_RelatProd.ckbReferenciaClick(Sender: TObject);
begin
  if ckbReferencia.Checked then
  Begin
    edtReferencia.Enabled:=True;
    edtReferencia.Color:=clWindow;
    edtReferencia.SetFocus;
  end
  else
  Begin
    edtReferencia.Enabled:=False;
    edtReferencia.Color:=AlteraCorComponentes;
    edtReferencia.Clear;
  end;
end;

procedure TOp_RelatProd.ckbUltimoMovimentoClick(Sender: TObject);
begin
  if ckbUltimoMovimento.Checked then
  Begin
    cmbUltimoMovimento.Enabled:=True;
    cmbUltimoMovimento.Color:=clWindow;
    cmbUltimoMovimento.ItemIndex := 0;
    mskUltimoMovimento.Enabled:=True;
    mskUltimoMovimento.Color:=clWindow;
    mskUltimoMovimento.SetFocus;
  end
  else
  Begin
    cmbUltimoMovimento.Enabled:=False;
    cmbUltimoMovimento.ItemIndex := -1;
    cmbUltimoMovimento.Color:=AlteraCorComponentes;
    mskUltimoMovimento.Enabled:=False;
    mskUltimoMovimento.Color:=AlteraCorComponentes;
    mskUltimoMovimento.Clear;
  end;
end;

procedure TOp_RelatProd.ckbLocalDeEstoqueClick(Sender: TObject);
begin
  if ckbLocalDeEstoque.Checked then
  Begin
    edtLocalDeEstoque.Enabled:=True;
    edtLocalDeEstoque.Color:=clWindow;
    edtLocalDeEstoque.SetFocus;
  end
  else
  Begin
    edtLocalDeEstoque.Enabled:=False;
    edtLocalDeEstoque.Color:=AlteraCorComponentes;
    edtLocalDeEstoque.Clear;
  end;
end;

procedure TOp_RelatProd.rdgEstoqueClick(Sender: TObject);
begin
  if not edtValorX.Enabled then
  Begin
    edtValorX.Enabled := True;
    edtValorX.Text := '0';
  end;
end;

procedure TOp_RelatProd.ckbAgruparDescricaoClick(Sender: TObject);
begin
  if ckbAgruparDescricao.Checked then
  Begin
    Label2.Enabled := true;
    Label3.Enabled := true;
    Label4.Enabled := true;
    Label5.Enabled := true;
    Label7.Enabled := true;
    Label8.Enabled := true;
    edtColuna1.Enabled:=true;
    edtColuna1.Color:=clWindow;
    edtColuna2.Enabled:=true;
    edtColuna2.Color:=clWindow;
    edtColuna3.Enabled:=true;
    edtColuna3.Color:=clWindow;
    edtColuna4.Enabled:=true;
    edtColuna4.Color:=clWindow;
    edtColuna5.Enabled:=true;
    edtColuna5.Color:=clWindow;
    edtColuna6.Enabled:=true;
    edtColuna6.Color:=clWindow;
    edtColuna1.SetFocus;
    cmbOrdem.ItemIndex := 1;
    cmbOrdem.Enabled := False;
    if not (tag in [0, 1]) then //Produtos, Posição
    Begin
      rdgPreco.ItemIndex := -1;
      rdgPreco.Enabled := False;
    end;
  end
  else
  begin
    Label2.Enabled := false;
    Label3.Enabled := false;
    Label4.Enabled := false;
    Label5.Enabled := false;
    Label7.Enabled := false;
    Label8.Enabled := false;
    edtColuna1.Enabled:=False;
    edtColuna1.Color:=AlteraCorComponentes;
    edtColuna1.Clear;
    edtColuna2.Enabled:=false;
    edtColuna2.Color:=AlteraCorComponentes;
    edtColuna2.Clear;
    edtColuna3.Enabled:=False;
    edtColuna3.Color:=AlteraCorComponentes;
    edtColuna3.Clear;
    edtColuna4.Enabled:=False;
    edtColuna4.Color:=AlteraCorComponentes;
    edtColuna4.Clear;
    edtColuna5.Enabled:=False;
    edtColuna5.Color:=AlteraCorComponentes;
    edtColuna5.Clear;
    edtColuna6.Enabled:=False;
    edtColuna6.Color:=AlteraCorComponentes;
    edtColuna6.Clear;
    cmbOrdem.Enabled := True;
    if tag in [0, 1] then //Produtos, Posição
    Begin
      rdgPreco.ItemIndex := -1;
      rdgPreco.Enabled := True;
    end;
  end;
end;

procedure TOp_RelatProd.ckbDescricaoClick(Sender: TObject);
begin
  if ckbDescricao.Checked then
  Begin
    edtDescricao.Color:=clWindow;
    edtDescricao.Enabled:=True;
    edtDescricao.SetFocus;
  end
  else
  Begin
    edtDescricao.Color:=AlteraCorComponentes;
    edtDescricao.Enabled:=False;
    edtDescricao.Clear;
  end;
end;

procedure TOp_RelatProd.ckbSomenteSubGrupoClick(Sender: TObject);
begin
  if ckbSomenteSubGrupo.Checked then
  Begin
    cmbOrdem.Enabled := False;
    cmbOrdem.ItemIndex := -1;
  end
  else
  Begin
    cmbOrdem.Enabled := True;
    cmbOrdem.ItemIndex := 0;
  end;
end;

procedure TOp_RelatProd.ckbMarcaClick(Sender: TObject);
begin
  if ckbMarca.Checked then
  Begin
    edtMarca.Color:=clWindow;
    edtMarca.Enabled:=True;
    edtMarca.SetFocus;
  end
  else
  Begin
    edtMarca.Color:=AlteraCorComponentes;
    edtMarca.Enabled:=False;
    edtMarca.Clear;
  end;
end;

procedure TOp_RelatProd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure TOp_RelatProd.ckbSomentePRDClick(Sender: TObject);
begin
  if ckbSomentePRD.Checked then
    ckbSomenteSER.Checked := False;
end;

procedure TOp_RelatProd.ckbSomenteSERClick(Sender: TObject);
begin
  if ckbSomenteSER.Checked then
    ckbSomentePRD.Checked := False;
end;

procedure TOp_RelatProd.ckbCaracteristicaClick(Sender: TObject);
begin
  if ckbCaracteristica.Checked then
  Begin
    edtCaracteristica.Color:=clWindow;
    edtCaracteristica.Enabled:=True;
    edtCaracteristica.SetFocus;
  end
  else
  Begin
    edtCaracteristica.Color:=AlteraCorComponentes;
    edtCaracteristica.Enabled:=False;
    edtCaracteristica.Clear;
  end;
end;

procedure TOp_RelatProd.ckbMalaDiretaClick(Sender: TObject);
begin
  if ckbMalaDireta.Checked then
  Begin
    edtArquivoMalaDireta.Enabled:=True;
    edtArquivoMalaDireta.Color:=clWindow;
    if (DM.Configuracao1.Empresa = empELETRO) or (DM.Configuracao1.Empresa = empLuciano) then
      edtArquivoMalaDireta.Text := 'C:\Etiquetas.txt'
    else
      edtArquivoMalaDireta.Text := 'C:\SIAC_Produtos.txt';
    edtArquivoMalaDireta.SetFocus;
  end
  else
  Begin
    edtArquivoMalaDireta.Enabled:=False;
    edtArquivoMalaDireta.Color:=AlteraCorComponentes;
    edtArquivoMalaDireta.Clear;
  end;
end;

procedure TOp_RelatProd.ckbNaoInventariadosClick(Sender: TObject);
begin
  if ckbNaoInventariados.Checked then
  Begin
    mskDataInventario.Enabled:=True;
    mskDataInventario.Color:=clWindow;
    mskDataInventario.SetFocus;
  end
  else
  Begin
    mskDataInventario.Enabled:=False;
    mskDataInventario.Color:=AlteraCorComponentes;
    mskDataInventario.Clear;
  end;
end;

procedure TOp_RelatProd.ckbSomenteForaDeLinhaClick(Sender: TObject);
begin
  if ckbSomenteForaDeLinha.Checked then
    ckbSomenteEmLinha.Checked := False;
end;

procedure TOp_RelatProd.ckbSomenteEmLinhaClick(Sender: TObject);
begin
  if ckbSomenteEmLinha.Checked then
    ckbSomenteForaDeLinha.Checked := False;
end;

procedure TOp_RelatProd.ckbClassificacaoClick(Sender: TObject);
begin
  if ckbClassificacao.Checked then
  Begin
    Parametro1.Open;
    dblClassificacao.Enabled  := True;
    dblClassificacao.Color    := clWindow;
    dblClassificacao.SetFocus;
  end
  else
  Begin
    Parametro1.Close;
    dblClassificacao.Enabled:=False;
    dblClassificacao.Color:=AlteraCorComponentes;
    dblClassificacao.KeyValue:=0;
  end;
end;

procedure TOp_RelatProd.ckbDetalheEstoqueClick(Sender: TObject);
begin
  if ckbDetalheEstoque.Checked then
  Begin
    Parametro2.Open;
    if not (rdbEstoqueFisico1.Checked or rdbEstoqueFiscal.Checked) then
      rdbEstoqueFisico1.Checked := True;
    ckbAgruparDescricao.Checked := False;
    ckbAgruparDescricao.Enabled := False;
    rdbEstoqueComercial.Enabled := False;
    rdbEstoqueLJ3.Enabled := False;
    rdbEstoqueLJ4.Enabled := False;
    rdbEstoqueIndisponivel.Enabled := False;
    rdbEstoqueReserva.Enabled := False;
    rdbEstoqueBonificacao.Enabled := False;
    rdbEstoqueAmostra.Enabled := False;
    rdbEstoqueBonificacaoF1.Enabled := False;
    rdbEstoqueAmostraF1.Enabled := False;
    dblDetalheEstoque.Enabled:=True;
    dblDetalheEstoque.color:=clWindow;
//    dblDetalheEstoque.KeyValue:=Parametro2.CodigoPAR;
    dblDetalheEstoque.SetFocus;
  end
  else
  Begin
    rdbEstoqueComercial.Enabled := True;
    rdbEstoqueLJ3.Enabled := True;
    rdbEstoqueLJ4.Enabled := True;
    rdbEstoqueIndisponivel.Enabled := True;
    rdbEstoqueReserva.Enabled := True;
    dblDetalheEstoque.Enabled:=False;
    dblDetalheEstoque.color:=AlteraCorComponentes;
    dblDetalheEstoque.KeyValue:=0;
  end;
end;

procedure TOp_RelatProd.ckbCodigoFUNClick(Sender: TObject);
begin
  if ckbCodigoFUN.Checked then
  Begin
    Funcionario1.Open;
    dblCodigoFUN.Enabled:=True;
    dblCodigoFUN.Color:=clWindow;
    dblCodigoFUN.KeyValue:=Funcionario1.CentroDeCusto;
    dblCodigoFUN.SetFocus;
  end
  else
  Begin
    Funcionario1.Close;
    dblCodigoFUN.Enabled:=False;
    dblCodigoFUN.Color:=AlteraCorComponentes;
    dblCodigoFUN.KeyValue:=-1;
  end;
end;

procedure TOp_RelatProd.ckbSinteticoClick(Sender: TObject);
begin
  if ckbSintetico.Checked then
    ckbLinhaExtra.Enabled := True
  else
  Begin
    ckbLinhaExtra.Checked := False;
    ckbLinhaExtra.Enabled := False;
  end;
end;

procedure TOp_RelatProd.ckbUltimaCompraClick(Sender: TObject);
begin
  if ckbUltimaCompra.Checked then
  Begin
    cmbUltimaCompra.Enabled:=True;
    cmbUltimaCompra.Color:=clWindow;
    cmbUltimaCompra.ItemIndex := 0;
    mskUltimaCompra.Enabled:=True;
    mskUltimaCompra.Color:=clWindow;
    mskUltimaCompra.SetFocus;
  end
  else
  Begin
    cmbUltimaCompra.Enabled:=False;
    cmbUltimaCompra.Color:=AlteraCorComponentes;
    cmbUltimaCompra.ItemIndex := -1;
    mskUltimaCompra.Enabled:=False;
    mskUltimaCompra.Color:=AlteraCorComponentes;
    mskUltimaCompra.Clear;
  end;
end;

procedure TOp_RelatProd.ckbCodigoLOTClick(Sender: TObject);
begin
  if ckbCodigoLOT.Checked then
  Begin
    ckbCodigoPRD.Checked := True;
    ckbCodigoPRD.Enabled := False;
    edtCodigoLOT.Color:=clWindow;
    edtCodigoLOT.Enabled:=True;
    edtCodigoLOT.SetFocus;
  end
  else
  Begin
    ckbCodigoPRD.Enabled := True;
    edtCodigoLOT.Color:=AlteraCorComponentes;
    edtCodigoLOT.Enabled:=False;
    edtCodigoLOT.Clear;
  end;
end;

procedure TOp_RelatProd.edtCodigoLOTKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Raise exception.Create('Defina o código do produto!');
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadLote, fCadLote);
    with fCadLote do
    Begin
      tag:=8;
      edtCodigoPRD.text := self.edtCodigoPRD.Text;
      ShowModal;
    end;
  end;
end;

procedure TOp_RelatProd.ReportProduto(filtrosSQL, filtros: string);
var
  SQL: string;
  stiReport: CoSiacReport_;
begin

  SQL := 'SELECT T1.*, T2.GRP_DESCRICAO FROM PRODUTO T1 '+
         'LEFT JOIN GRUPO T2 ON ' +
         'T1.GRP_CODIGO = T2.GRP_CODIGO ' +
         'WHERE T1.PRD_CODIGO<>-1 ' +filtrosSQL;

  stiReport.Create.ReportProdutos(false,
                                  false,
                                  SQL,
                                  EmpresaDesenvolvedora,
                                  'Relatório de produtos do sistema agrupado por Grupo',
                                  DM.CentroCusto1.RazaoSocial,
                                  '',//DM.Configuracao1.LojaNome
                                  'Relatório de Produtos',
                                  DM.Usuario1.NomeUSU,
                                  'Filtros: ' +LowerCase(filtros),
                                  rptArquivoLogo);
end;

procedure TOp_RelatProd.ReportFornecedorProduto(filtrosSQL, filtros: string);
var
  SQL: string;
  stiReport: CoSiacReport_;
begin
  SQL := 'SELECT '+
         '  T4.CNC_CODIGO, '+
         '  T4.CNC_RZ_SOCIAL, '+
         '  T4.CNC_NOME_FAN, '+
         '  T4.CNC_FONE, '+
         '  T3.FOR_RZ_SOCIAL, '+
         '  T3.FOR_NOME_FAN, '+
         '  T3.FOR_FONE, '+
         '  T2.FOR_CODIGO, '+
         '  T2.PPF_CODIGO, '+
         '  T2.PRD_CODIGO, '+
         '  T1.PRD_CARACTERISTICA, '+
         '  T1.PRD_REFERENCIA, '+
         '  T1.PRD_UNIDADE, '+
         '  T1.PRD_MARCA, '+
         '  T1.PRD_DESCRICAO, '+
         '  T1.PRD_PRECO_VENDA, '+
         '  T1.PRD_DETALHE '+
         'FROM PRODUTO T1 '+
         'INNER JOIN FORNECEDOR T3 ON T1.FOR_CODIGO=T3.FOR_CODIGO '+
         'INNER JOIN PRODUTO_POR_FORNECEDOR T2 ON T2.PRD_CODIGO=T1.PRD_CODIGO AND T2.FOR_CODIGO=T1.FOR_CODIGO '+
         'INNER JOIN CENTRO_DE_CUSTO T4 ON T4.CNC_CODIGO = T2.CNC_CODIGO '+
         'WHERE T1.PRD_CODIGO<>-1 ' +filtrosSQL + ' ' +
         'ORDER BY T4.CNC_CODIGO, T3.FOR_CODIGO, T1.PRD_DESCRICAO ';

  stiReport.Create.ReportFornecedorProduto(false,
                                  false,
                                  SQL,
                                  EmpresaDesenvolvedora,
                                  'Relatório de Fornecedor por produtos do sistema',
                                  DM.CentroCusto1.RazaoSocial,
                                  '',//DM.Configuracao1.LojaNome
                                  'Relatório de Fornecedor por Produtos',
                                  DM.Usuario1.NomeUSU,
                                  'Filtros: ' +LowerCase(filtros),
                                  rptArquivoLogo);
end;

procedure TOp_RelatProd.ReportSugestaoCompras(filtrosSQL, filtros: string);
var
  SQL, EstMenos, Centro20, sConsiderarSemEstoque: string;
  stiReport: CoSiacReport_;
begin
  if ckbCodigoCNC.Checked then
    Centro20 := ' AND (T20.CNC_CODIGO = '+IntToStr(dblCodigoCNC.KeyValue)+')'
  else
    Centro20 := '';

  if ckbConsiderarSemEstoque.Checked then
    sConsiderarSemEstoque := '*'
  else
    sConsiderarSemEstoque := '';

  EstMenos := EstMenos + ' AND T1.PRD_EST_MINIMO>=(SELECT ISNULL(SUM(T20.IES_SCOMERCIAL-T20.IES_SRESERVADO-T20.IES_INDISPONIVEL),0.00) '+
                         ' FROM ITEM_DE_ESTOQUE T20 '+
                         ' WHERE T20.PRD_CODIGO=T1.PRD_CODIGO '+ Centro20 + ')';
  SQL := 'SELECT ' +
         ' CNC.CNC_CODIGO, '+
         ' CNC.CNC_RZ_SOCIAL, '+
         ' CNC.CNC_NOME_FAN, '+
         ' CNC.CNC_FONE, '+
         ' T2.CNC_CODIGO '+
         ',ISNULL(T2.IES_INDISPONIVEL,0.00) AS IES_INDISPONIVEL '+
         ',ISNULL(T2.IES_SCOMERCIAL,0.00) AS IES_SCOMERCIAL '+
         ',ISNULL(T2.IES_SFISICO,0.00) AS IES_SFISICO '+
         ',ISNULL(T2.IES_SRESERVADO,0.00) AS IES_SRESERVADO '+
         ',ISNULL(t2.IES_SSN,0.00) AS IES_SSN '+
         ',ISNULL(t2.IES_SLJ4,0.00) AS IES_SLJ4 '+
         ',ISNULL(t2.IES_SBONIFICACAO,0.00) AS IES_SBONIFICACAO '+
         ',ISNULL(t2.IES_SAMOSTRA,0.00) AS IES_SAMOSTRA '+
         ',ISNULL(t2.IES_SBONIFICACAO_FISCAL,0.00) AS IES_SBONIFICACAO_FISCAL '+
         ',ISNULL(t2.IES_SAMOSTRA_FISCAL,0.00) AS IES_SAMOSTRA_FISCAL '+
         ',T1.PRD_CODIGO,T1.PRD_SITUACAO '+
         ',T1.GRP_CODIGO,T1.PRD_COMISSAO,T1.PRD_CUSTO,T1.PRD_DESCRICAO,T1.PRD_DT_ULT_COMPRA '+
         ',T1.PRD_EST_MINIMO,T1.PRD_MARCA,T1.PRD_PRECO_COMPRA,T1.PRD_REFERENCIA,T1.PRD_UNIDADE '+
         ',T1.PRD_PRECO_MEDIO,T1.PRD_DETALHE,T1.PRD_CARACTERISTICA,T3.GRP_DESCRICAO '+
         ' FROM PRODUTO T1, '+
         ' ITEM_DE_ESTOQUE T2, '+
         ' GRUPO T3, ' +
         ' CENTRO_DE_CUSTO CNC '+
         ' WHERE T1.PRD_CODIGO'+sConsiderarSemEstoque+'=T2.PRD_CODIGO AND CNC.CNC_CODIGO = T2.CNC_CODIGO '+
         ' AND T1.GRP_CODIGO=T3.GRP_CODIGO '+ EstMenos + filtrosSQL +
         ' ORDER BY CNC.CNC_CODIGO, T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA,T1.PRD_CODIGO';

  stiReport.Create.ReportSugestaoCompras(false,
                                         false,
                                         SQL,
                                         EmpresaDesenvolvedora,
                                         'Relatório de sugestão de compras do sistema',
                                         DM.CentroCusto1.RazaoSocial,
                                         '',//DM.Configuracao1.LojaNome
                                         'Relatório de Sugestão de Compras',
                                         DM.Usuario1.NomeUSU,
                                         'Filtros: ' +LowerCase(filtros),
                                         rptArquivoLogo);
end;

end.
