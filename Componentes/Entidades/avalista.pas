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
unit Avalista;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TAvalista = class(TSQuery)
    private
      { Private fields of TAvalista }
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property CGCCPF }
        FCGCCPF : String;
        { Storage for property CGFRG }
        FCGFRG : String;
        { Storage for property Celular }
        FCelular : String;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodigoAVL }
        FCodigoAVL : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataNascimento }
        FDataNascimento : Tdatetime;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property ECGCCPF }
        FECGCCPF : TMaskEdit;
        { Storage for property ECGFRG }
        FECGFRG : TEdit;
        { Storage for property ECelular }
        FECelular : TMaskEdit;
        { Storage for property ECep }
        FECep : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoAVL }
        FECodigoAVL : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataNascimento }
        FEDataNascimento : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property EFax }
        FEFax : TMaskEdit;
        { Storage for property EFone }
        FEFone : TMaskEdit;
        { Storage for property ELogradouro }
        FELogradouro : TDBLookUpComboBox;
        { Storage for property ENome }
        FENome : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPessoaFisica }
        FEPessoaFisica : TCheckBox;
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
        { Storage for property Logradouro }
        FLogradouro : Integer;
        { Storage for property Nome }
        FNome : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property PessoaFisica }
        FPessoaFisica : Boolean;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Uf }
        FUf : String;

      { Private methods of TAvalista }
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
        { Read method for property CGCCPF }
        function GetCGCCPF : String;
        { Write method for property CGCCPF }
        procedure SetCGCCPF(Value : String);
        { Read method for property CGFRG }
        function GetCGFRG : String;
        { Write method for property CGFRG }
        procedure SetCGFRG(Value : String);
        { Read method for property Celular }
        function GetCelular : String;
        { Write method for property Celular }
        procedure SetCelular(Value : String);
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
        { Read method for property CodigoAVL }
        function GetCodigoAVL : Integer;
        { Write method for property CodigoAVL }
        procedure SetCodigoAVL(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
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
        { Read method for property Logradouro }
        function GetLogradouro : Integer;
        { Write method for property Logradouro }
        procedure SetLogradouro(Value : Integer);
        { Read method for property Nome }
        function GetNome : String;
        { Write method for property Nome }
        procedure SetNome(Value : String);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property PessoaFisica }
        function GetPessoaFisica : Boolean;
        { Write method for property PessoaFisica }
        procedure SetPessoaFisica(Value : Boolean);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Uf }
        function GetUf : String;
        { Write method for property Uf }
        procedure SetUf(Value : String);

    protected
      { Protected fields of TAvalista }

      { Protected methods of TAvalista }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TAvalista }

      { Public methods of TAvalista }
        { Altera um Cliente }
        function Alterar(CdCNC,CdAVL,PLOGRADOURO: integer; CdPesFisica:Boolean;PDATA_NASC,PNOME,PCGC_CPF,PCGF_RG,PENDERECO,PBAIRRO,PCIDADE,PUF,PCEP,PFONE:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CDAVL:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdAVL,PLOGRADOURO: integer;CdPesFisica:Boolean; PDATA_NASC,PNOME,PCGC_CPF,PCGF_RG,PENDERECO,PBAIRRO,PCIDADE,PUF,PCEP,PFONE:String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCNPJCPF(PCNPJCPF:String; CdAVL,CdCNC:Integer):Boolean;
        { Localiza um cliente }
        function LocalizarCod(CDAVL,CDCNC:Integer):Boolean;
        function LocalizarNome(PNome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TAvalista }
        property Bairro : String read GetBairro write SetBairro;
        property CEP : String read GetCEP write SetCEP;
        property CGCCPF : String read GetCGCCPF write SetCGCCPF;
        property CGFRG : String read GetCGFRG write SetCGFRG;
        property Celular : String read GetCelular write SetCelular;
        property Cidade : String read GetCidade write SetCidade;
        { Código do Cliente }
        property CodigoAVL : Integer read GetCodigoAVL write SetCodigoAVL;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataNascimento : Tdatetime
             read GetDataNascimento write SetDataNascimento;
        property EBairro : TEdit read FEBairro write FEBairro;
        property ECGCCPF : TMaskEdit read FECGCCPF write FECGCCPF;
        property ECGFRG : TEdit read FECGFRG write FECGFRG;
        property ECelular : TMaskEdit read FECelular write FECelular;
        property ECep : TMaskEdit read FECep write FECep;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoAVL : TEdit read FECodigoAVL write FECodigoAVL;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataNascimento : TMaskEdit
             read FEDataNascimento write FEDataNascimento;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EFax : TMaskEdit read FEFax write FEFax;
        property EFone : TMaskEdit read FEFone write FEFone;
        property ELogradouro : TDBLookUpComboBox
             read FELogradouro write FELogradouro;
        property ENome : TEdit read FENome write FENome;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPessoaFisica : TCheckBox
             read FEPessoaFisica write FEPessoaFisica;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EUF : TComboBox read FEUF write FEUF;
        property Endereco : String read GetEndereco write SetEndereco;
        property Fax : String read GetFax write SetFax;
        property Fone : String read GetFone write SetFone;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property Nome : String read GetNome write SetNome;
        property Observacao : String read GetObservacao write SetObservacao;
        property PessoaFisica : Boolean
             read GetPessoaFisica write SetPessoaFisica;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Uf : String read GetUf write SetUf;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TAvalista with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TAvalista]);
