unit MxLista_de_Presente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Menus, Funcionario, Cliente, Variants,
  Produto, Item_de_Estoque, Usuario, ListaPresente, ItemListaPresente;

type
  TfMxListadePresente = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    dbgILP: TDBGrid;
    Label23: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Cabecalho1: TMenuItem;
    IncluirPed: TMenuItem;
    AlterarPed: TMenuItem;
    ExcluirPed: TMenuItem;
    N1: TMenuItem;
    SalvarPed: TMenuItem;
    CancelarPed: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Itens1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    Label26: TLabel;
    IncluirPro: TMenuItem;
    AlterarPro: TMenuItem;
    ExcluirPro: TMenuItem;
    N3: TMenuItem;
    SalvarPro: TMenuItem;
    CancelarPro: TMenuItem;
    Cliente1: TCliente;
    Produto1: TProduto;
    SB_Fechar: TSpeedButton;
    Panel3: TPanel;
    Label27: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label25: TLabel;
    Label29: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    mskDataCadastroLSP: TMaskEdit;
    edtCodigoLSP: TEdit;
    cmbSituacaoLSP: TComboBox;
    edtUsuario: TEdit;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    mskFone: TMaskEdit;
    edtObservacaoLSP: TEdit;
    edtClienteCNC: TEdit;
    mskDataAlterado: TMaskEdit;
    edtDescricao: TEdit;
    SB_NovoLSP: TSpeedButton;
    SB_AltLSP: TSpeedButton;
    SB_ExcLSP: TSpeedButton;
    SB_SalvaLSP: TBitBtn;
    SB_CancLSP: TBitBtn;
    edtObservacaoILP: TEdit;
    Label7: TLabel;
    edtQtdNecessaria: TEdit;
    Label19: TLabel;
    edtQtdComprada: TEdit;
    Label18: TLabel;
    ListaPresente1: TListaPresente;
    ItemListaPesente1: TItemListaPesente;
    DSItemListaPresente: TDataSource;
    ItemListaPesente1ILP_CODIGO: TIntegerField;
    ItemListaPesente1CNC_CODIGO: TIntegerField;
    ItemListaPesente1LSP_CODIGO: TIntegerField;
    ItemListaPesente1PRD_CODIGO: TIntegerField;
    ItemListaPesente1ILP_DT_CADASTRO: TDateTimeField;
    ItemListaPesente1ILP_DT_ALTERADO: TDateTimeField;
    ItemListaPesente1ILP_QUANTIDADE_NECESSARIA: TIntegerField;
    ItemListaPesente1ILP_QUANTIDADE_COMPRADA: TIntegerField;
    ItemListaPesente1ILP_SITUACAO: TIntegerField;
    ItemListaPesente1ILP_OBSERVACAO: TStringField;
    ItemListaPesente1Produto: TStringField;
    SB_Imprimir: TSpeedButton;
    SB_LocPed: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_NovoILP: TSpeedButton;
    SB_AltILP: TSpeedButton;
    SB_ExcILP: TSpeedButton;
    SB_SalvaILP: TBitBtn;
    SB_CancILP: TBitBtn;
    DSListaPresente1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EntidadeAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_NovoILPClick(Sender: TObject);
    procedure SB_AltILPClick(Sender: TObject);
    procedure SB_ExcILPClick(Sender: TObject);
    procedure SB_SalvaILPClick(Sender: TObject);
    procedure SB_CancILPClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure SB_ExcLSPClick(Sender: TObject);
    procedure SB_NovoLSPClick(Sender: TObject);
    procedure SB_AltLSPClick(Sender: TObject);
    procedure SB_SalvaLSPClick(Sender: TObject);
    procedure SB_CancLSPClick(Sender: TObject);
    procedure ItemListaPesente1AfterScroll(DataSet: TDataSet);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure ItemListaPesente1CalcFields(DataSet: TDataSet);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    procedure LimpaItens(produto:integer);
        { Private declarations }
  public
    { Public declarations }
    Entidade:TListaPresente;
    Cancelar :Boolean;
    ValorAnt:Double;
  end;

var
  fMxListadePresente: TfMxListadePresente;

