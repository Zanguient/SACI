unit MxSelReservaExterna;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus, Parametro, Variants;

type
  TfMxSelReservaExterna = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label2: TLabel;
    Panel2: TPanel;
    bitConfirma: TBitBtn;
    bitCancelar: TBitBtn;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Panel3: TPanel;
    edtCodigoPRD: TEdit;
    ckbCodigoPRD: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    edtCodigoPDV: TEdit;
    ckbCodigoPDV: TCheckBox;
    dblCNCSolicitante: TDBLookupComboBox;
    ckbCNCSolicitante: TCheckBox;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    ckbSomenteLiberados: TCheckBox;
    ckbSomentePendentes: TCheckBox;
    procedure bitConfirmaClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbCNCSolicitanteClick(Sender: TObject);
    procedure ckbSomenteLiberadosClick(Sender: TObject);
    procedure ckbSomentePendentesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelReservaExterna: TfMxSelReservaExterna;

implementation

uses UDM, UPrinc2, MxSPediProd, MxSPediProdMotCal, UReservaExterna;

{$R *.DFM}


procedure TfMxSelReservaExterna.bitConfirmaClick(Sender: TObject);
var
  mensagem,cPRD,CdPDV, cDtINI,cDtFIM, Centro, CentroSolicitante, sSit,sFiltros :string;
begin
  mensagem:='';
  cDtINI:='';
  cDtFIM:='';
  cPRD:='';
  CdPDV:='';
  Centro:='';
  CentroSolicitante:='';
  sSit:='';
  sFiltros:='';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text)then
    cDtINI:=' AND (R1.REX_DATA>="'+MesDia(mskDataINI.Text)+'") ';

  if VerificaDataBranco(mskDataFIM.Text)then
    cDtFIM:=' AND (R1.REX_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.text) then
      Raise Exception.Create('Código do produto inválido!')
    else
    Begin
      cPRD:=' AND (R1.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + ' (PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbCodigoPDV.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPDV.text) then
      Raise Exception.Create('Código do Pedido inválido!')
    else
      CdPDV:=' AND (R1.PDV_CODIGO='+edtCodigoPDV.Text+') ';
    sFiltros := sFiltros + ' (PDV:'+edtCodigoPDV.Text+')';
  end;

  if ckbCodigoCNC.Checked then
    if not (dblCodigoCNC.KeyValue > 0) then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      Centro:=' AND (R1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  if ckbCNCSolicitante.Checked then
    if not (dblCNCSolicitante.KeyValue > 0) then
      Raise Exception.Create('Centro de Custo Solicitante inválido!')
    else
    Begin
      CentroSolicitante:=' AND (R1.CNC_CODIGO_REQ='+IntToStr(dblCNCSolicitante.KeyValue)+') ';
      sFiltros := sFiltros + ' (Solicitante:'+IntToStr(dblCNCSolicitante.KeyValue)+')';
    end;

  if ckbSomenteLiberados.Checked then
  Begin
    sSit := ' AND REX_SITUACAO=1 ';
    sFiltros := sFiltros + '(Liberados)';
  end
  else if ckbSomentePendentes.Checked then
  Begin
    sSit := ' AND REX_SITUACAO=0 ';
    sFiltros := sFiltros + '(Pendentes)';
  end;


  If tag = 0 then
  begin
    Application.CreateForm(Trpt_ReservaExterna, rpt_ReservaExterna);
    with rpt_ReservaExterna do
    Begin
      zrlFiltros.Caption := sFiltros;
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
         ' FROM RESERVA_EXTERNA R1 '+
         ' WHERE R1.REX_CODIGO>0 '+
         cDtINI+cDtFIM+cPRD+CdPDV+Centro+CentroSolicitante+sSit+
         ' ORDER BY R1.REX_CODIGO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelReservaExterna.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelReservaExterna.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa <> empLBM then
    ckbCodigoCNC.Checked := True;
  mskDataINI.SetFocus;  
end;

procedure TfMxSelReservaExterna.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=51;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=51;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxSelReservaExterna.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure TfMxSelReservaExterna.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.KeyValue:=CentroCusto1.CentroDeCusto;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelReservaExterna.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Enabled := True;
    edtCodigoPRD.Color   := clWindow;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Enabled := False;
    edtCodigoPRD.Color   := AlteraCorComponentes;
    edtCodigoPRD.Clear;
  end;
end;

procedure TfMxSelReservaExterna.ckbCodigoPDVClick(Sender: TObject);
begin
  if ckbCodigoPDV.Checked then
  Begin
    edtCodigoPDV.Enabled := True;
    edtCodigoPDV.Color   := clWindow;
    edtCodigoPDV.SetFocus;
  end
  else
  Begin
    edtCodigoPDV.Enabled := False;
    edtCodigoPDV.Color   := AlteraCorComponentes;
    edtCodigoPDV.Clear;
  end;
end;

procedure TfMxSelReservaExterna.ckbCNCSolicitanteClick(Sender: TObject);
begin
  if ckbCNCSolicitante.Checked then
  Begin
    CentroCusto2.Open;
    dblCNCSolicitante.Enabled:=True;
    dblCNCSolicitante.Color:=clWindow;
    dblCNCSolicitante.KeyValue:=CentroCusto1.CentroDeCusto;
    dblCNCSolicitante.SetFocus;
  end
  else
  Begin
    CentroCusto2.Close;
    dblCNCSolicitante.Enabled:=False;
    dblCNCSolicitante.Color:=AlteraCorComponentes;
    dblCNCSolicitante.KeyValue:=-1;
  end;
end;

procedure TfMxSelReservaExterna.ckbSomenteLiberadosClick(Sender: TObject);
begin
  if ckbSomenteLiberados.Checked then
    ckbSomentePendentes.Checked := False;
end;

procedure TfMxSelReservaExterna.ckbSomentePendentesClick(Sender: TObject);
begin
  if ckbSomentePendentes.Checked then
    ckbSomenteLiberados.Checked := False;
end;

end.


