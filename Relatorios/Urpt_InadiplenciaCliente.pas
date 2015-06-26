unit Urpt_InadiplenciaCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, Db, DBTables, SQuery, Titulo_receber, ZRCtrls, funcoes, UDM,
  Movimento_caixa, Cliente;

type
  Trpt_InadiplenciaCliente = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    SZRBand1: TSZRBand;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText1: TSZRDBText;
    Cliente1: TCliente;
    SZRLabel1: TSZRLabel;
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_InadiplenciaCliente: Trpt_InadiplenciaCliente;

implementation

uses URelData;

{$R *.DFM}



procedure Trpt_InadiplenciaCliente.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Begin
  Try
    ExecutaSQL(DM.QR_Comandos,'DROP INDEX TRCCNCVEN');
  Except
  end;
  Try
    ExecutaSQL(DM.QR_Comandos,'DROP INDEX MVCCNCTIT');
  Except
  end;
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRCCNCVEN ON TITULO_A_RECEBER (CNC_CODIGO,TRC_VENCIMENTO)');
  Except
  end;
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX MVCCNCTIT ON MOVIMENTO_DE_CAIXA (CNC_CODIGO,TIT_CODIGO)');
  Except
  end;
end;



procedure Trpt_InadiplenciaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Try
    ExecutaSQL(DM.QR_Comandos,'DROP INDEX TRCCNCVEN');
  Except
  end;
  Try
    ExecutaSQL(DM.QR_Comandos,'DROP INDEX MVCCNCTIT');
  Except
  end;
  Titulo_receber1.Active:=False;
  Cliente1.Active:=False;
  Action:=cafree;
end;

procedure Trpt_InadiplenciaCliente.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger:=Titulo_receber1.CodigoCLI;
  Cliente1.Open;
  if not Cliente1.IsEmpty then
    SZRLabel1.Caption := Cliente1.RazaoSocial;
end;

procedure Trpt_InadiplenciaCliente.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel16.Caption := EmpresaDesenvolvedora;
end;

end.
