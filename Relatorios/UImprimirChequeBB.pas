unit UImprimirChequeBB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, Pedido_de_Venda, CentroCusto,
  Cheque;

type
  Trpt_ImprimirChequeBB = class(TForm)
    CentroCusto1: TCentroCusto;
    Cliente1: TCliente;
    Extenso1: TValorPorExtenso;
    Cheque1: TCheque;
    report: TSZReport;
    zrbDetalhe: TSZRBand;
    zrlValorExtenso: TSZRLabel;
    zrlCidadeDia: TSZRLabel;
    zrlValorNumerico: TSZRLabel;
    zrlNominal: TSZRLabel;
    zrlMes: TSZRLabel;
    zrlAno: TSZRLabel;
    zrlDia: TSZRLabel;
    zrlValorExtensoCont: TSZRLabel;
    zrbCabecalhoPagina: TSZRBand;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheAfterPrint(Sender: TObject; Printed: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    iNumPagina: integer;
    Entidade: TCheque;
  end;

var
  rpt_ImprimirChequeBB: Trpt_ImprimirChequeBB;

implementation

uses  MxMovCaixa, UDM, Funcoes, MxSRecPedido, MxBaixaRec, MxReceber;
{$R *.DFM}

procedure Trpt_ImprimirChequeBB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  CentroCusto1.Close;
  Cliente1.Close;
  action:=cafree;
end;

procedure Trpt_ImprimirChequeBB.FormCreate(Sender: TObject);
begin
  Entidade := Cheque1;
  zrbCabecalhoPagina.Height := 0;
end;

procedure Trpt_ImprimirChequeBB.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');
var
  S : string;
begin
  inc(iNumPagina);

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

//  zrlObservado.Caption := Entidade.OBS;
end;

procedure Trpt_ImprimirChequeBB.zrbDetalheAfterPrint(Sender: TObject;
  Printed: Boolean);
begin
{  if iNumPagina = 3 then
    zrbDetalhe.Height := 17
  else
    zrbDetalhe.Height := 18;
}

{  if report.CurrentY = 72 then
    zrbDetalhe.Height := 17
  else
    zrbDetalhe.Height := 18;
}    
    
//    report.ForceNewPage;
//    report.CurrentY := 0;
end;

procedure Trpt_ImprimirChequeBB.zrbCabecalhoPaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  iNumPagina := 0;
end;

end.
