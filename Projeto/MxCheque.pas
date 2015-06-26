unit MxCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, NotaFiscal, Menus, Cheque, Conta,
  Banco, CentroCusto, Agencia, Usuario, VSSComm32, Titulo_receber,
  Titulo_a_Pagar, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfMxCheque = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoCHQ: TEdit;
    Label4: TLabel;
    edtValor: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    memObservacao: TMemo;
    Label11: TLabel;
    Label8: TLabel;
    mskDataCheque: TMaskEdit;
    Panel1: TPanel;
    SB_LocCab: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_NovoCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_ExcCab: TSpeedButton;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Label10: TLabel;
    cmbTipo: TComboBox;
    SB_ImprimirCheque: TSpeedButton;
    Cheque1: TCheque;
    Ds_Cheque: TDataSource;
    cmbSituacao: TComboBox;
    Cheque1CHQ_CODIGO: TIntegerField;
    Cheque1CNC_CODIGO: TIntegerField;
    Cheque1CHQ_NUMERO: TStringField;
    Cheque1CHQ_VALOR: TFloatField;
    Cheque1CHQ_DATA: TDateTimeField;
    Cheque1CHQ_SITUACAO: TIntegerField;
    Cheque1CHQ_OBSERVACAO: TStringField;
    Cheque1CHQ_CNC_TITULO: TIntegerField;
    Cheque1CHQ_COD_TITULO: TIntegerField;
    Cheque1CHQ_TERCEIRO: TIntegerField;
    Cheque1CHQ_ER: TStringField;
    ckbTerceiro: TCheckBox;
    edtTitulo: TEdit;
    Label2: TLabel;
    edtTituloCNC: TEdit;
    Label5: TLabel;
    SB_FecharCab: TSpeedButton;
    Cheque1USU_CODIGO: TIntegerField;
    Cheque1CHQ_DT_ALTERADO: TDateTimeField;
    Cheque1CHQ_DT_CADASTRO: TDateTimeField;
    Cheque1Usuario: TStringField;
    Label3: TLabel;
    edtNominal: TEdit;
    mskNumero: TMaskEdit;
    Cheque1CHQ_NOMINAL: TStringField;
    Cheque1CHQ_DONO_CHEQUE: TStringField;
    Cheque1Centro: TStringField;
    Label9: TLabel;
    edtDonoCheque: TEdit;
    CentroCusto2: TCentroCusto;
    SB_CopiaCheque: TSpeedButton;
    SB_DevolverCab: TSpeedButton;
    SB_ReapresentarCab: TSpeedButton;
    VSSComm321: TVSSComm32;
    edtCodigoBarras: TEdit;
    mskComp: TMaskEdit;
    Label12: TLabel;
    mskBanco: TMaskEdit;
    Label13: TLabel;
    mskAgencia: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    mskC1: TMaskEdit;
    mskConta: TMaskEdit;
    Label16: TLabel;
    Label17: TLabel;
    mskC2: TMaskEdit;
    Label18: TLabel;
    mskC3: TMaskEdit;
    Cheque1CBN_NUMERO: TIntegerField;
    Cheque1BNC_NUMERO: TIntegerField;
    Cheque1AGN_NUMERO: TIntegerField;
    Cheque1CHQ_COMP: TIntegerField;
    Cheque1CHQ_BANCO: TIntegerField;
    Cheque1CHQ_AGENCIA: TIntegerField;
    Cheque1CHQ_C1: TIntegerField;
    Cheque1CHQ_CONTA: TIntegerField;
    Cheque1CHQ_C2: TIntegerField;
    Cheque1CHQ_C3: TIntegerField;
    Cheque1CHQ_CODIGO_BARRAS: TStringField;
    SB_VersoCheque: TSpeedButton;
    Cheque1CHQ_ENVIADO: TIntegerField;
    Cheque1CHQ_DT_ENVIADO: TDateTimeField;
    Cheque1CHQ_UTILIZADO: TIntegerField;
    Cheque1CNC_CLIENTE: TIntegerField;
    Cheque1CLI_CODIGO: TIntegerField;
    Label21: TLabel;
    edtCodigoCLI: TEdit;
    edtClienteCNC: TEdit;
    Cheque1Saldo: TStringField;
    Cheque1CNC_FACTORING: TIntegerField;
    Cheque1FCT_CODIGO: TIntegerField;
    Titulo_receber1: TTitulo_receber;
    Cliente1: TCliente;
    Titulo_a_pagar1: TTitulo_a_pagar;
    bitConfirmar: TBitBtn;
    Cheque1CHQ_CPF_CNPJ: TStringField;
    Label22: TLabel;
    mskCPF_CNPJ: TMaskEdit;
    SB_Gerar: TSpeedButton;
    Query: TQuery;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    ImprimirCab: TAction;
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbTipoClick(Sender: TObject);
    procedure Cheque1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SB_FecharCabClick(Sender: TObject);
    procedure SB_ImprimirChequeClick(Sender: TObject);
    procedure Cheque1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Cheque1BeforeOpen(DataSet: TDataSet);
    procedure SB_DevolverCabClick(Sender: TObject);
    procedure SB_ReapresentarCabClick(Sender: TObject);
    procedure SB_CopiaChequeClick(Sender: TObject);
    procedure VSSComm321ReceiveData(Buffer: Pointer; BufferLength: Word);
    procedure SB_VersoChequeClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbTerceiroClick(Sender: TObject);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure SB_GerarClick(Sender: TObject);
    procedure edtTituloKeyPress(Sender: TObject; var Key: Char);
    procedure ChequeCabClick(Sender: TObject);
  private
    UltimoChequeImpresso, sProprietario, sCPFCNPJ : string;
    CdCNC, CdTRC, CdCLICNC, CdCLI: integer;
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
  public
    Cancelar, vPagarTPG: Boolean;
    Entidade:TCheque;
    CdCNCCLITRC, CdCLITRC: integer;
  end;

var
  fMxCheque: TfMxCheque;

implementation
Uses
  UDM, Funcoes, MxItemNF, MxSRecParcela, MxSRecPedido, MxReceber,
  UImprimirCheque, UImprimirChequeBB, UImprimirChequeBNB,
  UImprimirChequeCEF, UImprimirChequeBEC, UImprimirCopiaCheque,
  MxImpresoraCheque, MxPagBai, CdCliente, RTLConsts, MxFactoring,
  UImprimirChequeBradesco, DigSenha, UImprimirChequeReal,
  MxPagar, MxPagarAvulsoCPD1, MxRecebAvulsoCPD1;
{$R *.DFM}

