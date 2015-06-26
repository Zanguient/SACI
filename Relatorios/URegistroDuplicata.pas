unit URegistroDuplicata;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Pacote_de_venda,
  Pedido_de_Venda, CentroCusto, Conta_de_Caixa, Titulo_receber;

type
  Trpt_RegistroDuplicata = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
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
    zrlLinhaCabecalho: TSZRLabel;
    ZRDBText5: TSZRDBText;
    zrlDescVencimento: TSZRLabel;
    zrlDescCodigo: TSZRLabel;
    ZRDBText6: TSZRDBText;
    zrlDescSeq: TSZRLabel;
    zrlDescCliente: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRDBText4: TSZRDBText;
    zrlDescValorDoc: TSZRLabel;
    ZRLabel17: TSZRLabel;
    zrlDescValorPag: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRLabel7: TSZRLabel;
    zrbSumario: TSZRBand;
    zrlTotalValor: TSZRLabel;
    zrlTotalValorPago: TSZRLabel;
    SZRDBText2: TSZRDBText;
    zrbRodapeGrupo: TSZRBand;
    zrlSubTotalValor: TSZRLabel;
    zrlSubTotalValorPago: TSZRLabel;
    zrlLinhaSubTotal: TSZRLabel;
    Conta_de_Caixa1: TConta_de_Caixa;
    SZRLabel16: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlDataPagamento: TSZRLabel;
    SZRDBText4: TSZRDBText;
    zrlDescNumero: TSZRLabel;
    zrbGrupo: TSZRGroup;
    SZRLabel11: TSZRLabel;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRLabel1: TSZRLabel;
    zrlPago: TSZRLabel;
    zrlValorDoc: TSZRLabel;
    zrlDataEmissao: TSZRLabel;
    Pedido_de_Venda1: TPedido_de_Venda;
    Pacote_de_venda1: TPacote_de_venda;
    SZRLabel3: TSZRLabel;
    zrlSubTotalAberto: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlTotalAberto: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlTotalPagoLiquido: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlTotalEspecial: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlSubTotalPagoLiquido: TSZRLabel;
    zrlSubTotalEspecial: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalCreditos: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlSubTotalCreditos: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros : integer;
    SomaTotalCentro, SomaPagoCentro, SomaTotal, SomaPago, SubTotalAberto,
      TotalAberto, SubTotalPagoLiquido, TotalPagoLiquido, SubTotalCreditos, TotalCreditos:Double;
  public
    Entidade: TTitulo_receber;
  end;

var
  rpt_RegistroDuplicata: Trpt_RegistroDuplicata;

implementation
Uses
  UDM, Funcoes, MxSelTitulos;

{$R *.DFM}

