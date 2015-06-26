unit MxSPediCliHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Parametro, Menus, CentroCusto;

type
  TfMxSPedCliHist = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    DS_cliente1: TDataSource;
    Cliente1: TCliente;
    MainMenu2: TMainMenu;
    MenuItem1: TMenuItem;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    Panel2: TPanel;
    Label44: TLabel;
    DBLookupComboBox42: TDBLookupComboBox;
    SB_Loc: TSpeedButton;
    Edit11: TEdit;
    Label19: TLabel;
    ComboBox2: TComboBox;
    Label20: TLabel;
    BitBtn1: TBitBtn;
    SpeedButton7: TSpeedButton;
    Confirmar1: TMenuItem;
    procedure ComboBox2Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox42Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cancelar:boolean;
  end;

var
  fMxSPedCliHist: TfMxSPedCliHist;

implementation
Uses
UDM, funcoes, MxPedidoRapido, DigSenha, CdInfCredito,
  UPedidoVendaItemPDVRed2;
{$R *.DFM}



procedure TfMxSPedCliHist.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfMxSPedCliHist.SB_LocClick(Sender: TObject);
begin
  cliente1.Close;
  cliente1.Open;
  cliente1.Selecionar;
end;


procedure TfMxSPedCliHist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cliente1.Active:=False;
  Action:=Cafree;
end;


procedure TfMxSPedCliHist.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(Trpt_PedidoVendaItemPDVRed2, rpt_PedidoVendaItemPDVRed2);
  with rpt_PedidoVendaItemPDVRed2 do
  Begin
    Pedido_de_venda1.close;
    Pedido_de_venda1.SQL.Text:='SELECT T1.CNC_CLIENTE,T1.PDV_CODIGO,T1.PDV_DATA_HORA,T1.PDV_TOTAL,'+
       'T2.CLI_CODIGO,T2.CNC_CODIGO,T2.CLI_RZ_SOCIAL,'+
       'T3.IPV_QUANTIDADE,T3.IPV_BONIFICACAO,T3.IPV_CODIGO,T3.PRD_CODIGO,T3.IPV_PRECO,T3.IPV_PRECO_DESC,'+
       'T4.PRD_DESCRICAO,T4.PRD_CODIGO,T4.PRD_REFERENCIA,T4.PRD_MARCA,T4.PRD_UNIDADE '+
       'FROM PEDIDO_DE_VENDA T1, CLIENTE T2, ITEM_DE_PEDIDO_DE_VENDA T3, PRODUTO T4 '+
       'WHERE (T1.CLI_CODIGO=T2.CLI_CODIGO) AND '+
       '(T1.CNC_CLIENTE=T2.CNC_CODIGO) AND '+
       '(T1.PDV_CODIGO=T3.PDV_CODIGO) AND '+
       '(T3.PRD_CODIGO=T4.PRD_CODIGO) AND T2.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
       ' AND T2.CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC);
    Pedido_de_venda1.open;
    total:=0;
    report.Height := report.Height + 2*Pedido_de_venda1.RecordCount;
    report.preview;
    Close;
  end;
end;

procedure TfMxSPedCliHist.BitBtn2Click(Sender: TObject);
begin
  Close;
end;


procedure TfMxSPedCliHist.MenuItem1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxSPedCliHist.FormShow(Sender: TObject);
begin
 DM.Usuario1.ConfiguraTela(self);
 CentroCusto2.Open;
 if not Cliente1.Active then
   Cliente1.Open;
  try
    ComboBox2.ItemIndex:=0;
  except
  end;
end;    

procedure TfMxSPedCliHist.DBLookupComboBox42Click(Sender: TObject);
begin
  Cliente1.close;
  Cliente1.Open;
end;

procedure TfMxSPedCliHist.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

end.
