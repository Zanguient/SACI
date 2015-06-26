unit UVendasCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Variants, Titulo_receber,
  AgenteFin, Forma_de_Pagamento, Funcionario, Parametro, Cliente, Produto,
  Item_Pedido_Venda, CentroCusto;

type
  Trpt_VendasCliente = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrb_detalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrbParcelas: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRDBText10: TSZRDBText;
    zrbTotalGeral: TSZRBand;
    ZRLabel21: TSZRLabel;
    ZRLabel25: TSZRLabel;
    zrlSubTotal: TSZRLabel;
    Produto1: TProduto;
    SZRLabel1: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Cliente1: TCliente;
    zrlTracoDuploParcela: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    Parametro1: TParametro;
    zrlVendedor: TSZRLabel;
    Funcionario1: TFuncionario;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    Parametro2: TParametro;
    SZRLabel54: TSZRLabel;
    SZRLabel55: TSZRLabel;
    zrbCabecalhoPedido: TSZRGroup;
    ZRLabel24: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlData: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    zrlCidade: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlPaiMae: TSZRLabel;
    SZRLabel28: TSZRLabel;
    zrlTrabalho: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel35: TSZRLabel;
    SZRLabel36: TSZRLabel;
    SZRLabel37: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel43: TSZRLabel;
    szrVendedor: TSZRLabel;
    SZRLabel47: TSZRLabel;
    SZRLabel48: TSZRLabel;
    SZRLabel49: TSZRLabel;
    SZRLabel50: TSZRLabel;
    SZRLabel51: TSZRLabel;
    SZRLabel52: TSZRLabel;
    SZRLabel53: TSZRLabel;
    szrOK: TSZRLabel;
    zrlOK: TSZRLabel;
    szrNota: TSZRLabel;
    zrlNotaFiscal: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel64: TSZRLabel;
    SZRLabel65: TSZRLabel;
    SZRLabel66: TSZRLabel;
    SZRLabel67: TSZRLabel;
    SZRLabel68: TSZRLabel;
    SZRLabel69: TSZRLabel;
    SZRLabel70: TSZRLabel;
    SZRLabel71: TSZRLabel;
    SZRLabel72: TSZRLabel;
    SZRLabel73: TSZRLabel;
    SZRLabel74: TSZRLabel;
    SZRLabel75: TSZRLabel;
    SZRLabel76: TSZRLabel;
    SZRLabel77: TSZRLabel;
    SZRLabel78: TSZRLabel;
    SZRLabel79: TSZRLabel;
    SZRLabel80: TSZRLabel;
    SZRLabel81: TSZRLabel;
    SZRLabel82: TSZRLabel;
    SZRLabel83: TSZRLabel;
    SZRLabel84: TSZRLabel;
    SZRLabel85: TSZRLabel;
    SZRLabel86: TSZRLabel;
    SZRLabel87: TSZRLabel;
    SZRLabel88: TSZRLabel;
    SZRLabel90: TSZRLabel;
    SZRLabel91: TSZRLabel;
    SZRLabel92: TSZRLabel;
    SZRLabel93: TSZRLabel;
    SZRLabel94: TSZRLabel;
    SZRLabel95: TSZRLabel;
    SZRLabel96: TSZRLabel;
    SZRLabel97: TSZRLabel;
    SZRLabel98: TSZRLabel;
    SZRLabel99: TSZRLabel;
    SZRLabel100: TSZRLabel;
    SZRLabel101: TSZRLabel;
    SZRLabel102: TSZRLabel;
    SZRLabel103: TSZRLabel;
    SZRLabel104: TSZRLabel;
    SZRLabel105: TSZRLabel;
    SZRLabel106: TSZRLabel;
    SZRLabel107: TSZRLabel;
    SZRLabel108: TSZRLabel;
    SZRLabel109: TSZRLabel;
    SZRLabel110: TSZRLabel;
    SZRLabel111: TSZRLabel;
    SZRLabel112: TSZRLabel;
    SZRLabel113: TSZRLabel;
    SZRLabel114: TSZRLabel;
    SZRLabel115: TSZRLabel;
    SZRLabel116: TSZRLabel;
    SZRLabel117: TSZRLabel;
    SZRLabel118: TSZRLabel;
    SZRLabel119: TSZRLabel;
    SZRLabel120: TSZRLabel;
    SZRLabel121: TSZRLabel;
    SZRLabel122: TSZRLabel;
    SZRLabel123: TSZRLabel;
    SZRLabel124: TSZRLabel;
    SZRLabel125: TSZRLabel;
    SZRLabel126: TSZRLabel;
    SZRLabel127: TSZRLabel;
    SZRLabel128: TSZRLabel;
    SZRLabel129: TSZRLabel;
    SZRLabel130: TSZRLabel;
    SZRLabel131: TSZRLabel;
    SZRLabel132: TSZRLabel;
    SZRLabel133: TSZRLabel;
    SZRLabel134: TSZRLabel;
    SZRLabel135: TSZRLabel;
    SZRLabel136: TSZRLabel;
    SZRLabel137: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    SZRLabel138: TSZRLabel;
    SZRLabel139: TSZRLabel;
    zrlNotaCupom: TSZRLabel;
    SZRLabel140: TSZRLabel;
    SZRLabel141: TSZRLabel;
    SZRLabel142: TSZRLabel;
    SZRLabel143: TSZRLabel;
    SZRLabel144: TSZRLabel;
    SZRLabel145: TSZRLabel;
    SZRLabel146: TSZRLabel;
    SZRLabel147: TSZRLabel;
    SZRLabel148: TSZRLabel;
    SZRLabel149: TSZRLabel;
    SZRLabel150: TSZRLabel;
    SZRLabel151: TSZRLabel;
    SZRLabel152: TSZRLabel;
    SZRLabel153: TSZRLabel;
    SZRLabel154: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel156: TSZRLabel;
    SZRLabel157: TSZRLabel;
    SZRLabel158: TSZRLabel;
    SZRLabel159: TSZRLabel;
    SZRLabel160: TSZRLabel;
    SZRLabel161: TSZRLabel;
    SZRLabel162: TSZRLabel;
    SZRLabel163: TSZRLabel;
    SZRLabel56: TSZRLabel;
    SZRLabel57: TSZRLabel;
    zrbCabecalhoFUN: TSZRGroup;
    zrbTotalVendedor: TSZRBand;
    zrlTotalPedido: TSZRLabel;
    SZRLabel165: TSZRLabel;
    SZRLabel166: TSZRLabel;
    SZRLabel167: TSZRLabel;
    zrlDtAlteracao: TSZRLabel;
    zrlDescVendedorCabecalho: TSZRLabel;
    zrlVendedorCabecalho: TSZRLabel;
    zrbCabecalhoCNC: TSZRGroup;
    SZRLabel171: TSZRLabel;
    SZRLabel172: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrbTotalCentro: TSZRBand;
    SZRLabel173: TSZRLabel;
    SZRLabel174: TSZRLabel;
    zrlCEP: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlProduto: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel22: TSZRLabel;
    zrlCodigoPRD: TSZRLabel;
    SZRLabel40: TSZRLabel;
    zrlNumeroItem: TSZRLabel;
    SZRLabel41: TSZRLabel;
    zrlCodigoCNC: TSZRDBText;
    SZRLabel44: TSZRLabel;
    zrlTotalRegistro: TSZRLabel;
    SZRLabel45: TSZRLabel;
    zrlValorUnitario: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbTotalGeralBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrb_detalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbParcelasBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPedidoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalVendedorAfterPrint(Sender: TObject; Printed: Boolean);
    procedure zrbCabecalhoFUNBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalVendedorBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbTotalCentroBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure LimpaCampos;
    procedure Funcionario1BeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistrosGrupo, TotalRegistros, TotalItens, NumeroItem : integer;
  public
    Total,SubTotal, TotalCentro, TotMov, TotQtd, TotalFUN:Double;
    QtdAcimaNormal : Boolean;
  end;

