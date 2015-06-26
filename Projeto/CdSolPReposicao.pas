unit CdSolPReposicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, SolicitPecRep, Fornecedor, Produto, Menus, Item_de_Estoque;

type
  TfCadSolPRep = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcPed: TSpeedButton;
    SB_LocPed: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    edtCodigoSPR: TEdit;
    Label3: TLabel;
    Label8: TLabel;
    memObservacao: TMemo;
    Label15: TLabel;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    Label4: TLabel;
    edtDescricao: TEdit;
    Label6: TLabel;
    SolicitPecRep1: TSolicitPecRep;
    DSSolicitPecRep1: TDataSource;
    DSProduto1: TDataSource;
    Produto1: TProduto;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    IncluirPed: TMenuItem;
    ExcluirPed: TMenuItem;
    N1: TMenuItem;
    SalvarPed: TMenuItem;
    CancelarPed: TMenuItem;
    N2: TMenuItem;
    LocalizarPed: TMenuItem;
    edtCodigoFOR: TEdit;
    Edit5: TEdit;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    SolicitPecRep1SPR_CODIGO: TIntegerField;
    SolicitPecRep1CNC_CODIGO: TIntegerField;
    SolicitPecRep1FOR_CODIGO: TIntegerField;
    SolicitPecRep1PRD_CODIGO: TIntegerField;
    SolicitPecRep1SPR_DESCRICAO: TStringField;
    SolicitPecRep1SPR_DATA: TDateTimeField;
    SolicitPecRep1SPR_SITUACAO: TIntegerField;
    SolicitPecRep1SPR_OBSERVACAO: TStringField;
    SolicitPecRep1Fornecedor: TStringField;
    SolicitPecRep1Produto: TStringField;
    ComboBox3: TComboBox;
    Label12: TLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    Panel5: TPanel;
    SB_Imprimir: TSpeedButton;
    SB_Fechar: TSpeedButton;
    edtQuantidade: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    SolicitPecRep1SPR_QUANTIDADE: TIntegerField;
    SB_Observacao: TSpeedButton;
    SolicitPecRep1SPR_DT_ALTERADO: TDateTimeField;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure SB_ExcPedClick(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SolicitPecRep1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure SolicitPecRep1CalcFields(DataSet: TDataSet);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure SB_ObservacaoClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TSolicitPecRep;
  end;

var
  fCadSolPRep: TfCadSolPRep;

implementation
Uses
  UDM,funcoes, MxSCotaFor, MxSPediProd, MxSelPecasReposicao,
  MxSPediProdMotCal;
{$R *.DFM}

procedure TfCadSolPRep.SB_PrimClick(Sender: TObject);
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

procedure TfCadSolPRep.SB_AntClick(Sender: TObject);
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

procedure TfCadSolPRep.SB_ProxClick(Sender: TObject);
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

procedure TfCadSolPRep.SB_UltClick(Sender: TObject);
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

procedure TfCadSolPRep.SB_NovoPedClick(Sender: TObject);
begin
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1180)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  Edit5.Text:='';
  edtProduto.Text:='';
  edtCodigoFOR.setFocus;
end;

procedure TfCadSolPRep.SB_SalvaPedClick(Sender: TObject);
var
  CdCNC, CdSPR : integer;
  vOBS: string;
  Trans: Boolean;
