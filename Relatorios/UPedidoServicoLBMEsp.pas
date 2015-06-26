unit UPedidoServicoLBMEsp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZReport, ZRCtrls, Funcionario, Produto, DB, DBTables,
  SQuery, Forma_de_Pagamento, Parametro, AgenteFin,
  Cliente, Pedido_de_Venda, Item_Pedido_Venda,
  Detalhe_Venda, Contato;

type
  Trpt_PedidoServicoLBMEsp = class(TForm)
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
    ZRLabel4: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupoPDV: TSZRGroup;
    zrbRodapeGrupoPDV: TSZRBand;
    Funcionario1: TFuncionario;
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
    SZRLabel19: TSZRLabel;
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
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Detalhe_Venda1: TDetalhe_Venda;
    zrlDescAssinatura: TSZRLabel;
    SZRLabel57: TSZRLabel;
    zrlSituacao: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRDBText2: TSZRDBText;
    zrlDescContato: TSZRLabel;
    zrlContato: TSZRLabel;
    zrlDescIndicacao: TSZRLabel;
    zrlIndicacao: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlFone: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlPreco: TSZRLabel;
    zrlTecnico: TSZRLabel;
    Produto1: TProduto;
    Contato1: TContato;
    zrlDescDtAssinatura: TSZRLabel;
    zrlObservacao: TSZRLabel;
    zrlAtencao: TSZRLabel;
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
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vTotalPedido: Double;
  public
    Entidade: TItem_Pedido_Venda;
  end;

var
  rpt_PedidoServicoLBMEsp: Trpt_PedidoServicoLBMEsp;

implementation

uses UDM, Funcoes, Configuracao, CentroCusto;

{$R *.dfm}

procedure Trpt_PedidoServicoLBMEsp.zrbCabecalhoPaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
var
  sDadosEmpresa: string;
begin
  sDadosEmpresa := '';
  with DM.CentroCusto1 do
  Begin
    sDadosEmpresa := NomeFantasia + ' - ';
    with DM.Parametro1 do
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Logradouro;
      Open;
      if not IsEmpty then
        sDadosEmpresa := sDadosEmpresa + Descricao + ' ' + Endereco
      else
        sDadosEmpresa := sDadosEmpresa + Endereco;
    end;
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

procedure Trpt_PedidoServicoLBMEsp.zrbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_PedidoServicoLBMEsp.zrbGrupoPDVBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
var
  sTitulo, sCliente: string;
