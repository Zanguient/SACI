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
unit Informacoes;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Cliente, Avalista, Dbctrls, Configuracao, Dbgrids, 
     Funcoes, Variants;

type
  TInformacoes = class(TSQuery)
    private
      { Private fields of TInformacoes }
        { Storage for property Atrazo }
        FAtrazo : Integer;
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property Boleto }
        FBoleto : Boolean;
        { Storage for property CAvalista }
        FCAvalista : TAvalista;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property CampoInvalido }
        FCampoInvalido : Integer;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodigoAVL }
        FCodigoAVL : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoFPG }
        FCodigoFPG : Integer;
        { Storage for property CodigoPRF }
        FCodigoPRF : Integer;
        { Storage for property CreditoUtil }
        FCreditoUtil : Double;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataUltCompra }
        FDataUltCompra : Tdatetime;
        { Storage for property EAtrazo }
        FEAtrazo : TEdit;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property EBoleto }
        FEBoleto : TCheckBox;
        { Storage for property ECEP }
        FECEP : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoAVL }
        FECodigoAVL : TDBLookupComboBox;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoFPG }
        FECodigoFPG : TDBLookupComboBox;
        { Storage for property ECodigoPRF }
        FECodigoPRF : TDBLookupComboBox;
        { Storage for property ECreditoUtil }
        FECreditoUtil : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataUltCompra }
        FEDataUltCompra : TMaskEdit;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property ELiberaInadiplencia }
        FELiberaInadiplencia : TCheckBox;
        { Storage for property ELimiteCredito }
        FELimiteCredito : TEdit;
        { Storage for property ELimiteCreditoConvenio }
        FELimiteCreditoConvenio : TEdit;
        { Storage for property ELocalTrabalho }
        FELocalTrabalho : TEdit;
        { Storage for property ELogradouro }
        FELogradouro : TdbLookupComboBox;
        { Storage for property EMOT_PROIB }
        FEMOT_PROIB : TEdit;
        { Storage for property EOrigemExtra }
        FEOrigemExtra : TEdit;
        { Storage for property EProibido }
        FEProibido : TCheckbox;
        { Storage for property EReferencia1 }
        FEReferencia1 : TEdit;
        { Storage for property EReferencia2 }
        FEReferencia2 : TEdit;
        { Storage for property EReferencia3 }
        FEReferencia3 : TEdit;
        { Storage for property EReferencia4 }
        FEReferencia4 : TEdit;
        { Storage for property EReferenciaFone1 }
        FEReferenciaFone1 : TMaskEdit;
        { Storage for property EReferenciaFone2 }
        FEReferenciaFone2 : TMaskEdit;
        { Storage for property EReferenciaFone3 }
        FEReferenciaFone3 : TMaskEdit;
        { Storage for property EReferenciaFone4 }
        FEReferenciaFone4 : TMaskEdit;
        { Storage for property ERendaExtra }
        FERendaExtra : TEdit;
        { Storage for property ERendaMensal }
        FERendaMensal : TEdit;
        { Storage for property ETempoTrabalho }
        FETempoTrabalho : TEdit;
        { Storage for property EUF }
        FEUF : TComboBox;
        { Storage for property EValorInad }
        FEValorInad : TEdit;
        { Storage for property EValorUltCompra }
        FEValorUltCompra : TEdit;
        { Storage for property Endereco }
        FEndereco : String;
        { Storage for property LiberaInadiplencia }
        FLiberaInadiplencia : Boolean;
        { Storage for property LimiteCredito }
        FLimiteCredito : Double;
        { Storage for property LimiteCreditoConvenio }
        FLimiteCreditoConvenio : Double;
        { Storage for property LocalTrabalho }
        FLocalTrabalho : String;
        { Storage for property Logradouro }
        FLogradouro : Integer;
        { Storage for property MOT_PROIB }
        FMOT_PROIB : String;
        { Storage for property OrigemExtra }
        FOrigemExtra : String;
        { Storage for property Proibido }
        FProibido : Boolean;
        { Storage for property Referencia1 }
        FReferencia1 : String;
        { Storage for property Referencia2 }
        FReferencia2 : String;
        { Storage for property Referencia3 }
        FReferencia3 : String;
        { Storage for property Referencia4 }
        FReferencia4 : String;
        { Storage for property ReferenciaFone1 }
        FReferenciaFone1 : String;
        { Storage for property ReferenciaFone2 }
        FReferenciaFone2 : String;
        { Storage for property ReferenciaFone3 }
        FReferenciaFone3 : String;
        { Storage for property ReferenciaFone4 }
        FReferenciaFone4 : String;
        { Storage for property RendaExtra }
        FRendaExtra : Double;
        { Storage for property RendaMensal }
        FRendaMensal : Double;
        { Storage for property TempoTrabalho }
        FTempoTrabalho : Integer;
        { Storage for property UF }
        FUF : String;
        { Storage for property ValorInad }
        FValorInad : Double;
        { Storage for property ValorUltCompra }
        FValorUltCompra : Double;

      { Private methods of TInformacoes }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Atrazo }
        function GetAtrazo : Integer;
        { Write method for property Atrazo }
        procedure SetAtrazo(Value : Integer);
        { Read method for property Bairro }
        function GetBairro : String;
        { Write method for property Bairro }
        procedure SetBairro(Value : String);
        { Read method for property Boleto }
        function GetBoleto : Boolean;
        { Write method for property Boleto }
        procedure SetBoleto(Value : Boolean);
        { Read method for property CEP }
        function GetCEP : String;
        { Write method for property CEP }
        procedure SetCEP(Value : String);
        { Write method for property CampoInvalido }
        procedure SetCampoInvalido(Value : Integer);
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
        { Read method for property CodigoAVL }
        function GetCodigoAVL : Integer;
        { Write method for property CodigoAVL }
        procedure SetCodigoAVL(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoFPG }
        function GetCodigoFPG : Integer;
        { Write method for property CodigoFPG }
        procedure SetCodigoFPG(Value : Integer);
        { Read method for property CodigoPRF }
        function GetCodigoPRF : Integer;
        { Write method for property CodigoPRF }
        procedure SetCodigoPRF(Value : Integer);
        { Read method for property CreditoUtil }
        function GetCreditoUtil : Double;
        { Write method for property CreditoUtil }
        procedure SetCreditoUtil(Value : Double);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataUltCompra }
        function GetDataUltCompra : Tdatetime;
        { Write method for property DataUltCompra }
        procedure SetDataUltCompra(Value : Tdatetime);
        { Read method for property Endereco }
        function GetEndereco : String;
        { Write method for property Endereco }
        procedure SetEndereco(Value : String);
        { Read method for property LiberaInadiplencia }
        function GetLiberaInadiplencia : Boolean;
        { Write method for property LiberaInadiplencia }
        procedure SetLiberaInadiplencia(Value : Boolean);
        { Read method for property LimiteCredito }
        function GetLimiteCredito : Double;
        { Write method for property LimiteCredito }
        procedure SetLimiteCredito(Value : Double);
        { Read method for property LimiteCreditoConvenio }
        function GetLimiteCreditoConvenio : Double;
        { Write method for property LimiteCreditoConvenio }
        procedure SetLimiteCreditoConvenio(Value : Double);
        { Read method for property LocalTrabalho }
        function GetLocalTrabalho : String;
        { Write method for property LocalTrabalho }
        procedure SetLocalTrabalho(Value : String);
        { Read method for property Logradouro }
        function GetLogradouro : Integer;
        { Write method for property Logradouro }
        procedure SetLogradouro(Value : Integer);
        { Read method for property MOT_PROIB }
        function GetMOT_PROIB : String;
        { Write method for property MOT_PROIB }
        procedure SetMOT_PROIB(Value : String);
        { Read method for property OrigemExtra }
        function GetOrigemExtra : String;
        { Write method for property OrigemExtra }
        procedure SetOrigemExtra(Value : String);
        { Read method for property Proibido }
        function GetProibido : Boolean;
        { Write method for property Proibido }
        procedure SetProibido(Value : Boolean);
        { Read method for property Referencia1 }
        function GetReferencia1 : String;
        { Write method for property Referencia1 }
        procedure SetReferencia1(Value : String);
        { Read method for property Referencia2 }
        function GetReferencia2 : String;
        { Write method for property Referencia2 }
        procedure SetReferencia2(Value : String);
        { Read method for property Referencia3 }
        function GetReferencia3 : String;
        { Write method for property Referencia3 }
        procedure SetReferencia3(Value : String);
        { Read method for property Referencia4 }
        function GetReferencia4 : String;
        { Write method for property Referencia4 }
        procedure SetReferencia4(Value : String);
        { Read method for property ReferenciaFone1 }
        function GetReferenciaFone1 : String;
        { Write method for property ReferenciaFone1 }
        procedure SetReferenciaFone1(Value : String);
        { Read method for property ReferenciaFone2 }
        function GetReferenciaFone2 : String;
        { Write method for property ReferenciaFone2 }
        procedure SetReferenciaFone2(Value : String);
        { Read method for property ReferenciaFone3 }
        function GetReferenciaFone3 : String;
        { Write method for property ReferenciaFone3 }
        procedure SetReferenciaFone3(Value : String);
        { Read method for property ReferenciaFone4 }
        function GetReferenciaFone4 : String;
        { Write method for property ReferenciaFone4 }
        procedure SetReferenciaFone4(Value : String);
        { Read method for property RendaExtra }
        function GetRendaExtra : Double;
        { Write method for property RendaExtra }
        procedure SetRendaExtra(Value : Double);
        { Read method for property RendaMensal }
        function GetRendaMensal : Double;
        { Write method for property RendaMensal }
        procedure SetRendaMensal(Value : Double);
        { Read method for property TempoTrabalho }
        function GetTempoTrabalho : Integer;
        { Write method for property TempoTrabalho }
        procedure SetTempoTrabalho(Value : Integer);
        { Read method for property UF }
        function GetUF : String;
        { Write method for property UF }
        procedure SetUF(Value : String);
        { Read method for property ValorInad }
        function GetValorInad : Double;
        { Write method for property ValorInad }
        procedure SetValorInad(Value : Double);
        { Read method for property ValorUltCompra }
        function GetValorUltCompra : Double;
        { Write method for property ValorUltCompra }
        procedure SetValorUltCompra(Value : Double);

    protected
      { Protected fields of TInformacoes }

      { Protected methods of TInformacoes }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TInformacoes }

      { Public methods of TInformacoes }
        function AlterarAuto:Boolean;
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdCLI:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Informações de Crédito }
        function Inserir(CdCNC,CdCLI,CdAVL,PAtrazo,PLogra,CdFPG:integer;PValorUltCompra,PValorInad,PLimite,PRenda:Double;DT_ULT_COMPRA:TDateTime;PMOT_PROIB,PEnd,PBai,PCid,PUF,PCEP:string;PProibido,PBoleto:Boolean;PCreditoUtil:Double;PLimConv:double=0):Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdCLI,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TInformacoes }
        property Atrazo : Integer read GetAtrazo write SetAtrazo;
        property Bairro : String read GetBairro write SetBairro;
        property Boleto : Boolean read GetBoleto write SetBoleto;
        property CAvalista : TAvalista read FCAvalista write FCAvalista;
        property CEP : String read GetCEP write SetCEP;
        property CampoInvalido : Integer
             read FCampoInvalido write SetCampoInvalido;
        property Cidade : String read GetCidade write SetCidade;
        property CodigoAVL : Integer read GetCodigoAVL write SetCodigoAVL;
        { Código do Cliente }
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoFPG : Integer read GetCodigoFPG write SetCodigoFPG;
        property CodigoPRF : Integer read GetCodigoPRF write SetCodigoPRF;
        property CreditoUtil : Double read GetCreditoUtil write SetCreditoUtil;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataUltCompra : Tdatetime
             read GetDataUltCompra write SetDataUltCompra;
        property EAtrazo : TEdit read FEAtrazo write FEAtrazo;
        property EBairro : TEdit read FEBairro write FEBairro;
        property EBoleto : TCheckBox read FEBoleto write FEBoleto;
        property ECEP : TMaskEdit read FECEP write FECEP;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoAVL : TDBLookupComboBox
             read FECodigoAVL write FECodigoAVL;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoFPG : TDBLookupComboBox
             read FECodigoFPG write FECodigoFPG;
        property ECodigoPRF : TDBLookupComboBox
             read FECodigoPRF write FECodigoPRF;
        property ECreditoUtil : TEdit read FECreditoUtil write FECreditoUtil;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataUltCompra : TMaskEdit
             read FEDataUltCompra write FEDataUltCompra;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property ELiberaInadiplencia : TCheckBox
             read FELiberaInadiplencia write FELiberaInadiplencia;
        property ELimiteCredito : TEdit
             read FELimiteCredito write FELimiteCredito;
        property ELimiteCreditoConvenio : TEdit
             read FELimiteCreditoConvenio write FELimiteCreditoConvenio;
        property ELocalTrabalho : TEdit
             read FELocalTrabalho write FELocalTrabalho;
        property ELogradouro : TdbLookupComboBox
             read FELogradouro write FELogradouro;
        property EMOT_PROIB : TEdit read FEMOT_PROIB write FEMOT_PROIB;
        property EOrigemExtra : TEdit read FEOrigemExtra write FEOrigemExtra;
        property EProibido : TCheckbox read FEProibido write FEProibido;
        property EReferencia1 : TEdit read FEReferencia1 write FEReferencia1;
        property EReferencia2 : TEdit read FEReferencia2 write FEReferencia2;
        property EReferencia3 : TEdit read FEReferencia3 write FEReferencia3;
        property EReferencia4 : TEdit read FEReferencia4 write FEReferencia4;
        property EReferenciaFone1 : TMaskEdit
             read FEReferenciaFone1 write FEReferenciaFone1;
        property EReferenciaFone2 : TMaskEdit
             read FEReferenciaFone2 write FEReferenciaFone2;
        property EReferenciaFone3 : TMaskEdit
             read FEReferenciaFone3 write FEReferenciaFone3;
        property EReferenciaFone4 : TMaskEdit
             read FEReferenciaFone4 write FEReferenciaFone4;
        property ERendaExtra : TEdit read FERendaExtra write FERendaExtra;
        property ERendaMensal : TEdit read FERendaMensal write FERendaMensal;
        property ETempoTrabalho : TEdit
             read FETempoTrabalho write FETempoTrabalho;
        property EUF : TComboBox read FEUF write FEUF;
        property EValorInad : TEdit read FEValorInad write FEValorInad;
        property EValorUltCompra : TEdit
             read FEValorUltCompra write FEValorUltCompra;
        property Endereco : String read GetEndereco write SetEndereco;
        property LiberaInadiplencia : Boolean
             read GetLiberaInadiplencia write SetLiberaInadiplencia;
        property LimiteCredito : Double
             read GetLimiteCredito write SetLimiteCredito;
        property LimiteCreditoConvenio : Double
             read GetLimiteCreditoConvenio write SetLimiteCreditoConvenio;
        property LocalTrabalho : String
             read GetLocalTrabalho write SetLocalTrabalho;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property MOT_PROIB : String read GetMOT_PROIB write SetMOT_PROIB;
        property OrigemExtra : String read GetOrigemExtra write SetOrigemExtra;
        property Proibido : Boolean read GetProibido write SetProibido;
        property Referencia1 : String read GetReferencia1 write SetReferencia1;
        property Referencia2 : String read GetReferencia2 write SetReferencia2;
        property Referencia3 : String read GetReferencia3 write SetReferencia3;
        property Referencia4 : String read GetReferencia4 write SetReferencia4;
        property ReferenciaFone1 : String
             read GetReferenciaFone1 write SetReferenciaFone1;
        property ReferenciaFone2 : String
             read GetReferenciaFone2 write SetReferenciaFone2;
        property ReferenciaFone3 : String
             read GetReferenciaFone3 write SetReferenciaFone3;
        property ReferenciaFone4 : String
             read GetReferenciaFone4 write SetReferenciaFone4;
        property RendaExtra : Double read GetRendaExtra write SetRendaExtra;
        property RendaMensal : Double read GetRendaMensal write SetRendaMensal;
        property TempoTrabalho : Integer
             read GetTempoTrabalho write SetTempoTrabalho;
        property UF : String read GetUF write SetUF;
        property ValorInad : Double read GetValorInad write SetValorInad;
        property ValorUltCompra : Double
             read GetValorUltCompra write SetValorUltCompra;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TInformacoes with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TInformacoes]);
