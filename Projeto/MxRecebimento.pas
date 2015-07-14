unit MxRecebimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Variants, DBCtrls, Menus, CentroCusto, Movimento_Fisico,
  Movimento_Estoque_Comercial, Item_de_Estoque, Produto, Item_Recebimento,
  Recebimento, ComCtrls, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfMxRecebim = class(TForm)
    Panel3: TPanel;
    Panel5: TPanel;
    SB_Fechar: TSpeedButton;
    Panel6: TPanel;
    DBGrid5: TDBGrid;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    DSRecebimento1: TDataSource;
    DSItem_Recebimento1: TDataSource;
    Recebimento1: TRecebimento;
    Item_Recebimento1: TItem_Recebimento;
    Recebimento1REC_CODIGO: TIntegerField;
    Recebimento1CNC_CODIGO: TIntegerField;
    Recebimento1REC_DATA: TDateTimeField;
    Recebimento1REC_SITUACAO: TIntegerField;
    Recebimento1REC_TOT_ITEM: TIntegerField;
    Recebimento1REC_TIPO: TIntegerField;
    Recebimento1REC_CNC_ORIGEM: TIntegerField;
    Recebimento1REC_COD_ORIGEM: TIntegerField;
    Item_Recebimento1IRC_CODIGO: TIntegerField;
    Item_Recebimento1CNC_CODIGO: TIntegerField;
    Item_Recebimento1REC_CODIGO: TIntegerField;
    Item_Recebimento1IRC_QUANTIDADE: TFloatField;
    Produto1: TProduto;
    SB_Confirmar: TSpeedButton;
    Item_de_Estoque1: TItem_de_Estoque;
    Panel1: TPanel;
    Label20: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    edtCodigoREC: TEdit;
    Label2: TLabel;
    edtNumeroDocumento: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mskDataSaida: TMaskEdit;
    mskDataEmissao: TMaskEdit;
    edtCodigoFOR: TEdit;
    SB_PrimPed: TSpeedButton;
    SB_AntPed: TSpeedButton;
    SB_ProxPed: TSpeedButton;
    SB_UltPed: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    SB_NovoPed: TSpeedButton;
    SB_ExcPed: TSpeedButton;
    SB_PrimItem: TSpeedButton;
    SB_AntItem: TSpeedButton;
    SB_ProxItem: TSpeedButton;
    SB_UltItem: TSpeedButton;
    SB_NovoItem: TSpeedButton;
    SB_ExcItem: TSpeedButton;
    SB_SalvaItem: TBitBtn;
    SB_CancItem: TBitBtn;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtUnidade: TEdit;
    edtReferencia: TEdit;
    edtMarca: TEdit;
    edtQuantidade: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label18: TLabel;
    Recebimento1FOR_CODIGO: TIntegerField;
    Recebimento1REC_DATA_SAIDA: TDateTimeField;
    Recebimento1REC_DATA_EMISSAO: TDateTimeField;
    Recebimento1REC_NUM_DOC: TStringField;
    Item_Recebimento1IRC_SITUACAO: TIntegerField;
    cmbTipo: TComboBox;
    dblCNCOrigem: TDBLookupComboBox;
    Label9: TLabel;
    edtCodigoOrigem: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    SB_Cancelar: TBitBtn;
    SB_Etiqueta: TSpeedButton;
    Etiquetas1: TProduto;
    Item_Recebimento1PRD_CODIGO: TIntegerField;
    Edit5: TEdit;
    Label12: TLabel;
    Recebimento1Tipo: TStringField;
    SB_Imprimir: TSpeedButton;
    Item_Recebimento1Produto: TStringField;
    Produto2: TProduto;
    Recebimento1PRC_CODIGO: TIntegerField;
    Recebimento1REC_OBSERVACAO: TStringField;
    Recebimento1REC_TIPO_PRE: TIntegerField;
    Recebimento1USU_CODIGO: TIntegerField;
    Recebimento1REC_DT_ALTERADO: TDateTimeField;
    Item_Recebimento1IRC_DT_CADASTRO: TDateTimeField;
    Item_Recebimento1IRC_DT_ALTERADO: TDateTimeField;
    SB_Verificar: TSpeedButton;
    Item_Recebimento1USU_CODIGO: TIntegerField;
    SB_Transferencia: TSpeedButton;
    ActionManager1: TActionManager;
    IncluirPed: TAction;
    AlterarPed: TAction;
    ExcluirPed: TAction;
    SalvarPed: TAction;
    CancelarPed: TAction;
    Sair1: TAction;
    Incluir2: TAction;
    Excluir2: TAction;
    Salvar2: TAction;
    Cancelar2: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure Recebimento1BeforeOpen(DataSet: TDataSet);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_UltPedClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_ExcPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure SB_NovoItemClick(Sender: TObject);
    procedure SB_ExcItemClick(Sender: TObject);
    procedure SB_SalvaItemClick(Sender: TObject);
    procedure SB_CancItemClick(Sender: TObject);
    procedure SB_PrimPedClick(Sender: TObject);
    procedure SB_AntPedClick(Sender: TObject);
    procedure SB_ProxPedClick(Sender: TObject);
    procedure SB_PrimItemClick(Sender: TObject);
    procedure SB_AntItemClick(Sender: TObject);
    procedure SB_ProxItemClick(Sender: TObject);
    procedure SB_UltItemClick(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Recebimento1AfterScroll(DataSet: TDataSet);
    procedure Item_Recebimento1AfterScroll(DataSet: TDataSet);
    procedure SB_CancelarClick(Sender: TObject);
    procedure SB_EtiquetaClick(Sender: TObject);
    procedure Recebimento1CalcFields(DataSet: TDataSet);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure Item_Recebimento1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_VerificarClick(Sender: TObject);
    procedure SB_TransferenciaClick(Sender: TObject);

  private
    procedure CarregaProduto;
    procedure ApagaProduto;
    procedure AtualizaControles(Cabecalho, Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TRecebimento;
    FORNECEDORINV:string;
  end;

var
  fMxRecebim: TfMxRecebim;

implementation
Uses
  UDM, MxSPediProd, MxSCotaFor, funcoes, Urpt_Receb, MxSPediProdMotCal,
  MxVerificarMercadoria, MxSelTransferencia;
{$R *.DFM}

procedure TfMxRecebim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

procedure TfMxRecebim.FormCreate(Sender: TObject);
begin
  Entidade := Recebimento1;
  DateTimePicker1.Date:= DM.Configuracao1.Data;
  Entidade.open;
  Item_Recebimento1.open;
  CentroCusto1.Open;
  //Anderson Gonçalves - 21/02/2013
  edtCodigoPRD.MaxLength := 0;
end;

procedure TfMxRecebim.SB_FecharClick(Sender: TObject);
begin
  Close;
end;
procedure TfMxRecebim.Recebimento1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.SQL.Text:='SELECT * FROM RECEBIMENTO WHERE CNC_CODIGO=:CNC_CODIGO '+
     ' AND REC_DATA>=:DATAINI AND REC_DATA<:DATAFIM ORDER BY REC_CODIGO DESC';
  Entidade.ParamByName('DATAINI').AsDateTime:=DateTimePicker1.Date;
  Entidade.ParamByName('DATAFIM').AsDateTime:=DateTimePicker1.Date+1;
  Entidade.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfMxRecebim.DateTimePicker1Change(Sender: TObject);
begin
 Entidade.Close;
 Entidade.Open;
end;


procedure TfMxRecebim.SB_ConfirmarClick(Sender: TObject);
Var
  CdREC, CodigoOri, cTipoMov:Integer;
  Trans :Boolean;
begin
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar recebimentos neste centro de custo!');
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Recebimento!');
  If Entidade.Situacao>=1 then
    Raise Exception.Create('Este recebimento já foi processado!');
  if Item_Recebimento1.IsEmpty then
    Raise Exception.Create('Recebimento sem itens!');

  if Application.MessageBox('Deseja realizar o recebimento?','Atenção',MB_YESNO+MB_ICONQUESTION) <> ID_YES then
    exit;

  CdREC:=Entidade.CodigoREC;
  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      With Item_Recebimento1 do
      Begin
        DisableControls;
        First;
        try
          CodigoOri := StrToInt(edtCodigoOrigem.Text);
        except
          CodigoOri := CodigoREC;
        end;
        case cmbTipo.ItemIndex of
          0: cTipoMov := 16; //Transferência
          1: cTipoMov := 15; //Abastecimento
          2: cTipoMov := 14; //Compra
          else
            cTipoMov := -1;
        end;
        While not EOF do
        Begin
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          Item_de_Estoque1.Open;
          If Item_de_Estoque1.IsEmpty Then
          Begin
            if not Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                     DM.Configuracao1.DataHora,0,0,0,0,0,0) then
              Raise Exception.Create('');
            Item_de_Estoque1.Close;
            Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
            Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
            Item_de_Estoque1.Open;
          End;

          //Gerar Movimento de estoque comercial
          if not DM.Movimento_Estoque_Comercial1.Inserir(DM.Configuracao1.CodigoCNC,0,
              CodigoPRD,0(*CdFUN*),cTipoMov,CodigoCNC,CodigoOri,'E', Quantidade,
              Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
              Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
              'RECEBIMENTO') then
          Begin
            ShowMessage('Falha ao Gerar Mov. Comercial!');
            Raise Exception.Create('');
          end;

          //Gerar Movimento Fisico
          if not DM.Movimento_Fisico1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoPRD,0(*CdFUN*),
              CodigoCNC,CodigoOri,cTipoMov,'E',Quantidade,
              Item_de_Estoque1.SFisico) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Físico!');
            Raise Exception.Create('');
          end;

          if DM.Configuracao1.Empresa = empTodas then
          begin
            if DM.Configuracao1.EstoqueIdeal then
            begin
              if not DM.Mov_Est_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,CodigoPRD,0,0, CodigoCNC,
                  CodigoOri, 365, 'E', Quantidade,
                  Item_de_Estoque1.SFiscal,
                  Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*)) then
              Begin
                ShowMessage('Falha ao inserir Movimento Fiscal!');
                Raise  exception.Create('');
              end;

              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND PRD_CODIGO='+IntToStr(Item_Recebimento1.CodigoPRD));

            end;
          end;

          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
            ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Item_Recebimento1.Quantidade)+
            ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Item_Recebimento1.Quantidade)+
            ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PRD_CODIGO='+IntToStr(Item_Recebimento1.CodigoPRD));
          Next;
        End;
        EnableControls;
        Close;
        Open;
      End;

    //Mudando a situação do Recebimento e dos Itens

      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_RECEBIMENTO SET '+
        ' IRC_SITUACAO=1 '+
        ',IRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND REC_CODIGO='+IntToStr(Entidade.CodigoREC));

      ExecutaSQL(DM.QR_Comandos,'UPDATE RECEBIMENTO SET '+
        ' REC_SITUACAO=1 '+
        ',REC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+
        IntToStr(Entidade.CodigoCNC)+' AND REC_CODIGO='+IntToStr(Entidade.CodigoREC));


      If DM.Configuracao1.ControleTransacao then
        Commit;
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

  Entidade.close;
  Entidade.Open;
  Entidade.LocalizarCod(CdREC,DM.Configuracao1.CodigoCNC);
