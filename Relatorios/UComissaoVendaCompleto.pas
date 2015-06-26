unit UComissaoVendaCompleto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Item_Pedido_Venda, Funcionario,
  Produto, Cota, Item_de_Cota, Item_de_Troca;

type
  Trpt_ComissaoVendaCompleto = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrlNomeRelatorio: TSZRLabel;
    zrlDataHoraRelatorio: TSZRSysData;
    zrlNomeEmpresa: TSZRLabel;
    zrlCentroDeCustoRelatorio: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrbGrupoFUN: TSZRGroup;
    zrbRodapeGrupo: TSZRBand;
    zrlDescVendedor: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRDBText4: TSZRDBText;
    ZRDBText6: TSZRDBText;
    zrlDescFaturado: TSZRLabel;
    zrlDescComissao: TSZRLabel;
    Funcionario1: TFuncionario;
    zrlFaturado1: TSZRLabel;
    Produto1: TProduto;
    zrlVendedor: TSZRLabel;
    ZRLabel5: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlComissao1: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    zrlDescDevolvido: TSZRLabel;
    zrlDevolvido1: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlDetalhe: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlFaturadoTotal1: TSZRLabel;
    zrlComissaoTotal1: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlDevolvidoTotal1: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlBonificacao: TSZRLabel;
    zrlFaturado2: TSZRLabel;
    zrlComissao2: TSZRLabel;
    zrlComissaoTotal2: TSZRLabel;
    zrlDevolvido2: TSZRLabel;
    zrlDevolvidoTotal2: TSZRLabel;
    zrlFaturadoTotal2: TSZRLabel;
    zrlSinalMais3: TSZRLabel;
    zrlSinalMais9: TSZRLabel;
    zrlFaturado: TSZRLabel;
    zrlSinalIgual3: TSZRLabel;
    zrlFaturadoTotal: TSZRLabel;
    zrlSinalIgual9: TSZRLabel;
    zrlSinalMais10: TSZRLabel;
    zrlSinalMais5: TSZRLabel;
    zrlDevolvido: TSZRLabel;
    zrlSinalIgual5: TSZRLabel;
    zrlDevolvidoTotal: TSZRLabel;
    zrlSinalIgual10: TSZRLabel;
    zrlSinalMais8: TSZRLabel;
    zrlSinalMais14: TSZRLabel;
    zrlComissao: TSZRLabel;
    zrlSinalIgual8: TSZRLabel;
    zrlComissaoTotal: TSZRLabel;
    zrlSinalIgual14: TSZRLabel;
    zrlQtdFaturado1: TSZRLabel;
    zrlQtdFaturado2: TSZRLabel;
    zrlSinalMais4: TSZRLabel;
    zrlQtdFaturado: TSZRLabel;
    zrlSinalIgual4: TSZRLabel;
    zrlQtdDevolvido1: TSZRLabel;
    zrlQtdDevolvido2: TSZRLabel;
    zrlSinalMais6: TSZRLabel;
    zrlQtdDevolvido: TSZRLabel;
    zrlSinalIgual6: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel35: TSZRLabel;
    zrlSaldo1: TSZRLabel;
    zrlSaldo2: TSZRLabel;
    zrlSinalMais7: TSZRLabel;
    zrlSaldo: TSZRLabel;
    zrlSinalIgual7: TSZRLabel;
    zrlTotalQtdFaturado1: TSZRLabel;
    zrlTotalQtdFaturado2: TSZRLabel;
    zrlSinalMais11: TSZRLabel;
    zrlTotalQtdFaturado: TSZRLabel;
    zrlSinalIgual11: TSZRLabel;
    zrlTotalQtdDevolvido1: TSZRLabel;
    zrlTotalQtdDevolvido2: TSZRLabel;
    zrlSinalMais12: TSZRLabel;
    zrlTotalQtdDevolvido: TSZRLabel;
    zrlSinalIgual12: TSZRLabel;
    SZRLabel48: TSZRLabel;
    SZRLabel49: TSZRLabel;
    SZRLabel50: TSZRLabel;
    zrlTotalSaldo1: TSZRLabel;
    zrlTotalSaldo2: TSZRLabel;
    zrlSinalMais13: TSZRLabel;
    zrlTotalSaldo: TSZRLabel;
    zrlSinalIgual13: TSZRLabel;
    zrlForaDeLinha: TSZRLabel;
    zrlData: TSZRLabel;
    ZRLabel24: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlMeta: TSZRLabel;
    zrbGrupoDia: TSZRGroup;
    zrlDescData: TSZRLabel;
    zrbRodapeGrupoDia: TSZRBand;
    zrlQtdFaturadoDia1: TSZRLabel;
    zrlQtdFaturadoDia2: TSZRLabel;
    zrlSinalMais1: TSZRLabel;
    zrlQtdFaturadoDia: TSZRLabel;
    zrlSinalIgual1: TSZRLabel;
    SZRLabel36: TSZRLabel;
    zrlQtdDevolvidoDia1: TSZRLabel;
    zrlQtdDevolvidoDia2: TSZRLabel;
    zrlSinalMais2: TSZRLabel;
    zrlQtdDevolvidoDia: TSZRLabel;
    zrlSinalIgual2: TSZRLabel;
    SZRLabel51: TSZRLabel;
    zrlDescComissaoDia: TSZRLabel;
    zrlComissaoDia1: TSZRLabel;
    zrlComissaoDia2: TSZRLabel;
    zrlDescSinalMais: TSZRLabel;
    zrlComissaoDia: TSZRLabel;
    zrlDescSinalIgual: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoFUNBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoDiaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoDiaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vFaturado1, vFaturadoTotal1, vDevolvido1, vDevolvidoTotal1, vComissao1, vComissaoTotal1, vQtdFaturado1, vTotalQtdFaturado1, vQtdDevolvido1, vTotalQtdDevolvido1,
    vFaturado2, vFaturadoTotal2, vDevolvido2, vDevolvidoTotal2, vComissao2, vComissaoTotal2, vQtdFaturado2, vTotalQtdFaturado2,vQtdDevolvido2, vTotalQtdDevolvido2, vComissaoQtdGeral1, vComissaoQtdGeral2,
    vQtdFaturadoDia1, vQtdFaturadoDia2, vQtdDevolvidoDia1, vQtdDevolvidoDia2: Double;
    vUmaComissao: Boolean;
  public
    Entidade: TItem_Pedido_Venda;
    vComissaoIndicacao: Boolean;
  end;

