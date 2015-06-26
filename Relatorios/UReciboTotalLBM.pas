unit UReciboTotalLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, Pedido_de_Venda, Titulo_receber, CentroCusto;

type
  Trpt_ReciboTotalLBM = class(TForm)
    report: TSZReport;
    zrlDetalhe: TSZRBand;
    zrlDescricao1: TSZRLabel;
    zrlExtenso: TSZRLabel;
    CentroCusto1: TCentroCusto;
    Cliente1: TCliente;
    SZRLabel1: TSZRLabel;
    Extenso1: TValorPorExtenso;
    SZRLabel4: TSZRLabel;
    zrlCabecalho: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlCliente: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlAVistaPrazo: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlMensagemCheque: TSZRLabel;
    zrlAssinatura: TSZRLabel;
    zrlLinhaRodape: TSZRLabel;
    zrlTotalPedido: TSZRLabel;
    zrlCodigoPDV: TSZRLabel;
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public
    VendaPz, vCheque : Boolean;
    vTotalPedido: double;
    CdPDV : integer;
  end;

var
  rpt_ReciboTotalLBM: Trpt_ReciboTotalLBM;

implementation

uses  UDM, Funcoes, MxSPediLocImpPromis;
{$R *.DFM}

procedure Trpt_ReciboTotalLBM.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('janeiro','fevereiro','marco','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro');
var
  S : string;
begin
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

  zrlTotalPedido.Caption := format('%.2f',[vTotalPedido]);

  //Razão Social
  with Cliente1 do
    zrlCliente.Caption := Trim(RazaoSocial)+' ('+IntToStr(CodigoCLI)+')';

  Extenso1.Valor := vTotalPedido;
  S := Extenso1.Texto;
  zrlExtenso.Caption := UpperCase(S);

  //Verificar se é Venda A Vista ou A Prazo
  if VendaPz then
    zrlAVistaPrazo.Caption := 'prazo'
  else
    zrlAVistaPrazo.Caption := 'vista';

  zrlCodigoPDV.Caption := IntToStr(CdPDV);

  zrlMensagemCheque.Enabled := vCheque;

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
      zrlCabecalho.Caption := 'LBM - MOVEIS PARA ESCRITORIO LTDA'
    else
      zrlCabecalho.Caption := 'LBM - SERVICOS LTDA';
  end;

end;

procedure Trpt_ReciboTotalLBM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Cliente1.Close;
  action:=cafree;
end;

procedure Trpt_ReciboTotalLBM.FormCreate(Sender: TObject);
begin
  VendaPz := True;
  CdPDV := 0;
end;

end.
