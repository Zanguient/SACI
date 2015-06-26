unit URelDataProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus, Parametro, Variants,
  SubGrupo, Funcionario;

type
  Trpt_DataProd = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label2: TLabel;
    Panel2: TPanel;
    bitConfirma: TBitBtn;
    bitCancelar: TBitBtn;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Panel3: TPanel;
    edtCodigoPRD: TEdit;
    ckbCodigoPRD: TCheckBox;
    ckbReferencia: TCheckBox;
    edtReferencia: TEdit;
    ckbEstoqueFiscal: TCheckBox;
    ckbEstoqueFisico: TCheckBox;
    ckbEstoqueComercial: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    DSParametro1: TDataSource;
    dblMovimentoComercial: TDBLookupComboBox;
    dblMovimentoFiscal: TDBLookupComboBox;
    Parametro1: TParametro;
    edtCodigoEntrada: TEdit;
    ckbCodigoEntrada: TCheckBox;
    cmbMovimentoFisico: TComboBox;
    ckbLJ3: TCheckBox;
    ckbSintetico: TCheckBox;
    ckbNaoAgruparPRD: TCheckBox;
    ckbDescricaoMov: TCheckBox;
    edtDescricaoMov: TEdit;
    ckbSomenteEntrada: TCheckBox;
    ckbSomenteSaida: TCheckBox;
    ckbSomenteProduto: TCheckBox;
    ckbSomenteServico: TCheckBox;
    DSGrupo: TDataSource;
    Grupo: TQuery;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    ckbCodigoGRP: TCheckBox;
    dblCodigoGRP: TDBLookupComboBox;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoSGP: TCheckBox;
    ckbLJ4: TCheckBox;
    ckbEstoqueAmostra: TCheckBox;
    ckbEstoqueBonificacao: TCheckBox;
    dblMovimentoBonificacao: TDBLookupComboBox;
    dblMovimentoAmostra: TDBLookupComboBox;
    ckbEstoqueBonificacaoFiscal: TCheckBox;
    ckbEstoqueAmostraFiscal: TCheckBox;
    dblCodigoFUN: TDBLookupComboBox;
    ckbCodigoFUN: TCheckBox;
    Funcionario1: TFuncionario;
    DSFuncionario1: TDataSource;
    ckbMarca: TCheckBox;
    edtMarca: TEdit;
    ckbCodigoFOR: TCheckBox;
    edtCodigoFOR: TEdit;
    procedure bitConfirmaClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbEstoqueFisicoClick(Sender: TObject);
    procedure ckbEstoqueComercialClick(Sender: TObject);
    procedure ckbEstoqueFiscalClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure ckbCodigoEntradaClick(Sender: TObject);
    procedure ckbDescricaoMovClick(Sender: TObject);
    procedure ckbSomenteEntradaClick(Sender: TObject);
    procedure ckbSomenteSaidaClick(Sender: TObject);
    procedure ckbSomenteProdutoClick(Sender: TObject);
    procedure ckbSomenteServicoClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure ckbLJ3Click(Sender: TObject);
    procedure ckbLJ4Click(Sender: TObject);
    procedure ckbEstoqueBonificacaoClick(Sender: TObject);
    procedure ckbEstoqueAmostraClick(Sender: TObject);
    procedure ckbCodigoFUNClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbMarcaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_DataProd: Trpt_DataProd;

implementation

uses UDM, UPrinc2, uMovEstoque, MxSPediProd, uMovEstoqueFisico,
  uMovEstoqueComercial, uMovEstoqueSN, MxSPediProdMotCal, uMovEstoqueLJ4,
  uMovEstoqueBonificacao, uMovEstoqueAmostra, uMovBonificacaoFiscal,
  uMovAmostraFiscal;

{$R *.DFM}


procedure Trpt_DataProd.bitConfirmaClick(Sender: TObject);
var
  mensagem,cPRD,CdEntrada, cRef,cDtINI,cDtFIM,Tipo,sFiltros, Centro, sDescMov,
    sSomenteEntrada,sSomenteProduto,sOrdem,cGRP,cSGP,sFUN :String;
