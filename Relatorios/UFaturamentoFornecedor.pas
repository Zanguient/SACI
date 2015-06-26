unit UFaturamentoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Fornecedor;

type
  Trpt_FaturamentoFornecedor = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrbRodape: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrlDataINI: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    zrbGrupoDiaMesAno: TSZRGroup;
    SZRLabel4: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel25: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlFornecedor7: TSZRLabel;
    zrlFornecedor6: TSZRLabel;
    zrlFornecedor5: TSZRLabel;
    zrlFornecedor4: TSZRLabel;
    zrlFornecedor3: TSZRLabel;
    zrlFornecedor2: TSZRLabel;
    zrlFornecedor1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlDescDiaMesAno: TSZRLabel;
    zrlRodapeGeral: TSZRBand;
    zrlGeralOutrosFor7: TSZRLabel;
    zrlGeralOutrosOutros: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlGeralOutrosFor4: TSZRLabel;
    zrlGeralOutrosFor5: TSZRLabel;
    zrlGeralOutrosFor6: TSZRLabel;
    zrlGeralOutrosFor1: TSZRLabel;
    zrlGeralOutrosFor2: TSZRLabel;
    zrlGeralOutrosFor3: TSZRLabel;
    zrlGeralOutrosDevFor7: TSZRLabel;
    zrlGeralOutrosDevOutros: TSZRLabel;
    zrlGeralOutrosDevFor4: TSZRLabel;
    zrlGeralOutrosDevFor5: TSZRLabel;
    zrlGeralOutrosDevFor6: TSZRLabel;
    zrlGeralOutrosDevFor1: TSZRLabel;
    zrlGeralOutrosDevFor2: TSZRLabel;
    zrlGeralOutrosDevFor3: TSZRLabel;
    zrlGeralFaturamentoFor7: TSZRLabel;
    zrlGeralFaturamentoOutros: TSZRLabel;
    zrlGeralFaturamentoFor4: TSZRLabel;
    zrlGeralFaturamentoFor5: TSZRLabel;
    zrlGeralFaturamentoFor6: TSZRLabel;
    zrlGeralFaturamentoFor1: TSZRLabel;
    zrlGeralFaturamentoFor2: TSZRLabel;
    zrlGeralFaturamentoFor3: TSZRLabel;
    zrlGeralDevolucaoFor7: TSZRLabel;
    zrlGeralDevolucaoOutros: TSZRLabel;
    zrlGeralDevolucaoFor4: TSZRLabel;
    zrlGeralDevolucaoFor5: TSZRLabel;
    zrlGeralDevolucaoFor6: TSZRLabel;
    zrlGeralDevolucaoFor1: TSZRLabel;
    zrlGeralDevolucaoFor2: TSZRLabel;
    zrlGeralDevolucaoFor3: TSZRLabel;
    zrlGeralLiquidoFor7: TSZRLabel;
    zrlGeralLiquidoOutros: TSZRLabel;
    zrlGeralLiquidoFor4: TSZRLabel;
    zrlGeralLiquidoFor5: TSZRLabel;
    zrlGeralLiquidoFor6: TSZRLabel;
    zrlGeralLiquidoFor1: TSZRLabel;
    zrlGeralLiquidoFor2: TSZRLabel;
    zrlGeralLiquidoFor3: TSZRLabel;
    zrlGeralLiquidoTotal: TSZRLabel;
    zrlGeralDevolucaoTotal: TSZRLabel;
    zrlGeralFaturamentoTotal: TSZRLabel;
    zrlGeralOutrosDevTotal: TSZRLabel;
    zrlGeralOutrosTotal: TSZRLabel;
    SZRLabel64: TSZRLabel;
    zrlOutrosFor7: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    zrlOutrosFor4: TSZRLabel;
    zrlOutrosFor5: TSZRLabel;
    zrlOutrosFor6: TSZRLabel;
    zrlOutrosFor1: TSZRLabel;
    zrlOutrosFor2: TSZRLabel;
    zrlOutrosFor3: TSZRLabel;
    zrlOutrosDevFor7: TSZRLabel;
    zrlOutrosDevFor4: TSZRLabel;
    zrlOutrosDevFor5: TSZRLabel;
    zrlOutrosDevFor6: TSZRLabel;
    zrlOutrosDevFor1: TSZRLabel;
    zrlOutrosDevFor2: TSZRLabel;
    zrlOutrosDevFor3: TSZRLabel;
    zrlFaturamentoFor7: TSZRLabel;
    zrlFaturamentoFor4: TSZRLabel;
    zrlFaturamentoFor5: TSZRLabel;
    zrlFaturamentoFor6: TSZRLabel;
    zrlFaturamentoFor1: TSZRLabel;
    zrlFaturamentoFor2: TSZRLabel;
    zrlFaturamentoFor3: TSZRLabel;
    zrlDevolucaoFor7: TSZRLabel;
    zrlDevolucaoFor4: TSZRLabel;
    zrlDevolucaoFor5: TSZRLabel;
    zrlDevolucaoFor6: TSZRLabel;
    zrlDevolucaoFor1: TSZRLabel;
    zrlDevolucaoFor2: TSZRLabel;
    zrlDevolucaoFor3: TSZRLabel;
    zrlLiquidoFor7: TSZRLabel;
    zrlLiquidoFor4: TSZRLabel;
    zrlLiquidoFor5: TSZRLabel;
    zrlLiquidoFor6: TSZRLabel;
    zrlLiquidoFor1: TSZRLabel;
    zrlLiquidoFor2: TSZRLabel;
    zrlLiquidoFor3: TSZRLabel;
    zrlLiquidoOutros: TSZRLabel;
    zrlDevolucaoOutros: TSZRLabel;
    zrlFaturamentoOutros: TSZRLabel;
    zrlOutrosDevOutros: TSZRLabel;
    zrlOutrosOutros: TSZRLabel;
    zrlOutrosTotal: TSZRLabel;
    zrlOutrosDevTotal: TSZRLabel;
    zrlFaturamentoTotal: TSZRLabel;
    zrlDevolucaoTotal: TSZRLabel;
    zrlLiquidoTotal: TSZRLabel;
    Fornecedor1: TFornecedor;
    Fornecedor2: TFornecedor;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlRodapeGeralBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoDiaMesAnoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
