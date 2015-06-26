unit MxSelDataComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, Db, DBTables, SQuery,
  Vendedor, Variants;

type
  TfMxSelDataComissao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    dblCodigoFUN: TDBLookupComboBox;
    rdbTodosVendedores: TRadioButton;
    rdbVendedor: TRadioButton;
    GroupBox1: TGroupBox;
    ckbSintetico: TCheckBox;
    mskPeriodo: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    ckbIndicadores1: TCheckBox;
    ckbIndicadores2: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rdbTodosVendedoresClick(Sender: TObject);
    procedure rdbVendedorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Vendedor1BeforeOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbIndicadores1Click(Sender: TObject);
    procedure ckbIndicadores2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DataOk: Boolean;
    cMes1,cMes2,cAno1,cAno2:string;
  end;

var
  fMxSelDataComissao: TfMxSelDataComissao;

implementation

uses funcoes, UDM, UComissaoVendaLBM, UComissaoNova, UComissaoGerente;

{$R *.DFM}


procedure TfMxSelDataComissao.BitBtn1Click(Sender: TObject);
const
  mes : array [1..12] of string = ('JANEIRO','FEVEREIRO','MARCO','ABRIL','MAIO','JUNHO','JULHO','AGOSTO','SETEMBRO','OUTUBRO','NOVEMBRO','DEZEMBRO');
Var
  mensagem,Vendedor,vIndicador,sFiltros :string;
