unit MxInventario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Variants, Movimento_Estoque_Comercial, Movimento_Fisico,
  Item_de_Inventario, Funcionario, Item_de_Estoque, Inventario, Produto,
  Menus, ComCtrls, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfMxInvent = class(TForm)
    Panel3: TPanel;
    Label20: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid5: TDBGrid;
    Label14: TLabel;
    Label6: TLabel;
    edtCodigoINV: TEdit;
    Label10: TLabel;
    Label13: TLabel;
    edtSituacao: TEdit;
    memObservacao: TMemo;
    Label27: TLabel;
    labDescResponsavel: TLabel;
    dblResponsavel: TDBLookupComboBox;
    Label2: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    Label4: TLabel;
    Label16: TLabel;
    edtUnidade: TEdit;
    edtReferencia: TEdit;
    Label15: TLabel;
    Label5: TLabel;
    edtMarca: TEdit;
    edtQuantidade: TEdit;
    Label18: TLabel;
    SB_SalvaItem: TBitBtn;
    SB_CancItem: TBitBtn;
    SB_ExcItem: TSpeedButton;
    SB_NovoItem: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_ImprimirProdutos: TSpeedButton;
    Produto1: TProduto;
    Inventario1: TInventario;
    DSInventario1: TDataSource;
    mskDataHora: TMaskEdit;
    SB_NovoCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    DSFuncionario1: TDataSource;
    Item_de_Estoque1: TItem_de_Estoque;
    Inventario1INV_CODIGO: TIntegerField;
    Inventario1CNC_CODIGO: TIntegerField;
    Inventario1INV_DATA: TDateTimeField;
    Inventario1FUN_CODIGO: TIntegerField;
    Inventario1INV_SITUACAO: TIntegerField;
    Funcionario1: TFuncionario;
    Funcionario2: TFuncionario;
    Item_de_Inventario2: TItem_de_Inventario;
    DsItem_de_inventario2: TDataSource;
    SB_Processar: TSpeedButton;
    SB_Fechar: TSpeedButton;
    qry_embarques: TQuery;
    Inventario1INV_OBSERVACAO1: TStringField;
    Item_de_Inventario2IIV_CODIGO: TIntegerField;
    Item_de_Inventario2FUN_CODIGO: TIntegerField;    
    Item_de_Inventario2CNC_CODIGO: TIntegerField;
    Item_de_Inventario2PRD_CODIGO: TIntegerField;
    Item_de_Inventario2INV_CODIGO: TIntegerField;
    Item_de_Inventario2IIV_QUANT_SIST: TFloatField;
    Item_de_Inventario2IIV_QUANT_INF: TFloatField;
    Item_de_Inventario2produto: TStringField;
    Item_de_Inventario2funcionario: TStringField;
    SB_ImprimirInventario: TSpeedButton;
    SB_Etiquetas: TSpeedButton;
    Etiquetas1: TProduto;
    Item_de_Inventario2Quantidade: TStringField;
    Label3: TLabel;
    cmbTipo: TComboBox;
    Inventario1USU_CODIGO: TIntegerField;
    Inventario1INV_DT_ALTERADO: TDateTimeField;
    Inventario1INV_TIPO: TIntegerField;
    Item_de_Inventario2USU_CODIGO: TIntegerField;
    Item_de_Inventario2IIV_DT_CADASTRO: TDateTimeField;
    Item_de_Inventario2IIV_DT_ALTERADO: TDateTimeField;
    Inventario1Funcionario: TStringField;
    Label7: TLabel;
    edtObservacao: TEdit;
    Item_de_Inventario2IIV_OBSERVACAO: TStringField;
    SB_LocPed: TSpeedButton;
    Item_de_Inventario2Referencia: TStringField;
    Item_de_Inventario2Detalhe: TStringField;
    SB_AltItem: TSpeedButton;
    SB_LocItem: TSpeedButton;
    Label19: TLabel;
    Label8: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SB_Verificar: TSpeedButton;
    Label9: TLabel;
    mskDataAlterado: TMaskEdit;
    SB_ExcCab: TSpeedButton;
    lblDescLote: TLabel;
    edtCodigoLOT: TEdit;
    Item_de_Inventario2LOT_CODIGO: TIntegerField;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    SairCab: TAction;
    IncluirItem: TAction;
    AlterarItem: TAction;
    ExcluirItem: TAction;
    SalvarItem: TAction;
    CancelarItem: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    VerificarMercadoria1: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoItemClick(Sender: TObject);
    procedure SB_ExcItemClick(Sender: TObject);
    procedure SB_CancItemClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure SB_EtiquetasClick(Sender: TObject);
    procedure SB_ImprimirInventarioClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure Inventario1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Item_de_Inventario2AfterScroll(DataSet: TDataSet);
    procedure ProcessarInventario(Sender: TObject);
    procedure SB_ImprimirProdutosClick(Sender: TObject);
    procedure Inventario1BeforeOpen(DataSet: TDataSet);
    procedure Item_de_Inventario2CalcFields(DataSet: TDataSet);
    procedure Item_de_Inventario2BeforeOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Inventario1AfterOpen(DataSet: TDataSet);
    procedure Item_de_Inventario2AfterOpen(DataSet: TDataSet);
    procedure Inventario1CalcFields(DataSet: TDataSet);
    procedure SB_LocPedClick(Sender: TObject);
    procedure SB_SalvaItemClick(Sender: TObject);
    procedure SB_AltItemClick(Sender: TObject);
    procedure SB_LocItemClick(Sender: TObject);
    procedure SB_VerificarClick(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure edtCodigoLOTExit(Sender: TObject);
    procedure edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);

  private
    CdUltimoGRP, CdUltimoSGP : integer;  
    procedure CarregaProduto;
    procedure ApagaProduto;
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TItem_de_Inventario;
    FornecedorInv:String;
  end;

var
  fMxInvent: TfMxInvent;


implementation
Uses
  UDM, MxSPediProd, MxSCotaFor, Funcoes,
  MxSPediProdMotCal, UOp_RelatProd, UProdutosInvent, MxSInventario,
  MxVerificarMercadoria, CdLote, MxPedCompra;

{$R *.DFM}

procedure TfMxInvent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_Invent_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxInvent.FormCreate(Sender: TObject);
begin
  Entidade:=Item_de_Inventario2;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_Invent_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  //Anderson Gonçalves - 21/02/2013
  if GetEmpresaComunicacao(DM.QR_Consultas) = 'AC' then (*Somente água de cheiro*)
    edtCodigoPRD.MaxLength := 0
  else
    edtCodigoPRD.MaxLength := 7;
