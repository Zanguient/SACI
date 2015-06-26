unit UImprimirCopiaCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, Pedido_de_Venda, CentroCusto,
  Cheque;

type
  Trpt_ImprimirCopiaCheque = class(TForm)
    report: TSZReport;
    CentroCusto1: TCentroCusto;
    Cliente1: TCliente;
    Extenso1: TValorPorExtenso;
    Cheque1: TCheque;
    ZRBand1: TSZRBand;
    zrlValorExtenso: TSZRLabel;
    zrlCidadeDia: TSZRLabel;
    zrlValorNumerico: TSZRLabel;
    zrlNominal: TSZRLabel;
    zrlMes: TSZRLabel;
    zrlAno: TSZRLabel;
    zrlObservado: TSZRLabel;
    zrlDia: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlNumero: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlProprietario: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlNomeBanco: TSZRLabel;
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TCheque;
  end;

var
  rpt_ImprimirCopiaCheque: Trpt_ImprimirCopiaCheque;

implementation

uses  MxMovCaixa, UDM, Funcoes, MxSRecPedido, MxBaixaRec, MxReceber;
{$R *.DFM}

procedure Trpt_ImprimirCopiaCheque.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');
var
  S : string;
begin
  zrlNumero.Caption := Entidade.Numero;

  if Entidade.Banco = 1 then //Banco do Brasil
    zrlNomeBanco.Caption := 'Banco do Brasil'
  else if Entidade.Banco = 4 then //Banco do Nordeste
    zrlNomeBanco.Caption := 'Banco do Nordeste'
  else if Entidade.Banco = 104 then //CEF
    zrlNomeBanco.Caption := 'Caixa Econômica Federal'
  else if Entidade.Banco = 35 then //BEC
    zrlNomeBanco.Caption := 'Banco do Estado do Ceara'
  else if Entidade.Banco = 237 then //Bradesco
    zrlNomeBanco.Caption := 'Banco Bradesco'
  else if Entidade.Banco = 356 then //Real
    zrlNomeBanco.Caption := 'Banco REAL'
  else
    zrlNomeBanco.Caption := '';

  zrlNominal.Caption := Entidade.Nominal;

  zrlProprietario.Caption := Entidade.DonoCheque;

  zrlValorNumerico.Caption := PreencheE(format('%.2f',[Entidade.Valor]),'*',zrlValorNumerico.Width);

  Extenso1.Valor := Entidade.Valor;

  S := Extenso1.Texto;
  zrlValorExtenso.Caption:=PreencheD('('+UpperCase(S)+'. ','*',59)+')';

  zrlNominal.Caption := Entidade.Nominal;

  zrlCidadeDia.Caption := DM.CentroCusto1.Cidade+',';

  zrlDia.Caption := FormatDateTime('dd',Entidade.Data);

  zrlMes.Caption := mes[StrToInt(FormatDateTime('mm',Entidade.Data))];

  zrlAno.Caption := FormatDateTime('yyyy',Entidade.Data);

  zrlObservado.Caption := Entidade.OBS;
end;

procedure Trpt_ImprimirCopiaCheque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  CentroCusto1.Close;
  Cliente1.Close;
  action:=cafree;
end;

procedure Trpt_ImprimirCopiaCheque.FormCreate(Sender: TObject);
begin
  Entidade := Cheque1;
end;

end.
