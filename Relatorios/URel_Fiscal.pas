unit URel_Fiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Produto,
  Mov_Est_Fiscal, Movimento_Estoque_Comercial;

type
  Trpt_fiscal = class(TForm)
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
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    DataSource1: TDataSource;
    Produto1PRD_DESCRICAO: TStringField;
    Produto1PRD_MARCA: TStringField;
    Produto1PRD_REFERENCIA: TStringField;
    Produto1PRD_UNIDADE: TStringField;
    Mov_Est_Fiscal1: TMov_Est_Fiscal;
    Movimento_Estoque_Comercial1: TMovimento_Estoque_Comercial;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRDBText8: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRDBText10: TSZRDBText;
    ZRDBText11: TSZRDBText;
    ZRDBText12: TSZRDBText;
    Produto1MEC_ENTRADA: TFloatField;
    Produto1MES_ENTRADA: TFloatField;
    Produto1MEC_SAIDA: TFloatField;
    Produto1MES_SAIDA: TFloatField;
    Produto1MEC_SALDO: TFloatField;
    Produto1MES_SALDO: TFloatField;
    Produto1MEC_SALDO_ANT: TFloatField;
    Produto1MES_SALDO_ANT: TFloatField;
    Produto1PRD_CODIGO: TIntegerField;
    Produto1CNC_CODIGO: TIntegerField;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Produto1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_fiscal: Trpt_fiscal;

implementation

{$R *.DFM}

procedure Trpt_fiscal.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Produto1.Next;
end;

procedure Trpt_fiscal.Produto1CalcFields(DataSet: TDataSet);
var
 mec_entra, mec_sai, mes_entra, mes_sai: real;
begin
  mec_entra    := 0;
  mec_sai      := 0;
  mes_entra    := 0;
  mes_sai      := 0;
  Movimento_Estoque_Comercial1.First;
  Mov_Est_Fiscal1.First;
  Produto1.FieldByName('MEC_SALDO_ANT').AsFloat :=
  Movimento_Estoque_Comercial1.FieldByName('MEC_SALDO_ANT').AsFloat;
  Produto1.FieldByName('MES_SALDO_ANT').AsFloat :=
  Mov_Est_Fiscal1.FieldByName('MES_SALDO_ANT').AsFloat;
  while not(Movimento_Estoque_Comercial1.EOF) do
     begin
       if (Movimento_Estoque_Comercial1.FieldByName('MEC_ES').AsInteger = 1) then
          mec_entra := mec_entra + Movimento_Estoque_Comercial1.FieldByName('MEC_QUANTIDADE').AsFloat
        else
          mec_sai := mec_sai + Movimento_Estoque_Comercial1.FieldByName('MEC_QUANTIDADE').AsFloat;
      Movimento_Estoque_Comercial1.Next;
     end;
    while not(Mov_Est_Fiscal1.EOF) do
     begin
        if (Mov_Est_Fiscal1.FieldByName('MES_ES').AsInteger = 1) then
          mes_entra := mes_entra + Mov_Est_Fiscal1.FieldByName('MES_QUANTIDADE').AsFloat
        else
          mes_sai := mes_sai + Mov_Est_Fiscal1.FieldByName('MES_QUANTIDADE').AsFloat;
     Mov_Est_Fiscal1.Next;
    end;
  Produto1.FieldByName('MEC_SALDO').AsFloat   :=
  Produto1.FieldByName('MEC_SALDO_ANT').AsFloat + (mec_entra - mec_sai);
 Produto1.FieldByName('MES_SALDO').AsFloat :=
 Produto1.FieldByName('MES_SALDO_ANT').AsFloat + (mes_entra - mes_sai);;
 Produto1.FieldByName('MES_ENTRADA').AsFloat := mes_entra;
 Produto1.FieldByName('MES_SAIDA').AsFloat   := mes_sai;
 Produto1.FieldByName('MEC_ENTRADA').AsFloat := mec_entra;
 Produto1.FieldByName('MEC_SAIDA').AsFloat   := mec_sai;
end;

procedure Trpt_fiscal.FormCreate(Sender: TObject);
begin
 Produto1.Active                        := true;
 Movimento_Estoque_Comercial1.Active    := true;
 Mov_Est_Fiscal1.Active                 := true;
end;

end.
