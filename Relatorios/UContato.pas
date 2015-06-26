unit UContato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Contato,
  Fornecedor, funcoes;

type
  Trpt_contato = class(TForm)
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
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    Contato1: TContato;
    ZRDBText5: TSZRDBText;
    ZRLabel12: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRDBText2: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    Contato1CNT_CODIGO: TIntegerField;
    Contato1CNC_CODIGO: TIntegerField;
    Contato1CNT_NOME: TStringField;
    Contato1FOR_CODIGO: TIntegerField;
    Contato1CNT_TELEFONE: TStringField;
    Contato1CNT_FAX: TStringField;
    Contato1CNT_SITUACAO: TIntegerField;
    Contato1CNT_CARGO: TStringField;
    Contato1CNT_CELULAR: TStringField;
    Contato1CNT_DT_NASCIMENTO: TDateTimeField;
    Contato1USU_CODIGO: TIntegerField;
    Contato1CNT_DT_ALTERADO: TDateTimeField;
    Contato1CNT_OBSERVACAO: TStringField;
    SZRLabel6: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRDBText4: TSZRDBText;
    Fornecedor1: TFornecedor;
    SZRBand1: TSZRBand;
    SZRLabel8: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade : TContato;
  end;

var
  rpt_contato: Trpt_contato;

implementation

uses
  UDM;

{$R *.DFM}


procedure Trpt_contato.FormCreate(Sender: TObject);
begin
  Entidade := Contato1;
  Entidade.Active := true;
end;

procedure Trpt_contato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active := false;
  Action := cafree;
end;

procedure Trpt_contato.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_contato.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_contato.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  try
    Fornecedor1.Close;
    Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=Entidade.CodigoFOR;
    Fornecedor1.Open;
    SZRLabel5.Caption := Fornecedor1.RazaoSocial;
  except
    SZRLabel5.Caption := '';
  end;
end;

procedure Trpt_contato.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
