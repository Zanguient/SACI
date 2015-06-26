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
unit Funcionario;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Secao, Configuracao, Dbgrids, Funcoes, Extctrls, 
     Variants;

type
  TFuncionario = class(TSQuery)
    private
      { Private fields of TFuncionario }
        { Storage for property ApareceServicos }
        FApareceServicos : Boolean;
        { Storage for property ApareceVendas }
        FApareceVendas : Boolean;
        { Storage for property Apelido }
        FApelido : String;
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property CFuncao }
        FCFuncao : Integer;
        { Storage for property CLogradouro }
        FCLogradouro : Integer;
        { Storage for property CPF }
        FCPF : String;
        { Storage for property CSecao }
        FCSecao : TSecao;
        { Storage for property Celular }
        FCelular : String;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property Cota }
        FCota : Double;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataNascimento }
        FDataNascimento : Tdatetime;
        { Storage for property EApareceServicos }
        FEApareceServicos : TCheckBox;
        { Storage for property EApareceVendas }
        FEApareceVendas : TCheckBox;
        { Storage for property EApelido }
        FEApelido : TEdit;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property ECPF }
        FECPF : TMaskEdit;
        { Storage for property ECelular }
        FECelular : TMaskEdit;
        { Storage for property ECep }
        FECep : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TEdit;
        { Storage for property ECota }
        FECota : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataNascimento }
        FEDataNascimento : TMaskEdit;
        { Storage for property EEMail }
        FEEMail : TEdit;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property EFone }
        FEFone : TMaskEdit;
        { Storage for property EFoto }
        FEFoto : TImage;
        { Storage for property EFuncao }
        FEFuncao : TDBLookupComboBox;
        { Storage for property ELogradouro }
        FELogradouro : TDBLookupComboBox;
        { Storage for property EMail }
        FEMail : String;
        { Storage for property ENome }
        FENome : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EParceiro }
        FEParceiro : TEdit;
        { Storage for property EPerAbaixo }
        FEPerAbaixo : TEdit;
        { Storage for property EPerAcima }
        FEPerAcima : TEdit;
        { Storage for property ERG }
        FERG : TEdit;
        { Storage for property EReferencias }
        FEReferencias : TEdit;
        { Storage for property ESecao }
        FESecao : TDBLookupComboBox;
        { Storage for property ESituacao }
        FESituacao : tComboBox;
        { Storage for property ESuperior }
        FESuperior : TEdit;
        { Storage for property ETodosCentros }
        FETodosCentros : TCheckbox;
        { Storage for property EUF }
        FEUF : TComboBox;
        { Storage for property EUltEmp }
        FEUltEmp : TEdit;
        { Storage for property EUsuarioVinculado }
        FEUsuarioVinculado : TDBLookupComboBox;
        { Storage for property Endereco }
        FEndereco : String;
        { Storage for property Fone }
        FFone : String;
        { Storage for property Funcao }
        FFuncao : Integer;
        { Storage for property Logradouro }
        FLogradouro : Integer;
        { Storage for property NomeFun }
        FNomeFun : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Parceiro }
        FParceiro : Integer;
        { Storage for property PerAbaixo }
        FPerAbaixo : Double;
        { Storage for property PerAcima }
        FPerAcima : Double;
        { Storage for property RG }
        FRG : String;
        { Storage for property Referencias }
        FReferencias : String;
        { Storage for property Secao }
        FSecao : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Superior }
        FSuperior : Integer;
        { Storage for property TodosCentros }
        FTodosCentros : Boolean;
        { Storage for property Uf }
        FUf : String;
        { Storage for property UltEmp }
        FUltEmp : String;
        { Storage for property UsuarioVinculado }
        FUsuarioVinculado : Integer;

      { Private methods of TFuncionario }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ApareceServicos }
        function GetApareceServicos : Boolean;
        { Write method for property ApareceServicos }
        procedure SetApareceServicos(Value : Boolean);
        { Read method for property ApareceVendas }
        function GetApareceVendas : Boolean;
        { Write method for property ApareceVendas }
        procedure SetApareceVendas(Value : Boolean);
        { Read method for property Apelido }
        function GetApelido : String;
        { Write method for property Apelido }
        procedure SetApelido(Value : String);
        { Read method for property Bairro }
        function GetBairro : String;
        { Write method for property Bairro }
        procedure SetBairro(Value : String);
        { Read method for property CEP }
        function GetCEP : String;
        { Write method for property CEP }
        procedure SetCEP(Value : String);
        { Read method for property CPF }
        function GetCPF : String;
        { Write method for property CPF }
        procedure SetCPF(Value : String);
        { Read method for property Celular }
        function GetCelular : String;
        { Write method for property Celular }
        procedure SetCelular(Value : String);
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property Cota }
        function GetCota : Double;
        { Write method for property Cota }
        procedure SetCota(Value : Double);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DataNascimento }
        function GetDataNascimento : Tdatetime;
        { Write method for property DataNascimento }
        procedure SetDataNascimento(Value : Tdatetime);
        { Read method for property EMail }
        function GetEMail : String;
        { Write method for property EMail }
        procedure SetEMail(Value : String);
        { Read method for property Endereco }
        function GetEndereco : String;
        { Write method for property Endereco }
        procedure SetEndereco(Value : String);
        { Read method for property Fone }
        function GetFone : String;
        { Write method for property Fone }
        procedure SetFone(Value : String);
        { Read method for property Funcao }
        function GetFuncao : Integer;
        { Write method for property Funcao }
        procedure SetFuncao(Value : Integer);
        { Read method for property Logradouro }
        function GetLogradouro : Integer;
        { Write method for property Logradouro }
        procedure SetLogradouro(Value : Integer);
        { Read method for property NomeFun }
        function GetNomeFun : String;
        { Write method for property NomeFun }
        procedure SetNomeFun(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Parceiro }
        function GetParceiro : Integer;
        { Write method for property Parceiro }
        procedure SetParceiro(Value : Integer);
        { Read method for property PerAbaixo }
        function GetPerAbaixo : Double;
        { Write method for property PerAbaixo }
        procedure SetPerAbaixo(Value : Double);
        { Read method for property PerAcima }
        function GetPerAcima : Double;
        { Write method for property PerAcima }
        procedure SetPerAcima(Value : Double);
        { Read method for property RG }
        function GetRG : String;
        { Write method for property RG }
        procedure SetRG(Value : String);
        { Read method for property Referencias }
        function GetReferencias : String;
        { Write method for property Referencias }
        procedure SetReferencias(Value : String);
        { Read method for property Secao }
        function GetSecao : Integer;
        { Write method for property Secao }
        procedure SetSecao(Value : Integer);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Superior }
        function GetSuperior : Integer;
        { Write method for property Superior }
        procedure SetSuperior(Value : Integer);
        { Read method for property TodosCentros }
        function GetTodosCentros : Boolean;
        { Write method for property TodosCentros }
        procedure SetTodosCentros(Value : Boolean);
        { Read method for property Uf }
        function GetUf : String;
        { Write method for property Uf }
        procedure SetUf(Value : String);
        { Read method for property UltEmp }
        function GetUltEmp : String;
        { Write method for property UltEmp }
        procedure SetUltEmp(Value : String);
        { Read method for property UsuarioVinculado }
        function GetUsuarioVinculado : Integer;
        { Write method for property UsuarioVinculado }
        procedure SetUsuarioVinculado(Value : Integer);

    protected
      { Protected fields of TFuncionario }

      { Protected methods of TFuncionario }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TFuncionario }

      { Public methods of TFuncionario }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CDFUN:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Funcionário }
        function Inserir(CdCNC,CdFUN,PFuncao,PSit,PLogradouro,PSecao: integer; PCPF,PNome,PApelido,PEndereco,PRG,PBairro,PCidade,PUF,PCEP,PFone,PCelular,PRef,PUltEmp,PEMail,POBS:String; DATA_NASC:TDateTime; PCota,PPerAbaixo,PPerAcima:Double;PTodosCNC:Boolean):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCPF(PCPF:string; CdFUN, CdCNC:integer):Boolean;
        { Localiza um Funcionário }
        function LocalizarCod(CDFUN,CDCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TFuncionario }
        property ApareceServicos : Boolean
             read GetApareceServicos write SetApareceServicos;
        property ApareceVendas : Boolean
             read GetApareceVendas write SetApareceVendas;
        property Apelido : String read GetApelido write SetApelido;
        property Bairro : String read GetBairro write SetBairro;
        property CEP : String read GetCEP write SetCEP;
        property CFuncao : Integer read FCFuncao write FCFuncao;
        property CLogradouro : Integer read FCLogradouro write FCLogradouro;
        property CPF : String read GetCPF write SetCPF;
        property CSecao : TSecao read FCSecao write FCSecao;
        property Celular : String read GetCelular write SetCelular;
        property Cidade : String read GetCidade write SetCidade;
        { Código do Funcionário }
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property Cota : Double read GetCota write SetCota;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataNascimento : Tdatetime
             read GetDataNascimento write SetDataNascimento;
        property EApareceServicos : TCheckBox
             read FEApareceServicos write FEApareceServicos;
        property EApareceVendas : TCheckBox
             read FEApareceVendas write FEApareceVendas;
        property EApelido : TEdit read FEApelido write FEApelido;
        property EBairro : TEdit read FEBairro write FEBairro;
        property ECPF : TMaskEdit read FECPF write FECPF;
        property ECelular : TMaskEdit read FECelular write FECelular;
        property ECep : TMaskEdit read FECep write FECep;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoFUN : TEdit read FECodigoFUN write FECodigoFUN;
        property ECota : TEdit read FECota write FECota;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataNascimento : TMaskEdit
             read FEDataNascimento write FEDataNascimento;
        property EEMail : TEdit read FEEMail write FEEMail;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EFone : TMaskEdit read FEFone write FEFone;
        property EFoto : TImage read FEFoto write FEFoto;
        property EFuncao : TDBLookupComboBox read FEFuncao write FEFuncao;
        property ELogradouro : TDBLookupComboBox
             read FELogradouro write FELogradouro;
        property EMail : String read GetEMail write SetEMail;
        property ENome : TEdit read FENome write FENome;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EParceiro : TEdit read FEParceiro write FEParceiro;
        property EPerAbaixo : TEdit read FEPerAbaixo write FEPerAbaixo;
        property EPerAcima : TEdit read FEPerAcima write FEPerAcima;
        property ERG : TEdit read FERG write FERG;
        property EReferencias : TEdit read FEReferencias write FEReferencias;
        property ESecao : TDBLookupComboBox read FESecao write FESecao;
        property ESituacao : tComboBox read FESituacao write FESituacao;
        property ESuperior : TEdit read FESuperior write FESuperior;
        property ETodosCentros : TCheckbox
             read FETodosCentros write FETodosCentros;
        property EUF : TComboBox read FEUF write FEUF;
        property EUltEmp : TEdit read FEUltEmp write FEUltEmp;
        property EUsuarioVinculado : TDBLookupComboBox
             read FEUsuarioVinculado write FEUsuarioVinculado;
        property Endereco : String read GetEndereco write SetEndereco;
        property Fone : String read GetFone write SetFone;
        property Funcao : Integer read GetFuncao write SetFuncao;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property NomeFun : String read GetNomeFun write SetNomeFun;
        property OBS : String read GetOBS write SetOBS;
        property Parceiro : Integer read GetParceiro write SetParceiro;
        property PerAbaixo : Double read GetPerAbaixo write SetPerAbaixo;
        property PerAcima : Double read GetPerAcima write SetPerAcima;
        property RG : String read GetRG write SetRG;
        property Referencias : String read GetReferencias write SetReferencias;
        property Secao : Integer read GetSecao write SetSecao;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Superior : Integer read GetSuperior write SetSuperior;
        property TodosCentros : Boolean
             read GetTodosCentros write SetTodosCentros;
        property Uf : String read GetUf write SetUf;
        property UltEmp : String read GetUltEmp write SetUltEmp;
        property UsuarioVinculado : Integer
             read GetUsuarioVinculado write SetUsuarioVinculado;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TFuncionario with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TFuncionario]);
