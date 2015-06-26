unit MxSRecParcela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Db, DBTables,
  SQuery, Parametro, Movimento_caixa, Cliente, Autenticacao, MMSystem,
  Conta_de_Caixa,Variants, {ImpFiscB, }AgenteFin, Informacoes, Funcionario,
  ComCtrls;

type
  TfMxSRecPParc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bitAutenticar: TBitBtn;
    Label1: TLabel;
    edtCodigoTRC: TEdit;
    mskVencimento: TMaskEdit;
    Label4: TLabel;
    bitRecibo: TBitBtn;
    edtNumeroDocumento: TEdit;
    Label7: TLabel;
    Label10: TLabel;
    memObservacao: TMemo;
    Label12: TLabel;
    Panel3: TPanel;
    Label13: TLabel;
    dblTipoPagamentoEfetuado: TDBLookupComboBox;
    Label14: TLabel;
    Label15: TLabel;
    edtValorDocumento: TEdit;
    edtJuros: TEdit;
    Label16: TLabel;
    edtValorPago: TEdit;
    Label17: TLabel;
    edtDesconto: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    bitPagar: TBitBtn;
    dblTipoPagamentoAgendado: TDBLookupComboBox;
    Parametro1: TParametro;
    Parametro2: TParametro;
    DSParametro1: TDataSource;
    DSParametro2: TDataSource;
    bitFechar: TBitBtn;
    edtCredito: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Autenticacao1: TAutenticacao;
    bitPagarParcial: TBitBtn;
    edtValorTotal: TEdit;
    Label11: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtSequencia: TEdit;
    ckbGerarMovimento: TCheckBox;
    dblContaDeCaixaAgendada: TDBLookupComboBox;
    Label20: TLabel;
    dblContaDeCaixaRecebida: TDBLookupComboBox;
    Label21: TLabel;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    Conta_de_Caixa2: TConta_de_Caixa;
    DSConta_de_Caixa2: TDataSource;
    mskDataPag: TMaskEdit;
    AgenteFin1: TAgenteFin;
    dblCodigoAGF: TDBLookupComboBox;
    Label22: TLabel;
    DSAgenteFin1: TDataSource;
    Label23: TLabel;
    edtCodigoCHQ: TEdit;
    edtChequeCNC: TEdit;
    Label24: TLabel;
    edtCodigoMCC: TEdit;
    edtMovimentoContaCorrenteCNC: TEdit;
    edtCodigoTRCAnterior: TEdit;
    Informacoes1: TInformacoes;
    Label25: TLabel;
    dblCodigoFUN: TDBLookupComboBox;
    DSFuncionario1: TDataSource;
    Funcionario1: TFuncionario;
    PrintDialog1: TPrintDialog;
    Editor: TRichEdit;
    cbxUSB: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitPagarClick(Sender: TObject);
    procedure bitFecharClick(Sender: TObject);
    procedure bitAutenticarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitPagarParcialClick(Sender: TObject);
    procedure bitReciboClick(Sender: TObject);
    procedure dblTipoPagamentoEfetuadoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure mskDataPagChange(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Label16DblClick(Sender: TObject);
    procedure Funcionario1BeforeOpen(DataSet: TDataSet);
    procedure Label5Click(Sender: TObject);
  private
    TipoPagamentoOriginal:integer;
  public
    Cancelar, PagParc, ProgMvc :boolean;
    CodTitulo, CodCNCTitulo, CdCNCOrigem, iDiasAtraso:Integer;
    vCreditoAnterior, vValorJuros: Double;
  end;

var
  fMxSRecPParc: TfMxSRecPParc;
  Codigo_RGB:Integer;

implementation
Uses
  MxSRecPedido, UDM, MxSPediDesc, DigSenha, funcoes, URecibo, MxCheque,
  MxReceber, MxRecebPedido, Titulo_receber, Configuracao,
  MxMovimentoContaCorrente;

{$R *.DFM}

procedure TfMxSRecPParc.FormCreate(Sender: TObject);
begin
  Parametro1.Open;
  Parametro2.Open;
  Conta_de_Caixa1.Open;
  Conta_de_Caixa2.Open;
  AgenteFin1.Open;
  iDiasAtraso := 0;
  vCreditoAnterior := 0;
  vValorJuros := 0;
  edtChequeCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);
  edtCodigoCHQ.Text := '0';
  edtMovimentoContaCorrenteCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);
  edtCodigoMCC.Text := '0';
  edtCodigoTRCAnterior.Text := '0';

  //TODO (Verificar quais centros de custos usa USB)
  //cbxUSB.Checked := (DM.Configuracao1.CodigoCNC in [1,2]);
end;

procedure TfMxSRecPParc.edtDescontoChange(Sender: TObject);
begin
  If Trim(edtDesconto.Text)<>'' then
  Begin
    If not VerificaFloatBranco(edtDesconto.Text) then
    Begin
      ShowMessage('Valor do desconto inválido!');
      edtDesconto.Text := '0,00';
      edtDescontoChange(sender);
      Exit;
    end
    else if StrToFloat(edtDesconto.Text) < 0 then
    Begin
      ShowMessage('Valor do desconto inválido!');
      edtDesconto.Text := '0,00';
      edtDescontoChange(sender);
      Exit;
    end;
    if Arredonda(StrTofloat(edtCredito.Text)) <= Arredonda((StrToFloat(edtValorDocumento.Text)+StrToFloat(edtJuros.Text))) then
      edtValorTotal.Text := Format('%.2f', [StrToFloat(edtValorDocumento.Text)+StrToFloat(edtJuros.Text)-StrToFloat(edtDesconto.Text)-StrToFloat(edtCredito.Text)])
    else
      edtValorTotal.Text:='0,00';
    edtValorPago.Text:=edtValorTotal.Text;
  End
  Else
  Begin
    if Arredonda(StrTofloat(edtCredito.Text)) <= Arredonda((StrToFloat(edtValorDocumento.Text)+StrToFloat(edtJuros.Text))) then
      edtValorTotal.Text := Format('%.2f', [StrToFloat(edtValorDocumento.Text)+StrToFloat(edtJuros.Text)-StrToFloat(edtCredito.Text)])
    else
      edtValorTotal.Text := '0,00';
    edtValorPago.Text := edtValorTotal.Text;
  End;
end;

procedure TfMxSRecPParc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfMxSRecPParc.bitPagarClick(Sender: TObject);
Var
  CreditoUtiliz, vDesconto, cDescCartao,vValorCheque,vDifSuperior,vLibNormal,vLibEspecial:Double;
  Trans, vAlterarCreditoUtilizado, vVerif:Boolean;
  Aux:TNotifyEvent;
  CdCNC,CdPDV,CdTRC,TRCOrigem,Sit, CdCLI, CdCNCCLI, CaixaCNC, CdAGF, CdCCX,
    iTipoDoc, iSit, CdCHQCNCi, CdCHQi, CdMCCCNCi, CdMCCi, iOPS, iTipoPedido, CdFUN :Integer;
  DTOrigem, vDtCheque, vDtChequePre, vDtCad:TDateTime;
  CreditoCli, sNumero, sSeq, sSemMov, sPagParcial, sFlag:string;
  vDtVerificado,vVencimento, vVencimentoFuturo: TDateTime;
