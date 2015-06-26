unit MxAssistenciaTecnica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Transportadora, DBCtrls, Parametro, Solicitacao_de_Garantia, Produto,
  Menus, AssistenciaTecnica, CentroCusto, Variants, ActnList,
  XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, ActnMenus;

type
  TfMxAssistenciaTecnica = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    Label1: TLabel;
    edtCodigoAST: TEdit;
    Label12: TLabel;
    Label15: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label4: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    cmbSituacao: TComboBox;
    dblCentroDeCusto: TDBLookupComboBox;
    Label16: TLabel;
    DSAssistenciaTecnica1: TDataSource;
    Produto1: TProduto;
    edtObservacao: TEdit;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    Label3: TLabel;
    Label7: TLabel;
    edtCodigoPDV: TEdit;
    Label27: TLabel;
    Label8: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    Label10: TLabel;
    mskDataEntregaPedido: TMaskEdit;
    Label11: TLabel;
    mskDataEmissao: TMaskEdit;
    Label14: TLabel;
    edtNumeroNota: TEdit;
    Label17: TLabel;
    Label21: TLabel;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    Label18: TLabel;
    Label22: TLabel;
    mskDataDepositoEnviado: TMaskEdit;
    mskDataDepositoRecebido: TMaskEdit;
    Label23: TLabel;
    Label24: TLabel;
    mskDataAssistenciaEnviado: TMaskEdit;
    mskDataAssistenciaRetornado: TMaskEdit;
    Label25: TLabel;
    Label26: TLabel;
    mskDataPrevisao: TMaskEdit;
    mskDataEntrega: TMaskEdit;
    Label28: TLabel;
    Label29: TLabel;
    mskDataDepositoDevolvido: TMaskEdit;
    mskDataLojaRecebido: TMaskEdit;
    Label5: TLabel;
    edtEstadoProduto: TEdit;
    Label9: TLabel;
    edtDefeitoReclamado: TEdit;
    Label13: TLabel;
    edtNumeroRetorno: TEdit;
    Label6: TLabel;
    AssistenciaTecnica1: TAssistenciaTecnica;
    edtPedidoCNC: TEdit;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    edtNumeroSerie: TEdit;
    AssistenciaTecnica1CNC_ORIGEM: TIntegerField;
    AssistenciaTecnica1CNC_CODIGO: TIntegerField;
    AssistenciaTecnica1AST_CODIGO: TIntegerField;
    AssistenciaTecnica1USU_CODIGO: TIntegerField;
    AssistenciaTecnica1CNC_PEDIDO: TIntegerField;
    AssistenciaTecnica1PDV_CODIGO: TIntegerField;
    AssistenciaTecnica1PRD_CODIGO: TIntegerField;
    AssistenciaTecnica1AST_RETORNO: TIntegerField;
    AssistenciaTecnica1AST_DT_CADASTRO: TDateTimeField;
    AssistenciaTecnica1AST_DT_ALTERADO: TDateTimeField;
    AssistenciaTecnica1AST_DT_DEPOSITO_ENVIADO: TDateTimeField;
    AssistenciaTecnica1AST_DT_DEPOSITO_RECEBIDO: TDateTimeField;
    AssistenciaTecnica1AST_DT_ASSISTENCIA_ENVIADO: TDateTimeField;
    AssistenciaTecnica1AST_DT_ASSISTENCIA_RETORNADO: TDateTimeField;
    AssistenciaTecnica1AST_DT_DEPOSITO_DEVOLVIDO: TDateTimeField;
    AssistenciaTecnica1AST_DT_LOJA_RECEBIDO: TDateTimeField;
    AssistenciaTecnica1AST_DT_PREVISAO: TDateTimeField;
    AssistenciaTecnica1AST_DT_ENTREGA: TDateTimeField;
    AssistenciaTecnica1AST_NUMERO_SERIE: TStringField;
    AssistenciaTecnica1AST_ESTADO_PRODUTO: TStringField;
    AssistenciaTecnica1AST_DEFEITO: TStringField;
    AssistenciaTecnica1AST_SITUACAO: TIntegerField;
    AssistenciaTecnica1AST_OBSERVACAO: TStringField;
    AssistenciaTecnica1Centro: TStringField;
    AssistenciaTecnica1Cliente: TStringField;
    AssistenciaTecnica1Situacao: TStringField;
    AssistenciaTecnica1EntregaPedido: TStringField;
    AssistenciaTecnica1NumeroNota: TStringField;
    AssistenciaTecnica1DataEmissao: TStringField;
    AssistenciaTecnica1Produto: TStringField;
    AssistenciaTecnica1CNC_CLIENTE: TIntegerField;
    AssistenciaTecnica1CLI_CODIGO: TIntegerField;
    edtClienteCNC: TEdit;
    Panel2: TPanel;
    DSCentroCusto2: TDataSource;
    CentroCusto2: TCentroCusto;
    cmbFiltroSituacao: TComboBox;
    ckbCodigoCNC: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbFiltroSituacao: TCheckBox;
    ckbFiltroData: TCheckBox;
    mskFiltroData: TMaskEdit;
    SB_ImprimirInventario: TSpeedButton;
    Label2: TLabel;
    Label30: TLabel;
    edtCodigoAUT: TEdit;
    edtAutorizada: TEdit;
    Label31: TLabel;
    edtEnderecoAutorizada: TEdit;
    AssistenciaTecnica1AUT_CODIGO: TIntegerField;
    AssistenciaTecnica1Autorizada: TStringField;
    AssistenciaTecnica1EnderecoAutorizada: TStringField;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    SairCab: TAction;
    AlterarSitucao1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EntidadeAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Solicitacao_de_Garantia1AfterScroll(DataSet: TDataSet);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cmbFiltroSituacaoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AlterarSitucao1Click(Sender: TObject);
    procedure AssistenciaTecnica1AfterScroll(DataSet: TDataSet);
    procedure AssistenciaTecnica1CalcFields(DataSet: TDataSet);
    procedure edtCodigoPDVExit(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoPDVKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure dblCodigoCNCClick(Sender: TObject);
    procedure ckbFiltroSituacaoClick(Sender: TObject);
    procedure ckbFiltroDataClick(Sender: TObject);
    procedure mskFiltroDataExit(Sender: TObject);
    procedure SB_ImprimirInventarioClick(Sender: TObject);
    procedure edtCodigoAUTExit(Sender: TObject);
    procedure edtCodigoAUTKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    procedure ImprimirOrdemServico(CdCNC, CdAST: integer; vQtdVias: integer=1);
    { Private declarations }
  public
    { Public declarations }
    Entidade: TAssistenciaTecnica;
  end;

var
  fMxAssistenciaTecnica: TfMxAssistenciaTecnica;

implementation

Uses UDM, funcoes, CdCliente, MxSPediProdMotCal, MxSPediProd, MxSPediLoc,
  UOrdemDeServico, CdAutorizada;

{$R *.DFM}

procedure TfMxAssistenciaTecnica.SB_NovoCabClick(Sender: TObject);
begin
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8310)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  if ckbFiltroSituacao.Checked then
    if cmbFiltroSituacao.ItemIndex <> 0 then
      cmbFiltroSituacao.ItemIndex := 0;

  Entidade.PreparaInsercao;
  mskDataEntregaPedido.Clear;
  edtNumeroNota.Clear;
  mskDataEmissao.Clear;
  edtRazaoSocial.Clear;
  edtProduto.Clear;
  edtAutorizada.Clear;
  edtEnderecoAutorizada.Clear;

  AtualizaControles(True);
  edtCodigoPDV.SetFocus;
