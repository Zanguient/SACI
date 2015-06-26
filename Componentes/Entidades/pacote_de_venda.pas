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
unit Pacote_de_venda;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TPacote_de_venda = class(TSQuery)
    private
      { Private fields of TPacote_de_venda }
        { Storage for property Acrescimo }
        FAcrescimo : Double;
        { Storage for property Bloqueado }
        FBloqueado : Integer;
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
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property DataEmissaoVenda }
        FDataEmissaoVenda : TDateTime;
        { Storage for property ECPFCLI }
        FECPFCLI : TMaskEdit;
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodigoAGF }
        FECodigoAGF : TDBLookupComboBox;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoFPG }
        FECodigoFPG : TDBLookupComboBox;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TEdit;
        { Storage for property EMelhorData }
        FEMelhorData : TMaskEdit;
        { Storage for property ENomeCLI }
        FENomeCLI : TEdit;
        { Storage for property ENotaFiscal }
        FENotaFiscal : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ERGCLI }
        FERGCLI : TEdit;
        { Storage for property EResumo }
        FEResumo : TMemo;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ETipoPag }
        FETipoPag : TDBLookupComboBox;
        { Storage for property ETotal }
        FETotal : TEdit;
        { Storage for property EmUsu }
        FEmUsu : Integer;
        { Storage for property Entrada }
        FEntrada : Double;
        { Storage for property GrupoEspecial }
        FGrupoEspecial : Boolean;
        { Storage for property MaquinaPDV }
        FMaquinaPDV : Integer;
        { Storage for property MelhorData }
        FMelhorData : TDateTime;
        { Storage for property NotaCupom }
        FNotaCupom : Integer;
        { Storage for property NotaFiscal }
        FNotaFiscal : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TipoPag }
        FTipoPag : Integer;
        { Storage for property Total }
        FTotal : Double;
        { Storage for property Vencimentos }
        FVencimentos : String;

      { Private methods of TPacote_de_venda }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Acrescimo }
        function GetAcrescimo : Double;
        { Write method for property Acrescimo }
        procedure SetAcrescimo(Value : Double);
        { Read method for property Bloqueado }
        function GetBloqueado : Integer;
        { Write method for property Bloqueado }
        procedure SetBloqueado(Value : Integer);
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
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : Tdatetime);
        { Read method for property DataEmissaoVenda }
        function GetDataEmissaoVenda : TDateTime;
        { Write method for property DataEmissaoVenda }
        procedure SetDataEmissaoVenda(Value : TDateTime);
        { Read method for property EmUsu }
        function GetEmUsu : Integer;
        { Write method for property EmUsu }
        procedure SetEmUsu(Value : Integer);
        { Read method for property Entrada }
        function GetEntrada : Double;
        { Write method for property Entrada }
        procedure SetEntrada(Value : Double);
        { Read method for property GrupoEspecial }
        function GetGrupoEspecial : Boolean;
        { Write method for property GrupoEspecial }
        procedure SetGrupoEspecial(Value : Boolean);
        { Read method for property MaquinaPDV }
        function GetMaquinaPDV : Integer;
        { Write method for property MaquinaPDV }
        procedure SetMaquinaPDV(Value : Integer);
        { Read method for property MelhorData }
        function GetMelhorData : TDateTime;
        { Write method for property MelhorData }
        procedure SetMelhorData(Value : TDateTime);
        { Read method for property NotaCupom }
        function GetNotaCupom : Integer;
        { Write method for property NotaCupom }
        procedure SetNotaCupom(Value : Integer);
        { Read method for property NotaFiscal }
        function GetNotaFiscal : Integer;
        { Write method for property NotaFiscal }
        procedure SetNotaFiscal(Value : Integer);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TipoPag }
        function GetTipoPag : Integer;
        { Write method for property TipoPag }
        procedure SetTipoPag(Value : Integer);
        { Read method for property Total }
        function GetTotal : Double;
        { Write method for property Total }
        procedure SetTotal(Value : Double);
        { Read method for property Vencimentos }
        function GetVencimentos : String;
        { Write method for property Vencimentos }
        procedure SetVencimentos(Value : String);

    protected
      { Protected fields of TPacote_de_venda }

      { Protected methods of TPacote_de_venda }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TPacote_de_venda }

      { Public methods of TPacote_de_venda }
        function AbrirPedido:Boolean;
        function AlterarAuto(PSituacao,PListado:Integer;PTotal,PAcrescimo:Double;PGrupoEspecial:Boolean=False):Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdPDV:Integer):Boolean;
        destructor Destroy; override;
        function FecharPedido:Boolean;
        function FinalizaEdicao(PSituacao,PListado:integer;PTotal,PAcrescimo:Double):Boolean;
        { Insere um Pedido de Venda }
        function Inserir(CdCNC,CdPDV,CdCLI,CdAGF,CdFPG,PTipoPag,CdUSU,PSituacao:integer;  PTotal: Double; POBS: String;PCliCNC:Integer;PData:TDateTime;PGRPEsp:Boolean=False):boolean;
        function InserirAuto(PSituacao:Integer;PTotal,PAcrescimo:Double):Boolean;
        procedure LimpaCampos(Estado: integer=0);
        { Localiza um pedido de venda }
        function LocalizarCod(CdPDV,CdCNC:Integer):Boolean;
        function LocalizarPed(Usuario:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        procedure Resumo(Query:TQuery);
        function SelecionarPed(CdPDV,CdCNC:Integer):Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TPacote_de_venda }
        property Acrescimo : Double read GetAcrescimo write SetAcrescimo;
        property Bloqueado : Integer read GetBloqueado write SetBloqueado;
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        property CodigoAGF : Integer read GetCodigoAGF write SetCodigoAGF;
        { Código do Cliente }
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoFPG : Integer read GetCodigoFPG write SetCodigoFPG;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        { Código do Pedido de Venda }
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : Tdatetime
             read GetDataCadastro write SetDataCadastro;
        property DataEmissaoVenda : TDateTime
             read GetDataEmissaoVenda write SetDataEmissaoVenda;
        property ECPFCLI : TMaskEdit read FECPFCLI write FECPFCLI;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodigoAGF : TDBLookupComboBox
             read FECodigoAGF write FECodigoAGF;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoFPG : TDBLookupComboBox
             read FECodigoFPG write FECodigoFPG;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property EDataCadastro : TEdit
             read FEDataCadastro write FEDataCadastro;
        property EMelhorData : TMaskEdit read FEMelhorData write FEMelhorData;
        property ENomeCLI : TEdit read FENomeCLI write FENomeCLI;
        property ENotaFiscal : TEdit read FENotaFiscal write FENotaFiscal;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ERGCLI : TEdit read FERGCLI write FERGCLI;
        property EResumo : TMemo read FEResumo write FEResumo;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ETipoPag : TDBLookupComboBox read FETipoPag write FETipoPag;
        property ETotal : TEdit read FETotal write FETotal;
        property EmUsu : Integer read GetEmUsu write SetEmUsu;
        property Entrada : Double read GetEntrada write SetEntrada;
        property GrupoEspecial : Boolean
             read GetGrupoEspecial write SetGrupoEspecial;
        property MaquinaPDV : Integer read GetMaquinaPDV write SetMaquinaPDV;
        property MelhorData : TDateTime read GetMelhorData write SetMelhorData;
        property NotaCupom : Integer read GetNotaCupom write SetNotaCupom;
        property NotaFiscal : Integer read GetNotaFiscal write SetNotaFiscal;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TipoPag : Integer read GetTipoPag write SetTipoPag;
        property Total : Double read GetTotal write SetTotal;
        property Vencimentos : String read GetVencimentos write SetVencimentos;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TPacote_de_venda with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TPacote_de_venda]);
