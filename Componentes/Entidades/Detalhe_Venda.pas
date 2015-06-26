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
unit Detalhe_Venda;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Dbtables, Dialogs, Db, Stdctrls, Mask, 
     Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, SQuery, 
     Funcoes;

type
  TDetalhe_Venda = class(TSQuery)
    private
      { Private fields of TDetalhe_Venda }
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property Comissao1 }
        FComissao1 : Double;
        { Storage for property Comissao2 }
        FComissao2 : Double;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoUSU }
        FECodigoUSU : TEdit;
        { Storage for property EComissao1 }
        FEComissao1 : TEdit;
        { Storage for property EComissao2 }
        FEComissao2 : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EIndicacao1 }
        FEIndicacao1 : TDBLookupComboBox;
        { Storage for property EIndicacao2 }
        FEIndicacao2 : TDBLookupComboBox;
        { Storage for property EMedicoCRM }
        FEMedicoCRM : TEdit;
        { Storage for property EMedicoNome }
        FEMedicoNome : TEdit;
        { Storage for property EMeio }
        FEMeio : TDBLookupComboBox;
        { Storage for property EMeioOutro }
        FEMeioOutro : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EOBSArmacao }
        FEOBSArmacao : TEdit;
        { Storage for property EOBSLentes }
        FEOBSLentes : TEdit;
        { Storage for property EOD_ADICAO }
        FEOD_ADICAO : TEdit;
        { Storage for property EOD_ALT }
        FEOD_ALT : TEdit;
        { Storage for property EOD_CIL }
        FEOD_CIL : TEdit;
        { Storage for property EOD_DNP }
        FEOD_DNP : TEdit;
        { Storage for property EOD_EIXO }
        FEOD_EIXO : TEdit;
        { Storage for property EOD_ESF }
        FEOD_ESF : TEdit;
        { Storage for property EOE_ADICAO }
        FEOE_ADICAO : TEdit;
        { Storage for property EOE_ALT }
        FEOE_ALT : TEdit;
        { Storage for property EOE_CIL }
        FEOE_CIL : TEdit;
        { Storage for property EOE_DNP }
        FEOE_DNP : TEdit;
        { Storage for property EOE_EIXO }
        FEOE_EIXO : TEdit;
        { Storage for property EOE_ESF }
        FEOE_ESF : TEdit;
        { Storage for property EPasciente }
        FEPasciente : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipoArmacao }
        FETipoArmacao : TEdit;
        { Storage for property ETipoLentes }
        FETipoLentes : TEdit;
        { Storage for property Indicacao1 }
        FIndicacao1 : Integer;
        { Storage for property Indicacao2 }
        FIndicacao2 : Integer;
        { Storage for property MedicoCRM }
        FMedicoCRM : Integer;
        { Storage for property MedicoNome }
        FMedicoNome : String;
        { Storage for property Meio }
        FMeio : Integer;
        { Storage for property MeioOutro }
        FMeioOutro : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property OBSArmacao }
        FOBSArmacao : String;
        { Storage for property OBSLentes }
        FOBSLentes : String;
        { Storage for property OD_ADICAO }
        FOD_ADICAO : Double;
        { Storage for property OD_ALT }
        FOD_ALT : Double;
        { Storage for property OD_CIL }
        FOD_CIL : Double;
        { Storage for property OD_DNP }
        FOD_DNP : Double;
        { Storage for property OD_EIXO }
        FOD_EIXO : Double;
        { Storage for property OD_ESF }
        FOD_ESF : Double;
        { Storage for property OE_ADICAO }
        FOE_ADICAO : Double;
        { Storage for property OE_ALT }
        FOE_ALT : Double;
        { Storage for property OE_CIL }
        FOE_CIL : Double;
        { Storage for property OE_DNP }
        FOE_DNP : Double;
        { Storage for property OE_EIXO }
        FOE_EIXO : Double;
        { Storage for property OE_ESF }
        FOE_ESF : Double;
        { Storage for property Pasciente }
        FPasciente : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TipoArmacao }
        FTipoArmacao : String;
        { Storage for property TipoLentes }
        FTipoLentes : String;

      { Private methods of TDetalhe_Venda }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
        { Read method for property Comissao1 }
        function GetComissao1 : Double;
        { Write method for property Comissao1 }
        procedure SetComissao1(Value : Double);
        { Read method for property Comissao2 }
        function GetComissao2 : Double;
        { Write method for property Comissao2 }
        procedure SetComissao2(Value : Double);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Indicacao1 }
        function GetIndicacao1 : Integer;
        { Write method for property Indicacao1 }
        procedure SetIndicacao1(Value : Integer);
        { Read method for property Indicacao2 }
        function GetIndicacao2 : Integer;
        { Write method for property Indicacao2 }
        procedure SetIndicacao2(Value : Integer);
        { Read method for property MedicoCRM }
        function GetMedicoCRM : Integer;
        { Write method for property MedicoCRM }
        procedure SetMedicoCRM(Value : Integer);
        { Read method for property MedicoNome }
        function GetMedicoNome : String;
        { Write method for property MedicoNome }
        procedure SetMedicoNome(Value : String);
        { Read method for property Meio }
        function GetMeio : Integer;
        { Write method for property Meio }
        procedure SetMeio(Value : Integer);
        { Read method for property MeioOutro }
        function GetMeioOutro : String;
        { Write method for property MeioOutro }
        procedure SetMeioOutro(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property OBSArmacao }
        function GetOBSArmacao : String;
        { Write method for property OBSArmacao }
        procedure SetOBSArmacao(Value : String);
        { Read method for property OBSLentes }
        function GetOBSLentes : String;
        { Write method for property OBSLentes }
        procedure SetOBSLentes(Value : String);
        { Read method for property OD_ADICAO }
        function GetOD_ADICAO : Double;
        { Write method for property OD_ADICAO }
        procedure SetOD_ADICAO(Value : Double);
        { Read method for property OD_ALT }
        function GetOD_ALT : Double;
        { Write method for property OD_ALT }
        procedure SetOD_ALT(Value : Double);
        { Read method for property OD_CIL }
        function GetOD_CIL : Double;
        { Write method for property OD_CIL }
        procedure SetOD_CIL(Value : Double);
        { Read method for property OD_DNP }
        function GetOD_DNP : Double;
        { Write method for property OD_DNP }
        procedure SetOD_DNP(Value : Double);
        { Read method for property OD_EIXO }
        function GetOD_EIXO : Double;
        { Write method for property OD_EIXO }
        procedure SetOD_EIXO(Value : Double);
        { Read method for property OD_ESF }
        function GetOD_ESF : Double;
        { Write method for property OD_ESF }
        procedure SetOD_ESF(Value : Double);
        { Read method for property OE_ADICAO }
        function GetOE_ADICAO : Double;
        { Write method for property OE_ADICAO }
        procedure SetOE_ADICAO(Value : Double);
        { Read method for property OE_ALT }
        function GetOE_ALT : Double;
        { Write method for property OE_ALT }
        procedure SetOE_ALT(Value : Double);
        { Read method for property OE_CIL }
        function GetOE_CIL : Double;
        { Write method for property OE_CIL }
        procedure SetOE_CIL(Value : Double);
        { Read method for property OE_DNP }
        function GetOE_DNP : Double;
        { Write method for property OE_DNP }
        procedure SetOE_DNP(Value : Double);
        { Read method for property OE_EIXO }
        function GetOE_EIXO : Double;
        { Write method for property OE_EIXO }
        procedure SetOE_EIXO(Value : Double);
        { Read method for property OE_ESF }
        function GetOE_ESF : Double;
        { Write method for property OE_ESF }
        procedure SetOE_ESF(Value : Double);
        { Read method for property Pasciente }
        function GetPasciente : String;
        { Write method for property Pasciente }
        procedure SetPasciente(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TipoArmacao }
        function GetTipoArmacao : String;
        { Write method for property TipoArmacao }
        procedure SetTipoArmacao(Value : String);
        { Read method for property TipoLentes }
        function GetTipoLentes : String;
        { Write method for property TipoLentes }
        procedure SetTipoLentes(Value : String);

    protected
      { Protected fields of TDetalhe_Venda }

      { Protected methods of TDetalhe_Venda }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TDetalhe_Venda }

      { Public methods of TDetalhe_Venda }
        function AlterarAuto:Boolean;
        procedure AtualizaCampos(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdPDV:integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao(Estado:integer):Boolean;
        function Inserir(CdCNC, CdPDV, CdFUN1, CdFUN2, CdMeio: integer; PComissao1, PComissao2: Double; PMeioOutro, PObs:string):Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos(Estado:integer);
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TDetalhe_Venda }
        { Código do Detalhe Serviço }
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        property Comissao1 : Double read GetComissao1 write SetComissao1;
        property Comissao2 : Double read GetComissao2 write SetComissao2;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoUSU : TEdit read FECodigoUSU write FECodigoUSU;
        property EComissao1 : TEdit read FEComissao1 write FEComissao1;
        property EComissao2 : TEdit read FEComissao2 write FEComissao2;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EIndicacao1 : TDBLookupComboBox
             read FEIndicacao1 write FEIndicacao1;
        property EIndicacao2 : TDBLookupComboBox
             read FEIndicacao2 write FEIndicacao2;
        property EMedicoCRM : TEdit read FEMedicoCRM write FEMedicoCRM;
        property EMedicoNome : TEdit read FEMedicoNome write FEMedicoNome;
        property EMeio : TDBLookupComboBox read FEMeio write FEMeio;
        property EMeioOutro : TEdit read FEMeioOutro write FEMeioOutro;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EOBSArmacao : TEdit read FEOBSArmacao write FEOBSArmacao;
        property EOBSLentes : TEdit read FEOBSLentes write FEOBSLentes;
        property EOD_ADICAO : TEdit read FEOD_ADICAO write FEOD_ADICAO;
        property EOD_ALT : TEdit read FEOD_ALT write FEOD_ALT;
        property EOD_CIL : TEdit read FEOD_CIL write FEOD_CIL;
        property EOD_DNP : TEdit read FEOD_DNP write FEOD_DNP;
        property EOD_EIXO : TEdit read FEOD_EIXO write FEOD_EIXO;
        property EOD_ESF : TEdit read FEOD_ESF write FEOD_ESF;
        property EOE_ADICAO : TEdit read FEOE_ADICAO write FEOE_ADICAO;
        property EOE_ALT : TEdit read FEOE_ALT write FEOE_ALT;
        property EOE_CIL : TEdit read FEOE_CIL write FEOE_CIL;
        property EOE_DNP : TEdit read FEOE_DNP write FEOE_DNP;
        property EOE_EIXO : TEdit read FEOE_EIXO write FEOE_EIXO;
        property EOE_ESF : TEdit read FEOE_ESF write FEOE_ESF;
        property EPasciente : TEdit read FEPasciente write FEPasciente;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipoArmacao : TEdit read FETipoArmacao write FETipoArmacao;
        property ETipoLentes : TEdit read FETipoLentes write FETipoLentes;
        property Indicacao1 : Integer read GetIndicacao1 write SetIndicacao1;
        property Indicacao2 : Integer read GetIndicacao2 write SetIndicacao2;
        property MedicoCRM : Integer read GetMedicoCRM write SetMedicoCRM;
        property MedicoNome : String read GetMedicoNome write SetMedicoNome;
        property Meio : Integer read GetMeio write SetMeio;
        property MeioOutro : String read GetMeioOutro write SetMeioOutro;
        property OBS : String read GetOBS write SetOBS;
        property OBSArmacao : String read GetOBSArmacao write SetOBSArmacao;
        property OBSLentes : String read GetOBSLentes write SetOBSLentes;
        property OD_ADICAO : Double read GetOD_ADICAO write SetOD_ADICAO;
        property OD_ALT : Double read GetOD_ALT write SetOD_ALT;
        property OD_CIL : Double read GetOD_CIL write SetOD_CIL;
        property OD_DNP : Double read GetOD_DNP write SetOD_DNP;
        property OD_EIXO : Double read GetOD_EIXO write SetOD_EIXO;
        property OD_ESF : Double read GetOD_ESF write SetOD_ESF;
        property OE_ADICAO : Double read GetOE_ADICAO write SetOE_ADICAO;
        property OE_ALT : Double read GetOE_ALT write SetOE_ALT;
        property OE_CIL : Double read GetOE_CIL write SetOE_CIL;
        property OE_DNP : Double read GetOE_DNP write SetOE_DNP;
        property OE_EIXO : Double read GetOE_EIXO write SetOE_EIXO;
        property OE_ESF : Double read GetOE_ESF write SetOE_ESF;
        property Pasciente : String read GetPasciente write SetPasciente;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TipoArmacao : String read GetTipoArmacao write SetTipoArmacao;
        property TipoLentes : String read GetTipoLentes write SetTipoLentes;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TDetalhe_Venda with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TDetalhe_Venda]);
