unit UConta_de_Caixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Agencia, Conta,
  Conta_de_Caixa, Parametro, funcoes;

type
  Trpt_cnt_caixa = class(TForm)
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
    ZRDBText5: TSZRDBText;
    Conta_de_Caixa1: TConta_de_Caixa;
    ZRExpression1: TSZRExpression;
    SZRDBText1: TSZRDBText;
    zrbGrupoGrupo: TSZRGroup;
    SZRLabel1: TSZRLabel;
    zrlGrupo: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel4: TSZRLabel;
    SZRExpression1: TSZRExpression;
    SZRExpression2: TSZRExpression;
    SZRLabel2: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRExpression3: TSZRExpression;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_cnt_caixa: Trpt_cnt_caixa;

implementation
uses
  UDM;

{$R *.DFM}


procedure Trpt_cnt_caixa.FormCreate(Sender: TObject);
begin
  Conta_de_Caixa1.Active := true;
end;

procedure Trpt_cnt_caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Conta_de_Caixa1.Active   := false;
 Action          := cafree;
end;


procedure Trpt_cnt_caixa.Button1Click(Sender: TObject);
begin
  Report.Report.Preview
end;

procedure Trpt_cnt_caixa.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_cnt_caixa.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_cnt_caixa.zrbGrupoGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Conta_de_Caixa1.Grupo = 0 then
    zrlGrupo.Caption := 'NAO DEFINIDO'
  else
    zrlGrupo.Caption := DM.SelecionaParametro(Conta_de_Caixa1.Grupo);
end;

procedure Trpt_cnt_caixa.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
