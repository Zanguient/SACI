unit MxAlterarParcelas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Pedido_de_Compra, Parametro, Titulo_receber,
  Pedido_de_Venda, Menus, Conta_de_Caixa, Informacoes, CentroCusto,
  AgenteFin, Forma_de_Pagamento, Vendedor, ToolWin, ActnMan, ActnCtrls,
  ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfMxAlterarParcelas = class(TForm)
    Panel14: TPanel;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label1: TLabel;
    edtCodigoTRC: TEdit;
    Label2: TLabel;
    edtNumeroDocumento: TEdit;
    edtSequencia: TEdit;
    Label3: TLabel;
    edtValor: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    mskVencimento: TMaskEdit;
    dblTipoPagamento: TDBLookupComboBox;
    Label10: TLabel;
    Label12: TLabel;
    Titulo_receber1: TTitulo_receber;
    Cliente1: TCliente;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    DSCliente1: TDataSource;
    DSTitulo_receber1: TDataSource;
    dblTipoDocumento: TDBLookupComboBox;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    Label14: TLabel;
    dblContaDeCaixaAgendada: TDBLookupComboBox;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
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
    CentroCusto1: TCentroCusto;
    DSCentroCusto: TDataSource;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    edtBoleto: TEdit;
    Label9: TLabel;
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
    Titulo_receber1Centro: TStringField;
    CentroCusto2: TCentroCusto;
    Panel2: TPanel;
    Label19: TLabel;
    edtCodigoPDV: TEdit;
    Label4: TLabel;
    edtDataHoraPed: TEdit;
    Label5: TLabel;
    edtRazaoSocial: TEdit;
    Label28: TLabel;
    Label11: TLabel;
    Label26: TLabel;
    dblTipoPagamentoPed: TDBLookupComboBox;
    dblFormaDePagamentoPed: TDBLookupComboBox;
    dblAgenteFinanceiroPed: TDBLookupComboBox;
    Label30: TLabel;
    Bevel2: TBevel;
    imgFotoCliente: TImage;
    Label16: TLabel;
    Panel5: TPanel;
    bitCancelar: TBitBtn;
    Label13: TLabel;
    edtTotalPedidoComFrete: TEdit;
    Label15: TLabel;
    edtTotalTitulos: TEdit;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    Label17: TLabel;
    dblAgenteFinanceiro: TDBLookupComboBox;
    bitConfirmar: TBitBtn;
    edtPedidoCNC: TEdit;
    edtNotaFiscal: TEdit;
    Parametro3: TParametro;
    DSParametro3: TDataSource;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    edtClienteCNC: TEdit;
    edtCodigoCLI: TEdit;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    lbxTitulos: TListBox;
    Label29: TLabel;
    Label31: TLabel;
    Label8: TLabel;
    SB_AltPed: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    Titulo_receber2: TTitulo_receber;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    dblVendedor: TDBLookupComboBox;
    Label23: TLabel;
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
    bitLocalizar: TSpeedButton;
    Titulo_receber1TRC_LOCAL: TStringField;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    ActionManager1: TActionManager;
    AlterarPed: TAction;
    SalvarPed: TAction;
    CancelarAlteracoes: TAction;
    LocalizarPedido: TAction;
    Action6: TAction;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    CancelarPed: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    ConfirmarAlteracoes: TAction;
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPDVChange(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure dblTipoPagamentoPedClick(Sender: TObject);
    procedure lbxTitulosClick(Sender: TObject);
    procedure bitLocalizarClick(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
  private
    UltDtVencimento:TDateTime;
    Estado, iTipoPg, iFormaPg, iAgenteFin, iCdFUN: Integer;
    ValorAnterior : Double;
    ExcluirTRC: string;
    procedure SomarParcelas;
    procedure AtualizaCamposTitulo(Habilitar: Boolean);
    procedure AtualizaCamposPedido(Habilitar: Boolean);
  public
    Entidade:TTitulo_receber;
    Cancelar:Boolean;
  end;

var
  fMxAlterarParcelas: TfMxAlterarParcelas;

implementation
Uses UDM, MxSPediLoc, funcoes, CdCliente, DigSenha;

{$R *.DFM}

procedure TfMxAlterarParcelas.SB_NovoClick(Sender: TObject);
begin
  If (DM.Configuracao1.Empresa <> empLBM) and
     (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Não pode criar Títulos de outro centro!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4500)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Raise Exception.Create('Localize o Pedido de Venda!');
  UltDtVencimento := 0;

  Entidade.ProximoCodigo('TRC_CODIGO');
  edtCodigoTRC.Text := IntToStr(Entidade.SCodigo);

  edtValor.Text := format('%.2f',[StrToFloat(edtTotalPedidoComFrete.Text) - StrToFloat(edtTotalTitulos.Text)]);

  try
    if StrToInt(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.count-1],29,10))) >= lbxTitulos.Count then
      edtSequencia.Text := IntToStr(StrToInt(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.count-1],29,10)))+1)
    else
      edtSequencia.Text := IntToStr(lbxTitulos.Count+1);
  except
    edtSequencia.Text := IntToStr(lbxTitulos.Count+1);
  end;

  edtBoleto.Text := '0';

  ValorAnterior := 0;

  mskVencimento.Text := DateToStr(DM.Configuracao1.Data);

  Estado := 1;
  AtualizaCamposTitulo(True);
  dblTipoPagamento.SetFocus;
