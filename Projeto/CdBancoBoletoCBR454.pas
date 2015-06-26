unit CdBancoBoletoCBR454;
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
  TfCadBancoBoletoCBR454 = class(TForm)
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
    cmbCodigoCarteira: TComboBox;
    cmbCodigoMoeda: TComboBox;
    edtDiasProtesto: TEdit;
    Label17: TLabel;
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
    cmbFonteInstrucao1: TComboBox;
    Label30: TLabel;
    edtNomeEmpresa: TEdit;
    edtNomeBanco: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edtNumeroBanco: TEdit;
    Label36: TLabel;
    edtInstrucao1: TEdit;
    Label39: TLabel;
    Label41: TLabel;
    cmbIdentificacaoEmissaoBloqueto: TComboBox;
    Label45: TLabel;
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
    Titulo_receber1: TTitulo_receber;
    Cliente1: TCliente;
    Parametro1: TParametro;
    SB_Receber: TSpeedButton;
    Informacoes1: TInformacoes;
    SB_ImprimirEnvio: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Registro_Boleto1: TRegistro_Boleto;
    N3: TMenuItem;
    Label57: TLabel;
    edtLeiaute: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    cmbFonteInstrucao5: TComboBox;
    edtInstrucao5: TEdit;
    cmbFonteInstrucao2: TComboBox;
    edtInstrucao2: TEdit;
    cmbFonteInstrucao6: TComboBox;
    edtInstrucao6: TEdit;
    edtInstrucao3: TEdit;
    edtInstrucao4: TEdit;
    cmbFonteInstrucao3: TComboBox;
    cmbFonteInstrucao7: TComboBox;
    edtInstrucao7: TEdit;
    cmbFonteInstrucao4: TComboBox;
    cmbFonteInstrucao8: TComboBox;
    edtInstrucao8: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    cmbFonteMensagem1: TComboBox;
    edtMensagem1: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    cmbFonteMensagem10: TComboBox;
    edtMensagem10: TEdit;
    cmbFonteMensagem2: TComboBox;
    edtMensagem2: TEdit;
    cmbFonteMensagem11: TComboBox;
    edtMensagem11: TEdit;
    edtMensagem3: TEdit;
    edtMensagem4: TEdit;
    cmbFonteMensagem3: TComboBox;
    cmbFonteMensagem12: TComboBox;
    edtMensagem12: TEdit;
    cmbFonteMensagem4: TComboBox;
    cmbFonteMensagem13: TComboBox;
    edtMensagem13: TEdit;
    cmbFonteMensagem5: TComboBox;
    edtMensagem5: TEdit;
    cmbFonteMensagem14: TComboBox;
    edtMensagem14: TEdit;
    edtMensagem6: TEdit;
    edtMensagem7: TEdit;
    cmbFonteMensagem6: TComboBox;
    cmbFonteMensagem15: TComboBox;
    edtMensagem15: TEdit;
    cmbFonteMensagem7: TComboBox;
    cmbFonteMensagem16: TComboBox;
    edtMensagem16: TEdit;
    edtMensagem8: TEdit;
    cmbFonteMensagem8: TComboBox;
    cmbFonteMensagem17: TComboBox;
    edtMensagem17: TEdit;
    edtMensagem9: TEdit;
    cmbFonteMensagem9: TComboBox;
    cmbFonteMensagem18: TComboBox;
    edtMensagem18: TEdit;
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
    F: TextFile;
    sDadosTitulo, sRegT, sRegU, sRegW, sNomeArq, sAgencia, sConta: string;
    iSeqArq, iVersaoLayOut: integer;
    DtGerArq: TDateTime;
    procedure AtualizaControles(Habilitar: Boolean);
    function CabecalhoArquivo:string;
    function RodapeArquivo(PQtdLotes, PQtdRegistrosArq, PQtdContasLotes: integer):string;
    function IncluirRegistroBoleto(PTipo: Integer):Boolean;
    function DadosDoTitulo(PNossoNumero: integer): string;
    function MensagemEspecifica(PMensagem: string; PFonte:integer): string;
    function InstrucaoEspecifica(PLinha1, PLinha2, PLinha3, PLinha4: string;
       PFonteLinha1,PFonteLinha2,PFonteLinha3,PFonteLinha4:integer): string;
    function MensagemFixa(PLinha1, PLinha2, PLinha3: string;
       PFonteLinha1,PFonteLinha2,PFonteLinha3:integer): string;
    function InstrucaoFixa(PLinha1, PLinha2, PLinha3, PLinha4: string;
       PFonteLinha1,PFonteLinha2,PFonteLinha3,PFonteLinha4:integer): string;
    { Private declarations }
  public
    DtEmissaoBoleto: TDateTime;
    Entidade:TBanco_Boleto;
  end;

