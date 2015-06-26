unit MxTabelaDescontos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Db,
  DBTables, SQuery, Grupo, Fornecedor, Usuario, Descontos, Variants;

type
  TfMxTabelaDescontos = class(TForm)
    Panel13: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edtCodigoDES: TEdit;
    edtDesconto60: TEdit;
    edtCodigoFOR: TEdit;
    edtFornecedor: TEdit;
    Panel14: TPanel;
    DBGrid5: TDBGrid;
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
    Label2: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    edtDescontoGerencia: TEdit;
    Label7: TLabel;
    Label5: TLabel;
    mskAlterado: TMaskEdit;
    Label8: TLabel;
    dblCodigoGRP: TDBLookupComboBox;
    Label9: TLabel;
    Grupo1: TGrupo;
    DSGrupo1: TDataSource;
    Grupo2: TGrupo;
    Fornecedor1: TFornecedor;
    Label10: TLabel;
    mskCadastro: TMaskEdit;
    Label11: TLabel;
    Descontos1: TDescontos;
    DSDescontos1: TDataSource;
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
    Descontos1DES_CODIGO: TIntegerField;
    Descontos1FOR_CODIGO: TIntegerField;
    Descontos1GRP_CODIGO: TIntegerField;
    Descontos1USU_CODIGO: TIntegerField;
    Descontos1DES_DT_CADASTRO: TDateTimeField;
    Descontos1DES_DT_ALTERADO: TDateTimeField;
    Descontos1DES_DESCONTO_60: TFloatField;
    Descontos1DES_DESCONTO_GERENTE: TFloatField;
    Descontos1DES_SITUACAO: TIntegerField;
    edtUsuario: TEdit;
    Descontos1Usuario: TStringField;
    Descontos1CNC_CODIGO: TIntegerField;
    Descontos1Fornecedor: TStringField;
    Descontos1Grupo: TStringField;
    Descontos2: TDescontos;
    Label12: TLabel;
    edtCodigoPRD: TEdit;
    Descontos1PRD_CODIGO: TIntegerField;
    SB_ImprimirCab: TSpeedButton;
    Descontos1DES_DESCONTO_LJ3: TFloatField;
    Label13: TLabel;
    edtDescontoLJ3: TEdit;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_LocCabClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure Descontos1AfterScroll(DataSet: TDataSet);
    procedure SairCabClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Descontos1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirCabClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TDescontos;
  end;

var
  fMxTabelaDescontos: TfMxTabelaDescontos;

implementation
uses UDM,Funcoes, MxSCotaFor, MxSPediProd, MxSPediProdMotCal,
  UTabelaDescontos;
{$R *.DFM}

procedure TfMxTabelaDescontos.SB_PrimClick(Sender: TObject);
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

procedure TfMxTabelaDescontos.SB_AntClick(Sender: TObject);
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

procedure TfMxTabelaDescontos.SB_ProxClick(Sender: TObject);
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

procedure TfMxTabelaDescontos.SB_UltClick(Sender: TObject);
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

procedure TfMxTabelaDescontos.FormCreate(Sender: TObject);
begin
  Entidade:=Descontos1;
end;

procedure TfMxTabelaDescontos.edtCodigoFORExit(Sender: TObject);
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

procedure TfMxTabelaDescontos.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=14;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxTabelaDescontos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo1.Close;
  Grupo2.Close;
  Fornecedor1.Close;
  action:=caFree;    
end;

procedure TfMxTabelaDescontos.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfMxTabelaDescontos.SB_NovoCabClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3840)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(True);
  edtFornecedor.Text:='';
  edtUsuario.Text:=DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtCodigoFOR.setFocus;
end;

procedure TfMxTabelaDescontos.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3840)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');    
  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtCodigoFOR.SetFocus;
end;

procedure TfMxTabelaDescontos.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3840)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.deletarauto;
end;

