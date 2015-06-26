unit MxReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Pedido_de_Compra, Parametro, Titulo_receber,Variants,
  Pedido_de_Venda, Menus, Conta_de_Caixa, Informacoes, CentroCusto,
  AgenteFin, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfMxReceber = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label1: TLabel;
    edtCodigoTRC: TEdit;
    Label2: TLabel;
    edtNumeroDocumento: TEdit;
    edtSequencia: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtValor: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    mskVencimento: TMaskEdit;
    memObservacao: TMemo;
    dblTipoPagamento: TDBLookupComboBox;
    Label10: TLabel;
    Label12: TLabel;
    SB_Pago: TSpeedButton;
    Titulo_receber1: TTitulo_receber;
    Cliente1: TCliente;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    DSCliente1: TDataSource;
    DSTitulo_receber1: TDataSource;
    edtCodigoPDV: TEdit;
    dblTipoDocumento: TDBLookupComboBox;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    Label14: TLabel;
    dblContaDeCaixaAgendada: TDBLookupComboBox;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    SB_Renegociar: TSpeedButton;
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
    Informacoes1: TInformacoes;
    CentroCusto1: TCentroCusto;
    DSCentroCusto: TDataSource;
    dblClienteCNC: TDBLookupComboBox;
    Label44: TLabel;
    edtCodigoCLI: TEdit;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    Titulo_receber1Cliente: TStringField;
    Titulo_receber1Valor: TStringField;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    edtBoleto: TEdit;
    Label9: TLabel;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    edtCobranca: TEdit;
    Label11: TLabel;
    Titulo_receber1USU_CODIGO: TIntegerField;
    Titulo_receber1TRC_DT_ALTERADO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_INICIO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_SITUACAO: TDateTimeField;
    Titulo_receber1CPC_CODIGO: TIntegerField;
    Titulo_receber1TRC_RGB_SITUACAO: TIntegerField;
    Titulo_receber1TRC_RGB_VISITADO: TSmallintField;
    Titulo_receber1TRC_RGB_DT_PROMESSA: TDateTimeField;
    Titulo_receber1TRC_PROCESSO: TIntegerField;
    mskVencimentoOriginal: TMaskEdit;
    edtCodigoTRCOriginal: TEdit;
    Label13: TLabel;
    Label15: TLabel;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    Titulo_receber1Centro: TStringField;
    CentroCusto2: TCentroCusto;
    Label16: TLabel;
    dblAgenteFinanceiro: TDBLookupComboBox;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    edtNumeroDePrestacoes: TEdit;
    edtIntervaloEmDias: TEdit;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
    SB_Recibo: TBitBtn;
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
    Label21: TLabel;
    edtCodigoFPE: TEdit;
    Titulo_receber1TRC_DT_CHEQUE: TDateTimeField;
    Titulo_receber1TRC_SIT_CHEQUE: TIntegerField;
    Titulo_receber1TRC_REABERTURA: TIntegerField;
    Titulo_receber1TRC_VERIFICADO: TIntegerField;
    Titulo_receber1DataEmissaoBoleto: TStringField;
    Titulo_receber1DataRecebimentoBoleto: TStringField;
    Titulo_receber1TRC_DT_VERIFICADO: TDateTimeField;
    Titulo_receber1DataVerificado: TStringField;
    Titulo_receber1CHQ_CODIGO: TIntegerField;
    Titulo_receber1CNC_CHEQUE: TIntegerField;
    Titulo_receber1TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CV: TStringField;
    SB_Custos: TSpeedButton;
    Label22: TLabel;
    edtLocal: TEdit;
    Titulo_receber1TRC_LOCAL: TStringField;
    Titulo_receber1TituloJuros: TStringField;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    EfetuarPagamento1: TAction;
    Sair1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Titulo_receber1AfterScroll(DataSet: TDataSet);
    procedure SB_PagoClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_RenegociarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ReciboClick(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_CustosClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    UltDtVencimento:TDateTime;
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
  public
    Entidade:TTitulo_receber;
    Cancelar:Boolean;
  end;

var
  fMxReceber: TfMxReceber;

implementation
Uses UDM, MxSPediLoc, MxRenegoc,funcoes, MxSRecParcela, CdCliente,
  DigSenha, UReciboLBM, MxSelRecibo;
{$R *.DFM}



procedure TfMxReceber.SB_PrimClick(Sender: TObject);
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

procedure TfMxReceber.SB_AntClick(Sender: TObject);
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

procedure TfMxReceber.SB_ProxClick(Sender: TObject);
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

procedure TfMxReceber.SB_UltClick(Sender: TObject);
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

procedure TfMxReceber.SB_NovoClick(Sender: TObject);
begin
  If (DM.Configuracao1.Empresa <> empLBM) and
     (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Não pode criar Títulos de outro centro!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4500)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if not Entidade.RequestLive then
  Begin
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
                         ' WHERE TRC_CODIGO=-1';
    Entidade.RequestLive := True;
    SB_Loc.Enabled := True;
    Entidade.Open;
  end;
  UltDtVencimento := 0;
  Entidade.PreparaInsercao;
  AtualizaControles(1,true);
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    dblClienteCNC.KeyValue := 1
  else
    dblClienteCNC.KeyValue := DM.Configuracao1.CodigoCNC;
  dblContaDeCaixaAgendada.SetFocus;
end;

procedure TfMxReceber.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  Sair1.Enabled         := not Habilitar;
  Incluir1.Enabled      := not Habilitar;
  Alterar1.Enabled      := not Habilitar;
  Excluir1.Enabled      := not Habilitar;
  Salvar1.Enabled       := Habilitar;
  Cancelar1.Enabled     := Habilitar;
  SB_Loc.Enabled        := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_Novo.Enabled       := not Habilitar;
  SB_Loc.Enabled        := not Habilitar;
  SB_Alt.Enabled        := not Habilitar;
  SB_Exc.Enabled        := not Habilitar;
  SB_Salva.Enabled      := Habilitar;
  SB_Canc.Enabled       := Habilitar;
  SB_Pago.Enabled       := not Habilitar;

  SB_Recibo.Enabled         := not Habilitar;
  EfetuarPagamento1.Enabled := not Habilitar;
  SB_Renegociar.Enabled     := not Habilitar;
  SB_Custos.Enabled         := not Habilitar;

  edtLocalizar.Enabled :=  not Habilitar;
  if Habilitar then
    edtLocalizar.Color :=  AlteraCorComponentes
  else
    edtLocalizar.Color :=  clWindow;
  cmbCampo.Enabled  :=not Habilitar;
  if Habilitar then
    cmbCampo.Color    := AlteraCorComponentes
  else
    cmbCampo.Color    := clWindow;

  DBGrid5.Enabled    := not Habilitar;

  if Entidade.Estado = 1 then
  Begin
    edtNumeroDePrestacoes.Enabled := Habilitar;
    edtIntervaloEmDias.Enabled    := Habilitar;
  end
  else
  Begin
    edtNumeroDePrestacoes.Enabled := False;
    edtIntervaloEmDias.Enabled    := False;
  end;

  dblClienteCNC.Enabled := habilitar;
  if (Habilitar) and (Entidade.Estado = 1) then
  begin
    edtNumeroDePrestacoes.Color:=clWindow;
    edtIntervaloEmDias.Color:=clWindow;
  end
  else
  begin
    edtNumeroDePrestacoes.Color:=AlteraCorComponentes;
    edtIntervaloEmDias.Color:=AlteraCorComponentes;
  end;
end;

procedure TfMxReceber.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  If (DM.Configuracao1.Empresa <> empLBM) and
     (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Não pode alterar Títulos de outro centro!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4510)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para Alterar registro!');

  if (DM.Configuracao1.Empresa <> empLBM) and //Não LBM
     (DM.Configuracao1.Empresa <> empMotical) and
     (DM.Configuracao1.Empresa <> empLuciano) and
     (Entidade.CNCOrigem <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Não pode alterar Títulos de outro centro!');

  if ((DM.Configuracao1.Empresa = empMotical) or
     (DM.Configuracao1.Empresa = empLuciano)) and
     (DM.Usuario1.CentroDeCusto <> 1) and
     ((Entidade.TipoPag=13) or
      (Entidade.TipoPag=412)) and //Cartão ou Boleto
     ((Trunc(Entidade.DataCadastro)<>Trunc(DM.Configuracao1.Data)) OR
      (Entidade.Verificado>=1)) then
    Raise exception.Create('Não é permitido alterar Cartão ou Boleto!');

  if Entidade.CodigoPDV > 0 then
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6250)) < 0 then
      Raise Exception.Create('Utilize a tela Corrigir Parcelas em Vendas!')
    else
      ShowMessage('Recomendo Utilizar a tela de Corrigir Parcelas!');

  try
    UltDtVencimento := StrToDate(mskVencimento.Text);
  except
    UltDtVencimento := 0;
  end;
  Entidade.PreparaAlteracao;
  AtualizaControles(1,true);
  dblContaDeCaixaAgendada.SetFocus;
