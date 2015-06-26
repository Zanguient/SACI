unit UNotaFiscalCompleta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Funcionario, Produto, CentroCusto, Item_Nota_Fiscal, Mask, DBCtrls,
  Transportadora, Fornecedor;

type
  Trpt_NotaFiscalCompleta = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrb_detalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRDBText6: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrbGrupoNTF: TSZRGroup;
    SZRLabel11: TSZRLabel;
    SZRLabel57: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrbRodapeGrupoNTF: TSZRBand;
    SZRLabel12: TSZRLabel;
    SZRLabel8: TSZRLabel;
    Funcionario1: TFuncionario;
    SZRLabel4: TSZRLabel;
    zrlProduto: TSZRLabel;
    Produto1: TProduto;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRLabel17: TSZRLabel;
    zrbGrupoCNC: TSZRGroup;
    SZRLabel171: TSZRLabel;
    SZRLabel172: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlbRodapeGrupoCentro: TSZRBand;
    SZRLabel173: TSZRLabel;
    SZRLabel174: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel24: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText9: TSZRDBText;
    Item_Nota_Fiscal1: TItem_Nota_Fiscal;
    Item_Nota_Fiscal1NTF_CODIGO: TIntegerField;
    Item_Nota_Fiscal1CNC_CODIGO: TIntegerField;
    Item_Nota_Fiscal1USU_CODIGO: TIntegerField;
    Item_Nota_Fiscal1CNC_CLIENTE: TIntegerField;
    Item_Nota_Fiscal1CLI_CODIGO: TIntegerField;
    Item_Nota_Fiscal1FOR_CODIGO: TIntegerField;
    Item_Nota_Fiscal1FUN_CODIGO: TIntegerField;
    Item_Nota_Fiscal1TRN_CODIGO: TIntegerField;
    Item_Nota_Fiscal1CAG_CODIGO: TIntegerField;
    Item_Nota_Fiscal1NTF_PEDIDO: TIntegerField;
    Item_Nota_Fiscal1NTF_DT_CADASTRO: TDateTimeField;
    Item_Nota_Fiscal1NTF_DT_ALTERADO: TDateTimeField;
    Item_Nota_Fiscal1NTF_DT_EMISSAO: TDateTimeField;
    Item_Nota_Fiscal1NTF_DT_ENTRADA_SAIDA: TDateTimeField;
    Item_Nota_Fiscal1NTF_ENTRADA_SAIDA: TIntegerField;
    Item_Nota_Fiscal1NTF_TIPO_NOTA: TIntegerField;
    Item_Nota_Fiscal1NTF_NOTA_FISCAL: TIntegerField;
    Item_Nota_Fiscal1NTF_SERIE: TStringField;
    Item_Nota_Fiscal1NTF_SUBSERIE: TStringField;
    Item_Nota_Fiscal1NTF_SELO: TIntegerField;
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
    Item_Nota_Fiscal1NTF_OBSERVACAO: TStringField;
    Item_Nota_Fiscal1NTF_ICMS_FRETE: TFloatField;
    Item_Nota_Fiscal1NTF_CONHECIMENTO: TIntegerField;
    Item_Nota_Fiscal1INF_CODIGO: TIntegerField;
    Item_Nota_Fiscal1CNC_CODIGO_1: TIntegerField;
    Item_Nota_Fiscal1NTF_CODIGO_1: TIntegerField;
    Item_Nota_Fiscal1PRD_CODIGO: TIntegerField;
    Item_Nota_Fiscal1INF_SERVICO: TStringField;
    Item_Nota_Fiscal1INF_QUANTIDADE: TFloatField;
    Item_Nota_Fiscal1INF_PRECO: TFloatField;
    Item_Nota_Fiscal1INF_DESCONTO: TFloatField;
    Item_Nota_Fiscal1INF_TIPO_ALIQUOTA: TIntegerField;
    Item_Nota_Fiscal1INF_ALIQUOTA: TFloatField;
    SZRLabel9: TSZRLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    Cliente1: TCliente;
    Item_Nota_Fiscal1NTF_ISS: TFloatField;
    Item_Nota_Fiscal1NTF_BASE_ISS: TFloatField;
    Item_Nota_Fiscal1CNC_PEDIDO: TIntegerField;
    Item_Nota_Fiscal1NTF_ENDERECO: TStringField;
    Item_Nota_Fiscal1NTF_BAIRRO: TStringField;
    Item_Nota_Fiscal1NTF_MUNICIPIO: TStringField;
    Item_Nota_Fiscal1NTF_UF: TStringField;
    Item_Nota_Fiscal1NTF_CEP: TStringField;
    Item_Nota_Fiscal1NTF_NOTA_CUPOM: TIntegerField;
    SZRDBText3: TSZRDBText;
    zrlTotalItem: TSZRLabel;
    zrlFiltros: TSZRLabel;
    Item_Nota_Fiscal1NTF_AVULSA: TIntegerField;
    Item_Nota_Fiscal1NTF_COD_PAGAMENTO: TIntegerField;
    Item_Nota_Fiscal1NTF_TOTAL_SERVICO: TFloatField;
    Item_Nota_Fiscal1FUN_ARQUITETO: TIntegerField;
    Item_Nota_Fiscal1CNC_ORIGEM: TIntegerField;
    Item_Nota_Fiscal1INF_ALIQUOTA_IPI: TFloatField;
    Item_Nota_Fiscal1CNC_ORIGEM_1: TIntegerField;
    Item_Nota_Fiscal1NTF_COD_PAGAMENTO_2: TIntegerField;
    Item_Nota_Fiscal1INF_BONIFICACAO: TFloatField;
    Fornecedor1: TFornecedor;
    Transportadora1: TTransportadora;
    SZRDBText4: TSZRDBText;
    SZRLabel10: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlEntradaSaida: TSZRLabel;
    zrlTotalQtdCentro: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel3: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    zrlTotalQtdGeral: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlSubTotalBonificacao: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlSubQtdBonificacao: TSZRLabel;
    zrlSubTotalAmostra: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrlSubQtdAmostra: TSZRLabel;
    zrlCentroTotalBonificacao: TSZRLabel;
    zrlCentroQtdBonificacao: TSZRLabel;
    zrlCentroTotalAmostra: TSZRLabel;
    zrlCentroQtdAmostra: TSZRLabel;
    zrlTotalBonificacao: TSZRLabel;
    zrlTotalQtdBonificacao: TSZRLabel;
    zrlTotalAmostra: TSZRLabel;
    zrlTotalQtdAmostra: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel25: TSZRLabel;
    zrlSubQtd: TSZRLabel;
    Item_Nota_Fiscal1NTF_MAQUINA: TIntegerField;
    Item_Nota_Fiscal1TRO_CODIGO: TIntegerField;
    Item_Nota_Fiscal1INF_ALIQUOTA_ISS: TFloatField;
    Item_Nota_Fiscal1INF_DT_CADASTRO: TDateTimeField;
    Item_Nota_Fiscal1INF_DT_ALTERADO: TDateTimeField;
    Item_Nota_Fiscal1INF_AMOSTRA: TFloatField;
    zrlTotalICMS: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRDBText8: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrb_detalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoNTFBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoNTFBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlbRodapeGrupoCentroBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vTotalQtdCentro, vTotalQtdGeral, vSubQtd, vSubQtdBonificacao, vSubQtdAmostra, vSubTotalBonificacao, vSubTotalAmostra,
      vCentroQtdBonificacao, vCentroQtdAmostra, vCentroTotalBonificacao, vCentroTotalAmostra,
      vTotalQtdBonificacao, vTotalQtdAmostra, vTotalBonificacao, vTotalAmostra, vTotalICMS: Double;
  public
    { Public declarations }
    vTotal,vTotalCentro:Double;
    Entidade : TItem_Nota_Fiscal;
  end;

