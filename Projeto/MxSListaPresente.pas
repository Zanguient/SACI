unit MxSListaPresente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Cliente, Menus, ListaPresente;

type
  TfMxSListaPresente = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitFechar: TBitBtn;
    DBGrid1: TDBGrid;
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
    Fechar1: TMenuItem;
    Cliente1: TCliente;
    DSLista_de_Presente1: TDataSource;
    ListaPresente1: TListaPresente;
    ListaPresente1CNC_CODIGO: TIntegerField;
    ListaPresente1LSP_CODIGO: TIntegerField;
    ListaPresente1USU_CODIGO: TIntegerField;
    ListaPresente1CLI_CODIGO: TIntegerField;
    ListaPresente1CNC_CLIENTE: TIntegerField;
    ListaPresente1LSP_DT_CADASTRO: TDateTimeField;
    ListaPresente1LSP_DT_ALTERADO: TDateTimeField;
    ListaPresente1LSP_DESCRICAO: TStringField;
    ListaPresente1LSP_SITUACAO: TIntegerField;
    ListaPresente1LSP_OBSERVACAO: TStringField;
    Label1: TLabel;
    ckbDesativadas: TCheckBox;
    ListaPresente1Cliente: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitFecharClick(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure ListaPresente1CalcFields(DataSet: TDataSet);
    procedure ckbDesativadasClick(Sender: TObject);
  private

  public
    USU:string;
    { Public declarations }
  end;

var
  fMxSListaPresente: TfMxSListaPresente;

implementation
uses UDM, Funcoes, MxLista_de_Presente;

{$R *.DFM}

procedure TfMxSListaPresente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaPresente1.Close;
  Action:=Cafree;
end;

procedure TfMxSListaPresente.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSListaPresente.bitConfirmarClick(Sender: TObject);
begin
  If not ListaPresente1.IsEmpty Then
  Begin
    If tag=0 then
    Begin
      fMxListadePresente.edtCodigoLSP.text:=ListaPresente1.FieldByName('LSP_CODIGO').AsString;
      fMxListadePresente.Cancelar := False;
    end;
    Close;
  End
  else
    ShowMessage('Escolha uma lista de presentes antes de continuar!');
end;

procedure TfMxSListaPresente.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ListaPresente1.Close;
  ListaPresente1.Open;
  ComboBox2.ItemIndex := 0;
  Edit11.SetFocus;
end;

procedure TfMxSListaPresente.SB_LocClick(Sender: TObject);
begin
  ListaPresente1.Selecionar;
end;

procedure TfMxSListaPresente.ListaPresente1CalcFields(DataSet: TDataSet);
begin
  with Cliente1 do
  Begin
    if (ListaPresente1.CodigoCLI <> CodigoCLI) or
       (ListaPresente1.CNCCliente <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := ListaPresente1.CNCCliente;
      ParamByName('CLI_CODIGO').asInteger := ListaPresente1.CodigoCLI;
      Open;
    end;
    ListaPresente1.FieldByName('Cliente').asString := RazaoSocial;
  end;
end;

procedure TfMxSListaPresente.ckbDesativadasClick(Sender: TObject);
begin
  if ckbDesativadas.Checked then
    ListaPresente1.Selecao.Text := ' AND LSP_SITUACAO=1 '
  else
    ListaPresente1.Selecao.Text := ' AND LSP_SITUACAO=0 ';
  if Trim(Edit11.Text) <> '' then
    SB_LocClick(sender);
end;

end.
