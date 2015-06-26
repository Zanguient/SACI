unit uEstoqueDetalhado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  CentroCusto, Item_de_Estoque, Parametro;

type
  Trpt_estoqueDetalhado = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrlDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    zrbGrupo: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    ZRDBText1: TSZRDBText;
    Item_de_Estoque1: TItem_de_Estoque;
    Fornecedor1: TFornecedor;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrgTipoDetalhe: TSZRGroup;
    zrlDescEstoque: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgTipoDetalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private

  public
    Entidade: TItem_de_Estoque;
  end;

var
  rpt_estoqueDetalhado: Trpt_estoqueDetalhado;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_estoqueDetalhado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_estoqueDetalhado.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Estoque1;
  zrgTipoDetalhe.Height:=0;
  zrlDetalhe.Height:=0;
end;

procedure Trpt_estoqueDetalhado.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
{
  DoPrint:=True;
  if zrbGrupo.Height > 0 then
    zrlCentroQuantidade.Caption := Estoque + 'Saldo:'+format('%.2f',[SaldoEstoque])
  else
  Begin
    with Produto1 do
      zrlCentroQuantidade.Caption := PreencheZero(6, CodigoPRD)+' '+
                                     PreencheEspaco(zrlProduto.Width - 15, Trim(Descricao+' '+Caracteristica+' '+Referencia+' '+Marca+' '+Detalhe+' '+Local))+
                                     ' Saldo:'+PreencheEspacoEsq(8, format('%.2f',[SaldoEstoque]))+' '+
                                     PreencheEspaco(ZRDBText5.Width  , Trim(Unidade))+' '+
                                     PreencheEspacoEsq(zrlDeposito.Width, zrlDeposito.Caption)+' '+
                                     PreencheEspacoEsq(zrlPrecoUnitario.Width, zrlPrecoUnitario.Caption)+' '+
                                     PreencheEspacoEsq(zrlPreco.Width, zrlPreco.Caption);
  end;
  SaldoEstoque := 0;
}
end;

procedure Trpt_estoqueDetalhado.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  Desc: string;
begin
  with Entidade do
  begin
    if FieldByName('CNC').asInteger>0 then
    begin
      if DM.Configuracao1.Empresa = empLBM then
      Begin
        if FieldByName('CNC').asInteger = 1 then
          Desc := 'Matriz'
        else if FieldByName('CNC').asInteger = 2 then
          Desc := 'Filial'
        else if FieldByName('CNC').asInteger = 3 then
          Desc := 'Servico'
        else
          Desc := 'FIL'+PreencheZero(2,FieldByName('CNC').asInteger);
      end
      else if ((FieldByName('CNC').asInteger = 0) and
               (DM.Configuracao1.Empresa = empEletro)) or
              ((FieldByName('CNC').asInteger = 1) and
               (DM.Configuracao1.Empresa <> empEletro)) then
        Desc := 'CPD'
//      else if (DM.Configuracao1.Empresa = empEletro) then
//        Desc := Copy(CentroCusto1.RazaoSocial,1,5)
      else
        Desc := 'FIL'+PreencheZero(2,FieldByName('CNC').asInteger);
      zrlDescEstoque.Caption := zrlDescEstoque.Caption + Desc+':'+format('%.2f',[FieldByName('QTD').asfloat])+'; ';
    end;
  end;
end;

procedure Trpt_estoqueDetalhado.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_estoqueDetalhado.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Entidade do
    if DM.Configuracao1.Empresa = empEletro then
      zrlProduto.Caption := Trim(FieldByName('PRD_DESCRICAO').asString+' '+
                                 FieldByName('PRD_CARACTERISTICA').asString+' '+
                                 FieldByName('PRD_REFERENCIA').asString+' '+
                                 FieldByName('PRD_MARCA').asString+' '+
                                 FieldByName('PRD_DETALHE').asString+' '+
                                 FieldByName('PRD_LOCAL').asString)
    else
      zrlProduto.Caption := Trim(FieldByName('PRD_DESCRICAO').asString+' '+
                                 FieldByName('PRD_REFERENCIA').asString+' '+
                                 FieldByName('PRD_MARCA').asString+' '+
                                 FieldByName('PRD_DETALHE').asString+' '+
                                 FieldByName('PRD_LOCAL').asString);
end;

procedure Trpt_estoqueDetalhado.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_estoqueDetalhado.zrgTipoDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlDescEstoque.Caption := DM.SelecionaParametro(Entidade.FieldByName('IED_TIPO_ESTOQUE').asInteger);
end;

end.
