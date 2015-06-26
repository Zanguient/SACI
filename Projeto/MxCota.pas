unit MxCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Produto, ComCtrls, Manufaturado, Item_de_Manufaturado,
  Movimento_Fisico, Movimento_Estoque_Comercial, Item_de_Estoque, Menus,
  Item_de_Cota, Cota, Vendedor, Usuario;

type
  TfMxCota = class(TForm)
    Panel3: TPanel;
    Panel5: TPanel;
    SpeedButton5: TSpeedButton;
    Panel6: TPanel;
    dbgItens: TDBGrid;
    Label14: TLabel;
    dbgCabecalho: TDBGrid;
    Label1: TLabel;
    edtCodigoCOT: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    mskDataAlterado: TMaskEdit;
    mskDataCadastro: TMaskEdit;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    SB_Novo: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Prim1: TSpeedButton;
    SB_Ant1: TSpeedButton;
    SB_Prox1: TSpeedButton;
    SB_Ult1: TSpeedButton;
    SB_Novo1: TSpeedButton;
    SB_Exc1: TSpeedButton;
    SB_Salva1: TBitBtn;
    SB_Canc1: TBitBtn;
    edtCota1: TEdit;
    Label18: TLabel;
    SB_Imprimir: TSpeedButton;
    Label13: TLabel;
    edtMes: TEdit;
    Label2: TLabel;
    Label11: TLabel;
    edtDiasUteis: TEdit;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Manufaturado2: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    ItemdeManufaturado1: TMenuItem;
    Incluir2: TMenuItem;
    Excluir2: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Salvar2: TMenuItem;
    Cancelar2: TMenuItem;
    Label10: TLabel;
    edtAno: TEdit;
    Label5: TLabel;
    edtDiasNUteis: TEdit;
    dblVendedor: TDBLookupComboBox;
    Label6: TLabel;
    Cota1: TCota;
    Item_de_Cota1: TItem_de_Cota;
    DSCota1: TDataSource;
    DSItem_de_Cota1: TDataSource;
    Cota1CNC_CODIGO: TIntegerField;
    Cota1COT_CODIGO: TIntegerField;
    Cota1USU_CODIGO: TIntegerField;
    Cota1COT_DT_CADASTRO: TDateTimeField;
    Cota1COT_DT_ALTERADO: TDateTimeField;
    Cota1COT_MES: TIntegerField;
    Cota1COT_ANO: TIntegerField;
    Cota1COT_DIAS_UTEIS: TIntegerField;
    Cota1COT_DIAS_NAO_UTEIS: TIntegerField;
    Cota1Epoca: TStringField;
    SB_Calendario: TSpeedButton;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    Vendedor2: TVendedor;
    Item_de_Cota1Vendedor: TStringField;
    Label7: TLabel;
    edtCodigoICA: TEdit;
    Label8: TLabel;
    edtUsuario: TEdit;
    Cota1Usuario: TStringField;
    Label9: TLabel;
    edtCota2: TEdit;
    Label12: TLabel;
    edtCota3: TEdit;
    Label15: TLabel;
    edtComissao1: TEdit;
    Label16: TLabel;
    edtComissao2: TEdit;
    Label17: TLabel;
    edtComissao3: TEdit;
    Label19: TLabel;
    edtComissao4: TEdit;
    Label20: TLabel;
    edtCota4: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtCota10: TEdit;
    edtCota20: TEdit;
    edtCota30: TEdit;
    edtComissao10: TEdit;
    edtComissao20: TEdit;
    edtComissao30: TEdit;
    Label27: TLabel;
    edtComissao40: TEdit;
    Label28: TLabel;
    edtCota40: TEdit;
    Item_de_Cota1CNC_CODIGO: TIntegerField;
    Item_de_Cota1ICA_CODIGO: TIntegerField;
    Item_de_Cota1COT_CODIGO: TIntegerField;
    Item_de_Cota1FUN_CODIGO: TIntegerField;
    Item_de_Cota1ICA_COTA1: TFloatField;
    Item_de_Cota1ICA_COTA2: TFloatField;
    Item_de_Cota1ICA_COTA3: TFloatField;
    Item_de_Cota1ICA_COMISSAO1: TFloatField;
    Item_de_Cota1ICA_COMISSAO2: TFloatField;
    Item_de_Cota1ICA_COMISSAO3: TFloatField;
    Item_de_Cota1ICA_COTA4: TFloatField;
    Item_de_Cota1ICA_COMISSAO4: TFloatField;
    Item_de_Cota1ICA_COTA10: TFloatField;
    Item_de_Cota1ICA_COTA20: TFloatField;
    Item_de_Cota1ICA_COTA30: TFloatField;
    Item_de_Cota1ICA_COTA40: TFloatField;
    Item_de_Cota1ICA_COMISSAO10: TFloatField;
    Item_de_Cota1ICA_COMISSAO20: TFloatField;
    Item_de_Cota1ICA_COMISSAO30: TFloatField;
    Item_de_Cota1ICA_COMISSAO40: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_Novo1Click(Sender: TObject);
    procedure SB_Exc1Click(Sender: TObject);
    procedure SB_Salva1Click(Sender: TObject);
    procedure SB_Canc1Click(Sender: TObject);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_Prim1Click(Sender: TObject);
    procedure SB_Ant1Click(Sender: TObject);
    procedure SB_Prox1Click(Sender: TObject);
    procedure SB_Ult1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Fechar1Click(Sender: TObject);
    procedure Cota1BeforeOpen(DataSet: TDataSet);
    procedure Cota1AfterScroll(DataSet: TDataSet);
    procedure Item_de_Cota1AfterScroll(DataSet: TDataSet);
    procedure Cota1CalcFields(DataSet: TDataSet);
    procedure SB_CalendarioClick(Sender: TObject);
    procedure Vendedor1BeforeOpen(DataSet: TDataSet);
    procedure Item_de_Cota1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure dbgItensTitleClick(Column: TColumn);
    procedure dbgCabecalhoTitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TCota;
  end;

