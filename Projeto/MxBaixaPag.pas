unit MxBaixaPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Titulo_a_pagar, Pedido_de_Compra,
  Forma_de_Pagamento, Parametro, Menus, Conta_de_Caixa, Movimento_caixa,
  Transportadora, Fornecedor, CentroCusto, ActnList, XPStyleActnCtrls,
  ActnMan, ToolWin, ActnCtrls, ActnMenus;

type
  TfMxBaixaPag = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNumero: TEdit;
    edtSequencia: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    mskVencimento: TMaskEdit;
    memOBS: TMemo;
    Label10: TLabel;
    Label12: TLabel;
    Titulo_a_pagar1: TTitulo_a_pagar;
    DSTitulo_a_pagar1: TDataSource;
    Panel1: TPanel;
    SB_Loc: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_Reabrir: TBitBtn;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Panel3: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    mskDtPagamento: TMaskEdit;
    edtValorTitulo: TEdit;
    edtVlrPago: TEdit;
    Label22: TLabel;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    dblTipoPagamento: TDBLookupComboBox;
    Label7: TLabel;
    dblContaAgendada: TDBLookupComboBox;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    dblTipoDocumento: TDBLookupComboBox;
    Parametro1PAR_CODIGO: TIntegerField;
    Parametro1TPR_CODIGO: TIntegerField;
    Parametro1CNC_CODIGO: TIntegerField;
    Parametro1PAR_DESCRICAO: TStringField;
    Titulo_a_pagar1CNC_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_CODIGO: TIntegerField;
    Titulo_a_pagar1PCP_CODIGO: TIntegerField;
    Titulo_a_pagar1FOR_CODIGO: TIntegerField;
    Titulo_a_pagar1CCX_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_NUMERO: TStringField;
    Titulo_a_pagar1BNF_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_SEQUENCIA: TStringField;
    Titulo_a_pagar1TPG_VENCIMENTO: TDateTimeField;
    Titulo_a_pagar1TPG_VALOR: TFloatField;
    Titulo_a_pagar1TPG_TIPO_PERIODO: TIntegerField;
    Titulo_a_pagar1TPG_PAGAMENTO: TDateTimeField;
    Titulo_a_pagar1TPG_VALOR_PAGO: TFloatField;
    Titulo_a_pagar1TPG_FORMA_PGTO: TStringField;
    Titulo_a_pagar1TPG_SITUACAO: TIntegerField;
    Titulo_a_pagar1TPG_CUSTODIA: TStringField;
    Titulo_a_pagar1TPG_TIPO_DOC: TIntegerField;
    Titulo_a_pagar1TPG_TIPO_PAG: TIntegerField;
    Titulo_a_pagar1TRN_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_OBSERVACAO: TStringField;
    Titulo_a_pagar1USU_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_DT_ALTERADO: TDateTimeField;
    Parametro2: TParametro;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    DSParametro2: TDataSource;
    edtFornecedor: TEdit;
    edtTransportadora: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Fornecedor1: TFornecedor;
    Transportadora1: TTransportadora;
    Titulo_a_pagar1CCX_CODIGO_REC: TIntegerField;
    Titulo_a_pagar1TPG_GEROU_MOVIMENTO: TSmallintField;
    Label9: TLabel;
    edtCheque: TEdit;
    dblContaRecebimento: TDBLookupComboBox;
    ckbMovimento: TCheckBox;
    Conta_de_Caixa2: TConta_de_Caixa;
    DSConta_de_Caixa2: TDataSource;
    Label11: TLabel;
    Titulo_a_pagar1CHQ_CODIGO: TStringField;
    Titulo_a_pagar1Centro: TStringField;
    CentroCusto2: TCentroCusto;
    Titulo_a_pagar1TPG_DT_CADASTRO: TDateTimeField;
    Titulo_a_pagar1TPG_DESCONTO: TFloatField;
    Titulo_a_pagar1TPG_JUROS: TFloatField;
    Titulo_a_pagar1CNC_ORIGEM: TIntegerField;
    Titulo_a_pagar1TPG_TITULOANT: TIntegerField;
    Titulo_a_pagar1TPG_TPGORIGINAL: TIntegerField;
    Titulo_a_pagar1TPG_DTORIGINAL: TDateTimeField;
    Titulo_a_pagar1TPG_DT_COMPETENCIA: TDateTimeField;
    Titulo_a_pagar1TPG_AGENCIA_CONTA: TStringField;
    Titulo_a_pagar1CNC_CHEQUE: TIntegerField;
    Titulo_a_pagar1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_a_pagar1MCC_CODIGO: TIntegerField;
    Titulo_a_pagar1FPE_CODIGO: TIntegerField;
    ActionManager1: TActionManager;
    ReabrirCab: TAction;
    LocalizarCab: TAction;
    Action7: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_ReabrirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Titulo_a_pagar1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Titulo_a_pagar1CalcFields(DataSet: TDataSet);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure Action7Execute(Sender: TObject);
  private
    { Private declarations }
  public
    Cancelar : Boolean;
    Entidade:TTitulo_a_pagar;
  end;

