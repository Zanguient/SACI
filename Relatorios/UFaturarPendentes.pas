unit UFaturarPendentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo,
  Pedido_de_Venda;

type
  Trpt_FaturarPendentes = class(TForm)
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
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRDBText3: TSZRDBText;
    zrlUsuario: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    zrlFiltros: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlTipoCliente: TSZRLabel;
    zrlTotal: TSZRLabel;
    zrbGrupoCLI: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    zrlCliente: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlTotalCliente: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlSumario: TSZRBand;
    SZRLabel5: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    SZRLabel7: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoCLIBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrlSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vTotalGeral, vTotalCliente: Double;
  public
    Entidade: TPedido_de_Venda;
  end;

var
  rpt_FaturarPendentes: Trpt_FaturarPendentes;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_FaturarPendentes.FormCreate(Sender: TObject);
begin
  vTotalGeral := 0;
  Entidade := Pedido_de_Venda1;
end;

procedure Trpt_FaturarPendentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_FaturarPendentes.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FaturarPendentes.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_FaturarPendentes.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

procedure Trpt_FaturarPendentes.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Entidade do
  Begin
    zrlCliente.Caption := Trim(FieldByName('CLI_RZ_SOCIAL').asString)+' ('+FieldByName('CLI_CODIGO').asString+')';

    if FieldByName('CLI_MENSAL').asInteger = 1 then
      zrlTipoCliente.Caption := 'MENSAL'
    else if FieldByName('CLI_QUINZENAL').asInteger = 1  then
      zrlTipoCliente.Caption := 'QUINZENAL'
    else
      zrlTipoCliente.Caption := 'SEMANAL';

    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT SUM((IPV_QUANTIDADE-IPV_BONIFICACAO)*IPV_PRECO_DESC) AS TOTAL '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+Entidade.FieldByName('CNC_CODIGO').asString+
        ' AND PDV_CODIGO='+Entidade.FieldByName('PDV_CODIGO').asString;
      Open;
      zrlTotal.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);
      vTotalCliente := vTotalCliente + Arredonda(FieldByName('TOTAL').asFloat);
      vTotalGeral := vTotalGeral + Arredonda(FieldByName('TOTAL').asFloat);
    end;
  end;
end;

procedure Trpt_FaturarPendentes.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalCliente.Caption := format('%.2f',[vTotalCliente]);
end;

procedure Trpt_FaturarPendentes.zrbGrupoCLIBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vTotalCliente := 0;
end;

procedure Trpt_FaturarPendentes.zrlSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGeral.Caption := format('%.2f',[vTotalGeral])
end;

end.
