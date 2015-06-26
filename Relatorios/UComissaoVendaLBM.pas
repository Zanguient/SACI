unit UComissaoVendaLBM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Item_Pedido_Venda, Funcionario,
  Produto, Cota, Item_de_Cota, Item_de_Troca;

type
  Trpt_ComissaoLBM = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    zrbGrupoFUN: TSZRGroup;
    ZRBand5: TSZRBand;
    zrlDescVendedor: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRDBText4: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText10: TSZRDBText;
    zrlDescFaturado: TSZRLabel;
    zrlDescComissao: TSZRLabel;
    ZRLabel24: TSZRLabel;
    Funcionario1: TFuncionario;
    zrlFaturado: TSZRLabel;
    Produto1: TProduto;
    SZRLabel5: TSZRLabel;
    zrlVendedor: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel5: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlComissao: TSZRLabel;
    SZRExpression1: TSZRExpression;
    Item_de_Cota1: TItem_de_Cota;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    SZRLabel6: TSZRLabel;
    zrlDescDevolvido: TSZRLabel;
    zrlDevolvido: TSZRLabel;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    Item_de_Troca1: TItem_de_Troca;
    Item_de_Troca1SOMA: TFloatField;
    Item_Pedido_Venda2SOMA: TFloatField;
    ZRLabel4: TSZRLabel;
    zrlDescDevolvidoParcial: TSZRLabel;
    zrlDevolvidoParcial: TSZRLabel;
    Item_de_Troca2: TItem_de_Troca;
    FloatField1: TFloatField;
    zrlUsuario: TSZRLabel;
    zrlFiltro: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlDetalhe: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlFaturadoTotal: TSZRLabel;
    zrlComissaoTotal: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlDevolvidoTotal: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlDevolvidoParcialTotal: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoFUNBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    Faturado, FaturadoTotal, DevParcTotal, DevolvidoTotal, ComissaoTotal :Double;
  public
    vComissaoIndicacao: Boolean;
  end;

var
  rpt_ComissaoLBM: Trpt_ComissaoLBM;

implementation
Uses
  UDM, Funcoes, URelDataVend, MxSelDataComissao;
{$R *.DFM}

procedure Trpt_ComissaoLBM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Item_Pedido_Venda1.Close;
  Item_de_Cota1.Close;
  Funcionario1.Close;
  Produto1.Close;
  Action := cafree;
end;

procedure Trpt_ComissaoLBM.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda1.CodigoPRD;
    Open;
    zrlProduto.Caption    := Descricao;
    zrlReferencia.Caption := Referencia;
    zrlDetalhe.Caption    := Detalhe;
  end;
  Faturado      := Faturado      + Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade);
  FaturadoTotal := FaturadoTotal + Arredonda(Arredonda(Item_Pedido_Venda1.PrecoDesc)*Item_Pedido_Venda1.Quantidade);
end;

