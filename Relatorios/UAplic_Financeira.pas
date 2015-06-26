unit UAplic_Financeira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, AplicFin,
  Agencia, funcoes;

type
  Trpt_aplic_financeira = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel5: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    AplicFin1: TAplicFin;
    Agencia1: TAgencia;
    AplicFin1APF_CODIGO: TIntegerField;
    AplicFin1CNC_CODIGO: TIntegerField;
    AplicFin1BNC_NUMERO: TIntegerField;
    AplicFin1APF_SITUACAO: TIntegerField;
    AplicFin1AGN_NUMERO: TIntegerField;
    AplicFin1APF_OBSERVACAO: TStringField;
    AplicFin1AGN_NOME: TStringField;
    AplicFin1APF_SALDO: TFloatField;
    ZRDBText5: TSZRDBText;
    ZRLabel9: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AplicFin1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_aplic_financeira: Trpt_aplic_financeira;

implementation
uses
 UDM;

{$R *.DFM}





procedure Trpt_aplic_financeira.FormCreate(Sender: TObject);
begin
  AplicFin1.Active := true;
  Agencia1.Active := true;
end;

procedure Trpt_aplic_financeira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AplicFin1.Active := false;
  Agencia1.Active  := false;
  Action           := cafree;
end;



procedure Trpt_aplic_financeira.AplicFin1BeforeOpen(DataSet: TDataSet);
begin
 AplicFin1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_aplic_financeira.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_aplic_financeira.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_aplic_financeira.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
