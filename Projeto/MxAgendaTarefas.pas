unit MxAgendaTarefas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Menus, JPEG, Tarefa, Calendar, ComCtrls, Usuario, Parametro,
  DBCtrls, ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,
  ActnMenus;

type
  Conjunto = array [1..31] of Cardinal;
  TfMxAgendaTarefas = class(TForm)
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
    edtCodigoTAR: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    DSTarefa: TDataSource;
    Tarefa1: TTarefa;
    Label4: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    MonthCalendar1: TMonthCalendar;
    Tarefa2: TTarefa;
    edtUsuario: TEdit;
    Label5: TLabel;
    cmbPrioridade: TComboBox;
    Label6: TLabel;
    cmbSituacao: TComboBox;
    Label7: TLabel;
    cmbPeriodicidade: TComboBox;
    Label8: TLabel;
    Label10: TLabel;
    dblTipoTarefa: TDBLookupComboBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ckbTodos: TCheckBox;
    Label16: TLabel;
    mskDataFinal: TMaskEdit;
    Label17: TLabel;
    edtCodigoResponsavel: TEdit;
    edtUsuarioResponsavel: TEdit;
    Label18: TLabel;
    Tarefa1CNC_CODIGO: TIntegerField;
    Tarefa1TAR_CODIGO: TIntegerField;
    Tarefa1USU_CODIGO: TIntegerField;
    Tarefa1TAR_DT_CADASTRO: TDateTimeField;
    Tarefa1TAR_DT_ALTERADO: TDateTimeField;
    Tarefa1TAR_DT_AGENDADO: TDateTimeField;
    Tarefa1TAR_TIPO: TIntegerField;
    Tarefa1TAR_DESCRICAO: TStringField;
    Tarefa1TAR_PERIODICIDADE: TIntegerField;
    Tarefa1TAR_PRIORIDADE: TIntegerField;
    Tarefa1TAR_SITUACAO: TIntegerField;
    Tarefa1TAR_RESPONSAVEL: TIntegerField;
    Tarefa1TAR_DT_FINAL: TDateTimeField;
    Tarefa1Responsavel: TStringField;
    Label21: TLabel;
    edtCodigoOrigem: TEdit;
    edtDescricao: TEdit;
    Label22: TLabel;
    edtObservacao: TEdit;
    Tarefa1TAR_ORIGEM: TIntegerField;
    Tarefa1CNC_ORIGEM: TIntegerField;
    Tarefa1TAR_OBSERVACAO: TStringField;
    bitConfirmar: TBitBtn;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    Sair1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    btnRelatorio: TBitBtn;
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
    procedure Tarefa1AfterScroll(DataSet: TDataSet);
    procedure MonthCalendar1GetMonthInfo(Sender: TObject; Month: Cardinal;
      var MonthBoldInfo: Cardinal);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure VerificarDiasNegrito(PDataRef: TDateTime);
    procedure Tarefa1BeforeOpen(DataSet: TDataSet);
    procedure ckbTodosClick(Sender: TObject);
    procedure Tarefa1AfterOpen(DataSet: TDataSet);
    procedure cmbPeriodicidadeClick(Sender: TObject);
    procedure edtCodigoResponsavelExit(Sender: TObject);
    procedure Tarefa1CalcFields(DataSet: TDataSet);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure bitConfirmarClick(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TTarefa;
    MesSelecionado:Cardinal;
    DiasNegrito : Conjunto;
  end;

var
  fMxAgendaTarefas: TfMxAgendaTarefas;

implementation
Uses UDM,funcoes, MxFotoAmpliada, DateUtils, CdComunicacao, MxSelTarefa,
  MxSelPendencia;
{$R *.DFM}



procedure TfMxAgendaTarefas.SB_PrimClick(Sender: TObject);
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

procedure TfMxAgendaTarefas.SB_AntClick(Sender: TObject);
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

procedure TfMxAgendaTarefas.SB_ProxClick(Sender: TObject);
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

procedure TfMxAgendaTarefas.SB_UltClick(Sender: TObject);
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

procedure TfMxAgendaTarefas.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  Entidade.PreparaInsercao;
  dblTipoTarefa.KeyValue := 4580; //Ligar para Cliente
  AtualizaControles(1, True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtDescricao.SetFocus;
end;

procedure TfMxAgendaTarefas.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  Entidade.PreparaAlteracao;
  AtualizaControles(1, True);
  edtDescricao.SetFocus;
end;

procedure TfMxAgendaTarefas.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  Entidade.Deletarauto;
  if Entidade.IsEmpty then
  Begin
    edtUsuario.Clear;
    edtUsuarioResponsavel.Clear;
  end;
end;

procedure TfMxAgendaTarefas.SB_SalvaCabClick(Sender: TObject);
var
  vDtAux: TDateTime;
begin
  vDtAux := DM.Configuracao1.Data;
  If not Entidade.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');

  AtualizaControles(1, False);
  MonthCalendar1.Date := IncMonth(vDtAux);
  MonthCalendar1.Date := vDtAux;
end;

procedure TfMxAgendaTarefas.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  if Entidade.IsEmpty then
  Begin
    edtUsuario.Clear;
    edtUsuarioResponsavel.Clear;
  end;  
  AtualizaControles(1, False);
end;

procedure TfMxAgendaTarefas.FormCreate(Sender: TObject);
begin
  Entidade:=Tarefa1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_AgendaTar_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxAgendaTarefas.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  if not Entidade.Active then
    Exit;
  Entidade.Localizar;
end;

procedure TfMxAgendaTarefas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_AgendaTar_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxAgendaTarefas.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxAgendaTarefas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxAgendaTarefas.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  if self.Tag = 0 then
    bitConfirmar.Visible := False;

  MesSelecionado := 0;
  Parametro1.Open;
  MonthCalendar1.Date := IncMonth(DM.Configuracao1.Data);
  if self.Tag = 2 then //Comunicação Consulta
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TAR_DT_AGENDADO '+
        ' FROM TAREFA '+
        ' WHERE CNC_CODIGO='+fCadComunicacao.edtTarefaCNC.Text+
        ' AND TAR_CODIGO='+fCadComunicacao.edtCodigoTAR.Text;
      Open;
      if not IsEmpty then
        MonthCalendar1.Date := FieldByName('TAR_DT_AGENDADO').asDateTime
      else
        MonthCalendar1.Date := DM.Configuracao1.Data
    end;
  end
  else
    MonthCalendar1.Date := DM.Configuracao1.Data;
  Entidade.Open;

  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfMxAgendaTarefas.FormKeyPress(Sender: TObject; var Key: Char);
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
  else If key=chr(13) then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end
    else if bitConfirmar.Visible then
    Begin
      bitConfirmar.SetFocus;
      bitConfirmarClick(sender);
    end;
  end;
end;

procedure TfMxAgendaTarefas.Tarefa1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
  edtUsuarioResponsavel.Text := Entidade.FieldByName('Responsavel').asString;
end;

procedure TfMxAgendaTarefas.MonthCalendar1GetMonthInfo(Sender: TObject;
  Month: Cardinal; var MonthBoldInfo: Cardinal);
begin
  if MesSelecionado <> Month then
  Begin
    VerificarDiasNegrito(StrToDate('01/'+PreencheZero(2,Month)+'/'+formatDateTime('YYYY',MonthCalendar1.Date)));
    MonthCalendar1.BoldDays(DiasNegrito, MonthBoldInfo);
    MesSelecionado := Month;
  end;
end;

procedure TfMxAgendaTarefas.MonthCalendar1Click(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtUsuario.Clear;
    edtUsuarioResponsavel.Clear;
  end;
end;

procedure TfMxAgendaTarefas.VerificarDiasNegrito(PDataRef: TDateTime);
var
  cMes1, cMes2, cAno1, cAno2:string;
  i : integer;
Begin
  cMes1 := formatDateTime('mm',PDataRef);
  cAno1 := formatDateTime('yyyy',PDataRef);
  if StrToInt(cMes1) = 12 then
  Begin
    cMes2 := '01';
    cAno2 := IntToStr(StrToInt(cAno1)+1);
  end
  else
  Begin
    cMes2 := IntToStr(StrToInt(cMes1)+1);
    cAno2 := cAno1;
  end;
  Tarefa2.Close;
  Tarefa2.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  Tarefa2.ParamByName('DataINI').AsDate       := StrToDate('01/'+cMes1+'/'+cAno1);
  Tarefa2.ParamByName('DataFIM').AsDate       := StrToDate('01/'+cMes2+'/'+cAno2)-1;
  Tarefa2.ParamByName('USU_CODIGO').asInteger := DM.Configuracao1.CodigoUSU;
  Tarefa2.Open;
  for i:=1 to 31 do
    DiasNegrito[i]:=0;
  while not Tarefa2.Eof do
  Begin
    DiasNegrito[StrToInt(formatDateTime('dd',Tarefa2.DataAgendado))] :=
       StrToInt(formatDateTime('dd',Tarefa2.DataAgendado));
    Tarefa2.Next;
  end;
end;

procedure TfMxAgendaTarefas.Tarefa1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Entidade.ParamByName('USU_CODIGO').asInteger:=DM.Configuracao1.CodigoUSU;
  try
    Entidade.ParamByName('DataINI').AsDate:=MonthCalendar1.Date;
    Entidade.ParamByName('DataFIM').AsDate:=MonthCalendar1.Date+1;
  except
  end;
end;

procedure TfMxAgendaTarefas.ckbTodosClick(Sender: TObject);
begin
  Tarefa1.Close;
  if ckbTodos.Checked then
  Begin
    Tarefa1.SQL.Text:='SELECT * FROM TAREFA '+
    ' WHERE CNC_CODIGO=:CNC_CODIGO '+
    ' AND USU_CODIGO=:USU_CODIGO'+
    ' ORDER BY TAR_DT_AGENDADO, TAR_PRIORIDADE ASC';
  end
  else
  Begin
    Tarefa1.SQL.Text:='SELECT * FROM TAREFA '+
    ' WHERE TAR_DT_AGENDADO>=:DataINI '+
    ' AND TAR_DT_AGENDADO<:DataFIM '+
    ' AND CNC_CODIGO=:CNC_CODIGO '+
    ' AND USU_CODIGO=:USU_CODIGO'+
    ' ORDER BY TAR_DT_AGENDADO, TAR_PRIORIDADE ASC';
  end;
  Tarefa1.Open;
end;

procedure TfMxAgendaTarefas.Tarefa1AfterOpen(DataSet: TDataSet);
begin
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfMxAgendaTarefas.cmbPeriodicidadeClick(Sender: TObject);
begin
  if cmbPeriodicidade.Enabled then
  Begin
    if (cmbPeriodicidade.ItemIndex > 0) and //Mais que uma vez
       (Entidade.Estado = 1) then           //Inserção
    Begin
      mskDataFinal.Enabled := True;
      mskDataFinal.Text := DateToStr(MonthCalendar1.Date);
      mskDataFinal.SetFocus;
    end
    else
    Begin
      mskDataFinal.Enabled := False;
      mskDataFinal.Text := DateToStr(MonthCalendar1.Date);
    end;
  end;
end;

procedure TfMxAgendaTarefas.edtCodigoResponsavelExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtUsuarioResponsavel.Clear;

  if VerificaInteiroBranco(edtCodigoResponsavel.Text) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT USU_NOME '+
        ' FROM USUARIO '+
        ' WHERE USU_CODIGO='+edtCodigoResponsavel.Text;
      Open;
      edtUsuarioResponsavel.Text := FieldByName('USU_NOME').asString;
    end;
  end
  else
    edtUsuarioResponsavel.Text := '0';
end;

procedure TfMxAgendaTarefas.Tarefa1CalcFields(DataSet: TDataSet);
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT USU_NOME '+
      ' FROM USUARIO '+
      ' WHERE USU_CODIGO='+IntToStr(Entidade.CodigoResponsavel);
    Open;
    Entidade.FieldByName('Responsavel').asString := FieldByName('USU_NOME').asString;
  end;
end;

procedure TfMxAgendaTarefas.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  Sair1.Enabled         := not Habilitar;
  Incluir1.Enabled      := not Habilitar;
  Alterar1.Enabled      := not Habilitar;
  Excluir1.Enabled      := not Habilitar;
  Salvar1.Enabled       := ((Cabecalho=1) and Habilitar);
  Cancelar1.Enabled     := ((Cabecalho=1) and Habilitar);
  Localizar1.Enabled    := not Habilitar;
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

  bitConfirmar.Enabled := not Habilitar;

  DBGrid5.Enabled      := not Habilitar;
end;

procedure TfMxAgendaTarefas.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxAgendaTarefas.bitConfirmarClick(Sender: TObject);
begin
  if self.Tag = 1 then //Comunicação
  Begin
    fCadComunicacao.edtTarefaCNC.Text := IntToStr(Entidade.CodigoCNC);  
    fCadComunicacao.edtCodigoTAR.Text := IntToStr(Entidade.CodigoTAR);
  end
  else if self.Tag = 2 then //Comunicação Consulta
  Begin
    //Não é para fazer nada
  end;
  
  Close;
end;

procedure TfMxAgendaTarefas.DBGrid5DblClick(Sender: TObject);
var
  CdCNC, CdTAR: integer;
begin
  if Entidade.IsEmpty then
    Exit;

  CdCNC := Entidade.CodigoCNC;
  CdTAR := Entidade.CodigoTAR;

  ExecutaSQL(DM.QR_Comandos,'UPDATE TAREFA SET '+
    ' TAR_SITUACAO=2 '+
    ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
    ' AND TAR_CODIGO='+IntToStr(CdTAR));
end;

procedure TfMxAgendaTarefas.btnRelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TfMxSelTarefa,fMxSelTarefa);
  with fMxSelTarefa do
  Begin
    Tag:=0;
    DM.Usuario1.MDI(fMxSelTarefa);
    Show;
  end;
end;

end.
