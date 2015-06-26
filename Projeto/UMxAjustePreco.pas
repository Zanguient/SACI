unit UMxAjustePreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, Grids, DBGrids, SubGrupo;

type
  TfMxAjustePreco = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    DSGrupo1: TDataSource;
    DSSubGrupo1: TDataSource;
    Label3: TLabel;
    edtPercentual: TEdit;
    Label4: TLabel;
    dblSubGrupo: TDBLookupComboBox;
    dblGrupo: TDBLookupComboBox;
    edtCodigoFOR: TEdit;
    edtCodigoPRD: TEdit;
    ckbCodigoPRD: TCheckBox;
    ckbCodigoFOR: TCheckBox;
    ckbGrupo: TCheckBox;
    ckbSubGrupo: TCheckBox;
    labProduto: TLabel;
    labFornecedor: TLabel;
    Label1: TLabel;
    cmbCampoCalculado: TComboBox;
    Label2: TLabel;
    cmbCampoAlterado: TComboBox;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    Produto1: TProduto;
    Fornecedor1: TFornecedor;
    rdbPercentual: TRadioButton;
    rdbValorFixo: TRadioButton;
    edtValorFixo: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    cmbTipo: TComboBox;
    ckbDesativados: TCheckBox;
    ckbReferencia: TCheckBox;
    edtReferencia: TEdit;
    ckbEmLinha: TCheckBox;
    ckbForaDeLinha: TCheckBox;
    ckbDetalhe: TCheckBox;
    cmbDetalhe: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbGrupoClick(Sender: TObject);
    procedure ckbSubGrupoClick(Sender: TObject);
    procedure SubGrupo1BeforeOpen(DataSet: TDataSet);
    procedure dblGrupoClick(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure rdbPercentualClick(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure ckbEmLinhaClick(Sender: TObject);
    procedure ckbForaDeLinhaClick(Sender: TObject);
    procedure ckbDetalheClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxAjustePreco: TfMxAjustePreco;

implementation

uses
  UProduto, funcoes, uEstoque, MxSPediProd, MxSCotaFor, UDM, MxTabPreco,
  MxSPediProdMotCal, MxTabPrecoSubGrupo, SysConst;

{$R *.DFM}

procedure TfMxAjustePreco.bitConfirmarClick(Sender: TObject);
var
  cCampoAlterado, cCampoCalculado, cTipo, cPRD, cFOR, cGRP, cSGP, sDesativados,
    sReferencia, cDetalhe, sLinha,sFiltros:string;
begin
  cPRD := '';
  cFOR := '';
  cGRP := '';
  cSGP := '';
  cTipo:= '';
  sLinha:='';
  cDetalhe:='';
  sDesativados := '';
  sReferencia  := '';
  sFiltros:='';

  if rdbPercentual.Checked then
  Begin
    if not VerificaFloatBranco(edtPercentual.Text) then
      raise Exception.Create('Percentual inválido!');
    if StrToFloat(edtPercentual.Text) <= 0 then
      raise Exception.Create('Percentual inválido!');
    if cmbTipo.ItemIndex = 0 then
      cTipo:='-'
    else
      cTipo:='+';
  end
  else
    if not VerificaFloatBranco(edtValorFixo.Text) then
      raise exception.Create('Valor Fixo inválido!');


  if ckbCodigoPRD.Checked then
  begin
    if not VerificaInteiroBranco(edtCodigoPRD.text) then
      Raise Exception.Create('Código do produto inválido!')
    else
    Begin
      cPRD := ' AND PRD_CODIGO='+edtCodigoPRD.Text;
      sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;
  end;

  if ckbCodigoFOR.Checked then
  begin
    if not VerificaInteiroBranco(edtCodigoFOR.text) then
      Raise Exception.Create('Código do fornecedor inválido!')
    else
    Begin
      cFOR := ' AND FOR_CODIGO='+edtCodigoFOR.Text;
      sFiltros := sFiltros + '(FOR:'+edtCodigoFOR.Text+')';
    end;
  end;

  if ckbReferencia.Checked then
  Begin
    sReferencia := ' AND PRD_REFERENCIA LIKE "'+edtReferencia.Text+'" ';
    sFiltros := sFiltros + '(Ref='+edtReferencia.Text+')';
  end;

  if ckbDetalhe.Checked then
    if cmbDetalhe.ItemIndex < 0 then
      Raise Exception.Create('Detalhe inválido!')
    else
    Begin
      cDetalhe:= ' AND (PRD_DETALHE="'+Trim(cmbDetalhe.Items[cmbDetalhe.ItemIndex])+'") ';
      sFiltros := sFiltros + ' (Detalhe:'+Trim(cmbDetalhe.Items[cmbDetalhe.ItemIndex])+')';
    end;

  if ckbGrupo.Checked then
  Begin
    if dblGrupo.Text = '' then
      Raise Exception.Create('Código do Grupo inválido!')
    else
    Begin
      cGRP := ' AND GRP_CODIGO='+IntToStr(dblGrupo.KeyValue);
      sFiltros := sFiltros + '(GRP:'+IntToStr(dblGrupo.KeyValue)+')';
    end;
  end;

  if ckbSubGrupo.Checked then
  Begin
    if dblSubGrupo.Text = '' then
      Raise Exception.Create('Código do SubGrupo inválido!')
    else
    Begin
      cSGP := ' AND SGP_CODIGO='+IntToStr(dblSubGrupo.KeyValue);
      sFiltros := sFiltros + '(SGP:'+IntToStr(dblSubGrupo.KeyValue)+')';
    end;
  end;

  if (cPRD = '') and (cFOR = '') and (cGRP = '')  and (cSGP = '') then
  Begin
    if MessageDlg('Este processo irá alterar o preço de todos os Produtos.'+#13+
                   'Deseja Continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      raise Exception.Create('Ajuste Cancelado!');
  end
  else if MessageDlg('Este processo irá alterar os preços.'+#13+
                     'Deseja Continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    raise Exception.Create('Ajuste Cancelado!');

  if not ckbDesativados.Checked then
  Begin
    sDesativados := ' AND PRD_SITUACAO<>1 ';
  end
  else
    sFiltros := sFiltros + '(Tambem Desativados)';


  if ckbEmLinha.Checked then
  Begin
    sLinha := ' AND (PRD_FORA_DE_LINHA=0 OR PRD_FORA_DE_LINHA IS NULL)  ';
    sFiltros := sFiltros + '(Em Linha)';
  end
  else if ckbForaDeLinha.Checked then
  Begin
    sLinha := ' AND PRD_FORA_DE_LINHA=1  ';
    sFiltros := sFiltros + '(Fora Linha)';
  end;

  try
    // Menu Ajuste de Preço
    if tag = 0 then
    Begin
      case cmbCampoAlterado.ItemIndex of
        0: Begin
             cCampoAlterado := 'PRD_PRECO_COMPRA';
             sFiltros := sFiltros + '(ALT PR_COMPRA)';
           end;
        1: Begin
             cCampoAlterado := 'PRD_PRECO_VENDA';
             sFiltros := sFiltros + '(ALT PR_VENDA)';
           end;
        2: Begin
             cCampoAlterado := 'PRD_CUSTO';
             sFiltros := sFiltros + '(ALT PR_CUSTO)';
           end;
        3: Begin
             cCampoAlterado := 'PRD_PRECO_MEDIO';
             sFiltros := sFiltros + '(ALT PR_MINIMO)';
           end;
      end;

      case cmbCampoCalculado.ItemIndex of
        0: Begin
             cCampoCalculado := 'PRD_PRECO_COMPRA';
             sFiltros := sFiltros + '(CALC PR_COMPRA)';
           end;
        1: Begin
             cCampoCalculado := 'PRD_PRECO_VENDA';
             sFiltros := sFiltros + '(CALC PR_VENDA)';
           end;
        2: Begin
             cCampoCalculado := 'PRD_CUSTO';
             sFiltros := sFiltros + '(CALC PR_CUSTO)';
           end;
        3: Begin
             cCampoCalculado := 'PRD_PRECO_MEDIO';
             sFiltros := sFiltros + '(CALC PR_MINIMO)';
           end;
      end;

      if rdbPercentual.Checked then
        sFiltros := sFiltros + '('+cmbTipo.Text+' de '+edtPercentual.Text+' %)'
      else
        sFiltros := sFiltros + '(VALOR FIXO: R$ '+edtValorFixo.Text+')';

      if rdbPercentual.Checked then
        ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
          cCampoAlterado+'=ROUND('+cCampoCalculado+cTipo+'('+cCampoCalculado+'*'+
          VirgPonto(edtPercentual.Text)+'/100),2) '+
          ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ' WHERE PRD_CODIGO<>-10 '+cPRD+cFOR+cGRP+cSGP+sDesativados+sReferencia+cDetalhe+sLinha)
      else
        ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
          cCampoAlterado+'=ROUND('+VirgPonto(edtValorFixo.Text)+',2) '+
          ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ' WHERE PRD_CODIGO<>-10 '+cPRD+cFOR+cGRP+cSGP+sDesativados+sReferencia+cDetalhe+sLinha);

      DM.Usuario1.GeraLog(3550, DM.Configuracao1.CodigoCNC, 0, 'TABELA PRODUTOS '+sFiltros);
    end
    //Alterar Preço Tabela de Preços
    else if tag = 1 then
    Begin
      if rdbPercentual.Checked then
        sFiltros := sFiltros + '('+cmbTipo.Text+' de '+edtPercentual.Text+' %)'
      else
        sFiltros := sFiltros + '(VALOR FIXO: R$ '+edtValorFixo.Text+')';

      if rdbPercentual.Checked then
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TABELA_DE_PRECO SET '+
          ' ITP_PRECO=ROUND(ITP_PRECO'+cTipo+'(ITP_PRECO*'+VirgPonto(edtPercentual.Text)+'/100),2) '+
          ',ITP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ' WHERE TBP_CODIGO='+IntToStr(fMxTabPreco.Entidade.CodigoTBP)+
          ' AND CNC_CODIGO='+IntToStr(fMxTabPreco.Entidade.CodigoCNC)+
          ' AND PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO WHERE PRD_CODIGO<>-10 '+
          cPRD+cFOR+cGRP+cSGP+sDesativados+sReferencia+cDetalhe+sLinha+')')
      else
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TABELA_DE_PRECO SET '+
          ' ITP_PRECO=ROUND('+VirgPonto(edtValorFixo.Text)+',2) '+
          ',ITP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
          ' WHERE TBP_CODIGO='+IntToStr(fMxTabPreco.Entidade.CodigoTBP)+
          ' AND CNC_CODIGO='+IntToStr(fMxTabPreco.Entidade.CodigoCNC)+
          ' AND PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO WHERE PRD_CODIGO<>-10 '+
          cPRD+cFOR+cGRP+cSGP+sDesativados+sReferencia+cDetalhe+sLinha+')');

      DM.Usuario1.GeraLog(3550, fMxTabPreco.Entidade.CodigoCNC, fMxTabPreco.Entidade.CodigoTBP,
        'TABELA DE PRECOS '+sFiltros);
    end
    //Alterar Preço Tabela de Preços SubGrupo
    else if tag = 2 then
    Begin
      if rdbPercentual.Checked then
        sFiltros := sFiltros + '('+cmbTipo.Text+' de '+edtPercentual.Text+' %)'
      else
        sFiltros := sFiltros + '(VALOR FIXO: R$ '+edtValorFixo.Text+')';

      if rdbPercentual.Checked then
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TABELA_DE_PRECO_SUBGRUPO SET '+
          ' ITS_PRECO_VENDA=ROUND(ITS_PRECO_VENDA'+cTipo+'(ITS_PRECO_VENDA*'+VirgPonto(edtPercentual.Text)+'/100),2) '+
          ',ITS_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE TPS_CODIGO='+IntToStr(fMxTabPrecoSubGrupo.Entidade.CodigoTPS)+
          ' AND CNC_CODIGO='+IntToStr(fMxTabPrecoSubGrupo.Entidade.CodigoCNC)+
          cGRP+cSGP+sDesativados+sReferencia+cDetalhe+sLinha)
      else
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TABELA_DE_PRECO_SUBGRUPO SET '+
          ' ITS_PRECO_VENDA=ROUND('+VirgPonto(edtValorFixo.Text)+',2) '+
          ',ITS_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE TPS_CODIGO='+IntToStr(fMxTabPrecoSubGrupo.Entidade.CodigoTPS)+
          ' AND CNC_CODIGO='+IntToStr(fMxTabPrecoSubGrupo.Entidade.CodigoCNC)+
          cGRP+cSGP+sDesativados+sReferencia+cDetalhe+sLinha);

      DM.Usuario1.GeraLog(3550, fMxTabPrecoSubGrupo.Entidade.CodigoCNC, fMxTabPrecoSubGrupo.Entidade.CodigoTPS,
        'TABELA DE PRECOS SUBGRUPO '+sFiltros);
    end;

    ShowMessage('Preços Alterados!');
  except
    ShowMessage('Falha ao ajustar os preços!');
  end;
  if Tag = 1 then
    Close;
