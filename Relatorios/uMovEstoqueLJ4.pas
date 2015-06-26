unit uMovEstoqueLJ4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Usuario, CentroCusto,
  Parametro;

type
  Trpt_MovEstoqueLJ4 = class(TForm)
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
    SZRLabel14: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrlProduto: TSZRLabel;
    SZRGroup1: TSZRGroup;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlUsuario: TSZRLabel;
    SZRDBText8: TSZRDBText;
    zrlFiltros: TSZRLabel;
    SZRDBText9: TSZRDBText;
    zrlCodigo: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlSaldoAnt: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlUsuarioRodape: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Estoque:String;
  end;

var
  rpt_MovEstoqueLJ4: Trpt_MovEstoqueLJ4;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_MovEstoqueLJ4.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Active:=false;
  Parametro1.Active:=false;
  Action:=cafree;
end;

procedure Trpt_MovEstoqueLJ4.FormCreate(Sender: TObject);
begin
  Produto1.Active:=true;
end;

procedure Trpt_MovEstoqueLJ4.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSaldoAnt.Caption   := format('%.2f',[Produto1.FieldByName('ML4_SALDO_ANT').asFloat]);
  zrlQuantidade.Caption := format('%.2f',[Produto1.FieldByName('ML4_QUANTIDADE').asFloat]);

  Parametro1.Close;
  Parametro1.ParamByName('PAR_CODIGO').asInteger:=Produto1.FieldByName('ML4_TIPO_MOV').asInteger;
  Parametro1.Open;
  if not Parametro1.IsEmpty then
    zrlTipoMovimento.Caption:=Parametro1.Descricao
  else
    zrlTipoMovimento.Caption:=Produto1.FieldByName('ML4_TIPO_MOV').asString;
  if Produto1.FieldByName('ML4_ES').asString = 'E' then
    SZRLabel20.Caption:=format('%.2f',[(Produto1.FieldByName('ML4_SALDO_ANT').asFloat+Produto1.FieldByName('ML4_QUANTIDADE').asFloat)])
  else
    SZRLabel20.Caption:=format('%.2f',[(Produto1.FieldByName('ML4_SALDO_ANT').asFloat-Produto1.FieldByName('ML4_QUANTIDADE').asFloat)]);

  //Definir Usuário
  zrlUsuario.Caption := UpperCase(DM.NomeUsuario(Produto1.FieldByName('USU_CODIGO').asInteger));
end;


procedure Trpt_MovEstoqueLJ4.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
    zrlProduto.Caption := FieldByName('PRD_DESCRICAO').asString+' '+
      FieldByName('PRD_CARACTERISTICA').asString;
end;

procedure Trpt_MovEstoqueLJ4.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_MovEstoqueLJ4.SZRGroup1BeforePrint(Sender: TObject;
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

procedure Trpt_MovEstoqueLJ4.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuarioRodape.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
