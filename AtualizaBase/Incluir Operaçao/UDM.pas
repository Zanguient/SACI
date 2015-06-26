unit UDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, SQuery, Operacao_do_Sistema, Configuracao, Parametro,
  Submodulo, Modulo, TipoParam, Classificacao_fiscal, OperFisc,
  Forma_de_Pagamento;

  (*Adicionar a Path 'D:\FontesD7\SACI\Componentes' na library*)

type
  TDM = class(TDataModule)
    Database2: TDatabase;
    QR_Comandos: TQuery;
    QR_Consultas: TQuery;
    Operacao_do_Sistema1: TOperacao_do_Sistema;
    Configuracao1: TConfiguracao;
    Modulo1: TModulo;
    Submodulo1: TSubmodulo;
    TipoParam1: TTipoParam;
    Parametro1: TParametro;
    OperFiscal1: TOperFiscal;
    Forma_de_Pagamento1: TForma_de_Pagamento;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
{$R *.DFM}

end.