implementation
Uses
  UDM, funcoes, CdCliente, MxSPediProd, DigSenha, 
  MxSListaPresente, ULista_de_Presente,
  MxSPediProdMotCal;
{$R *.DFM}

procedure TfMxListadePresente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxListadePresente.EntidadeAfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxListadePresente.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Open;
  ItemListaPesente1.Open;
end;

procedure TfMxListadePresente.FormCreate(Sender: TObject);
begin
  Entidade := ListaPResente1;
end;

procedure TfMxListadePresente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaLSP.Enabled or SB_SalvaLSP.Enabled or SB_SalvaILP.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;


procedure TfMxListadePresente.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxListadePresente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancLSP.Enabled then
    Begin
      SB_CancLSP.SetFocus;
      SB_CancLSPClick(sender);
    end
    else if SB_CancILP.Enabled then
    Begin
      SB_CancILP.SetFocus;
      SB_CancILPClick(sender);
    end
    else
      Close;
  end
  else if Key=chr(13) then
  Begin
    if SB_SalvaLSP.Enabled then
    Begin
      SB_SalvaLSP.SetFocus;
      SB_SalvaLSPClick(sender);
    end
    else if SB_SalvaILP.Enabled then
    Begin
      SB_SalvaILP.SetFocus;
      SB_SalvaILPClick(sender);
    end
  end
  else if ((edtQtdNecessaria.Focused) or (edtQtdComprada.Focused)) and (Key = '.') then
    Key := ',';
end;

procedure TfMxListadePresente.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirPed.Enabled        := not Habilitar;
  AlterarPed.Enabled        := not Habilitar;
  ExcluirPed.Enabled        := not Habilitar;
  Localizar1.Enabled        := not Habilitar;
  SB_NovoLSP.Enabled        := not Habilitar;
  SB_AltLSP.Enabled         := not Habilitar;
  SB_ExcLSP.Enabled         := not Habilitar;
  SB_SalvaLSP.Enabled       := ((Cabecalho=1) and Habilitar);
  SB_CancLSP.Enabled        := ((Cabecalho=1) and Habilitar);


  IncluirPro.Enabled        := not Habilitar;
  AlterarPro.Enabled        := not Habilitar;
  ExcluirPro.Enabled        := not Habilitar;
  SB_Prim.Enabled           := not Habilitar;
  SB_Ant.Enabled            := not Habilitar;
  SB_Prox.Enabled           := not Habilitar;
  SB_Ult.Enabled            := not Habilitar;
  SB_NovoILP.Enabled        := not Habilitar;
  SB_AltILP.Enabled         := not Habilitar;
  SB_ExcILP.Enabled         := not Habilitar;
  SB_SalvaILP.Enabled       := ((Cabecalho=2) and Habilitar);
  SB_CancILP.Enabled        := ((Cabecalho=2) and Habilitar);

  dbgILP.Enabled        := not Habilitar;
end;

procedure TfMxListadePresente.SB_NovoILPClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione o Pedido antes!');
  edtProduto.Clear;
  ItemListaPesente1.PreparaInsercao;
  AtualizaControles(2,True);
  try
    edtCodigoPRD.SetFocus;
  except
  end;
end;

procedure TfMxListadePresente.SB_AltILPClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione o Pedido antes!');

  if ItemListaPesente1.IsEmpty then
    Raise Exception.Create('Selecione o Produto!');

  ItemListaPesente1.PreparaAlteracao;
  AtualizaControles(2,True);
  try
    edtQtdComprada.SetFocus;
  except
  end;
end;

procedure TfMxListadePresente.SB_ExcILPClick(Sender: TObject);
var
  CdCNC, CdILP: integer;
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione a Lista antes!');

  if ItemListaPesente1.IsEmpty then
    Raise Exception.Create('Selecione o Produto!');

  CdCNC := ItemListaPesente1.CodigoCNC;
  CdILP := ItemListaPesente1.CodigoILP;
  
  ItemListaPesente1.Deletar(CdCNC, CdILP);
end;

procedure TfMxListadePresente.SB_SalvaILPClick(Sender: TObject);
Var
  trans:boolean;