end;

procedure TfMxInvent.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxInvent.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaItem.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxInvent.SB_PrimClick(Sender: TObject);
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

procedure TfMxInvent.SB_AntClick(Sender: TObject);
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

procedure TfMxInvent.SB_ProxClick(Sender: TObject);
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

procedure TfMxInvent.SB_UltClick(Sender: TObject);
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

procedure TfMxInvent.SB_NovoItemClick(Sender: TObject);
begin
  if Inventario1.IsEmpty then
    Raise exception.Create('Selecione o inventário!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir item de inventário neste centro de custo.');
  If Inventario1.Situacao<>0 then
  Begin
    ShowMessage('O inventário já foi Processado!');
    Exit;
  End;
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7820)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Inserir Item de Inventário!');
  Item_de_Inventario2.PreparaInsercao;
  AtualizaControles(0,True);
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;
  edtCodigoPRD.SetFocus;
  edtQuantidade.Text := '1,00';
end;

procedure TfMxInvent.SB_ExcItemClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir item de inventário neste centro de custo.');
  if item_de_inventario2.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  If Inventario1.Situacao<>0 then
  Begin
    ShowMessage('O inventário já foi Processado!');
    Exit;
  End;
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7840)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Excluir Item de Inventário!');
  item_de_inventario2.deletarauto;
  Entidade.Close;
  Entidade.Open;
  if Item_de_Inventario2.IsEmpty then
  Begin
    ApagaProduto;
    edtCodigoPRD.Clear;
    edtQuantidade.Clear;
  end;
end;

procedure TfMxInvent.SB_CancItemClick(Sender: TObject);
var
  aux:TNotifyEvent;
begin
  aux := edtCodigoPRD.OnExit;
  edtCodigoPRD.OnExit := nil;
  item_de_inventario2.CancelaEdicao;
  AtualizaControles(0,False);
  if Item_de_Inventario2.IsEmpty then
  Begin
    edtCodigoPRD.Clear;
    ApagaProduto;
    edtQuantidade.Clear;
  end
  else
    CarregaProduto;
  edtCodigoPRD.OnExit := aux;
end;

procedure TfMxInvent.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir inventário neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7800)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Inserir/alterar Inventário!');
  Inventario1.PreparaInsercao;
  Item_de_Inventario2.Close;
  AtualizaControles(1,True);
  dblResponsavel.SetFocus;
end;

procedure TfMxInvent.SB_AltCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar inventário neste centro de custo.');
  if Inventario1.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  If Inventario1.Situacao<>0 then
  Begin
    ShowMessage('O inventário já foi Processado!');
    Exit;
  End;
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7800)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Inserir/alterar Inventário!');  
  Inventario1.PreparaAlteracao;
  AtualizaControles(1,True);
  dblResponsavel.SetFocus;
end;

procedure TfMxInvent.SB_SalvaCabClick(Sender: TObject);
var
  iEstado: integer;
begin
  if dblResponsavel.Text = '' then
    Raise Exception.Create('Selecione o Responsável!');

  iEstado := Inventario1.Estado;
  If not Inventario1.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');

  AtualizaControles(1,False);
  if not Item_de_Inventario2.Active then
    Item_de_Inventario2.Open;
  if iEstado = 1 then
    SB_NovoItemClick(sender);
end;

procedure TfMxInvent.SB_CancCabClick(Sender: TObject);
begin
  Inventario1.CancelaEdicao;
  AtualizaControles(1,False);
  if not Item_de_Inventario2.Active then
    Item_de_Inventario2.Open;
end;


procedure TfMxInvent.edtCodigoPRDExit(Sender: TObject);
var
  Trans: Boolean;
  CdFUN, CdPRD, CdCNC, CdIIV, CdLOT: integer;
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

  if not VerificaInteiroBranco(edtCodigoLOT.Text) then
    edtCodigoLOT.Text := '0';

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUN := dblResponsavel.KeyValue
  else
    CdFUN := 0;

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
  CdUltimoGRP := Produto1.CodigoGRP;
  CdUltimoSGP := Produto1.CodigoSGP;

  if DM.Configuracao1.Empresa = empEletro then
    edtProduto.text := Trim(Produto1.Descricao+' '+Produto1.Caracteristica)
  else
    edtProduto.text := Produto1.Descricao;

  edtUnidade.text    := Produto1.Unidade;
  edtReferencia.text := Produto1.Referencia;
  edtMarca.text      := Produto1.Marca;

  //Alan - Alterado por pedido de Solange 20-09-05
  {CdPRD := StrToInt(edtCodigoPRD.Text);
  CdLOT := StrToInt(edtCodigoLOT.Text);

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 CNC_CODIGO, IIV_CODIGO '+
      ' FROM ITEM_DE_INVENTARIO '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND INV_CODIGO='+edtCodigoINV.Text+
      ' AND PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND LOT_CODIGO='+IntToStr(CdLOT);
    Open;
  end;

  If (not DM.QR_Consultas.IsEmpty) Then //Produto já inventariado
  Begin
    CdCNC := DM.QR_Consultas.FieldByName('CNC_CODIGO').asInteger;
    CdIIV := DM.QR_Consultas.FieldByName('IIV_CODIGO').asInteger;
    if DM.Configuracao1.ItemAutomatico <> 1 then //Não é ItemAutomático
    Begin
      edtCodigoPRD.SetFocus;
      Raise exception.Create('Item já cadastrado!');
    end
    else
    Begin
      SB_CancItem.SetFocus;
      SB_CancItemClick(sender);
      Trans:=false;
      with DM.Database2 do
      begin
        try
          StartTransaction;
          Trans:=True;

          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_INVENTARIO SET '+
            ' IIV_QUANT_INF=IIV_QUANT_INF+1 '+
            ',IIV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND INV_CODIGO='+edtCodigoINV.Text+
            ' AND PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND FUN_CODIGO='+IntToStr(CdFUN));
          Commit;
          Trans := False;
          Item_de_Inventario2.Close;
          Item_de_Inventario2.Open;
          Item_de_Inventario2.LocalizarCod(CdIIV, CdCNC);
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
    end;
  end
  else if DM.Configuracao1.ItemAutomatico = 1 then //Produto ainda não inventariado
  Begin
    edtQuantidade.Text := '1';
    SB_SalvaItemClick(sender);

    Item_de_Inventario2.Close;
    Item_de_Inventario2.Open;
    Item_de_Inventario2.LocalizarCod(CdIIV, CdCNC);

    SB_NovoItemClick(sender);
    Exit;
  end;}
