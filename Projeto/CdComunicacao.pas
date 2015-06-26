unit CdComunicacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Menus, JPEG, Comunicacao, Vendedor, DBCtrls, Usuario, Parametro, Cliente,
  Transportadora, Fornecedor, Contato, Produto, Variants, Tarefa;

type
  TfCadComunicacao = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    edtDetalhe: TEdit;
    edtCodigoCOM: TEdit;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    DSComunicacao1: TDataSource;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Clientes1: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
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
    Comunicacao1: TComunicacao;
    Label8: TLabel;
    edtUsuario: TEdit;
    Comunicacao1CNC_ORIGEM: TIntegerField;
    Comunicacao1CNC_CODIGO: TIntegerField;
    Comunicacao1COM_CODIGO: TIntegerField;
    Comunicacao1COM_MAQUINA: TIntegerField;
    Comunicacao1USU_CODIGO: TIntegerField;
    Comunicacao1FUN_CODIGO: TIntegerField;
    Comunicacao1COM_CNC_ENTRADA: TIntegerField;
    Comunicacao1COM_COD_ENTRADA: TIntegerField;
    Comunicacao1COM_CNC_CONTATO: TIntegerField;
    Comunicacao1CNT_CODIGO: TIntegerField;
    Comunicacao1COM_CNC_PEDIDO: TIntegerField;
    Comunicacao1COM_COD_PEDIDO: TIntegerField;
    Comunicacao1COM_CNC_TITULO: TIntegerField;
    Comunicacao1COM_COD_TITULO: TIntegerField;
    Comunicacao1PRD_CODIGO: TIntegerField;
    Comunicacao1COM_CNC_ORIGEM: TIntegerField;
    Comunicacao1COM_COD_ORIGEM: TIntegerField;
    Comunicacao1COM_DT_CADASTRO: TDateTimeField;
    Comunicacao1COM_DT_ALTERADO: TDateTimeField;
    Comunicacao1COM_DT_COMUNICACAO: TDateTimeField;
    Comunicacao1COM_TIPO: TIntegerField;
    Comunicacao1COM_MEIO_DE_CONTATO: TIntegerField;
    Comunicacao1COM_MEIO_DETALHE: TStringField;
    Comunicacao1COM_MOTIVO: TIntegerField;
    Comunicacao1COM_PERGUNTA_1: TIntegerField;
    Comunicacao1COM_RESPOSTA_1: TStringField;
    Comunicacao1COM_PERGUNTA_2: TIntegerField;
    Comunicacao1COM_RESPOSTA_2: TStringField;
    Comunicacao1COM_PERGUNTA_3: TIntegerField;
    Comunicacao1COM_RESPOSTA_3: TStringField;
    Comunicacao1COM_CNC_TAREFA: TIntegerField;
    Comunicacao1TAR_CODIGO: TIntegerField;
    Comunicacao1COM_DETALHE: TStringField;
    Comunicacao1COM_NIVEL_ACERTO: TIntegerField;
    Comunicacao1COM_SITUACAO: TIntegerField;
    Comunicacao1COM_OBSERVACAO: TStringField;
    Comunicacao1Usuario: TStringField;
    Label5: TLabel;
    mskDataComunicacaoOrigem: TMaskEdit;
    Label6: TLabel;
    edtCodEntrada: TEdit;
    Label7: TLabel;
    cmbTipo: TComboBox;
    edtCodEntradaCNC: TEdit;
    edtRazaoSocial: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtCodigoCNT: TEdit;
    edtContatoCNC: TEdit;
    edtContato: TEdit;
    Label11: TLabel;
    Label22: TLabel;
    dblCodigoFUN: TDBLookupComboBox;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    Label13: TLabel;
    edtCodPedido: TEdit;
    edtCodPedidoCNC: TEdit;
    Label14: TLabel;
    mskDataEntrega: TMaskEdit;
    Label16: TLabel;
    edtCodTitulo: TEdit;
    edtCodTituloCNC: TEdit;
    Label17: TLabel;
    edtCodOrigem: TEdit;
    edtCodOrigemCNC: TEdit;
    Label18: TLabel;
    mskDataComunicacao: TMaskEdit;
    Label21: TLabel;
    edtVencimentoValor: TEdit;
    Label23: TLabel;
    edtCodigoPRD: TEdit;
    Label24: TLabel;
    edtDescricaoProduto: TEdit;
    Label25: TLabel;
    dblPergunta1: TDBLookupComboBox;
    Label26: TLabel;
    edtResposta1: TEdit;
    Label28: TLabel;
    dblPergunta2: TDBLookupComboBox;
    Label29: TLabel;
    edtResposta2: TEdit;
    Label30: TLabel;
    dblPergunta3: TDBLookupComboBox;
    Label31: TLabel;
    edtResposta3: TEdit;
    Label32: TLabel;
    dblMeioDeContato: TDBLookupComboBox;
    Label33: TLabel;
    edtMeioDeContatoDetalhe: TEdit;
    Label34: TLabel;
    dblMotivo: TDBLookupComboBox;
    Label35: TLabel;
    edtCodigoTAR: TEdit;
    edtTarefaCNC: TEdit;
    Label36: TLabel;
    cmbNivelAcerto: TComboBox;
    Parametro1: TParametro;
    Parametro2: TParametro;
    Parametro3: TParametro;
    DSParametro1: TDataSource;
    DSParametro2: TDataSource;
    Parametro4: TParametro;
    DSParametro3: TDataSource;
    DSParametro4: TDataSource;
    Parametro5: TParametro;
    DSParametro5: TDataSource;
    Cliente1: TCliente;
    Fornecedor1: TFornecedor;
    Transportadora1: TTransportadora;
    Comunicacao1RazaoSocial: TStringField;
    Comunicacao1Contato: TStringField;
    Comunicacao1MeioContato: TStringField;
    Comunicacao1Motivo: TStringField;
    Comunicacao1Tipo: TStringField;
    Comunicacao1Responsavel: TStringField;
    Comunicacao1NivelAcerto: TStringField;
    Contato1: TContato;
    Produto1: TProduto;
    Parametro6: TParametro;
    Comunicacao1Produto: TStringField;
    Vendedor2: TVendedor;
    SB_ExcCab: TSpeedButton;
    ExcluirCab: TMenuItem;
    Tarefa1: TTarefa;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Comunicacao1AfterScroll(DataSet: TDataSet);
    procedure Comunicacao1CalcFields(DataSet: TDataSet);
    procedure cmbTipoClick(Sender: TObject);
    procedure edtCodEntradaExit(Sender: TObject);
    procedure edtCodigoCNTExit(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure edtCodigoTARExit(Sender: TObject);
    procedure Label35DblClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TComunicacao;
  end;

var
  fCadComunicacao: TfCadComunicacao;

implementation
Uses
  UDM,funcoes, CdCliente, MxSCotaFor, MxSTransportadora, CdContato,
  MxSPediProdMotCal, MxSPediProd, MxAgendaTarefas;
{$R *.DFM}



procedure TfCadComunicacao.SB_PrimClick(Sender: TObject);
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

procedure TfCadComunicacao.SB_AntClick(Sender: TObject);
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

procedure TfCadComunicacao.SB_ProxClick(Sender: TObject);
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

procedure TfCadComunicacao.SB_UltClick(Sender: TObject);
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

procedure TfCadComunicacao.AtualizaControles(Habilitar:Boolean);
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
  SB_AltCab.Enabled:=not habilitar;
  SB_ExcCab.Enabled:=not habilitar;    
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
end;

procedure TfCadComunicacao.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8080)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  Entidade.PreparaInsercao;
  AtualizaControles(true);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM PARAMETRO '+
      ' WHERE TPR_CODIGO=140 '+
      ' AND PAR_SITUACAO<>1 '+
      ' ORDER BY PAR_DESCRICAO ';
    Open;
    while not Eof do
    Begin
      if dblPergunta1.Text = '' then
        dblPergunta1.KeyValue := FieldByName('PAR_CODIGO').asInteger
      else if dblPergunta2.Text = '' then
        dblPergunta2.KeyValue := FieldByName('PAR_CODIGO').asInteger
      else if dblPergunta3.Text = '' then
        dblPergunta3.KeyValue := FieldByName('PAR_CODIGO').asInteger;
      Next;
    end;
  end;
  edtCodEntrada.SetFocus;
