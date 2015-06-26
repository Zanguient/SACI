unit USugestaoCmp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Item_Pedido_Venda, Item_de_Estoque;

type
  Trpt_SugestaoCmp = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRLabel12: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel24: TSZRLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    ZRGroup2: TSZRGroup;
    ZRLabel6: TSZRLabel;
    ZRDBText4: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText1: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRDBText8: TSZRDBText;
    ZRDBText10: TSZRDBText;
    ZRLabel4: TSZRLabel;
    zrlfiltros: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlNecessidade: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    zrbSumario: TSZRBand;
    SZRLabel4: TSZRLabel;
    zrlTotalGrupo: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    SZRLabel6: TSZRLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vTotalGrupo, vTotalGeral: Double;
  public
    { Public declarations }
  end;

var
  rpt_SugestaoCmp: Trpt_SugestaoCmp;

implementation
Uses
  UDM, Funcoes;
{$R *.DFM}

procedure Trpt_SugestaoCmp.Button1Click(Sender: TObject);
begin
  report.report.Preview;
end;

procedure Trpt_SugestaoCmp.FormCreate(Sender: TObject);
begin
  Item_de_Estoque1.Open;
  vTotalGrupo := 0;
  vTotalGeral := 0;
end;

procedure Trpt_SugestaoCmp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Item_de_Estoque1.Close;
end;

procedure Trpt_SugestaoCmp.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_SugestaoCmp.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_SugestaoCmp.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  try
    zrlNecessidade.Caption := Format('%.2f',[Item_de_Estoque1.FieldByName('PRD_EST_MINIMO').asFloat-Item_de_Estoque1.FieldByName('IES_SCOMERCIAL').asFloat]);
    vTotalGrupo := vTotalGrupo + Arredonda(Item_de_Estoque1.FieldByName('PRD_EST_MINIMO').asFloat-Item_de_Estoque1.FieldByName('IES_SCOMERCIAL').asFloat);
    vTotalGeral := vTotalGeral + Arredonda(Item_de_Estoque1.FieldByName('PRD_EST_MINIMO').asFloat-Item_de_Estoque1.FieldByName('IES_SCOMERCIAL').asFloat);    
  except
    zrlNecessidade.Caption := '-';
  end;
end;

procedure Trpt_SugestaoCmp.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGrupo.Caption := Format('%.2f',[vTotalGrupo]);
end;

procedure Trpt_SugestaoCmp.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGeral.Caption := Format('%.2f',[vTotalGeral]);
end;

procedure Trpt_SugestaoCmp.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vTotalGrupo := 0;
end;

procedure Trpt_SugestaoCmp.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
