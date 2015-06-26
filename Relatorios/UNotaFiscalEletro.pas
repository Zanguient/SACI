unit UNotaFiscalEletro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Extenso, NotaFiscal,
  Produto, Fornecedor, Funcionario, Titulo_receber, Classificacao_fiscal,
  Transportadora, Cliente, OperFisc, Item_Nota_Fiscal;

type
  Trpt_NotaFiscalEletro = class(TForm)
    report: TSZReport;
    Item_Nota_Fiscal10: TItem_Nota_Fiscal;
    OperFiscal1: TOperFiscal;
    Cliente1: TCliente;
    Transportadora1: TTransportadora;
    zrbGrupoNTF: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrlUnidade: TSZRLabel;
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
    NotaFiscal1: TNotaFiscal;
    zrbCabecalhoPagina: TSZRBand;
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
    zrlMarcaOFF: TSZRLabel;
    zrlValor6: TSZRLabel;
    zrlValor5: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlDataEmissao: TSZRLabel;
    zrlCEP: TSZRLabel;
    zrlMarcaEntrada: TSZRLabel;
    SZRDBText27: TSZRDBText;
    zrbRodapePagina: TSZRBand;
    zrlObservacao1: TSZRLabel;
    zrlObservacao2: TSZRLabel;
    zrlObservacao3: TSZRLabel;
    zrlObservacao4: TSZRLabel;
    zrlObservacao5: TSZRLabel;
    zrlObservacao6: TSZRLabel;
    zrlObservacao7: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel43: TSZRLabel;
    SZRDBText29: TSZRDBText;
    SZRDBText1: TSZRDBText;
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
    zrlVendedor: TSZRLabel;
    zrlDescVendedor: TSZRLabel;
    zrlCodigoPRD: TSZRLabel;
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
    zrlValorExtenso: TSZRLabel;
    ValorPorExtenso1: TValorPorExtenso;
    SZRDBText2: TSZRDBText;
    SZRLabel1: TSZRLabel;
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
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
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private

  public
    Entidade: TItem_Nota_Fiscal;
    iQtdItens, iPagina: integer;
    Desc1,TotalQuantidade:Double;
    VendaPrazo:Boolean;
  end;

var
  rpt_NotaFiscalEletro: Trpt_NotaFiscalEletro;

implementation
uses
 UDM, Funcoes, MxNotaFiscal, MxTransferencia;

{$R *.DFM}

