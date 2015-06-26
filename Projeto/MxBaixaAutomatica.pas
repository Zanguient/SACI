(*
  Application.CreateForm(TfMxConsultaInterativa, fMxConsultaInterativa);
  with fMxConsultaInterativa do
  Begin
    tag:=0;
    lbxTitulos.Clear;
    lbxTitulos.Items.Add('SELECT * ');
    lbxTitulos.Items.Add('FROM TITULO_A_RECEBER T1 ');
    lbxTitulos.Items.Add('WHERE T1.TRC_SITUACAO=0 ');
    Showmodal;
  end;
  try
    lbxTitulos.ItemIndex := 0;
  except
  end;
  lbxTitulosClick(sender);

*)
unit MxBaixaAutomatica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Pedido_de_Compra, Parametro, Titulo_receber, Variants,
  Pedido_de_Venda, Menus, Conta_de_Caixa, Informacoes, CentroCusto,
  AgenteFin, Forma_de_Pagamento, Vendedor;

type
  TfMxBaixaAutomatica = class(TForm)
    Panel14: TPanel;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
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
    Cliente1: TCliente;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    dblTipoDocumento: TDBLookupComboBox;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    Label14: TLabel;
    dblContaDeCaixaAgendada: TDBLookupComboBox;
    MainMenu1: TMainMenu;
    Titulos1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    CentroCusto1: TCentroCusto;
    edtBoleto: TEdit;
    Label9: TLabel;
    CentroCusto2: TCentroCusto;
    Panel5: TPanel;
    bitCancelar: TBitBtn;
    Label15: TLabel;
    edtTotalTitulos: TEdit;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    Label17: TLabel;
    dblAgenteFinanceiro: TDBLookupComboBox;
    bitConfirmar: TBitBtn;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    lbxTitulos: TListBox;
    Label31: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    mskDataPag: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    dblTipoPagamentoEfetuado: TDBLookupComboBox;
    ckbGerarMovimento: TCheckBox;
    dblContaDeCaixaRecebida: TDBLookupComboBox;
    Label11: TLabel;
    edtDesconto: TEdit;
    Label16: TLabel;
    edtValorPago: TEdit;
    Parametro3: TParametro;
    DSParametro3: TDataSource;
    Conta_de_Caixa2: TConta_de_Caixa;
    DSConta_de_Caixa2: TDataSource;
    Conta_de_Caixa3: TConta_de_Caixa;
    Parametro4: TParametro;
    AgenteFin2: TAgenteFin;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Confirmar1: TMenuItem;
    Cancelar2: TMenuItem;
    SpeedButton1: TSpeedButton;
    edtCodigoCNC: TEdit;
    Titulo_receber1: TTitulo_receber;
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure lbxTitulosClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure dblTipoPagamentoEfetuadoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    UltDtVencimento:TDateTime;
    Estado: Integer;
    ValorAnteriorPG : Double;
    procedure AtualizaCamposTitulo(Habilitar: Boolean; DesabilitaTudo:Boolean=False);
  public
    Cancelar:Boolean;
    procedure CalcularTotal;
  end;

var
  fMxBaixaAutomatica: TfMxBaixaAutomatica;

implementation
Uses UDM, funcoes, CdCliente, DigSenha;

{$R *.DFM}

procedure TfMxBaixaAutomatica.SB_AltClick(Sender: TObject);
begin
  if lbxTitulos.Count <= 0 then
    raise exception.Create('Não há dados a serem alterados!');
  If (DM.Configuracao1.Empresa <> empLBM) and
     (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Não pode criar Títulos de outro centro!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4510)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para Alterar registro!');
  if Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],124,1)) = '1' then
    Raise Exception.Create('Título criado nessa tela não pode ser alterado!');
  UltDtVencimento := StrToDate(mskVencimento.Text);

  ValorAnteriorPG := StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],87,12)));

  Estado := 2;
  AtualizaCamposTitulo(True);
end;

procedure TfMxBaixaAutomatica.SB_ExcClick(Sender: TObject);
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

  edtTotalTitulos.Text := format('%.2f',[StrToFloat(edtTotalTitulos.Text)-
                                         StrToFloat(edtValor.Text)]);

  lbxTitulos.Items.Delete(lbxTitulos.ItemIndex);
  try
    lbxTitulos.ItemIndex := 0;
  except
  end;
end;

procedure TfMxBaixaAutomatica.SB_SalvaClick(Sender: TObject);
var
  sCentro, mensagem: string;
  PosicaoItem, iGerarMov : integer;
