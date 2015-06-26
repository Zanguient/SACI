unit MxMovimentoContaCorrente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, NotaFiscal, Menus, Conta,
  CentroCusto, Usuario, Parametro, Cheque, Movimento_de_Conta_Corrente,
  ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfMxMovimentoContaCorrente = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoMCC: TEdit;
    edtValor: TEdit;                                                     
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    mskDataDeposito: TMaskEdit;
    Panel1: TPanel;
    SB_LocCab: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_NovoCab: TSpeedButton;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Label10: TLabel;
    cmbDC: TComboBox;
    DSMovimento_de_Conta_Corrente1: TDataSource;
    cmbSituacao: TComboBox;
    edtDocumento: TEdit;
    Label2: TLabel;
    SB_FecharCab: TSpeedButton;
    Label3: TLabel;
    CentroCusto2: TCentroCusto;
    SB_Imprimir: TSpeedButton;
    Label16: TLabel;
    Label4: TLabel;
    mskDataCadastro: TMaskEdit;
    DSParametro2: TDataSource;
    Parametro2: TParametro;
    Label5: TLabel;
    dblTipo: TDBLookupComboBox;
    edtObservacao: TEdit;
    Movimento_de_Conta_Corrente1: TMovimento_de_Conta_Corrente;
    edtCodigoCBN: TEdit;
    Movimento_de_Conta_Corrente1Centro: TStringField;
    Movimento_de_Conta_Corrente1CNC_CODIGO: TIntegerField;
    Movimento_de_Conta_Corrente1CNC_ORIGEM: TIntegerField;
    Movimento_de_Conta_Corrente1MCC_CODIGO: TIntegerField;
    Movimento_de_Conta_Corrente1USU_CODIGO: TIntegerField;
    Movimento_de_Conta_Corrente1CBN_CODIGO: TIntegerField;
    Movimento_de_Conta_Corrente1MCC_MAQUINA: TIntegerField;
    Movimento_de_Conta_Corrente1MCC_DT_CADASTRO: TDateTimeField;
    Movimento_de_Conta_Corrente1MCC_DT_COMPETENCIA: TDateTimeField;
    Movimento_de_Conta_Corrente1MCC_DC: TStringField;
    Movimento_de_Conta_Corrente1MCC_TIPO: TIntegerField;
    Movimento_de_Conta_Corrente1MCC_DOCUMENTO: TStringField;
    Movimento_de_Conta_Corrente1MCC_SALDO_ANT: TFloatField;
    Movimento_de_Conta_Corrente1MCC_SITUACAO: TIntegerField;
    Movimento_de_Conta_Corrente1MCC_OBSERVACAO2: TStringField;
    Movimento_de_Conta_Corrente1MCC_VALOR: TFloatField;
    Movimento_de_Conta_Corrente1MCC_SALDO_MOVIMENTO: TFloatField;
    Movimento_de_Conta_Corrente1Usuario: TStringField;
    SB_ExcCab: TSpeedButton;
    bitConfirmar: TBitBtn;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    Action7: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    AlterarCab: TAction;
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbDCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_FecharCabClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure bitConfirmarClick(Sender: TObject);
    procedure Movimento_de_Conta_Corrente1AfterScroll(DataSet: TDataSet);
    procedure Movimento_de_Conta_Corrente1CalcFields(DataSet: TDataSet);
    procedure Parametro2BeforeOpen(DataSet: TDataSet);
    procedure Movimento_de_Conta_Corrente1BeforeOpen(DataSet: TDataSet);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
  public
    Cancelar: Boolean;
    Entidade:TMovimento_de_Conta_Corrente;
  end;

var
  fMxMovimentoContaCorrente: TfMxMovimentoContaCorrente;

implementation
Uses
  UDM, Funcoes, MxSRecParcela;
{$R *.DFM}

procedure TfMxMovimentoContaCorrente.SB_NovoCabClick(Sender: TObject);
begin
  if cmbDC.ItemIndex < 0 then
    Raise exception.Create('Selecione se é Débido ou Crédito!');

  if cmbDC.ItemIndex = 0 then //Débito
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(7500)) < 0 then
      Raise Exception.Create('O usuário não tem permissão para inserir Débito Manual em Conta Corrente!');
  end
  else
  Begin
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(7490)) < 0 then
      Raise Exception.Create('O usuário não tem permissão para inserir Crédito Manual em Conta Corrente!');
  end;

  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir movimentos neste centro de custo!');

  Entidade.PreparaInsercao;
  AtualizaControles(1,True);

  if cmbDC.ItemIndex = 0 then //Débito
    dblTipo.KeyValue := 4120 //Pag Fornecedor
  else
    dblTipo.KeyValue := 4110; //Rec Cliente

  try
    edtCodigoCBN.SetFocus;
  except
  end;
end;