end;

procedure TfMxAlterarParcelas.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  If (DM.Configuracao1.Empresa <> empLBM) and
     (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Não pode criar Títulos de outro centro!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4510)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para Alterar registro!');
  if Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],87,12)) <> '0,00' then
    Raise Exception.Create('Título pago não pode ser alterado!');
  if Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],124,1)) = '1' then
    Raise Exception.Create('Título criado nessa tela não pode ser alterado!');
  UltDtVencimento := StrToDate(mskVencimento.Text);

  ValorAnterior := StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],74,12)));

  Estado := 2;
  AtualizaCamposTitulo(True);
end;

procedure TfMxAlterarParcelas.SB_ExcClick(Sender: TObject);
begin
  if lbxTitulos.Count <= 0 then
    raise exception.Create('Não há Título para ser excluído!');
  if lbxTitulos.ItemIndex < 0 then
    raise exception.Create('Selecione um Título!');
  If (DM.Configuracao1.Empresa <> empLBM) and
     (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Não pode excluir Títulos de outro centro!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4520)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para Excluir registro!');
  if Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],87,12)) <> '0,00' then
    Raise Exception.Create('Título pago não pode ser excluído!');

  edtTotalTitulos.Text := format('%.2f',[StrToFloat(edtTotalTitulos.Text)-
                                         StrToFloat(edtValor.Text)]);

  if ExcluirTRC = '' then
    ExcluirTRC := '('+Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],18,10))
  else
    ExcluirTRC := ExcluirTRC + ','+Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],18,10));

  lbxTitulos.Items.Delete(lbxTitulos.ItemIndex);
  try
    lbxTitulos.ItemIndex := 0;
    lbxTitulosClick(sender);
  except
  end;
end;

procedure TfMxAlterarParcelas.SB_SalvaClick(Sender: TObject);
var
  mensagem: string;
  PosicaoItem : integer;