//      vOutrosGeral, vOutrosDevGeral, vFaturaGeral, vFaturaDevGeral, vLiqGeral: Double;
  public
    vQtdFornecedores, vDiaMesAno: integer;
    sCodigoGRP, sCodigoSGP, sCodigoFOR, sCodigoCNC:string;
    Entidade : TFornecedor;
  end;

var
  rpt_FaturamentoFornecedor: Trpt_FaturamentoFornecedor;

implementation
Uses
  UDM, Funcoes, MxSelFaturamentoFornecedor;
{$R *.DFM}

procedure Trpt_FaturamentoFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure Trpt_FaturamentoFornecedor.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;

  if vQtdFornecedores < 1 then
    zrlFornecedor1.Caption := '-'
  else
  Begin
    with Fornecedor2 do
    Begin
      if CodigoFOR <> StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR1.Text) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR1.Text);
        Open;
      end;
      if Length(AbreviarNome(RazaoSocial)) <= zrlFornecedor1.Width then
        zrlFornecedor1.Caption := AbreviarNome(RazaoSocial)
      else
        zrlFornecedor1.Caption := Copy(AbreviarNome(RazaoSocial),1,zrlFornecedor1.Width);
    end;
  end;

  if vQtdFornecedores < 2 then
    zrlFornecedor2.Caption := '-'
  else
  Begin
    with Fornecedor2 do
    Begin
      if CodigoFOR <> StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR2.Text) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR2.Text);
        Open;
      end;
      if Length(AbreviarNome(RazaoSocial)) <= zrlFornecedor2.Width then
        zrlFornecedor2.Caption := AbreviarNome(RazaoSocial)
      else
        zrlFornecedor2.Caption := Copy(AbreviarNome(RazaoSocial),1,zrlFornecedor2.Width);
    end;
  end;

  if vQtdFornecedores < 3 then
    zrlFornecedor3.Caption := '-'
  else
  Begin
    with Fornecedor2 do
    Begin
      if CodigoFOR <> StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR3.Text) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR3.Text);
        Open;
      end;
      if Length(AbreviarNome(RazaoSocial)) <= zrlFornecedor3.Width then
        zrlFornecedor3.Caption := AbreviarNome(RazaoSocial)
      else
        zrlFornecedor3.Caption := Copy(AbreviarNome(RazaoSocial),1,zrlFornecedor3.Width);
    end;
  end;

  if vQtdFornecedores < 4 then
    zrlFornecedor4.Caption := '-'
  else
  Begin
    with Fornecedor2 do
    Begin
      if CodigoFOR <> StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR4.Text) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR4.Text);
        Open;
      end;
      if Length(AbreviarNome(RazaoSocial)) <= zrlFornecedor4.Width then
        zrlFornecedor4.Caption := AbreviarNome(RazaoSocial)
      else
        zrlFornecedor4.Caption := Copy(AbreviarNome(RazaoSocial),1,zrlFornecedor4.Width);
    end;
  end;

  if vQtdFornecedores < 5 then
    zrlFornecedor5.Caption := '-'
  else
  Begin
    with Fornecedor2 do
    Begin
      if CodigoFOR <> StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR5.Text) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR5.Text);
        Open;
      end;
      if Length(AbreviarNome(RazaoSocial)) <= zrlFornecedor5.Width then
        zrlFornecedor5.Caption := AbreviarNome(RazaoSocial)
      else
        zrlFornecedor5.Caption := Copy(AbreviarNome(RazaoSocial),1,zrlFornecedor5.Width);
    end;
  end;

  if vQtdFornecedores < 6 then
    zrlFornecedor6.Caption := '-'
  else
  Begin
    with Fornecedor2 do
    Begin
      if CodigoFOR <> StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR6.Text) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR6.Text);
        Open;
      end;
      if Length(AbreviarNome(RazaoSocial)) <= zrlFornecedor6.Width then
        zrlFornecedor6.Caption := AbreviarNome(RazaoSocial)
      else
        zrlFornecedor6.Caption := Copy(AbreviarNome(RazaoSocial),1,zrlFornecedor6.Width);
    end;
  end;

  if vQtdFornecedores < 7 then
    zrlFornecedor7.Caption := '-'
  else
  Begin
    with Fornecedor2 do
    Begin
      if CodigoFOR <> StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR7.Text) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(fMxSelFaturamentoFornecedor.edtCodigoFOR7.Text);
        Open;
      end;
      if Length(AbreviarNome(RazaoSocial)) <= zrlFornecedor7.Width then
        zrlFornecedor7.Caption := AbreviarNome(RazaoSocial)
      else
        zrlFornecedor7.Caption := Copy(AbreviarNome(RazaoSocial),1,zrlFornecedor7.Width);
    end;
  end;
