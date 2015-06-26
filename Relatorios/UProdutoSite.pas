unit UProdutoSite;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  funcoes;

type
  Trpt_ProdutoSite = class(TForm)
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
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRGroup2: TSZRGroup;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_ProdutoSite: Trpt_ProdutoSite;

implementation
uses
 UDM, UOp_RelatProd;

{$R *.DFM}

procedure Trpt_ProdutoSite.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Active:=false;
  Action:=cafree;
end;

procedure Trpt_ProdutoSite.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ProdutoSite.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Grupo1.Close;
  Grupo1.ParamByName('GRP_CODIGO').asInteger:=Produto1.CodigoGRP;
  Grupo1.Open;
  SZRLabel3.Caption := Grupo1.Descricao;
end;

procedure Trpt_ProdutoSite.SZRGroup2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SubGrupo1.Close;
  SubGrupo1.ParamByName('SGP_CODIGO').asInteger:=Produto1.CodigoSGP;
  SubGrupo1.Open;
  SZRLabel5.Caption := SubGrupo1.Descricao;
end;

procedure Trpt_ProdutoSite.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_ProdutoSite.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

end.