var
  fMxCota: TfMxCota;
const
  vMes : array [1..12] of string = ('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');

implementation
Uses
  UDM, funcoes, MxFeriados, UCotaComissao;
{$R *.DFM}

procedure TfMxCota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

procedure TfMxCota.FormCreate(Sender: TObject);
begin
  Entidade := Cota1;
  Entidade.open;
  Item_de_Cota1.Open;
end;

procedure TfMxCota.SpeedButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxCota.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Vendedor1.Close;
  Vendedor1.SQL.Text := 'SELECT FUN_CODIGO,FUN_NOME,SEC_CODIGO,CNC_CODIGO,FUN_APELIDO '+
    ' FROM FUNCIONARIO '+
    ' WHERE (FUN_APARECE_VENDAS=1 '+
    '  OR FUN_APARECE_SERVICOS=1) '+
    ' AND FUN_SITUACAO<>1 '+
    ' AND (CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
    '  OR  FUN_TODOS_CENTROS=1) '+
    ' ORDER BY FUN_APELIDO ';
  Vendedor1.Open;
end;

procedure TfMxCota.SB_UltClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxCota.SB_NovoClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3870)) < 0 then
    raise Exception.Create('O usuário não tem permissão para incluir registro!');
  Entidade.PreparaInsercao;
  dbgItens.Enabled:=False;
  SB_Prim1.Enabled:=False;
  SB_Ant1.Enabled:=False;
  SB_Prox1.Enabled:=False;
  SB_Ult1.Enabled:=False;
  SB_Novo1.Enabled:=False;
  SB_Exc1.Enabled:=False;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Incluir1.Enabled:=False;
  Alterar1.Enabled:=False;
  Excluir1.Enabled:=False;
  Salvar1.Enabled:=True;
  Cancelar1.Enabled:=True;
  Incluir2.Enabled:=False;
  Excluir2.Enabled:=False;
  Salvar2.Enabled:=False;
  Cancelar2.Enabled:=False;
  SB_Imprimir.Enabled := False;
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtMes.SetFocus;
end;

