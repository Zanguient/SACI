unit UFaturamentoFornecedor2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Fornecedor;

type
  Trpt_FaturamentoFornecedor2 = class(TForm)
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
    zrlUsuario: TSZRLabel;
    zrlDescDiaMesAno: TSZRLabel;
    zrlRodapeGeral: TSZRBand;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlGeralOutrosFor1: TSZRLabel;
    zrlGeralOutrosDevFor1: TSZRLabel;
    zrlGeralFaturamentoFor1: TSZRLabel;
    zrlGeralDevolucaoFor1: TSZRLabel;
    zrlGeralLiquidoFor1: TSZRLabel;
    zrlGeralLiquidoTotal: TSZRLabel;
    zrlGeralDevolucaoTotal: TSZRLabel;
    zrlGeralFaturamentoTotal: TSZRLabel;
    zrlGeralOutrosDevTotal: TSZRLabel;
    zrlGeralOutrosTotal: TSZRLabel;
    SZRLabel64: TSZRLabel;
    zrlOutrosFor1: TSZRLabel;
    zrlOutrosDevFor1: TSZRLabel;
    zrlFaturamentoFor1: TSZRLabel;
    zrlDevolucaoFor1: TSZRLabel;
    zrlLiquidoFor1: TSZRLabel;
    Fornecedor1: TFornecedor;
    SZRLabel10: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    zrlFornecedor: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlOutrosOutros: TSZRLabel;
    zrlOutrosTotal: TSZRLabel;
    zrlLiquidoOutros: TSZRLabel;
    zrlDevolucaoOutros: TSZRLabel;
    zrlFaturamentoOutros: TSZRLabel;
    zrlOutrosDevOutros: TSZRLabel;
    zrlOutrosDevTotal: TSZRLabel;
    zrlFaturamentoTotal: TSZRLabel;
    zrlDevolucaoTotal: TSZRLabel;
    zrlLiquidoTotal: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlServicoFor1: TSZRLabel;
    zrlServicoDevFor1: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlServicoOutros: TSZRLabel;
    zrlServicoDevOutros: TSZRLabel;
    zrlServicoTotal: TSZRLabel;
    zrlServicoDevTotal: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlGeralOutrosOutros: TSZRLabel;
    zrlGeralOutrosDevOutros: TSZRLabel;
    zrlGeralFaturamentoOutros: TSZRLabel;
    zrlGeralDevolucaoOutros: TSZRLabel;
    zrlGeralLiquidoOutros: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlRodapeGeralBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoDiaMesAnoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
//      vOutrosGeral, vOutrosDevGeral, vFaturaGeral, vFaturaDevGeral, vLiqGeral: Double;
      vOutrosTotal, vOutrosDevTotal, vFaturaTotal, vFaturaDevTotal, vLiqTotal,
        vServicoTotal, vServicoDevTotal: double;
  public
    vDiaMesAno: integer;
    sDataINI, sDataFIM, sCodigoGRP, sCodigoSGP, sCodigoFOR, sCodigoCNC:string;
    Entidade : TFornecedor;
  end;

var
  rpt_FaturamentoFornecedor2: Trpt_FaturamentoFornecedor2;

implementation
Uses
  UDM, Funcoes;
{$R *.DFM}

procedure Trpt_FaturamentoFornecedor2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure Trpt_FaturamentoFornecedor2.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_FaturamentoFornecedor2.zrbRodapeBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;  
end;

procedure Trpt_FaturamentoFornecedor2.zrlRodapeGeralBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  //Exibir Geral Fornecedor1
  zrlGeralOutrosFor1.Caption      := format('%.2f',[0.0]);
  zrlGeralOutrosDevFor1.Caption   := format('%.2f',[0.0]);
  zrlGeralFaturamentoFor1.Caption := format('%.2f',[0.0]);
  zrlGeralDevolucaoFor1.Caption   := format('%.2f',[0.0]);
  zrlGeralLiquidoFor1.Caption     := format('%.2f',[0.0]);

  //Exibir Geral Outros
  zrlGeralOutrosOutros.Caption      := format('%.2f',[0.0]);
  zrlGeralOutrosDevOutros.Caption   := format('%.2f',[0.0]);
  zrlGeralFaturamentoOutros.Caption := format('%.2f',[0.0]);
  zrlGeralDevolucaoOutros.Caption   := format('%.2f',[0.0]);
  zrlGeralLiquidoOutros.Caption     := format('%.2f',[0.0]);

  //Exibir Geral Total
  zrlGeralOutrosTotal.Caption      := format('%.2f',[0.0]);
  zrlGeralOutrosDevTotal.Caption   := format('%.2f',[0.0]);
  zrlGeralFaturamentoTotal.Caption := format('%.2f',[0.0]);
  zrlGeralDevolucaoTotal.Caption   := format('%.2f',[0.0]);
  zrlGeralLiquidoTotal.Caption     := format('%.2f',[0.0]);