begin
  mensagem:='';
  Vendedor := '';
  vIndicador := '';
  sFiltros := '';
  if rdbVendedor.Checked then
  Begin
    if dblCodigoFUN.Text = '' then
      mensagem:=mensagem+'Vendedor/Técnico/Indicador inválido!'+#13
    else if ckbIndicadores1.Checked then
    Begin
      sFiltros := sFiltros + '(INDICADOR1='+dblCodigoFUN.Text+')';
      vIndicador := ' AND (D1.FUN_CODIGO_1='+IntToStr(dblCodigoFUN.KeyValue)+') ';
    end
    else if ckbIndicadores2.Checked then
    Begin
      vIndicador := ' AND (D1.FUN_CODIGO_2='+IntToStr(dblCodigoFUN.KeyValue)+') ';
      sFiltros := sFiltros + '(INDICADOR2='+dblCodigoFUN.Text+')';
    end
    else
    Begin
      Vendedor := ' AND (T2.FUN_CODIGO='+IntToStr(dblCodigoFUN.KeyValue)+') ';
      sFiltros := sFiltros + '(VENDEDOR/TECNICO='+dblCodigoFUN.Text+')';
    end;
  End;

  if mskPeriodo.Text = '  /    ' then
    Raise Exception.Create('Período inválido!');
  if StrToInt(Copy(mskPeriodo.Text,1,2)) > 12 then
    mensagem:=mensagem+'Mês inválido!'+#13
  Else if StrToInt(Copy(mskPeriodo.Text,1,2)) < 1 then
    mensagem:=mensagem+'Mês inválido!'+#13;
  if (StrToInt(Copy(mskPeriodo.Text,4,4)) < 1900) or (StrToInt(Copy(mskPeriodo.Text,4,4)) > 2050) then
    mensagem:=mensagem+'Ano inválido!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  cAno1:=Copy(mskPeriodo.Text,4,4);
  cAno2:=Copy(mskPeriodo.Text,4,4);

  if (StrToInt(Copy(mskPeriodo.Text,1,2))-1) = 0 then
  Begin
    cMes1:='12';
    cAno1:=IntToStr(StrToInt(Copy(mskPeriodo.Text,4,4))-1);
  end
  Else if (StrToInt(Copy(mskPeriodo.Text,1,2))-1) < 10 then
    cMes1:='0'+IntToStr(StrToInt(Copy(mskPeriodo.Text,1,2))-1)
  else
    cMes1:=IntToStr(StrToInt(Copy(mskPeriodo.Text,1,2))-1);

  cMes2:=Copy(mskPeriodo.Text,1,2);

  If tag = 0 then
  begin
    Application.CreateForm(Trpt_ComissaoLBM,rpt_ComissaoLBM);
    if ckbSintetico.Checked then
    Begin
      rpt_ComissaoLBM.zrbGrupoFUN.Height:=1;
      rpt_ComissaoLBM.zrbDetalhe.Height:=0;
      rpt_ComissaoLBM.ZRLabel5.Width:=78;
      rpt_ComissaoLBM.ZRLabel24.Width:=78;
      rpt_ComissaoLBM.ZRLabel11.Width:=78;
      rpt_ComissaoLBM.ZRLabel8.Width:=78;
      rpt_ComissaoLBM.ZRLabel15.Width:=78;
      rpt_ComissaoLBM.report.Width:=80;
      rpt_ComissaoLBM.ZRLabel11.Enabled:=False;
    end;
    rpt_ComissaoLBM.Funcionario1.Open;

    if ckbIndicadores1.Checked then
    Begin
      sFiltros := sFiltros + '(INDICADORES1)';
      rpt_ComissaoLBM.zrlDescVendedor.Caption := 'Indicador 1:';
      rpt_ComissaoLBM.Item_Pedido_Venda1.SQL.Text:='SELECT '+
        ' T2.* '+
        ',D1.FUN_CODIGO_1 AS VENDEDOR '+
        ',T1.PDV_DATA_HORA,T1.PDV_SITUACAO,T1.PDV_NOTA_FISCAL '+
        ' FROM PEDIDO_DE_VENDA t1, ITEM_DE_PEDIDO_DE_VENDA T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
        ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND T1.PDV_SITUACAO=4 '+vIndicador+
        ' AND (T1.PDV_NOTA_FISCAL>0 OR T1.PDV_NOTA_FISCAL=-1 OR T1.PDV_NOTA_FISCAL=-2) '+
        ' AND T1.PDV_DT_EMISSAO_VENDA>="'+cMes1+'/21/'+cAno1+'" '+
        ' AND T1.PDV_DT_EMISSAO_VENDA<"'+cMes2+'/21/'+cAno2+'" '+
        ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
        ' AND T1.PDV_CODIGO=T2.PDV_CODIGO '+
        ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
        ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
        ' ORDER BY D1.FUN_CODIGO_1,T1.PDV_DATA_HORA,T1.PDV_CODIGO ASC';
    end
    else if ckbIndicadores2.Checked then
    Begin
      sFiltros := sFiltros + '(INDICADORES2)';
      rpt_ComissaoLBM.zrlDescVendedor.Caption := 'Indicador 2:';
      rpt_ComissaoLBM.Item_Pedido_Venda1.SQL.Text := ' SELECT '+
        ' T2.* '+
        ',D1.FUN_CODIGO_2 AS VENDEDOR '+
        ',T1.PDV_DATA_HORA,T1.PDV_SITUACAO,T1.PDV_NOTA_FISCAL '+
        ' FROM PEDIDO_DE_VENDA t1, ITEM_DE_PEDIDO_DE_VENDA T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
        ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND T1.PDV_SITUACAO=4 '+vIndicador+
        ' AND (T1.PDV_NOTA_FISCAL>0 OR T1.PDV_NOTA_FISCAL=-1 OR T1.PDV_NOTA_FISCAL=-2) '+
        ' AND T1.PDV_DT_EMISSAO_VENDA>="'+cMes1+'/21/'+cAno1+'" '+
        ' AND T1.PDV_DT_EMISSAO_VENDA<"'+cMes2+'/21/'+cAno2+'" '+
        ' AND T1.CNC_CODIGO = T2.CNC_CODIGO '+
        ' AND T1.PDV_CODIGO = T2.PDV_CODIGO '+
        ' AND T1.CNC_CODIGO = D1.CNC_CODIGO '+
        ' AND T1.PDV_CODIGO = D1.PDV_CODIGO '+
        ' ORDER BY D1.FUN_CODIGO_2,T1.PDV_DT_EMISSAO_VENDA,T1.PDV_CODIGO ASC';
    end
    else
      rpt_ComissaoLBM.Item_Pedido_Venda1.SQL.Text:='SELECT '+
        ' T2.* '+
        ',T2.FUN_CODIGO AS VENDEDOR '+
        ',T1.PDV_DATA_HORA,T1.PDV_SITUACAO,T1.PDV_NOTA_FISCAL '+
        ' FROM PEDIDO_DE_VENDA t1, ITEM_DE_PEDIDO_DE_VENDA T2 '+
        ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND T1.PDV_SITUACAO=4 '+Vendedor+
        ' AND (T1.PDV_NOTA_FISCAL>0 OR T1.PDV_NOTA_FISCAL=-1 OR T1.PDV_NOTA_FISCAL=-2) '+
        ' AND T1.PDV_DT_EMISSAO_VENDA>="'+cMes1+'/21/'+cAno1+'" '+
        ' AND T1.PDV_DT_EMISSAO_VENDA<"'+cMes2+'/21/'+cAno2+'" '+
        ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
        ' AND T1.PDV_CODIGO=T2.PDV_CODIGO '+
        ' ORDER BY T2.FUN_CODIGO, T1.PDV_DT_EMISSAO_VENDA, T1.PDV_CODIGO ASC';
    rpt_ComissaoLBM.Item_Pedido_Venda1.Open;
    rpt_ComissaoLBM.zrlFiltro.Caption := sFiltros;
    if rpt_ComissaoLBM.Item_Pedido_Venda1.isEmpty then
      Raise Exception.Create('Consulta vazia!');
    rpt_ComissaoLBM.SZRLabel5.Caption := mes[StrToInt(Copy(mskPeriodo.text,1,2))]+Copy(mskPeriodo.Text,3,5);
    rpt_ComissaoLBM.report.Preview;
    rpt_ComissaoLBM.Close;
  end
  else if tag = 1 then  //Comissão Vendas (LBM-Móveis)
  Begin
    Application.CreateForm(Trpt_ComissaoNova, rpt_ComissaoNova);
    with rpt_ComissaoNova do
    Begin
      tag := 0;
      zrlFiltro.Caption := sFiltros;
      qrlDescricaoPeriodo.Caption := mes[StrToInt(Copy(mskPeriodo.text,1,2))]+Copy(mskPeriodo.Text,3,5);
      DataINI := StrToDate('21/'+cMes1+'/'+cAno1);
      DataFIM := StrToDate('20/'+cMes2+'/'+cAno2);
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM FUNCIONARIO T2 '+
        ' WHERE FUN_CODIGO>0 '+
        Vendedor+
        ' ORDER BY T2.FUN_FUNCAO, T2.FUN_APELIDO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.PreviewModal;
    end;
  end
  else if tag = 2 then  //Comissão Gerentes (LBM)
  Begin
    Application.CreateForm(Trpt_ComissaoGerente, rpt_ComissaoGerente);
    with rpt_ComissaoGerente do
    Begin
      tag := 0;
      zrlFiltro.Caption := sFiltros;
      qrlDescricaoRelatorio.Caption := 'Relatório de Comissão de Gerentes';
      qrlDescricaoPeriodo.Caption := mes[StrToInt(Copy(mskPeriodo.text,1,2))]+Copy(mskPeriodo.Text,3,5);
      DataINI := StrToDate('21/'+cMes1+'/'+cAno1);
      DataFIM := StrToDate('20/'+cMes2+'/'+cAno2);
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM FUNCIONARIO T2 '+
        ' WHERE T2.FUN_CODIGO>0 '+
        Vendedor+
        ' AND T2.FUN_CODIGO IN '+
        ' (SELECT FUN_CODIGO FROM EQUIPE_GERENCIA) '+
        ' ORDER BY T2.FUN_FUNCAO, T2.FUN_APELIDO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.PreviewModal;
    end;
  end;
