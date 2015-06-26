unit MxExtornoAvulso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Menus, Movimento_caixa,
  Conta_de_Caixa, Db, DBTables, SQuery, Parametro,Variants,MMSystem, Grids,
  DBGrids, Caixa, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfMxExtornoAvulso = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Extornar: TBitBtn;
    SB_Fechar: TBitBtn;
    Conta_de_Caixa1: TConta_de_Caixa;
    DBGrid5: TDBGrid;
    Panel3: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Movimento_caixa1: TMovimento_caixa;
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
    Movimento_caixa1TIT_CODIGO: TIntegerField;
    Movimento_caixa1CNC_TITULO: TIntegerField;
    Movimento_caixa1MVC_PT: TStringField;
    Movimento_caixa1MVC_COMPETENCIA: TDateTimeField;
    Movimento_caixa1USU_CODIGO: TIntegerField;
    Movimento_caixa1MVC_DT_ALTERADO: TDateTimeField;
    Movimento_caixa1CCX_CODIGO_REC: TIntegerField;
    Movimento_caixa1MVC_NAO_CONTABIL: TIntegerField;
    Movimento_caixa1MVC_ORIGEM_EXTORNO: TIntegerField;
    Movimento_caixa1ContaAgendada: TStringField;
    Movimento_caixa1ContaRecebida: TStringField;
    Movimento_caixa1Caixa: TStringField;
    Movimento_caixa1TipoPagamento: TStringField;
    Movimento_caixa1TipoDocumento: TStringField;
    Caixa1: TCaixa;
    Movimento_caixa1MVC_JUROS: TFloatField;
    Movimento_caixa1MVC_DESCONTO: TFloatField;
    Movimento_caixa1MVC_CRED_CLI: TFloatField;
    Movimento_caixa1MVC_VALOR_DOC: TFloatField;
    Movimento_caixa1MVC_MAQUINA: TIntegerField;
    Movimento_caixa1MVC_DT_CHEQUE: TDateTimeField;
    ActionManager1: TActionManager;
    LocalizarPed: TAction;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure MenuItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ExtornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Movimento_caixa1CalcFields(DataSet: TDataSet);
    procedure SB_LocClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Movimento_caixa1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Entidade: TMovimento_caixa;
  end;

var
  fMxExtornoAvulso: TfMxExtornoAvulso;

implementation
Uses
  UDM,funcoes;
{$R *.DFM}

procedure TfMxExtornoAvulso.MenuItem1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxExtornoAvulso.FormCreate(Sender: TObject);
begin
  Entidade := Movimento_caixa1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_EXTORNO_AVULSO_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;  
end;

procedure TfMxExtornoAvulso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_EXTORNO_AVULSO_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Conta_de_Caixa1.Close;
  Action:=caFree;
end;