procedure TfMxCheque.SB_NovoCabClick(Sender: TObject);
begin
  if cmbTipo.ItemIndex = 0 then //Emitido
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(7010)) < 0 then
      Raise Exception.Create('O usuário não tem permissão para inserir cheque emitido!');
  end
  else
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6650)) < 0 then
      Raise Exception.Create('O usuário não tem permissão para inserir cheque recebido!');
  end;

  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir cheques neste centro de custo!');
  try
    if CdCNC = 0 then
      CdCNC := StrToInt(edtTituloCNC.Text);
  except
    CdCNC := 0;
  end;
  try
    if CdTRC = 0 then
      CdTRC := StrToInt(edtTitulo.Text);
  except
    CdTRC := 0;
  end;
  try
    if CdCLICNC = 0 then
      CdCLICNC := StrToInt(edtClienteCNC.Text);
  except
    CdCLICNC := 0;
  end;
  try
    if CdCLI = 0 then
      CdCLI := StrToInt(edtCodigoCLI.Text);
  except
    CdCLI := 0
  end;
  if sProprietario = '' then
  Begin
    sProprietario := edtDonoCheque.Text;
    sCPFCNPJ := mskCPF_CNPJ.Text;
  end;
  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  edtTituloCNC.Text := IntToStr(CdCNC);
  edtTitulo.Text := IntToStr(CdTRC);
  edtClienteCNC.Text  := IntToStr(CdCLICNC);
  edtCodigoCLI.Text   := IntToStr(CdCLI);
  edtDonoCheque.Text := sProprietario;
  mskCPF_CNPJ.Text := sCPFCNPJ;
  if cmbTipo.ItemIndex = 0 then
    cmbSituacao.ItemIndex := 1
  else
  Begin
    cmbSituacao.ItemIndex := 0;
    if DM.Configuracao1.Empresa = 1 then
      edtNominal.Text := ''
    else if DM.Configuracao1.Empresa = 2 then
      edtNominal.Text := 'PETROMAX'
    else if DM.Configuracao1.Empresa = empLBM then
    Begin
      if DM.Configuracao1.CodigoCNC <> 3 then //<> Serviço
        edtNominal.Text := 'LBM'
      else
        edtNominal.Text := 'LBM SERVICOS';
    end
    else if DM.Configuracao1.Empresa = empMotical then
      edtNominal.Text := 'MOTICAL'
    else if DM.Configuracao1.Empresa = empCreator then
      edtNominal.Text := 'CREATOR'
    else if DM.Configuracao1.Empresa = empAndrea then
      edtNominal.Text := ''
    else if DM.Configuracao1.Empresa = empLuciano then
      edtNominal.Text := ''
    else if DM.Configuracao1.Empresa = empHope then
      edtNominal.Text := 'HOPE';
  end;

  try
    mskBanco.SetFocus;
  except
  end;

  if DM.Configuracao1.LeitoraCheque > 0 then
  Begin
    try
      VSSComm321.StopComm;
    except
    end;
    try
      VSSComm321.StartComm;
    except
      ShowMessage('Falha ao abrir a porta COM'+IntToStr(DM.Configuracao1.LeitoraCheque));
    end;
  end;
end;

procedure TfMxCheque.SB_AltCabClick(Sender: TObject);
begin
  if cmbTipo.ItemIndex = 0 then //Emitido
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(7020)) < 0 then
      Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  end
  else
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6670)) < 0 then
      Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  end;

  if Entidade.isEmpty then
    Raise Exception.Create('Selecione o Cheque primeiro!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar cheques neste centro de custo!');

  if Entidade.Utilizado then
  Begin
    if Arredonda(Entidade.FieldByName('Saldo').asFloat) <> Arredonda(Entidade.Valor) then
      Raise exception.Create('Não é permitido alterar um cheque com saldo!');
  end;

  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  try
    if edtCodigoBarras.Text <> '' then
    Begin
      mskComp.Enabled := False;
      mskBanco.Enabled := False;
      mskAgencia.Enabled := False;
      mskC1.Enabled := False;
      mskConta.Enabled := False;
      mskC2.Enabled := False;
      mskNumero.Enabled := False;
      mskC3.Enabled := False;
      mskDataCheque.SetFocus;
    end
    else
      mskBanco.SetFocus;
  except
  end;
end;

procedure TfMxCheque.SB_ExcCabClick(Sender: TObject);
var
  CdCNC, CdCHQ, CdCLICNC, CdCLI: integer;
  vValor: Double;
  vNumero: string;
  Trans: Boolean;
begin
  if Entidade.isEmpty then
    Raise Exception.Create('Selecione o Cheque primeiro!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode excluir cheques neste centro de custo!');

  if cmbTipo.ItemIndex = 0 then //Emitido
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(7030)) < 0 then
      Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  end
  else
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6680)) < 0 then
      Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  end;

  if Entidade.Utilizado then
  Begin
    if Arredonda(Entidade.FieldByName('Saldo').asFloat) <> Arredonda(Entidade.Valor) then
      Raise exception.Create('Não é permitido excluir um cheque com saldo!');
  end;

  CdCNC := Entidade.CodigoCNC;
  CdCHQ := Entidade.CodigoCHQ;
  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;
  vNumero  := Entidade.Numero;
  vValor   := Entidade.Valor;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      ExecutaSQL(DM.QR_Comandos,'DELETE FROM CHEQUE '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
         ' AND CHQ_CODIGO='+IntToStr(CdCHQ));

      if not Entidade.GeraLog(6680, CdCNC, CdCHQ, 'Numero: '+vNumero+' Valor: '+format('%.2f',[vValor])) then
      Begin
        ShowMessage('Falha ao registrar Log!');
        Raise exception.Create('');
      end;

      if not Entidade.RegistrarDel(CdCNC,1230,CdCHQ,'CLICNC:'+IntToStr(CdCLICNC)+' CLI:'+IntToStr(CdCLI)+
                                   ' Valor: '+format('%.2f',[vValor])) then
      Begin
        ShowMessage('Falha ao registrar Del!');
        Raise exception.Create('');
      end;


      If DM.Configuracao1.ControleTransacao then
        Commit;

      Entidade.Close;
      Entidade.Open;
      ShowMessage('Cheque Excluído!');
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  end;

  if Entidade.IsEmpty then
  Begin
    edtCodigoCHQ.Clear;
    cmbSituacao.ItemIndex:=-1;
  end;
end;

procedure TfMxCheque.SB_SalvaCabClick(Sender: TObject);
var
  CHQ:integer;
  NUM, mensagem:string;
begin
  CHQ:=StrToInt(edtCodigoCHQ.Text);
  NUM:=mskNumero.Text;
  mensagem := '';
  if edtCodigoBarras.Text = '' then
  Begin
    if mskComp.Text = '' then
      mensagem := mensagem + 'Comp inválido!'+#13;
    if mskBanco.Text = '' then
      mensagem := mensagem + 'Banco inválido!'+#13;
    if mskAgencia.Text = '' then
      mensagem := mensagem + 'Agência inválida!'+#13;
    if mskC1.Text = '' then
      mensagem := mensagem + 'C1 inválido!'+#13;
    if mskConta.Text = '' then
      mensagem := mensagem + 'Conta inválida!'+#13;
    if mskC2.Text = '' then
      mensagem := mensagem + 'C2 inválido!'+#13;
    if mskNumero.Text = '' then
      mensagem := mensagem + 'Número do Cheque inválido!'+#13;
    if mskC3.Text = '' then
      mensagem := mensagem + 'C3 inválido!'+#13;
  end;

  if mensagem <> '' then
    Raise exception.Create(mensagem);

  try
    if (DM.Configuracao1.Empresa = empLBM) and
       (StrToFloat(edtValor.Text)>=5000) and //Limite que os bancos cobram multa
       (cmbTipo.ItemIndex = 0) then //Emitido
    Begin
      ShowMessage('Valor acima do limite de R$ 5.000,00 !!!');
      if DM.Configuracao1.Empresa <> empMotical then
        Exit;
    end;
  except
  end;
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(1,False);
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM CHEQUE '+
      ' WHERE CHQ_CODIGO='+IntToStr(CHQ)+
      ' AND CHQ_ER=:CER';
    Entidade.Open;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxCheque.SB_CancCabClick(Sender: TObject);
