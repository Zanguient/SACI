unit UImprimirChequeBEC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, Pedido_de_Venda, CentroCusto,
  Cheque;

type
  Trpt_ImprimirChequeBEC = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrlValorExtenso: TSZRLabel;
    CentroCusto1: TCentroCusto;
    Cliente1: TCliente;
    Extenso1: TValorPorExtenso;
    Cheque1: TCheque;
    zrlValorNumerico: TSZRLabel;
    zrlNominal: TSZRLabel;
    zrlObservado: TSZRLabel;
    zrlCidadeDia: TSZRLabel;
    zrlMes: TSZRLabel;
    zrlAno: TSZRLabel;
    zrlDia: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel61: TSZRLabel;
    zrlValorExtensoCont: TSZRLabel;
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TCheque;
  end;

var
  rpt_ImprimirChequeBEC: Trpt_ImprimirChequeBEC;

implementation

uses  MxMovCaixa, UDM, Funcoes, MxSRecPedido, MxBaixaRec, MxReceber;
{$R *.DFM}

procedure Trpt_ImprimirChequeBEC.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');
var
  S : string;
begin
  zrlValorNumerico.Caption := PreencheE(format('%.2f',[Entidade.Valor]),'*',zrlValorNumerico.Width);

  Extenso1.Valor := Entidade.Valor;

  S := Extenso1.Texto;
  if Length(S) <= 109 then
    zrlValorExtenso.Caption:=PreencheEspaco(114,'('+UpperCase(S)+'. ','* ')+')'
  else
  Begin
    zrlValorExtenso.Caption:='('+Copy(UpperCase(S),1,110);
    zrlValorExtensoCont.Caption := PreencheEspaco(114,Copy(UpperCase(S),111,Length(S))+'. ','* ')+')'
  end;

  zrlNominal.Caption := Entidade.Nominal;

  zrlCidadeDia.Caption := DM.CentroCusto1.Cidade+',';

  zrlDia.Caption := FormatDateTime('dd',Entidade.Data);  

  zrlMes.Caption := mes[StrToInt(FormatDateTime('mm',Entidade.Data))];

  zrlAno.Caption := FormatDateTime('yyyy',Entidade.Data);

  zrlObservado.Caption := Entidade.OBS;
end;

procedure Trpt_ImprimirChequeBEC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  CentroCusto1.Close;
  Cliente1.Close;
  action:=cafree;
end;

procedure Trpt_ImprimirChequeBEC.FormCreate(Sender: TObject);
begin
  Entidade := Cheque1;
end;

end.