const
  cFonteNormal  = 1;
  cFonteNegrito = 2;
  cFonteItalico = 3;

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
  fCadBancoBoletoCBR454: TfCadBancoBoletoCBR454;

implementation
Uses UDM, funcoes, Configuracao, Math, UReceber, URegistroBoleto;
{$R *.DFM}


procedure TfCadBancoBoletoCBR454.AtualizaControles(Habilitar:Boolean);
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

procedure TfCadBancoBoletoCBR454.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7760)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  edtLeiaute.Text := 'CBR454';
  cmbCodigoMoeda.ItemIndex := 5;
  AtualizaControles(true);
  edtCodigoConvenio.SetFocus;
end;

procedure TfCadBancoBoletoCBR454.SB_AltCabClick(Sender: TObject);
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

procedure TfCadBancoBoletoCBR454.SB_ExcCabClick(Sender: TObject);
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

procedure TfCadBancoBoletoCBR454.SB_SalvaCabClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
    AtualizaControles(False)                                
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadBancoBoletoCBR454.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadBancoBoletoCBR454.FormCreate(Sender: TObject);
begin
  DtEmissaoBoleto := 0;
  Entidade:=Banco_Boleto1;
end;

procedure TfCadBancoBoletoCBR454.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadBancoBoletoCBR454.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadBancoBoletoCBR454.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfCadBancoBoletoCBR454.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadBancoBoletoCBR454.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Open;
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadBancoBoletoCBR454.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadBancoBoletoCBR454.Banco_Boleto1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadBancoBoletoCBR454.SB_GerarBoletoClick(Sender: TObject);
var
  CdCNC, CdBNB, CdCNCPDV, CdPDV, CdFPE, vNumeroRemessa, CdBol, iQtdRegistros: integer;
  Trans: Boolean;
  sVerificado, sVerificadoUpdate, sInstrucaoFixa, sMensagemFixa, sInstrucaoEspecifica, sPedido: string;
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

  sNomeArq := 'C:\BOLETOS_B'+PreencheZero(2,CdBNB)+'_'+formatDateTime('DDMMYYYY_HHMM',DM.Configuracao1.DataHora)+'.TXT';

  sDadosTitulo := '';
  sRegT := '';
  sRegU := '';
  sRegW := '';

  AssignFile(F, sNomeArq);
  Rewrite(F);
  try
    //Layout Novo
    iQtdRegistros := 1; //Contar com Cabeçalho

    //Gerar Cabeçalho do Arquivo
    Writeln(F, CabecalhoArquivo);

    //Instruções Fixas (Max: 02)
    if (Trim(Entidade.Instrucao1) <> '') or
       (Trim(Entidade.Instrucao2) <> '') or
       (Trim(Entidade.Instrucao3) <> '') or
       (Trim(Entidade.Instrucao4) <> '') or
       (Trim(Entidade.Instrucao5) <> '') or
       (Trim(Entidade.Instrucao6) <> '') or
       (Trim(Entidade.Instrucao7) <> '') or
       (Trim(Entidade.Instrucao8) <> '') then
    Begin
      sInstrucaoFixa := InstrucaoFixa(Entidade.Instrucao1, Entidade.Instrucao2, Entidade.Instrucao3, Entidade.Instrucao4,
                                      Entidade.FonteInstrucao1+1,Entidade.FonteInstrucao2+1,Entidade.FonteInstrucao3+1,Entidade.FonteInstrucao4+1);
      Writeln(F, sInstrucaoFixa);
    end;
    if (Trim(Entidade.Instrucao5) <> '') or
       (Trim(Entidade.Instrucao6) <> '') or
       (Trim(Entidade.Instrucao7) <> '') or
       (Trim(Entidade.Instrucao8) <> '') then
    Begin
      sInstrucaoFixa := InstrucaoFixa(Entidade.Instrucao5, Entidade.Instrucao6, Entidade.Instrucao7, Entidade.Instrucao8,
                                      Entidade.FonteInstrucao5+1,Entidade.FonteInstrucao6+1,Entidade.FonteInstrucao7+1,Entidade.FonteInstrucao8+1);
      Writeln(F, sInstrucaoFixa);
    end;

    //Mensagens Fixas (Max: 07) Limitado em seis pelo componente do SIAC devido ao tamanho a tela de cadastro.
    if (Trim(Entidade.Mensagem1) <> '') or (Trim(Entidade.Mensagem2) <> '') or (Trim(Entidade.Mensagem3) <> '') or
       (Trim(Entidade.Mensagem4) <> '') or (Trim(Entidade.Mensagem5) <> '') or (Trim(Entidade.Mensagem6) <> '') or
       (Trim(Entidade.Mensagem7) <> '') or (Trim(Entidade.Mensagem8) <> '') or (Trim(Entidade.Mensagem9) <> '') or
       (Trim(Entidade.Mensagem10) <> '') or (Trim(Entidade.Mensagem11) <> '') or (Trim(Entidade.Mensagem12) <> '') or
       (Trim(Entidade.Mensagem13) <> '') or (Trim(Entidade.Mensagem14) <> '') or (Trim(Entidade.Mensagem15) <> '') or
       (Trim(Entidade.Mensagem16) <> '') or (Trim(Entidade.Mensagem17) <> '') or (Trim(Entidade.Mensagem18) <> '') then
    Begin
      sMensagemFixa := MensagemFixa(Entidade.Mensagem1, Entidade.Mensagem2, Entidade.Mensagem3,
                                    Entidade.FonteMensagem+1,Entidade.FonteMensagem2+1,Entidade.FonteMensagem3+1);
      Writeln(F, sMensagemFixa);
    end;
    if (Trim(Entidade.Mensagem4) <> '') or (Trim(Entidade.Mensagem5) <> '') or (Trim(Entidade.Mensagem6) <> '') or
       (Trim(Entidade.Mensagem7) <> '') or (Trim(Entidade.Mensagem8) <> '') or (Trim(Entidade.Mensagem9) <> '') or
       (Trim(Entidade.Mensagem10) <> '') or (Trim(Entidade.Mensagem11) <> '') or (Trim(Entidade.Mensagem12) <> '') or
       (Trim(Entidade.Mensagem13) <> '') or (Trim(Entidade.Mensagem14) <> '') or (Trim(Entidade.Mensagem15) <> '') or
       (Trim(Entidade.Mensagem16) <> '') or (Trim(Entidade.Mensagem17) <> '') or (Trim(Entidade.Mensagem18) <> '') then
    Begin
      sMensagemFixa := MensagemFixa(Entidade.Mensagem4, Entidade.Mensagem5, Entidade.Mensagem6,
                                    Entidade.FonteMensagem4+1,Entidade.FonteMensagem5+1,Entidade.FonteMensagem6+1);
      Writeln(F, sMensagemFixa);
    end;
    if (Trim(Entidade.Mensagem7) <> '') or (Trim(Entidade.Mensagem8) <> '') or (Trim(Entidade.Mensagem9) <> '') or
       (Trim(Entidade.Mensagem10) <> '') or (Trim(Entidade.Mensagem11) <> '') or (Trim(Entidade.Mensagem12) <> '') or
       (Trim(Entidade.Mensagem13) <> '') or (Trim(Entidade.Mensagem14) <> '') or (Trim(Entidade.Mensagem15) <> '') or
       (Trim(Entidade.Mensagem16) <> '') or (Trim(Entidade.Mensagem17) <> '') or (Trim(Entidade.Mensagem18) <> '') then
    Begin
      sMensagemFixa := MensagemFixa(Entidade.Mensagem7, Entidade.Mensagem8, Entidade.Mensagem9,
                                    Entidade.FonteMensagem7+1,Entidade.FonteMensagem8+1,Entidade.FonteMensagem9+1);
      Writeln(F, sMensagemFixa);
    end;
    if (Trim(Entidade.Mensagem10) <> '') or (Trim(Entidade.Mensagem11) <> '') or (Trim(Entidade.Mensagem12) <> '') or
       (Trim(Entidade.Mensagem13) <> '') or (Trim(Entidade.Mensagem14) <> '') or (Trim(Entidade.Mensagem15) <> '') or
       (Trim(Entidade.Mensagem16) <> '') or (Trim(Entidade.Mensagem17) <> '') or (Trim(Entidade.Mensagem18) <> '') then
    Begin
      sMensagemFixa := MensagemFixa(Entidade.Mensagem10, Entidade.Mensagem11, Entidade.Mensagem12,
                                    Entidade.FonteMensagem10+1,Entidade.FonteMensagem11+1,Entidade.FonteMensagem12+1);
      Writeln(F, sMensagemFixa);
    end;
    if (Trim(Entidade.Mensagem13) <> '') or (Trim(Entidade.Mensagem14) <> '') or (Trim(Entidade.Mensagem15) <> '') or
       (Trim(Entidade.Mensagem16) <> '') or (Trim(Entidade.Mensagem17) <> '') or (Trim(Entidade.Mensagem18) <> '') then
    Begin
      sMensagemFixa := MensagemFixa(Entidade.Mensagem13, Entidade.Mensagem14, Entidade.Mensagem15,
                                    Entidade.FonteMensagem13+1,Entidade.FonteMensagem14+1,Entidade.FonteMensagem15+1);
      Writeln(F, sMensagemFixa);
    end;
    if (Trim(Entidade.Mensagem16) <> '') or (Trim(Entidade.Mensagem17) <> '') or (Trim(Entidade.Mensagem18) <> '') then
    Begin
      sMensagemFixa := MensagemFixa(Entidade.Mensagem16, Entidade.Mensagem17, Entidade.Mensagem18,
                                    Entidade.FonteMensagem16+1,Entidade.FonteMensagem17+1,Entidade.FonteMensagem18+1);
      Writeln(F, sMensagemFixa);
    end;

    with Titulo_receber1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM TITULO_A_RECEBER T1 '+
        ' WHERE T1.TRC_SITUACAO IN (0,1,8,9) '+
        ' AND T1.TRC_TIPO_PAG=412 '+
        ' AND TRC_SITUACAO<>5 '+
        ' AND (T1.TRC_DT_EMISSAO_BOLETO=0 OR T1.TRC_DT_EMISSAO_BOLETO IS NULL) '+
        sVerificado;
      Open;
      if IsEmpty then
      Begin
        ShowMessage('Não existem registros para o envio!');
        Exit;
      end;
      while not Eof do
      Begin
        Inc(iQtdRegistros);
        //Nosso Número
        inc(CdBOL);
        CdCNCPDV := CodigoCNC;
        CdPDV    := CodigoPDV;

        //Mensagem Específica (Max: 07) São impressas depois das fixas, mas têm prioridade de impressão.
        //Número dos Documentos
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT FPE_CODIGO '+
            ' FROM PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNCPDV)+
            ' AND PDV_CODIGO='+IntToStr(CdPDV);
          Open;
          if Trim(FieldByName('FPE_CODIGO').asString) <> '' then
          Begin
            CdFPE := FieldByName('FPE_CODIGO').asInteger;
            Close;
            SQL.Text := 'SELECT P1.PDV_CODIGO, P1.PDV_DOCUMENTO '+
              ' FROM PEDIDO_DE_VENDA P1 '+
              ' WHERE P1.CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNCPDV)+
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

        //Limite da Mensagem 1680 caracteres divididos em 21 linhas de 80 caracteres
        MensagemEspecifica(sPedido, cFonteNormal);
        //A função MensagemEspecifica já insere a(s) linha(s) no arquivo


        //Instrução Específica (Max: 02) São impressas antes das fixas e têm prioridade de impressão.
        //Instrução de Juros
        sInstrucaoEspecifica := InstrucaoEspecifica('JURS: Vl p/dia atraso R$ '+Format('%.2f',[Titulo_receber1.Valor*DM.Configuracao1.TaxaJuros/3000])+' apos '+DateToStr(Titulo_receber1.Vencimento),
                                 ''(*Linha2*),''(*Linha3*),''(*Linha4*), cFonteNegrito, cFonteNormal, cFonteNormal, cFonteNormal);
        Writeln(F, sInstrucaoEspecifica);

        //Dados do Título
        sDadosTitulo := DadosDoTitulo(CdBOL);
        Writeln(F, sDadosTitulo);


        //Salvar o Número do Boleto
        ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
          ' BOL_CODIGO='+IntToStr(CdBOL)+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND TRC_CODIGO='+IntToStr(CodigoTRC));

        //Salvar registro no Banco de Dados
        sAgencia      := PreencheZero(5, Entidade.NumeroAgencia) +'-'+PreencheZero(1, Entidade.DigitoAgencia);
        sConta        := PreencheZero(5, Entidade.NumeroConta)+'-'+PreencheZero(1, Entidade.DigitoConta);
        if not Registro_Boleto1.Inserir(0(*0 - Saida; 1 - Entrada*), iSeqArq, iVersaoLayOut, DtEmissaoBoleto,
          sAgencia, sConta, ''(*sRegP*), ''(*sRegQ*), ''(*sRegR*), ''(*sRegS*), sRegT, sRegU, sRegW, sDadosTitulo, sNomeArq, '' (*Obs*)) then
        Begin
          Showmessage('Falha ao gerar Registro_Boleto!');
          Exit;
        end;
        Next;
      end;
    end;

    //Rodapé do Arquivo
    Writeln(F, RodapeArquivo(0(*QtdLotes*),iQtdRegistros, 0(*QtdContasLotes*)));

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
          sVerificadoUpdate);

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
        Entidade.LocalizarCod(CdBNB);
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

