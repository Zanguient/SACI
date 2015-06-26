unit MxSTituloPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  SQuery, Parametro, Conta_de_Caixa, Fornecedor, Transportadora, Variants,
  Titulo_receber, SiacReport_TLB;

type
  TfMxSTituloPagar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    DSParametro1: TDataSource;
    DSParametro2: TDataSource;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    Parametro1: TParametro;
    Parametro2: TParametro;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    Transportadora1: TTransportadora;
    Fornecedor1: TFornecedor;
    ckbObservacao: TCheckBox;
    edtObservacao: TEdit;
    ckbCodigoPedido: TCheckBox;
    edtCodigoPedido: TEdit;
    ckbTipoDoc: TCheckBox;
    ckbTipoPag: TCheckBox;
    ckbCentroDeCusto: TCheckBox;
    dblTipoDoc: TDBLookupComboBox;
    dblTipoPag: TDBLookupComboBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCCX: TCheckBox;
    dblCodigoCCX: TDBLookupComboBox;
    ckbFornecedor: TCheckBox;
    ckbTransportadora: TCheckBox;
    ckbSintetico: TCheckBox;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    rdgTipoData: TRadioGroup;
    ckbCodigoTitulo: TCheckBox;
    edtCodigoTitulo: TEdit;
    ckbGrupoConta: TCheckBox;
    dblGrupo: TDBLookupComboBox;
    Parametro3: TParametro;
    DSParametro3: TDataSource;
    ckbAgruparGrupo: TCheckBox;
    Label6: TLabel;
    cmbOrdem: TComboBox;
    ckbAgenciaCheque: TCheckBox;
    edtAgenciaCheque: TEdit;
    edtCodigoFOR: TEdit;
    edtCodigoTRN: TEdit;
    lblFornecedor: TLabel;
    lblTransportadora: TLabel;
    ckbNumero: TCheckBox;
    edtNumero: TEdit;
    Label4: TLabel;
    ckbValorTitulo: TCheckBox;
    cmbValorTitulo: TComboBox;
    edtValorTitulo: TEdit;
    ckbSaltarLinha: TCheckBox;
    ckbAgruparDia: TCheckBox;
    ckbValorAproximado: TCheckBox;
    edtPercentualAprox: TEdit;
    ckbSuperSintetico: TCheckBox;
    ckbCodigoFPE: TCheckBox;
    edtCodigoFPE: TEdit;
    cbxRelatorioGrafico: TCheckBox;
    procedure bitConfirmarClick(Sender: TObject);
    procedure ckbCodigoPedidoClick(Sender: TObject);
    procedure ckbObservacaoClick(Sender: TObject);
    procedure ckbTipoDocClick(Sender: TObject);
    procedure ckbTipoPagClick(Sender: TObject);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitCancelarClick(Sender: TObject);
    procedure ckbCodigoCCXClick(Sender: TObject);
    procedure ckbFornecedorClick(Sender: TObject);
    procedure ckbTransportadoraClick(Sender: TObject);
    procedure ckbCodigoTituloClick(Sender: TObject);
    procedure ckbGrupoContaClick(Sender: TObject);
    procedure ckbAgenciaChequeClick(Sender: TObject);
    procedure edtCodigoFORChange(Sender: TObject);
    procedure edtCodigoTRNChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbNumeroClick(Sender: TObject);
    procedure ckbValorTituloClick(Sender: TObject);
    procedure ckbAgruparGrupoClick(Sender: TObject);
    procedure ckbAgruparDiaClick(Sender: TObject);
    procedure ckbValorAproximadoClick(Sender: TObject);
    procedure ckbSinteticoClick(Sender: TObject);
    procedure ckbCodigoFPEClick(Sender: TObject);
    procedure ReportTituloaAPagar(filtrosSQL, filtros: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSTituloPagar: TfMxSTituloPagar;

implementation

uses UBaixaPag, UDM, funcoes, UPagar, MxGraficoTitulosPagos, MxSCotaFor,
  MxSTransportadora;

{$R *.DFM}


procedure TfMxSTituloPagar.bitConfirmarClick(Sender: TObject);
var
  mensagem,CNC,CdTPG,CdPCP,TipoDoc,TipoPag,OBS,Conta,Forn,Tran,DataINI,DataFIM,DataINI20, DataFIM20,
  sGrupo,sFiltros, sAgenciaCheque, sNumero, sValorTitulo, sCampoAgrupa,
  sValorAproximado, CdFPE, sOrdem: String;
begin
  CdPCP := '';
  CdTPG := '';
  sFiltros := '';
  sAgenciaCheque := '';
  sNumero := '';
  sValorTitulo := '';
  sValorAproximado := '';
  sCampoAgrupa := '';
  CdFPE := '';
  sOrdem := '';
  mensagem:='';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if not VerificaDataBranco(mskDataINI.Text)then
    DataINI := ''
  else if rdgTipoData.ItemIndex = 0 then
  Begin
    DataINI := ' AND (T1.TPG_VENCIMENTO>='''+MesDia(mskDataINI.Text)+''') ';
    DataINI20 := ' AND (T20.TPG_VENCIMENTO>='''+MesDia(mskDataINI.Text)+''') ';
  end
  else if rdgTipoData.ItemIndex = 1 then
  Begin
    DataINI := ' AND (T1.TPG_PAGAMENTO>='''+MesDia(mskDataINI.Text)+''') ';
    DataINI20 := ' AND (T20.TPG_PAGAMENTO>='''+MesDia(mskDataINI.Text)+''') '
  end
  else if rdgTipoData.ItemIndex = 2 then
  Begin
    DataINI := ' AND (T1.TPG_DT_CADASTRO>='''+MesDia(mskDataINI.Text)+''') ';
    DataINI20 := ' AND (T20.TPG_DT_CADASTRO>='''+MesDia(mskDataINI.Text)+''') ';
  end;

  if not VerificaDataBranco(mskDataFIM.Text)then
    DataFIM := ''
  else if rdgTipoData.ItemIndex = 0 then
  Begin
    DataFIM := ' AND (T1.TPG_VENCIMENTO<'''+MesDia(StrToDate(mskDataFIM.Text)+1)+''') ';
    DataFIM20 := ' AND (T20.TPG_VENCIMENTO<'''+MesDia(StrToDate(mskDataFIM.Text)+1)+''') ';
  end
  else if rdgTipoData.ItemIndex = 1 then
  Begin
    DataFIM := ' AND (T1.TPG_PAGAMENTO<'''+MesDia(StrToDate(mskDataFIM.Text)+1)+''') ';
    DataFIM20 := ' AND (T20.TPG_PAGAMENTO<'''+MesDia(StrToDate(mskDataFIM.Text)+1)+''') ';
  end
  else if rdgTipoData.ItemIndex = 2 then
  Begin
    DataFIM := ' AND (T1.TPG_DT_CADASTRO<'''+MesDia(StrToDate(mskDataFIM.Text)+1)+''') ';
    DataFIM20 := ' AND (T20.TPG_DT_CADASTRO<'''+MesDia(StrToDate(mskDataFIM.Text)+1)+''') ';
  end;

  if (ckbCodigoPedido.Checked) then
    if (not VerificaInteiroBranco(edtCodigoPedido.Text)) then
      mensagem:=mensagem+'Código do Pedido de Compra inválido!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (PCP:'+edtCodigoPedido.Text+')';
      CdPCP:=' AND (T1.PCP_CODIGO='+edtCodigoPedido.Text+') ';
    end;

  if (ckbCodigoTitulo.Checked) then
    if (not VerificaInteiroBranco(edtCodigoTitulo.Text)) then
      mensagem:=mensagem+'Código do Título inválido!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (TPG:'+edtCodigoTitulo.Text+')';
      CdTPG:=' AND (T1.TPG_CODIGO='+edtCodigoTitulo.Text+') ';
    end;

  if (ckbNumero.Checked) then
  Begin
    if edtNumero.Text = '' then
      sNumero:=' AND (T1.TPG_NUMERO='''' OR T1.TPG_NUMERO IS NULL) '
    else
      sNumero:=' AND (T1.TPG_NUMERO LIKE ''%'+edtNumero.Text+'%'') ';
    sFiltros := sFiltros + ' (Numero:'+edtNumero.Text+')';
  end;

  if ckbCodigoFPE.Checked then
    if (not VerificaInteiroBranco(edtCodigoFPE.Text)) then
      mensagem:=mensagem+'Código de Faturamento Pendente inválido!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (FPE:'+edtCodigoFPE.Text+')';
      CdFPE:=' AND (T1.FPE_CODIGO='+edtCodigoFPE.Text+') ';
    end;

  if (ckbTipoDoc.Checked) then
    if (dblTipoDoc.Text = '') then
      mensagem:=mensagem+'Tipo de Documento inválido!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (TipoDoc:'+dblTipoDoc.Text+')';
      TipoDoc:=' AND (T1.TPG_TIPO_DOC='+IntToStr(dblTipoDoc.KeyValue)+') ';
    end;

  if (ckbTipoPag.Checked) then
    if (dblTipoPag.Text = '') then
      mensagem:=mensagem+'Tipo de Pagamento inválido!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (TipoPag:'+dblTipoPag.Text+')';
      TipoPag:=' AND (T1.TPG_TIPO_PAG='+IntToStr(dblTipoPag.KeyValue)+') ';
    end;

  if (ckbObservacao.Checked) then
    if (edtObservacao.Text = '') then
      mensagem:=mensagem+'Observação inválida!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (OBS:'+edtObservacao.Text+')';
      OBS:=' AND (T1.TPG_OBSERVACAO LIKE ''%'+edtObservacao.Text+'%'') ';
    end;

    if (ckbGrupoConta.Checked) then
      if dblGrupo.Text = '' then
        mensagem := mensagem + 'Grupo de Conta de Caixa inválida!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (Grupo:'+dblGrupo.Text+')';
      sGrupo:=' AND (T2.CCX_GRUPO='+IntToStr(dblGrupo.KeyValue)+') ';
    end;


  if ckbCentroDeCusto.Checked then
  Begin
    sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    CNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
  end;

  if (ckbCodigoCCX.Checked) then
    if (dblCodigoCCX.Text = '') then
      mensagem:=mensagem+'Conta de Caixa inválida!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (CCX:'+dblCodigoCCX.Text+')';
      Conta:=' AND (T1.CCX_CODIGO='+IntToStr(dblCodigoCCX.KeyValue)+') ';
    end;

  if (ckbFornecedor.Checked) then
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
      mensagem:=mensagem+'Fornecedor inválido!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (FOR:'+lblFornecedor.Caption+')';
      Forn:=' AND (T1.FOR_CODIGO='+edtCodigoFOR.Text+') ';
    end;

  if (ckbTransportadora.Checked) then
    if not VerificaInteiroBranco(edtCodigoTRN.Text) then
      mensagem:=mensagem+'Transportadora inválida!'+#13
    else
    Begin
      sFiltros := sFiltros + ' (TRN:'+lblTransportadora.Caption+')';
      Tran:=' AND (T1.TRN_CODIGO='+edtCodigoTRN.Text+') ';
    end;

  if ckbAgenciaCheque.Checked then
  Begin
    sAgenciaCheque:=' AND (T1.CHQ_CODIGO LIKE '''+edtAgenciaCheque.Text+'%'') ';
    sFiltros := sFiltros + ' (Ag:'+edtAgenciaCheque.Text+')';
  end;

  if ckbValorTitulo.Checked then
  Begin
    if not VerificaFloatBranco(edtValorTitulo.Text) then
    Begin
      edtValorTitulo.SetFocus;
      Raise Exception.Create('Valor do Título inválido!');
    end
    else
      case cmbValorTitulo.ItemIndex of
        0: Begin
             sValorTitulo:=' AND (T1.TPG_VALOR < '+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:<'+edtValorTitulo.Text+') ';
           end;
        1: Begin
             sValorTitulo:=' AND (T1.TPG_VALOR = '+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:='+edtValorTitulo.Text+') ';
           end;
        2: Begin
             sValorTitulo:=' AND (T1.TPG_VALOR > '+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:>'+edtValorTitulo.Text+') ';
           end;
        3: Begin
             sValorTitulo:=' AND (T1.TPG_VALOR <='+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:<='+edtValorTitulo.Text+') ';
           end;
        4: Begin
             sValorTitulo:=' AND (T1.TPG_VALOR >='+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:>='+edtValorTitulo.Text+') ';
           end;
      end;
  end;

  if ckbValorAproximado.Checked then
  Begin
    if not VerificaFloatBranco(edtPercentualAprox.Text) then
      Raise exception.Create('Percentual de aproximação inválido!');
    sFiltros := sFiltros + '(Aprox:'+edtPercentualAprox.Text+'%)';
    sValorAproximado := ' AND EXISTS (SELECT T20.TPG_CODIGO '+
      ' FROM TITULO_A_PAGAR T20 '+
      ' WHERE T20.TPG_CODIGO<>T1.TPG_CODIGO '+
      ' AND T20.FOR_CODIGO=T1.FOR_CODIGO '+
      ' AND T20.TRN_CODIGO=T1.TRN_CODIGO '+
      DataINI20+DataFIM20+
      ' AND (ABS(T20.TPG_VALOR-T1.TPG_VALOR)<=(T1.TPG_VALOR*'+VirgPonto(StrToFloat(edtPercentualAprox.Text)/100)+') OR '+
      ' ABS(T20.TPG_VALOR-T1.TPG_VALOR)<=(T20.TPG_VALOR*'+VirgPonto(StrToFloat(edtPercentualAprox.Text)/100)+')))';
  end;

  if mensagem<>'' then
  Begin
    ShowMessage(mensagem);
    exit;
  end;

  if DM.Configuracao1.Empresa = 1 then
    sOrdem := ' T1.CNC_CODIGO,';

  if ckbAgruparGrupo.Checked then
    sOrdem := sOrdem + ' T2.CCX_GRUPO,'
  else if ckbAgruparDia.Checked then
    if rdgTipoData.ItemIndex = 0 then
      sOrdem := sOrdem + ' T1.TPG_VENCIMENTO,'
    else
      sOrdem := sOrdem + ' T1.TPG_PAGAMENTO,';

  if rdgTipoData.ItemIndex = 0 then
    sCampoAgrupa := 'T1.TPG_VENCIMENTO'
  else
    sCampoAgrupa := 'T1.TPG_PAGAMENTO';

