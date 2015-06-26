unit MxSConsignacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, SQuery, consignacao, Menus, StdCtrls, Buttons,
  Grids, DBGrids, ExtCtrls, Funcionario, Cliente;

type
  TfMxSConsignacao = class(TForm)
    Panel1: TPanel;
    DBGrid5: TDBGrid;
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Fechar: TBitBtn;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Principal1: TMenuItem;
    Localizar1: TMenuItem;
    Consignacao1: TConsignacao;
    Consignacao1CNC_CODIGO: TIntegerField;
    Consignacao1CSG_CODIGO: TIntegerField;
    Consignacao1USU_CODIGO: TIntegerField;
    Consignacao1FUN_CODIGO: TIntegerField;
    Consignacao1CSG_DATA: TDateTimeField;
    Consignacao1CSG_DT_ALTERADO: TDateTimeField;
    Consignacao1CSG_VALOR: TFloatField;
    Consignacao1CSG_SITUACAO: TIntegerField;
    Consignacao1CSG_OBSERVACAO: TStringField;
    DSConsignacao: TDataSource;
    Funcionario1: TFuncionario;
    Consignacao1Situacao: TStringField;
    bitAvancar: TBitBtn;
    Consignacao1Consignatario: TStringField;
    Cliente1: TCliente;
    Consignacao1CLI_CODIGO: TIntegerField;
    Consignacao1Vendedor: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Consignacao1BeforeOpen(DataSet: TDataSet);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Consignacao1CalcFields(DataSet: TDataSet);
    procedure bitAvancarClick(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TConsignacao;
  end;

var
  fMxSConsignacao: TfMxSConsignacao;

implementation

uses UDM, MxConsignacao, Configuracao, MxSelConsignacaoVenda;

{$R *.dfm}

procedure TfMxSConsignacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_LOC_CONSIGNACAO_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Action:=Cafree;
end;

procedure TfMxSConsignacao.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSConsignacao.SB_LocClick(Sender: TObject);
begin
  if edtLocalizar.Text = '*' then
  Begin
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM CONSIGNACAO '+
      ' WHERE CNC_CODIGO=:CNC_CODIGO '+
      ' ORDER BY CSG_CODIGO DESC ';
    Entidade.Open;
  end
  else
    Entidade.Selecionar;
end;

procedure TfMxSConsignacao.FormShow(Sender: TObject);
begin
  cmbCampo.ItemIndex := 1;

  if Tag = 0 then
  begin
    SB_Confirmar.Visible := true;
    bitAvancar.Visible   := false;
  end
  else if Tag = 1 then
  begin
    SB_Confirmar.Visible := false;
    bitAvancar.Visible   := true;
    bitAvancar.left      := SB_Confirmar.left;
  end;

  edtLocalizar.SetFocus;
  DM.Usuario1.AlteraCorComponentes(self);
end;

procedure TfMxSConsignacao.FormCreate(Sender: TObject);
begin
  Entidade := Consignacao1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_LOC_CONSIGNACAO_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxSConsignacao.Consignacao1BeforeOpen(DataSet: TDataSet);
begin
  try
    Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxSConsignacao.SB_ConfirmarClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o registro!');

  if tag = 0 then
  Begin
    with fMxConsignacao do
    Begin
      Entidade.Close;
      Consignacao1.Close;
      Consignacao1.SQL.Text := 'SELECT * FROM CONSIGNACAO '+
        ' WHERE CNC_CODIGO=:CNC_CODIGO '+
        ' AND CSG_CODIGO='+IntToStr(self.Entidade.CodigoCSG);
      Consignacao1.Open;
      Entidade.Open;
    end;
  end;
  Close;
end;

procedure TfMxSConsignacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(27) then
  Begin
    Key := #0;
    Close;
  end
  else if Key = chr(13) then
  Begin
    Key := #0;
    if SB_Confirmar.Visible then
      SB_ConfirmarClick(sender)
    else
      bitAvancarClick(sender);
  end;
end;

procedure TfMxSConsignacao.Consignacao1CalcFields(DataSet: TDataSet);
begin
  with Funcionario1 do
  Begin
    Close;
    ParamByName('FUN_CODIGO').asInteger := Consignacao1.CodigoFUN;
    ParamByName('CNC_CODIGO').asInteger := Consignacao1.CodigoCNC;
    Open;
    Consignacao1.FieldByName('Vendedor').asString := Apelido;
  end;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CLI_CODIGO').asInteger := Consignacao1.CodigoCLI;
    ParamByName('CNC_CODIGO').asInteger := Consignacao1.CodigoCNC;
    Open;
    Consignacao1.FieldByName('Consignatario').asString := RazaoSocial;
  end;

  Case Consignacao1.FieldByName('CSG_SITUACAO').asInteger of
    0: Consignacao1.FieldByName('Situacao').asString := 'Em Aberto';
    1: Consignacao1.FieldByName('Situacao').asString := 'Confirmado';
    2: Consignacao1.FieldByName('Situacao').asString := 'Finalizado';
    3: Consignacao1.FieldByName('Situacao').asString := 'Cancelado';
  end;
end;

procedure TfMxSConsignacao.bitAvancarClick(Sender: TObject);
begin
  if Consignacao1.IsEmpty then
    Raise exception.Create('Selecione a consignação!');
  if not (Consignacao1.Situacao in [1]) then
    Raise Exception.Create('Consignação não pode ser alterada!');

  Application.CreateForm(TfMxSelConsignacaoVenda, fMxSelConsignacaoVenda);
  with fMxSelConsignacaoVenda do
  begin

    Consignacao1.Close;
    Consignacao1.ParamByName('CNC_CODIGO').asInteger := self.Consignacao1.CodigoCNC;
    Consignacao1.ParamByName('CSG_CODIGO').asInteger := self.Consignacao1.CodigoCSG;
    Consignacao1.Open;
    Item_de_Consignacao1.Open;


    Item_de_Consignacao1.First;
    while not Item_de_Consignacao1.Eof do
    begin
      cdItemConsignacao.Append;
      cdItemConsignacao.FieldByName('ICS_CODIGO').AsInteger := Item_de_Consignacao1.FieldByName('ICS_CODIGO').AsInteger;
      cdItemConsignacao.FieldByName('CSG_CODIGO').AsInteger := Item_de_Consignacao1.FieldByName('CSG_CODIGO').AsInteger;
      cdItemConsignacao.FieldByName('CNC_CODIGO').AsInteger := Item_de_Consignacao1.FieldByName('CNC_CODIGO').AsInteger;
      cdItemConsignacao.FieldByName('CODIGO').AsInteger     := Item_de_Consignacao1.FieldByName('PRD_CODIGO').AsInteger;
      cdItemConsignacao.FieldByName('PRODUTO').AsString     := Item_de_Consignacao1.FieldByName('Produto').AsString;
      cdItemConsignacao.FieldByName('QUANTIDADE').AsFloat   := Item_de_Consignacao1.FieldByName('ICS_QUANTIDADE').AsFloat;
      cdItemConsignacao.FieldByName('VALOR').AsFloat        := Item_de_Consignacao1.FieldByName('ICS_VALOR').AsFloat;
      cdItemConsignacao.Post;
      Item_de_Consignacao1.Next;
    end;

    ShowModal;
    Free;
  end;
end;

end.
