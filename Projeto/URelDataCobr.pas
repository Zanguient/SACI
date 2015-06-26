unit URelDataCobr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, Db, DBTables, SQuery,
  Vendedor, Funcionario, Variants, CentroCusto;

type
  Trpt_DataCobr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DSFuncionario1: TDataSource;
    dblCodigoFUN: TDBLookupComboBox;
    RadioButton1: TRadioButton;
    rdbCobrador: TRadioButton;
    GroupBox1: TGroupBox;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label1: TLabel;
    chkSuprimirTitulo: TCheckBox;
    Funcionario1: TFuncionario;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    dblCOdigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    ckbSuprimirCliente: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure rdbCobradorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DataOk: Boolean;
  end;

var
  rpt_DataCobr: Trpt_DataCobr;

implementation

uses
  funcoes, UComisCobr, UDM, UComissao;

{$R *.DFM}


procedure Trpt_DataCobr.BitBtn1Click(Sender: TObject);
var
  CdCNC, sDtINI, sDtFIM, sFiltros, sCobrador :string;
begin
  sCobrador := '';
  sFiltros := '';
  if not VerificaData(mskDataINI.Text) then
    Raise exception.Create('Data inicial digitada incorretamente!')
  else
  Begin
    if VerificaDataBranco(mskDataINI.Text) then
    Begin
      sDtINI := ' AND T1.TRC_PAGAMENTO>="'+MesDia(self.mskDataINI.Text)+'" ';
      sFiltros := sFiltros + '(DtINI:'+self.mskDataINI.Text+')';
    end;
  end;

  if not VerificaData(mskDataFIM.Text) then
    Raise exception.Create('Data final digitada incorretamente!')
  else
  Begin
    if VerificaDataBranco(mskDataFIM.Text) then
    Begin
      sDtFIM := ' AND T1.TRC_PAGAMENTO<"'+MesDia(STrToDate(self.mskDataFIM.Text)+1)+'" ';
      sFiltros := sFiltros + '(DtFIM:'+self.mskDataFIM.Text+')';
    end;
  end;

  if rdbCobrador.Checked then
  Begin
    if dblCodigoFUN.Text = '' then
      Raise exception.Create('Cobrador inválido!');
    sCobrador := ' AND T2.FUN_CODIGO='+IntToStr(dblCodigoFUN.KeyValue);
    sFiltros := sFiltros + '(Cobrador:'+dblCodigoFUN.Text+')';
  End;

  if ckbCodigoCNC.Checked then
  Begin
    if dblCodigoCNC.Text = '' then
      Raise exception.Create('Centro de Custo inválido!');
    CdCNC := ' AND T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue);
    sFiltros := sFiltros + '(Centro:'+dblCodigoCNC.Text+')';
  End;

  Application.CreateForm(Trpt_ComisCobr, rpt_ComisCobr);
  with rpt_ComisCobr do
  Begin
    Tag := 0;
    zrlFiltros.Caption := sFiltros;
    if self.chkSuprimirTitulo.Checked then
    Begin
      zrbGrupoCLI.Height:=3;
      zrbdetalhe.Height:=0;
    end;

    if ckbSuprimirCliente.Checked then
      zrbGrupoCLI.Height:=0;

    Entidade.Close;
    if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
      Entidade.SQL.Text := 'SELECT * '+
        ' FROM TITULO_A_RECEBER T1 '+
        ' WHERE T1.TRC_SITUACAO=2 '+
        sDtINI+sDtFIM+CdCNC+
        ' AND T1.TRC_PAGAMENTO>T1.TRC_VENCIMENTO '+
        ' AND EXISTS (SELECT T2.CPC_CODIGO '+
        '   FROM COBRANCA_POR_COBRADOR T2, ITEM_DE_COBRANCA_COBRADOR I1 '+
        '   WHERE T2.FUN_CODIGO>0 '+
        sCobrador+
        '   AND I1.CNC_TITULO=T1.CNC_CODIGO'+
        '   AND I1.TRC_CODIGO=T1.TRC_CODIGO '+
        '   AND T2.CNC_ORIGEM=I1.CNC_CODIGO '+
        '   AND T2.CPC_CODIGO=I1.CPC_CODIGO) '+
        ' ORDER BY T1.CPC_CODIGO, T1.CLI_CODIGO '
    else
      Entidade.SQL.Text:='SELECT * '+
        ' FROM TITULO_A_RECEBER T1 '+
        ' WHERE T1.TRC_SITUACAO=2 '+
        ' AND T1.CPC_CODIGO>0 '+
        sDtINI+sDtFIM+CdCNC+
        ' AND T1.TRC_PAGAMENTO>T1.TRC_VENCIMENTO '+
        ' AND EXISTS (SELECT CPC_CODIGO '+
        '   FROM COBRANCA_POR_COBRADOR T2 '+
        '   WHERE T2.FUN_CODIGO>0 '+
        sCobrador+
        '   AND T2.CNC_CODIGO=T1.CNC_CODIGO'+
        '   AND T2.CPC_CODIGO=T1.CPC_CODIGO) '+
        ' ORDER BY CPC_CODIGO,CLI_CODIGO ';
    Entidade.Open;
    if Entidade.isEmpty then
      Raise exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure Trpt_DataCobr.BitBtn2Click(Sender: TObject);
begin
  mskDataINI.Clear;
  mskDataFIM.Clear;
  mskDataINI.SetFocus;
  DataOk := False;
  Close;
end;


procedure Trpt_DataCobr.RadioButton1Click(Sender: TObject);
begin
  Funcionario1.Close;
  dblCodigoFUN.Color:=AlteraCorComponentes;
  dblCodigoFUN.Enabled:=False;
end;

procedure Trpt_DataCobr.rdbCobradorClick(Sender: TObject);
begin
  Funcionario1.Open;
  dblCodigoFUN.Color:=clWindow;
  dblCodigoFUN.Enabled:=True;
end;

procedure Trpt_DataCobr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Funcionario1.Close;
  Action := caFree;
end;


procedure Trpt_DataCobr.ckbCodigoCNCClick(Sender: TObject);
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
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
  end;
end;

procedure Trpt_DataCobr.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
