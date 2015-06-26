unit UDM;

interface    

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, SQuery, CentroCusto, Configuracao, IniFiles,
  Pedido_de_Compra, Cliente, Pedido_de_Venda;

type
  TDM = class(TDataModule)
    Database2: TDatabase;
    CentroCusto1: TCentroCusto;
    Configuracao1: TConfiguracao;
    QR_Comandos: TQuery;
    QR_Consultas: TQuery;
    Pedido_de_Compra1: TPedido_de_Compra;
    Cliente1: TCliente;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  arquivo: string;
  conf:TIniFile;
begin
  try
    arquivo:=ExtractFilePath(ParamStr(0))+'confEnviaCPD.ini';
    conf:=TIniFile.Create(arquivo);

    with Database2 do
    begin
      DriverName:=conf.ReadString('dborigem', 'DRIVER NAME', '');
      
      Params.Clear;
      Params.Add('SERVER NAME='+conf.ReadString('dborigem', 'SERVER NAME', ''));
      Params.Add('DATABASE NAME='+conf.ReadString('dborigem', 'DATABASE NAME', ''));
      Params.Add('USER NAME=SYSDBA');
      //Params.Add('PASSWORD=S2F1303');
      Params.Add('PASSWORD=s2f1303');

      Connected := True;
    end;
  except
    ShowMessage('Falha ao Conectar com o Banco de Dados!');
    Application.Terminate;
  end;
end;

end.