end;

procedure TfMxAssistenciaTecnica.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8320)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtObservacao.SetFocus;
end;

procedure TfMxAssistenciaTecnica.SB_SalvaCabClick(Sender: TObject);
var
  CdCNC, CdAST: integer;
  vInserir: boolean;
begin
  CdCNC := dblCentroDeCusto.KeyValue;
  CdAST := StrToInt(edtCodigoAST.Text);

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Raise exception.Create('Código do Produto inválido!');

  vInserir := (Entidade.Estado = 1);

  with Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
    Open;
    if isEmpty then
      Raise exception.Create('Produto inválido!');
  end;

  if not Entidade.FinalizaEdicao then
    Exit;
  AtualizaControles(False);

  cmbFiltroSituacaoClick(sender);
  Entidade.LocalizarCod(CdAST, CdCNC);

  if vInserir then
    ImprimirOrdemServico(CdCNC, CdAST, 2);
end;

procedure TfMxAssistenciaTecnica.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfMxAssistenciaTecnica.SB_LocCabClick(Sender: TObject);
var
  mensagem:string;
  CdCNC, CdCLI: integer;
begin
  mensagem:='';
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      mensagem:=mensagem+'Código a ser localizado inválido!'+#13;
  if mensagem<>''then
    raise Exception.create(mensagem);
  if cmbCampo.ItemIndex = 5 then //Razão Social
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE CLI_RZ_SOCIAL LIKE "%'+edtLocalizar.Text+'%" ';
      Open;
      while not Eof do
      Begin
        CdCNC := FieldByName('CNC_CODIGO').asInteger;
        CdCLI := FieldByName('CLI_CODIGO').asInteger;
        If (Entidade.ClienteCNC = CdCNC) and
           (Entidade.CodigoCLI = CdCLI) then
          Break;
        if Entidade.locate('CNC_CLIENTE;CLI_CODIGO', vararrayof([CdCNC, CdCLI]), []) Then
          Break;
        Next;
      end;
    end;
  end
  else
    Entidade.Localizar;
end;

procedure TfMxAssistenciaTecnica.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode excluir neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8330)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  Entidade.deletarauto;
  if Entidade.IsEmpty then
  Begin
    mskDataEntregaPedido.Clear;
    edtNumeroNota.Clear;
    mskDataEmissao.Clear;
    edtRazaoSocial.Clear;
    edtProduto.Clear;
    edtAutorizada.Clear;
    edtEnderecoAutorizada.Clear;
  end;
end;

