unit UNotaFiscalMotCalServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, NotaFiscal, Produto,
  Fornecedor, Funcionario, Titulo_receber, Classificacao_fiscal,
  Transportadora, Cliente, OperFisc, Item_Nota_Fiscal;

type
  Trpt_NotaFiscalMotCalServico = class(TForm)
    report: TSZReport;
    Item_Nota_Fiscal10: TItem_Nota_Fiscal;
    OperFiscal1: TOperFiscal;
    Cliente1: TCliente;
    Transportadora1: TTransportadora;
    SZRGroup1: TSZRGroup;
    ZRBand5: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRDBText9: TSZRDBText;
    SZRDBText28: TSZRDBText;
    zrlUnidade: TSZRLabel;
    SZRExpression1: TSZRExpression;
    SZRDBText3: TSZRDBText;
    zrlAliquota: TSZRDBText;
    zrlCT: TSZRLabel;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Titulo_receber1: TTitulo_receber;
    Funcionario1: TFuncionario;
    SZRLabel64: TSZRLabel;
    zrlDesconto: TSZRLabel;
    Fornecedor1: TFornecedor;
    zrlProduto: TSZRLabel;
    Produto1: TProduto;
    NotaFiscal10: TNotaFiscal;
    SZRBand3: TSZRBand;
    zrlMarcaSaida: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlRazaoSocial: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCPF_CNPJ: TSZRLabel;
    zrlMunicipio: TSZRLabel;
    zrlFoneFax: TSZRLabel;
    zrlUF: TSZRLabel;
    zrlCGFRG: TSZRLabel;
    zrlNaturezaDaOperacao: TSZRLabel;
    SZRLabel103: TSZRLabel;
    SZRLabel143: TSZRLabel;
    SZRLabel104: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel45: TSZRLabel;
    SZRLabel46: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel53: TSZRLabel;
    SZRLabel54: TSZRLabel;
    SZRLabel56: TSZRLabel;
    SZRLabel57: TSZRLabel;
    zrlMarcaOFF: TSZRLabel;
    SZRLabel58: TSZRLabel;
    SZRLabel55: TSZRLabel;
    SZRLabel47: TSZRLabel;
    SZRLabel44: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlDataEmissao: TSZRLabel;
    zrlCEP: TSZRLabel;
    zrlMarcaEntrada: TSZRLabel;
    SZRDBText27: TSZRDBText;
    zrbRodapePagina: TSZRBand;
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
    zrlTotalServico: TSZRLabel;
    zrlBaseISS: TSZRLabel;
    zrlAliquotaISS: TSZRLabel;
    zrlISS: TSZRLabel;
    SZRDBText21: TSZRDBText;
    SZRDBText22: TSZRDBText;
    SZRDBText23: TSZRDBText;
    SZRDBText29: TSZRDBText;
    SZRLabel59: TSZRLabel;
    SZRLabel60: TSZRLabel;
    SZRDBText1: TSZRDBText;
    zrlTotalQuantidade: TSZRLabel;
    SZRDBText8: TSZRDBText;
    zrlNumeroInscricao: TSZRLabel;
    SZRLabel61: TSZRLabel;
    zrlBaseICMS: TSZRLabel;
    zrlTotalFrete: TSZRLabel;
    zrlICMS: TSZRLabel;
    zrlTotalSeguro: TSZRLabel;
    zrlBaseICMSSub: TSZRLabel;
    zrlTotalOutras: TSZRLabel;
    zrlICMSSub: TSZRLabel;
    zrlTotalIPI: TSZRLabel;
    zrlTotalProdutos: TSZRLabel;
    zrlTotalNota: TSZRLabel;
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRDBText8BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRDBText6BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRDBText7BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRDBText28BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRDBText3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRExpression1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrlAliquotaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRExpression2BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRDBText4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Item_Nota_Fiscal10AfterOpen(DataSet: TDataSet);
    procedure SZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    iQtdItens, iPagina: integer;
    Desc1,TotalQuantidade:Double;
    VendaPrazo:Boolean;
  end;

var
  rpt_NotaFiscalMotCalServico: Trpt_NotaFiscalMotCalServico;

implementation
uses
 UDM, Funcoes, MxNotaFiscal, MxTransferencia;

{$R *.DFM}

procedure Trpt_NotaFiscalMotCalServico.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Desc1 > 0 then
    zrlDesconto.Caption:=format('%.2f',[Desc1])
  else
  Begin
    SZRLabel64.Enabled := False;
    zrlDesconto.Enabled := False;
  end;
