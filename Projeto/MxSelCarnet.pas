unit MxSelCarnet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfmxSelCarnet = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmxSelCarnet: TfmxSelCarnet;

implementation

uses UCarnetCont, UCarnet, MxSPediLocImpPromis, MxPedidoRapido;

{$R *.DFM}


procedure TfmxSelCarnet.BitBtn1Click(Sender: TObject);
begin
  if tag = 1 then
  Begin
    if RadioButton1.Checked then
    Begin
      Application.CreateForm(Trpt_carnetCont, rpt_carnetCont);
      rpt_carnetCont.Parametro1.Open;
      rpt_carnetCont.Titulo_receber1.ParamByName('PDV').AsInteger:=fMxSPedLocImpPromis.Pedido_de_Venda1.CodigoPDV;
      rpt_carnetCont.Titulo_receber1.ParamByName('CNC').AsInteger:=fMxSPedLocImpPromis.Pedido_de_Venda1.CodigoCNC;
      rpt_carnetCont.Titulo_receber1.open;
      rpt_carnetCont.report.preview;
      rpt_carnetCont.Close;
    end
    else
    Begin
      Application.CreateForm(Trpt_carnet, rpt_carnet);
//      rpt_carnet.Parametro1.Open;
      rpt_Carnet.Titulo_receber1.ParamByName('PDV').AsInteger:=fMxSPedLocImpPromis.Pedido_de_Venda1.CodigoPDV;
      rpt_Carnet.Titulo_receber1.ParamByName('CNC').AsInteger:=fMxSPedLocImpPromis.Pedido_de_Venda1.CodigoCNC;
      rpt_Carnet.Titulo_receber1.open;
      rpt_carnet.report.preview;
      rpt_carnet.Close;
    end;
  end
  else if tag = 3 then
  Begin
    if RadioButton1.Checked then
    Begin
      Application.CreateForm(Trpt_carnetCont, rpt_carnetCont);
      rpt_carnetCont.Titulo_receber1.Close;
      rpt_carnetCont.Titulo_receber1.ParamByName('PDV').AsInteger:=fMxPedidoRapido.Pedido_de_Venda1.CodigoPDV;
      rpt_carnetCont.Titulo_receber1.ParamByName('CNC').AsInteger:=fMxPedidoRapido.Pedido_de_Venda1.CodigoCNC;
      rpt_carnetCont.Titulo_receber1.open;
      rpt_carnetCont.report.preview;
      rpt_carnetCont.Close;
    end
    else
    Begin
      Application.CreateForm(Trpt_carnet, rpt_carnet);
      rpt_Carnet.Titulo_receber1.Close;
      rpt_Carnet.Titulo_receber1.ParamByName('PDV').AsInteger:=fMxPedidoRapido.Pedido_de_Venda1.CodigoPDV;
      rpt_Carnet.Titulo_receber1.ParamByName('CNC').AsInteger:=fMxPedidoRapido.Pedido_de_Venda1.CodigoCNC;
      rpt_Carnet.Titulo_receber1.open;
      rpt_carnet.report.preview;
      rpt_carnet.Close;
    end;
  end;
end;

procedure TfmxSelCarnet.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelCarnet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

end.
