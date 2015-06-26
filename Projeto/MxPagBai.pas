unit MxPagBai;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants, Titulo_a_Pagar, Conta_de_Caixa, DB, Parametro, DBTables, Funcoes,
  SQuery, Movimento_caixa, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls,MMSystem,
  DateUtils;


type
  TfMxSPagBai = class(TForm)
    Panel2: TPanel;
    Label16: TLabel;
    Label18: TLabel;
    edtValorTitulo: TEdit;
    edtValorPago: TEdit;
    Panel1: TPanel;
    bitPagar: TBitBtn;
    bitFechar: TBitBtn;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Conta_de_Caixa1: TConta_de_Caixa;
    mskCompetencia: TMaskEdit;
    Label2: TLabel;
    ckbGerarMovimento: TCheckBox;
    Label3: TLabel;
    Titulo_a_pagar1: TTitulo_a_pagar;
    Label4: TLabel;
    dblContaAgendada: TDBLookupComboBox;
    Label5: TLabel;
    dblContaRecebida: TDBLookupComboBox;
    Conta_de_Caixa2: TConta_de_Caixa;
    DSConta_de_Caixa2: TDataSource;
    Conta_de_Caixa3: TConta_de_Caixa;
    DSConta_de_Caixa3: TDataSource;
    Label1: TLabel;
    dblTipoPagamento: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    edtCodigoTPG: TEdit;
    mskVencimento: TMaskEdit;
    edtNumeroDocumento: TEdit;
    edtSequencia: TEdit;
    Label9: TLabel;
    mskDataPagamento: TMaskEdit;
    bitPagarParcial: TBitBtn;
    Titulo_a_pagar2: TTitulo_a_pagar;
    edtCodigoCHQ: TEdit;
    edtChequeCNC: TEdit;
    mskAgenciaConta: TMaskEdit;
    Label10: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitFecharClick(Sender: TObject);
    procedure bitPagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblTipoPagamentoClick(Sender: TObject);
    procedure ckbGerarMovimentoClick(Sender: TObject);
    procedure bitPagarParcialClick(Sender: TObject);
  private

  public
    Entidade: TTitulo_a_pagar;
    Cancelar, PagParc: Boolean;
  end;

var
  fMxSPagBai: TfMxSPagBai;

implementation

uses
  MxPagar,UDM, MxCheque, DigSenha, Configuracao;

{$R *.DFM}


procedure TfMxSPagBai.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Parametro1.Active:=False;
  Conta_de_Caixa1.Close;
  Conta_de_Caixa2.Close;
  Conta_de_Caixa3.Close;
  Action:=CaFree;
end;

procedure TfMxSPagBai.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSPagBai.bitPagarClick(Sender: TObject);
var
  mensagem, sTipoParcial, sSemMov, sPagParcial, sTipoCheque:string;
  Mov, CaixaCNC, TPGOrigem, CdCNC, CdTPG, CdCHQCNCi, CdCHQi, iOPS:Integer;
  DescontoPag, vDesconto, vJuros, vSaldoCheque,vLimNormal,vLimEspecial, vLimiteGasto : Double;
  DTOrigem:TDateTime;
  Trans : Boolean;
