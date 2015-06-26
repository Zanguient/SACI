unit MxPacoteVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Parametro, AgenteFin, Forma_de_Pagamento, Vendedor,
  Item_Pedido_Venda, Cliente, Menus,
  Titulo_receber, Fatfin, CentroCusto,
  Informacoes, JPEG, Variants, ActnList, ActnMan, ImgList,
  ToolWin, ActnCtrls, ActnMenus, CustomizeDlg, ShellAPI, Pacote_de_venda,
  Item_Pacote_Venda, SubGrupo, Grupo, Produto;

type
  TfMxPacoteVenda = class(TForm)
    Panel13: TPanel;
    Panel2: TPanel;
    dbgItens: TDBGrid;
    Label14: TLabel;
    Label18: TLabel;
    edtQuantidade: TEdit;
    Label24: TLabel;
    edtDesconto: TEdit;
    Panel3: TPanel;
    Label20: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    edtCodigoPDV: TEdit;
    edtDataHora: TEdit;
    memObservacao: TMemo;
    Label27: TLabel;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    Vendedor1: TVendedor;
    DSForma_de_Pagamento1: TDataSource;
    DSAgenteFin1: TDataSource;
    DSVendedor1: TDataSource;
    Cliente1: TCliente;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    FatorFinanceira1: TFatorFinanceira;
    Forma_de_Pagamento2: TForma_de_Pagamento;
    edtPrecoDesconto: TEdit;
    Label31: TLabel;
    AgenteFin2: TAgenteFin;
    mskMelhorData: TMaskEdit;
    FatorFinanceira2: TFatorFinanceira;
    Label28: TLabel;
    dblTipoPagamento: TDBLookupComboBox;
    Label2: TLabel;
    dblFormaPagamento: TDBLookupComboBox;
    Label26: TLabel;
    dblCodigoAGF: TDBLookupComboBox;
    Label13: TLabel;
    Parametro2: TParametro;
    Informacoes1: TInformacoes;
    Bevel1: TBevel;
    imgCliente: TImage;
    Label12: TLabel;
    Titulo_receber4: TTitulo_receber;
    Titulo_receber1TOTALPEDIDO: TFloatField;
    ckbMelhorData: TCheckBox;
    Titulo_receber5: TTitulo_receber;
    Panel4: TPanel;
    SB_SalvarPedido: TBitBtn;
    SB_Informacoes: TBitBtn;
    SB_FinalizarPedido: TBitBtn;
    SB_ImprimirPedido: TBitBtn;
    SB_Promissoria: TBitBtn;
    SB_CancelarPedido: TBitBtn;
    SB_FecharPedido: TBitBtn;
    SB_NovoPed: TSpeedButton;
    SB_LocPed: TSpeedButton;
    SB_Entrada: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Itens1: TMenuItem;
    IncluirCab1: TMenuItem;
    Localizar1: TMenuItem;
    AlterarCab1: TMenuItem;
    Salvarcabecalho1: TMenuItem;
    CancelarCabecalho1: TMenuItem;
    N1: TMenuItem;
    SalvarPedido1: TMenuItem;
    InfCrdito1: TMenuItem;
    FinalizarPedido1: TMenuItem;
    CancelarPedido1: TMenuItem;
    N3: TMenuItem;
    ImprimirPedido1: TMenuItem;
    ImprimirPromissoria1: TMenuItem;
    ImprimirCarnnet1: TMenuItem;
    Item1: TMenuItem;
    Incluir1: TMenuItem;
    Excluir1: TMenuItem;
    N2: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    SB_Novo: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    N4: TMenuItem;
    Calculadora1: TMenuItem;
    Calendrio1: TMenuItem;
    memResumo: TMemo;
    Titulo_receber1: TTitulo_receber;
    Titulo_receber2: TTitulo_receber;
    Titulo_receber3: TTitulo_receber;
    Label22: TLabel;
    dblCodigoFUN: TDBLookupComboBox;
    Label1: TLabel;
    dblGrupo: TDBLookupComboBox;
    Label4: TLabel;
    dblSubGrupo1: TDBLookupComboBox;
    Label17: TLabel;
    edtPrecoUnitario: TEdit;
    Label5: TLabel;
    dblSubGrupo2: TDBLookupComboBox;
    Label15: TLabel;
    dblSubGrupo3: TDBLookupComboBox;
    Label16: TLabel;
    dblSubGrupo4: TDBLookupComboBox;
    Pacote_de_venda1: TPacote_de_venda;
    Item_Pacote_Venda1: TItem_Pacote_Venda;
    DSItem_Pacote_Venda1: TDataSource;
    SubGrupo1: TSubGrupo;
    DSPacote_de_venda1: TDataSource;
    Grupo1: TGrupo;
    DSGrupo1: TDataSource;
    DSSubGrupo1: TDataSource;
    SubGrupo2: TSubGrupo;
    SubGrupo3: TSubGrupo;
    SubGrupo4: TSubGrupo;
    DataSource1: TDataSource;
    DSSubGrupo3: TDataSource;
    DSSubGrupo4: TDataSource;
    DSSubGrupo2: TDataSource;
    SubGrupo5: TSubGrupo;
    Produto1: TProduto;
    Item_Pacote_Venda1CNC_CODIGO: TIntegerField;
    Item_Pacote_Venda1IPV_CODIGO: TIntegerField;
    Item_Pacote_Venda1PDV_CODIGO: TIntegerField;
    Item_Pacote_Venda1USU_CODIGO: TIntegerField;
    Item_Pacote_Venda1GRP_CODIGO: TIntegerField;
    Item_Pacote_Venda1SGP_CODIGO_1: TIntegerField;
    Item_Pacote_Venda1SGP_CODIGO_2: TIntegerField;
    Item_Pacote_Venda1SGP_CODIGO_3: TIntegerField;
    Item_Pacote_Venda1SGP_CODIGO_4: TIntegerField;
    Item_Pacote_Venda1IPC_DT_CADASTRO: TDateTimeField;
    Item_Pacote_Venda1IPC_DT_ALTERADO: TDateTimeField;
    Item_Pacote_Venda1IPC_QUANTIDADE: TIntegerField;
    Item_Pacote_Venda1IPC_PRECO: TFloatField;
    Item_Pacote_Venda1IPC_DESCONTO: TFloatField;
    Item_Pacote_Venda1IPC_PRECO_DESCONTO: TFloatField;
    Item_Pacote_Venda1IPC_SITUACAO: TIntegerField;
    Item_Pacote_Venda1IPC_OBSERVACAO: TStringField;
    Item_Pacote_Venda1TotalItem: TStringField;
    Item_Pacote_Venda1SubGrupo1: TStringField;
    Item_Pacote_Venda1SubGrupo2: TStringField;
    Item_Pacote_Venda1SubGrupo3: TStringField;
    Item_Pacote_Venda1SubGrupo4: TStringField;
    edtCodigoIPV: TEdit;
    Item_Pacote_Venda1IPC_QUANTIDADE_ENTREGUE: TIntegerField;
    SB_Cupom: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label21: TLabel;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    mskCNPJCPF: TMaskEdit;
    edtClienteCNC: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Item_Pacote_Venda1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dblFormaPagamentoClick(Sender: TObject);
    procedure Parametro1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ckbMelhorDataClick(Sender: TObject);
    procedure AgenteFin1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure AgenteFin1BeforeOpen(DataSet: TDataSet);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure Item_Pacote_Venda1CalcFields(DataSet: TDataSet);
    procedure edtDescontoExit(Sender: TObject);
    procedure Titulo_receber2BeforeOpen(DataSet: TDataSet);
    procedure imgClienteDblClick(Sender: TObject);
    procedure Titulo_receber4BeforeOpen(DataSet: TDataSet);
    procedure Parametro2BeforeOpen(DataSet: TDataSet);
    procedure CarregarItemVenda;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure SB_EntradaClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_SalvarPedidoClick(Sender: TObject);
    procedure SB_InformacoesClick(Sender: TObject);
    procedure SB_FecharPedidoClick(Sender: TObject);
    procedure SB_FinalizarPedidoClick(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Calendrio1Click(Sender: TObject);
    procedure SB_CancelarPedidoClick(Sender: TObject);
    procedure SB_PromissoriaClick(Sender: TObject);
    procedure dblSubGrupo1Click(Sender: TObject);
    procedure dblSubGrupo2Click(Sender: TObject);
    procedure dblSubGrupo3Click(Sender: TObject);
    procedure dblSubGrupo4Click(Sender: TObject);
    procedure SB_ImprimirPedidoClick(Sender: TObject);
    procedure SubGrupo1BeforeOpen(DataSet: TDataSet);
    procedure SubGrupo2BeforeOpen(DataSet: TDataSet);
    procedure SubGrupo3BeforeOpen(DataSet: TDataSet);
    procedure SubGrupo4BeforeOpen(DataSet: TDataSet);
    procedure dblGrupoClick(Sender: TObject);
    procedure SB_CupomClick(Sender: TObject);
    procedure dbgItensTitleClick(Column: TColumn);
  private
    procedure AtualizaControles(Cabecalho, Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    ValorAnt, TotalNota:Double;
    Cancelar, cancelarloc, Alteracao, IgnoraCLI, PulaCLI:Boolean;
    Entidade:TPacote_de_venda;
    CodCliente:string;
    CdCLIOK:integer;
  end;

var
  fMxPacoteVenda: TfMxPacoteVenda;

implementation
Uses
  UDM, funcoes, MxS_Tpreco, MxSPediDesc, MxSPediProd, MxSPediTab,
  MxSPediCtCus, CdCliente, MxValorEntrada, MxSRecPedido,
  DigSenha, mxSelProm, MxFotoAmpliada, MxDescontoPedido,
  MxFeriados, MxFinalizaPedido, MxLocalizaPacote, 
  uPedidoVendaCodigoPreco, UPacote, MxNotaFiscal, UPacotesCliente;
{$R *.DFM}

procedure TfMxPacoteVenda.FormCreate(Sender: TObject);
begin
  Entidade:=Pacote_de_venda1;
  Parametro1.Open;
  Titulo_receber1.Open;
  Forma_de_Pagamento2.Open;
  AgenteFin2.Open;
  Forma_de_pagamento1.Open;
  AgenteFin1.Open;
  Vendedor1.Open;
  FatorFinanceira2.Open;
  Entidade.Open;  
end;

procedure TfMxPacoteVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AgenteFin1.Close;
  AgenteFin2.Close;
  Item_Pacote_Venda1.Close;
  Entidade.Close;
  Cliente1.Close;
  FatorFinanceira1.Close;
  FatorFinanceira2.Close;
  Forma_de_pagamento1.Close;
  Forma_de_Pagamento2.Close;
  Vendedor1.Close;
  Item_Pacote_Venda1.Close;
  Parametro1.Close;
  Parametro2.Close;
  Titulo_receber1.Close;
  Titulo_receber2.Close;
  Titulo_receber3.Close;
  SubGrupo1.Close;
  SubGrupo2.Close;
  SubGrupo3.Close;
  SubGrupo4.Close;
  Grupo1.Close;
  Action:=Cafree;
end;

procedure TfMxPacoteVenda.Item_Pacote_Venda1AfterScroll(DataSet: TDataSet);
begin
  try
    CarregarItemVenda;
  except
  end;
end;

procedure TfMxPacoteVenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  aux:TDataSetNotifyEvent;
begin
  Aux:=Item_Pacote_Venda1.AfterScroll;
  Item_Pacote_Venda1.AfterScroll:=nil;
  Item_Pacote_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pacote_Venda1.Open;
  Item_Pacote_Venda1.AfterScroll:=Aux;
  If (SB_SalvaPed.Enabled) or (SB_Salva.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
    Exit;
  End;
  If not Entidade.IsEmpty Then
  Begin
    if Item_Pacote_Venda1.IsEmpty then
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM PACOTE_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text)
    // Situacao; 3-Salvo; 4-Finalizado; 6-Excluído
    Else If (Entidade.Situacao<>3) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6) then
    Begin
      Showmessage('Salve ou cancele o pedido antes de continuar');
      canclose:=false;
      exit;
    End;
    if not Entidade.FecharPedido then
    Begin
      Showmessage('Não foi possível liberar o pedido atual.');
      Canclose:=False;
      exit;
    end;
  end;

end;

procedure TfMxPacoteVenda.dblFormaPagamentoClick(Sender: TObject);
var
  PCT,CNC:integer;
  aux:TDataSetNotifyEvent;
begin
  if dblCodigoAGF.Enabled then
    dblCodigoAGF.KeyValue := 0;

  if Entidade.Entrada > 0 then
  Begin
    PCT:=StrToInt(edtCodigoPDV.Text);
    CNC:=DM.Configuracao1.CodigoCNC;
    ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
      ' PCT_ENTRADA=0 '+
      ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
      ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
      ' WHERE CNC_CODIGO='+IntToStr(CNC)+
      ' AND PDV_CODIGO='+IntToStr(PCT));
    Aux:=Item_Pacote_Venda1.AfterScroll;
    Item_Pacote_Venda1.AfterScroll:=nil;
    Item_Pacote_Venda1.Close;
    Entidade.Close;
    Entidade.Open;
    Item_Pacote_Venda1.Open;
    Item_Pacote_Venda1.AfterScroll:=Aux;
    CarregarItemVenda;
  end;

  if dblTipoPagamento.KeyValue = 13 then
  Begin
    dblFormaPagamento.Enabled:=True;
    ckbMelhorData.Enabled:=False;
    ckbMelhorData.Checked:=False;
    mskMelhorData.Clear;
  end
  else
  Begin
    dblFormaPagamento.Enabled:=True;
    ckbMelhorData.Enabled:=True;
    if dblTipoPagamento.KeyValue = 412 then //Boleto
      if dblCodigoAGF.Enabled then
        dblCodigoAGF.KeyValue := 2; //BB
  end;

  if (Forma_de_Pagamento1.Prazo<>'') and (Forma_de_Pagamento1.Prazo<>'0')then
     ckbMelhorData.Enabled :=True
  else
  Begin
    ckbMelhorData.Enabled:=False;
    ckbMelhorData.Checked:=False;
    mskMelhorData.Clear;
  end;

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
    dblCodigoAGF.KeyValue := 1;
  end
  else
  Begin
    dblFormaPagamento.Enabled := True;
    dblCodigoAGF.Enabled := True;
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
      With AgenteFin1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO '+
          ' WHERE (AGF_DIA_PAGAMENTO = 0 OR AGF_DIA_PAGAMENTO IS NULL) '+
          ' AND AGF_CODIGO<>1 '+  //Diferente de LOJA
          ' AND AGF_CODIGO<>6';   //Diferente de Cheque-Pre
        Open;
      End;
  End;