begin
  if not VerificaInteiroBranco(edtCodigoCHQ.Text) then
    edtCodigoCHQ.Text := '0';

  if not VerificaInteiroBranco(edtCodigoMCC.Text) then
    edtCodigoMCC.Text := '0';

  vLibNormal   := Arredonda(DM.Configuracao1.JurosNormPag);
  vLibEspecial := Arredonda(DM.Configuracao1.JurosEspPag);

  vAlterarCreditoUtilizado := False;
  CdCHQCNCi := 0;
  CdCHQi := 0;
  vDifSuperior := 0;
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  If not VerificaFloatBranco(edtCredito.Text) Then
    edtCredito.Text:='0';
  If not VerificaFloatBranco(edtJuros.Text) Then
    edtJuros.Text:='0,00';
  If not VerificaFloatBranco(edtDesconto.Text) Then
  Begin
    Aux := edtDesconto.OnChange;
    edtDesconto.OnChange := nil;
    edtDesconto.Text := '0,00';
    edtDesconto.OnChange := Aux;
  End;

  if dblContaDeCaixaAgendada.Text = '' then
    Raise Exception.Create('Conta de Caixa agendada inválida!');
  if dblContaDeCaixaRecebida.Text = '' then
    Raise Exception.Create('Selecione a Conta de Recebimento!');
  if dblTipoPagamentoAgendado.Text = '' then
    Raise Exception.Create('Problema com o Tipo de Pagamento!');
  if dblTipoPagamentoEfetuado.Text = '' then
    Raise Exception.Create('Selecione o Tipo de Pagamento Efetuado!');
  if (not VerificaFloatBranco(edtDesconto.Text)) then
    Raise Exception.Create('Desconto inválido!');
  if not VerificaFloatBranco(edtValorPago.Text) then
    Raise Exception.Create('Valor Pago inválido!');
  if StrToFloat(edtValorPago.Text) < 0 then
    Raise Exception.Create('Valor Pago inválido!');

  if not VerificaDataBranco(mskDataPag.Text) then
    Raise Exception.Create('Data de Pagamento inválida!');
  if (ABS(StrToDate(mskDataPag.Text) - (DM.Configuracao1.Data)) > 5) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(6060)) < 0) then
    Raise Exception.Create('Usário não tem permissão para alterar Data Pagamento >5!')
  else if (ABS(StrToDate(mskDataPag.Text) - (DM.Configuracao1.Data)) > 0) and
          (DM.Usuario1.Permissoes.IndexOf(IntToStr(6050)) < 0) then
    Raise Exception.Create('Usário não tem permissão para alterar Data Pagamento!');

  if dblCodigoFUN.Text = '' then
    CdFUN := 0
  else
    CdFUN := dblCodigoFUN.KeyValue;

  if self.tag = 0 then      //Recebimento de Cliente
  Begin
    CdCNC    := fMxSRecPed.Titulo_receber1.CodigoCNC;
    CdPDV    := fMxSRecPed.Titulo_receber1.CodigoPDV;
    CdTRC    := fMxSRecPed.Titulo_receber1.CodigoTRC;
    CdCNCCLI := fMxSRecPed.Titulo_receber1.ClienteCNC;
    CdCLI    := fMxSRecPed.Titulo_receber1.CodigoCLI;
    CdAGF    := fMxSRecPed.Titulo_receber1.CodigoAGF;
    if (DM.Configuracao1.Empresa = empLBM) and
       (fMxSRecPed.Titulo_receber1.CodigoCCX <> 129) then //Venda Futura
      CdCCX := dblContaDeCaixaRecebida.KeyValue
    else
      CdCCX    := fMxSRecPed.Titulo_receber1.CodigoCCX;
    iTipoDoc := fMxSRecPed.Titulo_receber1.Tipo;
    sNumero  := fMxSRecPed.Titulo_receber1.Numero;
    sSeq     := fMxSRecPed.Titulo_receber1.Sequencia;
    iSit     := fMxSRecPed.Titulo_receber1.Situacao;
    vDtCad   := fMxSRecPed.Titulo_receber1.DataCadastro;
    if fMxSRecPed.Titulo_receber1.Verificado >= 1 then
      vVerif   := True
    else
      vVerif   := False;
    vVencimento   := fMxSRecPed.Titulo_receber1.Vencimento;
    vDtVerificado := fMxSRecPed.Titulo_receber1.DataVerificado;
    iTipoPedido   := fMxSRecPed.Titulo_receber1.TipoPedido;
    if fMxSRecPed.Titulo_receber1.TituloORI > 0 then
    Begin
      TRCOrigem:=fMxSRecPed.Titulo_receber1.TituloORI;
      DTOrigem :=fMxSRecPed.Titulo_receber1.VencimentoORI;
    end
    else
    Begin
      TRCOrigem:=fMxSRecPed.Titulo_receber1.CodigoTRC;
      DTOrigem :=fMxSRecPed.Titulo_receber1.Vencimento;
    end;
  end
  else if self.tag = 2 then //Receber
  Begin
    CdCNC    := fMxReceber.Titulo_receber1.CodigoCNC;
    CdPDV    := fMxReceber.Titulo_receber1.CodigoPDV;
    CdTRC    := fMxReceber.Titulo_receber1.CodigoTRC;
    CdCNCCLI := fMxReceber.Titulo_receber1.ClienteCNC;
    CdCLI    := fMxReceber.Titulo_receber1.CodigoCLI;
    CdAGF    := fMxReceber.Titulo_receber1.CodigoAGF;
    if (DM.Configuracao1.Empresa = empLBM) and
       (fMxReceber.Titulo_receber1.CodigoCCX <> 129) then //Fenda Futura
      CdCCX := dblContaDeCaixaRecebida.KeyValue
    else
      CdCCX    := fMxReceber.Titulo_receber1.CodigoCCX;
    iTipoDoc := fMxReceber.Titulo_receber1.Tipo;
    sNumero  := fMxReceber.Titulo_receber1.Numero;
    sSeq     := fMxReceber.Titulo_receber1.Sequencia;
    iSit     := fMxReceber.Titulo_receber1.Situacao;
    vDtCad   := fMxReceber.Titulo_receber1.DataCadastro;
    if fMxReceber.Titulo_receber1.Verificado >= 1 then
      vVerif   := True
    else
      vVerif   := False;    
    vVencimento := fMxReceber.Titulo_receber1.Vencimento;
    vDtVerificado := fMxReceber.Titulo_receber1.DataVerificado;
    iTipoPedido   := fMxReceber.Titulo_receber1.TipoPedido;
    if fMxReceber.Titulo_receber1.TituloORI > 0 then
    Begin
      TRCOrigem:=fMxReceber.Titulo_receber1.TituloORI;
      DTOrigem :=fMxReceber.Titulo_receber1.VencimentoORI;
    end
    else
    Begin
      TRCOrigem:=fMxReceber.Titulo_receber1.CodigoTRC;
      DTOrigem :=fMxReceber.Titulo_receber1.Vencimento;
    end;
  end
  else
    Raise exception.Create('Procedimento não esperado!');

  //Se for Boleto que não é de hoje ou que já tenha sido verificado não pode ser pago na filial
  if (DM.Configuracao1.Empresa = empMotical) and
     (DM.Configuracao1.CodigoCNC <> 1) and //Diferente de CPD
     ((dblTipoPagamentoAgendado.KeyValue=13) or
      (dblTipoPagamentoAgendado.KeyValue=412)) and //Cartão ou Boleto
     ((Trunc(vDtCad)<>Trunc(DM.Configuracao1.Data)) OR
      (vVerif)) then
    Raise exception.Create('Não é permitido receber Cartão ou Boleto na Filial!');

  if dblTipoPagamentoEfetuado.KeyValue <> TipoPagamentoOriginal then
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(4690)) < 0 then
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
          if usuario1.Permissoes.IndexOf(IntToStr(4690)) < 0 then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para alterar Tipo de Pagamento!');
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
  vDtCheque := 0;
  vDtChequePre := 0; //Será preenchida somente se for pre-datado
  if not DM.Configuracao1.IgnorarCheques then
  Begin
    //Verificação de Cheque
    if dblTipoPagamentoEfetuado.KeyValue = 6 then //Cheque
    Begin
      if not VerificaInteiroBranco(edtCodigoCHQ.Text) then
        Raise exception.Create('Código do Cheque inválido!')
      else
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT * FROM CHEQUE '+
            ' WHERE CNC_CODIGO='+edtChequeCNC.Text+
            ' AND CHQ_CODIGO='+edtCodigoCHQ.Text+
            ' AND CHQ_SITUACAO<>6 '+ //Cancelado
            ' AND CHQ_ER="R" ';
          Open;
          if isEmpty then
            Raise exception.Create('Cheque não cadastrado!')
          else
          Begin
            CdCHQi        := FieldByName('CHQ_CODIGO').asInteger;
            CdCHQCNCi     := FieldByName('CNC_CODIGO').asInteger;
            vDtCheque     := FieldByName('CHQ_DATA').asDateTime;
            vValorCheque  := Arredonda(FieldByName('CHQ_VALOR').asFloat);
            if vDtCheque > DM.Configuracao1.Data then
              vDtChequePre := vDtCheque;
          end;
          vValorCheque := CalculaSaldoCheque(DM.QR_Consultas, CdCHQCNCi, CdCHQi);
          if Arredonda(StrToFloat(edtValorPago.Text)) > Arredonda(vValorCheque) then
            Raise exception.Create('Valor a ser pago superior ao disponível pelo cheque!');
        end;
      end;
    end
    else //Verificar se tem cheque cadastrado para esse título e não vai ser usado
    Begin
      With DM.QR_Consultas do
      Begin
        Close;
        SQL.Text:='SELECT TOP 1 CHQ_CODIGO '+
          ' FROM CHEQUE '+
          ' WHERE CHQ_CNC_TITULO='+IntToStr(CdCNC)+
          ' AND CHQ_COD_TITULO='+IntToStr(CdTRC)+
          ' AND CHQ_SITUACAO<>6 '+ //Cancelado
          ' AND CHQ_ER="R" ';
        Open;
        If not isEmpty then
        Begin
          If MessageDlg('Atenção !!!'+#13+'O tipo de pagamento não está selecionado para '+
                        'cheque, mas existe um cheque cadastrado.'+#13+' Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
        end;
      End;
    end;
  end;

  if not DM.Configuracao1.IgnorarDepositos then
  Begin
    //Verificação de Movimento de Conta Corrente de Depósito
    if dblTipoPagamentoEfetuado.KeyValue = 416 then //Depósito em Conta
    Begin
      if not VerificaInteiroBranco(edtCodigoMCC.Text) then
        Raise exception.Create('Código do Movimento inválido!')
      else
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT * FROM MOVIMENTO_CONTA_CORRENTE '+
            ' WHERE CNC_CODIGO='+edtMovimentoContaCorrenteCNC.Text+
            ' AND MCC_CODIGO='+edtCodigoMCC.Text+
            ' AND MCC_SITUACAO<>1 '+ //Cancelado
            ' AND MCC_DC="C" ';
          Open;
          if isEmpty then
            Raise exception.Create('Depósito não cadastrado!')
          else
          Begin
            CdMCCi        := FieldByName('MCC_CODIGO').asInteger;
            CdMCCCNCi     := FieldByName('CNC_CODIGO').asInteger;
          end;
          if Arredonda(StrToFloat(edtValorPago.Text)) > Arredonda(FieldByName('MCC_SALDO_MOVIMENTO').asFloat) then
            Raise exception.Create('Valor a ser pago superior ao saldo do depósito!');
        end;
      end;
    end;
  end;

  cDescCartao := 0.0;
  if not PagParc then
  Begin
    if (StrToFloat(edtValorDocumento.Text)+StrToFloat(edtJuros.Text)-StrToFloat(edtCredito.Text)) = 0 then
      vDesconto := 0
    else
      vDesconto := Arredonda(StrToFloat(edtDesconto.Text)/
                   (StrToFloat(edtValorDocumento.Text)+StrToFloat(edtJuros.Text)-StrToFloat(edtCredito.Text))*100);

    //Cálculo do Juros do Cartão para ser dispensado
    with DM.AgenteFin1 do
    Begin
      if dblTipoPagamentoEfetuado.KeyValue = 13 then
      Begin
        if CodigoAGF <> dblCodigoAGF.KeyValue then
        Begin
          Close;
          ParamByName('AGF_CODIGO').asInteger := dblCodigoAGF.KeyValue;
          Open;
        end;
        cDescCartao := StrToFloat(edtValorDocumento.Text)*Juros/100;
        if (DM.Configuracao1.Empresa = empLBM) and
           (cDescCartao > 0) then
          cDescCartao := cDescCartao + 1; //Aceitar Desconto de até 1,00 Real LBM
      end;
    end;
  end
  else //Pagamento Parcial
    vDesconto := StrToFloat(edtDesconto.Text);


  if (iDiasAtraso<=DM.Configuracao1.QuantDiasSemJuros) and
     (edtCodigoTRCAnterior.Text = '0') and //Se tiver sido feito pagamento parcial não dispensar juros
                                           //Evitar que o cliente pague todo dia R$ 0,01
     ((StrToFloat(edtDesconto.Text)<=StrToFloat(edtJuros.Text)) or
     (StrToFloat(edtDesconto.Text)<=Arredonda(cDescCartao))) then
  Begin
     //Aceitar o desconto (sem necessidade de permissão)
  end
  else if (DM.Usuario1.Permissoes.IndexOf(IntToStr(8410)) > 0) and
          (StrToFloat(edtDesconto.Text)<=StrToFloat(edtJuros.Text)) then
  Begin
    DM.Usuario1.GeraLog(8410, CdCNC, CdTRC, 'JUROS R$ '+edtJuros.Text+' DESCONTO R$ '+edtDesconto.Text);
  end
  else
  Begin
    If (vDesconto>vLibEspecial) and
       (vDesconto>cDescCartao) then
    Begin
      // // //
      //para Heliene continua como está
      if DM.Configuracao1.Empresa <> empLuciano then
      begin
        If MessageDlg('Atenção !!!'+#13+
                      'Desconto atribuído! (Total) '+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0) then //Desconto Total Recebimento
        //Verifica se o usuário tem permissão para liberar o desconto acima do máximo
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            DigCdPDVCNC := CdCNC;
            DigCdPDV    := CdPDV;
            DigCdCLICNC := CdCNCCLI;
            DigCdCLI    := CdCLI;
            DigCdTRC    := CdTRC;
            DigvValorTRC:= StrToFloat(edtValorPago.Text);
            DigiTipoPendencia := 4; //Desconto Título
            onClose:=nil;
            Tag:=10;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto (Total)!');
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
                DM.Usuario1.GeraLog(7430, CdCNC, CdTRC,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' RECEBIMENTO TRC-DESCONTO SUPERIOR AO ESPECIAL');
              end;
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
          DM.Usuario1.GeraLog(7430, CdCNC, CdTRC,
            'RECEBIMENTO TRC-DESCONTO SUPERIOR AO ESPECIAL');
      end
      else
      begin //Luciano
        //entendendo melhor para poder fazer
        //caso seja cartao de credito nao deve aparecer a mensagem abaixo
        //somente quando o desconto for maior do que 4% MASTERCARD e 5% VISA
        //essa informação esta no cadastro de agente financeiro no campo (juros)
        if dblTipoPagamentoEfetuado.KeyValue = 13 then //cartao de crédito, aqui foi feito alterações
        begin

          if strtofloat(edtDesconto.text) > ( (strtofloat(edtValorDocumento.Text)) * (DM.AgenteFin1.Fieldbyname('AGF_JUROS').AsFloat/100) ) then
          begin

            If MessageDlg('Atenção !!!'+#13+
                          'Desconto atribuído! (Total) '+#13+
                          'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              Exit;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0) then //Desconto Total Recebimento
            //Verifica se o usuário tem permissão para liberar o desconto acima do máximo
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                DigCdPDVCNC := CdCNC;
                DigCdPDV    := CdPDV;
                DigCdCLICNC := CdCNCCLI;
                DigCdCLI    := CdCLI;
                DigCdTRC    := CdTRC;
                DigvValorTRC:= StrToFloat(edtValorPago.Text);
                DigiTipoPendencia := 4; //Desconto Título
                onClose:=nil;
                Tag:=10;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                begin
                  if (Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0)then
                  begin
                    free;
                    raise Exception.Create('O usuário não tem permissão para liberar o desconto (Total)!');
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
                    DM.Usuario1.GeraLog(7430, CdCNC, CdTRC,
                      'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                      ' RECEBIMENTO TRC-DESCONTO SUPERIOR AO ESPECIAL');
                  end;
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
              DM.Usuario1.GeraLog(7430, CdCNC, CdTRC,
                'RECEBIMENTO TRC-DESCONTO SUPERIOR AO ESPECIAL');
          end;
        end
        else //deixa como está caso nao seja cartao de credito
        begin
          If MessageDlg('Atenção !!!'+#13+
                        'Desconto atribuído! (Total) '+#13+
                        'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Exit;
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0) then //Desconto Total Recebimento
          //Verifica se o usuário tem permissão para liberar o desconto acima do máximo
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              DigCdPDVCNC := CdCNC;
              DigCdPDV    := CdPDV;
              DigCdCLICNC := CdCNCCLI;
              DigCdCLI    := CdCLI;
              DigCdTRC    := CdTRC;
              DigvValorTRC:= StrToFloat(edtValorPago.Text);
              DigiTipoPendencia := 4; //Desconto Título
              onClose:=nil;
              Tag:=10;
              Cancelar:=False;
              Showmodal;
              If not cancelar Then
              begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0)then
                begin
                  free;
                  raise Exception.Create('O usuário não tem permissão para liberar o desconto (Total)!');
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
                  DM.Usuario1.GeraLog(7430, CdCNC, CdTRC,
                    'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                    ' RECEBIMENTO TRC-DESCONTO SUPERIOR AO ESPECIAL');
                end;
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
            DM.Usuario1.GeraLog(7430, CdCNC, CdTRC,
              'RECEBIMENTO TRC-DESCONTO SUPERIOR AO ESPECIAL');
        end;
      end;
      // // // //
    end
    else If (vDesconto> vLibNormal) and
            (vDesconto<=vLibEspecial) and
            (vDesconto>cDescCartao) then
    Begin
      If MessageDlg('Atenção !!!'+#13+
                    'Desconto atribuído! (Especial) '+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
      //Verifica se o usuário que está logado não tem permissão para liberar o desconto
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(7420)) < 0) and //Desconto Especial Recebimento
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0) then //Desconto Total Recebimento
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          DigCdPDVCNC := CdCNC;
          DigCdPDV    := CdPDV;
          DigCdCLICNC := CdCNCCLI;
          DigCdCLI    := CdCLI;
          DigCdTRC    := CdTRC;
          DigvValorTRC:= StrToFloat(edtValorPago.Text);
          DigiTipoPendencia := 4; //Desconto Título
          onClose:=nil;
          Tag:=10;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          begin
            if (usuario1.Permissoes.IndexOf(IntToStr(7420)) < 0) and //Desconto Especial Recebimento
               (Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0)then //Desconto Total Recebimento
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para liberar o desconto (Especial)!');
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
              DM.Usuario1.GeraLog(7420, CdCNC, CdTRC,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' RECEBIMENTO TRC-DESCONTO ESPECIAL');
            end;
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
        DM.Usuario1.GeraLog(7420, CdCNC, CdTRC,
          'RECEBIMENTO TRC-DESCONTO ESPECIAL');
    End
    else If (vDesconto> 0) and
            (vDesconto<=vLibNormal) and
            (vDesconto>cDescCartao) then
    Begin
      If MessageDlg('Atenção !!!'+#13+
                    'Desconto atribuído! (Simples) '+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
      //Verifica se o usuário que está logado não tem permissão para liberar o desconto
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(7410)) < 0) and  //Desconto Normal Recebimento
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(7420)) < 0) and  //Desconto Especial Recebimento
         (DM.Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0) then //Desconto Total Recebimento
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          DigCdPDVCNC := CdCNC;
          DigCdPDV    := CdPDV;
          DigCdCLICNC := CdCNCCLI;
          DigCdCLI    := CdCLI;
          DigCdTRC    := CdTRC;
          DigvValorTRC:= StrToFloat(edtValorPago.Text);
          DigiTipoPendencia := 4; //Desconto Título
          onClose:=nil;
          Tag:=10;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          begin
            if (usuario1.Permissoes.IndexOf(IntToStr(7410)) < 0) and
               (usuario1.Permissoes.IndexOf(IntToStr(7420)) < 0) and
               (Usuario1.Permissoes.IndexOf(IntToStr(7430)) < 0)then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para liberar o desconto (Normal)!');
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
              DM.Usuario1.GeraLog(7410, CdCNC, CdTRC,
                'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                ' RECEBIMENTO TRC-DESCONTO NORMAL');
            end;
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
        DM.Usuario1.GeraLog(7410, CdCNC, CdTRC,
          'RECEBIMENTO TRC-DESCONTO NORMAL');
    End;
  end;

  sPagParcial := '';
  vVencimentoFuturo := DM.Configuracao1.Data; //Usado somente para gerar Título de Pag. Parcial
  if PagParc then
  Begin
    sPagParcial := '(PagParcial)';
    //gera outro título com o valor restante
    If Trunc(DM.Configuracao1.Data) < Trunc(vVencimento) then
      vVencimentoFuturo := vVencimento;

    If DM.Usuario1.Permissoes.IndexOf(IntToStr(2200)) < 0 then
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
          if usuario1.Permissoes.IndexOf(IntToStr(2200)) < 0 then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para pagamento Parcial cliente!');
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
  else //Pagamento Integral
  Begin
    if Arredonda(strtofloat(edtValorPago.Text)) < Arredonda(strtofloat(edtValorTotal.Text)) then
      raise exception.Create('Esse tipo de pagamento só é permitido se for parcial!');

    //Verifica se o usuário que está logado não tem permissão para pagar
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(2190)) < 0 then
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
          if usuario1.Permissoes.IndexOf(IntToStr(2190)) < 0 then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para pagar título!');
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

  //Atribuir à variável CreditoUtiliz o valor do crédito utilizado
  If Arredonda((StrTofloat(edtValorDocumento.Text)+StrTofloat(edtJuros.Text)-StrTofloat(edtDesconto.Text)))>=Arredonda(StrToFloat(edtCredito.Text)) Then
    CreditoUtiliz := StrToFloat(edtCredito.Text)
  Else
    CreditoUtiliz := (StrToFloat(edtValorDocumento.Text)+StrToFloat(edtJuros.Text)-StrTofloat(edtDesconto.Text));

  if CreditoUtiliz > 0 then
    CreditoCli:=' (Credito='+format('%.2f',[CreditoUtiliz])+')';

  //Anderson
  //antes (original)
  if (Arredonda(StrToFloat(edtValorPago.Text)) > Arredonda(StrToFloat(edtValorTotal.Text))) then
  Begin
    If MessageDlg('ATENÇÃO!!!'+#13+
                  'Deseja gerar crédito com a diferença?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      vDifSuperior := Arredonda(StrToFloat(edtValorPago.Text)) - Arredonda(StrToFloat(edtValorTotal.Text));
  end;
  //depois
  {if (Arredonda(StrToFloat(edtValorPago.Text)) > Arredonda(StrToFloat(edtValorTotal.Text))) then
  Begin
    if Application.MessageBox('Deseja gerar crédito com a diferença?','ATENÇÃO!!!',MB_ICONQUESTION+MB_YESNO)=id_yes then
      vDifSuperior := Arredonda(StrToFloat(edtCredito.Text)) + (Arredonda(StrToFloat(edtValorPago.Text)) - Arredonda(StrToFloat(edtValorTotal.Text)))
    else
      vDifSuperior := Arredonda(StrToFloat(edtCredito.Text));
  end;}
  // // // //

  DM.Caixa1.Close;
  DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
  DM.Caixa1.Open;

  Trans:=false;
  with DM.Database2 do
  Begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if PagParc then
      Begin
        if not DM.Titulo_receber1.Inserir(CdCNC,0,CdCLI, CdPDV,dblContaDeCaixaAgendada.KeyValue,
                 dblContaDeCaixaRecebida.KeyValue, dblTipoPagamentoAgendado.KeyValue,
                 DM.Configuracao1.TipoDocumento, 0(*TRF*), 0(*Reabertura*), vVencimentoFuturo,
                 0(*DtPag*),DTOrigem, vDtVerificado,
                 memObservacao.Text, sSeq+'.01',sNumero, ''(*CartaoCV*),
                 StrToFloat(edtValorTotal.Text)-StrToFloat(edtValorPago.Text),
                 0(*ValorPag*),0(*Credito*),dblCodigoAGF.KeyValue, CdCNCCLI,0(*Situacao*),
                 CdTRC,TRCOrigem, iTipoPedido, False(*Mov*), False(*CHQDev*)) then
        Begin
          ShowMessage('Falha ao gerar Título a receber');
          Raise Exception.Create('');
        end;
      end;

      //Baixar os Cheques
      if (dblTipoPagamentoEfetuado.KeyValue = 6) and //Cheque
         (not DM.Configuracao1.IgnorarCheques) then
      Begin
        //Gerar Movimento de Cheque
        if not DM.Movimento_de_Cheque1.Inserir(CdCNC, CdCHQCNCi, CdCHQi, CdCNC,
          CdTRC, 1060 (*Baixa Título*), StrToFloat(edtValorPago.Text)) then
        Begin
          ShowMessage('Falha ao gerar Movimento de Cheque!');
          Raise exception.Create('');
        end;

        //Mudar a Situacao do Cheque
        ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
          ' CHQ_UTILIZADO=1 '+
          ' WHERE (CHQ_UTILIZADO=0 OR CHQ_UTILIZADO IS NULL) '+
          ' AND CHQ_CODIGO='+IntToStr(CdCHQi)+
          ' AND CNC_CODIGO='+IntToStr(CdCHQCNCi));
      end;

      //A redução do Saldo do Movimento no Depósito Bancário ocorre no método PagarTítulo

      //Incluir o movimento de caixa
      If ckbGerarMovimento.Checked then
      Begin
        If pagParc then
          sFlag := 'P'
        else
          sFlag := 'T';

        if not DM.Movimento_caixa1.Inserir(CaixaCNC,0, CdCCX,
             dblContaDeCaixaRecebida.KeyValue, DM.Configuracao1.CodigoCAX,
             dblTipoPagamentoEfetuado.KeyValue,iTipoDoc,CdCNC,
             CdCHQCNCi, CdCHQi,
             'TRC:'+IntToStr(CdTRC)+CreditoCli,'1' (*Flag*),sNumero,''(*OBS*),
             sSeq,'C',StrToFloat(edtValorPago.Text),
             StrToFloat(edtDesconto.Text),StrToFloat(edtJuros.Text),
             CreditoUtiliz(*CredCli*),StrToFloat(edtValorDocumento.Text)(*ValorDoc*),
             DM.Configuracao1.DataHora,
             DM.Configuracao1.Data(*Competencia*),vDtChequePre,
             CdTRC,CdCNC(*TituloCNC*),sFlag) then
        Begin
          ShowMessage('Falha ao gerar Movimento de Caixa');
          Raise Exception.Create('');
        end
        else if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
          DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC, DM.Caixa1.CodigoFUN,
            1,0,'Movimento de Caixa','Rec. do Titulo: '+IntToStr(CdTRC)+#13+#10+
            'Valor: R$ '+edtValorPago.Text+' '+sFlag+'('+dblTipoPagamentoEfetuado.Text+')');
      End
      else //Não gerar Movimento de Caixa
      Begin
        sSemMov := 'S/Mov.Caixa';
        if not DM.Movimento_caixa1.Inserir(CaixaCNC,0, CdCCX,
             dblContaDeCaixaRecebida.KeyValue, DM.Configuracao1.CodigoCAX,
             dblTipoPagamentoEfetuado.KeyValue,iTipoDoc,CdCNC,
             CdCHQCNCi, CdCHQi,
             'TRC:'+IntToStr(CdTRC)+CreditoCli+' ('+format('%.2f',[StrToFloat(edtValorPago.Text)])+')',
             '1' (*Flag*),sNumero,''(*OBS*), sSeq,'C',0(*ValorPago*),
             0(*Desconto*),0(*Juros*),
             CreditoUtiliz(*CredCli*),StrToFloat(edtValorDocumento.Text)(*ValorDoc*),
             DM.Configuracao1.DataHora,
             DM.Configuracao1.Data(*Competencia*),vDtChequePre,
             CdTRC,CdCNC(*TituloCNC*),sFlag) then
        Begin
          ShowMessage('Falha ao gerar Movimento de Caixa');
          Raise Exception.Create('');
        end
      end;

      //Pagar o título
      Sit := 0;
      if iSit IN [0,8] then
        Sit:=2
      else if iSit = 1 then
        Sit:=3;

      //Baixar o Título
      if not DM.Titulo_receber1.PagarTitulo(CdCNC,CdTRC, CdFUN, StrToFloat(edtValorPago.Text),
             dblTipoPagamentoEfetuado.KeyValue,dblContaDeCaixaRecebida.KeyValue,
             Sit,CdCHQCNCi,CdCHQi,CdMCCCNCi,CdMCCi,StrToDate(mskDataPag.Text),
             vDtCheque,memObservacao.text,CreditoUtiliz,StrToFloat(edtDesconto.Text),
             StrToFloat(edtJuros.Text),ckbGerarMovimento.Checked, PagParc) then
        Raise Exception.Create('');

      //Registrar Baixar de Título na Motical (CPD)
      if (DM.Configuracao1.Empresa = empMotical) and
         (DM.Configuracao1.CodigoCNC=1) then
      Begin
        if not DM.Baixa_Titulo1.Inserir(CdCNC, CdTRC, cdAGF, CdCCX, dblContaDeCaixaRecebida.KeyValue,
            0(*Baixa*), iTipoDoc, dblTipoPagamentoEfetuado.KeyValue, 0(*Sit*),
            sSeq, sNumero, memObservacao.text, StrToDate(mskVencimento.Text),
            StrToDate(mskDataPag.Text),StrToFloat(edtValorDocumento.Text),
            StrToFloat(edtValorPago.Text),CreditoUtiliz,StrToFloat(edtDesconto.Text),
            StrToFloat(edtJuros.Text)) then
          Raise Exception.Create('');
      end;

      //Diminui o crédito utilizado do cliente
      with DM.qr_consultas2 do
      Begin
        Close;
        SQL.Text := 'SELECT PDV_TIPO_PAG,FPG_CODIGO '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PDV_CODIGO='+IntToStr(CdPDV);
        Open;
        if not IsEmpty then
          if (FieldByName('PDV_TIPO_PAG').asInteger <> 13) and  //Diferente de Cartão
             (FieldByName('FPG_CODIGO').asInteger <> 1) and //Diferente de à vista
             (CdCLI<>DM.Configuracao1.CodigoCliAVista) then
             vAlterarCreditoUtilizado := True
          else
             vAlterarCreditoUtilizado := False;
        Close;
      end;

      If ((CreditoUtiliz<>0) or
          (vDifSuperior>0)) and
         (CdCLI<>DM.Configuracao1.CodigoCliAVista) then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
          ' CLI_CREDITO=CLI_CREDITO-('+VirgPonto(CreditoUtiliz-vDifSuperior)+')'+
          ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CLI_CODIGO='+IntToStr(CdCLI)+
          ' AND CNC_CODIGO='+IntToStr(CdCNCCLI));
        if CreditoUtiliz > 0 then
        Begin
          if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
              CdCNCCLI,CdCLI,1003(*Tipo PAG.TRC*),CdCNC,CdTRC,CdCNC(*CdPDVCNC*),CdPDV(*CdPDV*),'D',
              vCreditoAnterior(*ValorAnt*),CreditoUtiliz(*Valor*)) then
          Begin
            ShowMessage('Falha ao Gerar Mov. de Crédito!');
            Raise Exception.Create('');
          end;
        end;
        if vDifSuperior > 0 then
        Begin
          if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
              CdCNCCLI,CdCLI,1001(*Tipo PAG.TRC*),CdCNC,CdTRC,CdCNC(*CdPDVCNC*),CdPDV(*CdPDV*),'C',
              vCreditoAnterior-CreditoUtiliz(*ValorAnt*),vDifSuperior(*Valor*),0,
              'PAG. TRC SUPERIOR AO VALOR DO TÍTULO') then
          Begin
            ShowMessage('Falha ao Gerar Mov. de Crédito!');
            Raise Exception.Create('');
          end;
        end;
      end;

      if vAlterarCreditoUtilizado then
        ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
          ' ICR_CRED_UTIL=ICR_CRED_UTIL-'+VirgPonto(edtValorDocumento.Text)+
          ' WHERE CLI_CODIGO='+IntToStr(CdCLI)+
          ' AND CNC_CODIGO='+IntToStr(CdCNCCLI));

      if (ABS(StrToDate(mskDataPag.Text) - (DM.Configuracao1.Data)) > 5) then
        iOPS := 6060 //Alterar Data de Pagamento > 5 dias
      else if (ABS(StrToDate(mskDataPag.Text) - (DM.Configuracao1.Data)) > 0) then
        iOPS := 6050 //Alterar Data de Pagamento 5 dias
      else
        iOPS := 2190; //Recebimento de Cliente

      if not DM.Titulo_receber1.GeraLog(iOPS, CdCNC, CdTRC, sSemMov+
        ' CLI:'+PreencheZero(2,CdCNCCLI)+'-'+IntToStr(CdCLI)+
        ' Doc:R$'+edtValorDocumento.Text+
        ' Cred.:R$'+edtCredito.Text+
        ' Total:R$'+edtValorTotal.Text+
        ' Pago:R$'+edtValorPago.Text+
        ' DtPag: '+mskDataPag.Text+
        ' TipPag: '+IntToStr(dblTipoPagamentoEfetuado.KeyValue)+sPagParcial+
        ' CHQ:'+PreencheZero(2,CdCHQCNCi)+'-'+IntToStr(CdCHQi)) then
      Begin
        ShowMessage('Falha ao gerar Log!');
        Raise exception.Create('');
      end;      

      If DM.Configuracao1.ControleTransacao then
        Commit;

      Trans := False;

      //Bloquear o Cliente com atraso superior a 2 meses
      if StrToDate(mskVencimento.Text) < IncMonth(StrToDate(mskDataPag.Text),-2) then
      Begin
        if DM.Configuracao1.Empresa = empEletro then
        Begin
          with Informacoes1 do
          Begin
            Close;
            ParamByName('CNC_CODIGO').asInteger := CdCNCCLI;
            ParamByName('CLI_CODIGO').asInteger := CdCLI;
            Open;
            if IsEmpty and (CdCLI > 0) then
            Begin
              if not Inserir(CdCNCCLI, CdCLI, 0, 0, 0, 0,
                  0,0,0,0(*Renda*),0,'','','','','','',False,False,0) then
              Begin
                ShowMessage('Falha ao inserir Informações de Crédito!');
              end;
              Close;
              ParamByName('CNC_CODIGO').asInteger := CdCNCCLI;
              ParamByName('CLI_CODIGO').asInteger := CdCLI;
              Open;
            end;
            if not Proibido then
            Begin
              Close;
              ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
                ' ICR_PROIBIDO=1 '+
                ',ICR_MOT_PROIB="ATRAZO > 2 MESES" '+
                ',ICR_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNCCLI)+
                ' AND CLI_CODIGO='+IntToStr(CdCLI));
              ShowMessage('Cliente foi Bloqueado devido atrazo superior a 2 meses!');
            end;
          end;
        end;
      end;

      If self.Tag=0 then
      Begin
        with fMxSRecPed do
        Begin
          Cliente1.Close;
          Cliente1.ParamByName('CNC_CODIGO').asInteger:=CdCNCCLI;
          Cliente1.ParamByName('CLI_CODIGO').asInteger:=CdCLI;
          Cliente1.Open;
        end;
      end
      else
      Begin
        with fMxReceber do
        Begin
          Cliente1.Close;
          Cliente1.ParamByName('CNC_CODIGO').asInteger:=CdCNCCLI;
          Cliente1.ParamByName('CLI_CODIGO').asInteger:=CdCLI;
          Cliente1.Open;
        end;
      end;
      try
        sndPlaySound(PChar(cSomRegistradora),SND_ASYNC);
      except
      end;
      if ((vDifSuperior-CreditoUtiliz) > 0) then
        ShowMessage('Foi gerado crédito no valor de R$ '+format('%.2f',[vDifSuperior-CreditoUtiliz]));

      try
        if DM.Configuracao1.Empresa = empLuciano then
          bitAutenticar.SetFocus
        else
          bitRecibo.SetFocus;
      except
      end;
      //tira cliente da cobrança (anderson)
      {ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_COBRANCA_COBRADOR '+
          ' WHERE CNC_CODIGO='+IntToStr(CodCNCTitulo)+
          ' AND TRC_CODIGO='+edtCodigoTRC.Text);}
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para a o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
          RollBack;
      Exit;
    end;
  end;
  bitPagar.Enabled:=False;
  bitPagarParcial.Enabled:=False;
  bitRecibo.Enabled:=True;
  bitAutenticar.Enabled:=True;

  If self.Tag=0 then
  Begin
    fMxSRecPed.Titulo_receber1.close;
    fMxSRecPed.Titulo_receber1.open;
  End
  else If self.Tag=2 then
  Begin
    fMxReceber.Titulo_receber1.close;
    fMxReceber.Titulo_receber1.open;
  End;
  PagParc := False;
  dblTipoPagamentoEfetuado.Enabled := False;
  memObservacao.Enabled:=False;
  dblContaDeCaixaRecebida.Enabled:=False;
  edtDesconto.Enabled:=False;
  edtCodigoCHQ.Enabled:=False;
  edtCodigoMCC.Enabled:=False;
  edtValorPago.Enabled:=False;
  mskDataPag.Enabled := False;