end;

{ Method to set variable and property values and create objects }
procedure TAvalista.AutoInitialize;
begin
     FEBairro := nil;
     FECGCCPF := nil;
     FECGFRG := nil;
     FECelular := nil;
     FECep := nil;
     FECidade := nil;
     FECodigoAVL := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataNascimento := nil;
     FEDbgrid := nil;
     FEEndereco := nil;
     FEFax := nil;
     FEFone := nil;
     FELogradouro := nil;
     FENome := nil;
     FEObservacao := nil;
     FEPessoaFisica := nil;
     FESituacao := nil;
     FEUF := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TAvalista.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FECGCCPF then
        FECGCCPF := nil;
     if AComponent = FECGFRG then
        FECGFRG := nil;
     if AComponent = FECelular then
        FECelular := nil;
     if AComponent = FECep then
        FECep := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoAVL then
        FECodigoAVL := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataNascimento then
        FEDataNascimento := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FEFax then
        FEFax := nil;
     if AComponent = FEFone then
        FEFone := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FENome then
        FENome := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPessoaFisica then
        FEPessoaFisica := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FEUF then
        FEUF := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TAvalista.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bairro }
function TAvalista.GetBairro : String;
begin
  try
    Result := Self.fieldByName('AVL_BAIRRO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TAvalista.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_BAIRRO"!');
  end;
end;

{ Read method for property CEP }
function TAvalista.GetCEP : String;
begin
  try
    Result := Self.fieldByName('AVL_CEP').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TAvalista.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_CEP"!');
  end;
end;

{ Read method for property CGCCPF }
function TAvalista.GetCGCCPF : String;
begin
  try
    Result := Self.fieldByName('AVL_CGC_CPF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CGCCPF }
procedure TAvalista.SetCGCCPF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_CGC_CPF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_CGC_CPF"!');
  end;
end;

{ Read method for property CGFRG }
function TAvalista.GetCGFRG : String;
begin
  try
    Result := Self.fieldByName('AVL_CGF_RG').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CGFRG }
procedure TAvalista.SetCGFRG(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AVL_CGF_RG').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AVL_CGF_RG"!');
    end;
end;

{ Read method for property Celular }
function TAvalista.GetCelular : String;
begin
  try
    Result := Self.fieldByName('AVL_CELULAR').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Celular }
procedure TAvalista.SetCelular(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_CELULAR').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_CELULAR"!');
  end;
end;

{ Read method for property Cidade }
function TAvalista.GetCidade : String;
begin
  try
    Result := Self.fieldByName('AVL_CIDADE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Cidade }
procedure TAvalista.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_CIDADE"!');
  end;
end;

{ Read method for property CodigoAVL }
function TAvalista.GetCodigoAVL : Integer;
begin
  try
    Result := Self.fieldByName('AVL_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoAVL }
procedure TAvalista.SetCodigoAVL(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AVL_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AVL_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TAvalista.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TAvalista.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TAvalista.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('AVL_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TAvalista.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TAvalista.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('AVL_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TAvalista.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataNascimento }
function TAvalista.GetDataNascimento : Tdatetime;
begin
  try
    Result := Self.fieldByName('AVL_DT_NASC').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataNascimento }
procedure TAvalista.SetDataNascimento(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_DT_NASC').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_DT_NASC"!');
  end;
end;

{ Read method for property Endereco }
function TAvalista.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('AVL_ENDERECO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TAvalista.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_ENDERECO"!');
  end;
end;

{ Read method for property Fax }
function TAvalista.GetFax : String;
begin
  try
    Result := Self.fieldByName('AVL_FAX').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Fax }
procedure TAvalista.SetFax(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_FAX').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_FAX"!');
  end;
end;

{ Read method for property Fone }
function TAvalista.GetFone : String;
begin
  try
    Result := Self.fieldByName('AVL_FONE').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Fone }