begin
  //Alterar Somente Observação
  if not edtDescricao.Enabled then
  Begin
    AtualizaControles(1, False);
    memObservacao.Enabled := False;
    CdCNC := Entidade.CodigoCNC;
    CdSPR := Entidade.CodigoSPR;
    vOBS := memObservacao.Text;
    ExecutaSQL(DM.QR_Comandos, 'UPDATE SOLICITACAO_DE_PECAS_DE_REP SET '+
      ' SPR_OBSERVACAO="'+memObservacao.Text+'" '+
      ',SPR_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND SPR_CODIGO='+IntToStr(CdSPR));
    Entidade.GeraLog(1200,CdCNC,CdSPR,'OBS:'+vOBS);
    Entidade.Close;
    Entidade.Open;
    Entidade.LocalizarCod(CdSPR, CdCNC);
    Exit;
  end;

  If edtCodigoFOR.Text='' then
    raise Exception.Create('Selecione um fornecedor!');

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Clear;

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdSPR := StrToInt(edtCodigoSPR.Text);

  if edtCodigoPRD.Text <> '' then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT FOR_CODIGO FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+edtCodigoPRD.Text;
      Open;
      if StrToInt(edtCodigoFOR.Text) <> FieldByName('FOR_CODIGO').asInteger then
        Raise exception.Create('Código do Fornecedor não conferi com o Produto!');
    end;
    Item_de_Estoque1.Close;
    Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
    Item_de_Estoque1.open;
    If Item_de_Estoque1.isempty then
    begin
      if not Item_de_Estoque1.Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPRD.Text),0(*CdFUN*),
          0,0,0,0,0,DM.Configuracao1.DataHora,0,0,0,0,0,0) then
        Raise exception.Create('Falha ao gerar Item de Estoque!');
      Item_de_Estoque1.Close;
      Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
      Item_de_Estoque1.open;
    end;
  end;
  edtCodigoPRD.Enabled:=False;

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
      Begin
        ShowMessage('As alterações não foram salvas!');
        Raise exception.Create('');
      end;

      if edtCodigoPRD.Text <> '' then
      Begin
        //Gerar MEC
        If not DM.Movimento_Fisico1.Inserir(Item_de_Estoque1.CodigoCNC,0,
               StrToInt(edtCodigoPRD.Text),0(*CdFUN*),CdCNC,CdSPR,367(*Assitência Téc.*),'S',
               StrTOFloat(edtQuantidade.Text),
               Item_de_Estoque1.SFisico) Then
        Begin
          ShowMessage('Falha ao gerar Mov. Físico!');
          Raise exception.Create('');
        end;

        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
          ' IES_INDISPONIVEL=IES_INDISPONIVEL+'+edtQuantidade.Text+
          ',IES_SFISICO=IES_SFISICO-'+edtQuantidade.Text+
          ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+
          ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque1.CodigoCNC));
      end;
      AtualizaControles(1,False);

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o Suporte');
        end;
    end;
  End;

end;

procedure TfCadSolPRep.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  Entidade.CarregaDados;
  edtProduto.Text:=Entidade.FieldByName('Produto').asString;
  Edit5.Text:=Entidade.FieldByName('Fornecedor').asString;
  AtualizaControles(1,False);
  edtCodigoPRD.Enabled:=False;
end;

procedure TfCadSolPRep.SB_ExcPedClick(Sender: TObject);
var
  CdPRD, iQuantidade, CdCNC, CdSPR : integer;
  Trans:Boolean;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar registros neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1190)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if not VerificaInteiroBranco(edtQuantidade.Text) then
    Raise Exception.Create('Quantidade inválida!');

  CdCNC := Entidade.CodigoCNC;
  CdSPR := Entidade.CodigoSPR;
  
  if edtCodigoPRD.Text = '' then
    CdPRD := 0
  else
    CdPRD := StrToInt(edtCodigoPRD.Text);
  iQuantidade := StrToInt(edtQuantidade.Text);

  if CdPRD <> 0 then
  Begin
    Item_de_Estoque1.Close;
    Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CdPRD;
    Item_de_Estoque1.open;
    If Item_de_Estoque1.isempty then
    begin
      if not Item_de_Estoque1.Inserir(CdCNC, CdPRD,0(*CdFUN*),0,0,0,0,0,
          DM.Configuracao1.DataHora,0,0,0,0,0,0) then
        Raise exception.Create('Falha ao Criar item de Estoque!');
      Item_de_Estoque1.Close;
      Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CdPRD;
      Item_de_Estoque1.open;
    end;
    if Item_de_Estoque1.Indisponivel < iQuantidade then
      Raise exception.Create('Quantidade indisponível menor que a informada!');
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

      if Entidade.deletarauto then
      Begin
        if CdPRD <> 0 then
        Begin
          If not DM.Movimento_Fisico1.Inserir(CdCNC,0, CdPRD, 0(*CdFUN*), CdCNC,
               CdSPR, 367(*Assitencia Tec. Ent*),
               'E', iQuantidade, Item_de_Estoque1.SFisico) Then
          Begin
            ShowMessage('Falha ao gerar Mov. Físico!');
            Raise exception.Create('');
          end;
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
            ' IES_INDISPONIVEL=IES_INDISPONIVEL-'+IntToStr(iQuantidade)+
            ',IES_SFISICO=IES_SFISICO+'+IntToStr(iQuantidade)+
            ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND CNC_CODIGO='+IntToStr(CdCNC));
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o Suporte');
        end;
    end;
  End;
end;

procedure TfCadSolPRep.SB_LocPedClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadSolPRep.FormCreate(Sender: TObject);
begin
  Entidade:=SolicitPecRep1;
  Entidade.Active:=True;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_SPR_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfCadSolPRep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_SPR_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Produto1.Close;
  Action:=Cafree;
end;

procedure TfCadSolPRep.SolicitPecRep1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtProduto.Text:=Entidade.FieldByName('Produto').asString;
  Edit5.Text:=Entidade.FieldByName('Fornecedor').asString;
