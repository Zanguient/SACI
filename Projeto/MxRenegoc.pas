unit MxRenegoc;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Variants,
  AgenteFin, Menus, Conta_de_Caixa, DB, Titulo_receber, Parametro,
  DBTables, SQuery, Cliente, StdCtrls, Buttons, DBCtrls, Mask, Grids,
  DBGrids, ExtCtrls, dialogs;


type
  TfMxReneg = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoTRCRen: TEdit;
    Label2: TLabel;
    edtNumeroDocumentoRen: TEdit;
    edtSequenciaRen: TEdit;
    Label3: TLabel;
    edtValorRen: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    mskVencimentoRen: TMaskEdit;
    memObservacaoRen: TMemo;
    Label12: TLabel;
    dblTipoPagamentoRen: TDBLookupComboBox;
    Panel1: TPanel;
    Label9: TLabel;
    edtCodigoTRC: TEdit;
    edtNumeroDocumento: TEdit;
    Label13: TLabel;
    Label15: TLabel;
    edtSequencia: TEdit;
    mskVencimento: TMaskEdit;
    Label16: TLabel;
    Label17: TLabel;
    edtValor: TEdit;
    Label20: TLabel;
    Label5: TLabel;
    dblCliente: TDBLookupComboBox;
    edtCodigoPDV: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Label10: TLabel;
    Cliente1: TCliente;
    Parametro1: TParametro;
    Titulo_receber1: TTitulo_receber;
    DSCliente1: TDataSource;
    DSParametro1: TDataSource;
    DSTitulo_receber1: TDataSource;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    dblContaDeCaixa: TDBLookupComboBox;
    Label14: TLabel;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Caixas1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    Label18: TLabel;
    dblTipoDePagamento: TDBLookupComboBox;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    dblAgenteFinanceiroRen: TDBLookupComboBox;
    Label19: TLabel;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    BitBtn1: TBitBtn;
    edtValorComJuros: TEdit;
    Label21: TLabel;
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
    Titulo_receber1CNC_CLIENTE: TIntegerField;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber1USU_CODIGO: TIntegerField;
    Titulo_receber1TRC_DT_ALTERADO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_INICIO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_SITUACAO: TDateTimeField;
    Titulo_receber1CPC_CODIGO: TIntegerField;
    Titulo_receber1TRC_RGB_SITUACAO: TIntegerField;
    Titulo_receber1TRC_RGB_VISITADO: TSmallintField;
    Titulo_receber1TRC_RGB_DT_PROMESSA: TDateTimeField;
    Titulo_receber1TRC_PROCESSO: TIntegerField;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
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
    Titulo_receber1TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CV: TStringField;
    Titulo_receber1TRC_LOCAL: TStringField;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    procedure SB_ExcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure Titulo_receber1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mskVencimentoRenExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TTitulo_receber;
    cancelar:boolean;
    Acao:Integer;
    Soma,ValorCJuros:Double;
    TituloAnterior,Ant,Sit:integer;
    Confirmacao:Boolean;
  end;

var
  fMxReneg: TfMxReneg;

implementation
Uses
  UDM, MxSPediLoc, MXReceber, funcoes, MxSRecPedido,
  DigSenha, MxCobCobrador;
{$R *.DFM}



procedure TfMxReneg.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  If DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC then
    raise Exception.Create('Não pode renegociar Títulos de outro centro!');    
  Entidade.deletarauto;
end;

procedure TfMxReneg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Cliente1.Active:=False;
    Parametro1.Active:=False;
    Titulo_receber1.Active:=False;
    Conta_de_Caixa1.Active:=False;
  finally
    Action:=Cafree;
  end;
end;
procedure TfMxReneg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
Var
  aux:TDataSetNotifyEvent;
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
  If not Titulo_receber1.IsEmpty then
  Begin
    If not Confirmacao then
    Begin
      if MessageDlg('Se você sair sem confirmar, seus títulos renegociados serão perdidos e você vai ficar apenas com o título original! Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        With Titulo_receber1 do
        Begin
          aux:=AfterScroll;
          AfterScroll:=Nil;
          First;
          While not EOF do
          Begin
            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_SITUACAO=5 '+
              ',TRC_OBSERVACAO="Reneg. Cancelada! Por:'+DM.Usuario1.NomeUSU+'" '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
              ' AND TRC_CODIGO='+IntToStr(CodigoTRC));
            Next;
          End;
          AfterScroll:=Aux;
        End;

        If fMxReneg.Tag=0 Then
          With fMxReceber.Titulo_receber1 do
            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_SITUACAO=0 '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
              ' AND TRC_CODIGO='+IntToStr(CodigoTRC))
        else If fMxReneg.Tag=2 Then
          With fMxSRecPed.Titulo_receber1 do
            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_SITUACAO=0 '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
              ' AND TRC_CODIGO='+IntToStr(CodigoTRC));
      End
      else
        CanClose:=False;
    End
    else
    Begin
      With Titulo_receber1 do
      Begin
        aux:=AfterScroll;
        AfterScroll:=Nil;
        Open;
        First;
        While not EOF do
        Begin
          ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
            ' TRC_SITUACAO=8 '+
            ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
            ' AND TRC_CODIGO='+IntToStr(CodigoTRC));
          Next;
        End;
        AfterScroll:=Aux;
      End;
    end;
  End;
