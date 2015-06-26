unit UNotaFiscalRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, NotaFiscal,
  CentroCusto, Fornecedor, Transportadora;

type
  Trpt_NotaFiscalRel = class(TForm)
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
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    zrlDescSelo: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRDBText3: TSZRDBText;
    NotaFiscal1: TNotaFiscal;
    zrlDescEmissao: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText2: TSZRDBText;
    zrlDescTipo: TSZRLabel;
    zdbTipo: TSZRDBText;
    NotaFiscal1NTF_CODIGO: TIntegerField;
    NotaFiscal1CNC_CODIGO: TIntegerField;
    NotaFiscal1USU_CODIGO: TIntegerField;
    NotaFiscal1CNC_CLIENTE: TIntegerField;
    NotaFiscal1CLI_CODIGO: TIntegerField;
    NotaFiscal1FOR_CODIGO: TIntegerField;
    NotaFiscal1FUN_CODIGO: TIntegerField;
    NotaFiscal1TRN_CODIGO: TIntegerField;
    NotaFiscal1CAG_CODIGO: TIntegerField;
    NotaFiscal1NTF_PEDIDO: TIntegerField;
    NotaFiscal1NTF_DT_CADASTRO: TDateTimeField;
    NotaFiscal1NTF_DT_ALTERADO: TDateTimeField;
    NotaFiscal1NTF_DT_EMISSAO: TDateTimeField;
    NotaFiscal1NTF_DT_ENTRADA_SAIDA: TDateTimeField;
    NotaFiscal1NTF_ENTRADA_SAIDA: TIntegerField;
    NotaFiscal1NTF_TIPO_NOTA: TIntegerField;
    NotaFiscal1NTF_NOTA_FISCAL: TIntegerField;
    NotaFiscal1NTF_SERIE: TStringField;
    NotaFiscal1NTF_SUBSERIE: TStringField;
    NotaFiscal1NTF_SELO: TIntegerField;
    NotaFiscal1NTF_AIDF: TIntegerField;
    NotaFiscal1NTF_CFOP: TIntegerField;
    NotaFiscal1NTF_BASE_ICMS: TFloatField;
    NotaFiscal1NTF_ICMS: TFloatField;
    NotaFiscal1NTF_BASE_ICMS_SUB: TFloatField;
    NotaFiscal1NTF_ICMS_SUB: TFloatField;
    NotaFiscal1NTF_TOTAL_PRODUTO: TFloatField;
    NotaFiscal1NTF_TOTAL_NOTA: TFloatField;
    NotaFiscal1NTF_FRETE: TFloatField;
    NotaFiscal1NTF_SEGURO: TFloatField;
    NotaFiscal1NTF_OUTRAS: TFloatField;
    NotaFiscal1NTF_IPI: TFloatField;
    NotaFiscal1NTF_TIPO_TRANSPORTE: TIntegerField;
    NotaFiscal1NTF_TIPO_FRETE: TIntegerField;
    NotaFiscal1NTF_PLACA: TStringField;
    NotaFiscal1NTF_PLACA_UF: TStringField;
    NotaFiscal1NTF_QUANTIDADE: TFloatField;
    NotaFiscal1NTF_ESPECIE: TStringField;
    NotaFiscal1NTF_MARCA: TStringField;
    NotaFiscal1NTF_NUMERO: TStringField;
    NotaFiscal1NTF_PESO_BRUTO: TFloatField;
    NotaFiscal1NTF_PESO_LIQUIDO: TFloatField;
    NotaFiscal1NTF_SITUACAO: TIntegerField;
    NotaFiscal1NTF_OBSERVACAO: TStringField;
    NotaFiscal1NTF_ICMS_FRETE: TFloatField;
    NotaFiscal1NTF_CONHECIMENTO: TIntegerField;
    NotaFiscal1Tipo: TStringField;
    zrlDescPedido: TSZRLabel;
    zdbPedido: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRDBText7: TSZRDBText;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlConhecimento: TSZRDBText;
    zrbSumario: TSZRBand;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlTotalFrete: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRDBText10: TSZRDBText;
    SZRLabel19: TSZRLabel;
    SZRDBText11: TSZRDBText;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrlDescVendedor: TSZRLabel;
    zdbVendedor: TSZRDBText;
    NotaFiscal1NTF_ISS: TFloatField;
    NotaFiscal1NTF_BASE_ISS: TFloatField;
    NotaFiscal1CNC_PEDIDO: TIntegerField;
    NotaFiscal1NTF_ENDERECO: TStringField;
    NotaFiscal1NTF_BAIRRO: TStringField;
    NotaFiscal1NTF_MUNICIPIO: TStringField;
    NotaFiscal1NTF_UF: TStringField;
    NotaFiscal1NTF_CEP: TStringField;
    NotaFiscal1NTF_NOTA_CUPOM: TIntegerField;
    SZRLabel23: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlDataEmissao: TSZRLabel;
    zrlTotalBaseISS: TSZRLabel;
    zrlTotalISS: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel24: TSZRLabel;
    zrbGrupoCentroDeCusto: TSZRGroup;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto2: TCentroCusto;
    NotaFiscal1NTF_AVULSA: TIntegerField;
    NotaFiscal1NTF_COD_PAGAMENTO: TIntegerField;
    NotaFiscal1NTF_TOTAL_SERVICO: TFloatField;
    zrlFiltros: TSZRLabel;
    NotaFiscal1FUN_ARQUITETO: TIntegerField;
    NotaFiscal1CNC_ORIGEM: TIntegerField;
    zrlSelo: TSZRLabel;
    Fornecedor1: TFornecedor;
    Cliente1: TCliente;
    Transportadora1: TTransportadora;
    zrbGrupoConhecimento: TSZRGroup;
    NotaFiscal2: TNotaFiscal;
    zrbRodapeConhecimento: TSZRBand;
    zrlConhecimentoNumero: TSZRLabel;
    zrlConhecimentoEmissao: TSZRLabel;
    zrlConhecimentoCFOP: TSZRLabel;
    zrlConhecimentoBaseICMS: TSZRLabel;
    zrlConhecimentoTransportadora: TSZRLabel;
    zrlConhecimentoICMS: TSZRLabel;
    zrlConhecimentoTotal: TSZRLabel;
    NotaFiscal1NTF_COD_PAGAMENTO_2: TIntegerField;
    zrlFrete: TSZRLabel;
    NotaFiscal1NTF_MAQUINA: TIntegerField;
    SZRLabel1: TSZRLabel;
    zrlTotalBaseFrete: TSZRLabel;
    zrlTotalICMSFrete: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormShow(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure NotaFiscal1CalcFields(DataSet: TDataSet);
    procedure zrbGrupoCentroDeCustoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeConhecimentoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros : integer;
    vTotalBaseFrete, vTotalICMSFrete: Double;
  public
    Entidade:TNotaFiscal;
    TotISS,TotBaseISS,TotProduto,TotBase,TotICMS,TotFrete,TotIPI,Total:Double;
    { Public declarations }
  end;

var
  rpt_NotaFiscalRel: Trpt_NotaFiscalRel;

implementation
uses
  UDM, Funcoes, MxSelNotaFiscal;

{$R *.DFM}


procedure Trpt_NotaFiscalRel.FormCreate(Sender: TObject);
begin
  TotalRegistros := 0;
  zrbSumario.Height := 2;
  Entidade := NotaFiscal1;
  Total      := 0;
  TotFrete   := 0;
  TotICMS    := 0;
  TotISS     := 0;
  TotBaseISS := 0;
  TotProduto := 0;
  TotBase    := 0;
  TotIPI     := 0;
  vTotalBaseFrete := 0;
  vTotalICMSFrete := 0;
end;

procedure Trpt_NotaFiscalRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Active := false;
 Action := cafree;
end;

procedure Trpt_NotaFiscalRel.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_NotaFiscalRel.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if tag = 0 then
  Begin
    if fmxSelNotaFiscal.RadioGroup1.ItemIndex = 2 then //Data de Entrada
      zrlDescEmissao.Caption := 'ENT/SAIDA'
    else
      zrlDescEmissao.Caption := 'EMISSAO';

    if fmxSelNotaFiscal.ckbNomeFornecedor.Checked then
    Begin
      zrlDescTipo.Enabled := False;
      zrlDescPedido.Enabled := False;
      zrlDescVendedor.Enabled := False;
      zrlDescSelo.Width := 30;
      zrlDescSelo.Caption := 'Cliente/Fornecedor';
    end;
  end
  else
    zrlDescEmissao.Caption := 'EMISSAO';
end;

procedure Trpt_NotaFiscalRel.FormShow(Sender: TObject);
begin
  Entidade.Active := true;
end;

procedure Trpt_NotaFiscalRel.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  inc(TotalRegistros);

  zrlSelo.Caption := IntToStr(Entidade.Selo);

  zrlFrete.Caption := format('%.2f',[Arredonda(Entidade.TotalProduto)*Entidade.Frete/100]);

  if tag = 0 then
  Begin
    if fmxSelNotaFiscal.RadioGroup1.ItemIndex = 2 then //Data de Entrada
      zrlDataEmissao.Caption := DateToStr(Entidade.DataEntradaSaida)
    else
      zrlDataEmissao.Caption := DateToStr(Entidade.DataEmissao);
    if fmxSelNotaFiscal.ckbNomeFornecedor.Checked then
    Begin
      zdbTipo.Enabled := False;
      zdbPedido.Enabled := False;
      zdbVendedor.Enabled := False;
      zrlSelo.Width := 28;
      if Entidade.CodigoCLI > 0 then
      Begin
        if Entidade.TipoNota = 369 then
        Begin
          with Transportadora1 do
          Begin
            if (not Active) or
               (CodigoTRN <> Entidade.CodigoCLI) then
            Begin
              Close;
              ParamByName('TRN_CODIGO').asInteger := Entidade.CodigoCLI;
              Open;
            end;
            zrlSelo.Caption := RazaoSocial;
          end;
        end
        else if (Entidade.TipoNota = 360) or //Compra
                (Entidade.CFOP = 5202) or    //Dev.Compra
                (Entidade.CFOP = 6202) or  //Dev.Compra
                (Entidade.TipoNota = 4240) or //Aquisicao
                (Entidade.TipoNota = 4450) or //REMESSA DE TROCA
                (Entidade.TipoNota = 4490) or //REMESSA EM GARANTIA                
                (Entidade.TipoNota = 451) then //Imobilizado
        Begin
          with Fornecedor1 do
          Begin
            if (Entidade.TipoNota = 360) then //Compra
            Begin
              if (CodigoFOR <> Entidade.CodigoFOR) then
              Begin
                Close;
                ParamByName('FOR_CODIGO').asInteger := Entidade.CodigoFOR;
                Open;
              end;
            end
            else
            Begin
              if (CodigoFOR <> Entidade.CodigoCLI) then
              Begin
                Close;
                ParamByName('FOR_CODIGO').asInteger := Entidade.CodigoCLI;
                Open;
              end;
            end;
            zrlSelo.Caption := RazaoSocial;
          end;
        end
        else
        Begin
          with Cliente1 do
          Begin
            if CodigoCLI <> Entidade.CodigoCLI then
            Begin
              Close;
              ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
              ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
              Open;
            end;
            zrlSelo.Caption := RazaoSocial;
          end;
        end;
      end
      else
      Begin
        with Fornecedor1 do
        Begin
          if CodigoFOR <> Entidade.CodigoFOR then
          Begin
            Close;
            ParamByName('FOR_CODIGO').asInteger := Entidade.CodigoFOR;
            Open;
          end;
          zrlSelo.Caption := RazaoSocial;
        end;
      end;
    end;
  end
  else
    zrlDataEmissao.Caption := DateToStr(Entidade.DataEmissao);

  Total     := Total     +Arredonda(Entidade.TotalNota);
  TotFrete  := TotFrete  +Arredonda(Entidade.Frete*Arredonda(Entidade.TotalProduto)/100);
  TotBase   := TotBase   +Arredonda(Entidade.BaseICMS);
  TotICMS   := TotICMS   +Arredonda(Entidade.ICMS);
  TotIPI    := TotIPI    +Arredonda(Entidade.IPI);
  TotProduto:= TotProduto+Arredonda(Entidade.TotalProduto);
  TotISS    := TotISS    +Arredonda(Entidade.ISS);
  TotBaseISS:= TotBaseISS+Arredonda(Entidade.BaseISS);
end;

procedure Trpt_NotaFiscalRel.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalISS.Caption := format('%.2f',[TotISS]);
  zrlTotalBaseISS.Caption := format('%.2f',[TotBaseISS]);
  SZRLabel11.Caption := format('%.2f',[TotProduto]);
  SZRLabel20.Caption := format('%.2f',[TotBase]);
  SZRLabel12.Caption := format('%.2f',[TotICMS]);
  zrlTotalFrete.Caption := format('%.2f',[TotFrete]);
  SZRLabel21.Caption := format('%.2f',[TotIPI]);
  SZRLabel14.Caption := format('%.2f',[Total]);
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);

  zrlTotalBaseFrete.Caption := format('%.2f',[vTotalBaseFrete]);
  zrlTotalICMSFrete.Caption := format('%.2f',[vTotalICMSFrete]);