procedure Trpt_ComissaoLBM.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  Devolvido,DevParc:Double;
begin
  DevParc   := 0;
  Devolvido := 0;

  if not vComissaoIndicacao then
  Begin
    Item_de_Troca2.Close;
    Item_de_Troca2.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
    Item_de_Troca2.ParamByName('FUN_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoFUN;
    Item_de_Troca2.ParamByName('DATAINI').asDate:=StrToDate('21/'+fMxSelDataComissao.cMes1+'/'+fMxSelDataComissao.cAno1);
    Item_de_Troca2.ParamByName('DATAFIM').asDate:=StrToDate('21/'+fMxSelDataComissao.cMes2+'/'+fMxSelDataComissao.cAno2);
    Item_de_Troca2.Open;
    DevParc      :=                Arredonda(Item_de_Troca2.FieldByName('SOMA').asFloat);
    DevParcTotal := DevParcTotal + Arredonda(Item_de_Troca2.FieldByName('SOMA').asFloat);
    zrlDevolvidoParcial.Caption:=Format('%.2f',[DevParc]);

    Item_de_Troca1.Close;
    Item_de_Troca1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
    Item_de_Troca1.ParamByName('FUN_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoFUN;
    Item_de_Troca1.ParamByName('DATAINI').asDate:=StrToDate('21/'+fMxSelDataComissao.cMes1+'/'+fMxSelDataComissao.cAno1);
    Item_de_Troca1.ParamByName('DATAFIM').asDate:=StrToDate('21/'+fMxSelDataComissao.cMes2+'/'+fMxSelDataComissao.cAno2);
    Item_de_Troca1.Open;
    Item_Pedido_Venda2.Close;
    Item_Pedido_Venda2.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
    Item_Pedido_Venda2.ParamByName('FUN_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoFUN;
    Item_Pedido_Venda2.ParamByName('DATAINI').asDate:=StrToDate('21/'+fMxSelDataComissao.cMes1+'/'+fMxSelDataComissao.cAno1);
    Item_Pedido_Venda2.ParamByName('DATAFIM').asDate:=StrToDate('21/'+fMxSelDataComissao.cMes2+'/'+fMxSelDataComissao.cAno2);
    Item_Pedido_Venda2.Open;
    Devolvido      := Arredonda(Item_de_Troca1.FieldByName('SOMA').asFloat)+
                      Arredonda(Item_Pedido_Venda2.FieldByName('SOMA').asFloat);
    DevolvidoTotal := DevolvidoTotal + Arredonda(Item_de_Troca1.FieldByName('SOMA').asFloat)+
                                       Arredonda(Item_Pedido_Venda2.FieldByName('SOMA').asFloat);
    zrlFaturado.Caption  := Format('%.2f',[Faturado]);
    zrlDevolvido.Caption := Format('%.2f',[Devolvido]);
  end;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then //Dif. LBM Servicos
  Begin
    Item_de_Cota1.Close;
    Item_de_Cota1.ParamByName('CNC_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoCNC;
    Item_de_Cota1.ParamByName('FUN_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoFUN;
    Item_de_Cota1.ParamByName('Mes').asInteger:=StrToInt(copy(fMxSelDataComissao.mskPeriodo.Text,1,2));
    Item_de_Cota1.ParamByName('Ano').asInteger:=StrToInt(copy(fMxSelDataComissao.mskPeriodo.Text,4,4));
    Item_de_Cota1.Open;
    if Item_de_Cota1.IsEmpty then
      zrlComissao.Caption:='Sem Cota'
    else if (Faturado+DevParc-Devolvido) < Item_de_Cota1.Cota2 then
    Begin
      zrlComissao.Caption:=Format('%.2f',[(Faturado+DevParc-Devolvido)*Item_de_Cota1.Comissao1/100]);
      ComissaoTotal := ComissaoTotal + Arredonda((Faturado+DevParc-Devolvido)*Item_de_Cota1.Comissao1/100);
    end
    else if (Faturado+DevParc-Devolvido) < Item_de_Cota1.Cota3 then
    Begin
      zrlComissao.Caption:=Format('%.2f',[(Faturado+DevParc-Devolvido)*Item_de_Cota1.Comissao2/100]);
      ComissaoTotal := ComissaoTotal + Arredonda((Faturado+DevParc-Devolvido)*Item_de_Cota1.Comissao2/100);
    end
    else if (Faturado+DevParc-Devolvido) < Item_de_Cota1.Cota4 then
    Begin
      zrlComissao.Caption:=Format('%.2f',[(Faturado+DevParc-Devolvido)*Item_de_Cota1.Comissao3/100]);
      ComissaoTotal := ComissaoTotal + Arredonda((Faturado+DevParc-Devolvido)*Item_de_Cota1.Comissao3/100);
    end
    else
    Begin
      zrlComissao.Caption:=Format('%.2f',[(Faturado+DevParc-Devolvido)*Item_de_Cota1.Comissao4/100]);
      ComissaoTotal := ComissaoTotal + Arredonda((Faturado+DevParc-Devolvido)*Item_de_Cota1.Comissao4/100);
    end;
  end
  else  //LBM SERVICOS
  Begin
    if (Faturado+DevParc-Devolvido) < Funcionario1.Cota then
    Begin
      zrlComissao.Caption:=Format('%.2f',[(Faturado+DevParc-Devolvido)*Funcionario1.PerAbaixo/100]);
      ComissaoTotal := ComissaoTotal + Arredonda((Faturado+DevParc-Devolvido)*Funcionario1.PerAbaixo/100);
    end
    else
    Begin
      zrlComissao.Caption:=Format('%.2f',[(Faturado+DevParc-Devolvido)*Funcionario1.PerAcima/100]);
      ComissaoTotal := ComissaoTotal + Arredonda((Faturado+DevParc-Devolvido)*Funcionario1.PerAcima/100);
    end;
  end;
end;

procedure Trpt_ComissaoLBM.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_ComissaoLBM.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  if vComissaoIndicacao then
  Begin
    zrlDescDevolvido.Enabled := False;
    zrlDevolvido.Enabled := False;
    zrlDescDevolvidoParcial.Enabled := False;
    zrlDevolvidoParcial.Enabled := False;
  end;
end;

procedure Trpt_ComissaoLBM.zrbGrupoFUNBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Faturado:=0;
  with Funcionario1 do
  Begin
    Close;
    ParamByName('FUN_CODIGO').asInteger := Item_Pedido_Venda1.FieldByName('VENDEDOR').asInteger;
    Open;
    zrlVendedor.Caption := Apelido+' ('+IntToStr(CodigoFUN)+')';
  end;
end;

procedure Trpt_ComissaoLBM.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

procedure Trpt_ComissaoLBM.FormCreate(Sender: TObject);
begin
  vComissaoIndicacao := False;
end;

procedure Trpt_ComissaoLBM.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlFaturadoTotal.Caption         := Format('%.2f',[FaturadoTotal]);
  zrlDevolvidoParcialTotal.Caption := Format('%.2f',[DevParcTotal]);
  zrlDevolvidoTotal.Caption        := Format('%.2f',[DevolvidoTotal]);
  zrlComissaoTotal.Caption         := Format('%.2f',[ComissaoTotal]);
end;

end.
