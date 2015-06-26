unit uPedidoVendaDARUMA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Funcionario,
  Pedido_de_Venda;

type
  Trpt_PedidoVendaDARUMA = class(TForm)
    report: TSZReport;
    ZRBand2: TSZRBand;
    Pedido_de_Venda1: TPedido_de_Venda;
    ZRDBText3: TSZRDBText;
    ZRDBText9: TSZRDBText;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_RZ_SOCIAL: TStringField;
    Pedido_de_Venda1CLI_LOGRADOURO: TIntegerField;
    Pedido_de_Venda1CLI_ENDERECO: TStringField;
    Pedido_de_Venda1CLI_BAIRRO: TStringField;
    Pedido_de_Venda1CLI_CIDADE: TStringField;
    Pedido_de_Venda1CLI_UF: TStringField;
    Pedido_de_Venda1CLI_FONE: TStringField;
    Pedido_de_Venda1IPV_QUANTIDADE: TFloatField;
    Pedido_de_Venda1IPV_CODIGO: TIntegerField;
    Pedido_de_Venda1PRD_CODIGO: TIntegerField;
    Pedido_de_Venda1IPV_PRECO: TFloatField;
    Pedido_de_Venda1IPV_PRECO_DESC: TFloatField;
    Pedido_de_Venda1PRD_DESCRICAO: TStringField;
    Pedido_de_Venda1PRD_CODIGO_1: TIntegerField;
    Pedido_de_Venda1PRD_REFERENCIA: TStringField;
    Pedido_de_Venda1PRD_MARCA: TStringField;
    Pedido_de_Venda1PRD_UNIDADE: TStringField;
    Pedido_de_Venda1CLI_PESSOA_FISICA: TSmallintField;
    Pedido_de_Venda1CLI_CGC_CPF: TStringField;
    Pedido_de_Venda1CLI_CGF_RG: TStringField;
    Funcionario1: TFuncionario;
    Pedido_de_Venda1FUN_CODIGO: TIntegerField;
    zrbGrupoPDV: TSZRGroup;
    ZRSysData2: TSZRSysData;
    zrlDadosLoja: TSZRLabel;
    ZRLabel5: TSZRLabel;
    zrlLinhaDupla2: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText1: TSZRDBText;
    ZRDBText11: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel1: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRBand1: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel4: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlSituacao: TSZRLabel;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    zrlSite: TSZRLabel;
    SZRDBText8: TSZRDBText;
    Pedido_de_Venda1PRD_LOCAL: TStringField;
    zrlQuantidade: TSZRLabel;
    Pedido_de_Venda1IPV_BONIFICACAO: TFloatField;
    zrlCondicaoPagamento: TSZRLabel;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoPDVBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    vExibirEstoque:Boolean;
    total:Double;
  end;

var
  rpt_PedidoVendaDARUMA: Trpt_PedidoVendaDARUMA;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_PedidoVendaDARUMA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Pedido_de_Venda1.Close;
  Action:=cafree;
end;

procedure Trpt_PedidoVendaDARUMA.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  total:=0;
end;