procedure TfMxCota.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione primeiro o registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3870)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');
  dbgItens.Enabled:=False;
  Entidade.PreparaAlteracao;
  SB_Prim1.Enabled:=False;
  SB_Ant1.Enabled:=False;
  SB_Prox1.Enabled:=False;
  SB_Ult1.Enabled:=False;
  SB_Novo1.Enabled:=False;
  SB_Exc1.Enabled:=False;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Incluir1.Enabled:=False;
  Alterar1.Enabled:=False;
  Excluir1.Enabled:=False;
  Salvar1.Enabled:=True;
  Cancelar1.Enabled:=True;
  Incluir2.Enabled:=False;
  Excluir2.Enabled:=False;
  Salvar2.Enabled:=False;
  Cancelar2.Enabled:=False;
  SB_Imprimir.Enabled := False;
  edtMes.SetFocus;
end;

procedure TfMxCota.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione primeiro o registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3870)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if MessageDlg('Tem certeza que você deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) in [mrYes, 201] then
  Begin
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_COTA WHERE CNC_CODIGO='+
      IntToStr(Entidade.CodigoCNC)+' AND COT_CODIGO='+IntToStr(Entidade.CodigoCOT));
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM COTA WHERE CNC_CODIGO='+
      IntToStr(Entidade.CodigoCNC)+' AND COT_CODIGO='+IntToStr(Entidade.CodigoCOT));
  End;
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    edtCodigoCOT.Clear;
    edtDiasNUteis.Clear;
    edtCodigoICA.Clear;
    edtMes.Clear;
    edtAno.Clear;
    edtDiasUteis.Clear;
    edtUsuario.Clear;
    edtCota1.Clear;
    edtCota2.Clear;
    edtCota3.Clear;
    edtCota4.Clear;
    edtCota10.Clear;
    edtCota20.Clear;
    edtCota30.Clear;
    edtCota40.Clear;
    edtComissao1.Clear;
    edtComissao2.Clear;
    edtComissao3.Clear;
    edtComissao4.Clear;
    edtComissao10.Clear;
    edtComissao20.Clear;
    edtComissao30.Clear;
    edtComissao40.Clear;
    mskDataCadastro.Clear;
    mskDataAlterado.Clear;
    dblVendedor.KeyValue:=0;
  end;
end;

procedure TfMxCota.SB_SalvaClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
  Begin
    dbgItens.Enabled:=True;
    SB_Prim1.Enabled:=true;
    SB_Ant1.Enabled:=true;
    SB_Prox1.Enabled:=true;
    SB_Ult1.Enabled:=true;
    SB_Novo1.Enabled:=true;
    SB_Exc1.Enabled:=true;
    SB_Prim.Enabled:=true;
    SB_Ant.Enabled:=true;
    SB_Prox.Enabled:=true;
    SB_Ult.Enabled:=true;
    SB_Novo.Enabled:=true;
    SB_Alt.Enabled:=true;
    SB_Exc.Enabled:=true;
    SB_Salva.Enabled:=false;
    SB_Canc.Enabled:=false;
    Incluir1.Enabled:=True;
    Alterar1.Enabled:=True;
    Excluir1.Enabled:=True;
    Salvar1.Enabled:=False;
    Cancelar1.Enabled:=False;
    Incluir2.Enabled:=True;
    Excluir2.Enabled:=True;
    Salvar2.Enabled:=False;
    Cancelar2.Enabled:=False;
    SB_Imprimir.Enabled := True;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxCota.SB_CancClick(Sender: TObject);
