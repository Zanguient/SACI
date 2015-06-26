unit MxLocalizaCEP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Usuario, Db, DBTables, SQuery, Grids, DBGrids, ExtCtrls, Menus, CEP,
  Parametro, Variants, Buttons;

type
  TfMxLocalizaCEP = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DSCEP1: TDataSource;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Ordenar1: TMenuItem;
    Ordena2: TMenuItem;
    Ordena3: TMenuItem;
    N1: TMenuItem;
    MenuOrdem: TMenuItem;
    Timer1: TTimer;
    CEP1: TCEP;
    CEP1CEP_CEP: TStringField;
    CEP1CEP_ENDERECO: TStringField;
    CEP1CEP_BAIRRO: TStringField;
    CEP1CEP_BAIRRO2: TStringField;
    CEP1CEP_CIDADE: TStringField;
    CEP1CEP_UF: TStringField;
    CEP1CEP_LOGRADOURO: TIntegerField;
    CEP1CEP_COMPLEMENTO: TStringField;
    CEP1Logradouro: TStringField;
    Parametro3: TParametro;
    Query1: TQuery;
    Panel5: TPanel;
    SB_Fechar: TSpeedButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Ordena2Click(Sender: TObject);
    procedure Ordena3Click(Sender: TObject);
    procedure MenuOrdemClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure CEP1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Ordem, Ordena, CampoColuna, Pesquisa :string;
    Tempo:integer;
    Cancelar:Boolean;
    Entidade:TCEP;
  end;

var
  fMxLocalizaCEP: TfMxLocalizaCEP;

implementation

uses UDM, MxMensagemTempo, CdCEP, CdCliente, funcoes,
  CdFornecedor, CdTransportador, CdFuncionario;

{$R *.DFM}

procedure TfMxLocalizaCEP.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxLocalizaCEP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (tag = 0) and (not Cancelar) then
  Begin
    fCadCEP.Entidade.LocalizarCod(Entidade.CodigoCEP);
    fCadCEP.Entidade.CarregaDados;
  end
  else if (tag = 1) then
  Begin
    fCadCli.CancelarCEP:=Cancelar;
    if (not Cancelar) then
    Begin
      fCadCli.dblLogradouro.KeyValue:=Entidade.Logradouro;
      fCadCli.edtEndereco.Text:=trim(Entidade.Endereco)+
        ComplementodaRua(fCadCli.edtEndereco.Text);
      fCadCli.edtBairro.Text:=Entidade.Bairro;
      fCadCli.edtCidade.Text:=Entidade.Cidade;
      ItemComboBox(fCadCli.cmbUF,Entidade.UF);
      fCadCli.mskCEP.Text:=Entidade.CEP;
    end
    else
      fCadCli.mskCEP.Clear;
  end
  else if (tag = 3) then
  Begin
    fCadFor.CancelarCEP:=Cancelar;
    if (not Cancelar) then
    Begin
      fCadFor.dblLogradouro.KeyValue:=Entidade.Logradouro;
      fCadFor.edtEndereco.Text:=trim(Entidade.Endereco)+
        ComplementodaRua(fCadFor.edtEndereco.Text);
      fCadFor.edtBairro.Text:=Entidade.Bairro;
      fCadFor.edtCidade.Text:=Entidade.Cidade;
      ItemComboBox(fCadFor.cmbUF,Entidade.UF);
      fCadFor.mskCEP.Text:=Entidade.CEP;
    end
    else
      fCadFor.mskCEP.Clear;
  end
  else if (tag = 4) then
  Begin
    fCadTran.CancelarCEP:=Cancelar;
    if (not Cancelar) then
    Begin
      fCadTran.dblLogradouro.KeyValue:=Entidade.Logradouro;
      fCadTran.edtEndereco.Text:=trim(Entidade.Endereco)+
        ComplementodaRua(fCadTran.edtEndereco.Text);
      fCadTran.edtBairro.Text:=Entidade.Bairro;
      fCadTran.edtCidade.Text:=Entidade.Cidade;
      ItemComboBox(fCadTran.cmbUF,Entidade.UF);
      fCadTran.mskCEP.Text:=Entidade.CEP;
    end
    else
      fCadTran.mskCEP.Clear;
  end
  else if (tag = 5) then
  Begin
    fCadFunc.CancelarCEP:=Cancelar;
    if (not Cancelar) then
    Begin
      fCadFunc.dblLogradouro.KeyValue:=Entidade.Logradouro;
      fCadFunc.edtEndereco.Text:=trim(Entidade.Endereco)+
        ComplementodaRua(fCadFunc.edtEndereco.Text);
      fCadFunc.edtBairro.Text:=Entidade.Bairro;
      fCadFunc.edtCidade.Text:=Entidade.Cidade;
      ItemComboBox(fCadFunc.cmbUF,Entidade.UF);
      fCadFunc.mskCep.Text:=Entidade.CEP;
    end
    else
      fCadFunc.mskCep.Clear;
  end;

  Entidade.Close;
  action:=cafree;