procedure Trpt_PedidoVendaDARUMA.zrbGrupoPDVBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlDadosLoja.Caption:=DM.Configuracao1.LojaNome;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Open;
    if Trim(FieldByName('CNC_FONE').asString) <> '' then
      zrlDadosLoja.Caption:=zrlDadosLoja.Caption+' - '+FieldByName('CNC_FONE').asString;

    if DM.Configuracao1.Empresa = 2 then
      zrlSite.Caption := 'www.petromax.com.br - vendas@petromax.com.br';

    //Três letras identificando o Tipo de Pagamento
    DM.SelecionaParametro(Pedido_de_Venda1.TipoPag);
    if Length(Trim(DM.Parametro1.Descricao)) >= 3 then
      zrlCondicaoPagamento.Caption := Copy(Trim(DM.Parametro1.Descricao),1,3)
    else
      zrlCondicaoPagamento.Caption := Trim(DM.Parametro1.Descricao);

    //O prazo da venda Ex: 0;30;60
    Close;
    SQL.Text := 'SELECT FPG_PRAZO '+
      ' FROM FORMA_DE_PAGAMENTO '+
      ' WHERE FPG_CODIGO='+IntToStr(Pedido_de_Venda1.CodigoFPG);
    Open;
    zrlCondicaoPagamento.Caption := Trim(zrlCondicaoPagamento.Caption + ' ' + FieldByName('FPG_PRAZO').asString);

    //Três letras identificando o Agente financeiro
    Close;
    SQL.Text := 'SELECT AGF_DESCRICAO '+
      ' FROM AGENTE_FINANCEIRO '+
      ' WHERE AGF_CODIGO='+IntToStr(Pedido_de_Venda1.CodigoAGF);
    Open;
    if Length(Trim(FieldByName('AGF_DESCRICAO').asString)) >= 3 then
      zrlCondicaoPagamento.Caption := Trim(zrlCondicaoPagamento.Caption + ' ' + Copy(FieldByName('AGF_DESCRICAO').asString,1,3))
    else
      zrlCondicaoPagamento.Caption := Trim(zrlCondicaoPagamento.Caption + ' ' + FieldByName('AGF_DESCRICAO').asString);
  end;

  if Pedido_de_Venda1.Situacao = 4 then
    zrlSituacao.Caption := 'F'
  else if Pedido_de_Venda1.Situacao in [0,3] then
    zrlSituacao.Caption := 'A'
  else
    zrlSituacao.Caption := '';

  SZRLabel3.Caption:= Trim(DM.SelecionaParametro(Pedido_de_Venda1.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                           Pedido_de_Venda1.FieldByName('CLI_ENDERECO').asString);

  if Pedido_de_Venda1.FieldByName('CLI_PESSOA_FISICA').asInteger = 1 then
    Pedido_de_Venda1CLI_CGC_CPF.EditMask := '999-999-999-99;0;_'
  else
    Pedido_de_Venda1CLI_CGC_CPF.EditMask := '99-999-999/9999-99;0;_';

  Funcionario1.Close;
  Funcionario1.ParamByName('CNC_CODIGO').asInteger:=Pedido_de_Venda1.CodigoCNC;
  Funcionario1.ParamByName('FUN_CODIGO').asInteger:=Pedido_de_Venda1.FieldByName('FUN_CODIGO').asInteger;
  Funcionario1.Open;
  SZRLabel9.Caption:=Funcionario1.Apelido;
end;

procedure Trpt_PedidoVendaDARUMA.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel19.Caption:=Format('%.2f', [Total]);
end;

procedure Trpt_PedidoVendaDARUMA.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  PrecoUnit:string;
begin
  if vExibirEstoque then
  Begin
    with DM.QR_Consultas do
    Begin
      CLose;
      SQL.Text := 'SELECT IES_SFISICO '+
        ' FROM ITEM_DE_ESTOQUE '+
        ' WHERE PRD_CODIGO='+Pedido_de_Venda1.FieldByName('PRD_CODIGO').asString+
        ' AND CNC_CODIGO='+Pedido_de_Venda1.FieldByName('CNC_CODIGO').asString;
      Open;
      zrlQuantidade.Caption := FloatToStr(Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').asFloat)+
                               '('+FloatToStr(FieldByName('IES_SFISICO').asFloat)+')';
    end;
  end
  else
    zrlQuantidade.Caption := FloatToStr(Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').asFloat);

  If Pedido_de_Venda1.FieldByName('IPV_PRECO_DESC').AsFloat<>0 THEN
  Begin
    PrecoUnit:=format('%.2f',[Pedido_de_Venda1.FieldByName('IPV_PRECO_DESC').AsFloat]);
    SZRLabel13.Caption := PrecoUnit;
    SZRLabel12.Caption := format('%.2f',[(Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat-
                                          Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').AsFloat)*StrToFloat(PrecoUnit)]);
    total:=total+Arredonda((Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat-Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').AsFloat)*StrTOFloat(PrecoUnit));
  end
  Else
  Begin
    PrecoUnit:= format('%.2f',[Pedido_de_Venda1.FieldByName('IPV_PRECO').AsFloat]);
    SZRLabel13.Caption := PrecoUnit;
    SZRLabel12.Caption := format('%.2f',[(Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat-Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').AsFloat)*StrToFloat(PrecoUnit)]);
    total:=total+Arredonda((Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat-Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').AsFloat)*StrToFloat(PrecoUnit));
  end;
end;

procedure Trpt_PedidoVendaDARUMA.FormCreate(Sender: TObject);
begin
  vExibirEstoque := False;
end;

end.
