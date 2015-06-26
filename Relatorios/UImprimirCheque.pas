unit UImprimirCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, Pedido_de_Venda, CentroCusto,
  Cheque;

type
  Trpt_ImprimirCheque = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrlValorExtenso: TSZRLabel;
    CentroCusto1: TCentroCusto;
    Cliente1: TCliente;
    zrlCidadeDia: TSZRLabel;
    Extenso1: TValorPorExtenso;
    Cheque1: TCheque;
    zrlValorNumerico: TSZRLabel;
    zrlNominal: TSZRLabel;
    zrlMes: TSZRLabel;
    zrlAno: TSZRLabel;
    zrlObservado: TSZRLabel;
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TCheque;
  end;

var
  rpt_ImprimirCheque: Trpt_ImprimirCheque;

implementation

uses  MxMovCaixa, UDM, Funcoes, MxSRecPedido, MxBaixaRec, MxReceber;
{$R *.DFM}

procedure Trpt_ImprimirCheque.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');
var
  S : string;
begin
  zrlValorNumerico.Caption := PreencheE(format('%.2f',[Entidade.Valor]),'*',zrlValorNumerico.Width);

  Extenso1.Valor := Entidade.Valor;

  S := Extenso1.Texto;
  zrlValorExtenso.Caption:=PreencheD('('+UpperCase(S)+'. ','*',59)+')';

  zrlNominal.Caption := Entidade.Nominal;

  zrlCidadeDia.Caption := DM.CentroCusto1.Cidade+',';

  zrlMes.Caption := mes[StrToInt(FormatDateTime('mm',Entidade.Data))];

  zrlAno.Caption := FormatDateTime('yyyy',Entidade.Data);

  zrlObservado.Caption := Entidade.OBS;
end;

procedure Trpt_ImprimirCheque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  CentroCusto1.Close;
  Cliente1.Close;
  action:=cafree;
end;

procedure Trpt_ImprimirCheque.FormCreate(Sender: TObject);
begin
  Entidade := Cheque1;
end;

end.
