unit CdOperSist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Funcionario, Operacao_do_Sistema, Menus, Submodulo,
  Modulo, Variants, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfCadOperSist = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    edtOperacao: TEdit;
    edtComponente: TEdit;
    DSOperacao1: TDataSource;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    SB_LocCab: TSpeedButton;
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
    Label1: TLabel;
    edtCodigoOPS: TEdit;
    Operacao_do_Sistema1: TOperacao_do_Sistema;
    Modulo1: TModulo;
    Submodulo1: TSubmodulo;
    dblModulo: TDBLookupComboBox;
    dblSubModulo: TDBLookupComboBox;
    DSSubModulo: TDataSource;
    DSModulo: TDataSource;
    SB_NovoCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_ExcCab: TSpeedButton;
    ActionManager1: TActionManager;
    IncluirCab: TAction;
    AlterarCab: TAction;
    ExcluirCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    Action1: TAction;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dblModuloClick(Sender: TObject);
    procedure dblSubModuloClick(Sender: TObject);
    procedure Operacao_do_Sistema1AfterScroll(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    procedure AtualizaControles(Habilitar: boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TOperacao_Do_Sistema;
  end;

var
  fCadOperSist: TfCadOperSist;

implementation

Uses UDM,funcoes;

{$R *.DFM}

procedure TfCadOperSist.SB_PrimClick(Sender: TObject);
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

procedure TfCadOperSist.SB_AntClick(Sender: TObject);
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

procedure TfCadOperSist.SB_ProxClick(Sender: TObject);
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

procedure TfCadOperSist.SB_UltClick(Sender: TObject);
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

procedure TfCadOperSist.AtualizaControles(Habilitar: boolean);
begin
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

  dblModulo.Enabled    := not habilitar;
  dblSubModulo.Enabled := not habilitar;

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

procedure TfCadOperSist.SB_NovoCabClick(Sender: TObject);
begin
  if dblModulo.Text = '' then
    Raise Exception.Create('Selecione o Módulo!');
  if dblSubModulo.Text = '' then
    Raise Exception.Create('Selecione o SubMódulo!');
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtOperacao.SetFocus;
end;

procedure TfCadOperSist.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtOperacao.SetFocus;
end;

procedure TfCadOperSist.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  Entidade.deletarauto;
end;

procedure TfCadOperSist.SB_SalvaCabClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
  begin
    AtualizaControles(false);
    dblSubModuloClick(sender);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfCadOperSist.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(false);
end;

procedure TfCadOperSist.FormCreate(Sender: TObject);
begin
  Entidade:=Operacao_do_sistema1;
  Modulo1.Active:=true;
  dblModulo.KeyValue:=Modulo1.CodigoMDL;
  dblModuloClick(Sender);
end;

procedure TfCadOperSist.SB_LocCabClick(Sender: TObject);
begin
 If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
 Entidade.Localizar;
end;

procedure TfCadOperSist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadOperSist.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCadOperSist.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadOperSist.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadOperSist.dblModuloClick(Sender: TObject);
begin
  with SubModulo1 do
  begin
    close;
    SQL.Text:='SELECT * FROM SUBMODULO '+
      ' WHERE MDL_CODIGO = '+ inttostr(dblModulo.KeyValue)+
      ' ORDER BY SML_CODIGO';
    open;
  end;
  dblSubModulo.KeyValue:=SubModulo1.CodigoSML;
  dblSubModuloClick(sender);
end;

procedure TfCadOperSist.dblSubModuloClick(Sender: TObject);
begin
  if not SB_SalvaCab.Enabled then
  begin
    Entidade.close;
    Entidade.ParamByName('MDL_CODIGO').AsInteger:=Modulo1.fieldByName('MDL_CODIGO').AsInteger;
    Entidade.ParamByName('SML_CODIGO').AsInteger:=SubModulo1.fieldByName('SML_CODIGO').AsInteger;
    Entidade.Open;
  end;
end;

procedure TfCadOperSist.Operacao_do_Sistema1AfterScroll(DataSet: TDataSet);
begin
   entidade.CarregaDados;
end;

procedure TfCadOperSist.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
  Begin
    if (SB_CancCab.Enabled) then
    Begin
      key:=chr(0);
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
    end;
  end;
end;

end.
