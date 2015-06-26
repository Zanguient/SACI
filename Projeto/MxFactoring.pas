unit MxFactoring;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Menus, ComCtrls, DBCtrls, Variants, Item_de_Factoring, Factoring,
  CentroCusto, Cheque, Cliente, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  ActnList, XPStyleActnCtrls;

type
  TfMxFactoring = class(TForm)
    Panel3: TPanel;
    Label20: TLabel;
    Label10: TLabel;
    Label27: TLabel;
    Panel5: TPanel;
    SB_Processar: TSpeedButton;
    Panel6: TPanel;
    DBGrid5: TDBGrid;
    Label23: TLabel;
    Label19: TLabel;
    edtCodigoFCT: TEdit;
    Label21: TLabel;
    edtNumeroItens: TEdit;
    Label14: TLabel;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label1: TLabel;
    edtValor: TEdit;
    Label18: TLabel;
    SB_PrimPed: TSpeedButton;
    SB_AntPed: TSpeedButton;
    SB_ProxPed: TSpeedButton;
    SB_UltPed: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    DSFactoring1: TDataSource;
    mskCadastro: TMaskEdit;
    SB_Fechar: TSpeedButton;
    DSItem_de_Factoring1: TDataSource;
    Label6: TLabel;
    SB_Imprimir: TSpeedButton;
    mskAlterado: TMaskEdit;
    Label7: TLabel;
    CentroCusto3: TCentroCusto;
    PopupMenu1: TPopupMenu;
    Faturar1: TMenuItem;
    edtCodigoCLI: TEdit;
    edtRazaoSocial: TEdit;
    Label2: TLabel;
    Label11: TLabel;
    edtClienteCNC: TEdit;
    cmbSituacao: TComboBox;
    edtDonoCheque: TEdit;
    Label5: TLabel;
    Factoring1: TFactoring;
    Item_de_Factoring1: TItem_de_Factoring;
    edtChequeCNC: TEdit;
    Label3: TLabel;
    edtJuros: TEdit;
    edtObervacao: TEdit;
    Label4: TLabel;
    edtTotalEnviado: TEdit;
    Label8: TLabel;
    edtTotalRecebido: TEdit;
    Label9: TLabel;
    edtObservacaoItem: TEdit;
    edtCodigoCHQ: TEdit;
    Item_de_Factoring1CNC_CODIGO: TIntegerField;
    Item_de_Factoring1IFC_CODIGO: TIntegerField;
    Item_de_Factoring1FCT_CODIGO: TIntegerField;
    Item_de_Factoring1CNC_ORIGEM: TIntegerField;
    Item_de_Factoring1USU_CODIGO: TIntegerField;
    Item_de_Factoring1CNC_CHEQUE: TIntegerField;
    Item_de_Factoring1IFC_AGENCIA_NUMERO: TStringField;
    Item_de_Factoring1IFC_DT_CADASTRO: TDateTimeField;
    Item_de_Factoring1IFC_DT_ALTERADO: TDateTimeField;
    Item_de_Factoring1IFC_VALOR: TFloatField;
    Item_de_Factoring1IFC_SITUACAO: TIntegerField;
    Item_de_Factoring1IFC_OBSERVACAO: TStringField;
    Item_de_Factoring1CHQ_CODIGO: TIntegerField;
    Item_de_Factoring1Cliente: TStringField;
    Item_de_Factoring1Numero: TStringField;
    Cliente1: TCliente;
    Cheque1: TCheque;
    SB_LocPed: TSpeedButton;
    Label12: TLabel;
    edtOutrasTaxas: TEdit;
    Item_de_Factoring1Vencimento: TStringField;
    ActionManager1: TActionManager;
    IncluirPed: TAction;
    AlterarPed: TAction;
    SalvarPed: TAction;
    CancelarPed: TAction;
    Localizar1: TAction;
    Sair1: TAction;
    Incluir1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_PrimPedClick(Sender: TObject);
    procedure SB_AntPedClick(Sender: TObject);
    procedure SB_ProxPedClick(Sender: TObject);
    procedure SB_UltPedClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure SB_ProcessarClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Factoring1AfterScroll(DataSet: TDataSet);
    procedure Item_de_Factoring1AfterScroll(DataSet: TDataSet);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCHQKeyPress(Sender: TObject; var Key: Char);
    procedure Item_de_Factoring1CalcFields(DataSet: TDataSet);
    procedure edtCodigoCHQExit(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
  private
    procedure ApagaProduto;
    procedure AtualizaControles(Cabecalho, Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TFactoring;
  end;

var
  fMxFactoring: TfMxFactoring;

implementation
Uses
  UDM, funcoes, MxSPediProd, MxSPediProdMotCal, CdCliente, MxCheque,
  StrUtils, UFactoring, MxSelFactoring, MxSelRelatorioFactoring;
{$R *.DFM}

procedure TfMxFactoring.SB_SalvaClick(Sender: TObject);
var
  CdCNC,CdFCT,CdCHQCNC,CdCHQ:Integer;
  vValor, vJuros: Double;
  Trans: Boolean;
begin
  if (not VerificaInteiroBranco(edtCodigoCHQ.Text)) or
     (edtCodigoCHQ.text = '0') then
    Raise exception.Create('Código do Cheque inválido!');

  try
    CdCNC := Entidade.CodigoCNC;
    CdFCT := Entidade.CodigoFCT;
    CdCHQCNC := StrToInt(edtChequeCNC.Text);
    CdCHQ    := StrToInt(edtCodigoCHQ.Text);
    vValor   := StrToFloat(edtValor.text);
    vJuros   := StrToFloat(edtJuros.Text);
  except
    ShowMessage('Dados inválido!');
    Exit;
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

      if not Item_de_Factoring1.FinalizaEdicao then
        Raise Exception.Create('');

      if not DM.Movimento_de_Cheque1.Inserir(DM.Configuracao1.CodigoCNC,
        CdCHQCNC, CdCHQ, CdCNC, CdFCT, 1090 (*Factoring*), vValor) then
      Begin
        ShowMessage('Falha ao gerar Mov. Cheque!');
        Raise exception.Create('');
      end;

      ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
        ' CNC_FACTORING='+IntToStr(CdCNC)+
        ',FCT_CODIGO='+IntToStr(CdFCT)+
        ' WHERE CNC_CODIGO='+IntToStr(CdCHQCNC)+
        ' AND CHQ_CODIGO='+IntToStr(CdCHQ));

      ExecutaSQL(DM.QR_Comandos,'UPDATE FACTORING SET '+
        ' FCT_QUANTIDADE_CHEQUES=(SELECT COUNT(IFC_CODIGO) '+
        ' FROM ITEM_DE_FACTORING I1 '+
        ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
        ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO) '+
        ',FCT_TOTAL_ENVIADO=(SELECT SUM(ROUND(IFC_VALOR,2)) '+
        ' FROM ITEM_DE_FACTORING I1 '+
        ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
        ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO) '+
        ',FCT_TOTAL_RECEBIDO=FCT_OUTRAS_TAXAS+'+
        '(SELECT SUM(ROUND(IFC_VALOR,2)) '+
        ' FROM ITEM_DE_FACTORING I1 '+
        ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
        ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO)-'+
        '(SELECT SUM(ROUND(IFC_VALOR,2)) '+
        ' FROM ITEM_DE_FACTORING I1 '+
        ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
        ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO)*'+VirgPonto(vJuros)+'/100 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND FCT_CODIGO='+IntToStr(CdFCT));

      if not Item_de_Factoring1.GeraLog(6730,CdCNC,CdFCT,'IFC:'+IntToStr(Item_de_Factoring1.SCodigo)+
                                        ' CHQ:'+IntToStr(CdCHQ)) then
      Begin
        ShowMessage('Falha ao gerar Log!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;

      Trans := False; //Caso dê problema no SB_Novo não executar o RollBack
      Entidade.Close;
      Entidade.Open;
      Entidade.LocalizarCod(CdFCT, CdCNC);
      AtualizaControles(False,False);
      SB_NovoClick(sender);
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
      exit;
    end;
  End;
end;

procedure TfMxFactoring.SB_CancClick(Sender: TObject);
begin
  Item_de_Factoring1.CancelaEdicao;
  AtualizaControles(False,False);
  if Item_de_Factoring1.IsEmpty then
    ApagaProduto
  else
    edtDonoCheque.text := Item_de_Factoring1.FieldByName('Numero').asString+' - '+
                          Item_de_Factoring1.FieldByName('Cliente').asString;
end;

procedure TfMxFactoring.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Item_de_Factoring1.Close;
  Action:=Cafree;
end;

procedure TfMxFactoring.SB_PrimClick(Sender: TObject);
begin
 if Item_de_Factoring1.IsEmpty then
   abort;

 If Item_de_Factoring1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Item_de_Factoring1.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Item_de_Factoring1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxFactoring.SB_AntClick(Sender: TObject);
begin
 if Item_de_Factoring1.IsEmpty then
   abort;

 If Item_de_Factoring1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Item_de_Factoring1.Prior;
    If Item_de_Factoring1.bof Then
    begin
      SB_Ant.Enabled:=False;
      SB_Prim.Enabled:=False;
    end;
  end;
  If not Item_de_Factoring1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxFactoring.SB_ProxClick(Sender: TObject);
begin
 if Item_de_Factoring1.IsEmpty then
   abort;

  If Item_de_Factoring1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Item_de_Factoring1.Next;
    If Item_de_Factoring1.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Item_de_Factoring1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxFactoring.SB_UltClick(Sender: TObject);
begin
 if Item_de_Factoring1.IsEmpty then
   abort;

  If Item_de_Factoring1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Item_de_Factoring1.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Item_de_Factoring1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxFactoring.SB_NovoClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6730)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  If Entidade.Situacao>0 then
    raise exception.Create('Não é possível a inclusão de itens nesta pedido, pois já foi processada!');

  Item_de_Factoring1.PreparaInsercao;
  AtualizaControles(False,True);
  edtDonoCheque.Clear;
  edtValor.Clear;
  edtCodigoCHQ.SetFocus;
