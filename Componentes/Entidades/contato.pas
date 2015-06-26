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
unit Contato;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbctrls, Dbgrids, Funcoes, Variants, 
     Extctrls;

type
  TContato = class(TSQuery)
    private
      { Private fields of TContato }
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property Cargo }
        FCargo : String;
        { Storage for property Celular }
        FCelular : String;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodigoCNT }
        FCodigoCNT : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property DTNascimento }
        FDTNascimento : TDateTime;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property ECEP }
        FECEP : TMaskEdit;
        { Storage for property ECargo }
        FECargo : TEdit;
        { Storage for property ECelular }
        FECelular : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoCNT }
        FECodigoCNT : TEdit;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDtNascimento }
        FEDtNascimento : TMaskEdit;
        { Storage for property EEmail }
        FEEmail : TEdit;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property EFORCNC }
        FEFORCNC : TEdit;
        { Storage for property EFax }
        FEFax : TMaskEdit;
        { Storage for property EFone }
        FEFone : TMaskEdit;
        { Storage for property EFoto }
        FEFoto : TImage;
        { Storage for property ELogradouro }
        FELogradouro : TDBLookupComboBox;
        { Storage for property EMail }
        FEMail : String;
        { Storage for property ENome }
        FENome : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property EUF }
        FEUF : TComboBox;
        { Storage for property Endereco }
        FEndereco : String;
        { Storage for property FORCNC }
        FFORCNC : Integer;
        { Storage for property Fax }
        FFax : String;
        { Storage for property Fone }
        FFone : String;
        { Storage for property Logradouro }
        FLogradouro : Integer;
        { Storage for property Nome }
        FNome : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property UF }
        FUF : String;

      { Private methods of TContato }
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
        { Read method for property Cargo }
        function GetCargo : String;
        { Write method for property Cargo }
        procedure SetCargo(Value : String);
        { Read method for property Celular }
        function GetCelular : String;
        { Write method for property Celular }
        procedure SetCelular(Value : String);
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
        { Read method for property CodigoCNT }
        function GetCodigoCNT : Integer;
        { Write method for property CodigoCNT }
        procedure SetCodigoCNT(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property DTNascimento }
        function GetDTNascimento : TDateTime;
        { Write method for property DTNascimento }
        procedure SetDTNascimento(Value : TDateTime);
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
        { Read method for property FORCNC }
        function GetFORCNC : Integer;
        { Write method for property FORCNC }
        procedure SetFORCNC(Value : Integer);
        { Read method for property Fax }
        function GetFax : String;
        { Write method for property Fax }
        procedure SetFax(Value : String);
        { Read method for property Fone }
        function GetFone : String;
        { Write method for property Fone }
        procedure SetFone(Value : String);
        { Read method for property Logradouro }
        function GetLogradouro : Integer;
        { Write method for property Logradouro }
        procedure SetLogradouro(Value : Integer);
        { Read method for property Nome }
        function GetNome : String;
        { Write method for property Nome }
        procedure SetNome(Value : String);
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
        { Read method for property UF }
        function GetUF : String;
        { Write method for property UF }
        procedure SetUF(Value : String);

    protected
      { Protected fields of TContato }

      { Protected methods of TContato }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TContato }

      { Public methods of TContato }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CDCnt:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao(PTipo:integer):Boolean;
        { Insere um Contato }
        function Inserir(CdCNC,PSituacao,CdCnt,CdFOR:Integer;PNome,PFone,PFax,PCelular,PCargo,PEMail,POBS:String):boolean;
        function InserirAuto(PTipo: integer):Boolean;
        procedure LimpaCampos;
        { Localiza um contato }
        function LocalizarCod(CDCnt,CDCNC:Integer):Boolean;
        function LocalizarNome(PNome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TContato }
        property Bairro : String read GetBairro write SetBairro;
        property CEP : String read GetCEP write SetCEP;
        property Cargo : String read GetCargo write SetCargo;
        property Celular : String read GetCelular write SetCelular;
        property Cidade : String read GetCidade write SetCidade;
        { Código do Contato }
        property CodigoCNT : Integer read GetCodigoCNT write SetCodigoCNT;
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        property DTNascimento : TDateTime
             read GetDTNascimento write SetDTNascimento;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EBairro : TEdit read FEBairro write FEBairro;
        property ECEP : TMaskEdit read FECEP write FECEP;
        property ECargo : TEdit read FECargo write FECargo;
        property ECelular : TMaskEdit read FECelular write FECelular;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoCNT : TEdit read FECodigoCNT write FECodigoCNT;
        property ECodigoFOR : TEdit read FECodigoFOR write FECodigoFOR;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDtNascimento : TMaskEdit
             read FEDtNascimento write FEDtNascimento;
        property EEmail : TEdit read FEEmail write FEEmail;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EFORCNC : TEdit read FEFORCNC write FEFORCNC;
        property EFax : TMaskEdit read FEFax write FEFax;
        property EFone : TMaskEdit read FEFone write FEFone;
        property EFoto : TImage read FEFoto write FEFoto;
        property ELogradouro : TDBLookupComboBox
             read FELogradouro write FELogradouro;
        property EMail : String read GetEMail write SetEMail;
        property ENome : TEdit read FENome write FENome;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EUF : TComboBox read FEUF write FEUF;
        property Endereco : String read GetEndereco write SetEndereco;
        property FORCNC : Integer read GetFORCNC write SetFORCNC;
        property Fax : String read GetFax write SetFax;
        property Fone : String read GetFone write SetFone;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property Nome : String read GetNome write SetNome;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;
        property UF : String read GetUF write SetUF;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TContato with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TContato]);