end;

procedure TfMxInvent.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key='-' then
    key:='0'
  else If UpperCase(key)='C' then
    key:='0'
  else If UpperCase(key)='D' then
    key:='6';
  //  
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=10;
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
        Tag:=10;
        ShowModal;
        try
          edtQuantidade.SetFocus;
        except
        end;
      end;
    end;
  End;
end;

procedure TfMxInvent.Inventario1AfterScroll(DataSet: TDataSet);
begin
  Inventario1.CarregaDados;
  if Item_de_Inventario2.IsEmpty then
  Begin
    edtCodigoPRD.Clear;
    ApagaProduto;
    edtQuantidade.Clear;
  end;  
end;

procedure TfMxInvent.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  if DM.Configuracao1.Empresa <> empLuciano then
  Begin
    lblDescLote.Visible := False;
    edtCodigoLOT.Visible := False;
  end;  

  if DM.Configuracao1.Empresa = empTeste then
    labDescResponsavel.Caption := 'Receptor';

  Entidade.open;
  with Funcionario1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM FUNCIONARIO '+
      ' WHERE FUN_SITUACAO<>1 '+
      ' AND (CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      '  OR  FUN_TODOS_CENTROS=1) '+
      ' ORDER BY FUN_APELIDO ';
    Open;
  end;
  Inventario1.open;
  CdUltimoGRP := 0;
  CdUltimoSGP := 0;

  cmbCampo.ItemIndex := 2;
end;

procedure TfMxInvent.Item_de_Inventario2AfterScroll(DataSet: TDataSet);
begin
  CarregaProduto;
end;

procedure TfMxInvent.ProcessarInventario(Sender: TObject);
Var
  CdCNC, CdINV, CdPRD, iTipo, CdFUN :integer;
  Trans, vSomarComReserva: Boolean;
  aux:TDataSetNotifyEvent;
  vQtdMov, vEstReservado: Double;
  sTipoMov,sEstComercial, sEstFisico, sEstFiscal, sEstSN, sEstLJ4, sReserva: string;
