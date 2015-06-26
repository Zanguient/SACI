unit CdAtendimentosPorVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Menus, JPEG, Atendimento_por_Vendedor, ComCtrls, DBCtrls, Vendedor;

type
  TfCadAtendimentosPorVendedor = class(TForm)
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
    Label1: TLabel;
    edtAtendimentos: TEdit;
    edtCodigoAPV: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label15: TLabel;
    DSAtendimento_por_Vendedor1: TDataSource;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Clientes1: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Label4: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    edtObservacao: TEdit;
    Atendimento_por_Vendedor1: TAtendimento_por_Vendedor;
    Panel2: TPanel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    Label22: TLabel;
    dblCodigoFUN: TDBLookupComboBox;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Atendimento_por_Vendedor1AfterScroll(DataSet: TDataSet);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Atendimento_por_Vendedor1BeforeOpen(DataSet: TDataSet);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TAtendimento_por_Vendedor;
  end;

var
  fCadAtendimentosPorVendedor: TfCadAtendimentosPorVendedor;

implementation
Uses UDM,funcoes;
{$R *.DFM}



procedure TfCadAtendimentosPorVendedor.SB_PrimClick(Sender: TObject);
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

procedure TfCadAtendimentosPorVendedor.SB_AntClick(Sender: TObject);
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

procedure TfCadAtendimentosPorVendedor.SB_ProxClick(Sender: TObject);
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

procedure TfCadAtendimentosPorVendedor.SB_UltClick(Sender: TObject);
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

procedure TfCadAtendimentosPorVendedor.AtualizaControles(Habilitar:Boolean);
begin
  SairCab.Enabled:=not habilitar;
  IncluirCab.Enabled:=not habilitar;
  AlterarCab.Enabled:=not habilitar;
  ExcluirCab.Enabled:=not habilitar;
  LocalizarCab.Enabled:=not habilitar;
  SalvarCab.Enabled:=habilitar;
  CancelarCab.Enabled:=habilitar;
  SB_Prim.Enabled:=not habilitar;
  SB_Ant.Enabled:=not habilitar;
  SB_Prox.Enabled:=not habilitar;
  SB_Ult.Enabled:=not habilitar;
  SB_NovoCab.Enabled:=not habilitar;
  SB_LocCab.Enabled:=not habilitar;
  SB_AltCab.Enabled:=not habilitar;
  SB_ExcCab.Enabled:=not habilitar;
  SB_SalvaCab.Enabled:=habilitar;
  SB_CancCab.Enabled:=habilitar;

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
end;

procedure TfCadAtendimentosPorVendedor.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8530)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  DateTimePicker1.DateTime := DM.Configuracao1.Data;
  DateTimePicker1Change(sender);

  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtAtendimentos.SetFocus;
end;

procedure TfCadAtendimentosPorVendedor.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8540)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtAtendimentos.SetFocus;
end;

procedure TfCadAtendimentosPorVendedor.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8550)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.Deletar(Entidade.CodigoCNC, Entidade.COdigoAPV);
  Entidade.Close;
  Entidade.Open;
end;

procedure TfCadAtendimentosPorVendedor.SB_SalvaCabClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadAtendimentosPorVendedor.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadAtendimentosPorVendedor.FormCreate(Sender: TObject);
begin
  Entidade := Atendimento_por_Vendedor1;
  Vendedor1.Close;
  Vendedor1.SQL.Text := 'SELECT FUN_CODIGO,FUN_NOME,SEC_CODIGO,CNC_CODIGO,FUN_APELIDO '+
    ' FROM FUNCIONARIO '+
    ' WHERE FUN_SITUACAO <> 1 '+
//    ' AND (FUN_APARECE_VENDAS=1 '+
//    '  OR FUN_APARECE_SERVICOS=1) '+
    ' AND (CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
    '  OR  FUN_TODOS_CENTROS=1) '+
    ' ORDER BY FUN_APELIDO ';
  Vendedor1.Open;  
end;

procedure TfCadAtendimentosPorVendedor.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfCadAtendimentosPorVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadAtendimentosPorVendedor.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfCadAtendimentosPorVendedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadAtendimentosPorVendedor.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  DateTimePicker1.Date := DM.Configuracao1.Data;
  DateTimePicker1Change(sender);

  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadAtendimentosPorVendedor.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfCadAtendimentosPorVendedor.Atendimento_por_Vendedor1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfCadAtendimentosPorVendedor.DateTimePicker1Change(
  Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfCadAtendimentosPorVendedor.Atendimento_por_Vendedor1BeforeOpen(
  DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  Entidade.ParamByName('DtINI').asDateTime := Trunc(DateTimePicker1.Date);
  Entidade.ParamByName('DtFIM').asDateTime := Trunc(DateTimePicker1.Date+1);
end;

end.
