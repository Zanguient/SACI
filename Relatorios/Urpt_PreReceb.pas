unit Urpt_PreReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, SQuery, Item_de_Embarque, Embarque,
  Produto, Transportadora, Funcionario, CentroCusto, Pre_Recebimento;

type
  Trpt_PreRecebimento = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlNomeEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRDBText13: TSZRDBText;
    ZRGroup1: TSZRGroup;
    zrbDetalhe: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel18: TSZRLabel;
    Produto1: TProduto;
    ZRLabel19: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRLabel21: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRDBText7: TSZRDBText;
    CentroCusto1: TCentroCusto;
    ZRDBText1: TSZRDBText;
    ZRLabel25: TSZRLabel;
    Pre_Recebimento1: TPre_Recebimento;
    Pre_Recebimento1PRC_CODIGO: TIntegerField;
    Pre_Recebimento1CNC_CODIGO: TIntegerField;
    Pre_Recebimento1PRC_DATA: TDateTimeField;
    Pre_Recebimento1PRC_SITUACAO: TIntegerField;
    Pre_Recebimento1PRC_TOT_ITEM: TIntegerField;
    Pre_Recebimento1PRC_CNC_ORIGEM: TIntegerField;
    Pre_Recebimento1PRC_COD_ORIGEM: TIntegerField;
    Pre_Recebimento1CNC_CODIGO_1: TIntegerField;
    Pre_Recebimento1PRD_CODIGO: TIntegerField;
    Pre_Recebimento1PRC_CODIGO_1: TIntegerField;
    Pre_Recebimento1IPR_QUANTIDADE: TFloatField;
    Pre_Recebimento1IPR_SITUACAO: TIntegerField;
    Pre_Recebimento1IPR_CODIGO: TIntegerField;
    SZRLabel1: TSZRLabel;
    Pre_Recebimento1FOR_CODIGO: TIntegerField;
    Pre_Recebimento1PRC_TIPO: TIntegerField;
    Pre_Recebimento1PRC_DATA_SAIDA: TDateTimeField;
    Pre_Recebimento1PRC_DATA_EMISSAO: TDateTimeField;
    Pre_Recebimento1PRC_NUM_DOC: TStringField;
    Pre_Recebimento1PRC_OBSERVACAO: TStringField;
    zrlProduto: TSZRLabel;
    zrlReferencia: TSZRLabel;
    ZRLabel16: TSZRLabel;
    Pre_Recebimento1PRC_NOTA_FISCAL: TIntegerField;
    Pre_Recebimento1IPR_TIPO: TIntegerField;
    zrlNumeroDocumento: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText1: TSZRDBText;
    zrlSituacao: TSZRLabel;
    zrlOrigem: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_PreRecebimento: Trpt_PreRecebimento;

implementation

Uses UDM, Funcoes;

{$R *.DFM}      

procedure Trpt_PreRecebimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_PreRecebimento.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeEmpresa.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;

  Case Pre_Recebimento1.Situacao of
    0: zrlSituacao.Caption := 'Aguardando';
    1: zrlSituacao.Caption := 'Recebido';
    2: zrlSituacao.Caption := 'Recusado';
    3: zrlSituacao.Caption := 'Cancelado';
  End;

  with CentroCusto1 do
  Begin
    if CodigoCNC <> Pre_Recebimento1.FieldByName('PRC_CNC_ORIGEM').asInteger then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Pre_Recebimento1.FieldByName('PRC_CNC_ORIGEM').asInteger;
      Open;
    end;
    zrlOrigem.Caption := RazaoSocial;
  end;
{    if CodigoCNC <> Pre_Recebimento1.CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Pre_Recebimento1.CodigoCNC;
      Open;
    end;
    zrlDestino.Caption := RazaoSocial;
  end;
}  
end;

procedure Trpt_PreRecebimento.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao: string;
begin
  if zrbDetalhe.Height = 0 then
    Exit;

  with Produto1 do
  Begin
    if CodigoPRD <> Pre_Recebimento1.FieldByName('PRD_CODIGO').asInteger then
    Begin
      CLose;
      ParamByName('PRD_CODIGO').asInteger := Pre_Recebimento1.FieldByName('PRD_CODIGO').asInteger;
      Open;
    end;
    if DM.Configuracao1.Empresa = empEletro then
      sDescricao := Trim(Descricao+' '+Caracteristica)
    else
      sDescricao := Descricao;
    if Length(sDescricao) <= zrlProduto.Width then
      zrlProduto.Caption := sDescricao
    else
      zrlProduto.Caption := Copy(sDescricao,1,zrlProduto.Width);
      
    if Length(Referencia) <= zrlReferencia.Width then
      zrlReferencia.Caption := Referencia
    else
      zrlReferencia.Caption := Copy(Referencia,1,zrlReferencia.Width);
  end;

  SZRLabel1.Caption:=format('%.2f',[Pre_Recebimento1.FieldByName('IPR_QUANTIDADE').asfloat]);
end;

procedure Trpt_PreRecebimento.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  Tipo:string;
begin
  if Pre_Recebimento1.Tipo = 0 then
    Tipo:='TRC'
  else if Pre_Recebimento1.Tipo = 1 then
    Tipo:='ABS'
  else if Pre_Recebimento1.Tipo = 2 then
    Tipo:='COM'
  else
    Tipo:='';
  zrlNumeroDocumento.Caption := Tipo+Pre_Recebimento1.FieldByName('PRC_CODIGO').AsString+
    '/'+IntToStr(DM.Configuracao1.CodigoCNC)+'-'+FormatDateTime('dd.mm.yyyy',
    Pre_Recebimento1.FieldByName('PRC_DATA').asDateTime);
end;

procedure Trpt_PreRecebimento.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
