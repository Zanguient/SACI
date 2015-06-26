unit MxTabelaQtdNormal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Db,
  DBTables, SQuery, Grupo, Fornecedor, Usuario, Variants,
  SubGrupo, QuantidadeNormalVenda, Produto;

type
  TfMxTabelaQtdNormal = class(TForm)
    Panel13: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edtCodigoQNV: TEdit;
    edtQuantidade: TEdit;
    edtCodigoFOR: TEdit;
    edtFornecedor: TEdit;
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit11: TEdit;
    ComboBox1: TComboBox;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label5: TLabel;
    Label9: TLabel;
    Grupo1: TGrupo;
    Fornecedor1: TFornecedor;
    Label10: TLabel;
    DSQuantidadeNormalVenda1: TDataSource;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    edtUsuario: TEdit;
    Label12: TLabel;
    edtCodigoPRD: TEdit;
    edtCodigoGRP: TEdit;
    edtGrupo: TEdit;
    Label13: TLabel;
    edtCodigoSGP: TEdit;
    edtSubGrupo: TEdit;
    edtProduto: TEdit;
    Label8: TLabel;
    Label11: TLabel;
    mskAlterado: TMaskEdit;
    mskCadastro: TMaskEdit;
    Label7: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    SubGrupo1: TSubGrupo;
    QuantidadeNormalVenda1: TQuantidadeNormalVenda;
    QuantidadeNormalVenda1CNC_CODIGO: TIntegerField;
    QuantidadeNormalVenda1QNV_CODIGO: TIntegerField;
    QuantidadeNormalVenda1USU_CODIGO: TIntegerField;
    QuantidadeNormalVenda1FOR_CODIGO: TIntegerField;
    QuantidadeNormalVenda1GRP_CODIGO: TIntegerField;
    QuantidadeNormalVenda1SGP_CODIGO: TIntegerField;
    QuantidadeNormalVenda1PRD_CODIGO: TIntegerField;
    QuantidadeNormalVenda1QNV_DT_CADASTRO: TDateTimeField;
    QuantidadeNormalVenda1QNV_DT_ALTERADO: TDateTimeField;
    QuantidadeNormalVenda1QNV_QUANTIDADE: TFloatField;
    QuantidadeNormalVenda1QNV_SITUACAO: TIntegerField;
    QuantidadeNormalVenda1QNV_OBSERVACAO: TStringField;
    QuantidadeNormalVenda1Produto: TStringField;
    QuantidadeNormalVenda1Fornecedor: TStringField;
    QuantidadeNormalVenda1Grupo: TStringField;
    QuantidadeNormalVenda1SubGrupo: TStringField;
    QuantidadeNormalVenda1Usuario: TStringField;
    QuantidadeNormalVenda2: TQuantidadeNormalVenda;
    Produto1: TProduto;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_LocClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure QuantidadeNormalVenda1AfterScroll(DataSet: TDataSet);
    procedure QuantidadeNormalVenda1CalcFields(DataSet: TDataSet);
    procedure edtCodigoGRPExit(Sender: TObject);
    procedure edtCodigoSGPExit(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TQuantidadeNormalVenda;
  end;

var
  fMxTabelaQtdNormal: TfMxTabelaQtdNormal;

implementation
uses UDM,Funcoes, MxSCotaFor;
{$R *.DFM}

procedure TfMxTabelaQtdNormal.SB_PrimClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxTabelaQtdNormal.SB_AntClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.Prior;
    If Entidade.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxTabelaQtdNormal.SB_ProxClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Next;
    If Entidade.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxTabelaQtdNormal.SB_UltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxTabelaQtdNormal.FormCreate(Sender: TObject);
begin
  Entidade:=QuantidadeNormalVenda1;
end;

procedure TfMxTabelaQtdNormal.edtCodigoFORExit(Sender: TObject);
begin
  If SB_Canc.Focused then
    Exit;
  edtFornecedor.Clear;
  If edtCodigoFOR.Text<>'' then
    If VerificaInteiro(edtCodigoFOR.text) then
    Begin
      with Fornecedor1 do
      Begin
        if StrToInt(edtCodigoFOR.Text) <> CodigoFOR then
        Begin
          Close;
          ParamByName('FOR_CODIGO').asInteger:=StrToInt(edtCodigoFOR.Text);
          Open;
        end;
        If IsEmpty then
        Begin
          edtCodigoFOR.setFocus;
          ShowMessage('Fornecedor inválido!');
        End
        else
          edtFornecedor.Text:=RazaoSocial;
      end;
    End
    else
    Begin
      edtCodigoFOR.setFocus;
      ShowMessage('Fornecedor inválido!');
    end;
end;

procedure TfMxTabelaQtdNormal.edtCodigoFORKeyPress(Sender: TObject;
  var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=17;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxTabelaQtdNormal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo1.Close;
  SubGrupo1.Close;
  Fornecedor1.Close;
  Produto1.Close;
  action:=caFree;    
end;

procedure TfMxTabelaQtdNormal.SB_LocClick(Sender: TObject);
begin
  If ComboBox1.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfMxTabelaQtdNormal.SB_NovoClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6100)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir registro!');
  Entidade.PreparaInsercao;
  edtProduto.Clear;
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit11.Enabled:=False;
  Edit11.Color:=AlteraCorComponentes;
  ComboBox1.Enabled:=False;
  ComboBox1.Color:=AlteraCorComponentes;
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
  edtCodigoFOR.setFocus;
end;

procedure TfMxTabelaQtdNormal.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6100)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');    
  Entidade.PreparaAlteracao;
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit11.Enabled:=False;
  Edit11.Color:=AlteraCorComponentes;
  ComboBox1.Enabled:=False;
  ComboBox1.Color:=AlteraCorComponentes;
  edtCodigoFOR.SetFocus;
