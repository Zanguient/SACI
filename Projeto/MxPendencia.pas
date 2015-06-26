unit MxPendencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Grupo, Menus, JPEG, SubGrupo, Pendencias, DBCtrls, Vendedor,
  Parametro, Forma_de_Pagamento, AgenteFin, CentroCusto;

type
  TfMxPendencia = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    edtDescricao: TEdit;
    edtCodigoPEN: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    DSPendencias1: TDataSource;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Clientes1: TMenuItem;
    IncluirCab: TMenuItem;
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
    Pendencias1: TPendencias;
    Panel2: TPanel;
    Label16: TLabel;
    dblCodigoCNC: TDBLookupComboBox;
    Label5: TLabel;
    cmbFiltroSituacao: TComboBox;
    DSAgenteFin1: TDataSource;
    DSForma_de_Pagamento1: TDataSource;
    AgenteFin1: TAgenteFin;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    Label28: TLabel;
    Label6: TLabel;
    Label26: TLabel;
    dblTipoPagamento: TDBLookupComboBox;
    dblFormaPagamento: TDBLookupComboBox;
    dblCodigoAGF: TDBLookupComboBox;
    Label21: TLabel;
    edtCodigoPDV: TEdit;
    Label10: TLabel;
    edtDataHora: TEdit;
    Label7: TLabel;
    edtCodigoCLI: TEdit;
    edtClienteCNC: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtRazaoSocial: TEdit;
    mskCNPJCPF: TMaskEdit;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    Label22: TLabel;
    dblCodigoFUN: TDBLookupComboBox;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    Label13: TLabel;
    Label14: TLabel;
    Label24: TLabel;
    edtCodigoPRD1: TEdit;
    edtProduto1: TEdit;
    edtPrecoSugestao1: TEdit;
    Label17: TLabel;
    edtPrecoPRD1: TEdit;
    Label18: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    edtCodigoPRD2: TEdit;
    edtProduto2: TEdit;
    edtPrecoSugestao2: TEdit;
    Label29: TLabel;
    edtPrecoPRD2: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edtCodigoPRD3: TEdit;
    edtProduto3: TEdit;
    edtPrecoSugestao3: TEdit;
    Label33: TLabel;
    edtPrecoPRD3: TEdit;
    Label34: TLabel;
    edtCodigoTRC: TEdit;
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel1: TPanel;
    SB_LocCab: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_Desativar: TSpeedButton;
    SB_Autorizar: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SB_CancCab: TBitBtn;
    Label35: TLabel;
    edtDescricaoTRC: TEdit;
    Label36: TLabel;
    edtTRCComJuros: TEdit;
    Label37: TLabel;
    edtValorTRC: TEdit;
    cmbTipo: TComboBox;
    Label38: TLabel;
    Label39: TLabel;
    mskDataReferencia: TMaskEdit;
    edtPedidoCNC: TEdit;
    Pendencias1CNC_ORIGEM: TIntegerField;
    Pendencias1CNC_CODIGO: TIntegerField;
    Pendencias1PEN_CODIGO: TIntegerField;
    Pendencias1USU_CODIGO: TIntegerField;
    Pendencias1FUN_CODIGO: TIntegerField;
    Pendencias1PEN_DT_CADASTRO: TDateTimeField;
    Pendencias1PEN_DT_ALTERADO: TDateTimeField;
    Pendencias1PEN_DT_REFERENCIA: TDateTimeField;
    Pendencias1PEN_TIPO: TIntegerField;
    Pendencias1PEN_DESCRICAO: TStringField;
    Pendencias1CLI_CODIGO: TIntegerField;
    Pendencias1CNC_CLIENTE: TIntegerField;
    Pendencias1PDV_CODIGO: TIntegerField;
    Pendencias1CNC_PEDIDO: TIntegerField;
    Pendencias1PEN_TIPO_PAG: TIntegerField;
    Pendencias1FPG_CODIGO: TIntegerField;
    Pendencias1AGF_CODIGO: TIntegerField;
    Pendencias1PRD_CODIGO_1: TIntegerField;
    Pendencias1PEN_PRECO_PRD1: TFloatField;
    Pendencias1PRD_CODIGO_2: TIntegerField;
    Pendencias1PEN_PRECO_PRD2: TFloatField;
    Pendencias1PRD_CODIGO_3: TIntegerField;
    Pendencias1PEN_PRECO_PRD3: TFloatField;
    Pendencias1TRC_CODIGO: TIntegerField;
    Pendencias1PEN_VALOR_TRC: TFloatField;
    Pendencias1PEN_USU_LIBEROU: TIntegerField;
    Pendencias1PEN_CAMPO_VERIFICADOR: TStringField;
    Pendencias1PEN_SITUACAO: TIntegerField;
    Pendencias1PEN_OBSERVACAO: TStringField;
    Pendencias1DataPedido: TStringField;
    Pendencias1Cliente: TStringField;
    Pendencias1Preco1: TStringField;
    Pendencias1Preco2: TStringField;
    Pendencias1Preco3: TStringField;
    Pendencias1ValorTRC: TStringField;
    Pendencias1CPF: TStringField;
    Pendencias1Produto1: TStringField;
    Pendencias1Produto2: TStringField;
    Pendencias1Produto3: TStringField;
    Pendencias1Titulo: TStringField;
    Label11: TLabel;
    mskFiltroData: TMaskEdit;
    imprimir1: TMenuItem;
    Desativar1: TMenuItem;
    Autorizar1: TMenuItem;
    Label40: TLabel;
    cmbCreditoExtorno: TComboBox;
    Pendencias1PEN_CREDITO_EXTORNO: TIntegerField;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_DesativarClick(Sender: TObject);
    procedure Pendencias1AfterScroll(DataSet: TDataSet);
    procedure Pendencias1BeforeOpen(DataSet: TDataSet);
    procedure SB_AutorizarClick(Sender: TObject);
    procedure dblCodigoCNCClick(Sender: TObject);
    procedure cmbFiltroSituacaoClick(Sender: TObject);
    procedure edtCodigoPDVKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPDVExit(Sender: TObject);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure edtCodigoPRD1Exit(Sender: TObject);
    procedure edtCodigoPRD2Exit(Sender: TObject);
    procedure edtCodigoPRD3Exit(Sender: TObject);
    procedure edtCodigoTRCExit(Sender: TObject);
    procedure cmbTipoClick(Sender: TObject);
    procedure Vendedor1BeforeOpen(DataSet: TDataSet);
    procedure Pendencias1CalcFields(DataSet: TDataSet);
    procedure mskFiltroDataExit(Sender: TObject);
    procedure imprimir1Click(Sender: TObject);
    procedure edtCodigoPRD1KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRD2KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRD3KeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    procedure LimpaCamposCadastro;
    { Private declarations }
  public
    CancelarLoc: Boolean;
    Entidade:TPendencias;
  end;