end;


procedure TfMxReneg.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxReneg.SB_PrimClick(Sender: TObject);
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

procedure TfMxReneg.SB_AntClick(Sender: TObject);
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

procedure TfMxReneg.SB_ProxClick(Sender: TObject);
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

procedure TfMxReneg.SB_UltClick(Sender: TObject);
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

procedure TfMxReneg.SB_NovoClick(Sender: TObject);
Var
  Seq:Integer;
  aux:TDatasetNotifyEvent;
begin
  If DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC then
    raise Exception.Create('Não pode renegociar Títulos de outro centro!');  
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3750)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Renegociar Título!');
  edtCodigoTRCRen.Text:=IntToStr(Titulo_receber1.ProximoCodigo('TRC_CODIGO'));
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  edtNumeroDocumentoRen.Text:='';
  edtValorRen.Text:='';
  Titulo_receber1.AtualizaControles(true);
  if tag = 0 then
  Begin
    dblTipoDePagamento.KeyValue:=fMxReceber.Titulo_receber1.TipoPag;
    dblContaDeCaixa.KeyValue:=fMxReceber.Titulo_receber1.CodigoCCX;
  end
  else if tag = 2 then
  Begin
    dblTipoDePagamento.KeyValue:=fMxSRecPed.Titulo_receber1.TipoPag;
    dblContaDeCaixa.KeyValue:=fMxSRecPed.Titulo_receber1.CodigoCCX;
  end;
  mskVencimentoRen.Text:='';
  memObservacaoRen.text:='';
  Aux:=Titulo_receber1.AfterScroll;
  Titulo_receber1.AfterScroll:=nil;
  Titulo_receber1.Last;

  If Titulo_receber1.Sequencia='' then
    Seq:=0
  Else
    seq:=StrToInt(Copy(Titulo_receber1.Sequencia,length(Titulo_receber1.Sequencia)-1,2));

  If seq+1<10 Then
    edtSequenciaRen.Text:=edtSequencia.text+'.0'+IntToStr(seq+1)
  Else
    edtSequenciaRen.Text:=edtSequencia.text+'.'+IntToStr(seq+1);
  Titulo_receber1.AfterScroll:=aux;
  edtNumeroDocumentoRen.Enabled:=False;
  edtNumeroDocumentoRen.Text:=edtNumeroDocumento.text;
  DBGrid5.Enabled:=False;
  mskVencimentoRen.SetFocus;
  Acao:=0;
end;

procedure TfMxReneg.SB_AltClick(Sender: TObject);
begin
  If DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC then
    raise Exception.Create('Não pode renegociar Títulos de outro centro!');
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  Entidade.PreparaAlteracao;
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  edtNumeroDocumentoRen.Enabled:=False;
  edtSequenciaRen.Enabled:=False;
  mskVencimentoRen.SetFocus;
  Acao:=1;
end;

procedure TfMxReneg.SB_SalvaClick(Sender: TObject);
Var
  mensagem:string;
begin
  mensagem:='';
  if dblContaDeCaixa.Text = '' then
    mensagem:=mensagem +'Faltando Conta!'+#13;
  if dblTipoDePagamento.Text = '' then
    mensagem:=mensagem +'Faltando Tipo de Pagamento!'+#13;
  if dblAgenteFinanceiroRen.Text = '' then
    mensagem:=mensagem +'Faltando Agente Financeiro!'+#13;
  if dblTipoPagamentoRen.Text = '' then
    mensagem:=mensagem +'Faltando Tipo de Documento!'+#13;
  if not Verificadatabranco(mskVencimentoRen.text) then
    mensagem:= mensagem + 'Vencimento incorreto!'+#13;
  if not VerificaFloatbranco(edtValorRen.Text) then
    mensagem:=mensagem +'Valor digitado incorretamente!'+#13;
  if mensagem<>'' then
    raise Exception.Create(mensagem);

