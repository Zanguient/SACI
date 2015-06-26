unit CdItemTab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, checklst, Tabela_de_Precos, Db, DBTables, SQuery, Produto,
  DBCtrls, Buttons, Item_Tabela_de_Precos, ExtCtrls, Menus, Mask;

type
  TfCadItemTab = class(TForm)
    Produto1: TProduto;
    Tabela_de_Precos1: TTabela_de_Precos;
    DSTabela_de_Precos1: TDataSource;
    Item_Tabela_de_Precos1: TItem_Tabela_de_Precos;
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    Panel2: TPanel;
    sbtSalvar: TSpeedButton;
    sbtFechar: TSpeedButton;
    Panel3: TPanel;
    dblCodigoTBP: TDBLookupComboBox;
    Label20: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Confirmar1: TMenuItem;
    btnMarcar: TBitBtn;
    btnDesmarcar: TBitBtn;
    Bevel1: TBevel;
    edtCodigoPRD: TEdit;
    edtCodigoFOR: TEdit;
    Produto2: TProduto;
    edtCodigoGRP: TEdit;
    edtCodigoSGP: TEdit;
    ckbCodigoSGP: TCheckBox;
    Label4: TLabel;
    mskDataMovimento: TMaskEdit;
    edtReferencia: TEdit;
    ckbCodigoPRD: TCheckBox;
    ckbReferencia: TCheckBox;
    ckbCodigoFOR: TCheckBox;
    ckbCodigoGRP: TCheckBox;
    ckbMovimento: TCheckBox;
    ckbEstoquePositivo: TCheckBox;
    edtQtdProdutos: TEdit;
    edtQtdProdutosMarcados: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dblCodigoTBPClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtFecharClick(Sender: TObject);
    procedure sbtSalvarClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure Tabela_de_Precos1BeforeOpen(DataSet: TDataSet);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Item_Tabela_de_Precos1BeforeOpen(DataSet: TDataSet);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbMovimentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade :TItem_Tabela_de_Precos;
    { Public declarations }
  end;

var
  fCadItemTab: TfCadItemTab;

implementation
uses
  UDM, funcoes, MxTabPreco, MxSPediProd, MxSCotaFor, Configuracao,
  MxSPediProdMotCal;

{$R *.DFM}

procedure TfCadItemTab.FormCreate(Sender: TObject);
begin
  Entidade := Item_Tabela_de_Precos1;
end;

procedure TfCadItemTab.dblCodigoTBPClick(Sender: TObject);
Var
  i:integer;
begin
  With Produto1 do
  Begin
    DisableControls;
    first;
    i:=0;
    While not EOF Do
    Begin
      If Entidade.Locate('PRD_CODIGO',CodigoPRD,[]) Then
        CheckListBox1.Checked[i]:=true
      Else
        CheckListBox1.Checked[i]:=False;
      inc(i);
      Next;
    end;
    EnableControls;
  End;
end;

procedure TfCadItemTab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Produto1.Close;
  Tabela_de_Precos1.Close;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfCadItemTab.sbtFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadItemTab.sbtSalvarClick(Sender: TObject);
Var
  i:Integer;
begin
  if not Entidade.Active then
    Entidade.Open;

  edtQtdProdutos.Text := IntToStr(CheckListBox1.Items.Count);
  edtQtdProdutosMarcados.Text := '0';
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    If CheckListBox1.checked[i] then
    Begin
      try
        If not Entidade.Locate('PRD_CODIGO',StrToInt(Copy(CheckListBox1.Items[i],1,6)),[]) Then
        Begin
          Entidade.Inserir(tabela_de_precos1.CodigoCNC,0,tabela_de_precos1.CodigoTBP,
               StrToInt(Copy(CheckListBox1.Items[i],1,6)),
               StrTofloat(Copy(CheckListBox1.Items[i],78,8)),
               StrTofloat(Copy(CheckListBox1.Items[i],78,8)),0,0);
          edtQtdProdutosMarcados.Text := IntToStr(StrToInt(edtQtdProdutosMarcados.Text)+1);
        end;
      except
      end;
    End
    Else
      try
        If Entidade.Locate('PRD_CODIGO',StrToInt(Copy(CheckListBox1.Items[i],1,6)),[]) Then
          ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_TABELA_DE_PRECO '+
            ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND ITP_CODIGO='+IntToStr(Entidade.CodigoITP));
      except
      end;
  End;
  Entidade.Close;
  Entidade.Open;
  Close;
end;

procedure TfCadItemTab.btnMarcarClick(Sender: TObject);
Var
  i:Integer;
  CdPRD, sReferencia, CdFOR, CdGRP, CdSGP, sUltimaCompra, sEstoque: string;
