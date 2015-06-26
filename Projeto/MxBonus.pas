unit MxBonus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Produto, ComCtrls, Manufaturado, Item_de_Manufaturado,
  Movimento_Fisico, Movimento_Estoque_Comercial, Item_de_Estoque, Menus,
  Item_de_Bonus, Bonus, Usuario, Variants;

type
  TfMxBonus = class(TForm)
    Panel3: TPanel;
    Panel5: TPanel;
    SB_Fechar: TSpeedButton;
    Panel6: TPanel;
    DBGrid5: TDBGrid;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edtCodigoBON: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    mskDataAlterado: TMaskEdit;
    mskDataCadastro: TMaskEdit;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    SB_NovoCab: TSpeedButton;
    SB_ExcCab: TSpeedButton;
    SB_Prim1: TSpeedButton;
    SB_Ant1: TSpeedButton;
    SB_Prox1: TSpeedButton;
    SB_Ult1: TSpeedButton;
    SB_NovoItem: TSpeedButton;
    SB_ExcItem: TSpeedButton;
    SB_SalvaItem: TBitBtn;
    SB_CancItem: TBitBtn;
    edtBonus1: TEdit;
    Label18: TLabel;
    SB_Imprimir: TSpeedButton;
    Label13: TLabel;
    edtMes: TEdit;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Manufaturado2: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    ItemdeManufaturado1: TMenuItem;
    IncluirItem: TMenuItem;
    ExcluirItem: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N2: TMenuItem;
    SalvarItem: TMenuItem;
    CancelarItem: TMenuItem;
    Label10: TLabel;
    edtAno: TEdit;
    DSBonus1: TDataSource;
    DSItem_de_Bonus1: TDataSource;
    Label7: TLabel;
    edtCodigoIBN: TEdit;
    Bonus1: TBonus;
    Item_de_Bonus1: TItem_de_Bonus;
    Bonus1BON_CODIGO: TIntegerField;
    Bonus1BON_MES: TIntegerField;
    Bonus1BON_ANO: TIntegerField;
    Bonus1USU_CODIGO: TIntegerField;
    Bonus1BON_DT_ALTERADO: TDateTimeField;
    Bonus1BON_DT_CADASTRO: TDateTimeField;
    Bonus1Epoca: TStringField;
    edtBonus2: TEdit;
    edtCodigoPRD: TEdit;
    Item_de_Bonus1IBN_CODIGO: TIntegerField;
    Item_de_Bonus1BON_CODIGO: TIntegerField;
    Item_de_Bonus1PRD_CODIGO: TIntegerField;
    Item_de_Bonus1USU_CODIGO: TIntegerField;
    Item_de_Bonus1IBN_DT_CADASTRO: TDateTimeField;
    Item_de_Bonus1IBN_DT_ALTERADO: TDateTimeField;
    Item_de_Bonus1IBN_BONUS_FOR: TFloatField;
    Item_de_Bonus1IBN_BONUS_LOJA: TFloatField;
    Item_de_Bonus1Produto: TStringField;
    Produto1: TProduto;
    Label5: TLabel;
    Label6: TLabel;
    edtProduto: TEdit;
    Label8: TLabel;
    Item_de_Bonus1Detalhe: TStringField;
    Item_de_Bonus1Referencia: TStringField;
    edtDetalhe: TEdit;
    edtReferencia: TEdit;
    Label9: TLabel;
    Label11: TLabel;
    Item_de_Bonus2: TItem_de_Bonus;
    Item_de_Bonus3: TItem_de_Bonus;
    SB_CopiarMesAnterior: TSpeedButton;
    Label12: TLabel;
    edtUsuario: TEdit;
    Bonus1Usuario: TStringField;
    Item_de_Bonus1Usuario: TStringField;
    Bonus1CNC_CODIGO: TIntegerField;
    Item_de_Bonus1CNC_CODIGO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure SB_NovoItemClick(Sender: TObject);
    procedure SB_ExcItemClick(Sender: TObject);
    procedure SB_SalvaItemClick(Sender: TObject);
    procedure SB_CancItemClick(Sender: TObject);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_Prim1Click(Sender: TObject);
    procedure SB_Ant1Click(Sender: TObject);
    procedure SB_Prox1Click(Sender: TObject);
    procedure SB_Ult1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sair1Click(Sender: TObject);
    procedure Bonus1AfterScroll(DataSet: TDataSet);
    procedure Bonus1CalcFields(DataSet: TDataSet);
    procedure Item_de_Bonus1AfterScroll(DataSet: TDataSet);
    procedure Item_de_Bonus1CalcFields(DataSet: TDataSet);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure SB_CopiarMesAnteriorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    procedure AtualizaControles(Cabecalho, Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TBonus;
  end;

var
  fMxBonus: TfMxBonus;
const
  vMes : array [1..12] of string = ('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');

implementation
Uses
  UDM, funcoes, MxSPediProd, Urpt_bonus, MxSPediProdMotCal;
{$R *.DFM}

procedure TfMxBonus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

procedure TfMxBonus.FormCreate(Sender: TObject);
begin
  Entidade := Bonus1;
  Entidade.open;
  Item_de_Bonus1.Open;
end;

procedure TfMxBonus.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxBonus.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
end;

procedure TfMxBonus.SB_UltClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxBonus.SB_NovoCabClick(Sender: TObject);
begin
  Entidade.PreparaInsercao;
  AtualizaControles(True,True);
  Item_de_Bonus1.LimpaCampos;
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtMes.SetFocus;
end;

procedure TfMxBonus.SB_AltCabClick(Sender: TObject);
begin
  Entidade.PreparaAlteracao;
  AtualizaControles(True,True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtMes.SetFocus;
end;

procedure TfMxBonus.SB_ExcCabClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que você deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) in [mrYes, 201] then
  Begin
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_BONUS WHERE '+
      ' BON_CODIGO='+IntToStr(Entidade.CodigoBON));
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM BONUS WHERE '+
      ' BON_CODIGO='+IntToStr(Entidade.CodigoBON));
    Entidade.Close;
    Entidade.Open;
  End;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
  if Item_de_Bonus1.IsEmpty then
  Begin
    Item_de_Bonus1.LimpaCampos;
    edtProduto.Clear;
    edtDetalhe.Clear;
    edtReferencia.Clear;
  end;