begin
  try
    if CdCNC = 0 then
      CdCNC := StrToInt(edtTituloCNC.Text);
  except
    CdCNC := 0;
  end;
  try
    if CdTRC = 0 then
      CdTRC := StrToInt(edtTitulo.Text);
  except
    CdTRC := 0;
  end;
  try
    if CdCLICNC = 0 then
      CdCLICNC := StrToInt(edtClienteCNC.Text);
  except
    CdCLICNC := 0;
  end;
  try
    if CdCLI = 0 then
      CdCLI := StrToInt(edtCodigoCLI.Text);
  except
    CdCLI := 0
  end;
  if sProprietario = '' then
  Begin
    sProprietario := edtDonoCheque.Text;
    sCPFCNPJ := mskCPF_CNPJ.Text;
  end
  else
  Begin
    sProprietario := '';
    sCPFCNPJ := '';
  end;
    
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
end;


procedure TfMxCheque.FormCreate(Sender: TObject);
begin
  CdCNCCLITRC := 0;
  CdCLITRC := 0;
  vPagarTPG := False;
  Entidade:=Cheque1;
  UltimoChequeImpresso := '';
  Entidade.Selecao.Text :=' AND CHQ_ER=:cER ';
end;

procedure TfMxCheque.SB_LocCabClick(Sender: TObject);
begin
  if cmbCampo.ItemIndex = 9 then //Código Compra
  Begin
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      Raise exception.Create('Código inválido!');

    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM CHEQUE CHQ '+
      ' WHERE EXISTS (SELECT TPG.TPG_CODIGO '+
      '               FROM TITULO_A_PAGAR TPG '+
      '               WHERE TPG.PCP_CODIGO='+edtLocalizar.Text+
      '               AND TPG.CNC_CODIGO=CHQ.CHQ_CNC_TITULO '+
      '               AND TPG.TPG_CODIGO=CHQ.CHQ_COD_TITULO) '+
      ' AND CHQ_ER=:CER';
    Entidade.Open;
  end
  else
    Entidade.Selecionar;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos
  else
    Entidade.CarregaDados;
end;

procedure TfMxCheque.Cliente1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxCheque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;


