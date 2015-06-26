unit DigSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, Db, DBTables, SQuery, Usuario,
  Configuracao, Permissao, Log, CentroCusto, MMSystem, Variants, Clipbrd,
  Registro_Deletado, Pendencias, u_protecao;

type
  TDigitaSenha = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtNomeUsu: TEdit;
    edtSenha: TEdit;
    Usuario1: TUsuario;
    Database1: TDatabase;
    Configuracao1: TConfiguracao;
    Permissao1: TPermissao;
    Log1: TLog;
    QR_Consultas: TSQuery;
    qr_consultas2: TQuery;
    QR_Comandos: TQuery;
    tmrIniciar: TTimer;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    lblCentro: TLabel;
    CentroCusto1: TCentroCusto;
    lblDescEmpresa: TLabel;
    lblEmpresa: TLabel;
    Registro_Deletado1: TRegistro_Deletado;
    tmrSenhaEncrypta: TTimer;
    tmrTimer: TTimer;
    btnPendencia: TButton;
    Pendencias1: TPendencias;
    Image1: TImage;
    Bevel1: TBevel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SB_Confirmar: TSpeedButton;
    SB_Cancelar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrIniciarTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure WMWindowPosChanging(var Msg:TWMWindowPosChanged);
       message WM_WINDOWPOSCHANGING;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure Configuracao1BeforeOpen(DataSet: TDataSet);
    procedure tmrTimerTimer(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tmrSenhaEncryptaTimer(Sender: TObject);
    procedure edtNomeUsuChange(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
    procedure edtNomeUsuKeyPress(Sender: TObject; var Key: Char);
    procedure btnPendenciaClick(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
  private
    iContaTimer, iContaEncripty: integer;
    vCodigoBarras, vIgnorarSenha: Boolean;
  public
    Entidade :TUsuario;
    ok:Boolean;
    Tempo, DigCdPDVCNC, DigCdPDV, DigCdCLICNC, DigCdCLI, DigCdPRD, DigCdTRC, DigiTipoPendencia,
      DigiCreditoExtorno, DigCNCOrigem, DigCdPENCNC, DigCdPen:Integer;
    DigvValorTRC, DigvPrecoPRD: Double;
  end;

var
  DigitaSenha:TDigitaSenha;
implementation
Uses
  MxSPediDesc, UDM, MxVirarData, MxDevolucaoPed, UPrinc2, MxRenegoc,
  CdCliente, MxSRecParcela, MxPedidoRapido, MxCobCobrador,
  MxRelCliente, MxRetCobrador, MxReceber, MxDescontoPedido,
  MxTrocaProdutoProc, MxSPediLocImpPromis, MxNotaFiscal,funcoes,
  MxSNotaCupom, MxSPediLocComp, MxPedCompra,
  MxAlterarParcelas, MxServico, MxPedidoMotCal, MxPacoteVenda, MxPagBai,
  MxPacoteCredito, MxBaixaPag, MxServicoLBM, MxCheque, DateUtils,
  MxFaturarPendentes, MxLocalizaNotaCupom, MxSPediLocLibPed,
  MxReabrirPacote, MxSRecPedido, MxFluxoDeCaixa,
  MxSEstEntrada, MxPedidoMotCal_2, MxPagarAvulsoCPD1, UDMFB;

{$R *.DFM}

procedure TDigitaSenha.WMWindowPosChanging(var Msg:TWMWindowPosChanged);
Begin
  with Msg.WindowPos^ do
  Begin
    x := Trunc(screen.width/2) - Trunc(width/2);
    y := Trunc(screen.Height/2) - Trunc(Height/2);
    Msg.Result := 0;
  end;
end;

procedure TDigitaSenha.SB_ConfirmarClick(Sender: TObject);
var
  aux:TFmxVirarData;
  DataAntiga, vDtEstacao:TDateTime;
  sCodigoBarras: string;
begin
  Entidade.Close;
  Entidade.Open;

  if (Configuracao1.Empresa <> 7) and (Configuracao1.Empresa <> 11) then
    Raise exception.Create('Empresa não identificada!');

  if vCodigoBarras then
    sCodigoBarras := '(CODIGO BARRAS)'
  else
    sCodigoBarras := '';

(* //Comentado em 09/12/2014 - No windows 7 não está alterando a hora do computador
  with QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT GETDATE() AS DATA ';
    Open;
    vDtEstacao := Now;
    if Abs(FieldByName('DATA').asDateTime-vDtEstacao) > StrToTime('00:01:00') then
    Begin
      If MessageDlg('Acerta o Relógio com o Servidor?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Raise exception.Create('ATENÇÃO!!!'+#13+#13+
                               'Relógio da estação diferente do servidor! '+TimeToStr(Abs(FieldByName('DATA').asDateTime-vDtEstacao)))
      else
      Begin
        Close;
        SQL.Text := 'SELECT GETDATE() AS DATA ';
        Open;
        if not AcertarRelogio(FieldByName('DATA').asDateTime) then
          Raise exception.Create('Falha ao acertar o Relógio!');
        Close;
        SQL.Text := 'SELECT GETDATE() AS DATA ';
        Open;
        if Abs(FieldByName('DATA').asDateTime-Now) > StrToTime('00:01:00') then
          Raise exception.Create('Falha ao acertar o Relógio!');
      end;
    end;

{    Close;
    SQL.Text := 'SELECT TOP 1 LOG_DATA_HORA AS DATA '+
      ' FROM LOG '+
      ' ORDER BY LOG_DATA_HORA DESC ';
    Open;
    if (Abs(FieldByName('DATA').asDateTime-Now) > StrToTime('00:30:00')) and
       (Entidade.Permissoes.IndexOf(IntToStr(8120)) < 0) then //Retroceder data
      Raise exception.Create('Sistema com hora superior ao da estação!');
}
  end;
*)

  If Self.Tag=0 then
  Begin
    UsuLogin := Entidade.Logar(edtNomeUsu.Text, Encrypt(edtSenha.Text),True,False(*IgnorarSenha*));
    if UsuLogin <> -1 then
    Begin
      Entidade.CarregaPermissoes(UsuLogin);
      If Configuracao1.Data>StrToDate(DataLimite) then
      Begin
        try
          sndPlaySound(PChar(cSomErro),SND_ASYNC);
        except
        end;
        Entidade.Logoff;
        Raise Exception.Create('Sua Versão Expirou!!!'+#13+
                               'Entre em contato com o Suporte ou tente atualizar o sistema!');
      end
      else if StrToDate(DataLimite)-Configuracao1.Data < 15 then
        ShowMessage('ATENÇÃO !!! '+#13+
                    'Falta(m) '+IntToStr(Trunc(StrToDate(DataLimite)-Trunc(Now))+1)+
                    ' dia(s) para a Versão Expirar (Travar)!'+#13+
                    'Entre em contato com o Suporte (URGENTE) ou tente atualizar o sistema!');
      If Configuracao1.Data<>date Then
      Begin
        If Configuracao1.Data+1=date then
        Begin
          If Entidade.Permissoes.IndexOf(IntToStr(2330)) < 0 then
          Begin
            try
              sndPlaySound(PChar(cSomErro),SND_ASYNC);
            except
            end;
            Entidade.Logoff;
            ShowMessage('Usuário não tem permissão de virar data!'+#13+
                        'Data Sistema: '+DateToStr(Configuracao1.Data)+#13+
                        'Data Windows: '+DateToStr(Date)+' - '+cSemana[DayOfWeek(Date)] );
            Abort;
          end;
          If MessageDlg('A data do sistema esta atrasada! Deseja virar data?'+#13+
                        'Data Sistema: '+DateToStr(Configuracao1.Data)+#13+
                        'Data Windows: '+DateToStr(Date)+' - '+cSemana[DayOfWeek(Date)],mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
            Configuracao1.Close;
            Configuracao1.Open;
            If Configuracao1.Data+1<>date then
            Begin
              ShowMessage('O sistema já foi atualizado por outra pessoa!');
              Abort;
            end;
            try
              DataAntiga:=Configuracao1.DataHora;
              if (not (Configuracao1.Empresa IN TEmpresasConfiguracaoUnica)) then
                ExecutaSQL(QR_Comandos,'UPDATE CONFIGURACAO SET '+
                  ' DATA=DATA+1 '+
                  ' WHERE CNC_CODIGO='+IntToStr(Entidade.CentroDeCusto))
              else
                ExecutaSQL(QR_Comandos,'UPDATE CONFIGURACAO SET DATA=DATA+1 ');
              Configuracao1.Close;
              Configuracao1.Open;
              Configuracao1.CodigoCNC:=Entidade.CentroDeCusto;
              Configuracao1.CodigoUSU:=UsuLogin;
              Entidade.GeraLog(2330,0,0,'Dt Ant: '+formatDateTime('dd/mm/yyyy',DataAntiga));
              Entidade.GeraLog(1,0,0,'IP:'+GetIP+sCodigoBarras);
            except
              ShowMessage('Não foi possível alterar o campo corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
            end;
          End
          Else
          Begin
            try
              sndPlaySound(PChar(cSomErro),SND_ASYNC);
            except
            end;
            Entidade.Logoff;
            Raise Exception.Create('O sistema não pode funcionar com a Data atrasada!');
          end;
        End
        Else If (DayOfWeek(Date)=2) and //Hoje é Segunda
                (Configuracao1.Data+2=Date) then //Data do Sistema é Sábado
        Begin
          If Entidade.Permissoes.IndexOf(IntToStr(2330)) < 0 then
          Begin
            try
              sndPlaySound(PChar(cSomErro),SND_ASYNC);
            except
            end;
            Entidade.Logoff;
            ShowMessage('Usuário não tem permissão de virar data!');
            Abort;
          end;
          If MessageDlg('A data do sistema esta atrasada! Deseja virar data?'+#13+
                        'Data Sistema: '+DateToStr(Configuracao1.Data)+#13+
                        'Data Windows: '+DateToStr(Date)+' - '+cSemana[DayOfWeek(Date)],mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
            Configuracao1.Close;
            Configuracao1.Open;
            If (DayOfWeek(Date)<>2) or (Configuracao1.Data+2<>Date) then
            Begin
              ShowMessage('O sistema já foi atualizado por outra pessoa!');
              Abort;
            end;
            try
              DataAntiga:=Configuracao1.DataHora;
              if (not (Configuracao1.Empresa IN TEmpresasConfiguracaoUnica)) then
                ExecutaSQL(QR_Comandos,'UPDATE CONFIGURACAO SET '+
                  ' DATA=DATA+2 '+
                  ' WHERE CNC_CODIGO='+IntToStr(Entidade.CentroDeCusto))
              else
                ExecutaSQL(QR_Comandos,'UPDATE CONFIGURACAO SET DATA=DATA+2 ');
              Configuracao1.Close;
              Configuracao1.Open;
              Configuracao1.CodigoCNC := Entidade.CentroDeCusto;
              Configuracao1.CodigoUSU := UsuLogin;
              Entidade.GeraLog(2330,0,0,'Dt Ant: '+formatDateTime('dd/mm/yyyy',DataAntiga));
              Entidade.GeraLog(1,0,0,'IP:'+GetIP+sCodigoBarras);
            except
              ShowMessage('Não foi possível alterar o campo corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
            end;
          End
          else
          Begin
            try
              sndPlaySound(PChar(cSomErro),SND_ASYNC);
            except
            end;
            Entidade.Logoff;
            Raise Exception.Create('O sistema não pode funcionar com a Data atrasada!');
          end;
        End
        Else if StrToDate(RetornaDataValidaUtil(Configuracao1.PastaSistema, formatDateTime('dd/mm/yyyy',Configuracao1.Data+1))) = Date then
        Begin
          If Entidade.Permissoes.IndexOf(IntToStr(2330)) < 0 then
          Begin
            try
              sndPlaySound(PChar(cSomErro),SND_ASYNC);
            except
            end;
            Entidade.Logoff;
            ShowMessage('Usuário não tem permissão de virar data!');
            Abort;
          end;
          If MessageDlg('A data do sistema esta atrasada! Deseja virar data?'+#13+
                        'Data Sistema: '+DateToStr(Configuracao1.Data)+#13+
                        'Data Windows: '+DateToStr(Date)+' - '+cSemana[DayOfWeek(Date)],mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
            Configuracao1.Close;
            Configuracao1.Open;
            if StrToDate(RetornaDataValidaUtil(Configuracao1.PastaSistema, formatDateTime('dd/mm/yyyy',Configuracao1.Data+1)))<>Date then
            Begin
              ShowMessage('O sistema já foi atualizado por outra pessoa!');
              Abort;
            end;
            try
              DataAntiga:=Configuracao1.DataHora;
              if (not (Configuracao1.Empresa IN TEmpresasConfiguracaoUnica)) then
                ExecutaSQL(QR_Comandos,'UPDATE CONFIGURACAO SET '+
                  ' DATA="'+MesDia(Date)+'"  '+
                  ' WHERE CNC_CODIGO='+IntToStr(Entidade.CentroDeCusto))
              else
                ExecutaSQL(QR_Comandos,'UPDATE CONFIGURACAO SET DATA="'+MesDia(Date)+'"  ');
              Configuracao1.Close;
              Configuracao1.Open;
              Configuracao1.CodigoCNC := Entidade.CentroDeCusto;
              Configuracao1.CodigoUSU := UsuLogin;
              Entidade.GeraLog(2330,0,0,'Dt Ant: '+formatDateTime('dd/mm/yyyy',DataAntiga));
              Entidade.GeraLog(1,0,0,'IP:'+GetIP+sCodigoBarras);
            except
              ShowMessage('Não foi possível alterar o campo corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
            end;
          End
          else
          Begin
            try
              sndPlaySound(PChar(cSomErro),SND_ASYNC);
            except
            end;
            Entidade.Logoff;
            Raise Exception.Create('O sistema não pode funcionar com a Data atrasada!');
          end;
        end
        Else
        Begin
          If Entidade.Permissoes.IndexOf(IntToStr(2340)) < 0 then
          Begin
            try
              sndPlaySound(PChar(cSomErro),SND_ASYNC);
            except
            end;
            ShowMessage('Usuário não tem permissão de alterar a data!');
            Abort;
          end;
          If MessageDlg('Deseja alterar para a data correta?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
            DataAntiga:=Configuracao1.DataHora;
            aux:=TfMxVirarData.Create(Application);
            aux.Tag:=1;
            if aux.ShowModal=mrCancel then
            begin
              aux.free;
              exit;
            end
            else
            Begin
              Configuracao1.CodigoUSU:=UsuLogin;
              Entidade.GeraLog(2340,0,0,'Dt Ant: '+formatDateTime('dd/mm/yyyy',DataAntiga));
              Entidade.GeraLog(1,0,0,'IP:'+GetIP+sCodigoBarras);
              aux.free;
            end;
          End
          Else
          Begin
            try
              sndPlaySound(PChar(cSomErro),SND_ASYNC);
            except
            end;
            Entidade.Logoff;
            Raise Exception.Create('Não é possível entrar no sistema com a data atual!');
          end;
        End;
      End
      else
      Begin
        Configuracao1.CodigoUSU:=UsuLogin; //Para poder gerar o LOG
        Entidade.GeraLog(1,0,0,'IP:'+GetIP+sCodigoBarras);
      end;
    end;
  End
  Else
  Begin
    if tag=2 then
      UsuLogin:=Entidade.Logar(edtNomeUsu.Text, Encrypt(edtSenha.Text),True,vIgnorarSenha)
    else
      UsuLogin:=Entidade.Logar(edtNomeUsu.Text, Encrypt(edtSenha.Text),False,vIgnorarSenha);
    Entidade.CarregaPermissoes(UsuLogin);
    if tag = 2 then
    Begin
      SIAC.Cancelar:=False;
      SIAC.tmrTimer.Enabled := True;
    end;
  end;

  If UsuLogin=-1 then
    Abort;

  ok:=true;
  if (UsuLogin > 0) and (Tag<=2) then
  Begin
    try
      sndPlaySound(PChar(cSomAbertura),SND_ASYNC);
    except
    end;
  end;
  close;
end;

procedure TDigitaSenha.FormCreate(Sender: TObject);
Begin
  //Aplicando o Skin
  (*
  if f_Sistema = tsGerenciador then
  begin
    if f_SkinGerenciador then
      SkinData.Active := True
    else
      SkinData.Active := False;
  end
  else
    SkinData.Active := True;
  *)

  //Configurações Regionais
  ThousandSeparator:='.';
  DecimalSeparator :=',';
  DateSeparator    :='/';
  ShortDateFormat  :='DD/MM/YYYY';
  TimeSeparator    :=':';
  ShortTimeFormat  :='hh:mm:ss';

  Entidade:=Usuario1;

  DigCdPen := 0;
  DigCdPDV := 0;
  DigCdCLI := 0;
  DigCdPRD := 0;
  DigCdTRC := 0;
  DigiTipoPendencia := -1;
  DigiCreditoExtorno := -1;
  DigvPrecoPRD := -1;
  DigvValorTRC := -1;

  vCodigoBarras := False;
  Clipboard.Clear;

  vIgnorarSenha := False;
end;

procedure TDigitaSenha.SB_CancelarClick(Sender: TObject);
begin
  If Tag=1 Then
  Begin
    fMxSPedDesc.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=2 Then
  Begin
    SIAC.Cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=4 Then
  Begin
    fMxDevPed.Cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=6 Then
  Begin
    fMxVirarData.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=8 Then
  Begin
    fMxReneg.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=9 Then
  Begin
    fCadCli.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=10 Then
  Begin
    fmxSRecPParc.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=11 Then
  Begin
    fMxPedidoRapido.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=17 Then
  Begin
    fMxCobCobrador.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag = 18 then
  Begin
    fMxRelCli.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 19 then
  Begin
    fMxRetCobr.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 20 then
  Begin
    fMxReceber.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 21 then
  Begin
    fMxDescontoPedido.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 22 then
  Begin
    Close;
    Exit;
  end
  Else If Tag = 23 then
  Begin
    fMxTrocaProdutoProc.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 24 then
  Begin
    fMxSPedLocImpPromis.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 25 then
  Begin
    fMxNotaFiscal.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 26 then
  Begin
//    fMxCancelarNota.cancelar:=True;
//    Close;
//    Exit;
  end
  Else If Tag = 27 then
  Begin
    fMxSNotaCupom.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 28 then
  Begin
    fMxSPedLocComp.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 29 then
  Begin
    fMxPedComp.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 30 then
  Begin
    fMxAlterarParcelas.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag = 31 then
  Begin
    fMxServico.cancelar:=True;
    Close;
    Exit;
  end
  Else If Tag=32 Then
  Begin
    fMxPedidoMotCal.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=33 Then
  Begin
    fMxPacoteVenda.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=34 Then
  Begin
    fMxSPagBai.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=35 Then
  Begin
    fMxPacoteCredito.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=36 Then
  Begin
    fMxBaixaPag.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=37 Then
  Begin
    fMxServicoLBM.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=38 Then
  Begin
    fMxCheque.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=39 Then
  Begin
    fMxFaturarPendentes.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=40 Then
  Begin
    fMxLocalizaNotaCupom.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=41 Then
  Begin
    fMxSPedLocLibPed.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=42 Then
  Begin
    fMxReabrirPacote.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=43 Then
  Begin
    fMxPagarAvulsoCPD1.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=44 Then
  Begin
    fMxSRecPed.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=45 Then
  Begin
    fMxFluxoDeCaixa.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=46 Then
  Begin
    fMxSEstEntrada.cancelar:=True;
    Close;
    Exit;
  End
  Else If Tag=47 Then
  Begin
    fMxPedidoMotCal_2.cancelar:=True;
    Close;
    Exit;
  End
  else
    Halt;
end;


procedure TDigitaSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not ok then
    halt;
end;

procedure TDigitaSenha.tmrIniciarTimer(Sender: TObject);
Var
  NomeArquivo, Linha, sServidor, sMsg:string;
  NomeBase:TextFile;
begin
  Tempo:=Tempo+1;
  if Tempo = 1 then
  Begin
    sServidor := '';
    tmrIniciar.Enabled:=False;
    CarregaSACIConf(Configuracao1.PastaImagens, Configuracao1.PastaSons, sServidor);
    cSegundosInoperante := Configuracao1.TempoOcioso;
    NomeArquivo:='C:\CPD.TXT';
    if Configuracao1.Empresa = empEletro then
    Begin
      if FileExists(NomeArquivo) and
         (cLogado <> 1) then
      begin
        linha := '1';
        if (InputQuery('Selecionar Banco de Dados', 'Selecione: 1-Eletro; 2-Tecido; 3-Itapipoca; 4-Baturite; 5-Nayara; 6-Solonopoles', linha)) and
           (linha[1] in ['1','2','3','4','5','6']) then
        begin
          AssignFile(NomeBase,NomeArquivo);
          ReWrite(NomeBase);
          WriteLn(NomeBase,Linha);
          CloseFile(NomeBase);
          if linha='1' then
            Database1.AliasName:='SACI'
          else if linha='2' then
            Database1.AliasName:='SACI_T'
          else if linha='3' then
            Database1.AliasName:='ITAPIPOCA'
          else if linha='4' then
            Database1.AliasName:='BATURITE'
          else if linha='5' then
            Database1.AliasName:='NAYARA'
          else if linha='6' then
            Database1.AliasName:='SOLONOPOLES';
        end
        else
          Application.Terminate;
      end
      else if FileExists(NomeArquivo) then
      Begin
        AssignFile(NomeBase,NomeArquivo);
        Reset(NomeBase);
        Readln(NomeBase,Linha);
        if linha='1' then
          Database1.AliasName:='SACI'
        else if linha='2' then
          Database1.AliasName:='SACI_T'
        else if linha='3' then
          Database1.AliasName:='ITAPIPOCA'
        else if linha='4' then
          Database1.AliasName:='BATURITE'
        else if linha='5' then
          Database1.AliasName:='NAYARA'
        else if linha='6' then
          Database1.AliasName:='SOLONOPOLES';
      end;
    end;
    try
      if not Database1.Connected then
        Database1.Connected:=True;
    except
      //Verificar se o Alias SACI exite

      if not Session.IsAlias('SACI') then
      Begin
        if sServidor = '' then
        Begin
          while True do
          Begin
            sServidor := UpperCase(InputBox('Dados Configuração', 'Nome do Servidor:', ''));
            if Trim(sServidor) <> '' then
              Break;
          end;
        end;
        try
          //CriaAlias('SACI','SACI',sServidor,'SYSDBA','MSSQL');
          CriaAlias('SACI','SIAC',sServidor,'SYSDBA','MSSQL');
          Database1.Connected:=True;
        except
          ShowMessage('Falha no BDE!');
          Application.Terminate;
        end;
      end
      else
      Begin
        ShowMessage('Falha no BDE!');
        Application.Terminate;
      end;

    end;

    try
      Configuracao1.Open;
      if Configuracao1.IsEmpty then
      Begin
        ShowMessage('Não existe registro de Configuração para esse Centro!');
        Raise exception.Create('');
      end;
    except
      ShowMessage('Falha no Banco de Dados!');
      Close;
      Exit;
    end;
    Configuracao1.CodigoCNC := Entidade.CentroDeCusto;
    Ok:=False;
    CentroCusto1.Close;
    CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CentroDeCusto;
    CentroCusto1.Open;
    if CentroCusto1.RazaoSocial = '' then
      lblCentro.Caption:='Não Identificado!'
    else
      lblCentro.Caption:=CentroCusto1.RazaoSocial;
    if Entidade.Maquina <= 0 then
      Label6.Caption := 'Máquina não identificada!'
    else
      Label6.Caption := FormatFloat('000',StrToFloat(IntToStr(Entidade.Maquina)));

    {case Configuracao1.Empresa of
      0 : lblEmpresa.Caption := 'NÃO IDENTIFICADA';
      1 : if Entidade.Mafalda = 1 then
            lblEmpresa.Caption := 'MAFALDA MAGAZINE'
          else
          Begin
            if Configuracao1.Magazine then
              lblEmpresa.Caption := 'MAGAZINE GUERRA'
            else
              lblEmpresa.Caption := 'ELETRO GUERRA';
          end;
      2 : lblEmpresa.Caption := 'PETROMAX';
      3 : lblEmpresa.Caption := 'LBM MOVEIS';
      4 : lblEmpresa.Caption := 'MOTICAL';
      5 : lblEmpresa.Caption := 'CREATOR';
      6 : lblEmpresa.Caption := 'ANDREA';
      7 : lblEmpresa.Caption := 'LUCIANO';
      8 : lblEmpresa.Caption := 'HOPE';
    else
      lblEmpresa.Caption := 'DESCONHECIDA';
    end;}

    {
    case Configuracao1.Empresa of
      7 : lblEmpresa.Caption := 'LUCIANO';
      11: lblEmpresa.Caption := EMPRESA_NOME;
    else
      lblEmpresa.Caption := 'NÃO IDENTIFICADA';
    end;
    }

    if GetEmpresaComunicacao(QR_Consultas) = 'AA' then
      lblEmpresa.Caption := 'TESTE'
    else if GetEmpresaComunicacao(QR_Consultas) = 'LO' then
      lblEmpresa.Caption := 'LUCIANO'
    else if GetEmpresaComunicacao(QR_Consultas) = 'AC' then
      lblEmpresa.Caption := 'ÁGUA DE CHEIRO'
    else if GetEmpresaComunicacao(QR_Consultas) = '01' then
      lblEmpresa.Caption := 'ÁGUA DE CHEIRO - QUIXERAMOBIM'
    else
      lblEmpresa.Caption := 'NÃO IDENTIFICADA';

    Panel1.Enabled:=True;
    Panel2.Enabled:=True;
    edtNomeUsu.SetFocus;
  end;

  if cVersaoBase > Configuracao1.VersaoBase then
    sMsg := 'Seu sistema será atualizado.'+#13+#13+'Confirme no botão "OK" e aguarde até o fim do processo!'+#13
  else
    sMsg := 'Base já atualizada com versão superior!'+#13;

  if (Configuracao1.VersaoBase <> cVersaoBase) then
  Begin
    Application.MessageBox(PChar(#13+'A T E N Ç Ã O'+#13#13+#13#13+'Versão da Base diferente da Versão do Sistema!'+#13+
      sMsg +#13+
      'Base: '+IntToStr(Configuracao1.VersaoBase)+#13+
      'Sistema: '+IntToStr(cVersaoBase)), 'Atenção', MB_ICONINFORMATION + MB_OK);

    if cVersaoBase > Configuracao1.VersaoBase then
      WinExec('PAtualizaSACI.exe',SW_SHOWNORMAL)
    else
      Application.Terminate;
  end;
  tmrTimer.Enabled:=True;  
  SB_Confirmar.Enabled := True;
  SB_Cancelar.Enabled := True;
end;

procedure TDigitaSenha.FormShow(Sender: TObject);
begin
  Label4.Caption := 'Versão: ' + f_VersaoSistema;
  self.Caption := 'SIAC - Senha de Acesso';
  Tempo        := 0;
  iContaTimer  := 0;
  if Configuracao1.Empresa = empTeste then
  Begin
    lblDescEmpresa.Visible := False;
    lblEmpresa.Visible := False;
  end;
  tmrIniciar.Enabled:=True;
  if (DigCdPDV > 0) or
     (DigiTipoPendencia > 0) then
    btnPendencia.Visible := True;

  try
    Configuracao1.Close;
    Configuracao1.Open;
    if Configuracao1.Data > StrToDate(DataLimite) then
    begin
      Label7.Caption := 'Atenção, sua versão expirou, clique aqui para atualizar seu sistema!';
      Label7.Font.Color := clRed;
      Label7.Visible := true;
      Bevel1.Visible := true;
      Panel3.Height := 85;
      Image1.Top := 2;
      //btnAtualizar.Visible := true;
    end
    else
    begin
      Label7.Visible := false;
      Bevel1.Visible := false;
      Panel3.Height := 60;
      Image1.Top := 12;
      //btnAtualizar.Visible := StrToDate(DataLimite)-Configuracao1.Data < 15;
    end;
  finally
    Configuracao1.Close;
  end;

//showmessage(getSerialHD);
  if ComputadorDoProgramador then
  begin
    edtNomeUsu.Text := 'ADM';
    edtSenha.Text := 's2f1303';
  end;
end;

procedure TDigitaSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  iContaTimer := 0;
  if key = chr(13) then
  Begin
    Key := CHR(0);
    if edtNomeUsu.Text = '' then
      edtNomeUsu.SetFocus
    else if (edtSenha.Text = '') and
            (not vIgnorarSenha) then
      edtSenha.Setfocus
    else
      if SB_Confirmar.Enabled then
        SB_ConfirmarClick(sender);
  end
  else if Key = chr(27) then
    SB_CancelarClick(sender);
end;

procedure TDigitaSenha.FormDestroy(Sender: TObject);
begin
  Database1.Connected:=False;
end;

procedure TDigitaSenha.Configuracao1BeforeOpen(DataSet: TDataSet);
begin
  if (not (Configuracao1.Empresa IN TEmpresasConfiguracaoUnica)) then
    Configuracao1.SQL.Text := 'SELECT * FROM CONFIGURACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CentroDeCusto);
end;

procedure TDigitaSenha.tmrTimerTimer(Sender: TObject);
begin
  try
    if (Clipboard.AsText) <> '' then
      Clipboard.Clear;
  except
  end;
  inc(iContaTimer);
  if (iContaTimer > cSegundosInoperante*20) and
     (Tag <= 2) and
     (cSegundosInoperante > 0) then
    SB_CancelarClick(sender);
end;

procedure TDigitaSenha.Panel1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  iContaTimer := 0;
end;

procedure TDigitaSenha.Panel3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  iContaTimer := 0;
end;

procedure TDigitaSenha.Panel2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  iContaTimer := 0;
end;

procedure TDigitaSenha.tmrSenhaEncryptaTimer(Sender: TObject);
begin
  inc(iContaEncripty);
  if iContaEncripty > 20 then  //1 Segundo
  Begin
    edtNomeUsu.Clear;
    edtSenha.Clear;
    iContaEncripty := 0;
    tmrSenhaEncrypta.Enabled := False;
  end;
end;

procedure TDigitaSenha.edtNomeUsuChange(Sender: TObject);
begin
  if Trim(edtNomeUsu.Text) <> '' then
    if edtNomeUsu.Text[1] = cCaractereEncrypta then
    Begin
      tmrSenhaEncrypta.Enabled := True;
    end;
end;

procedure TDigitaSenha.edtSenhaChange(Sender: TObject);
var
  sNome, sSenha: string;
begin
  vCodigoBarras := False;
  if Trim(edtNomeUsu.Text) <> '' then
    if edtNomeUsu.Text[1] = cCaractereEncrypta then
      tmrSenhaEncrypta.Enabled := True;
  if (Length(edtNomeUsu.Text) = 20) and
     (Length(edtSenha.Text) = 8) then
  Begin
    sNome  := edtNomeUsu.Text;
    sSenha := Copy(edtSenha.Text,8,1)+Copy(edtSenha.Text,1,7);
    if DecryptaDadosCartao(sNome, sSenha) then
    Begin
      edtNomeUsu.Text := sNome;
      edtSenha.Text := sSenha;
      vCodigoBarras := True;
      SB_ConfirmarClick(sender);
    end
    else
    Begin
      edtNomeUsu.Text := '';
      edtSenha.Text   := '';
      ShowMessage('Código Encryptado com erro!');
    end;
  end;
end;

procedure TDigitaSenha.edtNomeUsuKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = cCaractereEncrypta) and
     (edtNomeUsu.Text <> '') then
  Begin
    if edtNomeUsu.Text[1] <> cCaractereEncrypta then
    Begin
      iContaEncripty := 0;
      edtNomeUsu.Clear;
      edtSenha.Clear;
    end;
  end;
  if Length(edtNomeUsu.Text) = 20 then
  Begin
    edtSenha.SetFocus;
    edtSenha.Text := Key;
  end;
end;

procedure TDigitaSenha.btnPendenciaClick(Sender: TObject);
var
  sFiltro, sCampoVerificador: string;
  iSit, iUSU: integer;
  vMudarSituacao: Boolean;
begin
  vMudarSituacao := False;
  if not btnPendencia.Visible then
    Exit;

  if (not (DigiTipoPendencia in [8,9])) and //Entrada/Saída Avulsa
     ((DigCdPDV = 0) or
      (DigCdCLI = 0)) then
    Exit;

  sFiltro := '';
  if DigCdTRC > 0 then
    sFiltro := ' AND TRC_CODIGO='+IntToStr(DigCdTRC)
  else if DigCdPRD > 0 then
    sFiltro := ' AND (PRD_CODIGO_1='+IntToStr(DigCdPRD)+
               '   OR PRD_CODIGO_2='+IntToStr(DigCdPRD)+
               '   OR PRD_CODIGO_3='+IntToStr(DigCdPRD)+')';

  with Pendencias1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM PENDENCIA '+
      ' WHERE CNC_CODIGO='+IntToStr(Configuracao1.CodigoCNC)+
      ' AND CNC_PEDIDO='+IntToStr(DigCdPDVCNC)+
      ' AND PDV_CODIGO='+IntToStr(DigCdPDV)+
      ' AND CNC_CLIENTE='+IntToStr(DigCdCLICNC)+
      ' AND CLI_CODIGO='+IntToStr(DigCdCLI)+
      ' AND PEN_TIPO='+IntToStr(DigiTipoPendencia)+
      sFiltro+
      ' ORDER BY PEN_CODIGO DESC ';
    Open;
    if IsEmpty then
      Raise exception.Create('Não existe pendência para esse processo! '+#13+
                             'PDV:'+IntToStr(DigCdPDVCNC)+'-'+IntToStr(DigCdPDV)+#13+
                             'CLI:'+IntToStr(DigCdCLICNC)+'-'+IntToStr(DigCdCLI)+#13+
                             'TRC:'+IntToStr(DigCdTRC)+#13+
                             'PRD:'+IntToStr(DigCdPRD)+#13+
                             'Tipo:'+IntToStr(DigiTipoPendencia));

    iSit := Situacao;
    while not Eof do
    Begin
      if iSit = 2 then //Aguardando, Desativada, Processada
        Break;
      Next;
    end;

    DigCNCOrigem := CNCOrigem;
    iUSU := CodigoUSULiberou;
    DigCdPENCNC := CodigoCNC;
    DigCdPen := CodigoPEN;
    if iSit = 0 then
      Raise exception.Create('Pendência ainda não autorizada!')
    else if iSit = 1 then
      Raise exception.Create('Pendência desativada!')
    else if iSit = 3 then
      Raise exception.Create('Pendência já processada!');

    case DigiTipoPendencia of
      0:Begin //Dev. Total
          if DigiCreditoExtorno <> CreditoExtorno then
            case CreditoExtorno of
              0: Raise exception.Create('Necessário marcar a opção Gerar Crédito!');
              1: Raise exception.Create('Necessário marcar a opção Gerar Extorno!');
              2: Raise exception.Create('Necessário marcar a opção Ignorar!');
            else
              Raise exception.Create('Não foi definido o tipo Crédito/Extorno!');
            end;
        end;
      1:Begin //Dev. Parcial
          if (DigCdPRD <> CodigoPRD1) and
             (DigCdPRD <> CodigoPRD2) and
             (DigCdPRD <> CodigoPRD3) then
            Raise exception.Create('Produto não liberado!');
          if DigiCreditoExtorno <> CreditoExtorno then
            case CreditoExtorno of
              0: Raise exception.Create('Necessário marcar a opção Gerar Crédito!');
              1: Raise exception.Create('Necessário marcar a opção Gerar Extorno!');
              2: Raise exception.Create('Necessário marcar a opção Ignorar!');
            else
              Raise exception.Create('Não foi definido o tipo Crédito/Extorno!');
            end;
        end;
      2:Begin //Desconto Pedido
          if (DigCdPRD = CodigoPRD1) then
          Begin
            if Arredonda(PrecoPRD1) > Arredonda(DigvPrecoPRD) then
              Raise exception.Create('Preço inferior ao liberado na pendência!');
          end
          else if (DigCdPRD = CodigoPRD2) then
          Begin
            if Arredonda(PrecoPRD2) > Arredonda(DigvPrecoPRD) then
              Raise exception.Create('Preço inferior ao liberado na pendência!');
          end
          else if (DigCdPRD = CodigoPRD3) then
          Begin
            if Arredonda(PrecoPRD3) > Arredonda(DigvPrecoPRD) then
              Raise exception.Create('Preço inferior ao liberado na pendência!');
          end
          else
            Raise exception.Create('Produto não liberado!');
        end;
      3:Begin //Cancelar Venda
          //Liberado
        end;
      4:Begin //Desconto Título
          if Arredonda(ValorTRC) > Arredonda(DigvValorTRC) then
            Raise exception.Create('Valor inferior ao liberado na pendência!');
        end;
      5:Begin //Reabrir Título
          //Liberado
        end;
      6:Begin //Excluir Título
          //Liberado
        end;
      7:Begin //Venda no SPC
          //Liberado
        end;
      8:Begin //Entrada Avulsa
          if (DigCdPRD <> CodigoPRD1) then
            Raise exception.Create('Produto não liberado!');
          if Arredonda(PrecoPRD1) <> Arredonda(DigvPrecoPRD) then
            Raise exception.Create('Quantidade diferente da liberada na pendência!');
        end;
      9:Begin //Saída Avulsa
          if (DigCdPRD <> CodigoPRD1) then
            Raise exception.Create('Produto não liberado!');
          if Arredonda(PrecoPRD1) <> Arredonda(DigvPrecoPRD) then
            Raise exception.Create('Quantidade diferente da liberada na pendência!');            
        end;
    end;

    sCampoVerificador := MontarCampoVerificador(QR_Consultas, DigCNCOrigem, DigCdPENCNC, DigCdPen);

    if DigCdPRD > 0 then
    Begin
      if (CodigoPRD3 > 0) then
      Begin
        if (DigCdPRD = CodigoPRD3) then
          vMudarSituacao := True;
      end
      else if (CodigoPRD2 > 0) then
      Begin
        if (DigCdPRD = CodigoPRD2) then
          vMudarSituacao := True
      end
      else
        vMudarSituacao := True;
    end
    else
      vMudarSituacao := True;

  end;

  with QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT USU_CODIGO, PEC_CAMPO_VERIFICADOR '+
      ' FROM PENDENCIA_CPD '+
      ' WHERE CNC_PENDENCIA='+IntToStr(DigCdPENCNC)+
      ' AND PEN_CODIGO='+IntToStr(DigCdPen)+
      ' AND PEC_DT_CADASTRO>="'+MesDia(Configuracao1.Data-10)+'" ';
    Open;
    if IsEmpty then
      Raise exception.Create('Registro de autorização não encontrado ou Vencido (10 dias)!');
    if sCampoVerificador <> FieldByName('PEC_CAMPO_VERIFICADOR').asString then
      Raise exception.Create('Campo verificador não confere!');
    if iUSU <> FieldByName('USU_CODIGO').asInteger then
      Raise exception.Create('Divergência no registro de pendência!');

    if not vMudarSituacao then
      DigCdPen := 0;

    Close;
    SQL.Text := 'SELECT * FROM USUARIO '+
      ' WHERE USU_CODIGO='+IntToStr(iUSU);
    Open;
    if IsEmpty then
      Raise exception.Create('Usuário que liberou não foi localizado!');
    edtNomeUsu.Text := FieldByName('USU_NOME').asString;
    vIgnorarSenha := True;
    try
      SB_ConfirmarClick(sender);
    finally
      vIgnorarSenha := False;
    end;
  end;
end;

procedure TDigitaSenha.Label7Click(Sender: TObject);
var
  arquivo: string;
begin
  arquivo := ExtractFilePath(ParamStr(0)) + 'AtualizaSistema.exe';
  winExec(PChar(arquivo),SW_NORMAL);
  Application.Terminate;
end;

procedure TDigitaSenha.btnAtualizarClick(Sender: TObject);
var
  arquivo: string;
begin
  arquivo := ExtractFilePath(ParamStr(0)) + 'AtualizaSistema.exe';

  if Application.MessageBox('Deseja realmente fazer a atualização do sistema?',
                            'Atualização do sistema',
                            MB_ICONQUESTION+MB_YESNO) = id_Yes then
  begin
    winExec(PChar(arquivo),SW_NORMAL);
    Application.Terminate;
  end;
end;

end.
