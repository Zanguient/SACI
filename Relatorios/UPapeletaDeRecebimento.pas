unit UPapeletaDeRecebimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, funcoes,
  Movimento_caixa, Extenso, Pedido_de_Venda, Titulo_receber, CentroCusto;

type
  Trpt_PapeletaDeRecebimento = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    CentroCusto1: TCentroCusto;
    Cliente1: TCliente;
    Extenso1: TValorPorExtenso;
    zrbDetalhe: TSZRBand;
    ZRLabel6: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel21: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRDBText13: TSZRDBText;
    zrlDataExtenso: TSZRLabel;
    zrlDescEndereco: TSZRLabel;
    zrlTotalPedido: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel5: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlEndereco: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlCNPJ: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlCGF: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlPedidos: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlValorTitulo: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel16: TSZRLabel;
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vPrimeiraPagina: Boolean;
  public
    Entidade: TTitulo_receber;
  end;

var
  rpt_PapeletaDeRecebimento: Trpt_PapeletaDeRecebimento;

implementation

uses  MxMovCaixa, UDM, MxSRecPedido, MxBaixaRec, MxReceber;
{$R *.DFM}

procedure Trpt_PapeletaDeRecebimento.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if vPrimeiraPagina then
  Begin
    report.Options.PageLength := 31;
    vPrimeiraPagina := False;
  end
  else
    report.Options.PageLength := 32;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_PapeletaDeRecebimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  CentroCusto1.Close;
  Cliente1.Close;
  action:=cafree;
end;

procedure Trpt_PapeletaDeRecebimento.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  vPrimeiraPagina := True;
end;

procedure Trpt_PapeletaDeRecebimento.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
const
  mes : array [1..12] of string = ('JANEIRO','FEVEREIRO','MARCO','ABRIL','MAIO','JUNHO','JULHO','AGOSTO','SETEMBRO','OUTUBRO','NOVEMBRO','DEZEMBRO');
var
  S : string;
begin
  //O Campo zrlTotal é preenchido na tela de Origem desse relatório

  zrlValorTitulo.Caption := format('%.2f',[Entidade.Valor]);

  Extenso1.Valor:= Entidade.Valor;
  S := Extenso1.Texto;
  ZRlabel21.Caption:='('+UpperCase(S)+')';

  with CentroCusto1 do
  Begin
    if CodigoCNC <> Entidade.CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
    end;
    zrlDataExtenso.Caption:=Cidade+', '+FormatDateTime('dd',DM.Configuracao1.Data)+
      ' DE '+mes[StrToInt(FormatDateTime('mm',DM.Configuracao1.Data))]+
      ' DE '+FormatDateTime('yyyy',DM.Configuracao1.Data);
  end;

  with Cliente1 do
  Begin
    if (CodigoCLI <> Entidade.CodigoCLI) or
       (CodigoCNC <> Entidade.ClienteCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    zrlCliente.Caption := RazaoSocial+'('+IntToStr(Entidade.CodigoCLI)+')';
    zrlCNPJ.Caption    := CPFCGC;
    zrlCGF.Caption     := CGFRG;
    zrlEndereco.Caption := Endereco+' '+Bairro+' '+Cidade+'/'+Uf;
  end;
end;

procedure Trpt_PapeletaDeRecebimento.zrbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
