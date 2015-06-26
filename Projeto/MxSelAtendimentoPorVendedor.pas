unit MxSelAtendimentoPorVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Menus, Variants, Parametro,
  CentroCusto;

type
  TfMxSelAtendimentoPorVendedor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    ckbCodigoFUN: TCheckBox;
    edtCodigoFUN: TEdit;
    DSParametro2: TDataSource;
    Parametro2: TParametro;
    ckbSintetico: TCheckBox;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    ckbSituacao: TCheckBox;
    cmbSituacao: TComboBox;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    rdgDataCadastro: TRadioButton;
    rdgDataAlterado: TRadioButton;
    ckbNumeroAtendimentos: TCheckBox;
    cmbNumeroAtendimentos: TComboBox;
    edtNumeroAtendimentos: TEdit;
    Bevel1: TBevel;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoFUNClick(Sender: TObject);
    procedure edtCodigoFUNKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure ckbNumeroAtendimentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    Centro: string;
  end;

var
  fMxSelAtendimentoPorVendedor: TfMxSelAtendimentoPorVendedor;

implementation

uses
  UDM, Funcoes, MxSFuncionario, UAtendimentosPorVendedor,
  MxGraficoAtendimentosPorVendedor;

{$R *.DFM}


procedure TfMxSelAtendimentoPorVendedor.SB_ConfirmarClick(Sender: TObject);
var
  DtINI, DtINIP1, DtFIM, DtFIMP1, CdCNC, CdFUN, CdFUNI1, sSituacao, Ordem, sFiltros:string;
begin
  CdCNC:='';
  CdFUN:='';
  CdFUNI1:='';
  sSituacao:='';
  sFiltros:='';

  if not VerificaDataBranco(mskDataINI.Text) then
    Raise exception.Create('Data inicial inválida!')
  else
  Begin
    if rdgDataCadastro.Checked then
    Begin
      DtINI := ' AND A1.APV_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'" ';
      DtINIP1 := ' AND P1.PDV_DATA_HORA>="'+MesDia(mskDataINI.Text)+'" ';
    end
    else if rdgDataAlterado.Checked then
    Begin
      DtINI := ' AND A1.APV_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'" ';
      DtINIP1 := ' AND P1.PDV_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'" ';
    end;
  end;

  if not VerificaDataBranco(mskDataFIM.Text) then
    Raise exception.Create('Data final inválida!')
  else
  Begin
    if rdgDataCadastro.Checked then
    Begin
      DtFIM := ' AND A1.APV_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      DtFIMP1 := ' AND P1.PDV_DATA_HORA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
    end
    else if rdgDataAlterado.Checked then
    Begin
      DtFIM := ' AND A1.APV_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      DtFIMP1 := ' AND P1.PDV_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
    end;
  end;


  if ckbCodigoFUN.Checked then
    if not VerificaInteiroBranco(edtCodigoFUN.Text) then
      Raise Exception.Create('Código do Funcionário inválido!')
    else
    Begin
      CdFUN := ' AND (FUN.FUN_CODIGO='+edtCodigoFUN.Text+') ';
      CdFUNI1:= ' AND (I1.FUN_CODIGO='+edtCodigoFUN.Text+') ';
      sFiltros := sFiltros + '(FUN='+edtCodigoFUN.Text+') ';
    end;

  if ckbCodigoCNC.Checked then
  Begin
    if dblCodigoCNC.Text = '' then
      Raise exception.Create('Centro de Custo inválido!');
    CdCNC := ' AND A1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';
    sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
  end;

  if ckbSituacao.Checked then
  Begin
    sSituacao := ' AND A1.FUN_SITUACAO='+IntToStr(cmbSituacao.ItemIndex);
    sFiltros := sFiltros + '(Sit:'+cmbSituacao.text+') ';
  end;

  Ordem := ' ORDER BY A1.CNC_CODIGO, A1.APV_DT_CADASTRO, FUN.FUN_APELIDO ';

  if tag = 0 then
  begin
    Application.CreateForm(Trpt_AtendimentosPorVendedor, rpt_AtendimentosPorVendedor);
    with rpt_AtendimentosPorVendedor do
    Begin
      Tag := 0;
      zrlfiltros.Caption := sFiltros;

      if ckbSintetico.Checked then
      Begin
        zrbCabecalhoPagina.Height := 4;
        zrbDetalhe.Height   := 0;
      end;

      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
        ',DATEPART(day, APV_DT_CADASTRO) AS DIA '+
        ',DATEPART(month, APV_DT_CADASTRO) AS MES '+
        ',DATEPART(year, APV_DT_CADASTRO) AS ANO '+
        ' FROM  ATENDIMENTO_POR_VENDEDOR A1 '+
        ' INNER JOIN FUNCIONARIO FUN '+
        ' ON A1.FUN_CODIGO=FUN.FUN_CODIGO '+
        ' WHERE A1.FUN_CODIGO>0 '+
        CdCNC+CdFUN+sSituacao+
        Ordem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.Preview;
      Close;
    end;
  end
  else if tag = 1 then //Gráfico Atendimento por Vendedor
  begin
    Application.CreateForm(TfMxGraficoAtendimentosPorVendedor, fMxGraficoAtendimentosPorVendedor);
    with fMxGraficoAtendimentosPorVendedor do                
    Begin
      tag := 0;

      DBChart1.Title.Text.Text := 'Atendimentos/Vendas por Vendedor - '+mskDataINI.Text+' a '+mskDataFIM.Text;

      Query1.SQL.Text:='SELECT FUN.FUN_CODIGO, FUN.FUN_APELIDO AS DESCRICAO '+
        ',SUM(A1.APV_ATENDIMENTOS) AS TOTAL '+
        ',(SELECT COUNT(DISTINCT CLI_CODIGO) '+
        '     FROM PEDIDO_DE_VENDA P1 '+
        '     WHERE P1.PDV_SITUACAO=4 '+
              DtINIP1+DtFIMP1+
        '     AND EXISTS (SELECT TOP 1 I1.PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
        '     WHERE I1.FUN_CODIGO>0 '+
        '     AND I1.FUN_CODIGO=FUN.FUN_CODIGO '+
        '     AND I1.CNC_CODIGO=P1.CNC_CODIGO '+
        '     AND I1.PDV_CODIGO=P1.PDV_CODIGO)) AS TOTAL2 '+
        ' FROM  ATENDIMENTO_POR_VENDEDOR A1 '+
        ' INNER JOIN FUNCIONARIO FUN '+
        ' ON A1.FUN_CODIGO=FUN.FUN_CODIGO '+
        ' WHERE A1.FUN_CODIGO>0 '+
        CdCNC+CdFUN+sSituacao+
        ' GROUP BY FUN.FUN_CODIGO, FUN.FUN_APELIDO '+
        ' ORDER BY FUN.FUN_APELIDO ';
      ShowModal;
    end;
  end;
