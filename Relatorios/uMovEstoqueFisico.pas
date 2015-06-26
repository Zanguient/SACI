unit uMovEstoqueFisico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, CentroCusto;

type
  Trpt_MovEstoqueFisico = class(TForm)
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
    ZRLabel6: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRDBText9: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText1: TSZRDBText;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    Produto1: TQuery;
    SZRDBText5: TSZRDBText;
    SZRBand1: TSZRBand;
    SZRLabel12: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel18: TSZRLabel;
    zrlProduto: TSZRLabel;
    SZRDBText9: TSZRDBText;
    zrlTipoMovimento: TSZRLabel;
    SZRGroup1: TSZRGroup;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRDBText7: TSZRDBText;
    zrlCodigo: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlSaldoAnt: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlUsuarioRodape: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlCentroDeCustoDestino: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Estoque:String;
  end;

var
  rpt_MovEstoqueFisico: Trpt_MovEstoqueFisico;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_MovEstoqueFisico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Produto1.Active:=false;
  Action:=cafree;
end;

procedure Trpt_MovEstoqueFisico.FormCreate(Sender: TObject);
begin
  Produto1.Open;
end;

procedure Trpt_MovEstoqueFisico.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSaldoAnt.Caption   := format('%.2f',[Produto1.FieldByName('MEF_SALDO_ANT').asFloat]);
  zrlQuantidade.Caption := format('%.2f',[Produto1.FieldByName('MEF_QUANTIDADE').asFloat]);

  DM.SelecionaParametro(Produto1.FieldByName('MEF_TIPO_MOV').asInteger);

  (*</ Anderson Gonçalves 04-09-2010*)
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    if Produto1.FieldByName('MEF_TIPO_MOV').asInteger = 261 then
      zrlTipoMovimento.Caption := 'VENDA'
    else
    begin
      if not DM.Parametro1.IsEmpty then
        zrlTipoMovimento.Caption := DM.Parametro1.Descricao
      else
        zrlTipoMovimento.Caption := Produto1.FieldByName('MEF_TIPO_MOV').asString;
    end;
  end
  else
  begin
    if not DM.Parametro1.IsEmpty then
      zrlTipoMovimento.Caption := DM.Parametro1.Descricao
    else
      zrlTipoMovimento.Caption := Produto1.FieldByName('MEF_TIPO_MOV').asString;
  end;
  (*/>*)


  if Produto1.FieldByName('MEF_ES').asString = 'E' then
    SZRLabel18.Caption:=format('%.2f',[(Produto1.FieldByName('MEF_SALDO_ANT').asFloat+Produto1.FieldByName('MEF_QUANTIDADE').asFloat)])
  else
    SZRLabel18.Caption:=format('%.2f',[(Produto1.FieldByName('MEF_SALDO_ANT').asFloat-Produto1.FieldByName('MEF_QUANTIDADE').asFloat)]);

  //Definir Usuário
  zrlUsuario.Caption := UpperCase(DM.NomeUsuario(Produto1.FieldByName('USU_CODIGO').asInteger));
end;

procedure Trpt_MovEstoqueFisico.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
    zrlProduto.Caption := FieldByName('PRD_DESCRICAO').asString+' '+
      FieldByName('PRD_CARACTERISTICA').asString;
end;

procedure Trpt_MovEstoqueFisico.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_MovEstoqueFisico.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    with CentroCusto1 do
    Begin
      if Produto1.FieldByName('CNC_CODIGO').asInteger <> CentroCusto1.CodigoCNC then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Produto1.FieldByName('CNC_CODIGO').asInteger;
        Open;
      end;
      zrlCentroDeCusto.Caption := 'Centro de Custo: '+RazaoSocial;
    end;
  end
  else if Produto1.FieldByName('CNC_CODIGO').asInteger = 1 then
    zrlCentroDeCusto.Caption := '*** Matriz'
  else
    zrlCentroDeCusto.Caption := '*** Filial '+Produto1.FieldByName('CNC_CODIGO').asString;





  if Produto1.FieldByName('MEF_TIPO_MOV').asString = '365' then //Transferencia
  begin
    DM.QR_Consultas.Close;
    {DM.QR_Consultas.SQL.Text := 'SELECT CNC_RZ_SOCIAL FROM CENTRO_DE_CUSTO '+
                                ' WHERE CNC_CODIGO = ''' + Produto1.FieldByName('MEF_CNC_CODIGO_ENT').asString + ''' ';
    DM.QR_Consultas.Open;}
    {DM.QR_Consultas.SQL.Text := 'SELECT T2.CNC_RZ_SOCIAL FROM TRANSFERENCIA T1 '+
                                ' INNER JOIN CENTRO_DE_CUSTO T2 ON T1.TRF_CNC_DESTINO = T2.CNC_CODIGO '+
                                ' WHERE T1.TRF_CODIGO = ''' + Produto1.FieldByName('MEF_ENT_CODIGO').asString + ''' ';}
    DM.QR_Consultas.SQL.Text := 'SELECT CNC_RZ_SOCIAL FROM CENTRO_DE_CUSTO '+
                                ' WHERE CNC_CODIGO = ''' + Produto1.FieldByName('CNC_DESTINO').asString + ''' ';
    DM.QR_Consultas.Open;
    zrlCentroDeCustoDestino.Caption := 'Destino: ' + DM.QR_Consultas.FieldByName('CNC_RZ_SOCIAL').AsString;
  end
  else
    zrlCentroDeCustoDestino.Caption := '';
end;

procedure Trpt_MovEstoqueFisico.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuarioRodape.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
