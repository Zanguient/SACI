unit UBoletoBancario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Titulo_receber;

type
  Trpt_BoletoBancario = class(TForm)
    report: TSZReport;
    ZRBand2: TSZRBand;
    ZRDBText9: TSZRDBText;
    Titulo_receber1: TTitulo_receber;                       
    ZRDBText12: TSZRDBText;
    ZRDBText13: TSZRDBText;
    ZRDBText14: TSZRDBText;
    ZRDBText1: TSZRDBText;
    zrlDataEmissao: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlData: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlLocalPagamento: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlValorTitulo: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    Query1: TQuery;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    BOL:integer;
    { Public declarations }
  end;

var
  rpt_BoletoBancario: Trpt_BoletoBancario;

implementation
uses
 UDM, funcoes;

{$R *.DFM}

procedure Trpt_BoletoBancario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Titulo_Receber1.Active:= false;
 Action := cafree;
end;

procedure Trpt_BoletoBancario.Button1Click(Sender: TObject);
begin
Report.Report.Preview;
end;

procedure Trpt_BoletoBancario.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa <> empLBM then //Outras Empresas
    zrlLocalPagamento.Caption := 'BANCO BRADESCO S/A. PAGUE PREFERENCIALMENTE NAS AGENCIAS DO BANCO BRADESCO.'
  else //LBM
    zrlLocalPagamento.Caption := 'AG.:2183 PO.:104. PAGÁVEL PREFERENCIALMENTE NAS AG. LOTÉRICAS.';

  SZRLabel14.Caption:=IntToStr(BOL);
  if DM.Configuracao1.Empresa <> empLBM then //O Fábio é quem define o Código do Boleto
    ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
      ' BOL_CODIGO='+IntToStr(BOL)+
      ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(Titulo_receber1.CodigoCNC)+
      ' AND TRC_CODIGO='+IntToStr(Titulo_receber1.CodigoTRC));
  BOL:=BOL+1;
  zrlValorTitulo.Caption:=Format('%.2f',[Titulo_receber1.Valor]);

  SZRLabel15.Caption := Trim(DM.SelecionaParametro(Titulo_receber1.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                             Titulo_receber1.FieldByName('CLI_ENDERECO').asString);
end;

procedure Trpt_BoletoBancario.FormCreate(Sender: TObject);
begin
  BOL:=0;
  try
  Begin
    Query1.Close;
    Query1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
    Query1.Open;
    BOL:=Query1.FieldByName('CTR_BOLETO').asInteger;
  end;
  except
  end;
end;

end.