end;

procedure TfMxSRecPParc.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSRecPParc.bitAutenticarClick(Sender: TObject);
var
  Arquivo : TextFile;
  sReimpressao: string;
  sImpressao: string;
begin
//  ImpFiscalB1.MonitoramentoPapel;
//  if ImpFiscalB1.Analisa_iRetorno then
//    ImpFiscalB1.AutenticarDocumento;

  //Verifica se o usuário que está logado não tem permissão para autenticar
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0 then
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
        if usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para autenticar título!');
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

  sReimpressao := '';
  With Autenticacao1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM AUTENTICACAO '+
      ' WHERE ATN_CNC_CODIGO='+IntToStr(self.CodCNCTitulo)+
      ' AND ATN_COD_DOC='+edtCodigoTRC.Text;
    Open;
    if not IsEmpty then
      sReimpressao := '(RE)'
    else
      Inserir(DM.Configuracao1.CodigoCNC,0,self.CodCNCTitulo,
              StrToInt(edtCodigoTRC.Text),dblTipoPagamentoEfetuado.KeyValue,
              StrToFloat(edtValorPago.Text),DM.Configuracao1.DataHora,'C');
    Close;
  End;

  DM.Usuario1.GeraLog(2170, self.CodCNCTitulo, StrToInt(edtCodigoTRC.Text), sReimpressao);

  //Alterado em 21/06/2013
  //Impressão da Autenticação
  //CdCNC Valor DataHora CdTRC CdUSU
  sImpressao := VirgPonto(edtValorPago.Text)+
                          sReimpressao+
                          FormatDateTime('DDMMYYHHMM',DM.Configuracao1.DataHora)+
                          PreencheZero(7,edtCodigoTRC.Text)+
                          PreencheZero(3,DM.Configuracao1.CodigoUSU)+
                          PreencheZero(2,DM.Configuracao1.CodigoCNC);


  if cbxUSB.Checked then
  begin
    Editor.Text := sImpressao;
    if PrintDialog1.Execute then
      Editor.Print(sImpressao);
  end
  else
  begin
    AssignFile(Arquivo,'LPT1');
    Rewrite(Arquivo);
    Writeln(Arquivo,sImpressao);
    CloseFile(Arquivo);
  end;
