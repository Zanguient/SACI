unit MxPacoteCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Db,
  DBTables, SQuery, Cliente, Usuario, Vendedor, Pacote_de_Credito,
  Informacoes, Titulo_receber, Parametro, Forma_de_Pagamento, AgenteFin,
  Fatfin;

type
  TfMxPacoteCredito = class(TForm)
    Panel13: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigoPCR: TEdit;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    mskAlterado: TMaskEdit;
    Label8: TLabel;
    Label10: TLabel;
    mskCadastro: TMaskEdit;
    Label11: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    IncluirPed: TMenuItem;
    ExcluirPed: TMenuItem;
    N1: TMenuItem;
    SalvarPed: TMenuItem;
    CancelarPed: TMenuItem;
    N2: TMenuItem;
    LocalizarPed: TMenuItem;
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel1: TPanel;
    SB_LocPed: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_ExcPed: TSpeedButton;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    edtValor: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    DSPacote_de_Credito1: TDataSource;
    edtClienteCNC: TEdit;
    cmbSituacao: TComboBox;
    Cliente1: TCliente;
    Panel5: TPanel;
    SB_Fechar: TSpeedButton;
    SB_Imprimir: TSpeedButton;
    edtCNPJCPF: TEdit;
    Label14: TLabel;
    Label16: TLabel;
    edtObservacao: TEdit;
    Label5: TLabel;
    mskFone: TMaskEdit;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    dblCodigoFUN: TDBLookupComboBox;
    Label22: TLabel;
    Pacote_de_Credito1: TPacote_de_Credito;
    Pacote_de_Credito1PCR_CODIGO: TIntegerField;
    Pacote_de_Credito1CNC_CODIGO: TIntegerField;
    Pacote_de_Credito1CNC_CLIENTE: TIntegerField;
    Pacote_de_Credito1CLI_CODIGO: TIntegerField;
    Pacote_de_Credito1USU_CODIGO: TIntegerField;
    Pacote_de_Credito1FUN_CODIGO: TIntegerField;
    Pacote_de_Credito1PCR_DT_CADASTRO: TDateTimeField;
    Pacote_de_Credito1PCR_DT_ALTERADO: TDateTimeField;
    Pacote_de_Credito1PCR_VALOR: TFloatField;
    Pacote_de_Credito1PCR_SITUACAO: TIntegerField;
    Pacote_de_Credito1PCR_OBSERVACAO: TStringField;
    Pacote_de_Credito1Cliente: TStringField;
    Pacote_de_Credito1Usuario: TStringField;
    Pacote_de_Credito1Situacao: TStringField;
    Pacote_de_Credito1CNPJ: TStringField;
    Pacote_de_Credito1Fone: TStringField;
    Pacote_de_Credito1Credito: TStringField;
    FatorFinanceira2: TFatorFinanceira;
    FatorFinanceira1: TFatorFinanceira;
    DSAgenteFin1: TDataSource;
    AgenteFin1: TAgenteFin;
    DSForma_de_Pagamento1: TDataSource;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    Titulo_receber5: TTitulo_receber;
    Informacoes1: TInformacoes;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    dblTipoPagamento: TDBLookupComboBox;
    dblFormaPagamento: TDBLookupComboBox;
    dblCodigoAGF: TDBLookupComboBox;
    Pacote_de_Credito1PCR_TIPO_PAG: TIntegerField;
    Pacote_de_Credito1FPG_CODIGO: TIntegerField;
    Pacote_de_Credito1AGF_CODIGO: TIntegerField;
    Titulo_receber2: TTitulo_receber;
    Titulo_receber1: TTitulo_receber;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_LocPedClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_ExcPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Pacote_de_Credito1CalcFields(DataSet: TDataSet);
    procedure Pacote_de_Credito1AfterScroll(DataSet: TDataSet);
    procedure dblFormaPagamentoClick(Sender: TObject);
    procedure AgenteFin1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
  public
    CdTRN: integer;
    Cancelar: Boolean;    
    Entidade:TPacote_de_Credito;
  end;

var
  fMxPacoteCredito: TfMxPacoteCredito;

