unit UCli_Inadimp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Parametro,
  CentroCusto, Titulo_receber, funcoes;

type
  Trpt_cli_Inadimp = class(TForm)
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
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText8: TSZRDBText;
    Parametro1: TParametro;
    ZRDBText4: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRLabel17: TSZRLabel;
    ZRDBText7: TSZRDBText;
    ZRLabel20: TSZRLabel;
    SZRGroup1: TSZRGroup;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRBand1: TSZRBand;
    SZRLabel3: TSZRLabel;
    Cliente1: TCliente;
    SZRLabel4: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRDBText3: TSZRDBText;
    Cliente1Endereco: TStringField;
    Cliente1CLI_CODIGO: TIntegerField;
    Cliente1CNC_CODIGO: TIntegerField;
    Cliente1CLI_DATA_NASC: TDateTimeField;
    Cliente1CLI_RZ_SOCIAL: TStringField;
    Cliente1CLI_CGC_CPF: TStringField;
    Cliente1CLI_CGF_RG: TStringField;
    Cliente1CLI_LOGRADOURO: TIntegerField;
    Cliente1CLI_ENDERECO: TStringField;
    Cliente1CLI_BAIRRO: TStringField;
    Cliente1CLI_CIDADE: TStringField;
    Cliente1CLI_UF: TStringField;
    Cliente1CLI_CEP: TStringField;
    Cliente1CLI_FONE: TStringField;
    Cliente1CLI_SITUACAO: TIntegerField;
    Cliente1CLI_CELULAR: TStringField;
    Cliente1QTD: TIntegerField;
    SZRLabel7: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    zrlDataINI: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Cliente1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_cli_Inadimp: Trpt_cli_Inadimp;
  QtdTRC, QtdCLI : Integer;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_cli_Inadimp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Parametro1.Active:=False;
  CentroCusto1.Active:=False;
  Cliente1.Active:=False;
  Action := cafree;
end;

procedure Trpt_cli_Inadimp.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_cli_Inadimp.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_cli_Inadimp.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
  CentroCusto1.Open;
  SZRLabel2.Caption:=CentroCusto1.RazaoSocial;
end;

procedure Trpt_cli_Inadimp.Cliente1CalcFields(DataSet: TDataSet);
begin
  Parametro1.Close;
  Parametro1.ParamByName('PAR_CODIGO').asInteger:=cliente1.Logradouro;
  Parametro1.Open;
  if not Parametro1.IsEmpty then
    Cliente1.FieldByName('Endereco').asstring:=Parametro1.Descricao+' '+Cliente1.Endereco
  else
    Cliente1.FieldByName('Endereco').asstring:=Cliente1.Endereco;
end;

procedure Trpt_cli_Inadimp.FormCreate(Sender: TObject);
begin
  QtdTRC := 0;
  QtdCLI := 0;
end;

procedure Trpt_cli_Inadimp.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  QtdTRC := QtdTRC + Cliente1.FieldByName('QTD').asInteger;
  QtdCLI := QtdCLI + 1;

end;

procedure Trpt_cli_Inadimp.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel25.Caption:=IntToStr(QtdCLI);
  SZRLabel10.Caption:=IntToStr(QtdTRC);
end;

procedure Trpt_cli_Inadimp.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