begin
  if not VerificaFloatBranco(edtQtdNecessaria.Text) then
    edtQtdNecessaria.Text:='1';
  if not VerificaFloatBranco(edtQtdComprada.Text) then
    edtQtdComprada.Text:='0';

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      if ItemListaPesente1.FinalizaEdicao then
        AtualizaControles(2,False)
      else
        Raise Exception.Create('');

      if trans then
        Commit;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  End;
end;

procedure TfMxListadePresente.SB_CancILPClick(Sender: TObject);
begin
  ItemListaPesente1.CancelaEdicao;
  AtualizaControles(2,False);
  if ItemListaPesente1.IsEmpty then
    LimpaItens(0)
  else
//    CarregarItemVenda;
end;

procedure TfMxListadePresente.LimpaItens(produto:integer);
begin
  if Produto = 0 then
  Begin
    edtCodigoPRD.Clear;
    edtProduto.Clear;
    edtQtdNecessaria.Clear;
    edtQtdComprada.Clear;
  end;
end;

procedure TfMxListadePresente.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      edtCodigoCLI.Text := '0';
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=21;
    fCadCli.dblCentroDeCusto.KeyValue:=StrToInt(edtClienteCNC.Text);
    With fCadCli.Cliente1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM CLIENTE WHERE CLI_CODIGO='+edtCodigoCLI.Text+
        ' AND CNC_CODIGO='+edtClienteCNC.Text;
      Open;
    End;
    fCadCli.Showmodal;
  End
end;

procedure TfMxListadePresente.edtCodigoCLIExit(Sender: TObject);
begin
  if SB_CancLSP.Focused then
    Exit;
  If (edtCodigoCLI.Text<>'') Then
  Begin
    if not VerificaInteiro(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      Raise Exception.Create('Código de Cliente inválido!');
    end;
    with Cliente1 do
    Begin
      if (StrToInt(edtCodigoCLI.Text) <> CodigoCLI) or
         (StrToInt(edtClienteCNC.Text) <> CodigoCNC) then
      Begin
        Close;
        ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
        ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtClienteCNC.Text);
        Open;
      end;
      If IsEmpty then
      Begin
        edtCodigoCLI.Clear;
        edtRazaoSocial.Clear;
        mskFone.Clear;
        ShowMessage('Cliente não cadastrado');
        edtClienteCNC.Text:=IntToStr(DM.Configuracao1.CodigoCNC);
        try
          edtCodigoCLI.SetFocus;
        except
        end;
        Exit;
      End;
      edtCodigoCLI.text:=IntToStr(CodigoCli);
      edtRazaoSocial.text:=RazaoSocial;
      mskFone.text:=Fone;
    end;
  End;
end;


procedure TfMxListadePresente.SB_ExcLSPClick(Sender: TObject);
var
  CdCNC, CdLSP: integer;
begin
  if entidade.IsEmpty then
    showmessage('Selecione uma Lista de Presentes!')
  else
  begin
    CdCNC := Entidade.CodigoCNC;
    CdLSP := Entidade.CodigoLSP;
    if Entidade.Deletar(CdCNC ,CdLSP) then
    Begin
      ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_LISTA_DE_PRESENTE '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND LSP_CODIGO='+IntToStr(CdLSP));
    end;
  end;
end;

procedure TfMxListadePresente.SB_NovoLSPClick(Sender: TObject);
begin
  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtCodigoCLI.SetFocus;
end;

procedure TfMxListadePresente.SB_AltLSPClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione a lista de Presentes!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtCodigoCLI.SetFocus;
end;

procedure TfMxListadePresente.SB_SalvaLSPClick(Sender: TObject);
var
  Trans : Boolean;
  CdCNC, CdLSP : integer;
begin
  try
    CdCNC := DM.Configuracao1.CodigoCNC;
    CdLSP := StrToInt(edtCodigoLSP.Text);
  except
    CdCNC := 0;
    CdLSP := 0;
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

      if not Entidade.FinalizaEdicao then
        Raise exception.Create('');
        
      AtualizaControles(1,False);

      If DM.Configuracao1.ControleTransacao then
        Commit;
      with Entidade do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM LISTA_DE_PRESENTE '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND LSP_CODIGO='+IntToStr(CdLSP);
        Open;
        CarregaDados;
      end;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  End;
