unit UfMxSProdutoData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Variants;

type
  TfMxSProdutoData = class(TForm)
    Panel1: TPanel;
    edtCodigoPRD: TEdit;
    edtCodigoFOR: TEdit;
    Panel2: TPanel;
    bitOK: TBitBtn;
    bitCancelar: TBitBtn;
    DSGrupo: TDataSource;
    dblCodigoGRP: TDBLookupComboBox;
    dblCentroDeCusto: TDBLookupComboBox;
    Centro_de_Custo: TQuery;
    DSCentro_de_Custo: TDataSource;
    ckbCodigoCNC: TCheckBox;
    ckbCodigoSGP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataFIM: TMaskEdit;
    mskDataINI: TMaskEdit;
    ckbCodigoPRD: TCheckBox;
    ckbCodigoFOR: TCheckBox;
    ckbCodigoGRP: TCheckBox;
    Label3: TLabel;
    edtPrevisao: TEdit;
    Label4: TLabel;
    Grupo1: TGrupo;
    ckbDesativados: TCheckBox;
    ckbDetalhe: TCheckBox;
    ckbReferencia: TCheckBox;
    edtReferencia: TEdit;
    labFornecedor: TLabel;
    Fornecedor1: TFornecedor;
    ckbSomenteEstoqueVendas: TCheckBox;
    cmbDetalhe: TComboBox;
    ckbEstoqueFiscal: TCheckBox;
    edtMarca: TEdit;
    ckbMarca: TCheckBox;
    edtCaracteristica: TEdit;
    ckbCaracteristica: TCheckBox;
    ckbSintetico: TCheckBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    edtValorX: TEdit;
    rdgEstoque: TRadioGroup;
    rdbEstoqueFisico: TRadioButton;
    rdbEstoqueComercial: TRadioButton;
    rdbEstoqueFiscal: TRadioButton;
    rdbEstoqueLJ3: TRadioButton;
    rdbEstoqueIndisponivel: TRadioButton;
    rdbEstoqueReserva: TRadioButton;
    rdbEstoqueLJ4: TRadioButton;
    edtCodigoTBP: TEdit;
    ckbCodigoTBP: TCheckBox;
    Label6: TLabel;
    edtPercentualAumento: TEdit;
    Label7: TLabel;
    ckbComprasVendas: TCheckBox;
    ckbTransferencia: TCheckBox;
    edtTransferencia: TEdit;
    procedure bitOKClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton5Click(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbDetalheClick(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure ckbSomenteEstoqueVendasClick(Sender: TObject);
    procedure ckbEstoqueFiscalClick(Sender: TObject);
    procedure ckbMarcaClick(Sender: TObject);
    procedure ckbCaracteristicaClick(Sender: TObject);
    procedure rdgEstoqueClick(Sender: TObject);
    procedure ckbCodigoTBPClick(Sender: TObject);
    procedure ckbTransferenciaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

  public

  end;

var
  fMxSProdutoData: TfMxSProdutoData;

implementation

uses
  UProduto, funcoes, UDM, UPrev_vendas, MxSPediProd, MxSCotaFor, URel_Embar,
  UComprasXVendas, MxSPediProdMotCal, SysConst, DateUtils,
  UComparativoAnual, UTabelaPreco, UComprasXVendasLuciano;

{$R *.DFM}


procedure TfMxSProdutoData.bitOKClick(Sender: TObject);
var
  mensagem,centro,CdPRD,CdFOR,CdGRP,CdSGP,cRef,cDetalhe,
    cDtINI, cDtFIM, cDtINI2, cDtFIM2, cSituacao, sCentroVendasXCompras,
    sMarca,sCaracteristica,EstMenos,cEstoqueLoja,CdTBP,sFiltros,aExists, aTransferencia:string;
begin
  aTransferencia:='';
  mensagem:='';
  CdPRD:='';
  CdFOR:='';
  CdGRP:='';
  CdSGP:='';
  cDetalhe:='';
  cRef:='';
  sFiltros:='';
  sMarca:='';
  sCaracteristica:='';
  EstMenos:='';
  CdTBP := '';


  if ckbTransferencia.Checked then
    if not VerificaInteiroBranco(edtTransferencia.Text) then
      Raise Exception.Create('Código da Transferência inválido!')
    else
    Begin
      aTransferencia:= ' AND ( EXISTS (SELECT I1.PRD_CODIGO  FROM ITEM_DE_TRANSFERENCIA I1, TRANSFERENCIA C1 '+
                       ' WHERE I1.PRD_CODIGO= T2.PRD_CODIGO AND C1.TRF_CNC_DESTINO=T3.CNC_CODIGO AND C1.TRF_SITUACAO=1 '+
                       ' AND I1.TRF_CODIGO=C1.TRF_CODIGO  AND I1.CNC_CODIGO=C1.CNC_CODIGO '+
                       ' AND C1.TRF_CODIGO='+edtTransferencia.Text+')) ';
      sFiltros := sFiltros + ' (TRANS:'+edtTransferencia.Text+')';
    end;

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;

  if mensagem<>'' then
    raise exception.Create(mensagem);

  if self.Tag in [0,4] then //Previsão de Vendas ou Comparativo Anual
  Begin
    if not VerificaDataBranco(mskDataINI.Text) then
      Raise exception.Create('Data inicial inválida!');
    if not VerificaDataBranco(mskDataFIM.Text) then
      Raise exception.Create('Data final inválida!');
    if StrToDate(mskDataFim.Text) < StrToDate(mskDataINI.Text) then
      Raise Exception.Create('Intervalo inválido!');
  end;

  if not VerificaDataBranco(mskDataINI.Text)then
    cDtINI:=''
  else
  Begin
    sFiltros := sFiltros + '(DtINI:'+mskDataINI.Text+')';
    if tag = 1 then //Embarque
    Begin
      if VerificaDataBranco(mskDataINI.Text) then
        cDtINI:=' AND (T1.EMB_DATA>="'+MesDia(mskDataINI.Text)+'") ';
    end
    else if tag = 4 then //Comparativo Anual
    Begin
      sFiltros := sFiltros + '(DtINIAnterior:'+DateToStr(IncYear(StrToDate(mskDataINI.Text),-1))+')';
      cDtINI :=' AND (P1.PDV_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'") ';
      cDtINI2:=' AND (P1.PDV_DT_ENTREGA>="'+MesDia(IncYear(StrToDate(mskDataINI.Text),-1))+'") ';
    end
    else if tag = 5 then //Tabela Promocional
    Begin
      sFiltros := sFiltros + '(DtINIAnterior:'+DateToStr(IncYear(StrToDate(mskDataINI.Text),-1))+')';
      cDtINI :=' AND (T3.TBP_VALIDADE>="'+MesDia(mskDataINI.Text)+'") ';
    end;
  end;

  if not VerificaDataBranco(mskDataFIM.Text)then
    cDtFIM:=''
  else
  Begin
    sFiltros := sFiltros + '(DtFIM:'+mskDataFIM.Text+')';
    if tag = 1 then
      cDtFIM:=' AND (T1.EMB_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
    else if tag = 4 then //Comparativo Anual
    Begin
      sFiltros := sFiltros + '(DtFIMAnterior:'+DateToStr(IncYear(StrToDate(mskDataFIM.Text),-1))+')';
      cDtFIM :=' AND (PDV_DT_ENTREGA<"'+MesDia(StrTODate(mskDataFIM.Text)+1)+'") ';
      cDtFIM2:=' AND (PDV_DT_ENTREGA<"'+MesDia(IncYear(StrToDate(mskDataFIM.Text)+1,-1))+'") ';
    end
    else if tag = 5 then //Tabela Promocional
    Begin
      sFiltros := sFiltros + '(DtFIMAnterior:'+DateToStr(IncYear(StrToDate(mskDataFIM.Text),-1))+')';
      cDtFIM :=' AND (T3.TBP_VALIDADE<"'+MesDia(StrTODate(mskDataFIM.Text)+1)+'") ';
    end;
  end;

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      Raise Exception.Create('Código do Produto inválido!')
    else
    Begin
      CdPRD:= ' AND (T2.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + ' (PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbCodigoFOR.Checked then
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
      Raise Exception.Create('Código do Fornecedor inválido!')
    else
    Begin
      CdFOR:= ' AND (T2.FOR_CODIGO='+edtCodigoFOR.Text+') ';
      sFiltros := sFiltros + ' (FOR:'+labFornecedor.Caption+')';
    end;

  if ckbCodigoTBP.Checked then
    if not VerificaInteiroBranco(edtCodigoTBP.Text) then
      Raise Exception.Create('Código da Tabela inválido!')
    else
    Begin
      CdTBP:= ' AND (T1.TBP_CODIGO='+edtCodigoTBP.Text+') ';
      sFiltros := sFiltros + ' (TBP:'+edtCodigoTBP.Text+')';
    end;

  if ckbMarca.Checked then
  Begin
    sMarca := ' AND (T2.PRD_MARCA LIKE "%'+edtMarca.Text+'%") ';
    sFiltros := sFiltros + '(Marca='+edtMarca.Text+') ';
  end;

  if ckbCaracteristica.Checked then
  Begin
    sCaracteristica := ' AND (T2.PRD_CARACTERISTICA LIKE "%'+edtCaracteristica.Text+'%") ';
    sFiltros := sFiltros + '(Caracteristica='+edtCaracteristica.Text+') ';
  end;

  if ckbReferencia.Checked then
  Begin
    cRef:= ' AND (T2.PRD_REFERENCIA="'+edtReferencia.Text+'") ';
    sFiltros := sFiltros + ' (Ref.:'+edtReferencia.Text+')';
  end;

  if ckbCodigoGRP.Checked then
  Begin
    CdGRP:= ' AND (T2.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+') ';
    sFiltros := sFiltros + ' (GRP:'+IntToStr(dblCodigoGRP.KeyValue)+'-'+dblCodigoGRP.Text+')';
  end;

  if ckbCodigoSGP.Checked then
  Begin
    CdSGP:= ' AND (T2.SGP_CODIGO='+IntToStr(dblCodigoSGP.KeyValue)+') ';
    sFiltros := sFiltros + ' (SGP:'+IntToStr(dblCodigoSGP.KeyValue)+'-'+dblCodigoSGP.Text+')';
  end;

  if ckbCodigoCNC.Checked then
  Begin
    Centro:=' AND (T1.CNC_CODIGO = '+IntToStr(dblCentroDeCusto.KeyValue)+') ';
    sCentroVendasXCompras :=' AND (T3.CNC_CODIGO = '+IntToStr(dblCentroDeCusto.KeyValue)+') ';
    sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCentroDeCusto.KeyValue)+')';
  end;

  if ckbDetalhe.Checked then
    if (cmbDetalhe.ItemIndex < 0) or (cmbDetalhe.Text = '') then
      Raise Exception.Create('Detalhe inválido!')
    else
    Begin
      cDetalhe:= ' AND (T2.PRD_DETALHE="'+Trim(cmbDetalhe.Items[cmbDetalhe.ItemIndex])+'") ';
      sFiltros := sFiltros + ' (Detalhe:'+Trim(cmbDetalhe.Items[cmbDetalhe.ItemIndex])+')';
    end;

  if ckbDesativados.Checked then
  Begin
    cSituacao:=' AND (T2.PRD_SITUACAO = 1) ';
    sFiltros := sFiltros + ' (Desativados)';
  end
  else if tag <> 0 then
    cSituacao:=' AND (T2.PRD_SITUACAO <> 1) ';

  if ckbSomenteEstoqueVendas.Checked then
    sFiltros := sFiltros + '(SomenteEstVendas) ';

  if rdbEstoqueFisico.Checked then
  Begin
    case rdgEstoque.ItemIndex of
      0: Begin
           EstMenos:=' AND (t3.IES_SFISICO < '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fis)(<'+edtValorX.Text+') ';
         end;
      1: Begin
           EstMenos:=' AND (t3.IES_SFISICO = '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fis)(='+edtValorX.Text+') ';
         end;
      2: Begin
           EstMenos:=' AND (t3.IES_SFISICO > '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fis)(>'+edtValorX.Text+') ';
         end;
      3: Begin
           EstMenos:=' AND (t3.IES_SFISICO <= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fis)(<='+edtValorX.Text+') ';
         end;
      4: Begin
           EstMenos:=' AND (t3.IES_SFISICO >= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fis)(>='+edtValorX.Text+') ';
         end;
      5: Begin
           EstMenos:=' AND (t3.IES_SFISICO <> '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fis)(<>'+edtValorX.Text+') ';
         end;
    end;
    cEstoqueLoja := ',T3.IES_SFISICO AS ESTOQUE ';
  end
  else if rdbEstoqueComercial.Checked then
  Begin
    case rdgEstoque.ItemIndex of
      0: Begin
           EstMenos:=' AND ((t3.IES_SCOMERCIAL-t3.IES_SRESERVADO-t3.IES_INDISPONIVEL) < '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Com)(<>'+edtValorX.Text+') ';
         end;
      1: Begin
           EstMenos:=' AND ((t3.IES_SCOMERCIAL-t3.IES_SRESERVADO-t3.IES_INDISPONIVEL) = '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Com)(='+edtValorX.Text+') ';
         end;
      2: Begin
           EstMenos:=' AND ((t3.IES_SCOMERCIAL-t3.IES_SRESERVADO-t3.IES_INDISPONIVEL) > '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Com)(>'+edtValorX.Text+') ';
         end;
      3: Begin
           EstMenos:=' AND ((t3.IES_SCOMERCIAL-t3.IES_SRESERVADO-t3.IES_INDISPONIVEL) <= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Com)(<='+edtValorX.Text+') ';
         end;
      4: Begin
           EstMenos:=' AND ((t3.IES_SCOMERCIAL-t3.IES_SRESERVADO-t3.IES_INDISPONIVEL) >= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Com)(>='+edtValorX.Text+') ';
         end;
      5: Begin
           EstMenos:=' AND ((t3.IES_SCOMERCIAL-t3.IES_SRESERVADO-t3.IES_INDISPONIVEL) <> '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Com)(<>'+edtValorX.Text+') ';
         end;
    end;
    cEstoqueLoja := ',T3.IES_SCOMERCIAL-T3.IES_SRESERVADO-T3.IES_INDISPONIVEL AS ESTOQUE ';
  end
  else if rdbEstoqueFiscal.Checked then
  Begin
    case rdgEstoque.ItemIndex of
      0: Begin
           EstMenos:=' AND (T3.IES_SFISCAL < '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fisc)(<'+edtValorX.Text+') ';
         end;
      1: Begin
           EstMenos:=' AND (t3.IES_SFISCAL = '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fisc)(='+edtValorX.Text+') ';
         end;
      2: Begin
           EstMenos:=' AND (t3.IES_SFISCAL > '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fisc)(>'+edtValorX.Text+') ';
         end;
      3: Begin
           EstMenos:=' AND (t3.IES_SFISCAL <= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fisc)(<='+edtValorX.Text+') ';
         end;
      4: Begin
           EstMenos:=' AND (t3.IES_SFISCAL >= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fisc)(>='+edtValorX.Text+') ';
         end;
      5: Begin
           EstMenos:=' AND (t3.IES_SFISCAL <> '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Fisc)(<>'+edtValorX.Text+') ';
         end;
    end;
    cEstoqueLoja := ',T3.IES_SFISCAL AS ESTOQUE ';
  end
  else if rdbEstoqueLJ3.Checked then
  Begin
    case rdgEstoque.ItemIndex of
      0: Begin
           EstMenos:=' AND (t3.IES_SSN < '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ3)(<'+edtValorX.Text+') ';
         end;
      1: Begin
           EstMenos:=' AND (t3.IES_SSN = '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ3)(='+edtValorX.Text+') ';
         end;
      2: Begin
           EstMenos:=' AND (t3.IES_SSN > '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ3)(>'+edtValorX.Text+') ';
         end;
      3: Begin
           EstMenos:=' AND (t3.IES_SSN <= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ3)(<='+edtValorX.Text+') ';
         end;
      4: Begin
           EstMenos:=' AND (t3.IES_SSN >= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ3)(>='+edtValorX.Text+') ';
         end;
      5: Begin
           EstMenos:=' AND (t3.IES_SSN <> '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ3)(<>'+edtValorX.Text+') ';
         end;
    end;
    cEstoqueLoja := ',T3.IES_SSN AS ESTOQUE ';
  end
  else if rdbEstoqueLJ4.Checked then
  Begin
    case rdgEstoque.ItemIndex of
      0: Begin
           EstMenos:=' AND (t3.IES_SLJ4 < '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ4)(<'+edtValorX.Text+') ';
         end;
      1: Begin
           EstMenos:=' AND (t3.IES_SLJ4 = '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ4)(='+edtValorX.Text+') ';
         end;
      2: Begin
           EstMenos:=' AND (t3.IES_SLJ4 > '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ4)(>'+edtValorX.Text+') ';
         end;
      3: Begin
           EstMenos:=' AND (t3.IES_SLJ4 <= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ4)(<='+edtValorX.Text+') ';
         end;
      4: Begin
           EstMenos:=' AND (t3.IES_SLJ4 >= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ4)(>='+edtValorX.Text+') ';
         end;
      5: Begin
           EstMenos:=' AND (t3.IES_SLJ4 <> '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(LJ4)(<>'+edtValorX.Text+') ';
         end;
    end;
    cEstoqueLoja := ',T3.IES_SLJ4 AS ESTOQUE ';
  end
  else if rdbEstoqueIndisponivel.Checked then
  Begin
    case rdgEstoque.ItemIndex of
      0: Begin
           EstMenos:=' AND (t3.IES_INDISPONIVEL < '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Ind.)(<'+edtValorX.Text+') ';
         end;
      1: Begin
           EstMenos:=' AND (t3.IES_INDISPONIVEL = '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Ind.)(='+edtValorX.Text+') ';
         end;
      2: Begin
           EstMenos:=' AND (t3.IES_INDISPONIVEL > '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Ind.)(>'+edtValorX.Text+') ';
         end;
      3: Begin
           EstMenos:=' AND (t3.IES_INDISPONIVEL <= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Ind.)(<='+edtValorX.Text+') ';
         end;
      4: Begin
           EstMenos:=' AND (t3.IES_INDISPONIVEL >= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Ind.)(>='+edtValorX.Text+') ';
         end;
      5: Begin
           EstMenos:=' AND (t3.IES_INDISPONIVEL <> '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Ind.)(<>'+edtValorX.Text+') ';
         end;
    end;
    cEstoqueLoja := ',T3.IES_INDISPONIVEL AS ESTOQUE ';
  end
  else if rdbEstoqueReserva.Checked then
  Begin
    case rdgEstoque.ItemIndex of
      0: Begin
           EstMenos:=' AND (t3.IES_SRESERVADO < '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Res.)(<'+edtValorX.Text+') ';
         end;
      1: Begin
           EstMenos:=' AND (t3.IES_SRESERVADO = '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Res.)(='+edtValorX.Text+') ';
         end;
      2: Begin
           EstMenos:=' AND (t3.IES_SRESERVADO > '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Res.)(>'+edtValorX.Text+') ';
         end;
      3: Begin
           EstMenos:=' AND (t3.IES_SRESERVADO <= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Res.)(<='+edtValorX.Text+') ';
         end;
      4: Begin
           EstMenos:=' AND (t3.IES_SRESERVADO >= '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Res.)(>='+edtValorX.Text+') ';
         end;
      5: Begin
           EstMenos:=' AND (t3.IES_SRESERVADO <> '+VirgPonto(edtValorX.Text)+') ';
           sFiltros := sFiltros + '(Res.)(<>'+edtValorX.Text+') ';
         end;
    end;
    cEstoqueLoja := ',T3.IES_SRESERVADO AS ESTOQUE ';
  end;

  if tag=0 then //Previsão de Vendas
  begin
    Application.CreateForm(Trpt_prev_vendas, rpt_prev_vendas);
    with rpt_prev_vendas do
    Begin
      zlrFiltros.Caption := sFiltros;
      case rdgEstoque.ItemIndex of
        0: zrlDescricao.Caption := zrlDescricao.Caption + ' (Saldo Negativo)';
        1: zrlDescricao.Caption := zrlDescricao.Caption + ' (Saldo Igual a Zero)';
        2: zrlDescricao.Caption := zrlDescricao.Caption + ' (Saldo Positivo)';
        3: zrlDescricao.Caption := zrlDescricao.Caption + ' (Saldo Negativo ou Zerado)';
        4: zrlDescricao.Caption := zrlDescricao.Caption + ' (Saldo Positivo ou Zerado)';
        5: zrlDescricao.Caption := zrlDescricao.Caption + ' (Saldo Diferente de Zero)';
      else
        zrlDescricao.Caption := zrlDescricao.Caption + ' (Independente de Saldo)';
      end;
      try
        DataINI := StrToDate(mskDataINI.Text);
        DataFIM := StrToDate(mskDataFIM.Text);
      except
        ShowMessage('Data inválida!');
        Exit;
      end;
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      zrlDiasPeriodo.Caption := IntToStr(Trunc(StrToDate(mskDataFIM.Text)-StrToDate(mskDataINI.Text))+1);
      iDiasPeriodo := Trunc(StrToDate(mskDataFIM.Text)-StrToDate(mskDataINI.Text))+1;
      if not VerificaInteiroBranco(edtPrevisao.Text) then
        edtPrevisao.Text := IntToStr(iDiasPeriodo);
      if not VerificaFloatBranco(edtPercentualAumento.Text) then
        edtPercentualAumento.Text := '0,00';

      zrlPrevisaoDias.Caption := IntToStr(StrToInt(edtPrevisao.Text));
      iDiasPrevisao := StrToInt(edtPrevisao.Text);
      zrlPercentualAumento.Caption := Format('%.2f',[StrToFloat(edtPercentualAumento.Text)]);

      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
        ' FROM Produto T2 '+
        ' WHERE PRD_CODIGO<>-1 '+
        CdPRD+CdFOR+CdGRP+CdSGP+cSituacao+cDetalhe+cRef+sMarca+sCaracteristica+
        ' ORDER BY PRD_DESCRICAO, PRD_REFERENCIA ';
      Entidade.Open;
      if Entidade.isEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end
  Else if tag=1 then //Embarque
  begin
    Application.CreateForm(Trpt_embarque, rpt_embarque);
    with rpt_embarque do
    Begin
      zrlFiltros.Caption := sFiltros;
      Embarque1.Close;
      Embarque1.SQL.Text := ' SELECT T1.*, T3.* '+
        ' FROM EMBARQUE T1, PRODUTO T2, ITEM_DE_EMBARQUE T3 '+
        ' WHERE T1.EMB_CODIGO<>-1 '+
         cDTINI+cDTFIM+CdPRD+CdFOR+CdGRP+CdSGP+Centro+cSituacao+cDetalhe+cRef+
         sMarca+sCaracteristica+
        ' AND T1.EMB_CODIGO=T3.EMB_CODIGO '+
        ' AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
        ' AND T3.PRD_CODIGO=T2.PRD_CODIGO '+
        ' ORDER BY T1.EMB_CODIGO, T3.IEB_DESTINO ASC ';
      Embarque1.Open;
      if Embarque1.isEmpty then
        Raise Exception.Create('Consulta Vazia!');
      ZRLabel22.Enabled := False;
      ZRLabel23.Enabled := False;
      report.Preview;
      Close;
    end;
  end
  else if tag=3 then // compras X vendas
  begin
    if ckbComprasVendas.Checked then
    begin
      Application.CreateForm(Trpt_Compras_X_VendasLuciano, rpt_Compras_X_VendasLuciano);

      with rpt_Compras_X_VendasLuciano do
      Begin

        if ckbTransferencia.Checked then
          aTransferencia2 := ' AND (C1.TRF_CODIGO='+edtTransferencia.Text+') '
        else
          aTransferencia2 := '';

        if ckbSintetico.Checked then
          zrlDetalhe.Height := 0;
        zlrFiltros.Caption := sFiltros;
        try
          DataINI := StrToDate(mskDataINI.Text);
        except
          DataINI := 0;
        end;
        try
          DataFIM := StrToDate(mskDataFIM.Text);
        except
          DataFIM := StrToDate('01/01/2100');
        end;
                   //Totalizar as Vendas
        aExists := ' AND ( EXISTS (SELECT I1.PRD_CODIGO '+
                   ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PEDIDO_DE_VENDA P1 '+
                   ' WHERE I1.PRD_CODIGO= T2.PRD_CODIGO'+
                   ' AND P1.CNC_CODIGO=T3.CNC_CODIGO'+
                   ' AND P1.PDV_SITUACAO=4 '+
                   ' AND P1.PDV_DATA_HORA>="'+MesDia(DataINI)+'" '+
                   ' AND P1.PDV_DATA_HORA<"'+MesDia(DataFIM+1)+'" '+
                   ' AND I1.PDV_CODIGO=P1.PDV_CODIGO ' +
                   ' AND I1.CNC_CODIGO=P1.CNC_CODIGO) '+

                   {//Totalizar Compras
                   ' OR EXISTS (SELECT I1.PRD_CODIGO '+
                   ' FROM ITEM_DE_PEDIDO_DE_COMPRA I1, PEDIDO_DE_COMPRA C1 '+
                   ' WHERE I1.PRD_CODIGO= T2.PRD_CODIGO'+
                   ' AND C1.CNC_CODIGO=T3.CNC_CODIGO'+
                   ' AND C1.PCP_SITUACAO=2 '+
                   ' AND C1.PCP_DT_ENTREGA>="'+MesDia(DataINI)+'" '+
                   ' AND C1.PCP_DT_ENTREGA<"'+MesDia(DataFIM+1)+'" '+
                   ' AND I1.PCP_CODIGO=C1.PCP_CODIGO ' +
                   ' AND I1.CNC_CODIGO=C1.CNC_CODIGO) '+}

                   //Totalizar TRANSFERENCIAS
                   ' OR EXISTS (SELECT I1.PRD_CODIGO '+
                   ' FROM ITEM_DE_TRANSFERENCIA I1, TRANSFERENCIA C1 '+
                   ' WHERE I1.PRD_CODIGO= T2.PRD_CODIGO'+
                   ' AND C1.TRF_CNC_DESTINO=T3.CNC_CODIGO'+
                   ' AND C1.TRF_SITUACAO=1 '+
                   ' AND C1.TRF_DATA>="'+MesDia(DataINI)+'" '+
                   ' AND C1.TRF_DATA<"'+MesDia(DataFIM+1)+'" '+
                   ' AND I1.TRF_CODIGO=C1.TRF_CODIGO ' +
                   ' AND I1.CNC_CODIGO=C1.CNC_CODIGO) '+

                   //Totalizar as Devoluções Totais
                   ' OR EXISTS (SELECT I1.PRD_CODIGO '+
                   ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PEDIDO_DE_VENDA P1 '+
                   ' WHERE I1.PRD_CODIGO= T2.PRD_CODIGO'+
                   ' AND P1.CNC_CODIGO=T3.CNC_CODIGO'+
                   ' AND P1.PDV_SITUACAO=8 '+
                   ' AND P1.PDV_DT_DEVOLUCAO>="'+MesDia(DataINI)+'" '+
                   ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(DataFIM+1)+'" '+
                   ' AND I1.PDV_CODIGO=P1.PDV_CODIGO ' +
                   ' AND I1.CNC_CODIGO=P1.CNC_CODIGO) '+
                   //Totalizar as Devoluções Parciais
                   ' OR EXISTS (SELECT I1.PRD_CODIGO '+
                   ' FROM ITEM_DE_TROCA I1, TROCA P1 '+
                   ' WHERE I1.PRD_CODIGO= T2.PRD_CODIGO'+
                   ' AND P1.CNC_CODIGO=T3.CNC_CODIGO'+
                   ' AND P1.TRO_SITUACAO=1 '+
                   ' AND P1.TRO_DATA>="'+MesDia(DataINI)+'" '+
                   ' AND P1.TRO_DATA<"'+MesDia(DataFIM+1)+'" '+
                   ' AND I1.TRO_CODIGO=P1.TRO_CODIGO ' +
                   ' AND I1.CNC_CODIGO=P1.CNC_CODIGO )) ';

        Entidade.Close;
        Entidade.SQL.Text:=' SELECT *,T3.CNC_CODIGO AS CNC_LOJA '+cEstoqueLoja+
          ' FROM Produto T2, ITEM_DE_ESTOQUE T3 '+
          ' WHERE T2.PRD_SITUACAO=0 '+
          CdPRD+CdFOR+CdGRP+CdSGP+cSituacao+cDetalhe+cRef+sMarca+sCaracteristica+
          sCentroVendasXCompras+EstMenos+aExists+
          ' AND T2.PRD_CODIGO=T3.PRD_CODIGO '+aTransferencia +
          ' ORDER BY T2.PRD_CODIGO, T3.CNC_CODIGO ';
        Entidade.Open;
        if Entidade.isEmpty then
          Raise Exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end
    else
    begin
      Application.CreateForm(Trpt_Compras_X_Vendas, rpt_Compras_X_Vendas);
      with rpt_Compras_X_Vendas do
      Begin
        if ckbSintetico.Checked then
          zrlDetalhe.Height := 0;
        zlrFiltros.Caption := sFiltros;
        try
          DataINI := StrToDate(mskDataINI.Text);
        except
          DataINI := 0;
        end;
        try
          DataFIM := StrToDate(mskDataFIM.Text);
        except
          DataFIM := StrToDate('01/01/2100');
        end;

        Entidade.Close;
        Entidade.SQL.Text:=' SELECT *,T3.CNC_CODIGO AS CNC_LOJA '+cEstoqueLoja+
          ' FROM Produto T2, ITEM_DE_ESTOQUE T3 '+
          ' WHERE T2.PRD_SITUACAO=0 '+
          CdPRD+CdFOR+CdGRP+CdSGP+cSituacao+cDetalhe+cRef+sMarca+sCaracteristica+
          sCentroVendasXCompras+EstMenos+
          ' AND T2.PRD_CODIGO=T3.PRD_CODIGO '+
          ' ORDER BY T2.PRD_CODIGO, T3.CNC_CODIGO ';
        Entidade.Open;
        if Entidade.isEmpty then
          Raise Exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end;
  end
  else if tag=4 then // Comparativo Anual
  begin
    Application.CreateForm(Trpt_ComparativoAnual, rpt_ComparativoAnual);
    with rpt_ComparativoAnual do
    Begin
      if ckbSintetico.Checked then
      Begin
        zrlDescProduto.Enabled := False;
        zrbRodapeGrupoPRD.Height := 0;
        zrbGrupoCNC.Height := 0;
        zrlLinhaPequena.Enabled := False;
        zrlLinhaDupla.Enabled := False;
      end
      else
        zrlCentroDeCusto2.Enabled := False;

      zlrFiltros.Caption := sFiltros;

      Entidade.Close;
      Entidade.SQL.Text:=
        ' SELECT P1.CNC_CODIGO, T2.PRD_DESCRICAO, T2.PRD_CARACTERISTICA, T2.PRD_CODIGO '+
        ',SUM(T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO) AS QTD '+
        ',SUM(0) AS QTD2 '+
        ' FROM PRODUTO T2 '+
        ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA T1 '+
        ' ON T2.PRD_CODIGO=T1.PRD_CODIGO '+
        ' AND T2.PRD_CODIGO>0 '+
        CdPRD+CdFOR+CdGRP+CdSGP+cSituacao+cDetalhe+cRef+sMarca+sCaracteristica+
        ' INNER JOIN PEDIDO_DE_VENDA P1 '+
        ' ON P1.PDV_SITUACAO=4 '+
        cDtINI+cDtFIM+Centro+
        ' AND P1.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
        ' GROUP BY P1.CNC_CODIGO, T2.PRD_DESCRICAO, T2.PRD_CARACTERISTICA, T2.PRD_CODIGO '+

        ' UNION '+
        ' SELECT P1.CNC_CODIGO, T2.PRD_DESCRICAO, T2.PRD_CARACTERISTICA, T2.PRD_CODIGO '+
        ',SUM(0) AS QTD '+
        ',SUM(T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO) AS QTD2 '+
        ' FROM PRODUTO T2 '+
        ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA T1 '+
        ' ON T2.PRD_CODIGO=T1.PRD_CODIGO '+
        ' AND T2.PRD_CODIGO>0 '+
        CdPRD+CdFOR+CdGRP+CdSGP+cSituacao+cDetalhe+cRef+sMarca+sCaracteristica+
        ' INNER JOIN PEDIDO_DE_VENDA P1 '+
        ' ON P1.PDV_SITUACAO=4 '+
        cDtINI2+cDtFIM2+Centro+
        ' AND P1.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
        ' GROUP BY P1.CNC_CODIGO, T2.PRD_DESCRICAO, T2.PRD_CARACTERISTICA, T2.PRD_CODIGO '+

        ' ORDER BY P1.CNC_CODIGO, T2.PRD_DESCRICAO, T2.PRD_CARACTERISTICA, T2.PRD_CODIGO ';
      Entidade.Open;
      if Entidade.isEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end
  else if tag=5 then // Tabela Promocional
  begin
    Application.CreateForm(Trpt_TabelaPreco, rpt_TabelaPreco);
    with rpt_TabelaPreco do
    Begin
      if ckbSintetico.Checked then
      Begin
        zrbCabecalhoPagina.Height := 0;
        zrbDetalhe.Height := 0;
      end;

      zrlFiltros.Caption := sFiltros;

      Entidade.Close;
      Entidade.SQL.Text:=' SELECT T1.*, T3.* '+
        ',T2.PRD_DESCRICAO,T2.PRD_CARACTERISTICA,PRD_REFERENCIA '+
        ' FROM ITEM_DE_TABELA_DE_PRECO T1 '+
        ' INNER JOIN TABELA_DE_PRECO T3 '+
        ' ON T1.TBP_CODIGO>0 '+
        CdTBP+cDtINI+cDtFIM+
        ' AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
        ' AND T1.TBP_CODIGO=T3.TBP_CODIGO '+
        ' INNER JOIN PRODUTO T2 '+
        ' ON T1.TBP_CODIGO>0 '+
        CdPRD+CdFOR+CdGRP+CdSGP+cSituacao+cDetalhe+cRef+sMarca+sCaracteristica+
        ' AND T1.PRD_CODIGO=T2.PRD_CODIGO '+
        ' ORDER BY T3.CNC_CODIGO, T3.TBP_CODIGO, T2.PRD_DESCRICAO ';
      Entidade.Open;
      if Entidade.isEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSProdutoData.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSProdutoData.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=24;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=24;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxSProdutoData.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=12;
    fMxSCotaFor.ShowModal;
    edtCodigoFORExit(sender);
  end;