function TfCadBancoBoletoCBR454.CabecalhoArquivo:String;
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
    //01-Tipo de Registro
    '01'+
    //02-Prefixo da agencia + DV-Prefixo da Agencia
    PreencheZero(4, Entidade.NumeroAgencia)+
    //03-Digito Verificador da Agencia
    PreencheEspaco(1, Entidade.DigitoAgencia)+
    //04-Código do Cedente
    PreencheZero(9, Entidade.NumeroConta)+
    //05-DV-Código do Cedente
    PreencheZero(1, Entidade.DigitoConta)+
    //06-Carteira
    PreencheZero(1, Entidade.CodigoCarteira+1)+
    //07-Variação
    PreencheZero(3, '' (*ATENÇÃO*))+
    //08-Número do Convênio
    PreencheZero(6,Entidade.CodigoConvenio)+
    //09-Nome do Cedente
    PreencheEspaco(45, Entidade.NomeEmpresa)+
    //10-Sigla do Cedente
    PreencheEspaco(10, sSiglaCedente)+
    //11-Tipo de Impressão
    PreencheZero(1, cmbIdentificacaoEmissaoBloqueto.ItemIndex+1)+
    //12-Endereço para devolução
    PreencheEspaco(60, sEnderecoDevolucao)+
    //13-CEP para Devolução
    PreencheEspaco(8, sCEPDevolucao)+
    //14-Praça para Devolução
    PreencheEspaco(20, sPracaDevolucao)+
    //15-Sequencial da Remessa
    PreencheZero(7, iSeqArq)+
    //16-Indicador de Conferência do Sequencial da remessa S-Confere / N-NãoConfere
    'N'+
    //17-Espaços Configuração do Carnê
    PreencheEspaco(2, ' ')+
    //18-Espaços Configuração do Carnê
    PreencheEspaco(2, ' ')+
    //19-Identificador do arquivo informar CBR454
    PreencheEspaco(8, 'CBR454')+
    //20-Reservado - Uso do Banco
    PreencheEspaco(3, ' ');
    //21-Espaços Personalizar Carnê
    PreencheEspaco(53, ' ');
  Result := PreencheEspaco(250, STR);
