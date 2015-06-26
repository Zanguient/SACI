unit UVerificaCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo,
  Boletim_Diario, Movimento_caixa, funcoes;

type
  Trpt_VerificaCaixa = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrlbRodape: TSZRBand;
    ZRSysData1: TSZRSysData;
    zrlTituloBoletim: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRLabel22: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel18: TSZRLabel;
    Movimento_caixa1: TMovimento_caixa;
    zrlCaixa: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel4: TSZRLabel;
    zrlTipoDocumento: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlbRodapeBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TMovimento_caixa;
  end;

var
  rpt_VerificaCaixa: Trpt_VerificaCaixa;

implementation
uses
  UDM, MxBoletimAbreCaixa, MxBoletimFechaCaixa;

{$R *.DFM}


procedure Trpt_VerificaCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_VerificaCaixa.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_VerificaCaixa.FormCreate(Sender: TObject);
begin
  Entidade := Movimento_caixa1;
end;

procedure Trpt_VerificaCaixa.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTipoDocumento.Caption := DM.SelecionaParametro(Entidade.Tipo);
end;

procedure Trpt_VerificaCaixa.zrlbRodapeBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