//0 Código
//1 Vencimento
//2 Conta de Caixa
//3 Valor Titulo
//4 Valor Pago

  case cmbOrdem.ItemIndex of
    0 : sOrdem := sOrdem + ' T1.TPG_CODIGO ';
    1 : if ckbAgruparDia.Checked then
          sOrdem := sOrdem + ' T2.CCX_DESCRICAO '
        else
          sOrdem := sOrdem + ' T1.TPG_VENCIMENTO, T2.CCX_DESCRICAO, T1.TPG_SEQUENCIA ';
    2 : if ckbAgruparDia.Checked then
          sOrdem := sOrdem + ' T2.CCX_DESCRICAO, T1.TPG_SEQUENCIA '
        else
          sOrdem := sOrdem + ' T2.CCX_DESCRICAO, T1.TPG_VENCIMENTO, T1.TPG_SEQUENCIA ';
    3 : if ckbAgruparDia.Checked then
          sOrdem := sOrdem + ' T2.CCX_DESCRICAO, T1.FOR_CODIGO, T1.TRN_CODIGO, T1.TPG_VALOR, T1.TPG_CODIGO '
        else
          sOrdem := sOrdem + ' T1.FOR_CODIGO, T1.TRN_CODIGO, T1.TPG_VALOR, T1.TPG_CODIGO ';
    4 : if ckbAgruparDia.Checked then
          sOrdem := sOrdem + ' T2.CCX_DESCRICAO, T1.FOR_CODIGO, T1.TRN_CODIGO, T1.TPG_VALOR_PAGO, T1.TPG_CODIGO '
        else
          sOrdem := sOrdem + ' T1.FOR_CODIGO, T1.TRN_CODIGO, T1.TPG_VALOR_PAGO, T1.TPG_CODIGO ';
  end;

  sOrdem := ' ORDER BY '+sOrdem;

  If Tag=1 then //Títulos Pagos
  begin
    Application.CreateForm(Trpt_BaixaPag,rpt_BaixaPag);
    with rpt_BaixaPag do
    Begin
      case rdgTipoData.ItemIndex of
        0: zrlFiltros.Caption := '(Ven)' + sFiltros;
        1: zrlFiltros.Caption := '(Pag)' + sFiltros;
        2: zrlFiltros.Caption := '(Cad)' + sFiltros;
      end;
      if ckbSintetico.Checked then
      Begin
        if ckbSuperSintetico.Checked then
        Begin
          zrlCabecalho.Height:=4;
          zrlDetalhe.Height:=0;
          SZRLabel6.Enabled:=False;
        end
        else
        Begin
          zrlCabecalho.Height:=6;
          zrlDetalhe.Height:=1;
          zrlLinhaDupla.Top := 5;
        end;
      end
      else if ckbSaltarLinha.Checked then
        zrlDetalhe.Height := 4;

      if ckbAgruparGrupo.Checked then
        zrbGrupoCaixa.Expression := 'CCX_GRUPO'
      else if ckbAgruparDia.Checked then
      Begin
        zrbGrupoCaixa.Expression := 'DIA+MES+ANO';
        zrlGrupoCaixa.Enabled := False;
      end
      else
      Begin
        zrbGrupoCaixa.Expression := '';
        zrbGrupoCaixa.Height := 0;
      end;

      SZRLabel1.Caption := mskDataINI.Text;
      SZRLabel3.Caption := mskDataFIM.Text;
      Titulo_a_pagar1.SQL.Text:='SELECT DISTINCT T1.*, '+
        ' DATEPART(day, '+sCampoAgrupa+') AS Dia, '+
        ' DATEPART(month, '+sCampoAgrupa+') AS Mes, '+
        ' DATEPART(year, '+sCampoAgrupa+') AS Ano, '+
        ' T2.CCX_CODIGO,T2.CNC_CODIGO,T2.CCX_DESCRICAO, T2.CCX_GRUPO '+
        ' FROM Titulo_a_pagar T1, Conta_de_Caixa T2 '+
        ' WHERE (T1.CCX_CODIGO*=T2.CCX_CODIGO) AND (T1.TPG_SITUACAO=1) '+
        CNC+sGrupo+CdTPG+CdFPE+sNumero+sValorTitulo+CdPCP+TipoDoc+TipoPag+OBS+
        Conta+Forn+Tran+sAgenciaCheque+DataINI+DataFIM+sValorAproximado+
        sOrdem;
      Titulo_a_pagar1.Open;
      if Titulo_a_Pagar1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;        
      report.Preview;
    end;
  end
  else if tag = 2 then //Títulos a Pagar
  Begin
    if cbxRelatorioGrafico.Checked then
    begin
      ReportTituloaAPagar(CNC+CdTPG+CdFPE+CdPCP+sNumero+sValorTitulo+sGrupo+TipoDoc+TipoPag+OBS+
                          Conta+Forn+Tran+sAgenciaCheque+DataINI+DataFIM+sValorAproximado+
                          sOrdem, sFiltros);
    end
    else
    begin
      Application.CreateForm(Trpt_Pagar,rpt_Pagar);
      with rpt_Pagar do
      Begin
        case rdgTipoData.ItemIndex of
          0: zrlFiltros.Caption := '(Ven)' + sFiltros;
          1: zrlFiltros.Caption := '(Pag)' + sFiltros;
          2: zrlFiltros.Caption := '(Cad)' + sFiltros;
        end;

        if (DM.Configuracao1.Empresa = empLBM) then
        Begin
          zrbGrupoCNC.Expression := '';
          zrbGrupoCNC.Height := 0;
        end;

        if ckbSintetico.Checked then
        Begin
          if ckbSuperSintetico.Checked then
          Begin
            zrbCabecalho.Height:=4;
            SZRLabel11.Enabled := False; //Linha do SubTotal
            zrbDetalhe.Height:=0;
          end
          else
          Begin
            zrbCabecalho.Height:=6;
            zrbDetalhe.Height:=1;
            zrlLinhaDupla.Top := 5;
          end;
        end
        else if ckbSaltarLinha.Checked then
          zrbDetalhe.Height := 3;


        if ckbAgruparGrupo.Checked then
          zrbGrupo1.Expression := 'CCX_GRUPO'
        else if ckbAgruparDia.Checked then
        Begin
          zrbGrupo1.Expression := 'DIA+MES+ANO';
          zrlGrupoCaixa.Enabled := False;
        end
        else
        Begin
          zrbGrupo1.Expression := '';
          zrbGrupo1.Height := 0;
        end;

        SZRLabel1.Caption := mskDataINI.Text;
        SZRLabel3.Caption := mskDataFIM.Text;
        Fornecedor1.Active:=True;
        CentroCusto1.Open;
        Conta_de_Caixa1.Open;
        Titulo_a_Pagar1.Close;
        if DM.Configuracao1.SqlInterbase = 1 then
          Titulo_a_Pagar1.SQL.Text:='SELECT DISTINCT T1.*,T2.CCX_DESCRICAO, T2.CCX_GRUPO, '+
            ' DATEPART(day, '+sCampoAgrupa+') AS Dia, '+
            ' DATEPART(month, '+sCampoAgrupa+') AS Mes, '+
            ' DATEPART(year, '+sCampoAgrupa+') AS Ano '+
            ' FROM Titulo_a_pagar T1, Conta_de_Caixa T2 '+
            ' WHERE T1.TPG_SITUACAO=0 AND T1.CCX_CODIGO*=T2.CCX_CODIGO '+
            CNC+SGrupo+CdTPG+CdFPE+CdPCP+sNumero+sValorTitulo+TipoDoc+TipoPag+OBS+
            Conta+Forn+Tran+sAgenciaCheque+DataINI+DataFIM+sValorAproximado+
            sOrdem
        else
          Titulo_a_Pagar1.SQL.Text:='SELECT DISTINCT T1.*,T2.CCX_DESCRICAO, T2.CCX_GRUPO '+
            ' FROM Titulo_a_pagar T1, Conta_de_Caixa T2 '+
            ' WHERE T1.TPG_SITUACAO=0 AND T1.CCX_CODIGO=T2.CCX_CODIGO '+
            CNC+CdTPG+CdFPE+CdPCP+sNumero+sValorTitulo+sGrupo+TipoDoc+TipoPag+OBS+
            Conta+Forn+Tran+sAgenciaCheque+DataINI+DataFIM+sValorAproximado+
            sOrdem;
        Titulo_a_Pagar1.Open;
        if Titulo_a_Pagar1.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        if (report.Height > DM.Configuracao1.MaxLinhasImp) and
           (DM.Configuracao1.MaxLinhasImp <> 65) then
          report.Height := DM.Configuracao1.MaxLinhasImp;
        report.Preview;
      end;
    end;
  end
  else if tag = 3 then //Gráfico de Títulos Pagos
  Begin
    Application.CreateForm(TfMxGraficoTitulosPagos, fMxGraficoTitulosPagos);
    with fMxGraficoTitulosPagos do
    Begin
      tag := 0;
      if Conta <> '' then
        Query1.SQL.Text:='SELECT UPPER(T1.TPG_CODIGO) AS DESCRICAO,'+
          ' SUM(T1.TPG_VALOR_PAGO) AS TOTAL '+
          ' FROM Titulo_a_pagar T1, Conta_de_Caixa T2 '+
          ' WHERE T1.TPG_SITUACAO=1 AND T1.CCX_CODIGO*=T2.CCX_CODIGO '+
          CNC+CdTPG+CdFPE+CdPCP+sNumero+sValorTitulo+TipoDoc+TipoPag+OBS+Conta+
          Forn+Tran+sAgenciaCheque+DataINI+DataFIM+sValorAproximado+
          'GROUP BY T1.TPG_CODIGO '+
          'HAVING SUM(T1.TPG_VALOR_PAGO) > 0 '+
          'ORDER BY T1.TPG_CODIGO '
      else
        Query1.SQL.Text:='SELECT T2.CCX_DESCRICAO AS DESCRICAO,'+
          ' SUM(T1.TPG_VALOR_PAGO) AS TOTAL '+
          ' FROM Titulo_a_pagar T1, Conta_de_Caixa T2 '+
          ' WHERE T1.TPG_SITUACAO=1 AND T1.CCX_CODIGO*=T2.CCX_CODIGO '+
          CNC+CdTPG+CdFPE+CdPCP+sNumero+sValorTitulo+TipoDoc+TipoPag+OBS+Conta+
          Forn+Tran+sAgenciaCheque+DataINI+DataFIM+sValorAproximado+
          'GROUP BY T2.CCX_DESCRICAO '+
          'HAVING SUM(T1.TPG_VALOR_PAGO) > 0 '+
          'ORDER BY T2.CCX_DESCRICAO ';
      ShowModal;
    end;
  end;
