unit UQtdNormalVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo,
  SubGrupo, QuantidadeNormalVenda, Fornecedor, Produto, funcoes;

type
  Trpt_QtdNormalVenda = class(TForm)
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
    ZRDBText3: TSZRDBText;
    ZRLabel10: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    QuantidadeNormalVenda1: TQuantidadeNormalVenda;
    zrlFornecedor: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlProduto: TSZRLabel;
    QuantidadeNormalVenda1CNC_CODIGO: TIntegerField;
    QuantidadeNormalVenda1QNV_CODIGO: TIntegerField;
    QuantidadeNormalVenda1USU_CODIGO: TIntegerField;
    QuantidadeNormalVenda1FOR_CODIGO: TIntegerField;
    QuantidadeNormalVenda1GRP_CODIGO: TIntegerField;
    QuantidadeNormalVenda1SGP_CODIGO: TIntegerField;
    QuantidadeNormalVenda1PRD_CODIGO: TIntegerField;
    QuantidadeNormalVenda1QNV_DT_CADASTRO: TDateTimeField;
    QuantidadeNormalVenda1QNV_DT_ALTERADO: TDateTimeField;
    QuantidadeNormalVenda1QNV_QUANTIDADE: TFloatField;
    QuantidadeNormalVenda1QNV_SITUACAO: TIntegerField;
    QuantidadeNormalVenda1QNV_OBSERVACAO: TStringField;
    Produto1: TProduto;
    Fornecedor1: TFornecedor;
    zrlUsuario: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade : TQuantidadeNormalVenda;
  end;

var
  rpt_QtdNormalVenda: Trpt_QtdNormalVenda;

implementation
uses
  UDM;

{$R *.DFM}



procedure Trpt_QtdNormalVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Fornecedor1.Close;
  Produto1.Close;
  Action := cafree;
end;

procedure Trpt_QtdNormalVenda.FormCreate(Sender: TObject);
begin
  Entidade := QuantidadeNormalVenda1;
end;

procedure Trpt_QtdNormalVenda.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_QtdNormalVenda.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_QtdNormalVenda.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Fornecedor1 do
  Begin
    if Entidade.CodigoFOR <> CodigoFOR then
    Begin
      Close;
      ParamByName('FOR_CODIGO').asInteger := Entidade.CodigoFOR;
      Open;
    end;
    zrlFornecedor.Caption := RazaoSocial;
  end;

{  with SubGrupo1 do
  Begin
    if Entidade.CodigoSGP <> CodigoSGP then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Entidade.CodigoSGP;
      Open;
    end;
    zrlSubGrupo.Caption := Descricao;
  end;

  with Grupo1 do
  Begin
    if Entidade.CodigoGRP <> CodigoGRP then
    Begin
      Close;
      ParamByName('GRP_CODIGO').asInteger := Entidade.CodigoGRP;
      Open;
    end;
    zrlGrupo.Caption := Descricao;
  end;
}
  with Produto1 do
  Begin
    if Entidade.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    zrlProduto.Caption := Descricao + ' ' + Referencia;
  end;
end;

procedure Trpt_QtdNormalVenda.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

end.
