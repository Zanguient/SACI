unit UPedidoServicoLBM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZReport, ZRCtrls, Funcionario, Produto, DB, DBTables,
  SQuery, Forma_de_Pagamento, Parametro, AgenteFin,
  Cliente, Pedido_de_Venda, Item_Pedido_Venda,
  Detalhe_Venda;

type
  Trpt_PedidoServicoLBM = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupoPDV: TSZRGroup;
    zrbRodapeGrupoPDV: TSZRBand;
    Funcionario1: TFuncionario;
    zrlFiltros: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel1: TSZRLabel;
    zrlDBDataCadastro: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlCliente: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlEndereco: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrlDataEntrega: TSZRLabel;
    zrlDataPrevisao: TSZRLabel;
    SZRLabel49: TSZRLabel;
    zrlTipoPag: TSZRLabel;
    SZRLabel52: TSZRLabel;
    zrlFormaPag: TSZRLabel;
    SZRLabel50: TSZRLabel;
    zrlAgenteFinanceiro: TSZRLabel;
    SZRLabel40: TSZRLabel;
    zrlTotalPedido: TSZRLabel;
    AgenteFin1: TAgenteFin;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    Cliente1: TCliente;
    SZRLabel9: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText4: TSZRDBText;
    Pedido_de_Venda1: TPedido_de_Venda;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    Detalhe_Venda1: TDetalhe_Venda;
    SZRLabel56: TSZRLabel;
    SZRLabel57: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrlProduto1: TSZRLabel;
    zrlProduto2: TSZRLabel;
    zrlProduto4: TSZRLabel;
    zrlProduto3: TSZRLabel;
    zrlProduto6: TSZRLabel;
    zrlProduto5: TSZRLabel;
    zrlQtdPrd1: TSZRLabel;
    zrlQtdPrd2: TSZRLabel;
    zrlQtdPrd4: TSZRLabel;
    zrlQtdPrd3: TSZRLabel;
    zrlQtdPrd6: TSZRLabel;
    zrlQtdPrd5: TSZRLabel;
    zrlTotalPRD1: TSZRLabel;
    zrlTotalPRD2: TSZRLabel;
    zrlTotalPRD4: TSZRLabel;
    zrlTotalPRD3: TSZRLabel;
    zrlTotalPRD6: TSZRLabel;
    zrlTotalPRD5: TSZRLabel;
    zrlServico1: TSZRLabel;
    zrlServico2: TSZRLabel;
    zrlServico4: TSZRLabel;
    zrlServico3: TSZRLabel;
    zrlServico6: TSZRLabel;
    zrlServico5: TSZRLabel;
    zrlQtdSer1: TSZRLabel;
    zrlQtdSer2: TSZRLabel;
    zrlQtdSer4: TSZRLabel;
    zrlQtdSer3: TSZRLabel;
    zrlQtdSer6: TSZRLabel;
    zrlQtdSer5: TSZRLabel;
    zrlTotalSER1: TSZRLabel;
    zrlTotalSER2: TSZRLabel;
    zrlTotalSER4: TSZRLabel;
    zrlTotalSER3: TSZRLabel;
    zrlTotalSER6: TSZRLabel;
    zrlTotalSER5: TSZRLabel;
    SZRLabel61: TSZRLabel;
    SZRLabel62: TSZRLabel;
    SZRLabel63: TSZRLabel;
    SZRLabel64: TSZRLabel;
    SZRLabel65: TSZRLabel;
    SZRLabel66: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRDBText2: TSZRDBText;
    zrlProduto7: TSZRLabel;
    zrlProduto8: TSZRLabel;
    zrlProduto10: TSZRLabel;
    zrlProduto9: TSZRLabel;
    zrlProduto12: TSZRLabel;
    zrlProduto11: TSZRLabel;
    zrlQtdPrd7: TSZRLabel;
    zrlQtdPrd8: TSZRLabel;
    zrlQtdPrd10: TSZRLabel;
    zrlQtdPrd9: TSZRLabel;
    zrlQtdPrd12: TSZRLabel;
    zrlQtdPrd11: TSZRLabel;
    zrlTotalPRD7: TSZRLabel;
    zrlTotalPRD8: TSZRLabel;
    zrlTotalPRD10: TSZRLabel;
    zrlTotalPRD9: TSZRLabel;
    zrlTotalPRD12: TSZRLabel;
    zrlTotalPRD11: TSZRLabel;
    zrlServico7: TSZRLabel;
    zrlServico8: TSZRLabel;
    zrlServico10: TSZRLabel;
    zrlServico9: TSZRLabel;
    zrlServico12: TSZRLabel;
    zrlServico11: TSZRLabel;
    zrlQtdSer7: TSZRLabel;
    zrlQtdSer8: TSZRLabel;
    zrlQtdSer10: TSZRLabel;
    zrlQtdSer9: TSZRLabel;
    zrlQtdSer12: TSZRLabel;
    zrlQtdSer11: TSZRLabel;
    zrlTotalSER7: TSZRLabel;
    zrlTotalSER8: TSZRLabel;
    zrlTotalSER10: TSZRLabel;
    zrlTotalSER9: TSZRLabel;
    zrlTotalSER12: TSZRLabel;
    zrlTotalSER11: TSZRLabel;
    SZRLabel54: TSZRLabel;
    SZRLabel55: TSZRLabel;
    SZRLabel58: TSZRLabel;
    SZRLabel59: TSZRLabel;
    SZRLabel60: TSZRLabel;
    SZRLabel67: TSZRLabel;
    zrlDescContato: TSZRLabel;
    zrlContato: TSZRLabel;
    zrlDescIndicacao: TSZRLabel;
    zrlIndicacao: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlFone: TSZRLabel;
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoPDVBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbRodapeGrupoPDVBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    vTotalPedido: Double;
  public
    Entidade: TPedido_de_Venda;
  end;

