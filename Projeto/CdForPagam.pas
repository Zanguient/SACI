unit CdForPagam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Grupo, Forma_de_Pagamento, Menus, Usuario, Pedido_de_Venda,
  DBCtrls, Parametro, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfCadForPag = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    edtDescricao: TEdit;
    edtCodigoFPG: TEdit;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtPrazoPagamento: TEdit;
    Panel2: TPanel;
    Label5: TLabel;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    Label10: TLabel;
    Label8: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    edtUsuario: TEdit;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Forma_de_Pagamento1CNC_CODIGO: TIntegerField;
    Forma_de_Pagamento1FPG_CODIGO: TIntegerField;
    Forma_de_Pagamento1FPG_PRAZO: TStringField;
    Forma_de_Pagamento1FPG_DESCRICAO: TStringField;
    Forma_de_Pagamento1FPG_PRAZO_MEDIO: TIntegerField;
    Forma_de_Pagamento1USU_CODIGO: TIntegerField;
    Forma_de_Pagamento1FPG_DT_ALTERADO: TDateTimeField;
    Forma_de_Pagamento1Usuario: TStringField;
    Forma_de_Pagamento1FPG_DT_CADASTRO: TDateTimeField;
    ckbCompra: TCheckBox;
    Forma_de_Pagamento1FPG_COMPRA: TIntegerField;
    Forma_de_Pagamento1FPG_SITUACAO: TIntegerField;
    Forma_de_Pagamento1FPG_DESCONTO: TIntegerField;    
    Label12: TLabel;
    edtDesconto: TEdit;
    Label22: TLabel;
    cmbSituacao: TComboBox;
    Label21: TLabel;
    dblTipoExclusivo: TDBLookupComboBox;
    btnLimpaTipoPag: TBitBtn;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    Forma_de_Pagamento1FPG_TIPOPAG_EXCLUSIVO: TIntegerField;
    ckbSomenteAtivos: TCheckBox;
    Pedido_de_Venda1: TPedido_de_Venda;
    Label24: TLabel;
    Label25: TLabel;
    edtCodigoTBP: TEdit;
    edtDescricaoTabela: TEdit;
    Forma_de_Pagamento1TBP_CODIGO: TIntegerField;
    Forma_de_Pagamento1Tabela: TStringField;
    ckbCentavosEntrada: TCheckBox;
    Forma_de_Pagamento1FPG_CENTAVOS_ENTRADA: TIntegerField;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    Sair1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Forma_de_Pagamento1AfterScroll(DataSet: TDataSet);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Forma_de_Pagamento1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure btnLimpaTipoPagClick(Sender: TObject);
    procedure ckbSomenteAtivosClick(Sender: TObject);
    procedure edtCodigoTBPExit(Sender: TObject);
    procedure edtCodigoTBPKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    Entidade:TForma_de_Pagamento;
  end;

var
  fCadForPag: TfCadForPag;

implementation

Uses UDM,funcoes, MxLocalizaTabelaPreco;

{$R *.DFM}

procedure TfCadForPag.AtualizaControles(Habilitar: Boolean);
begin
  btnLimpaTipoPag.Enabled:=Habilitar;
  Incluir1.Enabled:=not Habilitar;
  Alterar1.Enabled:=not Habilitar;
  Excluir1.Enabled:=not Habilitar;
  Localizar1.Enabled:=not Habilitar;
  Salvar1.Enabled:=Habilitar;
  Cancelar1.Enabled:=Habilitar;
  SB_Prim.Enabled:=not Habilitar;
  SB_Ant.Enabled:=not Habilitar;
  SB_Prox.Enabled:=not Habilitar;
  SB_Ult.Enabled:=not Habilitar;
  SB_Novo.Enabled:=not Habilitar;
  SB_Loc.Enabled:=not Habilitar;
  SB_Alt.Enabled:=not Habilitar;
  SB_Exc.Enabled:=not Habilitar;
  SB_Salva.Enabled:=Habilitar;
  SB_Canc.Enabled:=Habilitar;

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
    
end;

procedure TfCadForPag.SB_PrimClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfCadForPag.SB_AntClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.Prior;
    If Entidade.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfCadForPag.SB_ProxClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Next;
    If Entidade.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfCadForPag.SB_UltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfCadForPag.SB_NovoClick(Sender: TObject);
begin
  if not DM.Configuracao1.CPD then
    Raise Exception.Create('Somente no CPD');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Somente no Centro de Custo CPD');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1060)) < 0) then
    Raise exception.Create('Usuário não tem permissão para inserir Forma de Pagamento!');

  edtUsuario.text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtDescricaoTabela.Clear;
  Entidade.PreparaInsercao;
  AtualizaControles(True);
  edtDescricao.SetFocus;
