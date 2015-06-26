unit UOrcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Variants,
  Movimento_caixa, Item_Pedido_Venda, Funcionario, Titulo_receber,
  AgenteFin, Forma_de_Pagamento, Parametro, Produto, CentroCusto, Extenso;


type
  Trpt_Orcamento = class(TForm)
    report: TSZReport;
    zrb_detalhe: TSZRBand;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    ZRDBText1: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRDBText10: TSZRDBText;
    Produto1: TProduto;
    SZRLabel1: TSZRLabel;
    Item_Pedido_Venda1Produto: TStringField;
    Cliente1: TCliente;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_CODIGO: TIntegerField;
    Item_Pedido_Venda1FUN_CODIGO: TIntegerField;
    Item_Pedido_Venda1IEB_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1SEC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1TBP_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_ENTREGA: TSmallintField;
    Item_Pedido_Venda1IPV_AVISTA: TSmallintField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_DESCONTO: TFloatField;
    Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField;
    Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1IPV_NOTA: TIntegerField;
    Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1CNC_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1CLI_CODIGO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_DATA_HORA: TDateTimeField;
    Item_Pedido_Venda1PDV_TOTAL: TFloatField;
    Item_Pedido_Venda1PDV_LISTADO: TIntegerField;
    Item_Pedido_Venda1PDV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1PDV_DIAS_RESERV: TIntegerField;
    Item_Pedido_Venda1PDV_NOTA_FISCAL: TSmallintField;
    Item_Pedido_Venda1AGF_CODIGO: TIntegerField;
    Item_Pedido_Venda1FPG_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_TIPO_PAG: TIntegerField;
    Item_Pedido_Venda1PDV_ENTRADA: TFloatField;
    Item_Pedido_Venda1CNC_CLIENTE: TIntegerField;
    Item_Pedido_Venda1PDV_EM_USO: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1PDV_ACRESCIMO: TFloatField;
    Item_Pedido_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1PDV_MAQUINA: TIntegerField;
    Funcionario1: TFuncionario;
    SZRExpression1: TSZRExpression;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    zrbGrupoPDV: TSZRGroup;
    ZRLabel24: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlDataExtenso: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCidadeUF: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlContato: TSZRLabel;
    SZRLabel31: TSZRLabel;
    zrlFoneFax: TSZRLabel;
    SZRLabel47: TSZRLabel;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField;
    Item_Pedido_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    SZRLabel64: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    Item_Pedido_Venda1PDV_NOTA_CUPOM: TIntegerField;
    SZRLabel155: TSZRLabel;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    zrbSumario: TSZRBand;
    SZRLabel65: TSZRLabel;
    SZRLabel66: TSZRLabel;
    zrlAgenteFinanceiro: TSZRLabel;
    SZRLabel88: TSZRLabel;
    SZRLabel90: TSZRLabel;
    SZRLabel91: TSZRLabel;
    SZRLabel101: TSZRLabel;
    SZRLabel100: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel26: TSZRLabel;
    SZRBand2: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRSysData3: TSZRSysData;
    zrlDescricaoInicial: TSZRLabel;
    zrlCodigoPRD: TSZRLabel;
    Item_Pedido_Venda1PDV_OBS: TStringField;
    zrlEntrega: TSZRLabel;
    SZRLabel49: TSZRLabel;
    zrlTipoPag: TSZRLabel;
    zrlFormaPag: TSZRLabel;
    SZRLabel52: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel5: TSZRLabel;
    zrlVendedor: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlRodape1: TSZRLabel;
    zrlRodape2: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRBand3: TSZRBand;
    zrlCabecalho: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlContinuacao: TSZRLabel;
    Extenso1: TValorPorExtenso;
    zrlExtensoTotal: TSZRLabel;
    zrlNumeroItem: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlExtensoTotalItem: TSZRLabel;
    zrlExtensoUnitario: TSZRLabel;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1PDV_IMPRESSO: TIntegerField;
    Item_Pedido_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Item_Pedido_Venda1PDV_CONTATO: TStringField;
    Item_Pedido_Venda1PDV_CREDITO: TFloatField;
    Item_Pedido_Venda1FUN_ARQUITETO: TIntegerField;
    Item_Pedido_Venda1PDV_TITULO_GERADO: TIntegerField;
    Item_Pedido_Venda1PDV_TIPO_VENDA: TIntegerField;
    Item_Pedido_Venda1PDV_PACOTE: TIntegerField;
    Item_Pedido_Venda1PDV_GRUPO_ESPECIAL: TIntegerField;
    Item_Pedido_Venda1PDV_DT_PREVISAO: TDateTimeField;
    Item_Pedido_Venda1PDV_DT_ENTREGA: TDateTimeField;
    Item_Pedido_Venda1PDV_DOCUMENTO: TStringField;
    Item_Pedido_Venda1PDV_CAIXA: TStringField;
    Item_Pedido_Venda1PDV_SERVICO: TIntegerField;
    Item_Pedido_Venda1PDV_FONE_CONTATO: TStringField;
    Item_Pedido_Venda1FPE_CODIGO: TIntegerField;
    Item_Pedido_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    Item_Pedido_Venda1IPV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_CADASTRO: TDateTimeField;
    Item_Pedido_Venda1IPV_VINCULO: TIntegerField;
    Item_Pedido_Venda1IPV_SEQUENCIA: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO_1: TIntegerField;
    Item_Pedido_Venda1PDV_DT_FPE: TDateTimeField;
    Item_Pedido_Venda1CNT_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_GARANTIA: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Item_Pedido_Venda1PDV_FRETE: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrb_detalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
    procedure zrbGrupoPDVBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    PrimeiraPagina : Boolean;
    NumeroItem : integer;
  public
    Total,SubTotal, TotMov, TotQtd:Double;
    sContato : String;
  end;

