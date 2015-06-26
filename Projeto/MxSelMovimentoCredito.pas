unit MxSelMovimentoCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus, Parametro, Variants;

type
  TfMxSelMovimentoCredito = class(TForm)
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
    edtCodigoCLI: TEdit;
    ckbCodigoCLI: TCheckBox;
    ckbTipo: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    DSParametro1: TDataSource;
    dblTipo: TDBLookupComboBox;
    Parametro1: TParametro;
    edtCodigoEntrada: TEdit;
    ckbCodigoEntrada: TCheckBox;
    ckbSintetico: TCheckBox;
    ckbNaoAgruparCLI: TCheckBox;
    edtObservacao: TEdit;
    ckbObservacao: TCheckBox;
    edtCodigoPDV: TEdit;
    ckbCodigoPDV: TCheckBox;
    procedure bitConfirmaClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbTipoClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbCodigoEntradaClick(Sender: TObject);
    procedure ckbObservacaoClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelMovimentoCredito: TfMxSelMovimentoCredito;

implementation

uses UDM, UPrinc2, uMovCredito, CdCliente;

{$R *.DFM}


procedure TfMxSelMovimentoCredito.bitConfirmaClick(Sender: TObject);
var
  mensagem,cCLI,CdPDV,CdEntrada, cRef,cDtINI,cDtFIM,Tipo,sFiltros, Centro, sObs, sOrdem :string;
begin
  mensagem:='';
  cCLI:='';
  CdEntrada:='';
  cRef:='';
  Centro:='';
  Tipo:='';
  cDtINI:='';
  cDtFIM:='';
  sObs := '';
  CdPDV:='';
  sFiltros:='';
  sOrdem:='';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text)then
    cDtINI:=' AND (T2.MCR_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") ';

  if VerificaDataBranco(mskDataFIM.Text)then
    cDtFIM:=' AND (T2.MCR_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      cCLI:=' AND (T2.CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + ' (CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoEntrada.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoEntrada.text) then
      Raise Exception.Create('Código de Entrada inválido!')
    else
      CdEntrada:=' AND (T2.MCR_ENT_CODIGO='+edtCodigoEntrada.Text+') ';
    sFiltros := sFiltros + ' (Cod.Ent.:'+edtCodigoEntrada.Text+')';
  end;

  if ckbCodigoPDV.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPDV.text) then
      Raise Exception.Create('Código de Pedido inválido!')
    else
      CdPDV:=' AND (T2.PDV_CODIGO='+edtCodigoPDV.Text+') ';
    sFiltros := sFiltros + ' (PDV:'+edtCodigoPDV.Text+')';
  end;

  if ckbCodigoCNC.Checked then
    if not (dblCodigoCNC.KeyValue > 0) then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      Centro:=' AND (T2.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  if ckbObservacao.Checked then
  Begin
    sObs := ' AND (T2.MCR_OBSERVACAO="%'+edtObservacao.Text+'%") ';
    sFiltros := sFiltros + ' (Obs:'+edtObservacao.Text+')';
  end;


  If ckbTipo.Checked then
  begin
    if dblTipo.Text = '' then
      Raise exception.Create('Tipo inválido!')
    else
    Begin
      Tipo:=' AND T2.MCR_TIPO='+IntToStr(dblTipo.KeyValue);
      sFiltros := sFiltros + '(Tipo:'+dblTipo.Text+')';
    end;
  end;

  if tag = 0 then
  Begin
    Application.CreateForm(Trpt_MovCredito, rpt_MovCredito);
    with rpt_MovCredito do
    Begin
      zrlFiltros.Caption := sFiltros;
      if ckbSintetico.Checked then
        zrbDetalhe.Height := 1;
      if ckbNaoAgruparCLI.Checked then
      Begin
        ZRGroup1.Expression := '';
        ZRGroup1.Height := 0;
        SZRBand1.Height := 0; //Rodapé do Grupo
        zrlCodigo.Caption := 'Cliente';
        ZRDBText1.DataField := 'CLI_CODIGO';
        sOrdem := ' T2.CNC_CODIGO,T2.MCR_CODIGO ASC ';
      end
      else
        sOrdem := ' T2.CNC_CLIENTE,T1.CLI_RZ_SOCIAL,T2.MCR_CODIGO ASC ';
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT T1.CLI_RZ_SOCIAL,T1.CLI_CGC_CPF,'+
        ' T1.CLI_FONE,T1.CLI_NOME_FAN,T2.* '+
        ' FROM Cliente T1,Movimento_de_Credito T2 '+
        ' WHERE MCR_CODIGO<>-10 '+
        cDtINI+cDtFIM+cCLI+CdEntrada+CdPDV+cRef+Centro+Tipo+sObs+
        ' AND (T1.CNC_CODIGO=T2.CNC_CLIENTE) '+
        ' AND (T1.CLI_CODIGO=T2.CLI_CODIGO) '+
        ' ORDER BY '+sOrdem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelMovimentoCredito.bitCancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelMovimentoCredito.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa <> 3 then
    ckbCodigoCNC.Checked := True;
  ckbSintetico.Checked := True;
  mskDataINI.SetFocus;  
