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
unit AplicFin;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Agencia, Banco, Configuracao, Dbgrids, Funcoes, 
     Variants;

type
  TAplicFin = class(TSQuery)
    private
      { Private fields of TAplicFin }
        { Storage for property CAgencia }
        FCAgencia : TAgencia;
        { Storage for property CBanco }
        FCBanco : TBanco;
        { Storage for property CodigoAPF }
        FCodigoAPF : Integer;
        { Storage for property CodigoAgencia }
        FCodigoAgencia : Integer;
        { Storage for property CodigoBanco }
        FCodigoBanco : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property ECodigoAPF }
        FECodigoAPF : TEdit;
        { Storage for property ECodigoAgencia }
        FECodigoAgencia : TDBLookupComboBox;
        { Storage for property ECodigoBanco }
        FECodigoBanco : TDBLookupComboBox;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EObservacao }
        FEObservacao : TMemo;
        { Storage for property ESaldo }
        FESaldo : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Saldo }
        FSaldo : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TAplicFin }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoAPF }
        function GetCodigoAPF : Integer;
        { Write method for property CodigoAPF }
        procedure SetCodigoAPF(Value : Integer);
        { Read method for property CodigoAgencia }
        function GetCodigoAgencia : Integer;
        { Write method for property CodigoAgencia }
        procedure SetCodigoAgencia(Value : Integer);
        { Read method for property CodigoBanco }
        function GetCodigoBanco : Integer;
        { Write method for property CodigoBanco }
        procedure SetCodigoBanco(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Saldo }
        function GetSaldo : Double;
        { Write method for property Saldo }
        procedure SetSaldo(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TAplicFin }

      { Protected methods of TAplicFin }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;
        procedure Loaded; override;

    public
      { Public fields and properties of TAplicFin }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TAplicFin }
        { Altera um Cliente }
        function Alterar(CdCNC,CDAPF,CdAge,CdBanco,Psituacao: integer;PObservacao:String;PSaldo:Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC,CDAPF:Integer);
        destructor Destroy; override;
        procedure FinalizaEdicao;
        { Insere um Cliente }
        function Inserir(CdCNC,CdAge,CdBanco, CdAPF,PSituacao: integer;PObservacao:String;PSaldo:double):boolean;
        function InserirAuto:Boolean;
        { Localiza um cliente }
        function LocalizarCod(CDAPF,CDCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TAplicFin }
        property CAgencia : TAgencia read FCAgencia write FCAgencia;
        property CBanco : TBanco read FCBanco write FCBanco;
        { Código da conta }
        property CodigoAPF : Integer read GetCodigoAPF write SetCodigoAPF;
        property CodigoAgencia : Integer
             read GetCodigoAgencia write SetCodigoAgencia;
        property CodigoBanco : Integer
             read GetCodigoBanco write SetCodigoBanco;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property ECodigoAPF : TEdit read FECodigoAPF write FECodigoAPF;
        property ECodigoAgencia : TDBLookupComboBox
             read FECodigoAgencia write FECodigoAgencia;
        property ECodigoBanco : TDBLookupComboBox
             read FECodigoBanco write FECodigoBanco;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EObservacao : TMemo read FEObservacao write FEObservacao;
        property ESaldo : TEdit read FESaldo write FESaldo;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Observacao : String read GetObservacao write SetObservacao;
        property Saldo : Double read GetSaldo write SetSaldo;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TAplicFin with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TAplicFin]);
end;

{ Method to set variable and property values and create objects }
procedure TAplicFin.AutoInitialize;
begin
     Estado := 0;
     FECodigoAPF := nil;
     FECodigoAgencia := nil;
     FECodigoBanco := nil;
     FEDbgrid := nil;
     FEObservacao := nil;
     FESaldo := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TAplicFin.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoAPF then
        FECodigoAPF := nil;
     if AComponent = FECodigoAgencia then
        FECodigoAgencia := nil;
     if AComponent = FECodigoBanco then
        FECodigoBanco := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FESaldo then
        FESaldo := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TAplicFin.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoAPF }
