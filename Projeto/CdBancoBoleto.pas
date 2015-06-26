unit CdBancoBoleto;
//CESEC
//gerie.ce@bb.com.br
//Silvana do setor de convenios
//299-2944
interface   

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Menus, JPEG, Banco_Boleto, Titulo_receber, Cliente, Parametro,
  Informacoes, Registro_Boleto;

type
  TRegistroT = array[1..31] of string;
  TRegistroU = array[1..18] of string;  
  TfCadBancoBoleto = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    Label1: TLabel;
    edtCodigoConvenio: TEdit;
    edtCodigoBNB: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label15: TLabel;
    DSBanco_Boleto1: TDataSource;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Cabecalho1: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    LocalizarCab: TMenuItem;
    ckbAceite: TCheckBox;
    Label4: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    edtObservacao: TEdit;
    SB_GerarBoleto: TSpeedButton;
    Banco_Boleto1: TBanco_Boleto;
    cmbCodigoBaixaDevolucao: TComboBox;
    cmbCodigoCarteira: TComboBox;
    cmbCodigoDesconto1: TComboBox;
    cmbCodigoDesconto2: TComboBox;
    cmbCodigoDesconto3: TComboBox;
    cmbCodigoJurosMora: TComboBox;
    cmbCodigoMoeda: TComboBox;
    cmbCodigoMulta: TComboBox;
    cmbCodigoProtesto: TComboBox;
    edtDesconto1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtDesconto2: TEdit;
    Label9: TLabel;
    edtDesconto3: TEdit;
    Label10: TLabel;
    edtDiasDesconto1: TEdit;
    Label11: TLabel;
    edtDiasDesconto2: TEdit;
    Label13: TLabel;
    edtDiasDesconto3: TEdit;
    Label14: TLabel;
    Label16: TLabel;
    edtDiasProtesto: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    edtDiasBaixaDevolucao: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtDiasJurosMora: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    edtNumeroAgencia: TEdit;
    Label25: TLabel;
    edtDigitoAgencia: TEdit;
    Label26: TLabel;
    edtNumeroConta: TEdit;
    Label28: TLabel;
    edtDigitoConta: TEdit;
    Label29: TLabel;
    edtDigitoAgenciaConta: TEdit;
    cmbFonteMensagem: TComboBox;
    Label30: TLabel;
    cmbIdentificacaoMensagem: TComboBox;
    Label31: TLabel;
    Label32: TLabel;
    edtNomeEmpresa: TEdit;
    edtNomeBanco: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edtNumeroBanco: TEdit;
    edtMensagemImpressa: TEdit;
    Label36: TLabel;
    edtMensagem1: TEdit;
    Label37: TLabel;
    edtMensagem2: TEdit;
    Label38: TLabel;
    edtMensagem3: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    cmbFormaCadastroTituloBanco: TComboBox;
    Label42: TLabel;
    edtIdentificacaoCSP: TEdit;
    Label43: TLabel;
    cmbIdentificacaoDistribuicao: TComboBox;
    Label44: TLabel;
    cmbIdentificacaoEmissaoBloqueto: TComboBox;
    Label45: TLabel;
    edtJurosDia: TEdit;
    Label46: TLabel;
    edtLinhaMensagem: TEdit;
    Label47: TLabel;
    Label48: TLabel;
    edtMensagem4: TEdit;
    edtMulta: TEdit;
    Label49: TLabel;
    Label50: TLabel;
    edtNumeroInscricao: TEdit;
    Label51: TLabel;
    edtNumeroRemessa: TEdit;
    Label52: TLabel;
    edtNumeroRetorno: TEdit;
    Label53: TLabel;
    edtReservadoEmpresa: TEdit;
    Label54: TLabel;
    edtVersao: TEdit;
    cmbTipoInscricao: TComboBox;
    Label55: TLabel;
    cmbTipoDocumento: TComboBox;
    Label56: TLabel;
    Titulo_receber1: TTitulo_receber;
    Cliente1: TCliente;
    Parametro1: TParametro;
    Label2: TLabel;
    edtDiasMulta: TEdit;
    SB_Receber: TSpeedButton;
    Informacoes1: TInformacoes;
    ckbGrupoEspecial: TCheckBox;
    SB_ImprimirEnvio: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Registro_Boleto1: TRegistro_Boleto;
    N3: TMenuItem;
    Label57: TLabel;
    edtLeiaute: TEdit;
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Banco_Boleto1AfterScroll(DataSet: TDataSet);
    procedure SB_GerarBoletoClick(Sender: TObject);
    procedure SB_ReceberClick(Sender: TObject);
    procedure SB_ImprimirEnvioClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    sDadosTitulo, sRegP, sRegQ, sRegR, sRegS, sRegT, sRegU, sRegW, sNomeArq, sAgencia, sConta, sDataJurosMora: string;
    iSeqArq, iVersaoLayOut: integer;
    DtGerArq: TDateTime;
    vJurosMora: Double;
    procedure AtualizaControles(Habilitar: Boolean);
    function CabecalhoArquivo:string;
    function CabecalhoLote(PLoteServico: integer):string;
    function RodapeArquivo(PQtdLotes, PQtdRegistrosArq, PQtdContasLotes: integer):string;
    function RodapeLote(PLoteServico, PQtdRegistrosLote: integer): string;
    function SegmentoP(PLoteServico, PNSeqReg, CdCNC, CdTRC, PNossoNumero: integer; DtVencimento, DtCadastro: TDateTime; vValor:Double): string;
    function SegmentoQ(PLoteServico, PNSeqReg, CdCNC,
      CdCLI: integer): string;
    function SegmentoR(PLoteServico, PNSeqReg: integer; DtVencimento: TDateTime; CdCNC, CdPDV: integer): string;
    function SegmentoS(PLoteServico, PNSeqReg, CdCNC, CdPDV: integer): string;
    function IncluirRegistroBoleto(PTipo: Integer):Boolean;
    { Private declarations }
  public
    DtEmissaoBoleto: TDateTime;
    Entidade:TBanco_Boleto;
  end;

const
  //Segmento T e U
  colBanco             = 1;
  colLoteServico       = 2;
  colRegistro          = 3;
  colSeqRegLote        = 4;
  colCodSegmento       = 5;
  colUsoExclusivo1     = 6;
  colCodMovimento      = 7;

  //Segmento T
  colAgMantedora       = 8;
  colDigAgMantedora    = 9;
  colContaMantedora    = 10;
  colDigContaMantedora = 11;
  colDigAgConta        = 12;
  colUsoExclusivo2     = 13;
  colIdTituloBanco     = 14;
  colCodCarteira       = 15;
  colNumDocCobranca    = 16;
  colUsoExclusivo3     = 17;
  colDtVencimento      = 18;
  colValorTitulo       = 19;
  colBancoCob          = 20;
  colAgCob             = 21;
  colDigAgCob          = 22;
  colIdTituloEmpresa   = 23;
  colCodMoeda          = 24;
  colTipoInscricao     = 25;
  colInscricao         = 26;
  colNome              = 27;
  colUsoExclusivo4     = 28;
  colValorTarifa       = 29;
  colMotivoOcorrencia  = 30;
  colUsoExclusivo5     = 31;

  //Segmento U
  colValorJurosMulta   = 8;
  colValorDesconto     = 9;
  colValorAbatimento   = 10;
  colValorIOF          = 11;
  colValorPago         = 12;
  colValorLiquido      = 13;
  colValorOutrasDesp   = 14; //Despesas com Cartório
  colValorOutrosCred   = 15;
  colDtOcorrencia      = 16;
  colDtCredito         = 17;
  colUsoExclusivo6     = 18;

var
  fCadBancoBoleto: TfCadBancoBoleto;

implementation
Uses UDM, funcoes, Configuracao, Math, UReceber, URegistroBoleto;
{$R *.DFM}


