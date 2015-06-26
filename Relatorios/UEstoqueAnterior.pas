unit UEstoqueAnterior;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Item_Pedido_Venda, CentroCusto, Item_de_Estoque, Item_Pedido_Compra,
  Produto, Movimento_Fisico, Movimento_Estoque_Comercial, Mov_Est_Fiscal,
  Parametro, Movimento_Estoque_SN, Fornecedor;

type
  Trpt_EstoqueAnterior = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
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
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    SZRLabel5: TSZRLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    zlrFiltros: TSZRLabel;
    Produto1: TProduto;
    zrlDescReferencia: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlFinal: TSZRLabel;
    SZRDBText2: TSZRDBText;
    zrbSumario: TSZRBand;
    SZRLabel8: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlCusto: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    zrlDescTotalGeral: TSZRLabel;
    zrbGrupoCodigoFOR: TSZRGroup;
    zrbRodapeGrupoCodigoFOR: TSZRBand;
    SZRLabel6: TSZRLabel;
    zrlTotalFornecedor: TSZRLabel;
    Fornecedor1: TFornecedor;
    zrlSubTotalQtd: TSZRLabel;
    zrlTotalQtd: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText3: TSZRDBText;
    zrlFornecedor: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlTotalItemCompra: TSZRLabel;
    zrlTotalGeralCompra: TSZRLabel;
    zrlTotalFornecedorCompra: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlCompra: TSZRLabel;
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoCodigoFORBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoCodigoFORBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    TotalRegistros : integer;
    vCustoFornecedor,vCompraFornecedor, vQtdFornecedor,vCustoGeral, vCompraGeral, vQtdGeral : Double;
  public
    Entidade : TProduto;
    DataINI : TDateTime;
    iCdCNC: integer;
    vSomenteCustoZero, vSomenteCompraZero: Boolean;
  end;

var
  rpt_EstoqueAnterior: Trpt_EstoqueAnterior;

implementation

uses UDM, Funcoes, MxSelEstoqueAnterior;

{$R *.DFM}

procedure Trpt_EstoqueAnterior.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_EstoqueAnterior.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_EstoqueAnterior.FormCreate(Sender: TObject);
begin
  Entidade := Produto1;
  TotalRegistros := 0;
  vQtdGeral := 0;
  vCustoGeral := 0;
  vCompraGeral := 0;
  DataINI := 0;
  iCdCNC := -1;
end;

procedure Trpt_EstoqueAnterior.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  CdPRD: integer;
  vEstoque, vCusto, vCompra: Double;
