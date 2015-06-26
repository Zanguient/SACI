unit UPrev_vendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Item_Pedido_Venda, CentroCusto, Item_de_Estoque, Item_Pedido_Compra,
  Produto;

type
  Trpt_prev_vendas = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrlDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    zrlDescricao: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlNomeDaEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    zrlDescData: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    SZRLabel3: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    zlrFiltros: TSZRLabel;
    SZRLabel9: TSZRLabel;
    Item_Pedido_Compra1: TItem_Pedido_Compra;
    Item_Pedido_Compra1QTD: TFloatField;
    zrlDiasPeriodo: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlPrevisaoDias: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    Item_de_Estoque1QTD: TFloatField;
    Item_de_Estoque2: TItem_de_Estoque;
    FloatField1: TFloatField;
    Produto1: TProduto;
    SZRLabel4: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlDescEmprestimo: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlDisponivel: TSZRLabel;
    zrlPendentes: TSZRLabel;
    zrlAvarias: TSZRLabel;
    zrlEmprestimo: TSZRLabel;
    zrlMediaDia: TSZRLabel;
    zrlDataUltimaVenda: TSZRLabel;
    zlrVendaMedia: TSZRLabel;
    zrlPrevisao: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel8: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlDescLJ4: TSZRLabel;
    zrlLJ4: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlPercentualAumento: TSZRLabel;
    SZRLabel18: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros : integer;
  public
    DataINI, DataFIM : TDateTime;
    iDiasPeriodo, iDiasPrevisao: integer;
    Entidade : TProduto;
  end;

var
  rpt_prev_vendas: Trpt_prev_vendas;

implementation

uses UDM, Funcoes, UfMxSProdutoData;

{$R *.DFM}

procedure Trpt_prev_vendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Item_Pedido_Venda1.Active := false;
  Action := caFree;
end;

procedure Trpt_prev_vendas.FormCreate(Sender: TObject);
begin
  Entidade := Produto1;
  TotalRegistros := 0;
  zrlProduto.WordWrap := False;
  if DM.Configuracao1.Empresa = empEletro then
    zrlDescEmprestimo.Caption := 'Venda';
end;

procedure Trpt_prev_vendas.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sCodigoCNC, sEntregaCNC, sPedidoCNC, sTrocaCNC, sUltimaVenda, sDescricao: string;
  iDisponivel, iPendente, iAvaria, iEmprestimo, VerificarTudo,
    iQtdVenda, iQtdDevolvido: integer;
  vVendaMedia, vSaldoLJ3, vSaldoLJ4, vPrevisao : Double;