procedure TfCadBancoBoleto.AtualizaControles(Habilitar:Boolean);
begin
  SairCab.Enabled:=not habilitar;
  IncluirCab.Enabled:=not habilitar;
  AlterarCab.Enabled:=not habilitar;
  ExcluirCab.Enabled:=not habilitar;
  LocalizarCab.Enabled:=not habilitar;
  SalvarCab.Enabled:=habilitar;
  CancelarCab.Enabled:=habilitar;
  SB_NovoCab.Enabled:=not habilitar;
  SB_LocCab.Enabled:=not habilitar;
  SB_AltCab.Enabled:=not habilitar;
  SB_ExcCab.Enabled:=not habilitar;
  SB_SalvaCab.Enabled:=habilitar;
  SB_CancCab.Enabled:=habilitar;

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
end;

procedure TfCadBancoBoleto.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7760)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  cmbCodigoMoeda.ItemIndex := 8;
  AtualizaControles(true);
  edtCodigoConvenio.SetFocus;
end;

procedure TfCadBancoBoleto.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7770)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtCodigoConvenio.SetFocus;
end;

procedure TfCadBancoBoleto.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7780)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.Deletarauto;
end;

procedure TfCadBancoBoleto.SB_SalvaCabClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadBancoBoleto.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadBancoBoleto.FormCreate(Sender: TObject);
begin
  DtEmissaoBoleto := 0;
  Entidade:=Banco_Boleto1;
end;

procedure TfCadBancoBoleto.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadBancoBoleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfCadBancoBoleto.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadBancoBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadBancoBoleto.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Open;
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadBancoBoleto.FormKeyPress(Sender: TObject; var Key: Char);
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
  else if Key=#13 then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfCadBancoBoleto.Banco_Boleto1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadBancoBoleto.SB_GerarBoletoClick(Sender: TObject);
