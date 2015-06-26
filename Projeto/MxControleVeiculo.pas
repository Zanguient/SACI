unit MxControleVeiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Grupo, Menus, JPEG, SubGrupo, Veiculo, Controle_de_Veiculo;

type
  TfMxControleVeiculo = class(TForm)
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
    edtDetalhe: TEdit;
    edtCodigoMTV: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    DSControle_de_Veiculo1: TDataSource;
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
    Bevel1: TBevel;
    Label24: TLabel;
    imgVeiculo: TImage;
    Label4: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    edtObservacao: TEdit;
    Label26: TLabel;
    mskPlaca: TMaskEdit;
    Label5: TLabel;
    edtKilometragemINI: TEdit;
    Label6: TLabel;
    edtKilometragemFIM: TEdit;
    Label7: TLabel;
    edtQuantidade: TEdit;
    Label8: TLabel;
    edtValorTotal: TEdit;
    Controle_de_Veiculo1: TControle_de_Veiculo;
    Label9: TLabel;
    edtCodigoVEI: TEdit;
    edtMarcaModelo: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    cmbTipo: TComboBox;
    Controle_de_Veiculo1CNC_ORIGEM: TIntegerField;
    Controle_de_Veiculo1CNC_CODIGO: TIntegerField;
    Controle_de_Veiculo1MTV_CODIGO: TIntegerField;
    Controle_de_Veiculo1USU_CODIGO: TIntegerField;
    Controle_de_Veiculo1VEI_CODIGO: TIntegerField;
    Controle_de_Veiculo1MTV_DT_CADASTRO: TDateTimeField;
    Controle_de_Veiculo1MTV_DT_ALTERADO: TDateTimeField;
    Controle_de_Veiculo1MTV_PLACA: TStringField;
    Controle_de_Veiculo1MTV_KILOMETRAGEM_INI: TIntegerField;
    Controle_de_Veiculo1MTV_KILOMETRAGEM_FIM: TIntegerField;
    Controle_de_Veiculo1MTV_TIPO: TIntegerField;
    Controle_de_Veiculo1MTV_DETALHE: TStringField;
    Controle_de_Veiculo1MTV_QUANTIDADE: TFloatField;
    Controle_de_Veiculo1MTV_VALOR_TOTAL: TFloatField;
    Controle_de_Veiculo1MTV_SITUACAO: TIntegerField;
    Controle_de_Veiculo1MTV_OBSERVACAO: TStringField;
    Controle_de_Veiculo1MarcaModelo: TStringField;
    Imprimir1: TMenuItem;
    Controle_de_Veiculo1MTV_DT_INICIAL: TDateTimeField;
    Controle_de_Veiculo1MTV_DT_FINAL: TDateTimeField;
    Label13: TLabel;
    mskDataInicial: TMaskEdit;
    Label14: TLabel;
    mskDataFinal: TMaskEdit;
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
    procedure imgVeiculoDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Controle_de_Veiculo1AfterScroll(DataSet: TDataSet);
    procedure edtCodigoVEIExit(Sender: TObject);
    procedure Controle_de_Veiculo1BeforeOpen(DataSet: TDataSet);
    procedure Controle_de_Veiculo1CalcFields(DataSet: TDataSet);
    procedure edtKilometragemINIExit(Sender: TObject);
    procedure cmbTipoClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure Imprimir1Click(Sender: TObject);
    procedure edtCodigoVEIKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade: TControle_de_Veiculo;
  end;

var
  fMxControleVeiculo: TfMxControleVeiculo;

implementation
Uses UDM,funcoes, MxFotoAmpliada, UComprovanteControleVeiculo, CdVeiculo;
{$R *.DFM}



procedure TfMxControleVeiculo.SB_PrimClick(Sender: TObject);
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

procedure TfMxControleVeiculo.SB_AntClick(Sender: TObject);
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

procedure TfMxControleVeiculo.SB_ProxClick(Sender: TObject);
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

