unit UPedidoVendaParcelasPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZRCtrls, ZReport, DB, DBTables, SQuery, Pedido_de_Venda;

type
  Trpt_PedidoVendaParcelasPDV = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlDadosLoja: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel6: TSZRLabel;
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
    ZRBand5: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel7: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
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
    Pedido_de_Venda1IPV_ENTREGA: TSmallintField;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Pedido_de_Venda1IPV_BONIFICACAO: TFloatField;
    Pedido_de_Venda1FUN_CODIGO: TIntegerField;
    zrbDetalhe: TSZRBand;
    zrlParcela1: TSZRLabel;
    zrlParcela2: TSZRLabel;
    zrlParcela3: TSZRLabel;
    zrlParcela4: TSZRLabel;
    zrlParcela5: TSZRLabel;
    zrlParcela6: TSZRLabel;
    zrlParcela7: TSZRLabel;
    zrlParcela8: TSZRLabel;
    zrlParcela9: TSZRLabel;
    zrlParcela10: TSZRLabel;
    zrlParcela11: TSZRLabel;
    zrlParcela12: TSZRLabel;
    zrlParcela13: TSZRLabel;
    Pedido_de_Venda1PDV_ANTECIPADO: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlDadosLojaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    total: Double;
  end;

var
  rpt_PedidoVendaParcelasPDV: Trpt_PedidoVendaParcelasPDV;


implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_PedidoVendaParcelasPDV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Pedido_de_Venda1.Close;
  Action:=cafree;
end;

procedure Trpt_PedidoVendaParcelasPDV.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel7.Caption := EmpresaDesenvolvedora;
  //zrlTotalPedido.Caption:=Format('%.2f', [Total]);
  if Pedido_de_Venda1.FieldByName('PDV_ANTECIPADO').asFloat <> 0 then
    zrlParcela1.Caption := zrlParcela1.Caption + ' Pgto Antec';
end;

procedure Trpt_PedidoVendaParcelasPDV.zrlDadosLojaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
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

procedure Trpt_PedidoVendaParcelasPDV.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  total := 0;
end;

procedure Trpt_PedidoVendaParcelasPDV.ZRBand1BeforePrint(Sender: TObject;
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

end.
