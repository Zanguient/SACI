unit UProdSecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto;

type
  Trpt_prodSecao = class(TForm)
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
    Produto1: TProduto;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRDBText9: TSZRDBText;
    ZRGroup1: TSZRGroup;
    ZRBand4: TSZRBand;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRLabel18: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRFrameLine1: TSZRFrameLine;
    ZRLabel12: TSZRLabel;
    ZRDBText5: TSZRDBText;
    ZRDBText7: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel12BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_prodSecao: Trpt_prodSecao;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_prodSecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Produto1.Active:=false;
end;

procedure Trpt_prodSecao.FormCreate(Sender: TObject);
begin
 Produto1.Active:=true;
end;

procedure Trpt_prodSecao.ZRLabel12BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel12.Caption:=  Format('%.2f',[Produto1.FieldbyName('PRD_PRECO_VENDA').AsFloat]);
end;

end.
