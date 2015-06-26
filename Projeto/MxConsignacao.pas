unit MxConsignacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Variants, Movimento_Estoque_Comercial, Movimento_Fisico,
  item_de_consignacao, Funcionario, Item_de_Estoque, Produto, ShellAPI,
  Menus, ComCtrls, consignacao, Inventario, Cliente, IniFiles;

type
  TfMxConsignacao = class(TForm)
    Panel6: TPanel;
    Label14: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label5: TLabel;
    Label18: TLabel;
    SB_NovoItem: TSpeedButton;
    Label7: TLabel;
    SB_AltItem: TSpeedButton;
    SB_ExcItem: TSpeedButton;
    SB_LocItem: TSpeedButton;
    Label19: TLabel;
    Label8: TLabel;
    DBGrid5: TDBGrid;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtUnidade: TEdit;
    edtReferencia: TEdit;
    edtMarca: TEdit;
    edtQuantidade: TEdit;
    edtObservacao: TEdit;
    SB_SalvaItem: TBitBtn;
    SB_CancItem: TBitBtn;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Panel5: TPanel;
    SB_Processar: TSpeedButton;
    Panel3: TPanel;
    Label20: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label27: TLabel;
    SB_NovoCab: TSpeedButton;
    SB_LocPed: TSpeedButton;
    SB_AltCab: TSpeedButton;
    Label9: TLabel;
    SB_ExcCab: TSpeedButton;
    edtCodigoCSG: TEdit;
    edtSituacao: TEdit;
    memObservacao: TMemo;
    mskDataHora: TMaskEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    mskDataAlterado: TMaskEdit;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Invent1: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    N2: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N3: TMenuItem;
    LocalizarCab: TMenuItem;
    ItensdoInventrio1: TMenuItem;
    IncluirItem: TMenuItem;
    AlterarItem: TMenuItem;
    ExcluirItem: TMenuItem;
    N1: TMenuItem;
    SalvarItem: TMenuItem;
    CancelarItem: TMenuItem;
    Item_de_Consignacao1: TItem_de_Consignacao;
    Consignacao1: TConsignacao;
    Consignacao1CNC_CODIGO: TIntegerField;
    Consignacao1CSG_CODIGO: TIntegerField;
    Consignacao1USU_CODIGO: TIntegerField;
    Consignacao1FUN_CODIGO: TIntegerField;
    Consignacao1CSG_DATA: TDateTimeField;
    Consignacao1CSG_DT_ALTERADO: TDateTimeField;
    Consignacao1CSG_VALOR: TFloatField;
    Consignacao1CSG_SITUACAO: TIntegerField;
    Consignacao1CSG_OBSERVACAO: TStringField;
    Item_de_Estoque1: TItem_de_Estoque;
    Produto1: TProduto;
    Item_de_Consignacao1CNC_CODIGO: TIntegerField;
    Item_de_Consignacao1ICS_CODIGO: TIntegerField;
    Item_de_Consignacao1CSG_CODIGO: TIntegerField;
    Item_de_Consignacao1PRD_CODIGO: TIntegerField;
    Item_de_Consignacao1USU_CODIGO: TIntegerField;
    Item_de_Consignacao1ICS_DATA: TDateTimeField;
    Item_de_Consignacao1ICS_QUANTIDADE: TFloatField;
    Item_de_Consignacao1ICS_VALOR: TFloatField;
    Item_de_Consignacao1ICS_OBSERVACAO: TStringField;
    DSConsignacao: TDataSource;
    DsItem_de_consignacao: TDataSource;
    labVendedor: TLabel;
    dblVendedor: TDBLookupComboBox;
    edtValor: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    edtValorItem: TEdit;
    Funcionario1: TFuncionario;
    DSFuncionario1: TDataSource;
    N4: TMenuItem;
    LocalizarItem: TMenuItem;
    Item_de_Consignacao1produto: TStringField;
    Item_de_Consignacao1Referencia: TStringField;
    Item_de_Consignacao1Detalhe: TStringField;
    Item_de_Consignacao1ValorTotal: TFloatField;
    SB_Fechar: TSpeedButton;
    Label21: TLabel;
    dblConsignatario: TDBLookupComboBox;
    DSCliente: TDataSource;
    Cliente1: TCliente;
    Consignacao1CLI_CODIGO: TIntegerField;
    SB_Imprimir: TBitBtn;
    btnEnviar: TBitBtn;
    Query1: TQuery;
    Query2: TQuery;
    Query3: TQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Consignacao1AfterOpen(DataSet: TDataSet);
    procedure Consignacao1AfterScroll(DataSet: TDataSet);
    procedure Consignacao1BeforeOpen(DataSet: TDataSet);
    procedure Consignacao1CalcFields(DataSet: TDataSet);
    procedure Item_de_Consignacao1AfterOpen(DataSet: TDataSet);
    procedure Item_de_Consignacao1AfterScroll(DataSet: TDataSet);
    procedure Item_de_Consignacao1BeforeOpen(DataSet: TDataSet);
    procedure Item_de_Consignacao1CalcFields(DataSet: TDataSet);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_NovoItemClick(Sender: TObject);
    procedure SB_AltItemClick(Sender: TObject);
    procedure SB_ExcItemClick(Sender: TObject);
    procedure SB_SalvaItemClick(Sender: TObject);
    procedure SB_CancItemClick(Sender: TObject);
    procedure SB_LocItemClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ProcessarClick(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    CdUltimoGRP, CdUltimoSGP : integer;
    bAlterandoItem : Boolean;
    procedure CarregaProduto;
    procedure ApagaProduto;
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
  public
    Entidade: TItem_de_Consignacao;
  end;

var
  fMxConsignacao: TfMxConsignacao;

implementation

Uses
  UDM, Funcoes, MxSPediProdMotCal, MxSPediProd, MxSConsignacao,
  UConsignacao;

{$R *.dfm}

procedure TfMxConsignacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    CorrigeRegistroDeletado(DM.QR_Comandos);
  except
  end;
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_Consignacao_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxConsignacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaItem.Enabled then
  begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  end;
end;

procedure TfMxConsignacao.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Consignacao1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_Consignacao_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  //Anderson Gonçalves - 21/02/2013
  edtCodigoPRD.MaxLength := 0;
end;

procedure TfMxConsignacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #27 then
  Begin
    Key := #0;
    if SB_CancItem.Enabled then
    Begin
      SB_CancItem.SetFocus;
      SB_CancItemClick(sender);
    end
    else if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else If key = #13 then
  Begin
    Key := #0;
    if SB_SalvaItem.Enabled then
    Begin
      if not VerificaFloatBranco(edtQuantidade.Text) then
      Begin
        edtQuantidade.SetFocus;
        Exit;
      end;
      {if not VerificaFloatBranco(edtValorItem.Text) then
      Begin
        edtValorItem.SetFocus;
        Exit;
      end;}
      SB_SalvaItem.SetFocus;
      SB_SalvaItemClick(sender);
    end
    else if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfMxConsignacao.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Open;
  bAlterandoItem := false;

  with Funcionario1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM FUNCIONARIO '+
      ' WHERE FUN_SITUACAO<>1 '+
      ' AND (CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      '  OR  FUN_TODOS_CENTROS=1) '+
      ' AND (FUN_FUNCAO=45 OR FUN_FUNCAO=58 OR FUN_FUNCAO=56) ' +
      ' ORDER BY FUN_APELIDO ';
    Open;
  end;
  Cliente1.Open;
  CdUltimoGRP := 0;
  CdUltimoSGP := 0;
  Consignacao1.Open;
  cmbCampo.ItemIndex := 2;
  btnEnviar.Enabled := not (DM.Configuracao1.CPD);
