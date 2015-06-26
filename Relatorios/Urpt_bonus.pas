unit Urpt_bonus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Item_de_Bonus,
  Bonus, Produto, CentroCusto, funcoes;

type
  Trpt_Bonus = class(TForm)
    report: TSZReport;
    SZRSubDetailBand1: TSZRSubDetailBand;    
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Bonus1: TBonus;
    Item_de_Bonus1: TItem_de_Bonus;
    DSBonus1: TDataSource;
    Bonus1BON_CODIGO: TIntegerField;
    Bonus1BON_MES: TIntegerField;
    Bonus1BON_ANO: TIntegerField;
    Bonus1USU_CODIGO: TIntegerField;
    Bonus1BON_DT_ALTERADO: TDateTimeField;
    Bonus1BON_DT_CADASTRO: TDateTimeField;
    Item_de_Bonus1IBN_CODIGO: TIntegerField;
    Item_de_Bonus1BON_CODIGO: TIntegerField;
    Item_de_Bonus1PRD_CODIGO: TIntegerField;
    Item_de_Bonus1USU_CODIGO: TIntegerField;
    Item_de_Bonus1IBN_DT_CADASTRO: TDateTimeField;
    Item_de_Bonus1IBN_DT_ALTERADO: TDateTimeField;
    Item_de_Bonus1IBN_BONUS_FOR: TFloatField;
    Item_de_Bonus1IBN_BONUS_LOJA: TFloatField;
    Bonus1Epoca: TStringField;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    zrdBonus1: TSZRDBText;
    zrlDescPercentual: TSZRLabel;
    zrdBonus2: TSZRDBText;
    Item_de_Bonus1Produto: TStringField;
    SZRDBText5: TSZRDBText;
    SZRLabel12: TSZRLabel;
    Produto1: TProduto;
    SZRLabel3: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    ZRLabel6: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlDescBonus1: TSZRLabel;
    zrlDescBonus2: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Bonus1CalcFields(DataSet: TDataSet);
    procedure Item_de_Bonus1CalcFields(DataSet: TDataSet);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Bonus: Trpt_Bonus;
const
  vMes : array [1..12] of string = ('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');
  
implementation
uses
  UDM, MxSelBonus;

{$R *.DFM}


procedure Trpt_Bonus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Bonus1.Active         := false;
  Item_de_Bonus1.Active := false;
  Action                := cafree;
end;

procedure Trpt_Bonus.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Bonus.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Bonus.Bonus1CalcFields(DataSet: TDataSet);
begin
  Bonus1.FieldByName('Epoca').asString:=vMes[Bonus1.mes]+'/'+IntToStr(Bonus1.Ano);
end;

procedure Trpt_Bonus.Item_de_Bonus1CalcFields(DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger:=Item_de_Bonus1.CodigoPRD;
    Open;
    Item_de_Bonus1.FieldByName('Produto').asString := Descricao+' '+Referencia+' '+
      Marca;
  end;
end;

procedure Trpt_Bonus.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if tag = 0 then
  Begin
    if fMxSelBonus.ckbSomenteBonus2.Checked then
    Begin
      zrlDescBonus1.Enabled:=False;
      zrdBonus1.Enabled:=False;
      zrlDescPercentual.Enabled:=False;
    end
    else if fMxSelBonus.ckbSomenteBonus1.Checked then
    Begin
      zrlDescBonus2.Enabled:=False;
      zrdBonus2.Enabled:=False;
    end;
  end;
end;

procedure Trpt_Bonus.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