begin
  Inventario1.Close;
  Inventario1.Open;
  Item_de_Inventario2.Close;
  Item_de_Inventario2.Open;

  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode processar inventário neste centro de custo.');
  If Inventario1.Situacao<>0 then
    Raise Exception.Create('O inventário já foi processado!');
  if Item_de_Inventario2.IsEmpty then
    Raise Exception.Create('O inventário está sem itens!');
  if MessageDlg('Deseja realmente processar esse inventário?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    raise Exception.Create('Processo Cancelado!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3560)) < 0 then
    raise Exception.Create('O usuário não tem permissão para processar o inventário!');

  If MessageDlg('ATENÇÃO!!!'+#13+
                'Tenha certeza sobre o tipo de inventário!'+#13+
                'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdCNC := Inventario1.CodigoCNC;
  CdINV := Inventario1.CodigoINV;
  iTipo := Inventario1.Tipo;

  vSomarComReserva := False;
  if (DM.Configuracao1.Empresa = empMotical) and
     (iTipo in [0,1]) then
    If MessageDlg('ATENÇÃO!!!'+#13+
                  'Deseja somar (automaticamente) com a reserva?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      vSomarComReserva := True;

  //Tipos de Inventário:
  //Vendas (C,F,F1)
  //Vendas (C,F)
  //Somente F1
  //Somente LJ3
  //Somente LJ4

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUN := dblResponsavel.KeyValue
  else
    CdFUN := 0;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      Aux:=Item_de_Inventario2.AfterScroll;
      Item_de_Inventario2.AfterScroll:=nil;
      Item_de_Inventario2.First;
      While not Item_de_Inventario2.EOF do
      Begin
        sEstComercial := '';
        sEstFisico    := '';
        sEstFiscal    := '';
        sEstSN        := '';
        sEstLJ4       := '';
        sReserva      := '';
        CdPRD := Item_de_Inventario2.CodigoPRD;
        with Item_de_Estoque1 do
        Begin
          Close;
          ParamByName('PRD_CODIGO').asInteger := CdPRD;
          ParamByName('CNC_CODIGO').asInteger := Item_de_Inventario2.CodigoCNC;
          ParamByName('FUN_CODIGO').asInteger := CdFUN;
          Open;
          If IsEmpty then
          Begin
            ShowMessage('Falha ao Gerar Item de Estoque!');
            Raise exception.Create('');
          end;

          //Se for para somar com a reserva
          if vSomarComReserva then
          Begin
            if SReservado > 0 then
              vEstReservado := Arredonda(SReservado)
            else
              vEstReservado := 0;
          end
          else
            vEstReservado := 0;

          //Gerar Movimento Comercial
          if iTipo in [0,1] then
          Begin
            if (DM.Configuracao1.Empresa <> empMotical) or
               (SReservado < 0) then
            Begin
              //Zerar as reservas
              sReserva := ' IES_SRESERVADO=0 '+
                          ',IES_INVENT_RESERV=0 '+
                          ',IES_INVENT_DATA_RESERV="'+MesDiaHora(DM.Configuracao1.DataHora)+'", ';
            end;
            sEstComercial := ' IES_SCOMERCIAL='+VirgPonto(Item_de_Inventario2.QuantInf+vEstReservado)+
                             ',IES_INVENT_COMERCIAL='+VirgPonto(Item_de_Inventario2.QuantInf+vEstReservado)+
                             ',IES_INVENT_DATA_COMERCIAL="'+MesDiaHora(DM.Configuracao1.DataHora)+'" ';

            if ((Item_de_Inventario2.QuantInf+vEstReservado) > SComercial) then
            Begin
              vQtdMov := Item_de_Inventario2.QuantInf+vEstReservado-SComercial;
              sTipoMov := 'E';
            end
            else
            Begin
              vQtdMov := SComercial-Item_de_Inventario2.QuantInf+vEstReservado;
              sTipoMov := 'S';
            end;
            if Item_de_Inventario2.CodigoLOT = 0 then
            Begin
              if not DM.Movimento_Estoque_Comercial1.Inserir(DM.Configuracao1.CodigoCNC,0,
                  CdPRD,CdFUN,1010(*INVENTARIO*),CdCNC,CdINV,sTipoMov,vQtdMov,
                  SComercial, SReservado, Indisponivel, SAmostra, 0(*Amostra*), SBonificacao, 0(*Bonus*),
                  'QTD INF.: '+format('%.2f',[Item_de_Inventario2.QuantInf])+' Res:'+format('%.2f',[vEstReservado])+
                  ' TIPO:'+IntToStr(cmbTipo.ItemIndex)) then
              Begin
                ShowMessage('Falha ao Gerar Mov. Comercial!');
                Raise exception.Create('');
              end;
            end;
          end;

          //Gerar Movimento Físico
          if itipo in [0,1] then
          Begin
            sEstFisico := ',IES_SFISICO='+VirgPonto(Item_de_Inventario2.QuantInf+vEstReservado)+
                          ',IES_INVENT_FISICO='+VirgPonto(Item_de_Inventario2.QuantInf+vEstReservado)+
                          ',IES_INVENT_DATA_FISICO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" ';
            if ((Item_de_Inventario2.QuantInf+vEstReservado) > SFisico) then
            Begin
              vQtdMov := Item_de_Inventario2.QuantInf+vEstReservado-SFisico;
              sTipoMov := 'E';
            end
            else
            Begin
              vQtdMov := SFisico-Item_de_Inventario2.QuantInf+vEstReservado;
              sTipoMov := 'S';
            end;
            if Item_de_Inventario2.CodigoLOT = 0 then
            Begin
              if not DM.Movimento_Fisico1.Inserir(DM.Configuracao1.CodigoCNC, 0,
                  CdPRD,CdFUN,CdCNC,CdINV,1010(*NVENTARIO*),sTipoMov,vQtdMov,
                  SFisico,'QTD INF. '+format('%.2f',[Item_de_Inventario2.QuantInf])+' Res:'+format('%.2f',[vEstReservado])+
                  ' TIPO:'+IntToStr(cmbTipo.ItemIndex)) then
              Begin
                ShowMessage('Falha ao Gerar Mov. Físico!');
                Raise exception.Create('');
              end;
            end;
          end;

          //Gerar Movimento Físcal
          if iTipo in [0,2] then
          Begin
            if (Trim(sEstComercial) <> '') or
               (Trim(sEstFisico) <> '') then
              sEstFiscal := sEstFiscal+',';
            sEstFiscal := sEstFiscal + ' IES_SFISCAL='+VirgPonto(Item_de_Inventario2.QuantInf);
            if ((Item_de_Inventario2.QuantInf) > SFiscal) then
            Begin
              vQtdMov := Item_de_Inventario2.QuantInf-SFiscal;
              sTipoMov := 'E';
            end
            else
            Begin
              vQtdMov := SFiscal-Item_de_Inventario2.QuantInf;
              sTipoMov := 'S';
            end;
            if Item_de_Inventario2.CodigoLOT = 0 then
            Begin
              if not DM.Mov_Est_Fiscal1.Inserir(CodigoCNC,CdPRD,CdFUN,0,
                  CdCNC,CdINV,1010(*INVENTARIO*),sTipoMov,vQtdMov,
                  SFiscal,
                  SAmostraFiscal, 0(*AmostraFiscal*), SBonificacaoFiscal, 0(*BonusFiscal*),
                  'QTD INF. '+format('%.2f',[Item_de_Inventario2.QuantInf])+
                  ' TIPO:'+IntToStr(cmbTipo.ItemIndex)) then
              Begin
                ShowMessage('Falha ao Gerar Mov. Físcal!');
                Raise exception.Create('');
              end;
            end;
          end;

          //Gerar Movimento SN
          if iTipo = 3 then
          Begin
            if (Trim(sEstComercial) <> '') or
               (Trim(sEstFisico) <> '') or
               (Trim(sEstFiscal) <> '') then
              sEstSN := sEstSN+',';
            sEstSN := sEstSN + ' IES_SSN='+VirgPonto(Item_de_Inventario2.QuantInf);
            if ((Item_de_Inventario2.QuantInf) > SSN) then
            Begin
              vQtdMov := Item_de_Inventario2.QuantInf-SSN;
              sTipoMov := 'E';
            end
            else
            Begin
              vQtdMov := SSN-Item_de_Inventario2.QuantInf;
              sTipoMov := 'S';
            end;
            if Item_de_Inventario2.CodigoLOT = 0 then
            Begin
              if not DM.Movimento_Estoque_SN1.Inserir(CodigoCNC,CdPRD,CdFUN,
                  1010(*INVENTARIO*),CdCNC,CdINV,sTipoMov,vQtdMov,
                  SSN,'QTD INF. '+format('%.2f',[Item_de_Inventario2.QuantInf])+
                  ' TIPO:'+IntToStr(cmbTipo.ItemIndex)) then
              Begin
                ShowMessage('Falha ao Gerar Mov. SN!');
                Raise exception.Create('');
              end;
            end;
          end;

          //Gerar Movimento LJ4
          if iTipo = 4 then
          Begin
            if (Trim(sEstComercial) <> '') or
               (Trim(sEstFisico) <> '') or
               (Trim(sEstFiscal) <> '') then
              sEstLJ4 := sEstLJ4+',';
            sEstLJ4 := sEstLJ4 + ' IES_SLJ4='+VirgPonto(Item_de_Inventario2.QuantInf);
            if ((Item_de_Inventario2.QuantInf) > SLJ4) then
            Begin
              vQtdMov := Item_de_Inventario2.QuantInf-SLJ4;
              sTipoMov := 'E';
            end
            else
            Begin
              vQtdMov := SLJ4-Item_de_Inventario2.QuantInf;
              sTipoMov := 'S';
            end;
            if Item_de_Inventario2.CodigoLOT = 0 then
            Begin
              if not DM.Movimento_Estoque_LJ41.Inserir(CodigoCNC,CdPRD,CdFUN,
                  1010(*INVENTARIO*),CdCNC,CdINV,sTipoMov,vQtdMov,
                  SLJ4,'QTD INF. '+format('%.2f',[Item_de_Inventario2.QuantInf])+
                  ' TIPO:'+IntToStr(cmbTipo.ItemIndex)) then
              Begin
                ShowMessage('Falha ao Gerar Mov. LJ4!');
                Raise exception.Create('');
              end;
            end;
          end;

          Close; //Fechar Item de Estoque

          if Item_de_Inventario2.CodigoLOT > 0 then
          Begin
            if (sEstFisico <> '') and
               (sEstFiscal <> '') then
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISICO='+VirgPonto(Item_de_Inventario2.QuantInf)+
                ',IED_QTD_FISCAL='+VirgPonto(Item_de_Inventario2.QuantInf)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND LOT_CODIGO='+IntToStr(Item_de_Inventario2.CodigoLOT))
            else if (sEstFiscal <> '') then
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISCAL='+VirgPonto(Item_de_Inventario2.QuantInf)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND LOT_CODIGO='+IntToStr(Item_de_Inventario2.CodigoLOT))
            else if (sEstFisico <> '') then
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISICO='+VirgPonto(Item_de_Inventario2.QuantInf)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND LOT_CODIGO='+IntToStr(Item_de_Inventario2.CodigoLOT));
          end
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              sReserva+sEstComercial+sEstFisico+sEstFiscal+sEstSN+sEstLJ4+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND FUN_CODIGO='+IntToStr(CdFUN));
        end;
        Item_de_Inventario2.Next;
      End;
      Item_de_Inventario2.AfterScroll:=Aux;

      //Mudar situação do inventário para inventário finalizado
      ExecutaSQL(DM.QR_Comandos,'UPDATE INVENTARIO SET '+
         ' INV_SITUACAO=1 '+
         ',INV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
         ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
         ' AND INV_CODIGO='+IntToStr(CdINV));

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
        end;
    end;
  End;

  Inventario1.Close;
  Inventario1.Open;
  Inventario1.LocalizarCod(CdINV,CdCNC);
