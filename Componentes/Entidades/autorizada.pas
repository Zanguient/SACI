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
unit Autorizada;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TAutorizada = class(TSQuery)
    private
      { Private fields of TAutorizada }
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodigoAUT }
        FCodigoAUT : Integer;
        { Storage for property Contato }
        FContato : String;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property ECep }
        FECep : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoAUT }
        FECodigoAUT : TEdit;
        { Storage for property EContato }
        FEContato : TEdit;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property EFax }
        FEFax : TMaskEdit;
        { Storage for property EFone }
        FEFone : TMaskEdit;
        { Storage for property ELogradouro }
        FELogradouro : TDBLookupComboBox;
        { Storage for property ENomeAut }
        FENomeAut : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property ERepresentadas }
        FERepresentadas : TEdit;
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
        { Storage for property NomeAut }
        FNomeAut : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Representadas }
        FRepresentadas : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Uf }
        FUf : String;

      { Private methods of TAutorizada }
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
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
        { Read method for property CodigoAUT }
        function GetCodigoAUT : Integer;
        { Write method for property CodigoAUT }
        procedure SetCodigoAUT(Value : Integer);
        { Read method for property Contato }
        function GetContato : String;
        { Write method for property Contato }
        procedure SetContato(Value : String);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
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
        { Read method for property NomeAut }
        function GetNomeAut : String;
        { Write method for property NomeAut }
        procedure SetNomeAut(Value : String);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Representadas }
        function GetRepresentadas : String;
        { Write method for property Representadas }
        procedure SetRepresentadas(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Uf }
        function GetUf : String;
        { Write method for property Uf }
        procedure SetUf(Value : String);

    protected
      { Protected fields of TAutorizada }

      { Protected methods of TAutorizada }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TAutorizada }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TAutorizada }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC,CdAUT:Integer);
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdAUT,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TAutorizada }
        property Bairro : String read GetBairro write SetBairro;
        property CEP : String read GetCEP write SetCEP;
        property Cidade : String read GetCidade write SetCidade;
        { Código da Autorizada }
        property CodigoAUT : Integer read GetCodigoAUT write SetCodigoAUT;
        property Contato : String read GetContato write SetContato;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EBairro : TEdit read FEBairro write FEBairro;
        property ECep : TMaskEdit read FECep write FECep;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoAUT : TEdit read FECodigoAUT write FECodigoAUT;
        property EContato : TEdit read FEContato write FEContato;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EFax : TMaskEdit read FEFax write FEFax;
        property EFone : TMaskEdit read FEFone write FEFone;
        property ELogradouro : TDBLookupComboBox
             read FELogradouro write FELogradouro;
        property ENomeAut : TEdit read FENomeAut write FENomeAut;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property ERepresentadas : TEdit
             read FERepresentadas write FERepresentadas;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EUF : TComboBox read FEUF write FEUF;
        property Endereco : String read GetEndereco write SetEndereco;
        property Fax : String read GetFax write SetFax;
        property Fone : String read GetFone write SetFone;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property NomeAut : String read GetNomeAut write SetNomeAut;
        property Observacao : String read GetObservacao write SetObservacao;
        property Representadas : String
             read GetRepresentadas write SetRepresentadas;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Uf : String read GetUf write SetUf;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TAutorizada with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TAutorizada]);
end;

{ Method to set variable and property values and create objects }
procedure TAutorizada.AutoInitialize;
begin
     Estado := 0;
     FEBairro := nil;
     FECep := nil;
     FECidade := nil;
     FECodigoAUT := nil;
     FEContato := nil;
     FEEndereco := nil;
     FEFax := nil;
     FEFone := nil;
     FELogradouro := nil;
     FENomeAut := nil;
     FEObservacao := nil;
     FERepresentadas := nil;
     FESituacao := nil;
     FEUF := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TAutorizada.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FECep then
        FECep := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoAUT then
        FECodigoAUT := nil;
     if AComponent = FEContato then
        FEContato := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FEFax then
        FEFax := nil;
     if AComponent = FEFone then
        FEFone := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FENomeAut then
        FENomeAut := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FERepresentadas then
        FERepresentadas := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FEUF then
        FEUF := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TAutorizada.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bairro }
