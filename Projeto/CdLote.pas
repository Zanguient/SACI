unit CdLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Menus, JPEG, Lote;

type
  TfCadLote = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    edtDescricao: TEdit;
    edtCodigoLOT: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    DSLote1: TDataSource;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    MenuLote: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Label4: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    edtObservacao: TEdit;
    Lote1: TLote;
    Label5: TLabel;
    mskDataValidade: TMaskEdit;
    Label6: TLabel;
    edtPrecoCompra: TEdit;
    Label7: TLabel;
    edtPrecoCusto: TEdit;
    Label8: TLabel;
    edtReferencia: TEdit;
    Label9: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    Label10: TLabel;
    bitConfirmar: TBitBtn;
    ckbMaiorQueZero: TCheckBox;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Lote1AfterScroll(DataSet: TDataSet);
    procedure Lote1BeforeOpen(DataSet: TDataSet);
    procedure bitConfirmarClick(Sender: TObject);
    procedure ckbMaiorQueZeroClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TLote;
  end;

var
  fCadLote: TfCadLote;

implementation

Uses UDM,funcoes, MxFotoAmpliada, MxPedCompra, MxInventario,
  MxPedidoMotCal, MxEmprestimo, MxTransferencia, MxServico, MxSEstEntrada,
  UOp_RelatProd;

{$R *.DFM}

procedure TfCadLote.SB_PrimClick(Sender: TObject);
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

procedure TfCadLote.SB_AntClick(Sender: TObject);
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

procedure TfCadLote.SB_ProxClick(Sender: TObject);
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

procedure TfCadLote.SB_UltClick(Sender: TObject);
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

procedure TfCadLote.AtualizaControles(Habilitar:Boolean);
begin
  SairCab.Enabled:=not habilitar;
  IncluirCab.Enabled:=not habilitar;
  AlterarCab.Enabled:=not habilitar;
  ExcluirCab.Enabled:=not habilitar;
  LocalizarCab.Enabled:=not habilitar;
  SalvarCab.Enabled:=habilitar;
  CancelarCab.Enabled:=habilitar;
  SB_Prim.Enabled:=not habilitar;
  SB_Ant.Enabled:=not habilitar;
  SB_Prox.Enabled:=not habilitar;
  SB_Ult.Enabled:=not habilitar;
  SB_NovoCab.Enabled:=not habilitar;
  SB_LocCab.Enabled:=not habilitar;
  SB_AltCab.Enabled:=not habilitar;
  SB_ExcCab.Enabled:=not habilitar;
  SB_SalvaCab.Enabled:=habilitar;
  SB_CancCab.Enabled:=habilitar;

  bitConfirmar.Enabled:=not habilitar;

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

procedure TfCadLote.SB_NovoCabClick(Sender: TObject);
begin
  if not (Self.Tag in [0,1,2]) then
    Exit;
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8730)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtDescricao.SetFocus;
end;

procedure TfCadLote.SB_AltCabClick(Sender: TObject);
begin
  if not (Self.Tag in [0,1,2]) then
    Exit;
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8730)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtDescricao.SetFocus;
end;

procedure TfCadLote.SB_ExcCabClick(Sender: TObject);
begin
  if not (Self.Tag in [0,1,2]) then
    Exit;
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8750)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  with DM.QR_Consultas do
  Begin
    //Verificar a existência de Item de Estoque para esse Lote
    Close;
    SQL.Text := 'SELECT PRD_CODIGO '+
      ' FROM ITEM_DE_ESTOQUE_DETALHE '+
      ' WHERE LOT_CODIGO='+IntToStr(Entidade.CodigoLOT);
    Open;
    if not IsEmpty then
      Raise exception.Create('Existem Item de Estoque desse Lote! ('+FieldByName('PRD_CODIGO').asString+')');
  end;
  Entidade.Deletarauto;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadLote.SB_SalvaCabClick(Sender: TObject);
var
  CdLOT :Integer;
