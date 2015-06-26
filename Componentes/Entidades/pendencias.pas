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
unit Pendencias;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Funcoes;

type
  TPendencias = class(TSQuery)
    private
      { Private fields of TPendencias }
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoAGF }
        FCodigoAGF : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoFPG }
        FCodigoFPG : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoPEN }
        FCodigoPEN : Integer;
        { Storage for property CodigoPRD1 }
        FCodigoPRD1 : Integer;
        { Storage for property CodigoPRD2 }
        FCodigoPRD2 : Integer;
        { Storage for property CodigoPRD3 }
        FCodigoPRD3 : Integer;
        { Storage for property CodigoTRC }
        FCodigoTRC : Integer;
        { Storage for property CodigoUSULiberou }
        FCodigoUSULiberou : Integer;
        { Storage for property CreditoExtorno }
        FCreditoExtorno : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataReferencia }
        FDataReferencia : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodigoAGF }
        FECodigoAGF : TDBLookupComboBox;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoFPG }
        FECodigoFPG : TDBLookupComboBox;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoPEN }
        FECodigoPEN : TEdit;
        { Storage for property ECodigoPRD1 }
        FECodigoPRD1 : TEdit;
        { Storage for property ECodigoPRD2 }
        FECodigoPRD2 : TEdit;
        { Storage for property ECodigoPRD3 }
        FECodigoPRD3 : TEdit;
        { Storage for property ECodigoTRC }
        FECodigoTRC : TEdit;
        { Storage for property ECreditoExtorno }
        FECreditoExtorno : TComboBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataReferencia }
        FEDataReferencia : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EPedidoCNC }
        FEPedidoCNC : TEdit;
        { Storage for property EPrecoPRD1 }
        FEPrecoPRD1 : TEdit;
        { Storage for property EPrecoPRD2 }
        FEPrecoPRD2 : TEdit;
        { Storage for property EPrecoPRD3 }
        FEPrecoPRD3 : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipo }
        FETipo : TComboBox;
        { Storage for property ETipoPag }
        FETipoPag : TDBLookupComboBox;
        { Storage for property EValorTRC }
        FEValorTRC : TEdit;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property PedidoCNC }
        FPedidoCNC : Integer;
        { Storage for property PrecoPRD1 }
        FPrecoPRD1 : Double;
        { Storage for property PrecoPRD2 }
        FPrecoPRD2 : Double;
        { Storage for property PrecoPRD3 }
        FPrecoPRD3 : Double;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property TipoPag }
        FTipoPag : Integer;
        { Storage for property ValorTRC }
        FValorTRC : Double;

      { Private methods of TPendencias }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Write method for property ClienteCNC }
        procedure SetClienteCNC(Value : Integer);
        { Read method for property CodigoAGF }
        function GetCodigoAGF : Integer;
        { Write method for property CodigoAGF }
        procedure SetCodigoAGF(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoFPG }
        function GetCodigoFPG : Integer;
        { Write method for property CodigoFPG }
        procedure SetCodigoFPG(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
        { Read method for property CodigoPEN }
        function GetCodigoPEN : Integer;
        { Write method for property CodigoPEN }
        procedure SetCodigoPEN(Value : Integer);
        { Read method for property CodigoPRD1 }
        function GetCodigoPRD1 : Integer;
        { Write method for property CodigoPRD1 }
        procedure SetCodigoPRD1(Value : Integer);
        { Read method for property CodigoPRD2 }
        function GetCodigoPRD2 : Integer;
        { Write method for property CodigoPRD2 }
        procedure SetCodigoPRD2(Value : Integer);
        { Read method for property CodigoPRD3 }
        function GetCodigoPRD3 : Integer;
        { Write method for property CodigoPRD3 }
        procedure SetCodigoPRD3(Value : Integer);
        { Read method for property CodigoTRC }
        function GetCodigoTRC : Integer;
        { Write method for property CodigoTRC }
        procedure SetCodigoTRC(Value : Integer);
        { Read method for property CodigoUSULiberou }
        function GetCodigoUSULiberou : Integer;
        { Read method for property CreditoExtorno }
        function GetCreditoExtorno : Integer;
        { Write method for property CreditoExtorno }
        procedure SetCreditoExtorno(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DataReferencia }
        function GetDataReferencia : TDateTime;
        { Write method for property DataReferencia }
        procedure SetDataReferencia(Value : TDateTime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property PedidoCNC }
        function GetPedidoCNC : Integer;
        { Write method for property PedidoCNC }
        procedure SetPedidoCNC(Value : Integer);
        { Read method for property PrecoPRD1 }
        function GetPrecoPRD1 : Double;
        { Write method for property PrecoPRD1 }
        procedure SetPrecoPRD1(Value : Double);
        { Read method for property PrecoPRD2 }
        function GetPrecoPRD2 : Double;
        { Write method for property PrecoPRD2 }
        procedure SetPrecoPRD2(Value : Double);
        { Read method for property PrecoPRD3 }
        function GetPrecoPRD3 : Double;
        { Write method for property PrecoPRD3 }
        procedure SetPrecoPRD3(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);
        { Read method for property TipoPag }
        function GetTipoPag : Integer;
        { Write method for property TipoPag }
        procedure SetTipoPag(Value : Integer);
        { Read method for property ValorTRC }
        function GetValorTRC : Double;
        { Write method for property ValorTRC }
        procedure SetValorTRC(Value : Double);

    protected
      { Protected fields of TPendencias }

      { Protected methods of TPendencias }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TPendencias }

      { Public methods of TPendencias }
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdCNC,CdPEN:Integer):Boolean;
        procedure PreparaInsercao;

    published
      { Published properties of TPendencias }
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        property CodigoAGF : Integer read GetCodigoAGF write SetCodigoAGF;
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoFPG : Integer read GetCodigoFPG write SetCodigoFPG;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        property CodigoPEN : Integer read GetCodigoPEN write SetCodigoPEN;
        property CodigoPRD1 : Integer read GetCodigoPRD1 write SetCodigoPRD1;
        property CodigoPRD2 : Integer read GetCodigoPRD2 write SetCodigoPRD2;
        property CodigoPRD3 : Integer read GetCodigoPRD3 write SetCodigoPRD3;
        property CodigoTRC : Integer read GetCodigoTRC write SetCodigoTRC;
        property CodigoUSULiberou : Integer
             read GetCodigoUSULiberou write FCodigoUSULiberou;
        property CreditoExtorno : Integer
             read GetCreditoExtorno write SetCreditoExtorno;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataReferencia : TDateTime
             read GetDataReferencia write SetDataReferencia;
        property Descricao : String read GetDescricao write SetDescricao;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodigoAGF : TDBLookupComboBox
             read FECodigoAGF write FECodigoAGF;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoFPG : TDBLookupComboBox
             read FECodigoFPG write FECodigoFPG;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoPEN : TEdit read FECodigoPEN write FECodigoPEN;
        property ECodigoPRD1 : TEdit read FECodigoPRD1 write FECodigoPRD1;
        property ECodigoPRD2 : TEdit read FECodigoPRD2 write FECodigoPRD2;
        property ECodigoPRD3 : TEdit read FECodigoPRD3 write FECodigoPRD3;
        property ECodigoTRC : TEdit read FECodigoTRC write FECodigoTRC;
        property ECreditoExtorno : TComboBox
             read FECreditoExtorno write FECreditoExtorno;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataReferencia : TMaskEdit
             read FEDataReferencia write FEDataReferencia;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EPedidoCNC : TEdit read FEPedidoCNC write FEPedidoCNC;
        property EPrecoPRD1 : TEdit read FEPrecoPRD1 write FEPrecoPRD1;
        property EPrecoPRD2 : TEdit read FEPrecoPRD2 write FEPrecoPRD2;
        property EPrecoPRD3 : TEdit read FEPrecoPRD3 write FEPrecoPRD3;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipo : TComboBox read FETipo write FETipo;
        property ETipoPag : TDBLookupComboBox read FETipoPag write FETipoPag;
        property EValorTRC : TEdit read FEValorTRC write FEValorTRC;
        property OBS : String read GetOBS write SetOBS;
        property PedidoCNC : Integer read GetPedidoCNC write SetPedidoCNC;
        property PrecoPRD1 : Double read GetPrecoPRD1 write SetPrecoPRD1;
        property PrecoPRD2 : Double read GetPrecoPRD2 write SetPrecoPRD2;
        property PrecoPRD3 : Double read GetPrecoPRD3 write SetPrecoPRD3;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;
        property TipoPag : Integer read GetTipoPag write SetTipoPag;
        property ValorTRC : Double read GetValorTRC write SetValorTRC;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TPendencias with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TPendencias]);