end;

{ Method to set variable and property values and create objects }
procedure TPacote_de_venda.AutoInitialize;
begin
     FECPFCLI := nil;
     FEClienteCNC := nil;
     FECodigoAGF := nil;
     FECodigoCLI := nil;
     FECodigoFPG := nil;
     FECodigoFUN := nil;
     FECodigoPDV := nil;
     FEDataCadastro := nil;
     FEMelhorData := nil;
     FENomeCLI := nil;
     FENotaFiscal := nil;
     FEOBS := nil;
     FERGCLI := nil;
     FEResumo := nil;
     FESituacao := nil;
     FETipoPag := nil;
     FETotal := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TPacote_de_venda.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECPFCLI then
        FECPFCLI := nil;
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoAGF then
        FECodigoAGF := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoFPG then
        FECodigoFPG := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEMelhorData then
        FEMelhorData := nil;
     if AComponent = FENomeCLI then
        FENomeCLI := nil;
     if AComponent = FENotaFiscal then
        FENotaFiscal := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FERGCLI then
        FERGCLI := nil;
     if AComponent = FEResumo then
        FEResumo := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipoPag then
        FETipoPag := nil;
     if AComponent = FETotal then
        FETotal := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TPacote_de_venda.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Acrescimo }
