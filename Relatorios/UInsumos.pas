unit UInsumos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, funcoes,
   Modulo, Submodulo, Insumos, SubGrupo, Grupo, Produto;

type
  Trpt_Insumos = class(TForm)
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
    ZRDBText2: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRDBText6: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrProduto: TSZRGroup;
    SZRLabel2: TSZRLabel;
    zrlProduto: TSZRLabel;
    Insumos1: TInsumos;
    zrlINS_Produto: TSZRLabel;
    Produto1: TProduto;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlProdutoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlINS_ProdutoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Insumos: Trpt_Insumos;
  entidade:TInsumos;

implementation
Uses
  UDM;

{$R *.DFM}

procedure Trpt_Insumos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Insumos1.Active:=false;
end;

procedure Trpt_Insumos.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Insumos.ZRLabel1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Insumos.zrlProdutoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  With Produto1 do
  begin
    Close;
    sql.Text:='SELECT * FROM PRODUTO WHERE PRD_CODIGO ='+inttostr(Entidade.CodigoPRD);
    Open;
  end;
  zrlProduto.Caption:=Produto1.Descricao;
end;

procedure Trpt_Insumos.zrlINS_ProdutoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  With Produto1 do
  begin
    Close;
    sql.Text:='SELECT * FROM PRODUTO WHERE PRD_CODIGO ='+inttostr(Entidade.INS_CodigoPRD);
    Open;
  end;
  zrlINS_Produto.Caption:=Produto1.Descricao;
end;

procedure Trpt_Insumos.FormCreate(Sender: TObject);
begin
   entidade:=Insumos1;
end;

procedure Trpt_Insumos.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
