
unit UComissao2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Titulo_receber, Vendedor, Parametro, funcoes;

type
  Trpt_Comissao2 = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrb_detalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel26: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel1: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRLabel7: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    Vendedor1: TVendedor;
    SZRLabel4: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrlUsuario: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    Parametro1: TParametro;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    lbl5Parcelas: TSZRLabel;
    SZRLabel24: TSZRLabel;
    lbl6Parcelas: TSZRLabel;
    SZRLabel26: TSZRLabel;
    lbl7Parcelas: TSZRLabel;
    SZRLabel28: TSZRLabel;
    lbl8Parcelas: TSZRLabel;
    SZRLabel31: TSZRLabel;
    lbl9Parcelas: TSZRLabel;
    SZRLabel33: TSZRLabel;
    lbl10Parcelas: TSZRLabel;
    SZRLabel23: TSZRLabel;
    QrParcelas5: TTitulo_receber;
    QrParcelas6: TTitulo_receber;
    QrParcelas7: TTitulo_receber;
    QrParcelas8: TTitulo_receber;
    QrParcelas9: TTitulo_receber;
    QrParcelas10: TTitulo_receber;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrb_detalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TTitulo_receber;
    Total, TotalCom: Double;
    vVista, vPrazo, vCartao: Double;
    bTotalParcela: boolean;
  end;

var
  rpt_Comissao2: Trpt_Comissao2;

implementation
Uses
  UDM;
{$R *.DFM}

procedure Trpt_Comissao2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure Trpt_Comissao2.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Comissao2.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  count5, count6,count7, count8,count9, count10: double;
begin
  count5  := 0;
  count6  := 0;
  count7  := 0;
  count8  := 0;
  count9  := 0;
  count10 := 0;

  ZRLabel26.Caption:=Format('%.2f',[Total]);
  SZRLabel1.Caption:=Format('%.2f',[TotalCom]);
  //
  SZRLabel20.Caption:=Format('%.2f',[vVista]);
  SZRLabel21.Caption:=Format('%.2f',[vPrazo]);
  SZRLabel22.Caption:=Format('%.2f',[vCartao]);


  if bTotalParcela then
  begin
    {QrParcelas.First;
    if QrParcelas.FieldByName('TRC_SEQUENCIA').AsString = '05' then
      lbl5Parcelas.Caption := Format('%.2f',[QrParcelas.FieldByName('TOTAL').AsFloat]);

    QrParcelas.Next;
    if QrParcelas.FieldByName('TRC_SEQUENCIA').AsString = '06' then
      lbl6Parcelas.Caption := Format('%.2f',[QrParcelas.FieldByName('TOTAL').AsFloat]);

    QrParcelas.Next;
    if QrParcelas.FieldByName('TRC_SEQUENCIA').AsString = '07' then
      lbl7Parcelas.Caption := Format('%.2f',[QrParcelas.FieldByName('TOTAL').AsFloat]);

    QrParcelas.Next;
    if QrParcelas.FieldByName('TRC_SEQUENCIA').AsString = '08' then
      lbl8Parcelas.Caption := Format('%.2f',[QrParcelas.FieldByName('TOTAL').AsFloat]);

    QrParcelas.Next;
    if QrParcelas.FieldByName('TRC_SEQUENCIA').AsString = '09' then
      lbl9Parcelas.Caption := Format('%.2f',[QrParcelas.FieldByName('TOTAL').AsFloat]);

    QrParcelas.Next;
    if QrParcelas.FieldByName('TRC_SEQUENCIA').AsString = '10' then
      lbl10Parcelas.Caption := Format('%.2f',[QrParcelas.FieldByName('TOTAL').AsFloat]);}

    //5 Parcelas
    QrParcelas5.First;
    while not QrParcelas5.Eof do
    begin
      count5 := count5 + QrParcelas5.FieldByName('TOTAL').AsFloat;
      QrParcelas5.Next;
    end;
    lbl5Parcelas.Caption := Format('%.2f',[count5]);


    //6 Parcelas
    QrParcelas6.First;
    while not QrParcelas6.Eof do
    begin
      count6 := count6 + QrParcelas6.FieldByName('TOTAL').AsFloat;
      QrParcelas6.Next;
    end;
    lbl6Parcelas.Caption := Format('%.2f',[count6]);


    //7 Parcelas
    QrParcelas7.First;
    while not QrParcelas7.Eof do
    begin
      count7 := count7 + QrParcelas7.FieldByName('TOTAL').AsFloat;
      QrParcelas7.Next;
    end;
    lbl7Parcelas.Caption := Format('%.2f',[count7]);


    //8 Parcelas
    QrParcelas8.First;
    while not QrParcelas8.Eof do
    begin
      count8 := count8 + QrParcelas8.FieldByName('TOTAL').AsFloat;
      QrParcelas8.Next;
    end;
    lbl8Parcelas.Caption := Format('%.2f',[count8]);


    //9 Parcelas
    QrParcelas9.First;
    while not QrParcelas9.Eof do
    begin
      count9 := count9 + QrParcelas9.FieldByName('TOTAL').AsFloat;
      QrParcelas9.Next;
    end;
    lbl9Parcelas.Caption := Format('%.2f',[count9]);


    //10 Parcelas
    QrParcelas10.First;
    while not QrParcelas10.Eof do
    begin
      count10 := count10 + QrParcelas10.FieldByName('TOTAL').AsFloat;
      QrParcelas10.Next;
    end;
    lbl10Parcelas.Caption := Format('%.2f',[count10]);

  end;
end;

procedure Trpt_Comissao2.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=Total+Entidade.ValorPG+Entidade.CredCli;
  TotalCom:=TotalCom+(Entidade.ValorPG*Vendedor1.PerAbaixo/100);
  //
  if zrb_detalhe.Height = 0 then
    Exit;
  //
  SZRLabel14.Caption :=Format('%.2f',[Entidade.ValorPG+Entidade.CredCli]);
  SZRLabel4.Caption:=Format('%.2f',[Entidade.ValorPG*Vendedor1.PerAbaixo/100]);
  //
  if (Entidade.FieldByName('PDV_TIPO_PAG').AsInteger = 5) or   //Dinheiro
     (Entidade.FieldByName('PDV_TIPO_PAG').AsInteger = 6) then //Cheque
  begin
    if Entidade.FieldByName('FPG_CODIGO').AsInteger = 1 then //A Vista
    begin
      SZRLabel16.Caption := 'A VISTA';
      vVista := vVista + Entidade.ValorPG+Entidade.CredCli;
    end
    else
    begin
      SZRLabel16.Caption := 'A PRAZO';
      vPrazo := vPrazo + Entidade.ValorPG+Entidade.CredCli;
    end;
  end
  else
  begin
    Parametro1.Close;
    Parametro1.ParamByName('PAR_CODIGO').asInteger := Entidade.FieldByName('PDV_TIPO_PAG').AsInteger;
    Parametro1.Open;
    SZRLabel16.Caption := Parametro1.FieldByName('PAR_DESCRICAO').asString;
    vCartao := vCartao + Entidade.ValorPG+Entidade.CredCli;
  end;
end;

procedure Trpt_Comissao2.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;  
end;

procedure Trpt_Comissao2.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  vVista := 0;
  vPrazo := 0;
  vCartao := 0;
end;

end.
