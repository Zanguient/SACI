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
unit ClienteAFim;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Configuracao, Variants;

type
  TClienteAfim = class(TSQuery)
    private
      { Private fields of TClienteAfim }
        { Storage for property Afinidade }
        FAfinidade : String;
        { Storage for property CodigoCLI1 }
        FCodigoCLI1 : Integer;
        { Storage for property CodigoCLI2 }
        FCodigoCLI2 : Integer;
        { Storage for property CodigoCNC1 }
        FCodigoCNC1 : Integer;
        { Storage for property CodigoCNC2 }
        FCodigoCNC2 : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;

      { Private methods of TClienteAfim }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Afinidade }
        function GetAfinidade : String;
        { Write method for property Afinidade }
        procedure SetAfinidade(Value : String);
        { Read method for property CodigoCLI1 }
        function GetCodigoCLI1 : Integer;
        { Write method for property CodigoCLI1 }
        procedure SetCodigoCLI1(Value : Integer);
        { Read method for property CodigoCLI2 }
        function GetCodigoCLI2 : Integer;
        { Write method for property CodigoCLI2 }
        procedure SetCodigoCLI2(Value : Integer);
        { Read method for property CodigoCNC1 }
        function GetCodigoCNC1 : Integer;
        { Write method for property CodigoCNC1 }
        procedure SetCodigoCNC1(Value : Integer);
        { Read method for property CodigoCNC2 }
        function GetCodigoCNC2 : Integer;
        { Write method for property CodigoCNC2 }
        procedure SetCodigoCNC2(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);

    protected
      { Protected fields of TClienteAfim }

      { Protected methods of TClienteAfim }

    public
      { Public fields and properties of TClienteAfim }

      { Public methods of TClienteAfim }
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC1,CdCNC2,CdCLI1,CdCLI2:Integer):Boolean;
        destructor Destroy; override;
        { Insere um Cliente Afim }
        function Inserir(CdCNC1,CdCNC2,CdCLI1,CdCLI2 : integer;PAfinidade:String):boolean;
        { Localiza um cliente Afim }
        function LocalizarCod(CdCNC1,CdCNC2,CdCLI1,CdCLI2:Integer):Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TClienteAfim }
        property Afinidade : String read GetAfinidade write SetAfinidade;
        property CodigoCLI1 : Integer read GetCodigoCLI1 write SetCodigoCLI1;
        { Código do Produto }
        property CodigoCLI2 : Integer read GetCodigoCLI2 write SetCodigoCLI2;
        property CodigoCNC1 : Integer read GetCodigoCNC1 write SetCodigoCNC1;
        property CodigoCNC2 : Integer read GetCodigoCNC2 write SetCodigoCNC2;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TClienteAfim with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TClienteAfim]);
end;

{ Method to set variable and property values and create objects }
procedure TClienteAfim.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TClienteAfim.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Afinidade }
function TClienteAfim.GetAfinidade : String;
begin
  try
    Result := Self.fieldByName('CLA_AFINIDADE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Afinidade }
procedure TClienteAfim.SetAfinidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLA_AFINIDADE').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLA_AFINIDADE"!');
    end;
end;

{ Read method for property CodigoCLI1 }
function TClienteAfim.GetCodigoCLI1 : Integer;
begin
  try
    Result := Self.fieldByName('CLA_CLI1').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCLI1 }
procedure TClienteAfim.SetCodigoCLI1(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLA_CLI1').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLA_CLI1"!');
    end;
end;

{ Read method for property CodigoCLI2 }
function TClienteAfim.GetCodigoCLI2 : Integer;
begin
  try
    Result := Self.fieldByName('CLA_CLI2').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCLI2 }
procedure TClienteAfim.SetCodigoCLI2(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLA_CLI2').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLA_CLI2"!');
    end;
end;

{ Read method for property CodigoCNC1 }
function TClienteAfim.GetCodigoCNC1 : Integer;
begin
  try
    Result := Self.fieldByName('CLA_CNC1').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC1 }
procedure TClienteAfim.SetCodigoCNC1(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLA_CNC1').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLA_CNC1"!');
    end;
end;

{ Read method for property CodigoCNC2 }
function TClienteAfim.GetCodigoCNC2 : Integer;
begin
  try
    Result := Self.fieldByName('CLA_CNC2').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC2 }
procedure TClienteAfim.SetCodigoCNC2(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLA_CNC2').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLA_CNC2"!');
  end;
end;

{ Read method for property CodigoUSU }
function TClienteAfim.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TClienteAfim.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('USU_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
  end;
end;

{ Read method for property DataAlterado }
function TClienteAfim.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CLA_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TClienteAfim.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLA_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLA_DT_ALTERADO"!');
  end;
end;

constructor TClienteAfim.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CLIENTE_AFIM';

     { Code to perform other tasks when the component is created }

end;

function TClienteAfim.Deletar(CdCNC1,CdCNC2,CdCLI1,CdCLI2:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCNC1,CdCNC2,CdCLI1,CdCLI2)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        GeraLog(1910,CdCNC2,CdCLI2,'Cliente: '+IntToStr(CdCLI1));
        RegistrarDel(CdCNC2,1260(*ClienteAfim*),CdCLI2,'Cliente: '+IntToStr(CdCLI1));
      end
      else
        Result := False;
    Except
      Result := False;
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TClienteAfim.Destroy;
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

{ Insere um Cliente Afim }
function TClienteAfim.Inserir(CdCNC1,CdCNC2,CdCLI1,CdCLI2 : integer;PAfinidade:String):boolean;
begin
  result := false;
  If not localizarCod(CdCNC1,CdCNC2,CdCLI1,CdCLI2) Then
  begin
    try
      Insert;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := CConfiguracao.DataHora;
      CodigoCLI1     := CdCLI1;
      CodigoCLI2     := CdCLI2;
      CodigoCNC1     := CDCNC1;
      CodigoCNC2     := CDCNC2;
      Afinidade      := PAfinidade;

      try
        Post;
        GeraLog(1900,CdCNC2,CdCLI2,'Cliente: '+IntToStr(CdCLI1));
        result := true;        
      except        
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end
  else
    Result := False;
end;

{ Localiza um cliente Afim }
function TClienteAfim.LocalizarCod(CdCNC1,CdCNC2,CdCLI1,CdCLI2:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCNC1<>CodigoCNC1) or (CdCNC2<>CodigoCNC2) or
     (CdCLI1<>CodigoCLI1) or (CdCLI2<>CodigoCLI2) Then
    If locate('CLA_CNC1;CLA_CNC2;CLA_CLI1;CLA_CLI2', vararrayof([CdCNC1,CdCNC2,CdCLI1,CdCLI2]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TClienteAfim.deletarauto:Boolean;
var
  CNC, CLI2,CLI1:integer;
begin
  try
    CNC  := CodigoCNC2;
    CLI2 := CodigoCLI2;
    CLI1 := CodigoCLI1;
    if Delete then
    Begin
      Result := True;
      GeraLog(1910,CNC,CLI2,'Cliente: '+IntToStr(CLI1));
      RegistrarDel(CNC,1260(*ClienteAfim*),CLI2,'Cliente: '+IntToStr(CLI1));
    end
    else
      Result := False;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
