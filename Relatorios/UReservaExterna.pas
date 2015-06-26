
unit UReservaExterna;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Produto, CentroCusto, ReservaExterna, funcoes;

type
  Trpt_ReservaExterna = class(TForm)
    report: TSZReport;
    ZRBand2: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    Produto1: TProduto;
    ZRDBText4: TSZRDBText;
    SZRGroup1: TSZRGroup;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRBand1: TSZRBand;
    SZRLabel4: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlProduto: TSZRLabel;
    zrlReferencia: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRDBText6: TSZRDBText;
    ReservaExterna1: TReservaExterna;
    zrlUsuario: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText7: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade : TReservaExterna;
  end;

var
  rpt_ReservaExterna: Trpt_ReservaExterna;

implementation
uses
 UDM;

{$R *.DFM}


procedure Trpt_ReservaExterna.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Produto1.Close;
  Action:=cafree;
end;

procedure Trpt_ReservaExterna.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ReservaExterna.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ReservaExterna.FormCreate(Sender: TObject);
begin
  Entidade := ReservaExterna1;
end;

procedure Trpt_ReservaExterna.SZRGroup1BeforePrint(Sender: TObject;
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

procedure Trpt_ReservaExterna.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
    if Entidade.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    zrlProduto.Caption := '('+IntToStr(CodigoPRD)+') '+ Descricao+' '+Marca;
    zrlReferencia.Caption := Referencia;
  end;
end;

procedure Trpt_ReservaExterna.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

end.