begin
  dbgItens.Enabled:=True;
  Entidade.CancelaEdicao;
  SB_Prim1.Enabled:=true;
  SB_Ant1.Enabled:=true;
  SB_Prox1.Enabled:=true;
  SB_Ult1.Enabled:=true;
  SB_Novo1.Enabled:=true;
  SB_Exc1.Enabled:=true;
  SB_Prim.Enabled:=true;
  SB_Ant.Enabled:=true;
  SB_Prox.Enabled:=true;
  SB_Ult.Enabled:=true;
  SB_Novo.Enabled:=true;
  SB_Alt.Enabled:=true;
  SB_Exc.Enabled:=true;
  SB_Salva.Enabled:=false;
  SB_Canc.Enabled:=false;
  Incluir1.Enabled:=True;
  Alterar1.Enabled:=True;
  Excluir1.Enabled:=True;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  Incluir2.Enabled:=True;
  Excluir2.Enabled:=True;
  Salvar2.Enabled:=False;
  Cancelar2.Enabled:=False;
  SB_Imprimir.Enabled := True;
  if Entidade.IsEmpty then
  Begin
    edtCodigoCOT.Clear;
    edtDiasNUteis.Clear;
    edtCodigoICA.Clear;
    edtMes.Clear;
    edtAno.Clear;
    edtDiasUteis.Clear;
    edtUsuario.Clear;
    edtCota1.Clear;
    edtCota2.Clear;
    edtCota3.Clear;
    edtCota4.Clear;
    edtCota10.Clear;
    edtCota20.Clear;
    edtCota30.Clear;
    edtCota40.Clear;
    edtComissao1.Clear;
    edtComissao2.Clear;
    edtComissao3.Clear;
    edtComissao4.Clear;
    edtComissao10.Clear;
    edtComissao20.Clear;
    edtComissao30.Clear;
    edtComissao40.Clear;
    mskDataCadastro.Clear;
    mskDataAlterado.Clear;
    dblVendedor.KeyValue:=0;
  end;  
end;

procedure TfMxCota.SB_Novo1Click(Sender: TObject);
begin
  If Entidade.IsEmpty then
    raise Exception.Create('Não foi selecionado um Cota!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3870)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');
  dbgCabecalho.Enabled:=False;
  Item_de_Cota1.PreparaInsercao;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Prim1.Enabled:=False;
  SB_Ant1.Enabled:=False;
  SB_Prox1.Enabled:=False;
  SB_Ult1.Enabled:=False;
  SB_Novo1.Enabled:=False;
  SB_Exc1.Enabled:=False;
  SB_Salva1.Enabled:=True;
  SB_Canc1.Enabled:=True;
  Incluir1.Enabled:=False;
  Alterar1.Enabled:=False;
  Excluir1.Enabled:=False;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  Incluir2.Enabled:=False;
  Excluir2.Enabled:=False;
  Salvar2.Enabled:=True;
  Cancelar2.Enabled:=True;
  SB_Imprimir.Enabled := False;
  dblVendedor.SetFocus;
end;

