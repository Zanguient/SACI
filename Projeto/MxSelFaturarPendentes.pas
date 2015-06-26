unit MxSelFaturarPendentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Conta_de_Caixa, DB,
  DBTables, SQuery, Parametro, CentroCusto, Mask, DateUtils;

type
  TfMxSelFaturarPendentes = class(TForm)
    Panel2: TPanel;
    SB_Fechar: TBitBtn;
    SB_Confirmar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    Panel3: TPanel;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    SB_Imprimir: TBitBtn;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelFaturarPendentes: TfMxSelFaturarPendentes;

implementation

uses UDM, Funcoes, CdCliente, MxFaturarPendentes, UFaturarPendentes,
  MxFaturarPendentesConvenio, UFaturarPendentesConvenio;

{$R *.DFM}


procedure TfMxSelFaturarPendentes.SB_ConfirmarClick(Sender: TObject);
var
  DataFIM, CdCLI, sFiltros, CdCNC: string;
begin
  sFiltros := '';
  CdCNC := '';
  CdCLI := '';

  if ckbCodigoCLI.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Código do Cliente/Convênio inválido!');
    end
    else if self.Tag = 0 then
      CdCLI:=' AND (C1.CLI_CODIGO='+edtCodigoCLI.Text+') '
    else
      CdCLI:=' AND (C1.CLI_CONVENIO='+edtCodigoCLI.Text+') ';    
  end;

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      CdCNC:=' AND (C1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  if self.Tag = 0 then //Faturar Pendentes
    DataFim := ' AND (EXISTS (SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE P1.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date-22)+'" '+
      ' AND P1.PDV_SITUACAO=4 '+
      ' AND P1.PDV_TITULO_GERADO=0 '+   //Não Gerou Título
      ' AND P1.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
      ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
      ' AND C1.CLI_MENSAL=1) '+
      ' OR EXISTS (SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE P1.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date-7)+'" '+
      ' AND P1.PDV_SITUACAO=4 '+
      ' AND P1.PDV_TITULO_GERADO=0 '+   //Não Gerou Título
      ' AND P1.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
      ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
      ' AND C1.CLI_QUINZENAL=1) '+
      ' OR EXISTS (SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE P1.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date)+'" '+
      ' AND P1.PDV_SITUACAO=4 '+
      ' AND (P1.PDV_TITULO_GERADO=0 '+    //Não Gerou Título
      '   OR P1.PDV_TITULO_GERADO2=0) '+  //Não Gerou Título Serviço
      ' AND P1.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
      ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
      ' AND (C1.CLI_QUINZENAL=0 OR C1.CLI_QUINZENAL IS NULL) AND (C1.CLI_MENSAL=0 OR C1.CLI_MENSAL IS NULL))) '
  else if self.Tag = 1 then //Faturar Pendentes Convênio
    DataFim := ' AND (EXISTS (SELECT PDV_CODIGO '+
      ' FROM PEDIDO_DE_VENDA P1, CLIENTE C2 '+
      ' WHERE P1.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date-22)+'" '+
      '   AND P1.PDV_SITUACAO=4 '+
      '   AND P1.PDV_TITULO_GERADO=0 '+   //Não Gerou Título
      '   AND P1.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
      '   AND C2.CNC_CONVENIO=C1.CNC_CODIGO AND C2.CLI_CONVENIO=C1.CLI_CODIGO '+
      '   AND C2.CLI_MENSAL=1 '+
      '   AND P1.CNC_CODIGO=C2.CNC_CODIGO AND P1.CLI_CODIGO=C2.CLI_CODIGO) '+
      ' OR EXISTS (SELECT PDV_CODIGO '+
      '   FROM PEDIDO_DE_VENDA P1, CLIENTE C2 '+
      '   WHERE P1.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date-7)+'" '+
      '   AND P1.PDV_SITUACAO=4 '+
      '   AND P1.PDV_TITULO_GERADO=0 '+   //Não Gerou Título
      '   AND P1.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
      '   AND C2.CNC_CONVENIO=C1.CNC_CODIGO AND C2.CLI_CONVENIO=C1.CLI_CODIGO '+
      '   AND C1.CLI_QUINZENAL=1 '+
      '   AND P1.CNC_CODIGO=C2.CNC_CODIGO AND P1.CLI_CODIGO=C2.CLI_CODIGO) '+
      ' OR EXISTS (SELECT PDV_CODIGO '+
      '   FROM PEDIDO_DE_VENDA P1, CLIENTE C2 '+
      '   WHERE P1.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date)+'" '+
      '   AND P1.PDV_SITUACAO=4 '+
      '   AND P1.PDV_TITULO_GERADO=0 '+   //Não Gerou Título
      '   AND P1.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
      '   AND C2.CNC_CONVENIO=C1.CNC_CODIGO AND C2.CLI_CONVENIO=C1.CLI_CODIGO '+
      '   AND (C1.CLI_QUINZENAL=0 OR C1.CLI_QUINZENAL IS NULL) AND (C1.CLI_MENSAL=0 OR C1.CLI_MENSAL IS NULL)'+
      '   AND P1.CNC_CODIGO=C2.CNC_CODIGO AND P1.CLI_CODIGO=C2.CLI_CODIGO)) ';

  if self.Tag = 0 then //Faturar Pendentes
  Begin
    Application.CreateForm(TfMxFaturarPendentes, fMxFaturarPendentes);
    with fMxFaturarPendentes do
    Begin
      tag := self.Tag;
      vDataBase := self.DateTimePicker1.Date;
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM CLIENTE C1 '+
        ' WHERE C1.CLI_CODIGO<>-10 '+
        CdCLI+CdCNC+DataFIM+
        ' ORDER BY CLI_NOTA DESC,CLI_RZ_SOCIAL ASC';
      Entidade.Open;
      Showmodal;
    end;
  end
  else if self.Tag = 1 then //Faturar Pendentes Convênio
  Begin
    Application.CreateForm(TfMxFaturarPendentesConvenio, fMxFaturarPendentesConvenio);
    with fMxFaturarPendentesConvenio do
    Begin
      tag := self.Tag;
      vDataBase := self.DateTimePicker1.Date;
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM CLIENTE C1 '+
        ' WHERE C1.CLI_CODIGO<>-10 '+
        CdCLI+CdCNC+DataFIM+
        ' ORDER BY CLI_RZ_SOCIAL ASC';
      Entidade.Open;
      Showmodal;
    end;
  end;
