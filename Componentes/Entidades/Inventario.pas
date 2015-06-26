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
unit Inventario;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Variants;

type
  TInventario = class(TSQuery)
    private
      { Private fields of TInventario }
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoINV }
        FCodigoINV : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property ECodigoINV }
        FECodigoINV : TEdit;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ETipo }
        FETipo : TComboBox;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;

      { Private methods of TInventario }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoINV }
        function GetCodigoINV : Integer;
        { Write method for property CodigoINV }
        procedure SetCodigoINV(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);

    protected
      { Protected fields of TInventario }

      { Protected methods of TInventario }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TInventario }

      { Public methods of TInventario }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function  Deletar(CdCNC,CdINV:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Inventário }
        function LocalizarCod(CdINV, CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TInventario }
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        { Código do Abastecimento }
        property CodigoINV : Integer read GetCodigoINV write SetCodigoINV;
        property Data : Tdatetime read GetData write SetData;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property ECodigoINV : TEdit read FECodigoINV write FECodigoINV;
        property EData : TMaskEdit read FEData write FEData;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ETipo : TComboBox read FETipo write FETipo;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TInventario with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TInventario]);
end;

{ Method to set variable and property values and create objects }
procedure TInventario.AutoInitialize;
begin
  FECodigoFUN := nil;
  FECodigoINV := nil;
  FEData := nil;
  FEDataAlterado := nil;
  FEOBS := nil;
  FESituacao := nil;
  FETipo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TInventario.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoINV then
        FECodigoINV := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TInventario.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoFUN }
function TInventario.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TInventario.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoINV }
function TInventario.GetCodigoINV : Integer;
begin
  try
    Result := Self.fieldByName('INV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoINV }
procedure TInventario.SetCodigoINV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INV_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TInventario.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('INV_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TInventario.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('INV_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "INV_DATA"!');
  end;
end;

{ Read method for property DataAlterado }
function TInventario.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('INV_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TInventario.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('INV_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "INV_DT_ALTERADO"!');
  end;
end;

{ Read method for property OBS }
function TInventario.GetOBS : String;
begin
  try
    Result := Self.fieldByName('INV_OBSERVACAO1').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TInventario.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('INV_OBSERVACAO1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "INV_OBSERVACAO1"!');
  end;
end;

{ Read method for property Situacao }
function TInventario.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('INV_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property Situacao }
procedure TInventario.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INV_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INV_SITUACAO"!');
    end;
end;

{ Read method for property Tipo }
function TInventario.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('INV_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Tipo }
procedure TInventario.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INV_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INV_TIPO"!');
    end;
end;

function TInventario.AlterarAuto:Boolean;
var
  CdCNC, CdINV: integer;
begin
  Result:=false;
  CdCNC := CodigoCNC;
  CdINV := CodigoINV;
  try
    edit;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      Data := StrToDateTime(EData.Text);
    except
    end;
    try
      CodigoFUN := ECodigoFUN.KeyValue;
    except
    end;
    try
       Tipo := ETipo.ItemIndex;
    except
    end;
    try
       OBS := EOBS.Text;
    except
    end;
    try
      Post;
      GeraLog(7800,CdCNC,CdINV);
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TInventario.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled     := not Habilitar;
  Except
  End;
  Try
    ECodigoFUN.Enabled  :=Habilitar;
  Except
  End;
  Try
    ETipo.Enabled        :=Habilitar;
  Except
  End;
  Try
    EOBS.Enabled        :=Habilitar;
  Except
  End;
end;

procedure TInventario.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if not isEmpty then
    CarregaDados
  else
    LimpaCampos;
end;

procedure TInventario.CarregaDados;
begin
  Try
   Case Situacao of
    0: ESituacao.Text:='Em Aberto';
    1: ESituacao.Text:='Processado';
    2: ESituacao.Text:='Cancelado';
   End;
  Except
  End;
  Try
    ECodigoINV.Text                :=IntToStr(CodigoINV);
  Except
  End;
  Try
    ECodigoFUN.KeyValue           :=CodigoFUN;
  Except
  End;
  Try
   If DataAlterado<>0 then
     EDataAlterado.Text        :=FormatDateTime('dd/mm/yyyy hh:mm:ss', DataAlterado);
  Except
  End;
  Try
   If data<>0 then
     EData.Text                :=FormatDateTime('dd/mm/yyyy', Data);
  Except
  End;
  Try
    ETipo.ItemIndex           :=Tipo;
  Except
  End;
  Try
    EOBS.Text                 :=OBS;
  Except
  End;
end;

constructor TInventario.Create(AOwner: TComponent);
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

function TInventario.Deletar(CdCNC,CdINV:Integer):Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      GeraLog(7810, CdCNC, CdINV);
      RegistrarDel(CdCNC,1530(*Inventário*),CdINV);
      Result := True;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

destructor TInventario.Destroy;
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

function TInventario.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem :string;
begin
  Result := False;
  mensagem := '';
  if mensagem <> '' then
    ShowMessage(mensagem)
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
        Sql.Text := 'SELECT * FROM INVENTARIO '+
          ' WHERE CNC_CODIGO=:CNC_CODIGO '+
          ' AND INV_CODIGO='+IntToStr(SCodigo);
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoINV;
      If Alterarauto then
      Begin
        Result := True;
        close;
        Sql.Text := 'SELECT * FROM INVENTARIO '+
          ' WHERE CNC_CODIGO=:CNC_CODIGO '+
          ' AND INV_CODIGO='+IntToStr(Cod);
        open;
        AtualizaControles(False);
        Estado:=0;
      end;
    End;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

function TInventario.InserirAuto:Boolean;
var
  CdCNC, CdINV: integer;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdINV := SCodigo;
  try
    append;
    try
      codigoCNC := CConfiguracao.CodigoCNC;
    except
    end;
    try
       codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      codigoINV := SCodigo;
    except
    end;
     try
       CodigoFUN   := ECodigoFUN.KeyValue;
    except
    end;
    try
       Data := StrToDateTime(EData.Text);
    except
    end;
    try
       Tipo := ETipo.ItemIndex;
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
      GeraLog(7800,CdCNC,CdINV);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TInventario.LimpaCampos;
begin
  Try
    if Estado <> 1 then
    ECodigoINV.Clear;
  Except
  End;
  Try
    ECodigoFUN.KeyValue:=0;
  Except
  End;
  Try
    EDataAlterado.Clear;
  Except
  End;
  Try
    if Estado = 1 then
      EData.Text:=DateToStr(CConfiguracao.Data)
    else
      EData.Clear;
  Except
  End;
  Try
    if Estado = 1 then
      ETipo.ItemIndex := 0
    else
      ETipo.ItemIndex := -1;
  Except
  End;
  Try
    if Estado <> 1 then
      ESituacao.Clear
    else
      ESituacao.Text := 'EM Aberto';
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
end;

{ Localiza um Inventário }
function TInventario.LocalizarCod(CdINV, CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdINV<>CodigoINV) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; INV_CODIGO', vararrayof([CdCNC, CdINV]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TInventario.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  Try
    EDataAlterado.Text:=DateTimeToStr(CConfiguracao.DataHora)
  Except
  End;
end;

procedure TInventario.PreparaInsercao;
begin
  ProximoCodigo('INV_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TInventario.deletarauto:Boolean;
var
  CdCNC, CdINV: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdINV := CodigoINV;
    if Delete then
    Begin
      GeraLog(7810, CdCNC, CdINV);
      RegistrarDel(CdCNC,1530(*Inventário*),CdINV);
      Result := True;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

end.
