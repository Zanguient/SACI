unit UFluxoCaixaDia2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Boletim_Diario, funcoes;

type
  Trpt_FluxoCaixaDia2 = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Movimento_caixa1: TMovimento_caixa;
    ZRLabel6: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel12: TSZRLabel;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRExpression2: TSZRExpression;
    ZRBand4: TSZRBand;
    ZRBand3: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRBand5: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRSysData3: TSZRSysData;
    ZRDBText7: TSZRDBText;
    ZRLabel18: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRExpression5: TSZRExpression;
    ZRExpression6: TSZRExpression;
    ZRLabel20: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRExpression7: TSZRExpression;
    ZRExpression8: TSZRExpression;
    ZRGroup2: TSZRGroup;
    ZRDBText9: TSZRDBText;
    ZRLabel21: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRDBText10: TSZRDBText;
    ZRLabel23: TSZRLabel;
    ZRDBText11: TSZRDBText;
    ZRLabel24: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRLabel27: TSZRLabel;
    ZRExpression3: TSZRExpression;
    ZRExpression4: TSZRExpression;
    ZRLabel28: TSZRLabel;
    ZRLabel29: TSZRLabel;
    ZRExpression9: TSZRExpression;
    ZRLabel30: TSZRLabel;
    ZRExpression10: TSZRExpression;
    ZRLabel25: TSZRLabel;
    ZRLabel26: TSZRLabel;
    ZRExpression11: TSZRExpression;
    ZRBand6: TSZRBand;
    ZRLabel31: TSZRLabel;
    ZRExpression12: TSZRExpression;
    ZRExpression14: TSZRExpression;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_FluxoCaixaDia2: Trpt_FluxoCaixaDia2;

implementation
Uses
  URelData2,UDM;
{$R *.DFM}

procedure Trpt_FluxoCaixaDia2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Movimento_Caixa1.Active := False;
  Action := cafree;
end;

procedure Trpt_FluxoCaixaDia2.FormCreate(Sender: TObject);
begin
  Movimento_caixa1.Close;
  Movimento_caixa1.ParamByName('DATA').AsDate:=rpt_Data2.DateTimePicker1.Date;
  Movimento_caixa1.Open;
end;

procedure Trpt_FluxoCaixaDia2.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FluxoCaixaDia2.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FluxoCaixaDia2.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