end;

procedure TfMxSelAtendimentoPorVendedor.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelAtendimentoPorVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Parametro2.Close;
  Action := caFree;
end;

procedure TfMxSelAtendimentoPorVendedor.FormShow(Sender: TObject);
begin
  mskDataINI.SetFocus;
end;

procedure TfMxSelAtendimentoPorVendedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxSelAtendimentoPorVendedor.ckbCodigoFUNClick(Sender: TObject);
begin
  if ckbCodigoFUN.Checked then
  Begin
    edtCodigoFUN.Color:=clWindow;
    edtCodigoFUN.Enabled:=True;
    edtCodigoFUN.SetFocus;
  end
  else
  Begin
    edtCodigoFUN.Color:=AlteraCorComponentes;
    edtCodigoFUN.Clear;
    edtCodigoFUN.Enabled:=False;
  end;
end;

procedure TfMxSelAtendimentoPorVendedor.edtCodigoFUNKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #32 then
  Begin
    key := #0;  
    edtCodigoFUN.Clear;
    Application.CreateForm(TfMxSFuncionario, fMxSFuncionario);
    with fMxSFuncionario do
    Begin
      tag := 4;
      Funcionario1.Close;
      Funcionario1.Open;
      ShowModal;
    end;
  end;
end;

procedure TfMxSelAtendimentoPorVendedor.ckbCodigoCNCClick(Sender: TObject);
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
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelAtendimentoPorVendedor.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Enabled:=True;
    cmbSituacao.Color:=clWindow;
    cmbSituacao.ItemIndex:=0;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Enabled:=False;
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
  end;
end;

procedure TfMxSelAtendimentoPorVendedor.ckbNumeroAtendimentosClick(
  Sender: TObject);
begin
  if ckbNumeroAtendimentos.Checked then
  Begin
    cmbNumeroAtendimentos.Color:=clWindow;
    cmbNumeroAtendimentos.Enabled:=True;
    cmbNumeroAtendimentos.ItemIndex:=4;
    edtNumeroAtendimentos.Color:=clWindow;
    edtNumeroAtendimentos.Enabled:=True;
    try
      edtNumeroAtendimentos.SetFocus;
    except
    end;
  end
  else
  Begin
    cmbNumeroAtendimentos.Color:=AlteraCorComponentes;
    cmbNumeroAtendimentos.Enabled:=False;
    cmbNumeroAtendimentos.ItemIndex:=-1;
    edtNumeroAtendimentos.Color:=AlteraCorComponentes;
    edtNumeroAtendimentos.Clear;
    edtNumeroAtendimentos.Enabled:=False;
  end;
end;

end.
