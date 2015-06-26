unit MxRelCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Buttons, Db, ClienteAFim, DBTables, SQuery,
  Cliente, CentroCusto, Grids, DBGrids, Menus;

type
  TfMxRelCli = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ClienteAfim1: TClienteAfim;
    Cliente2: TCliente;
    DSCliente2: TDataSource;
    DSClienteAfim1: TDataSource;
    Panel4: TPanel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    SB_Novo: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    SB_Exc: TSpeedButton;
    SB_Loc: TSpeedButton;
    ClienteAfim1Cliente: TStringField;
    Cliente1: TCliente;
    Cliente3: TCliente;
    ClienteAfim1CLA_CLI1: TIntegerField;
    ClienteAfim1CLA_CNC1: TIntegerField;
    ClienteAfim1CLA_CLI2: TIntegerField;
    ClienteAfim1CLA_CNC2: TIntegerField;
    ClienteAfim1CLA_AFINIDADE: TStringField;
    ClienteAfim1USU_CODIGO: TIntegerField;
    ClienteAfim1CLA_DT_ALTERADO: TDateTimeField;
    Label1: TLabel;
    Label2: TLabel;
    Cliente2CLI_CODIGO: TIntegerField;
    Cliente2CNC_CODIGO: TIntegerField;
    Cliente2CLI_PESSOA_FISICA: TSmallintField;
    Cliente2CLI_DT_CADASTRO: TDateTimeField;
    Cliente2CLI_DATA_NASC: TDateTimeField;
    Cliente2CLI_RZ_SOCIAL: TStringField;
    Cliente2CLI_NOME_FAN: TStringField;
    Cliente2CLI_CGC_CPF: TStringField;
    Cliente2CLI_CGF_RG: TStringField;
    Cliente2CLI_LOGRADOURO: TIntegerField;
    Cliente2CLI_ENDERECO: TStringField;
    Cliente2CLI_BAIRRO: TStringField;
    Cliente2CLI_CIDADE: TStringField;
    Cliente2CLI_UF: TStringField;
    Cliente2CLI_CEP: TStringField;
    Cliente2CLI_FONE: TStringField;
    Cliente2CLI_SITUACAO: TIntegerField;
    Cliente2CLI_CREDITO: TFloatField;
    Cliente2CLI_PAI: TStringField;
    Cliente2CLI_MAE: TStringField;
    Cliente2CLI_CONJUGE: TStringField;
    Cliente2CLI_OBS1: TStringField;
    Cliente2CLI_LOCALTRABALHO: TStringField;
    Cliente2CLI_FAX: TStringField;
    Cliente2CLI_SITE: TStringField;
    Cliente2CLI_EMAIL: TStringField;
    Cliente2USU_CODIGO: TIntegerField;
    Cliente2CLI_DT_ALTERADO: TDateTimeField;
    Cliente2CLI_CELULAR: TStringField;
    Cliente2CLI_SPC: TIntegerField;
    Cliente2CLI_VENDA_ATACADO: TIntegerField;
    Cliente2CLI_DESCONTO: TFloatField;
    Cliente2CLI_ORGAO: TIntegerField;
    Cliente2CLI_DT_SPC: TDateTimeField;
    Cliente2CLI_REFERENCIA1: TStringField;
    Cliente2CLI_REFERENCIA2: TStringField;
    Cliente2CLI_REFERENCIA3: TStringField;
    Cliente2CLI_PROFISSAO: TStringField;
    Cliente2CLI_IDENTIFICACAO: TStringField;
    Cliente2CLI_QUINZENAL: TIntegerField;
    Cliente2CLI_MENSAL: TIntegerField;
    Cliente2CLI_NOTA: TIntegerField;
    Cliente2CLI_CLASSIFICACAO: TIntegerField;
    Cliente2CLI_MAQUINA: TIntegerField;
    Cliente2CLI_TIPO: TIntegerField;
    Cliente2CNC_CONVENIO: TIntegerField;
    Cliente2CLI_CONVENIO: TIntegerField;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Afins1: TMenuItem;
    AssociarCab: TMenuItem;
    AlterarCab: TMenuItem;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Edit1: TEdit;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Adicionar(Sender: TObject);
    procedure Retirar(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Cliente2BeforeOpen(DataSet: TDataSet);
    procedure Cliente3BeforeOpen(DataSet: TDataSet);
    procedure ClienteAfim1CalcFields(DataSet: TDataSet);
    procedure Cliente1AfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Cancelar:Boolean;
    { Public declarations }
  end;

var
  fMxRelCli: TfMxRelCli;

implementation
Uses UDM, Funcoes, DigSenha;
{$R *.DFM}

procedure TfMxRelCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cliente1.Close;
  Cliente2.Close;
  Cliente3.Close;
  ClienteAfim1.Close;
  Action:=caFree;
end;

procedure TfMxRelCli.Adicionar(Sender: TObject);
var
  sAfinidade: string;
begin
  If Cliente2.IsEmpty Then
    Raise Exception.Create('Selecione o Cliente!');

  //Verifica se o usuário que está logado não tem permissão para Adicionar Cliente Afim
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1900)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=18;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(1900)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para associar Clientes Afim!');
        end;
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end;

  sAfinidade := UpperCase(InputBox('Cliente Afim', 'Digite o tipo de afinidade do cliente', ''));
  if Trim(sAfinidade) = '' then
    Raise exception.Create('Tipo de Afinidade inválido!');

  ClienteAfim1.Inserir(Cliente1.CodigoCNC,Cliente2.CodigoCNC,Cliente1.CodigoCLI,
    Cliente2.CodigoCLI, sAfinidade);
    
  ClienteAfim1.Close;
  ClienteAfim1.Open;

