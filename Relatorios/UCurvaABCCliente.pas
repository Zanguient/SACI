unit UCurvaABCCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, funcoes, 
  Pedido_de_Venda;

type
  Trpt_CurvaAbcCliente = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRLabel13: TSZRLabel;
    SZRLabel1: TSZRLabel;
    ZRLabel3: TSZRLabel;
    SZRBand2: TSZRBand;
    SZRLabel14: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    Cliente1: TCliente;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel31: TSZRLabel;
    Cliente2: TCliente;
    SZRLabel12: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel35: TSZRLabel;
    SZRLabel36: TSZRLabel;
    SZRLabel37: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel43: TSZRLabel;
    SZRLabel44: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_CurvaAbcCliente: Trpt_CurvaAbcCliente;
  Tot: Double;
  Posi: Integer;
implementation
uses
 UDM, MxSelClienteCurva;

{$R *.DFM}

procedure Trpt_CurvaAbcCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cliente1.Active:=false;
  Action:=cafree;
end;

procedure Trpt_CurvaAbcCliente.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_CurvaAbcCliente.FormCreate(Sender: TObject);
begin
  Tot:=0;
  Posi := 0;
end;

procedure Trpt_CurvaAbcCliente.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel15.Caption := Format('%.2f',[Tot]);
end;

procedure Trpt_CurvaAbcCliente.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Posi := Posi + 1;
  if fMxSelClienteCurva.CheckBox3.Checked then
  begin
    if Posi = 1 then
       SZRLabel23.Caption := 'A'
    else if Posi = StrToInt(fMxSelClienteCurva.Edit3.Text)+1 then
       SZRLabel23.Caption := 'B'
    else if Posi = StrToInt(fMxSelClienteCurva.Edit3.Text)+StrToInt(fMxSelClienteCurva.Edit5.Text)+1 then
       SZRLabel23.Caption := 'C'
    else if Posi = StrToInt(fMxSelClienteCurva.Edit3.Text)+StrToInt(fMxSelClienteCurva.Edit5.Text)+StrToInt(fMxSelClienteCurva.Edit6.Text)+1 then
       SZRLabel23.Caption := 'D'
    else
       SZRLabel23.Caption := ' ';
  end;
  Cliente2.Close;
  Cliente2.ParamByName('CLI_CODIGO').AsInteger := Cliente1.FieldByName('CLI_CODIGO').AsInteger;
  Cliente2.Open;
  SZRLabel20.Caption := Cliente2.FieldByName('CLI_RZ_SOCIAL').AsString;
  Pedido_de_Venda1.Close;
  Pedido_de_Venda1.ParamByName('CLI_CODIGO').AsInteger := Cliente2.FieldByName('CLI_CODIGO').AsInteger;
  Pedido_de_Venda1.Open;
  SZRLabel40.Caption := DateTimeToStr(Pedido_de_Venda1.FieldByName('PDV_DATA_HORA').AsDateTime);

  SZRLabel21.Caption := IntToStr(Posi);
  //
  SZRLabel12.Caption := Format('%.2f',[Cliente1.FieldByName('TOTAL_VENDA').AsFloat]);
  SZRLabel15.Caption := Format('%.2f',[Cliente1.FieldByName('QTD_PEDIDO').AsFloat]);
  SZRLabel18.Caption := Format('%.2f',[Cliente1.FieldByName('MED_VLR_PEDIDO').AsFloat]);
  SZRLabel19.Caption := Format('%.2f',[Cliente1.FieldByName('QTD_ITEM').AsFloat]);
  SZRLabel22.Caption := Format('%.2f',[Cliente1.FieldByName('MED_ITEM_PEDIDO').AsFloat]);
  SZRLabel32.Caption := Format('%.2f',[Cliente1.FieldByName('QTD_QUANTIDADE').AsFloat]);
  SZRLabel33.Caption := Format('%.2f',[Cliente1.FieldByName('MED_QUANTIDADE_PEDIDO').AsFloat]);
  SZRLabel34.Caption := Format('%.2f',[Cliente1.FieldByName('MED_QUANTIDADE_ITEM').AsFloat]);
  SZRLabel35.Caption := Format('%.2f',[Cliente1.FieldByName('MED_VLR_QUANTIDADE').AsFloat]);
  SZRLabel38.Caption := Format('%.2f',[Cliente1.FieldByName('MED_VLR_ITEM').AsFloat]);
end;

procedure Trpt_CurvaAbcCliente.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