procedure TAvalista.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_FONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_FONE"!');
  end;
end;

{ Read method for property Logradouro }
function TAvalista.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('AVL_LOGRADOURO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Logradouro }
procedure TAvalista.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AVL_LOGRADOURO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AVL_LOGRADOURO"!');
    end;
end;

{ Read method for property Nome }
function TAvalista.GetNome : String;
begin
  try
    Result := Self.fieldByName('AVL_NOME').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Nome }
procedure TAvalista.SetNome(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_NOME').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_NOME"!');
  end;
end;

{ Read method for property Observacao }
function TAvalista.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('AVL_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TAvalista.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_OBSERVACAO"!');
  end;
end;

{ Read method for property PessoaFisica }
function TAvalista.GetPessoaFisica : Boolean;
begin
 try
   result := (Self.fieldByName('AVL_PFISICA').asInteger=1);
 except
    try
      result := Self.fieldByName('AVL_PFISICA').asBoolean;
    except
      result:= False;
    end;
 end;
end;

{ Write method for property PessoaFisica }
procedure TAvalista.SetPessoaFisica(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
      Self.fieldByName('AVL_PFISICA').asInteger := 1
     else
      Self.fieldByName('AVL_PFISICA').asInteger := 0;
   except
      try
        Self.fieldByName('AVL_PFISICA').asBoolean := Value;
      except
        ShowMessage('Não foi possível alterar o campo "AVL_PFISICA"!');
      end;
   end;
end;

{ Read method for property Situacao }
function TAvalista.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('AVL_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TAvalista.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AVL_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AVL_SITUACAO"!');
    end;
end;

{ Read method for property Uf }
function TAvalista.GetUf : String;
begin
  try
    Result := Self.fieldByName('AVL_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Uf }
procedure TAvalista.SetUf(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AVL_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AVL_UF"!');
  end;
end;

{ Altera um Cliente }
function TAvalista.Alterar(CdCNC,CdAVL,PLOGRADOURO: integer; CdPesFisica:Boolean;PDATA_NASC,PNOME,PCGC_CPF,PCGF_RG,PENDERECO,PBAIRRO,PCIDADE,PUF,PCEP,PFONE:String):boolean;
begin
  result := true;
  If not(localizarCod(CdAVL,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      DataAlterado   := CConfiguracao.DataHora;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      PessoaFisica   := CDPesfisica;
      DataNascimento := StrToDateTime(PDATA_NASC);
      Nome           := PNOME;
      CGCCPF         := PCGC_CPF;
      CGFRG          := PCGF_RG;
      Logradouro     := PLOGRADOURO;
      Endereco       := PENDERECO;
      Bairro         := PBAIRRO;
      Cidade         := PCIDADE;
      Uf             := PUF;
      CEP            := PCEP;
      Fone           := PFONE;

      try
        Post;

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

function TAvalista.AlterarAuto:Boolean;
var
  CdCNC, CdAVL: integer;
begin
  Result:=false;

  CdCNC := CodigoCNC;
  CdAVL := CodigoAVL;

  try
    edit;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    Try
      PessoaFisica:=EPessoaFisica.checked;
    except
    end;
    try
      DataNascimento := StrToDateTime(EDataNascimento.Text);
    except
    end;
    try
      Nome := ENome.Text;
    except
    end;
    try
      CGCCPF := ECGCCPF.Text;
    except
    end;
    try
      CGFRG  := ECGFRG.Text;
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
      Fax := EFax.Text;
    except
    end;
    try
      Celular := ECelular.Text;
    except
    end;
    try
      Situacao := ESituacao.ItemIndex;
    except
    end;
    try
      Observacao := EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(1000,CdCNC,CdAVL,'Nome:'+ENome.Text+' End:'+EEndereco.Text+
        ' Fones:'+EFone.Text+'/'+EFax.Text+'/'+ECelular.Text+
        ' CPF/CNPJ:'+ECGCCPF.Text);
      Result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TAvalista.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    EPessoaFisica.Enabled     :=Habilitar;
  except
  end;
  try
    EDataNascimento.Enabled   :=Habilitar;
  except
  end;
  try
    ENome.Enabled             :=Habilitar;
  except
  end;
  try
    ECGCCPF.Enabled           :=Habilitar;
  except
  end;
  try
    ECGFRG.Enabled            :=Habilitar;
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
    EFax.Enabled              :=Habilitar;
  except
  end;
  try
    ECelular.Enabled          :=Habilitar;
  except
  end;
  try
    ESituacao.Enabled       :=Habilitar;
  except
  end;
  try
    EObservacao.Enabled       :=Habilitar;
  except
  end;

end;

procedure TAvalista.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TAvalista.CarregaDados;
begin
  Try
    ECodigoAVL.Text           :=IntToStr(CodigoAVL);
  except
  end;
  try
    EPessoaFisica.checked     :=PessoaFisica;
  except
  end;
  try
    if DataNascimento=0 then
      EDataNascimento.Text:=''
    else
      EDataNascimento.Text      :=FormatDateTime('dd/mm/yyyy', DataNascimento);
  except
  end;
  try
    ENome.Text                :=Nome;
  except
  end;
  try
    ECGCCPF.Text              :=CGCCPF;
  except
  end;
  try
    ECGFRG.Text               :=CGFRG;
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
    ItemComboBox(EUF,Uf);
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
    EFax.Text                 :=Fax;
  except
  end;
  try
    ECelular.Text             :=Celular;
  except
  end;
  try
    ESituacao.ItemIndex          :=Situacao;
  except
  end;
  try
    EObservacao.Text          :=Observacao;
  except
  end;
end;

constructor TAvalista.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'AVALISTA';

     { Code to perform other tasks when the component is created }

end;

function TAvalista.Deletar(CdCNC,CDAVL:Integer):Boolean;
var
  sAvalista: string;
begin
  Result:=False;
  If not(localizarCod(CdAVL,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      sAvalista := Nome;
      if Delete then
      Begin
        Result := True;
        GeraLog(990,CdCNC,CdAVL,sAvalista);
        RegistrarDel(CdCNC,1150(*Avalista*),CdAVL,sAvalista);
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TAvalista.Destroy;
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

function TAvalista.FinalizaEdicao:Boolean;
var
  cdAVL, cdcnc:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  If not Verificadata(EDataNascimento.text) Then
    mensagem:=mensagem+'Data de nascimento incorreta!'+#13;
  {if not VerificaCPFCNPJBranco(ECGCCPF.Text) then
    mensagem := mensagem + 'CPF/CNPJ inválido'+#13;}
  if not VerificaInteiro(ECGFRG.Text) then
    if (upperCase(ECGFRG.Text[1]) <> 'P') or
       (not VerificaInteiro(Copy(ECGFRG.Text,2,Length(ECGFRG.Text)-1))) then
      mensagem := mensagem + 'CGF/RG inválido'+#13;
  if (ECGFRG.Text <> '') and
     (not VerificaCGFBranco(ECGFRG.Text,EUF.Text)) then
    Exit;  //A menssagem será exibida pela função
  If mensagem <>'' Then
    ShowMessage(mensagem)
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
        open;
        LocalizarCod(SCodigo, CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
        Carregadados;
      end;
    End
    Else If Estado=2 then
    Begin
      cdAVL:=codigoAVL;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cdAVL, cdcnc);
        AtualizaControles(False);
        Estado:=0;
        Carregadados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Cliente }
function TAvalista.Inserir(CdCNC,CdAVL,PLOGRADOURO: integer;CdPesFisica:Boolean; PDATA_NASC,PNOME,PCGC_CPF,PCGF_RG,PENDERECO,PBAIRRO,PCIDADE,PUF,PCEP,PFONE:String):boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdAVL=0 then
    Cod    := ProximoCodigo('AVL_CODIGO')
  else
    Cod    := CdAVL;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  else
  begin
   result:=true;
       try
         insert;
         CodigoAVL      := Cod;
         CodigoCNC      := CdCNC;
         CodigoUSU      := CConfiguracao.CodigoUSU;
         DataCadastro   := CConfiguracao.DataHora;
         PessoaFisica   := CDPesfisica;
         DataNascimento := StrToDateTime(PDATA_NASC);
         Nome           := PNOME;
         CGCCPF         := PCGC_CPF;
         CGFRG          := PCGF_RG;
         Logradouro     := PLOGRADOURO;
         Endereco       := PENDERECO;
         Bairro         := PBAIRRO;
         Cidade         := PCIDADE;
         Uf             := PUF;
         CEP            := PCEP;
         Fone           := PFONE;
         Situacao       := 0;

         try
           Post;
           Result := True;

         except
           Cancel;
           ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
         end;
       except
         ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
       end;
  end;
end;

function TAvalista.InserirAuto:Boolean;
Var
  CdCNC, CdAVL: integer;
begin
  result:=False;

  CdCNC := CConfiguracao.CodigoCNC;
  CdAVL := SCodigo;

  If (localizarCod(CdAVL, CdCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  begin
    if LocalizarCNPJCPF(ECGCCPF.Text,CdAVL,CdCNC) then
    Begin
      ShowMessage('CNPJ/CPF já cadastrado!');
      Exit;
    end;
    try
      append;
      try
        CodigoAVL   := CdAVL;
      except
      end;
      try
        codigocnc   := CdCNC;
      except
      end;
      try
        codigoUSU   := CConfiguracao.CodigoUSU;
      except
      end;
      try
        DataCadastro   := CConfiguracao.DataHora;
      except
      end;
      Try
        PessoaFisica := EPessoaFisica.checked;
      except
      end;
      try
        DataNascimento := StrToDateTime(EDataNascimento.Text);
      except
      end;
      try
        Nome          := ENome.Text;
      except
      end;
      try
        CGCCPF := ECGCCPF.Text;
      except
      end;
      try
        CGFRG  := ECGFRG.Text;
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
         Fax := EFax.Text;
      except
      end;
      try
         Celular := ECelular.Text;
      except
      end;
      try
         Situacao := ESituacao.ItemIndex;
      except
      end;
      try
         Observacao := EObservacao.Text;
      except
      end;
      try
        Post;

        GeraLog(980,CdCNC,CdAVL,'Nome:'+ENome.Text+' End:'+EEndereco.Text+
          ' Fones:'+EFone.Text+'/'+EFax.Text+'/'+ECelular.Text+
          ' CPF:'+ECGCCPF.Text);

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

procedure TAvalista.LimpaCampos;
begin
  Try
    if Estado<>1 then
      ECodigoAVL.Clear;
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
  Try
    ELogradouro.KeyValue := 0;
  except
  end;
  try
    if Estado <> 1 then
      EPessoaFisica.Checked := False
    else
      EPessoaFisica.Checked := True;
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
    ECGCCPF.Clear;
  except
  end;
  try
    ECGFRG.Clear;
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
    ECEP.Clear
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
    if Estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  except
  end;
  try
    EObservacao.Clear;
  except
  end;
end;

function TAvalista.LocalizarCNPJCPF(PCNPJCPF:String; CdAVL,CdCNC:Integer):Boolean;
begin
  if (PCNPJCPF <> '') and (PCNPJCPF <> '  -   -   /    -  ') and (PCNPJCPF <> '   -   -   -  ') then
  Begin
    with CConfiguracao.QueryComandos do
    begin
      close;
      sql.Text:='SELECT * FROM AVALISTA '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND AVL_CGC_CPF = "'+PCNPJCPF+'" '+
        ' AND AVL_CODIGO <> '+IntToStr(CdAVL);
      open;
      if not IsEmpty then
        Result:=True
      else
        Result:=False;
    end;
  end
  else
    Result:=False;
end;


{ Localiza um cliente }
function TAvalista.LocalizarCod(CDAVL,CDCNC:Integer):Boolean;
begin
  with CConfiguracao.QueryComandos do
  begin
    close;
    sql.Text:='SELECT * FROM AVALISTA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND AVL_CODIGO='+IntToStr(CdAVL);
    open;
    Result := (not IsEmpty);
  end;
end;

function TAvalista.LocalizarNome(PNome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If PNome<>Nome Then
    If locate('AVL_NOME',PNome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TAvalista.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TAvalista.PreparaInsercao;
begin
  ProximoCodigo('AVL_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TAvalista.deletarauto:Boolean;
var
  CdCNC, CdAVL: integer;
  sAvalista: string;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdAVL := CodigoAVL;
    sAvalista := Nome;
    if Delete then
    Begin
      result:=true;
      GeraLog(990,CdCNC,CdAVL,sAvalista);
      RegistrarDel(CdCNC,1150(*Avalista*),CdAVL,sAvalista);
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
