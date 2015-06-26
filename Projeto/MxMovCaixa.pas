unit MxMovCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Db,
  Conta_de_Caixa, Parametro, Caixa, DBTables, SQuery, Movimento_caixa,
  ComCtrls, Menus, CentroCusto, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  ActnList, XPStyleActnCtrls;

type
  TfMxMovCx = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCodigoMVC: TEdit;
    dblContaAgendada: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDescricao: TEdit;
    Label6: TLabel;
    edtNumero: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtValor: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    memObservacao: TMemo;
    dblTipoPagamento: TDBLookupComboBox;
    Panel4: TPanel;
    SB_LocCab: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Panel5: TPanel;
    DBGrid5: TDBGrid;
    Label12: TLabel;
    edtSequencia: TEdit;
    SB_SalvarCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Caixa1: TCaixa;
    Parametro1: TParametro;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    DSCaixa1: TDataSource;
    DSParametro1: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    dblCodigoCAX: TDBLookupComboBox;
    SB_AltCab: TSpeedButton;
    Movimento_caixa1: TMovimento_caixa;
    edtDataHora: TEdit;
    cmbDC: TComboBox;
    dblTipoDocumento: TDBLookupComboBox;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    DSMovimento_caixa1: TDataSource;
    Movimento_caixa1MVC_CODIGO: TIntegerField;
    Movimento_caixa1CNC_CODIGO: TIntegerField;
    Movimento_caixa1CCX_CODIGO: TIntegerField;
    Movimento_caixa1CAX_CODIGO: TIntegerField;
    Movimento_caixa1MVC_DESCRICAO: TStringField;
    Movimento_caixa1MVC_DATA: TDateTimeField;
    Movimento_caixa1MVC_DC: TStringField;
    Movimento_caixa1MVC_VALOR: TFloatField;
    Movimento_caixa1MVC_FLAG: TStringField;
    Movimento_caixa1MVC_TIT_TIPO: TIntegerField;
    Movimento_caixa1MVC_TIT_CC: TIntegerField;
    Movimento_caixa1MVC_TIT_NUMERO: TStringField;
    Movimento_caixa1MVC_TIPO_PGTO: TIntegerField;
    Movimento_caixa1MVC_TIT_SEQUENCIA: TStringField;
    Movimento_caixa1MVC_OBSERVACAO1: TStringField;
    Movimento_caixa1CNC_TITULO: TIntegerField;
    Movimento_caixa1TIT_CODIGO: TIntegerField;
    Movimento_caixa1MVC_PT: TStringField;
    Movimento_caixa1MVC_COMPETENCIA: TDateTimeField;
    Movimento_caixa1USU_CODIGO: TIntegerField;
    Movimento_caixa1MVC_DT_ALTERADO: TDateTimeField;
    Movimento_caixa1Caixa: TStringField;
    Movimento_caixa1Documento: TStringField;
    Movimento_caixa1Pagamento: TStringField;
    Caixa2: TCaixa;
    Parametro3: TParametro;
    Conta_de_Caixa2: TConta_de_Caixa;
    Label27: TLabel;
    mskDataAlterado: TMaskEdit;
    Label13: TLabel;
    edtUsuario: TEdit;
    Label14: TLabel;
    mskCompetencia: TMaskEdit;
    dblContaRecebida: TDBLookupComboBox;
    Label15: TLabel;
    DSConta_de_Caixa3: TDataSource;
    Conta_de_Caixa3: TConta_de_Caixa;
    Movimento_caixa1CCX_CODIGO_REC: TIntegerField;
    Movimento_caixa1MVC_NAO_CONTABIL: TIntegerField;
    Movimento_caixa1MVC_ORIGEM_EXTORNO: TIntegerField;
    Movimento_caixa1MVC_JUROS: TFloatField;
    Movimento_caixa1MVC_DESCONTO: TFloatField;
    Movimento_caixa1ContaAgendada: TStringField;
    Movimento_caixa1ContaRecebida: TStringField;
    Movimento_caixa1MVC_CRED_CLI: TFloatField;
    Movimento_caixa1MVC_VALOR_DOC: TFloatField;
    Movimento_caixa1MVC_MAQUINA: TIntegerField;
    Movimento_caixa1MVC_DT_CHEQUE: TDateTimeField;
    Label16: TLabel;
    dblCodigoCNC: TDBLookupComboBox;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    ActionManager1: TActionManager;
    AlterarCab: TAction;
    SalvarCab: TAction;
    CancelarCab: TAction;
    LocalizarCab: TAction;
    SairCab: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure Movimento_caixa1AfterScroll(DataSet: TDataSet);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvarCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure Movimento_caixa1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Movimento_caixa1BeforeOpen(DataSet: TDataSet);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
     Entidade:TMovimento_caixa;
  end;

