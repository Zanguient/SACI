unit MxSelConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, DBTables, funcoes,
  SQuery, CentroCusto, Conta_de_Caixa, Parametro;

type
  TfMxSelConta = class(TForm)
    Panel1: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DSConta_de_Caixa: TDataSource;
    ckbCodigoCNC: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DSCentro_de_Custo: TDataSource;
    CentroCusto1: TCentroCusto;
    ckbSomenteAvulso: TCheckBox;
    ckbSintetico: TCheckBox;
    ckbOficiais: TCheckBox;
    Conta_de_Caixa1: TConta_de_Caixa;
    ckbGraficoBarras: TCheckBox;
    ckbGrupo: TCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    ckbExcluirAvulso: TCheckBox;
    ckbIgnorarExtornosExtornados: TCheckBox;
    ckbNaoAgruparCAX: TCheckBox;
    ckbCodigoCCX: TCheckBox;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    rdgDataCadastro: TRadioButton;
    rdgDataCompetencia: TRadioButton;
    ckbExibirTitulos: TCheckBox;
    Bevel1: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbGrupoClick(Sender: TObject);
    procedure ckbSomenteAvulsoClick(Sender: TObject);
    procedure ckbExcluirAvulsoClick(Sender: TObject);
    procedure ckbCodigoCCXClick(Sender: TObject);
    procedure ckbExibirTitulosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelConta: TfMxSelConta;

implementation

uses URelacaoDespesas, UDM, MxGraficoCaixaCD, MxGraficoCaixaCDBarras;

{$R *.DFM}


procedure TfMxSelConta.BitBtn1Click(Sender: TObject);
var
  mensagem, sFiltros, Conta, Centro, CD, TIT, Oficial, OficialTRC, OficialTPG, DataINI, DataFIM,
    DataINITRC, DataFIMTRC, DataINITPG, DataFIMTPG, sGrupo, sIgnorarExt, sIgnorarExtTRC,
    sAgrupaCaixa:string;
