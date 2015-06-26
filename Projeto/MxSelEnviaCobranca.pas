unit MxSelEnviaCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus, Parametro, Variants;

type
  TfMxSelEnviaCobranca = class(TForm)
    Panel2: TPanel;
    bitConfirma: TBitBtn;
    bitCancelar: TBitBtn;
    Panel3: TPanel;
    edtCodigoCLI: TEdit;
    ckbCodigoCLI: TCheckBox;
    ckbParcelasPagas: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    mskDataINI: TMaskEdit;
    ckbParcelasPagasCobranca: TCheckBox;
    procedure bitCancelarClick(Sender: TObject);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure bitConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbParcelasPagasCobrancaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelEnviaCobranca: TfMxSelEnviaCobranca;

implementation

uses UDM, UPrinc2, MxSPediProd, MxSPediProdMotCal, UReservaExterna, UTitAtrazo,
  MxCobCobrador;

{$R *.dfm}

procedure TfMxSelEnviaCobranca.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelEnviaCobranca.ckbCodigoCLIClick(Sender: TObject);
begin
  if ckbCodigoCLI.Checked then
  Begin
    edtCodigoCLI.Enabled := True;
    edtCodigoCLI.Color   := clWindow;
    edtCodigoCLI.SetFocus;
  end
  else
  Begin
    edtCodigoCLI.Enabled := False;
    edtCodigoCLI.Color   := AlteraCorComponentes;
    edtCodigoCLI.Clear;
  end;
end;

procedure TfMxSelEnviaCobranca.bitConfirmaClick(Sender: TObject);
var
  CPC:Integer;
  vData,vData2,sSituacao,vCliente,vParametroCliente,sUnionHistotico:string;
