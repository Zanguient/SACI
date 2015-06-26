unit UCurvaABCProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, SubGrupo, Grupo, Fornecedor, Produto;

type
  Trpt_CurvaAbcProduto = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    Produto1: TProduto;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRLabel13: TSZRLabel;
    zrlPrecoVenda: TSZRLabel;
    SZRLabel1: TSZRLabel;
    ZRLabel3: TSZRLabel;
    zrgGrupo: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlDescSubGrupo: TSZRLabel;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    SZRLabel7: TSZRLabel;
    zrlSubGrupo: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel14: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlTotalVendas: TSZRLabel;
    zrlTotalQuantidade: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlAcumulado: TSZRLabel;
    zrlLucroBruto: TSZRLabel;
    Produto2: TProduto;
    zrlProduto: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrlUnidade: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlAcumuladoGeral: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zlrFiltros: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlTotalVendasGrupo: TSZRLabel;
    zrlTotalVendasGeral: TSZRLabel;
    zrlTotalQuantidadeGrupo: TSZRLabel;
    zrlTotalQuantidadeGeral: TSZRLabel;
    zrlLucroBrutoGrupo: TSZRLabel;
    zrlLucroBrutoGeral: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlAcumuladoGrupo: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalVendasGrupo, TotalQtdGrupo, TotalLucroGrupo,
      TotalVendasGeral, TotalQtdGeral, TotalLucroGeral,
      TotalAcumulo: Double;
  Posi: Integer;
  public
    { Public declarations }
  end;

var
  rpt_CurvaAbcProduto: Trpt_CurvaAbcProduto;
implementation
uses
 UDM, Funcoes, MxSelProdutoCurva;

{$R *.DFM}

procedure Trpt_CurvaAbcProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Active:=false;
  Action:=cafree;
end;

procedure Trpt_CurvaAbcProduto.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_CurvaAbcProduto.zrgGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalVendasGrupo    := 0;
  TotalQtdGrupo       := 0;
  TotalLucroGrupo     := 0;

  if not zrgGrupo.Enabled then
    Exit;

  with Grupo1 do
  Begin
    Close;
    ParamByName('GRP_CODIGO').AsInteger := Produto1.FieldByName('GRP_CODIGO').AsInteger;
    Open;
    SZRLabel7.Caption := Descricao;
  end;
  //
  if not zrlDescSubGrupo.Enabled then
    Exit;
  with SubGrupo1 do
  Begin
    Close;
    ParamByName('SGP_CODIGO').AsInteger := Produto1.FieldByName('SGP_CODIGO').AsInteger;
    Open;
    zrlSubGrupo.Caption := Descricao;
  end;
end;

procedure Trpt_CurvaAbcProduto.FormCreate(Sender: TObject);
begin
  TotalVendasGrupo    := 0;
  TotalQtdGrupo       := 0;
  TotalLucroGrupo     := 0;

  Posi := 0;
  TotalAcumulo := 0;

  TotalVendasGeral    := 0;
  TotalQtdGeral       := 0;
  TotalLucroGeral     := 0;
end;

procedure Trpt_CurvaAbcProduto.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbRodapeGrupo.Height = 0 then
    Exit;

  zrlTotalVendasGrupo.Caption := Format('%.2f',[TotalVendasGrupo]);
  if DM.Configuracao1.Empresa = 1 then
    zrlTotalQuantidadeGrupo.Caption := Format('%.2f',[TotalQtdGrupo])
  else
    zrlTotalQuantidadeGrupo.Caption := IntToStr(Trunc(TotalQtdGrupo));
  zrlAcumuladoGrupo.Caption  := Format('%.2f',[TotalAcumulo]);
  zrlLucroBrutoGrupo.Caption := Format('%.2f',[TotalLucroGrupo]);
end;