procedure TfMxCheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxCheque.cmbTipoClick(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    edtCodigoCHQ.Clear;
    edtTitulo.Clear;
    mskNumero.Clear;
    edtValor.Clear;
    memObservacao.Clear;
    edtTituloCNC.Clear;
    mskDataCheque.Clear;
    ckbTerceiro.Checked := False;
    cmbSituacao.ItemIndex:=-1;
  end;
end;

procedure TfMxCheque.Cheque1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxCheque.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa <> empEletro then
    SB_Gerar.Visible := False;
    
  if tag = 0 then
    bitConfirmar.Visible := false;
  if (tag = 3) or (tag = 5) then
    cmbTipo.ItemIndex:=0    //Cheque Emitido
  else
    cmbTipo.ItemIndex:=1;   //Cheque Recebido
  if Tag = 7 then //Factoring
  Begin
    DBGrid5.Options := DBGrid5.Options + [dgMultiSelect];
    Entidade.Selecao.Text :=' AND CHQ_ER=:cER AND (FCT_CODIGO=0 OR FCT_CODIGO IS NULL) ';
  end;
  if not Entidade.Active then
    Entidade.Active:=true;
  cmbCampo.ItemIndex:=1;
  if SB_NovoCab.Enabled then
  begin
    try
      edtLocalizar.SetFocus;
    except
    end;
  end
  else
    try
      mskBanco.SetFocus;
    except
    end;
end;

procedure TfMxCheque.SB_FecharCabClick(Sender: TObject);
begin
  Close;                        
end;

procedure TfMxCheque.SB_ImprimirChequeClick(Sender: TObject);
var
  vImprimirTodos: Boolean;
begin
  if Entidade.isEmpty then
    Raise Exception.Create('Selecione o Cheque primeiro!');

  if DM.Configuracao1.ImpCheque <= 0 then
  Begin
    if Entidade.Banco = 1 then //Banco do Brasil
    Begin
      if MessageDlg('Deseja imprimir todos os cheques selecionados?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        vImprimirTodos := False
      else
        vImprimirTodos := True;
        
      Application.CreateForm(Trpt_ImprimirChequeBB,rpt_ImprimirChequeBB);
      with rpt_ImprimirChequeBB do
      Begin
        Tag:=0;
        Entidade.Close;
        if not vImprimirTodos then
        Begin
          Entidade.ParamByName('CNC_CODIGO').asInteger := fMxCheque.Entidade.CodigoCNC;
          Entidade.ParamByName('CHQ_CODIGO').asInteger := fMxCheque.Entidade.CodigoCHQ;
          report.Height := 23;
        end
        else
        Begin
//          zrlObservado.Enabled := False;
          zrbDetalhe.Height := 18;
          Entidade.SQL.Text := self.Entidade.SQL.Text;
          if cmbTipo.ItemIndex = 0 then
            Entidade.ParamByName('cER').asString := 'E'
          else
            Entidade.ParamByName('cER').asString := 'R';
        end;
        Entidade.Open;
        if Entidade.isEmpty then
          Raise exception.Create('Consulta vazia!');
        if vImprimirTodos then          
        report.Height := 18*Entidade.RecordCount;        
        report.Preview;
        Close;
      end;
    end
    else if Entidade.Banco = 4 then //Banco do Nordeste
    Begin
      Application.CreateForm(Trpt_ImprimirChequeBNB,rpt_ImprimirChequeBNB);
      with rpt_ImprimirChequeBNB do
      Begin
        Tag:=0;
        Entidade.Close;
        Entidade.ParamByName('CNC_CODIGO').asInteger := fMxCheque.Entidade.CodigoCNC;
        Entidade.ParamByName('CHQ_CODIGO').asInteger := fMxCheque.Entidade.CodigoCHQ;
        Entidade.Open;
        report.Preview;
        Close;
      end;
    end
    else if Entidade.Banco = 104 then //CEF
    Begin
      Application.CreateForm(Trpt_ImprimirChequeCEF,rpt_ImprimirChequeCEF);
      with rpt_ImprimirChequeCEF do
      Begin
        Tag:=0;
        Entidade.Close;
        Entidade.ParamByName('CNC_CODIGO').asInteger := fMxCheque.Entidade.CodigoCNC;
        Entidade.ParamByName('CHQ_CODIGO').asInteger := fMxCheque.Entidade.CodigoCHQ;
        Entidade.Open;
        report.Preview;
        Close;
      end;
    end
    else if Entidade.Banco = 35 then //BEC
    Begin
      Application.CreateForm(Trpt_ImprimirChequeBEC,rpt_ImprimirChequeBEC);
      with rpt_ImprimirChequeBEC do
      Begin
        Tag:=0;
        Entidade.Close;
        Entidade.ParamByName('CNC_CODIGO').asInteger := fMxCheque.Entidade.CodigoCNC;
        Entidade.ParamByName('CHQ_CODIGO').asInteger := fMxCheque.Entidade.CodigoCHQ;
        Entidade.Open;
        report.Preview;
        Close;
      end;
    end
    else if Entidade.Banco = 237 then //Bradesco
    Begin
      Application.CreateForm(Trpt_ImprimirChequeBradesco,rpt_ImprimirChequeBradesco);
      with rpt_ImprimirChequeBradesco do
      Begin
        Tag:=0;
        Entidade.Close;
        Entidade.ParamByName('CNC_CODIGO').asInteger := fMxCheque.Entidade.CodigoCNC;
        Entidade.ParamByName('CHQ_CODIGO').asInteger := fMxCheque.Entidade.CodigoCHQ;
        Entidade.Open;
        report.Preview;
        Close;
      end;
    end
    else if Entidade.Banco = 356 then //Real
    Begin
      Application.CreateForm(Trpt_ImprimirChequeReal,rpt_ImprimirChequeReal);
      with rpt_ImprimirChequeReal do
      Begin
        Tag:=0;
        Entidade.Close;
        Entidade.ParamByName('CNC_CODIGO').asInteger := fMxCheque.Entidade.CodigoCNC;
        Entidade.ParamByName('CHQ_CODIGO').asInteger := fMxCheque.Entidade.CodigoCHQ;
        Entidade.Open;
        report.Preview;
        Close;
      end;
    end
    else
      ShowMessage('Cheque do Banco '+IntToStr(Entidade.Banco)+' não cadastrado para impressão!');
  end
  else
  Begin
    try
      Application.CreateForm(TfMxImpressoraCheque, fMxImpressoraCheque);
      with fMxImpressoraCheque do
      Begin
        Banco    := Entidade.Banco;
        Favorecido := Entidade.Nominal;
        Cidade     := DM.CentroCusto1.Cidade;
        Data       := Entidade.Data;
        Valor      := Entidade.Valor;
        if UltimoChequeImpresso <> Entidade.Numero then
          Tag := 0
        else
          Tag := 1;
        ShowModal;
        UltimoChequeImpresso := Entidade.Nominal;
      end;
    except
    end;
  end;
end;

procedure TfMxCheque.Cheque1CalcFields(DataSet: TDataSet);
var
  vSaldo: Double;
begin
  Entidade.FieldByName('Usuario').asString:= DM.NomeUsuario(Entidade.CodigoUSU);

  with CentroCusto2 do
  Begin
    if (not Active) or
       (Entidade.CodigoCNC <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
    end;
    Entidade.FieldByName('Centro').asString := RazaoSocial;
  end;

  //Calcular Saldo
  vSaldo := CalculaSaldoCheque(DM.QR_Consultas, Entidade.CodigoCNC, Entidade.CodigoCHQ,vPagarTPG);
  Entidade.FieldByName('Saldo').asString := format('%.2f',[vSaldo]);
end;

procedure TfMxCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancCab.Enabled then
    Begin
      try
        SB_CancCab.SetFocus;
      except
      end;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if key=chr(13) then
    if (not memObservacao.Focused) and
       (SB_SalvaCab.Enabled) then
    Begin
      try
        SB_SalvaCab.SetFocus;
      except
      end;
      SB_SalvaCabClick(sender);
    end
    else if bitConfirmar.Visible then
    Begin
      try
        bitConfirmar.SetFocus;
      except
      end;
      bitConfirmarClick(sender);
    end;
end;

procedure TfMxCheque.Cheque1BeforeOpen(DataSet: TDataSet);
begin
  try
    if cmbTipo.ItemIndex = 0 then
      Entidade.ParamByName('cER').asString := 'E'
    else
      Entidade.ParamByName('cER').asString := 'R';
  except
  end;
  try
//    Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxCheque.SB_DevolverCabClick(Sender: TObject);
var
  CaixaCNC, CdCNC, CdTRC, CdTPG, CdCLICNC, CdCLI, CdCHQCNC, CdCHQ, iTipoMovCHQ, vUsuAut: integer;
  Trans, vAberturaParcial: Boolean;
  sTitulo: string;
begin
  if Entidade.isEmpty then
    Raise Exception.Create('Selecione o Cheque primeiro!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode excluir cheques neste centro de custo!');

  //0 Recebido; 1 Entregue; 2 Descontado; 3 Devolvido 1º vez; 4 Devolvido 2º vez; 5 Re-Apresentado
  if Entidade.Situacao in [1,2,4] then
    Raise Exception.Create('Situação impossível para ser devolvido!!');

  CdCHQCNC := Entidade.CodigoCNC;
  CdCHQ    := Entidade.CodigoCHQ;
  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;
  with DM.QR_Consultas do
  Begin
    Close;
    if ENtidade.ER = 'R' then
      SQL.Text := 'SELECT TRC_CODIGO AS TITULO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CHEQUE='+IntToStr(CdCHQCNC)+
        ' AND CHQ_CODIGO='+IntToStr(CdCHQ)+
        ' AND TRC_SITUACAO=2 ' //Recebido
    else
      SQL.Text := 'SELECT TPG_CODIGO AS TITULO '+
        ' FROM TITULO_A_PAGAR '+
        ' WHERE CNC_CHEQUE='+IntToStr(CdCHQCNC)+
        ' AND CHQ_CODIGO='+IntToStr(CdCHQ)+
        ' AND TPG_SITUACAO=1 '; //Pago
    Open;
    sTitulo := '';
    while not Eof do
    Begin
      if sTitulo <> '' then
        sTitulo := sTitulo + ' ; ';
      sTitulo := sTitulo + FieldByName('TITULO').asString;
      Next;
    end;
  end;

  vUsuAut := 0;
  if sTitulo <> '' then
  Begin
    if MessageDlg('Atenção!!!'+#13+'Deseja Reabrir o(s) Título(s) ('+sTitulo+') ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(3950)) < 0 then
    Begin
      raise Exception.Create('O usuário não tem permissão para Reabrir Títulos!');
      If DM.Usuario1.Permissoes.IndexOf(IntToStr(3950)) < 0 then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=38;
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
              vUsuAut := Usuario1.CodigoUSU;
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
  end
  else
  Begin
    if MessageDlg('Atenção!!!'+#13+'Deseja devolver o cheque ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  //Atualizar valor do Crédito
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger := CdCLI;
  Cliente1.Open;

  if Entidade.Situacao = 3 then //Devolvido 1a Vez
    iTipoMovCHQ := 1120   //Devolvido 2a Vez
  else
    iTipoMovCHQ := 1110;  //Devolvido 1a Vez

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if Entidade.ER = 'R' then
      Begin
        If DM.Usuario1.Permissoes.IndexOf(IntToStr(3950)) < 0 then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=38;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            begin
              if usuario1.Permissoes.IndexOf(IntToStr(3950)) < 0 then
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

        with Titulo_receber1 do
        Begin
          Close;
          SQL.Text := 'SELECT * '+
            ' FROM TITULO_A_RECEBER '+
            ' WHERE CNC_CHEQUE='+IntToStr(CdCHQCNC)+
            ' AND CHQ_CODIGO='+IntToStr(CdCHQ)+
            ' AND TRC_TIPO_PAG=6 '+ //Cheque
            ' AND TRC_SITUACAO=2 '; //Recebido
          Open;
          while not Eof do
          Begin
            CdCNC := CodigoCNC;
            CdTRC := CodigoTRC;
            vAberturaParcial := False;
            with DM.QR_Consultas do
            Begin
              Close;
              SQL.Text := 'SELECT TOP 1 TRC_CODIGO '+
                ' FROM TITULO_A_RECEBER '+
                ' WHERE TRC_TITULOANT='+IntToStr(CdTRC)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND TRC_SITUACAO<>5 ';
              Open;
              if not IsEmpty then
                vAberturaParcial := True;
              Close;
            end;
            if GerouMovimento then
            Begin
              DM.Caixa1.Close;
              DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
              DM.Caixa1.Open;
              if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,CodigoCCX,
                   CodigoCCXRecebimento,DM.Configuracao1.CodigoCAX,
                   TipoPag,Tipo,CodigoCNC,
                   ChequeCNC,CodigoCHQ,
                   'Ext.TRC: '+IntToStr(CodigoTRC)+
                   ' CH ('+format('%.2f',[ValorPG])+')','0',Numero,'',
                   Sequencia,'D',0(*Valor*),
                   Desconto(*Desconto*),Juros(*Juros*),
                   Credcli(*CredCli*),Valor(*ValorDoc*),
                   DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                   0(*DtCheque*),CodigoTRC,CodigoCNC,'R') then
              Begin
                ShowMessage('Falha ao gerar Movimento de Caixa!');
                Raise Exception.Create('');
              end;
            end;

            if Cred_Cli > 0 then
            Begin
              if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
                CdCLICNC,CdCLI,4030,CodigoCNC, CodigoTRC,
                CodigoCNC,CodigoPDV,'C',Cliente1.Credito,
                Cred_Cli) then
              Begin
                ShowMessage('Falha ao gerar Mov. Credito!');
                Raise Exception.Create('');
              end;

              ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
                ' CLI_CREDITO=CLI_CREDITO+'+VirgPonto(Cred_Cli)+
                ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
                ' AND CLI_CODIGO='+IntToStr(CdCLI));
            end;

            //Gerar Movimento de Cheque
            if not DM.Movimento_de_Cheque1.Inserir(CdCNC, CdCHQCNC, CdCHQ, CdCNC,
              CdTRC, iTipoMovCHQ, ValorPG) then
            Begin
              ShowMessage('Falha ao gerar Movimento de Cheque!');
              Raise exception.Create('');
            end;

            if not ReabreTitulo(vAberturaParcial, True(*ChequeDevolvido*), vUsuAut) then
              Raise exception.Create('');
            Next;
          end;
        end;
      end
      else //Cheque Emitido
      Begin
        If DM.Usuario1.Permissoes.IndexOf(IntToStr(3940)) < 0 then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=38;
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

        with Titulo_a_pagar1 do
        Begin
          Close;
          SQL.Text := 'SELECT * '+
            ' FROM TITULO_A_PAGAR '+
            ' WHERE CNC_CHEQUE='+IntToStr(CdCHQCNC)+
            ' AND CHQ_CODIGO='+IntToStr(CdCHQ)+
            ' AND TPG_TIPO_PAG=6 '+ //Cheque
            ' AND TPG_SITUACAO=1 '; //Pago
          Open;
          while not Eof do
          Begin
            CdCNC := CodigoCNC;
            CdTPG := CodigoTPG;
            if GerouMovimento then
            Begin
              if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,CodigoCCX,
                   CodigoCCXRecebimento,DM.Configuracao1.CodigoCAX,
                   TipoPag,TipoDoc,CodigoCNC,ChequeCNC, StrToInt(CodigoCHQ),
                   'Ext. TPG '+IntToStr(CodigoTPG)+' CH '+format('%.2f',[ValorPago]),
                   '0',Numero,OBS,Sequencia,'C',0,
                   Desconto(*Desconto*),Juros(*Juros*),
                   0(*CredCli*),Valor(*ValorDoc*),
                   DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                   0(*DtCheque*),CdTPG,CdCNC,'T') then
              Begin
                ShowMessage('Falha ao Gerar Mov. de Caixa!');
                Raise exception.Create('');
              end;
            end;

            //Gerar Movimento de Cheque
            if not DM.Movimento_de_Cheque1.Inserir(CdCNC, CdCHQCNC, CdCHQ, CdCNC,
              CdTPG, iTipoMovCHQ, ValorPago) then
            Begin
              ShowMessage('Falha ao gerar Movimento de Cheque!');
              Raise exception.Create('');
            end;

            if not ReabreTitulo then //Gera LOG no ReabreTitulo
              Raise exception.Create('');

            Next;
          end;
        end;
      end;

      if Entidade.Situacao = 3 then
        ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
          ' CHQ_SITUACAO=4 '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ))
      else
        ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
          ' CHQ_SITUACAO=3 '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ));

      If DM.Configuracao1.ControleTransacao then
        Commit;
      ShowMessage('Devolução concluída com sucesso!');
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

