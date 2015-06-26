unit uEstoqueLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  CentroCusto, Item_de_Estoque;

type
  Trpt_estoqueLote = class(TForm)
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
    ZRLabel13: TSZRLabel;
    zrbGrupo: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    zrlCentroQuantidade: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText5: TSZRDBText;
    CentroCusto1: TCentroCusto;
    zrlLinha: TSZRLabel;
    zrlDeposito: TSZRLabel;
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
    zrlDescTotalLinha: TSZRLabel;
    zrlTotalLinha: TSZRLabel;
    zrlDescTotalForaLinha: TSZRLabel;
    zrlTotalForaLinha: TSZRLabel;
    zrlDesTotalCatalogo: TSZRLabel;
    zrlTotalCatalogo: TSZRLabel;
    zrlDescTotalIgual: TSZRLabel;
    zrlTotalIgual: TSZRLabel;
    qrySomenteForaLinha: TQuery;
    qrySomenteCatalogo: TQuery;
    qrySomenteLinha: TQuery;
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
    Estoque,sFiltroCNC,sFiltroEstoque,sFiltroUltimoMovimento:String;
    vPatrimonio,vPatrimonioIndividual,SaldoEstoque:Double;
  end;

var
  rpt_estoqueLote: Trpt_estoqueLote;

implementation
uses
 UDM, Funcoes, UOp_RelatProd;

{$R *.DFM}

procedure Trpt_estoqueLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Close;
  CentroCusto1.Close;
  Action:=cafree;
end;

procedure Trpt_estoqueLote.FormCreate(Sender: TObject);
begin
  Estoque:='';
  sFiltroCNC := '';
  sFiltroEstoque := '';
  sFiltroUltimoMovimento := '';
  CentroCusto1.Open;
  zrlDetalhe.Height:=0;
end;

