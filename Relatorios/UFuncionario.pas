unit UFuncionario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Funcionario,
  CentroCusto;

type
  Trpt_funcionario = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText6: TSZRDBText;
    Funcionario1: TFuncionario;
    ZRDBText8: TSZRDBText;
    ZRDBText4: TSZRDBText;
    SZRGroup1: TSZRGroup;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    zrlEndereco: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    SZRDBText7: TSZRDBText;
    SZRDBText8: TSZRDBText;
    SZRDBText9: TSZRDBText;
    CentroCusto1: TCentroCusto;
    zrbGrupoSuperior: TSZRGroup;
    SZRLabel5: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRLabel13: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrbRodapeGrupoFuncao: TSZRBand;
    SZRLabel7: TSZRLabel;
    zrlLinhaDupla: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel34: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlParceiro: TSZRLabel;
    zrbGrupoFuncao: TSZRGroup;
    SZRLabel6: TSZRLabel;
    SZRDBText11: TSZRDBText;
    SZRLabel9: TSZRLabel;
    zrlSuperior: TSZRLabel;
    zrlQtdCliAdiplente: TSZRLabel;
    zrlQtdCliInadiplente: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlQtdCliSemParcelasAbertas: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoSuperiorBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros : integer;
  public
    Entidade: TFuncionario;
    vQtdCliente: Boolean;
  end;

var
  rpt_funcionario: Trpt_funcionario;

implementation
uses
  UDM, Funcoes;
{$R *.DFM}

procedure Trpt_funcionario.FormCreate(Sender: TObject);
begin
  Entidade := Funcionario1;
  TotalRegistros := 0;
  vQtdCliente := False;
end;

procedure Trpt_funcionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Entidade.Close;
 Action := cafree;
end;

procedure Trpt_funcionario.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_funcionario.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
  CentroCusto1.Open;
  SZRLabel3.Caption := CentroCusto1.RazaoSocial;
end;

