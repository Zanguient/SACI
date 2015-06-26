unit UFactoring;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo,
  Agencia, Banco, Cheque, Item_de_Factoring;

type
  Trpt_Factoring = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText3: TSZRDBText;
    Cheque1: TCheque;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel2: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRDBText1: TSZRDBText;
    Cheque1CHQ_CODIGO: TIntegerField;
    Cheque1CNC_CODIGO: TIntegerField;
    Cheque1CHQ_NUMERO: TStringField;
    Cheque1CHQ_VALOR: TFloatField;
    Cheque1CHQ_DATA: TDateTimeField;
    Cheque1CHQ_ER: TStringField;
    Cheque1CHQ_SITUACAO: TIntegerField;
    Cheque1CBN_NUMERO: TIntegerField;
    Cheque1CHQ_OBSERVACAO: TStringField;
    Cheque1CHQ_CNC_TITULO: TIntegerField;
    Cheque1BNC_NUMERO: TIntegerField;
    Cheque1AGN_NUMERO: TIntegerField;
    Cheque1CHQ_COD_TITULO: TIntegerField;
    Cheque1CHQ_TERCEIRO: TIntegerField;
    Cheque1USU_CODIGO: TIntegerField;
    Cheque1CHQ_DT_ALTERADO: TDateTimeField;
    Cheque1CHQ_DT_CADASTRO: TDateTimeField;
    Cheque1CHQ_NOMINAL: TStringField;
    Cheque1CHQ_DONO_CHEQUE: TStringField;
    Cheque1CHQ_COMP: TIntegerField;
    Cheque1CHQ_BANCO: TIntegerField;
    Cheque1CHQ_AGENCIA: TIntegerField;
    Cheque1CHQ_C1: TIntegerField;
    Cheque1CHQ_CONTA: TIntegerField;
    Cheque1CHQ_C2: TIntegerField;
    Cheque1CHQ_C3: TIntegerField;
    Cheque1CHQ_CODIGO_BARRAS: TStringField;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlTotal: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlEmitente: TSZRLabel;
    Cheque1CHQ_ENVIADO: TIntegerField;
    Cheque1CHQ_DT_ENVIADO: TDateTimeField;
    Cheque1CHQ_UTILIZADO: TIntegerField;
    Cheque1CNC_CLIENTE: TIntegerField;
    Cheque1CLI_CODIGO: TIntegerField;
    Cheque1CNC_FACTORING: TIntegerField;
    Cheque1FCT_CODIGO: TIntegerField;
    Cliente1: TCliente;
    SZRDBText2: TSZRDBText;
    zrbGrupoFactoring: TSZRGroup;
    SZRLabel10: TSZRLabel;
    SZRDBText6: TSZRDBText;
    Item_de_Factoring1: TItem_de_Factoring;
    SZRLabel11: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel12: TSZRLabel;
    SZRDBText8: TSZRDBText;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel14: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRLabel18: TSZRLabel;
    SZRDBText10: TSZRDBText;
    SZRLabel19: TSZRLabel;
    SZRDBText11: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel10: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlSubTotal: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrlLinhaFinal: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel22: TSZRLabel;
    SZRDBText13: TSZRDBText;
    Item_de_Factoring1CNC_CODIGO: TIntegerField;
    Item_de_Factoring1FCT_CODIGO: TIntegerField;
    Item_de_Factoring1CNC_ORIGEM: TIntegerField;
    Item_de_Factoring1USU_CODIGO: TIntegerField;
    Item_de_Factoring1CNC_CLIENTE: TIntegerField;
    Item_de_Factoring1CLI_CODIGO: TIntegerField;
    Item_de_Factoring1FCT_DT_CADASTRO: TDateTimeField;
    Item_de_Factoring1FCT_DT_ALTERADO: TDateTimeField;
    Item_de_Factoring1FCT_QUANTIDADE_CHEQUES: TIntegerField;
    Item_de_Factoring1FCT_TOTAL_ENVIADO: TFloatField;
    Item_de_Factoring1FCT_JUROS: TFloatField;
    Item_de_Factoring1FCT_TOTAL_RECEBIDO: TFloatField;
    Item_de_Factoring1FCT_SITUACAO: TIntegerField;
    Item_de_Factoring1FCT_OBSERVACAO: TStringField;
    Item_de_Factoring1FCT_MAQUINA: TIntegerField;
    Item_de_Factoring1FCT_OUTRAS_TAXAS: TFloatField;
    Item_de_Factoring1CNC_CODIGO_1: TIntegerField;
    Item_de_Factoring1IFC_CODIGO: TIntegerField;
    Item_de_Factoring1FCT_CODIGO_1: TIntegerField;
    Item_de_Factoring1CNC_ORIGEM_1: TIntegerField;
    Item_de_Factoring1USU_CODIGO_1: TIntegerField;
    Item_de_Factoring1CNC_CHEQUE: TIntegerField;
    Item_de_Factoring1IFC_AGENCIA_NUMERO: TStringField;
    Item_de_Factoring1IFC_DT_CADASTRO: TDateTimeField;
    Item_de_Factoring1IFC_DT_ALTERADO: TDateTimeField;
    Item_de_Factoring1IFC_VALOR: TFloatField;
    Item_de_Factoring1IFC_SITUACAO: TIntegerField;
    Item_de_Factoring1IFC_OBSERVACAO: TStringField;
    Item_de_Factoring1CHQ_CODIGO: TIntegerField;
    zrlJuros: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlOutrasTaxas: TSZRLabel;
    SZRLabel25: TSZRLabel;
    zrlSaldo: TSZRLabel;
    SZRLabel27: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoFactoringBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vTotal, vSubTotal: Double;
    TotalRegistros : integer;
  public
    Entidade:TItem_de_Factoring;
    { Public declarations }
  end;