begin
  if not VerificaInteiroBranco(edtCodigoCHQ.Text) then
    edtCodigoCHQ.Text := '0';

  cdCNC:=fMxPagar.Titulo_a_pagar1.CodigoCNC;
  CdTPG:=fMxPagar.Titulo_a_pagar1.CodigoTPG;

  vLimNormal   := DM.Configuracao1.JurosNormPag;
  vLimEspecial := DM.Configuracao1.JurosEspPag;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;
  mensagem:='';
  if ckbGerarMovimento.Checked and
     (DM.Usuario1.CentroDeCusto > 0) then
    Mov := 1
  else
    Mov := 0;

  if not VerificaDataBranco(mskCompetencia.Text) then
    mensagem:=mensagem+'Data de Competência Inválida!'+#13;
  If dblTipoPagamento.Text = '' then
    mensagem:=mensagem+'Tipo de Pagamento Inválido!'+#13;
  If not VerificaFloatBranco(edtValorPago.Text) then
    mensagem:=mensagem+'Valor Pago Inválido!'+#13;
  If dblContaAgendada.Text = '' then
    mensagem:=mensagem+'Problema na Conta Agendada!'+#13;
  If dblContaRecebida.Text = '' then
    mensagem:=mensagem+'Conta de Recebimento inválida!'+#13;
  If mensagem <> '' then
    raise Exception.Create(mensagem);
  if StrToDate(mskCompetencia.Text) < 01/01/1900 then
    raise Exception.Create('Data de Competência inválida!');
  if not VerificaDataBranco(mskDataPagamento.Text) then
    Raise Exception.Create('Data de Pagamento inválida!');

  if (ABS(StrToDate(mskDataPagamento.Text) - (DM.Configuracao1.Data)) > 5) then
  Begin
    If MessageDlg('Atenção!'#13+
                  'Data do Pagamento alterada >5 dias.'+#13+
                  'Deseja continuar!',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6970)) < 0 then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=34;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if usuario1.Permissoes.IndexOf(IntToStr(6970)) < 0 then
          begin
            free;
            raise Exception.Create('Usário não tem permissão para alterar Data Pagamento > 5!');
          end
          else
            DM.Usuario1.GeraLog(6970, CdCNC, CdTPG,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' PAGAMENTO TPG');
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
      DM.Usuario1.GeraLog(6970, CdCNC, CdTPG,
        'PAGAMENTO TPG');
  end
  else if (ABS(StrToDate(mskDataPagamento.Text) - (DM.Configuracao1.Data)) > 0) then
  Begin
    If MessageDlg('Atenção!'#13+
                  'Data do Pagamento alterada.'+#13+
                  'Deseja continuar!',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6960)) < 0 then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=34;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if usuario1.Permissoes.IndexOf(IntToStr(6960)) < 0 then
          begin
            free;
            raise Exception.Create('Usário não tem permissão para alterar Data Pagamento!');
          end
          else
            DM.Usuario1.GeraLog(6960, CdCNC, CdTPG,
              'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
              ' PAGAMENTO TPG');
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
      DM.Usuario1.GeraLog(6970, CdCNC, CdTPG,
        'PAGAMENTO TPG');
  end;

  try
    CdCHQCNCi := StrToInt(edtChequeCNC.Text);
    CdCHQi    := StrToInt(edtCodigoCHQ.Text);
  except
    CdCHQCNCi := 0;
    CdCHQi    := 0;
  end;

  if (CdCHQi<>0) then
  Begin
    if (dblTipoPagamento.KeyValue <> 6) and (dblTipoPagamento.KeyValue <> 416) then
      Raise Exception.Create('Tipo de pagamento diferente de Cheque/Depósito e foi informado Agência/Numero!')
    else if VerificaInteiroBranco(edtCodigoCHQ.Text) then
    Begin
      //Verificação de Cheque
      if (dblTipoPagamento.KeyValue = 6) then //Cheque
      Begin
        With DM.QR_Consultas do
        Begin
          Close;
          //Não verifica se é cheque emitido
          SQL.Text:='SELECT * '+
            ' FROM CHEQUE '+
            ' WHERE CHQ_CODIGO='+IntToStr(CdCHQi)+
            ' AND CNC_CODIGO='+IntToStr(CdCHQCNCi)+
            ' AND CHQ_SITUACAO<>6 '; //Cancelado
          Open;
          if IsEmpty then
            Raise exception.Create('Cheque não cadastrado!');
          sTipoCheque  := FieldByName('CHQ_ER').asString;
          vSaldoCheque := CalculaSaldoCheque(DM.QR_Consultas, CdCHQCNCi, CdCHQi, True);
          if Arredonda(vSaldoCheque) < Arredonda(StrToFloat(edtValorPago.Text)) then
              Raise exception.create('Cheque com valor menor que o proposto pelos títulos!');
        end;
        if sTipoCheque = 'R' then //Cheque Recebido
          ckbGerarMovimento.Checked := True;
      End;
    end
    else
      Raise Exception.Create('Código do Cheque inválido!');
  end
  else if dblTipoPagamento.KeyValue = 6 then
    Raise Exception.Create('Código do Cheque inválido!');

  //Decidiram Solange e Luciano (27/09/2004) que Pagamento e Recebimento de Títulos no CPD não geram Movimento de Caixa
  if (DM.Configuracao1.Empresa = empLuciano) and
     (DM.Configuracao1.CodigoCNC = 1) then //CPD
    ckbGerarMovimento.Checked := False;    

  if Conta_de_Caixa1.CodigoCCX <> dblContaRecebida.KeyValue then
  Begin
    Conta_de_Caixa1.Close;
    Conta_de_Caixa1.ParamByName('CCX_CODIGO').asInteger:=dblContaRecebida.KeyValue;
    Conta_de_Caixa1.Open;
  end;

  vDesconto   := 0;
  vJuros      := 0;
  if not PagParc then //Quando for Pagamento Parcial não tem como dar Desconto
  Begin
    DescontoPag := Arredonda((StrToFloat(fMxPagar.edtValor.Text)-StrToFloat(edtValorPago.Text))/StrToFloat(fMxPagar.edtValor.Text)*100);
    if (StrToFloat(fMxPagar.edtValor.Text) > StrToFloat(edtValorPago.Text)) then
      vDesconto := StrToFloat(fMxPagar.edtValor.Text) - StrToFloat(edtValorPago.Text)
    else if (StrToFloat(fMxPagar.edtValor.Text) < StrToFloat(edtValorPago.Text)) then
      vJuros := StrToFloat(edtValorPago.Text) - StrToFloat(fMxPagar.edtValor.Text);

    if (DescontoPag > 0) then
    Begin
      if (DescontoPag > vLimEspecial) then
      Begin
        If MessageDlg('Atenção!!!'+#13+
                      'Desconto atribuído (Total).'+#13+
                      'Deseja continuar!',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(6150)) < 0) then //Desconto Total Pagamento
        begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=34;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            begin
              if usuario1.Permissoes.IndexOf(IntToStr(6150)) < 0 then
              begin
                free;
                raise Exception.Create('Usuário não tem permissão para Desconto (Total)!');
              end
              else
                DM.Usuario1.GeraLog(6150, CdCNC, CdTPG,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PAGAMENTO TPG-DESCONTO ACIMA DO ESPECIAL');
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
          DM.Usuario1.GeraLog(6150, CdCNC, CdTPG,
            ' PAGAMENTO TPG-DESCONTO ACIMA DO ESPECIAL');
      end
      else if (DescontoPag >  vLimNormal) and
              (DescontoPag <= vLimEspecial) then
      Begin
        If MessageDlg('Atenção!!!'+#13+
                      'Desconto atribuído (Especial).'+#13+
                      'Deseja continuar!',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(6140)) < 0) and  //Desconto Especial Pagamento
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(6150)) < 0) then //Desconto Total Pagamento
        begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=34;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            begin
              if usuario1.Permissoes.IndexOf(IntToStr(6140)) < 0 then
              begin
                free;
                raise Exception.Create('Usuário não tem permissão para Desconto (Especial)!');
              end
              else
                DM.Usuario1.GeraLog(6140, CdCNC, CdTPG,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PAGAMENTO TPG-DESCONTO ESPECIAL');
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
          DM.Usuario1.GeraLog(6140, CdCNC, CdTPG,
            ' PAGAMENTO TPG-DESCONTO ESPECIAL');
      end
      else if (DescontoPag <= vLimNormal) then
      Begin
        If MessageDlg('Atenção!!!'+#13+
                      'Desconto atribuído (Normal).'+#13+
                      'Deseja continuar!',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7400)) < 0) and  //Desconto Simples Pagamento
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(6140)) < 0) and  //Desconto Especial Pagamento
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(6150)) < 0) then //Desconto Total Pagamento
        begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=34;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            begin
              if usuario1.Permissoes.IndexOf(IntToStr(7400)) < 0 then
              begin
                free;
                raise Exception.Create('Usuário não tem permissão para Desconto (Simples)!');
              end
              else
                DM.Usuario1.GeraLog(7400, CdCNC, CdTPG,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' PAGAMENTO TPG-DESCONTO SIMPLES');
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
          DM.Usuario1.GeraLog(7400, CdCNC, CdTPG,
            ' PAGAMENTO TPG-DESCONTO SIMPLES');
      end
    end;
  end;

  With DM.QR_Consultas do
  Begin
    //Limite Específico
    Close;
    SQL.Text := 'SELECT LMG_LIMITE_MENSAL AS LIMITE '+
      ' FROM LIMITE_GASTO '+
      ' WHERE CCX_CODIGO='+IntToStr(Conta_de_Caixa1.CodigoCCX)+
      ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Open;
    if IsEmpty then
    Begin
      //Limite Genérico
      Close;
      SQL.Text := 'SELECT CCX_LIMITE_GASTO AS LIMITE '+
        ' FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_CODIGO='+IntToStr(Conta_de_Caixa1.CodigoCCX);
      Open;
    end;
    vLimiteGasto := FieldByName('LIMITE').asFloat;
    if vLimiteGasto > 0 then
    Begin
      //Movimentos de Caixa
      Close;
      SQL.Text := 'SELECT SUM(MVC_VALOR) AS TOTAL '+
        ' FROM MOVIMENTO_DE_CAIXA '+
        ' WHERE CCX_CODIGO_REC='+IntToStr(Conta_de_Caixa1.CodigoCCX)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND (MVC_NAO_CONTABIL=0 OR MVC_NAO_CONTABIL IS NULL) '+
        ' AND DATEPART(YYYY,MVC_DATA)='+IntToStr(YearOf(StrToDate(mskDataPagamento.Text)))+
        ' AND DATEPART(mm,MVC_DATA)='+IntToStr(MonthOf(StrToDate(mskDataPagamento.Text)));
      Open;
      vLimiteGasto := vLimiteGasto - Arredonda(FieldByName('TOTAL').asFloat);

      //Títulos pagos sem movimento
      Close;
      SQL.Text := 'SELECT SUM(TPG_VALOR_PAGO) AS TOTAL '+
        ' FROM TITULO_A_PAGAR '+
        ' WHERE CCX_CODIGO_REC='+IntToStr(Conta_de_Caixa1.CodigoCCX)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TPG_SITUACAO=1 '+
        ' AND TPG_GEROU_MOVIMENTO=0 '+
        ' AND DATEPART(YYYY,TPG_PAGAMENTO)='+IntToStr(YearOf(StrToDate(mskDataPagamento.Text)))+
        ' AND DATEPART(mm,TPG_PAGAMENTO)='+IntToStr(MonthOf(StrToDate(mskDataPagamento.Text)));
      Open;
      vLimiteGasto := vLimiteGasto - Arredonda(FieldByName('TOTAL').asFloat);

      if vLimiteGasto < StrToFloat(edtValorPago.Text) then
      Begin
        If MessageDlg('Pagamento superior ao limite de gasto mensal!'+#13+
                      ' Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(8420)) < 0) then //Pag. Acima do Limite de Gasto
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=34;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(8420)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para Pag. Acima do Limite de Gasto!');
              end
              else
                DM.Usuario1.GeraLog(8420, DM.Configuracao1.CodigoCNC, Conta_de_Caixa1.CodigoCCX,
                  'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
                  ' TPG:'+edtCodigoTPG.Text+' R$ '+edtValorPago.Text);
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
          DM.Usuario1.GeraLog(8420, DM.Configuracao1.CodigoCNC, Conta_de_Caixa1.CodigoCCX, 'TPG:'+edtCodigoTPG.Text+' R$ '+edtValorPago.Text);
      end;
    end;
  end;


  Trans := False;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Pagar o título
      with fMxPagar.Titulo_a_pagar1 do
      Begin
        sPagParcial := '';
        if PagParc then
        Begin
          sPagParcial := '(Parcial)';
          sTipoParcial := 'P';
          if fMxPagar.Titulo_a_pagar1.TituloORI > 0 then
          Begin
            TPGOrigem:=fMxPagar.Titulo_a_pagar1.TituloORI;
            DTOrigem :=fMxPagar.Titulo_a_pagar1.VencimentoORI;
          end
          else
          Begin
            TPGOrigem:=fMxPagar.Titulo_a_pagar1.CodigoTPG;
            DTOrigem :=fMxPagar.Titulo_a_pagar1.Vencimento;
          end;
          //gera outro título com o valor restante
          if not Titulo_a_pagar2.Active then
            Titulo_a_pagar2.Open;
          if not Titulo_a_pagar2.Inserir(CdCNC,0,fMxPagar.Titulo_a_pagar1.CodigoPCP,
             0,fMxPagar.Titulo_a_pagar1.CodigoCCX,fMxPagar.Titulo_a_pagar1.CodigoCCXRecebimento,
             fMxPagar.Titulo_a_pagar1.CodigoFOR,fMxPagar.Titulo_a_pagar1.CodigoTRN,
             fMxPagar.Titulo_a_pagar1.TipoDoc,fMxPagar.Titulo_a_pagar1.Periodo,
             fMxPagar.Titulo_a_pagar1.OBS,fMxPagar.Titulo_a_pagar1.Custodia,
             fMxPagar.Titulo_a_pagar1.Numero,fMxPagar.Titulo_a_pagar1.Vencimento,
             0(*DtPag*),DTOrigem,fMxPagar.Titulo_a_pagar1.DataCompetencia,
             Arredonda(StrToFloat(edtValorTitulo.Text)-StrToFloat(edtValorPago.Text)),
             0,fMxPagar.Titulo_a_pagar1.FormaPgto,fMxPagar.Titulo_a_pagar1.Sequencia+'.01',
             fMxPagar.Titulo_a_pagar1.TipoPag,CdTPG, TPGOrigem,False) then
          Begin
            ShowMessage('Não foi possível inserir Título a Pagar!');
            Raise Exception.Create('');
          end;
        end
        else
          sTipoParcial := 'T';

        ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_PAGAR SET '+
          ' TPG_SITUACAO=1 '+
          ',TPG_PAGAMENTO="'+MesDia(mskDataPagamento.Text)+'" '+
          ',CNC_CHEQUE='+edtChequeCNC.Text+
          ',CHQ_CODIGO="'+edtCodigoCHQ.Text+'" '+
          ',TPG_AGENCIA_CONTA="'+mskAgenciaConta.Text+'" '+
          ',TPG_VALOR_PAGO='+VirgPonto(edtValorPago.Text)+
          ',TPG_DESCONTO='+VirgPonto(vDesconto)+
          ',TPG_JUROS='+VirgPonto(vJuros)+
          ',TPG_TIPO_PAG='+IntToStr(dblTipoPagamento.KeyValue)+
          ',CCX_CODIGO_REC='+IntToStr(dblContaRecebida.KeyValue)+
          ',TPG_GEROU_MOVIMENTO='+IntToStr(Mov)+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND TPG_CODIGO='+IntToStr(CodigoTPG));

        //BAIXAR OS TRC GERADOS POR TRANSFERENCIAS RELATIVAS AO PCP
        if (DM.Configuracao1.Empresa = empLuciano) and
           (CodigoPCP > 0) then
          ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
            ' TRC_SITUACAO=2 '+
            ',TRC_PAGAMENTO="'+MesDia(mskDataPagamento.Text)+'" '+
            ',TRC_VALOR_PAGO=TRC_VALOR '+
            ',TRC_DESCONTO=0 '+
            ',TRC_JUROS=0 '+
            ',TRC_TIPO_PAG='+IntToStr(dblTipoPagamento.KeyValue)+
            ',CCX_CODIGO_REC='+IntToStr(dblContaRecebida.KeyValue)+
            ' WHERE CNC_ORIGEM='+IntToStr(CNCOrigem)+
            ' AND TRF_CODIGO IN (SELECT TRF_CODIGO FROM TRANSFERENCIA '+
            ' WHERE PCP_CODIGO='+IntToStr(CodigoPCP)+')');



        if (dblTipoPagamento.KeyValue = 6) then //Cheque
        Begin
          //Gerar Movimento de Cheque
          if not DM.Movimento_de_Cheque1.Inserir(CodigoCNC, CdCHQCNCi, CdCHQi, CodigoCNC,
            CodigoTPG, 4050 (*Pagar Título*), StrToFloat(edtValorPago.Text),'Emitido/Recebido:'+sTipoCheque) then
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
      End;

      if DM.Caixa1.CodigoCAX <> DM.Configuracao1.CodigoCAX then
      Begin
        DM.Caixa1.Close;
        DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
        DM.Caixa1.Open;
      end;
      if DM.Usuario1.CentroDeCusto = 0 then
        CaixaCNC := 0;
      sSemMov := '';
      if ckbGerarMovimento.Checked then
      Begin
        with fMxPagar.Titulo_a_pagar1 do
        Begin
          if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,CodigoCCX,dblContaRecebida.KeyValue,
              DM.Configuracao1.CodigoCAX, dblTipoPagamento.KeyValue,
              fMxPagar.dblTipoDeDocumento.KeyValue, CodigoCNC,
              CdCHQCNCi, CdCHQi, 'TPG Num:'+Numero,
              '2' (*Flag*), Numero, OBS, Sequencia, 'D',
              StrToFloat(edtValorPago.Text),vDesconto,vJuros,
              0(*CredCli*),StrToFloat(edtValorTitulo.Text)(*ValorDoc*),
              DM.Configuracao1.DataHora,StrToDate(mskCompetencia.Text),
              0(*DtCheque*),CodigoTPG,CodigoCNC,sTipoParcial) then
          Begin
            ShowMessage('Não foi possível inserir Movimento de Caixa!');
            Raise exception.Create('');
          end;
          if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
          Begin
            if not DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Movimento de Caixa',
                'Pag. do Titulo: '+sTipoParcial+' '+IntToStr(CodigoTPG)+#13+#10+
                'Valor: R$ '+edtValorPago.Text+' ('+dblTipoPagamento.Text+')') then
            Begin
              ShowMessage('Não foi possível inserir Mensagem!');
            end;
          end;
        end;
      end
      else //Não gerar movimento de caixa
      Begin
        sSemMov := 'S/Mov.Caixa';
        with fMxPagar.Titulo_a_pagar1 do
        Begin
          if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,CodigoCCX,dblContaRecebida.KeyValue,
              DM.Configuracao1.CodigoCAX, dblTipoPagamento.KeyValue,
              fMxPagar.dblTipoDeDocumento.KeyValue, CodigoCNC,
              CdCHQCNCi, CdCHQi, 'TPG Num:'+Numero+' ('+format('%.2f',[StrToFloat(edtValorPago.Text)])+')',
              '2' (*Flag*), Numero, OBS, Sequencia, 'D',
              0(*ValorPago*),0(*Desconto*),0(*Juros*),
              0(*CredCli*),StrToFloat(edtValorTitulo.Text)(*ValorDoc*),
              DM.Configuracao1.DataHora,StrToDate(mskCompetencia.Text),
              0(*DtCheque*),CodigoTPG,CodigoCNC,sTipoParcial) then
          Begin
            ShowMessage('Não foi possível inserir Movimento de Caixa!');
            Raise exception.Create('');
          end;
        end;
      end;

      if (ABS(StrToDate(mskDataPagamento.Text) - (DM.Configuracao1.Data)) > 5) then
        iOPS := 6970 //Alterar Data de Pagamento > 5 dias
      else if (ABS(StrToDate(mskDataPagamento.Text) - (DM.Configuracao1.Data)) > 0) then
        iOPS := 6960 //Alterar Data de Pagamento 5 dias
      else
        iOPS := 2220; //Efetuar Pagamento (Pagar)

      if not Entidade.GeraLog(iOPS, CdCNC, CdTPG, sSemMov+
        ' Titulo:R$'+edtValorTitulo.Text+
        ' Pago:R$'+edtValorPago.Text+
        ' DtPag: '+mskDataPagamento.Text+
        ' TipPag: '+IntToStr(dblTipoPagamento.KeyValue)+sPagParcial+
        ' CHQ:'+PreencheZero(2,CdCHQCNCi)+'-'+IntToStr(CdCHQi)) then
      Begin
        ShowMessage('Falha ao gerar Log!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
      try
        sndPlaySound(PChar(cSomRegistradora),SND_ASYNC);
      except
      end;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;

  fMxPagar.Titulo_a_pagar1.Close;
  fMxPagar.Titulo_a_pagar1.Open;
  Close;
end;

procedure TfMxSPagBai.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_a_pagar1;
  Parametro1.Open;    
  Conta_de_Caixa2.Open;
  Conta_de_Caixa3.Open;

  edtChequeCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);
  edtCodigoCHQ.Text := '0';
