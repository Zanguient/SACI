unit uEstoqueLote1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  CentroCusto, Item_de_Estoque;

type
  Trpt_estoqueLote1 = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrlDetalhe: TSZRBand;                                    
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    zrlTituloRelatorio: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel6: TSZRLabel;
    Produto1: TProduto;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel11: TSZRLabel;
    zrbGrupo: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    zrlCentroQuantidade: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText5: TSZRDBText;
    CentroCusto1: TCentroCusto;
    zrlLinha: TSZRLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    SZRBand1: TSZRBand;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    Fornecedor1: TFornecedor;
    zrlDescTotalPatrimonio: TSZRLabel;
    zrlTotalPatrimonio: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlPreco1: TSZRLabel;
    zrlDescPreco1: TSZRLabel;
    Item_de_Estoque2: TItem_de_Estoque;
    zrlDescPrecoUnit: TSZRLabel;
    zrlPrecoUnitario: TSZRLabel;
    zrlProduto: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlTotalQuantidade: TSZRLabel;
    zrlDescPreco2: TSZRLabel;
    zrlPreco2: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoAfterPrint(Sender: TObject; Printed: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure Item_de_Estoque1BeforeOpen(DataSet: TDataSet);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vTotalQuantidade: Double;
  public
    Entidade: TProduto;
    Estoque,sFiltroCNC,sFiltroEstoque,sFiltroUltimoMovimento,sFiltroLote:String;
    vPatrimonio,vPatrimonioIndividual,SaldoEstoque:Double;
  end;

var
  rpt_estoqueLote1: Trpt_estoqueLote1;

implementation
uses
 UDM, Funcoes, UOp_RelatProd;

{$R *.DFM}

procedure Trpt_estoqueLote1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Close;
  CentroCusto1.Close;
  Action:=cafree;
end;

procedure Trpt_estoqueLote1.FormCreate(Sender: TObject);
begin
  Entidade := Produto1; 
  Estoque:='';
  sFiltroCNC := '';
  sFiltroEstoque := '';
  sFiltroUltimoMovimento := '';
  CentroCusto1.Open;
  zrlDetalhe.Height:=0;
end;

procedure Trpt_estoqueLote1.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
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
                                     PreencheEspacoEsq(8, ' ')+' '+
                                     PreencheEspacoEsq(zrlPrecoUnitario.Width, zrlPrecoUnitario.Caption)+' '+
                                     PreencheEspacoEsq(zrlPreco1.Width, zrlPreco1.Caption);
  end;
  SaldoEstoque := 0;
end;

procedure Trpt_estoqueLote1.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  prc:Double;
  Desc:string;
begin
  prc:=0;
  with Produto1 do
  begin
    case Op_RelatProd.rdgPreco.ItemIndex of
       0: prc:=Precovenda;
       1: prc:=Precocompra;
       2,3: prc:=Custo;
    end;

    if FieldByName('CNC').asInteger>0 then
    begin
      if CentroCusto1.CodigoCNC <> FieldByName('CNC').asInteger then
        CentroCusto1.LocalizarCod(FieldByName('CNC').asInteger);

      if DM.Configuracao1.Empresa in TEmpresasEstFUN then
      Begin
        if (FieldByName('FUN_CODIGO').asInteger = 0) or
           (FieldByName('FUN_CODIGO').asInteger = FieldByName('CNC').asInteger) then
          Desc := 'FIL'+PreencheZero(2,CentroCusto1.CodigoCNC)
        else
          Desc := 'FUN'+PreencheZero(3,FieldByName('FUN_CODIGO').asInteger)
      end
      else if DM.Configuracao1.Empresa = empLBM then
      Begin
        if CentroCusto1.CodigoCNC = 1 then
          Desc := 'Matriz'
        else if CentroCusto1.CodigoCNC = 2 then
          Desc := 'Filial'
        else if CentroCusto1.CodigoCNC = 3 then
          Desc := 'Servico'
        else
          Desc := CentroCusto1.RazaoSocial;
      end
      else if ((CentroCusto1.CodigoCNC = 0) and
               (DM.Configuracao1.Empresa = empEletro)) or
              ((CentroCusto1.CodigoCNC = 1) and
               (DM.Configuracao1.Empresa <> empEletro)) then
        Desc := 'CPD'
      else if (DM.Configuracao1.Empresa = empEletro) then
        Desc := Copy(CentroCusto1.RazaoSocial,1,5)
      else
        Desc := 'FIL'+PreencheZero(2,CentroCusto1.CodigoCNC);

      if Op_RelatProd.rdbEstoqueFisico1.Checked then
      Begin
        vPatrimonio:=vPatrimonio+(FieldByName('IED_QTD_FISICO').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IED_QTD_FISICO').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IED_QTD_FISICO').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IED_QTD_FISICO').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueFiscal.Checked then
      Begin
        vPatrimonio:=vPatrimonio+(FieldByName('IED_QTD_FISCAL').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IED_QTD_FISCAL').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IED_QTD_FISCAL').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IED_QTD_FISCAL').asfloat;
      end
    end;
  end;
end;

procedure Trpt_estoqueLote1.zrbRodapeGrupoAfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  Estoque:='';
end;


procedure Trpt_estoqueLote1.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_estoqueLote1.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vQtd: Double;
begin
  Estoque:='';
  SaldoEstoque := 0;

  if Op_RelatProd.rdgPreco.ItemIndex >= 0 then
  Begin
    with Item_de_Estoque2 do
    Begin
      Close;
      SQL.Text := 'SELECT SUM(IED_QTD_FISICO) AS IES_SFISICO '+
        ',SUM(IED_QTD_FISCAL) AS IES_SFISCAL '+
        ' FROM ITEM_DE_ESTOQUE_DETALHE '+
        ' WHERE PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+
        sFiltroCNC+sFiltroEstoque+sFiltroUltimoMovimento+sFiltroLote;
      Open;
    end;
    vQtd := 0;
    if not Item_de_Estoque2.IsEmpty then
    Begin
      if Op_RelatProd.rdbEstoqueFiscal.Checked then
        vQtd := Item_de_Estoque2.SFiscal
      else if Op_RelatProd.rdbEstoqueFisico1.Checked then
        vQtd := Item_de_Estoque2.SFisico;
    end;

    case Op_RelatProd.rdgPreco.ItemIndex of
       0: Begin
            zrlPrecoUnitario.Caption := format('%.2f',[Produto1.Precovenda]);
            zrlPreco1.Caption := format('%.2f',[vQtd*Arredonda(Produto1.Precovenda)]);
          end;
       1: Begin
            zrlPrecoUnitario.Caption := format('%.2f',[Produto1.Precocompra]);
            zrlPreco1.Caption := format('%.2f',[vQtd*Arredonda(Produto1.Precocompra)]);
          end;
       2: Begin
            zrlPrecoUnitario.Caption := format('%.2f',[Produto1.Custo]);
            zrlPreco1.Caption := format('%.2f',[vQtd*Arredonda(Produto1.Custo)]);
          end;
       3: Begin //Venda/Custo
            zrlPrecoUnitario.Caption := format('%.2f',[Produto1.Custo]);
            zrlPreco2.Caption := format('%.2f',[vQtd*Arredonda(Produto1.Precovenda)]);
            zrlPreco1.Caption := format('%.2f',[vQtd*Arredonda(Produto1.Custo)]);
          end;
    end;
  end;
  with Produto1 do
    zrlProduto.Caption := Trim(Descricao+' '+Caracteristica+' '+Referencia+' '+Marca+' '+Detalhe+' '+Local);
end;

procedure Trpt_estoqueLote1.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalQuantidade.Caption := Format('%.2f',[vTotalQuantidade]);
  zrlTotalPatrimonio.Caption := Format('%.2f',[vPatrimonio]);
end;

procedure Trpt_estoqueLote1.Item_de_Estoque1BeforeOpen(DataSet: TDataSet);
begin
  if DM.Configuracao1.Empresa = empLBM then
    Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=2;
end;

procedure Trpt_estoqueLote1.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
