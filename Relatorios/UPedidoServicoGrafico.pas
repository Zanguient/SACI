unit UPedidoServicoGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, jpeg, QRCtrls, Extenso, CentroCusto,
  Produto, Funcionario, Forma_de_Pagamento, Titulo_receber, AgenteFin, DB,
  Item_Pedido_Venda, Cliente, DBTables, SQuery, Parametro;

type
  Trpt_PedidoServicoGrafico = class(TForm)
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
    Funcionario1: TFuncionario;
    Produto1: TProduto;
    CentroCusto1: TCentroCusto;
    zrbCabecalho: TQRBand;
    zrlLogomarca: TQRImage;
    zrbDetalhe1: TQRBand;
    zrbSumario: TQRBand;
    zrlProposta: TQRLabel;
    zrlNumeroItem: TQRLabel;
    zrlProduto: TQRLabel;
    zrlTecnico: TQRLabel;
    zrlQuantidade: TQRLabel;
    zrlTotalItem: TQRLabel;
    QRShape4: TQRShape;
    zrlSubTotal: TQRLabel;
    zrlDescTotal: TQRLabel;
    QRDBText1: TQRDBText;
    zrlDescContato: TQRLabel;
    zrlContato: TQRLabel;
    QRShape2: TQRShape;
    zrlDescItem: TQRLabel;
    zrlDescProduto: TQRLabel;
    zrlDescEntrega: TQRLabel;
    zrlDescQuandidade: TQRLabel;
    zrlDescTotalItem: TQRLabel;
    QRShape3: TQRShape;
    zrlCliente: TQRLabel;
    zrlFoneFax: TQRLabel;
    zrlEndereco: TQRLabel;
    zrlBairro: TQRLabel;
    zrlCidadeUF: TQRLabel;
    zrlDataExtenso: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    zrlRodape1: TQRLabel;
    zrlRodape2: TQRLabel;
    zrlDescHoraINIFIM: TQRLabel;
    QRLabel5: TQRLabel;
    zrlReferenciaEndereco: TQRLabel;
    QRLabel6: TQRLabel;
    zrlTipoVenda: TQRLabel;
    zrlDataServico: TQRLabel;
    zrlObservacao: TQRLabel;
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
  private
    PrimeiraPagina : Boolean;
    NumeroItem : integer;
  public
    Entidade: TItem_Pedido_Venda;
    Total,SubTotal, TotMov:Double;
    sContato : String;
  end;

var
  rpt_PedidoServicoGrafico: Trpt_PedidoServicoGrafico;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_PedidoServicoGrafico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Close;
  Cliente1.Close;
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_PedidoServicoGrafico.zrbDetalhe1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  vPreco : Double;
begin
  zrlNumeroItem.Caption := preencheZero(3,NumeroItem);
  inc(NumeroItem);

  zrlQuantidade.Caption := format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Entidade.Quantidade]);

  if (Entidade.Vinculo >= 0) and
     (Entidade.FieldByName('PDV_TIPO_VENDA').asInteger in [10,11]) then //Serviço ou Contrato
    vPreco := Entidade.PrecoDesc
  else
    vPreco := 0;

  SubTotal := SubTotal + vPreco*Entidade.Quantidade;

  zrlProduto.Caption := '';
  with Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
    Open;
    //preencheZero(5,Entidade.CodigoPRD)+'-'+
    zrlProduto.Caption := Trim(Trim(Descricao+' '+Referencia+
      ' '+Marca)+' '+Entidade.Observacao);
  end;

  if (Entidade.Vinculo >= 0) and
     (Entidade.FieldByName('PDV_TIPO_VENDA').asInteger in [10,11]) then //Serviço ou Contrato
    zrlTotalItem.Caption     := format('%.2f',[Entidade.Quantidade*Arredonda(Entidade.PrecoDesc)])
  else
    zrlTotalItem.Caption     := '-';

  with Funcionario1 do
  Begin
    if (not Active) or
       (Entidade.CodigoFUN <> CodigoFUN) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
      Open;
    end;
    zrlTecnico.Caption := Apelido;
  end;  
