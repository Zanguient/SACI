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
unit Embarque;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Extctrls, Variants;

type
  TEmbarque = class(TSQuery)
    private
      { Private fields of TEmbarque }
        { Storage for property Caminhao }
        FCaminhao : String;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoEMB }
        FCodigoEMB : Integer;
        { Storage for property CodigoTRN }
        FCodigoTRN : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property ECaminhao }
        FECaminhao : TEdit;
        { Storage for property ECodigoEMB }
        FECodigoEMB : TEdit;
        { Storage for property ECodigoTRN }
        FECodigoTRN : TDBLookupComboBox;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property EFunMotorista }
        FEFunMotorista : TDBLookupComboBox;
        { Storage for property EFunResp }
        FEFunResp : TDBLookupComboBox;
        { Storage for property EFunTran }
        FEFunTran : TRadioGroup;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ETotalitens }
        FETotalitens : TEdit;
        { Storage for property FunMotorista }
        FFunMotorista : Integer;
        { Storage for property FunResp }
        FFunResp : Integer;
        { Storage for property FunTran }
        FFunTran : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Totalitens }
        FTotalitens : Integer;

      { Private methods of TEmbarque }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Caminhao }
        function GetCaminhao : String;
        { Write method for property Caminhao }
        procedure SetCaminhao(Value : String);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoEMB }
        function GetCodigoEMB : Integer;
        { Write method for property CodigoEMB }
        procedure SetCodigoEMB(Value : Integer);
        { Read method for property CodigoTRN }
        function GetCodigoTRN : Integer;
        { Write method for property CodigoTRN }
        procedure SetCodigoTRN(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property FunMotorista }
        function GetFunMotorista : Integer;
        { Write method for property FunMotorista }
        procedure SetFunMotorista(Value : Integer);
        { Read method for property FunResp }
        function GetFunResp : Integer;
        { Write method for property FunResp }
        procedure SetFunResp(Value : Integer);
        { Read method for property FunTran }
        function GetFunTran : Integer;
        { Write method for property FunTran }
        procedure SetFunTran(Value : Integer);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Totalitens }
        function GetTotalitens : Integer;
        { Write method for property Totalitens }
        procedure SetTotalitens(Value : Integer);

    protected
      { Protected fields of TEmbarque }

      { Protected methods of TEmbarque }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TEmbarque }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TEmbarque }
        { Altera um Embarque }
        function Alterar(CdCNC, CdEMB, PSituacao, PTotalitens, PFunMotorista, PFunResp: integer; PData:TDateTime; POBS, PCaminhao: String;CdTRN,PFunTran:integer):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdEMB:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Embarque }
        function Inserir(CdCNC, CdEMB, PSituacao, PTotalitens, PFunMotorista, PFunResp: integer; PData:TDateTime; POBS, PCaminhao: String;CdTRN,PFunTran:integer):boolean;
        function InserirAuto:Boolean;
        { Localiza um Embarque }
        function LocalizarCod(CdEMB, CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TEmbarque }
        property Caminhao : String read GetCaminhao write SetCaminhao;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Embarque }
        property CodigoEMB : Integer read GetCodigoEMB write SetCodigoEMB;
        property CodigoTRN : Integer read GetCodigoTRN write SetCodigoTRN;
        property Data : Tdatetime read GetData write SetData;
        property ECaminhao : TEdit read FECaminhao write FECaminhao;
        property ECodigoEMB : TEdit read FECodigoEMB write FECodigoEMB;
        property ECodigoTRN : TDBLookupComboBox
             read FECodigoTRN write FECodigoTRN;
        property EData : TMaskEdit read FEData write FEData;
        property EFunMotorista : TDBLookupComboBox
             read FEFunMotorista write FEFunMotorista;
        property EFunResp : TDBLookupComboBox read FEFunResp write FEFunResp;
        property EFunTran : TRadioGroup read FEFunTran write FEFunTran;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ETotalitens : TEdit read FETotalitens write FETotalitens;
        property FunMotorista : Integer
             read GetFunMotorista write SetFunMotorista;
        property FunResp : Integer read GetFunResp write SetFunResp;
        property FunTran : Integer read GetFunTran write SetFunTran;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Totalitens : Integer read GetTotalitens write SetTotalitens;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TEmbarque with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TEmbarque]);
end;

{ Method to set variable and property values and create objects }
procedure TEmbarque.AutoInitialize;
begin
     Estado := 0;
     FECaminhao := nil;
     FECodigoEMB := nil;
     FECodigoTRN := nil;
     FEData := nil;
     FEFunMotorista := nil;
     FEFunResp := nil;
     FEFunTran := nil;
     FEOBS := nil;
     FESituacao := nil;
     FETotalitens := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TEmbarque.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECaminhao then
        FECaminhao := nil;
     if AComponent = FECodigoEMB then
        FECodigoEMB := nil;
     if AComponent = FECodigoTRN then
        FECodigoTRN := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEFunMotorista then
        FEFunMotorista := nil;
     if AComponent = FEFunResp then
        FEFunResp := nil;
     if AComponent = FEFunTran then
        FEFunTran := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETotalitens then
        FETotalitens := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TEmbarque.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Caminhao }