end;

procedure TfMxConsignacao.Consignacao1AfterOpen(DataSet: TDataSet);
begin
  if Consignacao1.IsEmpty then
    Consignacao1.LimpaCampos;
end;

procedure TfMxConsignacao.Consignacao1AfterScroll(DataSet: TDataSet);
begin
  Consignacao1.CarregaDados;
  if Item_de_Consignacao1.IsEmpty then
  Begin
    edtCodigoPRD.Clear;
    ApagaProduto;
    edtQuantidade.Clear;
    edtValorItem.Clear;
  end;
end;

procedure TfMxConsignacao.Consignacao1BeforeOpen(DataSet: TDataSet);
begin
  try
    Consignacao1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxConsignacao.Consignacao1CalcFields(DataSet: TDataSet);
begin
{  with Funcionario2 do
  Begin
    if (CodigoFUN <> Inventario1.CodigoFUN) or
       ((CodigoCNC <> Inventario1.CodigoCNC) and
       (DM.Configuracao1.Empresa = 1)) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Inventario1.CodigoFUN;
      Open;
    end;
    Inventario1.FieldByName('Funcionario').asString := Apelido;
  end;}
end;

procedure TfMxConsignacao.Item_de_Consignacao1AfterOpen(DataSet: TDataSet);
begin
  if Entidade.IsEmpty then
  begin
    Entidade.LimpaCampos;
    edtValor.Text := '0,00';
  end
  else
    edtValor.Text := Format('%.2f',[GetTotalConsignacao(DM.QR_Consultas, DM.Configuracao1.CodigoCNC, strtoint(edtCodigoCSG.Text))]);
end;

procedure TfMxConsignacao.Item_de_Consignacao1AfterScroll(
  DataSet: TDataSet);
begin
  CarregaProduto;
end;

procedure TfMxConsignacao.Item_de_Consignacao1BeforeOpen(
  DataSet: TDataSet);
begin
  Item_de_Consignacao1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  Item_de_Consignacao1.ParamByName('CSG_CODIGO').AsInteger := Consignacao1.CodigoCSG;