begin
  mensagem := '';
  if not VerificaDataBranco(mskVencimento.Text) then
    mensagem := mensagem + 'Data de Vencimento inválida!'+#13;
  if dblContaDeCaixaAgendada.Text = '' then
    mensagem := mensagem + 'Conta de Caixa inválida!'+#13;
  if dblTipoDocumento.Text = '' then
    mensagem := mensagem + 'Tipo de documento inválido!'+#13;
  if dblTipoPagamento.Text = '' then
    mensagem := mensagem + 'Tipo de Pagamento inválido!'+#13;
  if dblAgenteFinanceiro.Text = '' then
    mensagem := mensagem + 'Agente Financeiro inválido!'+#13;
  if not VerificaFloatBranco(edtValor.Text) then
    mensagem := mensagem + 'Valor do Título inválido!'+#13;
  if not VerificaInteiroBranco(edtBoleto.Text) then
    mensagem := mensagem + 'Número do Boleto inválido!'+#13;
  if mensagem <> '' then
    Raise Exception.Create(mensagem);

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
          Tag:=20;
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

  if ckbGerarMovimento.Checked then
    iGerarMov := 1
  else
    iGerarMov := 0;

  //Definir Centro de Custo
  with CentroCusto2 do
  Begin
    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      if Active = False then
        Open;
      if (StrToInt(edtCodigoCNC.Text) > 0) then
      Begin
        if (StrToInt(edtCodigoCNC.Text) <> CodigoCNC) then
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := StrToInt(edtCodigoCNC.Text);
          Open;
        end;
        sCentro := RazaoSocial;
      end
      else
        sCentro := '';
    end
    else //LBM
    Begin
      if StrToInt(edtCodigoCNC.Text) <= 0 then
        sCentro := 'ERRO'
      else if StrToInt(edtCodigoCNC.Text) = 1 then
        sCentro := 'Matriz'
      else
        sCentro := 'Filial'+edtCodigoCNC.Text;
    end;
  end;

  lbxTitulos.Items.Strings[PosicaoItem] := ' '+
    PreencheEspaco(15,sCentro)+' '+ //2
    PreencheEspaco(10,edtCodigoTRC.Text)+' '+ // 18
    PreencheEspaco(10,edtSequencia.Text)+' '+ // 29
    PreencheEspaco(10,edtNumeroDocumento.Text)+' '+ // 40
    PreencheEspaco(11,edtBoleto.Text)+' '+ // 51
    PreencheEspaco(10,mskVencimento.Text)+' '+ // 63
    PreencheEspacoEsq(12,format('%.2f',[StrToFloat(edtValor.Text)]))+' '+ // 74
    PreencheEspacoEsq(12,format('%.2f',[StrToFloat(edtValorPago.Text)]))+' '+ // 87
    PreencheEspaco(5,IntToStr(dblContaDeCaixaAgendada.KeyValue))+' '+ // 100
    PreencheEspaco(5,IntToStr(dblTipoDocumento.KeyValue))+' '+ // 106
    PreencheEspaco(5,IntToStr(dblTipoPagamento.KeyValue))+' '+ // 112
    PreencheEspaco(5,IntToStr(dblAgenteFinanceiro.KeyValue))+' '+ //118
    PreencheEspaco(1,IntToStr(Estado))+' '+ //124
    PreencheEspaco(5,IntToStr(dblTipoPagamentoEfetuado.KeyValue))+' '+ // 126
    PreencheEspaco(5,IntToStr(dblContaDeCaixaRecebida.KeyValue))+' '+ // 132
    PreencheEspaco(1,IntToStr(iGerarMov))+' '+ //138
    PreencheEspaco(3,edtCodigoCNC.Text); //140

  lbxTitulos.ItemIndex := Posicaoitem;

  if ValorAnteriorPG <>  StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],87,12))) then
    edtTotalTitulos.Text := format('%.2f',[StrToFloat(edtTotalTitulos.Text)+
                                           StrToFloat(edtValorPago.Text)-ValorAnteriorPG]);

  AtualizaCamposTitulo(False);

end;

procedure TfMxBaixaAutomatica.SB_CancClick(Sender: TObject);
begin
  Estado := 0;
  AtualizaCamposTitulo(False);
  lbxTitulosClick(sender);
end;


procedure TfMxBaixaAutomatica.FormCreate(Sender: TObject);
begin
  Parametro1.Open;
  Parametro2.Open;
  Parametro3.Open;
  AgenteFin1.Open;
  Conta_de_Caixa1.Open;
  Conta_de_Caixa2.Open;
  CentroCusto2.Open;
end;

