unit MxPagar;

interface                               

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Titulo_a_pagar, Pedido_de_Compra, Variants,
  Forma_de_Pagamento, Parametro, Conta_de_Caixa, Menus, Fornecedor,
  CentroCusto, Configuracao, Transportadora, AgenteFin, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfMxPagar = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoTPG: TEdit;
    Label2: TLabel;
    edtNumero: TEdit;
    edtSequencia: TEdit;
    Label3: TLabel;
    dblFornecedor: TDBLookupComboBox;
    edtValor: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    mskVencimento: TMaskEdit;
    memObservacao: TMemo;
    edtSituacao: TEdit;
    Label9: TLabel;
    Label12: TLabel;
    Titulo_a_pagar1: TTitulo_a_pagar;
    DSTitulo_a_pagar1: TDataSource;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Pedido_de_Compra1: TPedido_de_Compra;
    DSPedido_de_Compra1: TDataSource;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    SB_Paga: TSpeedButton;
    dblTipoDeDocumento: TDBLookupComboBox;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    dblContaAgendada: TDBLookupComboBox;
    Label14: TLabel;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    Label16: TLabel;
    Fornecedor1: TFornecedor;
    DSFornecedor1: TDataSource;
    Titulo_a_pagar1CNC_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_CODIGO: TIntegerField;
    Titulo_a_pagar1FOR_CODIGO: TIntegerField;
    Titulo_a_pagar1CCX_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_NUMERO: TStringField;
    Titulo_a_pagar1TPG_SEQUENCIA: TStringField;
    Titulo_a_pagar1TPG_VENCIMENTO: TDateTimeField;
    Titulo_a_pagar1TPG_VALOR: TFloatField;
    Titulo_a_pagar1TPG_TIPO_DOC: TIntegerField;
    Titulo_a_pagar1TPG_SITUACAO: TIntegerField;
    Titulo_a_pagar1TPG_PAGAMENTO: TDateTimeField;
    Titulo_a_pagar1TPG_VALOR_PAGO: TFloatField;
    Titulo_a_pagar1TPG_FORMA_PGTO: TStringField;
    Titulo_a_pagar1TPG_TIPO_PAG: TIntegerField;
    Titulo_a_pagar1PCP_CODIGO: TIntegerField;
    Titulo_a_pagar1BNF_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_TIPO_PERIODO: TIntegerField;
    Titulo_a_pagar1TPG_CUSTODIA: TStringField;
    GroupBox1: TGroupBox;
    edtNumeroDePrestacoes: TEdit;
    edtIntervaloEmDias: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Transportadora1: TTransportadora;
    Titulo_a_pagar1TRN_CODIGO: TIntegerField;
    Label11: TLabel;
    dblTransportadora: TDBLookupComboBox;
    DSTransportadora1: TDataSource;
    Titulo_a_pagar1TPG_OBSERVACAO: TStringField;
    Titulo_a_pagar1USU_CODIGO: TIntegerField;
    Titulo_a_pagar1TPG_DT_ALTERADO: TDateTimeField;
    Titulo_a_pagar1CCX_CODIGO_REC: TIntegerField;
    Titulo_a_pagar1TPG_GEROU_MOVIMENTO: TSmallintField;
    Conta_de_Caixa2: TConta_de_Caixa;
    Titulo_a_pagar1CHQ_CODIGO: TStringField;
    Titulo_a_pagar1Centro: TStringField;
    Titulo_a_pagar1Conta: TStringField;
    Fornecedor2: TFornecedor;
    Transportadora2: TTransportadora;
    Label10: TLabel;
    dblCodigoCNC: TDBLookupComboBox;
    CentroCusto2: TCentroCusto;
    Titulo_a_pagar1Fornecedor: TStringField;
    Titulo_a_pagar1TPG_DT_CADASTRO: TDateTimeField;
    Label13: TLabel;
    dblTipoPagamento: TDBLookupComboBox;
    Parametro3: TParametro;
    DSParametro3: TDataSource;
    Label15: TLabel;
    edtPedido: TEdit;
    Titulo_a_pagar1TPG_DESCONTO: TFloatField;
    Titulo_a_pagar1TPG_JUROS: TFloatField;
    Titulo_a_pagar1CNC_ORIGEM: TIntegerField;
    Titulo_a_pagar1TPG_TITULOANT: TIntegerField;
    Titulo_a_pagar1TPG_TPGORIGINAL: TIntegerField;
    Titulo_a_pagar1TPG_DTORIGINAL: TDateTimeField;
    Label17: TLabel;
    mskCompetencia: TMaskEdit;
    Titulo_a_pagar1TPG_DT_COMPETENCIA: TDateTimeField;
    Titulo_a_pagar1TPG_AGENCIA_CONTA: TStringField;
    Titulo_a_pagar1CNC_CHEQUE: TIntegerField;
    Titulo_a_pagar1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_a_pagar1MCC_CODIGO: TIntegerField;
    Titulo_a_pagar1FPE_CODIGO: TIntegerField;
    bitConfirmar: TBitBtn;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    Sair1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    EfetuarPagamento1: TAction;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Titulo_a_pagar1AfterScroll(DataSet: TDataSet);
    procedure SB_PagaClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblTransportadoraClick(Sender: TObject);
    procedure dblFornecedorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Titulo_a_pagar1CalcFields(DataSet: TDataSet);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure bitConfirmarClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TTitulo_a_pagar;
  end;

