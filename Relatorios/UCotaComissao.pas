unit UCotaComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Funcionario,
  Item_de_Cota;

type
  Trpt_CotaComissao = class(TForm)
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
    zrlUsuario: TSZRLabel;
    SZRDBText2: TSZRDBText;
    Item_de_Cota1: TItem_de_Cota;
    Funcionario1: TFuncionario;
    SZRGroup1: TSZRGroup;
    ZRLabel6: TSZRLabel;
    ZRLabel9: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlMesAno: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlUsuarioCota: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlCadastro: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlAlterado: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlFuncionario: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRDBText9: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRDBText11: TSZRDBText;
    SZRDBText12: TSZRDBText;
    SZRDBText13: TSZRDBText;
    SZRDBText14: TSZRDBText;
    SZRDBText15: TSZRDBText;
    SZRDBText16: TSZRDBText;
    SZRDBText17: TSZRDBText;
    SZRDBText18: TSZRDBText;
    Item_de_Cota1CNC_CODIGO: TIntegerField;
    Item_de_Cota1COT_CODIGO: TIntegerField;
    Item_de_Cota1USU_CODIGO: TIntegerField;
    Item_de_Cota1COT_DT_CADASTRO: TDateTimeField;
    Item_de_Cota1COT_DT_ALTERADO: TDateTimeField;
    Item_de_Cota1COT_MES: TIntegerField;
    Item_de_Cota1COT_ANO: TIntegerField;
    Item_de_Cota1COT_DIAS_UTEIS: TIntegerField;
    Item_de_Cota1COT_DIAS_NAO_UTEIS: TIntegerField;
    Item_de_Cota1CNC_CODIGO_1: TIntegerField;
    Item_de_Cota1ICA_CODIGO: TIntegerField;
    Item_de_Cota1COT_CODIGO_1: TIntegerField;
    Item_de_Cota1FUN_CODIGO: TIntegerField;
    Item_de_Cota1ICA_COTA1: TFloatField;
    Item_de_Cota1ICA_COTA2: TFloatField;
    Item_de_Cota1ICA_COTA3: TFloatField;
    Item_de_Cota1ICA_COMISSAO1: TFloatField;
    Item_de_Cota1ICA_COMISSAO2: TFloatField;
    Item_de_Cota1ICA_COMISSAO3: TFloatField;
    Item_de_Cota1ICA_COTA4: TFloatField;
    Item_de_Cota1ICA_COMISSAO4: TFloatField;
    Item_de_Cota1ICA_COTA10: TFloatField;
    Item_de_Cota1ICA_COTA20: TFloatField;
    Item_de_Cota1ICA_COTA30: TFloatField;
    Item_de_Cota1ICA_COTA40: TFloatField;
    Item_de_Cota1ICA_COMISSAO10: TFloatField;
    Item_de_Cota1ICA_COMISSAO20: TFloatField;
    Item_de_Cota1ICA_COMISSAO30: TFloatField;
    Item_de_Cota1ICA_COMISSAO40: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade : TItem_de_Cota;
  end;

var
  rpt_CotaComissao: Trpt_CotaComissao;

implementation

uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_CotaComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Funcionario1.Close;
  Action := cafree;
end;

procedure Trpt_CotaComissao.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Cota1;
  Funcionario1.Close;
end;

procedure Trpt_CotaComissao.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_CotaComissao.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_CotaComissao.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Funcionario1 do
  Begin
    if (Entidade.CodigoFUN<>CodigoFUN) or
       ((DM.Configuracao1.Empresa IN [empEletro,empPetromax]) and (Entidade.CodigoCNC<>CodigoCNC)) then
    Begin
      Close;
      try
        ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      except
      end;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
      Open;
    end;
    zrlFuncionario.Caption := Apelido;
  end;
end;

procedure Trpt_CotaComissao.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption := EmpresaDesenvolvedora;
end;

procedure Trpt_CotaComissao.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.FieldByName('COT_DT_CADASTRO').asDateTime > 0 then
    zrlCadastro.Caption := DateToStr(Entidade.FieldByName('COT_DT_CADASTRO').asDateTime);
  if Entidade.FieldByName('COT_DT_ALTERADO').asDateTime > 0 then
    zrlAlterado.Caption := DateToStr(Entidade.FieldByName('COT_DT_ALTERADO').asDateTime);
  case Entidade.FieldByName('COT_MES').asInteger of
     1: zrlMesAno.Caption := 'Janeiro/'+Entidade.FieldByName('COT_ANO').asString;
     2: zrlMesAno.Caption := 'Fevereiro/'+Entidade.FieldByName('COT_ANO').asString;
     3: zrlMesAno.Caption := 'Marco/'+Entidade.FieldByName('COT_ANO').asString;
     4: zrlMesAno.Caption := 'Abril/'+Entidade.FieldByName('COT_ANO').asString;
     5: zrlMesAno.Caption := 'Maio/'+Entidade.FieldByName('COT_ANO').asString;
     6: zrlMesAno.Caption := 'Junho/'+Entidade.FieldByName('COT_ANO').asString;
     7: zrlMesAno.Caption := 'Julho/'+Entidade.FieldByName('COT_ANO').asString;
     8: zrlMesAno.Caption := 'Agosto/'+Entidade.FieldByName('COT_ANO').asString;
     9: zrlMesAno.Caption := 'Setembro/'+Entidade.FieldByName('COT_ANO').asString;
    10: zrlMesAno.Caption := 'Outubro/'+Entidade.FieldByName('COT_ANO').asString;
    11: zrlMesAno.Caption := 'Novembro/'+Entidade.FieldByName('COT_ANO').asString;
    12: zrlMesAno.Caption := 'Dezembro/'+Entidade.FieldByName('COT_ANO').asString;
  end;

  zrlUsuarioCota.Caption := UpperCase(DM.NomeUsuario(Entidade.FieldByName('USU_CODIGO').asInteger));
end;

end.