var
  rpt_ComissaoVendaCompleto: Trpt_ComissaoVendaCompleto;

implementation
Uses
  UDM, Funcoes, URelDataVend, MxSelDataComissao;
{$R *.DFM}

procedure Trpt_ComissaoVendaCompleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Funcionario1.Close;
  Produto1.Close;
  Action := cafree;
end;

procedure Trpt_ComissaoVendaCompleto.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vFaturadoItem, vDevolvidoItem, vQtdFaturadoItem, vQtdDevolvidoItem: Double;
  vForaDeLinha: Boolean;
begin
  with Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
    Open;
    if DM.Configuracao1.Empresa <> empEletro then
      zrlProduto.Caption    := Descricao
    else
      zrlProduto.Caption    := Trim(Descricao+' '+Caracteristica);
    zrlReferencia.Caption := Referencia;
    zrlDetalhe.Caption    := Detalhe;
    vForaDeLinha           := ForaDeLinha;
  end;

  if Entidade.Bonificacao = 0 then
    zrlBonificacao.Caption := '-';

  if DM.Configuracao1.Empresa in [empEletro, empPetromax] then
  Begin
    zrlQuantidade.Caption  := Format('%.2f',[Entidade.Quantidade]);
    if Entidade.Bonificacao > 0 then
      zrlBonificacao.Caption := Format('%.2f',[Entidade.Bonificacao]);
  end
  else
  Begin
    zrlQuantidade.Caption  := IntToStr(Trunc(Entidade.Quantidade));
    if Entidade.Bonificacao > 0 then
      zrlBonificacao.Caption := IntToStr(Trunc(Entidade.Bonificacao))
  end;

  zrlData.Caption  := DateToStr(Entidade.FieldByName('PDV_DT_ENTREGA').AsDateTime);

  //OBS: Na devolução debitar o valor da bonificacao
  vFaturadoItem     := 0;
  vDevolvidoItem    := 0;
  vQtdFaturadoItem  := 0;
  vQtdDevolvidoItem := 0;
  if Entidade.FieldByName('TIPO').asInteger = 0 then //Venda Entregue no Período
  Begin
    zrlSituacao.Caption := 'V';
    vQtdFaturadoItem := Arredonda(Entidade.Quantidade-Entidade.Bonificacao);
    vFaturadoItem    := Arredonda(Arredonda(Entidade.PrecoDesc)*(Entidade.Quantidade-Entidade.Bonificacao));
  end
  else if Entidade.FieldByName('TIPO').asInteger = 1 then //Devolução Parcial Entregue no Período
  Begin
    zrlSituacao.Caption := 'VP';
    vQtdFaturadoItem := Arredonda(Entidade.Quantidade-Entidade.Bonificacao);
    vFaturadoItem := Arredonda(Arredonda(Entidade.PrecoDesc)*(Entidade.Quantidade-Entidade.Bonificacao));
  end
  else if Entidade.FieldByName('TIPO').asInteger = 2 then //Devolução Total Entregue no Período
  Begin
    zrlSituacao.Caption := 'VT';
    vQtdFaturadoItem := Arredonda(Entidade.Quantidade-Entidade.Bonificacao);
    vFaturadoItem := Arredonda(Arredonda(Entidade.PrecoDesc)*(Entidade.Quantidade-Entidade.Bonificacao));
  end
  else if Entidade.FieldByName('TIPO').asInteger = 3 then //Devolução Parcial Realizada no Período
  Begin
    zrlSituacao.Caption := 'DP';
    vQtdDevolvidoItem := Arredonda(Entidade.Quantidade-Entidade.Bonificacao);
    vDevolvidoItem    := Arredonda(Arredonda(Entidade.PrecoDesc)*Entidade.Quantidade);
  end
  else if Entidade.FieldByName('TIPO').asInteger = 4 then //Devolução Total Realizada no Período
  Begin
    zrlSituacao.Caption := 'DT';
    vDevolvidoItem    := Arredonda(Arredonda(Entidade.PrecoDesc)*(Entidade.Quantidade-Entidade.Bonificacao));
    vQtdDevolvidoItem := Arredonda(Entidade.Quantidade-Entidade.Bonificacao);
  end;

  if vFaturadoItem > 0 then
    zrlTotalItem.Caption := Format('%.2f',[vFaturadoItem])
  else if vDevolvidoItem > 0 then
    zrlTotalItem.Caption := Format('%.2f',[(-1)*vDevolvidoItem])
  else
    zrlTotalItem.Caption := '0,00';


  if DM.Configuracao1.Empresa = empHope then
  Begin
    if not vForaDeLinha then
    Begin
      zrlForaDeLinha.Caption := 'N';
      vComissao1      := vComissao1 + (vFaturadoItem * Funcionario1.PerAbaixo);
      vComissao1      := vComissao1 - (vDevolvidoItem * Funcionario1.PerAbaixo);
      vComissaoTotal1 := vComissaoTotal1 + (vFaturadoItem * Funcionario1.PerAbaixo);
      vComissaoTotal1 := vComissaoTotal1 - (vDevolvidoItem * Funcionario1.PerAbaixo);
      vQtdFaturadoDia1    := vQtdFaturadoDia1    + vQtdFaturadoItem;
      vQtdFaturado1       := vQtdFaturado1       + vQtdFaturadoItem;
      vTotalQtdFaturado1  := vTotalQtdFaturado1  + vQtdFaturadoItem;
      vFaturado1          := vFaturado1          + vFaturadoItem;
      vFaturadoTotal1     := vFaturadoTotal1     + vFaturadoItem;
      vQtdDevolvidoDia1   := vQtdDevolvidoDia1   + vQtdDevolvidoItem;
      vQtdDevolvido1      := vQtdDevolvido1      + vQtdDevolvidoItem;
      vTotalQtdDevolvido1 := vTotalQtdDevolvido1 + vQtdDevolvidoItem;
      vDevolvido1         := vDevolvido1         + vDevolvidoItem;
      vDevolvidoTotal1    := vDevolvidoTotal1    + vDevolvidoItem;
    end
    else //Produtos Fora de Linha
    Begin
      zrlForaDeLinha.Caption := 'S';
      vComissao2      := vComissao2 + (vFaturadoItem * Funcionario1.PerAbaixo);
      vComissao2      := vComissao2 - (vFaturadoItem * Funcionario1.PerAbaixo);
      vComissaoTotal2 := vComissaoTotal2 + (vFaturadoItem * Funcionario1.PerAcima);
      vComissaoTotal2 := vComissaoTotal2 - (vDevolvidoItem * Funcionario1.PerAcima);
      vQtdFaturadoDia2    := vQtdFaturadoDia2    + vQtdFaturadoItem;
      vQtdFaturado2       := vQtdFaturado2       + vQtdFaturadoItem;
      vTotalQtdFaturado2  := vTotalQtdFaturado2  + vQtdFaturadoItem;
      vFaturado2          := vFaturado2          + vFaturadoItem;
      vFaturadoTotal2     := vFaturadoTotal2     + vFaturadoItem;
      vQtdDevolvidoDia2   := vQtdDevolvidoDia2   + vQtdDevolvidoItem;
      vQtdDevolvido2      := vQtdDevolvido2      + vQtdDevolvidoItem;
      vTotalQtdDevolvido2 := vTotalQtdDevolvido2 + vQtdDevolvidoItem;
      vDevolvido2         := vDevolvido2         + vDevolvidoItem;
      vDevolvidoTotal2    := vDevolvidoTotal2    + vDevolvidoItem;
    end;
  end
  else
  Begin
    zrlForaDeLinha.Caption := '';
    vComissao1      := vComissao1 + (vFaturadoItem * Funcionario1.PerAbaixo / 100);
    vComissao1      := vComissao1 - (vDevolvidoItem * Funcionario1.PerAcima);
    if DM.Configuracao1.Empresa <> empEletro then
    Begin
      vComissaoTotal1 := vComissaoTotal1 + (vFaturadoItem * Funcionario1.PerAbaixo / 100);
      vComissaoTotal2 := vComissaoTotal2 - (vDevolvidoItem * Funcionario1.PerAcima);
    end;

    if DM.Configuracao1.Empresa = empLuciano then
    Begin
      //Se for Montagem será QTD2 para ser calculado com Cota do Funcionario
      if DM.Configuracao1.Montagem = Entidade.CodigoPRD then
      Begin
        vQtdFaturadoDia2    := vQtdFaturadoDia2    + vQtdFaturadoItem;
        vQtdFaturado2       := vQtdFaturado2       + vQtdFaturadoItem;
        vTotalQtdFaturado2  := vTotalQtdFaturado2  + vQtdFaturadoItem;
      end
      else
      Begin
        vQtdFaturadoDia1    := vQtdFaturadoDia1    + vQtdFaturadoItem;
        vQtdFaturado1       := vQtdFaturado1       + vQtdFaturadoItem;
        vTotalQtdFaturado1  := vTotalQtdFaturado1  + vQtdFaturadoItem;
      end;
    end
    else
    Begin
      vQtdFaturadoDia1    := vQtdFaturadoDia1    + vQtdFaturadoItem;
      vQtdFaturado1       := vQtdFaturado1       + vQtdFaturadoItem;
      vTotalQtdFaturado1  := vTotalQtdFaturado1  + vQtdFaturadoItem;
    end;
    vFaturado1          := vFaturado1          + vFaturadoItem;
    vFaturadoTotal1     := vFaturadoTotal1     + vFaturadoItem;
    vQtdDevolvidoDia1   := vQtdDevolvidoDia1   + vQtdDevolvidoItem;    
    vQtdDevolvido1      := vQtdDevolvido1      + vQtdDevolvidoItem;
    vTotalQtdDevolvido1 := vTotalQtdDevolvido1 + vQtdDevolvidoItem;
    vDevolvido1         := vDevolvido1         + vDevolvidoItem;
    vDevolvidoTotal1    := vDevolvidoTotal1    + vDevolvidoItem;
  end;