end;

procedure TfMxReceber.SB_ExcClick(Sender: TObject);
var
  Trans:Boolean;
  sAutorizacao: string;
  CdTRC, CdCNC, CdPDV, CdCLICNC, CdCLI: integer;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  If (DM.Configuracao1.Empresa <> empLBM) and
     (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Não pode excluir Títulos de outro centro!');

  if (DM.Configuracao1.Empresa = empMotical) and
     (DM.Configuracao1.CodigoCNC <> 1) and
     ((Entidade.TipoPag=13) or
      (Entidade.TipoPag=412)) and //Cartão ou Boleto
     ((Trunc(Entidade.DataCadastro)<>Trunc(DM.Configuracao1.Data)) OR
      (Entidade.Verificado>=1)) then
    Raise exception.Create('Não é permitido excluir Cartão ou Boleto!');

  If MessageDlg('ATENÇÃO!!!'+#13+'Deseja excluir o Título?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;
  CdCLICNC := Entidade.ClienteCNC;
  CdCLI := Entidade.CodigoCLI;
  CdTRC := Entidade.CodigoTRC;

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4520)) < 0 then
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(4520)) < 0 then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        DigCdPDVCNC := CdCNC;
        DigCdPDV    := CdPDV;
        DigCdCLICNC := CdCLICNC;
        DigCdCLI    := CdCLI;
        DigCdTRC    := CdTRC;
        DigiTipoPendencia := 6; //Excluir Título
        onClose:=nil;
        Tag:=20;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if usuario1.Permissoes.IndexOf(IntToStr(4520)) < 0 then
          begin
            free;
            Raise Exception.Create('Usuário não tem permissão para excluir título!');
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
            sAutorizacao := 'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU);
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

  end;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_SITUACAO=5 '+
        ',TRC_OBSERVACAO="Exc.P/'+DM.Usuario1.NomeUSU+' Excluir" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE TRC_CODIGO='+IntToStr(Entidade.CodigoTRC)+
        ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC));
      Entidade.GeraLog(4520,Entidade.CodigoCNC,Entidade.CodigoTRC,sAutorizacao);

      If DM.Configuracao1.ControleTransacao then
        Commit;
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
end;

