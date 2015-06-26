unit USecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Secao, funcoes;

type
  Trpt_secao = class(TForm)
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
    ZRDBText1: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    Secao1: TSecao;
    ZRDBText3: TSZRDBText;
    ZRLabel10: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Secao1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_secao: Trpt_secao;

implementation
uses
  UDM;
{$R *.DFM}


procedure Trpt_secao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Secao1.Active:=false;
 Action := cafree;
end;

procedure Trpt_secao.FormCreate(Sender: TObject);
begin
  Secao1.Active:=true;
end;



procedure Trpt_secao.Secao1BeforeOpen(DataSet: TDataSet);
begin
  Secao1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_secao.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_secao.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_secao.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
