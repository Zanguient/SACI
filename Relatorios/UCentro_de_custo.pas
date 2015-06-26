unit UCentro_de_custo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CentroCusto,
  Parametro, funcoes;

type
  Trpt_centro_de_custo = class(TForm)
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
    CentroCusto1: TCentroCusto;
    ZRDBText1: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText8: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel15: TSZRLabel;
    CentroCusto1CNC_CODIGO: TIntegerField;
    CentroCusto1CNC_RZ_SOCIAL: TStringField;
    CentroCusto1CNC_CGC: TStringField;
    CentroCusto1CNC_IE: TStringField;
    CentroCusto1CNC_LOGRADOURO: TIntegerField;
    CentroCusto1CNC_ENDERECO: TStringField;
    CentroCusto1CNC_BAIRRO: TStringField;
    CentroCusto1CNC_FAX: TStringField;
    ZRDBText7: TSZRDBText;
    ZRLabel14: TSZRLabel;
    ZRDBText9: TSZRDBText;
    CentroCusto1CNC_FONE: TStringField;
    ZRLabel16: TSZRLabel;
    procedure FormCreate(Sender: TObject);
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
  rpt_centro_de_custo: Trpt_centro_de_custo;

implementation
uses
  UDM;

{$R *.DFM}

procedure Trpt_centro_de_custo.FormCreate(Sender: TObject);
begin
  CentroCusto1.Active := true;
end;

procedure Trpt_centro_de_custo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CentroCusto1.Active := false;
    Action := cafree;
end;







procedure Trpt_centro_de_custo.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_centro_de_custo.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_centro_de_custo.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
