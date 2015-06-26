unit UPendencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, DateUtils, Produto,
  Cliente, Emprestimo, CentroCusto, Pendencias;

type
  Trpt_Pendencia = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRDBText1: TSZRDBText;
    Cliente1: TCliente;
    Produto1: TProduto;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlProduto1: TSZRLabel;
    zrlDetalhe1: TSZRLabel;
    zrlSituacao: TSZRLabel;
    Pendencias1: TPendencias;
    zrlProduto2: TSZRLabel;
    zrlDetalhe2: TSZRLabel;
    zrlProduto3: TSZRLabel;
    zrlDetalhe3: TSZRLabel;
    zrlTitulo: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlDescCliente: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlCPFCNPJ: TSZRLabel;
    SZRDBText7: TSZRDBText;
    zrlDescPedido: TSZRLabel;
    zrlDataPedido: TSZRLabel;
    zrlDescDataPedido: TSZRLabel;
    zrlTipoPag: TSZRLabel;
    zrlDescTipoPag: TSZRLabel;
    zrlFormaPagamento: TSZRLabel;
    zrlDescFormaPag: TSZRLabel;
    zrlAgenteFinanceiro: TSZRLabel;
    zrlDescAgFinan: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRLabel21: TSZRLabel;
    zrlTipo: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlPrecoSugestao1: TSZRLabel;
    zrlPrecoVendido1: TSZRLabel;
    zrlPrecoSugestao2: TSZRLabel;
    zrlPrecoVendido2: TSZRLabel;
    zrlPrecoSugestao3: TSZRLabel;
    zrlPrecoVendido3: TSZRLabel;
    zrlComJuros: TSZRLabel;
    zrlRecebido: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlCentroDeCusto: TSZRLabel;
    zrlUsuarioLiberou: TSZRLabel;
    zrlDescUsuarioLiberou: TSZRLabel;
    zrlDataAlterado: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlResponsavel: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlUsuarioSolicitou: TSZRLabel;
    zrlProduto0: TSZRLabel;
    zlrCreditoExtorno: TSZRLabel;
    zrlProduto4: TSZRLabel;
    zrlProduto6: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private

  public
    Entidade: TPendencias;
  end;

var
  rpt_Pendencia: Trpt_Pendencia;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}


procedure Trpt_Pendencia.FormCreate(Sender: TObject);
begin
  Entidade := Pendencias1;
  if DM.Configuracao1.Empresa = empLBM then
    with Cliente1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CLIENTE WHERE CLI_CODIGO=:CLI_CODIGO';
    end;
end;

procedure Trpt_Pendencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_Pendencia.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Pendencia.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Pendencia.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao: string;
  i: integer;