end;

procedure TfMxSProdutoData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo1.Close;
  SubGrupo1.Close;
  Centro_de_Custo.Close;
  Action := caFree;  
end;


procedure TfMxSProdutoData.RadioButton5Click(Sender: TObject);
begin
  edtCodigoPRD.Color:=AlteraCorComponentes;
  edtCodigoPRD.Enabled:=False;
  edtCodigoFOR.Color:=AlteraCorComponentes;
  edtCodigoFOR.Enabled:=False;
  Centro_de_Custo.Open;
  dblCodigoGRP.Enabled:=False;
  dblCodigoGRP.Color:=AlteraCorComponentes;
  dblCentroDeCusto.Enabled:=True;
  dblCentroDeCusto.Color:=clWindow;
  dblCentroDeCusto.SetFocus;
end;


procedure TfMxSProdutoData.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  begin
    Centro_de_Custo.Open;
    dblCentroDeCusto.Enabled:=True;
    dblCentroDeCusto.Color:=clWindow;
    dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCentroDeCusto.SetFocus;
  end
  else
  begin
    dblCentroDeCusto.Enabled:=False;
    dblCentroDeCusto.Color:=AlteraCorComponentes;
    dblCentroDeCusto.KeyValue:=-1;
  end;
end;

procedure TfMxSProdutoData.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if not (dblCodigoGRP.KeyValue > 0)then
    Begin
      ShowMessage('Selecione primeiro o grupo!');
      ckbCodigoSGP.Checked:=False;
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
    end;
  end
  else
  Begin
      dblCodigoSGP.Enabled:=False;
      dblCodigoSGP.color:=AlteraCorComponentes;
      dblCodigoSGP.KeyValue:=0;
  end;
