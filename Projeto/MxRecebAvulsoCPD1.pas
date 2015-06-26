unit MxRecebAvulsoCPD1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Movimento_caixa, Db,Variants,
  Titulo_receber, Conta_de_Caixa, DBTables, SQuery, Parametro, Menus,MMSystem,
  ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfMxRecebAvulsoCPD1 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dblContaAgendada: TDBLookupComboBox;
    edtDescricao: TEdit;
    edtNumero: TEdit;
    edtValor: TEdit;
    memObservacao: TMemo;
    edtSequencia: TEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    dblTipoDocumento: TDBLookupComboBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    DSParametro2: TDataSource;
    Parametro2: TParametro;
    DSConta_de_Caixa1: TDataSource;
    dblTipoPagamento: TDBLookupComboBox;
    Conta_de_Caixa1: TConta_de_Caixa;
    edtDataMovimento: TEdit;
    mskCompetencia: TMaskEdit;
    Label1: TLabel;
    dblContaRecebimento: TDBLookupComboBox;
    Label2: TLabel;
    Conta_de_Caixa2: TConta_de_Caixa;
    DSConta_de_Caixa2: TDataSource;
    Label8: TLabel;
    edtCodigoCHQ: TEdit;
    edtChequeCNC: TEdit;
    ActionManager1: TActionManager;
    Confirmar: TAction;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblContaAgendadaClick(Sender: TObject);
    procedure dblTipoPagamentoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxRecebAvulsoCPD1: TfMxRecebAvulsoCPD1;

implementation
Uses
  UDM,funcoes, MxCheque;
{$R *.DFM}


procedure TfMxRecebAvulsoCPD1.FormCreate(Sender: TObject);
begin
  Parametro1.Active:=True;
  Parametro2.Active:=True;
  Conta_de_Caixa1.Close;
  if DM.Configuracao1.Empresa = empLBM then
    Conta_de_Caixa1.SQL.Text := 'SELECT CCX_CODIGO,CCX_DESCRICAO '+
      ' FROM CONTA_DE_CAIXA '+
      ' WHERE CCX_DC="C" '+
      ' AND (CCX_SITUACAO=0 OR CCX_SITUACAO IS NULL) '+
      ' ORDER BY CCX_DESCRICAO ';
  Conta_de_Caixa1.Active:=True;

  Conta_de_Caixa2.Close;
  if DM.Configuracao1.Empresa = empLBM then
    Conta_de_Caixa2.SQL.Text := 'SELECT CCX_CODIGO,CCX_DESCRICAO '+
      ' FROM CONTA_DE_CAIXA '+
      ' WHERE CCX_DC="C" '+
      ' AND (CCX_SITUACAO=0 OR CCX_SITUACAO IS NULL) '+
      ' ORDER BY CCX_DESCRICAO ';
  Conta_de_Caixa2.Active:=True;
  dblTipoPagamento.KeyValue:=5;

  edtChequeCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);
  edtCodigoCHQ.Text := '0';

end;

procedure TfMxRecebAvulsoCPD1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Parametro1.Active:=False;
  Parametro2.Active:=False;
  Conta_de_Caixa1.Active:=False;
  Conta_de_Caixa2.Active:=False;
  Action:=caFree;
end;

procedure TfMxRecebAvulsoCPD1.BitBtn2Click(Sender: TObject);
Var
  mensagem:String;
  Trans: Boolean;
  CaixaCNC: integer;
