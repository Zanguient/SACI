unit UCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, Pedido_de_Venda, Titulo_receber, CentroCusto;

type
  Trpt_Credito = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrlCabecalhoCredito: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel21: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel1: TSZRLabel;
    Extenso1: TValorPorExtenso;
    SZRLabel2: TSZRLabel;
    Cliente1: TCliente;
    zrlUsuario: TSZRLabel;
    zrlCliente: TSZRLabel;
    procedure ZRLabel21BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Credi : Double;
    { Public declarations }
  end;

var
  rpt_Credito: Trpt_Credito;

implementation

uses  UDM, funcoes;
{$R *.DFM}

procedure Trpt_Credito.ZRLabel21BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  S : string;
begin
  Extenso1.Valor:=Credi;
  S := Extenso1.Texto;
  ZRlabel21.Caption:='('+UpperCase(S)+')';
end;

procedure Trpt_Credito.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Credito.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('JANEIRO','FEVEREIRO','MARCO','ABRIL','MAIO','JUNHO','JULHO','AGOSTO','SETEMBRO','OUTUBRO','NOVEMBRO','DEZEMBRO');
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;

  zrlCliente.Caption := Cliente1.RazaoSocial+' ('+IntToStr(Cliente1.CodigoCLI)+')';

  SZRLabel2.Caption:=format('%.2f',[Credi]);
  SZRLabel1.Caption:=DM.Configuracao1.Cidade+', '+
    FormatDateTime('dd',DM.Configuracao1.Data)+' DE '+mes[StrToInt(FormatDateTime('mm',DM.Configuracao1.Data))]+
    ' DE '+FormatDateTime('yyyy',DM.Configuracao1.Data);
end;

procedure Trpt_Credito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cliente1.Close;
  action:=cafree;
end;

procedure Trpt_Credito.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
