unit UTabelaDescontos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, 
  Descontos;

type
  Trpt_TabelaDescontos = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
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
    zrlDescDescontoGerencia: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRDBText9: TSZRDBText;
    zrlDescontoGerencia: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel5: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlDescDesconto60: TSZRLabel;
    Descontos1: TDescontos;
    zrlDesconto60: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlProduto: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros : integer;
  public
    Entidade: TDescontos;
  end;

var
  rpt_TabelaDescontos: Trpt_TabelaDescontos;

implementation
uses
 UDM, Funcoes, UOp_RelatProd;

{$R *.DFM}

procedure Trpt_TabelaDescontos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_TabelaDescontos.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_TabelaDescontos.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_TabelaDescontos.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlDesconto60.Caption := format('%.2f',[Entidade.Desconto60]);
  zrlDescontoGerencia.Caption := format('%.2f',[Entidade.DescontoGerente]);
  if Entidade.CodigoPRD > 0 then
    zrlProduto.Caption := '('+IntToStr(Entidade.CodigoPRD)+')'+Entidade.FieldByName('PRD_REFERENCIA').asString
  else
    zrlProduto.Caption := '';
  inc(TotalRegistros);
end;

procedure Trpt_TabelaDescontos.FormCreate(Sender: TObject);
begin
  Entidade := Descontos1;
  TotalRegistros := 0;
end;

procedure Trpt_TabelaDescontos.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  zrLabel4.Caption := EmpresaDesenvolvedora;  
end;

end.
