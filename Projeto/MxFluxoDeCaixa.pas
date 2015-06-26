unit MxFluxoDeCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Conta_de_Caixa, DB,
  DBTables, SQuery, Parametro, CentroCusto, Mask, Usuario, Caixa;

type
  TfMxFluxoDeCaixa = class(TForm)
    Panel2: TPanel;
    SB_Fechar: TBitBtn;
    SB_Confirmar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    DSConta_de_Caixa1: TDataSource;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    Panel3: TPanel;
    rdbMovimentoDoDia: TRadioButton;
    rdbMovimentoPeriodo: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    rdgOficial: TRadioButton;
    rdgNaoOficial: TRadioButton;
    rdbTodos: TRadioButton;
    grbEstilo: TGroupBox;
    rdbModelo2: TRadioButton;
    rdbModelo1: TRadioButton;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    ckbSintetico: TCheckBox;
    cmbOrdem: TComboBox;
    ckbExibirTotais: TCheckBox;
    ckbAcumularClienteBalcao: TCheckBox;
    ckbExibirContaAgendada: TCheckBox;
    ckbNaoExibirZerados: TCheckBox;
    Label4: TLabel;
    ckbCodigoCCX: TCheckBox;
    dblGrupoCC: TDBLookupComboBox;
    ckbGrupo: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    ckbTipo: TCheckBox;
    cmbTipo: TComboBox;
    dblCodigoCCX: TDBLookupComboBox;
    ckbNumero: TCheckBox;
    edtNumero: TEdit;
    ckbCodigoTitulo: TCheckBox;
    edtCodigoTitulo: TEdit;
    ckbDescricao: TCheckBox;
    edtDescricao: TEdit;
    ckbValor: TCheckBox;
    cmbValorTitulo: TComboBox;
    edtValorTitulo: TEdit;
    ckbTipoPag: TCheckBox;
    dblTipoPag: TDBLookupComboBox;
    cmbTipoPag: TComboBox;
    ckbExibirCodigoCLI: TCheckBox;
    ckbSomenteComCredito: TCheckBox;
    ckbNaoAgruparCaixa: TCheckBox;
    Label5: TLabel;
    ckbValor2: TCheckBox;
    cmbValorTitulo2: TComboBox;
    edtValorTitulo2: TEdit;
    Usuario1: TUsuario;
    DSUsuario1: TDataSource;
    ckbCodigoUSU: TCheckBox;
    dblCodigoUSU: TDBLookupComboBox;
    ckbCodigoCAX: TCheckBox;
    dblCodigoCAX: TDBLookupComboBox;
    Caixa1: TCaixa;
    DSCaixa1: TDataSource;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbCodigoCCXClick(Sender: TObject);
    procedure ckbGrupoClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure rdbModelo1Click(Sender: TObject);
    procedure ckbTipoClick(Sender: TObject);
    procedure rdbMovimentoDoDiaClick(Sender: TObject);
    procedure ckbNumeroClick(Sender: TObject);
    procedure ckbCodigoTituloClick(Sender: TObject);
    procedure ckbDescricaoClick(Sender: TObject);
    procedure ckbValorClick(Sender: TObject);
    procedure ckbTipoPagClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_FecharClick(Sender: TObject);
    procedure ckbValor2Click(Sender: TObject);
    procedure ckbCodigoUSUClick(Sender: TObject);
    procedure ckbCodigoCAXClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    cancelar: boolean;
  end;

var
  fMxFluxoDeCaixa: TfMxFluxoDeCaixa;

implementation

uses UFluxoCaixaDia, UDM, Funcoes, UFluxoCaixaDiaLBM, UFluxoCaixa,
  DigSenha;

{$R *.DFM}


procedure TfMxFluxoDeCaixa.SB_ConfirmarClick(Sender: TObject);
var
  DataINI, DataFIM, Oficial, sFiltros, CdCAX, CCX, sGrupo, CdCNC, sTipo, sTipoPG, sNumero,
    CdTitulo, sDesc, sValor, sValor2, sNaoExibirZerados, sSomenteComCredito, CdUSU,
    sOrdem: string;
