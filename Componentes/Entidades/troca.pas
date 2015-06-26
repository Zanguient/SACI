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
unit Troca;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Pedido_de_Venda, Variants;

type
  TTroca = class(TSQuery)
    private
      { Private fields of TTroca }
        { Storage for property CPedVend }
        FCPedVend : TPedido_de_Venda;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoTRO }
        FCodigoTRO : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property Motivo }
        FMotivo : String;
        { Storage for property NotaFiscal }
        FNotaFiscal : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TTroca }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
        { Read method for property CodigoTRO }
        function GetCodigoTRO : Integer;
        { Write method for property CodigoTRO }
        procedure SetCodigoTRO(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property Motivo }
        function GetMotivo : String;
        { Write method for property Motivo }
        procedure SetMotivo(Value : String);
        { Read method for property NotaFiscal }
        function GetNotaFiscal : Integer;
        { Write method for property NotaFiscal }
        procedure SetNotaFiscal(Value : Integer);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TTroca }

      { Protected methods of TTroca }

    public
      { Public fields and properties of TTroca }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TTroca }
        { Altera uma Troca }
        function Alterar(CdCNC, CdPDV, CdTRO, CdUSU: integer; PData:TDateTime;PMotivo: String):boolean;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC,CdPDV:Integer);
        destructor Destroy; override;
        { Insere uma Troca }
        function Inserir(CdCNC, CdPDV, CdTRO, CdUSU: integer; PData:TDateTime;PMotivo: String):boolean;
        { Localiza um cliente }
        function LocalizarCod(CdPDV,CdCNC:Integer):Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TTroca }
        property CPedVend : TPedido_de_Venda read FCPedVend write FCPedVend;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Pedido de Venda }
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        property CodigoTRO : Integer read GetCodigoTRO write SetCodigoTRO;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property Data : Tdatetime read GetData write SetData;
        property Motivo : String read GetMotivo write SetMotivo;
        property NotaFiscal : Integer read GetNotaFiscal write SetNotaFiscal;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTroca with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTroca]);
end;

{ Method to set variable and property values and create objects }
procedure TTroca.AutoInitialize;
begin
     Estado := 0;
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TTroca.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TTroca.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TTroca.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoPDV }
function TTroca.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPDV }
procedure TTroca.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRO }
function TTroca.GetCodigoTRO : Integer;
begin
  try
    Result := Self.fieldByName('TRO_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTRO }
procedure TTroca.SetCodigoTRO(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRO_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRO_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TTroca.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TTroca.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TTroca.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('TRO_DATA').asDateTime;
  except
    Result :=0;
  end;
end;

{ Write method for property Data }
procedure TTroca.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRO_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRO_DATA"!');
  end;
end;

{ Read method for property Motivo }
function TTroca.GetMotivo : String;
begin
  try
    Result := Self.fieldByName('TRO_MOTIVO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Motivo }
procedure TTroca.SetMotivo(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRO_MOTIVO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRO_MOTIVO"!');
  end;
end;

{ Read method for property NotaFiscal }
function TTroca.GetNotaFiscal : Integer;
begin
  try
    Result := Self.fieldByName('TRO_NOTA_FISCAL').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NotaFiscal }
procedure TTroca.SetNotaFiscal(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRO_NOTA_FISCAL').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRO_NOTA_FISCAL"!');
    end;
end;

{ Read method for property Situacao }
function TTroca.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('TRO_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TTroca.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRO_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRO_SITUACAO"!');
    end;
end;

{ Altera uma Troca }
function TTroca.Alterar(CdCNC, CdPDV, CdTRO, CdUSU: integer; PData:TDateTime;PMotivo: String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result := true;
  If not(localizarCod(CdPDV,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoTRO := CdTro;
      CodigoUSU := CdUSU;
      Data      := PData;
      Motivo    := PMotivo;

      try
        Post;

      except
        result := false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result := false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

constructor TTroca.Create(AOwner: TComponent);
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

procedure TTroca.Deletar(CdCNC,CdPDV:Integer);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdPDV,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TTroca.Destroy;
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

{ Insere uma Troca }
function TTroca.Inserir(CdCNC, CdPDV, CdTRO, CdUSU: integer; PData:TDateTime;PMotivo: String):boolean;
Var
  Cod:Integer;
begin
  if CdTRO=0 then
    Cod    := ProximoCodigo('TRO_CODIGO')
  else
    Cod    := CdTRO;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
   result:=true;
       try
         INSERT;
         CodigoTRO      := Cod;
         CodigoCNC      := CdCNC;
         CodigoUSU      := CdUSU;
         CodigoPDV      := CdPDV;
         Data           := PData;
         Motivo         := PMotivo;
         Situacao       := 0;
         NotaFiscal     := 0;
         try
           Post;

         except
           result := false;
           Cancel;
           ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
         end;
       except
         result := false;
         ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
       end;
  end;
end;

{ Localiza um cliente }
function TTroca.LocalizarCod(CdPDV,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdPDV<>CodigoPDV) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;PDV_CODIGO', vararrayof([CdCNC, CdPDV]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TTroca.deletarauto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    Delete;
    result:=true;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
