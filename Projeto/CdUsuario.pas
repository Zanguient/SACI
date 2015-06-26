unit CdUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Usuario, Funcionario, Menus, CentroCusto, DateUtils,
  ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, ActnMenus,
  ImgList;

type
  TfCadUsuario = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    edtCodigoUSU: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    edtSenha: TEdit;
    memOBS: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    ckbPerfil: TCheckBox;
    DSUsuario: TDataSource;
    Usuario1: TUsuario;
    DSCentroCusto1: TDataSource;
    cmbSituacao: TComboBox;
    Label5: TLabel;
    Label7: TLabel;
    Label32: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    Label57: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    CentroCusto1: TCentroCusto;
    Label13: TLabel;
    mskFone: TMaskEdit;
    SB_Imprimir: TSpeedButton;
    ckbTodosCentros: TCheckBox;
    Panel2: TPanel;
    Label44: TLabel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    dblCentro: TDBLookupComboBox;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    ActionManager1: TActionManager;
    Sair1: TAction;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Usuario1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Usuario1BeforeOpen(DataSet: TDataSet);
    procedure dblCentroClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure AtualizaControles(Habilitar:Boolean);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Sair1Click(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
  private

  public
    { Public declarations }
    Entidade:TUsuario;
  end;

var
  fCadUsuario: TfCadUsuario;

implementation

Uses UDM,funcoes, MxFotoAmpliada, UEtiquetaUsuario;

{$R *.DFM}

procedure TfCadUsuario.AtualizaControles(Habilitar:Boolean);
begin
  dblCentro.Enabled:=not Habilitar;
  BitBtn1.Enabled:=not Habilitar;
  Incluir1.Enabled:=not Habilitar;
  Alterar1.Enabled:=not Habilitar;
  Excluir1.Enabled:=not Habilitar;
  Localizar1.Enabled:=not Habilitar;
  Salvar1.Enabled:=Habilitar;
  Cancelar1.Enabled:=Habilitar;
  SB_Prim.Enabled:=not Habilitar;
  SB_Ant.Enabled:=not Habilitar;
  SB_Prox.Enabled:=not Habilitar;
  SB_Ult.Enabled:=not Habilitar;
  SB_Novo.Enabled:=not Habilitar;
  SB_Loc.Enabled:=not Habilitar;
  SB_Alt.Enabled:=not Habilitar;
  SB_Exc.Enabled:=not Habilitar;
  SB_Salva.Enabled:=Habilitar;
  SB_Canc.Enabled:=Habilitar;
  Edit11.Enabled:=not Habilitar;
  ComboBox2.Enabled:=not Habilitar;

  if Habilitar then
  begin
    Edit11.Color:=AlteraCorComponentes;
    ComboBox2.Color:=AlteraCorComponentes;
  end
  else
  begin
    Edit11.Color:=clWindow;
    ComboBox2.Color:=clWindow;
  end;
end;

procedure TfCadUsuario.SB_PrimClick(Sender: TObject);
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

procedure TfCadUsuario.SB_AntClick(Sender: TObject);
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

procedure TfCadUsuario.SB_ProxClick(Sender: TObject);
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

procedure TfCadUsuario.SB_UltClick(Sender: TObject);
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

procedure TfCadUsuario.SB_NovoClick(Sender: TObject);
begin
  if (DM.Configuracao1.CodigoCNC  <> DM.Usuario1.CentroDeCusto) then
    Raise Exception.Create('Não é possível inserir registros de outro Centro de Custo!');
  if (not DM.Configuracao1.CPD) then
    Raise Exception.Create('Somente no CPD!');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1780)) < 0) then
    Raise exception.Create('Usuário não tem permissão para inserir Usuário!');

  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtNome.SetFocus;
end;

procedure TfCadUsuario.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (DM.Configuracao1.CodigoCNC  <> DM.Usuario1.CentroDeCusto) then
    Raise Exception.Create('Não é possível alterar registros de outro Centro de Custo!');
  if (not DM.Configuracao1.CPD) then
    Raise Exception.Create('Somente no CPD!');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1800)) < 0) then
    Raise exception.Create('Usuário não tem permissão para alterar Usuário!');

  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtNome.SetFocus;
end;

procedure TfCadUsuario.SB_ExcClick(Sender: TObject);
var
  CNC, USU:integer;
  sCNC: String;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (DM.Configuracao1.CodigoCNC  <> DM.Usuario1.CentroDeCusto) then
    Raise Exception.Create('Não é possível excluir registros de outro Centro de Custo!');
  if (not DM.Configuracao1.CPD) then
    Raise Exception.Create('Somente no CPD!');

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1790)) < 0) then
    Raise exception.Create('Usuário não tem permissão para excluir Usuário!');

  CNC := Entidade.CodigoCNC;
  USU := Entidade.CodigoUSU;

  if DM.Configuracao1.Empresa = empEletro then
    sCNC :=  ' AND CNC_CODIGO='+IntToStr(CNC)
  else
    sCNC := '';

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT LOG_CODIGO FROM LOG '+
      ' WHERE USU_CODIGO='+IntToStr(USU)+
      sCNC;
    Open;
    if not isEmpty then
      Raise exception.Create('Existem LOGs desse usuário!');
  end;

  if Entidade.deletarauto then
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM PERMISSAO '+
      ' WHERE USU_CODIGO='+IntToStr(USU)+
      sCNC);
