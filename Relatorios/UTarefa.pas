unit UTarefa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Tarefa;

type
  Trpt_Tarefa = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
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
    zrlLinhaDupla: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlFiltros: TSZRLabel;
    Tarefa1: TTarefa;
    SZRLabel4: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    zrlDescTipo: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    zrlTipo: TSZRLabel;
    SZRDBText7: TSZRDBText;
    zrgGrupoUSU: TSZRGroup;
    SZRLabel5: TSZRLabel;
    SZRDBText8: TSZRDBText;
    zrlResponsavel: TSZRLabel;
    SZRLabel6: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TTarefa;
  end;

var
  rpt_Tarefa: Trpt_Tarefa;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_Tarefa.FormCreate(Sender: TObject);
begin
  Entidade := Tarefa1;
end;

procedure Trpt_Tarefa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_Tarefa.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Tarefa.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Tarefa.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with DM.QR_Consultas do
  Begin
    //Selecionar o Tipo de Parâmetro
    Close;
    SQL.Text := 'SELECT PAR_DESCRICAO '+
      ' FROM PARAMETRO '+
      ' WHERE PAR_CODIGO='+IntToStr(Entidade.Tipo);
    Open;
    zrlTipo.Caption := FieldByName('PAR_DESCRICAO').asString;

    //Selecionar o Responsável
    Close;
    SQL.Text := 'SELECT USU_NOME '+
      ' FROM USUARIO '+
      ' WHERE USU_CODIGO='+IntToStr(Entidade.CodigoResponsavel);
    Open;
    zrlResponsavel.Caption := FieldByName('USU_NOME').asString;
  end;
end;

end.
