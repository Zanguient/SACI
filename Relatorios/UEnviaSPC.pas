unit UEnviaSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Avalista, funcoes,
  Informacoes, Pedido_de_Venda, Item_Pedido_Venda, Titulo_receber;

type
  Trpt_EnviaSPC = class(TForm)
    report: TSZReport;
    Titulo_receber1: TTitulo_receber;
    ZRBand4: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRSysData1: TSZRSysData;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    DSTitulo_receber1: TDataSource;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1PRD_DESCRICAO: TStringField;
    SZRSubDetailBand1: TSZRSubDetailBand;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText3: TSZRDBText;
    ZRBand2: TSZRBand;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel2: TSZRLabel;
    Query1: TQuery;
    Query1MAX: TIntegerField;
    Pedido_de_Venda1: TPedido_de_Venda;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    SZRLabel41: TSZRLabel;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRGroup3: TSZRGroup;
    SZRDBText9: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRDBText12: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRDBText14: TSZRDBText;
    SZRLabel14: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
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
    SZRGroup1: TSZRGroup;
    SZRLabel1: TSZRLabel;
    SZRDBText15: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRLabel40: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel8: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRDBText22: TSZRDBText;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    labFiador: TSZRLabel;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Informacoes1: TInformacoes;
    Avalista1: TAvalista;
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
{    procedure SZRSubDetailBand1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRGroup2AfterPrint(Sender: TObject; Printed: Boolean);}
  private
    { Private declarations }
  public
    { Public declarations }
    UltPedido:Integer;
  end;

var
  rpt_EnviaSPC: Trpt_EnviaSPC;
  Imprimir:Boolean;

implementation

uses UDM, MxCobCobrador;

{$R *.DFM}

procedure Trpt_EnviaSPC.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=Dm.Configuracao1.LojaNome;
end;

procedure Trpt_EnviaSPC.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;


procedure Trpt_EnviaSPC.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  ValorComJuros:Double;
begin
  ValorComJuros:=Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat+
  Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
  Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsDateTime)/3000);
  SZRLabel5.Caption:=Format('%.2f',[Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat]);
  if ValorComJuros >= Titulo_Receber1.FieldByname('TRC_VALOR').AsFloat then
    SZRLabel6.Caption:=Format('%.2f',[ValorComJuros])
  else
    SZRLabel6.Caption:='-';
  if Titulo_receber1.FieldByName('TRC_DTORIGINAL').AsDateTime > 0 then
    SZRLabel41.Caption := FormatDateTime('dd/mm/yyyy',Titulo_receber1.FieldByName('TRC_DTORIGINAL').AsDateTime);
end;

procedure Trpt_EnviaSPC.SZRGroup2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Pedido_de_Venda1.Close;
  Pedido_de_Venda1.ParamByName('CNC_CODIGO').asinteger:=Titulo_receber1.CodigoCNC;
  Pedido_de_Venda1.ParamByName('PDV_CODIGO').asInteger:=Titulo_receber1.CodigoPDV;
  Pedido_de_Venda1.Open;
  if not Pedido_de_Venda1.IsEmpty then
  Begin
    SZRLabel38.Caption:='Data/Hora:';
    SZRLabel39.Caption:=FormatDateTime('dd/mm/yyyy hh:mm',Pedido_de_Venda1.DataHora);
  end
  else
  Begin
    SZRLabel38.Caption:='';
    SZRLabel39.Caption:='';
  end;
end;


procedure Trpt_EnviaSPC.SZRGroup3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel20.Caption := Trim(DM.SelecionaParametro(Titulo_receber1.FieldByName('CLI_LOGRADOURO').asInteger)+' '+
                             Titulo_receber1.FieldByName('CLI_ENDERECO').asString);

  //Localizar Fiador
  with Informacoes1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Titulo_receber1.ClienteCNC;
    ParamByName('CLI_CODIGO').asInteger := Titulo_receber1.CodigoCLI;
    Open;
    if not IsEmpty then
    Begin
      with Avalista1 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Titulo_receber1.ClienteCNC;
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

procedure Trpt_EnviaSPC.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
