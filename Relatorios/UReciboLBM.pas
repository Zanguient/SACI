unit UReciboLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Extenso, Cliente,
  CentroCusto, Titulo_receber;

type
  Trpt_ReciboLBM = class(TForm)
    report: TSZReport;
    zrbDetalhe: TSZRBand;
    zrlDescricao: TSZRLabel;
    ZRLabel21: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRDBText13: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    Titulo_receber1TRC_CODIGO: TIntegerField;
    Titulo_receber1CNC_CODIGO: TIntegerField;
    Titulo_receber1PDV_CODIGO: TIntegerField;
    Titulo_receber1AGF_CODIGO: TIntegerField;
    Titulo_receber1CCX_CODIGO: TIntegerField;
    Titulo_receber1TRC_NUMERO: TStringField;
    Titulo_receber1TRC_SEQUENCIA: TStringField;
    Titulo_receber1CLI_CODIGO: TIntegerField;
    Titulo_receber1TRC_VENCIMENTO: TDateTimeField;
    Titulo_receber1TRC_VALOR: TFloatField;
    Titulo_receber1TRC_PAGAMENTO: TDateTimeField;
    Titulo_receber1TRC_VALOR_PAGO: TFloatField;
    Titulo_receber1TRC_SITUACAO: TIntegerField;
    Titulo_receber1TRC_CUSTODIA: TStringField;
    Titulo_receber1TRC_TIPO_DOC: TIntegerField;
    Titulo_receber1TRC_CRED_CLI: TFloatField;
    Titulo_receber1TRC_TIPO_PAG: TIntegerField;
    Titulo_receber1CNC_CLIENTE: TIntegerField;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    CentroCusto1: TCentroCusto;
    Cliente1: TCliente;
    SZRLabel1: TSZRLabel;
    Extenso1: TValorPorExtenso;
    SZRDBText1: TSZRDBText;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber1USU_CODIGO: TIntegerField;
    Titulo_receber1TRC_DT_ALTERADO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_INICIO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_SITUACAO: TDateTimeField;
    Titulo_receber1CPC_CODIGO: TIntegerField;
    Titulo_receber1TRC_RGB_SITUACAO: TIntegerField;
    Titulo_receber1TRC_RGB_VISITADO: TSmallintField;
    Titulo_receber1TRC_RGB_DT_PROMESSA: TDateTimeField;
    Titulo_receber1TRC_PROCESSO: TIntegerField;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    zrdCodigoPDV: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRLabel4: TSZRLabel;
    zrlCabecalho: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlCliente: TSZRLabel;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    SZRLabel2: TSZRLabel;
    zrlAVistaPrazo: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlMensagemCheque: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlAssinatura: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlLinhaRodape: TSZRLabel;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
    Titulo_receber1CNC_ORIGEM: TIntegerField;
    Titulo_receber1TRC_PEDIDO_SERVICO: TIntegerField;
    Titulo_receber1TRC_TIPO_PEDIDO: TIntegerField;
    Titulo_receber1TRC_DT_EMISSAO_BOLETO: TDateTimeField;
    Titulo_receber1TRC_DT_RECEBIMENTO_BOLETO: TDateTimeField;
    Titulo_receber1FPE_CODIGO: TIntegerField;
    Titulo_receber1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Titulo_receber1TRC_DT_COMPETENCIA: TDateTimeField;
    Titulo_receber1TRC_EQUIFAX: TIntegerField;
    Titulo_receber1TRC_DT_EQUIFAX: TDateTimeField;
    Titulo_receber1TRC_AGENCIA_NUMERO: TStringField;
    Titulo_receber1TRC_DT_CHEQUE: TDateTimeField;
    Titulo_receber1TRC_SIT_CHEQUE: TIntegerField;
    Titulo_receber1TRC_REABERTURA: TIntegerField;
    Titulo_receber1TRC_VERIFICADO: TIntegerField;
    Titulo_receber1TRC_DT_VERIFICADO: TDateTimeField;
    Titulo_receber1CHQ_CODIGO: TIntegerField;
    Titulo_receber1CNC_CHEQUE: TIntegerField;
    zrlCNPJ: TSZRLabel;
    Titulo_receber1TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    zrlInicioCompactaLinha: TSZRLabel;
    zrlFinalCompactaLinha: TSZRLabel;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CV: TStringField;
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    Pagina : integer;
  public
    SomenteEntra, PrimeiraPag, VendaPz : Boolean;
  end;

