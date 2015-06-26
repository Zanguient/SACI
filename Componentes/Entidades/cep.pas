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
unit CEP;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Usuario, Funcoes, Dbctrls, 
     Variants;

type
  TCEP = class(TSQuery)
    private
      { Private fields of TCEP }
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property Bairro2 }
        FBairro2 : String;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property CUsuario }
        FCUsuario : TUsuario;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodigoCEP }
        FCodigoCEP : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property Complemento }
        FComplemento : String;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property EBairro2 }
        FEBairro2 : TEdit;
        { Storage for property ECEP }
        FECEP : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoCEP }
        FECodigoCEP : TEdit;
        { Storage for property EComplemento }
        FEComplemento : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property ELogradouro }
        FELogradouro : TDBLookupComboBox;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property EUF }
        FEUF : TComboBox;
        { Storage for property Endereco }
        FEndereco : String;
        { Storage for property Logradouro }
        FLogradouro : Integer;
        { Storage for property Obs }
        FObs : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property UF }
        FUF : String;

      { Private methods of TCEP }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Bairro }
        function GetBairro : String;
        { Write method for property Bairro }
        procedure SetBairro(Value : String);
        { Read method for property Bairro2 }
        function GetBairro2 : String;
        { Write method for property Bairro2 }
        procedure SetBairro2(Value : String);
        { Read method for property CEP }
        function GetCEP : String;
        { Write method for property CEP }
        procedure SetCEP(Value : String);
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
        { Read method for property CodigoCEP }
        function GetCodigoCEP : Integer;
        { Write method for property CodigoCEP }
        procedure SetCodigoCEP(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property Complemento }
        function GetComplemento : String;
        { Write method for property Complemento }
        procedure SetComplemento(Value : String);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Endereco }
        function GetEndereco : String;
        { Write method for property Endereco }
        procedure SetEndereco(Value : String);
        { Read method for property Logradouro }
        function GetLogradouro : Integer;
        { Write method for property Logradouro }
        procedure SetLogradouro(Value : Integer);
        { Read method for property Obs }
        function GetObs : String;
        { Write method for property Obs }
        procedure SetObs(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property UF }
        function GetUF : String;
        { Write method for property UF }
        procedure SetUF(Value : String);

    protected
      { Protected fields of TCEP }

      { Protected methods of TCEP }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCEP }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TCEP }
        function Alterar(CdCNC,CdCEP,CdUSU, Plogradouro,PSituacao:Integer;PCEP,PEndereco,PBairro,PBairro2,PCidade,PUF,PComplemento,PObs:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function Inserir(CdCNC,CdCEP,CdUSU,PLogradouro,PSituacao:Integer; PCEP,PEndereco,PBairro,PBairro2,PCidade,PUF,PComplemento,PObs:String):boolean;
        function InserirAuto:Boolean;
        function LocalizaEndereco(PEndereco:string):Boolean;
        function LocalizarCod(CdCEP:integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TCEP }
        property Bairro : String read GetBairro write SetBairro;
        property Bairro2 : String read GetBairro2 write SetBairro2;
        property CEP : String read GetCEP write SetCEP;
        property CUsuario : TUsuario read FCUsuario write FCUsuario;
        property Cidade : String read GetCidade write SetCidade;
        { Código do CEP }
        property CodigoCEP : Integer read GetCodigoCEP write SetCodigoCEP;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property Complemento : String read GetComplemento write SetComplemento;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EBairro : TEdit read FEBairro write FEBairro;
        property EBairro2 : TEdit read FEBairro2 write FEBairro2;
        property ECEP : TMaskEdit read FECEP write FECEP;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoCEP : TEdit read FECodigoCEP write FECodigoCEP;
        property EComplemento : TEdit read FEComplemento write FEComplemento;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property ELogradouro : TDBLookupComboBox
             read FELogradouro write FELogradouro;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EUF : TComboBox read FEUF write FEUF;
        property Endereco : String read GetEndereco write SetEndereco;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property Obs : String read GetObs write SetObs;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property UF : String read GetUF write SetUF;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCEP with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCEP]);
end;

