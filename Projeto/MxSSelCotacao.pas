unit MxSSelCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  CentroCusto, Fornecedor, MapaCotacao, Menus;

type
  TfMxSSelCotacao = class(TForm)
    DSCotacao: TDataSource;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Edit11: TEdit;
    Label19: TLabel;
    ComboBox2: TComboBox;
    Label20: TLabel;
    MapaCotacao1: TMapaCotacao;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Cotao1: TMenuItem;
    Confirmar1: TMenuItem;
    Cancelar1: TMenuItem;
    N1: TMenuItem;
    Localizar1: TMenuItem;
    MapaCotacao1CNC_CODIGO: TIntegerField;
    MapaCotacao1MCT_CODIGO: TIntegerField;
    MapaCotacao1USU_CODIGO: TIntegerField;
    MapaCotacao1MCT_DT_CADASTRO: TDateTimeField;
    MapaCotacao1MCT_DT_ALTERADO: TDateTimeField;
    MapaCotacao1FOR_CODIGO: TIntegerField;
    MapaCotacao1MCT_DESCRICAO: TStringField;
    MapaCotacao1MCT_FORNECEDOR: TStringField;
    MapaCotacao1MCT_FORMA_PAGAMENTO: TStringField;
    MapaCotacao1MCT_PRAZO_ENTREGA: TIntegerField;
    MapaCotacao1MCT_FRETE: TFloatField;
    MapaCotacao1MCT_ICMS: TFloatField;
    MapaCotacao1MCT_OBSERVACAO: TStringField;
    MapaCotacao1MCT_VENDA: TIntegerField;
    MapaCotacao1Centro: TStringField;
    CentroCusto2: TCentroCusto;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure MapaCotacao1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Entidade : TMapaCotacao;
    CotacaoVenda: Boolean;
  end;

var
  fMxSSelCotacao: TfMxSSelCotacao;
implementation

uses
  UDM, Funcoes, MxCotacao;

{$R *.DFM}
procedure TfMxSSelCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfMxSSelCotacao.FormShow(Sender: TObject);
var
  USU, CotaVenda : string;
begin
  DM.Usuario1.AlteraCorComponentes(self);
  DM.Usuario1.ConfiguraTela(self);
  if DM.Configuracao1.Empresa = empLBM then
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(4040)) < 0 then
      Usu:=' AND (USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+') ';

  if CotacaoVenda then
    CotaVenda := ' AND MCT_VENDA=1 '
  else
    CotaVenda := 'AND MCT_VENDA=0 ';

  with Entidade do
  Begin
    Close;
    SQL.Text:='SELECT * FROM MAPA_DE_COTACAO '+
        ' WHERE ((MCT_DT_CADASTRO>="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND MCT_DT_CADASTRO<"'+MesDia(DM.Configuracao1.Data+1)+'") '+
        ' OR (MCT_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND MCT_DT_ALTERADO<"'+MesDia(DM.Configuracao1.Data+1)+'")) '+
        USU+CotaVenda+
        ' ORDER BY FOR_CODIGO, MCT_CODIGO ';
    Selecao.Text := USU+CotaVenda;
    Open;
  end;
  ComBoBox2.ItemIndex:=1;
  Edit11.SetFocus;
end;

procedure TfMxSSelCotacao.BitBtn1Click(Sender: TObject);
begin
  If (fMxSSelCotacao.tag=0) and (not Entidade.IsEmpty) then
  Begin
    fMXCotacao.MapaCotacao1.Close;
    fMXCotacao.MapaCotacao1.SQL.Text := 'SELECT * FROM MAPA_DE_COTACAO '+
      ' WHERE CNC_CODIGO='+IntTostr(Entidade.CodigoCNC)+
      ' AND MCT_CODIGO='+IntTostr(Entidade.CodigoMCT);
    fMXCotacao.MapaCotacao1.Open;
    close;
  end;
end;

procedure TfMxSSelCotacao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;


procedure TfMxSSelCotacao.SB_LocClick(Sender: TObject);
begin
  Entidade.Selecionar;
end;

procedure TfMxSSelCotacao.MapaCotacao1CalcFields(DataSet: TDataSet);
begin
  //Definir Centro de Custo
  with CentroCusto2 do
  Begin
    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      if Active = False then
        Open;
      if (Entidade.CodigoCNC > 0) then
      Begin
        if (Entidade.CodigoCNC <> COdigoCNC) then
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
          Open;
        end;
        Entidade.FieldByName('Centro').asString := RazaoSocial;
      end
      else
        Entidade.FieldByName('Centro').asString := '';
    end
    else //LBM
    Begin
      if Entidade.CodigoCNC <= 0 then
        Entidade.FieldByName('Centro').asString := 'ERRO'
      else if Entidade.CodigoCNC = 1 then
        Entidade.FieldByName('Centro').asString := 'Matriz'
      else
        Entidade.FieldByName('Centro').asString := 'Filial'+IntToStr(Entidade.CodigoCNC);
    end;
  end;
end;

procedure TfMxSSelCotacao.FormCreate(Sender: TObject);
begin
  Entidade := MapaCotacao1;
  CotacaoVenda := False;
end;

procedure TfMxSSelCotacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1Click(BitBtn1);
end;

end.