procedure TfMxReceber.SB_SalvaClick(Sender: TObject);
Var
  i:Integer;
  mensagem, Titulos:string;
  DataInicial : TDateTime;
begin
  mensagem := '';
  If dblContaDeCaixaAgendada.KeyValue=0 then
    mensagem:=mensagem+'Conta de Caixa incorreto!'+#13;
  If dblTipoDocumento.KeyValue=0 then
    mensagem:=mensagem+'Tipo de documento incorreto!'+#13;
  if not VerificaDataBranco(mskVencimento.Text)then
    mensagem:=mensagem+'Vencimento incorreto!'+#13;
  if not VerificaFloatBranco(edtValor.Text) then
    mensagem:=mensagem+'Valor Inválido!'+#13;
  if (edtNumeroDePrestacoes.Text<>'')  then
  Begin
    if not VerificaInteiroBranco(edtNumeroDePrestacoes.text) then
      mensagem:=mensagem+'Número de prestações inválido!'+#13;
    if not VerificaInteiro(edtIntervaloEmDias.text) then
      mensagem:=mensagem+'Intervalo entre prestações inválido!';
  end;
  if mensagem <> '' then
    Raise Exception.Create(mensagem);
  Titulos := edtCodigoTRC.Text;
  if UltDtVencimento > 0 then
  Begin
    if Abs(UltDtVencimento-StrToDate(mskVencimento.Text)) > 5 then
      If DM.Usuario1.Permissoes.IndexOf(IntToStr(6040)) < 0 then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=20;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          begin
            if usuario1.Permissoes.IndexOf(IntToStr(6040)) < 0 then
            begin
              free;
              Raise Exception.Create('Usuário não tem permissão para esse Vencimento!');
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
  end;
  DataInicial := StrToDate(mskVencimento.Text);
  if (edtNumeroDePrestacoes.Text<>'') and (Entidade.Estado=1) then
  Begin
    if edtSequencia.Text='' then
      edtSequencia.Text:='1';
    if edtBoleto.Text='' then
      edtBoleto.Text:='0';
    For I:=1 to StrToInt(edtNumeroDePrestacoes.Text)-1 do
    begin
      if not Entidade.FinalizaEdicao then
        Exit;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
        ' WHERE TRC_CODIGO='+IntToStr(Entidade.SCodigo)+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        Entidade.Selecao.Text+
        ' ORDER BY TRC_CODIGO ';
      Entidade.Open;
      Entidade.Estado:=1;
      if edtIntervaloEmDias.Text <> '' then
        mskVencimento.Text:=DateToStr(StrToDate(mskVencimento.Text)+StrToInt(edtIntervaloEmDias.Text))
      else
        mskVencimento.Text:=DateToStr(IncMonth(DataInicial,i));
      edtSequencia.Text:=IntToStr(StrToInt(edtSequencia.Text)+1);
      if edtBoleto.Text <> '0' then
        edtBoleto.Text := IntToStr(StrToInt(edtBoleto.Text)+1);
      Entidade.ProximoCodigo('TRC_CODIGO');
      Titulos:=Titulos+' OR TRC_CODIGO='+IntToStr(Entidade.SCodigo);
    end;
  End;
  edtNumeroDePrestacoes.Text:='';
  edtIntervaloEmDias.Text:='';
  if Entidade.FinalizaEdicao then
  Begin
    Entidade.Close;
    if Trim(Titulos) = '' then
      Titulos := IntToStr(Entidade.SCodigo);
    Entidade.SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
      ' WHERE (TRC_CODIGO='+Titulos+') '+
      ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      Entidade.Selecao.Text+
      ' ORDER BY TRC_CODIGO ';
    Entidade.Open;
    AtualizaControles(1,false);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxReceber.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,false);
end;


procedure TfMxReceber.FormCreate(Sender: TObject);
begin
  Entidade:=Titulo_receber1;
  Entidade.Active:=true;
  Parametro1.Active:=true;
  Parametro2.Active:=true;
  Conta_de_Caixa1.Active:=true;
  CentroCusto2.Open;
  AgenteFin1.Open;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_RECEBER_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxReceber.SB_LocClick(Sender: TObject);
Var
  mensagem,Campo,Nome,campoloc,sCodigoCLI :String;
  i :Integer;