end;

function TfCadBancoBoletoCBR454.RodapeArquivo(PQtdLotes, PQtdRegistrosArq, PQtdContasLotes: integer):string;
var
  STR: string;
begin
  STR :=
    //01-Tipo de Registro
    '99'+
    //02-Quantidade de Registros
    PreencheZero(15, PQtdRegistrosArq)+
    //03-Espaços
    PreencheEspaco(233, ' ');
  Result := PreencheEspaco(250, STR);
end;

function TfCadBancoBoletoCBR454.DadosDoTitulo(PNossoNumero: integer):string;
var
  STR, sAceito, sNossoNumero, sTipoDeInscricao, sNumeroInscricao, sEndereco, sBairro, sCEP, sCidade, sUF: string;
  CdCNC, CdTRC, iCodigoMoeda: integer;
begin
  CdCNC := Titulo_receber1.CodigoCNC;
  CdTRC := Titulo_receber1.CodigoTRC;

  if Entidade.Aceite then
    sAceito := 'S'
  else
    sAceito := 'N';

  case cmbCodigoMoeda.ItemIndex of
    0: iCodigoMoeda :=  1; //FAJ-TR
    1: iCodigoMoeda :=  2; //Dolar
    2: iCodigoMoeda :=  6; //FTR
    3: iCodigoMoeda :=  7; //IDTR
    4: iCodigoMoeda :=  8; //UFIR
    5: iCodigoMoeda :=  9; //Real
    6: iCodigoMoeda := 10; //UFESP
    else
      iCodigoMoeda := 0;
  end;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Titulo_receber1.ClienteCNC;
    ParamByName('CLI_CODIGO').asInteger := Titulo_receber1.CodigoCLI;
    Open;
    if IsEmpty then
      Raise exception.Create('Cliente não encontrado! ('+IntToStr(Titulo_receber1.ClienteCNC)+'-'+IntToStr(Titulo_receber1.CodigoCLI));

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

    //Tipo de CPF
    if not VerificaCPFCNPJBranco(CPFCGC) then
    Begin
      sTipoDeInscricao := '3';
      sNumeroInscricao := '0';
    end
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
      sTipoDeInscricao := '3';
      sNumeroInscricao := '0';
    end;
  end;

  //Nosso Número sem Dígito ainda
  sNossoNumero := PreencheZero(6,Entidade.CodigoConvenio)+PreencheZero(5,PNossoNumero);
  STR :=
    //01-Tipo de Registro
    '10'+
    //02-Tipo de Documento do Sacado
    sTipoDeInscricao+
    //03-CPD/CNPJ do Sacado
    PreencheZero(15, sNumeroInscricao)+
    //04-Nome do Sacado
    PreencheEspaco(60, PreencheEspaco(37,Cliente1.RazaoSocial))+ //Limitar em 37 posições
    //05-Endereco
    PreencheEspaco(60, PreencheEspaco(37,sEndereco+' '+sBairro))+ //Limitar em 37 posições
    //06-CEP + Sufixo do CEP
    PreencheEspaco(8, sCEP, '0')+
    //07-Cidade
    PreencheEspaco(18, PreencheEspaco(15,sCidade))+ //Limitar em 15 posições
    //08-UF
    PreencheEspaco(2, sUf)+
    //09-Data de Emissão DDMMAA
    FormatDateTime('DDMMYY',Titulo_receber1.DataCadastro)+
    //10-Data de Vencimento (DDMMAA), (888888 a Vista), (999999 Apresentação), (000000 campo em branco)
    FormatDateTime('DDMMYY',Titulo_receber1.Vencimento)+
    //11-Aceite
    sAceito+
    //12-Espécie de Título
    //AP-Apólice de seguro
    //DU-Dívida Ativa da União
    //DE-Dívida Ativa de Estado
    //DP-Dívida Ativa de Municipio
    //DM-Duplicata Mercantil
    //DS-Duplicata de Prest. Serviço
    //LC-Letra de Câmbio
    //ND-Nota de Débito
    //RC-Recibo
    //SG-Nota de Seguro
    //NP-Nota Promissória
    'DM'+ //Duplicata Mercantil
    //13-Nosso Número
    sNossoNumero+
    //14-DV-Nosso Número
    DigitoModulo11(sNossoNumero)+
    //15-Número do Título atribuído pelo cedente
    PreencheEspaco(15, PreencheZero(2,CdCNC)+PreencheZero(8,CdTRC))+ //Limitar em 10 posições
    //16-Tipo de Moeda
    //01:FAJ-TR
    //02:Dolar
    //06:FTR
    //07:IDTR
    //08:UFIR
    //09:REAL
    //10:UFESP
    PreencheZero(2, iCodigoMoeda)+
    //17-Quantidade de Moeda Variavel
    PreencheZero(15, 0)+
    //18-Valor do Título
    PreencheZero(15, TiraVirgula(Titulo_receber1.Valor))+
    //19-Prazo para protesto
    //a) zeros quando não houer
    //b) 03, 04, 05 dias úteis
    //c) 06, 30, 35, 40 ou 45 dias corridos
    PreencheZero(2, Entidade.DiasProtesto)+
    //20-Espaços
    PreencheEspaco(6, ' ');
    //21-Total de Parcelas
    PreencheZero(2, 1);

  Result := PreencheEspaco(250, STR);
