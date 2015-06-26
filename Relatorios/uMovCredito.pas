unit uMovCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, 
  CentroCusto, Parametro, Usuario,
  Movimento_Estoque_SN, Movimento_de_Credito;

type
  Trpt_MovCredito = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrlUsuario1: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRDBText1: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlTipo: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel12: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel14: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel10: TSZRLabel;
    zrlSaldo: TSZRLabel;
    SZRGroup1: TSZRGroup;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlUsuarioMov: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlCodigo: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlUsuario: TSZRLabel;
    Movimento_de_Credito1: TMovimento_de_Credito;
    Movimento_de_Credito1CLI_RZ_SOCIAL: TStringField;
    Movimento_de_Credito1CLI_CGC_CPF: TStringField;
    Movimento_de_Credito1CLI_FONE: TStringField;
    Movimento_de_Credito1CLI_NOME_FAN: TStringField;
    Movimento_de_Credito1MCR_CODIGO: TIntegerField;
    Movimento_de_Credito1CNC_CODIGO: TIntegerField;
    Movimento_de_Credito1CNC_CLIENTE: TIntegerField;
    Movimento_de_Credito1CLI_CODIGO: TIntegerField;
    Movimento_de_Credito1USU_CODIGO: TIntegerField;
    Movimento_de_Credito1MCR_DT_CADASTRO: TDateTimeField;
    Movimento_de_Credito1MCR_DT_ALTERADO: TDateTimeField;
    Movimento_de_Credito1MCR_DC: TStringField;
    Movimento_de_Credito1MCR_TIPO: TIntegerField;
    Movimento_de_Credito1MCR_VALOR_ANT: TFloatField;
    Movimento_de_Credito1MCR_VALOR: TFloatField;
    Movimento_de_Credito1CNC_ENT_CODIGO: TIntegerField;
    Movimento_de_Credito1MCR_ENT_CODIGO: TIntegerField;
    Movimento_de_Credito1MCR_SITUACAO: TIntegerField;
    Movimento_de_Credito1MCR_OBSERVACAO: TStringField;
    SZRDBText5: TSZRDBText;
    zrlObservacao: TSZRLabel;
    Movimento_de_Credito1MCR_MAQUINA: TIntegerField;
    Movimento_de_Credito1CNC_PEDIDO: TIntegerField;
    Movimento_de_Credito1PDV_CODIGO: TIntegerField;
    SZRLabel3: TSZRLabel;
    zrlPedido: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlUsuario1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TMovimento_de_Credito;

  end;

var
  rpt_MovCredito: Trpt_MovCredito;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_MovCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_MovCredito.FormCreate(Sender: TObject);
begin
  Entidade := Movimento_de_Credito1;
  if not Entidade.Active then
    Entidade.Open;
end;

procedure Trpt_MovCredito.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTipo.Caption := DM.SelecionaParametro(Entidade.Tipo);

  if Entidade.Dc = 'C' then
    zrlSaldo.Caption:=format('%.2f',[Entidade.ValorAnterior+Entidade.Valor])
  else
    zrlSaldo.Caption:=format('%.2f',[Entidade.ValorAnterior-Entidade.Valor]);

  //Definir Usuário
  zrlUsuarioMov.Caption := UpperCase(DM.NomeUsuario(Entidade.CodigoUSU));
  if Entidade.CodigoPDV > 0 then
    zrlPedido.Caption := PreencheZero(2,Entidade.PedidoCNC)+'-'+IntToStr(Entidade.CodigoPDV)
  else
    zrlPedido.Caption := '';

  zrlObservacao.Caption := 'Maquina: '+IntToStr(Entidade.MaquinaMCR)+' '+Entidade.Observacao;
end;

procedure Trpt_MovCredito.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_MovCredito.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    with CentroCusto1 do
    Begin
      if Entidade.CodigoCNC <> CentroCusto1.CodigoCNC then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
        Open;
      end;
      zrlCentroDeCusto.Caption := 'Centro de Custo: '+RazaoSocial;
    end;
  end
  else if Entidade.CodigoCNC = 1 then
    zrlCentroDeCusto.Caption := '*** Matriz'
  else
    zrlCentroDeCusto.Caption := '*** Filial '+IntToStr(Entidade.CodigoCNC);
end;

procedure Trpt_MovCredito.zrlUsuario1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

end.