var
  rpt_VendasCliente: Trpt_VendasCliente;

implementation
Uses
  UDM, MxSVendasCliente, Funcoes;
{$R *.DFM}

procedure Trpt_VendasCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Parametro1.Active := False;
  Produto1.Active := False;
  Cliente1.Active := False;
  Item_Pedido_Venda1.Active := False;
  Action := cafree;
end;

procedure Trpt_VendasCliente.zrbTotalGeralBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbCabecalhoPedido.Height = 0 then
    zrlTotalRegistros.Caption := IntToStr(TotalItens)  
  else
    zrlTotalRegistros.Caption := IntToStr(TotalRegistros);

  if tag <> 1 then
  Begin
    ZRLabel25.Caption:=Format('%.2f',[Total]);
    SZRLabel54.Caption:=Format('%.2f',[TotQtd]);
  end
  else
    zrbTotalGeral.Height := 0;
end;

procedure Trpt_VendasCliente.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNumeroItem.Caption:=preencheZero(3,NumeroItem);
  inc(NumeroItem);

  //Contar total de itens
  inc(TotalItens);

  zrlCodigoPRD.Caption := preencheZero(7,Item_Pedido_Venda1.CodigoPRD);

  if QtdAcimaNormal then
  Begin
    if Item_Pedido_Venda1.FieldByName('PCT_DT_FINALIZADO').asDateTime > 0 then
    Begin
      zrlVendedor.Enabled := True;
      zrlVendedor.Left := 125;
      zrlVendedor.Caption := DateToStr(Item_Pedido_Venda1.FieldByName('PCT_DT_FINALIZADO').asDateTime);
    end
    else
      zrlVendedor.Caption := '';
  end;

  with Produto1 do
  Begin
    if Item_Pedido_Venda1.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
      Open;
    end;
    if not QtdAcimaNormal then
      zrlProduto.Caption := Descricao+' '+Referencia+', '+Marca+' '+Unidade
    else
    Begin
      zrlProduto.Width := 92;
      zrlProduto.Caption := PreencheEspaco(40,Descricao)+' '+PreencheEspaco(20,Referencia)+
                    ' '+PreencheEspaco(20,Marca);
      Exit;
    end;
  end;

  If (Item_Pedido_Venda1.PrecoDesc<>0) or (DM.Configuracao1.Empresa = 3) THEN
  Begin
    TotalFUN   :=TotalFUN+   Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade);
    SubTotal   :=SubTotal+   Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade);
    Total      :=Total+      Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade);
    TotalCentro:=TotalCentro+Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade);
  end
  Else
  Begin
    TotalFUN   :=TotalFUN+   Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade);
    SubTotal   :=SubTotal+   Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade);
    Total      :=Total+      Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade);
    TotalCentro:=TotalCentro+Arredonda(Arredonda(Item_Pedido_Venda1.Preco)*Item_Pedido_Venda1.Quantidade);
  end;

  if DM.Configuracao1.Empresa < 3 then
  Begin
    with Funcionario1 do
    Begin
      if (Item_Pedido_Venda1.CodigoCNC <> CodigoCNC) or
         (Item_Pedido_Venda1.CodigoFUN <> CodigoFUN) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Item_Pedido_Venda1.CodigoCNC;
        ParamByName('FUN_CODIGO').asInteger := Item_Pedido_Venda1.CodigoFUN;
        Open;
      end;
      zrlVendedor.Caption := Apelido;
    end;
  end;

  TotQtd:=TotQtd+Item_Pedido_Venda1.Quantidade;

  if (DM.Configuracao1.Empresa = 3) then
  Begin
    case Item_Pedido_Venda1.Pendencia of
      0:zrlOK.Caption:='OK';
      1:zrlOK.Caption:='PD';
      2:zrlOK.Caption:='PQ';
      3:zrlOK.Caption:='PT';
    end;
  end
  else
    zrlOK.Enabled := False;

  //Definir Preço Unitário
  if DM.Configuracao1.Empresa <> 3 then
  Begin
    if Item_Pedido_Venda1.PrecoDesc > 0 then
    Begin
      zrlValorUnitario.Caption := format('%.2f',[Item_Pedido_Venda1.PrecoDesc]);
      zrlTotalItem.Caption     := format('%.2f',[Item_Pedido_Venda1.PrecoDesc*Item_Pedido_Venda1.Quantidade]);
    end
    else
    Begin
      zrlValorUnitario.Caption := format('%.2f',[Item_Pedido_Venda1.Preco]);
      zrlTotalItem.Caption     := format('%.2f',[Item_Pedido_Venda1.Preco*Item_Pedido_Venda1.Quantidade]);
    end;
  end
  else
  Begin
    zrlValorUnitario.Caption := format('%.2f',[Item_Pedido_Venda1.PrecoDesc]);
    zrlTotalItem.Caption     := format('%.2f',[Item_Pedido_Venda1.PrecoDesc*Item_Pedido_Venda1.Quantidade]);
  end;