function TAplicFin.GetCodigoAPF : Integer;
begin
  try
    Result := Self.fieldByName('APF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoAPF }
procedure TAplicFin.SetCodigoAPF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('APF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "APF_CODIGO"!');
    end;
end;

{ Read method for property CodigoAgencia }
function TAplicFin.GetCodigoAgencia : Integer;
begin
  try
    Result := Self.fieldByName('AGN_NUMERO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoAgencia }
procedure TAplicFin.SetCodigoAgencia(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGN_NUMERO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGN_NUMERO"!');
    end;
end;

{ Read method for property CodigoBanco }
function TAplicFin.GetCodigoBanco : Integer;
begin
  try
    Result := Self.fieldByName('BNC_NUMERO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property CodigoBanco }
procedure TAplicFin.SetCodigoBanco(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BNC_NUMERO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BNC_NUMERO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TAplicFin.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TAplicFin.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property Observacao }
function TAplicFin.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('APF_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Observacao }
procedure TAplicFin.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('APF_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "APF_OBSERVACAO"!');
    end;
end;

{ Read method for property Saldo }
function TAplicFin.GetSaldo : Double;
begin
  try
    Result := Self.fieldByName('APF_SALDO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Saldo }
procedure TAplicFin.SetSaldo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('APF_SALDO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "APF_SALDO"!');
    end;
end;

{ Read method for property Situacao }
function TAplicFin.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('APF_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TAplicFin.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('APF_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "APF_SITUACAO"!');
    end;
end;

{ Altera um Cliente }
function TAplicFin.Alterar(CdCNC,CDAPF,CdAge,CdBanco,Psituacao: integer;PObservacao:String;PSaldo:Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result := true;
  If not(localizarCod(CdAPF,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoAgencia  := CdAge;
      CodigoBanco    := CdBanco;
      Saldo          := PSaldo;
      Situacao       := PSituacao;
      Observacao     := PObservacao;

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

function TAplicFin.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      try
         CodigoAgencia := ECodigoAgencia.ListSource.DataSet.FieldByName(ECodigoAgencia.KeyField).
        asInteger;
      except
      end;
      try
         CodigoBanco := ECodigoBanco.ListSource.DataSet.FieldByName(ECodigoBanco.KeyField).
        asInteger;
      except
      end;
      try
         Situacao := StrToInt(ESituacao.text);
      except
      end;
      try
         Saldo := StrToFloat(ESaldo.text);
      except
      end;
      try
         CodigoAgencia := ECodigoAgencia.KeyValue;
      except
      end;

      try
        Post;
        Result:=True;

      except
        Result:=False;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      Result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
end;

procedure TAplicFin.AtualizaControles(Habilitar:Boolean);
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
 Try
   ECodigoBanco.Enabled      :=not Habilitar;
    except
 end;
 try
   ECodigoAgencia.Enabled    :=not Habilitar;
    except
 end;
 try
   ESaldo.Enabled            :=Habilitar;
    except
 end;
 try
   ESituacao.Enabled         :=Habilitar;
    except
 end;
 try
   EObservacao.Enabled       :=Habilitar;
    except
 end;

end;

procedure TAplicFin.CancelaEdicao;
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

procedure TAplicFin.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 Try
   ECodigoAPF.Text           :=IntToStr(CodigoAPF);
    except
 end;
 try
   ESaldo.Text               :=Format('%.2f', [Saldo]);
    except
 end;
 try
   ESituacao.text            :=IntToStr(Situacao);
    except
 end;
 try
   EObservacao.Text          :=Observacao;
    except
 end;

end;

constructor TAplicFin.Create(AOwner: TComponent);
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

procedure TAplicFin.Deletar(CdCNC,CDAPF:Integer);
begin
  If not(localizarCod(CdAPF,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if TQuery(Self).IsEmpty then
      begin
        Try
          ECodigoAPF.Clear;
        except
        end;
        Try
          ECodigoAgencia.KeyValue := 0;
        except
        end;
        Try
          ECodigoBanco.KeyValue := 0;
        except
        end;
        try
          ESaldo.Clear;
        except
        end;
        try
          ESituacao.Clear;
        except
        end;
        try
          EObservacao.Clear;
        except
        end;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TAplicFin.Destroy;
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

procedure TAplicFin.FinalizaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
var
  mensagem: String;
  cdAPF, cdcnc:Integer;
begin
  mensagem:='';
  If not Verificafloat(ESaldo.text) Then
    mensagem:=mensagem+'O Saldo não foi digitado corretamente !';
  If mensagem <>'' Then
    raise Exception.Create(mensagem);
  If Estado=1 then
  Begin
    Inserirauto;
    close;
    open;
    LocalizarCod(SCodigo, CodigoCNC);
  End;

  If Estado=2 then
  Begin
    cdAPF:=codigoAPF;
    cdcnc:=codigoCnc;
    Alterarauto;
    close;
    open;
    LocalizarCod(cdAPF, cdcnc);
  End;

  AtualizaControles(False);
  Estado:=0;
end;

{ Insere um Cliente }
function TAplicFin.Inserir(CdCNC,CdAge,CdBanco, CdAPF,PSituacao: integer;PObservacao:String;PSaldo:double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdAPF=0 then
    Cod    := ProximoCodigo('APF_CODIGO')
  else
    Cod    := CdAPF;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
   result:=true;
      try
         Insert;
         CodigoAPF      := Cod;
         CodigoCNC      := CdCNC;
         CodigoAgencia  := CdAge;
         CodigoBanco    := CdBanco;
         Saldo          := PSaldo;
         Situacao       := PSituacao;
         Observacao     := PObservacao;

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

function TAplicFin.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Aux:TDataSetNotifyEvent;
begin
  If (localizarCod(SCodigo,CodigoCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false;
  end
  Else
  begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        CodigoAPF   := SCodigo;
      except
      end;
      try
        CodigoAgencia :=  ECodigoAgencia.ListSource.DataSet.FieldByName(ECodigoAgencia.KeyField).
        asInteger;
      except
      end;
      try
        CodigoBanco := ECodigoBanco.ListSource.DataSet.FieldByName(ECodigoBanco.KeyField).
        asInteger;
      except
      end;
      try
        CodigoCNC      := CConfiguracao.CodigoCNC;
      except
      end;
      try
        Saldo      := StrToFloat(ESaldo.Text);
      except
      end;
      try
        Situacao   := StrToInt(ESituacao.Text);
      except
      end;
      try
        Observacao := EObservacao.Text;
      except
      end;

      try
        Post;
        afterscroll:=aux;
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
end;

procedure TAplicFin.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }
  Filtered:=False;
end;

{ Localiza um cliente }
function TAplicFin.LocalizarCod(CDAPF,CDCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDAPF<>CodigoAPF) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;APF_CODIGO', vararrayof([CDCNC, CDAPF]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TAplicFin.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TAplicFin.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('APF_CODIGO');
    try
     ESaldo.Clear;
      except
    end;
    try
     ESituacao.Clear;
      except
    end;
    try
     EObservacao.Clear;
      except
    end;

  AtualizaControles(True);
  Estado:=1;
end;

function TAplicFin.deletarauto:Boolean;
var
  CdCNC, CdAPF: integer;
begin
  try
    CdCNC := CodigoCNC;
    CdAPF := CodigoAPF;
    if Delete then
    Begin
      result:=true;
      GeraLog(710,CdCNC,CdAPF,'21');
      if TQuery(Self).IsEmpty then
      begin
          Try
            ECodigoAPF.Clear;
          except
          end;
          Try
            ECodigoAgencia.KeyValue := 0;
          except
          end;
          Try
            ECodigoBanco.KeyValue := 0;
          except
          end;
          try
            ESaldo.Clear;
          except
          end;
          try
            ESituacao.Clear;
          except
          end;
          try
            EObservacao.Clear;
          except
          end;
      end;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