end;

procedure TfCadForPag.SB_AltClick(Sender: TObject);
begin
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem alterados!');
  if not DM.Configuracao1.CPD then
    Raise Exception.Create('Somente no CPD');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Somente no Centro de Custo CPD');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1080)) < 0) then
    Raise exception.Create('Usuário não tem permissão para alterar Forma de Pagamento!');

  edtUsuario.text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtDescricao.SetFocus;
end;

procedure TfCadForPag.SB_ExcClick(Sender: TObject);
var
  CdFPG:integer;
begin
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existem registros para serem deletados!');
  if not DM.Configuracao1.CPD then
    Raise Exception.Create('Somente no CPD');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Somente no Centro de Custo CPD');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1070)) < 0) then
    Raise exception.Create('Usuário não tem permissão para excluir Forma de Pagamento!');

  CdFPG:=Entidade.CodigoFPG;
  Pedido_de_Venda1.Close;
  Pedido_de_Venda1.ParamByName('FPG_CODIGO').asInteger:=CdFPG;
  Pedido_de_Venda1.Open;
  if not Pedido_de_Venda1.IsEmpty then
  Begin
    ShowMessage('Existe(m) '+IntToStr(Pedido_de_Venda1.RecordCount)+
      ' Pedido(s) com esse Agente Financeiro!');
    exit;
  end;

  Entidade.Deletarauto;
  if Entidade.IsEmpty then
    edtDescricaoTabela.Clear;
end;

procedure TfCadForPag.SB_SalvaClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadForPag.SB_CancClick(Sender: TObject);
begin
  edtUsuario.Clear;
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
    edtDescricaoTabela.Clear;  
end;

procedure TfCadForPag.FormCreate(Sender: TObject);
begin
  Entidade:=Forma_de_Pagamento1;
end;

procedure TfCadForPag.SB_LocClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;                    

procedure TfCadForPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadForPag.Forma_de_Pagamento1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
  edtDescricaoTabela.Text := Entidade.FieldByName('Tabela').asString;
  if Entidade.IsEmpty then
    edtDescricaoTabela.Clear;
end;

procedure TfCadForPag.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCadForPag.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadForPag.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Parametro1.Open;
  Entidade.Open;
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadForPag.Forma_de_Pagamento1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM TABELA_DE_PRECO '+
      ' WHERE TBP_CODIGO='+IntToStr(Entidade.CodigoTBP);
    Open;
    if not isEmpty then
      Entidade.FieldByName('Tabela').asString := FieldByName('TBP_DESCRICAO').asString+' VAL:'+FieldByName('TBP_VALIDADE').asString
    else
      Entidade.FieldByName('Tabela').asString := '';     
  end;
end;

procedure TfCadForPag.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end
  else if key=chr(13) then
  Begin
    if SB_Salva.Enabled then
    Begin
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
    end
  end;
end;

procedure TfCadForPag.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfCadForPag.btnLimpaTipoPagClick(Sender: TObject);
begin
  dblTipoExclusivo.KeyValue := 0;
  try
    dblTipoExclusivo.SetFocus;
  except
  end;
end;

procedure TfCadForPag.ckbSomenteAtivosClick(Sender: TObject);
begin
  with Entidade do
  Begin
    Close;
    if ckbSomenteAtivos.Checked then
      SQL.Text := 'SELECT * FROM FORMA_DE_PAGAMENTO '+
                  ' WHERE FPG_SITUACAO=0 '+
                  ' ORDER BY FPG_DESCRICAO '
    else
      SQL.Text := 'SELECT * FROM FORMA_DE_PAGAMENTO '+
                  ' ORDER BY FPG_DESCRICAO ';
    Open;
  end;
end;

procedure TfCadForPag.edtCodigoTBPExit(Sender: TObject);
begin
  edtDescricaoTabela.Clear;
  if not VerificaInteiroBranco(edtCodigoTBP.Text) then
    edtCodigoTBP.Text := '0';
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM TABELA_DE_PRECO '+
      ' WHERE TBP_CODIGO='+edtCodigoTBP.Text;
    Open;
    if not isEmpty then
      edtDescricaoTabela.Text := FieldByName('TBP_DESCRICAO').asString+' VAL:'+FieldByName('TBP_VALIDADE').asString
    else
      edtDescricaoTabela.Text := '';      
  end;
end;

procedure TfCadForPag.edtCodigoTBPKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoTBP.Clear;
    key:=chr(0);
    Application.CreateForm(TfMxLocalizaTabelaPreco, fMxLocalizaTabelaPreco);
    with fMxLocalizaTabelaPreco do
    begin
      Tag:=2;
      ShowModal;
    end;
  end;
end;

end.
