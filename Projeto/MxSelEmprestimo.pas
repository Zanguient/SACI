unit MxSelEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, DBTables, SQuery, CentroCusto, DBCtrls, ExtCtrls,
  Mask, Usuario;

type
  TfMxSelEmprestimo = class(TForm)
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
    edtClienteCNC: TEdit;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbCodigoEMP: TCheckBox;
    edtCodigoEMP: TEdit;
    ckbPendentes: TCheckBox;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    rdgDataCadastro: TRadioButton;
    rdgDataAlterado: TRadioButton;
    SB_Cancelar: TBitBtn;
    ckbSomenteEmprestimo: TCheckBox;
    ckbSomenteDemonstracao: TCheckBox;
    ckbSintetico: TCheckBox;
    Bevel1: TBevel;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoUSUClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoEMPClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_CancelarClick(Sender: TObject);
    procedure ckbSomenteEmprestimoClick(Sender: TObject);
    procedure ckbSomenteDemonstracaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelEmprestimo: TfMxSelEmprestimo;

implementation
Uses UDM, UPrinc2, funcoes, UEmprestimo, MxSPediProd, CdCliente,
  MxSPediProdMotCal;
{$R *.DFM}

procedure TfMxSelEmprestimo.SB_ConfirmarClick(Sender: TObject);
Var
  Centro,USU,CdEMP,CdCLI,CdPRD,DtINI,DtFIM,Sit,sSomenteDemoEmp,sFiltros:string;
begin
  sFiltros := '';
  USU := '';
  CdCLI:='';
  CdPRD:='';
  CdEMP:='';
  Sit:='';
  sSomenteDemoEmp:='';
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
    sFiltros := sFiltros + '(DtINI'+mskDataINI.Text+')';
    if rdgDataCadastro.Checked then
      DtINI:=' AND EMP_DT_CADASTRO>="' +MesDia(mskDataINI.Text)+'" '
    else
      DtINI:=' AND EMP_DT_ALTERADO>="' +MesDia(mskDataINI.Text)+'" ';
  end;

  if not VerificaData(mskDataFIM.Text) then
    Raise exception.Create('Data final inválida!')
  else if VerificaDataBranco(mskDataFIM.Text) then
  Begin
    sFiltros := sFiltros + '(DtFIM'+mskDataFIM.Text+')';
    if rdgDataAlterado.Checked then
      DtFIM := ' AND EMP_DT_CADASTRO<"' +MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else
      DtFIM := ' AND EMP_DT_ALTERADO<"' +MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';    
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
      CdCLI:=' AND (CLI_CODIGO='+edtCodigoCLI.Text+') AND (CNC_CLIENTE='+edtClienteCNC.Text+') ';
      sFiltros := sFiltros + '(CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      Raise Exception.Create('Código do Produto inválido!')
    else
    Begin
      CdPRD:=' AND (PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbCodigoEMP.Checked then
    if not VerificaInteiroBranco(edtCodigoEMP.Text) then
      Raise Exception.Create('Código do Empréstimo/Demosntração inválido!')
    else
    Begin
      CdEMP:=' AND (EMP_CODIGO='+edtCodigoEMP.Text+') ';
      sFiltros := sFiltros + '(EMP:'+edtCodigoEMP.Text+')';
    end;

  if ckbPendentes.Checked then
  Begin
    Sit:=' AND (EMP_SITUACAO=0) ';
    sFiltros := sFiltros + '(Pendentes)';
  end;

  if ckbSomenteEmprestimo.Checked then
  Begin
    Sit:=' AND (EMP_DEMONSTRACAO=0) ';
    sFiltros := sFiltros + '(Emprestimo)';
  end
  else if ckbSomenteDemonstracao.Checked then
  Begin
    Sit:=' AND (EMP_DEMONSTRACAO=1) ';
    sFiltros := sFiltros + '(Demonstracao)';
  end;

  Application.CreateForm(Trpt_Emprestimo, rpt_Emprestimo);
  with rpt_Emprestimo do
  Begin
    tag := 0;
    if ckbSintetico.Checked then
    Begin
      zrbCabecalho.Height := 6;
      zrbGrupoCLI.Height := 2;
    end;
    zrlFiltros.Caption := sFiltros;
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM EMPRESTIMO '+
      Centro+USU+DtINI+DtFIM+CdEMP+CdCLI+CdPRD+Sit+sSomenteDemoEmp+
      ' ORDER BY EMP_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta Vazia!');
    report.Preview;
    Close;
  end;
end;


procedure TfMxSelEmprestimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Usuario1.Close;
  Action:=caFree;
end;

procedure TfMxSelEmprestimo.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ckbPendentes.Checked := True;
  edtClienteCNC.Text:=IntToStr(DM.Configuracao1.CodigoCNC);
  mskDataINI.SetFocus;
end;

procedure TfMxSelEmprestimo.ckbCodigoCNCClick(Sender: TObject);
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

procedure TfMxSelEmprestimo.ckbCodigoUSUClick(Sender: TObject);
begin
  if ckbCodigoUSU.Checked then
  Begin
    Usuario1.Open;
    dblCodigoUSU.Color:=clWindow;
    dblCodigoUSU.Enabled:=True;
    dblCodigoUSU.KeyValue:=DM.Configuracao1.CodigoUSU;
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

procedure TfMxSelEmprestimo.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=16;
    fCadCli.CentroCusto2.open;
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxSelEmprestimo.ckbCodigoCLIClick(Sender: TObject);
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

procedure TfMxSelEmprestimo.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Clear;
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=31;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=31;
        ShowModal;
      end;
    end;
  End
end;

procedure TfMxSelEmprestimo.ckbCodigoEMPClick(Sender: TObject);
begin
  if ckbCodigoEMP.Checked then
  Begin
    edtCodigoEMP.Color:=clWindow;
    edtCodigoEMP.Enabled:=True;
    edtCodigoEMP.SetFocus;
  end
  else
  Begin
    edtCodigoEMP.Color:=AlteraCorComponentes;
    edtCodigoEMP.Text:='';
    edtCodigoEMP.Enabled:=False;
  end;
end;

procedure TfMxSelEmprestimo.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Text:='';
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSelEmprestimo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    Close
  else if key=#13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxSelEmprestimo.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelEmprestimo.ckbSomenteEmprestimoClick(Sender: TObject);
begin
  if ckbSomenteEmprestimo.Checked then
    ckbSomenteDemonstracao.Checked := False;
end;

procedure TfMxSelEmprestimo.ckbSomenteDemonstracaoClick(Sender: TObject);
begin
  if ckbSomenteDemonstracao.Checked then
    ckbSomenteEmprestimo.Checked := False;
end;

end.