procedure TfMxMovimentoContaCorrente.SB_SalvaCabClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
    AtualizaControles(1,False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxMovimentoContaCorrente.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
end;

procedure TfMxMovimentoContaCorrente.FormCreate(Sender: TObject);
begin
  Entidade:=Movimento_de_Conta_Corrente1;
end;

procedure TfMxMovimentoContaCorrente.SB_LocCabClick(Sender: TObject);
begin
  Entidade.Selecionar;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos
  else
    Entidade.CarregaDados;
end;

procedure TfMxMovimentoContaCorrente.Cliente1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxMovimentoContaCorrente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;


procedure TfMxMovimentoContaCorrente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxMovimentoContaCorrente.cmbDCClick(Sender: TObject);
begin
  Parametro2.Close;
  Parametro2.Open;
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfMxMovimentoContaCorrente.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if tag = 0 then
    bitConfirmar.Visible := false;

  if tag = 1 then
    cmbDC.ItemIndex := 1 //Crédito
  else
    cmbDC.ItemIndex := 0; //Débito

  cmbDCClick(sender);

  if not Entidade.Active then
    Entidade.Active:=true;

  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
end;

procedure TfMxMovimentoContaCorrente.SB_FecharCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxMovimentoContaCorrente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if key=chr(13) then
  Begin
    if (SB_SalvaCab.Enabled) then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
    else if bitConfirmar.Visible then
    Begin
      bitConfirmar.SetFocus;
      bitConfirmarClick(sender);
    end;
  end;
end;

procedure TfMxMovimentoContaCorrente.SB_ImprimirClick(Sender: TObject);
begin
  if Entidade.isEmpty then
    Raise Exception.Create('Selecione o Movimento primeiro!');

{  Application.CreateForm(Trpt_ImprimirCopiaCheque,rpt_ImprimirCopiaCheque);
  with rpt_ImprimirCopiaCheque do
  Begin
    Tag:=0;
    Entidade.Close;
    Entidade.ParamByName('CNC_CODIGO').asInteger := fMxCheque.Entidade.CodigoCNC;
    Entidade.ParamByName('CHQ_CODIGO').asInteger := fMxCheque.Entidade.CodigoCHQ;
    Entidade.Open;
    report.Preview;
    Close;
  end;
}
end;

procedure TfMxMovimentoContaCorrente.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarCab.Enabled  := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);
  SB_Imprimir.Enabled    := not Habilitar;
  SB_FecharCab.Enabled      := not Habilitar;

  edtLocalizar.Enabled := not Habilitar;
  if Habilitar then
    edtLocalizar.Color := AlteraCorComponentes
  else
    edtLocalizar.Color := clWindow;
  cmbCampo.Enabled     := not Habilitar;
  if Habilitar then
    cmbCampo.Color     :=AlteraCorComponentes
  else
    cmbCampo.Color     :=clWindow;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfMxMovimentoContaCorrente.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCBN.Clear;
    key:=chr(0);
{    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=35;
    fCadCli.CentroCusto2.open;
    if DM.Configuracao1.Empresa = empLBM then
      fCadCli.dblCentroDeCusto.KeyValue := 1
    else
      fCadCli.dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
    With fCadCli.Cliente1 do
    Begin
      Close;
      if VerificaInteiroBranco(self.edtCodigoCLI.Text) and
         VerificaInteiroBranco(self.edtClienteCNC.Text) then
        SQL.Text:='SELECT * FROM CLIENTE '+
          ' WHERE CLI_CODIGO='+self.edtCodigoCLI.Text+
          ' AND CNC_CODIGO='+self.edtClienteCNC.Text;
      Open;
    End;
    fCadCli.Showmodal;
}
  End;
end;

procedure TfMxMovimentoContaCorrente.bitConfirmarClick(Sender: TObject);
begin
  if Entidade.isEmpty then
    Raise exception.Create('Selecione o registro!');

  if tag = 1 then //Recebimento de Título
  Begin
    fMxSRecPParc.edtMovimentoContaCorrenteCNC.Text  := IntToStr(Entidade.CodigoCNC);
    fMxSRecPParc.edtCodigoMCC.Text  := IntToStr(Entidade.CodigoMCC);
    fMxSRecPParc.mskDataPag.Text := DateToStr(Entidade.DataCompetencia);
    if StrToFloat(fMxSRecPParc.edtValorTotal.Text) >= Entidade.Valor then
      fMxSRecPParc.edtValorPago.Text    := format('%.2f',[Entidade.Valor])
    else
      fMxSRecPParc.edtValorPago.Text    := fMxSRecPParc.edtValorTotal.Text;
  end;
  Close;
end;

procedure TfMxMovimentoContaCorrente.Movimento_de_Conta_Corrente1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxMovimentoContaCorrente.Movimento_de_Conta_Corrente1CalcFields(
  DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);

  with CentroCusto2 do
  Begin
    if Entidade.CodigoCNC <> CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
    end;
    Entidade.FieldByName('Centro').asString := RazaoSocial;
  end;
end;

procedure TfMxMovimentoContaCorrente.Parametro2BeforeOpen(
  DataSet: TDataSet);
begin
  try
    Parametro2.ParamByName('PAR_INFORMACAO').asInteger := cmbDC.ItemIndex; //0 - Débito; 1 - Crédito
  except
  end;
end;

procedure TfMxMovimentoContaCorrente.Movimento_de_Conta_Corrente1BeforeOpen(
  DataSet: TDataSet);
begin
  if cmbDC.ItemIndex = 0 then
    Entidade.ParamByName('MCC_DC').AsString := 'D'
  else
    Entidade.ParamByName('MCC_DC').AsString := 'C';
end;

procedure TfMxMovimentoContaCorrente.SB_ExcCabClick(Sender: TObject);
Var
  Tipo: String;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Movimento de Conta Corrente!');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7880)) < 0 then
    Raise Exception.Create('Usuário não tem Permissão para Extornar Movimento de Conta Corrente!');
  //
  If MessageDlg('ATENÇÃO!!!'+#13+'Deseja realmente Gerar Extorno deste Movimento de Conta Corrente?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if Entidade.DC = 'D' then
    Tipo := 'C'
  else
    Tipo := 'D';
  //
  
  if not Entidade.Inserir(Entidade.CodigoCNC,Entidade.CodigoCBN,Entidade.Tipo,Entidade.Valor,Entidade.Documento,
       Tipo,Entidade.DataCompetencia,-1,'Extorno do Movimento de Numero:'+IntToStr(Entidade.CodigoMCC)) then
    Raise exception.Create('')
  else
    ShowMessage('Movimento Extornado com Sucesso!');
  //
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxMovimentoContaCorrente.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
