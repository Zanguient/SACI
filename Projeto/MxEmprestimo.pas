unit MxEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Db,
  DBTables, SQuery, Classificacao_fiscal, Item_Nota_Fiscal, NotaFiscal,
  Item_de_Estoque, Produto, Cliente, Emprestimo, Usuario;

type
  TfMxEmprestimo = class(TForm)
    Panel13: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigoEMP: TEdit;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    mskAlterado: TMaskEdit;
    Label8: TLabel;
    Label10: TLabel;
    mskCadastro: TMaskEdit;
    Label11: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    IncluirPed: TMenuItem;
    ExcluirPed: TMenuItem;
    N1: TMenuItem;
    SalvarPed: TMenuItem;
    CancelarPed: TMenuItem;
    N2: TMenuItem;
    LocalizarPed: TMenuItem;
    edtCodigoPRD: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtProduto: TEdit;
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel1: TPanel;
    SB_LocPed: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_ExcPed: TSpeedButton;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    edtReferencia: TEdit;
    Label5: TLabel;
    edtDetalhe: TEdit;
    Label9: TLabel;
    edtQuantidade: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    SB_Reabre: TBitBtn;
    Emprestimo1: TEmprestimo;
    DSEmprestimo1: TDataSource;
    Emprestimo1CNC_CODIGO: TIntegerField;
    Emprestimo1EMP_CODIGO: TIntegerField;
    Emprestimo1PRD_CODIGO: TIntegerField;
    Emprestimo1USU_CODIGO: TIntegerField;
    Emprestimo1EMP_DT_CADASTRO: TDateTimeField;
    Emprestimo1EMP_DT_ALTERADO: TDateTimeField;
    Emprestimo1EMP_QUANTIDADE: TFloatField;
    Emprestimo1EMP_SITUACAO: TIntegerField;
    Emprestimo1LOT_CODIGO: TIntegerField;    
    edtClienteCNC: TEdit;
    cmbSituacao: TComboBox;
    Emprestimo1CNC_CLIENTE: TIntegerField;
    Emprestimo1CLI_CODIGO: TIntegerField;
    Cliente1: TCliente;
    Produto1: TProduto;
    Emprestimo1Cliente: TStringField;
    Emprestimo1Produto: TStringField;
    Emprestimo1Usuario: TStringField;
    Emprestimo1Referencia: TStringField;
    Emprestimo1Detalhe: TStringField;
    Emprestimo1Alterado: TStringField;
    Emprestimo1Situacao: TStringField;
    Item_de_Estoque1: TItem_de_Estoque;
    Panel5: TPanel;
    SB_Fechar: TSpeedButton;
    SB_Imprimir: TSpeedButton;
    SB_Faturar: TSpeedButton;
    ckbDevolvidos: TCheckBox;
    ckbFaturados: TCheckBox;
    Emprestimo2: TEmprestimo;
    NotaFiscal1: TNotaFiscal;
    Item_Nota_Fiscal1: TItem_Nota_Fiscal;
    Emprestimo1EMP_NOTA_FISCAL_SAI: TIntegerField;
    Emprestimo1EMP_NOTA_FISCAL_ENT: TIntegerField;
    edtCidade: TEdit;
    Label14: TLabel;
    edtUF: TEdit;
    Label15: TLabel;
    Emprestimo1Cidade: TStringField;
    Emprestimo1UF: TStringField;
    Emprestimo1EMP_OBSERVACAO: TStringField;
    Label16: TLabel;
    edtObservacao: TEdit;
    edtNotaFiscalSaida: TEdit;
    Label17: TLabel;
    edtNotaFiscalEntrada: TEdit;
    Label18: TLabel;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Classificacao_fiscal2: TClassificacao_fiscal;
    NotaFiscal2: TNotaFiscal;
    SB_Observacao: TSpeedButton;
    Emprestimo1EMP_DEMONSTRACAO: TIntegerField;
    ckbDemonstracao: TCheckBox;
    lblDescLote: TLabel;
    edtCodigoLOT: TEdit;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_LocPedClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_ExcPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Emprestimo1BeforeOpen(DataSet: TDataSet);
    procedure Emprestimo1CalcFields(DataSet: TDataSet);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure Emprestimo1AfterScroll(DataSet: TDataSet);
    procedure SB_ReabreClick(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure SB_FaturarClick(Sender: TObject);
    procedure ckbDevolvidosClick(Sender: TObject);
    procedure ckbFaturadosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ObservacaoClick(Sender: TObject);
    procedure Emprestimo1AfterOpen(DataSet: TDataSet);
    procedure edtCodigoLOTExit(Sender: TObject);
    procedure edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
  public
    CdTRN: integer;
    Entidade:TEmprestimo;
  end;

var
  fMxEmprestimo: TfMxEmprestimo;

implementation
uses UDM,Funcoes, MxSPediProd, CdCliente, UNotaFiscalLBM,
  UNotaFiscalMotCal, MxSTransportadora, MxSPediProdMotCal,
  UEmprestimoCompleto, UNotaFiscalEletro, UNotaFiscalLuciano, CdLote;
{$R *.DFM}

procedure TfMxEmprestimo.SB_PrimClick(Sender: TObject);
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

procedure TfMxEmprestimo.SB_AntClick(Sender: TObject);
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

procedure TfMxEmprestimo.SB_ProxClick(Sender: TObject);
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

procedure TfMxEmprestimo.SB_UltClick(Sender: TObject);
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

procedure TfMxEmprestimo.FormCreate(Sender: TObject);
begin
  Entidade:=Emprestimo1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_EMP_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxEmprestimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_EMP_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  action:=caFree;
end;

procedure TfMxEmprestimo.SB_LocPedClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;

procedure TfMxEmprestimo.SB_NovoPedClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir Demonstração neste centro de custo.');
  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  edtRazaoSocial.Clear;
  edtProduto.Clear;
  edtReferencia.Clear;
  edtDetalhe.Clear;
  edtCidade.Clear;
  edtUF.Clear;
  edtCodigoCLI.setFocus;
end;

procedure TfMxEmprestimo.SB_ExcPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if Entidade.Situacao < 1 then
    raise Exception.Create('Mercadoria ainda não foi devolvida!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir Demonstração neste centro de custo.');

  Entidade.deletarauto;
  if Entidade.IsEmpty then
  Begin
    edtNotaFiscalSaida.Clear;
    edtNotaFiscalEntrada.Clear;
  end;
end;

procedure TfMxEmprestimo.SB_SalvaPedClick(Sender: TObject);
var
  Trans : Boolean;
  CdCNC, CdEMP, CdPRD, CdLOT:integer;
  vQuantidade:Double;
  vOBS: string;
begin
  //Alterar Somente Observação
  if not edtQuantidade.Enabled then
  Begin
    AtualizaControles(1, False);
    edtObservacao.Enabled := False;
    CdCNC := Entidade.CodigoCNC;
    CdEMP := Entidade.CodigoEMP;
    vOBS  := edtObservacao.Text;
    ExecutaSQL(DM.QR_Comandos, 'UPDATE EMPRESTIMO SET '+
      ' EMP_OBSERVACAO="'+edtObservacao.Text+'" '+
      ',EMP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND EMP_CODIGO='+IntToStr(CdEMP));
    Entidade.GeraLog(3860,CdCNC,CdEMP,'OBS:'+vOBS);
    Entidade.Close;
    Entidade.Open;
    Entidade.LocalizarCod(CdEMP, CdCNC);
    Exit;
  end;

  If edtCodigoCLI.Text='' then
    raise Exception.Create('Selecione um cliente!');

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdEMP := StrToInt(edtCodigoEMP.Text);
  CdPRD := StrToInt(edtCodigoPRD.Text);
  CdLOT := StrToInt(edtCodigoLOT.Text);
  vQuantidade := StrToFloat(edtQuantidade.Text);

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if not Entidade.FinalizaEdicao then
        Raise exception.Create('');

      Item_de_Estoque1.Close;
      Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CdPRD;
      Item_de_Estoque1.open;
      If Item_de_Estoque1.isempty then
      begin
        if not Item_de_Estoque1.Inserir(CdCNC,CdPRD,0(*CdFUN*),0,0,0,0,0,
               DM.Configuracao1.DataHora,0,0,0,0,0,0) then
          Raise exception.Create('');
        Item_de_Estoque1.Close;
        Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
        Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CdPRD;
        Item_de_Estoque1.open;
      end;

      if CdLOT > 0 then
      Begin
        DM.Item_de_Estoque_Detalhe1.Close;
        DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
        DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
        DM.Item_de_Estoque_Detalhe1.open;
        If DM.Item_de_Estoque_Detalhe1.isempty then
        begin
          DM.Item_de_Estoque_Detalhe1.Inserir(CdCNC,CdLOT,CdPRD);
          DM.Item_de_Estoque_Detalhe1.Close;
          DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
          DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
          DM.Item_de_Estoque_Detalhe1.open;
        end;
      end;

      if not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,0(*CdFUN*),
          CdCNC,CdEMP,520(*EMPRESTIMO*),'S',
          vQuantidade,Item_de_Estoque1.SFisico) then
      Begin
        ShowMessage('Falha ao Gerar Mov. Físico!');
        Raise Exception.Create('');
      end;

      if CdLOT>0 then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
          ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(vQuantidade)+
          ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND LOT_CODIGO='+IntToStr(CdLOT));
      end;


      //Atualizar estoque Fisico e Indisponível
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
        ' IES_INDISPONIVEL=IES_INDISPONIVEL+'+VirgPonto(vQuantidade)+
        ',IES_SFISICO=IES_SFISICO-'+VirgPonto(vQuantidade)+
        ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));
      AtualizaControles(1,False);

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
end;

