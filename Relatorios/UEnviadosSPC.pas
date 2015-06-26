unit UEnviadosSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Titulo_receber, Item_Pedido_Venda, Funcionario,
  Parametro, Pedido_de_Venda, Avalista, Informacoes;

type
  Trpt_EnviadosSPC = class(TForm)
    QuerySoma: TQuery;
    Pedido_de_Venda1: TPedido_de_Venda;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    QuerySomaSOMA: TFloatField;
    report: TSZReport;
    zrbRodapePagina: TSZRBand;
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
    zrbCabecalhoPagina: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel1: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    Titulo_receber2: TTitulo_receber;
    SZRLabel40: TSZRLabel;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Informacoes1: TInformacoes;
    Avalista1: TAvalista;
    Cliente1: TCliente;
    zrlDetalhe: TSZRBand;
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
    SZRLabel46: TSZRLabel;
    SZRLabel47: TSZRLabel;
    SZRLabel48: TSZRLabel;
    SZRLabel49: TSZRLabel;
    SZRLabel50: TSZRLabel;
    SZRLabel51: TSZRLabel;
    SZRLabel52: TSZRLabel;
    SZRLabel41: TSZRLabel;
    labFiador: TSZRLabel;
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
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
  rpt_EnviadosSPC: Trpt_EnviadosSPC;
  Imprimir:Boolean;

implementation
uses
 UDM, MxCobCobrador, Funcoes;

{$R *.DFM}

procedure Trpt_EnviadosSPC.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.Cidade;
  SZRLabel23.Caption:=IntToStr(DM.Configuracao1.EnviarSPC);
  SZRLabel32.Caption:=DM.Configuracao1.CodigoSPC;
  SZRLabel34.Caption:=DM.CentroCusto1.NomeFantasia;
end;


procedure Trpt_EnviadosSPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Trpt_EnviadosSPC.FormCreate(Sender: TObject);
begin
  Entidade := Cliente1;
end;

procedure Trpt_EnviadosSPC.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel20.Caption := Trim(DM.SelecionaParametro(Entidade.Logradouro)+' '+
                             Entidade.Endereco);

  SZRLabel42.Caption:=Entidade.Pai+' / '+Entidade.Mae;

  Titulo_receber2.Close;
  Titulo_receber2.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Titulo_receber2.ParamByName('CNC_EXTERNO').Value:=DM.CentroCusto1.FieldByName('CNC_EXTERNO').Value;
  Titulo_receber2.ParamByName('CLI_CODIGO').asInteger:=Entidade.CodigoCLI;
  Titulo_receber2.Open;
  SZRLabel45.Caption:=formatDateTime('dd/mm/yyyy',Titulo_receber2.Vencimento);
  SZRLabel49.Caption:=IntToStr(Trunc(DM.Configuracao1.Data)-Trunc(Titulo_receber2.Vencimento));
  SZRLabel51.Caption:=IntToStr(Titulo_receber2.CodigoPDV);

  Pedido_de_Venda1.Close;
  Pedido_de_Venda1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Pedido_de_Venda1.ParamByName('CNC_EXTERNO').Value:=DM.CentroCusto1.FieldByName('CNC_EXTERNO').Value;
  Pedido_de_Venda1.ParamByName('PDV_CODIGO').asInteger:=Titulo_receber2.CodigoPDV;
  Pedido_de_Venda1.Open;
  if Pedido_de_Venda1.DataHora > 0 then
    SZRLabel43.Caption:=formatDateTime('dd/mm/yyyy',Pedido_de_Venda1.DataHora)
  else
    SZRLabel43.Caption:='';

  QuerySoma.Close;
  QuerySoma.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  QuerySoma.ParamByName('CNC_EXTERNO').Value:=DM.CentroCusto1.FieldByName('CNC_EXTERNO').Value;
  QuerySoma.ParamByName('CLI_CODIGO').asInteger:=Entidade.CodigoCLI;
  QuerySoma.Open;
  SZRLabel50.Caption:=format('%.2f',[QuerySoma.FieldByName('SOMA').asFloat]);

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
        if not IsEmpty then
        Begin
          labFiador.Caption := PreencheEspaco(40,Nome)+' RG: '+PreencheEspacoEsq(12,CGFRG)+
            ' CPF: '+PreencheEspacoEsq(12,CGCCPF);
          if DataNascimento > 0 then
            labFiador.Caption := labFiador.Caption + ' DT Nasc: '+
              formatDateTime('DD/MM/YYYY',DataNascimento);
        end
        else
          labFiador.Caption := '';
      end;
    end;
  end;
end;

procedure Trpt_EnviadosSPC.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
