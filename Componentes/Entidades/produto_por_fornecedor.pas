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
unit Produto_por_Fornecedor;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Fornecedor, Configuracao, Funcoes, Variants;

type
  TProduto_por_Fornecedor = class(TSQuery)
    private
      { Private fields of TProduto_por_Fornecedor }
        { Storage for property CFornecedor }
        FCFornecedor : TFornecedor;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoPPF }
        FCodigoPPF : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;

      { Private methods of TProduto_por_Fornecedor }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property CodigoPPF }
        function GetCodigoPPF : Integer;
        { Write method for property CodigoPPF }
        procedure SetCodigoPPF(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);

    protected
      { Protected fields of TProduto_por_Fornecedor }

      { Protected methods of TProduto_por_Fornecedor }
        procedure Loaded; override;

    public
      { Public fields and properties of TProduto_por_Fornecedor }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TProduto_por_Fornecedor }
        { Altera um Produto por Fornecedor }
        function Alterar(CdPPF, CdPRD, CdFOR: Integer):boolean;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdPPF: Integer):Boolean;
        destructor Destroy; override;
        { Insere um Produto por Fornecedor }
        function Inserir(CdPPF,CdPRD, CdFOR: Integer):boolean;
        function Localizar(CdPRD, CdFor:Integer):Boolean;
        { Localiza um Porduto por Fornecedor }
        function LocalizarCod(CdPPF:Integer):Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TProduto_por_Fornecedor }
        property CFornecedor : TFornecedor
             read FCFornecedor write FCFornecedor;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Fornecedor }
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        { Código do Produto por Fornecedor }
        property CodigoPPF : Integer read GetCodigoPPF write SetCodigoPPF;
        { Código do Produto }
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TProduto_por_Fornecedor with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TProduto_por_Fornecedor]);
end;

{ Method to set variable and property values and create objects }
procedure TProduto_por_Fornecedor.AutoInitialize;
begin
     Estado := 0;
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TProduto_por_Fornecedor.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TProduto_por_Fornecedor.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TProduto_por_Fornecedor.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TProduto_por_Fornecedor.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TProduto_por_Fornecedor.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoPPF }
function TProduto_por_Fornecedor.GetCodigoPPF : Integer;
begin
  try
    Result := Self.fieldByName('PPF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPPF }
procedure TProduto_por_Fornecedor.SetCodigoPPF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PPF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PPF_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TProduto_por_Fornecedor.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPRD }
procedure TProduto_por_Fornecedor.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Altera um Produto por Fornecedor }
function TProduto_por_Fornecedor.Alterar(CdPPF, CdPRD, CdFOR: Integer):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result := true;
  If not(localizarCod(CdPPF)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoPRD      := cdPRD;
      CodigoFOR      := CdFOR;

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

constructor TProduto_por_Fornecedor.Create(AOwner: TComponent);
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

function TProduto_por_Fornecedor.Deletar(CdPPF: Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdPPF)) Then
  Begin
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!');
    Result := False;
  end
  Else
  Begin
    try
      Result := Delete;
    Except
      Result := False;
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TProduto_por_Fornecedor.Destroy;
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

{ Insere um Produto por Fornecedor }
function TProduto_por_Fornecedor.Inserir(CdPPF,CdPRD, CdFOR: Integer):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdPPF=0 then
    Cod  := ProximoCodigo('PPF_CODIGO')
  else
    Cod  := CdPPF;

  If (localizarCod(Cod)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO PRODUTO_POR_FORNECEDOR VALUES '+
        ' (' +IntToStr(CdPRD)+
        ' ,' +IntToStr(CConfiguracao.CodigoCNC)+
        ' ,' +IntToStr(Cod)+
        ' ,' +IntToStr(CdFOR)+')');
      result := true;
    except
      result := false;
      ShowMessage('Não foi possível incluir Produto por Fornecedor! Entre em contato com o CPD!');
    end;
  end;
end;

procedure TProduto_por_Fornecedor.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }
  Filtered := False;
end;

function TProduto_por_Fornecedor.Localizar(CdPRD, CdFor:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdPRD<>CodigoPRD)or (CdFOR<>CodigoFOR) Then
    If locate('FOR_CODIGO; PRD_CODIGO', vararrayof([CdFOR,CdPRD]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

{ Localiza um Porduto por Fornecedor }
function TProduto_por_Fornecedor.LocalizarCod(CdPPF:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdPPF<>CodigoPPF) Then
    If locate('PPF_CODIGO', CdPPF, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TProduto_por_Fornecedor.deletarauto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    Result := Delete;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
