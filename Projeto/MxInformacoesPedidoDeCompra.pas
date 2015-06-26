unit MxInformacoesPedidoDeCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, ComCtrls, Buttons, Mask, Db, Transportadora,
  DBTables, SQuery, Contato, Variants;

type
  TfMxInformacoesPedidoDeCompra = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    dblContato: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    Label9: TLabel;
    MaskEdit2: TMaskEdit;
    Label10: TLabel;
    MaskEdit3: TMaskEdit;
    Label11: TLabel;
    Edit4: TEdit;
    Contato1: TContato;
    DSContato1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure dblContatoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxInformacoesPedidoDeCompra: TfMxInformacoesPedidoDeCompra;

implementation
uses UDM, Funcoes, MxPedCompra;
{$R *.DFM}

procedure TfMxInformacoesPedidoDeCompra.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxInformacoesPedidoDeCompra.dblContatoClick(Sender: TObject);
begin
  MaskEdit1.Text:=Contato1.Fone;
  MaskEdit2.Text:=Contato1.Fax;
  MaskEdit3.Text:=Contato1.Celular;
  Edit4.Text    :=Contato1.EMail;
end;

procedure TfMxInformacoesPedidoDeCompra.BitBtn1Click(Sender: TObject);
var
  CdCNC, CdPCP : integer;
begin
  CdCNC := fMxPedComp.Entidade.CodigoCNC;
  CdPCP := fMxPedComp.Entidade.CodigoPCP;
  if (dblContato.Text <> '') then
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
      ' CNT_CODIGO='+IntTostr(dblContato.KeyValue)+
      ',PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PCP_CODIGO='+IntToStr(CdPCP))
  else
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
      ' CNT_CODIGO=0 '+
      ',PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PCP_CODIGO='+IntToStr(CdPCP));

  fMxPedComp.Entidade.Close;
  fMxPedComp.Entidade.Open;
  fMxPedComp.Entidade.LocalizarCod(CdPCP, CdCNC);
  Close;
end;

procedure TfMxInformacoesPedidoDeCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Contato1.Close;
  Action := caFree;
end;

procedure TfMxInformacoesPedidoDeCompra.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