procedure TfMxBaixaAutomatica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cliente1.Close;
  Parametro1.Close;
  Parametro2.Close;
  Parametro3.Close;
  AgenteFin1.Close;
  Conta_de_Caixa1.Close;
  Conta_de_Caixa2.Close;
  CentroCusto2.Close;
  Action:=Cafree;
end;
procedure TfMxBaixaAutomatica.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;


procedure TfMxBaixaAutomatica.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto1.Open;
  mskDataPag.Text := DateToStr(DM.Configuracao1.Data);
  if (DM.Usuario1.Permissoes.IndexOf(IntToStr(6050)) > 0) or
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(6060)) > 0) then //Alterar Data Pag.
    mskDataPag.Enabled := True;
end;

procedure TfMxBaixaAutomatica.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close
  else if (edtValor.Focused)and(Key = '.') then
    Key := ',';
end;

procedure TfMxBaixaAutomatica.bitConfirmarClick(Sender: TObject);
var
  i, CaixaCNC : integer;
  Trans : Boolean;
  vDesc, vJuros: Double;
begin
  vDesc := 0;
  vJuros := 0;
  if not VerificaDataBranco(mskDataPag.Text) then
  Begin
    ShowMessage('Data de Pagamento inválida!');
    Exit;
  end;
  if StrToDate(mskDataPag.Text) > DM.Configuracao1.Data then
  Begin
    ShowMessage('Data de Pagamento superior a atual!');
    Exit;
  end;

  if (DM.Usuario1.Permissoes.IndexOf(IntToStr(6050)) > 0) and
     (DM.Usuario1.Permissoes.IndexOf(IntToStr(6060)) < 0) and
     (DM.Configuracao1.Data-StrToDate(mskDataPag.Text) > 5) then //Alterar Data Pag.
  Begin
    ShowMessage('Usuário não tem permissão para essa data de Pagamento!');
    Exit;
  end;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  If MessageDlg('Atenção!!!'+#13+'Esse processo irá Baixar vários títulos.'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  try
    AtualizaCamposTitulo(False, True);
    for i := 0 to lbxTitulos.Items.Count-1 do
    Begin
      with Conta_de_Caixa3 do
      Begin
        Close;
        ParamByName('CCX_CODIGO').asInteger := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],100,5)));
        Open;
        if IsEmpty then
        Begin
          lbxTitulos.ItemIndex := i;
          lbxTitulosClick(sender);
          ShowMessage('Título sem Conta de Caixa Agendada!');
          Exit;
        end;
        Close;
        ParamByName('CCX_CODIGO').asInteger := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],132,5)));
        Open;
        if IsEmpty then
        Begin
          lbxTitulos.ItemIndex := i;
          lbxTitulosClick(sender);
          ShowMessage('Título sem Conta de Caixa Recebida!');
          Exit;
        end;
      end;
      with Parametro4 do
      Begin
        Close;
        ParamByName('PAR_CODIGO').asInteger := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],112,5)));
        Open;
        if IsEmpty then
        Begin
          lbxTitulos.ItemIndex := i;
          lbxTitulosClick(sender);
          ShowMessage('Título sem Tipo de Pagamento Agendado!');
          Exit;
        end;
        Close;
        ParamByName('PAR_CODIGO').asInteger := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],126,5)));
        Open;
        if IsEmpty then
        Begin
          lbxTitulos.ItemIndex := i;
          lbxTitulosClick(sender);
          ShowMessage('Título sem Tipo de Pagamento Efetuado!');
          Exit;
        end;
      end;
      with AgenteFin2 do
      Begin
        Close;
        ParamByName('AGF_CODIGO').asInteger := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],118,5)));
        Open;
        if IsEmpty then
        Begin
          lbxTitulos.ItemIndex := i;
          lbxTitulosClick(sender);
          ShowMessage('Título sem Agente Financeiro!');
          Exit;
        end;
      end;
      if (StrToDate(mskDataPag.Text) <> DM.Configuracao1.Data) and
         (StrToInt(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],138,1))) = 1) then
      Begin
        lbxTitulos.ItemIndex := i;
        lbxTitulosClick(sender);
        ShowMessage('Título com movimento de Caixa não pode ser baixado com data alterada!');
        Exit;
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

        for i := 0 to lbxTitulos.Items.Count-1 do
        Begin
          Titulo_receber1.Close;
          Titulo_receber1.ParamByName('CNC_CODIGO').asInteger := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],140,1)));
          Titulo_receber1.ParamByName('TRC_CODIGO').asInteger := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],18,10)));
          Titulo_receber1.Open;
          if StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],74,12))) >     //Valor
             StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],87,12))) then  //Valor Pg
            vDesc  := StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],74,12))) - //Valor
                      StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],87,12)))   //Valor PG
          else if StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],74,12))) <     //Valor
                  StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],87,12))) then
            vJuros := StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],87,12))) - //Valor PG
                      StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],74,12)));  //Valor

          if not Titulo_receber1.PagarTitulo(
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],140,1))),   //CdCNC
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],18,10))),   //CdTRC
                   0, //CdFUN
                   StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],87,12))), //Valor Pag.
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],126,5))), //Tipo Pag.
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],132,5))), //CCX Rec.
                   2, //Situação
                   0, //CHQCNC
                   0, //CHQ
                   0, //MCCCNC
                   0, //MCC
                   StrToDate(mskDataPag.Text), //Data Pagamento
                   0, //Data do Cheque (Quando é zero ele salva NULL)
                   'BAIXA AUTOMÁTICA', //Obs.
                   0, //Crédito
                   vDesc, //Desconto
                   vJuros, //Juros
                   (Trim(Copy(lbxTitulos.Items.Strings[i],138,1)) = '1'),
                   False (*PagamentoParcial*)) then //Gerar Mov.
            Raise Exception.Create('');

          if (Trim(Copy(lbxTitulos.Items.Strings[i],138,1)) = '1') then //Gerar Movimento
          Begin
            DM.Caixa1.Close;
            DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
            DM.Caixa1.Open;
            if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],100,5))), //CCX Agendada
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],132,5))), //CCX Recebida
                   DM.Configuracao1.CodigoCAX, //CAX
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],126,5))), //Tipo Pag. Efetuado
                   Titulo_receber1.Tipo, //Tipo
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],140,1))), //CdCNC
                   0 (*CdCHQCNC*),
                   0 (*CdCHQ*),
                   'TRC:'+Trim(Copy(lbxTitulos.Items.Strings[i],18,10)), //Desc. CdTRC
                   '1' (*Flag*),
                   Trim(Copy(lbxTitulos.Items.Strings[i],40,10)), //Número
                   '', //Observação
                   Trim(Copy(lbxTitulos.Items.Strings[i],29,10)), //Sequência
                   'C', StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],87,12))), //Valor Pag.
                   vDesc,  //Desconto
                   vJuros, //Juros
                   0(*CredCli*),
                   Titulo_receber1.Valor,(*ValorDoc*)
                   StrToDate(mskDataPag.Text), //Data Pagamento
                   StrToDate(mskDataPag.Text), //Competência
                   0(*DtCheque*),
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],18,10))), //CdTRC
                   StrToInt(Trim(Copy(lbxTitulos.Items.Strings[i],140,1))), //CdCNC
                   'T') then //Data Competência
              Raise Exception.Create('')
            else if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
              DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Movimento de Caixa',
                'Baixa Aut. Titulo: '+Trim(Copy(lbxTitulos.Items.Strings[i],18,10))+#13+#10+
                ' Valor: R$ '+Trim(Copy(lbxTitulos.Items.Strings[i],87,12))); //CdTRC
          end;
          DM.Movimento_caixa1.GeraLog(6120,Titulo_receber1.CodigoCNC,Titulo_receber1.CodigoTRC);
        end;
        If DM.Configuracao1.ControleTransacao then
          Commit;
        ShowMessage('Parcelas Baixadas!');
        Close;
      except
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
          end;
      end;
    end;
  finally
    AtualizaCamposTitulo(False, False);
  end;