end;

procedure TfMxSelFaturarPendentes.ckbCodigoCNCClick(Sender: TObject);
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

procedure TfMxSelFaturarPendentes.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=27;
    fCadCli.CentroCusto2.open;
    fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
    fCadCli.dblCentroDeCusto.KeyValue:=fCadCli.CentroCusto2.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxSelFaturarPendentes.ckbCodigoCLIClick(Sender: TObject);
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
    edtCodigoCLI.Text:='';
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure TfMxSelFaturarPendentes.FormShow(Sender: TObject);
var
  Sabado: TDateTime;
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Sabado := 0;
  ckbCodigoCNC.Checked := True;
  ckbCodigoCNC.Enabled := False;

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

  if not DM.Configuracao1.CPD then
    dblCodigoCNC.Enabled := False;
end;

procedure TfMxSelFaturarPendentes.FormKeyPress(Sender: TObject;
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

procedure TfMxSelFaturarPendentes.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelFaturarPendentes.SB_ImprimirClick(Sender: TObject);
var
  DataFIM, CdCLI, sFiltros, CdCNC: string;
begin
  sFiltros := '';
  CdCNC := '';
  CdCLI := '';

  DataFim := ' AND (EXISTS (SELECT PDV_CODIGO '+
    ' FROM PEDIDO_DE_VENDA P1 '+
    ' WHERE P1.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date-22)+'" '+
    ' AND P1.PDV_SITUACAO=4 '+
    ' AND P1.PDV_TITULO_GERADO=0 '+   //Não Gerou Título
    ' AND P1.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
    ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
    ' AND C1.CLI_MENSAL=1) '+
    ' OR EXISTS (SELECT PDV_CODIGO '+
    ' FROM PEDIDO_DE_VENDA P1 '+
    ' WHERE P1.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date-7)+'" '+
    ' AND P1.PDV_SITUACAO=4 '+
    ' AND P1.PDV_TITULO_GERADO=0 '+   //Não Gerou Título
    ' AND P1.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
    ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
    ' AND C1.CLI_QUINZENAL=1) '+
    ' OR EXISTS (SELECT PDV_CODIGO '+
    ' FROM PEDIDO_DE_VENDA P1 '+
    ' WHERE P1.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date)+'" '+
    ' AND P1.PDV_SITUACAO=4 '+
    ' AND (P1.PDV_TITULO_GERADO=0 '+    //Não Gerou Título
    '   OR P1.PDV_TITULO_GERADO2=0) '+  //Não Gerou Título Serviço
    ' AND P1.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
    ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
    ' AND (C1.CLI_QUINZENAL=0 OR C1.CLI_QUINZENAL IS NULL) AND (C1.CLI_MENSAL=0 OR C1.CLI_MENSAL IS NULL))) ';

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Código do Cliente inválido!');
    end
    else if Self.Tag = 0 then
      CdCLI:=' AND (C1.CLI_CODIGO='+edtCodigoCLI.Text+') '
    else
      CdCLI:=' AND (C1.CLI_CONVENIO='+edtCodigoCLI.Text+') ';    

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      CdCNC:=' AND (C1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  if self.Tag = 0 then
  Begin
    Application.CreateForm(Trpt_FaturarPendentes, rpt_FaturarPendentes);
    with rpt_FaturarPendentes do
    Begin
      tag := 0;
      zrlFiltros.Caption := 'Data: '+DateToStr(DateTimePicker1.date)+' (Faturar Pendentes)'+sFiltros;

      zrbGrupoCLI.Height := 0;

      Entidade.Close;
      Entidade.SQL.Text:='SELECT T2.*,C1.CLI_RZ_SOCIAL,C1.CLI_MENSAL,C1.CLI_QUINZENAL '+
        ' FROM Pedido_de_Venda T2, CLIENTE C1 '+
        ' WHERE (T2.CLI_CODIGO<>0) '+
        ' AND T2.PDV_SITUACAO=4 '+
        ' AND T2.PDV_TITULO_GERADO=0 '+   //Não Gerou Título
        ' AND (T2.PDV_TITULO_GERADO=0 '+    //Não Gerou Título
        '   OR T2.PDV_TITULO_GERADO2=0) '+  //Não Gerou Título Serviço
        ' AND T2.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
        ' AND T2.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date)+'" '+
        CdCLI+CdCNC+DataFIM+
        ' AND (T2.CNC_CLIENTE=C1.CNC_CODIGO) AND (T2.CLI_CODIGO = C1.CLI_CODIGO) '+
        ' ORDER BY T2.CNC_CLIENTE,C1.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.PDV_CODIGO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.preview;
      Close;
    end;
  end
  else
  Begin
    Application.CreateForm(Trpt_FaturarPendentesConvenio, rpt_FaturarPendentesConvenio);
    with rpt_FaturarPendentesConvenio do
    Begin
      tag := 0;
      zrlFiltros.Caption := 'Data: '+DateToStr(DateTimePicker1.date)+' (Faturar Pendentes)'+sFiltros;

      Entidade.Close;
      Entidade.SQL.Text:='SELECT T2.* '+
        ',C1.CLI_RZ_SOCIAL,C1.CLI_MENSAL,C1.CLI_QUINZENAL,C1.CNC_CONVENIO,C1.CLI_CONVENIO '+
        ' FROM Pedido_de_Venda T2, CLIENTE C1 '+
        ' WHERE (T2.CLI_CODIGO<>0) '+
        ' AND T2.PDV_SITUACAO=4 '+
        ' AND T2.PDV_TITULO_GERADO=0 '+   //Não Gerou Título
        ' AND T2.PDV_TIPO_VENDA=1 '+     //Fatura Pendente
        ' AND T2.PDV_DT_ENTREGA<="'+MesDia(DateTimePicker1.Date)+'" '+
        CdCLI+CdCNC+DataFIM+
        ' AND (T2.CNC_CLIENTE=C1.CNC_CODIGO) AND (T2.CLI_CODIGO = C1.CLI_CODIGO) '+
        ' ORDER BY C1.CNC_CONVENIO,C1.CLI_CONVENIO,C1.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.PDV_CODIGO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.preview;
      Close;
    end;
  end;
end;

end.