begin
  mensagem:='';
  cDtINI:='';
  cDtFIM:='';
  cPRD:='';
  cGRP:='';
  cSGP:='';
  CdEntrada:='';
  cRef:='';
  Centro:='';
  Tipo:='';
  sDescMov := '';
  sSomenteEntrada := '';
  sSomenteProduto := '';
  sFUN := '';
  sFiltros:='';
  sOrdem:='';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if (not ckbEstoqueFisico.Checked) and (not ckbEstoqueComercial.Checked) and
     (not ckbEstoqueFiscal.Checked) and (not ckbEstoqueBonificacao.Checked) and
     (not ckbEstoqueAmostra.Checked) then
    mensagem:=mensagem+'Selecione Estoque Físico ou Comercial ou Fiscal!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text)then
  Begin
    sFiltros := sFiltros + ' (DtINI:'+mskDataINI.Text+')';
    if ckbEstoqueFisico.Checked then //Físico
      cDtINI:=' AND (T2.MEF_DATA>="'+MesDia(mskDataINI.Text)+'") '
    else if ckbEstoqueComercial.Checked or
            (ckbEstoqueBonificacao.Checked and (not ckbEstoqueBonificacaoFiscal.Checked)) or
            (ckbEstoqueAmostra.Checked and (not ckbEstoqueAmostraFiscal.Checked)) then
      if ckbLJ3.Checked then
        cDtINI:=' AND (T2.MSN_DATA_HORA>="'+MesDia(mskDataINI.Text)+'") '
      else if ckbLJ4.Checked then
        cDtINI:=' AND (T2.ML4_DATA_HORA>="'+MesDia(mskDataINI.Text)+'") '
      else
        cDtINI:=' AND (T2.MEC_DATA_HORA>="'+MesDia(mskDataINI.Text)+'") '
    else if ckbEstoqueFiscal.Checked or //Fiscal
            (ckbEstoqueBonificacao.Checked and ckbEstoqueBonificacaoFiscal.Checked) or
            (ckbEstoqueAmostra.Checked and ckbEstoqueAmostraFiscal.Checked) then
      cDtINI:=' AND (T2.MES_DATA_HORA>="'+MesDia(mskDataINI.Text)+'") ';
  end;

  if VerificaDataBranco(mskDataFIM.Text)then
  Begin
    sFiltros := sFiltros + ' (DtFIM:'+mskDataFIM.Text+')';
    if ckbEstoqueFisico.Checked then //Físico
      cDtFIM:=' AND (T2.MEF_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
    else if ckbEstoqueComercial.Checked or //Comercial
            (ckbEstoqueBonificacao.Checked and (not ckbEstoqueBonificacaoFiscal.Checked)) or
            (ckbEstoqueAmostra.Checked and (not ckbEstoqueAmostraFiscal.Checked)) then
      if ckbLJ3.Checked then
        cDtFIM:=' AND (T2.MSN_DATA_HORA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
      else if ckbLJ4.Checked then
        cDtFIM:=' AND (T2.ML4_DATA_HORA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
      else
        cDtFIM:=' AND (T2.MEC_DATA_HORA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
    else if ckbEstoqueFiscal.Checked or //Fiscal
            (ckbEstoqueBonificacao.Checked and ckbEstoqueBonificacaoFiscal.Checked) or
            (ckbEstoqueAmostra.Checked and ckbEstoqueAmostraFiscal.Checked) then    
      cDtFIM:=' AND (T2.MES_DATA_HORA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
  end;

  if ckbCodigoPRD.Checked then
  Begin
    if VerificaIntervaloInteiroBranco(edtCodigoPRD.Text) then
      cPRD := DesmontaIntervalo(edtCodigoPRD.Text,' AND (','T1.PRD_CODIGO',')')
    else if not VerificaInteiroBranco(edtCodigoPRD.text) then
      Raise Exception.Create('Código do produto inválido!')
    else
      cPRD := ' AND (T2.PRD_CODIGO='+edtCodigoPRD.Text+') ';
    sFiltros := sFiltros + ' (PRD:'+edtCodigoPRD.Text+')';
  end;

  if ckbCodigoGRP.Checked then
    if dblCodigoGRP.Text = '' then
      Raise Exception.Create('Grupo inválido!')
    else
    Begin
      cGRP := ' AND (T1.GRP_CODIGO ='+IntToStr(dblCodigoGRP.KeyValue)+') ';
      sFiltros := sFiltros + '(GRP='+dblCodigoGRP.Text+') ';
    end;

  if ckbCodigoSGP.Checked then
    if dblCodigoSGP.Text = '' then
      Raise Exception.Create('SubGrupo inválido!')
    else
    Begin
      cSGP := ' AND (T1.SGP_CODIGO ='+IntToStr(dblCodigoSGP.KeyValue)+') ';
      sFiltros := sFiltros + '(SGP='+dblCodigoSGP.Text+') ';
    end;

  if ckbCodigoEntrada.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoEntrada.text) then
      Raise Exception.Create('Código de Entrada inválido!')
    else if ckbEstoqueComercial.Checked or
            (ckbEstoqueBonificacao.Checked and (not ckbEstoqueBonificacaoFiscal.Checked)) or
            (ckbEstoqueAmostra.Checked and (not ckbEstoqueAmostraFiscal.Checked)) then    
      if ckbLJ3.Checked then
        CdEntrada:=' AND (T2.MSN_ENT_CODIGO='+edtCodigoEntrada.Text+') '
      else if ckbLJ4.Checked then
        CdEntrada:=' AND (T2.ML4_ENT_CODIGO='+edtCodigoEntrada.Text+') '
      else
        CdEntrada:=' AND (T2.MEC_ENT_CODIGO='+edtCodigoEntrada.Text+') '
    else if ckbEstoqueFiscal.Checked then
      CdEntrada:=' AND (T2.MES_ENT_CODIGO='+edtCodigoEntrada.Text+') '
    else
      CdEntrada:=' AND (T2.MEF_ENT_CODIGO='+edtCodigoEntrada.Text+') ';
    sFiltros := sFiltros + ' (Cod.Ent.:'+edtCodigoEntrada.Text+')';
  end;

  if ckbDescricaoMov.Checked then
  Begin
    if ckbEstoqueComercial.Checked or
       (ckbEstoqueBonificacao.Checked and (not ckbEstoqueBonificacaoFiscal.Checked)) or
       (ckbEstoqueAmostra.Checked and (not ckbEstoqueAmostraFiscal.Checked)) then
      if ckbLJ3.Checked then
        sDescMov :=' AND (T2.MSN_OBSERVACAO LIKE "%'+edtDescricaoMov.Text+'%") '
      else if ckbLJ4.Checked then
        sDescMov :=' AND (T2.ML4_OBSERVACAO LIKE "%'+edtDescricaoMov.Text+'%") '
      else
        sDescMov :=' AND (T2.MEC_OBSERVACAO LIKE "%'+edtDescricaoMov.Text+'%") '
    else if ckbEstoqueFiscal.Checked then
      sDescMov :=' AND (T2.MES_OBSERVACAO LIKE "%'+edtDescricaoMov.Text+'%") '
    else
      sDescMov :=' AND (T2.MEF_OBSERVACAO LIKE "%'+edtDescricaoMov.Text+'%") ';
    sFiltros := sFiltros + ' (Desc.Mov.:'+edtDescricaoMov.Text+')';
  end;

  if ckbReferencia.Checked then
  Begin
    cRef:=' AND (T1.PRD_REFERENCIA="'+edtReferencia.Text+'") ';
    sFiltros := sFiltros + ' (Ref.:'+edtReferencia.Text+')';
  end;

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      Centro:=' AND (T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  if ckbCodigoFUN.Checked then
    if dblCodigoFUN.Text = '' then
      Raise Exception.Create('Funcionário(a) inválido(a)!')
    else
    Begin
      sFUN := ' AND (T2.FUN_CODIGO='+IntToStr(dblCodigoFUN.KeyValue)+') ';
      sFiltros := sFiltros + ' (FUN:'+IntToStr(dblCodigoFUN.KeyValue)+')';
    end;

  if ckbSomenteEntrada.Checked then
    sFiltros := sFiltros + '(Entrada)'
  else if ckbSomenteSaida.Checked then
    sFiltros := sFiltros + '(Saida)';

  if ckbSomenteProduto.Checked then
    sSomenteProduto := ' AND (T1.PRD_SERVICO=0 OR T1.PRD_SERVICO IS NULL) '
  else if ckbSomenteServico.Checked then
    sSomenteProduto := ' AND T1.PRD_SERVICO=1 ';

  If ckbEstoqueFisico.Checked then
  begin
{
Venda
Compra
Devolução
Empréstimo/Demostração
Avulso
Inventário
}
    case cmbMovimentoFisico.ItemIndex of
      0: Tipo:=' AND (T2.MEF_TIPO_MOV in (361)) ';
      1: Tipo:=' AND (T2.MEF_TIPO_MOV in (360)) ';
      2: Tipo:=' AND (T2.MEF_TIPO_MOV in (362)) ';
      3: Tipo:=' AND (T2.MEF_TIPO_MOV in (520,530)) ';
      4: Tipo:=' AND (T2.MEF_TIPO_MOV in (380,385)) ';
      5: Tipo:=' AND (T2.MEF_TIPO_MOV in (1010)) '; //Inventário
      6: Tipo:=' AND (T2.MEF_TIPO_MOV in (365)) ';
    end;
    if cmbMovimentoFisico.ItemIndex >= 0 then
      sFiltros := sFiltros + ' (Tipo:'+cmbMovimentoFisico.Items[cmbMovimentoFisico.ItemIndex]+')';

    if ckbSomenteEntrada.Checked then
      sSomenteEntrada := ' AND T2.MEF_ES="E" '
    else if ckbSomenteSaida.Checked then
      sSomenteEntrada := ' AND T2.MEF_ES="S" ';

    Application.CreateForm(Trpt_MovEstoqueFisico, rpt_MovEstoqueFisico);
    with rpt_MovEstoqueFisico do
    Begin
      if ckbSintetico.Checked then
        zrbDetalhe.Height := 1;
      if ckbNaoAgruparPRD.Checked then
      Begin
        ZRGroup1.Expression := '';
        ZRGroup1.Height := 0;
        SZRBand1.Height := 0; //Rodapé do Grupo