var
  fMxPendencia: TfMxPendencia;

implementation
Uses UDM,funcoes, MxSPediLoc, UPendencia, MxSPediProdMotCal, MxSPediProd;
{$R *.DFM}



procedure TfMxPendencia.SB_PrimClick(Sender: TObject);
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

procedure TfMxPendencia.SB_AntClick(Sender: TObject);
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

procedure TfMxPendencia.SB_ProxClick(Sender: TObject);
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

procedure TfMxPendencia.SB_UltClick(Sender: TObject);
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

procedure TfMxPendencia.AtualizaControles(Habilitar:Boolean);
begin
  dblCodigoCNC.Enabled:=not habilitar;
  cmbFiltroSituacao.Enabled:=not habilitar;
  mskFiltroData.Enabled:=not habilitar;
  SB_Desativar.Enabled:=not habilitar;
  SB_Autorizar.Enabled:=not habilitar;

  SairCab.Enabled:=not habilitar;
  IncluirCab.Enabled:=not habilitar;
  LocalizarCab.Enabled:=not habilitar;
  SalvarCab.Enabled:=habilitar;
  CancelarCab.Enabled:=habilitar;
  SB_Prim.Enabled:=not habilitar;
  SB_Ant.Enabled:=not habilitar;
  SB_Prox.Enabled:=not habilitar;
  SB_Ult.Enabled:=not habilitar;
  SB_NovoCab.Enabled:=not habilitar;
  SB_LocCab.Enabled:=not habilitar;
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

  if not Habilitar then
  Begin
    edtCodigoPRD1.Enabled := False;
    edtPrecoPRD1.Enabled := False;
    edtCodigoPRD2.Enabled := False;
    edtPrecoPRD2.Enabled := False;
    edtCodigoPRD3.Enabled := False;
    edtPrecoPRD3.Enabled := False;
    edtCodigoTRC.Enabled := False;
    edtValorTRC.Enabled := False;
  end;
end;

procedure TfMxPendencia.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');

  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8860)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');

  if (DM.Configuracao1.CodigoCNC <> dblCodigoCNC.KeyValue) and
     (not DM.Configuracao1.CPD) then
    raise Exception.Create('Criar Pendência de outro centro somente no CPD!');

  if cmbFiltroSituacao.ItemIndex <> 0 then
  Begin
    cmbFiltroSituacao.ItemIndex := 0;
    cmbFiltroSituacaoClick(sender);
  end;

  LimpaCamposCadastro;
  Entidade.PreparaInsercao;
  edtPedidoCNC.Text  := IntToStr(dblCodigoCNC.KeyValue);
  edtClienteCNC.Text := IntToStr(dblCodigoCNC.KeyValue);
  AtualizaControles(true);
  cmbTipoClick(sender);
  edtDescricao.SetFocus;
end;

