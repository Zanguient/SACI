unit UInform_de_credito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Informacoes,
  Avalista;

type
  Trpt_inf_credito = class(TForm)
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
    ZRDBText7: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    Informacoes1: TInformacoes;
    ZRLabel14: TSZRLabel;
    Cliente1: TCliente;
    Avalista1: TAvalista;
    Informacoes1CNC_CODIGO: TIntegerField;
    Informacoes1CLI_CODIGO: TIntegerField;
    Informacoes1AVL_CODIGO: TIntegerField;
    Informacoes1ICR_DT_ULT_CMP: TDateTimeField;
    Informacoes1ICR_VL_ULT_CMP: TFloatField;
    Informacoes1ICR_VL_INAD: TFloatField;
    Informacoes1ICR_SPC: TStringField;
    Informacoes1ICR_LIM_CRD: TFloatField;
    Informacoes1ICR_MOT_PROIB: TStringField;
    Informacoes1ICR_ATRAZO: TIntegerField;
    Informacoes1CLI_RZ_SOCIAL: TStringField;
    Informacoes1AVL_NOME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_inf_credito: Trpt_inf_credito;

implementation

{$R *.DFM}





procedure Trpt_inf_credito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Informacoes1.Active:=false;
 Cliente1.Active:=false;
 Avalista1.Active:=false;
end;

procedure Trpt_inf_credito.FormCreate(Sender: TObject);
begin
 Informacoes1.Active:=true;
 Cliente1.Active:=true;
 Avalista1.Active:=true;
end;

end.