end;

{ Method to set variable and property values and create objects }
procedure TPendencias.AutoInitialize;
begin
     FEClienteCNC := nil;
     FECodigoAGF := nil;
     FECodigoCLI := nil;
     FECodigoCNC := nil;
     FECodigoFPG := nil;
     FECodigoFUN := nil;
     FECodigoPDV := nil;
     FECodigoPEN := nil;
     FECodigoPRD1 := nil;
     FECodigoPRD2 := nil;
     FECodigoPRD3 := nil;
     FECodigoTRC := nil;
     FECreditoExtorno := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataReferencia := nil;
     FEDescricao := nil;
     FEOBS := nil;
     FEPedidoCNC := nil;
     FEPrecoPRD1 := nil;
     FEPrecoPRD2 := nil;
     FEPrecoPRD3 := nil;
     FESituacao := nil;
     FETipo := nil;
     FETipoPag := nil;
     FEValorTRC := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TPendencias.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoAGF then
        FECodigoAGF := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoFPG then
        FECodigoFPG := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoPEN then
        FECodigoPEN := nil;
     if AComponent = FECodigoPRD1 then
        FECodigoPRD1 := nil;
     if AComponent = FECodigoPRD2 then
        FECodigoPRD2 := nil;
     if AComponent = FECodigoPRD3 then
        FECodigoPRD3 := nil;
     if AComponent = FECodigoTRC then
        FECodigoTRC := nil;
     if AComponent = FECreditoExtorno then
        FECreditoExtorno := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataReferencia then
        FEDataReferencia := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEPedidoCNC then
        FEPedidoCNC := nil;
     if AComponent = FEPrecoPRD1 then
        FEPrecoPRD1 := nil;
     if AComponent = FEPrecoPRD2 then
        FEPrecoPRD2 := nil;
     if AComponent = FEPrecoPRD3 then
        FEPrecoPRD3 := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FETipoPag then
        FETipoPag := nil;
     if AComponent = FEValorTRC then
        FEValorTRC := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TPendencias.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ClienteCNC }
