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
unit Vendedor;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Secao, Dbgrids, Funcoes, Extctrls, 
     Variants;

type
  TVendedor = class(TSQuery)
    private
      { Private fields of TVendedor }
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
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoSEC }
        FCodigoSEC : Integer;
        { Storage for property Cota }
        FCota : Double;
        { Storage for property EApelido }
        FEApelido : TEdit;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property ECPF }
        FECPF : TMaskEdit;
        { Storage for property ECep }
        FECep : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TEdit;
        { Storage for property ECodigoSEC }
        FECodigoSEC : TDBLookupComboBox;
        { Storage for property ECota }
        FECota : TEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
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
        { Storage for property ENome }
        FENome : TEdit;
        { Storage for property EPerAbaixo }
        FEPerAbaixo : TEdit;
        { Storage for property EPerAcima }
        FEPerAcima : TEdit;
        { Storage for property EReferencias }
        FEReferencias : TEdit;
        { Storage for property ERota }
        FERota : TDBLookupComboBox;
        { Storage for property EUF }
        FEUF : TComboBox;
        { Storage for property EUltEmp }
        FEUltEmp : TEdit;
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
        { Storage for property PerAbaixo }
        FPerAbaixo : Double;
        { Storage for property PerAcima }
        FPerAcima : Double;
        { Storage for property Referencias }
        FReferencias : String;
        { Storage for property Rota }
        FRota : Integer;
        { Storage for property Uf }
        FUf : String;
        { Storage for property UltEmp }
        FUltEmp : String;

      { Private methods of TVendedor }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
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
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoSEC }
        function GetCodigoSEC : Integer;
        { Write method for property CodigoSEC }
        procedure SetCodigoSEC(Value : Integer);
        { Read method for property Cota }
        function GetCota : Double;
        { Write method for property Cota }
        procedure SetCota(Value : Double);
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
        { Read method for property PerAbaixo }
        function GetPerAbaixo : Double;
        { Write method for property PerAbaixo }
        procedure SetPerAbaixo(Value : Double);
        { Read method for property PerAcima }
        function GetPerAcima : Double;
        { Write method for property PerAcima }
        procedure SetPerAcima(Value : Double);
        { Read method for property Referencias }
        function GetReferencias : String;
        { Write method for property Referencias }
        procedure SetReferencias(Value : String);
        { Read method for property Rota }
        function GetRota : Integer;
        { Write method for property Rota }
        procedure SetRota(Value : Integer);
        { Read method for property Uf }
        function GetUf : String;
        { Write method for property Uf }
        procedure SetUf(Value : String);
        { Read method for property UltEmp }
        function GetUltEmp : String;
        { Write method for property UltEmp }
        procedure SetUltEmp(Value : String);

    protected
      { Protected fields of TVendedor }

      { Protected methods of TVendedor }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TVendedor }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TVendedor }
        { Altera um Funcionário }
        function Alterar(CdCNC,CdFUN,CdSEC,PLogradouro,PFuncao,PRota: integer; PCota:Double;PUltEmp,PReferencias,PCPF,PNome,PEndereco,PBairro,PCidade,PUF,PCEP,PFone:String;PPerAbaixo,PPerAcima:Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CDFUN:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Funcionário }
        function Inserir(CdCNC,CdFUN,CdSEC,PLogradouro,PFuncao,PRota: integer; PCota:Double;PUltEmp,PReferencias,PCPF,PNome,PEndereco,PBairro,PCidade,PUF,PCEP,PFone:String;PPerAbaixo,PPerAcima:Double):boolean;
        function InserirAuto:Boolean;
        { Localiza um Funcionário }
        function LocalizarCod(CDFUN,CDCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TVendedor }
        property Apelido : String read GetApelido write SetApelido;
        property Bairro : String read GetBairro write SetBairro;
        property CEP : String read GetCEP write SetCEP;
        property CFuncao : Integer read FCFuncao write FCFuncao;
        property CLogradouro : Integer read FCLogradouro write FCLogradouro;
        property CPF : String read GetCPF write SetCPF;
        property CSecao : TSecao read FCSecao write FCSecao;
        property Cidade : String read GetCidade write SetCidade;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Funcionário }
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property CodigoSEC : Integer read GetCodigoSEC write SetCodigoSEC;
        property Cota : Double read GetCota write SetCota;
        property EApelido : TEdit read FEApelido write FEApelido;
        property EBairro : TEdit read FEBairro write FEBairro;
        property ECPF : TMaskEdit read FECPF write FECPF;
        property ECep : TMaskEdit read FECep write FECep;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoFUN : TEdit read FECodigoFUN write FECodigoFUN;
        property ECodigoSEC : TDBLookupComboBox
             read FECodigoSEC write FECodigoSEC;
        property ECota : TEdit read FECota write FECota;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EFone : TMaskEdit read FEFone write FEFone;
        property EFoto : TImage read FEFoto write FEFoto;
        property EFuncao : TDBLookupComboBox read FEFuncao write FEFuncao;
        property ELogradouro : TDBLookupComboBox
             read FELogradouro write FELogradouro;
        property ENome : TEdit read FENome write FENome;
        property EPerAbaixo : TEdit read FEPerAbaixo write FEPerAbaixo;
        property EPerAcima : TEdit read FEPerAcima write FEPerAcima;
        property EReferencias : TEdit read FEReferencias write FEReferencias;
        property ERota : TDBLookupComboBox read FERota write FERota;
        property EUF : TComboBox read FEUF write FEUF;
        property EUltEmp : TEdit read FEUltEmp write FEUltEmp;
        property Endereco : String read GetEndereco write SetEndereco;
        property Fone : String read GetFone write SetFone;
        property Funcao : Integer read GetFuncao write SetFuncao;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property NomeFun : String read GetNomeFun write SetNomeFun;
        property PerAbaixo : Double read GetPerAbaixo write SetPerAbaixo;
        property PerAcima : Double read GetPerAcima write SetPerAcima;
        property Referencias : String read GetReferencias write SetReferencias;
        property Rota : Integer read GetRota write SetRota;
        property Uf : String read GetUf write SetUf;
        property UltEmp : String read GetUltEmp write SetUltEmp;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TVendedor with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TVendedor]);
