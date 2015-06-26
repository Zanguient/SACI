unit UOrcamentoPrevisto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZRCtrls, ZReport, DB, DBTables;

type
  Trpt_OrcamentoPrevisto = class(TForm)
    report: TSZReport;
    zrb_detalhe: TSZRBand;
    zrbGrupoPDV: TSZRGroup;
    SZRBand2: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRSysData3: TSZRSysData;
    SZRBand3: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel10: TSZRLabel;
    SZRDBText8: TSZRDBText;
    SZRLabel11: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRLabel13: TSZRLabel;
    SZRDBText10: TSZRDBText;
    SZRLabel15: TSZRLabel;
    SZRDBText11: TSZRDBText;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRDBText12: TSZRDBText;
    SZRDBText13: TSZRDBText;
    SZRDBText14: TSZRDBText;
    qrOrcamento: TQuery;
    SZRDBText15: TSZRDBText;
    szrlDescricao: TSZRLabel;
    qConsultaItem: TQuery;
    SZRLabel1: TSZRLabel;
    SZRLabel3: TSZRLabel;
    qrOrcamentoORC_CODIGO: TIntegerField;
    qrOrcamentoCNC_CENTRO_ORCADO: TIntegerField;
    qrOrcamentoCNC_RZ_SOCIAL: TStringField;
    qrOrcamentoORC_DESCRICAO: TStringField;
    qrOrcamentoORC_DT_CADASTRO: TDateTimeField;
    qrOrcamentoORC_DT_ALTERADO: TDateTimeField;
    qrOrcamentoORC_OBS: TStringField;
    qrOrcamentoORC_SITUACAO: TStringField;
    qrOrcamentoIOR_CODIGO: TIntegerField;
    qrOrcamentoIOR_ITEM: TIntegerField;
    qrOrcamentoIOR_TIPO_ITEM: TStringField;
    qrOrcamentoIOR_OBS: TStringField;
    procedure zrb_detalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoPDVBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_OrcamentoPrevisto: Trpt_OrcamentoPrevisto;

implementation

uses UDM;

{$R *.dfm}

function UltimoDiaMes(Data: string) : string;
{ retorna o ultimo dia o mes, de uma data fornecida}
var
  ano, mes, dia : word;
  DataTemp : TDateTime;
begin
  Decodedate(strtodate(Data), Ano, Mes, Dia);
  DataTemp := (strtodate(Data) - Dia) + 33;
  Decodedate(DataTemp, Ano, Mes, Dia);
  result := DateTimeToStr(DataTemp - Dia);
end;

procedure Trpt_OrcamentoPrevisto.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (qrOrcamentoIOR_TIPO_ITEM.AsString = 'PRODUTO') then
  begin
    with qConsultaItem do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT PRD_CODIGO, PRD_DESCRICAO FROM PRODUTO WHERE PRD_CODIGO='+
        qrOrcamentoIOR_ITEM.AsString;
      Open;
    end;

    if not (qConsultaItem.Eof) then
      szrlDescricao.Caption := qConsultaItem.Fields[1].AsString;
  end
  else
    if (qrOrcamentoIOR_TIPO_ITEM.AsString = 'CONTA DE CAIXA') then
    begin
      with qConsultaItem do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT CCX_CODIGO, CCX_DESCRICAO FROM CONTA_DE_CAIXA WHERE CCX_CODIGO='+
          qrOrcamentoIOR_ITEM.AsString;
        Open;
      end;

      if not (qConsultaItem.Eof) then
        szrlDescricao.Caption := qConsultaItem.Fields[1].AsString;
    end;
end;

procedure Trpt_OrcamentoPrevisto.zrbGrupoPDVBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  //SZRLabel1.Caption := '01/'+qrOrcamentoORC_MES_ANO.AsString;
  //SZRLabel3.Caption := UltimoDiaMes(SZRLabel1.Caption);
end;

end.
