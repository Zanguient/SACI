////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: PSACI                                                //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: PSACI                                                //
// UNIT................: Cadastro de Bancos                                   //
// ANALISTA............: Anderson Gonçalves                                   //
// DESENVOLVEDOR.......: Anderson Gonçalves                                   //
// DATA DAS ALTERAÇÕES.: 02/10/2010                                           //
//============================================================================//
// COMENTÁRIOS..:                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//============================================================================//
////////////////////////////////////////////////////////////////////////////////
unit Log;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Dbtables, Dialogs, Db, Stdctrls, Mask, 
     Dbctrls, Configuracao, Variants, Registro_Deletado;

type
  TLog = class(TQuery)
    private
      { Private fields of TLog }
        { Storage for property CConfiguracao }
        FCConfiguracao : TConfiguracao;
        { Storage for property CRegistroDeletado }
        FCRegistroDeletado : TRegistro_Deletado;
        { Storage for property CncCodigoEnt }
        FCncCodigoEnt : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoEnt }
        FCodigoEnt : Integer;
        { Storage for property CodigoLOG }
        FCodigoLOG : Integer;
        { Storage for property CodigoOPS }
        FCodigoOPS : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property MaquinaLOG }
        FMaquinaLOG : Integer;
        { Storage for property Tipo }
        FTipo : String;

      { Private methods of TLog }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CncCodigoEnt }
        function GetCncCodigoEnt : Integer;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Read method for property CodigoEnt }
        function GetCodigoEnt : Integer;
        { Read method for property CodigoLOG }
        function GetCodigoLOG : Integer;
        { Read method for property CodigoOPS }
        function GetCodigoOPS : Integer;
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Read method for property Data }
        function GetData : Tdatetime;
        { Read method for property MaquinaLOG }
        function GetMaquinaLOG : Integer;
        { Read method for property Tipo }
        function GetTipo : String;

    protected
      { Protected fields of TLog }
        CodLog : Longint;

      { Protected methods of TLog }

    public
      { Public fields and properties of TLog }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TLog }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        { Insere um Cliente }
        function Inserir(CdOPS,PCncCodigo,PCodigoEnt, PMaquina: integer;PObs:String=''):boolean;
        function MesDiaHora(Dat:TDateTime):string;

    published
      { Published properties of TLog }
        property CConfiguracao : TConfiguracao
             read FCConfiguracao write FCConfiguracao;
        property CRegistroDeletado : TRegistro_Deletado
             read FCRegistroDeletado write FCRegistroDeletado;
        property CncCodigoEnt : Integer
             read GetCncCodigoEnt write FCncCodigoEnt;
        property CodigoCNC : Integer read GetCodigoCNC write FCodigoCNC;
        property CodigoEnt : Integer read GetCodigoEnt write FCodigoEnt;
        property CodigoLOG : Integer read GetCodigoLOG write FCodigoLOG;
        property CodigoOPS : Integer read GetCodigoOPS write FCodigoOPS;
        property CodigoUSU : Integer read GetCodigoUSU write FCodigoUSU;
        property Data : Tdatetime read GetData write FData;
        property MaquinaLOG : Integer read GetMaquinaLOG write FMaquinaLOG;
        property Tipo : String read GetTipo write FTipo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TLog with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TLog]);
end;

{ Method to set variable and property values and create objects }
procedure TLog.AutoInitialize;
begin
     Estado := 0;
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TLog.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CncCodigoEnt }
function TLog.GetCncCodigoEnt : Integer;
begin
  try
    Result := Self.fieldByName('LOG_CNC_CODIGO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoCNC }
function TLog.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoEnt }
function TLog.GetCodigoEnt : Integer;
begin
  try
    Result := Self.fieldByName('LOG_CODIGO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoLOG }
function TLog.GetCodigoLOG : Integer;
begin
  try
    Result := Self.fieldByName('LOG_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoOPS }
function TLog.GetCodigoOPS : Integer;
begin
  try
    Result := Self.fieldByName('OPS_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoUSU }
function TLog.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Data }
function TLog.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('LOG_DATA_HORA').asDateTime;
  except
    result:= 0
  end;
end;

{ Read method for property MaquinaLOG }
function TLog.GetMaquinaLOG : Integer;
begin
  try
    Result := Self.fieldByName('LOG_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Tipo }
function TLog.GetTipo : String;
begin
  try
    Result := Self.fieldByName('LOG_TIPO_ENT').asString;
  except
    result:= '';
  end;
end;

constructor TLog.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;

     { Code to perform other tasks when the component is created }

end;

destructor TLog.Destroy;
begin
     { AutoDestroy, which is generated by Component Create, frees any   }
     { objects created by AutoInitialize.                               }
     AutoDestroy;

     { Here, free any other dynamic objects that the component methods  }
     { created but have not yet freed.  Also perform any other clean-up }
     { operations needed before the component is destroyed.             }

     { Last, free the component by calling the Destroy method of the    }
     { parent class.                                                    }
     inherited Destroy;
end;

{ Insere um Cliente }
function TLog.Inserir(CdOPS,PCncCodigo,PCodigoEnt, PMaquina: integer;PObs:String=''):boolean;
begin
  Result := False;
  CodLog    := CConfiguracao.ProximoCodigo('LOG_CODIGO', 1);
  try
    with CConfiguracao.QueryComandos do
    Begin
      Close;
      SQL.Text := 'INSERT INTO LOG '+
        '(CNC_ORIGEM,CNC_CODIGO,LOG_CODIGO,USU_CODIGO,LOG_MAQUINA,LOG_DATA_HORA,LOG_DT_WINDOWS '+
        ',BNC_CODIGO,OPS_CODIGO,LOG_CNC_CODIGO_ENT,LOG_CODIGO_ENT '+
        ',LOG_TIPO_ENT) VALUES '+
        '( '+IntToStr(CConfiguracao.CentroDeCusto)+
        ', '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(CodLog)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ', '+IntToStr(PMaquina)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',GETDATE() '+
        ',0'+ //BNC
        ', '+IntToStr(CdOPS)+
        ', '+IntToStr(PCNCCodigo)+
        ', '+IntToStr(PCodigoEnt)+
        ',"'+PObs+'") ';
      ExecSQL;
    end;
    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro corrente LOG!');
  End;
end;

function TLog.MesDiaHora(Dat:TDateTime):string;
var
  Datastr:string;
Begin
  Datastr:=formatDateTime('dd/mm/yyyy hh:mm:ss',Dat);
  Result:=Copy(Datastr,4,3)+Copy(Datastr,1,3)+Copy(Datastr,7,4)+Copy(Datastr,11,9);
end;


end.