end;

procedure TfMxFactoring.SB_ExcClick(Sender: TObject);
Var
  CdCNC,CdFCT,CdCHQCNC,CdCHQ,CdIFC:Integer;
  Trans, iTemItens : Boolean;
  vValor, vJuros: Double;
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6740)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if Item_de_Factoring1.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir factoring neste centro de custo.');
  If Entidade.Situacao>0 then
    raise exception.Create('Não é possível a delecao de itens nesta factoring,pois já foi processada ou cancelada!');

  CdCNC    := Item_de_Factoring1.CodigoCNC;
  CdFCT    := Item_de_Factoring1.CodigoFCT;
  CdCHQCNC := Item_de_Factoring1.ChequeCNC;
  CdCHQ    := Item_de_Factoring1.CodigoCHQ;
  CdIFC    := Item_de_Factoring1.CodigoIFC;
  vValor   := Item_de_Factoring1.Valor;
  vJuros   := StrToFloat(edtJuros.Text);

  if Item_de_Factoring1.RecordCount > 1 then
    iTemItens := True
  else
    iTemItens := False;

  If MessageDlg('ATENÇÃO!!!'+#13+'Deseja excluir o Registro?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_FACTORING '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND IFC_CODIGO='+IntToStr(CdIFC));

      edtNumeroItens.Text := IntToStr(StrToInt(edtNumeroItens.Text)-1);

      ExecutaSQL(DM.QR_Comandos,'UPDATE FACTORING SET '+
        ' FCT_QUANTIDADE_CHEQUES='+edtNumeroItens.Text+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND FCT_CODIGO='+IntToStr(CdFCT));

      if not DM.Movimento_de_Cheque1.Inserir(DM.Configuracao1.CodigoCNC,
        CdCHQCNC, CdCHQ, CdCNC, CdFCT, 4040 (*Factoring*), vValor) then
      Begin
        ShowMessage('Falha ao gerar Mov. Cheque!');
        Raise exception.Create('');
      end;

      ExecutaSQL(DM.QR_Comandos,'UPDATE CHEQUE SET '+
        ' CNC_FACTORING=0 '+
        ',FCT_CODIGO=0 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCHQCNC)+
        ' AND CHQ_CODIGO='+IntToStr(CdCHQ));

      if iTemItens then
        ExecutaSQL(DM.QR_Comandos,'UPDATE FACTORING SET '+
          ' FCT_QUANTIDADE_CHEQUES=(SELECT COUNT(IFC_CODIGO) '+
          ' FROM ITEM_DE_FACTORING I1 '+
          ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
          ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO) '+
          ',FCT_TOTAL_ENVIADO=(SELECT SUM(ROUND(IFC_VALOR,2)) '+
          ' FROM ITEM_DE_FACTORING I1 '+
          ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
          ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO) '+
          ',FCT_TOTAL_RECEBIDO=FCT_OUTRAS_TAXAS+'+
          '(SELECT SUM(ROUND(IFC_VALOR,2)) '+
          ' FROM ITEM_DE_FACTORING I1 '+
          ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
          ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO)-'+
          '(SELECT SUM(ROUND(IFC_VALOR,2)) '+
          ' FROM ITEM_DE_FACTORING I1 '+
          ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
          ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO)*'+VirgPonto(vJuros)+'/100 '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND FCT_CODIGO='+IntToStr(CdFCT))
      else
        ExecutaSQL(DM.QR_Comandos,'UPDATE FACTORING SET '+
          ' FCT_QUANTIDADE_CHEQUES=0 '+
          ',FCT_TOTAL_ENVIADO=0 '+
          ',FCT_TOTAL_RECEBIDO=0 '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND FCT_CODIGO='+IntToStr(CdFCT));

      if not Item_de_Factoring1.GeraLog(6740,CdCNC,CdFCT,'CHQ:'+IntToStr(CdCHQ)+' IFC:'+IntToStr(CdIFC)) then
      Begin
        ShowMessage('Falha ao gerar Log!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;

      Entidade.Close;
      Entidade.Open;
      Item_de_Factoring1.Close;
      Item_de_Factoring1.Open;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  end;
  if Item_de_Factoring1.IsEmpty then
    ApagaProduto;
end;

procedure TfMxFactoring.FormCreate(Sender: TObject);
begin
  Entidade := Factoring1;
end;

procedure TfMxFactoring.SB_PrimPedClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;

 If Entidade.bof Then
  begin
    SB_AntPed.Enabled:=False;
    SB_PrimPed.Enabled:=False;
  end
  Else
  begin
    Entidade.First;
    SB_AntPed.Enabled:=False;
    SB_PrimPed.Enabled:=False;
  end;
  If not Entidade.eof Then
  begin
    SB_ProxPed.Enabled:=True;
    SB_UltPed.Enabled:=True;
  end;
end;

procedure TfMxFactoring.SB_AntPedClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;

 If Entidade.bof Then
  begin
    SB_AntPed.Enabled:=False;
    SB_PrimPed.Enabled:=False;
  end
  Else
  begin
    Entidade.Prior;
    If Entidade.bof Then
    begin
      SB_AntPed.Enabled:=False;
      SB_PrimPed.Enabled:=False;
    end;
  end;
  If not Entidade.eof Then
  begin
    SB_ProxPed.Enabled:=True;
    SB_UltPed.Enabled:=True;
  end;
end;

procedure TfMxFactoring.SB_ProxPedClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;

  If Entidade.eof Then
  begin
    SB_ProxPed.Enabled:=False;
    SB_UltPed.Enabled:=False;
  end
  Else
  begin
    Entidade.Next;
    If Entidade.eof Then
    begin
      SB_ProxPed.Enabled:=False;
      SB_UltPed.Enabled:=False;
    end;
  end;
  If not Entidade.bof Then
  begin
    SB_AntPed.Enabled:=True;
    SB_PrimPed.Enabled:=True;
  end;
end;

procedure TfMxFactoring.SB_UltPedClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;

  If Entidade.eof Then
  begin
    SB_ProxPed.Enabled:=False;
    SB_UltPed.Enabled:=False;
  end
  Else
  begin
    Entidade.Last;
    SB_ProxPed.Enabled:=False;
    SB_UltPed.Enabled:=False;
  end;
  If not Entidade.bof Then
  begin
    SB_AntPed.Enabled:=True;
    SB_PrimPed.Enabled:=True;
  end;
end;

procedure TfMxFactoring.SB_NovoPedClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6690)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir factoring neste centro de custo.');

  Entidade.PreparaInsercao;
  Item_de_Factoring1.Close;
  AtualizaControles(True,True);
  ApagaProduto;
  try
    edtCodigoCLI.SetFocus;
  except
  end;
end;

procedure TfMxFactoring.SB_AltPedClick(Sender: TObject);
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6700)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar factoring neste centro de custo.');
  if Entidade.Situacao=2 then
    raise exception.Create('Essa factoring já foi confirmada e não pode ser alterada!');
  if Entidade.Situacao=1 then
    raise exception.Create('Essa factoring foi cancelada e não pode ser alterada!');

  Entidade.PreparaAlteracao;
  AtualizaControles(True,True);