end;

procedure TfMxSRecPParc.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Funcionario1.Open;
  try
    vValorJuros := StrToFloat(edtJuros.Text);
  except
    vValorJuros := 0;
  end;
  if (DM.Usuario1.Permissoes.IndexOf(IntToStr(6330)) > 0) and
     (DM.Configuracao1.Empresa = empPetromax) then
    ckbGerarMovimento.Enabled := True
  else
    ckbGerarMovimento.Enabled := False;
  PagParc := False;
  TipoPagamentoOriginal := dblTipoPagamentoEfetuado.KeyValue;
  dblTipoPagamentoEfetuadoClick(sender);

  //Anderson, em 29/02/2008
  if Parametro2.FieldByName('PAR_CODIGO').AsInteger = 412 then
    dblContaDeCaixaRecebida.KeyValue := 264;
end;


procedure TfMxSRecPParc.bitPagarParcialClick(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtCodigoCHQ.Text) then
    edtCodigoCHQ.Text := '0';

  if not VerificaInteiroBranco(edtCodigoMCC.Text) then
    edtCodigoMCC.Text := '0';

  If Arredonda(StrToFloat(edtValorPago.Text))>=Arredonda(StrToFloat(edtValorTotal.Text)) then
    raise exception.create('Não é possível efetuar pagamento parcial com o valor Pago >= A Pagar!');

  if not VerificaDataBranco(mskDataPag.Text) then
    Raise Exception.Create('Data de Pagamento inválida!');
  if (ABS(StrToDate(mskDataPag.Text) - (DM.Configuracao1.Data)) > 5) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(6060)) < 0) then
    Raise Exception.Create('Usário não tem permissão para alterar Data Pagamento >5!')
  else if (ABS(StrToDate(mskDataPag.Text) - (DM.Configuracao1.Data)) > 0) and
          (DM.Usuario1.Permissoes.IndexOf(IntToStr(6050)) < 0) then
    Raise Exception.Create('Usário não tem permissão para alterar Data Pagamento!');
  PagParc := True;
  bitPagarClick(Sender);
