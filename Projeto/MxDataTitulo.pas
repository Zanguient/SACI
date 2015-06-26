unit MxDataTitulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes;

type
  TfMxDataTitulo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
//    DataOk: Boolean;
  end;

var
  fMxDataTitulo: TfMxDataTitulo;
  CNC:string;

implementation

uses UFluxoCaixaDia, UFluxoCaixa, UBaixaPag, UReceber, UBaixaRec,
  UPagar, UDM, UPedidoVenda, URelTransReceb, URelacaoDespesas, MxCobranca,
  UHistorCompras, UPrinc2, UTipoVendas, UPendencia_reposicao,
  Urpt_Inadiplencia, UTitAtrazo, MxCobCobrador, UPedidoVendaCancelado,
  URenegociacao, UCli_Inadimp, UPedidoVendaDevolvido, UTitulosExcluidos,
  MXSelCentroCusto, UPreRecRec;

{$R *.DFM}


procedure TfMxDataTitulo.BitBtn1Click(Sender: TObject);
begin
  if not VerificaDataBranco(MaskEdit1.Text) then
    MaskEdit1.Text := '30/12/1899';
  if not VerificaDataBranco(MaskEdit2.Text) then
    MaskEdit2.text := DateToStr(DM.Configuracao1.Data);
  if StrToDateTime(MaskEdit2.Text) < StrToDateTime(MaskEdit1.Text) then
    raise exception.Create('Data final não pode ser menor que data inicial!');

  Dt_ini := MaskEdit1.Text;
  Dt_fim := MaskEdit2.Text;
  If Tag=1 then
  begin
   Application.CreateForm(Trpt_BaixaPag,rpt_BaixaPag);
   rpt_BaixaPag.SZRLabel1.Caption := Dt_ini;
   rpt_BaixaPag.SZRLabel3.Caption := Dt_fim;
   rpt_BaixaPag.Titulo_a_pagar1.ParamByName('DATA_INI').AsDateTime := STrToDateTime(Dt_ini);
   rpt_BaixaPag.Titulo_a_pagar1.ParamByName('DATA_FIM').AsDateTime := STrToDateTime(Dt_fim)+1;
   rpt_BaixaPag.Titulo_a_pagar1.Active := true;
   rpt_BaixaPag.report.Preview;
   rpt_BaixaPag.Close;
  end
  else If Tag=2 then
  begin
   Application.CreateForm(Trpt_receber,rpt_receber);
   rpt_Receber.SZRLabel1.Caption := Dt_ini;
   rpt_Receber.SZRLabel3.Caption := Dt_fim;
   rpt_receber.Titulo_receber1.ParamByName('DATA_INI').AsDateTime := STrToDateTime(Dt_ini);
   rpt_receber.Titulo_receber1.ParamByName('DATA_FIM').AsDateTime := STrToDateTime(Dt_fim)+1;
   rpt_receber.Titulo_receber1.Active:=True;
   rpt_receber.report.Preview;
   rpt_receber.Close;
  end
  else If Tag=3 then
  begin
   Application.CreateForm(Trpt_BaixaRec,rpt_BaixaRec);
   rpt_BaixaRec.SZRLabel1.Caption := Dt_ini;
   rpt_BaixaRec.SZRLabel3.Caption := Dt_fim;
   rpt_BaixaRec.Parametro1.Open;
   rpt_BaixaRec.Parametro2.Open;
   rpt_BaixaRec.Titulo_receber1.ParamByName('DATA_INI').AsDate := STrToDate(Dt_ini);
   rpt_BaixaRec.Titulo_receber1.ParamByName('DATA_FIM').AsDate := STrToDate(Dt_fim)+1;
   rpt_BaixaRec.Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
   rpt_BaixaRec.Titulo_receber1.Active:=true;
   rpt_BaixaRec.report.Preview;
   rpt_BaixaRec.Close;
  end
  else if Tag=4 then
  begin
   Application.CreateForm(TfMXSelCentroCusto,fMXSelCentroCusto);
   fMXSelCentroCusto.Tag:=1;
   fMXSelCentroCusto.ShowModal;
  end
  else if Tag=5 then
  begin
   Application.CreateForm(Trpt_FluxoCaixa,rpt_FluxoCaixa);
   rpt_FluxoCaixa.SZRLabel1.Caption := Dt_ini;
   rpt_FluxoCaixa.SZRLabel3.Caption := Dt_fim;
   rpt_FluxoCaixa.Movimento_caixa1.ParamByName('DATA_INI').AsDateTime := STrToDate(Dt_ini);
   rpt_FluxoCaixa.Movimento_caixa1.ParamByName('DATA_FIM').AsDateTime := STrToDate(Dt_fim)+1;
   rpt_FluxoCaixa.Movimento_caixa1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
   rpt_FluxoCaixa.Movimento_caixa1.Active := true;
   rpt_FluxoCaixa.ZRLabel12.Caption:=Dt_ini+' a '+Dt_Fim;
   rpt_FluxoCaixa.report.Preview;
   rpt_FluxoCaixa.Close;
  end
  else if Tag=6 then
  begin
    Application.CreateForm(Trpt_PedidoVenda,rpt_Pedidovenda);
    rpt_Pedidovenda.SZRLabel1.Caption := Dt_ini;
    rpt_Pedidovenda.SZRLabel3.Caption := Dt_fim;
    with rpt_Pedidovenda.Pedido_de_Venda1 do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM PEDIDO_DE_VENDA '+
              'WHERE PDV_SITUACAO=4 AND PDV_DATA_HORA>=:DATAINI AND PDV_DATA_HORA<:DATAFIM '+
              'AND CNC_CODIGO=:CNC_CODIGO '+
              'ORDER BY CNC_CODIGO,PDV_DATA_HORA ASC');
      ParamByName('DATAINI').AsDateTime:=StrToDate(MaskEdit1.Text);
      ParamByName('DATAFIM').AsDateTime:=StrToDate(MaskEdit2.Text)+1;
      ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      Open;
    end;
    rpt_Pedidovenda.report.preview;
    rpt_Pedidovenda.Close;
  End
  else if Tag=7 then
  Begin
   Application.CreateForm(Trpt_PreRecRec, rpt_PreRecRec);
 //  Application.CreateForm(Trpt_TransReceb, rpt_TransReceb);
   rpt_PreRecRec.SZRLabel1.Caption := Dt_ini;
   rpt_PreRecRec.SZRLabel3.Caption := Dt_fim;
   rpt_PreRecRec.Item_Pre_Recebimento1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
   rpt_PreRecRec.Item_Pre_Recebimento1.ParamByName('DATAINI').AsDate :=StrToDate(MaskEdit1.Text);
   rpt_PreRecRec.Item_Pre_Recebimento1.ParamByName('DATAFIM').AsDate :=StrToDate(MaskEdit2.Text)+1;
 //  rpt_TransReceb.item_de_recebimento1.ParamByName('DATAINI').AsDate :=StrToDate(MaskEdit1.Text);
 //  rpt_TransReceb.item_de_recebimento1.ParamByName('DATAFIM').AsDate :=StrToDate(MaskEdit2.Text)+1;
   rpt_PreRecRec.Item_de_Recebimento1.Open;
   rpt_PreRecRec.Item_Pre_Recebimento1.Open;
   rpt_PreRecRec.CentroCusto1.Open;
   rpt_PreRecRec.Produto1.Open;
   rpt_PreRecRec.report.preview;
   rpt_PreRecRec.Close;
  End
  else if Tag=11 then
  Begin
    Application.CreateForm(Trpt_PedidoVenda,rpt_Pedidovenda);
    rpt_Pedidovenda.Pedido_de_Venda1.Close;
    rpt_Pedidovenda.Pedido_de_Venda1.SQL.Clear;
    rpt_Pedidovenda.Pedido_de_Venda1.SQL.Add('SELECT * FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
       'WHERE (T1.CLI_CODIGO=T2.CLI_CODIGO) AND (T1.CNC_CLIENTE=T2.CNC_CODIGO) '+
       'AND (T1.PDV_DIAS_RESERV IS NULL OR T1.PDV_DIAS_RESERV = 0) AND '+
       'T1.PDV_SITUACAO<4 AND T1.PDV_DATA_HORA>=:DATAINI AND T1.PDV_DATA_HORA<=:DATAFIM');
    rpt_Pedidovenda.Pedido_de_Venda1.ParamByName('DATAINI').AsDateTime:=StrToDate(MaskEdit1.Text);
    rpt_Pedidovenda.Pedido_de_Venda1.ParamByName('DATAFIM').AsDateTime:=StrToDate(MaskEdit2.Text);
    rpt_Pedidovenda.Pedido_de_Venda1.Open;
    rpt_PedidoVenda.report.preview;
    rpt_PedidoVenda.Close;
  End
  else if Tag=13 then
  Begin
    Application.CreateForm(Trpt_TipoVendas, rpt_TipoVendas);
    rpt_TipoVendas.Item_Pedido_Venda1.ParamByName('DATA_INI').AsDate := STrToDate(MaskEdit1.Text);
    rpt_TipoVendas.Item_Pedido_Venda1.ParamByName('DATA_FIM').AsDate := STrToDate(MaskEdit2.Text)+1;
    rpt_TipoVendas.Item_Pedido_Venda1.parambyname('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    rpt_TipoVendas.Item_Pedido_Venda1.Open;
    rpt_TipoVendas.SZRLabel5.Caption := MaskEdit1.Text;
    rpt_TipoVendas.SZRLabel7.Caption := MaskEdit2.Text;
    rpt_TipoVendas.report.preview;
    rpt_TipoVendas.Close;
  End
  else if Tag=14 then
  Begin
    Application.CreateForm(Trpt_pendencia_reposicao, rpt_pendencia_reposicao);
    rpt_pendencia_reposicao.Entidade.ParamByName('DATA_INI').AsDate := STrToDate(MaskEdit1.Text);
    rpt_pendencia_reposicao.Entidade.ParamByName('DATA_FIM').AsDate := STrToDate(MaskEdit2.Text)+1;
    rpt_pendencia_reposicao.Entidade.Active:=True;
    rpt_pendencia_reposicao.SZRLabel5.Caption := MaskEdit1.Text;
    rpt_pendencia_reposicao.SZRLabel7.Caption := MaskEdit2.Text;
    rpt_pendencia_reposicao.report.Preview;
    rpt_pendencia_reposicao.Close;
  End
  else if Tag=16 then
  Begin
   Application.CreateForm(Trpt_TitAtrazo, rpt_TitAtrazo);
   rpt_TitAtrazo.Titulo_receber1.Close;
   rpt_TitAtrazo.Titulo_receber1.ParamByName('DATAINI').AsDateTime := StrToDate(MaskEdit1.text);
   rpt_TitAtrazo.Titulo_receber1.ParamByName('DATAFIM').AsDateTime := STrToDate(MaskEdit2.Text)+1;
   rpt_TitAtrazo.Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
   rpt_TitAtrazo.Titulo_receber1.Open;
   rpt_TitAtrazo.report.Preview;
   rpt_TitAtrazo.Close;
  End
  else if Tag=18 then
  Begin
   Application.CreateForm(Trpt_PedidoVendaCancelado, rpt_PedidoVendaCancelado);
   rpt_PedidoVendaCancelado.Item_Pedido_Venda1.Close;
   rpt_PedidoVendaCancelado.Pedido_de_Venda1.Close;
   rpt_PedidoVendaCancelado.Pedido_de_Venda1.ParamByName('DATAINI').AsDateTime := StrToDate(MaskEdit1.text);
   rpt_PedidoVendaCancelado.Pedido_de_Venda1.ParamByName('DATAFIM').AsDateTime := STrToDate(MaskEdit2.Text)+1;
   rpt_PedidoVendaCancelado.Pedido_de_Venda1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
   rpt_PedidoVendaCancelado.Pedido_de_Venda1.Open;
   rpt_PedidoVendaCancelado.Funcionario1.Open;
   rpt_PedidoVendaCancelado.Item_Pedido_Venda1.Open;
   rpt_PedidoVendaCancelado.SZRLabel1.Caption:=MaskEdit1.Text;
   rpt_PedidoVendaCancelado.SZRLabel3.Caption:=MaskEdit2.Text;
   rpt_PedidoVendaCancelado.report.Preview;
   rpt_PedidoVendaCancelado.Close;
  End
  else if Tag=19 then
  Begin
   Application.CreateForm(Trpt_Renegociacao, rpt_Renegociacao);
   rpt_Renegociacao.Titulo_receber2.Close;
   rpt_Renegociacao.Titulo_receber1.Close;
   rpt_Renegociacao.Titulo_receber1.ParamByName('DATAINI').AsDateTime := StrToDate(MaskEdit1.text);
   rpt_Renegociacao.Titulo_receber1.ParamByName('DATAFIM').AsDateTime := STrToDate(MaskEdit2.Text)+1;
   rpt_Renegociacao.Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
   rpt_Renegociacao.Titulo_receber1.Open;
   rpt_Renegociacao.Titulo_receber2.Open;
   rpt_Renegociacao.report.Preview;
   rpt_Renegociacao.Close;
  End
  else if Tag=21 then
  Begin
   Application.CreateForm(Trpt_PedidoVendaDevolvido, rpt_PedidoVendaDevolvido);
   rpt_PedidoVendaDevolvido.Item_Pedido_Venda1.Close;
   rpt_PedidoVendaDevolvido.Pedido_de_Venda1.Close;
   rpt_PedidoVendaDevolvido.Pedido_de_Venda1.ParamByName('DATAINI').AsDateTime := StrToDate(MaskEdit1.text);
   rpt_PedidoVendaDevolvido.Pedido_de_Venda1.ParamByName('DATAFIM').AsDateTime := STrToDate(MaskEdit2.Text)+1;
   rpt_PedidoVendaDevolvido.Pedido_de_Venda1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
   rpt_PedidoVendaDevolvido.Pedido_de_Venda1.Open;
   rpt_PedidoVendaDevolvido.Funcionario1.Open;
   rpt_PedidoVendaDevolvido.Item_Pedido_Venda1.Open;
   rpt_PedidoVendaDevolvido.SZRLabel1.Caption:=MaskEdit1.Text;
   rpt_PedidoVendaDevolvido.SZRLabel3.Caption:=MaskEdit2.Text;
   rpt_PedidoVendaDevolvido.report.Preview;
   rpt_PedidoVendaDevolvido.Close;
   End
   else If Tag=22 then
   begin
    Application.CreateForm(Trpt_TitulosExcluidos,rpt_TitulosExcluidos);
    rpt_TitulosExcluidos.SZRLabel1.Caption := Dt_ini;
    rpt_TitulosExcluidos.SZRLabel3.Caption := Dt_fim;
    rpt_TitulosExcluidos.Titulo_receber1.ParamByName('DATA_INI').AsDate := STrToDate(Dt_ini);
    rpt_TitulosExcluidos.Titulo_receber1.ParamByName('DATA_FIM').AsDate := STrToDate(Dt_fim)+1;
    rpt_TitulosExcluidos.Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    rpt_TitulosExcluidos.Titulo_receber1.Active:=True;
    rpt_TitulosExcluidos.Total:=0;
    rpt_TitulosExcluidos.report.Preview;
    rpt_TitulosExcluidos.Close;
   end;
  Close;
end;

procedure TfMxDataTitulo.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxDataTitulo.FormShow(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

end.
