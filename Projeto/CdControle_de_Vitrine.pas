unit CdControle_de_Vitrine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, SolicitPecRep, Fornecedor, Produto, Menus, Item_de_Estoque,
  Controle_de_Vitrine, Funcionario;

type
  TfcadControleVitrine = class(TForm)
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
    Label15: TLabel;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    edtDescricao: TEdit;
    Label6: TLabel;
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
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    ComboBox3: TComboBox;
    Label12: TLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    Panel5: TPanel;
    SB_Imprimir: TSpeedButton;
    SB_Fechar: TSpeedButton;
    edtQuantidade: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    SB_Devolver: TSpeedButton;
    edtDocumento: TEdit;
    edtTipo: TEdit;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtSetor: TEdit;
    edtOBS: TEdit;
    Controle_de_Vitrine1: TControle_de_Vitrine;
    DSControleVitrine: TDataSource;
    dblCodigoFUN: TDBLookupComboBox;
    Label13: TLabel;
    Funcionario1: TFuncionario;
    DSFuncionario1: TDataSource;
    Controle_de_Vitrine1CVT_CODIGO: TIntegerField;
    Controle_de_Vitrine1CNC_CODIGO: TIntegerField;
    Controle_de_Vitrine1USU_CODIGO: TIntegerField;
    Controle_de_Vitrine1PRD_CODIGO: TIntegerField;
    Controle_de_Vitrine1FUN_CODIGO: TIntegerField;
    Controle_de_Vitrine1CVT_QUANTIDADE: TFloatField;
    Controle_de_Vitrine1CVT_TIPO: TIntegerField;
    Controle_de_Vitrine1CVT_DOCUMENTO: TIntegerField;
    Controle_de_Vitrine1CVT_SETOR: TStringField;
    Controle_de_Vitrine1CVT_DESCRICAO: TStringField;
    Controle_de_Vitrine1CVT_DT_CADASTRO: TDateTimeField;
    Controle_de_Vitrine1CVT_DT_RETORNO: TDateTimeField;
    Controle_de_Vitrine1CVT_SITUACAO: TIntegerField;
    Controle_de_Vitrine1CVT_OBSERVACAO: TStringField;
    Controle_de_Vitrine1DescricaoPRD: TStringField;
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure SB_DevolverClick(Sender: TObject);
    procedure Controle_de_Vitrine1AfterScroll(DataSet: TDataSet);
    procedure Controle_de_Vitrine1CalcFields(DataSet: TDataSet);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TControle_de_Vitrine;
  end;

var
  fcadControleVitrine: TfcadControleVitrine;

implementation
Uses
  UDM,funcoes, MxSCotaFor, MxSPediProd, MxSelPecasReposicao;
{$R *.DFM}

procedure TfcadControleVitrine.SB_PrimClick(Sender: TObject);
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

procedure TfcadControleVitrine.SB_AntClick(Sender: TObject);
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

procedure TfcadControleVitrine.SB_ProxClick(Sender: TObject);
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

procedure TfcadControleVitrine.SB_UltClick(Sender: TObject);
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

procedure TfcadControleVitrine.SB_NovoPedClick(Sender: TObject);
begin
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir Produtos neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1180)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  edtProduto.Text:='';
  dblCodigoFUN.SetFocus;
end;

procedure TfcadControleVitrine.SB_SalvaPedClick(Sender: TObject);
var
  CdCNC, CdCVT, CdPRD: integer;
begin
  if (edtProduto.Text='') then
  begin
    edtCodigoPRD.SetFocus;
    raise Exception.Create('Produto inválido!');
  end;
  if (edtQuantidade.Text='') then
  begin
    edtQuantidade.setfocus;
    raise Exception.Create('Quantidade inválida!');
  end;

  edtCodigoPRD.Enabled:=False;
  CdCNC := DM.Configuracao1.CodigoCNC;
  CdCVT := StrToInt(edtCodigoSPR.text);
  CdPRD := StrToInt(edtCodigoPRD.Text);

  if Entidade.FinalizaEdicao then
  Begin
    if edtCodigoPRD.Text <> '' then
    Begin
      Item_de_Estoque1.Close;
      Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CdPRD;
      Item_de_Estoque1.open;
      If Item_de_Estoque1.isempty then
      begin
        Item_de_Estoque1.Inserir(DM.Configuracao1.CodigoCNC,CdPRD,0(*CdFUN*),
          0,0,0,0,0,DM.Configuracao1.DataHora,0,0,0,0,0,0);
        Item_de_Estoque1.Close;
        Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
        Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CdPRD;
        Item_de_Estoque1.open;
      end;

      //Gerar MEC
      If DM.Movimento_Fisico1.Inserir(Item_de_Estoque1.CodigoCNC,0,
             CdPRD,0(*CdFUN*),CdCNC,CdCVT,26(*Assitência Téc.*),'S',
             StrTOFloat(edtQuantidade.Text),
             Item_de_Estoque1.SFisico) Then
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
          ' IES_INDISPONIVEL=IES_INDISPONIVEL+'+edtQuantidade.Text+
          ',IES_SFISICO=IES_SFISICO-'+edtQuantidade.Text+
          ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque1.CodigoCNC));
    end;
    AtualizaControles(1,False);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfcadControleVitrine.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  Entidade.CarregaDados;
  AtualizaControles(1,False);
  edtCodigoPRD.Enabled:=False;