procedure TfMxEmprestimo.SB_CancPedClick(Sender: TObject);
begin
  edtRazaoSocial.Clear;
  edtCidade.Clear;
  edtUF.Clear;
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
end;

procedure TfMxEmprestimo.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxEmprestimo.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  
  if DM.Configuracao1.Empresa <> empLuciano then
  Begin
    lblDescLote.Visible := False;
    edtCodigoLOT.Visible := False;
  end;

  if DM.Configuracao1.Empresa = empLBM then
    edtClienteCNC.Text := '1'
  else
    edtClienteCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);
    
  Entidade.Open;
  cmbCampo.ItemIndex:=0;
  edtLocalizar.SetFocus;
end;

procedure TfMxEmprestimo.Emprestimo1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
end;

procedure TfMxEmprestimo.Emprestimo1CalcFields(DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    if CodigoPRD <> Entidade.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
      Open;
    end;
    Entidade.FieldByName('Produto').asString    := Descricao;
    Entidade.FieldByName('Referencia').asString := Referencia;
    Entidade.FieldByName('Detalhe').asString    := Detalhe;
  end;

  with Cliente1 do
  Begin
    if (CodigoCNC <> Entidade.CNCCliente) or
       (CodigoCLI <> Entidade.CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CNCCliente;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    Entidade.FieldByName('Cliente').asString := RazaoSocial;
    Entidade.FieldByName('Cidade').asString  := Cidade;
    Entidade.FieldByName('UF').asString      := UF;
  end;

  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);

  case Entidade.Situacao of
    0: Entidade.FieldByName('Situacao').asString:='Emprestado';
    1: Entidade.FieldByName('Situacao').asString:='Devolvida';
  end;
end;

procedure TfMxEmprestimo.edtCodigoPRDExit(Sender: TObject);
begin
  If SB_CancPed.Focused then
    Exit;
  if not VerificaInteiroBranco(edtCodigoPRD.text) then
  Begin
    Showmessage('Código do produto inválido');
    edtProduto.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtCodigoPRD.SetFocus;
    Exit;
  End;
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
  Produto1.Open;
  if Produto1.IsEmpty then
  Begin
    edtProduto.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtCodigoPRD.SetFocus;
    raise Exception.Create('Produto inválido');
  end
  else if Produto1.Situacao = 1 then
  Begin
    edtProduto.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtCodigoPRD.SetFocus;
    raise Exception.Create('Produto Desativado');
  end
  else
  Begin
    edtProduto.Text:=Produto1.Descricao;
    edtReferencia.Text:=Produto1.Referencia;
    edtDetalhe.Text:=Produto1.Detalhe;
  end;
end;

procedure TfMxEmprestimo.edtCodigoCLIExit(Sender: TObject);
begin
  If SB_CancPed.Focused then
    Exit;
  if not VerificaInteiroBranco(edtCodigoCLI.text) then
  Begin
    Showmessage('Código de Cliente inválido');
    edtRazaoSocial.Clear;
    edtCidade.Clear;
    edtUF.Clear;
    edtCodigoCLI.SetFocus;
    Exit;
  End;
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=StrToInt(edtClienteCNC.Text);
  Cliente1.ParamByName('CLI_CODIGO').asInteger:=StrToInt(edtCodigoCLI.Text);
  Cliente1.Open;
  if Cliente1.IsEmpty then
  Begin
    edtRazaoSocial.Clear;
    edtCidade.Clear;
    edtUF.Clear;
    edtCodigoCLI.SetFocus;
    raise Exception.Create('Cliente inválido');
  end
  else if Cliente1.CodigoCLI = DM.Configuracao1.CodigoCliAVista then
  Begin
    edtRazaoSocial.Clear;
    edtCidade.Clear;
    edtUF.Clear;
    edtCodigoCLI.SetFocus;
    raise Exception.Create('Não pode fazer Demonstração para o cliente à vista!');
  end
  else
  Begin
    edtRazaoSocial.Text:=Cliente1.RazaoSocial;
    edtCidade.Text:=Cliente1.Cidade;
    edtUF.Text:=Cliente1.Uf;
  end;
end;

procedure TfMxEmprestimo.Emprestimo1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  if Entidade.IsEmpty then
  Begin
    edtRazaoSocial.Clear;
    edtProduto.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtCidade.Clear;
    edtUF.Clear;
    cmbSituacao.ItemIndex:=-1;
  end
  else
  Begin
    edtRazaoSocial.Text := Entidade.FieldByName('Cliente').asString;
    edtCidade.Text := Entidade.FieldByName('Cidade').asString;
    edtUF.Text := Entidade.FieldByName('Uf').asString;
    edtProduto.Text := Entidade.FieldByName('Produto').asString;
    edtReferencia.Text := Entidade.FieldByName('Referencia').asString;
    edtDetalhe.Text := Entidade.FieldByName('Detalhe').asString;
  end;
end;

procedure TfMxEmprestimo.SB_ReabreClick(Sender: TObject);
var
  CdCNC, CdEMP, CdLOT:integer;
  Trans : Boolean;
  vMensagem: WideString;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione Demonstração!');
  if Entidade.Situacao = 1 then
    Raise Exception.Create('Demonstração já foi Devolvida!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode devolver Demonstração neste centro de custo.');

  vMensagem := 'Tem certeza que devolver esse Empréstimo/Demonstração?';
  If MessageDlg(vMensagem,mtConfirmation, [mbYes, mbNo], 1) <> mrYes then
    Exit;

  CdCNC := Entidade.CodigoCNC;
  CdEMP := Entidade.CodigoEMP;
  CdLOT := Entidade.CodigoLOT;

  Item_de_Estoque1.Close;
  Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
  Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := Entidade.CodigoPRD;
  Item_de_Estoque1.open;
  If Item_de_Estoque1.isempty then
  begin
    Item_de_Estoque1.Inserir(CdCNC,Entidade.CodigoPRD,0(*CdFUN*),0,0,0,0,0,
      DM.Configuracao1.DataHora,0,0,0,0,0,0);
    Item_de_Estoque1.Close;
    Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := Entidade.CodigoPRD;
    Item_de_Estoque1.open;
  end;

  if CdLOT > 0 then
  Begin
    DM.Item_de_Estoque_Detalhe1.Close;
    DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
    DM.Item_de_Estoque_Detalhe1.open;
    If DM.Item_de_Estoque_Detalhe1.isempty then
    begin
      DM.Item_de_Estoque_Detalhe1.Inserir(CdCNC,CdLOT,Entidade.CodigoPRD);
      DM.Item_de_Estoque_Detalhe1.Close;
      DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
      DM.Item_de_Estoque_Detalhe1.open;
    end;
  end;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if not DM.Movimento_Fisico1.Inserir(CdCNC,0,Entidade.CodigoPRD,0(*CdFUN*),
          Entidade.CodigoCNC,Entidade.CodigoEMP,530(*Retorno Emp.*),'E',
          Entidade.Quantidade,Item_de_Estoque1.SFisico) then
      Begin
        ShowMessage('Falha ao Gerar Mov. Físico!');
        Raise Exception.Create('');
      end;

      if CdLOT>0 then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
          ' IED_QTD_FISICO=IED_QTD_FISICO-'+VirgPonto(Entidade.Quantidade)+
          ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque1.CodigoPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND LOT_CODIGO='+IntToStr(CdLOT));
      end;

      //Atualizar estoque Fisico e Indisponivel
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
        ' IES_INDISPONIVEL=IES_INDISPONIVEL-'+VirgPonto(Entidade.Quantidade)+
        ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Entidade.Quantidade)+
        ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque1.CodigoPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));
      ExecutaSQL(DM.QR_Comandos,'UPDATE EMPRESTIMO SET '+
        ' EMP_SITUACAO=1,'+
        ' EMP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND EMP_CODIGO='+IntToStr(CdEMP));

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;

  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos
  else
    Entidade.LocalizarCod(CdEMP,CdCNC);
  edtLocalizar.SetFocus;
