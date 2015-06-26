unit UComissaoVendaCompletoQtd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Item_Pedido_Venda, Funcionario,
  Produto, Cota, Item_de_Cota, Item_de_Troca;

type
  Trpt_ComissaoVendaCompletoQtd = class(TForm)
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
    ZRDBText4: TSZRDBText;
    ZRDBText6: TSZRDBText;
    Funcionario1: TFuncionario;
    Produto1: TProduto;
    ZRLabel5: TSZRLabel;
    SZRLabel8: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlDetalhe: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlComissaoTotal1: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlBonificacao: TSZRLabel;
    zrlComissaoTotal2: TSZRLabel;
    zrlSinalMais14: TSZRLabel;
    zrlComissaoTotal: TSZRLabel;
    zrlSinalIgual14: TSZRLabel;
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
    SZRLabel7: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlComissaoEspTotal: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vTotalQtdFaturado1, vTotalQtdDevolvido1, vComissaoQtdGeral1,//Laboratório
    vTotalQtdFaturado2, vTotalQtdDevolvido2, vComissaoQtdGeral2,//Montagem
    vComissaoQtdGeral3: Double; //Diana (Montagem)
  public
    sDtINIMeta, sDtFIMMeta: string; 
    vComissaoIndicacao: Boolean;
    Entidade: TItem_Pedido_Venda;
  end;

var
  rpt_ComissaoVendaCompletoQtd: Trpt_ComissaoVendaCompletoQtd;

implementation
Uses
  UDM, Funcoes, URelDataVend, MxSelDataComissao;
{$R *.DFM}

procedure Trpt_ComissaoVendaCompletoQtd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Funcionario1.Close;
  Produto1.Close;
  Action := cafree;
end;

procedure Trpt_ComissaoVendaCompletoQtd.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vFaturadoItem, vDevolvidoItem, vQtdFaturadoItem, vQtdDevolvidoItem: Double;
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
  end;

  if Entidade.Bonificacao = 0 then
    zrlBonificacao.Caption := '-';

  zrlQuantidade.Caption  := IntToStr(Trunc(Entidade.Quantidade));
  if Entidade.Bonificacao > 0 then
    zrlBonificacao.Caption := IntToStr(Trunc(Entidade.Bonificacao));

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


  if DM.Configuracao1.Empresa = empLuciano then
  Begin
    //Se for Montagem será QTD2 para ser calculado com Cota do Funcionario
    if DM.Configuracao1.Montagem = Entidade.FieldByName('SGP_CODIGO').asInteger then
    Begin
      vTotalQtdFaturado2  := vTotalQtdFaturado2  + vQtdFaturadoItem;
      vTotalQtdDevolvido2 := vTotalQtdDevolvido2 + vQtdDevolvidoItem;
    end
    else
    Begin
      vTotalQtdFaturado1  := vTotalQtdFaturado1  + vQtdFaturadoItem;
      vTotalQtdDevolvido1 := vTotalQtdDevolvido1 + vQtdDevolvidoItem;
    end;
  end
  else
  Begin
    vTotalQtdFaturado1  := vTotalQtdFaturado1  + vQtdFaturadoItem;
    vTotalQtdDevolvido1 := vTotalQtdDevolvido1 + vQtdDevolvidoItem;
  end;
end;

procedure Trpt_ComissaoVendaCompletoQtd.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeEmpresa.Caption:=DM.Configuracao1.LojaNome;
  zrlCentroDeCustoRelatorio.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ComissaoVendaCompletoQtd.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;  
end;

procedure Trpt_ComissaoVendaCompletoQtd.FormCreate(Sender: TObject);
begin
  Entidade := Item_Pedido_Venda1;

  vTotalQtdFaturado1 := 0;
  vTotalQtdFaturado2 := 0;
  vTotalQtdDevolvido1 := 0;
  vTotalQtdDevolvido2 := 0;

  vComissaoIndicacao := False;

  vComissaoQtdGeral1 := 0;
  vComissaoQtdGeral2 := 0;
  vComissaoQtdGeral3 := 0;
end;

