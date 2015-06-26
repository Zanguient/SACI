unit UClienteEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, 
  CentroCusto;

type
  Trpt_clienteEtiquetas = class(TForm)
    report: TSZReport;
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
    SZRDBText1: TSZRDBText;
    SZRLabel10: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_clienteEtiquetas: Trpt_clienteEtiquetas;
  
implementation
uses
 UDM, MxSelCliente;

{$R *.DFM}


procedure Trpt_clienteEtiquetas.FormCreate(Sender: TObject);
begin
 Cliente1.Active:= true;
end;

procedure Trpt_clienteEtiquetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cliente1.Close;
  Action := cafree;
end;

procedure Trpt_clienteEtiquetas.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if fMxSelCliente.ckbAniversariantes.Checked then
  Begin
    if DM.Configuracao1.SqlInterbase <> 1 then
      if (StrToInt(FormatDateTime('mm',Cliente1.DataNascimento)) = fMxSelCliente.cmbMesAniversario.ItemIndex+1) then
        DoPrint := True
      else
        DoPrint := False;
  end;
end;

end.