end;

procedure TfMxEmprestimo.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxEmprestimo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If (SB_SalvaPed.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxEmprestimo.SB_ImprimirClick(Sender: TObject);
var
  Fatura,Entregue:string;
begin
  if (ckbDevolvidos.Checked) AND (ckbFaturados.Checked)  then
    Fatura := ' AND EMP_NOTA_FISCAL_ENT > 0 '
  else if (ckbFaturados.Checked) then
    Fatura := ' AND EMP_NOTA_FISCAL_SAI > 0 '
  else
    Fatura := '';
  if (ckbDevolvidos.Checked) then
    Entregue:=' AND EMP_SITUACAO=1 '
  else
    Entregue:='';


  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione um Demonstração!');
  Application.CreateForm(Trpt_EmprestimoCompleto, rpt_EmprestimoCompleto);
  with rpt_EmprestimoCompleto do
  Begin
    tag := 1;
    if (DM.Configuracao1.Empresa = empMotical) or
       ((DM.Configuracao1.Empresa = 3) and
        (DM.Configuracao1.CodigoCNC = 3)) then //Meia Folha
      report.Options.PageLength := 32;
    if self.Entidade.Demonstracao then
      zrlTitulo.Caption := 'SIAC - DEMONSTRACAO'
    else
      zrlTitulo.Caption := 'SIAC - EMPRESTIMO';
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * FROM EMPRESTIMO '+
      ' WHERE CNC_CODIGO='+IntToStr(fMxEmprestimo.Entidade.CodigoCNC)+
      ' AND CLI_CODIGO='+edtCodigoCLI.Text+
      ' AND CNC_CLIENTE='+edtClienteCNC.Text+
      ' AND EMP_DT_CADASTRO>="'+MesDia(fMxEmprestimo.Entidade.DataCadastro)+
      '" AND EMP_DT_CADASTRO<"'+MesDia(fMxEmprestimo.Entidade.DataCadastro+1)+
      '" '+Fatura+Entregue+
      ' ORDER BY CNC_CODIGO,CLI_CODIGO,EMP_DT_CADASTRO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise exception.Create('Relatório em branco!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxEmprestimo.SB_FaturarClick(Sender: TObject);
var
  Entregue, Nota, sDataOrigem:string;
  vPrecoUnit, PLiquido,PrecoP,PrecoPS,PrecoICMS,PrecoICMSS:Double;
  Trans : Boolean;
  iTipoFrete, iVolume, CdLOT: integer;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione um Demonstração!');
  if (DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto) then
    Raise Exception.Create('Não pode alterar registros desse Centro de Custo!');
  if (ckbDevolvidos.Checked) and (Entidade.NotaFiscalEnt > 0) then
    Raise Exception.Create('Demonstração já Faturada!');
  if (not ckbDevolvidos.Checked) and (Entidade.NotaFiscalSai > 0) then
    Raise Exception.Create('Demonstração já Faturada!');
  if DM.Configuracao1.UF = '' then
    Raise Exception.Create('Defina a sua UF em Configuracões (Gerência)');
  if (ckbDevolvidos.Checked) and (Entidade.NotaFiscalSai = 0) then
    Raise Exception.Create('Demonstração não faturado na Saída!');
  if (Trim(edtUF.Text) = '') then
    Raise Exception.Create('Unidade Federativa do Cliente não identificada!');

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT NTF_CODIGO '+
      ' FROM NOTA_FISCAL '+
      ' WHERE NTF_SITUACAO=0 '+
      ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Open;
    if not IsEmpty then
      Raise exception.Create('Falha ao tentar gerar nota!'+#13+
                             'Existe um nota em aberto!');
  end;

  If MessageDlg('Tem certeza que deseja Faturar esse Demonstração?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

   if (ckbDevolvidos.Checked) then
    Entregue:=' AND EMP_NOTA_FISCAL_SAI = '+IntToStr(Entidade.NotaFiscalSai)+
      ' AND EMP_NOTA_FISCAL_ENT = 0 '+
      ' AND EMP_SITUACAO = 1 '
  else
    Entregue:=' AND EMP_NOTA_FISCAL_SAI = 0 AND EMP_NOTA_FISCAL_ENT = 0 '+
      ' AND EMP_SITUACAO = 0 ';

  Emprestimo2.Close;
  Emprestimo2.SQL.Text:='SELECT * FROM EMPRESTIMO '+
    ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
    ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
    ' AND CNC_CLIENTE='+IntToStr(Entidade.CNCCliente)+
    ' AND EMP_DT_CADASTRO>="'+MesDia(Entidade.DataCadastro)+'" '+
    ' AND EMP_DT_CADASTRO<"'+MesDia(Entidade.DataCadastro+1)+'" '+
    Entregue+
    ' ORDER BY CNC_CODIGO,CLI_CODIGO,EMP_DT_CADASTRO ';
  Emprestimo2.Open;
  if Emprestimo2.IsEmpty then
    Raise Exception.Create('Não irá gerar nota!');

  CdTRN := 1;
  iTipoFrete := 0;
  iVolume := 0;
  If MessageDlg('Será necessário definir Transportadora?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    Application.CreateForm(TfMxSTransportadora, fMxSTransportadora);
    with fMxSTransportadora do
    Begin
      tag:=1;
      Transportadora1.Close;
      Transportadora1.Open;
      Showmodal;
      if CdTRN = 1 then //Padrão
        iTipoFrete := 0
      else
        iTipoFrete := 1;
    end;
    try
      iVolume := StrToInt(InputBox('Volume de Mercadorias', 'Volume:', '0'));
    except
      Raise exception.Create('Volume inválido!');
    end;
  end;

  PLiquido  := 0;
  PrecoP    := 0;
  PrecoPS   := 0;
  PrecoICMS := 0;
  PrecoICMSS:= 0;

  with Emprestimo2 do
  Begin
    First;
    while not EOF do
    Begin
      Produto1.Close;
      Produto1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
      Produto1.Open;
      vPrecoUnit := Arredonda(Produto1.PrecoCompra);
      if vPrecoUnit <= 0 then
        Raise Exception.Create('Produto '+Produto1.Descricao+' sem preço de Compra!');
      Classificacao_fiscal1.Close;
      if Produto1.CodigoCLF = 0 then
        Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=1
      else
        Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCLF;
      Classificacao_fiscal1.Open;
      Classificacao_fiscal2.Close;
      if Produto1.CodigoCTP = 0 then
        Classificacao_fiscal2.ParamByName('CLF_CODIGO').asInteger:=1
      else
        Classificacao_fiscal2.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCTP;
      Classificacao_fiscal2.Open;
      PLiquido:=PLiquido+Produto1.PesoLiquido;
      if Produto1.CodigoCLF = 5 then
      Begin
        PrecoPS:=PrecoPS+Arredonda(Arredonda(vPrecoUnit)*Quantidade);
        PrecoICMSS:=PrecoICMSS+Arredonda(Arredonda(vPrecoUnit)*Quantidade*Classificacao_fiscal2.ICMS/100);
      end
      else
      Begin
        PrecoP:=PrecoP+Arredonda(Arredonda(vPrecoUnit)*Quantidade);
        PrecoICMS:=PrecoICMS+Arredonda(Arredonda(vPrecoUnit)*Quantidade*Classificacao_fiscal1.ICMS/100);
      end;
      Next;
    end;
  end;

  DM.QR_Consultas.Close;
  DM.QR_Consultas.SQL.Text:='SELECT * FROM CATRACA '+
    ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
    ' AND CTR_TIPO_NOTA=0';
  DM.QR_Consultas.Open;
  if DM.QR_Consultas.IsEmpty then
    Raise Exception.Create('Catraca inválida!')
  else
    Nota:=DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asString;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      with Emprestimo2 do
      Begin
        if not ckbDevolvidos.Checked then //Saida de Emprestimo
        Begin
          if (edtUF.Text = DM.Configuracao1.UF) then
            NotaFiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoCNC,CodigoEMP,5912,0(*CodigoFOR*),
              CdTRN(*CodigoTRN*),CNCCliente,CodigoCLI,
              0(*CodigoFUN*),DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asInteger,
              DM.QR_Consultas.FieldByName('CTR_NOTA_AIDF').asInteger,1,366(*Tipo*),
              0(*TipoTransporte*),iTipoFrete,DM.QR_Consultas.FieldByName('CTR_NOTA_SELO').asInteger,
              2(*Situacao*),0(*Conhecimento*),1 (*Nota*),0(*CodPag*), 0(*CodPagamento2*),0(*Arquiteto*),
              PrecoP(*Base*),PrecoICMS(*ICMS*),PrecoPS(*BaseS*),PrecoICMSS(*ICMSS*),0(*TotalServiço*),
              PrecoP+PrecoPS,PrecoP+PrecoPS,0(*IPI*),0(*Frete*),0,iVolume,0 (*Base ISS*),
              0 (*ISS*), 0(*Outras*),DM.QR_Consultas.FieldByName('CTR_NOTA_SERIE').asString,
              DM.QR_Consultas.FieldByName('CTR_NOTA_SUBSERIE').asString,
              'REMESSA PARA DEMONSTRACAO CONFORME DEC. 24569/97 ART 682'+#13+
              'TODA MERCADORIA DEVE SER CONFERIDA NO RECEBIMENTO.'+#13+
              'EXIJA SUA NOTA FISCAL, ELA E A SUA SEGURANCA DE QUALIDADE LBM.',''(*UF*),
              DM.Configuracao1.Data,DM.Configuracao1.Data)
          else
            NotaFiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoCNC,CodigoEMP,6912,0(*CodigoFOR*),
              CdTRN(*CodigoTRN*),CNCCliente,CodigoCLI,
              0(*CodigoFUN*),DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asInteger,
              DM.QR_Consultas.FieldByName('CTR_NOTA_AIDF').asInteger,1,366(*Tipo*),
              0(*TipoTransporte*),iTipoFrete,DM.QR_Consultas.FieldByName('CTR_NOTA_SELO').asInteger,
              2(*Situacao*),0(*Conhecimento*),1 (*Nota*),0(*CodPag*), 0(*CodPagamento2*),0(*Arquiteto*),
              PrecoP(*Base*),PrecoICMS(*ICMS*),PrecoPS(*BaseS*),PrecoICMSS(*ICMSS*),0(*TotalServiço*),
              PrecoP+PrecoPS,PrecoP+PrecoPS,0(*IPI*),0,0,iVolume,0 (*Base ISS*),
              0 (*ISS*),0(*Outras*),DM.QR_Consultas.FieldByName('CTR_NOTA_SERIE').asString,
              DM.QR_Consultas.FieldByName('CTR_NOTA_SUBSERIE').asString,
              'REMESSA PARA DEMONSTRACAO CONFORME DEC. 24569/97 ART 682'+#13+
              'TODA MERCADORIA DEVE SER CONFERIDA NO RECEBIMENTO.'+#13+
              'EXIJA SUA NOTA FISCAL, ELA E A SUA SEGURANCA DE QUALIDADE LBM.',''(*UF*),
              DM.Configuracao1.Data,DM.Configuracao1.Data)
        end
        else //Entrada de Emprestimo
        Begin
          with NotaFiscal2 do
          Begin
            Close;
            SQL.Text := 'SELECT * FROM NOTA_FISCAL '+
              ' WHERE NTF_PEDIDO='+IntToStr(CodigoEMP)+
              ' AND NTF_TIPO_NOTA=366 '+
              ' ORDER BY NTF_DT_EMISSAO ';
            Open;
            if IsEmpty then
              Raise Exception.Create('Não foi encontrado Nota de Origem!')
            else
              sDataOrigem := DateToStr(NotaFiscal2.DataEmissao);
          end;
          if (edtUF.Text = DM.Configuracao1.UF) then
            NotaFiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoCNC,CodigoEMP,1913,0(*CodigoFOR*),
              CdTRN(*CodigoTRN*),CNCCliente,CodigoCLI,
              0(*CodigoFUN*),DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asInteger,
              DM.QR_Consultas.FieldByName('CTR_NOTA_AIDF').asInteger,0,366(*Tipo*),
              0(*TipoTransporte*),iTipoFrete,DM.QR_Consultas.FieldByName('CTR_NOTA_SELO').asInteger,2,0,1 (*Nota*), 0(*CodPagamento*), 0(*CodPagamento2*),0(*Arquiteto*),
              PrecoP(*Base*),PrecoICMS(*ICMS*),PrecoPS(*BaseS*),PrecoICMSS(*ICMSS*),0,
              PrecoP+PrecoPS,PrecoP+PrecoPS,0(*IPI*),0,0,iVolume,0 (*Base ISS*),
              0 (*ISS*),0(*Outras*),DM.QR_Consultas.FieldByName('CTR_NOTA_SERIE').asString,
              DM.QR_Consultas.FieldByName('CTR_NOTA_SUBSERIE').asString,
              'RETORNO DEM. REFERENTE A NF '+edtNotaFiscalSaida.Text+' EM '+sDataOrigem+#13+
              'CONFORME DECRETO 24569/97 ART. 672'+#13+
              'TODA MERCADORIA DEVE SER CONFERIDA NO RECEBIMENTO.'+#13+
              'EXIJA SUA NOTA FISCAL, ELA E A SUA SEGURANCA DE QUALIDADE LBM.',''(*UF*),
              DM.Configuracao1.Data,DM.Configuracao1.Data)
          else
            NotaFiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoCNC,CodigoEMP,2913,0(*CodigoFOR*),
              CdTRN(*CodigoTRN*),CNCCliente,CodigoCLI,0(*CodigoFUN*),
              DM.QR_Consultas.FieldByName('CTR_NOTA_FISCAL').asInteger,
              DM.QR_Consultas.FieldByName('CTR_NOTA_AIDF').asInteger,0,366(*Tipo*),
              0(*TipoTransporte*),iTipoFrete(*TipoFrete*),DM.QR_Consultas.FieldByName('CTR_NOTA_SELO').asInteger,2,0,1 (*Nota*), 0(*CodPagamento*), 0(*CodPagamento2*),0(*Arquiteto*),
              PrecoP(*Base*),PrecoICMS(*ICMS*),PrecoPS(*BaseS*),PrecoICMSS(*ICMSS*),0,PrecoP+PrecoPS,PrecoP+PrecoPS,0(*IPI*),
              0,0,iVolume,0 (*Base ISS*),0 (*ISS*),0(*Outras*),
              DM.QR_Consultas.FieldByName('CTR_NOTA_SERIE').asString,
              DM.QR_Consultas.FieldByName('CTR_NOTA_SUBSERIE').asString,
              'RETORNO DEM. REFERENTE A NF '+edtNotaFiscalSaida.Text+' EM '+sDataOrigem+#13+
              'CONFORME DECRETO 24569/97 ART. 672'+#13+
              'TODA MERCADORIA DEVE SER CONFERIDA NO RECEBIMENTO.'+#13+
              'EXIJA SUA NOTA FISCAL, ELA E A SUA SEGURANCA DE QUALIDADE LBM.',''(*UF*),
              DM.Configuracao1.Data,DM.Configuracao1.Data);
        end;
      end;

      with Emprestimo2 do
      Begin
        First;
        while not EOF do
        Begin
          CdLOT := CodigoLOT;
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
          Produto1.Open;
          vPrecoUnit := Arredonda(Produto1.PrecoCompra);
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
          Item_de_Estoque1.Open;
          If Item_de_Estoque1.IsEmpty then
          Begin
            if not Item_de_Estoque1.Inserir(DM.Configuracao1.CodigoCNC,CodigoPRD,0(*CdFUN*),
                     0,0,0,0,0,0,0,0,0,0,0,0) then
              Raise Exception.Create('');
            Item_de_Estoque1.Close;
            Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
            Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
            Item_de_Estoque1.Open;
          end;

          if CdLOT > 0 then
          Begin
            DM.Item_de_Estoque_Detalhe1.Close;
            DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
            DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
            DM.Item_de_Estoque_Detalhe1.open;
            If DM.Item_de_Estoque_Detalhe1.isempty then
            begin
              DM.Item_de_Estoque_Detalhe1.Inserir(DM.Configuracao1.CodigoCNC,CdLOT,CodigoPRD);
              DM.Item_de_Estoque_Detalhe1.Close;
              DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
              DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := CdLOT;
              DM.Item_de_Estoque_Detalhe1.open;
            end;
          end;

          if not ckbDevolvidos.Checked then //Saída do Produto
          Begin
            if not DM.Mov_Est_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,CodigoPRD,0(*CdFUN*),0,
               CodigoCNC,CodigoEMP,366,'S', Quantidade,
               Item_de_Estoque1.SFiscal,
               Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*)) then
            Begin
              ShowMessage('Falha ao inserir Movimento Fiscal!');
              Raise  exception.Create('');
            end;
            if CdLOT>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISCAL=IED_QTD_FISCAL-'+VirgPonto(Quantidade)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND LOT_CODIGO='+IntToStr(CdLOT));
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SFISCAL=IES_SFISCAL-'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));
          end
          else //Entrada do Produto
          Begin
            if not DM.Mov_Est_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,CodigoPRD,0(*CdFUN*),0,
               CodigoCNC,CodigoEMP,366,'E', Quantidade,
               Item_de_Estoque1.SFiscal,
               Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*)) then
            Begin
              ShowMessage('Falha ao inserir Movimento Fiscal!');
              Raise  exception.Create('');
            end;
            if CdLOT>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISCAL=IED_QTD_FISCAL+'+VirgPonto(Quantidade)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND LOT_CODIGO='+IntToStr(CdLOT));
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));
          end;
          if not Item_Nota_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,NotaFiscal1.SCodigo,
              CodigoPRD,CodigoLOT,0,17(*AliquotaICMS*),0(*AliquotaISS*),
              Quantidade,vPrecoUnit,0(*Desconto*),0(*AliquotaIPI*),0(*Bonificação*),0(*Amostra*),
              Trim(Produto1.Descricao)+' '+Trim(Produto1.Referencia)+' '+Trim(Produto1.Marca)) then
            Raise exception.Create('');

          if ckbDevolvidos.Checked then
            ExecutaSQL(DM.QR_Comandos,'UPDATE EMPRESTIMO SET '+
              ' EMP_NOTA_FISCAL_ENT='+Nota+
              ',EMP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
              ' AND EMP_CODIGO='+IntToStr(Emprestimo2.CodigoEMP))
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE EMPRESTIMO SET '+
              ' EMP_NOTA_FISCAL_SAI='+Nota+
              ',EMP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
              ' AND EMP_CODIGO='+IntToStr(Emprestimo2.CodigoEMP));
          Next;
        end;
      end;

      ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
        ' CTR_NOTA_FISCAL=CTR_NOTA_FISCAL+1 '+
        ',CTR_NOTA_SELO=CTR_NOTA_SELO+1 '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND CTR_TIPO_NOTA=0');

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;

  if (DM.Configuracao1.Empresa IN [empEletro,empCreator,empAndrea,empHOPE]) then //Eletro ou Creator ou Andrea ou HOPE
  Begin
    Application.CreateForm(Trpt_NotaFiscalEletro, rpt_NotaFiscalEletro);
    with rpt_NotaFiscalEletro do
    Begin
      tag := 1;
      Desc1:=0;
      Entidade.Close;
      Entidade.ParamByName('CNC_ORIGEM').asinteger:= self.Entidade.CodigoCNC;      
      Entidade.ParamByName('CNC_CODIGO').asinteger:= self.Entidade.CodigoCNC;
      Entidade.ParamByName('NTF_CODIGO').asInteger:= self.NotaFiscal1.SCodigo;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Nota não gerada!');
      report.Preview;
      Close;
    end;
  end
  else if DM.Configuracao1.Empresa = empLBM then
  Begin
    Application.CreateForm(Trpt_NotaFiscalLBM, rpt_NotaFiscalLBM);
    with rpt_NotaFiscalLBM do
    Begin
      tag := 1;
      Desc1:=0;
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := fMxEmprestimo.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := fMxEmprestimo.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := fMxEmprestimo.NotaFiscal1.SCodigo;
      Item_Nota_Fiscal10.Open;
      if Item_Nota_Fiscal10.IsEmpty then
        Raise Exception.Create('Nota não gerada!');
      report.Preview;
      Close;
    end;
  end
  else if DM.Configuracao1.Empresa = empMotical then
  Begin
    Application.CreateForm(Trpt_NotaFiscalMotCal, rpt_NotaFiscalMotCal);
    with rpt_NotaFiscalMotCal do
    Begin
      tag := 1;
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger:=fMxEmprestimo.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger:=fMxEmprestimo.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger:=fMxEmprestimo.NotaFiscal1.SCodigo;
      Item_Nota_Fiscal10.Open;
      if Item_Nota_Fiscal1.IsEmpty then
        Raise Exception.Create('Nota não gerada!');
      report.Preview;
      Close;
    end;
  end
  else //if DM.Configuracao1.Empresa = empLuciano then
  Begin
    Application.CreateForm(Trpt_NotaFiscalLuciano, rpt_NotaFiscalLuciano);
    with rpt_NotaFiscalLuciano do
    Begin
      tag := 1;
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger:=fMxEmprestimo.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger:=fMxEmprestimo.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger:=fMxEmprestimo.NotaFiscal1.SCodigo;
      Item_Nota_Fiscal10.Open;
      if Item_Nota_Fiscal10.IsEmpty then
        Raise Exception.Create('Nota não gerada!');
      report.Preview;
      Close;
    end;
  end;
  //else
    //ShowMessage('Empresa sem Nota Cadastrada, ou máquina desconfigurada!');
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxEmprestimo.ckbDevolvidosClick(Sender: TObject);
var
  sFiltro: string;