end;

procedure TfMxSPagBai.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if (DM.Configuracao1.Empresa = empPetromax) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(6330)) > 0) then
    ckbGerarMovimento.Enabled := True;
  mskCompetencia.Text:=DateToStr(DM.Configuracao1.Data);
  dblTipoPagamentoClick(sender);
  edtValorPago.SetFocus;
end;

procedure TfMxSPagBai.dblTipoPagamentoClick(Sender: TObject);
begin
  mskAgenciaConta.Enabled := False;
  edtCodigoCHQ.Enabled := False;
  if dblTipoPagamento.KeyValue = 6 then //Cheque
  Begin
    edtCodigoCHQ.Enabled := True;
    Application.CreateForm(TfMxCheque,fMxCheque);
    fMxCheque.tag:=5;
    fMxCheque.vPagarTPG := True;
    fMxCheque.cmbTipo.ItemIndex := 0;
    if (not VerificaInteiroBranco(edtCodigoCHQ.Text)) or
       (edtCodigoCHQ.Text = '0') then
    Begin
      edtCodigoCHQ.Text := '0';
      fMxCheque.Entidade.Close;
      fMxCheque.Entidade.SQL.Text := 'SELECT * FROM CHEQUE '+
        ' WHERE CHQ_ER=:CER'+
        ' AND CHQ_COD_TITULO='+edtCodigoTPG.Text+
        ' AND CHQ_SITUACAO<>6 '; //Cancelado
      fMxCheque.Entidade.Open;
      if fMxCheque.Entidade.IsEmpty then
      Begin
        fMxCheque.SB_NovoCabClick(sender);
        if edtValorPago.Text <> '' then
          fMxCheque.edtValor.Text := edtValorPago.Text
        else
          fMxCheque.edtValor.Text := edtValorTitulo.Text;
      end;
      fMxCheque.edtTituloCNC.Text:= inttostr(DM.Configuracao1.CodigoCNC);
      fMxCheque.edtTitulo.Text := IntToStr(fMxPagar.Titulo_a_pagar1.CodigoTPG);
    end
    else
    Begin
      fMxCheque.edtTitulo.Enabled := False;
      fMxCheque.Entidade.Close;
      fMxCheque.Entidade.SQL.Text := 'SELECT * FROM CHEQUE '+
        ' WHERE CHQ_ER=:CER'+
        ' AND CHQ_SITUACAO<>6 '+ //Cancelado
        ' AND (CHQ_COD_TITULO='+edtCodigoTPG.Text+
        ' OR (CNC_CODIGO='+edtChequeCNC.Text+
        ' AND CHQ_CODIGO='+edtCodigoCHQ.Text+'))';
      fMxCheque.Entidade.Open;
    end;
    fMxCheque.ShowModal;
  End
  else if dblTipoPagamento.KeyValue = 416 then //Depósito em Conta
    mskAgenciaConta.Enabled := True;

  if (DM.Configuracao1.Empresa <> empPetromax) and
     ( (dblTipoPagamento.KeyValue = 13) or   //Boleto ou Cartão
       (dblTipoPagamento.KeyValue = 412) or
       (dblTipoPagamento.KeyValue = 416) or

     ((DM.Configuracao1.Empresa = empMotical) and (dblTipoPagamento.KeyValue = 6)) or

     (DM.Configuracao1.Empresa = empLuciano) ) and

     ((DM.Usuario1.Permissoes.IndexOf(IntToStr(6960)) > 0) or
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(6970)) > 0)) then //Alterar Data Pag.
    mskDataPagamento.Enabled := True
  else
  Begin
    mskDataPagamento.Enabled := False;
    mskDataPagamento.Text := DatetoStr(DM.Configuracao1.Data);
  end;

  if ((dblTipoPagamento.KeyValue = 6) or     //Cheque
     (dblTipoPagamento.KeyValue = 13) or     //Cartão
     (dblTipoPagamento.KeyValue = 412) or    //Boleto
     (dblTipoPagamento.KeyValue = 416)) or //Depósito em Conta
     (DM.Configuracao1.Empresa = empPetromax) then
    ckbGerarMovimento.Checked := False
  else
    ckbGerarMovimento.Checked := True;
  if not edtCodigoCHQ.Enabled then
    edtCodigoCHQ.Text := '0';
  if not mskAgenciaConta.Enabled then
    mskAgenciaConta.Clear;

  //Decidiram Solange e Luciano (27/09/2004) que Pagamento e Recebimento de Títulos no CPD não geram Movimento de Caixa
  if (DM.Configuracao1.Empresa = empLuciano) and
     (DM.Configuracao1.CodigoCNC = 1) then //CPD
    ckbGerarMovimento.Checked := False;

