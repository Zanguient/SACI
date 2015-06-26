unit MxCentralMensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, CentroCusto, DBCtrls, Parametro, ComCtrls, Menus, Mensagem,
  Usuario, ImgList, MMSystem;

type
  TfMxCentralMensagem = class(TForm)
    PageControl1: TPageControl;
    tbsEnviar: TTabSheet;
    tbsReceber: TTabSheet;
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel1: TPanel;
    SB_Loc: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    cmbCampoEnviar: TComboBox;
    Panel13: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtCodigoMSGenv: TEdit;
    edtAssuntoEnv: TEdit;
    Memo1: TMemo;
    ckbPublicaEnv: TCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtCodigoMSGrec: TEdit;
    edtAssuntoRec: TEdit;
    Memo2: TMemo;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    SB_Ult2: TSpeedButton;
    SB_Prox2: TSpeedButton;
    SB_Ant2: TSpeedButton;
    SB_Prim2: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    edtLocalizarReceber: TEdit;
    cmbCampoReceber: TComboBox;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    edtLocalizarEnviar: TEdit;
    Label12: TLabel;
    DSMensagem1: TDataSource;
    DSMensagem2: TDataSource;
    mskDataEnviada: TMaskEdit;
    mskDataRecebimento: TMaskEdit;
    CentroCusto1: TCentroCusto;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    cmbSituacaoEnv: TComboBox;
    cmbSituacaoRec: TComboBox;
    Mensagem1: TMensagem;
    Mensagem2: TMensagem;
    dblDestinatario: TDBLookupComboBox;
    dblDestinatarioCNC: TDBLookupComboBox;
    dblRemetenteCNC: TDBLookupComboBox;
    dblRemetente: TDBLookupComboBox;
    Usuario1: TUsuario;
    Usuario2: TUsuario;
    DSUsuario2: TDataSource;
    ckbUrgenteEnv: TCheckBox;
    ckbAvisarEnv: TCheckBox;
    Panel5: TPanel;
    SB_Imprimir: TSpeedButton;
    SB_Responder: TSpeedButton;
    SB_Lida: TSpeedButton;
    SB_ExcRec: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Panel6: TPanel;
    SB_Novo: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Enviar: TSpeedButton;
    SB_Reenviar: TSpeedButton;
    SpeedButton18: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    ImageList1: TImageList;
    ckbPublicaRec: TCheckBox;
    ckbUrgenteRec: TCheckBox;
    ckbAvisarRec: TCheckBox;
    Usuario3: TUsuario;
    Mensagem3: TMensagem;
    Usuario4: TUsuario;
    DSUsuario4: TDataSource;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Mensagem1AfterScroll(DataSet: TDataSet);
    procedure Mensagem2AfterScroll(DataSet: TDataSet);
    procedure Mensagem1BeforeOpen(DataSet: TDataSet);
    procedure Mensagem2BeforeOpen(DataSet: TDataSet);
    procedure cmbSituacaoEnvChange(Sender: TObject);
    procedure cmbSituacaoRecChange(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_Prim2Click(Sender: TObject);
    procedure SB_Ant2Click(Sender: TObject);
    procedure SB_Prox2Click(Sender: TObject);
    procedure SB_Ult2Click(Sender: TObject);
    procedure SB_EnviarClick(Sender: TObject);
    procedure SB_ReenviarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SB_ResponderClick(Sender: TObject);
    procedure SB_LidaClick(Sender: TObject);
    procedure SB_ExcRecClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure Usuario3BeforeOpen(DataSet: TDataSet);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Fechar1Click(Sender: TObject);
    procedure dblDestinatarioCNCClick(Sender: TObject);
    procedure Usuario4BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade1, Entidade2 : TMensagem;
    RetornoMensagem : string;
  end;

var
  fMxCentralMensagem: TfMxCentralMensagem;

implementation
Uses UDM,funcoes, MxMensagem;
{$R *.DFM}



procedure TfMxCentralMensagem.SB_PrimClick(Sender: TObject);
begin
 if Entidade1.IsEmpty then
   abort;
 If Entidade1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade1.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Entidade1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxCentralMensagem.SB_AntClick(Sender: TObject);
begin
 if Entidade1.IsEmpty then
   abort;
 If Entidade1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade1.Prior;
    If Entidade1.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not Entidade1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxCentralMensagem.SB_ProxClick(Sender: TObject);
begin
  if Entidade1.IsEmpty then
   abort;
  If Entidade1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade1.Next;
    If Entidade1.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Entidade1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxCentralMensagem.SB_UltClick(Sender: TObject);
begin
  if Entidade1.IsEmpty then
   abort;
  If Entidade1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade1.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Entidade1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxCentralMensagem.SB_SalvaClick(Sender: TObject);
var
  NovaMensagem : string;
begin
  if RetornoMensagem <> '' then
  Begin
    NovaMensagem := Memo1.Text;
    Memo1.Lines.Text := NovaMensagem + #13 + RetornoMensagem;
  end;
  if Entidade1.FinalizaEdicao then
  Begin
    SB_Prim.Enabled:=True;
    SB_Ant.Enabled:=True;
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
    SB_Novo.Enabled:=True;
    SB_Loc.Enabled:=True;
    SB_Alt.Enabled:=True;
    SB_Exc.Enabled:=True;
    SB_Enviar.Enabled:=True;
//    SB_Reenviar.Enabled:=True;
    SB_Salva.Enabled:=False;
    SB_Canc.Enabled:=False;
    edtLocalizarEnviar.Enabled:=True;
    edtLocalizarEnviar.Color:=clWindow;
    cmbSituacaoEnv.Enabled:=True;    
    cmbCampoEnviar.Enabled:=True;
    cmbCampoEnviar.Color:=clWindow;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxCentralMensagem.SB_CancClick(Sender: TObject);
begin
  Entidade1.CancelaEdicao;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Enviar.Enabled:=True;
  SB_Reenviar.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  edtLocalizarEnviar.Enabled:=True;
  edtLocalizarEnviar.Color:=clWindow;
  cmbSituacaoEnv.Enabled:=True;  
  cmbCampoEnviar.Enabled:=True;
  cmbCampoEnviar.Color:=clWindow;
  if Entidade1.IsEmpty then
  Begin
    edtCodigoMSGenv.Clear;
    mskDataEnviada.Clear;
    dblDestinatarioCNC.KeyValue:=-1;
    dblDestinatario.KeyValue:=-1;
  end;
end;

procedure TfMxCentralMensagem.FormCreate(Sender: TObject);
begin
  Entidade1:=Mensagem1;
  Entidade2:=Mensagem2;
end;

procedure TfMxCentralMensagem.SB_LocClick(Sender: TObject);
begin
  If cmbCampoEnviar.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizarEnviar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade1.Localizar;
end;


procedure TfMxCentralMensagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade1.Close;
  Entidade2.Close;
  Usuario1.Close;
  Usuario2.Close;
  Usuario4.Close;
  CentroCusto1.Close;
  CentroCusto2.Close;
  DM.tmrMensagem.Enabled := True; 
  Action:=Cafree;
end;

procedure TfMxCentralMensagem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxCentralMensagem.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  DM.tmrMensagem.Enabled := False;
  cmbSituacaoEnv.ItemIndex := 0;
  cmbSituacaoRec.ItemIndex := 0;
  CentroCusto2.Open;
  Usuario2.Open;
  Usuario4.Open;
  Entidade1.Open;
  Entidade2.Open;
  if Entidade2.IsEmpty then
    PageControl1.ActivePage := tbsEnviar
  else
  Begin
    PageControl1.ActivePage := tbsReceber;
    dblRemetente.KeyValue:=Entidade2.CodigoUSU;
  end;
  cmbCampoReceber.ItemIndex := 1;
  cmbCampoEnviar.ItemIndex := 1;
  if PageControl1.ActivePage = tbsEnviar then
    edtLocalizarEnviar.SetFocus
  else
    edtLocalizarReceber.SetFocus;
end;

procedure TfMxCentralMensagem.Mensagem1AfterScroll(DataSet: TDataSet);
begin
  Entidade1.CarregaDados;
  try
    Usuario4.Close;
    Usuario4.Open;
    dblRemetente.KeyValue := Entidade1.CodigoUSU;
  except
  end;
  if Entidade1.IsEmpty then
  Begin
    edtCodigoMSGenv.Clear;
    mskDataEnviada.Clear;
    dblDestinatarioCNC.KeyValue:=-1;
    dblDestinatario.KeyValue:=-1;
    edtAssuntoEnv.Clear;
    Memo1.Clear;
    ckbPublicaEnv.Checked:=False;
    ckbUrgenteEnv.Checked:=False;
    ckbAvisarEnv.Checked:=False;
  end;
end;

procedure TfMxCentralMensagem.Mensagem2AfterScroll(DataSet: TDataSet);
begin
  Entidade2.CarregaDados;
  try
    Usuario2.Close;
    Usuario2.Open;
    dblRemetente.KeyValue := Entidade2.CodigoUSU;
  except
  end;
  if Entidade2.IsEmpty then
  Begin
    edtCodigoMSGenv.Clear;
    mskDataEnviada.Clear;
    dblDestinatarioCNC.KeyValue:=-1;
    dblDestinatario.KeyValue:=-1;
    edtAssuntoEnv.Clear;
    Memo1.Clear;
    ckbPublicaEnv.Checked:=False;
    ckbUrgenteEnv.Checked:=False;
    ckbAvisarEnv.Checked:=False;
  end;
end;

procedure TfMxCentralMensagem.Mensagem1BeforeOpen(DataSet: TDataSet);
begin
  Entidade1.ParamByName('USU_CODIGO').asInteger:=DM.Configuracao1.CodigoUSU;
  Entidade1.ParamByName('SITUACAO').asInteger:=cmbSituacaoEnv.ItemIndex;
end;

procedure TfMxCentralMensagem.Mensagem2BeforeOpen(DataSet: TDataSet);
begin
  Entidade2.ParamByName('USU_CODIGO').asInteger:=DM.Configuracao1.CodigoUSU;
  Entidade2.ParamByName('SITUACAO').asInteger:=cmbSituacaoRec.ItemIndex;
end;

procedure TfMxCentralMensagem.cmbSituacaoEnvChange(Sender: TObject);
begin
  case cmbSituacaoEnv.ItemIndex of
    0 : Begin
          SB_Novo.Enabled := True;
          SB_Alt.Enabled := True;
          SB_Enviar.Enabled := True;
          SB_Reenviar.Enabled := False;
        end;
    else
    Begin
      SB_Novo.Enabled := False;
      SB_Alt.Enabled := False;
      SB_Enviar.Enabled := False;
      SB_Reenviar.Enabled := True;
    end;
  end;
  Entidade1.Close;
  Entidade1.Open;
  try
    Usuario2.Close;
    Usuario2.Open;
    dblRemetente.KeyValue := Entidade1.CodigoUSU;
  except
  end;
  if Entidade1.IsEmpty then
  Begin
    edtCodigoMSGenv.Clear;
    mskDataEnviada.Clear;
    dblDestinatarioCNC.KeyValue:=-1;
    dblDestinatario.KeyValue:=-1;
    edtAssuntoEnv.Clear;
    Memo1.Clear;
    ckbPublicaEnv.Checked:=False;
    ckbUrgenteEnv.Checked:=False;
    ckbAvisarEnv.Checked:=False;
  end;

end;

procedure TfMxCentralMensagem.cmbSituacaoRecChange(Sender: TObject);
begin
  if cmbSituacaoRec.ItemIndex = 0 then
    SB_Lida.Enabled := True
  else
    SB_Lida.Enabled := False;
  Entidade2.Close;
  Entidade2.Open;
  try
    Usuario2.Close;
    Usuario2.Open;
    dblRemetente.KeyValue := Entidade2.CodigoUSU;
  except
  end;
  if Entidade2.IsEmpty then
  Begin
    edtCodigoMSGrec.Clear;
    mskDataRecebimento.Clear;
    dblRemetenteCNC.KeyValue:=-1;
    dblRemetente.KeyValue:=-1;
    edtAssuntoRec.Clear;
    Memo2.Clear;
  end;
end;

procedure TfMxCentralMensagem.SB_NovoClick(Sender: TObject);
begin
  if Sender <> SB_Responder then
    RetornoMensagem := '';
  Entidade1.PreparaInsercao;

  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Enviar.Enabled:=False;
  SB_Reenviar.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  edtLocalizarEnviar.Enabled:=False;
  edtLocalizarEnviar.Color:=AlteraCorComponentes;
  cmbSituacaoEnv.Enabled:=False;  
  cmbCampoEnviar.Enabled:=False;
  cmbCampoEnviar.Color:=AlteraCorComponentes;
  dblDestinatarioCNCClick(Sender);
  dblDestinatarioCNC.SetFocus;
end;

procedure TfMxCentralMensagem.SB_AltClick(Sender: TObject);
begin
  if Entidade1.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  Entidade1.PreparaAlteracao;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Enviar.Enabled:=False;
  SB_Reenviar.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  edtLocalizarEnviar.Enabled:=False;
  edtLocalizarEnviar.Color:=AlteraCorComponentes;
  cmbSituacaoEnv.Enabled:=False;  
  cmbCampoEnviar.Enabled:=False;
  cmbCampoEnviar.Color:=AlteraCorComponentes;
//  dblDestinatarioCNCClick(Sender);
  dblDestinatarioCNC.SetFocus;
end;

procedure TfMxCentralMensagem.SB_ExcClick(Sender: TObject);
begin
  if Entidade1.IsEmpty then
    ShowMessage('Selecione a mensagem!')
  else if (Entidade1.SituacaoEnviar = 1) and
       ((Entidade1.DataAlterado+10)>=DM.Configuracao1.Data) then
    ShowMessage('A mensagem ainda não foi Lida e ainda está no prazo!')
  else
    Entidade1.deletarauto;

  if Entidade1.IsEmpty then
  Begin
    edtCodigoMSGenv.Clear;
    mskDataEnviada.Clear;
    dblDestinatarioCNC.KeyValue:=-1;
    dblDestinatario.KeyValue:=-1;
    edtAssuntoEnv.Clear;
    Memo1.Clear;
    ckbPublicaEnv.Checked:=False;
    ckbUrgenteEnv.Checked:=False;
    ckbAvisarEnv.Checked:=False;
  end;
end;

procedure TfMxCentralMensagem.SB_ImprimirClick(Sender: TObject);
var
  i,tam:integer;
  temp,temp2:string;
begin
  if Entidade2.IsEmpty then
    raise Exception.Create('Selecione a mensagem!');
  Application.CreateForm(TfMxMensagem, fMxMensagem);
  with fMxMensagem do
  Begin
    temp:='';
    temp2:='';
    tam:=Length(dblRemetente.Text);
    for i:=1 to 40-tam do
      temp:=temp+' ';
    tam:=Length(DM.Usuario1.NomeUSU);
    for i:=1 to 40-tam do
      temp2:=temp2+' ';
    Memo1.Lines.Add('');
    Memo1.Lines.Add('  MENSAGEM RECEBIDA');
    Memo1.Lines.Add('');
    Memo1.Lines.Add('  _________________________________________________________________________________');
    Memo1.Lines.Add('  Data: '+mskDataRecebimento.Text);
    Memo1.Lines.Add('  De  : '+dblRemetente.Text+Temp+' Centro: '+dblRemetenteCNC.Text);
    Memo1.Lines.Add('  Para: '+DM.Usuario1.NomeUSU+Temp2+' Centro: '+DM.CentroCusto1.RazaoSocial);
    Memo1.Lines.Add('  Assunto: '+edtAssuntoRec.Text);
    Memo1.Lines.Add('  _________________________________________________________________________________');
    For i:=0 to Memo2.Lines.Count-1 do
      Memo1.Lines.Add('  '+Memo2.Lines[i]);
    Memo1.Lines.Add('  _________________________________________________________________________________');
    ShowModal;
  end;
  if Entidade2.SituacaoReceber = 0 then
  Begin
    with Entidade2 do
      if AvisarLeitura then
        Entidade1.Inserir(CodigoCNC,0,CodigoCNC,CodigoUSU,1,0,'Mensagem Lida - '+Assunto,
          Mensagem,Obs,False,Urgente,False);
    ExecutaSQL(DM.QR_Comandos,'UPDATE MENSAGEM SET '+
      ' MSG_SITUACAO_ENVIAR = 2 '+
      ',MSG_SITUACAO_RECEBER = 1 '+
      ',MSG_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE MSG_CODIGO='+IntToStr(Entidade2.CodigoMSG));
    Entidade2.Close;
    Entidade2.Open;
    try
      sndPlaySound(Pchar(cSomSinos),SND_SYNC);
    except
    end;
    if Entidade2.IsEmpty then
    Begin
      edtCodigoMSGrec.Clear;
      mskDataRecebimento.Clear;
      dblRemetenteCNC.KeyValue:=-1;
      dblRemetente.KeyValue:=-1;
      edtAssuntoRec.Clear;
      Memo2.Clear;
    end;
  end;
end;

procedure TfMxCentralMensagem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Memo1.Focused) or (Memo2.Focused) then
    exit;
  if key = #13 then
  Begin
    if SB_Salva.Enabled then
      SB_SalvaClick(sender);
  end
  else if (Key = #27) then
  Begin
    if (not SB_Salva.Enabled) then
      Close
    else
      SB_CancClick(sender);
  end;
end;

procedure TfMxCentralMensagem.SB_Prim2Click(Sender: TObject);
begin
 if Entidade2.IsEmpty then
   abort;
 If Entidade2.bof Then
  begin
    SB_Ant2.Enabled:=False;
    SB_Prim2.Enabled:=False;
  end
  Else
  begin
    Entidade2.First;
    SB_Ant2.Enabled:=False;
    SB_Prim2.Enabled:=False;
  end;
  If not Entidade2.eof Then
  begin
    SB_Prox2.Enabled:=True;
    SB_Ult2.Enabled:=True;
  end;
end;

procedure TfMxCentralMensagem.SB_Ant2Click(Sender: TObject);
begin
 if Entidade2.IsEmpty then
   abort;
 If Entidade2.bof Then
  begin
    SB_Ant2.Enabled:=False;
    SB_Prim2.Enabled:=False;
  end
  Else
  begin
    Entidade2.Prior;
    If Entidade2.bof Then
    begin
     SB_Ant2.Enabled:=False;
     SB_Prim2.Enabled:=False;
    end;
  end;
  If not Entidade2.eof Then
  begin
    SB_Prox2.Enabled:=True;
    SB_Ult2.Enabled:=True;
  end;
end;

procedure TfMxCentralMensagem.SB_Prox2Click(Sender: TObject);
begin
  if Entidade2.IsEmpty then
   abort;
  If Entidade2.eof Then
  begin
    SB_Prox2.Enabled:=False;
    SB_Ult2.Enabled:=False;
  end
  Else
  begin
    Entidade2.Next;
    If Entidade2.eof Then
    begin
     SB_Prox2.Enabled:=False;
     SB_Ult2.Enabled:=False;
    end;
  end;
  If not Entidade2.bof Then
  begin
    SB_Ant2.Enabled:=True;
    SB_Prim2.Enabled:=True;
  end;
end;

procedure TfMxCentralMensagem.SB_Ult2Click(Sender: TObject);
begin
  if Entidade2.IsEmpty then
   abort;
  If Entidade2.eof Then
  begin
    SB_Prox2.Enabled:=False;
    SB_Ult2.Enabled:=False;
  end
  Else
  begin
    Entidade2.Last;
    SB_Prox2.Enabled:=False;
    SB_Ult2.Enabled:=False;
  end;
  If not Entidade2.bof Then
  begin
    SB_Ant2.Enabled:=True;
    SB_Prim2.Enabled:=True;
  end;
end;

procedure TfMxCentralMensagem.SB_EnviarClick(Sender: TObject);
begin
  if Entidade1.IsEmpty then
    Raise Exception.Create('Selecione a mensagem!')
  else
  Begin
    if Entidade1.SituacaoEnviar <> 0 then
      Raise Exception.Create('Mensagem já enviada!')
    else
    Begin
      if Entidade1.Publica then
      Begin
        Usuario3.Close;
        Usuario3.Open;
        Usuario3.First;
        Mensagem3.Open;
        with Entidade1 do
          while not Usuario3.Eof do
          Begin
            if (not(((Usuario3.CodigoCNC=DestinoCNC)and(Usuario3.CodigoUSU=DestinoUSU))OR
               ((Usuario3.CodigoCNC=CodigoCNC)and(Usuario3.CodigoUSU=CodigoUSU))))then
              Mensagem3.Inserir(CodigoCNC,0,Usuario3.CodigoCNC,Usuario3.CodigoUSU,1,0,Assunto,
                Mensagem,Obs,Publica,Urgente,AvisarLeitura);
            Usuario3.Next;
          end;
      end;
      ExecutaSQL(DM.QR_Comandos,'UPDATE MENSAGEM SET '+
        ' MSG_SITUACAO_ENVIAR=1 '+
        ',MSG_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE MSG_CODIGO='+IntToStr(Entidade1.CodigoMSG));
      Entidade1.Close;
      Entidade1.Open;
      Entidade1.First;
      try
        sndPlaySound(Pchar(cSomSinos),SND_SYNC);
      except
      end;
    end;
  end;
end;

procedure TfMxCentralMensagem.SB_ReenviarClick(Sender: TObject);
begin
  if Entidade1.IsEmpty then
    Raise Exception.Create('Selecione a mensagem!')
  else
  Begin
    if Entidade1.SituacaoEnviar = 0  then
      Raise Exception.Create('Mensagem não enviada enviada!')
    else
    Begin
      with Entidade1 do
        Entidade1.Inserir(CodigoCNC,0,DestinoCNC,DestinoUSU,1,0,'Reenvio - '+Assunto,
          Mensagem,Obs,Publica,Urgente,AvisarLeitura);
        ExecutaSQL(DM.QR_Comandos,'UPDATE MENSAGEM SET '+
          ' MSG_DT_ALTERADO="'+MesDia(DM.Configuracao1.DataHora)+'" '+
          ' WHERE MSG_CODIGO='+IntToStr(Entidade1.SCodigo));
      Entidade1.Close;
      Entidade1.Open;
      Entidade1.First;
      ShowMessage('Mensagem Reenviada!!!');
      try
        sndPlaySound(Pchar(cSomSinos),SND_SYNC);
      except
      end;
    end;
  end;
end;

procedure TfMxCentralMensagem.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tbsEnviar then
  Begin
    //menEnviar.Enabled  := True;
    //menReceber.Enabled := False;
    Entidade1.Close;
    Entidade1.Open;
    Entidade1.CarregaDados;
  end
  else
  Begin
    //menEnviar.Enabled  := False;
    //menReceber.Enabled := True;
    Entidade2.Close;
    Entidade2.Open;
    Entidade2.CarregaDados;
  end;
end;

procedure TfMxCentralMensagem.SB_ResponderClick(Sender: TObject);
var
  CNC, USU : integer;
  Cod, Data, Assunto : string;
begin
  if Entidade2.IsEmpty then
    Raise Exception.Create('Selecione a Mensagem!');
  Cod := edtCodigoMSGrec.Text;
  Data := mskDataRecebimento.Text;
  Assunto := edtAssuntoRec.Text;
  CNC := dblRemetenteCNC.KeyValue;
  USU := dblRemetente.KeyValue;
  RetornoMensagem:=Memo2.Text;
  Memo2.Clear;
  Memo2.lines.Add('------------------------');
  Memo2.Lines.ADD('Mensagem: '+Cod+' - Data: '+Data);
  Memo2.Lines.Add(RetornoMensagem);
  RetornoMensagem:=Memo2.Text;
  PageControl1.ActivePage := tbsEnviar;
  cmbSituacaoEnv.ItemIndex:=0;
  SB_NovoClick(Sender);
  dblDestinatarioCNC.KeyValue := CNC;
  dblDestinatarioCNCClick(sender);
  dblDestinatario.KeyValue := USU;
  dblDestinatarioCNC.Enabled  := False;
  dblDestinatario.Enabled  := False;
  edtAssuntoEnv.Text := 'RE: '+Assunto;
  if Entidade2.SituacaoReceber = 0 then
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE MENSAGEM SET '+
      ' MSG_SITUACAO_ENVIAR=2 '+
      ',MSG_SITUACAO_RECEBER=1 '+
      ',MSG_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE MSG_CODIGO='+IntToStr(Entidade2.CodigoMSG));
    Entidade2.Close;
    Entidade2.Open;
    if Entidade2.IsEmpty then
    Begin
      edtCodigoMSGrec.Clear;
      mskDataRecebimento.Clear;
      dblRemetenteCNC.KeyValue:=-1;
      dblRemetente.KeyValue:=-1;
      edtAssuntoRec.Clear;
      Memo2.Clear;
    end;
    Entidade2.Close;
    Entidade2.Open;
  end;
  Memo1.SetFocus;
