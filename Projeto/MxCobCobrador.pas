unit MxCobCobrador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Transportadora, DBCtrls, Parametro, Solicitacao_de_Garantia, AgenteFin,
  Forma_de_Pagamento, Vendedor, Pedido_de_Venda, Item_Pedido_Venda, Produto,
  Compra, Item_de_Cotacao, MapaCotacao, 
  CentroCusto, Cobranca_por_Cobrador,
  Funcionario, Menus, Titulo_receber, Cliente, funcoes, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfMxCobCobrador = class(TForm)
    Panel5: TPanel;
    SB_Retorno: TSpeedButton;
    SB_Enviar: TSpeedButton;
    Panel1: TPanel;
    Panel6: TPanel;
    DBGrid5: TDBGrid;
    Label20: TLabel;
    Label27: TLabel;
    Label10: TLabel;
    edtCodigoCPC: TEdit;
    dblCobrador: TDBLookupComboBox;
    Label3: TLabel;
    edtSituacao: TEdit;
    Label6: TLabel;
    Label9: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Panel3: TPanel;
    Label14: TLabel;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_ExcCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    Cobranca_por_Cobrador1: TCobranca_por_Cobrador;
    mskDataHora: TMaskEdit;
    Funcionario1: TFuncionario;
    DSFuncionario1: TDataSource;
    DSCobranca_por_Cobrador1: TDataSource;
    SB_Fechar: TSpeedButton;
    DSTitulo_receber1: TDataSource;
    SB_LocCab: TSpeedButton;
    SB_LocTRCCab: TSpeedButton;
    edtLocalizar: TEdit;
    Label19: TLabel;
    cmbCampo: TComboBox;
    Label1: TLabel;
    Titulo_receber1: TTitulo_receber;
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
    Titulo_receber1ValorCJuros: TFloatField;
    Titulo_receber1TRC_PROCESSO: TIntegerField;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    SB_Etiquetas: TSpeedButton;
    Etiquetas1: TCliente;
    Parametro1: TParametro;
    SB_Adicionar: TSpeedButton;
    SB_ExcluirCab: TSpeedButton;
    SB_Liberar: TSpeedButton;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    SB_GerarCarta: TBitBtn;
    edtNumeroCarta: TEdit;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    edtObservacao: TEdit;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
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
    Label2: TLabel;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    dblCodigoCNC: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    Etiquetas2: TCliente;
    Parametro2: TParametro;
    Edit1: TEdit;
    Titulo_receber1CLI_RZ_SOCIAL: TStringField;
    Titulo_receber1CLI_BAIRRO: TStringField;
    Titulo_receber1CLI_ENDERECO: TStringField;
    Titulo_receber1ICC_CODIGO: TIntegerField;
    ckbSomenteAbertos: TCheckBox;
    ckbSomentePagos: TCheckBox;
    Titulo_receber1TRC_LOCAL: TStringField;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    Titulo_receber1DataCobranca: TStringField;
    Cliente1: TCliente;
    PopupMenu1: TPopupMenu;
    ransferirparacobrador1: TMenuItem;
    Titulo_receber1CLI_TIPO: TIntegerField;
    Titulo_receber1descricaotipo: TStringField;
    lblTotal: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    Action1: TAction;
    AdicionarCab: TAction;
    ExcluirItemCab: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    CartaCab: TAction;
    LiberarCab: TAction;
    LocalizarRegistroCab: TAction;
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure EntidadeAfterScroll(DataSet: TDataSet);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cobranca_por_Cobrador1AfterScroll(DataSet: TDataSet);
    procedure SB_EnviarClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_RetornoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cobranca_por_Cobrador1BeforeOpen(DataSet: TDataSet);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_GerarCartaClick(Sender: TObject);
    procedure SB_AdicionarClick(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure SB_LiberarClick(Sender: TObject);
    procedure SB_LocTRCCabClick(Sender: TObject);
    procedure SB_ExcluirCabClick(Sender: TObject);
    procedure Titulo_receber1BeforeOpen(DataSet: TDataSet);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_EtiquetasClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure ckbSomenteAbertosClick(Sender: TObject);
    procedure Titulo_receber1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure ckbSomentePagosClick(Sender: TObject);
    procedure Funcionario1BeforeOpen(DataSet: TDataSet);
    procedure ransferirparacobrador1Click(Sender: TObject);
    procedure Valor_total;
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    Entidade:TCobranca_por_Cobrador;
    sFiltrosCobranca, sDescricaoFiltro, Titulos:String;
    cancelar:boolean;
    Total: Real;
  end;

var
  fMxCobCobrador: TfMxCobCobrador;

implementation

Uses
  UDM, MxSPediProd, MxRetCobrador, UEnviaCobrador, UCartaCobranca,
  MxSelRegCob, MxCobrancaAdiciona, MxSelCobranca, URelData, MxSelLiberarPed,
  DigSenha, UTitAtrazo, MxFiltraCobranca, UCartaTitulosAtrasoZRep,
  untTransferirCobranca, untCarta, MxSelEnviaCobranca, StrUtils;

{$R *.DFM}

procedure TfMxCobCobrador.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  Titulo_receber1.Close;
  Titulo_receber1.Open;
  AtualizaControles(1, False);

end;

procedure TfMxCobCobrador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_COB_COBRA_');
  except
  end;
  Entidade.Close;
  Funcionario1.Close;
  CentroCusto1.Close;
  Titulo_receber1.Close;
  Action:=Cafree;
end;

procedure TfMxCobCobrador.SB_PrimClick(Sender: TObject);
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

procedure TfMxCobCobrador.SB_AntClick(Sender: TObject);
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

procedure TfMxCobCobrador.SB_ProxClick(Sender: TObject);
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

procedure TfMxCobCobrador.SB_UltClick(Sender: TObject);
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

procedure TfMxCobCobrador.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.Empresa <> empLuciano then
    if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
      raise Exception.Create('Você não pode inserir cobrança deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3690)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  //
  Titulo_receber1.Close;
  Titulo_receber1.Open;
  AtualizaControles(1, True);
  //
  dblCobrador.SetFocus;
end;

procedure TfMxCobCobrador.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.Empresa <> empLuciano then
    if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
      raise Exception.Create('Você não pode alterar cobrança deste centro de custo.');
  If Entidade.Situacao>0 then
    raise exception.Create('Não é possivel alterar a cobrança, pois já foi enviada!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3700)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1, True);
  dblCobrador.SetFocus;
end;

procedure TfMxCobCobrador.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.Empresa <> empLuciano then
    if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
      raise Exception.Create('Você não pode excluir cobrança deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3710)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir cobrança!');
  if Entidade.Situacao <> 0 then
    if MessageDlg('Essa Cobrança já foi enviada!'+#13+
        'A comissão será retirada mesmo dos títulos pagos!'+#13+
        'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
    ' CPC_CODIGO=0 '+
    ',TRC_RGB_SITUACAO=0 '+
    ',TRC_RGB_DT_SITUACAO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE CPC_CODIGO='+edtCodigoCPC.Text+
    ' AND CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue));  // DM.Configuracao1.CodigoCNC
  ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_COBRANCA_COBRADOR '+
    ' WHERE CNC_CODIGO='+IntToStr(Entidade.CNCOrigem)+
    ' AND CPC_CODIGO='+IntToStr(Entidade.CodigoCPC));
  Entidade.deletarauto;
end;

procedure TfMxCobCobrador.EntidadeAfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxCobCobrador.SB_SalvaCabClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(1, False);
    Titulo_receber1.Close;
    Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger:=Entidade.OrigemCNC;  //DM.Configuracao1.CodigoCNC;
    Titulo_receber1.ParamByName('CPC_CODIGO').AsInteger:=Entidade.CodigoCPC;
    Titulo_receber1.Open;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxCobCobrador.FormCreate(Sender: TObject);
begin
  Entidade:=Cobranca_por_Cobrador1;
  Entidade.Open;
  //
  if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
  begin
    Titulo_receber1.SQL.Text := 'SELECT T1.*, T3.CLI_RZ_SOCIAL, T3.CLI_ENDERECO, T3.CLI_BAIRRO, T3.CLI_TIPO, T2.ICC_CODIGO '+
                    ' FROM TITULO_A_RECEBER T1, ITEM_DE_COBRANCA_COBRADOR T2, CLIENTE T3 '+
                    ' WHERE T2.CNC_CODIGO=:CNC_CODIGO AND T2.CPC_CODIGO=:CPC_CODIGO '+
                    ' AND T1.TRC_CODIGO = T2.TRC_CODIGO AND T1.CNC_CODIGO = T2.CNC_TITULO '+
                    ' AND T2.CPC_CODIGO <> 0 AND T2.CPC_CODIGO IS NOT NULL '+
                    ' AND T1.CLI_CODIGO=T3.CLI_CODIGO AND T1.CNC_CLIENTE=T3.CNC_CODIGO '+
                    ' AND T1.TRC_SITUACAO <> 5 '+
                    ' ORDER BY T1.CLI_CODIGO,T1.TRC_VENCIMENTO ASC ';
  end
  else
  begin
    Titulo_receber1.SQL.Text := 'SELECT T1.*, T3.CLI_RZ_SOCIAL, T3.CLI_ENDERECO, T3.CLI_BAIRRO, T3.CLI_TIPO, 0 AS ICC_CODIGO '+
                    ' FROM TITULO_A_RECEBER T1, CLIENTE T3'+
                    ' WHERE T1.CNC_CODIGO=:CNC_CODIGO AND T1.CPC_CODIGO=:CPC_CODIGO '+
                    ' AND T1.CPC_CODIGO <> 0 AND T1.CPC_CODIGO IS NOT NULL '+
                    ' AND T1.CLI_CODIGO=T3.CLI_CODIGO AND T1.CNC_CLIENTE=T3.CNC_CODIGO '+
                    ' AND T1.TRC_SITUACAO <> 5 '+
                    ' ORDER BY T1.CLI_CODIGO,T1.TRC_VENCIMENTO ASC ';
  end;
  Titulo_receber1.Open;
  Funcionario1.Open;
  CentroCusto1.Open;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_COB_COBRA_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;

  if DM.Configuracao1.Empresa = empLuciano then
    DBGrid5.Options := DBGrid5.Options + [dgRowSelect];


  //Calculando o valor total
  Valor_total;


  if DM.Configuracao1.Empresa <> empLuciano then
  begin
    ckbSomenteAbertos.Checked := true;
    ckbSomenteAbertosClick(ckbSomenteAbertos);
  end;
end;

procedure TfMxCobCobrador.Cobranca_por_Cobrador1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  Titulo_receber1.Close;
  Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger:=Entidade.OrigemCNC;  //DM.Configuracao1.CodigoCNC;
  Titulo_receber1.ParamByName('CPC_CODIGO').AsInteger:=Entidade.CodigoCPC;
  Titulo_receber1.Open;
end;

procedure TfMxCobCobrador.SB_EnviarClick(Sender: TObject);
var
  CPC:Integer;
  vData: TDateTime;
  sSituacao,vCliente,vParametro,vParametroCliente,sData:string;
begin
  if Titulo_receber1.isEmpty then
    Raise Exception.Create('Cobrança sem registros!');
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRCCPC ON TITULO_A_RECEBER (CNC_CODIGO,CPC_CODIGO)');
  Except
  end;

  CPC := Entidade.CodigoCPC;

  {Application.CreateForm(TfMxSelEnviaCobranca, fMxSelEnviaCobranca);
  fMxSelEnviaCobranca.mskDataINI.Text := DateToStr(DM.Configuracao1.Data);
  fMxSelEnviaCobranca.ShowModal;
  fMxSelEnviaCobranca.Free;}

  CPC:=Entidade.CodigoCPC;
  if DM.Configuracao1.TipoCobranca = 0 then  //DesCentralizado
  begin
    if Entidade.Situacao = 0 then
      ExecutaSQL(DM.QR_Comandos,'UPDATE COBRANCA_POR_COBRADOR SET '+
        ' CPC_SITUACAO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND CPC_CODIGO='+IntToStr(CPC));
  end;

  Application.CreateForm(Trpt_TitAtrazo, rpt_TitAtrazo);
  with rpt_TitAtrazo do
  Begin

    zrbRodapeGrupo.Height := 3;

    vExibirPagos := (MessageDlg('Deseja exibir as parcelas pagas?',mtConfirmation, [mbYes, mbNo], 0) = mrYes);

    ZRLabel2.Caption := 'SIAC - Extrato de Cliente';
    if DM.Configuracao1.Empresa = empLuciano then
    begin
      if dblCodigoCNC.KeyValue = 4 then
        zrlNomeEmpresa.Caption := 'OTICA MILLA';
    end;

    zrbGrupoCLI.ForceNewPage := True;
    zrlFiltros.Caption := 'Cobrador.: ('+IntToStr(self.dblCobrador.KeyValue)+') '+self.dblCobrador.Text+'     '+
                          'Cód.Cobrança: '+edtCodigoCPC.Text+' - '+edtObservacao.Text;

    Titulo_receber1.Close;
    if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
    Begin
      if vExibirPagos = true then
        sSituacao:=' AND T1.TRC_SITUACAO<>5 '
      else
        sSituacao:=' AND T1.TRC_SITUACAO<>2 ';

      //selecionando o cliente
      vParametro:='';
      vCliente := InputBox('Cliente', 'Código do cliente:','');
      if vCliente<>'' then
        vParametro:= ' AND T2.CLI_CODIGO='''+vCliente+''''
      else
        vParametro:='';


      try
        sData := InputBox('Data da Cobrança', 'Data:', DateToStr(DM.Configuracao1.Data));
        if sData <> '' then
          vData := StrToDate(sData);
      except
        ShowMessage('Data inválida!');
        Exit;
      end;

      Titulo_receber1.SQL.Text:='SELECT T1.*, T2.* '+
        ' FROM TITULO_A_RECEBER T1 '+
        ' INNER JOIN CLIENTE T2 '+
        ' ON T1.CLI_CODIGO=T2.CLI_CODIGO '+
        ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+

        ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
        vParametro+

        Ssituacao+
        ' AND EXISTS (SELECT TOP 1 T3.ICC_DT_CADASTRO FROM ITEM_DE_COBRANCA_COBRADOR T3 '+
        '             INNER JOIN TITULO_A_RECEBER T10 '+
        '             ON T10.CNC_CODIGO=T3.CNC_TITULO '+
        '             AND T10.TRC_CODIGO=T3.TRC_CODIGO '+

        '             WHERE T3.CPC_CODIGO='+edtCOdigoCPC.Text+

        IfThen(sData = '','',' AND T3.ICC_DT_CADASTRO = "'+MesDia(vData) +'"')+

        '             AND T10.CNC_CLIENTE=T2.CNC_CODIGO '+
        '             AND T10.CLI_CODIGO=T2.CLI_CODIGO) '+

        IfThen(sData = '','',
        ' AND NOT EXISTS (SELECT TOP 1 T3.ICC_DT_CADASTRO FROM ITEM_DE_COBRANCA_COBRADOR T3 '+
        '             INNER JOIN TITULO_A_RECEBER T10 '+
        '             ON T10.TRC_SITUACAO=0 '+
        '             AND T10.CNC_CODIGO=T3.CNC_TITULO '+
        '             AND T10.TRC_CODIGO=T3.TRC_CODIGO '+

        '             WHERE 1=1 '+
        '             AND T3.ICC_DT_CADASTRO < "'+MesDia(vData) +'"'+
        '             AND T10.CNC_CLIENTE=T2.CNC_CODIGO '+
        '             AND T10.CLI_CODIGO=T2.CLI_CODIGO) ')+

        ' ORDER BY T1.CNC_CODIGO, T2.CLI_RZ_SOCIAL,T1.PDV_CODIGO,T1.TRC_VENCIMENTO ';
    end
    else
    begin
      vParametro:='';
      vCliente := InputBox('Cliente', 'Código do cliente:','');
      if vCliente<>'' then
        vParametro:= ' AND T2.CLI_CODIGO IN ('+vCliente+')'
      else
        vParametro:='';
      //OU
      if vParametro = '' then
      begin
        vCliente := InputBox('Tipo', 'Descrição do tipo:','');
        if vCliente<>'' then
          vParametro:= ' AND T2.CLI_TIPO IN (SELECT TP.PAR_CODIGO FROM PARAMETRO TP '+
                       ' WHERE TP.PAR_CODIGO = T2.CLI_TIPO AND '+
                       ' TP.PAR_DESCRICAO = '''+vCliente+''') '
        else
          vParametro:='';
      end;

      Titulo_receber1.SQL.Text:='SELECT T1.*, T2.* '+
        ' FROM TITULO_A_RECEBER T1, CLIENTE T2 '+
        ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
        vParametro+
        ' AND T1.TRC_SITUACAO IN (0,1,8,9,2) ' +
        ' AND T1.CLI_CODIGO IN (SELECT T0.CLI_CODIGO FROM TITULO_A_RECEBER T0 '+
        '                       WHERE (T0.TRC_SITUACAO<=2 OR T0.TRC_SITUACAO=8 OR T0.TRC_SITUACAO=9) '+
        '                       AND T0.CPC_CODIGO='+edtCodigoCPC.Text+
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
  {else //Não é Luciano Ótica
  begin
    sFiltrosCobranca := '';
    sDescricaoFiltro := '';
    Application.CreateForm(TfMxFiltraCobranca, fMxFiltraCobranca);
    with fMxFiltraCobranca do
    Begin
      Tag := 0;
      ShowModal;
    end;

    Application.CreateForm(Trpt_EnviaCobrador, rpt_EnviaCobrador);
    with rpt_EnviaCobrador do
    Begin
      Tag := 0;
      zrlFiltros.Caption := sDescricaoFiltro;

      Titulo_receber1.Close;
      Titulo_receber1.SQL.Text:='SELECT T1.*, T2.* '+
        ' FROM CLIENTE T2 '+
        ' INNER JOIN TITULO_A_RECEBER T1 '+
        ' ON T1.CLI_CODIGO=T2.CLI_CODIGO '+
        ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+

        ' WHERE T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
        ' AND (T1.TRC_SITUACAO<2 OR T1.TRC_SITUACAO=8) '+
        ' AND ((T1.CPC_CODIGO='+edtCodigoCPC.Text+') '+
        '   OR ((T1.CPC_CODIGO=0 OR T1.CPC_CODIGO IS NULL) '+
        '    AND EXISTS (SELECT TOP 1 T0.CLI_CODIGO '+
        '                FROM TITULO_A_RECEBER T0 '+
        '                WHERE ((T0.TRC_SITUACAO<2 OR T0.TRC_SITUACAO=8) '+
        '                AND T0.CPC_CODIGO='+edtCodigoCPC.Text+
        '                AND T0.CLI_CODIGO=T1.CLI_CODIGO '+
        '                AND T0.CNC_CODIGO=T1.CNC_CODIGO)))) '+
        sFiltrosCobranca+
        ' ORDER BY T1.CLI_CODIGO,T1.PDV_CODIGO,T1.TRC_CODIGO ASC';
      Titulo_receber1.Open;
      SZRLabel21.Caption:=Funcionario1.NomeFun;
      SZRLabel22.Caption:=edtObservacao.Text;
      report.preview;
    end;
  end;}

  Entidade.Close;
  Entidade.Open;
  Entidade.LocalizarCod(CPC,DM.Configuracao1.CodigoCNC);
end;

procedure TfMxCobCobrador.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxCobCobrador.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxCobCobrador.SB_RetornoClick(Sender: TObject);
begin
  If Entidade.Situacao=0 then
    Raise Exception.create('A cobrança não foi enviada!');

  Application.CreateForm(TfMxRetCobr, fMxRetCobr);
  fMxRetCobr.Parametro1.Active:=true;
  fMxRetCobr.Parametro2.Active:=true;
  fMxRetCobr.Conta_de_Caixa1.Active:=true;
  fMxRetCobr.Entidade:=fMxRetCobr.Titulo_receber1;
  fMxRetCobr.Entidade.ParamByName('CPC_CODIGO').AsInteger := Entidade.CodigoCPC;
  fMxRetCobr.Entidade.ParamByName('CNC_CODIGO').AsInteger := Entidade.OrigemCNC;  //DM.Configuracao1.CodigoCNC;
  fMxRetCobr.Entidade.Active:=True;
  fMxRetCobr.CheckBox1.Checked:=fMxRetCobr.Titulo_Receber1.Visitado;
  fMxRetCobr.ShowModal;
end;

procedure TfMxCobCobrador.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if DM.Configuracao1.TipoCobranca = 1 then  //Centralizada
  begin
    SB_Liberar.Visible := False;
    SB_ExcluirCab.Left := SB_Adicionar.Left;
    SB_Adicionar.Left  := SB_Liberar.Left;


    (*Anderson Gonçalves*)
    SB_Retorno.Visible   := False;
    SB_Etiquetas.Visible := False;
    SB_Enviar.Left       := SB_Retorno.Left;

    BitBtn1.Visible := True;
  end
  else
  begin
    BitBtn1.Visible := false;
  end;

  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;

  DBGrid5.Columns[1].Visible := false;
end;

procedure TfMxCobCobrador.Cobranca_por_Cobrador1BeforeOpen(
  DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxCobCobrador.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxCobCobrador.SB_GerarCartaClick(Sender: TObject);
var
  n_Carta, sCdCLI:string;
begin
  Try
    ExecutaSQL(DM.QR_Comandos,'DROP INDEX TRCCPC');
  Except
    try
      ExecutaSQL(DM.QR_Comandos,'DROP INDEX dbo.Titulo_a_Receber.TRCCPC');
    except
    end;
  end;

  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRCCPC ON TITULO_A_RECEBER (CNC_CODIGO,CPC_CODIGO)');
  Except
  end;
  if (edtNumeroCarta.Text<>'1')and(edtNumeroCarta.Text<>'2')and(edtNumeroCarta.Text<>'3')and
     (edtNumeroCarta.Text<>'4')and(edtNumeroCarta.Text<>'5')and(edtNumeroCarta.Text<>'6')and
     (edtNumeroCarta.Text<>'7')and(edtNumeroCarta.Text<>'8')and(edtNumeroCarta.Text<>'9')then
    raise Exception.Create('Escolha a carta de 1 à 9');
  n_Carta:=edtNumeroCarta.Text;
  if Titulo_receber1.IsEmpty then
    raise Exception.Create('Cobrança sem registros!');



  //////////// CPD 2 //////////
  Titulo_receber1.First;
  sCdCLI := '';
  while not Titulo_receber1.EoF do
  begin
    sCdCLI := sCdCLI + inttostr(Titulo_receber1.CodigoCLI) + ',';
    Titulo_receber1.Next;
  end;
  sCdCLI := 'AND T1.CLI_CODIGO IN ('+sCdCLI+'0) ';
  // // // // //// // // // //

  if MessageDlg('Deseja selecionar um cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    try
      //sCdCLI := ' AND T2.CLI_CODIGO='+IntToStr(StrToInt(InputBox('Código do Cliente', 'Códigos (Ex:3229,008765):', '')));
      sCdCLI := ' AND T1.CLI_CODIGO IN ('+InputBox('Código do Cliente', 'Códigos (Ex:3229,008765):', '') +')';
    except
      ShowMessage('Código inválido!');
      Exit;
    end;
  end;


  Application.CreateForm(Trpt_CartaCobranca,rpt_CartaCobranca);
  with rpt_CartaCobranca do
  Begin
    Tag:=1;

    SZRLabel15.Caption := DM.Configuracao1.MensagemRodape;

    Entidade.sql.Text := 'SELECT T1.*, T2.* '+
      ' FROM TITULO_A_RECEBER T1 '+
      ' INNER JOIN CLIENTE T2 ON '+
      ' T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
      sCdCLI+
      ' AND T1.CLI_CODIGO=T2.CLI_CODIGO '+
      ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
      ' ORDER BY T2.CLI_BAIRRO,T2.CLI_ENDERECO,T1.CLI_CODIGO,T1.PDV_CODIGO,T1.TRC_VENCIMENTO';

    If n_Carta = '1' then
    begin
      SZRLabel4.Caption:='.   Gostariamos de Informa-lo que ate o presente momento nao consta em nosso sistema o pagamento da compra descrita a seguir. '+
                     'Caso o pagamento ja tenha sido realizado, favor desconsiderar esta carta.';
      SZRLabel7.Caption:='.   Gratos pela compreensao, esperamos contato breve. E um prazer te-lo como nosso cliente.';
    end
    Else If n_Carta = '2' then
    begin
      SZRLabel4.Caption:='.   Prezado cliente. Venho lhe avisar que zelamos por voce e nao queremos registrar seu nome ao S.P.C.';
      SZRLabel7.Caption:='.   Voce tem um prazo de 5 (cinco) dias para saldar seu debito conosco.';
      SZRLabel10.Caption:='.   Caso ja tenha efetuado o pagamento, torne-a sem efeito.';
    end
    Else If n_Carta = '3' then
    begin
      SZRLabel4.Caption:='.   Tendo esgotado todos os esforços de uma cobranca amigavel perante V.Sa., para a quitacao de seu debito em atraso, vimos portanto '+
                     'solicitar-lhe a presenca de no prazo improrrogavel de 48 horas, a partir do recebimento desta, evitando assim Execucao Judicial.';
      SZRLabel7.Caption:='.   No ensejo, teremos todo prazer de manter entendimentos com V.Sa. quando devera nos apresentar uma maneira aceitavel de quitar suas prestacoes atrasadas. '+
                     'Caso ja tenha efetuado o pagamento, favor desconsiderar o presente e entre em contato conosco.';
      SZRLabel10.Caption:='.   FAÇA DO SEU CREDITO UM SALDO DE CONFIANÇA; NAO UMA DECEPÇAO NO FUTURO!!! ';
    End
    Else If n_Carta = '4' then
    begin
      SZRLabel4.Caption:='.   Lamentamos de informar que sua ficha de cliente NEGATIVO ja encontra-se preenchida para ser enviada ao S.P.C.(Servico de Protecao ao Credito). '+
                     'Para seu conhecimento o S.P.C. mantem um cadastro central de todos os crediaristas e seus fiadores em todo o territorio nacional, com atraso igual ou superior a 30 dias. '+
                     'Para concessoes de credito no comercio, escolha de inquilinos, financiamento de imoveis, emprestimos bancarios, enfim, funciona como fonte de referencia a seus compromissos '+
                     'financeiro.';

      SZRLabel7.Caption:='.   Portanto enviamos-lhe com antecedencia de 05 dias uteis para a V.SA. enviar tais medidas: pagando a(s) prestacao(oes) atrasada(s) sem juros no prazo '+
                     'de 30 dias nao sofrer abalo de credito ou restricoes de outra natureza.';
      SZRLabel10.Caption:='.   No caso de ja ter efetuado o pagamento pedimos a gentileza de comparecer a nossa loja, a fim de sanarmos a pendencia existente!';
    End
    Else If n_Carta = '5' then
    begin
      SZRLabel4.Caption:='.   Acusamos a existencia de debitos de sua responsabilidade ainda pendente em nosso sistema, com atrasos superior ao tolerado. ';
      SZRLabel7.Caption:='.   Todavia, ha possibilidade de um acordo amigavel.';
      SZRLabel10.Caption:='.   Na certeza de contarmos com sua colaboracao, estamos aguardando a sua presenca em nosso escritorio para tratar do assunto pessoalmente no prazo de 48 horas.';
    End
    Else If n_Carta = '6' then
    begin
      SZRLabel4.Caption:='.   Acusamos a existencia de debitos de sua responsabilidade ainda pendente em nosso sistema, com atrasos superior ao tolerado. '+
         'Todavia, ha possibilidade de um acordo amigavel.';
      SZRLabel7.Caption:='.   Estamos aguardando a sua presenca em nosso escritorio para tratar do assunto pessoalmente. ';
      SZRLabel10.Caption:='.   Voce tem o prazo de 05 dias para saldar seu debito, o nao cumprimento implica, seu nome sera negativado automaticamente ao SCPC.';
    End
    Else If n_Carta = '7' then
    begin
      SZRLabel4.Caption:='.   Tal debito consta em nosso registro dando-nos assim o direito de usarmos de medida judicial visando receber a quantia, seja por via direta ou penhora de bem ate quitacao da divida. ';
      SZRLabel7.Caption:='.   Todavia, ha possibilidade de um acordo amigavel.';
      SZRLabel10.Caption:='.   Estamos aguardando a sua presenca em nosso escritorio para tratar do assunto pessoalmente. Voce tem o prazo de 03 dias para saldar seu debito.';
    End
    Else If n_Carta = '8' then
    begin
      SZRLabel4.Caption:='.   Gostaríamos de informá-lo que até o presente momento, consta em nosso sistema a existência de débitos de sua responsabilidade ainda pendente, com atrasos superiores ao tolerado. Todavia, há possibilidade de um acordo amigável. ';
      SZRLabel7.Caption:='.   Na certeza de contarmos com sua colaboração,você cliente que tem seu débito em atrazo, estamos dando a oportunidade de quitar o seu débito sem juro, reativar o seu crédito e ainda concorrer ao sorteio de uma Moto Titan 0km, dia 31 de dezembro de 2002.';
      SZRLabel10.Caption:='.   Gratos pela sua compreensão, estamos aguardando a sua presença. É um prazer tê-lo como nosso cliente.';
      SZRLabel26.Caption:='.   PROMOÇÃO VÁLIDA ATÉ O DIA 30/12/2002.';
    End
    Else If n_Carta = '9' then
    begin
      if DM.Configuracao1.Empresa = empLuciano then
      begin
        Application.CreateForm(TfrmCarta, frmCarta);
        frmCarta.Tag := 0;
        frmCarta.ShowModal;

        SZRLabel4.Caption  := frmCarta.RichEdit1.Text;
        SZRLabel4.Height   := 12;
        SZRLabel7.Caption  :='';
        SZRLabel10.Caption :='';
        SZRLabel26.Caption :='';
        SZRLabel13.Caption :='';
        SZRLabel11.Caption :='';
        SZRGroup2.Enabled := false;
        ZRBand2.Enabled := false;

        ZRLabel2.Caption := 'SIAC - Carta';

        frmCarta.Free;
      end;
    End;
    Entidade.Open;
    If Entidade.isEmpty then
      Raise Exception.Create('Nenhuma Carta foi gerada!');
    report.Preview;
  end;
end;

procedure TfMxCobCobrador.SB_AdicionarClick(Sender: TObject);
begin
  if DM.Configuracao1.Empresa <> empLuciano then
    if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
      raise Exception.Create('Você não pode alterar cobrança deste centro de custo.');
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3690)) < 0) AND
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(3700)) < 0) then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if Entidade.IsEmpty then
    raise Exception.Create('Crie uma cobrança primeiro!');
  Try
    ExecutaSQL(DM.QR_Comandos,'DROP INDEX TRCCLISITVEN');
  Except
    try
      ExecutaSQL(DM.QR_Comandos,'DROP INDEX dbo.TITULO_A_RECEBER.TRCCLISITVEN');
    except
    end;
  end;
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRCCLISITVEN ON TITULO_A_RECEBER (CNC_CODIGO,CLI_CODIGO,TRC_SITUACAO,TRC_VENCIMENTO)');
  Except
    Try
      ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRCCLISITVEN ON dbo.TITULO_A_RECEBER (CNC_CODIGO,CLI_CODIGO,TRC_SITUACAO,TRC_VENCIMENTO)');
    Except
    end;
  end;
  Application.CreateForm(TfMxCobrancaAdiciona,fMxCobrancaAdiciona);
  with fMxCobrancaAdiciona do
  Begin
    ShowModal;
    Close;
  end;
  Try
//    ExecutaSQL(DM.QR_Comandos,'DROP INDEX TRCCLISITVEN');
  Except
    try
//      ExecutaSQL(DM.QR_Comandos,'DROP INDEX dbo.TITULO_A_RECEBER.TRCCLISITVEN');
    except
    end;
  end;

  //Calculando o valor total
  Valor_total;
end;

procedure TfMxCobCobrador.SB_LocCabClick(Sender: TObject);
begin
  Application.CreateForm(TfmxSelCobranca, fmxSelCobranca);
  fMxSelCobranca.ShowModal;
end;


procedure TfMxCobCobrador.SB_LiberarClick(Sender: TObject);
begin
  if DM.Configuracao1.Empresa <> empLuciano then
    if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
      raise Exception.Create('Você não pode alterar cobrança deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3700)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  Application.CreateForm(TfMxSelLiberarReg, fMxSelLiberarReg);
  fMxSelLiberarReg.ShowModal;
end;

procedure TfMxCobCobrador.SB_LocTRCCabClick(Sender: TObject);
begin
  {if not VerificaInteiroBranco(edtLocalizar.Text) then
    raise Exception.create('Código a ser localizado inválido!');}
    
  if Titulo_receber1.Localizar then
    Dbgrid5.SetFocus;
end;

procedure TfMxCobCobrador.SB_ExcluirCabClick(Sender: TObject);
Var
 iCPC, CPC, cCPC: Integer;
begin
  if DM.Configuracao1.Empresa <> empLuciano then
    if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
      raise Exception.Create('Você não pode alterar cobrança deste centro de custo.');
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3690)) < 0) AND
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(3700)) < 0) then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  If Titulo_receber1.ValorPG>0 then
  Begin
    if MessageDlg('Título já pago, deseja realmente excluir dessa cobrança?',mtConfirmation, [mbYes, mbNo], 1) = mrYes then
    Begin
    //Verifica se o usuário que está logado não tem permissão para pagar
      If DM.Usuario1.Permissoes.IndexOf(IntToStr(3630)) < 0 then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=17;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          begin
            if usuario1.Permissoes.IndexOf(IntToStr(3630)) < 0 then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para excluir Registro Pago!');
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
    end
    else
      Raise Exception.Create('Exclusão cancelada!');
  end;
  //
  if DM.Configuracao1.TipoCobranca = 1 then  //Centralizada
  begin
    iCPC:=Titulo_Receber1.FieldByName('ICC_CODIGO').AsInteger;
//    cCPC:=Entidade.CodigoCNC;
    cCPC:=Entidade.OrigemCNC;
    CPC:=Entidade.CodigoCPC;
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_COBRANCA_COBRADOR '+
        ' WHERE CNC_CODIGO='+IntToStr(cCPC)+
        ' AND CPC_CODIGO='+IntToStr(CPC)+
        ' AND ICC_CODIGO='+IntToStr(iCPC));
  end
  else
  begin
    if not Titulo_receber1.IsEmpty then
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' CPC_CODIGO=0 '+
        ',TRC_RGB_SITUACAO=2 '+
        ',TRC_RGB_DT_SITUACAO="'+MesDia(DM.Configuracao1.Data)+'" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE TRC_CODIGO='+IntToStr(Titulo_receber1.CodigoTRC)+
        ' AND CNC_CODIGO='+IntToStr(Titulo_receber1.CodigoCNC))
    else
      Raise Exception.Create('Não há registros para excluir!');
  end;
  //
  Titulo_receber1.Close;
  Titulo_receber1.Open;
end;

procedure TfMxCobCobrador.Titulo_receber1BeforeOpen(DataSet: TDataSet);
begin
  if edtCodigoCPC.Text <> '' then
  Begin
    Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger:=dblCodigoCNC.KeyValue;  //DM.Configuracao1.CodigoCNC;
    Titulo_receber1.ParamByName('CPC_CODIGO').AsInteger:=StrToInt(edtCodigoCPC.Text);
  end;
end;

procedure TfMxCobCobrador.Titulo_receber1CalcFields(DataSet: TDataSet);
begin
  if Titulo_receber1.ValorPG > 0 then
    Titulo_receber1.FieldByName('ValorCJuros').AsFloat   :=Titulo_receber1.Valor+
       Titulo_receber1.Valor*(DM.Configuracao1.TaxaJuros*(Titulo_receber1.Pagamento-
       Titulo_receber1.vencimento)/3000)
  else
    Titulo_receber1.FieldByName('ValorCJuros').AsFloat   :=Titulo_receber1.Valor+
       Titulo_receber1.Valor*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
       Titulo_receber1.vencimento)/3000);

  if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT ICC_DT_CADASTRO '+
        ' FROM ITEM_DE_COBRANCA_COBRADOR '+
        ' WHERE CNC_TITULO='+IntToStr(Titulo_receber1.CodigoCNC)+
        ' AND TRC_CODIGO='+IntToStr(Titulo_receber1.CodigoTRC);
      Open;
      Titulo_receber1.FieldByName('DataCobranca').asString := FieldByName('ICC_DT_CADASTRO').asString;
    end;
  end
  else
    Titulo_receber1.FieldByName('DataCobranca').asString := DateToStr(Titulo_receber1.DataRGBSituacao);


  DM.QuerySelect.Close;
  DM.QuerySelect.SQL.Text := 'SELECT PAR_DESCRICAO FROM PARAMETRO WHERE '+
                             ' PAR_CODIGO = '''+Titulo_receber1.FieldByName('CLI_TIPO').asString+'''';
  DM.QuerySelect.Open;
  Titulo_receber1.FieldByName('descricaotipo').asString := DM.QuerySelect.  FieldByName('PAR_DESCRICAO').asString;
end;

procedure TfMxCobCobrador.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if Key=chr(13) then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfMxCobCobrador.SB_EtiquetasClick(Sender: TObject);
var
  QtdEtiquetas:Integer;
  EnderecoCompleto:string;
begin
  QtdEtiquetas := 0;
  if Titulo_receber1.IsEmpty then
    Raise exception.Create('Selecione a cobrança!');
  with Etiquetas1 do
  Begin
    Close;
    SQL.Text:='SELECT DISTINCT T2.* '+
      ' FROM TITULO_A_RECEBER T1, CLIENTE T2 '+
      ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
      ' AND T1.CNC_CODIGO='+IntToStr(Titulo_receber1.CodigoCNC)+
      ' AND (T1.TRC_SITUACAO<2 OR T1.TRC_SITUACAO=8) '+
      ' AND T1.CPC_CODIGO='+edtCodigoCPC.Text+
      ' ORDER BY T2.CLI_RZ_SOCIAL ASC';
    Open;
    LimpaEtiquetas;
    while not Etiquetas1.EOF do
    begin
      QtdEtiquetas:=QtdEtiquetas+1;
      Parametro1.Close;
      Parametro1.ParamByName('PAR_CODIGO').asInteger:=Logradouro;
      Parametro1.Open;
      if not Parametro1.IsEmpty then
        EnderecoCompleto:=Parametro1.Descricao+' '+Endereco
      else
        EnderecoCompleto:=Endereco;
      {comentado, se dê algum erro voltar a descomentar}
      AdicionarEtiqueta(CodigoCLI,Convenio,RazaoSocial,NomeFantasia,Fone,Fax,Celular,EMail,EnderecoCompleto,Bairro,Cidade,Uf,CEP,CGFRG,CPFCGC,OBS);
      Next;
    end;
    FechaEtiquetas;
    Close;
    ShowMessage('Arquivo gerado com sucesso !'+#13+IntToStr(QtdEtiquetas)+' registros!');
  end;
end;

procedure TfMxCobCobrador.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  CartaCab.Enabled      := not Habilitar;
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarCab.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_ExcCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);
  //
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    dblCodigoCNC.Enabled := SB_SalvaCab.Enabled and Titulo_receber1.IsEmpty;
  end
  else
  begin
    dblCodigoCNC.Enabled := False;
    dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
  end;
  //
  edtNumeroCarta.Enabled       := not Habilitar;

  LiberarCab.Enabled           := not Habilitar;
  AdicionarCab.Enabled         := not Habilitar;
  ExcluirItemCab.Enabled       := not Habilitar;
  LocalizarRegistroCab.Enabled := not Habilitar;

  SB_Liberar.Enabled      := not Habilitar;
  SB_Adicionar.Enabled    := not Habilitar;
  SB_ExcluirCab.Enabled   := not Habilitar;
  SB_GerarCarta.Enabled   := not Habilitar;
  SB_LocTRCCab.Enabled    := not Habilitar;
  SB_Enviar.Enabled       := not Habilitar;
  SB_Etiquetas.Enabled    := not Habilitar;
  SB_Retorno.Enabled      := not Habilitar;
  SB_Fechar.Enabled       := not Habilitar;

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

procedure TfMxCobCobrador.DBGrid5TitleClick(Column: TColumn);
begin
  if Titulo_receber1.FieldByName(Column.FieldName).FieldKind <> fkData then
    Exit;
  if Column.Index in [1,2,3] then
    Titulo_receber1.SOrdemdoGrid(Entidade.EDbgrid,Column,'T3')
  else
    Titulo_receber1.SOrdemdoGrid(Entidade.EDbgrid,Column,'T1');
end;

procedure TfMxCobCobrador.BitBtn1Click(Sender: TObject);
Var
  EnderecoCompleto, Selec, sTRC, sGrupoClientes, sClientes, sDtCadastro: String;
begin
  if Titulo_receber1.IsEmpty then
    raise Exception.Create('Cobrança sem registros!');


  sDtCadastro := ' AND B.ICC_DT_CADASTRO = "'+MesDia(DM.Configuracao1.Data)+'" ';

  sGrupoClientes := Trim(InputBox('Entre com os Códigos dos Clientes', 'Códigos (Ex:3229,008765):', ''));

  if sGrupoClientes = '' then
    Exit
  else
    sClientes := sGrupoClientes;

  if sGrupoClientes <> '' then
  Begin
    sGrupoClientes := ' WHERE CLI_CODIGO IN ('+sGrupoClientes+') ';
    sDtCadastro := '';
  end;

  if DM.Configuracao1.Empresa = empLuciano then
  Begin
    Application.CreateForm(Trpt_CartaTitulosAtrasoZRep, rpt_CartaTitulosAtrasoZRep);

    with rpt_CartaTitulosAtrasoZRep.Etiquetas2 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ' SELECT * '+
          ' FROM CLIENTE C, TITULO_A_RECEBER T, ITEM_DE_COBRANCA_COBRADOR B '+
          ' WHERE T.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
          ' AND B.CPC_CODIGO='+edtCodigoCPC.Text+
          ' AND T.CLI_CODIGO IN ('+sClientes+')'+
          ' AND T.CLI_CODIGO=C.CLI_CODIGO AND C.CNC_CODIGO=T.CNC_CLIENTE '+
          ' AND T.TRC_CODIGO=B.TRC_CODIGO AND B.CNC_TITULO=T.CNC_CODIGO '+
          ' AND T.TRC_SITUACAO <> 2 '+
          sDtCadastro+' ORDER BY C.CLI_RZ_SOCIAL,T.PDV_CODIGO,T.TRC_CODIGO,T.TRC_SEQUENCIA';
        Open;
     Open;
    end;

    rpt_CartaTitulosAtrasoZRep.report.Preview;
  end
  else
  Begin
    //
    DM.QR_Consultas.Close;
    if Pos('ORDER',Titulo_receber1.SQL.Text) > 0 then
      Selec := Copy(Titulo_receber1.SQL.Text,0,Pos('ORDER', Titulo_receber1.SQL.Text)-1)
    else
      Selec := Titulo_receber1.SQL.Text;
    DM.QR_Consultas.SQL.Text := ' SELECT DISTINCT TRC_CODIGO FROM ( '+Selec+' ) AS TABELA '+sGrupoClientes;
    DM.QR_Consultas.ParamByName('CNC_CODIGO').AsInteger:=dblCodigoCNC.KeyValue;  //DM.Configuracao1.CodigoCNC;
    DM.QR_Consultas.ParamByName('CPC_CODIGO').AsInteger:=StrToInt(edtCodigoCPC.Text);
    try
      DM.QR_Consultas.Open;
    except
      ShowMessage('Consulta inválida!');
      Exit;
    end;
    if DM.QR_Consultas.isEmpty then
      Raise exception.Create('Consulta vazia!');
    sTRC := '';
    while not DM.QR_Consultas.Eof do
    Begin
      if sTRC <> '' then
        sTRC := sTRC + ',';
      sTRC := sTRC + DM.QR_Consultas.FieldByName('TRC_CODIGO').asString;
      DM.QR_Consultas.Next;
    end;
    //
    Etiquetas2.Close;
    if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
       Etiquetas2.SQL.Text := ' SELECT * '+
                  ' FROM CLIENTE C, TITULO_A_RECEBER T, ITEM_DE_COBRANCA_COBRADOR B '+
                  ' WHERE T.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                  ' AND B.CPC_CODIGO='+edtCodigoCPC.Text+
                  ' AND T.TRC_CODIGO IN ('+sTRC+') '+
                  ' AND T.CLI_CODIGO=C.CLI_CODIGO AND C.CNC_CODIGO=T.CNC_CLIENTE '+
                  ' AND T.TRC_CODIGO=B.TRC_CODIGO AND B.CNC_TITULO=T.CNC_CODIGO '+
                  ' AND T.TRC_SITUACAO <> 2 '+
                  sDtCadastro
    else
       Etiquetas2.SQL.Text := ' SELECT * '+
                  ' FROM CLIENTE C, TITULO_A_RECEBER T '+
                  ' WHERE T.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
                  ' AND T.CPC_CODIGO='+edtCodigoCPC.Text+
                  ' AND T.TRC_CODIGO IN ('+sTRC+') '+
                  ' AND T.CLI_CODIGO=C.CLI_CODIGO AND C.CNC_CODIGO=T.CNC_CLIENTE '+
                  ' AND T.TRC_SITUACAO <> 2 ';
    Etiquetas2.Open;
    if Etiquetas2.IsEmpty then
    begin
      if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
        Raise Exception.Create('Arquivo NÃO gerado!'+#13+'Nenhuma Cobrança foi Adicionada nesta Data!')
      else
        Raise Exception.Create('Arquivo NÃO gerado!');
    end;

    Etiquetas2.LimpaEtiquetas('valor;pedido;titulo;data;diae;parcelas');
    while not Etiquetas2.EOF do
    begin
      if (not Parametro2.Active) or
         (Parametro2.CodigoPAR <> Etiquetas2.Logradouro) then
      Begin
        Parametro2.Close;
        Parametro2.ParamByName('PAR_CODIGO').asInteger:=Etiquetas2.Logradouro;
        Parametro2.Open;
      end;
      EnderecoCompleto := Trim(Parametro2.Descricao+' '+Etiquetas2.Endereco);
      Etiquetas2.AdicionarEtiqueta(Etiquetas2.CodigoCLI,Etiquetas2.Convenio,
                                   Etiquetas2.RazaoSocial,Etiquetas2.NomeFantasia,
                                   Etiquetas2.Fone,Etiquetas2.Fax,Etiquetas2.Celular,Etiquetas2.EMail,
                                   EnderecoCompleto,Etiquetas2.Bairro,Etiquetas2.Cidade,Etiquetas2.Uf,
                                   Etiquetas2.CEP,Etiquetas2.CGFRG,Etiquetas2.CPFCGC,Etiquetas2.OBS,
                                   Format('%.2f',[Etiquetas2.FieldByName('TRC_VALOR').asFloat])+';'+
                                   Etiquetas2.FieldByName('PDV_CODIGO').asString+';'+
                                   Etiquetas2.FieldByName('TRC_CODIGO').asString+';'+
                                   FormatDateTime('dd/MM/yyyy',Etiquetas2.FieldByName('TRC_VENCIMENTO').asDateTime)+';'+
                                   FormatDateTime('dd/MM/yyyy',Now)+';'+
                                   Etiquetas2.FieldByName('TRC_SEQUENCIA').asString);


      Etiquetas2.Next;
    end;
    Etiquetas2.FechaEtiquetas;
    ShowMessage('Arquivo gerado com sucesso !');
    Etiquetas2.Close;
  end;
end;

procedure TfMxCobCobrador.ckbSomenteAbertosClick(Sender: TObject);
begin
  if ckbSomenteAbertos.Checked then
    ckbSomentePagos.Checked := False;

  if ckbSomenteAbertos.Checked or
     ckbSomentePagos.Checked then
    Titulo_receber1.Filtered := True
  else
    Titulo_receber1.Filtered := False;
  Titulo_receber1.Close;
  Titulo_receber1.Open;

  //Calculando o valor total
  Valor_total;
end;

procedure TfMxCobCobrador.Titulo_receber1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if ckbSomenteAbertos.Checked then
    Accept := (Titulo_receber1.Situacao <> 2)
  else if ckbSomentePagos.Checked then
    Accept := (Titulo_receber1.Situacao = 2);  
end;

procedure TfMxCobCobrador.ckbSomentePagosClick(Sender: TObject);
begin
  if ckbSomentePagos.Checked then
    ckbSomenteAbertos.Checked := False;

  if ckbSomenteAbertos.Checked or
     ckbSomentePagos.Checked then
    Titulo_receber1.Filtered := True
  else
    Titulo_receber1.Filtered := False;
  Titulo_receber1.Close;
  Titulo_receber1.Open;

  //Calculando o valor total
  Valor_total;
end;

procedure TfMxCobCobrador.Funcionario1BeforeOpen(DataSet: TDataSet);
begin
  try
    Funcionario1.ParamByName('CNC_CODIGO').asInteger := dblCodigoCNC.KeyValue;
  except
    Funcionario1.ParamByName('CNC_CODIGO').asInteger := -1;
  end;
end;

procedure TfMxCobCobrador.ransferirparacobrador1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmTransferirCobranca, frmTransferirCobranca);
  with frmTransferirCobranca do
  begin
    tag := 0;
    ShowModal;
    Free;
  end;
  Titulo_receber1.Close;
  Titulo_receber1.Open;
end;

procedure TfMxCobCobrador.Valor_total;
begin
  if DM.Configuracao1.Empresa <> empLuciano then
  begin
    Total:=0;
    Titulo_receber1.First;
    while not Titulo_receber1.Eof do
    begin
      Total := Total + Titulo_receber1TRC_VALOR.Value;
      Titulo_receber1.Next;
    end;
    Titulo_receber1.First;
    lblTotal.Caption := 'R$ ' + Format('%.2f',[Total]);
  end;
end;

procedure TfMxCobCobrador.SpeedButton1Click(Sender: TObject);
var
  CPC:Integer;
  vData: TDateTime;
  sSituacao,vCliente,vParametro,vParametroCliente:string;
begin
  if Titulo_receber1.isEmpty then
    Raise Exception.Create('Cobrança sem registros!');
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRCCPC ON TITULO_A_RECEBER (CNC_CODIGO,CPC_CODIGO)');
  Except
  end;

  CPC := Entidade.CodigoCPC;

  Application.CreateForm(TfMxSelEnviaCobranca, fMxSelEnviaCobranca);
  fMxSelEnviaCobranca.mskDataINI.Text := DateToStr(DM.Configuracao1.Data);
  fMxSelEnviaCobranca.ShowModal;
  fMxSelEnviaCobranca.Free;

  Entidade.Close;
  Entidade.Open;
  Entidade.LocalizarCod(CPC,DM.Configuracao1.CodigoCNC);
end;


end.