end;

procedure TfMxPacoteVenda.Parametro1AfterScroll(DataSet: TDataSet);
begin
  if Parametro1.CodigoPAR=13 then
    With AgenteFin1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_DIA_PAGAMENTO > 0';
      Open;
    End
  Else
    With AgenteFin1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM AGENTE_FINANCEIRO WHERE AGF_DIA_PAGAMENTO = 0';
      Open;
    End;
end;

procedure TfMxPacoteVenda.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Grupo1.Open;
  SubGrupo1.Open;
  SubGrupo2.Open;
  SubGrupo3.Open;
  SubGrupo4.Open;
  IgnoraCLI:=False;
end;

procedure TfMxPacoteVenda.ckbMelhorDataClick(Sender: TObject);
begin
  if not ckbMelhorData.Enabled then
  Begin
    mskMelhorData.Enabled := False;
    Exit;
  end;
  if ckbMelhorData.Checked then
  begin
    if dblFormaPagamento.Enabled then
    Begin
      mskMelhorData.Enabled := true;
      mskMelhorData.SetFocus;
    end;
    mskMelhorData.Color := clwhite;
  end
  else
  begin
    mskMelhorData.Clear;
    mskMelhorData.Enabled := false;
    mskMelhorData.Color := AlteraCorComponentes;
  end;
end;


procedure TfMxPacoteVenda.AgenteFin1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  nparc:Integer;
begin
  if (Forma_de_Pagamento1.Prazo <> '') then
  Begin
    nparc:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);
    If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
      Accept:=FatorFinanceira2.LocalizarNParc(AgenteFin1.CodigoAGF, nparc-1)
    else
      Accept:=FatorFinanceira2.LocalizarNParc(AgenteFin1.CodigoAGF, nparc);
  end;
end;


procedure TfMxPacoteVenda.AgenteFin1BeforeOpen(DataSet: TDataSet);
begin
  AgenteFin1.OnFilterRecord:=AgenteFin1FilterRecord;
  AgenteFin1.Filtered:=True;
end;


procedure TfMxPacoteVenda.edtCodigoCLIExit(Sender: TObject);
begin
  if (SB_CancPed.Focused) then
    Exit;
  If (edtCodigoCLI.Text<>'') then
  Begin
    if not VerificaInteiro(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      Raise Exception.Create('Código de Cliente inválido!');
    end
    else if StrToInt(edtCodigoCLI.Text)=DM.Configuracao1.CodigoCliAVista then
    Begin
      edtCodigoCLI.SetFocus;
      Raise Exception.Create('Não é possível vender pacote para Cliente Balcão!');
    end;
    if (CdCLIOK = StrToInt(edtCodigoCLI.Text)) and (edtRazaoSocial.Text <> '') then
      Exit;
    Cliente1.Close;
    Cliente1.ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
    Cliente1.ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtClienteCNC.Text);
    Cliente1.Open;

    If Cliente1.IsEmpty then
    Begin
      edtCodigoCLI.Clear;
      edtRazaoSocial.Clear;
      mskCNPJCPF.Clear;
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Cliente não cadastrado');
    End;
    edtCodigoCLI.text:=IntToStr(Cliente1.CodigoCli);
    edtRazaoSocial.text:=Cliente1.RazaoSocial;
    If Cliente1.PessoaFisica then
       mskCNPJCPF.Editmask:='999-999-999-99;0;_'
    Else
       mskCNPJCPF.Editmask:='99-999-999/9999-99;0;_';
    mskCNPJCPF.text:=Cliente1.CPFCGC;
    if (dblCodigoFUN.Text = '') and
       VerificaInteiroBranco(Cliente1.Conjuge) then
       dblCodigoFUN.KeyValue := StrToInt(Cliente1.Conjuge);
    CdCLIOK := Cliente1.CodigoCli;
    try
      if Cliente1.CodigoCNC < 10 then
        imgCliente.Picture.LoadFromFile(DM.Configuracao1.PastaImagens+'\Cliente\0'+
          IntToStr(Cliente1.CodigoCNC)+'-'+edtCodigoCLI.Text+'.JPG')
      else
        imgCliente.Picture.LoadFromFile(DM.Configuracao1.PastaImagens+'\Cliente\'+
          IntToStr(Cliente1.CodigoCNC)+'-'+edtCodigoCLI.Text+'.JPG');
    Except
      imgCliente.Picture:=nil;
    end;
  End
  else
  Begin
    edtRazaoSocial.Clear;
    mskCNPJCPF.Clear;
  end;
  if (CodCliente <> '') and (not IgnoraCLI) then
    if (CodCliente <> edtCodigoCLI.Text) and (not Item_Pacote_Venda1.IsEmpty) then
      Raise Exception.Create('Essa Venda foi feita para Atacado!');
  IgnoraCLI:=False;
end;

procedure TfMxPacoteVenda.edtDescontoChange(Sender: TObject);
Var
  Descont:Double;
begin
  if not edtDesconto.Enabled then
    Exit;
  If not VerificaFloatBranco(edtDesconto.Text) then
  Begin
    Descont := 0;
    edtDesconto.Text := '0';
    edtPrecoDesconto.text := '0';
  end
  else
    Descont := StrToFloat(edtDesconto.text);

  if StrToFloat(edtDesconto.Text) >= 100 then
    edtPrecoDesconto.Text := '0'
  Else If VerificaFloatBranco(edtPrecoUnitario.Text) and
          VerificaFloatBranco(edtPrecoUnitario.Text) then
    edtPrecoDesconto.Text := Format('%.2f',[StrToFloat(edtPrecoUnitario.Text)-StrToFloat(edtPrecoUnitario.Text)*Descont/100]);