var
  fMxBaixaPag: TfMxBaixaPag;

implementation
Uses UDM, MxPagar,funcoes, DigSenha;
{$R *.DFM}



procedure TfMxBaixaPag.SB_PrimClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxBaixaPag.SB_AntClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.Prior;
    If Entidade.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxBaixaPag.SB_ProxClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Next;
    If Entidade.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxBaixaPag.SB_UltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxBaixaPag.SB_ReabrirClick(Sender: TObject);
var
  CaixaCNC, CdCNC, CdTPG, CdCHQCNC, CdCHQ, iTipoMovCHQ : integer;
  trans:boolean;
  vValorCHQ: Double; //Para testar se é para liberar o Cheque
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Título!');
  if (Entidade.CNCOrigem<>DM.Usuario1.CentroDeCusto) and
     (DM.Configuracao1.Empresa <> empLBM) then
    raise Exception.Create('Centro de Origem do título diferente do atual!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3940)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=36;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(3940)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para Reabrir Títulos!');
        end;
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  CdCNC := Entidade.CodigoCNC;
  CdTPG := Entidade.CodigoTPG;
  try
    CdCHQ := StrToInt(Entidade.CodigoCHQ);
  except
    CdCHQ := 0;
  end;
  CdCHQCNC := Entidade.ChequeCNC;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if Entidade.TipoPag = 6 then //Cheque
      Begin
        //Mudar a Situacao do Cheque
        vValorCHQ := Arredonda(CalculaSaldoCheque(DM.QR_Consultas, CdCHQCNC, CdCHQ) + Entidade.ValorPago);
        ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
          ' CHQ_UTILIZADO=0 '+
          ' WHERE CHQ_UTILIZADO=1 '+
          ' AND CHQ_CODIGO='+IntToStr(CdCHQ)+
          ' AND CNC_CODIGO='+IntToStr(CdCHQCNC)+
          ' AND ROUND(CHQ_VALOR,1)='+VirgPonto(vValorCHQ));
      end;
      iTipoMovCHQ := 4080; //Extorno de Pagamento

      //Gerar movimento de extorno do título
      if Entidade.GerouMovimento then
      Begin
        with Entidade do
        Begin
          DM.Caixa1.Close;
          DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
          DM.Caixa1.Open;
          if TipoPag = 6 then //Cheque
          Begin
            If MessageDlg('Atenção!!!'+#13+'É um Cheque Devolvido?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            Begin
              {
              with DM.QR_Consultas do
              Begin
                Close;
                SQL.Text := 'SELECT MCH_CODIGO '+
                  ' FROM MOVIMENTO_DE_CHEQUE '+
                  ' WHERE CNC_CHEQUE='+IntToStr(CdCHQCNC)+
                  ' AND CHQ_CODIGO='+IntToStr(CdCHQ)+
                  ' AND MCH_TIPO=1110 '; //Devolvido 1a Vez
                Open;
                if IsEmpty then
                  iTipoMovCHQ := 1110 //Devolvido 1a vez
                else
                  iTipoMovCHQ := 1120; //Devolvido 2a vez
              end;
              }

              if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,CodigoCCX,
                   CodigoCCXRecebimento,DM.Configuracao1.CodigoCAX,
                   TipoPag,TipoDoc,CodigoCNC,Entidade.ChequeCNC, StrToInt(Entidade.CodigoCHQ),
                   'Ext. TPG '+IntToStr(Entidade.CodigoTPG)+' CH '+format('%.2f',[ValorPago]),
                   '0',Numero,OBS,Sequencia,'C',0,
                   Entidade.Desconto(*Desconto*),Entidade.Juros(*Juros*),
                   0(*CredCli*),Entidade.Valor(*ValorDoc*),
                   DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                   0(*DtCheque*),CodigoTPG,CodigoCNC,'T') then
              Begin
                ShowMessage('Falha ao Gerar Mov. de Caixa!');
                Raise exception.Create('');
              end;
            end
            else
            Begin
              if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,CodigoCCX,
                   CodigoCCXRecebimento,DM.Configuracao1.CodigoCAX,
                   TipoPag,TipoDoc,CodigoCNC,Entidade.ChequeCNC, StrToInt(Entidade.CodigoCHQ),
                   'Ext. TPG '+IntToStr(Entidade.CodigoTPG),'0',
                   Numero,OBS,Sequencia,'C',ValorPago,
                   Entidade.Desconto(*Desconto*),Entidade.Juros(*Juros*),
                   0(*CredCli*),Entidade.Valor(*ValorDoc*),
                   DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                   0(*DtCheque*),CodigoTPG,CodigoCNC,'T') then
              Begin
                ShowMessage('Falha ao Gerar Mov. de Caixa!');
                Raise exception.Create('');
              end;
              if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
              Begin
                if not DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Movimento de Caixa',
                  'Reabertura do TPG: '+IntToStr(Entidade.CodigoTPG)+#13+#10+
                  'Valor: R$ '+format('%.2f',[ValorPago])+' (Cheque)') then
                Begin
                  ShowMessage('Falha ao Gerar Mensagem!');
                  Raise exception.Create('');
                end;
              end;
            end;
          end
          else //Não foi Cheque
          Begin
            if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,CodigoCCX,
                 CodigoCCXRecebimento,DM.Configuracao1.CodigoCAX,
                 TipoPag,TipoDoc,CodigoCNC,Entidade.ChequeCNC,StrToInt(Entidade.CodigoCHQ),
                 'Ext. TPG '+IntToStr(Entidade.CodigoTPG),'0',
                 Numero,OBS,Sequencia,'C',ValorPago,
                 Entidade.Desconto(*Desconto*),Entidade.Juros(*Juros*),
                 0(*CredCli*),Entidade.Valor(*ValorDoc*),
                 DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                 0(*DtCheque*),CodigoTPG,CodigoCNC,'T') then
            Begin
              ShowMessage('Falha ao Gerar Mov. de Caixa!');
              Raise exception.Create('');
            end;
            if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
              if not DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Movimento de Caixa',
                'Reabertura do TPG: '+IntToStr(Entidade.CodigoTPG)+#13+#10+
                'Valor: R$ '+format('%.2f',[ValorPago])+' ('+dblTipoPagamento.Text+')') then
              Begin
                ShowMessage('Falha ao Gerar Mensagem!');
                Exit;
              end;
          end;
        End;
      end;
      if Entidade.TipoPag = 6 then //Cheque
        //Gerar Movimento de Cheque
        if not DM.Movimento_de_Cheque1.Inserir(CdCNC, CdCHQCNC, CdCHQ, CdCNC,
          CdTPG, iTipoMovCHQ, Entidade.ValorPago) then
        Begin
          ShowMessage('Falha ao gerar Movimento de Cheque!');
          Raise exception.Create('');
        end;

      Entidade.ReabreTitulo; //Gera LOG no ReabreTitulo

      If DM.Configuracao1.ControleTransacao then
         Commit;

      Entidade.Close;
      Entidade.Open;
      Entidade.CarregaDados;
      ShowMessage('Título Reaberto!');
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
          RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
    end;
  End;
