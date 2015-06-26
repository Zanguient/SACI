unit untRelPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SQuery, Titulo_receber, QuickRpt, DB, DBTables, ExtCtrls,
  QRCtrls;

type
  TfrmRelPlanoContas = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBandGrupo: TQRBand;
    QRSubDetailSubGrupo: TQRSubDetail;
    QRSubDetailAbrangente: TQRSubDetail;
    QueryGrupo: TQuery;
    QuerySubGrupo: TQuery;
    QueryAbrangente: TQuery;
    Titulo_receber1: TTitulo_receber;
    QRSubDetailTitulos: TQRSubDetail;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    procedure DetailBandGrupoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetailSubGrupoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetailAbrangenteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetailTitulosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPlanoContas: TfrmRelPlanoContas;

implementation

uses MxSelGerencial;

{$R *.dfm}

procedure TfrmRelPlanoContas.DetailBandGrupoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel8.Caption := QueryGrupo.FieldbyName('GCC_CODIGO').AsString;
  //SUBGRUPO
  with fMxSelGerencial do
  begin
    QuerySubGrupo.Close;
    QuerySubGrupo.SQL.Text :=
      //Títulos Recebidos
      ' SELECT DISTINCT(T3.SCC_CODIGO) '+
      ' FROM CONTA_DE_CAIXA C1 '+

      ' INNER JOIN ABRANGENTES_CONTA_DE_CAIXA T2 ON C1.ACC_CODIGO = T2.ACC_CODIGO '+
      '	INNER JOIN SUBGRUPO_CONTA_DE_CAIXA T3 ON T2.SCC_CODIGO = T3.SCC_CODIGO '+
      '	INNER JOIN GRUPO_CONTA_DE_CAIXA T4 ON T4.GCC_CODIGO = T3.GCC_CODIGO ' +

      ' WHERE C1.CCX_SITUACAO=0 '+ //By Anderson
      //
      ' AND ( (SELECT SUM(MVC_VALOR) '+
      '   FROM MOVIMENTO_DE_CAIXA '+
      '   WHERE MVC_DC="C" '+
      sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
      ' OR (SELECT SUM(MVC_VALOR) '+
      '   FROM MOVIMENTO_DE_CAIXA '+
      '   WHERE MVC_DC="D" '+
      sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
      ' OR (SELECT SUM(TRC_VALOR_PAGO) '+
      '   FROM TITULO_A_RECEBER '+
      '   WHERE TRC_SITUACAO=2 '+
      sCNC+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
      ' OR (SELECT SUM(TPG_VALOR_PAGO) '+
      '   FROM TITULO_A_PAGAR '+
      '   WHERE TPG_SITUACAO=1 '+
      sCNC+sDataINITPG+sDataFIMTPG+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 )'+
      ' AND T3.GCC_CODIGO = '''+QueryGrupo.Fieldbyname('GCC_CODIGO').AsString+''''+
      //
      ' ORDER BY  T3.SCC_CODIGO';
    QuerySubGrupo.Open;
  end;



end;

procedure TfrmRelPlanoContas.QRSubDetailSubGrupoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel5.caption := QuerySubGrupo.FieldbyName('SCC_CODIGO').AsString;

  //ABRANGENTE
 { with fMxSelGerencial do
  begin
    QueryAbrangente.Close;
    QueryAbrangente.SQL.Text :=
      //Títulos Recebidos
      ' SELECT DISTINCT(T2.ACC_CODIGO) '+
      ' FROM CONTA_DE_CAIXA C1 '+

      ' INNER JOIN ABRANGENTES_CONTA_DE_CAIXA T2 ON C1.ACC_CODIGO = T2.ACC_CODIGO '+
      '	INNER JOIN SUBGRUPO_CONTA_DE_CAIXA T3 ON T2.SCC_CODIGO = T3.SCC_CODIGO '+
      '	INNER JOIN GRUPO_CONTA_DE_CAIXA T4 ON T4.GCC_CODIGO = T3.GCC_CODIGO ' +

      ' WHERE C1.CCX_SITUACAO=0 '+ //By Anderson
      //
      ' AND ( (SELECT SUM(MVC_VALOR) '+
      '   FROM MOVIMENTO_DE_CAIXA '+
      '   WHERE MVC_DC="C" '+
      sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
      ' OR (SELECT SUM(MVC_VALOR) '+
      '   FROM MOVIMENTO_DE_CAIXA '+
      '   WHERE MVC_DC="D" '+
      sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
      ' OR (SELECT SUM(TRC_VALOR_PAGO) '+
      '   FROM TITULO_A_RECEBER '+
      '   WHERE TRC_SITUACAO=2 '+
      sCNC+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
      ' OR (SELECT SUM(TPG_VALOR_PAGO) '+
      '   FROM TITULO_A_PAGAR '+
      '   WHERE TPG_SITUACAO=1 '+
      sCNC+sDataINITPG+sDataFIMTPG+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 )'+
      ' AND T3.SCC_CODIGO = '''+QuerySubGrupo.Fieldbyname('SCC_CODIGO').AsString+''''+
      ' AND T4.GCC_CODIGO = '''+QueryGrupo.Fieldbyname('GCC_CODIGO').AsString+''''+
      //
      ' ORDER BY  T2.ACC_CODIGO';
    QueryAbrangente.Open;
  end;}
end;

procedure TfrmRelPlanoContas.QRSubDetailAbrangenteBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //QRLabel6.caption := QueryAbrangente.FieldbyName('ACC_CODIGO').AsString;

  //CONTA_DE_CAIXA
{  with fMxSelGerencial do
  begin
    Titulo_receber1.Close;
    Titulo_receber1.SQL.Text :=
      //Títulos Recebidos
      ' SELECT C1.* '+
      ',(SELECT SUM(MVC_VALOR) '+
      '   FROM MOVIMENTO_DE_CAIXA '+
      '   WHERE MVC_DC="C" '+
      sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS CREDITO_MVC '+
      ',(SELECT SUM(MVC_VALOR) '+
      '   FROM MOVIMENTO_DE_CAIXA '+
      '   WHERE MVC_DC="D" '+
      sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS DEBITO_MVC '+
      ',(SELECT SUM(TRC_VALOR_PAGO) '+
      '   FROM TITULO_A_RECEBER '+
      '   WHERE TRC_SITUACAO=2 '+
      sCNC+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS CREDITO_TRC '+
      ',(SELECT SUM(TPG_VALOR_PAGO) '+
      '   FROM TITULO_A_PAGAR '+
      '   WHERE TPG_SITUACAO=1 '+
      sCNC+sDataINITPG+sDataFIMTPG+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS DEBITO_TPG '+
      ' FROM CONTA_DE_CAIXA C1 '+
      ' WHERE C1.CCX_SITUACAO=0 '+ //By Anderson
      //
      ' AND ( (SELECT SUM(MVC_VALOR) '+
      '   FROM MOVIMENTO_DE_CAIXA '+
      '   WHERE MVC_DC="C" '+
      sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+

      ' OR (SELECT SUM(MVC_VALOR) '+
      '   FROM MOVIMENTO_DE_CAIXA '+
      '   WHERE MVC_DC="D" '+
      sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
      ' OR (SELECT SUM(TRC_VALOR_PAGO) '+
      '   FROM TITULO_A_RECEBER '+
      '   WHERE TRC_SITUACAO=2 '+
      sCNC+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
      ' OR (SELECT SUM(TPG_VALOR_PAGO) '+
      '   FROM TITULO_A_PAGAR '+
      '   WHERE TPG_SITUACAO=1 '+
      sCNC+sDataINITPG+sDataFIMTPG+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
      '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 )'+
      ' AND C1.ACC_CODIGO = '''+QueryAbrangente.Fieldbyname('ACC_CODIGO').AsString+''''+
      //
      ' ORDER BY CCX_CODIGO';

      Titulo_receber1.Open;
  end;}
end;

procedure TfrmRelPlanoContas.QRSubDetailTitulosBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//  QRLabel7.caption := Titulo_receber1.FieldbyName('CCX_CODIGO').AsString;
end;

end.