begin
  mensagem:='';
  if (cmbCampo.ItemIndex=0) and (not VerificaInteiroBranco(edtLocalizar.Text)) then
    cmbCampo.ItemIndex := 4;

  if (edtLocalizar.Text<>'*') then
  Begin
    If (cmbCampo.ItemIndex=0) then
       if not VerificaInteiroBranco(edtLocalizar.Text) then
         mensagem:= mensagem+'Código a ser localizado inválido!'+#13;
    If (cmbCampo.ItemIndex=2) then
       if not VerificaInteiroBranco(edtLocalizar.Text) then
         mensagem:= mensagem+'Pedido a ser localizado inválido!'+#13;
    If (cmbCampo.ItemIndex=3) then
       if not VerificaInteiroBranco(edtLocalizar.Text) then
         mensagem:= mensagem+'Código do cliente a ser localizado inválido!';
    If (cmbCampo.ItemIndex=7) then
       if not VerificaInteiroBranco(edtLocalizar.Text) then
         mensagem:= mensagem+'Código do Boleto Bancário a ser localizado inválido!';
    if mensagem<>'' then
      raise exception.Create(mensagem);

    If (cmbCampo.Text<>'') Then
    Begin
      campoloc:=trim(cmbCampo.Text);
      for i:= length(campoloc) downto 1 do
        If campoloc[i]=' ' Then
        Begin
          Campo := Copy(campoloc,i+1,length(campoloc)-i);
          Break;
        End;
      Nome:=Trim(edtLocalizar.text);
    End
    else if not cmbCampo.ItemIndex in [17,18] then
      Raise Exception.Create('Campo ou valor de localização faltando!');
  end;

  // Entidade.Localizar;
  With Entidade do
  Begin
    Close;
    RequestLive := True;
    SB_Alt.Enabled := True;
    if (edtLocalizar.text='*') Then
      SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
                ' WHERE (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=8) '+
                ' ORDER BY TRC_CODIGO '
    else if Campo='CLI_RZ_SOCIAL' then
    Begin
      sCodigoCLI := '';
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT CLI_CODIGO FROM CLIENTE '+
          ' WHERE CLI_RZ_SOCIAL LIKE "%'+edtLocalizar.Text+'%" ';
        Open;
        while not Eof do
        Begin
          if sCodigoCLI = '' then
            sCodigoCLI := ' CLI_CODIGO='+FieldByName('CLI_CODIGO').asString
          else
            sCodigoCLI := sCodigoCLI + ' OR CLI_CODIGO=' + FieldByName('CLI_CODIGO').asString;
          Next;
        end;
        if sCodigoCLI = '' then
          sCodigoCLI := ' CLI_CODIGO=-10 ';
        Entidade.SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
            ' WHERE (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=8) '+
            ' AND ('+sCodigoCLI+') '+
            ' ORDER BY TRC_CODIGO ';
      end;
    end
    else if Campo='TRC_VENCIMENTO' then
      SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
              ' WHERE (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=8) '+
              ' AND '+campo+'="'+MesDia(edtLocalizar.Text)+'" '+
              ' ORDER BY TRC_CODIGO '
    else if Campo='CLI_CGC_CPF' then
    Begin
      sCodigoCLI := '';
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT CNC_CODIGO,CLI_CODIGO FROM CLIENTE '+
          ' WHERE CLI_CGC_CPF LIKE "%'+edtLocalizar.Text+'%" ';
        Open;
        while not Eof do
        Begin
          if sCodigoCLI = '' then
            sCodigoCLI := ' (CLI_CODIGO='+FieldByName('CLI_CODIGO').asString+
                          ' AND CNC_CLIENTE='+FieldByName('CNC_CODIGO').asString+') '
          else
            sCodigoCLI := sCodigoCLI + ' OR (CLI_CODIGO=' + FieldByName('CLI_CODIGO').asString+
                         ' AND CNC_CLIENTE='+FieldByName('CNC_CODIGO').asString+') ';
          Next;
        end;
        if sCodigoCLI = '' then
          sCodigoCLI := ' CLI_CODIGO=-10 ';
        Entidade.Close;
        Entidade.SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
            ' WHERE (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=8) '+
            ' AND ('+sCodigoCLI+') '+
            ' ORDER BY TRC_CODIGO ';
      end;
    end
    else if Campo='N_VERIF_1' then
    Begin
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
        ' WHERE (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=8) '+
        ' AND TRC_VERIFICADO=0 '+
        ' AND TRC_TIPO_PAG=412 '+ //Boleto Bancário
        ' AND TRC_DT_EMISSAO_BOLETO IS NULL '+
        ' ORDER BY TRC_CODIGO ';
    end
    else if Campo='N_VERIF_2' then
    Begin
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
        ' WHERE (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=8) '+
        ' AND TRC_VERIFICADO=0 '+
        ' AND TRC_TIPO_PAG=5 '+ //Dinheiro/Promissória
        ' AND TRC_DT_EMISSAO_BOLETO IS NULL '+
        ' ORDER BY TRC_CODIGO ';
    end
    else
    Begin
      Selecao.Text := ' AND (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=8) ';
      Selecionar;
    end;
    try
      Open;
    except
      ShowMessage('Falha na consulta! (Grande demais)');
    end;
  End;
  edtLocalizar.SetFocus;
  if Entidade.isEmpty then
    Entidade.LimpaCampos;
end;

procedure TfMxReceber.Cliente1AfterScroll(DataSet: TDataSet);
begin
  With Informacoes1 do
  Begin
    Close;
    parambyname('CLI_CODIGO').AsInteger := Cliente1.CodigoCLI;
    parambyname('CNC_CODIGO').AsInteger := Cliente1.CodigoCNC;
    Open;
  End;
end;

procedure TfMxReceber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_RECEBER_');
  except
  end;
  Entidade.Close;
  Cliente1.Close;
  Parametro1.Close;
  Parametro2.Close;
  Conta_de_Caixa1.Close;
  AgenteFin1.Close;
  Action:=Cafree;
