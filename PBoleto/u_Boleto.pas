{Já ADD no Atualiza
ALTER TABLE TITULO_A_RECEBER ADD TRC_NOSSO_NUMERO INTEGER NULL;
ALTER TABLE TITULO_A_RECEBER ADD TRC_BOLETO CHAR(1) NULL;
ALTER TABLE TITULO_A_RECEBER ADD TRC_BOLETO_EMITIDO CHAR(1) NULL;
CREATE TABLE BOLETO_CONFIG (
    ID               INTEGER IDENTITY (1, 1) NOT NULL,
    PATH_REMESSA     VARCHAR(100),
    PATH_RETORNO     VARCHAR(100),
    PATH_LOGOTIPO    VARCHAR(100),
    PATH_GERARPDF    VARCHAR(100),
    MENSAGEM         VARCHAR(250),
    DIAS_PROTESTO    INTEGER,
    ESPECIE          VARCHAR(3),
    MOEDA            VARCHAR(3),
    ACEITE           CHAR(3),
    CARTEIRA         CHAR(3),
    LOCAL_PAGTO      VARCHAR(100),
    INSTRUCAO_1      VARCHAR(100),
    INSTRUCAO_2      VARCHAR(100),
    MSG_MULTA_JUROS  CHAR(1),
    PERCENTUAL_JUROS FLOAT,
    PERCENTUAL_MULTA FLOAT);
ALTER TABLE BOLETO_CONFIG ADD PRIMARY KEY (ID);
CREATE TABLE BOLETO_BANCO (
    ID                   INTEGER IDENTITY (1, 1) NOT NULL,
    NOME_BANCO			     VARCHAR(50),
    NOME_AGENCIA		     VARCHAR(50),
    NUMERO_AGENCIA	     VARCHAR(10),
    DIGITO_AGENCIA	     CHAR(1),
    NUMERO_CONTA		     VARCHAR(20),
    DIGITO_CONTA		     CHAR(1),
    CIDADE_AGENCIA		   VARCHAR(20),
    UF_AGENCIA			     CHAR(2),
    NOSSO_NUMERO		     VARCHAR(20),
    CEDENTE              VARCHAR(50),
    CONVENIO             VARCHAR(50),
    CNPJCIC              VARCHAR(20),
    MODALIDADE           VARCHAR(20),
    TIPO_INSCRICAO       CHAR(1),
    LAYOUT_REMESSA       VARCHAR(2),
    COD_CEDENTE          VARCHAR(20),
    CONT_REMESSA     INTEGER); --esse campo guarda o número da ultima remessa emitida
ALTER TABLE BOLETO_BANCO ADD PRIMARY KEY (ID);
UPDATE BOLETO_BANCO SET LAYOUT_REMESSA = '2';

BANCO ITAÚ		          341-7 //Número-Dígito
BRADESCO              	237-2 //Número-Dígito
CAIXA ECONÔMICA FEDERAL	104-0 //Número-Dígito
BANCO DO BRASIL		      001-9 //Número-Dígito

<SERIAL>1187E66B-806C-4062-90EC-D38958C8724D</SERIAL>
DATA_LIMITE: 31/03/2013

--ALTER TABLE BOLETO_BANCO ADD CONVENIO VARCHAR(50);
--ALTER TABLE BOLETO_BANCO ADD LAYOUT_REMESSA VARCHAR(2); (*1 = c400, 2 = c240*)
--UPDATE TITULO_A_RECEBER SET TRC_GEROU_REMESSA = NULL, TRC_BOLETO = NULL, TRC_BOLETO_EMITIDO = NULL, TRC_NOSSO_NUMERO = NULL
//
--ALTER TABLE BOLETO_BANCO ADD CNPJCIC VARCHAR(20);
--UPDATE BOLETO_BANCO SET CNPJCIC = '43089658372';
--ALTER TABLE BOLETO_BANCO ADD MODALIDADE VARCHAR(20);
--UPDATE BOLETO_BANCO SET MODALIDADE = '027';
--UPDATE BOLETO_CONFIG SET DIAS_PROTESTO = 5;

--ALTER TABLE BOLETO_BANCO ADD TIPO_INSCRICAO CHAR(1);
--UPDATE BOLETO_BANCO SET TIPO_INSCRICAO = '1'; --Físico
--UPDATE BOLETO_BANCO SET TIPO_INSCRICAO = '2'; --Jurídico

INSERT [BOLETO_CONFIG] ([PATH_REMESSA], [PATH_RETORNO], [PATH_LOGOTIPO], [PATH_GERARPDF], [MENSAGEM], [DIAS_PROTESTO], [ESPECIE], [MOEDA], [ACEITE], [CARTEIRA], [LOCAL_PAGTO], [INSTRUCAO_1], [INSTRUCAO_2], [CONT_REMESSA]) VALUES ('E:\FontesD7\Aplicativo\Boleto\Remessa', 'E:\FontesD7\Aplicativo\Boleto\Retorno', 'E:\FontesD7\Aplicativo\Boleto\Imagens\Colorido', 'E:\FontesD7\Aplicativo\Boleto\PDF', 'TESTE MENSAGEM', 5, 'DM', 'R$', 'N ', '09 ', 'PAGÁVEL EM QUALQUER BANCO ATÉ O VENCIMENTO', 'INSTRUÇÃO 01', 'INSTRUÇÃO 02', 39);
INSERT BOLETO_BANCO ([NOME_BANCO], [NOME_AGENCIA], [NUMERO_AGENCIA], [DIGITO_AGENCIA], [NUMERO_CONTA], [DIGITO_CONTA], [CIDADE_AGENCIA], [UF_AGENCIA], [NOSSO_NUMERO], [CEDENTE], [COD_CEDENTE], [CONVENIO], [LAYOUT_REMESSA], [CNPJCIC], [MODALIDADE], [TIPO_INSCRICAO]) VALUES ('BRADESCO', NULL, '0564', '9', '0123394', '7', 'FORTALEZA', 'CE', '14', 'ANTONIO JACKSON PINHEIRO ME', '1', NULL, '2', '00400972000173 ', '027', '2');
INSERT BOLETO_BANCO ([NOME_BANCO], [NOME_AGENCIA], [NUMERO_AGENCIA], [DIGITO_AGENCIA], [NUMERO_CONTA], [DIGITO_CONTA], [CIDADE_AGENCIA], [UF_AGENCIA], [NOSSO_NUMERO], [CEDENTE], [COD_CEDENTE], [CONVENIO], [LAYOUT_REMESSA], [CNPJCIC], [MODALIDADE], [TIPO_INSCRICAO]) VALUES ('BANCO DO BRASIL', NULL, '1605', '5', '999001', '1', 'FORTALEZA', 'CE', '52', 'CAMILO DE MORAES DIOGENES', '1', '2329668', '2', '43089658372', '027', '1');

ALTER TABLE BOLETO_CONFIG ADD PERCENTUAL_JUROS FLOAT;
ALTER TABLE BOLETO_CONFIG ADD PERCENTUAL_MULTA FLOAT;
UPDATE BOLETO_CONFIG SET PERCENTUAL_JUROS = 1;
UPDATE BOLETO_CONFIG SET PERCENTUAL_MULTA = 5;

ALTER TABLE BOLETO_BANCO ADD CONT_REMESSA INT;
UPDATE BOLETO_CONFIG SET CONT_REMESSA = 0;
UPDATE BOLETO_BANCO SET CONT_REMESSA = 1301611 WHERE NOME_BANCO = 'BRADESCO';

UPDATE BOLETO_CONFIG SET DIAS_PROTESTO = 0;
ALTER TABLE BOLETO_CONFIG ADD MSG_MULTA_JUROS CHAR(1);
UPDATE BOLETO_CONFIG SET MSG_MULTA_JUROS = 'S';
}
unit u_Boleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  ACBrBase, ACBrBoleto, ACBrBoletoFCQuickFr, ACBrUtil, DBCtrls, ShellAPI,
  Inifiles, funcoes, ActnList, XPStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, ActnMenus, ImgList, math, uDefKeyGen, Mask, Menus, SQuery,
  CentroCusto;