procedure TfMxCheque.SB_ReapresentarCabClick(Sender: TObject);
begin
  if Entidade.isEmpty then
    Raise Exception.Create('Selecione o Cheque primeiro!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode excluir cheques neste centro de custo!');
  //0 Recebido
  //1 Entregue
  //2 Descontado
  //3 Devolvido 1º vez
  //4 Devolvido 2º vez
  //5 Re-Apresentado
  //6 Cancelado
  if Entidade.Situacao <> 3 then
    Raise Exception.Create('Situação impossível de ser reapresentado!');

  with DM.QR_Consultas do
  Begin
    Close;
    if Entidade.ER = 'R' then
      SQL.Text := 'SELECT TRC_CODIGO AS TITULO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CHEQUE='+IntToStr(Entidade.CodigoCNC)+
        ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ)+
        ' AND TRC_SITUACAO=2 ' //Recebido
    else
      SQL.Text := 'SELECT TPG_CODIGO AS TITULO '+
        ' FROM TITULO_A_PAGAR '+
        ' WHERE CNC_CHEQUE='+IntToStr(Entidade.CodigoCNC)+
        ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ)+
        ' AND TPG_SITUACAO=1 '; //Pago
    Open;
    if not IsEmpty then
      Raise exception.Create('Exitem título pagos/recebidos com esse cheque!');
  end;
    
  if MessageDlg('Atenção!!!'+#13+'Deseja Cancelar o Cheque?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE '+
    ' SET CHQ_SITUACAO=6 '+
    ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
    ' AND CHQ_CODIGO='+IntToStr(Entidade.CodigoCHQ));
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxCheque.SB_CopiaChequeClick(Sender: TObject);
begin
  if Entidade.isEmpty then
    Raise Exception.Create('Selecione o Cheque primeiro!');

  Application.CreateForm(Trpt_ImprimirCopiaCheque,rpt_ImprimirCopiaCheque);
  with rpt_ImprimirCopiaCheque do
  Begin
    Tag:=0;
    Entidade.Close;
    Entidade.ParamByName('CNC_CODIGO').asInteger := fMxCheque.Entidade.CodigoCNC;
    Entidade.ParamByName('CHQ_CODIGO').asInteger := fMxCheque.Entidade.CodigoCHQ;
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxCheque.VSSComm321ReceiveData(Buffer: Pointer;
  BufferLength: Word);