end;

procedure TfMxCentralMensagem.SB_LidaClick(Sender: TObject);
begin
  if Entidade2.IsEmpty then
    Raise Exception.Create('Selecione a Mensagem!');
  if Entidade2.SituacaoReceber = 1 then
    Raise Exception.Create('Mensagem já marcada como Lida!');
  with Entidade2 do
    if AvisarLeitura then
      Entidade1.Inserir(CodigoCNC,0,CodigoCNC,CodigoUSU,1,0,'Mensagem Lida - '+Assunto,
        Mensagem,Obs,False,Urgente,False);
  ExecutaSQL(DM.QR_Comandos,'UPDATE MENSAGEM SET '+
    ' MSG_SITUACAO_ENVIAR = 2 '+
    ',MSG_SITUACAO_RECEBER=1 '+
    ',MSG_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE MSG_CODIGO='+IntToStr(Entidade2.CodigoMSG));
  Entidade2.Close;
  Entidade2.Open;
  try
    sndPlaySound(Pchar(cSomSinos),SND_SYNC);
  except
  end;
  if Entidade2.IsEmpty then
  Begin
    edtCodigoMSGrec.Clear;
    mskDataRecebimento.Clear;
    dblRemetenteCNC.KeyValue:=-1;
    dblRemetente.KeyValue:=-1;
    edtAssuntoRec.Clear;
    Memo2.Clear;
  end;