end;

procedure TfCadComunicacao.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8080)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtCodEntrada.SetFocus;
end;

procedure TfCadComunicacao.SB_SalvaCabClick(Sender: TObject);
var
  CdCNC, CdCOM, CdEntradaCNC, CdEntrada: integer;
begin
  if Entidade.Estado = 1 then
    CdCNC := DM.Configuracao1.CodigoCNC
  else
    CdCNC := Entidade.CodigoCNC;

  CdCOM := StrToInt(edtCodigoCOM.Text);
  try
    CdEntradaCNC := StrToInt(edtCodEntradaCNC.Text);
    CdEntrada    := StrToInt(edtCodEntrada.Text);
  except
    CdEntradaCNC := 0;
    CdEntrada    := 0;
  end;

  If not Entidade.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');

  AtualizaControles(False);
  Entidade.Close;
  if CdEntrada > 0 then
    Entidade.SQL.Text := 'SELECT * '+
      ' FROM COMUNICACAO '+
      ' WHERE COM_CNC_ENTRADA='+IntToStr(CdEntradaCNC)+
      ' AND COM_COD_ENTRADA='+IntToStr(CdEntrada)
  else
    Entidade.SQL.Text := 'SELECT * '+
      ' FROM COMUNICACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND COM_CODIGO='+IntToStr(CdCOM);
  Entidade.Open;
  Entidade.Locate('CNC_CODIGO;COM_CODIGO', vararrayof([CdCNC, CdCOM]), []);