end;

procedure TfMxSProdutoData.dblCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if dblCodigoGRP.KeyValue > 0 then
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
    end;
  end;
end;

procedure TfMxSProdutoData.ckbCodigoPRDClick(Sender: TObject);
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

procedure TfMxSProdutoData.ckbCodigoFORClick(Sender: TObject);
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

procedure TfMxSProdutoData.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    Grupo1.Open;
    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    dblCodigoGRP.KeyValue:=Grupo1.CodigoGRP;
    ckbCodigoSGP.Enabled:=True;
    dblCodigoGRP.SetFocus;
  end
  else
  Begin
    Grupo1.Close;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    ckbCodigoSGP.Enabled:=False;
    dblCodigoGRP.KeyValue := 0;
  end;
end;

procedure TfMxSProdutoData.ckbDetalheClick(Sender: TObject);
begin
  if ckbDetalhe.Checked then
  Begin
    cmbDetalhe.Enabled:=True;
    cmbDetalhe.Color:=clWindow;
    if cmbDetalhe.Items.Count <= 1 then
    Begin
      cmbDetalhe.Clear;
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT DISTINCT PRD_DETALHE FROM PRODUTO '+
          ' ORDER BY PRD_DETALHE ';
        Open;
        while not EOF do
        Begin
          cmbDetalhe.Items.Add(FieldByName('PRD_DETALHE').asString);
          Next;
        end;
      end;
    end;
    cmbDetalhe.ItemIndex := 0;
    cmbDetalhe.SetFocus;
  end
  else
  Begin
    cmbDetalhe.Enabled:=False;
    cmbDetalhe.Color:=AlteraCorComponentes;
    cmbDetalhe.ItemIndex := -1;
  end;