begin
  mensagem := '';
  if not VerificaDataBranco(mskVencimento.Text) then
    mensagem := mensagem + 'Data de Vencimento inválida!'+#13;
  if not (dblContaDeCaixaAgendada.KeyValue > 0) then
    mensagem := mensagem + 'Conta de Caixa inválida!'+#13;
  if not (dblTipoDocumento.KeyValue > 0) then
    mensagem := mensagem + 'Tipo de documento inválido!'+#13;
  if not (dblTipoPagamento.KeyValue > 0) then
    mensagem := mensagem + 'Tipo de Pagamento inválido!'+#13;
  if not (dblAgenteFinanceiro.KeyValue > 0) then
    mensagem := mensagem + 'Agente Financeiro inválido!'+#13;
  if not VerificaFloatBranco(edtValor.Text) then
    mensagem := mensagem + 'Valor do Título inválido!'+#13;
  if not VerificaInteiroBranco(edtBoleto.Text) then
    mensagem := mensagem + 'Número do Boleto inválido!'+#13;
  if mensagem <> '' then
    Raise Exception.Create(mensagem);
  if StrToFloat(edtValor.Text) <= 0 then
    Raise Exception.Create('Valor incorreto!');

  if not VerificaInteiroBranco(edtBoleto.Text) then
    edtBoleto.Text := '0';

  if UltDtVencimento > 0 then
  Begin
    if Abs(UltDtVencimento-StrToDate(mskVencimento.Text)) > 5 then
      If DM.Usuario1.Permissoes.IndexOf(IntToStr(6040)) < 0 then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=30;
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

  if Estado = 2 then //Alterar
    PosicaoItem := lbxTitulos.ItemIndex
  else //Inserir
    PosicaoItem := lbxTitulos.Count;

  lbxTitulos.Items.Strings[PosicaoItem] := ' '+
    PreencheEspaco(15,Entidade.FieldByName('Centro').asString)+' '+ //2
    PreencheEspaco(10,edtCodigoTRC.Text)+' '+ // 18
    PreencheEspaco(10,edtSequencia.Text)+' '+ // 29
    PreencheEspaco(10,edtNumeroDocumento.Text)+' '+ // 40
    PreencheEspaco(11,edtBoleto.Text)+' '+ // 51
    PreencheEspaco(10,mskVencimento.Text)+' '+ // 63
    PreencheEspacoEsq(12,format('%.2f',[StrToFloat(edtValor.Text)]))+' '+ // 74
    PreencheEspacoEsq(12,format('%.2f',[0.00]))+' '+ // 87
    PreencheEspaco(5,IntToStr(dblContaDeCaixaAgendada.KeyValue))+' '+ // 100
    PreencheEspaco(5,IntToStr(dblTipoDocumento.KeyValue))+' '+ // 106
    PreencheEspaco(5,IntToStr(dblTipoPagamento.KeyValue))+' '+ // 112
    PreencheEspaco(5,IntToStr(dblAgenteFinanceiro.KeyValue))+' '+ //118
    PreencheEspaco(1,IntToStr(Estado)); // 124

  lbxTitulos.ItemIndex := Posicaoitem;

  if ValorAnterior <>  StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],74,12))) then
    edtTotalTitulos.Text := format('%.2f',[StrToFloat(edtTotalTitulos.Text)+
                                           StrToFloat(edtValor.Text)-ValorAnterior]);

  AtualizaCamposTitulo(False);

end;

procedure TfMxAlterarParcelas.SB_CancClick(Sender: TObject);
begin
  Estado := 0;
  AtualizaCamposTitulo(False);
  lbxTitulosClick(sender);
end;


procedure TfMxAlterarParcelas.FormCreate(Sender: TObject);
begin
  Entidade:=Titulo_receber1;

  Entidade.Close;
  if DM.Configuracao1.Empresa <> empLBM then
    Entidade.SQL.TExt :=  'SELECT * FROM TITULO_A_RECEBER '+
      ' WHERE PDV_CODIGO=:PDV_CODIGO '+
      ' AND CNC_CODIGO=:CNC_CODIGO '+
      ' AND TRC_SITUACAO <> 5 '+
      ' AND TRC_SITUACAO <> 4 '+
      ' ORDER BY TRC_CODIGO '
  else
    Entidade.SQL.TExt :=  'SELECT * FROM TITULO_A_RECEBER '+
      ' WHERE PDV_CODIGO=:PDV_CODIGO '+
      ' AND TRC_SITUACAO <> 5 '+
      ' AND TRC_SITUACAO <> 4 '+
      ' ORDER BY TRC_CODIGO ';

  Parametro1.Open;
  Parametro2.Open;
  Parametro3.Open;
  Forma_de_Pagamento1.Open;
  AgenteFin1.Open;
  Conta_de_Caixa1.Open;
  CentroCusto2.Open;
  Vendedor1.Open;
end;