end;

procedure TfCadBancoBoletoCBR454.SB_ReceberClick(Sender: TObject);
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
    sDadosTitulo := '';
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

procedure TfCadBancoBoletoCBR454.SB_ImprimirEnvioClick(Sender: TObject);
var
  sFiltros, sVerificado, sVerificadoUpdate: string;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');

  sVerificado :=  ' AND T1.TRC_VERIFICADO='+IntToStr(Entidade.CodigoBNB);
  sVerificadoUpdate := ' AND TRC_VERIFICADO='+IntToStr(Entidade.CodigoBNB);

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
      sVerificado+
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

function TfCadBancoBoletoCBR454.IncluirRegistroBoleto(PTipo: Integer):Boolean;
begin
  Result := False;
  if not Registro_Boleto1.Inserir(PTipo(*0 - Saida; 1 - Entrada*), iSeqArq, iVersaoLayOut, DtGerArq,
    sAgencia, sConta, ''(*sRegP*), ''(*sRegQ*), ''(*sRegR*), ''(*sRegS*), sRegT, sRegU, sRegW, sDadosTitulo, sNomeArq, '' (*Obs*)) then
  Begin
    Showmessage('Falha ao gerar Registro_Boleto!');
    Exit;
  end
  else
  Begin
    Result := True;
    sDadosTitulo := '';
    sRegT := '';
    sRegU := '';
    sRegW := '';
  end;
