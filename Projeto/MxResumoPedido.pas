unit MxResumoPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfMxResumoPedido = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label20: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    edtCodigoPDV: TEdit;
    edtDataHota: TEdit;
    Label3: TLabel;
    Label7: TLabel;
    Label21: TLabel;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    edtTipoPagamento: TEdit;
    Label1: TLabel;
    edtFormaPagamento: TEdit;
    Label2: TLabel;
    edtAgenteFinanceiro: TEdit;
    Label4: TLabel;
    Label14: TLabel;
    libItensPedido: TListBox;
    SB_Fechar: TBitBtn;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    memResumo: TMemo;
    SB_ImprimirPedido: TSpeedButton;
    SB_ImprimirResumo: TSpeedButton;
    edtCodigoCNC: TEdit;
    ckbParcelasProdutos: TCheckBox;
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirResumoClick(Sender: TObject);
    procedure SB_ImprimirPedidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxResumoPedido: TfMxResumoPedido;

implementation

uses uPedidoVendaCodigoPreco, UDM, UPedidoVendaItemPDVRed2,
  uPedidoVendaDARUMA, MxPedidoRapido, Funcoes, MxPedidoMotCal,
  UPedidoVendaParcelasPDV, MxPedidoMotCal_2;

{$R *.DFM}

procedure TfMxResumoPedido.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxResumoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfMxResumoPedido.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxResumoPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = CHR(27) then
    Close;
end;

procedure TfMxResumoPedido.SB_ImprimirResumoClick(Sender: TObject);
begin
  Application.CreateForm(Trpt_PedidoVendaCodigoPreco, rpt_PedidoVendaCodigoPreco);
  rpt_PedidoVendaCodigoPreco.SZRLabel2.Caption:=edtCodigoPDV.Text;
  rpt_PedidoVendaCodigoPreco.SZRLabel3.Caption:=edtDataHota.Text;
  if tag = 0 then
  Begin
    rpt_PedidoVendaCodigoPreco.SZRLabel4.Caption:=format('%.2f',[fMxPedidoRapido.Pedido_de_Venda1.Total+fMxPedidoRapido.Pedido_de_Venda1.Acrescimo]);
    if StrToInt(fMxPedidoRapido.edtDiasOrcamento.Text) > 0 then
      rpt_PedidoVendaCodigoPreco.SZRLabel5.Enabled:=True
    else
      rpt_PedidoVendaCodigoPreco.SZRLabel5.Enabled:=False;
  end
  else if tag = 1 then
  Begin
  end
  else if tag = 2 then
  Begin
    rpt_PedidoVendaCodigoPreco.SZRLabel4.Caption:=format('%.2f',[fMxPedidoMotCal.Pedido_de_Venda1.Total+fMxPedidoMotCal.Pedido_de_Venda1.Acrescimo]);
    rpt_PedidoVendaCodigoPreco.SZRLabel5.Enabled:=False;
  end
  else if tag = 3 then
  Begin
    rpt_PedidoVendaCodigoPreco.SZRLabel4.Caption:=format('%.2f',[fMxPedidoMotCal_2.Pedido_de_Venda1.Total+fMxPedidoMotCal_2.Pedido_de_Venda1.Acrescimo]);
    rpt_PedidoVendaCodigoPreco.SZRLabel5.Enabled:=False;
  end;
  rpt_PedidoVendaCodigoPreco.report.Preview;
  rpt_PedidoVendaCodigoPreco.Close;
end;

procedure TfMxResumoPedido.SB_ImprimirPedidoClick(Sender: TObject);
var
  Flag: integer;
