unit MxSelPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CentroCusto, Db, DBTables, SQuery, Vendedor, StdCtrls, Buttons, DBCtrls,
  Mask, ExtCtrls,Variants;

type
  TfMxSelPedido = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Panel3: TPanel;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    dblCodigoCNC: TDBLookupComboBox;
    CheckBox4: TCheckBox;
    edtCodigoPDV: TEdit;
    ckbSituacao: TCheckBox;
    CheckBox10: TCheckBox;
    ckbCodigoCNC: TCheckBox;
    cmbSituacao: TComboBox;
    ckbNotaFiscal: TCheckBox;
    edtNotaFiscal: TEdit;
    CheckBox20: TCheckBox;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    procedure CheckBox4Click(Sender: TObject);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbNotaFiscalClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPDVKeyPress(Sender: TObject; var Key: Char);
    procedure edtNotaFiscalKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelPedido: TfMxSelPedido;

implementation

uses UDM, Funcoes, MxSPediLoc, CdCliente, UDevolucaoParcial, MxSPediProd,
  MxSPediProdMotCal;

{$R *.DFM}

procedure TfMxSelPedido.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then
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

procedure TfMxSelPedido.ckbCodigoCLIClick(Sender: TObject);
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

procedure TfMxSelPedido.ckbNotaFiscalClick(Sender: TObject);
begin
  if ckbNotaFiscal.Checked then
  Begin
    edtNotaFiscal.Color:=clWindow;
    edtNotaFiscal.Enabled:=True;
    edtNotaFiscal.SetFocus;
  end
  else
  Begin
    edtNotaFiscal.Color:=AlteraCorComponentes;
    edtNotaFiscal.Clear;
    edtNotaFiscal.Enabled:=False;
  end;
end;

procedure TfMxSelPedido.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    if DM.Configuracao1.Empresa = empEletro then
      ckbCodigoCLI.Enabled:=True;
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    if DM.Configuracao1.Empresa <> empLBM then
      dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC
    else
      dblCodigoCNC.KeyValue:=1;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    if DM.Configuracao1.Empresa = empEletro then
    Begin
      ckbCodigoCLI.Checked:=False;
      ckbCodigoCLI.Enabled:=False;
    end;
    CentroCusto1.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
  end;
end;

procedure TfMxSelPedido.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Color:=clWindow;
    cmbSituacao.Enabled:=True;
    cmbSituacao.ItemIndex:=1;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
    cmbSituacao.Enabled:=False;
  end;
end;

procedure TfMxSelPedido.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelPedido.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=18;
    fCadCli.CentroCusto2.open;
    fCadCli.CentroCusto2.LocalizarCod(dblCodigoCNC.KeyValue);
    fCadCli.dblCentroDeCusto.KeyValue:=dblCodigoCNC.KeyValue;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxSelPedido.edtCodigoPDVKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
    fMxSPedLoc.tag:=6;
    fMxSPedLoc.Showmodal;
  end;
end;

procedure TfMxSelPedido.edtNotaFiscalKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
    fMxSPedLoc.tag:=7;
    fMxSPedLoc.Showmodal;
  end;
end;

procedure TfMxSelPedido.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if tag = 0 then
    ckbSituacao.Enabled := False;
  if DM.Configuracao1.Empresa = empEletro then
    ckbCodigoCNC.Checked := True;
  mskDataINI.SetFocus;
end;

procedure TfMxSelPedido.SB_ConfirmarClick(Sender: TObject);
var
  mensagem,CNC,CLI,FUN,PDV,SIT,NTF,CdPRD,sFiltros,DataINI,DataFIM:string;
