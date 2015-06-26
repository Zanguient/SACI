unit MxSelMDF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  SQuery, Vendedor, AgenteFin, Forma_de_Pagamento, Parametro,
  Conta_de_Caixa, Variants, ZReport, ComCtrls;

type
  TfMxSelMDF = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    CentroCusto1: TCentroCusto;
    GroupBox1: TGroupBox;
    dblCOdigoCNC: TDBLookupComboBox;
    ckbCentroDeCusto: TCheckBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DSCentroCusto1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelMDF: TfMxSelMDF;

implementation

uses UDM, UMDF, funcoes, Configuracao;

{$R *.DFM}

procedure TfMxSelMDF.BitBtn1Click(Sender: TObject);
var
  mensagem, vFiltroCNC, sFiltros: string;
begin
  vFiltroCNC   := '';
  sFiltros    := '';
  mensagem:='';
  if ckbCentroDeCusto.Checked then
    if not (dblCOdigoCNC.KeyValue > 0) then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      vFiltroCNC:=' AND (C1.CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCOdigoCNC.KeyValue)+')';
    end;

  if tag = 0 then //Relatório de Títulos a Receber SQL-Server
  Begin
    Application.CreateForm(Trpt_MDF,rpt_MDF);
    with rpt_MDF do
    Begin
      vData := DateTimePicker1.Date;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
        ' FROM CENTRO_DE_CUSTO C1 '+
        ' WHERE (C1.CNC_CODIGO>-1) '+
        vFiltroCNC+
        ' ORDER BY C1.CNC_RZ_SOCIAL ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelMDF.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelMDF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action := cafree;
end;

procedure TfMxSelMDF.ckbCentroDeCustoClick(Sender: TObject);
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

procedure TfMxSelMDF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(27) then
    Close;

  if key=chr(13) then
    BitBtn1Click(BitBtn1);
end;

procedure TfMxSelMDF.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  DateTimePicker1.Date := DM.Configuracao1.Data;
end;

end.
