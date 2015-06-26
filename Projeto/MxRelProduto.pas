unit MxRelProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Buttons, Db, Fornecedor,
  Produto_por_Fornecedor, DBTables, SQuery, Produto;

type
  TfMxRelProd = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton6: TSpeedButton;
    Produto1: TProduto;
    Fornecedor1: TFornecedor;
    DSProduto1: TDataSource;
    DSFornecedor1: TDataSource;
    DSProduto_por_Fornecedor1: TDataSource;
    Fornecedor2: TFornecedor;
    DBLookupListBox1: TDBLookupListBox;
    DBLookupListBox2: TDBLookupListBox;
    Produto_por_Fornecedor1: TProduto_por_Fornecedor;
    Produto_por_Fornecedor1PRD_CODIGO: TIntegerField;
    Produto_por_Fornecedor1CNC_CODIGO: TIntegerField;
    Produto_por_Fornecedor1PPF_CODIGO: TIntegerField;
    Produto_por_Fornecedor1FOR_CODIGO: TIntegerField;
    Produto_por_Fornecedor1nome: TStringField;
    SQuery1: TSQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxRelProd: TfMxRelProd;

implementation
Uses UDM;
{$R *.DFM}
















procedure TfMxRelProd.FormCreate(Sender: TObject);
begin
  Produto1.Active:=True;
  Fornecedor1.Active:=True;
  Fornecedor2.Active:=True;
  Produto_por_Fornecedor1.Active:=True;
end;

procedure TfMxRelProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Produto1.Active:=False;
  Fornecedor1.Active:=False;
  Fornecedor2.Active:=False;
  Produto_por_Fornecedor1.Active:=False;
  Action:=caFree;
end;

procedure TfMxRelProd.DBLookupComboBox1Click(Sender: TObject);
begin
   Edit1.Text:=Produto1.Unidade;
   Edit2.Text:=Produto1.Marca;
   Edit3.Text:=Produto1.Referencia;
end;

procedure TfMxRelProd.SpeedButton1Click(Sender: TObject);
begin
  If not Produto_por_Fornecedor1.Localizar(Produto1.CodigoPRD,Fornecedor1.CodigoFor) then
  Begin
    Produto_por_Fornecedor1.Inserir(0,Produto1.CodigoPRD,Fornecedor1.CodigoFor);
    Produto_por_Fornecedor1.Close;
    Produto_por_Fornecedor1.Open;
  end;
end;


procedure TfMxRelProd.SpeedButton2Click(Sender: TObject);
var posicao:TBookmark;
begin
  with Fornecedor1 do
  Begin
    Posicao:=GetBookmark;
    DisableControls;
    first;
    while not EOF do
    Begin
      If not Produto_por_Fornecedor1.Localizar(Produto1.CodigoPRD,Fornecedor1.CodigoFor) then
        Produto_por_Fornecedor1.Inserir(0,Produto1.CodigoPRD,Fornecedor1.CodigoFor);
      Next;
    End;
    EnableControls;
    GotoBookmark(Posicao);
    FreeBookmark(Posicao);
  End;

  Produto_por_Fornecedor1.Close;
  Produto_por_Fornecedor1.Open;
end;

procedure TfMxRelProd.SpeedButton6Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxRelProd.SpeedButton3Click(Sender: TObject);
begin
  Produto_por_Fornecedor1.Deletar(Produto_por_Fornecedor1.CodigoPPF);
  Produto_por_Fornecedor1.Close;
  Produto_por_Fornecedor1.Open;
end;

procedure TfMxRelProd.SpeedButton4Click(Sender: TObject);
begin
{  Produto_por_Fornecedor1.First;
  While not Produto_por_Fornecedor1.eof do
    Produto_por_Fornecedor1.Deletar(DM.Configuracao1.CodigoCNC,Produto_por_Fornecedor1.CodigoPPF);

  Produto_por_Fornecedor1.Close;
  Produto_por_Fornecedor1.Open;}
  if MessageDlg('Tem certeza que deseja deletar todas as associações?', mtConfirmation, [mbYes, mbNo], 0) = mryes then
    With SQuery1 do
    Begin
      SQL.Text:='DELETE FROM PRODUTO_POR_FORNECEDOR WHERE '+
              ' PRD_CODIGO='+IntToStr(Produto1.codigoPRD);
      Try
        ExecSQL;
      Except
        ShowMessage('Não foi possível deletar todas as associações!');
      End;
      Produto_por_Fornecedor1.Close;
      Produto_por_Fornecedor1.Open;
    End;
end;

procedure TfMxRelProd.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
end;

procedure TfMxRelProd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

end.
