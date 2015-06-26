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
unit Autenticacao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Configuracao, Variants;

type
  TAutenticacao = class(TSQuery)
    private
      { Private fields of TAutenticacao }
        { Storage for property CodigoATN }
        FCodigoATN : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoCNCEnt }
        FCodigoCNCEnt : Integer;
        { Storage for property CodigoDoc }
        FCodigoDoc : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property DebCred }
        FDebCred : String;
        { Storage for property TipoDoc }
        FTipoDoc : Integer;
        { Storage for property Valor }
        FValor : Double;

      { Private methods of TAutenticacao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoATN }
        function GetCodigoATN : Integer;
        { Write method for property CodigoATN }
        procedure SetCodigoATN(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoCNCEnt }
        function GetCodigoCNCEnt : Integer;
        { Write method for property CodigoCNCEnt }
        procedure SetCodigoCNCEnt(Value : Integer);
        { Read method for property CodigoDoc }
        function GetCodigoDoc : Integer;
        { Write method for property CodigoDoc }
        procedure SetCodigoDoc(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property DebCred }
        function GetDebCred : String;
        { Write method for property DebCred }
        procedure SetDebCred(Value : String);
        { Read method for property TipoDoc }
        function GetTipoDoc : Integer;
        { Write method for property TipoDoc }
        procedure SetTipoDoc(Value : Integer);
        { Read method for property Valor }
        function GetValor : Double;
        { Write method for property Valor }
        procedure SetValor(Value : Double);

    protected
      { Protected fields of TAutenticacao }

      { Protected methods of TAutenticacao }

    public
      { Public fields and properties of TAutenticacao }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TAutenticacao }
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC,CdATN:Integer);
        destructor Destroy; override;
        { Insere um Cliente }
        function Inserir(CdCNC, CdATN, PCodigoCNCEnt,PCodigoDoc,PTipoDoc: integer; PValor:Double;PData:TDateTime;PDebCred:String):boolean;
        { Localiza um cliente }
        function LocalizarCod(CdATN,CdCNC:Integer):Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TAutenticacao }
        { Código da Autenticacao }
        property CodigoATN : Integer read GetCodigoATN write SetCodigoATN;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoCNCEnt : Integer
             read GetCodigoCNCEnt write SetCodigoCNCEnt;
        property CodigoDoc : Integer read GetCodigoDoc write SetCodigoDoc;
        property Data : Tdatetime read GetData write SetData;
        property DebCred : String read GetDebCred write SetDebCred;
        property TipoDoc : Integer read GetTipoDoc write SetTipoDoc;
        property Valor : Double read GetValor write SetValor;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TAutenticacao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TAutenticacao]);
end;

{ Method to set variable and property values and create objects }
procedure TAutenticacao.AutoInitialize;
begin
     Estado := 0;
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TAutenticacao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoATN }
function TAutenticacao.GetCodigoATN : Integer;
begin
  try
    Result := Self.fieldByName('ATN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoATN }
procedure TAutenticacao.SetCodigoATN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ATN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ATN_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TAutenticacao.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TAutenticacao.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNCEnt }
function TAutenticacao.GetCodigoCNCEnt : Integer;
begin
  try
    Result := Self.fieldByName('ATN_CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNCEnt }
procedure TAutenticacao.SetCodigoCNCEnt(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ATN_CNC_CODIGO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ATN_CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoDoc }
function TAutenticacao.GetCodigoDoc : Integer;
begin
  try
    Result := Self.fieldByName('ATN_COD_DOC').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoDoc }
procedure TAutenticacao.SetCodigoDoc(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ATN_COD_DOC').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ATN_COD_DOC"!');
  end;
end;

{ Read method for property Data }
function TAutenticacao.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('ATN_DATA_HORA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TAutenticacao.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ATN_DATA_HORA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ATN_DATA_HORA"!');
  end;
end;

{ Read method for property DebCred }
function TAutenticacao.GetDebCred : String;
begin
  try
    Result := Self.fieldByName('ATN_DC').asString;
  except
    result:= ''
  end;
end;

{ Write method for property DebCred }
procedure TAutenticacao.SetDebCred(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ATN_DC').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ATN_DC"!');
  end;
end;

{ Read method for property TipoDoc }
function TAutenticacao.GetTipoDoc : Integer;
begin
  try
    result := Self.fieldByName('ATN_TIP_DOC').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property TipoDoc }
procedure TAutenticacao.SetTipoDoc(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ATN_TIP_DOC').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ATN_TIP_DOC"!');
    end;
end;

{ Read method for property Valor }
function TAutenticacao.GetValor : Double;
begin
  try
    Result := Self.fieldByName('ATN_VALOR').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Valor }
procedure TAutenticacao.SetValor(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ATN_VALOR').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ATN_VALOR"!');
    end;
end;

constructor TAutenticacao.Create(AOwner: TComponent);
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
     Tabela := 'AUTENTICACAO';

end;

procedure TAutenticacao.Deletar(CdCNC,CdATN:Integer);
begin
  If not(localizarCod(CdATN,CdCNC)) Then
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

destructor TAutenticacao.Destroy;
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
function TAutenticacao.Inserir(CdCNC, CdATN, PCodigoCNCEnt,PCodigoDoc,PTipoDoc: integer; PValor:Double;PData:TDateTime;PDebCred:String):boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdATN=0 then
    Cod    := ProximoCodigo('ATN_CODIGO')
  else
    Cod    := CdATN;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')    
  else
  begin
   result:=true;
     try
        Insert;
        CodigoATN      := Cod;
        CODIGOCNC      :=CDCNC;
        DATA           :=PData;
        VALOR          :=PValor;
        DEBCRED        :=PdebCred;
        TIPODOC        :=PTipoDoc;
        CODIGOCNCENT   :=PCodigoCNCEnt;
        CODIGODOC      :=PCodigoDoc;

        try
          Post;

        except
          Cancel;
          ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
        end;
      except
        ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
      end;
  end;
end;

{ Localiza um cliente }
function TAutenticacao.LocalizarCod(CdATN,CdCNC:Integer):Boolean;
begin
  with CConfiguracao.QueryComandos do
  begin
    close;
    sql.Text:='SELECT * FROM AUTENTICACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND ATN_CODIGO='+IntToStr(CdATN);
    open;
    Result := (not IsEmpty);
  end;
end;

function TAutenticacao.deletarauto:Boolean;
begin
  try
    Result := Delete;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