procedure TfMxAlterarParcelas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Cliente1.Close;
  Parametro1.Close;
  Parametro2.Close;
  Parametro3.Close;
  Forma_de_Pagamento1.Close;
  AgenteFin1.Close;
  Conta_de_Caixa1.Close;
  CentroCusto2.Close;
  Vendedor1.Close;
  Action:=Cafree;
end;
procedure TfMxAlterarParcelas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;


procedure TfMxAlterarParcelas.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto1.Open;
end;

procedure TfMxAlterarParcelas.Titulo_receber1CalcFields(DataSet: TDataSet);
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


procedure TfMxAlterarParcelas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
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
    end
    else if SB_Salva.Enabled then
    Begin
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
    end;
  end
  else if (edtValor.Focused)and(Key = '.') then
    Key := ',';
end;

procedure TfMxAlterarParcelas.edtCodigoPDVChange(Sender: TObject);
begin
  if VerificaInteiroBranco(edtCodigoPDV.Text) then
  Begin
    with Entidade do
    Begin
      Close;
      try
        ParamByName('CNC_CODIGO').AsInteger := StrToInt(edtPedidoCNC.Text);
      except
      end;
      ParamByName('PDV_CODIGO').AsInteger := StrToInt(edtCodigoPDV.Text);
      Open;
      lbxTitulos.Clear;
      while not Eof do
      Begin
        lbxTitulos.Items.Add(' '+
          PreencheEspaco(15,FieldByName('Centro').asString)+' '+ //2
          PreencheEspaco(10,IntToStr(CodigoTRC))+' '+ // 18
          PreencheEspaco(10,Sequencia)+' '+ // 29
          PreencheEspaco(10,Numero)+' '+ // 40
          PreencheEspaco(11,IntToStr(CodigoBOL))+' '+ // 51
          PreencheEspaco(10,DateToStr(Vencimento))+' '+ // 63
          PreencheEspacoEsq(12,format('%.2f',[Valor]))+' '+ // 74
          PreencheEspacoEsq(12,format('%.2f',[ValorPg]))+' '+ // 87
          PreencheEspaco(5,IntToStr(CodigoCCX))+' '+ // 100
          PreencheEspaco(5,IntToStr(Tipo))+' '+ // 106
          PreencheEspaco(5,IntToStr(TipoPag))+' '+ // 112
          PreencheEspaco(5,IntToStr(CodigoAGF))+' '+ //118
          PreencheEspaco(1,IntToStr(0))); // 124
        Next;
      end;
    end;
  end;
  SomarParcelas;
  
  //Carrega Foto
  try
    if StrToInt(edtClienteCNC.Text) < 10 then
      imgFotoCliente.Picture.LoadFromFile(DM.Configuracao1.PastaImagens+'\Cliente\0'+
        edtClienteCNC.Text+'-'+edtCodigoCLI.Text+'.JPG')
    else
      imgFotoCliente.Picture.LoadFromFile(DM.Configuracao1.PastaImagens+'\Cliente\'+
        edtClienteCNC.Text+'-'+edtCodigoCLI.Text+'.JPG');
  Except
    imgFotoCliente.Picture:=nil;
  end;

  try
    lbxTitulos.ItemIndex := 0;
  except
  end;
  lbxTitulosClick(sender);  
end;

procedure TfMxAlterarParcelas.bitConfirmarClick(Sender: TObject);
var
  i : integer;
  Trans : Boolean;
  sCentro: string;
