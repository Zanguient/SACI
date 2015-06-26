unit UProcura_Mercadoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, RegProc,
  CentroCusto, funcoes;

type
  Trpt_Procura_Mercadoria = class(TForm)
    Report: TSZReport;
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
    RegProc1: TRegProc;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel9: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRLabel10: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlFiltros: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel4: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Procura_Mercadoria: Trpt_Procura_Mercadoria;

implementation
uses
 UDM;

{$R *.DFM}


procedure Trpt_Procura_Mercadoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 RegProc1.Active:=false;
end;

procedure Trpt_Procura_Mercadoria.FormCreate(Sender: TObject);
begin
  RegProc1.Active:=true;
end;



procedure Trpt_Procura_Mercadoria.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Procura_Mercadoria.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=RegProc1.CodigoCNC;
  CentroCusto1.Open;
  SZRLabel3.Caption:=CentroCusto1.RazaoSocial;
end;

procedure Trpt_Procura_Mercadoria.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
