unit MxSelPacoteCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, DBTables, SQuery, CentroCusto, DBCtrls, ExtCtrls,
  Mask, Usuario;

type
  TfMxSelPacoteCredito = class(TForm)
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Panel1: TPanel;
    dblCodigoCNC: TDBLookupComboBox;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    ckbCodigoCNC: TCheckBox;
    ckbCodigoUSU: TCheckBox;
    dblCodigoUSU: TDBLookupComboBox;
    Usuario1: TUsuario;
    DSUsuario1: TDataSource;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbCodigoPCR: TCheckBox;
    edtCodigoPCR: TEdit;
    ckbCancelados: TCheckBox;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    rdgDataCadastro: TRadioButton;
    rdgDataAlterado: TRadioButton;
    SB_Cancelar: TBitBtn;
    Bevel1: TBevel;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoUSUClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbCodigoPCRClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelPacoteCredito: TfMxSelPacoteCredito;

implementation
Uses UDM, UPrinc2, funcoes, CdCliente, UPacoteCredito;
{$R *.DFM}

procedure TfMxSelPacoteCredito.SB_ConfirmarClick(Sender: TObject);
Var
  Centro,USU,CdPCR,CdCLI,DtINI,DtFIM,Sit,sFiltros:string;
begin
  sFiltros := '';
  USU := '';
  CdCLI:='';
  CdPCR:='';
  Sit:='';
  DtINI := '';
  DtFIM := '';

  if rdgDataCadastro.Checked then
    sFiltros := sFiltros + '(Cad)'
  else
    sFiltros := sFiltros + '(Alt)';

  if not VerificaData(mskDataINI.Text) then
    Raise exception.Create('Data inicial inválida!')
  else if VerificaDataBranco(mskDataINI.Text) then
  Begin
    if rdgDataCadastro.Checked then
      DtINI:=' AND PCR_DT_CADASTRO>="' +MesDia(mskDataINI.Text)+'" '
    else
      DtINI:=' AND PCR_DT_ALTERADO>="' +MesDia(mskDataINI.Text)+'" ';
  end;

  if not VerificaData(mskDataFIM.Text) then
    Raise exception.Create('Data final inválida!')
  else if VerificaDataBranco(mskDataFIM.Text) then
  Begin
    if rdgDataCadastro.Checked then
      DtFIM := ' AND PCR_DT_CADASTRO<"' +MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else
      DtFIM := ' AND PCR_DT_ALTERADO<"' +MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';    
  end;
  
  if ckbCodigoCNC.Checked then
  Begin
    Centro := ' WHERE CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';
    sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
  end
  else
    Centro := ' WHERE (CNC_CODIGO<>-1 OR CNC_CODIGO IS NULL) ';

  if ckbCodigoUSU.Checked then
    if dblCodigoUSU.Text = '' then
      Raise Exception.Create('Usuário inválido!')
    else
    Begin
      USU := ' AND USU_CODIGO='+IntToStr(dblCodigoUSU.KeyValue)+' ';
      sFiltros := sFiltros + '(USU:'+IntToStr(dblCodigoUSU.KeyValue)+')';
    end;

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI:=' AND (CLI_CODIGO='+edtCodigoCLI.Text+')';
      sFiltros := sFiltros + '(CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoPCR.Checked then
    if not VerificaInteiroBranco(edtCodigoPCR.Text) then
      Raise Exception.Create('Código do Pacote inválido!')
    else
    Begin
      CdPCR:=' AND (PCR_CODIGO='+edtCodigoPCR.Text+') ';
      sFiltros := sFiltros + '(PCR:'+edtCodigoPCR.Text+')';
    end;

  if ckbCancelados.Checked then
  Begin
    Sit:=' AND (PCR_SITUACAO=0) ';
    sFiltros := sFiltros + '(Pendentes)';
  end;

  Application.CreateForm(Trpt_PacoteCredito, rpt_PacoteCredito);
  with rpt_PacoteCredito do
  Begin
    tag := 0;
    zrlFiltros.Caption := sFiltros;
    SZRLabel5.Caption  := mskDataINI.text;
    SZRLabel7.Caption  := mskDataFIM.text;
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM PACOTE_DE_CREDITO '+
      Centro+USU+DtINI+DtFIM+CdPCR+CdCLI+Sit+
      ' ORDER BY CLI_CODIGO, PCR_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta Vazia!');
    report.Preview;
    Close;
  end;
end;


procedure TfMxSelPacoteCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Usuario1.Close;
  Action:=caFree;
end;

procedure TfMxSelPacoteCredito.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  mskDataINI.SetFocus;
end;

procedure TfMxSelPacoteCredito.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelPacoteCredito.ckbCodigoUSUClick(Sender: TObject);
begin
  if ckbCodigoUSU.Checked then
  Begin
    Usuario1.Open;
    dblCodigoUSU.Color:=clWindow;
    dblCodigoUSU.Enabled:=True;
    dblCodigoUSU.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoUSU.SetFocus;
  end
  else
  Begin
    Usuario1.Close;
    dblCodigoUSU.Color:=AlteraCorComponentes;
    dblCodigoUSU.Enabled:=False;
    dblCodigoUSU.KeyValue:=-1;
  end;
end;

procedure TfMxSelPacoteCredito.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=33;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else
        dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxSelPacoteCredito.ckbCodigoCLIClick(Sender: TObject);
begin
  if ckbCodigoCLI.Checked then
  Begin
    edtCodigoCLI.Color:=clWindow;
    edtCodigoCLI.Enabled:=True;
    edtCodigoCLI.SetFocus;
  end
  else
  Begin
    edtCodigoCLI.Color:=AlteraCorComponentes;
    edtCodigoCLI.Text:='';
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure TfMxSelPacoteCredito.ckbCodigoPCRClick(Sender: TObject);
begin
  if ckbCodigoPCR.Checked then
  Begin
    edtCodigoPCR.Color:=clWindow;
    edtCodigoPCR.Enabled:=True;
    edtCodigoPCR.SetFocus;
  end
  else
  Begin
    edtCodigoPCR.Color:=AlteraCorComponentes;
    edtCodigoPCR.Text:='';
    edtCodigoPCR.Enabled:=False;
  end;
end;

procedure TfMxSelPacoteCredito.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    Close
  else if key=#13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxSelPacoteCredito.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

end.


