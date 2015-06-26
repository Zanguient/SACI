unit MxSelMovimentoCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus, Parametro, Variants;

type
  TfMxSelMovimentoCheque = class(TForm)
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
    edtCodigoCHQ: TEdit;
    ckbCodigoCHQ: TCheckBox;
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
    procedure ckbCodigoCHQClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelMovimentoCheque: TfMxSelMovimentoCheque;

implementation

uses UDM, UPrinc2, uMovCheque, CdCliente;

{$R *.DFM}


procedure TfMxSelMovimentoCheque.bitConfirmaClick(Sender: TObject);
var
  mensagem,cCLI,CdCHQ,CdEntrada, cRef,cDtINI,cDtFIM,Tipo,sFiltros, Centro, sObs, sOrdem :string;
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
  CdCHQ:='';
  sFiltros:='';
  sOrdem:='';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text)then
    cDtINI:=' AND (T2.MCH_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") ';

  if VerificaDataBranco(mskDataFIM.Text)then
    cDtFIM:=' AND (T2.MCH_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      cCLI:=' AND (C1.CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + ' (CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoEntrada.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoEntrada.text) then
      Raise Exception.Create('Código de Entrada inválido!')
    else
      CdEntrada:=' AND (T2.MCH_COD_ENTRADA='+edtCodigoEntrada.Text+') ';
    sFiltros := sFiltros + ' (Cod.Ent.:'+edtCodigoEntrada.Text+')';
  end;

  if ckbCodigoCHQ.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoCHQ.text) then
      Raise Exception.Create('Código de Pedido inválido!')
    else
      CdCHQ:=' AND (T2.CHQ_CODIGO='+edtCodigoCHQ.Text+') ';
    sFiltros := sFiltros + ' (CHQ:'+edtCodigoCHQ.Text+')';
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
    sObs := ' AND (T2.MCH_OBSERVACAO="%'+edtObservacao.Text+'%") ';
    sFiltros := sFiltros + ' (Obs:'+edtObservacao.Text+')';
  end;


  If ckbTipo.Checked then
  begin
    if dblTipo.Text = '' then
      Raise exception.Create('Tipo inválido!')
    else
    Begin
      Tipo:=' AND T2.MCH_TIPO='+IntToStr(dblTipo.KeyValue);
      sFiltros := sFiltros + '(Tipo:'+dblTipo.Text+')';
    end;
  end;

  if tag = 0 then
  Begin
    Application.CreateForm(Trpt_MovCheque, rpt_MovCheque);
    with rpt_MovCheque do
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
        sOrdem := ' T2.CNC_CODIGO,T2.MCH_CODIGO ASC ';
      end
      else
        sOrdem := ' T1.CNC_CODIGO,T1.CLI_RZ_SOCIAL,T2.MCH_CODIGO ASC ';
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT C1.CNC_CLIENTE,C1.CLI_CODIGO,T1.CLI_RZ_SOCIAL,T1.CLI_CGC_CPF,'+
        ' T1.CLI_FONE,T1.CLI_NOME_FAN,T2.* '+
        ' FROM Cliente T1,Cheque C1, Movimento_de_Cheque T2 '+
        ' WHERE MCH_CODIGO<>-10 '+
        cDtINI+cDtFIM+cCLI+CdEntrada+CdCHQ+cRef+Centro+Tipo+sObs+
        ' AND (C1.CNC_CODIGO=T2.CNC_CHEQUE) '+
        ' AND (C1.CHQ_CODIGO=T2.CHQ_CODIGO) '+
        ' AND (T1.CNC_CODIGO=*C1.CNC_CLIENTE) '+
        ' AND (T1.CLI_CODIGO=*C1.CLI_CODIGO) '+
        ' ORDER BY '+sOrdem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelMovimentoCheque.bitCancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelMovimentoCheque.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa <> empLBM then
    ckbCodigoCNC.Checked := True;
  ckbSintetico.Checked := True;
  mskDataINI.SetFocus;  
end;

procedure TfMxSelMovimentoCheque.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=38;
      CentroCusto2.open;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else if dblCodigoCNC.Text <> '' then
        dblCentroDeCusto.KeyValue := dblCodigoCNC.KeyValue
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxSelMovimentoCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure TfMxSelMovimentoCheque.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    Parametro1.Open;
    dblTipo.Enabled:=True;
    dblTipo.KeyValue := Parametro1.CodigoPAR;
    dblTipo.Color:=clWindow;
    dblTipo.SetFocus;
  end
  else
  Begin
    Parametro1.Close;
    dblTipo.Enabled:=False;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.KeyValue:=0;
  end;
end;

procedure TfMxSelMovimentoCheque.ckbCodigoCNCClick(Sender: TObject);
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

procedure TfMxSelMovimentoCheque.ckbCodigoCLIClick(Sender: TObject);
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

procedure TfMxSelMovimentoCheque.ckbCodigoEntradaClick(Sender: TObject);
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

procedure TfMxSelMovimentoCheque.ckbObservacaoClick(Sender: TObject);
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

procedure TfMxSelMovimentoCheque.ckbCodigoCHQClick(Sender: TObject);
begin
  if ckbCodigoCHQ.Checked then
  Begin
    edtCodigoCHQ.Enabled := True;
    edtCodigoCHQ.Color   := clWindow;
    edtCodigoCHQ.SetFocus;
  end
  else
  Begin
    edtCodigoCHQ.Enabled := False;
    edtCodigoCHQ.Color   := AlteraCorComponentes;
    edtCodigoCHQ.Clear;
  end;
end;

end.