end;

{ Method to set variable and property values and create objects }
procedure TDetalhe_Venda.AutoInitialize;
begin
     FECodigoPDV := nil;
     FECodigoUSU := nil;
     FEComissao1 := nil;
     FEComissao2 := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEIndicacao1 := nil;
     FEIndicacao2 := nil;
     FEMedicoCRM := nil;
     FEMedicoNome := nil;
     FEMeio := nil;
     FEMeioOutro := nil;
     FEOBS := nil;
     FEOBSArmacao := nil;
     FEOBSLentes := nil;
     FEOD_ADICAO := nil;
     FEOD_ALT := nil;
     FEOD_CIL := nil;
     FEOD_DNP := nil;
     FEOD_EIXO := nil;
     FEOD_ESF := nil;
     FEOE_ADICAO := nil;
     FEOE_ALT := nil;
     FEOE_CIL := nil;
     FEOE_DNP := nil;
     FEOE_EIXO := nil;
     FEOE_ESF := nil;
     FEPasciente := nil;
     FESituacao := nil;
     FETipoArmacao := nil;
     FETipoLentes := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TDetalhe_Venda.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoUSU then
        FECodigoUSU := nil;
     if AComponent = FEComissao1 then
        FEComissao1 := nil;
     if AComponent = FEComissao2 then
        FEComissao2 := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEIndicacao1 then
        FEIndicacao1 := nil;
     if AComponent = FEIndicacao2 then
        FEIndicacao2 := nil;
     if AComponent = FEMedicoCRM then
        FEMedicoCRM := nil;
     if AComponent = FEMedicoNome then
        FEMedicoNome := nil;
     if AComponent = FEMeio then
        FEMeio := nil;
     if AComponent = FEMeioOutro then
        FEMeioOutro := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEOBSArmacao then
        FEOBSArmacao := nil;
     if AComponent = FEOBSLentes then
        FEOBSLentes := nil;
     if AComponent = FEOD_ADICAO then
        FEOD_ADICAO := nil;
     if AComponent = FEOD_ALT then
        FEOD_ALT := nil;
     if AComponent = FEOD_CIL then
        FEOD_CIL := nil;
     if AComponent = FEOD_DNP then
        FEOD_DNP := nil;
     if AComponent = FEOD_EIXO then
        FEOD_EIXO := nil;
     if AComponent = FEOD_ESF then
        FEOD_ESF := nil;
     if AComponent = FEOE_ADICAO then
        FEOE_ADICAO := nil;
     if AComponent = FEOE_ALT then
        FEOE_ALT := nil;
     if AComponent = FEOE_CIL then
        FEOE_CIL := nil;
     if AComponent = FEOE_DNP then
        FEOE_DNP := nil;
     if AComponent = FEOE_EIXO then
        FEOE_EIXO := nil;
     if AComponent = FEOE_ESF then
        FEOE_ESF := nil;
     if AComponent = FEPasciente then
        FEPasciente := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipoArmacao then
        FETipoArmacao := nil;
     if AComponent = FETipoLentes then
        FETipoLentes := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TDetalhe_Venda.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoPDV }
function TDetalhe_Venda.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPDV }
procedure TDetalhe_Venda.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
    end;
end;

{ Read method for property Comissao1 }
function TDetalhe_Venda.GetComissao1 : Double;
begin
  try
    Result := Self.fieldByName('DPV_COMISSAO_1').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Comissao1 }
procedure TDetalhe_Venda.SetComissao1(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_COMISSAO_1').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_COMISSAO_1"!');
    end;
end;

{ Read method for property Comissao2 }
function TDetalhe_Venda.GetComissao2 : Double;
begin
  try
    Result := Self.fieldByName('DPV_COMISSAO_2').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Comissao2 }
procedure TDetalhe_Venda.SetComissao2(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_COMISSAO_2').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_COMISSAO_2"!');
    end;
end;

{ Read method for property DataAlterado }
function TDetalhe_Venda.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('DPV_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TDetalhe_Venda.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TDetalhe_Venda.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('DPV_DT_CADASTRO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataCadastro }
procedure TDetalhe_Venda.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_DT_CADASTRO"!');
    end;
end;

{ Read method for property Indicacao1 }
function TDetalhe_Venda.GetIndicacao1 : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO_1').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Indicacao1 }
procedure TDetalhe_Venda.SetIndicacao1(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO_1').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO_1"!');
    end;
end;

{ Read method for property Indicacao2 }
function TDetalhe_Venda.GetIndicacao2 : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO_2').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Indicacao2 }
procedure TDetalhe_Venda.SetIndicacao2(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO_2').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO_2"!');
    end;
end;

{ Read method for property MedicoCRM }
function TDetalhe_Venda.GetMedicoCRM : Integer;
begin
  try
    Result := Self.fieldByName('DPV_MEDICO_CRM').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property MedicoCRM }
