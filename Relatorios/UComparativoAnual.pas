unit UComparativoAnual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,DateUtils,
  Item_Pedido_Venda, CentroCusto, Item_de_Estoque, Item_Pedido_Compra,
  Produto, Configuracao;

type
  Trpt_ComparativoAnual = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    zrlDescricao: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlNomeDaEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    zrlDescProduto: TSZRLabel;
    zrlUsuario: TSZRLabel;
    Produto1: TProduto;
    SZRLabel1: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zlrFiltros: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel11: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrbSumario: TSZRBand;
    zrlQtdAnteriorTotal: TSZRLabel;
    zrlQtdAtualTotal: TSZRLabel;
    zrlValorAtualTotal: TSZRLabel;
    zrlValorAnteriorTotal: TSZRLabel;
    zrlDiferencaTotal: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlDescQuantidade: TSZRLabel;
    zrbGrupoCNC: TSZRGroup;
    zrlCentroDeCusto: TSZRLabel;
    zrbRodapeGrupoCNC: TSZRBand;
    zrlQtdAnteriorCNC: TSZRLabel;
    zrlQtdAtualCNC: TSZRLabel;
    zrlValorAtualCNC: TSZRLabel;
    zrlValorAnteriorCNC: TSZRLabel;
    zrlDiferencaCNC: TSZRLabel;
    zrlLinhaPequena: TSZRLabel;
    zrlCentroDeCusto2: TSZRLabel;
    zrlLinhaDupla: TSZRLabel;
    zrbGrupoPRD: TSZRGroup;
    zrbRodapeGrupoPRD: TSZRBand;
    zrlValorAtual: TSZRLabel;
    zrlQtdAnterior: TSZRLabel;
    zrlDiferenca: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlQtdAtual: TSZRLabel;
    zrlValorAnterior: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    Configuracao1: TConfiguracao;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCNCBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoPRDBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoPRDBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoCNCBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
  public
    Entidade : TProduto;
    vQtdAnterior, vQtdAtual,
      vQtdAnteriorCNC, vValorAnteriorCNC, vQtdAtualCNC, vValorAtualCNC,
      vQtdAnteriorTotal, vValorAnteriorTotal, vQtdAtualTotal, vValorAtualTotal:Double;
  end;

var
  rpt_ComparativoAnual: Trpt_ComparativoAnual;

implementation

uses UDM, Funcoes, UfMxSProdutoData;

{$R *.DFM}

procedure Trpt_ComparativoAnual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := caFree;
end;

procedure Trpt_ComparativoAnual.FormCreate(Sender: TObject);
begin
  Entidade := Produto1;
  zrlProduto.WordWrap := False;

  zrbDetalhe.Height := 0;
  zrbGrupoPRD.Height := 0;

  vQtdAnteriorTotal   := 0;
  vValorAnteriorTotal := 0;
  vQtdAtualTotal      := 0;
  vValorAtualTotal    := 0;
end;

procedure Trpt_ComparativoAnual.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vQtdAtual      := vQtdAtual    + Arredonda(Entidade.FieldByName('QTD').asFloat);
  vQtdAnterior   := vQtdAnterior + Arredonda(Entidade.FieldByName('QTD2').asFloat);
end;

procedure Trpt_ComparativoAnual.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeDaEmpresa.Caption := DM.Configuracao1.LojaNome;
  ZRLabel1.Caption     := DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ComparativoAnual.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_ComparativoAnual.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlQtdAnteriorTotal.Caption   := Format('%.2f',[vQtdAnteriorTotal]);
  zrlValorAnteriorTotal.Caption := Format('%.2f',[vValorAnteriorTotal]);

  zrlQtdAtualTotal.Caption   := Format('%.2f',[vQtdAtualTotal]);
  zrlValorAtualTotal.Caption := Format('%.2f',[vValorAtualTotal]);

  if (StrToFloat(zrlValorAtualTotal.Caption) > 0) and
     (StrToFloat(zrlValorAnteriorTotal.Caption) > 0) then
    zrlDiferencaTotal.Caption := Format('%.2f',[(StrToFloat(zrlValorAtualTotal.Caption)/StrToFloat(zrlValorAnteriorTotal.Caption)*100)-100])
  else
    zrlDiferencaTotal.Caption := '-';
