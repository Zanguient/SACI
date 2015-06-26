unit MxSelClienteInad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, DBTables, SQuery,
  CentroCusto, Variants, Parametro;

type
  TfMxSelClienteInad = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataIni: TMaskEdit;
    mskDataFim: TMaskEdit;
    CheckBox2: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    ckbNaoCartao: TCheckBox;
    CheckBox3: TCheckBox;
    dblTipo: TDBLookupComboBox;
    Parametro5: TParametro;
    DSParametro5: TDataSource;
    Bevel1: TBevel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelClienteInad: TfMxSelClienteInad;

implementation

uses
  UReceberMensal,funcoes, URecebidosMensal, UPagarMensal, UPagosMensal,
  UPedidosMensal, UDM, UCli_Inadimp;

{$R *.DFM}


procedure TfMxSelClienteInad.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelClienteInad.BitBtn1Click(Sender: TObject);
var
  sDataINI, sDataFIM, Centro, vNaoCartao, CLI_TIPO: String;
begin
  CLI_TIPO := '';
  Centro:='';
  sDataINI := '';
  sDataFIM := '';

  //TIPO
  if CheckBox3.Checked then
    CLI_TIPO := ' AND T1.CLI_TIPO = ''' +inttostr(dblTipo.Keyvalue) +''' '
  else
    CLI_TIPO := '';
  //

  If not VerificaData(mskDataIni.Text) then
     Raise Exception.Create('Data inicial inválida!');
  If not VerificaData(mskDataFim.Text) then
     Raise Exception.Create('Data final inválida!');

  if CheckBox2.Checked then
    if DBLookupComboBox1.Text = '' then
      raise Exception.Create('Centro de Custo inválido!')
    else
      Centro:=' AND T1.CNC_CODIGO='+IntToStr(DBLookupComboBox1.KeyValue);

  if ckbNaoCartao.Checked then
    vNaoCartao:=' AND (T2.TRC_TIPO_PAG<>13) ';

  if Tag=0 then
  Begin
    Application.CreateForm(Trpt_Cli_Inadimp, rpt_Cli_Inadimp);
    with rpt_Cli_Inadimp do
    Begin
      Cliente1.Close;

{      Cliente1.SQL.Text:='SELECT * FROM CLIENTE T1 WHERE '+Centro+
          ' EXISTS(SELECT CLI_CODIGO FROM TITULO_A_RECEBER T2 WHERE '+
          'T2.CNC_CLIENTE=T1.CNC_CODIGO AND T2.TRC_VENCIMENTO>=:DATAINI AND '+
          'T2.TRC_VENCIMENTO<:DATAFIM AND T2.TRC_SITUACAO IN (0,1,8)) '+
          'ORDER BY T1.CNC_CODIGO,T1.CLI_RZ_SOCIAL';
      Cliente1.ParamByName('DATAINI').AsDateTime  := StrToDate(mskDataIni.text);
      Cliente1.ParamByName('DATAFIM').AsDateTime  := STrToDate(mskDataFim.Text)+1;
}
      zrlDataINI.Caption := mskDataINI.Text;
      zrlDataFIM.Caption := mskDataFIM.Text;

      if VerificaDataBranco(mskDataINI.Text) then
        sDataINI := ' AND (T2.TRC_VENCIMENTO>="'+MesDia(self.mskDataINI.text)+'") ';
      if VerificaDataBranco(mskDataFIM.Text) then
        sDataFIM := ' AND (T2.TRC_VENCIMENTO<"'+MesDia(StrToDate(self.mskDataFIM.text)+1)+'") '
      else
        sDataFIM := ' AND (T2.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemJuros+1)+'") ';

      Cliente1.SQL.Text:=' SELECT T1.CNC_CODIGO,T1.CLI_CODIGO,T1.CLI_RZ_SOCIAL, '+
        ' T1.CLI_CGC_CPF, '+
        ' T1.CLI_DATA_NASC, '+
        ' T1.CLI_CGF_RG, '+
        ' T1.CLI_LOGRADOURO, '+
        ' T1.CLI_ENDERECO, '+
        ' T1.CLI_BAIRRO, '+
        ' T1.CLI_CIDADE, '+
        ' T1.CLI_UF, '+
        ' T1.CLI_CEP, '+
        ' T1.CLI_FONE, '+
        ' T1.CLI_SITUACAO, '+
        ' T1.CLI_CELULAR, '+
        ' COUNT(T2.TRC_CODIGO) AS QTD FROM CLIENTE T1, TITULO_A_RECEBER T2 '+
        ' WHERE T2.CLI_CODIGO=T1.CLI_CODIGO '+
        ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
        sDataINI+sDataFIM+Centro+vNaoCartao+CLI_TIPO+
        ' AND T2.TRC_SITUACAO IN (0,1,8) '+
        ' GROUP BY T1.CNC_CODIGO,T1.CLI_CODIGO,T1.CLI_RZ_SOCIAL, '+
        ' T1.CLI_CGC_CPF, '+
        ' T1.CLI_DATA_NASC, '+
        ' T1.CLI_CGF_RG, '+
        ' T1.CLI_LOGRADOURO, '+
        ' T1.CLI_ENDERECO, '+
        ' T1.CLI_BAIRRO, '+
        ' T1.CLI_CIDADE, '+
        ' T1.CLI_UF, '+
        ' T1.CLI_CEP, '+
        ' T1.CLI_FONE, '+
        ' T1.CLI_SITUACAO, '+
        ' T1.CLI_CELULAR '+
        ' ORDER BY T1.CNC_CODIGO,T1.CLI_RZ_SOCIAL ';
      Cliente1.Open;
      report.Preview;
      Close;
    end;
  End;
end;

procedure TfMxSelClienteInad.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    CheckBox2.Checked := True;
    CheckBox2Click(Sender);
    mskDataINI.Text := '01/01/2004';
    mskDataFIM.Text := DateToStr(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran);
  end;
  mskDataIni.SetFocus;
end;

procedure TfMxSelClienteInad.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  Begin
    CentroCusto1.Open;
    DBLookupComboBox1.Color:=clWindow;
    DBLookupComboBox1.Enabled:=True;
    DBLookupComboBox1.KeyValue:=DM.Configuracao1.CodigoCNC;
  end
  else
  Begin
    DBLookupComboBox1.Color:=AlteraCorComponentes;
    DBLookupComboBox1.Enabled:=False;
    DBLookupComboBox1.KeyValue:=-1;
    CentroCusto1.Close;
  end;
end;

procedure TfMxSelClienteInad.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  Begin
    Parametro5.Open;
    dblTipo.Color:=clWindow;
    dblTipo.Enabled:=True;
    try
      dblTipo.SetFocus;
    except
    end;
  end
  else
  Begin
    Parametro5.Close;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.Enabled:=False;
    dblTipo.KeyValue:=-1;
  end;
end;

procedure TfMxSelClienteInad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
