unit uMovBonificacaoFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Usuario, CentroCusto,
  Parametro;

type
  Trpt_MovEstoqueBonificacaoFiscal = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRDBText9: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText1: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    Produto1: TQuery;
    SZRDBText5: TSZRDBText;
    zrlTipoMovimento: TSZRLabel;
    Parametro1: TParametro;
    SZRBand1: TSZRBand;
    SZRLabel12: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel18: TSZRLabel;
    zrlCodigo: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRGroup1: TSZRGroup;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRDBText6: TSZRDBText;
    zrlProduto: TSZRLabel;
    zrlSaldoAnt: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrbSumario: TSZRBand;
    zrlTotalQtd: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlUsuarioRodape: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    iTotalQtd: Double;
  public
    { Public declarations }
    Estoque:String;
  end;

var
  rpt_MovEstoqueBonificacaoFiscal: Trpt_MovEstoqueBonificacaoFiscal;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_MovEstoqueBonificacaoFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Active:=false;
  Parametro1.Active:=false;
  Action:=cafree;
end;

procedure Trpt_MovEstoqueBonificacaoFiscal.FormCreate(Sender: TObject);
begin
  Produto1.Open;
  iTotalQtd := 0;
end;

procedure Trpt_MovEstoqueBonificacaoFiscal.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSaldoAnt.Caption   := format('%.2f',[Produto1.FieldByName('MES_BONIFICACAO_ANTERIOR').asFloat]);
  zrlQuantidade.Caption := format('%.2f',[Produto1.FieldByName('MES_BONIFICACAO').asFloat]);

  Parametro1.Close;
  Parametro1.ParamByName('PAR_CODIGO').asInteger:=Produto1.FieldByName('MES_TIPO_MOV').asInteger;
  Parametro1.Open;
  if not Parametro1.IsEmpty then
    zrlTipoMovimento.Caption:=Parametro1.Descricao
  else
    zrlTipoMovimento.Caption:=Produto1.FieldByName('MES_TIPO_MOV').asString;
  if Produto1.FieldByName('MES_ES').asString = 'E' then
  Begin
    iTotalQtd := iTotalQtd + Produto1.FieldByName('MES_BONIFICACAO').asFloat;
    SZRLabel18.Caption:=format('%.2f',[(Produto1.FieldByName('MES_BONIFICACAO_ANTERIOR').asFloat+Produto1.FieldByName('MES_BONIFICACAO').asFloat)])
  end
  else
  Begin
    iTotalQtd := iTotalQtd - Produto1.FieldByName('MES_BONIFICACAO').asFloat;
    SZRLabel18.Caption:=format('%.2f',[(Produto1.FieldByName('MES_BONIFICACAO_ANTERIOR').asFloat-Produto1.FieldByName('MES_BONIFICACAO').asFloat)]);
  end;

  //Definir Usuário
  zrlUsuario.Caption := UpperCase(DM.NomeUsuario(Produto1.FieldByName('USU_CODIGO').asInteger));
end;


procedure Trpt_MovEstoqueBonificacaoFiscal.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_MovEstoqueBonificacaoFiscal.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    with CentroCusto1 do
    Begin
      if Produto1.FieldByName('CNC_CODIGO').asInteger <> CentroCusto1.CodigoCNC then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Produto1.FieldByName('CNC_CODIGO').asInteger;
        Open;
      end;
      zrlCentroDeCusto.Caption := 'Centro de Custo: '+RazaoSocial;
    end;
  end
  else if Produto1.FieldByName('CNC_CODIGO').asInteger = 1 then
    zrlCentroDeCusto.Caption := '*** Matriz'
  else
    zrlCentroDeCusto.Caption := '*** Filial '+Produto1.FieldByName('CNC_CODIGO').asString;
end;

procedure Trpt_MovEstoqueBonificacaoFiscal.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
    zrlProduto.Caption := Trim(FieldByName('PRD_DESCRICAO').AsString)+' '+Trim(FieldByName('PRD_CARACTERISTICA').AsString);
end;

procedure Trpt_MovEstoqueBonificacaoFiscal.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalQtd.Caption := format('%.2f',[iTotalQtd]);
end;

procedure Trpt_MovEstoqueBonificacaoFiscal.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuarioRodape.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
