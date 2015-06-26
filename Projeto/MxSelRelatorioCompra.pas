unit MxSelRelatorioCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, SQuery, DateUtils,
  Forma_de_Pagamento, Pedido_de_Venda, Titulo_receber;

type
  TfmxSelRelatorioCompra = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    rdgRelatorio: TRadioButton;
    rdgReciboTotal: TRadioButton;
    bitCancelar: TBitBtn;
    Bevel1: TBevel;
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CdCNC, CdPCP: integer;
    vLJ4: Boolean;
  end;

var
  fmxSelRelatorioCompra: TfmxSelRelatorioCompra;

implementation

uses UDM, funcoes, UPedidoCompra, UTabelaCompra;

{$R *.DFM}

procedure TfmxSelRelatorioCompra.bitConfirmarClick(Sender: TObject);
begin
  if rdgRelatorio.Checked then
  Begin
    Application.CreateForm(Trpt_PedidoCompra, rpt_PedidoCompra);
    with rpt_PedidoCompra do
    Begin
      If MessageDlg('Deseja omitir Observação dos Itens?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        zrbDetalhe.Height := 1;
      if (DM.Configuracao1.Empresa = empLBM) and
         (vLJ4) then
      Begin
        zrlEmpresa.Caption := 'PATRICIA GOMES BESSA BEZERRA ME';
        ZRLabel1.Enabled := False;
      end;
      Item_Pedido_Compra1.Close;
      Item_Pedido_Compra1.ParamByName('PCP_CODIGO').AsInteger := CdPCP;
      Item_Pedido_Compra1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      Item_Pedido_Compra1.Open;
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.Preview;
    end;
  end
  else //Tabela de Preço
  Begin
    Application.CreateForm(Trpt_TabelaCompra, rpt_TabelaCompra);
    with rpt_TabelaCompra do
    Begin
      if (DM.Configuracao1.Empresa = empLBM) and
         (vLJ4) then
      Begin
        zrlEmpresa.Caption := 'PATRICIA GOMES BESSA BEZERRA ME';
        ZRLabel1.Enabled := False;
      end;
      Item_Pedido_Compra1.Close;
      Item_Pedido_Compra1.ParamByName('PCP_CODIGO').AsInteger := CdPCP;
      Item_Pedido_Compra1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      Item_Pedido_Compra1.Open;
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.Preview;
    end;
  end;
  Close;
end;

procedure TfmxSelRelatorioCompra.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelRelatorioCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfmxSelRelatorioCompra.FormCreate(Sender: TObject);
begin
  CdCNC := 0;
  CdPCP := 0;
  vLJ4  := False;
end;

procedure TfmxSelRelatorioCompra.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
