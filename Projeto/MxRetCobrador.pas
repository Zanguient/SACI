unit MxRetCobrador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Pedido_de_Compra, Parametro, Titulo_receber,
  Pedido_de_Venda, Menus, Conta_de_Caixa, Informacoes;


type
  TfMxRetCobr = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Label20: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    Memo1: TMemo;
    DBLookupComboBox2: TDBLookupComboBox;
    Label10: TLabel;
    Label12: TLabel;
    Titulo_receber1: TTitulo_receber;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Edit4: TEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    Label14: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Titulos1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Conta_de_Caixa1: TConta_de_Caixa;
    DSConta_de_Caixa1: TDataSource;
    EfetuarPagamento1: TMenuItem;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    DSTitulo_receber1: TDataSource;
    Cliente1: TCliente;
    Titulo_receber2: TTitulo_receber;
    Informacoes1: TInformacoes;
    Label5: TLabel;
    Edit5: TEdit;
    SpeedButton12: TSpeedButton;
    SB_Alt: TSpeedButton;
    CheckBox1: TCheckBox;
    Label9: TLabel;
    Label15: TLabel;
    MaskEdit2: TMaskEdit;
    Label13: TLabel;
    SpeedButton2: TSpeedButton;
    Titulo_receber1TRC_CODIGO: TIntegerField;
    Titulo_receber1CNC_CODIGO: TIntegerField;
    Titulo_receber1PDV_CODIGO: TIntegerField;
    Titulo_receber1AGF_CODIGO: TIntegerField;
    Titulo_receber1CCX_CODIGO: TIntegerField;
    Titulo_receber1TRC_NUMERO: TStringField;
    Titulo_receber1TRC_SEQUENCIA: TStringField;
    Titulo_receber1CLI_CODIGO: TIntegerField;
    Titulo_receber1TRC_VENCIMENTO: TDateTimeField;
    Titulo_receber1TRC_VALOR: TFloatField;
    Titulo_receber1TRC_PAGAMENTO: TDateTimeField;
    Titulo_receber1TRC_VALOR_PAGO: TFloatField;
    Titulo_receber1TRC_SITUACAO: TIntegerField;
    Titulo_receber1TRC_CUSTODIA: TStringField;
    Titulo_receber1TRC_TIPO_DOC: TIntegerField;
    Titulo_receber1TRC_CRED_CLI: TFloatField;
    Titulo_receber1TRC_TIPO_PAG: TIntegerField;
    Titulo_receber1CNC_CLIENTE: TIntegerField;
    Titulo_receber1TRC_TITULOANT: TIntegerField;
    Titulo_receber1BOL_CODIGO: TIntegerField;
    Titulo_receber1TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber1TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber1Pagamento: TStringField;
    Titulo_receber1USU_CODIGO: TIntegerField;
    Titulo_receber1TRC_DT_ALTERADO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_INICIO: TDateTimeField;
    Titulo_receber1TRC_RGB_DT_SITUACAO: TDateTimeField;
    Titulo_receber1CPC_CODIGO: TIntegerField;
    Titulo_receber1TRC_RGB_SITUACAO: TIntegerField;
    Titulo_receber1TRC_RGB_VISITADO: TSmallintField;
    Titulo_receber1TRC_RGB_DT_PROMESSA: TDateTimeField;
    Titulo_receber1TRC_PROCESSO: TIntegerField;
    Titulo_receber1TRC_RGB_DT_VISITADO: TDateTimeField;
    Titulo_receber1DataVisitado: TStringField;
    MaskEdit3: TMaskEdit;
    Label11: TLabel;
    Titulo_receber1Cliente: TStringField;
    Titulo_receber1TRC_OBSERVACAO: TStringField;
    Titulo_receber1CCX_CODIGO_REC: TIntegerField;
    Titulo_receber1TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber1TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber1TRC_DT_CADASTRO: TDateTimeField;
    Titulo_receber1TRC_DESCONTO: TFloatField;
    Titulo_receber1TRC_JUROS: TFloatField;
    Titulo_receber1CNC_ORIGEM: TIntegerField;
    Titulo_receber1TRC_PEDIDO_SERVICO: TIntegerField;
    Titulo_receber1TRC_TIPO_PEDIDO: TIntegerField;
    Titulo_receber1TRC_DT_EMISSAO_BOLETO: TDateTimeField;
    Titulo_receber1TRC_DT_RECEBIMENTO_BOLETO: TDateTimeField;
    Titulo_receber1FPE_CODIGO: TIntegerField;
    Titulo_receber1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Titulo_receber1TRC_DT_COMPETENCIA: TDateTimeField;
    Titulo_receber1TRC_EQUIFAX: TIntegerField;
    Titulo_receber1TRC_DT_EQUIFAX: TDateTimeField;
    Titulo_receber1TRC_AGENCIA_NUMERO: TStringField;
    Titulo_receber1TRC_DT_CHEQUE: TDateTimeField;
    Titulo_receber1TRC_SIT_CHEQUE: TIntegerField;
    Titulo_receber1TRC_REABERTURA: TIntegerField;
    Titulo_receber1TRC_VERIFICADO: TIntegerField;
    Titulo_receber1TRC_DT_VERIFICADO: TDateTimeField;
    Titulo_receber1CHQ_CODIGO: TIntegerField;
    Titulo_receber1CNC_CHEQUE: TIntegerField;
    Titulo_receber1TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Titulo_receber1TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber1CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber1MCC_CODIGO: TIntegerField;
    Titulo_receber1TRC_CV: TStringField;
    Titulo_receber1TRC_LOCAL: TStringField;
    Titulo_receber1TRF_CODIGO: TIntegerField;
    procedure ComboBox2Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Titulo_receber1AfterScroll(DataSet: TDataSet);
    procedure Sair1Click(Sender: TObject);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Titulo_receber1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TTitulo_receber;
    Cancelar:Boolean;
  end;

