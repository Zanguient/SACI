unit MxReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Menus, CentroCusto, Produto, Item_de_Estoque, ReservaExterna;

type
  TfMxReserva = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Liberar: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label1: TLabel;
    edtCodigoREX: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtQuantidade: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    mskDataHora: TMaskEdit;
    memObservacao: TMemo;
    Label2: TLabel;
    dblCodigoCNCOrigem: TDBLookupComboBox;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Reserva1: TMenuItem;
    IncluirCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Produto1: TProduto;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    ReservaExterna1: TReservaExterna;
    DSReservaExterna1: TDataSource;
    edtCodigoPDV: TEdit;
    Item_de_Estoque1: TItem_de_Estoque;
    edtDisponivel: TEdit;
    Label3: TLabel;
    ReservaExterna1CNC_CODIGO: TIntegerField;
    ReservaExterna1REX_CODIGO: TIntegerField;
    ReservaExterna1PDV_CODIGO: TIntegerField;
    ReservaExterna1PRD_CODIGO: TIntegerField;
    ReservaExterna1CNC_CODIGO_REQ: TIntegerField;
    ReservaExterna1REX_QUANTIDADE: TFloatField;
    ReservaExterna1REX_DATA: TDateTimeField;
    ReservaExterna1REX_OBS1: TStringField;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtSituacao: TEdit;
    Label9: TLabel;
    LiberarCab: TMenuItem;
    Label10: TLabel;
    ReservaExterna1REX_SITUACAO: TSmallintField;
    ReservaExterna1Produto: TStringField;
    ReservaExterna1Centro: TStringField;
    CentroCusto2: TCentroCusto;
    ReservaExterna1Liberada: TStringField;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_LiberarClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ReservaExterna1AfterScroll(DataSet: TDataSet);
    procedure CentroCusto1BeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure ReservaExterna1BeforeOpen(DataSet: TDataSet);
    procedure ReservaExterna1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TReservaExterna;
  end;

var
  fMxReserva: TfMxReserva;

implementation
Uses UDM,funcoes, MxSPediProd, MxSPediProdMotCal;
{$R *.DFM}



procedure TfMxReserva.SB_PrimClick(Sender: TObject);
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

procedure TfMxReserva.SB_AntClick(Sender: TObject);
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

procedure TfMxReserva.SB_ProxClick(Sender: TObject);
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

procedure TfMxReserva.SB_UltClick(Sender: TObject);
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

procedure TfMxReserva.SB_NovoCabClick(Sender: TObject);
begin
  if (DM.Configuracao1.CodigoCNC <> Entidade.CentroDeCusto) and
     ((Entidade.CentroDeCusto <> 0) or //CPD
      (DM.Configuracao1.CodigoCNC <> DM.Configuracao1.Deposito)) then
    Raise exception.Create('Centro de Custo inválido!');
  Entidade.PreparaInsercao;
  AtualizaControles( 1, True);
  edtDisponivel.Clear;
  edtProduto.Clear;
  edtCodigoPDV.SetFocus;
end;

procedure TfMxReserva.SB_LiberarClick(Sender: TObject);
var
  CdREX,CdCNC,CdPRD:integer;
  vQuantidade: Double;
  trans:boolean;
