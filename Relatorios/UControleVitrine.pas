
unit UControleVitrine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Produto,
  CentroCusto, Controle_de_Vitrine, funcoes;

type
  Trpt_Controle_de_Vitrine = class(TForm)
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
    Produto1: TProduto;
    ZRLabel6: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRBand1: TSZRBand;
    SZRLabel4: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlProduto: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel8: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRLabel10: TSZRLabel;
    zrlFiltros: TSZRLabel;
    Controle_de_Vitrine1: TControle_de_Vitrine;
    SZRLabel1: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel12: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade : TControle_de_Vitrine;
  end;

var
  rpt_Controle_de_Vitrine: Trpt_Controle_de_Vitrine;

implementation
uses
 UDM;

{$R *.DFM}


procedure Trpt_Controle_de_Vitrine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active:=false;
  Produto1.Active:=false;
  Action:=cafree;
end;

procedure Trpt_Controle_de_Vitrine.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Controle_de_Vitrine.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;


procedure Trpt_Controle_de_Vitrine.FormCreate(Sender: TObject);
begin
  Entidade := Controle_de_Vitrine1;
end;

procedure Trpt_Controle_de_Vitrine.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  try
    CentroCusto1.Close;
    CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
    CentroCusto1.Open;
    SZRLabel3.caption := CentroCusto1.RazaoSocial;
  except
    SZRLabel3.caption :='';
  end;
end;

procedure Trpt_Controle_de_Vitrine.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
      zrlProduto.Caption := '('+IntToStr(CodigoPRD)+') '+ Descricao+' '+Marca;
  end;

end;

procedure Trpt_Controle_de_Vitrine.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.





