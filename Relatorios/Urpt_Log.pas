unit Urpt_Log;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, Log;

type
  Trpt_Log = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrbGrupoUSU: TSZRGroup;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    zrbDetalhe: TSZRBand;
    Log1: TLog;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel8: TSZRLabel;
    SZRDBText8: TSZRDBText;
    zrlUsuarioResp: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlRodape: TSZRBand;
    SZRLabel10: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlDataINI: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    zrlOperacaoDoSistema: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel12: TSZRLabel;
    zrlMaquina: TSZRLabel;
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbGrupoUSUBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlRodapeBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    TotalRegistros : integer;
  public
    { Public declarations }
  end;

var
  rpt_Log: Trpt_Log;

implementation

uses UDM, Funcoes;

{$R *.DFM}

procedure Trpt_Log.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Log.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Log.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Log1.Close;
  action:=cafree;
end;

procedure Trpt_Log.zrbGrupoUSUBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuarioResp.Caption := UpperCase(DM.NomeUsuario(Log1.CodigoUSU));
end;

procedure Trpt_Log.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Log.zrlRodapeBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_Log.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Length(Log1.FieldByName('OPS_OPERACAO').asString) > zrlOperacaoDoSistema.Width then
    zrlOperacaoDoSistema.Caption := Copy(Log1.FieldByName('OPS_OPERACAO').asString,1,zrlOperacaoDoSistema.Width)
  else
    zrlOperacaoDoSistema.Caption := Log1.FieldByName('OPS_OPERACAO').asString;

  zrlMaquina.Caption := PreencheZero(3, Log1.MaquinaLOG);

  inc(TotalRegistros);
end;

procedure Trpt_Log.FormCreate(Sender: TObject);
begin
  TotalRegistros := 0;
end;

end.
