unit MxLocalizaTabelaPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Tabela_de_Precos, Menus;

type
  TfMxLocalizaTabelaPreco = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    DSTabela_de_Precos1: TDataSource;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Tabela_de_Precos1: TTabela_de_Precos;
    Tabela_de_Precos1TBP_CODIGO: TIntegerField;
    Tabela_de_Precos1CNC_CODIGO: TIntegerField;
    Tabela_de_Precos1TBP_DESCRICAO: TStringField;
    Tabela_de_Precos1TBP_PRAZO_MEDIO: TIntegerField;
    Tabela_de_Precos1TBP_VALIDADE: TDateTimeField;
    Tabela_de_Precos1TBP_DESCONTO_SIMPLES: TFloatField;
    Tabela_de_Precos1TBP_DESCONTO_ESPECIAL: TFloatField;
    Tabela_de_Precos1TBP_DESCONTO_SIMPLES_PRAZO: TFloatField;
    Tabela_de_Precos1TBP_DESCONTO_ESPECIAL_PRAZO: TFloatField;
    Tabela_de_Precos1TBP_INDICE: TFloatField;
    Tabela_de_Precos1USU_CODIGO: TIntegerField;
    Tabela_de_Precos1TBP_DT_ALTERADO: TDateTimeField;
    Tabela_de_Precos1Centro: TStringField;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Registro1: TMenuItem;
    Confirmar1: TMenuItem;
    N1: TMenuItem;
    Localizar1: TMenuItem;
    ckbSomenteValidas: TCheckBox;
    Tabela_de_Precos1TBP_AGF_EXCLUSIVO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Tabela_de_Precos1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ckbSomenteValidasClick(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TTabela_de_Precos;
  end;

var
  fMxLocalizaTabelaPreco: TfMxLocalizaTabelaPreco;

implementation
Uses
  UDM, Funcoes, MxTabPreco, CdForPagam;

{$R *.DFM}

procedure TfMxLocalizaTabelaPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_LocTabPreco_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxLocalizaTabelaPreco.bitConfirmarClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Selecione uma tabela antes de confirmar!');
  if self.Tag=1 then
  Begin
    fMxTabPreco.edtCodigoTBP.text := Entidade.FieldByName('TBP_CODIGO').AsString;
    fMxTabPreco.CancelarLoc:=False;
  end
  else if self.Tag=2 then
  Begin
    fCadForPag.edtCodigoTBP.text := Entidade.FieldByName('TBP_CODIGO').AsString;
    fCadForPag.edtDescricaoTabela.Text := Entidade.Descricao+' VAL:'+DateToStr(Entidade.Validade);
  end;
  Close;
end;

procedure TfMxLocalizaTabelaPreco.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxLocalizaTabelaPreco.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  ckbSomenteValidas.Checked := True;
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfMxLocalizaTabelaPreco.SB_LocClick(Sender: TObject);
begin
  Entidade.Selecionar;
end;

procedure TfMxLocalizaTabelaPreco.Tabela_de_Precos1CalcFields(
  DataSet: TDataSet);
begin
  if (Entidade.CodigoCNC = 0) or
     ((DM.Configuracao1.Empresa <> empEletro) and
      (Entidade.CodigoCNC = 1)) then
    Entidade.FieldByName('Centro').asString := 'CPD'
  else
  Begin
    DM.CentroCusto2.Close;
    DM.CentroCusto2.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
    DM.CentroCusto2.Open;
    Entidade.FieldByName('Centro').asString:=DM.CentroCusto2.RazaoSocial;
  end;
end;

procedure TfMxLocalizaTabelaPreco.FormCreate(Sender: TObject);
begin
  Entidade := Tabela_de_Precos1;
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_LocTabPreco_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxLocalizaTabelaPreco.ckbSomenteValidasClick(Sender: TObject);
begin
  if ckbSomenteValidas.Checked then
    Entidade.Selecao.Text := ' AND TBP_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '
  else
    Entidade.Selecao.Text := '';
  if Entidade.Active then
    SB_LocClick(sender);
end;

end.