implementation
uses UDM,Funcoes, MxSPediProd, CdCliente, DigSenha, MxSRecPedido,
  UPacoteCredito;
{$R *.DFM}

procedure TfMxPacoteCredito.SB_PrimClick(Sender: TObject);
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

procedure TfMxPacoteCredito.SB_AntClick(Sender: TObject);
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

procedure TfMxPacoteCredito.SB_ProxClick(Sender: TObject);
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

procedure TfMxPacoteCredito.SB_UltClick(Sender: TObject);
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

procedure TfMxPacoteCredito.FormCreate(Sender: TObject);
begin
  Entidade:=Pacote_de_Credito1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_PCR_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxPacoteCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_PCR_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  AgenteFin1.Close;
  Forma_de_Pagamento1.Close;
  Parametro1.Close;
  Entidade.Close;
  action:=caFree;
end;

procedure TfMxPacoteCredito.SB_LocPedClick(Sender: TObject);
begin
  Entidade.Selecionar;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtRazaoSocial.Clear;
    edtCNPJCPF.Clear;
    mskFone.Clear;
  end;
end;

procedure TfMxPacoteCredito.SB_NovoPedClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro neste centro de custo.');
  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  dblTipoPagamento.KeyValue:=5;
  dblFormaPagamento.KeyValue:=1;
  dblCodigoAGF.KeyValue:=1;  
  edtRazaoSocial.Clear;
  edtCNPJCPF.Clear;
  mskFone.Clear;
  dblCodigoFUN.setFocus;
end;

procedure TfMxPacoteCredito.SB_ExcPedClick(Sender: TObject);
var
  CdCNC, CdPCR: integer;
  vValor : Double;
  Trans: Boolean;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro neste centro de custo.');
  if cmbSituacao.ItemIndex = 1 then
    Raise exception.Create('Pacote Cancelado!');

  CdCNC := Entidade.CodigoCNC;
  CdPCR := Entidade.CodigoPCR;
  vValor := Entidade.Valor;

  //Atualizar o Crédito
  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
    ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
    Open;
    if IsEmpty then
      Raise exception.Create('Problema com o Cliente!');
    if Credito < vValor then
      Raise exception.Create('Crédito já utilizado! (Restante R$ '+format('%.2f',[Credito])+')');
  end;

  if MessageDlg('Deseja Cancelar esse Pacote de Crédito?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_CREDITO SET '+
        ' PCR_SITUACAO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PCR_CODIGO='+IntToStr(CdPCR));

      with Cliente1 do
      Begin
        if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
          CodigoCNC, CodigoCLI, 1004, CdCNC, CdPCR,0(*CdPDVCNC*),0(*CdPDV*),'D', Credito, vValor) then
        Begin
          ShowMessage('Falha ao Gerar Mov. de Crédito!');
          Raise exception.Create('');
        end;

        ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
          ' CLI_CREDITO='+VirgPonto(Credito-vValor)+
          ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND CLI_CODIGO='+IntToStr(CodigoCLI));
      end;

      //Cancelar título no contas a receber
      With Titulo_receber1 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').AsInteger := CdCNC;
        ParamByName('PDV_CODIGO').AsInteger := CdPCR;
        ParamByName('TRC_TIPO_PEDIDO').AsInteger := 2; //Pacote de Crédito
        Open;
        First;
        if IsEmpty then
          ShowMessage('Pedido sem Títulos abertos ou pagos!');
        While not EOF do
        Begin
          If Situacao IN [0,1] then
          Begin
            //cancelar os titulos
            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_SITUACAO=5 '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',TRC_OBSERVACAO="Exc. Dev PCR por'+DM.Usuario1.NomeUSU+' Excluir" '+
              ' WHERE TRC_CODIGO='+IntToStr(CodigoTRC)+
              ' AND CNC_CODIGO='+IntToStr(CdCNC));
          end
          else If Situacao IN [2,3] then
          Begin
            //Gerar movimento de caixa para os que já foram pagos
            if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC, 0,
                 CodigoCCX,CodigoCCXRecebimento,DM.Configuracao1.CodigoCAX,
                 TipoPag,Tipo,CodigoCNC, 0(*cdCHQCNC*), 0(*CdCHQ*),
                 'Dev PRC-Ext TRC:'+IntToStr(CodigoTRC),
                 '1' (*Flag*),Numero,'',Sequencia,'D',ValorPG+Credcli,
                 0(*Desconto*),0(*Juros*),
                 0(*CredCli*),Valor(*ValorDoc*),
                 DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                 0(*DtCheque*),CodigoTRC,CodigoCNC,'D') then
            Begin
              ShowMessage('Falha ao gerar Mov. Caixa!');
              Raise Exception.Create('');
            end;
          End;
          Next;
        End;
      End;

      If DM.Configuracao1.ControleTransacao then
        Commit;

      Entidade.Close;
      Entidade.Open;
      Entidade.LocalizarCod(CdPCR, CdCNC);
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
end;

