unit MxVerificaCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Menus, Movimento_caixa,
  Conta_de_Caixa, Db, DBTables, SQuery, Parametro,Variants,MMSystem,
  ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfMxVerificaCaixa = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtNumero: TEdit;
    edtValor: TEdit;
    memObservacao: TMemo;
    dblTipoPagamento: TDBLookupComboBox;
    edtSequencia: TEdit;
    Panel2: TPanel;
    edtDataMovimento: TEdit;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Parametro1: TParametro;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    DSParametro1: TDataSource;
    dblTipoDocumento: TDBLookupComboBox;
    Label1: TLabel;
    mskCompetencia: TMaskEdit;
    ActionManager1: TActionManager;
    Confirmar: TAction;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure MenuItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxVerificaCaixa: TfMxVerificaCaixa;

implementation
Uses
  UDM,funcoes, UVerificaCaixa;
{$R *.DFM}

procedure TfMxVerificaCaixa.MenuItem1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxVerificaCaixa.FormCreate(Sender: TObject);
begin
  Parametro1.Active:=True;
  Parametro2.Active:=True;
end;

procedure TfMxVerificaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Parametro1.Active:=False;
  Parametro2.Active:=False;
  Action:=caFree;
end;

procedure TfMxVerificaCaixa.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxVerificaCaixa.BitBtn2Click(Sender: TObject);
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
  if dblTipoPagamento.Text = '' then
    mensagem:=mensagem+'Conta de caixa faltando!'+#13;
  if dblTipoDocumento.Text = '' then
    mensagem:=mensagem+'Tipo de documento faltando'+#13;
  if dblTipoPagamento.Text = '' then
    mensagem:=mensagem+'Tipo de pagamento faltando'+#13;
  if not VerificaDataBranco(mskCompetencia.Text) then
    mensagem:=mensagem+'Data de competência inválida!'+#13;
  if DM.Configuracao1.ContaVerificaCaixa <= 0 then
    mensagem:=mensagem+'Conta de Verificação de Caixa Inválida!'+#13;
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

      if not DM.Movimento_caixa1.Inserir(CaixaCNC,0,
          DM.Configuracao1.ContaVerificaCaixa,DM.Configuracao1.ContaVerificaCaixa,
          DM.Configuracao1.CodigoCAX,dblTipoPagamento.KeyValue,
          dblTipoDocumento.KeyValue,DM.Movimento_caixa1.CentroDeCusto,
          0(*ChequeCNC*), 0(*Cheque*),
          Parametro1.Descricao+':'+Format('%.2f',[StrToFloat(edtValor.Text)]),
          '0' (*Flag*),edtNumero.Text,memObservacao.Text,
          edtSequencia.Text,'D',0(*Valor*),0(*Desconto*),0(*Juros*),
          0(*CredCli*),0(*ValorDoc*),
          DM.Configuracao1.DataHora,StrToDate(mskCompetencia.Text),0(*DtCheque*),
          0(*CdTIT*),0(*CdCNCTit*),'M') then
      Begin
        ShowMessage('Falha ao gerar Movimento de Caixa!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;
      Application.CreateForm(Trpt_VerificaCaixa,rpt_VerificaCaixa);
      with rpt_VerificaCaixa do
      Begin
        Tag := 0;
        Entidade.Close;
        Entidade.ParamByName('CNC_CODIGO').AsInteger := CaixaCNC;
        Entidade.ParamByName('MVC_CODIGO').AsInteger := DM.Movimento_caixa1.SCodigo;
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;

    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para a o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
          RollBack;
      Exit;
    end;
  end;

  if DM.Configuracao1.Empresa = empLBM then
  Begin
    mskCompetencia.Text := DateToStr(DM.Configuracao1.Data);
    edtNumero.Clear;
    edtValor.Clear;
    edtSequencia.Clear;
    edtDataMovimento.Text := FormatDatetime('dd/mm/yyyy hh:nn:ss',DM.Configuracao1.DataHora);
    memObservacao.Clear;
    mskCompetencia.SetFocus;
  end
  else
    Close;
end;

procedure TfMxVerificaCaixa.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  edtDataMovimento.Text := FormatDatetime('dd/mm/yyyy hh:nn:ss',DM.Configuracao1.DataHora);
  mskCompetencia.Text:=DateToStr(DM.Configuracao1.Data);
  dblTipoDocumento.KeyValue := 77;
  dblTipoPagamento.KeyValue := 5;
end;

procedure TfMxVerificaCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;

  if key = #13 then
    BitBtn2Click(BitBtn2);
end;

end.