end;

{ Method to set variable and property values and create objects }
procedure TFuncionario.AutoInitialize;
begin
     FEApareceServicos := nil;
     FEApareceVendas := nil;
     FEApelido := nil;
     FEBairro := nil;
     FECPF := nil;
     FECelular := nil;
     FECep := nil;
     FECidade := nil;
     FECodigoCNC := nil;
     FECodigoFUN := nil;
     FECota := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataNascimento := nil;
     FEEMail := nil;
     FEEndereco := nil;
     FEFone := nil;
     FEFoto := nil;
     FEFuncao := nil;
     FELogradouro := nil;
     FENome := nil;
     FEOBS := nil;
     FEParceiro := nil;
     FEPerAbaixo := nil;
     FEPerAcima := nil;
     FERG := nil;
     FEReferencias := nil;
     FESecao := nil;
     FESituacao := nil;
     FESuperior := nil;
     FETodosCentros := nil;
     FEUF := nil;
     FEUltEmp := nil;
     FEUsuarioVinculado := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TFuncionario.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEApareceServicos then
        FEApareceServicos := nil;
     if AComponent = FEApareceVendas then
        FEApareceVendas := nil;
     if AComponent = FEApelido then
        FEApelido := nil;
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FECPF then
        FECPF := nil;
     if AComponent = FECelular then
        FECelular := nil;
     if AComponent = FECep then
        FECep := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECota then
        FECota := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataNascimento then
        FEDataNascimento := nil;
     if AComponent = FEEMail then
        FEEMail := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FEFone then
        FEFone := nil;
     if AComponent = FEFoto then
        FEFoto := nil;
     if AComponent = FEFuncao then
        FEFuncao := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FENome then
        FENome := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEParceiro then
        FEParceiro := nil;
     if AComponent = FEPerAbaixo then
        FEPerAbaixo := nil;
     if AComponent = FEPerAcima then
        FEPerAcima := nil;
     if AComponent = FERG then
        FERG := nil;
     if AComponent = FEReferencias then
        FEReferencias := nil;
     if AComponent = FESecao then
        FESecao := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FESuperior then
        FESuperior := nil;
     if AComponent = FETodosCentros then
        FETodosCentros := nil;
     if AComponent = FEUF then
        FEUF := nil;
     if AComponent = FEUltEmp then
        FEUltEmp := nil;
     if AComponent = FEUsuarioVinculado then
        FEUsuarioVinculado := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TFuncionario.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ApareceServicos }