var
  CdCNC, CdBNB, vNumeroRemessa, vLoteServico,
      vQtdContasTotal, iNumeroSegmentoP, iNumeroSegmentoQ, iNumeroSegmentoR,
      iNumeroSegmentoS, CdBol: integer;
  Trans, vSegmentoR, vSegmentoS: Boolean;
  sFiltroGrupoEspecial, sFiltroGrupoEspecialUpdate, sEspecial,
    sVerificado, sVerificadoUpdate: string;
  F: TextFile;
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione um Banco Boleto!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6560)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para Emitir Arquivo!');

  sVerificado :=  ' AND T1.TRC_VERIFICADO='+IntToStr(Entidade.CodigoBNB);
  sVerificadoUpdate := ' AND TRC_VERIFICADO='+IntToStr(Entidade.CodigoBNB);

  CdCNC := Entidade.CodigoCNC;
  CdBNB := Entidade.CodigoBNB;
  vNumeroRemessa := Entidade.NumeroRemessa;
  DtEmissaoBoleto := DM.Configuracao1.DataHora;

  SB_ImprimirEnvioClick(sender);

  If MessageDlg('ATENÇÃO!!!'+#13+'Deseja gerar o Arquivo de Boleto '+IntToStr(vNumeroRemessa)+' ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  //Encontrar Número do Último Boleto
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT MAX(BOL_CODIGO) AS BOL '+
      ' FROM TITULO_A_RECEBER '+
      ' WHERE BOL_CODIGO>0 ';
    Open;
    if Trim(FieldByName('BOL').asString) <> '' then
      CdBOL := FieldByName('BOL').asInteger
    else
      CdBOL := 0;
  end;

  if Entidade.GrupoEspecial then
  Begin
    sFiltroGrupoEspecial := ' AND (T1.PDV_CODIGO IN (SELECT P1.PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE T1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PDV_GRUPO_ESPECIAL=1) '+
      ' OR T1.PDV_CODIGO IN (SELECT P1.PDV_CODIGO '+
      ' FROM PACOTE_DE_VENDA P1 '+
      ' WHERE T1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PCT_GRUPO_ESPECIAL=1)) ';
    sFiltroGrupoEspecialUpdate := ' AND (TITULO_A_RECEBER.PDV_CODIGO IN (SELECT P1.PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE TITULO_A_RECEBER.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PDV_GRUPO_ESPECIAL=1) '+
      ' OR TITULO_A_RECEBER.PDV_CODIGO IN (SELECT P1.PDV_CODIGO '+
      ' FROM PACOTE_DE_VENDA P1 '+
      ' WHERE TITULO_A_RECEBER.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PCT_GRUPO_ESPECIAL=1)) ';
  end
  else
  Begin
    sFiltroGrupoEspecial := ' AND (T1.PDV_CODIGO NOT IN (SELECT P1.PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE T1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PDV_GRUPO_ESPECIAL=1) '+
      ' AND T1.PDV_CODIGO NOT IN (SELECT P1.PDV_CODIGO '+
      ' FROM PACOTE_DE_VENDA P1 '+
      ' WHERE T1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PCT_GRUPO_ESPECIAL=1)) ';
    sFiltroGrupoEspecialUpdate := ' AND (TITULO_A_RECEBER.PDV_CODIGO NOT IN (SELECT P1.PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE TITULO_A_RECEBER.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PDV_GRUPO_ESPECIAL=1) '+
      ' AND TITULO_A_RECEBER.PDV_CODIGO NOT IN (SELECT P1.PDV_CODIGO '+
      ' FROM PACOTE_DE_VENDA P1 '+
      ' WHERE TITULO_A_RECEBER.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PCT_GRUPO_ESPECIAL=1)) ';
  end;

  if Entidade.GrupoEspecial then
    sEspecial := '_ESP'
  else
    sEspecial := '';

  sNomeArq := 'C:\BOLETOS_'+formatDateTime('DDMMYYYY_HHMM',DM.Configuracao1.DataHora)+sEspecial+'.TXT';

  sDadosTitulo := '';
  sRegP := '';
  sRegQ := '';
  sRegR := '';
  sRegS := '';
  sRegT := '';
  sRegU := '';
  sRegW := '';

  if (Entidade.Desconto2 > 0) or
     (Entidade.Desconto3 > 0) or
     (Entidade.Multa > 0) or
     (Trim(Entidade.Mensagem3) <> '') or
     (Trim(Entidade.Mensagem4) <> '') then
    vSegmentoR := True
  else
    vSegmentoR := False;

  if Trim(Entidade.MensagemImpressa) <> '' then
    vSegmentoS := True
  else
    vSegmentoS := False;

  vLoteServico := 0;
  vQtdContasTotal := 0;

  iNumeroSegmentoP := 0;
  iNumeroSegmentoQ := 0;
  iNumeroSegmentoR := 0;
  iNumeroSegmentoS := 0;

  AssignFile(F, sNomeArq);
  Rewrite(F);
  try
    //Gerar Cabeçalho do Arquivo
    Writeln(F, CabecalhoArquivo);

    //
    //Lote.. Títulos em Carteira de Cobrança
    //
    inc(vLoteServico);
    //Gerar Cabeçalho do Lote
    Writeln(F, CabecalhoLote(vLoteServico));
    with Titulo_receber1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM TITULO_A_RECEBER T1 '+
        ' WHERE T1.TRC_SITUACAO IN (0,1,8,9) '+
        ' AND T1.TRC_TIPO_PAG=412 '+
        ' AND TRC_SITUACAO<>5 '+
        ' AND (T1.TRC_DT_EMISSAO_BOLETO=0 OR T1.TRC_DT_EMISSAO_BOLETO IS NULL) '+
        sFiltroGrupoEspecial+sVerificado;
      Open;
      if IsEmpty then
      Begin
        ShowMessage('Não existem registros para o envio!');
        Exit;
      end;
      while not Eof do
      Begin
        Inc(iNumeroSegmentoP);
        //Nosso Número
        inc(CdBOL);
        vJurosMora := 0;
        sRegP := SegmentoP(vLoteServico, iNumeroSegmentoP, CodigoCNC, CodigoTRC, CdBOL, Vencimento, DataCadastro, Valor);
        Writeln(F, sRegP);
        //Salvar o Número do Boleto
        ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
          ' BOL_CODIGO='+IntToStr(CdBOL)+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND TRC_CODIGO='+IntToStr(CodigoTRC));

        Inc(iNumeroSegmentoQ);
        sRegQ := SegmentoQ(vLoteServico, iNumeroSegmentoQ, ClienteCNC, CodigoCLI);
        Writeln(F, sRegQ);
        if vSegmentoR or
           (vJurosMora > 0)then
        Begin
          inc(iNumeroSegmentoR);
          sRegR := SegmentoR(vLoteServico, iNumeroSegmentoR, Vencimento, CodigoCNC, CodigoPDV);
          Writeln(F, sRegR);
        end;
        if vSegmentoS then
        Begin
          inc(iNumeroSegmentoS);
          sRegS := SegmentoS(vLoteServico, iNumeroSegmentoS, CodigoCNC, CodigoPDV);
          Writeln(F, sRegS);
        end;
        sAgencia      := PreencheZero(5, Entidade.NumeroAgencia) +'-'+PreencheZero(1, Entidade.DigitoAgencia);
        sConta        := PreencheZero(5, Entidade.NumeroConta)+'-'+PreencheZero(1, Entidade.DigitoConta);
        if not Registro_Boleto1.Inserir(0(*0 - Saida; 1 - Entrada*), iSeqArq, iVersaoLayOut, DtEmissaoBoleto,
          sAgencia, sConta, sRegP, sRegQ, sRegR, sRegS, sRegT, sRegU, sRegW, ''(*DadosTituloCBR454*), sNomeArq, '' (*Obs*)) then
        Begin
          Showmessage('Falha ao gerar Registro_Boleto!');
          Exit;
        end;
        Next;
      end;
    end;
    //Rodapé do Lote
    Writeln(F, RodapeLote(vLoteServico, iNumeroSegmentoP+iNumeroSegmentoQ+iNumeroSegmentoR+iNumeroSegmentoS+2));
    //
    //

    //Rodapé do Arquivo
    Writeln(F, RodapeArquivo(vLoteServico,iNumeroSegmentoP+iNumeroSegmentoQ+iNumeroSegmentoR+iNumeroSegmentoS+4, vQtdContasTotal));

    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        ExecutaSQL(DM.QR_Comandos,'UPDATE BANCO_BOLETO SET '+
          ' BNB_NUMERO_REMESSA='+IntToStr(vNumeroRemessa+1)+
          ',BNB_DT_ALTERADO="'+MesDiaHora(DtEmissaoBoleto)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND BNB_CODIGO='+IntToStr(CdBNB));


        //Atenção para MOTICAL utilizar Tabela auxiliar para pagar TRC de outro CNC
        ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
          ' TRC_DT_EMISSAO_BOLETO="'+MesDiaHora(DtEmissaoBoleto)+'" '+
          ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE TRC_TIPO_PAG=412 '+ //Boleto Bancário
          ' AND (TRC_DT_EMISSAO_BOLETO=0 OR TRC_DT_EMISSAO_BOLETO IS NULL) '+
          ' AND TRC_SITUACAO=0 '+
          sFiltroGrupoEspecialUpdate+sVerificadoUpdate);

        if not DM.Usuario1.GeraLog(6560, Entidade.CodigoCNC, Entidade.CodigoBNB, 'LAYOUT:'+Entidade.Leiaute) then
        Begin
          ShowMessage('Falha ao gerar Log!');
          Raise exception.Create('');
        end;

        If DM.Configuracao1.ControleTransacao then
          Commit;
        Trans := False;

        Entidade.Close;
        Entidade.Open;
        ShowMessage('Arquivo gerado!');
      except
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          end;
      end;
    End;
  finally
    CloseFile(F);
  end;
end;

function TfCadBancoBoleto.CabecalhoArquivo:String;
var
  STR, sSiglaCedente, sEnderecoDevolucao, sCEPDevolucao, sPracaDevolucao: string;
begin
  sSiglaCedente := '';
  sEnderecoDevolucao := '';
  sCEPDevolucao := '';
  sPracaDevolucao := '';

  iSeqArq := 0;
  iVersaoLayOut := Entidade.Versao;

  if DM.Configuracao1.Empresa = empMotical then
  Begin
    sSiglaCedente := 'MOTICAL';
    sEnderecoDevolucao := '';
    sCEPDevolucao := '';
  end;

  STR :=
    //Código do Banco na Compensação (3 N)
    PreencheZero(3, Entidade.NumeroBanco)+
    //Lote de Serviço (4 N)
    PreencheZero(4, 0)+
    //Registro Header de Arquivo
    '0'+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(9, ' ')+
    //Tipo de Inscrição da Empresa
    IntToStr(Entidade.TipoInscricao+1)+
    //Número de Inscrição da Empresa
    PreencheZero(14, Entidade.NumeroInscricao)+
    //Código do Convenio no Banco
    //PreencheEspaco(20, '000189991'+'001417019')+
    PreencheEspaco(20, PreencheZero(9,Entidade.CodigoConvenio)+'001417019')+
    //Agência Mantedora da Conta
    PreencheZero(5, Entidade.NumeroAgencia)+
    //Digito Verificador da Agencia
    PreencheEspaco(1, Entidade.DigitoAgencia)+
    //Número da Conta Corrente
    PreencheZero(12, Entidade.NumeroConta)+
    //Digito Verificador da Conta
    PreencheEspaco(1, Entidade.DigitoConta)+
    //Digito Verificador da Ag/Conta
    PreencheEspaco(1, Entidade.DigitoAgenciaConta)+
    //Nome da Empresa
    PreencheEspaco(30, Entidade.NomeEmpresa)+
    //Nome da Banco
    PreencheEspaco(30, Entidade.NomeBanco)+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(10, ' ')+
    //Código Remessa/Retorno
    '1'+
    //Data de Geração do Arquivo
    FormatDateTime('DDMMYYYY',DtEmissaoBoleto)+
    //Hora de Geração do Arquivo
    FormatDateTime('HHMMSS',DtEmissaoBoleto)+
    //N Sequencial do Arquivo
    PreencheZero(6, iSeqArq)+
    //N da Versão do Layout do Arquivo
    PreencheZero(3, iVersaoLayOut)+
    //Densidade de Gravação do Arquivo
    PreencheZero(5, 0)+
    //Para Uso Reservado do Banco
    PreencheEspaco(20, ' ')+
    //Para Uso Reservado da Empresa
    PreencheEspaco(20, Entidade.ReservadoEmpresa)+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(11, ' ')+
    //Identificação Cobrança S/ Papel
    PreencheEspaco(3, Entidade.IdentificacaoCSP)+
    //Uso Exclusivo das VANS
    PreencheEspaco(3, ' ')+
    //Tipo de Serviço
    PreencheEspaco(2, ' ')+
    //Códigos das Ocorrências
    PreencheEspacoEsq(10, ' ');

  Result := PreencheEspaco(240, STR);
end;


function TfCadBancoBoleto.CabecalhoLote(PLoteServico: integer):string;
var
  STR: string;
begin
  STR :=
    //Código do Banco na Compensação (3 N)
    PreencheZero(3, Entidade.NumeroBanco)+
    //Lote de Serviço (4 N)
    PreencheZero(4, PLoteServico)+
    //Registro Header de Lote (1 N)
    '1'+
    //Tipo de Operação (1 A)
    'R'+
    //Tipo de Serviço (2 N)
    '01'+
    //Forma de Lançamento (2 N)
    '00'+
    //Número da Versão
    PreencheZero(3, 20)+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(1, ' ')+
    //Tipo de Inscrição da Empresa
    IntToStr(Entidade.TipoInscricao+1)+
    //Número de Inscrição da Empresa
    PreencheZero(15, Entidade.NumeroInscricao)+
    //Código do Convenio no Banco
    PreencheEspaco(20, PreencheZero(9, Entidade.CodigoConvenio)+'0014'+'17'+'019')+
    //Agência Mantedora da Conta
    PreencheZero(5, Entidade.NumeroAgencia)+
    //Digito Verificador da Agencia
    PreencheEspaco(1, Entidade.DigitoAgencia)+
    //Número da Conta Corrente
    PreencheZero(12, Entidade.NumeroConta)+
    //Digito Verificador da Conta
    PreencheEspaco(1, Entidade.DigitoConta)+
    //Digito Verificador da Ag/Conta
    PreencheEspaco(1, Entidade.DigitoAgenciaConta)+
    //Nome da Empresa
    PreencheEspaco(30, Entidade.NomeEmpresa)+
    //Mensagem 1
    PreencheEspaco(40, Entidade.Mensagem1)+
    //Mensagem 2
    PreencheEspaco(40, Entidade.Mensagem2)+
    //Número Remessa/Retorno
    PreencheZero(8, Entidade.NumeroRemessa+1)+
    //Data de Gravação Remessa/Retorno
    FormatDateTime('DDMMYYYY',DtEmissaoBoleto)+
    //Data do Crédito
    '00000000'+  //FormatDateTime('DDMMYYYY',DtEmissaoBoleto)+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(33, ' ');
  Result := PreencheEspaco(240, STR);
end;

function TfCadBancoBoleto.RodapeLote(PLoteServico, PQtdRegistrosLote: integer):string;
var
  STR: string;
begin
  STR :=
    //Código do Banco na Compensação (3 N)
    PreencheZero(3, Entidade.NumeroBanco)+
    //Lote de Serviço (4 N)
    PreencheZero(4, PLoteServico)+
    //Registro Trailer de Lote (1 N)
    '5'+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(9, ' ')+
    //Quantidade de Registros do Lote
    PreencheZero(6, PQtdRegistrosLote)+
    //Quantidade de Título em Cobrança
    PreencheZero(6, 0)+
    //Valor Tot. dos Título em Carteira
    PreencheZero(15, 0)+
    //Quantidade de Título em Cobrança
    PreencheZero(6, 0)+
    //Valor Tot. dos Título em Carteira
    PreencheZero(15, 0)+
    //Quantidade de Título em Cobrança
    PreencheZero(6, 0)+
    //Valor Tot. dos Título em Carteira
    PreencheZero(15, 0)+
    //Quantidade de Título em Cobrança
    PreencheZero(6, 0)+
    //Valor Tot. dos Título em Carteira
    PreencheZero(15, 0)+
    //Número do Aviso de Lançamento
    PreencheEspaco(8, ' ')+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(117, ' ');
  Result := PreencheEspaco(240, STR);
end;

function TfCadBancoBoleto.RodapeArquivo(PQtdLotes, PQtdRegistrosArq, PQtdContasLotes: integer):string;
var
  STR: string;
begin
  STR :=
    //Código do Banco na Compensação (3 N)
    PreencheZero(3, Entidade.NumeroBanco)+
    //Lote de Serviço (4 N) Valor Fixo
    PreencheZero(4, 9999)+
    //Registro Trailer de Arquivo (1 N)
    '9'+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(9, ' ')+
    //Quantidade de Lotes do Arquivo Tipo - 1
    PreencheZero(6, PQtdLotes)+
    //Quantidade de Registros do Arquivo Tipo 0 + 1 + 3 + 5 + 9
    PreencheZero(6, PQtdRegistrosArq)+
    //Quantidade de Contas p/Conc. - Lotes Num.Reg. Tipo-1 OPR-E
    PreencheZero(6, PQtdContasLotes)+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(205, ' ');
  Result := PreencheEspaco(240, STR);
end;

function TfCadBancoBoleto.SegmentoP(PLoteServico, PNSeqReg, CdCNC, CdTRC, PNossoNumero: integer; DtVencimento, DtCadastro: TDateTime; vValor:Double):string;
var
  STR, sAceito, sDataDesc1, sNossoNumero: string;
begin
  if Entidade.Aceite then
    sAceito := 'A'
  else
    sAceito := 'N';

  if (Entidade.CodigoJurosMora+1) = 1 then //Valor por Dia
    vJurosMora := Arredonda(Entidade.JurosDia*vValor/3000)
  else if (Entidade.CodigoJurosMora+1) = 2 then //Taxa Mensal
    vJurosMora := Arredonda(Entidade.JurosDia);


  if Entidade.JurosDia > 0 then
    sDataJurosMora := formatDateTime('DDMMYYYY',DtVencimento+Entidade.DiasJurosMora)
  else
    sDataJurosMora := '';

  if Entidade.CodigoDesconto1 > 0 then
    sDataDesc1 := FormatDateTime('DDMMYYYY',DtVencimento-Entidade.DiasDesconto1)
  else
    sDataDesc1 := '0';

  //Nosso Número
  sNossoNumero := PreencheZero(6,Entidade.CodigoConvenio)+PreencheZero(5,PNossoNumero);
  sNossoNumero := sNossoNumero+DigitoModulo11(sNossoNumero);

  STR :=
    //Código do Banco na Compensação (3 N)
    PreencheZero(3, Entidade.NumeroBanco)+
    //Lote de Serviço (4 N)
    PreencheZero(4, PLoteServico)+
    //Registro Detalhe (1 N)
    '3'+
    //N Sequencial do Reg. no Lote
    PreencheZero(5, PNSeqReg)+
    //Cod. Segmento do Reg. Detalhe
    PreencheEspaco(1, 'P')+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(1, ' ')+
    //Cod. Movimento
    PreencheZero(2, 1)+ //Entrada de Títulos
    //Agência Mantedora da Conta
    PreencheZero(5, Entidade.NumeroAgencia)+
    //Digito Verificador da Agencia
    PreencheEspaco(1, Entidade.DigitoAgencia)+
    //Número da Conta Corrente
    PreencheZero(12, Entidade.NumeroConta)+
    //Digito Verificador da Conta
    PreencheEspaco(1, Entidade.DigitoConta)+
    //Digito Verificador da Ag/Conta
    PreencheEspaco(1, Entidade.DigitoAgenciaConta)+
    //Identificação do Título no Banco
    PreencheEspaco(20, sNossoNumero)+  //Convenio 06 + Sequencial 05 + DígitoVerificador
    //Código da Carteira
    PreencheZero(1, Entidade.CodigoCarteira+1)+
    //Forma de Cadastramento do Título no Banco
    PreencheZero(1, Entidade.FormaCadastroTituloBanco+1)+
    //Tipo de Documento
    PreencheZero(1, Entidade.TipoDocumento+1)+
    //Identificação da Emissão do Bloqueto
    PreencheZero(1, Entidade.IdentificacaoEmissaoBloqueto+1)+
    //Identificação da Distribuição
    PreencheZero(1, Entidade.IdentificacaoDistribuicao+1)+
    //Número do Documento de Cobrança
    PreencheEspaco(15, PreencheZero(2,CdCNC)+PreencheZero(8,CdTRC))+
    //Data de Vencimento do Título
    FormatDateTime('DDMMYYYY',DtVencimento)+
    //Valor Nominal do Título
    PreencheZero(15, TiraVirgula(vValor))+
    //Agênccia encarregada da cobrança
    PreencheZero(5, 0)+
    //Dígito Verif. da Agênccia encarregada da cobrança
    PreencheEspaco(1, '0')+
    //Espécie do Título
    PreencheZero(2, 2)+ //DM Duplicata Mercantil
    //Identificação do Título Aceito/Não Aceito
    sAceito+
    //Data da Emissão do Título
    FormatDateTime('DDMMYYYY',DtCadastro)+
    //Código do Juros de Mora
    PreencheZero(1, Entidade.CodigoJurosMora+1)+
    //Data do Juros de Mora
    PreencheZero(8,sDataJurosMora)+
    //Juros de Mora por Dia/Taxa
    PreencheZero(15, TiraVirgula(vJurosMora))+
    //Código do Desconto1
    PreencheZero(1, Entidade.CodigoDesconto1)+
    //Data do Desconto1
    PreencheZero(8, sDataDesc1)+
    //Valor/Percentual a ser concedido
    PreencheZero(15, TiraVirgula(Entidade.Desconto1))+
    //Valor do IOF a ser recolhido
    PreencheZero(15, 0)+
    //Valor do Abatimento
    PreencheZero(15, 0)+
    //Identificação do Título na Empresa
    PreencheEspaco(25, PreencheZero(2,CdCNC)+PreencheZero(8,CdTRC))+
    //Código para Protesto
    PreencheZero(1, Entidade.CodigoProtesto+1)+
    //Número de Dias para Protesto
    PreencheZero(2, Entidade.DiasProtesto)+
    //Código para Baixa/Devolução
    PreencheZero(1, Entidade.CodigoBaixaDevolucao+1)+
    //Número de Dias para Baixa/Devolução
    PreencheZero(3, Entidade.DiasBaixaDevolucao)+
    //Código da Moeda
    PreencheZero(2, Entidade.CodigoMoeda+1)+
    //Numero do Contr. da Operação D Credito
    PreencheZero(10, '16392920')+                         //Atenção valor amarrado
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(1, ' ');
  Result := PreencheEspaco(240, STR);
end;

function TfCadBancoBoleto.SegmentoQ(PLoteServico, PNSeqReg, CdCNC, CdCLI: integer):string;
var
  STR, sTipoDeInscricao, sEndereco, sBairro, sCEP, sCidade, sUF, sNumeroInscricao: string;
begin
  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCNC;
    ParamByName('CLI_CODIGO').asInteger := CdCLI;
    Open;
    if IsEmpty then
      Raise exception.Create('Cliente não encontrado! ('+IntToStr(CdCNC)+'-'+IntToStr(CdCLI));

    Informacoes1.Close;
    Informacoes1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
    Informacoes1.ParamByName('CLI_CODIGO').asInteger := CodigoCLI;
    Informacoes1.Open;
    if (Informacoes1.Endereco <> '') then
    Begin
      //Endereco de Cobrança
      if Informacoes1.Logradouro > 0 then
      Begin
        if (not Parametro1.Active) or
           (Parametro1.CodigoPAR <> Informacoes1.Logradouro) then
        Begin
          Parametro1.Close;
          Parametro1.ParamByName('PAR_CODIGO').asInteger := Informacoes1.Logradouro;
          Parametro1.Open;
        end;
        sEndereco := Trim(Parametro1.Descricao+' '+Informacoes1.Endereco);
      end
      else
        sEndereco := Informacoes1.Endereco;

      sBairro := Informacoes1.Bairro;
      sCEP    := Informacoes1.CEP;
      sCidade := Informacoes1.Cidade;
      sUF     := Informacoes1.UF;
    end
    else
    Begin
      //Endereço
      if Logradouro > 0 then
      Begin
        if (not Parametro1.Active) or
           (Parametro1.CodigoPAR <> Logradouro) then
        Begin
          Parametro1.Close;
          Parametro1.ParamByName('PAR_CODIGO').asInteger := Logradouro;
          Parametro1.Open;
        end;
        sEndereco := Trim(Parametro1.Descricao+' '+Endereco);
      end
      else
        sEndereco := Endereco;

      sBairro := Bairro;
      sCEP    := CEP;
      sCidade := Cidade;
      sUF     := UF;
    end;

    if Length(Trim(sCEP)) <> 8  then
      Raise exception.Create('CEP inválido do cliente ('+IntToStr(CodigoCNC)+'-'+IntToStr(CodigoCLI)+') '+RazaoSocial);

    sNumeroInscricao := '';
    //Tipo de CPF
    if not VerificaCPFCNPJBranco(CPFCGC) then
      sTipoDeInscricao := '0'
    else if Length(Trim(CPFCGC)) = 11 then
    Begin
      sTipoDeInscricao := '1';
      sNumeroInscricao := CPFCGC;
    end
    else if Length(Trim(CPFCGC)) = 14 then
    Begin
      sTipoDeInscricao := '2';
      sNumeroInscricao := CPFCGC;
    end
    else
    Begin
      sTipoDeInscricao := '9';
      sNumeroInscricao := CPFCGC;
    end;
  end;
  STR :=
    //Código do Banco na Compensação (3 N)
    PreencheZero(3, Entidade.NumeroBanco)+
    //Lote de Serviço (4 N)
    PreencheZero(4, PLoteServico)+
    //Registro Detalhe (1 N)
    '3'+
    //N Sequencial do Reg. no Lote
    PreencheZero(5, PNSeqReg)+
    //Cod. Segmento do Reg. Detalhe
    PreencheEspaco(1, 'Q')+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(1, ' ')+
    //Codigo de Movimento
    PreencheZero(2, 1)+ //Entrada de Títulos
    //Tipo de Inscrição
    sTipoDeInscricao+
    //Número de Inscrição
    PreencheZero(15, sNumeroInscricao)+
    //Nome
    PreencheEspaco(40, Cliente1.RazaoSocial)+
    //Endereco
    PreencheEspaco(40, sEndereco)+
    //Bairro
    PreencheEspaco(15, sBairro)+
    //CEP + Sufixo do CEP
    PreencheEspaco(8, sCEP, '0')+
    //Cidade
    PreencheEspaco(15, sCidade)+
    //UF
    PreencheEspaco(2, sUf)+
    //Tipo de Inscrição do Avalista
    '0'+
    //Número de Inscrição do Avalista
    PreencheZero(15, 0)+
    //Nome do Sacador/Avalista
    PreencheEspaco(40, Cliente1.RazaoSocial)+
    //Código do Banco Correspondente na Compensação (Somente Troca de Arq. entre Bancos)
    PreencheZero(3, 0)+
    //Nosso Num. no Banco Correspondente
    PreencheEspaco(20, ' ')+                    //ATENÇÃO Verificar Função (Não está sendo utilizado)
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(8, ' ');
  Result := PreencheEspaco(240, STR);
end;

function TfCadBancoBoleto.SegmentoR(PLoteServico, PNSeqReg: integer; DtVencimento: TDateTime; CdCNC, CdPDV: integer):string;
var
  STR, sDataDesc2, sDataDesc3, sMensagem3, sMensagem4, sPedido: string;
  CdFPE: integer;
begin
  sMensagem3 := Trim(Entidade.Mensagem3);

  sMensagem4 := Trim(Entidade.Mensagem4);

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT FPE_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV);
    Open;
    if Trim(FieldByName('FPE_CODIGO').asString) <> '' then
    Begin
      CdFPE := FieldByName('FPE_CODIGO').asInteger;
      Close;
      SQL.Text := 'SELECT P1.PDV_CODIGO, P1.PDV_DOCUMENTO '+
        ' FROM PEDIDO_DE_VENDA P1 '+
        ' WHERE P1.CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNC)+
        ' AND P1.FPE_CODIGO='+IntToStr(CdFPE)+
        ' AND P1.PDV_SITUACAO=4 ';
      Open;
      sPedido := '';
      while not Eof do
      Begin
        if sPedido <> '' then
          sPedido := sPedido + ';';
        if Trim(FieldByName('PDV_DOCUMENTO').asString) <> '' then
          sPedido := sPedido + FieldByName('PDV_DOCUMENTO').asString
        else
          sPedido := sPedido + FieldByName('PDV_CODIGO').asString;
        Next;
      end;
    end
    else
      sPedido := IntToStr(CdPDV);
  end;

  sMensagem3 := sMensagem3 + sPedido;

  if sMensagem4 = '' then
  Begin
    if Length(sMensagem3) > 40 then
    Begin
      sMensagem4 := Copy(sMensagem3, 41, Length(sMensagem3)-40);
      sMensagem3 := Copy(sMensagem3, 1, 40);
    end;
  end;

  if Entidade.CodigoDesconto2 > 0 then
    sDataDesc2 := FormatDateTime('DDMMYYYY',DtVencimento-Entidade.DiasDesconto2)
  else
    sDataDesc2 := '0';

  if Entidade.CodigoDesconto3 > 0 then
    sDataDesc3 := FormatDateTime('DDMMYYYY',DtVencimento-Entidade.DiasDesconto3)
  else
    sDataDesc3 := '0';

  STR :=
    //Código do Banco na Compensação (3 N)
    PreencheZero(3, Entidade.NumeroBanco)+
    //Lote de Serviço (4 N)
    PreencheZero(4, PLoteServico)+
    //Registro Detalhe (1 N)
    '3'+
    //N Sequencial do Reg. no Lote
    PreencheZero(5, PNSeqReg)+
    //Cod. Segmento do Reg. Detalhe
    PreencheEspaco(1, 'R')+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(1, ' ')+
    //Cod. Movimento
    PreencheZero(2, 1)+ //Entrada de Títulos
    //Código do Desconto2
    PreencheZero(1, Entidade.CodigoDesconto2)+
    //Data do Desconto2
    PreencheZero(8, sDataDesc2)+
    //Valor/Percentual a ser concedido Desconto2
    PreencheZero(15, TiraVirgula(Entidade.Desconto2))+
    //Código do Desconto3
    PreencheZero(1, Entidade.CodigoDesconto3)+
    //Data do Desconto3
    PreencheZero(8, sDataDesc3)+
    //Valor/Percentual a ser concedido Desconto3
    PreencheZero(15, TiraVirgula(Entidade.Desconto3))+
    //Código da Multa
    PreencheZero(1, Entidade.CodigoMulta)+
    //Data da Multa
    FormatDateTime('DDMMYYYY',DtVencimento-Entidade.DiasMulta)+
    //Valor/Percentual a ser aplicado Multa
    PreencheZero(15, TiraVirgula(Entidade.Multa))+
    //Informação do Banco ao Sacado (Se ouver Troca de Arq. Magnético)
    PreencheEspaco(10, ' ')+
    //Mensagem3
    PreencheEspaco(40, sMensagem3)+
    //Mensagem4
    PreencheEspaco(40, sMensagem4)+
    //Código do Banco da Conta do Débito
    PreencheZero(3, 0)+
    //Código da Agência do Débito
    PreencheZero(4, 0)+
    //Conta Corrente/DV do Debito
    PreencheZero(13, 0)+
    //Códigos de Ocorrência do Sacado
    PreencheZero(8, 0)+                                   //Código não especificado em Notas
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(33, ' ');
  Result := PreencheEspaco(240, STR);