procedure TfMxControleVeiculo.SB_UltClick(Sender: TObject);
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

procedure TfMxControleVeiculo.AtualizaControles(Habilitar:Boolean);
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

  mskPlaca.Enabled := False;

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

procedure TfMxControleVeiculo.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8480)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  cmbTipoClick(sender);
  cmbTipo.SetFocus;
end;

procedure TfMxControleVeiculo.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8490)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtDetalhe.SetFocus;
end;

procedure TfMxControleVeiculo.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8500)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.Deletar(Entidade.CodigoCNC, Entidade.CodigoMTV);
  if Entidade.IsEmpty then
    edtMarcaModelo.Clear;
end;

procedure TfMxControleVeiculo.SB_SalvaCabClick(Sender: TObject);
begin
  If not Entidade.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');

  AtualizaControles(False);

  //Imprimir Comprovante
  Application.CreateForm(Trpt_ComprovanteControleVeiculo, rpt_ComprovanteControleVeiculo);
  with rpt_ComprovanteControleVeiculo do
  Begin
    Tag := 0;
    Entidade.CLose;
    Entidade.ParamByName('CNC_CODIGO').asInteger := self.Entidade.CodigoCNC;
    Entidade.ParamByName('MTV_CODIGO').asInteger := self.Entidade.CodigoMTV;
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxControleVeiculo.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
    edtMarcaModelo.Clear;
end;

procedure TfMxControleVeiculo.FormCreate(Sender: TObject);
begin
  Entidade := Controle_de_Veiculo1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_ContVEI_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxControleVeiculo.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Selecionar;
  if Entidade.isEmpty then
  Begin
    Entidade.LimpaCampos;
    edtMarcaModelo.Clear;
  end;
end;

procedure TfMxControleVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Entidade.SGravarGrid(Entidade.EDbgrid,'COL_ContVEI_');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxControleVeiculo.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxControleVeiculo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxControleVeiculo.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbCampo.ItemIndex := 1;

  Entidade.Close;
  Entidade.SQL.Text := 'SELECT * '+
    ' FROM CONTROLE_VEICULO '+
    ' WHERE CNC_CODIGO=:CNC_CODIGO '+
    ' AND (MTV_SITUACAO=2 '+
    '  OR  MTV_DT_CADASTRO>="'+MesDia(DM.Configuracao1.Data)+'" '+
    '  OR  MTV_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'") ';
  Entidade.Open;
  edtLocalizar.SetFocus;
end;

procedure TfMxControleVeiculo.imgVeiculoDblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=imgVeiculo.Picture;
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxControleVeiculo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    Key := #0;
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
    Key := #0;
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfMxControleVeiculo.Controle_de_Veiculo1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtMarcaModelo.Text := Entidade.FieldByName('MarcaModelo').asString;
end;

procedure TfMxControleVeiculo.edtCodigoVEIExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtMarcaModelo.Clear;
  try
    if StrToInt(edtCodigoVEI.Text) = 0 then
    Begin
      if cmbTipo.ItemIndex = 0 then
      Begin
        ShowMessage('Não é possível o controle de kilometragem para veículos não cadastrados!');
        edtCodigoVEI.SetFocus;
        Exit;
      end;
      mskPlaca.Enabled := True;
      mskPlaca.SetFocus;
      if Length(mskPlaca.Text) = 8 then
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT * FROM VEICULO '+
            ' WHERE VEI_PLACA="'+mskPlaca.Text+'" ';
          Open;
          edtMarcaModelo.Text := Trim(FieldByName('VEI_MARCA').asString+' '+FieldByName('VEI_MODELO').asString);
        end;
      end;
    end
    else
    Begin
      mskPlaca.Enabled := False;
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM VEICULO '+
          ' WHERE VEI_CODIGO='+edtCodigoVEI.Text;
        Open;
        mskPlaca.Text := FieldByName('VEI_PLACA').asString;
        edtMarcaModelo.Text := Trim(FieldByName('VEI_MARCA').asString+' '+FieldByName('VEI_MODELO').asString);
      end;
    end;
  except
    mskPlaca.Enabled := False;
  end;
