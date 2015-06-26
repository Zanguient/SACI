unit UCarnetLuciano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, Titulo_receber, ZRCtrls, ZReport, Parametro;

type
  Trpt_CarnetLuciano = class(TForm)
    report: TSZReport;
    zrbDetalhe: TSZRBand;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRExpression1: TSZRExpression;
    Titulo_receber1: TTitulo_receber;
    Parametro1: TParametro;
    SZRDBText3: TSZRDBText;
    zrlCliente: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRExpression2: TSZRExpression;
    SZRDBText9: TSZRDBText;
    SZRLabel61: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlMensagem: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlFone: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlTotalParc1: TSZRLabel;
    zrlTotalParc2: TSZRLabel;
    zrlDadosCliente: TSZRLabel;
    Titulo_receberAntes: TTitulo_receber;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_CarnetLuciano: Trpt_CarnetLuciano;

implementation

uses UDM, Funcoes, MxSelProm;

{$R *.DFM}

procedure Trpt_CarnetLuciano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Titulo_Receber1.Close;
  Parametro1.Close;
  Action := cafree;
end;

procedure Trpt_CarnetLuciano.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDadosEmpresa: string;
begin
  zrlTotalParc1.Caption := PreencheZero(2,Titulo_Receber1.RecordCount);
  zrlTotalParc2.Caption := PreencheZero(2,Titulo_Receber1.RecordCount);
  zrlCliente.Caption := IntToStr(Titulo_Receber1.CodigoCLI)+'-'+Titulo_Receber1.FieldByname('CLI_RZ_SOCIAL').AsString;
  zrlDadosCliente.Caption := IntToStr(Titulo_Receber1.ClienteCNC)+'-'+IntToStr(Titulo_Receber1.CodigoCLI);
  zrlMensagem.Caption := DM.Configuracao1.MensagemCupom + fmxSelProm.NaoFinalizado;
  sDadosEmpresa := '';
  with DM.CentroCusto1 do
  Begin
    sDadosEmpresa := NomeFantasia + ' - ';
    with DM.Parametro1 do
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Logradouro;
      Open;
      if not IsEmpty then
        sDadosEmpresa := sDadosEmpresa + Descricao + ' ' + Endereco
      else
        sDadosEmpresa := sDadosEmpresa + Endereco;
    end;
    sDadosEmpresa := sDadosEmpresa + ' ' + Bairro + ' CEP: ' + CEP;
    zrlEndereco.Caption := sDadosEmpresa;
    sDadosEmpresa := '';
    if (Trim(Fone) = Trim(Fax)) and
       (Trim(Fone) <> '') then
      sDadosEmpresa := sDadosEmpresa + ' ' + ' Fone/Fax: '+Fone
    else
    Begin
      if Trim(Fone) <> '' then
        sDadosEmpresa := sDadosEmpresa + ' ' + ' Fone: '+Fone;
      if Trim(Fax) <> '' then
        sDadosEmpresa := sDadosEmpresa + ' ' + ' Fax: '+Fax;
    end;
    zrlFone.Caption := sDadosEmpresa;
  end;
end;

end.