//        ZRBand1.Height  := 4;
        zrlCodigo.Caption := 'Produto';
        ZRDBText1.DataField := 'PRD_CODIGO';
        sOrdem := ' T2.CNC_CODIGO,T2.MEF_DATA,T2.MEF_CODIGO ASC ';
      end
      else
        sOrdem := ' T2.PRD_CODIGO,T2.CNC_CODIGO,T2.MEF_DATA,T2.MEF_CODIGO ASC ';
      zrlFiltros.Caption := sFiltros;
      Produto1.Close;
      Produto1.SQL.Text:='SELECT T2.*,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA '+
         ',T1.PRD_UNIDADE,T1.PRD_MARCA,T1.PRD_REFERENCIA,T1.PRD_DETALHE '+
         ' FROM PRODUTO T1,MOVIMENTO_DE_ESTOQUE_FISICO T2 '+
         ' WHERE (T1.PRD_CODIGO = T2.PRD_CODIGO) '+
         cDtINI+cDtFIM+cPRD+cGRP+cSGP+CdEntrada+cRef+Centro+sFUN+Tipo+sDescMov+sSomenteEntrada+sSomenteProduto+
         ' ORDER BY '+sOrdem;
      Produto1.Open;
      if Produto1.IsEmpty then
        Raise exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end
  Else If ckbEstoqueComercial.Checked then
  begin
    if ckbLJ3.Checked then
    Begin
      if dblMovimentoComercial.Text <> '' then
      Begin
        Tipo:=' AND (T2.MSN_TIPO_MOV='+IntToStr(dblMovimentoComercial.KeyValue)+') ';
        sFiltros := sFiltros + ' (Tipo:'+dblMovimentoComercial.Text+')';
      end;
      Application.CreateForm(Trpt_MovEstoqueSN, rpt_MovEstoqueSN);
      with rpt_MovEstoqueSN do
      Begin
        if ckbSintetico.Checked then
          zrbDetalhe.Height := 1;
        if ckbNaoAgruparPRD.Checked then
        Begin
          ZRGroup1.Expression := '';
          ZRGroup1.Height := 0;
          SZRBand1.Height := 0; //Rodapé do Grupo
