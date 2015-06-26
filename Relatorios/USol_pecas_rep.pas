unit USol_pecas_rep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Produto,
  Fornecedor, SolicitPecRep;

type
  Trpt_sol_pecas_rep = class(TForm)
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
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SolicitPecRep1: TSolicitPecRep;
    Fornecedor1: TFornecedor;
    Produto1: TProduto;
    SolicitPecRep1SPR_CODIGO: TIntegerField;
    SolicitPecRep1CNC_CODIGO: TIntegerField;
    SolicitPecRep1FOR_CODIGO: TIntegerField;
    SolicitPecRep1PRD_CODIGO: TIntegerField;
    SolicitPecRep1SPR_DESCRICAO: TStringField;
    SolicitPecRep1SPR_DATA: TDateTimeField;
    SolicitPecRep1SPR_SITUACAO: TIntegerField;
    SolicitPecRep1SPR_OBSERVACAO: TStringField;
    SolicitPecRep1FOR_RZ_SOCIAL: TStringField;
    SolicitPecRep1PRD_DESCRICAO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_sol_pecas_rep: Trpt_sol_pecas_rep;

implementation

{$R *.DFM}


procedure Trpt_sol_pecas_rep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Produto1.Active:=false;
 Fornecedor1.Active:=false;
 SolicitPecRep1.Active:=false;
end;

procedure Trpt_sol_pecas_rep.FormCreate(Sender: TObject);
begin
 Produto1.Active:=true;
 Fornecedor1.Active:=true;
 SolicitPecRep1.Active:=true;
end;

end.