end;

procedure Trpt_ComissaoVendaCompleto.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeEmpresa.Caption:=DM.Configuracao1.LojaNome;
  zrlCentroDeCustoRelatorio.Caption:=DM.CentroCusto1.RazaoSocial;
  if vComissaoIndicacao then
  Begin
    zrlDescDevolvido.Enabled := False;
    zrlDevolvido1.Enabled := False;
    zrlDevolvido2.Enabled := False;
  end;
end;

procedure Trpt_ComissaoVendaCompleto.zrbGrupoFUNBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vQtdFaturado1 := 0;
  vQtdFaturado2 := 0;
  vQtdDevolvido1 := 0;
  vQtdDevolvido2 := 0;

  vFaturado1  := 0;
  vFaturado2  := 0;
  vDevolvido1 := 0;
  vDevolvido2 := 0;  
  with Funcionario1 do
  Begin
    Close;
    ParamByName('FUN_CODIGO').asInteger := Entidade.FieldByName('FUN_CODIGO').asInteger;
    Open;
    zrlVendedor.Caption := Apelido+' ('+Entidade.FieldByName('FUN_CODIGO').asString+')';
  end;
end;

procedure Trpt_ComissaoVendaCompleto.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;  
end;

procedure Trpt_ComissaoVendaCompleto.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;

  vFaturadoTotal1  := 0;
  vFaturadoTotal2  := 0;
  vDevolvidoTotal1 := 0;
  vDevolvidoTotal2 := 0;
  vComissaoTotal1  := 0;
  vComissaoTotal2  := 0;
  vTotalQtdFaturado1 := 0;
  vTotalQtdFaturado2 := 0;
  vTotalQtdDevolvido1 := 0;
  vTotalQtdDevolvido2 := 0;

  vComissaoIndicacao := False;

  vComissaoQtdGeral1 := 0;
  vComissaoQtdGeral2 := 0;

  if DM.Configuracao1.Empresa = empEletro then
  Begin
    vUmaComissao := True;
  end
  else
    vUmaComissao := False;
