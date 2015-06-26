unit uMovCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, CategProd,
  CentroCusto, Usuario, Movimento_de_Cheque, Parametro;

type
  Trpt_MovCheque = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrlUsuario1: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRDBText1: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlTipo: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel12: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel14: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlSaldo: TSZRLabel;
    SZRGroup1: TSZRGroup;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlUsuarioMov: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlCodigo: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrlObservacao: TSZRLabel;
    Movimento_de_Cheque1: TMovimento_de_Cheque;
    SZRLabel3: TSZRLabel;
    SZRDBText2: TSZRDBText;
    zrlValor: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlUsuario1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TMovimento_de_Cheque;

  end;

var
  rpt_MovCheque: Trpt_MovCheque;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_MovCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_MovCheque.FormCreate(Sender: TObject);
begin
  Entidade := Movimento_de_Cheque1;
  if not Entidade.Active then
    Entidade.Open;
end;

procedure Trpt_MovCheque.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlValor.Caption := format('%.2f',[Entidade.Valor]);

  zrlTipo.Caption := DM.SelecionaParametro(Entidade.Tipo);

  //Definir Usuário
  zrlUsuarioMov.Caption := UpperCase(DM.NomeUsuario(Entidade.CodigoUSU));
  zrlObservacao.Caption := 'Maquina: '+IntToStr(Entidade.MaquinaMCH)+' '+Entidade.Observacao;
end;

procedure Trpt_MovCheque.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_MovCheque.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    with CentroCusto1 do
    Begin
      if Entidade.CodigoCNC <> CentroCusto1.CodigoCNC then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
        Open;
      end;
      zrlCentroDeCusto.Caption := 'Centro de Custo: '+RazaoSocial;
    end;
  end
  else if Entidade.CodigoCNC = 1 then
    zrlCentroDeCusto.Caption := '*** Matriz'
  else
    zrlCentroDeCusto.Caption := '*** Filial '+IntToStr(Entidade.CodigoCNC);
end;

procedure Trpt_MovCheque.zrlUsuario1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
