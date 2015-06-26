unit UHistCliResumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Classificacao_fiscal,
  Origem_Fiscal, Fornecedor, Produto, Item_Pedido_Compra, Pedido_de_Venda,
  Parametro, AgenteFin, Forma_de_Pagamento, funcoes;

type
  Trpt_HistCliResumo = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
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
    ZRGroup1: TSZRGroup;
    ZRDBText8: TSZRDBText;
    SZRLabel2: TSZRLabel;
    Cliente1: TCliente;
    zrlTipoPagamento: TSZRLabel;
    AgenteFin1: TAgenteFin;
    ZRLabel20: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel9: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlMaior: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlTotalPedido: TSZRLabel;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    zrlDataEmissao: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private

  public
    TotalGeral:Double;
    TotalRegistros, CdDPVMaior : integer;
  end;

var
  rpt_HistCliResumo: Trpt_HistCliResumo;

implementation
uses
  UDM;

{$R *.DFM}

procedure Trpt_HistCliResumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Pedido_de_Venda1.Close;
 Action:=cafree;
end;

procedure Trpt_HistCliResumo.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGeral.Caption:=Format('%.2f', [TotalGeral]);
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_HistCliResumo.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_HistCliResumo.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=Pedido_de_Venda1.ClienteCNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger:=Pedido_de_Venda1.CodigoCLI;
  Cliente1.Open;
  SZRLabel2.Caption:=Cliente1.RazaoSocial;
end;

procedure Trpt_HistCliResumo.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  inc(TotalRegistros);

  //Verificar se é o Maior Pedido
  if Pedido_de_Venda1.CodigoPDV = CdDPVMaior then
    zrlMaior.Enabled := True
  else
    zrlMaior.Enabled := False;

  //Exibir Data de Emissão ou data de Cadastro
  if Pedido_de_Venda1.DataEmissaoVenda > 0 then
    zrlDataEmissao.Caption := DateToStr(Pedido_de_Venda1.DataEmissaoVenda)
  else
    zrlDataEmissao.Caption := DateToStr(Pedido_de_Venda1.DataHora);  

  //Tipo de Pagamento
  zrlTipoPagamento.Caption := DM.SelecionaParametro(Pedido_de_Venda1.TipoPag);

  //Forma de Pagamento
  with Forma_de_Pagamento1 do
  Begin
    if Pedido_de_Venda1.CodigoFPG <> CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger := Pedido_de_Venda1.CodigoFPG;
      Open;
    end;
    zrlTipoPagamento.Caption := zrlTipoPagamento.Caption + ' ' + Trim(Descricao);
  end;

  //Agente Financeiro
  with AgenteFin1 do
  Begin
    if Pedido_de_Venda1.CodigoAGF <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger := Pedido_de_Venda1.CodigoAGF;
      Open;
    end;
    zrlTipoPagamento.Caption := zrlTipoPagamento.Caption + ' ' + Descricao;
  end;
  zrlTotalPedido.Caption := format('%.2f',[Pedido_de_Venda1.Total]);
  TotalGeral := TotalGeral + Pedido_de_Venda1.Total;
end;

procedure Trpt_HistCliResumo.FormCreate(Sender: TObject);
begin
  TotalGeral := 0;
  TotalRegistros := 0;
end;

procedure Trpt_HistCliResumo.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