end;

procedure TfMxBaixaAutomatica.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxBaixaAutomatica.AtualizaCamposTitulo(Habilitar: Boolean; DesabilitaTudo:Boolean=False);
begin
  dblContaDeCaixaAgendada.Enabled  := Habilitar;
  edtNumeroDocumento.Enabled       := Habilitar;
  edtSequencia.Enabled             := Habilitar;
  dblTipoDocumento.Enabled         := Habilitar;
  dblTipoPagamento.Enabled         := Habilitar;
  mskVencimento.Enabled            := Habilitar;
  edtValor.Enabled                 := Habilitar;
  edtDesconto.Enabled              := Habilitar;
  edtValorPago.Enabled             := Habilitar;
  edtBoleto.Enabled                := Habilitar;
  dblAgenteFinanceiro.Enabled      := Habilitar;
  dblTipoPagamentoEfetuado.Enabled := Habilitar;
  dblContaDeCaixaRecebida.Enabled  := Habilitar;

  lbxTitulos.Enabled   := (not Habilitar) and (not DesabilitaTudo);
  Alterar1.Enabled     := (not Habilitar) and (not DesabilitaTudo);
  Excluir1.Enabled     := (not Habilitar) and (not DesabilitaTudo);
  Salvar1.Enabled      := Habilitar;
  Cancelar1.Enabled    := Habilitar;
  Localizar1.Enabled   := (not Habilitar) and (not DesabilitaTudo);
  Confirmar1.Enabled   := (not Habilitar) and (not DesabilitaTudo);
  Cancelar1.Enabled    := (not Habilitar) and (not DesabilitaTudo);
  SB_Alt.Enabled       := (not Habilitar) and (not DesabilitaTudo);
  SB_Exc.Enabled       := (not Habilitar) and (not DesabilitaTudo);
  SB_Salva.Enabled     := Habilitar;
  SB_Canc.Enabled      := Habilitar;
  bitConfirmar.Enabled := (not Habilitar) and (not DesabilitaTudo);
  bitCancelar.Enabled  := (not Habilitar) and (not DesabilitaTudo);