end;

procedure TfMxPacoteVenda.Item_Pacote_Venda1CalcFields(DataSet: TDataSet);
var
  PrecoUnit:string;
begin
  with SubGrupo5 do
  Begin
    if CodigoSGP <> Item_Pacote_Venda1.CodigoSGP1 then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Item_Pacote_Venda1.CodigoSGP1;
      Open;
    end;
    Item_Pacote_Venda1.FieldByName('SubGrupo1').asString := Descricao;

    if CodigoSGP <> Item_Pacote_Venda1.CodigoSGP2 then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Item_Pacote_Venda1.CodigoSGP2;
      Open;
    end;
    Item_Pacote_Venda1.FieldByName('SubGrupo2').asString := Descricao;

    if CodigoSGP <> Item_Pacote_Venda1.CodigoSGP3 then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Item_Pacote_Venda1.CodigoSGP3;
      Open;
    end;
    Item_Pacote_Venda1.FieldByName('SubGrupo3').asString := Descricao;

    if CodigoSGP <> Item_Pacote_Venda1.CodigoSGP4 then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Item_Pacote_Venda1.CodigoSGP4;
      Open;
    end;
    Item_Pacote_Venda1.FieldByName('SubGrupo4').asString := Descricao;
  end;

  with Item_Pacote_Venda1 do
  Begin
    if Item_Pacote_Venda1.PrecoDesc > 0 then
      PrecoUnit := format('%.2f',[PrecoDesc])
    else
      PrecoUnit := format('%.2f',[Preco]);
    FieldByName('TotalItem').asString:=format('%.2f',[StrToFloat(PrecoUnit) * Quantidade])
  end;
end;



procedure TfMxPacoteVenda.edtDescontoExit(Sender: TObject);
begin
  if (edtDesconto.Text = '') then
    edtDesconto.Text:='0';
  if (edtDesconto.Text = '0') then
    edtPrecoDesconto.Text := '0';
end;

procedure TfMxPacoteVenda.Titulo_receber2BeforeOpen(DataSet: TDataSet);
begin
  try
    Titulo_receber2.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
  except
  end;
  try
    Titulo_receber2.ParamByName('PDV_CODIGO').asInteger := StrToInt(edtCodigoPDV.Text);
  except
  end;
end;

procedure TfMxPacoteVenda.imgClienteDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgCliente.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Nome Fantasia/Apelido: '+Cliente1.NomeFantasia);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Endereço: '+Cliente1.Endereco+' - '+
    Cliente1.Bairro+' - '+Cliente1.Cidade+'/'+Cliente1.Uf);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Cliente1.OBS);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxPacoteVenda.Titulo_receber4BeforeOpen(DataSet: TDataSet);
begin
  Titulo_receber4.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Titulo_receber4.ParamByName('PDV_CODIGO').asInteger:=StrToInt(edtCodigoPDV.Text);
end;

procedure TfMxPacoteVenda.Parametro2BeforeOpen(DataSet: TDataSet);
begin
  if Cliente1.Logradouro > 0 then
    Parametro2.ParamByName('PAR_CODIGO').asInteger := Cliente1.Logradouro;
end;

procedure TfMxPacoteVenda.CarregarItemVenda;
Begin
  If not Item_Pacote_Venda1.IsEmpty Then
  Begin
    dblGrupo.KeyValue := Item_Pacote_Venda1.CodigoGRP;
    dblGrupoClick(dblGrupo);
    Item_Pacote_Venda1.CarregaDados;
  end
  else
    Item_Pacote_Venda1.LimpaCampos;
end;


procedure TfMxPacoteVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(13) then
  Begin
    Key := #0;
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end
    else if SB_Salva.Enabled then
    Begin
      if not VerificaFloatBranco(edtQuantidade.Text) then
        edtQuantidade.Text:='1';
      if SB_Salva.Enabled then
      Begin
        SB_Salva.SetFocus;
        SB_SalvaClick(sender);
      end;
    end;
  end
  else if Key=chr(27) then
  Begin
    Key := #0;
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
  else If key=chr(32) then
  Begin
    If edtCodigoCLI.Focused then
    Begin
      edtCodigoCLI.Clear;
      key:=chr(0);
      Application.CreateForm(TfCadCli, fCadCli);
      fCadCli.tag:=26;
      fCadCli.CentroCusto2.open;
      fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
      fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
      With fCadCli.Cliente1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM CLIENTE '+
          ' WHERE CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
          ' AND CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC);
        Open;
      End;
      fCadCli.Showmodal;
    End
    Else  if edtDesconto.Focused then
    Begin
      Key:=chr(0);
      Application.CreateForm(TfMxSPedDesc, fMxSPedDesc);
      fMxSPedDesc.edtProduto.Text     := IntToStr(dblSubGrupo1.KeyValue);
      fMxSPedDesc.edtUnidade.Text     := '';
      fMxSPedDesc.edtMarca.Text       := '';
      fMxSPedDesc.edtReferencia.Text  := '';
      fMxSPedDesc.edtPreco.Text       := edtPrecoUnitario.Text;
      fMxSPedDesc.edtPrecoComDesconto.Text   :=  edtPrecoUnitario.Text;
      if VerificaFloatBranco(edtDesconto.Text) then
        fMxSPedDesc.edtDescontoPercentual.Text   :=  edtDesconto.Text;
      fMxSPedDesc.Tag:=8;
      fMxSPedDesc.ShowModal;
    end;
  End;
end;
procedure TfMxPacoteVenda.AtualizaControles(Cabecalho, Habilitar: Boolean);
begin
  memResumo.Enabled            := not Habilitar;
  IncluirCab1.Enabled          := not Habilitar;
  AlterarCab1.Enabled          := not Habilitar;
  Localizar1.Enabled           := not Habilitar;
  Salvarcabecalho1.Enabled     := (Cabecalho and Habilitar);
  CancelarCabecalho1.Enabled   := (Cabecalho and Habilitar);
  SalvarPedido1.Enabled        := not Habilitar;
  FinalizarPedido1.Enabled     := not Habilitar;
  CancelarPedido1.Enabled      := not Habilitar;
  InfCrdito1.Enabled           := not Habilitar;
  Incluir1.Enabled             := not Habilitar;
  Excluir1.Enabled             := not Habilitar;
  ImprimirPedido1.Enabled      := not Habilitar;
  ImprimirPromissoria1.Enabled := not Habilitar;
  ImprimirCarnnet1.Enabled     := not Habilitar;
  SB_Novo.Enabled              := not Habilitar;
  SB_Exc.Enabled               := not Habilitar;
  SB_CancelarPedido.Enabled    := not Habilitar;
  SB_Salva.Enabled             := ((not Cabecalho) and Habilitar);
  SB_Canc.Enabled              := ((not Cabecalho) and Habilitar);
  SB_LocPed.Enabled            := not Habilitar;
  SB_NovoPed.Enabled           := not Habilitar;
  SB_SalvarPedido.Enabled      := not Habilitar;
  SB_FinalizarPedido.Enabled   := not Habilitar;
  SB_FecharPedido.Enabled      := not Habilitar;

  if not Habilitar then
  Begin
    If Forma_de_Pagamento1.Prazo<>'0' then
      SB_Entrada.Enabled := ((Copy(Forma_de_Pagamento1.Prazo,1,1)='0')and(not AgenteFin1.JurosEntrada))
    Else
      SB_Entrada.Enabled := False;
  end
  else
    SB_Entrada.Enabled := False;

  SB_Informacoes.Enabled       := not Habilitar;
  SB_AltPed.Enabled            := not Habilitar;
  SB_ImprimirPedido.Enabled    := not Habilitar;
  SB_SalvaPed.Enabled          := (Cabecalho and Habilitar);
  SB_CancPed.Enabled           := (Cabecalho and Habilitar);
  SB_Cupom.Enabled             := not Habilitar;  
  SB_Promissoria.Enabled       := not Habilitar;
end;

procedure TfMxPacoteVenda.SB_NovoPedClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir vendas neste centro de custo.');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');    
  ckbMelhorData.Checked := False;
  Aux:=Item_Pacote_Venda1.AfterScroll;
  Item_Pacote_Venda1.AfterScroll:=nil;
  Item_Pacote_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pacote_Venda1.Open;
  Item_Pacote_Venda1.AfterScroll:=Aux;
  If not Entidade.IsEmpty Then
  Begin
    if Item_Pacote_Venda1.IsEmpty then
    Begin
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM PACOTE_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
      Entidade.Close;
      Entidade.Open;
    end
    Else If (Entidade.Situacao<>3) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6) then
      Raise Exception.Create('Salve ou cancele o pedido antes de continuar');
  end;
  if not Entidade.FecharPedido then
    raise Exception.Create('Não foi possível liberar o pedido atual.');
  Item_Pacote_Venda1.Active:=False;
  with Entidade do
  Begin
    if not Inserir(DM.Configuracao1.CodigoCNC,0,0,0,0,0,
       DM.Usuario1.CodigoUSU,0,0,'',DM.Configuracao1.CodigoCNC,DM.Configuracao1.DataHora) then
      Raise Exception.Create('Erro ao gerar Pedido. Entre em contato com o suporte técnico!');
    Close;
    SQL.Text:='SELECT * FROM PACOTE_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(SCodigo);
    Open;
    CarregaDados;
    AbrirPedido;
    Item_Pacote_Venda1.LimpaCampos;
  end;
  Entidade.LimpaCampos(1);
  Entidade.AtualizaControles(True);
  AtualizaControles(True, True);
  Alteracao:=False;
  edtCodigoCLI.SetFocus;
end;