var
  fMxPagar: TfMxPagar;

implementation
Uses UDM, MxPagBai,funcoes, MxCheque;
{$R *.DFM}



procedure TfMxPagar.SB_PrimClick(Sender: TObject);
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

procedure TfMxPagar.SB_AntClick(Sender: TObject);
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

procedure TfMxPagar.SB_ProxClick(Sender: TObject);
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

procedure TfMxPagar.SB_UltClick(Sender: TObject);
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

procedure TfMxPagar.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  Incluir1.Enabled    := not Habilitar;
  Alterar1.Enabled    := not Habilitar;
  Excluir1.Enabled    := not Habilitar;
  Localizar1.Enabled  := not Habilitar;
  Salvar1.Enabled     := Habilitar;
  Cancelar1.Enabled   := Habilitar;
  SB_Prim.Enabled     := not Habilitar;
  SB_Ant.Enabled      := not Habilitar;
  SB_Prox.Enabled     := not Habilitar;
  SB_Ult.Enabled      := not Habilitar;
  SB_Loc.Enabled      := not Habilitar;
  SB_Novo.Enabled     := not Habilitar;
  SB_Alt.Enabled      := not Habilitar;
  SB_Exc.Enabled      := not Habilitar;
  SB_Salva.Enabled    := Habilitar;
  SB_Canc.Enabled     := Habilitar;
  SB_Paga.Enabled     :=  not Habilitar;
  EfetuarPagamento1.Enabled :=  not Habilitar;

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

  //
  if Entidade.Estado = 1 then
  Begin
    edtNumeroDePrestacoes.Enabled := Habilitar;
    edtIntervaloEmDias.Enabled    := Habilitar;
    if not Habilitar then
    Begin
      edtNumeroDePrestacoes.Color := AlteraCorComponentes;
      edtIntervaloEmDias.Color    := AlteraCorComponentes;
    end
    else
    Begin
      edtNumeroDePrestacoes.Color := clWindow;
      edtIntervaloEmDias.Color    := clWindow;
    end;
  end
  else
  Begin
    edtNumeroDePrestacoes.Enabled := False;
    edtNumeroDePrestacoes.Color   := AlteraCorComponentes;
    edtIntervaloEmDias.Enabled    := False;
    edtIntervaloEmDias.Color      := AlteraCorComponentes;
  end;

  DBGrid5.Enabled    := not Habilitar;
end;


procedure TfMxPagar.SB_NovoClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4530)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if DM.Configuracao1.Empresa IN [empLBM, empMotical, empLuciano] then //LBM ou Motical
  Begin
    dblCodigoCNC.Enabled := True;
    if dblCodigoCNC.Text = '' then
      dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
  end
  else //Demais empresas
    dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
  Entidade.PreparaInsercao;
  AtualizaControles(1,true);
  dblContaAgendada.SetFocus;
end;

procedure TfMxPagar.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4540)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para Alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1,true);  
  dblContaAgendada.SetFocus;
end;

procedure TfMxPagar.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4550)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.deletarauto;
end;

procedure TfMxPagar.SB_SalvaClick(Sender: TObject);
var
  mensagem,Titulos:string;
  I:Integer;
  DataInicial : TDateTime;
