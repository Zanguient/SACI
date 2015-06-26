unit MxSelComparativoForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Menus, Variants, Funcionario;

type
  TfMxSelComparativoForn = class(TForm)
    Panel1: TPanel;
    edtCodigoFOR: TEdit;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Grupo: TQuery;
    DSGrupo: TDataSource;
    dblCodigoGRP: TDBLookupComboBox;
    dblCodigoCNC: TDBLookupComboBox;
    Centro_de_Custo: TQuery;
    DSCentro_de_Custo: TDataSource;
    ckbCodigoCNC: TCheckBox;
    ckbCodigoGRP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    ckbCodigoSGP: TCheckBox;
    ckbCodigoFOR: TCheckBox;
    ckbTodosProdutos: TCheckBox;
    ckbCodigoVEN: TCheckBox;
    Funcionario1: TFuncionario;
    DSVendedor: TDataSource;
    dblCodigoVEN: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    cmbOrdem: TComboBox;
    Label3: TLabel;
    ckbProdutosDesativados: TCheckBox;
    ckbAgrupoGrupoSubGrupo: TCheckBox;
    Memo1: TMemo;
    sbAdiciona: TSpeedButton;
    sbApagar: TSpeedButton;
    RadioGroup1: TRadioGroup;
    Bevel2: TBevel;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbTodosProdutosClick(Sender: TObject);
    procedure ckbCodigoVENClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbAdicionaClick(Sender: TObject);
    procedure sbApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelComparativoForn: TfMxSelComparativoForn;
  Centro:string;

implementation

uses
  funcoes, UComparativoForn, MxSCotaFor, UDM;

{$R *.DFM}


procedure TfMxSelComparativoForn.SB_ConfirmarClick(Sender: TObject);
var
  DataINI,DataFIM,Ativo,cFOR,cGRP,cSGP,cVEN,sOrdem:string;
begin
  Centro:='';
  cGRP:='';
  cSGP:='';
  cVEN:='';
  Ativo:='';

  if not VerificaData(mskDataINI.Text) then
    Raise Exception.Create('Data inicial inválida!')
  else if mskDataINI.Text = '  /  /    ' then
    mskDataINI.Text:='01/01/1900';

  DataINI := ' AND T1.PDV_DATA_HORA>="'+MesDia(mskDataINI.Text)+'" ';

  if not VerificaData(mskDataFIM.Text) then
    Raise Exception.Create('Data final inválida!')
  else if mskDataFIM.Text = '  /  /    ' then
    mskDataFIM.Text:=DateToStr(DM.Configuracao1.Data);

  DataFIM := ' AND T1.PDV_DATA_HORA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';

  if ckbTodosProdutos.Checked then
    Ativo := ''
  else
    begin
      if ckbProdutosDesativados.Checked then
        Ativo := ' AND (T3.PRD_SITUACAO = 1) '
      else
        Ativo := ' AND (T3.PRD_SITUACAO <> 1) ';
    end;

  if ckbCodigoFOR.Checked=True then
    if not VerificaInteiroBranco(edtCodigoFOR.text) then
      Raise Exception.Create('Código do Fornecedor inválido!')
    else
      cFOR:=' AND (T3.FOR_CODIGO IN ('+Memo1.Text+')) ';