end;

procedure Trpt_ComparativoAnual.zrbGrupoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vQtdAnteriorCNC := 0;
  vValorAnteriorCNC := 0;
  vQtdAtualCNC := 0;
  vValorAtualCNC := 0;

  with CentroCusto1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC; //Centro do Pedido
    Open;
    zrlCentroDeCusto.Caption := RazaoSocial;
    zrlCentroDeCusto2.Caption := RazaoSocial;
  end;
end;

procedure Trpt_ComparativoAnual.zrbRodapeGrupoPRDBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
var
  vValor, vDesconto: Double;
begin
  //Desconto de A Vista
  with Configuracao1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.CodigoCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger  := Entidade.CodigoCNC;
      Open;
    end;
    vDesconto := FieldByName('CNF_JUR_ESP').asFloat;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PRD_PRECO_VENDA AS VALOR '+
      ' FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
    Open;
    vValor := FieldByName('VALOR').asFloat;

    vValor := Arredonda(vValor - vValor*vDesconto/100);
  end;

  if DM.Configuracao1.Empresa = empEletro then
    zrlProduto.Caption:=Produto1.Descricao+' '+Produto1.Caracteristica+' '+Produto1.Referencia+' '+Produto1.Marca+' (R$'+Format('%.2f',[vValor])+')'
  else
    zrlProduto.Caption:=Produto1.Descricao+' '+Produto1.Referencia+' '+Produto1.Marca+' (R$'+Format('%.2f',[vValor])+')';

  vQtdAtualCNC      := vQtdAtualCNC      + vQtdAtual;
  vValorAtualCNC    := vValorAtualCNC    + Arredonda(vQtdAtual*Arredonda(vValor));

  vQtdAtualTotal      := vQtdAtualTotal      + vQtdAtual;
  vValorAtualTotal    := vValorAtualTotal    + Arredonda(vQtdAtual*Arredonda(vValor));

  vQtdAnteriorCNC   := vQtdAnteriorCNC   + vQtdAnterior;
  vValorAnteriorCNC := vValorAnteriorCNC + Arredonda(vQtdAnterior*Arredonda(vValor));

  vQtdAnteriorTotal   := vQtdAnteriorTotal   + vQtdAnterior;
  vValorAnteriorTotal := vValorAnteriorTotal + Arredonda(vQtdAnterior*Arredonda(vValor));

  zrlQtdAtual.Caption   := Format('%.2f',[vQtdAtual]);
  zrlValorAtual.Caption := Format('%.2f',[vQtdAtual*Arredonda(vValor)]);

  zrlQtdAnterior.Caption   := Format('%.2f',[vQtdAnterior]);
  zrlValorAnterior.Caption := Format('%.2f',[vQtdAnterior*Arredonda(vValor)]);

  if (StrToFloat(zrlValorAtual.Caption) > 0) and
     (StrToFloat(zrlValorAnterior.Caption) > 0) then
    zrlDiferenca.Caption := Format('%.2f',[(StrToFloat(zrlValorAtual.Caption)/StrToFloat(zrlValorAnterior.Caption)*100)-100])
  else
    zrlDiferenca.Caption := '-';
end;

procedure Trpt_ComparativoAnual.zrbGrupoPRDBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vQtdAtual    := 0;
  vQtdAnterior := 0;
end;

procedure Trpt_ComparativoAnual.zrbRodapeGrupoCNCBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  zrlQtdAnteriorCNC.Caption   := Format('%.2f',[vQtdAnteriorCNC]);
  zrlValorAnteriorCNC.Caption := Format('%.2f',[vValorAnteriorCNC]);

  zrlQtdAtualCNC.Caption   := Format('%.2f',[vQtdAtualCNC]);
  zrlValorAtualCNC.Caption := Format('%.2f',[vValorAtualCNC]);

  if (StrToFloat(zrlValorAtualCNC.Caption) > 0) and
     (StrToFloat(zrlValorAnteriorCNC.Caption) > 0) then
    zrlDiferencaCNC.Caption := Format('%.2f',[(StrToFloat(zrlValorAtualCNC.Caption)/StrToFloat(zrlValorAnteriorCNC.Caption)*100)-100])
  else
    zrlDiferencaCNC.Caption := '-';
end;

end.
