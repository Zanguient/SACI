unit MxPagarAvulsoCPD1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Menus, Movimento_caixa,
  Conta_de_Caixa, Db, DBTables, SQuery, Parametro,Variants,MMSystem,
  ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, ActnMenus;

type
  TfMxPagarAvulsoCPD1 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dblContaAgendada: TDBLookupComboBox;
    edtDescricao: TEdit;
    edtNumero: TEdit;
    edtValor: TEdit;
    memObservacao: TMemo;
    dblTipoPagamento: TDBLookupComboBox;
    edtSequencia: TEdit;
    Panel2: TPanel;
    edtDataMovimento: TEdit;
    bitConfirmar: TBitBtn;
    bitFechar: TBitBtn;
    bitRecibo: TBitBtn;
    Parametro1: TParametro;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    DSParametro1: TDataSource;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    dblTipoDocumento: TDBLookupComboBox;
    mskCompetencia: TMaskEdit;
    Label1: TLabel;
    dblContaRecebimento: TDBLookupComboBox;
    Label2: TLabel;
    Conta_de_Caixa2: TConta_de_Caixa;
    DSConta_de_Caixa2: TDataSource;
    Label8: TLabel;
    edtCodigoCHQ: TEdit;
    edtChequeCNC: TEdit;
    ActionManager1: TActionManager;
    Action1: TAction;
    Confirmar: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure MenuItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitFecharClick(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblContaAgendadaClick(Sender: TObject);
    procedure dblTipoPagamentoClick(Sender: TObject);
    procedure bitReciboClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Cancelar: Boolean;
  end;

var
  fMxPagarAvulsoCPD1: TfMxPagarAvulsoCPD1;

implementation
Uses
  UDM,funcoes, MxCheque, DateUtils, DigSenha, UReciboPagamento;
{$R *.DFM}

procedure TfMxPagarAvulsoCPD1.MenuItem1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxPagarAvulsoCPD1.FormCreate(Sender: TObject);
begin
  Parametro1.Active:=True;
  Parametro2.Active:=True;
  Conta_de_Caixa1.Close;
  if DM.Configuracao1.Empresa = empLBM then
    Conta_de_Caixa1.SQL.Text := 'SELECT CCX_CODIGO,CCX_DESCRICAO '+
      ' FROM CONTA_DE_CAIXA '+
      ' WHERE CCX_DC="D" '+
      ' AND (CCX_SITUACAO=0 OR CCX_SITUACAO IS NULL) '+
      ' ORDER BY CCX_DESCRICAO ';
  Conta_de_Caixa1.Active:=True;

  Conta_de_Caixa2.Close;
  if DM.Configuracao1.Empresa = empLBM then
    Conta_de_Caixa2.SQL.Text := 'SELECT CCX_CODIGO,CCX_DESCRICAO '+
      ' FROM CONTA_DE_CAIXA '+
      ' WHERE CCX_DC="D" '+
      ' AND (CCX_SITUACAO=0 OR CCX_SITUACAO IS NULL) '+
      ' ORDER BY CCX_DESCRICAO ';
  Conta_de_Caixa2.Active:=True;

  edtChequeCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);
  edtCodigoCHQ.Text := '0';

end;

procedure TfMxPagarAvulsoCPD1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Parametro1.Active:=False;
  Parametro2.Active:=False;
  Conta_de_Caixa1.Active:=False;
  Conta_de_Caixa2.Active:=False;  
  Action:=caFree;
end;

procedure TfMxPagarAvulsoCPD1.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxPagarAvulsoCPD1.bitConfirmarClick(Sender: TObject);
Var
  mensagem:String;
  Trans: Boolean;
  CaixaCNC, CdCNC, CdCCX: integer;
  vLimiteGasto: Double;