end;

procedure TfMxAjustePreco.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxAjustePreco.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then 
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=17;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=17;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxAjustePreco.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=8;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxAjustePreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo1.Close;
  SubGrupo1.Close;
  Action := caFree;
end;

procedure TfMxAjustePreco.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbCampoAlterado.ItemIndex := 1; //Preço Venda
  rdbPercentualClick(sender);
  ckbDesativados.Checked := True;
  if DM.Configuracao1.Empresa = empMotical then 
    ckbCodigoPRD.Enabled := False;
    
  if tag = 1 then //Tabela de Preço
  Begin
    cmbCampoAlterado.Enabled:=False;
    cmbCampoCalculado.Enabled:=False;
//    ckbCodigoFOR.Enabled:=False;
//    ckbGrupo.Enabled:=False;
  end
  else if tag = 2 then //Tabela de Preço SubGrupo
  Begin
    cmbCampoAlterado.Enabled:=False;
    cmbCampoCalculado.Enabled:=False;
    ckbCodigoFOR.Enabled:=False;
    ckbCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxAjustePreco.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Color := clWindow;
    edtCodigoPRD.Enabled := True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Color := AlteraCorComponentes;
    edtCodigoPRD.Enabled := False;
    edtCodigoPRD.Clear;
  end;
end;

