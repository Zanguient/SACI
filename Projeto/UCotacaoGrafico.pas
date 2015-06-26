unit UCotacaoGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, jpeg, QRCtrls, Extenso, CentroCusto,
  Produto, Funcionario, Forma_de_Pagamento, Titulo_receber, AgenteFin, DB,
  Item_Pedido_Venda, Cliente, DBTables, SQuery, Parametro, Usuario,
  Item_de_Mapa_de_Cotacao;

type
  Trpt_CotacaoGrafico = class(TForm)
    report: TQuickRep;
    zrbCabecalho: TQRBand;
    zrlLogomarca: TQRImage;
    zrbDetalhe: TQRBand;
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
    zlrDescDias: TQRLabel;
    zrlPrecoUnitario: TQRLabel;
    zrlRodape2: TQRLabel;
    QRDBText1: TQRDBText;
    Item_de_Mapa_de_Cotacao1: TItem_de_Mapa_de_Cotacao;
    Cliente1: TCliente;
    Extenso1: TValorPorExtenso;
    CentroCusto1: TCentroCusto;
    AgenteFin1: TAgenteFin;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    zrlContinuacao: TQRDBText;
    zrlDescContato: TQRLabel;
    zrlDescricaoInicial: TQRLabel;
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
    QRDBText2: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbCabecalhoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    PrimeiraPagina : Boolean;
    Total, SubTotal, TotQtd:Double;
    NumeroItem : integer;
  public
    Entidade : TItem_de_Mapa_de_Cotacao;
  end;

var
  rpt_CotacaoGrafico: Trpt_CotacaoGrafico;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_CotacaoGrafico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cliente1.Close;
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_CotacaoGrafico.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Mapa_de_Cotacao1;
  PrimeiraPagina := True;
  NumeroItem := 1;
end;

procedure Trpt_CotacaoGrafico.zrbCabecalhoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  sFone: string;
begin

  zrlDescricaoInicial.Caption := '            Conforme solicitado segue abaixo proposta de preços, '+
                                 ' que fazem a empresa ' + DM.Configuracao1.LojaNome +
                                 ', para fornecimento do material especificado:';

  if not PrimeiraPagina then
    zrlContinuacao.Enabled := True;

  PrimeiraPagina := False;

  with Cliente1 do
  Begin
    if (Entidade.FieldByName('FOR_CODIGO').asInteger <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger:=Entidade.FieldByName('FOR_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger:=Entidade.FieldByName('CNC_CODIGO').asInteger;
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

  zrlEndereco.Caption := Trim(DM.SelecionaParametro(Cliente1.Logradouro)+' '+Cliente1.Endereco);

  zrlDescricaoInicial.Caption := zrlDescricaoInicial.Caption + ' ' + LowerCase(Entidade.FieldByName('MCT_OBSERVACAO').asString);

  with CentroCusto1 do
  Begin
    if DM.Configuracao1.CodigoCNC <> CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      Open;
    end;
    zrlDataExtenso.Caption:=DataExtenso(DM.Configuracao1.Data,Cidade);
  end;

  zrlTipoPag.Caption := DM.SelecionaParametro(Entidade.FieldByName('MCT_TIPO_PAG').asInteger);

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
    zrlTipoPag.Caption := Trim(zrlTipoPag.Caption + ' ' + Descricao);
  end;
}  

  with DM.Usuario2 do
  Begin
    DM.NomeUsuario(Entidade.CodigoUSU);
    if Length(Fone) > 5 then
    Begin
      sFone := Fone;
      if Pos(sFone, '') > 0 then
        zrlVendedor.Caption:=NomeUSU+'   -   Fone: ('+Trim(Copy(sFone,1,Pos(sFone,' ')-1))+') '+Copy(sFone,Pos(sFone,' '),Length(Fone)-Pos(sFone,' ')-1)
      else
        zrlVendedor.Caption:=NomeUSU+'   -   Fone: '+Fone;
    end
    else
      zrlVendedor.Caption:=UpperCase(NomeUSU);
  end;
end;

procedure Trpt_CotacaoGrafico.zrbDetalheBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  vPreco : Double;
//  S : string;
begin
  zrlNumeroItem.Caption:=preencheZero(3,NumeroItem);
  inc(NumeroItem);

  //PreencheZero(5,Entidade.CodigoPRD)+'-'+
  zrlProduto.Caption := Entidade.Produto;

  zrlQuantidade.Caption := IntToStr(Trunc(Entidade.Quantidade));

  zrlPrecoUnitario.Caption := Format('%.2f',[Entidade.Preco]);

  zrlTotalItem.Caption := Format('%.2f',[Entidade.Quantidade*Arredonda(Entidade.Preco)]);  

  with Entidade do
  Begin
    vPreco:=(CalculaDesconto(Preco,Desconto));
    vPreco:=vPreco+vPreco*FieldByName('MCT_FRETE').asFloat/100;
  end;

  SubTotal:=SubTotal+vPreco*Entidade.Quantidade;
  TotQtd:=TotQtd+Entidade.Quantidade;

  if Entidade.FieldByName('MCT_PRAZO_ENTREGA').asInteger = 0 then
    zrlEntrega.Caption := 'Imediata'
  else
    zrlEntrega.Caption := Entidade.FieldByName('MCT_PRAZO_ENTREGA').asString;

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

procedure Trpt_CotacaoGrafico.zrbSumarioBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  S : String;
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

  if DM.Configuracao1.Empresa = empLBM then
  Begin
    zrlRodape1.Caption := 'Av. Heraclito Graca, 210 - Centro - Fone/Fax:(85) 433-4646';
    zrlRodape2.Caption := 'www.lbmmoveis.com.br  /  lbm@lbmmoveis.com.br';
  end
  else
  Begin
    zrlRodape1.Caption := '';
    zrlRodape2.Caption := '';
  end;
end;

procedure Trpt_CotacaoGrafico.zrbRodapePaginaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  zrlEmpresaDesenvolvedora.Caption   := EmpresaDesenvolvedora;
end;

end.