begin
  mensagem:='';
  If dblContaAgendada.Text = '' then
    mensagem:=mensagem+'Centro de Custo incorreto!'+#13;
  If dblContaAgendada.Text = '' then
    mensagem:=mensagem+'Conta de Caixa incorreto!'+#13;
  If dblTipoDeDocumento.Text = '' then
    mensagem:=mensagem+'Tipo de documento incorreto!'+#13;
  If dblTipoPagamento.Text = '' then
    mensagem:=mensagem+'Tipo de Pagamento incorreto!'+#13;
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
  if mensagem<>'' then
    raise exception.Create(mensagem);
  if edtSequencia.Text='' then
    edtSequencia.Text:='1';
  dblCodigoCNC.Enabled := False;
  Titulos:=edtCodigoTPG.Text;
  DataInicial := StrToDate(mskVencimento.Text);
  if (edtNumeroDePrestacoes.Text<>'') and (Entidade.Estado=1) then
  Begin
    For I:=1 to StrToInt(edtNumeroDePrestacoes.Text)-1 do
    begin
      Entidade.FinalizaEdicao;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * FROM TITULO_A_PAGAR '+
        ' WHERE TPG_CODIGO ='+IntToStr(Entidade.SCodigo)+
        ' ORDER BY TPG_CODIGO ';
      Entidade.Open;
      Entidade.Estado:=1;
      if edtIntervaloEmDias.Text <> '' then
        mskVencimento.Text:=DateToStr(StrToDate(mskVencimento.Text)+StrToInt(edtIntervaloEmDias.Text))
      else
        mskVencimento.Text:=DateToStr(IncMonth(DataInicial,i));
      edtSequencia.Text:=IntToStr(StrToInt(edtSequencia.Text)+1);
      Entidade.ProximoCodigo('TPG_CODIGO');
      Titulos:=Titulos+' OR TPG_CODIGO='+IntToStr(Entidade.SCodigo);
    end;
  End;
  edtNumeroDePrestacoes.Text:='';
  edtIntervaloEmDias.Text:='';
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(1,false);
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM TITULO_A_PAGAR WHERE '+
      ' TPG_SITUACAO=0 AND (TPG_CODIGO ='+Titulos+')';
    Entidade.Open;
  end;
end;

procedure TfMxPagar.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  dblCodigoCNC.Enabled := False;
  AtualizaControles(1,false);  
end;

procedure TfMxPagar.SB_LocClick(Sender: TObject);
var
  mensagem, sCodigoFOR:string;
begin
  mensagem:='';
  if (edtLocalizar.Text<>'*') then
  Begin
    If (cmbCampo.ItemIndex=0) then
      if not VerificaInteiroBranco(edtLocalizar.Text) then
        mensagem:= mensagem+'Código a ser localizado inválido!'+#13;
    If (cmbCampo.ItemIndex=2) then
      if not VerificaInteiroBranco(edtLocalizar.Text) then
        mensagem:= mensagem+'Pedido a ser localizado inválido!'+#13;
    If (cmbCampo.ItemIndex=10) then
      if not VerificaFloatBranco(edtLocalizar.Text) then
        mensagem:= mensagem+'Valor a ser localizado inválido!'+#13;
    if mensagem<>'' then
     raise exception.Create(mensagem);
  end;
  if (cmbCampo.ItemIndex = 4) then //Nome do Fornecedor
  Begin
    sCodigoFOR := '';
    Entidade.Close;
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FOR_CODIGO FROM FORNECEDOR '+
        ' WHERE FOR_RZ_SOCIAL LIKE "%'+edtLocalizar.Text+'%" '+
        ' AND FOR_CODIGO IN (SELECT FOR_CODIGO FROM TITULO_A_PAGAR '+
        ' WHERE TPG_SITUACAO=0) ';
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
          ' WHERE TPG_SITUACAO=0 '+
          ' AND ('+sCodigoFOR+') '+
          ' ORDER BY TPG_CODIGO ';
        Entidade.Open;
      end;
    end;
  end
  else if (cmbCampo.ItemIndex = 6) then //Nome da Transportadora
  Begin
    sCodigoFOR := '';
    Entidade.Close;
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TRN_CODIGO FROM TRANSPORTADORA '+
        ' WHERE TRN_RZ_SOCIAL LIKE "%'+edtLocalizar.Text+'%" '+
        ' AND TRN_CODIGO IN (SELECT TRN_CODIGO FROM TITULO_A_PAGAR '+
        ' WHERE TPG_SITUACAO=0) ';
      Open;
      while not Eof do
      Begin
        if sCodigoFOR = '' then
          sCodigoFOR := ' TRN_CODIGO='+FieldByName('TRN_CODIGO').asString
        else
          sCodigoFOR := sCodigoFOR + ' OR TRN_CODIGO=' + FieldByName('TRN_CODIGO').asString;
        Next;
      end;
      if not IsEmpty then
      Begin
        Entidade.Close;
        Entidade.SQL.Text:='SELECT * FROM TITULO_A_PAGAR '+
          ' WHERE TPG_SITUACAO=0 '+
          ' AND ('+sCodigoFOR+') '+
          ' ORDER BY TPG_CODIGO ';
        Entidade.Open;
      end;
    end;
  end
  else
   Entidade.Selecionar;
  if Entidade.IsEmpty then
  Begin
    Entidade.CarregaDados;
  end;