begin
  if edtTotalPedidoComFrete.Text <> edtTotalTitulos.Text then
  Begin
    If MessageDlg('Atenção!!!'+#13+'Valor dos Títulos não confere com o Total do Pedido!'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6250)) < 0 then
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
          if usuario1.Permissoes.IndexOf(IntToStr(6250)) < 0 then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para Confirmar Parcelas <> do Pedido!');
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

  if DM.Configuracao1.Empresa <> empLBM then
    sCentro := ' AND (CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+') ';

  Trans:=false;
  try
    If DM.Configuracao1.ControleTransacao then
    Begin
      DM.Database2.StartTransaction;
      Trans:=True;
    end;

    if ExcluirTRC <> '' then
    Begin
      ExcluirTRC := ExcluirTRC + ')';
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_SITUACAO=5 '+
        ',TRC_OBSERVACAO="Exc.P/'+DM.Usuario1.NomeUSU+' Alt.Parcelas" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PDV_CODIGO='+edtCodigoPDV.Text+
        sCentro+
        ' AND TRC_CODIGO IN '+ExcluirTRC);
      Entidade.GeraLog(4520,0,0,'ALTERAR PARCELAS PDV:'+edtCodigoPDV.Text+' EXCLUÍDAS');
    end;
    for i := 0 to lbxTitulos.Items.Count-1 do
    Begin
      if Trim(Copy(lbxTitulos.Items.Strings[i],124,1)) = '1' then //Inserir
      Begin
        with Titulo_receber2 do
        Begin
          if not Active then
            Open;
          inserirEsp(StrToInt(edtPedidoCNC.Text),
            StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],18,10))), //CodigoTRC
            StrToInt(edtClienteCNC.Text),
            StrToInt(edtCodigoCLI.Text),
            StrToInt(edtCodigoPDV.Text),
            StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],100,5))), //Conta de Caixa
            StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],112,5))), //Tipo de Pagamento
            StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],106,5))), //Tipo de Documento
            StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],118,5))), //Agente Vinanceiro
            StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],51,11))), //CodigoBOL
            StrToDate(Trim(Copy(lbxTitulos.Items.Strings[i],63,10))), //Vencimento
            Trim(Copy(lbxTitulos.Items.Strings[i],29,10)), //Sequencia
            Trim(Copy(lbxTitulos.Items.Strings[i],40,10)), //Numero
            ''(*Obs*),
            StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],74,12)))) //Valor
        end;
      end
      else if Trim(Copy(lbxTitulos.Items.Strings[i],124,1)) = '2' then //Alterar
        ExecutaSQL(DM.QR_Comandos, 'UPDATE TITULO_A_RECEBER SET '+
            ' CCX_CODIGO='+Trim(Copy(lbxTitulos.Items.Strings[i],100,5))+
            ',TRC_NUMERO="'+Trim(Copy(lbxTitulos.Items.Strings[i],40,10))+'" '+
            ',TRC_SEQUENCIA="'+Trim(Copy(lbxTitulos.Items.Strings[i],29,10))+'" '+
            ',TRC_TIPO_DOC='+Trim(Copy(lbxTitulos.Items.Strings[i],106,5))+
            ',TRC_TIPO_PAG='+Trim(Copy(lbxTitulos.Items.Strings[i],112,5))+
            ',TRC_VENCIMENTO="'+MesDia(Trim(Copy(lbxTitulos.Items.Strings[i],63,10)))+'" '+
            ',TRC_VALOR='+VirgPonto(Trim(Copy(lbxTitulos.Items.Strings[i],74,12)))+
            ',BOL_CODIGO='+Trim(Copy(lbxTitulos.Items.Strings[i],51,11))+
            ',AGF_CODIGO='+Trim(Copy(lbxTitulos.Items.Strings[i],118,5))+
            ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE PDV_CODIGO='+edtCodigoPDV.Text+
            ' AND CNC_CODIGO='+edtPedidoCNC.Text+
            ' AND TRC_CODIGO='+Trim(Copy(lbxTitulos.Items.Strings[i],18,10)));
    end;

    Entidade.GeraLog(6070, Entidade.CodigoCNC, Entidade.CodigoPDV, 'TotalPED:'+edtTotalPedidoComFrete.Text+' TotalTRC:'+edtTotalTitulos.Text);

    If DM.Configuracao1.ControleTransacao then
      DM.Database2.Commit;

    ShowMessage('Alteração Confirmada!');
    Close;
  except
    ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
    If DM.Configuracao1.ControleTransacao then
      if trans then
        DM.Database2.RollBack;
  end;
end;

procedure TfMxAlterarParcelas.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxAlterarParcelas.SomarParcelas;
var
  TotalTit : Double;
