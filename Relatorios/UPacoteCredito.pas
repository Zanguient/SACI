unit UPacoteCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, 
  CentroCusto, Emprestimo, Produto, DateUtils, Pacote_de_Credito, funcoes;

type
  Trpt_PacoteCredito = class(TForm)
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
    CentroCusto1: TCentroCusto;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText4: TSZRDBText;
    Cliente1: TCliente;
    ZRLabel7: TSZRLabel;
    ZRLabel13: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel26: TSZRLabel;
    SZRDBText9: TSZRDBText;
    Pacote_de_Credito1: TPacote_de_Credito;
    Pacote_de_Credito1PCR_CODIGO: TIntegerField;
    Pacote_de_Credito1CNC_CODIGO: TIntegerField;
    Pacote_de_Credito1CNC_CLIENTE: TIntegerField;
    Pacote_de_Credito1CLI_CODIGO: TIntegerField;
    Pacote_de_Credito1USU_CODIGO: TIntegerField;
    Pacote_de_Credito1FUN_CODIGO: TIntegerField;
    Pacote_de_Credito1PCR_DT_CADASTRO: TDateTimeField;
    Pacote_de_Credito1PCR_DT_ALTERADO: TDateTimeField;
    Pacote_de_Credito1PCR_VALOR: TFloatField;
    Pacote_de_Credito1PCR_SITUACAO: TIntegerField;
    Pacote_de_Credito1PCR_OBSERVACAO: TStringField;
    zrlCNPJCPJ: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrlRazaoSocial: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TPacote_de_Credito;
  end;

var
  rpt_PacoteCredito: Trpt_PacoteCredito;

implementation
uses
 UDM, MxSelEmprestimo;

{$R *.DFM}


procedure Trpt_PacoteCredito.FormCreate(Sender: TObject);
begin
  Entidade := Pacote_de_Credito1;
end;

procedure Trpt_PacoteCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_PacoteCredito.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_PacoteCredito.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_PacoteCredito.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Cliente1 do
  Begin
    if (CodigoCNC <> Entidade.ClienteCNC) or
       (CodigoCLI <> Entidade.CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    zrlRazaoSocial.Caption := RazaoSocial+' ('+IntToStr(CodigoCLI)+')';
    zrlCNPJCPJ.Caption := CPFCGC;
  end;

  case Entidade.Situacao of
    0: zrlSituacao.Caption := 'Confirmado';
    1: zrlSituacao.Caption := 'Cancelado';
  end;
end;

procedure Trpt_PacoteCredito.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

end.