end;

procedure TfMxSTituloPagar.ckbCodigoPedidoClick(Sender: TObject);
begin
  if ckbCodigoPedido.Checked then
  Begin
    edtCodigoPedido.Color:=clWindow;
    edtCodigoPedido.Enabled:=True;
    edtCodigoPedido.SetFocus;
  end
  else
  Begin
    edtCodigoPedido.Clear;
    edtCodigoPedido.Color:=AlteraCorComponentes;
    edtCodigoPedido.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbObservacaoClick(Sender: TObject);
begin
  if ckbObservacao.Checked then
  Begin
    edtObservacao.Color:=clWindow;
    edtObservacao.Enabled:=True;
    edtObservacao.SetFocus;
  end
  else
  Begin
    edtObservacao.Clear;
    edtObservacao.Color:=AlteraCorComponentes;
    edtObservacao.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbTipoDocClick(Sender: TObject);
begin
  if ckbTipoDoc.Checked then
  Begin
    dblTipoDoc.Color:=clWindow;
    dblTipoDoc.Enabled:=True;
    dblTipoDoc.SetFocus;
  end
  else
  Begin
    dblTipoDoc.KeyValue:=-1;
    dblTipoDoc.Color:=AlteraCorComponentes;
    dblTipoDoc.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbTipoPagClick(Sender: TObject);