begin
  sFiltros := '';
  CdCAX    := '';
  CCX      := '';
  sGrupo   := '';
  CdCNC    := '';
  sTipo    := '';
  sSomenteComCredito := '';
  sTipoPG  := '';
  sNumero  := '';
  CdTitulo := '';
  Oficial  := '';
  sDesc    := '';
  sValor   := '';
  sValor2  := '';
  CdUSU    := '';
  sNaoExibirZerados := '';

  //Permitir imprimir somente após o Fechamento
  if (DM.Usuario1.Permissoes.IndexOf(IntToStr(8840)) < 0) and //Fluxo antes do Fechamento
     (rdbMovimentoDoDia.Checked and
      (Trunc(DateTimePicker1.Date) = Trunc(DM.Configuracao1.Data))) or
     (rdbMovimentoPeriodo.Checked and
      ((VerificaDataBranco(mskDataINI.Text) and (StrToDate(mskDataINI.Text) <= DM.Configuracao1.Data)) or
       (not VerificaDataBranco(mskDataINI.Text))) and
      ((VerificaDataBranco(mskDataFIM.Text) and (StrToDate(mskDataFIM.Text) >= DM.Configuracao1.Data)) or
       (not VerificaDataBranco(mskDataFIM.Text)))) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 MVC_CODIGO '+
        ' FROM MOVIMENTO_DE_CAIXA '+
        ' WHERE MVC_DATA>="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND MVC_DATA<"'+MesDia(DM.Configuracao1.Data+1)+'" '+
        ' AND CCX_CODIGO='+IntToStr(DM.Configuracao1.ContaFechaCaixa);
      Open;
      if isEmpty then
      Begin
        If MessageDlg('Ainda não foi realizado o fechamento de caixa de hoje!'+#13+
                      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        if DM.Usuario1.Permissoes.IndexOf(IntToStr(8840)) < 0 then //Fluxo antes do Fechamento
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=45;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            begin
              if usuario1.Permissoes.IndexOf(IntToStr(8840)) < 0 then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para Fluxo antes do Fechamento!');
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

  if rdgOficial.Checked then
  Begin
    Oficial := ' AND (MVC_TIT_NUMERO IS NOT NULL AND MVC_TIT_NUMERO <> "") ';
    sFiltros := sFiltros + ' (Of.)';
  end
  Else if rdgNaoOficial.Checked then
  Begin
    Oficial := ' AND (MVC_TIT_NUMERO IS NULL OR MVC_TIT_NUMERO = "") ';
    sFiltros := sFiltros + ' (N.Of.)';
  end;

  if ckbCodigoCAX.Checked then
    if dblCodigoCAX.Text = '' then
      raise Exception.Create('Caixa inválido!')
    else
    Begin
      CdCAX:=' AND (T1.CAX_CODIGO='+IntToStr(dblCodigoCAX.KeyValue)+') ';
      sFiltros := sFiltros + ' (CAX:'+dblCodigoCAX.Text+')';
    end;

  if ckbCodigoCCX.Checked then
    if dblCodigoCCX.Text = '' then
      raise Exception.Create('Conta de Caixa inválida!')
    else
    Begin
      CCX:=' AND (T1.CCX_CODIGO='+IntToStr(dblCodigoCCX.KeyValue)+') ';
      sFiltros := sFiltros + ' (CCX:'+dblCodigoCCX.Text+')';
    end;

  if ckbGrupo.Checked then
    if dblGrupoCC.Text = '' then
      raise Exception.Create('Grupo de Conta de Caixa inválida!')
    else
    Begin
      sGrupo:=' AND (T1.CCX_CODIGO IN '+
        '(SELECT CCX_CODIGO FROM CONTA_DE_CAIXA '+
        ' WHERE CCX_GRUPO='+IntToStr(dblGrupoCC.KeyValue)+')) ';
      sFiltros := sFiltros + ' (GRUPO CCX:'+dblGrupoCC.Text+')';
    end;

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      CdCNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+'-'+dblCodigoCNC.Text+')';
    end;

  if ckbTipo.Checked then
  Begin
    case cmbTipo.ItemIndex of
      0: Begin
           sTipo:=' AND (T1.MVC_DC="C") ';
           sFiltros := sFiltros + ' (Credito)';
         end;
      1: Begin
           sTipo:=' AND (T1.MVC_DC="D") ';
           sFiltros := sFiltros + ' (Debito)';
         end;
    end;
  end;

  if ckbTipoPag.Checked then
    if dblTipoPag.Text = '' then
      raise Exception.Create('Tipo de Pagamento inválido!')
    else
    Begin
      case cmbTipoPag.ItemIndex of
        0: Begin
             sTipoPG:=' AND (T1.MVC_TIPO_PGTO='+IntToStr(dblTipoPag.KeyValue)+') ';
             sFiltros := sFiltros + '(TipoPag:='+dblTipoPag.Text+')';
           end;
        1: Begin
             sTipoPG:=' AND (T1.MVC_TIPO_PGTO<>'+IntToStr(dblTipoPag.KeyValue)+') ';
             sFiltros := sFiltros + '(TipoPag:<>'+dblTipoPag.Text+')';
           end;
        else
          Raise exception.Create('Condição de Tipo de Pagamento inválido!');
      end;
    end;

  if ckbNumero.Checked then
  Begin
    sNumero:=' AND (T1.MVC_TIT_NUMERO="'+edtNumero.Text+'") ';
    sFiltros := sFiltros + ' (Numero:'+edtNumero.Text+')';
  end;

  if ckbDescricao.Checked then
  Begin
    sDesc:=' AND (T1.MVC_DESCRICAO LIKE "%'+edtDescricao.Text+'%") ';
    sFiltros := sFiltros + ' (Descricao:'+edtDescricao.Text+')';
  end;

  if ckbValor.Checked then
  Begin
    if not VerificaFloatBranco(edtValorTitulo.Text) then
    Begin
      edtValorTitulo.SetFocus;
      Raise Exception.Create('Valor do Título inválido!');
    end
    else
      case cmbValorTitulo.ItemIndex of
        0: Begin
             sValor :=' AND (T1.MVC_VALOR < '+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:<'+edtValorTitulo.Text+') ';
           end;
        1: Begin
             sValor :=' AND (T1.MVC_VALOR = '+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:='+edtValorTitulo.Text+') ';
           end;
        2: Begin
             sValor :=' AND (T1.MVC_VALOR > '+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:>'+edtValorTitulo.Text+') ';
           end;
        3: Begin
             sValor :=' AND (T1.MVC_VALOR <='+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:<='+edtValorTitulo.Text+') ';
           end;
        4: Begin
             sValor :=' AND (T1.MVC_VALOR >='+VirgPonto(edtValorTitulo.Text)+') ';
             sFiltros := sFiltros + ' (Valor:>='+edtValorTitulo.Text+') ';
           end;
      end;
  end;

  if ckbValor2.Checked then
  Begin
    if not VerificaFloatBranco(edtValorTitulo2.Text) then
    Begin
      edtValorTitulo2.SetFocus;
      Raise Exception.Create('Valor do Título inválido!');
    end
    else
      case cmbValorTitulo2.ItemIndex of
        0: Begin
             sValor2 :=' AND (T1.MVC_VALOR < '+VirgPonto(edtValorTitulo2.Text)+') ';
             sFiltros := sFiltros + ' (Valor:<'+edtValorTitulo2.Text+') ';
           end;
        1: Begin
             sValor2 :=' AND (T1.MVC_VALOR = '+VirgPonto(edtValorTitulo2.Text)+') ';
             sFiltros := sFiltros + ' (Valor:='+edtValorTitulo2.Text+') ';
           end;
        2: Begin
             sValor2 :=' AND (T1.MVC_VALOR > '+VirgPonto(edtValorTitulo2.Text)+') ';
             sFiltros := sFiltros + ' (Valor:>'+edtValorTitulo2.Text+') ';
           end;
        3: Begin
             sValor2 :=' AND (T1.MVC_VALOR <='+VirgPonto(edtValorTitulo2.Text)+') ';
             sFiltros := sFiltros + ' (Valor:<='+edtValorTitulo2.Text+') ';
           end;
        4: Begin
             sValor2 :=' AND (T1.MVC_VALOR >='+VirgPonto(edtValorTitulo2.Text)+') ';
             sFiltros := sFiltros + ' (Valor:>='+edtValorTitulo2.Text+') ';
           end;
      end;
  end;

  if ckbCodigoUSU.Checked then
  Begin
    if dblCodigoUSU.Text = '' then
      Raise exception.Create('Usuário inválido!')
    else
    Begin
      CdUSU:=' AND (T1.USU_CODIGO='+IntToStr(dblCodigoUSU.KeyValue)+') ';
      sFiltros := sFiltros + ' (USU:'+IntToStr(dblCodigoUSU.KeyValue)+')';
    end;
  end;

  if ckbCodigoTitulo.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoTitulo.Text) then
      Raise exception.Create('Código do Título inválido!')
    else
    Begin
      CdTitulo:=' AND (T1.TIT_CODIGO='+edtCodigoTitulo.Text+') ';
      sFiltros := sFiltros + ' (Titulo:'+edtCodigoTitulo.Text+')';
    end;
  end;

  if ckbNaoExibirZerados.Checked then
  Begin
    sNaoExibirZerados := ' AND (T1.MVC_VALOR>0) ';
    sFiltros := sFiltros + '(NaoExibirZerados)';
  end;

  if ckbSomenteComCredito.Checked then
  Begin
    sSomenteComCredito := ' AND (T1.MVC_CRED_CLI>0 OR (T1.MVC_DC="D" AND T1.MVC_PT="D"))'; //Com Crédito ou Extorno por Devolução
    sFiltros := sFiltros + '(C/CreditoExtorno)';
  end;

  if not ckbNaoAgruparCaixa.Checked then
    sOrdem := ' T1.CAX_CODIGO ASC,'
  else
    sOrdem := '';

  case cmbOrdem.ItemIndex of
    0: sOrdem := sOrdem + ' T1.MVC_CODIGO';
    1: sOrdem := sOrdem + ' T1.MVC_DC ASC';
    2: sOrdem := sOrdem + ' T1.MVC_DC DESC';
    3: sOrdem := sOrdem + ' T1.MVC_DC ASC, T1.CCX_CODIGO ';
    4: sOrdem := sOrdem + ' T1.MVC_DC DESC, T1.CCX_CODIGO ';
  end;

  if DM.Configuracao1.Empresa = empLBM then
    sOrdem := sOrdem + ', T1.MVC_TIT_NUMERO ASC ';

  if (cmbOrdem.ItemIndex <> 0) then
    sOrdem := sOrdem + ', T1.MVC_DATA ASC ';

  If Tag = 0 then // Fluxo de Caixa
  Begin
    if rdbMovimentoDoDia.Checked then
    Begin
      if rdbModelo1.Checked then //Eletro Guerra
      Begin
        Application.CreateForm(Trpt_FluxoCaixaDia,rpt_FluxoCaixaDia);
        with rpt_FluxoCaixaDia do
        Begin
          Tag := 0;
          zrlFiltros.Caption := sFiltros;

          if ckbNaoAgruparCaixa.Checked then
          Begin
            zrbGrupoCAX.Height := 0;
            zrbSubTotal.Height := 0;
          end
          else
            zrbGrupoCAX.ForceNewPage := True;

          vSomenteCredito := ckbSomenteComCredito.Checked;

          sOficial    := Oficial;
          sCCXRel     := CCX;
          sGrupoRel   := sGrupo;
          sNumTitulo  := sNumero;
          sDescricao  := sDesc;
          sValorMVC   := sValor+sValor2;
          CdCodTitulo := CdTitulo;

          vAcumularClienteBalcao := ckbAcumularClienteBalcao.Checked;

          if not ckbExibirTotais.Checked then
          Begin
            zrlDescDinheiro.Enabled := False;
            zrlDescCheque.Enabled   := False;
            zrlDescOutros.Enabled   := False;
            zrlDescAnterior.Enabled := False;
            zrlDescAtual.Enabled    := False;
          end;

          if ckbSintetico.Checked then
          Begin
            zrbCabecalho.Height := 4;
            zrbDetalhe.Height:=0;
          end;
          zrlDiaFluxo.Caption := DateToStr(DateTimePicker1.Date);
          Entidade.Close;
          Entidade.SQL.Text := 'SELECT * FROM Movimento_de_caixa T1 '+
            ' WHERE (MVC_DATA>=:DATA_INI) '+
            ' AND (MVC_DATA<:DATA_FIM) '+
            CdUSU+Oficial+CdCAX+CCX+sGrupo+CdCNC+sTipo+sTipoPG+sNumero+CdTitulo+sDesc+sValor+sValor2+sNaoExibirZerados+sSomenteComCredito+
            ' ORDER BY '+sOrdem;
          Entidade.ParamByName('DATA_INI').AsDate := DateTimePicker1.Date;
          Entidade.ParamByName('DATA_FIM').AsDate := DateTimePicker1.Date+1;
          Entidade.Open;
          if Entidade.IsEmpty then
            Raise Exception.Create('Consulta Vazia!');
          if (report.Height > DM.Configuracao1.MaxLinhasImp) and
             (DM.Configuracao1.MaxLinhasImp <> 65) then
            report.Height := DM.Configuracao1.MaxLinhasImp;
          report.Preview;
          Close;
        end;
      end
      else //LBM
      Begin
        Application.CreateForm(Trpt_FluxoCaixaDiaLBM,rpt_FluxoCaixaDiaLBM);
        with rpt_FluxoCaixaDiaLBM do
        Begin
          zrlFiltros.Caption := sFiltros;

          if ckbNaoAgruparCaixa.Checked then
          Begin
            zrbGrupoCAX.Height := 0;
            zrbSubTotal.Height := 0;
          end
          else
            zrbGrupoCAX.ForceNewPage := True;

          vSomenteCredito := ckbSomenteComCredito.Checked;

          sOficial    := Oficial;
          sCCXRel     := CCX;
          sGrupoRel   := sGrupo;
          sNumTitulo  := sNumero;
          sDescricao  := sDesc;
          sValorMVC   := sValor+sValor2;
          CdCodTitulo := CdTitulo;

          if ckbExibirContaAgendada.Checked then
            vContaAgendada := True;

          if not ckbExibirTotais.Checked then
          Begin
            zrlDescDinheiro.Enabled := False;
            zrlDescCheque.Enabled   := False;
            zrlDescOutros.Enabled   := False;
            zrlDescAnterior.Enabled := False;
            zrlDescAtual.Enabled    := False;
          end;

          if ckbExibirCodigoCLI.Checked then
          Begin
            zrlDescCodigoCLI.Caption := 'CLI/FOR/TRN';
            zdbCodigoCLI.DataField := 'CodigoCliente';
          end
          else
          begin
            zrlDescCodigoCLI.Caption := 'Nota/Cupom';
            zdbCodigoCLI.DataField := 'Nota';
          end;

          if ckbSintetico.Checked then
          Begin
            zrbCabecalho.Height:=4;
            zrbDetalhe.Height:=0;
          end;

          zrlDiaFluxo.Caption := DateToStr(DateTimePicker1.Date);
          Entidade.Close;
          Entidade.SQL.Text := 'SELECT * FROM Movimento_de_caixa T1 '+
            ' WHERE (MVC_DATA>=:DATA_INI) '+
            ' AND (MVC_DATA<:DATA_FIM) '+
            CdUSU+Oficial+CdCAX+CCX+sGrupo+CdCNC+sTipo+sTipoPG+sNumero+CdTitulo+sDesc+sValor+sValor2+sNaoExibirZerados+sSomenteComCredito+
            ' ORDER BY '+sOrdem;
          Entidade.ParamByName('DATA_INI').AsDate := DateTimePicker1.Date;
          Entidade.ParamByName('DATA_FIM').AsDate := DateTimePicker1.Date+1;
          Entidade.Open;
          if Entidade.IsEmpty then
            Raise Exception.Create('Consulta Vazia!');
          if (report.Height > DM.Configuracao1.MaxLinhasImp) and
             (DM.Configuracao1.MaxLinhasImp <> 65) then
            report.Height := DM.Configuracao1.MaxLinhasImp;
          report.Preview;
          Close;
        end;
      end;
    end
    else //Movimento por Perído
    Begin
      DataINI := '';
      DataFIM := '';
      if not VerificaData(mskDataINI.Text) then
        Raise Exception.Create('Data inicial inválida!')
      else if not VerificaDataBranco(mskDataINI.Text) then
        mskDataINI.Text := '01/01/1900';

      if VerificaDataBranco(mskDataINI.Text) then
        DataINI := ' AND MVC_DATA>="'+MesDia(mskDataINI.Text)+'" ';

      if not VerificaData(mskDataFIM.Text) then
        Raise Exception.Create('Data final inválida!');
      if VerificaDataBranco(mskDataFIM.Text) then
        DataFIM := ' AND MVC_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';

      Application.CreateForm(Trpt_FluxoCaixa,rpt_FluxoCaixa);
      with rpt_FluxoCaixa do
      Begin
        Tag := 0;
        zrlFiltros.Caption := sFiltros;

        if ckbNaoAgruparCaixa.Checked then
        Begin
          zrbGrupoCAX.Height := 0;
          zrbRodapeGrupo.Height := 0;
        end;

        SZRLabel1.Caption := mskDataINI.Text;
        SZRLabel3.Caption := mskDataFIM.Text;

        vSomenteCredito := ckbSomenteComCredito.Checked;

        if ckbSintetico.Checked then
        Begin
          zrbDetalhe1.Height := 0;
          zrlLinha1.Height := 0;
        end;
        Entidade.Close;
        with DM.QR_Consultas do
        Begin
          //Movimentos Gerais Anteriores
          Close;
          SQL.Text := 'SELECT SUM(MVC_VALOR) AS CREDITO '+
            ' FROM MOVIMENTO_DE_CAIXA T1 '+
            ' WHERE MVC_DC="C" '+
            ' AND MVC_DATA<"'+MesDia(mskDataINI.Text)+'" '+
            CdUSU+Oficial+CdCAX+CCX+sGrupo+CdCNC+sTipo+sTipoPG+sNumero+CdTitulo+sDesc+sValor+sValor2;
          Open;
          SaldoGeral := FieldByName('CREDITO').asFloat;

          Close;
          SQL.Text := 'SELECT SUM(MVC_VALOR) AS DEBITO '+
            ' FROM MOVIMENTO_DE_CAIXA T1 '+
            ' WHERE MVC_DC="D" '+
            ' AND MVC_DATA<"'+MesDia(mskDataINI.Text)+'" '+
            CdUSU+Oficial+CdCAX+CCX+sGrupo+CdCNC+sTipo+sTipoPG+sNumero+CdTitulo+sDesc+sValor+sValor2;
          Open;
          SaldoGeral := SaldoGeral - FieldByName('DEBITO').asFloat;
        end;
        Entidade.SQL.Text := 'SELECT * '+
          ' FROM Movimento_de_caixa T1 '+
          ' WHERE MVC_CODIGO<>-10 '+
          DataINI+DataFIM+
          CdUSU+Oficial+CdCAX+CCX+sGrupo+CdCNC+sTipo+sTipoPG+sNumero+CdTitulo+sDesc+sValor+sValor2+sNaoExibirZerados+sSomenteComCredito+
          ' ORDER BY DATEPART(YEAR,T1.MVC_DATA), DATEPART(MONTH,T1.MVC_DATA), '+
          ' DATEPART(DAY,T1.MVC_DATA),'+
          sOrdem;
        Entidade.Active := true;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        ZRLabel12.Caption:=mskDataINI.Text+' a '+mskDataFIM.Text;
        if (report.Height > DM.Configuracao1.MaxLinhasImp) and
           (DM.Configuracao1.MaxLinhasImp <> 65) then
          report.Height := DM.Configuracao1.MaxLinhasImp;
        report.Preview;
        Close;
      end;
    end;
  end;