end;

procedure TfMxListadePresente.SB_CancLSPClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
end;

procedure TfMxListadePresente.ItemListaPesente1AfterScroll(
  DataSet: TDataSet);
begin
  ItemListaPesente1.CarregaDados;
  edtProduto.Text := ItemListaPesente1.FieldByName('Produto').asString;
end;

procedure TfMxListadePresente.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Clear;
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=41;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=41;
        ShowModal;
      end;
    end;
    edtQtdNecessaria.SetFocus;
  End
  else If key=chr(13) then
  Begin
    Key := #0;
    edtQtdNecessaria.SetFocus;
  end
end;

procedure TfMxListadePresente.edtCodigoPRDExit(Sender: TObject);
begin
  If SB_CancILP.Focused then
    Exit;
  if not VerificaInteiroBranco(edtCodigoPRD.text) then
  Begin
    Showmessage('Código de produto inválido');
    edtCodigoPRD.SetFocus;
    Exit;
  End;
  if Produto1.CodigoPRD <> StrToInt(edtCodigoPRD.Text) then
  Begin
    Produto1.Close;
    Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
    Produto1.Open;
  end;

    If (not Produto1.IsEmpty) and (Produto1.Situacao <> 1) Then
    Begin
      edtProduto.text:=Trim(Produto1.Descricao)+' '+Produto1.Referencia;
    End
    else if Produto1.IsEmpty then
    Begin
      Showmessage('Produto inexistente!');
      edtCodigoPRD.SetFocus;
      Exit;
    End
    else
    Begin
      Showmessage('Produto desativado!');
      edtCodigoPRD.SetFocus;
      Exit;
    End;

  if (edtQtdNecessaria.Enabled) and (not SB_SalvaILP.Focused) then
  Begin
    edtQtdNecessaria.SetFocus;
    edtCodigoPRD.Enabled:=False
  end;

end;

procedure TfMxListadePresente.ItemListaPesente1CalcFields(
  DataSet: TDataSet);
begin
  if ItemListaPesente1.CodigoPRD > 0 then
  Begin
    with Produto1 do
    Begin
      if ItemListaPesente1.CodigoPRD <> CodigoPRD then
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := ItemListaPesente1.CodigoPRD;
        Open;
      end;
      ItemListaPesente1.FieldByName('Produto').asString := Trim(Descricao)+' '+Referencia;
    end;
  end
  else
    ItemListaPesente1.FieldByName('Produto').asString := '';

end;

procedure TfMxListadePresente.SB_ImprimirClick(Sender: TObject);
begin
  if entidade.IsEmpty then
    Raise Exception.Create('Selecione a lista de presentes!');
  Application.CreateForm(Trpt_ListaPresente, rpt_ListaPresente);
  rpt_ListaPresente.ListaPresente1.ParamByName('LSP_CODIGO').AsInteger:=Entidade.CodigoLSP;
  rpt_ListaPresente.ListaPresente1.ParamByName('CNC_CODIGO').AsInteger:=Entidade.CodigoCNC;
  rpt_ListaPresente.ListaPresente1.Open;
  rpt_ListaPresente.ItemListaPesente1.Open;
  rpt_ListaPresente.report.Preview;
end;

procedure TfMxListadePresente.SB_LocPedClick(Sender: TObject);
begin
  cancelar:=True;
  Application.CreateForm(TfMxSListaPresente, fMxSListaPresente);
  fMxSListaPresente.tag:=0;
  fMxSListaPresente.Showmodal;

  if (edtCodigoLSP.Text = '') then
    cancelar := True;

  If not cancelar Then
  Begin
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM LISTA_DE_PRESENTE '+
      ' WHERE CNC_CODIGO = '+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND LSP_CODIGO='+edtCodigoLSP.Text;
    Entidade.Open;
    Entidade.CarregaDados;
    edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);

    // Carregar informações do Cliente
    edtCodigoCLIExit(Sender);

    AtualizaControles(1, False);
  End;
end;

end.