procedure TfMxAssistenciaTecnica.FormCreate(Sender: TObject);
begin
  Entidade := AssistenciaTecnica1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_Assistencia_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxAssistenciaTecnica.EntidadeAfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxAssistenciaTecnica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_Assistencia_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Produto1.Close;
  Action:=Cafree;
end;

procedure TfMxAssistenciaTecnica.Solicitacao_de_Garantia1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxAssistenciaTecnica.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxAssistenciaTecnica.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxAssistenciaTecnica.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto1.Open;
  cmbCampo.ItemIndex := 0;
  ckbFiltroSituacao.Checked := True;
  edtLocalizar.SetFocus;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT ASD.* '+
      ' FROM ASSISTENCIA_TECNICA AST, ASSISTENCIA_TECNICA_DEPOSITO ASD '+
      ' WHERE AST.AST_SITUACAO<ASD.ASD_SITUACAO '+
      ' AND AST.CNC_CODIGO=ASD.CNC_ASSISTENCIA '+
      ' AND AST.AST_CODIGO=ASD.AST_CODIGO ';
    Open;
    while not Eof do
    Begin
      ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
        ' AST_SITUACAO='+FieldByName('ASD_SITUACAO').asString+
        ',AST_DT_DEPOSITO_RECEBIDO="'+MesDiaHora(FieldByName('ASD_DT_DEPOSITO_RECEBIDO').asDateTime)+'" '+
        ',AST_DT_ASSISTENCIA_ENVIADO="'+MesDiaHora(FieldByName('ASD_DT_ASSISTENCIA_ENVIADO').asDateTime)+'" '+
        ',AST_DT_ASSISTENCIA_RETORNADO="'+MesDiaHora(FieldByName('ASD_DT_ASSISTENCIA_RETORNADO').asDateTime)+'" '+
        ',AST_DT_DEPOSITO_DEVOLVIDO="'+MesDiaHora(FieldByName('ASD_DT_DEPOSITO_DEVOLVIDO').asDateTime)+'" '+
        ' WHERE CNC_CODIGO='+FieldByName('CNC_ASSISTENCIA').asString+
        ' AND AST_CODIGO='+FieldByName('AST_CODIGO').asString);
      Next;
    end;
  end;
end;

procedure TfMxAssistenciaTecnica.AtualizaControles(Habilitar: Boolean);
begin
  ckbCodigoCNC.Enabled      := not Habilitar;
  ckbFiltroSituacao.Enabled := not Habilitar;
  ckbFiltroData.Enabled     := not Habilitar;
  if Habilitar then
  Begin
    cmbFiltroSituacao.Enabled := False;
    dblCodigoCNC.Enabled      := False;
    mskFiltroData.Enabled     := False;
  end
  else
  Begin
    if ckbFiltroSituacao.Checked then
      cmbFiltroSituacao.Enabled := True;
    if ckbCodigoCNC.Checked then
      dblCodigoCNC.Enabled := True;
    if ckbFiltroData.Checked then
      mskFiltroData.Enabled := True;
  end;

  SairCab.Enabled       := not Habilitar;
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := Habilitar;
  CancelarCab.Enabled   := Habilitar;
  AlterarSitucao1.Enabled := not Habilitar;
  LocalizarCab.Enabled  := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_ExcCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := Habilitar;
  SB_CancCab.Enabled    := Habilitar;

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

procedure TfMxAssistenciaTecnica.cmbFiltroSituacaoClick(Sender: TObject);
var
  CdCNC, sSituacao, sFiltroData: string;
begin
  if ckbCodigoCNC.Checked then
    CdCNC := ' AND CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue);
  if ckbFiltroSituacao.Checked then
    sSituacao := ' AND AST_SITUACAO='+IntToStr(cmbFiltroSituacao.ItemIndex);
  if ckbFiltroData.Checked then
  Begin
    if not VerificaDataBranco(mskFiltroData.Text) then
      mskFiltroData.Clear
    else
      sFiltroData := ' AND AST_DT_CADASTRO>="'+MesDia(mskFiltroData.Text)+'" ';
  end;

  Entidade.Close;
  Entidade.SQL.Text := 'SELECT * '+
    ' FROM ASSISTENCIA_TECNICA '+
    ' WHERE AST_CODIGO<>0 '+
    CdCNC+sSituacao+sFiltroData;
  Entidade.Open;
  if Entidade.isEmpty then
  Begin
    Entidade.LimpaCampos;
    mskDataEntregaPedido.Clear;
    edtNumeroNota.Clear;
    mskDataEmissao.Clear;
    edtRazaoSocial.Clear;
    edtProduto.Clear;
    edtAutorizada.Clear;
    edtEnderecoAutorizada.Clear;
  end;
end;

