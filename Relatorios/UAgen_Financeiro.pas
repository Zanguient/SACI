unit UAgen_Financeiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, AgenteFin, funcoes;

type
  Trpt_agen_financeiro = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrlDetalhe: TSZRBand;
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
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    AgenteFin1: TAgenteFin;
    ZRLabel13: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRGroup1: TSZRGroup;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    zrlFator: TSZRLabel;
    zrlTAC: TSZRLabel;
    zrlTaxaMensal: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TAgenteFin;
  end;

var
  rpt_agen_financeiro: Trpt_agen_financeiro;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_agen_financeiro.FormCreate(Sender: TObject);
begin
  Entidade := AgenteFin1;
end;

procedure Trpt_agen_financeiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AgenteFin1.Close;
  Action := cafree;
end;

procedure Trpt_agen_financeiro.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_agen_financeiro.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlFator.Caption := Format('%.7f',[Entidade.FieldByName('FAF_FATOR').asFloat]);
end;

procedure Trpt_agen_financeiro.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTAC.Caption := Format('%.2f',[Entidade.TaxaADM]);
  zrlTaxaMensal.Caption := Format('%.2f',[Entidade.TaxaMensal]);
end;

procedure Trpt_agen_financeiro.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