end;

procedure TfMxLocalizaCEP.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if (Ordem = null) or (Ordem = '') then
    Ordem := 'ASC';
  if (Ordena = null) or (Ordena = '') then
    Ordena:='CEP_ENDERECO';
  Pesquisa:='';
  Cancelar:=True;
  if (tag IN [0,6]) then
  Begin
//    Entidade.SQL.Text:='SELECT * '+
//      ' FROM CEP '+
//      ' WHERE
//      ' ORDER BY CEP_UF, CEP_CIDADE,CEP_ENDERECO ';
  end
  Else if tag = 1 then
  Begin
    Entidade.ParamByName('CEP_UF').asString:=fCadCli.cmbUF.Text;
    Entidade.ParamByName('CEP_CIDADE').asString:=fCadCli.edtCidade.Text;
  end
  Else if tag = 3 then
  Begin
    Entidade.ParamByName('CEP_UF').asString:=fCadFor.cmbUF.Text;
    Entidade.ParamByName('CEP_CIDADE').asString:=fCadFor.edtCidade.Text;
  end
  Else if tag = 4 then
  Begin
    Entidade.ParamByName('CEP_UF').asString:=fCadTran.cmbUF.Text;
    Entidade.ParamByName('CEP_CIDADE').asString:=fCadTran.edtCidade.Text;
  end
  Else if tag = 5 then
  Begin
    Entidade.ParamByName('CEP_UF').asString:=fCadFunc.cmbUF.Text;
    Entidade.ParamByName('CEP_CIDADE').asString:=fCadFunc.edtCidade.Text;
  end;

  if not Entidade.Active then
    Entidade.Open;
end;

procedure TfMxLocalizaCEP.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxLocalizaCEP.Ordena2Click(Sender: TObject);
var
  CEP :integer;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Tabela de CEP vazia!');
  Application.CreateForm(TfMxMensagemTempo, fMxMensagemTempo);
  fMxMensagemTempo.mensagem:='CEP';
  fMxMensagemTempo.Show;
  fMxMensagemTempo.Refresh;
  CEP:=Entidade.CodigoCEP;
  Entidade.Close;
  if (tag IN [0,6]) then
    Entidade.SQL.Text:='SELECT * '+
      ' FROM CEP '+
      ' ORDER BY CEP_CEP '+Ordem
  else
  Begin
    Entidade.SQL.Text:='SELECT * '+
       ' FROM CEP '+
       ' WHERE CEP_UF=:CEP_UF '+
       ' AND CEP_CIDADE=:CEP_CIDADE '+
       ' ORDER BY CEP_CEP '+Ordem;
    if tag = 1 then
    Begin
      Entidade.ParamByName('CEP_UF').asString:=fCadCli.cmbUF.Text;
      Entidade.ParamByName('CEP_CIDADE').asString:=fCadCli.edtCidade.Text;
    end
    Else if tag = 3 then
    Begin
      Entidade.ParamByName('CEP_UF').asString:=fCadFor.cmbUF.Text;
      Entidade.ParamByName('CEP_CIDADE').asString:=fCadFor.edtCidade.Text;
    end
    Else if tag = 4 then
    Begin
      Entidade.ParamByName('CEP_UF').asString:=fCadTran.cmbUF.Text;
      Entidade.ParamByName('CEP_CIDADE').asString:=fCadTran.edtCidade.Text;
    end
    Else if tag = 5 then
    Begin
      Entidade.ParamByName('CEP_UF').asString:=fCadFunc.cmbUF.Text;
      Entidade.ParamByName('CEP_CIDADE').asString:=fCadFunc.edtCidade.Text;
    end;
  end;
  Entidade.Open;
  Entidade.LocalizarCod(CEP);
  ordena:='CEP_CEP';
  fMxMensagemTempo.Close;
end;