procedure Trpt_ComissaoVendaCompletoQtd.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vQtdMes1, vQtdMes2: integer;
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(IPV.IPV_QUANTIDADE-IPV.IPV_BONIFICACAO) AS QTD '+
      ' FROM PEDIDO_DE_VENDA PDV '+
      ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA IPV '+
      ' ON PDV.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND ((PDV.PDV_DATA_HORA>="'+MesDia(sDtINIMeta)+'" '+
      '   AND PDV.PDV_DATA_HORA<"'+MesDia(StrToDate(sDtFIMMeta)+1)+'") '+
      '   OR (PDV.PDV_DATA_HORA<"'+MesDia(sDtFIMMeta)+'" '+
      '   AND PDV.PDV_DT_ENTREGA>="'+MesDia(sDtFIMMeta)+'")) '+
      ' AND PDV.PDV_SITUACAO=4 '+
      ' AND IPV.CNC_CODIGO=PDV.CNC_CODIGO '+
      ' AND IPV.PDV_CODIGO=PDV.PDV_CODIGO '+
      ' INNER JOIN PRODUTO PRD '+
      ' ON PRD.SGP_CODIGO='+IntToStr(DM.Configuracao1.Laboratorio)+
      ' AND IPV.PRD_CODIGO=PRD.PRD_CODIGO ';
    Open;
    vQtdMes1 := FieldByName('QTD').asInteger;

    Close;
    SQL.Text := 'SELECT SUM(IPV.IPV_QUANTIDADE-IPV.IPV_BONIFICACAO) AS QTD '+
      ' FROM PEDIDO_DE_VENDA PDV '+
      ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA IPV '+
      ' ON PDV.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND ((PDV.PDV_DATA_HORA>="'+MesDia(sDtINIMeta)+'" '+
      '   AND PDV.PDV_DATA_HORA<"'+MesDia(StrToDate(sDtFIMMeta)+1)+'") '+
      '   OR (PDV.PDV_DATA_HORA<"'+MesDia(sDtFIMMeta)+'" '+
      '   AND PDV.PDV_DT_ENTREGA>="'+MesDia(sDtFIMMeta)+'")) '+
      ' AND PDV.PDV_SITUACAO=4 '+
      ' AND IPV.CNC_CODIGO=PDV.CNC_CODIGO '+
      ' AND IPV.PDV_CODIGO=PDV.PDV_CODIGO '+
      ' INNER JOIN PRODUTO PRD '+
      ' ON PRD.SGP_CODIGO='+IntToStr(DM.Configuracao1.Montagem)+
      ' AND IPV.PRD_CODIGO=PRD.PRD_CODIGO ';
    Open;
    vQtdMes2 := FieldByName('QTD').asInteger;
  end;

  zrlTotalQtdFaturado1.Caption := IntToStr(Trunc(vTotalQtdFaturado1));
  zrlTotalQtdFaturado2.Caption := IntToStr(Trunc(vTotalQtdFaturado2));
  zrlTotalQtdFaturado.Caption  := IntToStr(Trunc(vTotalQtdFaturado1)+Trunc(vTotalQtdFaturado2));

  zrlTotalQtdDevolvido1.Caption := IntToStr(Trunc(vTotalQtdDevolvido1));
  zrlTotalQtdDevolvido2.Caption := IntToStr(Trunc(vTotalQtdDevolvido2));
  zrlTotalQtdDevolvido.Caption  := IntToStr(Trunc(vTotalQtdDevolvido1)+Trunc(vTotalQtdDevolvido2));

  //Laboratório
  if (Arredonda(vTotalQtdFaturado1) >= Arredonda(DM.Configuracao1.LaboratorioMeta)) or
     (Arredonda(vTotalQtdFaturado1) >= Arredonda(vQtdMes1)) then
    zrlComissaoTotal1.Caption := Format('%.2f',[(vTotalQtdFaturado1-vTotalQtdDevolvido1)*DM.Configuracao1.LaboratorioCota2])
  else
    zrlComissaoTotal1.Caption := Format('%.2f',[(vTotalQtdFaturado1-vTotalQtdDevolvido1)*DM.Configuracao1.LaboratorioCota1]);

  //Montagem
  if (Arredonda(vTotalQtdFaturado2) >= Arredonda(DM.Configuracao1.MontagemMeta)) or
     (Arredonda(vTotalQtdFaturado2) >= Arredonda(vQtdMes2)) then
    zrlComissaoTotal2.Caption := Format('%.2f',[(vTotalQtdFaturado2-vTotalQtdDevolvido2)*DM.Configuracao1.MontagemCota2])
  else
    zrlComissaoTotal2.Caption := Format('%.2f',[(vTotalQtdFaturado2-vTotalQtdDevolvido2)*DM.Configuracao1.MontagemCota1]);

  //Diana calculado com Cota do Funcionario
  if (Arredonda(vTotalQtdFaturado2) >= Arredonda(Funcionario1.Cota)) or
     (Arredonda(vTotalQtdFaturado2) >= Arredonda(vQtdMes2)) then
    zrlComissaoEspTotal.Caption := Format('%.2f',[(vTotalQtdFaturado2-vTotalQtdDevolvido2)*Funcionario1.PerAcima])
  else
    zrlComissaoEspTotal.Caption := Format('%.2f',[(vTotalQtdFaturado2-vTotalQtdDevolvido2)*Funcionario1.PerAbaixo]);

  zrlComissaoTotal.Caption   := Format('%.2f',[vComissaoQtdGeral1+vComissaoQtdGeral2]);
end;

end.
