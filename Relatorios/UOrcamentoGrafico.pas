unit UOrcamentoGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, jpeg, QRCtrls, Extenso, CentroCusto,
  Produto, Funcionario, Forma_de_Pagamento, Titulo_receber, AgenteFin, DB,
  Item_Pedido_Venda, Cliente, DBTables, SQuery, Parametro;

type
  Trpt_OrcamentoGrafico = class(TForm)
    report: TQuickRep;
    Cliente1: TCliente;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
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
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField;
    Item_Pedido_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Item_Pedido_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    Item_Pedido_Venda1PDV_OBS: TStringField;
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
    AgenteFin1: TAgenteFin;
    Titulo_receber1: TTitulo_receber;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    Funcionario1: TFuncionario;
    Produto1: TProduto;
    CentroCusto1: TCentroCusto;
    Extenso1: TValorPorExtenso;
    zrbCabecalho: TQRBand;
    zrlLogomarca: TQRImage;
    zrbDetalhe1: TQRBand;
    zrbRodapePagina: TQRBand;
    zrlEmpresaDesenvolvedora: TQRLabel;
    QRShape1: TQRShape;
    zrlPagina: TQRSysData;
    zrbSumario: TQRBand;
    zrlRodape1: TQRLabel;
    zrlProposta: TQRLabel;
    zrlNumeroItem: TQRLabel;
    zrlProduto: TQRLabel;
    zrlEntrega: TQRLabel;
    zrlQuantidade: TQRLabel;
    zrlTotalItem: TQRLabel;
    zrlExtensoTotal: TQRLabel;
    QRShape4: TQRShape;
    zrlSubTotal: TQRLabel;
    zrlDescTotal: TQRLabel;
    zrlDescVendedor: TQRLabel;
    QRShape5: TQRShape;
    zrlVendedor: TQRLabel;
    zrlDescCondicaoPagamento: TQRLabel;
    zrlTipoPag: TQRLabel;
    zrlDescValidade: TQRLabel;
    zdbValidade: TQRDBText;
    zlrDescDias: TQRLabel;
    zrlPrecoUnitario: TQRLabel;
    zrlRodape2: TQRLabel;
    QRDBText1: TQRDBText;
    zrlDescContato: TQRLabel;
    zrlContato: TQRLabel;
    QRShape2: TQRShape;
    zrlDescItem: TQRLabel;
    zrlDescProduto: TQRLabel;
    zrlDescEntrega: TQRLabel;
    zrlDescQuandidade: TQRLabel;
    zrlDescPrecoUnitario: TQRLabel;
    zrlDescTotalItem: TQRLabel;
    QRShape3: TQRShape;
    zrlCliente: TQRLabel;
    zrlFoneFax: TQRLabel;
    zrlDataExtenso: TQRLabel;
    zrlEndereco: TQRLabel;
    zrlBairro: TQRLabel;
    zrlCidadeUF: TQRLabel;
    zrlDescricaoInicial: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalhe1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure reportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbCabecalhoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    PrimeiraPagina : Boolean;
    NumeroItem : integer;
  public
    Entidade: TItem_Pedido_Venda;
    Total,SubTotal, TotMov, TotQtd:Double;
    sContato : String;
  end;

var
  rpt_OrcamentoGrafico: Trpt_OrcamentoGrafico;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_OrcamentoGrafico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Close;
  Cliente1.Close;
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_OrcamentoGrafico.zrbDetalhe1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  vPreco : Double;
//  S : String;
begin
  zrlNumeroItem.Caption := preencheZero(3,NumeroItem);
  inc(NumeroItem);

  zrlQuantidade.Caption := IntToStr(Trunc(Entidade.Quantidade));

  If (Entidade.PrecoDesc<>0) or (DM.Configuracao1.Empresa = empLBM) THEN
    vPreco := Entidade.PrecoDesc
  else
    vPreco := Entidade.Preco;

  SubTotal := SubTotal + vPreco*Entidade.Quantidade;
  TotQtd   := TotQtd   + Entidade.Quantidade;

  zrlProduto.Caption := '';
  with Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
    Open;
    //preencheZero(5,Entidade.CodigoPRD)+'-'+
    zrlProduto.Caption := Descricao+' '+Referencia+
      ', '+Marca;
  end;

  zrlPrecoUnitario.Caption := format('%.2f',[Entidade.PrecoDesc]);
  zrlTotalItem.Caption     := format('%.2f',[Entidade.Quantidade*Arredonda(Entidade.PrecoDesc)]);

  if Entidade.DiasEntrega = 0 then
    zrlEntrega.Caption := 'Imediata'
  else
    zrlEntrega.Caption := IntToStr(Entidade.DiasEntrega);

{  zrlExtensoUnitario.Caption  := '';
  zrlExtensoTotalItem.Caption := '';
  if zrbdetalhe.Height > 50 then
  Begin
    Extenso1.Valor := vPreco;
    S := Extenso1.Texto;
    zrlExtensoUnitario.Caption  := 'Valor Unitario: ('+UpperCase(S)+')';

    Extenso1.Valor := vPreco*Entidade.Quantidade;
    S := Extenso1.Texto;
    zrlExtensoTotalItem.Caption := 'Total do Item : ('+UpperCase(S)+')';
  end;
}  
end;

