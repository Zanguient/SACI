unit UComparativoForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Pedido_de_Venda,
  funcoes;

type
  Trpt_ComparativoForn = class(TForm)
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
    ZRDBText3: TSZRDBText;
    SZRGroup1: TSZRGroup;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRDBText1: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    Pedido_de_Venda1FOR_CODIGO: TIntegerField;
    Pedido_de_Venda1FOR_RZ_SOCIAL: TStringField;
    Pedido_de_Venda1GRP_CODIGO: TIntegerField;
    Pedido_de_Venda1GRP_DESCRICAO: TStringField;
    Pedido_de_Venda1FATUR: TFloatField;
    SZRDBText2: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText3: TSZRDBText;
    Pedido_de_Venda2: TPedido_de_Venda;
    zrlPercent: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_ComparativoForn: Trpt_ComparativoForn;

implementation
uses
  UDM;
{$R *.DFM}


procedure Trpt_ComparativoForn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Pedido_de_Venda1.Active:=false;
 Action :=cafree;
end;

procedure Trpt_ComparativoForn.FormCreate(Sender: TObject);
begin
 Pedido_de_Venda1.Active:=true;
end;

procedure Trpt_ComparativoForn.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ComparativoForn.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ComparativoForn.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlPercent.Caption := format('%.2f',[Pedido_de_Venda1.FieldByName('FATUR').asFloat*100/Pedido_de_Venda2.FieldByName('TOTAL').asFloat])+'%';
end;

procedure Trpt_ComparativoForn.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
