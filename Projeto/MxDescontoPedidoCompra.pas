unit MxDescontoPedidoCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBTables, SQuery, Item_Pedido_Venda,
  Tabela_de_precos, Produto, Item_Pedido_Compra;

type
  TfMxDescontoPedidoCompra = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edtPercentual: TEdit;
    Label2: TLabel;
    Produto1: TProduto;
    Label7: TLabel;
    cmbTipo: TComboBox;
    Item_Pedido_Compra1: TItem_Pedido_Compra;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Cancelar:Boolean;
    Entidade:TItem_Pedido_Compra;
    { Public declarations }
  end;

var
  fMxDescontoPedidoCompra: TfMxDescontoPedidoCompra;

implementation

uses UDM, funcoes;

{$R *.DFM}

procedure TfMxDescontoPedidoCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxDescontoPedidoCompra.BitBtn1Click(Sender: TObject);
var
  Desc,vValorSemDesconto, vValorComDesc : Double;
begin
  try
    Desc := Arredonda(StrToFloat(edtPercentual.Text), 4);
    edtPercentual.Text := format('%.2f',[Desc]);
  except
    ShowMessage('Desconto inválido!');
    edtPercentual.SetFocus;
    Exit;
  end;

  if cmbTipo.ItemIndex = 1 then
    Desc := (-1)*Desc;

  if Desc = 0 then
  Begin
    ShowMessage('Desconto/Acréscimo inválido!');
    edtPercentual.SetFocus;
    Exit;
  end;

  with Entidade do
  Begin
    First;
    while not EOF do
    Begin
      vValorSemDesconto := CalculaDesconto(Preco, Descontos);
      vValorComDesc := vValorSemDesconto - (vValorSemDesconto*Desc/100);

      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_COMPRA SET '+
        ' IPC_PRECO='+VirgPonto(vValorComDesc)+
        ',IPC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
        ' AND IPC_CODIGO='+IntToStr(CodigoIPC));
      Next;
    end;
  end;
  Close;
end;

procedure TfMxDescontoPedidoCompra.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxDescontoPedidoCompra.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Compra1;
end;

procedure TfMxDescontoPedidoCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else if (edtPercentual.Focused) and (Key = '.') then
    Key := ',';
end;

procedure TfMxDescontoPedidoCompra.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbTipo.ItemIndex := 1;
  edtPercentual.SetFocus;
end;

end.