begin
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  if (DM.Configuracao1.Empresa = empMotical) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 LOG_DATA_HORA '+
        ' FROM LOG '+
        ' WHERE LOG_DATA_HORA>="'+MesDia(DM.Configuracao1.Data+1)+'" ';
      Open;
      if not IsEmpty then
        Raise exception.Create('Já existe Log com data superior a atual do sistema!');
    end;
  end;

  mensagem := '';
  if not VerificaFloatBranco(edtValor.text) then
    mensagem:='Valor digitado incorretamente!'+#13;
  if dblContaAgendada.Text = '' then
    mensagem:=mensagem+'Conta de caixa faltando!'+#13;
  if dblTipoPagamento.Text = '' then
    mensagem:=mensagem+'Conta de caixa faltando!'+#13;
  if dblTipoDocumento.Text = '' then
    mensagem:=mensagem+'Tipo de documento faltando'+#13;
  if dblTipoPagamento.Text = '' then
    mensagem:=mensagem+'Tipo de pagamento faltando'+#13;
  if not VerificaDataBranco(mskCompetencia.Text) then
    mensagem:=mensagem+'Data de competência inválida!'+#13;
  if Trim(edtDescricao.Text) = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if mensagem<>'' then
    raise Exception.Create(mensagem);

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdCCX := dblContaRecebimento.KeyValue;

  //Verificar o limite de gasto mensal
  With DM.QR_Consultas do
  Begin
    //Limite Específico
    Close;
    SQL.Text := 'SELECT LMG_LIMITE_MENSAL AS LIMITE '+
      ' FROM LIMITE_GASTO '+
      ' WHERE CCX_CODIGO='+IntToStr(CdCCX)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC);
    Open;
    if IsEmpty then
    Begin
      //Limite Genérico
      Close;
      SQL.Text := 'SELECT CCX_LIMITE_GASTO AS LIMITE '+
        ' FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO='+IntToStr(CdCCX);
      Open;
    end;

    vLimiteGasto := FieldByName('LIMITE').asFloat;
    if vLimiteGasto > 0 then
    Begin
      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS TOTAL '+
        ' FROM MOVIMENTO_DE_CAIXA '+
        ' WHERE CCX_CODIGO_REC='+IntToStr(CdCCX)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND (MVC_NAO_CONTABIL=0 OR MVC_NAO_CONTABIL IS NULL) '+
        ' AND DATEPART(YYYY,MVC_DATA)='+IntToStr(YearOf(DM.Configuracao1.Data))+
        ' AND DATEPART(mm,MVC_DATA)='+IntToStr(MonthOf(DM.Configuracao1.Data));
      Open;
      vLimiteGasto := vLimiteGasto - Arredonda(FieldByName('TOTAL').asFloat);

      //Títulos pagos sem movimento
      Close;
      SQL.Text := 'SELECT SUM(TPG_VALOR_PAGO) AS TOTAL '+
        ' FROM TITULO_A_PAGAR '+
        ' WHERE CCX_CODIGO_REC='+IntToStr(CdCCX)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TPG_SITUACAO=1 '+
        ' AND TPG_GEROU_MOVIMENTO=0 '+
        ' AND DATEPART(YYYY,TPG_PAGAMENTO)='+IntToStr(YearOf(DM.Configuracao1.Data))+
        ' AND DATEPART(mm,TPG_PAGAMENTO)='+IntToStr(MonthOf(DM.Configuracao1.Data));
      Open;
      vLimiteGasto := vLimiteGasto - Arredonda(FieldByName('TOTAL').asFloat);
      
      if vLimiteGasto < StrToFloat(edtValor.Text) then
      Begin
        If MessageDlg('Pagamento superior ao limite de gasto mensal!'+#13+
                      ' Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(8420)) < 0) then //Pag. Acima do Limite de Gasto
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=43;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(8420)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para Pag. Acima do Limite de Gasto!');
              end
              else
                DM.Usuario1.GeraLog(8420, DM.Configuracao1.CodigoCNC, CdCCX,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' '+edtDescricao.Text+' R$ '+edtValor.Text);
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end
        else
          DM.Usuario1.GeraLog(8420, DM.Configuracao1.CodigoCNC, CdCCX, edtDescricao.Text+' R$ '+edtValor.Text);
      end;
    end;
  end;

  Trans:=false;
  with DM.Database2 do
  Begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,
          dblContaAgendada.KeyValue,dblContaRecebimento.KeyValue,
          DM.Configuracao1.CodigoCAX,dblTipoPagamento.KeyValue,
          dblTipoDocumento.KeyValue,DM.Movimento_caixa1.CentroDeCusto,
          StrToInt(edtChequeCNC.Text), StrToInt(edtCodigoCHQ.Text),
          edtDescricao.Text,'0' (*Flag*),edtNumero.Text,memObservacao.Text,
          edtSequencia.Text,'D',StrToFloat(edtValor.Text),0(*Desconto*),0(*Juros*),
          0(*CredCli*),StrToFloat(edtValor.Text)(*ValorDoc*),
          DM.Configuracao1.DataHora,StrToDate(mskCompetencia.Text),0(*DtCheque*),
          0(*CdTIT*),0(*CdCNCTit*),'A') then
      Begin
        ShowMessage('Falha ao gerar Movimento de Caixa!');
        Raise exception.Create('');
      end;

      if (dblTipoPagamento.KeyValue = 6) and
         (not DM.Configuracao1.IgnorarCheques) then
      Begin
        //Gerar Movimento de Cheque
        if not DM.Movimento_de_Cheque1.Inserir(DM.Configuracao1.CodigoCNC,
          StrToInt(edtChequeCNC.Text), StrToInt(edtCodigoCHQ.Text), DM.Configuracao1.CodigoCNC,
          DM.Movimento_caixa1.SCodigo, 4060 (*Pag Avulso*), StrToFloat(edtValor.Text)) then
        Begin
          ShowMessage('Falha ao gerar Movimento de Cheque!');
          Raise exception.Create('');
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

      try
        sndPlaySound(PChar(cSomRegistradora),SND_ASYNC);
      except
      end;

      Trans := False;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
          RollBack;
      Exit;
    end;
  end;

  if DM.Configuracao1.Empresa = empLuciano then
    close
  else
  begin
    bitReciboClick(sender);

    mskCompetencia.Text := DateToStr(DM.Configuracao1.Data);
    edtDescricao.Clear;
    edtNumero.Clear;
    edtValor.Clear;
    edtSequencia.Clear;
    edtDataMovimento.Text := FormatDatetime('dd/mm/yyyy hh:nn:ss',DM.Configuracao1.DataHora);
    memObservacao.Clear;
    mskCompetencia.SetFocus;
  end;