function TPendencias.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ClienteCNC }
procedure TPendencias.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoAGF }
function TPendencias.GetCodigoAGF : Integer;
begin
  try
    Result := Self.fieldByName('AGF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoAGF }
procedure TPendencias.SetCodigoAGF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_CODIGO"!');
    end;
end;

{ Read method for property CodigoCLI }
function TPendencias.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCLI }
procedure TPendencias.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPG }
function TPendencias.GetCodigoFPG : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFPG }
procedure TPendencias.SetCodigoFPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TPendencias.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFUN }
procedure TPendencias.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoPDV }
function TPendencias.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPDV }
procedure TPendencias.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
    end;
end;

{ Read method for property CodigoPEN }
function TPendencias.GetCodigoPEN : Integer;
begin
  try
    Result := Self.fieldByName('PEN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPEN }
procedure TPendencias.SetCodigoPEN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PEN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PEN_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD1 }
function TPendencias.GetCodigoPRD1 : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO_1').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPRD1 }
procedure TPendencias.SetCodigoPRD1(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO_1').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO_1"!');
    end;
end;

{ Read method for property CodigoPRD2 }
function TPendencias.GetCodigoPRD2 : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO_2').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPRD2 }
procedure TPendencias.SetCodigoPRD2(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO_2').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO_2"!');
    end;
