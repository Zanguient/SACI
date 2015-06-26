unit UPedidoRX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, SQuery, Pedido_de_Venda, ZReport, ZRCtrls, Cliente,
  Item_Pedido_Venda, Detalhe_Venda, StdCtrls, funcoes;

type
  TfmxPedidoRX = class(TForm)
    Pedido_de_Venda1: TPedido_de_Venda;
    SZReport1: TSZReport;
    SZRBand1: TSZRBand;
    SZRLabel68: TSZRLabel;
    SZRSysData1: TSZRSysData;
    SZRLabel69: TSZRLabel;
    SZRLabel70: TSZRLabel;
    SZRLabel71: TSZRLabel;
    SZRLabel72: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel73: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel74: TSZRLabel;
    SZRLabel75: TSZRLabel;
    SZRLabel76: TSZRLabel;
    SZRLabel77: TSZRLabel;
    SZRDBText8: TSZRDBText;
    SZRLabel78: TSZRLabel;
    SZRDBText9: TSZRDBText;
    SZRDBText10: TSZRDBText;
    SZRDBText11: TSZRDBText;
    SZRLabel79: TSZRLabel;
    SZRLabel81: TSZRLabel;
    Cliente1: TCliente;
    zrlCliente: TSZRLabel;
    zrlEndereco: TSZRLabel;
    SZRLabel80: TSZRLabel;
    SZRLabel82: TSZRLabel;
    SZRLabel84: TSZRLabel;
    SZRLabel86: TSZRLabel;
    SZRLabel88: TSZRLabel;
    SZRLabel91: TSZRLabel;
    SZRDBText12: TSZRDBText;
    SZRDBText13: TSZRDBText;
    SZRDBText14: TSZRDBText;
    SZRDBText15: TSZRDBText;
    SZRDBText16: TSZRDBText;
    SZRLabel83: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRLabel31: TSZRLabel;
    SZRLabel34: TSZRLabel;
    SZRLabel37: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlFormulaOD: TSZRLabel;
    zrlFormulaOE: TSZRLabel;
    zrlBaseRealOD: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlNMaterialOD: TSZRLabel;
    zrlBaseRealOE: TSZRLabel;
    zrlNMaterialOE: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel32: TSZRLabel;
    SZRLabel33: TSZRLabel;
    SZRLabel35: TSZRLabel;
    SZRLabel36: TSZRLabel;
    SZRLabel38: TSZRLabel;
    SZRLabel39: TSZRLabel;
    SZRLabel41: TSZRLabel;
    SZRLabel42: TSZRLabel;
    SZRLabel43: TSZRLabel;
    SZRLabel44: TSZRLabel;
    SZRLabel45: TSZRLabel;
    SZRLabel46: TSZRLabel;
    SZRLabel47: TSZRLabel;
    SZRLabel48: TSZRLabel;
    SZRLabel51: TSZRLabel;
    SZRLabel53: TSZRLabel;
    SZRLabel54: TSZRLabel;
    SZRLabel55: TSZRLabel;
    SZRLabel58: TSZRLabel;
    SZRLabel59: TSZRLabel;
    SZRLabel60: TSZRLabel;
    zrlProduto1: TSZRLabel;
    zrlProduto2: TSZRLabel;
    zrlProduto4: TSZRLabel;
    zrlProduto3: TSZRLabel;
    zrlProduto6: TSZRLabel;
    zrlProduto5: TSZRLabel;
    zrlQtdPrd1: TSZRLabel;
    zrlQtdPrd2: TSZRLabel;
    zrlQtdPrd4: TSZRLabel;
    zrlQtdPrd3: TSZRLabel;
    zrlQtdPrd6: TSZRLabel;
    zrlQtdPrd5: TSZRLabel;
    zrlTotalPRD1: TSZRLabel;
    zrlTotalPRD2: TSZRLabel;
    zrlTotalPRD4: TSZRLabel;
    zrlTotalPRD3: TSZRLabel;
    zrlTotalPRD6: TSZRLabel;
    zrlTotalPRD5: TSZRLabel;
    zrlServico1: TSZRLabel;
    zrlServico2: TSZRLabel;
    zrlServico4: TSZRLabel;
    zrlServico3: TSZRLabel;
    zrlServico6: TSZRLabel;
    zrlServico5: TSZRLabel;
    zrlQtdSer1: TSZRLabel;
    zrlQtdSer2: TSZRLabel;
    zrlQtdSer4: TSZRLabel;
    zrlQtdSer3: TSZRLabel;
    zrlQtdSer6: TSZRLabel;
    zrlQtdSer5: TSZRLabel;
    zrlTotalSER1: TSZRLabel;
    zrlTotalSER2: TSZRLabel;
    zrlTotalSER4: TSZRLabel;
    zrlTotalSER3: TSZRLabel;
    zrlTotalSER6: TSZRLabel;
    zrlTotalSER5: TSZRLabel;
    SZRLabel61: TSZRLabel;
    SZRLabel62: TSZRLabel;
    SZRLabel63: TSZRLabel;
    SZRLabel64: TSZRLabel;
    SZRLabel65: TSZRLabel;
    SZRLabel66: TSZRLabel;
    SZRDBText17: TSZRDBText;
    SZRDBText18: TSZRDBText;
    SZRDBText19: TSZRDBText;
    SZRDBText20: TSZRDBText;
    SZRDBText21: TSZRDBText;
    SZRDBText22: TSZRDBText;
    SZRDBText23: TSZRDBText;
    SZRDBText24: TSZRDBText;
    SZRDBText25: TSZRDBText;
    SZRDBText26: TSZRDBText;
    SZRDBText27: TSZRDBText;
    SZRDBText28: TSZRDBText;
    SZRDBText29: TSZRDBText;
    SZRDBText30: TSZRDBText;
    SZRBand2: TSZRBand;
    SZRSysData2: TSZRSysData;
    SZRLabel85: TSZRLabel;
    SZRLabel87: TSZRLabel;
    SZRLabel89: TSZRLabel;
    SZRLabel90: TSZRLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Detalhe_Venda1: TDetalhe_Venda;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_SITUACAO: TStringField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_PREVISAO: TDateTimeField;
    Pedido_de_Venda1PDV_DT_ENTREGA: TDateTimeField;
    Pedido_de_Venda1PDV_CAIXA: TStringField;
    Pedido_de_Venda1PDV_DOCUMENTO: TStringField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1PAR_DESCRICAO: TStringField;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1FPG_DESCRICAO: TStringField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1AGF_DESCRICAO: TStringField;
    Pedido_de_Venda1OBSERVACAO: TStringField;
    Pedido_de_Venda1DPV_MEDICO_NOME: TStringField;
    Pedido_de_Venda1DPV_TIPO_LENTES: TStringField;
    Pedido_de_Venda1DPV_OBS_LENTES: TStringField;
    Pedido_de_Venda1DPV_TIPO_ARMACAO: TStringField;
    Pedido_de_Venda1DPV_OBS_ARMACAO: TStringField;
    Pedido_de_Venda1DPV_PASCIENTE: TStringField;
    Pedido_de_Venda1DPV_OD_ESF: TFloatField;
    Pedido_de_Venda1DPV_OE_ESF: TFloatField;
    Pedido_de_Venda1DPV_OD_CIL: TFloatField;
    Pedido_de_Venda1DPV_OE_CIL: TFloatField;
    Pedido_de_Venda1DPV_OD_EIXO: TFloatField;
    Pedido_de_Venda1DPV_OE_EIXO: TFloatField;
    Pedido_de_Venda1DPV_OD_DNP: TFloatField;
    Pedido_de_Venda1DPV_OE_DNP: TFloatField;
    Pedido_de_Venda1DPV_OD_ALT: TFloatField;
    Pedido_de_Venda1DPV_OE_ALT: TFloatField;
    Pedido_de_Venda1DPV_OD_ADICAO: TFloatField;
    Pedido_de_Venda1DPV_OE_ADICAO: TFloatField;
    Pedido_de_Venda1DPV_OBSERVACAO: TStringField;
    Pedido_de_Venda1DPV_TIPO_LENTES_1: TStringField;
    Pedido_de_Venda1DPV_OBS_LENTES_1: TStringField;
    Pedido_de_Venda1DPV_OBS_ARMACAO_1: TStringField;
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
    vTotalPedido: Double;
  public
    { Public declarations }
  end;

