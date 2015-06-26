unit UInventario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, SQuery, Item_de_Embarque, Embarque,
  Produto, Transportadora, Funcionario, CentroCusto, Transferencia,
  Item_de_Inventario;

type
  Trpt_Inventario = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel7: TSZRLabel;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRGroup1: TSZRGroup;
    zrbDetalhe: TSZRBand;
    Produto1: TProduto;
    ZRDBText6: TSZRDBText;
    ZRLabel21: TSZRLabel;
    CentroCusto1: TCentroCusto;
    ZRDBText1: TSZRDBText;
    ZRLabel25: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRDBText2: TSZRDBText;
    zrlFiltros: TSZRLabel;
    zrlDataINI: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    Item_de_Inventario1: TItem_de_Inventario;
    zrlProduto: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrlCentroDeCusto: TSZRLabel;
    ZRLabel5: TSZRLabel;
    SZRLabel3: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TItem_de_Inventario;
  end;

var
  rpt_Inventario: Trpt_Inventario;

implementation
Uses UDM, Funcoes;
{$R *.DFM}      

procedure Trpt_Inventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_Inventario.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Inventario.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
   with Produto1 do
   Begin
     Close;
     ParamByName('PRD_CODIGO').asinteger := Entidade.CodigoPRD;
     Open;
     if DM.Configuracao1.Empresa = empLuciano then
       zrlProduto.Caption := 'L'+IntToStr(Entidade.CodigoLOT)+' '+Trim(Descricao+' '+Caracteristica)+' '+Referencia+' '+Marca     
     else
       zrlProduto.Caption := Trim(Descricao+' '+Caracteristica)+' '+Referencia+' '+Marca;
   end;
   zrlQuantidade.Caption := format('%.2f',[Entidade.QuantInf]);
end;

procedure Trpt_Inventario.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Inventario.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Inventario1;
end;

procedure Trpt_Inventario.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with CentroCusto1 do
  Begin
    if (CodigoCNC <> Entidade.CodigoCNC) or
       (IsEmpty) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
    end;
    zrlCentroDeCusto.Caption := RazaoSocial;
  end;

  Case Entidade.FieldByName('INV_SITUACAO').asInteger of
    0: zrlSituacao.Caption:='Em Aberto';
    1: zrlSituacao.Caption:='Processado';
   End;
end;

end.
