unit USol_de_garantia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Solicitacao_de_Garantia, Produto;

type
  Trpt_sol_de_garantia = class(TForm)
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
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    Produto1: TProduto;
    Solicitacao_de_Garantia1: TSolicitacao_de_Garantia;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    Produto1PRD_CODIGO: TIntegerField;
    Produto1CNC_CODIGO: TIntegerField;
    Produto1FOR_CODIGO: TIntegerField;
    Produto1CTP_CODIGO: TIntegerField;
    Produto1SGP_CODIGO: TIntegerField;
    Produto1GRP_CODIGO: TIntegerField;
    Produto1CLF_CODIGO: TIntegerField;
    Produto1ORF_CODIGO: TIntegerField;
    Produto1PRD_DESCRICAO: TStringField;
    Produto1PRD_UNIDADE: TStringField;
    Produto1PRD_MARCA: TStringField;
    Produto1PRD_PRECO_COMPRA: TIntegerField;
    Produto1PRD_REFERENCIA: TStringField;
    Produto1PRD_DT_ULT_COMPRA: TDateTimeField;
    Produto1PRD_CUSTO: TIntegerField;
    Produto1PRD_PRECO_MEDIO: TIntegerField;
    Produto1PRD_PRECO_VENDA: TIntegerField;
    Produto1PRD_EST_MINIMO: TIntegerField;
    Produto1PRD_EST_MEDIO: TIntegerField;
    Produto1PRD_COMISSAO: TIntegerField;
    Solicitacao_de_Garantia1SGR_CODIGO: TIntegerField;
    Solicitacao_de_Garantia1CNC_CODIGO: TIntegerField;
    Solicitacao_de_Garantia1PRD_CODIGO: TIntegerField;
    Solicitacao_de_Garantia1SGR_TIPO_ENT: TIntegerField;
    Solicitacao_de_Garantia1SGR_CNC_CODIGO_ENT: TIntegerField;
    Solicitacao_de_Garantia1SGR_ENT_CODIGO: TIntegerField;
    Solicitacao_de_Garantia1SGR_DATA: TDateTimeField;
    Solicitacao_de_Garantia1SGR_DATA_ATUAL: TDateTimeField;
    Solicitacao_de_Garantia1SGR_SITUACAO: TIntegerField;
    Solicitacao_de_Garantia1SGR_OBSERVACAO: TStringField;
    Solicitacao_de_Garantia1PRD_DESCRICAO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_sol_de_garantia: Trpt_sol_de_garantia;

implementation

{$R *.DFM}






procedure Trpt_sol_de_garantia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Produto1.Active:=false;
 Solicitacao_de_Garantia1.Active:=false;
end;

procedure Trpt_sol_de_garantia.FormCreate(Sender: TObject);
begin
 Produto1.Active:=true;
 Solicitacao_de_Garantia1.Active:=true;
end;

end.
