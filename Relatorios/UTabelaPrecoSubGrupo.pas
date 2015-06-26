unit UTabelaPrecoSubGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, funcoes,
  Item_Tabela_de_Precos_SubGrupo, Produto;

type
  Trpt_TabelaPrecoSubGrupo = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
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
    ZRDBText4: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel6: TSZRLabel;
    labCodigoTBP: TSZRLabel;
    SZRLabel8: TSZRLabel;
    labDescricao: TSZRLabel;
    SZRLabel10: TSZRLabel;
    labValidade: TSZRLabel;
    SZRLabel12: TSZRLabel;
    labDescontoSimples: TSZRLabel;
    SZRLabel14: TSZRLabel;
    labDescontoEspecial: TSZRLabel;
    SZRLabel16: TSZRLabel;
    labNumeroPrestacao: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel5: TSZRLabel;
    labCodigoCNC: TSZRLabel;
    Item_Tabela_de_Precos_SubGrupo1: TItem_Tabela_de_Precos_SubGrupo;
    Item_Tabela_de_Precos_SubGrupo1ITS_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1CNC_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1TPS_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1USU_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1GRP_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1SGP_CODIGO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1ITS_DT_CADASTRO: TDateTimeField;
    Item_Tabela_de_Precos_SubGrupo1ITS_DT_ALTERADO: TDateTimeField;
    Item_Tabela_de_Precos_SubGrupo1ITS_PRECO_ORIGINAL: TFloatField;
    Item_Tabela_de_Precos_SubGrupo1ITS_PRECO_VENDA: TFloatField;
    Item_Tabela_de_Precos_SubGrupo1ITS_BONIFICACAO: TFloatField;
    Item_Tabela_de_Precos_SubGrupo1ITS_QUANTIDADE_MINIMA: TFloatField;
    Item_Tabela_de_Precos_SubGrupo1ITS_SITUACAO: TIntegerField;
    Item_Tabela_de_Precos_SubGrupo1ITS_OBSERVACAO: TStringField;
    Item_Tabela_de_Precos_SubGrupo1GRP_DESCRICAO: TStringField;
    Item_Tabela_de_Precos_SubGrupo1SGP_DESCRICAO: TStringField;
    SZRGroup1: TSZRGroup;
    SZRLabel7: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel9: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlProduto: TSZRLabel;
    Produto1: TProduto;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TItem_Tabela_de_Precos_SubGrupo;
  end;

var
  rpt_TabelaPrecoSubGrupo: Trpt_TabelaPrecoSubGrupo;

implementation
uses
 UDM;

{$R *.DFM}


procedure Trpt_TabelaPrecoSubGrupo.FormCreate(Sender: TObject);
begin
  Entidade := Item_Tabela_de_Precos_SubGrupo1;
end;

procedure Trpt_TabelaPrecoSubGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_TabelaPrecoSubGrupo.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_TabelaPrecoSubGrupo.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_TabelaPrecoSubGrupo.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  zrLabel4.Caption := EmpresaDesenvolvedora;  
end;

procedure Trpt_TabelaPrecoSubGrupo.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.CodigoPRD = 0 then
  Begin
    zrlProduto.Caption := '';
    Exit;
  end;
  
  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> Entidade.CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    zrlProduto.Caption := Descricao;
  end;
end;

end.