var
  rpt_Orcamento: Trpt_Orcamento;

implementation
Uses
  UDM, Funcoes;
{$R *.DFM}

procedure Trpt_Orcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Close;
  Cliente1.Close;
  Item_Pedido_Venda1.Close;
  Action := cafree;
end;

procedure Trpt_Orcamento.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vPreco : Double;
  S : String;
begin
  zrlNumeroItem.Caption:=preencheZero(3,NumeroItem);
  inc(NumeroItem);

  zrlCodigoPRD.Caption := preencheZero(5,Item_Pedido_Venda1.CodigoPRD);

  If (Item_Pedido_Venda1.PrecoDesc<>0) or (DM.Configuracao1.Empresa = empLBM) THEN
    vPreco := Item_Pedido_Venda1.PrecoDesc
  else
    vPreco := Item_Pedido_Venda1.Preco;

  SubTotal := SubTotal + vPreco*Item_Pedido_Venda1.Quantidade;
  TotQtd   := TotQtd   + Item_Pedido_Venda1.Quantidade;

  if Item_Pedido_Venda1.DiasEntrega = 0 then
    zrlEntrega.Caption := 'Imediata'
  else
    zrlEntrega.Caption := IntToStr(Item_Pedido_Venda1.DiasEntrega);

  if zrb_detalhe.Height >= 4 then
  Begin
    Extenso1.Valor := vPreco;
    S := Extenso1.Texto;
    zrlExtensoUnitario.Caption  := 'Valor Unitario: ('+UpperCase(S)+')';

    Extenso1.Valor := vPreco*Item_Pedido_Venda1.Quantidade;
    S := Extenso1.Texto;
    zrlExtensoTotalItem.Caption := 'Total do Item : ('+UpperCase(S)+')';
  end;
end;

procedure Trpt_Orcamento.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=0;
  SubTotal:=0;
  TotQtd:=0;
end;

