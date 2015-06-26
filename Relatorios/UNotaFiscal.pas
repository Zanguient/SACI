unit UNotaFiscal;
//Nota Eletro Guerra
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Fornecedor,
  Classificacao_fiscal, Transportadora, Cliente, Produto, OperFisc,
  Item_Nota_Fiscal;

type
  Trpt_NotaFiscal = class(TForm)
    report: TSZReport;
    Item_Nota_Fiscal1: TItem_Nota_Fiscal;
    OperFiscal1: TOperFiscal;
    Item_Nota_Fiscal1INF_CODIGO: TIntegerField;
    Item_Nota_Fiscal1CNC_CODIGO: TIntegerField;
    Item_Nota_Fiscal1NTF_CODIGO: TIntegerField;
    Item_Nota_Fiscal1PRD_CODIGO: TIntegerField;
    Item_Nota_Fiscal1INF_SERVICO: TStringField;
    Item_Nota_Fiscal1INF_QUANTIDADE: TFloatField;
    Item_Nota_Fiscal1INF_PRECO: TFloatField;
    Item_Nota_Fiscal1INF_DESCONTO: TFloatField;
    Item_Nota_Fiscal1INF_TIPO_ALIQUOTA: TIntegerField;
    Item_Nota_Fiscal1INF_ALIQUOTA: TFloatField;
    Produto1: TProduto;
    Cliente1: TCliente;
    Transportadora1: TTransportadora;
    SZRGroup1: TSZRGroup;
    zrlMarcaSaida: TSZRLabel;
    zrlMarcaEntrada: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlDataEmissao: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRDBText27: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCPF_CNPJ: TSZRLabel;
    zrlCEP: TSZRLabel;
    zrlMunicipio: TSZRLabel;
    zrlFoneFax: TSZRLabel;
    zrlUF: TSZRLabel;
    zrlCGF_RG: TSZRLabel;
    ZRBand5: TSZRBand;
    SZRDBText17: TSZRDBText;
    SZRDBText18: TSZRDBText;
    SZRDBText24: TSZRDBText;
    SZRDBText25: TSZRDBText;
    SZRDBText26: TSZRDBText;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRExpression2: TSZRExpression;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel43: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRDBText9: TSZRDBText;
    SZRDBText11: TSZRDBText;
    SZRDBText12: TSZRDBText;
    SZRDBText13: TSZRDBText;
    SZRDBText14: TSZRDBText;
    SZRDBText15: TSZRDBText;
    SZRDBText16: TSZRDBText;
    SZRDBText19: TSZRDBText;
    SZRDBText20: TSZRDBText;
    SZRBand1: TSZRBand;
    ZRDBText9: TSZRDBText;
    SZRDBText28: TSZRDBText;
    SZRLabel12: TSZRLabel;
    SZRExpression1: TSZRExpression;
    zrlNaturezaDaOperacao: TSZRLabel;
    Item_Nota_Fiscal1USU_CODIGO: TIntegerField;
    Item_Nota_Fiscal1CNC_CLIENTE: TIntegerField;
    Item_Nota_Fiscal1CLI_CODIGO: TIntegerField;
    Item_Nota_Fiscal1FOR_CODIGO: TIntegerField;
    Item_Nota_Fiscal1FUN_CODIGO: TIntegerField;
    Item_Nota_Fiscal1TRN_CODIGO: TIntegerField;
    Item_Nota_Fiscal1CAG_CODIGO: TIntegerField;
    Item_Nota_Fiscal1NTF_DT_CADASTRO: TDateTimeField;
    Item_Nota_Fiscal1NTF_DT_ALTERADO: TDateTimeField;
    Item_Nota_Fiscal1NTF_DT_EMISSAO: TDateTimeField;
    Item_Nota_Fiscal1NTF_DT_ENTRADA_SAIDA: TDateTimeField;
    Item_Nota_Fiscal1NTF_ENTRADA_SAIDA: TIntegerField;
    Item_Nota_Fiscal1NTF_TIPO_NOTA: TIntegerField;
    Item_Nota_Fiscal1NTF_NOTA_FISCAL: TIntegerField;
    Item_Nota_Fiscal1NTF_SERIE: TStringField;
    Item_Nota_Fiscal1NTF_SUBSERIE: TStringField;
    Item_Nota_Fiscal1NTF_AIDF: TIntegerField;
    Item_Nota_Fiscal1NTF_CFOP: TIntegerField;
    Item_Nota_Fiscal1NTF_BASE_ICMS: TFloatField;
    Item_Nota_Fiscal1NTF_ICMS: TFloatField;
    Item_Nota_Fiscal1NTF_BASE_ICMS_SUB: TFloatField;
    Item_Nota_Fiscal1NTF_ICMS_SUB: TFloatField;
    Item_Nota_Fiscal1NTF_TOTAL_PRODUTO: TFloatField;
    Item_Nota_Fiscal1NTF_TOTAL_NOTA: TFloatField;
    Item_Nota_Fiscal1NTF_FRETE: TFloatField;
    Item_Nota_Fiscal1NTF_SEGURO: TFloatField;
    Item_Nota_Fiscal1NTF_OUTRAS: TFloatField;
    Item_Nota_Fiscal1NTF_IPI: TFloatField;
    Item_Nota_Fiscal1NTF_TIPO_TRANSPORTE: TIntegerField;
    Item_Nota_Fiscal1NTF_TIPO_FRETE: TIntegerField;
    Item_Nota_Fiscal1NTF_PLACA: TStringField;
    Item_Nota_Fiscal1NTF_PLACA_UF: TStringField;
    Item_Nota_Fiscal1NTF_QUANTIDADE: TFloatField;
    Item_Nota_Fiscal1NTF_ESPECIE: TStringField;
    Item_Nota_Fiscal1NTF_MARCA: TStringField;
    Item_Nota_Fiscal1NTF_NUMERO: TStringField;
    Item_Nota_Fiscal1NTF_PESO_BRUTO: TFloatField;
    Item_Nota_Fiscal1NTF_PESO_LIQUIDO: TFloatField;
    Item_Nota_Fiscal1NTF_SITUACAO: TIntegerField;
    SZRDBText3: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRDBText2: TSZRDBText;
    Item_Nota_Fiscal1CT: TStringField;
    SZRLabel1: TSZRLabel;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Item_Nota_Fiscal1NTF_PEDIDO: TIntegerField;
    Item_Nota_Fiscal1NTF_SELO: TIntegerField;
    Item_Nota_Fiscal1NTF_OBSERVACAO: TStringField;
    SZRLabel4: TSZRLabel;
    Item_Nota_Fiscal1NTF_ICMS_FRETE: TFloatField;
    Item_Nota_Fiscal1NTF_ISS: TFloatField;
    Item_Nota_Fiscal1NTF_BASE_ISS: TFloatField;
    Item_Nota_Fiscal1CNC_PEDIDO: TIntegerField;
    Item_Nota_Fiscal1NTF_ENDERECO: TStringField;
    Item_Nota_Fiscal1NTF_BAIRRO: TStringField;
    Item_Nota_Fiscal1NTF_MUNICIPIO: TStringField;
    Item_Nota_Fiscal1NTF_UF: TStringField;
    Item_Nota_Fiscal1NTF_CEP: TStringField;
    Item_Nota_Fiscal1NTF_CONHECIMENTO: TIntegerField;
    Item_Nota_Fiscal1NTF_NOTA_CUPOM: TIntegerField;
    Item_Nota_Fiscal1NTF_AVULSA: TIntegerField;
    Item_Nota_Fiscal1NTF_COD_PAGAMENTO: TIntegerField;
    Item_Nota_Fiscal1CNC_CODIGO_1: TIntegerField;
    Item_Nota_Fiscal1NTF_CODIGO_1: TIntegerField;
    Fornecedor1: TFornecedor;
    Item_Nota_Fiscal1NTF_TOTAL_SERVICO: TFloatField;
    Item_Nota_Fiscal1FUN_ARQUITETO: TIntegerField;
    Item_Nota_Fiscal1CNC_ORIGEM: TIntegerField;
    Item_Nota_Fiscal1INF_ALIQUOTA_IPI: TFloatField;
    Item_Nota_Fiscal1CNC_ORIGEM_1: TIntegerField;
    Item_Nota_Fiscal1NTF_COD_PAGAMENTO_2: TIntegerField;
    Item_Nota_Fiscal1INF_BONIFICACAO: TFloatField;
    zrlFrete: TSZRLabel;
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRDBText8BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRDBText6BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRDBText7BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRDBText28BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRDBText3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRExpression1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRDBText5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRExpression2BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRDBText4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Desc1,TotalQuantidade:Double;
  end;

