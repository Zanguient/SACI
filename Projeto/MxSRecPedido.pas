unit MxSRecPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Cliente, Db,
  DBTables, SQuery, Titulo_receber, Forma_de_Pagamento, Informacoes,
  Parametro, JPEG;

type
  TfMxSRecPed = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    Label21: TLabel;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Panel5: TPanel;
    Label22: TLabel;
    DBGrid5: TDBGrid;
    Label2: TLabel;
    Titulo_receber1: TTitulo_receber;
    Cliente1: TCliente;
    DSTitulo_receber1: TDataSource;
    mskCNPJ_CPF: TMaskEdit;
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
    SB_ObservacaoCLI: TSpeedButton;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Parametro1: TParametro;
    Titulo_receber1TipoPag: TStringField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Label12: TLabel;
    Bevel1: TBevel;
    imgCliente: TImage;
    edtObservacaoCLI: TEdit;
    Label1: TLabel;
    edtCGF_RG: TEdit;
    Label3: TLabel;
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
    SB_ObservacaoTRC: TSpeedButton;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    SB_Renegociar: TSpeedButton;
    SB_Pagar: TSpeedButton;
    bitFechar: TBitBtn;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    SpeedButton1: TSpeedButton;
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
    Titulo_receber1Verificado: TStringField;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CV: TStringField;
    Titulo_receber1TRC_LOCAL: TStringField;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_RenegociarClick(Sender: TObject);
    procedure SB_PagarClick(Sender: TObject);
    procedure SB_ObservacaoCLIClick(Sender: TObject);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure imgClienteDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ObservacaoTRCClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    Cancelar: Boolean;
    CNC:string;
  end;

var
  fMxSRecPed: TfMxSRecPed;

implementation
Uses
  UDM, Funcoes, MxRecebPedido, MxPedidoRapido, MxRenegoc,
  MxSRecParcela, MxCliObs, MxFotoAmpliada, MxCheque, MxPedidoMotCal,
  MxPacoteVenda, MxServico, MxPacoteCredito, MxServicoLBM, MxDevolucaoPed,
  MxTrocaProdutoProc, DigSenha, MxPedidoMotCal_2;
{$R *.DFM}


procedure TfMxSRecPed.Cliente1AfterScroll(DataSet: TDataSet);
begin
//  Cliente1.CarregaDados;
  With Informacoes1 do
  Begin
    Close;
    parambyname('CLI_CODIGO').AsInteger:=Cliente1.CodigoCLI;
    parambyname('CNC_CODIGO').AsInteger:=Cliente1.CodigoCNC;
    Open;
  End;
  edtObservacaoCLI.Text:=Cliente1.OBS;
end;


procedure TfMxSRecPed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_SREC_PED_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  try
    Titulo_receber1.close;
    Cliente1.Close;
  finally
    Action:=Cafree;
  end;  
end;