end;

procedure TfMxPagar.Cliente1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_PAGAR_');
  except
  end;
  Entidade.Close;
  Parametro1.Close;
  Parametro2.Close;
  Parametro3.Close;
  Titulo_a_pagar1.Close;
  Pedido_de_Compra1.Close;
  Conta_de_Caixa1.Close;
  Conta_de_Caixa2.Close;
  Action:=Cafree;
end;
procedure TfMxPagar.Titulo_a_pagar1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxPagar.SB_PagaClick(Sender: TObject);
begin
  //awof  120109 - verifica se o mês é ilimitado
{  DM.QR_Consultas.Close;
  DM.QR_Consultas.SQL.text:= ' select * from LIMITE_MES where ILIMITADO=''1'' AND '+
                             ' CCX_CODIGO= '''+IntToStr(dblContaAgendada.KeyValue)+''''+
                             ' AND CNC_CODIGO='''+IntToStr(dblCodigoCNC.KeyValue)+''''+
                             ' AND MES='+ FormatDateTime('mm', DM.Configuracao1.Data);
  DM.QR_Consultas.Open;

  IF DM.QR_Consultas.RecordCount > 0 THEN
  BEGIN
     //recebe a soma dos valores pagos no mês
     DM.QR_Consultas2.Close;
     DM.QR_Consultas2.SQL.text:= ' SELECT SUM(TP.TPG_VALOR_PAGO) AS TPG_VALOR_PAGO FROM TITULO_A_PAGAR TP '+
                                 ' WHERE TP.CCX_CODIGO = '''+IntToStr(dblContaAgendada.KeyValue)+''' AND TP.CNC_CODIGO= '''+IntToStr(dblCodigoCNC.KeyValue)+''' '+
                                 ' AND MONTH(TP.TPG_PAGAMENTO)= '+ FormatDateTime('mm', DM.Configuracao1.Data) +
                                 ' AND YEAR(TP.TPG_PAGAMENTO)= '+ FormatDateTime('yyyy', DM.Configuracao1.Data);
     //receber a soma do valor limite mês
     DM.QR_Consultas.Close;
     DM.QR_Consultas.SQL.text:= ' select SUM(VALOR_LIMITE) from LIMITE_MES where '+
                                ' CCX_CODIGO= '''+IntToStr(dblContaAgendada.KeyValue)+''''+
                                ' AND CNC_CODIGO='''+IntToStr(dblCodigoCNC.KeyValue)+''''+
                                ' AND MES='+ FormatDateTime('mm', DM.Configuracao1.Data);
     DM.QR_Consultas.Open;

     if  (DM.QR_Consultas2.FieldByName('TPG_VALOR_PAGO').asFloat + StrToFloat(edtValor.Text)) > DM.QR_Consultas.FieldByName('VALOR_LIMITE').asFloat then
     begin
       ShowMessage('Valor do Mês limitado');
       exit;
     end;

  END;
  //fim awof
}  
  If Titulo_a_pagar1.IsEmpty then
    raise Exception.Create('Selecione um título antes de continuar!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(2220)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Receber Efetuar Pagamento!');
  if Entidade.Situacao <> 0 then
    Raise Exception.Create('Título pago!');
  if dblTipoDeDocumento.Text = '' then
    Raise Exception.Create('Tipo de Documento inválido!');
  if dblTipoPagamento.Text = '' then
    Raise Exception.Create('Tipo de Pagamento inválido!');
  if DM.Configuracao1.Empresa IN [empMotical, empLuciano] then 
    if (not DM.Configuracao1.CPD) then
      Raise exception.Create('Somente no CPD!');
  Application.CreateForm(TfMxSPagBai,fMxSPagBai);
  with fMxSPagBai do
  Begin
    edtCodigoTPG.Text         := self.edtCodigoTPG.Text;
    edtNumeroDocumento.Text   := self.edtNumero.Text;
    edtSequencia.Text         := self.edtSequencia.Text;
    mskVencimento.Text        := self.mskVencimento.Text;
    edtValorTitulo.Text       := self.edtValor.Text;
    mskDataPagamento.Text     := FormatDateTime('dd/mm/yyyy',DM.Configuracao1.DataHora);
    dblTipoPagamento.KeyValue := self.dblTipoPagamento.KeyValue;
    dblContaAgendada.KeyValue := self.dblContaAgendada.KeyValue;
    dblContaRecebida.KeyValue := self.dblContaAgendada.KeyValue;
    ShowModal;
  end;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfMxPagar.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxPagar.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxPagar.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Parametro1.Open;
  Parametro2.Open;
  Parametro3.Open;
  Conta_de_Caixa1.Open;
  Fornecedor1.Open;
  Transportadora1.Open;
  CentroCusto1.Open;
  Entidade.Open;
  if tag = 1 then
    bitConfirmar.Visible := True;
  edtLocalizar.SetFocus;
  cmbCampo.ItemIndex:=2;
end;

procedure TfMxPagar.FormCreate(Sender: TObject);
begin
  Entidade:=Titulo_a_pagar1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_PAGAR_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;


procedure TfMxPagar.dblTransportadoraClick(Sender: TObject);
begin
  dblFornecedor.KeyValue:=0;
end;

procedure TfMxPagar.dblFornecedorClick(Sender: TObject);
begin
  dblTransportadora.KeyValue:=0;
end;

procedure TfMxPagar.FormKeyPress(Sender: TObject; var Key: Char);
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
  else if key=#13 then
  Begin
    if SB_Salva.Enabled then
    Begin
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
    end
    else if bitConfirmar.Visible then
    Begin
      bitConfirmar.SetFocus;
      bitConfirmarClick(sender);
    end;
  end
  else if (edtValor.Focused)and(Key = '.') then
    Key := ',';
end;

procedure TfMxPagar.Titulo_a_pagar1CalcFields(DataSet: TDataSet);
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

  //Definir a Conta
  with Conta_de_Caixa2 do
  Begin
    if Active = False then
      Open;
    if (Entidade.CodigoCCX > 0) then
    Begin
      if (Entidade.CodigoCCX <> COdigoCCX) then
      Begin
        Close;
        ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
        Open;
      end;
      Entidade.FieldByName('Conta').asString := Descricao;
    end
    else
      Entidade.FieldByName('Conta').asString := '';
  end;

  //Definir a Fornecedor/Transportadora
    if Entidade.CodigoFOR > 0 then
    with Fornecedor2 do
    Begin
      if Active = False then
        Open;
      if (Entidade.CodigoFOR <> COdigoFOR) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := Entidade.CodigoFOR;
        Open;
      end;
      Entidade.FieldByName('Fornecedor').asString := RazaoSocial;
    end
  else if Entidade.CodigoTRN > 0 then
    with Transportadora2 do
    Begin
      if Active = False then
        Open;
      if (Entidade.CodigoTRN <> COdigoTRN) then
      Begin
        Close;
        ParamByName('TRN_CODIGO').asInteger := Entidade.CodigoTRN;
        Open;
      end;
      Entidade.FieldByName('Fornecedor').asString := RazaoSocial;
    end
  else
    Entidade.FieldByName('Fornecedor').asString := '';

end;

procedure TfMxPagar.memObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfMxPagar.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxPagar.bitConfirmarClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Registro!');

  if self.Tag = 1 then
  Begin
    fMxCheque.edtTituloCNC.Text := IntToStr(Entidade.CodigoCNC);
    fMxCheque.edtTitulo.Text := IntToStr(Entidade.CodigoTPG);
  end;
  
  Close;
end;

end.