end;

procedure TfMxInvent.SB_ImprimirProdutosClick(Sender: TObject);
begin
  Application.CreateForm(TOp_RelatProd,Op_RelatProd);
  with Op_RelatProd do
  Begin
    Tag:=8;
    ShowModal;
  end;
end;

procedure TfMxInvent.Inventario1BeforeOpen(DataSet: TDataSet);
begin
  try
    Inventario1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxInvent.Item_de_Inventario2CalcFields(DataSet: TDataSet);
begin
  With Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger:=Item_de_Inventario2.CodigoPRD;
    Open;
    If not IsEmpty then
    Begin
      if DM.Configuracao1.Empresa = 1 then
        Item_de_Inventario2.FieldByName('produto').AsString := Trim(Descricao+' '+Caracteristica)
      else
        Item_de_Inventario2.FieldByName('produto').AsString := Descricao;
      Item_de_Inventario2.FieldByName('Referencia').AsString := Referencia;
      Item_de_Inventario2.FieldByName('Detalhe').AsString := Detalhe;
    end;
  End;
  Item_de_Inventario2.FieldByName('Quantidade').asString := format('%.2f',[Item_de_Inventario2.QuantInf]);
end;


procedure TfMxInvent.SB_ImprimirInventarioClick(Sender: TObject);
var
  sEstDiferente, sOrdem, sFiltro: string;
  vAgrupar: Boolean;