end;

procedure Trpt_FaturamentoFornecedor2.zrbGrupoDiaMesAnoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  if vDiaMesAno = 0 then //Dia
    zrlDescDiaMesAno.Caption := 'Dia: ';

  if vDiaMesAno = 1 then //Mes
    zrlDescDiaMesAno.Caption := 'Mes: ';

  if vDiaMesAno = 2 then //Ano
    zrlDescDiaMesAno.Caption := 'Ano: ';
end;

procedure Trpt_FaturamentoFornecedor2.FormCreate(Sender: TObject);
begin
  Entidade := Fornecedor1;
  vDiaMesAno := -1;
  sDataINI   := '';
  sDataFIM   := '';  
  sCodigoGRP := '';
  sCodigoSGP := '';
  sCodigoFOR := '';
  sCodigoCNC := '';

  vOutrosTotal    := 0;
  vOutrosDevTotal := 0;
  vFaturaTotal    := 0;
  vFaturaDevTotal := 0;  
end;

procedure Trpt_FaturamentoFornecedor2.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vOutros, vOutrosDev, vFatura, vFaturaDev, vLiq, vServico, vServicoDev: Double;
  sDescFor: string;
begin
  //Exibir Fornecedor
  vOutros := CalcFaturadoSN(DM.QR_Consultas, sDataINI,
      sDataFIM, ' AND PRD_CODIGO>0 AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
      ' FROM PRODUTO WHERE FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+')');

  vOutrosDev := CalcDevolvidoSN(DM.QR_Consultas, sDataINI,
      sDataFIM, ' AND PRD_CODIGO>0 AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
      ' FROM PRODUTO WHERE FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+')');

  vServico := CalcFaturadoServico(DM.QR_Consultas, sDataINI,
      sDataFIM, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
      ' FROM PRODUTO WHERE FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+')');

  vServicoDev := CalcDevolvidoFatServico(DM.QR_Consultas, sDataINI,
      sDataFIM, ' AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
      ' FROM PRODUTO WHERE FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+')');

  vFatura := CalcFaturado(DM.QR_Consultas, sDataINI,
      sDataFIM, ' AND PRD_CODIGO>0 AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
      ' FROM PRODUTO WHERE FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+')');

  vFaturaDev := CalcDevolvidoFat(DM.QR_Consultas, sDataINI,
      sDataFIM, ' AND PRD_CODIGO>0 AND PRD_CODIGO IN (SELECT PRD_CODIGO '+
      ' FROM PRODUTO WHERE FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+')');

  if (vOutros = 0) and
     (vOutrosDev = 0) and
     (vFatura = 0) and
     (vFaturaDev = 0) and
     (vServico = 0) and
     (vServicoDev = 0) and
     (sCodigoFOR = '') then  //Se tiver definido os fornecedores mostrar mesmo zerado
  Begin
    DoPrint := False;
    Exit;
  end
  else
    DoPrint := True;

  vOutrosTotal     := vOutrosTotal + vOutros;
  vOutrosDevTotal  := vOutrosDevTotal + vOutrosDev;
  vFaturaTotal     := vFaturaTotal + vFatura;
  vFaturaDevTotal  := vFaturaDevTotal + vFaturaDev;
  vServicoTotal    := vServicoTotal + vServico;
  vServicoDevTotal := vServicoDevTotal + vServicoDev;
  vLiq := vOutros - vOutrosDev + vFatura - vFaturaDev + vServico - vServicoDev;

  zrlOutrosFor1.Caption      := format('%.2f',[vOutros]);
  zrlOutrosDevFor1.Caption   := format('%.2f',[vOutrosDev]);
  zrlFaturamentoFor1.Caption := format('%.2f',[vFatura]);
  zrlDevolucaoFor1.Caption   := format('%.2f',[vFaturaDev]);
  zrlServicoFor1.Caption     := format('%.2f',[vServico]);
  zrlServicoDevFor1.Caption  := format('%.2f',[vServicoDev]);
  zrlLiquidoFor1.Caption     := format('%.2f',[vLiq]);

  with Fornecedor1 do
  Begin
    sDescFor := '('+IntToStr(CodigoFOR)+')'+RazaoSocial;
    if Length(sDescFor) <= zrlFornecedor.Width then
      zrlFornecedor.Caption := sDescFor
    else
      zrlFornecedor.Caption := Copy(sDescFor,1,zrlFornecedor.Width);
  end;