end;

procedure Trpt_VendasCliente.zrbParcelasBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  i:integer;
begin
  if tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSVendasCliente.ckbCodigoPDV.Checked then
    Begin
      if report.CurrentY <= 42 then
        report.CurrentY := 42
      else
        report.NewPage;
      zrlTracoDuploParcela.Enabled := False;
      zrbTotalVendedor.Height := 0;
      zrbTotalCentro.Height := 0;
      zrbTotalGeral.Height  := 0;
    end;
  end
  else if (tag in [1,2,3]) then //LBM
  Begin
    if report.CurrentY <= 42 then
      report.CurrentY := 42
    else
    Begin
      report.NewPage;
      report.CurrentY := 42;
    end;
    zrlTracoDuploParcela.Enabled := False;
    zrbTotalVendedor.Height := 0;
    zrbTotalCentro.Height := 0;
    zrbTotalGeral.Height  := 0;
  end;
  SZRLabel67.Caption:=AgenteFin1.Descricao;
  zrlSubTotal.Caption:=Format('%.2f',[SubTotal]);
  SubTotal:=0;
  if tag = 0 then
    if not fMxSVendasCliente.ckbExibirParcelas.Checked then
      Exit;
  if (DM.Configuracao1.Empresa = 3) and
     (Item_Pedido_Venda1.FieldByName('PCT_SITUACAO').asInteger=2) then
  Begin
    SZRLabel138.Enabled:=False;
    SZRLabel139.Enabled:=False;
  end;
  Titulo_receber1.Close;
  Titulo_receber1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
  Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPDV;
  Titulo_receber1.Open;
  Titulo_receber1.First;
  LimpaCampos;
  for i:=1 to Titulo_receber1.RecordCount do
  Begin
    if i = 1 then
    Begin
      SZRLabel143.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel102.Caption:=Titulo_receber1.Sequencia;
      SZRLabel103.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel104.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 2 then
    Begin
      SZRLabel144.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel105.Caption:=Titulo_receber1.Sequencia;
      SZRLabel106.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel107.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 3 then
    Begin
      SZRLabel145.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel108.Caption:=Titulo_receber1.Sequencia;
      SZRLabel109.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel110.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 4 then
    Begin
      SZRLabel146.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel111.Caption:=Titulo_receber1.Sequencia;
      SZRLabel112.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel113.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 5 then
    Begin
      SZRLabel147.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel114.Caption:=Titulo_receber1.Sequencia;
      SZRLabel115.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel116.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 6 then
    Begin
      SZRLabel148.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel117.Caption:=Titulo_receber1.Sequencia;
      SZRLabel118.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel119.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 7 then
    Begin
      SZRLabel149.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel120.Caption:=Titulo_receber1.Sequencia;
      SZRLabel121.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel122.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 8 then
    Begin
      SZRLabel150.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel123.Caption:=Titulo_receber1.Sequencia;
      SZRLabel124.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel125.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 9 then
    Begin
      SZRLabel151.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel126.Caption:=Titulo_receber1.Sequencia;
      SZRLabel127.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel128.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 10 then
    Begin
      SZRLabel152.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel129.Caption:=Titulo_receber1.Sequencia;
      SZRLabel130.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel131.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 11 then
    Begin
      SZRLabel153.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel132.Caption:=Titulo_receber1.Sequencia;
      SZRLabel133.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel134.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end
    else if i = 12 then
    Begin
      SZRLabel154.Caption:=IntToStr(Titulo_receber1.CodigoTRC);
      SZRLabel135.Caption:=Titulo_receber1.Sequencia;
      SZRLabel136.Caption:=DateToStr(Titulo_receber1.Vencimento);
      SZRLabel137.Caption:=format('%.2f',[Titulo_receber1.Valor]);
    end;
    Titulo_receber1.Next;
  end;
