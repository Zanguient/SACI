unit UAgencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Agencia, funcoes;

type
  Trpt_agencia = class(TForm)
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
    ZRDBText4: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText1: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText10: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRDBText7: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel14: TSZRLabel;
    Agencia1: TAgencia;
    Agencia1AGN_LOGRADOURO: TIntegerField;
    Agencia1AGN_NOME: TStringField;
    Agencia1AGN_BAIRRO: TStringField;
    Agencia1AGN_FAX: TStringField;
    Agencia1AGN_NUMERO: TIntegerField;
    Agencia1CNC_CODIGO: TIntegerField;
    Agencia1AGN_FONE: TStringField;
    ZRDBText6: TSZRDBText;
    Agencia1AGN_CIDADE: TStringField;
    ZRLabel15: TSZRLabel;
    Agencia1AGN_ENDERECO: TStringField;
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
  rpt_agencia: Trpt_agencia;

implementation
uses
 UDM;

{$R *.DFM}




procedure Trpt_agencia.FormCreate(Sender: TObject);
begin
 if not Agencia1.Active then
  Agencia1.Open;
end;

procedure Trpt_agencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Agencia1.Close;
  Action := cafree;
end;

procedure Trpt_agencia.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_agencia.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_agencia.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
