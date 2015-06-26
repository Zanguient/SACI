unit MxSPediCtCus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  CentroCusto, Item_de_Estoque, Produto;

type
  TfMxSPedCtCus = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Item_de_Estoque1: TItem_de_Estoque;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CentroCusto1AfterScroll(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSPedCtCus: TfMxSPedCtCus;

implementation

uses
  MxSPediProd, UDM, MxPedidoRapido;

{$R *.DFM}
Procedure TfMxSPedCtCus.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSPedCtCus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Centrocusto1.Close;
  Action:=Cafree;
end;

procedure TfMxSPedCtCus.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
end;

procedure TfMxSPedCtCus.CentroCusto1AfterScroll(DataSet: TDataSet);
begin
  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CentroCusto1.CodigoCNC;
    ParamByName('PRD_CODIGO').asInteger := StrToInt(fMxPedidoRapido.edtCodigoPRD.Text);
    Open;
  end;
end;

procedure TfMxSPedCtCus.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