procedure Trpt_NotaFiscalEletro.zrbRodapeGrupoBeforePrint(Sender: TObject;
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

procedure Trpt_NotaFiscalEletro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Entidade.Close;
   Action:=cafree;
end;

procedure Trpt_NotaFiscalEletro.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao: string;  
begin
  TotalQuantidade:=TotalQuantidade+Entidade.Quantidade;

  zrlCodigoPRD.Caption := IntToStr(Entidade.CodigoPRD);

  with Produto1 do
  Begin
    if Entidade.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    zrlUnidade.Caption := Unidade;
  end;

  zrlQuantidade.Caption := format('%.2f',[Entidade.Quantidade]);
  zrlPrecoUnit.Caption  := format('%.2f',[Entidade.ValorUnit]);
  zrlTotalItem.Caption  := format('%.2f',[Entidade.Quantidade*Entidade.ValorUnit]);

  Desc1:=Desc1+Arredonda(Entidade.Desconto*Entidade.Quantidade);
  if Entidade.IsEmpty then
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

procedure Trpt_NotaFiscalEletro.SZRDBText8BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if NotaFiscal1.Quantidade = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalEletro.zrlPesoBrutoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if NotaFiscal1.PesoBruto = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalEletro.SZRDBText7BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if NotaFiscal1.PesoLiquido = 0 then
    DoPrint := False;
end;

procedure Trpt_NotaFiscalEletro.SZRDBText28BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.Quantidade <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalEletro.SZRDBText3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.ValorUnit <= 0 then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalEletro.SZRExpression1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Entidade.Quantidade <= 0) OR
     (Entidade.ValorUnit <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalEletro.zrlAliquotaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (Entidade.Aliquota <= 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_NotaFiscalEletro.SZRExpression2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (NotaFiscal1.TipoNota = 368) then //Serviço
    DoPrint := False;
end;

procedure Trpt_NotaFiscalEletro.SZRDBText4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if (NotaFiscal1.CFOP > 0) then
    DoPrint := True
  else
    DoPrint := False;
end;

procedure Trpt_NotaFiscalEletro.FormCreate(Sender: TObject);
begin
  Entidade := Item_Nota_Fiscal10;
  VendaPrazo := False;
  zrbGrupoNTF.Height := 0;
  iPagina := 0;
end;

procedure Trpt_NotaFiscalEletro.Item_Nota_Fiscal10AfterOpen(
  DataSet: TDataSet);
begin
  NotaFiscal1.Close;
  NotaFiscal1.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
  NotaFiscal1.ParamByName('NTF_CODIGO').asInteger := Entidade.CodigoNTF;
  NotaFiscal1.Open;
end;

procedure Trpt_NotaFiscalEletro.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
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
    OperFiscal1.ParamByName('OPF_CODIGO').asInteger:=NotaFiscal1.CFOP;
  OperFiscal1.Open;
  if (NotaFiscal1.TipoNota = 366) then //Demonstração
  Begin
    if NotaFiscal1.EntradaSaida = 0 then
      zrlNaturezaDaOperacao.Caption:='RETORNO DE DEMONSTRACAO'
    else
      zrlNaturezaDaOperacao.Caption:='DEMONSTRACAO';
    if (StrToInt(Copy(IntToStr(NotaFiscal1.CFOP),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)'
  end
  else if NotaFiscal1.TipoNota = 365 then //Transferência
  Begin
    zrlNaturezaDaOperacao.Caption := 'TRANSFERENCIA';
    if tag = 1 then //Transferência
      if fMxTransfer.Entidade.Automatica then
        zrlMarcaOFF.Enabled := True;
  end
  else if NotaFiscal1.TipoNota = 363 then //Correção
  Begin
    zrlNaturezaDaOperacao.Caption := 'CORRECAO DE DADOS';
    if (StrToInt(Copy(IntToStr(NotaFiscal1.CFOP),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)';
  end
  else if NotaFiscal1.TipoNota = 361 then //Venda
  Begin
    if VendaPrazo then
      zrlNaturezaDaOperacao.Caption := 'VENDA A PRAZO'
    else
      zrlNaturezaDaOperacao.Caption := 'VENDA A VISTA';
    if (StrToInt(Copy(IntToStr(NotaFiscal1.CFOP),1,1)) in [1,5]) then
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (UF)'
    else
      zrlNaturezaDaOperacao.Caption:=zrlNaturezaDaOperacao.Caption+' (FORA UF)';
  end
  else if NotaFiscal1.TipoNota = 368 then //Serviço
    zrlNaturezaDaOperacao.Caption := 'PRESTACAO DE SERVICO'
  else if NotaFiscal1.TipoNota = 1030 then //Mostruário
    zrlNaturezaDaOperacao.Caption := 'MOSTRUARIO'
  else if NotaFiscal1.TipoNota = 4450 then //REMESSA DE TROCA
    zrlNaturezaDaOperacao.Caption := 'REMESSA DE TROCA'
  else if NotaFiscal1.TipoNota = 4490 then //REMESSA EM GARANTIA
    zrlNaturezaDaOperacao.Caption := 'REMESSA EM GARANTIA'
  else //Outra Nota
    zrlNaturezaDaOperacao.Caption:=OperFiscal1.Descricao;

  if (NotaFiscal1.TipoNota <> 368) then //<> Serviço
    if NotaFiscal1.EntradaSaida = 1 then
      zrlMarcaSaida.Enabled := True  //Saída
    else
      zrlMarcaEntrada.Enabled := True; //Entrada
  if NotaFiscal1.DataEmissao > 0 then
   zrlDataEmissao.Caption:=FormatDateTime('dd/mm/yyyy',NotaFiscal1.DataEmissao)
  else
    zrlDataEmissao.Caption:='';

  if (NotaFiscal1.TipoNota <> 360) and //Compra
     (NotaFiscal1.TipoNota <> 369) and //Conhecimento
     (NotaFiscal1.TipoNota <> 451) and //Imobilizado     
     (NotaFiscal1.TipoNota <> 4240) and //Aquisição
     (NotaFiscal1.TipoNota <> 4450) and //REMESSA DE TROCA
     (NotaFiscal1.TipoNota <> 4490) and //REMESSA EM GARANTIA          
     (NotaFiscal1.CFOP <> 5202) and     //Dev. Compra
     (NotaFiscal1.CFOP <> 6202) then    //Dev. Compra
  Begin
    with Cliente1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=NotaFiscal1.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger:=NotaFiscal1.CodigoCLI;
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
  else if (NotaFiscal1.TipoNota = 369) then //Conhecimento
  Begin
    with Transportadora1 do
    Begin
      Close;
      ParamByName('TRN_CODIGO').asInteger:=NotaFiscal1.CodigoCLI;
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
      sRGCGF   := IE;
    end;
  end
  else
  Begin
    with Fornecedor1 do
    Begin
      Close;
      if (NotaFiscal1.TipoNota = 360) then //Compra
        ParamByName('FOR_CODIGO').asInteger:=NotaFiscal1.CodigoFOR
      else
        ParamByName('FOR_CODIGO').asInteger:=NotaFiscal1.CodigoCLI;
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
      sRGCGF   := IE;
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
    SZRLabel8.Caption:=FormatDateTime('dd/mm/yyyy',NotaFiscal1.DataEntradaSaida);
    SZRLabel9.Caption:=FormatDateTime('hh:mm',NotaFiscal1.DataEntradaSaida);
  end;

  zrlRazaoSocial.Caption := sRazao+' - '+IntToStr(CdCLIFOR);

  if (Trim(NotaFiscal1.Endereco) = '') then
    zrlEndereco.Caption:=Trim(DM.SelecionaParametro(iLogra)+' '+sEnde)
  else
    zrlEndereco.Caption:=NotaFiscal1.Endereco;

  if (Trim(NotaFiscal1.Bairro) = '') then
    zrlBairro.Caption := sBairro
  else
    zrlBairro.Caption:=Trim(NotaFiscal1.Bairro);

  if (Trim(NotaFiscal1.CEP) = '') then
    zrlCEP.Caption := sCEP
  else
    zrlCEP.Caption:=Trim(NotaFiscal1.CEP);

  if (Trim(NotaFiscal1.Municipio) = '') then
    zrlMunicipio.Caption := sCidade
  else
    zrlMunicipio.Caption:=Trim(NotaFiscal1.Municipio);

  if (Trim(NotaFiscal1.UF) = '') then
    zrlUF.Caption := sUF
  else
    zrlUF.Caption:=Trim(NotaFiscal1.UF);

  if Trim(sFax) <> '' then
    zrlFoneFax.Caption  := sFone+' /'+sFax
  else
    zrlFoneFax.Caption  := sFone;
  zrlCPF_CNPJ.Caption := sCPFCNPJ;
  zrlCGFRG.Caption    := sRGCGF;

  if NotaFiscal1.TipoNota = 361 then //Vendas
  Begin
    Titulo_receber1.Close;
    Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=NotaFiscal1.Pedido;
    Titulo_receber1.ParamByName('CNC_CLIENTE').asInteger:=NotaFiscal1.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').asInteger:=NotaFiscal1.CodigoCLI;
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
      end;
      Titulo_receber1.Next;
    end;
  end;

  if Item_Nota_Fiscal10.fieldbyname('NTF_TOTAL_NOTA').asfloat > 0 then
  Begin
    ValorPorExtenso1.Valor := Item_Nota_Fiscal10.fieldbyname('NTF_TOTAL_NOTA').asfloat;
    S := ValorPorExtenso1.Texto;
    zrlValorExtenso.Caption:='('+PreencheD(UpperCase(S)+' ','#',116)+')';
  end
  else
    zrlValorExtenso.Enabled := False;
end;

procedure Trpt_NotaFiscalEletro.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sOBS: TStringList;
begin
//  report.CurrentY := 49;

  sOBS :=  TStringList.Create;
  try
    if Entidade.Eof then
    Begin
      //Definir Serviço
      if NotaFiscal1.TotalServico > 0 then
      Begin
        zrlNumeroOS.Caption := IntToStr(NotaFiscal1.Pedido);
        zrlTotalServico.Caption := format('%.2f',[NotaFiscal1.TotalServico]);
        zrlBaseISS.Caption := format('%.2f',[NotaFiscal1.BaseISS]);
        zrlAliquotaISS.Caption := format('%.2f',[DM.Configuracao1.AliquotaISS]);
        zrlISS.Caption := format('%.2f',[NotaFiscal1.ISS]);
      end;

      //Definir Totais
      with NotaFiscal1 do
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

      zrlTipoFrete.Caption := IntToStr(NotaFiscal1.TipoFrete+1);

      Transportadora1.Close;
      if tag = 0 then
        Transportadora1.ParamByName('TRN_CODIGO').asInteger:=fMxNotaFiscal.NotaFiscal1.CodigoTRN
      else
        Transportadora1.ParamByName('TRN_CODIGO').asInteger:=NotaFiscal1.CodigoTRN;
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
        zrlPlaca.Caption := NotaFiscal1.Placa;
        zrlPlacaUF.Caption := NotaFiscal1.PlacaUF;
      end;


      //Vendedor
      Funcionario1.Close;
      Funcionario1.ParamByName('FUN_CODIGO').asInteger:=NotaFiscal1.CodigoFUN;
      Funcionario1.Open;
      if not Funcionario1.IsEmpty then
      Begin
        zrlDescVendedor.Caption := 'Vendedor:';
        zrlVendedor.Caption := Funcionario1.Apelido;
      end
      else
      Begin
        zrlDescVendedor.Caption := 'Usuario :';
        zrlVendedor.Caption := IntToStr(NotaFiscal1.CodigoUSU);
      end;

      //Dados Adicionais
      if tag = 0 then
      Begin
        with fmxNotaFiscal do
        Begin
          zrlObservacao1.Caption := memObservacao.Lines[0];
          zrlObservacao2.Caption := memObservacao.Lines[1];
          zrlObservacao3.Caption := memObservacao.Lines[2];
          zrlObservacao4.Caption := memObservacao.Lines[3];
          zrlObservacao5.Caption := memObservacao.Lines[4];
          zrlObservacao6.Caption := memObservacao.Lines[5];
          zrlObservacao7.Caption := memObservacao.Lines[6];
        end;
      end
      else
      Begin
        sOBS.Text := NotaFiscal1.Observacao;
        if sOBS.Count >= 1 then
          zrlObservacao1.Caption := sOBS.Strings[0];
        if sOBS.Count >= 2 then
          zrlObservacao2.Caption := sOBS.Strings[1];
        if sOBS.Count >= 3 then
          zrlObservacao3.Caption := sOBS.Strings[2];
        if sOBS.Count >= 4 then
          zrlObservacao4.Caption := sOBS.Strings[3];
        if sOBS.Count >= 5 then
          zrlObservacao5.Caption := sOBS.Strings[4];
        if sOBS.Count >= 6 then
          zrlObservacao6.Caption := sOBS.Strings[5];
        if sOBS.Count >= 7 then
          zrlObservacao7.Caption := sOBS.Strings[6];
      end;

      if NotaFiscal1.Quantidade > 0 then
        zrlQuantidadeRodape.Caption := IntToStr(Trunc(NotaFiscal1.Quantidade))
      else
        zrlQuantidadeRodape.Caption := '';
      zrlEspecie.Caption := NotaFiscal1.Especie;
      zrlMarca.Caption := NotaFiscal1.Marca;
      zrlNumero.Caption := NotaFiscal1.Numero;
      if NotaFiscal1.PesoBruto > 0 then
        zrlPesoBruto.Caption := format('%.2f',[NotaFiscal1.PesoBruto])
      else
        zrlPesoBruto.Caption := '';
      if NotaFiscal1.PesoLiquido > 0 then
        zrlPesoLiquido.Caption := format('%.2f',[NotaFiscal1.PesoLiquido])
      else
        zrlPesoLiquido.Caption := '';

    end
    else
    Begin
      if NotaFiscal1.TotalServico > 0 then
      Begin
        zrlNumeroOS.Caption     := IntToStr(NotaFiscal1.Pedido);
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
  zrlSelo.Caption := IntToStr(NotaFiscal1.Selo+iPagina);
  inc(iPagina);
end;

end.
