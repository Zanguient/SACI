unit UControleVeiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Veiculo,
  Controle_de_Veiculo, funcoes;

type
  Trpt_ControleVeiculo = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlNomeEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRDBText3: TSZRDBText;
    zrlUsuario: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    Controle_de_Veiculo1: TControle_de_Veiculo;
    SZRLabel4: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlFiltros: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel7: TSZRLabel;
    zrlTipo: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlDtFinal: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlDtInicial: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TControle_de_Veiculo;
  end;

var
  rpt_ControleVeiculo: Trpt_ControleVeiculo;

implementation

uses UDM;

{$R *.DFM}

procedure Trpt_ControleVeiculo.FormCreate(Sender: TObject);
begin
  Entidade := Controle_de_Veiculo1;
end;

procedure Trpt_ControleVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Active := false;
 Action := cafree;
end;

procedure Trpt_ControleVeiculo.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeEmpresa.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ControleVeiculo.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

procedure Trpt_ControleVeiculo.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.DataInicial > 0 then
    zrlDtInicial.Caption := DateToStr(Entidade.DataInicial)
  else
    zrlDtInicial.Caption := '';

  if Entidade.DataFinal > 0 then
    zrlDtFinal.Caption := DateToStr(Entidade.DataFinal)
  else
    zrlDtFinal.Caption := '';

  case Entidade.Tipo of
    0: zrlTipo.Caption := 'KILOMETRAGEM';
    1: zrlTipo.Caption := 'GASOLINA';
    2: zrlTipo.Caption := 'ALCOOL';
    3: zrlTipo.Caption := 'DISEL';
    4: zrlTipo.Caption := 'OLEO';
    5: zrlTipo.Caption := 'MANUTENCAO';
  end;
end;

end.