begin
  if ckbDevolvidos.Checked and ckbFaturados.Checked then
    sFiltro  := ' AND EMP_SITUACAO=1 AND EMP_NOTA_FISCAL_ENT > 0 '
  else if ckbDevolvidos.Checked then
    sFiltro  := ' AND EMP_SITUACAO=1 AND EMP_NOTA_FISCAL_ENT = 0 '
  else if ckbFaturados.Checked then
    sFiltro  := ' AND EMP_SITUACAO=0 AND EMP_NOTA_FISCAL_SAI > 0 '
  else
    sFiltro  := ' AND EMP_SITUACAO=0 AND EMP_NOTA_FISCAL_SAI = 0 ';

  Entidade.Close;
  Entidade.SQL.Text:='SELECT * FROM EMPRESTIMO '+
    ' WHERE CNC_CODIGO=:CNC_CODIGO '+
    sFiltro+
    ' ORDER BY CLI_CODIGO,EMP_CODIGO DESC ';
  Entidade.Open;
end;

procedure TfMxEmprestimo.ckbFaturadosClick(Sender: TObject);
var
  sFiltro: string;
begin
  if ckbDevolvidos.Checked and ckbFaturados.Checked then
    sFiltro  := ' AND EMP_SITUACAO=1 AND EMP_NOTA_FISCAL_ENT > 0 '
  else if ckbDevolvidos.Checked then
    sFiltro  := ' AND EMP_SITUACAO=1 AND EMP_NOTA_FISCAL_ENT = 0 '
  else if ckbFaturados.Checked then
    sFiltro  := ' AND EMP_SITUACAO=0 AND EMP_NOTA_FISCAL_SAI > 0 '
  else
    sFiltro  := ' AND EMP_SITUACAO=0 AND EMP_NOTA_FISCAL_SAI = 0 ';

  Entidade.Close;
  Entidade.SQL.Text:='SELECT * FROM EMPRESTIMO '+
    ' WHERE CNC_CODIGO=:CNC_CODIGO '+
    sFiltro+
    ' ORDER BY CLI_CODIGO,EMP_CODIGO DESC ';
  Entidade.Open;