begin
  zrlProduto0.Caption := '';
  zrlProduto4.Caption := '';
  zrlProduto6.Caption := '';

  zrlDescDataPedido.Enabled := True;
  zrlDescTipoPag.Enabled := True;
  zrlDescFormaPag.Enabled := True;
  zrlDescAgFinan.Enabled := True;
  zrlDescPedido.Enabled := True;
  SZRDBText7.Enabled := True;
  zrlDescCliente.Enabled := True;

  with CentroCusto1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.CodigoCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
      Open;
    end;
    zrlCentroDeCusto.Caption := RazaoSocial;
  end;

  zrlResponsavel.Caption := UpperCase(DM.SelecionaFuncionario(Entidade.CodigoFUN));

  zrlUsuarioSolicitou.Caption := UpperCase(DM.NomeUsuario(Entidade.CodigoUSU));

  if Entidade.DataAlterado > 0 then
    zrlDataAlterado.Caption := DateToStr(Entidade.DataAlterado);

  case Entidade.Situacao of
    0: zrlSituacao.Caption := 'AGUARDANDO';
    1: zrlSituacao.Caption := 'DESATIVADO';
    2: zrlSituacao.Caption := 'AUTORIZADO';
    3: zrlSituacao.Caption := 'PROCESSADO';
  end;

  case Entidade.Tipo of
    0: zrlTipo.Caption := 'DEVOLUCAO TOTAL';
    1: zrlTipo.Caption := 'DEVOLUCAO PARCIAL';
    2: zrlTipo.Caption := 'DESCONTO PRODUTO';
    3: zrlTipo.Caption := 'CANCELAR VENDA';
    4: zrlTipo.Caption := 'DESCONTO TITULO';
    5: zrlTipo.Caption := 'REABRIR TITULO';
    6: zrlTipo.Caption := 'EXCLUIR TITULO';
    7: zrlTipo.Caption := 'LIBERAR VENDA SPC';
    8: zrlTipo.Caption := 'ENTRADA AVULSA';
    9: zrlTipo.Caption := 'SAIDA AVULSA';
  end;

  case Entidade.CreditoExtorno of
    -1: zlrCreditoExtorno.Caption := '';
     0: zlrCreditoExtorno.Caption := 'GERAR CREDITO';
     1: zlrCreditoExtorno.Caption := 'GERAR EXTORNO';
     2: zlrCreditoExtorno.Caption := 'IGNORAR CREDITO';
  end;

  with DM.QR_Consultas do
  Begin
    //Dados do Pedido
    Close;
    SQL.Text := 'SELECT PDV_DATA_HORA '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
    Open;
    zrlDataPedido.Caption := FormatDateTime('DD/MM/YYY HH:MM',FieldByName('PDV_DATA_HORA').asDateTime);

    zrlTipoPag.Caption := DM.SelecionaParametro(Entidade.TipoPag);
    zrlFormaPagamento.Caption := DM.SelecionaFormaPagamento(Entidade.CodigoFPG);
    zrlAgenteFinanceiro.Caption := DM.SelecionaAgenteFinanceiro(Entidade.CodigoAGF);
  end;

  if Entidade.CodigoCLI > 0 then
  Begin
    with Cliente1 do
    Begin
      if (not Active) or
         (CodigoCNC <> Entidade.ClienteCNC) or
         (CodigoCLI <> Entidade.CodigoCLI) then
      Begin
        Close;
        try
          ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
        except
        end;
        ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
        Open;
      end;
      zrlCliente.Caption := RazaoSocial;
      zrlCPFCNPJ.Caption := CPFCGC;
    end;
  end
  else
  Begin
    zrlCliente.Caption := '';
    zrlCPFCNPJ.Caption := '';
  end;

  with DM.QR_Consultas do
  Begin
    //Dados Produto1
    if Entidade.CodigoPRD1 > 0 then
    Begin
      if Produto1.CodigoPRD <> Entidade.CodigoPRD1 then
      Begin
        Produto1.Close;
        Produto1.ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD1;
        Produto1.Open;
      end;
      sDescricao := PreencheZero(7,Entidade.CodigoPRD1)+'-'+Trim(Produto1.Descricao+' '+Produto1.Caracteristica);
      if Length(sDescricao) <= zrlProduto1.Width then
        zrlProduto1.Caption := sDescricao
      else
        zrlProduto1.Caption := Copy(sDescricao,1,zrlProduto1.Width);

      if Length(Produto1.Detalhe) <= zrlDetalhe1.Width then
        zrlDetalhe1.Caption := Produto1.Detalhe
      else
        zrlDetalhe1.Caption := Copy(Produto1.Detalhe,1,zrlDetalhe1.Width);

      if Entidade.PrecoPRD1 > 0 then
      Begin
        Close;
        SQL.Text := 'SELECT IPV_PRECO_SUGERIDO '+
          ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
          ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD1);
        Open;
        if not (Entidade.Tipo in [8,9]) then //Entrada/Saída Avulsa
        Begin
          zrlPrecoSugestao1.Caption := 'Sugestao: R$ '+Format('%.2f',[FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
          zrlPrecoVendido1.Caption  := 'Vendido: R$ '+Format('%.2f',[Entidade.PrecoPRD1]);
        end
        else
        Begin
          zrlDescDataPedido.Enabled := False;
          zrlDescTipoPag.Enabled := False;
          zrlDescFormaPag.Enabled := False;
          zrlDescAgFinan.Enabled := False;
          zrlDescPedido.Enabled := False;
          SZRDBText7.Enabled := False;
          zrlDescCliente.Enabled := False;
          zrlPrecoSugestao1.Caption := '';
          zrlPrecoVendido1.Caption  := 'Quantidade  '+Format('%.2f',[Entidade.PrecoPRD1]);
        end;
      end
      else
      Begin
        zrlPrecoSugestao1.Caption := '';
        zrlPrecoVendido1.Caption := '';
      end;
    end
    else
    Begin
      zrlProduto1.Caption := '';
      zrlDetalhe1.Caption := '';

      zrlPrecoSugestao1.Caption := '';
      zrlPrecoVendido1.Caption := '';
    end;


    //Dados Produto2
    if Entidade.CodigoPRD2 > 0 then
    Begin
      if Produto1.CodigoPRD <> Entidade.CodigoPRD2 then
      Begin
        Produto1.Close;
        Produto1.ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD2;
        Produto1.Open;
      end;
      sDescricao := PreencheZero(7,Entidade.CodigoPRD2)+'-'+Trim(Produto1.Descricao+' '+Produto1.Caracteristica);
      if Length(sDescricao) <= zrlProduto2.Width then
        zrlProduto2.Caption := sDescricao
      else
        zrlProduto2.Caption := Copy(sDescricao,1,zrlProduto2.Width);

      if Length(Produto1.Detalhe) <= zrlDetalhe2.Width then
        zrlDetalhe2.Caption := Produto1.Detalhe
      else
        zrlDetalhe2.Caption := Copy(Produto1.Detalhe,1,zrlDetalhe2.Width);

      if Entidade.PrecoPRD2 > 0 then
      Begin
        Close;
        SQL.Text := 'SELECT IPV_PRECO_SUGERIDO '+
          ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
          ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD2);
        Open;
        zrlPrecoSugestao2.Caption := 'Sugestao: R$ '+Format('%.2f',[FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
        zrlPrecoVendido2.Caption  := 'Vendido: R$ '+Format('%.2f',[Entidade.PrecoPRD2]);
      end
      else
      Begin
        zrlPrecoSugestao2.Caption := '';
        zrlPrecoVendido2.Caption := '';
      end;
    end
    else
    Begin
      zrlProduto2.Caption := '';
      zrlDetalhe2.Caption := '';

      zrlPrecoSugestao2.Caption := '';
      zrlPrecoVendido2.Caption := '';
    end;

    //Dados Produto3
    if Entidade.CodigoPRD3 > 0 then
    Begin
      if Produto1.CodigoPRD <> Entidade.CodigoPRD3 then
      Begin
        Produto1.Close;
        Produto1.ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD3;
        Produto1.Open;
      end;
      sDescricao := PreencheZero(7,Entidade.CodigoPRD3)+'-'+Trim(Produto1.Descricao+' '+Produto1.Caracteristica);
      if Length(sDescricao) <= zrlProduto3.Width then
        zrlProduto3.Caption := sDescricao
      else
        zrlProduto3.Caption := Copy(sDescricao,1,zrlProduto3.Width);

      if Length(Produto1.Detalhe) <= zrlDetalhe3.Width then
        zrlDetalhe3.Caption := Produto1.Detalhe
      else
        zrlDetalhe3.Caption := Copy(Produto1.Detalhe,1,zrlDetalhe3.Width);

      if Entidade.PrecoPRD3 > 0 then
      Begin
        Close;
        SQL.Text := 'SELECT IPV_PRECO_SUGERIDO '+
          ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
          ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD3);
        Open;
        zrlPrecoSugestao3.Caption := 'Sugestao: R$ '+Format('%.2f',[FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
        zrlPrecoVendido3.Caption  := 'Vendido: R$ '+Format('%.2f',[Entidade.PrecoPRD3]);
      end
      else
      Begin
        zrlPrecoSugestao3.Caption := '';
        zrlPrecoVendido3.Caption := '';
      end;
    end
    else
    Begin
      zrlProduto3.Caption := '';
      zrlDetalhe3.Caption := '';

      zrlPrecoSugestao3.Caption := '';
      zrlPrecoVendido3.Caption := '';
    end;

    if Entidade.CodigoTRC > 0 then
    Begin
      Close;
      SQL.Text := 'SELECT TRC_TIPO_PAG,AGF_CODIGO,CCX_CODIGO,TRC_VENCIMENTO,TRC_VALOR,TRC_VALOR_PAGO,TRC_SITUACAO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
        ' AND TRC_CODIGO='+IntToStr(Entidade.CodigoTRC);
      Open;
      zrlTitulo.Caption := 'TipoPag:'+DM.SelecionaParametro(FieldByName('TRC_TIPO_PAG').AsInteger)+' '+
                            'AgFin:'+DM.SelecionaAgenteFinanceiro(FieldByName('AGF_CODIGO').AsInteger)+' '+
                            'CCX:'+DM.SelecionaContaDeCaixa(FieldByName('CCX_CODIGO').AsInteger)+' '+
                            'Vencimento:'+FieldByName('TRC_VENCIMENTO').asString+' '+
                            'Valor:'+Format('%.2f',[FieldByName('TRC_VALOR').asFloat]);
      if FieldByName('TRC_SITUACAO').asInteger = 0 then
      Begin
        zrlComJuros.Caption := Format('%.2f',[FieldByName('TRC_VALOR').asFloat+
                                             (FieldByName('TRC_VALOR').asFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-FieldByName('TRC_VENCIMENTO').asDateTime)/3000))]);
        zrlRecebido.Caption := 'Recebido: R$ '+Format('%.2f',[Entidade.ValorTRC]);
      end
      else
      Begin
        zrlComJuros.Caption := 'Recebido:'+Format('%.2f',[FieldByName('TRC_VALOR_PAGO').asFloat]);
        zrlRecebido.Caption := '';
      end;
    end
    else
    Begin
      zrlTitulo.Caption := '';
      zrlComJuros.Caption := '';
      zrlRecebido.Caption := '';
    end;
  end;

  with Produto1 do
  Begin
    if Entidade.Tipo = 0 then //Dev. Total
    Begin
      DM.qr_consultas2.Close;
      DM.qr_consultas2.SQL.Text := 'SELECT PRD_CODIGO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      DM.qr_consultas2.Open;
      i := 0;
      while not DM.qr_consultas2.Eof do
      Begin
        if CodigoPRD <> DM.qr_consultas2.FieldByName('PRD_CODIGO').asInteger then
        Begin
          Close;
          ParamByName('PRD_CODIGO').asInteger := DM.qr_consultas2.FieldByName('PRD_CODIGO').asInteger;
          Open;
        end;
        sDescricao := PreencheZero(7,Entidade.CodigoPRD1)+'-'+Trim(Descricao+' '+Caracteristica);
        if i = 0 then
        Begin
          if Length(sDescricao) <= zrlProduto1.Width then
            zrlProduto0.Caption := sDescricao
          else
            zrlProduto0.Caption := Copy(sDescricao,1,zrlProduto1.Width);
        end
        else if i = 1 then
        Begin
          if Length(sDescricao) <= zrlProduto1.Width then
            zrlProduto1.Caption := sDescricao
          else
            zrlProduto1.Caption := Copy(sDescricao,1,zrlProduto1.Width);
        end
        else if i = 2 then
        Begin
          if Length(sDescricao) <= zrlProduto1.Width then
            zrlProduto2.Caption := sDescricao
          else
            zrlProduto2.Caption := Copy(sDescricao,1,zrlProduto1.Width);
        end
        else if i = 3 then
        Begin
          if Length(sDescricao) <= zrlProduto1.Width then
            zrlProduto3.Caption := sDescricao
          else
            zrlProduto3.Caption := Copy(sDescricao,1,zrlProduto1.Width);
        end
        else if i = 4 then
        Begin
          if Length(sDescricao) <= zrlProduto1.Width then
            zrlProduto4.Caption := sDescricao
          else
            zrlProduto4.Caption := Copy(sDescricao,1,zrlProduto1.Width);
        end
        else if i = 5 then
        Begin
          if Length(sDescricao) <= zrlProduto1.Width then
            zrlTitulo.Caption := sDescricao
          else
            zrlTitulo.Caption := Copy(sDescricao,1,zrlProduto1.Width);
        end
        else if i = 6 then
        Begin
          if Length(sDescricao) <= zrlProduto1.Width then
            zrlProduto6.Caption := sDescricao
          else
            zrlProduto6.Caption := Copy(sDescricao,1,zrlProduto1.Width);
        end
        else
          zrlProduto6.Caption := zrlProduto6.Caption + '('+IntToStr(CodigoPRD)+')'; 
        Inc(i);
        DM.qr_consultas2.Next;
      end;
    end;
  end;

  if Entidade.Situacao >= 2 then //Autorizado ou Processado
  Begin
    if Entidade.CodigoUSULiberou > 0 then
      zrlUsuarioLiberou.Caption := UpperCase(DM.NomeUsuario(Entidade.CodigoUSULiberou))
    else
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT USU_CODIGO '+
          ' FROM PENDENCIA_CPD '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PEN_CODIGO='+IntToStr(Entidade.CodigoPEN);
        Open;
        if IsEmpty then
          zrlUsuarioLiberou.Caption := 'REGISTRO NAO ENCONTRADO'
        else
          zrlUsuarioLiberou.Caption := UpperCase(DM.NomeUsuario(FieldByName('USU_CODIGO').asInteger));
      end;
    end;
  end
  else
  Begin
    zrlDescUsuarioLiberou.Caption := '';
    zrlUsuarioLiberou.Caption := '';
  end;
end;

procedure Trpt_Pendencia.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