end;

procedure TfMxSelMovimentoCredito.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=31;
      CentroCusto2.open;
      if DM.Configuracao1.Empresa = 3 then
        dblCentroDeCusto.KeyValue := 1
      else if dblCodigoCNC.Text <> '' then
        dblCentroDeCusto.KeyValue := dblCodigoCNC.KeyValue
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxSelMovimentoCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure TfMxSelMovimentoCredito.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    with Parametro1 do
    Begin
      Close;
      SQL.Text:='SELECT * FROM PARAMETRO '+
        'WHERE TPR_CODIGO=50 '+ //Movimento de Crédito
        'ORDER BY PAR_DESCRICAO';
      Open;
      dblTipo.KeyValue := CodigoPAR;
    end;
    dblTipo.Enabled:=True;
    dblTipo.Color:=clWindow;
    dblTipo.SetFocus;
  end
  else
  Begin
    dblTipo.Enabled:=False;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.KeyValue:=0;
  end;
end;

procedure TfMxSelMovimentoCredito.ckbCodigoCNCClick(Sender: TObject);
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

procedure TfMxSelMovimentoCredito.ckbCodigoCLIClick(Sender: TObject);
begin
  if ckbCodigoCLI.Checked then
  Begin
    edtCodigoCLI.Enabled := True;
    edtCodigoCLI.Color   := clWindow;
    edtCodigoCLI.SetFocus;
  end
  else
  Begin
    edtCodigoCLI.Enabled := False;
    edtCodigoCLI.Color   := AlteraCorComponentes;
    edtCodigoCLI.Clear;
  end;
end;

procedure TfMxSelMovimentoCredito.ckbCodigoEntradaClick(Sender: TObject);
begin
  if ckbCodigoEntrada.Checked then
  Begin
    edtCodigoEntrada.Enabled := True;
    edtCodigoEntrada.Color   := clWindow;
    edtCodigoEntrada.SetFocus;
  end
  else
  Begin
    edtCodigoEntrada.Enabled := False;
    edtCodigoEntrada.Color   := AlteraCorComponentes;
    edtCodigoEntrada.Clear;
  end;
end;

procedure TfMxSelMovimentoCredito.ckbObservacaoClick(Sender: TObject);
begin
  if ckbObservacao.Checked then
  Begin
    edtObservacao.Enabled := True;
    edtObservacao.Color   := clWindow;
    edtObservacao.SetFocus;
  end
  else
  Begin
    edtObservacao.Enabled := False;
    edtObservacao.Color   := AlteraCorComponentes;
    edtObservacao.Clear;
  end;
end;

procedure TfMxSelMovimentoCredito.ckbCodigoPDVClick(Sender: TObject);
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

end.