end;

function TfCadBancoBoleto.SegmentoS(PLoteServico, PNSeqReg, CdCNC, CdPDV: integer):string;
var
  STR, sMensagemImpressa, sPedido: string;
  CdFPE: integer;
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT FPE_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV);
    Open;
    if Trim(FieldByName('FPE_CODIGO').asString) <> '' then
    Begin
      CdFPE := FieldByName('FPE_CODIGO').asInteger;
      Close;
      SQL.Text := 'SELECT P1.PDV_CODIGO, P1.PDV_DOCUMENTO '+
        ' FROM PEDIDO_DE_VENDA P1 '+
        ' WHERE P1.CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNC)+
        ' AND P1.FPE_CODIGO='+IntToStr(CdFPE)+
        ' AND P1.PDV_SITUACAO=4 ';
      Open;
      sPedido := '';
      while not Eof do
      Begin
        if sPedido <> '' then
          sPedido := sPedido + ';';
        if Trim(FieldByName('PDV_DOCUMENTO').asString) <> '' then
          sPedido := sPedido + FieldByName('PDV_DOCUMENTO').asString        
        else
          sPedido := sPedido + FieldByName('PDV_CODIGO').asString;
        Next;
      end;
    end
    else
      sPedido := IntToStr(CdPDV);
  end;

  sMensagemImpressa := Entidade.MensagemImpressa + sPedido;

  if Length(sMensagemImpressa) > 144 then
    sMensagemImpressa := Copy(sMensagemImpressa, 1, 140) + '...';

  STR :=
    //Código do Banco na Compensação (3 N)
    PreencheZero(3, Entidade.NumeroBanco)+
    //Lote de Serviço (4 N)
    PreencheZero(4, PLoteServico)+
    //Registro Detalhe (1 N)
    '3'+
    //N Sequencial do Reg. no Lote
    PreencheZero(5, PNSeqReg)+
    //Cod. Segmento do Reg. Detalhe
    PreencheEspaco(1, 'S')+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(1, ' ')+
    //Cod. Movimento
    PreencheZero(2, 1)+ //Entrada de Títulos
    //Identificação da Impressão
    PreencheZero(1, Entidade.IdentificacaoMensagem+1)+
    //Número da Linha a ser Impressa
    PreencheZero(2, Entidade.LinhaMensagem)+
    //Mensagem a ser Impressa
    PreencheEspaco(140, sMensagemImpressa)+
    //Tipo de Caracter a ser Impresso
    PreencheZero(2, Entidade.FonteMensagem+1)+
    //Uso Exclusivo FEBRABAN/CNAB
    PreencheEspaco(78, ' ');
  Result := PreencheEspaco(240, STR);