var
  Mensagem, Mensagem1: string;
  P : PChar;
  i : integer;
Begin
  Mensagem := '';
  P := Buffer;
  for i := 0 to BufferLength-1 do
    Mensagem1 := Mensagem1 + P[i];

  if (Mensagem1 = 'Comm Event: EV_ERR Unknown EvtMask, EvtMask = 16') or
     (Length(Mensagem1) < 15) then
    Exit;

  edtCodigoBarras.Text := Mensagem1;
  mskComp.Enabled := False;
  mskBanco.Enabled := False;
  mskAgencia.Enabled := False;
  mskC1.Enabled := False;
  mskConta.Enabled := False;
  mskC2.Enabled := False;
  mskNumero.Enabled := False;
  mskC3.Enabled := False;

  mskComp.Text := Copy(Mensagem1,12,3);
  mskBanco.Text := Copy(Mensagem1,3,3);
  mskAgencia.Text := Copy(Mensagem1,6,4);
  mskC1.Clear;

  mskConta.Text := Copy(Mensagem1,26,8);
  mskC2.Clear;

  mskNumero.Text := Copy(Mensagem1,15,6);
  mskC3.Clear;

end;

procedure TfMxCheque.SB_VersoChequeClick(Sender: TObject);
begin
  if DM.Configuracao1.ImpCheque <= 0 then
    Raise exception.Create('Nenhuma impressora de cheques instalada!');
  try
    Application.CreateForm(TfMxImpressoraCheque, fMxImpressoraCheque);
    with fMxImpressoraCheque do
    Begin
      VersoCheque := memObservacao.Text;
      Tag := 2;
      ShowModal;
      UltimoChequeImpresso := Entidade.Nominal;
    end;
  except
  end;
end;

procedure TfMxCheque.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarCab.Enabled  := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_ExcCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);
  SB_ImprimirCheque.Enabled := not Habilitar;
  SB_VersoCheque.Enabled    := not Habilitar;
  SB_CopiaCheque.Enabled    := not Habilitar;
  SB_FecharCab.Enabled      := not Habilitar;
  if Entidade.Estado = 1 then
    SB_Gerar.Enabled        := Habilitar
  else
    SB_Gerar.Enabled        := False;
  SB_DevolverCab.Enabled    := not Habilitar;
  SB_ReapresentarCab.Enabled:= not Habilitar;

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

procedure TfMxCheque.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=35;
    fCadCli.CentroCusto2.open;
    if DM.Configuracao1.Empresa = empLBM then
      fCadCli.dblCentroDeCusto.KeyValue := 1
    else
      fCadCli.dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
    With fCadCli.Cliente1 do
    Begin
      Close;
      if VerificaInteiroBranco(self.edtCodigoCLI.Text) and
         VerificaInteiroBranco(self.edtClienteCNC.Text) then
        SQL.Text:='SELECT * FROM CLIENTE '+
          ' WHERE CLI_CODIGO='+self.edtCodigoCLI.Text+
          ' AND CNC_CODIGO='+self.edtClienteCNC.Text;
      Open;
    End;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxCheque.ckbTerceiroClick(Sender: TObject);
begin
  if SB_SalvaCab.Enabled and
     ckbTerceiro.Checked then
  Begin
    edtDonoCheque.Enabled := True;
    mskCPF_CNPJ.Enabled := True;
  end
  else
  Begin
    edtDonoCheque.Enabled := False;
    mskCPF_CNPJ.Enabled := False;
  end;
end;

procedure TfMxCheque.edtCodigoCLIExit(Sender: TObject);
begin
  if edtCodigoCLI.Enabled then
  Begin
    if not VerificaInteiroBranco(edtClienteCNC.Text) then
      if DM.Configuracao1.Empresa = empLBM then
        edtClienteCNC.Text := '1'
      else
        edtClienteCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      edtCodigoCLI.Text := '0';
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * '+
        ' FROM CLIENTE '+
        ' WHERE CNC_CODIGO='+edtClienteCNC.Text+
        ' AND CLI_CODIGO='+edtCodigoCLI.Text;
      Open;
      if IsEmpty then
      Begin
        if StrToInt(edtCodigoCLI.Text) <> 0 then
          ShowMessage('Cliente não encontrado!')
        else
        begin
          try
            edtDonoCheque.SetFocus;
          except
          end;
        end;
        edtDonoCheque.Clear;
        mskCPF_CNPJ.Clear;
      end
      else
      Begin
        edtDonoCheque.Text := FieldByName('CLI_RZ_SOCIAL').asString;
        mskCPF_CNPJ.Text := FieldByName('CLI_CGC_CPF').asString;
      end;
    end;
  end;
end;

procedure TfMxCheque.bitConfirmarClick(Sender: TObject);
var
  i, CdCNC, CdTRC: integer;
