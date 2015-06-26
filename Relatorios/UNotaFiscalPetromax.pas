unit UNotaFiscalPetromax;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Fornecedor,
  Funcionario, Titulo_receber, Extenso, Classificacao_fiscal,
  Transportadora, Cliente, Produto, OperFisc, Item_Nota_Fiscal;

type
  Trpt_NotaFiscalPetromax = class(TForm)
    report: TSZReport;
    Item_Nota_Fiscal10: TItem_Nota_Fiscal;
    OperFiscal1: TOperFiscal;
    Item_Nota_Fiscal10INF_CODIGO: TIntegerField;
    Item_Nota_Fiscal10CNC_CODIGO: TIntegerField;
    Item_Nota_Fiscal10NTF_CODIGO: TIntegerField;
    Item_Nota_Fiscal10PRD_CODIGO: TIntegerField;
    Item_Nota_Fiscal10INF_SERVICO: TStringField;
    Item_Nota_Fiscal10INF_QUANTIDADE: TFloatField;
    Item_Nota_Fiscal10INF_PRECO: TFloatField;
    Item_Nota_Fiscal10INF_DESCONTO: TFloatField;
    Item_Nota_Fiscal10INF_TIPO_ALIQUOTA: TIntegerField;
    Item_Nota_Fiscal10INF_ALIQUOTA: TFloatField;
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
    zrlCliente: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCPF_CNPJ: TSZRLabel;
    zrlCEP: TSZRLabel;
    zrlMunicipio: TSZRLabel;
    zrlFoneFax: TSZRLabel;
    zrlUF: TSZRLabel;
    zrlCGF_RG: TSZRLabel;
    ZRBand5: TSZRBand;
    SZRBand1: TSZRBand;
    ZRDBText9: TSZRDBText;
    SZRDBText28: TSZRDBText;
    SZRLabel12: TSZRLabel;
    SZRExpression1: TSZRExpression;
    zrlNaturezaDaOperacao: TSZRLabel;
    Item_Nota_Fiscal10USU_CODIGO: TIntegerField;
    Item_Nota_Fiscal10CNC_CLIENTE: TIntegerField;
    Item_Nota_Fiscal10CLI_CODIGO: TIntegerField;
    Item_Nota_Fiscal10FOR_CODIGO: TIntegerField;
    Item_Nota_Fiscal10FUN_CODIGO: TIntegerField;
    Item_Nota_Fiscal10TRN_CODIGO: TIntegerField;
    Item_Nota_Fiscal10CAG_CODIGO: TIntegerField;
    Item_Nota_Fiscal10NTF_DT_CADASTRO: TDateTimeField;
    Item_Nota_Fiscal10NTF_DT_ALTERADO: TDateTimeField;
    Item_Nota_Fiscal10NTF_DT_EMISSAO: TDateTimeField;
    Item_Nota_Fiscal10NTF_DT_ENTRADA_SAIDA: TDateTimeField;
    Item_Nota_Fiscal10NTF_ENTRADA_SAIDA: TIntegerField;
    Item_Nota_Fiscal10NTF_TIPO_NOTA: TIntegerField;
    Item_Nota_Fiscal10NTF_NOTA_FISCAL: TIntegerField;
    Item_Nota_Fiscal10NTF_SERIE: TStringField;
    Item_Nota_Fiscal10NTF_SUBSERIE: TStringField;
    Item_Nota_Fiscal10NTF_AIDF: TIntegerField;
    Item_Nota_Fiscal10NTF_CFOP: TIntegerField;
    Item_Nota_Fiscal10NTF_BASE_ICMS: TFloatField;
    Item_Nota_Fiscal10NTF_ICMS: TFloatField;
    Item_Nota_Fiscal10NTF_BASE_ICMS_SUB: TFloatField;
    Item_Nota_Fiscal10NTF_ICMS_SUB: TFloatField;
    Item_Nota_Fiscal10NTF_TOTAL_PRODUTO: TFloatField;
    Item_Nota_Fiscal10NTF_TOTAL_NOTA: TFloatField;
    Item_Nota_Fiscal10NTF_FRETE: TFloatField;
    Item_Nota_Fiscal10NTF_SEGURO: TFloatField;
    Item_Nota_Fiscal10NTF_OUTRAS: TFloatField;
    Item_Nota_Fiscal10NTF_IPI: TFloatField;
    Item_Nota_Fiscal10NTF_TIPO_TRANSPORTE: TIntegerField;
    Item_Nota_Fiscal10NTF_TIPO_FRETE: TIntegerField;
    Item_Nota_Fiscal10NTF_PLACA: TStringField;
    Item_Nota_Fiscal10NTF_PLACA_UF: TStringField;
    Item_Nota_Fiscal10NTF_QUANTIDADE: TFloatField;
    Item_Nota_Fiscal10NTF_ESPECIE: TStringField;
    Item_Nota_Fiscal10NTF_MARCA: TStringField;
    Item_Nota_Fiscal10NTF_NUMERO: TStringField;
    Item_Nota_Fiscal10NTF_PESO_BRUTO: TFloatField;
    Item_Nota_Fiscal10NTF_PESO_LIQUIDO: TFloatField;
    Item_Nota_Fiscal10NTF_SITUACAO: TIntegerField;
    SZRDBText3: TSZRDBText;
    SZRDBText5: TSZRDBText;
    Item_Nota_Fiscal10CT: TStringField;
    SZRLabel1: TSZRLabel;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Item_Nota_Fiscal10NTF_PEDIDO: TIntegerField;
    Item_Nota_Fiscal10NTF_SELO: TIntegerField;
    Item_Nota_Fiscal10NTF_OBSERVACAO: TStringField;
    SZRLabel103: TSZRLabel;
    SZRLabel143: TSZRLabel;
    SZRLabel104: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel48: TSZRLabel;
    ValorPorExtenso1: TValorPorExtenso;
    Titulo_receber1: TTitulo_receber;
    SZRLabel4: TSZRLabel;
    Funcionario1: TFuncionario;
    SZRLabel62: TSZRLabel;
    Item_Nota_Fiscal10NTF_ICMS_FRETE: TFloatField;
    Item_Nota_Fiscal10NTF_CONHECIMENTO: TIntegerField;
    SZRLabel64: TSZRLabel;
    SZRLabel65: TSZRLabel;
    SZRBand2: TSZRBand;
    SZRDBText17: TSZRDBText;
    SZRDBText18: TSZRDBText;
    SZRDBText24: TSZRDBText;
    SZRDBText25: TSZRDBText;
    SZRDBText26: TSZRDBText;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRExpression2: TSZRExpression;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel43: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRDBText9: TSZRDBText;
    SZRDBText11: TSZRDBText;
    SZRDBText12: TSZRDBText;
    SZRDBText13: TSZRDBText;
    SZRDBText14: TSZRDBText;
    SZRDBText15: TSZRDBText;
    SZRDBText16: TSZRDBText;
    SZRDBText19: TSZRDBText;
    SZRDBText20: TSZRDBText;
    SZRDBText22: TSZRDBText;
    SZRDBText23: TSZRDBText;
    SZRDBText29: TSZRDBText;
    SZRLabel59: TSZRLabel;
    SZRLabel60: TSZRLabel;
    SZRLabel61: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel63: TSZRLabel;
    SZRDBText8: TSZRDBText;
    Item_Nota_Fiscal10NTF_ISS: TFloatField;
    Item_Nota_Fiscal10NTF_BASE_ISS: TFloatField;
    Item_Nota_Fiscal10CNC_PEDIDO: TIntegerField;
    Item_Nota_Fiscal10NTF_ENDERECO: TStringField;
    Item_Nota_Fiscal10NTF_BAIRRO: TStringField;
    Item_Nota_Fiscal10NTF_MUNICIPIO: TStringField;
    Item_Nota_Fiscal10NTF_UF: TStringField;
    Item_Nota_Fiscal10NTF_CEP: TStringField;
    Item_Nota_Fiscal10NTF_NOTA_CUPOM: TIntegerField;
    Item_Nota_Fiscal10NTF_AVULSA: TIntegerField;
    Item_Nota_Fiscal10NTF_COD_PAGAMENTO: TIntegerField;
    Item_Nota_Fiscal10CNC_CODIGO_1: TIntegerField;
    Item_Nota_Fiscal10NTF_CODIGO_1: TIntegerField;
    Fornecedor1: TFornecedor;
    Item_Nota_Fiscal10NTF_TOTAL_SERVICO: TFloatField;
    Item_Nota_Fiscal10FUN_ARQUITETO: TIntegerField;
    Item_Nota_Fiscal10CNC_ORIGEM: TIntegerField;
    Item_Nota_Fiscal10INF_ALIQUOTA_IPI: TFloatField;
    Item_Nota_Fiscal10CNC_ORIGEM_1: TIntegerField;
    SZRDBText21: TSZRDBText;
    Item_Nota_Fiscal10NTF_COD_PAGAMENTO_2: TIntegerField;
    Item_Nota_Fiscal10INF_BONIFICACAO: TFloatField;
    SZRDBText27: TSZRDBText;
    zrlProduto: TSZRLabel;
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
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Desc1,TotalQuantidade:Double;
  end;

