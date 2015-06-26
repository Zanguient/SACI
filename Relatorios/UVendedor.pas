unit UVendedor;

interface     

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Vendedor, CentroCusto, funcoes;

type
  Trpt_vendedor = class(TForm)
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
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText8: TSZRDBText;
    Vendedor1: TVendedor;
    ZRDBText4: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRDBText3: TSZRDBText;
    SZRLabel2: TSZRLabel;
    Vendedor1FUN_CODIGO: TIntegerField;
    Vendedor1CNC_CODIGO: TIntegerField;
    Vendedor1FUN_NOME: TStringField;
    Vendedor1FUN_FUNCAO: TIntegerField;
    Vendedor1FUN_DT_NASC: TDateTimeField;
    Vendedor1FUN_LOGRADOURO: TIntegerField;
    Vendedor1FUN_ENDERECO: TStringField;
    Vendedor1FUN_BAIRRO: TStringField;
    Vendedor1FUN_CIDADE: TStringField;
    Vendedor1FUN_UF: TStringField;
    Vendedor1FUN_CEP: TStringField;
    Vendedor1FUN_FONE: TStringField;
    Vendedor1FUN_SITUACAO: TIntegerField;
    Vendedor1FUN_CPF: TStringField;
    Vendedor1FUN_RG: TStringField;
    Vendedor1FUN_COTA: TFloatField;
    Vendedor1FUN_PERC_ABAIXO: TFloatField;
    Vendedor1FUN_PERC_ACIMA: TFloatField;
    Vendedor1FUN_OBSERVACAO1: TStringField;
    Vendedor1USU_CODIGO: TIntegerField;
    Vendedor1FUN_DT_ALTERADO: TDateTimeField;
    Vendedor1FUN_APELIDO: TStringField;
    SZREndereco: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRGroup1: TSZRGroup;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRBand1: TSZRBand;
    SZRLabel13: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade : TVendedor;
  end;

var
  rpt_vendedor: Trpt_vendedor;

implementation

uses UDM;

{$R *.DFM}

procedure Trpt_vendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_vendedor.FormCreate(Sender: TObject);
begin
  Entidade := Vendedor1;
  if not Entidade.Active then
    Entidade.Open;
end;

procedure Trpt_vendedor.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_vendedor.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_vendedor.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZREndereco.Caption := Trim(DM.SelecionaParametro(Entidade.Logradouro)+' '+Entidade.Endereco);
end;

procedure Trpt_vendedor.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Vendedor1.CodigoCNC;
  CentroCusto1.Open;
  SZRLabel12.Caption:=CentroCusto1.RazaoSocial;
end;

procedure Trpt_vendedor.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
