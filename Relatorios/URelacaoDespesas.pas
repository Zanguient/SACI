unit URelacaoDespesas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Parametro, CentroCusto;

type
  Trpt_RelacaoDespesas = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    Movimento_caixa1: TMovimento_caixa;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel14: TSZRLabel;
    zrbRodapeGrupoGrupo: TSZRBand;
    ZRLabel17: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRSysData3: TSZRSysData;
    ZRDBText1: TSZRDBText;
    ZRBand4: TSZRBand;
    ZRLabel8: TSZRLabel;
    ZRGroup2: TSZRGroup;
    ZRGroup3: TSZRGroup;
    ZRDBText5: TSZRDBText;
    zrlFiltros: TSZRLabel;
    zrbGrupoCCX: TSZRGroup;
    zrlRodapeGrupoConta: TSZRBand;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlTotalConta: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRGroup1: TSZRGroup;
    ZRDBText3: TSZRDBText;
    SZRLabel5: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRLabel19: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlGrupo: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlTotalGrupo: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    zrlDescricaoCentro: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlValor: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRDBText2: TSZRDBText;
    zrlDescricao: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand4AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlRodapeGrupoContaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapeGrupoGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TMovimento_caixa;
  end;

var
  rpt_RelacaoDespesas: Trpt_RelacaoDespesas;
  SubTotalConta, SubTotalGrupo, TotalGeral:Double;

implementation
Uses
  URelData,UDM, Funcoes;
{$R *.DFM}

procedure Trpt_RelacaoDespesas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  CentroCusto1.Close;
  Action := cafree;
end;

procedure Trpt_RelacaoDespesas.ZRBand4AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  report.NewPage;
end;

procedure Trpt_RelacaoDespesas.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlEmpresa.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_RelacaoDespesas.zrlRodapeGrupoContaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalConta.Caption:=Format('%.2f',[SubTotalConta]);
  SubTotalConta:=0;
end;

procedure Trpt_RelacaoDespesas.zrlGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlGrupo.Caption := DM.SelecionaParametro(Entidade.fieldbyname('GRUPO').AsInteger);
  if zrlGrupo.Caption = '' then
    zrlGrupo.Caption := 'NAO DEFINIDO';
end;

procedure Trpt_RelacaoDespesas.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao: string;
begin
  sDescricao := '';

  if Entidade.FieldByName('CLI').asInteger > 0 then
    sDescricao := sDescricao + 'CLI:'+Entidade.FieldByName('CLI').asString+' ';
  if Entidade.FieldByName('FORN').asInteger > 0 then
    sDescricao := sDescricao + 'FOR:'+Entidade.FieldByName('FORN').asString+' ';
  if Entidade.FieldByName('TRN').asInteger > 0 then
    sDescricao := sDescricao + 'TRN:'+Entidade.FieldByName('TRN').asString+' ';

  sDescricao := sDescricao + Entidade.FieldByName('DESCRICAO').asString;

  zrlDescricao.Caption := sDescricao;

  zrlValor.Caption := Format('%.2f',[Entidade.FieldByName('VALOR_PAGO').AsFloat]);

  SubTotalConta := SubTotalConta+Arredonda(Entidade.FieldByName('VALOR_PAGO').AsFloat);
  SubTotalGrupo := SubTotalGrupo+Arredonda(Entidade.FieldByName('VALOR_PAGO').AsFloat);
  TotalGeral    := TotalGeral+Arredonda(Entidade.FieldByName('VALOR_PAGO').AsFloat);
end;

procedure Trpt_RelacaoDespesas.FormCreate(Sender: TObject);
begin
  Entidade := Movimento_caixa1;
  SubTotalConta := 0;
  SubTotalGrupo := 0;
  TotalGeral := 0;
end;

procedure Trpt_RelacaoDespesas.zrbRodapeGrupoGrupoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlTotalGrupo.Caption := Format('%.2f',[SubTotalGrupo]);
  SubTotalGrupo := 0;
end;

procedure Trpt_RelacaoDespesas.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGeral.Caption := Format('%.2f',[TotalGeral]);
end;

procedure Trpt_RelacaoDespesas.ZRGroup2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with CentroCusto1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByName('CENTRO').asInteger;
    Open;
    zrlDescricaoCentro.caption := RazaoSocial;
  end;
end;

procedure Trpt_RelacaoDespesas.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
