unit UOperacao_sistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, funcoes;

type
  Trpt_OperSist = class(TForm)
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
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    Operacao_do_Sistema1: TOperacao_do_Sistema;
    ZRLabel13: TSZRLabel;
    ZRDBText6: TSZRDBText;
    Submodulo1: TSubmodulo;
    Modulo1: TModulo;
    ZRGroup1: TSZRGroup;
    ZRGroup2: TSZRGroup;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlFiltro2: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Operacao_do_Sistema1BeforeOpen(DataSet: TDataSet);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRLabel2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_OperSist: Trpt_OperSist;
  entidade:TOperacao_do_Sistema;

implementation
Uses
  UDM;

{$R *.DFM}

procedure Trpt_OperSist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Operacao_do_Sistema1.Active:=false;
end;

procedure Trpt_OperSist.FormCreate(Sender: TObject);
begin
// Operacao_do_Sistema1.Active:=true;
end;

procedure Trpt_OperSist.Operacao_do_Sistema1BeforeOpen(
  DataSet: TDataSet);
begin
// Operacao_do_Sistema1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_OperSist.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_OperSist.ZRLabel1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_OperSist.SZRLabel2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
   With Modulo1 do
   begin
   Close;
   sql.Text:='SELECT * FROM MODULO WHERE MDL_CODIGO ='+inttostr(Entidade.Modulo);
   Open;
   end;
   SZRLabel2.Caption:=Modulo1.Descricao;
end;

procedure Trpt_OperSist.SZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
   With SubModulo1 do
   begin
   Close;
   sql.Text:='SELECT * FROM SUBMODULO WHERE SML_CODIGO ='+inttostr(Entidade.Submodulo);
   Open;
   end;
   SZRLabel3.Caption:=SubModulo1.Descricao;
end;

procedure Trpt_OperSist.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_OperSist.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

end.