begin
  DoPrint := True;
  if DM.Configuracao1.Empresa = empEletro then
    sDescricao := Entidade.Descricao + ' ' + Entidade.Caracteristica
  else
    sDescricao := Entidade.Descricao;

  if Entidade.ForaPrevisao then
    if Length(sDescricao) <= zrlProduto.Width then
      zrlProduto.Caption := '*'+sDescricao
    else
      zrlProduto.Caption := '*'+Copy(sDescricao,1,zrlProduto.Width-1)
  else if Length(sDescricao) <= zrlProduto.Width then
    zrlProduto.Caption := sDescricao
  else
    zrlProduto.Caption := Copy(sDescricao,1,zrlProduto.Width);

  if Length(Entidade.Referencia) <= zrlReferencia.Width then
    zrlReferencia.Caption := Entidade.Referencia
  else
    zrlReferencia.Caption := Copy(Entidade.Referencia,1,zrlReferencia.Width);

  with Item_de_Estoque1 do
  Begin
    Close;
    if fMxSProdutoData.ckbCodigoCNC.Checked then
      SQL.Text := 'SELECT SUM(IES_SCOMERCIAL-IES_SRESERVADO-IES_INDISPONIVEL) AS QTD '+
        ' FROM ITEM_DE_ESTOQUE '+
        ' WHERE CNC_CODIGO='+IntToStr(fMxSProdutoData.dblCentroDeCusto.KeyValue)+
        ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)
    else
      SQL.Text := 'SELECT SUM(IES_SCOMERCIAL-IES_SRESERVADO-IES_INDISPONIVEL) AS QTD '+
        ' FROM ITEM_DE_ESTOQUE '+
        ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
    Open;
    iDisponivel := FieldByName('QTD').asInteger;
    if fMxSProdutoData.ckbSomenteEstoqueVendas.Checked then
      VerificarTudo := 1
    else
      VerificarTudo := 0;
      
    case fMxSProdutoData.rdgEstoque.ItemIndex of
      0 : if not (iDisponivel < 0) then
            if VerificarTudo = 0 then
            Begin
              DoPrint := False;
              Exit;
            end
            else
              VerificarTudo := 2;
      1 : if not (iDisponivel = 0) then
            if VerificarTudo = 0 then
            Begin
              DoPrint := False;
              Exit;
            end
            else
              VerificarTudo := 2;
      2 : if not (iDisponivel > 0) then
            if VerificarTudo = 0 then
            Begin
              DoPrint := False;
              Exit;
            end
            else
              VerificarTudo := 2;
      3 : if not (iDisponivel <= 0) then
            if VerificarTudo = 0 then
            Begin
              DoPrint := False;
              Exit;
            end
            else
              VerificarTudo := 2;
      4 : if not (iDisponivel >= 0) then
            if VerificarTudo = 0 then
            Begin
              DoPrint := False;
              Exit;
            end
            else
              VerificarTudo := 2;
      5 : if not (iDisponivel <> 0) then
            if VerificarTudo = 0 then
            Begin
              DoPrint := False;
              Exit;
            end
            else
              VerificarTudo := 2;
      else
        DoPrint := True
    end;
  end;

  sEntregaCNC := '';
  if fMxSProdutoData.ckbCodigoCNC.Checked then
  Begin
    sCodigoCNC := ' AND (CNC_CODIGO='+IntToStr(fMxSProdutoData.dblCentroDeCusto.keyValue)+') ';
    sEntregaCNC := ' AND (P1.CNC_ENTREGA='+IntToStr(fMxSProdutoData.dblCentroDeCusto.keyValue)+') ';
    sPedidoCNC := ' AND (P1.CNC_CODIGO='+IntToStr(fMxSProdutoData.dblCentroDeCusto.keyValue)+') ';
    sTrocaCNC := ' AND (T1.CNC_CODIGO='+IntToStr(fMxSProdutoData.dblCentroDeCusto.keyValue)+') ';
  end;

  //Calcular Pendentes
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := ' SELECT SUM(T1.IPC_QUANTIDADE) AS QTD '+
      ' FROM ITEM_DE_PEDIDO_DE_COMPRA T1, PEDIDO_DE_COMPRA P1 '+
      ' WHERE T1.PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+
      ' AND P1.PCP_SITUACAO=0 '+sEntregaCNC+
      ' AND P1.PCP_CODIGO=T1.PCP_CODIGO AND P1.CNC_CODIGO=P1.CNC_CODIGO ';
    Open;
    iPendente := FieldByName('QTD').asInteger;
    if (iPendente <> 0) then
      VerificarTudo := 3;
  end;

  //Calcular Avarias
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := ' SELECT SUM(SPR_QUANTIDADE) AS QTD '+
      ' FROM SOLICITACAO_DE_PECAS_DE_REP '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+
      sCodigoCNC;
    Open;
    iAvaria := FieldByName('QTD').asInteger;
    if (iAvaria <> 0) then
      VerificarTudo := 3;
  end;

  //Calcular Emprestimos
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := ' SELECT SUM(EMP_QUANTIDADE) AS QTD '+
      ' FROM EMPRESTIMO '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+
      ' AND EMP_SITUACAO=0 '+sCodigoCNC;
    Open;
    iEmprestimo := FieldByName('QTD').asInteger;
    if (iEmprestimo <> 0) then
      VerificarTudo := 3;
  end;

  vSaldoLJ3 := 0;
  vSaldoLJ4 := 0;
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    //Calcular Pendentes LJ3
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT SUM(T1.IPC_QUANTIDADE) AS QTD '+
        ' FROM ITEM_DE_PEDIDO_DE_COMPRA T1, PEDIDO_DE_COMPRA P1 '+
        ' WHERE T1.PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+
        ' AND P1.PCP_SITUACAO=0 '+sEntregaCNC+
        ' AND P1.PCP_SN=1 '+
        ' AND P1.PCP_CODIGO=T1.PCP_CODIGO AND P1.CNC_CODIGO=P1.CNC_CODIGO ';
      Open;
      vSaldoLJ3 := 0 - FieldByName('QTD').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(IES_SSN) AS QTD '+
        ' FROM ITEM_DE_ESTOQUE '+
        ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
      Open;
      vSaldoLJ3 := vSaldoLJ3 - FieldByName('QTD').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(T1.IPC_QUANTIDADE) AS QTD '+
        ' FROM ITEM_DE_PEDIDO_DE_COMPRA T1, PEDIDO_DE_COMPRA P1 '+
        ' WHERE T1.PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+
        ' AND P1.PCP_SITUACAO=0 '+sEntregaCNC+
        ' AND P1.PCP_LJ4=1 '+
        ' AND P1.PCP_CODIGO=T1.PCP_CODIGO AND P1.CNC_CODIGO=P1.CNC_CODIGO ';
      Open;
      vSaldoLJ4 := 0 - FieldByName('QTD').asFloat;

      Close;
      SQL.Text := 'SELECT SUM(IES_SLJ4) AS QTD '+
        ' FROM ITEM_DE_ESTOQUE '+
        ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
      Open;
      vSaldoLJ4 := vSaldoLJ4 - FieldByName('QTD').asFloat;
    end;
  end;

  //Calcular Total Venda
  with DM.QR_Consultas do
  Begin
    // Calcular Venda (do período) Confirmada e Devolvida
    Close;
    SQL.Text := 'SELECT SUM(I1.IPV_QUANTIDADE) AS QTD '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_DATA_HORA>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DATA_HORA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_SITUACAO IN (4,8)) '+
      ' AND I1.PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+sPedidoCNC+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    iQtdVenda := FieldByName('QTD').asInteger;

    //Calcular Venda (Itens Trocados - Devolvidos Parciais)
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE) AS QTD '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_TROCA I1 '+
      ' WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_SITUACAO=4) '+sPedidoCNC+
      ' AND I1.PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+
      ' AND I1.ITO_SITUACAO=1 '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    iQtdVenda := iQtdVenda + FieldByName('QTD').asInteger;
  end;

  //Calcular Total Devolvido (no período)
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(I1.IPV_QUANTIDADE) AS QTD '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.PDV_DT_DEVOLUCAO>="'+MesDia(DataINI)+'" '+
      ' AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(DataFIM+1)+'" '+
      ' AND (P1.PDV_SITUACAO=8) '+sPedidoCNC+
      ' AND I1.PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    iQtdDevolvido := FieldByName('QTD').asInteger;

    //Calcular Itens de Troca (Itens Trocados - Devolvidos Parciais)
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE) AS QTD '+
      ' FROM TROCA T1, ITEM_DE_TROCA I1 '+
      ' WHERE T1.TRO_DATA>="'+MesDia(DataINI)+'" '+
      ' AND T1.TRO_DATA<"'+MesDia(DataFIM+1)+'" '+
      ' AND I1.PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+sTrocaCNC+
      ' AND I1.ITO_SITUACAO=1 '+
      ' AND T1.TRO_CODIGO=I1.TRO_CODIGO ';
    Open;
    iQtdDevolvido := iQtdDevolvido + FieldByName('QTD').asInteger;
  end;

  //Calcular Venda Média
  vVendaMedia := (iQtdVenda - iQtdDevolvido)/iDiasPeriodo;

  if (VerificarTudo = 1) and
     (iDisponivel = 0) and
     (vVendaMedia = 0) then
  Begin
    DoPrint := False;
    Exit;
  end;


  sUltimaVenda := '';
  if DM.Configuracao1.Empresa <> empLBM then
    //Calcular Data da Última Venda
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT MAX(P1.PDV_DATA_HORA) AS DATA '+
        ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
        ' WHERE (P1.PDV_SITUACAO=4) '+
        ' AND I1.PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+sPedidoCNC+
        ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
        ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
      Open;
      if FieldByName('DATA').asDateTime > 0 then
        sUltimaVenda := DateToStr(FieldByName('DATA').asDateTime);
    end;

  //Exibir Data da Última Venda
  if DM.Configuracao1.Empresa <> empLBM then
    zrlDataUltimaVenda.Caption := sUltimaVenda
  else
  Begin
    zrlDataUltimaVenda.Left    := 67; //LJ33
    zrlDataUltimaVenda.Width   := 3;  //LJ3
    zrlDataUltimaVenda.Caption := IntToStr(Trunc(vSaldoLJ3));
    zrlLJ4.Enabled := True;
    zrlLJ4.Caption := IntToStr(Trunc(vSaldoLJ4));
    zrlReferencia.Left := 73; //Referencia
  end;

  //Exibir Disponível
  zrlDisponivel.Caption := IntToStr(iDisponivel);

  //Exibir Pendentes
  zrlPendentes.Caption := IntToStr(iPendente);

  //Exibir Avarias
  zrlAvarias.Caption := IntToStr(iAvaria);

  //Exibit Emprestimos
  if DM.Configuracao1.Empresa <> empEletro then
    zrlEmprestimo.Caption := IntToStr(iEmprestimo)
  else
    zrlEmprestimo.Caption := IntToStr(iQtdVenda - iQtdDevolvido);

  //Exibir Média Dia
  if vVendaMedia <= 0 then
    zrlMediaDia.Caption := '*****'
  else
    zrlMediaDia.Caption := IntToStr(Trunc((iDisponivel+iPendente+iAvaria+iEmprestimo)/vVendaMedia));

  //Exibir Preço de Compra
