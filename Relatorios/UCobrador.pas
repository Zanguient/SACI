unit UCobrador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Vendedor,
  Parametro, Cobrador, funcoes;

type
  Trpt_cobrador = class(TForm)
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
    ZRDBText2: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRDBText8: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel15: TSZRLabel;
    Parametro1: TParametro;
    ZRDBText5: TSZRDBText;
    ZRLabel13: TSZRLabel;
    Parametro2: TParametro;
    ZRLabel16: TSZRLabel;
    ZRDBText4: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRLabel17: TSZRLabel;
    Cobrador1: TCobrador;
    Cobrador1FUN_CODIGO: TIntegerField;
    Cobrador1CNC_CODIGO: TIntegerField;
    Cobrador1FUN_NOME: TStringField;
    Cobrador1SEC_CODIGO: TIntegerField;
    Cobrador1FUN_FUNCAO: TIntegerField;
    Cobrador1FUN_DT_NASC: TDateTimeField;
    Cobrador1FUN_LOGRADOURO: TIntegerField;
    Cobrador1FUN_ENDERECO: TStringField;
    Cobrador1FUN_BAIRRO: TStringField;
    Cobrador1FUN_CIDADE: TStringField;
    Cobrador1FUN_UF: TStringField;
    Cobrador1FUN_CEP: TStringField;
    Cobrador1FUN_FONE: TStringField;
    Cobrador1FUN_SITUACAO: TIntegerField;
    Cobrador1FUN_CPF: TStringField;
    Cobrador1FUN_RG: TStringField;
    Cobrador1FUN_COTA: TFloatField;
    Cobrador1FUN_PERC_ABAIXO: TFloatField;
    Cobrador1FUN_PERC_ACIMA: TFloatField;
    Cobrador1FUN_ULT_EMPR: TStringField;
    Cobrador1FUN_REFERENCIA: TStringField;
    Cobrador1FUN_ROTA: TIntegerField;
    Cobrador1Funcao: TStringField;
    Cobrador1Logradouro: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Cobrador1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_cobrador: Trpt_cobrador;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_cobrador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Cobrador1.Active:=false;
 Parametro1.Active:=false;
 Parametro2.Active:=false;
 Action := cafree;
end;

procedure Trpt_cobrador.FormCreate(Sender: TObject);
begin
  Cobrador1.Active:=true;
  Parametro1.Active:=true;
  Parametro2.Active:=true;
end;

procedure Trpt_cobrador.Button1Click(Sender: TObject);
begin
  Report.Report.Preview;
end;

procedure Trpt_cobrador.Cobrador1BeforeOpen(DataSet: TDataSet);
begin
 Cobrador1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_cobrador.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_cobrador.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_cobrador.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
