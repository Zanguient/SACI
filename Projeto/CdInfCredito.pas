unit CdInfCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Informacoes, Avalista, Menus, Titulo_receber,
  Pedido_de_Venda, Usuario, Parametro, Forma_de_Pagamento, Profissao;

type
  TfCadInfCred = class(TForm)
    Panel13: TPanel;
    edtValorUltima: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    dblAvalista: TDBLookupComboBox;
    Label1: TLabel;
    mskDataUltima: TMaskEdit;
    Label8: TLabel;
    edtValorInadiplente: TEdit;
    edtLimiteCredito: TEdit;
    edtMotivoProibicao: TEdit;
    Label9: TLabel;
    edtDiasAtraso: TEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    SB_AltCab: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Avalista1: TAvalista;
    Informacoes1: TInformacoes;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    AlterarCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    Avalista2: TMenuItem;
    IncluirAvalista: TMenuItem;
    Label7: TLabel;
    edtCredito: TEdit;
    Label11: TLabel;
    edtCodigoCLI: TEdit;
    Label10: TLabel;
    edtRazaoSocial: TEdit;
    DSAvalista1: TDataSource;
    SB_Fechar: TSpeedButton;
    SB_Atualizar: TSpeedButton;
    AtualizarCab: TMenuItem;
    Pedido_de_Venda1: TPedido_de_Venda;
    Titulo_receber1: TTitulo_receber;
    Titulo_receber1SOMA: TFloatField;
    Titulo_receber2: TTitulo_receber;
    Titulo_receber2CNC_CODIGO: TIntegerField;
    Titulo_receber2CLI_CODIGO: TIntegerField;
    Titulo_receber2TRC_SITUACAO: TIntegerField;
    edtUsuario: TEdit;
    mskDataAlterado: TMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    Titulo_receber2TRC_VENCIMENTO: TDateTimeField;
    ckbVendaProibida: TCheckBox;
    Titulo_receber3: TTitulo_receber;
    Titulo_receber3Utilizado: TFloatField;
    edtClienteCNC: TEdit;
    btnLimpaAvalista: TBitBtn;
    Label16: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cmbUF: TComboBox;
    dblLogradouro: TDBLookupComboBox;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtEndereco: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    cmbUFCob: TComboBox;
    dblLogradouroCob: TDBLookupComboBox;
    edtBairroCob: TEdit;
    edtCidadeCob: TEdit;
    edtEnderecoCob: TEdit;
    Label25: TLabel;
    mskCEPCob: TMaskEdit;
    Label26: TLabel;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    ckbBoleto: TCheckBox;
    Label27: TLabel;
    dblFormaDePagamento: TDBLookupComboBox;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    btnLimpaFPG: TBitBtn;
    Label28: TLabel;
    edtRendaMensal: TEdit;
    ckbLiberaInadiplencia: TCheckBox;
    Label29: TLabel;
    edtLimiteCreditoConvenio: TEdit;
    Label30: TLabel;
    edtCreditoUtilizadoConvenio: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    edtConvenio: TEdit;
    edtRazaoSocialConvenio: TEdit;
    edtConvenioCNC: TEdit;
    Cliente1: TCliente;
    Label34: TLabel;
    dblProfissao: TDBLookupComboBox;
    Profissao1: TProfissao;
    DSProfissao1: TDataSource;
    Label35: TLabel;
    edtRendaExtra: TEdit;
    edtOrigemExtra: TEdit;
    Label12: TLabel;
    edtCreditoUtilizado: TEdit;
    Label19: TLabel;
    Label36: TLabel;
    edtReferencia1: TEdit;
    Label37: TLabel;
    mskFoneReferencia1: TMaskEdit;
    Label38: TLabel;
    edtReferencia2: TEdit;
    Label39: TLabel;
    mskFoneReferencia2: TMaskEdit;
    Label40: TLabel;
    edtReferencia3: TEdit;
    Label41: TLabel;
    mskFoneReferencia3: TMaskEdit;
    Label42: TLabel;
    edtReferencia4: TEdit;
    Label43: TLabel;
    mskFoneReferencia4: TMaskEdit;
    Label44: TLabel;
    edtLocalTrabalho: TEdit;
    Label4: TLabel;
    edtTempoTrabalho: TEdit;
    Label45: TLabel;
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ckbVendaProibidaClick(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_AtualizarClick(Sender: TObject);
    procedure Avalista1BeforeOpen(DataSet: TDataSet);
    procedure Informacoes1AfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaAvalistaClick(Sender: TObject);
    procedure btnLimpaFPGClick(Sender: TObject);
    procedure edtConvenioExit(Sender: TObject);
    procedure IncluirAvalistaClick(Sender: TObject);
    procedure dblAvalistaKeyPress(Sender: TObject; var Key: Char);
    procedure mostrar;
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TInformacoes;
    AVL : integer;
  end;

var
  fCadInfCred: TfCadInfCred;

implementation
Uses UDM, funcoes, CdAvalista;
{$R *.DFM}

procedure TfCadInfCred.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');

  if DM.Configuracao1.Empresa = empLBM then
    if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3910)) < 0) and
       (StrToFloat(edtLimiteCredito.Text) <> 0) then
      Raise Exception.Create('Usuário sem permissão de alterar Crédito já definido!');

  if (not DM.Configuracao1.CPD) and
     (DM.Configuracao1.Empresa = empMotical) then
    raise Exception.Create('Somente no CPD.');

  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) or
     ((DM.Configuracao1.CodigoCNC<>Entidade.CodigoCNC) and
     (DM.Configuracao1.Empresa <> empMotical)) then
    raise Exception.Create('Você não pode alterar registro neste centro de custo.');

  Entidade.Close;
  Entidade.ParamByName('CLI_CODIGO').AsInteger := StrToInt(edtCodigoCLI.Text);
  Entidade.ParamByName('CNC_CODIGO').AsInteger := StrToInt(edtClienteCNC.Text);
  Entidade.open;
  Entidade.PreparaAlteracao;
  AtualizaControles(1, True);