end;

procedure Trpt_FaturamentoFornecedor.zrbRodapeBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel16.Caption := EmpresaDesenvolvedora;
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

procedure Trpt_FaturamentoFornecedor.zrlRodapeGeralBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  //Exibir Geral Fornecedor1
  if vQtdFornecedores >= 1 then
  Begin
    zrlGeralOutrosFor1.Caption      := format('%.2f',[0.0]);
    zrlGeralOutrosDevFor1.Caption   := format('%.2f',[0.0]);
    zrlGeralFaturamentoFor1.Caption := format('%.2f',[0.0]);
    zrlGeralDevolucaoFor1.Caption   := format('%.2f',[0.0]);
    zrlGeralLiquidoFor1.Caption     := format('%.2f',[0.0]);
  end;

  //Exibir Geral Fornecedor2
  if vQtdFornecedores >= 2 then
  Begin
    zrlGeralOutrosFor2.Caption      := format('%.2f',[0.0]);
    zrlGeralOutrosDevFor2.Caption   := format('%.2f',[0.0]);
    zrlGeralFaturamentoFor2.Caption := format('%.2f',[0.0]);
    zrlGeralDevolucaoFor2.Caption   := format('%.2f',[0.0]);
    zrlGeralLiquidoFor2.Caption     := format('%.2f',[0.0]);
  end;

  //Exibir Geral Fornecedor3
  if vQtdFornecedores >= 3 then
  Begin
    zrlGeralOutrosFor3.Caption      := format('%.2f',[0.0]);
    zrlGeralOutrosDevFor3.Caption   := format('%.2f',[0.0]);
    zrlGeralFaturamentoFor3.Caption := format('%.2f',[0.0]);
    zrlGeralDevolucaoFor3.Caption   := format('%.2f',[0.0]);
    zrlGeralLiquidoFor3.Caption     := format('%.2f',[0.0]);
  end;

  //Exibir Geral Fornecedor4
  if vQtdFornecedores >= 4 then
  Begin
    zrlGeralOutrosFor4.Caption      := format('%.2f',[0.0]);
    zrlGeralOutrosDevFor4.Caption   := format('%.2f',[0.0]);
    zrlGeralFaturamentoFor4.Caption := format('%.2f',[0.0]);
    zrlGeralDevolucaoFor4.Caption   := format('%.2f',[0.0]);
    zrlGeralLiquidoFor4.Caption     := format('%.2f',[0.0]);
  end;

  //Exibir Geral Fornecedor5
  if vQtdFornecedores >= 5 then
  Begin
    zrlGeralOutrosFor5.Caption      := format('%.2f',[0.0]);
    zrlGeralOutrosDevFor5.Caption   := format('%.2f',[0.0]);
    zrlGeralFaturamentoFor5.Caption := format('%.2f',[0.0]);
    zrlGeralDevolucaoFor5.Caption   := format('%.2f',[0.0]);
    zrlGeralLiquidoFor5.Caption     := format('%.2f',[0.0]);
  end;

  //Exibir Geral Fornecedor6
  if vQtdFornecedores >= 6 then
  Begin
    zrlGeralOutrosFor6.Caption      := format('%.2f',[0.0]);
    zrlGeralOutrosDevFor6.Caption   := format('%.2f',[0.0]);
    zrlGeralFaturamentoFor6.Caption := format('%.2f',[0.0]);
    zrlGeralDevolucaoFor6.Caption   := format('%.2f',[0.0]);
    zrlGeralLiquidoFor6.Caption     := format('%.2f',[0.0]);
  end;

  //Exibir Geral Fornecedor7
  if vQtdFornecedores >= 7 then
  Begin
    zrlGeralOutrosFor7.Caption      := format('%.2f',[0.0]);
    zrlGeralOutrosDevFor7.Caption   := format('%.2f',[0.0]);
    zrlGeralFaturamentoFor7.Caption := format('%.2f',[0.0]);
    zrlGeralDevolucaoFor7.Caption   := format('%.2f',[0.0]);
    zrlGeralLiquidoFor7.Caption     := format('%.2f',[0.0]);
  end;

  //Exibir Geral Outros
  if vQtdFornecedores >= 1 then
  Begin
    zrlGeralOutrosOutros.Caption      := format('%.2f',[0.0]);
    zrlGeralOutrosDevOutros.Caption   := format('%.2f',[0.0]);
    zrlGeralFaturamentoOutros.Caption := format('%.2f',[0.0]);
    zrlGeralDevolucaoOutros.Caption   := format('%.2f',[0.0]);
    zrlGeralLiquidoOutros.Caption     := format('%.2f',[0.0]);
  end;

  //Exibir Geral Total
  zrlGeralOutrosTotal.Caption      := format('%.2f',[0.0]);
  zrlGeralOutrosDevTotal.Caption   := format('%.2f',[0.0]);
  zrlGeralFaturamentoTotal.Caption := format('%.2f',[0.0]);
  zrlGeralDevolucaoTotal.Caption   := format('%.2f',[0.0]);
  zrlGeralLiquidoTotal.Caption     := format('%.2f',[0.0]);
