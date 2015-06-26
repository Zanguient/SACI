unit fMxCobrancaAdiciona;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, checklst, Tabela_de_Precos, Db, DBTables, SQuery, Produto,
  DBCtrls, Buttons, Item_Tabela_de_Precos, ExtCtrls, Menus;

type
  TfCdItemTab = class(TForm)
    Produto1: TProduto;
    Tabela_de_Precos1: TTabela_de_Precos;
    DSTabela_de_Precos1: TDataSource;
    DSProduto1: TDataSource;
    Item_Tabela_de_Precos1: TItem_Tabela_de_Precos;
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label20: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Confirmar1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Tabela_de_Precos1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCdItemTab: TfCdItemTab;

implementation
uses
  UDM, funcoes, MxTabPreco;

{$R *.DFM}

procedure TfCdItemTab.FormCreate(Sender: TObject);
Var
  i:Integer;
  posicao:TBookmark;
begin
  Tabela_de_Precos1.Active:=True;
  Item_Tabela_de_Precos1.Active:=True;
end;

procedure TfCdItemTab.DBLookupComboBox1Click(Sender: TObject);
Var
  i:integer;
  posicao:TBookmark;
begin
  With Produto1 do
  Begin
    Posicao:=GetBookmark;
    DisableControls;
    first;
    i:=0;
    While not EOF Do
    Begin
      If Item_Tabela_de_Precos1.Locate('PRD_CODIGO',FieldByName('PRD_CODIGO').AsInteger,[]) Then
        CheckListBox1.Checked[i]:=true
      Else
        CheckListBox1.Checked[i]:=False;
      i:=i+1;
      Next;
    end;
    EnableControls;
    GotoBookmark(Posicao);
    FreeBookmark(Posicao);
  End;
end;

procedure TfCdItemTab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Produto1.Active:=False;
  Tabela_de_Precos1.Active:=False;
  Item_Tabela_de_Precos1.Active:=False;
  Action:=Cafree;
end;

procedure TfCdItemTab.SpeedButton2Click(Sender: TObject);
begin
  if   Item_Tabela_de_Precos1.Tag = 1 then
  begin
    fMxTabPreco.Item_Tabela_de_Precos1.Close;
    fMxTabPreco.Item_Tabela_de_Precos1.Open;
  end;
  Close;
end;

procedure TfCdItemTab.SpeedButton1Click(Sender: TObject);
Var
  i:Integer;
begin
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    If CheckListBox1.checked[i] then
    Begin
      if not Item_Tabela_de_Precos1.Locate('PRD_CODIGO',Copy(CheckListBox1.Items[i],1,4),[]) Then
        Item_Tabela_de_Precos1.Inserir(Dm.Configuracao1.CodigoCNC,0,tabela_de_precos1.CodigoTBP,StrToInt(Copy(CheckListBox1.Items[i],1,4)),0,0,0);
    End
    Else
    Begin
      if Item_Tabela_de_Precos1.Locate('PRD_CODIGO',Copy(CheckListBox1.Items[i],1,4),[]) Then
        Item_Tabela_de_Precos1.Deletar(Dm.Configuracao1.CodigoCNC,Item_Tabela_de_Precos1.CodigoITP);
    End;
  End;
end;



procedure TfCdItemTab.FormShow(Sender: TObject);
Var
  i:Integer;
  posicao:TBookmark;
begin
 DM.Usuario1.ConfiguraTela(fCdItemTab);

 With Produto1 do
  Begin
    Active:=True;
    Posicao:=GetBookmark;
    DisableControls;
    first;

    While not EOF Do
    Begin
      CheckListBox1.Items.Add(copy('0000',1,4-Length(IntToStr(Produto1.CodigoPRD)))+
                                   IntToStr(Produto1.codigoprd)+' '+PreencheEspaco(60,Produto1.Descricao)+
                                   PreencheEspaco(20,produto1.Marca)+' '+PreencheEspaco(20,Produto1.Referencia));
      Next;
    End;

    i:=0;
    first;

    While not EOF Do
    Begin
      If Item_Tabela_de_Precos1.Locate('PRD_CODIGO',FieldByName('PRD_CODIGO').AsInteger,[]) Then
        CheckListBox1.Checked[i]:=true
      Else
        CheckListBox1.Checked[i]:=False;
      i:=i+1;
      Next;
    end;
    EnableControls;
    GotoBookmark(Posicao);
    FreeBookmark(Posicao);
  End;
end;

procedure TfCdItemTab.BitBtn1Click(Sender: TObject);
Var
  i:Integer;
begin
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    CheckListBox1.checked[i] := True;
  End;
end;


procedure TfCdItemTab.BitBtn2Click(Sender: TObject);
Var
  i:Integer;
begin
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    CheckListBox1.checked[i] := False;
  End;
end;



procedure TfCdItemTab.Tabela_de_Precos1BeforeOpen(DataSet: TDataSet);
begin
  Tabela_de_Precos1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
end;

end.



