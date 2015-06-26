unit MxSelProdutoCurva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Menus, Variants, CategProd,
  Funcionario, Classificacao_fiscal;

type
  TfMxSelProdutoCurva = class(TForm)
    Panel1: TPanel;
    edtCodigoPRD: TEdit;
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
    ckbCodigoPRD: TCheckBox;
    ckbReferencia: TCheckBox;
    edtReferencia: TEdit;
    ckbTodosProdutos: TCheckBox;
    ckbCategoria: TCheckBox;
    dblCategoria: TDBLookupComboBox;
    CategProd1: TCategProd;
    DSCategor: TDataSource;
    ckbCodigoVEN: TCheckBox;
    Funcionario1: TFuncionario;
    DSVendedor: TDataSource;
    dblCodigoVEN: TDBLookupComboBox;
    ckbClassificacaoFiscal: TCheckBox;
    dblClassificacaoFiscal: TDBLookupComboBox;
    dsClassific: TDataSource;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    edtQtdA: TEdit;
    edtQtdB: TEdit;
    edtQtdC: TEdit;
    edtQtdD: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    ckbQuantidadeProdutos: TCheckBox;
    cmbOrdem: TComboBox;
    Label3: TLabel;
    ckbProdutosDesativados: TCheckBox;
    ckbAgrupoGrupoSubGrupo: TCheckBox;
    ckbSomenteProdutos: TCheckBox;
    ckbSomenteServicos: TCheckBox;
    Bevel2: TBevel;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure ckbTodosProdutosClick(Sender: TObject);
    procedure ckbCategoriaClick(Sender: TObject);
    procedure ckbCodigoVENClick(Sender: TObject);
    procedure ckbClassificacaoFiscalClick(Sender: TObject);
    procedure ckbQuantidadeProdutosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelProdutoCurva: TfMxSelProdutoCurva;
  Centro:string;

implementation

uses
  UProduto, funcoes, UCurvaAbcProduto, MxSPediProd, MxSCotaFor, UDM ,
  MxSPediProdMotCal;

{$R *.DFM}


procedure TfMxSelProdutoCurva.SB_ConfirmarClick(Sender: TObject);
var
  DataINI,DataFIM,cCLF,cCTP,Ativo,cPRD,cFOR,cGRP,cSGP,cRef,cVEN,sSomentePRDSER,sOrdem:string;
  RecNo:Integer;