procedure TfMxPacoteVenda.SB_LocPedClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');
  IgnoraCLI:=True;
  if (not Entidade.IsEmpty) and (Item_Pacote_Venda1.IsEmpty) and
     (VerificaInteiroBranco(edtCodigoPDV.Text)) then
  Begin
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM PACOTE_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text);
    Entidade.LimpaCampos;
    imgCliente.Picture:=nil;
  end;
  Aux:=Item_Pacote_Venda1.AfterScroll;
  Item_Pacote_Venda1.AfterScroll:=nil;
  Item_Pacote_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pacote_Venda1.Open;
  Item_Pacote_Venda1.AfterScroll:=Aux;
  If not Entidade.IsEmpty Then
  Begin
    If (Entidade.Situacao<>3) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6) then
      Raise Exception.Create('Salve ou cancele o pedido antes de continuar')
    Else If (Entidade.Situacao<>1) and (Entidade.Situacao<>4) and (Entidade.Situacao<>6) then
        if MessageDlg('Deseja sair sem finalizar o Pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
  End;
  cancelarloc:=True;
  Application.CreateForm(TfMxLocalizaPacote, fMxLocalizaPacote);
  fMxLocalizaPacote.tag:=0;
  fMxLocalizaPacote.Showmodal;

  If not cancelarloc Then
  Begin
    if not Entidade.FecharPedido then
      raise Exception.Create('Não foi possível liberar o pedido atual.')
    else
      AtualizaControles(False,False);
    Aux:=Item_Pacote_Venda1.AfterScroll;
    Item_Pacote_Venda1.AfterScroll:=nil;
    Item_Pacote_Venda1.Close;
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM PACOTE_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text;
    Entidade.Open;
    Entidade.AbrirPedido;
    Entidade.CarregaDados;
    edtCodigoCLIExit(sender);
    Item_Pacote_Venda1.Open;
    Item_Pacote_Venda1.AfterScroll:=Aux;

    //Carregar informações do Produto
    CarregarItemVenda;

    If not Item_Pacote_Venda1.IsEmpty then
      If Forma_de_Pagamento1.Prazo<>'0' then
        SB_Entrada.Enabled := ((Copy(Forma_de_Pagamento1.Prazo,1,1)='0')and(not AgenteFin1.JurosEntrada))
      Else
        SB_Entrada.Enabled := False;

    //Gerar resumo
    memResumo.Text := '0,00';
  End;
  if (mskMelhorData.Text <> '  /  /    ') and (mskMelhorData.Text <> '') then
    ckbMelhorData.Checked := True
  else
    ckbMelhorData.Checked := False;
end;

procedure TfMxPacoteVenda.SB_AltPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');
  Entidade.PreparaAlteracao;
  if (Forma_de_Pagamento1.Prazo<>'') and (Forma_de_Pagamento1.Prazo<>'0')then
     ckbMelhorData.Enabled     :=True;
  AtualizaControles(True, True);
  Alteracao:=True;
  edtCodigoCLI.SetFocus;
end;

procedure TfMxPacoteVenda.SB_SalvaPedClick(Sender: TObject);
Var
  Aux:TDataSetNotifyEvent;
  CdCNC, CdPDV: integer;
begin
  If (dblCodigoFUN.Text = '') then
  Begin
    dblCodigoFUN.SetFocus;
    Raise Exception.Create('Vendedor inválido!');
  end;
  If (dblTipoPagamento.Text = '') then
    Raise Exception.Create('Tipo de pagamento inválido!');
  If (dblFormaPagamento.Text = '')then
    Raise Exception.Create('Forma de pagamento inválido!');
  If (dblCodigoAGF.Text = '') then
    Raise Exception.Create('Agente financeiro inválido!');
  if not VerificaData(mskMelhorData.Text) then
    Raise Exception.Create('Melhor data inválida!')
  else if mskMelhorData.Text = '  /  /    ' then
    Begin
    //
    end
  else if (Trunc(StrToDate(mskMelhorData.Text)) > Trunc(DM.Configuracao1.Data)+(DM.Configuracao1.MelhorData)) then
    Raise Exception.Create('Melhor data acima do permitido!');
  if ckbMelhorData.Checked then
    if StrToDate(mskMelhorData.Text) < DM.Configuracao1.Data then
      Raise Exception.Create('Melhor data inválida!');

  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Raise exception.Create('Cliente inválido!');

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdPDV := StrToInt(edtCodigoPDV.Text);

  Informacoes1.Close;
  Informacoes1.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
  Informacoes1.ParamByName('CLI_CODIGO').asInteger:=Cliente1.CodigoCLI;
  Informacoes1.Open;

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
        Tag:=33;
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
            DM.Usuario1.GeraLog(6750, CdCNC, CdPDV,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' PACOTE DE VENDA-TIPO_PAG');
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
      DM.Usuario1.GeraLog(6750, CdCNC, CdPDV,
        'PACOTE DE VENDA-TIPO_PAG');
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
          Tag:=33;
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
              DM.Usuario1.GeraLog(6750, CdCNC, cdPDV,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' PACOTE DE VENDA-FORMA_PAG');
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
        DM.Usuario1.GeraLog(6750, CdCNC, cdPDV,
          'PACOTE DE VENDA-FORMA_PAG');
    end;
  end;

  Entidade.AtualizaControles(False);
  AtualizaControles(True, False);
  ckbMelhorData.Enabled:=False;
  mskMelhorData.Enabled:=False;
  Aux:=Item_Pacote_Venda1.AfterScroll;
  Item_Pacote_Venda1.AfterScroll:=nil;
  Item_Pacote_Venda1.Close;
  With Entidade do
  Begin
    if (mskMelhorData.Text <> '  /  /    ') and (mskMelhorData.Text <> '') then
      ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
        ' FPG_CODIGO='+IntToStr(Forma_de_Pagamento1.CodigoFPG)+
        ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',FUN_CODIGO='+IntToStr(dblCodigoFUN.KeyValue)+
        ',PCT_TIPO_PAG='+IntToStr(Parametro1.CodigoPAR)+
        ',AGF_CODIGO='+IntToStr(AgenteFin1.CodigoAGF)+
        ',PCT_OBSERVACAO="'+memObservacao.Text+'" '+
        ',CNC_CLIENTE='+edtClienteCNC.Text+
        ',PCT_SITUACAO=0'+
        ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PCT_DT_MELHOR_DATA="'+MesDia(mskMelhorData.Text)+'" '+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(CodigoPDV))
    else
      ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
        ' FPG_CODIGO='+IntToStr(Forma_de_Pagamento1.CodigoFPG)+
        ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',FUN_CODIGO='+IntToStr(dblCodigoFUN.KeyValue)+
        ',PCT_TIPO_PAG='+IntToStr(Parametro1.CodigoPAR)+
        ',AGF_CODIGO='+IntToStr(AgenteFin1.CodigoAGF)+
        ',PCT_OBSERVACAO="'+memObservacao.Text+'" '+
        ',CNC_CLIENTE='+edtClienteCNC.Text+
        ',PCT_SITUACAO=0'+
        ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PCT_DT_MELHOR_DATA=NULL '+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(CodigoPDV));

    Entidade.GeraLog(6790, CodigoCNC, CodigoPDV, 'CNCCLI:'+IntToStr(ClienteCNC)+
      ' CLI:'+IntToStr(CodigoCLI)+
      ' TipoPag:'+IntToStr(TipoPag)+
      ' FPG:'+IntToStr(CodigoFPG)+
      ' AGF:'+IntToStr(CodigoAGF));

    Close;
    Open;
  end;
  Item_Pacote_Venda1.Open;
  Item_Pacote_Venda1.AfterScroll:=Aux;

  if not Item_Pacote_Venda1.IsEmpty then
  Begin
    CarregarItemVenda;
    SB_SalvarPedido.SetFocus;
    SB_SalvarPedidoClick(sender);
  end;
end;

procedure TfMxPacoteVenda.SB_CancPedClick(Sender: TObject);
begin
  Entidade.AtualizaControles(False);
  AtualizaControles(True,False);
  If not Alteracao then
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM PACOTE_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text);

  ckbMelhorData.Enabled:=False;
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos
  else
    Entidade.CarregaDados;
end;

procedure TfMxPacoteVenda.SB_EntradaClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if (Entidade.IsEmpty) then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');
  if Item_Pacote_Venda1.IsEmpty then
    ShowMessage('Coloque os itens primeiro!')
  else
  Begin
    Application.CreateForm(TfMXValorEntrada, fMXValorEntrada);
    fMXValorEntrada.Tag:=5;
    aux:=Item_Pacote_Venda1.AfterScroll;
    Item_Pacote_Venda1.AfterScroll:=Nil;
    fMXValorEntrada.Showmodal;
    Item_Pacote_Venda1.First;
    Item_Pacote_Venda1.AfterScroll:=Aux;
    CarregarItemVenda;
  end;
end;