begin
  sEstDiferente := '';
  //Tipos de Inventário:
  //Vendas (C,F,F1)
  //Vendas (C,F)
  //Somente F1
  //Somente LJ3
  case Inventario1.Tipo of
    0,1:Begin
          if MessageDlg('Exibir somente produtos com estoque físico diferente do informado?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
            if DM.Configuracao1.Empresa = empEletro then
              sEstDiferente := ' AND ROUND(T1.IIV_QUANT_INF,2)<>ROUND(T1.IIV_QUANT_SIST,2) '
            else
              sEstDiferente := ' AND (ROUND(T1.IIV_QUANT_INF,2)<>ROUND(T1.IIV_QUANT_SIST,2) '+
                ' OR ROUND(T1.IIV_QUANT_INF,2)<>(SELECT SUM(ROUND(IES_SFISICO,2)) AS QTD '+
                ' FROM ITEM_DE_ESTOQUE '+
                ' WHERE PRD_CODIGO=T1.PRD_CODIGO '+
                ' AND CNC_CODIGO=I1.CNC_CODIGO)) ' ;
            sFiltro :='(Est.Diferente)';
          end;
        end;
      2:Begin
          if MessageDlg('Exibir somente produtos com estoque fiscal diferente do informado?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
            if DM.Configuracao1.Empresa = empEletro then
              sEstDiferente := ' AND ROUND(T1.IIV_QUANT_INF,2)<>ROUND(T1.IIV_QUANT_SIST,2) '
            else
              sEstDiferente := ' AND (ROUND(T1.IIV_QUANT_INF,2)<>ROUND(T1.IIV_QUANT_SIST,2) '+
                ' OR ROUND(T1.IIV_QUANT_INF,2)<>(SELECT SUM(ROUND(IES_SFISCAL,2)) AS QTD '+
                ' FROM ITEM_DE_ESTOQUE '+
                ' WHERE PRD_CODIGO=T1.PRD_CODIGO'+
                ' AND CNC_CODIGO=I1.CNC_CODIGO)) ' ;
            sFiltro :='(Est.Diferente)';
          end;
        end;
      3:Begin
          if MessageDlg('Exibir somente produtos com estoque LJ3 diferente do informado?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
            if DM.Configuracao1.Empresa = empEletro then
              sEstDiferente := ' AND ROUND(T1.IIV_QUANT_INF,2)<>ROUND(T1.IIV_QUANT_SIST,2) '
            else
              sEstDiferente := ' AND (ROUND(T1.IIV_QUANT_INF,2)<>ROUND(T1.IIV_QUANT_SIST,2) '+
                ' OR ROUND(T1.IIV_QUANT_INF,2)<>(SELECT SUM(ROUND(IES_SSN,2)) AS QTD '+
                ' FROM ITEM_DE_ESTOQUE '+
                ' WHERE PRD_CODIGO=T1.PRD_CODIGO'+
                ' AND CNC_CODIGO=I1.CNC_CODIGO)) ' ;
            sFiltro :='(Est.Diferente)';
          end;
        end;
      4:Begin
          if MessageDlg('Exibir somente produtos com estoque LJ4 diferente do informado?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Begin
            if DM.Configuracao1.Empresa = empEletro then
              sEstDiferente := ' AND ROUND(T1.IIV_QUANT_INF,2)<>ROUND(T1.IIV_QUANT_SIST,2) '
            else
              sEstDiferente := ' AND (ROUND(T1.IIV_QUANT_INF,2)<>ROUND(T1.IIV_QUANT_SIST,2) '+
                ' OR ROUND(T1.IIV_QUANT_INF,2)<>(SELECT SUM(ROUND(IES_SLJ4,2)) AS QTD '+
                ' FROM ITEM_DE_ESTOQUE '+
                ' WHERE PRD_CODIGO=T1.PRD_CODIGO'+
                ' AND CNC_CODIGO=I1.CNC_CODIGO)) ' ;
            sFiltro :='(Est.Diferente)';
          end;
        end;
  end;

  Application.CreateForm(Trpt_ProdutosInvent, rpt_ProdutosInvent);
  with rpt_ProdutosInvent do
  Begin
    Tag := 0;
    zrlFiltros.Caption := sFiltro ;

    vAgrupar := False;
    if MessageDlg('Deseja agrupar os produtos?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      vAgrupar := True;

    if not vAgrupar then
    Begin
      zrbGrupoGRP.Expression := '';
      zrbGrupoGRP.Height := 0;
      zrbRodapeGRP.Height := 0;
      zrbGrupoSGP.Expression := '';
      zrbGrupoSGP.Height := 0;
      zrbRodapeSGP.Height := 0;
      sOrdem := ' I1.CNC_CODIGO,I1.INV_CODIGO,T2.PRD_DESCRICAO,T2.PRD_CARACTERISTICA ';
    end
    else
      sOrdem := ' I1.CNC_CODIGO,I1.INV_CODIGO,T2.GRP_CODIGO,T2.SGP_CODIGO,T2.PRD_DESCRICAO,T2.PRD_CARACTERISTICA ';

    Entidade.Close;
    Entidade.SQL.Text := 'SELECT I1.USU_CODIGO as USU,'+
      ' I1.*,T1.*,T2.PRD_DESCRICAO,T2.PRD_REFERENCIA,T2.PRD_MARCA, '+
      ' T2.PRD_UNIDADE, T2.PRD_DETALHE,T2.GRP_CODIGO,T2.SGP_CODIGO '+
      ',T2.PRD_CARACTERISTICA '+
      ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO T1, PRODUTO T2 '+
      ' WHERE T1.INV_CODIGO='+IntToStr(self.Inventario1.CodigoINV)+
      ' AND T1.CNC_CODIGO='+IntToStr(self.Inventario1.CodigoCNC)+
      sEstDiferente+
      ' AND T1.PRD_CODIGO=T2.PRD_CODIGO '+
      ' AND I1.CNC_CODIGO=T1.CNC_CODIGO '+
      ' AND I1.INV_CODIGO=T1.INV_CODIGO '+
      ' ORDER BY '+sOrdem;
    Entidade.Open;
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(3730)) <= 0 then
    Begin
      zrlDescAtual.Enabled:=False;
      zrlDescAnterior.Enabled:=False;
      zrlAtual.Enabled:=False;
      zrlAtualSGP.Enabled:=False;
      zrlAtualGRP.Enabled:=False;
      zrlAtualTotal.Enabled:=False;
      zrlAnterior.Enabled:=False;
      zrlAnteriorSGP.Enabled:=False;
      zrlAnteriorGRP.Enabled:=False;
      zrlAnteriorTotal.Enabled:=False;
    end;
    report.preview;
    Close;
  end;
end;

procedure TfMxInvent.Item_de_Inventario2BeforeOpen(DataSet: TDataSet);
begin
  Item_de_Inventario2.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  Item_de_Inventario2.ParamByName('INV_CODIGO').AsInteger := Inventario1.CodigoINV;
end;


procedure TfMxInvent.SB_EtiquetasClick(Sender: TObject);
var
  sProduto, sCodigoBarras, CodBarras, Linha: string;
  PUmPoQuantidade: Boolean;
  iQuantidade, i: integer;

  Arq: TextFile;
begin
  if Item_de_Inventario2.IsEmpty then
    Raise Exception.Create('Pedido sem itens!');
    
  Etiquetas1.Close;
  Etiquetas1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CodigoCNC;
  Etiquetas1.ParamByName('INV_CODIGO').AsInteger := Entidade.CodigoINV;
  Etiquetas1.Open;
  
  if Etiquetas1.IsEmpty then
    Raise Exception.Create('Arquivo NÃO gerado!');

  PUmPoQuantidade := (MessageDlg('Deseja um registro para cada item do produto?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes);

  if MessageDlg('Gerar etiquetas EAN RED?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    {EAN RED}
    Linha := '';
    AssignFile (Arq, 'C:\Etiquetas.txt' );
    Rewrite(Arq);

    Writeln(Arq, 'produto1;produto2;preco;descricao;Referencia;Detalhe;Caracteristica;'+
      'Marca;CodBarras;Quantidade;QtdxPreco');

    while not Etiquetas1.EOF do
    begin
      if DM.Configuracao1.Empresa = 1 then
        sProduto := Etiquetas1.Descricao+' '+Etiquetas1.Caracteristica
      else
        sProduto := Etiquetas1.Descricao;

      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT TOP 1 * '+
          ' FROM CODIGO_DE_BARRAS '+
          ' WHERE CDB_CODIGO_ENTRADA='+IntToStr(Etiquetas1.CodigoPRD)+
          ' AND CDB_TIPO=0 ';
        Open;
        sCodigoBarras := FieldByName('CDB_CODIGO_BARRAS').asString;
      end;

      iQuantidade := Etiquetas1.FieldByName('IIV_QUANT_INF').asInteger;

      for i := 1 to iQuantidade do
      begin
        Linha := fMxPedComp.FormatarCBarra(inttostr(Etiquetas1.CodigoPRD))+';'+inttostr(Etiquetas1.CodigoPRD)+';'+
          Format('%.2f',[Etiquetas1.Precovenda])+';'+sProduto+';'+
          Etiquetas1.Referencia+';'+Etiquetas1.Detalhe+';'+
          Etiquetas1.Caracteristica+';'+Etiquetas1.Marca+';'+sCodigoBarras+';'+inttostr(iQuantidade)+';'+
          Format('%.2f',[iQuantidade*Etiquetas1.Precovenda]);

        Write (Arq, Linha);

        WriteLn (Arq);
      end;

      Etiquetas1.Next;
    end;
    CloseFile(Arq);
    ShowMessage('Arquivo gerado com sucesso !');
    Etiquetas1.Close;
  end
  else
  begin
    Etiquetas1.LimpaEtiquetas;
    while not Etiquetas1.EOF do
    begin
      if DM.Configuracao1.Empresa = 1 then
        sProduto := Etiquetas1.Descricao+' '+Etiquetas1.Caracteristica
      else
        sProduto := Etiquetas1.Descricao;

      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT TOP 1 * '+
          ' FROM CODIGO_DE_BARRAS '+
          ' WHERE CDB_CODIGO_ENTRADA='+IntToStr(Etiquetas1.CodigoPRD)+
          ' AND CDB_TIPO=0 ';
        Open;
        sCodigoBarras := FieldByName('CDB_CODIGO_BARRAS').asString;
      end;

      iQuantidade := Etiquetas1.FieldByName('IIV_QUANT_INF').asInteger;

      if (DM.Configuracao1.Empresa = empEletro) and
         (iQuantidade > 0) and
         (Etiquetas1.Estmedio > 1) then //Volume
        iQuantidade := Trunc(iQuantidade*Etiquetas1.Estmedio); //Volume

      Etiquetas1.AdicionaEtiqueta(Etiquetas1.CodigoPRD, Etiquetas1.Precovenda,
         iQuantidade, sProduto,
         Etiquetas1.Referencia, Etiquetas1.Detalhe, Etiquetas1.Caracteristica, Etiquetas1.Marca, sCodigoBarras, PUmPoQuantidade);
      Etiquetas1.Next;
    end;
    Etiquetas1.FechaEtiquetas;
    ShowMessage('Arquivo gerado com sucesso !');
    Etiquetas1.Close;
  end;
end;

procedure TfMxInvent.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMxInvent.CarregaProduto;
Begin
  Entidade.CarregaDados;
  With Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').AsInteger := Item_de_Inventario2.CodigoPRD;
    Open;
    If not IsEmpty then
    Begin
      if DM.Configuracao1.Empresa = 1 then
        edtProduto.text := Trim(Descricao+' '+Caracteristica)
      else
        edtProduto.text  := Descricao;
      edtUnidade.text    := Unidade;
      edtReferencia.text := Referencia;
      edtMarca.text      := Marca;
    End;
  End;
end;

procedure TfMxInvent.ApagaProduto;
Begin
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;
end;

procedure TfMxInvent.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
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
  SB_Prim.Enabled        := not Habilitar;
  SB_Ant.Enabled         := not Habilitar;
  SB_Prox.Enabled        := not Habilitar;
  SB_Ult.Enabled         := not Habilitar;
  SB_NovoItem.Enabled    := not Habilitar;
  SB_AltItem.Enabled     := not Habilitar;
  SB_ExcItem.Enabled     := not Habilitar;
  SB_SalvaItem.Enabled   := ((Cabecalho=0) and Habilitar);
  SB_CancItem.Enabled    := ((Cabecalho=0) and Habilitar);

  //LocalizarItem.Enabled := not Habilitar;  
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



  VerificarMercadoria1.Enabled  := not Habilitar;
  SB_Processar.Enabled          := not Habilitar;
  SB_Verificar.Enabled          := not Habilitar;
  SB_ImprimirProdutos.Enabled   := not Habilitar;
  SB_ImprimirInventario.Enabled := not Habilitar;
  SB_Etiquetas.Enabled          := not Habilitar;
  SB_Fechar.Enabled             := not Habilitar;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfMxInvent.Inventario1AfterOpen(DataSet: TDataSet);
begin
  if Inventario1.IsEmpty then
    Inventario1.LimpaCampos;
end;

procedure TfMxInvent.Item_de_Inventario2AfterOpen(DataSet: TDataSet);
begin
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfMxInvent.Inventario1CalcFields(DataSet: TDataSet);
begin
  with Funcionario2 do
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
  end;
end;

procedure TfMxInvent.SB_LocPedClick(Sender: TObject);
begin
  Application.CreateForm(TfMxSInventario, fMxSInventario);
  with fMxSInventario do
  Begin
    Tag := 0;
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM INVENTARIO '+
      ' WHERE CNC_CODIGO=:CNC_CODIGO '+
      ' AND ((INV_DATA>="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' AND INV_DATA<"'+MesDia(DM.Configuracao1.Data+1)+'") '+
      ' OR (INV_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' AND INV_DT_ALTERADO<"'+MesDia(DM.Configuracao1.Data+1)+'")) ';
    Entidade.Open;
    ShowModal;
  end;
end;

procedure TfMxInvent.SB_SalvaItemClick(Sender: TObject);
var
  Trans: Boolean;
  iEstado, CdFUN, CdPRD, CdLOT, CdIIV, CdCNC: integer;
  CdQtdInfo: string;
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

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUN := dblResponsavel.KeyValue
  else
    CdFUN := 0;

  if not VerificaInteiroBranco(edtCodigoLOT.Text) then
    edtCodigoLOT.Text := '0';

  CdQtdInfo := edtQuantidade.Text;
  CdPRD := StrToInt(edtCodigoPRD.Text);
  CdLOT := StrToInt(edtCodigoLOT.Text);

  //Alan - Alterado a pedido de Solange.
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT IIV_CODIGO,CNC_CODIGO,PRD_CODIGO,LOT_CODIGO,IIV_QUANT_INF'+
      ' FROM ITEM_DE_INVENTARIO '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND INV_CODIGO='+edtCodigoINV.Text+
      ' AND PRD_CODIGO='+IntToStr(CdPRD)+
      ' AND LOT_CODIGO='+IntToStr(CdLOT);
    Open;
  end;

  if (not DM.QR_Consultas.IsEmpty) Then //Produto já inventariado
  begin
    CdCNC := DM.QR_Consultas.FieldByName('CNC_CODIGO').asInteger;
    CdIIV := DM.QR_Consultas.FieldByName('IIV_CODIGO').asInteger;

    if MessageDlg('Foi encontrado o item '+DM.QR_Consultas.FieldByName('PRD_CODIGO').AsString+
      ', Lote '+DM.QR_Consultas.FieldByName('LOT_CODIGO').AsString+
      ' com '+DM.QR_Consultas.FieldByName('IIV_QUANT_INF').AsString+' unidades.'+#13+
      ' Deseja acrescentar '+edtQuantidade.Text+' unidade(s)?',
       mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      SB_CancItem.SetFocus;
      SB_CancItemClick(sender);
      Trans:=false;
      with DM.Database2 do
      begin
        try
          StartTransaction;
          Trans:=True;

          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_INVENTARIO SET '+
            ' IIV_QUANT_INF=IIV_QUANT_INF+'+VirgPonto(CdQtdInfo)+
            ',IIV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND IIV_CODIGO='+inttostr(CdIIV));
          Commit;
          Trans := False;
          Item_de_Inventario2.Close;
          Item_de_Inventario2.Open;
          Item_de_Inventario2.LocalizarCod(CdIIV, CdCNC);
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
      edtQuantidade.SetFocus;
  end
  else
  begin

    with Item_de_Estoque1 do
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
      ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
      ParamByName('FUN_CODIGO').asInteger := CdFUN;
      Open;
      if IsEmpty then
        if not Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPRD.Text),CdFUN,
            0,0,0,0,0,DM.Configuracao1.DataHora,0,0,0,0,0,0) then
          Raise exception.Create('Falha ao Gerar Item de Estoque!');
    end;

    if StrToInt(edtCodigoLOT.Text) > 0 then
    Begin
      with DM.Item_de_Estoque_Detalhe1 do
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
        ParamByName('LOT_CODIGO').asInteger := StrToInt(edtCodigoLOT.Text);
        Open;
        if IsEmpty then
          if not Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoLOT.Text),StrToInt(edtCodigoPRD.Text)) then
            Raise exception.Create('Falha ao Gerar Item de Estoque Detalhe!');
      end;
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
      ShowMessage('Os dados não forão salvos!');
    end;
  end;