end;

procedure TfMxRelCli.Retirar(Sender: TObject);
begin
  if ClienteAfim1.IsEmpty then
    Raise Exception.Create('Selecione o Cliente afim!');

//Verifica se o usuário que está logado não tem permissão para Adicionar Cliente Afim
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(1910)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=18;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(1910)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para retirar associação Clientes Afim!');
        end;
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end;

  ClienteAfim1.deletarauto;
  ClienteAfim1.Close;
  ClienteAfim1.Open;
end;

procedure TfMxRelCli.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ClienteAfim1.Close;
  ClienteAfim1.ParamByName('CLI_CODIGO').AsInteger:=Cliente1.CodigoCLI;
  ClienteAfim1.ParamByName('CNC_CODIGO').AsInteger:=Cliente1.CodigoCNC;
  ClienteAfim1.Open;
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
end;

procedure TfMxRelCli.SB_LocClick(Sender: TObject);
begin
  Cliente2.Selecionar;
end;

procedure TfMxRelCli.Cliente2BeforeOpen(DataSet: TDataSet);
begin
  try
    Cliente2.ParamByName('CNC_CODIGO').asInteger := Cliente1.CodigoCNC;
  except
  end;
end;

procedure TfMxRelCli.Cliente3BeforeOpen(DataSet: TDataSet);
begin
  try
    Cliente3.ParamByName('CNC_CODIGO').asInteger := Cliente1.CodigoCNC;
  except
  end;
end;

procedure TfMxRelCli.ClienteAfim1CalcFields(DataSet: TDataSet);
begin
  Cliente3.Close;
  Cliente3.ParamByName('CNC_CODIGO').asInteger:=ClienteAfim1.FieldByName('CLA_CNC2').asInteger;
  Cliente3.ParamByName('CLI_CODIGO').asInteger:=ClienteAfim1.FieldByName('CLA_CLI2').asInteger;
  Cliente3.Open;
  ClienteAfim1.FieldByName('Cliente').asString:=Cliente3.RazaoSocial;
end;

procedure TfMxRelCli.Cliente1AfterOpen(DataSet: TDataSet);
begin
  Edit1.Text := Cliente1.RazaoSocial;
end;

procedure TfMxRelCli.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then
    Close;
end;

procedure TfMxRelCli.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