function TFuncionario.GetApareceServicos : Boolean;
begin
 try
   result := (Self.fieldByName('FUN_APARECE_SERVICOS').asInteger=1);
 except
    try
      result := Self.fieldByName('FUN_APARECE_SERVICOS').asBoolean;
    except
      Result:=False;
    end;
 end;
end;

{ Write method for property ApareceServicos }
procedure TFuncionario.SetApareceServicos(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if value then
        Self.fieldByName('FUN_APARECE_SERVICOS').asInteger := 1
      else
        Self.fieldByName('FUN_APARECE_SERVICOS').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_APARECE_SERVICOS"!');
    end;
end;

{ Read method for property ApareceVendas }
function TFuncionario.GetApareceVendas : Boolean;
begin
 try
   result := (Self.fieldByName('FUN_APARECE_VENDAS').asInteger=1);
 except
    try
      result := Self.fieldByName('FUN_APARECE_VENDAS').asBoolean;
    except
      Result:=False;
    end;
 end;
end;

{ Write method for property ApareceVendas }
procedure TFuncionario.SetApareceVendas(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if value then
        Self.fieldByName('FUN_APARECE_VENDAS').asInteger := 1
      else
        Self.fieldByName('FUN_APARECE_VENDAS').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_APARECE_VENDAS"!');
    end;
end;

{ Read method for property Apelido }
function TFuncionario.GetApelido : String;
begin
  try
    Result := Self.fieldByName('FUN_APELIDO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Apelido }
procedure TFuncionario.SetApelido(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_APELIDO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_APELIDO"!');
  end;
end;

{ Read method for property Bairro }
function TFuncionario.GetBairro : String;
begin
  try
    Result := Self.fieldByName('FUN_BAIRRO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TFuncionario.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_BAIRRO"!');
  end;
end;

{ Read method for property CEP }
function TFuncionario.GetCEP : String;
begin
  try
    Result := Self.fieldByName('FUN_CEP').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TFuncionario.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_CEP"!');
  end;
end;

{ Read method for property CPF }
function TFuncionario.GetCPF : String;
begin
  try
    Result := Self.fieldByName('FUN_CPF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CPF }
procedure TFuncionario.SetCPF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_CPF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_CPF"!');
  end;
end;

{ Read method for property Celular }
function TFuncionario.GetCelular : String;
begin
  try
    Result := Self.fieldByName('FUN_CELULAR').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Celular }
procedure TFuncionario.SetCelular(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_CELULAR').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_CELULAR"!');
  end;
end;

{ Read method for property Cidade }
function TFuncionario.GetCidade : String;
begin
  try
    Result := Self.fieldByName('FUN_CIDADE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Cidade }
procedure TFuncionario.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_CIDADE"!');
  end;
end;

{ Read method for property CodigoFUN }
function TFuncionario.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TFuncionario.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property Cota }
function TFuncionario.GetCota : Double;
begin
  try
    Result := Self.fieldByName('FUN_COTA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota }
procedure TFuncionario.SetCota(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_COTA').asfloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_COTA"!');
  end;
end;

{ Read method for property DataAlterado }
function TFuncionario.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('FUN_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TFuncionario.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_DT_ALTERADO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TFuncionario.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('FUN_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TFuncionario.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_DT_CADASTRO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataNascimento }
function TFuncionario.GetDataNascimento : Tdatetime;
begin
  try
    Result := Self.fieldByName('FUN_DT_NASC').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataNascimento }
procedure TFuncionario.SetDataNascimento(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_DT_NASC').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_DT_NASC"!');
  end;
end;

{ Read method for property EMail }
function TFuncionario.GetEMail : String;
begin
  try
    Result := Self.fieldByName('FUN_EMAIL').asString;
  except
    result:= ''
  end;
end;

{ Write method for property EMail }
procedure TFuncionario.SetEMail(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_EMAIL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_EMAIL"!');
  end;
end;

{ Read method for property Endereco }
function TFuncionario.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('FUN_ENDERECO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TFuncionario.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_ENDERECO"!');
  end;
end;

{ Read method for property Fone }
function TFuncionario.GetFone : String;
begin
  try
    Result := Self.fieldByName('FUN_FONE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fone }
procedure TFuncionario.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_FONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_FONE"!');
  end;
end;

{ Read method for property Funcao }
function TFuncionario.GetFuncao : Integer;
begin
  try
    Result := Self.fieldByName('FUN_FUNCAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Funcao }
procedure TFuncionario.SetFuncao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_FUNCAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_FUNCAO"!');
    end;
end;

{ Read method for property Logradouro }
function TFuncionario.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('FUN_LOGRADOURO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Logradouro }
procedure TFuncionario.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_LOGRADOURO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_LOGRADOURO"!');
    end;
end;

{ Read method for property NomeFun }
function TFuncionario.GetNomeFun : String;
begin
  try
    Result := Self.fieldByName('FUN_NOME').asString;
  except
    result:= ''
  end;
end;

{ Write method for property NomeFun }
procedure TFuncionario.SetNomeFun(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_NOME').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_NOME"!');
  end;
end;

{ Read method for property OBS }
function TFuncionario.GetOBS : String;
begin
  try
    Result := Self.fieldByName('FUN_OBSERVACAO1').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TFuncionario.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_OBSERVACAO1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_OBSERVACAO1"!');
  end;
end;

{ Read method for property Parceiro }
function TFuncionario.GetParceiro : Integer;
begin
  try
    Result := Self.fieldByName('FUN_PARCEIRO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Parceiro }
procedure TFuncionario.SetParceiro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_PARCEIRO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_PARCEIRO"!');
    end;
end;

{ Read method for property PerAbaixo }
function TFuncionario.GetPerAbaixo : Double;
begin
  try
    Result := Self.fieldByName('FUN_PERC_ABAIXO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PerAbaixo }
procedure TFuncionario.SetPerAbaixo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_PERC_ABAIXO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_PERC_ABAIXO"!');
  end;
end;

{ Read method for property PerAcima }
function TFuncionario.GetPerAcima : Double;
begin
  try
    Result := Self.fieldByName('FUN_PERC_ACIMA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PerAcima }
procedure TFuncionario.SetPerAcima(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_PERC_ACIMA').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_PERC_ACIMA"!');
  end;
end;

{ Read method for property RG }
function TFuncionario.GetRG : String;
begin
  try
    Result := Self.fieldByName('FUN_RG').asString;
  except
    result:= ''
  end;
end;

{ Write method for property RG }
procedure TFuncionario.SetRG(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_RG').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_RG"!');
  end;
end;

{ Read method for property Referencias }
function TFuncionario.GetReferencias : String;
begin
  try
    Result := Self.fieldByName('FUN_REFERENCIA').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Referencias }
procedure TFuncionario.SetReferencias(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_REFERENCIA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_REFERENCIA"!');
  end;
end;

{ Read method for property Secao }
function TFuncionario.GetSecao : Integer;
begin
  try
    Result := Self.fieldByName('SEC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Secao }
procedure TFuncionario.SetSecao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SEC_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SEC_CODIGO"!');
  end;
end;

{ Read method for property Situacao }
function TFuncionario.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('FUN_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TFuncionario.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_SITUACAO"!');
  end;
end;

{ Read method for property Superior }
function TFuncionario.GetSuperior : Integer;
begin
  try
    Result := Self.fieldByName('FUN_SUPERIOR').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Superior }
procedure TFuncionario.SetSuperior(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_SUPERIOR').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_SUPERIOR"!');
    end;
end;

{ Read method for property TodosCentros }
function TFuncionario.GetTodosCentros : Boolean;
begin
 try
   result := (Self.fieldByName('FUN_TODOS_CENTROS').asInteger=1);
 except
    try
      result := Self.fieldByName('FUN_TODOS_CENTROS').asBoolean;
    except
      Result:=False;
    end;
 end;
end;

{ Write method for property TodosCentros }
procedure TFuncionario.SetTodosCentros(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if value then
        Self.fieldByName('FUN_TODOS_CENTROS').asInteger := 1
      else
        Self.fieldByName('FUN_TODOS_CENTROS').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_TODOS_CENTROS"!');
    end;
end;

{ Read method for property Uf }
function TFuncionario.GetUf : String;
begin
  try
    Result := Self.fieldByName('FUN_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Uf }
procedure TFuncionario.SetUf(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_UF"!');
  end;
end;

{ Read method for property UltEmp }
function TFuncionario.GetUltEmp : String;
begin
  try
    Result := Self.fieldByName('FUN_ULT_EMPR').asString;
  except
    result:= ''
  end;
end;

{ Write method for property UltEmp }
procedure TFuncionario.SetUltEmp(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_ULT_EMPR').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_ULT_EMPR"!');
  end;
end;

{ Read method for property UsuarioVinculado }
function TFuncionario.GetUsuarioVinculado : Integer;
begin
  try
    Result := Self.fieldByName('FUN_USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property UsuarioVinculado }
procedure TFuncionario.SetUsuarioVinculado(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_USU_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_USU_CODIGO"!');
  end;
end;

function TFuncionario.AlterarAuto:Boolean;
var
  CdCNC, CdFUN: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdFUN := CodigoFUN;
  sDetalhe := '';
  if LocalizarCPF(ECPF.Text,CodigoFUN,CodigoCNC) then
  Begin
    ShowMessage('CPF já cadastrado!');
    Exit;
  end;
  try
    edit;
    try
      CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
       NomeFun := ENome.Text;
       sDetalhe := sDetalhe + ' Nome:'+ENome.Text;
    except
    end;
    try
       Apelido := EApelido.Text;
       sDetalhe := sDetalhe + ' Apelido:'+EApelido.Text;
    except
    end;
    try
      UsuarioVinculado   := EUsuarioVinculado.KeyValue;
      sDetalhe := sDetalhe + ' UsuVinc:'+IntToStr(EUsuarioVinculado.KeyValue);
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      DataNascimento := StrToDateTime(EDataNascimento.Text);
      sDetalhe := sDetalhe + ' DtNasc:'+EDataNascimento.Text;
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
       Celular := ECelular.Text;
    except
    end;
    try
       Funcao := EFUNCAO.KeyValue;
       sDetalhe := sDetalhe + ' Funcao:'+IntToStr(EFUNCAO.KeyValue);
    except
    end;
    try
       RG := ERG.Text;
    except
    end;
    try
       CPF := ECPF.Text;
    except
    end;
    try
       Secao := Esecao.KeyValue;
    except
    end;
    try
      Cota := strtofloat(ECota.Text);
      sDetalhe := sDetalhe + ' Cota:'+ECota.Text;
    except
    end;
    try
      UltEmp := EUltEmp.Text;
    except
    end;
    try
      PerAbaixo := strtofloat(EPerAbaixo.Text);
      sDetalhe := sDetalhe + ' PercSimples:'+EPerAbaixo.Text;
    except
    end;
    try
      PerAcima := strtofloat(EPerAcima.Text);
      sDetalhe := sDetalhe + ' PercEsp:'+EPerAcima.Text;
    except
    end;
    try
      Referencias := EReferencias.Text;
    except
    end;
    try
      EMail := EEMail.Text;
    except
    end;
    try
      if VerificaInteiroBranco(ESuperior.Text) then
        Superior := StrToInt(ESuperior.Text)
      else
        Superior := 0;
    except
    end;
    try
      if VerificaInteiroBranco(EParceiro.Text) then
        Parceiro := StrToInt(EParceiro.Text)
      else
        Parceiro := 0;
    except
    end;
    try
      TodosCentros := ETodosCentros.Checked;
      if ETodosCentros.Checked then
        sDetalhe := sDetalhe + ' TodosCNC:1'
      else
        sDetalhe := sDetalhe + ' TodosCNC:0'
    except
    end;
    try
      ApareceServicos := EApareceServicos.Checked;
      if EApareceServicos.Checked then
        sDetalhe := sDetalhe + ' ApareceSER:1'
      else
        sDetalhe := sDetalhe + ' ApareceSER:0'
    except
    end;
    try
      ApareceVendas := EApareceVendas.Checked;
      if EApareceVendas.Checked then
        sDetalhe := sDetalhe + ' AparecePDV:1'
      else
        sDetalhe := sDetalhe + ' AparecePDV:0'
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
      GeraLog(200, CdCNC, CdFUN, sDetalhe);
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TFuncionario.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    ECodigoCNC.Enabled        :=not Habilitar;
  except
  end;
  Try
    EUsuarioVinculado.Enabled :=Habilitar;
  except
  end;
  Try
    EDataNascimento.Enabled   :=Habilitar;
  except
  end;
  try
    ENome.Enabled             :=Habilitar;
  except
  end;
  try
    EApelido.Enabled           :=Habilitar;
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
    EFONE.Enabled             :=Habilitar;
  except
  end;
  try
    ECelular.Enabled             :=Habilitar;
  except
  end;
  try
    EFUNCAO.Enabled           :=Habilitar;
  except
  end;
  try
    ERG.Enabled               :=Habilitar;
  except
  end;
  try
    ECPF.Enabled              :=Habilitar;
  except
  end;
  try
    ECota.Enabled             :=Habilitar;
  except
  end;
  try
    EPerAcima.Enabled         :=Habilitar;
  except
  end;
  try
    EPerAbaixo.Enabled        :=Habilitar;
  except
  end;
  try
    EReferencias.Enabled      :=Habilitar;
  except
  end;
  try
    EUltEmp.Enabled           :=Habilitar;
  except
  end;
  try
    EEMail.Enabled           :=Habilitar;
  except
  end;
  try
    ESuperior.Enabled        :=Habilitar;
  except
  end;
  try
    EParceiro.Enabled        :=Habilitar;
  except
  end;
  try
    ETodosCentros.Enabled    :=Habilitar;
  except
  end;
  try
    EApareceServicos.Enabled    :=Habilitar;
  except
  end;
  try
    EApareceVendas.Enabled    :=Habilitar;
  except
  end;
  try
    ESITUACAO.Enabled        :=Habilitar;
  except
  end;
  try
    EOBS.Enabled             :=Habilitar;
  except
  end;
end;


procedure TFuncionario.CancelaEdicao;
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

procedure TFuncionario.CarregaDados;
var
  Foto:string;
begin
  Try
    ECodigoFUN.Text           :=IntToStr(CodigoFun);
  except
  end;
  try
    EUsuarioVinculado.KeyValue   := UsuarioVinculado;
  except
  end;
  try
    if DataCadastro <= 0 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text            :=FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro);
  except
  end;
  try
    if DataAlterado <= 0 then
      EDataAlterado.Clear
    else
      EDataAlterado.Text            :=FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado);
  except
  end;
  try
    if DataNascimento=0 then
      EDataNascimento.Text:=''
    else
      EDataNascimento.Text            :=FormatDateTime('dd/mm/yyyy', DataNascimento);
  except
  end;
  try
    ENome.Text                :=NomeFun;
  except
  end;
  try
    EApelido.Text                :=Apelido;
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
    ECEP.text                 :=CEP;
  except
  end;
  try
    EFONE.Text                :=Fone;
  except
  end;
  try
    ECelular.Text                :=Celular;
  except
  end;
  try
    EFUNCAO.KeyValue          :=Funcao;
  except
  end;
  try
    ERG.Text                  :=RG;
  except
  end;
  try
    ECPF.Text                 :=CPF;
  except
  end;
  try
    ESecao.KeyValue           :=Secao;
  except
  end;
  try
    EReferencias.Text         :=Referencias;
  except
  end;
  try
    EUltEmp.Text              :=UltEmp;
  except
  end;
  try
    ECota.Text                :=Format('%.2f', [Cota]);
  except
  end;
  try
    EPerAcima.Text            :=Format('%.2f', [PerAcima]);
  except
  end;
  try
    EperAbaixo.Text           :=Format('%.2f', [PerAbaixo]);
  except
  end;
  try
    EEMail.Text               := EMail;
  except
  end;
  try
    ESuperior.Text            := IntToStr(Superior);
  except
  end;
  try
    EParceiro.Text            := IntToStr(Parceiro);
  except
  end;
  try
    ETodosCentros.Checked     := TodosCentros;
  except
  end;
  try
    EApareceServicos.Checked     := ApareceServicos;
  except
  end;
  try
    EApareceVendas.Checked     := ApareceVendas;
  except
  end;
  try
    ESITUACAO.itemindex       := Situacao;
  except
  end;
  try
    EOBS.Text                 := Obs;
  except
  end;
  try
    if CConfiguracao.CodigoCNC < 10 then
      foto:=CConfiguracao.PastaImagens+'\Funcionario\0'+IntToStr(CConfiguracao.CodigoCNC)+
         '-'+IntToStr(CodigoFUN)+'.JPG'
    else
      foto:=CConfiguracao.PastaImagens+'\Funcionario\'+IntToStr(CConfiguracao.CodigoCNC)+
         '-'+IntToStr(CodigoFUN)+'.JPG';
    Efoto.Picture.LoadFromFile(foto);
  Except
    try
      EFoto.Picture:=nil;
    except
    end;
  end;
end;

constructor TFuncionario.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'FUNCIONARIO';

     { Code to perform other tasks when the component is created }

end;

function TFuncionario.Deletar(CdCNC,CDFUN:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdFUN,CdCNC)) Then
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

destructor TFuncionario.Destroy;
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

function TFuncionario.FinalizaEdicao:Boolean;
var
  cdfun, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if ENome.Text = '' then
    mensagem:=mensagem+'Nome do Funcionário Incorreto!'+#13;
  if EApelido.Text = '' then
    mensagem:=mensagem+'Apelido do Funcionário Incorreto!'+#13;
  if not (EFuncao.KeyValue > 0) then
    mensagem:=mensagem+'Função Incorreta!'+#13;
  If not Verificadata(EDataNascimento.text) Then
    mensagem:=mensagem+'Data de nascimento incorreta!'+#13;
  if not (EUsuarioVinculado.KeyValue > 0) then
    mensagem:=mensagem+'Usuário Vinculado Incorreto!'+#13;
  if not verificachar(ERG.text) then
    mensagem:= mensagem + 'Número da Identidade incorreto!';
  If not Verificafloat(ECota.text) Then
    mensagem:=mensagem+'Cota digitada incorretamente!'+#13;
  If not Verificafloat(EPerAbaixo.text) Then
    mensagem:=mensagem+'Percentual Abaixo digitado incorretamente!'+#13;
  If not Verificafloat(EPerAcima.text) Then
    mensagem:=mensagem+'Percentual Acima digitado incorretamente!';
  If mensagem <>'' Then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
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
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cdfun:=codigoFUN;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cdfun, cdcnc);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Funcionário }
function TFuncionario.Inserir(CdCNC,CdFUN,PFuncao,PSit,PLogradouro,PSecao: integer; PCPF,PNome,PApelido,PEndereco,PRG,PBairro,PCidade,PUF,PCEP,PFone,PCelular,PRef,PUltEmp,PEMail,POBS:String; DATA_NASC:TDateTime; PCota,PPerAbaixo,PPerAcima:Double;PTodosCNC:Boolean):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdFUN=0 then
    Cod    := ProximoCodigo('FUN_CODIGO')
  Else
    Cod    := CdFUN;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    Insert;
    try
      CodigoFUN      := Cod;
      CodigoCNC      := CdCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      CNCOrigem      := CentroDeCusto;
      DataCadastro   := CConfiguracao.DataHora;
      DataNascimento := DATA_NASC;
      NomeFun        := PNome;
      Apelido        := PApelido;
      Logradouro     := PLogradouro;
      Endereco       := PEndereco;
      Bairro         := PBairro;
      Cidade         := PCidade;
      Uf             := PUF;
      CEP            := PCEP;
      Fone           := PFone;
      Celular        := PCelular;
      Funcao         := PFuncao;
      RG             := PRG;
      CPF            := PCPF;
      Secao          := PSecao;
      PerAbaixo      := PPerAbaixo;
      PerAcima       := PPerAcima;
      Cota           := PCota;
      UltEmp         := PUltEmp;
      Referencias    := PRef;
      EMail          := PEMail;
      Superior       := 0;
      Parceiro       := 0;
      TodosCentros   := PTodosCNC;
      ApareceServicos:= False;
      ApareceVendas  := False;
      Situacao       := PSit;
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

function TFuncionario.InserirAuto:Boolean;
var
  CdCNC, CdFUN: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := ECodigoCNC.KeyValue;
  CdFUN := sCodigo;
  sDetalhe := '';

  if not VerificaFloatBranco(ECota.Text) then
    ECota.Text := '0,00';
  if not VerificaFloatBranco(EPerAcima.Text) then
    EPerAcima.Text := '0,00';
  if not VerificaFloatBranco(EPerAbaixo.Text) then
    EPerAbaixo.Text := '0,00';

  if LocalizarCPF(ECPF.Text,SCodigo,CConfiguracao.CodigoCNC) then
  Begin
    ShowMessage('CPF já cadastrado!');
    Exit;
  end;
  try
    append;
    try
      CodigoFUN   := SCodigo;
    except
    end;
    try
      CNCOrigem   := CentroDeCusto;
    except
    end;
    try
      CodigoCNC   := ECodigoCNC.KeyValue;
    except
    end;
    try
      CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
       NomeFun := ENome.Text;
       sDetalhe := sDetalhe + 'Nome:'+ENome.Text;
    except
    end;
    try
       Apelido := EApelido.Text;
       sDetalhe := sDetalhe + ' Apelido:'+EApelido.Text;
    except
    end;
    try
      UsuarioVinculado   := EUsuarioVinculado.KeyValue;
      sDetalhe := sDetalhe + ' UsuVinc:'+IntToStr(EUsuarioVinculado.KeyValue);
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      DataNascimento := StrToDate(EDataNascimento.Text);
      sDetalhe := sDetalhe + ' DtNasc:'+EDataNascimento.Text;
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
       UF := EUF.Text;
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
       Celular := ECelular.Text;
    except
    end;
    try
      Funcao := EFuncao.KeyValue;
      sDetalhe := sDetalhe + ' Funcao:'+IntToStr(EFuncao.KeyValue);
    except
    end;
    try
       RG := ERG.Text;
    except
    end;
    try
       CPF := ECPF.Text;
    except
    end;
    try
       Secao := Esecao.KeyValue;
    except
    end;
    try
      Cota := strtofloat(ECota.Text);
      sDetalhe := sDetalhe + ' Cota:'+ECota.Text;
    except
    end;
    try
      UltEmp := EUltEmp.Text;
    except
    end;
    try
      sDetalhe := sDetalhe + ' PercEsp:'+EPerAcima.Text;
      PerAcima := StrToFloat(EPerAcima.Text);
    except
    end;
    try
      sDetalhe := sDetalhe + ' PercSimples:'+EPerAbaixo.Text;
      PerAbaixo := StrToFloat(EPerAbaixo.Text);
    except
    end;
    try
      Referencias := EReferencias.Text;
    except
    end;
    try
      EMail := EEMail.Text;
    except
    end;
    try
      if VerificaInteiroBranco(ESuperior.Text) then
        Superior := StrToInt(ESuperior.Text)
      else
        Superior := 0;
    except
    end;
    try
      if VerificaInteiroBranco(EParceiro.Text) then
        Parceiro := StrToInt(EParceiro.Text)
      else
        Parceiro := 0;
    except
    end;
    try
      TodosCentros := ETodosCentros.Checked;
      if ETodosCentros.Checked then
        sDetalhe := sDetalhe + ' TodosCNC:1'
      else
        sDetalhe := sDetalhe + ' TodosCNC:0';
    except
    end;
    try
      ApareceServicos := EApareceServicos.Checked;
      if EApareceServicos.Checked then
        sDetalhe := sDetalhe + ' ApareceSER:1'
      else
        sDetalhe := sDetalhe + ' ApareceSER:0';
    except
    end;
    try
      ApareceVendas := EApareceVendas.Checked;
      if EApareceVendas.Checked then
        sDetalhe := sDetalhe + ' AparecePDV:1'
      else
        sDetalhe := sDetalhe + ' AparecePDV:0';
    except
    end;
    try
       Situacao := ESITUACAO.Itemindex;
       if ESITUACAO.Itemindex = 0 then
         sDetalhe := sDetalhe + ' Ativado'
       else
         sDetalhe := sDetalhe + ' Ativado';
    except
    end;
    try
       Obs := EOBS.Text;
       sDetalhe := sDetalhe + ' OBS:'+EOBS.Text;
    except
    end;
    try
      Post;
      GeraLog(180, CdCNC, CdFUN, sDetalhe);
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TFuncionario.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoFUN.Clear
  except
  end;
  Try
    if Estado <> 1 then
      EFuncao.KeyValue := -1
    else
      EFuncao.KeyValue := 58; //Vendedor Interno
  except
  end;
  Try
    if Estado <> 1 then
      EUsuarioVinculado.KeyValue := -1
    else
      EUsuarioVinculado.KeyValue := CConfiguracao.CodigoUSU;
  except
  end;
  Try
    ESecao.KeyValue := 0;
  except
  end;
  Try
    ELogradouro.KeyValue := 0;
  except
  end;
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
    EDataNascimento.Clear;
  except
  end;
  try
    ENome.Clear;
  except
  end;
  try
    EApelido.Clear;
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
    ECelular.Clear;
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
    ERG.Clear;
  except
  end;
  try
    ECPF.Clear;
  except
  end;
  try
    ECota.Clear;
    except
  end;
  try
    EPerAcima.Clear;
    except
  end;
  try
    EPerAbaixo.Clear;
    except
  end;
  try
    EReferencias.Clear;
    except
  end;
  try
    EUltEmp.Clear;
    except
  end;
  try
    EEMail.Clear;
  except
  end;
  try
    ESuperior.Clear;
  except
  end;
  try
    EParceiro.Clear;
  except
  end;
  try
    ETodosCentros.Checked := False
  except
  end;
  try
    if Estado <> 1 then      
      EApareceServicos.Checked := False
    else
      EApareceServicos.Checked := True;    
  except
  end;
  try
    if Estado <> 1 then        
      EApareceVendas.Checked := False
    else
      EApareceVendas.Checked := True;    
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

function TFuncionario.LocalizarCPF(PCPF:string; CdFUN, CdCNC:integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  if (PCPF <> '') and (PCPF <> '   -   -   -  ') then
  Begin
    with CConfiguracao.QueryComandos do
    begin
      close;
      sql.Text:='SELECT * FROM FUNCIONARIO WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND FUN_CPF = "'+PCPF+'" AND FUN_CODIGO <> '+IntToStr(CdFUN);
      open;
      Result:=(not IsEmpty);
    end;
  end
  else
    Result:=False;
end;

{ Localiza um Funcionário }
function TFuncionario.LocalizarCod(CDFUN,CDCNC:Integer):Boolean;
begin
  If (CDFUN<>CodigoFun) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;FUN_CODIGO', vararrayof([CDCNC, CDFUN]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TFuncionario.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>NomeFun Then
    If locate('FUN_NOME',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TFuncionario.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TFuncionario.PreparaInsercao;
begin
  ProximoCodigo('FUN_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TFuncionario.deletarauto:Boolean;
var
  CdCNC,CdFUN: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdFUN := CodigoFUN;
  sDetalhe := 'Nome:'+NomeFUN+
              ' Apelido:'+Apelido;
  try
    if Delete then
    Begin
      result:=true;
      GeraLog(190,CdCNC,CdFUN,sDetalhe);
      if isEmpty then
        LimpaCampos
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