begin
  if (DM.Configuracao1.CodigoCNC <> Entidade.CentroDeCusto) and
     ((Entidade.CentroDeCusto <> 0) or //CPD
      (DM.Configuracao1.CodigoCNC <> DM.Configuracao1.Deposito)) then
  If Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Registro!');
  if Entidade.Situacao = 1 then
    Raise Exception.Create('Reserva já liberada!');
  if (DM.Configuracao1.CodigoCNC <> Entidade.CentroDeCusto) and
     (DM.Configuracao1.CodigoCNC <> 0) then
    Raise exception.Create('Centro de Custo inválido!');    
    
  CdCNC := Entidade.CodigoCNC;
  CdREX := Entidade.CodigoREX;
  CdPRD := Entidade.CodigoPRD;
  vQuantidade := Entidade.Quantidade;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    ParamByName('PRD_CODIGO').AsInteger := CdPRD;
    open;
    If isempty then
    Begin
      if not Inserir(CdCNC, CdPRD,0(*CdFUN*),0,0,0,0,0,
          DM.Configuracao1.DataHora,0,0,0,0,0,0) then
        Raise exception.Create('Não foi possível criar o Item de Estoque!');
      Close;
      ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      ParamByName('PRD_CODIGO').AsInteger := CdPRD;
      open;
    end;
  end;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
        ' IES_SRESERVADO=IES_SRESERVADO-'+VirgPonto(vQuantidade)+
        ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      ExecutaSQL(DM.QR_Comandos,'UPDATE RESERVA_EXTERNA SET '+
        ' REX_SITUACAO=1 '+
        ' WHERE REX_CODIGO='+IntToStr(CdREX)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));

      Entidade.GeraLog(2250,CdCNC,CdREX,'L PRD:'+IntToStr(CdPRD)+' QTD:'+format('%.2f',[vQuantidade]));

      Commit;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  End;
  Entidade.Close;
  Entidade.Open;
  Entidade.LocalizarCod(CdREX,CdCNC);
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtProduto.Clear;
    edtDisponivel.Clear;
  end;
end;

procedure TfMxReserva.SB_SalvaCabClick(Sender: TObject);
var
  mensagem:string;
  CdCNC, CdPRD: integer;
  vQuantidade: Double;
  trans:boolean;
begin
  mensagem:='';
  if not VerificaInteiroBranco(edtCodigoPDV.text) then
    mensagem:=mensagem+'Pedido digitado incorretamente!'+#13;
  if not VerificaFloatBranco(edtQuantidade.text) then
    mensagem:=mensagem+'Quantidade digitada incorretamente!'+#13;
  If not VerificaInteiroBranco(edtCodigoPRD.Text) then
    mensagem:=mensagem+'Produto inválido!'+#13;
  If (dblCodigoCNCOrigem.Text = '') or (DM.Configuracao1.CodigoCNC=dblCodigoCNCOrigem.KeyValue) then
    mensagem:=mensagem+'Loja requisitante inválida!'+#13;
  if mensagem<>'' then
    raise exception.create(mensagem);

  CdCNC := DM.Configuracao1.CodigoCNC;
  CdPRD := StrToInt(edtCodigoPRD.Text);
  vQuantidade := StrToFloat(edtQuantidade.Text);

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').AsInteger := CdCNC;
    ParamByName('PRD_CODIGO').AsInteger := CdPRD;
    open;
    If isempty then
    Begin
      if not Inserir(CdCNC, CdPRD,0(*CdFUN*),0,0,0,0,0,
          DM.Configuracao1.DataHora,0,0,0,0,0,0) then
        Raise exception.Create('Falha ao criar item de Estoque!'+IntToStr(CdPRD));
      Close;
      ParamByName('CNC_CODIGO').AsInteger := CdCNC;
      ParamByName('PRD_CODIGO').AsInteger := CdPRD;
      open;
    end;
  end;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      if Entidade.FinalizaEdicao then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
          ' IES_SRESERVADO=IES_SRESERVADO+'+VirgPonto(vQuantidade)+
          ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));
        AtualizaControles(1, False);
      end
      else
        Raise exception.Create('');

      if trans then
        Commit;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  End;
  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
    ParamByName('PRD_CODIGO').asInteger := Entidade.COdigoPRD;
    Open;
    edtDisponivel.Text:=format('%.2f',[Saldo]);
  end;
end;

procedure TfMxReserva.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtProduto.Clear;
    edtDisponivel.Clear;
  end;
  edtSituacao.Text:='';
end;


procedure TfMxReserva.FormCreate(Sender: TObject);
begin
  Entidade := ReservaExterna1;
end;

procedure TfMxReserva.SB_LocCabClick(Sender: TObject);
 var
  mensagem:string;
begin
 mensagem:='';
 If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      mensagem:= mensagem+'Código a ser localizado inválido!'+#13;
 If cmbCampo.ItemIndex=1 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      mensagem:= mensagem+'Pedido a ser localizado inválido!';
 if mensagem<>'' then
   raise exception.Create(mensagem);
 Entidade.Selecionar;
