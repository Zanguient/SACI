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
unit Verificar_Mercadoria;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Funcoes, Variants;

type
  TVerificar_Mercadoria = class(TSQuery)
    private
      { Private fields of TVerificar_Mercadoria }
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EPedido }
        FEPedido : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ETipo }
        FETipo : TEdit;
        { Storage for property EVolume }
        FEVolume : TEdit;
        { Storage for property Pedido }
        FPedido : Integer;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property Volume }
        FVolume : Integer;

      { Private methods of TVerificar_Mercadoria }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property Pedido }
        function GetPedido : Integer;
        { Write method for property Pedido }
        procedure SetPedido(Value : Integer);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);
        { Read method for property Volume }
        function GetVolume : Integer;
        { Write method for property Volume }
        procedure SetVolume(Value : Integer);

    protected
      { Protected fields of TVerificar_Mercadoria }

      { Protected methods of TVerificar_Mercadoria }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TVerificar_Mercadoria }

      { Public methods of TVerificar_Mercadoria }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCod(CdCNC, PTipo, PPedido, CdPRD: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TVerificar_Mercadoria }
        { Código do produto }
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EPedido : TEdit read FEPedido write FEPedido;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ETipo : TEdit read FETipo write FETipo;
        property EVolume : TEdit read FEVolume write FEVolume;
        property Pedido : Integer read GetPedido write SetPedido;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Tipo : Integer read GetTipo write SetTipo;
        property Volume : Integer read GetVolume write SetVolume;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TVerificar_Mercadoria with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TVerificar_Mercadoria]);
end;

{ Method to set variable and property values and create objects }
procedure TVerificar_Mercadoria.AutoInitialize;
begin
     FECodigoPRD := nil;
     FEPedido := nil;
     FEQuantidade := nil;
     FETipo := nil;
     FEVolume := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TVerificar_Mercadoria.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEPedido then
        FEPedido := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FEVolume then
        FEVolume := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TVerificar_Mercadoria.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoPRD }
function TVerificar_Mercadoria.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property CodigoPRD }
procedure TVerificar_Mercadoria.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property Pedido }
function TVerificar_Mercadoria.GetPedido : Integer;
begin
  try
    Result := Self.fieldByName('VER_PEDIDO').asInteger;
  except
    Result:= 0;
  end;
end;

{ Write method for property Pedido }
procedure TVerificar_Mercadoria.SetPedido(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('VER_PEDIDO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "VER_PEDIDO"!');
    end;
end;

{ Read method for property Quantidade }
function TVerificar_Mercadoria.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('VER_QUANTIDADE').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Quantidade }
procedure TVerificar_Mercadoria.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('VER_QUANTIDADE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "VER_QUANTIDADE"!');
  end;
end;

{ Read method for property Tipo }
function TVerificar_Mercadoria.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('VER_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Tipo }
procedure TVerificar_Mercadoria.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('VER_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "VER_TIPO"!');
    end;
end;

{ Read method for property Volume }
function TVerificar_Mercadoria.GetVolume : Integer;
begin
  try
    Result := Self.fieldByName('VER_VOLUME').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Volume }
procedure TVerificar_Mercadoria.SetVolume(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('VER_VOLUME').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "VER_VOLUME"!');
    end;
end;

function TVerificar_Mercadoria.AlterarAuto:Boolean;
begin
  result:=false;
  try
    Edit;
    try
       Quantidade := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      Post;
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TVerificar_Mercadoria.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled      := not Habilitar;
  Except
  End;
  Try
    if Estado = 1 then
      ECodigoPRD.Enabled   := Habilitar
    else
      ECodigoPRD.Enabled   := False;
  Except
  End;
  Try
    EQuantidade.Enabled    := Habilitar;
  Except
  End;
end;

procedure TVerificar_Mercadoria.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TVerificar_Mercadoria.CarregaDados;
begin
  Try
    ECodigoPRD.Text       :=IntToStr(CodigoPRD);
  Except
  End;
  Try
    EQuantidade.Text           :=Format('%.2f', [Quantidade]);
  Except
  End;
  Try
    EVolume.Text            :=IntToStr(Volume);
  Except
  End;
end;

constructor TVerificar_Mercadoria.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'VERIFICAR_MERCADORIA';

     { Code to perform other tasks when the component is created }

end;

destructor TVerificar_Mercadoria.Destroy;
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

function TVerificar_Mercadoria.FinalizaEdicao:Boolean;
var
  cdcnc, CdPRD:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoPRD.text) then
    mensagem:= mensagem + 'Código do Produto inválido!';
  if not VerificaFloatBranco(EQuantidade.text) then
    mensagem:= mensagem + 'Quantidade digitada incorretamente!';
  If mensagem <>'' Then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      CdPRD := StrToInt(ECodigoPRD.Text);
      CdCNC := CConfiguracao.CodigoCNC;
      If Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(CdCNC, StrToInt(ETipo.Text),StrToInt(EPedido.Text),CdPRD);
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    else If Estado=2 then
    Begin
      CdPRD := CodigoPRD;
      CdCNC := CodigoCNC;
      If AlterarAuto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(CdCNC, StrToInt(ETipo.Text),StrToInt(EPedido.Text),CdPRD);
        Estado:=0;
        AtualizaControles(False);
      end;
    End;    
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

function TVerificar_Mercadoria.InserirAuto:Boolean;
begin
  result:=false;
  try
    append;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      Pedido := StrToInt(EPedido.Text);
    except
    end;
    try
       CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       Tipo := StrToInt(ETipo.Text);
    except
    end;
    try
       Quantidade := StrToFloat(EQuantidade.Text);
    except
    end;
    try
       Volume := StrToInt(EVolume.Text);
    except
    end;
    try
      Post;
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TVerificar_Mercadoria.LimpaCampos;
begin
  Try
    ECodigoPRD.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EQuantidade.Clear
    else
      EQuantidade.Text := '1';
  Except
  End;
  Try
    if Estado <> 1 then
      EVolume.Clear
    else
      EVolume.Text := '1';
  Except
  End;
end;

function TVerificar_Mercadoria.LocalizarCod(CdCNC, PTipo, PPedido, CdPRD: Integer): Boolean;
begin
  If (CdCNC<>CodigoCNC) or
     (PTipo<>Tipo) or
     (PPedido<>Pedido) or
     (CdPRD<>CodigoPRD) then
    If locate('CNC_CODIGO; VER_TIPO; VER_PEDIDO; PRD_CODIGO', vararrayof([CdCNC, PTipo, PPedido, CdPRD]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TVerificar_Mercadoria.PreparaAlteracao;
begin
  Estado := 2;
  AtualizaControles(True);
end;

procedure TVerificar_Mercadoria.PreparaInsercao;
begin
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
