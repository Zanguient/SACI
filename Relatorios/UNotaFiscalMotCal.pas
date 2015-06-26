unit UNotaFiscalMotCal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, NotaFiscal, Produto,
  Fornecedor, Funcionario, Titulo_receber, Classificacao_fiscal,
  Transportadora, Cliente, OperFisc, Item_Nota_Fiscal;

type
  Trpt_NotaFiscalMotCal = class(TForm)
    report: TSZReport;
    Item_Nota_Fiscal10: TItem_Nota_Fiscal;
    OperFiscal1: TOperFiscal;
    Cliente1: TCliente;
    Transportadora1: TTransportadora;
    zrbGrupoNTF: TSZRGroup;
    zrbDetalhe: TSZRBand;
    zrlUnidade: TSZRLabel;
    zrlAliquota: TSZRDBText;
    zrlCT: TSZRLabel;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Titulo_receber1: TTitulo_receber;
    Funcionario1: TFuncionario;
    Fornecedor1: TFornecedor;
    zrlProduto: TSZRLabel;
    Produto1: TProduto;
    NotaFiscal10: TNotaFiscal;
    zrbCabecalho: TSZRBand;
    zrlMarcaSaida1: TSZRLabel;
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
    zrlVencimento1: TSZRLabel;
    zrlNumeroTitulo1: TSZRLabel;
    zrlValor1: TSZRLabel;
    zrlVencimento2: TSZRLabel;
    zrlNumeroTitulo2: TSZRLabel;
    zrlValor2: TSZRLabel;
    zrlVencimento3: TSZRLabel;
    zrlNumeroTitulo3: TSZRLabel;
    zrlValor3: TSZRLabel;
    zrlVencimento4: TSZRLabel;
    zrlNumeroTitulo4: TSZRLabel;
    zrlValor4: TSZRLabel;
    zrlVencimento5: TSZRLabel;
    zrlNumeroTitulo5: TSZRLabel;
    zrlVencimento6: TSZRLabel;
    zrlNumeroTitulo6: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlVencimento7: TSZRLabel;
    zrlNumeroTitulo7: TSZRLabel;
    zrlVencimento8: TSZRLabel;
    zrlNumeroTitulo8: TSZRLabel;
    zrlMarcaOFF: TSZRLabel;
    zrlValor8: TSZRLabel;
    zrlValor7: TSZRLabel;
    zrlValor6: TSZRLabel;
    zrlValor5: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlDataEmissao: TSZRLabel;
    zrlCEP: TSZRLabel;
    zrlMarcaEntrada1: TSZRLabel;
    SZRDBText27: TSZRDBText;
    zrbRodapePagina: TSZRBand;
    zrlObservacao1: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel43: TSZRLabel;
    SZRDBText22: TSZRDBText;
    SZRDBText29: TSZRDBText;
    SZRDBText1: TSZRDBText;
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
    zrlVendedor: TSZRLabel;
    zrlDescVendedor: TSZRLabel;
    zrlVencimento9: TSZRLabel;
    zrlNumeroTitulo9: TSZRLabel;
    zrlValor9: TSZRLabel;
    zrlCodigoSGP: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlPrecoUnit: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlQuantidadeRodape: TSZRLabel;
    zrlEspecie: TSZRLabel;
    zrlMarca: TSZRLabel;
    zrlNumero: TSZRLabel;
    zrlPesoBruto: TSZRLabel;
    zrlPesoLiquido: TSZRLabel;
    zrlTipoFrete: TSZRLabel;
    zrlPlaca: TSZRLabel;
    zrlPlacaUF: TSZRLabel;
    zrlTotalServico: TSZRLabel;
    zrlBaseISS: TSZRLabel;
    zrlAliquotaISS: TSZRLabel;
    zrlISS: TSZRLabel;
    zrlNumeroOS: TSZRLabel;
    zrlSelo: TSZRLabel;
    zrlMarcaSaida2: TSZRLabel;
    zrlMarcaEntrada2: TSZRLabel;
    SZRLabel61: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRDBText8BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlPesoBrutoBeforePrint(Sender: TObject; var DoPrint: Boolean);
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
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private

  public
    iQtdItens, iPagina: integer;
    TotalQuantidade:Double;
    VendaPrazo:Boolean;
  end;