end;

procedure TfMxSelDataComissao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelDataComissao.rdbTodosVendedoresClick(Sender: TObject);
begin
   dblCodigoFUN.Color:=AlteraCorComponentes;
   dblCodigoFUN.Enabled:=False;
   dblCodigoFUN.KeyValue:=0;
end;

procedure TfMxSelDataComissao.rdbVendedorClick(Sender: TObject);
begin
  dblCodigoFUN.Color:=clWindow;
  dblCodigoFUN.Enabled:=True;
  dblCodigoFUN.SetFocus;
end;

procedure TfMxSelDataComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Vendedor1.Active:=false;
  Action:=caFree;
end;

procedure TfMxSelDataComissao.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Vendedor1.Close;
  if DM.Configuracao1.Empresa = empLBM then 
  Begin
    if tag <> 2 then
      Vendedor1.SQL.Text := 'SELECT * '+
        ' FROM FUNCIONARIO '+
        ' WHERE (FUN_APARECE_VENDAS=1 '+
        '  OR FUN_APARECE_SERVICOS=1) '+
        ' AND FUN_SITUACAO <> 1 '+
        ' ORDER BY FUN_APELIDO '
    else
      Vendedor1.SQL.Text := 'SELECT * '+
        ' FROM FUNCIONARIO '+
        ' WHERE FUN_FUNCAO = 56 '+ //Gerente
        ' AND FUN_SITUACAO <> 1 '+
        ' ORDER BY FUN_APELIDO ';
  end;
  Vendedor1.Open;

  mskPeriodo.Text:=formatDateTime('mm/yyyy',DM.Configuracao1.Data);

  if tag > 0 then
  Begin
//    chk_sintetico.Enabled  := False;
    ckbIndicadores1.Enabled := False;
    ckbIndicadores2.Enabled := False;
  end;
end;

procedure TfMxSelDataComissao.Vendedor1BeforeOpen(DataSet: TDataSet);
begin
  try
    Vendedor1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxSelDataComissao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TfMxSelDataComissao.ckbIndicadores1Click(Sender: TObject);
begin
  if ckbIndicadores1.Checked then
    ckbIndicadores2.Checked := False;
end;

procedure TfMxSelDataComissao.ckbIndicadores2Click(Sender: TObject);
begin
  if ckbIndicadores2.Checked then
    ckbIndicadores1.Checked := False;
end;

end.