procedure TDetalhe_Venda.SetMedicoCRM(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_MEDICO_CRM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_MEDICO_CRM"!');
    end;
end;

{ Read method for property MedicoNome }
function TDetalhe_Venda.GetMedicoNome : String;
begin
  try
    Result := Self.fieldByName('DPV_MEDICO_NOME').asString;
  except
    result:= '';
  end;
end;

{ Write method for property MedicoNome }
procedure TDetalhe_Venda.SetMedicoNome(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_MEDICO_NOME').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_MEDICO_NOME"!');
    end;
end;

{ Read method for property Meio }
function TDetalhe_Venda.GetMeio : Integer;
begin
  try
    Result := Self.fieldByName('DPV_MEIO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Meio }
procedure TDetalhe_Venda.SetMeio(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_MEIO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_MEIO"!');
    end;
end;

{ Read method for property MeioOutro }
function TDetalhe_Venda.GetMeioOutro : String;
begin
  try
    Result := Self.fieldByName('DPV_MEIO_OUTRO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property MeioOutro }
procedure TDetalhe_Venda.SetMeioOutro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_MEIO_OUTRO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_MEIO_OUTRO"!');
    end;
end;

{ Read method for property OBS }
function TDetalhe_Venda.GetOBS : String;
begin
  try
    Result := Self.fieldByName('DPV_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property OBS }
procedure TDetalhe_Venda.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OBSERVACAO"!');
    end;
end;

{ Read method for property OBSArmacao }
function TDetalhe_Venda.GetOBSArmacao : String;
begin
  try
    Result := Self.fieldByName('DPV_OBS_ARMACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property OBSArmacao }
procedure TDetalhe_Venda.SetOBSArmacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('DPV_OBS_ARMACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "DPV_OBS_ARMACAO"!');
  end;
end;

{ Read method for property OBSLentes }
function TDetalhe_Venda.GetOBSLentes : String;
begin
  try
    Result := Self.fieldByName('DPV_OBS_LENTES').asString;
  except
    result:= '';
  end;
end;

{ Write method for property OBSLentes }
procedure TDetalhe_Venda.SetOBSLentes(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OBS_LENTES').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OBS_LENTES"!');
    end;
end;

{ Read method for property OD_ADICAO }
function TDetalhe_Venda.GetOD_ADICAO : Double;
begin
  try
    Result := Self.fieldByName('DPV_OD_ADICAO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OD_ADICAO }
procedure TDetalhe_Venda.SetOD_ADICAO(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OD_ADICAO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OD_ADICAO"!');
    end;
end;

{ Read method for property OD_ALT }
function TDetalhe_Venda.GetOD_ALT : Double;
begin
  try
    Result := Self.fieldByName('DPV_OD_ALT').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OD_ALT }
procedure TDetalhe_Venda.SetOD_ALT(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OD_ALT').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OD_ALT"!');
    end;
end;

{ Read method for property OD_CIL }
function TDetalhe_Venda.GetOD_CIL : Double;
begin
  try
    Result := Self.fieldByName('DPV_OD_CIL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OD_CIL }
procedure TDetalhe_Venda.SetOD_CIL(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OD_CIL').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OD_CIL"!');
    end;
end;

{ Read method for property OD_DNP }
function TDetalhe_Venda.GetOD_DNP : Double;
begin
  try
    Result := Self.fieldByName('DPV_OD_DNP').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OD_DNP }
procedure TDetalhe_Venda.SetOD_DNP(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OD_DNP').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OD_DNP"!');
    end;
end;

{ Read method for property OD_EIXO }
function TDetalhe_Venda.GetOD_EIXO : Double;
begin
  try
    Result := Self.fieldByName('DPV_OD_EIXO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OD_EIXO }
procedure TDetalhe_Venda.SetOD_EIXO(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OD_EIXO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OD_EIXO"!');
    end;
end;

{ Read method for property OD_ESF }
function TDetalhe_Venda.GetOD_ESF : Double;
begin
  try
    Result := Self.fieldByName('DPV_OD_ESF').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OD_ESF }
procedure TDetalhe_Venda.SetOD_ESF(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OD_ESF').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OD_ESF"!');
    end;
end;

{ Read method for property OE_ADICAO }
function TDetalhe_Venda.GetOE_ADICAO : Double;
begin
  try
    Result := Self.fieldByName('DPV_OE_ADICAO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OE_ADICAO }
procedure TDetalhe_Venda.SetOE_ADICAO(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OE_ADICAO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OE_ADICAO"!');
    end;
end;

{ Read method for property OE_ALT }
function TDetalhe_Venda.GetOE_ALT : Double;
begin
  try
    Result := Self.fieldByName('DPV_OE_ALT').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OE_ALT }
procedure TDetalhe_Venda.SetOE_ALT(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OE_ALT').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OE_ALT"!');
    end;
end;

{ Read method for property OE_CIL }
function TDetalhe_Venda.GetOE_CIL : Double;
begin
  try
    Result := Self.fieldByName('DPV_OE_CIL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OE_CIL }
procedure TDetalhe_Venda.SetOE_CIL(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OE_CIL').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OE_CIL"!');
    end;
end;

{ Read method for property OE_DNP }
function TDetalhe_Venda.GetOE_DNP : Double;
begin
  try
    Result := Self.fieldByName('DPV_OE_DNP').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OE_DNP }
procedure TDetalhe_Venda.SetOE_DNP(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OE_DNP').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OE_DNP"!');
    end;
end;

{ Read method for property OE_EIXO }
function TDetalhe_Venda.GetOE_EIXO : Double;
begin
  try
    Result := Self.fieldByName('DPV_OE_EIXO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OE_EIXO }
procedure TDetalhe_Venda.SetOE_EIXO(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OE_EIXO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OE_EIXO"!');
    end;
end;

{ Read method for property OE_ESF }
function TDetalhe_Venda.GetOE_ESF : Double;
begin
  try
    Result := Self.fieldByName('DPV_OE_ESF').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property OE_ESF }
procedure TDetalhe_Venda.SetOE_ESF(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_OE_ESF').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_OE_ESF"!');
    end;
end;

{ Read method for property Pasciente }
function TDetalhe_Venda.GetPasciente : String;
begin
  try
    Result := Self.fieldByName('DPV_PASCIENTE').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Pasciente }
procedure TDetalhe_Venda.SetPasciente(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_PASCIENTE').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_PASCIENTE"!');
    end;
end;

{ Read method for property Situacao }
function TDetalhe_Venda.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('DPV_QUANTIDADE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TDetalhe_Venda.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_SITUACAO"!');
    end;
end;

{ Read method for property TipoArmacao }
function TDetalhe_Venda.GetTipoArmacao : String;
begin
  try
    Result := Self.fieldByName('DPV_TIPO_ARMACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property TipoArmacao }
procedure TDetalhe_Venda.SetTipoArmacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('DPV_TIPO_ARMACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "DPV_TIPO_ARMACAO"!');
  end;
end;

{ Read method for property TipoLentes }
function TDetalhe_Venda.GetTipoLentes : String;
begin
  try
    Result := Self.fieldByName('DPV_TIPO_LENTES').asstring;
  except
    result:= '';
  end;
end;

{ Write method for property TipoLentes }
procedure TDetalhe_Venda.SetTipoLentes(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DPV_TIPO_LENTES').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DPV_TIPO_LENTES"!');
    end;
end;

function TDetalhe_Venda.AlterarAuto:Boolean;
var
  CdFUN1, CdFUN2, CdMeio: integer;
  sObservacao: string;
begin
  try
    CdFUN1 := EIndicacao1.KeyValue;
  except
    CdFUN1 := 0;
  end;
  try
    CdFUN2 := EIndicacao2.KeyValue;
  except
    CdFUN2 := 0;
  end;
  try
    CdMeio := EMeio.KeyValue;
  except
    CdMeio := 0;
  end;
  try
    sObservacao := EOBS.Text;
  except
    sObservacao := '';
  end;
  try
    if CConfiguracao.Empresa in [empMotical,empLuciano] then
    begin
      if CConfiguracao.CodigoCNC = 3 then //Laboratório
      begin
        ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE DETALHE_DE_PEDIDO_DE_VENDA SET '+
          ' DPV_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
          ',DPV_TIPO_ARMACAO="'+ETipoArmacao.Text+'" '+
          ',DPV_OBS_ARMACAO="'+EOBSArmacao.Text+'" '+
          ',DPV_TIPO_LENTES="'+ETipoLentes.Text+'" '+
          ',DPV_OBS_LENTES="'+EOBSLentes.Text+'" '+
          ',DPV_PASCIENTE="'+EPasciente.Text+'" '+
          ',DPV_MEDICO_CRM='+EMedicoCRM.Text+
          ',DPV_MEDICO_NOME="'+EMedicoNome.Text+'" '+
          ',DPV_COMISSAO_1='+VirgPonto(EComissao1.Text)+
          ',DPV_COMISSAO_2='+VirgPonto(EComissao2.Text)+
          ',DPV_OD_ESF='+VirgPonto(EOD_ESF.Text)+
          ',DPV_OE_ESF='+VirgPonto(EOE_ESF.Text)+
          ',DPV_OD_CIL='+VirgPonto(EOD_CIL.Text)+
          ',DPV_OE_CIL='+VirgPonto(EOE_CIL.Text)+
          ',DPV_OD_EIXO='+VirgPonto(EOD_EIXO.Text)+
          ',DPV_OE_EIXO='+VirgPonto(EOE_EIXO.Text)+
          ',DPV_OD_DNP='+VirgPonto(EOD_DNP.Text)+
          ',DPV_OE_DNP='+VirgPonto(EOE_DNP.Text)+
          ',DPV_OD_ALT='+VirgPonto(EOD_ALT.Text)+
          ',DPV_OE_ALT='+VirgPonto(EOE_ALT.Text)+
          ',DPV_OD_ADICAO='+VirgPonto(EOD_ADICAO.Text)+
          ',DPV_OE_ADICAO='+VirgPonto(EOE_ADICAO.Text)+
          ',DPV_OBSERVACAO="'+sObservacao+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND PDV_CODIGO='+IntToStr(CodigoPDV)+

          //Alan
          ' AND DPV_DT_CADASTRO="'+MesDiaHora(DataCadastro)+'"')
        end
        else
        begin
          ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE DETALHE_DE_PEDIDO_DE_VENDA SET '+
          ' DPV_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
          ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
          ',DPV_TIPO_ARMACAO="'+ETipoArmacao.Text+'" '+
          ',DPV_OBS_ARMACAO="'+EOBSArmacao.Text+'" '+
          ',DPV_TIPO_LENTES="'+ETipoLentes.Text+'" '+
          ',DPV_OBS_LENTES="'+EOBSLentes.Text+'" '+
          ',DPV_PASCIENTE="'+EPasciente.Text+'" '+
          ',DPV_MEDICO_CRM='+EMedicoCRM.Text+
          ',DPV_MEDICO_NOME="'+EMedicoNome.Text+'" '+

          //Para o Labotario essas linhas devem estar comentadas
          ',FUN_CODIGO_1='+IntToStr(CdFUN1)+
          ',FUN_CODIGO_2='+IntToStr(CdFUN2)+

          ',DPV_COMISSAO_1='+VirgPonto(EComissao1.Text)+
          ',DPV_COMISSAO_2='+VirgPonto(EComissao2.Text)+

          ',DPV_OD_ESF='+VirgPonto(EOD_ESF.Text)+
          ',DPV_OE_ESF='+VirgPonto(EOE_ESF.Text)+
          ',DPV_OD_CIL='+VirgPonto(EOD_CIL.Text)+
          ',DPV_OE_CIL='+VirgPonto(EOE_CIL.Text)+
          ',DPV_OD_EIXO='+VirgPonto(EOD_EIXO.Text)+
          ',DPV_OE_EIXO='+VirgPonto(EOE_EIXO.Text)+
          ',DPV_OD_DNP='+VirgPonto(EOD_DNP.Text)+
          ',DPV_OE_DNP='+VirgPonto(EOE_DNP.Text)+
          ',DPV_OD_ALT='+VirgPonto(EOD_ALT.Text)+
          ',DPV_OE_ALT='+VirgPonto(EOE_ALT.Text)+
          ',DPV_OD_ADICAO='+VirgPonto(EOD_ADICAO.Text)+
          ',DPV_OE_ADICAO='+VirgPonto(EOE_ADICAO.Text)+
          ',DPV_OBSERVACAO="'+sObservacao+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND PDV_CODIGO='+IntToStr(CodigoPDV)+

          //Alan
          ' AND DPV_DT_CADASTRO="'+MesDiaHora(DataCadastro)+'"')
        end;
    end
    else
      ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE DETALHE_DE_PEDIDO_DE_VENDA SET '+
        ' DPV_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
        ',DPV_TIPO_ARMACAO="'+ETipoArmacao.Text+'" '+
        ',FUN_CODIGO_1='+IntToStr(CdFUN1)+
        ',FUN_CODIGO_2='+IntToStr(CdFUN2)+
        ',DPV_COMISSAO_1='+VirgPonto(EComissao1.Text)+
        ',DPV_COMISSAO_2='+VirgPonto(EComissao2.Text)+
        ',DPV_MEIO='+IntToStr(CdMeio)+
        ',DPV_MEIO_OUTRO="'+EMeioOutro.Text+'" '+
        ',DPV_OBSERVACAO="'+EObs.Text+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(CodigoPDV));
    Result:=True;
  except
    Result:=False;
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TDetalhe_Venda.AtualizaCampos(Habilitar:Boolean);
begin
  try
    ETipoLentes.Enabled     := Habilitar;
  except
  end;
  try
    EOBSLentes.Enabled      := Habilitar;
  except
  end;
  try
    EPasciente.Enabled      := Habilitar;
  except
  end;
  try
    ETipoArmacao.Enabled    := Habilitar;
  except
  end;
  try
    EOBSArmacao.Enabled     := Habilitar;
  except
  end;
  try
    EMedicoNome.Enabled     := Habilitar;
  except
  end;
  try
    EMedicoCRM.Enabled      := Habilitar;
  except
  end;
  try
    EOD_ESF.Enabled         := Habilitar;
  except
  end;
  try
    EOE_ESF.Enabled         := Habilitar;
  except
  end;
  try
    EOD_CIL.Enabled         := Habilitar;
  except
  end;
  try
    EOE_CIL.Enabled         := Habilitar;
  except
  end;
  try
    EOD_EIXO.Enabled        := Habilitar;
  except
  end;
  try
    EOE_EIXO.Enabled        := Habilitar;
  except
  end;
  try
    EOD_DNP.Enabled         := Habilitar;
  except
  end;
  try
    EOE_DNP.Enabled         := Habilitar;
  except
  end;
  try
    EOD_ALT.Enabled         := Habilitar;
  except
  end;
  try
    EOE_ALT.Enabled         := Habilitar;
  except
  end;
  try
    EOD_ADICAO.Enabled      := Habilitar;
  except
  end;
  try
    EOE_ADICAO.Enabled      := Habilitar;
  except
  end;
  try
    EIndicacao1.Enabled      := Habilitar;
  except
  end;
  try
    EIndicacao2.Enabled      := Habilitar;
  except
  end;
  try
    EComissao1.Enabled      := Habilitar;
  except
  end;
  try
    EComissao2.Enabled      := Habilitar;
  except
  end;
  try
    EMeio.Enabled      := Habilitar;
  except
  end;
  try
    EMeioOutro.Enabled      := Habilitar;
  except
  end;
  try
    EOBS.Enabled      := Habilitar;
  except
  end;
end;

procedure TDetalhe_Venda.CancelaEdicao;
begin
  Estado := 0;
  if isEmpty then
    LimpaCampos(0)
  else
    CarregaDados;
  AtualizaCampos(False);
end;

procedure TDetalhe_Venda.CarregaDados;
begin
  Try
    EDataCadastro.Text           :=FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro)
  except
  end;
  Try
    EDataAlterado.Text           :=FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado)
  except
  end;
  Try
    ETipoArmacao.Text           :=TipoArmacao;
  except
  end;
  try
    ETipoLentes.Text           :=TipoLentes;
  except
  end;
  try
    EOBSLentes.Text           :=OBSLentes;
  except
  end;
  try
    EPasciente.Text           :=Pasciente;
  except
  end;
  try
    EOBSArmacao.Text           :=OBSArmacao;
  except
  end;
  Try
    EMedicoNome.Text           :=MedicoNome;
  except
  end;
  Try
    EMedicoCRM.Text           :=IntToStr(MedicoCRM);
  except
  end;
  try
    EOD_ESF.Text    := format('%.2f',[OD_ESF]);
  except
  end;
  try
    EOE_ESF.Text    := format('%.2f',[OE_ESF]);
  except
  end;
  try
    EOD_CIL.Text    := format('%.2f',[OD_CIL]);
  except
  end;
  try
    EOE_CIL.Text    := format('%.2f',[OE_CIL]);
  except
  end;
  try
    EOD_EIXO.Text   := IntToStr(Trunc(OD_EIXO));
  except
  end;
  try
    EOE_EIXO.Text   := IntToStr(Trunc(OE_EIXO));
  except
  end;
  try
    EOD_DNP.Text    := format('%.1f',[OD_DNP]);
  except
  end;
  try
    EOE_DNP.Text    := format('%.1f',[OE_DNP]);
  except
  end;
  try
    EOD_ALT.Text    := IntToStr(Trunc(OD_ALT));
  except
  end;
  try
    EOE_ALT.Text    := IntToStr(Trunc(OE_ALT));
  except
  end;
  try
    EOD_ADICAO.Text     := format('%.2f',[OD_ADICAO]);
  except
  end;
  try
    EOE_ADICAO.Text     := format('%.2f',[OE_ADICAO]);
  except
  end;
  try
    EIndicacao1.KeyValue := Indicacao1;
  except
  end;
  try
    EIndicacao2.KeyValue := Indicacao2;
  except
  end;
  try
    EComissao1.Text     := format('%.2f',[Comissao1]);
  except
  end;
  try
    EComissao2.Text     := format('%.2f',[Comissao2]);
  except
  end;
  try
    EMeio.KeyValue := Meio;
  except
  end;
  try
    EMeioOutro.Text := MeioOutro;
  except
  end;
  try
    EObs.Text := Obs;
  except
  end;
end;

constructor TDetalhe_Venda.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'DETALHE_DE_PEDIDO_DE_VENDA';

     { Code to perform other tasks when the component is created }

end;

function TDetalhe_Venda.Deletar(CdCNC, CdPDV:integer):Boolean;
begin
  Result := False;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'DELETE FROM DETALHE_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV));
    Result := True;
  except
  end;
end;

destructor TDetalhe_Venda.Destroy;
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

function TDetalhe_Venda.FinalizaEdicao(Estado:integer):Boolean;
var
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  if CConfiguracao.Empresa in [empMotical,empLuciano] then
  Begin
    if not verificafloatBranco(EOD_ESF.text) then
      mensagem:= mensagem + 'OD_ESF incorreto!'+#13;
    if not verificafloatBranco(EOE_ESF.text) then
      mensagem:= mensagem + 'OE_ESF incorreto!'+#13;
    if not verificafloatBranco(EOD_CIL.text) then
      mensagem:= mensagem + 'OD_CIL incorreto!'+#13;
    if not verificafloatBranco(EOE_CIL.text) then
      mensagem:= mensagem + 'OE_CIL incorreto!'+#13;
    if not verificaInteiroBranco(EOD_EIXO.text) then
      mensagem:= mensagem + 'OD_EIXO incorreto!'+#13;
    if not verificaInteiroBranco(EOE_EIXO.text) then
      mensagem:= mensagem + 'OE_EIXO incorreto!'+#13;
    if not verificafloatBranco(EOD_DNP.text) then
      mensagem:= mensagem + 'OD_DNP incorreto!'+#13;
    if not verificafloatBranco(EOE_DNP.text) then
      mensagem:= mensagem + 'OE_DNP incorreto!'+#13;
    if not verificaInteiroBranco(EOD_ALT.text) then
      mensagem:= mensagem + 'OD_ALT incorreto!'+#13;
    if not verificaInteiroBranco(EOE_ALT.text) then
      mensagem:= mensagem + 'OE_ALT incorreto!'+#13;
    if not verificafloatBranco(EOD_ADICAO.text) then
      mensagem:= mensagem + 'OD_ADICAO incorreto!'+#13;
    if not verificafloatBranco(EOE_ADICAO.text) then
      mensagem:= mensagem + 'OE_ADICAO incorreto!'+#13;
  end;
  If mensagem <>'' Then
  Begin
    ShowMessage(mensagem);
    Exit;
  end;
  if CConfiguracao.Empresa in [empMotical,empLuciano] then
  Begin
    if (ABS(Frac(StrToFloat(EOD_ESF.text))) <> 0) and
       (ABS(Frac(StrToFloat(EOD_ESF.text))) <> 0.25) and
       (ABS(Frac(StrToFloat(EOD_ESF.text))) <> 0.50) and
       (ABS(Frac(StrToFloat(EOD_ESF.text))) <> 0.75) then
      mensagem := mensagem + 'OD_ESF incorreto!'+#13;
    if (ABS(Frac(StrToFloat(EOE_ESF.text))) <> 0) and
       (ABS(Frac(StrToFloat(EOE_ESF.text))) <> 0.25) and
       (ABS(Frac(StrToFloat(EOE_ESF.text))) <> 0.50) and
       (ABS(Frac(StrToFloat(EOE_ESF.text))) <> 0.75) then
      mensagem := mensagem + 'OE_ESF incorreto!'+#13;
    if (ABS(StrToFloat(EOD_ESF.text)) > 40) then
      mensagem := mensagem + 'OD_ESF incorreto!'+#13;
    if (ABS(StrToFloat(EOE_ESF.text)) > 40) then
      mensagem := mensagem + 'OE_ESF incorreto!'+#13;
  end;

  if mensagem <> '' then
  Begin
    ShowMessage(mensagem);
    Exit;
  end;

  if CConfiguracao.Empresa in [empMotical,empLuciano] then
  Begin
    if ((StrToFloat(EOD_CIL.text) > 0) and
        (StrToFloat(EOE_CIL.text) < 0)) or
       ((StrToFloat(EOE_CIL.text) > 0) and
        (StrToFloat(EOD_CIL.text) < 0)) then
    Begin
      ShowMessage('Padrão inválido!');
      Exit;
    end;
    //Alterar Padrão
    if (StrToFloat(EOD_CIL.text) > 0) or
       (StrToFloat(EOE_CIL.text) > 0) then
    Begin
      EOD_ESF.text := format('%.2f',[   StrToFloat(EOD_ESF.text)+StrToFloat(EOD_CIL.text)]);
      EOD_CIL.text := format('%.2f',[-1*StrToFloat(EOD_CIL.text)]);
      if StrToInt(EOD_EIXO.text) < 90 then
        EOD_EIXO.text := IntToStr(StrToInt(EOD_EIXO.text)+90)
      else
        EOD_EIXO.text := IntToStr(StrToInt(EOD_EIXO.text)-90);
      EOE_ESF.text := format('%.2f',[   StrToFloat(EOE_ESF.text)+StrToFloat(EOE_CIL.text)]);
      EOE_CIL.text := format('%.2f',[-1*StrToFloat(EOE_CIL.text)]);
      if StrToInt(EOE_EIXO.text) < 90 then
        EOE_EIXO.text := IntToStr(StrToInt(EOE_EIXO.text)+90)
      else
        EOE_EIXO.text := IntToStr(StrToInt(EOE_EIXO.text)-90);
    end;
  end;

  if Estado = 1 then
  Begin
    if InserirAuto then
      Result := True;
  end
  else
  Begin
    if AlterarAuto then
      Result := True;
  end;
end;

function TDetalhe_Venda.Inserir(CdCNC, CdPDV, CdFUN1, CdFUN2, CdMeio: integer; PComissao1, PComissao2: Double; PMeioOutro, PObs:string):Boolean;
begin
  Result := False;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO DETALHE_DE_PEDIDO_DE_VENDA '+
      ' (CNC_CODIGO,PDV_CODIGO,USU_CODIGO,DPV_DT_CADASTRO'+
      ',FUN_CODIGO_1,FUN_CODIGO_2,DPV_MEIO,DPV_MEIO_OUTRO '+
      ',DPV_COMISSAO_1,DPV_COMISSAO_2,DPV_SITUACAO,DPV_OBSERVACAO) VALUES ('+
      '  '+IntToStr(CdCNC)+
      ', '+IntToStr(CdPDV)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'"'+
      ', '+IntToStr(CdFUN1)+
      ', '+IntToStr(CdFUN1)+
      ', '+IntToStr(CdMeio)+
      ',"'+PMeioOutro+'" '+
      ', '+VirgPonto(PComissao1)+
      ', '+VirgPonto(PComissao2)+
      ',0'+ //Situacao
      ',"'+PObs+'")');
    Result:=True;
  except
    ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

function TDetalhe_Venda.InserirAuto:Boolean;
var
  sObservacao: string;
Begin
  Result := False;
  try
    sObservacao := EOBS.Text;
  except
    sObservacao := '';
  end;
  try
    if CConfiguracao.CodigoCNC = 3 then //Laboratório
    begin
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO DETALHE_DE_PEDIDO_DE_VENDA '+
        ' (CNC_CODIGO,PDV_CODIGO,USU_CODIGO,DPV_DT_CADASTRO'+
        ',DPV_TIPO_ARMACAO,DPV_OBS_ARMACAO,DPV_TIPO_LENTES,DPV_OBS_LENTES'+
        ',DPV_MEDICO_CRM,DPV_MEDICO_NOME'+
        ',DPV_OD_ESF,DPV_OE_ESF'+
        ',DPV_OD_CIL,DPV_OE_CIL'+
        ',DPV_OD_EIXO,DPV_OE_EIXO'+
        ',DPV_OD_DNP,DPV_OE_DNP'+
        ',DPV_OD_ALT,DPV_OE_ALT'+
        ',DPV_OD_ADICAO,DPV_OE_ADICAO '+
        ',DPV_SITUACAO,DPV_PASCIENTE '+
        ',DPV_OBSERVACAO) VALUES ('+
        '  '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+ECodigoPDV.Text+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'"'+
        ',"'+ETipoArmacao.Text+'" '+
        ',"'+EOBSArmacao.Text+'" '+
        ',"'+ETipoLentes.Text+'" '+
        ',"'+EOBSLentes.Text+'" '+
        ', '+EMedicoCRM.Text+
        ',"'+EMedicoNome.Text+'" '+
        ', '+VirgPonto(EOD_ESF.Text)+
        ', '+VirgPonto(EOE_ESF.Text)+
        ', '+VirgPonto(EOD_CIL.Text)+
        ', '+VirgPonto(EOE_CIL.Text)+
        ', '+VirgPonto(EOD_EIXO.Text)+
        ', '+VirgPonto(EOE_EIXO.Text)+
        ', '+VirgPonto(EOD_DNP.Text)+
        ', '+VirgPonto(EOE_DNP.Text)+
        ', '+VirgPonto(EOD_ALT.Text)+
        ', '+VirgPonto(EOE_ALT.Text)+
        ', '+VirgPonto(EOD_ADICAO.Text)+
        ', '+VirgPonto(EOE_ADICAO.Text)+
        ',0'+
        ',"'+EPasciente.Text+'" '+
        ',"'+sObservacao+'" '+
        ')');       //Situacao
      end
      else
      begin
        ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO DETALHE_DE_PEDIDO_DE_VENDA '+
        ' (CNC_CODIGO,PDV_CODIGO,USU_CODIGO,DPV_DT_CADASTRO'+
        ',DPV_TIPO_ARMACAO,DPV_OBS_ARMACAO,DPV_TIPO_LENTES,DPV_OBS_LENTES'+
        ',DPV_MEDICO_CRM,DPV_MEDICO_NOME'+

        ////Para o Labotario essas linhas devem estar comentadas
        ',FUN_CODIGO_1,FUN_CODIGO_2'+

        ',DPV_OD_ESF,DPV_OE_ESF'+
        ',DPV_OD_CIL,DPV_OE_CIL'+
        ',DPV_OD_EIXO,DPV_OE_EIXO'+
        ',DPV_OD_DNP,DPV_OE_DNP'+
        ',DPV_OD_ALT,DPV_OE_ALT'+
        ',DPV_OD_ADICAO,DPV_OE_ADICAO '+
        ',DPV_SITUACAO,DPV_PASCIENTE '+
        ',DPV_OBSERVACAO) VALUES ('+
        '  '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+ECodigoPDV.Text+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'"'+
        ',"'+ETipoArmacao.Text+'" '+
        ',"'+EOBSArmacao.Text+'" '+
        ',"'+ETipoLentes.Text+'" '+
        ',"'+EOBSLentes.Text+'" '+
        ', '+EMedicoCRM.Text+
        ',"'+EMedicoNome.Text+'" '+

        //Para o Labotario essas linhas devem estar comentadas
        ', '+IntToStr(EIndicacao1.KeyValue)+
        ', '+IntToStr(EIndicacao2.KeyValue)+

        ', '+VirgPonto(EOD_ESF.Text)+
        ', '+VirgPonto(EOE_ESF.Text)+
        ', '+VirgPonto(EOD_CIL.Text)+
        ', '+VirgPonto(EOE_CIL.Text)+
        ', '+VirgPonto(EOD_EIXO.Text)+
        ', '+VirgPonto(EOE_EIXO.Text)+
        ', '+VirgPonto(EOD_DNP.Text)+
        ', '+VirgPonto(EOE_DNP.Text)+
        ', '+VirgPonto(EOD_ALT.Text)+
        ', '+VirgPonto(EOE_ALT.Text)+
        ', '+VirgPonto(EOD_ADICAO.Text)+
        ', '+VirgPonto(EOE_ADICAO.Text)+
        ',0'+
        ',"'+EPasciente.Text+'" '+
        ',"'+sObservacao+'" '+
        ')');       //Situacao
      end;
    Result:=True;
  except
    ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TDetalhe_Venda.LimpaCampos(Estado:integer);
begin
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    ETipoArmacao.Clear
  except
  end;
  try
    EOBSArmacao.Clear
  except
  end;
  try
    ETipoLentes.Clear
  except
  end;
  try
    EOBSLentes.Clear
  except
  end;
  try
    EPasciente.Clear
  except
  end;
  try
    EMedicoNome.Clear
  except
  end;
  try
    if Estado <> 1 then
      EMedicoCRM.Clear
    else
      EMedicoCRM.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      EOD_ESF.Clear
    else
      EOD_ESF.Text    := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EOE_ESF.Clear
    else
      EOE_ESF.Text    := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EOD_CIL.Clear
    else
      EOD_CIL.Text    := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EOE_CIL.Clear
    else
      EOE_CIL.Text    := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EOD_EIXO.Clear
    else
      EOD_EIXO.Text    := '0';
  except
  end;
  try
    if Estado <> 1 then
      EOE_EIXO.Clear
    else
      EOE_EIXO.Text    := '0';
  except
  end;
  try
    if Estado <> 1 then
      EOD_DNP.Clear
    else
      EOD_DNP.Text    := '0,0';
  except
  end;
  try
    if Estado <> 1 then
      EOE_DNP.Clear
    else
      EOE_DNP.Text    := '0,0';
  except
  end;
  try
    if Estado <> 1 then
      EOD_ALT.Clear
    else
      EOD_ALT.Text    := '0';
  except
  end;
  try
    if Estado <> 1 then
      EOE_ALT.Clear
    else
      EOE_ALT.Text    := '0';
  except
  end;
  try
    if Estado <> 1 then
      EOD_ADICAO.Clear
    else
      EOD_ADICAO.Text    := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EOE_ADICAO.Clear
    else
      EOE_ADICAO.Text    := '0,00';
  except
  end;
  try
    EIndicacao1.KeyValue := 0;
  except
  end;
  try
    EIndicacao2.KeyValue := 0;
  except
  end;
  try
    EMeio.KeyValue := 0;
  except
  end;
  try
    EMeioOutro.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EComissao1.Clear
    else
      EComissao1.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EComissao2.Clear
    else
      EComissao2.Text := '0,00';
  except
  end;
end;


procedure TDetalhe_Venda.PreparaAlteracao;
begin
  Estado := 2;
  AtualizaCampos(True);
end;

procedure TDetalhe_Venda.PreparaInsercao;
begin
  Estado := 1;
  LimpaCampos(Estado);
  AtualizaCampos(True);
end;


end.