begin
  vTotalPedido := 0;

  //Previsão e Data de Entrega
  if Entidade.FieldByName('PDV_DT_PREVISAO').asDateTime > 0 then
    zrlDataPrevisao.Caption := formatDateTime('dd/mm/yyyy',Entidade.FieldByName('PDV_DT_PREVISAO').asDateTime)
  else
    zrlDataPrevisao.Caption := '';

  if Entidade.FieldByName('PDV_DT_ENTREGA').asDateTime > 0 then
    zrlDataEntrega.Caption := formatDateTime('dd/mm/yyyy hh:mm',Entidade.FieldByName('PDV_DT_ENTREGA').asDateTime)
  else
    zrlDataEntrega.Caption := '';

  //Dados do Cliente
  with Cliente1 do
  Begin
    if (CodigoCLI <> Entidade.FieldByName('CLI_CODIGO').asInteger) or
       (CodigoCNC <> Entidade.FieldByName('CNC_CLIENTE').asInteger) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger := Entidade.FieldByName('CLI_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByName('CNC_CLIENTE').asInteger;
      Open;
    end;
    sCliente := RazaoSocial + '('+IntToStr(CodigoCLI)+')';
    if Length(sCliente) > zrlCliente.Width then
      zrlCliente.Caption := Copy(sCliente,1,zrlCliente.Width)
    else
      zrlCliente.Caption := sCliente;
    with DM.Parametro1 do
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Logradouro;
      Open;
      if not IsEmpty then
        zrlEndereco.Caption := Descricao + ' ' + Endereco
      else
        zrlEndereco.Caption := Endereco;
    end;
    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + Bairro);
    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + Cidade)+'/'+Trim(Uf);
    zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' + CEP);
    zrlFone.Caption := Fone;
  end;

  //Contato
  with Contato1 do
  Begin
    Close;
    ParamByName('CNC_FOR').asInteger    := Entidade.FieldByName('CNC_CLIENTE').asInteger;
    ParamByName('CNT_CODIGO').asInteger := Entidade.FieldByName('CNT_CODIGO').asInteger;
    Open;
    zrlContato.Caption := '';
    while not Eof do
    Begin
      if zrlContato.Caption <> '' then
        zrlContato.Caption := zrlContato.Caption + ' | ';
      zrlContato.Caption := zrlContato.Caption + Nome;
      Next;
    end;
  end;

  //TipoPag
  with DM.Parametro1 do
  Begin
    if CodigoPAR <>Entidade.FieldByName('PDV_TIPO_PAG').asInteger then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Entidade.FieldByName('PDV_TIPO_PAG').asInteger;
      Open;
    end;
    zrlTipoPag.Caption := Descricao;
  end;

  //Forma de pagamento
  with Forma_de_Pagamento1 do
  Begin
    if CodigoFPG <> Entidade.FieldByName('FPG_CODIGO').asInteger then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger := Entidade.FieldByName('FPG_CODIGO').asInteger;
      Open;
    end;
    zrlFormaPag.Caption := Descricao;
  end;

  //Agente Financeiro
  with AgenteFin1 do
  Begin
    if CodigoAGF <> Entidade.FieldByName('AGF_CODIGO').asInteger then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger := Entidade.FieldByName('AGF_CODIGO').asInteger;
      Open;
    end;
    zrlAgenteFinanceiro.Caption := Descricao;
  end;

  zrlObservacao.Caption := '';
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

    if Meio > 0 then
    Begin
      with DM.Parametro1 do
      Begin
        if (not Active) or
           (CodigoPAR <> Meio) then
        Begin
          Close;
          ParamByName('PAR_CODIGO').asInteger := Meio;
          Open;
        end;
        if zrlIndicacao.Caption <> '' then
          zrlIndicacao.Caption := zrlIndicacao.Caption + ' | ';
        zrlIndicacao.Caption := zrlIndicacao.Caption + Descricao;
      end;
    end;
  end;

  zrlObservacao.Caption := Trim(Entidade.FieldByName('PDV_OBS').asString);

  sTitulo := '';
  if DM.Configuracao1.Empresa = empMotical then
    if (Entidade.FieldByName('PDV_TIPO_VENDA').asInteger <> 2) and //Remessa
       (Entidade.FieldByName('PDV_TITULO_GERADO').asInteger = 0) then
      sTitulo := ' S/TRC';

  case Entidade.FieldByName('PDV_SITUACAO').asInteger of
    -1: zrlSituacao.Caption:='RESERVA'+sTitulo;
   0,1: zrlSituacao.Caption:='RECEPCAO';
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
            zrlSituacao.Caption:='QUALIDADE'
          else
            zrlSituacao.Caption:='LABORATORIO';
        end;
     3: zrlSituacao.Caption:='PRONTO';
     4: zrlSituacao.Caption:='ENTREGUE'+sTitulo;
     5: zrlSituacao.Caption:='Cons. Fin.'+sTitulo;
     6: zrlSituacao.Caption:='CANCELADO'+sTitulo;
     7: zrlSituacao.Caption:='Cons. Canc.'+sTitulo;
     8: zrlSituacao.Caption:='DEVOLVIDO'+sTitulo;
     9: zrlSituacao.Caption:='Cons. Dev.'+sTitulo;
    10: zrlSituacao.Caption:='Canc.Não Apr.'+sTitulo;
    11: zrlSituacao.Caption:='FINALIZADO'+sTitulo;
  end;
end;

procedure Trpt_PedidoServicoLBMEsp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := CaFree;
end;

procedure Trpt_PedidoServicoLBMEsp.zrbRodapeGrupoPDVBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlTotalPedido.Caption := format('%.2f',[vTotalPedido]);
end;

procedure Trpt_PedidoServicoLBMEsp.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;
end;

procedure Trpt_PedidoServicoLBMEsp.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
    if CodigoPRD <> Entidade.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    if Entidade.Vinculo = 0 then
      zrlProduto.Caption := '*'   + Descricao + ' ' + Referencia + '('+IntToStr(CodigoPRD)+')' + Entidade.Observacao
    else if Entidade.Vinculo = -1 then
      zrlProduto.Caption := '---' + Descricao + ' ' + Referencia + '('+IntToStr(CodigoPRD)+')' + Entidade.Observacao
    else //Vinculado
      zrlProduto.Caption :=         Descricao + ' ' + Referencia + '('+IntToStr(CodigoPRD)+')' + Entidade.Observacao;
  end;

  zrlTecnico.Caption    := '';
  zrlQuantidade.Caption := format('%.2f',[Entidade.Quantidade]);
  if Entidade.Vinculo >= 0 then
  Begin
    zrlProduto.Width := 72;
    with Funcionario1 do
    Begin
      if CodigoFUN <> Entidade.CodigoFUN then
      Begin
        Close;
        ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
        Open;
      end;
      zrlTecnico.Caption := NomeFun;
    end;
  end
  else
    zrlProduto.Width := 114;

  if Entidade.PrecoDesc > 0 then
    zrlPreco.Caption := format('%.2f',[Entidade.Quantidade*Entidade.PrecoDesc])
  else
    zrlPreco.Caption := '-';

  vTotalPedido := vTotalPedido + Arredonda(Entidade.PrecoDesc*Entidade.Quantidade);
end;

end.