type
  TfrmBoleto = class(TForm)
    qTitulos: TQuery;
    dsTitulos: TDataSource;
    Panel1: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnGeraBoleto: TBitBtn;
    Label1: TLabel;
    cbxMarcaDesmarca: TCheckBox;
    OpenDialog1: TOpenDialog;
    btnGeraRemessa: TBitBtn;
    btnProcessaRetorno: TBitBtn;
    Label2: TLabel;
    ACBrBoleto1: TACBrBoleto;
    ACBrBoletoFCQuick1: TACBrBoletoFCQuick;
    qBoletoConfig: TQuery;
    SQLAux: TQuery;
    qBoletoBanco: TQuery;
    cbxBancoConta: TDBLookupComboBox;
    dsBoletoBanco: TDataSource;
    qBoletoConfigID: TAutoIncField;
    qBoletoConfigPATH_REMESSA: TStringField;
    qBoletoConfigPATH_RETORNO: TStringField;
    qBoletoConfigPATH_LOGOTIPO: TStringField;
    qBoletoConfigPATH_GERARPDF: TStringField;
    qBoletoConfigMENSAGEM: TStringField;
    qBoletoConfigDIAS_PROTESTO: TIntegerField;
    qBoletoConfigESPECIE: TStringField;
    qBoletoConfigMOEDA: TStringField;
    qBoletoConfigACEITE: TStringField;
    qBoletoConfigCARTEIRA: TStringField;
    qBoletoConfigLOCAL_PAGTO: TStringField;
    qBoletoConfigINSTRUCAO_1: TStringField;
    qBoletoConfigINSTRUCAO_2: TStringField;
    Label3: TLabel;
    qBoletoBancoID: TAutoIncField;
    qBoletoBancoNOME_BANCO: TStringField;
    qBoletoBancoNUMERO_AGENCIA: TStringField;
    qBoletoBancoDIGITO_AGENCIA: TStringField;
    qBoletoBancoNUMERO_CONTA: TStringField;
    qBoletoBancoDIGITO_CONTA: TStringField;
    qBoletoBancoCIDADE_AGENCIA: TStringField;
    qBoletoBancoUF_AGENCIA: TStringField;
    qBoletoBancoNOSSO_NUMERO: TStringField;
    qBoletoBancoCEDENTE: TStringField;
    qBoletoBancoCOD_CEDENTE: TStringField;
    qTitulosTRC_BOLETO: TStringField;
    qTitulosTRC_BOLETO_EMITIDO: TStringField;
    qTitulosCNC_CODIGO: TIntegerField;
    qTitulosPDV_CODIGO: TIntegerField;
    qTitulosTRC_CODIGO: TIntegerField;
    qTitulosTRC_NUMERO: TStringField;
    qTitulosTRC_SEQUENCIA: TStringField;
    qTitulosTRC_VALOR: TFloatField;
    qTitulosTRC_VENCIMENTO: TDateTimeField;
    qTitulosTRC_DT_CADASTRO: TDateTimeField;
    qTitulosTRC_OBSERVACAO: TStringField;
    qTitulosTRC_NOSSO_NUMERO: TIntegerField;
    qTitulosCLI_CODIGO: TIntegerField;
    qTitulosCLI_RZ_SOCIAL: TStringField;
    qTitulosCLI_CGC_CPF: TStringField;
    qTitulosCLI_NOME_FAN: TStringField;
    qTitulosCLI_BAIRRO: TStringField;
    qTitulosCLI_ENDERECO: TStringField;
    qTitulosCLI_CIDADE: TStringField;
    qTitulosCLI_UF: TStringField;
    qTitulosCLI_CEP: TStringField;
    cbxRemessasEmitidos: TCheckBox;
    imlMenu: TImageList;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManager1: TActionManager;
    CAD_CONFIGURACAO: TAction;
    CAD_CONTA_CORRENTE: TAction;
    REL_CONTA_CORRENTE: TAction;
    REL_TITULO: TAction;
    REL_BOLETO: TAction;
    ImTicado: TImageList;
    cbxBancos: TComboBox;
    btnSair: TBitBtn;
    qData: TQuery;
    qDataDATA: TDateTimeField;
    cbxData: TCheckBox;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label4: TLabel;
    btnLocaliza: TSpeedButton;
    qTitulosPDV_DATA_HORA: TDateTimeField;
    PopupMenu1: TPopupMenu;
    ImprimirBoleto1: TMenuItem;
    BoletoemPDF1: TMenuItem;
    N1: TMenuItem;
    EnviarEmail1: TMenuItem;
    Label5: TLabel;
    edtQtde: TEdit;
    edtValor: TEdit;
    Label6: TLabel;
    qTotais: TQuery;
    qBoletoBancoCONVENIO: TStringField;
    qBoletoBancoLAYOUT_REMESSA: TStringField;
    qBoletoBancoMODALIDADE: TStringField;
    qBoletoBancoTIPO_INSCRICAO: TStringField;
    qBoletoBancoCNPJCIC: TStringField;
    qBoletoConfigPERCENTUAL_JUROS: TFloatField;
    qBoletoConfigPERCENTUAL_MULTA: TFloatField;
    qTitulosCLI_NUMERO_END: TStringField;
    qRefSQL: TQuery;
    btnLog: TBitBtn;
    qBoletoBancoCONT_REMESSA: TIntegerField;
    qBoletoConfigMSG_MULTA_JUROS: TStringField;
    cbxMarcaDesmarcaRemessa: TCheckBox;
    Label44: TLabel;
    dblCentroDeCusto: TDBLookupComboBox;
    DSCentroCusto: TDataSource;
    CentroCusto2: TCentroCusto;
    cbxOrdem: TComboBox;
    Label7: TLabel;
    cbxCresc: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnGeraBoletoClick(Sender: TObject);
    procedure cbxMarcaDesmarcaClick(Sender: TObject);
    procedure cbxBancoContaClick(Sender: TObject);
    procedure btnGeraRemessaClick(Sender: TObject);
    procedure btnProcessaRetornoClick(Sender: TObject);
    procedure cbxBancoClick(Sender: TObject);
    procedure cbxRemessasEmitidosClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure cbxBancosChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxDataClick(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);
    procedure ImprimirBoleto1Click(Sender: TObject);
    procedure BoletoemPDF1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLogClick(Sender: TObject);
    procedure cbxMarcaDesmarcaRemessaClick(Sender: TObject);
    procedure dblCentroDeCustoClick(Sender: TObject);
    procedure cbxOrdemChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    sPathPDF, refSQL: string;
    sLOG: TStringList;
    function GetCNC: integer;
    procedure ConfiguraComponenteAcBr;
    procedure Ticar(bMarcaDesmarca: boolean);
    procedure TicarRemessa(bMarcaDesmarca: boolean);
    procedure MostraContas;
    procedure AtivaTitulos(bData: boolean; var sSQL: string);
    procedure SetACBr(iNossoNum: integer);
    function ValidaProcesso: boolean;
    function ValidaRegistro(trcCodigo, cncCodigo: integer): boolean;
    procedure HabilitaBotoes;
  public
    { Public declarations }
  end;

