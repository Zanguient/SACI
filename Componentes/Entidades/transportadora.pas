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
unit Transportadora;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TTransportadora = class(TSQuery)
    private
      { Private fields of TTransportadora }
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property CFornecedor }
        FCFornecedor : Integer;
        { Storage for property CPFCGC }
        FCPFCGC : String;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodigoCCX }
        FCodigoCCX : Integer;
        { Storage for property CodigoTRN }
        FCodigoTRN : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property ECPFCGC }
        FECPFCGC : TMaskEdit;
        { Storage for property ECep }
        FECep : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoCCX }
        FECodigoCCX : TDBLookupComboBox;
        { Storage for property ECodigoTRN }
        FECodigoTRN : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EEMail }
        FEEMail : TEdit;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property EFax }
        FEFax : TMaskEdit;
        { Storage for property EFone }
        FEFone : TMaskEdit;
        { Storage for property EIE }
        FEIE : TEdit;
        { Storage for property ELogradouro }
        FELogradouro : TDBLookUpComboBox;
        { Storage for property EMail }
        FEMail : String;
        { Storage for property ENomeFantasia }
        FENomeFantasia : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ERazaoSocial }
        FERazaoSocial : TEdit;
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
        { Storage for property NomeFantasia }
        FNomeFantasia : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property RazaoSocial }
        FRazaoSocial : String;
        { Storage for property Site }
        FSite : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Uf }
        FUf : String;

      { Private methods of TTransportadora }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Bairro }
        function GetBairro : String;
        { Write method for property Bairro }
        procedure SetBairro(Value : String);
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
        { Read method for property CodigoTRN }
        function GetCodigoTRN : Integer;
        { Write method for property CodigoTRN }
        procedure SetCodigoTRN(Value : Integer);
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
        { Read method for property NomeFantasia }
        function GetNomeFantasia : String;
        { Write method for property NomeFantasia }
        procedure SetNomeFantasia(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property RazaoSocial }
        function GetRazaoSocial : String;
        { Write method for property RazaoSocial }
        procedure SetRazaoSocial(Value : String);
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
      { Protected fields of TTransportadora }

      { Protected methods of TTransportadora }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TTransportadora }

      { Public methods of TTransportadora }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CDTRN:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Fornecedor }
        function Inserir(CdCNC,CdTRN,PSituacao,PLogradouro, CdCCX: integer; RZ_SOCIAL,NOME_FAN,CGC_CPF,PEndereco,PBairro,PCidade,PUF,PIE,PCEP,PFone,PFax, PSite, PEMail,POBS:String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCNPJ(CdTRN:integer; CNPJ:string):Boolean;
        { Localiza um Fornecedor }
        function LocalizarCod(CdTRN:Integer):Boolean;
        function LocalizarNome(PNome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;
        { Altera um Fornecedor }
        function zzzAlterar(CdCNC,CdTRN,PSituacao,PLogradouro, CdCCX: integer; RZ_SOCIAL,NOME_FAN,CGC_CPF,PEndereco,PBairro,PCidade,PUF,PIE,PCEP,PFone,PFax,PSite,PEMail,POBS:String):boolean;

    published
      { Published properties of TTransportadora }
        property Bairro : String read GetBairro write SetBairro;
        property CEP : String read GetCEP write SetCEP;
        property CFornecedor : Integer read FCFornecedor write FCFornecedor;
        property CPFCGC : String read GetCPFCGC write SetCPFCGC;
        property Cidade : String read GetCidade write SetCidade;
        property CodigoCCX : Integer read GetCodigoCCX write SetCodigoCCX;
        { Código da Transportadora }
        property CodigoTRN : Integer read GetCodigoTRN write SetCodigoTRN;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EBairro : TEdit read FEBairro write FEBairro;
        property ECPFCGC : TMaskEdit read FECPFCGC write FECPFCGC;
        property ECep : TMaskEdit read FECep write FECep;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoCCX : TDBLookupComboBox
             read FECodigoCCX write FECodigoCCX;
        property ECodigoTRN : TEdit read FECodigoTRN write FECodigoTRN;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EEMail : TEdit read FEEMail write FEEMail;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EFax : TMaskEdit read FEFax write FEFax;
        property EFone : TMaskEdit read FEFone write FEFone;
        property EIE : TEdit read FEIE write FEIE;
        property ELogradouro : TDBLookUpComboBox
             read FELogradouro write FELogradouro;
        property EMail : String read GetEMail write SetEMail;
        property ENomeFantasia : TEdit
             read FENomeFantasia write FENomeFantasia;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ERazaoSocial : TEdit read FERazaoSocial write FERazaoSocial;
        property ESite : TEdit read FESite write FESite;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EUF : TComboBox read FEUF write FEUF;
        property Endereco : String read GetEndereco write SetEndereco;
        property Fax : String read GetFax write SetFax;
        property Fone : String read GetFone write SetFone;
        property IE : String read GetIE write SetIE;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property NomeFantasia : String
             read GetNomeFantasia write SetNomeFantasia;
        property OBS : String read GetOBS write SetOBS;
        property RazaoSocial : String read GetRazaoSocial write SetRazaoSocial;
        property Site : String read GetSite write SetSite;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Uf : String read GetUf write SetUf;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTransportadora with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTransportadora]);