end;

procedure TfMxInvent.SB_AltItemClick(Sender: TObject);
var
  CdCNC, CdIIV: integer;
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar item de inventário neste centro de custo.');
  If Inventario1.Situacao<>0 then
  Begin
    ShowMessage('O inventário já foi Processado!');
    Exit;
  End;
  if Item_de_Inventario2.IsEmpty then
    Raise exception.Create('Selecione o item a ser alterado!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7830)) < 0 then
    raise Exception.Create('O usuário não tem permissão para Alterar Item de Inventário!');

  ShowMessage('Confirme que este produto não está sendo inserido/alterado em outra máquina para esse inventário!');

  //Atualizar a quantidade com as outras máquinas
  CdCNC := Item_de_Inventario2.CodigoCNC;
  CdIIV := Item_de_Inventario2.CodigoIIV;  
  Item_de_Inventario2.Close;
  Item_de_Inventario2.Open;
  Item_de_Inventario2.LocalizarCod(CdIIV, CdCNC);

  Item_de_Inventario2.PreparaAlteracao;
  AtualizaControles(0,True);
  edtQuantidade.SetFocus;
end;

procedure TfMxInvent.SB_LocItemClick(Sender: TObject);
Var
  mensagem,Campo,Nome,campoloc :String;
  i, CdCNC, CdINV, CdIIV :Integer;
begin
  if not Entidade.Active then  //Item
    Exit;

  if not SB_LocItem.Enabled then
    Exit;

//Cód. Produto                                                                 PRD_CODIGO
//Descricao                                                                      PRD_DESCRICAO
//Referência                                                                     PRD_REFERENCIA
//Cód. Barras

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
  CdINV := Entidade.CodigoINV;
  // Entidade.Localizar;
  With Entidade do
  Begin
    if Campo='PRD_DESCRICAO' then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT IIV_CODIGO '+
          ' FROM PRODUTO P1, ITEM_DE_INVENTARIO I1 '+
          ' WHERE P1.PRD_DESCRICAO LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.INV_CODIGO='+IntToStr(CdINV)+
          ' AND P1.PRD_CODIGO=I1.PRD_CODIGO ';
        Open;
        CdIIV := FieldByName('IIV_CODIGO').asInteger;
      end;
      Entidade.LocalizarCod(CdIIV, CdCNC);
    end
    else if Campo='PRD_REFERENCIA' then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT IIV_CODIGO '+
          ' FROM PRODUTO P1, ITEM_DE_INVENTARIO I1 '+
          ' WHERE P1.PRD_REFERENCIA LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.INV_CODIGO='+IntToStr(CdINV)+
          ' AND P1.PRD_CODIGO=I1.PRD_CODIGO ';
        Open;
        CdIIV := FieldByName('IIV_CODIGO').asInteger;
      end;
      Entidade.LocalizarCod(CdIIV, CdCNC);
    end
    else if Campo='PRD_REFERENCIA' then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT IIV_CODIGO '+
          ' FROM CODIGO_DE_BARRAS C1, ITEM_DE_INVENTARIO I1 '+
          ' WHERE C1.CDB_CODIGO_BARRAS LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND I1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND I1.INV_CODIGO='+IntToStr(CdINV)+
          ' AND C1.CDB_CODIGO_ENTRADA=I1.PRD_CODIGO ';
        Open;
        CdIIV := FieldByName('IIV_CODIGO').asInteger;
      end;
      Entidade.LocalizarCod(CdIIV, CdCNC);
    end
    else
      Entidade.Localizar;
  End;
  edtLocalizar.SetFocus;
end;

procedure TfMxInvent.SB_VerificarClick(Sender: TObject);
begin
  if Item_de_Inventario2.isEmpty then
    Raise exception.Create('Selecione Inventário com Itens!');

  Application.CreateForm(TfMxVerificarMercadoria, fMxVerificarMercadoria);
  with fMxVerificarMercadoria do
  Begin
    Tag := 4; //Tipo Inventário
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Entidade.CodigoINV));
    edtCodigoCNC.Text := IntToStr(self.Entidade.CodigoCNC);
    edtPedido.Text    := IntToStr(self.Entidade.CodigoINV);
    edtDescricao.Text := 'Data: '+mskDataHora.Text+' //Resp.: '+dblResponsavel.Text;
    Showmodal;
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Entidade.CodigoINV));
  end;
