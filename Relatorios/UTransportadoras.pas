unit UTransportadoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Transportadora, funcoes;

type
  Trpt_transportadoras = class(TForm)
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
    ZRDBText4: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel14: TSZRLabel;
    Transportadora1: TTransportadora;
    Transportadora1TRN_CODIGO: TIntegerField;
    Transportadora1CNC_CODIGO: TIntegerField;
    Transportadora1TRN_RZ_SOCIAL: TStringField;
    Transportadora1TRN_CGC: TStringField;
    Transportadora1TRN_LOGRADOURO: TIntegerField;
    Transportadora1TRN_ENDERECO: TStringField;
    Transportadora1TRN_BAIRRO: TStringField;
    Transportadora1TRN_FONE: TStringField;
    ZRDBText5: TSZRDBText;
    ZRDBText8: TSZRDBText;
    Transportadora1TRN_CIDADE: TStringField;
    Transportadora1TRN_CEP: TStringField;
    ZRDBText9: TSZRDBText;
    ZRLabel12: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText1: TSZRDBText;
    Transportadora1TRN_NOME_FAN: TStringField;
    Transportadora1TRN_IE: TStringField;
    Transportadora1TRN_UF: TStringField;
    Transportadora1TRN_SITUACAO: TIntegerField;
    Transportadora1TRN_OBSERVACAO1: TStringField;
    Transportadora1TRN_FAX: TStringField;
    Transportadora1TRN_SITE: TStringField;
    Transportadora1TRN_EMAIL: TStringField;
    Transportadora1USU_CODIGO: TIntegerField;
    Transportadora1TRN_DT_ALTERADO: TDateTimeField;
    SZRDBText2: TSZRDBText;
    SZRLabel5: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Transportadora1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade : TTransportadora;
  end;

var
  rpt_transportadoras: Trpt_transportadoras;

implementation
uses
   UDM;

{$R *.DFM}


procedure Trpt_transportadoras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Entidade.Active:=false;
end;

procedure Trpt_transportadoras.FormCreate(Sender: TObject);
begin
  Entidade := Transportadora1;
  Entidade.Active:=true;
end;

procedure Trpt_transportadoras.Transportadora1BeforeOpen(
  DataSet: TDataSet);
begin
  Transportadora1.ParamByName('CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_transportadoras.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_transportadoras.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_transportadoras.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel2.Caption := Trim(DM.SelecionaParametro(Entidade.Logradouro)+' '+Entidade.Endereco);
end;

procedure Trpt_transportadoras.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