end;

procedure TfMxFactoring.SB_SalvaPedClick(Sender: TObject);
var
  CdCNC, CdFCT, iEstado: integer;
  vJuros: Double;
begin
  if not VerificaFloatBranco(edtJuros.Text) then
    edtJuros.Text := '0,00';

  iEstado := Entidade.Estado;
  try
    CdCNC := Entidade.CodigoCNC;
    CdFCT := Entidade.CodigoFCT;
    vJuros := StrToFloat(edtJuros.Text);
  except
    ShowMessage('Problema');
    Exit;
  end;

  if Entidade.FinalizaEdicao then
  Begin
    if iEstado = 1 then
      Entidade.GeraLog(6700,Entidade.CodigoCNC,Entidade.CodigoFCT)
    else if iEstado = 2 then
      Entidade.GeraLog(6710,Entidade.CodigoCNC,Entidade.CodigoFCT);
    AtualizaControles(True,False);
    if not Item_de_Factoring1.Active then
      Item_de_Factoring1.Open;
  end
  else
  Begin
    ShowMessage('As alterações não foram salvas!');
    Exit;
  end;

  if (iEstado = 2) and
     (not Item_de_Factoring1.IsEmpty) then
    ExecutaSQL(DM.QR_Comandos,'UPDATE FACTORING SET '+
      ' FCT_QUANTIDADE_CHEQUES=(SELECT COUNT(IFC_CODIGO) '+
      ' FROM ITEM_DE_FACTORING I1 '+
      ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
      ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO) '+
      ',FCT_TOTAL_ENVIADO=(SELECT SUM(ROUND(IFC_VALOR,2)) '+
      ' FROM ITEM_DE_FACTORING I1 '+
      ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
      ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO) '+
      ',FCT_TOTAL_RECEBIDO=FCT_OUTRAS_TAXAS+'+
      '(SELECT SUM(ROUND(IFC_VALOR,2)) '+
      ' FROM ITEM_DE_FACTORING I1 '+
      ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
      ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO)-'+
      '(SELECT SUM(ROUND(IFC_VALOR,2)) '+
      ' FROM ITEM_DE_FACTORING I1 '+
      ' WHERE I1.CNC_CODIGO=FACTORING.CNC_CODIGO '+
      ' AND I1.FCT_CODIGO=FACTORING.FCT_CODIGO)*'+VirgPonto(vJuros)+'/100 '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND FCT_CODIGO='+IntToStr(CdFCT))
  else if Item_de_Factoring1.IsEmpty then
    ExecutaSQL(DM.QR_Comandos,'UPDATE FACTORING SET '+
      ' FCT_QUANTIDADE_CHEQUES=0 '+
      ',FCT_TOTAL_ENVIADO=0 '+
      ',FCT_TOTAL_RECEBIDO=0 '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND FCT_CODIGO='+IntToStr(CdFCT));
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxFactoring.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(True,False);
  if not Item_de_Factoring1.Active then
    Item_de_Factoring1.Open;
end;

procedure TfMxFactoring.SB_ProcessarClick(Sender: TObject);
Var
  CdCNC, CdFCT, CdCLICNC, CdCLI:Integer;
  vValor: Double;
  Trans:Boolean;
begin
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(6720)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para processar!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode processar factoring neste centro de custo.');
  if Item_de_Factoring1.IsEmpty then
    Raise Exception.Create('factoring sem itens');
  If (Entidade.Situacao>0) and (Entidade.Situacao<>10) then
    Raise Exception.Create('factoring já foi processada ou cancelada!!');

  if MessageDlg('Deseja, realmente, Processar essa factoring?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdCNC:=Entidade.CodigoCNC;
  CdFCT:=Entidade.CodigoFCT;
  CdCLICNC := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;
  vValor   := Entidade.TotalRecebido;

  Item_de_Factoring1.Close;
  Item_de_Factoring1.Open;
  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Mudar situação da factoring para processada
      ExecutaSQL(DM.QR_Comandos,'UPDATE FACTORING SET '+
        ' FCT_SITUACAO=2 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND FCT_CODIGO='+IntToStr(CdFCT));

      if DM.Titulo_receber1.Active = False then
        DM.Titulo_receber1.Open;
      if not DM.Titulo_receber1.InserirEsp(DM.Configuracao1.CodigoCNC, 0,
        CdCLICNC, CdCLI, CdFCT, DM.Configuracao1.ContFactoring, 5 (*TipoPag Dinheiro*),
        DM.Configuracao1.TipoDocumento, 5 (*CdAGF*), 0(*CdBOL*),
        DM.Configuracao1.Data (*Vencimento*), '01' (*Sequencia*), '' (*Numero*),'Gerado pelo Controle Factoring No.: '+IntToStr(CdFCT), vValor) then
      Begin
        ShowMessage('Falha ao gerar Título!');
        Raise exception.Create('');
      end;

      if not Entidade.GeraLog(6720, CdCNC, CdFCT) then
      Begin
        ShowMessage('Falha ao gerar Log!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;

      Entidade.Close;
      Entidade.Open;
      Entidade.LocalizarCod(CdFCT, DM.Configuracao1.CodigoCNC);
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

procedure TfMxFactoring.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxFactoring.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If (SB_SalvaPed.Enabled) or (SB_Salva.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxFactoring.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  with Entidade do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM FACTORING '+
      ' WHERE FCT_CODIGO=(SELECT MAX(FCT_CODIGO) '+
      ' FROM FACTORING '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+') '+
      ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Open;
  end;
  Item_de_Factoring1.Open;
end;

procedure TfMxFactoring.SB_FecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxFactoring.SB_ImprimirClick(Sender: TObject);
begin  
  if Item_de_Factoring1.IsEmpty then
    Raise Exception.Create('Factoring sem itens');

  Application.CreateForm(TfMxSelRelatorioFactoring, fMxSelRelatorioFactoring);
  with fMxSelRelatorioFactoring do
  Begin
    Tag:=0;
    CdCNC := self.Entidade.CodigoCNC;
    CdFCT := self.Entidade.CodigoFCT;
    ShowModal;
  end;
end;

procedure TfMxFactoring.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end
  else if (Key = '.') then
    Key := ',';
end;

procedure TfMxFactoring.ApagaProduto;
Begin
  Item_de_Factoring1.LimpaCampos;
  edtDonoCheque.Clear;
end;

procedure TfMxFactoring.AtualizaControles(Cabecalho, Habilitar: Boolean);
begin
  Sair1.Enabled                := not Habilitar;
  IncluirPed.Enabled           := not Habilitar;
  AlterarPed.Enabled           := not Habilitar;
  SalvarPed.Enabled            := (Cabecalho and Habilitar);
  CancelarPed.Enabled          := (Cabecalho and Habilitar);
  Incluir1.Enabled             := not Habilitar;
  Localizar1.Enabled           := not Habilitar;  
  Excluir1.Enabled             := not Habilitar;
  Salvar1.Enabled              := ((not Cabecalho) and Habilitar);
  Cancelar1.Enabled            := ((not Cabecalho) and Habilitar);

  SB_Prim.Enabled              := not Habilitar;
  SB_Ant.Enabled               := not Habilitar;
  SB_Prox.Enabled              := not Habilitar;
  SB_Ult.Enabled               := not Habilitar;
  SB_Novo.Enabled              := not Habilitar;
  SB_LocPed.Enabled            := not Habilitar;  
  SB_Exc.Enabled               := not Habilitar;
  SB_Salva.Enabled             := ((not Cabecalho) and Habilitar);
  SB_Canc.Enabled              := ((not Cabecalho) and Habilitar);

  SB_PrimPed.Enabled           := not Habilitar;
  SB_AntPed.Enabled            := not Habilitar;
  SB_ProxPed.Enabled           := not Habilitar;
  SB_UltPed.Enabled            := not Habilitar;
  SB_NovoPed.Enabled           := not Habilitar;
  SB_AltPed.Enabled            := not Habilitar;
  SB_SalvaPed.Enabled          := (Cabecalho and Habilitar);
  SB_CancPed.Enabled           := (Cabecalho and Habilitar);

  SB_Processar.Enabled         := not Habilitar;
  SB_Imprimir.Enabled          := not Habilitar;
  SB_Fechar.Enabled            := not Habilitar;

  DBGrid5.Enabled              := not Habilitar;
end;
procedure TfMxFactoring.Factoring1AfterScroll(DataSet: TDataSet);
begin
  if Item_de_Factoring1.IsEmpty then
  Begin
    ApagaProduto;
    edtNumeroItens.Text := '0';
  end;
  Entidade.Carregadados;
  with Cliente1 do
  Begin
    if (CodigoCNC <> Entidade.ClienteCNC) or
       (CodigoCLI <> Entidade.CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    edtRazaoSocial.Text := RazaoSocial+'('+IntToStr(Entidade.CodigoCLI)+')';
  end;
end;

procedure TfMxFactoring.Item_de_Factoring1AfterScroll(DataSet: TDataSet);
begin
  Item_de_Factoring1.CarregaDados;
  edtDonoCheque.Text := Item_de_Factoring1.fieldByName('Numero').asString +
                        ' - ' + Item_de_Factoring1.fieldByName('Cliente').asString;
end;

procedure TfMxFactoring.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=36;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxFactoring.edtCodigoCHQKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCHQ.Clear;
    key:=chr(0);
    Application.CreateForm(TfMxCheque,fMxCheque);
    with fMxCheque do
    Begin
      Tag := 7;
      cmbTipo.ItemIndex:=1; //Recebidos
      ShowModal;
    end;
  end;
end;

procedure TfMxFactoring.Item_de_Factoring1CalcFields(DataSet: TDataSet);
begin
  with Cheque1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Item_de_Factoring1.ChequeCNC) or
       (CodigoCHQ <> Item_de_Factoring1.CodigoCHQ) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Item_de_Factoring1.ChequeCNC;
      ParamByName('CHQ_CODIGO').asInteger := Item_de_Factoring1.CodigoCHQ;
      Open;
    end;
    Item_de_Factoring1.FieldByName('Numero').asString := PreencheZero(4,Agencia)+'-'+PreencheEspaco(6,Numero);
    Item_de_Factoring1.FieldByName('Vencimento').asString := formatDateTime('DD/MM/YYYY',Data);

    Item_de_Factoring1.FieldByName('Cliente').asString := DonoCheque;
  end;
end;

procedure TfMxFactoring.edtCodigoCHQExit(Sender: TObject);
var
  CdCNC, CdCHQ: integer;
begin
  if SB_Canc.Focused then
    Exit;

  if not SB_Salva.Enabled then
    Exit;

  edtDonoCheque.Clear;
  edtValor.Clear;

  if not VerificaInteiroBranco(edtCodigoCHQ.Text) then
    Raise exception.Create('Código do Cheque inválido!');
  if not VerificaInteiroBranco(edtChequeCNC.Text) then
    Raise exception.Create('CNC do Cheque inválido!');

  CdCNC := StrToInt(edtChequeCNC.Text);
  CdCHQ := StrToInt(edtCodigoCHQ.Text);

  with Cheque1 do
  Begin
    if (not Active) or
       (CodigoCNC <> CdCNC) or
       (CodigoCHQ <> CdCHQ) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := CdCNC;
      ParamByName('CHQ_CODIGO').asInteger := CdCHQ;
      Open;
    end;
    edtDonoCheque.Text := PreencheZero(4,Agencia)+'-'+PreencheEspaco(6,Numero);
    edtValor.Text := format('%.2f',[Valor]);

    edtDonoCheque.Text := DonoCheque;
  end;
end;

procedure TfMxFactoring.SB_LocPedClick(Sender: TObject);
begin
  Application.CreateForm(TfMxSelFactoring, fMxSelFactoring);
  with fMxSelFactoring do
  Begin
    Tag := 0;
    ShowModal;
  end;
end;

end.