end;

procedure Trpt_ComissaoVendaCompleto.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlFaturadoTotal1.Caption  := Format('%.2f',[vFaturadoTotal1]);
  zrlFaturadoTotal2.Caption  := Format('%.2f',[vFaturadoTotal2]);
  zrlFaturadoTotal.Caption   := Format('%.2f',[vFaturadoTotal1+vFaturadoTotal2]);

  zrlDevolvidoTotal1.Caption := Format('%.2f',[vDevolvidoTotal1]);
  zrlDevolvidoTotal2.Caption := Format('%.2f',[vDevolvidoTotal2]);
  zrlDevolvidoTotal.Caption  := Format('%.2f',[vDevolvidoTotal1+vDevolvidoTotal2]);

  if DM.Configuracao1.Empresa in [empEletro, empPetromax] then
  Begin
    zrlTotalQtdFaturado1.Caption := Format('%.2f',[vTotalQtdFaturado1]);
    zrlTotalQtdFaturado2.Caption := Format('%.2f',[vTotalQtdFaturado2]);
    zrlTotalQtdFaturado.Caption  := Format('%.2f',[vTotalQtdFaturado1+vTotalQtdFaturado2]);

    zrlTotalQtdDevolvido1.Caption := Format('%.2f',[vTotalQtdDevolvido1]);
    zrlTotalQtdDevolvido2.Caption := Format('%.2f',[vTotalQtdDevolvido2]);
    zrlTotalQtdDevolvido.Caption  := Format('%.2f',[vTotalQtdDevolvido1+vTotalQtdDevolvido2]);
  end
  else
  Begin
    zrlTotalQtdFaturado1.Caption := IntToStr(Trunc(vTotalQtdFaturado1));
    zrlTotalQtdFaturado2.Caption := IntToStr(Trunc(vTotalQtdFaturado2));
    zrlTotalQtdFaturado.Caption  := IntToStr(Trunc(vTotalQtdFaturado1)+Trunc(vTotalQtdFaturado2));

    zrlTotalQtdDevolvido1.Caption := IntToStr(Trunc(vTotalQtdDevolvido1));
    zrlTotalQtdDevolvido2.Caption := IntToStr(Trunc(vTotalQtdDevolvido2));
    zrlTotalQtdDevolvido.Caption  := IntToStr(Trunc(vTotalQtdDevolvido1)+Trunc(vTotalQtdDevolvido2));
  end;

  zrlTotalSaldo1.Caption  := Format('%.2f',[StrToFloat(zrlFaturadoTotal1.Caption)-StrToFloat(zrlDevolvidoTotal1.Caption)]);
  zrlTotalSaldo2.Caption  := Format('%.2f',[StrToFloat(zrlFaturadoTotal2.Caption)-StrToFloat(zrlDevolvidoTotal2.Caption)]);
  zrlTotalSaldo.Caption   := Format('%.2f',[StrToFloat(zrlTotalSaldo1.Caption)+StrToFloat(zrlTotalSaldo2.Caption)]);

  zrlComissaoTotal1.Caption  := Format('%.2f',[vComissaoTotal1]);
  zrlComissaoTotal2.Caption  := Format('%.2f',[vComissaoTotal2]);
  zrlComissaoTotal.Caption   := Format('%.2f',[vComissaoTotal1+vComissaoTotal2]);