end;

procedure TfCadInfCred.SB_SalvaCabClick(Sender: TObject);
var
  CdCNCCLI, CdCLI, iOPS: integer;
  sBoleto,sLiberaInadiplencia: string;
  Trans, vAlterarLimCredConvenio:Boolean;
begin
  if (Trim(edtMotivoProibicao.Text) = '') and
     (ckbVendaProibida.Checked) then
    Raise Exception.Create('Justifique a Proibição!');
  if not VerificaFloatBranco(edtLimiteCredito.Text) then
    Raise Exception.Create('Limite de Crédito inválido!');
  if not VerificaFloatBranco(edtLimiteCreditoConvenio.Text) then
    Raise Exception.Create('Limite de Crédito inválido!');
  if not VerificaFloatBranco(edtRendaMensal.Text) then
    Raise Exception.Create('Renda Mensal inválida!');
  if not VerificaFloat(edtRendaExtra.Text) then
    Raise Exception.Create('Renda Extra inválida!');
  if StrToFloat(edtRendaExtra.Text) > 0 then
  Begin
    if Trim(edtOrigemExtra.Text) = '' then
      Raise exception.Create('Justifique a renda extra!');
  end
  else
    edtOrigemExtra.Clear;

  CdCNCCLI := StrToInt(edtClienteCNC.Text);
  CdCLI    := StrToInt(edtCodigoCLI.Text);

  if ckbBoleto.Checked then
    sBoleto := 'Sim'
  else
    sBoleto := 'Nao';

  if ckbLiberaInadiplencia.Checked then
    sLiberaInadiplencia := 'Sim'
  else
    sLiberaInadiplencia := 'Nao';

  //Limite Básico LBM
  if (DM.Configuracao1.Empresa = empLBM) and
     (StrToFloat(edtLimiteCredito.Text) <> 999.99) then
  Begin
    if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3910)) < 0) then
    Begin
      ShowMessage('Limite inválido!');
      edtLimiteCredito.Text := '999,99';
      Exit;
    end;
  end;

  iOPS := 0;
  //Limite Básico
  if (StrToFloat(edtLimiteCredito.text) > 0) then
  Begin
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3900)) < 0) and   //Limite de Crédito Básico
       (DM.Usuario1.Permissoes.IndexOf(IntToStr(3910)) < 0) then  //Limite de Crédito Total
    Begin
      ShowMessage('Usuário não tem Permissão para Liberar Limite de Crédito!');
      edtLimiteCredito.SetFocus;
      Exit;
    end
    else if (Arredonda(StrToFloat(edtLimiteCredito.text)) > Arredonda(DM.Configuracao1.LimiteCreditoBasico)) then
    Begin
      if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3910)) < 0) then //Limite de Crédito Total
      Begin
        ShowMessage('Limite de Crédito acima do permitido!');
        edtLimiteCredito.SetFocus;
        Exit;
      end
      else
        iOPS := 3910;  //Limite de Crédito Total
    end
    else
      iOPS := 3900;    //Limite de Crédito Básico
  end;

  if Arredonda(StrToFloat(edtLimiteCreditoConvenio.Text)) <> Arredonda(Entidade.LimiteCreditoConvenio) then
    vAlterarLimCredConvenio := True
  else
    vAlterarLimCredConvenio := False;

  Trans:=false;
  with DM.Database2 do
  begin
    {try
      StartTransaction;
      Trans:=True;}

      if not Entidade.FinalizaEdicao then  //Não gera LOG
        Raise exception.Create('');

      //alterando campos
      try
        DM.QuerySelect.Close;
        DM.QuerySelect.SQL.Text:='UPDATE INFORMACOES_DE_CREDITO SET '+ //ICR_TEMPO_TRABALHO='''+edtTempoTrabalho.Text+''','+
                                 ' ICR_LOCAL_TRABALHO='''+edtLocalTrabalho.Text+''' WHERE '+
                                 ' CLI_CODIGO='''+edtCodigoCLI.Text+''' AND CNC_CODIGO='''+inttostr(DM.Configuracao1.CodigoCNC)+'''';
        DM.QuerySelect.ExecSQL;
      except
      end;

      AtualizaControles(1, False);

      Entidade.GeraLog(1120,CdCNCCLI,CdCLI,'Lim:'+edtLimiteCredito.Text+
                                           ' LimConv:'+edtLimiteCreditoConvenio.Text+
                                           ' AVL:'+dblAvalista.Text+
                                           ' Renda:'+edtRendaMensal.Text+
                                           ' Extra:'+edtRendaExtra.Text+
                                           ' Bol:'+sBoleto+
                                           ' Lib:'+sLiberaInadiplencia+
                                           ' FPG:'+dblFormaDePagamento.Text+
                                           ' Bloquear:'+edtMotivoProibicao.Text+
                                           ' EndCob:'+edtEnderecoCob.Text+
                                           ' BaiCob:'+edtBairroCob.Text+
                                           ' CidCob:'+edtCidadeCob.Text);
      if iOPS > 0 then
        Entidade.GeraLog(iOPS,CdCNCCLI,CdCLI,'Limite de Credito: R$ '+edtLimiteCredito.Text);

      if vAlterarLimCredConvenio then
        Entidade.GeraLog(7900,CdCNCCLI,CdCLI,'Limite de Credito Convênio: R$ '+edtLimiteCreditoConvenio.Text);

     { Commit;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;}
  End;
end;

procedure TfCadInfCred.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
end;

procedure TfCadInfCred.FormCreate(Sender: TObject);
begin
  Entidade:=Informacoes1;
end;

procedure TfCadInfCred.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Avalista1.Close;
  Action:=Cafree;
end;

procedure TfCadInfCred.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfCadInfCred.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadInfCred.FormShow(Sender: TObject);
var
  vDataUltCompra: TDateTime;
begin
  DM.Usuario1.ConfiguraTela(self);

  edtConvenioExit(sender);

  if DM.Configuracao1.Empresa = empLuciano then
    ckbBoleto.Visible := False;

  Parametro1.Open;
  Parametro2.Open;
  Forma_de_Pagamento1.Open;
  Profissao1.Open;

  Avalista1.Open;
  Entidade.Close;
  Entidade.ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
  Entidade.ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtClienteCNC.Text);
  Entidade.open;
  if Entidade.IsEmpty and
    ((DM.Configuracao1.CodigoCNC=StrToInt(edtClienteCNC.Text)) or
     (DM.Configuracao1.Empresa = empMotical)) then
  Begin
    SB_AtualizarClick(Sender);
    vDataUltCompra := 0;
    if VerificaDataBranco(mskDataUltima.Text) then
      vDataUltCompra := StrToDateTime(mskDataUltima.Text);

    if MessageDlg('O cliente ainda não tem Limite de Crédito.'+#13+
        'Deseja definir (R$ '+format('%.2f',[DM.Configuracao1.LimiteCreditoBasico])+')?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Entidade.Inserir(StrToInt(edtClienteCNC.Text),StrToInt(edtCodigoCLI.Text),0,
        StrToInt(edtDiasAtraso.Text),0,0,StrToFloat(edtValorUltima.Text),
        StrToFloat(edtValorInadiplente.Text),DM.Configuracao1.LimiteCreditoBasico,0(*Renda*),
        vDataUltCompra,''(*MotivoProibição*),''(*End.Cob*),''(*BairroCob*),
        ''(*CidadeCob*),''(*UFCob*),''(*CEPCob*),False(*Bloqueio*),False(*Boleto*),
        StrToFloat(edtCreditoUtilizado.Text))
    else
      Entidade.Inserir(StrToInt(edtClienteCNC.Text),StrToInt(edtCodigoCLI.Text),0,
        StrToInt(edtDiasAtraso.Text),0,0,StrToFloat(edtValorUltima.Text),
        StrToFloat(edtValorInadiplente.Text),0(*Lim. Crédito*),0(*Renda*),
        vDataUltCompra,''(*MotivoProibição*),''(*End.Cob*),''(*BairroCob*),
        ''(*CidadeCob*),''(*UFCob*),''(*CEPCob*),False(*Bloqueio*),False(*Boleto*),
        StrToFloat(edtCreditoUtilizado.Text));

    Entidade.Close;
    Entidade.ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
    Entidade.ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtClienteCNC.Text);
    Entidade.open;
  end;
  Entidade.CarregaDados;
  mostrar;

  //
  Label36.Caption := 'Cônjuge';
  Label38.Caption := 'Profissão';
  Label40.Caption := 'Local de Trabalho';
  Label42.Caption := 'Pessoa de Referência';
end;


procedure TfCadInfCred.ckbVendaProibidaClick(Sender: TObject);
begin
  if ckbVendaProibida.Checked and
     ckbVendaProibida.Enabled then
  Begin
    edtMotivoProibicao.Enabled := True;
    edtMotivoProibicao.Color   := clWindow;
    edtMotivoProibicao.SetFocus;
  end
  else
  Begin
    edtMotivoProibicao.Enabled := False;
    edtMotivoProibicao.Color   := AlteraCorComponentes;
    edtMotivoProibicao.Clear;
  end;
end;

procedure TfCadInfCred.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadInfCred.SB_AtualizarClick(Sender: TObject);
begin
  with Pedido_de_Venda1 do
  Begin
    Close;
    if DM.Configuracao1.Empresa = empLBM then
      SQL.Text := 'SELECT TOP 1 P1.PDV_CODIGO, PDV_DATA_HORA AS DATA, '+
        ' (SELECT SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
        ' WHERE I1.CNC_CODIGO=P1.CNC_CODIGO AND I1.PDV_CODIGO=P1.PDV_CODIGO) AS TOTAL '+
        ' FROM PEDIDO_DE_VENDA P1 '+
        ' WHERE P1.CLI_CODIGO=:CLI_CODIGO '+
        ' AND P1.PDV_SITUACAO=4 '+
        ' ORDER BY P1.PDV_DATA_HORA DESC '
    else
      ParamByName('CNC_CODIGO').asInteger:=StrToInt(edtClienteCNC.Text);
    ParamByName('CLI_CODIGO').asInteger:=StrToInt(edtCodigoCLI.Text);
    Open;
    If not IsEmpty then
    Begin
      mskDataUltima.text:=formatDateTime('dd/mm/yyyy hh:mm', FieldByName('DATA').asDateTime);
      edtValorUltima.Text:=format('%.2f',[FieldByName('TOTAL').asFloat]);
    end
    else
    Begin
      mskDataUltima.Clear;
      edtValorUltima.Text := '0,00';
    end;
  end;

  with Titulo_receber1 do
  Begin
    Close;
    if DM.Configuracao1.Empresa = empLBM then
      SQL.Text := 'SELECT SUM(TRC_VALOR) AS SOMA '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CLI_CODIGO=:CLI_CODIGO '+
        ' AND TRC_VENCIMENTO<:Vencimento '+
        ' AND TRC_SITUACAO = 0 '
    else
      ParamByName('CNC_CODIGO').asInteger:=StrToInt(edtClienteCNC.Text);
    ParamByName('CLI_CODIGO').asInteger:=StrToInt(edtCodigoCLI.Text);
    ParamByName('Vencimento').asDate:=DM.Configuracao1.Data;
    Open;
    If FieldByName('SOMA').asFloat > 0 then
      edtValorInadiplente.text:=format('%.2f',[FieldByName('SOMA').asFloat])
    else
      edtValorInadiplente.Text := '0,00';
  end;

  with Titulo_receber2 do
  Begin
    Close;
    if DM.Configuracao1.Empresa = empLBM then
      SQL.Text := 'SELECT CNC_CODIGO,CLI_CODIGO,TRC_VENCIMENTO,TRC_SITUACAO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CLI_CODIGO=:CLI_CODIGO '+
        ' AND TRC_SITUACAO IN (0,1) '+
        ' ORDER BY TRC_VENCIMENTO ASC '
    else
      ParamByName('CNC_CODIGO').asInteger:=StrToInt(edtClienteCNC.Text);
    ParamByName('CLI_CODIGO').asInteger:=StrToInt(edtCodigoCLI.Text);
    Open;
    If not IsEmpty then
    Begin
      if Vencimento < DM.Configuracao1.Data then
        edtDiasAtraso.text:= IntToStr(Trunc(DM.Configuracao1.Data-Vencimento))
      else
        edtDiasAtraso.Text := '0';
    end
    else
      edtDiasAtraso.Text := '0';
  end;

  with Titulo_receber3 do
  Begin
    Close;
    if DM.Configuracao1.Empresa = empLBM then
      SQL.Text := 'SELECT SUM(TRC_VALOR) as Utilizado '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CLI_CODIGO=:CLI_CODIGO '+
        ' AND TRC_SITUACAO IN (0,1) '
    else
      ParamByName('CNC_CODIGO').asInteger:=StrToInt(edtClienteCNC.Text);
    ParamByName('CLI_CODIGO').asInteger:=StrToInt(edtCodigoCLI.Text);
    Open;
    If not Titulo_receber3.IsEmpty then
      edtCreditoUtilizado.Text := format('%.2f',[FieldByName('Utilizado').asFloat]);
  end;
  AtualizarCab.Enabled:=False;
  SB_Atualizar.Enabled:=False;
end;

procedure TfCadInfCred.Avalista1BeforeOpen(DataSet: TDataSet);
begin
  Avalista1.ParamByName('CNC_CODIGO').asInteger:=StrToInt(edtClienteCNC.Text);
end;

procedure TfCadInfCred.Informacoes1AfterOpen(DataSet: TDataSet);
begin
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfCadInfCred.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  Begin
    key:=#0;
    if (SB_CancCab.Enabled) then
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
    end
    else
      Close;
  end
  else if (Key = '"') then
    Key := #0;
end;

procedure TfCadInfCred.btnLimpaAvalistaClick(Sender: TObject);
begin
  dblAvalista.KeyValue := 0;
  try
    dblAvalista.SetFocus;
  except
  end;
end;

procedure TfCadInfCred.btnLimpaFPGClick(Sender: TObject);
begin
  dblFormaDePagamento.KeyValue := 0;
  try
    dblFormaDePagamento.SetFocus;
  except
  end;
end;

procedure TfCadInfCred.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  AlterarCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_AltCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);

  edtTempoTrabalho.Enabled := Habilitar;
  edtLocalTrabalho.Enabled := Habilitar;
  edtReferencia1.Enabled := Habilitar;
  mskFoneReferencia1.Enabled := Habilitar;
  edtReferencia2.Enabled := Habilitar;
  mskFoneReferencia2.Enabled := Habilitar;
  edtReferencia3.Enabled := Habilitar;
  mskFoneReferencia3.Enabled := Habilitar;
  edtReferencia4.Enabled := Habilitar;
  mskFoneReferencia4.Enabled := Habilitar;

  dblLogradouroCob.Enabled := Habilitar;
  edtEnderecoCob.Enabled   := Habilitar;
  edtBairroCob.Enabled     := Habilitar;
  edtCidadeCob.Enabled     := Habilitar;
  cmbUFCob.Enabled         := Habilitar;
  mskCEPCob.Enabled        := Habilitar;

  IncluirAvalista.Enabled  := not Habilitar;

  If (Habilitar) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(1120)) >= 0) then //Alterar Informações de Crédito
  Begin
    dblAvalista.Enabled         := True;
    btnLimpaAvalista.Enabled    := True;
    dblFormaDePagamento.Enabled := True;
    btnLimpaFPG.Enabled         := True;
    ckbVendaProibida.Enabled    := True;
    ckbVendaProibidaClick(ckbVendaProibida);
    dblAvalista.SetFocus;
  end
  else
  Begin
    dblAvalista.Enabled         := False;
    btnLimpaAvalista.Enabled    := False;
    dblFormaDePagamento.Enabled := False;
    btnLimpaFPG.Enabled         := False;
    ckbVendaProibida.Enabled    := False;
    edtMotivoProibicao.Enabled  := False;
  end;

  if (Habilitar) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(8390)) >= 0) then //Definir Liberar Inadiplência
    ckbLiberaInadiplencia.Enabled := True
  else
    ckbLiberaInadiplencia.Enabled := False;

  If (Habilitar) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(6230)) >= 0) then //Venda com Bloqueto
    ckbBoleto.Enabled := True
  else
    ckbBoleto.Enabled             := False;

  If (not Habilitar) or
     ((DM.Usuario1.Permissoes.IndexOf(IntToStr(3900)) < 0) AND
      (DM.Usuario1.Permissoes.IndexOf(IntToStr(3910)) < 0)) then
  Begin
    dblProfissao.Enabled   := False;
    edtRendaMensal.Enabled   := False;
    edtRendaExtra.Enabled   := False;
    edtOrigemExtra.Enabled   := False;
    edtLimiteCredito.Enabled := False;

  end
  else
  Begin
    dblProfissao.Enabled   := True;
    edtRendaMensal.Enabled   := True;
    edtRendaExtra.Enabled   := True;
    edtOrigemExtra.Enabled   := True;
    edtLimiteCredito.Enabled := True;
    if (DM.Configuracao1.Empresa = empLBM) and
       (StrToFloat(edtLimiteCredito.Text) = 0) then
      edtLimiteCredito.Text := format('%.2f',[DM.Configuracao1.LimiteCreditoBasico]);
    dblProfissao.SetFocus;
  end;

  If (not Habilitar) or
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(7900)) < 0) then //Alterar Limite de Crédito Convênio Manualmente
    edtLimiteCreditoConvenio.Enabled := False
  else
    edtLimiteCreditoConvenio.Enabled := True;
end;

procedure TfCadInfCred.edtConvenioExit(Sender: TObject);
begin
  with Cliente1 do
  Begin
    Close;
    ParamByName('CLI_CODIGO').AsInteger := StrToInt(edtConvenio.Text);
    ParamByName('CNC_CODIGO').AsInteger := StrToInt(edtConvenioCNC.Text);
    Open;
    if IsEmpty then
      edtRazaoSocialConvenio.Text := 'SEM CONVÊNIO'
    else
      edtRazaoSocialConvenio.Text := RazaoSocial;
  end;
end;

procedure TfCadInfCred.IncluirAvalistaClick(Sender: TObject);
var
  CdAVL: integer;
begin
  if not IncluirAvalista.Enabled then
    Exit;

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(980)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir Avalista!');

  Application.CreateForm(TfCadAvalista, fCadAvalista);
  with fCadAvalista do
  Begin
    Tag := 1;
    Showmodal;
  end;

  try
    CdAVL := dblAvalista.KeyValue;
  except
    CdAVL := 0;
  end;

  Avalista1.Close;
  Avalista1.Open;
  if CdAVL > 0 then
  Begin
    dblAvalista.KeyValue := CdAVL;
    if dblAvalista.Text = '' then
      dblAvalista.KeyValue := 0; 
  end;
end;

procedure TfCadInfCred.dblAvalistaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#32 then
  begin
    Application.CreateForm(TfCadAvalista, fCadAvalista);
    with fCadAvalista do
    Begin
      Tag := 0;
      Showmodal;
    end;
    Avalista1.Close;
    Avalista1.Open;
  end;
end;

procedure TfCadInfCred.mostrar;
begin
  edtTempoTrabalho.Text:=entidade.fieldbyname('ICR_TEMPO_TRABALHO').AsString;
  edtLocalTrabalho.Text:=entidade.fieldbyname('ICR_LOCAL_TRABALHO').AsString;
end;

end.