end;

procedure TfMxSProdutoData.ckbReferenciaClick(Sender: TObject);
begin
  if ckbReferencia.Checked then
  Begin
    edtReferencia.Color:=clWindow;
    edtReferencia.Enabled:=True;
    edtReferencia.SetFocus;
  end
  else
  Begin
    edtReferencia.Color:=AlteraCorComponentes;
    edtReferencia.Enabled:=False;
    edtReferencia.Clear;
  end;
end;

procedure TfMxSProdutoData.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if self.Tag <> 5 then //Tabela Promocional
    ckbCodigoTBP.Enabled := False;
  if tag = 0 then
    ckbSomenteEstoqueVendas.Checked := True;
  if tag in [1,3,4,5] then
  Begin
    edtPrevisao.Enabled := False;
    edtPercentualAumento.Enabled := False;
    ckbSomenteEstoqueVendas.Enabled := False;
    if self.Tag in [4,5] then
    Begin
      rdbEstoqueFisico.Checked := False;
      GroupBox2.Enabled := False;
    end;
  end;
  if (DM.Configuracao1.Empresa = empLBM) then
  Begin
    ckbCodigoCNC.Checked := False;
    ckbCodigoCNC.Enabled := False;
  end;
  mskDataINI.SetFocus;

  if tag = 3 then
  begin
    ckbComprasVendas.Visible := true;

    Label3.Visible := False;
    edtPrevisao.Visible := False;
    Label4.Visible := False;
    Label7.Visible := False;
    edtPercentualAumento.Visible := False;
    Label6.Visible := False;
  end
  else
  begin
    ckbComprasVendas.Visible := false;

    Label3.Visible := True;
    edtPrevisao.Visible := True;
    Label4.Visible := True;
    Label7.Visible := True;
    edtPercentualAumento.Visible := True;
    Label6.Visible := True;
  end;