begin
  if VerificaInteiroBranco(edtCodigoPDV.Text) then
    with DM.Configuracao1.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT SUM(TRC_VALOR_PAGO-TRC_JUROS+TRC_DESCONTO) as TOTAL '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE PDV_CODIGO='+edtCodigoPDV.Text+
        ' AND CNC_CODIGO='+edtPedidoCNC.Text+
        ' AND TRC_SITUACAO=2 ';
      Open;
      TotalTit := FieldByName('TOTAL').asFloat;
      Close;
      SQL.Text := 'SELECT SUM(TRC_VALOR) as TOTAL '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE PDV_CODIGO='+edtCodigoPDV.Text+
        ' AND CNC_CODIGO='+edtPedidoCNC.Text+
        ' AND TRC_SITUACAO<>5 AND TRC_SITUACAO<>2 ';
      Open;
      TotalTit := TotalTit + FieldByName('TOTAL').asFloat;
      edtTotalTitulos.Text := format('%.2f',[TotalTit]);
    end
  else
    edtTotalTitulos.Text := '0,00';
end;

procedure TfMxAlterarParcelas.SB_AltPedClick(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Raise Exception.Create('Localize o Pedido de Venda!');

  iTipoPg    := dblTipoPagamentoPed.KeyValue;
  iFormaPg   := dblFormaDePagamentoPed.KeyValue;
  iAgenteFin := dblAgenteFinanceiroPed.KeyValue;
  iCdFUN     := dblVendedor.KeyValue;

  AtualizaCamposPedido(True);
  if edtNotaFiscal.Text <> '' then
  Begin
    dblTipoPagamentoPed.Enabled := False;
    dblFormaDePagamentoPed.Enabled := False;
    dblAgenteFinanceiroPed.Enabled := False;
  end;
  try
    dblTipoPagamentoPed.SetFocus;
  except
    try
      dblVendedor.SetFocus;
    except
    end;
  end;
end;

procedure TfMxAlterarParcelas.SB_SalvaPedClick(Sender: TObject);
begin
  if not (dblTipoPagamentoPed.KeyValue > 0) then
    Raise Exception.Create('Tipo de Pagamento inválido');
  if not (dblFormaDePagamentoPed.KeyValue > 0) then
    Raise Exception.Create('Forma de Pagamento inválido');
  if not (dblAgenteFinanceiroPed.KeyValue > 0) then
    Raise Exception.Create('Agente Financeiro inválido');
  if not (dblVendedor.KeyValue > 0) then
    Raise Exception.Create('Vendedor(a) inválido(a)');
  AtualizaCamposPedido(False);
  //Alterar Pedido
  ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
    ' PDV_TIPO_PAG='+IntToStr(dblTipoPagamentoPed.KeyValue)+
    ',FPG_CODIGO='+IntToStr(dblFormaDePagamentoPed.KeyValue)+
    ',AGF_CODIGO='+IntToStr(dblAgenteFinanceiroPed.KeyValue)+
    ',PDV_DT_ALTERADO="'+MesDia(DM.Configuracao1.Data)+'" '+
    ' WHERE CNC_CODIGO='+edtPedidoCNC.Text+
    ' AND PDV_CODIGO='+edtcodigoPDV.Text);

  //Alterar Vendedor
  if iCdFUN <> dblVendedor.KeyValue then
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
      ' FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+
      ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+edtPedidoCNC.Text+
      ' AND PDV_CODIGO='+edtcodigoPDV.Text);
    if (edtNotaFiscal.Text <> 'LJ3') and (edtNotaFiscal.Text <> 'LJ4') and (edtNotaFiscal.Text <> '0') then
      ExecutaSQL(DM.QR_Comandos,'UPDATE NOTA_FISCAL SET '+
        ' FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+
        ' WHERE CNC_PEDIDO='+edtPedidoCNC.Text+
        ' AND NTF_PEDIDO='+edtcodigoPDV.Text+
        ' AND (NTF_TIPO_NOTA=361 OR NTF_TIPO_NOTA=362)');
  end;
end;

procedure TfMxAlterarParcelas.SB_CancPedClick(Sender: TObject);
begin
  AtualizaCamposPedido(False);
  dblTipoPagamentoPed.KeyValue    := iTipoPg;
  dblFormaDePagamentoPed.KeyValue := iFormaPg;
  dblAgenteFinanceiroPed.KeyValue := iAgenteFin;
  dblVendedor.KeyValue            := iCdFUN;
