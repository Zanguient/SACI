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
unit Cobranca_por_Cobrador;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Variants;

type
  TCobranca_por_Cobrador = class(TSQuery)
    private
      { Private fields of TCobranca_por_Cobrador }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoCPC }
        FCodigoCPC : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property ECodigoCPC }
        FECodigoCPC : TEdit;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EOrigemCNC }
        FEOrigemCNC : TDBLookupCombobox;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property OrigemCNC }
        FOrigemCNC : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TCobranca_por_Cobrador }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoCPC }
        function GetCodigoCPC : Integer;
        { Write method for property CodigoCPC }
        procedure SetCodigoCPC(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property OrigemCNC }
        function GetOrigemCNC : Integer;
        { Write method for property OrigemCNC }
        procedure SetOrigemCNC(Value : Integer);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TCobranca_por_Cobrador }

      { Protected methods of TCobranca_por_Cobrador }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCobranca_por_Cobrador }

      { Public methods of TCobranca_por_Cobrador }
        { Altera uma Cobrança por Cobrador }
        function Alterar(CdCNC, CdCPC, CdFUN, PSituacao, CdCNCOri : Integer; PData, POBS: String):boolean;
        function AlterarAuto:Boolean;
        procedure AlterarSituacao(Valor:Integer);
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdCPC:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere uma cobrança por cobrador }
        function Inserir(CdCNC, CdCPC, CdFUN, PSituacao, CdCNCOri: Integer; PData, POBS: String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza uma cobrança por cobrador }
        function LocalizarCod(CdCPC, CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TCobranca_por_Cobrador }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código da cobrança por cobrador }
        property CodigoCPC : Integer read GetCodigoCPC write SetCodigoCPC;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property Data : Tdatetime read GetData write SetData;
        property ECodigoCPC : TEdit read FECodigoCPC write FECodigoCPC;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property EData : TMaskEdit read FEData write FEData;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EOrigemCNC : TDBLookupCombobox
             read FEOrigemCNC write FEOrigemCNC;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property OBS : String read GetOBS write SetOBS;
        property OrigemCNC : Integer read GetOrigemCNC write SetOrigemCNC;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCobranca_por_Cobrador with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCobranca_por_Cobrador]);
end;

{ Method to set variable and property values and create objects }
procedure TCobranca_por_Cobrador.AutoInitialize;
begin
     FECodigoCPC := nil;
     FECodigoFUN := nil;
     FEData := nil;
     FEOBS := nil;
     FEOrigemCNC := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCobranca_por_Cobrador.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCPC then
        FECodigoCPC := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEOrigemCNC then
        FEOrigemCNC := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCobranca_por_Cobrador.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TCobranca_por_Cobrador.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TCobranca_por_Cobrador.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoCPC }
function TCobranca_por_Cobrador.GetCodigoCPC : Integer;
begin
  try
    Result := Self.fieldByName('CPC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCPC }
procedure TCobranca_por_Cobrador.SetCodigoCPC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CPC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CPC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TCobranca_por_Cobrador.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TCobranca_por_Cobrador.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TCobranca_por_Cobrador.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('CPC_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TCobranca_por_Cobrador.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CPC_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CPC_DATA"!');
  end;
end;

{ Read method for property OBS }
function TCobranca_por_Cobrador.GetOBS : String;
begin
  try
    Result := Self.fieldByName('CPC_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TCobranca_por_Cobrador.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CPC_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CPC_OBSERVACAO"!');
  end;
end;

{ Read method for property OrigemCNC }
function TCobranca_por_Cobrador.GetOrigemCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_ORIGEM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property OrigemCNC }
procedure TCobranca_por_Cobrador.SetOrigemCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_ORIGEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_ORIGEM"!');
    end;
end;

{ Read method for property Situacao }
function TCobranca_por_Cobrador.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CPC_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TCobranca_por_Cobrador.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CPC_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CPC_SITUACAO"!');
  end;
end;

