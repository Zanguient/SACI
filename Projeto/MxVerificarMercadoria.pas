unit MxVerificarMercadoria;
//0-Compra; 1-Transferencia; 2-Pre-recebimento; 3-Recebimento; 4-Inventário; 5-Tela Principal
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Transportadora, DBCtrls, Menus,
  Verificar_Mercadoria, Produto;

type
  TfMxVerificarMercadoria = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    edtPedido: TEdit;
    Label4: TLabel;
    edtDescricao: TEdit;
    Panel2: TPanel;
    DSVerificar_Mercadoria1: TDataSource;
    MainMenu2: TMainMenu;
    SairCab: TMenuItem;
    Panel3: TPanel;
    DBGrid5: TDBGrid;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtQuantidade: TEdit;
    SB_NovoItem: TSpeedButton;
    SB_ExcItem: TSpeedButton;
    SB_SalvaItem: TBitBtn;
    SB_CancItem: TBitBtn;
    ItemTabela1: TMenuItem;
    IncluirItem: TMenuItem;
    ExcluirItem: TMenuItem;
    N1: TMenuItem;
    SalvarItem: TMenuItem;
    CancelarItem: TMenuItem;
    Label17: TLabel;
    Verificar_Mercadoria1: TVerificar_Mercadoria;
    Verificar_Mercadoria1CNC_CODIGO: TIntegerField;
    Verificar_Mercadoria1VER_TIPO: TIntegerField;
    Verificar_Mercadoria1VER_PEDIDO: TIntegerField;
    Verificar_Mercadoria1PRD_CODIGO: TIntegerField;
    Verificar_Mercadoria1VER_VOLUME: TIntegerField;
    Verificar_Mercadoria1VER_QUANTIDADE: TFloatField;
    Verificar_Mercadoria1Referencia: TStringField;
    Verificar_Mercadoria1Detalhe: TStringField;
    Verificar_Mercadoria1Caracteristica: TStringField;
    Label2: TLabel;
    edtVolume: TEdit;
    edtTipo: TEdit;
    Verificar_Mercadoria1Produto: TStringField;
    SB_Verificar: TSpeedButton;
    N2: TMenuItem;
    Verificar1: TMenuItem;
    SB_AltItem: TSpeedButton;
    AlterarItem: TMenuItem;
    edtCodigoCNC: TEdit;
    SB_Imprimir: TSpeedButton;
    ImprimirRelacao1: TMenuItem;
    SB_ExcluirTodos: TSpeedButton;
    Etiquetas1: TProduto;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_NovoItemClick(Sender: TObject);
    procedure SB_ExcItemClick(Sender: TObject);
    procedure SB_SalvaItemClick(Sender: TObject);
    procedure SB_CancItemClick(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure Item_Tabela_de_Precos1AfterScroll(DataSet: TDataSet);
    procedure Verificar_Mercadoria1BeforeOpen(DataSet: TDataSet);
    procedure Verificar_Mercadoria1CalcFields(DataSet: TDataSet);
    procedure SB_VerificarClick(Sender: TObject);
    procedure SB_AltItemClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure SB_ExcluirTodosClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    Entidade : TVerificar_Mercadoria;
    CancelarLoc: Boolean;
  end;

var
  fMxVerificarMercadoria: TfMxVerificarMercadoria;

implementation
Uses UDM, Funcoes, MxMensagem, MxSPediProdMotCal, MxSPediProd,
  UVerificarMercadoria;
{$R *.DFM}

procedure TfMxVerificarMercadoria.FormCreate(Sender: TObject);
begin
  Entidade := Verificar_Mercadoria1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_VerifMercadoria_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxVerificarMercadoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_VerifMercadoria_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxVerificarMercadoria.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxVerificarMercadoria.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  if tag = 5 then //Tela Principal - Não verifica
  Begin
    N2.Visible := False;
    Verificar1.Visible := False;
    SB_Verificar.Visible := False;
  end;
  
  Entidade.Open;
  edtTipo.Text := IntToStr(self.Tag);
  SB_NovoItemClick(sender);
end;

procedure TfMxVerificarMercadoria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then                                               
  Begin
    if SB_CancItem.Enabled then
    Begin
      SB_CancItem.SetFocus;
      SB_CancItemClick(sender);
    end
    else
     Close;
  end
  else if key=#13 then
  Begin
    if SB_SalvaItem.Enabled then
    Begin
      Key := #0;
      SB_SalvaItem.SetFocus;
      SB_SalvaItemClick(sender);
    end;
  end
  else if ((edtQuantidade.Focused)) and (Key = '.') then
    Key := ',';
end;

procedure TfMxVerificarMercadoria.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  SairCab.Enabled       := not Habilitar;
  IncluirItem.Enabled    := not Habilitar;
  AlterarItem.Enabled    := not Habilitar;
  ExcluirItem.Enabled    := not Habilitar;
  SalvarItem.Enabled     := ((Cabecalho<>1) and Habilitar);
  CancelarItem.Enabled   := ((Cabecalho<>1) and Habilitar);
  SB_NovoItem.Enabled    := not Habilitar;
  SB_AltItem.Enabled     := not Habilitar;
  SB_ExcItem.Enabled     := not Habilitar;
  SB_SalvaItem.Enabled   := ((Cabecalho<>1) and Habilitar);
  SB_CancItem.Enabled    := ((Cabecalho<>1) and Habilitar);

  Verificar1.Enabled       := not Habilitar;
  ImprimirRelacao1.Enabled := not Habilitar;
  SB_Verificar.Enabled     := not Habilitar;
  SB_ExcluirTodos.Enabled  := not Habilitar;
  SB_Imprimir.Enabled      := not Habilitar;
  //
  DBGrid5.Enabled    := not Habilitar;
end;


procedure TfMxVerificarMercadoria.SB_NovoItemClick(Sender: TObject);
begin
  if not Entidade.Active then
    Entidade.Open;

  Entidade.PreparaInsercao;
  edtProduto.Clear;
  AtualizaControles(2,True);
  try
    edtCodigoPRD.SetFocus;
  except
  end;
end;

procedure TfMxVerificarMercadoria.SB_ExcItemClick(Sender: TObject);
var
  CdCNC, CdPRD, iPedido: integer;
  Trans: Boolean;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Produto!');

  CdCNC := Entidade.CodigoCNC;
  iPedido := Entidade.Pedido;
  CdPRD := Entidade.CodigoPRD;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Log Gerado na Função
      ExecutaSQL(DM.QR_Consultas, 'DELETE FROM VERIFICAR_MERCADORIA '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND VER_PEDIDO='+IntToStr(iPedido)+
        ' AND VER_TIPO='+IntToStr(Self.Tag)+
        ' AND PRD_CODIGO='+IntToStr(CdPRD));

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;
      Entidade.Close;
      Entidade.Open;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
  if Entidade.isEmpty then
    edtProduto.Clear;
end;

procedure TfMxVerificarMercadoria.SB_SalvaItemClick(Sender: TObject);
var
  iInserir: Boolean;
begin
  if Entidade.Estado = 1 then
    iInserir := True
  else
    iInserir := False;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Exit
  else if StrToInt(edtCodigoPRD.Text) <= 0 then
    Exit;

  if not VerificaFloatBranco(edtQuantidade.Text) then
    Raise exception.Create('Quantidade inválida!');
  if StrToFloat(edtQuantidade.Text) <= 0 then
    edtQuantidade.Text := '1';

  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(2,False);
    if iInserir then
      SB_NovoItemClick(sender);
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxVerificarMercadoria.SB_CancItemClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(2,False);
  if Entidade.isEmpty then
    edtProduto.Clear
  else
    edtProduto.Text := Entidade.FieldByName('Produto').asString;
end;

procedure TfMxVerificarMercadoria.edtCodigoPRDExit(Sender: TObject);
begin
  if SB_CancItem.Focused then
    Exit;

  edtProduto.Clear;

  with DM.Produto1 do
  Begin
    try
      if (not Active) or
         (CodigoPRD <> StrToInt(edtCodigoPRD.Text)) then
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
        Open;
      end;
    except
      Close;
      ParamByName('PRD_CODIGO').asInteger := -10;
      Open;
    end;
    if IsEmpty then
    Begin
      with DM.Codigo_Barras1 do
      Begin
        if (not Active) or
           (CodigoCDB_Barras <> edtCodigoPRD.Text) then
        Begin
          Close;
          paramByName('CDB_CODIGO_BARRAS').asString := edtCodigoPRD.Text;
          Open;
        end;
        if not IsEmpty then
        Begin
          edtCodigoPRD.Text := IntToStr(CodigoCDB_Entrada);
          DM.Produto1.Close;
          DM.Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
          DM.Produto1.Open;
        end;
      end;
    End;
    if IsEmpty and
       (Length(edtCodigoPRD.Text) > 3) then //Referências maiores que 3 caracteres
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT PRD_CODIGO '+
          ' FROM PRODUTO '+
          ' WHERE PRD_REFERENCIA="'+edtCodigoPRD.Text+'"';
        Open;
        if not IsEmpty then
          edtCodigoPRD.Text := FieldByName('PRD_CODIGO').asString
        else
          edtCodigoPRD.Text := '-1';
      end;
      DM.Produto1.Close;
      DM.Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
      DM.Produto1.Open;
    End;
    if IsEmpty then
    Begin
      Showmessage('Produto inexistente!');
      edtCodigoPRD.SetFocus;
      Exit;
    End;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PRD_CODIGO FROM VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(self.Tag)+
      ' AND VER_PEDIDO='+edtPedido.Text+
      ' AND PRD_CODIGO='+edtCodigoPRD.Text;
    Open;
    If not IsEmpty Then
    Begin
      ExecutaSQL(DM.QR_Comandos, 'UPDATE VERIFICAR_MERCADORIA SET '+
        ' VER_QUANTIDADE=VER_QUANTIDADE+1 '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND VER_TIPO='+IntToStr(self.Tag)+
        ' AND VER_PEDIDO='+edtPedido.Text+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text);
      SB_CancItemClick(sender);
      Entidade.Close;
      Entidade.Open;
      SB_NovoItemClick(sender);
      Exit;
    end;
  end;

  if DM.Configuracao1.Empresa = empEletro then
    edtProduto.text := Trim(DM.Produto1.Descricao+' '+DM.Produto1.Caracteristica)
  else if DM.configuracao1.Empresa = empHope then
    edtProduto.text := DM.Produto1.Descricao+' '+DM.Produto1.Referencia
  else
    edtProduto.text := DM.Produto1.Descricao;
  edtVolume.Text := IntToStr(Trunc(DM.Produto1.Estmedio));
end;

procedure TfMxVerificarMercadoria.Item_Tabela_de_Precos1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  if Entidade.isEmpty then
    edtProduto.Clear
  else
    edtProduto.Text := Entidade.FieldByName('Produto').asString;
end;

procedure TfMxVerificarMercadoria.Verificar_Mercadoria1BeforeOpen(
  DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger := StrToInt(edtCodigoCNC.Text);
  Entidade.ParamByName('VER_TIPO').asInteger   := self.Tag;
  Entidade.ParamByName('VER_PEDIDO').asInteger := StrToInt(edtPedido.Text);
end;

procedure TfMxVerificarMercadoria.Verificar_Mercadoria1CalcFields(
  DataSet: TDataSet);
begin
  with DM.Produto1 do
  Begin
    if (not Active) or
       (Entidade.CodigoPRD <> CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    Entidade.FieldByName('Produto').asString        := Descricao;
    Entidade.FieldByName('Detalhe').asString        := Detalhe;
    Entidade.FieldByName('Referencia').asString     := Referencia;
    Entidade.FieldByName('Caracteristica').asString := Caracteristica;
  end;
end;

procedure TfMxVerificarMercadoria.SB_VerificarClick(Sender: TObject);
var
  vQtdVerificada, vQtdPedido: Double;
  sProduto, mensagem: string;
  vProblema: Boolean;
begin
  if tag = 5 then //Tela Principal
    Exit;

  vProblema := False;
  Entidade.Close;
  Entidade.Open;


  if Entidade.IsEmpty then
    Exit;

  while not Entidade.Eof do
  Begin
    with DM.Produto1 do
    Begin
      if CodigoPRD <> Entidade.CodigoPRD then
      Begin
        Close;
        ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
        Open;
      end;
    end;
    if DM.Configuracao1.Empresa = empEletro then
      sProduto       := IntToStr(DM.Produto1.CodigoPRD)+'-'+DM.Produto1.Descricao+' '+DM.Produto1.Caracteristica
    else if DM.Configuracao1.Empresa = empHope then
      sProduto       := IntToStr(DM.Produto1.CodigoPRD)+'-'+DM.Produto1.Descricao+' '+DM.Produto1.Referencia
    else
      sProduto       := IntToStr(DM.Produto1.CodigoPRD)+'-'+DM.Produto1.Descricao;
    vQtdVerificada := Arredonda(Entidade.Quantidade/Entidade.Volume);
    with DM.QR_Consultas do
    Begin
      Close;
      vQtdPedido := -1;
      if self.Tag = 0 then //Pedido de Compra
      Begin
        SQL.Text := 'SELECT * FROM ITEM_DE_PEDIDO_DE_COMPRA '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PCP_CODIGO='+IntToStr(Entidade.Pedido)+
          ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
        Open;
        vQtdPedido := Arredonda(FieldByName('IPC_QUANTIDADE').asFloat+FieldByName('IPC_BONIFICACAO').asFloat);
      end
      else if self.Tag = 1 then //Transferência
      Begin
        SQL.Text := 'SELECT * FROM ITEM_DE_TRANSFERENCIA '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND TRF_CODIGO='+IntToStr(Entidade.Pedido)+
          ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
        Open;
        vQtdPedido := Arredonda(FieldByName('ITR_QUANTIDADE').asFloat);
      end
      else if self.Tag = 2 then //Pre-Recebimento
      Begin
        SQL.Text := 'SELECT * FROM ITEM_DE_PRE_RECEBIMENTO '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND PRC_CODIGO='+IntToStr(Entidade.Pedido)+
          ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
        Open;
        vQtdPedido := Arredonda(FieldByName('IPR_QUANTIDADE').asFloat);
      end
      else if self.Tag = 3 then //Recebimento
      Begin
        SQL.Text := 'SELECT * FROM ITEM_DE_RECEBIMENTO '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND REC_CODIGO='+IntToStr(Entidade.Pedido)+
          ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
        Open;
        vQtdPedido := Arredonda(FieldByName('IRC_QUANTIDADE').asFloat);
      end
      else if self.Tag = 4 then //Inventário
      Begin
        SQL.Text := 'SELECT * FROM ITEM_DE_INVENTARIO '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND INV_CODIGO='+IntToStr(Entidade.Pedido)+
          ' AND PRD_CODIGO='+IntToStr(Entidade.CodigoPRD);
        Open;
        vQtdPedido := Arredonda(FieldByName('IIV_QUANTIDADE').asFloat);
      end
      else if self.Tag = 5 then //Tela Principal
      Begin
        //Não Verifica
      end;
      if IsEmpty then
      Begin
        mensagem := mensagem + '  Produto ' + sProduto + ' não encontrado no pedido!'+#13+#10;
        vProblema := True;
      end
      else if vQtdPedido > vQtdVerificada then
      Begin
        mensagem := mensagem + '  Produto ' + sProduto + ' faltando ' + Format('%.2f',[vQtdPedido-vQtdVerificada]) + ' volume(s)!' + #13+#10;
        vProblema := True;
      end
      else if vQtdPedido < vQtdVerificada then
      Begin
        mensagem := mensagem + '  Produto ' + sProduto + ' sobrando ' + Format('%.2f',[vQtdVerificada-vQtdPedido]) + ' volume(s)!' + #13+#10;
        vProblema := True;
      end;
    end;
    Entidade.Next;
  end;

  //Verificar se ficou faltando produto
  with DM.QR_Consultas do
  Begin
    Close;
    if self.Tag = 0 then //Pedido de Compra
    Begin
      SQL.Text := 'SELECT * FROM ITEM_DE_PEDIDO_DE_COMPRA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PCP_CODIGO='+IntToStr(Entidade.Pedido);
    end
    else if self.Tag = 1 then //Transferência
    Begin
      SQL.Text := 'SELECT * FROM ITEM_DE_TRANSFERENCIA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND TRF_CODIGO='+IntToStr(Entidade.Pedido);
    end
    else if self.Tag = 2 then //Pre-Recebimento
    Begin
      SQL.Text := 'SELECT * FROM ITEM_DE_PRE_RECEBIMENTO '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PRC_CODIGO='+IntToStr(Entidade.Pedido);
    end
    else if self.Tag = 3 then //Recebimento
    Begin
      SQL.Text := 'SELECT * FROM ITEM_DE_RECEBIMENTO '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND REC_CODIGO='+IntToStr(Entidade.Pedido);
    end
    else if self.Tag = 4 then //Inventário
    Begin
      SQL.Text := 'SELECT * FROM ITEM_DE_INVENTARIO '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND INV_CODIGO='+IntToStr(Entidade.Pedido);
    end
    else if self.Tag = 5 then //Tela Principal
    Begin
      //Não Verifica
    end;
    Open;
    while not Eof do
    Begin
      with DM.qr_consultas2 do
      Begin
        Close;
        SQL.Text := 'SELECT P1.*  '+
          ' FROM VERIFICAR_MERCADORIA V1, PRODUTO P1 '+
          ' WHERE V1.VER_TIPO='+IntToStr(self.Tag)+
          ' AND V1.VER_PEDIDO='+edtPedido.Text+
          ' AND V1.PRD_CODIGO='+DM.QR_Consultas.FieldByName('PRD_CODIGO').asString+
          ' AND V1.PRD_CODIGO=P1.PRD_CODIGO ';
        Open;
        if IsEmpty then
        Begin
          with DM.Produto1 do
          Begin
            if CodigoPRD <> DM.QR_Consultas.FieldByName('PRD_CODIGO').asInteger then
            Begin
              Close;
              ParamByName('PRD_CODIGO').asInteger := DM.QR_Consultas.FieldByName('PRD_CODIGO').asInteger;
              Open;
            end;
          end;
          if DM.Configuracao1.Empresa = empEletro then
            sProduto       := IntToStr(DM.Produto1.CodigoPRD)+'-'+DM.Produto1.Descricao+' '+DM.Produto1.Caracteristica
          else if DM.Configuracao1.Empresa = empHope then
            sProduto       := IntToStr(DM.Produto1.CodigoPRD)+'-'+DM.Produto1.Descricao+' '+DM.Produto1.Referencia
          else
            sProduto       := IntToStr(DM.Produto1.CodigoPRD)+'-'+DM.Produto1.Descricao;
          mensagem := mensagem + '  Faltando o Produto '+sProduto+#13+#10;
          vProblema := True;
        end;
      end;
      Next;
    end;
  end;
  if mensagem <> '' then
  Begin
    Application.CreateForm(TfMxMensagem, fMxMensagem);
    with fMxMensagem do
    Begin
      Memo1.Lines.Add('');
      Memo1.Lines.Add('  PROBLEMAS NA VERIFICAÇÃO ');
      Memo1.Lines.Add('  _________________________________________________________________________________');
      Memo1.Lines.Add('  DESCRICAO: '+edtDescricao.Text);      
      Memo1.Lines.Add('  Data: '+formatDateTime('DD/MM/YYYY',DM.Configuracao1.DataHora));
      Memo1.Lines.Add('  CODIGO:'+IntToStr(Entidade.Pedido));
      Memo1.Lines.Add('  _________________________________________________________________________________');
      Memo1.Text := Memo1.Text + mensagem;
      Memo1.Lines.Add('  _________________________________________________________________________________');
      ShowModal;
    end;
  end;
  if not vProblema then
    ShowMessage('Verificação Confirmada!')
  else
    ShowMessage('Verificação <<NÃO>> Confirmada!');
end;

procedure TfMxVerificarMercadoria.SB_AltItemClick(Sender: TObject);
begin
  if not Entidade.Active then
    Entidade.Open;

  if Entidade.isEmpty then
    Raise exception.Create('Selecione o Item!');

  Entidade.PreparaAlteracao;
  AtualizaControles(2,True);
  try
    edtQuantidade.SetFocus;
  except
  end;
end;

procedure TfMxVerificarMercadoria.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key='-' then
    key:='0'
  else If UpperCase(key)='C' then
    key:='0'
  else If UpperCase(key)='D' then
    key:='6';
  //
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=60;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=60;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfMxVerificarMercadoria.SB_ImprimirClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Entre com os produtos!');

  Application.CreateForm(Trpt_VerificarMercadoria, rpt_VerificarMercadoria);
  with rpt_VerificarMercadoria do
  Begin
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * '+
      ' FROM VERIFICAR_MERCADORIA V1, PRODUTO P1 '+
      ' WHERE V1.CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND V1.VER_TIPO='+IntToStr(self.Tag)+
      ' AND V1.VER_PEDIDO='+self.edtPedido.Text+
      ' AND V1.PRD_CODIGO=P1.PRD_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxVerificarMercadoria.SB_ExcluirTodosClick(Sender: TObject);
begin
  ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
    ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
    ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
    ' AND VER_PEDIDO='+IntToStr(DM.Usuario1.Maquina));
  Entidade.Close;
  Entidade.Open;
  SB_NovoItemClick(sender);
end;

end.
