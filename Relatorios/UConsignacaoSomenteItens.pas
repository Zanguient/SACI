unit UConsignacaoSomenteItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZReport, ZRCtrls, DB, DBTables;

type
  Trpt_UConsignacaoSomenteItens = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrlTituloRelatorio: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel5: TSZRLabel;
    zrbDetalhe: TSZRBand;
    ZRDBText10: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    zrlbRodapePagina: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    SZRDBText3: TSZRDBText;
    qProdutos: TQuery;
    SZRLabel4: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRBand1: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel2: TSZRLabel;
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrlbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SZRBand1AfterPrint(Sender: TObject; Printed: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vTotQuantidade, vTotValor: real;
  public
    { Public declarations }
  end;

var
  rpt_UConsignacaoSomenteItens: Trpt_UConsignacaoSomenteItens;

implementation

uses UDM, funcoes;

{$R *.dfm}

procedure Trpt_UConsignacaoSomenteItens.zrbCabecalhoPaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  ZRLabel1.Caption := DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption := DM.Configuracao1.LojaNome;
end;

procedure Trpt_UConsignacaoSomenteItens.zrlbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;
end;

procedure Trpt_UConsignacaoSomenteItens.zrbDetalheBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  //zrlValorItem.Caption := Format('%.2f',[qProdutos.FieldByName('ICS_VALOR').AsFloat]);
  zrlTotalItem.Caption := Format('%.2f',[qProdutos.FieldByName('VALOR_TOTAL').AsFloat]);

  vTotQuantidade := vTotQuantidade + qProdutos.FieldByName('QUANTIDADE').AsFloat;
  vTotValor := vTotValor + qProdutos.FieldByName('VALOR_TOTAL').AsFloat;
end;

procedure Trpt_UConsignacaoSomenteItens.FormCreate(Sender: TObject);
begin
  vTotQuantidade := 0;
  vTotValor := 0;
end;

procedure Trpt_UConsignacaoSomenteItens.SZRBand1AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  vTotQuantidade := 0;
  vTotValor := 0;
end;

procedure Trpt_UConsignacaoSomenteItens.SZRBand1BeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  SZRLabel2.Caption := Format('%.0f',[vTotQuantidade]);
  SZRLabel15.Caption := Format('%.2f',[vTotValor]);
end;

end.