end;

procedure Trpt_ComissaoVendaCompleto.zrbRodapeGrupoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
var
  vFaturado: double;
begin
  if DM.Configuracao1.Empresa in [empEletro, empPetromax] then
  Begin
    zrlQtdFaturado1.Caption  := Format('%.2f',[vQtdFaturado1]);
    zrlQtdFaturado2.Caption  := Format('%.2f',[vQtdFaturado2]);
    zrlQtdFaturado.Caption   := Format('%.2f',[vQtdFaturado1+vQtdFaturado2]);

    zrlQtdDevolvido1.Caption  := Format('%.2f',[vQtdDevolvido1]);
    zrlQtdDevolvido2.Caption  := Format('%.2f',[vQtdDevolvido2]);
    zrlQtdDevolvido.Caption   := Format('%.2f',[vQtdDevolvido1+vQtdDevolvido2]);
  end
  else
  Begin
    zrlQtdFaturado1.Caption  := IntToStr(Trunc(vQtdFaturado1));
    zrlQtdFaturado2.Caption  := IntToStr(Trunc(vQtdFaturado2));
    zrlQtdFaturado.Caption   := IntToStr(Trunc(vQtdFaturado1)+Trunc(vQtdFaturado2));

    zrlQtdDevolvido1.Caption  := IntToStr(Trunc(vQtdDevolvido1));
    zrlQtdDevolvido2.Caption  := IntToStr(Trunc(vQtdDevolvido2));
    zrlQtdDevolvido.Caption   := IntToStr(Trunc(vQtdDevolvido1)+Trunc(vQtdDevolvido2));
  end;

  zrlFaturado1.Caption  := Format('%.2f',[vFaturado1]);
  zrlFaturado2.Caption  := Format('%.2f',[vFaturado2]);
  zrlFaturado.Caption   := Format('%.2f',[vFaturado1+vFaturado2]);

  zrlDevolvido1.Caption := Format('%.2f',[vDevolvido1]);
  zrlDevolvido2.Caption := Format('%.2f',[vDevolvido2]);
  zrlDevolvido.Caption  := Format('%.2f',[vDevolvido1+vDevolvido2]);

  zrlSaldo1.Caption  := Format('%.2f',[vFaturado1-vDevolvido1]);
  zrlSaldo2.Caption  := Format('%.2f',[vFaturado2-vDevolvido2]);
  zrlSaldo.Caption   := Format('%.2f',[StrToFloat(zrlSaldo1.Caption)+StrToFloat(zrlSaldo2.Caption)]);

  if DM.Configuracao1.Empresa = empEletro then
  Begin
    vFaturado := Arredonda(StrToFloat(zrlSaldo1.Caption));
    if vFaturado > Arredonda(StrToFloat(zrlMeta.Caption)) then
      zrlComissao1.Caption  := Format('%.2f',[vFaturado*Funcionario1.PerAcima/100])
    else
      zrlComissao1.Caption  := Format('%.2f',[vFaturado*Funcionario1.PerAbaixo/100]);

    vComissaoTotal1 := vComissaoTotal1 + StrToFloat(zrlComissao1.Caption);

    vFaturado := Arredonda(StrToFloat(zrlSaldo2.Caption));
    if vFaturado > Arredonda(StrToFloat(zrlMeta.Caption)) then
      zrlComissao2.Caption  := Format('%.2f',[vFaturado*Funcionario1.PerAcima/100])
    else
      zrlComissao2.Caption  := Format('%.2f',[vFaturado*Funcionario1.PerAbaixo/100]);

    vComissaoTotal2 := vComissaoTotal2 + StrToFloat(zrlComissao2.Caption);

    zrlComissao.Caption   := Format('%.2f',[StrToFloat(zrlComissao1.Caption)+StrToFloat(zrlComissao2.Caption)]);
  end
  else
  Begin
    zrlComissao1.Caption  := Format('%.2f',[vComissao1]);
    zrlComissao2.Caption  := Format('%.2f',[vComissao2]);
    zrlComissao.Caption   := Format('%.2f',[vComissao1+vComissao2]);
  end;
