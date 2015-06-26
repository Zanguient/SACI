unit UProdutosInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  Item_de_Inventario, Item_de_Estoque, funcoes;

type
  Trpt_ProdutosInvent = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
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
    ZRDBText4: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText9: TSZRDBText;
    Item_de_Inventario1: TItem_de_Inventario;
    Item_de_Estoque1: TItem_de_Estoque;
    SZRDBText2: TSZRDBText;
    zrlUsuario: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRLabel3: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrlTipo: TSZRLabel;
    SZRDBText8: TSZRDBText;
    SZRLabel8: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    zrlDescAtual: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel12: TSZRLabel;
    zrlDescAnterior: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlUltimoUsuario: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrbGrupoGRP: TSZRGroup;
    SZRLabel11: TSZRLabel;
    zrlGrupo: TSZRLabel;
    zrbRodapeGRP: TSZRBand;
    zrbGrupoSGP: TSZRGroup;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrbRodapeSGP: TSZRBand;
    zrbSumario: TSZRBand;
    SZRLabel16: TSZRLabel;
    zrlAtualSGP: TSZRLabel;
    zrlAtualGRP: TSZRLabel;
    zrlAtualTotal: TSZRLabel;
    zrlAnteriorSGP: TSZRLabel;
    zrlAnteriorGRP: TSZRLabel;
    zrlAnteriorTotal: TSZRLabel;
    zrlInformadoSGP: TSZRLabel;
    zrlInformadoGRP: TSZRLabel;
    zrlInformadoTotal: TSZRLabel;
    zrlAtual: TSZRLabel;
    zrlAnterior: TSZRLabel;
    zrlInformado: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlSubGrupo: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRDBText1: TSZRDBText;
    zrlProduto: TSZRLabel;
    Item_de_Estoque_Detalhe1: TQuery;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel28: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Item_de_Estoque1BeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoGRPBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoSGPBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeSGPBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGRPBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vAtualSGP, vAtualGRP, vAtual, vAnteriorSGP, vAnteriorGRP, vAnterior,
      vInformadoSGP, vInformadoGRP, vInformado: Double;
  public
    Entidade : TItem_de_Inventario;
    { Public declarations }
  end;

var
  rpt_ProdutosInvent: Trpt_ProdutosInvent;

implementation

uses  UDM;

{$R *.DFM}

procedure Trpt_ProdutosInvent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  action:=cafree;
end;

procedure Trpt_ProdutosInvent.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ProdutosInvent.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ProdutosInvent.Item_de_Estoque1BeforeOpen(
  DataSet: TDataSet);
begin
  Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_ProdutosInvent.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Inventario1;
  vAtual := 0;
  vAnterior := 0;
  vInformado := 0;
end;

procedure Trpt_ProdutosInvent.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  zrLabel4.Caption := EmpresaDesenvolvedora;  
end;

procedure Trpt_ProdutosInvent.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  case Entidade.FieldByName('INV_SITUACAO').asInteger of
    0: zrlSituacao.Caption := 'EM Aberto';
    1: zrlSituacao.Caption := 'Processado';
  end;

  case Entidade.FieldByName('INV_TIPO').asInteger of
    0: zrlSituacao.Caption := 'Vendas (C,F,F1)';
    1: zrlSituacao.Caption := 'Vendas (C,F)';
    2: zrlSituacao.Caption := 'Somente F1';
    3: zrlTipo.Caption := 'Somente LJ3';
  end;

  zrlUltimoUsuario.Caption := UpperCase(DM.NomeUsuario(Entidade.FieldByName('USU').asInteger));
end;

procedure Trpt_ProdutosInvent.zrbGrupoGRPBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vAtualGRP := 0;
  vAnteriorGRP := 0;
  vInformadoGRP := 0;

  if zrbGrupoGRP.Height = 0 then
    Exit;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT GRP_DESCRICAO '+
      ' FROM GRUPO '+
      ' WHERE GRP_CODIGO='+IntToStr(Entidade.FieldByName('GRP_CODIGO').asInteger);
    Open;
    zrlGrupo.Caption := FieldByName('GRP_DESCRICAO').asString;
  end;
end;

procedure Trpt_ProdutosInvent.zrbGrupoSGPBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vAtualSGP := 0;
  vAnteriorSGP := 0;
  vInformadoSGP := 0;

  if zrbGrupoSGP.Height = 0 then
    Exit;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SGP_DESCRICAO '+
      ' FROM SUBGRUPO '+
      ' WHERE SGP_CODIGO='+IntToStr(Entidade.FieldByName('SGP_CODIGO').asInteger);
    Open;
    zrlSubGrupo.Caption := FieldByName('SGP_DESCRICAO').asString;
  end;
end;

procedure Trpt_ProdutosInvent.zrbRodapeSGPBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlAtualSGP.Caption     := format('%.2f',[vAtualSGP]);
  zrlAnteriorSGP.Caption  := format('%.2f',[vAnteriorSGP]);
  zrlInformadoSGP.Caption := format('%.2f',[vInformadoSGP]);
