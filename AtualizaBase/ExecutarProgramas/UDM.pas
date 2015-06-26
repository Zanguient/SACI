unit UDM;

interface

uses                                                                     
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, SQuery, Operacao_do_Sistema, Configuracao, TipoParam,
  Parametro, Cliente;

type
  TDM = class(TDataModule)
    Database2: TDatabase;
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