begin
  sFiltros:='';
  mensagem:='';
  DataINI:='';
  DataFIM:='';
  DataINITRC:='';
  DataFIMTRC:='';
  DataINITPG:='';
  DataFIMTPG:='';
  Centro:='';
  Oficial:='';
  OficialTRC:='';
  OficialTPG:='';
  Tit:='';
  Conta:='';
  sIgnorarExt:='';
  sIgnorarExtTRC:='';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text) then
  Begin
    sFiltros := sFiltros + '(DtINI:'+mskDataINI.Text+')';
    if rdgDataCompetencia.Checked then
      DataINI := ' AND (T1.MVC_COMPETENCIA>="'+MesDia(mskDataINI.Text)+'") '
    else
      DataINI := ' AND (T1.MVC_DATA>="'+MesDia(mskDataINI.Text)+'") ';

    DataINITRC := ' AND (T1.TRC_PAGAMENTO>="'+MesDia(mskDataINI.Text)+'") ';
    DataINITPG := ' AND (T1.TPG_PAGAMENTO>="'+MesDia(mskDataINI.Text)+'") ';
  end;

  if VerificaDataBranco(mskDataFIM.Text) then
  Begin
    sFiltros := sFiltros + '(DtFIM:'+mskDataFIM.Text+')';
    if rdgDataCompetencia.Checked then
      DataFIM := ' AND (T1.MVC_COMPETENCIA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
    else
      DataFIM := ' AND (T1.MVC_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

    DataFIMTRC := ' AND (T1.TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    DataFIMTPG := ' AND (T1.TPG_PAGAMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
  end;

  if ckbCodigoCCX.Checked then
  Begin
    Conta := ' AND (T1.CCX_CODIGO_REC='+IntToStr(DBLookupComboBox1.KeyValue)+') ';//AWOF -Conta := ' AND (T3.CCX_CODIGO='+IntToStr(DBLookupComboBox1.KeyValue)+') ';
    sFiltros := sFiltros + '(CCX:'+IntToStr(DBLookupComboBox1.KeyValue)+') ';
  end;

  if ckbSomenteAvulso.Checked then
  Begin
    TIT:=' AND (T1.MVC_PT="A") ';
    sFiltros := sFiltros + '(Avulso)';
  end
  else if ckbExcluirAvulso.Checked then
  Begin
    TIT:=' AND (T1.MVC_PT<>"A") ';
    sFiltros := sFiltros + '(NAvulso)';
  end;

  if ckbOficiais.Checked then
  Begin
    Oficial    := ' AND (T1.MVC_TIT_NUMERO IS NOT NULL AND T1.MVC_TIT_NUMERO<>"") ';
    OficialTRC := ' AND (T1.TRC_NUMERO IS NOT NULL AND T1.TRC_NUMERO<>"") ';
    OficialTPG := ' AND (T1.TPG_NUMERO IS NOT NULL AND T1.TPG_NUMERO<>"") ';
    sFiltros := sFiltros + '(Oficial)';
  end;

  if ckbCodigoCNC.Checked then
  Begin
    Centro:=' AND T1.CNC_CODIGO='+IntToStr(DBLookupComboBox2.KeyValue)+' ';
    sFiltros := sFiltros + '(CNC:'+IntToStr(DBLookupComboBox2.KeyValue)+')';
  end;

  if ckbGrupo.Checked then
  Begin
    sGrupo:=' AND T3.CCX_GRUPO='+IntToStr(DBLookupComboBox3.KeyValue)+'  ';
    sFiltros := sFiltros + '(Grupo:'+IntToStr(DBLookupComboBox3.KeyValue)+')';
  end;

  if ckbIgnorarExtornosExtornados.Checked then
  Begin
    sIgnorarExt := ' AND (T1.MVC_ORIGEM_EXTORNO=0 OR T1.MVC_ORIGEM_EXTORNO IS NULL) '+
                   ' AND T1.MVC_CODIGO NOT IN (SELECT MVC_ORIGEM_EXTORNO '+
                   ' FROM MOVIMENTO_DE_CAIXA '+
                   ' WHERE CNC_CODIGO=T1.CNC_CODIGO) ';
    sIgnorarExtTRC := ' AND T1.TRC_REABERTURA=0 ';
    sFiltros := sFiltros + '(IgnorarExt)';
  end;

  if self.tag in [0,2] then
    CD := ' AND T1.MVC_DC="D" '
  else if self.tag in [1,3] then
    CD := ' AND T1.MVC_DC="C" ';

  if (DM.Configuracao1.Empresa = empEletro) and
     (DM.Titulo_receber1.CentroDeCusto = 21) then //Mag_Pacajus
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET CCX_CODIGO=326 '+
      ' WHERE CCX_CODIGO NOT IN (SELECT CCX_CODIGO FROM CONTA_DE_CAIXA) ');
    ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_CAIXA SET CCX_CODIGO=326 '+
      ' WHERE CCX_CODIGO NOT IN (SELECT CCX_CODIGO FROM CONTA_DE_CAIXA) ');
    ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_PAGAR SET CCX_CODIGO=326 '+
      ' WHERE CCX_CODIGO NOT IN (SELECT CCX_CODIGO FROM CONTA_DE_CAIXA) ');

    ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET CCX_CODIGO_REC=326 '+
      ' WHERE CCX_CODIGO_REC NOT IN (SELECT CCX_CODIGO FROM CONTA_DE_CAIXA) ');
    ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_CAIXA SET CCX_CODIGO_REC=326 '+
      ' WHERE CCX_CODIGO_REC NOT IN (SELECT CCX_CODIGO FROM CONTA_DE_CAIXA) ');
  end;

  if tag in [0,1] then
  Begin
    Application.CreateForm(Trpt_RelacaoDespesas, rpt_RelacaoDespesas);
    with rpt_RelacaoDespesas do
    Begin
      zrlFiltros.Caption := sFiltros;

      if ckbSintetico.Checked then
        ZRBand2.Height:=0
      else
        ZRBand2.Height:=1;
      if fMxSelConta.tag = 0 then
        ZRLabel2.Caption:='SIAC - Relacao de Despesas'
      else if fMxSelConta.tag = 1 then
        ZRLabel2.Caption:='SIAC - Relacao de Recebimento';

      sAgrupaCaixa := 'CAIXA,'; //CAX_CODIGO AS CAIXA
      if ckbNaoAgruparCAX.Checked then
      Begin
        zrbGrupoCCX.Height := 0;
        zrbGrupoCCX.Expression := '';
        sAgrupaCaixa := '';
      end;
      with rpt_RelacaoDespesas.Movimento_Caixa1 do
      Begin
        Close;
        SQL.Text :=
          ' SELECT '+
          ' "MVC" AS TIPO '+
          ',0 AS CLI '+
          ',0 AS FORN '+
          ',0 AS TRN '+
          ',T1.CNC_CODIGO AS CENTRO '+
          ',T1.MVC_CODIGO AS CODIGO '+
          ',T1.CAX_CODIGO AS CAIXA '+
          ',T1.MVC_DESCRICAO AS DESCRICAO '+
          ',T1.MVC_DATA AS DATA '+
          ',T1.MVC_VALOR AS VALOR_PAGO '+
          ',T1.CCX_CODIGO AS COD_CONTA '+
          ',T3.CCX_DESCRICAO AS CONTA '+
          ',T3.CCX_GRUPO AS GRUPO '+
          ' FROM MOVIMENTO_DE_CAIXA T1 '+
          ' INNER JOIN CONTA_DE_CAIXA T3 '+
          ' ON T1.MVC_CODIGO>0 AND T1.CCX_CODIGO_REC=T3.CCX_CODIGO '+               //AWOF ' ON T1.MVC_CODIGO>0 '+
          CD+Conta+sGrupo+DataINI+DataFIM+Centro+TIT+Oficial+sIgnorarExt+
          ' AND T1.CCX_CODIGO=T3.CCX_CODIGO ';

        if ckbExibirTitulos.Checked then
        Begin
          if self.tag in [0,2] then
            SQL.Add('UNION '+
              ' SELECT '+
              ' "TPG" AS TIPO '+
              ',0 AS CLI '+
              ',FOR_CODIGO AS FORN '+
              ',TRN_CODIGO AS TRN '+
              ',T1.CNC_CODIGO AS CENTRO '+
              ',T1.TPG_CODIGO AS CODIGO '+
              ',0 AS CAIXA '+
              ',T1.TPG_OBSERVACAO AS DESCRICAO '+
              ',T1.TPG_PAGAMENTO AS DATA '+
              ',T1.TPG_VALOR_PAGO AS VALOR_PAGO '+
              ',T1.CCX_CODIGO AS COD_CONTA '+
              ',T3.CCX_DESCRICAO AS CONTA '+
              ',T3.CCX_GRUPO AS GRUPO '+
              ' FROM TITULO_A_PAGAR T1 '+
              ' INNER JOIN CONTA_DE_CAIXA T3 '+
              ' ON T1.TPG_SITUACAO=1 '+ //PAGO
              ' AND TPG_GEROU_MOVIMENTO=0 '+
              Conta+sGrupo+DataINITPG+DataFIMTPG+Centro+OficialTPG+
              ' AND T1.CCX_CODIGO=T3.CCX_CODIGO ')
          else if self.tag in [1,3] then
            SQL.Add('UNION '+
              ' SELECT '+
              ' "TRC" AS TIPO '+
              ',CLI_CODIGO AS CLI '+
              ',0 AS FORN '+
              ',0 AS TRN '+
              ',T1.CNC_CODIGO AS CENTRO '+
              ',T1.TRC_CODIGO AS CODIGO '+
              ',0 AS CAIXA '+
              ',T1.TRC_OBSERVACAO AS DESCRICAO '+
              ',T1.TRC_PAGAMENTO AS DATA '+
              ',T1.TRC_VALOR_PAGO AS VALOR_PAGO '+
              ',T1.CCX_CODIGO AS COD_CONTA '+
              ',T3.CCX_DESCRICAO AS CONTA '+
              ',T3.CCX_GRUPO AS GRUPO '+
              ' FROM TITULO_A_RECEBER T1 '+
              ' INNER JOIN CONTA_DE_CAIXA T3 '+
              ' ON T1.TRC_SITUACAO=2 '+ //RECEBIDO
              ' AND TRC_GEROU_MOVIMENTO=0 '+
              Conta+sGrupo+DataINITRC+DataFIMTRC+Centro+OficialTRC+sIgnorarExtTRC+
              ' AND T1.CCX_CODIGO=T3.CCX_CODIGO ');
        end;

        SQL.Add(' ORDER BY CENTRO,'+
          'GRUPO,'+sAgrupaCaixa+'COD_CONTA,DATA ');
          
        Open;
        if IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
      end;
      Report.Preview;
      Close;
    end;
  end
  else //Gráfico Despesas ou Recebimentos (tag = 2,3)
  Begin
    if ckbGraficoBarras.Checked then //Gráfico Barras
    Begin
      Application.CreateForm(TfMxGraficoCaixaCDBarras, fMxGraficoCaixaCDBarras);
      with fMxGraficoCaixaCDBarras do
      Begin
        if fMxSelConta.tag = 2 then
          DBChart1.Title.Text.Text := ' Despesas (Caixa)'
        else if fMxSelConta.tag = 3 then
          DBChart1.Title.Text.Text := ' Recebimentos (Caixa)';

        Query1.Close;
        Query1.SQL.Text:='SELECT T3.CCX_DESCRICAO AS DESCRICAO, '+
                'SUM(T1.MVC_VALOR) AS TOTAL '+
                'FROM Movimento_de_caixa t1, conta_de_caixa t3 '+
                'WHERE T1.CCX_CODIGO=T3.CCX_CODIGO '+
                CD+Conta+DataINI+DataFIM+Centro+TIT+Oficial+sIgnorarExt+
                'GROUP BY T3.CCX_DESCRICAO '+
                'HAVING SUM(T1.MVC_VALOR) > 0 '+
                'ORDER BY t3.CCX_DESCRICAO ';
        Query1.Open;
        if Query1.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        ShowModal;
      end;
    end
    else //Gráfico Pizza
    Begin
      Application.CreateForm(TfMxGraficoCaixaCD, fMxGraficoCaixaCD);
      with fMxGraficoCaixaCD do
      Begin
        if fMxSelConta.tag = 2 then
          DBChart1.Title.Text.Text := ' Despesas (Caixa)'
        else if fMxSelConta.tag = 3 then
          DBChart1.Title.Text.Text := ' Recebimentos (Caixa)';

        Query1.Close;
        Query1.SQL.Text:='SELECT T3.CCX_DESCRICAO AS DESCRICAO, '+
                'SUM(T1.MVC_VALOR) AS TOTAL '+
                'FROM Movimento_de_caixa t1, conta_de_caixa t3 '+
                'WHERE T1.CCX_CODIGO=T3.CCX_CODIGO '+
                CD+Conta+DataINI+DataFIM+Centro+TIT+Oficial+sIgnorarExt+
                'GROUP BY T3.CCX_DESCRICAO '+
                'HAVING SUM(T1.MVC_VALOR) > 0 '+
                'ORDER BY t3.CCX_DESCRICAO ';
        Query1.Open;
        if Query1.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        ShowModal;
      end;
    end;
  end;
