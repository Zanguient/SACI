unit MxControleSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Mask, StdCtrls, Buttons;

type
  TfMxControleSPC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SBPrevEnvia: TSpeedButton;
    SBEnviar: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton11: TSpeedButton;
    GroupBox1: TGroupBox;
    SpeedButton4: TSpeedButton;
    mskEnviadosINI: TMaskEdit;
    GroupBox2: TGroupBox;
    SpeedButton5: TSpeedButton;
    mskLiberadosINI: TMaskEdit;
    Label6: TLabel;
    mskEnviadosFIM: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    mskLiberadosFIM: TMaskEdit;
    ckbCodigoCLI1: TCheckBox;
    edtCodigoCLI1: TEdit;
    ckbCodigoCLI2: TCheckBox;
    edtCodigoCLI2: TEdit;
    procedure SpeedButton11Click(Sender: TObject);
    procedure SBEnviarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBPrevEnviaClick(Sender: TObject);
    procedure ckbCodigoCLI1Click(Sender: TObject);
    procedure ckbCodigoCLI2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CdCLI1,CdCLI2 : string;
  public
    { Public declarations }
  end;

var
  fMxControleSPC: TfMxControleSPC;

implementation

uses UDM, UEnviaSPC, funcoes, UEnviadosSPC, URecebidosSPC;

{$R *.DFM}

procedure TfMxControleSPC.SpeedButton11Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxControleSPC.SBEnviarClick(Sender: TObject);
begin
  If MessageDlg('Atenção!!!'+#13+'Esse procedimento irá bloquear vendas para os clientes inadiplentes.'+#13+
      'A única forma de liberar a venda a esses clientes será quitando todas as parcelas referentes a esse atrazo.'+#13+
      'Inclusive títulos renegociados!'+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;


  if ckbCodigoCLI1.Checked then
  begin
    if not VerificaInteiroBranco(edtCodigoCLI1.Text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI1:=' AND (CLI_CODIGO='+edtCodigoCLI1.Text+') ';
    end;
  end
  else
    CdCLI1:=' ';


  ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
    ' CLI_SPC=1 '+
    ',CLI_DT_SPC="'+MesDia(DM.Configuracao1.Data)+'" '+
    ',CLI_SITUACAO=3 '+
    ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
    ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+CdCLI1+
    ' AND CLI_CODIGO<>'+IntToStr(DM.Configuracao1.CodigoCliAVista)+
    ' AND (CLI_SPC IS NULL OR CLI_SPC IN (0,2)) AND CLI_CODIGO IN '+
    ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
    ' WHERE CNC_CLIENTE='+IntToStr(DM.Configuracao1.CodigoCNC)+
    ' AND (TRC_SITUACAO<2 OR TRC_SITUACAO=8) '+
    ' AND (TRC_VENCIMENTO<="'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.EnviarSPC)+'" '+
    ' OR (TRC_DTORIGINAL<="'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.EnviarSPC)+'" '+
    ' AND TRC_DTORIGINAL IS NOT NULL))) ');
end;

