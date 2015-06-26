unit Urpt_Permissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, Log, SQuery, Permissao;

type
  Trpt_Permissao = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrbGrupoUSU: TSZRGroup;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    zrbDetalhe: TSZRBand;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText6: TSZRDBText;
    zrlUsuarioResp: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel10: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlDataINI: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    zrlOperacaoDoSistema: TSZRLabel;
    Permissao1: TPermissao;
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbGrupoUSUBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    TotalRegistros : integer;
  public
    Entidade: TPermissao;
  end;

var
  rpt_Permissao: Trpt_Permissao;

implementation

uses UDM, Funcoes;

{$R *.DFM}

procedure Trpt_Permissao.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Permissao.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Permissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  action:=cafree;
end;

procedure Trpt_Permissao.zrbGrupoUSUBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuarioResp.Caption := Entidade.FieldByName('USU_NOME').asString;
end;

procedure Trpt_Permissao.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Permissao.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_Permissao.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Length(Entidade.FieldByName('OPS_OPERACAO').asString) > zrlOperacaoDoSistema.Width then
    zrlOperacaoDoSistema.Caption := Copy(Entidade.FieldByName('OPS_OPERACAO').asString,1,zrlOperacaoDoSistema.Width)
  else
    zrlOperacaoDoSistema.Caption := Entidade.FieldByName('OPS_OPERACAO').asString;
  inc(TotalRegistros);
end;

procedure Trpt_Permissao.FormCreate(Sender: TObject);
begin
  TotalRegistros := 0;
  Entidade := Permissao1;
end;

end.
