unit UProdutoSubGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  Classificacao_fiscal, Origem_Fiscal, SubGrupo, Grupo, Fornecedor, Produto,
  funcoes;

type
  Trpt_produtoSubGrupo = class(TForm)
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
    ZRLabel6: TSZRLabel;
    Produto1: TProduto;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    zrlDescPreco: TSZRLabel;
    zrgGrupo: TSZRGroup;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlGrupo: TSZRLabel;
    Grupo1: TGrupo;
    SZRBand1: TSZRBand;
    SZRLabel5: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrgSubGrupo: TSZRGroup;
    zrbRodapeSubGrupo: TSZRBand;
    SZRDBText2: TSZRDBText;
    ZRDBText2: TSZRDBText;
    SZRLabel1: TSZRLabel;
    zrlPreco: TSZRLabel;
    Produto2: TProduto;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeSubGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    TotalRegistros : integer;
  public
    Entidade: TProduto;
  end;

var
  rpt_produtoSubGrupo: Trpt_produtoSubGrupo;

implementation
uses
 UDM, UOp_RelatProd;

{$R *.DFM}

procedure Trpt_produtoSubGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_produtoSubGrupo.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_produtoSubGrupo.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if not (tag in [5,6]) then
  Begin
    if DM.Configuracao1.Empresa = 1 then
      zrlDescPreco.Caption:='Referencia'
    else
      case Op_RelatProd.rdgPreco.ItemIndex of
        0: zrlDescPreco.Caption:='Preco Venda';
        1: zrlDescPreco.Caption:='Preco Compra';
        2: zrlDescPreco.Caption:='Preco Custo';
      end;
  end
  else
    zrlDescPreco.Caption:='Preco Venda';
end;

procedure Trpt_produtoSubGrupo.zrgGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrgGrupo.Height = 0 then
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

procedure Trpt_produtoSubGrupo.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_produtoSubGrupo.FormCreate(Sender: TObject);
begin
  Entidade := Produto1;
  TotalRegistros := 0;
end;

procedure Trpt_produtoSubGrupo.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_produtoSubGrupo.zrbRodapeSubGrupoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  inc(TotalRegistros);
  case Op_RelatProd.rdgPreco.ItemIndex of
    0: Begin
         with Produto2 do
         Begin
           Close;
           SQL.Text := 'SELECT DISTINCT PRD_PRECO_VENDA '+
              ' FROM PRODUTO '+
              ' WHERE SGP_CODIGO='+IntToStr(Entidade.CodigoSGP)+
              ' AND PRD_SITUACAO<>1 ';
           Open;
           if RecordCount > 1 then
             zrlPreco.Caption:=  'ERRO'
           else
             zrlPreco.Caption:=  Format('%.2f',[Entidade.FieldbyName('PRD_PRECO_VENDA').AsFloat]);
         end;
       end;
    1: Begin
         with Produto2 do
         Begin
           Close;
           SQL.Text := 'SELECT DISTINCT PRD_PRECO_COMPRA '+
              ' FROM PRODUTO '+
              ' WHERE SGP_CODIGO='+IntToStr(Entidade.CodigoSGP)+
              ' AND PRD_SITUACAO<>1 ';
           Open;
           if RecordCount > 1 then
             zrlPreco.Caption:=  'ERRO'
           else
             zrlPreco.Caption:=  Format('%.2f',[Entidade.FieldbyName('PRD_PRECO_COMPRA').AsFloat]);
         end;
       end;
    2: Begin
         with Produto2 do
         Begin
           Close;
           SQL.Text := 'SELECT DISTINCT PRD_CUSTO '+
              ' FROM PRODUTO '+
              ' WHERE SGP_CODIGO='+IntToStr(Entidade.CodigoSGP)+
              ' AND PRD_SITUACAO<>1 ';
           Open;
           if RecordCount > 1 then
             zrlPreco.Caption:=  'ERRO'
           else
             zrlPreco.Caption:=  Format('%.2f',[Entidade.FieldbyName('PRD_CUSTO').AsFloat]);
         end;
       end;
  end;
end;

end.
