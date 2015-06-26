unit MxLocalizaTabelaPrecoSGP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Tabela_de_Precos, Tabela_de_Precos_SubGrupo, Menus, Cliente;

type
  TfMxLocalizaTabelaPrecoSGP = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    DSTabela_de_Precos_SubGrupo1: TDataSource;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Tabela_de_Precos_SubGrupo1: TTabela_de_Precos_SubGrupo;
    Tabela_de_Precos_SubGrupo1TPS_CODIGO: TIntegerField;
    Tabela_de_Precos_SubGrupo1CNC_CODIGO: TIntegerField;
    Tabela_de_Precos_SubGrupo1CNC_CLIENTE: TIntegerField;
    Tabela_de_Precos_SubGrupo1CLI_CODIGO: TIntegerField;
    Tabela_de_Precos_SubGrupo1USU_CODIGO: TIntegerField;
    Tabela_de_Precos_SubGrupo1TPS_DESCRICAO: TStringField;
    Tabela_de_Precos_SubGrupo1TPS_DT_CADASTRO: TDateTimeField;
    Tabela_de_Precos_SubGrupo1TPS_DT_ALTERADO: TDateTimeField;
    Tabela_de_Precos_SubGrupo1TPS_DT_VALIDADE: TDateTimeField;
    Tabela_de_Precos_SubGrupo1TPS_LABORATORIO: TIntegerField;
    Tabela_de_Precos_SubGrupo1TPS_DESCONTO_SIMPLES: TFloatField;
    Tabela_de_Precos_SubGrupo1TPS_DESCONTO_ESPECIAL: TFloatField;
    Tabela_de_Precos_SubGrupo1TPS_DESCONTO_SIMPLES_PRAZO: TFloatField;
    Tabela_de_Precos_SubGrupo1TPS_DESCONTO_ESPECIAL_PRAZO: TFloatField;
    Tabela_de_Precos_SubGrupo1TPS_SITUACAO: TIntegerField;
    Tabela_de_Precos_SubGrupo1TPS_OBSERVACAO: TStringField;
    Tabela_de_Precos_SubGrupo1TPS_PRINCIPAL: TIntegerField;
    Tabela_de_Precos_SubGrupo1Centro: TStringField;
    Tabela_de_Precos_SubGrupo1Cliente: TStringField;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Registro1: TMenuItem;
    Confirmar1: TMenuItem;
    N1: TMenuItem;
    Localizar1: TMenuItem;
    Cliente1: TCliente;
    ckbSomenteValidas: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Tabela_de_Precos_SubGrupo1CalcFields(DataSet: TDataSet);
    procedure ckbSomenteValidasClick(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TTabela_de_Precos_SubGrupo;
  end;

var
  fMxLocalizaTabelaPrecoSGP: TfMxLocalizaTabelaPrecoSGP;

implementation
Uses
  UDM, Funcoes, MxTabPreco, MxTabPrecoSubGrupo;

{$R *.DFM}

procedure TfMxLocalizaTabelaPrecoSGP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_LocTabPrecoSGP_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxLocalizaTabelaPrecoSGP.bitConfirmarClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Selecione uma tabela antes de confirmar!');
  if Tag=1 then
  Begin
    fMxTabPrecoSubGrupo.edtCodigoTPS.text := Entidade.FieldByName('TPS_CODIGO').AsString;
    fMxTabPrecoSubGrupo.CancelarLoc:=False;
  end;
  Close;
end;

procedure TfMxLocalizaTabelaPrecoSGP.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxLocalizaTabelaPrecoSGP.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  ckbSomenteValidas.Checked := True;
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfMxLocalizaTabelaPrecoSGP.SB_LocClick(Sender: TObject);
begin
  if cmbCampo.ItemIndex = 4 then //Cód.Cliente
  Begin
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      Raise exception.Create('Código inválido!');
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT TPS.* '+
      ' FROM TABELA_DE_PRECO_SUBGRUPO TPS, TABELA_DE_PRECO_CLIENTE TBC '+
      ' WHERE TBC.CLI_CODIGO='+edtLocalizar.Text+
      Entidade.Selecao.Text+
      ' AND TBC.CNC_TABELA=TPS.CNC_CODIGO '+
      ' AND TBC.TBP_CODIGO=TPS.TPS_CODIGO ';
    Entidade.Open;
  end
  else
    Entidade.Selecionar;
end;

procedure TfMxLocalizaTabelaPrecoSGP.FormCreate(Sender: TObject);
begin
  Entidade := Tabela_de_Precos_SubGrupo1;
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_LocTabPrecoSGP_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxLocalizaTabelaPrecoSGP.Tabela_de_Precos_SubGrupo1CalcFields(
  DataSet: TDataSet);
var
  sCliente: string;
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

  if Entidade.CodigoCLI > 0 then
  Begin
    with Cliente1 do
    Begin
      if (not Active) or
         (CodigoCNC <> Entidade.ClienteCNC) or
         (CodigoCLI <> Entidade.CodigoCLI) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
        ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
        Open;
      end;
      Entidade.FieldByName('Cliente').asString := PreencheZero(2,Entidade.ClienteCNC)+'-'+PreencheZero(4,Entidade.CodigoCLI);
    end;
  end
  else if Entidade.CodigoCLI = -1 then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT CNC_CLIENTE, CLI_CODIGO '+
        ' FROM TABELA_DE_PRECO_CLIENTE '+
        ' WHERE CNC_TABELA='+IntToStr(Entidade.CodigoCNC)+
        ' AND TBP_CODIGO='+IntToStr(Entidade.CodigoTPS);
      Open;
      sCliente := '';
      while not Eof do
      Begin
        if sCliente <> '' then
          sCliente := sCliente + ';';
        sCliente := sCliente + PreencheZero(2,FieldByName('CNC_CLIENTE').asInteger)+'-'+
                               FieldByName('CLI_CODIGO').asString;
        Next;
      end;
    end;
    Entidade.FieldByName('Cliente').asString := sCliente;
  end
  else
  Begin
    Entidade.FieldByName('Cliente').asString := '';
  end;
end;

procedure TfMxLocalizaTabelaPrecoSGP.ckbSomenteValidasClick(
  Sender: TObject);
begin
  if ckbSomenteValidas.Checked then
    Entidade.Selecao.Text := ' AND TPS_DT_VALIDADE>="'+MesDia(DM.Configuracao1.Data)+'" '
  else
    Entidade.Selecao.Text := '';
  if Entidade.Active then
    SB_LocClick(sender);
end;

end.