begin
  CdPRD := '';
  sReferencia := '';
  CdFOR := '';
  CdGRP := '';
  CdSGP := '';
  sUltimaCompra := '';
  sEstoque := '';

  if ckbCodigoPRD.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      Raise Exception.Create('Código do Produto inválido!');
    CdPRD := ' AND T1.PRD_CODIGO='+edtCodigoPRD.Text;
  end;

  if ckbReferencia.Checked then
  Begin
    if Trim(edtReferencia.Text) = '' then
      Raise Exception.Create('Referência inválida!');
    sReferencia := ' AND T1.PRD_REFERENCIA LIKE "'+edtReferencia.Text+'%" ';
  end;

  if ckbCodigoFOR.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
      Raise Exception.Create('Código do Fornecedor inválido!');
    CdFOR := ' AND T1.FOR_CODIGO='+edtCodigoFOR.Text;
  end;

  if ckbCodigoGRP.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoGRP.Text) then
      Raise Exception.Create('Código do Grupo inválido!');
    CdGRP := ' AND T1.GRP_CODIGO='+edtCodigoGRP.Text;
  end;

  if ckbCodigoSGP.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoSGP.Text) then
      Raise Exception.Create('Código do SubGrupo inválido!');
    CdSGP := ' AND T1.SGP_CODIGO='+edtCodigoSGP.Text;
  end;

  if ckbEstoquePositivo.Checked then
  Begin
    if (fMxTabPreco.dblCodigoCNC.KeyValue = 0) or
       ((fMxTabPreco.dblCodigoCNC.KeyValue = 1) and
        (DM.Configuracao1.Empresa <> empEletro)) then
      sEstoque := ' AND EXISTS (SELECT IES.PRD_CODIGO '+
        ' FROM ITEM_DE_ESTOQUE IES '+
        ' WHERE IES.PRD_CODIGO=T1.PRD_CODIGO '+
        ' AND IES.IES_SFISICO>0) '
    else
      sEstoque := ' AND EXISTS (SELECT IES.PRD_CODIGO '+
        ' FROM ITEM_DE_ESTOQUE IES '+
        ' WHERE IES.PRD_CODIGO=T1.PRD_CODIGO '+
        ' AND IES.CNC_CODIGO='+IntToStr(fMxTabPreco.dblCodigoCNC.KeyValue)+
        ' AND IES.IES_SFISICO>0) ';
  end;

  if ckbMovimento.Checked then
  Begin
    if not VerificaDataBranco(mskDataMovimento.Text) then
      Raise Exception.Create('Data da Última Compra inválida!');

    if (fMxTabPreco.dblCodigoCNC.KeyValue = 0) or
       ((fMxTabPreco.dblCodigoCNC.KeyValue = 1) and
        (DM.Configuracao1.Empresa <> empEletro)) then
      sUltimaCompra := ' AND NOT EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
           ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
           ' WHERE PCP.PCP_SITUACAO=2 '+
           ' AND PCP.PCP_DT_ENTREGA>="'+MesDia(mskDataMovimento.Text)+'" '+
           ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
           ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) '
    else
      sUltimaCompra := ' AND NOT EXISTS (SELECT TOP 1 PCP.PCP_CODIGO '+
           ' FROM PEDIDO_DE_COMPRA PCP, ITEM_DE_PEDIDO_DE_COMPRA IPC '+
           ' WHERE PCP.PCP_SITUACAO=2 '+
           ' AND PCP.PCP_DT_ENTREGA>="'+MesDia(mskDataMovimento.Text)+'" '+
           ' AND PCP.CNC_ENTREGA='+IntToStr(fMxTabPreco.dblCodigoCNC.KeyValue)+
           ' AND IPC.PRD_CODIGO=T1.PRD_CODIGO '+
           ' AND PCP.PCP_CODIGO=IPC.PCP_CODIGO) ';
  end;

  Produto2.Close;
  Produto2.SQL.Text := 'SELECT T1.PRD_CODIGO '+
       ' FROM PRODUTO T1 '+
       ' WHERE T1.PRD_SITUACAO<>1 '+
       ' AND T1.PRD_PRECO_VENDA>0 '+
       CdPRD+sReferencia+CdFOR+CdGRP+CdSGP+sUltimaCompra+sEstoque;
  Produto2.Open;
  if Produto2.IsEmpty then
    Raise exception.Create('Consulta Vazia!');

  edtQtdProdutos.Text := IntToStr(CheckListBox1.Items.Count);
  edtQtdProdutosMarcados.Text := '0';
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    try
      if Produto2.LocalizarCod(StrToInt(Copy(CheckListBox1.Items[i],1,6))) then
        CheckListBox1.checked[i] := True;
      if CheckListBox1.checked[i] then
        edtQtdProdutosMarcados.Text := IntToStr(StrToInt(edtQtdProdutosMarcados.Text)+1);
    except
    end;
  End;
