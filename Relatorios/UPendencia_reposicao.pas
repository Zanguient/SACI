
unit UPendencia_reposicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, SolicitPecRep,
  Produto, Fornecedor, CentroCusto, funcoes;

type
  Trpt_pendencia_reposicao = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Produto1: TProduto;
    SolicitPecRep1: TSolicitPecRep;
    ZRLabel6: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRBand1: TSZRBand;
    SZRLabel4: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRLabel1: TSZRLabel;
    zrlProduto: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlReferencia: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel8: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlFornecedor: TSZRLabel;
    Fornecedor1: TFornecedor;
    SZRDBText5: TSZRDBText;
    SZRLabel10: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade : TSolicitPecRep;
  end;

var
  rpt_pendencia_reposicao: Trpt_pendencia_reposicao;

implementation
uses
 UDM;

{$R *.DFM}


procedure Trpt_pendencia_reposicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SolicitPecRep1.Active:=false;
  Produto1.Active:=false;
  Action:=cafree;
end;

procedure Trpt_pendencia_reposicao.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_pendencia_reposicao.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;


procedure Trpt_pendencia_reposicao.FormCreate(Sender: TObject);
begin
  Entidade := SolicitPecRep1;
end;

procedure Trpt_pendencia_reposicao.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  try
    CentroCusto1.Close;
    CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
    CentroCusto1.Open;
    SZRLabel3.caption := CentroCusto1.RazaoSocial;
  except
    SZRLabel3.caption :='';   
  end;
end;

procedure Trpt_pendencia_reposicao.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
    if Entidade.Produto <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.Produto;
      Open;
    end;
    zrlProduto.Caption := '('+IntToStr(CodigoPRD)+') '+ Descricao+' '+Marca;
    zrlReferencia.Caption := Referencia;
  end;

  with Fornecedor1 do
  Begin
    if Entidade.Fornecedor <> CodigoFOR then
    Begin
      Close;
      ParamByName('FOR_CODIGO').asInteger := Entidade.Fornecedor;
      Open;
    end;
    zrlFornecedor.Caption := RazaoSocial;
  end;
end;

procedure Trpt_pendencia_reposicao.zrbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.





