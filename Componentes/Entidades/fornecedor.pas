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
unit Fornecedor;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Extctrls;

type
  TFornecedor = class(TSQuery)
    private
      { Private fields of TFornecedor }
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property Banco }
        FBanco : Integer;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property CPFCGC }
        FCPFCGC : String;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodigoCCX }
        FCodigoCCX : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property EBanco }
        FEBanco : TMaskEdit;
        { Storage for property ECPFCGC }
        FECPFCGC : TMaskEdit;
        { Storage for property ECep }
        FECep : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoCCX }
        FECodigoCCX : TDBLookupComboBox;
        { Storage for property ECodigoFor }
        FECodigoFor : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EEMail }
        FEEMail : TEdit;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property EFax }
        FEFax : TMaskEdit;
        { Storage for property EFone }
        FEFone : TMaskEdit;
        { Storage for property EFoto }
        FEFoto : TImage;
        { Storage for property EIE }
        FEIE : TEdit;
        { Storage for property ELogradouro }
        FELogradouro : TDBLookupComboBox;
        { Storage for property EMail }
        FEMail : String;
        { Storage for property EMarca }
        FEMarca : TEdit;
        { Storage for property EMaxItensNota }
        FEMaxItensNota : TEdit;
        { Storage for property ENomeFantasia }
        FENomeFantasia : TEdit;
        { Storage for property ENumeroAgencia }
        FENumeroAgencia : TMaskEdit;
        { Storage for property ENumeroConta }
        FENumeroConta : TMaskEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ERazaoSocial }
        FERazaoSocial : TEdit;
        { Storage for property EReducaoICMS }
        FEReducaoICMS : TEdit;
        { Storage for property ESite }
        FESite : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property EUF }
        FEUF : TComboBox;
        { Storage for property Endereco }
        FEndereco : String;
        { Storage for property Fax }
        FFax : String;
        { Storage for property Fone }
        FFone : String;
        { Storage for property IE }
        FIE : String;
        { Storage for property Logradouro }
        FLogradouro : Integer;
        { Storage for property Marca }
        FMarca : String;
        { Storage for property MaxItensNota }
        FMaxItensNota : Integer;
        { Storage for property NomeFantasia }
        FNomeFantasia : String;
        { Storage for property NumeroAgencia }
        FNumeroAgencia : String;
        { Storage for property NumeroConta }
        FNumeroConta : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property RazaoSocial }
        FRazaoSocial : String;
        { Storage for property ReducaoICMS }
        FReducaoICMS : Double;
        { Storage for property Site }
        FSite : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Uf }
        FUf : String;

      { Private methods of TFornecedor }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Bairro }
        function GetBairro : String;
        { Write method for property Bairro }
        procedure SetBairro(Value : String);
        { Read method for property Banco }
        function GetBanco : Integer;
        { Write method for property Banco }
        procedure SetBanco(Value : Integer);
        { Read method for property CEP }
        function GetCEP : String;
        { Write method for property CEP }
        procedure SetCEP(Value : String);
        { Read method for property CPFCGC }
        function GetCPFCGC : String;
        { Write method for property CPFCGC }
        procedure SetCPFCGC(Value : String);
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
        { Read method for property CodigoCCX }
        function GetCodigoCCX : Integer;
        { Write method for property CodigoCCX }
        procedure SetCodigoCCX(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property EMail }
        function GetEMail : String;
        { Write method for property EMail }
        procedure SetEMail(Value : String);
        { Read method for property Endereco }
        function GetEndereco : String;
        { Write method for property Endereco }
        procedure SetEndereco(Value : String);
        { Read method for property Fax }
        function GetFax : String;
        { Write method for property Fax }
        procedure SetFax(Value : String);
        { Read method for property Fone }
        function GetFone : String;
        { Write method for property Fone }
        procedure SetFone(Value : String);
        { Read method for property IE }
        function GetIE : String;
        { Write method for property IE }
        procedure SetIE(Value : String);
        { Read method for property Logradouro }
        function GetLogradouro : Integer;
        { Write method for property Logradouro }
        procedure SetLogradouro(Value : Integer);
        { Read method for property Marca }
        function GetMarca : String;
        { Write method for property Marca }
        procedure SetMarca(Value : String);
        { Read method for property MaxItensNota }
        function GetMaxItensNota : Integer;
        { Write method for property MaxItensNota }
        procedure SetMaxItensNota(Value : Integer);
        { Read method for property NomeFantasia }
        function GetNomeFantasia : String;
        { Write method for property NomeFantasia }
        procedure SetNomeFantasia(Value : String);
        { Read method for property NumeroAgencia }
        function GetNumeroAgencia : String;
        { Write method for property NumeroAgencia }
        procedure SetNumeroAgencia(Value : String);
        { Read method for property NumeroConta }
        function GetNumeroConta : String;
        { Write method for property NumeroConta }
        procedure SetNumeroConta(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property RazaoSocial }
        function GetRazaoSocial : String;
        { Write method for property RazaoSocial }
        procedure SetRazaoSocial(Value : String);
        { Read method for property ReducaoICMS }
        function GetReducaoICMS : Double;
        { Write method for property ReducaoICMS }
        procedure SetReducaoICMS(Value : Double);
        { Read method for property Site }
        function GetSite : String;
        { Write method for property Site }
        procedure SetSite(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Uf }
        function GetUf : String;
        { Write method for property Uf }
        procedure SetUf(Value : String);

    protected
      { Protected fields of TFornecedor }

      { Protected methods of TFornecedor }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TFornecedor }

      { Public methods of TFornecedor }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CDFor:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Fornecedor }
        function Inserir(CdFor,PSituacao,PLogradouro: integer; RZ_SOCIAL,NOME_FAN,CGC_CPF,PEndereco,PBairro,PCidade,PUF,PIE,PCEP,PFone,PFax,PSite,PEMail,POBS:String):Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCNPJ(CdFOR:integer; CNPJ:string):Boolean;
        { Localiza um Fornecedor }
        function LocalizarCod(CDFor:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;
        { Altera um Fornecedor }
        function zzzAlterar(CdFor,PSituacao,PLogradouro: integer; RZ_SOCIAL,NOME_FAN,CGC_CPF,PEndereco,PBairro,PCidade,PUF,PIE,PCEP,PFone,PFax,PSite,PEmail,POBS:String):boolean;

    published
      { Published properties of TFornecedor }
        property Bairro : String read GetBairro write SetBairro;
        property Banco : Integer read GetBanco write SetBanco;
        property CEP : String read GetCEP write SetCEP;
        property CPFCGC : String read GetCPFCGC write SetCPFCGC;
        property Cidade : String read GetCidade write SetCidade;
        property CodigoCCX : Integer read GetCodigoCCX write SetCodigoCCX;
        { Código do Fornecedor }
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EBairro : TEdit read FEBairro write FEBairro;
        property EBanco : TMaskEdit read FEBanco write FEBanco;
        property ECPFCGC : TMaskEdit read FECPFCGC write FECPFCGC;
        property ECep : TMaskEdit read FECep write FECep;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoCCX : TDBLookupComboBox
             read FECodigoCCX write FECodigoCCX;
        property ECodigoFor : TEdit read FECodigoFor write FECodigoFor;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EEMail : TEdit read FEEMail write FEEMail;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EFax : TMaskEdit read FEFax write FEFax;
        property EFone : TMaskEdit read FEFone write FEFone;
        property EFoto : TImage read FEFoto write FEFoto;
        property EIE : TEdit read FEIE write FEIE;
        property ELogradouro : TDBLookupComboBox
             read FELogradouro write FELogradouro;
        property EMail : String read GetEMail write SetEMail;
        property EMarca : TEdit read FEMarca write FEMarca;
        property EMaxItensNota : TEdit
             read FEMaxItensNota write FEMaxItensNota;
        property ENomeFantasia : TEdit
             read FENomeFantasia write FENomeFantasia;
        property ENumeroAgencia : TMaskEdit
             read FENumeroAgencia write FENumeroAgencia;
        property ENumeroConta : TMaskEdit
             read FENumeroConta write FENumeroConta;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ERazaoSocial : TEdit read FERazaoSocial write FERazaoSocial;
        property EReducaoICMS : TEdit read FEReducaoICMS write FEReducaoICMS;
        property ESite : TEdit read FESite write FESite;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EUF : TComboBox read FEUF write FEUF;
        property Endereco : String read GetEndereco write SetEndereco;
        property Fax : String read GetFax write SetFax;
        property Fone : String read GetFone write SetFone;
        property IE : String read GetIE write SetIE;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property Marca : String read GetMarca write SetMarca;
        property MaxItensNota : Integer
             read GetMaxItensNota write SetMaxItensNota;
        property NomeFantasia : String
             read GetNomeFantasia write SetNomeFantasia;
        property NumeroAgencia : String
             read GetNumeroAgencia write SetNumeroAgencia;
        property NumeroConta : String read GetNumeroConta write SetNumeroConta;
        property OBS : String read GetOBS write SetOBS;
        property RazaoSocial : String read GetRazaoSocial write SetRazaoSocial;
        property ReducaoICMS : Double read GetReducaoICMS write SetReducaoICMS;
        property Site : String read GetSite write SetSite;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Uf : String read GetUf write SetUf;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TFornecedor with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TFornecedor]);