end;

procedure TfMxSRecPParc.bitReciboClick(Sender: TObject);
begin
  //Verifica se o usuário que está logado não tem permissão imprimir
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
        free;
        exit;
      end;
      free;
    End;
  End;
  DM.Movimento_caixa1.GeraLog(2180,CodCNCTitulo,CodTitulo,'51');
  Application.CreateForm(Trpt_Recibo, rpt_Recibo);
  with rpt_Recibo do
  Begin
    if self.tag = 0 then
      Tag := 0
    else
      Tag := 2;

    if self.edtValorTotal.Text <> self.edtValorPago.Text then
      zrlDescPagamentoParcial.Enabled := True;
    Titulo_receber1.Close;
    Titulo_receber1.ParamByName('TRC_CODIGO').AsInteger := StrToInt(self.edtCodigoTRC.Text);
    Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := self.CodCNCTitulo;
    Titulo_receber1.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxSRecPParc.dblTipoPagamentoEfetuadoClick(Sender: TObject);
var
  CdCNCTRC, CdTRC: integer;
begin
  if (DM.Configuracao1.Empresa = empLBM) then
  Begin
    if tag = 0 then
    Begin
      if (fMxSRecPed.Titulo_receber1.TipoPag <> dblTipoPagamentoEfetuado.KeyValue) and
         ((dblTipoPagamentoEfetuado.KeyValue = 5) or (dblTipoPagamentoEfetuado.KeyValue = 6)) and
         (not (fMxSRecPed.Titulo_receber1.TipoPag IN [5,6])) then
      Begin
        dblContaDeCaixaRecebida.KeyValue := 2; //Rec. Venda a Prazo
        dblContaDeCaixaRecebida.Enabled := False;
      end;
    end
    else if tag = 2 then
    Begin
      if (fMxReceber.Titulo_receber1.TipoPag <> dblTipoPagamentoEfetuado.KeyValue) and
         ((dblTipoPagamentoEfetuado.KeyValue = 5) or (dblTipoPagamentoEfetuado.KeyValue = 6)) and
         (not (fMxReceber.Titulo_receber1.TipoPag IN [5,6])) then
      Begin
        dblContaDeCaixaRecebida.KeyValue := 2; //Rec. Venda a Prazo
        dblContaDeCaixaRecebida.Enabled := False;
      end;
    end;
  end;

  CdCNCOrigem := 0;
  if self.Tag = 0 then
  Begin
    CdCNCOrigem := fMxSRecPed.Titulo_receber1.CNCOrigem;
  end
  else
  Begin
    CdCNCOrigem := fMxReceber.Titulo_receber1.CNCOrigem;
  end;

  if (dblTipoPagamentoEfetuado.KeyValue = 6) and //Cheque
     (not DM.Configuracao1.IgnorarCheques) then
  Begin
    edtCodigoCHQ.Enabled := True;
    Application.CreateForm(TfMxCheque,fMxCheque);
    with fMxCheque do
    Begin
      If self.Tag=0 then
      Begin
        tag:=1;  //Tag do Cheque
        CdCNCTRC    := fMxSRecPed.Titulo_receber1.CodigoCNC;
        CdTRC       := fMxSRecPed.Titulo_receber1.CodigoTRC;
        CdCNCCLITRC := fMxSRecPed.Titulo_receber1.ClienteCNC;
        CdCLITRC    := fMxSRecPed.Titulo_receber1.CodigoCLI;
      end
      else
      Begin
        tag:=2; //Tag do Cheque
        CdCNCTRC    := fMxReceber.Titulo_receber1.CodigoCNC;
        CdTRC       := fMxReceber.Titulo_receber1.CodigoTRC;
        CdCNCCLITRC := fMxReceber.Titulo_receber1.ClienteCNC;
        CdCLITRC    := fMxReceber.Titulo_receber1.CodigoCLI;
      end;
      Entidade.SQL.Text:='SELECT C1.* FROM CHEQUE C1 '+
        ' WHERE ((C1.CHQ_CNC_TITULO='+IntToStr(CdCNCTRC)+
        ' AND C1.CHQ_COD_TITULO='+IntToStr(CdTRC)+') '+
        ' OR (C1.CNC_CLIENTE='+IntToStr(CdCNCCLITRC)+
        ' AND C1.CLI_CODIGO='+IntToStr(CdCLITRC)+'))'+

        ' AND C1.CHQ_ER="R" '+
        ' AND CHQ_DATA>="01/01/2004" '+
        ' AND CHQ_SITUACAO<>6 '+ //Cancelado

        ' AND ((NOT EXISTS (SELECT TRC_CODIGO '+
        ' FROM TITULO_A_RECEBER T1 '+
        ' WHERE T1.TRC_SITUACAO=2 '+ //Pago
        ' AND T1.CHQ_CODIGO=C1.CHQ_CODIGO '+
        ' AND T1.CNC_CHEQUE=C1.CNC_CODIGO) '+

        ' OR ROUND(C1.CHQ_VALOR,2)>(SELECT SUM(ROUND(T2.TRC_VALOR_PAGO,2)) AS TOTAL '+
        ' FROM TITULO_A_RECEBER T2 '+
        ' WHERE T2.TRC_SITUACAO=2 '+ //Pago
        ' AND T2.CHQ_CODIGO=C1.CHQ_CODIGO '+
        ' AND T2.CNC_CHEQUE=C1.CNC_CODIGO))) ';
      cmbTipo.ItemIndex:=1; //Recebidos
      Entidade.Open;
      if Entidade.IsEmpty then
      Begin
        SB_NovoCabClick(SB_NovoCab);
        edtValor.Text := self.edtValorTotal.Text;
        If self.Tag=0 then
        Begin
          edtClienteCNC.Text := IntToStr(fMxSRecPed.Titulo_receber1.ClienteCNC);
          edtCodigoCLI.Text  := IntToStr(fMxSRecPed.Titulo_receber1.CodigoCLI);
          edtDonoCheque.Text := fMxSRecPed.edtRazaoSocial.Text;
          mskCPF_CNPJ.Text   := fMxSRecPed.mskCNPJ_CPF.Text;
          edtTituloCNC.Text  := inttostr(fMxSRecPed.Titulo_receber1.CodigoCNC);
          edtTitulo.Text     := inttostr(fMxSRecPed.Titulo_receber1.CodigoTRC);
        End
        else If self.Tag=2 then
        Begin
          edtClienteCNC.Text := IntToStr(fMxReceber.Titulo_receber1.ClienteCNC);
          edtCodigoCLI.Text  := IntToStr(fMxReceber.Titulo_receber1.CodigoCLI);
          edtDonoCheque.Text := fMxReceber.Titulo_receber1.fieldByName('Cliente').asString;
          mskCPF_CNPJ.Text   := fMxReceber.Cliente1.CPFCGC;
          edtTituloCNC.Text  := inttostr(fMxReceber.Titulo_receber1.CodigoCNC);
          edtTitulo.Text     := inttostr(fMxReceber.Titulo_receber1.CodigoTRC);
        End;
      end;
      ShowModal;
    end;
  End
  else
  Begin
    if (dblTipoPagamentoEfetuado.KeyValue <> 416) then //Depósito
      mskDataPag.Text := formatDateTime('DD/MM/YYYY',DM.Configuracao1.Data);
    edtCodigoCHQ.Enabled := False;
  end;


  if (dblTipoPagamentoEfetuado.KeyValue = 416) and //Depósito
     (not DM.Configuracao1.IgnorarDepositos) then
  Begin
    edtCodigoMCC.Enabled := True;
    Application.CreateForm(TfMxMovimentoContaCorrente,fMxMovimentoContaCorrente);
    with fMxMovimentoContaCorrente do
    Begin
      tag:=1;  //Tag do Cheque
      cmbDC.ItemIndex:=1; //Crédito
      ShowModal;
    end;
  End
  else
  Begin
    if (dblTipoPagamentoEfetuado.KeyValue <> 6) then //Cheque
      mskDataPag.Text := formatDateTime('DD/MM/YYYY',DM.Configuracao1.Data);
    edtCodigoMCC.Enabled := False;
  end;

  if ((dblTipoPagamentoEfetuado.KeyValue = 13) or    //Cartão
      (dblTipoPagamentoEfetuado.KeyValue = 412) or   //Boleto Bancário
      (dblTipoPagamentoEfetuado.KeyValue = 416)) and //Depósito em Conta
     ((DM.Usuario1.Permissoes.IndexOf(IntToStr(6050)) > 0) or
      (DM.Usuario1.Permissoes.IndexOf(IntToStr(6060)) > 0)) then //Alterar Data Pag.
    mskDataPag.Enabled := True
  else
    mskDataPag.Enabled := False;


  if ((dblTipoPagamentoEfetuado.KeyValue = 13) and (DM.Configuracao1.Empresa <> empPetromax))  or //Cartão <> Petromax
     (dblTipoPagamentoEfetuado.KeyValue = 412) or //Boleto Bancário
     (dblTipoPagamentoEfetuado.KeyValue = 416) or //Depósito em Conta
     ((DM.Configuracao1.Empresa = empLuciano) and (CdCNCOrigem <> DM.Configuracao1.CodigoCNC)) or
     (Trunc(StrToDate(mskDataPag.Text)) > Trunc(DM.Configuracao1.Data)) then     
    ckbGerarMovimento.Checked := False
  else
  Begin
    ckbGerarMovimento.Checked := True;
    if dblTipoPagamentoEfetuado.KeyValue <> 6 then
      edtCodigoCHQ.Enabled := False;
  end;

  //Decidiram Solange e Luciano (27/09/2004) que Pagamento e Recebimento de Títulos no CPD não geram Movimento de Caixa
  if (DM.Configuracao1.Empresa = empLuciano) and
     (DM.Configuracao1.CodigoCNC = 1) then //CPD
    ckbGerarMovimento.Checked := False;

  if not edtCodigoCHQ.Enabled then
    edtCodigoCHQ.Text := '0';