var
  rpt_Factoring: Trpt_Factoring;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_Factoring.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Factoring1;
  TotalRegistros := 0;
  vTotal    := 0;
  vSubTotal := 0;
end;

procedure Trpt_Factoring.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_Factoring.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Factoring.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Factoring.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  inc(TotalRegistros);

  with Cheque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByName('CNC_CHEQUE').asInteger;
    ParamByName('CHQ_CODIGO').asInteger := Entidade.FieldByName('CHQ_CODIGO').asInteger;
    Open;
  end;

  if Trim(Cheque1.DonoCheque) <> '' then
    zrlEmitente.Caption := Cheque1.DonoCheque+'('+PreencheZero(2,Cheque1.ClienteCNC)+'-'+IntToStr(Cheque1.CodigoCLI)+')'
  else
  Begin
    with Cliente1 do
    Begin
      if (not Active) or
         (CodigoCNC <> Cheque1.ClienteCNC) or
         (CodigoCLI <> Cheque1.CodigoCLI) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Cheque1.ClienteCNC;
        ParamByName('CLI_CODIGO').asInteger := Cheque1.CodigoCLI;
        Open;
      end;
      zrlEmitente.Caption := RazaoSocial+'('+PreencheZero(2,Cheque1.ClienteCNC)+'-'+IntToStr(Cheque1.CodigoCLI)+')';
    end;
  end;
  vSubTotal := vSubTotal + Arredonda(Cheque1.Valor);
  vTotal := vTotal + Arredonda(Cheque1.Valor);
end;

procedure Trpt_Factoring.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
  zrlTotal.Caption := format('%.2f',[vTotal]);
end;

procedure Trpt_Factoring.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

procedure Trpt_Factoring.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSubTotal.Caption := format('%.2f',[vSubTotal]);
  zrlJuros.Caption       := format('%.2f',[StrToFloat(zrlSubTotal.Caption)*Item_de_Factoring1.FieldByName('FCT_JUROS').AsFloat/100]);
  zrlOutrasTaxas.Caption := format('%.2f',[Item_de_Factoring1.FieldByName('FCT_OUTRAS_TAXAS').AsFloat]);
  zrlSaldo.Caption       := format('%.2f',[StrToFloat(zrlSubTotal.Caption)-StrToFloat(zrlJuros.Caption)-StrToFloat(zrlOutrasTaxas.Caption)]);
end;

procedure Trpt_Factoring.zrbGrupoFactoringBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vSubTotal := 0;
end;

end.