//          ZRBand1.Height  := 4;
          zrlCodigo.Caption := 'Produto';
          ZRDBText1.DataField := 'PRD_CODIGO';
          sOrdem := ' T2.CNC_CODIGO,T2.MSN_DATA_HORA,T2.MSN_CODIGO ASC ';
        end
        else
          sOrdem := ' T2.PRD_CODIGO,T2.CNC_CODIGO,T2.MSN_DATA_HORA,T2.MSN_CODIGO ASC ';
        zrlFiltros.Caption := sFiltros;

        if ckbSomenteEntrada.Checked then
          sSomenteEntrada := ' AND T2.MSN_ES="E" '
        else if ckbSomenteSaida.Checked then
          sSomenteEntrada := ' AND T2.MSN_ES="S" ';

        Produto1.Close;
        Produto1.SQL.Text:='SELECT T2.*,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA '+
          ',T1.PRD_UNIDADE,T1.PRD_MARCA,T1.PRD_REFERENCIA,T1.PRD_DETALHE '+
          ' FROM Produto T1,Movimento_de_Estoque_SN T2 '+
          ' WHERE (T1.PRD_CODIGO = T2.PRD_CODIGO) '+
          cDtINI+cDtFIM+cPRD+cGRP+cSGP+CdEntrada+cRef+Centro+sFUN+Tipo+sDescMov+sSomenteEntrada+sSomenteProduto+
          ' ORDER BY '+sOrdem;
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end
    else if ckbLJ4.Checked then
    Begin
      if (dblMovimentoComercial.Text <> '') then
      Begin
        Tipo:=' AND (T2.ML4_TIPO_MOV='+IntToStr(dblMovimentoComercial.KeyValue)+') ';
        sFiltros := sFiltros + ' (Tipo:'+dblMovimentoComercial.Text+')';
      end;
      Application.CreateForm(Trpt_MovEstoqueLJ4, rpt_MovEstoqueLJ4);
      with rpt_MovEstoqueLJ4 do
      Begin
        if ckbSintetico.Checked then
          zrbDetalhe.Height := 1;
        if ckbNaoAgruparPRD.Checked then
        Begin
          ZRGroup1.Expression := '';
          ZRGroup1.Height := 0;
          SZRBand1.Height := 0; //Rodapé do Grupo
//          ZRBand1.Height  := 4;
          zrlCodigo.Caption := 'Produto';
          ZRDBText1.DataField := 'PRD_CODIGO';
          sOrdem := ' T2.CNC_CODIGO,T2.ML4_DATA_HORA,T2.ML4_CODIGO ASC ';
        end
        else
          sOrdem := ' T2.PRD_CODIGO,T2.CNC_CODIGO,T2.ML4_DATA_HORA,T2.ML4_CODIGO ASC ';
        zrlFiltros.Caption := sFiltros;

        if ckbSomenteEntrada.Checked then
          sSomenteEntrada := ' AND T2.ML4_ES="E" '
        else if ckbSomenteSaida.Checked then
          sSomenteEntrada := ' AND T2.ML4_ES="S" ';

        Produto1.Close;
        Produto1.SQL.Text:='SELECT T2.*,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA '+
          ',T1.PRD_UNIDADE,T1.PRD_MARCA,T1.PRD_REFERENCIA,T1.PRD_DETALHE '+
          ' FROM Produto T1,Movimento_de_Estoque_LJ4 T2 '+
          ' WHERE (T1.PRD_CODIGO = T2.PRD_CODIGO) '+
          cDtINI+cDtFIM+cPRD+cGRP+cSGP+CdEntrada+cRef+Centro+sFUN+Tipo+sDescMov+sSomenteEntrada+sSomenteProduto+
          ' ORDER BY '+sOrdem;
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end
    else //Não SN ou LJ4
    Begin
      if dblMovimentoComercial.Text <> '' then
      Begin
        Tipo:=' AND (T2.MEC_TIPO_MOV='+IntToStr(dblMovimentoComercial.KeyValue)+') ';
        sFiltros := sFiltros + ' (Tipo:'+dblMovimentoComercial.Text+')';
      end;
      Application.CreateForm(Trpt_MovEstoqueComercial, rpt_MovEstoqueComercial);
      with rpt_MovEstoqueComercial do
      Begin
        if ckbSintetico.Checked then
          zrbDetalhe.Height := 1;
        if ckbNaoAgruparPRD.Checked then
        Begin
          ZRGroup1.Expression := '';
          ZRGroup1.Height := 0;
          SZRBand1.Height := 0; //Rodapé do Grupo
//          ZRBand1.Height  := 4;
          zrlCodigo.Caption := 'Produto';
          ZRDBText1.DataField := 'PRD_CODIGO';
          sOrdem := ' T2.CNC_CODIGO,T2.MEC_DATA_HORA,T2.MEC_CODIGO ASC ';
        end
        else
          sOrdem := ' T2.PRD_CODIGO,T2.CNC_CODIGO,T2.MEC_DATA_HORA,T2.MEC_CODIGO ASC ';
        zrlFiltros.Caption := sFiltros;

        if ckbSomenteEntrada.Checked then
          sSomenteEntrada := ' AND T2.MEC_ES="E" '
        else if ckbSomenteSaida.Checked then
          sSomenteEntrada := ' AND T2.MEC_ES="S" ';

        Produto1.Close;
        Produto1.SQL.Text:='SELECT T2.*,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA '+
           ',T1.PRD_UNIDADE,T1.PRD_MARCA,T1.PRD_REFERENCIA,T1.PRD_DETALHE '+
           ' FROM Produto T1,Movimento_de_Estoque_Comercial T2 '+
           ' WHERE (T1.PRD_CODIGO = T2.PRD_CODIGO) '+
           cDtINI+cDtFIM+cPRD+cGRP+cSGP+CdEntrada+cRef+Centro+sFUN+Tipo+sDescMov+sSomenteEntrada+sSomenteProduto+
           ' ORDER BY '+sOrdem;
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end;
  end
  Else If ckbEstoqueFiscal.Checked then
  begin
    if dblMovimentoFiscal.Text <> '' then
    Begin
      Tipo:=' AND (T2.MES_TIPO_MOV='+IntToStr(dblMovimentoFiscal.KeyValue)+') ';
      sFiltros := sFiltros + ' (Tipo:'+dblMovimentoFiscal.Text+')';
    end;
    Application.CreateForm(Trpt_MovEstoque, rpt_MovEstoque);
    with rpt_MovEstoque do
    Begin
      if ckbSintetico.Checked then
        zrbDetalhe.Height := 1;
      if ckbNaoAgruparPRD.Checked then
      Begin
        ZRGroup1.Expression := '';
        ZRGroup1.Height := 0;
        SZRBand1.Height := 0; //Rodapé do Grupo
