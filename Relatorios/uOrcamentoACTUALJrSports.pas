unit uOrcamentoACTUALJrSports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Produto, Pedido_de_Venda, Parametro, Funcionario, Usuario, Municipio,
  Item_Produto_Lote, Item_Pedido_Venda, CentroCusto;

type
  Trpt_OrcamentoACTUALJrSports = class(TForm)
    report: TSZReport;
    ZRBand2: TSZRBand;
    Pedido_de_Venda1: TPedido_de_Venda;
    ZRDBText3: TSZRDBText;
    ZRDBText9: TSZRDBText;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_RZ_SOCIAL: TStringField;
    Pedido_de_Venda1CLI_LOGRADOURO: TIntegerField;
    Pedido_de_Venda1CLI_ENDERECO: TStringField;
    Pedido_de_Venda1CLI_BAIRRO: TStringField;
    Pedido_de_Venda1CLI_CIDADE: TStringField;
    Pedido_de_Venda1CLI_UF: TStringField;
    Pedido_de_Venda1CLI_FONE: TStringField;
    Pedido_de_Venda1IPV_QUANTIDADE: TFloatField;
    Pedido_de_Venda1IPV_CODIGO: TIntegerField;
    Pedido_de_Venda1PRD_CODIGO: TIntegerField;
    Pedido_de_Venda1IPV_PRECO: TFloatField;
    Pedido_de_Venda1IPV_PRECO_DESC: TFloatField;
    Pedido_de_Venda1PRD_DESCRICAO: TStringField;
    Pedido_de_Venda1PRD_REFERENCIA: TStringField;
    Pedido_de_Venda1PRD_MARCA: TStringField;
    Pedido_de_Venda1PRD_UNIDADE: TStringField;
    Parametro1: TParametro;
    Funcionario1: TFuncionario;
    Pedido_de_Venda1FUN_CODIGO: TIntegerField;
    SZRLabel12: TSZRLabel;
    zrlValorUnitario: TSZRLabel;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    SZRLabel10: TSZRLabel;
    Pedido_de_Venda1CLI_DT_CADASTRO: TDateTimeField;
    Pedido_de_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Pedido_de_Venda1IPV_DESCONTO: TFloatField;
    Pedido_de_Venda1DIS_CODIGO: TIntegerField;
    Pedido_de_Venda1PRD_PESO_LIQUIDO: TFloatField;
    Pedido_de_Venda1IPV_PENDENCIA: TIntegerField;
    SZRBand2: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    ZRLabel28: TSZRLabel;
    ZRLabel29: TSZRLabel;
    ZRLabel30: TSZRLabel;
    ZRLabel2: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRBand1: TSZRBand;
    ZRLabel5: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText1: TSZRDBText;
    ZRDBText4: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRBand3: TSZRBand;
    SZRLabel33: TSZRLabel;
    SZRLabel34: TSZRLabel;
    Usuario1: TUsuario;
    SZRDBText7: TSZRDBText;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Usuario1USU_CODIGO: TIntegerField;
    Usuario1CNC_CODIGO: TIntegerField;
    Usuario1USU_NOME: TStringField;
    Pedido_de_Venda1USU_CODIGO: TIntegerField;
    SZRLabel23: TSZRLabel;
    Pedido_de_Venda1IEB_CODIGO: TIntegerField;
    SZRLabel39: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRLabel40: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel43: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel19: TSZRLabel;
    SZRLabel36: TSZRLabel;
    Pedido_de_Venda1CLI_CGC_CPF: TStringField;
    Municipio1: TMunicipio;
    SZRLabel14: TSZRLabel;
    Pedido_de_Venda1MUN_CODIGO: TIntegerField;
    SZRLabel1: TSZRLabel;
    Item_Produto_Lote1: TItem_Produto_Lote;
    Item_Produto_Lote2: TItem_Produto_Lote;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Pedido_de_Venda1PRD_QTD_UNIDADE: TIntegerField;
    Pedido_de_Venda1PRD_UNID_TOTAL: TStringField;
    Pedido_de_Venda1PRD_EMITE_NOTA: TSmallintField;
    Pedido_de_Venda1PDV_DESC_GLOBAL: TFloatField;
    Pedido_de_Venda1CLI_CGF_RG: TStringField;
    Pedido_de_Venda1IPV_BONIFICACAO: TFloatField;
    Pedido_de_Venda1CLI_FAX: TStringField;
    ZRLabel3: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel28: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRLabel31: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel35: TSZRLabel;
    SZRLabel37: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel44: TSZRLabel;
    Pedido_de_Venda1IPV_DESCONTO_GLOBAL: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TamanhoProximoProduto(Prd: Integer);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Total, TotQtd, TotItem, TotPeso, SubTot:Double;
  end;