end;

procedure Trpt_ProdutosInvent.zrbRodapeGRPBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlAtualGRP.Caption     := format('%.2f',[vAtualGRP]);
  zrlAnteriorGRP.Caption  := format('%.2f',[vAnteriorGRP]);
  zrlInformadoGRP.Caption := format('%.2f',[vInformadoGRP]);
end;

procedure Trpt_ProdutosInvent.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlAtualTotal.Caption     := format('%.2f',[vAtual]);
  zrlAnteriorTotal.Caption  := format('%.2f',[vAnterior]);
  zrlInformadoTotal.Caption := format('%.2f',[vInformado]);
end;

procedure Trpt_ProdutosInvent.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa = empEletro then
    zrlProduto.Caption := Trim(Entidade.FieldByName('PRD_DESCRICAO').asString+' '+Entidade.FieldByName('PRD_CARACTERISTICA').asString)
  else
    zrlProduto.Caption := Entidade.FieldByName('PRD_DESCRICAO').asString;

  with Item_de_Estoque_Detalhe1 do
  begin
    Close;
    ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
    ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
    Open;
  end;

  SZRLabel25.Caption := '';
  SZRLabel26.Caption := '';
  SZRLabel27.Caption := '';
  SZRLabel28.Caption := '';

  if not Item_de_Estoque_Detalhe1.IsEmpty then
  begin
    SZRLabel25.Caption := Item_de_Estoque_Detalhe1.FieldByName('LOT_CODIGO').asstring;
    SZRLabel26.Caption := Item_de_Estoque_Detalhe1.FieldByName('LOT_DESCRICAO').asstring;
    SZRLabel27.Caption := Item_de_Estoque_Detalhe1.FieldByName('LOT_REFERENCIA').asstring;
    SZRLabel28.Caption := Item_de_Estoque_Detalhe1.FieldByName('LOT_DT_VALIDADE').asstring;

    if zrlAtual.Enabled then
    begin
      zrlAtual.Caption := format('%.2f',[Item_de_Estoque_Detalhe1.FieldByName('IED_QTD_FISICO').asfloat]);
      vAtualSGP := vAtualSGP + Arredonda(Item_de_Estoque_Detalhe1.FieldByName('IED_QTD_FISICO').asfloat);
      vAtualGRP := vAtualGRP + Arredonda(Item_de_Estoque_Detalhe1.FieldByName('IED_QTD_FISICO').asfloat);
      vAtual := vAtual + Arredonda(Item_de_Estoque_Detalhe1.FieldByName('IED_QTD_FISICO').asfloat);


      //Quantidade Anterior
      zrlAnterior.Caption := format('%.2f',[Entidade.QuantSist]);
      vAnteriorSGP := vAnteriorSGP + Arredonda(Entidade.QuantSist);
      vAnteriorGRP := vAnteriorGRP + Arredonda(Entidade.QuantSist);
      vAnterior := vAnterior + Arredonda(Entidade.QuantSist);
    end
    else
      zrlAtual.Caption     := '';


    //Quantidade Informada
    zrlInformado.Caption := format('%.2f',[Entidade.QuantInf]);
    vInformadoSGP := vInformadoSGP + Arredonda(Entidade.QuantInf);
    vInformadoGRP := vInformadoGRP + Arredonda(Entidade.QuantInf);
    vInformado := vInformado + Arredonda(Entidade.QuantInf);

  end
  else
  begin
    if zrlAtual.Enabled then
    Begin
      //Quatidade Atua
      Item_de_Estoque1.Close;
      Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
      Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
      Item_de_Estoque1.Open;
      if not Item_de_Estoque1.IsEmpty then
      Begin
        zrlAtual.Caption     := format('%.2f',[Item_de_Estoque1.SFisico]);
        vAtualSGP := vAtualSGP + Arredonda(Item_de_Estoque1.SFisico);
        vAtualGRP := vAtualGRP + Arredonda(Item_de_Estoque1.SFisico);
        vAtual    := vAtual    + Arredonda(Item_de_Estoque1.SFisico);
      end
      else
        zrlAtual.Caption     := '';

      //Quantidade Anterior
      zrlAnterior.Caption  := format('%.2f',[Entidade.QuantSist]);
      vAnteriorSGP := vAnteriorSGP + Arredonda(Entidade.QuantSist);
      vAnteriorGRP := vAnteriorGRP + Arredonda(Entidade.QuantSist);
      vAnterior    := vAnterior    + Arredonda(Entidade.QuantSist);
    end;

    //Quantidade Informada
    zrlInformado.Caption := format('%.2f',[Entidade.QuantInf]);
    vInformadoSGP := vInformadoSGP + Arredonda(Entidade.QuantInf);
    vInformadoGRP := vInformadoGRP + Arredonda(Entidade.QuantInf);
    vInformado    := vInformado    + Arredonda(Entidade.QuantInf);
  end;
end;

end.
