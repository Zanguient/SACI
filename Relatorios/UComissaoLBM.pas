unit UComissaoLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Titulo_receber, funcoes;

type
  Trpt_ComissaoVsadfLBM = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRDBText9: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    ZRLabel14: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    Titulo_receber2: TTitulo_receber;
    DSTitulo_receber1: TDataSource;
    SZRSubDetailBand1: TSZRSubDetailBand;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRGroup1: TSZRGroup;
    ZRDBText2: TSZRDBText;
    ZRLabel12: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText5: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel6: TSZRLabel;
    SZRBand2: TSZRBand;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SZRSubDetailBand1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Soma,ValorSemJuros,ValorComJuros:Double;
  end;

var
  rpt_ComissaoVsadfLBM: Trpt_ComissaoVsadfLBM;
  SubTotalSemJuros,SubTotalComJuros:Double;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_ComissaoVsadfLBM.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ValorComJuros:=0;
  ValorSemJuros:=ValorSemJuros+Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat;
  ValorComJuros:=Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat+
  Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
  Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsDateTime)/3000);
  soma:=Soma+ValorComjuros;
  ZRLabel14.Caption:=Format('%.2f',[Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat]);
  ZRLabel15.Caption:=Format('%.2f',[ValorComJuros]);
  SubTotalSemJuros:=0;
  SubTotalComJuros:=0;
end;




procedure Trpt_ComissaoVsadfLBM.ZRGroup1AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  Soma:=0;
end;

procedure Trpt_ComissaoVsadfLBM.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=Dm.Configuracao1.LojaNome;
end;

procedure Trpt_ComissaoVsadfLBM.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ValorSemJuros:=0;
end;


procedure Trpt_ComissaoVsadfLBM.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ComissaoVsadfLBM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Titulo_receber2.Close;
  Titulo_receber1.Close;
  Action:=caFree;
end;


procedure Trpt_ComissaoVsadfLBM.SZRSubDetailBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ValorComJuros:=0;
  ValorSemJuros:=ValorSemJuros+Titulo_Receber2.FieldByname('TRC_VALOR').AsFloat;
  ValorComJuros:=Titulo_Receber2.FieldByname('TRC_VALOR').AsFloat+
  Titulo_Receber2.FieldByname('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
  Titulo_receber2.FieldByName('TRC_VENCIMENTO').AsDateTime)/3000);
  soma:=Soma+ValorComjuros;
  SZRLabel3.Caption:=Format('%.2f',[Titulo_Receber2.FieldByname('TRC_VALOR').AsFloat]);
  SZRLabel4.Caption:=Format('%.2f',[ValorComJuros]);
  SubTotalSemJuros:=SubTotalSemJuros+Titulo_Receber2.FieldByname('TRC_VALOR').AsFloat;
  SubTotalComJuros:=SubTotalComJuros+ValorComJuros;
end;






procedure Trpt_ComissaoVsadfLBM.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel8.Caption:=Format('%.2f',[SubTotalSemJuros]);
  SZRLabel9.Caption:=Format('%.2f',[SubTotalComJuros]);
end;

procedure Trpt_ComissaoVsadfLBM.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
