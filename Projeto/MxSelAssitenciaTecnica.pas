unit MxSelAssitenciaTecnica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus, Variants;

type
  TfMxSelAssistenciaTecnica = class(TForm)
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
    ckbSintetico: TCheckBox;
    ckbCodigoAUT: TCheckBox;
    edtCodigoAUT: TEdit;
    edtCodigoCLI: TEdit;
    ckbCodigoCLI: TCheckBox;
    edtCodigoAST: TEdit;
    ckbCodigoAST: TCheckBox;
    rdgDataCadastro: TRadioButton;
    rdgDataAlterado: TRadioButton;
    rdgDataDepEnviado: TRadioButton;
    rdgDataDepRecebido: TRadioButton;
    rdgDataAssEnviado: TRadioButton;
    rdgDataAssRetornado: TRadioButton;
    rdgDataDepDevolvido: TRadioButton;
    rdgDataLojaRecebido: TRadioButton;
    rdgDataPrevisao: TRadioButton;
    rdgDataEntrega: TRadioButton;
    procedure bitConfirmaClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbCodigoAUTClick(Sender: TObject);
    procedure ckbCodigoASTClick(Sender: TObject);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure edtCodigoAUTKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelAssistenciaTecnica: TfMxSelAssistenciaTecnica;

implementation

uses UDM, funcoes, UAssistenciaTecnica, MxSPediProdMotCal, MxSPediProd,
  CdAutorizada, CdCliente;

{$R *.DFM}


procedure TfMxSelAssistenciaTecnica.bitConfirmaClick(Sender: TObject);
var
  mensagem,DtINI,DtFIM,cPRD,cPDV,cCLI,cAUT, CdCNC, sFiltros, sOrdem:String;