begin
  if ckbTipoPag.Checked then
  Begin
    dblTipoPag.Color:=clWindow;
    dblTipoPag.Enabled:=True;
    dblTipoPag.SetFocus;
  end
  else
  Begin
    dblTipoPag.KeyValue:=-1;
    dblTipoPag.Color:=AlteraCorComponentes;
    dblTipoPag.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbCentroDeCustoClick(Sender: TObject);
begin
  if ckbCentroDeCusto.Checked then
  Begin
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  CentroCusto1.Open;
  Parametro1.Open;
  Parametro2.Open;
  if tag <> 2 then
    rdgTipoData.ItemIndex:=1;
  if tag = 3 then
  Begin
    ckbSintetico.Enabled := False;
    ckbSuperSintetico.Enabled := False;
    ckbSaltarLinha.Enabled := False;
  end;
  cmbOrdem.ItemIndex := 1;
end;

procedure TfMxSTituloPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Parametro1.Close;
  Parametro2.Close;
  Conta_de_Caixa1.Close;
  Fornecedor1.Close;
  Transportadora1.Close;
  Action := caFree;
end;

procedure TfMxSTituloPagar.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSTituloPagar.ckbCodigoCCXClick(Sender: TObject);
begin
  if ckbCodigoCCX.Checked then
  Begin
    with Conta_de_Caixa1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_DC="D" '+
        ' AND CCX_SITUACAO<>1 '+
        ' AND CCX_AVULSO=0 '+
        ' ORDER BY CCX_DESCRICAO ASC ';
      Open;
    end;
    dblCodigoCCX.Color:=clWindow;
    dblCodigoCCX.Enabled:=True;
    dblCodigoCCX.KeyValue := Conta_de_Caixa1.CodigoCCX;
    dblCodigoCCX.SetFocus;
  end
  else
  Begin
    Conta_de_Caixa1.Close;
    dblCodigoCCX.KeyValue:=-1;
    dblCodigoCCX.Color:=AlteraCorComponentes;
    dblCodigoCCX.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbFornecedorClick(Sender: TObject);