end;

procedure TfMxPagarAvulsoCPD1.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  edtDataMovimento.Text := FormatDatetime('dd/mm/yyyy hh:nn:ss',DM.Configuracao1.DataHora);
  mskCompetencia.Text:=DateToStr(DM.Configuracao1.Data);
  dblTipoDocumento.KeyValue := 79;
  dblTipoPagamento.KeyValue := 5;
end;

procedure TfMxPagarAvulsoCPD1.dblContaAgendadaClick(Sender: TObject);
begin
  dblContaRecebimento.KeyValue := dblContaAgendada.KeyValue;
end;

procedure TfMxPagarAvulsoCPD1.dblTipoPagamentoClick(Sender: TObject);
begin
  if (dblTipoPagamento.KeyValue = 6) and
     (not DM.Configuracao1.IgnorarCheques) then
  Begin
    Application.CreateForm(TfMxCheque,fMxCheque);
    fMxCheque.tag:=3;
    fMxCheque.SB_NovoCabClick(sender);
    fMxCheque.edtTituloCNC.Text:= inttostr(DM.Configuracao1.CodigoCNC);
    fMxCheque.edtTitulo.Text := '0';
    fMxCheque.edtValor.Text := edtValor.Text;
    fMxCheque.ShowModal;
  End
  else
  Begin
    edtCodigoCHQ.Enabled := False;
    edtCodigoCHQ.Text := '0';
  end;
end;

procedure TfMxPagarAvulsoCPD1.bitReciboClick(Sender: TObject);
begin
  if not bitRecibo.Enabled then
    Exit;

  Application.CreateForm(Trpt_ReciboPagamento, rpt_ReciboPagamento);
  with rpt_ReciboPagamento do
  Begin
    Tag := 0;
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * '+
      ' FROM MOVIMENTO_DE_CAIXA '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND MVC_CODIGO='+IntToStr(DM.Movimento_caixa1.SCodigo);
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxPagarAvulsoCPD1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;

  if key = #13 then
    bitConfirmarClick(bitConfirmar);
end;

end.
