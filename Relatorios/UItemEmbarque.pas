unit UItemEmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, SQuery, Item_de_Embarque, Embarque, funcoes,
  Produto, Transportadora, Funcionario, CentroCusto;

type
  Trpt_ItemEmbarque = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRBand4: TSZRBand;
    ZRDBText3: TSZRDBText;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRDBText4: TSZRDBText;
    ZRDBText5: TSZRDBText;
    Produto1: TProduto;
    Embarque1: TEmbarque;
    Funcionario1: TFuncionario;
    Transportadora1: TTransportadora;
    Embarque1transportadora: TStringField;
    Transportadora1TRN_CODIGO: TIntegerField;
    Transportadora1CNC_CODIGO: TIntegerField;
    Transportadora1TRN_RZ_SOCIAL: TStringField;
    Funcionario1FUN_CODIGO: TIntegerField;
    Funcionario1CNC_CODIGO: TIntegerField;
    Funcionario1FUN_NOME: TStringField;
    Embarque1motorista: TStringField;
    Funcionario2: TFuncionario;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    Embarque1responsavel: TStringField;
    Embarque1resultado: TStringField;
    Embarque1EMB_CODIGO: TIntegerField;
    Embarque1CNC_CODIGO: TIntegerField;
    Embarque1EMB_DATA: TDateTimeField;
    Embarque1TRN_CODIGO: TIntegerField;
    Embarque1EMB_SITUACAO: TIntegerField;
    Embarque1EMB_OBSERVACAO: TStringField;
    Embarque1EMB_TOT_ITENS: TIntegerField;
    Embarque1EMB_FUN_MOTORISTA: TIntegerField;
    Embarque1EMB_FUN_RESP: TIntegerField;
    Embarque1EMB_CAMINHAO: TStringField;
    Embarque1EMB_FUN_TRAN: TIntegerField;
    Embarque1IEB_CODIGO: TIntegerField;
    Embarque1CNC_CODIGO_1: TIntegerField;
    Embarque1PRD_CODIGO: TIntegerField;
    Embarque1EMB_CODIGO_1: TIntegerField;
    Embarque1IEB_QUANTIDADE: TFloatField;
    Embarque1IEB_TIPO_ENT: TIntegerField;
    Embarque1IEB_CNC_CODIGO_ENT: TIntegerField;
    Embarque1IEB_ENT_CODIGO: TIntegerField;
    Embarque1IEB_DESTINO: TStringField;
    Embarque1IEB_SITUACAO: TIntegerField;
    Embarque1produto: TStringField;
    Embarque1referencia: TStringField;
    Embarque1tipo: TStringField;
    ZRLabel14: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRDBText10: TSZRDBText;
    Embarque1LocOri: TStringField;
    Embarque1CodOri: TStringField;
    Embarque1NumDoc: TStringField;
    CentroCusto1: TCentroCusto;
    ZRLabel21: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRBand2: TSZRBand;
    SZRLabel1: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    procedure Embarque1BeforeOpen(DataSet: TDataSet);
    procedure Embarque1CalcFields(DataSet: TDataSet);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_ItemEmbarque: Trpt_ItemEmbarque;

implementation
Uses UDM;
{$R *.DFM}

procedure Trpt_ItemEmbarque.Embarque1BeforeOpen(DataSet: TDataSet);
begin
  Embarque1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
end;

procedure Trpt_ItemEmbarque.Embarque1CalcFields(DataSet: TDataSet);
begin
  if Embarque1.FunTran=0 then
      Embarque1.FieldByName('resultado').AsString := Embarque1.FieldByName('motorista').AsString
  else if Embarque1.FunTran=1 then
      Embarque1.FieldByName('resultado').AsString := Embarque1.FieldByName('transportadora').AsString;

 if  Embarque1.FieldByName('IEB_TIPO_ENT').AsInteger = 0 then
 Begin
   Embarque1.FieldByName('tipo').AsString := 'Pedido de Venda';
   Embarque1.FieldByName('LocOri').AsString := DM.CentroCusto1.RazaoSocial;
   With DM.QR_Consultas2 do
   Begin
     Close;
     SQL.Text:='SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA WHERE IPV_CODIGO='+
             Embarque1.FieldByName('IEB_ENT_CODIGO').AsString+' AND CNC_CODIGO='+
             IntToStr(DM.Configuracao1.CodigoCNC);
     Open;
     If not IsEmpty then
     Begin
       Embarque1.FieldByName('CodOri').AsString := FieldByName('PDV_CODIGO').AsString;
       Embarque1.FieldByName('NumDoc').AsString := 'PDV-'+FieldByName('PDV_CODIGO').AsString+
                                                   '/'+IntToStr(DM.Configuracao1.CodigoCNC);
     End;
   End;
 end;
 if  Embarque1.FieldByName('IEB_TIPO_ENT').AsInteger=2 then
 Begin
   Embarque1.FieldByName('tipo').AsString := 'Transferencia';
   Embarque1.FieldByName('LocOri').AsString := DM.CentroCusto1.RazaoSocial;
   With DM.QR_Consultas2 do
   Begin
     Close;
     SQL.Text:='SELECT TRF_CODIGO FROM ITEM_DE_TRANSFERENCIA WHERE ITR_CODIGO='+
             Embarque1.FieldByName('IEB_ENT_CODIGO').AsString+' AND CNC_CODIGO='+
             IntToStr(DM.Configuracao1.CodigoCNC);
     Open;
     If not IsEmpty then
     Begin
       Embarque1.FieldByName('CodOri').AsString := FieldByName('TRF_CODIGO').AsString;
       Embarque1.FieldByName('NumDoc').AsString := 'TRF-'+FieldByName('TRF_CODIGO').AsString+
                                                   '/'+IntToStr(DM.Configuracao1.CodigoCNC);
     End;
   End;
 end;
end;

procedure Trpt_ItemEmbarque.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ItemEmbarque.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
end;

end.