end;

procedure TfMxBaixaPag.FormCreate(Sender: TObject);
begin
  Entidade:=Titulo_a_pagar1;
  Entidade.Active:=true;
  Parametro1.Active:=True;
  Parametro2.Active:=True;
  Conta_de_Caixa1.Active:=True;
  Conta_de_Caixa2.Active:=True;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_BAIXA_PAG_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxBaixaPag.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfMxBaixaPag.SB_LocClick(Sender: TObject);
var
  mensagem, sCodigoFOR:string;
begin
  mensagem :='';
  If (ComboBox2.ItemIndex=0) and (Edit11.Text<>'*') then
    if not VerificaInteiroBranco(Edit11.Text) then
      mensagem:= mensagem+'Código a ser localizado inválido!'+#13;
  If (ComboBox2.ItemIndex=1) and (Edit11.Text<>'*') then
    if not VerificaInteiroBranco(Edit11.Text) then
      mensagem:= mensagem+'Código do pedido a ser localizado inválido!'+#13;
  If (ComboBox2.ItemIndex=2) and (Edit11.Text<>'*') then
    if not VerificaInteiroBranco(Edit11.Text) then
      mensagem:= mensagem+'Código do fornecedor a ser localizado inválido!';
  If (ComboBox2.ItemIndex=4) and (Edit11.Text<>'*') then
    if not VerificaInteiroBranco(Edit11.Text) then
      mensagem:= mensagem+'Código do transportadora a ser localizado inválido!';
  if mensagem<>'' then
    raise exception.Create(mensagem);
  if (ComboBox2.ItemIndex = 3) then //Nome do Fornecedor
  Begin
    sCodigoFOR := '';
    Entidade.Close;
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FOR_CODIGO FROM FORNECEDOR '+
        ' WHERE FOR_RZ_SOCIAL LIKE "%'+Edit11.Text+'%" '+
        ' AND FOR_CODIGO IN (SELECT FOR_CODIGO FROM TITULO_A_PAGAR '+
        ' WHERE TPG_SITUACAO=1) ';
      Open;
      while not Eof do
      Begin
        if sCodigoFOR = '' then
          sCodigoFOR := ' FOR_CODIGO='+FieldByName('FOR_CODIGO').asString
        else
          sCodigoFOR := sCodigoFOR + ' OR FOR_CODIGO=' + FieldByName('FOR_CODIGO').asString;
        Next;
      end;
      if not IsEmpty then
      Begin
        Entidade.Close;
        Entidade.SQL.Text:='SELECT * FROM TITULO_A_PAGAR '+
          ' WHERE TPG_SITUACAO=1 AND ('+sCodigoFOR+') '+
          ' ORDER BY TPG_CODIGO ';
        Entidade.Open;
      end;
    end;
  end
  else
   Entidade.Selecionar;
  if Entidade.IsEmpty then
  Begin
    edtFornecedor.Clear;
    edtValorTitulo.Clear;
    Entidade.CarregaDados;
  end;
