unit MxSelDataCentro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls;

type
  TfMxSelDataCentro = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label2: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    dblCodigoCNC: TDBLookupComboBox;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    ckbCentroDeCusto: TCheckBox;
    ckbMeiaFolha: TCheckBox;
    ckbSintetico: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    DataOk: Boolean;
  end;

var
  fMxSelDataCentro: TfMxSelDataCentro;
  CNC:string;

implementation

uses UDM, UPrinc2, uMovEstoque, MxSPediProd, UProcura_Mercadoria,
  UBalancete;

{$R *.DFM}


procedure TfMxSelDataCentro.BitBtn1Click(Sender: TObject);
var
  mensagem,sDataINI,sDataFIM,sDataINITRC,sDataFIMTRC,sDataINITPG,sDataFIMTPG,sDataINITRCv,sDataFIMTRCv,sCNC,sCNCTRC,sFiltros, sOrdem :string;
begin
  mensagem:='';
  sCNC:='';
  sCNCTRC := '';
  sDataINI := '';
  sDataFIM := '';
  sDataINITRC := '';
  sDataFIMTRC := '';
  sDataINITPG := '';
  sDataFIMTPG := '';
  sDataINITRCv := '';
  sDataFIMTRCv := '';
  sOrdem := '';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text) then
  Begin
    if self.tag = 0 then //
      sDataINI := ' AND RGP_DATA>="'+MesDia(mskDataINI.Text)+'" '
    else if self.Tag = 1 then //Balancete
    Begin
      sDataINI    := ' AND MVC_DATA>="'+MesDia(mskDataINI.Text)+'" ';
      sDataINITRC := ' AND TRC_PAGAMENTO>="'+MesDia(mskDataINI.Text)+'" ';
      sDataINITPG := ' AND TPG_PAGAMENTO>="'+MesDia(mskDataINI.Text)+'" ';
      sDataINITRCv := ' AND TRC_VENCIMENTO>="'+MesDia(mskDataINI.Text)+'" ';
    end;
    sFIltros := sFiltros + '(DtINI:'+mskDataINI.Text+')';
  end;

  if VerificaDataBranco(mskDataFIM.Text) then
  Begin
    if self.tag = 0 then //
      sDataFIM := ' AND RGP_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if self.Tag = 1 then //Balancete
    Begin
      sDataFIM    := ' AND MVC_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      sDataFIMTRC := ' AND TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      sDataFIMTPG := ' AND TPG_PAGAMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      sDataFIMTRCv := ' AND TRC_VENCIMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
    end;
    sFIltros := sFiltros + '(DtFIM:'+mskDataFIM.Text+')';
  end;


  if ckbCentroDeCusto.Checked then
    if not VerificaInteiroBranco(dblCodigoCNC.KeyValue) then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      sCNC:=' AND (CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sCNCTRC:=' AND (TRC.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  If Tag=0 then
  begin
    Application.CreateForm(Trpt_Procura_Mercadoria, rpt_Procura_Mercadoria);
    with rpt_Procura_Mercadoria do
    Begin
      Tag := 0;
      zrlFiltros.Caption := sFiltros;
      RegProc1.Close;
      RegProc1.SQL.Text:='SELECT * FROM REGISTRO_DE_PROCURA '+
          'WHERE CNC_CODIGO<>-1 '+
          sDataINI+sDataFIM+CNC+
          'ORDER BY CNC_CODIGO ,RGP_DESCRICAO ASC';
      RegProc1.Open;
      report.Preview;
      Close;
    end;
  end
  else if self.Tag = 1 then //Balancete
  Begin
    Application.CreateForm(Trpt_Balancete,rpt_Balancete);
    with rpt_Balancete do
    Begin
      Tag := 0;

      if DM.Configuracao1.Empresa = empLuciano then
      Begin
        zrlSaldoMovimento.Enabled := False;
        zrlSaldoGrupo.Enabled := False;
      end;

      if ckbSintetico.Checked then
      Begin
        zrlLinha3.Enabled := False;
        zrbGrupoTipo.Height := 0;
        zrbDetalhe.Height := 0;
      end
      else
        zrlDescricaoGrupoConta.Enabled := False;

      //sOrdem := ' C1.CCX_GRUPO, CCX_DESCRICAO ';
      sOrdem := ' CCX_GRUPO, CCX_DESCRICAO ';

      if ckbMeiaFolha.Checked then
        report.Options.PageLength := 32;

      zrlFiltros.Caption := sFiltros;

      Titulo_receber2.Close;
      Titulo_receber2.SQL.Text := 'SELECT SUM(TRC_VALOR_PAGO) AS TOTAL '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE TRC_TIPO_PAG=:TRC_TIPO_PAG '+
        sCNC+sDataINITRC+sDataFIMTRC;

      Entidade.Close;
      Entidade.SQL.Text :=
        //Títulos Recebidos
        ' SELECT C1.* '+
        ',(SELECT SUM(MVC_VALOR) '+
        '   FROM MOVIMENTO_DE_CAIXA '+
        '   WHERE MVC_DC="C" '+
        sCNC+sDataINI+sDataFIM+
        '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS CREDITO_MVC '+
        ',(SELECT SUM(MVC_VALOR) '+
        '   FROM MOVIMENTO_DE_CAIXA '+
        '   WHERE MVC_DC="D" '+
        sCNC+sDataINI+sDataFIM+
        '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS DEBITO_MVC '+
        ',(SELECT SUM(TRC_VALOR_PAGO) '+
        '   FROM TITULO_A_RECEBER '+
        '   WHERE TRC_SITUACAO=2 '+
        sCNC+sDataINITRC+sDataFIMTRC+
        '   AND (TRC_GEROU_MOVIMENTO=0 OR TRC_GEROU_MOVIMENTO IS NULL) '+
        '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS CREDITO_TRC '+
        ',(SELECT SUM(TPG_VALOR_PAGO) '+
        '   FROM TITULO_A_PAGAR '+
        '   WHERE TPG_SITUACAO=1 '+
        sCNC+sDataINITPG+sDataFIMTPG+
        '   AND (TPG_GEROU_MOVIMENTO=0 OR TPG_GEROU_MOVIMENTO IS NULL) '+
        '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS DEBITO_TPG '+
        ' FROM CONTA_DE_CAIXA C1 '+
        ' WHERE CCX_GRUPO>0 '+

        'UNION ' +

        'SELECT '+
        '  0 AS CCX_CODIGO, ' +
        '  0 AS CNC_CODIGO, '+
        '  ''C'' AS CCX_DC, '+
        '  ''CARTÃO DE CRÉDITO (PREVISÃO)'' AS CCX_DESCRICAO, ' +
        '  0 AS CCX_LIMITE_GASTO, ' +
        '  0 AS CCX_DISPONIVEL, '+
        '  0 AS USU_CODIGO, '+
        '  0 AS CCX_DT_ALTERADO, '+
        '  '''' AS CCX_CONTABIL_1, '+
        '  '''' AS CCX_CONTABIL_2, '+
        '  0 AS CCX_VISUALIZAR_FINANCEIRO, '+
        '  0 AS CCX_VISUALIZAR_CAIXA, '+
        '  0 AS CCX_HISTORICO_CONTABIL, '+
        '  1 AS CCX_AVULSO, '+
        '  0 AS CCX_DT_CADASTRO, '+
        '  '''' AS CCX_CONTABIL_3, '+
        '  '''' AS CCX_CONTABIL_4, '+
        '  452 AS CCX_GRUPO, '+
        '  '''' AS CCX_OBSERVACAO, '+
        '  0 AS CCX_SITUACAO, '+
        '  0 AS ACC_CODIGO, '+

        //CREDITO_MVC
        '  (SELECT SUM(TRC.TRC_VALOR_PAGO + T2.CLI_CREDITO) '+
        '    FROM Titulo_a_receber TRC, Cliente T2, CONTA_DE_CAIXA T5 '+
        '  WHERE TRC.TRC_SITUACAO IN (2,3)  AND (TRC.TRC_TIPO_PAG=13) '+
        sCNCTRC+sDataINITRCv+sDataFIMTRCv+
        ' AND TRC.CCX_CODIGO*=T5.CCX_CODIGO  AND TRC.CNC_CLIENTE*=T2.CNC_CODIGO '+
        '    AND TRC.CLI_CODIGO*=T2.CLI_CODIGO) AS CREDITO_MVC, '+

        //DEBITO_MVC
        '  (SELECT SUM(TRC.TRC_DESCONTO) '+
        '    FROM Titulo_a_receber TRC, Cliente T2, CONTA_DE_CAIXA T5 '+
        '  WHERE TRC.TRC_SITUACAO IN (2,3)  AND (TRC.TRC_TIPO_PAG=13) '+
        sCNCTRC+sDataINITRCv+sDataFIMTRCv+
        ' AND TRC.CCX_CODIGO*=T5.CCX_CODIGO  AND TRC.CNC_CLIENTE*=T2.CNC_CODIGO '+
        '    AND TRC.CLI_CODIGO*=T2.CLI_CODIGO) AS DEBITO_MVC, '+

        '  0 AS CREDITO_TRC, '+
        '  0 AS DEBITO_TPG '+
        'FROM ' +
        '  USUARIO_CONF '+

        ' ORDER BY '+sOrdem;


{        ' CASE TRC_CRED_CLI '+
        '  WHEN NULL THEN 0 '+
        '  ELSE TRC_CRED_CLI '+
        ' END)                               AS DEBITO, '+
        ' CASE T1.TRC_TIPO_PAG '+
        '  WHEN 13 THEN 0 '+                                     //Tipo: Banco
        '  WHEN 412 THEN 0 '+                                    //Tipo: Banco
        '  ELSE 1 '+                                             //Tipo: Outros Recebimentos
        ' END                                AS TIPO, '+
        ' DATEPART(day,   T1.TRC_PAGAMENTO)  AS DIA, '+
        ' DATEPART(month, T1.TRC_PAGAMENTO)  AS MES, '+
        ' DATEPART(year,  T1.TRC_PAGAMENTO)  AS ANO '+
}
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelDataCentro.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelDataCentro.ckbCentroDeCustoClick(Sender: TObject);
begin
  if ckbCentroDeCusto.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.color:=clWindow;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.color:=AlteraCorComponentes;
  end;
end;

procedure TfMxSelDataCentro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure TfMxSelDataCentro.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
