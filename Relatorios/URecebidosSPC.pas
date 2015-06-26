unit URecebidosSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Titulo_receber, Item_Pedido_Venda, Funcionario,
  Parametro, Pedido_de_Venda, Informacoes, Avalista;

type
  Trpt_RecebidosSPC = class(TForm)
    Parametro1: TParametro;
    Pedido_de_Venda1: TPedido_de_Venda;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    report: TSZReport;
    ZRBand4: TSZRBand;
    ZRLabel4: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRSubDetailBand1: TSZRSubDetailBand;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel2: TSZRLabel;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel1: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    Titulo_receber2: TTitulo_receber;
    SZRLabel29: TSZRLabel;
    Informacoes1: TInformacoes;
    Avalista1: TAvalista;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Cliente1: TCliente;
    zrbDetalhe: TSZRBand;
    SZRDBText9: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRDBText12: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRLabel14: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText16: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRDBText13: TSZRDBText;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRDBText17: TSZRDBText;
    SZRLabel18: TSZRLabel;
    SZRDBText18: TSZRDBText;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRDBText19: TSZRDBText;
    SZRLabel28: TSZRLabel;
    SZRDBText20: TSZRDBText;
    SZRLabel37: TSZRLabel;
    SZRDBText21: TSZRDBText;
    SZRLabel26: TSZRLabel;
    SZRDBText11: TSZRDBText;
    SZRLabel20: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText23: TSZRDBText;
    SZRLabel35: TSZRLabel;
    SZRLabel36: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel43: TSZRLabel;
    SZRLabel44: TSZRLabel;
    SZRLabel45: TSZRLabel;
    SZRLabel47: TSZRLabel;
    SZRLabel50: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel40: TSZRLabel;
    labFiador: TSZRLabel;
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
{    procedure SZRSubDetailBand1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRGroup2AfterPrint(Sender: TObject; Printed: Boolean);}
  private
    { Private declarations }
  public
    Entidade: TCliente;
    UltPedido:Integer;
  end;

var
  rpt_RecebidosSPC: Trpt_RecebidosSPC;
  Imprimir:Boolean;

implementation
uses
 UDM, MxCobCobrador, Funcoes;

{$R *.DFM}

procedure Trpt_RecebidosSPC.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.Cidade;
  SZRLabel32.Caption:=DM.Configuracao1.CodigoSPC;
  SZRLabel34.Caption:=DM.CentroCusto1.NomeFantasia;
end;


procedure Trpt_RecebidosSPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Trpt_RecebidosSPC.FormCreate(Sender: TObject);
begin
  Entidade := Cliente1;
end;

procedure Trpt_RecebidosSPC.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.Logradouro > 0 then
  Begin
    Parametro1.Close;
    Parametro1.ParamByName('PAR_CODIGO').asInteger:= Entidade.Logradouro;
    Parametro1.Open;
    SZRLabel20.Caption:=Parametro1.Descricao+' '+Entidade.Endereco;
  end
  else
    SZRLabel20.Caption:=Entidade.Endereco;

  SZRLabel42.Caption:=Entidade.Pai+' / '+Entidade.Mae;

  Titulo_receber2.Close;
  Titulo_receber2.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  Titulo_receber2.ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
  Titulo_receber2.Open;
  SZRLabel45.Caption:=formatDateTime('dd/mm/yyyy',Titulo_receber2.Vencimento);
  SZRLabel23.Caption:=formatDateTime('dd/mm/yyyy',Titulo_receber2.Pagamento);
  SZRLabel50.Caption:=format('%.2f',[Titulo_receber2.ValorPG]);

  Pedido_de_Venda1.Close;
  Pedido_de_Venda1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Pedido_de_Venda1.ParamByName('PDV_CODIGO').asInteger:=Titulo_receber2.CodigoPDV;
  Pedido_de_Venda1.Open;
  if Pedido_de_Venda1.DataHora > 0 then
    SZRLabel43.Caption:=formatDateTime('dd/mm/yyyy',Pedido_de_Venda1.DataHora)
  else
    SZRLabel43.Caption:='';

  //Localizar Fiador
  with Informacoes1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda1.ClienteCNC;
    ParamByName('CLI_CODIGO').asInteger := Pedido_de_Venda1.CodigoCLI;
    Open;
    if not IsEmpty then
    Begin
      with Avalista1 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda1.ClienteCNC;
        ParamByName('AVL_CODIGO').asInteger := Informacoes1.CodigoAVL;
        Open;
        labFiador.Caption := PreencheEspaco(40,Nome)+' RG: '+PreencheEspacoEsq(12,CGFRG)+
          ' CPF: '+PreencheEspacoEsq(12,CGCCPF);
        if DataNascimento > 0 then
          labFiador.Caption := labFiador.Caption + ' DT Nasc: '+
            formatDateTime('DD/MM/YYYY',DataNascimento);
      end;
    end;
  end;
end;

procedure Trpt_RecebidosSPC.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