var
  rpt_NotaFiscalCompleta: Trpt_NotaFiscalCompleta;

implementation
Uses
  UDM, MxSVendasCliente, Funcoes;
{$R *.DFM}

procedure Trpt_NotaFiscalCompleta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Item_Nota_Fiscal1.Active := False;
  Action := cafree;
end;

procedure Trpt_NotaFiscalCompleta.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescBonAmo: string;
begin
  sDescBonAmo := '';
  if Entidade.Bonificacao > 0 then
    sDescBonAmo := sDescBonAmo + '(B:'+Format('%.2f',[Entidade.Bonificacao])+')';
  if Entidade.Amostra > 0 then
    sDescBonAmo := sDescBonAmo + '(A:'+Format('%.2f',[Entidade.Amostra])+')';

  if zrb_detalhe.Height > 0 then
  Begin
    if Entidade.Descricao <> '' then
      zrlProduto.Caption := Entidade.Descricao+sDescBonAmo
    else
    Begin
      with Produto1 do
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger:=Item_Nota_Fiscal1.CodigoPRD;
        Open;
        zrlProduto.Caption := Descricao+Referencia+Marca+sDescBonAmo;
      end;
    end;
  end;

  with Item_Nota_Fiscal1 do
  Begin
    if Item_Nota_Fiscal1.FieldByName('NTF_ENTRADA_SAIDA').asInteger = 0 then
    Begin
      vSubQtd              := vSubQtd              + Quantidade;
      vTotalQtdCentro      := vTotalQtdCentro      + Quantidade;
      vTotalQtdGeral       := vTotalQtdGeral       + Quantidade;
      vSubQtdBonificacao   := vSubQtdBonificacao   + Bonificacao;
      vSubQtdAmostra       := vSubQtdAmostra       + Amostra;
      vSubTotalBonificacao := vSubTotalBonificacao + Bonificacao*Arredonda(ValorUnit-Desconto,4);
      vSubTotalAmostra     := vSubTotalAmostra     + Amostra*Arredonda(ValorUnit-Desconto,4);
    end
    else
    Begin
      vSubQtd              := vSubQtd              - Quantidade;
      vTotalQtdCentro      := vTotalQtdCentro      - Quantidade;
      vTotalQtdGeral       := vTotalQtdGeral       - Quantidade;
      vSubQtdBonificacao   := vSubQtdBonificacao   - Bonificacao;
      vSubQtdAmostra       := vSubQtdAmostra       - Amostra;
      //Alan 09-05-06
      //vSubTotalBonificacao := vSubTotalBonificacao - Bonificacao*Arredonda(ValorUnit-Desconto,4);
      //Alan 09-05-06
      //vSubTotalAmostra     := vSubTotalAmostra     - Amostra*Arredonda(ValorUnit-Desconto,4);
    end;
    //Alan 09-05-06
    //zrlTotalItem.Caption := format('%.2f',[Quantidade*cValorUnit-Desconto,4)]);
    zrlTotalItem.Caption := '';
    zrlTotalItem.Caption := format('%.2f',[(Item_Nota_Fiscal1.Quantidade*Item_Nota_Fiscal1.ValorUnit)-Item_Nota_Fiscal1.Desconto]);

    zrlTotalICMS.Caption := format('%.2f',[(strtofloat(zrlTotalItem.Caption)*
    Item_Nota_Fiscal1.FieldByName('INF_ALIQUOTA').AsFloat/100)]);

    vTotalICMS:=vTotalICMS+strtofloat(zrlTotalICMS.Caption);

    if (DM.Configuracao1.Empresa = empLBM) AND
       ((FieldByName('NTF_NOTA_FISCAL').asString = '0') OR
        (FieldByName('NTF_NOTA_FISCAL').asString = '')) then
    Begin
      ShowMessage('OPA!!!');
    end
    else
    Begin
      //vTotal:=vTotal+Arredonda(Quantidade*Arredonda(ValorUnit-Desconto,4));
      vTotal:=vTotal+Arredonda((Quantidade*ValorUnit)-Desconto, 4);
      //vTotalCentro:=vTotalCentro+Arredonda(Quantidade*Arredonda(ValorUnit-Desconto,4));
      vTotalCentro:=vTotalCentro+Arredonda((Quantidade*ValorUnit)-Desconto, 4);
    end;
  end;
