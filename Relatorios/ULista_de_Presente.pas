unit ULista_de_Presente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Classificacao_fiscal,
  Origem_Fiscal, Fornecedor, Produto, Item_Pedido_Compra, CentroCusto,
  Transportadora, Contato, ItemListaPresente, ListaPresente;

type
  Trpt_ListaPresente = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRGroup1: TSZRGroup;
    ZRLabel18: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRLabel16: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRDBText12: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel24: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrlUsuario: TSZRLabel;
    ListaPresente1: TListaPresente;
    ItemListaPesente1: TItemListaPesente;
    DSListaPresente: TDataSource;
    SZRDBText2: TSZRDBText;
    ListaPresente1CNC_CODIGO: TIntegerField;
    ListaPresente1LSP_CODIGO: TIntegerField;
    ListaPresente1USU_CODIGO: TIntegerField;
    ListaPresente1CLI_CODIGO: TIntegerField;
    ListaPresente1CNC_CLIENTE: TIntegerField;
    ListaPresente1LSP_DT_CADASTRO: TDateTimeField;
    ListaPresente1LSP_DT_ALTERADO: TDateTimeField;
    ListaPresente1LSP_DESCRICAO: TStringField;
    ListaPresente1LSP_SITUACAO: TIntegerField;
    ListaPresente1LSP_OBSERVACAO: TStringField;
    ListaPresente1Situacao: TStringField;
    SZRDBText12: TSZRDBText;
    zrCliente: TSZRLabel;
    Cliente1: TCliente;
    SZRDBText3: TSZRDBText;
    SZRDBText6: TSZRDBText;
    ZRLabel23: TSZRLabel;
    SZRFrameLine1: TSZRFrameLine;
    SZRFrameLine2: TSZRFrameLine;
    SZRLabel13: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText8: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrProduto: TSZRLabel;
    Produto1: TProduto;
    ItemListaPesente1situacao: TStringField;
    ItemListaPesente1ILP_CODIGO: TIntegerField;
    ItemListaPesente1CNC_CODIGO: TIntegerField;
    ItemListaPesente1LSP_CODIGO: TIntegerField;
    ItemListaPesente1PRD_CODIGO: TIntegerField;
    ItemListaPesente1ILP_DT_CADASTRO: TDateTimeField;
    ItemListaPesente1ILP_DT_ALTERADO: TDateTimeField;
    ItemListaPesente1ILP_QUANTIDADE_NECESSARIA: TIntegerField;
    ItemListaPesente1ILP_QUANTIDADE_COMPRADA: TIntegerField;
    ItemListaPesente1ILP_SITUACAO: TIntegerField;
    ItemListaPesente1ILP_OBSERVACAO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ListaPresente1CalcFields(DataSet: TDataSet);
    procedure zrClienteBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrProdutoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ItemListaPesente1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public

  end;

var
  rpt_ListaPresente: Trpt_ListaPresente;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_ListaPresente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 ListaPresente1.Active:=false;
end;

procedure Trpt_ListaPresente.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ListaPresente.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ListaPresente.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

procedure Trpt_ListaPresente.ListaPresente1CalcFields(DataSet: TDataSet);
begin
  Case ListaPresente1.FieldByname('LSP_SITUACAO').asInteger of
    0: ListaPresente1.FieldByName('Situacao').asString:='Lista Ativada';
    1: ListaPresente1.FieldByName('Situacao').asString:='Lista Desativada';
   End;
end;

procedure Trpt_ListaPresente.zrClienteBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
   With Cliente1 do
   begin
   Close;
   sql.Text:='SELECT * FROM CLIENTE WHERE CLI_CODIGO ='+inttostr(ListaPresente1.CodigoCLI);
   Open;
   end;
   zrCliente.Caption:=Cliente1.RazaoSocial;
end;

procedure Trpt_ListaPresente.zrProdutoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
   With Produto1 do
   begin
   Close;
   sql.Text:='SELECT * FROM PRODUTO WHERE PRD_CODIGO ='+inttostr(ItemListaPesente1.CodigoPRD);
   Open;
   end;
   zrProduto.Caption:=Produto1.Descricao;

end;

procedure Trpt_ListaPresente.ItemListaPesente1CalcFields(
  DataSet: TDataSet);
begin
Case ItemListaPesente1.FieldByname('ILP_SITUACAO').asInteger of
    0: ItemListaPesente1.FieldByName('Situacao').asString:='Ativada';
    1: ItemListaPesente1.FieldByName('Situacao').asString:='Desativada';
   End;
end;

end.














































































































































































