procedure Trpt_OrcamentoGrafico.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Total:=0;
  SubTotal:=0;
  TotQtd:=0;
end;

procedure Trpt_OrcamentoGrafico.zrbSumarioBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  S, sDadosEmpresa : String;
begin
  if report.CurrentY < 2280 then
    report.CurrentY := 2280
  else
  Begin
    report.NewPage;
    report.CurrentY := 2280;
  end;

  Extenso1.Valor := SubTotal;
  S := Extenso1.Texto;
  zrlExtensoTotal.Caption := 'Total Proposta: ('+UpperCase(S)+')';

  zrlSubTotal.Caption:=Format('%.2f',[SubTotal]);
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
      sDadosEmpresa := sDadosEmpresa + Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);
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

procedure Trpt_OrcamentoGrafico.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;
  PrimeiraPagina := True;
  sContato := '';
  NumeroItem := 1;
end;

procedure Trpt_OrcamentoGrafico.zrbCabecalhoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  sFone: string;
begin
  case DM.Configuracao1.Empresa of
    empEletro  : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A ELETRO GUERRA, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADO';
    empPetromax: zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A PETROMAX, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADO';
    empMotical : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A MOTICAL, PARA FORNECIMENTO DOS PRODUTOS ABAIXO ESPECIFICADOS';
    empCreator : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A CREATOR, PARA FORNECIMENTO DOS PRODUTOS ESPECIFICADOS';
    empAndrea  : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A ANDREA COSTA, PARA FORNECIMENTO DOS PRODUTOS ESPECIFICADOS';
    empLuciano : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A LUCIANO OTICA, PARA FORNECIMENTO DOS PRODUTOS ESPECIFICADOS';
    empHope    : zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A HOPE, PARA FORNECIMENTO DOS PRODUTOS ESPECIFICADOS';
    else
       zrlDescricaoInicial.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A ' +DM.Configuracao1.LojaNome+ ', PARA FORNECIMENTO DOS PRODUTOS ESPECIFICADOS';
  end;

  with Cliente1 do
  Begin
    if (Entidade.FieldByName('CLI_CODIGO').asInteger <> CodigoCLI) or
       (Entidade.FieldByName('CNC_CLIENTE').asInteger <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger:=Entidade.FieldByName('CLI_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger:=Entidade.FieldByName('CNC_CLIENTE').asInteger;
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
    zrlDescContato.Enabled := False;
    zrlContato.Enabled := False;
  end;

  zrlEndereco.Caption := Trim(DM.SelecionaParametro(Cliente1.Logradouro)+' '+Cliente1.Endereco);

  zrlDescricaoInicial.Caption := zrlDescricaoInicial.Caption + ' ' + LowerCase(Entidade.FieldByName('PDV_OBS').asString);

  with CentroCusto1 do
  Begin
    if DM.Configuracao1.CodigoCNC <> CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      Open;
    end;
    zrlDataExtenso.Caption:=DataExtenso(Entidade.FieldByName('PDV_DATA_HORA').AsDateTime,Cidade);
  end;

  zrlTipoPag.Caption := '';
  with DM.Parametro1 do
  Begin
    if Entidade.FieldByName('PDV_TIPO_PAG').asInteger <> CodigoPAR then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger:=Entidade.FieldByName('PDV_TIPO_PAG').asInteger;
      Open;
    end;
    zrlTipoPag.Caption := Trim(zrlTipoPag.Caption + ' ' + Descricao);
  end;

  with Forma_de_Pagamento1 do
  Begin
    if Entidade.FieldByName('FPG_CODIGO').asInteger <> CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger:=Entidade.FieldByName('FPG_CODIGO').asInteger;
      Open;
    end;
    zrlTipoPag.Caption := Trim(zrlTipoPag.Caption + ' ' + Descricao);
  end;

{  with AgenteFin1 do
  Begin
    if Entidade.FieldByName('AGF_CODIGO').asInteger <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger:=Entidade.FieldByName('AGF_CODIGO').asInteger;
      Open;
    end;
    zrlTipoPag.Caption := Tim(zrlTipoPag.Caption + ' ' + Descricao);
  end;
}

  with Funcionario1 do
  Begin
    if Entidade.CodigoFUN <> CodigoFUN then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger:=Entidade.CodigoFUN;
      Open;
    end;
    if Length(Fone) > 5 then
    Begin
      sFone := Fone;
      if Pos(sFone, '') > 0 then
        zrlVendedor.Caption:=Apelido+'   -   Fone: ('+Trim(Copy(sFone,1,Pos(sFone,' ')-1))+') '+Copy(sFone,Pos(sFone,' '),Length(Fone)-Pos(sFone,' ')-1)
      else
        zrlVendedor.Caption:=Apelido+'   -   Fone: '+Fone;
    end
    else
      zrlVendedor.Caption:=Apelido;
  end;
end;

procedure Trpt_OrcamentoGrafico.zrbRodapePaginaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  zrlEmpresaDesenvolvedora.Caption   := EmpresaDesenvolvedora;
end;

end.