end;

procedure TfMxFluxoDeCaixa.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date := DM.Configuracao1.Data;
end;

procedure TfMxFluxoDeCaixa.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbOrdem.ItemIndex := 0;
  rdbMovimentoDoDia.Checked := True;
  rdbMovimentoDoDiaClick(sender);
  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    rdbModelo1.Checked := True;
    ckbExibirCodigoCLI.Checked := True;
    ckbAcumularClienteBalcao.Checked := True;
    ckbCodigoCNC.Checked := True;
    dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
  end
  else
  Begin
    ckbExibirContaAgendada.Checked := True;
    rdbModelo2.Checked := True;
    ckbExibirCodigoCLI.Checked := True;
    ckbExibirTotais.Checked := True;
    ckbAcumularClienteBalcao.Enabled := False;
    ckbNaoExibirZerados.Checked := True;
    cmbOrdem.ItemIndex := 1;
  end;
  rdbModelo1Click(sender);

  (*
  if f_Sistema = tsCaixa then
  begin
    DM.Usuario1.AlteraCorComponentes(self);
    rdbTodos.SetFocus;
    rdbMovimentoDoDia.Enabled := false;
    Label1.Enabled := false;
    DateTimePicker1.Enabled := false;
    rdbMovimentoPeriodo.Visible := false;
    Label2.Visible := false;
    mskDataINI.Visible := false;
    Label3.Visible := false;
    mskDataFIM.Visible := false;
    ckbCodigoCNC.Enabled := false;
    dblCodigoCNC.Enabled := false;
  end
  else*)
  begin
    rdbMovimentoDoDia.Enabled := true;
    Label1.Enabled := true;
    DateTimePicker1.Enabled := true;
    rdbMovimentoPeriodo.Visible := true;
    Label2.Visible := true;
    mskDataINI.Visible := true;
    Label3.Visible := true;
    mskDataFIM.Visible := true;
    ckbCodigoCNC.Enabled := true;
    dblCodigoCNC.Enabled := true;
  end;
  //
