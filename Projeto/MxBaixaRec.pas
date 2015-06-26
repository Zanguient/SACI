unit MxBaixaRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Pedido_de_Venda, Forma_de_Pagamento, Titulo_receber,
  Parametro, Menus, Conta_de_Caixa, Movimento_caixa, CentroCusto, Cheque,
  AgenteFin, Usuario, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfMxBaixaRec = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNumero: TEdit;
    edtSequencia: TEdit;
    Label3: TLabel;
    edtPedido: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    mskVencimento: TMaskEdit;
    dblTipoPagamento: TDBLookupComboBox;
    Label10: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    SB_Loc: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    edtOBS: TMemo;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtVlrTitulo: TEdit;
    edtVlrPago: TEdit;
    Label18: TLabel;
    SB_Reabre: TBitBtn;
    Titulo_receber1: TTitulo_receber;
    DSTitulo_receber1: TDataSource;
    edtDtPagamento: TEdit;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Label7: TLabel;
    dblContaAgendada: TDBLookupComboBox;
    dblTipoDoc: TDBLookupComboBox;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    Movimento_caixa1: TMovimento_caixa;
    Titulo_receber1TRC_CODIGO: TIntegerField;
    Titulo_receber1CNC_CODIGO: TIntegerField;
    Titulo_receber1PDV_CODIGO: TIntegerField;
    Titulo_receber1AGF_CODIGO: TIntegerField;
    Titulo_receber1CCX_CODIGO: TIntegerField;
    Titulo_receber1TRC_NUMERO: TStringField;
    Titulo_receber1TRC_SEQUENCIA: TStringField;
    Titulo_receber1CLI_CODIGO: TIntegerField;
    Titulo_receber1TRC_VENCIMENTO: TDateTimeField;
    Titulo_receber1TRC_VALOR: TFloatField;
    Titulo_receber1TRC_PAGAMENTO: TDateTimeField;
    Titulo_receber1TRC_VALOR_PAGO: TFloatField;
    Titulo_receber1TRC_SITUACAO: TIntegerField;
    Titulo_receber1TRC_CUSTODIA: TStringField;
    Titulo_receber1TRC_TIPO_DOC: TIntegerField;
    Titulo_receber1TRC_CRED_CLI: TFloatField;
    Titulo_receber1TRC_TIPO_PAG: TIntegerField;
    Titulo_receber2: TTitulo_receber;
    Titulo_receber1TipoPag: TStringField;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    Titulo_receber1Cliente: TStringField;
    Cliente1: TCliente;
    Titulo_receber1CPC_CODIGO: TIntegerField;
    edtCliente: TEdit;
    Label5: TLabel;
    Titulo_receber1CNC_CLIENTE: TIntegerField;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber1USU_CODIGO: TIntegerField;
    Titulo_receber1TRC_DT_ALTERADO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_INICIO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_SITUACAO: TDateTimeField;
    Titulo_receber1TRC_RGB_SITUACAO: TIntegerField;
    Titulo_receber1TRC_RGB_VISITADO: TSmallintField;
    Titulo_receber1TRC_RGB_DT_PROMESSA: TDateTimeField;
    Titulo_receber1TRC_PROCESSO: TIntegerField;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    dblContaRecebimento: TDBLookupComboBox;
    Label9: TLabel;
    Conta_de_Caixa2: TConta_de_Caixa;
    DSConta_de_Caixa2: TDataSource;
    ckbMovimento: TCheckBox;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    Titulo_receber1Centro: TStringField;
    CentroCusto2: TCentroCusto;
    Cheque1: TCheque;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
    SB_Recibo: TBitBtn;
    Label11: TLabel;
    edtJuros: TEdit;
    Label17: TLabel;
    edtDesconto: TEdit;
    Label21: TLabel;
    edtCreditoCli: TEdit;
    Label22: TLabel;
    dblCodigoAGF: TDBLookupComboBox;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    Titulo_receber1CNC_ORIGEM: TIntegerField;
    Titulo_receber1TRC_PEDIDO_SERVICO: TIntegerField;
    Titulo_receber1TRC_TIPO_PEDIDO: TIntegerField;
    Titulo_receber1TRC_DT_EMISSAO_BOLETO: TDateTimeField;
    Titulo_receber1TRC_DT_RECEBIMENTO_BOLETO: TDateTimeField;
    Titulo_receber1FPE_CODIGO: TIntegerField;
    Titulo_receber1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Titulo_receber1TRC_DT_COMPETENCIA: TDateTimeField;
    Titulo_receber1TRC_EQUIFAX: TIntegerField;
    Titulo_receber1TRC_DT_EQUIFAX: TDateTimeField;
    Titulo_receber1TRC_AGENCIA_NUMERO: TStringField;
    Titulo_receber1TRC_DT_CHEQUE: TDateTimeField;
    Titulo_receber1TRC_SIT_CHEQUE: TIntegerField;
    Titulo_receber1TRC_REABERTURA: TIntegerField;
    Titulo_receber1TRC_VERIFICADO: TIntegerField;
    Titulo_receber1TRC_DT_VERIFICADO: TDateTimeField;
    Titulo_receber1CHQ_CODIGO: TIntegerField;
    Titulo_receber1CNC_CHEQUE: TIntegerField;
    Label23: TLabel;
    edtDadosCheque: TEdit;
    Titulo_receber1TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CV: TStringField;
    Titulo_receber1TRC_LOCAL: TStringField;
    Label24: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    Label25: TLabel;
    edtUsuario: TEdit;
    Label26: TLabel;
    edtLocal: TEdit;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    ActionManager1: TActionManager;
    ReabrirCab: TAction;
    LocalizarCab: TAction;
    Action7: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_ReabreClick(Sender: TObject);
    procedure Titulo_receber1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SB_ReciboClick(Sender: TObject);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure Action7Execute(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade:TTitulo_receber;
    cancelar:boolean;    
  end;

var
  fMxBaixaRec: TfMxBaixaRec;

implementation
Uses UDM, MxSRecPedido,funcoes, DigSenha, URecibo, UReciboLBM;
{$R *.DFM}



procedure TfMxBaixaRec.SB_PrimClick(Sender: TObject);
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

procedure TfMxBaixaRec.SB_AntClick(Sender: TObject);
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

procedure TfMxBaixaRec.SB_ProxClick(Sender: TObject);
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

procedure TfMxBaixaRec.SB_UltClick(Sender: TObject);
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

procedure TfMxBaixaRec.FormCreate(Sender: TObject);
begin
  Entidade:=Titulo_receber1;
  Parametro1.Open;
  Parametro2.Open;
  AgenteFin1.Open;
  Conta_de_Caixa1.Open;
  Conta_de_Caixa2.Open;
  Entidade.Active:=true;
  if not Entidade.IsEmpty then
    SB_Recibo.Enabled:=True;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_BAIXA_REC_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxBaixaRec.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfMxBaixaRec.SB_LocClick(Sender: TObject);
var
  mensagem:string;
begin
  mensagem :='';
  If (ComboBox2.ItemIndex=0) and (Edit11.Text<>'*') then
    if not VerificaInteiroBranco(Edit11.Text) then
      mensagem:= mensagem+'Código a ser localizado inválido!'+#13;
  If (ComboBox2.ItemIndex=1) and (Edit11.Text<>'*') then
    if not VerificaInteiroBranco(Edit11.Text) then
      mensagem:= mensagem+'Código do pedido a ser localizado inválido!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  Entidade.Selecao.Text := ' AND TRC_SITUACAO=2 ';
  Entidade.Selecionar;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtCliente.Clear;
    edtDadosCheque.Clear;
    edtLocal.Clear;
  end;
end;


procedure TfMxBaixaRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_BAIXA_REC_');
  except
  end;
  Entidade.Active:=False;
  Parametro1.Active:=False;
  Parametro2.Active:=False;
  Conta_de_Caixa1.Active:=False;
  Conta_de_Caixa2.Active:=False;
  Action:=Cafree;
end;

procedure TfMxBaixaRec.SB_ReabreClick(Sender: TObject);
var
  CaixaCNC, CdCLICNC,CdCLI, CdPDV, iTipoMovCHQ, CdCHQCNC, CdCHQ, CdCNC, CdTRC, vUsuAut: integer;
  trans, vAberturaParcial:boolean;
  vValorCHQ: Double; //Para testar se é para liberar o Cheque
  sCentro: string;
begin
  if Titulo_receber1.IsEmpty then
    Raise Exception.Create('Selecione o Título!');
  if (DM.Usuario1.CentroDeCusto <> Entidade.CNCOrigem) then
    Raise exception.Create('Centro de Origem do título diferente do atual!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) and
     (DM.Configuracao1.Empresa <> empLBM) and
     ((DM.Configuracao1.Empresa <> empMotical) or (Entidade.GerouMovimento)) then
    raise Exception.Create('Você não pode alterar Títulos neste centro de custo.')
  else if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) and
     (DM.Configuracao1.Empresa = empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD.');
  if (DM.Configuracao1.Empresa = empMotical) and
     (not DM.Configuracao1.CPD) and
     ((Entidade.TipoPag=13) or
      (Entidade.TipoPag=412)) then //Cartão ou Boleto
    Raise exception.Create('Não é permitido alterar Cartão ou Boleto!');

  if MessageDlg('Deseja Reabrir o Título?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRC_ORIGINAL ON TITULO_A_RECEBER (TRC_SITUACAO, TRC_TRCORIGINAL, TRC_TITULOANT) ');
  except
  end;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  //Evitar Segundo Clique
  if not SB_Reabre.Enabled then
    Exit;

  //Atualizar valor do Crédito
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=Entidade.ClienteCNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger:=Entidade.CodigoCLI;
  Cliente1.Open;

  CdCNC    := Entidade.CodigoCNC;
  CdTRC    := Entidade.CodigoTRC;
  CdPDV    := Entidade.CodigoPDV;
  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;
  CdCHQ    := Entidade.CodigoCHQ;
  CdCHQCNC := Entidade.ChequeCNC;

  if DM.Configuracao1.Empresa <> empLBM then
    sCentro := ' AND (CNC_CODIGO='+IntToStr(CdCNC)+') ';

  //Verificar a existência de Títulos Gerados a partir desse
  //  Se existir algum já pago (solicitar a reabertura dele
  //  Se existir somente em aberto excluir
  vAberturaParcial := Entidade.PagamentoParcial;
  if not vAberturaParcial then //Para verificar os títulos antigos, ante do campo TRC_PAGAMENTO_PARCIAL
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 TRC_CODIGO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE (TRC_TITULOANT='+IntToStr(CdTRC)+
        ' OR TRC_TRCORIGINAL='+IntToStr(CdTRC)+') '+
        ' AND TRC_SITUACAO<>5 '+
        sCentro;
      Open;
      if not IsEmpty then
      Begin
        vAberturaParcial := True;
        if MessageDlg('Existe Título gerado a partir deste.'+#13+
                      'Código do Título: '+FieldByName('TRC_CODIGO').asString+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
      end;
      Close;
    end;
  end;

  vUsuAut := 0;
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3950)) < 0 then
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(3950)) < 0 then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        DigCdPDVCNC := CdCNC;
        DigCdPDV    := CdPDV;
        DigCdCLICNC := CdCLICNC;
        DigCdCLI    := CdCLI;
        DigCdTRC    := CdTRC;
        DigiTipoPendencia := 5; //Reabrir Título
        onClose:=nil;
        Tag:=10;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if usuario1.Permissoes.IndexOf(IntToStr(3950)) < 0 then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para reabrir Título!');
          end
          else
          Begin
            if DigCdPEN > 0 then
              ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                ' PEN_SITUACAO=3 '+ //Processado
                ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
            vUsuAut := Usuario1.CodigoUSU;
          end;
        end
        else
        begin
          exit;
          free;
        end;
        free;
      End;
    end;
  end;

  DM.Caixa1.Close;
  DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
  DM.Caixa1.Open;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if (Entidade.TipoPag = 6) and
         (not DM.Configuracao1.IgnorarCheques) then //Cheque
      Begin
        //Mudar a Situacao do Cheque
        vValorCHQ := Arredonda(CalculaSaldoCheque(DM.QR_Consultas, CdCHQCNC, CdCHQ) + Entidade.ValorPG);
        ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
          ' CHQ_UTILIZADO=0 '+
          ' WHERE CHQ_UTILIZADO=1 '+
          ' AND CHQ_CODIGO='+IntToStr(CdCHQ)+
          ' AND CNC_CODIGO='+IntToStr(CdCHQCNC)+
          ' AND ROUND(CHQ_VALOR,2)='+VirgPonto(vValorCHQ));
      end;
      iTipoMovCHQ := 4070; //Extorno de Pagamento

      //Gerar movimento de extorno do título
      if Entidade.GerouMovimento then
      Begin
        With DM.Movimento_caixa1 do
        Begin
          if Entidade.TipoPag <> 6 then
          Begin
            if not Inserir(CaixaCNC,0,Entidade.CodigoCCX,
               Entidade.CodigoCCXRecebimento,DM.Configuracao1.CodigoCAX,
               Entidade.TipoPag,Entidade.Tipo,Entidade.CodigoCNC,
               Entidade.ChequeCNC, Entidade.CodigoCHQ,
               'Ext.TRC: '+IntToStr(Entidade.CodigoTRC),'0',Entidade.Numero,'',
               Entidade.Sequencia,'D',Entidade.ValorPG,
               Entidade.Desconto(*Desconto*),Entidade.Juros(*Juros*),
               Entidade.Credcli(*CredCli*),Entidade.Valor(*ValorDoc*),
               DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
               0(*DtCheque*),Entidade.CodigoTRC,Entidade.CodigoCNC,'R') then
            Begin
              ShowMessage('Falha ao gerar Movimento de Caixa!');
              Raise Exception.Create('');
            end;

            if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
              if not DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,
                  1,0,'Movimento de Caixa','Reabertura do Titulo: '+IntToStr(Entidade.CodigoTRC)+#13+#10+
                  'Valor: R$ '+format('%.2f',[Entidade.ValorPG])+' ('+dblTipoPagamento.Text+')') then
              Begin
                ShowMessage('Falha ao gerar Mensagem!');
                Raise Exception.Create('');
              end;
          end
          else
          Begin
            If (MessageDlg('Atenção!!!'+#13+'É um Cheque Devolvido? (SEM MVC)',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
            Begin
              if not Inserir(CaixaCNC,0,Entidade.CodigoCCX,
                   Entidade.CodigoCCXRecebimento,DM.Configuracao1.CodigoCAX,
                   Entidade.TipoPag,Entidade.Tipo,Entidade.CodigoCNC,
                   Entidade.ChequeCNC,Entidade.CodigoCHQ,
                   'Ext.TRC: '+IntToStr(Entidade.CodigoTRC)+
                   ' CH ('+format('%.2f',[Entidade.ValorPG])+')','0',Entidade.Numero,'',
                   Entidade.Sequencia,'D',0(*Valor*),
                   Entidade.Desconto(*Desconto*),Entidade.Juros(*Juros*),
                   Entidade.Credcli(*CredCli*),Entidade.Valor(*ValorDoc*),
                   DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                   0(*DtCheque*),Entidade.CodigoTRC,Entidade.CodigoCNC,'R') then
              Begin
                ShowMessage('Falha ao gerar Movimento de Caixa!');
                Raise Exception.Create('');
              end;
            end
            else
            Begin
              if not Inserir(CaixaCNC,0,Entidade.CodigoCCX,
                   Entidade.CodigoCCXRecebimento,DM.Configuracao1.CodigoCAX,
                   Entidade.TipoPag,Entidade.Tipo,Entidade.CodigoCNC,
                   Entidade.ChequeCNC,Entidade.CodigoCHQ,
                   'Ext.TRC: '+IntToStr(Entidade.CodigoTRC),'0',Entidade.Numero,'',
                   Entidade.Sequencia,'D',Entidade.ValorPG(*Valor*),
                   Entidade.Desconto(*Desconto*),Entidade.Juros(*Juros*),
                   Entidade.Credcli(*CredCli*),Entidade.Valor(*ValorDoc*),
                   DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                   0(*DtCheque*),Entidade.CodigoTRC,Entidade.CodigoCNC,'R') then
              Begin
                ShowMessage('Falha ao gerar Movimento de Caixa!');
                Raise Exception.Create('');
              end;
              if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
                if not DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,
                    1,0,'Movimento de Caixa','Reabertura do Titulo: '+IntToStr(Entidade.CodigoTRC)+#13+#10+
                    'Valor: R$ '+format('%.2f',[Entidade.ValorPG])+' (Cheque)') then
                Begin
                  ShowMessage('Falha ao gerar Mensagem!');
                  Raise Exception.Create('');
                end;
            end;
          end;
        End;
      end;

      if Entidade.Cred_Cli > 0 then
      Begin
        if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
          CdCLICNC,CdCLI,4030,Entidade.CodigoCNC, Entidade.CodigoTRC,
          Entidade.CodigoCNC,Entidade.CodigoPDV,'C',Cliente1.Credito,
          Entidade.Cred_Cli) then
        Begin
          ShowMessage('Falha ao gerar Mov. Credito!');
          Raise Exception.Create('');
        end;

        ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
          ' CLI_CREDITO=CLI_CREDITO+'+VirgPonto(Entidade.Cred_Cli)+
          ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
          ' AND CLI_CODIGO='+IntToStr(CdCLI));
      end;

      with Titulo_receber2 do
      Begin
        Close;
        ParamByName('TRC_CODIGO').AsInteger:=Entidade.CodigoTRC;
        ParamByName('CNC_CODIGO').AsInteger:=Entidade.CodigoCNC;
        Open;
        If IsEmpty then
          Raise Exception.Create('');
      end;

      if (Entidade.TipoPag = 6) and
         (not DM.Configuracao1.IgnorarCheques) then //Cheque
      Begin
        //Gerar Movimento de Cheque
        if not DM.Movimento_de_Cheque1.Inserir(CdCNC, CdCHQCNC, CdCHQ, CdCNC,
          CdTRC, iTipoMovCHQ, Entidade.ValorPG) then
        Begin
          ShowMessage('Falha ao gerar Movimento de Cheque!');
          Raise exception.Create('');
        end;
      end;

      if not Titulo_receber2.ReabreTitulo(vAberturaParcial, False(*PCHQDev*), vUsuAut) then //Log Gerado na Função
        Raise Exception.Create('');

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;
      ShowMessage('Título reaberto!');

    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;

  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    SB_Recibo.Enabled:=False;
    Entidade.LimpaCampos;
    edtLocal.Clear;
  end
  else
    SB_Reabre.Enabled := True;
