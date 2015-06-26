unit UTituloAbertos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Titulo_receber, funcoes;

type
  Trpt_TituloAbertos = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRDBText9: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    ZRLabel14: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRGroup1: TSZRGroup;
    ZRDBText2: TSZRDBText;
    ZRLabel12: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel1: TSZRLabel;
    Cliente1: TCliente;
    SZRLabel2: TSZRLabel;
    SZRDBText1: TSZRDBText;
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    SomaSemJuros,SomaComJuros:Double;
  end;

var
  rpt_TituloAbertos: Trpt_TituloAbertos;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_TituloAbertos.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  ValorComJuros,ValorSemJuros:Double;
begin
  ValorSemJuros:=Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat;
  SomaSemJuros:=SomaSemJuros+ValorSemJuros;
  if Titulo_receber1.FieldByName('TRC_VENCIMENTO').asDateTime < DM.Configuracao1.Data then
    ValorComJuros:=Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat+
        Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(Trunc(DM.Configuracao1.Data)-
        Trunc(Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsDateTime))/3000)
  else
    ValorComJuros:=Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat;
  SomaComJuros:=SomaComJuros+ValorComJuros;
  ZRLabel14.Caption:=Format('%.2f',[ValorSemJuros]);
  ZRLabel15.Caption:=Format('%.2f',[ValorComJuros]);
end;

procedure Trpt_TituloAbertos.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel17.Caption:=Format('%.2f',[SomaComJuros]);
  ZRLabel18.Caption:=Format('%.2f',[SomaSemJuros]);
end;

procedure Trpt_TituloAbertos.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=Dm.Configuracao1.LojaNome;
end;

procedure Trpt_TituloAbertos.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SomaSemJuros:=0;
  SomaComJuros:=0;
end;

procedure Trpt_TituloAbertos.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_TituloAbertos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Titulo_receber1.Active:=False;
  Action:=cafree;
end;

procedure Trpt_TituloAbertos.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=Titulo_receber1.CodigoCNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger:=Titulo_receber1.CodigoCLI;
  Cliente1.Open;
  SZRLabel1.Caption:=Cliente1.RazaoSocial;
end;

procedure Trpt_TituloAbertos.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