{ Method to set variable and property values and create objects }
procedure TCEP.AutoInitialize;
begin
     Estado := 0;
     FEBairro := nil;
     FEBairro2 := nil;
     FECEP := nil;
     FECidade := nil;
     FECodigoCEP := nil;
     FEComplemento := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEEndereco := nil;
     FELogradouro := nil;
     FEOBS := nil;
     FESituacao := nil;
     FEUF := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCEP.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FEBairro2 then
        FEBairro2 := nil;
     if AComponent = FECEP then
        FECEP := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoCEP then
        FECodigoCEP := nil;
     if AComponent = FEComplemento then
        FEComplemento := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FEUF then
        FEUF := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCEP.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bairro }
function TCEP.GetBairro : String;
begin
  try
    Result := Self.fieldByName('CEP_BAIRRO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TCEP.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_BAIRRO"!');
  end;
end;

{ Read method for property Bairro2 }
function TCEP.GetBairro2 : String;
begin
  try
    Result := Self.fieldByName('CEP_BAIRRO2').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro2 }
procedure TCEP.SetBairro2(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_BAIRRO2').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_BAIRRO2"!');
  end;
end;

{ Read method for property CEP }
function TCEP.GetCEP : String;
begin
  try
    Result := Self.fieldByName('CEP_CEP').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TCEP.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_CEP"!');
  end;
end;

