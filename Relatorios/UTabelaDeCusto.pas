unit UTabelaDeCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Produto, Usuario,
  CentroCusto;

type
  Trpt_TabelaDeCusto = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRDBText9: TSZRDBText;
    ZRDBText1: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText3: TSZRDBText;
    zrlDataINI: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRBand1: TSZRBand;
    SZRLabel12: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlProduto: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRDBText8: TSZRDBText;
    zrlFiltros: TSZRLabel;
    SZRDBText9: TSZRDBText;
    zrlCodigo: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlCusto: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlCustoMedio: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    Produto1: TProduto;
    SZRLabel4: TSZRLabel;
    zrlPrecoCompra: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlQtdAnterior: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlCustoAnterior: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TProduto;
  end;

var
  rpt_TabelaDeCusto: Trpt_TabelaDeCusto;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_TabelaDeCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_TabelaDeCusto.FormCreate(Sender: TObject);
begin
  Entidade := Produto1;
end;

procedure Trpt_TabelaDeCusto.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlQtdAnterior.Caption   := format('%.2f',[Entidade.FieldByName('CUS_QUANTIDADE_ANT').asFloat]);
  zrlCustoAnterior.Caption := format('%.2f',[Entidade.FieldByName('CUS_CUSTO_ANT').asFloat]);
  zrlQuantidade.Caption  := format('%.2f',[Entidade.FieldByName('CUS_QUANTIDADE').asFloat]);
  zrlPrecoCompra.Caption := format('%.4f',[Entidade.FieldByName('CUS_VALOR_COMPRA').asFloat]);
  zrlCusto.Caption       := format('%.4f',[Entidade.FieldByName('CUS_VALOR_CUSTO').asFloat]);
  zrlCustoMedio.Caption  := format('%.4f',[Entidade.FieldByName('CUS_VALOR_MEDIO').asFloat]);
end;


procedure Trpt_TabelaDeCusto.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
    zrlProduto.Caption := FieldByName('PRD_DESCRICAO').asString+' '+
      FieldByName('PRD_CARACTERISTICA').asString;
end;

procedure Trpt_TabelaDeCusto.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_TabelaDeCusto.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