end;

procedure TfCadUsuario.SB_SalvaClick(Sender: TObject);
begin
  edtNome.Text  := Trim(edtNome.Text);
  edtSenha.Text := Trim(edtSenha.Text);
  if Entidade.FinalizaEdicao then
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadUsuario.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfCadUsuario.FormCreate(Sender: TObject);
begin
  Entidade:=Usuario1;
  CentroCusto1.Active:=true;
  dblCentro.KeyValue:=DM.Configuracao1.CodigoCNC;
  Entidade.Active:=true;
end;

procedure TfCadUsuario.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfCadUsuario.SB_LocClick(Sender: TObject);
begin
 If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');
 Entidade.Localizar;
end;

procedure TfCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  CentroCusto1.Active:=false;
  Action:=Cafree;
end;

procedure TfCadUsuario.Usuario1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadUsuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadUsuario.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ComboBox2.ItemIndex:=1;
  Edit11.SetFocus;
end;

procedure TfCadUsuario.BitBtn1Click(Sender: TObject);
var
  CdCNC,CdUSU:integer;
  Trans: Boolean;
begin
  if (DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto) then
    Raise Exception.Create('Não é possível alterar registros de outro Centro de Custo!');
  if Entidade.CodigoUSU = DM.Configuracao1.CodigoUSU then
    Raise Exception.Create('Não é possível liberar esse usuário!');
  if Entidade.Situacao <> 2 then
    Raise Exception.Create('Esse usuário não está bloqueado!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8400)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para Desbloquear Usuário!');

  CdCNC:=Entidade.CodigoCNC;
  CdUSU:=Entidade.CodigoUSU;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      ExecutaSQL(DM.QR_Comandos,'UPDATE USUARIO SET '+
        ' USU_SITUACAO=0 '+
        ',USU_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND USU_CODIGO='+IntToStr(CdUSU));

      if not Entidade.GeraLog(8400, CdCNC, CdUSU, 'Usuário:'+Entidade.NomeUSU) then
      Begin
        ShowMessage('Falha ao gerar Log!');
        Raise exception.Create('');
      end;

      Commit;
      Trans := False;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  End;

  Entidade.Close;
  Entidade.Open;
  Entidade.LocalizarCod(CdUSU);
  Entidade.CarregaDados;
end;

procedure TfCadUsuario.Usuario1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger:=dblCentro.KeyValue;
end;

procedure TfCadUsuario.dblCentroClick(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadUsuario.Image1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=Image1.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Usuário: '+Usuario1.NomeUSU);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Máquina: '+IntToStr(Usuario1.MaquinaLogado));
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Usuario1.OBS);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfCadUsuario.SB_ImprimirClick(Sender: TObject);
var
  iMargemTOP, iMargemLeft, iTamanhoFonte, CdCNC, CdUSU: Integer;
  sNomeSenhaEncrypt: string;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o usuário!');
  if Length(Entidade.NomeUSU) > 17 then
    Raise exception.Create('Nome do usuário maior que 18 caracteres!');
  CdCNC := Entidade.CodigoCNC;
  CdUSU := Entidade.CodigoUSU;
  sNomeSenhaEncrypt := EncryptaDadosCartao(Entidade.NomeUSU , Entidade.Senha);
  if sNomeSenhaEncrypt = '' then
    Exit;

  try
    iMargemTOP  := StrToInt(InputBox('Margens da Etiqueta', 'Superior:', '20'));
  except
    ShowMessage('Margem Superior inválida!');
    Exit;
  end;
  try
    iMargemLeft := StrToInt(InputBox('Margens da Etiqueta', 'Esquerda:', '20'));
  except
    ShowMessage('Margem Esquerda inválida!');
    Exit;
  end;
  try
    iTamanhoFonte := StrToInt(InputBox('Fonte da Etiqueta', 'Tamanho:', '18'));
  except
    ShowMessage('Tamanho da Fonte inválido!');
    Exit;
  end;

  if not Entidade.GeraLog(6950, CdCNC, CdUSU, 'Usuário:'+Entidade.NomeUSU) then
  Begin
    ShowMessage('Falha ao gerar Log!');
    Raise exception.Create('');
  end;

  Application.CreateForm(Trpt_EtiquetaUsuario, rpt_EtiquetaUsuario);
  with rpt_EtiquetaUsuario do
  begin
    zrlCodigoBarras.Top  := iMargemTOP;
    zrlCodigoBarras.Left := iMargemLeft;
    zrlCodigoBarras.Font.Size := iTamanhoFonte;
    zrlCodigoBarras.Font.Name := 'Abri Barcode39';
    zrlCodigoBarras.Caption := sNomeSenhaEncrypt;
    try
      report.Preview;
    except
      ShowMessage('Falha na Impressão!');
    end;
  end;
end;

procedure TfCadUsuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  Begin
    key:=#0;
    if (SB_Canc.Enabled) then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end
  else if Key=chr(13) then
  Begin
    if SB_Salva.Enabled then
    Begin
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
    end;
  end
  else if (Key = '"') then
    Key := #0;
end;

procedure TfCadUsuario.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCadUsuario.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