end;

procedure TfCadComunicacao.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtUsuario.Clear;
    edtRazaoSocial.Clear;
    edtContato.Clear;
    edtDescricaoProduto.Clear;
  end;
end;

procedure TfCadComunicacao.FormCreate(Sender: TObject);
begin
  Entidade:=Comunicacao1;
  Vendedor1.Open;
  Parametro1.Open;
  Parametro2.Open;
  Parametro3.Open;
  Parametro4.Open;
  Parametro5.Open;
end;

procedure TfCadComunicacao.SB_LocCabClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Selecionar;
end;

procedure TfCadComunicacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Vendedor1.Close;
  Parametro1.Close;
  Parametro2.Close;
  Parametro3.Close;
  Parametro4.Close;
  Parametro5.Close;
  Action:=caFree;
end;

procedure TfCadComunicacao.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadComunicacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadComunicacao.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbCampo.ItemIndex := 1;
  edtLocalizar.SetFocus;
end;

procedure TfCadComunicacao.FormKeyPress(Sender: TObject; var Key: Char);
var
  iTipoContato: Byte;
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
  end
  else if Key = #32 then
  Begin
    if edtCodEntrada.Focused then
    Begin
      key:=chr(0);
      if cmbTipo.ItemIndex = 0 then //Cliente
      Begin
        Application.CreateForm(TfCadCli, fCadCli);
        fCadCli.tag:=45;
        fCadCli.CentroCusto2.open;
        fCadCli.CentroCusto2.LocalizarCod(StrToInt(edtCodEntradaCNC.Text));
        fCadCli.dblCentroDeCusto.KeyValue:=StrToInt(edtCodEntradaCNC.Text);
        fCadCli.Showmodal;
      end
      else if cmbTipo.ItemIndex = 1 then //Fornecedor
      Begin
        Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
        fMxSCotaFor.Fornecedor1.Close;
        fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
        fMxSCotaFor.Fornecedor1.Open;
        fMxSCotaFor.tag:=37;
        fMxSCotaFor.ShowModal;
      end
      else if cmbTipo.ItemIndex = 2 then //Transportadora
      Begin
        Application.CreateForm(TfMxSTransportadora, fMxSTransportadora);
        fMxSTransportadora.tag:=4;
        fMxSTransportadora.Transportadora1.Close;
        fMxSTransportadora.Transportadora1.Open;
        fMxSTransportadora.Showmodal;
      end;
    end
    else if edtCodigoCNT.Focused then
    Begin
      key:=chr(0);
      if not VerificaInteiroBranco(edtCodEntrada.Text) then
        Exit;

      case cmbTipo.ItemIndex of
        0: iTipoContato := 1;
        1: iTipoContato := 0;
        else
          iTipoContato := cmbTipo.ItemIndex;
      end;
      Application.CreateForm(TFCadCont, FCadCont);
      with FCadCont do
      Begin
        tag:=4;
        iTipo := iTipoContato;
        edtFORCNC.Text      := self.edtCodEntradaCNC.Text;
        edtCodigoFOR.Text   := self.edtCodEntrada.Text;
        edtRazaoSocial.Text := self.edtRazaoSocial.Text;
        Showmodal;
      end;
    end
    else if edtCodigoPRD.Focused then
    Begin
      key:=chr(0);
      if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
      Begin
        Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
        with fMxSPedProdMotcal do
        Begin
          Tag:=62;
          ShowModal;
        end;
      end
      else
      Begin
        Application.CreateForm(TfMxSPedProd, fMxSPedProd);
        with fMxSPedProd do
        Begin
          Tag:=62;
          ShowModal;
        end;
      end;
    end
    else if edtCodigoTAR.Focused then
    Begin
      key:=chr(0);
      Application.CreateForm(TfMxAgendaTarefas, fMxAgendaTarefas);
      with fMxAgendaTarefas do
      Begin
        Tag:=1;
        ShowModal;
      end;
    end;
  end;