end;

procedure TfMxCentralMensagem.SB_ExcRecClick(Sender: TObject);
begin
  if Entidade2.IsEmpty then
    Raise Exception.Create('Selecione a Mensagem!');
  with Entidade2 do
    if (AvisarLeitura) and (SituacaoReceber = 0) and (CodigoUSU<>DestinoUSU) then
      Entidade1.Inserir(CodigoCNC,0,CodigoCNC,CodigoUSU,1,0,'Mensagem Lida/Exc. - '+Assunto,
        Mensagem,Obs,False,Urgente,False);
  ExecutaSQL(DM.QR_Comandos,'UPDATE MENSAGEM SET '+
    ' MSG_SITUACAO_ENVIAR = 2 '+
    ',MSG_SITUACAO_RECEBER = 1 '+
    ',MSG_APAGADA = 1 '+
    ',MSG_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE MSG_CODIGO='+IntToStr(Entidade2.CodigoMSG));
  Entidade2.Close;
  Entidade2.Open;
  if Entidade2.IsEmpty then
  Begin
    edtCodigoMSGrec.Clear;
    mskDataRecebimento.Clear;
    dblRemetenteCNC.KeyValue:=-1;
    dblRemetente.KeyValue:=-1;
    edtAssuntoRec.Clear;
    Memo2.Clear;
  end;