end;

procedure TfMxBaixaPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_BAIXA_PAG_');
  except
  end;
  Entidade.Active:=False;
  Parametro1.Active:=False;
  Parametro2.Active:=False;
  Conta_de_Caixa1.Active:=False;
  Conta_de_Caixa2.Active:=False;
  Transportadora1.Close;
  Fornecedor1.Close;
  Action:=Cafree;
end;

procedure TfMxBaixaPag.Titulo_a_pagar1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  if Entidade.CodigoFOR > 0 then
  Begin
    if Fornecedor1.CodigoFOR <> Entidade.CodigoFOR then
    Begin
      Fornecedor1.Close;
      Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=Entidade.CodigoFOR;
      Fornecedor1.Open;
    end;
    edtFornecedor.Text:=Fornecedor1.RazaoSocial;
    edtTransportadora.Clear;
  end
  else if Entidade.CodigoTRN > 0 then
  Begin
    if Transportadora1.CodigoTRN <> Entidade.CodigoTRN then
    Begin
      Transportadora1.Close;
      Transportadora1.ParamByName('TRN_CODIGO').asInteger:=Entidade.CodigoTRN;
      Transportadora1.Open;
    end;
    edtTransportadora.Text:=Transportadora1.RazaoSocial;
    edtFornecedor.Clear;
  end
  else
  Begin
    edtFornecedor.Clear;
    edtTransportadora.Clear;
  end;
  edtCheque.Text := Titulo_a_pagar1.CodigoCHQ;
end;

procedure TfMxBaixaPag.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ComboBox2.ItemIndex:=1;
  Edit11.SetFocus;
end;

procedure TfMxBaixaPag.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(27) then
  Begin
    key:=chr(0);
    Close;
  end;
end;

procedure TfMxBaixaPag.Titulo_a_pagar1CalcFields(DataSet: TDataSet);
begin
  //Definir Centro de Custo
  with CentroCusto2 do
  Begin
    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      if Active = False then
        Open;
      if (Entidade.CodigoCNC > 0) then
      Begin
        if (Entidade.CodigoCNC <> COdigoCNC) then
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
          Open;
        end;
        Entidade.FieldByName('Centro').asString := RazaoSocial;
      end
      else
        Entidade.FieldByName('Centro').asString := '';
    end
    else //LBM
    Begin
      if Entidade.CodigoCNC <= 0 then
        Entidade.FieldByName('Centro').asString := 'ERRO'
      else if Entidade.CodigoCNC = 1 then
        Entidade.FieldByName('Centro').asString := 'Matriz'
      else
        Entidade.FieldByName('Centro').asString := 'Filial'+IntToStr(Entidade.CodigoCNC);
    end;
  end;
end;

procedure TfMxBaixaPag.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxBaixaPag.Action7Execute(Sender: TObject);
begin
  Close;
end;

end.