procedure Trpt_estoqueLote.zrbRodapeGrupoBeforePrint(Sender: TObject;
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
                                     PreencheEspacoEsq(zrlDeposito.Width, zrlDeposito.Caption)+' '+
                                     PreencheEspacoEsq(zrlPrecoUnitario.Width, zrlPrecoUnitario.Caption)+' '+
                                     PreencheEspacoEsq(zrlPreco1.Width, zrlPreco1.Caption);
  end;
  SaldoEstoque := 0;
end;

procedure Trpt_estoqueLote.zrlDetalheBeforePrint(Sender: TObject;
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

      if Op_RelatProd.rdbEstoqueFiscal.Checked then
      Begin
        vPatrimonio:=vPatrimonio + (FieldByName('IES_SFISCAL').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SFISCAL').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_SFISCAL').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_SFISCAL').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueLJ3.Checked then
      Begin
        vPatrimonio:=vPatrimonio + (FieldByName('IES_SSN').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SSN').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_SSN').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_SSN').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueLJ4.Checked then
      Begin
        vPatrimonio:=vPatrimonio + (FieldByName('IES_SLJ4').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SLJ4').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_SLJ4').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_SLJ4').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueFisico1.Checked then
      Begin
        vPatrimonio:=vPatrimonio+(FieldByName('IES_SFISICO').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SFISICO').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_SFISICO').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_SFISICO').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueComercial.Checked then
      Begin
        vPatrimonio:=vPatrimonio+((FieldByName('IES_SCOMERCIAL').asfloat-FieldByName('IES_SRESERVADO').asfloat-FieldByName('IES_INDISPONIVEL').asfloat)*prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SCOMERCIAL').asfloat-FieldByName('IES_SRESERVADO').asfloat-FieldByName('IES_INDISPONIVEL').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + (FieldByName('IES_SCOMERCIAL').asfloat-FieldByName('IES_SRESERVADO').asfloat-FieldByName('IES_INDISPONIVEL').asfloat);
        vTotalQuantidade := vTotalQuantidade + (FieldByName('IES_SCOMERCIAL').asfloat-FieldByName('IES_SRESERVADO').asfloat-FieldByName('IES_INDISPONIVEL').asfloat);
      end
      else if Op_RelatProd.rdbEstoqueIndisponivel.Checked then
      Begin
        vPatrimonio:=vPatrimonio+(FieldByName('IES_INDISPONIVEL').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_INDISPONIVEL').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_INDISPONIVEL').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_INDISPONIVEL').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueReserva.Checked then
      Begin
        vPatrimonio:=vPatrimonio+(FieldByName('IES_SRESERVADO').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SRESERVADO').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_SRESERVADO').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_SRESERVADO').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueBonificacao.Checked then
      Begin
        vPatrimonio:=vPatrimonio+(FieldByName('IES_SBONIFICACAO').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SBONIFICACAO').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_SBONIFICACAO').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_SBONIFICACAO').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueAmostra.Checked then
      Begin
        vPatrimonio:=vPatrimonio+(FieldByName('IES_SAMOSTRA').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SAMOSTRA').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_SAMOSTRA').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_SAMOSTRA').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueBonificacaoF1.Checked then
      Begin
        vPatrimonio:=vPatrimonio+(FieldByName('IES_SBONIFICACAO_FISCAL').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SBONIFICACAO_FISCAL').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_SBONIFICACAO_FISCAL').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_SBONIFICACAO_FISCAL').asfloat;
      end
      else if Op_RelatProd.rdbEstoqueAmostraF1.Checked then
      Begin
        vPatrimonio:=vPatrimonio+(FieldByName('IES_SAMOSTRA_FISCAL').asfloat*Prc);
        Estoque:=Estoque+Desc+':'+format('%.2f',[FieldByName('IES_SAMOSTRA_FISCAL').asfloat])+'; ';
        SaldoEstoque := SaldoEstoque + FieldByName('IES_SAMOSTRA_FISCAL').asfloat;
        vTotalQuantidade := vTotalQuantidade + FieldByName('IES_SAMOSTRA_FISCAL').asfloat;
      end;
    end;
  end;
end;

procedure Trpt_estoqueLote.zrbRodapeGrupoAfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  Estoque:='';
end;


procedure Trpt_estoqueLote.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.CentroCusto1.RazaoSocial;

  if DM.Configuracao1.Empresa <> 1 then
  Begin
    ZRLabel13.Enabled := False;
    zrlDeposito.Enabled := False;
  end;
end;

procedure Trpt_estoqueLote.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vQtd: Double;
begin
  Estoque:='';
  SaldoEstoque := 0;
  Item_de_Estoque1.Close;
  Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=Produto1.CodigoPRD;
  Item_de_Estoque1.Open;
  if not Item_de_Estoque1.IsEmpty then
  Begin
    if Op_RelatProd.rdbEstoqueFiscal.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.SFiscal])
    else if Op_RelatProd.rdbEstoqueLJ3.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.SSN])
    else if Op_RelatProd.rdbEstoqueLJ4.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.SLJ4])
    else if Op_RelatProd.rdbEstoqueFisico1.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.SFisico])
    else if Op_RelatProd.rdbEstoqueComercial.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.Saldo])
    else if Op_RelatProd.rdbEstoqueIndisponivel.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.Indisponivel])
    else if Op_RelatProd.rdbEstoqueReserva.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.SReservado])
    else if Op_RelatProd.rdbEstoqueBonificacao.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.SBonificacao])
    else if Op_RelatProd.rdbEstoqueAmostra.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.SAmostra])
    else if Op_RelatProd.rdbEstoqueBonificacaoF1.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.SBonificacaoFiscal])
    else if Op_RelatProd.rdbEstoqueAmostraF1.Checked then
      zrlDeposito.Caption:=format('%.2f',[Item_de_Estoque1.SAmostraFiscal]);
  end
  else
    zrlDeposito.Caption:='';


  if Op_RelatProd.rdgPreco.ItemIndex >= 0 then
  Begin
    with Item_de_Estoque2 do
    Begin
      Close;
      SQL.Text := 'SELECT SUM(IES_SCOMERCIAL) AS IES_SCOMERCIAL '+
        ',SUM(IES_SFISICO) AS IES_SFISICO '+
        ',SUM(IES_SFISCAL) AS IES_SFISCAL '+
        ',SUM(IES_SRESERVADO) AS IES_SRESERVADO '+
        ',SUM(IES_INDISPONIVEL) AS IES_INDISPONIVEL '+
        ',SUM(IES_SSN) AS IES_SSN '+
        ' FROM ITEM_DE_ESTOQUE '+
        ' WHERE PRD_CODIGO='+IntToStr(Produto1.CodigoPRD)+
        sFiltroCNC+sFiltroEstoque+sFiltroUltimoMovimento;

      Open;
    end;
    vQtd := 0;
    if not Item_de_Estoque2.IsEmpty then
    Begin
      if Op_RelatProd.rdbEstoqueFiscal.Checked then
        vQtd := Item_de_Estoque2.SFiscal
      else if Op_RelatProd.rdbEstoqueLJ3.Checked then
        vQtd := Item_de_Estoque2.SSN
      else if Op_RelatProd.rdbEstoqueLJ4.Checked then
        vQtd := Item_de_Estoque2.SLJ4
      else if Op_RelatProd.rdbEstoqueFisico1.Checked then
        vQtd := Item_de_Estoque2.SFisico
      else if Op_RelatProd.rdbEstoqueComercial.Checked then
        vQtd := Item_de_Estoque2.Saldo
      else if Op_RelatProd.rdbEstoqueIndisponivel.Checked then
        vQtd := Item_de_Estoque2.Indisponivel
      else if Op_RelatProd.rdbEstoqueReserva.Checked then
        vQtd := Item_de_Estoque2.SReservado
      else if Op_RelatProd.rdbEstoqueBonificacao.Checked then
        vQtd := Item_de_Estoque2.SBonificacao
      else if Op_RelatProd.rdbEstoqueAmostra.Checked then
        vQtd := Item_de_Estoque2.SAmostra
      else if Op_RelatProd.rdbEstoqueBonificacaoF1.Checked then
        vQtd := Item_de_Estoque2.SBonificacaoFiscal
      else if Op_RelatProd.rdbEstoqueAmostraF1.Checked then
        vQtd := Item_de_Estoque2.SAmostraFiscal;
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

