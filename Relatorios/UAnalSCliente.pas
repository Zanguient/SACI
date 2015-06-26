unit UAnalSCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls;

type
  Trpt_DadosCli = class(TForm)
    report_dados: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText8: TSZRDBText;
    ZRLabel17: TSZRLabel;
    ZRDBText11: TSZRDBText;
    ZRLabel18: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRLabel19: TSZRLabel;
    ZRDBText13: TSZRDBText;
    ZRLabel20: TSZRLabel;
    ZRDBText14: TSZRDBText;
    ZRLabel21: TSZRLabel;
    ZRDBText15: TSZRDBText;
    ZRLabel22: TSZRLabel;
    ZRLabel23: TSZRLabel;
    Cliente1: TCliente;
    ZRExpression1: TSZRExpression;
    ZRBand2: TSZRBand;
    ZRLabel3: TSZRLabel;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel1: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel6: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_DadosCli: Trpt_DadosCli;

implementation
Uses
  UDM;

{$R *.DFM}


procedure Trpt_DadosCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_DadosCli.Cliente1BeforeOpen(DataSet: TDataSet);
begin
  Cliente1.ParamByName('CNC_CODIGO').AsInteger := Cliente1.CConfiguracao.CodigoCNC;
end;

procedure Trpt_DadosCli.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_DadosCli.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

end.
