unit UPedidoVendaItemPDVRed2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Pedido_de_Venda;

type
  Trpt_PedidoVendaItemPDVRed2 = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlDadosLoja: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel6: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    ZRLabel18: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel15: TSZRLabel;
    zrlDescTotalPedido: TSZRLabel;
    ZRDBText3: TSZRDBText;
    zrlTotalPedido: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText1: TSZRDBText;
    ZRDBText11: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel1: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel7: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText6: TSZRDBText;
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
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRDBText3: TSZRDBText;
    Pedido_de_Venda1CLI_PESSOA_FISICA: TSmallintField;
    Pedido_de_Venda1CLI_CGC_CPF: TStringField;
    Pedido_de_Venda1CLI_CGF_RG: TStringField;
    Pedido_de_Venda1IPV_ENTREGA: TSmallintField;
    zrlValorUnit: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    zrlQuantidade: TSZRLabel;
    Pedido_de_Venda1IPV_BONIFICACAO: TFloatField;
    Pedido_de_Venda1FUN_CODIGO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlDadosLojaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    total:Double;
  end;

var
  rpt_PedidoVendaItemPDVRed2: Trpt_PedidoVendaItemPDVRed2;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_PedidoVendaItemPDVRed2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Pedido_de_Venda1.Close;
  Action:=cafree;
end;

procedure Trpt_PedidoVendaItemPDVRed2.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalPedido.Caption:=Format('%.2f', [Total]);
  ZRLabel7.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_PedidoVendaItemPDVRed2.zrlDadosLojaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlDadosLoja.Caption:=DM.Configuracao1.LojaNome;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Open;
    if Trim(FieldByName('CNC_FONE').asString) <> '' then
      zrlDadosLoja.Caption := zrlDadosLoja.Caption+' - '+FieldByName('CNC_FONE').asString;

    if VerificaInteiroBranco(Pedido_de_Venda1.FieldByName('FUN_CODIGO').asString) then
    Begin
      Close;
      SQL.Text := 'SELECT FUN_APELIDO '+
        ' FROM FUNCIONARIO '+
        ' WHERE FUN_CODIGO='+Pedido_de_Venda1.FieldByName('FUN_CODIGO').asString;
      Open;
      zrlDadosLoja.Caption := zrlDadosLoja.Caption + ' ' + FieldByName('FUN_APELIDO').asString;
    end;
  end;
end;

procedure Trpt_PedidoVendaItemPDVRed2.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  total:=0;
end;

procedure Trpt_PedidoVendaItemPDVRed2.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Pedido_de_Venda1.Situacao = 4 then
    SZRLabel7.Caption := 'F'
  else if Pedido_de_Venda1.Situacao in [0,3] then
    SZRLabel7.Caption := 'A'
  else
    SZRLabel7.Caption := '';

  SZRLabel3.Caption := Trim(DM.SelecionaParametro(Pedido_de_Venda1.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                            Pedido_de_Venda1.FieldByName('CLI_ENDERECO').asString);

  if Pedido_de_Venda1.FieldByName('CLI_PESSOA_FISICA').asInteger = 1 then
    Pedido_de_Venda1CLI_CGC_CPF.EditMask := '999-999-999-99;0;_'
  else
    Pedido_de_Venda1CLI_CGC_CPF.EditMask := '99-999-999/9999-99;0;_';
end;

procedure Trpt_PedidoVendaItemPDVRed2.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlQuantidade.Caption := Format('%.2f',[Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').asFloat]);
  if Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').asFloat > 0 then
    zrlQuantidade.Caption := zrlQuantidade.Caption + '('+Format('%.2f',[Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').asFloat])+')';
    
  zrlValorUnit.Caption:=format('%.2f',[Pedido_de_Venda1.FieldByName('IPV_PRECO_DESC').asFloat]);

  zrlTotalItem.Caption:=format('%.2f',[(StrToFloat(zrlValorUnit.Caption)*Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').asFloat)-
                                       (StrToFloat(zrlValorUnit.Caption)*Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').asFloat)]);

  Total:=Total+StrToFloat(zrlTotalItem.Caption);
end;

end.