end;

{ Read method for property CodigoPRD3 }
function TPendencias.GetCodigoPRD3 : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO_3').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPRD3 }
procedure TPendencias.SetCodigoPRD3(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO_3').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO_3"!');
    end;
end;

{ Read method for property CodigoTRC }
function TPendencias.GetCodigoTRC : Integer;
begin
  try
    Result := Self.fieldByName('TRC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTRC }
procedure TPendencias.SetCodigoTRC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSULiberou }
function TPendencias.GetCodigoUSULiberou : Integer;
begin
  try
    Result := Self.fieldByName('PEN_USU_LIBEROU').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CreditoExtorno }
function TPendencias.GetCreditoExtorno : Integer;
begin
  try
    Result := Self.fieldByName('PEN_CREDITO_EXTORNO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CreditoExtorno }
procedure TPendencias.SetCreditoExtorno(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PEN_CREDITO_EXTORNO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PEN_CREDITO_EXTORNO"!');
    end;
end;

{ Read method for property DataAlterado }
function TPendencias.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('PEN_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TPendencias.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_DT_ALTERADO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TPendencias.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('PEN_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TPendencias.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_DT_CADASTRO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataReferencia }
function TPendencias.GetDataReferencia : TDateTime;
begin
  try
    Result := Self.fieldByName('PEN_DT_REFERENCIA').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataReferencia }
procedure TPendencias.SetDataReferencia(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_DT_REFERENCIA').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_DT_REFERENCIA"!');
  end;
end;

{ Read method for property Descricao }
function TPendencias.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('PEN_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TPendencias.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_DESCRICAO"!');
  end;
end;

{ Read method for property OBS }
function TPendencias.GetOBS : String;
begin
  try
    Result := Self.fieldByName('PEN_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property OBS }
procedure TPendencias.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_OBSERVACAO"!');
  end;
end;

{ Read method for property PedidoCNC }
function TPendencias.GetPedidoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_PEDIDO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property PedidoCNC }
procedure TPendencias.SetPedidoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_PEDIDO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_PEDIDO"!');
    end;
end;

{ Read method for property PrecoPRD1 }
function TPendencias.GetPrecoPRD1 : Double;
begin
  try
    Result := Self.fieldByName('PEN_PRECO_PRD1').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoPRD1 }
procedure TPendencias.SetPrecoPRD1(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_PRECO_PRD1').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_PRECO_PRD1"!');
  end;
end;

{ Read method for property PrecoPRD2 }
function TPendencias.GetPrecoPRD2 : Double;
begin
  try
    Result := Self.fieldByName('PEN_PRECO_PRD2').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoPRD2 }
procedure TPendencias.SetPrecoPRD2(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_PRECO_PRD2').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_PRECO_PRD2"!');
  end;
end;

{ Read method for property PrecoPRD3 }
function TPendencias.GetPrecoPRD3 : Double;
begin
  try
    Result := Self.fieldByName('PEN_PRECO_PRD3').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoPRD3 }
procedure TPendencias.SetPrecoPRD3(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_PRECO_PRD3').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_PRECO_PRD3"!');
  end;
end;

{ Read method for property Situacao }
function TPendencias.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('PEN_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TPendencias.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_SITUACAO"!');
  end;
end;

{ Read method for property Tipo }
function TPendencias.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('PEN_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Tipo }
procedure TPendencias.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PEN_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PEN_TIPO"!');
    end;
end;

{ Read method for property TipoPag }
function TPendencias.GetTipoPag : Integer;
begin
  try
    Result := Self.fieldByName('PEN_TIPO_PAG').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TipoPag }
procedure TPendencias.SetTipoPag(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PEN_TIPO_PAG').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PEN_TIPO_PAG"!');
    end;
