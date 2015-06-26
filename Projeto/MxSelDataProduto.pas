unit MxSelDataProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls, 
  DBCtrls, DB, DBTables, SQuery, Conta_de_Caixa, CentroCusto;

type
  TfMxSelDataProduto = class(TForm)
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
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbCodigoPCP: TCheckBox;
    edtCodigoPCP: TEdit;
    ckbSintetico: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SB_ConfirmaClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoPCPClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
//    DataOk: Boolean;
  end;

var
  fMxSelDataProduto: TfMxSelDataProduto;
  CNC:string;

implementation

uses UDM, Funcoes, UTitulosExcluidos, CdCliente, UTabelaDeCusto,
  MxSPediProd, MxSPediProdMotCal;


{$R *.DFM}


procedure TfMxSelDataProduto.SB_ConfirmaClick(Sender: TObject);
var
  DataINI, DataFIM, CdPRD, CdPCP, sFiltros: string;
begin
  if not VerificaData(mskDataINI.Text) then
    Raise exception.Create('Data Inicial inválida!');
  if not VerificaData(mskDataFIM.Text) then
    Raise exception.Create('Data Final inválida!');

  CdPRD:= '';
  CdPCP := '';

  if VerificaDataBranco(mskDataINI.Text) then
    DataINI := ' AND C1.CUS_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'" ';

  if VerificaDataBranco(mskDataFIM.Text) then
    DataFIM := ' AND C1.CUS_DT_CADASTRO<"'+MesDia(mskDataFIM.Text)+'" ';

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      raise Exception.Create('Código do Produto inválido!')
    else
    Begin
      CdPRD :=' AND (C1.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + ' (PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbCodigoPCP.Checked then
    if not VerificaInteiroBranco(edtCodigoPCP.Text) then
      raise Exception.Create('Código do Pedido inválido!')
    else
    Begin
      CdPCP :=' AND (C1.PCP_CODIGO='+edtCodigoPCP.Text+') ';
      sFiltros := sFiltros + ' (PCP:'+edtCodigoPCP.Text+')';
    end;

  Dt_ini := mskDataINI.Text;
  Dt_fim := mskDataFIM.Text;
  If Tag=0 then //Tabela de Custo
  begin
    Application.CreateForm(Trpt_TabelaDeCusto,rpt_TabelaDeCusto);
    with rpt_TabelaDeCusto do
    Begin
      zrlFiltros.Caption := sFiltros;
      zrlDataINI.Caption := Dt_ini;
      zrlDataFIM.Caption := Dt_fim;
      if ckbSintetico.Checked then
        zrbDetalhe.Height := 1;
      Entidade.Close;
      Entidade.SQL.Text:=' SELECT DISTINCT C1.*,P1.* '+
          ' FROM CUSTO C1, PRODUTO P1 '+
          ' WHERE (C1.CUS_CODIGO>0) '+
          DataINI+DataFIM+CdPRD+CdPCP+
          ' AND (C1.PRD_CODIGO=P1.PRD_CODIGO) '+
          ' ORDER BY P1.PRD_DESCRICAO, P1.PRD_REFERENCIA, C1.CUS_DT_CADASTRO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelDataProduto.SB_CancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelDataProduto.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  ckbSintetico.Checked := True;
  mskDataINI.SetFocus;
end;

procedure TfMxSelDataProduto.ckbCodigoPRDClick(Sender: TObject);
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
    edtCodigoPRD.Clear;
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSelDataProduto.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=57;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=57;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxSelDataProduto.ckbCodigoPCPClick(Sender: TObject);
begin
  if ckbCodigoPCP.Checked then
  Begin
    edtCodigoPCP.Color:=clWindow;
    edtCodigoPCP.Enabled:=True;
    edtCodigoPCP.SetFocus;
  end
  else
  Begin
    edtCodigoPCP.Color:=AlteraCorComponentes;
    edtCodigoPCP.Clear;
    edtCodigoPCP.Enabled:=False;
  end;
end;

procedure TfMxSelDataProduto.FormCreate(Sender: TObject);
begin
  DM.Usuario1.MDI(Self);
end;

procedure TfMxSelDataProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
