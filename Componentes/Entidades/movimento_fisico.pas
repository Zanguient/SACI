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
unit Movimento_Fisico;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Variants, Funcoes;

type
  TMovimento_Fisico = class(TSQuery)
    private
      { Private fields of TMovimento_Fisico }
        { Storage for property CodigoEntrada }
        FCodigoEntrada : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoMEF }
        FCodigoMEF : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property EntradaCNC }
        FEntradaCNC : Integer;
        { Storage for property Es }
        FEs : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Saldo }
        FSaldo : Double;
        { Storage for property TipoMov }
        FTipoMov : Integer;

      { Private methods of TMovimento_Fisico }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoEntrada }
        function GetCodigoEntrada : Integer;
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Read method for property CodigoMEF }
        function GetCodigoMEF : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property Data }
        function GetData : Tdatetime;
        { Read method for property EntradaCNC }
        function GetEntradaCNC : Integer;
        { Read method for property Es }
        function GetEs : String;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Read method for property Saldo }
        function GetSaldo : Double;
        { Read method for property TipoMov }
        function GetTipoMov : Integer;

    protected
      { Protected fields of TMovimento_Fisico }

      { Protected methods of TMovimento_Fisico }

    public
      { Public fields and properties of TMovimento_Fisico }

      { Public methods of TMovimento_Fisico }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function Inserir(CdCNC,CdMEF,CdPRD,CdFUN,CdEntradaCNC, CdEntrada, CdTipoMov: integer; PEs: String; PQuantidade,PSaldo: Double; POBS:string=''; DtMov:TDateTime=0):boolean;

    published
      { Published properties of TMovimento_Fisico }
        property CodigoEntrada : Integer
             read GetCodigoEntrada write FCodigoEntrada;
        property CodigoFUN : Integer read GetCodigoFUN write FCodigoFUN;
        { Código do Produto }
        property CodigoMEF : Integer read GetCodigoMEF write FCodigoMEF;
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        property Data : Tdatetime read GetData write FData;
        property EntradaCNC : Integer read GetEntradaCNC write FEntradaCNC;
        property Es : String read GetEs write FEs;
        property Observacao : String read GetObservacao write FObservacao;
        property Quantidade : Double read GetQuantidade write FQuantidade;
        property Saldo : Double read GetSaldo write FSaldo;
        property TipoMov : Integer read GetTipoMov write FTipoMov;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMovimento_Fisico with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMovimento_Fisico]);
end;

{ Method to set variable and property values and create objects }
procedure TMovimento_Fisico.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TMovimento_Fisico.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoEntrada }
function TMovimento_Fisico.GetCodigoEntrada : Integer;
begin
  try
    Result := Self.fieldByName('MEF_ENT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoFUN }
function TMovimento_Fisico.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoMEF }
function TMovimento_Fisico.GetCodigoMEF : Integer;
begin
  try
    Result := Self.fieldByName('MEF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoPRD }
function TMovimento_Fisico.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;


{ Read method for property Data }
function TMovimento_Fisico.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('MEF_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property EntradaCNC }
function TMovimento_Fisico.GetEntradaCNC : Integer;
begin
  try
    Result := Self.fieldByName('MEF_CNC_CODIGO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property Es }
function TMovimento_Fisico.GetEs : String;
begin
  try
    Result := Self.fieldByName('MEF_ES').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Observacao }
function TMovimento_Fisico.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('MEF_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Quantidade }
function TMovimento_Fisico.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('MEF_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property Saldo }
function TMovimento_Fisico.GetSaldo : Double;
begin
  try
    Result := Self.fieldByName('MEF_SALDO_ANT').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property TipoMov }
function TMovimento_Fisico.GetTipoMov : Integer;
begin
  try
    Result := Self.fieldByName('MEF_TIPO_MOV').asInteger;
  except
    result:= 0
  end;
end;

constructor TMovimento_Fisico.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'MOVIMENTO_DE_ESTOQUE_FISICO';

     { Code to perform other tasks when the component is created }

end;

destructor TMovimento_Fisico.Destroy;
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

function TMovimento_Fisico.Inserir(CdCNC,CdMEF,CdPRD,CdFUN,CdEntradaCNC, CdEntrada, CdTipoMov: integer; PEs: String; PQuantidade,PSaldo: Double; POBS:string=''; DtMov:TDateTime=0):boolean;
Var
  Cod:Integer;
  vData: TDateTime;
begin
  Result := False;
  Cod    := ProximoCodigo('MEF_CODIGO');

  if DtMov > 0 then
    vData := DtMov    //Usado somente na tela de corrigir o Estoque
  else
    vData := CConfiguracao.DataHora;

  if vData <= 0 then
  Begin
    ShowMessage('Problema com a Data!');
    Exit;
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
      '(CNC_CODIGO,MEF_CODIGO,USU_CODIGO,MEF_MAQUINA,MEF_DATA '+
      ',PRD_CODIGO,FUN_CODIGO '+
      ',MEF_ES,MEF_TIPO_MOV,MEF_QUANTIDADE '+
      ',MEF_SALDO_ANT,MEF_CNC_CODIGO_ENT,MEF_ENT_CODIGO '+
      ',MEF_OBSERVACAO) VALUES '+
      '( '+IntToStr(CdCNC)+
      ', '+IntToStr(Cod)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ', '+IntToStr(Maquina)+
      ',"'+MesDiaHora(vData)+'" '+
      ', '+IntToStr(CdPRD)+
      ', '+IntToStr(CdFUN)+      
      ',"'+PEs+'" '+
      ', '+IntToStr(CdTipoMov)+
      ', '+VirgPonto(PQuantidade)+
      ', '+VirgPonto(PSaldo)+
      ', '+IntToStr(CdEntradaCNC)+
      ', '+IntToStr(CdEntrada)+
      ',"'+PObs+'") ');
    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro corrente!');
  End;
end;


end.