var
  fMxMovCx: TfMxMovCx;

implementation

uses UDM, MxReceber, MxPagar, funcoes,Urecibo;

{$R *.DFM}                          


procedure TfMxMovCx.Movimento_caixa1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxMovCx.SB_PrimClick(Sender: TObject);
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

procedure TfMxMovCx.SB_AntClick(Sender: TObject);
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

procedure TfMxMovCx.SB_ProxClick(Sender: TObject);
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

procedure TfMxMovCx.SB_UltClick(Sender: TObject);
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

procedure TfMxMovCx.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) and
     (DM.Configuracao1.empresa <> empLBM) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtNumero.SetFocus;
end;

procedure TfMxMovCx.SB_SalvarCabClick(Sender: TObject);
var
  mensagem, sTipo: string;
  CdCNC, CdMVC: integer;
  trans:boolean;
begin
  mensagem := '';
  if dblContaAgendada.Text = '' then
    mensagem := mensagem + 'Conta Agendada inválida!'+#13;
  if dblContaRecebida.Text = '' then
    mensagem := mensagem + 'Conta Recebimento inválida!'+#13;
  if dblTipoDocumento.Text = '' then
    mensagem := mensagem + 'Tipo de Documento inválido!'+#13;
  if dblTipoPagamento.Text = '' then
    mensagem := mensagem + 'Tipo de Pagamento inválido!'+#13;
  if cmbDC.ItemIndex < 0 then
    mensagem := mensagem + 'Tipo Débito/Crédito inválido!'+#13;
  if not VerificaFloatBranco(edtValor.Text) then
    mensagem := mensagem + 'Valor inválido!'+#13;
  if Trim(edtDescricao.Text) = '' then
    mensagem := mensagem + 'Descrição inválida!'+#13;
  if mensagem <> '' then
    Raise exception.Create(mensagem);

  if cmbDC.ItemIndex = 0 then
    sTipo := 'D'
  else
    sTipo := 'C';

  CdCNC := Entidade.CodigoCNC;
  CdMVC := Entidade.CodigoMVC;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

{      if DM.Configuracao1.Empresa = empEletro then //Somente Eletro altera Valor
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_CAIXA SET '+
          ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ',MVC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',MVC_DESCRICAO="'+edtDescricao.Text+'" '+
          ',MVC_COMPETENCIA="'+MesDia(mskCompetencia.Text)+'" '+
          ',MVC_VALOR='+VirgPonto(edtValor.Text)+
          ',MVC_DC="'+sTipo+'" '+
          ',MVC_TIT_NUMERO="'+edtNumero.Text+'" '+
          ',MVC_TIT_SEQUENCIA="'+edtSequencia.Text+'" '+
          ',MVC_TIT_TIPO='+IntToStr(dblTipoDocumento.KeyValue)+
          ',MVC_TIPO_PGTO='+IntToStr(dblTipoPagamento.KeyValue)+
          ',CCX_CODIGO='+IntToStr(dblContaAgendada.KeyValue)+
          ',CCX_CODIGO_REC='+IntToStr(dblContaRecebida.KeyValue)+
          ',MVC_OBSERVACAO1="'+memObservacao.Text+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND MVC_CODIGO='+IntToStr(CdMVC));
      end
      else
}
        ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_CAIXA SET '+
          ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ',MVC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',MVC_DESCRICAO="'+edtDescricao.Text+'" '+
          ',MVC_COMPETENCIA="'+MesDia(mskCompetencia.Text)+'" '+
          ',MVC_TIT_NUMERO="'+edtNumero.Text+'" '+
          ',MVC_TIT_SEQUENCIA="'+edtSequencia.Text+'" '+
          ',MVC_TIT_TIPO='+IntToStr(dblTipoDocumento.KeyValue)+
          ',MVC_TIPO_PGTO='+IntToStr(dblTipoPagamento.KeyValue)+
          ',CCX_CODIGO='+IntToStr(dblContaAgendada.KeyValue)+
          ',CCX_CODIGO_REC='+IntToStr(dblContaRecebida.KeyValue)+
          ',MVC_OBSERVACAO1="'+memObservacao.Text+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND MVC_CODIGO='+IntToStr(CdMVC));
      //Gerar Log
      DM.Usuario1.GeraLog(2390,CdCNC,CdMVC,Entidade.Descricao+' '+Entidade.Dc+
        ' Valor:'+format('%.2f',[Entidade.Valor])+
        ' NUM:'+Entidade.Numero+' SEQ:'+Entidade.Sequencia+
        ' Comp.:'+DateToStr(Entidade.Competencia)+
        ' CCX:'+IntToStr(Entidade.CodigoCCX)+
        ' CCXRec:'+IntToStr(Entidade.CodigoCCXRecebimento)+
        ' Doc:'+IntToStr(Entidade.Tipo)+
        ' Pag:'+IntToStr(Entidade.TipoPGTO)+
        ' OBS:'+Entidade.Observacao);
      If DM.Configuracao1.ControleTransacao then
        Commit;
      Entidade.AtualizaControles(False);
      Entidade.Close;
      Entidade.Open;
      Entidade.LocalizarCod(CdMVC, CdCNC);
      AtualizaControles(1,False);
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
end;