var
  rpt_ReciboLBM: Trpt_ReciboLBM;

implementation

uses  UDM, Funcoes, MxSPediLocImpPromis;
{$R *.DFM}

procedure Trpt_ReciboLBM.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('janeiro','fevereiro','marco','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro');
var
  S : string;
begin
  if (SomenteEntra) and (not PrimeiraPag) then
  Begin
    DoPrint := False;
    Exit;
  end;

  //Cabeçalho
  if DM.Configuracao1.Empresa = 1 then
    zrlCabecalho.Caption := 'ELETRO GUERRA'
  else if DM.Configuracao1.Empresa = 2 then
    zrlCabecalho.Caption := 'PETROMAX'
  else if DM.Configuracao1.Empresa = empLBM then
  Begin
    if DM.Configuracao1.CodigoCNC <> 3 then
      zrlCabecalho.Caption := 'LBM - MOVEIS PARA ESCRITORIO LTDA'
    else
      zrlCabecalho.Caption := 'LBM - SERVICOS LTDA';    
  end
  else if DM.Configuracao1.Empresa = empMotical then
    zrlCabecalho.Caption := 'MOTICAL MATERIAL OTICO LTDA'
  else if DM.Configuracao1.Empresa = empCreator then
    zrlCabecalho.Caption := 'CREATOR PAPELARIA'
  else if DM.Configuracao1.Empresa = empAndrea then
    zrlCabecalho.Caption := ''
  else if DM.Configuracao1.Empresa = empLuciano then
    zrlCabecalho.Caption := ''
  else if DM.Configuracao1.Empresa = empHope then
    zrlCabecalho.Caption := 'HOPE'
  else
    zrlCabecalho.Caption := '';

  //Razão Social
  with Cliente1 do
  Begin
    if (Titulo_receber1.ClienteCNC <> CodigoCNC) or
       (Titulo_receber1.CodigoCLI  <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Titulo_receber1.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Titulo_receber1.CodigoCLI;
      OPen;
    end;
    zrlCliente.Caption := Trim(RazaoSocial)+' ('+IntToStr(CodigoCLI)+')';
  end;

  Extenso1.Valor:=Titulo_receber1.fieldbyname('TRC_VALOR').asfloat;
  S := Extenso1.Texto;
  ZRlabel21.Caption:=UpperCase(S);

  //Verificar se é Venda A Vista ou A Prazo
  if VendaPz then
    zrlAVistaPrazo.Caption := 'prazo'
  else
    zrlAVistaPrazo.Caption := 'vista';

  if Titulo_receber1.TipoPag = 6 then
    zrlMensagemCheque.Enabled := True
  else
    zrlMensagemCheque.Enabled := False;

  with CentroCusto1 do
  Begin
    if DM.Configuracao1.CodigoCNC <> CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      Open;
    end;
  end;

  SZRLabel1.Caption:=CentroCusto1.Cidade+', '+
    FormatDateTime('dd',DM.Configuracao1.Data)+' de '+mes[StrToInt(FormatDateTime('mm',DM.Configuracao1.Data))]+
    ' de '+FormatDateTime('yyyy',DM.Configuracao1.Data);

  if DM.Configuracao1.Empresa = 1 then
    zrlAssinatura.Caption := 'ELETRO GUERRA'
  else if DM.Configuracao1.Empresa = 2 then
    zrlAssinatura.Caption := 'PETROMAX'
  else if DM.Configuracao1.Empresa = empLBM then
  Begin
    if DM.Configuracao1.CodigoCNC <> 3 then
    Begin
      zrlCabecalho.Caption := 'LBM - MOVEIS PARA ESCRITORIO LTDA';
      zrlCNPJ.Caption := ''; //LBM Não mostrar
    end
    else
    Begin
      zrlCabecalho.Caption := 'LBM - SERVICOS LTDA';
      zrlCNPJ.Caption := DM.CentroCusto1.CGC;
    end;
  end;

  PrimeiraPag := False;

  inc(Pagina);
end;

procedure Trpt_ReciboLBM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Titulo_receber1.Close;
  CentroCusto1.Close;
  Cliente1.Close;
  action:=cafree;
end;

procedure Trpt_ReciboLBM.FormCreate(Sender: TObject);
begin
  SomenteEntra := False;
  PrimeiraPag := True;
  VendaPz := True;
  Pagina := 1;
end;

end.