end;

{ Method to set variable and property values and create objects }
procedure TFornecedor.AutoInitialize;
begin
     FEBairro := nil;
     FEBanco := nil;
     FECPFCGC := nil;
     FECep := nil;
     FECidade := nil;
     FECodigoCCX := nil;
     FECodigoFor := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEEMail := nil;
     FEEndereco := nil;
     FEFax := nil;
     FEFone := nil;
     FEFoto := nil;
     FEIE := nil;
     FELogradouro := nil;
     FEMarca := nil;
     FEMaxItensNota := nil;
     FENomeFantasia := nil;
     FENumeroAgencia := nil;
     FENumeroConta := nil;
     FEOBS := nil;
     FERazaoSocial := nil;
     FEReducaoICMS := nil;
     FESite := nil;
     FESituacao := nil;
     FEUF := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TFornecedor.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FEBanco then
        FEBanco := nil;
     if AComponent = FECPFCGC then
        FECPFCGC := nil;
     if AComponent = FECep then
        FECep := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoCCX then
        FECodigoCCX := nil;
     if AComponent = FECodigoFor then
        FECodigoFor := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEEMail then
        FEEMail := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FEFax then
        FEFax := nil;
     if AComponent = FEFone then
        FEFone := nil;
     if AComponent = FEFoto then
        FEFoto := nil;
     if AComponent = FEIE then
        FEIE := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FEMarca then
        FEMarca := nil;
     if AComponent = FEMaxItensNota then
        FEMaxItensNota := nil;
     if AComponent = FENomeFantasia then
        FENomeFantasia := nil;
     if AComponent = FENumeroAgencia then
        FENumeroAgencia := nil;
     if AComponent = FENumeroConta then
        FENumeroConta := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FERazaoSocial then
        FERazaoSocial := nil;
     if AComponent = FEReducaoICMS then
        FEReducaoICMS := nil;
     if AComponent = FESite then
        FESite := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FEUF then
        FEUF := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TFornecedor.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bairro }