procedure TfMxMovCx.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
end;

procedure TfMxMovCx.FormCreate(Sender: TObject);
begin
  Entidade:=Movimento_caixa1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_ContMVC_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxMovCx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_ContMVC_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Caixa1.Close;
  Entidade.Close;
  Parametro1.Close;
  Parametro2.Close;
  Conta_de_Caixa1.Close;
  Conta_de_Caixa2.Close;
  Conta_de_Caixa3.Open;
  Action:=caFree;
end;

procedure TfMxMovCx.SairCabClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxMovCx.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If SB_SalvarCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;


procedure TfMxMovCx.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto2.Open;
  dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
  Caixa1.Open;
  dblCodigoCAX.KeyValue:=Caixa1.CodigoCAX;
  Parametro1.Open;
  Parametro2.Open;
  Conta_de_Caixa1.Open;
  Conta_de_Caixa3.Open;
  Entidade.Close;
  Entidade.SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
    ' WHERE CAX_CODIGO=:CAX_CODIGO '+
    ' AND CNC_CODIGO=:CNC_CODIGO '+    
    ' AND MVC_DATA>="'+MesDia(DM.Configuracao1.Data)+'" '+
    ' AND MVC_DATA<"'+MesDia(DM.Configuracao1.Data+1)+'" '+
    ' ORDER BY MVC_CODIGO ';
  Entidade.Open;
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfMxMovCx.SB_LocCabClick(Sender: TObject);
begin
  Entidade.Close;
  case cmbCampo.ItemIndex of
   0 : Begin  //Código do Movimento
         if not VerificaInteiroBranco(edtLocalizar.Text) then
           raise Exception.create('Código a ser localizado inválido!');
         Entidade.SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
           ' WHERE CAX_CODIGO=:CAX_CODIGO '+
           ' AND CNC_CODIGO=:CNC_CODIGO '+
           ' AND MVC_CODIGO='+edtLocalizar.Text+
           ' ORDER BY MVC_CODIGO ';
       end;
   1 : Begin  //Data do Movimento
         if not VerificaDataBranco(edtLocalizar.Text) then
           Raise exception.Create('Data inválida!');
         Entidade.SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
           ' WHERE CAX_CODIGO=:CAX_CODIGO '+
           ' AND CNC_CODIGO=:CNC_CODIGO '+           
           ' AND MVC_DATA>="'+MesDia(edtLocalizar.Text)+'" '+
           ' AND MVC_DATA<"'+MesDia(StrToDate(edtLocalizar.Text)+1)+'" '+
           ' ORDER BY MVC_CODIGO ';
       end;
   2 : Begin  //Número do Movimento
         Entidade.SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
           ' WHERE CAX_CODIGO=:CAX_CODIGO '+
           ' AND CNC_CODIGO=:CNC_CODIGO '+           
           ' AND MVC_TIT_NUMERO LIKE "%'+edtLocalizar.Text+'%" '+
           ' ORDER BY MVC_CODIGO ';
       end;
   3 : Begin  //Código do Título
         if not VerificaInteiroBranco(edtLocalizar.Text) then
           raise Exception.create('Código a ser localizado inválido!');
         Entidade.SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
           ' WHERE CAX_CODIGO=:CAX_CODIGO '+
           ' AND CNC_CODIGO=:CNC_CODIGO '+           
           ' AND TIT_CODIGO='+edtLocalizar.Text+
           ' ORDER BY MVC_CODIGO ';
       end;
   4 : Begin  //Valor do Movimento
         if not VerificaFloat(edtLocalizar.Text) then
           raise Exception.create('Valor a ser localizado inválido!');
         Entidade.SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
           ' WHERE CAX_CODIGO=:CAX_CODIGO '+
           ' AND CNC_CODIGO=:CNC_CODIGO '+           
           ' AND MVC_VALOR='+VirgPonto(edtLocalizar.Text)+
           ' ORDER BY MVC_CODIGO ';
       end;
   5 : Begin  //Conta Agendada
         Entidade.SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
           ' WHERE CAX_CODIGO=:CAX_CODIGO '+
           ' AND CNC_CODIGO=:CNC_CODIGO '+           
           ' AND CCX_CODIGO IN '+
           ' (SELECT CCX_CODIGO FROM CONTA_DE_CAIXA '+
           ' WHERE CCX_DESCRICAO LIKE "%'+edtLocalizar.Text+'%") '+
           ' ORDER BY MVC_CODIGO ';
       end;
   6 : Begin  //Conta Recebida
         Entidade.SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
           ' WHERE CAX_CODIGO=:CAX_CODIGO '+
           ' AND CNC_CODIGO=:CNC_CODIGO '+           
           ' AND CCX_CODIGO_REC IN '+
           ' (SELECT CCX_CODIGO FROM CONTA_DE_CAIXA '+
           ' WHERE CCX_DESCRICAO LIKE "%'+edtLocalizar.Text+'%") '+
           ' ORDER BY MVC_CODIGO ';
       end;
   7 : Begin  //Observação do Movimento
         Entidade.SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
           ' WHERE CAX_CODIGO=:CAX_CODIGO '+
           ' AND CNC_CODIGO=:CNC_CODIGO '+           
           ' AND MVC_OBSERVACAO1 LIKE "%'+edtLocalizar.Text+'%" '+
           ' ORDER BY MVC_CODIGO ';
       end;
  end;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtUsuario.Clear;
  end;
