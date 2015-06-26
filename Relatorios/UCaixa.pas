unit UCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Caixa,
  Funcionario, funcoes;

type
  Trpt_caixa = class(TForm)
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
    Funcionario1: TFuncionario;
    Caixa1: TCaixa;
    Caixa1CAX_CODIGO: TIntegerField;
    Caixa1CNC_CODIGO: TIntegerField;
    Caixa1FUN_CODIGO: TIntegerField;
    Caixa1FUN_NOME: TStringField;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRLabel10: TSZRLabel;
    Caixa1CAX_DESCRICAO: TStringField;
    Caixa1CAX_DATA: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Caixa1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_caixa: Trpt_caixa;

implementation
uses
  UDM;

{$R *.DFM}


procedure Trpt_caixa.FormCreate(Sender: TObject);
begin
  Caixa1.Active        := true;
  Funcionario1.Active  := true;
end;

procedure Trpt_caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Caixa1.Active        := false;
  Funcionario1.Active  := false;
  Action               := cafree;
end;



procedure Trpt_caixa.Caixa1BeforeOpen(DataSet: TDataSet);
begin
 Caixa1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_caixa.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_caixa.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_caixa.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