end;

procedure TfCadItemTab.btnDesmarcarClick(Sender: TObject);
Var
  i:Integer;
begin
  edtQtdProdutos.Text := IntToStr(CheckListBox1.Items.Count);
  edtQtdProdutosMarcados.Text := '0';
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    CheckListBox1.checked[i] := False;
  End;
end;

procedure TfCadItemTab.Tabela_de_Precos1BeforeOpen(DataSet: TDataSet);
begin
  Tabela_de_Precos1.ParamByName('TBP_CODIGO').AsInteger := fMxTabPreco.Entidade.CodigoTBP;
end;

procedure TfCadItemTab.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    edtCodigoSGP.Enabled:=True;
    edtCodigoSGP.Color:=clWindow;
    edtCodigoSGP.SetFocus;
  end
  else
  Begin
    edtCodigoSGP.Enabled:=False;
    edtCodigoSGP.Color:=AlteraCorComponentes;
    edtCodigoSGP.Clear;
  end;
end;

procedure TfCadItemTab.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=25;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=25;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfCadItemTab.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=13;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfCadItemTab.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfCadItemTab.FormShow(Sender: TObject);
Var
  i:Integer;
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Tabela_de_Precos1.Open;
  Entidade.Open;

  dblCodigoTBP.KeyValue := fMxTabPreco.Entidade.CodigoTBP;
  //
  edtQtdProdutosMarcados.Text := '0';
  CheckListBox1.Clear;
  With Produto1 do
  Begin
    DisableControls;
    Close;
    SQL.Text := 'SELECT PRD_CODIGO,PRD_DESCRICAO, '+
      ' PRD_MARCA, PRD_PRECO_VENDA, PRD_CARACTERISTICA '+
      ' FROM PRODUTO '+
      ' WHERE PRD_SITUACAO<>1 '+
      ' AND PRD_PRECO_VENDA>0 '+
      ' ORDER BY LTRIM(PRD_DESCRICAO) ';
    Open;
    first;
    i:=0;
    While not EOF Do
    Begin
      CheckListBox1.Items.Add(PreencheZero(6,CodigoPRD)+' '+
                              PreencheEspaco(60,Trim(Descricao+' '+Caracteristica))+
                              PreencheEspaco(10,Marca)+
                              PreencheEspacoEsq(8,format('%.2f',[Precovenda])));
      If Entidade.Locate('PRD_CODIGO',CodigoPRD,[]) Then
        CheckListBox1.Checked[i]:=true;
      if CheckListBox1.Checked[i] then
        edtQtdProdutosMarcados.Text := IntToStr(StrToInt(edtQtdProdutosMarcados.Text)+1);
      inc(i);
      Next;
    End;
    EnableControls;
    edtQtdProdutos.Text := IntToStr(CheckListBox1.Items.Count);
  End;
end;

procedure TfCadItemTab.Item_Tabela_de_Precos1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger := fMxTabPreco.Entidade.CodigoCNC;
  Entidade.ParamByName('TBP_CODIGO').asInteger := fMxTabPreco.Entidade.CodigoTBP;
end;

procedure TfCadItemTab.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Enabled:=False;
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Clear;
  end;
end;

procedure TfCadItemTab.ckbReferenciaClick(Sender: TObject);
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

procedure TfCadItemTab.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.Color:=clWindow;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.Enabled:=False;
    edtCodigoFOR.Color:=AlteraCorComponentes;
    edtCodigoFOR.Clear;
  end;
end;

procedure TfCadItemTab.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    edtCodigoGRP.Enabled:=True;
    edtCodigoGRP.Color:=clWindow;
    edtCodigoGRP.SetFocus;
  end
  else
  Begin
    edtCodigoGRP.Enabled:=False;
    edtCodigoGRP.Color:=AlteraCorComponentes;
    edtCodigoGRP.Clear;
  end;
end;

procedure TfCadItemTab.ckbMovimentoClick(Sender: TObject);
begin
  if ckbMovimento.Checked then
  Begin
    mskDataMovimento.Enabled := True;
    mskDataMovimento.Color:=clWindow;
    mskDataMovimento.SetFocus;
  end
  else
  Begin
    mskDataMovimento.Enabled := True;
    mskDataMovimento.Color:=clWindow;
    mskDataMovimento.Clear;
  end;
end;

end.