end;

procedure TfMxControleVeiculo.Controle_de_Veiculo1BeforeOpen(
  DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
end;

procedure TfMxControleVeiculo.Controle_de_Veiculo1CalcFields(
  DataSet: TDataSet);
begin
  with DM.QR_Consultas do
  Begin
    Close;
    if Entidade.CodigoVEI > 0 then
      SQL.Text := 'SELECT * FROM VEICULO '+
        ' WHERE VEI_CODIGO='+IntToStr(Entidade.CodigoVEI)
    else
      SQL.Text := 'SELECT * FROM VEICULO '+
        ' WHERE VEI_PLACA="'+Entidade.Placa+'" ';
    Open;
    Entidade.FieldByName('MarcaModelo').asString := Trim(FieldByName('VEI_MARCA').asString+' '+FieldByName('VEI_MODELO').asString);
  end;
end;

procedure TfMxControleVeiculo.edtKilometragemINIExit(Sender: TObject);
begin
  if (cmbTipo.ItemIndex <> 0) and
     (edtKilometragemFIM.Enabled) then
    edtKilometragemFIM.Text := edtKilometragemINI.Text;
end;

procedure TfMxControleVeiculo.cmbTipoClick(Sender: TObject);
begin
  if cmbTipo.Enabled then
  Begin
    if cmbTipo.ItemIndex = 0 then
    Begin
      if (edtDetalhe.Text = '') or
         (edtDetalhe.Text = 'ABASTECIMENTO') or
         (edtDetalhe.Text = 'LUBRIFICANTE') or
         (edtDetalhe.Text = 'MANUTENCAO') then
        edtDetalhe.Text := 'CONTROLE CONSUMO';
      edtQuantidade.Enabled := False;
      edtQuantidade.Text := '0,00';
      edtValorTotal.Enabled := False;
      edtValorTotal.Text := '0,00';
      edtKilometragemFIM.Enabled := True; //Para alterar o Campo Tipo está False
    end
    else
    Begin
      if (edtDetalhe.Text = '') or
         (edtDetalhe.Text = 'CONTROLE CONSUMO') or
         (edtDetalhe.Text = 'ABASTECIMENTO') or
         (edtDetalhe.Text = 'LUBRIFICANTE') or
         (edtDetalhe.Text = 'MANUTENCAO') then
      Begin
        case cmbTipo.ItemIndex of
          1,2,3,4: edtDetalhe.Text := 'ABASTECIMENTO';
          5      : edtDetalhe.Text := 'LUBRIFICANTE';
          6      : edtDetalhe.Text := 'MANUTENCAO';
        end;
      end;
      edtKilometragemFIM.Enabled := False;
      edtKilometragemFIM.Text := '0';
      edtQuantidade.Enabled := True;
      edtValorTotal.Enabled := True;
    end;
  end;
end;

procedure TfMxControleVeiculo.DBGrid5TitleClick(Column: TColumn);
begin
  if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
    Exit;
  Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
end;

procedure TfMxControleVeiculo.Imprimir1Click(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Controle de Movimento de Veículos!');

  //Imprimir Comprovante
  Application.CreateForm(Trpt_ComprovanteControleVeiculo, rpt_ComprovanteControleVeiculo);
  with rpt_ComprovanteControleVeiculo do
  Begin
    Tag := 0;
    Entidade.CLose;
    Entidade.ParamByName('CNC_CODIGO').asInteger := self.Entidade.COdigoCNC;
    Entidade.ParamByName('MTV_CODIGO').asInteger := self.Entidade.COdigoMTV;
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxControleVeiculo.edtCodigoVEIKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #32 then
  Begin
    Key := #0;
    Application.CreateForm(TfCadVeiculo, fCadVeiculo);
    with fCadVeiculo do
    Begin
      Tag := 1;
      ShowModal;
    end;
  end;
end;

end.
