unit MxSelTarefa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls, 
  DBCtrls, DB, DBTables, SQuery, CentroCusto, Usuario, Parametro;

type
  TfMxSelTarefa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Confirma: TBitBtn;
    SB_Cancelar: TBitBtn;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    ckbCodigoTAR: TCheckBox;
    edtCodigoTAR: TEdit;
    DSCentroCusto1: TDataSource;
    dblCOdigoCNC: TDBLookupComboBox;
    ckbCentroDeCusto: TCheckBox;
    CentroCusto1: TCentroCusto;
    ckbTipo: TCheckBox;
    dblTipo: TDBLookupComboBox;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Usuario1: TUsuario;
    DSUsuario1: TDataSource;
    ckbCodigoUSU: TCheckBox;
    dblCodigoUSU: TDBLookupComboBox;
    Panel3: TPanel;
    rdgDataCadastro: TRadioButton;
    rdgDataAlterado: TRadioButton;
    rdgDataAgendado: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    ckbSintetico: TCheckBox;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure SB_ConfirmaClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure ckbCodigoTARClick(Sender: TObject);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure ckbTipoClick(Sender: TObject);
    procedure ckbCodigoUSUClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
//    DataOk: Boolean;
  end;

var
  fMxSelTarefa: TfMxSelTarefa;
  CNC:string;

implementation

uses UDM, Funcoes, UTarefa;

{$R *.DFM}                     

procedure TfMxSelTarefa.SB_ConfirmaClick(Sender: TObject);
var
  sDataINI, sDataFIM, CdTAR, CdCNC, CdUSU, sTipo, sFiltros: string;
begin
  if not VerificaData(mskDataINI.Text) then
    Raise exception.Create('Data Inicial inválida!');
  if not VerificaData(mskDataFIM.Text) then
    Raise exception.Create('Data Final inválida!');

  CdTAR := '';
  CdCNC := '';
  CdUSU := '';
  sTipo := '';
  sDataINI := '';
  sDataFIM := '';
  sFiltros := '';

  if VerificaDataBranco(mskDataINI.Text) then
  Begin
    if rdgDataCadastro.Checked then
      sDataINI := ' AND TAR.TAR_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataAlterado.Checked then
      sDataINI := ' AND TAR.TAR_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataAgendado.Checked then
      sDataINI := ' AND TAR.TAR_DT_AGENDADO>="'+MesDia(mskDataINI.Text)+'" ';
    sFiltros := sFiltros + '(DtINI:'+mskDataINI.Text+')';
  end;

  if VerificaDataBranco(mskDataFIM.Text) then
  Begin
    if rdgDataCadastro.Checked then
      sDataFIM := ' AND TAR.TAR_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataAlterado.Checked then
      sDataFIM := ' AND TAR.TAR_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataAgendado.Checked then
      sDataFIM := ' AND TAR.TAR_DT_AGENDADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
    sFiltros := sFiltros + '(DtINI:'+mskDataFIM.Text+')';
  end;

  if ckbCodigoTAR.Checked then
    if not VerificaInteiroBranco(edtCodigoTAR.Text) then
      raise Exception.Create('Código da Tarefa inválido!')
    else
    Begin
      CdTAR :=' AND (TAR.TAR_CODIGO='+edtCodigoTAR.Text+') ';
      sFiltros := sFiltros + ' (TAR:'+edtCodigoTAR.Text+')';
    end;

  if ckbCodigoUSU.Checked then
    if dblCodigoUSU.Text = '' then
      Raise Exception.Create('Usuário inválido!')
    else
    Begin
      CdUSU:=' AND (TAR.USU_CODIGO='+IntToStr(dblCodigoUSU.KeyValue)+') ';
      sFiltros := sFiltros + ' (USU:'+IntToStr(dblCodigoUSU.KeyValue)+')';
    end;

  if ckbTipo.Checked then
    if dblTipo.Text = '' then
      Raise Exception.Create('Tipo inválido!')
    else
    Begin
      sTipo:=' AND (TAR.TAR_TIPO='+IntToStr(dblTipo.KeyValue)+') ';
      sFiltros := sFiltros + ' (Tipo:'+dblTipo.Text+')';
    end;

  if ckbCentroDeCusto.Checked then
    if dblCOdigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      CdCNC:=' AND (TAR.CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCOdigoCNC.KeyValue)+')';
    end;

  If Tag=0 then //Agenda de Tarefas
  begin
    Application.CreateForm(Trpt_Tarefa,rpt_Tarefa);
    with rpt_Tarefa do
    Begin
      Tag := 0;
      zrlFiltros.Caption := sFiltros;

      if ckbSintetico.Checked then
      Begin
        zrbDetalhe.Height := 6;
        zrlLinhaDupla.Top := 5;
        zrbDetalhe.Height := 1;
      end;

      Entidade.Close;
      Entidade.SQL.Text:=' SELECT DISTINCT TAR.*, USU.USU_NOME '+
          ' FROM TAREFA TAR, USUARIO USU '+
          ' WHERE TAR.TAR_CODIGO<>-1 '+
          sDataINI+sDataFIM+CdTAR+CdCNC+CdUSU+sTipo+
          ' AND TAR.USU_CODIGO=USU.USU_CODIGO '+
          ' ORDER BY USU.USU_NOME ASC, TAR.TAR_DT_AGENDADO ASC, TAR.TAR_PRIORIDADE DESC ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelTarefa.SB_CancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelTarefa.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(7970)) < 0 then
  Begin
    ckbCodigoUSU.Checked := True;
    ckbCodigoUSU.Enabled := False;
    dblCodigoUSU.Enabled := False;
  end;

  mskDataINI.SetFocus;
end;

procedure TfMxSelTarefa.ckbCodigoTARClick(Sender: TObject);
begin
  if ckbCodigoTAR.Checked then
  Begin
    edtCodigoTAR.Color:=clWindow;
    edtCodigoTAR.Enabled:=True;
    edtCodigoTAR.SetFocus;
  end
  else
  Begin
    edtCodigoTAR.Color:=AlteraCorComponentes;
    edtCodigoTAR.Clear;
    edtCodigoTAR.Enabled:=False;
  end;
end;

procedure TfMxSelTarefa.ckbCentroDeCustoClick(Sender: TObject);
begin
  if ckbCentroDeCusto.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
  end;
end;

procedure TfMxSelTarefa.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    Parametro1.Open;
    dblTipo.Color:=clWindow;
    dblTipo.Enabled:=True;
    dblTipo.KeyValue := Parametro1.CodigoPAR;
    dblTipo.SetFocus;
  end
  else
  Begin
    Parametro1.Close;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.KeyValue:=-1;
    dblTipo.Enabled:=False;
  end;
end;

procedure TfMxSelTarefa.ckbCodigoUSUClick(Sender: TObject);
begin
  if ckbCodigoUSU.Checked then
  Begin
    Usuario1.Open;
    dblCodigoUSU.Color:=clWindow;
    dblCodigoUSU.Enabled:=True;
    dblCodigoUSU.KeyValue := Usuario1.CodigoUSU;
    dblCodigoUSU.SetFocus;
  end
  else
  Begin
    Usuario1.Close;
    dblCodigoUSU.Color:=AlteraCorComponentes;
    dblCodigoUSU.KeyValue:=-1;
    dblCodigoUSU.Enabled:=False;
  end;
end;

procedure TfMxSelTarefa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    Close
  else if key=#13 then
  Begin
    Key := #0;
    SB_ConfirmaClick(sender);
  end;
end;

procedure TfMxSelTarefa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
