unit UHistCliEmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo,
  Item_de_Embarque, funcoes;

type
  Trpt_HistCliEmbarque = class(TForm)
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
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRDBText3: TSZRDBText;
    Item_de_Embarque1: TItem_de_Embarque;
    SZRDBText1: TSZRDBText;
    SZRLabel1: TSZRLabel;
    Item_de_Embarque1IEB_CODIGO: TIntegerField;
    Item_de_Embarque1CNC_CODIGO: TIntegerField;
    Item_de_Embarque1PRD_CODIGO: TIntegerField;
    Item_de_Embarque1EMB_CODIGO: TIntegerField;
    Item_de_Embarque1IEB_QUANTIDADE: TFloatField;
    Item_de_Embarque1IEB_TIPO_ENT: TIntegerField;
    Item_de_Embarque1IEB_CNC_CODIGO_ENT: TIntegerField;
    Item_de_Embarque1IEB_ENT_CODIGO: TIntegerField;
    Item_de_Embarque1IEB_DESTINO: TStringField;
    Item_de_Embarque1IEB_SITUACAO: TIntegerField;
    Item_de_Embarque1PDV_CODIGO: TIntegerField;
    Item_de_Embarque1PRD_DESCRICAO: TStringField;
    zrlUsuario: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade : TItem_de_Embarque;
    { Public declarations }
  end;

var
  rpt_HistCliEmbarque: Trpt_HistCliEmbarque;

implementation
uses
  UDM;

{$R *.DFM}

procedure Trpt_HistCliEmbarque.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Embarque1;
end;

procedure Trpt_HistCliEmbarque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Active := false;
 Action := cafree;
end;

procedure Trpt_HistCliEmbarque.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_HistCliEmbarque.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_HistCliEmbarque.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