{ Altera uma Cobrança por Cobrador }
function TCobranca_por_Cobrador.Alterar(CdCNC, CdCPC, CdFUN, PSituacao, CdCNCOri : Integer; PData, POBS: String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdCPC,CdCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false;
  end
  Else
  Begin
    try
      edit;
      Data           := StrToDateTime(PData);
      Situacao       := PSituacao;
      OBS            := POBS;
      CodigoFUN      := CdFUN;
      OrigemCNC      := CdCNCOri;
      try
        Post;
        result:=true;
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

function TCobranca_por_Cobrador.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      try
         Situacao := StrToInt(ESituacao.Text);
      except
      end;
      try
         OBS := EOBS.Text;
      except
      end;
      try
         CodigoFUN := ECodigoFUN.KeyValue;
      except
      end;
      try
         OrigemCNC := EOrigemCNC.KeyValue;
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

procedure TCobranca_por_Cobrador.AlterarSituacao(Valor:Integer);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  CdCNC,CdCPC:Integer;
begin
  Try
    CdCNC:=CodigoCNC;
    CdCPC:=CodigoCPC;

    Edit;
    Try
      Situacao:=Valor;
    Except
    End;
      try
        Post;
        Close;
        Open;
        LocalizarCod(CdCPC,CdCNC);
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TCobranca_por_Cobrador.AtualizaControles(Habilitar:Boolean);
begin
  Try
   EDBGrid.Enabled       := not Habilitar;
  Except
  End;
  Try
   ECodigoFUN.Enabled    := Habilitar;
  Except
  End;
  Try
   EOrigemCNC.Enabled    := Habilitar;
  Except
  End;
  Try
   EOBS.Enabled          := Habilitar;
  Except
  End;
end;

procedure TCobranca_por_Cobrador.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TCobranca_por_Cobrador.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    Case Situacao of
      0: ESituacao.Text:='Criada';
      1: ESituacao.Text:='Envida';
    End;
  Except
  End;
  Try
   ECodigoCPC.Text                :=IntToStr(CodigoCPC);
   Except
  End;
  Try
   ECodigoFUN.KeyValue       :=CodigoFUN;
   Except
  End;
  Try
   EOrigemCNC.KeyValue       :=OrigemCNC;
   Except
  End;
  Try
   if Data=0 then
      EData.text:=''
    else
      EData.Text                :=FormatDateTime('dd/mm/yyyy  hh:nn:ss', Data);
  Except
  End;
  Try
   EOBS.Text                 :=OBS;
   Except
  End;

end;

constructor TCobranca_por_Cobrador.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'COBRANCA_POR_COBRADOR';

     { Code to perform other tasks when the component is created }

end;

function TCobranca_por_Cobrador.Deletar(CdCNC,CdCPC:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCPC,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result:=True;
        RegistrarDel(CdCNC,1270(*CobrancaPorCobrador*),CdCPC);
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCobranca_por_Cobrador.Destroy;
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

function TCobranca_por_Cobrador.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod, cdcnc:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  mensagem:='';
  if EOBS.Text = '' then
    mensagem:=mensagem+'Descricao inválida!'+#13;
  if (ECodigoFUN.KeyValue = 0) OR (ECodigoFUN.KeyValue = NULL)then
    mensagem:=mensagem+'Cobrador inválido!'+#13;
  if (EOrigemCNC.KeyValue = 0) OR (EOrigemCNC.KeyValue = NULL)then
    mensagem:=mensagem+'Centro de Custo de Origem inválido!'+#13;
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
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo, CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoCPC;
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

{ Insere uma cobrança por cobrador }
function TCobranca_por_Cobrador.Inserir(CdCNC, CdCPC, CdFUN, PSituacao, CdCNCOri: Integer; PData, POBS: String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdCPC=0 then
    Cod    := ProximoCodigo('CPC_CODIGO')
  else
    Cod    := CdCPC;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
    try
      INSERT;
      CodigoCPC      := Cod;
      CodigoCNC      := CdCNC;
      CodigoFUN      := CdFUN;
      OrigemCNC      := CdCNCOri;
      Data           := StrToDateTime(PData);
      Situacao       := PSituacao;
      OBS            := POBS;

      try
        Post;
        result:=true;
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

function TCobranca_por_Cobrador.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (localizarCod(SCodigo,CodigoCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false;
  end
  Else
  begin
    try
      append;
      try
         codigoCNC   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        codigoCPC := SCodigo;
      except
      end;
      try
         codigoFUN   := ECodigoFUN.KeyValue;
      except
      end;
      try
         OrigemCNC   := EOrigemCNC.KeyValue;
      except
      end;
      try
         Data := StrToDateTime(EData.text);
      except
      end;
      try
         Situacao := 0;
      except
      end;
      try
         OBS := EOBS.Text;
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
end;

procedure TCobranca_por_Cobrador.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      EData.Clear
    else
      EData.text:= DateTimeToStr(CConfiguracao.DataHora);
  Except
  End;
  Try
    ESituacao.Clear;
  Except
  End;
//  Try
//    ECodigoCPC.Clear;
//  Except
//  End;
  Try
    EOBS.Clear;
  Except
  End;
  Try
    ECodigoFUN.KeyValue := -1;
  Except
  End;
  Try
    EOrigemCNC.KeyValue := -1;
  Except
  End;
end;

{ Localiza uma cobrança por cobrador }
function TCobranca_por_Cobrador.LocalizarCod(CdCPC, CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCPC<>CodigoCPC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; CPC_CODIGO', vararrayof([CdCNC, CdCPC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCobranca_por_Cobrador.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TCobranca_por_Cobrador.PreparaInsercao;
begin
  ProximoCodigo('CPC_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TCobranca_por_Cobrador.deletarauto:Boolean;
var
  CdCNC, CdCPC: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdCPC := CodigoCPC;
    if Delete then
    Begin
      Result := True;
      RegistrarDel(CdCNC,1270(*CobrancaPorCobrador*),CdCPC);
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
