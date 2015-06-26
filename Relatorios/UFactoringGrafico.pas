unit UFactoringGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, SQuery, 
  QRExport, Item_de_Factoring, Cheque, Cliente;

type
  Trpt_FactoringGrafico = class(TForm)
    report: TQuickRep;
    QRBand1: TQRBand;
    qrlDescricaoRelatorio: TQRLabel;
    qrlNomeLoja: TQRLabel;
    qrlNomeCentroDeCusto: TQRLabel;
    qrsDataHoraImpressao: TQRSysData;
    QRBand2: TQRBand;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    qrsLinhaHorizontalRodape: TQRShape;
    qrsNumeroPagina: TQRSysData;
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    qrsLinhaHorizontalCabecalho2: TQRShape;
    QRLabel2: TQRLabel;
    zrlCliente: TQRLabel;
    QRShape1: TQRShape;
    zrbRodapeGrupo: TQRBand;
    QRShape4: TQRShape;
    QRDBText3: TQRDBText;
    Item_de_Factoring1: TItem_de_Factoring;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    zrlTotalCheque: TQRLabel;
    zrlBanco: TQRLabel;
    zrlNumero: TQRLabel;
    zrlValor: TQRLabel;
    zrlVencimento: TQRLabel;
    zrlEmitente: TQRLabel;
    Cheque1: TCheque;
    Cliente1: TCliente;
    QRShape2: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    TotalRegistros : integer;
    vTotalCheques: Double;
  public
    Entidade : TItem_de_Factoring;
  end;

var
  rpt_FactoringGrafico: Trpt_FactoringGrafico;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_FactoringGrafico.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNomeLoja.Caption:=DM.Configuracao1.LojaNome;
  qrlNomeCentroDeCusto.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_FactoringGrafico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_FactoringGrafico.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Cheque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.ChequeCNC;
    ParamByName('CHQ_CODIGO').asInteger := Entidade.CodigoCHQ;
    Open;
    zrlBanco.Caption := PreencheZero(3,Banco);
    zrlNumero.Caption := Numero;

    zrlValor.Caption := format('%.2f',[Valor]);
    vTotalCheques := vTotalCheques + Arredonda(Valor);
    
    zrlVencimento.Caption := DateToStr(Data);
    if Trim(DonoCheque) <> '' then
      zrlEmitente.Caption := DonoCheque //+'('+PreencheZero(2,ClienteCNC)+'-'+IntToStr(CodigoCLI)+')'
    else
    Begin
      with Cliente1 do
      Begin
        if (not Active) or
           (CodigoCNC <> Cheque1.ClienteCNC) or
           (CodigoCLI <> Cheque1.CodigoCLI) then
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := Cheque1.ClienteCNC;
          ParamByName('CLI_CODIGO').asInteger := Cheque1.CodigoCLI;
          Open;
        end;
        zrlEmitente.Caption := AbreviarNome(RazaoSocial); //+'('+PreencheZero(2,ClienteCNC)+'-'+IntToStr(CodigoCLI)+')';
      end;
    end;
  end;
  inc(TotalRegistros);
end;

procedure Trpt_FactoringGrafico.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Factoring1;
  TotalRegistros := 0;
end;

procedure Trpt_FactoringGrafico.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Cliente1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.FieldByname('CNC_CLIENTE').asInteger) or
       (CodigoCLI <> Entidade.FieldByname('CLI_CODIGO').asInteger) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByname('CNC_CLIENTE').asInteger;
      ParamByName('CLI_CODIGO').asInteger := Entidade.FieldByname('CLI_CODIGO').asInteger;
      Open;
    end;
    zrlCliente.Caption := RazaoSocial+' ('+Fone+')';
  end;
end;

procedure Trpt_FactoringGrafico.zrbRodapeGrupoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//  qrlTotalRegistros.Caption := IntToStr(TotalRegistros);
  zrlTotalCheque.Caption := format('%.2f',[vTotalCheques]);
end;

end.