//      cFOR:=' AND (T3.FOR_CODIGO = '+edtCodigoFOR.Text+') ';

  if ckbCodigoGRP.Checked then
    if dblCodigoGRP.Text = '' then
      Raise Exception.Create('Grupo inválido!')
    else
       cGRP := ' AND (T3.GRP_CODIGO ='+IntToStr(dblCodigoGRP.KeyValue)+') ';

  if ckbCodigoSGP.Checked then
    if dblCodigoSGP.Text = '' then
      Raise Exception.Create('SubGrupo inválido!')
    else
      cSGP := ' AND (T3.SGP_CODIGO ='+IntToStr(dblCodigoSGP.KeyValue)+') ';

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
      Centro:=' AND (T1.CNC_CODIGO = '+IntToStr(dblCodigoCNC.KeyValue)+') ';

  if ckbCodigoVEN.Checked then
    if dblCodigoVEN.Text = '' then
      Raise Exception.Create('Vendedor inválido!')
    else
      cVEN:=' AND (T2.FUN_CODIGO = '+IntToStr(dblCodigoVEN.KeyValue)+') ';

  case cmbOrdem.itemIndex of
    0: sOrdem := sOrdem + ' T3.FOR_CODIGO,T4.GRP_DESCRICAO  ';
    1: sOrdem := sOrdem + ' T3.FOR_CODIGO,FATUR  DESC';
  end;

  sOrdem := ' ORDER BY '+sOrdem;

  // Relatório Curva ABC de Produto
  if Tag = 0 then
  begin
    Application.CreateForm(Trpt_ComparativoForn,rpt_ComparativoForn);
    with rpt_ComparativoForn do
    Begin
      Tag := 0;
      //
      Pedido_de_Venda1.Close;
      if not ckbAgrupoGrupoSubGrupo.Checked then
      Begin
        Pedido_de_Venda1.SQL.Text:='SELECT T3.FOR_CODIGO, T5.FOR_RZ_SOCIAL, T3.GRP_CODIGO, T4.GRP_DESCRICAO,'+
          ' SUM(T2.IPV_PRECO_DESC*IPV_QUANTIDADE) AS FATUR '+
          ' FROM PEDIDO_DE_VENDA T1, ITEM_DE_PEDIDO_DE_VENDA T2, PRODUTO T3, GRUPO T4, FORNECEDOR T5 '+
          ' WHERE (T3.PRD_CODIGO<>-1) AND (T1.PDV_SITUACAO=4) '+
          DataINI+DataFIM+Centro+Ativo+cGRP+cSGP+cFOR+cVEN+
          ' AND (T1.PDV_CODIGO=T2.PDV_CODIGO)'+
          ' AND (T1.CNC_CODIGO=T2.CNC_CODIGO)'+
          ' AND (T2.PRD_CODIGO = T3.PRD_CODIGO)'+
          ' AND (T3.GRP_CODIGO=T4.GRP_CODIGO)'+
          ' AND (T3.FOR_CODIGO=T5.FOR_CODIGO)'+
          ' GROUP BY T3.FOR_CODIGO, T5.FOR_RZ_SOCIAL, T3.GRP_CODIGO, T4.GRP_DESCRICAO ';
        //
        Pedido_de_Venda2.Close;
        Pedido_de_Venda2.SQL.Text := 'SELECT SUM(FATUR) AS TOTAL FROM ('+Pedido_de_Venda1.SQL.Text+') AS TABELA';
        Pedido_de_Venda2.Open;
        //
        Pedido_de_Venda1.SQL.Add(sOrdem);
      end
      else
      Begin
 {       zrgGrupo.Enabled := True;
        zrbRodapeGrupo.Enabled := True;
        //
        ZRDBText1.DataField := 'SGP_CODIGO';
        zrlDescSubGrupo.Enabled := False;
        zrlSubGrupo.Enabled := False;
        zrbRodapeGrupo.Height := 0;
 }       Pedido_de_Venda1.SQL.Text:='SELECT T2.GRP_CODIGO,'+
          ' T2.SGP_CODIGO,SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) AS SOMA_VALOR, '+
          ' SUM(T1.IPV_QUANTIDADE) AS SOMA_QTD '+
          ' FROM ITEM_DE_PEDIDO_DE_VENDA T1, PRODUTO T2, PEDIDO_DE_VENDA T3 '+
          ' WHERE (T1.PRD_CODIGO<>-1) AND (T3.PDV_SITUACAO=4) '+
          DataINI+DataFIM+Centro+Ativo+cGRP+cSGP+cFOR+cVEN+
          ' AND (T1.PRD_CODIGO=T2.PRD_CODIGO) '+
          ' AND T1.CNC_CODIGO=T3.CNC_CODIGO AND T1.PDV_CODIGO=T3.PDV_CODIGO '+

          ' GROUP BY T2.GRP_CODIGO,T2.SGP_CODIGO '+
          sOrdem;
      end;
      //
      Pedido_de_Venda1.Open;
      if Pedido_de_Venda1.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.Preview;
      Close;
    end;
  end