end;

{ Method to set variable and property values and create objects }
procedure TTransportadora.AutoInitialize;
begin
     FEBairro := nil;
     FECPFCGC := nil;
     FECep := nil;
     FECidade := nil;
     FECodigoCCX := nil;
     FECodigoTRN := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEEMail := nil;
     FEEndereco := nil;
     FEFax := nil;
     FEFone := nil;
     FEIE := nil;
     FELogradouro := nil;
     FENomeFantasia := nil;
     FEOBS := nil;
     FERazaoSocial := nil;
     FESite := nil;
     FESituacao := nil;
     FEUF := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TTransportadora.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FECPFCGC then
        FECPFCGC := nil;
     if AComponent = FECep then
        FECep := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoCCX then
        FECodigoCCX := nil;
     if AComponent = FECodigoTRN then
        FECodigoTRN := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEEMail then
        FEEMail := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FEFax then
        FEFax := nil;
     if AComponent = FEFone then
        FEFone := nil;
     if AComponent = FEIE then
        FEIE := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FENomeFantasia then
        FENomeFantasia := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FERazaoSocial then
        FERazaoSocial := nil;
     if AComponent = FESite then
        FESite := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FEUF then
        FEUF := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TTransportadora.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bairro }
function TTransportadora.GetBairro : String;
begin
  try
    Result := Self.fieldByName('TRN_BAIRRO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TTransportadora.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_BAIRRO"!');
  end;
end;

{ Read method for property CEP }
function TTransportadora.GetCEP : String;
begin
  try
    Result := Self.fieldByName('TRN_CEP').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TTransportadora.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_CEP"!');
  end;
end;

{ Read method for property CPFCGC }
function TTransportadora.GetCPFCGC : String;
begin
  try
    Result := Self.fieldByName('TRN_CGC').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CPFCGC }
procedure TTransportadora.SetCPFCGC(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_CGC').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_CGC"!');
  end;
end;