//        ZRBand1.Height  := 4;
        zrlCodigo.Caption := 'Produto';
        ZRDBText1.DataField := 'PRD_CODIGO';
        sOrdem := ' T2.CNC_CODIGO,T2.MES_DATA_HORA,T2.MES_CODIGO ASC ';
      end
      else
        sOrdem := ' T2.PRD_CODIGO,T2.CNC_CODIGO,T2.MES_DATA_HORA,T2.MES_CODIGO ASC ';
      zrlFiltros.Caption := sFiltros;

      if ckbSomenteEntrada.Checked then
        sSomenteEntrada := ' AND T2.MES_ES="E" '
      else if ckbSomenteSaida.Checked then
        sSomenteEntrada := ' AND T2.MES_ES="S" ';

      Produto1.Close;
      Produto1.SQL.Text:='SELECT T2.*,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA '+
         ',T1.PRD_UNIDADE,T1.PRD_MARCA,T1.PRD_REFERENCIA,T1.PRD_DETALHE '+
         ' FROM Produto T1,Movimento_de_Estoque_Fiscal T2 '+
         ' WHERE (T1.PRD_CODIGO = T2.PRD_CODIGO) '+
         cDtINI+cDtFIM+cPRD+cGRP+cSGP+CdEntrada+cRef+Centro+sFUN+Tipo+sDescMov+sSomenteEntrada+sSomenteProduto+
         ' ORDER BY '+sOrdem;
      Produto1.Open;
      if Produto1.IsEmpty then
        Raise exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end
  else if ckbEstoqueBonificacao.Checked then
  Begin
    if ckbEstoqueBonificacaoFiscal.Checked then
    Begin
      if dblMovimentoFiscal.Text <> '' then
      Begin
        Tipo:=' AND (T2.MES_TIPO_MOV='+IntToStr(dblMovimentoFiscal.KeyValue)+') ';
        sFiltros := sFiltros + ' (Tipo:'+dblMovimentoFiscal.Text+')';
      end;
      Application.CreateForm(Trpt_MovEstoqueBonificacaoFiscal, rpt_MovEstoqueBonificacaoFiscal);
      with rpt_MovEstoqueBonificacaoFiscal do
      Begin
        if ckbSintetico.Checked then
          zrbDetalhe.Height := 1;
        if ckbNaoAgruparPRD.Checked then
        Begin
          ZRGroup1.Expression := '';
          ZRGroup1.Height := 0;
          SZRBand1.Height := 0; //Rodapé do Grupo
  //        ZRBand1.Height  := 4;
          zrlCodigo.Caption := 'Produto';
          ZRDBText1.DataField := 'PRD_CODIGO';
          sOrdem := ' T2.CNC_CODIGO,T2.MES_DATA_HORA,T2.MES_CODIGO ASC ';
        end
        else
          sOrdem := ' T2.PRD_CODIGO,T2.CNC_CODIGO,T2.MES_DATA_HORA,T2.MES_CODIGO ASC ';
        zrlFiltros.Caption := sFiltros;

        if ckbSomenteEntrada.Checked then
          sSomenteEntrada := ' AND T2.MES_ES="E" '
        else if ckbSomenteSaida.Checked then
          sSomenteEntrada := ' AND T2.MES_ES="S" ';

        Produto1.Close;
        Produto1.SQL.Text:='SELECT T2.*,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA '+
           ',T1.PRD_UNIDADE,T1.PRD_MARCA,T1.PRD_REFERENCIA,T1.PRD_DETALHE '+
           ' FROM Produto T1,Movimento_de_Estoque_Fiscal T2 '+
           ' WHERE T2.MES_BONIFICACAO>0 '+
           cDtINI+cDtFIM+cPRD+cGRP+cSGP+CdEntrada+cRef+Centro+sFUN+Tipo+sDescMov+sSomenteEntrada+sSomenteProduto+
           ' AND (T1.PRD_CODIGO=T2.PRD_CODIGO) '+
           ' ORDER BY '+sOrdem;
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end
    else
    Begin
      if dblMovimentoComercial.Text <> '' then
      Begin
        Tipo:=' AND (T2.MEC_TIPO_MOV='+IntToStr(dblMovimentoComercial.KeyValue)+') ';
        sFiltros := sFiltros + ' (Tipo:'+dblMovimentoComercial.Text+')';
      end;
      Application.CreateForm(Trpt_MovEstoqueBonificacao, rpt_MovEstoqueBonificacao);
      with rpt_MovEstoqueBonificacao do
      Begin
        if ckbSintetico.Checked then
          zrbDetalhe.Height := 1;
        if ckbNaoAgruparPRD.Checked then
        Begin
          ZRGroup1.Expression := '';
          ZRGroup1.Height := 0;
          SZRBand1.Height := 0; //Rodapé do Grupo