procedure TfMxSRecPed.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSRecPed.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  //Se tiver sido chamado a partir da janela fMxRecPed
  If Tag=0 Then
  Begin
    If fMxRecPed.PageControl1.ActivePage = fMxRecPed.tabPorPedido Then
    Begin
      Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxRecPed.Pedido_de_Venda1.ClienteCNC;
      Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger := fMxRecPed.Pedido_de_Venda1.CodigoCLI;
    end;
  end
  Else If Tag=2 Then
  Begin
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxPedidoRapido.Pedido_de_Venda1.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger := fMxPedidoRapido.Pedido_de_Venda1.CodigoCLI;
  end
  Else If Tag=4 Then
  Begin
    //LBM
  end
  Else If Tag=5 Then
  Begin
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxPedidoMotCal.Pedido_de_Venda1.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger := fMxPedidoMotCal.Pedido_de_Venda1.CodigoCLI;
  end
  Else If Tag=6 Then
  Begin
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxPacoteVenda.Pacote_de_venda1.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger := fMxPacoteVenda.Pacote_de_venda1.CodigoCLI;
  end
  Else If Tag=7 Then
  Begin
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxServico.Entidade.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger := fMxServico.Entidade.CodigoCLI;
  end
  Else If Tag=8 Then
  Begin
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxPacoteCredito.Entidade.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger := fMxPacoteCredito.Entidade.CodigoCLI;
  end
  Else If Tag=9 Then
  Begin
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxServicoLBM.Entidade.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger := fMxServicoLBM.Entidade.CodigoCLI;
  end
  Else If Tag=10 Then
  Begin
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxDevPed.Entidade.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger  := fMxDevPed.Entidade.CodigoCLI;
  end
  Else If Tag=11 Then
  Begin
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxTrocaProdutoProc.Cliente1.CodigoCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger  := fMxTrocaProdutoProc.Cliente1.CodigoCLI;
  end
  Else If Tag=12 Then
  Begin
    Titulo_receber1.SQL.Text := ' SELECT * FROM TITULO_A_RECEBER WHERE CLI_CODIGO=:CLI_CODIGO AND CNC_CLIENTE=:CNC_CLIENTE '+
       ' AND PDV_CODIGO=:PDV_CODIGO AND (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=8) ORDER BY TRC_VENCIMENTO ';
    Titulo_receber1.ParamByName('PDV_CODIGO').asInteger := fMxPedidoMotCal.Pedido_de_Venda1.CodigoPDV;
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxPedidoMotCal.Pedido_de_Venda1.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger := fMxPedidoMotCal.Pedido_de_Venda1.CodigoCLI;
  end
  Else If Tag=13 Then
  Begin
    Titulo_receber1.ParamByName('CNC_CLIENTE').AsInteger := fMxPedidoMotCal_2.Pedido_de_Venda1.ClienteCNC;
    Titulo_receber1.ParamByName('CLI_CODIGO').AsInteger := fMxPedidoMotCal_2.Pedido_de_Venda1.CodigoCLI;
  end;

  Titulo_receber1.Active:=true;
  Cliente1.Active:=true;
  try
    if Cliente1.CodigoCNC < 10 then
      imgCliente.Picture.LoadFromFile(DM.Configuracao1.PastaImagens+'\Cliente\0'+
        IntToStr(Cliente1.CodigoCNC)+'-'+edtCodigoCLI.Text+'.JPG')
    else
      imgCliente.Picture.LoadFromFile(DM.Configuracao1.PastaImagens+'\Cliente\'+
        IntToStr(Cliente1.CodigoCNC)+'-'+edtCodigoCLI.Text+'.JPG');
  Except
  end;
end;

procedure TfMxSRecPed.SB_RenegociarClick(Sender: TObject);
begin
  If Titulo_receber1.IsEmpty then
    raise Exception.Create('Não existem títulos a serem pagos!');
  If (Titulo_receber1.Situacao>=2) and (Titulo_receber1.Situacao<>8)then
    raise Exception.Create('O título já foi pago! Se desejar alterá-lo reabra-o '+
                           'utilizando a rotina de reabrir títulos encerrados!')
  else If (Titulo_receber1.Situacao = 8)then
    raise Exception.Create('O título já é de uma renegociação!!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3750)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Renegociar Títulos!');

  Application.CreateForm(TfMxReneg, fMxReneg);
  with fMxReneg do
  Begin
    Tag:=2;
    showmodal;
  end;
  Titulo_receber1.Close;
  Titulo_receber1.Open;
end;

procedure TfMxSRecPed.SB_PagarClick(Sender: TObject);
var
  vCredito: Double;