procedure TfMxControleSPC.SpeedButton3Click(Sender: TObject);
begin
  If MessageDlg('Atenção!!!'+#13+'Esse procedimento irá liberar os clientes que estavam no SPC e pagaram as dívidas!'+#13+
    'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if ckbCodigoCLI2.Checked then
  begin
    if not VerificaInteiroBranco(edtCodigoCLI2.Text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI2:=' AND (CLI_CODIGO='+edtCodigoCLI2.Text+') ';
      ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
        ' CLI_SPC=2 '+
        ',CLI_DT_SPC="'+MesDia(DM.Configuracao1.Data)+'" '+
        ',CLI_SITUACAO=2 '+
        ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+CdCLI2+
        ' AND CLI_SPC = 1 ');
    end;
  end
  else
  begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
      ' CLI_SPC=2 '+
      ',CLI_DT_SPC="'+MesDia(DM.Configuracao1.Data)+'" '+
      ',CLI_SITUACAO=2 '+
      ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+CdCLI2+
      ' AND CLI_SPC = 1 AND CLI_CODIGO NOT IN '+
      ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND (TRC_SITUACAO<2 OR TRC_SITUACAO=8) '+
      ' AND (TRC_VENCIMENTO<="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' OR (TRC_DTORIGINAL<="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' AND TRC_DTORIGINAL IS NOT NULL))) ');
    CdCLI2:=' ';
  end;
end;

procedure TfMxControleSPC.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Edit1.Text:=IntToStr(DM.Configuracao1.EnviarSPC);
end;

procedure TfMxControleSPC.SpeedButton4Click(Sender: TObject);
var
  vDataINI, vDataFIM:string;
begin
  vDataINI := '';
  vDataFIM := '';

  if ckbCodigoCLI1.Checked then
  begin
    if not VerificaInteiroBranco(edtCodigoCLI1.Text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI1:=' AND (CLI_CODIGO='+edtCodigoCLI1.Text+') ';
    end;
  end
  else
    CdCLI1:=' ';

  if not VerificaData(mskEnviadosINI.Text) then
    Raise Exception.Create('Data inválida!')
  else if VerificaDataBranco(mskEnviadosINI.Text) then
    vDataINI := ' AND CLI_DT_SPC>="'+MesDia(mskEnviadosINI.Text)+'" ';

  if not VerificaData(mskEnviadosFIM.Text) then
    Raise Exception.Create('Data inválida!')
  else if VerificaDataBranco(mskEnviadosFIM.Text) then
    vDataFIM := ' AND CLI_DT_SPC<"'+MesDia(StrToDate(mskEnviadosFIM.Text)+1)+'" ';

  Application.CreateForm(Trpt_EnviadosSPC, rpt_EnviadosSPC);
  with rpt_EnviadosSPC do
  Begin
    tag:=0;
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * '+
        ' FROM CLIENTE '+
        ' WHERE CLI_SPC=1 '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        vDataINI+vDataFIM+CdCLI1+
        ' ORDER BY CLI_RZ_SOCIAL ASC';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxControleSPC.SpeedButton5Click(Sender: TObject);
var
  vDataINI, vDataFIM:string;
begin
  if ckbCodigoCLI2.Checked then
  begin
    if not VerificaInteiroBranco(edtCodigoCLI2.Text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI2:=' AND (CLI_CODIGO='+edtCodigoCLI2.Text+') ';
    end;
  end
  else
    CdCLI2:=' ';

  vDataINI := '';
  vDataFIM := '';
  if not VerificaData(mskLiberadosINI.Text) then
    Raise Exception.Create('Data inicial inválida!')
  else if VerificaDataBranco(mskLiberadosINI.Text) then
    vDataINI := ' AND CLI_DT_SPC>="'+MesDia(mskLiberadosINI.Text)+'" ';

  if not VerificaData(mskLiberadosFIM.Text) then
    Raise Exception.Create('Data final inválida!')
  else if VerificaDataBranco(mskLiberadosFIM.Text) then
    vDataFIM := ' AND CLI_DT_SPC<"'+MesDia(StrToDate(mskLiberadosFIM.Text)+1)+'" ';

  Application.CreateForm(Trpt_RecebidosSPC, rpt_RecebidosSPC);
  with rpt_RecebidosSPC do
  Begin
    tag:=0;
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * '+
        ' FROM CLIENTE '+
        ' WHERE CLI_SPC=2 '+
        vDataINI+vDataFIM+CdCLI2+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' ORDER BY CLI_RZ_SOCIAL ASC';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxControleSPC.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxControleSPC.SBPrevEnviaClick(Sender: TObject);
begin
  if ckbCodigoCLI1.Checked then
  begin
    if not VerificaInteiroBranco(edtCodigoCLI1.Text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI1:=' AND (CLI_CODIGO='+edtCodigoCLI1.Text+') ';
    end;
  end
  else
    CdCLI1:=' ';

  Application.CreateForm(Trpt_EnviadosSPC, rpt_EnviadosSPC);
  with rpt_EnviadosSPC do
  Begin
    tag:=0;
    Caption := 'Previsao Enviados';
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+CdCLI1+
      ' AND CLI_CODIGO<>'+IntToStr(DM.Configuracao1.CodigoCliAVista)+
      ' AND (CLI_SPC IS NULL OR CLI_SPC IN (0,2)) '+
      ' AND CLI_CODIGO IN '+
      ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
      ' WHERE CNC_CLIENTE='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND (TRC_SITUACAO<2 OR TRC_SITUACAO=8) '+
      ' AND (TRC_VENCIMENTO<="'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.EnviarSPC)+'" '+
      ' OR (TRC_DTORIGINAL<="'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.EnviarSPC)+'" '+
      ' AND TRC_DTORIGINAL IS NOT NULL))) '+
      ' ORDER BY CLI_RZ_SOCIAL ASC';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxControleSPC.ckbCodigoCLI1Click(Sender: TObject);
begin
  if ckbCodigoCLI1.Checked then
  Begin
    edtCodigoCLI1.Color:=clWindow;
    edtCodigoCLI1.Enabled:=True;
    edtCodigoCLI1.SetFocus;
  end
  else
  Begin
    edtCodigoCLI1.Color:=AlteraCorComponentes;
    edtCodigoCLI1.Text:='';
    edtCodigoCLI1.Enabled:=False;
  end;
end;

procedure TfMxControleSPC.ckbCodigoCLI2Click(Sender: TObject);
begin
  if ckbCodigoCLI2.Checked then
  Begin
    edtCodigoCLI2.Color:=clWindow;
    edtCodigoCLI2.Enabled:=True;
    edtCodigoCLI2.SetFocus;
  end
  else
  Begin
    edtCodigoCLI2.Color:=AlteraCorComponentes;
    edtCodigoCLI2.Text:='';
    edtCodigoCLI2.Enabled:=False;
  end;
end;

procedure TfMxControleSPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
