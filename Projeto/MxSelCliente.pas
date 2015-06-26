unit MxSelCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, DBTables, SQuery, CentroCusto, DBCtrls, ExtCtrls,
  Mask, Usuario, Cliente, Parametro, Vendedor, Variants, Informacoes, StrUtils;

type
  TfMxSelCliente = class(TForm)
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SpeedButton5: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    mskDataInicial: TMaskEdit;
    mskDataFinal: TMaskEdit;
    Usuario1: TUsuario;
    DSUsuario1: TDataSource;
    Etiquetas1: TCliente;
    Parametro1: TParametro;
    DSVendedor1: TDataSource;
    Vendedor1: TVendedor;
    rdgTipoIntevalo: TRadioGroup;
    Panel3: TPanel;
    Label11: TLabel;
    Label16: TLabel;
    DSParametro4: TDataSource;
    Parametro4: TParametro;
    GroupBox2: TGroupBox;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbSituacao: TCheckBox;
    cmbSituacao: TComboBox;
    ckbTipoPessoa: TCheckBox;
    cmbTipoPessoa: TComboBox;
    dblClassificacao: TDBLookupComboBox;
    ckbClassificacao: TCheckBox;
    dblTipo: TDBLookupComboBox;
    ckbTipo: TCheckBox;
    DSParametro2: TDataSource;
    Parametro2: TParametro;
    Label15: TLabel;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCreditoNaoZero: TCheckBox;
    ckbCodigoCNC: TCheckBox;
    ckbUltimoUsuario: TCheckBox;
    dblUltimoUsuario: TDBLookupComboBox;
    ckbAniversariantes: TCheckBox;
    ckbClienteSPC: TCheckBox;
    cmbClienteSPC: TComboBox;
    cmbMesAniversario: TComboBox;
    ckbUltimoPagamento: TCheckBox;
    mskDataUltimoPagamento: TMaskEdit;
    edtDiaAniversario: TEdit;
    ckbInadiplente: TCheckBox;
    ckbVendaProibida: TCheckBox;
    dblCodigoVEN: TDBLookupComboBox;
    ckbCodigoVEN: TCheckBox;
    ckbFalhaCNPJCGF: TCheckBox;
    ckbSomenteSemTRC: TCheckBox;
    ckbNaoVendaProibida: TCheckBox;
    ckbSomenteLiberadoInadiplencia: TCheckBox;
    ckbAniversarioContato: TCheckBox;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    cmbOrdem: TComboBox;
    ckbSintetico: TCheckBox;
    ckbMalaDireta: TCheckBox;
    edtArquivoMalaDireta: TEdit;
    ckbExportar: TCheckBox;
    Informacoes1: TInformacoes;
    GroupBox1: TGroupBox;
    ckbConvenio: TCheckBox;
    edtConvenio: TEdit;
    dblSuperiorVendedor: TDBLookupComboBox;
    ckbSuperiorVendedor: TCheckBox;
    dblParceiroVendedor: TDBLookupComboBox;
    ckbParceiroVendedor: TCheckBox;
    Vendedor2: TVendedor;
    DSVendedor2: TDataSource;
    Vendedor3: TVendedor;
    DSVendedor3: TDataSource;
    ckbAgruparPorVendedor: TCheckBox;
    Label5: TLabel;
    ckbValorTotal: TCheckBox;
    cmbValorTotal: TComboBox;
    edtValorTotal: TEdit;
    ckbEnderecoIncompleto: TRadioGroup;
    ckbSomenteAdiplentes: TCheckBox;
    ckbSemprePontual: TCheckBox;
    cmbDtPagamento: TComboBox;
    edtTolerancia: TEdit;
    Label3: TLabel;
    ckbSuperSintetico: TCheckBox;
    ckbRelCadastro: TCheckBox;
    ckbEtiquetas: TCheckBox;
    ckbNivel: TCheckBox;
    edtA: TEdit;
    edtC: TEdit;
    edtB: TEdit;
    lblA: TLabel;
    lblB: TLabel;
    lblC: TLabel;
    GroupBox4: TGroupBox;
    ckbA: TRadioButton;
    ckbB: TRadioButton;
    ckbC: TRadioButton;
    ckbUltimaCompra: TCheckBox;
    cmbDtCompra: TComboBox;
    mskDataUltimaCompra: TMaskEdit;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbUltimoUsuarioClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbAniversariantesClick(Sender: TObject);
    procedure ckbClienteSPCClick(Sender: TObject);
    procedure ckbUltimoPagamentoClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure ckbInadiplenteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbTipoPessoaClick(Sender: TObject);
    procedure ckbCodigoVENClick(Sender: TObject);
    procedure ckbClassificacaoClick(Sender: TObject);
    procedure ckbVendaProibidaClick(Sender: TObject);
    procedure ckbNaoVendaProibidaClick(Sender: TObject);
    procedure ckbTipoClick(Sender: TObject);
    procedure ckbMalaDiretaClick(Sender: TObject);
    procedure ckbConvenioClick(Sender: TObject);
    procedure ckbSuperiorVendedorClick(Sender: TObject);
    procedure ckbParceiroVendedorClick(Sender: TObject);
    procedure ckbValorTotalClick(Sender: TObject);
    procedure rdgTipoIntevaloClick(Sender: TObject);
    procedure ckbAgruparPorVendedorClick(Sender: TObject);
    procedure ckbSomenteAdiplentesClick(Sender: TObject);
    procedure ckbSemprePontualClick(Sender: TObject);
    procedure ckbSinteticoClick(Sender: TObject);
    procedure ckbNivelClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure ckbUltimaCompraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Centro,Cred,USU,CdCLI,CdConvenio,DATACliIni,DATACliFim,cSPC,cUltimaPag,Sit,
      CLIInad,Ordem, vVendaProibida, vLiberadoInad,TipoPessoa, CdVEN, cUltimaCompra,
      sFalhaCNPJCGF,sEnderecoIncompleto,sClassificacao,sTipo,sSemTRC,Valor: string;
  end;

var
  fMxSelCliente: TfMxSelCliente;

implementation

Uses UDM, UPrinc2, UPagar, URelData, funcoes, UCliente,
  UClienteAniversariante, MxSelAniversario, UClienteEtiquetas, CdCliente,
  SysConst, UClienteCadastro;

{$R *.DFM}

procedure TfMxSelCliente.SB_ConfirmarClick(Sender: TObject);
var
  ArqExportar, ArqExportar2: TextFile;
  QtdEtiquetas, iMenorCod, iMaiorCod:integer;
  EnderecoCompleto, sFiltros, sAniversarico1, sAniversarico2, sSuperiorVendedor,
  sParceiroVendedor,sLinha, CentroT1, CentroT10, CentroPDV2, CodBarras,cliNivelA,cliNivelB,cliNivelC, cliNivel:string;

  i: integer;
