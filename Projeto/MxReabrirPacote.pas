unit MxReabrirPacote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, Titulo_receber, Menus, Item_Pedido_Venda,
  Informacoes, Item_de_Estoque, Movimento_Estoque_Comercial,
  Movimento_Fisico, Direito_de_Bonus, Pacote_de_venda;

type
  TfMxReabrirPacote = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bitReabrir: TBitBtn;
    bitFechar: TBitBtn;
    DSPacote_de_venda1: TDataSource;
    DBGrid1: TDBGrid;
    Titulo_receber1: TTitulo_receber;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    MainMenu1: TMainMenu;
    PedidodeVenda1: TMenuItem;
    Localizar1: TMenuItem;
    N1: TMenuItem;
    Confirmar1: TMenuItem;
    Cliente1: TCliente;
    Informacoes1: TInformacoes;
    Pacote_de_venda1: TPacote_de_venda;
    Pacote_de_venda1CNC_CODIGO: TIntegerField;
    Pacote_de_venda1PDV_CODIGO: TIntegerField;
    Pacote_de_venda1USU_CODIGO: TIntegerField;
    Pacote_de_venda1PCT_DT_CADASTRO: TDateTimeField;
    Pacote_de_venda1PCT_DT_ALTERADO: TDateTimeField;
    Pacote_de_venda1PCT_DT_MELHOR_DATA: TDateTimeField;
    Pacote_de_venda1PCT_DT_EMISSAO_VENDA: TDateTimeField;
    Pacote_de_venda1CNC_CLIENTE: TIntegerField;
    Pacote_de_venda1CLI_CODIGO: TIntegerField;
    Pacote_de_venda1FUN_CODIGO: TIntegerField;
    Pacote_de_venda1PCT_ENTRADA: TFloatField;
    Pacote_de_venda1PCT_ACRESCIMO: TFloatField;
    Pacote_de_venda1PCT_TOTAL: TFloatField;
    Pacote_de_venda1PCT_NOTA_FISCAL: TIntegerField;
    Pacote_de_venda1PCT_NOTA_CUPOM: TIntegerField;
    Pacote_de_venda1AGF_CODIGO: TIntegerField;
    Pacote_de_venda1FPG_CODIGO: TIntegerField;
    Pacote_de_venda1PCT_TIPO_PAG: TIntegerField;
    Pacote_de_venda1PCT_MAQUINA: TIntegerField;
    Pacote_de_venda1PCT_EM_USO: TIntegerField;
    Pacote_de_venda1PCT_VENCIMENTOS: TStringField;
    Pacote_de_venda1PCT_SITUACAO: TIntegerField;
    Pacote_de_venda1PCT_OBSERVACAO: TStringField;
    Pacote_de_venda1PCT_BLOQUEADO: TIntegerField;
    Pacote_de_venda1PCT_DT_DEVOLUCAO: TDateTimeField;
    Pacote_de_venda1PCT_GRUPO_ESPECIAL: TIntegerField;
    Pacote_de_venda1Cliente: TStringField;
    Pacote_de_venda1Centro: TStringField;
    Fechar2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitFecharClick(Sender: TObject);
    procedure bitReabrirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Pacote_de_venda1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Entidade : TPacote_de_venda;
    USU:string;
    Cancelar: Boolean;
  end;

var
  fMxReabrirPacote: TfMxReabrirPacote;

implementation
uses UDM, Funcoes, DigSenha;

{$R *.DFM}

procedure TfMxReabrirPacote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Titulo_receber1.Close;
  Action:=Cafree;
end;

procedure TfMxReabrirPacote.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxReabrirPacote.bitReabrirClick(Sender: TObject);
var
  Trans : Boolean;
  CdPDVCNC, CdPDV, CdCLICNC, CdCLI: integer;
  sCNC: string;