end;

{ Read method for property ValorTRC }
function TPendencias.GetValorTRC : Double;
begin
  try
    Result := Self.fieldByName('PEN_VALOR_TRC').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property ValorTRC }
procedure TPendencias.SetValorTRC(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PEN_VALOR_TRC').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PEN_VALOR_TRC"!');
  end;
end;

procedure TPendencias.AtualizaControles(Habilitar:Boolean);
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
    ECodigoFUN.Enabled          :=Habilitar;
  except
  end;
  try
    ETipo.Enabled          :=Habilitar;
  except
  end;
  try
    ECodigoPDV.Enabled          :=Habilitar;
  except
  end;
  try
    ETipoPag.Enabled          :=Habilitar;
  except
  end;
  try
    ECodigoFPG.Enabled          :=Habilitar;
  except
  end;
  try
    ECodigoAGF.Enabled          :=Habilitar;
  except
  end;
  try
    ECodigoCLI.Enabled          :=Habilitar;
  except
  end;
  try
    EOBS.Enabled                :=Habilitar;
  except
  end;
end;

procedure TPendencias.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TPendencias.CarregaDados;
begin
  Try
    ECodigoPEN.Text           :=IntToStr(CodigoPEN);
  except
  end;
  try
    ECodigoFUN.KeyValue         := CodigoFUN;
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    if DataReferencia > 0 then
      EDataReferencia.Text := formatDateTime('DD/MM/YYYY',DataReferencia)
    else
      EDataReferencia.Clear;
  except
  end;
  try
    ETipo.ItemIndex         := Tipo;
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    ECreditoExtorno.ItemIndex         := CreditoExtorno;
  except
  end;
  try
    EPedidoCNC.Text           :=IntToStr(PedidoCNC);
  except
  end;
  try
    ECodigoPDV.Text           :=IntToStr(CodigoPDV);
  except
  end;
  try
    EClienteCNC.Text           :=IntToStr(ClienteCNC);
  except
  end;
  try
    ECodigoCLI.Text           :=IntToStr(CodigoCLI);
  except
  end;
  try
    ETipoPag.KeyValue           :=TipoPag;
  except
  end;
  try
    ECodigoFPG.KeyValue           :=CodigoFPG;
  except
  end;
  try
    ECodigoAGF.KeyValue           :=CodigoAGF;
  except
  end;
  try
    if CodigoPRD1 > 0 then
      ECodigoPRD1.Text           :=IntToStr(CodigoPRD1)
    else
      ECodigoPRD1.Clear;
  except
  end;
  try
    if PrecoPRD1 > 0 then
      EPrecoPRD1.Text           :=Format('%.2f',[PrecoPRD1])
    else
      EPrecoPRD1.Clear;
  except
  end;
  try
    if CodigoPRD2 > 0 then
      ECodigoPRD2.Text           :=IntToStr(CodigoPRD2)
    else
      ECodigoPRD2.Clear;
  except
  end;
  try
    if PrecoPRD2 > 0 then
      EPrecoPRD2.Text           :=Format('%.2f',[PrecoPRD2])
    else
      EPrecoPRD2.Clear;
  except
  end;
  try
    if CodigoPRD3 > 0 then
      ECodigoPRD3.Text           :=IntToStr(CodigoPRD3)
    else
      ECodigoPRD3.Clear;
  except
  end;
  try
    if PrecoPRD3 > 0 then
      EPrecoPRD3.Text           :=Format('%.2f',[PrecoPRD3])
    else
      EPrecoPRD3.Clear;
  except
  end;
  try
    if CodigoTRC > 0 then
      ECodigoTRC.Text           :=IntToStr(CodigoTRC)
    else
      ECodigoTRC.Clear;
  except
  end;
  try
    if ValorTRC > 0 then
      EValorTRC.Text           :=Format('%.2f',[ValorTRC])
    else
      EValorTRC.Clear;
  except
  end;
  try
    ESituacao.ItemIndex     := Situacao;
  except
  end;
  try
    EOBS.Text                 :=OBS;
  except
  end;
