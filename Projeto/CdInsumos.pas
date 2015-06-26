unit CdInsumos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Menus, JPEG, Insumos, Produto;

type
  TfCadInsumos = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
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
    edtINS_Descricao: TEdit;
    edtINS_CodigoPRD: TEdit;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label15: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    mnuInsumos1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Bevel1: TBevel;
    Label24: TLabel;
    imgINSprd: TImage;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label2: TLabel;
    imgPRD: TImage;
    Label4: TLabel;
    Label5: TLabel;
    edtDescricaoPRD: TEdit;
    edtCodigoPRD: TEdit;
    Label26: TLabel;
    Label6: TLabel;
    edtINS_Quantidade: TEdit;
    Label7: TLabel;
    edtOBS: TEdit;
    Insumos1: TInsumos;
    edtPrecoCompra: TEdit;
    Label16: TLabel;
    Produto1: TProduto;
    DSInsumos: TDataSource;
    Insumos1INS_CODIGO: TIntegerField;
    Insumos1CNC_CODIGO: TIntegerField;
    Insumos1USU_CODIGO: TIntegerField;
    Insumos1INS_DT_ALTERADO: TDateTimeField;
    Insumos1INS_DT_CADASTRO: TDateTimeField;
    Insumos1PRD_CODIGO: TIntegerField;
    Insumos1INS_PRD_CODIGO: TIntegerField;
    Insumos1INS_QUANTIDADE: TFloatField;
    Insumos1INS_SITUACAO: TIntegerField;
    Insumos1INS_OBSERVACAO: TStringField;
    Insumos1Produto: TStringField;
    Insumos1VlrUnitario: TStringField;
    Insumos1VlrTotal: TStringField;
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
    procedure cmbCampoEnter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure imgINSprdDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtINS_CodigoPRDExit(Sender: TObject);
    procedure Insumos1AfterScroll(DataSet: TDataSet);
    procedure Insumos1CalcFields(DataSet: TDataSet);
    procedure SB_FecharClick(Sender: TObject);
    procedure edtINS_CodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure imgPRDDblClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    procedure CalculaTotal;
    { Private declarations }
  public
    { Public declarations }
    Entidade:TInsumos;
    VlrTotalCompra:Double;
  end;

var
  fCadInsumos: TfCadInsumos;

implementation
Uses UDM,funcoes, MxFotoAmpliada, MxSPediProd, Configuracao, CdProduto,
  MxSPediProdMotCal;
{$R *.DFM}



procedure TfCadInsumos.SB_PrimClick(Sender: TObject);
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

procedure TfCadInsumos.SB_AntClick(Sender: TObject);
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

procedure TfCadInsumos.SB_ProxClick(Sender: TObject);
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

procedure TfCadInsumos.SB_UltClick(Sender: TObject);
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

procedure TfCadInsumos.AtualizaControles(Habilitar:Boolean);
begin
  Incluir1.Enabled:=not habilitar;
  Alterar1.Enabled:=not habilitar;
  Excluir1.Enabled:=not habilitar;
  Localizar1.Enabled:=not habilitar;
  Salvar1.Enabled:=habilitar;
  Cancelar1.Enabled:=habilitar;
  SB_Prim.Enabled:=not habilitar;
  SB_Ant.Enabled:=not habilitar;
  SB_Prox.Enabled:=not habilitar;
  SB_Ult.Enabled:=not habilitar;
  SB_Novo.Enabled:=not habilitar;
  SB_Loc.Enabled:=not habilitar;
  SB_Alt.Enabled:=not habilitar;
  SB_Exc.Enabled:=not habilitar;
  SB_Salva.Enabled:=habilitar;
  SB_Canc.Enabled:=habilitar;
  edtLocalizar.Enabled:=not habilitar;
  cmbCampo.Enabled:=not habilitar;
end;

procedure TfCadInsumos.SB_NovoClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
//  If DM.Usuario1.Permissoes.IndexOf(IntToStr(500)) < 0 then
//    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  edtINS_Descricao.Text:='';
  AtualizaControles(true);
  edtLocalizar.Color:=AlteraCorComponentes;
  cmbCampo.Color:=AlteraCorComponentes;
  edtINS_CodigoPRD.SetFocus;
end;

procedure TfCadInsumos.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
//  If DM.Usuario1.Permissoes.IndexOf(IntToStr(520)) < 0 then
//    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  edtLocalizar.Color:=AlteraCorComponentes;
  AtualizaControles(true);
  cmbCampo.Color:=AlteraCorComponentes;
  edtINS_Quantidade.SetFocus;
end;

procedure TfCadInsumos.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
//  If DM.Usuario1.Permissoes.IndexOf(IntToStr(510)) < 0 then
//    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.Deletarauto;
  CalculaTotal;
  if Entidade.IsEmpty then
    imgINSprd.Picture:=nil;
end;

procedure TfCadInsumos.SB_SalvaClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
  Begin
    edtLocalizar.Color:=clWindow;
    AtualizaControles(False);
    cmbCampo.Color:=clWindow;
  end
  else
    ShowMessage('As alterações não foram salvas!');
  CalculaTotal;