begin
  Centro:='';
  cPRD:='';
  cCTP:='';
  cCLF:='';
  cGRP:='';
  cSGP:='';
  cRef:='';
  cVEN:='';
  Ativo:='';
  sSomentePRDSER:='';
  RecNo:=0;

  if not VerificaData(mskDataINI.Text) then
    Raise Exception.Create('Data inicial inválida!')
  else if mskDataINI.Text = '  /  /    ' then
    mskDataINI.Text:='01/01/1900';

  DataINI := ' AND T3.PDV_DATA_HORA>="'+MesDia(mskDataINI.Text)+'" ';

  if not VerificaData(mskDataFIM.Text) then
    Raise Exception.Create('Data final inválida!')
  else if mskDataFIM.Text = '  /  /    ' then
    mskDataFIM.Text:=DateToStr(DM.Configuracao1.Data);

  DataFIM := ' AND T3.PDV_DATA_HORA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';

  if ckbCodigoPRD.Checked=True then
    if not VerificaInteiroBranco(edtCodigoPRD.text) then
      Raise Exception.Create('Código do produto inválido!')
    else
      cPRD:=' AND (T2.PRD_CODIGO='+edtCodigoPRD.Text+') ';

  if ckbTodosProdutos.Checked then
    Ativo := ''
  else
    begin
      if ckbProdutosDesativados.Checked then
        Ativo := ' AND (T2.PRD_SITUACAO = 1) '
      else
        Ativo := ' AND (T2.PRD_SITUACAO <> 1) ';
    end;

  if ckbReferencia.Checked then
    cRef := ' AND (T2.PRD_REFERENCIA ="'+edtReferencia.Text+'") ';

  if ckbSomenteProdutos.Checked then
    sSomentePRDSER := ' AND (T2.PRD_SERVICO=0 OR T2.PRD_SERVICO IS NULL) '
  else if ckbSomenteServicos.Checked then
    sSomentePRDSER := ' AND (T2.PRD_SERVICO=1) ';

  if ckbCodigoFOR.Checked=True then
    if not VerificaInteiroBranco(edtCodigoFOR.text) then
      Raise Exception.Create('Código do Fornecedor inválido!')
    else
      cFOR:=' AND (T2.FOR_CODIGO = '+edtCodigoFOR.Text+') ';

  if ckbCodigoGRP.Checked then
    if dblCodigoGRP.Text = '' then
      Raise Exception.Create('Grupo inválido!')
    else
       cGRP := ' AND (T2.GRP_CODIGO ='+IntToStr(dblCodigoGRP.KeyValue)+') ';

  if ckbCodigoSGP.Checked then
    if dblCodigoSGP.Text = '' then
      Raise Exception.Create('SubGrupo inválido!')
    else
      cSGP := ' AND (T2.SGP_CODIGO ='+IntToStr(dblCodigoSGP.KeyValue)+') ';

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
      Centro:=' AND (T3.CNC_CODIGO = '+IntToStr(dblCodigoCNC.KeyValue)+') ';

  if ckbCategoria.Checked then
    if dblCategoria.Text = '' then
      Raise Exception.Create('Categoria inválida!')
    else
      cCTP:=' AND (T2.CTP_CODIGO = '+IntToStr(dblCategoria.KeyValue)+') ';

  if ckbClassificacaoFiscal.Checked then
    if dblClassificacaoFiscal.Text = '' then
      Raise Exception.Create('Classificacao Fiscal inválida!')
    else
      cCLF:=' AND (T2.CLF_CODIGO = '+IntToStr(dblClassificacaoFiscal.KeyValue)+') ';

  if ckbCodigoVEN.Checked then
    if dblCodigoVEN.Text = '' then
      Raise Exception.Create('Vendedor inválido!')
    else
      cVEN:=' AND (T1.FUN_CODIGO = '+IntToStr(dblCodigoVEN.KeyValue)+') ';

  if ckbQuantidadeProdutos.Checked then
  begin
    if not VerificaInteiroBranco(edtQtdA.text) then
    begin
      edtQtdA.SetFocus;
      Raise Exception.Create('Parâmetro "A" da Curva de Produtos inválido!');
    end;
    if not VerificaInteiroBranco(edtQtdB.text) then
    begin
      edtQtdB.SetFocus;
      Raise Exception.Create('Parâmetro "B" da Curva de Produtos inválido!');
    end;
    if not VerificaInteiroBranco(edtQtdC.text) then
    begin
      edtQtdC.SetFocus;
      Raise Exception.Create('Parâmetro "C" da Curva de Produtos inválido!');
    end;
    if not VerificaInteiroBranco(edtQtdD.text) then
    begin
      edtQtdD.SetFocus;
      Raise Exception.Create('Parâmetro "D" da Curva de Produtos inválido!');
    end;
    RecNo := StrToInt(edtQtdA.Text)+StrToInt(edtQtdB.Text)+StrToInt(edtQtdC.Text)+StrToInt(edtQtdD.Text);
  end;

  case cmbOrdem.itemIndex of
    0: sOrdem := sOrdem + ' SOMA_QTD DESC  ';
    1: sOrdem := sOrdem + ' SOMA_VALOR DESC  ';
    2: sOrdem := sOrdem + ' T2.PRD_CODIGO ASC ';
  end;

  sOrdem := ' ORDER BY '+sOrdem;

  // Relatório Curva ABC de Produto
  if Tag = 0 then
  begin
    Application.CreateForm(Trpt_CurvaAbcProduto,rpt_CurvaAbcProduto);
    with rpt_CurvaAbcProduto do
    Begin
      Tag := 0;
      if ckbAgrupoGrupoSubGrupo.Checked then
      Begin
        zrgGrupo.Enabled := True;
        zrbRodapeGrupo.Enabled := True;
      end;
      Produto1.Close;
      if not ckbAgrupoGrupoSubGrupo.Checked then
      Begin
        if RecNo = 0 then
          Produto1.SQL.Text:='SELECT T2.PRD_CODIGO,T2.GRP_CODIGO,'+
            ' T2.SGP_CODIGO,SUM(T1.IPV_QUANTIDADE*ROUND(T1.IPV_PRECO_DESC,2)) AS SOMA_VALOR, '+
            ' SUM(T1.IPV_QUANTIDADE) AS SOMA_QTD '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA T1, PRODUTO T2, PEDIDO_DE_VENDA T3 '+
            ' WHERE (T1.PRD_CODIGO<>-1) AND (T3.PDV_SITUACAO=4) '+
            DataINI+DataFIM+Centro+Ativo+cRef+cPRD+cCTP+cCLF+cGRP+cSGP+cFOR+cVEN+
            ' AND (T1.PRD_CODIGO=T2.PRD_CODIGO) '+
            ' AND T1.CNC_CODIGO=T3.CNC_CODIGO AND T1.PDV_CODIGO=T3.PDV_CODIGO '+
            ' GROUP BY T2.PRD_CODIGO,T2.GRP_CODIGO,T2.SGP_CODIGO '+
            sOrdem
        else
          Produto1.SQL.Text:='SELECT TOP '+IntToStr(RecNo)+
            ' T2.PRD_CODIGO,T2.GRP_CODIGO,T2.SGP_CODIGO'+
            ',SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) AS SOMA_VALOR'+
            ',SUM(T1.IPV_QUANTIDADE) AS SOMA_QTD '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA T1, PRODUTO T2, PEDIDO_DE_VENDA T3 '+
            ' WHERE (T1.PRD_CODIGO <> -1) AND (T3.PDV_SITUACAO = 4) '+
            DataINI+DataFIM+Centro+Ativo+cRef+cPRD+cCTP+cCLF+cGRP+cSGP+cFOR+cVEN+
            ' AND (T1.PRD_CODIGO=T2.PRD_CODIGO) '+
            ' AND T1.CNC_CODIGO=T3.CNC_CODIGO AND T1.PDV_CODIGO=T3.PDV_CODIGO '+
            ' GROUP BY T2.PRD_CODIGO,T2.GRP_CODIGO,T2.SGP_CODIGO '+
            sOrdem;
      end
      else
      Begin
        ZRDBText1.DataField := 'SGP_CODIGO';
        zrlDescSubGrupo.Enabled := False;
        zrlSubGrupo.Enabled := False;
        zrbRodapeGrupo.Height := 0;
        if RecNo = 0 then
          Produto1.SQL.Text:='SELECT T2.GRP_CODIGO,'+
            ' T2.SGP_CODIGO,SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) AS SOMA_VALOR, '+
            ' SUM(T1.IPV_QUANTIDADE) AS SOMA_QTD '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA T1, PRODUTO T2, PEDIDO_DE_VENDA T3 '+
            ' WHERE (T1.PRD_CODIGO<>-1) AND (T3.PDV_SITUACAO=4) '+
            DataINI+DataFIM+Centro+Ativo+cRef+cPRD+cCTP+cCLF+cGRP+cSGP+cFOR+cVEN+
            ' AND (T1.PRD_CODIGO=T2.PRD_CODIGO) '+
            ' AND T1.CNC_CODIGO=T3.CNC_CODIGO AND T1.PDV_CODIGO=T3.PDV_CODIGO '+
            ' GROUP BY T2.GRP_CODIGO,T2.SGP_CODIGO '+
            sOrdem
        else
          Produto1.SQL.Text:='SELECT TOP '+IntToStr(RecNo)+
            ' T2.GRP_CODIGO,T2.SGP_CODIGO'+
            ',SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*ROUND(T1.IPV_PRECO_DESC,2)) AS SOMA_VALOR'+
            ',SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)) AS SOMA_QTD '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA T1, PRODUTO T2, PEDIDO_DE_VENDA T3 '+
            ' WHERE (T1.PRD_CODIGO <> -1) AND (T3.PDV_SITUACAO = 4) '+
            DataINI+DataFIM+Centro+Ativo+cRef+cPRD+cCTP+cCLF+cGRP+cSGP+cFOR+cVEN+
            ' AND (T1.PRD_CODIGO=T2.PRD_CODIGO) '+
            ' AND T1.CNC_CODIGO=T3.CNC_CODIGO AND T1.PDV_CODIGO=T3.PDV_CODIGO '+
            ' GROUP BY T2.GRP_CODIGO,T2.SGP_CODIGO '+
            sOrdem;
      end;
      Produto1.Open;
      if Produto1.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.Preview;
      Close;
    end;
  end