end;

procedure TfCadComunicacao.Comunicacao1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.text          := Entidade.FieldByName('Usuario').asString;
  edtRazaoSocial.Text      := Entidade.FieldByName('RazaoSocial').asString;
  edtContato.Text          := Entidade.FieldByName('Contato').asString;
  edtDescricaoProduto.Text := Entidade.FieldByName('Produto').asString;
end;

procedure TfCadComunicacao.Comunicacao1CalcFields(DataSet: TDataSet);
var
  iTipoContato: Byte;
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);

  case Entidade.Tipo of
    0: Entidade.FieldByName('Tipo').asString := 'Cliente';
    1: Entidade.FieldByName('Tipo').asString := 'Fornecedor';
    2: Entidade.FieldByName('Tipo').asString := 'Transportadora';
  end;

  iTipoContato := 250; //Não existe
  if Entidade.Tipo = 0 then //Cliente
  Begin
    iTipoContato := 1;
    with Cliente1 do
    Begin
      if (not Active) or
        (CodigoCNC <> Entidade.CodEntradaCNC) or
        (CodigoCLI <> Entidade.CodEntrada) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').AsInteger := Entidade.CodEntradaCNC;
        ParamByName('CLI_CODIGO').AsInteger := Entidade.CodEntrada;
        Open;
      end;
      Entidade.FieldByName('RazaoSocial').asString := RazaoSocial;
    end;
  end
  else if Entidade.Tipo = 1 then //Fornecedor
  Begin
    iTipoContato := 0;
    with Fornecedor1 do
    Begin
      if (not Active) or
        (CodigoFOR <> Entidade.CodEntrada) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').AsInteger := Entidade.CodEntrada;
        Open;
      end;
      Entidade.FieldByName('RazaoSocial').asString := RazaoSocial;
    end;
  end
  else if Entidade.Tipo = 2 then //Transportadora
  Begin
    iTipoContato := 2;
    with Transportadora1 do
    Begin
      if (not Active) or
        (CodigoTRN <> Entidade.CodEntrada) then
      Begin
        Close;
        ParamByName('TRN_CODIGO').AsInteger := Entidade.CodEntrada;
        Open;
      end;
      Entidade.FieldByName('RazaoSocial').asString := RazaoSocial;
    end;
  end;

  with Contato1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.ContatoCNC) or
       (CodigoCNT <> Entidade.CodigoCNT) or
       (CodigoFOR <> Entidade.CodEntrada) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ContatoCNC;
      ParamByName('CNT_CODIGO').asInteger := Entidade.CodigoCNT;
      ParamByName('FOR_CODIGO').asInteger := Entidade.CodEntrada;
      ParamByName('CNT_TIPO').asInteger := iTipoContato; // 0=Fornecedor; 1=Cliente; 2=Transportadora
      Open;
    end;
    Entidade.FieldByName('Contato').asString := Nome;
  end;

  with Vendedor2 do
  Begin
    if (not Active) or
       (CodigoFUN <> Entidade.CodigoFUN) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
      Open;
    end;
    Entidade.FieldByName('Responsavel').asString := NomeFun;
  end;

  with Parametro6 do
  Begin
    if (not Active) or
       (CodigoPAR <> Entidade.MeioDeContato) then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Entidade.MeioDeContato;
      Open;
    end;
    Entidade.FieldByName('MeioContato').asString := Descricao;

    if (not Active) or
       (CodigoPAR <> Entidade.Motivo) then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Entidade.Motivo;
      Open;
    end;
    Entidade.FieldByName('Motivo').asString := Descricao;
  end;

  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> Entidade.CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    Entidade.FieldByName('Produto').asString := Descricao;
  end;

  case Entidade.NivelAcerto of
    0: Entidade.FieldByName('NivelAcerto').asString := 'Solução';
    1: Entidade.FieldByName('NivelAcerto').asString := 'Solução Anterior';
    2: Entidade.FieldByName('NivelAcerto').asString := 'Pend. Nova p/Cliente';
    3: Entidade.FieldByName('NivelAcerto').asString := 'Pend. nova p/Empresa';
  end;