end;

procedure TfMxConsignacao.Item_de_Consignacao1CalcFields(
  DataSet: TDataSet);
begin
  Item_de_Consignacao1.FieldByName('ValorTotal').AsFloat := Item_de_Consignacao1.FieldByName('ICS_QUANTIDADE').AsFloat *
                                                            Item_de_Consignacao1.FieldByName('ICS_VALOR').AsFloat;
  With Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger:=Item_de_Consignacao1.CodigoPRD;
    Open;
    If not IsEmpty then
    Begin
      Item_de_Consignacao1.FieldByName('produto').AsString    := Descricao;
      Item_de_Consignacao1.FieldByName('Referencia').AsString := Referencia;
      Item_de_Consignacao1.FieldByName('Detalhe').AsString    := Detalhe;
    end;
  End;
end;

procedure TfMxConsignacao.ApagaProduto;
begin
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;
  edtValorItem.Clear;
end;

procedure TfMxConsignacao.AtualizaControles(Cabecalho: integer;
  Habilitar: Boolean);
begin
  SairCab.Enabled       := not Habilitar;
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  LocalizarCab.Enabled  := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_NovoCab.Enabled    := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_ExcCab.Enabled     := not Habilitar;
  SB_LocPed.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);

  //Itens
  IncluirItem.Enabled    := not Habilitar;
  AlterarItem.Enabled    := not Habilitar;
  ExcluirItem.Enabled    := not Habilitar;
  SalvarItem.Enabled     := ((Cabecalho=0) and Habilitar);
  CancelarItem.Enabled   := ((Cabecalho=0) and Habilitar);

  SB_NovoItem.Enabled    := not Habilitar;
  SB_AltItem.Enabled     := not Habilitar;
  SB_ExcItem.Enabled     := not Habilitar;
  SB_SalvaItem.Enabled   := ((Cabecalho=0) and Habilitar);
  SB_CancItem.Enabled    := ((Cabecalho=0) and Habilitar);

  LocalizarItem.Enabled := not Habilitar;
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

  SB_Processar.Enabled          := not Habilitar;
  {
  SB_ImprimirProdutos.Enabled   := not Habilitar;
  SB_ImprimirInventario.Enabled := not Habilitar;
  SB_Etiquetas.Enabled          := not Habilitar;
  }
  SB_Fechar.Enabled             := not Habilitar;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfMxConsignacao.CarregaProduto;
begin
  Entidade.CarregaDados;
  with Produto1 do
  begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger := Item_de_Consignacao1.CodigoPRD;
    Open;
    if not IsEmpty then
    begin
      if DM.Configuracao1.Empresa = 1 then
        edtProduto.text := Trim(Descricao+' '+Caracteristica)
      else
        edtProduto.text  := Descricao;
      edtUnidade.text    := Unidade;
      edtReferencia.text := Referencia;
      edtMarca.text      := Marca;
      edtValorItem.text  := Format('%.2f',[Precovenda]);
    end;
  end;
end;

procedure TfMxConsignacao.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxConsignacao.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir consignação neste centro de custo.');
  if DM.Usuario1.Permissoes.IndexOf(IntToStr(8940)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Inserir/alterar Consignação!');
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir consignação no CPD.');

  Consignacao1.PreparaInsercao;
  Item_de_Consignacao1.Close;
  AtualizaControles(1,True);
  dblConsignatario.SetFocus;
end;

procedure TfMxConsignacao.SB_LocPedClick(Sender: TObject);
begin
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode alterar consignação no CPD.');
    
  Application.CreateForm(TfMxSConsignacao, fMxSConsignacao);
  with fMxSConsignacao do
  Begin
    Tag := 0;
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM CONSIGNACAO '+
      ' WHERE CNC_CODIGO=:CNC_CODIGO '+
      {' AND ((CSG_DATA>="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' AND CSG_DATA<"'+MesDia(DM.Configuracao1.Data+1)+'") '+
      ' OR (CSG_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' AND CSG_DT_ALTERADO<"'+MesDia(DM.Configuracao1.Data+1)+'")) ';}
      ' ORDER BY CSG_CODIGO DESC';
    Entidade.Open;
    ShowModal;
    Free;
  end;
end;

procedure TfMxConsignacao.SB_AltCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar consignação neste centro de custo.');
  if Consignacao1.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
{
  If Consignacao1.Situacao <> 0 then
  Begin
    ShowMessage('A Consignação já foi Confirmada!');
    Exit;
  End;
}
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8940)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Inserir/alterar Consignação!');
  Consignacao1.PreparaAlteracao;
  AtualizaControles(1,True);
  dblConsignatario.SetFocus;
end;

procedure TfMxConsignacao.SB_ExcCabClick(Sender: TObject);
var
  CdCNC, CdCSG:integer;
  Trans: Boolean;