var
  rpt_PedidoServicoLBM: Trpt_PedidoServicoLBM;

implementation

uses UDM, Funcoes, Configuracao, CentroCusto;

{$R *.dfm}

procedure Trpt_PedidoServicoLBM.zrbCabecalhoPaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
var
  sDadosEmpresa: string;
begin
  sDadosEmpresa := '';
  with DM.CentroCusto1 do
  Begin
    sDadosEmpresa := NomeFantasia + ' - ';
    sDadosEmpresa := sDadosEmpresa + Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);
    sDadosEmpresa := sDadosEmpresa + ' ' + Bairro + ' CEP: ' + CEP;
    if (Trim(Fone) = Trim(Fax)) and
       (Trim(Fone) <> '') then
      sDadosEmpresa := sDadosEmpresa + ' ' + ' Fone/Fax: '+Fone
    else
    Begin
      if Trim(Fone) <> '' then
        sDadosEmpresa := sDadosEmpresa + ' ' + ' Fone: '+Fone;
      if Trim(Fax) <> '' then
        sDadosEmpresa := sDadosEmpresa + ' ' + ' Fax: '+Fax;
    end;
  end;
  zrlEmpresa.Caption := sDadosEmpresa;
end;

procedure Trpt_PedidoServicoLBM.zrbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

procedure Trpt_PedidoServicoLBM.zrbGrupoPDVBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
var
  i: integer;
  sTitulo, sDesco, sCliente: string;