end;

procedure TfcadControleVitrine.SB_ExcPedClick(Sender: TObject);
var
  CdCNC, CdCVT : integer;
begin
  CdCNC := Entidade.CodigoCNC;
  CdCVT := Entidade.CodigoCVT;

  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar registros neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1190)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if entidade.Situacao = 2 then
  begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE CONTROLE_DE_VITRINE SET CVT_SITUACAO=1 '+
      ' WHERE CVT_CODIGO = '+IntToStr(CdCVT)+
      ' AND CNC_CODIGO = '+  IntToStr(CdCNC));
  end
  else
    raise Exception.Create('Você só pode excluir este produto se ele tiver sido retornado!');
end;

procedure TfcadControleVitrine.SB_LocPedClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfcadControleVitrine.FormCreate(Sender: TObject);
begin
  Entidade:=Controle_de_Vitrine1;
  Entidade.Active:=True;
  Funcionario1.Active:=true;
end;

procedure TfcadControleVitrine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Produto1.Active:=False;
  Action:=Cafree;
end;

procedure TfcadControleVitrine.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaPed.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfcadControleVitrine.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfcadControleVitrine.edtCodigoPRDExit(Sender: TObject);
begin
  If (SB_CancPed.Focused) or (SB_SalvaPed.Focused) then
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

procedure TfcadControleVitrine.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    Application.CreateForm(TfMxSPedProd, fMxSPedProd);
    fMxSPedProd.Tag:=47;
    fMxSPedProd.ShowModal;
    if edtCodigoPRD.Text <> '' then
      edtDescricao.SetFocus;
  End;
end;

procedure TfcadControleVitrine.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfcadControleVitrine.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(13) then
  begin
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end;
  end
  else
  If key=chr(27) then
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else
      Close;
end;

procedure TfcadControleVitrine.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
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

  SB_Devolver.Enabled := not Habilitar;
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

procedure TfcadControleVitrine.SB_ImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TfMxSelPecasReposicao,fMxSelPecasReposicao);
  fMxSelPecasReposicao.Tag:=2;
  fMxSelPecasReposicao.ShowModal;
end;

procedure TfcadControleVitrine.SB_DevolverClick(Sender: TObject);
var
  CdPRD, iQuantidade, CdCNC, CdCVT : integer;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Registro!');

  If MessageDlg('Confirma a devolução do produto?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    CdCNC := Entidade.CodigoCNC;
    CdCVT := Entidade.CodigoCVT;
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
        Item_de_Estoque1.Inserir(CdCNC, CdPRD,0(*CdFUN*),0,0,0,0,0,
          DM.Configuracao1.DataHora,0,0,0,0,0,0);
        Item_de_Estoque1.Close;
        Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
        Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CdPRD;
        Item_de_Estoque1.open;
      end;

      If DM.Movimento_Fisico1.Inserir(CdCNC,0, CdPRD, 0(*CdFUN*),CdCNC, CdCVT, 18(*Assitencia Tec. Ent*),
           'E', iQuantidade, Item_de_Estoque1.SFisico) Then
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
        ' IES_INDISPONIVEL=IES_INDISPONIVEL-'+IntToStr(iQuantidade)+
        ',IES_SFISICO=IES_SFISICO+'+IntToStr(iQuantidade)+
        ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));
      ExecutaSQL(DM.QR_Comandos,'UPDATE CONTROLE_DE_VITRINE SET CVT_SITUACAO=2 '+
        ' WHERE CVT_CODIGO = '+IntToStr(CdCVT)+
        ' AND CNC_CODIGO = '+  IntToStr(CdCNC));
      Controle_de_Vitrine1.Close;
      Controle_de_Vitrine1.Open;
    end;
  end;
end;

procedure TfcadControleVitrine.Controle_de_Vitrine1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfcadControleVitrine.Controle_de_Vitrine1CalcFields(
  DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    Close;
    ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
    Open;
    Entidade.FieldByName('DescricaoPRD').asString:=Descricao;
  end;
end;

end.