begin
  if DM.Configuracao1.Daruma <> 1 then
  Begin
    if ckbParcelasProdutos.Checked then
    begin
      Application.CreateForm(Trpt_PedidoVendaParcelasPDV, rpt_PedidoVendaParcelasPDV);
      with rpt_PedidoVendaParcelasPDV.Pedido_de_Venda1 do
      Begin
        close;
        parambyname('PDV_CODIGO').AsInteger:=StrtoInt(edtCodigoPDV.text);
        parambyname('CNC_CODIGO').AsInteger:=StrtoInt(edtCodigoCNC.text);
        open;
        rpt_PedidoVendaParcelasPDV.report.Height := rpt_PedidoVendaParcelasPDV.report.Height + 2*RecordCount;
      end;

      with rpt_PedidoVendaParcelasPDV do
      begin
        Flag := 0;
        zrlParcela1.Caption := '';
        zrlParcela2.Caption := '';
        zrlParcela3.Caption := '';
        zrlParcela4.Caption := '';
        zrlParcela5.Caption := '';
        zrlParcela6.Caption := '';
        zrlParcela7.Caption := '';
        zrlParcela8.Caption := '';
        zrlParcela9.Caption := '';
        zrlParcela10.Caption := '';
        zrlParcela11.Caption := '';
        zrlParcela12.Caption := '';
        zrlParcela13.Caption := '';

        ZRBand5.Height := memResumo.Lines.Count+4;

        if memResumo.Lines.Strings[0] = '-------------------------' then
        begin
          zrlParcela1.Left := 0;
          zrlParcela1.Caption := '------------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela1.Caption := '01 '+memResumo.Lines.Strings[0]
          else
            zrlParcela1.Caption := memResumo.Lines.Strings[0];

        if memResumo.Lines.Strings[1] = '-------------------------' then
        begin
          zrlParcela2.Left := 0;
          zrlParcela2.Caption := '------------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela2.Caption := '02 '+memResumo.Lines.Strings[1]
          else
            zrlParcela2.Caption := memResumo.Lines.Strings[1];

        if memResumo.Lines.Strings[2] = '-------------------------' then
        begin
          zrlParcela3.Left := 0;
          zrlParcela3.Caption := '------------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela3.Caption := '03 '+memResumo.Lines.Strings[2]
          else
            zrlParcela3.Caption := memResumo.Lines.Strings[2];

        if memResumo.Lines.Strings[3] = '-------------------------' then
        begin
          zrlParcela4.Left := 0;
          zrlParcela4.Caption := '------------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela4.Caption := '04 '+ memResumo.Lines.Strings[3]
          else
            zrlParcela4.Caption := memResumo.Lines.Strings[3];

        if memResumo.Lines.Strings[4] = '-------------------------' then
        begin
          zrlParcela5.Left := 0;
          zrlParcela5.Caption := '------------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela5.Caption := '05 '+memResumo.Lines.Strings[4]
          else
            zrlParcela5.Caption := memResumo.Lines.Strings[4];

        if memResumo.Lines.Strings[5] = '-------------------------' then
        begin
          zrlParcela6.Left := 0;
          zrlParcela6.Caption := '------------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela6.Caption := '06 '+memResumo.Lines.Strings[5]
          else
            zrlParcela6.Caption := memResumo.Lines.Strings[5];

        if memResumo.Lines.Strings[6] = '-------------------------' then
        begin
          zrlParcela7.Left := 0;
          zrlParcela7.Caption := '------------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela7.Caption := '07 '+memResumo.Lines.Strings[6]
          else
            zrlParcela7.Caption := memResumo.Lines.Strings[6];

        if memResumo.Lines.Strings[7] = '-------------------------' then
        begin
          zrlParcela8.Left := 0;
          zrlParcela8.Caption := '------------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela8.Caption := '08 '+memResumo.Lines.Strings[7]
          else
            zrlParcela8.Caption := memResumo.Lines.Strings[7];

        if memResumo.Lines.Strings[8] = '-------------------------' then
        begin
          zrlParcela9.Left := 0;
          zrlParcela9.Caption := '------------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela9.Caption := '09 '+memResumo.Lines.Strings[8]
          else
            zrlParcela9.Caption := memResumo.Lines.Strings[8];

        if memResumo.Lines.Strings[9] = '-------------------------' then
        begin
          zrlParcela10.Left := 0;
          zrlParcela10.Caption := '-----------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela10.Caption := '10 '+memResumo.Lines.Strings[9]
          else
            zrlParcela10.Caption := memResumo.Lines.Strings[9];

        if memResumo.Lines.Strings[10] = '-------------------------' then
        begin
          zrlParcela11.Left := 0;
          zrlParcela11.Caption := '-----------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela11.Caption := '11 '+memResumo.Lines.Strings[10]
          else
            zrlParcela11.Caption := memResumo.Lines.Strings[10];

        if memResumo.Lines.Strings[11] = '-------------------------' then
        begin
          zrlParcela12.Left := 0;
          zrlParcela12.Caption := '-----------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela12.Caption := '12 '+memResumo.Lines.Strings[11]
          else
            zrlParcela12.Caption := memResumo.Lines.Strings[11];

        if memResumo.Lines.Strings[12] = '-------------------------' then
        begin
          zrlParcela13.Left := 0;
          zrlParcela13.Caption := '-----------------------------------------------------------------------------';
          Flag := 1;
        end
        else
          if Flag = 0 then
            zrlParcela13.Caption := '13 '+memResumo.Lines.Strings[12]
          else
            zrlParcela13.Caption := memResumo.Lines.Strings[12];
            
        ZRLabel4.Top := memResumo.Lines.Count + 2;
        ZRLabel7.Top := memResumo.Lines.Count + 3;
     end;

      rpt_PedidoVendaParcelasPDV.report.preview;
      rpt_PedidoVendaParcelasPDV.Close;
    end
    else
    begin
      Application.CreateForm(Trpt_PedidoVendaItemPDVRed2, rpt_PedidoVendaItemPDVRed2);
      with rpt_PedidoVendaItemPDVRed2.Pedido_de_Venda1 do
      Begin
        close;
        parambyname('PDV_CODIGO').AsInteger:=StrtoInt(edtCodigoPDV.text);
        parambyname('CNC_CODIGO').AsInteger:=StrtoInt(edtCodigoCNC.text);
        open;
        rpt_PedidoVendaItemPDVRed2.report.Height := rpt_PedidoVendaItemPDVRed2.report.Height + 2*RecordCount;
      end;
      rpt_PedidoVendaItemPDVRed2.report.preview;
      rpt_PedidoVendaItemPDVRed2.Close;
    end;
  end
  else
  Begin
    Application.CreateForm(Trpt_PedidoVendaDARUMA, rpt_PedidoVendaDARUMA);
    with rpt_PedidoVendaDARUMA do
    Begin
      Tag := 0;
      If DM.Usuario1.Permissoes.IndexOf(IntToStr(3730)) > 0 then //Consulta Estoque
        if MessageDlg('Deseja ocultar o estoque?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          rpt_PedidoVendaDARUMA.vExibirEstoque := True; //No Create ele seta para False
      if StrToInt(self.edtCodigoCLI.Text) = DM.Configuracao1.CodigoCliAVista then
      Begin
        zrlLinhaDupla2.Top := 9;
        zrbGrupoPDV.Height := 10;
      end;
      Pedido_de_Venda1.close;
      Pedido_de_Venda1.parambyname('PDV_CODIGO').AsInteger:=StrtoInt(edtCodigoPDV.text);
      Pedido_de_Venda1.parambyname('CNC_CODIGO').AsInteger:=StrtoInt(edtCodigoCNC.text);
      Pedido_de_Venda1.open;
      report.Height := report.Height + 2*Pedido_de_Venda1.RecordCount;
    end;
    rpt_PedidoVendaDARUMA.report.preview;
    rpt_PedidoVendaDARUMA.Close;
  end;
  //Alterar situação de Impresso para impedir excluir itens sem permissão
  ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
    ' PDV_IMPRESSO=1 '+
    ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE CNC_CODIGO='+edtCodigoCNC.Text+
    ' AND PDV_CODIGO='+edtCodigoPDV.Text);
end;

procedure TfMxResumoPedido.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa = empLBM then
    Label11.Caption:='OK';
end;

end.
