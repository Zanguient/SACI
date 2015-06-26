unit CdContato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Contato, Menus, DBCtrls, Parametro;

type
  TFCadCont = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    edtCodigoCNT: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    mskTel: TMaskEdit;
    Label13: TLabel;
    Label12: TLabel;
    memOBS: TMemo;
    Label15: TLabel;
    Label5: TLabel;
    mskFAX: TMaskEdit;
    Label6: TLabel;
    edtCargo: TEdit;
    cmbSituacao: TComboBox;
    DSContato1: TDataSource;
    Contato1: TContato;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Contatos1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Panel2: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    edtNome: TEdit;
    mskDataNasc: TMaskEdit;
    Label8: TLabel;
    mskCelular: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtEmail: TEdit;
    Label11: TLabel;
    mskDataCadastro: TMaskEdit;
    Contato1CNT_CODIGO: TIntegerField;
    Contato1CNC_CODIGO: TIntegerField;
    Contato1CNT_NOME: TStringField;
    Contato1FOR_CODIGO: TIntegerField;
    Contato1CNT_TELEFONE: TStringField;
    Contato1CNT_FAX: TStringField;
    Contato1CNT_SITUACAO: TIntegerField;
    Contato1CNT_CARGO: TStringField;
    Contato1CNT_CELULAR: TStringField;
    Contato1CNT_DT_NASCIMENTO: TDateTimeField;
    Contato1USU_CODIGO: TIntegerField;
    Contato1CNT_DT_ALTERADO: TDateTimeField;
    Contato1CNT_OBSERVACAO: TStringField;
    Contato1CNT_DT_CADASTRO: TDateTimeField;
    Contato1CNT_EMAIL: TStringField;
    labTituloContato: TLabel;
    Label7: TLabel;
    edtCodigoFOR: TEdit;
    edtRazaoSocial: TEdit;
    Label14: TLabel;
    Label16: TLabel;
    edtFORCNC: TEdit;
    Contato1CNT_TIPO: TIntegerField;
    Contato1CNC_FOR: TIntegerField;
    Contato1CNT_LOGRADOURO: TIntegerField;
    Contato1CNT_ENDERECO: TStringField;
    Contato1CNT_BAIRRO: TStringField;
    Contato1CNT_CIDADE: TStringField;
    Contato1CNT_UF: TStringField;
    Contato1CNT_CEP: TStringField;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    cmbUF: TComboBox;
    dblLogradouro: TDBLookupComboBox;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtEndereco: TEdit;
    Label22: TLabel;
    mskCEP: TMaskEdit;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    bitConfirmar: TBitBtn;
    Label23: TLabel;
    mskDataAlterado: TMaskEdit;
    Bevel1: TBevel;
    Label29: TLabel;
    imgFotoContato: TImage;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Contato1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Contato1BeforeOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bitConfirmarClick(Sender: TObject);
    procedure imgFotoContatoDblClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    iTipo: integer;
    Entidade:TContato;
  end;

var
  FCadCont: TFCadCont;

implementation

Uses UDM, Funcoes, MxServicoLBM, MxFotoAmpliada, CdComunicacao;

{$R *.DFM}

procedure TFCadCont.AtualizaControles(Habilitar: Boolean);
begin
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
  SB_Loc.Enabled:=not Habilitar;
  SB_Novo.Enabled:=not Habilitar;
  SB_Alt.Enabled:=not Habilitar;
  SB_Exc.Enabled:=not Habilitar;
  SB_Salva.Enabled:=Habilitar;
  SB_Canc.Enabled:=Habilitar;
  edtLocalizar.Enabled:=not Habilitar;
  cmbCampo.Enabled:=not Habilitar;
  DBGrid5.Enabled:=not Habilitar;

  if bitConfirmar.Visible then
    bitConfirmar.Enabled:=not Habilitar;

  if Habilitar then
  begin
    edtLocalizar.Color:=AlteraCorComponentes;
    cmbCampo.Color:=AlteraCorComponentes;
  end
  else
  begin
    edtLocalizar.Color:=clWindow;
    cmbCampo.Color:=clWindow;
  end;
end;

procedure TFCadCont.SB_PrimClick(Sender: TObject);
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

procedure TFCadCont.SB_AntClick(Sender: TObject);
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

procedure TFCadCont.SB_ProxClick(Sender: TObject);
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

procedure TFCadCont.SB_UltClick(Sender: TObject);
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




