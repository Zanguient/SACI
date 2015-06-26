unit UAnalSHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Pedido_de_Venda;

type
  Trpt_SHistorico = class(TForm)
    report_hist: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText11: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRExpression1: TSZRExpression;
    ZRLabel1: TSZRLabel;
    Pedido_de_Venda2: TPedido_de_Venda;
    procedure ZRLabel1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pedido_de_Venda2BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_SHistorico: Trpt_SHistorico;

implementation
uses
    UDM;
{$R *.DFM}


procedure Trpt_SHistorico.ZRLabel1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
IF Pedido_de_venda2.Situacao = -1     then
   ZRLabel1.Caption:='Venda Reservada'
else if Pedido_de_venda2.Situacao = 0 then
   ZRLabel1.Caption:='Abertura'
else if Pedido_de_venda2.Situacao = 1 then
   ZRLabel1.Caption:='Intencao de Compra'
else if Pedido_de_venda2.Situacao = 2 then
   ZRLabel1.Caption:='Cliente com Cadastro'
else if Pedido_de_venda2.Situacao = 3 then
   ZRLabel1.Caption:='Venda Aprovada'
else if Pedido_de_venda2.Situacao = 4 then
   ZRLabel1.Caption:='Venda Confirmada'
else if Pedido_de_venda2.Situacao = 5 then
   ZRLabel1.Caption:='Consign. Confirmada'
else if Pedido_de_venda2.Situacao = 6 then
   ZRLabel1.Caption:='Venda Cancelada'
else if Pedido_de_venda2.Situacao = 7 then
   ZRLabel1.Caption:='Consign. Cancelada'
else if Pedido_de_venda2.Situacao = 8 then
   ZRLabel1.Caption:='Venda Devolvida'
else if Pedido_de_venda2.Situacao = 9 then
   ZRLabel1.Caption:='Consign. Devolvida'
else if Pedido_de_venda2.Situacao = 10 then
   ZRLabel1.Caption:='Credito não Aprovado'
else if Pedido_de_venda2.Situacao = 11 then
   ZRLabel1.Caption:='Pedido finalizado';
end;

procedure Trpt_SHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_SHistorico.Pedido_de_Venda2BeforeOpen(DataSet: TDataSet);
begin
  Pedido_de_Venda2.ParamByName('CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

end.