{ Read method for property Cidade }
function TCEP.GetCidade : String;
begin
  try
    Result := Self.fieldByName('CEP_CIDADE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Cidade }
procedure TCEP.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_CIDADE"!');
  end;
end;

{ Read method for property CodigoCEP }
function TCEP.GetCodigoCEP : Integer;
begin
  try
    Result := Self.fieldByName('CEP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCEP }
procedure TCEP.SetCodigoCEP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CEP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CEP_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TCEP.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TCEP.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TCEP.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TCEP.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property Complemento }
function TCEP.GetComplemento : String;
begin
  try
    Result := Self.fieldByName('CEP_COMPLEMENTO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Complemento }
procedure TCEP.SetComplemento(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_COMPLEMENTO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_COMPLEMENTO"!');
  end;
end;

{ Read method for property DataAlterado }
function TCEP.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CEP_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TCEP.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TCEP.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('CEP_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TCEP.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_DT_CADASTRO"!');
  end;
end;

{ Read method for property Endereco }
function TCEP.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('CEP_ENDERECO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TCEP.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_ENDERECO"!');
  end;
end;

{ Read method for property Logradouro }
function TCEP.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('CEP_LOGRADOURO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Logradouro }
procedure TCEP.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_LOGRADOURO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_LOGRADOURO"!');
  end;
end;

{ Read method for property Obs }
function TCEP.GetObs : String;
begin
  try
    Result := Self.fieldByName('CEP_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Obs }
procedure TCEP.SetObs(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TCEP.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CEP_SITUACAO').asInteger;
  except
    result:= -1
  end;
end;

{ Write method for property Situacao }
procedure TCEP.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CEP_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CEP_SITUACAO"!');
    end;
end;

{ Read method for property UF }
function TCEP.GetUF : String;
begin
  try
    Result := Self.fieldByName('CEP_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property UF }
procedure TCEP.SetUF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CEP_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CEP_UF"!');
  end;
end;

function TCEP.Alterar(CdCNC,CdCEP,CdUSU, Plogradouro,PSituacao:Integer;PCEP,PEndereco,PBairro,PBairro2,PCidade,PUF,PComplemento,PObs:String):boolean;
begin
  result := false;
  If not(localizarCod(CdCEP)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      CodigoUSU      := CdUSU;
      DataAlterado   := CConfiguracao.DataHora;
      CEP            := PCEP;
      Logradouro     := PLogradouro;
      Endereco       := PEndereco;
      Bairro         := PBairro;
      Bairro2        := PBairro2;
      Cidade         := PCidade;
      UF             := PUF;
      Situacao       := PSituacao;
      Complemento    := PComplemento;
      Obs            := PObs;
      try
        Post;
        result := true;
        GeraLog(4010,CodigoCNC,CdCEP);
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TCEP.AlterarAuto:Boolean;
begin
  result := false;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE CEP SET '+
      '  USU_CODIGO='      +IntToStr(CUsuario.CodigoUSU)+
      ' ,CEP_CEP="'+ECEP.Text+
      '",CEP_DT_ALTERADO="'+MesDiaHora(EDataAlterado.Text)+
      '",CEP_LOGRADOURO="' +IntToStr(ELogradouro.KeyValue)+
      '",CEP_ENDERECO="'   +EEndereco.Text+
      '",CEP_BAIRRO="'     +EBairro.Text+
      '",CEP_BAIRRO2="'    +EBairro2.Text+
      '",CEP_CIDADE="'     +ECidade.Text+
      '",CEP_UF="'         +EUF.Text+
      '",CEP_COMPLEMENTO="'+EComplemento.Text+
      '",CEP_SITUACAO='    +IntToStr(ESituacao.ItemIndex)+
      ' ,CEP_OBSERVACAO="' +EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+' AND CEP_CODIGO='+IntToStr(CodigoCEP));
    Result:=True;
    GeraLog(4010,CodigoCNC,CodigoCEP);
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TCEP.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EDbgrid.Enabled     :=not Habilitar;
  except
  end;
  Try
    ECEP.Enabled        :=Habilitar;
  except
  end;
  Try
    ELogradouro.Enabled :=Habilitar;
  except
  end;
  Try
    EEndereco.Enabled   :=Habilitar;
  except
  end;
  Try
    EBairro.Enabled     :=Habilitar;
  except
  end;
  Try
    EBairro2.Enabled    :=Habilitar;
  except
  end;
  Try
    ECidade.Enabled     :=Habilitar;
  except
  end;
  Try
    EUF.Enabled         :=Habilitar;
  except
  end;
  try
    EComplemento.Enabled :=Habilitar;
  except
  end;
  try
    ESituacao.Enabled   :=Habilitar;
  except
  end;
  try
    EOBS.Enabled        :=Habilitar;
  except
  end;
end;

procedure TCEP.CancelaEdicao;
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

procedure TCEP.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    ECodigoCEP.Text  :=IntToStr(CodigoCEP);
  except
  end;
  try
    ECEP.Text        :=CEP;
  except
  end;
  try
    ELogradouro.KeyValue :=Logradouro;
  except
  end;
  try
    EEndereco.Text   :=Endereco;
  except
  end;
  try
    EBairro.Text     :=Bairro;
  except
  end;
  try
    EBairro2.Text    :=Bairro2;
  except
  end;
  try
    ECidade.Text    :=Cidade;
  except
  end;
  try
    ItemComboBox(EUf,UF);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text :=FormatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text :=FormatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ESituacao.ItemIndex :=Situacao;
  except
  end;
  try
    EComplemento.Text   :=Complemento;
  except
  end;
  try
    EOBS.Text           :=OBS;
  except
  end;
end;

constructor TCEP.Create(AOwner: TComponent);
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

destructor TCEP.Destroy;
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

function TCEP.FinalizaEdicao:Boolean;
var
  CEP:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if ECEP.Text = '' then
    mensagem:=mensagem+'CEP inválido!'+#13;
  if (ELogradouro.KeyValue = 0) or (ELogradouro.KeyValue = NULL)then
    mensagem:=mensagem+'Logradouro inválido!'+#13;
  if EEndereco.Text = '' then
    mensagem:=mensagem+'Endereço inválido!'+#13;
  if EBairro.Text = '' then
    mensagem:=mensagem+'Bairro inválido!'+#13;
  if ECidade.Text = '' then
    mensagem:=mensagem+'Cidade inválido!'+#13;
  if EUF.Text = '' then
    mensagem:=mensagem+'UF inválido!'+#13;
  if mensagem<>'' then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
  Else
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
        LocalizarCod(SCodigo);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else if Estado=2 then
    Begin
      CEP:=CodigoCEP;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(CEP);
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

function TCEP.Inserir(CdCNC,CdCEP,CdUSU,PLogradouro,PSituacao:Integer; PCEP,PEndereco,PBairro,PBairro2,PCidade,PUF,PComplemento,PObs:String):boolean;
Var
  Cod:Integer;
begin
  result := false;
  if CdCEP=0 then
    Cod    := ProximoCodigo('CEP_CODIGO')
  else
    Cod    := CdCEP;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  else
  begin
    try
      Insert;
      CodigoCNC      := CdCNC;
      CodigoUSU      := CdUSU;
      CodigoCEP      := Cod;
      DataCadastro   := CConfiguracao.DataHora;
      CEP            := PCEP;
      Logradouro     := PLogradouro;
      Endereco       := PEndereco;
      Bairro         := PBairro;
      Bairro2        := PBairro2;
      Cidade         := PCidade;
      UF             := PUF;
      Situacao       := PSituacao;
      Complemento    := PComplemento;
      Obs            := PObs;
      try
        Post;
        result:=true;
        GeraLog(4010,CdCNC,Cod);
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TCEP.InserirAuto:Boolean;
begin
  result := false;
  If (localizarCod(SCodigo)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      append;
      Try
        CodigoCNC    :=CConfiguracao.CodigoCNC;
      except
      end;
      Try
        CodigoCEP    :=SCodigo;
      except
      end;
      Try
        CodigoUSU    :=CUsuario.CodigoUSU;
      except
      end;
      try
        CEP          := ECEP.Text
      except
      end;
      try
        Logradouro   := ELogradouro.KeyValue
      except
      end;
      try
        Endereco     := EEndereco.Text
      except
      end;
      try
        Bairro       := EBairro.Text
      except
      end;
      try
        Bairro2      := EBairro2.Text
      except
      end;
      try
        Cidade       := ECidade.Text
      except
      end;
      try
        UF           := EUF.Text
      except
      end;
      try
        DataCadastro := StrToDateTime(EDataCadastro.Text);
      except
      end;
      try
        Situacao     := ESituacao.ItemIndex
      except
      end;
      try
        Complemento  :=EComplemento.Text;
      except
      end;
      try
        OBS          :=EOBS.Text;
      except
      end;
      try
        Post;
        result:=True;
        GeraLog(4010,CConfiguracao.CodigoCNC,SCodigo);
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TCEP.LocalizaEndereco(PEndereco:string):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
var
  aux:TDataSetNotifyEvent;
begin
  Aux:=AfterScroll;
  AfterScroll:=nil;
  If (PEndereco<>Endereco) Then
    If locate('CEP_Endereco', PEndereco, [loCaseInsensitive, loPartialKey]) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
  AfterScroll:=Aux;
end;

function TCEP.LocalizarCod(CdCEP:integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
var
  aux:TDataSetNotifyEvent;
begin
  Aux:=AfterScroll;
  AfterScroll:=nil;
  If (CdCEP<>CodigoCEP) Then
    If locate('CEP_CODIGO', CDCEP, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
  AfterScroll:=Aux;
end;

procedure TCEP.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TCEP.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('CEP_CODIGO');
  Try
    ECodigoCEP.Text:=IntToStr(SCodigo);
  except
  end;
  Try
    ECEP.Clear;
  except
  end;
  Try
    ELogradouro.KeyValue := 0;
  except
  end;
  Try
    EEndereco.Clear;
  except
  end;
  Try
    EBairro.Clear;
  except
  end;
  Try
    EBairro2.Clear;
  except
  end;
  Try
    ECidade.Text := CConfiguracao.Cidade;
  except
  end;
  Try
    ItemComboBox(EUF,CConfiguracao.UF);
  except
  end;
  try
    EDataCadastro.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    EComplemento.Clear;
  except
  end;
  try
    ESituacao.ItemIndex := 0;
  except
  end;
  try
    EObs.Clear;
  except
  end;
  Estado:=1;
  AtualizaControles(True);
end;

function TCEP.deletarauto:Boolean;
var
  CdCNC,CdCEP:integer;
begin
  result := false;
  try
    CdCNC:=CodigoCNC;
    CdCEP:=CodigoCEP;
    if Delete then
    Begin
      result:=true;
      GeraLog(4010,CdCNC,CdCEP);
      if TQuery(Self).IsEmpty then
      begin
        Try
          ECodigoCEP.Clear;
        except
        end;
        Try
          ECEP.Clear;
        except
        end;
        Try
          ELogradouro.KeyValue := 0;
        except
        end;
        Try
          EEndereco.Clear;
        except
        end;
        Try
          EBairro.Clear;
        except
        end;
        Try
          EBairro2.Clear;
        except
        end;
        Try
          ECidade.Clear;
        except
        end;
        Try
          EUF.ItemIndex := -1;
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
          ESituacao.ItemIndex := -1;
        except
        end;
        try
          EObs.Clear;
        except
        end;
      end;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