//Se tiver sido chamado a partir da form fMxReceber
  If Tag=0 Then
  Begin
    TituloAnterior:=StrToInt(edtCodigoTRC.text);
    If Acao=0 then
      Titulo_receber1.Inserir(DM.Configuracao1.CodigoCNC,StrtoInt(edtCodigoTRCRen.text),
        Cliente1.CodigoCLI,fMxReceber.Titulo_receber1.CodigoPDV,Conta_de_Caixa1.CodigoCCX,
        Conta_de_Caixa1.CodigoCCX,dblTipoDePagamento.KeyValue,dblTipoPagamentoRen.KeyValue,
        0(*TRF*),0(*Reabertura*),StrToDate(mskVencimentoRen.Text),0(*DtPag*),StrToDate(mskVencimento.Text),0(*DtVerificado*),
        memObservacaoRen.Text,edtSequenciaRen.Text,edtNumeroDocumentoRen.Text,''(*CartaoCV*),
        StrToFloat(edtValorRen.Text), 0(*ValorPago*),0(*Credito*),
        dblTipoDePagamento.KeyValue,Cliente1.CodigoCNC,6(*Situacao*),TituloAnterior,
        TituloAnterior,fMxReceber.Titulo_receber1.TipoPedido,False(*MovCaixa*), False(*CHQDev*));
    If Acao=1 then
      Titulo_receber1.Alterar(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoTRCRen.Text),
        Cliente1.CodigoCLI,fMxReceber.Titulo_receber1.CodigoPDV,Conta_de_Caixa1.CodigoCCX,
        Conta_de_Caixa1.CodigoCCX,dblTipoDePagamento.KeyValue,Titulo_receber1.Situacao,
        dblTipoPagamentoRen.KeyValue,''(*OBS*),Titulo_receber1.Sequencia,
        Titulo_receber1.Numero,StrToDate(mskVencimentoRen.text),0(*DtPag*),
        StrToFloat(edtValorRen.text),0(*ValorPag*),0(*SCredito*),
        dblAgenteFinanceiroRen.KeyValue,Cliente1.CodigoCNC,TituloAnterior,TituloAnterior);

    Titulo_receber1.Close;
    Titulo_receber1.Open;
  End;
//Se tiver sido chamado a partir da form fMxSRecPed
  If Tag=2 Then
  Begin
    TituloAnterior:=StrToInt(edtCodigoTRC.text);
    If Acao=0 then
      Titulo_receber1.Inserir(DM.Configuracao1.CodigoCNC,StrtoInt(edtCodigoTRCRen.text),
         Cliente1.CodigoCLI,fMxSRecPed.Titulo_receber1.CodigoPDV,Conta_de_Caixa1.CodigoCCX,
         Conta_de_Caixa1.CodigoCCX,dblTipoDePagamento.KeyValue,dblTipoPagamentoRen.KeyValue,
         0(*TRF*),0(*Reabertura*),StrToDate(mskVencimentoRen.Text),0(*DtPag*),StrToDate(mskVencimento.Text),0(*DtVerificad*),
         memObservacaoRen.Text,edtSequenciaRen.Text,edtNumeroDocumentoRen.Text,''(*CartaoCV*), 
         StrToFloat(edtValorRen.Text),0(*ValorPag*),0(*Credito*),
         dblAgenteFinanceiroRen.KeyValue,Cliente1.CodigoCNC,0(*Situacao*),
         TituloAnterior,TituloAnterior,fMxSRecPed.Titulo_receber1.TipoPedido,False(*MovCaixa*), False(*CHQDev*));
    If Acao=1 then
      Titulo_receber1.Alterar(DM.Configuracao1.CodigoCNC,StrtoInt(edtCodigoTRCRen.text),
        Cliente1.CodigoCLI,fMxSRecPed.Titulo_receber1.CodigoPDV,Conta_de_Caixa1.CodigoCCX,
        Conta_de_Caixa1.CodigoCCX,dblTipoDePagamento.KeyValue,Titulo_receber1.Situacao,
        dblTipoPagamentoRen.KeyValue,''(*OBS*),Titulo_receber1.Sequencia,
        Titulo_receber1.Numero,StrToDate(mskVencimentoRen.text),0(*DtPag*),
        StrToFloat(edtValorRen.text),0(*ValorPag*),0(*Credito*),
        dblAgenteFinanceiroRen.KeyValue,Cliente1.CodigoCNC,TituloAnterior,TituloAnterior);

    Titulo_receber1.Close;
    Titulo_receber1.Open;
  End;
  Incluir1.Enabled:=true;
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  Titulo_receber1.AtualizaControles(False);
end;