end;

procedure TfMxEmprestimo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else
      Close;
  end
  else If key=chr(13) then
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end;
  end
  else if key=chr(32) then
  Begin
    If edtCodigoPRD.Focused then
    Begin
      edtCodigoPRD.Clear;
      key:=chr(0);
      if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
      Begin
        Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
        with fMxSPedProdMotcal do
        Begin
          Tag:=30;
          ShowModal;
        end;
      end
      else
      Begin
        Application.CreateForm(TfMxSPedProd, fMxSPedProd);
        with fMxSPedProd do
        Begin
          Tag:=30;
          ShowModal;
        end;
      end;
      edtQuantidade.SetFocus;
    End
    else if edtCodigoCLI.Focused then
    Begin
      edtCodigoCLI.Clear;
      key:=chr(0);
      Application.CreateForm(TfCadCli, fCadCli);
      fCadCli.tag:=15;
      fCadCli.CentroCusto2.open;
      fCadCli.CentroCusto2.LocalizarCod(StrToInt(edtClienteCNC.Text));
      fCadCli.dblCentroDeCusto.KeyValue:=StrToInt(edtClienteCNC.Text);
      fCadCli.Showmodal;
    end;
  end
  else if edtCodigoPRD.Focused then
  Begin
    if DM.Configuracao1.Empresa <> empHope then
    Begin
      If key='-' then
        key:='0'
      else If UpperCase(key)='C' then
        key:='0'
      else If UpperCase(key)='D' then
        key:='6';
    end;
  end;