procedure TfMxAssistenciaTecnica.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
  Begin
    key:=chr(0);
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if key = #13 then
  Begin
    key:=chr(0);
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end
  else if (Key = '"') or (Key = #39) then  //Aspa Simples
    Key := #0;
end;

procedure TfMxAssistenciaTecnica.AlterarSitucao1Click(Sender: TObject);
var
  CdCNC, CdAST, CdPDV, CdPRD, iSit, CdASD, vQtdVias: integer;
  vData: TDateTime;
  Trans:Boolean;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Selecione o Registro!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8340)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (Entidade.CodigoCNC <> DM.Configuracao1.CodigoCNC) and
     (DM.Configuracao1.Deposito <> DM.Configuracao1.CodigoCNC) then
    Raise Exception.Create('Alteração permitida somente na Loja de Origem ou no Depósito!');
  if Entidade.DataEntrega > 0 then
    Raise exception.Create('Produto já foi entregue ao cliente!');

  if not AlterarSitucao1.Enabled then
    Exit;

  CdCNC := Entidade.CodigoCNC;
  CdAST := Entidade.CodigoAST;
  CdPDV := Entidade.CodigoPDV;
  CdPRD := Entidade.CodigoPRD;

  vQtdVias := -1;
  if Entidade.CodigoCNC <> DM.Configuracao1.CodigoCNC then //Depósito
  Begin
    if Entidade.DataDepositoEnviado = 0 then
      Raise exception.Create('Produto não foi enviado para o depósito!');
    if Entidade.DataDepositoDevolvido > 0 then
      Raise exception.Create('Poduto já foi enviado para a Loja!');

    AlterarSitucao1.Enabled := False;

    if (Entidade.DataDepositoRecebido = 0) then
    Begin
      if MessageDlg('Confirma o recebimento do Produto vindo da Loja?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            vData := DM.Configuracao1.DataHora;
            iSit := 2;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
              ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',AST_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_DEPOSITO_RECEBIDO="'+MesDiaHora(vData)+'" '+
              ',AST_SITUACAO='+IntToStr(iSit)+//Depósito Indo
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AST_CODIGO='+IntToStr(CdAST));
            CdASD := DM.Configuracao1.ProximoCodigo('ASD_CODIGO');
            ExecutaSQL(DM.QR_Comandos, 'INSERT ASSISTENCIA_TECNICA_DEPOSITO '+
              '(CNC_ORIGEM,CNC_CODIGO,ASD_CODIGO,ASD_DT_CADASTRO,USU_CODIGO '+
              ',CNC_ASSISTENCIA,AST_CODIGO '+
              ',ASD_DT_DEPOSITO_RECEBIDO,ASD_SITUACAO) VALUES '+
              '( '+IntToStr(Entidade.CentroDeCusto)+
              ', '+IntToStr(DM.Configuracao1.CodigoCNC)+
              ', '+IntToStr(CdASD)+
              ',"'+MesDiaHora(vData)+'" '+ //Data Cadastro
              ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
              ', '+IntToStr(Entidade.CodigoCNC)+
              ', '+IntToStr(Entidade.CodigoAST)+
              ',"'+MesDiaHora(vData)+'" '+
              ', '+IntToStr(iSit)+')'); //Situação
            if not Entidade.GeraLog(8340, CdCNC, CdAST, 'DEPOSITO PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+' (RECEBE DEPOSITO)') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;

            Commit;
            Trans := False;
          except
            vQtdVias := -1;
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end
    else if (Entidade.DataAssistenciaEnviado = 0) then
    Begin
      if MessageDlg('Confirma o envio para a Assistência Técnica?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            vData := DM.Configuracao1.DataHora;
            iSit := 3;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
              ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',AST_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_ASSISTENCIA_ENVIADO="'+MesDiaHora(vData)+'" '+
              ',AST_SITUACAO='+IntToStr(iSit)+//Depósito Indo
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AST_CODIGO='+IntToStr(CdAST));
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA_DEPOSITO SET '+
              ' ASD_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',ASD_DT_ASSISTENCIA_ENVIADO="'+MesDiaHora(vData)+'" '+
              ',ASD_SITUACAO='+IntToStr(iSit)+
              ' WHERE CNC_ASSISTENCIA='+IntToStr(Entidade.CodigoCNC)+
              ' AND AST_CODIGO='+IntToStr(Entidade.CodigoAST));
            if not Entidade.GeraLog(8340, CdCNC, CdAST, 'DEPOSITO PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+' (ENVIA ASSISTÊNCIA)') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;
            vQtdVias := 3;

            Commit;
            Trans := False;
          except
            vQtdVias := -1;
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end
    else if (Entidade.DataAssistenciaEnviado > 0) and
            (Entidade.DataAssistenciaRetornado = 0) then
    Begin
      if MessageDlg('Confirma o retorno da Assistência Técnica?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            vData := DM.Configuracao1.DataHora;
            iSit := 4;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
              ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',AST_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_ASSISTENCIA_RETORNADO="'+MesDiaHora(vData)+'" '+
              ',AST_SITUACAO='+IntToStr(iSit)+//Depósito Indo
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AST_CODIGO='+IntToStr(CdAST));
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA_DEPOSITO SET '+
              ' ASD_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',ASD_DT_ASSISTENCIA_RETORNADO="'+MesDiaHora(vData)+'" '+
              ',ASD_SITUACAO='+IntToStr(iSit)+
              ' WHERE CNC_ASSISTENCIA='+IntToStr(Entidade.CodigoCNC)+
              ' AND AST_CODIGO='+IntToStr(Entidade.CodigoAST));
            if not Entidade.GeraLog(8340, CdCNC, CdAST, 'DEPOSITO PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+' (RETORNO ASSISTÊNCIA)') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;

            Commit;
            Trans := False;
          except
            vQtdVias := -1;
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end
    else if (Entidade.DataAssistenciaRetornado > 0) and
            (Entidade.DataDepositoDevolvido = 0) then
    Begin
      if MessageDlg('Confirma a devolução para a Loja?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            vData := DM.Configuracao1.DataHora;
            iSit := 5;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
              ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',AST_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_DEPOSITO_DEVOLVIDO="'+MesDiaHora(vData)+'" '+
              ',AST_SITUACAO='+IntToStr(iSit)+//Depósito Indo
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AST_CODIGO='+IntToStr(CdAST));
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA_DEPOSITO SET '+
              ' ASD_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',ASD_DT_DEPOSITO_DEVOLVIDO="'+MesDiaHora(vData)+'" '+
              ',ASD_SITUACAO='+IntToStr(iSit)+
              ' WHERE CNC_ASSISTENCIA='+IntToStr(Entidade.CodigoCNC)+
              ' AND AST_CODIGO='+IntToStr(Entidade.CodigoAST));
            if not Entidade.GeraLog(8340, CdCNC, CdAST, 'DEPOSITO PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+' (RETORNO ASSISTÊNCIA)') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;
            vQtdVias := 2;

            Commit;
            Trans := False;
          except
            vQtdVias := -1;
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end;
  end
  else //Loja
  Begin
    if (Entidade.DataDepositoEnviado > 0) and
       (Entidade.DataDepositoDevolvido = 0) then
      Raise exception.Create('Produto ainda não foi enviado para a Loja!');

    AlterarSitucao1.Enabled := False;

    if (Entidade.DataDepositoEnviado = 0) and
       (Entidade.DataAssistenciaEnviado = 0) then
    Begin
      if MessageDlg('Deseja enviar para o Depósito?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            vData := DM.Configuracao1.DataHora;
            iSit := 1;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
              ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',AST_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_DEPOSITO_ENVIADO="'+MesDiaHora(vData)+'" '+
              ',AST_SITUACAO='+IntToStr(iSit)+//Depósito Indo
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AST_CODIGO='+IntToStr(CdAST));
            if not Entidade.GeraLog(8340, CdCNC, CdAST, 'LOJA PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+' (ENVIAR DEPOSITO)') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');            
            end;
            vQtdVias := 2;

            Commit;
            Trans := False;
          except
            vQtdVias := -1;
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end
      else if MessageDlg('Deseja enviar para a Assistência Técnica?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            vData := DM.Configuracao1.DataHora;
            iSit := 3;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
              ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',AST_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_ASSISTENCIA_ENVIADO="'+MesDiaHora(vData)+'" '+
              ',AST_SITUACAO='+IntToStr(iSit)+//Assistência Enviado
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AST_CODIGO='+IntToStr(CdAST));
            if not Entidade.GeraLog(8340, CdCNC, CdAST, 'LOJA PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+' (ENVIAR ASSISTÊNCIA)') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;
            vQtdVias := 3;

            Commit;
            Trans := False;
          except
            vQtdVias := -1;
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end
    else if (Entidade.DataDepositoDevolvido > 0) and
            (Entidade.DataLojaRecebido = 0) then
    Begin
      if MessageDlg('Confirma recebimento do Depósito?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            vData := DM.Configuracao1.DataHora;
            iSit := 6;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
              ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',AST_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_LOJA_RECEBIDO="'+MesDiaHora(vData)+'" '+
              ',AST_SITUACAO='+IntToStr(iSit)+//Depósito (Voltando)
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AST_CODIGO='+IntToStr(CdAST));
            if not Entidade.GeraLog(8340, CdCNC, CdAST, 'LOJA PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+' (RECEBIMENTO DEPOSITO)') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;            

            Commit;
            Trans := False;
          except
            vQtdVias := -1;
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;

      end;
    end
    else if (Entidade.DataDepositoEnviado = 0) and
            (Entidade.DataAssistenciaEnviado > 0) and
            (Entidade.DataAssistenciaRetornado = 0) then
    Begin
      if MessageDlg('Confirma retorno da Assistência Técnica?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            vData := DM.Configuracao1.DataHora;
            iSit := 5;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
              ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',AST_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_ASSISTENCIA_RETORNADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_LOJA_RECEBIDO="'+MesDiaHora(vData)+'" '+
              ',AST_SITUACAO='+IntToStr(iSit)+//Assistência (Retornou)
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AST_CODIGO='+IntToStr(CdAST));
            if not Entidade.GeraLog(8340, CdCNC, CdAST, 'LOJA PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+' (RECEBIMENTO ASSISTÊNCIA)') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;            

            Commit;
            Trans := False;
          except
            vQtdVias := -1;
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end
    else if (Entidade.DataLojaRecebido > 0) and
            (Entidade.DataEntrega = 0) then
    Begin
      if MessageDlg('Confirma entrega ao cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            vData := DM.Configuracao1.DataHora;
            iSit := 7;
            ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
              ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',AST_DT_ALTERADO="'+MesDiaHora(vData)+'" '+
              ',AST_DT_ENTREGA="'+MesDiaHora(vData)+'" '+
              ',AST_SITUACAO='+IntToStr(iSit)+//Entregue
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND AST_CODIGO='+IntToStr(CdAST));
            if not Entidade.GeraLog(8340, CdCNC, CdAST, 'LOJA PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+' (ENTREGA CLIENTE)') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;
            vQtdVias := 2;

            Commit;
            Trans := False;
          except
            vQtdVias := -1;
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end;
  end;
  cmbFiltroSituacaoClick(sender);
  if vQtdVias > 0 then
    ImprimirOrdemServico(CdCNC, CdAST, vQtdVias)
  else if vQtdVias <> -1 then
    ShowMessage('Alteração Concluída!');
  AlterarSitucao1.Enabled := True;
end;

procedure TfMxAssistenciaTecnica.AssistenciaTecnica1AfterScroll(
  DataSet: TDataSet);
var
  sDtDepRec, sDtDepDev, sDtAssEnv, sDtAssRet: string;
  CdCNC, CdAST: integer;
begin
  Entidade.CarregaDados;
  mskDataEntregaPedido.Text := Entidade.FieldByName('EntregaPedido').asString;
  edtNumeroNota.Text        := Entidade.FieldByName('NumeroNota').asString;
  mskDataEmissao.Text       := Entidade.FieldByName('DataEmissao').asString;
  edtRazaoSocial.Text       := Entidade.FieldByName('Cliente').asString;
  edtProduto.Text           := Entidade.FieldByName('Produto').asString;
  edtAutorizada.Text        := Entidade.FieldByName('Autorizada').asString;
  edtEnderecoAutorizada.Text:= Entidade.FieldByName('EnderecoAutorizada').asString;
  if Entidade.CodigoAST > 0 then
  Begin
    CdCNC := Entidade.CodigoCNC;
    CdAST := Entidade.CodigoAST;
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * '+
        ' FROM ASSISTENCIA_TECNICA_DEPOSITO '+
        ' WHERE CNC_ASSISTENCIA='+IntToStr(Entidade.CodigoCNC)+
        ' AND AST_CODIGO='+IntToStr(Entidade.CodigoAST);
      Open;
      if not IsEmpty then
      Begin
        if (Entidade.DataDepositoRecebido <> FieldByName('ASD_DT_DEPOSITO_RECEBIDO').asDateTime) or
           (Entidade.DataAssistenciaEnviado <> FieldByName('ASD_DT_ASSISTENCIA_ENVIADO').asDateTime) or
           (Entidade.DataAssistenciaRetornado <> FieldByName('ASD_DT_ASSISTENCIA_RETORNADO').asDateTime) or
           (Entidade.DataDepositoDevolvido <> FieldByName('ASD_DT_DEPOSITO_DEVOLVIDO').asDateTime) then
        Begin
          if FieldByName('ASD_DT_DEPOSITO_RECEBIDO').asDateTime > 0 then
            sDtDepRec := ',AST_DT_DEPOSITO_RECEBIDO="'+MesDiaHora(FieldByName('ASD_DT_DEPOSITO_RECEBIDO').asDateTime)+'" ';
          if FieldByName('ASD_DT_ASSISTENCIA_ENVIADO').asDateTime > 0 then
            sDtAssEnv := ',AST_DT_ASSISTENCIA_ENVIADO="'+MesDiaHora(FieldByName('ASD_DT_ASSISTENCIA_ENVIADO').asDateTime)+'" ';
          if FieldByName('ASD_DT_ASSISTENCIA_RETORNADO').asDateTime > 0 then
            sDtAssRet := ',AST_DT_ASSISTENCIA_RETORNADO="'+MesDiaHora(FieldByName('ASD_DT_ASSISTENCIA_RETORNADO').asDateTime)+'" ';
          if FieldByName('ASD_DT_DEPOSITO_DEVOLVIDO').asDateTime > 0 then
            sDtDepDev := ',AST_DT_DEPOSITO_DEVOLVIDO="'+MesDiaHora(FieldByName('ASD_DT_DEPOSITO_DEVOLVIDO').asDateTime)+'" ';
          ExecutaSQL(DM.QR_Comandos, 'UPDATE ASSISTENCIA_TECNICA SET '+
            ' AST_DT_ALTERADO="'+MesDiaHora(FieldByName('ASD_DT_ALTERADO').asDateTime)+'" '+
            ',AST_SITUACAO='+FieldByName('ASD_SITUACAO').asString+
            sDtDepRec+sDtDepDev+sDtAssEnv+sDtAssRet+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND AST_CODIGO='+IntToStr(CdAST));
          Entidade.Close;
          Entidade.Open;
          Entidade.LocalizarCod(CdAST, CdCNC);
        end;
      end;
    end;
  end;
end;

procedure TfMxAssistenciaTecnica.AssistenciaTecnica1CalcFields(
  DataSet: TDataSet);
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CNC_RZ_SOCIAL '+
      ' FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC);
    Open;
    Entidade.FieldByName('Centro').asString := FieldByName('CNC_RZ_SOCIAL').asString;

    Close;
    SQL.Text := 'SELECT * '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
    Open;
    Entidade.FieldByName('EntregaPedido').asString := FieldByName('PDV_DT_ENTREGA').asString;
    if FieldByName('PDV_NOTA_FISCAL').asInteger > 0 then
      Entidade.FieldByName('NumeroNota').asString := FieldByName('PDV_NOTA_FISCAL').asString
    else
      Entidade.FieldByName('NumeroNota').asString := '';
    if FieldByName('PDV_DT_EMISSAO_VENDA').asDateTime > 0 then
      Entidade.FieldByName('DataEmissao').asString := FieldByName('PDV_DT_EMISSAO_VENDA').asString
    else
      Entidade.FieldByName('DataEmissao').asString := '';

    Close;
    SQL.Text := 'SELECT * '+
      ' FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.ClienteCNC)+
      ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI);
    Open;
    Entidade.FieldByName('Cliente').asString := FieldByName('CLI_RZ_SOCIAL').asString;

    //Autorizada
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM AUTORIZADA '+
      ' WHERE AUT_CODIGO='+IntToStr(Entidade.CodigoAUT);
    Open;
    Entidade.FieldByName('Autorizada').asString := FieldByName('AUT_NOME').asString;
    if not isEmpty then
      Entidade.FieldByName('EnderecoAutorizada').asString := Trim(DM.SelecionaParametro(FieldByName('AUT_LOGRADOURO').asInteger)+' '+
                                                             FieldByName('AUT_ENDERECO').asString+' '+
                                                             FieldByName('AUT_BAIRRO').asString+' '+
                                                             FieldByName('AUT_CIDADE').asString+' '+
                                                             FieldByName('AUT_UF').asString+
                                                             ' FONE:'+FieldByName('AUT_FONE').asString)
    else
      Entidade.FieldByName('EnderecoAutorizada').asString := '';
  end;

  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> Entidade.CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    Entidade.FieldByName('Produto').asString := Trim(Descricao+' '+Caracteristica);
  end;

{
Depósito (Indo)
Depósito (Aguardando)
Assistência (Enviado)
Assistência (Retornou)
Depósito (Voltando)
Pronto p/ Entregar
Entregue
}
  case Entidade.Situacao of
    0: Entidade.FieldByName('Situacao').asString := 'Recepção';
    1: Entidade.FieldByName('Situacao').asString := 'Enviado ao Depósito';
    2: Entidade.FieldByName('Situacao').asString := 'Recebido pelo Depósito';
    3: Entidade.FieldByName('Situacao').asString := 'Enviado Assistência';
    4: Entidade.FieldByName('Situacao').asString := 'Retornou Assistência';
    5: Entidade.FieldByName('Situacao').asString := 'Devolvido pelo Depósito';
    6: Entidade.FieldByName('Situacao').asString := 'Pronto para Entrega';
    7: Entidade.FieldByName('Situacao').asString := 'Entregue';
  end;
end;

procedure TfMxAssistenciaTecnica.edtCodigoPDVExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  mskDataEntregaPedido.Clear;
  edtNumeroNota.Clear;
  mskDataEmissao.Clear;
  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
  Begin
    edtCodigoPDV.Text := '0';
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+edtPedidoCNC.Text+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text;
    try
      Open;
      if isEmpty then
      Begin
        edtCodigoPDV.Text := '0';
        Raise exception.Create('Pedido inválido!');
      end;
    except
      Exit;
    end;

    mskDataEntregaPedido.Text := FieldByName('PDV_DT_ENTREGA').asString;
    if FieldByName('PDV_NOTA_FISCAL').asInteger > 0 then
      edtNumeroNota.Text := FieldByName('PDV_NOTA_FISCAL').asString
    else
      edtNumeroNota.Clear;
    if FieldByName('PDV_DT_EMISSAO_VENDA').asDateTime > 0 then
      mskDataEmissao.Text := FieldByName('PDV_DT_EMISSAO_VENDA').asString
    else
      mskDataEmissao.Clear;

    edtClienteCNC.Text := FieldByName('CNC_CLIENTE').asString;
    edtCodigoCLI.Text  := FieldByName('CLI_CODIGO').asString;
    edtCodigoCLIExit(sender);
  end;
end;

procedure TfMxAssistenciaTecnica.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=46;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxAssistenciaTecnica.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=64;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=64;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfMxAssistenciaTecnica.edtCodigoCLIExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtRazaoSocial.Clear;

  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
  Begin
    edtCodigoCLI.Text := '0';
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+edtClienteCNC.Text+
      ' AND CLI_CODIGO='+edtCodigoCLI.Text;
    try
      Open;
      if isEmpty then
      Begin
        edtCodigoCLI.Text := '0';
        Raise exception.Create('Cliente inválido!');
      end;
    except
      Exit;
    end;
    edtRazaoSocial.Text := FieldByName('CLI_RZ_SOCIAL').asString;
  end;
end;

procedure TfMxAssistenciaTecnica.edtCodigoPRDExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtProduto.Clear;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
  Begin
    edtCodigoPRD.Text := '0';
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text;
    try
      Open;
      if isEmpty then
      Begin
        edtCodigoPRD.Text := '0';
        Raise exception.Create('Produto inválido!');
      end;
    except
      Exit;
    end;
    edtProduto.Text := Trim(FieldByName('PRD_DESCRICAO').asString+' '+FieldByName('PRD_CARACTERISTICA').asString);
    if StrToInt(edtCodigoPDV.Text) > 0 then
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+edtPedidoCNC.Text+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text;
      Open;
      if IsEmpty then
        ShowMessage('Atenção. Produto não encontrado nesse pedido!');
    end;
  end;
end;

procedure TfMxAssistenciaTecnica.edtCodigoPDVKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
    fMxSPedLoc.tag:=14;
    fMxSPedLoc.Showmodal;
  end;
  if VerificaInteiroBranco(edtCodigoPDV.Text) then
    edtCodigoPDVExit(sender); 
end;

procedure TfMxAssistenciaTecnica.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto2.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    try
      dblCodigoCNC.SetFocus;
    except
    end;
  end
  else
  Begin
    CentroCusto2.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
  end;
  cmbFiltroSituacaoClick(sender);
end;

procedure TfMxAssistenciaTecnica.dblCodigoCNCClick(Sender: TObject);
begin
  cmbFiltroSituacaoClick(sender);
end;

procedure TfMxAssistenciaTecnica.ckbFiltroSituacaoClick(Sender: TObject);
begin
  if ckbFiltroSituacao.Checked then
  Begin
    cmbFiltroSituacao.Color:=clWindow;
    cmbFiltroSituacao.Enabled:=True;
    cmbFiltroSituacao.ItemIndex := 0;
    try
      cmbFiltroSituacao.SetFocus;
    except
    end;
  end
  else
  Begin
    cmbFiltroSituacao.Color:=AlteraCorComponentes;
    cmbFiltroSituacao.ItemIndex:=-1;
    cmbFiltroSituacao.Enabled:=False;
  end;
  cmbFiltroSituacaoClick(sender);
end;

procedure TfMxAssistenciaTecnica.ckbFiltroDataClick(Sender: TObject);
begin
  if ckbFiltroData.Checked then
  Begin
    mskFiltroData.Color:=clWindow;
    mskFiltroData.Enabled:=True;
    mskFiltroData.Text := DateToStr(IncMonth(DM.Configuracao1.Data,-1));
    try
      mskFiltroData.SetFocus;
    except
    end;
  end
  else
  Begin
    mskFiltroData.Color:=AlteraCorComponentes;
    mskFiltroData.Clear;
    mskFiltroData.Enabled:=False;
  end;
  cmbFiltroSituacaoClick(sender);
end;

procedure TfMxAssistenciaTecnica.mskFiltroDataExit(Sender: TObject);
begin
  cmbFiltroSituacaoClick(sender);
end;

procedure TfMxAssistenciaTecnica.SB_ImprimirInventarioClick(
  Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');
  ImprimirOrdemServico(Entidade.CodigoCNC, Entidade.CodigoAST);
end;

procedure TfMxAssistenciaTecnica.edtCodigoAUTExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtAutorizada.Clear;
  edtEnderecoAutorizada.Clear;

  if not VerificaInteiroBranco(edtCodigoAUT.Text) then
  Begin
    edtCodigoAUT.Text := '0';
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM AUTORIZADA '+
      ' WHERE AUT_CODIGO='+edtCodigoAUT.Text+
      ' AND AUT_SITUACAO=0 ';
    try
      Open;
      if isEmpty then
      Begin
        edtCodigoAUT.Text := '0';
        Raise exception.Create('Autorizada inválida!');
      end;
    except
      Exit;
    end;
    edtAutorizada.Text := FieldByName('AUT_NOME').asString;
    edtEnderecoAutorizada.Text := Trim(DM.SelecionaParametro(FieldByName('AUT_LOGRADOURO').asInteger)+' '+
                                     FieldByName('AUT_ENDERECO').asString+' '+
                                     FieldByName('AUT_BAIRRO').asString+' '+
                                     FieldByName('AUT_CIDADE').asString+' '+
                                     FieldByName('AUT_UF').asString+
                                     ' FONE:'+FieldByName('AUT_FONE').asString);
  end;
end;

procedure TfMxAssistenciaTecnica.edtCodigoAUTKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadAutorizada, fCadAutorizada);
    with fCadAutorizada do
    Begin
      tag:=1;
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM AUTORIZADA '+
        ' WHERE AUT_SITUACAO=0 '+
        ' ORDER BY AUT_NOME ';
      Entidade.Open;
      Showmodal;
    end;
  end;
  if VerificaInteiroBranco(edtCodigoAUT.Text) then
    edtCodigoAUTExit(sender);
end;

procedure TfMxAssistenciaTecnica.ImprimirOrdemServico(CdCNC, CdAST: integer; vQtdVias: integer=1);
Begin
  Application.CreateForm(Trpt_OrdemDeServico, rpt_OrdemDeServico);
  with rpt_OrdemDeServico do
  Begin
    report.Options.Copies := vQtdVias;
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM ASSISTENCIA_TECNICA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND AST_CODIGO='+IntToStr(CdAST);
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

end.