var
  frmBoleto: TfrmBoleto;

implementation

uses StrUtils, UDM;

{$R *.dfm}

procedure TfrmBoleto.FormCreate(Sender: TObject);
begin
  cbxOrdem.itemindex := 0;
  cbxCresc.itemindex := 0;
  sLOG := TStringList.Create;
  sLOG.Clear;
  CentroCusto2.Open;
  dblCentroDeCusto.KeyValue:=CentroCusto2.CodigoCNC;


  qBoletoConfig.Open;
  //MostraContas; //TODO
  AtivaTitulos(false,refSQL);
  HabilitaBotoes;
end;

procedure TfrmBoleto.ConfiguraComponenteAcBr;
begin
  if not qBoletoConfig.IsEmpty then
  begin
    if qBoletoBanco.FieldByName('NOME_BANCO').AsString = 'BANCO DO BRASIL' then
      ACBrBoleto1.Banco.TipoCobranca    := cobBancoDoBrasil
    else if qBoletoBanco.FieldByName('NOME_BANCO').AsString = 'BANCO ITAÚ' then
      ACBrBoleto1.Banco.TipoCobranca    := cobItau
    else if qBoletoBanco.FieldByName('NOME_BANCO').AsString = 'BRADESCO' then
      ACBrBoleto1.Banco.TipoCobranca    := cobBradesco
    else if qBoletoBanco.FieldByName('NOME_BANCO').AsString = 'CAIXA ECONÔMICA FEDERAL' then
      ACBrBoleto1.Banco.TipoCobranca    := cobCaixaEconomica
    else if qBoletoBanco.FieldByName('NOME_BANCO').AsString = 'SANTANDER' then
      ACBrBoleto1.Banco.TipoCobranca    := cobSantander
    else if qBoletoBanco.FieldByName('NOME_BANCO').AsString = 'HSBC' then
      ACBrBoleto1.Banco.TipoCobranca    := cobHSBC;

    if qBoletoBanco.FieldByName('TIPO_INSCRICAO').AsString = '1' then
      ACBrBoleto1.Cedente.TipoInscricao := pFisica
    else
      ACBrBoleto1.Cedente.TipoInscricao := pJuridica;

    ACBrBoleto1.Cedente.Nome          := qBoletoBanco.FieldByName('CEDENTE').AsString;
    ACBrBoleto1.Cedente.Convenio      := qBoletoBanco.FieldByName('CONVENIO').AsString;
    ACBrBoleto1.Cedente.CNPJCPF       := qBoletoBanco.FieldByName('CNPJCIC').AsString;
    ACBrBoleto1.Cedente.Modalidade    := qBoletoBanco.FieldByName('MODALIDADE').AsString;

    //ACBrBoleto1.Cedente.CodigoTransmissao := ?;

    if Trim(qBoletoBanco.FieldByName('LAYOUT_REMESSA').AsString) = '2' then
      ACBrBoleto1.LayoutRemessa := c240
    else
      ACBrBoleto1.LayoutRemessa := c400;

    ACBrBoleto1.Cedente.CodigoCedente := qBoletoBanco.FieldByName('COD_CEDENTE').AsString;
    ACBrBoleto1.Cedente.Agencia       := qBoletoBanco.FieldByName('NUMERO_AGENCIA').AsString;
    ACBrBoleto1.Cedente.AgenciaDigito := qBoletoBanco.FieldByName('DIGITO_AGENCIA').AsString;
    ACBrBoleto1.Cedente.Conta         := qBoletoBanco.FieldByName('NUMERO_CONTA').AsString;
    ACBrBoleto1.Cedente.ContaDigito   := qBoletoBanco.FieldByName('DIGITO_CONTA').AsString;
    ACBrBoleto1.Cedente.UF            := qBoletoBanco.FieldByName('UF_AGENCIA').AsString;
    ACBrBoleto1.ACBrBoletoFC.Filtro   := fiNenhum;
    ACBrBoleto1.ACBrBoletoFC.LayOut   := lPadrao;
    ACBrBoleto1.ACBrBoletoFC.DirLogo  := qBoletoConfig.FieldByName('PATH_LOGOTIPO').AsString;
    //ACBrBoleto1.NomeArqRemessa        := FormatDateTime('DDMMYYYYHHMMSS',Now)+'.TXT';
    ACBrBoleto1.DirArqRemessa         := qBoletoConfig.FieldByName('PATH_REMESSA').AsString;
    ACBrBoleto1.DirArqRetorno         := qBoletoConfig.FieldByName('PATH_RETORNO').AsString;
    sPathPDF                          := qBoletoConfig.FieldByName('PATH_GERARPDF').AsString;
  end;
end;

procedure TfrmBoleto.SetACBr(iNossoNum: integer);
var
  Titulo: TACBrTitulo;