end;

procedure TfCadInsumos.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  edtLocalizar.Color:=clWindow;
  AtualizaControles(False);
  cmbCampo.Color:=clWindow;
  if Entidade.IsEmpty then
  Begin
    imgINSprd.Picture:=nil;
  end;
end;

procedure TfCadInsumos.FormCreate(Sender: TObject);
begin
  Entidade:=Insumos1;
//  Entidade.Active:=true;
end;

procedure TfCadInsumos.cmbCampoEnter(Sender: TObject);
begin
  cmbCampo.Text:='';
end;

procedure TfCadInsumos.SB_LocClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadInsumos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with Produto1 do
  begin
    Close;
    ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
    ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
    Open;
    if Precocompra<>StrToFloat(edtPrecoCompra.text) then
    begin
      ExecutaSQL(dm.QR_Comandos,'UPDATE PRODUTO SET PRD_PRECO_COMPRA='+VirgPonto(edtPrecoCompra.Text)+
        ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PRD_CODIGO='+(edtCodigoPRD.text));
    end;
  end;
  fcadProdutos.Produto1.close;
  fcadProdutos.Produto1.open;
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadInsumos.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfCadInsumos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadInsumos.CalculaTotal;
begin
  entidade.First;
  VlrTotalCompra:=0;
  while not Entidade.eof do
  begin
    VlrTotalCompra:=VlrTotalCompra+Entidade.fieldbyName('VlrTotal').asFloat;
    edtPrecoCompra.Text:=(format('%.2f',[VlrTotalCompra]));
    Entidade.next;
  end;
  entidade.First;
end;

procedure TfCadInsumos.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
  with entidade do
  begin
    Close;
    ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
    Open;
  end;
  CalculaTotal;
end;

procedure TfCadInsumos.imgINSprdDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgINSprd.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Produto: '+Produto1.Descricao+' '+
    Produto1.Unidade+' '+Produto1.Referencia+' '+Produto1.Detalhe+' '+
    Produto1.Marca);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Local Estoque: '+Produto1.Local);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Características: '+Produto1.Caracteristica);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+Produto1.Obs);
  fMxFotoAmpliada.ShowModal;
end;

procedure TfCadInsumos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If (key=chr(27)) and (SB_Canc.Enabled) then
  begin
    SB_Canc.setfocus;
    SB_CancClick(sender);
  end
  else
    If (key=chr(27)) and (not (SB_Canc.Enabled)) then
      close;
end;

procedure TfCadInsumos.edtINS_CodigoPRDExit(Sender: TObject);
begin
  If SB_Canc.Focused then
    Exit;

  if edtINS_CodigoPRD.text=edtCodigoPRD.Text then
  begin
    edtINS_CodigoPRD.SetFocus;
    raise Exception.Create('Um produto não pode ser insumo dele mesmo!');
  end;

  if (not VerificaInteiroBranco(edtINS_CodigoPRD.text)) then
  Begin
    Showmessage('Código de produto inválido');
    edtINS_CodigoPRD.SetFocus;
    Exit;
  End;
  with produto1 do
  begin
    if CodigoPRD <> StrToInt(edtCodigoPRD.Text) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtINS_CodigoPRD.Text);
      ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      Open;
      if IsEmpty then
      begin
        edtINS_CodigoPRD.setfocus;
        raise Exception.Create('Este produto não é um insumo!');
      end
      else
        edtINS_Descricao.Text:=Descricao;
    end;
  end;
end;

procedure TfCadInsumos.Insumos1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtINS_CodigoPRD.Text);
  Produto1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Produto1.Open;
  edtINS_Descricao.Text:=Produto1.Descricao;

end;

procedure TfCadInsumos.Insumos1CalcFields(DataSet: TDataSet);
begin
  with produto1 do
  begin
    Close;
    ParamByName('PRD_CODIGO').asInteger:=Entidade.INS_CodigoPRD;
    ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
    Open;
    entidade.FieldByName('Produto').AsString:=Descricao;
    entidade.FieldByName('VlrUnitario').AsString:=(format('%.2f',[Precocompra]));
    entidade.FieldByName('VlrTotal').AsString:=(format('%.2f',[Precocompra*Entidade.Quantidade]));
  end;
end;

procedure TfCadInsumos.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadInsumos.edtINS_CodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtINS_CodigoPRD.Clear;
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=45;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=45;
        ShowModal;
      end;
    end;
    edtINS_Quantidade.SetFocus;
  End;

end;

procedure TfCadInsumos.imgPRDDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgPRD.Picture;
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Produto: '+fcadProdutos.Entidade.Descricao+' '+
    fcadProdutos.Entidade.Unidade+' '+fcadProdutos.Entidade.Referencia+' '+fcadProdutos.Entidade.Detalhe+' '+
    fcadProdutos.Entidade.Marca);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Local Estoque: '+fcadProdutos.Entidade.Local);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Características: '+fcadProdutos.Entidade.Caracteristica);
  fMxFotoAmpliada.memRodapeFoto.Lines.Add('Observação: '+fcadProdutos.Entidade.Obs);
  fMxFotoAmpliada.ShowModal;
end;

end.
