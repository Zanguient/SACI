unit UClienteAniversarianteLUOTICA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Parametro,
  CentroCusto, funcoes;

type
  Trpt_clienteAniversarianteLUOTICA = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand3: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    Cliente1: TCliente;
    Parametro1: TParametro;
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
    SZRLabel15: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel11: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel14: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_clienteAniversarianteLUOTICA: Trpt_clienteAniversarianteLUOTICA;
const
  mes : array [1..12] of string = ('janeiro','fevereiro','marco','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro');
  
implementation
uses
 UDM, MxSelCliente;

{$R *.DFM}


procedure Trpt_clienteAniversarianteLUOTICA.FormCreate(Sender: TObject);
begin
 Cliente1.Active:= true;
end;

procedure Trpt_clienteAniversarianteLUOTICA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cliente1.Active:=False;
  Parametro1.Active:=False;
  Action := cafree;
end;

procedure Trpt_clienteAniversarianteLUOTICA.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.CentroCusto1.NomeFantasia;
  ZRLabel2.Caption:='CNPJ: '+DM.CentroCusto1.CGC;
  SZRLabel2.Caption:='CGF: '+DM.CentroCusto1.IE;
end;

procedure Trpt_clienteAniversarianteLUOTICA.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.SqlInterbase <> 1 then
    if fMxSelCliente.edtDiaAniversario.Text = '' then
      if (StrToInt(FormatDateTime('mm',Cliente1.DataNascimento)) = fMxSelCliente.cmbMesAniversario.ItemIndex+1) then
        DoPrint := True
      else
        DoPrint := False
    else
      if (StrToInt(FormatDateTime('mm',Cliente1.DataNascimento)) = fMxSelCliente.cmbMesAniversario.ItemIndex+1) AND
         (FormatDateTime('dd',Cliente1.DataNascimento) = fMxSelCliente.edtDiaAniversario.Text) then
        DoPrint := True
      else
        DoPrint := False;

  SZRLabel15.Caption:=DM.CentroCusto1.Cidade+', '+
    FormatDateTime('dd',Cliente1.DataNascimento)+' de '+mes[StrToInt(FormatDateTime('mm',Cliente1.DataNascimento))]+
    ' de '+FormatDateTime('yyyy',DM.Configuracao1.Data);

  SZRLabel14.Caption:=DM.CentroCusto1.NomeFantasia;

  If Cliente1.Logradouro > 0 then
  Begin
    Parametro1.Close;
    Parametro1.ParamByName('PAR_CODIGO').asInteger:=Cliente1.Logradouro;
    Parametro1.Open;
    SZRLabel11.Caption:=Parametro1.Descricao+' '+Cliente1.Endereco;
  end
  else
    SZRLabel11.Caption:=Cliente1.Endereco;
end;

procedure Trpt_clienteAniversarianteLUOTICA.ZRBand3BeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
