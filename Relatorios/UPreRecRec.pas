unit UPreRecRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, CentroCusto, Produto, Db, DBTables, SQuery,
  Item_Pre_Recebimento, Recebimento, Item_Recebimento;

type
  Trpt_PreRecRec = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    SZRGroup1: TSZRGroup;
    zrbDetalhe: TSZRBand;
    Item_Pre_Recebimento1: TItem_Pre_Recebimento;
    Produto1: TProduto;
    CentroCusto1: TCentroCusto;
    zrbRodapeGrupoPRC: TSZRBand;
    SZRBand3: TSZRBand;
    SZRFrameLine3: TSZRFrameLine;
    SZRLabel4: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRSysData1: TSZRSysData;
    Item_Pre_Recebimento1IPR_CODIGO: TIntegerField;
    Item_Pre_Recebimento1CNC_CODIGO: TIntegerField;
    Item_Pre_Recebimento1PRD_CODIGO: TIntegerField;
    Item_Pre_Recebimento1PRC_CODIGO: TIntegerField;
    Item_Pre_Recebimento1IPR_QUANTIDADE: TFloatField;
    Item_Pre_Recebimento1IPR_SITUACAO: TIntegerField;
    Item_Pre_Recebimento1PRC_DATA: TDateTimeField;
    Item_Pre_Recebimento1PRC_TIPO: TIntegerField;
    Item_Pre_Recebimento1PRC_CNC_ORIGEM: TIntegerField;
    Item_Pre_Recebimento1PRC_DATA_SAIDA: TDateTimeField;
    Item_Pre_Recebimento1PRC_DATA_EMISSAO: TDateTimeField;
    Item_Pre_Recebimento1PRC_NUM_DOC: TStringField;
    SZRDBText1: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel17: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText10: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRLabel15: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    Item_Pre_Recebimento1NumDoc: TStringField;
    Item_Pre_Recebimento1PRC_OBSERVACAO: TStringField;
    Item_Pre_Recebimento1Produto: TStringField;
    Item_Pre_Recebimento1Referencia: TStringField;
    Item_Pre_Recebimento1Marca: TStringField;
    Item_Pre_Recebimento1Unidade: TStringField;
    Item_Pre_Recebimento1rec_data: TStringField;
    Recebimento1: TRecebimento;
    Recebimento1CNC_CODIGO: TIntegerField;
    Recebimento1REC_CODIGO: TIntegerField;
    Recebimento1REC_DATA: TDateTimeField;
    Recebimento1REC_OBSERVACAO: TStringField;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel20: TSZRLabel;
    Item_Recebimento1: TItem_Recebimento;
    Item_Recebimento1IRC_QUANTIDADE: TFloatField;
    SZRDBText2: TSZRDBText;
    SZRLabel8: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlDescNota: TSZRLabel;
    SZRDBText3: TSZRDBText;
    Item_Pre_Recebimento1IPR_TIPO: TIntegerField;
    Item_Pre_Recebimento1FOR_CODIGO: TIntegerField;
    Item_Pre_Recebimento1PRC_SITUACAO: TIntegerField;
    Item_Pre_Recebimento1PRC_TOT_ITEM: TIntegerField;
    Item_Pre_Recebimento1PRC_COD_ORIGEM: TIntegerField;
    Item_Pre_Recebimento1PRC_NOTA_FISCAL: TIntegerField;
    SZRLabel10: TSZRLabel;
    zrlSubTotalPrc: TSZRLabel;
    zrlSubTotalRec: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel21: TSZRLabel;
    SZRDBText6: TSZRDBText;
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Item_Pre_Recebimento1CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapeGrupoPRCBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vSubTotalPRC, vSubTotalREC: double;
  public
    Entidade: TItem_Pre_Recebimento;
  end;

var
  rpt_PreRecRec: Trpt_PreRecRec;

implementation

uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_PreRecRec.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_PreRecRec.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vSubTotalPRC := vSubTotalPRC + Arredonda(Entidade.Quantidade);
  item_recebimento1.Close;
  item_recebimento1.ParamByName('CNC_CODIGO').asInteger:=Recebimento1.CodigoCNC;
  item_recebimento1.ParamByName('REC_CODIGO').asInteger:=Recebimento1.CodigoREC;
  item_recebimento1.ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
  item_recebimento1.Open;
  if item_recebimento1.IsEmpty then
    SZRLabel20.Caption := '-'
  else
  Begin
    vSubTotalREC := vSubTotalREC + Arredonda(item_recebimento1.Quantidade);
    SZRLabel20.Caption := format('%.2f',[item_recebimento1.Quantidade]);
  end;
end;

procedure Trpt_PreRecRec.Item_Pre_Recebimento1CalcFields(
  DataSet: TDataSet);
var
  Tipo:string;
begin
  if Entidade.FieldByName('PRC_TIPO').asInteger = 0 then
    Tipo:='TRC'
  else if Entidade.FieldByName('PRC_TIPO').asInteger = 1 then
    Tipo:='ABS'
  else if Entidade.FieldByName('PRC_TIPO').asInteger = 2 then
    Tipo:='COM';
  Entidade.FieldByName('NumDoc').AsString := Tipo+Entidade.FieldByName('PRC_CODIGO').
  AsString+'/'+Entidade.FieldByName('CNC_CODIGO').asString+'-'+FormatDateTime('dd.mm.yyyy',
  Entidade.FieldByName('PRC_DATA').asDateTime);

  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
  Produto1.Open;
  Entidade.FieldByName('Produto').asString:=Produto1.Descricao;
  Entidade.FieldByName('Referencia').asString:=Produto1.Referencia;
  Entidade.FieldByName('Marca').asString:=Produto1.Marca;
  Entidade.FieldByName('Unidade').asString:=Produto1.Unidade;

end;

procedure Trpt_PreRecRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  item_recebimento1.Close;
  Entidade.Close;
  Produto1.Close;
  CentroCusto1.Close;
  Action:=cafree;
end;

procedure Trpt_PreRecRec.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vSubTotalPRC := 0;
  vSubTotalREC := 0;

  Recebimento1.Close;
  Recebimento1.ParamByName('CNC_CODIGO').asInteger:=Entidade.FieldByName('CNC_CODIGO').asInteger;
  Recebimento1.ParamByName('REC_TIPO').asInteger:=Entidade.FieldByName('PRC_TIPO').asInteger;
  Recebimento1.ParamByName('REC_CNC_ORIGEM').asInteger:=Entidade.FieldByName('PRC_CNC_ORIGEM').asInteger;
  Recebimento1.ParamByName('REC_COD_ORIGEM').asInteger:=Entidade.FieldByName('PRC_COD_ORIGEM').asInteger;
  Recebimento1.Open;
  if Recebimento1.CodigoREC > 0 then
    SZRLabel25.Caption := IntToStr(Recebimento1.CodigoREC)
  else
    SZRLabel25.Caption := '';
  if Recebimento1.Data > 0 then
    SZRLabel26.Caption := formatDateTime('dd/mm/yyyy',Recebimento1.Data)
  else
    SZRLabel26.Caption := '';
  SZRLabel27.Caption := Recebimento1.OBS;

  with CentroCusto1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.FieldByName('PRC_CNC_ORIGEM').asInteger) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByName('PRC_CNC_ORIGEM').asInteger;
      Open;
    end;
    SZRLabel23.Caption := RazaoSocial;

    if (not Active) or
       (CodigoCNC <> Entidade.CodigoCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
    end;
    SZRLabel24.Caption := RazaoSocial;
  end;
end;

procedure Trpt_PreRecRec.SZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_PreRecRec.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pre_Recebimento1;
end;

procedure Trpt_PreRecRec.zrbRodapeGrupoPRCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSubTotalPrc.Caption := format('%.2f',[vSubTotalPRC]);
  zrlSubTotalRec.Caption := format('%.2f',[vSubTotalREC]);
end;

end.