end;

procedure TfMxSRecPParc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxSRecPParc.edtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (edtDesconto.Focused or edtValorPago.Focused) and (key = '.') then
    Key := ',';
end;

procedure TfMxSRecPParc.mskDataPagChange(Sender: TObject);
var
  sDataUtil: string;
begin
  if dblContaDeCaixaRecebida.Text = '' then
    Exit;

  with DM.Conta_de_Caixa1 do
  Begin
    if (not Active) or
       (CodigoCCX <> dblContaDeCaixaRecebida.KeyValue) then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := dblContaDeCaixaRecebida.KeyValue;
      Open;
    end;
  end;

  if DM.Configuracao1.Empresa in [empEletro, empLBM, empMotical, empLuciano, empAndrea] then
  Begin
    if mskDataPag.Enabled then
    Begin
      try
        if StrToDate(mskDataPag.Text) <= StrToDate(mskVencimento.Text) then
          edtJuros.Text := '0,00'
        else
        Begin
          //calcular os juros, se tiver em atraso
          iDiasAtraso := Trunc(StrToDate(mskDataPag.Text)-StrToDate(mskVencimento.Text));
          if iDiasAtraso > 0 then
          Begin
            //Não cobrar juros quando Vencimento Sábado ou Domingo
            sDataUtil := RetornaDataValidaUtil(DM.Configuracao1.PastaSistema, mskVencimento.Text, False);
            if StrToDate(sDataUtil) < StrToDate(mskDataPag.Text) then
              iDiasAtraso := Trunc(StrToDate(mskDataPag.Text)-StrToDate(sDataUtil))
            else
            Begin
              iDiasAtraso := 0;
              edtJuros.Text := '0,00';
            end;
          end;
          if (DM.Configuracao1.Empresa = empLBM) and
             (DM.Conta_de_Caixa1.Grupo = 452) and //CONDOMINIO/ALUGUEIS SALAS
             (iDiasAtraso > 0) then
          Begin
            //1% ao mês + 10% multa
            edtJuros.Text:=Format('%.2f', [StrToFloat(edtValorDocumento.Text)*(1*iDiasAtraso/3000)+
              (StrToFloat(edtValorDocumento.Text)*0.1)]);
          end
          else
          Begin
            if (StrToDate(mskVencimento.Text)+DM.Configuracao1.QuantDiasSemJuros<StrToDate(mskDataPag.Text)) or
               (dblTipoPagamentoEfetuado.KeyValue = 412) or
               (DM.Configuracao1.Empresa IN [empEletro, empLBM]) then
              edtJuros.Text:=Format('%.2f', [StrToFloat(edtValorDocumento.Text)*(DM.Configuracao1.TaxaJuros*iDiasAtraso/3000)])
            else
              edtJuros.Text:='0,00';
          end;
        end;
      except
        edtJuros.Text := '0,00';
      end;
      edtDescontoChange(sender);
    end;
  end;
  try
    if ((dblTipoPagamentoEfetuado.KeyValue = 13) and (DM.Configuracao1.Empresa <> empPetromax))  or //Cartão <> Petromax
       (dblTipoPagamentoEfetuado.KeyValue = 412) or //Boleto Bancário
       (dblTipoPagamentoEfetuado.KeyValue = 416) or //Depósito em Conta
       ((DM.Configuracao1.Empresa = empLuciano) and (CdCNCOrigem <> DM.Configuracao1.CodigoCNC)) or
       (Trunc(StrToDate(mskDataPag.Text)) > Trunc(DM.Configuracao1.Data)) then
      ckbGerarMovimento.Checked := False
    else
      ckbGerarMovimento.Checked := True;
  except
  end;
