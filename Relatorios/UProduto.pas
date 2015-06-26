unit UProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto;

type
  Trpt_produto = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
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
    Produto1: TProduto;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    zrlDescReferencia: TSZRLabel;
    ZRLabel11: TSZRLabel;
    zrlDescPreco1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    zdbReferencia: TSZRDBText;
    ZRDBText5: TSZRDBText;
    zrlDescDetalhe: TSZRLabel;
    zdbDetalhe: TSZRDBText;
    zrlPreco1: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlDescMarca: TSZRLabel;
    zrbGrupo: TSZRGroup;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlGrupo: TSZRLabel;
    Grupo1: TGrupo;
    zrbSumario: TSZRBand;
    SZRLabel5: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlPreco2: TSZRLabel;
    zrlDescPreco2: TSZRLabel;
    zdbMarca: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText1: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrlPreco1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlDescPreco1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    TotalRegistros : integer;
  public
    Entidade: TProduto;
  end;

var
  rpt_produto: Trpt_produto;

implementation
uses
 UDM, Funcoes, UOp_RelatProd;

{$R *.DFM}

procedure Trpt_produto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_produto.zrlPreco1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  If (not DM.Usuario1.Permissoes.IndexOf(IntToStr(7960)) = 0) and (Tag = 7) then
    DoPrint:= False;
  //
  if not (tag in [5,6,7]) then
  Begin
{    if DM.Configuracao1.Empresa = empEletro then
      case Op_RelatProd.rdgPreco.ItemIndex of
        0:
        Begin
          zrlPreco.Caption:=IntToStr(Trunc(Entidade.FieldbyName('PRD_PRECO_VENDA').AsFloat));
          zrlPreco.Caption:=zrlPreco.Caption+' '+
            Copy(Format('%.2f',[Entidade.FieldbyName('PRD_PRECO_VENDA').AsFloat]),
            Pos(',',Format('%.2f',[Entidade.FieldbyName('PRD_PRECO_VENDA').AsFloat]))+1,2);
        end;
        1:
        Begin
          zrlPreco.Caption:=IntToStr(Trunc(Entidade.FieldbyName('PRD_PRECO_COMPRA').AsFloat));
          zrlPreco.Caption:=zrlPreco.Caption+' '+
            Copy(Format('%.2f',[Entidade.FieldbyName('PRD_PRECO_COMPRA').AsFloat]),
            Pos(',',Format('%.2f',[Entidade.FieldbyName('PRD_PRECO_COMPRA').AsFloat]))+1,2);
        end;
        2:
        Begin
          zrlPreco.Caption:=IntToStr(Trunc(Entidade.FieldbyName('PRD_CUSTO').AsFloat));
          zrlPreco.Caption:=zrlPreco.Caption+' '+
            Copy(Format('%.2f',[Entidade.FieldbyName('PRD_CUSTO').AsFloat]),
            Pos(',',Format('%.2f',[Entidade.FieldbyName('PRD_CUSTO').AsFloat]))+1,2);
        end;
        3: //Venda/Custo
        Begin
          zrlMarca.Caption:= Format('%.2f',[Entidade.FieldbyName('PRD_PRECO_VENDA').AsFloat]);
          zrlPreco.Caption:= Format('%.2f',[Entidade.FieldbyName('PRD_CUSTO').AsFloat]);
        end;
      end
    else
}
    case Op_RelatProd.rdgPreco.ItemIndex of
      0: zrlPreco1.Caption:=  Format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Entidade.FieldbyName('PRD_PRECO_VENDA').AsFloat]);
      1: zrlPreco1.Caption:=  Format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Entidade.FieldbyName('PRD_PRECO_COMPRA').AsFloat]);
      2: zrlPreco1.Caption:=  Format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Entidade.FieldbyName('PRD_CUSTO').AsFloat]);
      3: Begin //Venda/Custo
           zrlPreco2.Caption:=  Format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Entidade.FieldbyName('PRD_PRECO_VENDA').AsFloat]);
           zrlPreco1.Caption:=  Format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Entidade.FieldbyName('PRD_CUSTO').AsFloat]);
         end;
    end;
  end
  else
    zrlPreco1.Caption:=  Format('%.'+IntToStr(iCasasDecimaisVenda)+'f',[Entidade.FieldbyName('PRD_PRECO_VENDA').AsFloat]);
end;

procedure Trpt_produto.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if not (tag in [5,6,7]) then
  Begin
    case Op_RelatProd.rdgPreco.ItemIndex of
      0: zrlDescPreco1.Caption:='Venda';
      1: zrlDescPreco1.Caption:='Compra';
      2: zrlDescPreco1.Caption:='Custo';
      3: Begin //Venda/Custo
           zrlDescPreco2.Caption := 'Venda';
           zrlDescPreco1.Caption := 'Custo';
         end;
    end;
  end
  else
    zrlDescPreco1.Caption:='Venda';

  if DM.Configuracao1.Empresa = empLuciano then
  Begin
    zrlDescReferencia.Left := 59;
    zdbReferencia.Left := 59;

    zrlDescDetalhe.Left := 77;
    zdbDetalhe.Left := 77;
  end;
end;

procedure Trpt_produto.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbGrupo.Height = 0 then
    Exit;

  with Grupo1 do
  Begin
    if Entidade.CodigoGRP <> CodigoGRP then
    Begin
      Close;
      ParamByName('GRP_CODIGO').asInteger := Entidade.CodigoGRP;
      Open;
    end;
    zrlGrupo.Caption := Descricao;
  end;
end;

procedure Trpt_produto.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_produto.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  inc(TotalRegistros);
  zrlProduto.Caption := Trim(Produto1.Descricao) + ' ' + Trim(Produto1.Caracteristica);
end;

procedure Trpt_produto.FormCreate(Sender: TObject);
begin
  Entidade := Produto1;
  TotalRegistros := 0;
end;

procedure Trpt_produto.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

//Tag = 7 //Relatório de Serviços

procedure Trpt_produto.zrlDescPreco1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  If (not DM.Usuario1.Permissoes.IndexOf(IntToStr(7960)) = 0) and (Tag = 7) then
    DoPrint:= False;
end;

end.
