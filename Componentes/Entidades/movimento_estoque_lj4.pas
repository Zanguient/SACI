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
unit Movimento_Estoque_LJ4;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Variants, Funcoes;

type
  TMovimento_Estoque_LJ4 = class(TSQuery)
    private
      { Private fields of TMovimento_Estoque_LJ4 }
        { Storage for property CncCodigo }
        FCncCodigo : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoML4 }
        FCodigoML4 : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property EntCodigo }
        FEntCodigo : Integer;
        { Storage for property Es }
        FEs : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Saldo }
        FSaldo : Double;
        { Storage for property TipoEnt }
        FTipoEnt : Integer;
        { Storage for property TipoMov }
        FTipoMov : Integer;

      { Private methods of TMovimento_Estoque_LJ4 }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CncCodigo }
        function GetCncCodigo : Integer;
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Read method for property CodigoML4 }
        function GetCodigoML4 : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property Data }
        function GetData : Tdatetime;
        { Read method for property EntCodigo }
        function GetEntCodigo : Integer;
        { Read method for property Es }
        function GetEs : String;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Read method for property Saldo }
        function GetSaldo : Double;
        { Read method for property TipoEnt }
        function GetTipoEnt : Integer;
        { Read method for property TipoMov }
        function GetTipoMov : Integer;

    protected
      { Protected fields of TMovimento_Estoque_LJ4 }

      { Protected methods of TMovimento_Estoque_LJ4 }

    public
      { Public fields and properties of TMovimento_Estoque_LJ4 }

      { Public methods of TMovimento_Estoque_LJ4 }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        { Insere um Movimento }
        function Inserir(CdCNC,CdPRD,CdFUN,PTipomov,PCncCodigo,PEntCodigo: integer; PEs: String;PQuantidade,PSaldo: Double; POBS:string=''; DtMov:TDateTime=0):Boolean;

    published
      { Published properties of TMovimento_Estoque_LJ4 }
        property CncCodigo : Integer read GetCncCodigo write FCncCodigo;
        property CodigoFUN : Integer read GetCodigoFUN write FCodigoFUN;
        property CodigoML4 : Integer read GetCodigoML4 write FCodigoML4;
        { Código do Produto }
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        property Data : Tdatetime read GetData write FData;
        property EntCodigo : Integer read GetEntCodigo write FEntCodigo;
        property Es : String read GetEs write FEs;
        property Observacao : String read GetObservacao write FObservacao;
        property Quantidade : Double read GetQuantidade write FQuantidade;
        property Saldo : Double read GetSaldo write FSaldo;
        property TipoEnt : Integer read GetTipoEnt write FTipoEnt;
        property TipoMov : Integer read GetTipoMov write FTipoMov;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMovimento_Estoque_LJ4 with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMovimento_Estoque_LJ4]);
end;

{ Method to set variable and property values and create objects }
procedure TMovimento_Estoque_LJ4.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TMovimento_Estoque_LJ4.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CncCodigo }
function TMovimento_Estoque_LJ4.GetCncCodigo : Integer;
begin
  try
    Result := Self.fieldByName('ML4_CNC_CODIGO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoFUN }
function TMovimento_Estoque_LJ4.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoML4 }
function TMovimento_Estoque_LJ4.GetCodigoML4 : Integer;
begin
  try
    Result := Self.fieldByName('ML4_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoPRD }
function TMovimento_Estoque_LJ4.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Data }
function TMovimento_Estoque_LJ4.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('ML4_DATA_HORA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property EntCodigo }
function TMovimento_Estoque_LJ4.GetEntCodigo : Integer;
begin
  try
    Result := Self.fieldByName('ML4_ENT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Es }
function TMovimento_Estoque_LJ4.GetEs : String;
begin
  try
    Result := Self.fieldByName('ML4_ES').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Observacao }
function TMovimento_Estoque_LJ4.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('ML4_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Quantidade }
function TMovimento_Estoque_LJ4.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('ML4_QUANTIDADE').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Saldo }
function TMovimento_Estoque_LJ4.GetSaldo : Double;
begin
  try
    Result := Self.fieldByName('ML4_SALDO_ANT').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property TipoEnt }
function TMovimento_Estoque_LJ4.GetTipoEnt : Integer;
begin
  try
    Result := Self.fieldByName('ML4_TIPO_ENT').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property TipoMov }
function TMovimento_Estoque_LJ4.GetTipoMov : Integer;
begin
  try
    Result := Self.fieldByName('ML4_TIPO_MOV').asInteger;
  except
    result:= 0;
  end;
end;

constructor TMovimento_Estoque_LJ4.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'MOVIMENTO_DE_ESTOQUE_LJ4';

     { Code to perform other tasks when the component is created }

end;

destructor TMovimento_Estoque_LJ4.Destroy;
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

{ Insere um Movimento }
function TMovimento_Estoque_LJ4.Inserir(CdCNC,CdPRD,CdFUN,PTipomov,PCncCodigo,PEntCodigo: integer; PEs: String;PQuantidade,PSaldo: Double; POBS:string=''; DtMov:TDateTime=0):Boolean;
Var
  Cod:Integer;
  vData: TDateTime;
begin
  Result := False;
  if DtMov > 0 then
    vData := DtMov    //Usado somente na tela de corrigir o Estoque
  else
    vData := CConfiguracao.DataHora;

  Cod := ProximoCodigo('ML4_CODIGO');
  if CConfiguracao.Data <= 0 then
  Begin
    ShowMessage('Problema com a Data!');
    Exit;
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
      '(CNC_CODIGO,ML4_CODIGO,USU_CODIGO,ML4_MAQUINA,ML4_DATA_HORA '+
      ',PRD_CODIGO,FUN_CODIGO '+
      ',ML4_ES,ML4_TIPO_MOV,ML4_QUANTIDADE '+
      ',ML4_SALDO_ANT,ML4_CNC_CODIGO_ENT,ML4_ENT_CODIGO '+
      ',ML4_OBSERVACAO) VALUES '+
      '( '+IntToStr(CdCNC)+
      ', '+IntToStr(Cod)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ', '+IntToStr(Maquina)+
      ',"'+MesDiaHora(vData)+'" '+
      ', '+IntToStr(CdPRD)+
      ', '+IntToStr(CdFUN)+      
      ',"'+PEs+'" '+
      ', '+IntToStr(PTipoMov)+
      ', '+VirgPonto(PQuantidade)+
      ', '+VirgPonto(PSaldo)+
      ', '+IntToStr(PCncCodigo)+
      ', '+IntToStr(PEntCodigo)+
      ',"'+PObs+'") ');
    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro corrente!');
  End;
end;


end.