var
  fMxRetCobr: TfMxRetCobr;

implementation
Uses UDM, MxSPediLoc, MxCobCobrador,funcoes,
  MxSelRegVisitado, URetornoCobrador, MxRegObs,
  URelDataPromessa, DigSenha;
{$R *.DFM}


procedure TfMxRetCobr.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfMxRetCobr.SB_LocClick(Sender: TObject);
var
  mensagem:string;
begin
 mensagem:='';
 If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      mensagem:= mensagem+'Código a ser localizado inválido!'+#13;
 If ComboBox2.ItemIndex=1 then
    if not VerificaInteiroBranco(Edit11.Text) then
      mensagem:= mensagem+'Pedido a ser localizado inválido!';
 If ComboBox2.ItemIndex=2 then
    if not VerificaInteiroBranco(Edit11.Text) then
      mensagem:= mensagem+'Código do cliente a ser localizado inválido!';
 if mensagem<>'' then
   raise exception.Create(mensagem);
 Entidade.Localizar;
end;


procedure TfMxRetCobr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Parametro1.Active:=False;
  Parametro2.Active:=False;
  Conta_de_Caixa1.Active:=False;

  Action:=Cafree;
end;
procedure TfMxRetCobr.Titulo_receber1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
//  Titulo_receber2.Close;
//  Titulo_receber2.ParamByName('TRC_CODIGO').AsInteger :=  Entidade.CodigoTRC;
//  Titulo_receber2.ParamByName('CNC_CODIGO').AsInteger :=  Entidade.CodigoCNC;
//  Titulo_receber2.Open;
  CheckBox1.Checked:=Entidade.Visitado;
  if (CheckBox1.Checked) and (Entidade.DtVisitado > 0) then
    MaskEdit3.Text:=DateToStr(Entidade.DtVisitado)
  else
    MaskEdit3.Clear;
  if Entidade.DtPromessa = 0 then
    MaskEdit2.Clear
  else
    MaskEdit2.Text:=FormatDateTime('dd/mm/yyyy', Entidade.DtPromessa);
  Memo1.Lines.Text:=Entidade.OBS;
end;

procedure TfMxRetCobr.Sair1Click(Sender: TObject);
begin
 Close;
end;


procedure TfMxRetCobr.SB_PrimClick(Sender: TObject);
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

procedure TfMxRetCobr.SB_AntClick(Sender: TObject);
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

procedure TfMxRetCobr.SB_ProxClick(Sender: TObject);
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

procedure TfMxRetCobr.SB_UltClick(Sender: TObject);
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

procedure TfMxRetCobr.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ComboBox2.ItemIndex:=0;
  Edit11.SetFocus;
end;


procedure TfMxRetCobr.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Cobrança sem Títulos!');
  Application.CreateForm(TfMxSelRegVisitado, fMxSelRegVisitado);
  fMxSelRegVisitado.ShowModal;
end;

procedure TfMxRetCobr.SpeedButton12Click(Sender: TObject);
begin
  Application.CreateForm(Trpt_DataPromessa, rpt_DataPromessa);
  rpt_DataPromessa.Tag := 0;
  rpt_DataPromessa.ShowModal;
end;

procedure TfMxRetCobr.SpeedButton2Click(Sender: TObject);
var
  TRC:integer;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Cobrança sem Títulos!');
  TRC:=Entidade.CodigoTRC;
  Application.CreateForm(TFmxRegObs, FmxRegObs);
  FmxRegObs.ShowModal;
  Entidade.Close;
  Entidade.Open;
  Entidade.LocalizarCod(TRC,fMxCobCobrador.Entidade.OrigemCNC);   //DM.Configuracao1.CodigoCNC
end;

procedure TfMxRetCobr.Titulo_receber1CalcFields(DataSet: TDataSet);
begin
  if Entidade.Pagamento > 0 then
    Entidade.FieldByName('Pagamento').asString:=formatDateTime('dd/mm/yyyy',Entidade.Pagamento)
  else
    Entidade.FieldByName('Pagamento').asString:='';
  if (Entidade.DtVisitado > 0) and (Entidade.Visitado) then
    Entidade.FieldByName('DataVisitado').asString:=formatDateTime('dd/mm/yyyy',Entidade.DtVisitado)
  else
    Entidade.FieldByName('DataVisitado').asString:='';
  Cliente1.Close;
  Cliente1.ParamByName('CLI_CODIGO').AsInteger :=  Entidade.CodigoCLI;
  Cliente1.ParamByName('CNC_CODIGO').AsInteger :=  Entidade.ClienteCNC;
  Cliente1.Open;
  Entidade.FieldByName('Cliente').asString:=Cliente1.RazaoSocial;
end;

procedure TfMxRetCobr.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

end.
