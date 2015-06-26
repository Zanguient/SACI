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
unit TipoParam;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Variants;

type
  TTipoParam = class(TSQuery)
    private
      { Private fields of TTipoParam }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoTPR }
        FCodigoTPR : Integer;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoTPR }
        FECodigoTPR : TEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;

      { Private methods of TTipoParam }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoTPR }
        function GetCodigoTPR : Integer;
        { Write method for property CodigoTPR }
        procedure SetCodigoTPR(Value : Integer);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);

    protected
      { Protected fields of TTipoParam }

      { Protected methods of TTipoParam }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TTipoParam }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TTipoParam }
        { Altera um Tipo de parametro }
        function Alterar(CdTPR: integer; PDescricao: String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdTPR:Integer);
        destructor Destroy; override;
        procedure FinalizaEdicao;
        { Insere um Tipo de parametro }
        function Inserir(CdTPR: integer; PDescricao: String):boolean;
        function InserirAuto:Boolean;
        { Localiza um Tipo de Parametro }
        function LocalizarCod(CdTPR:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TTipoParam }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Tipo de Parametro }
        property CodigoTPR : Integer read GetCodigoTPR write SetCodigoTPR;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoTPR : TEdit read FECodigoTPR write FECodigoTPR;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTipoParam with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTipoParam]);
end;

{ Method to set variable and property values and create objects }
procedure TTipoParam.AutoInitialize;
begin
     Estado := 0;
     FECodigoTPR := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TTipoParam.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoTPR then
        FECodigoTPR := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TTipoParam.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TTipoParam.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TTipoParam.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoTPR }
function TTipoParam.GetCodigoTPR : Integer;
begin
  try
    Result := Self.fieldByName('TPR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTPR }
procedure TTipoParam.SetCodigoTPR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPR_CODIGO"!');
    end;
end;

{ Read method for property Descricao }
function TTipoParam.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('TPR_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TTipoParam.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TPR_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TPR_DESCRICAO"!');
  end;
end;

{ Altera um Tipo de parametro }
function TTipoParam.Alterar(CdTPR: integer; PDescricao: String):boolean;
begin
  result:=false;
  If not(localizarCod(CdTPR)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      Descricao      := PDescricao;
      try
        Post;
        result:=true;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TTipoParam.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
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
        Result:=False;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      Result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
end;

procedure TTipoParam.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 Try
   EDbgrid.Enabled           :=not Habilitar;
 except
 end;
 try
   EDescricao.Enabled     :=Habilitar;
   except
 end;
end;

procedure TTipoParam.CancelaEdicao;
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

procedure TTipoParam.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 try
   ECodigoTPR.Text           :=IntToStr(CodigoTPR);
   except
 end;
 try
   EDescricao.Text           :=Descricao;
   except
 end;
end;

constructor TTipoParam.Create(AOwner: TComponent);
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

procedure TTipoParam.Deletar(CdTPR:Integer);
begin  
  If not(localizarCod(CdTPR)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if tQuery(Self).isEmpty then
      begin
        try
          ECodigoTPR.Clear;
          except
        end;
        try
          EDescricao.Clear;
          except
        end;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TTipoParam.Destroy;
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

procedure TTipoParam.FinalizaEdicao;
var
  cod :Integer;
begin
  If Estado=1 then
  Begin
    Inserirauto;
    close;
    open;
    LocalizarCod(SCodigo);
  End;

  If Estado=2 then
  Begin
    cod:=codigoTPR;
    Alterarauto;
    close;
    open;
    LocalizarCod(cod);
  End;

  AtualizaControles(False);
  Estado:=0;
end;

{ Insere um Tipo de parametro }
function TTipoParam.Inserir(CdTPR: integer; PDescricao: String):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdTPR=0 then
    Cod    := ProximoCodigo('TPR_CODIGO')
  else
    Cod    := CdTPR;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    Insert;
    try
      CodigoTPR      := Cod;
      CodigoCNC      := CConfiguracao.CodigoCNC;
      Descricao      := PDescricao;
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

function TTipoParam.InserirAuto:Boolean;
Var
  Aux:TDataSetNotifyEvent;
begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        CodigoTPR   := SCodigo;
      except
      end;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
         Descricao  := EDescricao.Text;
      except
      end;
      try
        Post;
        AfterScroll:=aux;
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

{ Localiza um Tipo de Parametro }
function TTipoParam.LocalizarCod(CdTPR:Integer):Boolean;
begin
  If (CdTPR<>CodigoTPR)  Then
    If locate('TPR_CODIGO', CdTPR, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TTipoParam.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('TPR_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TTipoParam.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TTipoParam.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
ProximoCodigo('TPR_CODIGO');
 try
   EDescricao.Clear;
   except
 end;
  AtualizaControles(True);
  Estado:=1;
end;

function TTipoParam.deletarauto:Boolean;
var
  CdCNC, CdTPR: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdTPR := CodigoTPR;
    if Delete then
    Begin
      result:=true;
      GeraLog(1750,CdCNC,CdTPR);
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