procedure TFCadCont.SB_NovoClick(Sender: TObject);
begin
  if (DM.Configuracao1.Empresa = empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  if not VerificaInteiroBranco(edtCodigoFOR.Text) then
    Raise Exception.Create('Selecione um Registro Principal (Cliente/Fornecedor)!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(580)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(True);
  edtNome.SetFocus;
end;

procedure TFCadCont.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (DM.Configuracao1.Empresa = empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(600)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtNome.SetFocus;
end;

procedure TFCadCont.SB_SalvaClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao(iTipo) then //(0-FOR; 1-CLI)
  Begin
    AtualizaControles(False);
    if tag = 3 then //ServicoLBM
      bitConfirmarClick(sender);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TFCadCont.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
  Begin
    edtCodigoCNT.Clear;
    cmbSituacao.ItemIndex := -1;
  end;
end;

procedure TFCadCont.SB_LocClick(Sender: TObject);
begin
  If cmbSituacao.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TFCadCont.SB_ExcClick(Sender: TObject);
var
  CdCNC, CdCNT: integer;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!')
  else if (DM.Configuracao1.Empresa = empMotical) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!')
  else If DM.Usuario1.Permissoes.IndexOf(IntToStr(590)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  CdCNC := Entidade.CodigoCNC;
  CdCNT := Entidade.CodigoCNT;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CLIENTE='+IntToStr(CdCNC)+
      ' AND CNT_CODIGO='+IntToStr(CdCNT);
    Open;
    if not IsEmpty then
      Raise exception.Create('Contato com Pedido de Venda');
  end;
  
  Entidade.deletarauto;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TFCadCont.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_CONTATO_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TFCadCont.Contato1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TFCadCont.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TFCadCont.FormCreate(Sender: TObject);
begin
  iTipo := 0;
  Entidade := Contato1;
  Parametro1.Open;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_CONTATO_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TFCadCont.Sair1Click(Sender: TObject);
begin
  FCadCont.Close;
end;

procedure TFCadCont.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if tag < 2 then
    bitConfirmar.Visible := False;

  Case Tag of
    0: Begin
         labTituloContato.Caption := 'Registro Principal - Fornecedor';
         iTipo := 0;
       end;
    1: Begin
         labTituloContato.Caption := 'Registro Principal - Cliente';
         iTipo := 1;
       end;
    2: Begin
         labTituloContato.Caption := 'Registro Principal - Cliente';
         iTipo := 1;
       end;
    3: Begin //ServicoLBM
         labTituloContato.Caption := 'Registro Principal - Cliente';
         iTipo := 1;
       end;
    4: Begin //Comunicacao
         labTituloContato.Caption := 'Registro Principal';
//         iTipo := 1; o Tipo já foi definido na Tela de fCadComunicacao
       end;
  end;
  Entidade.Open;
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
  if tag = 3 then //ServicoLBM
  Begin
    if Entidade.IsEmpty then
      SB_NovoClick(sender);
  end;
end;

procedure TFCadCont.Contato1BeforeOpen(DataSet: TDataSet);
begin
  try
    if VerificaInteiroBranco(edtCodigoFOR.text) then
    Begin
      Entidade.ParamByName('CNC_FOR').asInteger := StrToInt(edtFORCNC.Text);
      Entidade.ParamByName('FOR_CODIGO').asInteger := StrToInt(edtCodigoFOR.Text);
    end
    else
      Entidade.ParamByName('FOR_CODIGO').asInteger := -1;
    Entidade.ParamByName('CNT_TIPO').asInteger := iTipo; //0-FOR; 1-CLI
  except
  end;
end;

procedure TFCadCont.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end
  else If key=chr(13) then
  Begin
    if SB_Salva.Enabled then
    Begin
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
    end
    else if bitConfirmar.Visible then
    Begin
      bitConfirmar.SetFocus;
      bitConfirmarClick(sender);
    end;
  end;
end;

procedure TFCadCont.bitConfirmarClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o cliente!');
  if self.tag = 3 then //ServiçoLBM
  Begin
    fMxServicoLBM.edtCodigoCNT.Text := IntToStr(Entidade.CodigoCNT);
    fMxServicoLBM.edtNomeContato.Text := Entidade.Nome;
  end
  else if self.Tag = 4 then
  Begin
    fCadComunicacao.edtCodigoCNT.Text := IntToStr(Entidade.CodigoCNT);
    fCadComunicacao.edtContato.Text   := Entidade.Nome;
  end;
  Close;
end;

procedure TFCadCont.imgFotoContatoDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgFotoContato.Picture;
  if Entidade.DTNascimento > 0 then
    fMxFotoAmpliada.memRodapeFoto.Lines.Add('Data Nascimento: '+DateToStr(Entidade.DTNascimento));
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Endereço: '+Entidade.Endereco+' - '+
    Entidade.Bairro+' - '+Entidade.Cidade+'/'+Entidade.Uf);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Entidade.OBS);
  fMxFotoAmpliada.ShowModal;
end;

end.
