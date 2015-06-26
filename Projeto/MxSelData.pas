unit MxSelData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls, 
  DBCtrls, DB, DBTables, SQuery, Conta_de_Caixa, CentroCusto;

type
  TfMxSelData = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label2: TLabel;
    Panel2: TPanel;
    SB_Confirma: TBitBtn;
    SB_Cancelar: TBitBtn;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    ckbCodigoTitulo: TCheckBox;
    edtCodigoTitulo: TEdit;
    DSCentroCusto1: TDataSource;
    dblCOdigoCNC: TDBLookupComboBox;
    ckbCentroDeCusto: TCheckBox;
    CentroCusto1: TCentroCusto;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    Bevel2: TBevel;
    procedure FormShow(Sender: TObject);
    procedure SB_ConfirmaClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure ckbCodigoTituloClick(Sender: TObject);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
//    DataOk: Boolean;
  end;

var
  fMxSelData: TfMxSelData;
  CNC:string;

implementation
uses UDM, Funcoes, UTitulosExcluidos, CdCliente;


{$R *.DFM}


procedure TfMxSelData.SB_ConfirmaClick(Sender: TObject);
var
  DataINI, DataFIM, CdTRC, CdCNC, CdCLI, CdPDV, sFiltros: string;
begin
  if not VerificaData(mskDataINI.Text) then
    Raise exception.Create('Data Inicial inválida!');
  if not VerificaData(mskDataFIM.Text) then
    Raise exception.Create('Data Final inválida!');

  CdTRC := '';
  CdCLI := '';
  CdCNC := '';
  CdPDV := '';

  if VerificaDataBranco(mskDataINI.Text) then
    if RadioGroup1.ItemIndex = 0 then //Vencimento
      DataINI := ' AND T1.TRC_VENCIMENTO>="'+MesDia(mskDataINI.Text)+'" '
    else
      DataINI := ' AND T1.TRC_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'" ';

  if VerificaDataBranco(mskDataFIM.Text) then
    if RadioGroup1.ItemIndex = 0 then //Vencimento
      DataFIM := ' AND T1.TRC_VENCIMENTO<"'+MesDia(mskDataFIM.Text)+'" '
    else
      DataFIM := ' AND T1.TRC_DT_ALTERADO<"'+MesDia(mskDataFIM.Text)+'" ';

  if RadioGroup1.ItemIndex = 0 then
    sFiltros := '(Ven)'
  else
    sFiltros := '(Alt)';


  if ckbCodigoTitulo.Checked then
    if not VerificaInteiroBranco(edtCodigoTitulo.Text) then
      raise Exception.Create('Código do Título inválido!')
    else
    Begin
      CdTRC :=' AND (T1.TRC_CODIGO='+edtCodigoTitulo.Text+') ';
      sFiltros := sFiltros + ' (Titulo:'+edtCodigoTitulo.Text+')';
    end;

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI :=' AND (T1.CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + ' (CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoPDV.Checked then
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
      raise Exception.Create('Código do Pedido inválido!')
    else
    Begin
      CdPDV :=' AND (T1.PDV_CODIGO='+edtCodigoPDV.Text+') ';
      sFiltros := sFiltros + ' (PDV:'+edtCodigoPDV.Text+')';
    end;

  if ckbCentroDeCusto.Checked then
    if not (dblCOdigoCNC.KeyValue > 0) then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      CdCNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCOdigoCNC.KeyValue)+')';
    end;


  Dt_ini := mskDataINI.Text;
  Dt_fim := mskDataFIM.Text;
  If Tag=0 then //Títulos Excluídos
  begin
    Application.CreateForm(Trpt_TitulosExcluidos,rpt_TitulosExcluidos);
    with rpt_TitulosExcluidos do
    Begin
      zrlFiltros.Caption := sFiltros;
      SZRLabel1.Caption := Dt_ini;
      SZRLabel3.Caption := Dt_fim;
      Entidade.Close;
      Entidade.SQL.Text:=' SELECT DISTINCT T1.*,T2.* '+
          ' FROM Titulo_a_receber T1, Cliente T2 '+
          ' WHERE (T1.TRC_SITUACAO = 5) '+
          DataINI+DataFIM+CdTRC+CdCLI+CdPDV+CdCNC+
          ' AND (T1.CLI_CODIGO*=T2.CLI_CODIGO) '+
          ' AND (T1.CNC_CLIENTE*=T2.CNC_CODIGO) '+
          ' ORDER BY T2.CLI_RZ_SOCIAL,T1.TRC_SEQUENCIA ASC ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelData.SB_CancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelData.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  mskDataINI.SetFocus;
end;

procedure TfMxSelData.ckbCodigoTituloClick(Sender: TObject);
begin
  if ckbCodigoTitulo.Checked then
  Begin
    edtCodigoTitulo.Color:=clWindow;
    edtCodigoTitulo.Enabled:=True;
    edtCodigoTitulo.SetFocus;
  end
  else
  Begin
    edtCodigoTitulo.Color:=AlteraCorComponentes;
    edtCodigoTitulo.Clear;
    edtCodigoTitulo.Enabled:=False;
  end;
end;

procedure TfMxSelData.ckbCentroDeCustoClick(Sender: TObject);
begin
  if ckbCentroDeCusto.Checked then
  Begin
    CentroCusto1.Open;
    dblCOdigoCNC.Color:=clWindow;
    dblCOdigoCNC.Enabled:=True;
    dblCOdigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
    dblCOdigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCOdigoCNC.Color:=AlteraCorComponentes;
    dblCOdigoCNC.KeyValue:=-1;
    dblCOdigoCNC.Enabled:=False;
  end;
end;

procedure TfMxSelData.ckbCodigoCLIClick(Sender: TObject);
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
    edtCodigoCLI.Clear;
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure TfMxSelData.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=34;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxSelData.ckbCodigoPDVClick(Sender: TObject);
begin
  if ckbCodigoPDV.Checked then
  Begin
    edtCodigoPDV.Color:=clWindow;
    edtCodigoPDV.Enabled:=True;
    edtCodigoPDV.SetFocus;
  end
  else
  Begin
    edtCodigoPDV.Color:=AlteraCorComponentes;
    edtCodigoPDV.Clear;
    edtCodigoPDV.Enabled:=False;
  end;
end;

procedure TfMxSelData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