end;

procedure TfCadBancoBoletoCBR454.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

function TfCadBancoBoletoCBR454.MensagemEspecifica(PMensagem: string; PFonte: integer): string;
var
  i: integer;
  STR, sLinha1, sLinha2, sLinha3: string;
begin
  for i:=1 to 7 do
  Begin
    sLinha1 := '';
    sLinha2 := '';
    sLinha3 := '';
    if Length(PMensagem) > 80 then
    Begin
      sLinha1 := Copy(PMensagem,1,80);
      PMensagem := Copy(PMensagem,81,Length(PMensagem)-80);
    end
    else
    Begin
      sLinha1 := PMensagem;
      PMensagem := '';
    end;
    if Length(PMensagem) > 80 then
    Begin
      sLinha2 := Copy(PMensagem,1,80);
      PMensagem := Copy(PMensagem,81,Length(PMensagem)-80);
    end
    else
    Begin
      sLinha2 := PMensagem;
      PMensagem := '';
    end;
    if Length(PMensagem) > 80 then
    Begin
      if i = 7 then //Último Registro
      Begin
        sLinha3 := Copy(PMensagem,1,77)+'...'; //Informar que não está mostrando todos os documentos
        PMensagem := '';
      end
      else
      Begin
        sLinha3 := Copy(PMensagem,1,80);
        PMensagem := Copy(PMensagem,81,Length(PMensagem)-80);
      end;
    end
    else
    Begin
      sLinha3 := PMensagem;
      PMensagem := '';
    end;

    if (Trim(sLinha1)<>'') or
       (Trim(sLinha2)<>'') or
       (Trim(sLinha3)<>'') then
    Begin
      STR :=
        //01-Tipo de Registro
        '04'+
        //02-Tipo de Fonte da Instrucao1
        IntToStr(PFonte)+
        //03-Tipo de Fonte da Instrucao2
        IntToStr(PFonte)+
        //04-Tipo de Fonte da Instrucao3
        IntToStr(PFonte)+
        //05-Mensagem1
        PreencheEspaco(80, sLinha1)+
        //06-Mensagem2
        PreencheEspaco(80, sLinha2)+
        //07-Mensagem3
        PreencheEspaco(80, sLinha3)+
        //08-Espacos
        PreencheEspaco(5,' ');
      Writeln(F, PreencheEspaco(250, STR));
    end
    else
      Break;
    if Trim(PMensagem) = '' then
      Break;
  end;