procedure Trpt_estoqueLote.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa <> empHOPE then
  Begin
    zrlDescTotalLinha.Enabled     := False;
    zrlTotalLinha.Enabled         := False;
    zrlDescTotalForaLinha.Enabled := False;
    zrlTotalForaLinha.Enabled     := False;
    zrlDesTotalCatalogo.Enabled   := False;
    zrlTotalCatalogo.Enabled      := False;
    zrlDescTotalIgual.Enabled     := False;
    zrlTotalIgual.Enabled         := False;
  end
  else //Somente HOPE
  Begin
    qrySomenteLinha.Open;

    qrySomenteForaLinha.Open;

    qrySomenteCatalogo.Open;

    if Op_RelatProd.rdbEstoqueFiscal.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_FISCAL').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_FISCAL').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_FISCAL').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueLJ3.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_SN').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_SN').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_SN').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueLJ4.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_LJ4').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_LJ4').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_LJ4').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueFisico1.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_FISICO').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_FISICO').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_FISICO').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueComercial.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_COMERCIAL').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_COMERCIAL').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_COMERCIAL').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueIndisponivel.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_INDISPONIVEL').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_INDISPONIVEL').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_INDISPONIVEL').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueReserva.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_RESERVADO').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_RESERVADO').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_RESERVADO').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueBonificacao.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_BONIFICACAO').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_BONIFICACAO').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_BONIFICACAO').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueAmostra.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_AMOSTRA').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_AMOSTRA').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_AMOSTRA').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueBonificacaoF1.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_BONIFICACAO_FISCAL').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_BONIFICACAO_FISCAL').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_BONIFICACAO_FISCAL').asFloat]);
    end
    else if Op_RelatProd.rdbEstoqueAmostraF1.Checked then
    Begin
      zrlTotalLinha.Caption     := Format('%.2f',[qrySomenteLinha.FieldByName('QTD_AMOSTRA_FISCAL').asFloat]);
      zrlTotalForaLinha.Caption := Format('%.2f',[qrySomenteForaLinha.FieldByName('QTD_AMOSTRA_FISCAL').asFloat]);
      zrlTotalCatalogo.Caption  := Format('%.2f',[qrySomenteCatalogo.FieldByName('QTD_AMOSTRA_FISCAL').asFloat]);
    end;


    zrlTotalIgual.Caption := Format('%.2f',[StrToFloat(zrlTotalLinha.Caption)+StrToFloat(zrlTotalForaLinha.Caption)]);
  end;

  zrlTotalQuantidade.Caption := Format('%.2f',[vTotalQuantidade]);
  zrlTotalPatrimonio.Caption := Format('%.2f',[vPatrimonio]);
end;

procedure Trpt_estoqueLote.Item_de_Estoque1BeforeOpen(DataSet: TDataSet);
begin
  if DM.Configuracao1.Empresa = empLBM then
    Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=2;
end;

procedure Trpt_estoqueLote.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

end.
