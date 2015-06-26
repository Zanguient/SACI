unit UGrau;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grau,
  Grupo, SubGrupo, funcoes;

type
  Trpt_Grau = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText3: TSZRDBText;
    zrlUsuario: TSZRLabel;
    zrbGrupoGRP: TSZRGroup;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText19: TSZRDBText;
    Grau1: TGrau;
    Grau1GRP_CODIGO: TIntegerField;
    Grau1SGP_CODIGO: TIntegerField;
    Grau1GRA_CH: TIntegerField;
    Grau1GRA_SITUACAO: TIntegerField;
    Grau1GRA_OBSERVACAO: TStringField;
    Grau1GRA_DEFINIR_OLHO: TIntegerField;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    Grau1GRA_CODIGO: TIntegerField;
    zrlGrupo: TSZRLabel;
    zrbGrupoSGP: TSZRGroup;
    SZRLabel4: TSZRLabel;
    zrlSubGrupo: TSZRLabel;
    Grau1CNC_CODIGO: TIntegerField;
    Grau1USU_CODIGO: TIntegerField;
    Grau1GRA_DT_CADASTRO: TDateTimeField;
    Grau1GRA_DT_ALTERADO: TDateTimeField;
    Grau1GRA_GRAU: TStringField;
    Grau1GRA_BASE: TIntegerField;
    Grau1GRA_CB: TIntegerField;
    zrlFiltros: TSZRLabel;
    zrlBaseCHCB: TSZRLabel;
    zrlDefinirOlho: TSZRLabel;
    zrbRodapeGrupoGRP: TSZRBand;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrbRodapeGrupoSGP: TSZRBand;
    SZRLabel5: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoGRPBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrlGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlSubGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade:tgRAU;
    { Public declarations }
  end;

var
  rpt_Grau: Trpt_Grau;

implementation
uses
  UDM;

{$R *.DFM}

procedure Trpt_Grau.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_Grau.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Grau.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Grau.zrbRodapePaginaBeforePrint(Sender: TObject;
 var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Grau.zrbGrupoGRPBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
{  With dm.cliente1 do
  begin
    close;
    sql.text:='SELECT CNC_CODIGO,CLI_CODIGO, CLI_RZ_SOCIAL '+
      ' FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+inttostr(entidade.ClienteCNC)+
      ' AND CLI_CODIGO='+inttostr(entidade.CodigoCLI);
    open;
    szlCliente.caption:=RazaoSocial+' ('+inttostr(CodigoCLI)+')';
  end;}
end;

procedure Trpt_Grau.FormCreate(Sender: TObject);
begin
    Entidade:=GRAU1;
end;

procedure Trpt_Grau.zrlGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  With grupo1 do
  begin
    Close;
    sql.Text:='SELECT * FROM GRUPO WHERE GRP_CODIGO ='+IntToStr(Entidade.CodigoGRP);
    Open;
    zrlGrupo.Caption := Descricao+' ('+IntToStr(CodigoGRP)+')';
  end;
end;

procedure Trpt_Grau.zrlSubGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  With subgrupo1 do
  begin
    Close;
    sql.Text:='SELECT * FROM SUBGRUPO WHERE SGP_CODIGO ='+inttostr(Entidade.CodigoSGP);
    Open;
    zrlSubGrupo.Caption := Descricao+' ('+IntToStr(CodigoSGP)+')';
  end;
end;

procedure Trpt_Grau.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.Base then
    zrlBaseCHCB.Caption := 'Base'
  else if Entidade.CH then
    zrlBaseCHCB.Caption := 'CH'
  else if Entidade.CB then
    zrlBaseCHCB.Caption := 'CB'
  else
    zrlBaseCHCB.Caption := '';

  if Entidade.DefinirOlho then
    zrlDefinirOlho.Caption := 'SIM'
  else
    zrlDefinirOlho.Caption := 'NAO';
end;

end.
