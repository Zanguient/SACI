unit URelTransReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, Recebimento, ZRCtrls, ZReport, Produto, CentroCusto,
  Item_de_Transferencia, Item_Recebimento, Item_Pre_Recebimento, funcoes,
  Pre_Recebimento;

type
  Trpt_TransReceb = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRBand2: TSZRBand;
    ZRDBText1: TSZRDBText;
    CentroCusto1: TCentroCusto;
    Produto1: TProduto;
    ZRDBText10: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText12: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRLabel15: TSZRLabel;
    item_de_recebimento1: TQuery;
    ZRBand4: TSZRBand;
    ZRLabel21: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    item_de_recebimento1IRC_CODIGO: TIntegerField;
    item_de_recebimento1CNC_CODIGO: TIntegerField;
    item_de_recebimento1PRD_CODIGO: TIntegerField;
    item_de_recebimento1REC_CODIGO: TIntegerField;
    item_de_recebimento1IRC_QUANTIDADE: TFloatField;
    item_de_recebimento1IRC_SITUACAO: TIntegerField;
    item_de_recebimento1REC_CODIGO_1: TIntegerField;
    item_de_recebimento1CNC_CODIGO_1: TIntegerField;
    item_de_recebimento1REC_DATA: TDateTimeField;
    item_de_recebimento1FOR_CODIGO: TIntegerField;
    item_de_recebimento1REC_SITUACAO: TIntegerField;
    item_de_recebimento1REC_TOT_ITEM: TIntegerField;
    item_de_recebimento1REC_TIPO: TIntegerField;
    item_de_recebimento1REC_CNC_ORIGEM: TIntegerField;
    item_de_recebimento1REC_COD_ORIGEM: TIntegerField;
    item_de_recebimento1REC_DATA_SAIDA: TDateTimeField;
    item_de_recebimento1REC_DATA_EMISSAO: TDateTimeField;
    item_de_recebimento1REC_NUM_DOC: TStringField;
    ZRLabel5: TSZRLabel;
    Item_Pre_Recebimento1: TItem_Pre_Recebimento;
    item_de_recebimento1REC_OBSERVACAO: TStringField;
    item_de_recebimento1PRC_CODIGO: TIntegerField;
    SZRDBText1: TSZRDBText;
    SZRGroup1: TSZRGroup;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel14: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRDBText8: TSZRDBText;
    Item_Pre_Recebimento1rec_data2: TDateField;
    Item_Pre_Recebimento1irc_quantidade2: TFloatField;
    Item_Pre_Recebimento1produto2: TStringField;
    Item_Pre_Recebimento1referencia2: TStringField;
    Item_Pre_Recebimento1marca2: TStringField;
    Item_Pre_Recebimento1unidade2: TStringField;
    Item_Pre_Recebimento1origem2: TStringField;
    Item_Pre_Recebimento1destino2: TStringField;
    Item_Pre_Recebimento1numdoc2: TStringField;
    Item_Pre_Recebimento1rec_codigo2: TIntegerField;
    Item_Pre_Recebimento1IPR_CODIGO: TIntegerField;
    Item_Pre_Recebimento1CNC_CODIGO: TIntegerField;
    Item_Pre_Recebimento1PRD_CODIGO: TIntegerField;
    Item_Pre_Recebimento1PRC_CODIGO: TIntegerField;
    Item_Pre_Recebimento1IPR_QUANTIDADE: TFloatField;
    Item_Pre_Recebimento1IPR_SITUACAO: TIntegerField;
    Item_Pre_Recebimento1PRC_CODIGO_1: TIntegerField;
    Item_Pre_Recebimento1CNC_CODIGO_1: TIntegerField;
    Item_Pre_Recebimento1PRC_DATA: TDateTimeField;
    Item_Pre_Recebimento1PRC_TIPO: TIntegerField;
    Item_Pre_Recebimento1PRC_CNC_ORIGEM: TIntegerField;
    Item_Pre_Recebimento1PRC_DATA_SAIDA: TDateTimeField;
    Item_Pre_Recebimento1PRC_DATA_EMISSAO: TDateTimeField;
    Item_Pre_Recebimento1PRC_NUM_DOC: TStringField;
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_TransReceb: Trpt_TransReceb;

implementation
Uses
  UDM;
{$R *.DFM}

procedure Trpt_TransReceb.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;


procedure Trpt_TransReceb.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