procedure TfMxLocalizaCEP.Ordena3Click(Sender: TObject);
var
  CEP :integer;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Tabela de CEP vazia!');
//  Ordena1.Checked:= not MenuOrdem.Checked;
  Application.CreateForm(TfMxMensagemTempo, fMxMensagemTempo);
  fMxMensagemTempo.mensagem:='Endereço';
  fMxMensagemTempo.Show;
  fMxMensagemTempo.Refresh;
  CEP:=Entidade.CodigoCEP;
  Entidade.Close;
  if (tag IN [0,6]) then
    Entidade.SQL.Text:='SELECT * '+
      ' FROM CEP '+
      ' ORDER BY CEP_CEP '+Ordem
  else
  Begin
    Entidade.SQL.Text:='SELECT * '+
       ' FROM CEP '+
       ' WHERE CEP_UF=:CEP_UF '+
       ' AND CEP_CIDADE=:CEP_CIDADE '+
       ' ORDER BY CEP_ENDERECO '+Ordem;
    if tag = 1 then
    Begin
      Entidade.ParamByName('CEP_UF').asString:=fCadCli.cmbUF.Text;
      Entidade.ParamByName('CEP_CIDADE').asString:=fCadCli.edtCidade.Text;
    end
    Else if tag = 3 then
    Begin
      Entidade.ParamByName('CEP_UF').asString:=fCadFor.cmbUF.Text;
      Entidade.ParamByName('CEP_CIDADE').asString:=fCadFor.edtCidade.Text;
    end
    Else if tag = 4 then
    Begin
      Entidade.ParamByName('CEP_UF').asString:=fCadTran.cmbUF.Text;
      Entidade.ParamByName('CEP_CIDADE').asString:=fCadTran.edtCidade.Text;
    end
    Else if tag = 5 then
    Begin
      Entidade.ParamByName('CEP_UF').asString:=fCadFunc.cmbUF.Text;
      Entidade.ParamByName('CEP_CIDADE').asString:=fCadFunc.edtCidade.Text;
    end;
  end;
  Entidade.Open;
  Entidade.LocalizarCod(CEP);
  ordena:='CEP_ENDERECO';
  fMxMensagemTempo.Close;
end;

procedure TfMxLocalizaCEP.MenuOrdemClick(Sender: TObject);
begin
  if MenuOrdem.Caption = 'D&ecrescente' then
  Begin
    Ordem := 'DESC';
    MenuOrdem.Caption := 'Cr&escente'
  end
  else
  Begin
    Ordem := 'ASC';
    MenuOrdem.Caption := 'D&ecrescente';
  end;
  if Ordena = 'CEP_CEP' then
    Ordena2Click(sender)
  else if Ordena = 'CEP_ENDERECO' then
    Ordena3Click(sender);
end;

procedure TfMxLocalizaCEP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  Begin
    if Entidade.IsEmpty then
      Cancelar := true
    else
      Cancelar:=False;
    Close;
  end
  else if (key = #27) then
  Begin
    Close;
  end
  else if Key = '*' then
  Begin
    key := #0;
    if ordena = 'CEP_CEP' then
      Ordena3Click(sender)
    else if ordena = 'CEP_ENDERECO' then
      Ordena2Click(sender);
    Pesquisa:='';
  end
  else
  Begin
    Timer1.Enabled:=True;
    Pesquisa:=Pesquisa+Key;
    Entidade.LocalizaValor(Ordena,Pesquisa);
  end;
end;

procedure TfMxLocalizaCEP.Timer1Timer(Sender: TObject);
begin
  Tempo:=Tempo+1;
  if Tempo>25 then
  Begin
    Pesquisa:='';
    Tempo:=0;
    Timer1.Enabled:=False;
  end;
end;

procedure TfMxLocalizaCEP.CEP1CalcFields(DataSet: TDataSet);
begin
  if Entidade.Logradouro > 0 then
  Begin
    Parametro3.Close;
    Parametro3.ParamByName('PAR_CODIGO').asInteger:=Entidade.Logradouro;
    Parametro3.Open;
    Entidade.FieldByName('Logradouro').asString:=Parametro3.Descricao;
  end
  else
    Entidade.FieldByName('Logradouro').asString:='';
end;

procedure TfMxLocalizaCEP.FormCreate(Sender: TObject);
begin
  Entidade:=Cep1;
end;

procedure TfMxLocalizaCEP.SB_FecharClick(Sender: TObject);
begin
  close;
end;

end.
