unit CdClasFisc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, DBCtrls, Parametro, Classificacao_fiscal, Menus, Usuario,
  ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadClasFisc = class(TForm)
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
    Edit2: TEdit;
    Edit1: TEdit;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Label20: TLabel;
    Classificacao_fiscal1: TClassificacao_fiscal;
    DSClassificacao_fiscal1: TDataSource;
    Classificacao_fiscal1CLF_CODIGO: TIntegerField;
    Classificacao_fiscal1CNC_CODIGO: TIntegerField;
    Classificacao_fiscal1USU_CODIGO: TIntegerField;
    Classificacao_fiscal1CLF_DT_CADASTRO: TDateTimeField;
    Classificacao_fiscal1CLF_DT_ALTERADO: TDateTimeField;
    Classificacao_fiscal1CLF_EXIBIR: TStringField;
    Classificacao_fiscal1CLF_ICMS: TFloatField;
    Classificacao_fiscal1CLF_REDUCAO: TFloatField;
    Classificacao_fiscal1CLF_DESCRICAO: TStringField;
    Classificacao_fiscal1CLF_OBSERVACAO: TStringField;
    Classificacao_fiscal1Usuario: TStringField;
    Label4: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label8: TLabel;
    Edit7: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Memo1: TMemo;
    cbxCST: TComboBox;
    Label14: TLabel;
    cbxCSOSN: TComboBox;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    Action7: TAction;
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
    procedure EntidadeAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Classificacao_fiscal1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Classificacao_fiscal1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure cbxCSTChange(Sender: TObject);
    procedure cbxCSOSNChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TClassificacao_fiscal;
  end;

var
  fCadClasFisc: TfCadClasFisc;

implementation

Uses
  UDM, funcoes;

{$R *.DFM}

procedure TfCadClasFisc.SB_PrimClick(Sender: TObject);
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

procedure TfCadClasFisc.SB_AntClick(Sender: TObject);
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

procedure TfCadClasFisc.SB_ProxClick(Sender: TObject);
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

procedure TfCadClasFisc.SB_UltClick(Sender: TObject);
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

procedure TfCadClasFisc.SB_NovoClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(900)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit11.Enabled:=False;
  Edit11.Color:=AlteraCorComponentes;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=AlteraCorComponentes;
  Edit7.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);

  cbxCST.Enabled     := True;
  cbxCSOSN.Enabled   := True;
  cbxCST.ItemIndex   := -1;
  cbxCSOSN.ItemIndex := -1;

  Edit2.SetFocus;
end;

procedure TfCadClasFisc.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(920)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit11.Enabled:=False;
  Edit11.Color:=AlteraCorComponentes;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=AlteraCorComponentes;

  cbxCST.Enabled   := True;
  cbxCSOSN.Enabled := True;
  
  Edit2.SetFocus;
end;

procedure TfCadClasFisc.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(910)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.Deletarauto;
  Edit1.Text := Inttostr(Entidade.CodigoCLF);
end;

procedure TfCadClasFisc.SB_SalvaClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
  Begin
    Incluir1.Enabled:=true;
    Alterar1.Enabled:=true;
    Excluir1.Enabled:=true;
    Localizar1.Enabled:=true;
    Salvar1.Enabled:=false;
    Cancelar1.Enabled:=false;
    SB_Prim.Enabled:=True;
    SB_Ant.Enabled:=True;
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
    SB_Novo.Enabled:=True;
    SB_Loc.Enabled:=True;
    SB_Alt.Enabled:=True;
    SB_Exc.Enabled:=True;
    SB_Salva.Enabled:=False;
    SB_Canc.Enabled:=False;
    Edit11.Enabled:=True;
    Edit11.Color:=clWindow;
    ComboBox2.Enabled:=True;
    ComboBox2.Color:=clWindow;

    cbxCST.Enabled   := False;
    cbxCSOSN.Enabled := False;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadClasFisc.SB_CancClick(Sender: TObject);