end;

procedure Trpt_VendasCliente.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_VendasCliente.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  if tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSVendasCliente.rdgDataCadastro.Checked then
      SZRLabel31.Caption := 'Data'
    else if fMxSVendasCliente.rdgDataAlterado.Checked then
      SZRLabel31.Caption := 'Dt.Alt'
    else if fMxSVendasCliente.rdgDataEmissao.Checked then
      SZRLabel31.Caption := 'Dt.Emi'
    else
      SZRLabel31.Caption := 'Dt.Dev'
  end
  else
    SZRLabel31.Caption := 'Data';
end;

procedure Trpt_VendasCliente.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=0;
  SubTotal:=0;
  TotQtd:=0;
end;

procedure Trpt_VendasCliente.zrbCabecalhoPedidoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vTotalPed : Double;
  sTitulo: string;
begin
  NumeroItem := 1;
  inc(TotalRegistros);
  inc(TotalRegistrosGrupo);  
  if Item_Pedido_Venda1.FieldByName('PCT_DT_ALTERADO').AsDateTime > 0 then
    zrlDtAlteracao.Caption := formatDateTime('dd/mm/yyyy',Item_Pedido_Venda1.FieldByName('PCT_DT_ALTERADO').AsDateTime)
  else
    zrlDtAlteracao.Caption := '';

  SZRLabel56.Caption := IntToStr(Item_Pedido_Venda1.CodigoFUN);

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(IPV_QUANTIDADE*ROUND(IPV_PRECO_DESC,2)) AS TOTAL '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPDV);
    Open;
    vTotalPed := FieldByName('TOTAL').asFloat;
    zrlTotalPedido.Caption := format('%.2f',[vTotalPed+Item_Pedido_Venda1.FieldByName('PCT_ACRESCIMO').asFloat]);
  end;

  case Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger of
    1 : SZRLabel57.Caption := 'AV'
  else
    SZRLabel57.Caption := 'PZ';
  end;
  with Cliente1 do
  Begin
    if (Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger <> CodigoCLI) or
       (Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CLI_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('CNC_CLIENTE').asInteger;
      Open;
    end;
    SZRLabel10.Caption:=RazaoSocial+' ('+IntToStr(CodigoCLI)+')';
    SZRLabel14.Caption:=NomeFantasia;
    SZRLabel37.Caption:=Fone;
    SZRLabel33.Caption:=CGFRG;
    SZRLabel35.Caption:=CPFCGC;
    if DataNascimento > 0 then
      SZRLabel39.Caption:=formatDateTime('dd/mm/yyyy',DataNascimento)
    else
      SZRLabel39.Caption:='';

    Parametro1.Close;
    Parametro1.ParamByName('PAR_CODIGO').asInteger:=Logradouro;
    Parametro1.Open;
    if not Parametro1.IsEmpty then
      SZRLabel17.Caption:=Parametro1.Descricao+' '+Endereco
    else
      SZRLabel17.Caption:=Endereco;

    SZRLabel18.Caption:=Bairro;
    zrlCidade.Caption:=Trim(Cidade)+'/'+Trim(Uf);
    zrlCEP.Caption := CEP;
    if (rpt_VendasCliente.tag = 0) then
    Begin
      if fMxSVendasCliente.ckbSintetico.Checked and PessoaFisica then
        zrlPaiMae.Caption:=AbreviarNome(RazaoSocial)
      else
      Begin
        if Trim(Pai) <> '' then
          if Trim(Mae) <> '' then
            zrlPaiMae.Caption:=Trim(Pai)+'/'+Trim(Mae)
          else
            zrlPaiMae.Caption:=Trim(Pai)
        else
          zrlPaiMae.Caption:=Trim(Mae);
      end;
    end
    else
    Begin
      if Trim(Pai) <> '' then
        if Trim(Mae) <> '' then
          zrlPaiMae.Caption:=Trim(Pai)+'/'+Trim(Mae)
        else
          zrlPaiMae.Caption:=Trim(Pai)
      else
        zrlPaiMae.Caption:=Trim(Mae);
    end;
    if PessoaFisica then
      zrlTrabalho.Caption := LocalTrabalho
    else
      zrlTrabalho.Caption := ''
  end;

  if tag = 0 then //Rel Especial de Vendas
  Begin
    if fMxSVendasCliente.rdgDataCadastro.Checked then
      if Item_Pedido_Venda1.FieldByName('PCT_DT_CADASTRO').AsDateTime > 0 then
        zrlData.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PCT_DT_CADASTRO').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataAlterado.Checked then
      if Item_Pedido_Venda1.FieldByName('PCT_DT_ALTERADO').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PCT_DT_ALTERADO').AsDateTime)
      else
        zrlData.Caption := ''
    else if fMxSVendasCliente.rdgDataEmissao.Checked then
      if Item_Pedido_Venda1.FieldByName('PCT_DT_EMISSAO_VENDA').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PCT_DT_EMISSAO_VENDA').AsDateTime)
      else
        zrlData.Caption := ''
    else
      if Item_Pedido_Venda1.FieldByName('PCT_DT_DEVOLUCAO').AsDateTime > 0 then
        zrlData.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PCT_DT_DEVOLUCAO').AsDateTime)
      else
        zrlData.Caption := ''
  end
  else if Item_Pedido_Venda1.FieldByName('PCT_DT_CADASTRO').AsDateTime > 0 then
    zrlData.Caption := FormatDateTime('dd/mm/yyyy hh:mm',Item_Pedido_Venda1.FieldByName('PCT_DT_CADASTRO').AsDateTime)
  else
    zrlData.Caption := '';

  sTitulo := '';
  if DM.Configuracao1.Empresa = 4 then
    if Item_Pedido_Venda1.FieldByName('PCT_TITULO_GERADO').asInteger = 0 then
      sTitulo := ' S/TRC';

  case Item_Pedido_Venda1.FieldByName('PCT_SITUACAO').asInteger of
    -1: SZRLabel43.Caption:='Reserva'+sTitulo;
     0: if Item_Pedido_Venda1.FieldByName('PCT_DIAS_RESERV').asInteger > 0 then
          SZRLabel43.Caption:='ORCAMENTO'
        else
          SZRLabel43.Caption:='Em Aberto';
     1: SZRLabel43.Caption:='Em Aberto';
     2: SZRLabel43.Caption:='Em Aberto';
     3: if Item_Pedido_Venda1.FieldByName('PCT_DIAS_RESERV').asInteger > 0 then
          SZRLabel43.Caption:='ORCAMENTO'
        else
          SZRLabel43.Caption:='Em Aberto';
     4: SZRLabel43.Caption:='Finalizada'+sTitulo;
     5: SZRLabel43.Caption:='Cons. Fin.'+sTitulo;
     6: SZRLabel43.Caption:='Cancelada'+sTitulo;
     7: SZRLabel43.Caption:='Cons. Canc.'+sTitulo;
     8: SZRLabel43.Caption:='Devolvida'+sTitulo;
     9: SZRLabel43.Caption:='Cons. Dev.'+sTitulo;
    10: SZRLabel43.Caption:='Canc.Não Apr.'+sTitulo;
    11: SZRLabel43.Caption:='Finalizado'+sTitulo;
  end;

  with Forma_de_Pagamento1 do
  Begin
    if Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger <> CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('FPG_CODIGO').asInteger;
      Open;
    end;
    SZRLabel48.Caption := Descricao;
  end;

  with AgenteFin1 do
  Begin
    if Item_Pedido_Venda1.FieldByName('AGF_CODIGO').asInteger <> CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('AGF_CODIGO').asInteger;
      Open;
    end;
    SZRLabel51.Caption := Descricao;
  end;

  Parametro2.Close;
  Parametro2.ParamByName('PAR_CODIGO').asInteger:=Item_Pedido_Venda1.FieldByName('PCT_TIPO_PAG').asInteger;
  Parametro2.Open;
  SZRLabel53.Caption:=Parametro2.Descricao;

  if (Item_Pedido_Venda1.FieldByName('PCT_NOTA_FISCAL').asString = '0') OR
     (Item_Pedido_Venda1.FieldByName('PCT_NOTA_FISCAL').asString = '') then
  Begin
    zrlNotaCupom.Enabled:=False;
    szrNota.Enabled:=False;
    zrlNotaFiscal.Enabled:=False;
  end
  else
  Begin
    zrlNotaCupom.Enabled:=True;
    if SZRLabel10.Top <> 0 then
      szrNota.Enabled:=True;
    zrlNotaFiscal.Enabled:=True;
    if Item_Pedido_Venda1.FieldByName('PCT_NOTA_FISCAL').asString = '-1' then
      zrlNotaFiscal.Caption:='SN'
    else
      zrlNotaFiscal.Caption:=Item_Pedido_Venda1.FieldByName('PCT_NOTA_FISCAL').asString;
  end;
  if DM.Configuracao1.Empresa >= 3 then
  Begin
    SZRLabel24.Enabled := False;
    SZRLabel25.Enabled := False;
    if Cliente1.PessoaFisica then
      SZRLabel26.Caption := 'Pai/Mae:'
    else
      SZRLabel26.Caption := 'Contato:';
    if tag = 0 then
    Begin
      if not fMxSVendasCliente.ckbSintetico.Checked then //Não Sintético
      Begin
        SZRLabel26.Left    := 0;
        zrlPaiMae.Left    := 10;
      end;
    end
    else
    Begin
      SZRLabel26.Left    := 0;
      zrlPaiMae.Left    := 10;
    end;
  end
  else
    SZRLabel25.Caption:=Cliente1.Conjuge;

  if (Item_Pedido_Venda1.FieldByName('PCT_NOTA_FISCAL').asString <> '') and
     (Item_Pedido_Venda1.FieldByName('PCT_NOTA_FISCAL').asString <> '-1') then
  Begin
    case Item_Pedido_Venda1.FieldByName('PCT_NOTA_CUPOM').asInteger of
      1: zrlNotaCupom.Caption:='N';
      2: zrlNotaCupom.Caption:='C';
      else
        zrlNotaCupom.Caption:='';
    end;
  end
  else
    zrlNotaCupom.Caption:='';

  if DM.Configuracao1.Empresa < 3 then
    szrOK.Enabled := False
  else
  Begin
    szrVendedor.Enabled := False;
    zrlVendedor.Enabled := False;
  end;

  if (DM.Configuracao1.Empresa <> 3) then
    szrOK.Enabled := False;
end;

procedure Trpt_VendasCliente.zrbTotalVendedorAfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  if tag = 0 then
    if (fMxSVendasCliente.ckbSintetico.Checked) and
       (fMxSVendasCliente.ckbVendedorPorPagina.Checked) then
      report.NewPage;
end;

procedure Trpt_VendasCliente.zrbCabecalhoFUNBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalFUN := 0;
  TotalRegistrosGrupo := 0;
  if (tag = 0) then
    if (fMxSVendasCliente.ckbVendedorPorPagina.Checked) then
      report.CurrentY := 7;
  with Funcionario1 do
  Begin
    if (Item_Pedido_Venda1.CodigoFUN <> CodigoFUN) or
       ((DM.Configuracao1.Empresa < 3) and
       (Item_Pedido_Venda1.CodigoCNC <> CodigoCNC)) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoFUN;
      Open;
    end;
    if Trim(Fone) <> '' then
      zrlVendedorCabecalho.Caption:=Apelido+' - Fone: '+Fone
    else
      zrlVendedorCabecalho.Caption:=Apelido;
  end;
end;

procedure Trpt_VendasCliente.zrbTotalVendedorBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if tag = 0 then
  Begin
    if not fMxSVendasCliente.ckbSintetico.Checked then
    Begin
      SZRLabel165.Enabled := False;
      zrbTotalVendedor.Height := 0;
    end
    else
      SZRLabel166.Caption := format('%.2f',[TotalFUN]);
  end;
  zrlTotalRegistro.Caption := IntToStr(TotalRegistrosGrupo);
end;

procedure Trpt_VendasCliente.zrbCabecalhoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbCabecalhoCNC.Height > 0 then
  Begin
    CentroCusto1.Close;
    CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
    CentroCusto1.Open;
    SZRLabel172.Caption:=CentroCusto1.RazaoSocial;
  end;
  TotalCentro := 0;
end;

procedure Trpt_VendasCliente.zrbTotalCentroBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if tag <> 1 then
  Begin
    SZRLabel174.Caption := format('%.2f',[TotalCentro]);
    TotalCentro:=0;
  end
  else
    zrbTotalCentro.Height := 0;
end;

procedure Trpt_VendasCliente.LimpaCampos;
begin
  SZRLabel143.Caption:='';
  SZRLabel102.Caption:='';
  SZRLabel103.Caption:='';
  SZRLabel104.Caption:='';
  SZRLabel144.Caption:='';
  SZRLabel105.Caption:='';
  SZRLabel106.Caption:='';
  SZRLabel107.Caption:='';
  SZRLabel145.Caption:='';
  SZRLabel108.Caption:='';
  SZRLabel109.Caption:='';
  SZRLabel110.Caption:='';
  SZRLabel146.Caption:='';
  SZRLabel111.Caption:='';
  SZRLabel112.Caption:='';
  SZRLabel113.Caption:='';
  SZRLabel147.Caption:='';
  SZRLabel114.Caption:='';
  SZRLabel115.Caption:='';
  SZRLabel116.Caption:='';
  SZRLabel148.Caption:='';
  SZRLabel117.Caption:='';
  SZRLabel118.Caption:='';
  SZRLabel119.Caption:='';
  SZRLabel149.Caption:='';
  SZRLabel120.Caption:='';
  SZRLabel121.Caption:='';
  SZRLabel122.Caption:='';
  SZRLabel150.Caption:='';
  SZRLabel123.Caption:='';
  SZRLabel124.Caption:='';
  SZRLabel125.Caption:='';
  SZRLabel151.Caption:='';
  SZRLabel126.Caption:='';
  SZRLabel127.Caption:='';
  SZRLabel128.Caption:='';
  SZRLabel152.Caption:='';
  SZRLabel129.Caption:='';
  SZRLabel130.Caption:='';
  SZRLabel131.Caption:='';
  SZRLabel153.Caption:='';
  SZRLabel132.Caption:='';
  SZRLabel133.Caption:='';
  SZRLabel134.Caption:='';
  SZRLabel154.Caption:='';
  SZRLabel135.Caption:='';
  SZRLabel136.Caption:='';
  SZRLabel137.Caption:='';
end;

procedure Trpt_VendasCliente.Funcionario1BeforeOpen(DataSet: TDataSet);
begin
  try
    Funcionario1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
  except
  end;
end;

procedure Trpt_VendasCliente.FormCreate(Sender: TObject);
begin
  TotalRegistros := 0;
  TotalItens := 0;
  QtdAcimaNormal := False;
  if DM.Configuracao1.Empresa >= 3 then
  Begin
    Funcionario1.Close;
    Funcionario1.SQL.Text := 'SELECT FUN_CODIGO,FUN_NOME,CNC_CODIGO,FUN_APELIDO,FUN_FONE '+
      ' FROM FUNCIONARIO '+
      ' WHERE FUN_CODIGO=:FUN_CODIGO ';
  end;
end;

procedure Trpt_VendasCliente.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with DM.Usuario2 do
  Begin
    if DM.Configuracao1.CodigoUSU <> CodigoUSU then
    Begin
      Close;
      ParamByName('USU_CODIGO').asInteger := DM.Configuracao1.CodigoUSU;
      Open;
    end;
    zrlUsuario.Caption := 'Usuario: '+UpperCase(NomeUSU);
  end;
end;

end.