begin

  CPC := fMxCobCobrador.Entidade.CodigoCPC;
  if DM.Configuracao1.TipoCobranca = 0 then  //DesCentralizado
  begin
    if fMxCobCobrador.Entidade.Situacao = 0 then
      ExecutaSQL(DM.QR_Comandos,'UPDATE COBRANCA_POR_COBRADOR SET '+
        ' CPC_SITUACAO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(fMxCobCobrador.Entidade.CodigoCNC)+
        ' AND CPC_CODIGO='+IntToStr(CPC));
  end;
  
  Application.CreateForm(Trpt_TitAtrazo, rpt_TitAtrazo);
  with rpt_TitAtrazo do
  Begin

    zrbRodapeGrupo.Height := 3;
    ZRLabel2.Caption := 'SIAC - Extrato de Cliente';
    if DM.Configuracao1.Empresa = empLuciano then
    begin
      if fMxCobCobrador.dblCodigoCNC.KeyValue = 4 then
        zrlNomeEmpresa.Caption := 'OTICA MILLA';
    end;

    zrbGrupoCLI.ForceNewPage := True;
    zrlFiltros.Caption := 'Cobrador.: ('+IntToStr(fMxCobCobrador.dblCobrador.KeyValue)+') '+fMxCobCobrador.dblCobrador.Text+'     '+
                          'Cód.Cobrança: '+fMxCobCobrador.edtCodigoCPC.Text+' - '+fMxCobCobrador.edtObservacao.Text;

    Titulo_receber1.Close;
    if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
    Begin

      vData             := '';
      vData2            := '';
      sSituacao         := '';
      vParametroCliente := '';

      (*Data*)
      if VerificaDataBranco(mskDataINI.Text)then
      begin
        vData  := ' AND (T2.ICC_DT_CADASTRO = "'+MesDia(mskDataINI.Text)+'") ';
        vData2 := ' AND (T5.ICC_DT_CADASTRO = "'+MesDia(mskDataINI.Text)+'") ';
      end;

      (*Cliente*)
      if (ckbCodigoCLI.Checked) and (edtCodigoCLI.Text <> '') then
        vParametroCliente := ' AND T3.CLI_CODIGO IN ('+edtCodigoCLI.Text+')';

      (*Situação*)
      if ckbParcelasPagasCobranca.Checked then
        sSituacao := ' AND ' +
                     ' ISNULL((SELECT COUNT(T4.TRC_CODIGO) ' +
                     ' FROM ' +
                     '   TITULO_A_RECEBER T4, ITEM_DE_COBRANCA_COBRADOR T5, CLIENTE T6 ' +
                     ' WHERE ' +
                     '   T4.CNC_CODIGO = ' + IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue) + ' AND ' +
                     '   T5.CPC_CODIGO = ' + fMxCobCobrador.edtCodigoCPC.Text + vData2 +
                     '   AND T4.TRC_CODIGO = T5.TRC_CODIGO AND ' +
                     '   T4.CNC_CODIGO = T5.CNC_TITULO AND ' +
                     '   T4.CLI_CODIGO=T6.CLI_CODIGO AND ' +
                     '   T4.CNC_CLIENTE=T6.CNC_CODIGO ' +
                     '   AND  T1.CLI_CODIGO = T4.CLI_CODIGO ' +
                     '   AND T4.TRC_SITUACAO <> 5 ' +
                     '   GROUP BY T6.CLI_CODIGO),0) ' +
                     ' <> ' +
                     ' ISNULL((SELECT COUNT(T4.TRC_CODIGO) ' +
                     ' FROM ' +
                     '   TITULO_A_RECEBER T4, ITEM_DE_COBRANCA_COBRADOR T5, CLIENTE T6 ' +
                     ' WHERE ' +
                     '   T4.CNC_CODIGO = ' + IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue) + ' AND ' +
                     '   T5.CPC_CODIGO = ' + fMxCobCobrador.edtCodigoCPC.Text + vData2 +
                     '   AND T4.TRC_CODIGO = T5.TRC_CODIGO AND ' +
                     '   T4.CNC_CODIGO = T5.CNC_TITULO AND ' +
                     '   T4.CLI_CODIGO=T6.CLI_CODIGO AND ' +
                     '   T4.CNC_CLIENTE=T6.CNC_CODIGO ' +
                     '   AND  T1.CLI_CODIGO = T4.CLI_CODIGO ' +
                     '   AND T4.TRC_SITUACAO = 2 ' +
                     '   GROUP BY T6.CLI_CODIGO),0) '
      else
        sSituacao:=' AND T1.TRC_SITUACAO <> 2 ';


      if ckbParcelasPagas.Checked then
        sUnionHistotico :=  ' UNION '+
                            ' SELECT T1.*, T3.* FROM TITULO_A_RECEBER T1, CLIENTE T3 '+
                            ' WHERE T1.CNC_CODIGO = ' + IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue) + ' AND '+
                            ' T1.CLI_CODIGO=T3.CLI_CODIGO AND T1.CNC_CLIENTE=T3.CNC_CODIGO '+
                            ' AND T1.TRC_SITUACAO <> 5 '+
                            ' AND T3.CLI_CODIGO IN '+

                            ' (SELECT T3.CLI_CODIGO  FROM    TITULO_A_RECEBER T1, ITEM_DE_COBRANCA_COBRADOR T2, CLIENTE T3 '+
                            ' WHERE    T1.CNC_CODIGO = ' + IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue) + ' AND '+
                            ' T2.CPC_CODIGO = ' + fMxCobCobrador.edtCodigoCPC.Text + vData +
                            ' AND T1.TRC_CODIGO = T2.TRC_CODIGO AND '+
                            ' T1.CNC_CODIGO = T2.CNC_TITULO AND    T1.CLI_CODIGO=T3.CLI_CODIGO AND '+
                            ' T1.CNC_CLIENTE=T3.CNC_CODIGO  '+

                            ' AND EXISTS (SELECT TOP 1 T9.ICC_DT_CADASTRO FROM ITEM_DE_COBRANCA_COBRADOR T9 '+
                            '             INNER JOIN TITULO_A_RECEBER T10 '+
                            '             ON T10.CNC_CODIGO=T9.CNC_TITULO '+
                            '             AND T10.TRC_CODIGO=T9.TRC_CODIGO '+
                            '             WHERE T9.CPC_CODIGO='+fMxCobCobrador.edtCodigoCPC.Text+
                            '             AND T9.ICC_DT_CADASTRO = "'+MesDia(mskDataINI.Text)+'" ' +
                            '             AND T10.CNC_CLIENTE=T3.CNC_CODIGO '+
                            '             AND T10.CLI_CODIGO=T3.CLI_CODIGO) '+
                            ' AND NOT EXISTS (SELECT TOP 1 T9.ICC_DT_CADASTRO FROM ITEM_DE_COBRANCA_COBRADOR T9 '+
                            '             INNER JOIN TITULO_A_RECEBER T10 '+
                            '             ON T10.TRC_SITUACAO=0 '+
                            '             AND T10.CNC_CODIGO=T9.CNC_TITULO '+
                            '             AND T10.TRC_CODIGO=T9.TRC_CODIGO '+

                            '             WHERE T9.ICC_DT_CADASTRO < "'+MesDia(mskDataINI.Text) +'"'+
                            '             AND T10.CNC_CLIENTE=T3.CNC_CODIGO '+
                            '             AND T10.CLI_CODIGO=T3.CLI_CODIGO) '+                            
                            
                            sSituacao +

                            {' AND ISNULL((SELECT COUNT(T4.TRC_CODIGO)  FROM    TITULO_A_RECEBER T4, ITEM_DE_COBRANCA_COBRADOR T5, CLIENTE T6 '+
                            ' WHERE    T4.CNC_CODIGO = ' + IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue) + ' AND '+
                            ' T5.CPC_CODIGO = ' + fMxCobCobrador.edtCodigoCPC.Text + vData2 +
                            ' AND T4.TRC_CODIGO = T5.TRC_CODIGO AND '+
                            ' T4.CNC_CODIGO = T5.CNC_TITULO AND    T4.CLI_CODIGO=T6.CLI_CODIGO AND '+
                            ' T4.CNC_CLIENTE=T6.CNC_CODIGO    AND  T1.CLI_CODIGO = T4.CLI_CODIGO    AND '+
                            ' T4.TRC_SITUACAO <> 5    GROUP BY T6.CLI_CODIGO),0)  '+
                            ' <> '+
                            ' ISNULL((SELECT COUNT(T4.TRC_CODIGO)  FROM    TITULO_A_RECEBER T4, ITEM_DE_COBRANCA_COBRADOR T5, CLIENTE T6 '+
                            ' WHERE T4.CNC_CODIGO = ' + IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue) + ' AND '+
                            ' T5.CPC_CODIGO = ' + fMxCobCobrador.edtCodigoCPC.Text + vData2 +
                            ' AND T4.TRC_CODIGO = T5.TRC_CODIGO AND '+
                            ' T4.CNC_CODIGO = T5.CNC_TITULO AND    T4.CLI_CODIGO=T6.CLI_CODIGO AND '+
                            ' T4.CNC_CLIENTE=T6.CNC_CODIGO    AND  T1.CLI_CODIGO = T4.CLI_CODIGO    AND '+
                            ' T4.TRC_SITUACAO = 2    GROUP BY T6.CLI_CODIGO),0) '+}

                            vParametroCliente +
                            ' )'
      else
        sUnionHistotico :='';

      Titulo_receber1.SQL.Text:=' SELECT T1.*, T3.* ' +
                                ' FROM ' +
                                '   TITULO_A_RECEBER T1, ITEM_DE_COBRANCA_COBRADOR T2, CLIENTE T3 ' +
                                ' WHERE ' +
                                '   T1.CNC_CODIGO = ' + IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue) + ' AND ' +
                                '   T2.CPC_CODIGO = ' + fMxCobCobrador.edtCodigoCPC.Text + ' AND ' +
                                '   T1.TRC_CODIGO = T2.TRC_CODIGO AND ' +
                                '   T1.CNC_CODIGO = T2.CNC_TITULO AND ' +
                                '   T1.CLI_CODIGO=T3.CLI_CODIGO AND ' +
                                '   T1.CNC_CLIENTE=T3.CNC_CODIGO ' + sSituacao + vParametroCliente + vData +
                                sUnionHistotico +
                                ' ORDER BY T1.CNC_CODIGO, T3.CLI_RZ_SOCIAL, T1.PDV_CODIGO, T1.TRC_VENCIMENTO';