end;

procedure TfCadComunicacao.cmbTipoClick(Sender: TObject);
begin
  if cmbTipo.Enabled then
  Begin
    edtCodEntrada.Text := '0';
    edtRazaoSocial.Clear;
    edtCodigoCNT.Text := '0';
    edtContato.Clear;
    edtCodPedido.Text := '0';
    mskDataEntrega.Clear;
    edtCodTitulo.Text := '0';
    edtVencimentoValor.Clear;
  end;
end;

procedure TfCadComunicacao.edtCodEntradaExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodEntrada.Text) then
    edtCodEntrada.Text := '0';

  edtRazaoSocial.Clear;

  edtCodigoCNTExit(sender);

  if StrToInt(edtCodEntrada.Text) = 0 then
    Exit;

  if cmbTipo.ItemIndex = 0 then //Cliente
  Begin
    with Cliente1 do
    Begin
      if (not Active) or
        (CodigoCNC <> StrToInt(edtCodEntradaCNC.Text)) or
        (CodigoCLI <> StrToInt(edtCodEntrada.Text)) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').AsInteger := StrToInt(edtCodEntradaCNC.Text);
        ParamByName('CLI_CODIGO').AsInteger := StrToInt(edtCodEntrada.Text);
        Open;
        if edtCodEntrada.Enabled and
           IsEmpty then
        Begin
          ShowMessage('Cliente inválido');
          edtCodEntrada.Text := '0';
          edtCodEntrada.SetFocus;
          Exit;
        end;
      end;
      edtRazaoSocial.Text := RazaoSocial;
    end;
  end
  else if cmbTipo.ItemIndex = 1 then //Fornecedor
  Begin
    with Fornecedor1 do
    Begin
      if (not Active) or
        (CodigoFOR <> StrToInt(edtCodEntrada.Text)) then
      Begin
        Close;
        ParamByName('FOR_CODIGO').AsInteger := StrToInt(edtCodEntrada.Text);
        Open;
        if edtCodEntrada.Enabled and
           IsEmpty then
        Begin
          ShowMessage('Fornecedor inválido');
          edtCodEntrada.Text := '0';
          edtCodEntrada.SetFocus;
          Exit;
        end;
      end;
      edtRazaoSocial.Text := RazaoSocial;
    end;
  end
  else if cmbTipo.ItemIndex = 2 then //Transportadora
  Begin
    with Transportadora1 do
    Begin
      if (not Active) or
        (CodigoTRN <> StrToInt(edtCodEntrada.Text)) then
      Begin
        Close;
        ParamByName('TRN_CODIGO').AsInteger := StrToInt(edtCodEntrada.Text);
        Open;
        if edtCodEntrada.Enabled and
           IsEmpty then
        Begin
          ShowMessage('Transportadora inválida');
          edtCodEntrada.Text := '0';
          edtCodEntrada.SetFocus;
          Exit;
        end;
      end;
      edtRazaoSocial.Text := RazaoSocial;
    end;
  end;