end;

procedure TfMxSProdutoData.edtCodigoFORExit(Sender: TObject);
begin
  labFornecedor.Caption := '';
  with Fornecedor1 do
  Begin
    try
      if StrToInt(edtCodigoFOR.Text) <> CodigoFOR then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(edtCodigoFOR.Text);
        Open;
      end;
      if IsEmpty then
        labFornecedor.Caption := '.'
      else
        labFornecedor.Caption := RazaoSocial;
    except
    end;
  end;
end;

procedure TfMxSProdutoData.ckbSomenteEstoqueVendasClick(Sender: TObject);
begin
  if ckbSomenteEstoqueVendas.Checked then
  Begin
    ckbEstoqueFiscal.Checked := False;
    rdgEstoque.ItemIndex:=-1;
  end;
end;

procedure TfMxSProdutoData.ckbEstoqueFiscalClick(Sender: TObject);
begin
  if ckbEstoqueFiscal.Checked then
    ckbSomenteEstoqueVendas.Checked := False;
end;

procedure TfMxSProdutoData.ckbMarcaClick(Sender: TObject);
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

procedure TfMxSProdutoData.ckbCaracteristicaClick(Sender: TObject);
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

procedure TfMxSProdutoData.rdgEstoqueClick(Sender: TObject);
begin
  if rdgEstoque.ItemIndex >= 0 then
  Begin
    ckbSomenteEstoqueVendas.Checked := False;
    if not edtValorX.Enabled then
    Begin
      edtValorX.Enabled := True;
      edtValorX.Text := '0';
    end;
  end;
end;

procedure TfMxSProdutoData.ckbCodigoTBPClick(Sender: TObject);
begin
  if ckbCodigoTBP.Checked then
  Begin
    edtCodigoTBP.Color:=clWindow;
    edtCodigoTBP.Enabled:=True;
    edtCodigoTBP.SetFocus;
  end
  else
  Begin
    edtCodigoTBP.Color:=AlteraCorComponentes;
    edtCodigoTBP.Enabled:=False;
    edtCodigoTBP.Clear;
  end;
end;

procedure TfMxSProdutoData.ckbTransferenciaClick(Sender: TObject);
begin
  if ckbTransferencia.Checked then
  Begin
    edtTransferencia.Color:=clWindow;
    edtTransferencia.Enabled:=True;
    edtTransferencia.SetFocus;
  end
  else
  Begin
    edtTransferencia.Color:=AlteraCorComponentes;
    edtTransferencia.Enabled:=False;
    edtTransferencia.Clear;
  end;
end;

procedure TfMxSProdutoData.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    bitOKClick(sender);
end;

end.
