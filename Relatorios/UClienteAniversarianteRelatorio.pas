unit UClienteAniversarianteRelatorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, DateUtils, funcoes;

type
  Trpt_clienteAniversarianteRelatorio = class(TForm)
    report: TSZReport;
    zrbRodapePagina: TSZRBand;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    Cliente1: TCliente;
    Cliente1CLI_CODIGO: TIntegerField;
    Cliente1CNC_CODIGO: TIntegerField;
    Cliente1CLI_PESSOA_FISICA: TSmallintField;
    Cliente1CLI_DT_CADASTRO: TDateTimeField;
    Cliente1CLI_DATA_NASC: TDateTimeField;
    Cliente1CLI_RZ_SOCIAL: TStringField;
    Cliente1CLI_NOME_FAN: TStringField;
    Cliente1CLI_CGC_CPF: TStringField;
    Cliente1CLI_CGF_RG: TStringField;
    Cliente1CLI_LOGRADOURO: TIntegerField;
    Cliente1CLI_ENDERECO: TStringField;
    Cliente1CLI_BAIRRO: TStringField;
    Cliente1CLI_CIDADE: TStringField;
    Cliente1CLI_UF: TStringField;
    Cliente1CLI_CEP: TStringField;
    Cliente1CLI_FONE: TStringField;
    Cliente1CLI_SITUACAO: TIntegerField;
    Cliente1CLI_CREDITO: TFloatField;
    Cliente1CLI_PAI: TStringField;
    Cliente1CLI_MAE: TStringField;
    Cliente1CLI_CONJUGE: TStringField;
    Cliente1CLI_OBS1: TStringField;
    Cliente1CLI_LOCALTRABALHO: TStringField;
    Cliente1CLI_FAX: TStringField;
    Cliente1CLI_SITE: TStringField;
    Cliente1CLI_EMAIL: TStringField;
    Cliente1USU_CODIGO: TIntegerField;
    Cliente1CLI_DT_ALTERADO: TDateTimeField;
    Cliente1CLI_CELULAR: TStringField;
    SZRBand1: TSZRBand;
    ZRDBText1: TSZRDBText;
    SZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    SZRLabel1: TSZRLabel;
    ZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel11: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel12: TSZRLabel;
    zrlUsuario: TSZRLabel;
    ZRSysData1: TSZRSysData;
    zrlDtNascimento: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TCliente;
  end;

var
  rpt_clienteAniversarianteRelatorio: Trpt_clienteAniversarianteRelatorio;
  
implementation
uses
 UDM, MxSelCliente;

{$R *.DFM}


procedure Trpt_clienteAniversarianteRelatorio.FormCreate(Sender: TObject);
begin
  Entidade := Cliente1;
  if not Entidade.Active then
    Entidade.Open;
end;

procedure Trpt_clienteAniversarianteRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_clienteAniversarianteRelatorio.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;

  SZRLabel4.Caption:=fMxSelCliente.cmbMesAniversario.SelText;
end;

procedure Trpt_clienteAniversarianteRelatorio.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if YearOf(Entidade.DataNascimento) = 1900 then
    zrlDtNascimento.Caption := FormatDateTime('DD/MM',Entidade.DataNascimento)
  else
    zrlDtNascimento.Caption := FormatDateTime('DD/MM/YYYY',Entidade.DataNascimento);  

  if DM.Configuracao1.SqlInterbase <> 1 then
    if fMxSelCliente.edtDiaAniversario.Text = '' then
      if (StrToInt(FormatDateTime('mm',Entidade.DataNascimento)) = fMxSelCliente.cmbMesAniversario.ItemIndex+1) then
        DoPrint := True
      else
        DoPrint := False
    else
      if (StrToInt(FormatDateTime('mm',Entidade.DataNascimento)) = fMxSelCliente.cmbMesAniversario.ItemIndex+1) and
         (FormatDateTime('dd',Entidade.DataNascimento) = fMxSelCliente.edtDiaAniversario.Text) then
        DoPrint := True
      else
        DoPrint := False;
end;

procedure Trpt_clienteAniversarianteRelatorio.zrbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
