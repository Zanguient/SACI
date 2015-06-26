unit CdGrau;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, DBCtrls, Menus, Variants, Grau, SubGrupo, Grupo;

type
  TfCadGrau = class(TForm)
    Panel14: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    edtGrau: TEdit;
    edtCodigoGRA: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Grupo1: TGrupo;
    DSGrupo1: TDataSource;
    Panel2: TPanel;
    dblCodigoGRP: TDBLookupComboBox;
    Label4: TLabel;
    Panel1: TPanel;
    SB_ExcPed: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Principal1: TMenuItem;
    IncluirPed: TMenuItem;
    AlterarPed: TMenuItem;
    ExcluirPed: TMenuItem;
    N1: TMenuItem;
    SalvarPed: TMenuItem;
    CancelarPed: TMenuItem;
    N2: TMenuItem;
    LocalizarPed: TMenuItem;
    Label7: TLabel;
    ckbCH: TCheckBox;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    Label27: TLabel;
    Label6: TLabel;
    cmbSituacao: TComboBox;
    Label12: TLabel;
    DBGrid5: TDBGrid;
    DSGrau1: TDataSource;
    SB_LocPed: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    dblCodigoSGP: TDBLookupComboBox;
    Grau1: TGrau;
    memOBS: TMemo;
    ckbDefinirOlho: TCheckBox;
    Grau1GRA_SITUACAO: TIntegerField;
    Grau1GRA_CODIGO: TIntegerField;
    Grau1GRA_DT_CADASTRO: TDateTimeField;
    Grau1GRA_DT_ALTERADO: TDateTimeField;
    Grau1GRA_CH: TIntegerField;
    Grau1GRA_OBSERVACAO: TStringField;
    Grau1CNC_CODIGO: TIntegerField;
    Grau1USU_CODIGO: TIntegerField;
    Grau1GRP_CODIGO: TIntegerField;
    Grau1SGP_CODIGO: TIntegerField;
    Grau1GRA_DEFINIR_OLHO: TIntegerField;
    SB_Copiar: TSpeedButton;
    ckbBase: TCheckBox;
    Grau1GRA_BASE: TIntegerField;
    ckbCB: TCheckBox;
    Grau1GRA_CB: TIntegerField;
    Grau1GRA_GRAU: TStringField;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_ExcPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblCodigoSGPClick(Sender: TObject);
    procedure Grau1AfterScroll(DataSet: TDataSet);
    procedure SB_CopiarClick(Sender: TObject);
    procedure ckbBaseClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade : TGrau;
  end;

var
  fCadGrau: TfCadGrau;
  iGrupo, iSubGrupo, iCH, iDefinirOlho : Integer;

implementation
Uses UDM,funcoes, UGrau;
{$R *.DFM}



procedure TfCadGrau.SB_PrimClick(Sender: TObject);
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

procedure TfCadGrau.SB_AntClick(Sender: TObject);
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

procedure TfCadGrau.SB_ProxClick(Sender: TObject);
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

procedure TfCadGrau.SB_UltClick(Sender: TObject);
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

