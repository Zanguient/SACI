unit Urpt_Recebimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, SQuery, Item_de_Embarque, Embarque,
  Produto, Transportadora, Funcionario, CentroCusto, Pre_Recebimento,
  Recebimento;

type
  Trpt_Recebimentos = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    zrlFiltros: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    SZRGroup1: TSZRGroup;
    zrbDetalhe: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel18: TSZRLabel;
    Produto1: TProduto;
    ZRLabel19: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRLabel21: TSZRLabel;
    ZRDBText7: TSZRDBText;
    CentroCusto1: TCentroCusto;
    ZRDBText1: TSZRDBText;
    ZRLabel25: TSZRLabel;
    SZRLabel1: TSZRLabel;
    Recebimento1: TRecebimento;
    Recebimento1REC_CODIGO: TIntegerField;
    Recebimento1CNC_CODIGO: TIntegerField;
    Recebimento1REC_DATA: TDateTimeField;
    Recebimento1FOR_CODIGO: TIntegerField;
    Recebimento1REC_SITUACAO: TIntegerField;
    Recebimento1REC_TOT_ITEM: TIntegerField;
    Recebimento1REC_TIPO: TIntegerField;
    Recebimento1REC_CNC_ORIGEM: TIntegerField;
    Recebimento1REC_COD_ORIGEM: TIntegerField;
    Recebimento1REC_DATA_SAIDA: TDateTimeField;
    Recebimento1REC_DATA_EMISSAO: TDateTimeField;
    Recebimento1REC_NUM_DOC: TStringField;
    Recebimento1PRC_CODIGO: TIntegerField;
    Recebimento1REC_OBSERVACAO: TStringField;
    Recebimento1IRC_CODIGO: TIntegerField;
    Recebimento1CNC_CODIGO_1: TIntegerField;
    Recebimento1PRD_CODIGO: TIntegerField;
    Recebimento1REC_CODIGO_1: TIntegerField;
    Recebimento1IRC_QUANTIDADE: TFloatField;
    Recebimento1IRC_SITUACAO: TIntegerField;
    ZRLabel7: TSZRLabel;
    ZRDBText8: TSZRDBText;
    SZRDBText1: TSZRDBText;
    ZRLabel9: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel10: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel3: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlOrigem: TSZRLabel;
    zrlDestino: TSZRLabel;
    zrlNumeroDocumento: TSZRLabel;
    zrlSituacao: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel8: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_Recebimentos: Trpt_Recebimentos;

implementation
Uses UDM, Funcoes;
{$R *.DFM}      

procedure Trpt_Recebimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_Recebimentos.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Recebimentos.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao: string;
begin
  if zrbDetalhe.Height= 0 then
    Exit;

  with Produto1 do
  Begin
    if CodigoPRD <> Recebimento1.FieldByName('PRD_CODIGO').asInteger then
    Begin
      CLose;
      ParamByName('PRD_CODIGO').asInteger := Recebimento1.FieldByName('PRD_CODIGO').asInteger;
      Open;
    end;
    sDescricao := Descricao;
    if DM.Configuracao1.Empresa = empEletro then
      sDescricao := Trim(sDescricao + ' ' + Caracteristica);

    if Length(sDescricao) <= zrlProduto.Width then
      zrlProduto.Caption := sDescricao
    else
      zrlProduto.Caption := Copy(sDescricao,1,zrlProduto.Width);

    if Length(Referencia) <= zrlReferencia.Width then
      zrlReferencia.Caption := Referencia
    else
      zrlReferencia.Caption := Copy(Referencia,1,zrlReferencia.Width);
  end;

  SZRLabel1.Caption:=format('%.2f',[Recebimento1.FieldByName('IRC_QUANTIDADE').asfloat]);
end;

procedure Trpt_Recebimentos.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Recebimentos.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Recebimentos.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  Tipo:string;
begin
  if Recebimento1.Tipo = 0 then
    Tipo:='TRC'
  else if Recebimento1.Tipo = 1 then
    Tipo:='ABS'
  else if Recebimento1.Tipo = 2 then
    Tipo:='COM'
  else
    Tipo:='';

  zrlNumeroDocumento.Caption := Tipo+Recebimento1.FieldByName('REC_CODIGO').AsString+
    '/'+IntToStr(DM.Configuracao1.CodigoCNC)+'-'+FormatDateTime('dd.mm.yyyy',
    Recebimento1.FieldByName('REC_DATA').asDateTime);

  Case Recebimento1.Situacao of
    0: zrlSituacao.Caption := 'Aguardando';
    1: zrlSituacao.Caption := 'Recebido';
    2: zrlSituacao.Caption := 'Recusado';
    3: zrlSituacao.Caption := 'Cancelado';
  End;

  with CentroCusto1 do
  Begin
    if CodigoCNC <> Recebimento1.FieldByName('REC_CNC_ORIGEM').asInteger then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Recebimento1.FieldByName('REC_CNC_ORIGEM').asInteger;
      Open;
    end;
    zrlOrigem.Caption := RazaoSocial;

    if CodigoCNC <> Recebimento1.CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Recebimento1.CodigoCNC;
      Open;
    end;
    zrlDestino.Caption := RazaoSocial;
  end;
end;

end.
