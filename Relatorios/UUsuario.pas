unit UUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Usuario,
  CentroCusto, funcoes;

type
  Trpt_usuario = class(TForm)
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
    Usuario1: TUsuario;
    ZRDBText2: TSZRDBText;
    ZRLabel9: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRLabel171: TSZRLabel;
    SZRLabel172: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRBand1: TSZRBand;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRDBText2: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade : TUsuario;
    { Public declarations }
  end;

var
  rpt_usuario: Trpt_usuario;

implementation
uses
  UDM;
{$R *.DFM}


procedure Trpt_usuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_usuario.FormCreate(Sender: TObject);
begin
  Entidade := Usuario1;
end;

procedure Trpt_usuario.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_usuario.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_usuario.FormShow(Sender: TObject);
begin
  Entidade.Active:=true;
end;

procedure Trpt_usuario.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
  CentroCusto1.Open;
  SZRLabel172.Caption:=CentroCusto1.RazaoSocial;
end;

procedure Trpt_usuario.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.Perfil then
    SZRLabel2.Caption := 'SIM'
  else
    SZRLabel2.Caption := 'NAO';

  case Entidade.Situacao of
    0: SZRLabel4.Caption := 'Ativado';
    1: SZRLabel4.Caption := 'Desativado';
    2: SZRLabel4.Caption := 'Logado';
  end;

  if Entidade.MaquinaLogado > 0 then
    SZRLabel7.Caption := IntToStr(Entidade.MaquinaLogado)
  else
    SZRLabel7.Caption := '';     
end;

procedure Trpt_usuario.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
