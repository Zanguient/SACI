unit UGrupo_consorcio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Produto,
  GrupoCons;

type
  Trpt_grupo_consorcio = class(TForm)
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
    ZRDBText5: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRLabel10: TSZRLabel;
    GrupoCons1: TGrupoCons;
    Produto1: TProduto;
    GrupoCons1GCN_CODIGO: TIntegerField;
    GrupoCons1CNC_CODIGO: TIntegerField;
    GrupoCons1PRD_CODIGO: TIntegerField;
    GrupoCons1GCN_DESCRICAO: TStringField;
    GrupoCons1GCN_DATA_INI: TDateTimeField;
    GrupoCons1GCN_DURACAO: TIntegerField;
    GrupoCons1GCN_NSORTEIOS: TIntegerField;
    GrupoCons1GCN_SITUACAO: TIntegerField;
    GrupoCons1GCN_OBSERVACAO: TStringField;
    GrupoCons1PRD_NOME: TStringField;
    ZRLabel13: TSZRLabel;
    ZRDBText6: TSZRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_grupo_consorcio: Trpt_grupo_consorcio;

implementation

{$R *.DFM}








end.