end;

procedure TfMxSelProdutoCurva.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelProdutoCurva.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=42;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=42;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxSelProdutoCurva.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.tag:=18;
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxSelProdutoCurva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo.Close;
  SubGrupo1.Close;
  Centro_de_Custo.Close;
  Action := caFree;
end;

procedure TfMxSelProdutoCurva.ckbCodigoCNCClick(Sender: TObject);
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

procedure TfMxSelProdutoCurva.ckbCodigoGRPClick(Sender: TObject);
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

procedure TfMxSelProdutoCurva.dblCodigoGRPClick(Sender: TObject);
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

procedure TfMxSelProdutoCurva.ckbCodigoSGPClick(Sender: TObject);
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

procedure TfMxSelProdutoCurva.ckbCodigoFORClick(Sender: TObject);
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
    edtCodigoFOR.Enabled:=False;
    edtCodigoFOR.Clear;
  end;
end;

procedure TfMxSelProdutoCurva.ckbCodigoPRDClick(Sender: TObject);
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
    edtCodigoPRD.Enabled:=False;
    edtCodigoPRD.Clear;
  end;
end;

procedure TfMxSelProdutoCurva.ckbReferenciaClick(Sender: TObject);
begin
  if ckbReferencia.Checked then
  Begin
    edtReferencia.Enabled:=True;
    edtReferencia.Color:=clWindow;
    edtReferencia.SetFocus;
  end
  else
  Begin
    edtReferencia.Enabled:=False;
    edtReferencia.Color:=AlteraCorComponentes;
    edtReferencia.Clear;
  end;