procedure TfMxAjustePreco.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Color := clWindow;
    edtCodigoFOR.Enabled := True;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.Color := AlteraCorComponentes;
    edtCodigoFOR.Enabled := False;
    edtCodigoFOR.Clear;
  end;
end;

procedure TfMxAjustePreco.ckbGrupoClick(Sender: TObject);
begin
  if ckbGrupo.Checked then
  Begin
    Grupo1.Open;
    dblGrupo.Color := clWindow;
    dblGrupo.Enabled := True;
    dblGrupo.KeyValue := Grupo1.CodigoGRP;
    ckbSubGrupo.Enabled := True;
    dblGrupo.SetFocus;
  end
  else
  Begin
    Grupo1.Close;
    dblGrupo.Color := AlteraCorComponentes;
    dblGrupo.Enabled := False;
    dblGrupo.KeyValue := -1;
    ckbSubGrupo.Checked := False;    
    ckbSubGrupo.Enabled := False;
  end;
end;

procedure TfMxAjustePreco.ckbSubGrupoClick(Sender: TObject);
begin
  if ckbSubGrupo.Checked then
  Begin
    SubGrupo1.Open;
    dblSubGrupo.Color := clWindow;
    dblSubGrupo.Enabled := True;
    dblSubGrupo.KeyValue := SubGrupo1.CodigoSGP;    
    dblSubGrupo.SetFocus;
  end
  else
  Begin
    SubGrupo1.Close;
    dblSubGrupo.Color := AlteraCorComponentes;
    dblSubGrupo.Enabled := False;
    dblSubGrupo.KeyValue := -1;
    dblSubGrupo.Enabled := False;
  end;
