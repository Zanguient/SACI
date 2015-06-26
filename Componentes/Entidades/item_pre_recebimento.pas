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
unit Item_Pre_Recebimento;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Pedido_de_Compra, Embarque, Configuracao, 
     Variants;

type
  TItem_Pre_Recebimento = class(TSQuery)
    private
      { Private fields of TItem_Pre_Recebimento }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoIRC }
        FCodigoIRC : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoREC }
        FCodigoREC : Integer;
        { Storage for property ECodigoIRC }
        FECodigoIRC : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoREC }
        FECodigoREC : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;

      { Private methods of TItem_Pre_Recebimento }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoIRC }
        function GetCodigoIRC : Integer;
        { Write method for property CodigoIRC }
        procedure SetCodigoIRC(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoREC }
        function GetCodigoREC : Integer;
        { Write method for property CodigoREC }
        procedure SetCodigoREC(Value : Integer);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);

    protected
      { Protected fields of TItem_Pre_Recebimento }

      { Protected methods of TItem_Pre_Recebimento }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;
        procedure Loaded; override;

    public
      { Public fields and properties of TItem_Pre_Recebimento }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TItem_Pre_Recebimento }
        { Altera um Recebimento }
        function Alterar(CdCNC, CdIRC, CdREC, CdPRD: Integer;PQuantidade:Double;PSituacao:integer):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC, CdIRC: Integer);
        destructor Destroy; override;
        procedure FinalizaEdicao;
        { Insere um Recebimento }
        function Inserir(CdCNC,CdIRC, CdREC, CdPRD: Integer;PQuantidade:Double;PSituacao,PTipo:integer):boolean;
        function InserirAuto:Boolean;
        { Localiza um Recebimento }
        function LocalizarCod(CdIRC, CdCNC: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_Pre_Recebimento }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Recebimento }
        property CodigoIRC : Integer read GetCodigoIRC write SetCodigoIRC;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoREC : Integer read GetCodigoREC write SetCodigoREC;
        property ECodigoIRC : TEdit read FECodigoIRC write FECodigoIRC;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoREC : TEdit read FECodigoREC write FECodigoREC;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_Pre_Recebimento with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_Pre_Recebimento]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_Pre_Recebimento.AutoInitialize;
begin
     Estado := 0;
     FECodigoIRC := nil;
     FECodigoPRD := nil;
     FECodigoREC := nil;
     FEQuantidade := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_Pre_Recebimento.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoIRC then
        FECodigoIRC := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoREC then
        FECodigoREC := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_Pre_Recebimento.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TItem_Pre_Recebimento.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItem_Pre_Recebimento.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoIRC }
function TItem_Pre_Recebimento.GetCodigoIRC : Integer;
begin
  try
    Result := Self.fieldByName('IPR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoIRC }
procedure TItem_Pre_Recebimento.SetCodigoIRC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPR_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_Pre_Recebimento.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_Pre_Recebimento.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property CodigoREC }
function TItem_Pre_Recebimento.GetCodigoREC : Integer;
begin
  try
    Result := Self.fieldByName('PRC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoREC }
procedure TItem_Pre_Recebimento.SetCodigoREC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRC_CODIGO"!');
    end;
end;

{ Read method for property Quantidade }
function TItem_Pre_Recebimento.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('IPR_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_Pre_Recebimento.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPR_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPR_QUANTIDADE"!');
    end;
end;

{ Read method for property Situacao }
function TItem_Pre_Recebimento.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('IPR_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property Situacao }
procedure TItem_Pre_Recebimento.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPR_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPR_SITUACAO"!');
    end;
end;

{ Read method for property Tipo }
function TItem_Pre_Recebimento.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('IPR_TIPO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Tipo }
procedure TItem_Pre_Recebimento.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPR_TIPO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPR_TIPO"!');
  end;
end;

{ Altera um Recebimento }
function TItem_Pre_Recebimento.Alterar(CdCNC, CdIRC, CdREC, CdPRD: Integer;PQuantidade:Double;PSituacao:integer):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result:=true;
  If not(localizarCod(CdIRC,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      Quantidade     := PQuantidade;
      CodigoPRD      := CdPRD;
      Situacao       := PSituacao;
      try
        Post;

      except
        result:=false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TItem_Pre_Recebimento.AlterarAuto:Boolean;
begin
    try
      edit;
      try
        Quantidade := StrToFloat(EQuantidade.Text);
      except
      end;
      try
        CodigoPRD := StrToInt(ECodigoPRD.Text);
      except
      end;
      Situacao :=0;

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

procedure TItem_Pre_Recebimento.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
   EcodigoIRC.Enabled       :=Habilitar;
  Except
  End;
  Try
   EcodigoPRD.Enabled       :=Habilitar;
  Except
  End;
  Try
   EcodigoREC.Enabled       :=Habilitar;
   Except
  End;
  Try
   Equantidade.Enabled      :=Habilitar;
   Except
  End;
end;

procedure TItem_Pre_Recebimento.CancelaEdicao;
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

procedure TItem_Pre_Recebimento.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
   EcodigoPRD.text      :=inttostr(CodigoPRD);
   Except
  End;
  Try
   Equantidade.Text         :=Format('%.2f', [Quantidade]);
   Except
  End;
end;

constructor TItem_Pre_Recebimento.Create(AOwner: TComponent);
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

procedure TItem_Pre_Recebimento.Deletar(CdCNC, CdIRC: Integer);
begin
  If not(localizarCod(CdIRC, CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if TQuery(Self).isEmpty then
      begin
        Try
         ECodigoPRD.Text  :='';
         Except
        End;
        try
         EQuantidade.Text  :='';
         Except
        End;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_Pre_Recebimento.Destroy;
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

procedure TItem_Pre_Recebimento.FinalizaEdicao;
var
  cod, cdcnc:Integer;
begin
  If Estado=1 then
  Begin
    Inserirauto;
    close;
    open;
    LocalizarCod(SCodigo,CodigoCNC);
  End;

  If Estado=2 then
  Begin
    cod:=codigoREC;
    cdcnc:=codigoCNC;
    Alterarauto;
    close;
    open;
    LocalizarCod(cod, cdcnc);
  End;

  AtualizaControles(False);
  Estado:=0;
end;

{ Insere um Recebimento }
function TItem_Pre_Recebimento.Inserir(CdCNC,CdIRC, CdREC, CdPRD: Integer;PQuantidade:Double;PSituacao,PTipo:integer):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod: Integer;
begin
  if CdIRC=0 then
    Cod    := ProximoCodigo('IPR_CODIGO')
  else
    Cod    := CdIRC;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
      result := true;
      Insert;
      try
        CodigoIRC      := Cod;
        CodigoCNC      := CdCNC;
        CodigoPRD      := CdPRD;
        CodigoREC      := CdREC;
        Quantidade     := PQuantidade;
        Situacao       := PSituacao;
        Tipo           := PTipo;
        try
          Post;

        except
          result:=false;
          Cancel;
          ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
        end;
      except
        result:=false;
        ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
      end;
  end;
end;

function TItem_Pre_Recebimento.InserirAuto:Boolean;
Var
  Aux:TDataSetNotifyEvent;
begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        Codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        codigoIRC := SCodigo;
      except
      end;
      try
        CodigoPRD := strtoInt(ECodigoPRD.text);
      except
      end;
      try
        CodigoREC := strtoInt(ECodigoREC.text);
      except
      end;
      try
        Quantidade := StrToFloat(EQuantidade.Text);
      except
      end;
      Situacao := 0;
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

procedure TItem_Pre_Recebimento.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }

end;

{ Localiza um Recebimento }
function TItem_Pre_Recebimento.LocalizarCod(CdIRC, CdCNC: Integer): Boolean;
begin
  If (CdIRC<>CodigoIRC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; IPR_CODIGO', vararrayof([CdCNC, CdIRC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_Pre_Recebimento.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TItem_Pre_Recebimento.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 ProximoCodigo('IPR_CODIGO');
  Try
   ECodigoPRD.clear;
   Except
  End;
  Try
   EQuantidade.Text  :='';
   Except
  End;
  AtualizaControles(True);
  Estado:=1;
end;

function TItem_Pre_Recebimento.deletarauto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    Delete;
    result:=true;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
