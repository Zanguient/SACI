unit USubgrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo,
  SubGrupo, funcoes;

type
  Trpt_subgrupo = class(TForm)
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
    ZRDBText2: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    SubGrupo1: TSubGrupo;
    Grupo1: TGrupo;
    SubGrupo1SGP_CODIGO: TIntegerField;
    SubGrupo1CNC_CODIGO: TIntegerField;
    SubGrupo1GRP_CODIGO: TIntegerField;
    SubGrupo1GRP_DESCRICAO: TStringField;
    ZRDBText3: TSZRDBText;
    ZRLabel10: TSZRLabel;
    SubGrupo1SGP_DESCRICAO: TStringField;
    SubGrupo1SGP_OBSERVACAO: TStringField;
    zrlUsuario: TSZRLabel;
    SubGrupo1SGP_BASE_CHAVE: TStringField;
    SubGrupo1SGP_FAMILIA: TStringField;
    SubGrupo1SGP_SITUACAO: TIntegerField;
    SubGrupo1SGP_DT_CADASTRO: TDateTimeField;
    SubGrupo1SGP_DT_ALTERADO: TDateTimeField;
    SubGrupo1USU_CODIGO: TIntegerField;
    zrlSubGrupo: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SubGrupo1SGP_INDICE_REFRACAO: TFloatField;
    SubGrupo1SGP_FABRICAR: TIntegerField;
    SubGrupo1SGP_PRECO_DOLAR: TIntegerField;
    SubGrupo1SGP_EIXOS: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TSubGrupo;
  end;

var
  rpt_subgrupo: Trpt_subgrupo;

implementation
uses
  UDM;

{$R *.DFM}

procedure Trpt_subgrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Grupo1.Close;
  Action := cafree;
end;

procedure Trpt_subgrupo.FormCreate(Sender: TObject);
begin
  Entidade := SubGrupo1;
  Grupo1.Open;
end;

procedure Trpt_subgrupo.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_subgrupo.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_subgrupo.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_subgrupo.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Length(Entidade.Descricao) <= zrlSubGrupo.Width then
    zrlSubGrupo.Caption := Entidade.Descricao
  else
    zrlSubGrupo.Caption := Copy(Entidade.Descricao,1,zrlSubGrupo.Width);
end;

end.