end;

procedure TfMxAlterarParcelas.dblTipoPagamentoPedClick(Sender: TObject);
begin
  dblAgenteFinanceiroPed.KeyValue:=0;
  if DM.Configuracao1.Empresa <> empLBM then
    Exit;
  if (dblTipoPagamentoPed.KeyValue = 5) then //Dinheiro
  Begin
    With AgenteFin1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_CODIGO=1'; //Carteira
      Open;
    end;
    dblFormaDePagamentoPed.KeyValue := 1; //Á Vista
    dblFormaDePagamentoPed.Enabled := False;
    dblAgenteFinanceiroPed.KeyValue := 1;
    dblAgenteFinanceiroPed.Enabled := False;
  end
  else
  Begin
    dblFormaDePagamentoPed.Enabled := True;
    dblAgenteFinanceiroPed.Enabled := True;
    If dblTipoPagamentoPed.KeyValue = 13 then //Cartão
    Begin
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_DIA_PAGAMENTO > 0 AND AGF_CODIGO<>1';
        Open;
      End;
      if dblTipoPagamentoPed.Focused then
      Begin
        dblFormaDePagamentoPed.KeyValue := 8; // Forma em 0 + 1
        dblAgenteFinanceiroPed.KeyValue := 8; //Mastercard
      end;
    end
    Else if dblTipoPagamentoPed.KeyValue = 6 then//Cheque
    Begin
      if dblFormaDePagamentoPed.KeyValue = 1 then
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_CODIGO=1'; //Carteiro ou Cheque-PRE
          Open;
          dblAgenteFinanceiroPed.KeyValue:=1;
        End
      else if dblFormaDePagamentoPed.KeyValue > 1 then
        With AgenteFin1 do
        Begin
          Close;
          SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_CODIGO=6'; //Cheque-PRE
          Open;
          dblAgenteFinanceiroPed.KeyValue:=6;
        End;
    end
    else
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE (AGF_DIA_PAGAMENTO = 0 OR AGF_DIA_PAGAMENTO IS NULL) AND AGF_CODIGO<>1 AND AGF_CODIGO<>6'; //Diferente de Carteira
        Open;
      End;
  End;
end;

procedure TfMxAlterarParcelas.AtualizaCamposTitulo(Habilitar: Boolean);
begin
  dblContaDeCaixaAgendada.Enabled := Habilitar;
  edtNumeroDocumento.Enabled := Habilitar;
  edtSequencia.Enabled := Habilitar;
  dblTipoDocumento.Enabled := Habilitar;
  dblTipoPagamento.Enabled := Habilitar;
  mskVencimento.Enabled := Habilitar;
  edtValor.Enabled := Habilitar;
  edtBoleto.Enabled := Habilitar;
  dblAgenteFinanceiro.Enabled := Habilitar;

  lbxTitulos.Enabled := not Habilitar;
  Incluir1.Enabled:=not Habilitar;
  Alterar1.Enabled:=not Habilitar;
  Excluir1.Enabled:=not Habilitar;
  Salvar1.Enabled:=Habilitar;
  CancelarPed.Enabled:=Habilitar;
  AlterarPed.Enabled:=not Habilitar;
  LocalizarPedido.Enabled:=not Habilitar;
  ConfirmarAlteracoes.Enabled:=not Habilitar;
  CancelarAlteracoes.Enabled:=not Habilitar;
  SB_Novo.Enabled:=not Habilitar;
  SB_Alt.Enabled:=not Habilitar;
  SB_Exc.Enabled:=not Habilitar;
  SB_Salva.Enabled:=Habilitar;
  SB_Canc.Enabled:=Habilitar;
  SB_AltPed.Enabled:=not Habilitar;
  bitLocalizar.Enabled:=not Habilitar;
  bitConfirmar.Enabled:=not Habilitar;
  bitCancelar.Enabled:=not Habilitar;
end;