end;

procedure TfMxBaixaAutomatica.lbxTitulosClick(Sender: TObject);
begin
  if lbxTitulos.ItemIndex < 0 then
  Begin
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
    dblTipoPagamentoEfetuado.KeyValue := -1;
    dblContaDeCaixaRecebida.KeyValue := -1;
    ckbGerarMovimento.Checked := False;
    edtDesconto.Clear;
    edtValorPago.Clear;
    Exit;
  end;
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
    edtValorPago.Text := Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],87,12));
  except
    edtValorPago.Clear;
  end;
  try
    edtDesconto.Text := format('%.2f',[StrToFloat(edtValor.Text)-StrToFloat(edtValorPago.Text)]);
  except
    edtDesconto.Clear;
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
  try
    dblTipoPagamentoEfetuado.KeyValue := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],126,5)));
  except
    dblTipoPagamentoEfetuado.KeyValue := -1;
  end;
  try
    dblContaDeCaixaRecebida.KeyValue := StrToInt(Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],132,5)));
  except
    dblContaDeCaixaRecebida.KeyValue := -1;
  end;
  try
    ckbGerarMovimento.Checked := (Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],138,1)) = '1');
  except
    ckbGerarMovimento.Checked := False;
  end;
  try
    edtCodigoCNC.Text := Trim(Copy(lbxTitulos.Items.Strings[lbxTitulos.ItemIndex],140,3));
  except
    edtCodigoCNC.Clear;
  end;
end;

procedure TfMxBaixaAutomatica.edtDescontoChange(Sender: TObject);
begin
  If (Trim(edtDesconto.Text)<>'0') and (SB_Salva.Enabled) then
  Begin
    If not VerificaFloat(edtDesconto.Text) then
    Begin
      edtDesconto.SetFocus;
      Raise Exception.Create('Valor do desconto inválido!');
    end;
    edtValorPago.Text := Format('%.2f', [StrToFloat(edtValor.Text)-StrToFloat(edtDesconto.Text)])
  End;
end;

procedure TfMxBaixaAutomatica.CalcularTotal;
var
  i, ItemSelecionado: integer;
begin
  if lbxTitulos.ItemIndex > 0 then
    ItemSelecionado := lbxTitulos.ItemIndex
  else
    ItemSelecionado := 0;

  edtTotalTitulos.Text := '0,00';

  if lbxTitulos.Items.Count <= 1 then
    Exit;

  for i := 0 to lbxTitulos.Items.Count-1 do
    edtTotalTitulos.Text := format('%.2f',[StrToFloat(edtTotalTitulos.Text)+
      StrToFloat(Trim(Copy(lbxTitulos.Items.Strings[i],87,12)))]);

  lbxTitulos.ItemIndex := ItemSelecionado;
end;

procedure TfMxBaixaAutomatica.dblTipoPagamentoEfetuadoClick(
  Sender: TObject);
begin
  if (DM.Configuracao1.Empresa = empLBM) and
     ((dblTipoPagamentoEfetuado.KeyValue = 13) or   //Boleto ou Cartão ou Depósito
     (dblTipoPagamentoEfetuado.KeyValue = 412) or
     (dblTipoPagamentoEfetuado.KeyValue = 416)) then
    ckbGerarMovimento.Checked := False
  else
    ckbGerarMovimento.Checked := True;
end;

procedure TfMxBaixaAutomatica.SpeedButton1Click(Sender: TObject);
begin
  lbxTitulos.Clear;
  lbxTitulosClick(sender);
  
  edtTotalTitulos.Text := '0,00';
end;

end.