procedure TfMxCota.SB_Exc1Click(Sender: TObject);
begin
  If Item_de_Cota1.IsEmpty then
    raise Exception.Create('Não existem itens a serem deletados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3870)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Item_de_Cota1.Deletarauto;
  if Item_de_Cota1.IsEmpty then
  Begin
    edtCodigoICA.Clear;
    edtCota1.Clear;
    edtCota2.Clear;
    edtCota3.Clear;
    edtCota4.Clear;
    edtCota10.Clear;
    edtCota20.Clear;
    edtCota30.Clear;
    edtCota40.Clear;
    edtComissao1.Clear;
    edtComissao2.Clear;
    edtComissao3.Clear;
    edtComissao4.Clear;
    edtComissao10.Clear;
    edtComissao20.Clear;
    edtComissao30.Clear;
    edtComissao40.Clear;
    dblVendedor.KeyValue:=0;
  end;
end;

procedure TfMxCota.SB_Salva1Click(Sender: TObject);
begin
  if Item_de_Cota1.FinalizaEdicao then
  Begin
    dbgCabecalho.Enabled:=True;  
    SB_Prim.Enabled:=true;
    SB_Ant.Enabled:=true;
    SB_Prox.Enabled:=true;
    SB_Ult.Enabled:=true;
    SB_Novo.Enabled:=true;
    SB_Alt.Enabled:=true;
    SB_Exc.Enabled:=true;
    SB_Prim1.Enabled:=true;
    SB_Ant1.Enabled:=true;
    SB_Prox1.Enabled:=true;
    SB_Ult1.Enabled:=true;
    SB_Novo1.Enabled:=true;
    SB_Exc1.Enabled:=true;
    SB_Salva1.Enabled:=false;
    SB_Canc1.Enabled:=false;
    Incluir1.Enabled:=True;
    Alterar1.Enabled:=True;
    Excluir1.Enabled:=True;
    Salvar1.Enabled:=False;
    Cancelar1.Enabled:=False;
    Incluir2.Enabled:=True;
    Excluir2.Enabled:=True;
    Salvar2.Enabled:=False;
    Cancelar2.Enabled:=False;
    SB_Imprimir.Enabled := True;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxCota.SB_Canc1Click(Sender: TObject);
begin
  dbgCabecalho.Enabled:=True;
  Item_de_Cota1.CancelaEdicao;
  SB_Prim.Enabled:=true;
  SB_Ant.Enabled:=true;
  SB_Prox.Enabled:=true;
  SB_Ult.Enabled:=true;
  SB_Novo.Enabled:=true;
  SB_Alt.Enabled:=true;
  SB_Exc.Enabled:=true;
  SB_Prim1.Enabled:=true;
  SB_Ant1.Enabled:=true;
  SB_Prox1.Enabled:=true;
  SB_Ult1.Enabled:=true;
  SB_Novo1.Enabled:=true;
  SB_Exc1.Enabled:=true;
  SB_Salva1.Enabled:=false;
  SB_Canc1.Enabled:=false;
  Incluir1.Enabled:=True;
  Alterar1.Enabled:=True;
  Excluir1.Enabled:=True;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  Incluir2.Enabled:=True;
  Excluir2.Enabled:=True;
  Salvar2.Enabled:=False;
  Cancelar2.Enabled:=False;
  SB_Imprimir.Enabled := True;
  if Item_de_Cota1.IsEmpty then
  Begin
    edtCodigoICA.Clear;
    edtCota1.Clear;
    edtCota2.Clear;
    edtCota3.Clear;
    edtCota4.Clear;
    edtCota10.Clear;
    edtCota20.Clear;
    edtCota30.Clear;
    edtCota40.Clear;
    edtComissao1.Clear;
    edtComissao2.Clear;
    edtComissao3.Clear;
    edtComissao4.Clear;
    edtComissao10.Clear;
    edtComissao20.Clear;
    edtComissao30.Clear;
    edtComissao40.Clear;
    dblVendedor.KeyValue:=0;
  end;
end;

procedure TfMxCota.SB_PrimClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxCota.SB_AntClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxCota.SB_ProxClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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


procedure TfMxCota.SB_Prim1Click(Sender: TObject);
begin
  if Item_de_Cota1.IsEmpty then
   abort;
 if Item_de_Cota1.IsEmpty then
   abort;
 If Item_de_Cota1.bof Then
  begin
    SB_Ant1.Enabled:=False;
    SB_Prim1.Enabled:=False;
  end
  Else
  begin
    Item_de_Cota1.First;
    SB_Ant1.Enabled:=False;
    SB_Prim1.Enabled:=False;
  end;
  If not Item_de_Cota1.eof Then
  begin
    SB_Prox1.Enabled:=True;
    SB_Ult1.Enabled:=True;
  end;
end;

procedure TfMxCota.SB_Ant1Click(Sender: TObject);
begin
  if Item_de_Cota1.IsEmpty then
   abort;
 if Item_de_Cota1.IsEmpty then
   abort;
 If Item_de_Cota1.bof Then
  begin
    SB_Ant1.Enabled:=False;
    SB_Prim1.Enabled:=False;
  end
  Else
  begin
    Item_de_Cota1.Prior;
    If Item_de_Cota1.bof Then
    begin
     SB_Ant1.Enabled:=False;
     SB_Prim1.Enabled:=False;
    end;
  end;
  If not Item_de_Cota1.eof Then
  begin
    SB_Prox1.Enabled:=True;
    SB_Ult1.Enabled:=True;
  end;
end;

procedure TfMxCota.SB_Prox1Click(Sender: TObject);
begin
  if Item_de_Cota1.IsEmpty then
   abort;
 if Item_de_Cota1.IsEmpty then
   abort;
  If Item_de_Cota1.eof Then
  begin
    SB_Prox1.Enabled:=False;
    SB_Ult1.Enabled:=False;
  end
  Else
  begin
    Item_de_Cota1.Next;
    If Item_de_Cota1.eof Then
    begin
     SB_Prox1.Enabled:=False;
     SB_Ult1.Enabled:=False;
    end;
  end;
  If not Item_de_Cota1.bof Then
  begin
    SB_Ant1.Enabled:=True;
    SB_Prim1.Enabled:=True;
  end;
end;

procedure TfMxCota.SB_Ult1Click(Sender: TObject);
begin
  if Item_de_Cota1.IsEmpty then
   abort;
 if Item_de_Cota1.IsEmpty then
   abort;
  If Item_de_Cota1.eof Then
  begin
    SB_Prox1.Enabled:=False;
    SB_Ult1.Enabled:=False;
  end
  Else
  begin
    Item_de_Cota1.Last;
    SB_Prox1.Enabled:=False;
    SB_Ult1.Enabled:=False;
  end;
  If not Item_de_Cota1.bof Then
  begin
    SB_Ant1.Enabled:=True;
    SB_Prim1.Enabled:=True;
  end;
end;

procedure TfMxCota.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If (SB_Salva.Enabled) or (SB_Salva1.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxCota.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxCota.Cota1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfMxCota.Cota1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.text:=Entidade.FieldByName('Usuario').asString;
end;

procedure TfMxCota.Item_de_Cota1AfterScroll(DataSet: TDataSet);
begin
  Item_de_Cota1.CarregaDados;
end;

procedure TfMxCota.Cota1CalcFields(DataSet: TDataSet);
begin
  try
    Entidade.FieldByName('Epoca').asString:=vMes[Entidade.mes]+'/'+IntToStr(Entidade.Ano);
  except
  end;
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxCota.SB_CalendarioClick(Sender: TObject);
begin
  if Length(edtMes.Text) = 1 then
    edtMes.Text:='0'+edtMes.Text;
  try
    StrToDate('01/'+edtMes.Text+'/'+edtAno.Text);
  except
    Raise Exception.Create('Mês ou Ano inválido!');
  end;
  Application.CreateForm(TfMxFeriados, fMxFeriados);
  fMxFeriados.tag:=1;
  fMxFeriados.DataInicio := StrToDate('01/'+edtMes.Text+'/'+edtAno.Text);
  fMxFeriados.ShowModal;
end;

procedure TfMxCota.Vendedor1BeforeOpen(DataSet: TDataSet);
begin
  try
    Vendedor1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxCota.Item_de_Cota1CalcFields(DataSet: TDataSet);
begin
  Vendedor2.Close;
  Vendedor2.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Vendedor2.ParamByName('FUN_CODIGO').asInteger:=Item_de_Cota1.CodigoFUN;
  Vendedor2.Open;
  Item_de_Cota1.FieldByName('Vendedor').asString:=Vendedor2.Apelido;
end;

procedure TfMxCota.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else if SB_Canc1.Enabled then
    Begin
      SB_Canc1.SetFocus;
      SB_Canc1Click(sender);
    end
    else
      Close;
  end
  else If key=chr(13) then
  Begin
    if SB_Salva.Enabled then
    Begin
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
    end
    else if SB_Salva1.Enabled then
    Begin
      SB_Salva1.SetFocus;
      SB_Salva1Click(sender);
    end;
  end;
end;

procedure TfMxCota.SB_ImprimirClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
  Begin
    ShowMessage('Selecione um Mês de Referência!');
    Exit;
  end;
  Application.CreateForm(Trpt_CotaComissao, rpt_CotaComissao);
  with rpt_CotaComissao do
  Begin
    Tag := 0;
    Entidade.Close;
    Entidade.ParamByName('CNC_CODIGO').asInteger := fMxCota.Entidade.CodigoCNC;
    Entidade.ParamByName('COT_CODIGO').asInteger := fMxCota.Entidade.CodigoCOT;    
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxCota.dbgItensTitleClick(Column: TColumn);
begin
  try
    if Item_de_Cota1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_de_Cota1.SOrdemdoGrid(Item_de_Cota1.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxCota.dbgCabecalhoTitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