end;

procedure TfCadComunicacao.edtCodigoCNTExit(Sender: TObject);
var
  iTipoContato: byte;
begin
  if SB_CancCab.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoCNT.Text) then
    edtCodigoCNT.Text := '0';

  edtContato.Clear;

  if StrToInt(edtCodigoCNT.Text) = 0 then
    Exit;

  case cmbTipo.ItemIndex of
    0: iTipoContato := 1;
    1: iTipoContato := 0;
    else
      iTipoContato := cmbTipo.ItemIndex;
  end;

  with Contato1 do
  Begin
    if (not Active) or
       (CodigoCNC <> StrToInt(edtContatoCNC.Text)) or
       (CodigoCNT <> StrToInt(edtCodigoCNT.Text)) or
       (CodigoFOR <> StrToInt(edtCodEntrada.Text)) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').AsInteger := StrToInt(edtContatoCNC.Text);
      ParamByName('CNT_CODIGO').AsInteger := StrToInt(edtCodigoCNT.Text);
      ParamByName('FOR_CODIGO').AsInteger := StrToInt(edtCodEntrada.Text);
      ParamByName('CNT_TIPO').AsInteger := iTipoContato;
      Open;
      if edtCodigoCNT.Enabled and
         IsEmpty then
      Begin
        ShowMessage('Contato inválido');
        edtCodigoCNT.Text := '0';
        edtCodigoCNT.SetFocus;
        Exit;
      end;
    end;
    edtContato.Text := Nome;
  end;
end;

procedure TfCadComunicacao.edtCodigoPRDExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Text := '0';

  edtDescricaoProduto.Clear;

  if StrToInt(edtCodigoPRD.Text) = 0 then
    Exit;

  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> StrToInt(edtCodigoPRD.Text)) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
      Open;
      if edtCodigoPRD.Enabled and
         IsEmpty then
      Begin
        ShowMessage('Produto inválido');
        edtCodigoPRD.Text := '0';
        edtCodigoPRD.SetFocus;
        Exit;
      end;
    end;
    edtDescricaoProduto.Text := Descricao;
  end;
end;

procedure TfCadComunicacao.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8140)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
end;

procedure TfCadComunicacao.edtCodigoTARExit(Sender: TObject);
begin
  if SB_CancCab.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoTAR.Text) then
    edtCodigoTAR.Text := '0';

  if StrToInt(edtCodigoTAR.Text) = 0 then
    Exit;

  with Tarefa1 do
  Begin
    if (not Active) or
       (CodigoTAR <> StrToInt(edtCodigoTAR.Text)) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').AsInteger := StrToInt(edtTarefaCNC.Text);
      ParamByName('TAR_CODIGO').AsInteger := StrToInt(edtCodigoTAR.Text);
      Open;
      if edtCodigoTAR.Enabled and
         IsEmpty then
      Begin
        ShowMessage('Tarefa inválida');
        edtCodigoTAR.Text := '0';
        edtCodigoTAR.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure TfCadComunicacao.Label35DblClick(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtTarefaCNC.Text) then
    Exit;
  if not VerificaInteiroBranco(edtCodigoTAR.Text) then
    Exit;

  if StrToInt(edtCodigoTAR.Text) <= 0 then
    Exit;

  Application.CreateForm(TfMxAgendaTarefas, fMxAgendaTarefas);
  with fMxAgendaTarefas do
  Begin
    Tag := 2;
    ShowModal;
  end;
end;

end.