end;

procedure Trpt_PedidoServicoGrafico.reportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Total:=0;
  SubTotal:=0;
end;

procedure Trpt_PedidoServicoGrafico.zrbSumarioBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  sDadosEmpresa : String;
begin
  if report.CurrentY < 2280 then
  Begin
//    report.CurrentY := 2280;
  end
  else
  Begin
    report.NewPage;
//    report.CurrentY := 2280;
  end;

  if Entidade.FieldByName('PDV_TIPO_VENDA').asInteger in [10,11] then //Serviço ou Contrato
    zrlSubTotal.Caption:=Format('%.2f',[SubTotal])
  else
    zrlSubTotal.Caption:='-';
    
  Total:=Total+Subtotal;
  SubTotal:=0;

  sDadosEmpresa := '';
  with DM.CentroCusto1 do
  Begin
    sDadosEmpresa := sDadosEmpresa + Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);
    sDadosEmpresa := sDadosEmpresa + ' - ' + Bairro;
    if (Trim(Fone) <> '') and
       ((Trim(Fone) = Trim(Fax)) or
        (Trim(Fax) = '(    )     -')) then
      sDadosEmpresa := sDadosEmpresa + ' - ' + ' Fone/Fax: '+Fone
    else
    Begin
      if Trim(Fone) <> '(    )     -' then
        sDadosEmpresa := sDadosEmpresa + ' - ' + ' Fone: '+Fone;
      if Trim(Fax) <> '(    )     -' then
        sDadosEmpresa := sDadosEmpresa + ' - ' + ' Fax: '+Fax;
    end;
    zrlRodape1.Caption := sDadosEmpresa;
    if (Site <> '') and
       (EMail <> '') then
      zrlRodape2.Caption := 'Site: '+ Site + ' / EMail: ' + EMail
    else if Site <> '' then
      zrlRodape2.Caption := 'Site: '+ Site
    else if EMail <> '' then
      zrlRodape2.Caption := 'EMail: ' + EMail
    else
      zrlRodape2.Caption := '';
  end;
end;

procedure Trpt_PedidoServicoGrafico.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;
  PrimeiraPagina := True;
  sContato := '';                                        
  NumeroItem := 1;
  try
    if FileExists(DM.Configuracao1.PastaImagens+'\LogoMarca.JPG') then
      zrlLogomarca.Picture.LoadFromFile(DM.Configuracao1.PastaImagens+'\LogoMarca.JPG');
  except
  end;
end;

procedure Trpt_PedidoServicoGrafico.zrbCabecalhoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  zrlDataServico.Caption := DateToStr(Entidade.FieldByName('PDV_DT_PREVISAO').asDateTime);

  zrlObservacao.Caption := Entidade.FieldByName('PDV_OBS').asString;

  Case Entidade.FieldByName('PDV_TIPO_VENDA').asInteger of
    10: zrlTipoVenda.Caption := 'SERVIÇO';
    11: zrlTipoVenda.Caption := 'CONTRATO';
    12: zrlTipoVenda.Caption := 'MANUTENÇÃO';
    13: zrlTipoVenda.Caption := 'GARANTIA';
  else
    zrlTipoVenda.Caption := 'NÃO IDENTIFICADO';
  end;

  with Cliente1 do
  Begin
    if (not Active) or
       (Entidade.FieldByName('CLI_CODIGO').asInteger <> CodigoCLI) or
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

    zrlReferenciaEndereco.Caption := Referencia1;
  end;

  if Trim(sContato) <> '' then
    zrlContato.Caption := sContato
  else
  Begin
    zrlDescContato.Enabled := False;
    zrlContato.Enabled := False;
  end;

  zrlEndereco.Caption := Trim(DM.SelecionaParametro(Cliente1.Logradouro)+' '+Cliente1.Endereco);

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
end;

end.