begin
  if iNossoNum > 0 then
  begin
    Titulo := ACBrBoleto1.CriarTituloNaLista;
    with Titulo do
    begin
      Vencimento              := qTitulos.FieldByName('TRC_VENCIMENTO').AsDateTime;
      DataDocumento           := qTitulos.FieldByName('TRC_DT_CADASTRO').AsDateTime; //TODO - ou a data do pedido? PDV_DATA_HORA
      NumeroDocumento         := qTitulos.FieldByName('TRC_CODIGO').AsString + '/' +
                                 FormatFloat('00',qTitulos.FieldByName('CNC_CODIGO').AsFloat);
      EspecieDoc              := qBoletoConfig.FieldByName('ESPECIE').AsString;
      if qBoletoConfig.FieldByName('ACEITE').AsString = 'SIM' then
         Aceite := atSim
      else
         Aceite := atNao;

      DataProcessamento       := StrToDate(qData.FieldByName('DATA').AsString);
      Carteira                := qBoletoConfig.FieldByName('CARTEIRA').AsString;
      NossoNumero             := IntToStrZero(iNossoNum,ACBrBoleto1.Banco.TamanhoMaximoNossoNum);
      ValorDocumento          := qTitulos.FieldByName('TRC_VALOR').AsFloat;
      Sacado.NomeSacado       := qTitulos.FieldByName('CLI_RZ_SOCIAL').AsString;
      Sacado.CNPJCPF          := qTitulos.FieldByName('CLI_CGC_CPF').AsString;
      if Length(Sacado.CNPJCPF) <= 11 then
        Sacado.Pessoa         := pFisica
      else
        Sacado.Pessoa         := pJuridica;
      Sacado.Logradouro       := qTitulos.FieldByName('CLI_ENDERECO').AsString;
      Sacado.Numero           := qTitulos.FieldByName('CLI_NUMERO_END').AsString;
      Sacado.Bairro           := qTitulos.FieldByName('CLI_BAIRRO').AsString;
      Sacado.Cidade           := qTitulos.FieldByName('CLI_CIDADE').AsString;
      Sacado.UF               := qTitulos.FieldByName('CLI_UF').AsString;
      Sacado.CEP              := qTitulos.FieldByName('CLI_CEP').AsString;
      ValorAbatimento         := 0;
      LocalPagamento          := qBoletoConfig.FieldByName('LOCAL_PAGTO').AsString;
      ValorMoraJuros          := qBoletoConfig.FieldByName('PERCENTUAL_JUROS').AsFloat;
      ValorDesconto           := 0;
      ValorAbatimento         := 0;
      DataMoraJuros           := 0;//TODO ???
      DataDesconto            := 0;
      DataAbatimento          := 0;

      if qBoletoConfig.FieldByName('DIAS_PROTESTO').AsInteger > 0 then
      begin
        DataProtesto          := qTitulos.FieldByName('TRC_VENCIMENTO').AsDateTime + qBoletoConfig.FieldByName('DIAS_PROTESTO').AsInteger;
        Mensagem.Text         := 'SUJEITO A PROTESTO APOS O VENCIMENTO' + #13;
      end;

      //TODO
      if qBoletoConfig.FieldByName('MSG_MULTA_JUROS').AsString = 'S' then
      begin
        Mensagem.Text           := Mensagem.Text +
                                   'APOS O VENCIMENTO COBRAR MULTA DE ' + qBoletoConfig.FieldByName('PERCENTUAL_MULTA').AsString +
                                   '% E JUROS DE ' + qBoletoConfig.FieldByName('PERCENTUAL_JUROS').AsString + '%';
      end;

      PercentualMulta         := qBoletoConfig.FieldByName('PERCENTUAL_MULTA').AsFloat;
      OcorrenciaOriginal.Tipo := toRemessaRegistrar;//toRemessaBaixar;
      Instrucao1              := padL(trim(qBoletoConfig.FieldByName('INSTRUCAO_1').AsString),2,'0');
      Instrucao2              := padL(trim(qBoletoConfig.FieldByName('INSTRUCAO_2').AsString),2,'0');
  //    Parcela                 := qTitulos.FieldByName('TRC_SEQUENCIA').AsInteger;
    end;
  end;
end;