end;

procedure Trpt_NotaFiscalMotCalServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Item_Nota_Fiscal10.Close;
   Action:=cafree;
end;

procedure Trpt_NotaFiscalMotCalServico.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalQuantidade:=TotalQuantidade+Item_Nota_Fiscal10.Quantidade;
  with Produto1 do
  Begin
    if Item_Nota_Fiscal10.CodigoPRD <> CodigoSGP then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Item_Nota_Fiscal10.CodigoPRD;
      Open;
    end;
    zrlUnidade.Caption := Unidade;
  end;
  Desc1:=Desc1+Item_Nota_Fiscal10.Desconto;
  if Item_Nota_Fiscal10.IsEmpty then
    zrlCT.Caption := '0'
  else
    zrlCT.Enabled := False;

  zrlProduto.Caption := Item_Nota_Fiscal10.Descricao;

  inc(iQtdItens);
end;

procedure Trpt_NotaFiscalMotCalServico.SZRDBText8BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if NotaFiscal10.Quantidade = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCalServico.SZRDBText6BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if NotaFiscal10.PesoBruto = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCalServico.SZRDBText7BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if NotaFiscal10.PesoLiquido = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCalServico.SZRDBText28BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal10.Quantidade <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalMotCalServico.SZRDBText3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal10.ValorUnit <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalMotCalServico.SZRExpression1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal10.Quantidade <= 0) OR
     (Item_Nota_Fiscal10.ValorUnit <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalMotCalServico.zrlAliquotaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal10.Aliquota <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalMotCalServico.SZRExpression2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (NotaFiscal10.TipoNota = 368) then //Serviço
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCalServico.SZRDBText4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (NotaFiscal10.CFOP > 0) then
    DoPrint := True
  else
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCalServico.FormCreate(Sender: TObject);
begin
  VendaPrazo := False;
  SZRGroup1.Height := 0;
  iPagina := 0;
end;

procedure Trpt_NotaFiscalMotCalServico.Item_Nota_Fiscal10AfterOpen(
  DataSet: TDataSet);
begin
  NotaFiscal10.Close;
  NotaFiscal10.ParamByName('CNC_ORIGEM').asInteger := Item_Nota_Fiscal10.CNCOrigem;
  NotaFiscal10.ParamByName('CNC_CODIGO').asInteger := Item_Nota_Fiscal10.CodigoCNC;
  NotaFiscal10.ParamByName('NTF_CODIGO').asInteger := Item_Nota_Fiscal10.CodigoNTF;
  NotaFiscal10.Open;
end;

procedure Trpt_NotaFiscalMotCalServico.SZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sRazao, sEnde, sBairro, sCEP, sCidade, sUF, sFone, sFax, sCPFCNPJ, sRGCGF:string;
  I, iLogra, CdCLIFOR:integer;
begin
  TotalQuantidade:=0;
  OperFiscal1.Close;
  if tag = 0 then
    OperFiscal1.ParamByName('OPF_CODIGO').asInteger:=fMxNotaFiscal.NotaFiscal1.CFOP
  else
    OperFiscal1.ParamByName('OPF_CODIGO').asInteger:=NotaFiscal10.CFOP;
  OperFiscal1.Open;
  if (NotaFiscal10.TipoNota = 366) then //Demonstração
  Begin
    if NotaFiscal10.EntradaSaida = 0 then
      zrlNaturezaDaOperacao.Caption:='RETORNO DE DEMONSTRACAO'
    else
      zrlNaturezaDaOperacao.Caption:='DEMONSTRACAO';
    if (StrToInt(Copy(IntToStr(NotaFiscal10.CFOP),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)'
  end
  else if NotaFiscal10.TipoNota = 365 then //Transferência
  Begin
    zrlNaturezaDaOperacao.Caption := 'TRANSFERENCIA';
    if tag = 1 then //Transferência
      if fMxTransfer.Entidade.Automatica then
        zrlMarcaOFF.Enabled := True;
  end
  else if NotaFiscal10.TipoNota = 363 then //Correção
  Begin
    zrlNaturezaDaOperacao.Caption := 'CORRECAO DE DADOS';
    if (StrToInt(Copy(IntToStr(NotaFiscal10.CFOP),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)';
  end
  else if NotaFiscal10.TipoNota = 361 then //Venda
  Begin
    if VendaPrazo then
      zrlNaturezaDaOperacao.Caption := 'VENDA A PRAZO'
    else
      zrlNaturezaDaOperacao.Caption := 'VENDA A VISTA';
    if (StrToInt(Copy(IntToStr(NotaFiscal10.CFOP),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)';
  end
  else if NotaFiscal10.TipoNota = 368 then //Serviço
    zrlNaturezaDaOperacao.Caption := 'PRESTACAO DE SERVICO'
  else if NotaFiscal10.TipoNota = 1030 then //Mostruário
    zrlNaturezaDaOperacao.Caption := 'MOSTRUARIO'
  else if NotaFiscal10.TipoNota = 4450 then //REMESSA DE TROCA
    zrlNaturezaDaOperacao.Caption := 'REMESSA DE TROCA'
  else if NotaFiscal10.TipoNota = 4490 then //REMESSA EM GARANTIA
    zrlNaturezaDaOperacao.Caption := 'REMESSA EM GARANTIA'
  else //Outra Nota
    zrlNaturezaDaOperacao.Caption:=OperFiscal1.Descricao;

  if (NotaFiscal10.TipoNota <> 368) then //<> Serviço
    if NotaFiscal10.EntradaSaida = 1 then
      zrlMarcaSaida.Enabled := True  //Saída
    else
      zrlMarcaEntrada.Enabled := True; //Entrada
  if NotaFiscal10.DataEmissao > 0 then
   zrlDataEmissao.Caption:=FormatDateTime('dd/mm/yyyy',NotaFiscal10.DataEmissao)
  else
    zrlDataEmissao.Caption:='';

  if (NotaFiscal10.TipoNota <> 360) and //Compra
     (NotaFiscal10.TipoNota <> 369) and //Conhecimento
     (NotaFiscal10.TipoNota <> 451) and //Imobilizado     
     (NotaFiscal10.TipoNota <> 4240) and //Aquisição
     (NotaFiscal10.TipoNota <> 4450) and //REMESSA DE TROCA
     (NotaFiscal10.TipoNota <> 4490) and //REMESSA EM GARANTIA          
     (NotaFiscal10.CFOP <> 5202) and     //Dev. Compra
     (NotaFiscal10.CFOP <> 6202) then    //Dev. Compra
  Begin
    with Cliente1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=NotaFiscal10.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger:=NotaFiscal10.CodigoCLI;
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
  else if (NotaFiscal10.TipoNota = 369) then //Conhecimento
  Begin
    with Transportadora1 do
    Begin
      Close;
      ParamByName('TRN_CODIGO').asInteger:=NotaFiscal10.CodigoCLI;
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
  else
  Begin
    with Fornecedor1 do
    Begin
      Close;
      if (NotaFiscal10.TipoNota <> 360) then //Compra
        ParamByName('FOR_CODIGO').asInteger:=NotaFiscal10.CodigoFOR
      else
        ParamByName('FOR_CODIGO').asInteger:=NotaFiscal10.CodigoCLI;
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
    SZRLabel8.Caption:=FormatDateTime('dd/mm/yyyy',NotaFiscal10.DataEntradaSaida);
    SZRLabel9.Caption:=FormatDateTime('hh:mm',NotaFiscal10.DataEntradaSaida);
  end;

  zrlRazaoSocial.Caption := sRazao+' - '+IntToStr(CdCLIFOR);

  if (Trim(NotaFiscal10.Endereco) = '') then
    zrlEndereco.Caption:=Trim(DM.SelecionaParametro(iLogra)+' '+sEnde)
  else
    zrlEndereco.Caption:=NotaFiscal10.Endereco;

  if (Trim(NotaFiscal10.Bairro) = '') then
    zrlBairro.Caption := sBairro
  else
    zrlBairro.Caption:=Trim(NotaFiscal10.Bairro);

  if (Trim(NotaFiscal10.CEP) = '') then
    zrlCEP.Caption := sCEP
  else
    zrlCEP.Caption:=Trim(NotaFiscal10.CEP);

  if (Trim(NotaFiscal10.Municipio) = '') then
    zrlMunicipio.Caption := sCidade
  else
    zrlMunicipio.Caption:=Trim(NotaFiscal10.Municipio);

  if (Trim(NotaFiscal10.UF) = '') then
    zrlUF.Caption := sUF
  else
    zrlUF.Caption:=Trim(NotaFiscal10.UF);

  zrlFoneFax.Caption  := sFone+' /'+sFax;
  zrlCPF_CNPJ.Caption := sCPFCNPJ;
  zrlCGFRG.Caption    := sRGCGF;

  if NotaFiscal10.TipoNota = 361 then //Vendas
  Begin
    Titulo_receber1.Close;
    Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=NotaFiscal10.Pedido;
    Titulo_receber1.Open;
    for i:=1 to Titulo_receber1.RecordCount do
    Begin
      if i = 1 then
      Begin
        SZRLabel143.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel103.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel104.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 2 then
      Begin
        SZRLabel13.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel11.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel14.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 3 then
      Begin
        SZRLabel16.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel15.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel17.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 4 then
      Begin
        SZRLabel19.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel18.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel20.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 5 then
      Begin
        SZRLabel22.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel21.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel44.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 6 then
      Begin
        SZRLabel46.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel45.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel47.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 7 then
      Begin
        SZRLabel54.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel53.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel55.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 8 then
      Begin
        SZRLabel57.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        SZRLabel56.Caption:=DateToStr(Titulo_receber1.Vencimento);
        SZRLabel58.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end;
      Titulo_receber1.Next;
    end;
  end;
end;

procedure Trpt_NotaFiscalMotCalServico.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sOBS: TStringList;
begin
  report.CurrentY := 50;
  sOBS :=  TStringList.Create;

  if TotalQuantidade > 0 then
    zrlTotalQuantidade.Caption := format('%.2f',[TotalQuantidade])
  else
    zrlTotalQuantidade.Caption:='';

  //Definir Totais
  with NotaFiscal10 do
  Begin
    zrlBaseICMS.Caption      := format('%.2f',[BaseICMS]);
    zrlICMS.Caption          := format('%.2f',[ICMS]);
    zrlBaseICMSSub.Caption   := format('%.2f',[BaseSub]);
    zrlICMSSub.Caption       := format('%.2f',[ICMSSub]);
    zrlTotalProdutos.Caption := format('%.2f',[TotalProduto]);
    if TipoNota = 360 then //Pedido de Compra
      zrlTotalFrete.Caption := format('%.2f',[Frete*TotalProduto/100])
    else
      zrlTotalFrete.Caption := format('%.2f',[Frete]);
    zrlTotalSeguro.Caption   := format('%.2f',[Seguro]);
    zrlTotalOutras.Caption   := format('%.2f',[Outras]);
    zrlTotalIPI.Caption      := format('%.2f',[IPI]);
    zrlTotalNota.Caption := format('%.2f',[TotalNota]);
  end;

  Transportadora1.Close;
  if tag = 0 then
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=fMxNotaFiscal.NotaFiscal1.CodigoTRN
  else
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=NotaFiscal10.CodigoTRN;
  Transportadora1.Open;
  SZRLabel38.Caption := Transportadora1.RazaoSocial;
  SZRLabel39.Caption := Trim(DM.SelecionaParametro(Transportadora1.Logradouro)+' '+Transportadora1.Endereco);
  SZRLabel40.Caption := Transportadora1.Cidade;
  SZRLabel41.Caption := Transportadora1.Uf;
  SZRLabel42.Caption := Transportadora1.CPFCGC;
  SZRLabel43.Caption := Transportadora1.IE;
  //Vendedor
  Funcionario1.Close;
  try
    Funcionario1.ParamByName('CNC_CODIGO').asInteger:=Item_Nota_Fiscal10.CodigoCNC;
  except
  end;
  Funcionario1.ParamByName('FUN_CODIGO').asInteger:=NotaFiscal10.CodigoFUN;
  Funcionario1.Open;
  if not Funcionario1.IsEmpty then
  Begin
    SZRLabel60.Caption:=IntToStr(NotaFiscal10.CodigoFUN);
    SZRLabel59.Caption:=Funcionario1.Apelido;
  end
  else
  Begin
    SZRLabel60.Caption:=IntToStr(NotaFiscal10.CodigoUSU);
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
      SZRLabel26.Caption := memObservacao.Lines[3];
      SZRLabel27.Caption := memObservacao.Lines[4];
      SZRLabel28.Caption := memObservacao.Lines[5];
      SZRLabel29.Caption := memObservacao.Lines[6];
      SZRLabel30.Caption := memObservacao.Lines[7];
    end;
  end
  else
  Begin
    sOBS.Text := NotaFiscal10.Observacao;
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

end.