begin
  if ckbFornecedor.Checked then
  Begin
    edtCodigoFOR.Color:=clWindow;
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.Clear;
    edtCodigoFOR.Color:=AlteraCorComponentes;
    edtCodigoFOR.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbTransportadoraClick(Sender: TObject);
begin
  if ckbTransportadora.Checked then
  Begin
    edtCodigoTRN.Color:=clWindow;
    edtCodigoTRN.Enabled:=True;
    edtCodigoTRN.SetFocus;
  end
  else
  Begin
    edtCodigoTRN.Clear;
    edtCodigoTRN.Color:=AlteraCorComponentes;
    edtCodigoTRN.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbCodigoTituloClick(Sender: TObject);
begin
  if ckbCodigoTitulo.Checked then
  Begin
    edtCodigoTitulo.Color:=clWindow;
    edtCodigoTitulo.Enabled:=True;
    edtCodigoTitulo.SetFocus;
  end
  else
  Begin
    edtCodigoTitulo.Color:=AlteraCorComponentes;
    edtCodigoTitulo.Text:='';
    edtCodigoTitulo.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbGrupoContaClick(Sender: TObject);
begin
  if ckbGrupoConta.Checked then
  Begin
    parametro3.Open;
    dblGrupo.Color:=clWindow;
    dblGrupo.Enabled:=True;
    dblGrupo.SetFocus;
  end
  else
  Begin
    parametro3.Close;
    dblGrupo.KeyValue:=-1;
    dblGrupo.Color:=AlteraCorComponentes;
    dblGrupo.Enabled:=False;
  end;