procedure Trpt_RegistroDuplicata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_RegistroDuplicata.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_RegistroDuplicata.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  inc(TotalRegistros);

  if Entidade.Pagamento > 0 then
    zrlDataPagamento.Caption := DateToStr(Entidade.Pagamento)
  else
    zrlDataPagamento.Caption := '';

  zrlValorDoc.Caption := format('%.2f',[Entidade.Valor]);

  zrlDataEmissao.Caption := '';
  zrlPago.Caption := '';
  if Entidade.CodigoPDV > 0 then
  Begin
    with Pedido_de_Venda1 do
    Begin
      Close;
      if Entidade.CodigoFPE > 0 then
        SQL.Text := 'SELECT MAX(P1.PDV_DT_EMISSAO_VENDA) AS EMISSAO '+
          ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE P1.CNC_CODIGO='+IntToStr(Titulo_receber1.CodigoCNC)+
          ' AND P1.FPE_CODIGO='+IntToStr(Titulo_receber1.CodigoFPE)+
          ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '
      else
        SQL.Text := 'SELECT MAX(P1.PDV_DT_EMISSAO_VENDA) AS EMISSAO '+
          ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE P1.CNC_CODIGO='+IntToStr(Titulo_receber1.CodigoCNC)+
          ' AND P1.PDV_CODIGO='+IntToStr(Titulo_receber1.CodigoPDV)+
          ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
      Open;
      if (FieldByName('EMISSAO').asDateTime > 0) then
        zrlDataEmissao.Caption := DateToStr(FieldByName('EMISSAO').asDateTime);
    end;
    if Pedido_de_Venda1.IsEmpty then //Pacote
    Begin
      with Pacote_de_venda1 do
      Begin
        Close;
        SQL.Text := 'SELECT MAX(PCT_DT_EMISSAO_VENDA) AS EMISSAO '+
          ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
          ' WHERE P1.CNC_CODIGO='+IntToStr(Titulo_receber1.CodigoCNC)+
          ' AND P1.PDV_CODIGO='+IntToStr(Titulo_receber1.CodigoPDV)+
          ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
        Open;
        if (FieldByName('EMISSAO').asDateTime > 0) then
          zrlDataEmissao.Caption := DateToStr(FieldByName('EMISSAO').asDateTime);
      end;
    end;
  end;

  SomaTotal := SomaTotal + Arredonda(Entidade.Valor);
  SomaTotalCentro := SomaTotalCentro + Arredonda(Entidade.Valor);

  if Entidade.Situacao = 2 then
  Begin
    zrlPago.Caption := format('%.2f',[Entidade.ValorPG]);
    SomaPago    := SomaPago  + Arredonda(Entidade.ValorPG);
    SomaPagoCentro := SomaPagoCentro  + Arredonda(Entidade.ValorPG);
    SubTotalPagoLiquido := SubTotalPagoLiquido + Arredonda(Entidade.ValorPG-Entidade.Juros+Entidade.Desconto);
    TotalPagoLiquido    := TotalPagoLiquido    + Arredonda(Entidade.ValorPG-Entidade.Juros+Entidade.Desconto);
    SubTotalCreditos := SubTotalCreditos + Arredonda(Entidade.Credcli);
    TotalCreditos    := TotalCreditos + Arredonda(Entidade.Credcli);
  end
  else
  Begin
    SubTotalAberto := SubTotalAberto + Arredonda(Entidade.Valor);
    TotalAberto    := TotalAberto    + Arredonda(Entidade.Valor);
  end;
end;

procedure Trpt_RegistroDuplicata.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);

  zrlTotalCreditos.Caption := Format('%.2f',[TotalCreditos]);

  zrlTotalValor.Caption     := Format('%.2f',[Somatotal]);
  zrlTotalValorPago.Caption := Format('%.2f',[SomaPago]);

  zrlTotalAberto.Caption       := Format('%.2f',[TotalAberto]);
  zrlTotalPagoLiquido.Caption := Format('%.2f',[TotalPagoLiquido]);

  zrlTotalEspecial.Caption := Format('%.2f',[StrToFloat(zrlTotalAberto.Caption)+StrToFloat(zrlTotalPagoLiquido.Caption)]);
end;

procedure Trpt_RegistroDuplicata.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalCreditos := 0;
  Somatotal:=0;
  SomaPago:=0;
  TotalAberto := 0;
  TotalPagoLiquido := 0;
end;

procedure Trpt_RegistroDuplicata.zrbGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SubTotalCreditos := 0;
  SomaTotalCentro  := 0;
  SomaPagoCentro   := 0;
  SubTotalAberto   := 0;
  SubTotalPagoLiquido := 0;

  with CentroCusto1 do
  Begin
    if CodigoCNC <> Titulo_receber1.CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Titulo_receber1.CodigoCNC;
      Open;
    end;
    zrlCentroDeCusto.Caption := RazaoSocial;
  end;
end;

procedure Trpt_RegistroDuplicata.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSubTotalCreditos.Caption := Format('%.2f',[SubTotalCreditos]);

  zrlSubTotalValor.Caption     := Format('%.2f',[SomaTotalCentro]);
  zrlSubTotalValorPago.Caption := Format('%.2f',[SomaPagoCentro]);

  zrlSubTotalAberto.Caption      := Format('%.2f',[SubTotalAberto]);
  zrlSubTotalPagoLiquido.Caption := Format('%.2f',[SubTotalPagoLiquido]);
  zrlSubTotalEspecial.Caption := Format('%.2f',[StrToFloat(zrlSubTotalAberto.Caption)+StrToFloat(zrlSubTotalPagoLiquido.Caption)]);  
end;

procedure Trpt_RegistroDuplicata.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  TotalRegistros := 0;
end;

procedure Trpt_RegistroDuplicata.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
