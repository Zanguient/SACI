unit MxSPediTab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Tabela_de_Precos, Item_Tabela_de_Precos, Produto;

type
  TfMxSPedTab = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Item_Tabela_de_Precos1: TItem_Tabela_de_Precos;
    DSItem_Tabela_de_Precos1: TDataSource;
    Item_Tabela_de_Precos1ITP_PRECO: TFloatField;
    Item_Tabela_de_Precos1ITP_BONIFICACAO: TFloatField;
    Item_Tabela_de_Precos1ITP_QUANT_MIN: TFloatField;
    Item_Tabela_de_Precos1TBP_PRAZO_MEDIO: TIntegerField;
    Item_Tabela_de_Precos1TBP_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1CNC_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1TBP_DESCRICAO: TStringField;
    Item_Tabela_de_Precos1ITP_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1PRD_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1ITP_PRECO_ORIGINAL: TFloatField;
    Item_Tabela_de_Precos1TBP_CODIGO_1: TIntegerField;
    Item_Tabela_de_Precos1CNC_CODIGO_1: TIntegerField;
    Item_Tabela_de_Precos1TBP_INDICE: TFloatField;
    Item_Tabela_de_Precos1TBP_VALIDADE: TDateTimeField;
    Item_Tabela_de_Precos1TBP_DESCONTO_SIMPLES: TFloatField;
    Item_Tabela_de_Precos1TBP_DESCONTO_ESPECIAL: TFloatField;
    Item_Tabela_de_Precos1ITP_DT_CADASTRO: TDateTimeField;
    Item_Tabela_de_Precos1ITP_DT_ALTERADO: TDateTimeField;
    Item_Tabela_de_Precos1USU_CODIGO: TIntegerField;
    Item_Tabela_de_Precos1USU_CODIGO_1: TIntegerField;
    Item_Tabela_de_Precos1TBP_DT_ALTERADO: TDateTimeField;
    Item_Tabela_de_Precos1TBP_DESCONTO_SIMPLES_PRAZO: TFloatField;
    Item_Tabela_de_Precos1TBP_DESCONTO_ESPECIAL_PRAZO: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSPedTab: TfMxSPedTab;

implementation
Uses
  UDM, MxPedidoRapido;

{$R *.DFM}

procedure TfMxSPedTab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Item_Tabela_de_Precos1.Active:=False;
  Action:=Cafree;
end;

procedure TfMxSPedTab.BitBtn1Click(Sender: TObject);
begin
  if Item_Tabela_de_Precos1.IsEmpty then
    raise exception.Create('Selecione uma tabela antes de confirmar!');
  if Tag=1 then
  Begin
    fMxPedidoRapido.edtCodigoTBP.Text  :=Item_Tabela_de_Precos1.FieldByName('TBP_CODIGO').AsString;
    fMxPedidoRapido.edtSugestao.Text :=format('%.2f',[Item_Tabela_de_Precos1.FieldByName('ITP_PRECO').Asfloat]);
  End
  Else if Tag=3 then
  Begin
//    fMxPedidoLBM.Edit4.Text  :=Item_Tabela_de_Precos1.FieldByName('TBP_CODIGO').AsString;
//    fMxPedidoLBM.Edit16.Text :=format('%.2f',[Item_Tabela_de_Precos1.FieldByName('ITP_PRECO').Asfloat]);
  End;
  Close;
end;

procedure TfMxSPedTab.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSPedTab.FormShow(Sender: TObject);
begin
  Item_Tabela_de_Precos1.Active:=True;
  DM.Usuario1.ConfiguraTela(self);
end;

end.
