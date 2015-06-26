unit ULimite_de_Gasto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZReport, ZRCtrls, DB, DBTables, SQuery, Conta_de_Caixa, funcoes;

type
  Trpt_Limite_Gasto = class(TForm)
    Limite_Gasto1: TQuery;
    report: TSZReport;
    zrTitulo: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrlDetail: TSZRBand;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText5: TSZRDBText;
    SZRDBText1: TSZRDBText;
    zrPageFooter: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    Limite_Gasto1CNC_CODIGO: TIntegerField;
    Limite_Gasto1CNC_RZ_SOCIAL: TStringField;
    Limite_Gasto1LMG_CODIGO: TIntegerField;
    Limite_Gasto1CCX_DESCRICAO: TStringField;
    Limite_Gasto1CCX_DC: TStringField;
    Limite_Gasto1LMG_LIMITE_MENSAL: TFloatField;
    Limite_Gasto1CCX_CONTABIL_1: TStringField;
    Limite_Gasto1CCX_HISTORICO_CONTABIL: TStringField;
    Limite_Gasto1LMG_OBSERVACAO: TStringField;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    Limite_Gasto1CCX_CONTABIL_2: TStringField;
    Limite_Gasto1CCX_GRUPO: TIntegerField;
    zrbGrupoGrupo: TSZRGroup;
    SZRLabel1: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel4: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel2: TSZRLabel;
    ZRExpression1: TSZRExpression;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrTituloBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrPageFooterBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Limite_Gasto: Trpt_Limite_Gasto;

implementation

uses UDM;

{$R *.dfm}

procedure Trpt_Limite_Gasto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  Limite_Gasto1.Active := False;
end;

procedure Trpt_Limite_Gasto.zrTituloBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Limite_Gasto.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Limite_Gasto1.FieldByName('CCX_GRUPO').AsInteger = 0 then
    SZRLabel8.Caption := 'NAO DEFINIDO'
  else
    SZRLabel8.Caption := DM.SelecionaParametro(Limite_Gasto1.FieldByName('CCX_GRUPO').AsInteger);
end;

procedure Trpt_Limite_Gasto.zrPageFooterBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
