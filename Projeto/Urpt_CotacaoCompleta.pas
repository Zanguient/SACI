unit Urpt_CotacaoCompleta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, CentroCusto, Funcionario,
  Forma_de_Pagamento, AgenteFin, Parametro, SQuery, Item_de_Mapa_de_Cotacao,
  Cliente, Usuario, Extenso;

type
  Trpt_CotacaoCompleta = class(TForm)
    report: TSZReport;
    zrbdetalhe: TSZRBand;
    zdbProduto: TSZRDBText;
    ZRDBText10: TSZRDBText;
    SZRLabel1: TSZRLabel;
    zrlEntrega: TSZRLabel;
    zrbGrupoPDV: TSZRGroup;
    ZRLabel24: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlDataExtenso: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel37: TSZRLabel;
    SZRLabel47: TSZRLabel;
    SZRLabel64: TSZRLabel;
    SZRLabel155: TSZRLabel;
    SZRLabel6: TSZRLabel;
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
    SZRLabel49: TSZRLabel;
    SZRLabel53: TSZRLabel;
    SZRLabel48: TSZRLabel;
    SZRLabel52: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlVendedor: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlRodape1: TSZRLabel;
    zrlRodape2: TSZRLabel;
    SZRBand2: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRSysData3: TSZRSysData;
    zrbCabecalho: TSZRBand;
    zrlCabecalho: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlContinuacao: TSZRLabel;
    Item_de_Mapa_de_Cotacao1: TItem_de_Mapa_de_Cotacao;
    AgenteFin1: TAgenteFin;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    CentroCusto1: TCentroCusto;
    Cliente1: TCliente;
    zrlPrecoUnitario: TSZRLabel;
    zrlPreco: TSZRLabel;
    zrlCodigoPRD: TSZRLabel;
    zrlValidade: TSZRLabel;
    zrlContato: TSZRDBText;
    zrlNumeroItem: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlExtensoUnitario: TSZRLabel;
    zrlExtensoTotalItem: TSZRLabel;
    zrlExtensoTotal: TSZRLabel;
    Extenso1: TValorPorExtenso;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoPDVBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbdetalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    PrimeiraPagina : Boolean;
    Total, SubTotal, TotQtd:Double;
    NumeroItem : integer;
  public
    Entidade : TItem_de_Mapa_de_Cotacao;
  end;

var
  rpt_CotacaoCompleta: Trpt_CotacaoCompleta;

implementation

uses UDM, Funcoes;

{$R *.DFM}

procedure Trpt_CotacaoCompleta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cliente1.Close;
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_CotacaoCompleta.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Mapa_de_Cotacao1;
  PrimeiraPagina := True;
end;

procedure Trpt_CotacaoCompleta.zrbCabecalhoBeforePrint(Sender: TObject;
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

procedure Trpt_CotacaoCompleta.zrbGrupoPDVBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel6.Caption := 'PROPOSTA DE PRECOS QUE FAZEM A EMPRESA '+
                       DM.Configuracao1.LojaNome + ', PARA FORNECIMENTO DO MATERIAL ABAIXO ESPECIFICADO';

  NumeroItem := 1;
  with Cliente1 do
  Begin
    if (Entidade.FieldByName('FOR_CODIGO').asInteger <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger:=Entidade.FieldByName('FOR_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger:=Entidade.FieldByName('CNC_CODIGO').asInteger;
      Open;
    end;
    SZRLabel10.Caption:=RazaoSocial+' ('+IntToStr(CodigoCLI)+')';
    if (Fone <> '') and (Fax <> '') then
      SZRLabel37.Caption:=Fone+' / '+Fax
    else if Fone <> '' then
      SZRLabel37.Caption:=Fone
    else
      SZRLabel37.Caption:=Fax;

    SZRLabel18.Caption:=Bairro;
    SZRLabel19.Caption:=Cidade+'/'+Uf;
  end;

  DM.SelecionaParametro(Cliente1.Logradouro);
  if not DM.Parametro1.IsEmpty then
    SZRLabel17.Caption := DM.Parametro1.Descricao+' '+Cliente1.Endereco
  else
    SZRLabel17.Caption := Cliente1.Endereco;

  SZRLabel31.Caption:=Entidade.FieldByName('MCT_OBSERVACAO').asString;

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

  with Forma_de_Pagamento1 do
  Begin
    if Entidade.FieldByName('FPG_CODIGO').asInteger <> CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger:=Entidade.FieldByName('FPG_CODIGO').asInteger;
      Open;
    end;
    SZRLabel48.Caption:=Descricao;
  end;

  SZRLabel53.Caption := DM.SelecionaParametro(Entidade.FieldByName('MCT_TIPO_PAG').asInteger);

  with DM.Usuario2 do
  Begin
    DM.NomeUsuario(Entidade.CodigoUSU);
    if Fone <> '' then
      zrlVendedor.Caption:=UpperCase(NomeUSU)+' - Fone:'+Fone
    else
      zrlVendedor.Caption:=UpperCase(NomeUSU);
  end;
end;

procedure Trpt_CotacaoCompleta.zrbdetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vPreco : Double;
  S : string;
begin
  zrlNumeroItem.Caption:=preencheZero(3,NumeroItem);
  inc(NumeroItem);

  zrlCodigoPRD.Caption:=preencheZero(5,Entidade.CodigoPRD);

  with Entidade do
  Begin
    vPreco:=(CalculaDesconto(Preco,Desconto));
    vPreco:=vPreco+vPreco*FieldByName('MCT_FRETE').asFloat/100;
  end;

  zrlPrecoUnitario.Caption := format('%.2f',[vPreco]);
  zrlPreco.Caption := format('%.2f',[vPreco*Entidade.Quantidade]);

  SubTotal:=SubTotal+vPreco*Entidade.Quantidade;
  TotQtd:=TotQtd+Entidade.Quantidade;

  if Entidade.FieldByName('MCT_PRAZO_ENTREGA').asInteger = 0 then
    zrlEntrega.Caption := 'Imediata'
  else
    zrlEntrega.Caption := Entidade.FieldByName('MCT_PRAZO_ENTREGA').asString;

  if zrbdetalhe.Height >= 5 then
  Begin
    Extenso1.Valor := vPreco;
    S := Extenso1.Texto;
    zrlExtensoUnitario.Caption  := 'Valor Unitario: ('+UpperCase(S)+')';

    Extenso1.Valor := vPreco*Entidade.Quantidade;
    S := Extenso1.Texto;
    zrlExtensoTotalItem.Caption := 'Total do Item : ('+UpperCase(S)+')';
  end;
end;

procedure Trpt_CotacaoCompleta.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  S : String;
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
    if Entidade.FieldByName('AGF_CODIGO').asInteger <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger:=Entidade.FieldByName('AGF_CODIGO').asInteger;
      Open;
    end;
    zrlAgenteFinanceiro.Caption:=Descricao;
  end;

  ZRLabel26.Caption:=Format('%.2f',[SubTotal]);
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

procedure Trpt_CotacaoCompleta.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