end;

procedure TfMxAjustePreco.SubGrupo1BeforeOpen(DataSet: TDataSet);
begin
  SubGrupo1.ParamByName('GRP_CODIGO').asInteger := Grupo1.CodigoGRP;
end;

procedure TfMxAjustePreco.dblGrupoClick(Sender: TObject);
begin
  if ckbSubGrupo.Checked then
  Begin
    SubGrupo1.Close;
    SubGrupo1.Open;
    dblSubGrupo.KeyValue := SubGrupo1.CodigoSGP;
  end;
end;

procedure TfMxAjustePreco.edtCodigoPRDExit(Sender: TObject);
begin
  labProduto.Caption := '.';
  if edtCodigoPRD.Text = '' then
    edtCodigoPRD.Text := '0';

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
  Begin
    ShowMessage('Código do Produto inválido!');
    edtCodigoPRD.Text := '0';
    Exit;
  end;

  with Produto1 do
  Begin
    if StrToInt(edtCodigoPRD.Text) <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
      Open;
    end;
    labProduto.Caption := Descricao+' '+Referencia;
  end;
end;

procedure TfMxAjustePreco.edtCodigoFORExit(Sender: TObject);
begin
  labFornecedor.Caption := '.';
  if edtCodigoFOR.Text = '' then
    edtCodigoFOR.Text := '0';

  if not VerificaInteiroBranco(edtCodigoFOR.Text) then
  Begin
    ShowMessage('Código do Fornecedor inválido!');
    edtCodigoFOR.Text := '0';
    Exit;
  end;

  with Fornecedor1 do
  Begin
    if StrToInt(edtCodigoFOR.Text) <> CodigoFOR then
    Begin
      Close;
      ParamByName('FOR_CODIGO').asInteger := StrToInt(edtCodigoFOR.Text);
      Open;
    end;
    labFornecedor.Caption := RazaoSocial;
  end;
