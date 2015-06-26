unit UComissaoGerente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, SQuery, Funcionario,
  QRExport, Item_de_Cota;

type
  Trpt_ComissaoGerente = class(TForm)
    report: TQuickRep;
    QRBand1: TQRBand;
    qrlDescricaoRelatorio: TQRLabel;
    qrlNomeLoja: TQRLabel;
    qrlNomeCentroDeCusto: TQRLabel;
    qrsDataHoraImpressao: TQRSysData;
    Funcionario1: TFuncionario;
    QRBand2: TQRBand;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    qrsLinhaHorizontalRodape: TQRShape;
    qrsNumeroPagina: TQRSysData;
    qrsLinhaHorizontalCabecalho1: TQRShape;
    qrlPeriodoDesc: TQRLabel;
    qrlDescricaoPeriodo: TQRLabel;
    QRBand3: TQRBand;
    DSFuncionario1: TDataSource;
    QRDBText1: TQRDBText;
    qrsLinhaHorizontalCabecalho2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    qrlTotalEquipe: TQRLabel;
    qrlComisao: TQRLabel;
    qrlPremio: TQRLabel;
    qrlSubTotal: TQRLabel;
    qrlPercentual1: TQRLabel;
    qrlBonus: TQRLabel;
    qrlTotal: TQRLabel;
    qrlPercentual2: TQRLabel;
    QRBand4: TQRBand;
    QRShape4: TQRShape;
    QRLabel15: TQRLabel;
    qrlTotalRegistros: TQRLabel;
    Item_de_Cota1: TItem_de_Cota;
    QRLabel5: TQRLabel;
    qrlComissaoVendas: TQRLabel;
    zrlFiltro: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    TotalRegistros : integer;
  public
    DataINI, DataFIM: TDateTime;
    Entidade : TFuncionario;
  end;

var
  rpt_ComissaoGerente: Trpt_ComissaoGerente;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_ComissaoGerente.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNomeLoja.Caption:=DM.Configuracao1.LojaNome;
  qrlNomeCentroDeCusto.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ComissaoGerente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_ComissaoGerente.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  TotalEquipe, TotalVendido, vComissao, vPremio,
    vComissaoVendas, vSubTotal, vBonus, vTotalComissao: Double;
  sEquipe, sEquipeNota, sVendedor, sVendedorNota : string;