begin
  if Cheque1.IsEmpty then
    Raise Exception.Create('Selecione um cheque!');

  if tag = 3 then //Pagamento Avulso
  Begin
    if Entidade.Situacao = 6 then (*fMxPagarAvuls*)
      Raise exception.Create('Cheque cancelado!');
    fMxPagarAvulsoCPD1.edtChequeCNC.Text := IntToStr(Entidade.CodigoCNC);
    fMxPagarAvulsoCPD1.edtCodigoCHQ.Text := IntToStr(Entidade.CodigoCHQ);
    fMxPagarAvulsoCPD1.edtValor.Text := format('%.2f',[Entidade.FieldByName('Saldo').asFloat]);
  end
  else if tag = 4 then //Recebimento Avulso
  Begin
    if Entidade.Situacao = 6 then (*fMxRecebAvuls*)
      Raise exception.Create('Cheque cancelado!');
    fMxRecebAvulsoCPD1.edtChequeCNC.Text := IntToStr(Entidade.CodigoCNC);
    fMxRecebAvulsoCPD1.edtCodigoCHQ.Text := IntToStr(Entidade.CodigoCHQ);
    fMxRecebAvulsoCPD1.edtValor.Text := format('%.2f',[Entidade.FieldByName('Saldo').asFloat]);
  end
  else if tag = 5 then //Pagar Título
  Begin
    if Entidade.Situacao = 6 then
      Raise exception.Create('Cheque cancelado!');
    if Entidade.Valor > 0 then
    Begin
      if StrToFloat(fMxSPagBai.edtValorTitulo.Text) >= Entidade.Valor then
        fMxSPagBai.edtValorPago.Text    := format('%.2f',[Entidade.Valor])
      else
        fMxSPagBai.edtValorPago.Text    := fMxSPagBai.edtValorTitulo.Text;
      fMxSPagBai.edtChequeCNC.Text := IntToStr(Entidade.CodigoCNC);
      fMxSPagBai.edtCodigoCHQ.Text := IntToStr(Entidade.CodigoCHQ);
      if (Entidade.Data > DM.Configuracao1.Data) or
         (DM.Configuracao1.Empresa = empMotical) then
        fMxSPagBai.mskDataPagamento.Text := formatDateTime('DD/MM/YYYY',Entidade.Data)
      else
        fMxSPagBai.mskDataPagamento.Text := formatDateTime('DD/MM/YYYY',DM.Configuracao1.Data);
    end
    else
      fMxSPagBai.edtCodigoCHQ.Text := '0';
  end
  else if tag in [1,2] then //Receber TRC
  Begin
    if Entidade.Situacao = 6 then
      Raise exception.Create('Cheque cancelado!');
    //
    if DM.Configuracao1.Empresa = empLuciano then
    begin
      if (Entidade.CodigoCLI <> CdCLITRC) or
         (Entidade.ClienteCNC <> CdCNCCLITRC) then
      Begin
        if MessageDlg('Cheque de outro Cliente! '+#13+'Deseja Baixar Titulo com cheque de Cliente diferente do Cliente registrado?',mtWarning, [mbYes, mbNo], 0) <> mrYes then
        begin
          fMxSRecPParc.edtCodigoCHQ.Clear;
          Exit;
        end;
      end;
    end
    else
    begin
      if (Entidade.CodigoCLI <> CdCLITRC) or
         (Entidade.ClienteCNC <> CdCNCCLITRC) then
      Begin
        ShowMessage('Cheque de outro cliente!');
        fMxSRecPParc.edtCodigoCHQ.Clear;
        Exit;
      end;
    end;
    //
    if Entidade.Valor > 0 then
    Begin
      if StrToFloat(fMxSRecPParc.edtValorTotal.Text) >= Entidade.Valor then
        fMxSRecPParc.edtValorPago.Text    := format('%.2f',[Entidade.Valor])
      else
        fMxSRecPParc.edtValorPago.Text    := fMxSRecPParc.edtValorTotal.Text;
      fMxSRecPParc.edtChequeCNC.Text := IntToStr(Entidade.CodigoCNC);
      fMxSRecPParc.edtCodigoCHQ.Text := IntToStr(Entidade.CodigoCHQ);
      if not VerificaFloatBranco(fMxSRecPParc.edtDesconto.Text) then
        fMxSRecPParc.edtDesconto.Text := '0';
      if (Entidade.Data > DM.Configuracao1.Data) then
      Begin
        fMxSRecPParc.mskDataPag.Text := formatDateTime('DD/MM/YYYY',Entidade.Data);
        if (Entidade.Data > StrToDate(fMxSRecPParc.mskVencimento.Text)) then
          fMxSRecPParc.edtJuros.Text := format('%.2f',[StrToFloat(fMxSRecPParc.edtValorDocumento.Text)*
                                       (DM.Configuracao1.TaxaJuros*(Entidade.Data-StrToDate(fMxSRecPParc.mskVencimento.Text))/3000)]);
        fMxSRecPParc.edtDesconto.Text := '0,00';
        If (StrToFloat(fMxSRecPParc.edtValorDocumento.Text)+
            StrToFloat(fMxSRecPParc.edtJuros.Text)) <= StrToFloat(fMxSRecPParc.edtCredito.Text) then
        Begin
          fMxSRecPParc.edtValorPago.Text:='0';
          fMxSRecPParc.edtValorTotal.Text:='0'
        End
        Else
          fMxSRecPParc.edtValorTotal.Text:=Format('%.2f', [StrToFloat(fMxSRecPParc.edtValorDocumento.Text)+
                                                           StrToFloat(fMxSRecPParc.edtJuros.Text) -
                                                           StrToFloat(fMxSRecPParc.edtDesconto.Text) -
                                                           StrToFloat(fMxSRecPParc.edtCredito.Text)]);
      end
      else
      Begin
        fMxSRecPParc.mskDataPag.Text := formatDateTime('DD/MM/YYYY',DM.Configuracao1.Data);
        if StrToDate(fMxSRecPParc.mskVencimento.Text) >= DM.Configuracao1.Data then
          fMxSRecPParc.edtJuros.Text := '0,00'
        else
          fMxSRecPParc.edtJuros.Text := format('%.2f',[fMxSRecPParc.vValorJuros]);

        If (StrToFloat(fMxSRecPParc.edtValorDocumento.Text)+
            StrToFloat(fMxSRecPParc.edtJuros.Text)) <= StrToFloat(fMxSRecPParc.edtCredito.Text) then
        Begin
          fMxSRecPParc.edtValorPago.Text:='0';
          fMxSRecPParc.edtValorTotal.Text:='0'
        End
        Else
          fMxSRecPParc.edtValorTotal.Text:=Format('%.2f', [StrToFloat(fMxSRecPParc.edtValorDocumento.Text)+
                                                           StrToFloat(fMxSRecPParc.edtJuros.Text) -
                                                           StrToFloat(fMxSRecPParc.edtDesconto.Text) -
                                                           StrToFloat(fMxSRecPParc.edtCredito.Text)]);
      end;
    end
    else
      fMxSRecPParc.edtCodigoCHQ.Clear;
  end
  else if tag = 6 then //Recebimento de Cliente
  Begin
    if Entidade.Situacao = 6 then
      Raise exception.Create('Cheque cancelado!');
    CdCNC := fMxSRecPed.Titulo_receber1.CodigoCNC;
    CdTRC := fMxSRecPed.Titulo_receber1.CodigoTRC;
    if Trim(fMxSRecPed.Titulo_receber1.OBS) <> '(CHQ:'+PreencheZero(4,Entidade.Agencia)+'-'+Entidade.Numero+')' then
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_OBSERVACAO="(CHQ:'+PreencheZero(4,Entidade.Agencia)+'-'+Entidade.Numero+') "+TRC_OBSERVACAO '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE TRC_CODIGO='+IntToStr(CdTRC)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));
    fMxSRecPed.Titulo_receber1.Close;
    fMxSRecPed.Titulo_receber1.Open;
    fMxSRecPed.Titulo_receber1.LocalizarCod(CdTRC, CdCNC);
  end
  else if tag = 7 then //Factoring
  Begin
    if Entidade.Situacao = 6 then
      Raise exception.Create('Cheque cancelado!');
    if DBGrid5.SelectedRows.Count>0 then
    Begin
      with DBGrid5.DataSource.DataSet do
      Begin
        for i:=0 to DBGrid5.SelectedRows.Count-1 do
        begin
          GotoBookmark(pointer(DBGrid5.SelectedRows.Items[i]));
          if fMxFactoring.SB_Novo.Enabled then
            fMxFactoring.Item_de_Factoring1.PreparaInsercao;
          fMxFactoring.edtChequeCNC.Text  := FieldByName('CNC_CODIGO').AsString;
          fMxFactoring.edtCodigoCHQ.Text  := FieldByName('CHQ_CODIGO').AsString;
          fMxFactoring.edtValor.Text := format('%.2f',[Entidade.Valor]);
          try
            fMxFactoring.SB_Salva.SetFocus;
          except
          end;
          fMxFactoring.SB_SalvaClick(sender);
        end;
      end;
      fMxFactoring.SB_CancClick(sender);
      fMxFactoring.Item_de_Factoring1.Close;
      fMxFactoring.Item_de_Factoring1.Open;
    end
    else
    Begin
      fMxFactoring.edtChequeCNC.Text  := IntToStr(Entidade.CodigoCNC);
      fMxFactoring.edtCodigoCHQ.Text  := IntToStr(Entidade.CodigoCHQ);
      fMxFactoring.edtDonoCheque.Text := edtDonoCheque.Text;
      fMxFactoring.edtValor.Text := format('%.2f',[Entidade.Valor]);
    end;
  end;
  try
    VSSComm321.StopComm;
  except
  end;
  Close;