end;

procedure TfMxSTituloPagar.ckbAgenciaChequeClick(Sender: TObject);
begin
  if ckbAgenciaCheque.Checked then
  Begin
    edtAgenciaCheque.Color:=clWindow;
    edtAgenciaCheque.Enabled:=True;
    edtAgenciaCheque.SetFocus;
  end
  else
  Begin
    edtAgenciaCheque.Clear;
    edtAgenciaCheque.Color:=AlteraCorComponentes;
    edtAgenciaCheque.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.edtCodigoFORChange(Sender: TObject);
begin
  try
    with Fornecedor1 do
    Begin
      if CodigoFOR <> StrToInt(edtCodigoFOR.Text) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(edtCodigoFOR.Text);
        Open;
      end;
      lblFornecedor.Caption := AbreviarNome(RazaoSocial);
    end;
  except
    lblFornecedor.Caption := '';
  end;
end;

procedure TfMxSTituloPagar.edtCodigoTRNChange(Sender: TObject);
begin
  try
    with Transportadora1 do
    Begin
      if CodigoTRN <> StrToInt(edtCodigoTRN.Text) then
      Begin
        Close;
        ParamByName('TRN_CODIGO').asInteger := StrToInt(edtCodigoTRN.Text);
        Open;
      end;
      lblTransportadora.Caption := AbreviarNome(RazaoSocial);
    end;
  except
    lblTransportadora.Caption := '';
  end;
