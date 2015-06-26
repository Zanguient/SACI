unit UBoletoBancarioLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, 
  Titulo_receber, Extenso, Informacoes;

type
  Trpt_BoletoBancarioLBM = class(TForm)
    report: TSZReport;
    zrlDetalhe: TSZRBand;
    ZRDBText9: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    ZRDBText12: TSZRDBText;
    ZRDBText13: TSZRDBText;
    ZRDBText14: TSZRDBText;
    ZRDBText1: TSZRDBText;
    zrlEmissaoVenda: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlLocalPagamento: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlValorDoc: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    Query1: TQuery;
    SZRLabel2: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlJuros: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel14: TSZRLabel;
    zrlCNPJ: TSZRLabel;
    zrlCGF: TSZRLabel;
    Cliente1: TCliente;
    SZRLabel4: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlReduzirAltura: TSZRLabel;
    zrlRestaurarAltura: TSZRLabel;
    Informacoes1: TInformacoes;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCidade: TSZRLabel;
    zrlUF: TSZRLabel;
    zrlCEP: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    BOL:integer;
    Entrada : Boolean;
  end;

var
  rpt_BoletoBancarioLBM: Trpt_BoletoBancarioLBM;

implementation
uses
 UDM, funcoes;

{$R *.DFM}

procedure Trpt_BoletoBancarioLBM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Titulo_Receber1.Active:= false;
 Action := cafree;
end;

procedure Trpt_BoletoBancarioLBM.Button1Click(Sender: TObject);
begin
Report.Report.Preview;
end;

procedure Trpt_BoletoBancarioLBM.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entrada then
  Begin
    Entrada := False;
    DoPrint := False;
    Exit;
  end;
  zrlJuros.Caption := format('%.2f',[Titulo_receber1.Valor*0.17/100]);
  if DM.Configuracao1.Empresa <> empLBM then //Outras Empresas
    zrlLocalPagamento.Caption := 'BANCO BRADESCO S/A. PAGUE PREFERENCIALMENTE NAS AGENCIAS DO BANCO BRADESCO.'
  else //LBM
    zrlLocalPagamento.Caption := 'PAGAVEL NA REDE BANCARIA OU CASAS LOTERICAS.';

  if DM.Configuracao1.Empresa <> empLBM then //O Fábio é quem define o Código do Boleto
    ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
      ' BOL_CODIGO='+IntToStr(BOL)+
      ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(Titulo_receber1.CodigoCNC)+
      ' AND TRC_CODIGO='+IntToStr(Titulo_receber1.CodigoTRC));
  BOL:=BOL+1;
  zrlValorDoc.Caption:=FormatFloat('#,##0.00',Titulo_receber1.Valor);

  with Informacoes1 do
  Begin
    if (Titulo_receber1.ClienteCNC <> CodigoCNC) or
       (Titulo_receber1.CodigoCLI <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Titulo_receber1.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Titulo_receber1.CodigoCLI;
      Open;
    end;
    if Endereco <> '' then
    Begin
      zrlEndereco.Caption := Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);
      zrlBairro.Caption := Bairro;
      zrlCidade.Caption := Cidade;
      zrlUF.Caption     := UF;
      zrlCEP.Caption    := CEP;
    end
    else
    Begin
      zrlEndereco.Caption:=Trim(DM.SelecionaParametro(Titulo_receber1.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                                Titulo_receber1.FieldByName('CLI_ENDERECO').asString);
      zrlBairro.Caption := Titulo_receber1.FieldByName('CLI_BAIRRO').asString;
      zrlCidade.Caption := Titulo_receber1.FieldByName('CLI_CIDADE').asString;
      zrlUF.Caption     := Titulo_receber1.FieldByName('CLI_UF').asString;
      zrlCEP.Caption    := Titulo_receber1.FieldByName('CLI_CEP').asString;
    end;
  end;

  with Cliente1 do
  Begin
    if (Titulo_receber1.ClienteCNC <> CodigoCNC) or
       (Titulo_receber1.CodigoCLI <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Titulo_receber1.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Titulo_receber1.CodigoCLI;
      Open;
    end;
    if CPFCGC <> '' then
      zrlCNPJ.Caption := 'CNPJ/CPF:'+CPFCGC;
    if CGFRG <> '' then
      zrlCGF.Caption  := 'CGF/RG:'+CGFRG;
  end;
end;

procedure Trpt_BoletoBancarioLBM.FormCreate(Sender: TObject);
begin
  Entrada := False;
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