end;

procedure TfMxTabelaQtdNormal.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6100)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.deletarauto;
end;

procedure TfMxTabelaQtdNormal.SB_SalvaClick(Sender: TObject);
begin
  If edtCodigoFOR.Text='' then
    raise Exception.Create('Selecione um fornecedor!');
  if not VerificaInteiroBranco(edtCodigoGRP.Text) then
    edtCodigoGRP.Text := '0';
  if not VerificaInteiroBranco(edtCodigoSGP.Text) then
    edtCodigoSGP.Text := '0';
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Text := '0';
  if (edtCodigoSGP.Text <> '0') and
     (edtCodigoGRP.Text = '0') then
    Raise Exception.Create('Para definir SubGrupo é necessário definir Grupo!');

  if edtCodigoPRD.Text <> '0' then
  Begin
    with QuantidadeNormalVenda2 do
    Begin
      Close;
      SQL.Text:='SELECT QNV_CODIGO FROM QUANTIDADE_NORMAL_VENDA '+
        'WHERE QNV_CODIGO <> '+edtCodigoQNV.Text+' AND PRD_CODIGO='+edtCodigoPRD.Text;
      Open;
      if not IsEmpty then
        Raise Exception.Create('Quantidade Normal para esse produto, já cadastrada!');
    end;
  end
  else if edtCodigoSGP.Text <> '0' then
  Begin
    with QuantidadeNormalVenda2 do
    Begin
      Close;
      SQL.Text:='SELECT QNV_CODIGO FROM QUANTIDADE_NORMAL_VENDA '+
        'WHERE QNV_CODIGO <> '+edtCodigoQNV.Text+
        ' AND FOR_CODIGO='+edtCodigoFOR.Text+
        ' AND GRP_CODIGO='+edtCodigoGRP.Text+
        ' AND SGP_CODIGO='+edtCodigoSGP.Text+
        ' AND PRD_CODIGO=0';
      Open;
      if not IsEmpty then
        Raise Exception.Create('Quantidade Normal para esse SubGrupo desse Fornecedor, já cadastrada!');
    end;
  end
  else if edtCodigoGRP.Text <> '0' then
  Begin
    with QuantidadeNormalVenda2 do
    Begin
      Close;
      SQL.Text:='SELECT QNV_CODIGO FROM QUANTIDADE_NORMAL_VENDA '+
        'WHERE QNV_CODIGO <> '+edtCodigoQNV.Text+
        ' AND FOR_CODIGO='+edtCodigoFOR.Text+
        ' AND GRP_CODIGO='+edtCodigoGRP.Text+
        ' AND SGP_CODIGO=0 '+
        ' AND PRD_CODIGO=0';
      Open;
      if not IsEmpty then
        Raise Exception.Create('Quantidade Normal para esse Grupo desse Fornecedor, já cadastrada!');
    end;
  end
  else
  Begin
    with QuantidadeNormalVenda2 do
    Begin
      Close;
      SQL.Text:='SELECT QNV_CODIGO FROM QUANTIDADE_NORMAL_VENDA '+
        'WHERE QNV_CODIGO <> '+edtCodigoQNV.Text+
        ' AND FOR_CODIGO='+edtCodigoFOR.Text+
        ' AND GRP_CODIGO=0'+
        ' AND SGP_CODIGO=0'+
        ' AND PRD_CODIGO=0';
      Open;
      if not IsEmpty then
        Raise Exception.Create('Quantidade Normal para esse Grupo desse Fornecedor, já cadastrada!');
    end;
  end;
  if Entidade.FinalizaEdicao then
  Begin
    Incluir1.Enabled:=True;
    Alterar1.Enabled:=True;
    Excluir1.Enabled:=True;
    Localizar1.Enabled:=True;
    Salvar1.Enabled:=false;
    Cancelar1.Enabled:=false;
    SB_Prim.Enabled:=True;
    SB_Ant.Enabled:=True;
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
    SB_Novo.Enabled:=True;
    SB_Loc.Enabled:=True;
    SB_Alt.Enabled:=True;
    SB_Exc.Enabled:=True;
    SB_Salva.Enabled:=False;
    SB_Canc.Enabled:=False;
    Edit11.Enabled:=True;
    Edit11.Color:=clWindow;
    ComboBox1.Enabled:=True;
    ComboBox1.Color:=clWindow;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxTabelaQtdNormal.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  Incluir1.Enabled:=True;
  Alterar1.Enabled:=True;
  Excluir1.Enabled:=True;
  Localizar1.Enabled:=True;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox1.Enabled:=True;
  ComboBox1.Color:=clWindow;
  edtFornecedor.Clear;