end;

function TfCadBancoBoletoCBR454.InstrucaoEspecifica(PLinha1, PLinha2,
  PLinha3, PLinha4: string;
  PFonteLinha1, PFonteLinha2, PFonteLinha3, PFonteLinha4: integer): string;
var
  STR: string;
begin
  Result := '';
  if (Trim(PLinha1)<>'') or
     (Trim(PLinha2)<>'') or
     (Trim(PLinha3)<>'') or
     (Trim(PLinha4)<>'') then
  Begin
    STR :=
      //01-Tipo de Registro
      '05'+
      //02-Tipo de Fonte da Instrucao1
      IntToStr(PFonteLinha1)+
      //03-Tipo de Fonte da Instrucao2
      IntToStr(PFonteLinha2)+
      //04-Tipo de Fonte da Instrucao3
      IntToStr(PFonteLinha3)+
      //05-Tipo de Fonte da Instrucao4
      IntToStr(PFonteLinha4)+
      //06-Instrucao1
      PreencheEspaco(60, PLinha1)+
      //07-Instrucao2
      PreencheEspaco(60, PLinha2)+
      //08-Instrucao3
      PreencheEspaco(60, PLinha3)+
      //09-Instrucao4
      PreencheEspaco(60, PLinha4)+
      //10-Espacos
      PreencheEspaco(4,' ');
    Result := PreencheEspaco(250, STR);
  end;
