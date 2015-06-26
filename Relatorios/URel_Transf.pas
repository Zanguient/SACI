unit URel_Transf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, SQuery, Item_de_Embarque, Embarque, funcoes,
  Produto, Transportadora, Funcionario, CentroCusto, Transferencia;

type
  Trpt_transferencia = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlNomeEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel7: TSZRLabel;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRDBText13: TSZRDBText;
    zrlGrupoTRF: TSZRGroup;
    ZRBand4: TSZRBand;
    ZRDBText3: TSZRDBText;
    ZRLabel15: TSZRLabel;
    ZRLabel18: TSZRLabel;
    Produto1: TProduto;
    ZRLabel14: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRDBText10: TSZRDBText;
    ZRLabel21: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    ZRLabel22: TSZRLabel;
    ZRLabel23: TSZRLabel;
    Transferencia1: TTransferencia;
    Transferencia1TRF_CODIGO: TIntegerField;
    Transferencia1CNC_CODIGO: TIntegerField;
    Transferencia1TRF_DATA: TDateTimeField;
    Transferencia1TRF_SITUACAO: TIntegerField;
    Transferencia1TRF_TOT_ITENS: TIntegerField;
    Transferencia1TRF_CNC_ORIGEM: TIntegerField;
    Transferencia1TRF_CNC_DESTINO: TIntegerField;
    Transferencia1CNC_CODIGO_1: TIntegerField;
    Transferencia1ITR_CODIGO: TIntegerField;
    Transferencia1PRD_CODIGO: TIntegerField;
    Transferencia1TRF_CODIGO_1: TIntegerField;
    Transferencia1ITR_SITUACAO: TIntegerField;
    ZRLabel10: TSZRLabel;
    ZRDBText11: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRDBText12: TSZRDBText;
    ZRLabel24: TSZRLabel;
    CentroCusto1: TCentroCusto;
    Transferencia1DESTINO: TStringField;
    Transferencia1situacao: TStringField;
    Transferencia1NumDoc: TStringField;
    ZRDBText1: TSZRDBText;
    ZRLabel25: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    ZRLabel6: TSZRLabel;
    Transferencia1USU_CODIGO: TIntegerField;
    Transferencia1TRF_DT_ALTERADO: TDateTimeField;
    Transferencia1ITR_QUANTIDADE: TFloatField;
    Transferencia1TRF_AUTOMATICA: TIntegerField;
    Transferencia1TRF_OBSERVACAO: TStringField;
    SZRLabel6: TSZRLabel;
    SZRDBText1: TSZRDBText;
    Transferencia1TRF_NOTA_FISCAL: TIntegerField;
    Transferencia1Produto: TStringField;
    zrlUsuario: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    procedure Transferencia1CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    SomaQuantidades: Double;
  end;

var
  rpt_transferencia: Trpt_transferencia;

implementation
Uses UDM;
{$R *.DFM}      

procedure Trpt_transferencia.Transferencia1CalcFields(DataSet: TDataSet);
begin
  Case Transferencia1.Situacao of
    0: Transferencia1.FieldByName('SITUACAO').asString:='Solicitada';
    1: Transferencia1.FieldByName('SITUACAO').asString:='Processada';
    2: Transferencia1.FieldByName('SITUACAO').asString:='Embarcada';
    3: Transferencia1.FieldByName('SITUACAO').asString:='Recebida';
    4: Transferencia1.FieldByName('SITUACAO').asString:='Cancelada';
   End;
   Transferencia1.FieldByName('NumDoc').AsString := 'TRF'+Transferencia1.FieldByName('TRF_CODIGO').
   AsString+'/'+IntToStr(DM.Configuracao1.CodigoCNC)+'-'+FormatDateTime('dd.mm.yyyy',
   Transferencia1.FieldByName('TRF_DATA').asDateTime);

   with Produto1 do
   Begin
     Close;
     ParamByName('PRD_CODIGO').asinteger := Transferencia1.FieldByname('PRD_CODIGO').asInteger;
     Open;
     Transferencia1.FieldByName('Produto').AsString := Trim(Descricao+' '+Caracteristica)+' '+Referencia+' '+Marca;
   end;
end;

procedure Trpt_transferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_transferencia.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeEmpresa.Caption := DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_transferencia.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel5.Caption:=format('%.2f',[Transferencia1.FieldByName('ITR_QUANTIDADE').asfloat]);

  //Alan - 16/03/2006 Acrescentar o soma das quantidades no relatorio de transferencia.
  SomaQuantidades := SomaQuantidades + Transferencia1.FieldByName('ITR_QUANTIDADE').asfloat;
end;

procedure Trpt_transferencia.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

procedure Trpt_transferencia.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel8.Caption:=format('%.2f',[SomaQuantidades]);
  SomaQuantidades := 0; 
end;

end.
