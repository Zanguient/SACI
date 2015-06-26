unit MxRegObs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DBCtrls, ExtCtrls, Mask, DB, DBTables, SQuery,
  Funcionario;

type
  TFmxRegObs = class(TForm)
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Memo1: TMemo;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    CheckBox1: TCheckBox;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    dblCobrador: TDBLookupComboBox;
    DSFuncionario1: TDataSource;
    Memo2: TMemo;
    Label2: TLabel;
    Label4: TLabel;
    Funcionario1: TQuery;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmxRegObs: TFmxRegObs;

implementation

uses MxSRecPedido, funcoes, UDM, MxRetCobrador, Titulo_receber,
  MxCobCobrador, Cobranca_por_Cobrador;

{$R *.DFM}


procedure TFmxRegObs.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFmxRegObs.SpeedButton5Click(Sender: TObject);
var
  Visita:Integer;
  DataP,DataVisita:string;
begin
  if CheckBox1.Checked then
    Visita:=1
  else
    Visita:=0;

  if VerificaDataBranco(MaskEdit1.Text) then
    DataP:='"'+MesDia(MaskEdit1.Text)+'" '
  else if not VerificaData(MaskEdit1.Text) then
    Raise Exception.Create('Data de Promessa inválida!')
  else
    DataP:='NULL ';

  if CheckBox1.Checked then
  Begin
    if not VerificaDataBranco(MaskEdit2.Text) then
      Raise Exception.Create('Data da visita inválida!')
    else
      DataVisita:='"'+MesDia(MaskEdit2.Text)+'" ';
  end
  else
    DataVisita:='NULL ';

  ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
    ' TRC_RGB_DT_PROMESSA='+DataP+
    ',TRC_RGB_VISITADO='+IntToStr(Visita)+
    ',TRC_OBSERVACAO="'+Memo1.Lines.Text+'" '+
    ',TRC_RGB_DT_VISITADO='+DataVisita+
    ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE CNC_CODIGO='+IntToStr(fMxRetCobr.Titulo_receber1.CodigoCNC)+
    ' AND TRC_CODIGO='+IntToStr(fMxRetCobr.Titulo_receber1.CodigoTRC));

  //Transferindo o título para outro cobrador
  //Ajustar quando for centralizado
  try
    if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
    begin
      {DM.QueryExec.Close;
      DM.QueryExec.SQL.Text := 'UPDATE ITEM_DE_COBRANCA_COBRADOR SET CPC_CODIGO = '''+inttostr(Cobranca_por_Cobrador1.FieldByName('CPC_CODIGO').AsInteger)+''''+
                               ', CNC_CODIGO = '''+inttostr(Cobranca_por_Cobrador1.FieldByName('CNC_CODIGO').AsInteger)+''' WHERE ICC_CODIGO = '''+inttostr(fMxCobCobrador.Titulo_receber1.FieldByName('ICC_CODIGO').AsInteger)+'''';
      DM.QueryExec.ExecSQL;}
    end
    else
    begin
      DM.QueryExec.Close;
      DM.QueryExec.SQL.Text := 'UPDATE TITULO_A_RECEBER SET CPC_CODIGO = '''+inttostr(dblCobrador.Keyvalue)+''''+
                               ', CNC_CODIGO = '''+inttostr(Funcionario1.FieldByName('CNC_CODIGO').AsInteger)+'''  '+
                               ' WHERE TRC_CODIGO = '''+inttostr(fMxRetCobr.Titulo_receber1.FieldByName('TRC_CODIGO').AsInteger)+'''';
      DM.QueryExec.ExecSQL;
    end;
  except
  end;


  ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
    ' CLI_OBS1="'+Memo2.Lines.Text+'" '+
    ' WHERE CNC_CODIGO='+IntToStr(fMxRetCobr.Titulo_receber1.CodigoCNC)+
    ' AND CLI_CODIGO='+IntToStr(fMxRetCobr.Titulo_receber1.CodigoCLI));

  Close;
end;

procedure TFmxRegObs.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  dblCobrador.KeyValue := fMxCobCobrador.Entidade.CodigoCPC;

  dblCobrador.Enabled := false;

  if fMxRetCobr.Entidade.DtPromessa > 0 then
    MaskEdit1.Text:=DateToStr(fMxRetCobr.Entidade.DtPromessa)
  else
    MaskEdit1.Clear;
  if (fMxRetCobr.Entidade.DtVisitado > 0) and (fMxRetCobr.Entidade.Visitado) then
    MaskEdit2.Text:=DateToStr(fMxRetCobr.Entidade.DtVisitado)
  else
    MaskEdit2.Clear;
  CheckBox1.Checked:=fMxRetCobr.Entidade.Visitado;
  Memo1.Lines.Text:=fMxRetCobr.Entidade.OBS;
  //
  try
    dblCobrador.SetFocus;
  except
    MaskEdit1.SetFocus;
  end;

  Memo1.Align := alClient;
  Memo2.Visible := false;
end;

procedure TFmxRegObs.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  Begin
    MaskEdit2.Enabled := True;
    MaskEdit2.Color:=clWindow;
    MaskEdit2.Text:=DateToStr(DM.Configuracao1.Data);
    MaskEdit2.SetFocus;
  end
  else
  Begin
    MaskEdit2.Enabled := False;
    MaskEdit2.Color:=AlteraCorComponentes;
    MaskEdit2.Clear;
  end;
end;

procedure TFmxRegObs.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TFmxRegObs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Funcionario1.Close;
end;

procedure TFmxRegObs.FormCreate(Sender: TObject);
begin
  Funcionario1.Close;
  Funcionario1.ParamByName('CNC_CODIGO').Value := fMxRetCobr.Titulo_receber1.FieldByName('CNC_CODIGO').Value;
  Funcionario1.Open;
end;

end.