{ Read method for property Cidade }
function TTransportadora.GetCidade : String;
begin
  try
    Result := Self.fieldByName('TRN_CIDADE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Cidade }
procedure TTransportadora.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_CIDADE"!');
  end;
end;

{ Read method for property CodigoCCX }
function TTransportadora.GetCodigoCCX : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCCX }
procedure TTransportadora.SetCodigoCCX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRN }
function TTransportadora.GetCodigoTRN : Integer;
begin
  try
    Result := Self.fieldByName('TRN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTRN }
procedure TTransportadora.SetCodigoTRN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRN_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TTransportadora.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('TRN_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TTransportadora.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TTransportadora.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('TRN_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TTransportadora.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_DT_CADASTRO"!');
  end;
end;

{ Read method for property EMail }
function TTransportadora.GetEMail : String;
begin
  try
    Result := Self.fieldByName('TRN_EMAIL').asString;
  except
    result:= ''
  end;
end;

{ Write method for property EMail }
procedure TTransportadora.SetEMail(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_EMAIL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_EMAIL"!');
  end;
end;

{ Read method for property Endereco }
function TTransportadora.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('TRN_ENDERECO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TTransportadora.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_ENDERECO"!');
  end;
end;

{ Read method for property Fax }
function TTransportadora.GetFax : String;
begin
  try
    Result := Self.fieldByName('TRN_FAX').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fax }
procedure TTransportadora.SetFax(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_FAX').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_FAX"!');
  end;
end;

{ Read method for property Fone }
function TTransportadora.GetFone : String;
begin
  try
    Result := Self.fieldByName('TRN_FONE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fone }
procedure TTransportadora.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_FONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_FONE"!');
  end;
end;

{ Read method for property IE }
function TTransportadora.GetIE : String;
begin
  try
    Result := Self.fieldByName('TRN_IE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property IE }
procedure TTransportadora.SetIE(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_IE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_IE"!');
  end;
end;

{ Read method for property Logradouro }
function TTransportadora.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('TRN_LOGRADOURO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Logradouro }
procedure TTransportadora.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRN_LOGRADOURO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRN_LOGRADOURO"!');
    end;
end;

{ Read method for property NomeFantasia }
function TTransportadora.GetNomeFantasia : String;
begin
  try
    Result := Self.fieldByName('TRN_NOME_FAN').asString;
  except
    result:= ''
  end;
end;

{ Write method for property NomeFantasia }
procedure TTransportadora.SetNomeFantasia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_NOME_FAN').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_NOME_FAN"!');
  end;
end;

{ Read method for property OBS }
function TTransportadora.GetOBS : String;
begin
  try
    Result := Self.fieldByName('TRN_OBSERVACAO1').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TTransportadora.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_OBSERVACAO1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_OBSERVACAO1"!');
  end;
end;

{ Read method for property RazaoSocial }
function TTransportadora.GetRazaoSocial : String;
begin
  try
    Result := Self.fieldByName('TRN_RZ_SOCIAL').asString;
  except
    result:= ''
  end;
end;

{ Write method for property RazaoSocial }
procedure TTransportadora.SetRazaoSocial(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_RZ_SOCIAL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_RZ_SOCIAL"!');
  end;
end;

{ Read method for property Site }
function TTransportadora.GetSite : String;
begin
  try
    Result := Self.fieldByName('TRN_SITE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Site }
procedure TTransportadora.SetSite(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_SITE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_SITE"!');
  end;
end;

{ Read method for property Situacao }
function TTransportadora.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('TRN_SITUACAO').asinteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TTransportadora.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_SITUACAO').asinteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_SITUACAO"!');
  end;
end;

{ Read method for property Uf }
function TTransportadora.GetUf : String;
begin
  try
    Result := Self.fieldByName('TRN_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Uf }
procedure TTransportadora.SetUf(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRN_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRN_UF"!');
  end;
end;

function TTransportadora.AlterarAuto:Boolean;
var
  CdCNC, CdTRN: integer;
  sDetalhe: string;
begin
  Result := false;
  CdCNC := CodigoCNC;
  CdTRN := CodigoTRN;
  sDetalhe := '';
  try
    edit;
    try
       CodigoUSU     := CConfiguracao.CodigoUSU;
    except
    end;
    try
       DataAlterado  := CConfiguracao.DataHora;
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
       CodigoCCX := ECodigoCCX.KeyValue;
       sDetalhe := sDetalhe + ' CCX:'+IntToStr(ECodigoCCX.KeyValue);
    except
    end;
    try
       CPFCGC := ECPFCGC.Text;
    except
    end;
    try
       Logradouro  :=ELogradouro.KeyValue;
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
       IE   := EIE.Text;
    except
    end;
    try
       CEP := ECEP.text;
    except
    end;
    try
       Fone := EFONE.Text;
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
       Situacao := ESITUACAO.itemindex;
       if ESITUACAO.itemindex = 0 then 
         sDetalhe := sDetalhe + ' Ativado'
       else
         sDetalhe := sDetalhe + ' Desativado';       
    except
    end;
    try
       Obs := EOBS.Text;
       sDetalhe := sDetalhe + ' OBS:'+EOBS.Text;
    except
    end;
    try
      Post;
      GeraLog(240, CdCNC, CdTRN, sDetalhe);
      Result := True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TTransportadora.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    ERazaoSocial.Enabled      :=Habilitar;
  except
  end;
  try
    ENomeFantasia.Enabled     :=Habilitar;
  except
  end;
  try
    ECodigoCCX.Enabled        :=Habilitar;
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
    EFax.Enabled             :=Habilitar;
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
    ESITUACAO.Enabled         :=Habilitar;
  except
  end;
  try
    EOBS.Enabled              :=Habilitar;
  except
  end;
end;

procedure TTransportadora.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TTransportadora.CarregaDados;
begin
  try
    ECodigoTRN.Text           :=IntToStr(CodigoTRN);
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
    ENomeFantasia.Text        :=NomeFantasia;
  except
  end;
  try
    ECodigoCCX.KeyValue       :=CodigoCCX;
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
    ESITUACAO.itemindex       :=Situacao;
  except
  end;
  try
    EOBS.Text                 :=Obs;
  except
  end;
end;

constructor TTransportadora.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'TRANSPORTADORA';

     { Code to perform other tasks when the component is created }

end;

function TTransportadora.Deletar(CDTRN:Integer):Boolean;
var
  CdCNC: integer;
begin
  Result := False;
  If not(localizarCod(CdTRN)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      if Delete then
      Begin
        Result := True;
        GeraLog(230,CdCNC,CdTRN);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TTransportadora.Destroy;
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

function TTransportadora.FinalizaEdicao:Boolean;
var
  cdTRN:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if ERazaoSocial.Text = '' then
    mensagem:= mensagem + 'Razão Social inválida!'+#13;
  if EUF.ItemIndex >= 0 then
    if (EIE.Text <> '') then
      if not VerificaCGFBranco(EIE.Text,EUF.Items[EUF.ItemIndex]) then
        Exit; //Mensagem já está na Função
  if (EIE.Text <> '') and
     (not VerificaCGFBranco(EIE.Text,EUF.Text)) then
    Exit;  //A menssagem será exibida pela função
  if not VerificaCPFCNPJ(ECPFCGC.Text) then
    mensagem:= mensagem + 'CNPJ incorreto!'+#13;
  If LocalizarCNPJ(StrToInt(ECodigoTRN.Text), ECPFCGC.Text) Then
      mensagem:=mensagem+ 'Transportadora com CNPJ ja cadastrado!'+#13;
  if (ECodigoCCX.Text = '') then
    mensagem := mensagem + 'Conta de Caixa inválida!'+#13;
  If mensagem <>'' Then
    raise Exception.Create(mensagem)
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
        SQL.Text := 'SELECT * FROM TRANSPORTADORA '+
          ' WHERE TRN_CODIGO='+IntTostr(SCodigo);
        open;
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cdTRN:=codigoTRN;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cdTRN);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Fornecedor }
function TTransportadora.Inserir(CdCNC,CdTRN,PSituacao,PLogradouro, CdCCX: integer; RZ_SOCIAL,NOME_FAN,CGC_CPF,PEndereco,PBairro,PCidade,PUF,PIE,PCEP,PFone,PFax, PSite, PEMail,POBS:String):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdTRN=0 then
    Cod    := ProximoCodigo('TRN_CODIGO')
  else
    Cod    := CdTRN;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     Insert;
     try
       CodigoTRN      := Cod;
       CodigoCNC      := CdCNC;
       CodigoUSU      := CConfiguracao.CodigoUSU;
       DataCadastro   := CConfiguracao.DataHora;
       RazaoSocial    := RZ_SOCIAL;
       NomeFantasia   := NOME_FAN;
       CodigoCCX      := CdCCX;
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
       Situacao       := PSituacao;
       Obs            := POBS;
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

function TTransportadora.InserirAuto:Boolean;
var
  CdCNC, CdTRN: integer;
  sDetalhe: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdTRN := SCodigo;
  sDetalhe := '';
  try
    append;
    try
      CodigoTRN   := SCodigo;
    except
    end;
    try
      codigocnc   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro := StrToDateTime(EDataCadastro.Text);
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
       CodigoCCX := ECodigoCCX.KeyValue;
       sDetalhe := sDetalhe + ' CCX:'+IntToStr(ECodigoCCX.KeyValue);
    except
    end;
    try
       CPFCGC := ECPFCGC.Text;
    except
    end;
    try
       Logradouro  := ELogradouro.keyValue;
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
       IE   := EIE.Text;
    except
    end;
    try
       CEP := ECEP.text;
    except
    end;
    try
       Fone := EFONE.Text;
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
       Situacao := ESITUACAO.itemindex;
       if ESITUACAO.itemindex = 0 then 
         sDetalhe := sDetalhe + ' Ativado'
       else
         sDetalhe := sDetalhe + ' Desativado';       
    except
    end;
    try
       Obs := EOBS.Text;
       sDetalhe := sDetalhe + ' OBS:'+EOBS.Text;
    except
    end;
    try
      Post;
      GeraLog(220, CdCNC, CdTRN, sDetalhe);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TTransportadora.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoTRN.Clear;
  except
  end;
  try
    ELogradouro.KeyValue := 0;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
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
    if Estado <> 1 then
      ECodigoCCX.KeyValue := -1
    else
      ECodigoCCX.KeyValue := CConfiguracao.ContPagTrn;
  except
  end;
  try
    ECPFCGC.Clear;
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
    if Estado <> 1 then
      ECidade.Clear
    else
      ECidade.Text := CConfiguracao.Cidade;
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
      EUF.ItemIndex := -1
    else
      ItemComboBox(EUF,CConfiguracao.UF);
  except
  end;
  try
    EIE.Clear;
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
end;

function TTransportadora.LocalizarCNPJ(CdTRN:integer; CNPJ:string):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  if (CNPJ <> '') and (CNPJ <> '  -   -   /    -  ') then
  Begin
    CConfiguracao.QueryComandos.Close;
    CConfiguracao.QueryComandos.SQL.Text:='SELECT TRN_CODIGO,TRN_CGC FROM TRANSPORTADORA '+
      ' WHERE TRN_CGC="'+CNPJ+'" AND TRN_CODIGO <> '+IntToStr(CdTRN);
    CConfiguracao.QueryComandos.Open;
    Result := not CConfiguracao.QueryComandos.isEmpty;
  end
  else
    Result := False;
end;

{ Localiza um Fornecedor }
function TTransportadora.LocalizarCod(CdTRN:Integer):Boolean;
begin
  If (CDTRN<>CodigoTRN) Then
    If locate('TRN_CODIGO', CDTRN, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TTransportadora.LocalizarNome(PNome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If PNome<>NomeFantasia Then
    If locate('TRN_NOME_FAN',PNome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TTransportadora.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TTransportadora.PreparaInsercao;
begin
  ProximoCodigo('TRN_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TTransportadora.deletarauto:Boolean;
var
  CdCNC,CdTRN:Integer;
  sDetalhe: string;
begin
  Result := False;
  try
    CdCNC:=CodigoCNC;
    CdTRN:=CodigoTRN;
    sDetalhe := 'RzSocial:'+RazaoSocial;
    if Delete then
    Begin
      result:=true;
      GeraLog(230,CdCNC,CdTRN,sDetalhe);
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

{ Altera um Fornecedor }
function TTransportadora.zzzAlterar(CdCNC,CdTRN,PSituacao,PLogradouro, CdCCX: integer; RZ_SOCIAL,NOME_FAN,CGC_CPF,PEndereco,PBairro,PCidade,PUF,PIE,PCEP,PFone,PFax,PSite,PEMail,POBS:String):boolean;
begin
  result:=true;
  If not(localizarCod(CdTRN)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := CConfiguracao.DataHora;
      RazaoSocial    := RZ_SOCIAL;
      NomeFantasia   := NOME_FAN;
      CodigoCCX      := CdCCX;
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
      Situacao       := PSituacao;
      Obs            := POBS;

      try
        Post;
      except
        result:=false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;


end.