end;

procedure TfMxFluxoDeCaixa.ckbCodigoCCXClick(Sender: TObject);
begin
  if ckbCodigoCCX.Checked then
  Begin
    Conta_de_Caixa1.Open;
    dblCodigoCCX.Color:=clWindow;
    dblCodigoCCX.Enabled:=True;
    dblCodigoCCX.KeyValue := Conta_de_Caixa1.CodigoCCX;
    dblCodigoCCX.SetFocus;
  end
  else
  Begin
    Conta_de_Caixa1.Close;
    dblCodigoCCX.KeyValue:=-1;
    dblCodigoCCX.Color:=AlteraCorComponentes;
    dblCodigoCCX.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbGrupoClick(Sender: TObject);
begin
  if ckbGrupo.Checked then
  Begin
    Parametro2.Open;
    dblGrupoCC.Color:=clWindow;
    dblGrupoCC.Enabled:=True;
    dblGrupoCC.KeyValue := Parametro2.CodigoPAR;
    dblGrupoCC.SetFocus;
  end
  else
  Begin
    Parametro2.Close;
    dblGrupoCC.KeyValue:=-1;
    dblGrupoCC.Color:=AlteraCorComponentes;
    dblGrupoCC.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.rdbModelo1Click(Sender: TObject);
begin
  if rdbModelo1.Checked then
  Begin
    ckbExibirCodigoCLI.Checked := True;
    ckbExibirCodigoCLI.Enabled := False;
    ckbExibirContaAgendada.Checked := False;
    ckbExibirContaAgendada.Enabled := False;
  end
  else
  Begin
    ckbExibirCodigoCLI.Enabled := True;
    ckbExibirContaAgendada.Enabled := True;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    cmbTipo.Color:=clWindow;
    cmbTipo.Enabled:=True;
    cmbTipo.ItemIndex:=1;
    cmbTipo.SetFocus;
  end
  else
  Begin
    cmbTipo.Color:=AlteraCorComponentes;
    cmbTipo.ItemIndex:=-1;
    cmbTipo.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.rdbMovimentoDoDiaClick(Sender: TObject);