end;

procedure Trpt_NotaFiscalRel.NotaFiscal1CalcFields(DataSet: TDataSet);
begin
  case Entidade.EntradaSaida of
    0 : Entidade.FieldByName('Tipo').asString:='E';
    1 : Entidade.FieldByName('Tipo').asString:='S';
  else
    Entidade.FieldByName('Tipo').asString:='';
  end;
end;

procedure Trpt_NotaFiscalRel.zrbGrupoCentroDeCustoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if zrbGrupoCentroDeCusto.Height > 0 then
  Begin
    with CentroCusto2 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
      zrlCentroDeCusto.Caption := IntToStr(CodigoCNC) + ' - ' + RazaoSocial;
    end;
  end;
end;

procedure Trpt_NotaFiscalRel.zrbRodapeConhecimentoBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  if zrbRodapeConhecimento.Height = 0 then
    Exit;
  if Entidade.Conhecimento > 0 then
  Begin
    with NotaFiscal2 do
    Begin
      Close;
      ParamByName('NTF_NOTA_FISCAL').asInteger := Entidade.Conhecimento;
      Open;
      if NotaFiscal > 0 then
      Begin
        zrlConhecimentoNumero.Caption := IntToStr(NotaFiscal);
        vTotalBaseFrete := vTotalBaseFrete + Arredonda(BaseICMS);
        vTotalICMSFrete := vTotalICMSFrete + Arredonda(ICMS);
      end
      else
        zrlConhecimentoNumero.Caption := 'N CADASTRADO';
      zrlConhecimentoEmissao.Caption := '';
      if tag = 0 then
      Begin
        if fmxSelNotaFiscal.RadioGroup1.ItemIndex = 2 then //Data de Entrada
        Begin
          if DataEntradaSaida > 0 then
            zrlConhecimentoEmissao.Caption  := DateToStr(DataEntradaSaida)
          else if DataEmissao > 0 then
            zrlConhecimentoEmissao.Caption  := DateToStr(DataEmissao);
        end
        else if DataEmissao > 0 then
          zrlConhecimentoEmissao.Caption  := DateToStr(DataEmissao);
      end
      else if DataEmissao > 0 then
        zrlConhecimentoEmissao.Caption  := DateToStr(DataEmissao);

      if CFOP > 0 then
        zrlConhecimentoCFOP.Caption     := IntToStr(CFOP)
      else
        zrlConhecimentoCFOP.Caption     := '';
      if BaseICMS > 0 then
        zrlConhecimentoBaseICMS.Caption := format('%.2f',[BaseICMS])
      else
        zrlConhecimentoBaseICMS.Caption := '';
      if ICMS > 0 then
        zrlConhecimentoICMS.Caption     := format('%.2f',[ICMS])
      else
        zrlConhecimentoICMS.Caption     := '';
      if TotalNota > 0 then
        zrlConhecimentoTotal.Caption    := format('%.2f',[TotalNota])
      else
        zrlConhecimentoTotal.Caption    := '';
    end;
    with Transportadora1 do
    Begin
      if CodigoTRN <> NotaFiscal2.CodigoCLI then
      Begin
        Close;
        ParamByName('TRN_CODIGO').asInteger := NotaFiscal2.CodigoCLI;
        Open;
      end;
        zrlConhecimentoTransportadora.Caption := RazaoSocial;
    end;
  end
  else
  Begin
    zrlConhecimentoNumero.Caption := 'S/CONHEC.';
    zrlConhecimentoEmissao.Caption := '';
    zrlConhecimentoCFOP.Caption := '';
    zrlConhecimentoTransportadora.Caption := '';
    zrlConhecimentoBaseICMS.Caption := '';
    zrlConhecimentoICMS.Caption := '';
    zrlConhecimentoTotal.Caption := '';
  end;
end;

procedure Trpt_NotaFiscalRel.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