function TAutorizada.GetBairro : String;
begin
  try
    Result := Self.fieldByName('AUT_BAIRRO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TAutorizada.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_BAIRRO"!');
  end;
end;

{ Read method for property CEP }
function TAutorizada.GetCEP : String;
begin
  try
    Result := Self.fieldByName('AUT_CEP').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TAutorizada.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_CEP"!');
  end;
end;

{ Read method for property Cidade }
function TAutorizada.GetCidade : String;
begin
  try
    Result := Self.fieldByName('AUT_CIDADE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Cidade }
procedure TAutorizada.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_CIDADE"!');
  end;
end;

{ Read method for property CodigoAUT }
function TAutorizada.GetCodigoAUT : Integer;
begin
  try
    Result := Self.fieldByName('AUT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoAUT }
procedure TAutorizada.SetCodigoAUT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AUT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AUT_CODIGO"!');
    end;
end;

{ Read method for property Contato }
function TAutorizada.GetContato : String;
begin
  try
    Result := Self.fieldByName('AUT_CONTATO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Contato }
procedure TAutorizada.SetContato(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AUT_CONTATO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AUT_CONTATO"!');
    end;
end;

{ Read method for property DataAlterado }
function TAutorizada.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('AUT_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TAutorizada.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AUT_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AUT_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TAutorizada.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('AUT_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TAutorizada.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AUT_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AUT_DT_CADASTRO"!');
    end;
end;

{ Read method for property Endereco }
function TAutorizada.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('AUT_ENDERECO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TAutorizada.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_ENDERECO"!');
  end;
end;

{ Read method for property Fax }
function TAutorizada.GetFax : String;
begin
  try
    Result := Self.fieldByName('AUT_FAX').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fax }
procedure TAutorizada.SetFax(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_FAX').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_FAX"!');
  end;
end;

{ Read method for property Fone }
function TAutorizada.GetFone : String;
begin
  try
    Result := Self.fieldByName('AUT_FONE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fone }
procedure TAutorizada.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_FONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_FONE"!');
  end;
end;

{ Read method for property Logradouro }
function TAutorizada.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('AUT_LOGRADOURO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Logradouro }
procedure TAutorizada.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AUT_LOGRADOURO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AUT_LOGRADOURO"!');
    end;
end;

{ Read method for property NomeAut }
function TAutorizada.GetNomeAut : String;
begin
  try
    Result := Self.fieldByName('AUT_NOME').asString;
  except
    result:= '';
  end;
end;

{ Write method for property NomeAut }
procedure TAutorizada.SetNomeAut(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_NOME').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_NOME"!');
  end;
end;

{ Read method for property Observacao }
function TAutorizada.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('AUT_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TAutorizada.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_OBSERVACAO"!');
  end;
end;

{ Read method for property Representadas }
function TAutorizada.GetRepresentadas : String;
begin
  try
    Result := Self.fieldByName('AUT_REPRESENTADAS').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Representadas }
procedure TAutorizada.SetRepresentadas(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_REPRESENTADAS').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_REPRESENTADAS"!');
  end;
end;

{ Read method for property Situacao }
function TAutorizada.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('AUT_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TAutorizada.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AUT_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AUT_SITUACAO"!');
    end;
end;

{ Read method for property Uf }
function TAutorizada.GetUf : String;
begin
  try
    Result := Self.fieldByName('AUT_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Uf }
procedure TAutorizada.SetUf(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AUT_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AUT_UF"!');
  end;
end;

function TAutorizada.AlterarAuto:Boolean;
var
  CdCNC, CdAUT: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdAUT := CodigoAUT;
  sDetalhe := '';
  try
    edit;
    try
       DataAlterado  := CConfiguracao.DataHora;
    except
    end;    
    try
       CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;    
    try
       NomeAut := ENomeAut.Text;
       sDetalhe := sDetalhe + 'Nome:'+ENomeAut.Text;
    except
    end;
    try
       Contato := EContato.Text;
       sDetalhe := sDetalhe + ' Cont:'+EContato.Text;
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
       Representadas := ERepresentadas.Text;
       sDetalhe := sDetalhe + ' Rep:'+ERepresentadas.Text;
    except
    end;
    try
      Situacao := ESituacao.ItemIndex;
      sDetalhe := sDetalhe + ' Sit:'+IntToStr(ESituacao.ItemIndex);
    except
    end;
    try
       Observacao := EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(8360,CdCNC,CdAUT,SDetalhe);
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TAutorizada.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    ENomeAut.Enabled          :=Habilitar;
  except
  end;
  try
    EContato.Enabled          :=Habilitar;
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
    EFAX.Enabled              :=Habilitar;
  except
  end;
  try
    ERepresentadas.Enabled    :=Habilitar;
  except
  end;
  try
    ESituacao.Enabled    :=Habilitar;
  except
  end;
  try
    EObservacao.Enabled    :=Habilitar;
  except
  end;
end;

procedure TAutorizada.CancelaEdicao;
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

procedure TAutorizada.CarregaDados;
begin
  Try
    ECodigoAUT.Text           :=IntToStr(CodigoAUT);
  except
  end;
  try
    ENomeAut.Text             :=NomeAut;
  except
  end;
  try
    EContato.Text             :=Contato;
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
    EFAX.Text                 :=Fax;
  except
  end;
  try
    ERepresentadas.Text       :=Representadas;
  except
  end;
  try
    ESituacao.ItemIndex       :=Situacao;
  except
  end;
  try
    EObservacao.Text       :=Observacao;
  except
  end;
end;

constructor TAutorizada.Create(AOwner: TComponent);
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

procedure TAutorizada.Deletar(CdCNC,CdAUT:Integer);
begin
  If not(localizarCod(CdAUT,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      GeraLog(8370,CdCNC,CdAUT);
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TAutorizada.Destroy;
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

function TAutorizada.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  aux:TDataSetNotifyEvent;
  mensagem: string;
begin
  Result := False;
  mensagem := '';
  if mensagem <> '' then
    ShowMessage(mensagem)
  else 
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;  
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        close;
        open;
        LocalizarCod(SCodigo, CodigoCNC);
        Estado:=0;
        AtualizaControles(False);      
        Result := True;
      end;
    End
    else If Estado=2 then
    Begin
      cod:=codigoAUT;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        close;
        open;
        LocalizarCod(cod, cdcnc);
        Estado:=0;
        AtualizaControles(False);      
        Result := True;
      end;
    End;
    AfterScroll:=Aux;    
  end;    
end;

function TAutorizada.InserirAuto:Boolean;
var
  CdCNC,CdAUT: integer;
  SDetalhe: string;
begin
  Result := False;
  CdCNC := CConfiguracao.CodigoCNC;
  CdAUT := SCodigo;
  SDetalhe := '';
  try
    append;
    try
      CodigoAUT   := SCodigo;
    except
    end;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      DataCadastro   := CConfiguracao.DataHora;
    except
    end;      
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;      
    try
       NomeAut := ENomeAut.Text;
       SDetalhe := SDetalhe + 'Nome:'+ENomeAut.Text;
    except
    end;
    try
       Contato := EContato.Text;
       SDetalhe := SDetalhe + ' Cont:'+EContato.Text;
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
       Representadas := ERepresentadas.Text;
       SDetalhe := SDetalhe + ' Rep:'+ERepresentadas.Text;
    except
    end;
    try
       Situacao := ESituacao.ItemIndex;
       SDetalhe := SDetalhe + ' Sit:'+IntToStr(ESituacao.ItemIndex);
    except
    end;
    try
       Observacao := EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(8350,CdCNC,CdAUT,SDetalhe);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TAutorizada.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoAUT.Clear;
  except
  end;
  try
    ENomeAut.Clear;
  except
  end;
  try
    EContato.Clear;
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
    if Estado <> 1 then
      EUF.ItemIndex := -1
    else
      ItemComboBox(EUF,CConfiguracao.UF);
  except
  end;
  try
    ERepresentadas.Clear;
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

{ Localiza um cliente }
function TAutorizada.LocalizarCod(CdAUT,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdAUT<>CodigoAUT) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;AUT_CODIGO', vararrayof([CDCNC, CDAUT]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TAutorizada.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TAutorizada.PreparaInsercao;
begin
  ProximoCodigo('AUT_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TAutorizada.deletarauto:Boolean;
var
  CdCNC, CdAUT: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdAUT := CodigoAUT;
    if Delete then
    Begin
      result:=true;
      GeraLog(8370,CdCNC,CdAUT);
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