end;

{ Method to set variable and property values and create objects }
procedure TContato.AutoInitialize;
begin
     FEBairro := nil;
     FECEP := nil;
     FECargo := nil;
     FECelular := nil;
     FECidade := nil;
     FECodigoCNT := nil;
     FECodigoFOR := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDtNascimento := nil;
     FEEmail := nil;
     FEEndereco := nil;
     FEFORCNC := nil;
     FEFax := nil;
     FEFone := nil;
     FEFoto := nil;
     FELogradouro := nil;
     FENome := nil;
     FEOBS := nil;
     FESituacao := nil;
     FEUF := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TContato.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FECEP then
        FECEP := nil;
     if AComponent = FECargo then
        FECargo := nil;
     if AComponent = FECelular then
        FECelular := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoCNT then
        FECodigoCNT := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDtNascimento then
        FEDtNascimento := nil;
     if AComponent = FEEmail then
        FEEmail := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FEFORCNC then
        FEFORCNC := nil;
     if AComponent = FEFax then
        FEFax := nil;
     if AComponent = FEFone then
        FEFone := nil;
     if AComponent = FEFoto then
        FEFoto := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FENome then
        FENome := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FEUF then
        FEUF := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TContato.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bairro }
function TContato.GetBairro : String;
begin
  try
    Result := Self.fieldByName('CNT_BAIRRO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Bairro }
procedure TContato.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_BAIRRO"!');
  end;
end;

{ Read method for property CEP }
function TContato.GetCEP : String;
begin
  try
    Result := Self.fieldByName('CNT_CEP').asString;
  except
    result:= '';
  end;
end;

{ Write method for property CEP }
procedure TContato.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_CEP"!');
  end;
end;

{ Read method for property Cargo }
function TContato.GetCargo : String;
begin
  try
    Result := Self.fieldByName('CNT_CARGO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Cargo }
procedure TContato.SetCargo(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_CARGO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_CARGO"!');
  end;
end;

{ Read method for property Celular }
function TContato.GetCelular : String;
begin
  try
    Result := Self.fieldByName('CNT_CELULAR').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Celular }
procedure TContato.SetCelular(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_CELULAR').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_CELULAR"!');
  end;
end;

{ Read method for property Cidade }
function TContato.GetCidade : String;
begin
  try
    Result := Self.fieldByName('CNT_CIDADE').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Cidade }
procedure TContato.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_CIDADE"!');
  end;
end;

{ Read method for property CodigoCNT }
function TContato.GetCodigoCNT : Integer;
begin
  try
    Result := Self.fieldByName('CNT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNT }
procedure TContato.SetCodigoCNT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNT_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TContato.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TContato.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property DTNascimento }
function TContato.GetDTNascimento : TDateTime;
begin
  try
    Result := Self.fieldByName('CNT_DT_NASCIMENTO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DTNascimento }
procedure TContato.SetDTNascimento(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_DT_NASCIMENTO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_DT_NASCIMENTO"!');
  end;
end;

{ Read method for property DataAlterado }
function TContato.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CNT_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TContato.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_DT_ALTERADO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TContato.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('CNT_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TContato.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_DT_CADASTRO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_DT_CADASTRO"!');
  end;
end;

{ Read method for property EMail }
function TContato.GetEMail : String;
begin
  try
    Result := Self.fieldByName('CNT_EMAIL').asString;
  except
    result:= '';
  end;
end;

{ Write method for property EMail }
procedure TContato.SetEMail(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_EMAIL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_EMAIL"!');
  end;
end;

{ Read method for property Endereco }
function TContato.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('CNT_ENDERECO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Endereco }
procedure TContato.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_ENDERECO"!');
  end;
end;

{ Read method for property FORCNC }
function TContato.GetFORCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_FOR').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property FORCNC }
procedure TContato.SetFORCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_FOR').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_FOR"!');
  end;
end;

{ Read method for property Fax }
function TContato.GetFax : String;
begin
  try
    Result := Self.fieldByName('CNT_FAX').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fax }
procedure TContato.SetFax(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_FAX').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_FAX"!');
  end;
end;

{ Read method for property Fone }
function TContato.GetFone : String;
begin
  try
    Result := Self.fieldByName('CNT_TELEFONE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fone }
procedure TContato.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_TELEFONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_TELEFONE"!');
  end;
end;

{ Read method for property Logradouro }
function TContato.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('CNT_LOGRADOURO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Logradouro }
procedure TContato.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_LOGRADOURO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_LOGRADOURO"!');
  end;
end;

{ Read method for property Nome }
function TContato.GetNome : String;
begin
  try
    Result := Self.fieldByName('CNT_NOME').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Nome }
procedure TContato.SetNome(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_NOME').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_NOME"!');
  end;
end;

{ Read method for property OBS }
function TContato.GetOBS : String;
begin
  try
    Result := Self.fieldByName('CNT_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property OBS }
procedure TContato.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TContato.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CNT_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TContato.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_SITUACAO"!');
  end;
end;

{ Read method for property Tipo }
function TContato.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('CNT_TIPO').asInteger; //0 - FOR; 1 - CLI
  except
    result:= 0;
  end;
end;

{ Write method for property Tipo }
procedure TContato.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_TIPO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_TIPO"!');
  end;
end;

{ Read method for property UF }
function TContato.GetUF : String;
begin
  try
    Result := Self.fieldByName('CNT_UF').asString;
  except
    result:= '';
  end;
end;

{ Write method for property UF }
procedure TContato.SetUF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNT_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNT_UF"!');
  end;
end;

function TContato.AlterarAuto:Boolean;
var
  CdCNC, CdCNT: integer;
  sDataNascimento, sLogradouro, sSituacao: string;
begin
  result := false;
  CdCNC := CodigoCNC;
  CdCNT := CodigoCNT;

  try
    sDataNascimento := '"'+MesDia(StrToDateTime(EDtNascimento.Text))+'" ';
  except
    sDataNascimento := 'NULL';
  end;
  try
    sLogradouro  := IntToStr(ELogradouro.KeyValue);
  except
    sLogradouro  := '0';
  end;
  try
    sSituacao := IntToStr(ESITUACAO.Itemindex);
  except
    sSituacao := '0';
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE CONTATO SET '+
      ' CNT_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',CNT_DT_NASCIMENTO='+sDataNascimento+
      ',CNT_NOME="'+ENome.Text+'" '+
      ',CNT_CARGO="'+ECargo.Text+'" '+
      ',CNT_LOGRADOURO='+sLogradouro+
      ',CNT_ENDERECO="'+EEndereco.Text+'" '+
      ',CNT_BAIRRO="'+EBairro.Text+'" '+
      ',CNT_CIDADE="'+ECidade.Text+'" '+
      ',CNT_UF="'+EUF.Text+'" '+
      ',CNT_CEP="'+ECEP.text+'" '+
      ',CNT_TELEFONE="'+EFONE.Text+'" '+
      ',CNT_FAX="'+EFax.Text+'" '+
      ',CNT_CELULAR="'+ECelular.Text+'" '+
      ',CNT_EMAIL="'+EEMail.Text+'" '+
      ',CNT_SITUACAO='+sSituacao+
      ',CNT_OBSERVACAO="'+EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND CNT_CODIGO='+IntToStr(CdCNT));
    Result:=True;
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TContato.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    ENome.Enabled             :=Habilitar;
  except
  end;
  try
    ECARGO.Enabled            :=Habilitar;
  except
  end;
  try
    EDtNascimento.Enabled     :=Habilitar;
  except
  end;
  try
    ELogradouro.Enabled             :=Habilitar;
  except
  end;
  try
    EEndereco.Enabled             :=Habilitar;
  except
  end;
  try
    EBairro.Enabled             :=Habilitar;
  except
  end;
  try
    ECidade.Enabled             :=Habilitar;
  except
  end;
  try
    EUF.Enabled             :=Habilitar;
  except
  end;
  try
    ECEP.Enabled             :=Habilitar;
  except
  end;
  try
    EFONE.Enabled             :=Habilitar;
  except
  end;
  try
    EFAX.Enabled              :=Habilitar;
  except
  end;
  try
    ECelular.Enabled          :=Habilitar;
  except
  end;
  try
    EEMail.Enabled            :=Habilitar;
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

procedure TContato.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TContato.CarregaDados;
var
  Foto: string;
begin
  Try
    ECodigoCnt.Text           :=IntToStr(CodigoCNT);
  except
  end;
  try
    ENome.Text                :=Nome;
  except
  end;
  try
    ECARGO.Text               :=Cargo;
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text        :=formatDateTime('DD/MM/YYYY HH:MM',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DaTaAlterado > 0 then
      EDaTaAlterado.Text        :=formatDateTime('DD/MM/YYYY HH:MM',DaTaAlterado)
    else
      EDaTaAlterado.Clear;
  except
  end;
  try
    if DTNascimento > 0 then
      EDtNascimento.Text        :=DateToStr(DtNascimento)
    else
      EDTNascimento.Clear;
  except
  end;
  try
    ELogradouro.KeyValue     :=Logradouro;
  except
  end;
  try
    EEndereco.Text                :=Endereco;
  except
  end;
  try
    EBairro.Text                :=Bairro;
  except
  end;
  try
    ECidade.Text                :=Cidade;
  except
  end;
  try
    ItemComboBox(EUF,UF);
  except
  end;
  try
    ECEP.Text                :=CEP;
  except
  end;
  try
    EFONE.Text                :=Fone;
  except
  end;
  try
    EFAX.Text                 :=Fax;
  except
  end;
  try
    ECelular.Text             :=Celular;
  except
  end;
  try
    EEMail.Text               :=EMail;
  except
  end;
  try
    ESITUACAO.ItemIndex       :=Situacao;
  except
  end;
  try
    EOBS.Text                 :=Obs;
  except
  end;
  try
    if CConfiguracao.CodigoCNC < 10 then
      foto:=CConfiguracao.PastaImagens+'\Contato\0'+IntToStr(CConfiguracao.CodigoCNC)+
         '-'+IntToStr(CodigoCNT)+'.JPG'
    else
      foto:=CConfiguracao.PastaImagens+'\Contato\'+IntToStr(CConfiguracao.CodigoCNC)+
         '-'+IntToStr(CodigoCNT)+'.JPG';
    Efoto.Picture.LoadFromFile(foto);
  Except
    try
      EFoto.Picture:=nil;
    except
    end;
  end;  
end;

constructor TContato.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CONTATO';

     { Code to perform other tasks when the component is created }

end;

function TContato.Deletar(CdCNC,CDCnt:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCNT,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        GeraLog(590,CdCNC,CdCNT);
        RegistrarDel(CdCNC,1290(*Contato*),CdCNT);
        if TQuery(Self).isEMpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TContato.Destroy;
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

function TContato.FinalizaEdicao(PTipo:integer):Boolean;
var
  cdcnt, cdcnc:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem := '';
  if not VerificaInteiroBranco(ECodigoFOR.Text) then
    mensagem:=mensagem+'Código do Registro Principal inválido!'+#13;
  if ENome.Text = '' then
    mensagem:=mensagem+'Nome do Contato inválido!'+#13;
  if not VerificaData(EDtNascimento.Text) then
    mensagem:=mensagem+'Data de Nascimento do Contato inválido!'+#13;
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto(PTipo) then
      Begin
        close;
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
        Result := True;
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cdcnt:=codigoCnt;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        close;
        open;
        LocalizarCod(cdcnt, cdcnc);
        AtualizaControles(False);
        Estado:=0;
        Result := True;
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Contato }
function TContato.Inserir(CdCNC,PSituacao,CdCnt,CdFOR:Integer;PNome,PFone,PFax,PCelular,PCargo,PEMail,POBS:String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdCnt=0 then
    Cod    := ProximoCodigo('CNT_CODIGO')
  else
    Cod    := CdCnt;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
   result:=true;
       try
         INSERT;
         CodigoCNT      := Cod;
         CodigoCNC      := CdCNC;
         CodigoUSU      := CConfiguracao.CodigoUSU;
         CodigoFOR      := CdFOR;
         DataCadastro   := StrToDateTime(EDataCadastro.Text);;
         Nome           := PNome;
         Fone           := PFone;
         Fax            := PFax;
         Celular        := PCelular;
         Situacao       := PSituacao;
         Cargo          := PCargo;
         EMail          := PEMail;
         Obs            := POBS;
         try
           Post;
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

function TContato.InserirAuto(PTipo: integer):Boolean;
var
  CdCNC, CdCNT: integer;
  sDataNascimento, sLogradouro, sSituacao: string;
begin
  result := false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdCNT := StrToInt(ECodigoCNT.Text);

  try
    sDataNascimento := '"'+MesDia(StrToDateTime(EDtNascimento.Text))+'" ';
  except
    sDataNascimento := 'NULL';
  end;
  try
    sLogradouro  := IntToStr(ELogradouro.KeyValue);
  except
    sLogradouro  := '0';
  end;
  try
    sSituacao := IntToStr(ESITUACAO.Itemindex);
  except
    sSituacao := '0';
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT CONTATO '+
      ' (CNC_CODIGO,CNT_CODIGO,CNC_FOR,FOR_CODIGO,CNT_TIPO '+
      ',CNT_DT_CADASTRO,USU_CODIGO '+
      ',CNT_DT_NASCIMENTO,CNT_NOME,CNT_CARGO,CNT_LOGRADOURO '+
      ',CNT_ENDERECO,CNT_BAIRRO,CNT_CIDADE,CNT_UF,CNT_CEP '+
      ',CNT_TELEFONE,CNT_FAX,CNT_CELULAR,CNT_EMAIL '+
      ',CNT_SITUACAO,CNT_OBSERVACAO) VALUES '+
      ' ('+IntToStr(CdCNC)+
      ', '+IntToStr(CdCNT)+
      ', '+EFORCNC.Text+
      ', '+ECodigoFOR.Text+
      ', '+IntToStr(PTipo)+ //0-FOR; 1-CLI
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ', '+sDataNascimento+
      ',"'+ENome.Text+'" '+
      ',"'+ECargo.Text+'" '+
      ', '+sLogradouro+
      ',"'+EEndereco.Text+'" '+
      ',"'+EBairro.Text+'" '+
      ',"'+ECidade.Text+'" '+
      ',"'+EUF.Text+'" '+
      ',"'+ECEP.text+'" '+
      ',"'+EFONE.Text+'" '+
      ',"'+EFax.Text+'" '+
      ',"'+ECelular.Text+'" '+
      ',"'+EEMail.Text+'" '+
      ', '+sSituacao+
      ',"'+EOBS.Text+'") ');
    Result:=True;
  except
    ShowMessage('Não foi possível inserir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TContato.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoCNT.Clear;
  except
  end;
  try
    ENome.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := FormatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    EDTNascimento.Clear;
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
    if Estado <> 1 then
      ECidade.Clear
    else
      ECidade.Text := CConfiguracao.Cidade;
  except
  end;
  Try
    if Estado <> 1 then
      EUF.ItemIndex := -1
    else
      ItemComboBox(EUf,CConfiguracao.UF);
  Except
  End;
  try
    ECEP.Clear;
  except
  end;
  try
    EFONE.Clear;
  except
  end;
  try
    EFAX.Clear;
  except
  end;
  try
    ECARGO.Clear;
  except
  end;
  try
    EEMail.Clear;
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
    EFoto.Picture:=nil;
  except
  end;  
end;

{ Localiza um contato }
function TContato.LocalizarCod(CDCnt,CDCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDCnt<>CodigoCnt) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;CNT_CODIGO', vararrayof([CDCNC, CDCNT]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TContato.LocalizarNome(PNome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>PNome Then
    If locate('CNT_NOME',PNome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TContato.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TContato.PreparaInsercao;
begin
  ProximoCodigo('CNT_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TContato.deletarauto:Boolean;
var
  CdCNC,CdCNT:Integer;
begin
  Result := False;
  try
    CdCNC:=CodigoCNC;
    CdCNT:=CodigoCNT;
    if Delete then
    Begin
      result:=true;
      GeraLog(590,CdCNC,CdCNT);
      RegistrarDel(CdCNC,1290(*Contato*),CdCNT);
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