end;

procedure TfMxBonus.SB_SalvaCabClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
    AtualizaControles(True,False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxBonus.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(True,False);
end;

procedure TfMxBonus.SB_NovoItemClick(Sender: TObject);
begin
  If Entidade.IsEmpty then
    raise Exception.Create('Não foi selecionado um Bonus!');

  Item_de_Bonus1.PreparaInsercao;
  AtualizaControles(False,True);
  edtCodigoPRD.SetFocus;
end;

procedure TfMxBonus.SB_ExcItemClick(Sender: TObject);
begin
  If Item_de_Bonus1.IsEmpty then
    raise Exception.Create('Não existem itens a serem deletados!');

  Item_de_Bonus1.Deletarauto;
  if Item_de_Bonus1.IsEmpty then
  Begin
    Item_de_Bonus1.LimpaCampos;
    edtProduto.Clear;
    edtDetalhe.Clear;
    edtReferencia.Clear;
  end;
end;

procedure TfMxBonus.SB_SalvaItemClick(Sender: TObject);
begin
  if Item_de_Bonus1.FinalizaEdicao then
  Begin
    AtualizaControles(False,False);
    SB_NovoItemClick(sender);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxBonus.SB_CancItemClick(Sender: TObject);
begin
  Item_de_Bonus1.CancelaEdicao;
  AtualizaControles(False,False);
end;

procedure TfMxBonus.SB_PrimClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxBonus.SB_AntClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxBonus.SB_ProxClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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


procedure TfMxBonus.SB_Prim1Click(Sender: TObject);
begin
  if Item_de_Bonus1.IsEmpty then
   abort;
 if Item_de_Bonus1.IsEmpty then
   abort;
 If Item_de_Bonus1.bof Then
  begin
    SB_Ant1.Enabled:=False;
    SB_Prim1.Enabled:=False;
  end
  Else
  begin
    Item_de_Bonus1.First;
    SB_Ant1.Enabled:=False;
    SB_Prim1.Enabled:=False;
  end;
  If not Item_de_Bonus1.eof Then
  begin
    SB_Prox1.Enabled:=True;
    SB_Ult1.Enabled:=True;
  end;
end;

procedure TfMxBonus.SB_Ant1Click(Sender: TObject);
begin
  if Item_de_Bonus1.IsEmpty then
   abort;
 if Item_de_Bonus1.IsEmpty then
   abort;
 If Item_de_Bonus1.bof Then
  begin
    SB_Ant1.Enabled:=False;
    SB_Prim1.Enabled:=False;
  end
  Else
  begin
    Item_de_Bonus1.Prior;
    If Item_de_Bonus1.bof Then
    begin
     SB_Ant1.Enabled:=False;
     SB_Prim1.Enabled:=False;
    end;
  end;
  If not Item_de_Bonus1.eof Then
  begin
    SB_Prox1.Enabled:=True;
    SB_Ult1.Enabled:=True;
  end;
end;

procedure TfMxBonus.SB_Prox1Click(Sender: TObject);
begin
  if Item_de_Bonus1.IsEmpty then
   abort;
 if Item_de_Bonus1.IsEmpty then
   abort;
  If Item_de_Bonus1.eof Then
  begin
    SB_Prox1.Enabled:=False;
    SB_Ult1.Enabled:=False;
  end
  Else
  begin
    Item_de_Bonus1.Next;
    If Item_de_Bonus1.eof Then
    begin
     SB_Prox1.Enabled:=False;
     SB_Ult1.Enabled:=False;
    end;
  end;
  If not Item_de_Bonus1.bof Then
  begin
    SB_Ant1.Enabled:=True;
    SB_Prim1.Enabled:=True;
  end;
end;

procedure TfMxBonus.SB_Ult1Click(Sender: TObject);
begin
  if Item_de_Bonus1.IsEmpty then
   abort;
 if Item_de_Bonus1.IsEmpty then
   abort;
  If Item_de_Bonus1.eof Then
  begin
    SB_Prox1.Enabled:=False;
    SB_Ult1.Enabled:=False;
  end
  Else
  begin
    Item_de_Bonus1.Last;
    SB_Prox1.Enabled:=False;
    SB_Ult1.Enabled:=False;
  end;
  If not Item_de_Bonus1.bof Then
  begin
    SB_Ant1.Enabled:=True;
    SB_Prim1.Enabled:=True;
  end;
end;

procedure TfMxBonus.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If (SB_SalvaCab.Enabled) or (SB_SalvaItem.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxBonus.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxBonus.Bonus1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.Text := Entidade.FieldByName('Usuario').asString;
  if Item_de_Bonus1.IsEmpty then
  Begin
    Item_de_Bonus1.LimpaCampos;
    edtProduto.Clear;
    edtDetalhe.Clear;
    edtReferencia.Clear;
  end;
end;

procedure TfMxBonus.Bonus1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Epoca').asString:=vMes[Entidade.mes]+'/'+IntToStr(Entidade.Ano);
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxBonus.Item_de_Bonus1AfterScroll(DataSet: TDataSet);
begin
  Item_de_Bonus1.CarregaDados;
  edtProduto.Text:=Item_de_Bonus1.FieldByName('Produto').asString;
  edtDetalhe.Text:=Item_de_Bonus1.FieldByName('Detalhe').asString;
  edtReferencia.Text:=Item_de_Bonus1.FieldByName('Referencia').asString;
end;

procedure TfMxBonus.Item_de_Bonus1CalcFields(DataSet: TDataSet);
begin
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_de_Bonus1.CodigoPRD;
  Produto1.Open;
  Item_de_Bonus1.FieldByName('Produto').asString:=Produto1.Descricao;
  Item_de_Bonus1.FieldByName('Detalhe').asString:=Produto1.Detalhe;
  Item_de_Bonus1.FieldByName('Referencia').asString:=Produto1.Referencia;
  Item_de_Bonus1.FieldByName('Usuario').asString := DM.NomeUsuario(Item_de_Bonus1.CodigoUSU);
end;

procedure TfMxBonus.edtCodigoPRDExit(Sender: TObject);
var
  aux :TDataSetNotifyEvent;
begin
  If SB_CancItem.Focused then
    Exit;
  edtProduto.Clear;
  edtDetalhe.Clear;
  edtReferencia.Clear;
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
  else if Produto1.Situacao = 1 then
  Begin
    Showmessage('Produto desativado');
    edtCodigoPRD.SetFocus;
    Exit;
  End
  else
  Begin
    edtProduto.Text:=Produto1.Descricao;
    edtDetalhe.Text:=Produto1.Detalhe;
    edtReferencia.Text:=Produto1.Referencia;
  end;

  Aux:=Item_de_Bonus1.AfterScroll;
  Item_de_Bonus1.AfterScroll:=nil;
  If Item_de_Bonus1.Locate('BON_CODIGO;PRD_CODIGO',
  VarArrayof([edtCodigoBON.text,edtCodigoPRD.Text]),[]) Then
  Begin
    Item_de_Bonus1.AfterScroll:=Aux;
    Raise Exception.Create('Bônus desse produto já cadastrado!');
    edtCodigoPRD.SetFocus;
  end;
  Item_de_Bonus1.AfterScroll:=Aux;
end;

procedure TfMxBonus.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
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
        Tag:=32;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=32;
        ShowModal;
      end;
    end;
    edtBonus1.SetFocus;
  End;
end;

procedure TfMxBonus.SB_ImprimirClick(Sender: TObject);
begin
  if Item_de_Bonus1.IsEmpty then
    Raise Exception.Create('Não existem itens de Bônus!');
  Application.CreateForm(Trpt_Bonus,rpt_Bonus);
  with rpt_Bonus do
  Begin
    tag:=1;
    zrlFiltros.Caption := '(BON:'+edtCodigoBON.Text+')';
    Item_de_Bonus1.Close;    
    Bonus1.Close;
    Bonus1.SQL.Text:='SELECT * FROM BONUS T1 '+
      ' WHERE BON_CODIGO='+edtCodigoBON.Text+
      ' ORDER BY T1.BON_ANO,T1.BON_MES ';
    Item_de_Bonus1.SQL.Text:='SELECT * FROM ITEM_DE_BONUS T1 '+
      ' WHERE T1.BON_CODIGO=:BON_CODIGO '+
      ' ORDER BY T1.PRD_CODIGO ';
    Bonus1.Open;
    Item_de_Bonus1.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxBonus.SB_CopiarMesAnteriorClick(Sender: TObject);
begin
  if Bonus1.IsEmpty then
    Raise exception.Create('É necessário criar Mês/Ano Referência!');
  if not Item_de_Bonus1.IsEmpty then
    Raise exception.Create('Já existem bônus nesse Mês/Ano Referência!');

  with Item_de_Bonus2 do
  Begin
    Close;
    if Entidade.Mes = 1 then
    Begin
      ParamByName('BON_MES').asInteger:=12;
      ParamByName('BON_ANO').asInteger:=Entidade.Ano-1;
    end
    else
    Begin
      ParamByName('BON_MES').asInteger:=Entidade.Mes-1;
      ParamByName('BON_ANO').asInteger:=Entidade.Ano;
    end;

    Open;
    if IsEmpty then
      Raise Exception.Create('Não existem bônus no mês anterior!')
    else
    Begin
      Item_de_Bonus3.Open;
      while not Eof do
      Begin
        Item_de_Bonus3.Inserir(0,StrToInt(edtCodigoBON.Text),CodigoPRD,
          DM.Configuracao1.DataHora,BonusFOR,BonusLoja);
        Next;
      end;
      Item_de_Bonus1.Close;
      Item_de_Bonus1.Open;
      ShowMessage('Operação efetuada com sucesso!');
    end;
  end;
end;

procedure TfMxBonus.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else if SB_CancItem.Enabled then
    Begin
      SB_CancItem.SetFocus;
      SB_CancItemClick(sender);
    end
    else
     Close;
  end
  else if key=#13 then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
    else if SB_SalvaItem.Enabled then
    Begin
      SB_SalvaItem.SetFocus;
      SB_SalvaItemClick(sender);
    end;
  end;
end;

procedure TfMxBonus.AtualizaControles(Cabecalho, Habilitar: Boolean);
begin
  Sair1.Enabled                := not Habilitar;
  IncluirCab.Enabled           := not Habilitar;
  AlterarCab.Enabled           := not Habilitar;
  ExcluirCab.Enabled           := not Habilitar;  
  Salvarcab.Enabled            := (Cabecalho and Habilitar);
  CancelarCab.Enabled          := (Cabecalho and Habilitar);
  IncluirItem.Enabled          := not Habilitar;
  ExcluirItem.Enabled          := not Habilitar;
  SalvarItem.Enabled           := (not Cabecalho and Habilitar);
  CancelarItem.Enabled         := (not Cabecalho and Habilitar);
  SB_Prim.Enabled              := not Habilitar;
  SB_Ant.Enabled               := not Habilitar;
  SB_Prox.Enabled              := not Habilitar;
  SB_Ult.Enabled               := not Habilitar;
  SB_NovoCab.Enabled           := not Habilitar;
  SB_AltCab.Enabled            := not Habilitar;
  SB_ExcCab.Enabled            := not Habilitar;
  SB_SalvaCab.Enabled          := ((Cabecalho) and Habilitar);
  SB_CancCab.Enabled           := ((Cabecalho) and Habilitar);
  SB_Prim1.Enabled             := not Habilitar;
  SB_Ant1.Enabled              := not Habilitar;
  SB_Prox1.Enabled             := not Habilitar;
  SB_Ult1.Enabled              := not Habilitar;
  SB_NovoItem.Enabled          := not Habilitar;
  SB_ExcItem.Enabled           := not Habilitar;
  SB_SalvaItem.Enabled         := ((not Cabecalho) and Habilitar);
  SB_CancItem.Enabled          := ((not Cabecalho) and Habilitar);

  SB_CopiarMesAnterior.Enabled := not Habilitar;
  SB_Imprimir.Enabled          := not Habilitar;
  SB_Fechar.Enabled            := not Habilitar;

  DBGrid1.Enabled              := not Habilitar;
  DBGrid5.Enabled              := not Habilitar;
end;

procedure TfMxBonus.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Item_de_Bonus1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_de_Bonus1.SOrdemdoGrid(Item_de_Bonus1.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxBonus.DBGrid1TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