begin
  if rdbMovimentoDoDia.Checked then
  Begin
    DateTimePicker1.Enabled := True;
    DateTimePicker1.Color := clWindow;
    mskDataINI.Clear;
    mskDataINI.Enabled := False;
    mskDataINI.Color := AlteraCorComponentes;
    mskDataFIM.Clear;
    mskDataFIM.Enabled := False;
    mskDataFIM.Color := AlteraCorComponentes;
    rdbModelo1.Enabled := True;
    if DM.Configuracao1.Empresa <> empLBM then
      rdbModelo1.Checked := True
    else
    Begin
      rdbModelo2.Checked := True;
      ckbExibirContaAgendada.Checked := True;
    end;
    rdbModelo2.Enabled := True;
    ckbExibirCodigoCLI.Enabled := True;
    ckbExibirTotais.Enabled := True;
    rdbModelo1Click(sender);
    if rdbModelo1.Checked then
      ckbExibirContaAgendada.Enabled := False
    else
      ckbExibirContaAgendada.Enabled := True;
    try
      DateTimePicker1.SetFocus;
    except
    end;
  end
  else
  Begin
    DateTimePicker1.Enabled := False;
    DateTimePicker1.Color := AlteraCorComponentes;
    mskDataINI.Clear;
    mskDataINI.Enabled := True;
    mskDataINI.Color := clWindow;
    mskDataFIM.Enabled := True;
    mskDataFIM.Color := clWindow;
    rdbModelo1.Enabled := False;
    rdbModelo1.Checked := False;
    rdbModelo2.Enabled := False;
    rdbModelo2.Checked := False;
    ckbExibirCodigoCLI.Enabled := False;
    ckbExibirCodigoCLI.Checked := False;
    ckbExibirTotais.Enabled := False;
    ckbExibirTotais.Checked := False;
    ckbExibirContaAgendada.Checked := False;
    ckbExibirContaAgendada.Enabled := False;
    try
      mskDataINI.SetFocus;
    except
    end;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbNumeroClick(Sender: TObject);