var
  rpt_NotaFiscalMotCal: Trpt_NotaFiscalMotCal;

implementation
uses
 UDM, Funcoes, MxNotaFiscal, MxTransferencia;

{$R *.DFM}

procedure Trpt_NotaFiscalMotCal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Item_Nota_Fiscal10.Close;
   Action:=cafree;
end;

procedure Trpt_NotaFiscalMotCal.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao: string;
begin
  TotalQuantidade:=TotalQuantidade+Item_Nota_Fiscal10.Quantidade;

  zrlCodigoSGP.Caption := IntToStr(Item_Nota_Fiscal10.CodigoPRD);

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

  zrlQuantidade.Caption := format('%.2f',[Item_Nota_Fiscal10.Quantidade]);
  zrlPrecoUnit.Caption  := format('%.2f',[Item_Nota_Fiscal10.ValorUnit-Item_Nota_Fiscal10.Desconto]);
  zrlTotalItem.Caption  := format('%.2f',[Item_Nota_Fiscal10.Quantidade*(Item_Nota_Fiscal10.ValorUnit-Item_Nota_Fiscal10.Desconto)]);

  if Item_Nota_Fiscal10.IsEmpty then
    zrlCT.Caption := '0'
  else
    zrlCT.Enabled := False;


  if Trim(Item_Nota_Fiscal10.Descricao) <> '' then
    sDescricao := Item_Nota_Fiscal10.Descricao
  else
    sDescricao := Produto1.Descricao;

  if Length(sDescricao) <= zrlProduto.Width then
    zrlProduto.Caption := sDescricao
  else
    zrlProduto.Caption := Copy(sDescricao, 1, zrlProduto.Width);

  inc(iQtdItens);
end;

