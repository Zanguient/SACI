unit UUF_ICMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls,
  UF_ICMS, funcoes;

type
  Trpt_UF_ICMS = class(TForm)
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
    ZRDBText4: TSZRDBText;
    ZRLabel11: TSZRLabel;
    UF_ICMS1: TUF_ICMS;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    UF_ICMS1UFI_UF: TStringField;
    UF_ICMS1UFI_ICMS_COMPRA: TFloatField;
    UF_ICMS1UFI_ICMS_VENDA: TFloatField;
    UF_ICMS1USU_CODIGO: TIntegerField;
    UF_ICMS1UFI_DT_CADASTRO: TDateTimeField;
    UF_ICMS1UFI_DT_ALTERADO: TDateTimeField;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel4: TSZRLabel;
    UF_ICMS1Usuario: TStringField;
    SZRDBText4: TSZRDBText;
    UF_ICMS1CNC_CODIGO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure UF_ICMS1CalcFields(DataSet: TDataSet);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_UF_ICMS: Trpt_UF_ICMS;

implementation
uses
 UDM;

{$R *.DFM}


procedure Trpt_UF_ICMS.FormCreate(Sender: TObject);
begin
  UF_ICMS1.Active := true;
end;

procedure Trpt_UF_ICMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 UF_ICMS1.Active := true;
 Action := cafree;
end;



procedure Trpt_UF_ICMS.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_UF_ICMS.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_UF_ICMS.UF_ICMS1CalcFields(DataSet: TDataSet);
begin
  UF_ICMS1.FieldByName('Usuario').asString := DM.NomeUsuario(UF_ICMS1.CodigoUSU);
end;

procedure Trpt_UF_ICMS.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
