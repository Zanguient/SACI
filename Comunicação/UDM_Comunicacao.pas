unit UDM_Comunicacao;

interface

uses
  SysUtils, Classes, DB, ADODB, Funcoes, IniFiles;

type
  TDMComunicacao = class(TDataModule)
    Connection: TADOConnection;
    QSelect: TADOQuery;
    QSelectItem: TADOQuery;
    qCNC: TADOQuery;
    QExec: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function GetCentroDeCusto: Integer;
  end;

var
  DMComunicacao: TDMComunicacao;

implementation

uses UComunicacao;

{$R *.dfm}

function TDMComunicacao.GetCentroDeCusto: Integer;
var
  ArqConf: TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'CC', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

procedure TDMComunicacao.DataModuleCreate(Sender: TObject);
begin
  try
    Connection.Connected := false;
    Connection.ConnectionString := 'FILE NAME=Siac.udl';
    Connection.Connected := true;

    qCNC.Close;
    qCNC.Parameters.ParamByName('CNC_CODIGO').Value := GetCentroDeCusto;
    qCNC.Open

  finally
  end;
end;

end.