begin
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  if (DM.Configuracao1.Empresa = empMotical) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 LOG_DATA_HORA '+
        ' FROM LOG '+
        ' WHERE LOG_DATA_HORA>="'+MesDia(DM.Configuracao1.Data+1)+'" ';
      Open;
      if not IsEmpty then
        Raise exception.Create('Já existe Log com data superior a atual do sistema!');
    end;
  end;

  mensagem := '';
  if not VerificaFloatBranco(edtValor.text) then
    mensagem:='Valor digitado incorretamente!'+#13;
  if dblContaAgendada.Text = '' then
    mensagem:=mensagem+'Conta de caixa faltando!'+#13;
  if dblTipoPagamento.Text = '' then
    mensagem:=mensagem+'Conta de caixa faltando!'+#13;
  if dblTipoDocumento.Text = '' then
    mensagem:=mensagem+'Tipo de documento faltando'+#13;
  if dblTipoPagamento.Text = '' then
    mensagem:=mensagem+'Tipo de pagamento faltando'+#13;
  if not VerificaDataBranco(mskCompetencia.Text) then
    mensagem:=mensagem+'Data de competência inválida!'+#13;
  if Trim(edtDescricao.Text) = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if mensagem<>'' then
    raise Exception.Create(mensagem);

  Trans:=false;
  with DM.Database2 do
  Begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,dblContaAgendada.KeyValue,
           dblContaRecebimento.KeyValue,DM.Configuracao1.CodigoCAX,dblTipoPagamento.KeyValue,
           dblTipoDocumento.KeyValue,DM.Movimento_caixa1.CentroDeCusto,
           StrToInt(edtChequeCNC.Text), StrToInt(edtCodigoCHQ.Text),
           edtDescricao.Text, '0' (*Flag*),edtNumero.Text,
           memObservacao.Text,edtSequencia.Text,
           'C',StrToFloat(edtValor.Text),0(*Desconto*),0(*Juros*),
           0(*CredCli*),StrToFloat(edtValor.Text)(*ValorDoc*),
           DM.Configuracao1.DataHora,StrToDate(mskCompetencia.Text),0(*DtCheque*),
           0(*CdTIT*),0(*CdCNCTit*),'A') then
      Begin
        ShowMessage('Falha - Entrar em contato com o suporte!');
        Raise exception.Create('');
      end;

      if (dblTipoPagamento.KeyValue = 6) and
         (not DM.Configuracao1.IgnorarCheques) then
      Begin
        //Gerar Movimento de Cheque
        if not DM.Movimento_de_Cheque1.Inserir(DM.Configuracao1.CodigoCNC,
          StrToInt(edtChequeCNC.Text), StrToInt(edtCodigoCHQ.Text), DM.Configuracao1.CodigoCNC,
          DM.Movimento_caixa1.SCodigo, 4010 (*Rec Avulso*), StrToFloat(edtValor.Text)) then
        Begin
          ShowMessage('Falha ao gerar Movimento de Cheque!');
          Raise exception.Create('');
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;

      try
        sndPlaySound(PChar(cSomRegistradora),SND_ASYNC);
      except
      end;
      ShowMessage('Recebimento Efetuado!');

    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
          RollBack;
      Exit;
    end;
  end;

  if DM.Configuracao1.Empresa = empLuciano then
    close
  else
  Begin
    mskCompetencia.Text := DateToStr(DM.Configuracao1.Data);
    edtDescricao.Clear;
    edtNumero.Clear;
    edtValor.Clear;
    edtSequencia.Clear;
    edtDataMovimento.Text := FormatDatetime('dd/mm/yyyy hh:nn:ss',DM.Configuracao1.DataHora);
    memObservacao.Clear;
    mskCompetencia.SetFocus;
  end;
end;

procedure TfMxRecebAvulsoCPD1.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxRecebAvulsoCPD1.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  edtDataMovimento.text := FormatDatetime('dd/mm/yyyy hh:nn:ss',DM.Configuracao1.DataHora);
  mskCompetencia.Text:=DateToStr(DM.Configuracao1.Data);
  dblTipoDocumento.KeyValue := 80;
  dblTipoPagamento.KeyValue := 5;  
end;


procedure TfMxRecebAvulsoCPD1.dblContaAgendadaClick(Sender: TObject);
begin
  dblContaRecebimento.KeyValue := dblContaAgendada.KeyValue;
end;

procedure TfMxRecebAvulsoCPD1.dblTipoPagamentoClick(Sender: TObject);
begin
  if (dblTipoPagamento.KeyValue = 6) and
     (not DM.Configuracao1.IgnorarCheques) then
  Begin
    edtCodigoCHQ.Enabled := True;
    Application.CreateForm(TfMxCheque,fMxCheque);
    fMxCheque.tag:=4;
    fMxCheque.edtTituloCNC.Text:= inttostr(DM.Configuracao1.CodigoCNC);
    fMxCheque.edtTitulo.Text := '0';
    fMxCheque.edtValor.Text := edtValor.Text;
    fMxCheque.ShowModal;
  End
  else
  Begin
    edtCodigoCHQ.Enabled := False;
    edtCodigoCHQ.Text := '0';
  end;
end;

procedure TfMxRecebAvulsoCPD1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;

  if key = #13 then
    BitBtn2Click(BitBtn2);
end;

end.