end;
procedure TfMxReceber.Titulo_receber1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxReceber.SB_PagoClick(Sender: TObject);
var
  vCredito: Double;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Título!');
  if dblTipoDocumento.Text = '' then
    Raise Exception.Create('Tipo de Documento inválido!');
  if dblTipoPagamento.Text = '' then
    Raise Exception.Create('Tipo de Pagamento inválido!');
  if dblAgenteFinanceiro.Text = '' then
    Raise Exception.Create('Agente Financeiro inválido!');

  if (DM.Configuracao1.Empresa = empMotical) then
  Begin
    if (not DM.Configuracao1.CPD) and            //Loja
       ((Titulo_receber1.TipoPag = 412) or       //Boleto Bancário
        (Titulo_receber1.TipoPag = 13)) then     //Cartão
      Raise exception.Create('Somente no CPD!')
    else if (DM.Configuracao1.CPD) and           //CPD
            (Titulo_receber1.TipoPag <> 412) and //Dif. Boleto Bancário
            (Titulo_receber1.TipoPag <> 13) then //Dif. Cartão
      Raise exception.Create('Somente na Loja!');
  end
  else if (DM.Configuracao1.Empresa <> empLBM) and //Não LBM
          (DM.Configuracao1.Empresa <> empMotical) and
          (DM.Configuracao1.Empresa <> empLuciano) and
          (Entidade.CNCOrigem <> DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Não pode baixar Títulos de outro centro!');

  with DM.Conta_de_Caixa1 do
  Begin
    if (not Active) or
       (CodigoCCX <> Entidade.CodigoCCX) then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
      Open;
    end;
  end;

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(2190)) < 0) then
  begin
    if not ((Titulo_receber1.TipoPag = 13) and
       (DM.Usuario1.Permissoes.IndexOf(IntToStr(5000)) > 0)) then
    begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=20;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if (not ((self.Entidade.TipoPag = 13) and
                   (DM.Usuario1.Permissoes.IndexOf(IntToStr(5000)) > 0))) or
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(2190)) < 0) then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para pagar um título!');
          end;
        end
        else
        begin
          free;
          exit;
        end;
        free;
      end;
    end;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    if self.Entidade.DataOriginal > 0 then
      SQL.Text := 'SELECT TRC_CODIGO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CLIENTE='+IntToStr(self.Entidade.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(self.Entidade.CodigoCLI)+
        ' AND PDV_CODIGO='+IntToStr(self.Entidade.CodigoPDV)+
        ' AND (TRC_SITUACAO<2 OR TRC_SITUACAO=8) '+
        ' AND TRC_VENCIMENTO<"'+MesDia(self.Entidade.DataOriginal)+'" '
    else
      SQL.Text := 'SELECT TRC_CODIGO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CLIENTE='+IntToStr(self.Entidade.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(self.Entidade.CodigoCLI)+
        ' AND PDV_CODIGO='+IntToStr(self.Entidade.CodigoPDV)+
        ' AND (TRC_SITUACAO<2 OR TRC_SITUACAO=8) '+
        ' AND TRC_VENCIMENTO<"'+MesDia(self.Entidade.Vencimento)+'" ';
    Open;
    if not IsEmpty then
    Begin
      If MessageDlg('ATENÇÃO!!!'+#13+
                    'Título fora de ordem.'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;

      If DM.Usuario1.Permissoes.IndexOf(IntToStr(8570)) < 0 then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=20;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          begin
            if usuario1.Permissoes.IndexOf(IntToStr(8570)) < 0 then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para receber título fora de ordem!');
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
    end;
  end;

  with Cliente1 do
  Begin
    if (Entidade.CodigoCLI <> CodigoCLI) or
       (Entidade.ClienteCNC <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').AsInteger := Entidade.CodigoCLI;
      ParamByName('CNC_CODIGO').AsInteger := Entidade.ClienteCNC;
      Open;
    end;
  end;

  if self.Entidade.TipoPedido <> 2 then //Pacote de Crédito
    vCredito := Cliente1.Credito
  else
    vCredito := 0;

  If (Entidade.Situacao<2) or (Entidade.Situacao=8) then
  Begin
    Application.CreateForm(TfMxSRecPParc, fMxSRecPParc);
    fMxSRecPParc.Tag:=2;
    fMxSRecPParc.edtCodigoTRC.Text:=IntToStr(Entidade.CodigoTRC);
    fMxSRecPParc.edtNumeroDocumento.Text:=Entidade.Numero;
    fMxSRecPParc.edtSequencia.Text:=Entidade.Sequencia;
    fMxSRecPParc.edtValorDocumento.Text:=Format('%.2f', [Entidade.Valor]);
    fMxSRecPParc.edtCredito.Text:=Format('%.2f', [vCredito]);
    fMxSRecPParc.vCreditoAnterior := vCredito;
    fMxSRecPParc.dblTipoPagamentoEfetuado.KeyValue := Entidade.TipoPag;
    fMxSRecPParc.CodCNCTitulo := Entidade.CodigoCNC;
    //calcular os juros, se estiver em atraso

    If Entidade.Vencimento>=DM.Configuracao1.Data then
      fMxSRecPParc.edtJuros.Text:='0'
    Else
    Begin
      fMxSRecPParc.iDiasAtraso := (Trunc(DM.Configuracao1.Data)-Trunc(Entidade.Vencimento));
      if (DM.Configuracao1.Empresa = empLBM) and //LBM
         (DM.Conta_de_Caixa1.Grupo = 452) then //CONDOMINIO
      Begin
        //1% ao mês + 10% multa
        fMxSRecPParc.edtJuros.Text:=Format('%.2f', [Entidade.Valor*(1*(DM.Configuracao1.Data-Titulo_receber1.Vencimento)/3000)+
          (Entidade.Valor*0.1)]);
      end
      else
      Begin
        if ((Entidade.Vencimento+DM.Configuracao1.QuantDiasSemJuros<DM.Configuracao1.Data) or
            (Entidade.TipoPag = 412) or
            (DM.Configuracao1.Empresa IN [empEletro,empLBM])) and
           (Entidade.TipoPag <> 13) then
          fMxSRecPParc.edtJuros.Text:=Format('%.2f', [Entidade.Valor*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-Entidade.Vencimento)/3000)])
        else
          fMxSRecPParc.edtJuros.Text:='0';
      end;
    end;

    If Entidade.Valor+StrToFloat(fMxSRecPParc.edtJuros.Text)<=vCredito then
    Begin
      fMxSRecPParc.edtValorPago.Text:='0';
      fMxSRecPParc.edtValorTotal.Text:='0'
    End
    Else
    Begin
      fMxSRecPParc.edtValorPago.Text:=Format('%.2f', [Titulo_receber1.Valor+StrToFloat(fMxSRecPParc.edtJuros.Text)-vCredito]);
      fMxSRecPParc.edtValorTotal.Text:=Format('%.2f', [Entidade.Valor+StrToFloat(fMxSRecPParc.edtJuros.Text)-vCredito]);
    End;
    fMxSRecPParc.mskVencimento.Text:=DateToStr(Entidade.Vencimento);
    fMxSRecPParc.mskDataPag.Text:=DateTimeToStr(DM.Configuracao1.Data);
    fMxSRecPParc.dblTipoPagamentoAgendado.KeyValue:=Entidade.TipoPag;
    fMxSRecPParc.dblContaDeCaixaAgendada.KeyValue:=Entidade.CodigoCCX;
    fMxSRecPParc.dblCodigoAGF.KeyValue:=Entidade.CodigoAGF;
    //Anderson
    if (Entidade.CodigoCCXRecebimento>0) then
      fMxSRecPParc.dblContaDeCaixaRecebida.KeyValue:=Entidade.CodigoCCXRecebimento
    else
      fMxSRecPParc.dblContaDeCaixaRecebida.KeyValue:=Entidade.CodigoCCX;

    if (Entidade.TipoPag = 13) and
       ((DM.Configuracao1.Empresa <> 1) or
       (Entidade.Mafalda = 1)) then
    Begin
      with DM.AgenteFin1 DO
      Begin
        Close;
        ParamByName('AGF_CODIGO').asInteger := Entidade.CodigoAGF;
        Open;
        fMxSRecPParc.edtDesconto.Text := format('%.2f',[StrToFloat(fMxSRecPParc.edtValorDocumento.Text)*Juros/100]);
      end;
    end;
    fMxSRecPParc.ShowModal;
  End
  Else
    Showmessage('O título já foi pago! Se desejar alterá-lo reabra-o '+
                'utilizando a rotina de reabrir títulos encerrados!');
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfMxReceber.Sair1Click(Sender: TObject);
begin
 Close;
end;


procedure TfMxReceber.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;


procedure TfMxReceber.SB_RenegociarClick(Sender: TObject);
begin
  // Verifica se já foi renegociado e foi cancelado
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Título!');

  If Entidade.Situacao = 9 then
    raise Exception.Create('Esse Título não pode ser renegociado');

  if dblTipoDocumento.Text = '' then
    Raise Exception.Create('Tipo de Documento inválido!');
  if dblTipoPagamento.Text = '' then
    Raise Exception.Create('Tipo de Pagamento inválido!');
  if dblAgenteFinanceiro.Text = '' then
    Raise Exception.Create('Agente Financeiro inválido!');

  if not (DM.Configuracao1.Empresa in [1,2]) then
    Raise exception.Create('Não Permitido!');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3750)) < 0 then
  Begin
    ShowMessage('Usuário não tem Permissão para renegociar!');
{    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=20;
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
}
  End;

  with Cliente1 do
  Begin
    if (Entidade.CodigoCLI <> CodigoCLI) or
       (Entidade.ClienteCNC <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').AsInteger := Entidade.CodigoCLI;
      ParamByName('CNC_CODIGO').AsInteger := Entidade.ClienteCNC;
      Open;
    end;
  end;

  Application.CreateForm(TfMxReneg, fMxReneg);
  fMxReneg.Tag:=0;
  fMxReneg.showmodal;
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxReceber.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto1.Open;
  if DM.Configuracao1.Empresa <> empLBM then
    SB_Recibo.Visible := False;
  cmbCampo.ItemIndex:=2;
  edtLocalizar.SetFocus;
end;

procedure TfMxReceber.edtCodigoCLIExit(Sender: TObject);
begin
  If not VerificaInteiroBranco(edtCodigoCLI.Text) then
    raise Exception.Create('Codigo de cliente inválido!');

  with Cliente1 do
  Begin
    if (StrToInt(edtCodigoCLI.Text) <> CodigoCLI) or
       (dblClienteCNC.KeyValue <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
      ParamByName('CNC_CODIGO').AsInteger:=dblClienteCNC.KeyValue;
      Open;
    end;
    If IsEmpty then
      raise Exception.Create('Cliente não cadastrado');
  end;
end;

procedure TfMxReceber.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=3;
    fCadCli.CentroCusto2.open;
    fCadCli.CentroCusto2.LocalizarCod(Entidade.ClienteCNC);
    fCadCli.dblCentroDeCusto.KeyValue:=Entidade.ClienteCNC;
    With fCadCli.Cliente1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM CLIENTE '+
        ' WHERE CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
        ' AND CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC);
      Open;
    End;
    if Cliente1.Active then
      Parametro2.Open;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxReceber.Titulo_receber1CalcFields(DataSet: TDataSet);
begin
  if Entidade.DataEmissaoBoleto > 0 then
    Entidade.FieldByName('DataEmissaoBoleto').asString := DateToStr(Entidade.DataEmissaoBoleto)
  else
    Entidade.FieldByName('DataEmissaoBoleto').asString := '';

  if Entidade.DataRecebimentoBoleto > 0 then
    Entidade.FieldByName('DataRecebimentoBoleto').asString := DateToStr(Entidade.DataRecebimentoBoleto)
  else
    Entidade.FieldByName('DataRecebimentoBoleto').asString := '';

  if Entidade.DataVerificado > 0 then
    Entidade.FieldByName('DataVerificado').asString := formatDateTime('DD/MM/YYYY HH:MM',Entidade.DataVerificado)
  else
    Entidade.FieldByName('DataVerificado').asString := '';

  with Cliente1 do
  Begin
    if (Entidade.CodigoCLI <> CodigoCLI) or
       (Entidade.ClienteCNC <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').AsInteger := Entidade.CodigoCLI;
      ParamByName('CNC_CODIGO').AsInteger := Entidade.ClienteCNC;
      Open;
    end;
    Entidade.FieldByName('Cliente').asString := RazaoSocial +
      ' ('+PreencheZero(2,Entidade.ClienteCNC)+'-'+IntToStr(Entidade.CodigoCLI)+')';
  end;

  Entidade.FieldByName('Valor').asString:=format('%.2f',[Entidade.Valor]);

  //Definir Centro de Custo
  with DM.CentroCusto2 do
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

  Entidade.FieldByName('TituloJuros').asString := '';
  if Entidade.TituloANT > 0 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND TRC_CODIGO='+IntToStr(Entidade.TituloANT);
      Open;
      if (Arredonda(FieldByName('TRC_VALOR_PAGO').asFloat) +
          Arredonda(FieldByName('TRC_DESCONTO').asFloat)) >=
         Arredonda(FieldByName('TRC_VALOR').asFloat) then
        Entidade.FieldByName('TituloJuros').asString := 'SIM'
      else
        Entidade.FieldByName('TituloJuros').asString := 'NAO'
    end;
  end;
end;


procedure TfMxReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end
  else If key=chr(13) then
  Begin
    if SB_Salva.Enabled then
    Begin
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
    end;
  end
  else if (edtValor.Focused)and(Key = '.') then
    Key := ',';
end;

procedure TfMxReceber.SB_ReciboClick(Sender: TObject);
var
  cancelar:boolean;
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
    DM.Usuario1.GeraLog(2180,CodigoCNC,CodigoTRC);

  with Cliente1 do
  Begin
    if (Entidade.CodigoCLI <> CodigoCLI) or
       (Entidade.ClienteCNC <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').AsInteger := Entidade.CodigoCLI;
      ParamByName('CNC_CODIGO').AsInteger := Entidade.ClienteCNC;
      Open;
    end;
  end;

  Application.CreateForm(TfMxSelRecibo, fMxSelRecibo);
  with fMxSelRecibo do
  Begin
    Tag := 0;
    rdgReciboTotal.Enabled := False;
    CdCNC := self.Entidade.CodigoCNC;
    CdPDV := self.Entidade.CodigoPDV;
    CdTRC := self.Entidade.CodigoTRC;
    Begin
      if self.Entidade.Vencimento < DM.Configuracao1.Data then
      Begin
        rdgReciboAvulso.Checked := True;
        //1% ao mês + 10% multa
        edtValorRecibo.Text:=Format('%.2f', [self.Entidade.Valor+
          (self.Entidade.Valor*(1*(DM.Configuracao1.Data-self.Entidade.Vencimento)/3000))+
          (self.Entidade.Valor*0.1)]);
      end;
    end;
    ShowModal;
    Close;
  end;
end;

procedure TfMxReceber.DBGrid5DblClick(Sender: TObject);
var
  CdCNC, CdTRC, CdBNB: integer;
  DtVerificado: TDateTime;
begin
  if Entidade.IsEmpty then
    Exit;

  CdCNC := Entidade.CodigoCNC;
  CdTRC := Entidade.CodigoTRC;

  if Entidade.DataEmissaoBoleto > 0 then
  Begin
    If MessageDlg('ATENÇÃO!!!'+#13+'Deseja zerar Data de Envio?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

    ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_RECEBER SET '+
      ' TRC_DT_EMISSAO_BOLETO=NULL '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND TRC_CODIGO='+IntToStr(CdTRC));
  end
  else if Entidade.Verificado=0 then
  Begin
    If MessageDlg('Deseja definir todos os Título selecionados como Verificado?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      try
        if Entidade.TipoPag <> 412 then //Boleto Bancário
          CdBNB := 1
        else
        Begin
          CdBNB := StrToInt(UpperCase(InputBox('Código do Banco Boleto' , 'Código: ', '1' )));
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT BNB_CODIGO '+
              ' FROM BANCO_BOLETO '+
              ' WHERE BNB_CODIGO='+IntToStr(CdBNB)+
              ' AND BNB_SITUACAO=0 ';
            Open;
            if IsEmpty then
            Begin
              ShowMessage('Banco Boleto não encontrado ou desativado!');
              Exit;
            end;
          end;
        end;
      except
        ShowMessage('Código do Banco Boleto inválido!');
        Exit;
      end;
      DtVerificado := DM.Configuracao1.DataHora;
      Entidade.First;
      while not Entidade.Eof do
      Begin
        CdCNC := Entidade.CodigoCNC;
        CdTRC := Entidade.CodigoTRC;

        ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_RECEBER SET '+
          ' TRC_VERIFICADO='+IntToStr(CdBNB)+
          ',TRC_DT_VERIFICADO="'+MesDiaHora(DtVerificado)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND TRC_CODIGO='+IntToStr(CdTRC));

        Entidade.GeraLog(6620,CdCNC,CdTRC,'BNB:'+IntToStr(CdBNB));

        Entidade.Next;
      end;
    end
    else If MessageDlg('ATENÇÃO!!!'+#13+
                       'Deseja definir o título selecionado como Verificado?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      try
        if Entidade.TipoPag <> 412 then //Boleto Bancário
          CdBNB := 1
        else
        Begin
          CdBNB := StrToInt(UpperCase(InputBox('Código do Banco Boleto' , 'Código: ', '1' )));
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT BNB_CODIGO '+
              ' FROM BANCO_BOLETO '+
              ' WHERE BNB_CODIGO='+IntToStr(CdBNB)+
              ' AND BNB_SITUACAO=0 ';
            Open;
            if IsEmpty then
            Begin
              ShowMessage('Banco Boleto não encontrado ou desativado!');
              Exit;
            end;
          end;
        end;
      except
        ShowMessage('Código do Banco Boleto inválido!');
        Exit;
      end;
      ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_VERIFICADO='+IntToStr(CdBNB)+
        ',TRC_DT_VERIFICADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TRC_CODIGO='+IntToStr(CdTRC));

      Entidade.GeraLog(6620,CdCNC,CdTRC,'BNB:'+IntToStr(CdBNB));
    end;
  end
  else if Entidade.Verificado>=1 then
  Begin
    If MessageDlg('ATENÇÃO!!!'+#13+'Deseja definir como não Verificado?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

    ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_RECEBER SET '+
      ' TRC_VERIFICADO=0 '+
      ',TRC_DT_VERIFICADO=NULL '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND TRC_CODIGO='+IntToStr(CdTRC));

    Entidade.GeraLog(6630,CdCNC,CdTRC);
  end;

  Entidade.Close;
  Entidade.Open;
  Entidade.LocalizarCod(CdTRC, CdCNC);
end;

procedure TfMxReceber.memObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfMxReceber.SB_CustosClick(Sender: TObject);
var
  vValorExtras: Double;
begin
  // Verifica se já foi renegociado e foi cancelado
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Título!');

  if dblTipoDocumento.Text = '' then
    Raise Exception.Create('Tipo de Documento inválido!');
  if dblTipoPagamento.Text = '' then
    Raise Exception.Create('Tipo de Pagamento inválido!');
  if dblAgenteFinanceiro.Text = '' then
    Raise Exception.Create('Agente Financeiro inválido!');

  if not (DM.Configuracao1.Empresa in [4,7]) then  //Oticas
    Raise exception.Create('Não Permitido!');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7870)) < 0 then
    Raise Exception.Create('Usuário não tem Permissão para Gerar Custos Extras/Cartório!');

  try
    vValorExtras := Arredonda(StrToFloat(UpperCase(InputBox('Valor do Título de Custos Extras/Cartório' , 'Valor: R$ ', '0,00' ))));
    if vValorExtras <= 0 then
      Raise exception.Create('');
  except
    ShowMessage('Valor inválido!');
    Exit;
  end;
  //
  if not Entidade.Inserir(Entidade.CodigoCNC,0,Entidade.CodigoCLI,
      Entidade.CodigoPDV,Entidade.CodigoCCX,
      Entidade.CodigoCCXRecebimento,
      Entidade.TipoPag,DM.Configuracao1.TipoDocumento,0(*TRF*),0(*Reabertura*),
      DM.Configuracao1.Data,0(*DtPag*),Entidade.DataOriginal,Entidade.DataVerificado,
      'Referente a Custos Extras/Cartório','01',InttoStr(Entidade.CodigoTRC)+'DC',
      ''(*CartaoCV*), vValorExtras,
      0(*ValorPag*),0(*Credito*),Entidade.CodigoAGF,
      Entidade.ClienteCNC,0(*Situacao*),Entidade.CodigoTRC,Entidade.CodigoTRC,
      Entidade.TipoPedido, False(*Mov*), False(*CHQDev*)) then
    Raise exception.Create('')
  else
    ShowMessage('Título a Receber Gerado com Sucesso!');
  //
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxReceber.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.