//  zrlPrecoCompra.Caption := format('%.2f', [Entidade.Precocompra]);

  //Exibir Venda Media
  zlrVendaMedia.Caption := format('%.4f',[vVendaMedia]);

  //Exibir Precisão
  vPrevisao := iDiasPrevisao*(vVendaMedia+vVendaMedia*StrToFloat(zrlPercentualAumento.Caption)/100)-
               (iDisponivel+iPendente+iAvaria+iEmprestimo);
  zrlPrevisao.Caption := format('%.2f',[vPrevisao]);

  if DoPrint then
    inc(TotalRegistros);
end;

procedure Trpt_prev_vendas.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if TotalRegistros > 0 then
    zrlTotalRegistros.Caption := IntToStr(TotalRegistros)
  else
    zrbSumario.Height := 0;
end;

procedure Trpt_prev_vendas.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeDaEmpresa.Caption := DM.CentroCusto1.RazaoSocial;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  //Trocar de Posição o Estoque Loja3 com a Referencia
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    zrlDescData.Left    := 67; //LJ3
    zrlDescData.Width   := 3;  //LJ3  
    zrlDescData.Caption := 'LJ3';
    zrlDescLJ4.Enabled  := True;
    SZRLabel4.Left := 73; //Referencia
  end;
end;

procedure Trpt_prev_vendas.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