procedure TfMxAlterarParcelas.lbxTitulosClick(Sender: TObject);
begin
  if lbxTitulos.ItemIndex < 0 then
    Exit;
  try
    edtCodigoTRC.Text := Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],18,10));
  except
    edtCodigoTRC.Clear;
  end;
  try
    edtSequencia.Text := Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],29,10));
  except
    edtSequencia.Clear;
  end;
  try
    edtNumeroDocumento.Text := Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],40,10));
  except
    edtNumeroDocumento.Clear;
  end;
  try
    edtBoleto.Text := Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],51,11));
  except
    edtBoleto.Clear;
  end;
  try
    mskVencimento.Text := Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],63,10));
  except
    mskVencimento.Clear;
  end;
  try
    edtValor.Text := Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],74,12));
  except
    edtValor.Clear;
  end;
  try
    dblContaDeCaixaAgendada.KeyValue := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],100,5)));
  except
    dblContaDeCaixaAgendada.KeyValue := -1;
  end;
  try
    dblTipoDocumento.KeyValue := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],106,5)));
  except
    dblTipoDocumento.KeyValue := -1;
  end;
  try
    dblTipoPagamento.KeyValue := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],112,5)));
  except
    dblTipoPagamento.KeyValue := -1;
  end;
  try
    dblAgenteFinanceiro.KeyValue := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],118,5)));
  except
    dblAgenteFinanceiro.KeyValue := -1;
  end;
end;

procedure TfMxAlterarParcelas.AtualizaCamposPedido(Habilitar: Boolean);
begin
  dblTipoPagamentoPed.Enabled    := Habilitar;
  dblFormaDePagamentoPed.Enabled := Habilitar;
  dblAgenteFinanceiroPed.Enabled := Habilitar;
  dblVendedor.Enabled            := Habilitar;  

  lbxTitulos.Enabled          := not Habilitar;
  Incluir1.Enabled            := not Habilitar;
  Alterar1.Enabled            := not Habilitar;
  Excluir1.Enabled            := not Habilitar;
  AlterarPed.Enabled          := not Habilitar;
  SalvarPed.Enabled           :=     Habilitar;
  CancelarPed.Enabled         :=     Habilitar;
  LocalizarPedido.Enabled     := not Habilitar;
  ConfirmarAlteracoes.Enabled := not Habilitar;
  CancelarAlteracoes.Enabled  := not Habilitar;
  SB_Novo.Enabled             := not Habilitar;
  SB_Alt.Enabled              := not Habilitar;
  SB_Exc.Enabled              := not Habilitar;
  SB_AltPed.Enabled           := not Habilitar;
  SB_SalvaPed.Enabled         :=     Habilitar;
  SB_CancPed.Enabled          :=     Habilitar;
  bitLocalizar.Enabled        := not Habilitar;
  bitConfirmar.Enabled        := not Habilitar;
  bitCancelar.Enabled         := not Habilitar;
end;

procedure TfMxAlterarParcelas.bitLocalizarClick(Sender: TObject);
begin
  lbxTitulos.Clear;
  edtCodigoTRC.Clear;
  dblContaDeCaixaAgendada.KeyValue := -1;
  edtNumeroDocumento.Clear;
  edtSequencia.Clear;
  dblTipoDocumento.KeyValue := -1;
  dblTipoPagamento.KeyValue := -1;
  mskVencimento.Clear;
  edtValor.Clear;
  edtBoleto.Clear;
  dblAgenteFinanceiro.KeyValue := -1;
  edtCodigoPDV.Clear;
  edtDataHoraPed.Clear;
  edtRazaoSocial.Clear;
  edtNotaFiscal.Clear;
  dblTipoPagamentoPed.KeyValue := -1;
  dblFormaDePagamentoPed.KeyValue := -1;
  dblAgenteFinanceiroPed.KeyValue := -1;
  dblVendedor.KeyValue := -1;
  edtTotalPedidoComFrete.Clear;

  Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
  with fMxSPedLoc do
  Begin
    tag:=8;
    Showmodal;
  end;
  ExcluirTRC := '';
end;

procedure TfMxAlterarParcelas.Action6Execute(Sender: TObject);
begin
  close;
end;

end.
