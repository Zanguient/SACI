unit CdSubGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, DBCtrls, SubGrupo, Grupo, Menus, Variants, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  vetorBaseReal = array[1..2] of string;
  TfCadSubGrupo = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtDescricao: TEdit;
    edtCodigoSGP: TEdit;
    Label3: TLabel;
    memOBS: TMemo;
    Label15: TLabel;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    DSGrupo1: TDataSource;
    DSSubgrupo1: TDataSource;
    Panel2: TPanel;
    dblCodigoGRP: TDBLookupComboBox;
    Label4: TLabel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SubGrupo1SGP_CODIGO: TIntegerField;
    SubGrupo1CNC_CODIGO: TIntegerField;
    SubGrupo1GRP_CODIGO: TIntegerField;
    SubGrupo1SGP_DESCRICAO: TStringField;
    SubGrupo1SGP_OBSERVACAO: TStringField;
    edtBaseChave: TEdit;
    labDescBase: TLabel;
    Label6: TLabel;
    edtFamilia: TEdit;
    SubGrupo1SGP_BASE_CHAVE: TStringField;
    SubGrupo1SGP_FAMILIA: TStringField;
    SubGrupo1SGP_SITUACAO: TIntegerField;
    SubGrupo1SGP_DT_CADASTRO: TDateTimeField;
    SubGrupo1SGP_DT_ALTERADO: TDateTimeField;
    SubGrupo1USU_CODIGO: TIntegerField;
    Label7: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    lblIndiceRefracao: TLabel;
    edtIndiceRefracao: TEdit;
    SubGrupo1SGP_INDICE_REFRACAO: TFloatField;
    SB_AtualizaBaseReal: TSpeedButton;
    SubGrupo1SGP_FABRICAR: TIntegerField;
    ckbFabricar: TCheckBox;
    SB_GerarSubGrupo: TSpeedButton;
    Grupo2: TGrupo;
    ckbPrecoDolar: TCheckBox;
    SubGrupo1SGP_PRECO_DOLAR: TIntegerField;
    labDescEixos: TLabel;
    edtEixos: TEdit;
    SubGrupo1SGP_EIXOS: TStringField;
    ckbServicoObrigatorio: TCheckBox;
    SubGrupo1SGP_SERVICO_OBRIGATORIO: TIntegerField;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    FecharCab: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
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
    procedure cmbCampoEnter(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubGrupo1AfterScroll(DataSet: TDataSet);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FecharCabClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_AtualizaBaseRealClick(Sender: TObject);
    procedure SB_GerarSubGrupoClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TSubGrupo;
  end;

var
  fCadSubGrupo: TfCadSubGrupo;

implementation

Uses UDM, funcoes;

{$R *.DFM}

procedure TfCadSubGrupo.SB_PrimClick(Sender: TObject);
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

procedure TfCadSubGrupo.SB_AntClick(Sender: TObject);
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

procedure TfCadSubGrupo.SB_ProxClick(Sender: TObject);
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

procedure TfCadSubGrupo.SB_UltClick(Sender: TObject);
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

procedure TfCadSubGrupo.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1830)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if dblCodigoGRP.Text = '' then
    Raise Exception.Create('Selecione o Grupo!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  AtualizaControles(1, True);
  edtDescricao.SetFocus;
end;

procedure TfCadSubGrupo.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1850)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1, True);
  edtDescricao.SetFocus;
end;

procedure TfCadSubGrupo.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1840)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  with DM.QR_Consultas do
  Begin
    //Localizar Produto que utilize esse subgrupo
    Close;
    SQL.Text := 'SELECT top 1 PRD_CODIGO '+
      ' FROM PRODUTO '+
      ' WHERE SGP_CODIGO='+edtCodigoSGP.Text;
    Open;
    if not IsEmpty then
      Raise exception.Create('SubGrupo utilizado por produto(s)!');

    //Localizar Grau que utilize esse subgrupo
    Close;
    SQL.Text := 'SELECT top 1 GRA_CODIGO '+
      ' FROM GRAU '+
      ' WHERE SGP_CODIGO='+edtCodigoSGP.Text;
    Open;
    if not IsEmpty then
      Raise exception.Create('SubGrupo com Graus definidos!');

    //Localizar Item de Tabela de PreçoSubGrupo que utilize esse subgrupo
    Close;
    SQL.Text := 'SELECT top 1 TPS_CODIGO '+
      ' FROM ITEM_DE_TABELA_DE_PRECO_SUBGRUPO '+
      ' WHERE SGP_CODIGO='+edtCodigoSGP.Text;
    Open;
    if not IsEmpty then
      Raise exception.Create('SubGrupo em Tabela de PreçoSubGrupo!');

    //Localizar Tabela de Item de Pacote de Venda que utilize esse subgrupo
    Close;
    SQL.Text := 'SELECT top 1 PDV_CODIGO '+
      ' FROM ITEM_DE_PACOTE_DE_VENDA '+
      ' WHERE SGP_CODIGO_1='+edtCodigoSGP.Text+
      ' OR SGP_CODIGO_2='+edtCodigoSGP.Text+
      ' OR SGP_CODIGO_3='+edtCodigoSGP.Text+
      ' OR SGP_CODIGO_4='+edtCodigoSGP.Text;
    Open;
    if not IsEmpty then
      Raise exception.Create('SubGrupo em Pacote de Venda!');
  end;
  Entidade.Deletarauto;
end;

