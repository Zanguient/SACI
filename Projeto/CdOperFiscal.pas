unit CdOperFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, TipoParam, Menus, OperFisc, Usuario, Parametro,
  ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfCadOperfiscal = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    edtCodigoOPF: TEdit;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    OperFiscal1: TOperFiscal;
    Ds_operfiscal1: TDataSource;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    Label3: TLabel;
    mskDataAlterado: TMaskEdit;
    Label4: TLabel;
    edtObservacao: TEdit;
    Label5: TLabel;
    edtUsuario: TEdit;
    Label6: TLabel;
    OperFiscal1OPF_CODIGO: TIntegerField;
    OperFiscal1CNC_CODIGO: TIntegerField;
    OperFiscal1OPF_DESCRICAO: TStringField;
    OperFiscal1OPF_TIPO: TIntegerField;
    OperFiscal1OPF_OBSERVACAO: TStringField;
    OperFiscal1USU_CODIGO: TIntegerField;
    OperFiscal1OPF_DT_CADASTRO: TDateTimeField;
    OperFiscal1OPF_DT_ALTERADO: TDateTimeField;
    OperFiscal1Usuario: TStringField;
    OperFiscal1Tipo: TStringField;
    ckbEntrada: TCheckBox;
    ckbSaida: TCheckBox;
    OperFiscal1OPF_ENTRADA: TIntegerField;
    OperFiscal1OPF_SAIDA: TIntegerField;
    OperFiscal1Entrada: TStringField;
    OperFiscal1Saida: TStringField;
    dblTipoNota: TDBLookupComboBox;
    Parametro3: TParametro;
    DSParametro3: TDataSource;
    OperFiscal1OPF_SITUACAO: TIntegerField;
    Label22: TLabel;
    cmbSituacao: TComboBox;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    SairCab: TAction;
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
    procedure SB_LocCabClick(Sender: TObject);
    procedure TTipoParam1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TipoParam1AfterScroll(DataSet: TDataSet);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure OperFiscal1AfterScroll(DataSet: TDataSet);
    procedure OperFiscal1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TOperFiscal;
  end;

var
  fCadOperfiscal: TfCadOperfiscal;

implementation
Uses UDM,funcoes;
{$R *.DFM}



procedure TfCadOperfiscal.SB_PrimClick(Sender: TObject);
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

procedure TfCadOperfiscal.SB_AntClick(Sender: TObject);
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

procedure TfCadOperfiscal.SB_ProxClick(Sender: TObject);
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

procedure TfCadOperfiscal.SB_UltClick(Sender: TObject);
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

procedure TfCadOperfiscal.SB_NovoCabClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1950)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir Operação Fiscal!');

  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtDescricao.SetFocus;
end;

procedure TfCadOperfiscal.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1970)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar Operação Fiscal!');

  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  edtDescricao.SetFocus;
end;

procedure TfCadOperfiscal.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir clientes neste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1960)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir Operação Fiscal!');
  Entidade.deletarauto;
end;

procedure TfCadOperfiscal.SB_SalvaCabClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
    AtualizaControles(1,False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadOperfiscal.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
end;

procedure TfCadOperfiscal.FormCreate(Sender: TObject);
begin
  Entidade:=OperFiscal1;
end;

procedure TfCadOperfiscal.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;


procedure TfCadOperfiscal.TTipoParam1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadOperfiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;
 
procedure TfCadOperfiscal.TipoParam1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;


procedure TfCadOperfiscal.SairCabClick(Sender: TObject);
begin
Close;
end;

procedure TfCadOperfiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadOperfiscal.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Parametro3.Open;
  Entidade.Active:=true;
  cmbCampo.ItemIndex:=0;
  edtLocalizar.SetFocus;
end;

procedure TfCadOperfiscal.OperFiscal1AfterScroll(DataSet: TDataSet);
begin
  OperFiscal1.CarregaDados;
  edtUsuario.text:=Entidade.FieldByName('Usuario').asString;
end;

procedure TfCadOperfiscal.OperFiscal1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);

  Entidade.FieldByName('Tipo').asString := DM.SelecionaParametro(Entidade.Tipo);

  if Entidade.Entrada then
    Entidade.FieldByName('Entrada').asString:='SIM'
  else
    Entidade.FieldByName('Entrada').asString:='NÃO';
  if Entidade.Saida then
    Entidade.FieldByName('Saida').asString:='SIM'
  else
    Entidade.FieldByName('Saida').asString:='NÃO';
end;

procedure TfCadOperfiscal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if Key=#13 then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfCadOperfiscal.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  SairCab.Enabled       := not Habilitar;
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

end.
