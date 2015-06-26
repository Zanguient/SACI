unit MxSNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, NotaFiscal, Grids, DBGrids, ExtCtrls, Menus,
  StdCtrls, Buttons, OperFisc;

type
  TfMxSNotaFiscal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    NotaFiscal1: TNotaFiscal;
    DSNotaFiscal1: TDataSource;
    SB_Loc: TSpeedButton;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    MainMenu1: TMainMenu;
    NotaFiscal2: TMenuItem;
    Localizar1: TMenuItem;
    BitBtn2: TBitBtn;
    Fechar1: TMenuItem;
    Confirmar1: TMenuItem;
    Cancelar1: TMenuItem;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    OperFiscal1: TOperFiscal;
    OperFiscal1OPF_CODIGO: TIntegerField;
    OperFiscal1CNC_CODIGO: TIntegerField;
    OperFiscal1OPF_DESCRICAO: TStringField;
    NotaFiscal1NTF_CODIGO: TIntegerField;
    NotaFiscal1CNC_CODIGO: TIntegerField;
    NotaFiscal1USU_CODIGO: TIntegerField;
    NotaFiscal1PDV_CODIGO: TIntegerField;
    NotaFiscal1CNC_CLIENTE: TIntegerField;
    NotaFiscal1CLI_CODIGO: TIntegerField;
    NotaFiscal1FOR_CODIGO: TIntegerField;
    NotaFiscal1FUN_CODIGO: TIntegerField;
    NotaFiscal1TRN_CODIGO: TIntegerField;
    NotaFiscal1CAG_CODIGO: TIntegerField;
    NotaFiscal1NTF_DT_CADASTRO: TDateTimeField;
    NotaFiscal1NTF_DT_ALTERADO: TDateTimeField;
    NotaFiscal1NTF_DT_EMISSAO: TDateTimeField;
    NotaFiscal1NTF_DT_ENTRADA_SAIDA: TDateTimeField;
    NotaFiscal1NTF_ENTRADA_SAIDA: TIntegerField;
    NotaFiscal1NTF_TIPO_NOTA: TIntegerField;
    NotaFiscal1NTF_NOTA_FISCAL: TIntegerField;
    NotaFiscal1NTF_SERIE: TStringField;
    NotaFiscal1NTF_SUBSERIE: TStringField;
    NotaFiscal1NTF_SELO: TStringField;
    NotaFiscal1NTF_AIDF: TIntegerField;
    NotaFiscal1NTF_CFOP: TIntegerField;
    NotaFiscal1NTF_BASE_ICMS: TFloatField;
    NotaFiscal1NTF_ICMS: TFloatField;
    NotaFiscal1NTF_BASE_ICMS_SUB: TFloatField;
    NotaFiscal1NTF_ICMS_SUB: TFloatField;
    NotaFiscal1NTF_TOTAL_PRODUTO: TFloatField;
    NotaFiscal1NTF_TOTAL_NOTA: TFloatField;
    NotaFiscal1NTF_FRETE: TFloatField;
    NotaFiscal1NTF_SEGURO: TFloatField;
    NotaFiscal1NTF_OUTRAS: TFloatField;
    NotaFiscal1NTF_IPI: TFloatField;
    NotaFiscal1NTF_TIPO_TRANSPORTE: TIntegerField;
    NotaFiscal1NTF_TIPO_FRETE: TIntegerField;
    NotaFiscal1NTF_PLACA: TStringField;
    NotaFiscal1NTF_PLACA_UF: TStringField;
    NotaFiscal1NTF_QUANTIDADE: TFloatField;
    NotaFiscal1NTF_ESPECIE: TStringField;
    NotaFiscal1NTF_MARCA: TStringField;
    NotaFiscal1NTF_NUMERO: TStringField;
    NotaFiscal1NTF_PESO_BRUTO: TFloatField;
    NotaFiscal1NTF_PESO_LIQUIDO: TFloatField;
    NotaFiscal1NTF_SITUACAO: TIntegerField;
    NotaFiscal1NTF_OBSERVACAO: TMemoField;
    NotaFiscal1Operacao: TStringField;
    NotaFiscal1NTF_PEDIDO: TIntegerField;
    NotaFiscal1NTF_ICMS_FRETE: TFloatField;
    NotaFiscal1NTF_CONHECIMENTO: TIntegerField;
    NotaFiscal1NTF_ISS: TFloatField;
    NotaFiscal1NTF_BASE_ISS: TFloatField;
    NotaFiscal1CNC_PEDIDO: TIntegerField;
    NotaFiscal1NTF_ENDERECO: TStringField;
    NotaFiscal1NTF_BAIRRO: TStringField;
    NotaFiscal1NTF_MUNICIPIO: TStringField;
    NotaFiscal1NTF_UF: TStringField;
    NotaFiscal1NTF_CEP: TStringField;
    NotaFiscal1NTF_NOTA_CUPOM: TIntegerField;
    NotaFiscal1NTF_AVULSA: TIntegerField;
    NotaFiscal1NTF_COD_PAGAMENTO: TIntegerField;
    NotaFiscal1NTF_TOTAL_SERVICO: TFloatField;
    NotaFiscal1FUN_ARQUITETO: TIntegerField;
    NotaFiscal1CNC_ORIGEM: TIntegerField;
    NotaFiscal1NTF_COD_PAGAMENTO_2: TIntegerField;
    NotaFiscal1NTF_MAQUINA: TIntegerField;
    procedure SB_LocClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure NotaFiscal1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TNotaFiscal;
  end;

var
  fMxSNotaFiscal: TfMxSNotaFiscal;

implementation

uses MxNotaFiscal, funcoes, UDM;

{$R *.DFM}


procedure TfMxSNotaFiscal.SB_LocClick(Sender: TObject);
begin
  If ComboBox2.ItemIndex IN [0,1] then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Localizar;
end;


procedure TfMxSNotaFiscal.BitBtn2Click(Sender: TObject);
begin
  If Tag = 0 then
  Begin
    fMxNotaFiscal.CancelarLoc:=True;
  End;
  Close;
end;

procedure TfMxSNotaFiscal.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Entidade.Open;
  ComboBox2.ItemIndex:=0;
  Edit11.SetFocus;
end;

procedure TfMxSNotaFiscal.BitBtn1Click(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione a Nota!');
  if tag = 0 then
  Begin
    fMxNotaFiscal.edtCodigoNTF.Text:=Entidade.FieldByName('NTF_CODIGO').AsString;
    fMxNotaFiscal.CancelarLoc:=false;
  end;
  Close;
end;

procedure TfMxSNotaFiscal.NotaFiscal1CalcFields(DataSet: TDataSet);
begin
  OperFiscal1.Close;
  OperFiscal1.ParamByName('OPF_CODIGO').asInteger:=Entidade.CFOP;
  OperFiscal1.Open;
  Entidade.FieldByName('Operacao').asString:=OperFiscal1.Descricao;
end;

procedure TfMxSNotaFiscal.FormCreate(Sender: TObject);
begin
  Entidade:=NotaFiscal1;
end;

procedure TfMxSNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  OperFiscal1.Close;
  Action:=caFree;
end;

end.
