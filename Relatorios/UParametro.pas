unit UParametro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, TipoParam,
  Parametro, funcoes;

type
  Trpt_parametro = class(TForm)
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
    Parametro1: TParametro;
    TipoParam1: TTipoParam;
    ZRDBText3: TSZRDBText;
    SZRGroup1: TSZRGroup;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel4: TSZRLabel;
    Parametro1PAR_CODIGO: TIntegerField;
    Parametro1PAR_DESCRICAO: TStringField;
    Parametro1TPR_DESCRICAO: TStringField;
    SZRDBText1: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRDBText3: TSZRDBText;
    Parametro1TPR_CODIGO: TIntegerField;
    Parametro1CNC_CODIGO: TIntegerField;
    Parametro1PAR_SITUACAO: TIntegerField;
    Parametro1PAR_DT_CADASTRO: TDateTimeField;
    Parametro1PAR_DT_ALTERADO: TDateTimeField;
    Parametro1PAR_INFORMACAO: TIntegerField;
    Parametro1PAR_OBSERVACAO: TStringField;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_parametro: Trpt_parametro;

implementation
uses
  UDM;
{$R *.DFM}


procedure Trpt_parametro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Parametro1.Active:=false;
 TipoParam1.Active:=false;
 Action :=cafree;
end;

procedure Trpt_parametro.FormCreate(Sender: TObject);
begin
 Parametro1.Active:=true;
 TipoParam1.Active:=true;
end;

procedure Trpt_parametro.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_parametro.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_parametro.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