end;

{ Method to set variable and property values and create objects }
procedure TInformacoes.AutoInitialize;
begin
     FEAtrazo := nil;
     FEBairro := nil;
     FEBoleto := nil;
     FECEP := nil;
     FECidade := nil;
     FECodigoAVL := nil;
     FECodigoCLI := nil;
     FECodigoFPG := nil;
     FECodigoPRF := nil;
     FECreditoUtil := nil;
     FEDataAlterado := nil;
     FEDataUltCompra := nil;
     FEEndereco := nil;
     FELiberaInadiplencia := nil;
     FELimiteCredito := nil;
     FELimiteCreditoConvenio := nil;
     FELocalTrabalho := nil;
     FELogradouro := nil;
     FEMOT_PROIB := nil;
     FEOrigemExtra := nil;
     FEProibido := nil;
     FEReferencia1 := nil;
     FEReferencia2 := nil;
     FEReferencia3 := nil;
     FEReferencia4 := nil;
     FEReferenciaFone1 := nil;
     FEReferenciaFone2 := nil;
     FEReferenciaFone3 := nil;
     FEReferenciaFone4 := nil;
     FERendaExtra := nil;
     FERendaMensal := nil;
     FETempoTrabalho := nil;
     FEUF := nil;
     FEValorInad := nil;
     FEValorUltCompra := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TInformacoes.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAtrazo then
        FEAtrazo := nil;
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FEBoleto then
        FEBoleto := nil;
     if AComponent = FECEP then
        FECEP := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoAVL then
        FECodigoAVL := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoFPG then
        FECodigoFPG := nil;
     if AComponent = FECodigoPRF then
        FECodigoPRF := nil;
     if AComponent = FECreditoUtil then
        FECreditoUtil := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataUltCompra then
        FEDataUltCompra := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FELiberaInadiplencia then
        FELiberaInadiplencia := nil;
     if AComponent = FELimiteCredito then
        FELimiteCredito := nil;
     if AComponent = FELimiteCreditoConvenio then
        FELimiteCreditoConvenio := nil;
     if AComponent = FELocalTrabalho then
        FELocalTrabalho := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FEMOT_PROIB then
        FEMOT_PROIB := nil;
     if AComponent = FEOrigemExtra then
        FEOrigemExtra := nil;
     if AComponent = FEProibido then
        FEProibido := nil;
     if AComponent = FEReferencia1 then
        FEReferencia1 := nil;
     if AComponent = FEReferencia2 then
        FEReferencia2 := nil;
     if AComponent = FEReferencia3 then
        FEReferencia3 := nil;
     if AComponent = FEReferencia4 then
        FEReferencia4 := nil;
     if AComponent = FEReferenciaFone1 then
        FEReferenciaFone1 := nil;
     if AComponent = FEReferenciaFone2 then
        FEReferenciaFone2 := nil;
     if AComponent = FEReferenciaFone3 then
        FEReferenciaFone3 := nil;
     if AComponent = FEReferenciaFone4 then
        FEReferenciaFone4 := nil;
     if AComponent = FERendaExtra then
        FERendaExtra := nil;
     if AComponent = FERendaMensal then
        FERendaMensal := nil;
     if AComponent = FETempoTrabalho then
        FETempoTrabalho := nil;
     if AComponent = FEUF then
        FEUF := nil;
     if AComponent = FEValorInad then
        FEValorInad := nil;
     if AComponent = FEValorUltCompra then
        FEValorUltCompra := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TInformacoes.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Atrazo }