begin
  vTotalPedido := 0;

  //Previsão e Data de Entrega
  if Entidade.DataPrevisao > 0 then
    zrlDataPrevisao.Caption := formatDateTime('dd/mm/yyyy',Entidade.DataPrevisao)
  else
    zrlDataPrevisao.Caption := '';

  if Entidade.DataEntrega > 0 then
    zrlDataEntrega.Caption := formatDateTime('dd/mm/yyyy hh:mm',Entidade.DataEntrega)
  else
    zrlDataEntrega.Caption := '';

  //Dados do Cliente
  with Cliente1 do
  Begin
    if (CodigoCLI <> Entidade.CodigoCLI) or
       (CodigoCNC <> Entidade.ClienteCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      Open;
    end;
    sCliente := RazaoSocial + '('+IntToStr(CodigoCLI)+')';
    if Length(sCliente) > zrlCliente.Width then
      zrlCliente.Caption := Copy(sCliente,1,zrlCliente.Width)
    else
      zrlCliente.Caption := sCliente;
    zrlEndereco.Caption := Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);
    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + Bairro);
    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + Cidade)+'/'+Trim(Uf);
    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + CEP);
    zrlFone.Caption := Fone;
  end;

  //TipoPag
  zrlTipoPag.Caption := DM.SelecionaParametro(Entidade.TipoPag);

  //Forma de pagamento
  with Forma_de_Pagamento1 do
  Begin
    if CodigoFPG <> Entidade.CodigoFPG then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger := Entidade.CodigoFPG;
      Open;
    end;
    zrlFormaPag.Caption := Descricao;
  end;

  //Agente Financeiro
  with AgenteFin1 do
  Begin
    if CodigoAGF <> Entidade.CodigoAGF then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger := Entidade.CodigoAGF;
      Open;
    end;
    zrlAgenteFinanceiro.Caption := Descricao;
  end;

  //Detalhes do Pedido
  with Detalhe_Venda1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Open;
    zrlIndicacao.Caption := '';
    if Indicacao1 > 0 then
    Begin
      with Funcionario1 do
      Begin
        if (CodigoFUN <> Indicacao1) then
        Begin
          Close;
          ParamByName('FUN_CODIGO').asInteger := Indicacao1;
          Open;
        end;
        zrlIndicacao.Caption := Apelido;
      end;
    end;
    if Indicacao2 > 0 then
    Begin
      with Funcionario1 do
      Begin
        if (CodigoFUN <> Indicacao2) then
        Begin
          Close;
          ParamByName('FUN_CODIGO').asInteger := Indicacao2;
          Open;
        end;
        zrlIndicacao.Caption := zrlIndicacao.Caption + ' / ' + Apelido;        
      end;
    end;
  end;

  sTitulo := '';
  if DM.Configuracao1.Empresa = empMotical then
    if (Entidade.TipoDeVenda <> 2) and //Remessa
       (Entidade.FieldByName('PDV_TITULO_GERADO').asInteger = 0) then
      sTitulo := ' S/TRC';

  case Entidade.Situacao of
    -1: zrlSituacao.Caption:='Reserva'+sTitulo;
   0,1: zrlSituacao.Caption:='Recepcao';
     2: with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT TOP 1 PRD_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA '+
            ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
            ' AND IPV_SITUACAO<>3 '+
            ' AND IPV_SERVICO=1 ';
          Open;
          if isEmpty then
            zrlSituacao.Caption:='Qualidade'
          else
            zrlSituacao.Caption:='Laboratorio';
        end;
     3: zrlSituacao.Caption:='Pronto p/Entrega';
     4: zrlSituacao.Caption:='Finalizada'+sTitulo;
     5: zrlSituacao.Caption:='Cons. Fin.'+sTitulo;
     6: zrlSituacao.Caption:='Cancelada'+sTitulo;
     7: zrlSituacao.Caption:='Cons. Canc.'+sTitulo;
     8: zrlSituacao.Caption:='Devolvida'+sTitulo;
     9: zrlSituacao.Caption:='Cons. Dev.'+sTitulo;
    10: zrlSituacao.Caption:='Canc.Não Apr.'+sTitulo;
    11: zrlSituacao.Caption:='Finalizado'+sTitulo;
  end;

  with Item_Pedido_Venda1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Open;
    i := 1;
    while not EOF do
    Begin
      sDesco := Observacao;

      vTotalPedido := vTotalPedido + Arredonda(Quantidade*Arredonda(PrecoDesc));
      case i of
        1: Begin
             zrlProduto1.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd1.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD1.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
        2: Begin
             zrlProduto2.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd2.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD2.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
        3: Begin
             zrlProduto3.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd3.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD3.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
        4: Begin
             zrlProduto4.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd4.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD4.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
        5: Begin
             zrlProduto5.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd5.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD5.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
        6: Begin
             zrlProduto6.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd6.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD6.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
        7: Begin
             zrlProduto7.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd7.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD7.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
        8: Begin
             zrlProduto8.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd8.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD8.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
        9: Begin
             zrlProduto9.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd9.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD9.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
       10: Begin
             zrlProduto10.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd10.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD10.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
       11: Begin
             zrlProduto11.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd11.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD11.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
       12: Begin
             zrlProduto12.Caption := IntToStr(Sequencia)+'('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd12.Caption := format('%.2f',[Quantidade]);
             zrlTotalPRD12.Caption := format('%.2f',[Quantidade*Arredonda(PrecoDesc)]);
           end;
      end;
      inc(i);
      Next;
    end;
  end;

  with Item_Pedido_Venda2 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Open;
    i := 1;
    while not EOF do
    Begin
      sDesco := Observacao;
      vTotalPedido := vTotalPedido + Arredonda(Quantidade*PrecoDesc);
      case i of
        1: Begin
             zrlServico1.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER1.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER1.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
        2: Begin
             zrlServico2.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER2.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER2.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
        3: Begin
             zrlServico3.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER3.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER3.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
        4: Begin
             zrlServico4.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER4.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER4.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
        5: Begin
             zrlServico5.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER5.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER5.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
        6: Begin
             zrlServico6.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER6.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER6.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
        7: Begin
             zrlServico7.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER7.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER7.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
        8: Begin
             zrlServico8.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER8.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER8.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
        9: Begin
             zrlServico9.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER9.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER9.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
       10: Begin
             zrlServico10.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER10.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER10.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
       11: Begin
             zrlServico11.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER11.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER11.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
       12: Begin
             zrlServico12.Caption := '('+IntToStr(Vinculo)+')'+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER12.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER12.Caption := format('%.2f',[Quantidade*PrecoDesc]);
           end;
      end;
      inc(i);
      Next;
    end;
  end;
end;

procedure Trpt_PedidoServicoLBM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := CaFree;
end;

procedure Trpt_PedidoServicoLBM.zrbRodapeGrupoPDVBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlTotalPedido.Caption := format('%.2f',[vTotalPedido]);
end;

procedure Trpt_PedidoServicoLBM.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  zrbDetalhe.Height := 0;
end;

end.
