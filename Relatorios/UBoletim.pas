unit UBoletim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo,
  Boletim_Diario, funcoes;

type
  Trpt_Boletim = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    zrlTituloBoletim: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Boletim_Diario1: TBoletim_Diario;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRExpression1: TSZRExpression;
    ZRExpression2: TSZRExpression;
    ZRExpression3: TSZRExpression;
    ZRLabel15: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRLabel22: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel18: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRExpression1: TSZRExpression;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Boletim: Trpt_Boletim;

implementation
uses
  UDM, MxBoletimAbreCaixa, MxBoletimFechaCaixa;

{$R *.DFM}


procedure Trpt_Boletim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Boletim_Diario1.Active := false;
 Action := cafree;
end;

procedure Trpt_Boletim.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Boletim.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Boletim.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