end;

procedure TfMxInvent.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxInvent.SB_ExcCabClick(Sender: TObject);
var
  CdCNC, CdINV:integer;
  Trans: Boolean;
begin
  if Inventario1.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If Inventario1.Situacao <> 0 Then
    raise Exception.Create('Não pode mais ser excluído!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7810)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Pedido de Compra!');

  CdCNC := Inventario1.CodigoCNC;
  CdINV := Inventario1.CodigoINV;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      if not Inventario1.Deletar(CdCNC, CdINV) then //Ele gera LOG
        Raise exception.Create('');

      ExecutaSQL(DM.QR_Comandos, 'DELETE FROM ITEM_DE_INVENTARIO '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND INV_CODIGO='+IntToStr(CdINV));

      Commit;
      Trans := False;
      Inventario1.Close;
      Inventario1.Open;
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

procedure TfMxInvent.edtCodigoLOTExit(Sender: TObject);
begin
  if (not VerificaInteiroBranco(edtCodigoPRD.Text)) or
     (not VerificaInteiroBranco(edtCodigoLOT.Text)) then
    edtCodigoLOT.Text := '0';

  if StrToInt(edtCodigoLOT.Text) <= 0 then
  Begin
    edtCodigoLOT.Text := '0';
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT LOT_CODIGO '+
      ' FROM LOTE '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+
      ' AND LOT_CODIGO='+edtCodigoLOT.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoLOT.Text := '0';
      Exit;
    end;
  end;
end;

procedure TfMxInvent.edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadLote, fCadLote);
    with fCadLote do
    Begin
      tag:=2;
      edtCodigoPRD.text := self.edtCodigoPRD.Text;
      edtProduto.Text := self.edtProduto.Text;
      ShowModal;
    end;
  end;
end;

end.