end;

procedure Trpt_NotaFiscalCompleta.zrbRodapeGrupoNTFBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSubQtdBonificacao.Caption   := format('%.2f',[vSubQtdBonificacao]);
  zrlSubQtdAmostra.Caption       := format('%.2f',[vSubQtdAmostra]);
  zrlSubTotalBonificacao.Caption := format('%.2f',[vSubTotalBonificacao]);
  zrlSubTotalAmostra.Caption     := format('%.2f',[vSubTotalAmostra]);
  zrlSubQtd.Caption              := format('%.2f',[vSubQtd]);
  SZRLabel8.Caption:=format('%.2f',[vTotal]);
  SZRLabel28.Caption:=format('%.2f',[vTotalICMS]);
  vTotalICMS := 0;

  vCentroQtdBonificacao   := vCentroQtdBonificacao + vSubQtdBonificacao;
  vCentroTotalBonificacao := vCentroTotalBonificacao + vSubTotalBonificacao;
  vCentroQtdAmostra       := vCentroQtdAmostra + vSubQtdAmostra;
  vCentroTotalAmostra     := vCentroTotalAmostra + vSubTotalAmostra;
end;

procedure Trpt_NotaFiscalCompleta.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_NotaFiscalCompleta.zrbGrupoNTFBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vTotal := 0;
  vTotalICMS := 0;
  Funcionario1.Close;
  Funcionario1.ParamByName('CNC_CODIGO').asInteger:=Item_Nota_Fiscal1.CodigoCNC;
  Funcionario1.ParamByName('FUN_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('FUN_CODIGO').asInteger;
  Funcionario1.Open;
  SZRLabel19.Caption:=Funcionario1.Apelido;

  vSubQtd              := 0;
  vSubQtdBonificacao   := 0;
  vSubTotalBonificacao := 0;
  vSubQtdAmostra       := 0;
  vSubTotalAmostra     := 0;

  if Item_Nota_Fiscal1.FieldByName('NTF_ENTRADA_SAIDA').asInteger = 0 then
    zrlEntradaSaida.Caption := 'E'
  else
    zrlEntradaSaida.Caption := 'S';

  if (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 360) and //Compra
     (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 369) and //Conhecimento
     (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 451) and //Imobilizado
     (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger <> 4240) and //AQUISICAO
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
      SZRLabel9.Caption:=RazaoSocial;
    end;
  end
  else if (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 369) then //Conhecimento
  Begin
    with Transportadora1 do
    Begin
      if CodigoTRN <> Item_Nota_Fiscal1.FieldByName('CLI_CODIGO').asInteger then
      Begin
        Close;
        ParamByName('TRN_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('CLI_CODIGO').asInteger;
        Open;
      end;
      SZRLabel9.Caption:=RazaoSocial;
    end;
  end
  else //Devolução de Compra
  Begin
    with Fornecedor1 do
    Begin
      if CodigoFOR <> Item_Nota_Fiscal1.FieldByName('FOR_CODIGO').asInteger then
      Begin
        Close;
        if (Item_Nota_Fiscal1.FieldByName('NTF_TIPO_NOTA').asInteger = 360) then //Compra
          ParamByName('FOR_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('FOR_CODIGO').asInteger
        else
          ParamByName('FOR_CODIGO').asInteger:=Item_Nota_Fiscal1.FieldByName('CLI_CODIGO').asInteger;
        Open;
      end;
      SZRLabel9.Caption:=RazaoSocial;
    end;
  end;
end;

procedure Trpt_NotaFiscalCompleta.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_NotaFiscalCompleta.zrbGrupoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Item_Nota_Fiscal1.CodigoCNC;
  CentroCusto1.Open;
  SZRLabel172.Caption:=CentroCusto1.RazaoSocial;
  vTotalCentro := 0;
  vTotalQtdCentro := 0;

  vCentroQtdBonificacao   := 0;
  vCentroQtdAmostra       := 0;
  vCentroTotalBonificacao := 0;
  vCentroTotalAmostra     := 0;
end;

procedure Trpt_NotaFiscalCompleta.zrlbRodapeGrupoCentroBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalQtdCentro.Caption         := format('%.2f',[vTotalQtdCentro]);
  SZRLabel174.Caption               := format('%.2f',[vTotalCentro]);
  zrlCentroQtdBonificacao.Caption   := format('%.2f',[vCentroQtdBonificacao]);
  zrlCentroQtdAmostra.Caption       := format('%.2f',[vCentroQtdAmostra]);
  zrlCentroTotalBonificacao.Caption := format('%.2f',[vCentroTotalBonificacao]);
  zrlCentroTotalAmostra.Caption     := format('%.2f',[vCentroTotalAmostra]);

  vTotalQtdBonificacao := vTotalQtdBonificacao + vCentroQtdBonificacao;
  vTotalBonificacao    := vTotalBonificacao    + vCentroTotalBonificacao;
  vTotalQtdAmostra     := vTotalQtdAmostra     + vCentroQtdAmostra;
  vTotalAmostra        := vTotalAmostra        + vCentroTotalAmostra;
end;

procedure Trpt_NotaFiscalCompleta.FormCreate(Sender: TObject);
begin
  Entidade := Item_Nota_Fiscal1;
  vTotalQtdBonificacao := 0;
  vTotalBonificacao    := 0;
  vTotalQtdAmostra     := 0;
  vTotalAmostra        := 0;
  vTotalQtdGeral       := 0;
end;

procedure Trpt_NotaFiscalCompleta.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_NotaFiscalCompleta.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalQtdBonificacao.Caption := format('%.2f',[vTotalQtdBonificacao]);
  zrlTotalQtdAmostra.Caption     := format('%.2f',[vTotalQtdAmostra]);
  zrlTotalBonificacao.Caption    := format('%.2f',[vTotalBonificacao]);
  zrlTotalAmostra.Caption        := format('%.2f',[vTotalAmostra]);

  zrlTotalQtdGeral.Caption:=format('%.2f',[vTotalQtdGeral]);
end;

end.