end;

procedure TfMxSTituloPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    bitConfirmarClick(sender)
  else if Key = #27 then
     bitCancelarClick(sender)
  else if key=#32 then
  Begin
    if edtCodigoFOR.Focused then
    Begin
      key:=chr(0);
      Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
      fMxSCotaFor.Fornecedor1.Close;
      fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      fMxSCotaFor.Fornecedor1.Open;
      fMxSCotaFor.tag:=28;
      fMxSCotaFor.ShowModal;
    end
    else if edtCodigoTRN.Focused then
    Begin
      key:=chr(0);
      Application.CreateForm(TfMxSTransportadora, fMxSTransportadora);
      with fMxSTransportadora do
      Begin
        tag:=2;
        Transportadora1.Close;
        Transportadora1.Open;
        Showmodal;
      end;
    end;
  end;
end;

procedure TfMxSTituloPagar.ckbNumeroClick(Sender: TObject);
begin
  if ckbNumero.Checked then
  Begin
    edtNumero.Color:=clWindow;
    edtNumero.Enabled:=True;
    edtNumero.SetFocus;
  end
  else
  Begin
    edtNumero.Color:=AlteraCorComponentes;
    edtNumero.Clear;
    edtNumero.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbValorTituloClick(Sender: TObject);
begin
  if ckbValorTitulo.Checked then
  Begin
    cmbValorTitulo.Color:=clWindow;
    cmbValorTitulo.Enabled:=True;
    cmbValorTitulo.ItemIndex:=1;
    edtValorTitulo.Color:=clWindow;
    edtValorTitulo.Enabled:=True;
    edtValorTitulo.SetFocus;
  end
  else
  Begin
    cmbValorTitulo.Color:=AlteraCorComponentes;
    cmbValorTitulo.Enabled:=False;
    cmbValorTitulo.ItemIndex:=-1;
    edtValorTitulo.Color:=AlteraCorComponentes;
    edtValorTitulo.Clear;
    edtValorTitulo.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbAgruparGrupoClick(Sender: TObject);