begin
  If Titulo_receber1.IsEmpty then
    raise Exception.Create('Não existem títulos a serem pagos!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(2190)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Receber Pagamento de Cliente!');

  if (DM.Configuracao1.Empresa = empMotical) then       
  Begin
    if (not DM.Configuracao1.CPD) and            //Loja
       ((Titulo_receber1.TipoPag = 412) or       //Boleto Bancário
        (Titulo_receber1.TipoPag = 13)) and      //Cartão
        ((Trunc(Titulo_receber1.DataCadastro)<>Trunc(DM.Configuracao1.Data)) OR
         (Titulo_receber1.Verificado>=1)) then
      Raise exception.Create('Somente no CPD (Boleto/Cartão)!')
    else if (DM.Configuracao1.CPD) and           //CPD
            (Titulo_receber1.TipoPag <> 412) and //Dif. Boleto Bancário
            (Titulo_receber1.TipoPag <> 13) then //Dif. Cartão
      Raise exception.Create('Somente na Loja (Diferente de Boleto/Cartão)!');
    if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
      Raise exception.Create('Título de outro Centro de Custo!');
    if (Titulo_receber1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) and
       (not DM.Configuracao1.CPD) then
      Raise exception.Create('Título de outro Centro de Custo!');
  end
  else if (DM.Configuracao1.Empresa <> empLBM) then
  Begin
    if (Titulo_receber1.CNCOrigem <> DM.Configuracao1.CodigoCNC) or
       (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
      Raise exception.Create('Título de outro Centro de Custo!');
  end;

  if self.Titulo_receber1.TipoPedido <> 2 then //Pacote de Crédito
    vCredito := Cliente1.Credito
  else
    vCredito := 0;

  with DM.Conta_de_Caixa1 do
  Begin
    if (not Active) or
       (CodigoCCX <> Titulo_receber1.CodigoCCX) then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Titulo_receber1.CodigoCCX;
      Open;
    end;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    if self.Titulo_receber1.DataOriginal > 0 then
      SQL.Text := 'SELECT TRC_CODIGO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE ( NOT (CNC_CODIGO='+IntToStr(self.Titulo_receber1.CodigoCNC)+
        '          AND TRC_CODIGO='+IntToStr(self.Titulo_receber1.CodigoTRC)+')) '+
        ' AND CNC_CLIENTE='+IntToStr(self.Titulo_receber1.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(self.Titulo_receber1.CodigoCLI)+
        ' AND PDV_CODIGO='+IntToStr(self.Titulo_receber1.CodigoPDV)+
        ' AND (TRC_SITUACAO<2 OR TRC_SITUACAO=8) '+
        ' AND TRC_VENCIMENTO<"'+MesDia(self.Titulo_receber1.DataOriginal)+'" '
    else
      SQL.Text := 'SELECT TRC_CODIGO '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE ( NOT (CNC_CODIGO='+IntToStr(self.Titulo_receber1.CodigoCNC)+
        '          AND TRC_CODIGO='+IntToStr(self.Titulo_receber1.CodigoTRC)+')) '+
        ' AND CNC_CLIENTE='+IntToStr(self.Titulo_receber1.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(self.Titulo_receber1.CodigoCLI)+
        ' AND PDV_CODIGO='+IntToStr(self.Titulo_receber1.CodigoPDV)+
        ' AND (TRC_SITUACAO<2 OR TRC_SITUACAO=8) '+
        ' AND TRC_VENCIMENTO<"'+MesDia(self.Titulo_receber1.Vencimento)+'" ';
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
          Tag:=44;
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


  If (Titulo_receber1.Situacao>=2) and (Titulo_receber1.Situacao<>8) then
    Raise exception.Create('O título já foi pago! Se desejar alterá-lo reabra-o '+
                'utilizando a rotina de reabrir títulos encerrados!');

  Application.CreateForm(TfMxSRecPParc, fMxSRecPParc);
  fMxSRecPParc.Tag:=0;
  fMxSRecPParc.CodCNCTitulo := self.Titulo_receber1.CodigoCNC;
  fMxSRecPParc.edtCodigoTRC.Text := IntToStr(self.Titulo_receber1.CodigoTRC);
  fMxSRecPParc.edtNumeroDocumento.Text := self.Titulo_receber1.Numero;
  fMxSRecPParc.edtSequencia.Text := self.Titulo_receber1.Sequencia;
  fMxSRecPParc.edtValorDocumento.Text := Format('%.2f', [self.Titulo_receber1.Valor]);
  fMxSRecPParc.edtCredito.Text := Format('%.2f', [vCredito]);
  fMxSRecPParc.vCreditoAnterior := vCredito;
  fMxSRecPParc.dblTipoPagamentoEfetuado.KeyValue := self.Titulo_receber1.TipoPag;
  fMxSRecPParc.mskDataPag.Text := DateTimeToStr(DM.Configuracao1.Data);
  //calcular os juros, se tiver em atraso
  If self.Titulo_receber1.Vencimento >= DM.Configuracao1.Data then
    fMxSRecPParc.edtJuros.Text:='0'
  Else
  Begin
    fMxSRecPParc.iDiasAtraso := (Trunc(DM.Configuracao1.Data)-Trunc(self.Titulo_receber1.Vencimento));
    if (DM.Configuracao1.Empresa = empLBM) and
       (DM.Conta_de_Caixa1.Grupo = 452) then //CONDOMINIO
    Begin
      //1% ao mês + 10% multa
      fMxSRecPParc.edtJuros.Text:=Format('%.2f', [self.Titulo_receber1.Valor*(1*(DM.Configuracao1.Data-self.Titulo_receber1.Vencimento)/3000)+
        (self.Titulo_receber1.Valor*0.1)]);
    end
    else
    Begin
      if ((self.Titulo_receber1.Vencimento+DM.Configuracao1.QuantDiasSemJuros < DM.Configuracao1.Data) or
          (self.Titulo_receber1.TipoPag = 412) or
          (DM.Configuracao1.Empresa in [empEletro, empLBM])) and
         (self.Titulo_receber1.TipoPag <> 13) then
        fMxSRecPParc.edtJuros.Text:=Format('%.2f', [self.Titulo_receber1.Valor*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-self.Titulo_receber1.Vencimento)/3000)])
      else
        fMxSRecPParc.edtJuros.Text:='0';
    end;
  end;

  If self.Titulo_receber1.Valor+StrToFloat(fMxSRecPParc.edtJuros.Text) <= vCredito then
  Begin
    fMxSRecPParc.edtValorPago.Text:='0';
    fMxSRecPParc.edtValorTotal.Text:='0'
  End
  Else
  Begin
    fMxSRecPParc.edtValorPago.Text:=Format('%.2f', [self.Titulo_receber1.Valor+StrToFloat(fMxSRecPParc.edtJuros.Text) - vCredito]);
    fMxSRecPParc.edtValorTotal.Text:=Format('%.2f', [self.Titulo_receber1.Valor+StrToFloat(fMxSRecPParc.edtJuros.Text) - vCredito]);
  End;
  fMxSRecPParc.mskVencimento.Text := DateToStr(self.Titulo_receber1.Vencimento);
  fMxSRecPParc.dblTipoPagamentoAgendado.KeyValue := self.Titulo_receber1.TipoPag;
  fMxSRecPParc.dblContaDeCaixaAgendada.KeyValue  := self.Titulo_receber1.CodigoCCX;

  //Anderson
  if self.Titulo_receber1.CodigoCCXRecebimento>0 then
    fMxSRecPParc.dblContaDeCaixaRecebida.KeyValue := self.Titulo_receber1.CodigoCCXRecebimento
  else
    fMxSRecPParc.dblContaDeCaixaRecebida.KeyValue := self.Titulo_receber1.CodigoCCX;
  //
  fMxSRecPParc.dblCodigoAGF.KeyValue := self.Titulo_receber1.CodigoAGF;
  //
  if (self.Titulo_receber1.TipoPag = 13) and
     ((DM.Configuracao1.Empresa <> 1) or
     (self.Parametro1.Mafalda = 1)) then
  Begin
    with DM.AgenteFin1 DO
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger := self.Titulo_receber1.CodigoAGF;
      Open;
      fMxSRecPParc.edtDesconto.Text := format('%.2f',[StrToFloat(fMxSRecPParc.edtValorDocumento.Text)*Juros/100]);
    end;
  end;
  fMxSRecPParc.ShowModal;
end;

procedure TfMxSRecPed.SB_ObservacaoCLIClick(Sender: TObject);
begin
  Application.CreateForm(TFmxCliObs, FmxCliObs);
  with fmxCliObs do
  Begin
    tag:=0;
    memObservacao.Lines.Text := self.Cliente1.OBS;
    ShowModal;
  end;
end;

procedure TfMxSRecPed.Titulo_receber1CalcFields(DataSet: TDataSet);
begin
  if Titulo_receber1.TipoPag > 0 then
  Begin
    Parametro1.Close;
    Parametro1.ParamByName('PAR_CODIGO').asInteger:=Titulo_receber1.TipoPag;
    Parametro1.Open;
    Titulo_receber1.FieldByName('TipoPag').asString := Parametro1.Descricao;
  end;
  if Titulo_receber1.Verificado >= 1 then
    Titulo_receber1.FieldByName('Verificado').asString := 'S'+PreencheZero(2,Titulo_receber1.Verificado)
  else
    Titulo_receber1.FieldByName('Verificado').asString := 'NÃO';
end;

procedure TfMxSRecPed.imgClienteDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgCliente.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Nome Fantasia/Apelido: '+Cliente1.NomeFantasia);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Endereço: '+Cliente1.Endereco+' - '+
    Cliente1.Bairro+' - '+Cliente1.Cidade+'/'+Cliente1.Uf);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Cliente1.OBS);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxSRecPed.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else if key=chr(13) then
    SB_PagarClick(sender);
end;

procedure TfMxSRecPed.SB_ObservacaoTRCClick(Sender: TObject);
begin
  if Titulo_receber1.IsEmpty then
    Raise Exception.Create('Nenhum título para ser alterado!');
  Application.CreateForm(TFmxCliObs, FmxCliObs);
  with fmxCliObs do
  Begin
    Tag:=1;
    memObservacao.Lines.Text := self.Titulo_receber1.OBS;
    ShowModal;
  end;
end;

procedure TfMxSRecPed.FormCreate(Sender: TObject);
begin
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_SREC_PED_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxSRecPed.SpeedButton1Click(Sender: TObject);
begin
  if Titulo_receber1.IsEmpty then
    Raise Exception.Create('Selecione um título!');
  Application.CreateForm(TfMxCheque,fMxCheque);
  with fMxCheque do
  Begin
    tag:=6;
    cmbTipo.ItemIndex:=1;
    Entidade.SQL.Text:='SELECT C1.* FROM CHEQUE C1 '+
      ' WHERE C1.CHQ_CNC_TITULO='+IntToStr(self.Titulo_receber1.CodigoCNC)+
      ' AND C1.CHQ_COD_TITULO='+IntToStr(self.Titulo_receber1.CodigoTRC)+
      ' AND C1.CHQ_ER="R" ';
    Entidade.Open;
    if fMxCheque.Entidade.IsEmpty then
    Begin
      SB_NovoCabClick(fMxCheque.SB_NovoCab);
      edtTituloCNC.Text   := IntToStr(self.Titulo_receber1.CodigoCNC);
      edtTitulo.Text      := IntToStr(self.Titulo_receber1.CodigoTRC);
      edtValor.Text       := Format('%.2f',[self.Titulo_receber1.Valor]);
      edtClienteCNC.Text  := IntToStr(self.Titulo_receber1.ClienteCNC);
      edtCodigoCLI.Text   := IntToStr(self.Titulo_receber1.CodigoCLI);
      edtDonoCheque.Text  := self.edtRazaoSocial.Text;
      mskCPF_CNPJ.Text    := self.mskCNPJ_CPF.Text;
    end;
    ShowModal;
  end;
end;

procedure TfMxSRecPed.FormActivate(Sender: TObject);
begin
  if Titulo_receber1.Active then
     Titulo_receber1.First;
  if (DM.Configuracao1.Empresa = empLuciano) and (Tag=12) then
    SB_PagarClick(Sender);
end;

end.