end;

procedure TfMxSelConta.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  mskDataINI.SetFocus;
  if tag in [2,3] then
    ckbSintetico.Enabled := False
  else
    ckbGraficoBarras.Enabled := False;
end;

procedure TfMxSelConta.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Conta_de_Caixa1.Close;
  Action := caFree;
end;

procedure TfMxSelConta.ckbCodigoCNCClick(Sender: TObject);
begin
  If ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    DBLookupComboBox2.Enabled:=True;
    DBLookupComboBox2.Color:=clWindow;
    DBLookupComboBox2.KeyValue := DM.Configuracao1.CodigoCNC;
    DBLookupComboBox2.SetFocus;
  end
  else
  begin
    DBLookupComboBox2.Enabled:=False;
    DBLookupComboBox2.Color:=AlteraCorComponentes;
    CentroCusto1.Close;
  end;
end;

procedure TfMxSelConta.ckbGrupoClick(Sender: TObject);
begin
  If ckbGrupo.Checked then
  Begin
    Parametro1.Open;
    DBLookupComboBox3.Enabled:=True;
    DBLookupComboBox3.Color:=clWindow;
    DBLookupComboBox3.KeyValue := Parametro1.CodigoPAR;
    DBLookupComboBox3.SetFocus;
  end
  else
  begin
    DBLookupComboBox3.Enabled:=False;
    DBLookupComboBox3.Color:=AlteraCorComponentes;
    Parametro1.Close;
  end;

