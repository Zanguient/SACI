unit MxPrecoCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Menus, JPEG, Custo, Produto, Item_de_Estoque;

type
  TfMxPrecoCusto = class(TForm)
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
    edtProduto: TEdit;
    edtCodigoCUS: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    DSCusto1: TDataSource;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Clientes1: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Label4: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    edtObservacao: TEdit;
    Custo1: TCusto;
    Label5: TLabel;
    edtCodigoPRD: TEdit;
    Label6: TLabel;
    edtCodigoFOR: TEdit;
    Label7: TLabel;
    edtCodigoPCP: TEdit;
    edtFornecedor: TEdit;
    labQuantidade: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label9: TLabel;
    edtQuantidade: TEdit;
    edtPrecoCompra: TEdit;
    edtPrecoCusto: TEdit;
    edtFrete: TEdit;
    edtICMS: TEdit;
    Label10: TLabel;
    Label13: TLabel;
    edtIPI: TEdit;
    edtValorMedio: TEdit;
    Custo1CUS_CODIGO: TIntegerField;
    Custo1PCP_CODIGO: TIntegerField;
    Custo1CNC_PEDIDO: TIntegerField;
    Custo1USU_CODIGO: TIntegerField;
    Custo1CUS_DT_CADASTRO: TDateTimeField;
    Custo1CUS_DT_ALTERADO: TDateTimeField;
    Custo1PRD_CODIGO: TIntegerField;
    Custo1FOR_CODIGO: TIntegerField;
    Custo1CUS_QUANTIDADE: TFloatField;
    Custo1CUS_VALOR_COMPRA: TFloatField;
    Custo1CUS_VALOR_CUSTO: TFloatField;
    Custo1CUS_FRETE: TFloatField;
    Custo1CUS_ICMS: TFloatField;
    Custo1CUS_IPI: TFloatField;
    Custo1CUS_VALOR_MEDIO: TFloatField;
    Custo1CNC_CODIGO: TIntegerField;
    Custo1CUS_OBSERVACAO: TStringField;
    Custo1Produto: TStringField;
    Produto1: TProduto;
    Fornecedor1: TFornecedor;
    Label12: TLabel;
    edtUsuario: TEdit;
    Label16: TLabel;
    edtQtd31122002Mat: TEdit;
    Label17: TLabel;
    edtQtd31122002Fil: TEdit;
    Label18: TLabel;
    edtICMSFrete: TEdit;
    Custo1CUS_ICMS_FRETE: TFloatField;
    Label21: TLabel;
    edtQuantidadeAnterior: TEdit;
    Custo1CUS_QUANTIDADE_ANT: TFloatField;
    Label22: TLabel;
    edtCustoAnterior: TEdit;
    Custo1CUS_CUSTO_ANT: TFloatField;
    Label23: TLabel;
    edtPrecoFinal: TEdit;
    Label24: TLabel;
    Custo1CUS_PRECO_FINAL: TFloatField;
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
    procedure Custo1AfterScroll(DataSet: TDataSet);
    procedure Custo1CalcFields(DataSet: TDataSet);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TCusto;
  end;

var
  fMxPrecoCusto: TfMxPrecoCusto;

implementation
Uses UDM,funcoes, MxSPediProd, MxSPediProdMotCal, MxSCotaFor;
{$R *.DFM}



procedure TfMxPrecoCusto.SB_PrimClick(Sender: TObject);
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

procedure TfMxPrecoCusto.SB_AntClick(Sender: TObject);
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

procedure TfMxPrecoCusto.SB_ProxClick(Sender: TObject);
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

procedure TfMxPrecoCusto.SB_UltClick(Sender: TObject);
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

procedure TfMxPrecoCusto.AtualizaControles(Habilitar:Boolean);
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

procedure TfMxPrecoCusto.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6860)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtProduto.Clear;
  edtCodigoPRD.SetFocus;
end;

procedure TfMxPrecoCusto.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6870)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtCodigoPRD.SetFocus;
end;

procedure TfMxPrecoCusto.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6880)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.Deletarauto;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtProduto.Clear;
  end;
end;

procedure TfMxPrecoCusto.SB_SalvaCabClick(Sender: TObject);
var
  CdCUS: integer;
