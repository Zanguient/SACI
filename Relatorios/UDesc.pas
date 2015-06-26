unit UDesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Descontos;

type
  Trpt_Desc = class(TForm)
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
    ZRLabel10: TSZRLabel;
    ZRDBText3: TSZRDBText;
    Descontos1: TDescontos;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    Descontos1DES_CODIGO: TIntegerField;
    Descontos1FOR_CODIGO: TIntegerField;
    Descontos1GRP_CODIGO: TIntegerField;
    Descontos1USU_CODIGO: TIntegerField;
    Descontos1DES_DT_CADASTRO: TDateTimeField;
    Descontos1DES_DT_ALTERADO: TDateTimeField;
    Descontos1DES_DESCONTO_60: TFloatField;
    Descontos1DES_SITUACAO: TIntegerField;
    Descontos1DES_DESCONTO_GERENTE: TFloatField;
    Descontos1CNC_CODIGO: TIntegerField;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Desc: Trpt_Desc;

implementation
uses
  UDM;

{$R *.DFM}

procedure Trpt_Desc.FormCreate(Sender: TObject);
begin
  Descontos1.Active := true;
end;

procedure Trpt_Desc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Descontos1.Active := false;
 Action := cafree;
end;

procedure Trpt_Desc.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Desc.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

end.
