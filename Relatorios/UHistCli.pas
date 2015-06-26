unit UHistCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, 
  Produto, Pedido_de_Venda, Parametro, AgenteFin;

type
  Trpt_HistCli = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    ZRLabel7: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel9: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRLabel19: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRDBText11: TSZRDBText;
    ZRLabel20: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRLabel14: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRLabel18: TSZRLabel;
    ZRLabel21: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel23: TSZRLabel;
    ZRLabel10: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    Cliente1: TCliente;
    SZRExpression1: TSZRExpression;
    zrlTipoPagamento: TSZRLabel;
    AgenteFin1: TAgenteFin;
    zrlObservacaoPDV: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlProduto: TSZRLabel;
    Produto1: TProduto;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand2AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4AfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TPedido_de_Venda;
    subtotal,total:Double;
  end;

var
  rpt_HistCli: Trpt_HistCli;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_HistCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Entidade.Close;
 Action:=cafree;
end;

procedure Trpt_HistCli.ZRBand2AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  If Entidade.FieldByName('IPV_PRECO_DESC').AsFloat<>0 THEN
    Subtotal:=Subtotal+(Entidade.FieldByName('IPV_QUANTIDADE').AsFloat-
                        Entidade.FieldByName('IPV_BONIFICACAO').AsFloat)*Entidade.FieldByName('IPV_PRECO_DESC').AsFloat
  Else
    Subtotal:=Subtotal+(Entidade.FieldByName('IPV_QUANTIDADE').AsFloat-
                        Entidade.FieldByName('IPV_BONIFICACAO').AsFloat)*Entidade.FieldByName('IPV_PRECO').AsFloat;
end;

procedure Trpt_HistCli.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel19.Caption:=Format('%.2f', [Total]);
end;

procedure Trpt_HistCli.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;


procedure Trpt_HistCli.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel22.Caption:=Format('%.2f', [SubTotal]);
end;

procedure Trpt_HistCli.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total := 0;
  SubTotal := 0;
end;

procedure Trpt_HistCli.ZRBand4AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  Total:=Total+SubTotal;
  SubTotal:=0;
end;

procedure Trpt_HistCli.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=Entidade.ClienteCNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger:=Entidade.CodigoCLI;
  Cliente1.Open;
  SZRLabel2.Caption:=Cliente1.RazaoSocial;
end;

procedure Trpt_HistCli.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTipoPagamento.Caption := DM.SelecionaParametro(Entidade.TipoPag);

  with AgenteFin1 do
  Begin
    if Entidade.CodigoAGF <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger := Entidade.CodigoAGF;
      Open;
    end;
    zrlTipoPagamento.Caption := zrlTipoPagamento.Caption + ' ' + Descricao;
  end;

  zrlObservacaoPDV.Caption := Entidade.OBS;
end;

procedure Trpt_HistCli.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_HistCli.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> Entidade.FieldByName('PRD_CODIGO').asInteger) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.FieldByName('PRD_CODIGO').asInteger;
      Open;
    end;
    if DM.Configuracao1.Empresa = empEletro then
      zrlProduto.Caption := PreencheZero(8,CodigoPRD)+'-'+Descricao+' '+Caracteristica+' '+Unidade+' '+Referencia+' '+Marca
    else
      zrlProduto.Caption := PreencheZero(8,CodigoPRD)+'-'+Descricao+' '+Unidade+' '+Referencia+' '+Marca;
  end;
end;

procedure Trpt_HistCli.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
end;

end.
