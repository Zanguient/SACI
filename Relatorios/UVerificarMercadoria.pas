unit UVerificarMercadoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Verificar_Mercadoria;

type
  Trpt_VerificarMercadoria = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
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
    zrlDescReferencia: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRDBText1: TSZRDBText;
    zdbReferencia: TSZRDBText;
    ZRDBText5: TSZRDBText;
    zrlDescDetalhe: TSZRLabel;
    zdbDetalhe: TSZRDBText;
    zrlQuantidade: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlDescMarca: TSZRLabel;
    zdbMarca: TSZRDBText;
    zrbGrupo: TSZRGroup;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlGrupo: TSZRLabel;
    Grupo1: TGrupo;
    zrbSumario: TSZRBand;
    SZRLabel5: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlDescQtd: TSZRLabel;
    zrlTotalQtd: TSZRLabel;
    Verificar_Mercadoria1: TVerificar_Mercadoria;
    SZRLabel2: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vQtdTotal: Double;
    TotalRegistros : integer;
  public
    Entidade: TVerificar_Mercadoria;
  end;

var
  rpt_VerificarMercadoria: Trpt_VerificarMercadoria;

implementation
uses
 UDM, Funcoes, UOp_RelatProd;

{$R *.DFM}

procedure Trpt_VerificarMercadoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_VerificarMercadoria.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_VerificarMercadoria.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;

  if DM.Configuracao1.Empresa = empLuciano then
  Begin
    zrlDescReferencia.Left := 59;
    zdbReferencia.Left := 59;

    zrlDescDetalhe.Left := 77;
    zdbDetalhe.Left := 77;
  end;
end;

procedure Trpt_VerificarMercadoria.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbGrupo.Height = 0 then
    Exit;

  with Grupo1 do
  Begin
    if Entidade.FieldByName('GRP_CODIGO').asInteger <> CodigoGRP then
    Begin
      Close;
      ParamByName('GRP_CODIGO').asInteger := Entidade.FieldByName('GRP_CODIGO').asInteger;
      Open;
    end;
    zrlGrupo.Caption := Descricao;
  end;
end;

procedure Trpt_VerificarMercadoria.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalQtd.Caption := Format('%.2f',[vQtdTotal]);
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_VerificarMercadoria.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  inc(TotalRegistros);
  vQtdTotal := vQtdTotal + Entidade.Quantidade;
  zrlQuantidade.Caption:=  Format('%.2f',[Entidade.Quantidade]);
  zrlProduto.Caption := Trim(Entidade.FieldByName('PRD_DESCRICAO').asString) + ' ' + Trim(Entidade.FieldByName('PRD_CARACTERISTICA').asString);
end;

procedure Trpt_VerificarMercadoria.FormCreate(Sender: TObject);
begin
  Entidade := Verificar_Mercadoria1;
  TotalRegistros := 0;
  vQtdTotal := 0;
end;

procedure Trpt_VerificarMercadoria.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

end.
