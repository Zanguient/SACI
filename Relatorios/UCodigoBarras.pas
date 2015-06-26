unit UCodigoBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, SQuery, Funcionario,
  QRExport, Item_de_Cota, Cod_Barr, Produto;

type
  Trpt_CodigoBarras = class(TForm)
    report: TQuickRep;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    qrsLinhaHorizontalRodape: TQRShape;
    qrsNumeroPagina: TQRSysData;
    QRGroup1: TQRGroup;
    Codigo_Barras1: TCodigo_Barras;
    DSCodigoBarras: TDataSource;
    QRLabel2: TQRLabel;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    qrsDataHoraImpressao: TQRSysData;
    qrsLinhaHorizontalCabecalho1: TQRShape;
    Produto1: TProduto;
    qrlNomeCentroDeCusto: TQRLabel;
    qrlNomeLoja: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    zrlProduto: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    zrlReferencia: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Entidade : TCodigo_Barras;
  end;

var
  rpt_CodigoBarras: Trpt_CodigoBarras;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_CodigoBarras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  entidade.Close;
  Action := caFree;
end;

procedure Trpt_CodigoBarras.FormCreate(Sender: TObject);
begin
  Entidade := Codigo_Barras1;
end;

procedure Trpt_CodigoBarras.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoCDB_Entrada;
    Open;
    zrlProduto.Caption := Descricao + '('+IntToStr(CodigoPRD)+')';
    zrlReferencia.Caption := Referencia;
  end;
end;

procedure Trpt_CodigoBarras.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNomeLoja.Caption:=DM.Configuracao1.LojaNome;
  qrlNomeCentroDeCusto.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_CodigoBarras.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel1.Caption   := EmpresaDesenvolvedora;
end;

end.