begin
  Incluir1.Enabled:=true;
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Localizar1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;

  cbxCST.Enabled   := False;
  cbxCSOSN.Enabled := False;

  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  Entidade.CancelaEdicao;
end;

procedure TfCadClasFisc.FormCreate(Sender: TObject);
begin
  Entidade:=Classificacao_fiscal1;
  Entidade.Active:=true;
end;

procedure TfCadClasFisc.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfCadClasFisc.SB_LocClick(Sender: TObject);
begin
  If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');

  Entidade.Localizar;
end;

procedure TfCadClasFisc.EntidadeAfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadClasFisc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=false;
  Action:=Cafree;
end;
procedure TfCadClasFisc.Classificacao_fiscal1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;

  cbxCST.ItemIndex   := -1;
  cbxCSOSN.ItemIndex := -1;
  Edit1.Text := Inttostr(Entidade.CodigoCLF);

  if Length(Entidade.Exibir) = 2 then
  begin
    if Entidade.Exibir = '00' then
      cbxCST.ItemIndex := 0
    else if Entidade.Exibir = '10' then
      cbxCST.ItemIndex := 1
    else if Entidade.Exibir = '20' then
      cbxCST.ItemIndex := 2
    else if Entidade.Exibir = '30' then
      cbxCST.ItemIndex := 3
    else if Entidade.Exibir = '40' then
      cbxCST.ItemIndex := 4
    else if Entidade.Exibir = '41' then
      cbxCST.ItemIndex := 5
    else if Entidade.Exibir = '50' then
      cbxCST.ItemIndex := 6
    else if Entidade.Exibir = '51' then
      cbxCST.ItemIndex := 7
    else if Entidade.Exibir = '60' then
      cbxCST.ItemIndex := 8
    else if Entidade.Exibir = '70' then
      cbxCST.ItemIndex := 9
    else if Entidade.Exibir = '90' then
      cbxCST.ItemIndex := 10;
  end
  else if Length(Entidade.Exibir) = 3 then
  begin
    if Entidade.Exibir = '101' then
      cbxCSOSN.ItemIndex := 0
    else if Entidade.Exibir = '102' then
      cbxCSOSN.ItemIndex := 1
    else if Entidade.Exibir = '103' then
      cbxCSOSN.ItemIndex := 2
    else if Entidade.Exibir = '201' then
      cbxCSOSN.ItemIndex := 3
    else if Entidade.Exibir = '202' then
      cbxCSOSN.ItemIndex := 4
    else if Entidade.Exibir = '203' then
      cbxCSOSN.ItemIndex := 5
    else if Entidade.Exibir = '300' then
      cbxCSOSN.ItemIndex := 6
    else if Entidade.Exibir = '400' then
      cbxCSOSN.ItemIndex := 7
    else if Entidade.Exibir = '500' then
      cbxCSOSN.ItemIndex := 8
    else if Entidade.Exibir = '900' then
      cbxCSOSN.ItemIndex := 9;
  end;
end;

procedure TfCadClasFisc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadClasFisc.Sair1Click(Sender: TObject);
begin
 fCadClasFisc.Close;
end;

procedure TfCadClasFisc.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
end;

procedure TfCadClasFisc.Classificacao_fiscal1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfCadClasFisc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfCadClasFisc.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfCadClasFisc.cbxCSTChange(Sender: TObject);
begin
  if ( cbxCST.ItemIndex >= 0 ) then
  begin
    cbxCSOSN.ItemIndex := -1;
    Edit3.Text := copy(cbxCST.Text,1,2);
  end;
end;

procedure TfCadClasFisc.cbxCSOSNChange(Sender: TObject);
begin
  if ( cbxCSOSN.ItemIndex >= 0 ) then
  begin
    cbxCST.ItemIndex := -1;
    Edit3.Text := copy(cbxCSOSN.Text,1,3);
  end;
end;

end.
