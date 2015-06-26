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
unit Secao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Dbctrls, Funcoes, Variants;

type
  TSecao = class(TSQuery)
    private
      { Private fields of TSecao }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoSecao }
        FCodigoSecao : Integer;
        { Storage for property Comissao }
        FComissao : Double;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoSecao }
        FECodigoSecao : TEdit;
        { Storage for property EComissao }
        FEComissao : TEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;

      { Private methods of TSecao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoSecao }
        function GetCodigoSecao : Integer;
        { Write method for property CodigoSecao }
        procedure SetCodigoSecao(Value : Integer);
        { Read method for property Comissao }
        function GetComissao : Double;
        { Write method for property Comissao }
        procedure SetComissao(Value : Double);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);

    protected
      { Protected fields of TSecao }

      { Protected methods of TSecao }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TSecao }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TSecao }
        { Altera um Contato }
        function Alterar(CdCNC,CdCod:Integer;PDescricao:String;PComissao:Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdSecao:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Contato }
        function Inserir(CdCNC,CdSecao:Integer;PDescricao:String;PComissao:Double):boolean;
        function InserirAuto:Boolean;
        { Localiza um contato }
        function LocalizarCod(CDSecao,CDCNC:Integer):Boolean;
        function LocalizarNome(PDesc:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TSecao }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Contato }
        property CodigoSecao : Integer
             read GetCodigoSecao write SetCodigoSecao;
        property Comissao : Double read GetComissao write SetComissao;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoSecao : TEdit read FECodigoSecao write FECodigoSecao;
        property EComissao : TEdit read FEComissao write FEComissao;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TSecao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TSecao]);
end;

{ Method to set variable and property values and create objects }
procedure TSecao.AutoInitialize;
begin
     Estado := 0;
     FECodigoSecao := nil;
     FEComissao := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TSecao.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoSecao then
        FECodigoSecao := nil;
     if AComponent = FEComissao then
        FEComissao := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TSecao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TSecao.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TSecao.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoSecao }
function TSecao.GetCodigoSecao : Integer;
begin
  try
    Result := Self.fieldByName('SEC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoSecao }
procedure TSecao.SetCodigoSecao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SEC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SEC_CODIGO"!');
    end;
end;

{ Read method for property Comissao }
function TSecao.GetComissao : Double;
begin
  try
    Result := Self.fieldByName('SEC_COMISSAO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Comissao }
procedure TSecao.SetComissao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SEC_COMISSAO').asfloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SEC_COMISSAO"!');
  end;
end;

{ Read method for property Descricao }
function TSecao.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('SEC_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TSecao.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SEC_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SEC_DESCRICAO"!');
  end;
end;

{ Altera um Contato }
function TSecao.Alterar(CdCNC,CdCod:Integer;PDescricao:String;PComissao:Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdCod,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      Descricao      := PDescricao;
      Comissao       := PComissao;

      try
        Post;
        result := true;
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

function TSecao.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    edit;
    try
       Descricao := EDescricao.Text;
    except
    end;
    try
       Comissao  := StrToFloat(EComissao.Text);
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

procedure TSecao.AtualizaControles(Habilitar:Boolean);
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
   EDescricao.Enabled        :=Habilitar;
 except
 end;
 try
   EComissao.Enabled         :=Habilitar;
 except
 end;
end;

procedure TSecao.CancelaEdicao;
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

procedure TSecao.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 try
   ECodigoSecao.Text         :=IntToStr(CodigoSecao);
   except
 end;
 try
   EDescricao.Text           :=Descricao;
   except
 end;
 try
   EComissao.Text            :=Format('%.2f', [Comissao]);
   except
 end;
end;

constructor TSecao.Create(AOwner: TComponent);
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

function TSecao.Deletar(CdCNC,CdSecao:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdSecao,CdCNC)) Then    
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
          try
            ECodigoSecao.Clear;
            except
          end;
          try
            EDescricao.Clear;
            except
          end;
          try
            EComissao.Clear;
            except
          end;
        end;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TSecao.Destroy;
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

function TSecao.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cdSecao, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  if EComissao.Text = '' then
    EComissao.Text := '0';
  mensagem:='';
  If not Verificafloat(EComissao.text) Then
    mensagem:=mensagem+'Comissão digitada incorretamente!';
  If EDescricao.text = '' Then
    mensagem:=mensagem+'Descrição digitada incorretamente!';
  If mensagem <>'' Then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cdSecao:=codigoSecao;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cdSecao, cdcnc);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=aux;
    CarregaDados;
  end;
end;

{ Insere um Contato }
function TSecao.Inserir(CdCNC,CdSecao:Integer;PDescricao:String;PComissao:Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod: Integer;
begin
  if CdSecao=0 then
    Cod    := ProximoCodigo('SEC_CODIGO')
  else
    Cod    := CdSecao;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
     if Estado=3 then
     begin
       result:=true;
       exit;
     end;
     Insert;
     try
       CodigoSecao    := Cod;
       CodigoCNC      := CdCNC;
       Descricao      := PDescricao;
       Comissao       := PComissao;

       try
         Post;
         result := true;
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

function TSecao.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
begin
  try
    append;
    try
      CodigoSecao   := SCodigo;
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
       Comissao := StrToFloat(EComissao.Text);
    except
    end;
    try
      Post;
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

{ Localiza um contato }
function TSecao.LocalizarCod(CDSecao,CDCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDSecao<>CodigoSecao) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;SEC_CODIGO', vararrayof([CDCNC, CDSecao]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TSecao.LocalizarNome(PDesc:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Descricao<>PDesc Then
    If locate('SEC_DESCRICAO',PDesc, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TSecao.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TSecao.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
ProximoCodigo('SEC_CODIGO');
  try
   EDescricao.Clear;
   except
 end;
 try
   EComissao.Clear;
   except
 end;
  Estado:=1;
  AtualizaControles(True);
end;

function TSecao.deletarauto:Boolean;
begin
  try
    if Delete then
    Begin
      result:= true;
      GeraLog(110,CodigoCNC,CodigoSecao,'8');
    end
    else
      Result := False;
  Except
    result := false;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