begin
  mensagem:='';
  DtINI:='';
  DtFIM:='';
  cPRD:='';
  cPDV:='';
  cCLI:='';
  cAUT:='';
  CdCNC:='';
  sFiltros:='';
  sOrdem:='';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text)then
  Begin
    sFiltros := sFiltros + ' (DtINI:'+mskDataINI.Text+')';
    if rdgDataCadastro.Checked then
      DtINI:=' AND T1.AST_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataAlterado.Checked then
      DtINI:=' AND T1.AST_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataDepEnviado.Checked then
      DtINI:=' AND T1.AST_DT_DEPOSITO_ENVIADO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataDepRecebido.Checked then
      DtINI:=' AND T1.AST_DT_DEPOSITO_RECEBIDO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataAssEnviado.Checked then
      DtINI:=' AND T1.AST_DT_ASSISTENCIA_ENVIADO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataAssRetornado.Checked then
      DtINI:=' AND T1.AST_DT_ASSISTENCIA_RETORNADO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataDepDevolvido.Checked then
      DtINI:=' AND T1.AST_DT_DEPOSITO_DEVOLVIDO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataLojaRecebido.Checked then
      DtINI:=' AND T1.AST_DT_LOJA_RECEBIDO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataPrevisao.Checked then
      DtINI:=' AND T1.AST_DT_PREVISAO>="'+MesDia(mskDataINI.Text)+'" '
    else if rdgDataEntrega.Checked then
      DtINI:=' AND T1.AST_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'" ';
  end;

  if VerificaDataBranco(mskDataFIM.Text)then
  Begin
    sFiltros := sFiltros + ' (DtFIM:'+mskDataFIM.Text+')';
    if rdgDataCadastro.Checked then
      DtFIM:=' AND T1.AST_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataAlterado.Checked then
      DtFIM:=' AND T1.AST_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataDepEnviado.Checked then
      DtFIM:=' AND T1.AST_DT_DEPOSITO_ENVIADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataDepRecebido.Checked then
      DtFIM:=' AND T1.AST_DT_DEPOSITO_RECEBIDO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataAssEnviado.Checked then
      DtFIM:=' AND T1.AST_DT_ASSISTENCIA_ENVIADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataAssRetornado.Checked then
      DtFIM:=' AND T1.AST_DT_ASSISTENCIA_RETORNADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataDepDevolvido.Checked then
      DtFIM:=' AND T1.AST_DT_DEPOSITO_DEVOLVIDO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataLojaRecebido.Checked then
      DtFIM:=' AND T1.AST_DT_LOJA_RECEBIDO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataPrevisao.Checked then
      DtFIM:=' AND T1.AST_DT_PREVISAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '
    else if rdgDataEntrega.Checked then
      DtFIM:=' AND T1.AST_DT_ENTREGA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
  end;

  if ckbCodigoPRD.Checked then
  Begin
    if VerificaIntervaloInteiroBranco(edtCodigoPRD.Text) then
      cPRD := DesmontaIntervalo(edtCodigoPRD.Text,' AND (','T1.PRD_CODIGO',')')
    else if not VerificaInteiroBranco(edtCodigoPRD.text) then
      Raise Exception.Create('Código do produto inválido!')
    else
      cPRD := ' AND (T1.PRD_CODIGO='+edtCodigoPRD.Text+') ';
    sFiltros := sFiltros + ' (PRD:'+edtCodigoPRD.Text+')';
  end;

  if ckbCodigoPDV.Checked then
  Begin
    if VerificaIntervaloInteiroBranco(edtCodigoPDV.Text) then
      cPDV := DesmontaIntervalo(edtCodigoPDV.Text,' AND (','T1.PDV_CODIGO',')')
    else if not VerificaInteiroBranco(edtCodigoPDV.text) then
      Raise Exception.Create('Código do Pedido inválido!')
    else
      cPDV := ' AND (T1.PDV_CODIGO='+edtCodigoPDV.Text+') ';
    sFiltros := sFiltros + ' (PDV:'+edtCodigoPDV.Text+')';
  end;

  if ckbCodigoCLI.Checked then
  Begin
    if VerificaIntervaloInteiroBranco(edtCodigoCLI.Text) then
      cCLI := DesmontaIntervalo(edtCodigoCLI.Text,' AND (','T1.CLI_CODIGO',')')
    else if not VerificaInteiroBranco(edtCodigoCLI.text) then
      Raise Exception.Create('Código do produto inválido!')
    else
      cCLI := ' AND (T1.CLI_CODIGO='+edtCodigoCLI.Text+') ';
    sFiltros := sFiltros + ' (CLI:'+edtCodigoCLI.Text+')';
  end;

  if ckbCodigoAUT.Checked then
  Begin
    if VerificaIntervaloInteiroBranco(edtCodigoAUT.Text) then
      cAUT := DesmontaIntervalo(edtCodigoAUT.Text,' AND (','T1.AUT_CODIGO',')')
    else if not VerificaInteiroBranco(edtCodigoAUT.text) then
      Raise Exception.Create('Código do produto inválido!')
    else
      cAUT := ' AND (T1.AUT_CODIGO='+edtCodigoAUT.Text+') ';
    sFiltros := sFiltros + ' (AUT:'+edtCodigoAUT.Text+')';
  end;

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      CdCNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  sOrdem := ' T1.CNC_CODIGO,T1.AST_CODIGO ';

  Application.CreateForm(Trpt_AssistenciaTecnica, rpt_AssistenciaTecnica);
  with rpt_AssistenciaTecnica do
  Begin
    if ckbSintetico.Checked then
    Begin
      zrlLinhaDupla.Top := 5;
      zrbCabecalhoPagina.Height := 6;
      zrbDetalhe.Height := 1;
    end;

    zrlFiltros.Caption := sFiltros;

    Entidade.Close;
    Entidade.SQL.Text:='SELECT * '+
       ' FROM ASSISTENCIA_TECNICA T1 '+
       ' WHERE T1.AST_CODIGO<>-1 '+
       DtINI+DtFIM+cPRD+cPDV+cCLI+cAUT+
       ' ORDER BY '+sOrdem;
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise exception.Create('Consulta Vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxSelAssistenciaTecnica.bitCancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelAssistenciaTecnica.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  ckbSintetico.Checked := True;
  mskDataINI.SetFocus;
end;

procedure TfMxSelAssistenciaTecnica.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=65;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=65;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxSelAssistenciaTecnica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure TfMxSelAssistenciaTecnica.ckbCodigoCNCClick(Sender: TObject);
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

procedure TfMxSelAssistenciaTecnica.ckbCodigoPRDClick(Sender: TObject);
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

procedure TfMxSelAssistenciaTecnica.ckbCodigoPDVClick(Sender: TObject);
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

procedure TfMxSelAssistenciaTecnica.ckbCodigoAUTClick(Sender: TObject);
begin
  if ckbCodigoAUT.Checked then
  Begin
    edtCodigoAUT.Enabled := True;
    edtCodigoAUT.Color   := clWindow;
    edtCodigoAUT.SetFocus;
  end
  else
  Begin
    edtCodigoAUT.Enabled := False;
    edtCodigoAUT.Color   := AlteraCorComponentes;
    edtCodigoAUT.Clear;
  end;
end;

procedure TfMxSelAssistenciaTecnica.ckbCodigoASTClick(Sender: TObject);
begin
  if ckbCodigoAST.Checked then
  Begin
    edtCodigoAST.Enabled := True;
    edtCodigoAST.Color   := clWindow;
    edtCodigoAST.SetFocus;
  end
  else
  Begin
    edtCodigoAST.Enabled := False;
    edtCodigoAST.Color   := AlteraCorComponentes;
    edtCodigoAST.Clear;
  end;
end;

procedure TfMxSelAssistenciaTecnica.ckbCodigoCLIClick(Sender: TObject);
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

procedure TfMxSelAssistenciaTecnica.edtCodigoAUTKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadAutorizada, fCadAutorizada);
    with fCadAutorizada do
    Begin
      tag:=2;
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM AUTORIZADA '+
        ' WHERE AUT_SITUACAO=0 '+
        ' ORDER BY AUT_NOME ';
      Entidade.Open;
      Showmodal;
    end;
  end;
end;

procedure TfMxSelAssistenciaTecnica.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=47;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

end.