end;

procedure TfMxRecebim.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
end;

procedure TfMxRecebim.SB_UltPedClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxRecebim.SB_NovoPedClick(Sender: TObject);
begin
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode inserir recebimentos neste centro de custo!');
  if Trunc(DateTimePicker1.Date) <> DM.Configuracao1.Data then
    DateTimePicker1.date := DM.Configuracao1.Data;    
  Entidade.PreparaInsercao;
  Item_Recebimento1.Close;
  AtualizaControles(True,True);
  ApagaProduto;
  dblCNCOrigem.SetFocus;
end;

procedure TfMxRecebim.SB_AltPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar recebimentos neste centro de custo!');
  if Entidade.Situacao > 0 then
    raise Exception.Create('Recebimentio ja processado ou Cancelada!');
    
  Entidade.PreparaAlteracao;
  AtualizaControles(True,True);
  edtCodigoOrigem.SetFocus;
end;

procedure TfMxRecebim.SB_ExcPedClick(Sender: TObject);
begin
  if Entidade.Situacao > 0 then
    raise Exception.Create('Recebimentio ja processado ou cancelado!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode excluir recebimentos neste centro de custo!');
  if MessageDlg('Tem certeza que você deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) in [mrYes, 201] then
  Begin
    With DM.QR_Comandos do
    Begin
      Close;
      SQL.Text:='DELETE FROM ITEM_DE_RECEBIMENTO WHERE CNC_CODIGO='+
        IntToStr(Entidade.CodigoCNC)+' AND REC_CODIGO='+IntToStr(Entidade.CodigoREC);
      ExecSQL;
      Close;
      SQL.Text:='DELETE FROM RECEBIMENTO WHERE CNC_CODIGO='+
        IntToStr(Entidade.CodigoCNC)+' AND REC_CODIGO='+IntToStr(Entidade.CodigoREC);
      ExecSQL;
    End;
  end;
  if Item_Recebimento1.IsEmpty then
  Begin
    edtCodigoPRD.Clear;
    edtQuantidade.Clear;
  end;
end;

procedure TfMxRecebim.SB_SalvaPedClick(Sender: TObject);
begin
  if not Entidade.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');

  AtualizaControles(True,False);
  if not Item_Recebimento1.Active then
    Item_Recebimento1.Open;
end;

procedure TfMxRecebim.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(True,False);
  if not Item_Recebimento1.Active then
    Item_Recebimento1.Open;
end;

procedure TfMxRecebim.SB_NovoItemClick(Sender: TObject);
begin
  If Entidade.IsEmpty then
    raise Exception.Create('Não foi selecionado um recebimento!');
  if Entidade.Situacao>0 then
    raise Exception.Create('Recebimento ja processado!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar recebimentos neste centro de custo!');

  Item_Recebimento1.PreparaInsercao;
  AtualizaControles(False,True);
  ApagaProduto;
  edtCodigoPRD.SetFocus;
end;

procedure TfMxRecebim.SB_ExcItemClick(Sender: TObject);
Var
  CdREC,CdCNC:integer;
begin
  If Item_Recebimento1.IsEmpty then
    raise Exception.Create('Não existem itens a serem deletados!');
  if Entidade.Situacao > 0 then
    raise Exception.Create('Recebimento ja processado ou cancelado!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar recebimentos neste centro de custo!');
    
  If Item_Recebimento1.Deletarauto then
    With Recebimento1 do
    Begin
      CdREC:=CodigoREC;
      CdCNC:=CodigoCNC;
      ExecutaSQL(DM.QR_Comandos,'UPDATE RECEBIMENTO SET '+
        ' REC_TOT_ITEM=REC_TOT_ITEM-1 '+
        ',REC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+' AND REC_CODIGO='+IntToStr(CdREC));
      Close;
      Open;
      LocalizarCod(CdREC, CdCNC);
    End;
  if Item_Recebimento1.IsEmpty then
  Begin
    ApagaProduto;
    edtCodigoPRD.Clear;
    edtQuantidade.Clear;
  end;
end;

procedure TfMxRecebim.SB_SalvaItemClick(Sender: TObject);
Var
  CdREC,CdCNC:Integer;
  vInserir: Boolean;
begin
  if not SB_SalvaItem.Enabled then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Exit
  else if StrToInt(edtCodigoPRD.Text) <= 0 then
    Exit;

  if not VerificaFloatBranco(edtQuantidade.Text) then
    edtQuantidade.Text:='1';    

  if Item_Recebimento1.Estado  = 1 then
    vInserir := True
  else
    vInserir := False;

  if not Item_Recebimento1.FinalizaEdicao then
    Raise exception.Create('As alterações não foram salvas!');

  AtualizaControles(False,False);
  With Recebimento1 do
  Begin
    CdREC:=CodigoREC;
    CdCNC:=CodigoCNC;
    if vInserir then
    Begin
      ExecutaSQL(DM.QR_Comandos,'UPDATE RECEBIMENTO SET '+
        ' REC_TOT_ITEM=REC_TOT_ITEM+1 '+
        ',REC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND REC_CODIGO='+IntToStr(CdREC));
      Close;
      Open;
      LocalizarCod(CdREC, CdCNC);
    end;
  End;
  if vInserir then
    SB_NovoItemClick(sender);
end;

procedure TfMxRecebim.SB_CancItemClick(Sender: TObject);
var
  aux:TNotifyEvent;
begin
  aux := edtCodigoPRD.OnExit;
  edtCodigoPRD.OnExit := nil;
  Item_Recebimento1.CancelaEdicao;
  AtualizaControles(False,False);
  if Item_Recebimento1.IsEmpty then
  Begin
    ApagaProduto;
    edtCodigoPRD.Clear;
    edtQuantidade.Clear;
  end
  else
    CarregaProduto;
  edtCodigoPRD.OnExit := aux;  
end;

procedure TfMxRecebim.SB_PrimPedClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxRecebim.SB_AntPedClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxRecebim.SB_ProxPedClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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


procedure TfMxRecebim.SB_PrimItemClick(Sender: TObject);
begin
  if Item_Recebimento1.IsEmpty then
   abort;
 if Item_Recebimento1.IsEmpty then
   abort;
 If Item_Recebimento1.bof Then
  begin
    SB_AntItem.Enabled:=False;
    SB_PrimItem.Enabled:=False;
  end
  Else
  begin
    Item_Recebimento1.First;
    SB_AntItem.Enabled:=False;
    SB_PrimItem.Enabled:=False;
  end;
  If not Item_Recebimento1.eof Then
  begin
    SB_ProxItem.Enabled:=True;
    SB_UltItem.Enabled:=True;
  end;
end;

procedure TfMxRecebim.SB_AntItemClick(Sender: TObject);
begin
  if Item_Recebimento1.IsEmpty then
   abort;
 if Item_Recebimento1.IsEmpty then
   abort;
 If Item_Recebimento1.bof Then
  begin
    SB_AntItem.Enabled:=False;
    SB_PrimItem.Enabled:=False;
  end
  Else
  begin
    Item_Recebimento1.Prior;
    If Item_Recebimento1.bof Then
    begin
     SB_AntItem.Enabled:=False;
     SB_PrimItem.Enabled:=False;
    end;
  end;
  If not Item_Recebimento1.eof Then
  begin
    SB_ProxItem.Enabled:=True;
    SB_UltItem.Enabled:=True;
  end;
end;

procedure TfMxRecebim.SB_ProxItemClick(Sender: TObject);
begin
  if Item_Recebimento1.IsEmpty then
   abort;
 if Item_Recebimento1.IsEmpty then
   abort;
  If Item_Recebimento1.eof Then
  begin
    SB_ProxItem.Enabled:=False;
    SB_UltItem.Enabled:=False;
  end
  Else
  begin
    Item_Recebimento1.Next;
    If Item_Recebimento1.eof Then
    begin
     SB_ProxItem.Enabled:=False;
     SB_UltItem.Enabled:=False;
    end;
  end;
  If not Item_Recebimento1.bof Then
  begin
    SB_AntItem.Enabled:=True;
    SB_PrimItem.Enabled:=True;
  end;
end;

procedure TfMxRecebim.SB_UltItemClick(Sender: TObject);
begin
  if Item_Recebimento1.IsEmpty then
   abort;
 if Item_Recebimento1.IsEmpty then
   abort;
  If Item_Recebimento1.eof Then
  begin
    SB_ProxItem.Enabled:=False;
    SB_UltItem.Enabled:=False;
  end
  Else
  begin
    Item_Recebimento1.Last;
    SB_ProxItem.Enabled:=False;
    SB_UltItem.Enabled:=False;
  end;
  If not Item_Recebimento1.bof Then
  begin
    SB_AntItem.Enabled:=True;
    SB_PrimItem.Enabled:=True;
  end;
end;

procedure TfMxRecebim.edtCodigoPRDExit(Sender: TObject);
var
  CdCNC, CdPRD: integer;
  Trans: Boolean;
begin
  if SB_CancItem.Focused or
     (not SB_CancItem.Enabled) then
    Exit;

  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;    

  with Produto1 do
  Begin
    try
      if CodigoPRD <> StrToInt(edtCodigoPRD.Text) then
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
        if CodigoCDB_Barras <> edtCodigoPRD.Text then
        Begin
          Close;
          paramByName('CDB_CODIGO_BARRAS').asString := edtCodigoPRD.Text;
          Open;
        end;
        if not IsEmpty then
        Begin
          edtCodigoPRD.Text := IntToStr(CodigoCDB_Entrada);
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
          Produto1.Open;
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
      Close;
      ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
      Open;
    End;
    if IsEmpty then
    Begin
      Showmessage('Produto inexistente!');
      edtCodigoPRD.SetFocus;
      Exit;
    End;
  end;

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdPRD := StrToInt(edtCodigoPRD.Text);

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 * '+
      ' FROM ITEM_DE_RECEBIMENTO '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND REC_CODIGO='+IntToStr(Entidade.CodigoREC)+
      ' AND PRD_CODIGO='+IntToStr(CdPRD);
    Open;
    If not IsEmpty Then
    Begin
      if DM.Configuracao1.ItemAutomatico = 1 then
      Begin
        SB_CancItem.SetFocus;
        SB_CancItemClick(sender);
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_RECEBIMENTO SET '+
              ' IRC_QUANTIDADE=IRC_QUANTIDADE+1 '+
              ',IRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND REC_CODIGO='+IntToStr(Entidade.CodigoREC)+
              ' AND PRD_CODIGO='+IntToStr(CdPRD));

            Commit;
            Trans := False;

            Item_Recebimento1.Close;
            Item_Recebimento1.Open;

            SB_NovoItemClick(sender);
          except
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        End;
        Exit;
      end;

      try
        edtCodigoPRD.SetFocus;
      except
      end;
      Raise exception.Create('Este produto já foi incluído!'+#13+'Sendo necessário você pode alterá-lo!');
    end;
  end;

  if DM.Configuracao1.Empresa = empMotical then
  Begin
    if not Item_Recebimento1.IsEmpty then
    Begin
      with DM.QR_Consultas do
      Begin
        //Verificar Somente Produto Especiais //Atenção Verificar <Fabricar>
        Close;
        SQL.Text := 'SELECT COUNT(DISTINCT G1.GRP_ESPECIAL) CONTAR '+
          ' FROM PRODUTO P1, GRUPO G1 '+
          ' WHERE (PRD_CODIGO='+edtCodigoPRD.Text+
          ' OR PRD_CODIGO='+IntToStr(CdPRD)+') '+
          ' AND G1.GRP_CODIGO=P1.GRP_CODIGO ';
        Open;
        if FieldByName('CONTAR').asInteger > 1 then
        Begin
          try
            edtCodigoPRD.SetFocus;
          except
          end;
          Raise exception.Create('Não é possível misturar Produtos Especiais!');
        end;
      end;
    end;
  end;

  if DM.Configuracao1.Empresa = empEletro then
    edtProduto.text := Trim(Produto1.Descricao+' '+Produto1.Caracteristica)
  else
    edtProduto.text := Produto1.Descricao;
  edtUnidade.text:=Produto1.Unidade;
  edtReferencia.text:=Produto1.Referencia;
  edtMarca.Text:=Produto1.Marca;
end;

procedure TfMxRecebim.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If (SB_SalvaPed.Enabled) or (SB_SalvaItem.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxRecebim.Recebimento1AfterScroll(DataSet: TDataSet);
begin
  if not Entidade.IsEmpty then
    Entidade.CarregaDados;
    
  if Item_Recebimento1.IsEmpty then
  Begin
    edtCodigoPRD.Clear;
    ApagaProduto;
    edtQuantidade.Clear;
  end;
end;

procedure TfMxRecebim.Item_Recebimento1AfterScroll(DataSet: TDataSet);
begin
  CarregaProduto;
end;

procedure TfMxRecebim.SB_CancelarClick(Sender: TObject);
var
  CodigoOri, cTipoMov: integer;
  Trans : Boolean;
begin
  If Entidade.Situacao=3 then
    raise Exception.create('O recebiento já foi cancelado!');
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar recebimentos neste centro de custo!');

  if Application.MessageBox('Deseja cancelar o recebimento?','Atenção',MB_YESNO+MB_ICONQUESTION) <> ID_YES then
    exit;

  If Entidade.Situacao=1 then
  Begin
    if MessageDlg('Este embarque já foi processado! Confirma seu cancelamento?',
       mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
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

        with Item_Recebimento1 do
        begin
          first;
          try
            CodigoOri := StrToInt(edtCodigoOrigem.Text);
          except
            CodigoOri := CodigoREC;
          end;
          cTipoMov := 510; //Cancelamento de Recebimento
          while not eof do
          begin
            Item_de_Estoque1.Close;
            Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
            Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
            Item_de_Estoque1.Open;
            If Item_de_Estoque1.IsEmpty then
            Begin
              if not Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),
                       0,0,0,0,0,0,0,0,0,0,0,0) then
                Raise Exception.Create('');
              Item_de_Estoque1.Close;
              Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=CodigoCNC;
              Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
              Item_de_Estoque1.Open;
            end;

            //Gerar MEF
            if not DM.Movimento_Fisico1.Inserir(CodigoCNC,0,CodigoPRD,0(*CdFUN*),
                CodigoCNC,CodigoREC,cTipoMov,'S',Quantidade,
                Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end;
            //Gerar MEC
            if not DM.Movimento_Estoque_Comercial1.Inserir(CodigoCNC,0,
                CodigoPRD,0(*CdFUN*),cTipoMov,CodigoCNC,CodigoOri,'S', Quantidade,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                'RECEBIMENTO - CANCELADO') then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
              ',IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
              ' AND PRD_CODIGO='+IntToStr(CodigoPRD));
            next;
          end;
        end;
        ExecutaSQL(DM.QR_Comandos,'UPDATE RECEBIMENTO SET '+
          ' REC_SITUACAO=3 '+
          ',REC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND REC_CODIGO='+IntToStr(Entidade.CodigoREC));

        If DM.Configuracao1.ControleTransacao then
          if trans then
            Commit;
      except
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
          end;
      end;
    end;
  End
  else
    ExecutaSQL(DM.QR_Comandos,'UPDATE RECEBIMENTO '+
      ' SET REC_SITUACAO=3'+
      ',REC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND REC_CODIGO='+IntToStr(Entidade.CodigoREC));

  Entidade.close;
  Entidade.Open;
end;

procedure TfMxRecebim.SB_EtiquetaClick(Sender: TObject);
var
  sProduto, sCodigoBarras: string;
  PUmPoQuantidade: Boolean;
  iQuantidade: integer;
begin
  if Recebimento1.IsEmpty then
    raise Exception.create('Selecione o Recebimento!');
  Etiquetas1.Close;
  Etiquetas1.SQL.Text := 'SELECT T1.*, T2.IRC_QUANTIDADE '+
      ' FROM PRODUTO T1, ITEM_DE_RECEBIMENTO T2 '+
      ' WHERE T1.PRD_CODIGO=T2.PRD_CODIGO AND T2.REC_CODIGO='+edtCodigoREC.Text+
      ' ORDER BY T1.PRD_CODIGO ';
  Etiquetas1.Open;
  if Etiquetas1.IsEmpty then
    Raise Exception.Create('O arquivo não foi gerado!');

  PUmPoQuantidade := (MessageDlg('Deseja um registro para cada item do produto?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes);

  Etiquetas1.LimpaEtiquetas;
  while not Etiquetas1.EOF do
  begin
    if DM.Configuracao1.Empresa = 1 then
      sProduto := Etiquetas1.Descricao+' '+Etiquetas1.Caracteristica
    else
      sProduto := Etiquetas1.Descricao;

    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 * '+
        ' FROM CODIGO_DE_BARRAS '+
        ' WHERE CDB_CODIGO_ENTRADA='+IntToStr(Etiquetas1.CodigoPRD)+
        ' AND CDB_TIPO=0 ';
      Open;
      sCodigoBarras := FieldByName('CDB_CODIGO_BARRAS').asString;
    end;

    iQuantidade := Etiquetas1.FieldByName('IRC_QUANTIDADE').asInteger;

    if (DM.Configuracao1.Empresa = empEletro) and
       (iQuantidade > 0) and
       (Etiquetas1.Estmedio > 1) then //Volume
      iQuantidade := Trunc(iQuantidade*Etiquetas1.Estmedio); //Volume

    Etiquetas1.AdicionaEtiqueta(Etiquetas1.CodigoPRD,Etiquetas1.Precovenda,
       iQuantidade,sProduto,
       Etiquetas1.Referencia, Etiquetas1.Detalhe, Etiquetas1.Caracteristica, Etiquetas1.Marca, sCodigoBarras, PUmPoQuantidade);
    Etiquetas1.Next;
  end;
  Etiquetas1.FechaEtiquetas;
  ShowMessage('Arquivo gerado com sucesso !');
  Etiquetas1.Close;
end;

procedure TfMxRecebim.Recebimento1CalcFields(DataSet: TDataSet);
begin
  case Entidade.Tipo of
    0: Entidade.FieldByName('Tipo').asString:='Transferência';
    1: Entidade.FieldByName('Tipo').asString:='Abastecimento';
    2: Entidade.FieldByName('Tipo').asString:='Compra';
  end;
end;


procedure TfMxRecebim.SB_ImprimirClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.create('Selecione o Recebimento!');
//  if Entidade.Situacao <> 1 then
//    Raise exception.Create('Somente na situação 1!');

  Application.CreateForm(Trpt_Recebimento, rpt_Recebimento);
  rpt_Recebimento.Produto1.Open;
  rpt_Recebimento.CentroCusto1.Open;
  rpt_Recebimento.Recebimento1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  rpt_Recebimento.Recebimento1.ParamByName('REC_CODIGO').AsInteger := Entidade.CodigoREC;
  rpt_Recebimento.Recebimento1.Open;
  rpt_Recebimento.Report.Preview;
end;

procedure TfMxRecebim.Item_Recebimento1CalcFields(DataSet: TDataSet);
begin
  Produto2.Close;
  Produto2.ParamByName('PRD_CODIGO').asInteger:=Item_Recebimento1.CodigoPRD;
  Produto2.Open;
  Item_Recebimento1.FieldByName('Produto').asString:=Produto2.Descricao;
end;

procedure TfMxRecebim.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=#27 then
  Begin
    key:=#0;
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else if SB_CancItem.Enabled then
    Begin
      SB_CancItem.SetFocus;
      SB_CancItemClick(sender);
    end
    else
      Close;
  end
  else if Key=chr(13) then
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      try
        SB_SalvaPed.SetFocus;
      except
      end;
      SB_SalvaPedClick(sender);
    end
    else if SB_SalvaItem.Enabled then
    Begin
      try
        SB_SalvaItem.SetFocus;
      except
      end;
      SB_SalvaItemClick(sender);
    end;
  end
  Else If (key=#32) then
  Begin
    if (edtCodigoPRD.Focused) then
    Begin
      key:=#0;
      if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
      Begin
        Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
        with fMxSPedProdMotcal do
        Begin
          Tag:=14;
          ShowModal;
        end;
      end
      else
      Begin
        Application.CreateForm(TfMxSPedProd, fMxSPedProd);
        with fMxSPedProd do
        Begin
          Tag:=14;
          ShowModal;
        end;
      end;
      edtQuantidade.SetFocus;
    end
    else If (edtCodigoFOR.Focused) then
    Begin
      key:=#0;
      Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
      fMxSCotaFor.Fornecedor1.Close;
      fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      fMxSCotaFor.Fornecedor1.Open;
      fMxSCotaFor.tag:=2;
      fMxSCotaFor.ShowModal;
    end;
  end;
end;

procedure TfMxRecebim.CarregaProduto;
Begin
  Item_Recebimento1.CarregaDados;
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_Recebimento1.CodigoPRD;
  Produto1.Open;
  edtProduto.Text := Produto1.Descricao;
  edtUnidade.Text := Produto1.Unidade;
  edtReferencia.Text := Produto1.Referencia;
  edtMarca.Text := Produto1.Marca;
end;

procedure TfMxRecebim.ApagaProduto;
Begin
  edtProduto.Clear;
  edtUnidade.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;
end;

procedure TfMxRecebim.AtualizaControles(Cabecalho, Habilitar: Boolean);
begin
  DateTimePicker1.Enabled      := not Habilitar;

  Sair1.Enabled           := not Habilitar;
  IncluirPed.Enabled      := not Habilitar;
  AlterarPed.Enabled      := not Habilitar;
  ExcluirPed.Enabled      := not Habilitar;
  SalvarPed.Enabled       := (Cabecalho and Habilitar);
  CancelarPed.Enabled     := (Cabecalho and Habilitar);
  SB_PrimPed.Enabled      := not Habilitar;
  SB_AntPed.Enabled       := not Habilitar;
  SB_ProxPed.Enabled      := not Habilitar;
  SB_UltPed.Enabled       := not Habilitar;
  SB_NovoPed.Enabled      := not Habilitar;
  SB_AltPed.Enabled       := not Habilitar;
  SB_ExcPed.Enabled       := not Habilitar;
  SB_SalvaPed.Enabled     := (Cabecalho and Habilitar);
  SB_CancPed.Enabled      := (Cabecalho and Habilitar);

  Incluir2.Enabled         := not Habilitar;
  Excluir2.Enabled         := not Habilitar;
  Salvar2.Enabled          := ((not Cabecalho) and Habilitar);
  Cancelar2.Enabled        := ((not Cabecalho) and Habilitar);
  SB_PrimItem.Enabled      := not Habilitar;
  SB_AntItem.Enabled       := not Habilitar;
  SB_ProxItem.Enabled      := not Habilitar;
  SB_UltItem.Enabled       := not Habilitar;
  SB_NovoItem.Enabled      := not Habilitar;
  SB_Transferencia.Enabled := not Habilitar;
  SB_ExcItem.Enabled       := not Habilitar;
  SB_SalvaItem.Enabled     := ((not Cabecalho) and Habilitar);
  SB_CancItem.Enabled      := ((not Cabecalho) and Habilitar);

  SB_Verificar.Enabled     := not Habilitar;
  SB_Confirmar.Enabled     := not Habilitar;
  SB_Imprimir.Enabled      := not Habilitar;
  SB_Etiqueta.Enabled      := not Habilitar;
  SB_Cancelar.Enabled      := not Habilitar;
  SB_Fechar.Enabled        := not Habilitar;

  DBGrid1.Enabled      := not Habilitar;
  DBGrid5.Enabled      := not Habilitar;
end;

procedure TfMxRecebim.SB_VerificarClick(Sender: TObject);
begin
  if Item_Recebimento1.isEmpty then
    Raise exception.Create('Selecione Pedido com Itens!');

  Application.CreateForm(TfMxVerificarMercadoria, fMxVerificarMercadoria);
  with fMxVerificarMercadoria do
  Begin
    Tag := 3; //Tipo Recebimento
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Item_Recebimento1.CodigoREC));
    edtCodigoCNC.Text := IntToStr(self.Item_Recebimento1.CodigoCNC);
    edtPedido.Text    := IntToStr(self.Item_Recebimento1.CodigoREC);
    edtDescricao.Text := self.edtNumeroDocumento.Text;
    Showmodal;
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Item_Recebimento1.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Item_Recebimento1.CodigoREC));
  end;
end;

procedure TfMxRecebim.SB_TransferenciaClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Recebimento!');
  If Entidade.Situacao>=1 then
    Raise Exception.Create('Este recebimento já foi processado!');
  Application.CreateForm(TfmxSelTransferencia, fmxSelTransferencia);
  fMxSelTransferencia.Tag := 1;
  fMxSelTransferencia.ShowModal;

  Item_Recebimento1.Close;
  Item_Recebimento1.Open;
end;

end.
