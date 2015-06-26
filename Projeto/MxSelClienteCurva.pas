unit MxSelClienteCurva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery,
  DBCtrls, Menus, Variants, Funcionario;

type
  TfMxSelClienteCurva = class(TForm)
    Panel1: TPanel;
    edtCodigoCLI: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupComboBox2: TDBLookupComboBox;
    Centro_de_Custo: TQuery;
    DSCentro_de_Custo: TDataSource;
    CheckBox1: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox13: TCheckBox;
    Funcionario1: TFuncionario;
    DSVendedor: TDataSource;
    DBLookupComboBox5: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Bevel2: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelClienteCurva: TfMxSelClienteCurva;
  Centro:string;

implementation

uses
  UProduto, funcoes, UCurvaAbcCliente, CdCliente, UDM;

{$R *.DFM}


procedure TfMxSelClienteCurva.BitBtn1Click(Sender: TObject);
var
  DataINI,DataFIM,Ativo,cCLI,cVEN,Ordem:string;
  RecNo:Integer;
begin
  Centro:='';
  cCLI:='';
  Ativo:='';
  RecNo:=0;

  if not VerificaData(MaskEdit2.Text) then
    Raise Exception.Create('Data inicial inválida!')
  else if MaskEdit2.Text = '  /  /    ' then
    MaskEdit2.Text:='01/01/1900';

  DataINI := ' AND P.PDV_DATA_HORA>="'+MesDia(MaskEdit2.Text)+'" ';

  if not VerificaData(MaskEdit3.Text) then
    Raise Exception.Create('Data final inválida!')
  else if MaskEdit3.Text = '  /  /    ' then
    MaskEdit3.Text:=DateToStr(DM.Configuracao1.Data);

  DataFIM := ' AND P.PDV_DATA_HORA<"'+MesDia(StrToDate(MaskEdit3.Text)+1)+'" ';

  if CheckBox8.Checked=True then
    if not VerificaInteiroBranco(edtCodigoCLI.text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
      cCLI:=' AND (P.CLI_CODIGO='+edtCodigoCLI.Text+') ';

{  if CheckBox11.Checked then
    Ativo := ''
  else
    begin
      if CheckBox5.Checked then
        Ativo := ' AND (T2.PRD_SITUACAO = 1) '
      else
        Ativo := ' AND (T2.PRD_SITUACAO <> 1) ';
    end;
}
  if CheckBox1.Checked then
    if DBLookupComboBox2.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
      Centro:=' AND (P.CNC_CODIGO = '+IntToStr(DBLookupComboBox2.KeyValue)+') ';

  if CheckBox13.Checked then
    if DBLookupComboBox5.Text = '' then
      Raise Exception.Create('Vendedor inválido!')
    else
      cVEN:=' AND (P.FUN_CODIGO = '+IntToStr(DBLookupComboBox5.KeyValue)+') ';

  if CheckBox3.Checked then
  begin
    if not VerificaInteiroBranco(Edit3.text) then
      begin
        Edit3.SetFocus;
        Raise Exception.Create('Parâmetro "A" da Curva de Produtos inválido!');
      end;
    if not VerificaInteiroBranco(Edit5.text) then
      begin
        Edit5.SetFocus;
        Raise Exception.Create('Parâmetro "B" da Curva de Produtos inválido!');
      end;
    if not VerificaInteiroBranco(Edit6.text) then
      begin
        Edit6.SetFocus;
        Raise Exception.Create('Parâmetro "C" da Curva de Produtos inválido!');
      end;
    if not VerificaInteiroBranco(Edit7.text) then
      begin
        Edit7.SetFocus;
        Raise Exception.Create('Parâmetro "D" da Curva de Produtos inválido!');
      end;
     RecNo := StrToInt(Edit3.Text)+StrToInt(Edit5.Text)+StrToInt(Edit6.Text)+StrToInt(Edit7.Text);
  end;

  case ComboBox1.itemIndex of
    0: Ordem:=' ORDER BY QTD_ITEM DESC ';
    1: Ordem:=' ORDER BY TOTAL_VENDA DESC ';
    2: Ordem:=' ORDER BY C.CLI_CODIGO ';
  end;

  // Relatório de Cliente
  if Tag = 0 then
  begin
    Application.CreateForm(Trpt_CurvaAbcCliente,rpt_CurvaAbcCliente);
    rpt_CurvaAbcCliente.Cliente1.Close;
    if RecNo = 0 then

      rpt_CurvaAbcCliente.Cliente1.SQL.Text:='SELECT P.CLI_CODIGO, SUM(I.IPV_PRECO_DESC*(I.IPV_QUANTIDADE-I.IPV_BONIFICACAO)) AS TOTAL_VENDA, '+
           ' COUNT(DISTINCT I.PDV_CODIGO) AS QTD_PEDIDO, '+
           ' SUM(I.IPV_PRECO_DESC*(I.IPV_QUANTIDADE-I.IPV_BONIFICACAO))/COUNT(DISTINCT I.PDV_CODIGO) AS MED_VLR_PEDIDO, '+
           ' COUNT(I.PRD_CODIGO) AS QTD_ITEM, COUNT(I.PRD_CODIGO)/COUNT(DISTINCT I.PDV_CODIGO) AS MED_ITEM_PEDIDO, '+
           ' SUM(I.IPV_QUANTIDADE) AS QTD_QUANTIDADE, SUM(I.IPV_QUANTIDADE)/COUNT(DISTINCT I.PDV_CODIGO) AS MED_QUANTIDADE_PEDIDO, '+
           ' SUM(I.IPV_QUANTIDADE)/COUNT(I.PRD_CODIGO) AS MED_QUANTIDADE_ITEM, '+
           ' SUM(I.IPV_PRECO_DESC*(I.IPV_QUANTIDADE-I.IPV_BONIFICACAO))/SUM(I.IPV_QUANTIDADE) AS MED_VLR_QUANTIDADE, '+
           ' SUM(I.IPV_PRECO_DESC*(I.IPV_QUANTIDADE-I.IPV_BONIFICACAO))/COUNT(I.PRD_CODIGO) AS MED_VLR_ITEM '+
           ' FROM ITEM_DE_PEDIDO_DE_VENDA I, PEDIDO_DE_VENDA P, CLIENTE C '+
           ' WHERE I.PDV_CODIGO=P.PDV_CODIGO AND P.CLI_CODIGO=C.CLI_CODIGO AND P.PDV_SITUACAO<>6 AND P.PDV_SITUACAO<>8 '+
           DataINI+DataFIM+Centro+Ativo+cCLI+cVEN+' GROUP BY P.CLI_CODIGO '+Ordem
    else
      rpt_CurvaAbcCliente.Cliente1.SQL.Text:='SELECT TOP '+IntToStr(RecNo)+' P.CLI_CODIGO, SUM(I.IPV_PRECO_DESC*(I.IPV_QUANTIDADE-I.IPV_BONIFICACAO)) AS TOTAL_VENDA, '+
           ' COUNT(DISTINCT I.PDV_CODIGO) AS QTD_PEDIDO, '+
           ' SUM(I.IPV_PRECO_DESC*(I.IPV_QUANTIDADE-1.IPV_BONIFICACAO))/COUNT(DISTINCT I.PDV_CODIGO) AS MED_VLR_PEDIDO, '+
           ' COUNT(I.PRD_CODIGO) AS QTD_ITEM, COUNT(I.PRD_CODIGO)/COUNT(DISTINCT I.PDV_CODIGO) AS MED_ITEM_PEDIDO, '+
           ' SUM(I.IPV_QUANTIDADE) AS QTD_QUANTIDADE, SUM(I.IPV_QUANTIDADE)/COUNT(DISTINCT I.PDV_CODIGO) AS MED_QUANTIDADE_PEDIDO, '+
           ' SUM(I.IPV_QUANTIDADE)/COUNT(I.PRD_CODIGO) AS MED_QUANTIDADE_ITEM, '+
           ' SUM(I.IPV_PRECO_DESC*(I.IPV_QUANTIDADE-1.IPV_BONIFICACAO))/SUM(I.IPV_QUANTIDADE) AS MED_VLR_QUANTIDADE, '+
           ' SUM(I.IPV_PRECO_DESC*(I.IPV_QUANTIDADE-1.IPV_BONIFICACAO))/COUNT(I.PRD_CODIGO) AS MED_VLR_ITEM '+
           ' FROM ITEM_DE_PEDIDO_DE_VENDA I, PEDIDO_DE_VENDA P, CLIENTE C '+
           ' WHERE I.PDV_CODIGO=P.PDV_CODIGO AND P.CLI_CODIGO=C.CLI_CODIGO AND P.PDV_SITUACAO<>6 AND P.PDV_SITUACAO<>8 '+
           DataINI+DataFIM+Centro+Ativo+cCLI+cVEN+' GROUP BY P.CLI_CODIGO '+Ordem;
    rpt_CurvaAbcCliente.Cliente1.Open;
    if rpt_CurvaAbcCliente.Cliente1.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    rpt_CurvaAbcCliente.report.Preview;
    rpt_CurvaAbcCliente.Close;
  end
end;

procedure TfMxSelClienteCurva.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelClienteCurva.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=23;
    fCadCli.CentroCusto2.open;
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Entidade:=fCadCli.Cliente1;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxSelClienteCurva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Centro_de_Custo.Close;
  Action := caFree;
end;

procedure TfMxSelClienteCurva.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  CheckBox8.SetFocus;
end;

procedure TfMxSelClienteCurva.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    Centro_de_Custo.Open;
    DBLookupComboBox2.Enabled:=True;
    DBLookupComboBox2.Color:=clWindow;
    DBLookupComboBox2.KeyValue:=DM.Configuracao1.CodigoCNC;
    DBLookupComboBox2.SetFocus;
  end
  else
  begin
    DBLookupComboBox2.Enabled:=False;
    DBLookupComboBox2.Color:=AlteraCorComponentes;
    DBLookupComboBox2.KeyValue:=-1;
  end;
end;

procedure TfMxSelClienteCurva.CheckBox8Click(Sender: TObject);
begin
  if CheckBox8.Checked then
  Begin
    edtCodigoCLI.Color:=clWindow;
    edtCodigoCLI.Enabled:=True;
    edtCodigoCLI.SetFocus;
  end
  else
  Begin
    edtCodigoCLI.Color:=AlteraCorComponentes;
    edtCodigoCLI.Enabled:=False;
    edtCodigoCLI.Clear;
  end;
end;

procedure TfMxSelClienteCurva.CheckBox11Click(Sender: TObject);
begin
{  if CheckBox11.Checked then
    begin
      CheckBox5.Checked := False;
      CheckBox5.Enabled := False;
    end
  else
    begin
      CheckBox5.Checked := False;
      CheckBox5.Enabled := True;
    end;}
end;

procedure TfMxSelClienteCurva.CheckBox13Click(Sender: TObject);
begin
  if CheckBox13.Checked then
  begin
    Funcionario1.Open;
    DBLookupComboBox5.Enabled:=True;
    DBLookupComboBox5.Color:=clWindow;
    DBLookupComboBox5.SetFocus;
  end
  else
  begin
    DBLookupComboBox5.Enabled:=False;
    DBLookupComboBox5.Color:=AlteraCorComponentes;
    DBLookupComboBox5.KeyValue:=-1;
  end;
end;

procedure TfMxSelClienteCurva.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  Begin
    Edit3.Color:=clWindow;
    Edit3.Enabled:=True;
    Edit3.SetFocus;
    Edit5.Color:=clWindow;
    Edit5.Enabled:=True;
    Edit5.SetFocus;
    Edit6.Color:=clWindow;
    Edit6.Enabled:=True;
    Edit6.SetFocus;
    Edit7.Color:=clWindow;
    Edit7.Enabled:=True;
    Edit7.SetFocus;
    Edit3.SetFocus;
  end
  else
  Begin
    Edit3.Color:=AlteraCorComponentes;
    Edit3.Enabled:=False;
    Edit3.Clear;
    Edit5.Color:=AlteraCorComponentes;
    Edit5.Enabled:=False;
    Edit5.Clear;
    Edit6.Color:=AlteraCorComponentes;
    Edit6.Enabled:=False;
    Edit6.Clear;
    Edit7.Color:=AlteraCorComponentes;
    Edit7.Enabled:=False;
    Edit7.Clear;
  end;
end;

end.