end;

procedure TfCadSolPRep.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaPed.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadSolPRep.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfCadSolPRep.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=4;
    fMxSCotaFor.ShowModal;
    if edtCodigoFOR.Text <> '' then
    Begin
      edtCodigoPRD.Enabled:=True;
      edtCodigoPRD.SetFocus;
    end;
  end;
end;

procedure TfCadSolPRep.edtCodigoFORExit(Sender: TObject);
begin
  If SB_CancPed.Focused then
    Exit;
  If edtCodigoFOR.Text<>'' then
    If VerificaInteiro(edtCodigoFOR.text) then
    Begin
      DM.Fornecedor1.Close;
      DM.Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=StrToInt(edtCodigoFOR.Text);
      DM.Fornecedor1.Open;
      If DM.Fornecedor1.IsEmpty then
      Begin
        edtCodigoFOR.setFocus;
        ShowMessage('Fornecedor inválido!');
      End
      else
        begin
          Edit5.Text:=DM.Fornecedor1.RazaoSocial;
          edtCodigoPRD.Enabled:=True;
          edtCodigoPRD.SetFocus;
        end;
    End
    else
    Begin
      edtCodigoFOR.setFocus;
      ShowMessage('Fornecedor inválido!');
    end;
end;

procedure TfCadSolPRep.edtCodigoPRDExit(Sender: TObject);
begin
  If SB_CancPed.Focused then
    Exit;
  If edtCodigoPRD.Text<>'' then
    If VerificaInteiro(edtCodigoPRD.text) then
    Begin
      Produto1.Close;
      Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
      Produto1.Open;
      If Produto1.IsEmpty then
      Begin
        edtCodigoPRD.setFocus;
        ShowMessage('Produto inválido!');
      End
      else
         edtProduto.Text:=Produto1.Descricao;
    End
    else
    Begin
      edtCodigoPRD.setFocus;
      ShowMessage('Produto inválido!');
    end;
end;

procedure TfCadSolPRep.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If edtCodigoFOR.Text='' then
    raise Exception.Create('Selecione um fornecedor antes de selecionar os produtos que ele fornece!');
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      With fMxSPedProdMotcal do
      Begin
        Produto1.Close;
        Produto1.SQL.Text:='SELECT * FROM PRODUTO '+
          ' WHERE FOR_CODIGO='+edtCodigoFOR.Text+
          ' ORDER BY PRD_DESCRICAO';
        Tag:=15;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      With fMxSPedProd do
      Begin
        Produto1.Close;
        Produto1.SQL.Text:='SELECT * FROM PRODUTO '+
          ' WHERE FOR_CODIGO='+edtCodigoFOR.Text+
          ' ORDER BY PRD_DESCRICAO';
        Tag:=15;
        ShowModal;
      end;
    end;
    if edtCodigoPRD.Text <> '' then
      edtDescricao.SetFocus;
  End;
end;

procedure TfCadSolPRep.SolicitPecRep1CalcFields(DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    if Entidade.Produto <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=Entidade.Produto;
      Open;
    end;
    Entidade.FieldByName('Produto').asString:=Descricao;
  end;

  with DM.Fornecedor1 do
  Begin
    if Entidade.Fornecedor <> CodigoFOR then
    Begin
      Close;
      ParamByName('FOR_CODIGO').asInteger:=Entidade.Fornecedor;
      Open;
    end;
    Entidade.FieldByName('Fornecedor').asString:=RazaoSocial;
  end;
end;

procedure TfCadSolPRep.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadSolPRep.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else
      Close;
  end
  else if Key=#13 then
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end;
  end;
end;

procedure TfCadSolPRep.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirPed.Enabled    := not Habilitar;
  ExcluirPed.Enabled    := not Habilitar;
  SalvarPed.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarPed.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarPed.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoPed.Enabled    := not Habilitar;
  SB_LocPed.Enabled     := not Habilitar;
  SB_ExcPed.Enabled     := not Habilitar;
  SB_SalvaPed.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled    := ((Cabecalho=1) and Habilitar);

  SB_Observacao.Enabled := not Habilitar;
  SB_Imprimir.Enabled   := not Habilitar;
  SB_Fechar.Enabled     := not Habilitar;

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

procedure TfCadSolPRep.SB_ImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPecasReposicao,fMxSelPecasReposicao);
  fMxSelPecasReposicao.Tag:=1;
  fMxSelPecasReposicao.ShowModal;
end;

procedure TfCadSolPRep.SB_ObservacaoClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Registro!');
  AtualizaControles(1, True);
  memObservacao.Enabled := True;
  memObservacao.SetFocus;
end;

end.
