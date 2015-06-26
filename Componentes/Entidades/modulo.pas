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
unit Modulo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Variants;

type
  TModulo = class(TSQuery)
    private
      { Private fields of TModulo }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoMDL }
        FCodigoMDL : Integer;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoMDL }
        FECodigoMDL : TEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;

      { Private methods of TModulo }
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
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);

    protected
      { Protected fields of TModulo }

      { Protected methods of TModulo }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TModulo }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TModulo }
        { Altera um Beneficiário }
        function Alterar(CdMDL: integer; Descricao:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CDMDL:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdMDL: integer; EDescricao:String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CDMDL:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TModulo }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoMDL : Integer read GetCodigoMDL write SetCodigoMDL;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoMDL : TEdit read FECodigoMDL write FECodigoMDL;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TModulo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TModulo]);
end;

{ Method to set variable and property values and create objects }
procedure TModulo.AutoInitialize;
begin
     Estado := 0;
     FECodigoMDL := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TModulo.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoMDL then
        FECodigoMDL := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TModulo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TModulo.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TModulo.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoMDL }
function TModulo.GetCodigoMDL : Integer;
begin
  try
    result := Self.fieldByName('MDL_CODIGO').asInteger;
  except
    result := 0;
  end;
end;

{ Write method for property CodigoMDL }
procedure TModulo.SetCodigoMDL(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MDL_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MDL_CODIGO"!');
    end;
end;

{ Read method for property Descricao }
function TModulo.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('MDL_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TModulo.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MDL_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MDL_DESCRICAO"!');
  end;
end;

{ Altera um Beneficiário }
function TModulo.Alterar(CdMDL: integer; Descricao:String):boolean;
begin
  result := false;
  If not(localizarCod(CdMDL)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
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

function TModulo.AlterarAuto:Boolean;
begin
  Result:=false;
  try
    edit;
    try
      Descricao  := EDescricao.Text;
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

procedure TModulo.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    //Somente para Modulo e SubModulo
    ECodigoMDL.Enabled     :=Habilitar;
  except
  end;
  Try
    EDescricao.Enabled     :=Habilitar;
  except
  end;
end;

procedure TModulo.CancelaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(False);
  Estado:=0;
  CarregaDados;
end;

procedure TModulo.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 Try
   ECodigoMDL.Text        := IntToStr(CodigoMDL);
   except
 end;
 try
   EDescricao.Text        := Descricao;
   except
 end;

end;

constructor TModulo.Create(AOwner: TComponent);
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

function TModulo.Deletar(CDMDL:Integer):Boolean;
var
  CdCNC : integer;
begin
  Result := False;
  If not(localizarCod(CdMDL)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      if Delete then
      Begin
        Result := True;
        GeraLog(1550,CdCNC,CdMDL,'40');
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TModulo.Destroy;
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

function TModulo.FinalizaEdicao:Boolean;
var
  cod:Integer;
begin
  Result := False;;
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
  End;

  If Estado=2 then
  Begin
    cod:=codigoMDL;
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
function TModulo.Inserir(CdCNC,CdMDL: integer; EDescricao:String):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdMDL=0 then
    Cod    := ProximoCodigo('MDL_CODIGO')
  else
    Cod    := CdMDL;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    Insert;
    try
      CodigoMDL        :=Cod;
      CodigoCNC        := CdCNC;
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

function TModulo.InserirAuto:Boolean;
Var
  Aux:TDataSetNotifyEvent;
begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        CodigoMDL   := SCodigo;
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
        Post;
        AfterScroll:=Aux;
        CarregaDados;
        result:=True;

      except
        result:=False;
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
end;

procedure TModulo.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoMDL.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
end;

{ Localiza um cliente }
function TModulo.LocalizarCod(CDMDL:Integer):Boolean;
begin
  If (CDMDL<>CodigoMDL) Then
    If locate('MDL_CODIGO', CDMDL, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;


function TModulo.LocalizarNome(Nome:String):Boolean;
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

procedure TModulo.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TModulo.PreparaInsercao;
begin
  ProximoCodigo('MDL_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TModulo.deletarauto:Boolean;
var
  CdCNC, CdMDL:integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdMDL := CodigoMDL;
    if Delete then
    Begin
      result:=true;
      GeraLog(1550,CdCNC,CdMDL,'40');
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
