unit URel_Embar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, SQuery, Item_de_Embarque, Embarque,
  Produto, Transportadora, Funcionario, CentroCusto, funcoes;

type
  Trpt_embarque = class(TForm)
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
    ZRBand4: TSZRBand;
    ZRDBText5: TSZRDBText;
    Produto1: TProduto;
    Embarque1: TEmbarque;
    Funcionario1: TFuncionario;
    Transportadora1: TTransportadora;
    Transportadora1TRN_CODIGO: TIntegerField;
    Transportadora1CNC_CODIGO: TIntegerField;
    Transportadora1TRN_RZ_SOCIAL: TStringField;
    Funcionario1FUN_CODIGO: TIntegerField;
    Funcionario1CNC_CODIGO: TIntegerField;
    Funcionario1FUN_NOME: TStringField;
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
    Embarque1tipo: TStringField;
    Embarque1LocOri: TStringField;
    Embarque1CodOri: TStringField;
    Embarque1NumDoc: TStringField;
    CentroCusto1: TCentroCusto;
    ZRBand2: TSZRBand;
    SZRLabel1: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel23: TSZRLabel;
    SZRGroup1: TSZRGroup;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel15: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRDBText7: TSZRDBText;
    ZRDBText10: TSZRDBText;
    ZRLabel21: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRDBText11: TSZRDBText;
    ZRDBText13: TSZRDBText;
    zrlProduto: TSZRLabel;
    zrlMotoristaTransportadora: TSZRLabel;
    zrlFiltros: TSZRLabel;
    procedure Embarque1CalcFields(DataSet: TDataSet);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_embarque: Trpt_embarque;

implementation
Uses UDM;
{$R *.DFM}

procedure Trpt_embarque.Embarque1CalcFields(DataSet: TDataSet);
begin
 if  Embarque1.FieldByName('IEB_TIPO_ENT').AsInteger = 0 then
 Begin
   Embarque1.FieldByName('tipo').AsString := 'Pedido de Venda';
   Embarque1.FieldByName('LocOri').AsString := DM.CentroCusto1.RazaoSocial;
   With DM.QR_Consultas2 do
   Begin
     Close;
     SQL.Text:='SELECT CNC_CODIGO,PDV_CODIGO '+
       ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
       ' WHERE IPV_CODIGO='+Embarque1.FieldByName('IEB_ENT_CODIGO').AsString+
       ' AND CNC_CODIGO='+Embarque1.FieldByName('IEB_CNC_CODIGO_ENT').AsString;
     Open;
     If not IsEmpty then
     Begin
       Embarque1.FieldByName('CodOri').AsString := FieldByName('PDV_CODIGO').AsString;
       Embarque1.FieldByName('NumDoc').AsString := 'PDV-'+FieldByName('PDV_CODIGO').AsString+
                                                   '/'+FieldByName('CNC_CODIGO').AsString;
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
     SQL.Text:='SELECT CNC_CODIGO,TRF_CODIGO '+
       ' FROM ITEM_DE_TRANSFERENCIA '+
       ' WHERE ITR_CODIGO='+Embarque1.FieldByName('IEB_ENT_CODIGO').AsString+
       ' AND CNC_CODIGO='+Embarque1.FieldByName('IEB_CNC_CODIGO_ENT').AsString;
     Open;
     If not IsEmpty then
     Begin
       Embarque1.FieldByName('CodOri').AsString := FieldByName('TRF_CODIGO').AsString;
       Embarque1.FieldByName('NumDoc').AsString := 'TRF-'+FieldByName('TRF_CODIGO').AsString+
                                                   '/'+FieldByName('CNC_CODIGO').AsString;
     End;
   End;
 end;
end;

procedure Trpt_embarque.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_embarque.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
    if CodigoPRD <> Embarque1.FieldByName('PRD_CODIGO').asInteger then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Embarque1.FieldByName('PRD_CODIGO').asInteger;
      Open;
    end;
    zrlProduto.Caption := '('+IntToStr(CodigoPRD)+') '+Trim(Descricao)+Trim(Referencia);
  end;
end;

procedure Trpt_embarque.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Embarque1.FunTran=0 then
  Begin
    with Funcionario1 do
    Begin
      if CodigoFUN <> Embarque1.FunMotorista then
      Begin
        Close;
        ParamByName('FUN_CODIGO').asInteger := Embarque1.FunMotorista;
        Open;
      end;
      zrlMotoristaTransportadora.Caption := NomeFun;
    end;
  end
  else if Embarque1.FunTran=1 then
  Begin
    with Transportadora1 do
    Begin
      if CodigoTRN <> Embarque1.CodigoTRN then
      Begin
        Close;
        ParamByName('TRN_CODIGO').asInteger := Embarque1.CodigoTRN;
        Open;
      end;
      zrlMotoristaTransportadora.Caption := RazaoSocial;
    end;
  end;
end;

procedure Trpt_embarque.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