begin
  If Entidade.IsEmpty Then
  Begin
    ShowMessage('Escolha um pedido antes de continuar!');
    Exit;
  end;

  if Entidade.NotaFiscal <> 0 then
    Raise exception.Create('Não é possível reabrir Pacote de venda com Nota Emitida!');

  if Entidade.Situacao <> 4 then
    Raise exception.Create('Pacote não está na situação de finalizado!');

  CdPDVCNC   := Entidade.CodigoCNC;
  CdPDV      := Entidade.CodigoPDV;
  CdCLICNC   := Entidade.ClienteCNC;
  CdCLI      := Entidade.CodigoCLI;

  if DM.Configuracao1.CodigoCNC <> Entidade.CodigoCNC then
    Raise exception.Create('Não pode reabrir Pedido desse Centro de Custo!');

  if (DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode Reabrir esse Pedido neste centro de custo.');

  If MessageDlg('Atenção!!!'+#13+
                'Esse processo irá cancelar os título e reabrir o Pacote.'+#13+
                'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if DM.Configuracao1.Empresa <> empLBM then
    sCNC := ' AND CNC_CODIGO='+IntToStr(CdPDVCNC);

  with Titulo_receber1 do
  Begin
    Close;
    SQL.Text := 'SELECT TRC_CODIGO '+
      ' FROM TITULO_A_RECEBER '+
      ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
      sCNC+
      ' AND TRC_SITUACAO <> 0 '+
      ' AND TRC_SITUACAO <> 5 '+
      ' AND TRC_TIPO_PEDIDO=1 '; //Pacote de Venda
    Open;
    if not IsEmpty then
      Raise Exception.Create('Pacote com Título(s) pago(s)!'+#13+
                             'Não pode ser Reaberto!');
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
      ' AND PDV_PACOTE='+IntToStr(CdPDV)+
      ' AND PDV_SITUACAO=4 ';
    Open;
    if not isEmpty then
      Raise exception.Create('Remessa finalizada desse pacote! ('+FieldByName('PDV_CODIGO').asString+')');
  end;

  Informacoes1.Close;
  Informacoes1.ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
  Informacoes1.ParamByName('CLI_CODIGO').asInteger := CdCLI;
  Informacoes1.Open;

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8030)) < 0) then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=42;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      Begin
        if (Usuario1.Permissoes.IndexOf(IntToStr(8030)) < 0)then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão Reabrir Pacote de Venda!');
        end
        else
          DM.Usuario1.GeraLog(8030, CdPDVCNC, CdPDV,
            'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
            ' PACOTE DE VENDA-REABRIR');
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end
  else
    DM.Usuario1.GeraLog(8030, CdPDVCNC, CdPDV,
      'PACOTE DE VENDA-REABRIR');

  Trans:=false;
  try
    If DM.Configuracao1.ControleTransacao then
    Begin
      DM.Database2.StartTransaction;
      Trans:=True;
    end;

    ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
       ' TRC_SITUACAO=5 '+
       ',TRC_OBSERVACAO="Exc.P/'+DM.Usuario1.NomeUSU+' Reabrir Pacote" '+
       ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
       ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
       sCNC+
       ' AND TRC_TIPO_PEDIDO=1 '); //Pacote_de_venda
    DM.Usuario1.GeraLog(4520, CdPDVCNC,CdPDV,'Reabrir Pacote');

    //Pacote fica em Aberto
    ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
      ' PCT_SITUACAO=0 '+
      ',PCT_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
      ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
      ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV));

    with Cliente1 do
    Begin
      //Diminui o crédito utilizado do cliente
      if (Entidade.TipoPag <> 13) and  //Diferente de Cartão
         (Entidade.CodigoFPG <> 1) then //Diferente de à vista
        ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
          ' ICR_CRED_UTIL='+VirgPonto(Informacoes1.CreditoUtil-Entidade.Total-Entidade.Acrescimo)+
          ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
          ' AND CLI_CODIGO='+IntToStr(CdCLI));
    end;

    Entidade.GeraLog(8030, Entidade.CodigoCNC, Entidade.CodigoPDV);

    If DM.Configuracao1.ControleTransacao then
      DM.Database2.Commit;
    Trans := False;

    ShowMessage('Pedido Reaberto!');
  except
    ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
    If DM.Configuracao1.ControleTransacao then
      if trans then
      Begin
        DM.Database2.RollBack;
      end;
  end;
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxReabrirPacote.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Entidade.Close;
  Entidade.SQL.Text:='SELECT * FROM PACOTE_DE_VENDA '+
      ' WHERE PCT_SITUACAO = 4 '+
      ' AND PCT_DT_CADASTRO>="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' AND PCT_EM_USO=0 '+
      ' AND (PCT_NOTA_FISCAL=0 OR PCT_NOTA_FISCAL IS NULL) '+
      ' ORDER BY PDV_CODIGO ';
  Entidade.Open;
  ComboBox2.ItemIndex := 0;
  Edit11.SetFocus;
end;

procedure TfMxReabrirPacote.SB_LocClick(Sender: TObject);
begin
  Entidade.Selecionar;
end;

procedure TfMxReabrirPacote.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxReabrirPacote.FormCreate(Sender: TObject);
begin
  Entidade := Pacote_de_venda1;
end;

procedure TfMxReabrirPacote.Pacote_de_venda1CalcFields(DataSet: TDataSet);
begin
  with Cliente1 do
  Begin
    if (Entidade.ClienteCNC <> CodigoCNC) or
       (Entidade.CodigoCLI <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    Entidade.FieldByName('Cliente').asString := '('+PreencheZero(2,CodigoCNC)+'-'+IntToStr(CodigoCLI)+') '+RazaoSocial;
  end;

  //Definir Centro de Custo
  with DM.CentroCusto2 do
  Begin
    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      if Active = False then
        Open;
      if (Entidade.CodigoCNC > 0) then
      Begin
        if (Entidade.CodigoCNC <> COdigoCNC) then
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
          Open;
        end;
        Entidade.FieldByName('Centro').asString := RazaoSocial;
      end
      else
        Entidade.FieldByName('Centro').asString := '';
    end
    else //LBM
    Begin
      if Entidade.CodigoCNC <= 0 then
        Entidade.FieldByName('Centro').asString := 'ERRO'
      else if Entidade.CodigoCNC = 1 then
        Entidade.FieldByName('Centro').asString := 'Matriz'
      else
        Entidade.FieldByName('Centro').asString := 'Filial'+IntToStr(Entidade.CodigoCNC);
    end;
  end;
end;

end.
