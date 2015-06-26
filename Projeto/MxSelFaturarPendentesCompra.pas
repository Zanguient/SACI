unit MxSelFaturarPendentesCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Conta_de_Caixa, DB,
  DBTables, SQuery, Parametro, CentroCusto, Mask, DateUtils;

type
  TfMxSelFaturarPendentesCompra = class(TForm)
    Panel2: TPanel;
    SB_Fechar: TBitBtn;
    SB_Confirmar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Panel3: TPanel;
    ckbCodigoFOR: TCheckBox;
    edtCodigoFOR: TEdit;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    SB_Imprimir: TBitBtn;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    CdPCP, CdPCP2: string;
    update : string;
  end;

var
  fMxSelFaturarPendentesCompra: TfMxSelFaturarPendentesCompra;

implementation

uses UDM, Funcoes, MxFaturarPendentesCompra, UFaturarPendentesCompras, MxSCotaFor;

{$R *.DFM}


procedure TfMxSelFaturarPendentesCompra.SB_ConfirmarClick(Sender: TObject);
var
  DataFIM, CdFOR, sFiltros: string;
begin
  sFiltros := '';
  CdFOR := '';
  CdPCP := '';

  //pedido
  if ckbCodigoPDV.Checked then
  Begin
    if edtCodigoPDV.Text = '' then
    Begin
      edtCodigoPDV.SetFocus;
      raise Exception.Create('Código do pedido de compra inválido!');
    end;
  end;

  //fornecedor
  if ckbCodigoFOR.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
    Begin
      edtCodigoFOR.SetFocus;
      raise Exception.Create('Código do Fornecedor inválido!');
    end
    else
      CdFOR:=' AND (F1.FOR_CODIGO='+edtCodigoFOR.Text+') '
  end;
  //
  //Peido de compra
  {if ckbCodigoPDV.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Begin
      edtCodigoPDV.SetFocus;
      raise Exception.Create('Código do Pedido inválido!');
    end
    else
      CdPCP:=' AND (P1.PCP_CODIGO='+edtCodigoPDV.Text+') '
  end;}
  //faturar mais de um pedido
  if ckbCodigoPDV.Checked then
  begin
    CdPCP:=' AND (P1.PCP_CODIGO IN ('+edtCodigoPDV.Text+')) ';
    update :=' AND (PCP_CODIGO IN ('+edtCodigoPDV.Text+')) ';
  end
  else
  begin
    CdPCP:='';
    update :='';
  end;


  //
  DataFim := ' AND EXISTS (SELECT PCP_CODIGO '+
    ' FROM PEDIDO_DE_COMPRA P1 '+
    ' WHERE P1.PCP_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date)+'" '+
    ' AND P1.PCP_SITUACAO=2 '+ CdPCP +
    ' AND P1.FPE_CODIGO=-1 '+     //Fatura Pendente
    ' AND P1.FOR_CODIGO=F1.FOR_CODIGO) ';



  Application.CreateForm(TfMxFaturarPendentesCompra, fMxFaturarPendentesCompra);
  with fMxFaturarPendentesCompra do
  Begin
    tag := self.Tag;
    vDataBase := self.DateTimePicker1.Date;
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM FORNECEDOR F1 '+
      ' WHERE F1.FOR_CODIGO<>-10 '+
      CdFOR+DataFIM+
      ' ORDER BY FOR_RZ_SOCIAL ASC';
    Entidade.Open;

    if not Entidade.Isempty then
      ShowModal
    else
      raise Exception.Create('Pedido de compra pendente não localizado!');
  end;
end;

procedure TfMxSelFaturarPendentesCompra.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(1);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    with fMxSCotaFor do
    Begin
      Fornecedor1.Close;
      Fornecedor1.SQL.Text := 'SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      Fornecedor1.Open;
      tag:=39;
      ShowModal;
    end;
  End;
end;

procedure TfMxSelFaturarPendentesCompra.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Color:=clWindow;
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.Color:=AlteraCorComponentes;
    edtCodigoFOR.Text:='';
    edtCodigoFOR.Enabled:=False;
  end;
end;

procedure TfMxSelFaturarPendentesCompra.FormShow(Sender: TObject);
var
  Sabado: TDateTime;
begin
  Sabado := 0;
  DM.Usuario1.AlteraCorComponentes(self);

  case DayOfTheWeek(DM.Configuracao1.Data) of //1o dia Segunda
    1: Sabado := DM.Configuracao1.Data - 2;
    2: Sabado := DM.Configuracao1.Data - 3;
    3: Sabado := DM.Configuracao1.Data - 4;
    4: Sabado := DM.Configuracao1.Data - 5;
    5: Sabado := DM.Configuracao1.Data - 6;
    6: Sabado := DM.Configuracao1.Data - 0;
    7: Sabado := DM.Configuracao1.Data - 1;
  end;
  DateTimePicker1.Date := Sabado;
end;

procedure TfMxSelFaturarPendentesCompra.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Fechar.Enabled then
    Begin
      SB_Fechar.SetFocus;
      SB_FecharClick(sender);
    end
    else
      Close;
  end
  else if Key=#13 then
  Begin
    if SB_Confirmar.Enabled then
    Begin
      SB_Confirmar.SetFocus;
      SB_ConfirmarClick(sender);
    end;
  end;
end;

procedure TfMxSelFaturarPendentesCompra.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelFaturarPendentesCompra.SB_ImprimirClick(Sender: TObject);
var
  CdFOR, sFiltros: string;
begin
  sFiltros := '';
  CdFOR := '';

  if ckbCodigoPDV.Checked then
    CdPCP2:=' AND (T2.PCP_CODIGO IN ('+edtCodigoPDV.Text+')) '
  else
    CdPCP2:='';

  if ckbCodigoFOR.Checked then
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
    Begin
      edtCodigoFOR.SetFocus;
      raise Exception.Create('Código do Fornecedor inválido!');
    end
    else
      CdFOR :=' AND F1.FOR_CODIGO='+edtCodigoFOR.Text;

  Application.CreateForm(Trpt_FaturarPendentesCompras, rpt_FaturarPendentesCompras);
  with rpt_FaturarPendentesCompras do
  Begin
    tag := 0;
    zrlFiltros.Caption := 'Data: '+DateToStr(DateTimePicker1.date)+' (Faturar Pendentes)'+sFiltros;

    zrbGrupoCLI.Height := 0;

    Entidade.Close;
    Entidade.SQL.Text:='SELECT T2.*,F1.FOR_RZ_SOCIAL '+
      ' FROM Pedido_de_Compra T2, FORNECEDOR F1 '+
      ' WHERE T2.PCP_CODIGO<>0 '+
      ' AND T2.PCP_SITUACAO=2 '+
      ' AND T2.FPE_CODIGO=-1 '+     //Fatura Pendente
      ' AND T2.PCP_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date)+'" '+
      CdFOR+
      CdPCP2+
      ' AND T2.FOR_CODIGO=F1.FOR_CODIGO '+
      ' ORDER BY F1.FOR_RZ_SOCIAL, T2.PCP_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta Vazia!');
    report.preview;
    Close;
  end;
end;

procedure TfMxSelFaturarPendentesCompra.ckbCodigoPDVClick(Sender: TObject);
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
    edtCodigoPDV.Text:='';
    edtCodigoPDV.Enabled:=False;
  end;
end;

procedure TfMxSelFaturarPendentesCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

end.
