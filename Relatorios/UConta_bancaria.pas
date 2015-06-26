unit UConta_bancaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Agencia, Conta,
  funcoes;

type
  Trpt_conta = class(TForm)
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
    ZRDBText4: TSZRDBText;
    ZRDBText5: TSZRDBText;
    Conta1: TConta;
    Agencia1: TAgencia;
    Conta1CBN_CODIGO: TIntegerField;
    Conta1CNC_CODIGO: TIntegerField;
    Conta1CBN_SALDO: TIntegerField;
    Conta1CBN_SITUACAO: TIntegerField;
    Conta1CBN_NUMERO: TIntegerField;
    Conta1BNC_NUMERO: TIntegerField;
    Conta1CBN_OBSERVACAO: TStringField;
    Conta1AGN_NUMERO: TIntegerField;
    Conta1AGN_NOME: TStringField;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRDBText3: TSZRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Conta1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_conta: Trpt_conta;

implementation
uses
  UDM;

{$R *.DFM}







procedure Trpt_conta.FormCreate(Sender: TObject);
begin
 Conta1.Active := true;
 Agencia1.Active := true;
end;

procedure Trpt_conta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Conta1.Active   := false;
 Agencia1.Active := false;
 Action          := cafree;
end;



procedure Trpt_conta.Conta1BeforeOpen(DataSet: TDataSet);
begin
 Conta1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_conta.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_conta.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_conta.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