//          ZRBand1.Height  := 4;
          zrlCodigo.Caption := 'Produto';
          ZRDBText1.DataField := 'PRD_CODIGO';
          sOrdem := ' T2.CNC_CODIGO,T2.MEC_DATA_HORA,T2.MEC_CODIGO ASC ';
        end
        else
          sOrdem := ' T2.PRD_CODIGO,T2.CNC_CODIGO,T2.MEC_DATA_HORA,T2.MEC_CODIGO ASC ';
        zrlFiltros.Caption := sFiltros;

        if ckbSomenteEntrada.Checked then
          sSomenteEntrada := ' AND T2.MEC_ES="E" '
        else if ckbSomenteSaida.Checked then
          sSomenteEntrada := ' AND T2.MEC_ES="S" ';

        Produto1.Close;
        Produto1.SQL.Text:='SELECT T2.*,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA '+
           ',T1.PRD_UNIDADE,T1.PRD_MARCA,T1.PRD_REFERENCIA,T1.PRD_DETALHE '+
           ' FROM Produto T1,Movimento_de_Estoque_Comercial T2 '+
           ' WHERE T2.MEC_BONIFICACAO>0 '+
           cDtINI+cDtFIM+cPRD+cGRP+cSGP+CdEntrada+cRef+Centro+sFUN+Tipo+sDescMov+sSomenteEntrada+sSomenteProduto+
           ' AND T1.PRD_CODIGO=T2.PRD_CODIGO '+
           ' ORDER BY '+sOrdem;
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end;
  end
  else if ckbEstoqueAmostra.Checked then
  Begin
    if ckbEstoqueAmostraFiscal.Checked then
    Begin
      if dblMovimentoFiscal.Text <> '' then
      Begin
        Tipo:=' AND (T2.MES_TIPO_MOV='+IntToStr(dblMovimentoFiscal.KeyValue)+') ';
        sFiltros := sFiltros + ' (Tipo:'+dblMovimentoFiscal.Text+')';
      end;
      Application.CreateForm(Trpt_MovEstoqueAmostraFiscal, rpt_MovEstoqueAmostraFiscal);
      with rpt_MovEstoqueAmostraFiscal do
      Begin
        if ckbSintetico.Checked then
          zrbDetalhe.Height := 1;
        if ckbNaoAgruparPRD.Checked then
        Begin
          ZRGroup1.Expression := '';
          ZRGroup1.Height := 0;
          SZRBand1.Height := 0; //Rodapé do Grupo
  //        ZRBand1.Height  := 4;
          zrlCodigo.Caption := 'Produto';
          ZRDBText1.DataField := 'PRD_CODIGO';
          sOrdem := ' T2.CNC_CODIGO,T2.MES_DATA_HORA,T2.MES_CODIGO ASC ';
        end
        else
          sOrdem := ' T2.PRD_CODIGO,T2.CNC_CODIGO,T2.MES_DATA_HORA,T2.MES_CODIGO ASC ';
        zrlFiltros.Caption := sFiltros;

        if ckbSomenteEntrada.Checked then
          sSomenteEntrada := ' AND T2.MES_ES="E" '
        else if ckbSomenteSaida.Checked then
          sSomenteEntrada := ' AND T2.MES_ES="S" ';

        Produto1.Close;
        Produto1.SQL.Text:='SELECT T2.*,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA '+
           ',T1.PRD_UNIDADE,T1.PRD_MARCA,T1.PRD_REFERENCIA,T1.PRD_DETALHE '+
           ' FROM Produto T1,Movimento_de_Estoque_Fiscal T2 '+
           ' WHERE T2.MES_AMOSTRA>0 '+
           cDtINI+cDtFIM+cPRD+cGRP+cSGP+CdEntrada+cRef+Centro+sFUN+Tipo+sDescMov+sSomenteEntrada+sSomenteProduto+
           ' AND T1.PRD_CODIGO=T2.PRD_CODIGO '+
           ' ORDER BY '+sOrdem;
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end
    else
    Begin
      if dblMovimentoComercial.Text <> '' then
      Begin
        Tipo:=' AND (T2.MEC_TIPO_MOV='+IntToStr(dblMovimentoComercial.KeyValue)+') ';
        sFiltros := sFiltros + ' (Tipo:'+dblMovimentoComercial.Text+')';
      end;
      Application.CreateForm(Trpt_MovEstoqueAmostra, rpt_MovEstoqueAmostra);
      with rpt_MovEstoqueAmostra do
      Begin
        if ckbSintetico.Checked then
          zrbDetalhe.Height := 1;
        if ckbNaoAgruparPRD.Checked then
        Begin
          ZRGroup1.Expression := '';
          ZRGroup1.Height := 0;
          SZRBand1.Height := 0; //Rodapé do Grupo
