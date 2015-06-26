unit UBaseReal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Item_Tabela_de_Precos_SubGrupo, SubGrupo, funcoes;

type
  Trpt_BaseReal = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    SZRGroup1: TSZRGroup;
    SZRLabel7: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel11: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel9: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SubGrupo1: TSubGrupo;
    SZRGroup2: TSZRGroup;
    ZRDBText4: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText4: TSZRDBText;
    zrlDescricao: TSZRLabel;
    SZRLabel4: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TSubGrupo;
  end;

var
  rpt_BaseReal: Trpt_BaseReal;

implementation
uses
 UDM;

{$R *.DFM}


procedure Trpt_BaseReal.FormCreate(Sender: TObject);
begin
  Entidade := SubGrupo1;
end;

procedure Trpt_BaseReal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_BaseReal.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_BaseReal.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_BaseReal.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_BaseReal.SZRGroup2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  i: integer;
  sDescricao: string;
begin
  sDescricao := UpperCase(SubGrupo1.FieldByName('PRD_DESCRICAO').asString);
  for i:=1 to Length(sDescricao) do
    if copy(sDescricao,i,5) = 'BASE ' then
      sDescricao := Copy(SubGrupo1.FieldByName('PRD_DESCRICAO').asString,i+5,
        Length(sDescricao)-i+4);

  if Length(sDescricao) <= zrlDescricao.Width then
    zrlDescricao.Caption := sDescricao
  else
    zrlDescricao.Caption := Copy(sDescricao,1,zrlDescricao.Width); 
end;

end.