procedure Trpt_Orcamento.Item_Pedido_Venda1CalcFields(
  DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
    Open;
    Item_Pedido_Venda1.FieldByName('Produto').asString:=Descricao+' '+Referencia+
      ', '+Marca+' '+Unidade;
  end;
end;

procedure Trpt_Orcamento.zrbGrupoPDVBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  NumeroItem := 1;

  case DM.Configuracao1.Empresa of
    empEletro  : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A ELETRO GUERRA, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADO';
    empPetromax: zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A PETROMAX, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADO';
    empMotical : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A MOTICAL, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADO';
    empCreator : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A CREATOR PAPELARIA, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADO';
    empAndrea  : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A ANDREA COSTA, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADO';
    empLuciano : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A LUCIANO OTICA, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADO';
    empHope    : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A HOPE, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADO';
    else
       zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A ' +DM.Configuracao1.LojaNome+ ', PARA FORNECIMENTO DOS PRODUTOS ESPECIFICADOS';
  end;

  with Cliente1 do
  Begin
    if (Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger <> CodigoCLI) or
       (Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger;
      Open;
    end;
    zrlCliente.Caption:=RazaoSocial+' ('+IntToStr(CodigoCLI)+')';
    if (Fone <> '') and (Fax <> '') then
      zrlFoneFax.Caption:=Fone+' / '+Fax
    else if Fone <> '' then
      zrlFoneFax.Caption:=Fone
    else
      zrlFoneFax.Caption:=Fax;

    zrlBairro.Caption:=Bairro;
    zrlCidadeUF.Caption:=Cidade+'/'+Uf;
  end;

  if not Cliente1.PessoaFisica then
    zrlContato.Caption := sContato
  else
  Begin
    SZRLabel26.Enabled := False;
    zrlContato.Enabled := False;
  end;


  DM.SelecionaParametro(Cliente1.Logradouro);
  if not DM.Parametro1.IsEmpty then
    zrlEndereco.Caption := DM.Parametro1.Descricao+' '+Cliente1.Endereco
  else
    zrlEndereco.Caption := Cliente1.Endereco;

  SZRLabel31.Caption:=Item_Pedido_Venda1.FieldByName('PDV_OBS').asString;

  with CentroCusto1 do
  Begin
    if DM.Configuracao1.CodigoCNC <> CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      Open;
    end;
    zrlDataExtenso.Caption:=DataExtenso(Item_Pedido_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime,Cidade);
  end;

  with Forma_de_Pagamento1 do
  Begin
    if Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger <> CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger;
      Open;
    end;
    zrlFormaPag.Caption:=Descricao;
  end;

  zrlTipoPag.Caption:= DM.SelecionaParametro(Item_Pedido_Venda1.FieldByName('PDV_TIPO_PAG').asInteger);

  with Funcionario1 do
  Begin
    if Item_Pedido_Venda1.CodigoFUN <> CodigoFUN then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoFUN;
      Open;
    end;
    if Fone <> '' then
      zrlVendedor.Caption:=Apelido+' - Fone:'+Fone
    else
      zrlVendedor.Caption:=Apelido;
  end;
end;

procedure Trpt_Orcamento.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  S, sDadosEmpresa : String;
begin
  if report.CurrentY < 46 then
    report.CurrentY := 46
  else
  Begin
    report.NewPage;
    report.CurrentY := 46;
  end;

  Extenso1.Valor := SubTotal;
  S := Extenso1.Texto;
  zrlExtensoTotal.Caption := 'Total Proposta: ('+UpperCase(S)+')';

  with AgenteFin1 do
  Begin
    if Item_Pedido_Venda1.FieldByName('AGF_CODIGO').asInteger <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('AGF_CODIGO').asInteger;
      Open;
    end;
    zrlAgenteFinanceiro.Caption:=Descricao;
  end;

  ZRLabel26.Caption:=Format('%.2f',[SubTotal]);
  Total:=Total+Subtotal;
  SubTotal:=0;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
  Begin
    zrlRodape1.Caption := 'Av. Heraclito Graca, 210 - Centro - Fone/Fax:(85) 433-4646';
    zrlRodape2.Caption := 'www.lbmmoveis.com.br  /  lbm@lbmmoveis.com.br';
  end
  else
  Begin
    sDadosEmpresa := '';
    with DM.CentroCusto1 do
    Begin
      DM.SelecionaParametro(Logradouro);
      if not DM.Parametro1.IsEmpty then
        sDadosEmpresa := sDadosEmpresa + DM.Parametro1.Descricao + ' ' + Endereco
      else
        sDadosEmpresa := sDadosEmpresa + Endereco;

      sDadosEmpresa := sDadosEmpresa + ' - ' + Bairro;
      if (Trim(Fone) = Trim(Fax)) and
         (Trim(Fone) <> '') then
        sDadosEmpresa := sDadosEmpresa + ' - ' + ' Fone/Fax: '+Fone
      else
      Begin
        if Trim(Fone) <> '' then
          sDadosEmpresa := sDadosEmpresa + ' - ' + ' Fone: '+Fone;
        if Trim(Fax) <> '' then
          sDadosEmpresa := sDadosEmpresa + ' - ' + ' Fax: '+Fax;
      end;
      zrlRodape1.Caption := sDadosEmpresa;
      zrlRodape2.Caption := Site + ' / ' + EMail;
    end;
  end;
end;

procedure Trpt_Orcamento.FormCreate(Sender: TObject);
begin
  PrimeiraPagina := True;
  sContato := '';
end;

procedure Trpt_Orcamento.SZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  case DM.Configuracao1.Empresa of
    1: zrlCabecalho.Caption := 'ELETRO GUERRA';
    2: zrlCabecalho.Caption := 'PETROMAX';
    3: Begin
         if DM.Configuracao1.CodigoCNC <> 3 then
           zrlCabecalho.Caption := 'LBM - MOVEIS PARA ESCRITORIO LTDA'
         else
           zrlCabecalho.Caption := 'LBM - SERVICOS LTDA';
       end;
    4: zrlCabecalho.Caption := 'MOTICAL MATERIAL OTICO LTDA';
    5: zrlCabecalho.Caption := 'CREATOR PAPELARIA';
  else
    zrlCabecalho.Caption := '';
  end;

  if not PrimeiraPagina then
    zrlContinuacao.Enabled := True;

  PrimeiraPagina := False;
end;

procedure Trpt_Orcamento.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