//          ZRBand1.Height  := 4;
          zrlCodigo.Caption := 'Produto';
          ZRDBText1.DataField := 'PRD_CODIGO';
          sOrdem := ' T2.CNC_CODIGO,T2.MEC_DATA_HORA,T2.MEC_CODIGO ASC ';
        end
        else
          sOrdem := ' T2.PRD_CODIGO,T2.CNC_CODIGO,T2.MEC_DATA_HORA,T2.MEC_CODIGO ASC ';
        zrlFiltros.Caption := sFiltros;

        if ckbSomenteEntrada.Checked then
          sSomenteEntrada := ' AND T2.MEC_ES="E" '
        else if ckbSomenteSaida.Checked then
          sSomenteEntrada := ' AND T2.MEC_ES="S" ';

        Produto1.Close;
        Produto1.SQL.Text:='SELECT T2.*,T1.PRD_DESCRICAO,T1.PRD_CARACTERISTICA '+
           ',T1.PRD_UNIDADE,T1.PRD_MARCA,T1.PRD_REFERENCIA,T1.PRD_DETALHE '+
           ' FROM Produto T1,Movimento_de_Estoque_Comercial T2 '+
           ' WHERE T2.MEC_AMOSTRA>0 '+
           cDtINI+cDtFIM+cPRD+cGRP+cSGP+CdEntrada+cRef+Centro+sFUN+Tipo+sDescMov+sSomenteEntrada+sSomenteProduto+
           ' AND T1.PRD_CODIGO=T2.PRD_CODIGO '+
           ' ORDER BY '+sOrdem;
        Produto1.Open;
        if Produto1.IsEmpty then
          Raise exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end;
  end;
end;

procedure Trpt_DataProd.bitCancelarClick(Sender: TObject);
begin
 Close;
end;

procedure Trpt_DataProd.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  ckbEstoqueFisico.Checked := True;
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    ckbLJ3.Visible := False;
    ckbLJ4.Visible := False;
    ckbCodigoCNC.Checked := True;
  end;
  ckbSintetico.Checked := True;

  if (DM.Usuario1.Permissoes.IndexOf(IntToStr(8230)) < 0) then
  Begin
    ckbCodigoPRD.Enabled := False;
    ckbCodigoPRD.Checked := True;
  end;

  if not (DM.Configuracao1.Empresa in TEmpresasEstFUN) then
    ckbCodigoFUN.Enabled := False;

  mskDataINI.SetFocus;  
end;

procedure Trpt_DataProd.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=18;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=18;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure Trpt_DataProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure Trpt_DataProd.ckbEstoqueFisicoClick(Sender: TObject);
begin
  if ckbEstoqueFisico.Checked then
  Begin
    cmbMovimentoFisico.Enabled:=True;
    cmbMovimentoFisico.Color:=clWindow;
    cmbMovimentoFisico.SetFocus;
    ckbEstoqueComercial.Checked := False;
    ckbEstoqueFiscal.Checked := False;
    ckbEstoqueBonificacao.Checked := False;
    ckbEstoqueAmostra.Checked := False;
  end
  else
  Begin
    cmbMovimentoFisico.Enabled:=False;
    cmbMovimentoFisico.Color:=AlteraCorComponentes;
    cmbMovimentoFisico.ItemIndex:=-1;
  end;
end;

procedure Trpt_DataProd.ckbEstoqueComercialClick(Sender: TObject);
begin
  if ckbEstoqueComercial.Checked then
  Begin
    Parametro1.Close;
    Parametro1.SQL.Text:='SELECT * FROM PARAMETRO '+
      'WHERE TPR_CODIGO = 14 '+  //Não tem tipo definido São todos os movimentos de estoque
      'ORDER BY PAR_DESCRICAO';
    Parametro1.Open;
    dblMovimentoComercial.Enabled:=True;
    dblMovimentoComercial.Color:=clWindow;
    dblMovimentoComercial.SetFocus;
    ckbEstoqueFisico.Checked := False;
    ckbEstoqueFiscal.Checked := False;
    ckbLJ3.Enabled := True;
    ckbLJ4.Enabled := True;
    ckbEstoqueBonificacao.Checked := False;
    ckbEstoqueAmostra.Checked := False;    
  end
  else
  Begin
    dblMovimentoComercial.Enabled:=False;
    dblMovimentoComercial.Color:=AlteraCorComponentes;
    dblMovimentoComercial.KeyValue:=0;
    ckbLJ3.Checked := False;
    ckbLJ3.Enabled := False;
    ckbLJ4.Checked := False;
    ckbLJ4.Enabled := False;
  end;
end;

procedure Trpt_DataProd.ckbEstoqueFiscalClick(Sender: TObject);
begin
  if ckbEstoqueFiscal.Checked then
  Begin
    Parametro1.Close;
    Parametro1.SQL.Text:='SELECT * FROM PARAMETRO '+
      'WHERE TPR_CODIGO=14 '+ //Não tem tipo definido São todos os movimentos de estoque
      'ORDER BY PAR_DESCRICAO';
    Parametro1.Open;
    dblMovimentoFiscal.Enabled:=True;
    dblMovimentoFiscal.Color:=clWindow;
    dblMovimentoFiscal.SetFocus;
    ckbEstoqueFisico.Checked := False;
    ckbEstoqueComercial.Checked := False;
    ckbEstoqueBonificacao.Checked := False;
    ckbEstoqueAmostra.Checked := False;    
  end
  else
  Begin
    dblMovimentoFiscal.Enabled:=False;
    dblMovimentoFiscal.Color:=AlteraCorComponentes;
    dblMovimentoFiscal.KeyValue:=0;
  end;
end;

procedure Trpt_DataProd.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.KeyValue:=CentroCusto1.CentroDeCusto;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure Trpt_DataProd.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Enabled := True;
    edtCodigoPRD.Color   := clWindow;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Enabled := False;
    edtCodigoPRD.Color   := AlteraCorComponentes;
    edtCodigoPRD.Clear;
  end;
end;

procedure Trpt_DataProd.ckbReferenciaClick(Sender: TObject);
begin
  if ckbReferencia.Checked then
  Begin
    edtReferencia.Enabled := True;
    edtReferencia.Color   := clWindow;
    edtReferencia.SetFocus;
  end
  else
  Begin
    edtReferencia.Enabled := False;
    edtReferencia.Color   := AlteraCorComponentes;
    edtReferencia.Clear;
  end;