end;


procedure TfMxReserva.Cliente1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxReserva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  CentroCusto1.Active:=False;
  Action:=Cafree;
end;

procedure TfMxReserva.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxReserva.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxReserva.ReservaExterna1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtProduto.Text := Entidade.FieldByName('Produto').asString;
  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
    ParamByName('PRD_CODIGO').asInteger := Entidade.COdigoPRD;
    Open;
    edtDisponivel.Text:=format('%.2f',[Saldo]);
  end;
end;


procedure TfMxReserva.CentroCusto1BeforeOpen(DataSet: TDataSet);
begin
  CentroCusto1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfMxReserva.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto1.Open;  
  Entidade.Open;
  cmbCampo.ItemIndex:=2;
  edtLocalizar.SetFocus;
end;

procedure TfMxReserva.edtCodigoPRDExit(Sender: TObject);
begin
  If SB_CancCab.Focused then
    Exit;
  edtDisponivel.Clear;
  edtProduto.Clear;
  if not VerificaInteiroBranco(TEdit(Sender).text) then
  Begin
    Showmessage('Código de produto inválido!');
    TEdit(Sender).SetFocus;
    Exit;
  End;

  with Produto1 do
  Begin
    if CodigoPRD <> StrToInt(edtCodigoPRD.Text) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
      Open;
    end;
    if IsEmpty then
    Begin
      Showmessage('Produto inválido!');
      edtCodigoPRD.SetFocus;
      Exit;
    End
    else
      edtProduto.Text := Trim(Descricao+' '+Caracteristica);
  end;

  with Item_de_Estoque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
    ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
    Open;
    If not IsEmpty Then
      edtDisponivel.Text:=format('%.2f',[Saldo])
    Else
    Begin
      Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPRD.Text),0(*CdFUN*),0,0,0,0,0,
        DM.Configuracao1.DataHora,0,0,0,0,0,0);
      Close;
      ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
      ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
      Open;
      edtDisponivel.Text := '0,00';
    end;
  end;
end;

procedure TfMxReserva.ReservaExterna1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfMxReserva.ReservaExterna1CalcFields(DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    if CodigoPRD <> Entidade.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    Entidade.FieldByName('Produto').asString := Trim(Descricao+' '+Caracteristica);
  end;

  with CentroCusto2 do
  Begin
    if CodigoCNC <> Entidade.CodigoCNCREQ then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNCREQ;
      Open;
    end;
    Entidade.FieldByName('Centro').asString := RazaoSocial;
  end;

  case Entidade.Situacao of
    0: Entidade.FieldByName('Liberada').asString:='NÃO';
    1: Entidade.FieldByName('Liberada').asString:='SIM';
  end;
end;

procedure TfMxReserva.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then //Esc
  Begin
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if Key=chr(13) then //Enter
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
  if edtCodigoPRD.Focused then
  Begin
    If key=chr(32) then //Barra de Espaço
    Begin
      edtCodigoPRD.Clear;
      key:=chr(0);
      if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
      Begin
        Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
        with fMxSPedProdMotcal do
        Begin
          Tag:=47;
          ShowModal;
        end;
      end
      else
      Begin
        Application.CreateForm(TfMxSPedProd, fMxSPedProd);
        with fMxSPedProd do
        Begin
          Tag:=47;
          ShowModal;
        end;
      end;
      edtQuantidade.SetFocus;
    End
    else
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
end;

procedure TfMxReserva.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirCab.Enabled    := not Habilitar;
  LiberarCab.Enabled    := not Habilitar;
  SalvarCab.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarCab.Enabled   := ((Cabecalho=1) and Habilitar);
  LocalizarCab.Enabled  := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoCab.Enabled    := not Habilitar;
  SB_LocCab.Enabled     := not Habilitar;
  SB_SalvaCab.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancCab.Enabled    := ((Cabecalho=1) and Habilitar);

  SB_Liberar.Enabled    := not Habilitar;

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

procedure TfMxReserva.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