end;

procedure Trpt_ComissaoVendaCompleto.zrbGrupoDiaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  vQtdFaturadoDia1 := 0;
  vQtdFaturadoDia2 := 0;
  vQtdDevolvidoDia1 := 0;
  vQtdDevolvidoDia2 := 0;

  if zrbGrupoDia.Height > 0 then
    zrlDescData.Caption := '** '+Copy(Entidade.FieldByName('DATA_ORDEM').asString,7,2)+'/'+
                           Copy(Entidade.FieldByName('DATA_ORDEM').asString,4,2)+'/20'+
                           Copy(Entidade.FieldByName('DATA_ORDEM').asString,1,2);
end;

procedure Trpt_ComissaoVendaCompleto.zrbRodapeGrupoDiaBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  if DM.Configuracao1.Empresa in [empEletro, empPetromax] then
  Begin
    zrlQtdFaturadoDia1.Caption  := Format('%.2f',[vQtdFaturadoDia1]);
    zrlQtdFaturadoDia2.Caption  := Format('%.2f',[vQtdFaturadoDia2]);
    zrlQtdFaturadoDia.Caption   := Format('%.2f',[vQtdFaturadoDia1+vQtdFaturadoDia2]);

    zrlQtdDevolvidoDia1.Caption  := Format('%.2f',[vQtdDevolvidoDia1]);
    zrlQtdDevolvidoDia2.Caption  := Format('%.2f',[vQtdDevolvidoDia2]);
    zrlQtdDevolvidoDia.Caption   := Format('%.2f',[vQtdDevolvidoDia1+vQtdDevolvidoDia2]);
  end
  else
  Begin
    zrlQtdFaturadoDia1.Caption  := IntToStr(Trunc(vQtdFaturadoDia1));
    zrlQtdFaturadoDia2.Caption  := IntToStr(Trunc(vQtdFaturadoDia2));
    zrlQtdFaturadoDia.Caption   := IntToStr(Trunc(vQtdFaturadoDia1)+Trunc(vQtdFaturadoDia2));

    zrlQtdDevolvidoDia1.Caption  := IntToStr(Trunc(vQtdDevolvidoDia1));
    zrlQtdDevolvidoDia2.Caption  := IntToStr(Trunc(vQtdDevolvidoDia2));
    zrlQtdDevolvidoDia.Caption   := IntToStr(Trunc(vQtdDevolvidoDia1)+Trunc(vQtdDevolvidoDia2));
  end;

  if Arredonda(vQtdFaturadoDia1-vQtdDevolvidoDia1) >= Arredonda(DM.Configuracao1.LaboratorioMeta) then
  Begin
    zrlComissaoDia1.Caption  := Format('%.2f',[(vQtdFaturadoDia1-vQtdDevolvidoDia1)*DM.Configuracao1.LaboratorioCota2]);
    vComissao1 := vComissao1 + Arredonda((vQtdFaturadoDia1-vQtdDevolvidoDia1)*DM.Configuracao1.LaboratorioCota2);
    vComissaoTotal1 := vComissaoTotal1 + Arredonda((vQtdFaturadoDia1-vQtdDevolvidoDia1)*DM.Configuracao1.LaboratorioCota2);
  end
  else
  Begin
    zrlComissaoDia1.Caption  := Format('%.2f',[(vQtdFaturadoDia1-vQtdDevolvidoDia1)*DM.Configuracao1.LaboratorioCota1]);
    vComissao1 := vComissao1 + Arredonda((vQtdFaturadoDia1-vQtdDevolvidoDia1)*DM.Configuracao1.LaboratorioCota1);
    vComissaoTotal1 := vComissaoTotal1 + Arredonda((vQtdFaturadoDia1-vQtdDevolvidoDia1)*DM.Configuracao1.LaboratorioCota1);
  end;

  //Se for Montagem será QTD2 para ser calculado com Cota do Funcionario
  if Arredonda(vQtdFaturado2) >= Arredonda(Funcionario1.Cota) then
  Begin
    zrlComissaoDia2.Caption  := Format('%.2f',[(vQtdFaturadoDia2-vQtdDevolvidoDia2)*Funcionario1.PerAcima]);
    vComissao2 := vComissao2 + Arredonda((vQtdFaturadoDia2-vQtdDevolvidoDia2)*Funcionario1.PerAcima);
    vComissaoTotal2 := vComissaoTotal2 + Arredonda((vQtdFaturadoDia2-vQtdDevolvidoDia2)*Funcionario1.PerAcima);
  end
  else
  Begin
    zrlComissaoDia2.Caption  := Format('%.2f',[(vQtdFaturadoDia2-vQtdDevolvidoDia2)*Funcionario1.PerAbaixo]);
    vComissao2 := vComissao2 + Arredonda((vQtdFaturadoDia2-vQtdDevolvidoDia2)*Funcionario1.PerAbaixo);
    vComissaoTotal2 := vComissaoTotal2 + Arredonda((vQtdFaturadoDia2-vQtdDevolvidoDia2)*Funcionario1.PerAbaixo);
  end;

  zrlComissaoDia.Caption   := Format('%.2f',[StrToFloat(zrlComissaoDia1.Caption)+StrToFloat(zrlComissaoDia2.Caption)]);
end;

end.
