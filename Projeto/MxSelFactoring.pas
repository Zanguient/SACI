unit MxSelFactoring;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Db, DBTables, SQuery,
  Menus, Factoring, Cliente;

type
  TfMxSelFactoring = class(TForm)
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    cmbCampo: TComboBox;
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Fechar: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DSFactoring1: TDataSource;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    PedidodeCompra1: TMenuItem;
    Confirmar1: TMenuItem;
    N1: TMenuItem;
    Localizar1: TMenuItem;
    rdbLocalizar: TRadioButton;
    RadioButton2: TRadioButton;
    Factoring1: TFactoring;
    Cliente1: TCliente;
    Factoring1CNC_CODIGO: TIntegerField;
    Factoring1FCT_CODIGO: TIntegerField;
    Factoring1CNC_ORIGEM: TIntegerField;
    Factoring1USU_CODIGO: TIntegerField;
    Factoring1CNC_CLIENTE: TIntegerField;
    Factoring1CLI_CODIGO: TIntegerField;
    Factoring1FCT_DT_CADASTRO: TDateTimeField;
    Factoring1FCT_DT_ALTERADO: TDateTimeField;
    Factoring1FCT_QUANTIDADE_CHEQUES: TIntegerField;
    Factoring1FCT_TOTAL_ENVIADO: TFloatField;
    Factoring1FCT_JUROS: TFloatField;
    Factoring1FCT_TOTAL_RECEBIDO: TFloatField;
    Factoring1FCT_SITUACAO: TIntegerField;
    Factoring1FCT_OBSERVACAO: TStringField;
    Factoring1FCT_MAQUINA: TIntegerField;
    Factoring1Cliente: TStringField;
    procedure FormShow(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure rdbLocalizarClick(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Factoring1BeforeOpen(DataSet: TDataSet);
    procedure Factoring1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private

  public
    Entidade: TFactoring;
  end;

var
  fMxSelFactoring: TfMxSelFactoring;

implementation

uses UDM, Funcoes, MxFactoring, MxSelCheques;

{$R *.DFM}

procedure TfMxSelFactoring.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Entidade.Close;
  Entidade.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Entidade.Open;
  cmbCampo.ItemIndex:=0;
  Edit11.SetFocus;
end;

procedure TfMxSelFactoring.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelFactoring.SB_ConfirmarClick(Sender: TObject);
begin
  if tag = 0 then
  Begin
    if not Entidade.IsEmpty then
    Begin
      fMxFactoring.Entidade.Close;
      fMxFactoring.Entidade.SQL.Text := 'SELECT * FROM FACTORING '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND FCT_CODIGO='+IntToStr(Entidade.CodigoFCT);
      fMxFactoring.Entidade.Open;
      fMxFactoring.Entidade.CarregaDados;
    end;
  end
  else if tag = 1 then //SelCheques
    fMxSelCheques.edtCodigoFCT.Text := IntToStr(Entidade.CodigoFCT);
  Close;
end;

procedure TfMxSelFactoring.SB_LocClick(Sender: TObject);
begin
  if rdbLocalizar.Checked then
    Entidade.Localizar
  else
    Entidade.Selecionar;
end;

procedure TfMxSelFactoring.rdbLocalizarClick(Sender: TObject);
begin
  Entidade.Close;
  Entidade.SQL.Text:='SELECT * '+
     ' FROM FACTORING '+
     ' WHERE CNC_CODIGO=:CNC_CODIGO '+
     ' ORDER BY FCT_CODIGO ';
  Entidade.Open;
  Edit11.Setfocus;
end;

procedure TfMxSelFactoring.RadioButton2Click(Sender: TObject);
begin
  Edit11.Setfocus;
end;

procedure TfMxSelFactoring.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    SB_ConfirmarClick(sender)
  else if key=#27 then
    SB_FecharClick(sender);
end;

procedure TfMxSelFactoring.Factoring1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
end;

procedure TfMxSelFactoring.Factoring1CalcFields(DataSet: TDataSet);
begin
  if Entidade.CodigoCLI > 0 then
  Begin
    with Cliente1 do
    Begin
      if (not Active) or
         (CodigoCNC <> Entidade.CLienteCNC) or
         (CodigoCLI <> Entidade.CodigoCLI) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger:=Entidade.ClienteCNC;        
        ParamByName('CLI_CODIGO').asInteger:=Entidade.CodigoCLI;
        Open;
      end;
      Entidade.FieldByName('Cliente').asString := RazaoSocial;
    end;
  end
  else
    Entidade.FieldByName('Cliente').asString:='';
end;

procedure TfMxSelFactoring.FormCreate(Sender: TObject);
begin
  Entidade := Factoring1;
end;

end.