procedure Trpt_funcionario.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_funcionario.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlEndereco.Caption := Trim(DM.SelecionaParametro(Entidade.Logradouro)+' '+Entidade.Endereco);

  if Entidade.Parceiro > 0 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FUN_APELIDO '+
        ' FROM FUNCIONARIO '+
        ' WHERE FUN_CODIGO='+IntToStr(Entidade.Parceiro);
      Open;
      zrlParceiro.Caption := FieldByName('FUN_APELIDO').asString;
    end;
  end
  else
    zrlParceiro.Caption := '';

  if vQtdCliente then
  Begin
    with DM.QR_Consultas do
    Begin
      //Sem Parcela em Aberto
      Close;
      SQL.Text := 'SELECT COUNT(DISTINCT CLI_CODIGO) AS QTD '+
        ' FROM PEDIDO_DE_VENDA PDV, ITEM_DE_PEDIDO_DE_VENDA IPV '+
        ' WHERE PDV.PDV_SITUACAO=4 '+
        ' AND IPV.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+
        ' AND PDV.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV.CNC_CODIGO=IPV.CNC_CODIGO '+
        ' AND PDV.PDV_CODIGO=IPV.PDV_CODIGO '+

        ' AND NOT EXISTS (SELECT CLI_CODIGO FROM TITULO_A_RECEBER TRC '+
        ' WHERE TRC.TRC_SITUACAO=0 '+
        ' AND TRC.CNC_CLIENTE=PDV.CNC_CLIENTE '+
        ' AND TRC.CLI_CODIGO=PDV.CLI_CODIGO) '+

        ' AND PDV.PDV_CODIGO=(SELECT MAX(PDV_CODIGO) '+
        ' FROM PEDIDO_DE_VENDA PDV2 '+
        ' WHERE PDV2.PDV_SITUACAO=4 '+
        ' AND PDV2.CNC_CLIENTE=PDV.CNC_CLIENTE '+
        ' AND PDV2.CLI_CODIGO=PDV.CLI_CODIGO)  ';
      Open;
      zrlQtdCliSemParcelasAbertas.Caption := FieldByName('QTD').asString;

      //Adiplente
      Close;
      SQL.Text := 'SELECT COUNT(DISTINCT CLI_CODIGO) AS QTD '+
        ' FROM PEDIDO_DE_VENDA PDV, ITEM_DE_PEDIDO_DE_VENDA IPV '+
        ' WHERE PDV.PDV_SITUACAO=4 '+
        ' AND IPV.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+
        ' AND PDV.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV.CNC_CODIGO=IPV.CNC_CODIGO '+
        ' AND PDV.PDV_CODIGO=IPV.PDV_CODIGO '+

        ' AND NOT EXISTS (SELECT CLI_CODIGO FROM TITULO_A_RECEBER TRC '+
        ' WHERE TRC.TRC_SITUACAO=0 '+
        ' AND TRC.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND TRC.CNC_CLIENTE=PDV.CNC_CLIENTE '+
        ' AND TRC.CLI_CODIGO=PDV.CLI_CODIGO) '+

        ' AND EXISTS (SELECT CLI_CODIGO FROM TITULO_A_RECEBER TRC '+
        ' WHERE TRC.TRC_SITUACAO=0 '+
        ' AND TRC.TRC_VENCIMENTO>="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND TRC.CNC_CLIENTE=PDV.CNC_CLIENTE '+
        ' AND TRC.CLI_CODIGO=PDV.CLI_CODIGO) '+

        ' AND PDV.PDV_CODIGO=(SELECT MAX(PDV_CODIGO) '+
        ' FROM PEDIDO_DE_VENDA PDV2 '+
        ' WHERE PDV2.PDV_SITUACAO=4 '+
        ' AND PDV2.CNC_CLIENTE=PDV.CNC_CLIENTE '+
        ' AND PDV2.CLI_CODIGO=PDV.CLI_CODIGO)  ';
      Open;
      zrlQtdCliAdiplente.Caption := FieldByName('QTD').asString;

      //Inadplente
      Close;
      SQL.Text := 'SELECT COUNT(DISTINCT CLI_CODIGO) AS QTD '+
        ' FROM PEDIDO_DE_VENDA PDV, ITEM_DE_PEDIDO_DE_VENDA IPV '+
        ' WHERE PDV.PDV_SITUACAO=4 '+
        ' AND IPV.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+
        ' AND PDV.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV.CNC_CODIGO=IPV.CNC_CODIGO '+
        ' AND PDV.PDV_CODIGO=IPV.PDV_CODIGO '+

        ' AND EXISTS (SELECT CLI_CODIGO FROM TITULO_A_RECEBER TRC '+
        ' WHERE TRC.TRC_SITUACAO=0 '+
        ' AND TRC.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND TRC.CNC_CLIENTE=PDV.CNC_CLIENTE '+
        ' AND TRC.CLI_CODIGO=PDV.CLI_CODIGO) '+

        ' AND PDV.PDV_CODIGO=(SELECT MAX(PDV_CODIGO) '+
        ' FROM PEDIDO_DE_VENDA PDV2 '+
        ' WHERE PDV2.PDV_SITUACAO=4 '+
        ' AND PDV2.CNC_CLIENTE=PDV.CNC_CLIENTE '+
        ' AND PDV2.CLI_CODIGO=PDV.CLI_CODIGO)  ';
      Open;
      zrlQtdCliInadiplente.Caption := FieldByName('QTD').asString;
    end;
  end;

  inc(TotalRegistros);
end;

procedure Trpt_funcionario.zrbGrupoSuperiorBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbGrupoSuperior.Height = 0 then
    Exit;

  if Entidade.Superior > 0 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FUN_APELIDO, FUN_PARCEIRO '+
        ' FROM FUNCIONARIO '+
        ' WHERE FUN_CODIGO='+IntToStr(Entidade.Superior);
      Open;
      zrlSuperior.Caption := FieldByName('FUN_APELIDO').asString;
    end;
  end
  else
    zrlSuperior.Caption := 'GERENTE NAO CADASTRADO';
end;

procedure Trpt_funcionario.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