procedure TfMxExtornoAvulso.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxExtornoAvulso.SB_ExtornarClick(Sender: TObject);
var
  trans:boolean;
  sSinal, sMov: string;
  CdCNC, CdMVC, CaixaCNC: integer;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Movimento!');
  if (Entidade.CodigoTIT > 0) then
  Begin
    if (DM.Configuracao1.Empresa <> 1) then
      Raise exception.Create('Extorne o Título!')
    else
    Begin
      If MessageDlg('Atenção!!!'+#13+
                    'Movimento gerado por Título!'+#13+
                    'Esse processo não irá reabrir o Título!'+#13+
                    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
    end;
  end;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7660)) < 0 then
    Raise exception.Create('Usuário não tem permissão para extornar movimento!');


  CdCNC := Entidade.CodigoCNC;
  CdMVC := Entidade.CodigoMVC;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND MVC_ORIGEM_EXTORNO='+IntToStr(CdMVC);
    Open;
    if not IsEmpty then
      Raise exception.Create('Título já extornado!');
  end;

  If MessageDlg('Atenção!!!'+#13+
                'Deseja extornar esse movimento?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if Entidade.Dc = 'D' then
  Begin
    sMov   := 'C';
    sSinal := '+';
  end
  else
  Begin
    sMov   := 'D';
    sSinal := '-'; //Extorno será um Débito
  end;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  DM.Caixa1.Close;
  DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
  DM.Caixa1.Open;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,
          Entidade.CodigoCCX,Entidade.CodigoCCXRecebimento,
          Entidade.CodigoCAX,Entidade.TipoPGTO,
          Entidade.Tipo,Entidade.CodigoCNC,
          Entidade.ChequeCNC,Entidade.CodigoCHQ,
          'Ext-'+Entidade.Descricao, Entidade.Flag,Entidade.Numero,Entidade.Observacao,
          Entidade.Sequencia,sMov,Entidade.Valor,Entidade.Desconto,Entidade.Juros,
          Entidade.CreditoCliente(*CredCli*),Entidade.ValorDocumento(*ValorDoc*),
          DM.Configuracao1.DataHora,Entidade.Competencia,Entidade.DataCheque(*DtCheque*),
          Entidade.CodigoTIT,Entidade.CNCTitulo,
          Entidade.PT, Entidade.CodigoMVC, True) then
        Raise Exception.Create('');

      if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
        if not DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,
            1,0,'Movimento de Caixa','Extorno Mov. Avulso: '+IntToStr(CdMVC)+#13+#10+
            'Valor: R$ '+format('%.2f',[Entidade.Valor])+' '+sMov+' ('+IntToStr(Entidade.Tipo)+')') then
        Begin
          ShowMessage('Falha ao gerar Mensagem!');
          Raise Exception.Create('');
        end;

      ExecutaSQL(DM.QR_Comandos, 'UPDATE MOVIMENTO_DE_CAIXA SET '+
        ' MVC_NAO_CONTABIL=1 '+
        ' WHERE MVC_CODIGO='+IntToStr(CdMVC)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      If DM.Configuracao1.ControleTransacao then
         Commit;
      Trans := False;
      try
        sndPlaySound(PChar(cSomRegistradora),SND_ASYNC);
      except
      end;
      with Entidade do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
          ' WHERE CNC_CODIGO=:CNC_CODIGO '+
          ' AND (MVC_CODIGO='+IntToStr(CdMVC)+
          ' OR MVC_ORIGEM_EXTORNO='+IntToStr(CdMVC)+')'+
          ' ORDER BY MVC_CODIGO ASC ';
        Open;
      end;
      ShowMessage('Extorno Efetuado!');
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

procedure TfMxExtornoAvulso.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  with Entidade do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
      ' WHERE MVC_DATA>="'+MesDia(dm.Configuracao1.Data)+'" '+
      ' AND MVC_DATA<"'+MesDia(dm.Configuracao1.Data+1)+'" '+
      ' AND CNC_CODIGO=:CNC_CODIGO '+
      ' ORDER BY MVC_CODIGO ';
    Open;
  end;
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfMxExtornoAvulso.Movimento_caixa1CalcFields(DataSet: TDataSet);
begin
  with Conta_de_Caixa1 do
  Begin
    if CodigoCCX <> Entidade.CodigoCCX then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
      Open;
    end;
    Entidade.FieldByName('ContaAgendada').asString := Descricao;

    if CodigoCCX <> Entidade.CodigoCCXRecebimento then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCXRecebimento;
      Open;
    end;
    Entidade.FieldByName('ContaRecebida').asString := Descricao;
  end;

  Entidade.FieldByName('TipoDocumento').asString := DM.SelecionaParametro(Entidade.Tipo);
  Entidade.FieldByName('TipoPagamento').asString := DM.SelecionaParametro(Entidade.TipoPGTO);

  with Caixa1 do
  Begin
    if CodigoCAX <> Entidade.CodigoCAX then
    Begin
      CLose;
      ParamByName('CAX_CODIGO').asInteger := Entidade.CodigoCAX;
      Open;
    end;
    Entidade.FieldByName('Caixa').asString := Descricao;
  end;
end;

procedure TfMxExtornoAvulso.SB_LocClick(Sender: TObject);
begin
  if cmbCampo.ItemIndex = 3 then //Data
  Begin
    with Entidade do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM MOVIMENTO_DE_CAIXA '+
        ' WHERE MVC_DATA>="'+MesDia(edtLocalizar.Text)+'" '+
        ' AND MVC_DATA<"'+MesDia(StrToDate(edtLocalizar.Text)+1)+'" '+
        ' AND CNC_CODIGO=:CNC_CODIGO '+
        ' ORDER BY MVC_CODIGO ';
      Open;
    end;
  end
  else
    Entidade.Selecionar;
end;

procedure TfMxExtornoAvulso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then
    Close
  else if key=#13 then
    SB_ExtornarClick(sender);
end;

procedure TfMxExtornoAvulso.Movimento_caixa1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
end;

end.
