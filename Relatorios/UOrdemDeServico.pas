unit UOrdemDeServico;

{
  (Duas Vias - Loja/Cliente)
  Cadastro do Registro Imprimir Via para o Funcionario e o Cliente assinarem
  Loja guarda via até trocar pela via de Produto Entregue assinada pelo cliente

  (Duas Vias - Loja/Motorista)
  Enviar para o Depósito Imprimir Via para FuncionarioLoja, Motorista e o FuncionarioDeposito assinarem
  O Motorista devolve a via dele quando voltar à loja

  (Três Vias - Depósito ou Loja/Motorista/Assistência)
  Enviar para a Assistência Imprimir Via para Funcionario, Motorista e o FuncionarioAssistência assinarem
  O Motorista guarda sua via para sua segurança

  (Duas Vias - Deposito/Motorista)
  Devolver para a Loja Imprimir Via para FuncionarioDeposito, Motorista e o FuncionarioLoja assinarem
  Motorista guarda sua via para sua segurança

  (Duas Vias - Loja/Cliente)
  Entregar ao Cliente Imprimir Via para o Funcionario e o Cliente assinarem
  Loja guarda via
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Grupo,
  AssistenciaTecnica;

type
  Trpt_OrdemDeServico = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
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
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    zrlUsuario: TSZRLabel;
    SZRDBText3: TSZRDBText;
    AssistenciaTecnica1: TAssistenciaTecnica;
    SZRDBText4: TSZRDBText;
    ZRLabel10: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlSituacao: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlDataEmissao: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlNumeroNota: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlProduto: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlDepositoEnvia: TSZRLabel;
    zrlDepositoRecebe: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrlAssistenciaEnvia: TSZRLabel;
    zrlAssistenciaRetorna: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlDebositoDevolve: TSZRLabel;
    zrlLojaRecebe: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel28: TSZRLabel;
    zrlEntrega: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlCentroDeCusto: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel10: TSZRLabel;
    zrlOficina: TSZRLabel;
    zrlAssinaturaLinha1: TSZRLabel;
    zrlAssinaturaLinha2: TSZRLabel;
    zrlAssinatura1: TSZRLabel;
    zrlAssinatura2: TSZRLabel;
    zrlAssinaturaLinha3: TSZRLabel;
    zrlAssinatura3: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TAssistenciaTecnica;
  end;

var
  rpt_OrdemDeServico: Trpt_OrdemDeServico;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_OrdemDeServico.FormCreate(Sender: TObject);
begin
  Entidade := AssistenciaTecnica1;
end;

procedure Trpt_OrdemDeServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_OrdemDeServico.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_OrdemDeServico.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

procedure Trpt_OrdemDeServico.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  case Entidade.Situacao of
    0: Begin
         zrlSituacao.Caption := 'Recepcao';
         zrlAssinatura1.Caption := 'Loja';
         zrlAssinatura2.Caption := 'Cliente';
         zrlAssinatura3.Caption := '';
         zrlAssinaturaLinha3.Caption := '';
       end;
    1: Begin
         zrlSituacao.Caption := 'Enviado ao Deposito';
         zrlAssinatura1.Caption := 'Loja';
         zrlAssinatura2.Caption := 'Motorista';
         zrlAssinatura3.Caption := 'Deposito';
       end;
    2: Begin
         zrlSituacao.Caption := 'Recebido pelo Deposito';
         zrlAssinatura1.Caption := 'Loja';
         zrlAssinatura2.Caption := 'Motorista';
         zrlAssinatura3.Caption := 'Deposito';
       end;
    3: Begin
         zrlSituacao.Caption := 'Enviado Assistencia';
         zrlAssinatura1.Caption := 'Loja/Deposito';
         zrlAssinatura2.Caption := 'Motorista';
         zrlAssinatura3.Caption := 'Assistencia';
       end;
    4: Begin
         zrlSituacao.Caption := 'Retornou Assistência';
         zrlAssinatura1.Caption := 'Loja/Deposito';
         zrlAssinatura2.Caption := 'Motorista';
         zrlAssinatura3.Caption := 'Assistencia';
       end;
    5: Begin
         zrlSituacao.Caption := 'Devolvido pelo Deposito';
         zrlAssinatura1.Caption := 'Deposito';
         zrlAssinatura2.Caption := 'Motorista';
         zrlAssinatura3.Caption := 'Loja';
       end;
    6: Begin
         zrlSituacao.Caption := 'Pronto para Entrega';
         zrlAssinatura1.Caption := 'Loja';
         zrlAssinatura2.Caption := 'Cliente';
         zrlAssinatura3.Caption := '';
         zrlAssinaturaLinha3.Caption := '';
       end;
    7: Begin
         zrlSituacao.Caption := 'Entregue';
         zrlAssinatura1.Caption := 'Loja';
         zrlAssinatura2.Caption := 'Cliente';         
         zrlAssinatura3.Caption := '';
         zrlAssinaturaLinha3.Caption := '';
       end;
  end;

  with DM.QR_Consultas do
  Begin
    //Centro de Custo
    Close;
    SQL.Text := 'SELECT CNC_RZ_SOCIAL '+
      ' FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC);
    Open;
    zrlCentroDeCusto.Caption := FieldByName('CNC_RZ_SOCIAL').asString;

    //Autorizada
    zrlOficina.Caption := '';
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM AUTORIZADA '+
      ' WHERE AUT_CODIGO='+IntToStr(Entidade.CodigoAUT);
    Open;
    if not isEmpty then
      zrlOficina.Caption := FieldByName('AUT_NOME').asString+' '+
                            Trim(DM.SelecionaParametro(FieldByName('AUT_LOGRADOURO').asInteger)+' '+
                                 FieldByName('AUT_ENDERECO').asString+' '+
                                 FieldByName('AUT_BAIRRO').asString+' '+
                                 FieldByName('AUT_CIDADE').asString+' '+
                                 FieldByName('AUT_UF').asString+
                                 ' FONE:'+FieldByName('AUT_FONE').asString);

    //Pedido de Venda
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
    Open;
    zrlNumeroNota.Caption := FieldByName('PDV_NOTA_FISCAL').asString;
    if FieldByName('PDV_DT_EMISSAO_VENDA').asDateTime > 0 then
      zrlDataEmissao.Caption := FieldByName('PDV_DT_EMISSAO_VENDA').asString
    else
      zrlDataEmissao.Caption := FieldByName('PDV_DT_ENTREGA').asString;

    //Cliente
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.ClienteCNC)+
      ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI);
    Open;
    zrlCliente.Caption := FieldByName('CLI_RZ_SOCIAL').asString+' ('+IntToStr(Entidade.ClienteCNC)+'-'+IntToStr(Entidade.CodigoCLI)+')';

    //Produto
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
    Open;
    zrlProduto.Caption := Trim(FieldByName('PRD_DESCRICAO').asString+' '+FieldByName('PRD_CARACTERISTICA').asString)+' ('+IntToStr(Entidade.CodigoPRD)+')';
  end;

  //Datas
  if Entidade.DataDepositoEnviado > 0 then
    zrlDepositoEnvia.Caption := FormatDateTime('DD/MM/YYYY HH:MM',Entidade.DataDepositoEnviado)
  else
    zrlDepositoEnvia.Caption := '';
  if Entidade.DataDepositoRecebido > 0 then
    zrlDepositoRecebe.Caption := FormatDateTime('DD/MM/YYYY HH:MM',Entidade.DataDepositoRecebido)
  else
    zrlDepositoRecebe.Caption := '';
  if Entidade.DataAssistenciaEnviado > 0 then
    zrlAssistenciaEnvia.Caption := FormatDateTime('DD/MM/YYYY HH:MM',Entidade.DataAssistenciaEnviado)
  else
    zrlAssistenciaEnvia.Caption := '';
  if Entidade.DataAssistenciaRetornado > 0 then
    zrlAssistenciaRetorna.Caption := FormatDateTime('DD/MM/YYYY HH:MM',Entidade.DataAssistenciaRetornado)
  else
    zrlAssistenciaRetorna.Caption := '';
  if Entidade.DataDepositoDevolvido > 0 then
    zrlDebositoDevolve.Caption := FormatDateTime('DD/MM/YYYY HH:MM',Entidade.DataDepositoDevolvido)
  else
    zrlDebositoDevolve.Caption := '';
  if Entidade.DataLojaRecebido > 0 then
    zrlLojaRecebe.Caption := FormatDateTime('DD/MM/YYYY HH:MM',Entidade.DataLojaRecebido)
  else
    zrlLojaRecebe.Caption := '';
  if Entidade.DataEntrega > 0 then
    zrlEntrega.Caption := FormatDateTime('DD/MM/YYYY HH:MM',Entidade.DataEntrega)
  else
    zrlEntrega.Caption := '';
end;

end.
