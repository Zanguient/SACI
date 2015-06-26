unit MxDetalhePedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Informacoes, Avalista, Menus, Titulo_receber,
  Pedido_de_Venda, Usuario, Parametro, Forma_de_Pagamento, Detalhe_Venda,
  Vendedor;

type
  TfMxDetalhePedido = class(TForm)
    Panel13: TPanel;
    Label6: TLabel;
    dblIndicacao1: TDBLookupComboBox;
    Label1: TLabel;
    edtComissao1: TEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    SB_AltCab: TSpeedButton;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    MainMenu1: TMainMenu;
    SairCab: TMenuItem;
    Clientes1: TMenuItem;
    AlterarCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    Label7: TLabel;
    edtCredito: TEdit;
    Label11: TLabel;
    edtCodigoCLI: TEdit;
    Label10: TLabel;
    edtRazaoSocial: TEdit;
    SB_Fechar: TSpeedButton;
    edtValor1: TEdit;
    Label12: TLabel;
    edtUsuario: TEdit;
    mskDataAlterado: TMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    edtClienteCNC: TEdit;
    btnLimpaIndicacao1: TBitBtn;
    Label16: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cmbUF: TComboBox;
    dblLogradouro: TDBLookupComboBox;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtEndereco: TEdit;
    Label19: TLabel;
    mskCEP: TMaskEdit;
    Detalhe_Venda1: TDetalhe_Venda;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    dblIndicacao2: TDBLookupComboBox;
    edtComissao2: TEdit;
    edtValor2: TEdit;
    btnLimpaIndicacao2: TBitBtn;
    Label4: TLabel;
    edtOutroMeio: TEdit;
    Label9: TLabel;
    edtObservacao: TEdit;
    Label20: TLabel;
    edtCodigoPDV: TEdit;
    edtCodigoCNC: TEdit;
    Label21: TLabel;
    dblMeio: TDBLookupComboBox;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    Vendedor2: TVendedor;
    DSVendedor2: TDataSource;
    edtTotalPedido: TEdit;
    DSParametro1: TDataSource;
    Parametro1: TParametro;
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairCabClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaIndicacao1Click(Sender: TObject);
    procedure btnLimpaIndicacao2Click(Sender: TObject);
    procedure Detalhe_Venda1AfterScroll(DataSet: TDataSet);
    procedure dblIndicacao1Click(Sender: TObject);
    procedure edtComissao1Change(Sender: TObject);
    procedure edtComissao2Change(Sender: TObject);
    procedure dblIndicacao2Click(Sender: TObject);
    procedure edtComissao2Exit(Sender: TObject);
    procedure edtComissao1Exit(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TDetalhe_Venda;
  end;

var
  fMxDetalhePedido: TfMxDetalhePedido;

implementation
Uses UDM, funcoes;
{$R *.DFM}

procedure TfMxDetalhePedido.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  Entidade.Close;
  Entidade.ParamByName('PDV_CODIGO').AsInteger:=StrToInt(edtCodigoPDV.Text);
  Entidade.ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtCodigoCNC.Text);
  Entidade.open;
  Entidade.PreparaAlteracao;
  if DM.Configuracao1.Empresa = empHOPE then
  Begin
    edtComissao1.Enabled := False;
    edtComissao2.Enabled := False;
  end;
  AtualizaControles(True);
end;

procedure TfMxDetalhePedido.SB_SalvaCabClick(Sender: TObject);
begin
  if (dblMeio.text = '') and
     (DM.Configuracao1.Empresa = empLBM) then
    Raise exception.Create('Meio de conhecimento obrigado!');
  if Entidade.FinalizaEdicao(2) then
    AtualizaControles(False)
  else
    ShowMessage('As alterações não foram salvas!');
  Entidade.AtualizaCampos(False);
  Close;
end;

procedure TfMxDetalhePedido.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfMxDetalhePedido.FormCreate(Sender: TObject);
begin
  Entidade:=Detalhe_Venda1;
  Vendedor1.Close;
  if DM.Configuracao1.Empresa = empLBM then
    Vendedor1.SQL.Text := 'SELECT * FROM FUNCIONARIO '+
      ' WHERE FUN_SITUACAO <> 1 '+
      ' AND (FUN_APARECE_VENDAS=1 '+
      '  OR FUN_APARECE_SERVICOS=1) '+
      ' ORDER BY FUN_NOME ASC ';
  Vendedor1.Open;

  Vendedor2.Close;
  if DM.Configuracao1.Empresa = empLBM then
    Vendedor2.SQL.Text := 'SELECT * FROM FUNCIONARIO '+
      ' WHERE FUN_SITUACAO <> 1 '+
      ' AND (FUN_APARECE_VENDAS=1 '+
      '  OR FUN_APARECE_SERVICOS=1) '+
      ' ORDER BY FUN_NOME ASC ';
  Vendedor2.Open;

  Parametro1.Open;
end;

