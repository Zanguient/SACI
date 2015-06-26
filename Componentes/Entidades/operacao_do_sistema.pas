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
unit Operacao_do_Sistema;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Variants;

type
  TOperacao_do_Sistema = class(TSQuery)
    private
      { Private fields of TOperacao_do_Sistema }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoOPS }
        FCodigoOPS : Integer;
        { Storage for property Componente }
        FComponente : String;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoOPS }
        FECodigoOPS : TEdit;
        { Storage for property EComponente }
        FEComponente : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EModulo }
        FEModulo : TDBLookupComboBox;
        { Storage for property EOperacao }
        FEOperacao : TEdit;
        { Storage for property ESubmodulo }
        FESubmodulo : TDBLookupComboBox;
        { Storage for property Modulo }
        FModulo : Integer;
        { Storage for property Operacao }
        FOperacao : String;
        { Storage for property Submodulo }
        FSubmodulo : Integer;

      { Private methods of TOperacao_do_Sistema }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoOPS }
        function GetCodigoOPS : Integer;
        { Write method for property CodigoOPS }
        procedure SetCodigoOPS(Value : Integer);
        { Read method for property Componente }
        function GetComponente : String;
        { Write method for property Componente }
        procedure SetComponente(Value : String);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Modulo }
        function GetModulo : Integer;
        { Write method for property Modulo }
        procedure SetModulo(Value : Integer);
        { Read method for property Operacao }
        function GetOperacao : String;
        { Write method for property Operacao }
        procedure SetOperacao(Value : String);
        { Read method for property Submodulo }
        function GetSubmodulo : Integer;
        { Write method for property Submodulo }
        procedure SetSubmodulo(Value : Integer);

    protected
      { Protected fields of TOperacao_do_Sistema }

      { Protected methods of TOperacao_do_Sistema }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TOperacao_do_Sistema }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TOperacao_do_Sistema }
        { Altera uma operação do sistema }
        function Alterar(CdCNC, CdOPS,PModulo,PSubModulo: integer; DT_Alterado:TDateTime;POperacao,PComponente:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdOPS:Integer);
        destructor Destroy; override;
        function FinalizaEdicao:boolean;
        { Insere uma operação do sistema }
        function Inserir(CdCNC, CdOPS,PModulo,PSubModulo: integer; DT_Cadastro:TDateTime;POperacao,PComponente:String):boolean;
        function InserirAuto:Boolean;
        { Localiza uma operação do sistema }
        function LocalizarCod(CdOPS: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TOperacao_do_Sistema }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código da Operação do Sistema }
        property CodigoOPS : Integer read GetCodigoOPS write SetCodigoOPS;
        property Componente : String read GetComponente write SetComponente;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoOPS : TEdit read FECodigoOPS write FECodigoOPS;
        property EComponente : TEdit read FEComponente write FEComponente;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EModulo : TDBLookupComboBox read FEModulo write FEModulo;
        property EOperacao : TEdit read FEOperacao write FEOperacao;
        property ESubmodulo : TDBLookupComboBox
             read FESubmodulo write FESubmodulo;
        property Modulo : Integer read GetModulo write SetModulo;
        property Operacao : String read GetOperacao write SetOperacao;
        property Submodulo : Integer read GetSubmodulo write SetSubmodulo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TOperacao_do_Sistema with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TOperacao_do_Sistema]);
end;

{ Method to set variable and property values and create objects }
procedure TOperacao_do_Sistema.AutoInitialize;
begin
     Estado := 0;
     FECodigoOPS := nil;
     FEComponente := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEModulo := nil;
     FEOperacao := nil;
     FESubmodulo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TOperacao_do_Sistema.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoOPS then
        FECodigoOPS := nil;
     if AComponent = FEComponente then
        FEComponente := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEModulo then
        FEModulo := nil;
     if AComponent = FEOperacao then
        FEOperacao := nil;
     if AComponent = FESubmodulo then
        FESubmodulo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TOperacao_do_Sistema.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TOperacao_do_Sistema.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TOperacao_do_Sistema.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoOPS }
function TOperacao_do_Sistema.GetCodigoOPS : Integer;
begin
  try
    Result := Self.fieldByName('OPS_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoOPS }
procedure TOperacao_do_Sistema.SetCodigoOPS(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('OPS_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "OPS_CODIGO"!');
    end;
end;

{ Read method for property Componente }
function TOperacao_do_Sistema.GetComponente : String;
begin
  try
    Result := Self.fieldByName('OPS_COMPONENTE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Componente }
procedure TOperacao_do_Sistema.SetComponente(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('OPS_COMPONENTE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "OPS_COMPONENTE"!');
  end;
end;

{ Read method for property DataAlterado }
function TOperacao_do_Sistema.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('OPS_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TOperacao_do_Sistema.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('OPS_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "OPS_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TOperacao_do_Sistema.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('OPS_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TOperacao_do_Sistema.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('OPS_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "OPS_DT_CADASTRO"!');
  end;
end;

{ Read method for property Modulo }
function TOperacao_do_Sistema.GetModulo : Integer;
begin
  try
    result := Self.fieldByName('MDL_CODIGO').asInteger;
  except
    result := 0;
  end;
end;

{ Write method for property Modulo }
procedure TOperacao_do_Sistema.SetModulo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MDL_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MDL_CODIGO"!');
    end;
end;

{ Read method for property Operacao }
function TOperacao_do_Sistema.GetOperacao : String;
begin
  try
    Result := Self.fieldByName('OPS_OPERACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Operacao }
procedure TOperacao_do_Sistema.SetOperacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('OPS_OPERACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "OPS_OPERACAO"!');
  end;
end;

{ Read method for property Submodulo }
function TOperacao_do_Sistema.GetSubmodulo : Integer;
begin
  try
    Result := Self.fieldByName('SML_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Submodulo }
procedure TOperacao_do_Sistema.SetSubmodulo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SML_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SML_CODIGO"!');
  end;
end;

{ Altera uma operação do sistema }
function TOperacao_do_Sistema.Alterar(CdCNC, CdOPS,PModulo,PSubModulo: integer; DT_Alterado:TDateTime;POperacao,PComponente:String):boolean;
begin
  result := true;
  If not(localizarCod(CdOPS)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoOPS      := CdOPS;
      Modulo         := PModulo;
      SubModulo      := PSubModulo;
      Operacao       := POperacao;
      DataAlterado   := DT_Alterado;
      Componente     := PComponente;

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

function TOperacao_do_Sistema.AlterarAuto:Boolean;
begin
    try
      edit;
      try
         Modulo := EModulo.ListSource.Dataset.FieldByName(EModulo.KeyField).asInteger;
      except
      end;
      try
         SubModulo := ESubModulo.ListSource.Dataset.FieldByName(ESubmodulo.KeyField).asInteger;;
      except
      end;
      try
         Operacao := EOperacao.Text;
      except
      end;
      try
         Componente  := EComponente.Text;
      except
      end;
      try
        DataAlterado  := CConfiguracao.DataHora;
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

procedure TOperacao_do_Sistema.AtualizaControles(Habilitar:Boolean);
begin
 Try
   EDbgrid.Enabled           :=not Habilitar;
 except
 end;
 try
   EOperacao.Enabled       :=Habilitar;
 except
 end;
 try
   EComponente.Enabled     :=Habilitar;
 except
 end;

end;

procedure TOperacao_do_Sistema.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
end;

procedure TOperacao_do_Sistema.CarregaDados;
begin
 Try
   ECodigoOPS.Text           :=IntToStr(CodigoOPS);
 except
 end;
 try
   EOperacao.Text            :=Operacao;
 except
 end;
 try
   if DataCadastro>0 then
     EDataCadastro.Text        :=FormatDateTime('dd/mm/yyyy', DataCadastro);
 except
 end;
 try
   if DataAlterado>0 then
     EDataAlterado.Text        :=FormatDateTime('dd/mm/yyyy', DataAlterado);
 except
 end;
 try
   EComponente.Text          :=Componente;
 except
 end;

end;

constructor TOperacao_do_Sistema.Create(AOwner: TComponent);
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

procedure TOperacao_do_Sistema.Deletar(CdOPS:Integer);
begin
  If not(localizarCod(CdOPS)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if TQuery(Self).isEmpty then
      begin
        Try
          ECodigoOPS.Clear;
        except
        end;
        Try
          EModulo.KeyValue := 0;
        except
        end;
        Try
          ESubmodulo.KeyValue := 0;
        except
        end;
         try
          EOperacao.Clear;
        except
        end;
        try
          EDataCadastro.Clear;
        except
        end;
        try
          EDataAlterado.Clear;
        except
        end;
        try
          EComponente.Clear;
        except
        end;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TOperacao_do_Sistema.Destroy;
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

function TOperacao_do_Sistema.FinalizaEdicao:boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  mensagem:='';
  if EOperacao.Text='' then
    mensagem:=mensagem+'Operação inválida!';
  if mensagem <> '' then
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
      If Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoOPS;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
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



{ Insere uma operação do sistema }
function TOperacao_do_Sistema.Inserir(CdCNC, CdOPS,PModulo,PSubModulo: integer; DT_Cadastro:TDateTime;POperacao,PComponente:String):boolean;
Var
  Cod:Integer;
begin
  if CdOPS=0 then
  begin
    Cod    := ProximoCodigo('OPS_CODIGO');
  end
  else
    Cod    := CdOPS;
  If (localizarCod(Cod)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
     result := true;
     Insert;
     try
       CodigoOPS      := Cod;
       CodigoCNC      := CdCNC;
       Modulo         := PModulo;
       SubModulo      := PSubModulo;
       Operacao       := POperacao;
       DataCadastro   := DT_Cadastro;
       Componente     := PComponente;

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

function TOperacao_do_Sistema.InserirAuto:Boolean;
Var
  Aux:TDataSetNotifyEvent;
begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        CodigoOPS   := SCodigo;
      except
      end;
      try
         CodigoCNC := CConfiguracao.CodigoCNC;
      except
      end;
      try
         Modulo  := EModulo.ListSource.Dataset.FieldByName(EModulo.KeyField).asInteger;
      except
      end;
      try
         SubModulo  := ESubModulo.ListSource.Dataset.FieldByName(ESubModulo.KeyField).asInteger;
      except
      end;
      try
         Operacao := EOperacao.Text;
      except
      end;
      try
        DataCadastro  := CConfiguracao.DataHora;
      except
      end;
      try
         Componente := EComponente.Text;
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

{ Localiza uma operação do sistema }
function TOperacao_do_Sistema.LocalizarCod(CdOPS: Integer): Boolean;
begin
  If (CdOPS<>CodigoOPS) Then
    If locate('OPS_CODIGO', CdOPS, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TOperacao_do_Sistema.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TOperacao_do_Sistema.PreparaInsercao;
begin
 ProximoCodigo('OPS_CODIGO');
 try
   EOperacao.Clear;
 except
 end;
 try
    EDataCadastro.Text  := FormatDateTime('dd/mm/yyyy hh:mm', CConfiguracao.DataHora);
 except
 end;
 try
   EComponente.Clear;
   except
 end;

  AtualizaControles(True);
  Estado:=1;
end;

function TOperacao_do_Sistema.deletarauto:Boolean;
var
  CdCNC, CdOPS: integer;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdOPS := CodigoOPS;
  try
    Delete;
    result:=true;
    GeraLog(1590,CdCNC,CdOPS,'41');
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