end;

constructor TPendencias.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'PENDENCIA';

     { Code to perform other tasks when the component is created }

end;

destructor TPendencias.Destroy;
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

function TPendencias.FinalizaEdicao:Boolean;
var
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  if ECodigoFUN.Text = '' then
    mensagem:=mensagem+'Responsável inválido!'+#13;
  If EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if not VerificaDataBranco(EDataReferencia.text) then
    mensagem:=mensagem+'Data de Referência inválida!'+#13;
  if (not VerificaInteiroBranco(ECodigoCLI.text)) or
     (StrToInt(ECodigoCLI.Text)<0) then
    mensagem:=mensagem+'Código do Cliente inválido!'+#13;
  if (not VerificaInteiroBranco(ECodigoPDV.text)) or
     (StrToInt(ECodigoPDV.Text)<0) then
    mensagem:=mensagem+'Código do Pedido inválido!'+#13;
  if not VerificaFloat(EPrecoPRD1.text) then
    mensagem:=mensagem+'Valor do Produto1 inválido!'+#13;
  if not VerificaFloat(EPrecoPRD2.text) then
    mensagem:=mensagem+'Valor do Produto2 inválido!'+#13;
  if not VerificaFloat(EPrecoPRD3.text) then
    mensagem:=mensagem+'Valor do Produto3 inválido!'+#13;
  if not VerificaFloat(EValorTRC.text) then
    mensagem:=mensagem+'Valor do recebimento inválido!'+#13;
  If mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    if (not (ETipo.ItemIndex in [8,9])) and //Entrada/Saída Avulsa
       ((StrToInt(ECodigoPDV.Text) = 0) or
        (StrToInt(ECodigoCLI.Text) = 0)) then  
      Raise exception.Create('Código do Pedido/Cliente inválido!');
    case ETipo.ItemIndex of
      0: Begin //Dev. Total

         end;
      1: Begin //Dev. Parcial
           if (not VerificaInteiroBranco(ECodigoPRD1.Text)) or
              (StrToInt(ECodigoPRD1.Text) <= 0) then
             Raise exception.Create('Código do Produto1 inválido!');
           if ((ECodigoPRD2.Text = '') or
               (StrToInt(ECodigoPRD2.Text) <= 0)) and
              (VerificaInteiroBranco(ECodigoPRD3.Text) and
              (StrToInt(ECodigoPRD3.Text) > 0)) then
             Raise exception.Create('Código do Produto2 inválido!');
         end;
      2: Begin //DescontoVenda
           if (not VerificaInteiroBranco(ECodigoPRD1.Text)) or
              (StrToInt(ECodigoPRD1.Text) <= 0) then
             Raise exception.Create('Código do Produto1 inválido!');
           if ((not VerificaInteiroBranco(ECodigoPRD2.Text)) or
               (StrToInt(ECodigoPRD2.Text) <= 0)) and
              (VerificaInteiroBranco(ECodigoPRD3.Text) and
              (StrToInt(ECodigoPRD3.Text) > 0)) then
             Raise exception.Create('Código do Produto3 inválido!');
           if (not VerificaFloatBranco(EPrecoPRD1.Text)) and
              (StrToFloat(EPrecoPRD1.Text) <= 0) then
             Raise exception.Create('Preço de Vendo do PRD1 inválido!');
           if VerificaFloatBranco(EPrecoPRD2.Text) and
              (StrToInt(ECodigoPRD2.Text) > 0) and
              (not VerificaFloatBranco(EPrecoPRD2.Text) or
              (StrToFloat(EPrecoPRD2.Text) <= 0)) then
             Raise exception.Create('Preço de Vendo do PRD2 inválido!');
           if VerificaInteiroBranco(ECodigoPRD3.Text) and
              (StrToInt(ECodigoPRD3.Text) > 0) and
              (not VerificaFloatBranco(EPrecoPRD3.Text) or
              (StrToFloat(EPrecoPRD3.Text) <= 0)) then
             Raise exception.Create('Preço de Vendo do PRD3 inválido!');
         end;
      3: Begin //CancelarVenda

         end;
      4: Begin //Desconto TRC
           if (not VerificaInteiroBranco(ECodigoTRC.Text)) or
              (StrToInt(ECodigoTRC.Text) <= 0) then
             Raise exception.Create('Código do Título inválido!');
           if (not VerificaFloatBranco(EValorTRC.Text)) or
              (StrToFloat(EValorTRC.Text) <= 0) then
             Raise exception.Create('Valor do Título inválido!');
         end;
      5: Begin //reabrir Título
           if (not VerificaInteiroBranco(ECodigoTRC.Text)) or
              (StrToInt(ECodigoTRC.Text) <= 0) then
             Raise exception.Create('Código do Título inválido!');
         end;
      6: Begin //Excluir Título
           if (not VerificaInteiroBranco(ECodigoTRC.Text)) or
              (StrToInt(ECodigoTRC.Text) <= 0) then
             Raise exception.Create('Código do Título inválido!');
         end;
      7: Begin //Lib. Venda SPC

         end;
      8,9:Begin //Entrada/Saída Avulsa
           if (not VerificaInteiroBranco(ECodigoPRD1.Text)) or
              (StrToInt(ECodigoPRD1.Text) <= 0) then
             Raise exception.Create('Código do Produto1 inválido!');
           if not VerificaFloatBranco(EPrecoPRD1.Text) then
             Raise exception.Create('Quantidade do Produto1 inválida!');
         end;
    end;
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      If Inserirauto then
      Begin
        Estado:=0;
        AtualizaControles(False);
        Result := True;
      end;
    End;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

