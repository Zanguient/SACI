unit URelPosEstoqueLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZRCtrls, ZReport, DB, DBTables, funcoes;

type
  Trpt_PosEstoqueLote = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrlTituloRelatorio: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel11: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupo: TSZRGroup;
    ZRDBText1: TSZRDBText;
    ZRDBText5: TSZRDBText;
    zrbRodapeGrupo: TSZRBand;
    zrlLinha: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlDescTotalPatrimonio: TSZRLabel;
    zrlTotalPatrimonio: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlTotalQuantidade: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel9: TSZRLabel;
    Item_de_Estoque_Detalhe1: TQuery;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_PosEstoqueLote: Trpt_PosEstoqueLote;

implementation

uses UDM;

{$R *.dfm}

procedure Trpt_PosEstoqueLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CAFree;
end;

procedure Trpt_PosEstoqueLote.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_PosEstoqueLote.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

end.