end;


procedure TfCadBancoBoleto.SB_ReceberClick(Sender: TObject);
var
  ind, iLinha, CdCNC, CdTRC, iContaTitulosPagos: integer;
  Linha: string;
  F: TextFile;
  RegistrosT: array of TRegistroT;
  RegistrosU: array of TRegistroU;
  Trans:Boolean;
  vDesconto, vJuros, vValorPago: Double;
  vDataPgto: TDateTime;
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6570)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para Receber Arquivo!');
  if not OpenDialog1.Execute then
    Exit;

  sNomeArq := OpenDialog1.FileName;
  DtGerArq := 0;
  iSeqArq       := 0;
  iVersaoLayOut := 0;
  sAgencia := '';
  sConta   := '';

  AssignFile(F, sNomeArq);
  Reset(F);

  iLinha := 0;
  try
    sRegP := '';
    sRegQ := '';
    sRegR := '';
    sRegS := '';
    sRegT := '';
    sRegU := '';
    sRegW := '';

    while not Eof(F) do
    Begin
      inc(iLinha); //Número da Linha
      Readln(F, Linha);
      if Copy(Linha, 8, 1) = '0' then //Cabeçalho do Arquivo
      Begin
        iSeqArq       := StrToInt(Copy(Linha, 158, 6));
        iVersaoLayOut := StrToInt(Copy(Linha, 164, 3));
        sAgencia      := PreencheZero(5, Copy(Linha, 53, 5)) +'-'+PreencheZero(1, Copy(Linha, 58, 1));
        sConta        := PreencheZero(5, Copy(Linha, 59, 12))+'-'+PreencheZero(1, Copy(Linha, 71, 1));
        if StrToInt(Copy(Linha, 144, 8)) > 0 then
          DtGerArq := StrToDateTime(Copy(Linha, 144,2)+'/'+ //Dia
                                Copy(Linha, 146,2)+'/'+ //Mes
                                Copy(Linha, 148,4)+' '+ //Ano
                                Copy(Linha, 152,2)+':'+ //Hora
                                Copy(Linha, 154,2)+':'+ //Minuto
                                Copy(Linha, 156,2));    //Segundo
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT RBO_CODIGO '+
            ' FROM REGISTRO_BOLETO '+
            ' WHERE RBO_SEQUENCIA_ARQUIVO='+IntToStr(iSeqArq)+
            ' AND RBO_DT_GERACAO_ARQUIVO="'+MesDiaHora(DtGerArq)+'" ';
          Open;
          if not isEmpty then
          Begin
            ShowMessage('Arquivo já recebido!');
            Raise exception.Create('');
          end;
        end;
      end
      else if Copy(Linha, 8, 1) = '1'  then //Cabeçalho do Lote
      Begin
        //
      end
      else if Copy(Linha, 8, 1) = '5' then  //Rodapé Lote
      Begin
        //
      end
      else if Copy(Linha, 8, 1) = '9' then //Rodape Página
      Begin
        //
      end
      else if (Copy(Linha, 14, 1) = 'T') then //Segmento T
      Begin
        if sRegT <> '' then
          if not IncluirRegistroBoleto(1(*Entrada*)) then
            Raise exception.Create('');
        sRegT := Linha;
        SetLength(RegistrosT, High(RegistrosT)+2);
        ind := High(RegistrosT);

        RegistrosT[ind][colbanco]             := Copy(Linha,   1, 3);
        RegistrosT[ind][colLoteServico]       := Copy(Linha,   4, 4);
        RegistrosT[ind][colRegistro]          := Copy(Linha,   8, 1);
        RegistrosT[ind][colSeqRegLote]        := Copy(Linha,   9, 5);
        RegistrosT[ind][colCodSegmento]       := Copy(Linha,  14, 1);
        RegistrosT[ind][colUsoExclusivo1]     := Copy(Linha,  15, 1);
        RegistrosT[ind][colCodMovimento]      := Copy(Linha,  16, 2);
        RegistrosT[ind][colAgMantedora]       := Copy(Linha,  18, 5);
        RegistrosT[ind][colDigAgMantedora]    := Copy(Linha,  23, 1);
        RegistrosT[ind][colContaMantedora]    := Copy(Linha,  24,12);
        RegistrosT[ind][colDigContaMantedora] := Copy(Linha,  36, 1);
        RegistrosT[ind][colDigAgConta]        := Copy(Linha,  37, 1);
        RegistrosT[ind][colUsoExclusivo2]     := Copy(Linha,  38, 9);
        RegistrosT[ind][colIdTituloBanco]     := Copy(Linha,  47, 11);
        RegistrosT[ind][colCodCarteira]       := Copy(Linha,  58, 1);
        RegistrosT[ind][colNumDocCobranca]    := Copy(Linha,  59, 11);
        RegistrosT[ind][colUsoExclusivo3]     := Copy(Linha,  70, 4);
        RegistrosT[ind][colDtVencimento]      := Copy(Linha,  74, 8);
        RegistrosT[ind][colValorTitulo]       := Copy(Linha,  82, 15);
        RegistrosT[ind][colBancoCob]          := Copy(Linha,  97, 3);
        RegistrosT[ind][colAgCob]             := Copy(Linha, 100, 5);
        RegistrosT[ind][colDigAgCob]          := Copy(Linha, 105, 1);
        RegistrosT[ind][colIdTituloEmpresa]   := Copy(Linha, 106,25);
        RegistrosT[ind][colCodMoeda]          := Copy(Linha, 131, 2);
        RegistrosT[ind][colTipoInscricao]     := Copy(Linha, 133, 1);
        RegistrosT[ind][colInscricao]         := Copy(Linha, 134,15);
        RegistrosT[ind][colNome]              := Copy(Linha, 149,40);
        RegistrosT[ind][colUsoExclusivo4]     := Copy(Linha, 189,10);
        RegistrosT[ind][colValorTarifa]       := Copy(Linha, 199,15);
        RegistrosT[ind][colMotivoOcorrencia]  := Copy(Linha, 214,10);
        RegistrosT[ind][colUsoExclusivo5]     := Copy(Linha, 224,17);
      end
      else if Copy(Linha, 14, 1) = 'U' then //Segmento U
      Begin
        if sRegU <> '' then
          if not IncluirRegistroBoleto(1(*Entrada*)) then
            Raise exception.Create('');
        sRegU := Linha;
        SetLength(RegistrosU, High(RegistrosT)+2);
        ind := High(RegistrosU);

        RegistrosU[ind][colbanco]           := Copy(Linha,   1, 3);
        RegistrosU[ind][colLoteServico]     := Copy(Linha,   4, 4);
        RegistrosU[ind][colRegistro]        := Copy(Linha,   8, 1);
        RegistrosU[ind][colSeqRegLote]      := Copy(Linha,   9, 5);
        RegistrosU[ind][colCodSegmento]     := Copy(Linha,  14, 1);
        RegistrosU[ind][colUsoExclusivo1]   := Copy(Linha,  15, 1);
        RegistrosU[ind][colCodMovimento]    := Copy(Linha,  16, 2);
        RegistrosU[ind][colValorJurosMulta] := Copy(Linha,  18,15);
        RegistrosU[ind][colValorDesconto]   := Copy(Linha,  33,15);
        RegistrosU[ind][colValorAbatimento] := Copy(Linha,  48,15);
        RegistrosU[ind][colValorIOF]        := Copy(Linha,  63,15);
        RegistrosU[ind][colValorPago]       := Copy(Linha,  78,15);
        RegistrosU[ind][colValorLiquido]    := Copy(Linha,  93,15);
        RegistrosU[ind][colValorOutrasDesp] := Copy(Linha, 108,15);
        RegistrosU[ind][colValorOutrosCred] := Copy(Linha, 123,15);
        RegistrosU[ind][colDtOcorrencia]    := Copy(Linha, 138, 8);
        RegistrosU[ind][colDtCredito]       := Copy(Linha, 146, 8);
        RegistrosU[ind][colUsoExclusivo6]   := Copy(Linha, 154,87);
      end
      else if Copy(Linha, 14, 1) = 'W' then //Segmento W
      Begin
        if sRegW <> '' then
          if not IncluirRegistroBoleto(1(*Entrada*)) then
            Raise exception.Create('');
        sRegW := Linha;
      end;
    end;
    if (sRegU <> '') or (sRegT <> '') or (sRegW <> '') then
      if not IncluirRegistroBoleto(1(*Entrada*)) then
        Raise exception.Create('');
  except
    ShowMessage('Falha na Linha '+IntToStr(iLinha));
    Exit;
  end;

  try
    Application.CreateForm(Trpt_RegistroBoleto,rpt_RegistroBoleto);
    with rpt_RegistroBoleto do
    Begin
      If MessageDlg('Deseja exibir em modo sintético?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        zrbDetalhe.Height := 1;
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * '+
        ' FROM REGISTRO_BOLETO '+
        ' WHERE RBO_DT_GERACAO_ARQUIVO>="'+MesDia(DtGerArq)+'" '+
        ' AND RBO_DT_GERACAO_ARQUIVO<"'+MesDia(DtGerArq+1)+'" '+
        ' AND RBO_SEQUENCIA_ARQUIVO='+IntToStr(iSeqArq);
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Nenhum Registro Recebido!');
      report.Preview;
      Entidade.Close;
      Close;
    end;

    If MessageDlg('ATENÇÃO!!!'+#13+'Deseja processar o(s) título(s) Liquidado(s)?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

    with DM.qr_consultas2 do
    Begin
      Close;
      SQL.Text := 'SELECT * '+
        ' FROM REGISTRO_BOLETO '+
        ' WHERE RBO_DT_GERACAO_ARQUIVO>="'+MesDia(DtGerArq)+'" '+
        ' AND RBO_DT_GERACAO_ARQUIVO<"'+MesDia(DtGerArq+1)+'" '+
        ' AND RBO_SEQUENCIA_ARQUIVO='+IntToStr(iSeqArq)+
        ' AND RBO_TIPO=1 '+
        ' AND RBO_SITUACAO=0 ';
      Open;
      iContaTitulosPagos := 0;
      while not Eof do
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

            if Copy(FieldByName('RBO_SEGMENTO_U').asString,  16, 2) = '06' then //Liquidação
            Begin
              CdCNC := StrToInt(Copy(FieldByName('RBO_SEGMENTO_T').asString,  106,2));
              CdTRC := StrToInt(Copy(FieldByName('RBO_SEGMENTO_T').asString,  108,8));
              vJuros     := StringReal(Copy(FieldByName('RBO_SEGMENTO_U').asString,  18,15));
              vDesconto  := StringReal(Copy(FieldByName('RBO_SEGMENTO_U').asString,  33,15));
              vValorPago := StringReal(Copy(FieldByName('RBO_SEGMENTO_U').asString,  93,15));
              if (Copy(FieldByName('RBO_SEGMENTO_U').asString, 138, 8) <> '00000000') then
                vDataPgto := StrToDate(Copy(FieldByName('RBO_SEGMENTO_U').asString, 138, 2)+'/'+ //Dia
                   Copy(FieldByName('RBO_SEGMENTO_U').asString, 140, 2)+'/'+ //Mes
                   Copy(FieldByName('RBO_SEGMENTO_U').asString, 142, 4))     //Ano
              else
                vDataPgto  := 0;

              if (CdCNC>0) and (CdTRC>0) then
              Begin
                Inc(iContaTitulosPagos);
                //Baixar o Título
                ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
                  ' TRC_VALOR_PAGO='  +VirgPonto(vValorPago)+
                  ',TRC_DESCONTO='    +VirgPonto(vDesconto)+
                  ',TRC_JUROS='       +VirgPonto(vJuros)+
                  ',USU_CODIGO='      +IntToStr(DM.Configuracao1.CodigoUSU)+
                  ',TRC_SITUACAO=2 '+
                  ',TRC_PAGAMENTO="'  +MesDiaHora(vDataPgto)+'" '+
                  ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ',CCX_CODIGO_REC=CCX_CODIGO '+
                  ',TRC_GEROU_MOVIMENTO=0 '+
                  ',TRC_DT_RECEBIMENTO_BOLETO="'+MesDiaHora(DtGerArq)+'" '+
                  ',TRC_OBSERVACAO=TRC_OBSERVACAO+"(BOLETO-AUTO)" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND TRC_CODIGO='+IntToStr(CdTRC)+
                  ' AND TRC_SITUACAO=0 ');
              end;
            end;

            //Mudar Situacao do Registro de Boleto
            ExecutaSQL(DM.QR_Comandos,'UPDATE REGISTRO_BOLETO SET '+
              ' RBO_SITUACAO=2 '+
              ' WHERE CNC_CODIGO='+FieldByName('CNC_CODIGO').asString+
              ' AND RBO_CODIGO='+FieldByName('RBO_CODIGO').asString);

            If DM.Configuracao1.ControleTransacao then
              Commit;
            Trans := False;

          except
            If DM.Configuracao1.ControleTransacao then
              if trans then
              Begin
                RollBack;
                ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
              end;
          end;
        end;
        Next;
      end;
      ShowMessage('Processado(s) '+IntToStr(iContaTitulosPagos)+' Título(s)!');
    end;
  except
  end;

  DM.Usuario1.GeraLog(6570, Entidade.CodigoCNC, Entidade.CodigoBNB,
    'Arq:'+sNomeArq+' SeqArq:'+IntToStr(iSeqArq)+' DtArq:'+DateTimeToStr(DtGerArq)+' LAYOUT:'+Entidade.Leiaute);
end;

procedure TfCadBancoBoleto.SB_ImprimirEnvioClick(Sender: TObject);
var
  sFiltros, sFiltroGrupoEspecial, sVerificado, sVerificadoUpdate: string;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');

  sVerificado :=  ' AND T1.TRC_VERIFICADO='+IntToStr(Entidade.CodigoBNB);
  sVerificadoUpdate := ' AND TRC_VERIFICADO='+IntToStr(Entidade.CodigoBNB);

  if Entidade.GrupoEspecial then
  Begin
    sFiltros := '(Grupo Especial)';
    sFiltroGrupoEspecial := ' AND (T1.PDV_CODIGO IN (SELECT P1.PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE T1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PDV_GRUPO_ESPECIAL=1) '+
      ' OR T1.PDV_CODIGO IN (SELECT P1.PDV_CODIGO '+
      ' FROM PACOTE_DE_VENDA P1 '+
      ' WHERE T1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PCT_GRUPO_ESPECIAL=1)) ';
  end
  else
  Begin
    sFiltros := '(Grupo Normal)';
    sFiltroGrupoEspecial := ' AND (T1.PDV_CODIGO NOT IN (SELECT P1.PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE T1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PDV_GRUPO_ESPECIAL=1) '+
      ' AND T1.PDV_CODIGO NOT IN (SELECT P1.PDV_CODIGO '+
      ' FROM PACOTE_DE_VENDA P1 '+
      ' WHERE T1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND P1.PCT_GRUPO_ESPECIAL=1)) ';
  end;

  Application.CreateForm(Trpt_receber,rpt_receber);
  with rpt_receber do
  Begin
//    //Meia Folha
//    report.Options.PageLength := 32;
    zrlTitulo.Caption := 'SIAC - Relatorio de Boletos bancarios';

    zrlDescOrigem.Caption := 'Pedido';

    zrlFiltros.Caption := '(Para Banco)' + sFiltros;

    zrbGrupo.Expression := '';
    zrbGrupo.Height := 0;
    zrbRodapeDia.Height := 0;

    zrbGrupoCaixa.Expression := '';
    zrbGrupoCaixa.Height := 0;

    Titulo_receber1.Close;
    Titulo_receber1.SQL.Text := 'SELECT T1.*, C1.* '+
      ',0 AS CCX_GRUPO '+
      ',0 AS Dia '+
      ',0 AS Mes '+
      ',0 AS ANO '+
      ' FROM TITULO_A_RECEBER T1, CLIENTE C1 '+
      ' WHERE T1.TRC_SITUACAO IN (0,1,8,9) '+
      ' AND T1.TRC_TIPO_PAG=412 '+
      ' AND TRC_SITUACAO<>5 '+
      ' AND (T1.TRC_DT_EMISSAO_BOLETO=0 OR T1.TRC_DT_EMISSAO_BOLETO IS NULL) '+
      sFiltroGrupoEspecial+sVerificado+
      ' AND T1.CNC_CLIENTE*=C1.CNC_CODIGO '+
      ' AND T1.CLI_CODIGO*=C1.CLI_CODIGO ';
    Titulo_receber1.Open;
    if Titulo_receber1.IsEmpty then
      Raise Exception.Create('Consulta Vazia!');
    report.Preview;
    Titulo_receber1.Close;
    Close;
  end;
end;

function TfCadBancoBoleto.IncluirRegistroBoleto(PTipo: Integer):Boolean;
begin
  Result := False;
  if not Registro_Boleto1.Inserir(PTipo(*0 - Saida; 1 - Entrada*), iSeqArq, iVersaoLayOut, DtGerArq,
    sAgencia, sConta, sRegP, sRegQ, sRegR, sRegS, sRegT, sRegU, sRegW, ''(*DadosTituloCBR454*), sNomeArq, '' (*Obs*)) then
  Begin
    Showmessage('Falha ao gerar Registro_Boleto!');
    Exit;
  end
  else
  Begin
    Result := True;
    sRegP := '';
    sRegQ := '';
    sRegR := '';
    sRegS := '';
    sRegT := '';
    sRegU := '';
    sRegW := '';
  end;
end;

procedure TfCadBancoBoleto.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