begin
  CdCUS := StrToInt(edtCodigoCUS.Text);
  If Entidade.FinalizaEdicao then
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');

  Entidade.Close;
  Entidade.SQL.Text := 'SELECT * FROM CUSTO '+
    ' WHERE CUS_CODIGO='+IntToStr(CdCUS);
  Entidade.Open;
end;

procedure TfMxPrecoCusto.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtProduto.Clear;
  end;
end;

procedure TfMxPrecoCusto.FormCreate(Sender: TObject);
begin
  Entidade:=Custo1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_Custo_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxPrecoCusto.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Selecionar;
end;

procedure TfMxPrecoCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_Custo_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxPrecoCusto.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxPrecoCusto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxPrecoCusto.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Open;  
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfMxPrecoCusto.FormKeyPress(Sender: TObject; var Key: Char);
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
  else if Key=#13 then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfMxPrecoCusto.Custo1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtProduto.Text := Entidade.FieldByName('Produto').asString;
  //Definir a Quantidade em 31/12/2002
  edtQtd31122002Mat.Text := format('%.2f',[SaldoAnteriorFiscal(DM.QR_Comandos,
                            1,Entidade.CodigoPRD, StrToDate('31/12/2002'))]);
  edtQtd31122002Fil.Text := format('%.2f',[SaldoAnteriorFiscal(DM.QR_Comandos,
                            2,Entidade.CodigoPRD, StrToDate('31/12/2002'))]);
end;

procedure TfMxPrecoCusto.Custo1CalcFields(DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> Entidade.CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    Entidade.FieldByName('Produto').asString := Descricao;
  end;
end;

procedure TfMxPrecoCusto.edtCodigoPRDExit(Sender: TObject);
begin
  If SB_CancCab.Focused then
    Exit;

  edtProduto.Clear;
  edtQtd31122002Mat.Clear;
  edtQtd31122002Fil.Clear;
  if not VerificaInteiroBranco(edtCodigoPRD.text) then
  Begin
    Showmessage('Código de produto inválido');
    edtCodigoPRD.SetFocus;
    Exit;
  End;
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
  Produto1.Open;
  if Produto1.IsEmpty then
  Begin
    Showmessage('Produto inválido');
    edtCodigoPRD.SetFocus;
    Exit;
  End
  else
  Begin
    edtProduto.Text   := Produto1.Descricao;
    if Trim(edtCodigoFOR.Text) = '' then
    Begin
      edtCodigoFOR.Text := IntToStr(Produto1.CodigoFOR);
      edtCodigoFORExit(sender);
    end;
    //Definir a Quantidade em 31/12/2002
    edtQtd31122002Mat.Text := format('%.2f',[SaldoAnteriorFiscal(DM.QR_Comandos,
                              1,StrToInt(edtCodigoPRD.Text), StrToDate('31/12/2002'))]);
    edtQtd31122002Fil.Text := format('%.2f',[SaldoAnteriorFiscal(DM.QR_Comandos,
                              2,StrToInt(edtCodigoPRD.Text), StrToDate('31/12/2002'))]);
  end;
end;

procedure TfMxPrecoCusto.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Clear;
    edtProduto.Clear;
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=55;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=55;
        ShowModal;
      end;
    end;
    edtCodigoFOR.SetFocus;
  End;
end;

procedure TfMxPrecoCusto.edtCodigoFORExit(Sender: TObject);
begin
  If SB_CancCab.Focused then
    Exit;

  If edtCodigoFOR.Text<>'' then
    If VerificaInteiro(edtCodigoFOR.text) then
    Begin
      Fornecedor1.Close;
      Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=StrToInt(edtCodigoFOR.Text);
      Fornecedor1.Open;
      If Fornecedor1.IsEmpty then
      Begin
        edtCodigoFOR.setFocus;
        ShowMessage('Fornecedor inválido!');
      End
      else
        edtFornecedor.Text:=Fornecedor1.RazaoSocial;
    End
    else
    Begin
      edtCodigoFOR.setFocus;
      ShowMessage('Fornecedor inválido!');
    end;
end;

procedure TfMxPrecoCusto.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=34;
    fMxSCotaFor.ShowModal;
  end;
end;

end.