procedure TfrmBoleto.AtivaTitulos(bData: boolean; var sSQL: string);
var
  sOrdem: string;

  procedure subFiltros(q: TQuery);
  begin
    q.SQL.Add('FROM');
    q.SQL.Add('  TITULO_A_RECEBER TRC');
    q.SQL.Add('INNER JOIN PEDIDO_DE_VENDA PDV ON');
    q.SQL.Add('  TRC.PDV_CODIGO = PDV.PDV_CODIGO AND');
    q.SQL.Add('  TRC.CNC_CODIGO = PDV.CNC_CODIGO');
    q.SQL.Add('INNER JOIN CLIENTE CLI ON');
    q.SQL.Add('  TRC.CLI_CODIGO = CLI.CLI_CODIGO AND');
    q.SQL.Add('  TRC.CNC_CLIENTE = CLI.CNC_CODIGO');
    q.SQL.Add('WHERE');

    q.SQL.Add('  TRC.CNC_CODIGO = ' + IntToStr(dblCentroDeCusto.KeyValue) + ' AND');

    if cbxRemessasEmitidos.Checked then
      q.SQL.Add('  TRC.TRC_BOLETO_EMITIDO = ''S'' AND')
    else
      q.SQL.Add('  (TRC.TRC_BOLETO_EMITIDO = ''N'' OR TRC.TRC_BOLETO_EMITIDO IS NULL OR TRC.TRC_BOLETO_EMITIDO = ''1'') AND');

    if bData then
    begin
      q.SQL.Add(' (PDV.PDV_DATA_HORA >= '''+MesDia(mskDataINI.Text)+''') AND');
      q.SQL.Add(' (PDV.PDV_DATA_HORA < '''+MesDia(StrToDate(mskDataFIM.Text)+1)+''') AND');
    end;

    q.SQL.Add('  TRC.TRC_TIPO_PAG = 412 AND');//Boleto Bancário
    q.SQL.Add('  TRC.TRC_SITUACAO IN (0,1,8,9)');
  end;

begin
  if bData then
  begin
    if not VerificaData(mskDataINI.Text) then
    begin
      mskDataINI.SetFocus;
      Raise Exception.Create('Data inicial digitada incorretamente!');
    end;

    if not VerificaData(mskDataFIM.Text) then
    begin
      mskDataINI.SetFocus;
      Raise Exception.Create('Data final digitada incorretamente!');
    end;
  end;

  qTitulos.Close;
  qTitulos.SQL.Clear;
  qTitulos.SQL.Add('SELECT');
  qTitulos.SQL.Add('  TRC.TRC_BOLETO,');
  qTitulos.SQL.Add('  TRC.TRC_BOLETO_EMITIDO,');
  qTitulos.SQL.Add('  TRC.CNC_CODIGO,');
  qTitulos.SQL.Add('  TRC.PDV_CODIGO,');
  qTitulos.SQL.Add('  TRC.TRC_CODIGO,');
  qTitulos.SQL.Add('  TRC.TRC_NUMERO,');
  qTitulos.SQL.Add('  TRC.TRC_SEQUENCIA,');
  qTitulos.SQL.Add('  TRC.TRC_VALOR,');
  qTitulos.SQL.Add('  TRC.TRC_VENCIMENTO,');
  qTitulos.SQL.Add('  TRC.TRC_DT_CADASTRO,');
  qTitulos.SQL.Add('  TRC.TRC_OBSERVACAO,');
  qTitulos.SQL.Add('  TRC.TRC_NOSSO_NUMERO,');
  qTitulos.SQL.Add('  PDV.PDV_DATA_HORA,');
  qTitulos.SQL.Add('  CLI.CLI_CODIGO,');
  qTitulos.SQL.Add('  CLI.CLI_RZ_SOCIAL,');
  qTitulos.SQL.Add('  CLI.CLI_CGC_CPF,');
  qTitulos.SQL.Add('  CLI.CLI_NOME_FAN,');
  qTitulos.SQL.Add('  CLI.CLI_BAIRRO,');
  qTitulos.SQL.Add('  CLI.CLI_ENDERECO,');
  qTitulos.SQL.Add('  CLI.CLI_CIDADE,');
  qTitulos.SQL.Add('  CLI.CLI_UF,');
  qTitulos.SQL.Add('  CLI.CLI_CEP,');
  qTitulos.SQL.Add('  CLI.CLI_NUMERO_END');
  subFiltros(qTitulos);

  sSQL := '';
  sSQL := qTitulos.SQL.GetText + ' AND TRC.CNC_CODIGO = :CNC_CODIGO AND TRC.TRC_CODIGO = :TRC_CODIGO';

  if cbxCresc.ItemIndex = 0 then
    sOrdem := 'ASC'
  else
    sOrdem := 'DESC';

  qTitulos.SQL.Add('ORDER BY');

  if cbxOrdem.itemIndex = 0 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', TRC.TRC_CODIGO ' + sOrdem + ', TRC.TRC_SEQUENCIA ' + sOrdem)
  else if cbxOrdem.itemIndex = 1 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', PDV.PDV_CODIGO ' + sOrdem + ', TRC.TRC_CODIGO ' + sOrdem + ', TRC.TRC_SEQUENCIA ' + sOrdem)
  else if cbxOrdem.itemIndex = 2 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', TRC.TRC_VALOR ' + sOrdem)
  else if cbxOrdem.itemIndex = 3 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', PDV.PDV_DATA_HORA ' + sOrdem)
  else if cbxOrdem.itemIndex = 4 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', TRC.TRC_NOSSO_NUMERO ' + sOrdem)
  else if cbxOrdem.itemIndex = 5 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', TRC.TRC_VENCIMENTO ' + sOrdem)
  else if cbxOrdem.itemIndex = 6 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', CLI.CLI_CODIGO ' + sOrdem)
  else if cbxOrdem.itemIndex = 7 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', CLI.CLI_RZ_SOCIAL ' + sOrdem)
  else if cbxOrdem.itemIndex = 8 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', CLI.CLI_CIDADE ' + sOrdem)
  else if cbxOrdem.itemIndex = 9 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', CLI.CLI_UF ' + sOrdem)
  else if cbxOrdem.itemIndex = 10 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', CLI.CLI_BAIRRO ' + sOrdem)
  else if cbxOrdem.itemIndex = 11 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', TRC.TRC_DT_CADASTRO ' + sOrdem)
  else if cbxOrdem.itemIndex = 12 then
    qTitulos.SQL.Add('  TRC.CNC_CODIGO ' + sOrdem + ', CLI.CLI_ENDERECO ' + sOrdem);

  qTitulos.Open;
  cbxMarcaDesmarca.Enabled        := (not qTitulos.IsEmpty) and (not cbxRemessasEmitidos.Checked) ;
  cbxMarcaDesmarcaRemessa.Enabled := (not qTitulos.IsEmpty) and (not cbxRemessasEmitidos.Checked) ;

  qTotais.Close;
  qTotais.SQL.Clear;
  qTotais.SQL.Add('SELECT');
  qTotais.SQL.Add('  COUNT(TRC.TRC_CODIGO) AS QUANTIDADE,');
  qTotais.SQL.Add('  SUM(TRC.TRC_VALOR) AS TOTAL');
  subFiltros(qTotais);

//showmessage(qTotais.SQL.GetText);

  qTotais.Open;
  edtQtde.Text  := qTotais.FieldByName('QUANTIDADE').AsString;
  edtValor.Text := Format('%.2f',[qTotais.FieldByName('TOTAL').AsFloat]);
end;

procedure TfrmBoleto.btnGeraBoletoClick(Sender: TObject);
var
  iNossoNumero: integer;

  procedure subAddBoleto;
  begin
    with DM.Database2 do
    begin
      try
        Inc(iNossoNumero);

        StartTransaction;
        // grava o nosso numero na conta
        SQLAux.Close;
        SQLAux.SQL.Clear;
        SQLAux.SQL.Add('UPDATE TITULO_A_RECEBER SET TRC_NOSSO_NUMERO = :TRC_NOSSO_NUMERO,');
        SQLAux.SQL.Add('TRC_BOLETO = :TRC_BOLETO');
        SQLAux.SQL.Add('WHERE CNC_CODIGO = :CNC_CODIGO AND TRC_CODIGO = :TRC_CODIGO');
        SQLAux.Params.ParamByName('TRC_BOLETO').AsString       := 'B';
        SQLAux.Params.ParamByName('TRC_NOSSO_NUMERO').AsString := IntToStr(iNossoNumero);
        SQLAux.Params.ParamByName('CNC_CODIGO').AsInteger      := qTitulos.FieldByName('CNC_CODIGO').AsInteger;
        SQLAux.Params.ParamByName('TRC_CODIGO').AsInteger      := qTitulos.FieldByName('TRC_CODIGO').AsInteger;
        SQLAux.ExecSQL;

        // Atualiza a nosso numero no cadastro do banco
        SQLAux.Close;
        SQLAux.SQL.Clear;
        SQLAux.SQL.Add('UPDATE BOLETO_BANCO SET NOSSO_NUMERO = :NOSSO_NUMERO');
        SQLAux.SQL.Add('WHERE ID = :ID');
        SQLAux.Params.ParamByName('NOSSO_NUMERO').AsString := IntToStr(iNossoNumero);
        SQLAux.Params.ParamByName('ID').AsInteger := qBoletoBanco.FieldByName('ID').AsInteger;
        SQLAux.ExecSQL;
        Commit;

        SetACBr(iNossoNumero);

        qBoletoBanco.Close;
        qBoletoBanco.Open;
      except
        Rollback;
      end;
    end;
  end;

  procedure subGeraBoleto;
  begin
    ACBrBoleto1.ListadeBoletos.Clear;
    iNossoNumero := StrToIntDef(qBoletoBanco.FieldByName('NOSSO_NUMERO').AsString,0);
    qTitulos.First;
    while not qTitulos.Eof do
    begin
      if ( qTitulos.FieldByName('TRC_BOLETO').AsString = 'S'        ) and
         ( qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsString = ''   ) and
         ValidaRegistro(qTitulos.FieldByName('TRC_CODIGO').AsInteger,
                        qTitulos.FieldByName('CNC_CODIGO').AsInteger) then
        subAddBoleto;
      qTitulos.Next;
    end;
  end;

begin
  if not ValidaProcesso then
    exit;

  if Application.MessageBox('Deseja gerar os boletos dos títulos selecionados?','Atenção',MB_ICONQUESTION + MB_YESNO) <> ID_YES then
    exit;

//  try
    sLOG.Clear;
    subGeraBoleto;
    HabilitaBotoes;
    ACBrBoleto1.Imprimir;
    AtivaTitulos(cbxData.Checked,refSQL);
//  except
//    Raise Exception.Create('Erro ao imprimir os boletos. Verifique!');
//  end;
end;

function TfrmBoleto.ValidaProcesso: boolean;
begin
  if qTitulos.IsEmpty then
    raise Exception.Create('Não existe títulos em aberto!');

  if cbxBancoConta.KeyValue <= 0 then
  begin
    if cbxBancoConta.Enabled then
      cbxBancoConta.SetFocus;
    raise Exception.Create('Conta corrente não informda!');
  end;
  Result := True;
end;

procedure TfrmBoleto.btnGeraRemessaClick(Sender: TObject);
var
  iContadorRemessa: integer;
  bGerouRemessa: boolean;

  procedure subGeraRemessa(var bRemessa: boolean);
  begin
    bRemessa := false;
    ACBrBoleto1.ListadeBoletos.Clear;
    iContadorRemessa := qBoletoBanco.FieldByName('CONT_REMESSA').AsInteger;
    qTitulos.First;
    while not qTitulos.Eof do
    begin
      if ( (qTitulos.FieldByName('TRC_BOLETO').AsString = 'B') or (qTitulos.FieldByName('TRC_BOLETO').AsString = 'R') ) and
         ( (qTitulos.FieldByName('TRC_BOLETO_EMITIDO').AsString = '1') or (qTitulos.FieldByName('TRC_BOLETO_EMITIDO').AsString = 'S') ) and
         ( qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsString <> '' ) and ( ValidaRegistro(qTitulos.FieldByName('TRC_CODIGO').AsInteger,qTitulos.FieldByName('CNC_CODIGO').AsInteger) ) then
      begin
        //subAddRemessa;

        SQLAux.Close;
        SQLAux.SQL.Clear;
        SQLAux.SQL.Add('UPDATE TITULO_A_RECEBER SET TRC_BOLETO_EMITIDO = :TRC_BOLETO_EMITIDO,');
        SQLAux.SQL.Add('TRC_BOLETO = :TRC_BOLETO');
        SQLAux.SQL.Add('WHERE CNC_CODIGO = :CNC_CODIGO AND TRC_CODIGO = :TRC_CODIGO');
        SQLAux.Params.ParamByName('TRC_BOLETO').AsString         := 'R';
        SQLAux.Params.ParamByName('TRC_BOLETO_EMITIDO').AsString := 'S';
        SQLAux.Params.ParamByName('CNC_CODIGO').AsInteger        := qTitulos.FieldByName('CNC_CODIGO').AsInteger;
        SQLAux.Params.ParamByName('TRC_CODIGO').AsInteger        := qTitulos.FieldByName('TRC_CODIGO').AsInteger;
        SQLAux.ExecSQL;
        SetACBr(qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsInteger);

        bRemessa := true;
      end;
      qTitulos.Next;
    end;
  end;

  procedure subAlteraContador;
  begin
    with DM.Database2 do
    begin
      try
        Inc(iContadorRemessa);

        StartTransaction;
        // Atualiza o contador de remessa na tabela de banco
        SQLAux.Close;
        SQLAux.SQL.Clear;
        SQLAux.SQL.Add('UPDATE BOLETO_BANCO SET CONT_REMESSA = :CONT_REMESSA');
        SQLAux.SQL.Add('WHERE ID = :ID');
        SQLAux.Params.ParamByName('CONT_REMESSA').AsInteger := iContadorRemessa;
        SQLAux.Params.ParamByName('ID').AsInteger := qBoletoConfig.FieldByName('ID').AsInteger;
        SQLAux.ExecSQL;
        Commit;

        //SetACBr(qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsInteger);
        qBoletoBanco.Close;
        qBoletoBanco.Open;
      except
        Rollback;
      end;
    end;
  end;


begin
  if not ValidaProcesso then
    exit;

  if Application.MessageBox('Deseja gerar a remessa dos boletos selecionados?','Atenção',MB_ICONQUESTION + MB_YESNO) <> ID_YES then
    exit;

//  try
    sLOG.Clear;
    subGeraRemessa(bGerouRemessa);

    {Estava gerando 2 boletos na mesma remessa - 13/03/2013
    if bGerouRemessa then
      subAlteraContador;
    }

    HabilitaBotoes;

    if bGerouRemessa then
    begin
      ACBrBoleto1.NomeArqRemessa := inttostr(iContadorRemessa)+'.TXT';
      ACBrBoleto1.GerarRemessa(iContadorRemessa);
      subAlteraContador;
    end;

    AtivaTitulos(cbxData.Checked,refSQL);
    Application.MessageBox('Fim do processo!','Aviso',MB_ICONINFORMATION + MB_OK);
//  except
//    Raise Exception.Create('Erro ao gerar arquivo de remessa. Verifique!');
//  end;
end;

procedure TfrmBoleto.btnProcessaRetornoClick(Sender: TObject);
var
  i: Integer;
begin
  if not ValidaProcesso then
    exit;

  if OpenDialog1.Execute then
  begin

    if Application.MessageBox('Deseja processar o retorno do arquivo selecionado?','Atenção',MB_ICONQUESTION + MB_YESNO) <> ID_YES then
      exit;

    sLOG.Clear;
    //Configurar banco
    ConfiguraComponenteAcBr;
    //
    ACBrBoleto1.NomeArqRetorno := ExtractFileName(OpenDialog1.FileName);
    ACBrBoleto1.LerRetorno;
    for i := 0 to ACBrBoleto1.ListadeBoletos.Count-1 do
    begin
      if ACBrBoleto1.ListadeBoletos.Objects[i].ValorRecebido > 0 then
      begin
        // Grava a Quitação da conta
        SQLAux.Close;
        SQLAux.SQL.Clear;
        SQLAux.SQL.Add('UPDATE TITULO_A_RECEBER SET');
        SQLAux.SQL.Add('TRC_SITUACAO = 2,');
        SQLAux.SQL.Add('TRC_PAGAMENTO = :TRC_PAGAMENTO,');
        SQLAux.SQL.Add('TRC_DT_ALTERADO = :TRC_DT_ALTERADO,');
        SQLAux.SQL.Add('TRC_VALOR_PAGO = :TRC_VALOR_PAGO,');
        SQLAux.SQL.Add('TRC_OBSERVACAO = TRC_OBSERVACAO + ''(ARQUIVO DE RETORNO)''');
        SQLAux.SQL.Add('WHERE CNC_CODIGO = ' + IntToStr(dblCentroDeCusto.KeyValue));
        SQLAux.SQL.Add('AND TRC_NOSSO_NUMERO > 0');
        SQLAux.SQL.Add('AND NOT TRC_NOSSO_NUMERO IS NULL');
        SQLAux.SQL.Add('AND TRC_NOSSO_NUMERO = :TRC_NOSSO_NUMERO');

        if ACBrBoleto1.Banco.TipoCobranca = cobItau then
          SQLAux.Params.ParamByName('TRC_PAGAMENTO').AsDateTime := ACBrBoleto1.ListadeBoletos.Objects[i].DataBaixa (*só mostra a data da baixa no ACBr do Itaú*)
        else
          SQLAux.Params.ParamByName('TRC_PAGAMENTO').AsDateTime := qData.FieldByName('DATA').AsDateTime;

        SQLAux.Params.ParamByName('TRC_DT_ALTERADO').AsDateTime := qData.FieldByName('DATA').AsDateTime;
        SQLAux.Params.ParamByName('TRC_VALOR_PAGO').AsFloat     := ACBrBoleto1.ListadeBoletos.Objects[i].ValorRecebido;
        SQLAux.Params.ParamByName('TRC_NOSSO_NUMERO').AsString  := ACBrBoleto1.ListadeBoletos.Objects[i].NossoNumero;

        //ShowMessage(SQLAux.sql.GetText);

        SQLAux.ExecSQL;
      end;
    end;
    AtivaTitulos(cbxData.Checked,refSQL);
    HabilitaBotoes;
    Application.MessageBox('Fim do processo!','Aviso',MB_ICONINFORMATION + MB_OK);
  end;