procedure TfMxTabelaDescontos.SB_SalvaCabClick(Sender: TObject);
begin
  If edtCodigoFOR.Text='' then
    raise Exception.Create('Selecione um fornecedor!');
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Text := '0';
  if edtCodigoPRD.Text <> '0' then
  Begin
    Descontos2.Close;
    Descontos2.SQL.Text:='SELECT DES_CODIGO FROM DESCONTOS '+
      'WHERE DES_CODIGO <> '+edtCodigoDES.Text+' AND PRD_CODIGO='+edtCodigoPRD.Text;
    Descontos2.Open;
    if not Descontos2.IsEmpty then
      Raise Exception.Create('Desconto para esse produto, já cadastrado!');
  end
  else if dblCodigoGRP.Text = '' then
  Begin
    Descontos2.Close;
    Descontos2.SQL.Text:='SELECT DES_CODIGO FROM DESCONTOS '+
      'WHERE DES_CODIGO <> '+edtCodigoDES.Text+' AND FOR_CODIGO='+edtCodigoFOR.Text+
      ' AND (GRP_CODIGO=0 OR GRP_CODIGO IS NULL)';
    Descontos2.Open;
    if not Descontos2.IsEmpty then
      Raise Exception.Create('Desconto para esse fornecedor, s/ grupo, já cadastrado!');
  end
  else
  Begin
    Descontos2.Close;
    Descontos2.SQL.Text:='SELECT DES_CODIGO FROM DESCONTOS '+
      'WHERE DES_CODIGO <> '+edtCodigoDES.Text+' AND FOR_CODIGO='+edtCodigoFOR.Text+
      ' AND GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue);
    Descontos2.Open;
    if not Descontos2.IsEmpty then
      Raise Exception.Create('Desconto para esse fornecedor com esse grupo já cadastrado!');
  end;
  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(False);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxTabelaDescontos.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  edtFornecedor.Clear;
end;

procedure TfMxTabelaDescontos.Descontos1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtFornecedor.Text := Entidade.FieldByName('Fornecedor').asString;
  edtUsuario.Text := Entidade.FieldByName('Usuario').asString;
end;

procedure TfMxTabelaDescontos.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxTabelaDescontos.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Grupo1.Active:=True;
  Entidade.Open;
  cmbCampo.ItemIndex:=0;
  edtLocalizar.SetFocus;  
end;

procedure TfMxTabelaDescontos.Descontos1CalcFields(DataSet: TDataSet);
begin
  Fornecedor1.Close;
  Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=Entidade.CodigoFOR;
  Fornecedor1.Open;
  Entidade.FieldByName('Fornecedor').asString:=Fornecedor1.RazaoSocial;
  Grupo2.Close;
  Grupo2.ParamByName('GRP_CODIGO').asInteger:=Entidade.CodigoGRP;
  Grupo2.Open;
  Entidade.FieldByName('Grupo').asString:=Grupo2.Descricao;
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxTabelaDescontos.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMxTabelaDescontos.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=44;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=44;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxTabelaDescontos.SB_ImprimirCabClick(Sender: TObject);
begin
  Application.CreateForm(Trpt_TabelaDescontos, rpt_TabelaDescontos);
  with rpt_TabelaDescontos do
  Begin
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT D1.*, F1.FOR_RZ_SOCIAL, G1.GRP_DESCRICAO, P1.PRD_REFERENCIA '+
      ' FROM DESCONTOS D1, FORNECEDOR F1, GRUPO G1, PRODUTO P1 '+
      ' WHERE D1.FOR_CODIGO*=F1.FOR_CODIGO '+
      ' AND D1.GRP_CODIGO*=G1.GRP_CODIGO '+
      ' AND D1.PRD_CODIGO*=P1.PRD_CODIGO '+
      ' ORDER BY D1.FOR_CODIGO, D1.GRP_CODIGO, D1.PRD_CODIGO ';
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxTabelaDescontos.AtualizaControles(Habilitar:Boolean);
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

  SB_ImprimirCab.Enabled:=not habilitar;

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

end.