end;


procedure TfMxBaixaRec.Titulo_receber1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  if not Entidade.IsEmpty then
    edtCliente.Text:=Cliente1.RazaoSocial+'('+IntToStr(Cliente1.CodigoCLI)+')'
  else
  Begin
    edtCliente.Clear;
    edtDadosCheque.Clear;
  end;

  if (Entidade.CodigoCHQ > 0) and
     (not DM.Configuracao1.IgnorarCheques) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CHEQUE '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.ChequeCNC)+
        ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ);
      Open;
      edtDadosCheque.Text := PreencheZero(3,FieldByName('CHQ_BANCO').asString)+
                             '-'+PreencheZero(4,FieldByName('CHQ_AGENCIA').asString)+
                             '-'+PreencheZero(12,FieldByName('CHQ_CONTA').asString)+
                             '-'+PreencheZero(6,FieldByName('CHQ_NUMERO').asString);
    end;
  end;
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxBaixaRec.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  ComboBox2.ItemIndex:=1;
  Edit11.SetFocus;
end;

procedure TfMxBaixaRec.SB_ReciboClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Título!');
  //Verifica se o usuário não tem permissão imprimir
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(2180)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=10;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(2180)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para imprimir recibo!');
        end;
      end
      else
      begin
        exit;
        free;
      end;
      free;
    End;
  end;
  with Entidade do
    Movimento_caixa1.GeraLog(2180,CodigoCNC,CodigoTRC,'51');

  if DM.Configuracao1.Empresa = 1 then
  Begin
    Application.CreateForm(Trpt_Recibo, rpt_Recibo);
    rpt_Recibo.tag:=1;
    rpt_Recibo.Titulo_receber1.Close;
    rpt_Recibo.Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger:=Entidade.CodigoCNC;
    rpt_Recibo.Titulo_receber1.ParamByName('TRC_CODIGO').AsInteger:=Entidade.CodigoTRC;
    rpt_Recibo.Titulo_receber1.Open;
    rpt_Recibo.report.Preview;
  end
  else
  Begin
    Application.CreateForm(Trpt_ReciboLBM,rpt_ReciboLBM);
    with rpt_ReciboLBM do
    Begin
      Tag := 1;
      Titulo_receber1.Close;
      Titulo_receber1.SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CODIGO='+IntTostr(self.Entidade.CodigoCNC)+
        ' AND TRC_CODIGO='+IntToStr(self.Entidade.CodigoTRC);
      Titulo_receber1.Open;
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxBaixaRec.Titulo_receber1CalcFields(DataSet: TDataSet);
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

  if Entidade.CodigoCLI > 0 then
  Begin
    Cliente1.Close;
    Cliente1.ParamByName('CNC_CODIGO').asInteger:=Entidade.ClienteCNC;
    Cliente1.ParamByName('CLI_CODIGO').asInteger:=Entidade.CodigoCLI;
    Cliente1.Open;
    Entidade.FieldByName('Cliente').asString:=Cliente1.RazaoSocial;
  end
  else
    Entidade.FieldByName('Cliente').asString:='';
end;

procedure TfMxBaixaRec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(27) then
  Begin
    key:=chr(0);
    Close;
  end;
end;

procedure TfMxBaixaRec.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxBaixaRec.Action7Execute(Sender: TObject);
begin
  Close;
end;

end.
