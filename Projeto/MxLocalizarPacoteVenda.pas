unit MxLocalizarPacoteVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, Titulo_receber, Menus, Item_Pedido_Venda,
  Informacoes, Item_de_Estoque, Movimento_Estoque_Comercial,
  Movimento_Fisico, Direito_de_Bonus, Pacote_de_venda, Forma_de_Pagamento;

type
  TfMxLocalizarPacoteVenda = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bitFechar: TBitBtn;
    DSPacote_de_venda1: TDataSource;
    DBGrid1: TDBGrid;
    Titulo_receber1: TTitulo_receber;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    MainMenu1: TMainMenu;
    PedidodeVenda1: TMenuItem;
    Localizar1: TMenuItem;
    N1: TMenuItem;
    Confirmar1: TMenuItem;
    Cliente1: TCliente;
    Informacoes1: TInformacoes;
    Pacote_de_venda1: TPacote_de_venda;
    Pacote_de_venda1CNC_CODIGO: TIntegerField;
    Pacote_de_venda1PDV_CODIGO: TIntegerField;
    Pacote_de_venda1USU_CODIGO: TIntegerField;
    Pacote_de_venda1PCT_DT_CADASTRO: TDateTimeField;
    Pacote_de_venda1PCT_DT_ALTERADO: TDateTimeField;
    Pacote_de_venda1PCT_DT_MELHOR_DATA: TDateTimeField;
    Pacote_de_venda1PCT_DT_EMISSAO_VENDA: TDateTimeField;
    Pacote_de_venda1CNC_CLIENTE: TIntegerField;
    Pacote_de_venda1CLI_CODIGO: TIntegerField;
    Pacote_de_venda1FUN_CODIGO: TIntegerField;
    Pacote_de_venda1PCT_ENTRADA: TFloatField;
    Pacote_de_venda1PCT_ACRESCIMO: TFloatField;
    Pacote_de_venda1PCT_TOTAL: TFloatField;
    Pacote_de_venda1PCT_NOTA_FISCAL: TIntegerField;
    Pacote_de_venda1PCT_NOTA_CUPOM: TIntegerField;
    Pacote_de_venda1AGF_CODIGO: TIntegerField;
    Pacote_de_venda1FPG_CODIGO: TIntegerField;
    Pacote_de_venda1PCT_TIPO_PAG: TIntegerField;
    Pacote_de_venda1PCT_MAQUINA: TIntegerField;
    Pacote_de_venda1PCT_EM_USO: TIntegerField;
    Pacote_de_venda1PCT_VENCIMENTOS: TStringField;
    Pacote_de_venda1PCT_SITUACAO: TIntegerField;
    Pacote_de_venda1PCT_OBSERVACAO: TStringField;
    Pacote_de_venda1PCT_BLOQUEADO: TIntegerField;
    Pacote_de_venda1PCT_DT_DEVOLUCAO: TDateTimeField;
    Pacote_de_venda1PCT_GRUPO_ESPECIAL: TIntegerField;
    Pacote_de_venda1Cliente: TStringField;
    Pacote_de_venda1Centro: TStringField;
    Fechar2: TMenuItem;
    SB_Imprimir: TBitBtn;
    bitPromissoria: TBitBtn;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Pacote_de_venda1CalcFields(DataSet: TDataSet);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure bitPromissoriaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    Entidade : TPacote_de_venda;
    USU:string;
    Cancelar: Boolean;
  end;

var
  fMxLocalizarPacoteVenda: TfMxLocalizarPacoteVenda;

implementation
uses UDM, Funcoes, UPapeletaDeRecebimento, MxSelProm;

{$R *.DFM}

procedure TfMxLocalizarPacoteVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Titulo_receber1.Close;
  Action:=Cafree;
end;

procedure TfMxLocalizarPacoteVenda.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxLocalizarPacoteVenda.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Entidade.Close;
  Entidade.SQL.Text:='SELECT * FROM PACOTE_DE_VENDA '+
      ' WHERE PCT_SITUACAO = 4 '+
      ' AND PCT_DT_CADASTRO>="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' AND PCT_EM_USO=0 '+
      ' AND (PCT_NOTA_FISCAL=0 OR PCT_NOTA_FISCAL IS NULL) '+
      ' ORDER BY PDV_CODIGO ';
  Entidade.Open;
  ComboBox2.ItemIndex := 0;
  Edit11.SetFocus;
end;

procedure TfMxLocalizarPacoteVenda.SB_LocClick(Sender: TObject);
begin
  Entidade.Selecionar;
end;

procedure TfMxLocalizarPacoteVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxLocalizarPacoteVenda.FormCreate(Sender: TObject);
begin
  Entidade := Pacote_de_venda1;
end;

procedure TfMxLocalizarPacoteVenda.Pacote_de_venda1CalcFields(DataSet: TDataSet);
begin
  with Cliente1 do
  Begin
    if (Entidade.ClienteCNC <> CodigoCNC) or
       (Entidade.CodigoCLI <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    Entidade.FieldByName('Cliente').asString := '('+PreencheZero(2,CodigoCNC)+'-'+IntToStr(CodigoCLI)+') '+RazaoSocial;
  end;

  //Definir Centro de Custo
  with DM.CentroCusto2 do
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

procedure TfMxLocalizarPacoteVenda.SB_ImprimirClick(Sender: TObject);
var
  sPedido: string;
  CdCNC, CdPDV: integer;
  vTotalTitulo: Double;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o pacote!');

  //Imprimir Papeleta de Recebimento
  Application.CreateForm(Trpt_PapeletaDeRecebimento, rpt_PapeletaDeRecebimento);
  with rpt_PapeletaDeRecebimento do
  Begin
    Tag := 0;
    with DM.QR_Consultas do
    Begin
      sPedido := '';
      vTotalTitulo := self.Entidade.Total;
      sPedido := IntToStr(self.Entidade.CodigoPDV);
      CdCNC := self.Entidade.CodigoCNC;
      CdPDV := self.Entidade.CodigoPDV;

      zrlTotalPedido.Caption := Format('%.2f',[vTotalTitulo]);
      zrlPedidos.Caption := sPedido;
    end;
    Entidade.Close;
    Entidade.ParamByName('CNC_CODIGO').asInteger := CdCNC;
    Entidade.ParamByName('PDV_CODIGO').asInteger := CdPDV;
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxLocalizarPacoteVenda.bitPromissoriaClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Pedido!');

  Application.CreateForm(TfmxSelProm, fmxSelProm);
  with fmxSelProm do
  Begin
    tag:=8;
    if (Entidade.TipoPag <> 412) or
       (Entidade.NotaFiscal=0) then
      rdgBoleto.Enabled := False
    else
    Begin
      rdgBoleto.Checked := True;
      with Forma_de_Pagamento1 do
      Begin
        Close;
        ParamByName('FPG_CODIGO').asInteger := Entidade.CodigoFPG;
        Open;
        if Prazo[1] = '0' then
          fmxSelProm.Entrada := True;
      end;
    end;
    ShowModal;
  end;

end;

procedure TfMxLocalizarPacoteVenda.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
    SB_LocClick(SB_Loc);
end;

end.