begin
  CNC:='';
  CLI:='';
  FUN:='';
  PDV:='';
  SIT:='';
  NTF:='';
  CdPRD:='';
  sFiltros:='';
  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if not VerificaDataBranco(mskDataINI.Text)then
    DataINI := ''
  else
    DataINI := ' AND (T1.TRO_DATA>="'+MesDia(mskDataINI.Text)+'") ';
  if not VerificaDataBranco(mskDataFIM.Text)then
    DataFIM := ''
  else
    DataFIM := ' AND (T1.TRO_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if CheckBox4.Checked then
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Begin
      edtCodigoPDV.SetFocus;
      raise Exception.Create('Código do pedido inválido!');
    end
    else
    Begin
      PDV:=' AND (T1.PDV_CODIGO='+edtCodigoPDV.Text+') ';
      sFiltros := sFiltros + '(PDV:'+edtCodigoPDV.Text+')';
    end;

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Código do Cliente inválido!');
    end
    else
    Begin
      CLI:=' AND (T3.CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + '(CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Begin
      edtCodigoPRD.SetFocus;
      raise Exception.Create('Código do produto inválido!');
    end
    else
    Begin
      CdPRD:=' AND (T2.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros  := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbSituacao.Checked then
  Begin
    case cmbSituacao.ItemIndex of
      0: Begin
           SIT:=' AND (T2.PDV_SITUACAO < 4) ';
           sFiltros := sFiltros + '(EmAberto)';
         end;
      1: Begin
           SIT:=' AND (T2.PDV_SITUACAO=4) ';
           sFiltros := sFiltros + '(Finalizado)';
         end;
      2: Begin
           SIT:=' AND (T2.PDV_SITUACAO=6) ';
           sFiltros := sFiltros + '(Cancelado)';
         end;
      3: Begin
           SIT:=' AND (T2.PDV_SITUACAO=8) ';
           sFiltros := sFiltros + '(Devolvido)';
         end;
      4: Begin
           SIT:=' AND (T2.PDV_SITUACAO < 4 AND T2.PDV_DIAS_RESERV > 0) '; //Orçamento
           sFiltros := sFiltros + '(Orcamento)';
         end;
    end;
  end
  else
    Sit := '';

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
    Begin
      dblCodigoCNC.SetFocus;
      raise Exception.Create('Centro de Custo inválido!');
    end
    else
    Begin
      CNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + '(CNC:'+dblCodigoCNC.Text+')';
    end;

  if ckbNotaFiscal.Checked then
    if not VerificaInteiroBranco(edtNotaFiscal.Text) then
    Begin
      edtNotaFiscal.SetFocus;
      raise Exception.Create('Número da Nota inválido!');
    end
    else
    Begin
      NTF:=' AND (T2.PDV_NOTA_FISCAL='+edtNotaFiscal.Text+') ';
      sFiltros := sFiltros + '(Nota:'+edtNotaFiscal.Text+') ';
    end;

  if tag = 0 then
  Begin
    Application.CreateForm(Trpt_DevolucaoParcial, rpt_DevolucaoParcial);
    with rpt_DevolucaoParcial do
    Begin
      zrlFiltros.Caption := sFiltros;
      if CheckBox10.Checked then
      Begin
        SZRGroup1.Height := 0;
        zrb_detalhe.Height := 0;
      end;
      if CheckBox20.Checked then
        ZRGroup1.ForceNewPage := True;
      Item_de_Troca1.Close;
      Item_de_Troca1.SQL.Text:='SELECT T1.*,T2.*,T3.PDV_DATA_HORA,T3.CNC_CLIENTE,T3.CLI_CODIGO '+
        ' FROM TROCA T1, ITEM_DE_TROCA T2, PEDIDO_DE_VENDA T3 '+
        ' WHERE (T1.CNC_CODIGO=T2.CNC_CODIGO) AND (T1.CNC_CODIGO=T3.CNC_CODIGO)'+
        ' AND (T1.TRO_CODIGO=T2.TRO_CODIGO) AND (T1.PDV_CODIGO=T3.PDV_CODIGO) AND '+
        ' (T2.ITO_ENTRASAI=1) AND (T2.ITO_SITUACAO=1) '+
        DataINI+DataFIM+CNC+CLI+FUN+PDV+NTF+CdPRD+
        ' ORDER BY T2.CNC_CODIGO,T2.FUN_CODIGO,T1.PDV_CODIGO,T1.TRO_DATA ASC ';
      Item_de_Troca1.Open;
      if Item_de_Troca1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      SZRLabel5.Caption := mskDataINI.Text;
      SZRLabel7.Caption := mskDataFIM.Text;
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelPedido.ckbCodigoPRDClick(Sender: TObject);
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
    edtCodigoPRD.Text:='';
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSelPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxSelPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxSelPedido.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=50;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=50;
        ShowModal;
      end;
    end;
  End;
end;

end.