procedure TfMxPacoteCredito.SB_SalvaPedClick(Sender: TObject);
var
  Trans,vTemEntrada : Boolean;
  CdCNC, CdPCR, CdCLI, CdCLICNC:integer;
  vValor:Double;
  sCodigoCARTAO: string;
begin
  If not VerificaInteiroBranco(edtCodigoCLI.Text) then
    raise Exception.Create('Selecione um cliente!');
  if cmbSituacao.ItemIndex = 1 then
    Raise exception.Create('Pacote Cancelado!');
  if not VerificaFloatBranco(edtValor.Text) then
    Raise exception.Create('Valor inválido!');

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdPCR := StrToInt(edtCodigoPCR.Text);
  CdCLI := StrToInt(edtCodigoCLI.Text);
  CdCLICNC := StrToInt(edtClienteCNC.Text);
  vValor := StrToFloat(edtValor.Text);

  //Atualizar o Crédito
  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
    ParamByName('CLI_CODIGO').asInteger := StrToInt(edtCodigoCLI.Text);
    Open;
    if IsEmpty then
      Raise exception.Create('Problema com o Cliente (de outro Centro)!');
  end;

  with Informacoes1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Cliente1.CodigoCNC;
    ParamByName('CLI_CODIGO').asInteger := Cliente1.CodigoCLI;
    Open;
  end;

  if (dblTipoPagamento.KeyValue <> 412) and //Boleto Bancário
     ((dblTipoPagamento.KeyValue <> 5) or //Dinheiro/Promissória
      (dblFormaPagamento.KeyValue <> 1)) and //Dif. A Vista
     (Informacoes1.Boleto) then
  Begin
    if MessageDlg('Tipo de Pagamento inválido para o cliente! (Boleto)!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=35;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0)then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão Trocar TipoPag/FormaPag na Venda!');
          end
          else
            DM.Usuario1.GeraLog(6750, CdCNC, CdPCR,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' PACOTE DE CREDITO-TIPO_PAG');
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
      DM.Usuario1.GeraLog(6750, CdCNC, CdPCR,
        'PACOTE DE CREDITO-TIPO_PAG');
  end;

  if (Informacoes1.CodigoFPG > 0) and
     (dblTipoPagamento.KeyValue <> 13) and //Dif. Cartão
     (dblFormaPagamento.KeyValue <> 1) then //Dif. de A Vista
  Begin
    if dblFormaPagamento.KeyValue <> Informacoes1.CodigoFPG then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM FORMA_DE_PAGAMENTO '+
          ' WHERE FPG_CODIGO='+IntToStr(Informacoes1.CodigoFPG);
        Open;
      end;
      if MessageDlg('Forma de Pagamento inválida para o cliente! ('+DM.QR_Consultas.FieldByName('FPG_DESCRICAO').asString+')'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=35;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(6750)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão Trocar TipoPag/FormaPag na Venda!');
            end
            else
              DM.Usuario1.GeraLog(6750, CdCNC, CdPCR,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' PACOTE DE CREDITO-FORMA_PAG');
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
        DM.Usuario1.GeraLog(6750, CdCNC, CdPCR,
          'PACOTE DE CREDITO-FORMA_PAG');
    end;
  end;

  if MessageDlg('Deseja Processar esse Pacote de Crédito?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;

  if (Forma_de_Pagamento1.Prazo[1] = '0') then
    vTemEntrada := True
  else
    vTemEntrada := False;

  Informacoes1.Close;
  Informacoes1.ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
  Informacoes1.ParamByName('CLI_CODIGO').asInteger := CdCLI;
  Informacoes1.Open;
  if Informacoes1.Proibido then
    Raise exception.Create('Cliente Bloqueado!'+#13+'Procure a gerência!');

  if (not ((dblFormaPagamento.KeyValue = 1) and (dblTipoPagamento.KeyValue = 5))) then
  Begin
    if Cliente1.SPC = 1 then
    Begin
      if MessageDlg('Cliente no SPC !!!'+#13+
                    'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=35;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para vender a Cliente no SPC!');
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

    if not Informacoes1.IsEmpty then
    Begin
      with DM.Avalista1 do
      Begin

        if VerificaInteiroBranco(Cliente1.CGFRG) or
           VerificaInteiroBranco(Cliente1.CPFCGC) then
        Begin
          Close;
          SQL.Text := 'SELECT * FROM AVALISTA ' +
            ' WHERE CNC_CODIGO='+IntToStr(Informacoes1.CodigoCNC)+
            ' AND ((AVL_CGF_RG="'+Cliente1.CGFRG+'" AND AVL_CGF_RG<>"") '+
            ' OR (AVL_CGC_CPF="'+Cliente1.CPFCGC+'" AND AVL_CGC_CPF<>""))';
          Open;
          if not IsEmpty then
          Begin
            DM.QR_Consultas.Close;
            DM.QR_Consultas.SQL.Text := 'SELECT T1.CLI_CODIGO '+
              ' FROM INFORMACOES_DE_CREDITO T1 '+
              ' WHERE T1.CNC_CODIGO='+IntToStr(CdCLICNC)+
              ' AND T1.AVL_CODIGO='+IntToStr(CodigoAVL)+
              ' AND EXISTS ' +
              ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
              ' WHERE CNC_CLIENTE=T1.CNC_CODIGO '+
              ' AND CLI_CODIGO=T1.CLI_CODIGO '+
              ' AND TRC_SITUACAO IN (0,1,8,9) '+
              ' AND TRC_VENCIMENTO>"'+MesDia(DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente)+'") ';
            DM.QR_Consultas.Open;
            if not DM.QR_Consultas.IsEmpty then
            Begin
              ShowMessage('Cliente Avalista de Inadiplente! ('+
                DM.QR_Consultas.FieldByName('CLI_CODIGO').AsString+')');
              Exit;
            end;
          end;
        end;
      end;
      if (Informacoes1.CreditoUtil > Informacoes1.LimiteCredito) and
         (Informacoes1.LimiteCredito > 0) then
        Raise Exception.Create('Limite de Crédito Ultrapassado!');
    end
    else
      Raise Exception.Create('Cliente sem Limite de Crédito Definido!');

    Titulo_receber5.Close;
    Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger := CdCLICNC;
    Titulo_receber5.ParamByName('CLI_CODIGO').asInteger  := CdCLI;
    Titulo_receber5.ParamByName('DATA').asDate           := DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente;
    Titulo_receber5.Open;      
    if (not Titulo_receber5.IsEmpty) then
    Begin
      if MessageDlg('Cliente Inadiplente!'+#13+
                    'Deseja Continar?' ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        exit;
      If (not Informacoes1.LiberaInadiplencia) and
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=35;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para vender a Cliente Inadiplente!');
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

  //Selecionar Fator Financeiro
  With FatorFinanceira1 do
  Begin
    Close;
    ParamByName('AGF_CODIGO').AsInteger:=AgenteFin1.CodigoAGF;
    If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
      ParamByName('FAF_NPARC').AsInteger:=Titulo_receber2.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
    Else
      ParamByName('FAF_NPARC').AsInteger:=Titulo_receber2.QtdeTitulos(Forma_de_Pagamento1.Prazo);
    Open;
  End;

  if not Titulo_receber2.Active then
    Titulo_receber2.Open;

  sCodigoCARTAO := '';
  if dblTipoPagamento.KeyValue = 13 then //Cartao
  Begin
    sCodigoCARTAO := Trim(UpperCase(InputBox('Comprovante de Venda' , 'CV:', '')));
    if Length(sCodigoCARTAO) < 5 then
      Raise exception.Create('Comprovante de Venda (CV) inválido!');
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

      if dblFormaPagamento.KeyValue = 1 then //A Vista
      Begin
        if not Titulo_receber2.GerarTitVista(CdCLICNC, CdCLI, ''(*CartaoCV*), vValor,'','TRC_CODIGO', 2(*TipoPedido*)) then
        Begin
          ShowMessage('Não foi possível gerar Título à Vista!');
          Raise exception.Create('');
        end;
      end
      else if dblTipoPagamento.KeyValue = 13 then //Cartão
      Begin
        if not Titulo_receber2.GerarTitPrazo(CdCLICNC, CdCLI, sCodigoCARTAO, vValor,0,vTemEntrada,True,'','TRC_CODIGO',2(*TipoPedido*)) then
        Begin
          ShowMessage('Não foi possível gerar Título Cartão!');
          Raise exception.Create('');
        end;
      end
      else
      Begin
        if not Titulo_receber2.GerarTitPrazo(CdCLICNC, CdCLI, ''(*CartaoCV*), vValor,0,vTemEntrada,False,'','TRC_CODIGO',2(*TipoPedido*)) then
        Begin
          ShowMessage('Não foi possível gerar Título à Prazo!');
          Raise exception.Create('');
        end;
      end;

      if not Entidade.FinalizaEdicao then
        Raise exception.Create('');

      with Cliente1 do
      Begin
        if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
          CodigoCNC, CodigoCLI, 1000, CdCNC, CdPCR,0(*CdPDVCNC*),0(*CdPDV*), 'C', Credito, vValor) then
        Begin
          ShowMessage('Falha ao Gerar Mov. de Crédito!');
          Raise exception.Create('');
        end;


        ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
          ' CLI_CREDITO='+VirgPonto(Credito+vValor)+
          ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND CLI_CODIGO='+IntToStr(CodigoCLI));
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;

      AtualizaControles(1, False);
      with Entidade do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM PACOTE_DE_CREDITO '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PCR_CODIGO='+IntToStr(CdPCR);
        Open;
      end;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          Exit;
        end;
    end;
  End;
  //Verificar os títulos a receber
  If MessageDlg('Deseja ver os títulos desse Cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    Application.CreateForm(TfMxSRecPed, fMxSRecPed);
    with fMxSRecPed do
    Begin
      Tag :=8;
      edtCodigoCLI.Text     :=  IntToStr(self.Cliente1.CodigoCLI);
      edtRazaoSocial.Text   :=  self.Cliente1.RazaoSocial;
      mskCNPJ_CPF.Text      :=  self.Cliente1.CPFCGC;
      edtCGF_RG.Text        :=  self.Cliente1.CGFRG;
      edtObservacaoCLI.Text :=  self.Cliente1.OBS;
      Cliente1.Close;
      Cliente1.ParamByName('CNC_CODIGO').AsInteger := self.Cliente1.CodigoCNC;
      Cliente1.ParamByName('CLI_CODIGO').AsInteger := self.Cliente1.CodigoCLI;
      ShowModal;
    end;
  end;
end;

procedure TfMxPacoteCredito.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
  if Entidade.IsEmpty then
  Begin
    edtRazaoSocial.Clear;
    edtCNPJCPF.Clear;
    mskFone.Clear;
  end;
end;

procedure TfMxPacoteCredito.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxPacoteCredito.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Vendedor1.Open;
  FatorFinanceira2.Open;
  Parametro1.Open;
  Forma_de_pagamento1.Open;
  AgenteFin1.Open;
  Entidade.Open;    
  cmbCampo.ItemIndex:=0;
  edtLocalizar.SetFocus;
end;

procedure TfMxPacoteCredito.edtCodigoCLIExit(Sender: TObject);
begin
  If SB_CancPed.Focused then
    Exit;

  edtRazaoSocial.Clear;
  edtCNPJCPF.Clear;
  mskFone.Clear;

  if not VerificaInteiroBranco(edtCodigoCLI.text) then
  Begin
    Showmessage('Código de Cliente inválido');
    edtCodigoCLI.SetFocus;
    Exit;
  End;

  if StrToInt(edtClienteCNC.Text) <> DM.Configuracao1.CodigoCNC then
  Begin
    ShowMessage('Não é possível cliente de outro centro de custo!');
    edtCodigoCLI.SetFocus;
    Exit;
  end;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger:=StrToInt(edtClienteCNC.Text);
    ParamByName('CLI_CODIGO').asInteger:=StrToInt(edtCodigoCLI.Text);
    Open;
    if IsEmpty then
    Begin
      ShowMessage('Cliente inválido');
      edtCodigoCLI.SetFocus;
      Exit;
    end
    else if CodigoCLI = DM.Configuracao1.CodigoCliAVista then
    Begin
      ShowMessage('Cliente Balcão');
      edtCodigoCLI.SetFocus;
      Exit;
    end
    else
    Begin
      edtRazaoSocial.Text:=Cliente1.RazaoSocial;
      edtCNPJCPF.Text := Cliente1.CPFCGC;
      mskFone.Text:=Cliente1.Fone;
      if (dblCodigoFUN.Text = '') and
         VerificaInteiroBranco(Cliente1.Conjuge) then
        dblCodigoFUN.KeyValue := StrToInt(Cliente1.Conjuge);
    end;
    with Informacoes1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Cliente1.CodigoCNC;
      ParamByName('CLI_CODIGO').asInteger := Cliente1.CodigoCLI;
      Open;
    end;
  end;
end;

procedure TfMxPacoteCredito.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxPacoteCredito.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If (SB_SalvaPed.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxPacoteCredito.SB_ImprimirClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Pacote de Crédito!');

  Application.CreateForm(Trpt_PacoteCredito, rpt_PacoteCredito);
  with rpt_PacoteCredito do
  Begin
    tag := 1;
    zrlFiltros.Caption := '(PCR:'+IntToStr(self.Entidade.CodigoPCR)+')';
    SZRLabel5.Caption  := DateToStr(self.Entidade.DataCadastro);
    SZRLabel7.Caption  := DateToStr(self.Entidade.DataCadastro);
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM PACOTE_DE_CREDITO '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND PCR_CODIGO='+IntToStr(self.Entidade.CodigoPCR)+
      ' ORDER BY CLI_CODIGO, PCR_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta Vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxPacoteCredito.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else
      Close;
  end
  else If key=chr(13) then
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end;
  end
  else if key=chr(32) then
  Begin
    if edtCodigoCLI.Focused then
    Begin
      edtCodigoCLI.Clear;
      key:=chr(0);
      Application.CreateForm(TfCadCli, fCadCli);
      with fCadCli do
      Begin
        tag:=32;
        if DM.Configuracao1.Empresa = empLBM then
          dblCentroDeCusto.KeyValue := '1'
        else
          dblCentroDeCusto.KeyValue:=StrToInt(edtClienteCNC.Text);
        Showmodal;
        edtCodigoCLIExit(sender);
      end;
    end;
  end;
end;

procedure TfMxPacoteCredito.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirPed.Enabled    := not Habilitar;
  ExcluirPed.Enabled    := not Habilitar;
  SalvarPed.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarPed.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarPed.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoPed.Enabled    := not Habilitar;
  SB_LocPed.Enabled     := not Habilitar;
  SB_ExcPed.Enabled     := not Habilitar;
  SB_SalvaPed.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled    := ((Cabecalho=1) and Habilitar);

  SB_Imprimir.Enabled   := not Habilitar;
  SB_Fechar.Enabled     := not Habilitar;

  edtLocalizar.Enabled := not Habilitar;
  if Habilitar then
    edtLocalizar.Color := AlteraCorComponentes
  else
    edtLocalizar.Color := clWindow;
  cmbCampo.Enabled     := not Habilitar;
  if Habilitar then
    cmbCampo.Color     :=AlteraCorComponentes
  else
    cmbCampo.Color     :=clWindow;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfMxPacoteCredito.Pacote_de_Credito1CalcFields(
  DataSet: TDataSet);
begin
  with Cliente1 do
  Begin
    if (CodigoCNC <> Entidade.ClienteCNC) or
       (CodigoCLI <> Entidade.CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    Entidade.FieldByName('Cliente').asString := RazaoSocial;
    Entidade.FieldByName('CNPJ').asString    := CPFCGC;
    Entidade.FieldByName('Fone').asString    := Fone;
    Entidade.FieldByName('Credito').asString    := format('%.2f',[Credito]);
  end;

  with Informacoes1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Cliente1.CodigoCNC;
    ParamByName('CLI_CODIGO').asInteger := Cliente1.CodigoCLI;
    Open;
  end;

  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxPacoteCredito.Pacote_de_Credito1AfterScroll(
  DataSet: TDataSet);
begin
  if Entidade.IsEmpty then
  Begin
    edtRazaoSocial.Clear;
    edtCNPJCPF.Clear;
    mskFone.Clear;
    cmbSituacao.ItemIndex:=-1;
  end
  else
  Begin
    Entidade.CarregaDados;
    edtRazaoSocial.Text := Entidade.FieldByName('Cliente').asString;
    edtCNPJCPF.Text := Entidade.FieldByName('CNPJ').asString;
    mskFone.Text := Entidade.FieldByName('Fone').asString;
  end;
end;

procedure TfMxPacoteCredito.dblFormaPagamentoClick(Sender: TObject);
begin
  if dblCodigoAGF.Enabled then
    dblCodigoAGF.KeyValue:=0;
    
  if (dblTipoPagamento.KeyValue = 5) then //Dinheiro/Promissória
  Begin
    With AgenteFin1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
        ' WHERE AGF_CODIGO=1 '; //LOJA
      Open;
    end;
    if dblFormaPagamento.Text = '' then
      dblFormaPagamento.KeyValue := 1; //Á Vista

    if dblCodigoAGF.Enabled then
      dblCodigoAGF.KeyValue := 1;
  end
  else
  Begin
    dblFormaPagamento.Enabled := True;
    If dblTipoPagamento.KeyValue = 13 then //Cartão
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
          ' WHERE AGF_DIA_PAGAMENTO > 0 '+
          ' AND AGF_CODIGO<>1';
        Open;
      End;
      if dblTipoPagamento.Focused then
      Begin
        dblFormaPagamento.KeyValue := 8; // Forma em 0 + 1
        dblCodigoAGF.KeyValue := 8; //Mastercard
      end;
    end
    Else if dblTipoPagamento.KeyValue = 6 then//Cheque
    Begin
      if dblFormaPagamento.KeyValue = 1 then //AVISTA
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
            ' WHERE AGF_CODIGO=1'; //LOJA
          Open;
          dblCodigoAGF.KeyValue:=1;
        End
      else if dblFormaPagamento.KeyValue > 1 then
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
            ' WHERE AGF_CODIGO=6'; //Cheque-PRE
          Open;
          dblCodigoAGF.KeyValue:=6;
        End;
    end
    else
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
          ' WHERE (AGF_DIA_PAGAMENTO = 0 OR AGF_DIA_PAGAMENTO IS NULL) '+
          ' AND AGF_CODIGO<>1 '+  //Diferente de LOJA
          ' AND AGF_CODIGO<>6';   //Diferente de Cheque-Pre
        Open;
      End;
      if dblTipoPagamento.KeyValue = 412 then //Boleto
        if dblCodigoAGF.Enabled then
          dblCodigoAGF.KeyValue:=2 //Banco do Brasil
    end;
  End;
end;

procedure TfMxPacoteCredito.AgenteFin1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  nparc:Integer;
begin
  if (Forma_de_Pagamento1.Prazo <> '') then
  Begin
    nparc:=Titulo_receber2.QtdeTitulos(Forma_de_Pagamento1.Prazo);
    If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
      Accept:=FatorFinanceira2.LocalizarNParc(AgenteFin1.CodigoAGF, nparc-1)
    else
      Accept:=FatorFinanceira2.LocalizarNParc(AgenteFin1.CodigoAGF, nparc);
  end;
end;

procedure TfMxPacoteCredito.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