procedure TfMxReneg.SB_CancClick(Sender: TObject);
begin
  Incluir1.Enabled:=true;
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  Entidade.CancelaEdicao;
end;

procedure TfMxReneg.Titulo_receber1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxReneg.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Parametro1.Active:=True;
  Parametro2.Active:=True;
  AgenteFin1.open;
  Confirmacao := False;
  If Tag=0 Then
  Begin
    Cliente1.Close;
    Cliente1.ParamByName('CNC_CODIGO').AsInteger := fMxReceber.Cliente1.CodigoCNC;
    Cliente1.ParamByName('CLI_CODIGO').AsInteger := fMxReceber.Cliente1.CodigoCLI;
    Cliente1.Active:=true;
    edtCodigoTRC.Text:=fMxReceber.edtCodigoTRC.Text;
    edtNumeroDocumento.Text:=fMxReceber.edtNumeroDocumento.Text;
    edtSequencia.Text:=fMxReceber.edtSequencia.Text;
    mskVencimento.Text:=fMxReceber.mskVencimento.Text;
    edtValor.Text:=fMxReceber.edtValor.Text;
    edtCodigoPDV.Text:=fMxReceber.edtCodigoPDV.Text;
    Ant := fMxReceber.Titulo_receber1.TituloANT;
    Sit := fMxReceber.Titulo_receber1.Situacao;
  End

  Else If Tag=2 Then
  Begin
    Cliente1.ParamByName('CNC_CODIGO').AsInteger := fMxSRecPed.Cliente1.CodigoCNC;
    Cliente1.ParamByName('CLI_CODIGO').AsInteger := fMxSRecPed.Cliente1.CodigoCLI;
    Cliente1.Active:=true;
    edtCodigoTRC.Text:=Inttostr(fMxSRecPed.Titulo_receber1.CodigoTRC);
    edtNumeroDocumento.Text:=fMxSRecPed.Titulo_receber1.Numero;
    edtSequencia.Text:=fMxSRecPed.Titulo_receber1.Sequencia;
    mskVencimento.Text:=DateToStr(fMxSRecPed.Titulo_receber1.Vencimento);
    edtValor.Text:=Format('%.2f',[fMxSRecPed.Titulo_receber1.Valor]);
    edtCodigoPDV.Text:=IntToStr(fMxSRecPed.Titulo_receber1.CodigoPDV);
    Ant := fMxSRecPed.Titulo_receber1.TituloANT;
    Sit := fMxSRecPed.Titulo_receber1.Situacao;
  End;
  dblCliente.KeyValue:=cliente1.CodigoCLI;

  Entidade:=Titulo_receber1;

  With entidade do
  Begin
    Close;
    SQL.Text:='SELECT * FROM TITULO_A_RECEBER WHERE TRC_SEQUENCIA LIKE "'+edtSequencia.Text+'.__"'+
            ' AND TRC_NUMERO="'+edtNumeroDocumento.Text+'" AND PDV_CODIGO='+edtCodigoPDV.Text+
            ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=6)';
    Open;
  End;

  Conta_de_Caixa1.Active:=True;
  If fMxReneg.Tag=0 Then
  Begin
    If DM.Configuracao1.Data>fMxReceber.Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsFloat then
      ValorCJuros:=fMxReceber.Titulo_receber1.FieldByName('TRC_VALOR').AsFloat+
                   fMxReceber.Titulo_receber1.FieldByName('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*
                   (DM.Configuracao1.Data-fMxReceber.Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsFloat)/3000)
    Else
      ValorCJuros:=fMxReceber.Titulo_receber1.FieldByName('TRC_VALOR').AsFloat;
  End;

  If fMxReneg.Tag=2 Then
  Begin
    If DM.Configuracao1.Data>fMxSRecPed.Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsFloat then
      ValorCJuros:=fMxSRecPed.Titulo_receber1.FieldByName('TRC_VALOR').AsFloat+
                   fMxSRecPed.Titulo_receber1.FieldByName('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*
                   (DM.Configuracao1.Data-fMxSRecPed.Titulo_receber1.FieldByName('TRC_VENCIMENTO').AsFloat)/3000)
    Else
      ValorCJuros:=fMxSRecPed.Titulo_receber1.FieldByName('TRC_VALOR').AsFloat;
  End;

  edtValorComJuros.Text := Format('%.2f',[ValorCJuros]);