begin
  if Consignacao1.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  //if (DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto) then
    //raise Exception.Create('Você não pode inserir clientes neste centro de custo.');

  If Consignacao1.Situacao <> 0 Then
    raise Exception.Create('Não pode mais ser excluído!');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8950)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Consignação!');

  CdCNC := Consignacao1.CodigoCNC;
  CdCSG := Consignacao1.CodigoCSG;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      if not Consignacao1.Deletar(CdCNC, CdCSG) then //Ele gera LOG
        Raise exception.Create('');

      ExecutaSQL(DM.QR_Comandos, 'DELETE FROM ITEM_DE_CONSIGNACAO '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND ICS_CODIGO='+IntToStr(CdCSG));

      Commit;
      Trans := False;
      Consignacao1.Close;
      Consignacao1.Open;
      Entidade.Close; //Item
      Entidade.LimpaCampos;
      ApagaProduto;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  End;
end;

procedure TfMxConsignacao.SB_SalvaCabClick(Sender: TObject);
var
  iEstado: integer;
begin
  if dblConsignatario.Text = '' then
    Raise Exception.Create('Selecione o Consignatário!');

  if dblVendedor.Text = '' then
    Raise Exception.Create('Selecione o Vendedor!');

  iEstado := Consignacao1.Estado;
  If not Consignacao1.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');

  AtualizaControles(1,False);
  if not Item_de_Consignacao1.Active then
    Item_de_Consignacao1.Open;
  if iEstado = 1 then
    SB_NovoItemClick(sender);
end;

procedure TfMxConsignacao.SB_NovoItemClick(Sender: TObject);
begin
  if Consignacao1.IsEmpty then
    Raise exception.Create('Selecione a Consignação!');
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir item de Consignação neste centro de custo.');
{
  If Consignacao1.Situacao <> 0 then
  begin
    ShowMessage('A Consignação já foi Confirmada!');
    Exit;
  end;
}
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8960)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Inserir Item de Consignação!');

  bAlterandoItem := false;
  
  Item_de_Consignacao1.PreparaInsercao;
  AtualizaControles(0,True);
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;
  edtCodigoPRD.SetFocus;
  edtQuantidade.Text := '1,00';
  edtValorItem.Text := '0,00';
end;

procedure TfMxConsignacao.SB_AltItemClick(Sender: TObject);
var
  CdCNC, CdICS: integer;
begin
  bAlterandoItem := true;
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar item de Consignação neste centro de custo.');
{
  If Consignacao1.Situacao <> 0 then
  Begin
    ShowMessage('A Consignação já foi Confirmada!');
    Exit;
  End;
}
  if Item_de_Consignacao1.IsEmpty then
    Raise exception.Create('Selecione o item a ser alterado!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8960)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Alterar Item de Consignação!');

  //ShowMessage('Confirme se este produto não está sendo inserido/alterado em outra máquina para esse inventário!');

  //Atualizar a quantidade com as outras máquinas
  CdCNC := Item_de_Consignacao1.CodigoCNC;
  CdICS := Item_de_Consignacao1.CodigoICS;
  Item_de_Consignacao1.Close;
  Item_de_Consignacao1.Open;
  Item_de_Consignacao1.LocalizarCod(CdICS, CdCNC);

  Item_de_Consignacao1.PreparaAlteracao;
  AtualizaControles(0,True);
  edtQuantidade.SetFocus;
end;