begin
  if ckbNumero.Checked then
  Begin
    edtNumero.Color:=clWindow;
    edtNumero.Enabled:=True;
    edtNumero.SetFocus;
  end
  else
  Begin
    edtNumero.Color:=AlteraCorComponentes;
    edtNumero.Clear;
    edtNumero.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbCodigoTituloClick(Sender: TObject);
begin
  if ckbCodigoTitulo.Checked then
  Begin
    edtCodigoTitulo.Color:=clWindow;
    edtCodigoTitulo.Enabled:=True;
    edtCodigoTitulo.SetFocus;
  end
  else
  Begin
    edtCodigoTitulo.Color:=AlteraCorComponentes;
    edtCodigoTitulo.Clear;
    edtCodigoTitulo.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbDescricaoClick(Sender: TObject);
begin
  if ckbDescricao.Checked then
  Begin
    edtDescricao.Color:=clWindow;
    edtDescricao.Enabled:=True;
    edtDescricao.SetFocus;
  end
  else
  Begin
    edtDescricao.Color:=AlteraCorComponentes;
    edtDescricao.Clear;
    edtDescricao.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbValorClick(Sender: TObject);
begin
  if ckbValor.Checked then
  Begin
    cmbValorTitulo.Color:=clWindow;
    cmbValorTitulo.Enabled:=True;
    cmbValorTitulo.ItemIndex:=4;
    edtValorTitulo.Color:=clWindow;
    edtValorTitulo.Enabled:=True;
    edtValorTitulo.SetFocus;
  end
  else
  Begin
    cmbValorTitulo.Color:=AlteraCorComponentes;
    cmbValorTitulo.Enabled:=False;
    cmbValorTitulo.ItemIndex:=-1;
    edtValorTitulo.Color:=AlteraCorComponentes;
    edtValorTitulo.Clear;
    edtValorTitulo.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbTipoPagClick(Sender: TObject);