function TPendencias.InserirAuto:Boolean;
var
  CdCNCOrigem, CdCNC, CdPEN: integer;
  sDetalhes: string;
begin
  result:=false;
  CdCNCOrigem := CentroDeCusto;
  CdCNC := ECodigoCNC.KeyValue;
  CdPEN := sCodigo;
  sDetalhes := '';
  try
    append;
    try
      CodigoPEN   := CdPEN;
    except
    end;
    try
      codigoCNC   := CdCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      CNCOrigem   := CdCNCOrigem;
    except
    end;
    try
      Descricao := EDescricao.Text;
      sDetalhes := sDetalhes+'Desc:'+EDescricao.Text;
    except
    end;
    try
      CreditoExtorno := ECreditoExtorno.ItemIndex;
      sDetalhes := sDetalhes+'C/E:'+IntToStr(ECreditoExtorno.ItemIndex);
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      DataReferencia := StrToDate(EDataReferencia.Text);
    except
    end;
    try
      CodigoFUN := ECodigoFUN.KeyValue;
      sDetalhes := sDetalhes+' FUN:'+IntToStr(ECodigoFUN.KeyValue);
    except
    end;
    try
      Tipo := ETipo.ItemIndex;
      sDetalhes := sDetalhes+' TIPO:'+IntToStr(ETipo.ItemIndex);
    except
    end;
    try
      PedidoCNC := StrToInt(EPedidoCNC.Text);
      CodigoPDV := StrToInt(ECodigoPDV.Text);
      sDetalhes := sDetalhes+' PVD:'+EPedidoCNC.Text+'-'+ECodigoPDV.Text;
    except
    end;
    try
      ClienteCNC := StrToInt(EClienteCNC.Text);
      CodigoCLI := StrToInt(ECodigoCLI.Text);
      sDetalhes := sDetalhes+' CLI:'+EClienteCNC.Text+'-'+ECodigoCLI.Text;
    except
    end;
    try
      TipoPag := ETipoPag.KeyValue;
    except
    end;
    try
      CodigoFPG := ECodigoFPG.KeyValue;
    except
    end;
    try
      CodigoAGF := ECodigoAGF.KeyValue;
    except
    end;
    try
      CodigoPRD1 := StrToInt(ECodigoPRD1.Text);
      sDetalhes := sDetalhes+' PRD1:'+ECodigoPRD1.Text;
    except
    end;
    try
      PrecoPRD1 := StrToFloat(EPrecoPRD1.Text);
      sDetalhes := sDetalhes+' '+EPrecoPRD1.Text;
    except
    end;
    try
      CodigoPRD2 := StrToInt(ECodigoPRD2.Text);
      sDetalhes := sDetalhes+' PRD2:'+ECodigoPRD2.Text;
    except
    end;
    try
      PrecoPRD2 := StrToFloat(EPrecoPRD2.Text);
      sDetalhes := sDetalhes+' '+EPrecoPRD2.Text;
    except
    end;
    try
      CodigoPRD3 := StrToInt(ECodigoPRD3.Text);
      sDetalhes := sDetalhes+' PRD3:'+ECodigoPRD3.Text;
    except
    end;
    try
      PrecoPRD3 := StrToFloat(EPrecoPRD3.Text);
      sDetalhes := sDetalhes+' '+EPrecoPRD3.Text;
    except
    end;
    try
      CodigoTRC := StrToInt(ECodigoTRC.Text);
      sDetalhes := sDetalhes+' TRC:'+ECodigoTRC.Text;
    except
    end;
    try
      ValorTRC := StrToFloat(EValorTRC.Text);
      sDetalhes := sDetalhes+' '+EValorTRC.Text;
    except
    end;
    try
      Situacao     := ESituacao.ItemIndex;
      sDetalhes := sDetalhes+' Sit:'+IntToStr(ESituacao.ItemIndex);
    except
    end;
    try
       OBS  := EOBS.Text;
       sDetalhes := sDetalhes+' OBS:'+EOBS.Text;
    except
    end;
    try
      Post;
      GeraLog(8860, CdCNCOrigem, CdPEN, sDetalhes);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;