var
  rpt_NotaFiscalPetromax: Trpt_NotaFiscalPetromax;

implementation
uses
 UDM, Funcoes, MxNotaFiscal, MxTransferencia;

{$R *.DFM}

procedure Trpt_NotaFiscalPetromax.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  S, sRazao, sEnde, sBairro, sCEP, sCidade, sUF, sFone, sFax, sCPFCNPJ, sRGCGF:string;
  I, iLogra, CdCLIFOR:integer;
begin
  TotalQuantidade:=0;
  OperFiscal1.Close;
  if tag = 0 then
    OperFiscal1.ParamByName('OPF_CODIGO').asInteger:=fMxNotaFiscal.NotaFiscal1.CFOP
  else
    OperFiscal1.ParamByName('OPF_CODIGO').asInteger:=Item_Nota_Fiscal10.FieldByName('NTF_CFOP').asInteger;
  OperFiscal1.Open;
  if (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 366) then //Demonstração da Loja
  Begin
    if Item_Nota_Fiscal10.FieldByName('NTF_ENTRADA_SAIDA').asInteger = 0 then
      zrlNaturezaDaOperacao.Caption:='RETORNO DE DEMONSTRACAO'
    else
      zrlNaturezaDaOperacao.Caption:='DEMONSTRACAO';
    if (StrToInt(Copy(IntToStr(Item_Nota_Fiscal10.FieldByName('NTF_CFOP').asInteger),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)'
  end
  else if Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 365 then //Transferência
  Begin
    zrlNaturezaDaOperacao.Caption := 'TRANSFERENCIA';
    if fMxTransfer.Entidade.Automatica then
      SZRLabel62.Enabled := True;
  end
  else if Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 363 then //Correção
  Begin
    zrlNaturezaDaOperacao.Caption := 'CORRECAO DE DADOS';
    if (StrToInt(Copy(IntToStr(Item_Nota_Fiscal10.FieldByName('NTF_CFOP').asInteger),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)';
  end
  else if Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 361 then //Venda
  Begin
    zrlNaturezaDaOperacao.Caption := 'VENDA DE MERCADORIA';
    if (StrToInt(Copy(IntToStr(Item_Nota_Fiscal10.FieldByName('NTF_CFOP').asInteger),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)';
  end
  else if Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 368 then //Serviço
    zrlNaturezaDaOperacao.Caption := 'PRESTACAO DE SERVICO'
  else if Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 1030 then //Mostruário
    zrlNaturezaDaOperacao.Caption := 'MOSTRUARIO'
  else if Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 4450 then //REMESSA DE TROCA
    zrlNaturezaDaOperacao.Caption := 'REMESSA DE TROCA'
  else if Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 4490 then //REMESSA EM GARANTIA
    zrlNaturezaDaOperacao.Caption := 'REMESSA EM GARANTIA'
  else //Outra Nota
    zrlNaturezaDaOperacao.Caption:=OperFiscal1.Descricao;

  if (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger <> 368) then //<> Serviço
    if Item_Nota_Fiscal10.FieldByName('NTF_ENTRADA_SAIDA').asInteger = 1 then
      zrlMarcaSaida.Enabled := True  //Saída
    else
      zrlMarcaEntrada.Enabled := True; //Entrada
  if Item_Nota_Fiscal10.FieldByName('NTF_DT_EMISSAO').asDateTime > 0 then
    zrlDataEmissao.Caption:=FormatDateTime('dd/mm/yyyy',Item_Nota_Fiscal10.FieldByName('NTF_DT_EMISSAO').asDateTime)
  else
    zrlDataEmissao.Caption:='';


  if (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger <> 360) and //Compra
     (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger <> 369) and //Conhecimento
     (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger <> 451) and //Imobilizado     
     (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger <> 4240) and //Aquisição
     (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger <> 4450) and //REMESSA DE TROCA
     (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger <> 4490) and //REMESSA EM GARANTIA          
     (Item_Nota_Fiscal10.FieldByName('NTF_CFOP').asInteger <> 5202) and     //Dev. Compra
     (Item_Nota_Fiscal10.FieldByName('NTF_CFOP').asInteger <> 6202) then    //Dev. Compra
  Begin
    with Cliente1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=Item_Nota_Fiscal10.FieldByName('CNC_CLIENTE').asInteger;
      ParamByName('CLI_CODIGO').asInteger:=Item_Nota_Fiscal10.FieldByName('CLI_CODIGO').asInteger;
      Open;
      CdCLIFOR := CodigoCLI;
      sRazao := RazaoSocial;
      iLogra := Logradouro;
      sEnde  := Endereco;
      sBairro := Bairro;
      sCEP    := CEP;
      sCidade := Cidade;
      sUF     := Uf;
      sFone   := Fone;
      sFax    := Fax;
      sCPFCNPJ := CPFCGC;
      sRGCGF  := CGFRG;
    end;
  end
  else if (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 369) then //Conhecimento
  Begin
    with Transportadora1 do
    Begin
      Close;
      ParamByName('TRN_CODIGO').asInteger:=Item_Nota_Fiscal10.FieldByName('CLI_CODIGO').asInteger;
      Open;
      CdCLIFOR := CodigoTRN;
      sRazao := RazaoSocial;
      iLogra := Logradouro;
      sEnde  := Endereco;
      sBairro := Bairro;
      sCEP    := CEP;
      sCidade := Cidade;
      sUF     := Uf;
      sFone   := Fone;
      sFax    := Fax;
      sCPFCNPJ := CPFCGC;
      sRGCGF   := CPFCGC;
    end;
  end
  else //Compra ou Dev. Compra
  Begin
    with Fornecedor1 do
    Begin
      Close;
      if (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 360) then //Compra
        ParamByName('FOR_CODIGO').asInteger:=Item_Nota_Fiscal10.FieldByName('FOR_CODIGO').asInteger
      else
        ParamByName('FOR_CODIGO').asInteger:=Item_Nota_Fiscal10.FieldByName('CLI_CODIGO').asInteger;
      Open;
      CdCLIFOR := CodigoFOR;
      sRazao := RazaoSocial;
      iLogra := Logradouro;
      sEnde  := Endereco;
      sBairro := Bairro;
      sCEP    := CEP;
      sCidade := Cidade;
      sUF     := Uf;
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
    SZRLabel8.Caption:=FormatDateTime('dd/mm/yyyy',Item_Nota_Fiscal10.FieldByName('NTF_DT_ENTRADA_SAIDA').asDateTime);
    SZRLabel9.Caption:=FormatDateTime('hh:mm',Item_Nota_Fiscal10.FieldByName('NTF_DT_ENTRADA_SAIDA').asDateTime);
  end;

  zrlCliente.Caption := sRazao+' - '+IntToStr(CdCLIFOR);

  if Trim(Item_Nota_Fiscal10.FieldByName('NTF_ENDERECO').asString) = '' then
    zrlEndereco.Caption:=Trim(DM.SelecionaParametro(iLogra)+' '+sEnde)
  else
    zrlEndereco.Caption:=Item_Nota_Fiscal10.FieldByName('NTF_ENDERECO').asString;

  if (Trim(Item_Nota_Fiscal10.FieldByName('NTF_BAIRRO').asString) = '') then
    zrlBairro.Caption := sBairro
  else
    zrlBairro.Caption:=Trim(Item_Nota_Fiscal10.FieldByName('NTF_BAIRRO').asString);

  if (Trim(Item_Nota_Fiscal10.FieldByName('NTF_CEP').asString) = '') then
    zrlCEP.Caption := sCEP
  else
    zrlCEP.Caption:=Trim(Item_Nota_Fiscal10.FieldByName('NTF_CEP').asString);

  if (Trim(Item_Nota_Fiscal10.FieldByName('NTF_MUNICIPIO').asString) = '') then
    zrlMunicipio.Caption := sCidade
  else
    zrlMunicipio.Caption:=Trim(Item_Nota_Fiscal10.FieldByName('NTF_MUNICIPIO').asString);

  if (Trim(Item_Nota_Fiscal10.FieldByName('NTF_UF').asString) = '') then
    zrlUF.Caption := sUf
  else
    zrlUF.Caption:=Trim(Item_Nota_Fiscal10.FieldByName('NTF_UF').asString);

  zrlCPF_CNPJ.Caption := sCPFCNPJ;
  zrlFoneFax.Caption  := sFone+' /'+sFax;
  zrlCGF_RG.Caption   := sRGCGF;

  if Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 361 then //Vendas
  Begin
    Titulo_receber1.Close;
    Titulo_receber1.ParamByName('CNC_CODIGO').asInteger:=Item_Nota_Fiscal10.CodigoCNC;
    Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=Item_Nota_Fiscal10.FieldByName('NTF_PEDIDO').asInteger;
    Titulo_receber1.Open;
    for i:=1 to Titulo_receber1.RecordCount do
    Begin
      if i = 1 then
      Begin
        if Titulo_receber1.CodigoBOL > 0 then
          SZRLabel143.Caption:=IntToStr(Titulo_receber1.CodigoBOL)
        else
          SZRLabel143.Caption:='';
        SZRLabel103.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel104.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 2 then
      Begin
        if Titulo_receber1.CodigoBOL > 0 then
          SZRLabel13.Caption:=IntToStr(Titulo_receber1.CodigoBOL)
        else
          SZRLabel13.Caption:='';
        SZRLabel11.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel14.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 3 then
      Begin
        if Titulo_receber1.CodigoBOL > 0 then
          SZRLabel16.Caption:=IntToStr(Titulo_receber1.CodigoBOL)
        else
          SZRLabel16.Caption:='';
        SZRLabel15.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel17.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end;
      Titulo_receber1.Next;
    end;
  end;

  if Item_Nota_Fiscal10.fieldbyname('NTF_TOTAL_NOTA').asfloat > 0 then
  Begin
    ValorPorExtenso1.Valor:=Item_Nota_Fiscal10.fieldbyname('NTF_TOTAL_NOTA').asfloat;
    S := ValorPorExtenso1.Texto;
    SZRLabel48.Caption:='('+PreencheD(UpperCase(S)+' ','#',116)+')';
  end;
end;

procedure Trpt_NotaFiscalPetromax.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel65.Caption:=format('%.2f',[Desc1]);
end;

procedure Trpt_NotaFiscalPetromax.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Item_Nota_Fiscal10.Close;
   Action:=cafree;
end;

procedure Trpt_NotaFiscalPetromax.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao: string;
begin
  TotalQuantidade:=TotalQuantidade+Item_Nota_Fiscal10.Quantidade;
  with Produto1 do
  Begin
    if CodigoPRD <> Item_Nota_Fiscal10.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=Item_Nota_Fiscal10.CodigoPRD;
      Open;
    end;
    SZRLabel12.Caption := Copy(Unidade,1,2);
  end;

  Desc1:=Desc1+Item_Nota_Fiscal10.Desconto;

  SZRLabel1.Caption := '0';

  if Trim(Item_Nota_Fiscal10.Descricao) <> '' then
    sDescricao := Item_Nota_Fiscal10.Descricao
  else
    sDescricao := Produto1.Descricao;

  if Length(sDescricao) <= zrlProduto.Width then
    zrlProduto.Caption := sDescricao
  else
    zrlProduto.Caption := Copy(sDescricao, 1, zrlProduto.Width);
end;

procedure Trpt_NotaFiscalPetromax.SZRDBText8BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal10.FieldByName('NTF_QUANTIDADE').asFloat = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalPetromax.SZRDBText6BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal10.FieldByName('NTF_PESO_BRUTO').asFloat = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalPetromax.SZRDBText7BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal10.FieldByName('NTF_PESO_LIQUIDO').asFloat = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalPetromax.SZRDBText28BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal10.FieldByName('INF_QUANTIDADE').asFloat <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalPetromax.SZRDBText3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal10.FieldByName('INF_PRECO').asFloat <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalPetromax.SZRExpression1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal10.FieldByName('INF_QUANTIDADE').asFloat <= 0) OR
     (Item_Nota_Fiscal10.FieldByName('INF_PRECO').asFloat <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalPetromax.SZRDBText5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal10.FieldByName('INF_ALIQUOTA').asInteger <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalPetromax.SZRExpression2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal10.FieldByName('NTF_TIPO_NOTA').asInteger = 368) then //Serviço
    DoPrint := False;
end;

procedure Trpt_NotaFiscalPetromax.SZRDBText4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal10.FieldByName('NTF_CFOP').asInteger > 0) then
    DoPrint := True
  else
    DoPrint := False;
end;

procedure Trpt_NotaFiscalPetromax.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sOBS: TStringList;
begin
  report.CurrentY := 48;

  if Item_Nota_Fiscal10.FieldByname('NTF_TIPO_NOTA').asInteger = 360 then //Pedido de Compra
    zrlFrete.Caption := format('%.2f',[Item_Nota_Fiscal10.FieldByname('NTF_FRETE').asFloat*
                                       Item_Nota_Fiscal10.FieldByname('NTF_TOTAL_PRODUTO').asFloat/100])
  else
    zrlFrete.Caption := format('%.2f',[Item_Nota_Fiscal10.FieldByname('NTF_FRETE').asFloat]);

  sOBS :=  TStringList.Create;
  if TotalQuantidade > 0 then
    SZRLabel63.Caption:=format('%.2f',[TotalQuantidade])
  else
    SZRLabel63.Caption:='';
  Transportadora1.Close;
  if tag = 0 then
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=fMxNotaFiscal.NotaFiscal1.CodigoTRN
  else
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=Item_Nota_Fiscal10.FieldByname('TRN_CODIGO').asInteger;
  Transportadora1.Open;

  SZRLabel38.Caption := Transportadora1.RazaoSocial;
  SZRLabel39.Caption := Trim(DM.SelecionaParametro(Transportadora1.Logradouro)+' '+Transportadora1.Endereco);
  SZRLabel40.Caption := Transportadora1.Cidade;
  SZRLabel41.Caption := Transportadora1.Uf;
  SZRLabel42.Caption := Transportadora1.CPFCGC;
  SZRLabel43.Caption := Transportadora1.IE;
  //Vendedor
  Funcionario1.Close;
  Funcionario1.ParamByName('CNC_CODIGO').asInteger:=Item_Nota_Fiscal10.CodigoCNC;
  Funcionario1.ParamByName('FUN_CODIGO').asInteger:=Item_Nota_Fiscal10.FieldByName('FUN_CODIGO').asInteger;
  Funcionario1.Open;
  if not Funcionario1.IsEmpty then
  Begin
    SZRLabel60.Caption:=Item_Nota_Fiscal10.FieldByName('FUN_CODIGO').asString;
    SZRLabel59.Caption:=Funcionario1.Apelido;
  end
  else
  Begin
    SZRLabel60.Caption:=Item_Nota_Fiscal10.FieldByName('USU_CODIGO').asString;
    SZRLabel59.Caption:='Usuario';
  end;
  //Dados Adicionais
  if tag = 0 then
  Begin
    with fmxNotaFiscal do
    Begin
      SZRLabel23.Caption := memObservacao.Lines[0];
      SZRLabel24.Caption := memObservacao.Lines[1];
      SZRLabel25.Caption := memObservacao.Lines[2];
    end;
  end
  else
  Begin
    sOBS.Text := Item_Nota_Fiscal10.FieldByName('NTF_OBSERVACAO').asString;
    if sOBS.Count >= 1 then
      SZRLabel23.Caption := sOBS.Strings[0];
    if sOBS.Count >= 2 then
      SZRLabel24.Caption := sOBS.Strings[1];
    if sOBS.Count >= 3 then
      SZRLabel25.Caption := sOBS.Strings[2];
  end;
end;

end.