begin
  if ckbTipoPag.Checked then
  Begin
    Parametro1.Open;
    cmbTipoPag.Color := clWindow;
    cmbTipoPag.Enabled := True;
    cmbTipoPag.ItemIndex := 0;
    dblTipoPag.Color:=clWindow;
    dblTipoPag.KeyValue:=Parametro1.CodigoPAR;
    dblTipoPag.Enabled:=True;
  end
  else
  Begin
    Parametro1.Close;
    cmbTipoPag.Color := AlteraCorComponentes;
    cmbTipoPag.Enabled := False;
    cmbTipoPag.ItemIndex := -1;
    dblTipoPag.Color:=AlteraCorComponentes;
    dblTipoPag.KeyValue:=0;
    dblTipoPag.Enabled:=False;
  End;
end;

procedure TfMxFluxoDeCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Begin
    Key := #0;
    SB_FecharClick(sender);
  end
  else if Key = #13 then
  Begin
    Key := #0;
    SB_ConfirmarClick(sender);
  end;
end;

procedure TfMxFluxoDeCaixa.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxFluxoDeCaixa.ckbValor2Click(Sender: TObject);
begin
  if ckbValor2.Checked then
  Begin
    cmbValorTitulo2.Color:=clWindow;
    cmbValorTitulo2.Enabled:=True;
    cmbValorTitulo2.ItemIndex:=3;
    edtValorTitulo2.Color:=clWindow;
    edtValorTitulo2.Enabled:=True;
    edtValorTitulo2.SetFocus;
  end
  else
  Begin
    cmbValorTitulo2.Color:=AlteraCorComponentes;
    cmbValorTitulo2.Enabled:=False;
    cmbValorTitulo2.ItemIndex:=-1;
    edtValorTitulo2.Color:=AlteraCorComponentes;
    edtValorTitulo2.Clear;
    edtValorTitulo2.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbCodigoUSUClick(Sender: TObject);