end;

procedure TfMxAjustePreco.rdbPercentualClick(Sender: TObject);
begin
  if rdbPercentual.Checked then
  Begin
    edtPercentual.Enabled := True;
    edtPercentual.Color := clWindow;
    edtPercentual.SetFocus;
    if not (tag in [1,2]) then
    Begin
      cmbCampoCalculado.Enabled := True;
      cmbCampoCalculado.Color := clWindow;
      cmbCampoCalculado.ItemIndex := 1;
    end;
    cmbTipo.Enabled := True;
    cmbTipo.Color := clWindow;
    cmbTipo.ItemIndex := 1;
    edtValorFixo.Enabled := False;
    edtValorFixo.Color := AlteraCorComponentes;
    edtValorFixo.Clear;
  end
  else
  Begin
    edtPercentual.Enabled := False;
    edtPercentual.Color := AlteraCorComponentes;
    edtPercentual.Clear;
    cmbCampoCalculado.Enabled := False;
    cmbCampoCalculado.Color := AlteraCorComponentes;
    cmbCampoCalculado.ItemIndex := -1;
    cmbTipo.Enabled := False;
    cmbTipo.Color := AlteraCorComponentes;
    cmbTipo.ItemIndex := -1;
    edtValorFixo.Enabled := True;
    edtValorFixo.Color := clWindow;
    edtValorFixo.SetFocus;
  end;
end;

procedure TfMxAjustePreco.ckbReferenciaClick(Sender: TObject);
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

procedure TfMxAjustePreco.ckbEmLinhaClick(Sender: TObject);
begin
  if ckbEmLinha.Checked then
    ckbForaDeLinha.Checked := False;
end;

procedure TfMxAjustePreco.ckbForaDeLinhaClick(Sender: TObject);
begin
  if ckbForaDeLinha.Checked then
    ckbEmLinha.Checked := False;
end;

procedure TfMxAjustePreco.ckbDetalheClick(Sender: TObject);
begin
  if ckbDetalhe.Checked then
  Begin
    cmbDetalhe.Enabled:=True;
    cmbDetalhe.Color:=clWindow;
    if cmbDetalhe.Items.Count <= 1 then
    Begin
      cmbDetalhe.Clear;
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT DISTINCT PRD_DETALHE FROM PRODUTO '+
          ' ORDER BY PRD_DETALHE ';
        Open;
        while not EOF do
        Begin
          cmbDetalhe.Items.Add(FieldByName('PRD_DETALHE').asString);
          Next;
        end;
      end;
    end;
    cmbDetalhe.ItemIndex := 0;
    cmbDetalhe.SetFocus;
  end
  else
  Begin
    cmbDetalhe.Enabled:=False;
    cmbDetalhe.Color:=AlteraCorComponentes;
    cmbDetalhe.ItemIndex := -1;
  end;
end;

procedure TfMxAjustePreco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitConfirmarClick(bitConfirmar);
end;

end.