procedure TfMxConsignacao.SB_ExcItemClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir item de Consignação neste centro de custo.');
  if item_de_Consignacao1.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
{
  If Consignacao1.Situacao<>0 then
  begin
    ShowMessage('A Consignação já foi Confirmada!');
    Exit;
  end;
}
  if DM.Usuario1.Permissoes.IndexOf(IntToStr(8970)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Excluir Item de Consignação!');
  item_de_Consignacao1.Deletarauto;
  Entidade.Close;
  Entidade.Open;
  if Item_de_Consignacao1.IsEmpty then
  Begin
    ApagaProduto;
    edtCodigoPRD.Clear;
    edtQuantidade.Clear;
    edtValorItem.Clear;
  end;
end;

procedure TfMxConsignacao.SB_SalvaItemClick(Sender: TObject);
var
  Trans: Boolean;
  iEstado, CdPRD, CdICS, CdCNC: integer;
  CdQtdInfo, sOBS: string;
begin
  if not SB_SalvaItem.Enabled then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Exit
  else if StrToInt(edtCodigoPRD.Text) <= 0 then
    Exit;

  if not VerificaFloatBranco(edtQuantidade.Text) then
  Begin
    edtQuantidade.SetFocus;
    Exit;
  end;

  {if not VerificaFloatBranco(edtValorItem.Text) then
  Begin
    edtValorItem.SetFocus;
    Exit;
  end;}

  CdQtdInfo := edtQuantidade.Text;
  CdPRD     := StrToInt(edtCodigoPRD.Text);
  sOBS      := edtObservacao.Text;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT ICS_CODIGO,CNC_CODIGO,PRD_CODIGO,ICS_QUANTIDADE'+
      ' FROM ITEM_DE_CONSIGNACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND CSG_CODIGO='+edtCodigoCSG.Text+
      ' AND PRD_CODIGO='+IntToStr(CdPRD);
    Open;
  end;

  if (not DM.QR_Consultas.IsEmpty) and (not bAlterandoItem) Then //Produto já informado
  begin
    CdCNC := DM.QR_Consultas.FieldByName('CNC_CODIGO').asInteger;
    CdICS := DM.QR_Consultas.FieldByName('ICS_CODIGO').asInteger;

    SB_CancItem.SetFocus;
    SB_CancItemClick(sender);
    Trans:=false;
    with DM.Database2 do
    begin
      try
        StartTransaction;
        Trans:=True;

        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_CONSIGNACAO SET '+
          ' ICS_OBSERVACAO='''+sOBS+''', '+
          ' ICS_QUANTIDADE=ICS_QUANTIDADE+'+VirgPonto(CdQtdInfo)+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND ICS_CODIGO='+inttostr(CdICS));
        Commit;
        Trans := False;
        Item_de_Consignacao1.Close;
        Item_de_Consignacao1.Open;
        Item_de_Consignacao1.LocalizarCod(CdICS, CdCNC);
      except
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
      end;
    End;
    SB_NovoItemClick(sender);
    Exit;
  end
  else
  begin
    with Item_de_Estoque1 do
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
      ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
      Open;
      if IsEmpty then
        if not Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPRD.Text),0(*CdFUN*),
            0,0,0,0,0,DM.Configuracao1.DataHora,0,0,0,0,0,0) then
          Raise exception.Create('Falha ao Gerar Item de Estoque!');
    end;

    iEstado := Entidade.Estado;
    if Entidade.FinalizaEdicao then
    Begin
      AtualizaControles(0,False);
      if iEstado = 1 then
        SB_NovoItemClick(sender);
    end
    else
    Begin
      ShowMessage('Os dados não foram salvos!');
    end;
  end;
end;

procedure TfMxConsignacao.SB_CancItemClick(Sender: TObject);
var
  aux: TNotifyEvent;
begin
  aux := edtCodigoPRD.OnExit;
  edtCodigoPRD.OnExit := nil;
  item_de_Consignacao1.CancelaEdicao;
  AtualizaControles(0,False);
  if Item_de_Consignacao1.IsEmpty then
  Begin
    edtCodigoPRD.Clear;
    ApagaProduto;
    edtQuantidade.Clear;
    edtValorItem.Clear;
  end
  else
    CarregaProduto;
  edtCodigoPRD.OnExit := aux;
end;

procedure TfMxConsignacao.SB_LocItemClick(Sender: TObject);
Var
  mensagem,Campo,Nome,campoloc :String;
  i, CdCNC, CdCSG, CdICS :Integer;
begin
  if not Entidade.Active then  //Item
    Exit;

  if not SB_LocItem.Enabled then
    Exit;

  mensagem:='';
  If (cmbCampo.ItemIndex=0) then
     if not VerificaInteiroBranco(edtLocalizar.Text) then
       mensagem:= mensagem+'Código a ser localizado inválido!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  If (cmbCampo.Text<>'') Then
  Begin
    campoloc:=trim(cmbCampo.Text);
    for i:= length(campoloc) downto 1 do
      If campoloc[i]=' ' Then
      Begin
        Campo := Copy(campoloc,i+1,length(campoloc)-i);
        Break;
      End;
    Nome:=Trim(edtLocalizar.text);
  End
  else
    Raise Exception.Create('valor de localização faltando!');

  CdCNC := Entidade.CodigoCNC;
  CdCSG := Entidade.CodigoCSG;
  // Entidade.Localizar;
  With Entidade do
  Begin
    if Campo='PRD_DESCRICAO' then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT ICS_CODIGO '+
          ' FROM PRODUTO P1, ITEM_DE_CONSIGNACAO I1 '+
          ' WHERE P1.PRD_DESCRICAO LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.CSG_CODIGO='+IntToStr(CdCSG)+
          ' AND P1.PRD_CODIGO=I1.PRD_CODIGO ';
        Open;
        CdICS := FieldByName('ICS_CODIGO').asInteger;
      end;
      Entidade.LocalizarCod(CdICS, CdCNC);
    end
    else if Campo='PRD_REFERENCIA' then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT ICS_CODIGO '+
          ' FROM PRODUTO P1, ITEM_DE_CONSIGNACAO I1 '+
          ' WHERE P1.PRD_REFERENCIA LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.ICS_CODIGO='+IntToStr(CdICS)+
          ' AND P1.PRD_CODIGO=I1.PRD_CODIGO ';
        Open;
        CdICS := FieldByName('ICS_CODIGO').asInteger;
      end;
      Entidade.LocalizarCod(CdICS, CdCNC);
    end
    else if Campo='PRD_REFERENCIA' then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT ICS_CODIGO '+
          ' FROM CODIGO_DE_BARRAS C1, ITEM_DE_CONSIGNACAO I1 '+
          ' WHERE C1.CDB_CODIGO_BARRAS LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.CSG_CODIGO='+IntToStr(CdCSG)+
          ' AND C1.CDB_CODIGO_ENTRADA=I1.PRD_CODIGO ';
        Open;
        CdICS := FieldByName('ICS_CODIGO').asInteger;
      end;
      Entidade.LocalizarCod(CdICS, CdCNC);
    end
    else
      Entidade.Localizar;
  End;
  edtLocalizar.SetFocus;
end;

procedure TfMxConsignacao.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
{
  If key='-' then
    key:='0'
  else If UpperCase(key)='C' then
    key:='0'
  else If UpperCase(key)='D' then
    key:='6';
}
  if key=chr(32) then
  begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag := 74;
        dblCodigoGRP.KeyValue := CdUltimoGRP;
        dblCodigoGRPClick(sender);
        dblCodigoSGP.KeyValue := CdUltimoSGP;
        dblCodigoSGPClick(sender);
        ShowModal;
      end;
      try
        if SB_NovoItem.Enabled then
          SB_NovoItemClick(sender)
        else
          edtQuantidade.SetFocus;
      except
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag := 74;
        ShowModal;
        try
          edtQuantidade.SetFocus;
        except
        end;
      end;
    end;
  end;
end;

procedure TfMxConsignacao.SB_ProcessarClick(Sender: TObject);
Var
  CdCNC, CdCSG, CdPRD :integer;
  Trans: Boolean;
begin
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar consignação neste centro de custo.');
  if Consignacao1.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  If Consignacao1.Situacao <> 0 then
  Begin
    ShowMessage('A Consignação já foi Confirmada!');
    Exit;
  End;

  if Application.MessageBox('Deseja realmente confirmar a Consignação?','Atenção',MB_YESNO+MB_ICONQUESTION) = ID_NO then
    exit;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      CdCSG := Consignacao1.CodigoCSG;
      CdCNC := Consignacao1.CodigoCNC;


      //Mudar situação da consignação para confirmado
      ExecutaSQL(DM.QR_Comandos,'UPDATE CONSIGNACAO SET '+
         ' CSG_SITUACAO=1 '+
         ',CSG_VALOR = '+VirgPonto(GetTotalConsignacao(DM.QR_Consultas, DM.Configuracao1.CodigoCNC, strtoint(edtCodigoCSG.Text)))+
         ',CSG_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
         ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
         ' AND CSG_CODIGO='+IntToStr(CdCSG));

      If DM.Configuracao1.ControleTransacao then
        Commit;

      Consignacao1.Close;
      Consignacao1.Open;

      SB_Imprimir.Click;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
        end;
    end;
  End;
end;

procedure TfMxConsignacao.edtCodigoPRDExit(Sender: TObject);
var
  Trans: Boolean;
  CdPRD, CdCNC, CdICS, iICS: integer;
begin
  If SB_CancItem.Focused or
    (not SB_SalvaItem.Enabled) then
  Begin
    edtCodigoPRD.Enabled := False;
    Exit;
  end;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
  Begin
    try
      edtCodigoPRD.SetFocus;
    except
    end;
    Exit;
  end;

  with Produto1 do
  Begin
    try
      if (not Active) or
         (CodigoPRD <> StrToInt(edtCodigoPRD.Text)) then
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
        Open;
      end;
    except
      Close;
      ParamByName('PRD_CODIGO').asInteger := -10;
      Open;
    end;
    if IsEmpty then
    Begin
      with DM.Codigo_Barras1 do
      Begin
        if CodigoCDB_Barras <> edtCodigoPRD.Text then
        Begin
          Close;
          paramByName('CDB_CODIGO_BARRAS').asString := edtCodigoPRD.Text;
          Open;
        end;
        if not IsEmpty then
        Begin
          edtCodigoPRD.Text := IntToStr(CodigoCDB_Entrada);
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
          Produto1.Open;
        end;
      end;
    End;
    if IsEmpty and
       (Length(edtCodigoPRD.Text) > 4) then //Referências maiores que 3 caracteres
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT PRD_CODIGO '+
          ' FROM PRODUTO '+
          ' WHERE PRD_REFERENCIA="'+edtCodigoPRD.Text+'"';
        Open;
        if not IsEmpty then
          edtCodigoPRD.Text := FieldByName('PRD_CODIGO').asString
        else
          edtCodigoPRD.Text := '-1';
      end;
      Close;
      ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
      Open;
    End;
    if IsEmpty then
    Begin
      edtCodigoPRD.Clear;
      Showmessage('Produto inexistente!');
      edtCodigoPRD.SetFocus;
      Exit;
    End;
  end;

  DM.QR_Consultas.Close;
  DM.QR_Consultas.SQL.Text := 'SELECT TOP 1 * '+
    ' FROM ITEM_DE_CONSIGNACAO '+
    ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
    ' AND CSG_CODIGO='+IntToStr(Entidade.CodigoCSG)+
    ' AND PRD_CODIGO='+edtCodigoPRD.Text;
  DM.QR_Consultas.Open;
  if not DM.QR_Consultas.IsEmpty then
  begin
    Produto1.Close;
    Produto1.ParamByName('PRD_CODIGO').asInteger := DM.QR_Consultas.FieldByName('PRD_CODIGO').asInteger;
    Produto1.Open;
    iICS := DM.QR_Consultas.FieldByName('ICS_CODIGO').asInteger;
    Item_de_Consignacao1.CancelaEdicao;
    Item_de_Consignacao1.Close;
    Item_de_Consignacao1.Open;
    Item_de_Consignacao1.LocalizarCod(iICS,Entidade.CodigoCNC);
    Item_de_Consignacao1.PreparaAlteracao;
    //edtQuantidade.Text := '1,00';
  end
  else
  begin
    CdUltimoGRP := Produto1.CodigoGRP;
    CdUltimoSGP := Produto1.CodigoSGP;

    edtProduto.text    := Produto1.Descricao;
    edtUnidade.text    := Produto1.Unidade;
    edtReferencia.text := Produto1.Referencia;
    edtMarca.text      := Produto1.Marca;
    edtValorItem.text  := Format('%.2f',[Produto1.Precovenda]);
  end;
end;

procedure TfMxConsignacao.SB_CancCabClick(Sender: TObject);
begin
  Consignacao1.CancelaEdicao;
  AtualizaControles(1,False);
  if not Item_de_Consignacao1.Active then
    Item_de_Consignacao1.Open;
end;

procedure TfMxConsignacao.SB_ImprimirClick(Sender: TObject);
begin
  if Consignacao1.IsEmpty then
    raise exception.Create('Não há dados a serem visualizados!');

  if Consignacao1.Situacao = 0 then
    raise exception.Create('A Consignação não foi Confirmada!');

//  SB_AltCabClick(SB_AltCab);
//  SB_SalvaCabClick(SB_SalvaCab);

  Application.CreateForm(Trpt_Consignacao, rpt_Consignacao);
  with rpt_Consignacao do
  begin
    rpt_Consignacao.Tag := 1;

    Consignacao1.Close;
    Consignacao1.SQL.Text := 'SELECT * FROM CONSIGNACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(fMxConsignacao.Consignacao1.CodigoCNC)+
      ' AND CSG_CODIGO='+edtCodigoCSG.Text;
    Consignacao1.Open;

    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM ITEM_DE_CONSIGNACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(fMxConsignacao.Consignacao1.CodigoCNC)+
      ' AND CSG_CODIGO='+edtCodigoCSG.Text+
      ' ORDER BY ICS_CODIGO DESC';
    Entidade.Open;
    if Consignacao1.IsEmpty then
      Raise exception.Create('Consulta Vazia!');
    report.preview;
  end;
end;

procedure TfMxConsignacao.btnEnviarClick(Sender: TObject);
var
  sDirAtual, sBanco, sDescricao,sCod : String;
  IniFile : tIniFile;
  fArq :TextFile;

  procedure subAtiva;
  begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT '
    +'T1.CNC_CODIGO,'
    +'T1.CSG_CODIGO,'
    +'T1.USU_CODIGO,'
    +'T1.FUN_CODIGO,'
    +'T1.CSG_DATA,'
    +'T1.CSG_DT_ALTERADO,'
    +'T1.CSG_VALOR,'
    +'T1.CSG_SITUACAO,'
    +'T1.CLI_CODIGO,'
    +'T1.CSG_OBSERVACAO'
    +' FROM CONSIGNACAO T1'
    +' WHERE CNC_CODIGO = ' + IntToStr(DM.Configuracao1.CodigoCNC)
    +' ORDER BY CNC_CODIGO, CSG_CODIGO');
    Query1.Open;
    Query1.First;
  end;

begin
  try
    Screen.Cursor:= crHourGlass;

    subAtiva;

    while not Query1.Eof do
    begin
      Query3.Close;
      Query3.SQL.Clear;
      Query3.SQL.Add('UPDATE CONSIGNACAO SET CSG_VALOR =');
      Query3.SQL.Add('(SELECT SUM(ICS_VALOR * ICS_QUANTIDADE) FROM ITEM_DE_CONSIGNACAO');
      Query3.SQL.Add('WHERE CNC_CODIGO = ''' + Query1.FieldByName('CNC_CODIGO').AsString + '''');
      Query3.SQL.Add('AND CSG_CODIGO = ''' + Query1.FieldByName('CSG_CODIGO').AsString + ''')');
      Query3.SQL.Add('WHERE CNC_CODIGO = ''' + Query1.FieldByName('CNC_CODIGO').AsString + '''');
      Query3.SQL.Add('AND CSG_CODIGO = ''' + Query1.FieldByName('CSG_CODIGO').AsString + '''');
      Query3.ExecSQL;
      Query1.Next;
    end;

    subAtiva;

    //
    // Começa gerar o arquivo TXT
    //
    sDirAtual := 'C:\Importação';

    if not DirectoryExists(sDirAtual) then
      CreateDir(sDirAtual);
    AssignFile(fArq,sDirAtual+'\CONSIGNACAO_CNC_' + IntToStr(DM.Configuracao1.CodigoCNC) + '.TXT');
    Rewrite(fArq);
    //
    WriteLn(FArq,'CNC|' + PreencheEspaco(6,Query1.FieldByName('CNC_CODIGO').AsString));
    while not Query1.Eof do
    begin
      WriteLn(FArq,
      'CSG|'                                                                                           +
      PreencheEspaco(6,Query1.FieldByName('CNC_CODIGO').AsString)                                      +
      PreencheEspaco(6,Query1.FieldByName('CSG_CODIGO').AsString)                                      +
      PreencheEspaco(6,Query1.FieldByName('USU_CODIGO').AsString)                                      +
      PreencheEspaco(6,Query1.FieldByName('FUN_CODIGO').AsString)                                      +
      PreencheEspaco(12,FormatDateTime('dd/mm/yyyy',Query1.FieldByName('CSG_DATA').AsDateTime))        +
      PreencheEspaco(12,FormatDateTime('dd/mm/yyyy',Query1.FieldByName('CSG_DT_ALTERADO').AsDateTime)) +
      PreencheEspaco(10,VirgPonto(Query1.FieldByName('CSG_VALOR').AsString))                           +
      PreencheEspaco(2,Query1.FieldByName('CSG_SITUACAO').AsString)                                    +
      PreencheEspaco(6,Query1.FieldByName('CLI_CODIGO').AsString)                                      +
      PreencheEspaco(255,Query1.FieldByName('CSG_OBSERVACAO').AsString))                               ;
      //
      Query2.Close;
      Query2.SQL.Clear;
      Query2.SQL.Add('SELECT '
      +'T1.CNC_CODIGO,'
      +'T1.ICS_CODIGO,'
      +'T1.CSG_CODIGO,'
      +'T1.PRD_CODIGO,'
      +'T1.USU_CODIGO,'
      +'T1.ICS_DATA,'
      +'T1.ICS_QUANTIDADE,'
      +'T1.ICS_VALOR,'
      +'T1.ICS_OBSERVACAO'
      +' FROM ITEM_DE_CONSIGNACAO T1'
      +' WHERE CSG_CODIGO = ''' + Query1.FieldByName('CSG_CODIGO').AsString + ''''
      +' AND CNC_CODIGO = ' + IntToStr(DM.Configuracao1.CodigoCNC)
      +' ORDER BY ICS_CODIGO');
      Query2.Open;

      Query2.First;
      while not Query2.Eof do
      begin
        WriteLn(FArq,
        'ICS|'                                                                                           +
        PreencheEspaco(6,Query2.FieldByName('CNC_CODIGO').AsString)                                      +
        PreencheEspaco(6,Query2.FieldByName('ICS_CODIGO').AsString)                                      +
        PreencheEspaco(6,Query2.FieldByName('CSG_CODIGO').AsString)                                      +
        PreencheEspaco(6,Query2.FieldByName('PRD_CODIGO').AsString)                                      +
        PreencheEspaco(6,Query2.FieldByName('USU_CODIGO').AsString)                                      +
        PreencheEspaco(12,FormatDateTime('dd/mm/yyyy',Query2.FieldByName('ICS_DATA').AsDateTime))        +
        PreencheEspaco(6,Query2.FieldByName('ICS_QUANTIDADE').AsString)                                  +
        PreencheEspaco(10,VirgPonto(Query2.FieldByName('ICS_VALOR').AsString))                           +
        PreencheEspaco(255,Query2.FieldByName('ICS_OBSERVACAO').AsString))                               ;
        Query2.Next;
      end;

      Query1.Next;
    end;

    showmessage('Arquivo gerado: C:\Importação\CONSIGNACAO_CNC_' + IntToStr(DM.Configuracao1.CodigoCNC) + '.TXT');
  finally
    Closefile(fArq);
    Screen.Cursor  := crDefault;
    //ShellExecute( 0, 'Open',pChar(sDirAtual+'\CONSIGNACAO.TXT'),'','', SW_SHOWNORMAL);
  end;
end;

end.