end;

procedure TfMxSPagBai.ckbGerarMovimentoClick(Sender: TObject);
begin
  if ckbGerarMovimento.Checked then
  Begin
    mskDataPagamento.Enabled := False;
    mskDataPagamento.Text := DatetoStr(DM.Configuracao1.Data);
  end;  
end;

procedure TfMxSPagBai.bitPagarParcialClick(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtCodigoCHQ.Text) then
    edtCodigoCHQ.Text := '0';
    
  If Arredonda(StrToFloat(edtValorPago.Text))>=Arredonda(StrToFloat(edtValorTitulo.Text)) then
    raise exception.create('Não é possível efetuar pagamento parcial com o valor igual ou superiao ao da parcela!');

  if not VerificaDataBranco(mskDataPagamento.Text) then
    Raise Exception.Create('Data de Pagamento inválida!');

  if (ABS(StrToDate(mskDataPagamento.Text) - (DM.Configuracao1.Data)) > 5) then
  Begin
    If MessageDlg('Atenção!'#13+
                  'Data do Pagamento alterada >5 dias.'+#13+
                  'Deseja continuar!',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6970)) < 0 then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=34;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if usuario1.Permissoes.IndexOf(IntToStr(6970)) < 0 then
          begin
            free;
            raise Exception.Create('Usário não tem permissão para alterar Data Pagamento > 5!');
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
  else if (ABS(StrToDate(mskDataPagamento.Text) - (DM.Configuracao1.Data)) > 0) then
  Begin
    If MessageDlg('Atenção!'#13+
                  'Data do Pagamento alterada.'+#13+
                  'Deseja continuar!',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(6960)) < 0 then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        onClose:=nil;
        Tag:=34;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        begin
          if usuario1.Permissoes.IndexOf(IntToStr(6960)) < 0 then
          begin
            free;
            raise Exception.Create('Usário não tem permissão para alterar Data Pagamento!');
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

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(2230)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=34;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(2230)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para pagamento Parcial TPG!');
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

  PagParc := True;
  bitPagarClick(Sender);
end;

end.