procedure TfCadGrau.SB_NovoPedClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
//  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1830)) < 0 then
//    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if dblCodigoGRP.Text = '' then
    Raise Exception.Create('Selecione o Grupo!');
  if dblCodigoSGP.Text = '' then
    Raise Exception.Create('Selecione o SubGrupo!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  edtGrau.SetFocus;
end;

procedure TfCadGrau.SB_AltPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
//  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1850)) < 0 then
//    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  edtGrau.SetFocus;
end;

procedure TfCadGrau.SB_ExcPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
//  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1840)) < 0 then
//    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.Deletarauto;
end;

procedure TfCadGrau.SB_SalvaPedClick(Sender: TObject);
var
  iBase, iCH, iCB, iDefinirOlho:Integer;
begin
  if (Trim(SubGrupo1.BaseChave) <> '') then
    if (not ckbBase.Checked) and (not ckbCH.Checked) and (not ckbCB.Checked) then
      Raise exception.Create('Esse subgrupo possui base ou chave!');
  if not entidade.Copiando then
    If Entidade.FinalizaEdicao then
      AtualizaControles(1,False)
    else
      ShowMessage('As alterações não foram salvas!')
  else
  begin
    if (dblCodigoGRP.KeyValue=iGrupo) and (dblCodigoSGP.KeyValue=iSubGrupo) then
      raise Exception.Create('Impossível copiar dele para ele mesmo!')
    else
    begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT TOP 1 GRA_CODIGO '+
          ' FROM GRAU '+
          ' WHERE SGP_CODIGO='+IntToStr(dblCodigoSGP.KeyValue);
        Open;
        if not IsEmpty then
          Raise exception.Create('Esse SubGrupo já possui graus cadastrados!');
      end;
      Entidade.First;
      while not entidade.Eof do
      begin

        if Entidade.Base then
          iBase:=1
        else
          iBase:=0;

        if Entidade.CH then
          iCH:=1
        else
          iCH:=0;

        if Entidade.CB then
          iCB:=1
        else
          iCB:=0;

        if Entidade.DefinirOlho then
          iDefinirOlho:=1
        else
          iDefinirOlho:=0;

        ExecutaSQL(DM.QR_Comandos,'INSERT INTO GRAU '+
          ' (CNC_CODIGO,GRA_CODIGO,USU_CODIGO,GRP_CODIGO,SGP_CODIGO, '+
          ' GRA_DT_CADASTRO,GRA_GRAU,GRA_BASE,GRA_CH,GRA_CB,GRA_SITUACAO, '+
          ' GRA_OBSERVACAO,GRA_DEFINIR_OLHO) VALUES '+
          '( '+IntToStr(Entidade.CodigoCNC)+
          ', '+IntToStr(DM.Configuracao1.ProximoCodigo('GRA_CODIGO'))+
          ', '+IntToStr(Entidade.CodigoUSU)+
          ', '+IntToStr(dblCodigoGRP.KeyValue)+
          ', '+IntToStr(dblCodigoSGP.KeyValue)+
          ',"'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',"'+Entidade.Grau+'" '+
          ', '+IntToStr(iBase)+
          ', '+IntToStr(iCH)+
          ', '+IntToStr(iCB)+
          ', '+IntToStr(Entidade.Situacao)+
          ',"'+Entidade.OBS+'" '+
          ', '+IntToStr(iDefinirOlho)+')');
        Entidade.Next;
      end;
    end;
    AtualizaControles(1,False);
    Showmessage('Cópia efetuada com sucesso!');
    entidade.copiando:=false;
    dblCodigoSGPClick(sender);    
  end;
end;

procedure TfCadGrau.SB_CancPedClick(Sender: TObject);
begin
  if not Entidade.Copiando then
  begin
    Entidade.CancelaEdicao;
    AtualizaControles(1,False);
    if Entidade.IsEmpty then
      Entidade.LimpaCampos;
    edtLocalizar.SetFocus;
  end
  else
  begin
    AtualizaControles(1,False);
    Showmessage('Cópia NÃO efetuada!');
    Entidade.Copiando:=false;
    dblCodigoSGPClick(sender);
  end;
end;

procedure TfCadGrau.FormCreate(Sender: TObject);
begin
  Entidade:=Grau1;
  Grupo1.Active:=True;
  dblCodigoGRP.KeyValue:=Grupo1.CodigoGRP;
  dblCodigoGRPClick(sender);
end;

procedure TfCadGrau.SB_LocPedClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadGrau.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Grupo1.Active:=False;
  Action:=Cafree;
end;

procedure TfCadGrau.dblCodigoGRPClick(Sender: TObject);
begin
  with SubGrupo1 do
  begin
    close;
    SQL.Text:='SELECT * FROM SUBGRUPO '+
      ' WHERE GRP_CODIGO = '+ inttostr(dblCodigoGRP.KeyValue)+
      ' ORDER BY SGP_DESCRICAO ';
    open;
  end;
  dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
  dblCodigoSGPClick(sender);
end;

procedure TfCadGrau.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaPed.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadGrau.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfCadGrau.FormShow(Sender: TObject);
begin
//  DM.Usuario1.ConfiguraTela(self);
  DM.Usuario1.AlteraCorComponentes(self);
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
end;

procedure TfCadGrau.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  Begin
    key:=chr(0);
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else
      Close;
  end
  else if key = #13 then
  Begin
    key:=chr(0);
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end;
  end
  else if key=',' then
    key:='.'
  else if (Key = '"') then
    Key := #0;    
end;

procedure TfCadGrau.dblCodigoSGPClick(Sender: TObject);
begin
  if not Entidade.Copiando then
  begin
    Entidade.close;
    Entidade.ParamByName('GRP_CODIGO').AsInteger:=Grupo1.fieldByName('GRP_CODIGO').AsInteger;
    Entidade.ParamByName('SGP_CODIGO').AsInteger:=SubGrupo1.fieldByName('SGP_CODIGO').AsInteger;
    Entidade.Open;
    if Entidade.IsEmpty then
      Entidade.LimpaCampos;
  end;
end;

procedure TfCadGrau.Grau1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadGrau.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirPed.Enabled    := not Habilitar;
  AlterarPed.Enabled    := not Habilitar;
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
  SB_AltPed.Enabled     := not Habilitar;
  SB_ExcPed.Enabled     := not Habilitar;
  SB_SalvaPed.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled    := ((Cabecalho=1) and Habilitar);
  SB_Copiar.Enabled     := not Habilitar;

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

  if not Entidade.copiando then
  begin
    dblCodigoGRP.Enabled := not Habilitar;
    dblCodigoSGP.Enabled := not Habilitar;
  end;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfCadGrau.SB_CopiarClick(Sender: TObject);
begin
  Entidade.Copiando:=true;
  AtualizaControles(1,True);
  iGrupo:=dblCodigoGRP.KeyValue;
  iSubGrupo:=dblCodigoSGP.KeyValue;
  Showmessage('Escolha um SubGrupo e confirne a cópia!');
end;

procedure TfCadGrau.ckbBaseClick(Sender: TObject);
begin
  if ckbBase.Checked then
  Begin
    ckbCH.Checked := False;
    ckbCB.Checked := False;
  end
  else if ckbCH.Checked then
  Begin
    ckbBase.Checked := False;
    ckbCB.Checked := False;
  end
  else if ckbCB.Checked then
  Begin
    ckbBase.Checked := False;
    ckbCH.Checked := False;
  end;
end;

end.