end;


procedure TfMxReneg.Sair1Click(Sender: TObject);
begin
 Close;
end;


procedure TfMxReneg.BitBtn1Click(Sender: TObject);
Var
  CdTIT,CdCNC:Integer;
begin
  If DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC then
    raise Exception.Create('Não pode renegociar Títulos de outro centro!');
  soma:=0;
  If SB_Salva.Enabled then
    Raise Exception.Create('Salve ou cancele antes de continuar!');
  If Titulo_receber1.IsEmpty then
    Raise Exception.Create('O título não foi renenegociado, inclua algum título antes de confirmar!');
//Verifica se o usuário que está logado não tem permissão para renegociar o pedido
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3750)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=8;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(3750)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para renegociar um título!');
        end;
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  End;

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND ((Sit = 8) or
     (Ant > 0)) then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=8;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para renegociar um título já negociado!');
        end;
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  End;

  With Titulo_receber1 do
  begin
    First;
    While not EOF do
    Begin
      Soma:=Soma+Valor;
      Next;
    End;
  end;
  if Soma<=ValorCJuros-ValorCJuros*DM.Configuracao1.JurosEsp/100 then
    if MessageDlg('O valor a ser pago('+Format('%.2f',[ValorCJuros])+
       ') é maior que o valor da soma dos títulos renegociados.Deseja continuar?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      if DM.Usuario1.Permissoes.IndexOf(IntToStr(3470)) < 0 then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=8;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          begin
            if (usuario1.Permissoes.IndexOf(IntToStr(3470)) < 0) and (usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para renegociar o título com o valor menor que o original!');
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
    End
    Else
      Exit;

//Se tiver sido chamado a partir da form fMxReceber
  If fMxReneg.Tag=0 Then
  Begin
    Try
      CdTIT:=fMxReceber.Titulo_receber1.CodigoTRC;
      CdCNC:=fMxReceber.Titulo_receber1.CodigoCNC;
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_SITUACAO=4 '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(fMxReceber.Titulo_receber1.CodigoCNC)+
        ' AND TRC_CODIGO='+IntToStr(fMxReceber.Titulo_receber1.CodigoTRC));
      fMxReceber.Titulo_receber1.Close;
      fMxReceber.Titulo_receber1.Open;
      fMxReceber.Titulo_receber1.LocalizarCod(CdTIT,CdCNC);
      Confirmacao := True;
    Except
    End;
  end
//Se tiver sido chamado a partir da form fMxSRecPed
  Else If fMxReneg.Tag=2 Then
  Begin
    Try
      CdTIT:=fMxSRecPed.Titulo_receber1.CodigoTRC;
      CdCNC:=fMxSRecPed.Titulo_receber1.CodigoCNC;
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_SITUACAO=4 '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(fMxSRecPed.Titulo_receber1.CodigoCNC)+
        ' AND TRC_CODIGO='+IntToStr(fMxSRecPed.Titulo_receber1.CodigoTRC));
      fMxSRecPed.Titulo_receber1.Close;
      fMxSRecPed.Titulo_receber1.Open;
      fMxSRecPed.Titulo_receber1.LocalizarCod(CdTIT,CdCNC);
      Confirmacao := True;
    Except
    End;
  end;
  Close;
end;

procedure TfMxReneg.mskVencimentoRenExit(Sender: TObject);
begin
  if (VerificaDataBranco(mskVencimentoRen.Text)) and (edtValorRen.Text = '') then
    If StrToDate(mskVencimentoRen.Text) > DM.Configuracao1.Data then
    Begin
      if DM.Configuracao1.Data >= StrToDate(mskVencimento.Text) then
        edtValorRen.Text:=format('%.2f',[StrToFloat(edtValorComJuros.Text)+
                  StrToFloat(edtValorComJuros.Text)*(DM.Configuracao1.TaxaJuros*
                  (StrToDate(mskVencimentoRen.Text)-DM.Configuracao1.Data)/3000)])
      else
        edtValorRen.Text:=format('%.2f',[StrToFloat(edtValorComJuros.Text)+
                  StrToFloat(edtValorComJuros.Text)*(DM.Configuracao1.TaxaJuros*
                  (StrToDate(mskVencimentoRen.Text)-StrToDate(mskVencimento.Text))/3000)]);
    end;
end;

procedure TfMxReneg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    if SB_Canc.Enabled then
      SB_CancClick(SB_Canc)
    else
      close;
  end;
end;

end.
