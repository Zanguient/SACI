unit UAtendimentosPorVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, 
  Atendimento_por_Vendedor;

type
  Trpt_AtendimentosPorVendedor = class(TForm)
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
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRDBText3: TSZRDBText;
    zrlUsuario: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    Atendimento_por_Vendedor1: TAtendimento_por_Vendedor;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlVendas: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlConvergencia: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrgGrupoData: TSZRGroup;
    SZRLabel5: TSZRLabel;
    SZRDBText2: TSZRDBText;
    zrbRodapeGrupoDia: TSZRBand;
    zrlAtendimentosDia: TSZRLabel;
    zrlVendasDia: TSZRLabel;
    zrlConvergenciaDia: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlbRodapeGrupoCNC: TSZRBand;
    zrlAtendimentosCNC: TSZRLabel;
    zrlVendasCNC: TSZRLabel;
    zrlConvergenciaCNC: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrgGrupoCNC: TSZRGroup;
    SZRLabel15: TSZRLabel;
    SZRBand1: TSZRBand;
    zrlAtendimentosTotal: TSZRLabel;
    zrlVendasTotal: TSZRLabel;
    zrlConvergenciaTotal: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    zrlCentro: TSZRLabel;
    SZRDBText3: TSZRDBText;
    zrlFiltros: TSZRLabel;
    SZRLabel7: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgGrupoDataBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrgGrupoCNCBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoDiaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrlbRodapeGrupoCNCBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    iAtendimentosDia, iAtendimentosCNC, iAtendimentosTotal, iVendasDia, iVendasCNC, iVendasTotal: integer;
  public
    Entidade: TAtendimento_por_Vendedor;
  end;

var
  rpt_AtendimentosPorVendedor: Trpt_AtendimentosPorVendedor;

implementation

uses UDM, Funcoes;

{$R *.DFM}

procedure Trpt_AtendimentosPorVendedor.FormCreate(Sender: TObject);
begin
  Entidade := Atendimento_por_Vendedor1;
  iAtendimentosDia   := 0;
  iAtendimentosCNC   := 0;
  iAtendimentosTotal := 0;
  iVendasDia   := 0;
  iVendasCNC   := 0;
  iVendasTotal := 0;
end;

procedure Trpt_AtendimentosPorVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_AtendimentosPorVendedor.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_AtendimentosPorVendedor.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption := EmpresaDesenvolvedora;
end;

procedure Trpt_AtendimentosPorVendedor.zrbDetalheBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
var
  iVendas: integer;
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT COUNT(DISTINCT CLI_CODIGO) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE P1.PDV_CODIGO=4 '+
      ' AND P1.PDV_DATA_HORA>="'+MesDia(Entidade.DataCadastro)+'" '+
      ' AND P1.PDV_DATA_HORA<"'+MesDia(Entidade.DataCadastro+1)+'" '+
      ' AND EXISTS (SELECT TOP 1 I1.PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE I1.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+
      ' AND I1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND I1.PDV_CODIGO=P1.PDV_CODIGO) ';
    Open;
    iVendas := FieldByName('TOTAL').asInteger;
    zrlVendas.Caption := IntToStr(iVendas);

    if Entidade.Atendimentos > 0 then
      zrlConvergencia.Caption := format('%.2f',[iVendas/Entidade.Atendimentos*100])
    else
      zrlConvergencia.Caption := '-';

    iAtendimentosDia   := iAtendimentosDia   + Entidade.Atendimentos;
    iAtendimentosCNC   := iAtendimentosCNC   + Entidade.Atendimentos;
    iAtendimentosTotal := iAtendimentosTotal + Entidade.Atendimentos;

    iVendasDia   := iVendasDia   + iVendas;
    iVendasCNC   := iVendasCNC   + iVendas;
    iVendasTotal := iVendasTotal + iVendas;
  end;
end;

procedure Trpt_AtendimentosPorVendedor.zrgGrupoDataBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  iAtendimentosDia   := 0;
  iVendasDia := 0;
end;

procedure Trpt_AtendimentosPorVendedor.zrgGrupoCNCBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  iAtendimentosCNC   := 0;
  iVendasCNC := 0;
end;

procedure Trpt_AtendimentosPorVendedor.zrbRodapeGrupoDiaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlAtendimentosDia.Caption := IntToStr(iAtendimentosDia);
  zrlVendasDia.Caption := IntToStr(iVendasDia);

  if iAtendimentosDia > 0 then
    zrlConvergenciaDia.Caption := format('%.2f',[iVendasDia/iAtendimentosDia*100])
  else
    zrlConvergenciaDia.Caption := '-';
end;

procedure Trpt_AtendimentosPorVendedor.zrlbRodapeGrupoCNCBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlAtendimentosCNC.Caption := IntToStr(iAtendimentosCNC);
  zrlVendasCNC.Caption := IntToStr(iVendasCNC);

  if iAtendimentosCNC > 0 then
    zrlConvergenciaCNC.Caption := format('%.2f',[iVendasCNC/iAtendimentosCNC*100])
  else
    zrlConvergenciaCNC.Caption := '-';
end;

procedure Trpt_AtendimentosPorVendedor.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlAtendimentosTotal.Caption := IntToStr(iAtendimentosTotal);
  zrlVendasTotal.Caption := IntToStr(iVendasTotal);

  if iAtendimentosTotal > 0 then
    zrlConvergenciaTotal.Caption := format('%.2f',[iVendasTotal/iAtendimentosTotal*100])
  else
    zrlConvergenciaTotal.Caption := '-';
end;

end.
