unit UDM2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, SQuery, Cliente, Avalista, Agencia, Transportadora,
  Funcionario, Fornecedor, Contato, Conta, Banco, Vendedor, Secao, RegProc,
  Configuracao, funcoes, Permissao, Usuario, Log, TransfArq;

type
  TDM = class(TDataModule)
    Configuracao1: TConfiguracao;
    Log1: TLog;
    Ds_Configuracao1: TDataSource;
    procedure DMCreate(Sender: TObject);
    procedure Usuario1AfterScroll(DataSet: TDataSet);
    procedure Configuracao1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
Uses cdCliente,cdAvalista,cdContato,cdAgencia,cdVendedor,cdTransportador,cdBanco,
     cdConta,cdFornecedor,cdFuncionario,cdSecao,CdRegProcura;
{$R *.DFM}




procedure TDM.DMCreate(Sender: TObject);
begin
  Configuracao1.CodigoUSU:=UsuLogin;
  Usuario1.LocalizarCod(UsuLogin, Configuracao1.CodigoCNC);
  Usuario1.CarregaPermissoes;
end;


procedure TDM.Usuario1AfterScroll(DataSet: TDataSet);
begin
  Permissao1.Close;
  Permissao1.Params[0].asInteger:=Usuario1.CodigoUSU;
  Permissao1.Open;
end;

procedure TDM.Configuracao1BeforeOpen(DataSet: TDataSet);
begin
  Configuracao1.Filtered:=False;
end;

end.
