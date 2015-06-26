unit URelConsignacaoAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Variants, Titulo_receber,
  AgenteFin, Forma_de_Pagamento, Funcionario, Parametro, Cliente, Produto,
  Item_de_Consignacao, CentroCusto, consignacao;

type
  Trpt_URelConsignacaoAnalitico = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrlTituloRelatorio: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel5: TSZRLabel;
    zrbDetalhe: TSZRBand;
    ZRDBText10: TSZRDBText;
    zrlTotalItem: TSZRLabel;
    zrlbRodapePagina: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbConsignacao: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    zrbCabecalhoPedido: TSZRGroup;
    qConsignacao: TQuery;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRLabel14: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRGroup2: TSZRGroup;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrbVendedor: TSZRBand;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrbCNC: TSZRBand;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlValorItem: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlCliente: TSZRLabel;
    SZRLabel15: TSZRLabel;
    qVendedor: TQuery;
    SZRLabel5: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel21: TSZRLabel;
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrlbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbConsignacaoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbVendedorAfterPrint(Sender: TObject; Printed: Boolean);
    procedure zrbVendedorBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbCNCAfterPrint(Sender: TObject; Printed: Boolean);
    procedure zrbCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbConsignacaoAfterPrint(Sender: TObject; Printed: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    vTotVendedor, vTotCNC, vTotConsignacao: real;
  end;

var
  rpt_URelConsignacaoAnalitico: Trpt_URelConsignacaoAnalitico;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_URelConsignacaoAnalitico.zrbCabecalhoPaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_URelConsignacaoAnalitico.zrlbRodapePaginaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;
end;

procedure Trpt_URelConsignacaoAnalitico.zrbDetalheBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  vTotConsignacao := vTotConsignacao + (qConsignacao.FieldByName('ICS_QUANTIDADE').AsFloat * qConsignacao.FieldByName('ICS_VALOR').AsFloat);
  zrlValorItem.Caption := Format('%.2f',[qConsignacao.FieldByName('ICS_VALOR').AsFloat]);
  zrlTotalItem.Caption := Format('%.2f',[qConsignacao.FieldByName('ICS_QUANTIDADE').AsFloat * qConsignacao.FieldByName('ICS_VALOR').AsFloat]);
end;

procedure Trpt_URelConsignacaoAnalitico.SZRGroup2BeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlCliente.Caption := qConsignacao.FieldByName('CLI_CODIGO').AsString + '-' + qConsignacao.FieldByName('CLI_RZ_SOCIAL').AsString;
end;

procedure Trpt_URelConsignacaoAnalitico.zrbConsignacaoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  SZRLabel15.Caption := Format('%.2f',[vTotConsignacao]);
  vTotVendedor := vTotVendedor + vTotConsignacao;//qConsignacao.FieldByName('CSG_VALOR').AsFloat;
  vTotCNC := vTotCNC + vTotConsignacao;//qConsignacao.FieldByName('CSG_VALOR').AsFloat;
end;

procedure Trpt_URelConsignacaoAnalitico.FormCreate(Sender: TObject);
begin
  vTotVendedor := 0;
  vTotCNC := 0;
  vTotConsignacao := 0;
end;

procedure Trpt_URelConsignacaoAnalitico.zrbVendedorAfterPrint(
  Sender: TObject; Printed: Boolean);
begin
  vTotVendedor := 0;
end;

procedure Trpt_URelConsignacaoAnalitico.zrbVendedorBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  SZRLabel8.Caption := Format('%.2f',[qVendedor.FieldByName('TOTAL_VENDEDOR').AsFloat]);
end;

procedure Trpt_URelConsignacaoAnalitico.zrbCNCAfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  vTotCNC := 0;
end;

procedure Trpt_URelConsignacaoAnalitico.zrbCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel12.Caption := Format('%.2f',[vTotCNC]);
end;

procedure Trpt_URelConsignacaoAnalitico.SZRGroup1BeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  qVendedor.Close;
  qVendedor.ParamByName('FUN_CODIGO').AsInteger := qConsignacao.FieldByName('FUN_CODIGO').AsInteger;
  qVendedor.Open;

  SZRLabel21.Caption := Format('%.2f',[qVendedor.FieldByName('TOTAL_VENDEDOR').AsFloat]);
end;

procedure Trpt_URelConsignacaoAnalitico.zrbConsignacaoAfterPrint(
  Sender: TObject; Printed: Boolean);
begin
  vTotConsignacao := 0;
end;

end.