function TInformacoes.GetAtrazo : Integer;
begin
  try
    Result := Self.fieldByName('ICR_ATRAZO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Atrazo }
procedure TInformacoes.SetAtrazo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICR_ATRAZO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICR_ATRAZO"!');
    end;
end;

{ Read method for property Bairro }
function TInformacoes.GetBairro : String;
begin
  try
    Result := Self.fieldByName('ICR_BAIRRO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Bairro }
procedure TInformacoes.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_BAIRRO"!');
  end;
end;

{ Read method for property Boleto }
function TInformacoes.GetBoleto : Boolean;
begin
  try
    Result := (Self.fieldByName('ICR_BOLETO').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Boleto }
procedure TInformacoes.SetBoleto(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    if value then
      Self.fieldByName('ICR_BOLETO').asInteger := 1
    else
      Self.fieldByName('ICR_BOLETO').asInteger := 0;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_BOLETO"!');
  end;
end;

{ Read method for property CEP }
function TInformacoes.GetCEP : String;
begin
  try
    Result := Self.fieldByName('ICR_CEP').asString;
  except
    result:= '';
  end;
end;

{ Write method for property CEP }
procedure TInformacoes.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_CEP"!');
  end;
end;

{ Write method for property CampoInvalido }
procedure TInformacoes.SetCampoInvalido(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICR_IFFSPC').asInteger := Value;
    except
    end;
end;

{ Read method for property Cidade }
function TInformacoes.GetCidade : String;
begin
  try
    Result := Self.fieldByName('ICR_CIDADE').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Cidade }
procedure TInformacoes.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_CIDADE"!');
  end;
end;

{ Read method for property CodigoAVL }
function TInformacoes.GetCodigoAVL : Integer;
begin
  try
    Result := Self.fieldByName('AVL_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoAVL }
procedure TInformacoes.SetCodigoAVL(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AVL_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AVL_CODIGO"!');
    end;
end;

{ Read method for property CodigoCLI }
function TInformacoes.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCLI }
procedure TInformacoes.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPG }
function TInformacoes.GetCodigoFPG : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFPG }
procedure TInformacoes.SetCodigoFPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRF }
function TInformacoes.GetCodigoPRF : Integer;
begin
  try
    Result := Self.fieldByName('PRF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPRF }
procedure TInformacoes.SetCodigoPRF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRF_CODIGO"!');
    end;
end;

{ Read method for property CreditoUtil }
function TInformacoes.GetCreditoUtil : Double;
begin
  try
    Result := Self.fieldByName('ICR_CRED_UTIL').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property CreditoUtil }
procedure TInformacoes.SetCreditoUtil(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_CRED_UTIL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_CRED_UTIL"!');
  end;
end;

{ Read method for property DataAlterado }
function TInformacoes.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('ICR_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TInformacoes.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataUltCompra }
function TInformacoes.GetDataUltCompra : Tdatetime;
begin
  try
    Result := Self.fieldByName('ICR_DT_ULT_CMP').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataUltCompra }
procedure TInformacoes.SetDataUltCompra(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_DT_ULT_CMP').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_DT_ULT_CMP"!');
  end;
end;

{ Read method for property Endereco }
function TInformacoes.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('ICR_ENDERECO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TInformacoes.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_ENDERECO"!');
  end;
end;

{ Read method for property LiberaInadiplencia }
function TInformacoes.GetLiberaInadiplencia : Boolean;
begin
  try
    Result := (Self.fieldByName('ICR_LIBERA_INADIPLENCIA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property LiberaInadiplencia }
procedure TInformacoes.SetLiberaInadiplencia(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    if value then
      Self.fieldByName('ICR_LIBERA_INADIPLENCIA').asInteger := 1
    else
      Self.fieldByName('ICR_LIBERA_INADIPLENCIA').asInteger := 0;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_LIBERA_INADIPLENCIA"!');
  end;
end;

{ Read method for property LimiteCredito }
function TInformacoes.GetLimiteCredito : Double;
begin
  try
    Result := Self.fieldByName('ICR_LIM_CRD').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property LimiteCredito }
procedure TInformacoes.SetLimiteCredito(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_LIM_CRD').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_LIM_CRD"!');
  end;
end;

{ Read method for property LimiteCreditoConvenio }
function TInformacoes.GetLimiteCreditoConvenio : Double;
begin
  try
    Result := Self.fieldByName('ICR_LIM_CRD_CONVENIO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property LimiteCreditoConvenio }
procedure TInformacoes.SetLimiteCreditoConvenio(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_LIM_CRD_CONVENIO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_LIM_CRD_CONVENIO"!');
  end;
end;

{ Read method for property LocalTrabalho }
function TInformacoes.GetLocalTrabalho : String;
begin
  try
    Result := Self.fieldByName('ICR_LOCAL_TRABALHO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property LocalTrabalho }
procedure TInformacoes.SetLocalTrabalho(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_LOCAL_TRABALHO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_LOCAL_TRABALHO"!');
  end;
end;

{ Read method for property Logradouro }
function TInformacoes.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('ICR_LOGRADOURO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Logradouro }
procedure TInformacoes.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICR_LOGRADOURO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICR_LOGRADOURO"!');
    end;
end;

{ Read method for property MOT_PROIB }
function TInformacoes.GetMOT_PROIB : String;
begin
  try
    Result := Self.fieldByName('ICR_MOT_PROIB').asString;
  except
    result:= '';
  end;
end;

{ Write method for property MOT_PROIB }
procedure TInformacoes.SetMOT_PROIB(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_MOT_PROIB').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_MOT_PROIB"!');
  end;
end;

{ Read method for property OrigemExtra }
function TInformacoes.GetOrigemExtra : String;
begin
  try
    Result := Self.fieldByName('ICR_ORIGEM_EXTRA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property OrigemExtra }
procedure TInformacoes.SetOrigemExtra(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_ORIGEM_EXTRA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_ORIGEM_EXTRA"!');
  end;
end;

{ Read method for property Proibido }
function TInformacoes.GetProibido : Boolean;
begin
  try
    Result := (Self.fieldByName('ICR_PROIBIDO').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Proibido }
procedure TInformacoes.SetProibido(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    if value then
      Self.fieldByName('ICR_PROIBIDO').asInteger := 1
    else
      Self.fieldByName('ICR_PROIBIDO').asInteger := 0;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_PROIBIDO"!');
  end;
end;

{ Read method for property Referencia1 }
function TInformacoes.GetReferencia1 : String;
begin
  try
    Result := Self.fieldByName('ICR_REFERENCIA1').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Referencia1 }
procedure TInformacoes.SetReferencia1(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_REFERENCIA1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_REFERENCIA1"!');
  end;
end;

{ Read method for property Referencia2 }
function TInformacoes.GetReferencia2 : String;
begin
  try
    Result := Self.fieldByName('ICR_REFERENCIA2').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Referencia2 }
procedure TInformacoes.SetReferencia2(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_REFERENCIA2').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_REFERENCIA2"!');
  end;
end;

{ Read method for property Referencia3 }
function TInformacoes.GetReferencia3 : String;
begin
  try
    Result := Self.fieldByName('ICR_REFERENCIA3').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Referencia3 }
procedure TInformacoes.SetReferencia3(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_REFERENCIA3').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_REFERENCIA3"!');
  end;
end;

{ Read method for property Referencia4 }
function TInformacoes.GetReferencia4 : String;
begin
  try
    Result := Self.fieldByName('ICR_REFERENCIA4').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Referencia4 }
procedure TInformacoes.SetReferencia4(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_REFERENCIA4').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_REFERENCIA4"!');
  end;
end;

{ Read method for property ReferenciaFone1 }
function TInformacoes.GetReferenciaFone1 : String;
begin
  try
    Result := Self.fieldByName('ICR_FONE_REFERENCIA1').asString;
  except
    result:= '';
  end;
end;

{ Write method for property ReferenciaFone1 }
procedure TInformacoes.SetReferenciaFone1(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_FONE_REFERENCIA1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_FONE_REFERENCIA1"!');
  end;
end;

{ Read method for property ReferenciaFone2 }
function TInformacoes.GetReferenciaFone2 : String;
begin
  try
    Result := Self.fieldByName('ICR_FONE_REFERENCIA2').asString;
  except
    result:= '';
  end;
end;

{ Write method for property ReferenciaFone2 }
procedure TInformacoes.SetReferenciaFone2(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_FONE_REFERENCIA2').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_FONE_REFERENCIA2"!');
  end;
end;

{ Read method for property ReferenciaFone3 }
function TInformacoes.GetReferenciaFone3 : String;
begin
  try
    Result := Self.fieldByName('ICR_FONE_REFERENCIA3').asString;
  except
    result:= '';
  end;
end;

{ Write method for property ReferenciaFone3 }
procedure TInformacoes.SetReferenciaFone3(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_FONE_REFERENCIA3').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_FONE_REFERENCIA3"!');
  end;
end;

{ Read method for property ReferenciaFone4 }
function TInformacoes.GetReferenciaFone4 : String;
begin
  try
    Result := Self.fieldByName('ICR_FONE_REFERENCIA4').asString;
  except
    result:= '';
  end;
end;

{ Write method for property ReferenciaFone4 }
procedure TInformacoes.SetReferenciaFone4(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_FONE_REFERENCIA4').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_FONE_REFERENCIA4"!');
  end;
end;

{ Read method for property RendaExtra }
function TInformacoes.GetRendaExtra : Double;
begin
  try
    Result := Self.fieldByName('ICR_RENDA_EXTRA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property RendaExtra }
procedure TInformacoes.SetRendaExtra(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_RENDA_EXTRA').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_RENDA_EXTRA"!');
  end;
end;

{ Read method for property RendaMensal }
function TInformacoes.GetRendaMensal : Double;
begin
  try
    Result := Self.fieldByName('ICR_RENDA_MENSAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property RendaMensal }
procedure TInformacoes.SetRendaMensal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_RENDA_MENSAL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_RENDA_MENSAL"!');
  end;
end;

{ Read method for property TempoTrabalho }
function TInformacoes.GetTempoTrabalho : Integer;
begin
  try
    Result := Self.fieldByName('ICR_TEMPO_TRABALHO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TempoTrabalho }
procedure TInformacoes.SetTempoTrabalho(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_TEMPO_TRABALHO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_TEMPO_TRABALHO"!');
  end;
end;

{ Read method for property UF }
function TInformacoes.GetUF : String;
begin
  try
    Result := Self.fieldByName('ICR_UF').asString;
  except
    result:= '';
  end;
end;

{ Write method for property UF }
procedure TInformacoes.SetUF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICR_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICR_UF"!');
  end;
end;

{ Read method for property ValorInad }
function TInformacoes.GetValorInad : Double;
begin
  try
    Result := Self.fieldByName('ICR_VL_INAD').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ValorInad }
procedure TInformacoes.SetValorInad(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICR_VL_INAD').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICR_VL_INAD"!');
    end;
end;

{ Read method for property ValorUltCompra }
function TInformacoes.GetValorUltCompra : Double;
begin
  try
    result := Self.fieldByName('ICR_VL_ULT_CMP').asFLoat;
  except
    Result := 0;
  end;
end;

{ Write method for property ValorUltCompra }
procedure TInformacoes.SetValorUltCompra(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICR_VL_ULT_CMP').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICR_VL_ULT_CMP"!');
    end;
end;

function TInformacoes.AlterarAuto:Boolean;
var
  sAvalista, sDtUltimaCompra, sValorUltimaCompra, sDiasAtraso,
    sValorInad, sCreditoUtil, sLimiteCredito, sLimiteCreditoConvenio,
    sProibido, PLogradouro, sBoleto, sLiberaInadiplencia, sCodigoFPG,
    sRendaMensal, sRendaExtra, sTempoTrabalho : string;
begin
  try
    try
      sAvalista := IntToStr(ECodigoAVL.KeyValue);
    except
      sAvalista := '0';
    end;
    try
      sDtUltimaCompra := '"'+MesDiaHora(StrToDateTime(EDataUltCompra.Text))+'"';
    except
      sDtUltimaCompra := 'NULL';
    end;
    try
      sValorUltimaCompra := VirgPonto(EValorUltCompra.Text);
    except
      sValorUltimaCompra := '0';
    end;
    try
      sDiasAtraso := IntToStr(StrToInt(EAtrazo.Text));
    except
      sDiasAtraso := '0';
    end;
    try
      sValorInad := VirgPonto(EValorInad.Text);
    except
      sValorInad := '0';
    end;
    try
      sLimiteCredito := VirgPonto(ELimiteCredito.Text);
    except
      sLimiteCredito := '0';
    end;
    try
      sLimiteCreditoConvenio := VirgPonto(ELimiteCreditoConvenio.Text);
    except
      sLimiteCreditoConvenio := '0';
    end;
    try
      sCreditoUtil := VirgPonto(ECreditoUtil.Text);
    except
      sCreditoUtil := '0';
    end;
    try
      if EProibido.Checked then
        sProibido := '1'
      else
        sProibido := '0';
    except
      sProibido := '0';
    end;
    try
      if EBoleto.Checked then
        sBoleto := '1'
      else
        sBoleto := '0';
    except
      sBoleto := '0';
    end;
    try
      if ELiberaInadiplencia.Checked then
        sLiberaInadiplencia := '1'
      else
        sLiberaInadiplencia := '0';
    except
      sLiberaInadiplencia := '0';
    end;
    try
      PLogradouro := IntToStr(ELogradouro.KeyValue);
    except
      PLogradouro := '0';
    end;
    try
      sCodigoFPG := IntToStr(ECodigoFPG.KeyValue);
    except
      sCodigoFPG := '0';
    end;
    try
      sRendaMensal := VirgPonto(ERendaMensal.Text);
    except
      sRendaMensal := '0';
    end;
    try
      sRendaExtra := VirgPonto(ERendaExtra.Text);
    except
      sRendaExtra := '0';
    end;
    try
      sTempoTrabalho := IntToStr(StrToInt(ETempoTrabalho.Text));
    except
      sTempoTrabalho := '0';
    end;


    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
      ' USU_CODIGO='      +IntToStr(CConfiguracao.CodigoUSU)+
      ',ICR_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',AVL_CODIGO='      +sAvalista+
      ',ICR_DT_ULT_CMP='  +sDtUltimaCompra+
      ',ICR_VL_ULT_CMP='  +sValorUltimaCompra+
      ',ICR_ATRAZO='      +sDiasAtraso+
      ',ICR_VL_INAD='     +sValorInad+
      ',ICR_LIM_CRD='     +sLimiteCredito+
      ',ICR_LIM_CRD_CONVENIO=' +sLimiteCreditoConvenio+
      ',ICR_CRED_UTIL='   +sCreditoUtil+
      ',ICR_RENDA_MENSAL='+sRendaMensal+
      ',ICR_RENDA_EXTRA='+sRendaExtra+
      ',ICR_ORIGEM_EXTRA="'+EOrigemExtra.Text+'" '+
      ',ICR_PROIBIDO='    +sProibido+
      ',ICR_MOT_PROIB="'  +EMOT_PROIB.Text+'" '+
      ',ICR_LOGRADOURO='  +PLogradouro+
      ',ICR_ENDERECO="'   +EEndereco.Text+'" '+
      ',ICR_BAIRRO="'     +EBairro.Text+'" '+
      ',ICR_CIDADE="'     +ECidade.Text+'" '+
      ',ICR_UF="'         +EUF.Text+'" '+
      ',ICR_CEP="'        +ECEP.Text+'" '+
      ',ICR_BOLETO='      +sBoleto+
      ',ICR_LIBERA_INADIPLENCIA='+sLiberaInadiplencia+
      ',FPG_CODIGO='      +sCodigoFPG+
      ',PRF_CODIGO='      +IntToStr(ECodigoPRF.KeyValue)+
      ',ICR_REFERENCIA1="'+EReferencia1.Text+'" '+
      ',ICR_FONE_REFERENCIA1="'+EReferenciaFone1.Text+'" '+
      ',ICR_REFERENCIA2="'+EReferencia2.Text+'" '+
      ',ICR_FONE_REFERENCIA2="'+EReferenciaFone2.Text+'" '+
      ',ICR_REFERENCIA3="'+EReferencia3.Text+'" '+
      ',ICR_FONE_REFERENCIA3="'+EReferenciaFone3.Text+'" '+
      ',ICR_REFERENCIA4="'+EReferencia4.Text+'" '+
      ',ICR_FONE_REFERENCIA4="'+EReferenciaFone4.Text+'" '+
      ',ICR_LOCAL_TRABALHO="'+ELocalTrabalho.Text+'" '+
      ',ICR_TEMPO_TRABALHO='+sTempoTrabalho+
      ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
      ' AND CLI_CODIGO='  +IntToStr(CodigoCLI));

    Result:=True;
  except
    Result:=false;
    ShowMessage('Não foi possível alterar registro corrente.');
  end;
end;

procedure TInformacoes.CancelaEdicao;
begin
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TInformacoes.CarregaDados;
begin
  try
    ECodigoAVL.KeyValue       :=CodigoAVL;
  except
  end;
  try
    if DataUltCompra=0 then
      EDataUltCompra.Text:=''
    else
      EDataUltCompra.Text            :=FormatDateTime('dd/mm/yyyy hh:mm', DataUltCompra);
  except
  end;
  try
    if DataAlterado=0 then
      EDataAlterado.Text:=''
    else
      EDataAlterado.Text            :=FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado);
  except
  end;
  try
    EValorUltCompra.Text      :=Format('%.2f', [ValorUltCompra]);
  except
  end;
  try
    EValorInad.Text           :=Format('%.2f', [ValorInad]);
  except
  end;
  try
    ELimiteCredito.Text       :=Format('%.2f', [LimiteCredito]);
  except
  end;
  try
    ELimiteCreditoConvenio.Text       :=Format('%.2f', [LimiteCreditoConvenio]);
  except
  end;
  try
    ECreditoUtil.Text       := Format('%.2f', [CreditoUtil]);
  except
  end;
  try
    ERendaMensal.Text       :=Format('%.2f', [RendaMensal]);
  except
  end;
  try
    ERendaExtra.Text       :=Format('%.2f', [RendaExtra]);
  except
  end;
  try
    EOrigemExtra.Text       :=OrigemExtra;
  except
  end;
  try
    EProibido.Checked       := Proibido;
  except
  end;
  try
    EBoleto.Checked         := Boleto;
  except
  end;
  try
    ELiberaInadiplencia.Checked := LiberaInadiplencia;
  except
  end;
  try
    EMOT_PROIB.Text           :=MOT_PROIB;
  except
  end;
  try
    EAtrazo.Text              :=IntToStr(Atrazo);
  except
  end;
  try
    ELogradouro.KeyValue      := Logradouro;
  except
  end;
  try
    EEndereco.Text            := Endereco;
  except
  end;
  try
    EBairro.Text              := Bairro;
  except
  end;
  try
    ECidade.Text              := Cidade;
  except
  end;
  try
    ItemComboBox(EUf,UF);
  except
  end;
  try
    ECEP.Text                 := CEP;
  except
  end;
  try
    ECodigoFPG.KeyValue      := CodigoFPG;
  except
  end;
  try
    ECodigoPRF.KeyValue      := CodigoPRF;
  except
  end;
  try
    EReferencia1.Text           :=Referencia1;
  except
  end;
  try
    EReferenciaFone1.Text           :=ReferenciaFone1;
  except
  end;
  try
    EReferencia2.Text           :=Referencia2;
  except
  end;
  try
    EReferenciaFone2.Text           :=ReferenciaFone2;
  except
  end;
  try
    EReferencia3.Text           :=Referencia3;
  except
  end;
  try
    EReferenciaFone3.Text           :=ReferenciaFone3;
  except
  end;
  try
    EReferencia4.Text           :=Referencia4;
  except
  end;
  try
    EReferenciaFone4.Text           :=ReferenciaFone4;
  except
  end;
end;

constructor TInformacoes.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'INFORMACOES_DE_CREDITO';

     { Code to perform other tasks when the component is created }

end;

function TInformacoes.Deletar(CdCNC,CdCLI:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCLI,CdCNC)) Then
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

destructor TInformacoes.Destroy;
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

function TInformacoes.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  If not Verificadata(EDataUltCompra.text) Then
    mensagem:=mensagem+'Data da última compra incorreta!'+#13;
  if not verificafloat(EValorUltCompra.text) then
    mensagem:= mensagem + 'Valor da última compra incorreto!'+#13;
  if not verificafloat(ELimiteCredito.text) then
    mensagem:= mensagem + 'Limite de crédito incorreto!'+#13;
  if not verificafloat(ELimiteCreditoConvenio.text) then
    mensagem:= mensagem + 'Limite de crédito Convênio incorreto!'+#13;
  if not verificafloatBranco(ERendaMensal.text) then
    mensagem:= mensagem + 'Renda Mensal incorreta!'+#13;
  if not verificafloatBranco(ERendaExtra.text) then
    mensagem:= mensagem + 'Renda Extra incorreta!'+#13;
  if not verificafloat(EValorInad.text) then
    mensagem:= mensagem + 'Valor inadiplente incorreto!';
  If mensagem <>'' Then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
  else
  Begin
    if (StrToFloat(ERendaExtra.Text) > 0) and
       (Trim(EOrigemExtra.Text) = '') then
      Raise exception.Create('Defina a origem da renda extra!');
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        CarregaDados;
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoCLI;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        CarregaDados;
        Estado:=0;
      end
      else
        Result := False;
    End
    else
      Result := False;

    AfterScroll:=Aux;
  end;
end;

{ Insere um Informações de Crédito }
function TInformacoes.Inserir(CdCNC,CdCLI,CdAVL,PAtrazo,PLogra,CdFPG:integer;PValorUltCompra,PValorInad,PLimite,PRenda:Double;DT_ULT_COMPRA:TDateTime;PMOT_PROIB,PEnd,PBai,PCid,PUF,PCEP:string;PProibido,PBoleto:Boolean;PCreditoUtil:Double;PLimConv:double=0):Boolean;
begin
  result:=false;
  If (localizarCod(CdCLI,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      Append;
      CodigoCNC          := CdCNC;
      CodigoCLI          := CdCLI;
      CodigoAVL          := CdAVL;
      CodigoUSU          := CConfiguracao.CodigoUSU;
      CodigoFPG          := CdFPG;
      CodigoPRF          := 0;
      DataUltCompra      := DT_ULT_COMPRA;
      DataAlterado       := CConfiguracao.DataHora;
      ValorUltCompra     := PValorUltCompra;
      ValorInad          := PValorInad;
      RendaMensal        := PRenda;
      RendaExtra         := 0;
      LimiteCredito      := PLimite;
      LimiteCreditoConvenio := PLimConv;
      MOT_PROIB          := PMOT_PROIB;
      Atrazo             := PAtrazo;
      Proibido           := PProibido;
      Boleto             := pBoleto;
      LiberaInadiplencia := False;
      CreditoUtil        := PCreditoUtil;
      Logradouro         := PLogra;
      Endereco           := PEnd;
      Bairro             := PBai;
      Cidade             := PCid;
      UF                 := PUF;
      CEP                := PCEP;
      try
        CampoInvalido    := 0;
      except
      end;
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

function TInformacoes.InserirAuto:Boolean;
begin
  result:=false;
  try
    append;
    try
       codigocnc   := CConfiguracao.CodigoCNC;
    except
    end;
    try
       CodigoCLI := StrToInt(ECodigoCLI.Text);
    except
    end;
    try
       CodigoAVL  := ECodigoAVL.KeyValue;
    except
    end;
    try
       CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
       DataUltCompra   := StrToDateTime(EDataUltCompra.Text);
    except
    end;
    try
       DataAlterado   := CConfiguracao.DataHora;
    except
    end;
    try
       ValorUltCompra := StrToFloat(EValorUltCompra.Text);
    except
    end;
    try
       ValorInad  := StrToFloat(EValorInad.Text);
    except
    end;
    try
       LimiteCredito := StrToFloat(ELimiteCredito.Text);
    except
    end;
    try
       LimiteCreditoConvenio := StrToFloat(ELimiteCreditoConvenio.Text);
    except
    end;
    try
       CreditoUtil := StrToFloat(ECreditoUtil.Text);
    except
    end;
    try
       RendaMensal := StrToFloat(ERendaMensal.Text);
    except
    end;
    try
       RendaExtra := StrToFloat(ERendaExtra.Text);
    except
    end;
    try
       OrigemExtra := EOrigemExtra.Text;
    except
    end;
    try
       Proibido := EProibido.Checked;
    except
    end;
    try
       Boleto := EBoleto.Checked;
    except
    end;
    try
       LiberaInadiplencia := ELiberaInadiplencia.Checked;
    except
    end;
    try
       MOT_PROIB := EMOT_PROIB.Text;
    except
    end;
    try
       Atrazo := StrToInt(EAtrazo.Text);
    except
    end;
    try
       Logradouro := ELogradouro.KeyValue;
    except
    end;
    try
       Endereco := EEndereco.Text;
    except
    end;
    try
       Bairro := EBairro.Text;
    except
    end;
    try
       Cidade := ECidade.Text;
    except
    end;
    try
       UF := EUF.Text;
    except
    end;
    try
       CEP := ECEP.Text;
    except
    end;
    try
      if ECodigoFPG.Text <> '' then
        CodigoFPG := ECodigoFPG.KeyValue
      else
        CodigoFPG := 0;
    except
    end;
    try
      CodigoPRF := ECodigoPRF.KeyValue;
    except
    end;
    try
      CampoInvalido := 0;
    except
    end;
    try
       Referencia1 := EReferencia1.Text;
    except
    end;
    try
       ReferenciaFone1 := EReferenciaFone1.Text;
    except
    end;
    try
       Referencia2 := EReferencia2.Text;
    except
    end;
    try
       ReferenciaFone2 := EReferenciaFone2.Text;
    except
    end;
    try
       Referencia3 := EReferencia3.Text;
    except
    end;
    try
       ReferenciaFone3 := EReferenciaFone3.Text;
    except
    end;
    try
       Referencia4 := EReferencia4.Text;
    except
    end;
    try
       ReferenciaFone4 := EReferenciaFone4.Text;
    except
    end;
    try
      Post;
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TInformacoes.LimpaCampos;
begin
  Try
    EDataUltCompra.Clear;
  except
  end;
  Try
    ECodigoAVL.KeyValue := 0;
  except
  end;
  try
    EValorUltCompra.Clear;
  except
  end;
  try
    EValorInad.Clear;
  except
  end;
  try
    EProibido.Checked:=False;
  except
  end;
  try
    EBoleto.Checked:=False;
  except
  end;
  try
    ELiberaInadiplencia.Checked:=False;
  except
  end;
  try
    if Estado <> 1 then
      ELimiteCredito.Clear
    else
      ELimiteCredito.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      ELimiteCreditoConvenio.Clear
    else
      ELimiteCreditoConvenio.Text := '0,00';
  except
  end;
  try
    ERendaMensal.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ERendaExtra.Clear
    else
      ERendaExtra.Text := '0,00';
  except
  end;
  try
    EOrigemExtra.Clear;
  except
  end;
  try
    EMOT_PROIB.Clear;
  except
  end;
  try
    EAtrazo.Clear;
  except
  end;
  try
    ELogradouro.KeyValue := 0;
  except
  end;
  try
    EEndereco.Clear;
  except
  end;
  try
    EBairro.Clear;
  except
  end;
  try
    ECidade.Clear;
  except
  end;
  try
    EUF.ItemIndex := -1;
  except
  end;
  try
    ECEP.Clear;
  except
  end;
  try
    EReferencia1.Clear;
  except
  end;
  try
    EReferenciaFone1.Clear;
  except
  end;
  try
    EReferencia2.Clear;
  except
  end;
  try
    EReferenciaFone2.Clear;
  except
  end;
  try
    EReferencia3.Clear;
  except
  end;
  try
    EReferenciaFone3.Clear;
  except
  end;
  try
    EReferencia4.Clear;
  except
  end;
  try
    EReferenciaFone4.Clear;
  except
  end;
end;

{ Localiza um cliente }
function TInformacoes.LocalizarCod(CdCLI,CdCNC:Integer):Boolean;
begin
  If (CdCLI<>CodigoCLI) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;CLI_CODIGO', vararrayof([CdCNC, CdCLI]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TInformacoes.PreparaAlteracao;
begin
  Estado:=2;
end;

procedure TInformacoes.PreparaInsercao;
begin
  Estado:=1;
  LimpaCampos;
end;

function TInformacoes.deletarauto:Boolean;
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