procedure TPendencias.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoPEN.Clear
    else
      ECodigoPEN.Text := IntToStr(SCodigo);
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    ECreditoExtorno.ItemIndex := -1;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear
  except
  end;
  try
    if Estado <> 1 then
      EDataReferencia.Clear
    else
      EDataReferencia.Text := formatDateTime('DD/MM/YYYY',CConfiguracao.DataHora);
  except
  end;
  try
    if Estado <> 1 then
      ETipo.ItemIndex := -1
    else
      ETipo.ItemIndex := 0;
  except
  end;
  try
    ECodigoFUN.KeyValue := 0;
  except
  end;
  try
    EPedidoCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  except
  end;
  try
    ECodigoPDV.Clear
  except
  end;
  try
    EClienteCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  except
  end;
  try
    ECodigoCLI.Clear
  except
  end;
  try
    ETipoPag.KeyValue := 0;
  except
  end;
  try
    ECodigoFPG.KeyValue := 0;
  except
  end;
  try
    ECodigoAGF.KeyValue := 0;
  except
  end;
  try
    ECodigoPRD1.Clear
  except
  end;
  try
    EPrecoPRD1.Clear
  except
  end;
  try
    ECodigoPRD2.Clear
  except
  end;
  try
    EPrecoPRD2.Clear
  except
  end;
  try
    ECodigoPRD3.Clear
  except
  end;
  try
    EPrecoPRD3.Clear
  except
  end;
  try
    ECodigoTRC.Clear
  except
  end;
  try
    EValorTRC.Clear
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.itemIndex := -1
    else
      ESituacao.itemIndex := 0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

{ Localiza um Grupo }
function TPendencias.LocalizarCod(CdCNC,CdPEN:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  begin
    close;
    sql.Text:='SELECT * FROM PENDENCIA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PEN_CODIGO='+IntToStr(CdPEN);
    open;
    Result := (not IsEmpty);
  end;
end;

procedure TPendencias.PreparaInsercao;
begin
  ProximoCodigo('PEN_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