end;

procedure TfMxTabelaQtdNormal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxTabelaQtdNormal.FormShow(Sender: TObject);
begin
  Entidade.Open;
  ComboBox1.ItemIndex:=1;
  Edit11.SetFocus;
end;

procedure TfMxTabelaQtdNormal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end;
end;

procedure TfMxTabelaQtdNormal.QuantidadeNormalVenda1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtFornecedor.Text := Entidade.FieldByName('Fornecedor').asString;
  edtGrupo.Text      := Entidade.FieldByName('Grupo').asString;
  edtSubGrupo.Text   := Entidade.FieldByName('SubGrupo').asString;
  edtProduto.Text   := Entidade.FieldByName('Produto').asString;    
  edtUsuario.Text    := Entidade.FieldByName('Usuario').asString;
end;

procedure TfMxTabelaQtdNormal.QuantidadeNormalVenda1CalcFields(
  DataSet: TDataSet);
begin
  with Fornecedor1 do
  Begin
    if Entidade.CodigoFOR <> CodigoFOR then
    Begin
      Close;
      ParamByName('FOR_CODIGO').asInteger:=Entidade.CodigoFOR;
      Open;
    end;
    Entidade.FieldByName('Fornecedor').asString:=RazaoSocial;
  end;

  with Grupo1 do
  Begin
    if Entidade.CodigoGRP <> CodigoGRP then
    Begin
      Close;
      ParamByName('GRP_CODIGO').asInteger:=Entidade.CodigoGRP;
      Open;
    end;
    Entidade.FieldByName('Grupo').asString:=Descricao;
  end;

  with SubGrupo1 do
  Begin
    if (Entidade.CodigoGRP <> CodigoGRP) or
       (Entidade.CodigoSGP <> CodigoSGP) then
    Begin
      Close;
      ParamByName('GRP_CODIGO').asInteger:=Entidade.CodigoGRP;
      ParamByName('SGP_CODIGO').asInteger:=Entidade.CodigoSGP;
      Open;
    end;
    Entidade.FieldByName('SubGrupo').asString:=Descricao;
  end;

  with Produto1 do
  Begin
    if Entidade.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
      Open;
    end;
    Entidade.FieldByName('Produto').asString:=Descricao;
  end;

  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxTabelaQtdNormal.edtCodigoGRPExit(Sender: TObject);