end;

procedure TfMxSelComparativoForn.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelComparativoForn.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.tag:=36;
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxSelComparativoForn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo.Close;
  SubGrupo1.Close;
  Centro_de_Custo.Close;
  Action := caFree;
end;

procedure TfMxSelComparativoForn.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  begin
    Centro_de_Custo.Open;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  begin
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelComparativoForn.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    Grupo.Open;
    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    ckbCodigoSGP.Enabled:=True;
    dblCodigoGRP.KeyValue:=Grupo.FieldByName('GRP_CODIGO').asInteger;
    dblCodigoGRP.SetFocus;
  end
  else
  Begin
    Grupo.Close;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    ckbCodigoSGP.Checked:=False;
    ckbCodigoSGP.Enabled:=False;
    dblCodigoGRP.KeyValue:=0;
  end;
end;

procedure TfMxSelComparativoForn.dblCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    if dblCodigoGRP.KeyValue > 0 then
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
    end;
  end;
end;

procedure TfMxSelComparativoForn.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if not (dblCodigoGRP.KeyValue > 0)then
    Begin
      ShowMessage('Selecione primeiro o grupo!');
      ckbCodigoGRP.Checked:=False;
      exit;
    end
    else
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
      dblCodigoSGP.Enabled:=True;
      dblCodigoSGP.color:=clWindow;
      dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
      dblCodigoSGP.SetFocus;
    end;
  end
  else
  Begin
      dblCodigoSGP.Enabled:=False;
      dblCodigoSGP.color:=AlteraCorComponentes;
      dblCodigoSGP.KeyValue:=0;
  end;
end;

procedure TfMxSelComparativoForn.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Color:=clWindow;
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.SetFocus;
    sbAdiciona.Enabled := True;
    sbApagar.Enabled := True;
  end
  else
  Begin
    edtCodigoFOR.Color:=AlteraCorComponentes;
    edtCodigoFOR.Enabled:=False;
    edtCodigoFOR.Clear;
    sbAdiciona.Enabled := False;
    Memo1.Clear;
    sbApagar.Enabled := False;
  end;
end;

procedure TfMxSelComparativoForn.ckbTodosProdutosClick(Sender: TObject);
begin
  if ckbTodosProdutos.Checked then
    begin
      ckbProdutosDesativados.Checked := False;
      ckbProdutosDesativados.Enabled := False;
    end
  else
    begin
      ckbProdutosDesativados.Checked := False;
      ckbProdutosDesativados.Enabled := True;
    end;
end;

procedure TfMxSelComparativoForn.ckbCodigoVENClick(Sender: TObject);
begin
  if ckbCodigoVEN.Checked then
  begin
    Funcionario1.Open;
    dblCodigoVEN.Enabled:=True;
    dblCodigoVEN.Color:=clWindow;
    dblCodigoVEN.SetFocus;
  end
  else
  begin
    dblCodigoVEN.Enabled:=False;
    dblCodigoVEN.Color:=AlteraCorComponentes;
    dblCodigoVEN.KeyValue:=-1;
  end;
end;

procedure TfMxSelComparativoForn.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbOrdem.ItemIndex := 0;
end;

procedure TfMxSelComparativoForn.sbAdicionaClick(Sender: TObject);
begin
  if Memo1.Text = '' then
    Memo1.Text := edtCodigoFOR.Text
  else
    Memo1.Text := Memo1.Text + ',' + edtCodigoFOR.Text;
end;

procedure TfMxSelComparativoForn.sbApagarClick(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