procedure TfMxPacoteVenda.SB_NovoClick(Sender: TObject);
begin
  ValorAnt:=0;
  if not Item_Pacote_Venda1.Active then
    Raise Exception.Create('Crie primeiro o Cabeçalho');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');
  if Item_Pacote_Venda1.RecordCount >= DM.Configuracao1.MaxItensNota then
    Raise Exception.Create('Quantidade Máxima de itens por nota!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if Entidade.IsEmpty then
    Raise Exception.Create('Crie primeiro o cabeçalho do Pedido!');

  AtualizaControles(False, True);
  Item_Pacote_Venda1.PreparaInsercao;
  dblGrupo.SetFocus;

  if AgenteFin1.JurosEntrada then
    edtDesconto.Enabled := False;

  edtCodigoCLI.Enabled:=False;

  if edtDesconto.Text = '' then
    edtDesconto.Text := '0';
end;

procedure TfMxPacoteVenda.SB_ExcClick(Sender: TObject);
var
  Trans:Boolean;
begin
  If Item_Pacote_Venda1.IsEmpty then
    Raise Exception.Create('Não existem registros para serem deletados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.Situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');
  if Item_Pacote_Venda1.RecordCount = 1 then
    Raise Exception.Create('Não é possível excluir o último item!');

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if Item_Pacote_Venda1.deletarauto then
      Begin
        if Item_Pacote_Venda1.IsEmpty then
        begin
           memResumo.Clear;
           Item_Pacote_Venda1.LimpaCampos;
        end;
        ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
          ' PCT_SITUACAO=3 '+
          ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
          ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND PDV_CODIGO='+edtCodigoPDV.Text);
      end;

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
  end;
end;

procedure TfMxPacoteVenda.SB_SalvaClick(Sender: TObject);
Var
  mensagem:String;
  trans:boolean;
  Resultado:Double;
begin
  mensagem:='';
  if edtQuantidade.Text = '' then
    edtQuantidade.Text:='1';
  if dblSubGrupo1.Text = '' then
    mensagem:= mensagem + 'SubGrupo1 inválido!'+#13;
  if not VerificaFloatBranco(edtQuantidade.Text) then
    mensagem:= mensagem + 'Quantidade inválida!'+#13;
  if not VerificaFloatBranco(edtPrecoUnitario.Text) then
    mensagem:= mensagem + 'Preço Unitário inválido!'+#13;

  if mensagem <> '' then
    Raise Exception.Create(mensagem);

  if StrToFloat(edtQuantidade.Text) <= 0 then
    raise Exception.Create('Quantidade digitada incorretamente!');

  if StrToFloat(edtPrecoUnitario.Text) <= 0 then
    raise Exception.Create('SubGrupo sem Preço Unitário definido!');

  if (dblSubGrupo2.KeyValue > 0) and
     ((dblSubGrupo2.KeyValue = dblSubGrupo1.KeyValue) or
      (dblSubGrupo2.KeyValue = dblSubGrupo3.KeyValue) or
      (dblSubGrupo2.KeyValue = dblSubGrupo4.KeyValue)) then
    Raise exception.Create('SubGrupo2 está repetindo!');

  if (dblSubGrupo3.KeyValue > 0) and
     ((dblSubGrupo3.KeyValue = dblSubGrupo1.KeyValue) or
      (dblSubGrupo3.KeyValue = dblSubGrupo2.KeyValue) or
      (dblSubGrupo3.KeyValue = dblSubGrupo4.KeyValue)) then
    Raise exception.Create('SubGrupo3 está repetindo!');

  if (dblSubGrupo4.KeyValue > 0) and
     ((dblSubGrupo4.KeyValue = dblSubGrupo1.KeyValue) or
      (dblSubGrupo4.KeyValue = dblSubGrupo2.KeyValue) or
      (dblSubGrupo4.KeyValue = dblSubGrupo3.KeyValue)) then
    Raise exception.Create('SubGrupo4 está repetindo!');

  with DM.QR_Consultas do
  Begin
    //Verificar Repetição de SubGrupo no Pacote
    Close;
    SQL.Text := 'SELECT TOP 1 GRP_CODIGO '+
      ' FROM ITEM_DE_PACOTE_DE_VENDA '+
      ' WHERE (SGP_CODIGO_1='+IntToStr(dblSubGrupo1.KeyValue)+
      ' OR SGP_CODIGO_2='+IntToStr(dblSubGrupo1.KeyValue)+
      ' OR SGP_CODIGO_3='+IntToStr(dblSubGrupo1.KeyValue)+
      ' OR SGP_CODIGO_4='+IntToStr(dblSubGrupo1.KeyValue)+
      ' OR SGP_CODIGO_1='+IntToStr(dblSubGrupo2.KeyValue)+
      ' OR (SGP_CODIGO_2='+IntToStr(dblSubGrupo2.KeyValue)+
      ' AND SGP_CODIGO_2<>0) '+
      ' OR (SGP_CODIGO_3='+IntToStr(dblSubGrupo2.KeyValue)+
      ' AND SGP_CODIGO_3<>0) '+
      ' OR (SGP_CODIGO_4='+IntToStr(dblSubGrupo2.KeyValue)+
      ' AND SGP_CODIGO_4<>0) '+
      ' OR SGP_CODIGO_1='+IntToStr(dblSubGrupo3.KeyValue)+
      ' OR (SGP_CODIGO_2='+IntToStr(dblSubGrupo3.KeyValue)+
      ' AND SGP_CODIGO_2<>0) '+
      ' OR (SGP_CODIGO_3='+IntToStr(dblSubGrupo3.KeyValue)+
      ' AND SGP_CODIGO_3<>0) '+
      ' OR (SGP_CODIGO_4='+IntToStr(dblSubGrupo3.KeyValue)+
      ' AND SGP_CODIGO_4<>0) '+
      ' OR SGP_CODIGO_1='+IntToStr(dblSubGrupo4.KeyValue)+
      ' OR (SGP_CODIGO_2='+IntToStr(dblSubGrupo4.KeyValue)+
      ' AND SGP_CODIGO_2<>0) '+
      ' OR (SGP_CODIGO_3='+IntToStr(dblSubGrupo4.KeyValue)+
      ' AND SGP_CODIGO_3<>0) '+
      ' OR (SGP_CODIGO_4='+IntToStr(dblSubGrupo4.KeyValue)+
      ' AND SGP_CODIGO_4<>0)) '+
      ' AND IPV_CODIGO<>'+edtCodigoIPV.Text+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text+
      ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Open;
    if not IsEmpty then
      Raise exception.Create('SubGrupo repetido!');

    //Verificar Mistura de Grupo Especiais com Normais
    Close;
    SQL.Text := 'SELECT TOP 1 I1.GRP_CODIGO '+
      ' FROM ITEM_DE_PACOTE_DE_VENDA I1, GRUPO G1 '+
      ' WHERE I1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND I1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
      ' AND G1.GRP_ESPECIAL<>'+Grupo1.FieldByname('GRP_ESPECIAL').asString+
      ' AND I1.GRP_CODIGO=G1.GRP_CODIGO ';
    Open;
    if not IsEmpty then
      Raise exception.Create('Não é permitido misturar Grupo Especial com Normal!');

    //Verificar Produtos com Preços diferentes
    Close;
    SQL.Text := 'SELECT DISTINCT P1.PRD_PRECO_VENDA '+
      ' FROM PRODUTO P1 '+
      ' WHERE P1.SGP_CODIGO>0 '+
      ' AND P1.PRD_SERVICO=0 '+
      ' AND P1.GRP_CODIGO='+IntToStr(dblGrupo.KeyValue)+
      ' AND (P1.SGP_CODIGO='+IntToStr(dblSubGrupo1.KeyValue)+
      ' OR P1.SGP_CODIGO='+IntToStr(dblSubGrupo2.KeyValue)+
      ' OR P1.SGP_CODIGO='+IntToStr(dblSubGrupo3.KeyValue)+
      ' OR P1.SGP_CODIGO='+IntToStr(dblSubGrupo4.KeyValue)+') ';
    Open;
    if RecordCount > 1 then
      Raise exception.Create('Produtos com Preços diferentes!');
  end;

  if edtDesconto.Text = '' then
    Resultado:=0
  else
    Resultado:=StrToFloat(edtDesconto.Text);

  if DM.Configuracao1.Empresa <> empMotical then //Motical ignorar verificações de Desconto
  Begin
    if (StrToFloat(edtPrecoDesconto.Text) > 0) and ((Cliente1.Desconto > 0) OR (Cliente1.VendaAtacado)) then
    Begin
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
      Begin
        ShowMessage('Cliente com Desconto em Cadastro!');
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=33;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão esse Desconto!');
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
    Else if StrToFloat(edtPrecoDesconto.Text) > 0 then
    Begin
      if StrToFloat(edtPrecoDesconto.Text) < StrToFloat(format('%.2f',[Produto1.Precomedio])) then
      Begin
        ShowMessage('Produto: '+Produto1.Descricao+#13'com preço abaixo do Mínimo!');
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=33;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
                 (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão vender abaixo do Preço Mínimo!');
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
      End;
    end
    else
    Begin
      if StrToFloat(edtPrecoUnitario.Text) < StrToFloat(format('%.2f',[Produto1.Precomedio])) then
      Begin
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          ShowMessage('Preço de Venda abaixo do Mínimo!');
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=33;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
                 (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão vender abaixo do Preço Mínimo!');
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
      End;
    end;

    // Verifica se o usuário tem permissão para liberar desconto à prazo
    if (Cliente1.Desconto = 0) and (not Cliente1.VendaAtacado) then
    Begin
      If (Resultado>DM.Configuracao1.JurosNorm)and(Resultado<=DM.Configuracao1.JurosEsp)AND
         ((Forma_de_Pagamento1.Prazo='0')or(Forma_de_Pagamento1.Prazo=''))Then
      Begin
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          ShowMessage('Desconto acima do Permitido!');
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=33;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
                 (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
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
      Else If (Resultado>DM.Configuracao1.JurosEsp) then
      Begin
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          ShowMessage('Desconto acima do permitido!');
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=33;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
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
      else if (Forma_de_Pagamento1.Prazo <> '0') and (Resultado > 0) then
      Begin
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
           (not ((DM.Usuario1.Permissoes.IndexOf(IntToStr(3600)) > 0) and
                (Resultado<DM.Configuracao1.JurosEsp))) then
        Begin
          ShowMessage('Desconto acima do permitido!');
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=33;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                 (not((Usuario1.Permissoes.IndexOf(IntToStr(3600)) > 0)and
                 (Resultado<DM.Configuracao1.JurosEsp))) then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
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
      Else If (Resultado>0) and (Resultado<=DM.Configuracao1.JurosNorm) then
      Begin
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND //Desc. Total
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) AND //Desc. Especial
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) AND //Abaixo do Mínimo
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) then //Desc. Simples
        Begin
          ShowMessage('Usuário não tem Permissão para Liberar Desconto!');
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=33;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND
                 (Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) AND
                 (Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) AND
                 (Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) then
              begin
                free;
                raise Exception.Create('Usuário não tem Permissão para Liberar Desconto!');
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

      if Item_Pacote_Venda1.FinalizaEdicao then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
          ' PCT_SITUACAO=0 '+
          ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND PDV_CODIGO='+edtCodigoPDV.Text);
      end
      else
        Raise exception.Create('');
      If DM.Configuracao1.ControleTransacao then
        Commit;
      SB_NovoClick(sender);
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

procedure TfMxPacoteVenda.SB_CancClick(Sender: TObject);
begin
  ValorAnt:=0;
  Item_Pacote_Venda1.CancelaEdicao;
  AtualizaControles(False, False);

  If Item_Pacote_Venda1.IsEmpty Then
  Begin
    dbgItens.SetFocus;
    Item_Pacote_Venda1.LimpaCampos;
  End
  else
    CarregarItemVenda;
end;

procedure TfMxPacoteVenda.SB_SalvarPedidoClick(Sender: TObject);
Var
  Soma, VAVista, VAPrazo, Entra:Double;
  aux,aux2:TDataSetNotifyEvent;
  trans, cCartao, TemEntrada:Boolean;
  ObsTrc:string;
  iGrupoEspecial:integer;
begin
  ObsTrc := '';
  If Entidade.IsEmpty then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  If not (VerificaInteiroBranco(edtCodigoCLI.Text)) or (Cliente1.IsEmpty) or
     (edtCodigoCLI.Text='0') then
    Raise Exception.Create('Não foi selecionado nenhum cliente para este pedido!');
  If Item_Pacote_Venda1.IsEmpty then
    Raise Exception.Create('Não existem itens para este pedido!');
  if (Forma_de_Pagamento1.Prazo <> '0') and (StrToInt(edtCodigoCLI.Text) = DM.Configuracao1.CodigoCliAVista) then
    Raise Exception.Create('Não é possível atribuir uma venda à prazo a um cliente à Vista!');
  if not VerificaData(mskMelhorData.Text) then
    Raise Exception.Create('Melhor data inválida!')
  else if mskMelhorData.Text <> '  /  /    ' then
    if (Trunc(StrToDate(mskMelhorData.Text)) > Trunc(DM.Configuracao1.Data)+(DM.Configuracao1.MelhorData)) then
      Raise Exception.Create('Melhor data acima do permitido!');
  if Entidade.Situacao > 3 then
    Raise Exception.Create('Não pode mais ser Salvo!');
  if Trim(edtCodigoCLI.Text) = IntToStr(DM.Configuracao1.CodigoCliAVista) then
    Raise exception.Create('Não é possível vender Pacote para cliente balcão!');
  Soma:=0;

  with DM.QR_Consultas do
  Begin
    //Verificar se tem Grupo Especial
    Close;
    SQL.Text := 'SELECT TOP 1 GRP_ESPECIAL '+
      ' FROM GRUPO '+
      ' WHERE GRP_CODIGO='+IntToStr(Item_Pacote_Venda1.CodigoGRP);
    Open;
    if FieldByName('GRP_ESPECIAL').asString = '1' then
      iGrupoEspecial:=1
    else
      iGrupoEspecial:=0;
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

      If not Item_Pacote_Venda1.IsEmpty then
      Begin
        //Selecionar Fator Financeiro
        With FatorFinanceira1 do
        Begin
          Close;
          ParamByName('AGF_CODIGO').AsInteger:=AgenteFin1.CodigoAGF;
          If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
            ParamByName('FAF_NPARC').AsInteger:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
          Else
            ParamByName('FAF_NPARC').AsInteger:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);
          Open;
        End;

        //Deletar os títulos gerados na tabela temporaria por este item antes de gerá-los novamente
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM TRCTEMP '+
          ' WHERE PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND CNC_CODIGO='+IntToStr(Entidade.CodigoCNC));

        //Gerar titulos temporários
        With Item_Pacote_Venda1 do
        Begin
          aux:=AfterScroll;
          AfterScroll:=Nil;
          aux2:=OnCalcFields;
          OnCalcFields:=nil;
          first;
          VAVista := 0;
          VAPrazo := 0;
          cCartao := False;
          while not eof do
          begin
            Soma:=Soma+Arredonda(Quantidade*Arredonda(PrecoDesc));
            next;
          end;
          AfterScroll:=aux;
          OnCalcFields:=aux2;
          If (Forma_de_Pagamento1.Prazo = '0') and
             (dblTipoPagamento.KeyValue <> 13) and (dblTipoPagamento.KeyValue <> 412) Then
            VAVista:=Soma
          else
          Begin
            VAPrazo:=Soma;
            If Entidade.TipoPag=13 Then
              cCartao := True;
          end;

          Entra:=0;
          If Entidade.Entrada > 0 then
          Begin
            TemEntrada := True;
            Entra := Entidade.Entrada;
          end
          Else if Forma_de_Pagamento1.Prazo[1]='0' then
            TemEntrada := True
          else
            TemEntrada := False;

          Titulo_receber1.GerarTitVista(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartãoCV*), VAVista,'','TRC_CODIGO',1);
          Titulo_receber1.GerarTitPrazo(Entidade.ClienteCNC, Entidade.CodigoCLI, ''(*CartãoCV*), VAPrazo, Entra, TemEntrada, cCartao, ObsTrc, 'TRC_CODIGO', 1);

          //Muda situacao para pedido aprovado e coloca o valor total do pedido
          Titulo_receber4.Close;
          Titulo_receber4.Open;

          // Evitar erros no acréscimo por arredondamento
          if ABS(Titulo_receber4.FieldByName('TotalPedido').asFloat-Soma) > 0.2 then
            ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
              ' PCT_SITUACAO=3 '+
              ',PCT_TOTAL='+VirgPonto(Soma)+
              ',PCT_ACRESCIMO='+VirgPonto(Titulo_receber4.FieldByName('TotalPedido').asFloat-Soma)+
              ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
              ',CLI_CODIGO='+edtCodigoCLI.Text+
              ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',PCT_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND PDV_CODIGO='+edtCodigoPDV.Text)
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
              ' PCT_SITUACAO=3, '+
              ' PCT_TOTAL='+VirgPonto(Soma)+
              ',PCT_ACRESCIMO=0'+
              ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
              ',CLI_CODIGO='+edtCodigoCLI.Text+
              ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',PCT_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND PDV_CODIGO='+edtCodigoPDV.Text)
        end; // Fim do With Item_Pacote_Venda1
      End; // Fim do If not Item_Pacote_Venda1.isEmpty
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

  Aux:=Item_Pacote_Venda1.AfterScroll;
  Item_Pacote_Venda1.AfterScroll:=nil;
  Item_Pacote_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pacote_Venda1.Open;
  Item_Pacote_Venda1.AfterScroll:=Aux;
  //Gerar resumo
  Titulo_receber2.Close;
  Titulo_receber2.Open;
  Entidade.Resumo(Titulo_receber2);
