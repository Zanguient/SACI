unit UOrigem_fiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Origem_Fiscal, funcoes;

type
  Trpt_origem_fiscal = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRLabel7: TSZRLabel;
    Origem_Fiscal1: TOrigem_Fiscal;
    ZRLabel9: TSZRLabel;
    ZRDBText2: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Origem_Fiscal1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_origem_fiscal: Trpt_origem_fiscal;

implementation
uses
  UDM;

{$R *.DFM}




procedure Trpt_origem_fiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Origem_Fiscal1.Active:=false;
 Action := cafree;
end;

procedure Trpt_origem_fiscal.FormCreate(Sender: TObject);
begin
 Origem_Fiscal1.Active:=true;
end;

procedure Trpt_origem_fiscal.Origem_Fiscal1BeforeOpen(DataSet: TDataSet);
begin
 Origem_Fiscal1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_origem_fiscal.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_origem_fiscal.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_origem_fiscal.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