procedure TfMxPendencia.SB_SalvaCabClick(Sender: TObject);
begin
  If Entidade.FinalizaEdicao then
    AtualizaControles(False)
  else                                    
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxPendencia.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
    LimpaCamposCadastro;
end;

procedure TfMxPendencia.FormCreate(Sender: TObject);
begin
  Entidade:=Pendencias1;
end;

procedure TfMxPendencia.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfMxPendencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfMxPendencia.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxPendencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxPendencia.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto2.Open;
  Parametro1.Open; //Tipo de Pagamento
  Forma_de_Pagamento1.Open;
  AgenteFin1.Open;

  cmbFiltroSituacao.ItemIndex := 0;
  mskFiltroData.Text := DateToStr(IncMonth(Now,-1));

  dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
  dblCodigoCNCClick(sender);
  
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfMxPendencia.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMxPendencia.SB_DesativarClick(Sender: TObject);
var
  CdCNCOrigem, CdCNC, CdPEN, CdPEC: integer;
  Trans: Boolean;
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8870)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para desativar pendência!');

  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');

  if Entidade.Situacao <> 0 then
    Raise exception.Create('Não pode ser desativado!');

  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise exception.Create('Precisa está no centro original!');

  if (DM.Usuario1.CentroDeCusto <> Entidade.CNCOrigem) and
     (not DM.Configuracao1.CPD) then
    Raise exception.Create('Registro criado em outro centro de custo!');

  If MessageDlg('Deseja desativar o registro?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdCNCOrigem := Entidade.CNCOrigem;
  CdCNC := Entidade.CodigoCNC;
  CdPEN := Entidade.CodigoPEN;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      ExecutaSQL(DM.QR_Comandos, 'UPDATE PENDENCIA SET '+
        ' PEN_SITUACAO=1 '+
        ' WHERE CNC_ORIGEM='+IntToStr(CdCNCOrigem)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PEN_CODIGO='+IntToStr(CdPEN));

      if DM.Usuario1.CentroDeCusto <> Entidade.CNCOrigem then
      Begin
        CdPEC := DM.Configuracao1.ProximoCodigo('PEC_CODIGO');
        ExecutaSQL(DM.QR_Comandos, 'INSERT INTO PENDENCIA_CPD ('+
          ' CNC_ORIGEM, CNC_CODIGO, PEC_CODIGO, USU_CODIGO '+
          ',PEC_DT_CADASTRO, CNC_PENDENCIA, PEN_CODIGO, PEC_CAMPO_VERIFICADOR, PEC_SITUACAO) VALUES '+
          ' ('+IntToStr(Entidade.CentroDeCusto)+
          ', '+IntToStr(CdCNC)+
          ', '+IntToStr(CdPEC)+
          ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
          ',"'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ', '+IntToStr(CdCNC)+
          ', '+IntToStr(CdPEN)+
          ',"'+MontarCampoVerificador(DM.QR_Consultas, CdCNCOrigem, CdCNC, CdPEN)+'" '+
          ',1) '); //Situação Desativado
      end;

      if not Entidade.GeraLog(8870, CdCNC, CdPEN) then
        Raise exception.Create('');

      Commit;
      Trans := False;
      ShowMessage('Pendência desativada!');
      Entidade.Close;
      Entidade.Open;
      if Entidade.IsEmpty then
        LimpaCamposCadastro;

    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  end;
end;

procedure TfMxPendencia.Pendencias1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtDataHora.Text := Entidade.FieldByName('DataPedido').asString;
  edtRazaoSocial.Text := Entidade.FieldByName('Cliente').asString;
  mskCNPJCPF.Text := Entidade.FieldByName('CPF').asString;
  edtProduto1.Text := Entidade.FieldByName('Produto1').asString;
  edtPrecoSugestao1.Text := Entidade.FieldByName('Preco1').asString;
  edtProduto2.Text := Entidade.FieldByName('Produto2').asString;
  edtPrecoSugestao2.Text := Entidade.FieldByName('Preco2').asString;
  edtProduto3.Text := Entidade.FieldByName('Produto3').asString;
  edtPrecoSugestao3.Text := Entidade.FieldByName('Preco3').asString;
  edtDescricaoTRC.Text := Entidade.FieldByName('Titulo').asString;
  edtTRCComJuros.Text := Entidade.FieldByName('ValorTRC').asString;
end;

procedure TfMxPendencia.Pendencias1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger := dblCodigoCNC.KeyValue;
  except
    Entidade.ParamByName('CNC_CODIGO').asInteger := -1;
  end;
  try
    Entidade.ParamByName('PEN_SITUACAO').asInteger := cmbFiltroSituacao.ItemIndex;
  except
    Entidade.ParamByName('PEN_SITUACAO').asInteger := -1;
  end;
  try
    Entidade.ParamByName('DT_INI').asDateTime := StrToDate(mskFiltroData.Text);
  except
    Entidade.ParamByName('DT_INI').asDateTime := 0;
  end;
end;

procedure TfMxPendencia.SB_AutorizarClick(Sender: TObject);
var
  CdCNCOrigem, CdCNC, CdPEN, CdPEC: integer;
  Trans: Boolean;
  sDetalhe: string;
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8880)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para desativar pendência!');

  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');

  if Entidade.Situacao <> 0 then
    Raise exception.Create('Já autorizado ou desativado!');

  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise exception.Create('Precisa está no centro original!');

  if not DM.Configuracao1.CPD then
    Raise exception.Create('Somente no CPD!');

  If MessageDlg('Deseja autorizar a pendência?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdCNCOrigem := Entidade.CNCOrigem;
  CdCNC := Entidade.CodigoCNC;
  CdPEN := Entidade.CodigoPEN;
  CdPEC := DM.Configuracao1.ProximoCodigo('PEC_CODIGO');

  with Entidade do
    sDetalhe := 'PDV:'+IntToStr(CodigoPDV)+
                ' CLI:'+IntToStr(CodigoCLI)+
                ' TRC:'+IntToStr(CodigoTRC)+
                ' '+Format('%.2f',[ValorTRC])+
                ' PRD:'+IntToStr(CodigoPRD1)+
                ' '+Format('%.2f',[PrecoPRD1])+
                ' PRD:'+IntToStr(CodigoPRD2)+
                ' '+Format('%.2f',[PrecoPRD2])+
                ' PRD:'+IntToStr(CodigoPRD3)+
                ' '+Format('%.2f',[PrecoPRD3])+
                ' DESC:'+Descricao;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      ExecutaSQL(DM.QR_Comandos, 'UPDATE PENDENCIA SET '+
        ' PEN_SITUACAO=2 '+
        ',PEN_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PEN_USU_LIBEROU='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ' WHERE CNC_ORIGEM='+IntToStr(CdCNCOrigem)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PEN_CODIGO='+IntToStr(CdPEN));

      ExecutaSQL(DM.QR_Comandos, 'INSERT INTO PENDENCIA_CPD ('+
        ' CNC_ORIGEM, CNC_CODIGO, PEC_CODIGO, USU_CODIGO '+
        ',PEC_DT_CADASTRO, CNC_PENDENCIA, PEN_CODIGO, PEC_CAMPO_VERIFICADOR, PEC_SITUACAO) VALUES '+
        ' ('+IntToStr(Entidade.CentroDeCusto)+
        ', '+IntToStr(CdCNC)+
        ', '+IntToStr(CdPEC)+
        ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',"'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ', '+IntToStr(CdCNC)+
        ', '+IntToStr(CdPEN)+
        ',"'+MontarCampoVerificador(DM.QR_Consultas, CdCNCOrigem, CdCNC, CdPEN)+'" '+
        ',2) '); //Situação

      if not Entidade.GeraLog(8880, CdCNC, CdPEN, sDetalhe) then
        Raise exception.Create('');

      Commit;
      Trans := False;
      ShowMessage('Pendência autorizada!');
      Entidade.Close;
      Entidade.Open;
      if Entidade.IsEmpty then
        LimpaCamposCadastro;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  end;
end;

procedure TfMxPendencia.dblCodigoCNCClick(Sender: TObject);
begin
  Vendedor1.Close;
  Entidade.Close;
  Entidade.Open;
  Vendedor1.Open;
  if Entidade.IsEmpty then
    LimpaCamposCadastro;
end;

procedure TfMxPendencia.cmbFiltroSituacaoClick(Sender: TObject);
begin
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    LimpaCamposCadastro;
end;

procedure TfMxPendencia.edtCodigoPDVKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    cancelarloc:=false;
    Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
    fMxSPedLoc.tag:=15;
    fMxSPedLoc.sFiltrarServico := ' AND (PDV_SERVICO=0 OR PDV_SERVICO IS NULL) ';
    fMxSPedLoc.Showmodal;
    If not cancelarloc Then
    Begin
      if edtCodigoPRD1.Enabled then
        edtCodigoPRD1.SetFocus
      else if edtCodigoTRC.Enabled then
        edtCodigoTRC.SetFocus
      else
        edtObservacao.SetFocus;
    end;
  end;
end;

procedure TfMxPendencia.edtCodigoPDVExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtDataHora.Clear;
  dblTipoPagamento.KeyValue := 0;
  dblFormaPagamento.KeyValue := 0;
  dblCodigoAGF.KeyValue := 0;
  edtCodigoCLI.Clear;
  edtCodigoCLIExit(sender);
  edtCodigoPRD1.Clear;

  if (edtCodigoPDV.Text = '') or
     (edtCodigoPDV.Text = '0') then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
  Begin
    edtCodigoPDV.SetFocus;
    Raise exception.Create('Código do Pedido inválido!');
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_DATA_HORA, PDV_TIPO_PAG, FPG_CODIGO, AGF_CODIGO, CNC_CLIENTE, CLI_CODIGO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+edtPedidoCNC.Text+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text;
    Open;
    if not isEmpty then
    Begin
      edtDataHora.Text := FormatDateTime('DD/MM/YYY HH:MM',FieldByName('PDV_DATA_HORA').asDateTime);
      dblTipoPagamento.KeyValue := FieldByName('PDV_TIPO_PAG').asInteger;
      dblFormaPagamento.KeyValue := FieldByName('FPG_CODIGO').asInteger;
      dblCodigoAGF.KeyValue := FieldByName('AGF_CODIGO').asInteger;
      edtClienteCNC.Text := FieldByName('CNC_CLIENTE').asString;
      edtCodigoCLI.Text := FieldByName('CLI_CODIGO').asString;
    end
    else
    Begin
      edtDataHora.Clear;
      dblTipoPagamento.KeyValue := -1;
      dblFormaPagamento.KeyValue := -1;
      dblCodigoAGF.KeyValue := -1;
    end;
    edtCodigoCLIExit(sender);
  end;
end;

procedure TfMxPendencia.edtCodigoCLIExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtRazaoSocial.Clear;
  mskCNPJCPF.Clear;

  if (edtCodigoCLI.Text = '') then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
  Begin
    edtCodigoPDV.SetFocus;
    Raise exception.Create('Código do pedido inválido!');
  end;

  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
  Begin
    edtCodigoCLI.SetFocus;
    Raise exception.Create('Código do Cliente inválido!');
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CLI_RZ_SOCIAL, CLI_PESSOA_FISICA, CLI_CGC_CPF '+
      ' FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+edtClienteCNC.Text+
      ' AND CLI_CODIGO='+edtCodigoCLI.Text;
    Open;
    edtRazaoSocial.Text := FieldByName('CLI_RZ_SOCIAL').AsString;
    if FieldByName('CLI_PESSOA_FISICA').AsInteger = 1 then
      mskCNPJCPF.EditMask := '999-999-999-99;0;_'
    else
      mskCNPJCPF.EditMask := '99-999-999/9999-99;0;_';
    mskCNPJCPF.Text := FieldByName('CLI_CGC_CPF').AsString;
  end;
end;

procedure TfMxPendencia.edtCodigoPRD1Exit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtProduto1.Clear;
  edtPrecoSugestao1.Clear;
  edtPrecoPRD1.Clear;

  if (edtCodigoPRD1.Text = '') or
     (edtCodigoPRD1.Text = '0') then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
  Begin
    edtCodigoPDV.SetFocus;
    Raise exception.Create('Código do pedido inválido!');
  end;

  if not VerificaInteiroBranco(edtCodigoPRD1.Text) then
  Begin
    edtCodigoPRD1.SetFocus;
    Raise exception.Create('Código do Produto1 inválido!');
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PRD_DESCRICAO, PRD_CARACTERISTICA, PRD_PRECO_VENDA '+
      ' FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD1.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoPRD1.SetFocus;
      Raise exception.Create('Produto não existe!');
    end;
    edtProduto1.Text := FieldByName('PRD_DESCRICAO').AsString+' '+
                        FieldByName('PRD_CARACTERISTICA').AsString;
    if StrToInt(edtCodigoPDV.Text) > 0 then
    Begin
      Close;
      SQL.Text := 'SELECT IPV_PRECO_SUGERIDO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+edtPedidoCNC.Text+
        ' AND PDV_CODIGO='+edtCodigoPDV.Text+
        ' AND PRD_CODIGO='+edtCodigoPRD1.Text;
      Open;
      if isEmpty then
      Begin
        edtCodigoPRD1.SetFocus;
        Raise exception.Create('Produto não existe nesse pedido!');
      end;
      edtPrecoSugestao1.Text := Format('%.2f',[FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
    end
    else
      edtPrecoSugestao1.Text := '0,00';
  end;
end;

procedure TfMxPendencia.edtCodigoPRD2Exit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtProduto2.Clear;
  edtPrecoSugestao2.Clear;
  edtPrecoPRD2.Clear;

  if (edtCodigoPRD2.Text = '') or
     (edtCodigoPRD2.Text = '0') then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
  Begin
    edtCodigoPDV.SetFocus;
    Raise exception.Create('Código do pedido inválido!');
  end;

  if not VerificaInteiroBranco(edtCodigoPRD2.Text) then
  Begin
    edtCodigoPRD2.SetFocus;
    Raise exception.Create('Código do Produto1 inválido!');
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD2.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoPRD2.SetFocus;
      Raise exception.Create('Produto não existe!');
    end;
    edtProduto2.Text := FieldByName('PRD_DESCRICAO').AsString+' '+
                        FieldByName('PRD_CARACTERISTICA').AsString;
    Close;
    SQL.Text := 'SELECT IPV_PRECO_SUGERIDO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+edtPedidoCNC.Text+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text+
      ' AND PRD_CODIGO='+edtCodigoPRD2.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoPRD2.SetFocus;
      Raise exception.Create('Produto não existe nesse pedido!');
    end;
    edtPrecoSugestao2.Text := Format('%.2f',[FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
  end;
end;

procedure TfMxPendencia.edtCodigoPRD3Exit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtProduto3.Clear;
  edtPrecoSugestao3.Clear;
  edtPrecoPRD3.Clear;

  if (edtCodigoPRD3.Text = '') or
     (edtCodigoPRD3.Text = '0') then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
  Begin
    edtCodigoPDV.SetFocus;
    Raise exception.Create('Código do pedido inválido!');
  end;

  if not VerificaInteiroBranco(edtCodigoPRD3.Text) then
  Begin
    edtCodigoPRD3.SetFocus;
    Raise exception.Create('Código do Produto1 inválido!');
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD3.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoPRD3.SetFocus;
      Raise exception.Create('Produto não existe!');
    end;
    edtProduto3.Text := FieldByName('PRD_DESCRICAO').AsString+' '+
                        FieldByName('PRD_CARACTERISTICA').AsString;
    Close;
    SQL.Text := 'SELECT IPV_PRECO_SUGERIDO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+edtPedidoCNC.Text+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text+
      ' AND PRD_CODIGO='+edtCodigoPRD3.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoPRD3.SetFocus;
      Raise exception.Create('Produto não existe nesse pedido!');
    end;
    edtPrecoSugestao3.Text := Format('%.2f',[FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
  end;
end;

procedure TfMxPendencia.edtCodigoTRCExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  edtDescricaoTRC.Clear;
  edtTRCComJuros.Clear;
  edtValorTRC.Clear;

  if (edtCodigoTRC.Text = '') or
     (edtCodigoTRC.Text = '0') then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
  Begin
    edtCodigoPDV.SetFocus;
    Raise exception.Create('Código do pedido inválido!');
  end;

  if not VerificaInteiroBranco(edtCodigoTRC.Text) then
  Begin
    edtCodigoTRC.SetFocus;
    Raise exception.Create('Código do Título inválido!');
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TRC_TIPO_PAG,AGF_CODIGO,CCX_CODIGO,TRC_VENCIMENTO,TRC_VALOR,TRC_VALOR_PAGO,TRC_SITUACAO '+
      ' FROM TITULO_A_RECEBER '+
      ' WHERE CNC_CODIGO='+edtPedidoCNC.Text+
      ' AND TRC_CODIGO='+edtCodigoTRC.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoTRC.SetFocus;
      Raise exception.Create('Título não existe nesse pedido!');
    end;
    edtDescricaoTRC.Text := DM.SelecionaParametro(FieldByName('TRC_TIPO_PAG').AsInteger)+' '+
                            DM.SelecionaAgenteFinanceiro(FieldByName('AGF_CODIGO').AsInteger)+' '+
                            DM.SelecionaContaDeCaixa(FieldByName('CCX_CODIGO').AsInteger)+' '+
                            FieldByName('TRC_VENCIMENTO').asString+' '+
                            Format('%.2f',[FieldByName('TRC_VALOR').asFloat])+' '+
                            Format('%.2f',[FieldByName('TRC_VALOR_PAGO').asFloat]);

    if FieldByName('TRC_SITUACAO').asInteger = 0 then
      edtTRCComJuros.text := Format('%.2f',[FieldByName('TRC_VALOR').asFloat+
                                            (FieldByName('TRC_VALOR').asFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-FieldByName('TRC_VENCIMENTO').asDateTime)/3000))])
    else
      edtTRCComJuros.text :=Format('%.2f',[FieldByName('TRC_VALOR_PAGO').asFloat]);

    edtValorTRC.text := edtTRCComJuros.text;
  end;
end;

procedure TfMxPendencia.cmbTipoClick(Sender: TObject);
begin
{
0 Dev. Total       ok
1 Dev. Parcial     ok
2 Desconto Pedido  ok
3 Cancelar Venda   ok
4 Desconto Título  ok
5 Reabrir Título   ok
6 Excluir Título   ok
7 Lib. Venda SPC   ok
8 Entrada Avulsa
9 Saída Avulsa
}
  if SB_SalvaCab.Enabled then
  Begin
    if cmbTipo.ItemIndex in [0,1] then
    Begin
      cmbCreditoExtorno.ItemIndex := 0;
      cmbCreditoExtorno.Enabled := True;
    end
    else
    Begin
      cmbCreditoExtorno.ItemIndex := -1;
      cmbCreditoExtorno.Enabled := False;
    end;
    if cmbTipo.ItemIndex in [0,3,4,5,6,7,8,9] then
    Begin
      edtCodigoPRD1.Enabled := False;
      edtCodigoPRD1.Clear;
      edtCodigoPRD1Exit(sender);
      edtCodigoPRD2.Enabled := False;
      edtCodigoPRD2.Clear;
      edtCodigoPRD2Exit(sender);
      edtCodigoPRD3.Enabled := False;
      edtCodigoPRD3.Clear;
      edtCodigoPRD3Exit(sender);

      edtPrecoPRD1.Enabled := False;
      edtPrecoPRD2.Enabled := False;
      edtPrecoPRD3.Enabled := False;
    end
    else
    Begin
      edtCodigoPRD1.Enabled := True;
      edtCodigoPRD2.Enabled := True;
      edtCodigoPRD3.Enabled := True;
      if cmbTipo.ItemIndex = 2 then //Desconto Pedido
      Begin
        edtPrecoPRD1.Enabled := True;
        edtPrecoPRD2.Enabled := True;
        edtPrecoPRD3.Enabled := True;
      end
      else
      Begin
        edtPrecoPRD1.Enabled := False;
        edtPrecoPRD2.Enabled := False;
        edtPrecoPRD3.Enabled := False;
      end;
    end;
    if cmbTipo.ItemIndex in [0,1,2,3,7,8,9] then
    Begin
      edtCodigoTRC.Enabled := False;
      edtCodigoTRC.Clear;
      edtCodigoTRCExit(sender);
    end
    else
    Begin
      edtCodigoTRC.Enabled := True;
      if cmbTipo.ItemIndex = 4 then
        edtValorTRC.Enabled := True
      else
        edtValorTRC.Enabled := False;
    end;
    if cmbTipo.ItemIndex in [8,9] then
    Begin
      edtCodigoPDV.Text := '0';
      edtCodigoPDVExit(sender);
      edtCodigoPDV.Enabled := False;
      dblTipoPagamento.Enabled := False;
      dblFormaPagamento.Enabled := False;
      dblCodigoAGF.Enabled := False;
      edtCodigoCLI.Text := '0';
      edtCodigoCLI.Enabled := False;      
      edtCodigoPRD1.Enabled := True;
      edtPrecoPRD1.Enabled := True;
    end;
  end;
end;

procedure TfMxPendencia.Vendedor1BeforeOpen(DataSet: TDataSet);
begin
  try
    Vendedor1.ParamByName('CNC_CODIGO').asInteger := dblCodigoCNC.KeyValue;
  except
  end;
end;

procedure TfMxPendencia.LimpaCamposCadastro;
Begin
  Entidade.LimpaCampos;
  edtDataHora.Clear;
  edtRazaoSocial.Clear;
  mskCNPJCPF.Clear;
  edtProduto1.Clear;
  edtPrecoSugestao1.Clear;
  edtProduto2.Clear;
  edtPrecoSugestao2.Clear;
  edtProduto3.Clear;
  edtPrecoSugestao3.Clear;
  edtDescricaoTRC.Clear;
  edtTRCComJuros.Clear;
end;

procedure TfMxPendencia.Pendencias1CalcFields(DataSet: TDataSet);
begin
  with DM.QR_Consultas do
  Begin
    //Dados do Pedido  
    Close;
    SQL.Text := 'SELECT PDV_DATA_HORA '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
    Open;
    if not isEmpty then
      Entidade.FieldByName('DataPedido').asString := FormatDateTime('DD/MM/YYY HH:MM',FieldByName('PDV_DATA_HORA').asDateTime)
    else
      Entidade.FieldByName('DataPedido').asString := '';

    //Dados do Cliente
    Close;
    SQL.Text := 'SELECT CLI_RZ_SOCIAL, CLI_CGC_CPF '+
      ' FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.ClienteCNC)+
      ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI);
    Open;
    Entidade.FieldByName('Cliente').asString := FieldByName('CLI_RZ_SOCIAL').AsString;
    Entidade.FieldByName('CPF').asString := FieldByName('CLI_CGC_CPF').AsString;

    //Dados do Produto 1
    Close;
    SQL.Text := 'SELECT PRD_DESCRICAO, PRD_CARACTERISTICA '+
      ' FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD1);
    if Entidade.CodigoPRD1 > 0 then
    Begin
      Open;
      Entidade.FieldByName('Produto1').asString := FieldByName('PRD_DESCRICAO').AsString+' '+
                                                   FieldByName('PRD_CARACTERISTICA').AsString;
      Close;
      SQL.Text := 'SELECT IPV_PRECO_SUGERIDO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
        ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD1);
      Open;
      Entidade.FieldByName('Preco1').asString := Format('%.2f',[FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
    end
    else
    Begin
      Entidade.FieldByName('Produto1').asString := '';
      Entidade.FieldByName('Preco1').asString := '';
    end;

    //Dados do Produto 2
    Close;
    SQL.Text := 'SELECT PRD_DESCRICAO, PRD_CARACTERISTICA '+
      ' FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD2);
    if Entidade.CodigoPRD2 > 0 then
    Begin
      Open;
      Entidade.FieldByName('Produto2').asString := FieldByName('PRD_DESCRICAO').AsString+' '+
                                                   FieldByName('PRD_CARACTERISTICA').AsString;
      Close;
      SQL.Text := 'SELECT IPV_PRECO_SUGERIDO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
        ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD2);
      Open;
      Entidade.FieldByName('Preco2').asString := Format('%.2f',[FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
    end
    else
    Begin
      Entidade.FieldByName('Produto2').asString := '';
      Entidade.FieldByName('Preco2').asString := '';
    end;

    //Dados do Produto 3
    Close;
    SQL.Text := 'SELECT PRD_DESCRICAO, PRD_CARACTERISTICA '+
      ' FROM PRODUTO '+
      ' WHERE PRD_CODIGO='+IntToStr(Entidade.CodigoPRD3);
    if Entidade.CodigoPRD3 > 0 then
    Begin
      Open;
      Entidade.FieldByName('Produto3').asString := FieldByName('PRD_DESCRICAO').AsString+' '+
                                                   FieldByName('PRD_CARACTERISTICA').AsString;
      Close;
      SQL.Text := 'SELECT IPV_PRECO_SUGERIDO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
        ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD3);
      Open;
      Entidade.FieldByName('Preco3').asString := Format('%.2f',[FieldByName('IPV_PRECO_SUGERIDO').AsFloat]);
    end
    else
    Begin
      Entidade.FieldByName('Produto3').asString := '';
      Entidade.FieldByName('Preco3').asString := '';
    end;

    //Dados do Título
    Close;
    SQL.Text := 'SELECT TRC_TIPO_PAG,AGF_CODIGO,CCX_CODIGO,TRC_VENCIMENTO,TRC_VALOR,TRC_VALOR_PAGO,TRC_SITUACAO '+
      ' FROM TITULO_A_RECEBER '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
      ' AND TRC_CODIGO='+IntToStr(Entidade.CodigoTRC);
    if Entidade.CodigoTRC > 0 then
    Begin
      Open;
      Entidade.FieldByName('Titulo').asString := DM.SelecionaParametro(FieldByName('TRC_TIPO_PAG').AsInteger)+' '+
                                                 DM.SelecionaAgenteFinanceiro(FieldByName('AGF_CODIGO').AsInteger)+' '+
                                                 DM.SelecionaContaDeCaixa(FieldByName('CCX_CODIGO').AsInteger)+' '+
                                                 FieldByName('TRC_VENCIMENTO').asString+' '+
                                                 Format('%.2f',[FieldByName('TRC_VALOR').asFloat])+' '+
                                                 Format('%.2f',[FieldByName('TRC_VALOR_PAGO').asFloat]);

      if FieldByName('TRC_SITUACAO').asInteger = 0 then
        Entidade.FieldByName('ValorTRC').asString := Format('%.2f',[FieldByName('TRC_VALOR').asFloat+
                                              (FieldByName('TRC_VALOR').asFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-FieldByName('TRC_VENCIMENTO').asDateTime)/3000))])
      else
        Entidade.FieldByName('ValorTRC').asString := Format('%.2f',[FieldByName('TRC_VALOR_PAGO').asFloat]);
    end
    else
    Begin
      Entidade.FieldByName('Titulo').asString := '';
      Entidade.FieldByName('ValorTRC').asString := '';
    end;
  end;
end;

procedure TfMxPendencia.mskFiltroDataExit(Sender: TObject);
begin
  if not VerificaData(mskFiltroData.Text) then
  Begin
    mskFiltroData.SetFocus;
    Raise exception.Create('Data inválida!');
  end;
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    LimpaCamposCadastro;  
end;

procedure TfMxPendencia.imprimir1Click(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');
    
  Application.CreateForm(Trpt_Pendencia, rpt_Pendencia);
  with rpt_Pendencia do
  Begin
    tag := 1;
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM PENDENCIA '+
      ' WHERE CNC_ORIGEM='+IntToStr(self.Entidade.CNCOrigem)+
      ' AND CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND PEN_CODIGO='+IntToStr(self.Entidade.CodigoPEN)+      
      ' ORDER BY CNC_CODIGO, PEN_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta Vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxPendencia.edtCodigoPRD1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=70;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=70;
        ShowModal;
      end;
    end;
    edtCodigoPRD1.SetFocus;
  End;
end;

procedure TfMxPendencia.edtCodigoPRD2KeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=71;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=71;
        ShowModal;
      end;
    end;
    edtCodigoPRD2.SetFocus;
  End;
end;

procedure TfMxPendencia.edtCodigoPRD3KeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=72;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=72;
        ShowModal;
      end;
    end;
    edtCodigoPRD3.SetFocus;
  End;
end;

end.