end;

procedure TfMxSelConta.ckbSomenteAvulsoClick(Sender: TObject);
begin
  if ckbSomenteAvulso.Checked then
  Begin
    ckbExcluirAvulso.Checked := False;
    ckbExibirTitulos.Enabled := False;
    ckbExibirTitulos.Checked := False;
  end
  else
    ckbExibirTitulos.Enabled := True;
end;

procedure TfMxSelConta.ckbExcluirAvulsoClick(Sender: TObject);
begin
  if ckbExcluirAvulso.Checked then
     ckbSomenteAvulso.Checked := False;
end;

procedure TfMxSelConta.ckbCodigoCCXClick(Sender: TObject);
begin
  if ckbCodigoCCX.Checked then
  Begin
    Conta_de_Caixa1.Open;
    DBLookupComboBox1.Color:=clWindow;
    DBLookupComboBox1.Enabled:=True;
    DBLookupComboBox1.KeyValue := Conta_de_Caixa1.CodigoCCX;
  end
  else
  Begin
    Conta_de_Caixa1.Close;
    DBLookupComboBox1.Color:=AlteraCorComponentes;
    DBLookupComboBox1.Enabled:=False;
  end;
end;

procedure TfMxSelConta.ckbExibirTitulosClick(Sender: TObject);
begin
  if ckbExibirTitulos.Checked then
  Begin
    ckbNaoAgruparCAX.Enabled := False;
    ckbNaoAgruparCAX.Checked := True;
  end
  else
  Begin
    ckbNaoAgruparCAX.Enabled := True;  
  end;
end;

procedure TfMxSelConta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1Click(BitBtn1);
end;

end.