//SHOWMESSAGE(Titulo_receber1.SQL.GetText);

    end
    else
    begin
      vParametroCliente:='';
      vCliente := InputBox('Cliente', 'Código do cliente:','');
      if vCliente<>'' then
        vParametroCliente:= ' AND T2.CLI_CODIGO IN ('+vCliente+')'
      else
        vParametroCliente:='';
      //OU
      if vParametroCliente = '' then
      begin
        vCliente := InputBox('Tipo', 'Descrição do tipo:','');
        if vCliente<>'' then
          vParametroCliente:= ' AND T2.CLI_TIPO IN (SELECT TP.PAR_CODIGO FROM PARAMETRO TP '+
                       ' WHERE TP.PAR_CODIGO = T2.CLI_TIPO AND '+
                       ' TP.PAR_DESCRICAO = '''+vCliente+''') '
        else
          vParametroCliente:='';
      end;

      Titulo_receber1.SQL.Text:='SELECT T1.*, T2.* '+
        ' FROM TITULO_A_RECEBER T1, CLIENTE T2 '+
        ' WHERE T1.CNC_CODIGO='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+
        vParametroCliente+
        ' AND T1.TRC_SITUACAO IN (0,1,8,9,2) ' +
        ' AND T1.CLI_CODIGO IN (SELECT T0.CLI_CODIGO FROM TITULO_A_RECEBER T0 '+
        '                       WHERE (T0.TRC_SITUACAO<=2 OR T0.TRC_SITUACAO=8 OR T0.TRC_SITUACAO=9) '+
        '                       AND T0.CPC_CODIGO='+fMxCobCobrador.edtCodigoCPC.Text+
        '                       AND T0.CLI_CODIGO=T1.CLI_CODIGO '+
        '                       AND T0.CNC_CODIGO=T1.CNC_CODIGO) '+
        ' AND T1.CLI_CODIGO=T2.CLI_CODIGO '+
        ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
        //Observar
        ' AND T1.TRC_CODIGO IN (SELECT TRC_CODIGO FROM TITULO_A_RECEBER TR '+
        ' WHERE (SELECT COUNT(*) FROM TITULO_A_RECEBER TR2 WHERE TR2.PDV_CODIGO=TR.PDV_CODIGO '+

        ' AND TR2.TRC_SITUACAO IN (0,1,8,9,2) '+

        ' AND TR2.CLI_CODIGO = T2.CLI_CODIGO AND TR2.CNC_CLIENTE = T2.CNC_CODIGO) > 0 '+
        ' AND TR.CLI_CODIGO = T2.CLI_CODIGO '+
        ' AND TR.CNC_CLIENTE = T2.CNC_CODIGO) '+
        ' ORDER BY T2.CLI_TIPO, T1.CNC_CODIGO, T1.CLI_CODIGO,T1.PDV_CODIGO,T1.TRC_VENCIMENTO ';
    end;
    Titulo_receber1.Open;
    if Titulo_receber1.IsEmpty then
    Begin
      if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
        Raise Exception.Create('Consulta Vazia!'+#13+'Nenhuma Cobrança foi Adicionada nesta Data!')
      else
        Raise Exception.Create('Consulta Vazia!');
    end;
    report.Preview;
  end;
end;

procedure TfMxSelEnviaCobranca.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
end;

procedure TfMxSelEnviaCobranca.ckbParcelasPagasCobrancaClick(
  Sender: TObject);
begin
  if ckbParcelasPagasCobranca.Checked then
  begin
    ckbParcelasPagas.Enabled := true;
    //ckbParcelasPagas.Checked := true;
  end
  else
  begin
    ckbParcelasPagas.Enabled := false;
    ckbParcelasPagas.Checked := false;
  end;
end;

end.