end;

procedure TfMxMovCx.Movimento_caixa1CalcFields(DataSet: TDataSet);
begin
  with Caixa2 do
  Begin
    if (CodigoCNC <> Entidade.CodigoCNC) or
       (CodigoCAX <> Entidade.CodigoCAX) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      ParamByName('CAX_CODIGO').asInteger := Entidade.CodigoCAX;
      Open;
    end;
    Entidade.FieldByName('Caixa').asString := Descricao;
  end;

  with Conta_de_Caixa2 do
  Begin
    if CodigoCCX <> Entidade.CodigoCCX then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger:=Entidade.CodigoCCX;
      Open;
    end;
    Entidade.FieldByName('ContaAgendada').asString := Descricao;

    if CodigoCCX <> Entidade.CodigoCCXRecebimento then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger:=Entidade.CodigoCCXRecebimento;
      Open;
    end;
    Entidade.FieldByName('ContaAgendada').asString := Descricao;
  end;

  with Parametro3 do
  Begin
    if CodigoPAR <> Entidade.Tipo then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Entidade.Tipo;
      Open;
    end;
    Entidade.FieldByName('Documento').asString := Descricao;

    if CodigoPAR <> Entidade.TipoPGTO then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Entidade.TipoPGTO;
      Open;
    end;
    Entidade.FieldByName('Pagamento').asString := Descricao;
  end;
end;

procedure TfMxMovCx.FormKeyPress(Sender: TObject; var Key: Char);
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
  else if Key=chr(13) then
  Begin
    if SB_SalvarCab.Enabled then
    Begin
      SB_SalvarCab.SetFocus;
      SB_SalvarCabClick(sender);
    end;
  end
  else if (Key = '.') then
    Key := ','
  else if (key = '"') then
    Key:=#0;
end;

procedure TfMxMovCx.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  SairCab.Enabled       := not Habilitar;
  AlterarCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarCab.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_AltCab.Enabled     := not Habilitar;
  SB_SalvarCab.Enabled  := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);

  dblCodigoCAX.Enabled  := not Habilitar;

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

procedure TfMxMovCx.Movimento_caixa1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger := dblCodigoCNC.KeyValue;
  except
  end;
  try
    Entidade.ParamByName('CAX_CODIGO').asInteger := dblCodigoCAX.KeyValue;
  except
  end;
end;

procedure TfMxMovCx.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