end;

procedure TfrmBoleto.cbxMarcaDesmarcaClick(Sender: TObject);
begin
  qTitulos.First;
  while not qTitulos.Eof do
  begin
    Ticar(true);
    qTitulos.Next;
  end;
  AtivaTitulos(cbxData.Checked,refSQL);
  qTitulos.First;
end;

procedure TfrmBoleto.cbxMarcaDesmarcaRemessaClick(Sender: TObject);
begin
  qTitulos.First;
  while not qTitulos.Eof do
  begin
    TicarRemessa(true);
    qTitulos.Next;
  end;
  AtivaTitulos(cbxData.Checked,refSQL);
  qTitulos.First;
end;

procedure TfrmBoleto.cbxBancoContaClick(Sender: TObject);
begin
  ConfiguraComponenteAcBr;
  AtivaTitulos(cbxData.Checked,refSQL);
end;

procedure TfrmBoleto.Ticar(bMarcaDesmarca: boolean);
var
  sTicar: string;
begin
  if ( qTitulos.FieldByName('TRC_BOLETO').AsString <> 'B' ) and ( qTitulos.FieldByName('TRC_BOLETO').AsString <> 'R' ) then
  begin
    if bMarcaDesmarca then
      sTicar := IfThen(cbxMarcaDesmarca.Checked,'S','N')
    else
      sTicar := IfThen(qTitulos.FieldByName('TRC_BOLETO').AsString = 'S','N','S');
    SQLAux.Close;
    SQLAux.SQL.Clear;
    SQLAux.SQL.Add('UPDATE TITULO_A_RECEBER SET TRC_BOLETO = ''' + sTicar + '''');
    SQLAux.SQL.Add('WHERE CNC_CODIGO = ''' + qTitulos.FieldByName('CNC_CODIGO').AsString + '''');
    SQLAux.SQL.Add('AND   TRC_CODIGO = ''' + qTitulos.FieldByName('TRC_CODIGO').AsString + '''');
    SQLAux.ExecSQL
  end;
end;

procedure TfrmBoleto.TicarRemessa(bMarcaDesmarca: boolean);
var
  sTicarRemessa: string;
begin
  if qTitulos.FieldByName('TRC_BOLETO').AsString = 'B' then
  begin
    if bMarcaDesmarca then
      sTicarRemessa := IfThen(cbxMarcaDesmarcaRemessa.Checked,'1','N')
    else
      sTicarRemessa := IfThen(qTitulos.FieldByName('TRC_BOLETO_EMITIDO').AsString = '1','N','1');
    SQLAux.Close;
    SQLAux.SQL.Clear;
    SQLAux.SQL.Add('UPDATE TITULO_A_RECEBER SET TRC_BOLETO_EMITIDO = ''' + sTicarRemessa + '''');
    SQLAux.SQL.Add('WHERE CNC_CODIGO = ''' + qTitulos.FieldByName('CNC_CODIGO').AsString + '''');
    SQLAux.SQL.Add('AND   TRC_CODIGO = ''' + qTitulos.FieldByName('TRC_CODIGO').AsString + '''');
    SQLAux.ExecSQL
  end;
end;

procedure TfrmBoleto.MostraContas;
begin
  qBoletoBanco.Close;
  qBoletoBanco.ParamByName('NOME_BANCO').Value := cbxBancos.Text;
  qBoletoBanco.Open;
end;

procedure TfrmBoleto.cbxBancoClick(Sender: TObject);
begin
  MostraContas;
end;

procedure TfrmBoleto.cbxRemessasEmitidosClick(Sender: TObject);
begin
  AtivaTitulos(cbxData.Checked,refSQL);
  HabilitaBotoes;
end;

procedure TfrmBoleto.HabilitaBotoes;
begin
  cbxMarcaDesmarca.Enabled        := not cbxRemessasEmitidos.Checked;
  cbxMarcaDesmarcaRemessa.Enabled := not cbxRemessasEmitidos.Checked;
  btnGeraBoleto.Enabled           := not cbxRemessasEmitidos.Checked;
  btnGeraRemessa.Enabled          := not cbxRemessasEmitidos.Checked;
  btnProcessaRetorno.Enabled      := cbxRemessasEmitidos.Checked;
  btnLog.Enabled                  := sLog.Text <> '';
end;


procedure TfrmBoleto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Image1, Image2: integer;
begin
{
  if (not (gdSelected in State)) then
  begin
    if qTitulos.FieldByName('TRC_BOLETO_EMITIDO').AsString = 'S' then
      TDBGrid(Sender).Canvas.Brush.Color := $00FEE3CD;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
}

  if Column.FieldName = 'TRC_BOLETO' then
  begin
    if ( Column.Field.AsString = 'B' ) or ( Column.Field.AsString = 'R' ) then
      Image1 := 2
    else if ( Column.Field.AsString = 'S' ) then
      Image1 := 1
    else
      Image1 := 0;

    DBGrid1.Canvas.FillRect(Rect);
    ImTicado.Draw(DBGrid1.Canvas, Trunc( (Rect.Right) div 4 ), Rect.Top + 1, Image1);
  end;

  if Column.FieldName = 'TRC_BOLETO_EMITIDO' then
  begin
    if ( Column.Field.AsString = '1' ) then
      Image2 := 1
    else if ( Column.Field.AsString = 'S' ) then
      Image2 := 3
    else
      Image2 := 0;

    DBGrid1.Canvas.FillRect(Rect);
    ImTicado.Draw(DBGrid1.Canvas, Trunc( (Rect.Right + 9) div 2 ), Rect.Top + 1, Image2); //25
  end;
end;

procedure TfrmBoleto.DBGrid1CellClick(Column: TColumn);
var
  posicao: TBookmark;
begin
  if qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsString = '' then
  begin
    if Column.FieldName = 'TRC_BOLETO' then
    begin
      posicao := qTitulos.GetBookmark;
      try
        Ticar(false);
        AtivaTitulos(cbxData.Checked,refSQL);
        qTitulos.GotoBookmark(posicao);
      finally
        qTitulos.FreeBookmark(posicao);
      end;
    end;
  end;

  if qTitulos.FieldByName('TRC_BOLETO').AsString = 'B' then
  begin
    if Column.FieldName = 'TRC_BOLETO_EMITIDO' then
    begin
      posicao := qTitulos.GetBookmark;
      try
        TicarRemessa(false);
        AtivaTitulos(cbxData.Checked,refSQL);
        qTitulos.GotoBookmark(posicao);
      finally
        qTitulos.FreeBookmark(posicao);
      end;
    end;
  end;
end;

procedure TfrmBoleto.cbxBancosChange(Sender: TObject);
begin
  MostraContas;
  cbxBancoConta.KeyValue := 0;
  cbxBancoContaClick(cbxBancoConta);
end;

procedure TfrmBoleto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBoleto.FormShow(Sender: TObject);
begin
  qData.Close;
  qData.ParamByName('CNC_CODIGO').AsInteger := GetCNC;
  qData.Open;

  //showmessage(qData.FieldByName('DATA').AsString);
  //showmessage(GetDataLimite);

  {//Não precisa mais
  if StrToDate(qData.FieldByName('DATA').AsString) > StrToDate(GetDataLimite) then
  begin
    Application.MessageBox('O sistema expirou entre em contato com o suporte!', 'PBoleto', MB_OK + MB_ICONSTOP);
    Application.Terminate;
  end;
  }
end;

function TfrmBoleto.GetCNC: Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'CC', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

procedure TfrmBoleto.cbxDataClick(Sender: TObject);
begin
  mskDataINI.Enabled  := cbxData.Checked;
  Label4.Enabled      := cbxData.Checked;
  mskDataFIM.Enabled  := cbxData.Checked;
  btnLocaliza.Enabled := cbxData.Checked;

  if cbxData.Checked then
  begin
    mskDataINI.Text  := qData.FieldByName('DATA').AsString;
    mskDataFIM.Text  := qData.FieldByName('DATA').AsString;
    mskDataINI.Color := clWindow;
    mskDataFIM.Color := clWindow;
  end
  else
  begin
    mskDataINI.Text  := '';
    mskDataFIM.Text  := '';
    mskDataINI.Color := clBtnFace;
    mskDataFIM.Color := clBtnFace;
  end;
  AtivaTitulos(cbxData.Checked,refSQL);
end;

procedure TfrmBoleto.btnLocalizaClick(Sender: TObject);
begin
  AtivaTitulos(True,refSQL);
end;

procedure TfrmBoleto.ImprimirBoleto1Click(Sender: TObject);
begin
  if ( qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsString <> '' ) then
  begin
    ACBrBoleto1.ListadeBoletos.Clear;
    SetACBr(qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsInteger);
    ACBrBoleto1.Imprimir;
  end;
end;

procedure TfrmBoleto.BoletoemPDF1Click(Sender: TObject);
var
 sNomePDF, sPathNomePDF: string;
begin
  if ( qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsString <> '' ) then
  begin
    try
      sNomePDF     := FormatDateTime('DDMMYYYYHHMMSS',Now)+'.PDF';
      sPathNomePDF := sPathPDF + '\' + sNomePDF;

      ACBrBoleto1.ListadeBoletos.Clear;
      SetACBr(qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsInteger);
      ACBrBoleto1.ACBrBoletoFC.NomeArquivo := sPathNomePDF;
      ACBrBoleto1.GerarPDF;

      if FileExists(PChar(sPathNomePDF)) then
        ShellExecute(0,'Open',PChar(sPathNomePDF),'','', SW_SHOWNORMAL);
    except
      Raise Exception.Create('Erro ao imprimir os boletos. Verifique!');
    end;
  end;
end;

procedure TfrmBoleto.PopupMenu1Popup(Sender: TObject);
begin
  //( qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsString = 'B' ) or ( qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsString = 'R' )
  BoletoemPDF1.Enabled    := ( qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsString <> '' );
  ImprimirBoleto1.Enabled := ( qTitulos.FieldByName('TRC_NOSSO_NUMERO').AsString <> '' );
end;

procedure TfrmBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_F3 ) and ( btnLocaliza.Enabled ) then
    btnLocaliza.Click;
end;

function TfrmBoleto.ValidaRegistro(trcCodigo, cncCodigo: integer): boolean;
var
  sMsg, sHeader: string;
begin
  sMsg := '';
  qRefSQL.Close;
  qRefSQL.SQL.Text := refSQL; //Variável de referencia alimentada no método: AtivaTitulos
  qRefSQL.ParamByName('CNC_CODIGO').AsInteger := cncCodigo;
  qRefSQL.ParamByName('TRC_CODIGO').AsInteger := trcCodigo;
  qRefSQL.Open;

  sHeader := '(CNC:' + inttostr(cncCodigo) + '/TRC: ' + inttostr(trcCodigo) + '/CLI: ' + qRefSQL.FieldByName('CLI_CODIGO').AsString + ') = ';

  if qRefSQL.FieldByName('CLI_CEP').AsString = '' then
    sMsg := 'CEP,';

  if qRefSQL.FieldByName('CLI_NUMERO_END').AsString = '' then
    sMsg := sMsg + 'Número do endereço,';


  if sMsg = '' then
    sMsg := 'OK'
  else
  begin
    sMsg := Copy(sMsg, 0, Length(sMsg) - 1);
    sMsg := 'Campos obrigatórios/inválidos: (' + sMsg + ')';
  end;

  sLog.Add(sHeader + sMsg);

  Result := sMsg = 'OK';
end;

procedure TfrmBoleto.btnLogClick(Sender: TObject);
begin
  if sLog.Text <> '' then
    showmessage(sLog.Text);
end;

procedure TfrmBoleto.dblCentroDeCustoClick(Sender: TObject);
begin
  AtivaTitulos(cbxData.Checked,refSQL);
end;

procedure TfrmBoleto.cbxOrdemChange(Sender: TObject);
begin
  AtivaTitulos(cbxData.Checked,refSQL);
  qTitulos.First;
end;

procedure TfrmBoleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBoleto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

end.
