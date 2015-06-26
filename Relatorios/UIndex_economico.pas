unit UIndex_economico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Indexador_Economico, funcoes;

type
  Trpt_index_economico = class(TForm)
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
    ZRDBText4: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel11: TSZRLabel;
    Indexador_Economico1: TIndexador_Economico;
    ZRDBText5: TSZRDBText;
    ZRLabel12: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Indexador_Economico1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_index_economico: Trpt_index_economico;

implementation
uses
  UDM;

{$R *.DFM}




procedure Trpt_index_economico.FormCreate(Sender: TObject);
begin
 Indexador_Economico1.Active:=true;
end;

procedure Trpt_index_economico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Indexador_Economico1.Active:=false;
  Action := cafree;
end;

procedure Trpt_index_economico.Indexador_Economico1BeforeOpen(
  DataSet: TDataSet);
begin
 Indexador_Economico1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_index_economico.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
   ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_index_economico.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_index_economico.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
