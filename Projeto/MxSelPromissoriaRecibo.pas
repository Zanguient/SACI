unit MxSelPromissoriaRecibo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask;

type
  TfMxSelPromissoriaRecibo = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    rdgPedido: TRadioButton;
    rdgOrcamento: TRadioButton;
    rdgPromissoria: TRadioButton;
    rdgRecibo: TRadioButton;
    Bevel1: TBevel;
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CdCNC, CdPDV, CdFPG, vTipoPag, iNotaFiscal, iSituacao: integer;
    sContato: string;
  end;

var
  fMxSelPromissoriaRecibo: TfMxSelPromissoriaRecibo;

implementation

uses UDM, funcoes, UPedidoServicoLBM, MxSelOrcamento, MxSelProm,
  MxSelRecibo, UPedidoServicoLBMEsp, UPedidoServicoGrafico;

{$R *.DFM}

procedure TfMxSelPromissoriaRecibo.bitConfirmarClick(Sender: TObject);
begin
  if CdPDV = 0 then
    Raise exception.Create('Nenhum pedido selecionado!');

  if rdgPedido.Checked then
  Begin
    if DM.Configuracao1.Empresa = empLBM then
    Begin
      Application.CreateForm(Trpt_PedidoServicoLBMEsp, rpt_PedidoServicoLBMEsp);
      with rpt_PedidoServicoLBMEsp do
      begin
        Entidade.Close;
        Entidade.SQL.Text := 'SELECT *, '+
          '  CASE IPV_VINCULO '+
          '    WHEN -1 THEN IPV_SEQUENCIA*100 '+
          '    ELSE (IPV_VINCULO*100)+IPV_SEQUENCIA '+
          '   END ORDEM '+
          ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.PDV_CODIGO='+IntToStr(CdPDV)+
          ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
          ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
          ' ORDER BY I1.CNC_CODIGO, I1.PDV_CODIGO, ORDEM ';
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise exception.Create('Consulta Vazia!');
        report.preview;
      end;
    end
    else if DM.Configuracao1.Empresa = empTeste then
    Begin
      Application.CreateForm(Trpt_PedidoServicoGrafico, rpt_PedidoServicoGrafico);
      with rpt_PedidoServicoGrafico do
      Begin
        tag := 0;

        sContato := self.sContato;

        Entidade.Close;
        Entidade.SQL.Text:='SELECT T1.*,T2.* '+
          ' ,CASE T1.IPV_VINCULO '+
          '    WHEN -1 THEN T1.IPV_SEQUENCIA*100 '+
          '    ELSE (T1.IPV_VINCULO*100)+T1.IPV_SEQUENCIA '+
          '   END ORDEM '+
          ' FROM Item_de_pedido_de_venda T1, Pedido_de_Venda T2 '+
          ' WHERE T2.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND T2.PDV_CODIGO='+IntToStr(CdPDV)+
          ' AND T1.PDV_CODIGO=T2.PDV_CODIGO '+
          ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
          ' ORDER BY T2.PDV_CODIGO,T1.IPV_CODIGO,ORDEM ';
        Entidade.Open;
        if Entidade.isEmpty then
          Raise exception.Create('Consulta vazia!');

        report.preview;
        Close;
      end;
    end;
  end
  else if rdgOrcamento.Checked then
  Begin
    Application.CreateForm(TfMxSelOrcamento, fMxSelOrcamento);
    with fMxSelOrcamento do
    Begin
      tag := 2;
      edtContato.Text := self.sContato;
      CdCNC := self.CdCNC;
      CdPDV := self.CdPDV;
      ShowModal;
    end;
  end
  else if rdgPromissoria.Checked then
  Begin
    Application.CreateForm(TfmxSelProm, fmxSelProm);
    with fmxSelProm do
    Begin
      tag:=7;
      if (vTipoPag <> 412) or
         (iNotaFiscal=0) then
        rdgBoleto.Enabled := False
      else
      Begin
        rdgBoleto.Checked := True;
        with DM.Forma_de_Pagamento1 do
        Begin
          Close;
          ParamByName('FPG_CODIGO').asInteger := self.CdFPG;
          Open;
          if Prazo[1] = '0' then
            fmxSelProm.Entrada := True;
        end;
      end;
      ShowModal;
    end;
  end
  else if rdgRecibo.Checked then
  Begin
    Application.CreateForm(TfMxSelRecibo, fMxSelRecibo);
    with fMxSelRecibo do
    Begin
      Tag := 1;
      CdCNC := self.CdCNC;
      CdPDV := self.CdPDV;
      ShowModal;
      Close;
    end;
  end;
end;

procedure TfMxSelPromissoriaRecibo.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelPromissoriaRecibo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxSelPromissoriaRecibo.FormCreate(Sender: TObject);
begin
  CdCNC    := 0;
  CdPDV    := 0;
  CdFPG    := 0;
  vTipoPag := 0;
  iNotaFiscal := 0;
  sContato := '';
  iSituacao := -1;
end;

procedure TfMxSelPromissoriaRecibo.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