end;

{ Method to set variable and property values and create objects }
procedure TVendedor.AutoInitialize;
begin
     Estado := 0;
     FEApelido := nil;
     FEBairro := nil;
     FECPF := nil;
     FECep := nil;
     FECidade := nil;
     FECodigoCNC := nil;
     FECodigoFUN := nil;
     FECodigoSEC := nil;
     FECota := nil;
     FEDbgrid := nil;
     FEEndereco := nil;
     FEFone := nil;
     FEFoto := nil;
     FEFuncao := nil;
     FELogradouro := nil;
     FENome := nil;
     FEPerAbaixo := nil;
     FEPerAcima := nil;
     FEReferencias := nil;
     FERota := nil;
     FEUF := nil;
     FEUltEmp := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TVendedor.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEApelido then
        FEApelido := nil;
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FECPF then
        FECPF := nil;
     if AComponent = FECep then
        FECep := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoSEC then
        FECodigoSEC := nil;
     if AComponent = FECota then
        FECota := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
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
     if AComponent = FEPerAbaixo then
        FEPerAbaixo := nil;
     if AComponent = FEPerAcima then
        FEPerAcima := nil;
     if AComponent = FEReferencias then
        FEReferencias := nil;
     if AComponent = FERota then
        FERota := nil;
     if AComponent = FEUF then
        FEUF := nil;
     if AComponent = FEUltEmp then
        FEUltEmp := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TVendedor.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Apelido }
