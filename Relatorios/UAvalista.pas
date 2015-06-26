unit UAvalista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Avalista, funcoes;

type
  Trpt_avalista = class(TForm)
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
    Avalista1: TAvalista;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRLabel11: TSZRLabel;
    ZRLabel15: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZREndereco: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel5: TSZRLabel;
    Avalista1AVL_CODIGO: TIntegerField;
    Avalista1CNC_CODIGO: TIntegerField;
    Avalista1AVL_NOME: TStringField;
    Avalista1AVL_CGC_CPF: TStringField;
    Avalista1AVL_CGF_RG: TStringField;
    Avalista1AVL_LOGRADOURO: TIntegerField;
    Avalista1AVL_ENDERECO: TStringField;
    Avalista1AVL_BAIRRO: TStringField;
    Avalista1AVL_CIDADE: TStringField;
    Avalista1AVL_UF: TStringField;
    Avalista1AVL_CEP: TStringField;
    Avalista1AVL_FONE: TStringField;
    Avalista1AVL_PFISICA: TSmallintField;
    Avalista1AVL_DT_NASC: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Avalista1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade : TAvalista;
  end;

var
  rpt_avalista: Trpt_avalista;

implementation

uses UDM;

{$R *.DFM}


procedure Trpt_avalista.FormCreate(Sender: TObject);
begin
  Entidade := Avalista1;
  Entidade.Open;
end;

procedure Trpt_avalista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Entidade.Active := false;
    Action := cafree;
end;

procedure Trpt_avalista.Avalista1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_avalista.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_avalista.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_avalista.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZREndereco.Caption := Trim(DM.SelecionaParametro(Entidade.Logradouro)+' '+Entidade.Endereco);
end;

procedure Trpt_avalista.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
