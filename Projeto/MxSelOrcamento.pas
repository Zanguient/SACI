unit MxSelOrcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, SQuery,
  Forma_de_Pagamento, Pedido_de_Venda, Titulo_receber;

type
  TfmxSelOrcamento = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    rdgOrcamentoSimples: TRadioButton;
    rdgOrcamentoExtenso: TRadioButton;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    Pedido_de_Venda1: TPedido_de_Venda;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1USU_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1PDV_LISTADO: TIntegerField;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Pedido_de_Venda1PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_FISCAL: TIntegerField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1PDV_ENTRADA: TFloatField;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1PDV_EM_USO: TIntegerField;
    Pedido_de_Venda1PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda1PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1Cliente: TStringField;
    Pedido_de_Venda1CNPJ_CPF: TStringField;
    Pedido_de_Venda1CGF_RG: TStringField;
    Pedido_de_Venda1SPC: TStringField;
    Pedido_de_Venda1OK: TStringField;
    Pedido_de_Venda1CupomFiscal: TStringField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Titulo_receber1: TTitulo_receber;
    Panel1: TPanel;
    Label1: TLabel;
    edtContato: TEdit;
    ckbGrafico: TCheckBox;
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ckbGraficoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CdCNC, CdMCT, CdPDV: integer;
  end;

var
  fmxSelOrcamento: TfmxSelOrcamento;

implementation

uses UDM, funcoes, Urpt_CotacaoCompleta, UOrcamento,
  UOrcamentoGrafico, UCotacaoGrafico;

{$R *.DFM}

procedure TfmxSelOrcamento.bitConfirmarClick(Sender: TObject);
begin
  if tag = 0 then
  Begin
    if ckbGrafico.Checked then
    Begin
      Application.CreateForm(Trpt_CotacaoGrafico, rpt_CotacaoGrafico);
      with rpt_CotacaoGrafico do
      Begin
        if rdgOrcamentoSimples.Checked then
        Begin
//          zrbDetalhe.Height := 50; //Gráfico
//          zrlExtensoUnitario.Visible := False;
//          zrlExtensoTotalItem.Visible := False;
        end;
        tag := 0;
        Entidade.Close;
        Entidade.ParamByName('CNC_CODIGO').asInteger := fmxSelOrcamento.CdCNC;
        Entidade.ParamByName('MCT_CODIGO').asInteger := fmxSelOrcamento.CdMCT;
        Entidade.Open;
        report.Preview;
        Close;
      end;
    end
    else
    Begin
      Application.CreateForm(Trpt_CotacaoCompleta, rpt_CotacaoCompleta);
      with rpt_CotacaoCompleta do
      Begin
        if rdgOrcamentoSimples.Checked then
          zrbdetalhe.Height := 3;
        tag := 0;
        Entidade.Close;
        Entidade.ParamByName('CNC_CODIGO').asInteger := fmxSelOrcamento.CdCNC;
        Entidade.ParamByName('MCT_CODIGO').asInteger := fmxSelOrcamento.CdMCT;
        Entidade.Open;
        report.Preview;
        Close;
      end;
    end;
  end
  else if tag = 1 then
  Begin
    if ckbGrafico.Checked then //Modo Gráfico
    Begin
      Application.CreateForm(Trpt_OrcamentoGrafico, rpt_OrcamentoGrafico);
      with rpt_OrcamentoGrafico do
      Begin
        tag := 0;
        if (Trim(edtContato.Text) = '') and (edtContato.Enabled) then
          Raise Exception.Create('Defina um Contato!');

        if rdgOrcamentoSimples.Checked then
        Begin
//          zrbDetalhe.Height := 50; //Gráfico
//          zrlExtensoUnitario.Visible := False;
//          zrlExtensoTotalItem.Visible := False;
        end;
        sContato := edtContato.Text;
        Titulo_receber1.Close;
        Titulo_receber1.SQL.Text:='SELECT * FROM TRCTEMP '+
          ' WHERE CNC_CODIGO=:CNC_CODIGO AND PDV_CODIGO=:PDV_CODIGO '+
          'ORDER BY TRC_VENCIMENTO';
        Item_Pedido_Venda1.Close;
        Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
          ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
          ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND T2.CNC_CODIGO='+
          IntToStr(CdCNC)+
          ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) AND T2.PDV_CODIGO='+
          IntToStr(CdPDV)+
          ' ORDER BY T2.PDV_CODIGO,T1.IPV_CODIGO ASC';
        Item_Pedido_Venda1.Open;
        report.preview;
        Close;
      end;
    end
    else //Modo Texto
    Begin
      Application.CreateForm(Trpt_Orcamento, rpt_Orcamento);
      with rpt_Orcamento do
      Begin
        if (Trim(edtContato.Text) = '') and (edtContato.Enabled) then
          Raise Exception.Create('Defina um Contato!');
        if rdgOrcamentoSimples.Checked then
          zrb_detalhe.Height := 2;
        tag := 0;
        sContato := edtContato.Text;
        Titulo_receber1.Close;
        Titulo_receber1.SQL.Text:='SELECT * FROM TRCTEMP '+
          ' WHERE CNC_CODIGO=:CNC_CODIGO AND PDV_CODIGO=:PDV_CODIGO '+
          'ORDER BY TRC_VENCIMENTO';
        Item_Pedido_Venda1.Close;
        Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
          ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
          ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND T2.CNC_CODIGO='+
          IntToStr(CdCNC)+
          ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) AND T2.PDV_CODIGO='+
          IntToStr(CdPDV)+
          ' ORDER BY T2.PDV_CODIGO,T1.IPV_CODIGO ASC';
        Item_Pedido_Venda1.Open;
        report.preview;
        rpt_Orcamento.Close;
      end;
    end;
    Close;
  end
  else if tag = 2 then //ServicoLBM
  Begin
    Application.CreateForm(Trpt_Orcamento, rpt_Orcamento);
    with rpt_Orcamento do
    Begin
      if rdgOrcamentoSimples.Checked then
        zrb_detalhe.Height := 2;
      tag := 0;
      sContato := edtContato.Text;
      Titulo_receber1.Close;
      Titulo_receber1.SQL.Text:='SELECT * FROM TRCTEMP '+
        ' WHERE CNC_CODIGO=:CNC_CODIGO AND PDV_CODIGO=:PDV_CODIGO '+
        'ORDER BY TRC_VENCIMENTO';
      Item_Pedido_Venda1.Close;
      Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
        ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
        ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND T2.CNC_CODIGO='+
        IntToStr(CdCNC)+
        ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) AND T2.PDV_CODIGO='+
        IntToStr(CdPDV)+
        ' ORDER BY T2.PDV_CODIGO,T1.IPV_CODIGO ASC';
      Item_Pedido_Venda1.Open;
      report.preview;
      rpt_Orcamento.Close;
    end;
    Close;
  end;
end;

procedure TfmxSelOrcamento.bitCancelarClick(Sender: TObject);
begin
  //if tag = 1 then
    //fmxPedidoLBM.sContato := '';
  Close;
end;

procedure TfmxSelOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfmxSelOrcamento.FormCreate(Sender: TObject);
begin
  CdCNC := 0;
  CdMCT := 0;
  CdPDV := 0;
end;

procedure TfmxSelOrcamento.ckbGraficoClick(Sender: TObject);
begin
  if ckbGrafico.Checked then
  begin
    rdgOrcamentoSimples.Checked := true;
    rdgOrcamentoExtenso.Enabled := false;
  end
  else
    rdgOrcamentoExtenso.Enabled := true;
end;

procedure TfmxSelOrcamento.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
