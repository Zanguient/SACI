unit MxSelGerencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Parametro, Conta_de_Caixa,
  Titulo_receber, ComObj;

type
  TfMxSelGerencial = class(TForm)
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
    ckbCodigoCCX: TCheckBox;
    ckbGrupo: TCheckBox;
    dblCodigoCCX: TDBLookupComboBox;
    dblGrupoCC: TDBLookupComboBox;
    ckbTipo: TCheckBox;
    cmbTipo: TComboBox;
    DSConta_de_Caixa1: TDataSource;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSgrupo: TDataSource;
    ckbLimite: TCheckBox;
    ckbSubGrupo: TCheckBox;
    dblSubGrupoCC: TDBLookupComboBox;
    ckbAbrangente: TCheckBox;
    dblAbrangente: TDBLookupComboBox;
    sub_grupo: TQuery;
    abrangente: TQuery;
    DSsub_grupo: TDataSource;
    DSabrangente: TDataSource;
    grupo: TQuery;
    ckbAgrupar: TCheckBox;
    QuerySubGrupo: TQuery;
    QueryGrupo: TQuery;
    QueryAbrangente: TQuery;
    Titulo_receber1: TTitulo_receber;
    QueryOrcamento: TQuery;
    cbxPeriodo: TComboBox;
    cbxPeriodoAno: TComboBox;
    Titulo_receber2: TTitulo_receber;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoCCXClick(Sender: TObject);
    procedure ckbGrupoClick(Sender: TObject);
    procedure ckbTipoClick(Sender: TObject);
    procedure ckbSubGrupoClick(Sender: TObject);
    procedure ckbAbrangenteClick(Sender: TObject);
    procedure ckbAgruparClick(Sender: TObject);
    procedure colorir(cor: TColor; linha: integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    DataOk: Boolean;
    mensagem,sDataINI,sDataFIM,sDataINITRC,sDataFIMTRC,sDataINITPG,sDataFIMTPG,sCNC,sCNCTP,sCNCTR,sCNCTRC,sFiltros, sOrdem, sGrupo, sConta, sTipo, sSubGrupo, sAbrangente,sCNC2:string;
    Sheet : Variant;
  end;

var
  fMxSelGerencial: TfMxSelGerencial;
  CNC:string;

implementation

uses URelGerencial, UDM, untRelPlanoContas, Variants;

{$R *.DFM}


procedure TfMxSelGerencial.BitBtn1Click(Sender: TObject);
//var
  //mensagem,sDataINI,sDataFIM,sDataINITRC,sDataFIMTRC,sDataINITPG,sDataFIMTPG,sCNC,sCNCTRC,sFiltros, sOrdem, sGrupo, sConta, sTipo, sSubGrupo, sAbrangente:string;

var
  Excel: Variant;
  GRP, SUG, ABR, CCX, GRP_P, L, C,i, coluna: integer;
  AnoCorrente, AnoSelect, MesSelect: string;
  periodo,periodo_orcamento: string;
  totGrupo,totSubGrupo,totAbrangente : real;

  ATotAbrang,ATotOrAbrang: array[1..12] of double;  //awof
  ATotSubG,ATotOrSubG: array[1..12] of double;
  ATotGrupo,ATotOrGrupo: array[1..12] of double;
  linhaAbrang,linhaSubG, linhaGrupo:integer; //awof


begin
  IF VarIsNull(dblCodigoCNC.KeyValue) THEN//AWOF - IF (dblCodigoCNC.KeyValue = EmptyStr) THEN
     dblCodigoCNC.KeyValue:=1;
  totGrupo := 0;
  totSubGrupo := 0;
  totAbrangente := 0; 

  coluna := 0;
  periodo := '';
  periodo_orcamento := '';
  mensagem:='';
  sCNC:='';
  sCNCTR:='';
  sCNCTP:='';
  sCNCTRC := '';
  sDataINI := '';
  sDataFIM := '';
  sDataINITRC := '';
  sDataFIMTRC := '';
  sDataINITPG := '';
  sDataFIMTPG := '';
  sOrdem := '';
  sGrupo:='';
  sConta:='';
  sTipo:='';
  sSubGrupo:='';
  sAbrangente:='';

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
    end;
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
    end;
  end;

  if ckbCentroDeCusto.Checked then
    if not VerificaInteiroBranco(dblCodigoCNC.KeyValue) then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      sCNC:=' AND (CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sCNCTRC:=' AND (TRC.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sCNC2:=' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sCNCTR:=' AND (TR.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sCNCTP:=' AND (TP.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  // // // // //
  if ckbCodigoCCX.Checked then
    if dblCodigoCCX.Text = '' then
      raise Exception.Create('Conta de Caixa inválida!')
    else
    Begin
      sConta:=' AND (C1.CCX_CODIGO='+IntToStr(dblCodigoCCX.KeyValue)+') ';
      sFiltros := sFiltros + ' (CCX:'+dblCodigoCCX.Text+')';
    end;

  if ckbGrupo.Checked then
    if dblGrupoCC.Text = '' then
      raise Exception.Create('Grupo de Conta de Caixa inválido!')
    else
    Begin
      {sGrupo:=' AND (C1.CCX_CODIGO IN '+
        '(SELECT TA.CCX_CODIGO FROM CONTA_DE_CAIXA TA '+
        ' WHERE TA.CCX_GRUPO='+IntToStr(dblGrupoCC.KeyValue)+')) ';}
      sFiltros := sFiltros + ' (GRUPO CCX:'+dblGrupoCC.Text+')';
    end;

  if ckbSubGrupo.Checked then
    if dblSubGrupoCC.Text = '' then
      raise Exception.Create('SubGrupo de Conta de Caixa inválido!')
    else
    Begin
      {sSubGrupo:=' AND (C1.CCX_CODIGO IN '+
        '(SELECT TA.CCX_CODIGO FROM CONTA_DE_CAIXA TA '+
        ' WHERE TA.CCX_GRUPO='+IntToStr(dblGrupoCC.KeyValue)+')) ';}
      sFiltros := sFiltros + ' (SUBGRUPO SGP:'+dblGrupoCC.Text+')';
    end;

  if ckbAbrangente.Checked then
    if dblAbrangente.Text = '' then
      raise Exception.Create('Abrangente de Conta de Caixa inválido!')
    else
    Begin
      sAbrangente:=' AND (C1.CCX_CODIGO IN '+
        '(SELECT TA.CCX_CODIGO FROM CONTA_DE_CAIXA TA '+
        ' WHERE TA.ACC_CODIGO='+IntToStr(dblAbrangente.KeyValue)+')) ';
      sFiltros := sFiltros + ' (ABRANGENTE ACC:'+dblGrupoCC.Text+')';
    end;

  if ckbTipo.Checked then
  Begin
    case cmbTipo.ItemIndex of
      0: Begin
           sTipo:=' AND (C1.CCX_DC="C") ';
           sFiltros := sFiltros + ' (Credito)';
         end;
      1: Begin
           sTipo:=' AND (C1.CCX_DC="D") ';
           sFiltros := sFiltros + ' (Debito)';
         end;
    end;
  end;
  // // // // //

  if Tag = 1 then
  Begin
    if not ckbagrupar.Checked then
    begin
      Application.CreateForm(Trpt_Gerencial, rpt_Gerencial);
      with rpt_Gerencial do
      Begin
        tag:=1;
        if ckbSintetico.Checked then
        Begin
          zrlLinha3.Enabled := False;
          zrbDetalhe.Height := 0;
        end;

        sOrdem := ' C1.CCX_DESCRICAO';

        //zrbGrupoTipo.Height := 0; //Não tem Campos nessa Band

        if ckbMeiaFolha.Checked then
          report.Options.PageLength := 32;

        zrlFiltros.Caption := sFiltros;

        zrlDataINI.Caption := mskDataINI.Text;
        zrlDataFIM.Caption := mskDataFIM.Text;

        Titulo_receber2.Close;
        Titulo_receber2.SQL.Text := 'SELECT SUM(T1.TRC_VALOR_PAGO) AS TOTAL '+
          ' FROM TITULO_A_RECEBER T1, CONTA_DE_CAIXA C1'+
          ' WHERE T1.TRC_TIPO_PAG=:TRC_TIPO_PAG'+
          ' AND T1.CCX_CODIGO=C1.CCX_CODIGO'+
          ' AND C1.CCX_SITUACAO=''0'' '+
          sCNC2+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sAbrangente; //by Anderson // // //

        Titulo_receber3.Close;
        Titulo_receber3.SQL.Text := 'SELECT SUM(TRC.TRC_VALOR_PAGO) AS TOTAL '+
          ' FROM TITULO_A_RECEBER TRC, CONTA_DE_CAIXA C1 '+
          ' WHERE C1.CCX_GRUPO=:CCX_GRUPO '+
          ' AND C1.CCX_SITUACAO=''0'' '+ //by Anderson // //
          ' AND C1.CCX_CODIGO=TRC.CCX_CODIGO_REC '+
          sCNCTRC+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sAbrangente; //by Anderson // //

        Entidade.Close;
        Entidade.SQL.Text :=
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
          //
          ' ORDER BY '+sOrdem;

        Entidade.Open;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        if (report.Height > DM.Configuracao1.MaxLinhasImp) and
           (DM.Configuracao1.MaxLinhasImp <> 65) then
          report.Height := DM.Configuracao1.MaxLinhasImp;
        report.Preview;
        Close;
      end;
    end
    else //PARA O EXCEL
    begin

      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := True;
      Excel.WorkBooks.Open('C:\TEMP2.xls');

      Sheet := Excel.Workbooks[1].WorkSheets['Plan1'];

      //SELECT GRUPO
      QueryGrupo.Close;
      QueryGrupo.SQL.Text := 'SELECT GCC_CODIGO,GCC_DESCRICAO '+
                             ' FROM GRUPO_CONTA_DE_CAIXA ORDER BY GCC_CODIGO';
      QueryGrupo.Open;
      //

      AnoCorrente := cbxPeriodoAno.text;
      AnoSelect := AnoCorrente;

      Excel.WorkBooks[1].Sheets[1].Cells[2,8] := 'Descrição do Orçamento';
      Excel.WorkBooks[1].Sheets[1].Cells[3,8] := 'Data de cadastro: ' + Datetostr(DM.Configuracao1.Data);
      if ckbCentroDeCusto.Checked = true then
      Excel.WorkBooks[1].Sheets[1].Cells[4,8] := 'Centro de Orçamento: ' + dblCodigoCNC.Text
      else
      Excel.WorkBooks[1].Sheets[1].Cells[4,8] := 'Centro de Orçamento: ' + DM.CentroCusto1.RazaoSocial;

      Excel.WorkBooks[1].Sheets[1].Cells[7,8] := 'jan - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,12] := 'fev - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,16] := 'mar - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,20] := 'abr - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,24] := 'mai - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,28] := 'jun - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,32] := 'jul - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,36] := 'ago - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,40] := 'set - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,44] := 'out - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,48] := 'nov - '+AnoCorrente;
      Excel.WorkBooks[1].Sheets[1].Cells[7,52] := 'dez - '+AnoCorrente;

     // L := 9;
      L := 8; //awof
      C := 4;

      QueryGrupo.First;
      while not QueryGrupo.EoF do
      begin
        inc(L);
        Colorir($00ffcf9c,L);
        Excel.WorkBooks[1].Sheets[1].Cells[L,C] := QueryGrupo.Fieldbyname('GCC_DESCRICAO').AsString;

        //SUBGRUPO
        QuerySubGrupo.Close;
        QuerySubGrupo.SQL.Text := 'SELECT SCC_CODIGO,SCC_DESCRICAO FROM SUBGRUPO_CONTA_DE_CAIXA '+
                                  ' WHERE GCC_CODIGO = '''+QueryGrupo.FieldByName('GCC_CODIGO').AsString+''' '+
                                  ' ORDER BY SCC_CODIGO';
        QuerySubGrupo.Open;
        //
        //iniciando variavel awof
        linhaGrupo:=L;
        linhaSubG:= 10;
        //end
        QuerySubGrupo.First;
        while not QuerySubGrupo.EoF do
        begin
          inc(L);
          Colorir($FF8C00,L);
          Excel.WorkBooks[1].Sheets[1].Cells[L,C] := '   ' + QuerySubGrupo.Fieldbyname('SCC_DESCRICAO').AsString;
                                                //+1
          //ABRANGENTE
          QueryAbrangente.Close;
          QueryAbrangente.SQL.Text :='SELECT ACC_CODIGO,ACC_DESCRICAO FROM '+
                                     ' ABRANGENTES_CONTA_DE_CAIXA '+
                                     ' WHERE SCC_CODIGO = '''+QuerySubGrupo.FieldByName('SCC_CODIGO').AsString+''' '+
                                     ' ORDER BY ACC_CODIGO';
          QueryAbrangente.Open;
          //
           //iniciando variavel awof
          linhaSubG:= L;
          linhaAbrang:= 11; 
          //end
          QueryAbrangente.First;
          while not QueryAbrangente.EoF do
          begin
            inc(L);
            Colorir($00ccffcc,L);
            Excel.WorkBooks[1].Sheets[1].Cells[L,C] := '      ' + QueryAbrangente.Fieldbyname('ACC_DESCRICAO').AsString;
            Titulo_receber1.Close;
            linhaAbrang:= L;//awof
            Titulo_receber1.SQL.Text :={
              //Títulos Recebidos
              ' SELECT C1.* '+
              ',(SELECT SUM(MVC_VALOR) '+
              '   FROM MOVIMENTO_DE_CAIXA '+
              '   WHERE MVC_DC="C" '+
              '   AND YEAR(MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
              sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
              '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS CREDITO_MVC '+
              ',(SELECT SUM(MVC_VALOR) '+
              '   FROM MOVIMENTO_DE_CAIXA '+
              '   WHERE MVC_DC="D" '+
              '   AND YEAR(MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
              sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
              '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS DEBITO_MVC '+
              ',(SELECT SUM(TRC_VALOR_PAGO) '+
              '   FROM TITULO_A_RECEBER '+
              '   WHERE TRC_SITUACAO=2 '+
              '   AND YEAR(TRC_PAGAMENTO) = '''+cbxPeriodoAno.Text+''' '+
              sCNC+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
              '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS CREDITO_TRC '+
              ',(SELECT SUM(TPG_VALOR_PAGO) '+
              '   FROM TITULO_A_PAGAR '+
              '   WHERE TPG_SITUACAO=1 '+
              '   AND YEAR(TPG_PAGAMENTO) = '''+cbxPeriodoAno.Text+''' '+
              sCNC+sDataINITPG+sDataFIMTPG+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
              '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS DEBITO_TPG '+
              ' FROM CONTA_DE_CAIXA C1 '+
              ' WHERE C1.CCX_SITUACAO=0 '+ //By Anderson
              //
              ' AND ( (SELECT SUM(MVC_VALOR) '+
              '   FROM MOVIMENTO_DE_CAIXA '+
              '   WHERE MVC_DC="C" '+
              '   AND YEAR(MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
              sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
              '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+

              ' OR (SELECT SUM(MVC_VALOR) '+
              '   FROM MOVIMENTO_DE_CAIXA '+
              '   WHERE MVC_DC="D" '+
              '   AND YEAR(MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
              sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
              '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
              ' OR (SELECT SUM(TRC_VALOR_PAGO) '+
              '   FROM TITULO_A_RECEBER '+
              '   WHERE TRC_SITUACAO=2 '+
              '   AND YEAR(TRC_PAGAMENTO) = '''+cbxPeriodoAno.Text+''' '+
              sCNC+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
              '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+
              ' OR (SELECT SUM(TPG_VALOR_PAGO) '+
              '   FROM TITULO_A_PAGAR '+
              '   WHERE TPG_SITUACAO=1 '+
              '   AND YEAR(TPG_PAGAMENTO) = '''+cbxPeriodoAno.Text+''' '+
              sCNC+sDataINITPG+sDataFIMTPG+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
              '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 )'+
              ' AND C1.ACC_CODIGO = '''+QueryAbrangente.Fieldbyname('ACC_CODIGO').AsString+''''+
              //
              ' ORDER BY CCX_CODIGO';}
              'SELECT * FROM CONTA_DE_CAIXA WHERE ACC_CODIGO = '''+QueryAbrangente.Fieldbyname('ACC_CODIGO').AsString+''''+
              ' ORDER BY CCX_CODIGO';
            Titulo_receber1.Open;

            while not Titulo_receber1.EoF do
            begin
              inc(L);
              coluna := 0;
              DM.QuerySelect.Close;
              DM.QuerySelect.SQL.Text := 'SELECT CCX_DESCRICAO FROM CONTA_DE_CAIXA WHERE '+
                                         ' CCX_CODIGO = '''+Titulo_receber1.FieldByName('CCX_CODIGO').AsString+'''';
              DM.QuerySelect.Open;
              Excel.WorkBooks[1].Sheets[1].Cells[L,C] := '         ' + DM.QuerySelect.Fieldbyname('CCX_DESCRICAO').AsString;
                                                   //+3
              Excel.WorkBooks[1].Sheets[1].Cells[L,C-2] := Titulo_receber1.FieldByName('CCX_CODIGO').AsString;
              Excel.WorkBooks[1].Sheets[1].Cells[L,C+2] := Titulo_receber1.FieldByName('CCX_DC').AsString;

                //VALORES
              for i:= 1 to 12 do
              begin
                if (i = 10) or (i = 11) then
                  MesSelect := inttostr(i)
                else
                  MesSelect := '0'+inttostr(i);

                //Selecionando os orçamentos
                QueryOrcamento.Close;
                QueryOrcamento.SQL.Text := 'SELECT T3.* FROM ORCAMENTO T1 '+
                                           ' INNER JOIN ITEM_DE_ORCAMENTO T2 ON T1.ORC_CODIGO = T2.ORC_CODIGO '+
                                           ' INNER JOIN DATA_DE_ORCAMENTO T3 ON T2.IOR_CODIGO = T3.IOR_CODIGO '+
                                           ' WHERE T3.DOR_MES_ANO = '''+MesSelect+'/'+AnoSelect+''' '+
                                           ' AND T2.IOR_ITEM = '''+Titulo_receber1.FieldByName('CCX_CODIGO').AsString+''''+
                                           ' AND T1.CNC_CENTRO_ORCADO='+IntToStr(dblCodigoCNC.KeyValue);
                QueryOrcamento.Open;
                Excel.WorkBooks[1].Sheets[1].Cells[L,coluna+C+4] := QueryOrcamento.FieldByName('DOR_VALOR').AsFloat;

                //awof -  SOMA OS VALORES DOS ORÇAMENTOS    -  17/01/09
                ATotOrAbrang[i]:= ATotOrAbrang[i] + QueryOrcamento.FieldByName('DOR_VALOR').AsFloat;
                
                //Selecionando os movimentos
                Titulo_receber2.Close;
                Titulo_receber2.SQL.Text :=
                  //Títulos Recebidos
                  //COMENTADO PARA UM NOVO SELECT, USANDO UNION AWOF 08/01/09

                  {' SELECT C1.* '+
                                     //######################  SELECT MOVIMENTO DE CAIXA   ###################
                  ',(SELECT SUM(MVC_VALOR) '+
                  '   FROM MOVIMENTO_DE_CAIXA '+
                  '   WHERE MVC_DC="C" '+
                  //'   AND CCX_CODIGO '
                  '   AND MONTH(MVC_DATA) = '''+inttostr(i)+''' '+
                  '   AND YEAR(MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
                  sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
                  '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS CREDITO_MVC '+
                  ',(SELECT SUM(MVC_VALOR) '+
                  '   FROM MOVIMENTO_DE_CAIXA '+
                  '   WHERE MVC_DC="D" '+
                  '   AND MONTH(MVC_DATA) = '''+inttostr(i)+''' '+
                  '   AND YEAR(MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
                  sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
                  '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS DEBITO_MVC '+
                                       //############################# FIM SELECT MOVIMENTO DE CAIXA

                  ',(SELECT SUM(TRC_VALOR_PAGO) '+
                  '   FROM TITULO_A_RECEBER '+
                  '   WHERE TRC_SITUACAO IN (2,3) '+  //awof alterei TRC_SITUACAO=2
                  '   AND MONTH(TRC_PAGAMENTO) = '''+inttostr(i)+''' '+
                  '   AND YEAR(TRC_PAGAMENTO) = '''+cbxPeriodoAno.Text+''' '+
                  sCNC+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
                  '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS CREDITO_TRC '+
                  ',(SELECT SUM(TPG_VALOR_PAGO) '+
                  '   FROM TITULO_A_PAGAR '+
                  '   WHERE TPG_SITUACAO=1 '+
                  '   AND MONTH(TPG_PAGAMENTO) = '''+inttostr(i)+''' '+
                  '   AND YEAR(TPG_PAGAMENTO) = '''+cbxPeriodoAno.Text+''' '+
                  sCNC+sDataINITPG+sDataFIMTPG+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
                  '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) AS DEBITO_TPG '+
                  ' FROM CONTA_DE_CAIXA C1 '+
                  ' WHERE C1.CCX_SITUACAO=0 '+ //By Anderson
                  //
                  ' AND ( (SELECT SUM(MVC_VALOR) '+
                  '   FROM MOVIMENTO_DE_CAIXA '+
                  '   WHERE MVC_DC="C" '+
                  '   AND MONTH(MVC_DATA) = '''+inttostr(i)+''' '+
                  '   AND YEAR(MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
                  sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
                  '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+

                  ' OR (SELECT SUM(MVC_VALOR) '+
                  '   FROM MOVIMENTO_DE_CAIXA '+
                  '   WHERE MVC_DC="D" '+
                  '   AND MONTH(MVC_DATA) = '''+inttostr(i)+''' '+
                  '   AND YEAR(MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
                  sCNC+sDataINI+sDataFIM+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
                  '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+

                  ' OR (SELECT SUM(TRC_VALOR_PAGO) '+
                  '   FROM TITULO_A_RECEBER '+
                  '   WHERE TRC_SITUACAO IN (2,3) '+   //awof alterei TRC_SITUACAO=2
                  '   AND MONTH(TRC_PAGAMENTO) = '''+inttostr(i)+''' '+
                  '   AND YEAR(TRC_PAGAMENTO) = '''+cbxPeriodoAno.Text+''' '+
                  sCNC+sDataINITRC+sDataFIMTRC+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
                  '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 '+

                  ' OR (SELECT SUM(TPG_VALOR_PAGO) '+
                  '   FROM TITULO_A_PAGAR '+
                  '   WHERE TPG_SITUACAO=1 '+
                  '   AND MONTH(TPG_PAGAMENTO) = '''+inttostr(i)+''' '+
                  '   AND YEAR(TPG_PAGAMENTO) = '''+cbxPeriodoAno.Text+''' '+
                  sCNC+sDataINITPG+sDataFIMTPG+sGrupo+sConta+sTipo+sAbrangente+ //by Anderson
                  '   AND CCX_CODIGO_REC=C1.CCX_CODIGO) <> 0 )'+
                  ' AND C1.ACC_CODIGO = '''+QueryAbrangente.Fieldbyname('ACC_CODIGO').AsString+''''+
                  ' AND C1.CCX_CODIGO = '''+Titulo_receber1.FieldByName('CCX_CODIGO').AsString+''''+
                  //
                  ' ORDER BY CCX_CODIGO'; }
                  //#################  NOVO SELECT  ######################


                 ' SELECT C1.*, '+
                  //  ' (SELECT SUM(TR.TRC_VALOR_PAGO) FROM Titulo_a_receber TR, Cliente T2, CONTA_DE_CAIXA C1 '+
                  //  ' WHERE TR.TRC_SITUACAO IN (2,3) '+   //AND (TR.CNC_CODIGO=6)
                 //   ' AND MONTH(TR.TRC_PAGAMENTO) = '''+inttostr(i)+''' '+
                 //   ' AND YEAR(TR.TRC_PAGAMENTO) = '''+cbxPeriodoAno.Text+''''+     //AND TR.CCX_CODIGO_REC=1
                //    ' AND TR.CCX_CODIGO*=C1.CCX_CODIGO  AND TR.CNC_CLIENTE*=T2.CNC_CODIGO  '+
                //    ' AND TR.CLI_CODIGO*=T2.CLI_CODIGO '+ sCNCTR +
                //    ' AND TR.CCX_CODIGO_REC = '''+Titulo_receber1.FieldByName('CCX_CODIGO').AsString+''') AS CREDITO_TRC '+

                    '(SELECT SUM(TP.TPG_VALOR_PAGO) FROM TITULO_A_PAGAR TP ,CONTA_DE_CAIXA C1'+
                    '   WHERE TP.TPG_SITUACAO=1  '+
                    '   AND MONTH(TP.TPG_PAGAMENTO) = '''+inttostr(i)+''' '+
                    '   AND YEAR(TP.TPG_PAGAMENTO) = '''+cbxPeriodoAno.Text+''' '+
                    '   AND TP.CCX_CODIGO=C1.CCX_CODIGO '+ sCNCTP+
                    '   AND TP.CCX_CODIGO_REC = '''+Titulo_receber1.FieldByName('CCX_CODIGO').AsString+''') AS DEBITO_TPG '+

                    ' ,(SELECT SUM(TC.MVC_VALOR) FROM MOVIMENTO_DE_CAIXA TC,CONTA_DE_CAIXA C1 '+
                    '  WHERE TC.MVC_DC=''D'''+
                    ' AND MONTH(TC.MVC_DATA) = '''+inttostr(i)+''' '+
                    ' AND YEAR(TC.MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
                    ' AND TC.CCX_CODIGO_REC=C1.CCX_CODIGO '+
                    ' AND (TC.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') '+
                    ' AND TC.CCX_CODIGO_REC = '''+Titulo_receber1.FieldByName('CCX_CODIGO').AsString+''')AS MVC_DEBITO_TPG '+

                    ',(SELECT SUM(TC.MVC_VALOR) FROM MOVIMENTO_DE_CAIXA TC,CONTA_DE_CAIXA C1 '+
                    '  WHERE TC.MVC_DC=''C'''+
                    ' AND MONTH(TC.MVC_DATA) = '''+inttostr(i)+''' '+
                    ' AND YEAR(TC.MVC_DATA) = '''+cbxPeriodoAno.Text+''' '+
                    ' AND TC.CCX_CODIGO_REC=C1.CCX_CODIGO '+
                    ' AND (TC.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') '+
                    ' AND TC.CCX_CODIGO_REC = '''+Titulo_receber1.FieldByName('CCX_CODIGO').AsString+''')AS CREDITO_MVC '+


                ' FROM  CONTA_DE_CAIXA C1 '+
               ' WHERE C1.CCX_CODIGO = '''+Titulo_receber1.FieldByName('CCX_CODIGO').AsString+''''+
               // AND C1.ACC_CODIGO = '''+QueryAbrangente.Fieldbyname('ACC_CODIGO').AsString+''''+
               // sConta+sTipo+sAbrangente+ //AWOF 030209

                '  ORDER BY C1.CCX_CODIGO  ';

                Titulo_receber2.Open;

                if Titulo_receber2.FieldByName('CCX_DC').AsString = 'C' then
                begin
                  Excel.WorkBooks[1].Sheets[1].Cells[L,coluna+C+5] := Titulo_receber2.FieldByName('CREDITO_MVC').AsFloat;// + Titulo_receber2.FieldByName('CREDITO_TRC').AsFloat;
                  Excel.WorkBooks[1].Sheets[1].Cells[L,coluna+C+6] := Titulo_receber2.FieldByName('CREDITO_MVC').AsFloat - QueryOrcamento.FieldByName('DOR_VALOR').AsFloat;
                  // awof - SOMA OS VALORES DOS RECEBIMENTOS     - 17/02/09
                  ATotAbrang[i]:= ATotAbrang[i] + Titulo_receber2.FieldByName('CREDITO_MVC').AsFloat;// + Titulo_receber2.FieldByName('CREDITO_TRC').AsFloat;

                end
                else
                if Titulo_receber2.FieldByName('CCX_DC').AsString = 'D' then
                begin
                  Excel.WorkBooks[1].Sheets[1].Cells[L,coluna+C+5] := Titulo_receber2.FieldByName('DEBITO_TPG').AsFloat + Titulo_receber2.FieldByName('MVC_DEBITO_TPG').AsFloat;
                  Excel.WorkBooks[1].Sheets[1].Cells[L,coluna+C+6] := (QueryOrcamento.FieldByName('DOR_VALOR').AsFloat) - (Titulo_receber2.FieldByName('DEBITO_TPG').AsFloat+Titulo_receber2.FieldByName('MVC_DEBITO_TPG').AsFloat) ;
                                            // awof - SOMA OS VALORES DOS PAGAMENTOS      - 17/01/09
                                       ATotAbrang[i]:= ATotAbrang[i] + Titulo_receber2.FieldByName('DEBITO_TPG').AsFloat + Titulo_receber2.FieldByName('MVC_DEBITO_TPG').AsFloat;

                end;
                //
                inc(coluna,4);
              end;//final do FOR

              Titulo_receber1.Next;
            end;
            //awof- esse código white valores totais do abrangente 10/12/2008
            //
            //AWOF - SERÁ O VALOR PREVISTO  - REALIZADO 
            if Titulo_receber1.FieldByName('CCX_DC').AsString = 'D' then
            begin
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+4] := ATotOrAbrang[1];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+5] := ATotAbrang[1];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+6] := ATotOrAbrang[1] - ATotAbrang[1];//ATotAbrang[1]  - ATotOrAbrang[1];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+8] := ATotOrAbrang[2];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+9] := ATotAbrang[2];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+10]:= ATotOrAbrang[2] - ATotAbrang[2];//ATotAbrang[2] - ATotOrAbrang[2];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+12] := ATotOrAbrang[3];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+13] := ATotAbrang[3];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+14] := ATotOrAbrang[3] - ATotAbrang[3];//ATotAbrang[3] - ATotOrAbrang[3];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+16] := ATotOrAbrang[4];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+17] := ATotAbrang[4];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+18] := ATotOrAbrang[4] - ATotAbrang[4];//ATotAbrang[4]- ATotOrAbrang[4];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+20] := ATotOrAbrang[5];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+21] := ATotAbrang[5];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+22] := ATotOrAbrang[5] - ATotAbrang[5];//ATotAbrang[5]- ATotOrAbrang[5];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+24] := ATotOrAbrang[6];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+25] := ATotAbrang[6];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+26] := ATotOrAbrang[6] - ATotAbrang[6];//ATotAbrang[6]- ATotOrAbrang[6];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+28] := ATotOrAbrang[7];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+29] := ATotAbrang[7];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+30] := ATotOrAbrang[7] - ATotAbrang[7];//ATotAbrang[7]- ATotOrAbrang[7];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+32] := ATotOrAbrang[8];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+33] := ATotAbrang[8];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+34] := ATotOrAbrang[8] - ATotAbrang[8];//ATotAbrang[8]- ATotOrAbrang[8];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+36] := ATotOrAbrang[9];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+37] := ATotAbrang[9];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+38] := ATotOrAbrang[9] - ATotAbrang[9];//ATotAbrang[9]- ATotOrAbrang[9];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+40] := ATotOrAbrang[10];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+41] := ATotAbrang[10];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+42] := ATotOrAbrang[10] - ATotAbrang[10];//ATotAbrang[10]- ATotOrAbrang[10];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+44] := ATotOrAbrang[11];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+45] := ATotAbrang[11];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+46] := ATotOrAbrang[11] - ATotAbrang[11];//ATotAbrang[11]- ATotOrAbrang[11];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+48] := ATotOrAbrang[12];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+49] := ATotAbrang[12];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+50] := ATotOrAbrang[12] - ATotAbrang[12];//ATotAbrang[12]- ATotOrAbrang[12];
            end;
            //AWOF - SERÁ O VALOR REALIZADO - PREVISTO
            if Titulo_receber1.FieldByName('CCX_DC').AsString = 'C' then
            begin
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+4] := ATotOrAbrang[1];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+5] := ATotAbrang[1];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+6] := ATotAbrang[1]  - ATotOrAbrang[1];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+8] := ATotOrAbrang[2];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+9] := ATotAbrang[2];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+10]:= ATotAbrang[2] - ATotOrAbrang[2];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+12] := ATotOrAbrang[3];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+13] := ATotAbrang[3];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+14] := ATotAbrang[3] - ATotOrAbrang[3];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+16] := ATotOrAbrang[4];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+17] := ATotAbrang[4];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+18] := ATotAbrang[4]- ATotOrAbrang[4];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+20] := ATotOrAbrang[5];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+21] := ATotAbrang[5];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+22] := ATotAbrang[5]- ATotOrAbrang[5];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+24] := ATotOrAbrang[6];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+25] := ATotAbrang[6];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+26] := ATotAbrang[6]- ATotOrAbrang[6];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+28] := ATotOrAbrang[7];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+29] := ATotAbrang[7];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+30] := ATotAbrang[7]- ATotOrAbrang[7];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+32] := ATotOrAbrang[8];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+33] := ATotAbrang[8];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+34] := ATotAbrang[8]- ATotOrAbrang[8];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+36] := ATotOrAbrang[9];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+37] := ATotAbrang[9];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+38] := ATotAbrang[9]- ATotOrAbrang[9];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+40] := ATotOrAbrang[10];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+41] := ATotAbrang[10];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+42] := ATotAbrang[10]- ATotOrAbrang[10];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+44] := ATotOrAbrang[11];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+45] := ATotAbrang[11];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+46] := ATotAbrang[11]- ATotOrAbrang[11];

                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+48] := ATotOrAbrang[12];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+49] := ATotAbrang[12];
                  Excel.WorkBooks[1].Sheets[1].Cells[linhaAbrang,C+50] := ATotAbrang[12]- ATotOrAbrang[12];
            end;//fim  valores total abrangentes


             for i:= 1 to 12 do
             begin
              ATotOrSubG[i]:= ATotOrSubG[i] +  ATotOrAbrang[i];  //awof - incrementa os valores ORÇAMENTOS p/ subGrupo
              ATotSubG[i]:= ATotSubG[i]     +  ATotAbrang[i];    //awof - incrementa os valores ABRANGENTE p/ subGrupo

              ATotAbrang[i]:=0;    //awof - iniciando variavel totalizar ABRANGENTES 17/02/09
              ATotOrAbrang[i]:=0;  //awof - iniciando variavel totalizar ORÇAMENTOS 17/02/09
             end;

            QueryAbrangente.Next;
          end;
           //awof -  esse código white valores totais do subGrupo 10/12/2008
           //AWOF - SE FOR RECEBIMENTO SERÁ O VALOR PREVISTO  - REALIZADO
      //    if Titulo_receber1.FieldByName('CCX_DC').AsString = 'C' then
      //    begin
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+4]:= ATotOrSubG[1];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+5] := ATotSubG[1];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+6] := ATotSubG[1];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+8] := ATotOrSubG[2];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+9] := ATotSubG[2];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+10]:= ATotSubG[2] - ATotOrSubG[2];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+12] := ATotOrSubG[3];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+13] := ATotSubG[3];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+14]:= ATotSubG[3] - ATotOrSubG[3];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+16] := ATotOrSubG[4];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+17] := ATotSubG[4];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+18]:= ATotSubG[4] - ATotOrSubG[4];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+20] := ATotOrSubG[5];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+21] := ATotSubG[5];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+22]:= ATotSubG[5] - ATotOrSubG[5];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+24] := ATotOrSubG[6];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+25] := ATotSubG[6];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+26]:= ATotSubG[6] - ATotOrSubG[6];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+28] := ATotOrSubG[7];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+29] := ATotSubG[7];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+30]:= ATotSubG[7] - ATotOrSubG[7];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+32] := ATotOrSubG[8];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+33] := ATotSubG[8];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+34]:= ATotSubG[8] - ATotOrSubG[8];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+36] := ATotOrSubG[9];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+37] := ATotSubG[9];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+38]:= ATotSubG[9] - ATotOrSubG[9];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+40] := ATotOrSubG[10];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+41] := ATotSubG[10];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+42]:= ATotSubG[10] - ATotOrSubG[10];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+44] := ATotOrSubG[11];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+45] := ATotSubG[11];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+46]:= ATotSubG[11] - ATotOrSubG[11];

            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+48] := ATotOrSubG[12];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+49] := ATotSubG[12];
            Excel.WorkBooks[1].Sheets[1].Cells[linhaSubG,C+50]:= ATotSubG[12] - ATotOrSubG[12];
   //       end;

           for i:= 1 to 12 do
           begin
             ATotOrGrupo[i]:= ATotOrGrupo[i] +  ATotOrSubG[i]; //awof - incrementa os valores ORÇAMENTOS subGrupo p/ GRUPO
             ATotGrupo[i]:= ATotGrupo[i]     +  ATotSubG[i];   //awof - incrementa os valores ABRANGENTE subGrupo p/ GRUPO

             ATotSubG[i]:=0;    //awof - iniciando variavel totalizar subGrupo ABRANGENTES 17/02/09
             ATotOrSubG[i]:=0;  //awof - iniciando variavel totalizar subGrupo ORÇAMENTOS 17/02/09
           end;

          QuerySubGrupo.Next;
        end;
                 //awof -  esse código white valores totais do GRUPO 11/12/2008
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+4]:= ATotOrGrupo[1];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+5] := ATotGrupo[1];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+6] := ATotGrupo[1] - ATotOrGrupo[1];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+8] := ATotOrGrupo[2];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+9] := ATotGrupo[2];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+10]:= ATotGrupo[2] - ATotOrGrupo[2];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+12] := ATotOrGrupo[3];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+13] := ATotGrupo[3];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+14]:= ATotGrupo[3] - ATotOrGrupo[3];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+16] := ATotOrGrupo[4];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+17] := ATotGrupo[4];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+18]:= ATotGrupo[4] - ATotOrGrupo[4];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+20] := ATotOrGrupo[5];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+21] := ATotGrupo[5];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+22]:= ATotGrupo[5] - ATotOrGrupo[5];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+24] := ATotOrGrupo[6];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+25] := ATotGrupo[6];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+26]:= ATotGrupo[6] - ATotOrGrupo[6];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+28] := ATotOrGrupo[7];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+29] := ATotGrupo[7];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+30]:= ATotGrupo[7] - ATotOrGrupo[7];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+32] := ATotOrGrupo[8];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+33] := ATotGrupo[8];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+34]:= ATotGrupo[8] - ATotOrGrupo[8];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+36] := ATotOrGrupo[9];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+37] := ATotGrupo[9];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+38]:= ATotGrupo[9] - ATotOrGrupo[9];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+40] := ATotOrGrupo[10];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+41] := ATotGrupo[10];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+42]:= ATotGrupo[10] - ATotOrGrupo[10];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+44] := ATotOrGrupo[11];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+45] := ATotGrupo[11];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+46]:= ATotGrupo[11] - ATotOrGrupo[11];

           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+48] := ATotOrGrupo[12];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+49] := ATotGrupo[12];
           Excel.WorkBooks[1].Sheets[1].Cells[linhaGrupo,C+50]:=  ATotGrupo[12] - ATotOrGrupo[12];
           //iniciando variavel awof
           for i:= 1 to 12 do
           begin
             ATotGrupo[i]:=0; //awof - iniciando variavel totalizar Grupo ABRANGENTES 17/02/09
             ATotOrGrupo[i]:=0;  //awof - iniciando variavel totalizar Grupo ORÇAMENTOS 17/02/09
           end;

      //  inc(L);     awof- já estava incrementando
        QueryGrupo.Next;     
      end;
      Excel.WorkBooks[1].SaveAs('C:\001.xls');
    end
  end;
end;

procedure TfMxSelGerencial.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelGerencial.ckbCentroDeCustoClick(Sender: TObject);
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

procedure TfMxSelGerencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure TfMxSelGerencial.ckbCodigoCCXClick(Sender: TObject);
begin
  if ckbCodigoCCX.Checked then
  Begin
    Conta_de_Caixa1.Open;
    dblCodigoCCX.Color:=clWindow;
    dblCodigoCCX.Enabled:=True;
    dblCodigoCCX.KeyValue := Conta_de_Caixa1.CodigoCCX;
    dblCodigoCCX.SetFocus;
  end
  else
  Begin
    Conta_de_Caixa1.Close;
    dblCodigoCCX.KeyValue:=-1;
    dblCodigoCCX.Color:=AlteraCorComponentes;
    dblCodigoCCX.Enabled:=False;
  end;
end;

procedure TfMxSelGerencial.ckbGrupoClick(Sender: TObject);
begin
  if ckbGrupo.Checked then
  Begin
    grupo.Open;
    dblGrupoCC.Color:=clWindow;
    dblGrupoCC.Enabled:=True;
    //dblGrupoCC.KeyValue := grupo.CodigoPAR;
    dblGrupoCC.SetFocus;
  end
  else
  Begin
    grupo.Close;
    dblGrupoCC.KeyValue:=-1;
    dblGrupoCC.Color:=AlteraCorComponentes;
    dblGrupoCC.Enabled:=False;
  end;
end;

procedure TfMxSelGerencial.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    cmbTipo.Color:=clWindow;
    cmbTipo.Enabled:=True;
    cmbTipo.ItemIndex:=1;
    cmbTipo.SetFocus;
  end
  else
  Begin
    cmbTipo.Color:=AlteraCorComponentes;
    cmbTipo.ItemIndex:=-1;
    cmbTipo.Enabled:=False;
  end;
end;

procedure TfMxSelGerencial.ckbSubGrupoClick(Sender: TObject);
begin
  if ckbSubGrupo.Checked then
  Begin
    sub_grupo.Close;
    sub_grupo.ParamByName('GCC_CODIGO').Value := dblGrupoCC.KeyValue;
    sub_grupo.Open;
    dblSubGrupoCC.Color:=clWindow;
    dblSubGrupoCC.Enabled:=True;
    //dblSubGrupoCC.KeyValue := sub_grupo.CodigoPAR;
    dblSubGrupoCC.SetFocus;
  end
  else
  Begin
    sub_grupo.Close;
    dblSubGrupoCC.KeyValue:=-1;
    dblSubGrupoCC.Color:=AlteraCorComponentes;
    dblSubGrupoCC.Enabled:=False;
  end;
end;

procedure TfMxSelGerencial.ckbAbrangenteClick(Sender: TObject);
begin
  if ckbAbrangente.Checked then
  Begin
    abrangente.Close;
    abrangente.ParamByName('SCC_CODIGO').Value := dblSubGrupoCC.KeyValue;
    abrangente.Open;

    dblAbrangente.Color:=clWindow;
    dblAbrangente.Enabled:=True;
    //dblAbrangente.KeyValue := abrangente.CodigoPAR;
    dblAbrangente.SetFocus;
  end
  else
  Begin
    abrangente.Close;
    dblAbrangente.KeyValue:=-1;
    dblAbrangente.Color:=AlteraCorComponentes;
    dblAbrangente.Enabled:=False;
  end;
end;

procedure TfMxSelGerencial.ckbAgruparClick(Sender: TObject);
begin
  if ckbAgrupar.Checked then
  Begin
    cbxPeriodo.ItemIndex:=0;
    cbxPeriodo.Color:=clWindow;
    cbxPeriodo.Enabled:=True;

    cbxPeriodoAno.ItemIndex:=0;
    cbxPeriodoAno.Color:=clWindow;
    cbxPeriodoAno.Enabled:=True;


    mskDataINI.Text := '';
    mskDataFIM.Text := '';
    mskDataINI.Enabled := false;
    mskDataFIM.Enabled := false;

    cbxPeriodoAno.SetFocus;
  end
  else
  Begin
    cbxPeriodo.ItemIndex:=-1;
    cbxPeriodo.Color:=AlteraCorComponentes;
    cbxPeriodo.Enabled:=False;
    cbxPeriodoAno.ItemIndex:=-1;
    cbxPeriodoAno.Color:=AlteraCorComponentes;
    cbxPeriodoAno.Enabled:=False;

    mskDataINI.Enabled := true;
    mskDataFIM.Enabled := true;
  end;
end;

procedure TfMxSelGerencial.colorir(cor: TColor; linha: integer);
begin
  //B,D,F,H,I,J,L,M,N,P,Q,R,T,U,V,X,Y,Z,AB,AC,AD,AF,AG,AH,AJ,AK,AL,AN,AO,AP,AR,AS,AT,AV,AW,AX,AZ,BA,BB
  Sheet.Range['B' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['D' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['F' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['H' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['I' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['J' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['L' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['M' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['N' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['P' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['Q' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['R' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['T' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['U' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['V' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['X' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['Y' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['Z' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AB' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AC' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AD' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AF' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AG' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AH' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AJ' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AK' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AL' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AN' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AO' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AP' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AR' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AS' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AT' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AV' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AW' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AX' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['AZ' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['BA' + IntToStr(linha)].Interior.Color := cor;
  Sheet.Range['BB' + IntToStr(linha)].Interior.Color := cor;
end;

procedure TfMxSelGerencial.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
