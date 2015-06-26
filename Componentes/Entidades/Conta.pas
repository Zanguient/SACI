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
unit Conta;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TConta = class(TSQuery)
    private
      { Private fields of TConta }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoConta }
        FCodigoConta : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property ENumeroAgencia }
        FENumeroAgencia : TDBLookupComboBox;
        { Storage for property ENumeroBanco }
        FENumeroBanco : TDBLookupComboBox;
        { Storage for property ENumeroConta }
        FENumeroConta : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ESaldo }
        FESaldo : TEdit;
        { Storage for property ESituacao }
        FESituacao : TCombobox;
        { Storage for property NumeroAgencia }
        FNumeroAgencia : Integer;
        { Storage for property NumeroBanco }
        FNumeroBanco : Integer;
        { Storage for property NumeroConta }
        FNumeroConta : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Saldo }
        FSaldo : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TConta }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoConta }
        function GetCodigoConta : Integer;
        { Write method for property CodigoConta }
        procedure SetCodigoConta(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property NumeroAgencia }
        function GetNumeroAgencia : Integer;
        { Write method for property NumeroAgencia }
        procedure SetNumeroAgencia(Value : Integer);
        { Read method for property NumeroBanco }
        function GetNumeroBanco : Integer;
        { Write method for property NumeroBanco }
        procedure SetNumeroBanco(Value : Integer);
        { Read method for property NumeroConta }
        function GetNumeroConta : Integer;
        { Write method for property NumeroConta }
        procedure SetNumeroConta(Value : Integer);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Saldo }
        function GetSaldo : Double;
        { Write method for property Saldo }
        procedure SetSaldo(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TConta }

      { Protected methods of TConta }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TConta }

      { Public methods of TConta }
        { Altera um Cliente }
        function Alterar(CdCNC,PNumeroConta,PNumeroBanco,PNumeroAgencia,PSITUACAO: integer;PSALDO:Double; POBS:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,PNumeroConta:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdConta,PNumeroConta,PNumeroBanco, PNumeroAgencia,PSITUACAO:integer;PSALDO: Double;POBS:String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCod(CdConta,CdCNC:integer):boolean;
        { Localiza um cliente }
        function LocalizarNumero(PNumeroConta,CDCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TConta }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código da conta }
        property CodigoConta : Integer
             read GetCodigoConta write SetCodigoConta;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property ENumeroAgencia : TDBLookupComboBox
             read FENumeroAgencia write FENumeroAgencia;
        property ENumeroBanco : TDBLookupComboBox
             read FENumeroBanco write FENumeroBanco;
        property ENumeroConta : TEdit read FENumeroConta write FENumeroConta;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ESaldo : TEdit read FESaldo write FESaldo;
        property ESituacao : TCombobox read FESituacao write FESituacao;
        property NumeroAgencia : Integer
             read GetNumeroAgencia write SetNumeroAgencia;
        property NumeroBanco : Integer
             read GetNumeroBanco write SetNumeroBanco;
        property NumeroConta : Integer
             read GetNumeroConta write SetNumeroConta;
        property OBS : String read GetOBS write SetOBS;
        property Saldo : Double read GetSaldo write SetSaldo;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TConta with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TConta]);
end;

{ Method to set variable and property values and create objects }
procedure TConta.AutoInitialize;
begin
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FENumeroAgencia := nil;
     FENumeroBanco := nil;
     FENumeroConta := nil;
     FEOBS := nil;
     FESaldo := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TConta.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FENumeroAgencia then
        FENumeroAgencia := nil;
     if AComponent = FENumeroBanco then
        FENumeroBanco := nil;
     if AComponent = FENumeroConta then
        FENumeroConta := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESaldo then
        FESaldo := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TConta.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TConta.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TConta.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoConta }
function TConta.GetCodigoConta : Integer;
begin
  try
    Result := Self.fieldByName('CBN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoConta }
procedure TConta.SetCodigoConta(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CBN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CBN_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TConta.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TConta.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TConta.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CBN_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TConta.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CBN_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CBN_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TConta.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('CBN_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TConta.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CBN_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CBN_DT_CADASTRO"!');
  end;
end;

{ Read method for property NumeroAgencia }
function TConta.GetNumeroAgencia : Integer;
begin
  try
    Result := Self.fieldByName('AGN_NUMERO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NumeroAgencia }
procedure TConta.SetNumeroAgencia(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGN_NUMERO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGN_NUMERO"!');
    end;
end;

{ Read method for property NumeroBanco }
function TConta.GetNumeroBanco : Integer;
begin
  try
    Result := Self.fieldByName('BNC_NUMERO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property NumeroBanco }
procedure TConta.SetNumeroBanco(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BNC_NUMERO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BNC_NUMERO"!');
    end;
end;

{ Read method for property NumeroConta }
function TConta.GetNumeroConta : Integer;
begin
  try
    Result := Self.fieldByName('CBN_NUMERO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NumeroConta }
procedure TConta.SetNumeroConta(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CBN_NUMERO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CBN_NUMERO"!');
    end;
end;

{ Read method for property OBS }
function TConta.GetOBS : String;
begin
  try
    Result := Self.fieldByName('CBN_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TConta.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CBN_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CBN_OBSERVACAO"!');
  end;
end;

{ Read method for property Saldo }
function TConta.GetSaldo : Double;
begin
  try
    Result := Self.fieldByName('CBN_SALDO').asfloat;
  except
    result:= 0
  end;
end;

{ Write method for property Saldo }
procedure TConta.SetSaldo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CBN_SALDO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CBN_SALDO"!');
    end;
end;

{ Read method for property Situacao }
function TConta.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CBN_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TConta.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CBN_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CBN_SITUACAO"!');
  end;
end;

{ Altera um Cliente }
function TConta.Alterar(CdCNC,PNumeroConta,PNumeroBanco,PNumeroAgencia,PSITUACAO: integer;PSALDO:Double; POBS:String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarNumero(PNumeroConta,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := CConfiguracao.DataHora;
      Saldo          := PSaldo;
      Situacao       := PSITUACAO;
      Obs            := POBS;
      NumeroAgencia  := PNumeroAgencia;
      NumeroBanco    := PNumeroBanco;
      NumeroConta    := PNumeroConta;

      try
        Post;
        Result := True;
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

function TConta.AlterarAuto:Boolean;
begin
    try
      edit;
      try
        CodigoConta := StrToInt(ENumeroConta.Text);
      except
      end;
      try
        CodigoUSU  := CConfiguracao.CodigoUSU;
      except
      end;
      try
        DataAlterado  := StrTODateTime(EDataAlterado.Text);
      except
      end;
      try
         Saldo := StrToFloat(ESaldo.Text);
      except
      end;
      try
         Situacao := ESITUACAO.itemindex;
      except
      end;
      try
         Obs := EOBS.Text;
      except
      end;
      try
        NumeroAgencia := EnumeroAgencia.KeyValue;
      except
      end;
      try
        NumeroBanco := EnumeroBanco.KeyValue;
      except
      end;
      try
         NumeroConta := StrToInt(ENumeroConta.Text);
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

procedure TConta.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    ESITUACAO.Enabled         :=Habilitar;
  except
  end;
  try
    EOBS.Enabled              :=Habilitar;
  except
  end;
  try
    ESaldo.Enabled            :=Habilitar;
  except
  end;
  try
    ENumeroBanco.Enabled      :=NOT Habilitar;
  except
  end;
  try
    ENumeroAgencia.Enabled    :=NOT Habilitar;
  except
  end;
  try
    ENumeroConta.Enabled      :=Habilitar;
  except
  end;
end;

procedure TConta.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TConta.CarregaDados;
begin
  try
    if DataCadastro > 0 then
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  Try
    ENumeroConta.Text         :=IntToStr(NumeroConta);
  except
  end;
  try
    ESaldo.Text               :=format('%.2f',[Saldo]);
  except
  end;
  try
    ESITUACAO.itemindex       :=Situacao;
  except
  end;
  try
    EOBS.Text                 :=Obs;
  except
  end;
end;

constructor TConta.Create(AOwner: TComponent);
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

function TConta.Deletar(CdCNC,PNumeroConta:Integer):Boolean;
var
  CdCBN: integer;
begin
  Result := False;
  If not(localizarNumero(PNumeroConta,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCBN := CodigoConta;
      if Delete then
      Begin
        Result := True;
        GeraLog(310,CdCNC,CdCBN);
        if Tquery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TConta.Destroy;
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

function TConta.FinalizaEdicao:Boolean;
var
  VNumeroConta, cdcnc:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  If not VerificafloatBranco(ESaldo.text) Then
    mensagem:=mensagem+'Saldo digitado incorretamente!';
  If mensagem <>'' Then
    ShowMessage(mensagem)
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
        LocalizarCod(SCodigo,CodigoCNC);
        Estado := 0;
        AtualizaControles(false);
      end;
    End
    Else If Estado=2 then
    Begin
      VNumeroConta:=NumeroConta;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarNumero(VNumeroConta, cdcnc);
        Estado := 0;
        AtualizaControles(false);
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Cliente }
function TConta.Inserir(CdCNC,CdConta,PNumeroConta,PNumeroBanco, PNumeroAgencia,PSITUACAO:integer;PSALDO: Double;POBS:String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdConta=0 then
    Cod    := ProximoCodigo('CBN_CODIGO')
  else
    Cod    := CdConta;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
    try
      INSERT;
      CodigoConta    := Cod;
      CodigoCNC      := CdCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataCadastro   := CConfiguracao.DataHora;
      Situacao       := PSITUACAO;
      Obs            := POBS;
      Saldo          := PSALDO;
      NumeroAgencia  := PNumeroAgencia;
      NumeroBanco    := PNumeroBanco;
      NumeroConta    := PNumeroConta;

      try
        Post;
        Result := True;
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

function TConta.InserirAuto:Boolean;
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
        CodigoUSU  := CConfiguracao.CodigoUSU;
      except
      end;
      try
        DataCadastro  := StrTODateTime(EDataCadastro.Text);
      except
      end;
      try
        NumeroAgencia := EnumeroAgencia.KeyValue;
      except
      end;
      try
        CodigoConta := StrToInt(ENumeroConta.Text);
      except
      end;
      try
        NumeroBanco := EnumeroBanco.KeyValue;
      except
      end;
      try
         NumeroConta := StrToInt(ENumeroConta.Text);
      except
      end;
      try
        CodigoCNC      := CConfiguracao.CodigoCNC;
      except
      end;
      try
         Situacao      := ESITUACAO.itemindex;
      except
      end;
      try
         Obs           := EOBS.Text;
      except
      end;
      try
         Saldo         := StrToFloat(ESaldo.Text);
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

procedure TConta.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  Except
  End;
  Try
    EDataAlterado.Clear;
  Except
  End;
  Try
    ENumeroConta.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ESITUACAO.ItemIndex := -1
    else
      ESITUACAO.ItemIndex := 0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
  try
    ESaldo.Clear;
  except
  end;
end;

function TConta.LocalizarCod(CdConta,CdCNC:integer):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdConta<>CodigoConta) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; CBN_CODIGO', vararrayof([CdCNC, CdConta]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;

end;

{ Localiza um cliente }
function TConta.LocalizarNumero(PNumeroConta,CDCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (PNumeroConta<>NumeroConta) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;CBN_NUMERO', vararrayof([CDCNC, PNumeroConta]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TConta.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
  Try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  Except
  End;
end;

procedure TConta.PreparaInsercao;
begin
  ProximoCodigo('CBN_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TConta.deletarauto:Boolean;
var
  CdCNC, CdCBN:integer;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdCBN := CodigoConta;
  try
    if Delete then
    Begin
      result:=true;
      GeraLog(310,CdCNC,CdCBN);
      if Tquery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