procedure TfMxDetalhePedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Vendedor1.Close;
  Vendedor2.Close;
  Parametro1.Close;
  Action:=Cafree;
end;

procedure TfMxDetalhePedido.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxDetalhePedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxDetalhePedido.FormShow(Sender: TObject);
var
  vInserir: Boolean;
begin
  DM.Usuario1.ConfiguraTela(self);

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+edtCodigoCNC.Text+
      ' AND PDV_CODIGO='+edtCodigoPDV.Text;
    Open;
    edtTotalPedido.Text := format('%.2f',[FieldByname('TOTAL').asFloat]);
  end;

  Entidade.Close;
  Entidade.ParamByName('PDV_CODIGO').AsInteger:=StrToInt(edtCodigoPDV.Text);
  Entidade.ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtCodigoCNC.Text);
  Entidade.open;
  if Entidade.IsEmpty and
     (((DM.Configuracao1.CodigoCNC=StrToInt(edtCodigoCNC.Text)) and
     (DM.Configuracao1.CodigoCNC=DM.Usuario1.CentroDeCusto)) or
     (DM.Configuracao1.Empresa = empMotical) and
     (DM.Configuracao1.CodigoCNC = 1)) then //CNC - CPD
  Begin
    vInserir := True;
    Entidade.Inserir(StrToInt(edtCodigoCNC.Text),StrToInt(edtCodigoPDV.Text),0,
      0,0,0,0,'','');

    Entidade.Close;
    Entidade.ParamByName('PDV_CODIGO').AsInteger:=StrToInt(edtCodigoPDV.Text);
    Entidade.ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtCodigoCNC.Text);
    Entidade.open;
  end
  else
    vInserir := False;
  Entidade.CarregaDados;
  if vInserir then
    SB_AltCabClick(sender);
end;

procedure TfMxDetalhePedido.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxDetalhePedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=chr(27)) then
  Begin
    if (SB_CancCab.Enabled) then
    Begin
      key:=chr(0);
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if key=chr(13) then
  Begin
    if (SB_SalvaCab.Enabled) then
    Begin
      key:=chr(0);
      SB_SalvaCabClick(sender);
    end;
  end
  else if (key=',') and ((edtComissao1.Focused) or (edtComissao2.Focused)) then
    key:='.'
  else if (Key = '"') then
    Key := #0;
end;

procedure TfMxDetalhePedido.btnLimpaIndicacao1Click(Sender: TObject);
begin
  dblIndicacao1.KeyValue := -1;
end;

procedure TfMxDetalhePedido.btnLimpaIndicacao2Click(Sender: TObject);
begin
  dblIndicacao2.KeyValue := -1;
end;

procedure TfMxDetalhePedido.Detalhe_Venda1AfterScroll(DataSet: TDataSet);
begin
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxDetalhePedido.AtualizaControles(Habilitar:Boolean);
begin
  SairCab.Enabled:=not habilitar;
  AlterarCab.Enabled:=not habilitar;
  SalvarCab.Enabled:=habilitar;
  CancelarCab.Enabled:=habilitar;
  SB_AltCab.Enabled:=not habilitar;
  SB_SalvaCab.Enabled:=habilitar;
  SB_CancCab.Enabled:=habilitar;
  btnLimpaIndicacao1.Enabled:=habilitar;
  btnLimpaIndicacao2.Enabled:=habilitar;
end;

procedure TfMxDetalhePedido.dblIndicacao1Click(Sender: TObject);
begin
  if dblIndicacao1.Text <> '' then
    edtComissao1.Text := format('%.2f',[Vendedor1.PerAbaixo])
  else
    edtComissao1.Text := '0,00';
end;

procedure TfMxDetalhePedido.dblIndicacao2Click(Sender: TObject);
begin
  if dblIndicacao1.Text <> '' then
    edtComissao1.Text := format('%.2f',[Vendedor1.PerAbaixo])
  else
    edtComissao1.Text := '0,00';
end;

procedure TfMxDetalhePedido.edtComissao1Change(Sender: TObject);
begin
  try
    edtValor1.Text := format('%.2f',[StrToFloat(edtTotalPedido.Text)*StrToFloat(edtComissao1.Text)/100]);
  except
    edtValor1.Text := '0,00';
  end;
end;

procedure TfMxDetalhePedido.edtComissao2Change(Sender: TObject);
begin
  try
    edtValor2.Text := format('%.2f',[StrToFloat(edtTotalPedido.Text)*StrToFloat(edtComissao2.Text)/100]);
  except
    edtValor2.Text := '0,00';
  end;
end;

procedure TfMxDetalhePedido.edtComissao2Exit(Sender: TObject);
begin
  if dblIndicacao2.Text = '' then
    edtComissao2.Text := '0,00';
end;

procedure TfMxDetalhePedido.edtComissao1Exit(Sender: TObject);
begin
  if dblIndicacao1.Text = '' then
    edtComissao1.Text := '0,00';
end;

end.
