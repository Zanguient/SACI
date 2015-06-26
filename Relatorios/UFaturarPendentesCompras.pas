unit UFaturarPendentesCompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Grupo,
  Pedido_de_Compra;

type
  Trpt_FaturarPendentesCompras = class(TForm)
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
    zrlFiltros: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    zrlTotal: TSZRLabel;
    zrbGrupoCLI: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    zrlFornecedor: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlTotalFornecedor: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlSumario: TSZRBand;
    SZRLabel5: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Pedido_de_Compra1: TPedido_de_Compra;
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
    vTotalGeral, vTotalFornecedor: Double;
  public
    Entidade: TPedido_de_Compra;
  end;

var
  rpt_FaturarPendentesCompras: Trpt_FaturarPendentesCompras;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_FaturarPendentesCompras.FormCreate(Sender: TObject);
begin
  vTotalGeral := 0;
  Entidade := Pedido_de_Compra1;
end;

procedure Trpt_FaturarPendentesCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_FaturarPendentesCompras.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FaturarPendentesCompras.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FaturarPendentesCompras.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

procedure Trpt_FaturarPendentesCompras.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Entidade do
  Begin
    zrlFornecedor.Caption := Trim(FieldByName('FOR_RZ_SOCIAL').asString)+' ('+FieldByName('FOR_CODIGO').asString+')';

    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT SUM(PCP_TOTAL_FINAL) AS TOTAL '+
        ' FROM PEDIDO_DE_COMPRA '+
        ' WHERE CNC_CODIGO='+Entidade.FieldByName('CNC_CODIGO').asString+
        ' AND PCP_CODIGO='+Entidade.FieldByName('PCP_CODIGO').asString;
      Open;
      zrlTotal.Caption := format('%.2f',[FieldByName('TOTAL').asFloat]);
      vTotalFornecedor := vTotalFornecedor + Arredonda(FieldByName('TOTAL').asFloat);
      vTotalGeral := vTotalGeral + Arredonda(FieldByName('TOTAL').asFloat);
    end;
  end;
end;

procedure Trpt_FaturarPendentesCompras.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalFornecedor.Caption := format('%.2f',[vTotalFornecedor]);
end;

procedure Trpt_FaturarPendentesCompras.zrbGrupoCLIBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vTotalFornecedor := 0;
end;

procedure Trpt_FaturarPendentesCompras.zrlSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGeral.Caption := format('%.2f',[vTotalGeral])
end;

end.