var
  rpt_NotaFiscal: Trpt_NotaFiscal;

implementation
uses
 UDM, MxNotaFiscal, MxTransferencia;

{$R *.DFM}

procedure Trpt_NotaFiscal.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sRazao, sEnde, sBairro, sCEP, sCidade, sUF, sFone, sFax, sCPFCNPJ, sRGCGF:string;
  iLogra, CdCLIFOR:integer;
begin
  TotalQuantidade:=0;
  OperFiscal1.Close;
  if tag = 0 then
    OperFiscal1.ParamByName('OPF_CODIGO').asInteger:=fMxNotaFiscal.NotaFiscal1.CFOP
  else
    OperFiscal1.ParamByName('OPF_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('NTF_CFOP').asInteger;
  OperFiscal1.Open;
  if (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 366) then //Demonstração
  Begin
    if Item_Nota_Fiscal1.FieldByName('NTF_ENTRADA_SAIDA').asInteger = 0 then
      zrlNaturezaDaOperacao.Caption:='RETORNO DE DEMONSTRACAO'
    else
      zrlNaturezaDaOperacao.Caption:='DEMONSTRACAO';
    if (StrToInt(Copy(IntToStr(Item_Nota_Fiscal1.FieldByName('NTF_CFOP').asInteger),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)'
  end
  else if Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 365 then //Transferência
    zrlNaturezaDaOperacao.Caption := 'TRANSFERENCIA'
  else if Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 363 then //Correção
  Begin
    zrlNaturezaDaOperacao.Caption := 'CORRECAO DE DADOS';
    if (StrToInt(Copy(IntToStr(Item_Nota_Fiscal1.FieldByName('NTF_CFOP').asInteger),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)';
  end
  else if Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 364 then //Simples Remessa
  Begin
    zrlNaturezaDaOperacao.Caption := 'SIMPLES REMESSA';
    if (StrToInt(Copy(IntToStr(Item_Nota_Fiscal1.FieldByName('NTF_CFOP').asInteger),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)';
  end
  else if Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 361 then //Venda
  Begin
    zrlNaturezaDaOperacao.Caption := 'VENDA DE MERCADORIA';
    if (StrToInt(Copy(IntToStr(Item_Nota_Fiscal1.FieldByName('NTF_CFOP').asInteger),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)';
  end
  else if Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 368 then //Serviço
    zrlNaturezaDaOperacao.Caption := 'PRESTACAO DE SERVICO'
  else if Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 1030 then //Mostruário
    zrlNaturezaDaOperacao.Caption := 'MOSTRUARIO'
  else if Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 4450 then //REMESSA DE TROCA
    zrlNaturezaDaOperacao.Caption := 'REMESSA DE TROCA'
  else if Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 4450 then //REMESSA EM GARANTIA
    zrlNaturezaDaOperacao.Caption := 'REMESSA EM GARANTIA'
  else //Outra Nota
    zrlNaturezaDaOperacao.Caption:=OperFiscal1.Descricao;

  if Item_Nota_Fiscal1.FieldByName('NTF_ENTRADA_SAIDA').asInteger = 1 then
    zrlMarcaSaida.Enabled := True  //Saída
  else
    zrlMarcaEntrada.Enabled := True; //Entrada

  if Item_Nota_Fiscal1.FieldByName('NTF_DT_EMISSAO').asDateTime > 0 then
    zrlDataEmissao.Caption:=FormatDateTime('dd/mm/yyyy',Item_Nota_Fiscal1.FieldByName('NTF_DT_EMISSAO').asDateTime)
  else
    zrlDataEmissao.Caption:='';

  if (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 360) and  //Compra
     (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 369) and  //Conhecimento
     (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 451) and  //Imobilizado     
     (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 4240) and //Aquisição
     (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 4450) and //REMESSA DE TROCA
     (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 4490) and //REMESSA EM GARANTIA
     (Item_Nota_Fiscal1.FieldByName('NTF_CFOP').asInteger <> 5202) and     //Dev. Compra
     (Item_Nota_Fiscal1.FieldByName('NTF_CFOP').asInteger <> 6202) then    //Dev. Compra
  Begin
    with Cliente1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('CNC_CLIENTE').asInteger;
      ParamByName('CLI_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('CLI_CODIGO').asInteger;
      Open;
      CdCLIFOR := CodigoCLI;
      sRazao := RazaoSocial;
      iLogra := Logradouro;
      sEnde  := Endereco;
      sBairro := Bairro;
      sCEP    := CEP;
      sCidade := Cidade;
      sFone   := Fone;
      sFax    := Fax;
      sCPFCNPJ := CPFCGC;
      sRGCGF  := CGFRG;
    end;
  end
  else if (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 369) then //Conhecimento
  Begin
    with Transportadora1 do
    Begin
      Close;
      ParamByName('TRN_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('CLI_CODIGO').asInteger;
      Open;
      CdCLIFOR := CodigoTRN;
      sRazao := RazaoSocial;
      iLogra := Logradouro;
      sEnde  := Endereco;
      sBairro := Bairro;
      sCEP    := CEP;
      sCidade := Cidade;
      sFone   := Fone;
      sFax    := Fax;
      sCPFCNPJ := CPFCGC;
      sRGCGF   := CPFCGC;
    end;
  end
  else //Compra ou Dev. de Compra
  Begin
    with Fornecedor1 do
    Begin
      Close;
      if (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 360) then //Compra
        ParamByName('FOR_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('FOR_CODIGO').asInteger
      else
        ParamByName('FOR_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('CLI_CODIGO').asInteger;      
      Open;
      CdCLIFOR := CodigoFOR;
      sRazao := RazaoSocial;
      iLogra := Logradouro;
      sEnde  := Endereco;
      sBairro := Bairro;
      sCEP    := CEP;
      sCidade := Cidade;
      sFone   := Fone;
      sFax    := Fax;
      sCPFCNPJ := CPFCGC;
      sRGCGF   := CPFCGC;
    end;
  end;

  if tag = 0 then
  Begin
    if fMxNotaFiscal.NotaFiscal1.DataEntradaSaida > 0 then
    Begin
      SZRLabel8.Caption:=FormatDateTime('dd/mm/yyyy',fMxNotaFiscal.NotaFiscal1.DataEntradaSaida);
      SZRLabel9.Caption:=FormatDateTime('hh:mm',fMxNotaFiscal.NotaFiscal1.DataEntradaSaida);
    end
    else
    Begin
      SZRLabel8.Caption:='';
      SZRLabel9.Caption:='';
    end;
  end
  else
  Begin
    SZRLabel8.Caption:=FormatDateTime('dd/mm/yyyy',Item_Nota_Fiscal1.FieldByName('NTF_DT_ENTRADA_SAIDA').asDateTime);
    SZRLabel9.Caption:=FormatDateTime('hh:mm',Item_Nota_Fiscal1.FieldByName('NTF_DT_ENTRADA_SAIDA').asDateTime);
  end;

  SZRLabel2.Caption := sRazao+' - '+IntToStr(CdCLIFOR);

  if (Trim(Item_Nota_Fiscal1.FieldByName('NTF_ENDERECO').asString) = '') then
    zrlEndereco.Caption:=Trim(DM.SelecionaParametro(iLogra)+' '+sEnde)
  else
    zrlEndereco.Caption:=Item_Nota_Fiscal1.FieldByName('NTF_ENDERECO').asString;

  if (Trim(Item_Nota_Fiscal1.FieldByName('NTF_BAIRRO').asString) = '') then
    zrlBairro.Caption := sBairro
  else
    zrlBairro.Caption:=Trim(Item_Nota_Fiscal1.FieldByName('NTF_BAIRRO').asString);

  if (Trim(Item_Nota_Fiscal1.FieldByName('NTF_CEP').asString) = '') then
    zrlCEP.Caption := sCEP
  else
    zrlCEP.Caption:=Trim(Item_Nota_Fiscal1.FieldByName('NTF_CEP').asString);

  if (Trim(Item_Nota_Fiscal1.FieldByName('NTF_MUNICIPIO').asString) = '') then
    zrlMunicipio.Caption := sCidade
  else
    zrlMunicipio.Caption:=Trim(Item_Nota_Fiscal1.FieldByName('NTF_MUNICIPIO').asString);

  if (Trim(Item_Nota_Fiscal1.FieldByName('NTF_UF').asString) = '') then
    zrlUF.Caption := sUf
  else
    zrlUF.Caption:=Trim(Item_Nota_Fiscal1.FieldByName('NTF_UF').asString);

  zrlCPF_CNPJ.Caption := sCPFCNPJ;
  zrlFoneFax.Caption  := sFone+' /'+sFax;
  zrlCGF_RG.Caption   := sRGCGF;
end;

procedure Trpt_NotaFiscal.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sOBS: TStringList;
begin
  report.CurrentY := 29;

  if Item_Nota_Fiscal1.FieldByname('NTF_TIPO_NOTA').asInteger = 360 then //Pedido de Compra
    zrlFrete.Caption := format('%.2f',[Item_Nota_Fiscal1.FieldByname('NTF_FRETE').asFloat*
                                       Item_Nota_Fiscal1.FieldByname('NTF_TOTAL_PRODUTO').asFloat/100])
  else
    zrlFrete.Caption := format('%.2f',[Item_Nota_Fiscal1.FieldByname('NTF_FRETE').asFloat]);

  sOBS :=  TStringList.Create;
  Transportadora1.Close;
  if tag = 0 then
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=fMxNotaFiscal.NotaFiscal1.CodigoTRN
  else
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByname('TRN_CODIGO').asInteger;
  Transportadora1.Open;

  SZRLabel38.Caption := Transportadora1.RazaoSocial;
  SZRLabel39.Caption := Trim(DM.SelecionaParametro(Transportadora1.Logradouro)+' '+Transportadora1.Endereco);
  SZRLabel40.Caption := Transportadora1.Cidade;
  SZRLabel41.Caption := Transportadora1.Uf;
  SZRLabel42.Caption := Transportadora1.CPFCGC;
  SZRLabel43.Caption := Transportadora1.IE;

  //Dados Adicionais
  if tag = 0 then
  Begin
    with fmxNotaFiscal do
    Begin
      SZRLabel23.Caption := memObservacao.Lines[0];
      SZRLabel24.Caption := memObservacao.Lines[1];
      SZRLabel25.Caption := memObservacao.Lines[2];
      SZRLabel26.Caption := memObservacao.Lines[3];
      SZRLabel27.Caption := memObservacao.Lines[4];
      SZRLabel28.Caption := memObservacao.Lines[5];
      SZRLabel29.Caption := memObservacao.Lines[6];
      SZRLabel30.Caption := memObservacao.Lines[7];
    end;
  end
  else
  Begin
    sOBS.Text := Item_Nota_Fiscal1.FieldByName('NTF_OBSERVACAO').asString;
    if sOBS.Count >= 1 then
      SZRLabel23.Caption := sOBS.Strings[0];
    if sOBS.Count >= 2 then
      SZRLabel24.Caption := sOBS.Strings[1];
    if sOBS.Count >= 3 then
      SZRLabel25.Caption := sOBS.Strings[2];
    if sOBS.Count >= 4 then
      SZRLabel26.Caption := sOBS.Strings[3];
    if sOBS.Count >= 5 then
      SZRLabel27.Caption := sOBS.Strings[4];
    if sOBS.Count >= 6 then
      SZRLabel28.Caption := sOBS.Strings[5];
    if sOBS.Count >= 7 then
      SZRLabel29.Caption := sOBS.Strings[6];
    if sOBS.Count >= 8 then
      SZRLabel30.Caption := sOBS.Strings[7];
  end;
end;

procedure Trpt_NotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Item_Nota_Fiscal1.Close;
   Action:=cafree;
end;

procedure Trpt_NotaFiscal.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
    if CodigoPRD <> Item_Nota_Fiscal1.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=Item_Nota_Fiscal1.CodigoPRD;
      Open;
    end;
    SZRLabel12.Caption:=Copy(Unidade,1,2);
  end;
  TotalQuantidade:=TotalQuantidade+Item_Nota_Fiscal1.Quantidade;
  Desc1:=Desc1+Item_Nota_Fiscal1.Desconto;
{  Classificacao_fiscal1.Close;
  if Produto1.CodigoCLF > 0 then
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=1
  else
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCLF;
  Classificacao_fiscal1.Open;
}
  SZRLabel1.Caption := '0';
end;

procedure Trpt_NotaFiscal.SZRDBText8BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal1.FieldByName('NTF_QUANTIDADE').asFloat = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscal.SZRDBText6BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal1.FieldByName('NTF_PESO_BRUTO').asFloat = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscal.SZRDBText7BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal1.FieldByName('NTF_PESO_LIQUIDO').asFloat = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscal.SZRDBText28BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal1.FieldByName('INF_QUANTIDADE').asFloat <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscal.SZRDBText3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal1.FieldByName('INF_PRECO').asFloat <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscal.SZRExpression1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal1.FieldByName('INF_QUANTIDADE').asFloat <= 0) OR
     (Item_Nota_Fiscal1.FieldByName('INF_PRECO').asFloat <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscal.SZRDBText5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal1.FieldByName('INF_ALIQUOTA').asInteger <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscal.SZRExpression2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 368) then //Serviço
    DoPrint := False;
end;

procedure Trpt_NotaFiscal.SZRDBText4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal1.FieldByName('NTF_CFOP').asInteger > 0) then
    DoPrint := True
  else
    DoPrint := False;
end;

end.
