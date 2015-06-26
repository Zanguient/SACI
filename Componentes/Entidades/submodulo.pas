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
unit Submodulo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Variants;

type
  TSubmodulo = class(TSQuery)
    private
      { Private fields of TSubmodulo }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoMDL }
        FCodigoMDL : Integer;
        { Storage for property CodigoSML }
        FCodigoSML : Integer;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoMDL }
        FECodigoMDL : TDBLookupComboBox;
        { Storage for property ECodigoSML }
        FECodigoSML : TEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;

      { Private methods of TSubmodulo }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoMDL }
        function GetCodigoMDL : Integer;
        { Write method for property CodigoMDL }
        procedure SetCodigoMDL(Value : Integer);
        { Read method for property CodigoSML }
        function GetCodigoSML : Integer;
        { Write method for property CodigoSML }
        procedure SetCodigoSML(Value : Integer);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);

    protected
      { Protected fields of TSubmodulo }

      { Protected methods of TSubmodulo }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TSubmodulo }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TSubmodulo }
        { Altera um Beneficiário }
        function Alterar(CdCNC,CdSML,CdMDL: integer; Descricao:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CDSML:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdSML,CdMDL: integer; EDescricao:String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CDSML:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TSubmodulo }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoMDL : Integer read GetCodigoMDL write SetCodigoMDL;
        property CodigoSML : Integer read GetCodigoSML write SetCodigoSML;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoMDL : TDBLookupComboBox
             read FECodigoMDL write FECodigoMDL;
        property ECodigoSML : TEdit read FECodigoSML write FECodigoSML;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TSubmodulo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TSubmodulo]);
end;

{ Method to set variable and property values and create objects }
procedure TSubmodulo.AutoInitialize;
begin
     Estado := 0;
     FECodigoMDL := nil;
     FECodigoSML := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TSubmodulo.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoMDL then
        FECodigoMDL := nil;
     if AComponent = FECodigoSML then
        FECodigoSML := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TSubmodulo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TSubmodulo.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TSubmodulo.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoMDL }
function TSubmodulo.GetCodigoMDL : Integer;
begin
  try
    result := Self.fieldByName('MDL_CODIGO').asInteger;
  except
    result := 0;
  end;
end;

{ Write method for property CodigoMDL }
procedure TSubmodulo.SetCodigoMDL(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MDL_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MDL_CODIGO"!');
    end;
end;

{ Read method for property CodigoSML }
function TSubmodulo.GetCodigoSML : Integer;
begin
  try
    result := Self.fieldByName('SML_CODIGO').asInteger;
  except
    result := 0;
  end;
end;

{ Write method for property CodigoSML }
procedure TSubmodulo.SetCodigoSML(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SML_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SML_CODIGO"!');
    end;
end;

{ Read method for property Descricao }
function TSubmodulo.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('SML_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TSubmodulo.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SML_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SML_DESCRICAO"!');
  end;
end;

{ Altera um Beneficiário }
function TSubmodulo.Alterar(CdCNC,CdSML,CdMDL: integer; Descricao:String):boolean;
begin
  result := False;
  If not(localizarCod(CdSML)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      CodigoMDL     := CdMDL;
      Descricao     := Descricao;
      try
        Post;
        result := True;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TSubmodulo.AlterarAuto:Boolean;
begin
  Result:=false;
  try
    edit;
    try
      Descricao  := EDescricao.Text;
    except
    end;
    try
      CodigoMDL  := ECodigoMDL.KeyValue;
    except
    end;
    try
      Post;
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TSubmodulo.AtualizaControles(Habilitar:Boolean);
begin
  Try
    ECodigoMDL.Enabled     := not Habilitar;
  except
  end;
  Try
    EDbgrid.Enabled        :=not Habilitar;
  except
  end;
  try
    //Somente para Modulo e SubModulo
    ECodigoSML.Enabled     :=Habilitar;
  except
  end;
  try
    EDescricao.Enabled     :=Habilitar;
  except
  end;
end;

procedure TSubmodulo.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
end;

procedure TSubmodulo.CarregaDados;
begin
  try
    ECodigoSML.Text        := IntToStr(CodigoSML);
  except
  end;
  try
    EDescricao.Text        := Descricao;
  except
  end;
end;

constructor TSubmodulo.Create(AOwner: TComponent);
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

function TSubmodulo.Deletar(CDSML:Integer):Boolean;
var
  CdCNC : integer;
begin
  Result := False;
  If not(localizarCod(CdSML)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      if Delete then
      Begin
        Result := True;
        GeraLog(1630,CdCNC,CdSML,'42');
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TSubmodulo.Destroy;
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

function TSubmodulo.FinalizaEdicao:Boolean;
var
  cod:Integer;
begin
  Result := False;
  If Estado=1 then
  Begin
    if Inserirauto then
    Begin
      Result := True;
      close;
      open;
      LocalizarCod(SCodigo);
      Estado:=0;
      AtualizaControles(False);
    end;
  End
  else If Estado=2 then
  Begin
    cod:=codigoSML;
    if Alterarauto then
    Begin
      Result := True;
      close;
      open;
      LocalizarCod(cod);
      Estado:=0;
      AtualizaControles(False);
    end;
  End;
end;

{ Insere um Cliente }
function TSubmodulo.Inserir(CdCNC,CdSML,CdMDL: integer; EDescricao:String):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdSML=0 then
    Cod    := ProximoCodigo('SML_CODIGO')
  else
    Cod    := CdSML;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     Insert;
     try
       CodigoSML        := Cod;
       CodigoCNC        := CdCNC;
       CodigoMDL        := CdMDL;
       Descricao        := EDescricao;
       try
         Post;
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

function TSubmodulo.InserirAuto:Boolean;
Var
  Aux:TDataSetNotifyEvent;
begin
  result:=false;
  try
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    append;
    try
      CodigoSML   := SCodigo;
    except
    end;
    try
      codigocnc   := CConfiguracao.CodigoCNC;
    except
    end;
    try
       Descricao := EDescricao.Text;
    except
    end;
    try
       CodigoMDL := ECodigoMDL.KeyValue;
    except
    end;

    try
      Post;
      AfterScroll:=Aux;
      CarregaDados;
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TSubmodulo.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoSML.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
end;

{ Localiza um cliente }
function TSubmodulo.LocalizarCod(CDSML:Integer):Boolean;
begin
  If (CDSML<>CodigoSML) Then
    If locate('SML_CODIGO', CDSML, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;


function TSubmodulo.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('MDL_descricao',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TSubmodulo.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TSubmodulo.PreparaInsercao;
begin
  ProximoCodigo('SML_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TSubmodulo.deletarauto:Boolean;
var
  CdCNC, CdSML:integer;
begin
  Result:=False;
  try
    CdCNC := CodigoCNC;
    CdSML := CodigoSML;
    if Delete then
    Begin
      result:=true;
      GeraLog(1630,CdCNC,CdSML,'42');
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