begin
  sVendedor      := ' AND I1.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+' ';
  sVendedorNota  := ' AND N1.FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+' ';
  sEquipe        := ' AND I1.FUN_CODIGO IN '+
                    ' (SELECT FUN_VENDEDOR FROM EQUIPE_GERENCIA '+
                    ' WHERE FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+') ';
  sEquipeNota    := ' AND N1.FUN_CODIGO IN '+
                    ' (SELECT FUN_VENDEDOR FROM EQUIPE_GERENCIA '+
                    ' WHERE FUN_CODIGO='+IntToStr(Entidade.CodigoFUN)+') ';

  //EQUIPE
  //Calcular Faturado (SN + Itens Trocados de SN)
  TotalEquipe := CalcFaturadoSN(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sEquipe);
  //Calcular Faturado (Nota)
  TotalEquipe := TotalEquipe +
                 CalcFaturado(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sEquipeNota);
  //Calcular Devolvido (Nota Não Avulsa e Avulsa)
  TotalEquipe := TotalEquipe -
                 CalcDevolvidoFat(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sEquipeNota);
  //Calcular Devolvido SN (Troca e Total)
  TotalEquipe := TotalEquipe -
                    CalcDevolvidoSN(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sEquipe);

  qrlTotalEquipe.Caption := format('%.2f',[TotalEquipe]);

  //Calcular Comissão e Prêmio do Gerente
  with Item_de_Cota1 do
  Begin
    vComissao := 0;
    vPremio := 0;
    Close;
    ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
    ParamByName('MES').asInteger := StrToInt(Copy(DateToStr(DataFIM),4,2));
    ParamByName('ANO').asInteger := StrToInt(Copy(DateToStr(DataFIM),7,4));
    Open;
    if IsEmpty then
      qrlComisao.Caption := '-'
    else
    Begin
      if TotalEquipe <= Cota1 then
        vComissao := TotalEquipe*Comissao1/100
      else if TotalEquipe <= Cota2 then
        vComissao := TotalEquipe*Comissao2/100
      else if TotalEquipe <= Cota3 then
        vComissao := TotalEquipe*Comissao3/100
      else
        vComissao := TotalEquipe*Comissao4/100;
      qrlComisao.Caption := format('%.2f',[vComissao]);

      if TotalEquipe > Cota40 then
        vPremio := Comissao40
      else if TotalEquipe > Cota30 then
        vPremio := Comissao30
      else if TotalEquipe > Cota20 then
        vPremio := Comissao20
      else if TotalEquipe > Cota10 then
        vPremio := Comissao10;
        
      if vPremio > 0 then
        qrlPremio.Caption  := format('%.2f',[vPremio])
      else
        qrlPremio.Caption  := '-';
    end;
  end;

  //Vendas do Gerente
  //Calcular Faturado (SN + Itens Trocados de SN)
  TotalVendido := CalcFaturadoSN(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sVendedor);
  //Calcular Faturado (Nota)
  TotalVendido := TotalVendido +
                 CalcFaturado(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sVendedorNota);
  //Calcular Devolvido (Nota Não Avulsa e Avulsa)
  TotalVendido := TotalVendido -
                 CalcDevolvidoFat(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sVendedorNota);
  //Calcular Devolvido SN (Troca e Total)
  TotalVendido := TotalVendido -
                    CalcDevolvidoSN(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sVendedor);

  //Calcular Comissão das Vendas do Gerente
  vComissaoVendas := 0;
  if (Entidade.FieldByName('FUN_PERC_ABAIXO').AsString = '') or
     (Entidade.FieldByName('FUN_PERC_ACIMA').AsString = '') then
    qrlComissaoVendas.Caption := '-'
  else
  Begin
    if TotalVendido <= Entidade.Cota then
      vComissaoVendas := TotalVendido*Entidade.FieldByName('FUN_PERC_ABAIXO').asFloat/100
    else
      vComissaoVendas := TotalVendido*Entidade.FieldByName('FUN_PERC_ACIMA').asFloat/100;
  end;

  qrlComissaoVendas.Caption := format('%.2f',[vComissaoVendas]);


  vSubTotal := vComissao+vPremio+vComissaoVendas;
  if vSubTotal > 0 then
  Begin
    qrlSubTotal.Caption := format('%.2f',[vSubTotal]);
    qrlPercentual1.Caption  := format('%.2f',[vSubTotal/(TotalEquipe+TotalVendido)*100]);
  end
  else
  Begin
    qrlSubTotal.Caption := '-';
    qrlPercentual1.Caption  := '-';
  end;

  //Calcular Bônus (SN)
  vBonus := CalcBonusSN(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sEquipe);
  //Calcular Bônus (Faturado)
  vBonus := vBonus +
            CalcBonusFat(DM.QR_Consultas,DateToStr(DataINI),DateToStr(DataFIM),sEquipeNota);

  if vBonus > 0 then
    qrlBonus.Caption := format('%.2f',[vBonus])
  else
    qrlBonus.Caption := '-';

  vTotalComissao := vSubTotal+vBonus;
  if vTotalComissao > 0 then
  Begin
    qrlTotal.Caption := format('%.2f',[vTotalComissao]);
    qrlPercentual2.Caption := format('%.2f',[vTotalComissao/(TotalEquipe+TotalVendido)*100]);
  end
  else
  Begin
    qrlTotal.Caption := '-';
    qrlPercentual2.Caption := '-';
  end;

  inc(TotalRegistros);
end;

procedure Trpt_ComissaoGerente.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_ComissaoGerente.FormCreate(Sender: TObject);
begin
  Entidade := Funcionario1;
  TotalRegistros := 0;
  DataINI := 0;
  DataFIM := 0;
end;

end.
