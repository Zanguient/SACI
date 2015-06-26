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
unit Item_de_Manufaturado;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Configuracao, Dbgrids, Funcoes, 
     Manufaturado, Variants;

type
  TItem_de_Manufaturado = class(TSQuery)
    private
      { Private fields of TItem_de_Manufaturado }
        { Storage for property CManufaturado }
        FCManufaturado : TManufaturado;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoIMF }
        FCodigoIMF : Integer;
        { Storage for property CodigoMFA }
        FCodigoMFA : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property ECodigoIMF }
        FECodigoIMF : TEdit;
        { Storage for property ECodigoMFA }
        FECodigoMFA : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property Quantidade }
        FQuantidade : Double;

      { Private methods of TItem_de_Manufaturado }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoIMF }
        function GetCodigoIMF : Integer;
        { Write method for property CodigoIMF }
        procedure SetCodigoIMF(Value : Integer);
        { Read method for property CodigoMFA }
        function GetCodigoMFA : Integer;
        { Write method for property CodigoMFA }
        procedure SetCodigoMFA(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);

    protected
      { Protected fields of TItem_de_Manufaturado }

      { Protected methods of TItem_de_Manufaturado }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_de_Manufaturado }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TItem_de_Manufaturado }
        { Altera um Ítem de Pedido de Venda }
        function Alterar(CdCNC, CdIMF, CdMFA, CdPRD:Integer;PQuantidade:Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdIMF:Integer):Boolean;
        function FinalizaEdicao:Boolean;
        { Insere um item de Manufaturado }
        function Inserir(CdCNC, CdIMF, CdMFA, CdPRD: integer;PQuantidade:real):boolean;
        function InserirAuto:Boolean;
        { Localiza um ítem de pedido de venda }
        function LocalizarCod(CdIMF,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_de_Manufaturado }
        property CManufaturado : TManufaturado
             read FCManufaturado write FCManufaturado;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do item de Manufaturado }
        property CodigoIMF : Integer read GetCodigoIMF write SetCodigoIMF;
        { Código do Pedido de Venda }
        property CodigoMFA : Integer read GetCodigoMFA write SetCodigoMFA;
        { Código de Produto }
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property ECodigoIMF : TEdit read FECodigoIMF write FECodigoIMF;
        property ECodigoMFA : TEdit read FECodigoMFA write FECodigoMFA;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property Quantidade : Double read GetQuantidade write SetQuantidade;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Manufaturado with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Manufaturado]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Manufaturado.AutoInitialize;
begin
     Estado := 0;
     FECodigoIMF := nil;
     FECodigoMFA := nil;
     FECodigoPRD := nil;
     FEQuantidade := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Manufaturado.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoIMF then
        FECodigoIMF := nil;
     if AComponent = FECodigoMFA then
        FECodigoMFA := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Manufaturado.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TItem_de_Manufaturado.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItem_de_Manufaturado.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoIMF }
function TItem_de_Manufaturado.GetCodigoIMF : Integer;
begin
  try
    Result := Self.fieldByName('IMF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoIMF }
procedure TItem_de_Manufaturado.SetCodigoIMF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IMF_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IMF_CODIGO"!');
  end;
end;

{ Read method for property CodigoMFA }
function TItem_de_Manufaturado.GetCodigoMFA : Integer;
begin
  try
    Result := Self.fieldByName('MFA_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoMFA }
procedure TItem_de_Manufaturado.SetCodigoMFA(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MFA_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MFA_CODIGO"!');
  end;
end;

{ Read method for property CodigoPRD }
function TItem_de_Manufaturado.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    Result := 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_de_Manufaturado.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property Quantidade }
function TItem_de_Manufaturado.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('IMF_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_de_Manufaturado.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IMF_QUANTIDADE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IMF_QUANTIDADE"!');
  end;
end;

{ Altera um Ítem de Pedido de Venda }
function TItem_de_Manufaturado.Alterar(CdCNC, CdIMF, CdMFA, CdPRD:Integer;PQuantidade:Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result:=true;
  If not(localizarCod(CdIMF,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoMFA      := CdMFA;
      CodigoPRD      := CdPRD;
      Quantidade     := PQuantidade;
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

function TItem_de_Manufaturado.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      try
        CodigoPRD := StrToInt(ECodigoPRD.Text);
      except
      end;
      try
        Quantidade := StrToFloat(EQuantidade.Text);
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

procedure TItem_de_Manufaturado.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EDBGrid.Enabled     :=not Habilitar;
  Except
  End;
  try
    ECodigoPRD.Enabled     :=Habilitar;
  Except
  End;
  Try
    EQuantidade.Enabled    :=Habilitar;
  Except
  End;
end;

procedure TItem_de_Manufaturado.CancelaEdicao;
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

procedure TItem_de_Manufaturado.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
   ECodigoIMF.Text                :=IntToStr(CodigoIMF);
  Except
  End;
  Try
    ECodigoPRD.Text         :=IntToStr(CodigoPRD);
  Except
  End;
  Try
    EQuantidade.Text        :=Format('%.2f', [Quantidade]);
  Except
  End;
end;

constructor TItem_de_Manufaturado.Create(AOwner: TComponent);
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

function TItem_de_Manufaturado.Deletar(CdCNC,CdIMF:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdIMF,CdCNC)) Then
  Begin
    Result := False;
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
          Try
            ECodigoIMF.Clear;
          Except
          End;
          Try
            ECodigoPRD.Clear;
          Except
          End;
          Try
            EQuantidade.Clear;
          Except
          End;
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

function TItem_de_Manufaturado.FinalizaEdicao:Boolean;
       { Internal declarations for method }
     { type }
     { . . . }
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  If not verificainteirobranco(ECodigoPRD.Text) then
    mensagem:= mensagem + 'Produto digitado incorretamente!'+#13;
  If not VerificafloatBranco(EQuantidade.text) Then
    mensagem:=mensagem+'Quantidade digitada incorretamente!'+#13;
  If Trim(ECodigoPRD.Text) = IntToStr(CManufaturado.CodigoPRD) Then
    mensagem:=mensagem+'Um produto não pode ser criado por ele mesmo!'+#13;
  if mensagem <> '' then
  Begin
    Result:=False;
    ShowMessage(mensagem);
  end
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CConfiguracao.CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result:=False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoIMF;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result:=False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
  end;
end;

{ Insere um item de Manufaturado }
function TItem_de_Manufaturado.Inserir(CdCNC, CdIMF, CdMFA, CdPRD: integer;PQuantidade:real):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdIMF=0 then
    Cod    := ProximoCodigo('IMF_CODIGO')
  else
    Cod    := CdIMF;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
      Insert;
      try
        CodigoIMF      := Cod;
        CodigoCNC      := CdCNC;
        CodigoMFA      := CdMFA;
        CodigoPRD      := CdPRD;
        Quantidade     := PQuantidade;
        try
          Post;
          Result:=true;
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

function TItem_de_Manufaturado.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    append;
    try
       CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoIMF := SCodigo;
    except
    end;
    try
       CodigoMFA := StrToInt(ECodigoMFA.Text);
    except
    end;
    try
       CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       Quantidade := StrToFloat(EQuantidade.Text);
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

{ Localiza um ítem de pedido de venda }
function TItem_de_Manufaturado.LocalizarCod(CdIMF,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdIMF<>CodigoIMF) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;IMF_CODIGO', vararrayof([CdCNC, CdIMF]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_de_Manufaturado.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TItem_de_Manufaturado.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('IMF_CODIGO');
  Try
    ECodigoPRD.Clear;
  Except
  End;
  Try
    EQuantidade.Clear;
  Except
  End;
  Estado:=1;
  AtualizaControles(True);
end;

function TItem_de_Manufaturado.deletarauto:Boolean;
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