end;

procedure TfMxCentralMensagem.SpeedButton3Click(Sender: TObject);
begin
  If cmbCampoReceber.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizarReceber.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade2.Localizar;
end;

procedure TfMxCentralMensagem.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = '') and (not Entidade2.IsEmpty) then
    with DBGrid1.Canvas do
    Begin
      try
        ImageList1.Draw(DBGrid1.Canvas, Rect.Left+2, Rect.Top, entidade2.SituacaoReceber, True);
      except
      end;
    end;
end;

procedure TfMxCentralMensagem.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = '') and (not Entidade1.IsEmpty) then
    with DBGrid1.Canvas do
    Begin
      FillRect(Rect);
      try
        ImageList1.Draw(DBGrid5.Canvas, Rect.Left+2, Rect.Top, entidade1.SituacaoReceber, True);
      except
      end;
    end;
end;

procedure TfMxCentralMensagem.DBGrid1DblClick(Sender: TObject);
begin
  if not Entidade2.IsEmpty then
    SB_ImprimirClick(sender);
end;

procedure TfMxCentralMensagem.DBGrid5DblClick(Sender: TObject);
begin
  if (not Entidade1.IsEmpty) and (Entidade1.SituacaoEnviar = 0) then
    SB_EnviarClick(sender)
  else if (not Entidade1.IsEmpty) then
    SB_ReenviarClick(sender);
end;

procedure TfMxCentralMensagem.Usuario3BeforeOpen(DataSet: TDataSet);
begin
  Usuario3.Filtered := False;
end;

procedure TfMxCentralMensagem.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade1.SOrdemdoGrid(Entidade1.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxCentralMensagem.DBGrid1TitleClick(Column: TColumn);
begin
  try
    if Entidade2.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade2.SOrdemdoGrid(Entidade2.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxCentralMensagem.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxCentralMensagem.dblDestinatarioCNCClick(Sender: TObject);
begin
  Usuario4.Close;
  Usuario4.Open;
end;

procedure TfMxCentralMensagem.Usuario4BeforeOpen(DataSet: TDataSet);
begin
  try
    Usuario4.ParamByName('CNC_CODIGO').asInteger := dblDestinatarioCNC.KeyValue;
  except
    Usuario4.ParamByName('CNC_CODIGO').asInteger := -1;
  end;
end;

end.
