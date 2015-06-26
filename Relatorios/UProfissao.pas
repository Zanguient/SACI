unit UProfissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Profissao, funcoes;

type
  Trpt_Profissao = class(TForm)
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
    Profissao1: TProfissao;
    Profissao1CNC_ORIGEM: TIntegerField;
    Profissao1CNC_CODIGO: TIntegerField;
    Profissao1PRF_CODIGO: TIntegerField;
    Profissao1USU_CODIGO: TIntegerField;
    Profissao1PRF_DESCRICAO: TStringField;
    Profissao1PRF_DT_CADASTRO: TDateTimeField;
    Profissao1PRF_DT_ALTERADO: TDateTimeField;
    Profissao1PRF_SALARIO_INI: TFloatField;
    Profissao1PRF_SALARIO_FIM: TFloatField;
    Profissao1PRF_SITUACAO: TIntegerField;
    Profissao1PRF_OBSERVACAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TProfissao;
  end;

var
  rpt_Profissao: Trpt_Profissao;

implementation

uses UDM;

{$R *.DFM}

procedure Trpt_Profissao.FormCreate(Sender: TObject);
begin
  Entidade := Profissao1;
end;

procedure Trpt_Profissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_Profissao.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeEmpresa.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Profissao.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

end.