end;

procedure Trpt_FaturamentoFornecedor.zrbGrupoDiaMesAnoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  if vDiaMesAno = 0 then //Dia
    zrlDescDiaMesAno.Caption := 'Dia: ';

  if vDiaMesAno = 1 then //Mes
    zrlDescDiaMesAno.Caption := 'Mes: ';

  if vDiaMesAno = 2 then //Ano
    zrlDescDiaMesAno.Caption := 'Ano: ';
end;

procedure Trpt_FaturamentoFornecedor.FormCreate(Sender: TObject);
begin
  Entidade := Fornecedor1;
  vQtdFornecedores := -1;
  vDiaMesAno := -1;
  sCodigoGRP := '';
  sCodigoSGP := '';
  sCodigoFOR := '';
  sCodigoCNC := '';
end;

procedure Trpt_FaturamentoFornecedor.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vOutros, vOutrosDev, vFatura, vFaturaDev, vLiq,
    vOutrosTodos, vOutrosDevTodos, vFaturaTodos, vFaturaDevTodos, vLiqTodos,
    vOutrosTotal, vOutrosDevTotal, vFaturaTotal, vFaturaDevTotal, vLiqTotal: double;
begin
  vOutrosTotal := 0;
  vOutrosDevTotal := 0;
  vFaturaTotal := 0;
  vFaturaDevTotal := 0;
  with fmxSelFaturamentoFornecedor do
  Begin
    //Calcular Total de Fornecedores
    vOutrosTodos := CalcFaturadoSN(DM.QR_Consultas, mskDataINI.Text,
        mskDataFIM.Text);
    vOutrosDevTodos := CalcDevolvidoSN(DM.QR_Consultas, mskDataINI.Text,
        mskDataFIM.Text);
    vFaturaTodos := CalcFaturado(DM.QR_Consultas, mskDataINI.Text,
        mskDataFIM.Text);
    vFaturaDevTodos := CalcDevolvidoFat(DM.QR_Consultas, mskDataINI.Text,
        mskDataFIM.Text);
    vLiqTodos := vOutrosTodos - vOutrosDevTodos + vFaturaTodos - vFaturaDevTodos;

    //Exibir Geral Fornecedor1
    if vQtdFornecedores >= 1 then
    Begin
      vOutros := CalcFaturadoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR1.Text+')');
      vOutrosTotal := vOutrosTotal + vOutros;
      vOutrosDev := CalcDevolvidoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR1.Text+')');
      vOutrosDevTotal := vOutrosDevTotal + vOutrosDev;
      vFatura := CalcFaturado(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR1.Text+')');
      vFaturaTotal := vFaturaTotal + vFatura;
      vFaturaDev := CalcDevolvidoFat(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR1.Text+')');
      vFaturaDevTotal := vFaturaDevTotal + vFaturaDev;
      vLiq := vOutros - vOutrosDev + vFatura - vFaturaDev;
      zrlOutrosFor1.Caption      := format('%.2f',[vOutros]);
      zrlOutrosDevFor1.Caption   := format('%.2f',[vOutrosDev]);
      zrlFaturamentoFor1.Caption := format('%.2f',[vFatura]);
      zrlDevolucaoFor1.Caption   := format('%.2f',[vFaturaDev]);
      zrlLiquidoFor1.Caption     := format('%.2f',[vLiq]);
    end
    else
    Begin
      zrlOutrosFor1.Caption      := '-';
      zrlOutrosDevFor1.Caption   := '-';
      zrlFaturamentoFor1.Caption := '-';
      zrlDevolucaoFor1.Caption   := '-';
      zrlLiquidoFor1.Caption     := '-';
    end;

    //Exibir Geral Fornecedor2
    if vQtdFornecedores >= 2 then
    Begin
      vOutros := CalcFaturadoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR2.Text+')');
      vOutrosTotal := vOutrosTotal + vOutros;
      vOutrosDev := CalcDevolvidoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR2.Text+')');
      vOutrosDevTotal := vOutrosDevTotal + vOutrosDev;
      vFatura := CalcFaturado(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR2.Text+')');
      vFaturaTotal := vFaturaTotal + vFatura;
      vFaturaDev := CalcDevolvidoFat(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR2.Text+')');
      vFaturaDevTotal := vFaturaDevTotal + vFaturaDev;
      vLiq := vOutros - vOutrosDev + vFatura - vFaturaDev;
      zrlOutrosFor2.Caption      := format('%.2f',[vOutros]);
      zrlOutrosDevFor2.Caption   := format('%.2f',[vOutrosDev]);
      zrlFaturamentoFor2.Caption := format('%.2f',[vFatura]);
      zrlDevolucaoFor2.Caption   := format('%.2f',[vFaturaDev]);
      zrlLiquidoFor2.Caption     := format('%.2f',[vLiq]);
    end
    else
    Begin
      zrlOutrosFor2.Caption      := '-';
      zrlOutrosDevFor2.Caption   := '-';
      zrlFaturamentoFor2.Caption := '-';
      zrlDevolucaoFor2.Caption   := '-';
      zrlLiquidoFor2.Caption     := '-';
    end;

    //Exibir Geral Fornecedor3
    if vQtdFornecedores >= 3 then
    Begin
      vOutros := CalcFaturadoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR3.Text+')');
      vOutrosTotal := vOutrosTotal + vOutros;
      vOutrosDev := CalcDevolvidoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR3.Text+')');
      vOutrosDevTotal := vOutrosDevTotal + vOutrosDev;
      vFatura := CalcFaturado(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR3.Text+')');
      vFaturaTotal := vFaturaTotal + vFatura;
      vFaturaDev := CalcDevolvidoFat(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR3.Text+')');
      vFaturaDevTotal := vFaturaDevTotal + vFaturaDev;
      vLiq := vOutros - vOutrosDev + vFatura - vFaturaDev;
      zrlOutrosFor3.Caption      := format('%.2f',[vOutros]);
      zrlOutrosDevFor3.Caption   := format('%.2f',[vOutrosDev]);
      zrlFaturamentoFor3.Caption := format('%.2f',[vFatura]);
      zrlDevolucaoFor3.Caption   := format('%.2f',[vFaturaDev]);
      zrlLiquidoFor3.Caption     := format('%.2f',[vLiq]);
    end
    else
    Begin
      zrlOutrosFor3.Caption      := '-';
      zrlOutrosDevFor3.Caption   := '-';
      zrlFaturamentoFor3.Caption := '-';
      zrlDevolucaoFor3.Caption   := '-';
      zrlLiquidoFor3.Caption     := '-';
    end;

    //Exibir Geral Fornecedor4
    if vQtdFornecedores >= 4 then
    Begin
      vOutros := CalcFaturadoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR4.Text+')');
      vOutrosTotal := vOutrosTotal + vOutros;
      vOutrosDev := CalcDevolvidoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR4.Text+')');
      vOutrosDevTotal := vOutrosDevTotal + vOutrosDev;
      vFatura := CalcFaturado(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR4.Text+')');
      vFaturaTotal := vFaturaTotal + vFatura;
      vFaturaDev := CalcDevolvidoFat(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR4.Text+')');
      vFaturaDevTotal := vFaturaDevTotal + vFaturaDev;
      vLiq := vOutros - vOutrosDev + vFatura - vFaturaDev;
      zrlOutrosFor4.Caption      := format('%.2f',[vOutros]);
      zrlOutrosDevFor4.Caption   := format('%.2f',[vOutrosDev]);
      zrlFaturamentoFor4.Caption := format('%.2f',[vFatura]);
      zrlDevolucaoFor4.Caption   := format('%.2f',[vFaturaDev]);
      zrlLiquidoFor4.Caption     := format('%.2f',[vLiq]);
    end
    else
    Begin
      zrlOutrosFor4.Caption      := '-';
      zrlOutrosDevFor4.Caption   := '-';
      zrlFaturamentoFor4.Caption := '-';
      zrlDevolucaoFor4.Caption   := '-';
      zrlLiquidoFor4.Caption     := '-';
    end;

    //Exibir Geral Fornecedor5
    if vQtdFornecedores >= 5 then
    Begin
      vOutros := CalcFaturadoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR5.Text+')');
      vOutrosTotal := vOutrosTotal + vOutros;
      vOutrosDev := CalcDevolvidoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR5.Text+')');
      vOutrosDevTotal := vOutrosDevTotal + vOutrosDev;
      vFatura := CalcFaturado(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR5.Text+')');
      vFaturaTotal := vFaturaTotal + vFatura;
      vFaturaDev := CalcDevolvidoFat(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR5.Text+')');
      vFaturaDevTotal := vFaturaDevTotal + vFaturaDev;
      vLiq := vOutros - vOutrosDev + vFatura - vFaturaDev;
      zrlOutrosFor5.Caption      := format('%.2f',[vOutros]);
      zrlOutrosDevFor5.Caption   := format('%.2f',[vOutrosDev]);
      zrlFaturamentoFor5.Caption := format('%.2f',[vFatura]);
      zrlDevolucaoFor5.Caption   := format('%.2f',[vFaturaDev]);
      zrlLiquidoFor5.Caption     := format('%.2f',[vLiq]);
    end
    else
    Begin
      zrlOutrosFor5.Caption      := '-';
      zrlOutrosDevFor5.Caption   := '-';
      zrlFaturamentoFor5.Caption := '-';
      zrlDevolucaoFor5.Caption   := '-';
      zrlLiquidoFor5.Caption     := '-';
    end;

    //Exibir Geral Fornecedor6
    if vQtdFornecedores >= 6 then
    Begin
      vOutros := CalcFaturadoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR6.Text+')');
      vOutrosTotal := vOutrosTotal + vOutros;
      vOutrosDev := CalcDevolvidoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR6.Text+')');
      vOutrosDevTotal := vOutrosDevTotal + vOutrosDev;
      vFatura := CalcFaturado(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR6.Text+')');
      vFaturaTotal := vFaturaTotal + vFatura;
      vFaturaDev := CalcDevolvidoFat(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR6.Text+')');
      vFaturaDevTotal := vFaturaDevTotal + vFaturaDev;
      vLiq := vOutros - vOutrosDev + vFatura - vFaturaDev;
      zrlOutrosFor6.Caption      := format('%.2f',[vOutros]);
      zrlOutrosDevFor6.Caption   := format('%.2f',[vOutrosDev]);
      zrlFaturamentoFor6.Caption := format('%.2f',[vFatura]);
      zrlDevolucaoFor6.Caption   := format('%.2f',[vFaturaDev]);
      zrlLiquidoFor6.Caption     := format('%.2f',[vLiq]);
    end
    else
    Begin
      zrlOutrosFor6.Caption      := '-';
      zrlOutrosDevFor6.Caption   := '-';
      zrlFaturamentoFor6.Caption := '-';
      zrlDevolucaoFor6.Caption   := '-';
      zrlLiquidoFor6.Caption     := '-';
    end;

    //Exibir Geral Fornecedor7
    if vQtdFornecedores >= 7 then
    Begin
      vOutros := CalcFaturadoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR7.Text+')');
      vOutrosTotal := vOutrosTotal + vOutros;
      vOutrosDev := CalcDevolvidoSN(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR7.Text+')');
      vOutrosDevTotal := vOutrosDevTotal + vOutrosDev;
      vFatura := CalcFaturado(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR7.Text+')');
      vFaturaTotal := vFaturaTotal + vFatura;
      vFaturaDev := CalcDevolvidoFat(DM.QR_Consultas, mskDataINI.Text,
          mskDataFIM.Text, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
          ' FROM PRODUTO WHERE FOR_CODIGO='+edtCodigoFOR7.Text+')');
      vFaturaDevTotal := vFaturaDevTotal + vFaturaDev;
      vLiq := vOutros - vOutrosDev + vFatura - vFaturaDev;
      zrlOutrosFor7.Caption      := format('%.2f',[vOutros]);
      zrlOutrosDevFor7.Caption   := format('%.2f',[vOutrosDev]);
      zrlFaturamentoFor7.Caption := format('%.2f',[vFatura]);
      zrlDevolucaoFor7.Caption   := format('%.2f',[vFaturaDev]);
      zrlLiquidoFor7.Caption     := format('%.2f',[vLiq]);
    end
    else
    Begin
      zrlOutrosFor7.Caption      := '-';
      zrlOutrosDevFor7.Caption   := '-';
      zrlFaturamentoFor7.Caption := '-';
      zrlDevolucaoFor7.Caption   := '-';
      zrlLiquidoFor7.Caption     := '-';
    end;

    //Exibir Geral Outros
    if vQtdFornecedores >= 1 then
    Begin
      vLiqTotal := (vOutrosTodos-vOutrosTotal) -
                   (vOutrosDevTodos-vOutrosDevTotal) +
                   (vFaturaTodos-vFaturaTotal) -
                   (vFaturaDevTodos-vFaturaDevTotal);
      zrlOutrosOutros.Caption      := format('%.2f',[vOutrosTodos-vOutrosTotal]);
      zrlOutrosDevOutros.Caption   := format('%.2f',[vOutrosDevTodos-vOutrosDevTotal]);
      zrlFaturamentoOutros.Caption := format('%.2f',[vFaturaTodos-vFaturaTotal]);
      zrlDevolucaoOutros.Caption   := format('%.2f',[vFaturaDevTodos-vFaturaDevTotal]);
      zrlLiquidoOutros.Caption     := format('%.2f',[vLiqTotal]);
    end;
  end;

  //Exibir Geral Total
  zrlOutrosTotal.Caption      := format('%.2f',[vOutrosTodos]);
  zrlOutrosDevTotal.Caption   := format('%.2f',[vOutrosDevTodos]);
  zrlFaturamentoTotal.Caption := format('%.2f',[vFaturaTodos]);
  zrlDevolucaoTotal.Caption   := format('%.2f',[vFaturaDevTodos]);
  zrlLiquidoTotal.Caption     := format('%.2f',[vLiqTodos]);
end;

end.