function TPacote_de_venda.GetAcrescimo : Double;
begin
  try
    Result := Self.fieldByName('PCT_ACRESCIMO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Acrescimo }
procedure TPacote_de_venda.SetAcrescimo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCT_ACRESCIMO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCT_ACRESCIMO"!');
    end;
end;

{ Read method for property Bloqueado }
function TPacote_de_venda.GetBloqueado : Integer;
begin
  try
    Result := Self.fieldByName('PCT_BLOQUEADO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Bloqueado }
procedure TPacote_de_venda.SetBloqueado(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCT_BLOQUEADO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCT_BLOQUEADO"!');
    end;
end;

{ Read method for property ClienteCNC }
function TPacote_de_venda.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property ClienteCNC }
procedure TPacote_de_venda.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoAGF }
function TPacote_de_venda.GetCodigoAGF : Integer;
begin
  try
    Result := Self.fieldByName('AGF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property CodigoAGF }
procedure TPacote_de_venda.SetCodigoAGF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_CODIGO"!');
    end;
end;


{ Read method for property CodigoCLI }
function TPacote_de_venda.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCLI }
procedure TPacote_de_venda.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPG }
function TPacote_de_venda.GetCodigoFPG : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property CodigoFPG }
procedure TPacote_de_venda.SetCodigoFPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO"!');
    end;
end;


{ Read method for property CodigoFUN }
function TPacote_de_venda.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFUN }
procedure TPacote_de_venda.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
  end;
end;

{ Read method for property CodigoPDV }
function TPacote_de_venda.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPDV }
procedure TPacote_de_venda.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
  end;
end;