var
  fmxPedidoRX: TfmxPedidoRX;

implementation

uses UDM;

{$R *.dfm}

procedure TfmxPedidoRX.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vNMaterial, vNFerramenta, vBaseReal, vRes1, vRes2, vExtra, vQtdSaldo: Double;
  i: integer;
  sTitulo, sDesco, sEntAnt, Condicao, OBS: string;

begin
  OBS := '';

  //Dados do Cliente
  with Cliente1 do
  begin
    Close;
    ParamByName('CLI_CODIGO').asInteger :=
      Pedido_de_Venda1.FieldByName('CLI_CODIGO').AsInteger;
    ParamByName('CNC_CODIGO').asInteger :=
      Pedido_de_Venda1.FieldByName('CNC_CLIENTE').AsInteger;
    Open;
  end;

  zrlCliente.Caption := Cliente1.FieldByName('CLI_RZ_SOCIAL').AsString+
    ' ('+Cliente1.FieldByName('CLI_CODIGO').AsString+')';
  zrlEndereco.Caption := Trim(Cliente1.FieldByName('PAR_DESCRICAO').AsString)+' '+
    Cliente1.FieldByName('CLI_ENDERECO').AsString;
  zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' +
    Cliente1.FieldByName('CLI_BAIRRO').AsString);
  zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' +
    Cliente1.FieldByName('CLI_CIDADE').AsString)+'/'+
    Trim(Cliente1.FieldByName('CLI_UF').AsString);
  zrlEndereco.Caption := Trim(zrlEndereco.Caption + ' ' +
    Cliente1.FieldByName('CLI_CEP').AsString);

  //Detalhes do Pedido
  with Detalhe_Venda1 do
  begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('CNC_CODIGO').AsInteger;
    ParamByName('PDV_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('PDV_CODIGO').AsInteger;
    Open;
  end;

  //Cálculo das Formas
  zrlBaseRealOD.Caption := '';
  zrlBaseRealOE.Caption := '';
  zrlNMaterialOD.Caption := '';
  zrlNMaterialOE.Caption := '';
  zrlFormulaOD.Caption  := '';
  zrlFormulaOE.Caption  := '';

  if Pedido_de_Venda1.FieldByName('DPV_OBSERVACAO').asstring <> '' then
    OBS := ' AND IPV.PRD_CODIGO IN ('+Pedido_de_Venda1.FieldByName('DPV_OBSERVACAO').asstring+')';


  with Item_Pedido_Venda1 do
  Begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT IPV.IPV_CODIGO,PRD.PRD_CODIGO,PRD.CNC_CODIGO,PRD_DESCRICAO,PRD_BASE_REAL,'+
      'SGP_INDICE_REFRACAO,PRD.GRP_CODIGO,PRD.SGP_CODIGO,PRD_PRECO_VENDA,IPV_QUANTIDADE,IPV_PRECO_DESC,'+
      'SGP.SGP_INDICE_REFRACAO,IPV_OBSERVACAO,IPV_BONIFICACAO'+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA IPV'+
      ' INNER JOIN PRODUTO PRD'+
      ' ON PRD.PRD_CODIGO=IPV.PRD_CODIGO'+
      ' INNER JOIN SUBGRUPO SGP'+
      ' ON SGP.SGP_CODIGO=PRD.SGP_CODIGO AND SGP.GRP_CODIGO=PRD.GRP_CODIGO'+
      ' WHERE PRD.PRD_SERVICO=0 AND IPV.CNC_CODIGO=:CNC_CODIGO'+
      ' AND SGP_INDICE_REFRACAO > 0'+
      ' AND IPV.PDV_CODIGO=:PDV_CODIGO'+OBS;
      ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('CNC_CODIGO').AsInteger;
    ParamByName('PDV_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('PDV_CODIGO').AsInteger;
    Open;

    i := 0;

    //Trazendo Base e Indice de Refracao da Lente de acordo com o Subgrupo
    while not EOF do
    Begin
      //if (FieldByName('SGP_INDICE_REFRACAO').AsFloat > 0) then
      if RecordCount = 1 then
      begin
        zrlBaseRealOD.Caption  := format('%.2f',[Item_Pedido_Venda1.FieldByName('PRD_BASE_REAL').AsFloat]);
        zrlNMaterialOD.Caption := format('%.3f',[Item_Pedido_Venda1.FieldByName('SGP_INDICE_REFRACAO').AsFloat]);
        zrlBaseRealOE.Caption  := format('%.2f',[Item_Pedido_Venda1.FieldByName('PRD_BASE_REAL').AsFloat]);
        zrlNMaterialOE.Caption := format('%.3f',[Item_Pedido_Venda1.FieldByName('SGP_INDICE_REFRACAO').AsFloat]);
      end
      else
      begin
        if i = 0 then
        Begin
          zrlBaseRealOD.Caption  := format('%.2f',[FieldByName('PRD_BASE_REAL').AsFloat]);
          zrlNMaterialOD.Caption := format('%.3f',[FieldByName('SGP_INDICE_REFRACAO').AsFloat]);
          if Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat = 2 then
          Begin
            zrlBaseRealOE.Caption  := format('%.2f',[FieldByName('PRD_BASE_REAL').AsFloat]);
            zrlNMaterialOE.Caption := format('%.3f',[FieldByName('SGP_INDICE_REFRACAO').AsFloat]);
            Break;
          end;
        end
        else
        Begin
          zrlBaseRealOE.Caption  := format('%.2f',[FieldByName('PRD_BASE_REAL').AsFloat]);
          zrlNMaterialOE.Caption := format('%.3f',[FieldByName('SGP_INDICE_REFRACAO').AsFloat]);
        end;
        inc(i);
        if i > 1 then
          Break;
      end;
      Next;
    end;
  end;

  //Forma OD
  if (zrlBaseRealOD.Caption <> '') and
     (zrlNMaterialOD.Caption <> '') then
  Begin
    vNFerramenta := DM.Configuracao1.NFerramenta;
    vBaseReal    := StrToFloat(zrlBaseRealOD.Caption);
    vNMaterial   := StrToFloat(zrlNMaterialOD.Caption);

    //Olho Direito Esférico
    vRes1 := ((vNFerramenta-1)/(vNMaterial-1))*Detalhe_Venda1.OD_ESF;
    if vRes1 < 0 then
      vRes1 := Abs(vRes1) + vBaseReal
    else
    Begin
      if (Detalhe_Venda1.OD_ESF <= 2) then
        vExtra := 0.00
      else if (Detalhe_Venda1.OD_ESF <= 3) then
        vExtra := 0.06
      else if (Detalhe_Venda1.OD_ESF <= 4) then
        vExtra := 0.12
      else if (Detalhe_Venda1.OD_ESF <= 5) then
        vExtra := 0.18
      else if (Detalhe_Venda1.OD_ESF <= 8) then
        vExtra := 0.25
      else if (Detalhe_Venda1.OD_ESF <= 10) then
        vExtra := 0.37
      else
        vExtra := 0.50;

      vRes1 := Abs(Abs(vRes1) - vBaseReal) + vExtra;
    end;

    //Olho Direito Cilíndrico
    vRes2 := ((vNFerramenta-1)/(vNMaterial-1))*Detalhe_Venda1.OD_CIL;
    vRes2 := vRes1 + Abs(vRes2);

    zrlFormulaOD.Caption := format('%.2f',[vRes1])+' X '+format('%.2f',[vRes2]);

  end;

  //Forma OE
  if (zrlBaseRealOE.Caption <> '') and
     (zrlNMaterialOE.Caption <> '') then
  Begin
    vNFerramenta := DM.Configuracao1.NFerramenta;
    vBaseReal    := StrToFloat(zrlBaseRealOE.Caption);
    vNMaterial   := StrToFloat(zrlNMaterialOE.Caption);

    //Olho Esquerdo Esférico
    vRes1 := ((vNFerramenta-1)/(vNMaterial-1))*Detalhe_Venda1.OE_ESF;
    if vRes1 < 0 then
      vRes1 := Abs(vRes1) + vBaseReal
    else
    Begin
      if (Detalhe_Venda1.OE_ESF <= 2) then
        vExtra := 0.00
      else if (Detalhe_Venda1.OE_ESF <= 3) then
        vExtra := 0.06
      else if (Detalhe_Venda1.OE_ESF <= 4) then
        vExtra := 0.12
      else if (Detalhe_Venda1.OE_ESF <= 5) then
        vExtra := 0.18
      else if (Detalhe_Venda1.OE_ESF <= 8) then
        vExtra := 0.25
      else if (Detalhe_Venda1.OE_ESF <= 10) then
        vExtra := 0.37
      else
        vExtra := 0.50;

      vRes1 := Abs(Abs(vRes1) - vBaseReal) + vExtra;
    end;

    //Olho Esquerdo Cilíndrico
    vRes2 := ((vNFerramenta-1)/(vNMaterial-1))*Detalhe_Venda1.OE_CIL;
    vRes2 := vRes1 + Abs(vRes2);

    zrlFormulaOE.Caption := format('%.2f',[vRes1])+' X '+format('%.2f',[vRes2]);
  end;

  if (Pedido_de_Venda1.FieldByName('DPV_OBSERVACAO').asstring <> '') then
      Condicao := ' AND IPV.PRD_CODIGO IN ('+Pedido_de_Venda1.FieldByName('DPV_OBSERVACAO').asstring+')';


  with Item_Pedido_Venda1 do
  Begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT IPV.IPV_CODIGO,PRD.PRD_CODIGO,PRD.CNC_CODIGO,PRD_DESCRICAO,PRD_BASE_REAL,'+
      'SGP_INDICE_REFRACAO,PRD.GRP_CODIGO,PRD.SGP_CODIGO,PRD_PRECO_VENDA,IPV_QUANTIDADE,IPV_PRECO_DESC,'+
      'SGP.SGP_INDICE_REFRACAO,IPV_OBSERVACAO,IPV_BONIFICACAO'+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA IPV'+
      ' INNER JOIN PRODUTO PRD'+
      ' ON PRD.PRD_CODIGO=IPV.PRD_CODIGO'+
      ' INNER JOIN SUBGRUPO SGP'+
      ' ON SGP.SGP_CODIGO=PRD.SGP_CODIGO AND SGP.GRP_CODIGO=PRD.GRP_CODIGO'+
      ' WHERE PRD.PRD_SERVICO=0 AND IPV.CNC_CODIGO=:CNC_CODIGO'+
      ' AND IPV.PDV_CODIGO=:PDV_CODIGO'+Condicao;
    ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('CNC_CODIGO').AsInteger;
    ParamByName('PDV_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('PDV_CODIGO').AsInteger;
    Open;

    i := 1;
    while not EOF do
    begin
        if Trim(FieldByName('IPV_OBSERVACAO').asString) <> '' then
          sDesco := '('+FieldByName('IPV_OBSERVACAO').asString+')'
        else
          sDesco := '';

      sEntAnt := '';

      //Verificar Entrega Antecipada
      if DM.Configuracao1.Empresa = empLuciano then
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
            ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
            ' WHERE MEF_ENT_CODIGO='+Pedido_de_Venda1.FieldByName('PDV_CODIGO').asstring+
            ' AND CNC_CODIGO='+Item_Pedido_Venda1.FieldByName('CNC_CODIGO').asstring+
            ' AND PRD_CODIGO='+Item_Pedido_Venda1.FieldByName('PRD_CODIGO').asstring+
            ' AND MEF_TIPO_MOV=4200 '; //Entrega Antecipada
          Open;
          vQtdSaldo := FieldByName('QTD').asFloat;

          Close;
          SQL.Text := 'SELECT SUM(MEF_QUANTIDADE) AS QTD '+
            ' FROM MOVIMENTO_DE_ESTOQUE_FISICO '+
            ' WHERE MEF_ENT_CODIGO='+Pedido_de_Venda1.FieldByName('PDV_CODIGO').asstring+
            ' AND CNC_CODIGO='+Item_Pedido_Venda1.FieldByName('CNC_CODIGO').asstring+
            ' AND PRD_CODIGO='+Item_Pedido_Venda1.FieldByName('PRD_CODIGO').asstring+
            ' AND MEF_TIPO_MOV=4210 '; //Ext. Entrega Antecipada
          Open;
          vQtdSaldo := vQtdSaldo - FieldByName('QTD').asFloat;

          if vQtdSaldo > 0 then
            sEntAnt := '['+IntToStr(Trunc(vQtdSaldo))+']';
        end;
      end;

      vTotalPedido := vTotalPedido + Arredonda((Quantidade-Bonificacao)*Arredonda(PrecoDesc));
      case i of
        1: Begin
             zrlProduto1.Caption := '';
             zrlQtdPrd1.Caption := '';
             zrlTotalPRD1.Caption := '';

             zrlProduto1.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd1.Caption := format('%.2f',[Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat]);
             zrlTotalPRD1.Caption := format('%.2f',[(Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat-
               Item_Pedido_Venda1.FieldByName('IPV_BONIFICACAO').asfloat)*Arredonda(
               Item_Pedido_Venda1.FieldByName('IPV_PRECO_DESC').asfloat)]);
           end;
        2: Begin
             zrlProduto2.Caption := '';
             zrlQtdPrd2.Caption :=  '';
             zrlTotalPRD2.Caption := '';

             zrlProduto2.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd2.Caption := format('%.2f',[Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat]);
             zrlTotalPRD2.Caption := format('%.2f',[(Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat-
               Item_Pedido_Venda1.FieldByName('IPV_BONIFICACAO').asfloat)*Arredonda(
               Item_Pedido_Venda1.FieldByName('IPV_PRECO_DESC').asfloat)]);
           end;
        3: Begin
             zrlProduto3.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd3.Caption := format('%.2f',[Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat]);
             zrlTotalPRD3.Caption := format('%.2f',[(Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat-
               Item_Pedido_Venda1.FieldByName('IPV_BONIFICACAO').asfloat)*Arredonda(
               Item_Pedido_Venda1.FieldByName('IPV_PRECO_DESC').asfloat)]);
           end;
        4: Begin
             zrlProduto4.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd4.Caption := format('%.2f',[Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asstring]);
             zrlTotalPRD4.Caption := format('%.2f',[(Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat-
               Item_Pedido_Venda1.FieldByName('IPV_BONIFICACAO').asfloat)*Arredonda(
               Item_Pedido_Venda1.FieldByName('IPV_PRECO_DESC').asfloat)]);
           end;
        5: Begin
             zrlProduto5.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd5.Caption := format('%.2f',[Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asstring]);
             zrlTotalPRD5.Caption := format('%.2f',[(Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat-
               Item_Pedido_Venda1.FieldByName('IPV_BONIFICACAO').asfloat)*Arredonda(
               Item_Pedido_Venda1.FieldByName('IPV_PRECO_DESC').asfloat)]);
           end;
        6: Begin
             zrlProduto6.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdPrd6.Caption := format('%.2f',[Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asstring]);
             zrlTotalPRD6.Caption := format('%.2f',[(Item_Pedido_Venda1.FieldByName('IPV_QUANTIDADE').asfloat-
               Item_Pedido_Venda1.FieldByName('IPV_BONIFICACAO').asfloat)*Arredonda(
               Item_Pedido_Venda1.FieldByName('IPV_PRECO_DESC').asfloat)]);
           end;
      end;
      inc(i);
      Next;
    end;
  end;

  with Item_Pedido_Venda2 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('CNC_CODIGO').AsInteger;
    ParamByName('PDV_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('PDV_CODIGO').AsInteger;
    Open;
    i := 1;
    while not EOF do
    Begin
      if DM.Configuracao1.Empresa = empMotical then //Motical
      Begin
        sDesco := '';
        if Arredonda(PrecoDesc) < Arredonda(FieldByName('PRD_PRECO_VENDA').asFloat) then
          sDesco := ' ('+format('%.2f',[(1-PrecoDesc/FieldByName('PRD_PRECO_VENDA').asFloat)*100])+'%)';
      end;
      vTotalPedido := vTotalPedido + Arredonda((Quantidade-Bonificacao)*PrecoDesc);
      case i of
        1: Begin
             zrlServico1.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER1.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER1.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        2: Begin
             zrlServico2.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER2.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER2.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        3: Begin
             zrlServico3.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER3.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER3.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        4: Begin
             zrlServico4.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER4.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER4.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        5: Begin
             zrlServico5.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER5.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER5.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
        6: Begin
             zrlServico6.Caption := sEntAnt+FieldByName('PRD_DESCRICAO').asString + ' ('+IntToStr(CodigoPRD)+')'+sDesco;
             zrlQtdSER6.Caption := format('%.2f',[Quantidade]);
             zrlTotalSER6.Caption := format('%.2f',[(Quantidade-Bonificacao)*PrecoDesc]);
           end;
      end;
      inc(i);
      Next;
    end;
  end;
end;

procedure TfmxPedidoRX.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel87.Caption := EmpresaDesenvolvedora;
end;

end.
