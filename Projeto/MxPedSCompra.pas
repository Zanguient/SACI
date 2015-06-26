unit MxPedSCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Db, DBTables, SQuery,
  Pedido_de_Compra, Fornecedor, Transportadora, Menus;

type
  TfMxPedSCompra = class(TForm)
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Fechar: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Pedido_de_Compra1: TPedido_de_Compra;
    DSPedido_de_Compra1: TDataSource;
    Fornecedor1: TFornecedor;
    Pedido_de_Compra1Fornecedor: TStringField;
    Pedido_de_Compra1Transportadora: TStringField;
    Transportadora1: TTransportadora;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    PedidodeCompra1: TMenuItem;
    Confirmar1: TMenuItem;
    N1: TMenuItem;
    Localizar1: TMenuItem;
    rdbLocalizar: TRadioButton;
    RadioButton2: TRadioButton;
    Pedido_de_Compra1PCP_CODIGO: TIntegerField;
    Pedido_de_Compra1CNC_CODIGO: TIntegerField;
    Pedido_de_Compra1FOR_CODIGO: TIntegerField;
    Pedido_de_Compra1CNT_CODIGO: TIntegerField;
    Pedido_de_Compra1TRN_CODIGO: TIntegerField;
    Pedido_de_Compra1USU_CODIGO: TIntegerField;
    Pedido_de_Compra1FPG_CODIGO: TIntegerField;
    Pedido_de_Compra1OPF_CODIGO: TIntegerField;
    Pedido_de_Compra1PCP_NOTA_FISCAL: TIntegerField;
    Pedido_de_Compra1PCP_SERIE: TStringField;
    Pedido_de_Compra1PCP_DT_CADASTRO: TDateTimeField;
    Pedido_de_Compra1PCP_DT_ALTERADO: TDateTimeField;
    Pedido_de_Compra1PCP_DT_EMISSAO: TDateTimeField;
    Pedido_de_Compra1PCP_DT_SAIDA: TDateTimeField;
    Pedido_de_Compra1PCP_DT_ENTREGA: TDateTimeField;
    Pedido_de_Compra1CNC_ENTREGA: TIntegerField;
    Pedido_de_Compra1PCP_BASE_CALCULO: TFloatField;
    Pedido_de_Compra1PCP_BASE_CALCULO_SUB: TFloatField;
    Pedido_de_Compra1PCP_ICMS: TFloatField;
    Pedido_de_Compra1PCP_ICMS_FRETE: TFloatField;
    Pedido_de_Compra1PCP_ICMS_SUB: TFloatField;
    Pedido_de_Compra1PCP_FRETE: TFloatField;
    Pedido_de_Compra1PCP_TIPO_FRETE: TSmallintField;
    Pedido_de_Compra1PCP_SITUACAO: TIntegerField;
    Pedido_de_Compra1PCP_OBSERVACAO: TStringField;
    Pedido_de_Compra1PCP_CONHECIMENTO: TIntegerField;
    Pedido_de_Compra1PCP_TOTAL_PRODUTO: TFloatField;
    Pedido_de_Compra1PCP_TOTAL_NOTA: TFloatField;
    Pedido_de_Compra1FPG_CODIGO_TRN: TIntegerField;
    Pedido_de_Compra1PCP_SUBSERIE: TStringField;
    Pedido_de_Compra1PCP_SELO: TIntegerField;
    Pedido_de_Compra1PCP_TOTAL_IPI: TFloatField;
    Pedido_de_Compra1PCP_SN: TIntegerField;
    Pedido_de_Compra1CNC_ORIGEM: TIntegerField;
    Pedido_de_Compra1PCP_VPC: TFloatField;
    Pedido_de_Compra1PCP_FABRICAR: TIntegerField;
    Pedido_de_Compra1PCP_ARQUIVO_GERADO: TIntegerField;
    Pedido_de_Compra1PCP_DOCUMENTO: TStringField;
    ckbSomentePendentes: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Pedido_de_Compra1CalcFields(DataSet: TDataSet);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure rdbLocalizarClick(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Pedido_de_Compra1BeforeOpen(DataSet: TDataSet);
    procedure ckbSomentePendentesClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    sSomentePendente: string;
  public
    { Public declarations }
  end;

var
  fMxPedSCompra: TfMxPedSCompra;

implementation

uses UDM,MxPedCompra;

{$R *.DFM}

procedure TfMxPedSCompra.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Pedido_de_Compra1.Close;
  Pedido_de_Compra1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Pedido_de_Compra1.Open;
  ComboBox2.ItemIndex:=0;
  Edit11.SetFocus;
end;

procedure TfMxPedSCompra.Pedido_de_Compra1CalcFields(DataSet: TDataSet);
begin
  if Pedido_de_Compra1.CodigoFOR > 0 then
  Begin
    Fornecedor1.Close;
    Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=Pedido_de_Compra1.CodigoFOR;
    Fornecedor1.Open;
    Pedido_de_Compra1.FieldByName('Fornecedor').asString:=Fornecedor1.RazaoSocial;
  end
  else
    Pedido_de_Compra1.FieldByName('Fornecedor').asString:='';
  if Pedido_de_Compra1.CodigoTRN>0 then
  Begin
    Transportadora1.Close;
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=Pedido_de_Compra1.CodigoTRN;
    Transportadora1.Open;
    Pedido_de_Compra1.FieldByName('Transportadora').asString:=Transportadora1.RazaoSocial;
  end
  else
    Pedido_de_Compra1.FieldByName('Transportadora').asString:='';
end;

procedure TfMxPedSCompra.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxPedSCompra.SB_ConfirmarClick(Sender: TObject);
begin
  if not Pedido_de_Compra1.IsEmpty then
  Begin
    fMxPedComp.Entidade.Close;
    fMxPedComp.Entidade.ParamByName('PCP_CODIGO').asInteger := Pedido_de_Compra1.CodigoPCP;
    fMxPedComp.Entidade.Open;
    fMxPedComp.Entidade.CarregaDados;
  end;
  Close;
end;

procedure TfMxPedSCompra.SB_LocClick(Sender: TObject);
begin
  if rdbLocalizar.Checked then
    Pedido_de_Compra1.Localizar
  else
    Pedido_de_Compra1.Selecionar;
end;

procedure TfMxPedSCompra.rdbLocalizarClick(Sender: TObject);
begin
  Pedido_de_Compra1.Close;
  Pedido_de_Compra1.SQL.Text:='SELECT * '+
     ' FROM PEDIDO_DE_COMPRA WHERE CNC_CODIGO=:CNC_CODIGO '+
     sSomentePendente+
     ' ORDER BY PCP_CODIGO ';
  Pedido_de_Compra1.Open;
  Edit11.Setfocus;
end;

procedure TfMxPedSCompra.RadioButton2Click(Sender: TObject);
begin
  Edit11.Setfocus;
end;

procedure TfMxPedSCompra.Pedido_de_Compra1BeforeOpen(DataSet: TDataSet);
begin
  Pedido_de_Compra1.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
end;

procedure TfMxPedSCompra.ckbSomentePendentesClick(Sender: TObject);
begin
  if ckbSomentePendentes.Checked then
    sSomentePendente := ' AND PCP_SITUACAO=0 '
  else
    sSomentePendente := '';

  Pedido_de_Compra1.selecao.Text := ' AND CNC_CODIGO=:CNC_CODIGO '+sSomentePendente;

  if rdbLocalizar.Checked then
    rdbLocalizarClick(sender)
  else
    SB_LocClick(sender);
end;

procedure TfMxPedSCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    SB_ConfirmarClick(sender)
  else if key=#27 then
    SB_FecharClick(sender);
end;

end.