end;

procedure Trpt_DataProd.ckbCodigoEntradaClick(Sender: TObject);
begin
  if ckbCodigoEntrada.Checked then
  Begin
    edtCodigoEntrada.Enabled := True;
    edtCodigoEntrada.Color   := clWindow;
    edtCodigoEntrada.SetFocus;
  end
  else
  Begin
    edtCodigoEntrada.Enabled := False;
    edtCodigoEntrada.Color   := AlteraCorComponentes;
    edtCodigoEntrada.Clear;
  end;
end;

procedure Trpt_DataProd.ckbDescricaoMovClick(Sender: TObject);
begin
  if ckbDescricaoMov.Checked then
  Begin
    edtDescricaoMov.Enabled := True;
    edtDescricaoMov.Color   := clWindow;
    edtDescricaoMov.SetFocus;
  end
  else
  Begin
    edtDescricaoMov.Enabled := False;
    edtDescricaoMov.Color   := AlteraCorComponentes;
    edtDescricaoMov.Clear;
  end;
end;

procedure Trpt_DataProd.ckbSomenteEntradaClick(Sender: TObject);
begin
  if ckbSomenteEntrada.Checked then
    ckbSomenteSaida.Checked := False;
end;

procedure Trpt_DataProd.ckbSomenteSaidaClick(Sender: TObject);
begin
  if ckbSomenteSaida.Checked then
    ckbSomenteEntrada.Checked := False;
end;

procedure Trpt_DataProd.ckbSomenteProdutoClick(Sender: TObject);
begin
  if ckbSomenteProduto.Checked then
    ckbSomenteServico.Checked := False;
end;

procedure Trpt_DataProd.ckbSomenteServicoClick(Sender: TObject);
begin
  if ckbSomenteServico.Checked then
    ckbSomenteProduto.Checked := False;
end;

procedure Trpt_DataProd.ckbCodigoGRPClick(Sender: TObject);
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

procedure Trpt_DataProd.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if dblCodigoGRP.Text = '' then
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

procedure Trpt_DataProd.dblCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    if dblCodigoGRP.Text <> '' then
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
    end;
  end;
end;

procedure Trpt_DataProd.ckbLJ3Click(Sender: TObject);
begin
  if ckbLJ3.Checked then
    ckbLJ4.Checked := False;
end;

procedure Trpt_DataProd.ckbLJ4Click(Sender: TObject);
begin
  if ckbLJ4.Checked then
    ckbLJ3.Checked := False;
end;

procedure Trpt_DataProd.ckbEstoqueBonificacaoClick(Sender: TObject);
begin
  if ckbEstoqueBonificacao.Checked then
  Begin
    Parametro1.Close;
    Parametro1.SQL.Text:='SELECT * FROM PARAMETRO '+
      'WHERE TPR_CODIGO = 14 '+  //Não tem tipo definido São todos os movimentos de estoque
      'ORDER BY PAR_DESCRICAO';
    Parametro1.Open;
    dblMovimentoBonificacao.Enabled:=True;
    dblMovimentoBonificacao.Color:=clWindow;
    dblMovimentoBonificacao.SetFocus;
    ckbEstoqueFisico.Checked := False;
    ckbEstoqueComercial.Checked := False;
    ckbEstoqueFiscal.Checked := False;
    ckbEstoqueAmostra.Checked := False;
    ckbEstoqueBonificacaoFiscal.Enabled := True;
  end
  else
  Begin
    dblMovimentoBonificacao.Enabled:=False;
    dblMovimentoBonificacao.Color:=AlteraCorComponentes;
    dblMovimentoBonificacao.KeyValue:=0;
    ckbEstoqueBonificacaoFiscal.Checked := False;
    ckbEstoqueBonificacaoFiscal.Enabled := False;
  end;
end;

procedure Trpt_DataProd.ckbEstoqueAmostraClick(Sender: TObject);
begin
  if ckbEstoqueAmostra.Checked then
  Begin
    Parametro1.Close;
    Parametro1.SQL.Text:='SELECT * FROM PARAMETRO '+
      'WHERE TPR_CODIGO = 14 '+  //Não tem tipo definido São todos os movimentos de estoque
      'ORDER BY PAR_DESCRICAO';
    Parametro1.Open;
    dblMovimentoAmostra.Enabled:=True;
    dblMovimentoAmostra.Color:=clWindow;
    dblMovimentoAmostra.SetFocus;
    ckbEstoqueFisico.Checked := False;
    ckbEstoqueComercial.Checked := False;
    ckbEstoqueFiscal.Checked := False;
    ckbEstoqueBonificacao.Checked := False;
    ckbEstoqueAmostraFiscal.Enabled := True;
  end
  else
  Begin
    dblMovimentoAmostra.Enabled:=False;
    dblMovimentoAmostra.Color:=AlteraCorComponentes;
    dblMovimentoAmostra.KeyValue:=0;
    ckbEstoqueAmostraFiscal.Checked := False;
    ckbEstoqueAmostraFiscal.Enabled := False;
  end;
end;

procedure Trpt_DataProd.ckbCodigoFUNClick(Sender: TObject);
begin
  if ckbCodigoFUN.Checked then
  Begin
    Funcionario1.Open;
    dblCodigoFUN.Enabled:=True;
    dblCodigoFUN.Color:=clWindow;
    dblCodigoFUN.KeyValue:=CentroCusto1.CentroDeCusto;
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

procedure Trpt_DataProd.ckbCodigoFORClick(Sender: TObject);
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

procedure Trpt_DataProd.ckbMarcaClick(Sender: TObject);
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

end.


