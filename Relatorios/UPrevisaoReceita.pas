unit UPrevisaoReceita;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, Parametro, CentroCusto, funcoes;

type
  Trpt_PrevisaoReceita = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRLabel11: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRDBText4: TSZRDBText;
    ZRLabel16: TSZRLabel;
    zrbGrupo: TSZRGroup;
    zrlDescDia: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel8: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRBand2: TSZRBand;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    Titulo_receber1CNC_CODIGO: TIntegerField;
    Titulo_receber1CODIGO: TIntegerField;
    Titulo_receber1VENCIMENTO: TDateTimeField;
    Titulo_receber1SEQUENCIA: TStringField;
    Titulo_receber1CREDITO: TFloatField;
    Titulo_receber1DEBITO: TFloatField;
    zrlAcumulativoCre: TSZRLabel;
    zrlAcumulativoDeb: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlDescSaldo: TSZRLabel;
    zrlSaldoDia: TSZRLabel;
    zrlSaldoGeral: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlSaldoAcumulado: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlDescDia2: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    CreditoDia, DebitoDia, CreditoTotal, DebitoTotal:Double;
    Entidade :TTitulo_receber;
  end;

var
  rpt_PrevisaoReceita: Trpt_PrevisaoReceita;

implementation
Uses
  UDM;

{$R *.DFM}

procedure Trpt_PrevisaoReceita.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active := false;
  Action := cafree;
end;

procedure Trpt_PrevisaoReceita.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_PrevisaoReceita.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_PrevisaoReceita.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  CreditoDia := CreditoDia + Entidade.FieldByName('CREDITO').asFloat;
  DebitoDia  := DebitoDia  + Entidade.FieldByName('DEBITO').asFloat;
  CreditoTotal := CreditoTotal + Entidade.FieldByName('CREDITO').asFloat;
  DebitoTotal  := DebitoTotal  + Entidade.FieldByName('DEBITO').asFloat;
end;

procedure Trpt_PrevisaoReceita.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlDescDia.Caption  := Entidade.FieldByName('Vencimento').asString;
  if zrbGrupo.Height = 0 then
    zrlDescDia2.Caption := Entidade.FieldByName('Vencimento').asString
  else
    zrlDescDia2.Caption := '';
  CreditoDia := 0;
  DebitoDia  := 0;
end;

procedure Trpt_PrevisaoReceita.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel10.Caption := Format('%.2f',[CreditoDia]);
  SZRLabel11.Caption := Format('%.2f',[DebitoDia]);
  zrlAcumulativoCre.Caption := Format('%.2f',[CreditoTotal]);
  zrlAcumulativoDeb.Caption := Format('%.2f',[DebitoTotal]);
  zrlSaldoDia.Caption := Format('%.2f',[CreditoDia-DebitoDia]);
  zrlSaldoAcumulado.Caption := Format('%.2f',[CreditoTotal-DebitoTotal]);
end;

procedure Trpt_PrevisaoReceita.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel15.Caption := Format('%.2f',[CreditoTotal]);
  SZRLabel16.Caption := Format('%.2f',[DebitoTotal]);
  zrlSaldoGeral.Caption := Format('%.2f',[CreditoTotal-DebitoTotal]);
end;

procedure Trpt_PrevisaoReceita.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
end;

procedure Trpt_PrevisaoReceita.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
