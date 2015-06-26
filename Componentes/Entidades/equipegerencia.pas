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
unit EquipeGerencia;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Variants;

type
  TEquipeGerencia = class(TSQuery)
    private
      { Private fields of TEquipeGerencia }
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoVendedor }
        FCodigoVendedor : Integer;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TEdit;
        { Storage for property ECodigoVendedor }
        FECodigoVendedor : TDBLookupComboBox;

      { Private methods of TEquipeGerencia }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoVendedor }
        function GetCodigoVendedor : Integer;
        { Write method for property CodigoVendedor }
        procedure SetCodigoVendedor(Value : Integer);

    protected
      { Protected fields of TEquipeGerencia }

      { Protected methods of TEquipeGerencia }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TEquipeGerencia }

      { Public methods of TEquipeGerencia }
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdFUN, CdVendedor:Integer):Boolean;
        destructor Destroy; override;
        { Insere um Grupo }
        function Inserir(CdCNC,CdFUN, CdVendedor: integer):boolean;
        { Localiza um Grupo }
        function LocalizarCod(CdFUN,CdVendedor:Integer):Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TEquipeGerencia }
        { Código do Grupo }
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property CodigoVendedor : Integer
             read GetCodigoVendedor write SetCodigoVendedor;
        property ECodigoFUN : TEdit read FECodigoFUN write FECodigoFUN;
        property ECodigoVendedor : TDBLookupComboBox
             read FECodigoVendedor write FECodigoVendedor;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TEquipeGerencia with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TEquipeGerencia]);
end;

{ Method to set variable and property values and create objects }
procedure TEquipeGerencia.AutoInitialize;
begin
     FECodigoFUN := nil;
     FECodigoVendedor := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TEquipeGerencia.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoVendedor then
        FECodigoVendedor := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TEquipeGerencia.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoFUN }
function TEquipeGerencia.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TEquipeGerencia.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoVendedor }
function TEquipeGerencia.GetCodigoVendedor : Integer;
begin
  try
    Result := Self.fieldByName('FUN_VENDEDOR').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoVendedor }
procedure TEquipeGerencia.SetCodigoVendedor(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_VENDEDOR').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_VENDEDOR"!');
    end;
end;

procedure TEquipeGerencia.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    ECodigoVendedor.Enabled     :=Habilitar;
  except
  end;
end;

procedure TEquipeGerencia.CarregaDados;
begin
  Try
    ECodigoVendedor.KeyValue :=CodigoVendedor;
  except
  end;
end;

constructor TEquipeGerencia.Create(AOwner: TComponent);
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

function TEquipeGerencia.Deletar(CdFUN, CdVendedor:Integer):Boolean;
begin
  If not(localizarCod(CdFUN,CdVendedor)) Then
  Begin
    Result := False;
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      If Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        Begin
          try
            ECodigoVendedor.KeyValue := -1;
          except
          end;
        end;
      end
      else
        Result := False;
    Except
      Result := False;
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TEquipeGerencia.Destroy;
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

{ Insere um Grupo }
function TEquipeGerencia.Inserir(CdCNC,CdFUN, CdVendedor: integer):boolean;
begin
  result := false;
  If (localizarCod(CdFUN, CdVendedor)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      Insert;
      CodigoCNC      := CdCNC;
      CodigoFUN      := CdFUN;
      CodigoVendedor := CdVendedor;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      try
        Post;
        GeraLog(6110,CdCNC,CdFUN,IntToStr(CdVendedor));
        result := true;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

{ Localiza um Grupo }
function TEquipeGerencia.LocalizarCod(CdFUN,CdVendedor:Integer):Boolean;
begin
  If (CdFUN<>CodigoFUN) or (CdVendedor<>CodigoVendedor) Then
    If locate('FUN_CODIGO;FUN_VENDEDOR', vararrayof([CdFUN, CdVendedor]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TEquipeGerencia.deletarauto:Boolean;
var
  CNC, FUN, VEN:integer;
begin
  try
    CNC := CodigoCNC;
    FUN := CodigoFUN;
    VEN := CodigoVendedor;
    Delete;
    result:=true;
    GeraLog(6110,CNC,FUN,IntToStr(VEN));
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