var
  rpt_OrcamentoACTUALJrSports: Trpt_OrcamentoACTUALJrSports;

implementation
uses
 UDM, funcoes, MxPedidoRapido, MxSPediLocComp, MxImprime, Forma_de_Pagamento, MxValidaPedPalm,
  MxSPediLocLibPed, MxCentralCaixa;

{$R *.DFM}

procedure Trpt_OrcamentoACTUALJrSports.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Pedido_de_Venda1.Close;
  Parametro1.Close;
  Municipio1.Close;
  Action:=cafree;
end;

procedure Trpt_OrcamentoACTUALJrSports.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  //
{  if Pedido_de_Venda1.RecordCount <=17 then
    SZRBand2.Height := 8
  else
    SZRBand2.Height := 6;
}  //
  Total:=0;
  TotQtd:=0;
  TotItem:=0;
  TotPeso:=0;
  SubTot:=0;
end;

procedure Trpt_OrcamentoACTUALJrSports.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  PrecSug: String;
  PrecDesc, Apresenta: String;
begin
   if DM.Configuracao1.FormularioNF = 14 then
   begin
     ZRDBText9.Left := 0;
     SZRLabel23.Left := 7;
     SZRLabel6.Left := 0;
     SZRLabel4.Left := 7;
   end;
   //
   Apresenta := '';
   PrecSug := format('%.2f',[Pedido_de_Venda1.FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
   PrecDesc := CalcularValorUnitarioStr(Pedido_de_Venda1.FieldByName('IPV_PRECO_DESC').AsFloat);
   //
   zrlValorUnitario.Caption := PrecDesc;
   SZRLabel10.Caption := '0,00';

   SZRLabel23.Caption := format('%.2f',[Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat+Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').AsFloat]);
   SZRLabel12.Caption := CalcularTotalItemStr(StrToFloat(PrecDesc), Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat, Pedido_de_Venda1.FieldByName('IPV_DESCONTO_GLOBAL').AsFloat);
   if PrecSug < PrecDesc then
     SubTot := SubTot + CalcularTotalItem(StrToFloat(PrecDesc), Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat, Pedido_de_Venda1.FieldByName('IPV_DESCONTO_GLOBAL').AsFloat)
   else
     SubTot := SubTot + CalcularTotalItem(StrToFloat(PrecSug), Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat, 0);
   Total := Total + CalcularTotalItem(StrToFloat(PrecDesc), Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat, Pedido_de_Venda1.FieldByName('IPV_DESCONTO_GLOBAL').AsFloat);
   TotQtd := TotQtd + StrToFloat(format('%.2f',[Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat+Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').AsFloat]));
   TotItem := TotItem+1;
   TotPeso := TotPeso + StrToFloat(format('%.2f',[((Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat+Pedido_de_Venda1.FieldByName('IPV_BONIFICACAO').AsFloat)*Pedido_de_Venda1.FieldByName('PRD_PESO_LIQUIDO').AsFloat)/1000]));
   //
   SZRLabel1.Caption := '';
   Apresenta := Pedido_de_Venda1.FieldByName('PRD_UNIDADE').AsString+' c/ '+IntToStr(Pedido_de_Venda1.FieldByName('PRD_QTD_UNIDADE').AsInteger)+' '+Pedido_de_Venda1.FieldByName('PRD_UNID_TOTAL').AsString;
   if DM.Configuracao1.ControleLote = 1 then
   begin
     SZRLabel23.Caption := format('%.0f',[Pedido_de_Venda1.FieldByName('IPV_QUANTIDADE').AsFloat])+' '+Copy(Pedido_de_Venda1.FieldByName('PRD_UNIDADE').AsString,1,2);
     Item_Produto_Lote1.Close;
     Item_Produto_Lote1.ParambyName('PDV_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('PDV_CODIGO').AsInteger;
     Item_Produto_Lote1.ParambyName('IPV_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('IPV_CODIGO').AsInteger;
     Item_Produto_Lote1.Open;
     if not Item_Produto_Lote1.IsEmpty then
     begin
       with Item_Produto_Lote1 do
       begin
         SZRLabel1.Caption := '';
         First;
         while not eof do
         begin
           SZRLabel1.Caption := SZRLabel1.Caption+'* Lote.:'+FieldByName('LOT_LOTE').asString+'  Qtd.:'+Format('%.2f',[FieldByName('IPL_QUANTIDADE').asFloat])+'  Venc.:'+DateTimeToStr(FieldByName('LOT_DT_VENCIMENTO').asDateTime)+'  Apres.:'+Apresenta+#13+#10;
           Next;
         end;
         SZRLabel1.Enabled:=True;
       end;
     end;
     TamanhoProximoProduto(Pedido_de_Venda1.FieldByName('PRD_CODIGO').AsInteger);
   end;
end;

procedure Trpt_OrcamentoACTUALJrSports.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Pedido_de_Venda1.FieldByName('PDV_DESC_GLOBAL').asFloat > 0 then
  begin
    SZRLabel44.Caption := Format('%.2f', [Pedido_de_Venda1.FieldByName('PDV_DESC_GLOBAL').asFloat]);
    Total := Total - Pedido_de_Venda1.FieldByName('PDV_DESC_GLOBAL').asFloat;
  end
  else
  begin
    SZRLabel44.Enabled := false;
    SZRLabel38.Enabled := false;
  end;
  //
  if Total-SubTot < 0 then
    begin
      ZRLabel19.Caption:=Format('%.2f', [SubTot]);
      ZRLabel2.Caption:=Format('%.2f', [Total]);
//      ZRLabel3.Caption:=Format('%.2f', [Total-SubTot]);
    end
  else
    begin
      ZRLabel19.Caption:=Format('%.2f', [Total]);
      ZRLabel2.Caption:=Format('%.2f', [Total]);
//      ZRLabel3.Caption:='0,00';
    end;

  ZRLabel29.Caption:=Format('%.0f', [TotItem]);
  ZRLabel28.Caption:=Format('%.2f', [TotQtd]);
  ZRLabel30.Caption:=Format('%.2f', [TotPeso]);
  //
  if rpt_OrcamentoACTUAL.Tag = 1 then
  begin
    fMxSPedLocComp.Parametro1.Close;
    fMxSPedLocComp.Parametro1.ParamByName('PAR_CODIGO').asInteger:=fMxSPedLocComp.Pedido_de_Venda1.TipoPag;
    fMxSPedLocComp.Parametro1.Open;
    fMxSPedLocComp.Forma_de_Pagamento1.Close;
    fMxSPedLocComp.Forma_de_Pagamento1.ParamByName('FPG_CODIGO').asInteger:=fMxSPedLocComp.Pedido_de_Venda1.CodigoFPG;
    fMxSPedLocComp.Forma_de_Pagamento1.Open;
    if fMxSPedLocComp.Forma_de_Pagamento1.PrazoMedio = 0 then
      SZRLabel30.Caption:=fMxSPedLocComp.Parametro1.Descricao+'/A VISTA/'+fMxSPedLocComp.Forma_de_Pagamento1.Descricao
    else
      SZRLabel30.Caption:=fMxSPedLocComp.Parametro1.Descricao+'/'+IntToStr(fMxSPedLocComp.Forma_de_Pagamento1.PrazoMedio)+'(Dias)/'+fMxSPedLocComp.Forma_de_Pagamento1.Descricao;

//    fMxSPedLocComp.Titulo_receber5.Close;
//    fMxSPedLocComp.Titulo_receber5.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
//    fMxSPedLocComp.Titulo_receber5.ParamByName('CLI_CODIGO').asInteger:=fMxSPedLocComp.Pedido_de_Venda1.CodigoCLI;
//    fMxSPedLocComp.Titulo_receber5.ParamByName('DATA').asDate:=DM.Configuracao1.Data;
//    fMxSPedLocComp.Titulo_receber5.Open;
  end
  else if rpt_OrcamentoACTUAL.Tag = 2 then
  begin
    if fMxPedidoRapido.Forma_de_Pagamento1.PrazoMedio = 0 then
      SZRLabel30.Caption:=fMxPedidoRapido.Parametro1.Descricao+'/A VISTA/'+fMxPedidoRapido.Forma_de_Pagamento1.Descricao
    else
      SZRLabel30.Caption:=fMxPedidoRapido.Parametro1.Descricao+'/'+IntToStr(fMxPedidoRapido.Forma_de_Pagamento1.PrazoMedio)+'(Dias)/'+fMxPedidoRapido.Forma_de_Pagamento1.Descricao;

//    fMxPedidoRapido.Titulo_receber5.Close;
//    fMxPedidoRapido.Titulo_receber5.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
//    fMxPedidoRapido.Titulo_receber5.ParamByName('CLI_CODIGO').asInteger:=StrToInt(fMxPedidoRapido.Edit5.Text);
//    fMxPedidoRapido.Titulo_receber5.ParamByName('DATA').asDate:=DM.Configuracao1.Data;
//    fMxPedidoRapido.Titulo_receber5.Open;
  end
  else if rpt_OrcamentoACTUAL.Tag = 3 then
  begin
    fMxImprime.Parametro1.Close;
    fMxImprime.Parametro1.ParamByName('PAR_CODIGO').asInteger:=fMxImprime.Pedido_de_Venda1.TipoPag;
    fMxImprime.Parametro1.Open;
    fMxImprime.Forma_de_Pagamento1.Close;
    fMxImprime.Forma_de_Pagamento1.ParamByName('FPG_CODIGO').asInteger:=fMxImprime.Pedido_de_Venda1.CodigoFPG;
    fMxImprime.Forma_de_Pagamento1.Open;
    if fMxImprime.Forma_de_Pagamento1.PrazoMedio = 0 then
      SZRLabel30.Caption:=fMxImprime.Parametro1.Descricao+'/A VISTA/'+fMxImprime.Forma_de_Pagamento1.Descricao
    else
      SZRLabel30.Caption:=fMxImprime.Parametro1.Descricao+'/'+IntToStr(fMxImprime.Forma_de_Pagamento1.PrazoMedio)+'(Dias)/'+fMxImprime.Forma_de_Pagamento1.Descricao;

//    fMxImprime.Titulo_receber5.Close;
//    fMxImprime.Titulo_receber5.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
//    fMxImprime.Titulo_receber5.ParamByName('CLI_CODIGO').asInteger:=fMxImprime.Pedido_de_Venda1.CodigoCLI;
//    fMxImprime.Titulo_receber5.ParamByName('DATA').asDate:=DM.Configuracao1.Data;
//    fMxImprime.Titulo_receber5.Open;
  end
  else if rpt_OrcamentoACTUAL.Tag = 4 then
  begin
    fMxValidaPedPalm.Parametro1.Close;
    fMxValidaPedPalm.Parametro1.ParamByName('PAR_CODIGO').asInteger:=fMxValidaPedPalm.Pedido_de_Venda1.TipoPag;
    fMxValidaPedPalm.Parametro1.Open;
    fMxValidaPedPalm.Forma_de_Pagamento1.Close;
    fMxValidaPedPalm.Forma_de_Pagamento1.ParamByName('FPG_CODIGO').asInteger:=fMxValidaPedPalm.Pedido_de_Venda1.CodigoFPG;
    fMxValidaPedPalm.Forma_de_Pagamento1.Open;
    if fMxValidaPedPalm.Forma_de_Pagamento1.PrazoMedio = 0 then
      SZRLabel30.Caption:=fMxValidaPedPalm.Parametro1.Descricao+'/A VISTA/'+fMxValidaPedPalm.Forma_de_Pagamento1.Descricao
    else
      SZRLabel30.Caption:=fMxValidaPedPalm.Parametro1.Descricao+'/'+IntToStr(fMxValidaPedPalm.Forma_de_Pagamento1.PrazoMedio)+'(Dias)/'+fMxValidaPedPalm.Forma_de_Pagamento1.Descricao;

//    fMxValidaPedPalm.Titulo_receber5.Close;
//    fMxValidaPedPalm.Titulo_receber5.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
//    fMxValidaPedPalm.Titulo_receber5.ParamByName('CLI_CODIGO').asInteger:=fMxValidaPedPalm.Pedido_de_Venda1.CodigoCLI;
//    fMxValidaPedPalm.Titulo_receber5.ParamByName('DATA').asDate:=DM.Configuracao1.Data;
//    fMxValidaPedPalm.Titulo_receber5.Open;
  end
  else if rpt_OrcamentoACTUAL.Tag = 5 then
  begin
    fMxSPedLocLibPed.Parametro1.Close;
    fMxSPedLocLibPed.Parametro1.ParamByName('PAR_CODIGO').asInteger:=fMxSPedLocLibPed.Pedido_de_Venda1.TipoPag;
    fMxSPedLocLibPed.Parametro1.Open;
    fMxSPedLocLibPed.Forma_de_Pagamento1.Close;
    fMxSPedLocLibPed.Forma_de_Pagamento1.ParamByName('FPG_CODIGO').asInteger:=fMxSPedLocLibPed.Pedido_de_Venda1.CodigoFPG;
    fMxSPedLocLibPed.Forma_de_Pagamento1.Open;
    if fMxSPedLocLibPed.Forma_de_Pagamento1.PrazoMedio = 0 then
      SZRLabel30.Caption:=fMxSPedLocLibPed.Parametro1.Descricao+'/A VISTA/'+fMxSPedLocLibPed.Forma_de_Pagamento1.Descricao
    else
      SZRLabel30.Caption:=fMxSPedLocLibPed.Parametro1.Descricao+'/'+IntToStr(fMxSPedLocLibPed.Forma_de_Pagamento1.PrazoMedio)+'(Dias)/'+fMxSPedLocLibPed.Forma_de_Pagamento1.Descricao;
  end
  else if rpt_OrcamentoACTUAL.Tag = 6 then
  begin
    fMxCentralCaixa.Parametro3.Close;
    fMxCentralCaixa.Parametro3.ParamByName('PAR_CODIGO').asInteger:=fMxCentralCaixa.Pedido_de_Venda1.TipoPag;
    fMxCentralCaixa.Parametro3.Open;
    fMxCentralCaixa.Forma_de_Pagamento1.Close;
    fMxCentralCaixa.Forma_de_Pagamento1.ParamByName('FPG_CODIGO').asInteger:=fMxCentralCaixa.Pedido_de_Venda1.CodigoFPG;
    fMxCentralCaixa.Forma_de_Pagamento1.Open;
    if fMxCentralCaixa.Forma_de_Pagamento1.PrazoMedio = 0 then
      SZRLabel30.Caption:=fMxCentralCaixa.Parametro3.Descricao+'/A VISTA/'+fMxCentralCaixa.Forma_de_Pagamento1.Descricao
    else
      SZRLabel30.Caption:=fMxCentralCaixa.Parametro3.Descricao+'/'+IntToStr(fMxCentralCaixa.Forma_de_Pagamento1.PrazoMedio)+'(Dias)/'+fMxCentralCaixa.Forma_de_Pagamento1.Descricao;
  end;
  //
  Usuario1.Close;
  Usuario1.ParamByName('USU_CODIGO').asInteger:=Pedido_de_Venda1.CodigoUSU;
  Usuario1.Open;
  SZRLabel36.Caption  := Copy(Usuario1.FieldByName('USU_NOME').AsString,1,8);


  if DM.Configuracao1.FormularioNF = 13 then
  begin
    SZRLabel32.Caption := ' UMA GOLEADA DE MENOR PREÇO';
    SZRLabel35.Caption := '';
  end
  else if DM.Configuracao1.FormularioNF in [14,17] then
  begin
    SZRLabel32.Caption := 'Agradecemos a Preferencia. Volte Sempre!';
    SZRLabel35.Caption := '';
  end;
end;

procedure Trpt_OrcamentoACTUALJrSports.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  If Length(Pedido_de_Venda1.FieldByName('CLI_CGC_CPF').asString) <> 14 then
    Pedido_de_Venda1CLI_CGC_CPF.EditMask:='999-999-999-99;0;_'
  else
    Pedido_de_Venda1CLI_CGC_CPF.EditMask:='99-999-999/9999-99;0;_';
  //
  SZRLabel39.Caption := DM.Configuracao1.Cidade;
  if Pedido_de_Venda1.FieldByName('CLI_LOGRADOURO').asInteger > 0 then
  Begin
    Parametro1.Close;
    Parametro1.ParamByName('PAR_CODIGO').asInteger:=Pedido_de_Venda1.FieldByName('CLI_LOGRADOURO').asInteger;
    Parametro1.Open;
    SZRLabel3.Caption:=Trim(Parametro1.Descricao)+' '+Trim(Pedido_de_Venda1.FieldByName('CLI_ENDERECO').asString)+' -'+Trim(Pedido_de_Venda1.FieldByName('CLI_BAIRRO').asString);
  end
  else
    SZRLabel3.Caption:=Trim(Pedido_de_Venda1.FieldByName('CLI_ENDERECO').asString)+' -'+Trim(Pedido_de_Venda1.FieldByName('CLI_BAIRRO').asString);

  Municipio1.Close;
  Municipio1.ParamByName('MUN_CODIGO').asInteger:=Pedido_de_Venda1.FieldByName('MUN_CODIGO').asInteger;
  Municipio1.Open;
  SZRLabel14.Caption:=Municipio1.Descricao;

  Funcionario1.Close;
  Funcionario1.ParamByName('CNC_CODIGO').asInteger:=Pedido_de_Venda1.CodigoCNC;
  Funcionario1.ParamByName('FUN_CODIGO').asInteger:=Pedido_de_Venda1.FieldByName('FUN_CODIGO').asInteger;
  Funcionario1.Open;
  SZRLabel9.Caption:=Funcionario1.Apelido;
  //
  Item_Produto_Lote1.Close;
  Item_Produto_Lote1.ParambyName('PDV_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('PDV_CODIGO').AsInteger;
  Item_Produto_Lote1.ParambyName('IPV_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('IPV_CODIGO').AsInteger;
  Item_Produto_Lote1.Open;
  ZRBand2.Height := 1+Item_Produto_Lote1.RecordCount;
end;

procedure Trpt_OrcamentoACTUALJrSports.FormCreate(Sender: TObject);
begin
  if DM.Configuracao1.FormularioNF = 14 then
    report.Height := 66
  else
  begin
    if DM.Configuracao1.ControleLote = 1 then
      report.Height := 66
    else
      report.Height := 32;
  end;
end;

procedure Trpt_OrcamentoACTUALJrSports.TamanhoProximoProduto(Prd: Integer);
begin
  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.parambyname('PDV_CODIGO').AsInteger:=Pedido_de_Venda1.FieldByname('PDV_CODIGO').AsInteger;
  Item_Pedido_Venda1.Open;
  Item_Pedido_Venda1.First;
  While Item_Pedido_Venda1.Fieldbyname('PRD_CODIGO').AsInteger <> Prd do
    Item_Pedido_Venda1.Next;
  //
  Item_Pedido_Venda1.Next;
  Item_Produto_Lote2.Close;
  Item_Produto_Lote2.ParambyName('PDV_CODIGO').asInteger := Item_Pedido_Venda1.FieldByName('PDV_CODIGO').AsInteger;
  Item_Produto_Lote2.ParambyName('IPV_CODIGO').asInteger := Item_Pedido_Venda1.FieldByName('IPV_CODIGO').AsInteger;
  Item_Produto_Lote2.Open;
  ZRBand2.Height := 1+Item_Produto_Lote2.RecordCount
  //
end;

procedure Trpt_OrcamentoACTUALJrSports.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  CentroCusto1.Open;
  SZRLabel25.Caption:=CentroCusto1.Endereco+' - '+CentroCusto1.Bairro;
  SZRLabel26.Caption:='Fone: '+CentroCusto1.Fone+' - Fax: '+CentroCusto1.Fax+' - '+CentroCusto1.Cidade+' - '+CentroCusto1.Uf;


  if DM.Configuracao1.FormularioNF <> 13 then
    SZRLabel28.Caption:='CNPJ: '+CentroCusto1.CGC+' -  IE: '+CentroCusto1.IE;
end;

end.