{ Read method for property DataAlterado }
function TPacote_de_venda.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('PCT_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TPacote_de_venda.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCT_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCT_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TPacote_de_venda.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('PCT_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TPacote_de_venda.SetDataCadastro(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCT_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCT_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataEmissaoVenda }
function TPacote_de_venda.GetDataEmissaoVenda : TDateTime;
begin
  try
    Result := Self.fieldByName('PCT_DT_EMISSAO_VENDA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataEmissaoVenda }
procedure TPacote_de_venda.SetDataEmissaoVenda(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCT_DT_EMISSAO_VENDA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCT_DT_EMISSAO_VENDA"!');
  end;
end;

{ Read method for property EmUsu }
function TPacote_de_venda.GetEmUsu : Integer;
begin
  try
    Result := Self.fieldByName('PCT_EM_USO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property EmUsu }
procedure TPacote_de_venda.SetEmUsu(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCT_EM_USO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCT_EM_USO"!');
    end;
end;

{ Read method for property Entrada }
function TPacote_de_venda.GetEntrada : Double;
begin
  try
    Result := Self.fieldByName('PCT_ENTRADA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Entrada }
procedure TPacote_de_venda.SetEntrada(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCT_ENTRADA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCT_ENTRADA"!');
    end;
end;

{ Read method for property GrupoEspecial }
function TPacote_de_venda.GetGrupoEspecial : Boolean;
begin
  try
    result := (Self.fieldByName('PCT_GRUPO_ESPECIAL').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property GrupoEspecial }
procedure TPacote_de_venda.SetGrupoEspecial(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PCT_GRUPO_ESPECIAL').asInteger := 1
      else
        Self.fieldByName('PCT_GRUPO_ESPECIAL').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PCT_GRUPO_ESPECIAL"!');
    end;
end;

{ Read method for property MaquinaPDV }
function TPacote_de_venda.GetMaquinaPDV : Integer;
begin
  try
    Result := Self.fieldByName('PCT_MAQUINA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property MaquinaPDV }
procedure TPacote_de_venda.SetMaquinaPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCT_MAQUINA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCT_MAQUINA"!');
    end;
end;

{ Read method for property MelhorData }
function TPacote_de_venda.GetMelhorData : TDateTime;
begin
  try
    Result := Self.fieldByName('PCT_DT_MELHOR_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property MelhorData }
procedure TPacote_de_venda.SetMelhorData(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCT_DT_MELHOR_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCT_DT_MELHOR_DATA"!');
  end;
end;

{ Read method for property NotaCupom }
function TPacote_de_venda.GetNotaCupom : Integer;
begin
  try
    Result := Self.fieldByName('PCT_NOTA_CUPOM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NotaCupom }
procedure TPacote_de_venda.SetNotaCupom(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCT_NOTA_CUPOM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCT_NOTA_CUPOM"!');
    end;
end;

{ Read method for property NotaFiscal }
function TPacote_de_venda.GetNotaFiscal : Integer;
begin
 try
   Result := Self.fieldByName('PCT_NOTA_FISCAL').asInteger;
 except
   Result := 0;
 end;
end;

{ Write method for property NotaFiscal }
procedure TPacote_de_venda.SetNotaFiscal(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCT_NOTA_FISCAL').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCT_NOTA_FISCAL"!');
  end;
end;

{ Read method for property OBS }
function TPacote_de_venda.GetOBS : String;
begin
  try
    Result := Self.fieldByName('PCT_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TPacote_de_venda.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCT_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCT_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TPacote_de_venda.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('PCT_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TPacote_de_venda.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCT_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCT_SITUACAO"!');
  end;
end;

{ Read method for property TipoPag }
function TPacote_de_venda.GetTipoPag : Integer;
begin
  try
    Result := Self.fieldByName('PCT_TIPO_PAG').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TipoPag }
procedure TPacote_de_venda.SetTipoPag(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCT_TIPO_PAG').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCT_TIPO_PAG"!');
    end;
end;


{ Read method for property Total }
function TPacote_de_venda.GetTotal : Double;
begin
  try
    Result := Self.fieldByName('PCT_TOTAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Total }
procedure TPacote_de_venda.SetTotal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCT_TOTAL').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCT_TOTAL"!');
    end;
end;

{ Read method for property Vencimentos }
function TPacote_de_venda.GetVencimentos : String;
begin
  try
    Result := Self.fieldByName('PCT_VENCIMENTOS').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Vencimentos }
procedure TPacote_de_venda.SetVencimentos(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCT_VENCIMENTOS').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCT_VENCIMENTOS"!');
  end;
end;

function TPacote_de_venda.AbrirPedido:Boolean;
begin
  if FieldByName('PCT_EM_USO').asInteger=1 then
    result:=False
  else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE PACOTE_DE_VENDA SET '+
        ' PCT_EM_USO=1 '+
        ',PCT_SITUACAO=0 '+
        ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(CodigoPDV));
       result:=True;
    except
      result:=False;
    end;
  end;
end;

function TPacote_de_venda.AlterarAuto(PSituacao,PListado:Integer;PTotal,PAcrescimo:Double;PGrupoEspecial:Boolean=False):Boolean;
Var
  CdPDV,CdCNC,iGrupoEsp:Integer;
begin
  Result := False;
  CdPDV:=CodigoPDV;
  CdCNC:=CodigoCNC;

  if PGrupoEspecial then
    iGrupoEsp := 1
  else
    iGrupoEsp := 0;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE PACOTE_DE_VENDA SET '+
      ' FUN_CODIGO='+IntToStr(ECodigoFUN.KeyValue)+
      ',PCT_MAQUINA='+IntToStr(Maquina)+
      ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',PCT_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',CNC_CLIENTE='+EClienteCNC.Text+
      ',CLI_CODIGO='+ECodigoCLI.Text+
      ',PCT_TIPO_PAG='+IntToStr(ETipoPag.KeyValue)+
      ',FPG_CODIGO='+IntToStr(ECodigoFPG.KeyValue)+
      ',AGF_CODIGO='+IntToStr(ECodigoAGF.KeyValue)+
      ',PCT_LISTADO='+IntToStr(PListado)+
      ',PCT_TOTAL='+VirgPonto(PTotal)+
      ',PCT_ACRESCIMO='+VirgPonto(PAcrescimo)+
      ',PCT_GRUPO_ESPECIAL='+IntToStr(iGrupoEsp)+
      ',PCT_SITUACAO='+IntToStr(PSituacao)+
      ',PCT_OBSERVACAO="'+EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV));

    GeraLog(6790, CodigoCNC, CodigoPDV, 'CNCCLI:'+IntToStr(ClienteCNC)+
      ' CLI:'+IntToStr(CodigoCLI)+
      ' TipoPag:'+IntToStr(TipoPag)+
      ' FPG:'+IntToStr(CodigoFPG)+
      ' AGF:'+IntToStr(CodigoAGF));

    Result:=True;
    Close;
    Open;
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TPacote_de_venda.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled        :=not Habilitar;
  Except
  End;
  Try
    EResumo.Enabled        :=not Habilitar;
  Except
  End;
  try
    if not Habilitar then
      EMelhorData.Enabled  := False;
  Except
  End;
  try
    ECodigoCLI.Enabled     :=Habilitar;
  Except
  End;
  try
    ECodigoFUN.Enabled     :=Habilitar;
  Except
  End;
  try
    ECodigoAGF.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoFPG.Enabled     :=Habilitar;
  Except
  End;
  Try
    ETipoPag.Enabled     :=Habilitar;
  Except
  End;
  Try
    EOBS.Enabled           :=Habilitar;
  Except
  End;
end;

procedure TPacote_de_venda.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TPacote_de_venda.CarregaDados;
begin
  Try
   Case Situacao of
    -1: ESituacao.Text:='Venda Reservada';
    0: ESituacao.Text:='Em Aberto';
    3: ESituacao.Text:='Em Aberto';
    4: ESituacao.Text:='Venda Confirmada';
    6: ESituacao.Text:='Venda Cancelada';
    8: ESituacao.Text:='Venda Devolvida';
   End;
  Except
  End;
  Try
    ECodigoPDV.Text           :=IntToStr(CodigoPDV);
  Except
  End;
  Try
    ECodigoFUN.KeyValue        := CodigoFUN;
  Except
  End;
  Try
    EClienteCNC.Text           :=IntToStr(ClienteCNC);
  Except
  End;
  Try
    ECodigoCLI.Text           :=IntToStr(CodigoCLI);
  Except
  End;
  Try
    if DataCadastro=0 then
      EDataCadastro.Text:=''
    else
      EDataCadastro.Text            :=FormatDateTime('dd/mm/yyyy hh:nn:ss', DataCadastro);
  Except
  End;
  Try
    if MelhorData=0 then
      EMelhorData.Text:=''
    else
      EMelhorData.Text            :=FormatDateTime('dd/mm/yyyy', MelhorData);
  Except
  End;
  Try
    EOBS.Text                 :=Obs;
  Except
  End;
  Try
    ETotal.Text               :=Format('%.2f', [Total]);
  Except
  End;
  Try
    ENotaFiscal.Text      := IntToStr(NotaFiscal);
  Except
  End;
  Try
    ETipoPag.KeyValue       :=TipoPag;
  Except
  End;
  Try
    ECodigoFPG.KeyValue     :=CodigoFPG;
  Except
  End;
  Try
    ECodigoAGF.KeyValue     :=CodigoAGF;
  Except
  End;
end;

constructor TPacote_de_venda.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'PACOTE_DE_VENDA';

     { Code to perform other tasks when the component is created }

end;

function TPacote_de_venda.Deletar(CdCNC,CdPDV:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdPDV,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TPacote_de_venda.Destroy;
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

function TPacote_de_venda.FecharPedido:Boolean;
begin
  if (active) and (not IsEmpty) then
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE PACOTE_DE_VENDA SET '+
        ' PCT_EM_USO=0 '+
        ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(CodigoPDV));
      result:=True;
    except
      result:=False;
    end;
  end
  else
    result:=True;
end;

function TPacote_de_venda.FinalizaEdicao(PSituacao,PListado:integer;PTotal,PAcrescimo:Double):Boolean;
var
  Mensagem: string;
begin
  Result := False;
  mensagem := '';
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    If Estado=1 then
    Begin
      if Inserirauto(PSituacao,PTotal,PAcrescimo) then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    else If Estado=2 then
    Begin
      if Alterarauto(PSituacao,PListado,PTotal,PAcrescimo) then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
  end;
end;

{ Insere um Pedido de Venda }
function TPacote_de_venda.Inserir(CdCNC,CdPDV,CdCLI,CdAGF,CdFPG,PTipoPag,CdUSU,PSituacao:integer;  PTotal: Double; POBS: String;PCliCNC:Integer;PData:TDateTime;PGRPEsp:Boolean=False):boolean;
Var
  Cod:Integer;
begin
  Result:=false;
  if CdPDV=0 then
    Cod    := ProximoCodigo('PDV_CODIGO')
  else
    Cod    := CdPDV;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     Insert;
     try
       CodigoPDV      := Cod;
       try
         CodigoFPG      := CdFPG;
       except
       end;
       try
         CodigoAGF      := CdAGF;
       except
       end;
       try
         CodigoFUN      := 0;
       except
       end;
       try
         EmUsu      := 0;
       except
       end;
       try
         TipoPag      := PTipoPag;
       except
       end;
       try
         CodigoCNC      := CdCNC;
       except
       end;
       try
         CodigoCLI      := CdCLI;
       except
       end;
       try
         CodigoUSU      := CdUSU;
       except
       end;
       try
         ClienteCNC     := PCliCNC;
       except
       end;
       Try
         MaquinaPDV      := Maquina;
       Except
       End;
       Try
         DataCadastro       := PData;
       Except
       End;
       Try
         Acrescimo      := 0;
       Except
       End;
       Try
         Entrada      := 0;
       Except
       End;
       Try
         Total          := PTotal;
       Except
       End;
       Try
         NotaFiscal       := 0;
       Except
       End;
       Try
         NotaCupom       := 0;
       Except
       End;
       Try
         GrupoEspecial  := PGRPEsp;
       Except
       End;
       Try
         Bloqueado       := 0;
       Except
       End;       
       Try
         Situacao       := PSituacao;
       Except
       End;
       Try
         Obs            := POBS;
       Except
       End;
       try
         Post;
         result := true;

       except
         Cancel;
         ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TPacote_de_venda.InserirAuto(PSituacao:Integer;PTotal,PAcrescimo:Double):Boolean;
Var
  Aux:TDataSetNotifyEvent;
  CdCLICNC, CdCLI, CdTipoPag, CdFPG, CdAGF: integer;
begin
  result:=false;
  CdCLICNC := ClienteCNC;
  CdCLI    := CodigoCLI;
  CdTipoPag := TipoPag;
  CdFPG     := CodigoFPG;
  CdAGF     := CodigoAGF;
  try
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    append;
    try
       CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoPDV   := SCodigo;
    except
    end;
    try
       CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
       CodigoFUN   := ECodigoFUN.KeyValue;
    except
    end;
    try
       ClienteCNC   := StrToInt(EClienteCNC.Text);
    except
    end;
    try
       CodigoCLI := StrToInt(ECodigoCLI.Text);
    except
    end;
    Try
      EmUsu         := 0;
    Except
    End;
    Try
      MaquinaPDV      := Maquina;
    Except
    End;
    try
       DataCadastro := StrToDateTime(EDataCadastro.text);
    except
    end;
    try
       CodigoFPG   := ECodigoFPG.KeyValue;
    except
    end;
    try
       CodigoAGF   := ECodigoAGF.KeyValue;
    except
    end;
    try
       TipoPag   := ETipoPag.KeyValue;
    except
    end;
    try
       Total := PTotal;
    except
    end;
    try
       Acrescimo := PAcrescimo;
    except
    end;
    Try
      NotaCupom       := 0;
    Except
    End;
    try
       Bloqueado := 0;
    except
    end;    
    try
       Situacao := PSituacao;
    except
    end;
    try
       Obs := EOBS.Text;
    except
    end;
    try
      Post;

      GeraLog(6790, CodigoCNC, CodigoPDV, 'CNCCLI:'+IntToStr(CdCLICNC)+
        ' CLI:'+IntToStr(CdCLI)+
        ' TipoPag:'+IntToStr(CdTipoPag)+
        ' FPG:'+IntToStr(CdFPG)+
        ' AGF:'+IntToStr(CdAGF));

      AfterScroll:=Aux;
      CarregaDados;
      result:=True;

    except
      result:=False;
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TPacote_de_venda.LimpaCampos(Estado: integer=0);
begin
  Try
    if Estado <> 1 then
      ECodigoPDV.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      EClienteCNC.Clear
    else
      EClienteCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    ECodigoCLI.Clear;
  Except
  End;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MI:SS',CConfiguracao.DataHora);
  except
  end;
  Try
    if Estado <> 1 then
      ETipoPag.KeyValue := 0
    else
      ETipoPag.KeyValue := 5;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoFPG.KeyValue := 0
    else
      ECodigoFPG.KeyValue := 1;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoAGF.KeyValue := 0
    else
      ECodigoAGF.KeyValue := 1;
  Except
  End;
  Try
    ENotaFiscal.Clear;
  Except
  End;
  Try
    ENomeCLI.Clear;
  Except
  End;
  Try
    ECPFCLI.Clear;
  Except
  End;
  Try
    ERGCLI.Clear;
  Except
  End;
  Try
    EResumo.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.text := DateTimeToStr(CConfiguracao.DataHora);
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
end;

{ Localiza um pedido de venda }
function TPacote_de_venda.LocalizarCod(CdPDV,CdCNC:Integer):Boolean;
begin
  If (CdPDV<>CodigoPDV) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;PDV_CODIGO', vararrayof([CdCNC, CdPDV]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TPacote_de_venda.LocalizarPed(Usuario:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Close;
  SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA WHERE USU_CODIGO='+IntToStr(Usuario)
          +' ORDER BY USU_CODIGO';
  Open;
  Result := not isEmpty;
  Last;
end;

procedure TPacote_de_venda.PreparaAlteracao;
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TPacote_de_venda.PreparaInsercao;
begin
  ProximoCodigo('PDV_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

procedure TPacote_de_venda.Resumo(Query:TQuery);
Var
  Tot:Real;
begin
  Tot := 0;
  With Query do
  Begin
    First;
    EResumo.Clear;
    While not EOF do
    Begin
{
      If FieldByName('CARTAO').AsInteger=1 then
      Begin
        CAgenteFin.LocalizarCod(FieldByName('AGF_CODIGO').AsInteger,CConfiguracao.CodigoCNC);
        EResumo.Lines.Add('Cartão '+CAgenteFin.Descricao+' - '+Format('%.2n', [FieldByName('TRC_VALOR').AsFloat]));
        Tot:=Tot+StrToFloat(format('%.2f',[FieldByName('TRC_VALOR').AsFloat]));
      End
      Else
}
      Begin
        EResumo.Lines.Add(DateToStr(FieldByName('TRC_VENCIMENTO').AsDateTime)+' - '+
                          Format('%.2n', [FieldByName('TRC_VALOR').AsFloat]));
        Tot:=Tot+StrToFloat(format('%.2f',[FieldByName('TRC_VALOR').AsFloat]));
      End;
      Next;
    End;
  End;
  EResumo.Lines.Add('Total : '+Format('%.2n', [Tot]));
end;

function TPacote_de_venda.SelecionarPed(CdPDV,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Close;
  SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA WHERE PDV_CODIGO='+IntToStr(CdPDV);
  Open;
  Result := not isEmpty;
end;

function TPacote_de_venda.deletarauto:Boolean;
begin
  Result:=False;
  try
    if Delete then
    Begin
      Result := True;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
