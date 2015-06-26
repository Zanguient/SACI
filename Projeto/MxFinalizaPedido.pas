unit MxFinalizaPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, CentroCusto, DBCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Pacote_de_venda;

type
  TfMxFinalizaPedido = class(TForm)
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Panel2: TPanel;
    rdbNormal: TRadioButton;
    rdbPendente: TRadioButton;
    rdbRemessa: TRadioButton;
    edtCodigoPDV: TEdit;
    Pacote_de_venda1: TPacote_de_venda;
    rdbPrePago: TRadioButton;
    edtCredito: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure SB_CancelarClick(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure rdbNormalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoPDVKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    iOpcaoEscolhida, iCdCLICNC, iCdCLI: integer;
  end;

var
  fMxFinalizaPedido: TfMxFinalizaPedido;

implementation
uses UDM, funcoes, MxSPediProd, Urpt_bonus, MxLocalizaPacote,
  MxPedidoMotCal, MxServico, MxPedidoMotCal_2;
{$R *.DFM}

procedure TfMxFinalizaPedido.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxFinalizaPedido.SB_ConfirmarClick(Sender: TObject);
begin
  if rdbRemessa.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Begin
      edtCodigoPDV.SetFocus;
      Raise exception.Create('Código do Pacote inválido!');
    end;
    with Pacote_de_venda1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
      ParamByName('CNC_CLIENTE').asInteger := iCdCLICNC;
      ParamByName('CLI_CODIGO').asInteger := iCdCLI;
      ParamByName('PDV_CODIGO').asInteger := StrToInt(edtCodigoPDV.Text);
      Open;
      if IsEmpty then
      Begin
        edtCodigoPDV.SetFocus;
        Raise exception.Create('Pacote inválido!');
      end;
    end;
  end;

  if rdbNormal.Checked then
    iOpcaoEscolhida := 0
  else if rdbPendente.Checked then
    iOpcaoEscolhida := 1
  else if rdbRemessa.Checked then
  Begin
    iOpcaoEscolhida := 2;
    if tag = 0 then //PedidoMotCal
      fmxPedidoMotCal.edtCodigoPacote.Text := edtCodigoPDV.Text
    else if tag = 1 then //Pedido de Serviço
      fmxServico.edtCodigoPacote.Text := edtCodigoPDV.Text
    else if tag = 2 then //Pedido de Compra

    else if tag = 3 then //PedidoMotCal
      fmxPedidoMotCal_2.edtCodigoPacote.Text := edtCodigoPDV.Text
      //
  end
  else if rdbPrePago.Checked  then
     iOpcaoEscolhida := 3;

  Close;
end;

procedure TfMxFinalizaPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then //Enter
  Begin
    Key := #0;
    Begin
      SB_Confirmar.SetFocus;
      SB_ConfirmarClick(sender)
    end;
  end
  else if Key=#27 then //Esc
  Begin
    Key := #0;
    Close;
  end;
end;

procedure TfMxFinalizaPedido.rdbNormalClick(Sender: TObject);
begin
  if rdbRemessa.Checked then
  Begin
    edtCodigoPDV.Enabled := True;
    edtCodigoPDV.Color := clWindow;
    try
      edtCodigoPDV.SetFocus;
    except
    end;
  end
  else
  Begin
    edtCodigoPDV.Enabled := False;
    edtCodigoPDV.Color := AlteraCorComponentes;
    edtCodigoPDV.Clear;
  end;
end;

procedure TfMxFinalizaPedido.FormCreate(Sender: TObject);
begin
  iOpcaoEscolhida := -1;
  iCdCLI    := 0;
  iCdCLICNC := 0;
end;

procedure TfMxFinalizaPedido.edtCodigoPDVKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#32 then
  Begin
    Key:=#0;
    edtCodigoPDV.Clear;
    Application.CreateForm(TfMxLocalizaPacote, fMxLocalizaPacote);
    with fMxLocalizaPacote do
    Begin
      tag:=1;
      iCodigoCLICNC := iCdCLICNC;
      iCodigoCLI    := iCdCLI;
      Showmodal;
    end;
  end;
end;

procedure TfMxFinalizaPedido.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