procedure Trpt_NotaFiscalMotCal.SZRDBText8BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if NotaFiscal10.Quantidade = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCal.zrlPesoBrutoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if NotaFiscal10.PesoBruto = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCal.SZRDBText7BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if NotaFiscal10.PesoLiquido = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCal.SZRDBText28BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal10.Quantidade <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalMotCal.SZRDBText3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Item_Nota_Fiscal10.ValorUnit <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalMotCal.SZRExpression1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal10.Quantidade <= 0) OR
     (Item_Nota_Fiscal10.ValorUnit <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalMotCal.zrlAliquotaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Item_Nota_Fiscal10.Aliquota <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalMotCal.SZRExpression2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (NotaFiscal10.TipoNota = 368) then //Serviço
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCal.SZRDBText4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (NotaFiscal10.CFOP > 0) then
    DoPrint := True
  else
    DoPrint := False;
end;

procedure Trpt_NotaFiscalMotCal.FormCreate(Sender: TObject);
begin
  VendaPrazo := False;
  zrbGrupoNTF.Height := 0;
  iPagina := 0;
end;

procedure Trpt_NotaFiscalMotCal.Item_Nota_Fiscal10AfterOpen(
  DataSet: TDataSet);
begin
  NotaFiscal10.Close;
  NotaFiscal10.ParamByName('CNC_ORIGEM').asInteger := Item_Nota_Fiscal10.CNCOrigem;
  NotaFiscal10.ParamByName('CNC_CODIGO').asInteger := Item_Nota_Fiscal10.CodigoCNC;
  NotaFiscal10.ParamByName('NTF_CODIGO').asInteger := Item_Nota_Fiscal10.CodigoNTF;
  NotaFiscal10.Open;
end;

procedure Trpt_NotaFiscalMotCal.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sRazao, sEnde, sBairro, sCEP, sCidade, sUF, sFone, sFax, sCPFCNPJ, sRGCGF:string;
  I, iLogra, CdCLIFOR:integer;
begin
  if iPagina = 0 then
  Begin
//    report.Options.PageLength := 85;
//    zrbRodapePagina.Height := 37;
  end
  else
  Begin
//    report.CurrentY := 1;
//    report.Options.PageLength := 82;
//    zrbRodapePagina.Height := 38;
  end;


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
    Begin
      zrlMarcaSaida1.Enabled := True;  //Saída1
      zrlMarcaSaida2.Enabled := True;  //Saída2
    end
    else
    Begin
      zrlMarcaEntrada1.Enabled := True; //Entrada1
      zrlMarcaEntrada2.Enabled := True; //Entrada2
    end;
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
      if (NotaFiscal10.TipoNota = 360) then //Compra
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

  if Trim(sFax) <> '' then
    zrlFoneFax.Caption  := sFone+' /'+sFax
  else
    zrlFoneFax.Caption  := sFone;
  zrlCPF_CNPJ.Caption := sCPFCNPJ;
  zrlCGFRG.Caption    := sRGCGF;

  if (NotaFiscal10.TipoNota=361) or   //Venda
     (NotaFiscal10.TipoNota = 460) then //Pacote de Venda Mãe
  Begin
    Titulo_receber1.Close;
    Titulo_receber1.ParamByName('CNC_CODIGO').asInteger:=NotaFiscal10.PedidoCNC;    
    Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=NotaFiscal10.Pedido;
    Titulo_receber1.Open;
    for i:=1 to Titulo_receber1.RecordCount do
    Begin
      if i = 1 then
      Begin
        zrlNumeroTitulo1.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento1.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor1.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 2 then
      Begin
        zrlNumeroTitulo2.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento2.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor2.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 3 then
      Begin
        zrlNumeroTitulo3.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento3.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor3.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 4 then
      Begin
        zrlNumeroTitulo4.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento4.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor4.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 5 then
      Begin
        zrlNumeroTitulo5.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento5.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor5.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 6 then
      Begin
        zrlNumeroTitulo6.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento6.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor6.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 7 then
      Begin
        zrlNumeroTitulo7.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento7.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor7.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 8 then
      Begin
        zrlNumeroTitulo8.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento8.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor8.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end
      else if i = 9 then
      Begin
        zrlNumeroTitulo9.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
        zrlVencimento9.Caption:=DateToStr(Titulo_receber1.Vencimento);
        zrlValor9.Caption:=format('%.2f',[Titulo_receber1.Valor]);
      end;
      Titulo_receber1.Next;
    end;
  end;
end;

procedure Trpt_NotaFiscalMotCal.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sOBS: TStringList;
begin
  sOBS :=  TStringList.Create;
  try
    if Item_Nota_Fiscal10.Eof then
    Begin
      //Definir Serviço
      if NotaFiscal10.TotalServico > 0 then
      Begin
        zrlNumeroOS.Caption := IntToStr(NotaFiscal10.Pedido);
        zrlTotalServico.Caption := format('%.2f',[NotaFiscal10.TotalServico]);
        zrlBaseISS.Caption := format('%.2f',[NotaFiscal10.BaseISS]);
        zrlAliquotaISS.Caption := format('%.2f',[DM.Configuracao1.AliquotaISS]);
        zrlISS.Caption := format('%.2f',[NotaFiscal10.ISS]);
      end;

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

      zrlTipoFrete.Caption := IntToStr(NotaFiscal10.TipoFrete+1);

      Transportadora1.Close;
      if tag = 0 then
        Transportadora1.ParamByName('TRN_CODIGO').asInteger:=fMxNotaFiscal.NotaFiscal1.CodigoTRN
      else
        Transportadora1.ParamByName('TRN_CODIGO').asInteger:=NotaFiscal10.CodigoTRN;
      Transportadora1.Open;

      if Transportadora1.IsEmpty then
      Begin
        SZRLabel38.Caption := 'O MESMO';
      end
      else
      Begin
        SZRLabel38.Caption := Transportadora1.RazaoSocial;
        SZRLabel39.Caption := Trim(DM.SelecionaParametro(Transportadora1.Logradouro)+' '+Transportadora1.Endereco);
        SZRLabel40.Caption := Transportadora1.Cidade;
        SZRLabel41.Caption := Transportadora1.Uf;
        SZRLabel42.Caption := Transportadora1.CPFCGC;
        SZRLabel43.Caption := Transportadora1.IE;
        zrlPlaca.Caption := NotaFiscal10.Placa;
        zrlPlacaUF.Caption := NotaFiscal10.PlacaUF;
      end;


      //Vendedor
      Funcionario1.Close;
      Funcionario1.ParamByName('FUN_CODIGO').asInteger:=NotaFiscal10.CodigoFUN;
      Funcionario1.Open;
      if not Funcionario1.IsEmpty then
      Begin
        zrlDescVendedor.Caption := 'Vendedor:';
        zrlVendedor.Caption := Funcionario1.Apelido;
      end
      else
      Begin
        zrlDescVendedor.Caption := 'Usuario :';
        zrlVendedor.Caption := IntToStr(NotaFiscal10.CodigoUSU);
      end;

      if (NotaFiscal10.TipoNota = 361) and
         (NotaFiscal10.Pedido = 0) then
      Begin
        zrlVendedor.Caption := zrlVendedor.Caption + ' AP'; 
      end;

      //Dados Adicionais
      if tag = 0 then
      Begin
        with fmxNotaFiscal do
        Begin
          zrlObservacao1.Caption := memObservacao.Lines[0]+
                                    memObservacao.Lines[1]+
                                    memObservacao.Lines[2]+
                                    memObservacao.Lines[3]+
                                    memObservacao.Lines[4]+
                                    memObservacao.Lines[5]+
                                    memObservacao.Lines[6];
        end;
      end
      else
      Begin
        sOBS.Text := NotaFiscal10.Observacao;
        if sOBS.Count >= 1 then
          zrlObservacao1.Caption := sOBS.Strings[0];
        if sOBS.Count >= 2 then
          zrlObservacao1.Caption := zrlObservacao1.Caption + sOBS.Strings[1];
        if sOBS.Count >= 3 then
          zrlObservacao1.Caption := zrlObservacao1.Caption + sOBS.Strings[2];
        if sOBS.Count >= 4 then
          zrlObservacao1.Caption := zrlObservacao1.Caption + sOBS.Strings[3];
        if sOBS.Count >= 5 then
          zrlObservacao1.Caption := zrlObservacao1.Caption + sOBS.Strings[4];
        if sOBS.Count >= 6 then
          zrlObservacao1.Caption := zrlObservacao1.Caption + sOBS.Strings[5];
        if sOBS.Count >= 7 then
          zrlObservacao1.Caption := zrlObservacao1.Caption+sOBS.Strings[6];
      end;

      if NotaFiscal10.Quantidade > 0 then
        zrlQuantidadeRodape.Caption := IntToStr(Trunc(NotaFiscal10.Quantidade))
      else
        zrlQuantidadeRodape.Caption := '';
      zrlEspecie.Caption := NotaFiscal10.Especie;
      zrlMarca.Caption := NotaFiscal10.Marca;
      zrlNumero.Caption := NotaFiscal10.Numero;
      if NotaFiscal10.PesoBruto > 0 then
        zrlPesoBruto.Caption := format('%.2f',[NotaFiscal10.PesoBruto])
      else
        zrlPesoBruto.Caption := '';
      if NotaFiscal10.PesoLiquido > 0 then
        zrlPesoLiquido.Caption := format('%.2f',[NotaFiscal10.PesoLiquido])
      else
        zrlPesoLiquido.Caption := '';

    end
    else
    Begin
      if NotaFiscal10.TotalServico > 0 then
      Begin
        zrlNumeroOS.Caption     := IntToStr(NotaFiscal10.Pedido);
        zrlTotalServico.Caption := '-';
        zrlBaseISS.Caption      := '-';
        zrlAliquotaISS.Caption  := '-';
        zrlISS.Caption          := '-';
      end;

      zrlBaseICMS.Caption      := '-';
      zrlICMS.Caption          := '-';
      zrlBaseICMSSub.Caption   := '-';
      zrlICMSSub.Caption       := '-';
      zrlTotalProdutos.Caption := '-';
      zrlTotalFrete.Caption    := '-';
      zrlTotalSeguro.Caption   := '-';
      zrlTotalOutras.Caption   := '-';
      zrlTotalIPI.Caption      := '-';
      zrlTotalNota.Caption     := '-';

      zrlObservacao1.Caption := '';
    end;
  finally
    sOBS.Free;
  end;
  zrlSelo.Caption := IntToStr(NotaFiscal10.Selo+iPagina);
  inc(iPagina);
end;

end.
