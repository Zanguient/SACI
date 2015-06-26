unit UCheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo,
  Agencia, Banco, Cheque;

type
  Trpt_cheques = class(TForm)
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
    ZRDBText2: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRDBText3: TSZRDBText;
    Cheque1: TCheque;
    SZRLabel3: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel4: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel1: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel2: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRDBText1: TSZRDBText;
    Cheque1CHQ_CODIGO: TIntegerField;
    Cheque1CNC_CODIGO: TIntegerField;
    Cheque1CHQ_NUMERO: TStringField;
    Cheque1CHQ_VALOR: TFloatField;
    Cheque1CHQ_DATA: TDateTimeField;
    Cheque1CHQ_ER: TStringField;
    Cheque1CHQ_SITUACAO: TIntegerField;
    Cheque1CBN_NUMERO: TIntegerField;
    Cheque1CHQ_OBSERVACAO: TStringField;
    Cheque1CHQ_CNC_TITULO: TIntegerField;
    Cheque1BNC_NUMERO: TIntegerField;
    Cheque1AGN_NUMERO: TIntegerField;
    Cheque1CHQ_COD_TITULO: TIntegerField;
    Cheque1CHQ_TERCEIRO: TIntegerField;
    Cheque1USU_CODIGO: TIntegerField;
    Cheque1CHQ_DT_ALTERADO: TDateTimeField;
    Cheque1CHQ_DT_CADASTRO: TDateTimeField;
    Cheque1CHQ_NOMINAL: TStringField;
    Cheque1CHQ_DONO_CHEQUE: TStringField;
    Cheque1CHQ_COMP: TIntegerField;
    Cheque1CHQ_BANCO: TIntegerField;
    Cheque1CHQ_AGENCIA: TIntegerField;
    Cheque1CHQ_C1: TIntegerField;
    Cheque1CHQ_CONTA: TIntegerField;
    Cheque1CHQ_C2: TIntegerField;
    Cheque1CHQ_C3: TIntegerField;
    Cheque1CHQ_CODIGO_BARRAS: TStringField;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlTotalCheques: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlSaldo: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlEmitente: TSZRLabel;
    Cheque1CHQ_ENVIADO: TIntegerField;
    Cheque1CHQ_DT_ENVIADO: TDateTimeField;
    Cheque1CHQ_UTILIZADO: TIntegerField;
    Cheque1CNC_CLIENTE: TIntegerField;
    Cheque1CLI_CODIGO: TIntegerField;
    Cheque1CNC_FACTORING: TIntegerField;
    Cheque1FCT_CODIGO: TIntegerField;
    Cliente1: TCliente;
    SZRLabel9: TSZRLabel;
    SZRDBText2: TSZRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormShow(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalCheques: Double;
    TotalRegistros : integer;
  public
    Entidade:TCheque;
    vSaldoDifZero: Boolean;
    { Public declarations }
  end;

var
  rpt_cheques: Trpt_cheques;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_cheques.FormCreate(Sender: TObject);
begin
  Entidade := Cheque1;
  TotalRegistros := 0;
  TotalCheques   := 0;
  vSaldoDifZero := False;
end;

procedure Trpt_cheques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Active := false;
 Action := cafree;
end;

procedure Trpt_cheques.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_cheques.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_cheques.FormShow(Sender: TObject);
begin
  Entidade.Active := true;
end;

procedure Trpt_cheques.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vSaldo: Double;
begin
  inc(TotalRegistros);

  if Trim(Entidade.DonoCheque) <> '' then
    zrlEmitente.Caption := Entidade.DonoCheque+'('+PreencheZero(2,Entidade.ClienteCNC)+'-'+IntToStr(Entidade.CodigoCLI)+')'
  else
  Begin
    with Cliente1 do
    Begin
      if (not Active) or
         (CodigoCNC <> Entidade.ClienteCNC) or
         (CodigoCLI <> Entidade.CodigoCLI) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
        ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
        Open;
      end;
      zrlEmitente.Caption := RazaoSocial+'('+PreencheZero(2,Entidade.ClienteCNC)+'-'+IntToStr(Entidade.CodigoCLI)+')';
    end;
  end;

  //0 Recebido
  //1 Entregue
  //2 Descontado
  //3 Devolvido 1º vez
  //4 Devolvido 2º vez
  //5 Re-Apresentado
  if Entidade.CodigoFCT > 0 then
    zrlSituacao.Caption := 'Factoring'
  else
  Begin
    case Entidade.Situacao of
      0: zrlSituacao.Caption := 'Recebido';
      1: zrlSituacao.Caption := 'Entregue';
      2: zrlSituacao.Caption := 'Descontado';
      3: zrlSituacao.Caption := 'Dev.1a.';
      4: zrlSituacao.Caption := 'Dev.2a.';
      5: zrlSituacao.Caption := 'Re-Apres.';
    else
      zrlSituacao.Caption := '';
    end;
  end;
  TotalCheques := TotalCheques + Arredonda(Entidade.Valor);

  //Calcular Saldo
  vSaldo := CalculaSaldoCheque(DM.QR_Consultas,Entidade.CodigoCNC,Entidade.CodigoCHQ);
  zrlSaldo.Caption := format('%.2f',[vSaldo]);

  if (vSaldoDifZero) and
     (vSaldo = 0) then
    DoPrint := False
  else
    DoPrint := True;
end;

procedure Trpt_cheques.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
  zrlTotalCheques.Caption := format('%.2f',[TotalCheques]);
end;

procedure Trpt_cheques.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