end;

procedure TfMxPacoteVenda.SB_InformacoesClick(Sender: TObject);
begin
  if (Entidade.IsEmpty) then
    Raise Exception.Create('Faça o Pedido primeiro!');

  if StrToInt(edtCodigoCLI.Text) <> DM.Configuracao1.CodigoCliAVista then
  Begin
    if Cliente1.SPC = 1 then
      ShowMessage('Esta venda não será permitida!'+#13+'Procure a gerência!')
    else
    Begin
      Titulo_receber5.Close;
      Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger:=StrToInt(edtClienteCNC.Text);
      Titulo_receber5.ParamByName('CLI_CODIGO').asInteger:=StrToInt(edtCodigoCLI.Text);
      Titulo_receber5.ParamByName('DATA').asDate := DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente;;
      Titulo_receber5.Open;
      if (not Titulo_receber5.IsEmpty) then
        ShowMessage('Será necessário autorização para efetuar essa venda!'+#13+'Procure a gerência!')
      else
      Begin
        Informacoes1.Close;
        Informacoes1.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
        Informacoes1.ParamByName('CLI_CODIGO').asInteger:=Cliente1.CodigoCLI;
        Informacoes1.Open;
        if Informacoes1.Proibido then
          ShowMessage('Esta venda não será permitida (PROIB)!'+#13+'Procure a gerência!')
        Else if not Informacoes1.IsEmpty then
        Begin
          if (Informacoes1.CreditoUtil > Informacoes1.LimiteCredito) and
             (Informacoes1.LimiteCredito > 0) then
          Begin
            ShowMessage('Verifique Limite de Crédito com a Gerência!');
            Exit;
          end;
        end;
        ShowMessage('Cliente está OK!');
      end;
    end;
  end
  else
    ShowMessage('Cliente à Vista!');
end;

procedure TfMxPacoteVenda.SB_FecharPedidoClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxPacoteVenda.SB_FinalizarPedidoClick(Sender: TObject);
Var
  CdCLICNC, CdCLI, CdCNC, CdPDV, SEQ:Integer;
  Trans:Boolean;
  aux,aux2:TDataSetNotifyEvent;
  sCodigoCARTAO: string;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if (not Item_Pacote_Venda1.Active) or (not Entidade.Active) then
    Raise Exception.Create('Faça o Pedido primeiro!');
  if (Item_Pacote_Venda1.IsEmpty) or (Entidade.IsEmpty) then
    Raise Exception.Create('Faça o Pedido primeiro!');
  SB_SalvarPedidoClick(sender);

  //Verifica permissão para finalizar o pedido
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6770)) < 0 then
    raise Exception.Create('O usuário não tem permissão para finalizar o pacote!');
  If not (VerificaInteiroBranco(edtCodigoCLI.Text)) or (Cliente1.IsEmpty) or
    (edtCodigoCLI.Text = '0') then
    Raise Exception.Create('Não foi selecionado nenhum cliente para este pedido!');
  If Item_Pacote_Venda1.IsEmpty then
    Raise Exception.Create('Não existem itens de pedido a serem processados!');
  If (dblTipoPagamento.Text = '') then
    Raise Exception.Create('Tipo de pagamento faltando!');
  If (dblFormaPagamento.Text = '') then
    Raise Exception.Create('Forma de pagamento faltando!');
  If Entidade.Situacao<>3 then
    Raise Exception.Create('Salve o pedido antes de finalizar!');
  if (Forma_de_Pagamento1.Prazo <> '0') and
     (StrToInt(edtCodigoCLI.Text) = DM.Configuracao1.CodigoCliAVista) then
    Raise Exception.Create('Não é possível atribuir uma venda à prazo ao Cliente Balcão!');

  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;
  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;

  Informacoes1.Close;
  Informacoes1.ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
  Informacoes1.ParamByName('CLI_CODIGO').asInteger := CdCLI;
  Informacoes1.Open;
  if Informacoes1.Proibido then
    Raise exception.Create('Cliente Bloqueado!'+#13+'Procure a gerência!');

  if (StrToInt(edtCodigoCLI.Text) <> DM.Configuracao1.CodigoCliAVista) and
     (not ((dblFormaPagamento.KeyValue = 1) and (dblTipoPagamento.KeyValue = 5))) then
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
          Tag:=33;
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
    Titulo_receber5.Close;
    Titulo_receber5.ParamByName('CNC_CLIENTE').asInteger := CdCLICNC;
    Titulo_receber5.ParamByName('CLI_CODIGO').asInteger  := CdCLI;
    Titulo_receber5.ParamByName('DATA').asDate           := DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente;
    Titulo_receber5.Open;
    if not Informacoes1.IsEmpty then
    Begin
      with DM.Avalista1 do
      Begin
        if VerificaInteiroBranco(mskCNPJCPF.Text) then
        Begin
          Close;
          SQL.Text := 'SELECT * FROM AVALISTA ' +
            ' WHERE CNC_CODIGO='+IntToStr(Informacoes1.CodigoCNC)+
            ' AND (AVL_CGC_CPF="'+mskCNPJCPF.Text+'" AND AVL_CGC_CPF<>"")';
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
              ' AND TRC_SITUACAO IN (0,1,8,9) AND '+
              ' TRC_VENCIMENTO>"'+MesDia(DM.Configuracao1.Data - DM.Configuracao1.DiasLibVendaInadiplente)+'") ';
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
          Tag:=33;
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

  if SB_FinalizarPedido.Enabled then
  Begin
    SB_SalvarPedido.Enabled := False;
    SB_Informacoes.Enabled := False;
    SB_FinalizarPedido.Enabled := False;
  end
  else
    Exit;

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

      With DM.QR_Consultas do
      Begin
        Close;
        SQL.Text:='SELECT * '+
                ' FROM TRCTEMP '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND PDV_CODIGO='+IntToStr(CdPDV)+
                ' ORDER BY TRC_VENCIMENTO';
        Open;
        First;
        Titulo_receber3.Open;
        SEQ:=1;
        While not EOF do
        Begin
          if not Titulo_receber3.Inserir(DM.Configuracao1.CodigoCNC,0,Cliente1.CodigoCLI,
              FieldByName('PDV_CODIGO').AsInteger,FieldByName('CCX_CODIGO').AsInteger,
              FieldByName('CCX_CODIGO_REC').AsInteger,
              dblTipoPagamento.KeyValue,FieldByName('TRC_TIPO_DOC').AsInteger, 0(*TRF*),0(*Reabertura*),
              FieldByName('TRC_VENCIMENTO').AsDateTime,0(*DtPagamento*),
              0(*DtOrigem*),0(*DtVerificado*),FieldByName('TRC_OBSERVACAO').AsString,PreencheZero(2,SEQ),
              '',sCodigoCARTAO,
              FieldByName('TRC_VALOR').AsFloat,0(*ValorPago*),
              FieldByName('TRC_CRED_CLI').AsFloat,
              FieldByName('AGF_CODIGO').AsInteger,Cliente1.CodigoCNC,0(*Situacao*),
              0(*TitAnterior*),0(*TitOriginal*),1(*TipoPedido*),
              False(*GerouMovimento*), False(*CHQDev*)) then
            Raise Exception.Create('');
          SEQ:=SEQ+1;
          Next;
        End;
        Close;
      End;

      //Deletar do arquivo temporário
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM TRCTEMP '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

      With Item_Pacote_Venda1 do
      Begin
        aux:=AfterScroll;
        AfterScroll:=Nil;
        aux2:=OnCalcFields;
        OnCalcFields:=nil;
        DisableControls;
        first;
        While not eof do
        Begin
          //Item de pedido fica finalizado
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PACOTE_DE_VENDA SET '+
            ' IPC_SITUACAO=3 '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND IPV_CODIGO='+IntToStr(CodigoIPV));
          next;
        End;
        EnableControls;
        AfterScroll:=aux;
        OnCalcFields:=aux2;
      end;

      //Pedido vira venda confirmada
      ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
        ' PCT_SITUACAO=4 '+
        ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
        ',PCT_DT_CADASTRO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
//Não Existe        ',PCT_DT_FINALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

      If FatorFinanceira1.Active=True then
        FatorFinanceira1.Active:=False;


      With Cliente1 do
      Begin
        //Mudar situacao de cliente
        if Cliente1.Situacao = 0 then
          ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
            ' CLI_SITUACAO=1 '+
            ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CLI_SITUACAO=0 '+
            ' AND CLI_CODIGO='+IntToStr(CdCLI)+
            ' AND CNC_CODIGO='+IntToStr(CdCLICNC));

        //Aumentar o crédito utilizado do cliente (Diferente de (À Vista ou Cartão)
        if (Entidade.CodigoFPG <> 1) and (Entidade.TipoPag <> 13) then
        Begin
          if (Informacoes1.Active) and (Informacoes1.IsEmpty) then
            Informacoes1.Inserir(CodigoCNC,CodigoCLI,0,0,0,0,Entidade.Total+Entidade.Acrescimo,
              0,0,0(*Renda*),Entidade.DataCadastro,'','','','','','',False,False,Entidade.Total+Entidade.Acrescimo)
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
              ' ICR_CRED_UTIL='+VirgPonto(Informacoes1.CreditoUtil+Entidade.Total+Entidade.Acrescimo)+
              ',ICR_DT_ULT_CMP="'+MesDiaHora(Entidade.DataCadastro)+'" '+
              ',ICR_VL_ULT_CMP='+VirgPonto(Entidade.Total+Entidade.Acrescimo)+
              ' WHERE CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC)+
              ' AND CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI));
        end;
      end;

      //Gerar Log de Finalizar Pacote
      if not Entidade.GeraLog(6770,CdCNC,CdPDV) then
      Begin
        ShowMessage('Falha ao gerar LOG!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;

      if (Forma_de_Pagamento1.Prazo<>'0') and (Forma_de_Pagamento1.Prazo<>'') then
        SB_Promissoria.Enabled:=True;

    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
        end;
      Exit;
    end;
  End;

  //Verificar os títulos a receber do pedido se não foi à vista ou em Cheque
  If MessageDlg('Deseja ver os títulos desse Cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    Application.CreateForm(TfMxSRecPed, fMxSRecPed);
    with fMxSRecPed do
    Begin
      Tag :=6;
      edtCodigoCLI.Text     :=  self.edtCodigoCLI.Text;
      edtRazaoSocial.Text   :=  self.edtRazaoSocial.Text;
      mskCNPJ_CPF.Text      :=  self.mskCNPJCPF.Text;
      edtCGF_RG.Text        :=  self.Cliente1.CGFRG;
      edtObservacaoCLI.Text :=  self.Cliente1.OBS;
      Cliente1.Close;
      Cliente1.ParamByName('CNC_CODIGO').AsInteger := self.Entidade.ClienteCNC;
      Cliente1.ParamByName('CLI_CODIGO').AsInteger := self.Entidade.CodigoCLI;
      ShowModal;
    end;
  End;

  Entidade.Close;
  Entidade.Open;

  if Cliente1.Nota then
    SB_CupomClick(sender);  
end;

procedure TfMxPacoteVenda.Calculadora1Click(Sender: TObject);
var
  Hand1 : HWND;
begin
  Hand1 := FindWindow('SciCalc',nil);
  if Hand1 <> 0 then
  Begin
    SetForegroundWindow(Hand1);
    ShowWindow(Hand1, SW_RESTORE);
  end
  else if FileExists('C:\WINDOWS\CALC.EXE') then
    ShellExecute(0,nil,'C:\WINDOWS\CALC.EXE','',NIL,SW_NORMAL)
  else if FileExists('C:\WINDOWS\SYSTEM32\CALC.EXE') then
    ShellExecute(0,nil,'C:\WINDOWS\SYSTEM32\CALC.EXE','',NIL,SW_NORMAL)
  else
    ShowMessage('Arquivo <Calc.exe> não encontrado!');
end;

procedure TfMxPacoteVenda.Calendrio1Click(Sender: TObject);
begin
  Application.CreateForm(TfMxFeriados, fMxFeriados);
  fMxFeriados.tag:=0;
  fMxFeriados.ShowModal;
end;

procedure TfMxPacoteVenda.SB_CancelarPedidoClick(Sender: TObject);
var
  Trans:Boolean;
  CdCNC, CdPDV: integer;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Não existe pedido para cancelar!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');
  if not (Entidade.situacao in [0,1,2,3]) then
    Raise Exception.Create('Pedido não pode ser alterado!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar vendas neste centro de custo.');

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;

{  //Verificar se foi feito remessa desse pacote
  if Entidade.Situacao = 4 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO AS PEDIDO '+
        ' FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_PACOTE='+IntToStr(CdPDV)+
        ' AND PDV_SITUACAO<>6 '; //Dif. Cancelado
      Open;
      if not IsEmpty then
        Raise exception.Create('Pacote com remessa PDV:'+FieldByName('PEDIDO').asString);
    end;
  end;
}

  If MessageDlg('Tem certeza que deseja Cancelar esse Pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  If Item_Pacote_Venda1.IsEmpty then
  Begin
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM PACOTE_DE_VENDA WHERE CNC_CODIGO='+
      IntToStr(DM.Configuracao1.CodigoCNC)+' AND PDV_CODIGO='+edtCodigoPDV.Text);
    SB_NovoPedClick(sender);
  end
  else
  Begin
    // Verifica se o usuário que está logado não tem permissão para cancelar o pedido
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6800)) < 0 then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=33;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if usuario1.Permissoes.IndexOf(IntToStr(6800)) < 0 then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para cancelar o pacote de venda!');
          end
          else
            DM.Usuario1.GeraLog(6800, CdCNC, CdPDV,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' PACOTE-CANCELAR');
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
      DM.Usuario1.GeraLog(6800, CdCNC, CdPDV, 'PACOTE-CANCELAR');

    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;
        ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
          ' PCT_SITUACAO=6 '+
          ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
          ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PDV_CODIGO='+IntToStr(CdPDV));

        //Log foi gerado antes quando verifica permissão

        If DM.Configuracao1.ControleTransacao then
          Commit;
        SB_NovoPedClick(sender);
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
end;

procedure TfMxPacoteVenda.SB_PromissoriaClick(Sender: TObject);
begin
  Application.CreateForm(TfmxSelProm, fmxSelProm);
  fmxSelProm.tag:=6;
  fmxSelProm.ShowModal;
end;

procedure TfMxPacoteVenda.dblSubGrupo1Click(Sender: TObject);
begin
  if TDBLookupComboBox(Sender).Enabled then
  Begin
    with Produto1 do
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := TDBLookupComboBox(Sender).KeyValue;
      Open;
      if RecordCount > 1 then
      Begin
        ShowMessage('SubGrupo com diferentes preços!');
        edtPrecoUnitario.Text := '0';
      end
      else if (not Servico) and
              (not Grupo1.Especial) then
      Begin
        with DM.QR_Consultas do
        Begin
          //Preço da Tabela de Laboratório Principal
          Close;
          SQL.Text := 'SELECT * '+
            ' FROM TABELA_DE_PRECO_SUBGRUPO T1, ITEM_DE_TABELA_DE_PRECO_SUBGRUPO I1 '+
            ' WHERE I1.GRP_CODIGO='+IntToStr(dblGrupo.KeyValue)+
            ' AND I1.SGP_CODIGO='+IntToStr(TDBLookupComboBox(Sender).KeyValue)+
            ' AND I1.ITS_SITUACAO = 0 '+
            ' AND T1.TPS_SITUACAO=0 '+
            ' AND T1.TPS_LABORATORIO=1 '+  //Laboratório Principal
            ' AND T1.TPS_PRINCIPAL=1 '+  //Tabela Principal
            ' AND T1.TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '+
            ' AND (T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' OR T1.CNC_CODIGO=1) '+
            ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND T1.TPS_CODIGO=I1.TPS_CODIGO '+
            ' ORDER BY ITS_PRECO_VENDA ASC ';
          Open;
          if IsEmpty then
          Begin
            ShowMessage('SubGrupo não cadastrado na Tabela!');
            edtPrecoUnitario.Text := '0';
          end
          else
            edtPrecoUnitario.Text := format('%.2f',[FieldByname('ITS_PRECO_VENDA').asFloat]);
        end;
      end
      else //Serviço
        edtPrecoUnitario.Text := format('%.2f',[Precovenda]);

      edtDescontoChange(sender);
    end;
  end;