end;

procedure TfMxSelProdutoCurva.ckbTodosProdutosClick(Sender: TObject);
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

procedure TfMxSelProdutoCurva.ckbCategoriaClick(Sender: TObject);
begin
  if ckbCategoria.Checked then
  begin
    CategProd1.Open;
    dblCategoria.Enabled:=True;
    dblCategoria.Color:=clWindow;
    dblCategoria.KeyValue:=CategProd1.FieldByName('CTP_CODIGO').asInteger;
    dblCategoria.SetFocus;
  end
  else
  begin
    dblCategoria.Enabled:=False;
    dblCategoria.Color:=AlteraCorComponentes;
    dblCategoria.KeyValue:=-1;
  end;
end;

procedure TfMxSelProdutoCurva.ckbCodigoVENClick(Sender: TObject);
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

procedure TfMxSelProdutoCurva.ckbClassificacaoFiscalClick(Sender: TObject);
begin
  if ckbClassificacaoFiscal.Checked then
  begin
    Classificacao_fiscal1.Open;
    dblClassificacaoFiscal.Enabled:=True;
    dblClassificacaoFiscal.Color:=clWindow;
    dblClassificacaoFiscal.KeyValue:=Classificacao_fiscal1.FieldByName('CLF_CODIGO').asInteger;
    dblClassificacaoFiscal.SetFocus;
  end
  else
  begin
    dblClassificacaoFiscal.Enabled:=False;
    dblClassificacaoFiscal.Color:=AlteraCorComponentes;
    dblClassificacaoFiscal.KeyValue:=-1;
  end;

end;

procedure TfMxSelProdutoCurva.ckbQuantidadeProdutosClick(Sender: TObject);
begin
  if ckbQuantidadeProdutos.Checked then
  Begin
    edtQtdA.Color:=clWindow;
    edtQtdA.Enabled:=True;
    edtQtdA.SetFocus;
    edtQtdB.Color:=clWindow;
    edtQtdB.Enabled:=True;
    edtQtdC.Color:=clWindow;
    edtQtdC.Enabled:=True;
    edtQtdD.Color:=clWindow;
    edtQtdD.Enabled:=True;
    edtQtdA.SetFocus;
  end
  else
  Begin
    edtQtdA.Color:=AlteraCorComponentes;
    edtQtdA.Enabled:=False;
    edtQtdA.Clear;
    edtQtdB.Color:=AlteraCorComponentes;
    edtQtdB.Enabled:=False;
    edtQtdB.Clear;
    edtQtdC.Color:=AlteraCorComponentes;
    edtQtdC.Enabled:=False;
    edtQtdC.Clear;
    edtQtdD.Color:=AlteraCorComponentes;
    edtQtdD.Enabled:=False;
    edtQtdD.Clear;
  end;
end;

procedure TfMxSelProdutoCurva.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbOrdem.ItemIndex := 0;
end;

end.