end;

procedure TfMxSRecPParc.memObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfMxSRecPParc.Label16DblClick(Sender: TObject);
var
  vValorJuros: Double;
begin
  try
    if not VerificaFloatBranco(edtJuros.Text) then
      edtJuros.Text := '0,00';
    if StrToFloat(edtJuros.Text) > 0 then
    Begin
      vValorJuros := Arredonda(StrToFloat(InputBox('Alterar Juros Cobrado', 'Juros:', edtJuros.Text)),2);
      if vValorJuros >= StrToFloat(edtJuros.Text) then
      Begin
        edtJuros.Text := format('%.2f',[vValorJuros]);
        edtDescontoChange(sender); //Para reclacular os totais
      end;
    end;
  except
  end;
end;

procedure TfMxSRecPParc.Funcionario1BeforeOpen(DataSet: TDataSet);
begin
  Funcionario1.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
end;

procedure TfMxSRecPParc.Label5Click(Sender: TObject);
var
  vValorCred: Double;
begin
  try
    if not VerificaFloatBranco(edtCredito.Text) then
      edtCredito.Text := '0';
    if StrToFloat(edtCredito.Text) > 0 then
    Begin
      vValorCred := Arredonda(StrToFloat(InputBox('Alterar Credito Utilizado', 'Credito:', edtCredito.Text)),2);
      if vValorCred <= StrToFloat(edtCredito.Text) then
      Begin
        edtCredito.Text := format('%.2f',[vValorCred]);
        vCreditoAnterior := vValorCred;
        edtDescontoChange(sender);
      end;
    end;
  except
  end;
end;

end.