procedure TfCadSubGrupo.SB_SalvaCabClick(Sender: TObject);
begin
  if edtBaseChave.Text <> '' then
  Begin
    if not (edtBaseChave.Text[1] in ['0','1','2','3','4','5','6','7','8','9']) then
      Raise exception.Create('Base inválida!');
    if not (edtBaseChave.Text[Length(edtBaseChave.Text)] in ['0','1','2','3','4','5','6','7','8','9']) then
      Raise exception.Create('Base inválida!');
  end;

  If Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(1, False);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadSubGrupo.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;  
end;

procedure TfCadSubGrupo.FormCreate(Sender: TObject);
begin
  Entidade:=SubGrupo1;
  Grupo1.Active:=True;
  dblCodigoGRP.KeyValue:=Grupo1.CodigoGRP;
  dblCodigoGRPClick(sender);
end;

procedure TfCadSubGrupo.cmbCampoEnter(Sender: TObject);
begin
  cmbCampo.Text:='';
end;

procedure TfCadSubGrupo.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadSubGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Grupo1.Active:=False;
  Action:=Cafree;
end;

procedure TfCadSubGrupo.SubGrupo1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadSubGrupo.dblCodigoGRPClick(Sender: TObject);
begin
  Entidade.close;
  Entidade.ParamByName('GRP_CODIGO').AsInteger:=Grupo1.fieldByName('GRP_CODIGO').AsInteger;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadSubGrupo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadSubGrupo.FecharCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfCadSubGrupo.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if not (DM.Configuracao1.Empresa in [4,7]) then
  Begin
    labDescBase.Visible := False;
    edtBaseChave.Visible := False;
    labDescEixos.Visible := False;
    edtEixos.Visible := False;
    Label6.Visible := False;
    edtFamilia.Visible := False;
    lblIndiceRefracao.Visible := False;
    edtIndiceRefracao.Visible := False;
    SB_AtualizaBaseReal.Visible := False;
    ckbFabricar.Visible := False;
    ckbPrecoDolar.Visible := False;
  end;
  if DM.Configuracao1.Empresa <> empLBM then 
  Begin
    SB_GerarSubGrupo.Visible := False;
  end;
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
end;

procedure TfCadSubGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=#27 then //Esc
  Begin
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if key=#13 then //Enter
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
  end
  else if (Key = '"') then
    Key := #0;  
end;

procedure TfCadSubGrupo.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  FecharCab.Enabled     := not Habilitar;
  IncluirCab.Enabled    := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  ExcluirCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarCab.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_ExcCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);

  SB_AtualizaBaseReal.Enabled := not Habilitar;
  SB_GerarSubGrupo.Enabled    := not Habilitar;

  if Grupo1.Servico and
     Habilitar then
    ckbServicoObrigatorio.Enabled := True
  else
    ckbServicoObrigatorio.Enabled := False;

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

procedure TfCadSubGrupo.SB_AtualizaBaseRealClick(Sender: TObject);
var
  i,j: integer;
  sBase: string;
  sBaseChave: array of vetorBaseReal;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o SubGrupo!');

  SetLength(sBaseChave, 1);
  j := 0;
  if Trim(Entidade.BaseChave) <> '' then
  Begin
    for i:=1 to Length(Entidade.BaseChave) do
      if SubGrupo1.BaseChave[i] <> ';' then
      Begin
        sBaseChave[j][1] := sBaseChave[j][1] + Entidade.BaseChave[i];
        sBaseChave[j][2] := sBaseChave[j][2] + Entidade.BaseChave[i];
      end
      else
      Begin
        SetLength(sBaseChave, High(sBaseChave)+2);
        inc(j);
        sBaseChave[j][1] := '';
        sBaseChave[j][2] := '';
      end;
  end
  else
  Begin
    sBaseChave[0][1] := '';
    sBaseChave[0][2] := '';
  end;

  for i:=0 to High(sBaseChave) do
  Begin
    try
      sBase := sBaseChave[i][2];
      if Pos('.', sBase) > 0 then
        sBase[Pos('.', sBase)] := ',';
      sBaseChave[i][2] := format('%.2f',[
                          StrToFloat(InputBox('Definir Base Real', 'Base ('+sBaseChave[i][1]+'):', sBase))]);
    except
      ShowMessage('Base real inválida!');
      Exit;
    end;
  end;

  for i:=0 to High(sBaseChave) do
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
      ' PRD_BASE_REAL='+VirgPonto(sBaseChave[i][2])+
      ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE SGP_CODIGO='+IntToStr(Entidade.CodigoSGP)+
      ' AND PRD_DESCRICAO LIKE "% BASE '+sBaseChave[i][1]+' %"');
  end;
end;

procedure TfCadSubGrupo.SB_GerarSubGrupoClick(Sender: TObject);
var
  CdGRP, CdSGP: integer;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o SubGrupo!');

  If MessageDlg('Deseja criar esse SubGrupo para todos os Grupos?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdSGP := Entidade.CodigoSGP;

  with Grupo2 do
  Begin
    Close;
    Open;
    while not Eof do
    Begin
      CdGRP := CodigoGRP;
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT SGP_CODIGO '+
          ' FROM SUBGRUPO '+
          ' WHERE GRP_CODIGO='+IntToStr(CdGRP)+
          ' AND SGP_CODIGO='+IntToStr(CdSGP);
        Open;
        if IsEmpty then
          if not Entidade.inserir(DM.Configuracao1.CodigoCNC,CdSGP,CdGRP,
              Entidade.Descricao,Entidade.OBS,Entidade.BaseChave,Entidade.Familia) then
            Raise exception.Create('Falha ao Cadastrar SubGrupo!');
      end;
      Next;
    end;
    ShowMessage('Processo Concluído!');
  end;
  Entidade.CarregaDados;
end;

end.