begin
  CdLOT := StrToInt(edtCodigoLOT.Text);
  
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(False);
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM LOTE '+
      ' WHERE PRD_CODIGO=:PRD_CODIGO';
    Entidade.Open;
    Entidade.locate('LOT_CODIGO', CdLOT, []);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadLote.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadLote.FormCreate(Sender: TObject);
begin
  Entidade:=Lote1;
end;

procedure TfCadLote.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadLote.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfCadLote.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadLote.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if not (self.Tag IN [0,1,2]) then //Pedido de Compra e Inventário
  Begin
    IncluirCab.Visible := False;
    AlterarCab.Visible := False;
    ExcluirCab.Visible := False;
    N1.Visible := False;
    SalvarCab.Visible := False;
    CancelarCab.Visible := False;
    N2.Visible := False;
    SB_NovoCab.Visible := False;
    SB_AltCab.Visible := False;
    SB_ExcCab.Visible := False;
    SB_SalvaCab.Visible := False;
    SB_CancCab.Visible := False;
  end
  else
    ckbMaiorQueZero.Checked := False;
  if not Entidade.Active then
    Entidade.Open;

  if (VerificaInteiroBranco(edtCodigoPRD.Text)) and
     (edtCodigoPRD.Text <> '0') and
     (edtProduto.Text = '') then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+edtCodigoPRD.Text;
      Open;
      edtProduto.Text := FieldByName('PRD_DESCRICAO').asString+' '+FieldByName('PRD_CARACTERISTICA').asString;
    end;
  end;

  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadLote.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    Key := #0;
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if Key=#13 then
  Begin
    Key := #0;
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
    else if bitConfirmar.Enabled then
    Begin
      bitConfirmar.SetFocus;
      bitConfirmarClick(sender);
    end;
  end;
end;

procedure TfCadLote.Lote1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadLote.Lote1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
  except
  end;
end;

procedure TfCadLote.bitConfirmarClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Lote!');

  if self.Tag = 1 then //Pedido de Compra
    fMxPedComp.edtCodigoLOT.Text := IntToStr(Entidade.CodigoLOT)
  else if self.Tag = 2 then //Inventário
    fMxInvent.edtCodigoLOT.Text := IntToStr(Entidade.CodigoLOT)
  else if self.Tag = 3 then //Pedido Motical
    fMxPedidoMotCal.edtCodigoLOT.Text := IntToStr(Entidade.CodigoLOT)
  else if self.Tag = 4 then //Emprestimo
    fMxEmprestimo.edtCodigoLOT.Text := IntToStr(Entidade.CodigoLOT)
  else if self.Tag = 5 then //Transferência
    fMxTransfer.edtCodigoLOT.Text := IntToStr(Entidade.CodigoLOT)
  else if self.Tag = 6 then //Pedido de Serviço
    fMxServico.edtCodigoLOT.Text := IntToStr(Entidade.CodigoLOT)
  else if self.Tag = 7 then //Movimento Avulso
    fMxSEstEntrada.edtCodigoLOT.Text := IntToStr(Entidade.CodigoLOT)
  else if self.Tag = 8 then //Relatório de Estoque
    Op_RelatProd.edtCodigoLOT.Text := IntToStr(Entidade.CodigoLOT);

  Close;
end;

procedure TfCadLote.ckbMaiorQueZeroClick(Sender: TObject);
var
  CdLOT: integer;
begin
  CdLOT := Entidade.CodigoLOT;
  
  if ckbMaiorQueZero.Checked then
    Entidade.Selecao.Text := ' AND PRD_CODIGO=:PRD_CODIGO '+
                                ' AND LOT_QTD_FISICO>0 '
  else
    Entidade.Selecao.Text := ' AND PRD_CODIGO=:PRD_CODIGO ';

  Entidade.Close;
  Entidade.Open;
  Entidade.locate('LOT_CODIGO', CdLOT, []);
end;

end.