begin
  vEstoque := 0.0;
  CdPRD := Entidade.CodigoPRD;

  if fMxSelEstoqueAnterior.rdbEstoqueFisico.Checked then //Estoque Fisico
    vEstoque := SaldoAnteriorFisico(DM.QR_Comandos, iCdCNC, CdPRD, DataINI)
  else if fMxSelEstoqueAnterior.rdbEstoqueComercial.Checked then //Estoque Comercial
    vEstoque := SaldoAnteriorComercial(DM.QR_Comandos, iCdCNC, CdPRD, DataINI)
  else if fMxSelEstoqueAnterior.rdbEstoqueFiscal.Checked then //Estoque Fiscal
    vEstoque := SaldoAnteriorFiscal(DM.QR_Comandos, iCdCNC, CdPRD, DataINI)
  else if fMxSelEstoqueAnterior.rdbEstoqueLJ3.Checked then //Estoque LJ3
    vEstoque := SaldoAnteriorSN(DM.QR_Comandos, iCdCNC, CdPRD, DataINI)
  else if fMxSelEstoqueAnterior.rdbEstoqueLJ4.Checked then //Estoque LJ4
    vEstoque := SaldoAnteriorLJ4(DM.QR_Comandos, iCdCNC, CdPRD, DataINI);

  DoPrint := True;
  case fMxSelEstoqueAnterior.rdgEstoqueDisponivel.ItemIndex of
    0 : if not (vEstoque < 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    1 : if not (vEstoque = 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    2 : if not (vEstoque > 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    3 : if not (vEstoque <= 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    4 : if not (vEstoque >= 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    5 : if not (vEstoque <> 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
  end;

  zrlProduto.Caption := Entidade.Descricao;
  if DM.Configuracao1.Empresa <> empLBM then
    zrlFinal.Caption       := format('%.2f',[vEstoque])
  else //LBM
    zrlFinal.Caption       := IntToStr(Trunc(vEstoque));

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 CUS_VALOR_MEDIO AS CUSTO, CUS_VALOR_COMPRA AS COMPRA '+
      ' FROM CUSTO '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD)+
      ' AND CUS_DT_CADASTRO<="'+MesDia(DataINI+1)+'" '+
      ' ORDER BY CUS_DT_CADASTRO DESC ';
    Open;
    if IsEmpty then
    Begin
      // OS QUE NAO TEM CUSTO NESTA DATA OU ANTERIOR A ELA
      DoPrint := False;
      Exit;
    end
    else
    Begin
      vCompra := Arredonda(FieldByName('COMPRA').asFloat);
      vCusto  := Arredonda(FieldByName('CUSTO').asFloat);
    end;
  end;

  if (vSomenteCompraZero and
      (vCompra <> 0)) or
     (vSomenteCustoZero and
      (vCusto <> 0)) then
  Begin
    DoPrint := False;
    Exit;
  end;

  vQtdGeral   := vQtdGeral   + Arredonda(vEstoque);
  vQtdFornecedor   := vQtdFornecedor + Arredonda(vEstoque);

  if vCusto > 0 then
  Begin
    vCustoGeral := vCustoGeral + Arredonda(vEstoque*vCusto);
    vCustoFornecedor := vCustoFornecedor + Arredonda(vEstoque*vCusto);
    zrlCusto.Caption := format('%.2f',[vCusto]);
    zrlTotalItem.Caption := format('%.2f',[vEstoque*vCusto]);
  end
  else
  Begin
    zrlCusto.Caption := '-';
    zrlTotalItem.Caption := '-';
  end;

  if vCompra > 0 then
  Begin
    vCompraGeral := vCompraGeral + Arredonda(vEstoque*vCompra);
    vCompraFornecedor := vCompraFornecedor + Arredonda(vEstoque*vCompra);
    zrlCompra.Caption := format('%.2f',[vCompra]);
    zrlTotalItemCompra.Caption := format('%.2f',[vEstoque*vCompra]);
  end
  else
  Begin
    zrlCompra.Caption := '-';
    zrlTotalItemCompra.Caption := '-';
  end;

  inc(TotalRegistros);
end;

procedure Trpt_EstoqueAnterior.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if TotalRegistros > 0 then
    zrlTotalRegistros.Caption := IntToStr(TotalRegistros)
  else
    zrbSumario.Height := 0;

  zrlTotalQtd.Caption   := format('%.2f',[vQtdGeral]);
  zrlTotalGeral.Caption := format('%.2f',[vCustoGeral]);
  zrlTotalGeralCompra.Caption := format('%.2f',[vCompraGeral]);
end;

procedure Trpt_EstoqueAnterior.zrbRodapeGrupoCodigoFORBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  if zrbRodapeGrupoCodigoFOR.Height = 0 then
    Exit;

  DoPrint := True;
  case fMxSelEstoqueAnterior.rdgEstoqueDisponivel.ItemIndex of
    0 : if not (vQtdFornecedor < 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    1 : if not (vQtdFornecedor = 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    2 : if not (vQtdFornecedor > 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    3 : if not (vQtdFornecedor <= 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    4 : if not (vQtdFornecedor >= 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
    5 : if not (vQtdFornecedor <> 0) then
        Begin
          DoPrint := False;
          Exit;
        end;
  end;

  with Fornecedor1 do
  Begin
    if Entidade.CodigoFOR <> CodigoFOR then
    Begin
      Close;
      ParamByName('FOR_CODIGO').asInteger:=Entidade.CodigoFOR;
      Open;
    end;
    zrlFornecedor.Caption := RazaoSocial;
  end;

  zrlSubTotalQtd.Caption     := format('%.2f',[vQtdFornecedor]);
  zrlTotalFornecedor.Caption := format('%.2f',[vCustoFornecedor]);
  zrlTotalFornecedorCompra.Caption := format('%.2f',[vCompraFornecedor]);
end;

procedure Trpt_EstoqueAnterior.zrbGrupoCodigoFORBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  vQtdFornecedor := 0;
  vCustoFornecedor := 0;
  vCompraFornecedor := 0;
end;

procedure Trpt_EstoqueAnterior.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