function TVendedor.GetApelido : String;
begin
  try
    Result := Self.fieldByName('FUN_APELIDO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Apelido }
procedure TVendedor.SetApelido(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_APELIDO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_APELIDO"!');
  end;
end;

{ Read method for property Bairro }
function TVendedor.GetBairro : String;
begin
  try
    Result := Self.fieldByName('FUN_BAIRRO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TVendedor.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_BAIRRO"!');
  end;
end;

{ Read method for property CEP }
function TVendedor.GetCEP : String;
begin
  try
    Result := Self.fieldByName('FUN_CEP').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TVendedor.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_CEP"!');
  end;
end;

{ Read method for property CPF }
function TVendedor.GetCPF : String;
begin
  try
    Result := Self.fieldByName('FUN_CPF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CPF }
procedure TVendedor.SetCPF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_CPF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_CPF"!');
  end;
end;

{ Read method for property Cidade }
function TVendedor.GetCidade : String;
begin
  try
    Result := Self.fieldByName('FUN_CIDADE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Cidade }
procedure TVendedor.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_CIDADE"!');
  end;
end;

{ Read method for property CodigoCNC }
function TVendedor.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TVendedor.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TVendedor.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TVendedor.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoSEC }
function TVendedor.GetCodigoSEC : Integer;
begin
  try
    Result := Self.fieldByName('SEC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoSEC }
procedure TVendedor.SetCodigoSEC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SEC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SEC_CODIGO"!');
    end;
end;

{ Read method for property Cota }
function TVendedor.GetCota : Double;
begin
  try
    Result := Self.fieldByName('FUN_COTA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota }
procedure TVendedor.SetCota(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_COTA').asfloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_COTA"!');
  end;
end;

{ Read method for property Endereco }
function TVendedor.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('FUN_ENDERECO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TVendedor.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_ENDERECO"!');
  end;
end;

{ Read method for property Fone }
function TVendedor.GetFone : String;
begin
  try
    Result := Self.fieldByName('FUN_FONE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fone }
procedure TVendedor.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_FONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_FONE"!');
  end;
end;

{ Read method for property Funcao }
function TVendedor.GetFuncao : Integer;
begin
  try
    Result := Self.fieldByName('FUN_FUNCAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Funcao }
procedure TVendedor.SetFuncao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_FUNCAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_FUNCAO"!');
    end;
end;

{ Read method for property Logradouro }
function TVendedor.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('FUN_LOGRADOURO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Logradouro }
procedure TVendedor.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_LOGRADOURO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_LOGRADOURO"!');
    end;
end;

{ Read method for property NomeFun }
function TVendedor.GetNomeFun : String;
begin
  try
    Result := Self.fieldByName('FUN_NOME').asString;
  except
    result:= ''
  end;
end;

{ Write method for property NomeFun }
procedure TVendedor.SetNomeFun(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_NOME').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_NOME"!');
  end;
end;

{ Read method for property PerAbaixo }
function TVendedor.GetPerAbaixo : Double;
begin
  try
    Result := Self.fieldByName('FUN_PERC_ABAIXO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PerAbaixo }
procedure TVendedor.SetPerAbaixo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_PERC_ABAIXO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_PERC_ABAIXO"!');
  end;
end;

{ Read method for property PerAcima }
function TVendedor.GetPerAcima : Double;
begin
  try
    Result := Self.fieldByName('FUN_PERC_ACIMA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PerAcima }
procedure TVendedor.SetPerAcima(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_PERC_ACIMA').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_PERC_ACIMA"!');
  end;
end;

{ Read method for property Referencias }
function TVendedor.GetReferencias : String;
begin
  try
    Result := Self.fieldByName('FUN_REFERENCIA').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Referencias }
procedure TVendedor.SetReferencias(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_REFERENCIA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_REFERENCIA"!');
  end;
end;

{ Read method for property Rota }
function TVendedor.GetRota : Integer;
begin
  try
    Result := Self.fieldByName('FUN_ROTA').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Rota }
procedure TVendedor.SetRota(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_ROTA').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_ROTA"!');
  end;
end;

{ Read method for property Uf }
function TVendedor.GetUf : String;
begin
  try
    Result := Self.fieldByName('FUN_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Uf }
procedure TVendedor.SetUf(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_UF"!');
  end;
end;

{ Read method for property UltEmp }
function TVendedor.GetUltEmp : String;
begin
  try
    Result := Self.fieldByName('FUN_ULT_EMPR').asString;
  except
    result:= ''
  end;
end;

{ Write method for property UltEmp }
procedure TVendedor.SetUltEmp(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_ULT_EMPR').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_ULT_EMPR"!');
  end;
end;

{ Altera um Funcionário }
function TVendedor.Alterar(CdCNC,CdFUN,CdSEC,PLogradouro,PFuncao,PRota: integer; PCota:Double;PUltEmp,PReferencias,PCPF,PNome,PEndereco,PBairro,PCidade,PUF,PCEP,PFone:String;PPerAbaixo,PPerAcima:Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result:=true;
  If not(localizarCod(CdFUN,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoSEC      := CdSEC;
      NomeFun        := PNome;
      Logradouro     := PLogradouro;
      Endereco       := PEndereco;
      Bairro         := PBairro;
      Cidade         := PCidade;
      Uf             := PUF;
      CEP            := PCEP;
      Fone           := PFone;
      Funcao         := PFuncao;
      CPF            := PCPF;
      PerAbaixo      := PPerAbaixo;
      PerAcima       := PPerAcima;
      Rota           := PRota;
      Cota           := PCota;
      UltEmp         := PUltEmp;
      Referencias    := PReferencias;

      try
        Post;

      except
        result:=false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TVendedor.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    edit;
    try
       NomeFun := ENome.Text;
    except
    end;
    try
       Apelido := EApelido.Text;
    except
    end;
    try
       CodigoSEC := ECodigoSEC.KeyValue;
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
    except
    end;
    try
       Funcao := EFuncao.KeyValue;
    except
    end;
    try
       CPF := ECPF.Text;
    except
    end;
    try
      Rota  := ERota.KeyValue;
    except
    end;
    try
      Cota := strtofloat(ECota.Text);
    except
    end;
    try
      UltEmp := EUltEmp.Text;
    except
    end;
    try
      PerAcima := strtofloat(EPerAcima.Text);
    except
    end;
    try
      PerAbaixo := strtofloat(EPerAbaixo.Text);
    except
    end;
    try
      Referencias := EReferencias.Text;
    except
    end;

    try
      Post;
      Alterarauto:=True;

    except
      Alterarauto:=False;
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    Alterarauto:=false;
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TVendedor.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
Try
   EDbgrid.Enabled           :=not Habilitar;
 except
 end;
 try
   if Estado=1 then
     ECodigoCNC.Enabled      :=Habilitar;
 except
 end;
 try
   ENome.Enabled             :=Habilitar;
   except
 end;
 try
   EApelido.Enabled             :=Habilitar;
   except
 end;
 try
   ECodigoSEC.Enabled        :=Habilitar;
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
   ECEP.Enabled              :=Habilitar;
   except
 end;
 try
   EFONE.Enabled             :=Habilitar;
   except
 end;
 try
   EFUNCAO.Enabled           :=not Habilitar;
   except
 end;
 try
   ECPF.Enabled              :=Habilitar;
   except
 end;
 try
   ERota.Enabled             :=Habilitar;
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
end;

procedure TVendedor.CancelaEdicao;
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

procedure TVendedor.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
var
  foto:string;
begin
  try
    ECodigoFUN.Text           :=IntToStr(CodigoFun);
    except
  end;
  try
    ECodigoSEC.KeyValue       :=CodigoSEC;
    except
  end;
  try
    ECodigoCNC.KeyValue       :=CodigoCNC;
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
    ECPF.Text                 :=CPF;
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
    ERota.KeyValue            :=Rota;
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

constructor TVendedor.Create(AOwner: TComponent);
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

function TVendedor.Deletar(CdCNC,CDFUN:Integer):Boolean;
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
        begin
          try
            ECodigoFUN.Clear;
            except
          end;
          try
            EFuncao.KeyValue := 0;
            except
          end;
          try
            ECodigoSEC.KeyValue := 0;
            except
          end;
          try
            ELogradouro.KeyValue := 0;
            except
          end;
          try
            ERota.KeyValue := 0;
            except
          end;
          try
            ENome.Clear;
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
            ECEP.Clear;
            except
          end;
          try
            EFONE.Clear;
            except
          end;
          try
            EUf.ItemIndex := -1;
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
        end;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TVendedor.Destroy;
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

function TVendedor.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cdfun, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
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
    Exit;
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
        AtualizaControles(False);
        Estado:=0;
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

{ Insere um Funcionário }
function TVendedor.Inserir(CdCNC,CdFUN,CdSEC,PLogradouro,PFuncao,PRota: integer; PCota:Double;PUltEmp,PReferencias,PCPF,PNome,PEndereco,PBairro,PCidade,PUF,PCEP,PFone:String;PPerAbaixo,PPerAcima:Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod: Integer;
begin
  if CdFUN=0 then
    Cod    := ProximoCodigo('FUN_CODIGO')
  else
    Cod    := CdFUN;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
    result := true;
    Insert;
    try
      CodigoFUN      := Cod;
      CodigoCNC      := CdCNC;
      CodigoSEC      := CdSEC;
      NomeFun        := PNome;
      Logradouro     := PLogradouro;
      Endereco       := PEndereco;
      Bairro         := PBairro;
      Cidade         := PCidade;
      Uf             := PUF;
      CEP            := PCEP;
      Fone           := PFone;
      Funcao         := PFuncao;
      CPF            := PCPF;
      PerAbaixo      := PPerAbaixo;
      PerAcima       := PPerAcima;
      Rota           := PRota;
      Cota           := PCota;
      UltEmp         := PUltEmp;
      Referencias    := PReferencias;

      try
        Post;

      except
        result:=false;
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TVendedor.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      append;
      try
        CodigoFUN   := SCodigo;
      except
      end;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        CodigoSEC   := ECodigoSEC.KeyValue;
      except
      end;
      try
         NomeFun := ENome.Text;
      except
      end;
      try
         Apelido := EApelido.Text;
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
      except
      end;
      try
         Funcao := EFuncao.KeyValue;
      except
      end;
      try
         CPF := ECPF.Text;
      except
      end;
      try
        Rota  := ERota.KeyValue;
      except
      end;
      try
        Cota := strtofloat(ECota.Text);
      except
      end;
      try
        UltEmp := EUltEmp.Text;
      except
      end;
      try
        PerAcima := StrToFloat(EPerAcima.Text);
      except
      end;
      try
        PerAbaixo := StrToFloat(EPerAbaixo.Text);
      except
      end;
      try
        Referencias := EReferencias.Text;
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

{ Localiza um Funcionário }
function TVendedor.LocalizarCod(CDFUN,CDCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDFUN<>CodigoFun) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;FUN_CODIGO', vararrayof([CDCNC, CDFUN]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TVendedor.LocalizarNome(Nome:String):Boolean;
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

procedure TVendedor.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TVendedor.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
ProximoCodigo('FUN_CODIGO');
 try
   ECodigoSEC.KeyValue := 0;
   except
 end;
 try
   ELogradouro.KeyValue := 0;
   except
 end;
 try
   ERota.KeyValue := 0;
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
   ECidade.Clear;
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
   ItemComboBox(EUF,CConfiguracao.UF);
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
   ECodigoCNC.KeyValue := 0;
 except
 end;
  Estado:=1;
  AtualizaControles(True);
end;

function TVendedor.deletarauto:Boolean;
var
  CdCNC, CdFUN:integer;
begin
  Result := False;
  try
    CdCNC:=CodigoCNC;
    CdFUN:=CodigoFUN;
    if Delete then
    Begin
      GeraLog(70,CdCNC,CdFUN,'7');
      result := true;      
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
