unit UConsorciado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Consorciado,
  GrupoCons;

type
  Trpt_consorciado = class(TForm)
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
    GrupoCons1: TGrupoCons;
    Cliente1: TCliente;
    Consorciado1: TConsorciado;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    Consorciado1CNS_CODIGO: TIntegerField;
    Consorciado1CNC_CODIGO: TIntegerField;
    Consorciado1CLI_CODIGO: TIntegerField;
    Consorciado1GCN_CODIGO: TIntegerField;
    Consorciado1GCN_DESCRICAO: TStringField;
    Consorciado1CLI_NOME: TStringField;
    ZRDBText3: TSZRDBText;
    ZRLabel10: TSZRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_consorciado: Trpt_consorciado;

implementation

{$R *.DFM}




end.
