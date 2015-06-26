unit UBoletoBancarioLuciano;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZRCtrls, ZReport, SQuery, Titulo_receber, DB, DBTables;

type
  Trpt_BoletoBancarioLuciano = class(TForm)
    report: TSZReport;
    ZRBand2: TSZRBand;
    ZRDBText9: TSZRDBText;
    ZRDBText14: TSZRDBText;
    ZRDBText1: TSZRDBText;
    zrlDataEmissao: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlData: TSZRLabel;
    zrlLocalPagamento: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlValorTitulo: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    Query1: TQuery;
    Titulo_receber1: TTitulo_receber;
    zrlReduzirAltura: TSZRLabel;
    zrlPedidoParcela: TSZRLabel;
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    BOL:integer;
  end;

var
  rpt_BoletoBancarioLuciano: Trpt_BoletoBancarioLuciano;
  codPDV: integer;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_BoletoBancarioLuciano.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel14.Caption:=IntToStr(BOL);

  ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
    ' BOL_CODIGO='+IntToStr(BOL)+
    ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE CNC_CODIGO='+IntToStr(Titulo_receber1.CodigoCNC)+
    ' AND TRC_CODIGO='+IntToStr(Titulo_receber1.CodigoTRC));

  zrlPedidoParcela.Caption := inttostr(CodPDV)+'-'+Titulo_receber1.fieldbyname('TRC_SEQUENCIA').AsString;

  zrlValorTitulo.Caption:=Format('%.2f',[Titulo_receber1.Valor]);

  SZRLabel15.Caption := Trim(DM.SelecionaParametro(Titulo_receber1.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                             Titulo_receber1.FieldByName('CLI_ENDERECO').asString)+'-'+
                             Titulo_receber1.FieldByName('CLI_BAIRRO').AsString+'-'+
                             Titulo_receber1.FieldByName('CLI_CIDADE').AsString;
end;

end.