end;

procedure TfMxPacoteVenda.dblSubGrupo2Click(Sender: TObject);
begin
  if dblSubGrupo2.Text = '' then
    Exit;
  if dblSubGrupo2.Enabled then
    with Produto1 do
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := dblSubGrupo2.KeyValue;
      Open;
      if edtPrecoUnitario.Text <> format('%.2f',[PrecoVenda]) then
      Begin
        dblSubGrupo2.SetFocus;
        dblSubGrupo2.KeyValue := 0;
        raise exception.Create('SubGrupo com preço diferente do Principal!');
      end;
    end;
end;

procedure TfMxPacoteVenda.dblSubGrupo3Click(Sender: TObject);
begin
  if dblSubGrupo3.Text = '' then
    Exit;
  if dblSubGrupo3.Enabled then
    with Produto1 do
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := dblSubGrupo3.KeyValue;
      Open;
      if edtPrecoUnitario.Text <> format('%.2f',[PrecoVenda]) then
      Begin
        dblSubGrupo3.SetFocus;
        dblSubGrupo3.KeyValue := 0;
        raise exception.Create('SubGrupo com preço diferente do Principal!');
      end;
    end;
end;

procedure TfMxPacoteVenda.dblSubGrupo4Click(Sender: TObject);
begin
  if dblSubGrupo4.Text = '' then
    Exit;
  if dblSubGrupo4.Enabled then
    with Produto1 do
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := dblSubGrupo4.KeyValue;
      Open;
      if edtPrecoUnitario.Text <> format('%.2f',[PrecoVenda]) then
      Begin
        dblSubGrupo4.SetFocus;
        dblSubGrupo4.KeyValue := 0;
        raise exception.Create('SubGrupo com preço diferente do Principal!');
      end;
    end;