function TFornecedor.GetBairro : String;
begin
  try
    Result := Self.fieldByName('FOR_BAIRRO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TFornecedor.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_BAIRRO"!');
  end;
end;

{ Read method for property Banco }
function TFornecedor.GetBanco : Integer;
begin
  try
    Result := Self.fieldByName('FOR_BANCO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Banco }
procedure TFornecedor.SetBanco(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_BANCO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_BANCO"!');
    end;
end;

{ Read method for property CEP }
function TFornecedor.GetCEP : String;
begin
  try
    Result := Self.fieldByName('FOR_CEP').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TFornecedor.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_CEP"!');
  end;
end;

{ Read method for property CPFCGC }
function TFornecedor.GetCPFCGC : String;
begin
  try
    Result := Self.fieldByName('FOR_CGC').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CPFCGC }
procedure TFornecedor.SetCPFCGC(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_CGC').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_CGC"!');
  end;
end;

{ Read method for property Cidade }
function TFornecedor.GetCidade : String;
begin
  try
    Result := Self.fieldByName('FOR_CIDADE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Cidade }
procedure TFornecedor.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_CIDADE"!');
  end;
end;

{ Read method for property CodigoCCX }
function TFornecedor.GetCodigoCCX : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCCX }
procedure TFornecedor.SetCodigoCCX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TFornecedor.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TFornecedor.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TFornecedor.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('FOR_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TFornecedor.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TFornecedor.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('FOR_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TFornecedor.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_DT_CADASTRO"!');
  end;
end;

{ Read method for property EMail }
function TFornecedor.GetEMail : String;
begin
  try
    Result := Self.fieldByName('FOR_EMAIL').asString;
  except
    result:= ''
  end;
end;

{ Write method for property EMail }
procedure TFornecedor.SetEMail(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_EMAIL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_EMAIL"!');
  end;
end;

{ Read method for property Endereco }
function TFornecedor.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('FOR_ENDERECO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TFornecedor.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_ENDERECO"!');
  end;
end;

{ Read method for property Fax }
function TFornecedor.GetFax : String;
begin
  try
    Result := Self.fieldByName('FOR_FAX').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fax }
procedure TFornecedor.SetFax(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_FAX').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_FAX"!');
  end;
end;

{ Read method for property Fone }
function TFornecedor.GetFone : String;
begin
  try
    Result := Self.fieldByName('FOR_FONE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fone }
procedure TFornecedor.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_FONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_FONE"!');
  end;
end;

{ Read method for property IE }
function TFornecedor.GetIE : String;
begin
  try
    Result := Self.fieldByName('FOR_IE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property IE }
procedure TFornecedor.SetIE(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_IE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_IE"!');
  end;
end;

{ Read method for property Logradouro }
function TFornecedor.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('FOR_LOGRADOURO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Logradouro }
procedure TFornecedor.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_LOGRADOURO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_LOGRADOURO"!');
    end;
end;

{ Read method for property Marca }
function TFornecedor.GetMarca : String;
begin
  try
    Result := Self.fieldByName('FOR_MARCA').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Marca }
procedure TFornecedor.SetMarca(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_MARCA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_MARCA"!');
  end;
end;

{ Read method for property MaxItensNota }
function TFornecedor.GetMaxItensNota : Integer;
begin
  try
    Result := Self.fieldByName('FOR_MAX_ITENS_NOTA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property MaxItensNota }
procedure TFornecedor.SetMaxItensNota(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_MAX_ITENS_NOTA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_MAX_ITENS_NOTA"!');
    end;
end;

{ Read method for property NomeFantasia }
function TFornecedor.GetNomeFantasia : String;
begin
  try
    Result := Self.fieldByName('FOR_NOME_FAN').asString;
  except
    result:= '';
  end;
end;

{ Write method for property NomeFantasia }
procedure TFornecedor.SetNomeFantasia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_NOME_FAN').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_NOME_FAN"!');
  end;
end;

{ Read method for property NumeroAgencia }
function TFornecedor.GetNumeroAgencia : String;
begin
  try
    Result := Self.fieldByName('FOR_NUMERO_AGENCIA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property NumeroAgencia }
procedure TFornecedor.SetNumeroAgencia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_NUMERO_AGENCIA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_NUMERO_AGENCIA"!');
  end;
end;

{ Read method for property NumeroConta }
function TFornecedor.GetNumeroConta : String;
begin
  try
    Result := Self.fieldByName('FOR_NUMERO_CONTA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property NumeroConta }
procedure TFornecedor.SetNumeroConta(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_NUMERO_CONTA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_NUMERO_CONTA"!');
  end;
end;

{ Read method for property OBS }
function TFornecedor.GetOBS : String;
begin
  try
    Result := Self.fieldByName('FOR_OBSERVACAO1').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TFornecedor.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_OBSERVACAO1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_OBSERVACAO1"!');
  end;
end;

{ Read method for property RazaoSocial }
function TFornecedor.GetRazaoSocial : String;
begin
  try
    Result := Self.fieldByName('FOR_RZ_SOCIAL').asString;
  except
    result:= ''
  end;
end;

{ Write method for property RazaoSocial }
procedure TFornecedor.SetRazaoSocial(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_RZ_SOCIAL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_RZ_SOCIAL"!');
  end;
end;

{ Read method for property ReducaoICMS }
function TFornecedor.GetReducaoICMS : Double;
begin
  try
    Result := Self.fieldByName('FOR_REDUCAO_ICMS').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ReducaoICMS }
procedure TFornecedor.SetReducaoICMS(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_REDUCAO_ICMS').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_REDUCAO_ICMS"!');
  end;
end;

{ Read method for property Site }
function TFornecedor.GetSite : String;
begin
  try
    Result := Self.fieldByName('FOR_SITE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Site }
procedure TFornecedor.SetSite(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_SITE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_SITE"!');
  end;
end;

{ Read method for property Situacao }
function TFornecedor.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('FOR_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TFornecedor.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_SITUACAO"!');
  end;
end;

{ Read method for property Uf }
function TFornecedor.GetUf : String;
begin
  try
    Result := Self.fieldByName('FOR_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Uf }
procedure TFornecedor.SetUf(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_UF"!');
  end;
end;

function TFornecedor.AlterarAuto:Boolean;
var
  CdCNC, CdFOR, iBanco: integer;
  sDetalhe: string;
begin
  Result:=False;
  CdCNC := CodigoCNC;
  CdFOR := CodigoFOR;
  sDetalhe := 'RzSocial:'+ERazaoSocial.Text;
  try
    iBanco := StrToInt(EBanco.Text);
  except
    iBanco := 0;
  end;
  If not LocalizarCod(StrToInt(ECodigoFOR.Text)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos, 'UPDATE FORNECEDOR SET '+
        ' USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
        ',FOR_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',FOR_RZ_SOCIAL="'+ERazaoSocial.Text+'" '+
        ',FOR_NOME_FAN="'+ENomeFantasia.Text+'" '+
        ',FOR_CGC="'+ECPFCGC.Text+'" '+
        ',FOR_IE="'+EIE.Text+'" '+
        ',FOR_LOGRADOURO='+IntToStr(ELogradouro.KeyValue)+
        ',FOR_ENDERECO="'+EEndereco.Text+'" '+
        ',FOR_BAIRRO="'+EBairro.Text+'" '+
        ',FOR_CIDADE="'+ECidade.Text+'" '+
        ',FOR_UF="'+EUF.Text+'" '+
        ',FOR_CEP="'+ECEP.Text+'" '+
        ',FOR_FONE="'+EFONE.Text+'" '+
        ',FOR_FAX="'+EFax.Text+'" '+
        ',FOR_SITE="'+ESite.Text+'" '+
        ',FOR_EMAIL="'+EEMail.Text+'" '+
        ',FOR_REDUCAO_ICMS='+VirgPonto(EReducaoICMS.Text)+
        ',FOR_BANCO='+IntToStr(iBanco)+
        ',FOR_NUMERO_AGENCIA="'+ENumeroAgencia.Text+'" '+
        ',FOR_NUMERO_CONTA="'+ENumeroConta.Text+'" '+
        ',CCX_CODIGO='+IntToStr(ECodigoCCX.KeyValue)+
        ',FOR_MAX_ITENS_NOTA='+EMaxItensNota.Text+
        ',FOR_MARCA="'+EMarca.Text+'" '+
        ',FOR_SITUACAO='+IntToStr(ESITUACAO.itemindex)+
        ',FOR_OBSERVACAO1="'+EOBS.Text+'" '+
        ' WHERE FOR_CODIGO='+IntToStr(CodigOFOR));
      GeraLog(160, CdCNC, CdFOR, sDetalhe);
      Result := True;
    except
      ShowMessage('Não foi possível alterar registro corrente.');
    end;
  end;
end;

procedure TFornecedor.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    ERazaoSocial.Enabled      :=Habilitar;
  except
  end;
  Try
    ECodigoCCX.Enabled        :=Habilitar;
  except
  end;
  Try
    EMaxItensNota.Enabled      :=Habilitar;
  except
  end;
  Try
    EMarca.Enabled      :=Habilitar;
  except
  end;
  try
    ENomeFantasia.Enabled     :=Habilitar;
  except
  end;
  try
    ECPFCGC.Enabled           :=Habilitar;
  except
  end;
  try
    ELogradouro.Enabled       :=Habilitar;
  except
  end;
  try
    EEndereco.Enabled         :=Habilitar;
  except
  end;
  try
    EBairro.Enabled           :=Habilitar;
  except
  end;
  try
    ECidade.Enabled           :=Habilitar;
  except
  end;
  try
    EUF.Enabled               :=Habilitar;
  except
  end;
  try
    ECEP.Enabled               :=Habilitar;
  except
  end;
   try
    EIE.Enabled               :=Habilitar;
  except
  end;
  try
    EFONE.Enabled             :=Habilitar;
  except
  end;
  try
    EFAX.Enabled             :=Habilitar;
  except
  end;
  try
    ESite.Enabled             :=Habilitar;
  except
  end;
  try
    EEMail.Enabled             :=Habilitar;
  except
  end;
  try
    EReducaoICMS.Enabled       :=Habilitar;
  except
  end;
  try
    EBanco.Enabled       :=Habilitar;
  except
  end;
  try
    ENumeroAgencia.Enabled       :=Habilitar;
  except
  end;
  try
    ENumeroConta.Enabled       :=Habilitar;
  except
  end;
  try
    ESITUACAO.Enabled          :=Habilitar;
  except
  end;
  try
    EOBS.Enabled              :=Habilitar;
  except
  end;

end;

procedure TFornecedor.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  CarregaDados;
end;

procedure TFornecedor.CarregaDados;
var
  Foto: string;
begin
  try
    ECodigoFor.Text           :=IntToStr(CodigoFor);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text      := formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text      := formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ERazaoSocial.Text         :=RazaoSocial;
  except
  end;
  try
    ECodigoCCX.KeyValue      :=CodigoCCX;
  except
  end;
  try
    EMaxItensNota.Text        :=IntToStr(MaxItensNota);
  except
  end;
  try
    EMarca.Text              :=Marca;
  except
  end;
  try
    ENomeFantasia.Text        :=NomeFantasia;
  except
  end;
  try
    ECPFCGC.Text              :=CPFCGC;
  except
  end;
  try
    ELogradouro.KeyValue      :=Logradouro;
  except
  end;
  try
    EEndereco.Text            :=Endereco;
  except
  end;
  try
    EBairro.Text              :=Bairro;
  except
  end;
  try
    ECidade.Text              :=Cidade;
  except
  end;
  try
    ItemComboBox(EUF,UF);
  except
  end;
  try
    EIE.Text                  :=IE;
  except
  end;
  try
    ECEP.text                 :=CEP;
  except
  end;
  try
    EFONE.Text                :=Fone;
  except
  end;
  try
    EFax.Text                :=Fax;
  except
  end;
  try
    ESite.Text                :=Site;
  except
  end;
  try
    EEMail.Text                :=EMail;
  except
  end;
  try
    EReducaoICMS.Text         :=format('%.4f',[ReducaoICMS]);
  except
  end;
  try
    if Banco > 0 then
      EBanco.Text                :=PreencheZero(3, Banco)
    else
    EBanco.Text                :='';
  except
  end;
  try
    ENumeroAgencia.Text                :=NumeroAgencia;
  except
  end;
  try
    ENumeroConta.Text                :=NumeroConta;
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
  try
    foto:=CConfiguracao.PastaImagens+'\Fornecedor\00-'+IntToStr(CodigoFOR)+'.JPG';
    Efoto.Picture.LoadFromFile(foto);
  Except
    try
      EFoto.Picture:=nil;
    except
    end;
  end;
end;

constructor TFornecedor.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'FORNECEDOR';

     { Code to perform other tasks when the component is created }

end;

function TFornecedor.Deletar(CdCNC,CDFor:Integer):Boolean;
begin
  If not localizarCod(CdFOR) Then
  Begin
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!');
    Result:=False;
  end
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        GeraLog(150,CdCNC,CdFor);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end
      else
        result := False;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
      Result := False;
    End;
  End;
end;

destructor TFornecedor.Destroy;
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

function TFornecedor.FinalizaEdicao:Boolean;
var
  cdfor:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if ERazaoSocial.text = '' then
    mensagem:= mensagem+'Razão Social digitada incorretamente!'+#13;
  if (ECodigoCCX.Text = '') then
    mensagem:=mensagem+'Conta de Caixa inválida!'+#13;
  if ECidade.text = '' then
    mensagem:= mensagem+'Cidade digitada incorretamente!'+#13;
  if EUF.ItemIndex = -1 then
    mensagem:= mensagem+'UF digitado incorretamente!'+#13;
  if not VerificaCPFCNPJ(ECPFCGC.Text) then
    mensagem:= mensagem+'CNPJ digitado incorretamente!'+#13;
  if EUF.ItemIndex >= 0 then
    if (EIE.Text <> '') then
      if not VerificaCGFBranco(EIE.Text,EUF.Items[EUF.ItemIndex]) then
        Exit; //Mensagem já está na Função
  if not verificaInteiroBranco(EMaxItensNota.text) then
    mensagem:= mensagem + 'Número máximo de Itens digitado incorretamente!'+#13;
  if not verificaFloatBranco(EReducaoICMS.text) then
    mensagem:= mensagem + 'Redução de ICMS inválida!'+#13;
  If LocalizarCNPJ(StrToInt(ECodigoFOR.Text), ECPFCGC.Text) Then
      mensagem:=mensagem+ 'Fornecedor com CNPJ ja cadastrado!'+#13;
  If mensagem <>'' Then
    ShowMessage(mensagem)
  Else
  Begin
    Aux:=afterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        SQL.Text := 'SELECT * FROM FORNECEDOR '+
          ' WHERE FOR_CODIGO='+IntTostr(SCodigo);
        open;
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    Else If Estado=2 then
    Begin
      cdfor:=codigoFor;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cdfor);
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Fornecedor }
function TFornecedor.Inserir(CdFor,PSituacao,PLogradouro: integer; RZ_SOCIAL,NOME_FAN,CGC_CPF,PEndereco,PBairro,PCidade,PUF,PIE,PCEP,PFone,PFax,PSite,PEMail,POBS:String):Boolean;
Var
  Cod: Integer;
begin
  if CdFor=0 then
    Cod    := ProximoCodigo('FOR_CODIGO')
  Else
    Cod    := CdFor;
  If (localizarCod(Cod)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
    Insert;
    try
      CodigoFor      := Cod;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      CodigoCNC      := CConfiguracao.CodigoCNC;
      DataCadastro   := CConfiguracao.DataHora;
      RazaoSocial    := RZ_SOCIAL;
      NomeFantasia   := NOME_FAN;
      CPFCGC         := CGC_CPF;
      Logradouro     := PLogradouro;
      Endereco       := PEndereco;
      Bairro         := PBairro;
      Cidade         := PCidade;
      Uf             := PUF;
      IE             := PIE;
      CEP            := PCEP;
      Fone           := PFone;
      Fax            := PFax;
      Site           := PSite;
      EMail          := PEMail;
      ReducaoICMS    := 0;
      Situacao       := PSituacao;
      Obs            := POBS;

      try
        Post;
        result := true;
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

function TFornecedor.InserirAuto:Boolean;
var
  CdCNC, CdFOR: integer;
  sDetalhe: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdFOR := SCodigo;
  sDetalhe := '';
  If localizarCod(StrToInt(ECodigoFOR.Text)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      append;
      try
        CodigoFOR   := SCodigo;
      except
      end;
      try
        CodigoUSU   := CConfiguracao.CodigoUSU;
      except
      end;
      try
         CodigoCCX    := ECodigoCCX.KeyValue;
      except
      end;
      try
         MaxItensNota  := StrToInt(EMaxItensNota.Text);
      except
      end;
      try
         Marca        := EMarca.Text;
      except
      end;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        DataCadastro   := StrToDateTime(EDataCadastro.Text);
      except
      end;
      try
         RazaoSocial  := ERazaoSocial.Text;
         sDetalhe := sDetalhe + 'RzSocial:'+ERazaoSocial.Text;
      except
      end;
      try
         NomeFantasia := ENomeFantasia.Text;
         sDetalhe := sDetalhe + ' Fantasia:'+ENomeFantasia.Text;
      except
      end;
      try
         CPFCGC := ECPFCGC.Text;
      except
      end;
      try
         IE   := EIE.Text;
      except
      end;
      try
         Logradouro  := ELogradouro.KeyValue;
      except
      end;
      try
         Endereco   := EEndereco.Text;
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
         Uf   := EUF.Text;
      except
      end;
      try
         CEP := ECEP.text;
      except
      end;
      try
         Fone := EFONE.Text;
         sDetalhe := sDetalhe + ' Fone:'+EFONE.Text;
      except
      end;
      try
         Fax := EFax.Text;
      except
      end;
      try
         Site := ESite.Text;
      except
      end;
      try
         EMail := EEMail.Text;
      except
      end;
      try
         ReducaoICMS := StrToFloat(EReducaoICMS.Text);
         sDetalhe := sDetalhe + ' RedICMS:'+EReducaoICMS.Text;
      except
      end;
      try
        Banco := StrToInt(EBanco.Text);
      except
      end;
      try
        NumeroAgencia := ENumeroAgencia.Text;
      except
      end;
      try
        NumeroConta := ENumeroConta.Text;
      except
      end;
      try
         Situacao := ESITUACAO.itemindex;
      except
      end;
      try
         Obs := EOBS.Text;
         sDetalhe := sDetalhe + ' OBS:'+EOBS.Text;
      except
      end;
      try
        Post;
        GeraLog(140,CdCNC, CdFOR, sDetalhe);
        result:=True;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

procedure TFornecedor.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoFOR.Clear;
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
    ERazaoSocial.Clear;
  except
  end;
  try
    ENomeFantasia.Clear;
  except
  end;
  try
    ECPFCGC.Clear;
  except
  end;
  try
    EIE.Clear;
  except
  end;
  Try
    ECodigoCCX.KeyValue := 0;
  Except
  End;
  try
    EMaxItensNota.Clear;
  except
  end;
  try
    EMarca.Clear;
  except
  end;
  Try
    ELogradouro.KeyValue := 0;
  Except
  End;
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
    EUF.ItemIndex := -1
  except
  end;
  try
    ECEP.Clear;
  except
  end;
  try
    EFONE.Clear;
  except
  end;
  try
    EFax.Clear;
  except
  end;
  try
    ESite.Clear;
  except
  end;
  try
    EEMail.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EReducaoICMS.Clear
    else
      EReducaoICMS.Text := '0,0000';
  except
  end;
  try
    EBanco.Clear;
  except
  end;
  try
    ENumeroAgencia.Clear;
  except
  end;
  try
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
  Try
    EFoto.Picture:=nil;
  Except
  End;
end;

function TFornecedor.LocalizarCNPJ(CdFOR:integer; CNPJ:string):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  if (CNPJ <> '') and (CNPJ <> '  -   -   /    -  ') then
  Begin
    CConfiguracao.QueryComandos.Close;
    CConfiguracao.QueryComandos.SQL.Text:='SELECT FOR_CODIGO,FOR_CGC FROM FORNECEDOR '+
      ' WHERE FOR_CGC="'+CNPJ+'" AND FOR_CODIGO <> '+IntToStr(CdFOR);
    CConfiguracao.QueryComandos.Open;
    Result := not CConfiguracao.QueryComandos.isEmpty;
  end
  else
    Result := False;
end;

{ Localiza um Fornecedor }
function TFornecedor.LocalizarCod(CDFor:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDFor<>CodigoFor) Then
    If locate('FOR_CODIGO', CDFOR, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TFornecedor.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>NomeFantasia Then
    If locate('FOR_NOME_FAN',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TFornecedor.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TFornecedor.PreparaInsercao;
begin
  ProximoCodigo('FOR_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
  try
    EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  Try
    ECodigoCCX.KeyValue := CConfiguracao.ContPagFor;
  Except
  End;
  try
    EMaxItensNota.Text := '24';
  except
  end;
  try
    ECidade.Text := CConfiguracao.Cidade;
  except
  end;
  try
    ItemComboBox(EUF,CConfiguracao.UF);
  except
  end;
end;

function TFornecedor.deletarauto:Boolean;
var
  CdCNC,CdFOR:Integer;
  sDetalhe: string;
begin
  Result := False;
  try
    CdCNC:=CodigoCNC;
    CdFOR:=CodigoFOR;
    sDetalhe := 'RzSocial:'+RazaoSocial;
    if Delete then
    Begin
      result:=true;
      GeraLog(150,CdCNC,CdFor,sDetalhe);
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

{ Altera um Fornecedor }
function TFornecedor.zzzAlterar(CdFor,PSituacao,PLogradouro: integer; RZ_SOCIAL,NOME_FAN,CGC_CPF,PEndereco,PBairro,PCidade,PUF,PIE,PCEP,PFone,PFax,PSite,PEmail,POBS:String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdFOR)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    edit;
    try
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := CConfiguracao.DataHora;
      RazaoSocial    := RZ_SOCIAL;
      NomeFantasia   := NOME_FAN;
      CPFCGC         := CGC_CPF;
      Logradouro     := PLogradouro;
      Endereco       := PEndereco;
      Bairro         := PBairro;
      Cidade         := PCidade;
      Uf             := PUF;
      IE             := PIE;
      CEP            := PCEP;
      Fone           := PFone;
      Fax            := PFax;
      Site           := PSite;
      EMail          := PEmail;
      Situacao       := PSituacao;
      Obs            := POBS;

      try
        Post;
        Result := True;
      except
        result := false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result := false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;


end.