begin
  if ckbCodigoUSU.Checked then
  Begin
    Usuario1.Open;
    dblCodigoUSU.Color:=clWindow;
    dblCodigoUSU.Enabled:=True;
    dblCodigoUSU.KeyValue:=Usuario1.CodigoUSU;
    dblCodigoUSU.SetFocus;
  end
  else
  Begin
    Usuario1.Close;
    dblCodigoUSU.Color:=AlteraCorComponentes;
    dblCodigoUSU.KeyValue:=-1;
    dblCodigoUSU.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.ckbCodigoCAXClick(Sender: TObject);
begin
  if ckbCodigoCAX.Checked then
  Begin
    Caixa1.Close;
    Caixa1.SQL.Text := 'SELECT * '+
      ' FROM CAIXA '+
      ' WHERE CAX_CODIGO<>-1 ';
    if ckbCodigoCNC.Checked then
      Caixa1.SQL.Add(' AND CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue));
    Caixa1.SQL.Add(' ORDER BY CNC_CODIGO, CAX_CODIGO');      
    Caixa1.Open;
    dblCodigoCAX.Color:=clWindow;
    dblCodigoCAX.Enabled:=True;
    dblCodigoCAX.KeyValue := Caixa1.CodigoCAX;
    dblCodigoCAX.SetFocus;
  end
  else
  Begin
    Caixa1.Close;
    dblCodigoCAX.KeyValue:=-1;
    dblCodigoCAX.Color:=AlteraCorComponentes;
    dblCodigoCAX.Enabled:=False;
  end;
end;

procedure TfMxFluxoDeCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