end;

procedure TfMxCheque.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

{
type
  TVetorDatas = array [1..20] of TDateTime;
var
  CdTPG, iQtdParcelas, vPrazoMedio: Integer;
  vValorParcela, vTotal: Double;
  vVetorDatas: TVetorDatas;
begin
  try
    CdTPG := StrToInt(edtTitulo.Text);
  except
    ShowMessage('Codigo do título inválido!');
    Exit;
  end;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM TITULO_A_PAGAR '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND TPG_CODIGO='+IntToStr(CdTPG);
    Open;
    if IsEmpty then
      Raise exception.Create('Título a pagar não localizado!');
    if FieldByName('TPG_SITUACAO').asInteger <> 0 then
      Raise exception.Create('Título pago ou cancelado!');
    vTotal := FieldByName('TPG_VALOR').asFloat;
    if vTotal <= 2500 then
      iQtdParcelas := 1
    else if (vTotal - (vTotal * (Trunc(vTotal) div 24000))) > 0 then
      iQtdParcelas := (Trunc(vTotal) div 2400)
    else
      iQtdParcelas := (Trunc(vTotal) div 2400) + 1;

    try
      vPrazoMedio := StrToInt(InputBox('Prazo Médio', 'Prazo em Dias:', '60'))
    except
      ShowMessage('Prazo médio inválido!');
    end;

    if iQtdParcelas = 1 then
      vValorParcela := Arredonda(vTotal)
    else
    Begin
      vValorParcela := Arredonda(vTotal/iQtdParcelas);
      vValorParcela := vValorParcela + (Arredonda(vTotal)-Arredonda(vValorParcela));
    end;
  end;
end;
}

procedure TfMxCheque.SB_GerarClick(Sender: TObject);
var
  i, CdCNC, CdTPG, CdPCP, CdCHQ, iTerceiro: integer;
  mensagem, NUM, sCHQ: string;
  Trans: Boolean;
begin
  mensagem := '';
  if mskComp.Text = '' then
    mensagem := mensagem + 'Comp inválido!'+#13;
  if mskBanco.Text = '' then
    mensagem := mensagem + 'Banco inválido!'+#13;
  if mskAgencia.Text = '' then
    mensagem := mensagem + 'Agência inválida!'+#13;
  if mskC1.Text = '' then
    mensagem := mensagem + 'C1 inválido!'+#13;
  if mskConta.Text = '' then
    mensagem := mensagem + 'Conta inválida!'+#13;
  if mskC2.Text = '' then
    mensagem := mensagem + 'C2 inválido!'+#13;
  if mskNumero.Text = '' then
    mensagem := mensagem + 'Número do Cheque inválido!'+#13;
  if mskC3.Text = '' then
    mensagem := mensagem + 'C3 inválido!'+#13;

  if mensagem <> '' then
    Raise exception.Create(mensagem);

  NUM:=mskNumero.Text;

  if ckbTerceiro.Checked then
    iTerceiro := 1
  else
    iTerceiro := 0;

  try
    CdTPG := StrToInt(edtTitulo.Text);
  except
    ShowMessage('Código do Título inválido!');
    Exit;
  end;

  CdCNC := StrToInt(edtTituloCNC.Text);

  with Query do
  Begin
    Close;
    SQL.Text := 'SELECT PCP_CODIGO '+
      ' FROM TITULO_A_PAGAR '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND TPG_CODIGO='+IntToStr(CdTPG);
    Open;
    if IsEmpty then
      Raise exception.Create('Título não encontrado!');
    CdPCP := FieldByName('PCP_CODIGO').AsInteger;

    Close;
    SQL.Text := 'SELECT * '+
      ' FROM TITULO_A_PAGAR '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PCP_CODIGO='+IntToStr(CdPCP)+
      ' AND TPG_TIPO_PAG=6 '+ //Cheque
      ' AND (CHQ_CODIGO="0" OR CHQ_CODIGO="" OR CHQ_CODIGO IS NULL) '+
      ' ORDER BY TPG_VENCIMENTO, TPG_SEQUENCIA ';
    Open;
    if IsEmpty then
      Raise exception.Create('Títulos de cheque não encontrados!');


    Trans:=false;
    with DM.Database2 do
    begin
      try
        StartTransaction;
        Trans:=True;

        i := 1;
        sCHQ := '';
        while not Eof do
        Begin
          if i > 1 then
            NUM := IntToStr(StrToInt(NUM)+1);
          //Inserir Cheque
          if not Entidade.Inserir(0,0,CdCNC,FieldByName('TPG_CODIGO').asInteger,iTerceiro,
            FieldByName('TPG_VENCIMENTO').asDateTime,FieldByName('TPG_VALOR').asFloat,
            cmbTipo.Text[1],mskComp.Text,mskBanco.Text,mskAgencia.Text,
            mskConta.Text,NUM,mskC1.text,mskC2.Text,mskC3.Text,edtDonoCheque.Text,
            mskCPF_CNPJ.Text,edtNominal.Text,memObservacao.Text) then
          Begin
            ShowMessage('Falha ao Gerar Cheque!');
            Raise Exception.Create('');
          end;

          CdCHQ := Entidade.SCodigo;

          ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_PAGAR SET '+
            ' CNC_CHEQUE='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ',CHQ_CODIGO="'+IntToStr(CdCHQ)+'" '+
            ',TPG_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND TPG_CODIGO='+FieldByName('TPG_CODIGO').asString);

          if sCHQ <> '' then
            sCHQ := sCHQ + ',';
          sCHQ := sCHQ + IntToStr(CdCHQ);

          inc(i);
          Next;
        end;

        Commit;
        Trans := False;

        SB_CancCabClick(sender);

        if sCHQ = '' then
          sCHQ := '0';

        Entidade.Close;
        Entidade.SQL.Text:='SELECT * FROM CHEQUE '+
          ' WHERE CHQ_CODIGO IN ('+sCHQ+') '+
          ' AND CHQ_ER=:CER';
        Entidade.Open;
      except
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
      end;
    end;
  end;
end;

procedure TfMxCheque.edtTituloKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtTitulo.Clear;
    key:=chr(0);
    Application.CreateForm(TfMxPagar, fMxPagar);
    with fMxPagar do
    Begin
      tag:=1;
      Showmodal;
    end;
  End;
end;

procedure TfMxCheque.ChequeCabClick(Sender: TObject);
begin
  SB_ImprimirChequeClick(sender);
end;

end.