end;

procedure Trpt_FaturamentoFornecedor2.zrbRodapeGrupoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
var
  vOutrosTodos, vOutrosDevTodos, vFaturaTodos, vFaturaDevTodos, vLiqTodos,
    vServicoTodos, vServicoDevTodos: Double;
begin
  //Calcular Total de Fornecedores
  vOutrosTodos    := CalcFaturadoSN(DM.QR_Consultas, sDataINI, sDataFIM);
  vOutrosDevTodos := CalcDevolvidoSN(DM.QR_Consultas, sDataINI,sDataFIM);
  vFaturaTodos    := CalcFaturado(DM.QR_Consultas, sDataINI,sDataFIM,
    ' AND I1.PRD_CODIGO>0 ');
  vFaturaDevTodos := CalcDevolvidoFat(DM.QR_Consultas, sDataINI,sDataFIM,
    ' AND I1.PRD_CODIGO>0 ');
  vServicoTodos    := CalcFaturadoServico(DM.QR_Consultas, sDataINI,sDataFIM);
  vServicoDevTodos := CalcDevolvidoFatServico(DM.QR_Consultas, sDataINI,sDataFIM);

  vLiqTodos := vOutrosTodos - vOutrosDevTodos + vFaturaTodos - vFaturaDevTodos + vServicoTodos - vServicoDevTodos;

  //Exibir Geral Outros
  vLiqTotal := (vOutrosTodos-vOutrosTotal) -
               (vOutrosDevTodos-vOutrosDevTotal) +
               (vFaturaTodos-vFaturaTotal) -
               (vFaturaDevTodos-vFaturaDevTotal) +
               (vServicoTodos-vServicoTotal) -
               (vServicoDevTodos-vServicoDevTotal);
  zrlOutrosOutros.Caption      := format('%.2f',[vOutrosTodos-vOutrosTotal]);
  zrlOutrosDevOutros.Caption   := format('%.2f',[vOutrosDevTodos-vOutrosDevTotal]);
  zrlFaturamentoOutros.Caption := format('%.2f',[vFaturaTodos-vFaturaTotal]);
  zrlDevolucaoOutros.Caption   := format('%.2f',[vFaturaDevTodos-vFaturaDevTotal]);
  zrlServicoOutros.Caption     := format('%.2f',[vServicoTodos-vServicoTotal]);
  zrlServicoDevOutros.Caption  := format('%.2f',[vServicoDevTodos-vServicoDevTotal]);
  zrlLiquidoOutros.Caption     := format('%.2f',[vLiqTotal]);

  //Exibir Geral Total
  zrlOutrosTotal.Caption      := format('%.2f',[vOutrosTodos]);
  zrlOutrosDevTotal.Caption   := format('%.2f',[vOutrosDevTodos]);
  zrlFaturamentoTotal.Caption := format('%.2f',[vFaturaTodos]);
  zrlDevolucaoTotal.Caption   := format('%.2f',[vFaturaDevTodos]);
  zrlServicoTotal.Caption     := format('%.2f',[vServicoTodos]);
  zrlServicoDevTotal.Caption  := format('%.2f',[vServicoDevTodos]);
  zrlLiquidoTotal.Caption     := format('%.2f',[vLiqTodos]);
end;

end.
