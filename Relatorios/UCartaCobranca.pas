unit UCartaCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Pedido_de_Venda, Titulo_receber, funcoes;

type
  Trpt_EnviaCobrador = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRBand4: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRSysData1: TSZRSysData;
    SZRSubDetailBand1: TSZRSubDetailBand;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText3: TSZRDBText;
    ZRBand2: TSZRBand;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRDBText9: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRDBText12: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRDBText14: TSZRDBText;
    SZRLabel14: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRGroup2: TSZRGroup;
    SZRLabel1: TSZRLabel;
    SZRDBText15: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel19: TSZRLabel;
    RodapeGrupo: TSZRBand;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText16: TSZRDBText;
    SZRLabel23: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRDBText13: TSZRDBText;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRDBText17: TSZRDBText;
    SZRLabel18: TSZRLabel;
    SZRDBText18: TSZRDBText;
    zrlEndereco: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRDBText11: TSZRDBText;
    SZRLabel26: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRDBText19: TSZRDBText;
    SZRLabel28: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel35: TSZRLabel;
    SZRLabel37: TSZRLabel;
    SZRDBText21: TSZRDBText;
    Pedido_de_Venda1: TPedido_de_Venda;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRDBText22: TSZRDBText;
    SZRLabel36: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRDBText23: TSZRDBText;
    SZRDBText24: TSZRDBText;
    SZRLabel43: TSZRLabel;
    SZRLabel44: TSZRLabel;
    SZRDBText25: TSZRDBText;
    SZRLabel45: TSZRLabel;
    SZRDBText26: TSZRDBText;
    SZRDBText27: TSZRDBText;
    SZRLabel46: TSZRLabel;
    SZRLabel47: TSZRLabel;
    zrlReferencias: TSZRLabel;
    SZRDBText20: TSZRDBText;
    zrlFiltros: TSZRLabel;
    SZRLabel48: TSZRLabel;
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
{    procedure SZRSubDetailBand1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRGroup2AfterPrint(Sender: TObject; Printed: Boolean);}
  private
    { Private declarations }
  public
    { Public declarations }
    UltPedido:Integer;
  end;

var
  rpt_EnviaCobrador: Trpt_EnviaCobrador;
  Imprimir:Boolean;

implementation

uses UDM, MxCobCobrador;

{$R *.DFM}

procedure Trpt_EnviaCobrador.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=Dm.Configuracao1.LojaNome;
end;

procedure Trpt_EnviaCobrador.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=Dm.Configuracao1.LojaNome;
end;

procedure Trpt_EnviaCobrador.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  ValorComJuros:Double;
begin
  ValorComJuros := Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat+
    Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat*
    (DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
    Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsDateTime)/3000);
  SZRLabel5.Caption := Format('%.2f',[Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat]);
  if ValorComJuros >= Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat then
    SZRLabel6.Caption:=Format('%.2f',[ValorComJuros])
  else
    SZRLabel6.Caption:='-';
  if Titulo_receber1.FieldByName('TRC_DTORIGINAL').AsDateTime > 0 then
    SZRLabel41.Caption := FormatDateTime('dd/mm/yyyy',Titulo_receber1.FieldByName('TRC_DTORIGINAL').AsDateTime);
  if Titulo_receber1.FieldByName('TRC_RGB_DT_PROMESSA').asDateTime > 0 then
    SZRLabel36.Caption:=formatDateTime('dd/mm/yyyy',Titulo_receber1.FieldByName('TRC_RGB_DT_PROMESSA').asDateTime)
  else
    SZRLabel36.Caption:='__/__/____';
end;

procedure Trpt_EnviaCobrador.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlEndereco.Caption := Trim(DM.SelecionaParametro(Titulo_receber1.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                         Titulo_receber1.FieldByName('CLI_ENDERECO').asString);

  with Titulo_receber1 do
  Begin
    zrlReferencias.Caption := Trim(FieldByName('CLI_REFERENCIA1').asString);
    if zrlReferencias.Caption <> '' then
      zrlReferencias.Caption := zrlReferencias.Caption + ' / ';
    zrlReferencias.Caption := zrlReferencias.Caption + Trim(FieldByName('CLI_REFERENCIA2').asString);
    if zrlReferencias.Caption <> '' then
      zrlReferencias.Caption := zrlReferencias.Caption + ' / ';
    zrlReferencias.Caption := zrlReferencias.Caption + Trim(FieldByName('CLI_REFERENCIA3').asString);
  end;
end;

procedure Trpt_EnviaCobrador.SZRGroup2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Pedido_de_Venda1 do
  Begin
    if (CodigoCNC <> Titulo_receber1.CodigoCNC) or
       (CodigoPDV <> Titulo_receber1.CodigoPDV) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asinteger := Titulo_receber1.CodigoCNC;
      ParamByName('PDV_CODIGO').asInteger := Titulo_receber1.CodigoPDV;
      Open;
    end;
    if not IsEmpty then
    Begin
      SZRLabel38.Caption:='Data/Hora:';
      SZRLabel39.Caption:=FormatDateTime('dd/mm/yyyy hh:mm', DataHora);
    end
    else
    Begin
      SZRLabel38.Caption:='';
      SZRLabel39.Caption:='';
    end;
  end;
end;

procedure Trpt_EnviaCobrador.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