function TEmbarque.GetCaminhao : String;
begin
  try
    Result := Self.fieldByName('EMB_CAMINHAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Caminhao }
procedure TEmbarque.SetCaminhao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('EMB_CAMINHAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "EMB_CAMINHAO"!');
  end;
end;

{ Read method for property CodigoCNC }
function TEmbarque.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TEmbarque.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoEMB }
function TEmbarque.GetCodigoEMB : Integer;
begin
  try
    Result := Self.fieldByName('EMB_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoEMB }
procedure TEmbarque.SetCodigoEMB(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMB_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMB_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRN }
function TEmbarque.GetCodigoTRN : Integer;
begin
  try
    Result := Self.fieldByName('TRN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTRN }
procedure TEmbarque.SetCodigoTRN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRN_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TEmbarque.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('EMB_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TEmbarque.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('EMB_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "EMB_DATA"!');
  end;
end;

{ Read method for property FunMotorista }
function TEmbarque.GetFunMotorista : Integer;
begin
  try
    Result := Self.fieldByName('EMB_FUN_MOTORISTA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property FunMotorista }
procedure TEmbarque.SetFunMotorista(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMB_FUN_MOTORISTA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMB_FUN_MOTORISTA"!');
    end;
end;

{ Read method for property FunResp }
function TEmbarque.GetFunResp : Integer;
begin
  try
    Result := Self.fieldByName('EMB_FUN_RESP').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property FunResp }
procedure TEmbarque.SetFunResp(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('EMB_FUN_RESP').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "EMB_FUN_RESP"!');
  end;
end;

{ Read method for property FunTran }
function TEmbarque.GetFunTran : Integer;
begin
  try
    Result := Self.fieldByName('EMB_FUN_TRAN').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property FunTran }
procedure TEmbarque.SetFunTran(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('EMB_FUN_TRAN').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "EMB_FUN_TRAN"!');
  end;
end;

{ Read method for property OBS }
function TEmbarque.GetOBS : String;
begin
  try
    Result := Self.fieldByName('EMB_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TEmbarque.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('EMB_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "EMB_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TEmbarque.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('EMB_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TEmbarque.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('EMB_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "EMB_SITUACAO"!');
  end;
end;

{ Read method for property Totalitens }
function TEmbarque.GetTotalitens : Integer;
begin
  try
    Result := Self.fieldByName('EMB_TOT_ITENS').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Totalitens }
procedure TEmbarque.SetTotalitens(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMB_TOT_ITENS').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMB_TOT_ITENS"!');
    end;
end;

{ Altera um Embarque }
function TEmbarque.Alterar(CdCNC, CdEMB, PSituacao, PTotalitens, PFunMotorista, PFunResp: integer; PData:TDateTime; POBS, PCaminhao: String;CdTRN,PFunTran:integer):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result:=true;
  If not(localizarCod(CdEMB,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      Data           := PData;
      Situacao       := PSituacao;
      OBS            := POBS;
      Totalitens     := PTotalitens;
      FunMotorista   := PFunMotorista;
      FunResp        := PFunResp;
      Caminhao       := PCaminhao;
      CodigoTRN      := CdTRN;
      FunTran        := PFunTran;
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

function TEmbarque.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      try
         Data := StrToDateTime(EData.Text);
      except
      end;
      try
         Situacao := StrToInt(ESituacao.Text);
      except
      end;
      try
         OBS := EOBS.Text;
      except
      end;
      try
         Totalitens  := StrToInt(ETotalitens.Text);
      except
      end;
      try
         FunMotorista := EFunMotorista.KeyValue;
      except
      end;
      try
         FunResp := EFunResp.KeyValue;
      except
      end;
      try
         Caminhao := ECaminhao.Text;
      except
      end;
      try
         CodigoTRN := ECodigoTRN.KeyValue;
      except
      end;
      try
         FunTran := EFunTran.ItemIndex;
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

procedure TEmbarque.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EOBS.Enabled            :=Habilitar;
  Except
  End;
  Try
    EFunResp.Enabled        :=Habilitar;
  Except
  End;
  Try
    ECaminhao.Enabled       :=Habilitar;
  Except
  End;
  try
    EFunTran.Enabled       := Habilitar;
  except
  End;
end;

procedure TEmbarque.CancelaEdicao;
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

procedure TEmbarque.CarregaDados;
begin
  Try
   Case Situacao of
    0: ESituacao.Text:='Preparando';
    1: ESituacao.Text:='Pronto para viagem';
    2: ESituacao.Text:='Processado';
   End;
  Except
  End;
  Try
    ECodigoEMB.Text                :=IntToStr(CodigoEMB);
  Except
  End;
  Try
   if Data=0 then
     EData.Text:=''
   else
     EData.Text                :=FormatDateTime('dd/mm/yyyy hh:nn:ss', Data);
  Except
  End;
  Try
   EOBS.Text                 :=OBS;
  Except
  End;
  Try
   ETotalitens.Text          :=IntToStr(Totalitens);
  Except
  End;
  Try
   ECaminhao.Text            :=Caminhao;
  Except
  End;
  Try
    ECodigoTRN.keyvalue       :=CodigoTRN;
  Except
  End;
  Try
    EFunTran.itemindex           :=FunTran;
  Except
  End;  
  Try
    EFunMotorista.KeyValue    :=FunMotorista;
  Except
  End;
  Try
    EFunResp.KeyValue         :=FunResp;
  Except
  End;  
end;

constructor TEmbarque.Create(AOwner: TComponent);
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

function TEmbarque.Deletar(CdCNC, CdEMB:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdEMB, CdCNC)) Then
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
           ECodigoEMB.Clear;
           Except
          End;
          Try
           EData.Clear;
           Except
          End;
          Try
           ESituacao.Clear;
           Except
          End;
          Try
           EOBS.Clear;
           Except
          End;
          Try
           ETotalitens.Clear;
          Except
          End;
          Try
           EFunMotorista.KeyValue:=0;
           Except
          End;
          Try
           EFunResp.KeyValue:=0;
           Except
          End;
          Try
           ECaminhao.Clear;
           Except
          End;
          Try
           ECodigoTRN.keyvalue:=0;
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

destructor TEmbarque.Destroy;
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

function TEmbarque.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod, cdcnc:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  mensagem := '';

  If (EFunResp.KeyValue = 0) OR (EFunResp.KeyValue = NULL) then
    mensagem:=mensagem+'Funcionário responsável pelo embarque faltando!'+#13;

  If ((EFunMotorista.KeyValue = 0) OR (EFunMotorista.KeyValue = NULL)) and
     ((ECodigoTRN.KeyValue = 0) OR (ECodigoTRN.KeyValue = NULL)) and
     ( EFunTran.ItemIndex < 2) then
    mensagem:=mensagem+'Motorista ou Transportadora responsável pelo embarque faltando!'+#13;

  if mensagem <> '' then
  Begin
    ShowMessage(mensagem);
    Result := False;
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
        LocalizarCod(SCodigo,CConfiguracao.CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoEMB;
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
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

{ Insere um Embarque }
function TEmbarque.Inserir(CdCNC, CdEMB, PSituacao, PTotalitens, PFunMotorista, PFunResp: integer; PData:TDateTime; POBS, PCaminhao: String;CdTRN,PFunTran:integer):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdEMB=0 then
    Cod    := ProximoCodigo('EMB_CODIGO')
  else
    Cod    := CdEMB;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
   result:=true;
      try
         INSERT;
         CodigoEMB      := Cod;
         CodigoCNC      := CdCNC;
         Data           := PData;
         Situacao       := PSituacao;
         OBS            := POBS;
         Totalitens     := PTotalitens;
         FunMotorista   := PFunMotorista;
         FunResp        := PFunResp;
         Caminhao       := PCaminhao;
         FunTran        := PFunTran;
         CodigoTRN      := CdTRN;
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

function TEmbarque.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      append;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        CodigoEMB := SCodigo;
      except
      end;
      try
         Data := StrToDateTime(EData.text);
      except
      end;
      try
         Situacao := StrToInt(ESituacao.Text);
      except
      end;
      try
         OBS := EOBS.Text;
      except
      end;
      try
         Totalitens  := StrToInt(ETotalitens.Text);
      except
      end;
      try
         FunMotorista := EFunMotorista.KeyValue;
      except
      end;
      try
         FunResp := EFunResp.KeyValue;
      except
      end;
      try
         Caminhao := ECaminhao.Text;
      except
      end;
      try
         CodigoTRN := ECodigoTRN.KeyValue;
      except
      end;
      try
         FunTran := EFunTran.ItemIndex;
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

{ Localiza um Embarque }
function TEmbarque.LocalizarCod(CdEMB, CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdEMB<>CodigoEMB) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; EMB_CODIGO', vararrayof([CdCNC, CdEMB]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TEmbarque.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TEmbarque.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 ProximoCodigo('EMB_CODIGO');
  Try
   EData.text := DateTimeToStr(CConfiguracao.DataHora);
   Except
  End;
  Try
   ESituacao.Clear;
   Except
  End;
  Try
   EOBS.Clear;
   Except
  End;
  Try
   ETotalitens.Text := '0';
  Except
  End;
  Try
   EFunMotorista.keyvalue  := 0;
   Except
  End;
  Try
   EFunResp.keyvalue :=0 ;
   Except
  End;
  Try
   ECaminhao.Clear;
   Except
  End;
  Try
   ECodigoTRN.Keyvalue :=0;
   Except
  End;


  AtualizaControles(True);
  Estado:=1;
end;

function TEmbarque.deletarauto:Boolean;
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