begin
  if ckbAgruparGrupo.Checked then
    ckbAgruparDia.Checked := False;
end;

procedure TfMxSTituloPagar.ckbAgruparDiaClick(Sender: TObject);
begin
  if ckbAgruparDia.Checked then
    ckbAgruparGrupo.Checked := False;
end;

procedure TfMxSTituloPagar.ckbValorAproximadoClick(Sender: TObject);
begin
  if ckbValorAproximado.Checked then
  Begin
    cmbOrdem.ItemIndex := 3;
    edtPercentualAprox.Color:=clWindow;
    edtPercentualAprox.Text := '5,00';
    edtPercentualAprox.Enabled:=True;
    edtPercentualAprox.SetFocus;
  end
  else
  Begin
    edtPercentualAprox.Clear;
    edtPercentualAprox.Color:=AlteraCorComponentes;
    edtPercentualAprox.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ckbSinteticoClick(Sender: TObject);
begin
  if ckbSintetico.Checked then
  Begin
    ckbSuperSintetico.Enabled := True;
    ckbSaltarLinha.Checked := False;
    ckbSaltarLinha.Enabled := False;
  end
  else
  Begin
    ckbSaltarLinha.Enabled := True;
    ckbSuperSintetico.Checked := False;
    ckbSuperSintetico.Enabled := False;
  end;
end;

procedure TfMxSTituloPagar.ckbCodigoFPEClick(Sender: TObject);
begin
  if ckbCodigoFPE.Checked then
  Begin
    edtCodigoFPE.Color:=clWindow;
    edtCodigoFPE.Enabled:=True;
    edtCodigoFPE.SetFocus;
  end
  else
  Begin
    edtCodigoFPE.Color:=AlteraCorComponentes;
    edtCodigoFPE.Clear;
    edtCodigoFPE.Enabled:=False;
  end;
end;

procedure TfMxSTituloPagar.ReportTituloaAPagar(filtrosSQL, filtros: string);
var
  stiReport: CoSiacReport_;
  SQL: string;
begin
  SQL := 'SELECT DISTINCT T1.*,T2.CCX_DESCRICAO, T2.CCX_GRUPO '+
         ' FROM Titulo_a_pagar T1, Conta_de_Caixa T2 '+
         ' WHERE T1.TPG_SITUACAO=0 AND T1.CCX_CODIGO=T2.CCX_CODIGO ' + filtrosSQL;

  stiReport.Create.ReportContaPagar(false,
                                    false,
                                    SQL,
                                    EmpresaDesenvolvedora,
                                    'Relatório de contas a pagar do sistema',
                                    DM.CentroCusto1.RazaoSocial,
                                    '',//DM.Configuracao1.LojaNome
                                    'Relatório de Contas a Pagar',
                                    DM.Usuario1.NomeUSU,
                                    '',//Filtros
                                    rptArquivoLogo);

end;

end.
