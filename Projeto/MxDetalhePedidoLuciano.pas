unit MxDetalhePedidoLuciano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, Informacoes, Avalista, Menus, Titulo_receber,
  Pedido_de_Venda, Usuario, Parametro, Forma_de_Pagamento, Detalhe_Venda,
  Vendedor;

type
  TfMxDetalhePedidoLuciano = class(TForm)
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
    Bevel1: TBevel;
    Label38: TLabel;
    Label39: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label37: TLabel;
    edtMedicoNome: TEdit;
    edtMedicoCRM: TEdit;
    edtOD_ESF: TEdit;
    edtOE_ESF: TEdit;
    edtOD_CIL: TEdit;
    edtOE_CIL: TEdit;
    edtOD_EIXO: TEdit;
    edtOE_EIXO: TEdit;
    edtOD_DNP: TEdit;
    edtOE_DNP: TEdit;
    edtOD_ALT: TEdit;
    edtOE_ALT: TEdit;
    edtOD_ADICAO: TEdit;
    edtOE_ADICAO: TEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    edtTipoLentes: TEdit;
    edtOBSLentes: TEdit;
    edtTipoArmacao: TEdit;
    edtOBSArmacao: TEdit;
    Label29: TLabel;
    edtPaciente: TEdit;
    DBGrid5: TDBGrid;
    DSDetalhe_Venda1: TDataSource;
    SB_NovoCab: TSpeedButton;
    IncluirCab: TMenuItem;
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
    procedure SB_NovoCabClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TDetalhe_Venda;
  end;

var
  fMxDetalhePedidoLuciano: TfMxDetalhePedidoLuciano;

implementation

Uses UDM, funcoes;

{$R *.DFM}

procedure TfMxDetalhePedidoLuciano.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  Entidade.Close;
  Entidade.ParamByName('PDV_CODIGO').AsInteger:=StrToInt(edtCodigoPDV.Text);
  Entidade.ParamByName('CNC_CODIGO').AsInteger:=StrToInt(edtCodigoCNC.Text);
  Entidade.open;
  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtTipoLentes.SetFocus;
end;

procedure TfMxDetalhePedidoLuciano.SB_SalvaCabClick(Sender: TObject);
begin
  if (dblMeio.text = '') and
     (DM.Configuracao1.Empresa = empLBM) then
    Raise exception.Create('Meio de conhecimento obrigado!');
  if Entidade.FinalizaEdicao(Entidade.Estado) then
    AtualizaControles(False)
  else
    Raise exception.Create('As alterações não foram salvas!');
  Entidade.AtualizaCampos(False);

  Close;
end;

procedure TfMxDetalhePedidoLuciano.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfMxDetalhePedidoLuciano.FormCreate(Sender: TObject);
begin
  Entidade:=Detalhe_Venda1;
  Vendedor1.Open;
  Vendedor2.Open;
  Parametro1.Open;
  {
    Tag = 0 - ServicoLBM
    Tag = 1 - Pedido Répido
  }
end;

procedure TfMxDetalhePedidoLuciano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Vendedor1.Close;
  Vendedor2.Close;
  Parametro1.Close;
  Action:=Cafree;
end;

procedure TfMxDetalhePedidoLuciano.SairCabClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxDetalhePedidoLuciano.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxDetalhePedidoLuciano.FormShow(Sender: TObject);
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

procedure TfMxDetalhePedidoLuciano.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxDetalhePedidoLuciano.FormKeyPress(Sender: TObject; var Key: Char);
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
  else if (key='.') and ((edtComissao1.Focused) or
                         (edtComissao2.Focused) or
                         (edtOD_ESF.Focused) or
                         (edtOE_ESF.Focused) or
                         (edtOD_CIL.Focused) or
                         (edtOE_CIL.Focused) or
                         (edtOD_EIXO.Focused) or
                         (edtOE_EIXO.Focused) or
                         (edtOD_DNP.Focused) or
                         (edtOE_DNP.Focused) or
                         (edtOD_ALT.Focused) or
                         (edtOE_ALT.Focused) or
                         (edtOD_ADICAO.Focused) or
                         (edtOE_ADICAO.Focused)) then
    key:=','
  else if (Key = '"') then
    Key := #0;
end;

procedure TfMxDetalhePedidoLuciano.btnLimpaIndicacao1Click(Sender: TObject);
begin
  dblIndicacao1.KeyValue := -1;
end;

procedure TfMxDetalhePedidoLuciano.btnLimpaIndicacao2Click(Sender: TObject);
begin
  dblIndicacao2.KeyValue := -1;
end;

procedure TfMxDetalhePedidoLuciano.Detalhe_Venda1AfterScroll(DataSet: TDataSet);
begin
  Detalhe_Venda1.CarregaDados;

  edtUsuario.Clear;
  if Entidade.CodigoUSU <= 0 then
    Exit;
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxDetalhePedidoLuciano.AtualizaControles(Habilitar:Boolean);
begin
  SairCab.Enabled      := not habilitar;
  IncluirCab.Enabled   := not habilitar;
  AlterarCab.Enabled   := not habilitar;
  SalvarCab.Enabled    := habilitar;
  CancelarCab.Enabled  := Habilitar;
  SB_NovoCab.Enabled   := not Habilitar;  
  SB_AltCab.Enabled    := not Habilitar;
  SB_SalvaCab.Enabled  := Habilitar;
  SB_CancCab.Enabled   := Habilitar;
  btnLimpaIndicacao1.Enabled := Habilitar;
  btnLimpaIndicacao2.Enabled := Habilitar;
end;

procedure TfMxDetalhePedidoLuciano.dblIndicacao1Click(Sender: TObject);
begin
  if dblIndicacao1.Text <> '' then
    edtComissao1.Text := format('%.2f',[Vendedor1.PerAbaixo])
  else
    edtComissao1.Text := '0,00';
end;

procedure TfMxDetalhePedidoLuciano.dblIndicacao2Click(Sender: TObject);
begin
  if dblIndicacao1.Text <> '' then
    edtComissao1.Text := format('%.2f',[Vendedor1.PerAbaixo])
  else
    edtComissao1.Text := '0,00';
end;

procedure TfMxDetalhePedidoLuciano.edtComissao1Change(Sender: TObject);
begin
  try
    edtValor1.Text := format('%.2f',[StrToFloat(edtTotalPedido.Text)*StrToFloat(edtComissao1.Text)/100]);
  except
    edtValor1.Text := '0,00';
  end;
end;

procedure TfMxDetalhePedidoLuciano.edtComissao2Change(Sender: TObject);
begin
  try
    edtValor2.Text := format('%.2f',[StrToFloat(edtTotalPedido.Text)*StrToFloat(edtComissao2.Text)/100]);
  except
    edtValor2.Text := '0,00';
  end;
end;

procedure TfMxDetalhePedidoLuciano.edtComissao2Exit(Sender: TObject);
begin
  if dblIndicacao2.Text = '' then
    edtComissao2.Text := '0,00';
end;

procedure TfMxDetalhePedidoLuciano.edtComissao1Exit(Sender: TObject);
begin
  if dblIndicacao1.Text = '' then
    edtComissao1.Text := '0,00';
end;

procedure TfMxDetalhePedidoLuciano.SB_NovoCabClick(Sender: TObject);
begin
  if DM.Configuracao1.CPD then
    raise Exception.Create('Você não pode inserir vendas no CPD.');
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');

  Detalhe_Venda1.PreparaInsercao;

  AtualizaControles(True);
  edtPaciente.SetFocus;
end;

end.