end;

procedure TfMxPacoteVenda.SB_ImprimirPedidoClick(Sender: TObject);
var
  aux:TDataSetNotifyEvent;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Faça o Pedido primeiro!');
  If not Item_Pacote_Venda1.Active then
    Raise Exception.Create('Não existem itens a serem impressos!');
  If Item_Pacote_Venda1.IsEmpty then
    Raise Exception.Create('Não existem itens a serem impressos!');
  if Entidade.Situacao < 4 then
    SB_SalvarPedidoClick(sender);
  Aux:=Item_Pacote_Venda1.AfterScroll;
  Item_Pacote_Venda1.AfterScroll:=nil;
  Item_Pacote_Venda1.Close;
  Entidade.Close;
  Entidade.Open;
  Item_Pacote_Venda1.Open;
  Item_Pacote_Venda1.AfterScroll:=Aux;
  Item_Pacote_Venda1.CarregaDados;
  CarregarItemVenda;
  if DM.Configuracao1.Daruma <> 1 then
  Begin
    Application.CreateForm(Trpt_PacotesCliente, rpt_PacotesCliente);
    with rpt_PacotesCliente do
    Begin
      tag := 4;
      zrlTitulo.Caption := 'SIAC - Pacote de Venda';
      zrlFiltros.Caption := '';
      report.Options.PageLength := 30;

      zrbParcelas.Height := 2;
      zrlTracoDuploParcela.top := 3;
      zrbCabecalhoCNC.Height := 0;
      zrbTotalGeral.Height   := 0;

      szrNota.Enabled:=False;
      zrlNotaFiscal.Enabled:=False;
      zrlNotaCupom.Enabled:=False;
      ZRLabel5.Top   := 2;
      zrbCabecalhoPagina.Height := 3;
      ZRLabel4.Caption := 'Total';
      zrbCabecalhoFUN1.Expression := '';
      zrlDtAlteracao.Enabled  := True;
      zrbTotalCentro.Height      := 0;  //SubTotal por Centro de Custo
      ZRLabel21.Enabled := False;
      zrlTotalCentro.Enabled := False;
      zrlFiltros.Enabled := False;
      zrbCabecalhoPedido.Height:= 11;

      Entidade.Close;
      Entidade.SQL.Text:='SELECT P1.*,I1.* '+
        ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
        ' WHERE (P1.CLI_CODIGO<>0) '+
        ' AND P1.CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
        ' AND P1.PDV_CODIGO='+IntToStr(self.Entidade.CodigoPDV)+
        ' AND (P1.CNC_CODIGO*=I1.CNC_CODIGO) '+
        ' AND (P1.PDV_CODIGO*=I1.PDV_CODIGO) '+
        ' ORDER BY P1.CNC_CODIGO,P1.PDV_CODIGO ASC ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
//      SZRLabel5.Caption := mskDataINI.Text;
//      SZRLabel7.Caption := mskDataFIM.Text;
      report.preview;
      Close;
    end;
  end
  else
  Begin
    Application.CreateForm(Trpt_PedidoVendaCodigoPreco, rpt_PedidoVendaCodigoPreco);
    with rpt_PedidoVendaCodigoPreco do
    Begin
      SZRLabel2.Caption:=edtCodigoPDV.Text;
      SZRLabel3.Caption:=edtDataHora.Text;
      SZRLabel4.Caption:=format('%.2f',[Pacote_de_Venda1.Total+Pacote_de_Venda1.Acrescimo]);
      SZRLabel5.Enabled:=False;
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxPacoteVenda.SubGrupo1BeforeOpen(DataSet: TDataSet);
begin
  SubGrupo1.ParamByName('GRP_CODIGO').asInteger := Grupo1.CodigoGRP;
end;

procedure TfMxPacoteVenda.SubGrupo2BeforeOpen(DataSet: TDataSet);
begin
  SubGrupo2.ParamByName('GRP_CODIGO').asInteger := Grupo1.CodigoGRP;
end;

procedure TfMxPacoteVenda.SubGrupo3BeforeOpen(DataSet: TDataSet);
begin
  SubGrupo3.ParamByName('GRP_CODIGO').asInteger := Grupo1.CodigoGRP;
end;

procedure TfMxPacoteVenda.SubGrupo4BeforeOpen(DataSet: TDataSet);
begin
  SubGrupo4.ParamByName('GRP_CODIGO').asInteger := Grupo1.CodigoGRP;
end;

procedure TfMxPacoteVenda.dblGrupoClick(Sender: TObject);
begin
  SubGrupo1.Close;
  SubGrupo1.Open;
  SubGrupo2.Close;
  SubGrupo2.Open;
  SubGrupo3.Close;
  SubGrupo3.Open;
  SubGrupo4.Close;  
  SubGrupo4.Open;
end;

procedure TfMxPacoteVenda.SB_CupomClick(Sender: TObject);
begin
  if Entidade.Situacao <> 4 then
    Raise exception.Create('Pedido não finalizado!');
  if not SB_Cupom.Enabled then
    Exit;
    
  if not VerificaCPFCNPJBranco(Cliente1.CPFCGC) then
  Begin
    ShowMessage('Cliente com CPF/CNPJ inválido!');
    Exit;
  end;

  if (not Cliente1.PessoaFisica) and
     (Cliente1.CGFRG <> '') and
     (not VerificaCGFBranco(Cliente1.CGFRG, Cliente1.Uf)) then
    Raise exception.Create('CGF inválido!');

  Application.CreateForm(TfMxNotaFiscal, fMxNotaFiscal);
  with fMxNotaFiscal do
  Begin
    HelpContext:=6500;
    tag := 3;
    ShowModal;
  end;
end;

procedure TfMxPacoteVenda.dbgItensTitleClick(Column: TColumn);
begin
  try
    if Item_Pacote_Venda1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_Pacote_Venda1.SOrdemdoGrid(Item_Pacote_Venda1.EDbgrid,Column,'');
  except
  end;
end;

end.