procedure Trpt_CurvaAbcProduto.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Posi := Posi + 1;
  if fMxSelProdutoCurva.ckbQuantidadeProdutos.Checked then
  begin
    if Posi = 1 then
       SZRLabel23.Caption := 'A'
    else if Posi = StrToInt(fMxSelProdutoCurva.edtQtdA.Text)+1 then
       SZRLabel23.Caption := 'B'
    else if Posi = StrToInt(fMxSelProdutoCurva.edtQtdA.Text)+StrToInt(fMxSelProdutoCurva.edtQtdB.Text)+1 then
       SZRLabel23.Caption := 'C'
    else if Posi = StrToInt(fMxSelProdutoCurva.edtQtdA.Text)+StrToInt(fMxSelProdutoCurva.edtQtdB.Text)+StrToInt(fMxSelProdutoCurva.edtQtdC.Text)+1 then
       SZRLabel23.Caption := 'D'
    else
       SZRLabel23.Caption := ' ';
  end;
  if ZRDBText1.DataField = 'PRD_CODIGO' then
  Begin
    with Produto2 do
    Begin
      Close;
      ParamByName('PRD_CODIGO').AsInteger := Produto1.FieldByName('PRD_CODIGO').AsInteger;
      Open;
      zrlProduto.Caption := FieldByName('PRD_DESCRICAO').AsString;
      zrlUnidade.Caption := FieldByName('PRD_UNIDADE').AsString;
      zrlPrecoVenda.Caption  := Format('%.2f',[FieldByName('PRD_PRECO_VENDA').AsFloat]);
    end;
  end
  else
  Begin
    with Produto2 do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 * FROM PRODUTO '+
        ' WHERE GRP_CODIGO='+IntToStr(Produto1.FieldByName('GRP_CODIGO').asInteger)+
        ' AND SGP_CODIGO='+IntToStr(Produto1.FieldByName('SGP_CODIGO').asInteger);
      Open;
    end;
    with SubGrupo1 do
    begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Produto1.FieldByName('SGP_CODIGO').asInteger;
      Open;
      zrlProduto.Caption := Descricao;
      zrlUnidade.Caption := '';
      zrlPrecoVenda.Caption  := '';
    end;
  end;
  SZRLabel21.Caption := IntToStr(Posi);
  //
  zrlTotalVendas.Caption     := Format('%.2f',[Produto1.FieldByName('SOMA_VALOR').AsFloat]);
  if DM.Configuracao1.Empresa = 1 then
    zrlTotalQuantidade.Caption := Format('%.2f',[Produto1.FieldByName('SOMA_QTD').AsFloat])
  else
    zrlTotalQuantidade.Caption := IntToStr(Trunc(Produto1.FieldByName('SOMA_QTD').AsFloat));
  zrlAcumulado.Caption := Format('%.2f',[TotalAcumulo]);

  try
    zrlLucroBruto.Caption := Format('%.2f',[Arredonda(Produto1.FieldByName('SOMA_VALOR').AsFloat)-(Produto1.FieldByName('SOMA_QTD').AsFloat*Arredonda(Produto2.FieldByName('PRD_CUSTO').AsFloat))]);
  except
  end;
  //
  TotalAcumulo := TotalAcumulo + Produto1.FieldByName('SOMA_VALOR').AsFloat;
  TotalQtdGrupo    := TotalQtdGrupo    + Produto1.FieldByName('SOMA_QTD').AsFloat;
  TotalQtdGeral    := TotalQtdGeral    + Produto1.FieldByName('SOMA_QTD').AsFloat;
  TotalVendasGrupo := TotalVendasGrupo + Produto1.FieldByName('SOMA_VALOR').AsFloat;
  TotalVendasGeral := TotalVendasGeral + Produto1.FieldByName('SOMA_VALOR').AsFloat;
  TotalLucroGrupo  := TotalLucroGrupo  + Arredonda(Produto1.FieldByName('SOMA_VALOR').AsFloat)-
                                         (Produto1.FieldByName('SOMA_QTD').AsFloat*
                                         Arredonda(Produto2.FieldByName('PRD_CUSTO').AsFloat));
  TotalLucroGeral  := TotalLucroGeral  + Arredonda(Produto1.FieldByName('SOMA_VALOR').AsFloat)-
                                         (Produto1.FieldByName('SOMA_QTD').AsFloat*
                                         Arredonda(Produto2.FieldByName('PRD_CUSTO').AsFloat));
end;

procedure Trpt_CurvaAbcProduto.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalVendasGeral.Caption := Format('%.2f',[TotalVendasGeral]);
  if DM.Configuracao1.Empresa = 1 then
    zrlTotalQuantidadeGeral.Caption := Format('%.2f',[TotalQtdGeral])
  else
    zrlTotalQuantidadeGeral.Caption := IntToStr(Trunc(TotalQtdGeral));
  zrlAcumuladoGeral.Caption  := Format('%.2f',[TotalAcumulo]);
  zrlLucroBrutoGeral.Caption := Format('%.2f',[TotalLucroGeral]);
end;

procedure Trpt_CurvaAbcProduto.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