end;

function TfCadBancoBoletoCBR454.InstrucaoFixa(PLinha1, PLinha2, PLinha3,
  PLinha4: string; PFonteLinha1, PFonteLinha2, PFonteLinha3,
  PFonteLinha4: integer): string;
var
  STR: string;
begin
  Result := '';
  if (Trim(PLinha1)<>'') or
     (Trim(PLinha2)<>'') or
     (Trim(PLinha3)<>'') or
     (Trim(PLinha4)<>'') then
  Begin
    STR :=
      //01-Tipo de Registro
      '02'+
      //02-Tipo de Fonte da Instrucao1
      IntToStr(PFonteLinha1)+
      //03-Tipo de Fonte da Instrucao2
      IntToStr(PFonteLinha2)+
      //04-Tipo de Fonte da Instrucao3
      IntToStr(PFonteLinha3)+
      //05-Tipo de Fonte da Instrucao4
      IntToStr(PFonteLinha4)+
      //06-Instrucao1
      PreencheEspaco(60, PLinha1)+
      //07-Instrucao2
      PreencheEspaco(60, PLinha2)+
      //08-Instrucao3
      PreencheEspaco(60, PLinha3)+
      //09-Instrucao4
      PreencheEspaco(60, PLinha4)+
      //10-Espacos
      PreencheEspaco(4,' ');
    Result := PreencheEspaco(250, STR);
  end;
end;

function TfCadBancoBoletoCBR454.MensagemFixa(PLinha1, PLinha2,
  PLinha3: string; PFonteLinha1, PFonteLinha2,
  PFonteLinha3: integer): string;
var
  STR: string;
begin
  Result := '';
  if (Trim(PLinha1)<>'') or
     (Trim(PLinha2)<>'') or
     (Trim(PLinha3)<>'') then
  Begin
    STR :=
      //01-Tipo de Registro
      '03'+
      //02-Tipo de Fonte da Instrucao1
      IntToStr(PFonteLinha1)+
      //03-Tipo de Fonte da Instrucao2
      IntToStr(PFonteLinha2)+
      //04-Tipo de Fonte da Instrucao3
      IntToStr(PFonteLinha3)+
      //05-Instrucao1
      PreencheEspaco(80, PLinha1)+
      //06-Instrucao2
      PreencheEspaco(80, PLinha2)+
      //07-Instrucao3
      PreencheEspaco(80, PLinha3)+
      //08-Espacos
      PreencheEspaco(4,' ');
    Result := PreencheEspaco(250, STR);
  end;
end;

end.