begin
  If SB_Canc.Focused then
    Exit;
  edtGrupo.Clear;
  If (edtCodigoGRP.Text<>'') and (edtCodigoGRP.Text<>'0') then
  Begin
    If VerificaInteiro(edtCodigoGRP.text) then
    Begin
      with Grupo1 do
      Begin
        if StrToInt(edtCodigoGRP.Text) <> CodigoGRP then
        Begin
          Close;
          ParamByName('GRP_CODIGO').asInteger:=StrToInt(edtCodigoGRP.Text);
          Open;
        end;
        If IsEmpty then
        Begin
          edtCodigoGRP.setFocus;
          ShowMessage('Grupo inválido!');
        End
        else
          edtGrupo.Text:=Descricao;
      end;
    End
    else
    Begin
      edtCodigoGRP.setFocus;
      ShowMessage('Grupo inválido!');
    end;
  end;
end;

procedure TfMxTabelaQtdNormal.edtCodigoSGPExit(Sender: TObject);
begin
  If SB_Canc.Focused then
    Exit;
  edtSubGrupo.Clear;
  If (edtCodigoSGP.Text<>'') and (edtCodigoSGP.Text<>'0') then
  Begin
    If VerificaInteiro(edtCodigoSGP.text) then
    Begin
      with SubGrupo1 do
      Begin
        if StrToInt(edtCodigoSGP.Text) <> CodigoSGP then
        Begin
          Close;
          ParamByName('GRP_CODIGO').asInteger:=StrToInt(edtCodigoGRP.Text);
          ParamByName('SGP_CODIGO').asInteger:=StrToInt(edtCodigoSGP.Text);
          Open;
        end;
        If IsEmpty then
        Begin
          edtCodigoSGP.setFocus;
          ShowMessage('SubGrupo inválido!');
        End
        else
          edtSubGrupo.Text:=Descricao;
      end;
    End
    else
    Begin
      edtCodigoSGP.setFocus;
      ShowMessage('SubGrupo inválido!');
    end;
  end;
end;

procedure TfMxTabelaQtdNormal.edtCodigoPRDExit(Sender: TObject);
begin
  If SB_Canc.Focused then
    Exit;
  edtProduto.Clear;
  If (edtCodigoPRD.Text<>'') and (edtCodigoPRD.Text<>'0') then
  Begin
    If VerificaInteiro(edtCodigoPRD.text) then
    Begin
      with Produto1 do
      Begin
        if StrToInt(edtCodigoPRD.Text) <> CodigoPRD then
        Begin
          Close;
          ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
          Open;
        end;
        If IsEmpty then
        Begin
          edtCodigoPRD.setFocus;
          ShowMessage('Produto inválido!');
        End
        else
          edtProduto.Text:=Descricao;
      end;
    End
    else
    Begin
      edtCodigoPRD.setFocus;
      ShowMessage('Produto inválido!');
    end;
  end;
end;

end.