begin
  cliNivel := '';
  cliNivelA := '';
  cliNivelB := '';
  cliNivelC := '';
  QtdEtiquetas:=0;
  DATACliIni := '';
  DATACliFim := '';
  USU    := '';
  Cred   := '';
  CdCLI  := '';
  CdConvenio := '';
  CdVEN  := '';
  vVendaProibida := '';
  vLiberadoInad := '';
  CLIInad:='';
  cUltimaCompra := '';
  cUltimaPag:='';
  cSPC:='';
  TipoPessoa:='';
  sClassificacao := '';
  sTipo := '';
  sFalhaCNPJCGF := '';
  sEnderecoIncompleto := '';
  sSemTRC:='';
  sSuperiorVendedor := '';
  sParceiroVendedor := '';
  CentroT1 := '';
  CentroT10 := '';
  CentroPDV2 := '';
  sFiltros := '';



  ///// ////
  if ckbUltimaCompra.Checked then
  Begin
    if not VerificaDataBranco(mskDataUltimaCompra.Text) then
      Raise Exception.Create('Data da última compra inválida!');

    case cmbDtCompra.ItemIndex of
      0: Begin // <
           cUltimaCompra:=' AND (SELECT MAX(T.PDV_DATA_HORA) '+
             ' FROM PEDIDO_DE_VENDA T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) < "'+MesDiaHora(mskDataUltimaCompra.Text)+'" ';
           sFiltros := sFiltros + '(Ult.Pag<:'+mskDataUltimaCompra.Text+')';
         end;
      1: Begin // =
           cUltimaCompra:=' AND (SELECT MAX(T.PDV_DATA_HORA) '+
             ' FROM PEDIDO_DE_VENDA T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) = "'+MesDiaHora(mskDataUltimaCompra.Text)+'" ';
           sFiltros := sFiltros + '(Ult.Pag=:'+mskDataUltimaCompra.Text+')';
         end;
      2: Begin // >
           cUltimaCompra:=' AND (SELECT MAX(T.PDV_DATA_HORA) '+
             ' FROM PEDIDO_DE_VENDA T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) > "'+MesDiaHora(mskDataUltimaCompra.Text+' 23:59:59')+'" ';
           sFiltros := sFiltros + '(Ult.Pag>:'+mskDataUltimaCompra.Text+')';
         end;
      3: Begin // <=
           cUltimaCompra:=' AND (SELECT MAX(T.PDV_DATA_HORA) '+
             ' FROM PEDIDO_DE_VENDA T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) < "'+MesDiaHora(StrToDate(mskDataUltimaCompra.Text)+1)+'" ';
           sFiltros := sFiltros + '(Ult.Pag<=:'+mskDataUltimaCompra.Text+')';
         end;
      4: Begin // >=
           cUltimaCompra:=' AND (SELECT MAX(T.PDV_DATA_HORA) '+
             ' FROM PEDIDO_DE_VENDA T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) >= "'+MesDiaHora(mskDataUltimaCompra.Text)+'" ';
           sFiltros := sFiltros + '(Ult.Pag>=:'+mskDataUltimaCompra.Text+')';
         end;
    end;
  end;
  /////// ///////////////


  if ckbNivel.Checked then
  begin
    if ckbA.Checked then
    begin
      cliNivel := ' AND CASE WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) <= ' +edtA.Text + ' THEN ''A'' '+
                  ' WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) BETWEEN  ''' +edtA.Text + ''' AND ''' +edtB.Text + ''' THEN ''B'' ' +
                  ' WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) BETWEEN  ''' +edtB.Text + ''' AND ''' +edtC.Text + ''' THEN ''C'' ' +
                  ' END = ''A'' ';
    end
    else if ckbB.Checked then
    begin
      cliNivel := ' AND CASE WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) <= ' +edtA.Text + ' THEN ''A'' '+
                  ' WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) BETWEEN  ''' +edtA.Text + ''' AND ''' +edtB.Text + ''' THEN ''B'' ' +
                  ' WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) BETWEEN  ''' +edtB.Text + ''' AND ''' +edtC.Text + ''' THEN ''C'' ' +
                  ' END = ''B'' ';
    end
    else if ckbC.Checked then
    begin
      cliNivel := ' AND CASE WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) <= ' +edtA.Text + ' THEN ''A'' '+
                  ' WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) BETWEEN  ''' +edtA.Text + ''' AND ''' +edtB.Text + ''' THEN ''B'' ' +
                  ' WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) BETWEEN  ''' +edtB.Text + ''' AND ''' +edtC.Text + ''' THEN ''C'' ' +
                  ' END = ''C'' ';
    end
    else
      cliNivel := ' ';
  end;


  if rdgTipoIntevalo.ItemIndex = 0 then
    sFiltros := '(Cad)'
  else if rdgTipoIntevalo.ItemIndex = 1 then
    sFiltros := '(Alt)'
  else if rdgTipoIntevalo.ItemIndex = 2 then
    sFiltros := '(Nasc)'
  else if rdgTipoIntevalo.ItemIndex = 3 then
    sFiltros := '(UltCmp)';

  if not VerificaData(mskDataInicial.Text) then
    Raise exception.Create('Data Inicial inválida!');
  if not VerificaData(mskDataFinal.Text) then
    Raise exception.Create('Data Inicial inválida!');

  if VerificaDataBranco(mskDataInicial.Text) then
    if rdgTipoIntevalo.ItemIndex = 0 then  //DataCadastro
      DATACliIni:=' AND T1.CLI_DT_CADASTRO>="' +MesDia(mskDataInicial.Text)+'" '
    else if rdgTipoIntevalo.ItemIndex = 1 then //DataAlterado
      DATACliIni:=' AND T1.CLI_DT_ALTERADO>="' +MesDia(mskDataInicial.Text)+'" '
    else if rdgTipoIntevalo.ItemIndex = 2 then //DatadeNascimento
      DATACliIni:=' AND T1.CLI_DATA_NASC>="' +MesDia(mskDataInicial.Text)+'" '
    else if rdgTipoIntevalo.ItemIndex = 3 then //DatadeUltimaCompra
      DATACliIni:= ' AND ((SELECT TOP 1 P9.PDV_DATA_HORA FROM PEDIDO_DE_VENDA P9 WHERE P9.PDV_SITUACAO=4 AND P9.CLI_CODIGO=T1.CLI_CODIGO ORDER BY P9.PDV_DATA_HORA DESC) IS NOT NULL) '+
               ' AND ((SELECT TOP 1 P9.PDV_DATA_HORA FROM PEDIDO_DE_VENDA P9 WHERE P9.PDV_SITUACAO=4 AND P9.CLI_CODIGO=T1.CLI_CODIGO ORDER BY P9.PDV_DATA_HORA DESC) >="'+MesDia(mskDataInicial.Text)+'") '
    else if rdgTipoIntevalo.ItemIndex = 4 then //DatadeSPC
      DATACliIni:=' AND T1.CLI_DT_SPC>="' +MesDia(mskDataInicial.Text)+'" ';

  if VerificaDataBranco(mskDataFinal.Text) then
    if rdgTipoIntevalo.ItemIndex = 0 then //DataCadastro
      DATACliFim:=' AND T1.CLI_DT_CADASTRO<"' +MesDia(StrToDate(mskDataFinal.Text)+1)+'" '
    else if rdgTipoIntevalo.ItemIndex = 1 then //DataAlterado
      DATACliFim:=' AND T1.CLI_DT_ALTERADO<"' +MesDia(StrToDate(mskDataFinal.Text)+1)+'" '
    else if rdgTipoIntevalo.ItemIndex = 2 then //DatadeNascimento
      DATACliFim:=' AND T1.CLI_DATA_NASC<"' +MesDia(StrToDate(mskDataFinal.Text)+1)+'" '
    else if rdgTipoIntevalo.ItemIndex = 3 then //DatadeUltimaCompra
      DATACliFim:= ' AND ((SELECT TOP 1 P9.PDV_DATA_HORA FROM PEDIDO_DE_VENDA P9 WHERE P9.PDV_SITUACAO=4 AND P9.CLI_CODIGO=T1.CLI_CODIGO ORDER BY P9.PDV_DATA_HORA DESC) <"'+MesDia(StrToDate(mskDataFinal.Text)+1)+'") '
    else if rdgTipoIntevalo.ItemIndex = 4 then //DatadeSPC
      DATACliFim:=' AND T1.CLI_DT_SPC<"' +MesDia(StrToDate(mskDataFinal.Text)+1)+'" ';

  if ckbValorTotal.Checked then
  Begin
    if not VerificaFloatBranco(edtValorTotal.Text) then
    Begin
      edtValorTotal.SetFocus;
      Raise Exception.Create('Valor Total do Último Pedido inválido!');
    end
    else
    Begin
      Valor:=' AND ((SELECT TOP 1 P9.PDV_TOTAL+P9.PDV_ACRESCIMO FROM PEDIDO_DE_VENDA P9 WHERE P9.PDV_SITUACAO=4 AND P9.CLI_CODIGO=T1.CLI_CODIGO ORDER BY P9.PDV_DATA_HORA DESC) '+cmbValorTotal.Text+VirgPonto(edtValorTotal.Text)+') ';
      sFiltros := sFiltros + ' (Total'+cmbValorTotal.Text+edtValorTotal.Text+')';
    end;
  end;

  if ckbCodigoCNC.Checked then
  Begin
    Centro := ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';
    CentroT1 := ' AND T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';
    CentroT10 := ' AND T10.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';    
    CentroPDV2 := ' AND PDV2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';
    sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
  end
  else
    Centro := ' WHERE (T1.CNC_CODIGO<>-1 OR T1.CNC_CODIGO IS NULL) ';

  if ckbUltimoUsuario.Checked then
    if dblUltimoUsuario.Text ='' then
      Raise Exception.Create('Usuário inválido!')
    else
    Begin
      USU := ' AND T1.USU_CODIGO='+IntToStr(dblUltimoUsuario.KeyValue)+' ';
      sFiltros := sFiltros + '(USU:'+dblUltimoUsuario.Text+')';
    end;

  if ckbClassificacao.Checked then
    if dblClassificacao.Text = '' then
    Begin
      sClassificacao := ' AND T1.CLI_CLASSIFICACAO=0 ';
      sFiltros := sFiltros + '(Claf=0)';
    end
    else
    Begin
      sClassificacao := ' AND T1.CLI_CLASSIFICACAO='+IntToStr(dblClassificacao.KeyValue)+' ';
      sFiltros := sFiltros + '(Claf='+dblClassificacao.Text+')';
    end;

  if ckbTipo.Checked then
    if dblTipo.Text = '' then
    Begin
      sTipo := ' AND T1.CLI_TIPO=0 ';
      sFiltros := sFiltros + '(Tipo=0)';
    end
    else
    Begin
      sTipo := ' AND T1.CLI_TIPO='+IntToStr(dblTipo.KeyValue)+' ';
      sFiltros := sFiltros + '(Tipo='+dblTipo.Text+')';
    end;

  if ckbCreditoNaoZero.Checked then
  Begin
    Cred:=' AND ((T1.CLI_CREDITO < -0.02) OR (T1.CLI_CREDITO > 0.02)) ';
    sFiltros := sFiltros + '(Credito<>0)';
  end;

  if ckbFalhaCNPJCGF.Checked then
  Begin
    sFalhaCNPJCGF := ' AND ((T1.CLI_CGC_CPF<>"" AND T1.CLI_CGC_CPF IS NOT NULL) OR '+
                     ' (T1.CLI_CGF_RG<>"" AND T1.CLI_CGF_RG IS NOT NULL)) ';
    sFiltros := sFiltros + '(Falha CNPJ_CGF)';
  end;
  //
  if ckbEnderecoIncompleto.ItemIndex = 1 then
  Begin
    sEnderecoIncompleto := ' AND ((T1.CLI_ENDERECO="" OR T1.CLI_ENDERECO IS NULL) OR '+
                           '      (T1.CLI_BAIRRO="" OR T1.CLI_BAIRRO IS NULL) OR '+
                           '      (T1.CLI_CIDADE="" OR T1.CLI_CIDADE IS NULL) OR '+
                           '      (T1.CLI_UF="" OR T1.CLI_UF IS NULL) OR '+
                           '      (T1.CLI_FONE="" OR T1.CLI_FONE IS NULL))  ';
    sFiltros := sFiltros + '(End.Incompleto)';
  end
  else if ckbEnderecoIncompleto.ItemIndex = 2 then
  begin
    sEnderecoIncompleto := ' AND ((T1.CLI_ENDERECO<>"" OR T1.CLI_ENDERECO IS NOT NULL) AND '+
                           '      (T1.CLI_BAIRRO<>"" OR T1.CLI_BAIRRO IS NOT NULL) AND '+
                           '      (T1.CLI_CIDADE<>"" OR T1.CLI_CIDADE IS NOT NULL) AND '+
                           '      (T1.CLI_UF<>"" OR T1.CLI_UF IS NOT NULL)) ';
    sFiltros := sFiltros + '(End.Completo)';
  end;
  //
  if ckbSomenteSemTRC.Checked then
  Begin
    sSemTRC := ' AND (T1.CLI_CODIGO NOT IN '+
               ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
               ' WHERE TRC_SITUACAO=0)) ';
    sFiltros := sFiltros + '(SemTRC)';
  end;

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI:=' AND (T1.CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + '(CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoVEN.Checked then
    if dblCodigoVEN.Text = '' then
      Raise Exception.Create('Vendedor(a)/Promotor(a) inválido(a)!')
    else
    Begin
      if DM.Configuracao1.Empresa = empEletro then
        CdVEN:=' AND EXISTS (SELECT T10.PDV_CODIGO '+
               ' FROM PEDIDO_DE_VENDA T10, ITEM_DE_PEDIDO_DE_VENDA IPV '+
               ' WHERE T10.PDV_SITUACAO=4 '+
               CentroT10+
               ' AND IPV.FUN_CODIGO='+IntToStr(dblCodigoVEN.KeyValue)+
               ' AND T10.CNC_CLIENTE=T1.CNC_CODIGO '+
               ' AND T10.CLI_CODIGO=T1.CLI_CODIGO '+
               ' AND T10.CNC_CODIGO=IPV.CNC_CODIGO '+
               ' AND T10.PDV_CODIGO=IPV.PDV_CODIGO '+
               ' AND T10.PDV_CODIGO=(SELECT MAX(PDV2.PDV_CODIGO) '+
               ' FROM PEDIDO_DE_VENDA PDV2 '+
               ' WHERE PDV2.PDV_SITUACAO=4 '+
               CentroPDV2+
               ' AND PDV2.CNC_CLIENTE=T1.CNC_CODIGO '+
               ' AND PDV2.CLI_CODIGO=T1.CLI_CODIGO '+
               ' AND T10.CNC_CLIENTE=PDV2.CNC_CLIENTE '+
               ' AND T10.CLI_CODIGO=PDV2.CLI_CODIGO)) '
      else
        CdVEN:=' AND (T1.CLI_CONJUGE="'+IntToStr(dblCodigoVEN.KeyValue)+'") ';
      sFiltros := sFiltros + '(Vend/Promotor(a):'+dblCodigoVEN.Text+')';
    end;

  //Filtrar Tipo Pessora
  if ckbTipoPessoa.Checked then
    if cmbTipoPessoa.ItemIndex = 0 then
    Begin
      TipoPessoa := ' AND (T1.CLI_PESSOA_FISICA = 1) ';
      sFiltros := sFiltros + '(P.Fisico)';
    end
    else if cmbTipoPessoa.ItemIndex = 1 then
    Begin
      TipoPessoa := ' AND (T1.CLI_PESSOA_FISICA = 0) ';
      sFiltros := sFiltros + '(P.Juridica)';
    end
    else
    Begin
      TipoPessoa := ' AND (T1.CLI_VENDA_ATACADO = 1) ';
      sFiltros := sFiltros + '(Atacado)';
    end;

  if ckbClienteSPC.Checked then
  Begin
    cSPC:=' AND (T1.CLI_SPC='+IntToStr(cmbClienteSPC.ItemIndex)+') ';
    sFiltros := sFiltros + '(SPC:'+cmbClienteSPC.Text+')';
  end;

  if ckbUltimoPagamento.Checked then
  Begin
    if not VerificaDataBranco(mskDataUltimoPagamento.Text) then
      Raise Exception.Create('Data limite de parcelas inválida!');

    case cmbDtPagamento.ItemIndex of
      0: Begin // <
           cUltimaPag:=' AND (SELECT MAX(T.TRC_PAGAMENTO) '+
             ' FROM TITULO_A_RECEBER T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) < "'+MesDiaHora(mskDataUltimoPagamento.Text)+'" ';
           sFiltros := sFiltros + '(Ult.Pag<:'+mskDataUltimoPagamento.Text+')';
         end;
      1: Begin // =
           cUltimaPag:=' AND (SELECT MAX(T.TRC_PAGAMENTO) '+
             ' FROM TITULO_A_RECEBER T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) = "'+MesDiaHora(mskDataUltimoPagamento.Text)+'" ';
           sFiltros := sFiltros + '(Ult.Pag=:'+mskDataUltimoPagamento.Text+')';
         end;
      2: Begin // >
           cUltimaPag:=' AND (SELECT MAX(T.TRC_PAGAMENTO) '+
             ' FROM TITULO_A_RECEBER T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) > "'+MesDiaHora(mskDataUltimoPagamento.Text+' 23:59:59')+'" ';
           sFiltros := sFiltros + '(Ult.Pag>:'+mskDataUltimoPagamento.Text+')';
         end;
      3: Begin // <=
           cUltimaPag:=' AND (SELECT MAX(T.TRC_PAGAMENTO) '+
             ' FROM TITULO_A_RECEBER T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) < "'+MesDiaHora(StrToDate(mskDataUltimoPagamento.Text)+1)+'" ';
           sFiltros := sFiltros + '(Ult.Pag<=:'+mskDataUltimoPagamento.Text+')';
         end;
      4: Begin // >=
           cUltimaPag:=' AND (SELECT MAX(T.TRC_PAGAMENTO) '+
             ' FROM TITULO_A_RECEBER T '+
             ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND T.CLI_CODIGO=T1.CLI_CODIGO) >= "'+MesDiaHora(mskDataUltimoPagamento.Text)+'" ';
           sFiltros := sFiltros + '(Ult.Pag>=:'+mskDataUltimoPagamento.Text+')';
         end;
    end;
  end;

  if ckbSemprePontual.Checked then
  Begin
    if not VerificaInteiroBranco(edtTolerancia.Text) then
      Raise exception.Create('Dias de tolerância inválido!');

    if ckbInadiplente.Checked then
    Begin
      CLIInad:=' AND EXISTS(SELECT T.CLI_CODIGO '+
        ' FROM TITULO_A_RECEBER T '+
        ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T.CLI_CODIGO=T1.CLI_CODIGO '+
        ' AND ((T.TRC_SITUACAO IN (0,1,8) '+
        '       AND T.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") '+
        '   OR (T.TRC_VENCIMENTO<(T.TRC_PAGAMENTO-'+edtTolerancia.Text+')))) ';
      sFiltros := sFiltros + '(InadiplentesAlgumDia-'+edtTolerancia.Text+')';
    end
    else if ckbSomenteAdiplentes.Checked then
    Begin
      CLIInad:=' AND NOT EXISTS(SELECT T.CLI_CODIGO '+
        ' FROM TITULO_A_RECEBER T '+
        ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T.CLI_CODIGO=T1.CLI_CODIGO '+
        ' AND ((T.TRC_SITUACAO IN (0,1,8) '+
        '       AND T.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") '+
        '   OR (T.TRC_VENCIMENTO<(T.TRC_PAGAMENTO-'+edtTolerancia.Text+')))) ';
      sFiltros := sFiltros + '(AdiplentesSempre-'+edtTolerancia.Text+')';
    end
    else
    Begin
      CLIInad:=' AND NOT EXISTS(SELECT T.CLI_CODIGO '+
        ' FROM TITULO_A_RECEBER T '+
        ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T.CLI_CODIGO=T1.CLI_CODIGO '+
        ' AND T.TRC_VENCIMENTO<(T.TRC_PAGAMENTO-'+edtTolerancia.Text+')) ';
      sFiltros := sFiltros + '(SemprePontual-'+edtTolerancia.Text+')';
    end;
  end
  else
  Begin
    if ckbInadiplente.Checked then
    Begin
      CLIInad:=' AND EXISTS(SELECT T.CLI_CODIGO '+
        ' FROM TITULO_A_RECEBER T '+
        ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T.CLI_CODIGO=T1.CLI_CODIGO '+
        ' AND T.TRC_SITUACAO IN (0,1,8) '+
        ' AND T.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") ';
      sFiltros := sFiltros + '(Inadiplentes)';
    end
    else if ckbSomenteAdiplentes.Checked then
    Begin
      CLIInad:=' AND NOT EXISTS(SELECT T.CLI_CODIGO '+
        ' FROM TITULO_A_RECEBER T '+
        ' WHERE T.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T.CLI_CODIGO=T1.CLI_CODIGO '+
        ' AND T.TRC_SITUACAO IN (0,1,8) '+
        ' AND T.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") ';
      sFiltros := sFiltros + '(Adiplentes)';
    end;
  end;

  if ckbSituacao.Checked then
  Begin
    Sit := ' AND (CLI_SITUACAO='+IntToStr(cmbSituacao.ItemIndex)+') ';
    sFiltros := sFiltros + '(Sit:'+cmbSituacao.text+') ';
  end
  else
    Sit := ' AND (CLI_SITUACAO<>4 OR CLI_SITUACAO IS NULL) ';

  if ckbVendaProibida.Checked then
  Begin
    vVendaProibida := ' AND T1.CLI_CODIGO IN (SELECT CLI_CODIGO FROM INFORMACOES_DE_CREDITO '+
      ' WHERE ICR_PROIBIDO = 1 '+
      ' AND CNC_CODIGO=T1.CNC_CODIGO) ';
    sFiltros := sFiltros + '(Cliente Bloqueado) ';
  end
  else if ckbNaoVendaProibida.Checked then
  Begin
    vVendaProibida := ' AND T1.CLI_CODIGO NOT IN '+
      ' (SELECT CLI_CODIGO FROM INFORMACOES_DE_CREDITO '+
      ' WHERE ICR_PROIBIDO = 1 AND CNC_CODIGO=T1.CNC_CODIGO) ';
    sFiltros := sFiltros + '(Cliente não Bloqueado) ';
  end;

  if ckbSomenteLiberadoInadiplencia.Checked then
  Begin
    vLiberadoInad := ' AND T1.CLI_CODIGO IN (SELECT CLI_CODIGO FROM INFORMACOES_DE_CREDITO '+
      ' WHERE ICR_LIBERA_INADIPLENCIA = 1 '+
      ' AND CNC_CODIGO=T1.CNC_CODIGO) ';
    sFiltros := sFiltros + '(Liberado Inad.) ';
  end;

  if ckbConvenio.Checked then
    if not VerificaInteiroBranco(edtConvenio.Text) then
      Raise Exception.Create('Código do Convênio inválido!')
    else
    Begin
      CdConvenio:=' AND (T1.CLI_CONVENIO='+edtConvenio.Text+') ';
      sFiltros := sFiltros + '(Convenio:'+edtConvenio.Text+')';
    end;

  if ckbSuperiorVendedor.Checked then
    if dblSuperiorVendedor.Text = '' then
    Begin
      sSuperiorVendedor:=' AND EXISTS (SELECT FUN_CODIGO '+
        ' FROM FUNCIONARIO F1 '+
        ' WHERE F1.FUN_CODIGO=T1.CLI_CONJUGE '+
        ' AND F1.FUN_SUPERIOR=0) ';
      sFiltros := sFiltros + '(Superior:0)';
    end
    else
    Begin
      sSuperiorVendedor:=' AND EXISTS (SELECT FUN_CODIGO '+
        ' FROM FUNCIONARIO F1 '+
        ' WHERE F1.FUN_CODIGO=T1.CLI_CONJUGE '+
        ' AND F1.FUN_SUPERIOR='+IntToStr(dblSuperiorVendedor.KeyValue)+') ';
      sFiltros := sFiltros + '(Superior:'+dblSuperiorVendedor.Text+')';
    end;

  if ckbParceiroVendedor.Checked then
    if dblParceiroVendedor.Text = '' then
    Begin
      sParceiroVendedor:=' AND EXISTS (SELECT FUN_CODIGO '+
        ' FROM FUNCIONARIO F1 '+
        ' WHERE F1.FUN_CODIGO=T1.CLI_CONJUGE '+
        ' AND F1.FUN_PARCEIRO=0) ';
      sFiltros := sFiltros + '(Parceiro:0)';
    end
    else
    Begin
      sParceiroVendedor:=' AND EXISTS (SELECT FUN_CODIGO '+
        ' FROM FUNCIONARIO F1 '+
        ' WHERE F1.FUN_CODIGO=T1.CLI_CONJUGE '+
        ' AND F1.FUN_PARCEIRO='+IntToStr(dblParceiroVendedor.KeyValue)+') ';
      sFiltros := sFiltros + '(Parceiro:'+dblParceiroVendedor.Text+')';
    end;

  case cmbOrdem.ItemIndex of
    0: Ordem:=' ORDER BY T1.CNC_CODIGO,T1.CLI_CODIGO ';
    1: Ordem:=' ORDER BY T1.CNC_CODIGO,T1.CLI_RZ_SOCIAL ';
    2: Ordem:=' ORDER BY T1.CNC_CODIGO,T1.CLI_UF,T1.CLI_CIDADE,T1.CLI_BAIRRO,T1.CLI_ENDERECO ';
    3: Ordem:=' ORDER BY T1.CNC_CODIGO,T1.CLI_DATA_NASC ';
    4: Ordem:=' ORDER BY T1.CNC_CODIGO,T1.CLI_DT_CADASTRO ';
    5: Ordem:=' ORDER BY T1.CNC_CODIGO,T1.CLI_CONJUGE,T1.CLI_RZ_SOCIAL ';
    6: Ordem:=' ORDER BY T1.CNC_CODIGO,T1.CLI_BAIRRO '; //Solicitação em 20/10/2011
  end;

  if not ckbMalaDireta.Checked then //Não e´Mala Direta
  Begin
    if not ckbAniversariantes.Checked then
    Begin
      if not ckbRelCadastro.Checked then
      Begin
        Application.CreateForm(Trpt_cliente, rpt_cliente);
        with rpt_cliente do
        Begin
          Tag := 0;
          zrlFiltros.Caption := sFiltros;
          if ckbAgruparPorVendedor.Checked then
          Begin
            zrbGrupoVendedor.Expression := 'CLI_CONJUGE';
          end
          else
          Begin
            zrbGrupoVendedor.Expression := '';
            zrbGrupoVendedor.Height := 0;
          end;

          if ckbSintetico.Checked then
          Begin
            zrbGrupoCNC.Height := 1;
            zrlLinhaDupla.Height := 0;
            zdbCodigoCLI.Top := 0;
            zdbRazaoSocial.Top := 0;
            zdbFone.Top := 0;
            zdbFax.Top := 0;
            zdvCelular.Top := 0;
            zdbCPF.Top := 0;
            if ckbNivel.Checked then
            begin
              SZRLabel1.Enabled := true;
              SZRDBText3.Enabled := true;
              SZRLabel7.Enabled := true;
              SZRDBText5.Enabled := true;

              if ckbSuperSintetico.Checked then
                zrbDetalhe.Height := 2
              else
              Begin
                zrbDetalhe.Height := 3;
                zrlEndereco.Top := 2;
                zrlObservacao.Top := 2;
              end;
            end
            else
            begin
              SZRLabel1.Enabled := false;
              SZRDBText3.Enabled := false;
              SZRLabel7.Enabled := false;
              SZRDBText5.Enabled := false;

              if ckbSuperSintetico.Checked then
                zrbDetalhe.Height := 1
              else
              Begin
                zrbDetalhe.Height := 2;
                zrlEndereco.Top := 1;
                zrlObservacao.Top := 1;
              end;
            end;
          end;
          vVerificaCNPJCGF := ckbFalhaCNPJCGF.Checked;
          Cliente1.Close;

          if ckbNivel.Checked then
          begin
            SZRLabel1.Enabled := true;
            SZRDBText3.Enabled := true;
            SZRLabel7.Enabled := true;
            SZRDBText5.Enabled := true;

            Cliente1.SQL.Text:='SELECT T2.PDV_CODIGO, T2.TRC_CODIGO, CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) AS DIAS, '+
                               ' CASE WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) <= ' +edtA.Text + ' THEN ''A'' '+
                               ' WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) BETWEEN  ''' +edtA.Text + ''' AND ''' +edtB.Text + ''' THEN ''B'' ' +
                               ' WHEN CONVERT(INT, T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) BETWEEN  ''' +edtB.Text + ''' AND ''' +edtC.Text + ''' THEN ''C'' ' +
                               ' END AS NIVEL, T1.* FROM CLIENTE T1 '+
                               ' INNER JOIN TITULO_A_RECEBER T2 ON T1.CLI_CODIGO = T2.CLI_CODIGO AND T1.CNC_CODIGO = T2.CNC_CODIGO '+
                               ' WHERE NOT (T2.TRC_PAGAMENTO IS NULL) AND (T2.TRC_PAGAMENTO - T2.TRC_VENCIMENTO) > 0 '+
                               ' AND T2.TRC_CODIGO = (SELECT MAX(T3.TRC_CODIGO) FROM TITULO_A_RECEBER T3 '+
              Centro+USU+Cred+Sit+vVendaProibida+vLiberadoInad+sSuperiorVendedor+sParceiroVendedor+cliNivel+
              DATACliIni+DATACliFim+CdCLI+CdConvenio+cSPC+cUltimaPag+CLIInad+TipoPessoa+Valor+
              CdVEN+cUltimaCompra+sClassificacao+sTipo+sFalhaCNPJCGF+sEnderecoIncompleto+
              sSemTRC+
              ' AND T1.CLI_CODIGO = T3.CLI_CODIGO AND NOT T3.TRC_PAGAMENTO IS NULL) '+Ordem;
          end
          else
          begin
            SZRLabel1.Enabled := false;
            SZRDBText3.Enabled := false;
            SZRLabel7.Enabled := false;
            SZRDBText5.Enabled := false;
            
            Cliente1.SQL.Text:='SELECT * FROM CLIENTE T1 '+
              Centro+USU+Cred+Sit+vVendaProibida+vLiberadoInad+sSuperiorVendedor+sParceiroVendedor+
              DATACliIni+DATACliFim+CdCLI+CdConvenio+cSPC+cUltimaPag+CLIInad+TipoPessoa+Valor+
              CdVEN+cUltimaCompra+sClassificacao+sTipo+sFalhaCNPJCGF+sEnderecoIncompleto+
              sSemTRC+Ordem;
          end;
          Cliente1.Open;
          if Cliente1.IsEmpty then
          Begin
            ShowMessage('Consulta Vazia!');
            Exit;
          end;
          zrlDataINI.Caption  := mskDataInicial.text;
          zrlDataFIM.Caption  := mskDataFinal.text;
          report.Preview;
          Close;
        end;
      end
      else //Relatório em forma de cadastro
      Begin
        Application.CreateForm(Trpt_clienteCadastro, rpt_clienteCadastro);
        with rpt_clienteCadastro do
        Begin
          Tag := 0;
          zrlFiltros.Caption := sFiltros;
          if ckbAgruparPorVendedor.Checked then
          Begin
            zrbGrupoVendedor.Expression := 'CLI_CONJUGE';
          end
          else
          Begin
            zrbGrupoVendedor.Expression := '';
            zrbGrupoVendedor.Height := 0;
          end;

          if ckbSintetico.Checked then
          Begin
            zrbGrupoCNC.Height := 1;
            zrlLinhaDupla.Height := 0;
            zdbCodigoCLI.Top := 0;
            zdbRazaoSocial.Top := 0;
            zdbFone.Top := 0;
            zdbFax.Top := 0;
            zdvCelular.Top := 0;
            zdbCPF.Top := 0;
            if ckbSuperSintetico.Checked then
              zrbDetalhe.Height := 1
            else
            Begin
              zrbDetalhe.Height := 2;
              zrlEndereco.Top := 1;
              zrlObservacao.Top := 1;
            end;
          end;
          vVerificaCNPJCGF := ckbFalhaCNPJCGF.Checked;
          Cliente1.Close;
          Cliente1.SQL.Text:='SELECT * FROM CLIENTE T1 '+
            Centro+USU+Cred+Sit+vVendaProibida+vLiberadoInad+sSuperiorVendedor+sParceiroVendedor+
            DATACliIni+DATACliFim+CdCLI+CdConvenio+cSPC+cUltimaPag+CLIInad+TipoPessoa+Valor+
            CdVEN+cUltimaCompra+sClassificacao+sTipo+sFalhaCNPJCGF+sEnderecoIncompleto+
            sSemTRC+Ordem;
          Cliente1.Open;
          if Cliente1.IsEmpty then
          Begin
            ShowMessage('Consulta Vazia!');
            Exit;
          end;
          zrlDataINI.Caption  := mskDataInicial.text;
          zrlDataFIM.Caption  := mskDataFinal.text;
          report.Preview;
          Close;
        end;
      end;
    end
    else //Aniversariantes
    Begin
      if not VerificaInteiro(edtDiaAniversario.Text) then
        Raise Exception.Create('Dia de aniversário inválido!')
      else if edtDiaAniversario.Text <> '' then
      Begin
        if StrToInt(edtDiaAniversario.Text) < 10 then
          edtDiaAniversario.Text := '0'+IntToStr(StrToInt(edtDiaAniversario.Text));
        if (StrToInt(edtDiaAniversario.Text)<1) or (StrToInt(edtDiaAniversario.Text)>31) then
          Raise Exception.Create('Dia de aniversário inválido!');
      end;
      Application.CreateForm(TfMxSelAniversario, fMxSelAniversario);
      fMxSelAniversario.tag:=0;
      fMxSelAniversario.ShowModal;
    end;
  end
  else //Mala Direta
  Begin
    if Trim(edtArquivoMalaDireta.Text) = '' then
      Raise exception.Create('Nome do Arquivo inválido!');
    Etiquetas1.ArquivoDeEtiquetas := edtArquivoMalaDireta.Text;

    with Etiquetas1 do
    Begin
      Close;
      if ckbAniversariantes.Checked then
      Begin
        if not VerificaInteiro(edtDiaAniversario.Text) then
          Raise Exception.Create('Dia de aniversário inválido!')
        else if edtDiaAniversario.Text <> '' then
        Begin
          if StrToInt(edtDiaAniversario.Text) < 10 then
            edtDiaAniversario.Text := '0'+IntToStr(StrToInt(edtDiaAniversario.Text));
          if (StrToInt(edtDiaAniversario.Text)<1) or (StrToInt(edtDiaAniversario.Text)>31) then
            Raise Exception.Create('Dia de aniversário inválido!');
        end;

        sAniversarico1 := '';
        sAniversarico2 := '';
        if not fMxSelCliente.ckbAniversarioContato.Checked then
        Begin
          sAniversarico1 := ' AND DATEPART(mm,T1.CLI_DATA_NASC)='+IntToStr(cmbMesAniversario.ItemIndex+1);
          if edtDiaAniversario.Text <> '' then
            sAniversarico2 := ' AND DATEPART(dd,T1.CLI_DATA_NASC)='+edtDiaAniversario.Text;
        end
        else if fMxSelCliente.edtDiaAniversario.Text = '' then
        Begin
           sAniversarico1 := ' AND EXISTS (SELECT FOR_CODIGO FROM CONTATO C10 '+
             ' WHERE C10.CNC_FOR=T1.CNC_CODIGO '+
             ' AND C10.FOR_CODIGO=T1.CLI_CODIGO '+
             ' AND DATEPART(mm,C10.CNT_DT_NASCIMENTO)='+IntToStr(cmbMesAniversario.ItemIndex+1)+') ';
        end
        else
           sAniversarico1 := ' AND EXISTS (SELECT FOR_CODIGO FROM CONTATO C10 '+
             ' WHERE C10.CNC_FOR=T1.CNC_CODIGO '+
             ' AND C10.FOR_CODIGO=T1.CLI_CODIGO '+
             ' AND DATEPART(mm,C10.CNT_DT_NASCIMENTO)='+IntToStr(cmbMesAniversario.ItemIndex+1)+
             ' AND DATEPART(dd,C10.CNT_DT_NASCIMENTO)='+edtDiaAniversario.Text+') ';

        if DM.Configuracao1.SqlInterbase = 1 then
        Begin
          SQL.Text:='SELECT * FROM CLIENTE T1 '+
            Centro+USU+Cred+Sit+DATACliIni+DATACliFim+CdCLI+CdConvenio+TipoPessoa+Valor+
            cSPC+cUltimaPag+CLIInad+vVendaProibida+vLiberadoInad+CdVEN+cUltimaCompra+sClassificacao+sTipo+
            sFalhaCNPJCGF+sEnderecoIncompleto+sSemTRC+sSuperiorVendedor+sParceiroVendedor+
            sAniversarico1+
            sAniversarico2+
            Ordem;
          Open;
          if IsEmpty then
          Begin
            ShowMessage('Consulta Vazia!');
            Exit;
          end;
          LimpaEtiquetas;
          while not Etiquetas1.EOF do
          begin
            QtdEtiquetas:=QtdEtiquetas+1;
            AdicionarEtiqueta(CodigoCLI,Convenio,RazaoSocial,NomeFantasia,Fone,Fax,Celular,EMail,Endereco,Bairro,Cidade,Uf,CEP,CGFRG,CPFCGC,OBS);
            Next;
          end;
        end
        else
        Begin
          SQL.Text:='SELECT * FROM CLIENTE T1 '+
            Centro+USU+Cred+Sit+DATACliIni+DATACliFim+CdCLI+CdConvenio+Valor+
            TipoPessoa+cSPC+cUltimaPag+CLIInad+vVendaProibida+vLiberadoInad+CdVEN+sClassificacao+sTipo+
            sFalhaCNPJCGF+sEnderecoIncompleto+sSemTRC+sSuperiorVendedor+sParceiroVendedor+
            cUltimaCompra+' AND T1.CLI_DATA_NASC>="12/31/1800" '+Ordem;

          Open;
          if IsEmpty then
          Begin
            ShowMessage('Consulta Vazia!');
            Exit;
          end;
          LimpaEtiquetas;
          while not Etiquetas1.EOF do
          begin
            if edtDiaAniversario.Text = '' then
            Begin
              if (StrToInt(FormatDateTime('mm',DataNascimento)) = cmbMesAniversario.ItemIndex+1) then
              Begin
                if (not ckbFalhaCNPJCGF.Checked) or
                   (not VerificaCPFCNPJBranco(CPFCGC)) then
                Begin
                  QtdEtiquetas:=QtdEtiquetas+1;
                  AdicionarEtiqueta(CodigoCLI,Convenio,RazaoSocial,NomeFantasia,Fone,Fax,Celular,EMail,Endereco,Bairro,Cidade,Uf,CEP,CGFRG,CPFCGC,OBS);
                end;
              end;
            end
            else
            Begin
              if (StrToInt(FormatDateTime('mm',DataNascimento)) = cmbMesAniversario.ItemIndex+1) AND
                 (FormatDateTime('dd',DataNascimento) = edtDiaAniversario.Text) then
              Begin
                if (not ckbFalhaCNPJCGF.Checked) or
                   (not VerificaCPFCNPJBranco(CPFCGC)) then
                Begin
                  QtdEtiquetas:=QtdEtiquetas+1;
                  AdicionarEtiqueta(CodigoCLI,Convenio,RazaoSocial,NomeFantasia,Fone,Fax,Celular,EMail,Endereco,Bairro,Cidade,Uf,CEP,CGFRG,CPFCGC,OBS);
                end;
              end;
            end;
            Next;
          end;
        end;
      end
      else //Não é de aniversariantes
      Begin
        SQL.Text:='SELECT * FROM CLIENTE T1 '+
          Centro+USU+Cred+Sit+DATACliIni+DATACliFim+vVendaProibida+vLiberadoInad+
          CdCLI+CdConvenio+TipoPessoa+cSPC+cUltimaPag+CLIInad+CdVEN+sClassificacao+sTipo+Valor+cUltimaCompra+
          sSuperiorVendedor+sParceiroVendedor+
          sFalhaCNPJCGF+sEnderecoIncompleto+sSemTRC+Ordem;
        Open;
        if IsEmpty then
        Begin
          ShowMessage('Consulta Vazia!');
          Exit;
        end;

        if ckbExportar.Checked then   //Modelo para exportar dados
        Begin
          AssignFile(ArqExportar, ArquivoDeEtiquetas);
          Rewrite(ArqExportar);

          //Cabecalho
          sLinha :=          '0';                                      //Registro de Cabecalho
          sLinha := sLinha + PreencheZero(2,DM.Configuracao1.Empresa); //Código da Empresa
          sLinha := sLinha + PreencheEspaco(30, 'SACI');               //Nome do Programa de Exportação
          sLinha := sLinha + '2';                                      //Arquivo de Saída do SACI
          sLinha := sLinha + FormatDateTime('DDMMYYYYHHMM', DM.Configuracao1.DataHora); //DataHora Geração do Arquivo
          sLinha := sLinha + PreencheZero(6,1);                        //Sequêncial do Arquivo
          sLinha := sLinha + PreencheZero(3,10);                       //Versão do Leiaute
          sLinha := sLinha + PreencheZero(2,1);                        //Tipo de Operação (CLIENTE)
          sLinha := sLinha + PreencheEspaco(255,'TESTE DE OBSERVACAO');//Observacao do Arquivo
          Writeln(ArqExportar, sLinha);

          iMenorCod := 0;
          iMaiorCod := 0;

          while not Etiquetas1.EOF do
          begin
            if (not ckbFalhaCNPJCGF.Checked) or
               (not VerificaCPFCNPJBranco(CPFCGC)) then
            Begin
              if (iMenorCod = 0) or
                 (CodigoCLI < iMenorCod) then
                iMenorCod := CodigoCLI;

              if (CodigoCLI > iMaiorCod) then
                iMaiorCod := CodigoCLI;

              Informacoes1.Close;
              Informacoes1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
              Informacoes1.ParamByName('CLI_CODIGO').asInteger := CodigoCLI;
              Informacoes1.Open;

              //Segmento A0
              sLinha :=          '1';                                      //Registro de Detalhe
              sLinha := sLinha + 'A0';                                     //Cód. Segmento
              sLinha := sLinha + PreencheZero(8,QtdEtiquetas);             //Seq. do Segmento
              sLinha := sLinha + '2';                                      //Inserir/Alterar
              sLinha := sLinha + PreencheZero(8,CodigoCLI);                //Código no SACI
              sLinha := sLinha + PreencheEspaco(20,CPFCGC);                //CPF/CNPJ
              sLinha := sLinha + IntToStr(Situacao);                       //Situação do CLiente
              Writeln(ArqExportar, sLinha);

              //Segmento A1
              sLinha :=          '1';                                      //Registro de Detalhe
              sLinha := sLinha + 'A1';                                     //Cód. Segmento
              sLinha := sLinha + PreencheZero(8,QtdEtiquetas);             //Seq. do Segmento
              if DataNascimento > 0 then                                   //Data de Nascimento
                sLinha := sLinha + FormatDateTime('DDMMYYYY', DataNascimento)
              else
                sLinha := sLinha + '00000000';
              if PessoaFisica then                                         //Tipo de Pessoa
                sLinha := sLinha + '1'
              else
                sLinha := sLinha + '0';
              if VendaAtacado then                                         //Tipo Atacado
                sLinha := sLinha + '1'
              else
                sLinha := sLinha + '0';
              sLinha := sLinha + PreencheZero(10,Trunc(Desconto*100));     //Desconto no Cadastro
              sLinha := sLinha + IntToStr(Orgao);                          //Órgão
              sLinha := sLinha + PreencheEspaco(60, RazaoSocial);          //Razão Social
              sLinha := sLinha + PreencheEspaco(60, NomeFantasia);         //Nome Fantasia/Apelido
              sLinha := sLinha + PreencheEspaco(20, CGFRG);                //CGFRG
              if (not Parametro1.Active) or
                 (Parametro1.CodigoPAR <> Logradouro) then
              Begin
                Parametro1.Close;
                Parametro1.ParamByName('PAR_CODIGO').asInteger := Logradouro;
                Parametro1.Open;
              end;
              sLinha := sLinha + PreencheEspaco(30,  Parametro1.Descricao);//Logradouro
              sLinha := sLinha + PreencheEspaco(40,  Endereco);            //Endereço
              sLinha := sLinha + PreencheEspaco(20,  Bairro);              //Bairro
              sLinha := sLinha + PreencheEspaco(20,  Cidade);              //Cidade
              sLinha := sLinha + PreencheEspaco(2,   Uf);                  //UF
              sLinha := sLinha + PreencheEspaco(20,  CEP);                 //CEP
              sLinha := sLinha + PreencheEspaco(20,  Fone);                //Fone
              sLinha := sLinha + PreencheEspaco(20,  Fax);                 //Fax
              sLinha := sLinha + PreencheEspaco(20,  Celular);             //Celular
              sLinha := sLinha + PreencheEspaco(50,  Pai);                 //Nome do Pai
              sLinha := sLinha + PreencheEspaco(50,  Mae);                 //Nome da Mae
              sLinha := sLinha + PreencheEspaco(50,  Conjuge);             //Cônjuge
              sLinha := sLinha + PreencheEspaco(100, Identificacao);       //Identificação
              sLinha := sLinha + PreencheEspaco(255, OBS);                 //Observação
              Writeln(ArqExportar, sLinha);

              //Segmento A2
              sLinha :=          '1';                                      //Registro de Detalhe
              sLinha := sLinha + 'A2';                                     //Cód. Segmento
              sLinha := sLinha + PreencheZero(8,QtdEtiquetas);             //Seq. do Segmento
              if Mensal then                                               //Tipo de Fat. Pendente
                sLinha := sLinha + '3' //Mensal
              else if Quinzenal then
                sLinha := sLinha + '2' //Quinzenal
              else
                sLinha := sLinha + '1';//Semanal
              if Nota then                                                 //Emissão de Nota Imediata
                sLinha := sLinha + '1'
              else
                sLinha := sLinha + '0';
              sLinha := sLinha + PreencheZero(8,Classificacao);            //Cód. Classificação
              sLinha := sLinha + PreencheZero(8,Tipo);                     //Cód. Tipo
              sLinha := sLinha + PreencheEspaco(255, LocalTrabalho);       //Local de Trabalho
              sLinha := sLinha + PreencheEspaco(100, Profissao);           //Profissão/Ramo de Atividade
              sLinha := sLinha + PreencheEspaco(100, Site);                //Site
              sLinha := sLinha + PreencheEspaco(100, EMail);               //Site
              sLinha := sLinha + PreencheEspaco(100, Referencia1);         //Referencia1
              sLinha := sLinha + PreencheEspaco(100, Referencia2);         //Referencia2
              sLinha := sLinha + PreencheEspaco(100, Referencia3);         //Referencia3
              Writeln(ArqExportar, sLinha);

              //Segmento A3
              sLinha :=          '1';                                      //Registro de Detalhe
              sLinha := sLinha + 'A3';                                     //Cód. Segmento
              sLinha := sLinha + PreencheZero(8, QtdEtiquetas);            //Seq. do Segmento
              sLinha := sLinha + PreencheZero(4, ConvenioCNC);             //CNC do Convênio
              sLinha := sLinha + PreencheZero(8, Convenio);                //Cód. do Convênio
              sLinha := sLinha + PreencheZero(10,Trunc(Informacoes1.LimiteCreditoConvenio*100)); //Limite de Convênio
              Writeln(ArqExportar, sLinha);

              //Segmento A4
              sLinha :=          '1';                                      //Registro de Detalhe
              sLinha := sLinha + 'A4';                                     //Cód. Segmento
              sLinha := sLinha + PreencheZero(8, QtdEtiquetas);            //Seq. do Segmento
              sLinha := sLinha + PreencheZero(8, Informacoes1.CodigoAVL);  //Código do Avalista
              sLinha := sLinha + PreencheZero(8, Informacoes1.CodigoFPG);  //Código da Forma de Pagamento
              sLinha := sLinha + PreencheZero(10,Trunc(Informacoes1.RendaMensal*100));   //Renda Mensal
              sLinha := sLinha + PreencheZero(10,Trunc(Informacoes1.LimiteCredito*100)); //Limite de Crédito Pessoal
              if (not Parametro1.Active) or
                 (Parametro1.CodigoPAR <> Informacoes1.Logradouro) then
              Begin
                Parametro1.Close;
                Parametro1.ParamByName('PAR_CODIGO').asInteger := Informacoes1.Logradouro;
                Parametro1.Open;
              end;
              sLinha := sLinha + PreencheEspaco(30, Parametro1.Descricao); //Logradouro de Cobrança
              sLinha := sLinha + PreencheEspaco(40, Informacoes1.Endereco);//Endereço de Cobrança
              sLinha := sLinha + PreencheEspaco(20, Informacoes1.Bairro);  //Bairro de Cobrança
              sLinha := sLinha + PreencheEspaco(20, Informacoes1.Cidade);  //Cidade de Cobrança
              sLinha := sLinha + PreencheEspaco(2,  Informacoes1.Uf);      //UF de Cobrança
              sLinha := sLinha + PreencheEspaco(20, Informacoes1.CEP);     //CEP de Cobrança
              Writeln(ArqExportar, sLinha);

              inc(QtdEtiquetas);
            end;
            Next;
          end;
          //Rodapé
          sLinha :=          '2';                                          //Registro de Rodape
          sLinha := sLinha + PreencheZero(8, QtdEtiquetas);                //Qtd Reg. Principais
          sLinha := sLinha + PreencheZero(8, 2+(5*QtdEtiquetas));          //Qtd Reg. Gerais
          sLinha := sLinha + PreencheZero(8, iMenorCod);                   //Menor Código
          sLinha := sLinha + PreencheZero(8, iMaiorCod);                   //Maior Código
          Writeln(ArqExportar, sLinha);
          CloseFile(ArqExportar);

        end
        else //Modelo para mala direta
        Begin
          if ckbEtiquetas.Checked then
          begin
            //Limpa Etiquetas
            AssignFile(ArqExportar2, edtArquivoMalaDireta.Text);
            Rewrite(ArqExportar2);
            Writeln(ArqExportar2, 'codbarras;codigo;razaosocial;apelido;RG;CPF;convenio');

            //Adiciona no Arquivo
            while not Etiquetas1.EOF do
            begin

              if (not ckbFalhaCNPJCGF.Checked) or
                 (not VerificaCPFCNPJBranco(CPFCGC)) then
              begin
                QtdEtiquetas:=QtdEtiquetas+1;

                CodBarras := inttostr(CodigoCLI);

                for i := 1 to length(CodBarras) do
                  if CodBarras[i]='0' then
                    CodBarras[i]:='C'
                  else
                    if CodBarras[i]='6' then
                      CodBarras[i]:='D';

                if Convenio = 0 then
                  Writeln(ArqExportar2, PreencheE(CodBarras, 'C', 6)+';'+inttostr(CodigoCLI)+';'+RazaoSocial+';'+
                  NomeFantasia+';'+CGFRG+';'+CPFCGC+';')
                 else
                  Writeln(ArqExportar2, PreencheE(CodBarras, 'C', 6)+';'+inttostr(CodigoCLI)+';'+RazaoSocial+';'+
                  NomeFantasia+';'+CGFRG+';'+CPFCGC+';'+inttostr(Convenio));
              end;

              Next;
            end;

            CloseFile(ArqExportar2);
          end
          else
          begin
            LimpaEtiquetas;
            while not Etiquetas1.EOF do
            begin
              if (not Parametro1.Active) or
                 (Parametro1.CodigoPAR <> Logradouro) then
              Begin
                Parametro1.Close;
                Parametro1.ParamByName('PAR_CODIGO').asInteger:=Logradouro;
                Parametro1.Open;
              end;
              EnderecoCompleto := Trim(Parametro1.Descricao+' '+Endereco);

              if (not ckbFalhaCNPJCGF.Checked) or
                 (not VerificaCPFCNPJBranco(CPFCGC)) then
              Begin
                QtdEtiquetas:=QtdEtiquetas+1;
                AdicionarEtiqueta(CodigoCLI,Convenio,RazaoSocial,NomeFantasia,Fone,Fax,Celular,EMail,EnderecoCompleto,Bairro,Cidade,Uf,CEP,CGFRG,CPFCGC,OBS);
              end;
              Next;
            end;
          end;
        end;
      end;
      try
        FechaEtiquetas;
      except
      end;
      Close;
      ShowMessage('Arquivo gerado com sucesso !'+#13+IntToStr(QtdEtiquetas)+' registros!');
    end;
  end;
end;

procedure TfMxSelCliente.SpeedButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Usuario1.Close;
  Action:=caFree;
end;

procedure TfMxSelCliente.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbOrdem.ItemIndex:=1;
end;

procedure TfMxSelCliente.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelCliente.ckbUltimoUsuarioClick(Sender: TObject);
begin
  if ckbUltimoUsuario.Checked then
  Begin
    Usuario1.Open;
    dblUltimoUsuario.Color:=clWindow;
    dblUltimoUsuario.Enabled:=True;
    dblUltimoUsuario.KeyValue:=DM.Configuracao1.CodigoUSU;
    dblUltimoUsuario.SetFocus;
  end
  else
  Begin
    Usuario1.Close;
    dblUltimoUsuario.Color:=AlteraCorComponentes;
    dblUltimoUsuario.Enabled:=False;
    dblUltimoUsuario.KeyValue:=-1;
  end;
end;

procedure TfMxSelCliente.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=12;
    fCadCli.CentroCusto2.open;
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxSelCliente.ckbCodigoCLIClick(Sender: TObject);
begin
  if ckbCodigoCLI.Checked then
  Begin
    edtCodigoCLI.Color:=clWindow;
    edtCodigoCLI.Enabled:=True;
    edtCodigoCLI.SetFocus;
  end
  else
  Begin
    edtCodigoCLI.Color:=AlteraCorComponentes;
    edtCodigoCLI.Text:='';
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.ckbAniversariantesClick(Sender: TObject);
begin
  if ckbAniversariantes.Checked then
  Begin
    ckbAniversarioContato.Enabled := True;
    cmbMesAniversario.Enabled:=True;
    cmbMesAniversario.Color:=clWindow;
    cmbMesAniversario.ItemIndex:=0;
    edtDiaAniversario.Enabled:=True;
    edtDiaAniversario.Color:=clWindow;
    cmbMesAniversario.SetFocus;
  end
  else
  Begin
    ckbAniversarioContato.Checked := False;  
    ckbAniversarioContato.Enabled := False;
    cmbMesAniversario.Enabled:=False;
    cmbMesAniversario.Color:=AlteraCorComponentes;
    cmbMesAniversario.ItemIndex:=-1;
    edtDiaAniversario.Enabled:=False;
    edtDiaAniversario.Color:=AlteraCorComponentes;
    edtDiaAniversario.Clear;
  end;
end;

procedure TfMxSelCliente.ckbClienteSPCClick(Sender: TObject);
begin
  if ckbClienteSPC.Checked then
  Begin
    cmbClienteSPC.Enabled:=True;
    cmbClienteSPC.Color:=clWindow;
    cmbClienteSPC.ItemIndex:=0;
  end
  else
  Begin
    cmbClienteSPC.Enabled:=False;
    cmbClienteSPC.Color:=AlteraCorComponentes;
    cmbClienteSPC.ItemIndex:=-1;
  end;
end;

procedure TfMxSelCliente.ckbUltimoPagamentoClick(Sender: TObject);
begin
  if ckbUltimoPagamento.Checked then
  Begin
    cmbDtPagamento.Enabled:=True;
    cmbDtPagamento.Color:=clWindow;
    cmbDtPagamento.ItemIndex := 3; //<=
    mskDataUltimoPagamento.Enabled:=True;
    mskDataUltimoPagamento.Color:=clWindow;
    mskDataUltimoPagamento.Text:=DateToStr(DM.Configuracao1.Data);
    mskDataUltimoPagamento.SetFocus;
  end
  else
  Begin
    cmbDtPagamento.Enabled:=False;
    cmbDtPagamento.Color:=AlteraCorComponentes;
    cmbDtPagamento.ItemIndex := -1; //<=
    mskDataUltimoPagamento.Enabled:=False;
    mskDataUltimoPagamento.Color:=AlteraCorComponentes;
    mskDataUltimoPagamento.Clear;
  end;
end;

procedure TfMxSelCliente.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Enabled:=True;
    cmbSituacao.Color:=clWindow;
    cmbSituacao.ItemIndex:=1;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Enabled:=False;
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
  end;
end;

procedure TfMxSelCliente.ckbInadiplenteClick(Sender: TObject);
begin
  if ckbInadiplente.Checked then
    ckbSomenteAdiplentes.Checked := False;
end;

procedure TfMxSelCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(27) then
    Close;
end;

procedure TfMxSelCliente.ckbTipoPessoaClick(Sender: TObject);
begin
  if ckbTipoPessoa.Checked then
  Begin
    cmbTipoPessoa.Enabled:=True;
    cmbTipoPessoa.Color:=clWindow;
    cmbTipoPessoa.ItemIndex:=0;
    cmbTipoPessoa.SetFocus;
  end
  else
  Begin
    cmbTipoPessoa.Enabled:=False;
    cmbTipoPessoa.Color:=AlteraCorComponentes;
    cmbTipoPessoa.ItemIndex:=-1;
  end;
end;

procedure TfMxSelCliente.ckbCodigoVENClick(Sender: TObject);
begin
  if ckbCodigoVEN.Checked then
  Begin
    Vendedor1.Close;
    Vendedor1.SQL.Text := 'SELECT * FROM FUNCIONARIO ';

    if (DM.Configuracao1.Empresa = empHope) then
      Vendedor1.SQL.Add(' WHERE FUN_FUNCAO=4400 ')
    else
      Vendedor1.SQL.Add(' WHERE (FUN_APARECE_VENDAS=1 '+
                        '  OR FUN_APARECE_SERVICOS=1)');

    if ckbCodigoCNC.Checked then
      Vendedor1.SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
        '  OR  FUN_TODOS_CENTROS=1) ');


    Vendedor1.SQL.Add(' AND FUN_SITUACAO<>1 ');
    Vendedor1.SQL.Add(' ORDER BY FUN_APELIDO ASC ');
    Vendedor1.Open;
    dblCodigoVEN.Color:=clWindow;
    dblCodigoVEN.Enabled:=True;
    dblCodigoVEN.KeyValue:=Vendedor1.CodigoFUN;
    dblCodigoVEN.SetFocus;
  end
  else
  Begin
    Vendedor1.Close;
    dblCodigoVEN.Color:=AlteraCorComponentes;
    dblCodigoVEN.KeyValue:=-1;
    dblCodigoVEN.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.ckbClassificacaoClick(Sender: TObject);
begin
  if ckbClassificacao.Checked then
  Begin
    Parametro4.Close;
    Parametro4.SQL.Text := 'SELECT * FROM PARAMETRO '+
      ' WHERE TPR_CODIGO=60 '+
      ' AND PAR_SITUACAO<>1 ';
    if ckbCodigoCNC.Checked then
      Parametro4.SQL.ADD(' AND (PAR_INFORMACAO=0 OR PAR_INFORMACAO='+IntToStr(dblCodigoCNC.KeyValue)+')');
    Parametro4.SQL.ADD(' ORDER BY PAR_DESCRICAO ');
    Parametro4.Open;
    dblClassificacao.Color:=clWindow;
    dblClassificacao.Enabled:=True;
    dblClassificacao.SetFocus;
  end
  else
  Begin
    Parametro4.Close;
    dblClassificacao.Color:=AlteraCorComponentes;
    dblClassificacao.Enabled:=False;
    dblClassificacao.KeyValue:=-1;
  end;
end;

procedure TfMxSelCliente.ckbVendaProibidaClick(Sender: TObject);
begin
  if ckbVendaProibida.Checked then
    ckbNaoVendaProibida.Checked := False;
end;

procedure TfMxSelCliente.ckbNaoVendaProibidaClick(Sender: TObject);
begin
  if ckbNaoVendaProibida.Checked then
    ckbVendaProibida.Checked := False;
end;

procedure TfMxSelCliente.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    Parametro2.Open;
    dblTipo.Color:=clWindow;
    dblTipo.Enabled:=True;
    dblTipo.SetFocus;
  end
  else
  Begin
    Parametro2.Close;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.Enabled:=False;
    dblTipo.KeyValue:=-1;
  end;
end;

procedure TfMxSelCliente.ckbMalaDiretaClick(Sender: TObject);
begin
  if ckbMalaDireta.Checked then
  Begin
    ckbExportar.Enabled:=True;
    ckbEtiquetas.Enabled:=True;
    edtArquivoMalaDireta.Enabled:=True;
    edtArquivoMalaDireta.Color:=clWindow;
    if DM.Configuracao1.Empresa = empELETRO then
      edtArquivoMalaDireta.Text := 'C:\EtiquetasClientes.txt'
    else
      edtArquivoMalaDireta.Text := 'C:\SIAC_Cliente.txt';
    edtArquivoMalaDireta.SetFocus;
  end
  else
  Begin
    ckbExportar.Enabled:=False;
    ckbEtiquetas.Enabled:=True;
    edtArquivoMalaDireta.Enabled:=False;
    edtArquivoMalaDireta.Color:=AlteraCorComponentes;
    edtArquivoMalaDireta.Clear;
  end;
end;

procedure TfMxSelCliente.ckbConvenioClick(Sender: TObject);
begin
  if ckbConvenio.Checked then
  Begin
    edtConvenio.Color:=clWindow;
    edtConvenio.Enabled:=True;
    edtConvenio.SetFocus;
  end
  else
  Begin
    edtConvenio.Color:=AlteraCorComponentes;
    edtConvenio.Clear;
    edtConvenio.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.ckbSuperiorVendedorClick(Sender: TObject);
begin
  if ckbSuperiorVendedor.Checked then
  Begin
    Vendedor2.Open;
    dblSuperiorVendedor.Color:=clWindow;
    dblSuperiorVendedor.Enabled:=True;
    dblSuperiorVendedor.SetFocus;
  end
  else
  Begin
    Vendedor2.Close;
    dblSuperiorVendedor.Color:=AlteraCorComponentes;
    dblSuperiorVendedor.KeyValue:=-1;
    dblSuperiorVendedor.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.ckbParceiroVendedorClick(Sender: TObject);
begin
  if ckbParceiroVendedor.Checked then
  Begin
    Vendedor3.Open;
    dblParceiroVendedor.Color:=clWindow;
    dblParceiroVendedor.Enabled:=True;
    dblParceiroVendedor.SetFocus;
  end
  else
  Begin
    Vendedor3.Close;
    dblParceiroVendedor.Color:=AlteraCorComponentes;
    dblParceiroVendedor.KeyValue:=-1;
    dblParceiroVendedor.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.ckbValorTotalClick(Sender: TObject);
begin
  if ckbValorTotal.Checked then
  Begin
    cmbValorTotal.Color:=clWindow;
    cmbValorTotal.Enabled:=True;
    cmbValorTotal.ItemIndex:=4;
    edtValorTotal.Color:=clWindow;
    edtValorTotal.Enabled:=True;
    edtValorTotal.SetFocus;
  end
  else
  Begin
    cmbValorTotal.Color:=AlteraCorComponentes;
    cmbValorTotal.Enabled:=False;
    cmbValorTotal.ItemIndex:=-1;
    edtValorTotal.Color:=AlteraCorComponentes;
    edtValorTotal.Text:='';
    edtValorTotal.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.rdgTipoIntevaloClick(Sender: TObject);
begin
  if rdgTipoIntevalo.ItemIndex = 3 then
    ckbValorTotal.Enabled := True else ckbValorTotal.Enabled := False;
end;

procedure TfMxSelCliente.ckbAgruparPorVendedorClick(Sender: TObject);
begin
  if ckbAgruparPorVendedor.Checked then
  Begin
    cmbOrdem.ItemIndex := 5;
    cmbOrdem.Enabled := False;
  end
  else
    cmbOrdem.Enabled := True;
end;

procedure TfMxSelCliente.ckbSomenteAdiplentesClick(Sender: TObject);
begin
  if ckbSomenteAdiplentes.Checked then
    ckbInadiplente.Checked := False;
end;

procedure TfMxSelCliente.ckbSemprePontualClick(Sender: TObject);
begin
  if ckbSemprePontual.Checked then
  Begin
    edtTolerancia.Color:=clWindow;
    edtTolerancia.Enabled:=True;
    edtTolerancia.Text := IntToStr(DM.Configuracao1.QuantDiasSemJuros);
    edtTolerancia.SetFocus;
  end
  else
  Begin
    edtTolerancia.Color:=AlteraCorComponentes;
    edtTolerancia.Clear;
    edtTolerancia.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.ckbSinteticoClick(Sender: TObject);
begin
  if ckbSintetico.Checked then
    ckbSuperSintetico.Enabled := True
  else
  Begin
    ckbSuperSintetico.Checked := False;
    ckbSuperSintetico.Enabled := False;
  end;
end;

procedure TfMxSelCliente.ckbNivelClick(Sender: TObject);
begin
  if ckbNivel.Checked then
  Begin
    ckbA.Checked:=True;
    ckbA.Enabled:=True;
    ckbB.Enabled:=True;
    ckbC.Enabled:=True;
    lblA.Enabled:=True;
    lblB.Enabled:=True;
    lblC.Enabled:=True;
    edtA.Enabled:=True;
    edtB.Enabled:=True;
    edtC.Enabled:=True;
    edtA.Color:=clWindow;
    edtB.Color:=clWindow;
    edtC.Color:=clWindow;
    edtA.SetFocus;
  end
  else
  Begin
    ckbA.Enabled:=False;
    ckbB.Enabled:=False;
    ckbC.Enabled:=False;

    ckbA.Checked:=False;
    ckbB.Checked:=False;
    ckbC.Checked:=False;

    lblA.Enabled:=False;
    lblB.Enabled:=False;
    lblC.Enabled:=False;

    edtA.Enabled:=False;
    edtB.Enabled:=False;
    edtC.Enabled:=False;

    edtA.Color:=AlteraCorComponentes;
    edtB.Color:=AlteraCorComponentes;
    edtC.Color:=AlteraCorComponentes;


  end;
end;

procedure TfMxSelCliente.RadioButton1Click(Sender: TObject);
begin
  if ckbA.Checked then
  Begin
    edtA.Color:=clWindow;
    edtA.Enabled:=True;
  end
  else
  Begin
    edtA.Color:=AlteraCorComponentes;
    edtA.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.RadioButton2Click(Sender: TObject);
begin
  if ckbB.Checked then
  Begin
    edtB.Color:=clWindow;
    edtB.Enabled:=True;
  end
  else
  Begin
    edtB.Color:=AlteraCorComponentes;
    edtB.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.RadioButton3Click(Sender: TObject);
begin
  if ckbC.Checked then
  Begin
    edtC.Color:=clWindow;
    edtC.Enabled:=True;
  end
  else
  Begin
    edtC.Color:=AlteraCorComponentes;
    edtC.Enabled:=False;
  end;
end;

procedure TfMxSelCliente.ckbUltimaCompraClick(Sender: TObject);
begin
  if ckbUltimaCompra.Checked then
  Begin
    cmbDtCompra.Enabled:=True;
    cmbDtCompra.Color:=clWindow;
    cmbDtCompra.ItemIndex := 3; //<=
    mskDataUltimaCompra.Enabled:=True;
    mskDataUltimaCompra.Color:=clWindow;
    mskDataUltimaCompra.Text:=DateToStr(DM.Configuracao1.Data);
    mskDataUltimaCompra.SetFocus;
  end
  else
  Begin
    cmbDtCompra.Enabled:=False;
    cmbDtCompra.Color:=AlteraCorComponentes;
    cmbDtCompra.ItemIndex := -1; //<=
    mskDataUltimaCompra.Enabled:=False;
    mskDataUltimaCompra.Color:=AlteraCorComponentes;
    mskDataUltimaCompra.Clear;
  end;
end;

end.