end;

procedure TfMxEmprestimo.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirPed.Enabled    := not Habilitar;
  ExcluirPed.Enabled    := not Habilitar;
  SalvarPed.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarPed.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarPed.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoPed.Enabled    := not Habilitar;
  SB_LocPed.Enabled     := not Habilitar;
  SB_ExcPed.Enabled     := not Habilitar;
  SB_SalvaPed.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled    := ((Cabecalho=1) and Habilitar);

  ckbFaturados.Enabled  := not Habilitar;
  ckbDevolvidos.Enabled := not Habilitar;
  SB_Reabre.Enabled     := not Habilitar;
  SB_Faturar.Enabled    := not Habilitar;
  SB_Imprimir.Enabled   := not Habilitar;
  SB_Fechar.Enabled     := not Habilitar;

  edtLocalizar.Enabled := not Habilitar;
  if Habilitar then
    edtLocalizar.Color := AlteraCorComponentes
  else
    edtLocalizar.Color := clWindow;
  cmbCampo.Enabled     := not Habilitar;
  if Habilitar then
    cmbCampo.Color     :=AlteraCorComponentes
  else
    cmbCampo.Color     :=clWindow;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfMxEmprestimo.SB_ObservacaoClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Registro!');
  AtualizaControles(1, True);
  edtObservacao.Enabled := True;
  edtObservacao.SetFocus;
end;

procedure TfMxEmprestimo.Emprestimo1AfterOpen(DataSet: TDataSet);
begin
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtRazaoSocial.Clear;
    edtCidade.Clear;
    edtUF.Clear;
    edtProduto.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
  end;
end;

procedure TfMxEmprestimo.edtCodigoLOTExit(Sender: TObject);
begin
  if (not VerificaInteiroBranco(edtCodigoPRD.Text)) or
     (not VerificaInteiroBranco(edtCodigoLOT.Text)) then
    edtCodigoLOT.Text := '0';

  if StrToInt(edtCodigoLOT.Text) <= 0 then
  Begin
    edtCodigoLOT.Text := '0';
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT LOT_CODIGO '+
      ' FROM LOTE '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+
      ' AND LOT_CODIGO='+edtCodigoLOT.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoLOT.Text := '0';
      Exit;
    end;
  end;
end;

procedure TfMxEmprestimo.edtCodigoLOTKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadLote, fCadLote);
    with fCadLote do
    Begin
      tag:=4;
      edtCodigoPRD.text := self.edtCodigoPRD.Text;
      edtProduto.Text := self.edtProduto.Text;
      ShowModal;
    end;
  end;
end;

end.
