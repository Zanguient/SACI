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
unit CentroCusto;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Dbgrids, Configuracao, Funcoes, Variants;

type
  TCentroCusto = class(TSQuery)
    private
      { Private fields of TCentroCusto }
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property CGC }
        FCGC : String;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property ECGC }
        FECGC : TMaskEdit;
        { Storage for property ECep }
        FECep : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TEdit;
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
        { Storage for property EIP }
        FEIP : TEdit;
        { Storage for property ELogradouro }
        FELogradouro : TDBLookupComboBox;
        { Storage for property EMail }
        FEMail : String;
        { Storage for property EMetaQuinzena1 }
        FEMetaQuinzena1 : TEdit;
        { Storage for property EMetaQuinzena2 }
        FEMetaQuinzena2 : TEdit;
        { Storage for property ENomeFantasia }
        FENomeFantasia : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property ERazaoSocial }
        FERazaoSocial : TEdit;
        { Storage for property ERecebeDados }
        FERecebeDados : TCheckBox;
        { Storage for property ESite }
        FESite : TEdit;
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
        { Storage for property IP }
        FIP : String;
        { Storage for property Logradouro }
        FLogradouro : Integer;
        { Storage for property MetaQuinzena1 }
        FMetaQuinzena1 : Double;
        { Storage for property MetaQuinzena2 }
        FMetaQuinzena2 : Double;
        { Storage for property NomeFantasia }
        FNomeFantasia : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property RazaoSocial }
        FRazaoSocial : String;
        { Storage for property RecebeDados }
        FRecebeDados : Boolean;
        { Storage for property Site }
        FSite : String;
        { Storage for property Uf }
        FUf : String;

      { Private methods of TCentroCusto }
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
        { Read method for property CGC }
        function GetCGC : String;
        { Write method for property CGC }
        procedure SetCGC(Value : String);
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
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
        { Read method for property IP }
        function GetIP : String;
        { Write method for property IP }
        procedure SetIP(Value : String);
        { Read method for property Logradouro }
        function GetLogradouro : Integer;
        { Write method for property Logradouro }
        procedure SetLogradouro(Value : Integer);
        { Read method for property MetaQuinzena1 }
        function GetMetaQuinzena1 : Double;
        { Write method for property MetaQuinzena1 }
        procedure SetMetaQuinzena1(Value : Double);
        { Read method for property MetaQuinzena2 }
        function GetMetaQuinzena2 : Double;
        { Write method for property MetaQuinzena2 }
        procedure SetMetaQuinzena2(Value : Double);
        { Read method for property NomeFantasia }
        function GetNomeFantasia : String;
        { Write method for property NomeFantasia }
        procedure SetNomeFantasia(Value : String);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property RazaoSocial }
        function GetRazaoSocial : String;
        { Write method for property RazaoSocial }
        procedure SetRazaoSocial(Value : String);
        { Read method for property RecebeDados }
        function GetRecebeDados : Boolean;
        { Write method for property RecebeDados }
        procedure SetRecebeDados(Value : Boolean);
        { Read method for property Site }
        function GetSite : String;
        { Write method for property Site }
        procedure SetSite(Value : String);
        { Read method for property Uf }
        function GetUf : String;
        { Write method for property Uf }
        procedure SetUf(Value : String);

    protected
      { Protected fields of TCentroCusto }

      { Protected methods of TCentroCusto }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCentroCusto }

      { Public methods of TCentroCusto }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC: Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Centro de Custo }
        function Inserir(CdCNC,PLogradouro: integer; RZ_SOCIAL,NOME_FAN,PCGC,PIE,PEndereco,PBairro,PCidade,PUF,PCEP,PFone,PFax:String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um centro de custo }
        function LocalizarCod(cdCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TCentroCusto }
        property Bairro : String read GetBairro write SetBairro;
        property CEP : String read GetCEP write SetCEP;
        property CGC : String read GetCGC write SetCGC;
        property Cidade : String read GetCidade write SetCidade;
        property EBairro : TEdit read FEBairro write FEBairro;
        property ECGC : TMaskEdit read FECGC write FECGC;
        property ECep : TMaskEdit read FECep write FECep;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoCNC : TEdit read FECodigoCNC write FECodigoCNC;
        property EEMail : TEdit read FEEMail write FEEMail;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EFax : TMaskEdit read FEFax write FEFax;
        property EFone : TMaskEdit read FEFone write FEFone;
        property EIE : TEdit read FEIE write FEIE;
        property EIP : TEdit read FEIP write FEIP;
        property ELogradouro : TDBLookupComboBox
             read FELogradouro write FELogradouro;
        property EMail : String read GetEMail write SetEMail;
        property EMetaQuinzena1 : TEdit
             read FEMetaQuinzena1 write FEMetaQuinzena1;
        property EMetaQuinzena2 : TEdit
             read FEMetaQuinzena2 write FEMetaQuinzena2;
        property ENomeFantasia : TEdit
             read FENomeFantasia write FENomeFantasia;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property ERazaoSocial : TEdit read FERazaoSocial write FERazaoSocial;
        property ERecebeDados : TCheckBox
             read FERecebeDados write FERecebeDados;
        property ESite : TEdit read FESite write FESite;
        property EUF : TComboBox read FEUF write FEUF;
        property Endereco : String read GetEndereco write SetEndereco;
        property Fax : String read GetFax write SetFax;
        property Fone : String read GetFone write SetFone;
        property IE : String read GetIE write SetIE;
        property IP : String read GetIP write SetIP;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property MetaQuinzena1 : Double
             read GetMetaQuinzena1 write SetMetaQuinzena1;
        property MetaQuinzena2 : Double
             read GetMetaQuinzena2 write SetMetaQuinzena2;
        property NomeFantasia : String
             read GetNomeFantasia write SetNomeFantasia;
        property Observacao : String read GetObservacao write SetObservacao;
        property RazaoSocial : String read GetRazaoSocial write SetRazaoSocial;
        property RecebeDados : Boolean
             read GetRecebeDados write SetRecebeDados;
        property Site : String read GetSite write SetSite;
        property Uf : String read GetUf write SetUf;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCentroCusto with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCentroCusto]);
end;

{ Method to set variable and property values and create objects }
procedure TCentroCusto.AutoInitialize;
begin
     FEBairro := nil;
     FECGC := nil;
     FECep := nil;
     FECidade := nil;
     FECodigoCNC := nil;
     FEEMail := nil;
     FEEndereco := nil;
     FEFax := nil;
     FEFone := nil;
     FEIE := nil;
     FEIP := nil;
     FELogradouro := nil;
     FEMetaQuinzena1 := nil;
     FEMetaQuinzena2 := nil;
     FENomeFantasia := nil;
     FEObservacao := nil;
     FERazaoSocial := nil;
     FERecebeDados := nil;
     FESite := nil;
     FEUF := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCentroCusto.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FECGC then
        FECGC := nil;
     if AComponent = FECep then
        FECep := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
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
     if AComponent = FEIP then
        FEIP := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FEMetaQuinzena1 then
        FEMetaQuinzena1 := nil;
     if AComponent = FEMetaQuinzena2 then
        FEMetaQuinzena2 := nil;
     if AComponent = FENomeFantasia then
        FENomeFantasia := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FERazaoSocial then
        FERazaoSocial := nil;
     if AComponent = FERecebeDados then
        FERecebeDados := nil;
     if AComponent = FESite then
        FESite := nil;
     if AComponent = FEUF then
        FEUF := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCentroCusto.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bairro }
function TCentroCusto.GetBairro : String;
begin
  try
    Result := Self.fieldByName('CNC_BAIRRO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TCentroCusto.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_BAIRRO"!');
  end;
end;

{ Read method for property CEP }
function TCentroCusto.GetCEP : String;
begin
  try
    Result := Self.fieldByName('CNC_CEP').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TCentroCusto.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_CEP"!');
  end;
end;

{ Read method for property CGC }
function TCentroCusto.GetCGC : String;
begin
  try
    Result := Self.fieldByName('CNC_CGC').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CGC }
procedure TCentroCusto.SetCGC(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_CGC').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_CGC"!');
  end;
end;

{ Read method for property Cidade }
function TCentroCusto.GetCidade : String;
begin
  try
    Result := Self.fieldByName('CNC_CIDADE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Cidade }
procedure TCentroCusto.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_CIDADE"!');
  end;
end;

{ Read method for property EMail }
function TCentroCusto.GetEMail : String;
begin
  try
    Result := Self.fieldByName('CNC_EMAIL').asString;
  except
    result:= '';
  end;
end;

{ Write method for property EMail }
procedure TCentroCusto.SetEMail(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_EMAIL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_EMAIL"!');
  end;
end;

{ Read method for property Endereco }
function TCentroCusto.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('CNC_ENDERECO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Endereco }
procedure TCentroCusto.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_ENDERECO"!');
  end;
end;

{ Read method for property Fax }
function TCentroCusto.GetFax : String;
begin
  try
    Result := Self.fieldByName('CNC_FAX').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fax }
procedure TCentroCusto.SetFax(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_FAX').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_FAX"!');
  end;
end;

{ Read method for property Fone }
function TCentroCusto.GetFone : String;
begin
  try
    Result := Self.fieldByName('CNC_FONE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fone }
procedure TCentroCusto.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_FONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_FONE"!');
  end;
end;

{ Read method for property IE }
function TCentroCusto.GetIE : String;
begin
  try
    Result := Self.fieldByName('CNC_IE').asString;
  except
    result:= '';
  end;
end;

{ Write method for property IE }
procedure TCentroCusto.SetIE(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_IE').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_IE"!');
    end;
end;

{ Read method for property IP }
function TCentroCusto.GetIP : String;
begin
  try
    Result := Self.fieldByName('CNC_IP').asString;
  except
    result:= '';
  end;
end;

{ Write method for property IP }
procedure TCentroCusto.SetIP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_IP').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_IP"!');
    end;
end;

{ Read method for property Logradouro }
function TCentroCusto.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('CNC_LOGRADOURO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Logradouro }
procedure TCentroCusto.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_LOGRADOURO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_LOGRADOURO"!');
    end;
end;

{ Read method for property MetaQuinzena1 }
function TCentroCusto.GetMetaQuinzena1 : Double;
begin
  try
    Result := Self.fieldByName('CNC_META_QUINZENA_1').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property MetaQuinzena1 }
procedure TCentroCusto.SetMetaQuinzena1(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_META_QUINZENA_1').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_META_QUINZENA_1"!');
    end;
end;

{ Read method for property MetaQuinzena2 }
function TCentroCusto.GetMetaQuinzena2 : Double;
begin
  try
    Result := Self.fieldByName('CNC_META_QUINZENA_2').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property MetaQuinzena2 }
procedure TCentroCusto.SetMetaQuinzena2(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_META_QUINZENA_2').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_META_QUINZENA_2"!');
    end;
end;

{ Read method for property NomeFantasia }
function TCentroCusto.GetNomeFantasia : String;
begin
  try
    Result := Self.fieldByName('CNC_NOME_FAN').asString;
  except
    result:= '';
  end;
end;

{ Write method for property NomeFantasia }
procedure TCentroCusto.SetNomeFantasia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_NOME_FAN').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_NOME_FAN"!');
  end;
end;

{ Read method for property Observacao }
function TCentroCusto.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('CNC_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TCentroCusto.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_OBSERVACAO"!');
  end;
end;

{ Read method for property RazaoSocial }
function TCentroCusto.GetRazaoSocial : String;
begin
  try
    Result := Self.fieldByName('CNC_RZ_SOCIAL').asString;
  except
    result:= '';
  end;
end;

{ Write method for property RazaoSocial }
procedure TCentroCusto.SetRazaoSocial(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_RZ_SOCIAL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_RZ_SOCIAL"!');
  end;
end;

{ Read method for property RecebeDados }
function TCentroCusto.GetRecebeDados : Boolean;
begin
  try
    result := (Self.fieldByName('CNC_RECEBE_DADOS').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property RecebeDados }
procedure TCentroCusto.SetRecebeDados(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('CNC_RECEBE_DADOS').asInteger := 1
      else
        Self.fieldByName('CNC_RECEBE_DADOS').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_RECEBE_DADOS"!');
    end;
end;

{ Read method for property Site }
function TCentroCusto.GetSite : String;
begin
  try
    Result := Self.fieldByName('CNC_SITE').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Site }
procedure TCentroCusto.SetSite(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_SITE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_SITE"!');
  end;
end;

{ Read method for property Uf }
function TCentroCusto.GetUf : String;
begin
  try
    Result := Self.fieldByName('CNC_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Uf }
procedure TCentroCusto.SetUf(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_UF"!');
  end;
end;

function TCentroCusto.AlterarAuto:Boolean;
begin
  Result:=false;
  try
    edit;
    try
       RazaoSocial  := ERazaoSocial.Text;
    except
    end;
    try
       NomeFantasia := ENomeFantasia.Text;
    except
    end;
    try
       CGC := ECGC.Text;
    except
    end;
    try
       IE  := EIE.Text;
    except
    end;
    try
       IP  := EIP.Text;
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
       EMail := EEMail.Text;
    except
    end;
    try
       Site := ESite.Text;
    except
    end;
    try
       RecebeDados := ERecebeDados.Checked;
    except
    end;
    try
       MetaQuinzena1 := StrToFloat(EMetaQuinzena1.Text);
    except
    end;
    try
       MetaQuinzena2 := StrToFloat(EMetaQuinzena2.Text);
    except
    end;
    try
       Observacao := EObservacao.Text;
    except
    end;
    try
      Post;
      Result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TCentroCusto.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    ERazaoSocial.Enabled      :=Habilitar;
  except
  end;
  try
    ENomeFantasia.Enabled     :=Habilitar;
  except
  end;
  try
    ECGC.Enabled              :=Habilitar;
  except
  end;
  try
    EIE.Enabled               :=Habilitar;
  except
  end;
  try
    EIP.Enabled               :=Habilitar;
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
    EEMail.Enabled              :=Habilitar;
   except
  end;
  try
    ESite.Enabled               :=Habilitar;
   except
  end;
  try
    ERecebeDados.Enabled        :=Habilitar;
  except
  end;
  try
    EMetaQuinzena1.Enabled        :=Habilitar;
  except
  end;
  try
    EMetaQuinzena2.Enabled        :=Habilitar;
  except
  end;
  try
    EObservacao.Enabled        :=Habilitar;
  except
  end;
end;

procedure TCentroCusto.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TCentroCusto.CarregaDados;
begin
  Try
    ECodigoCNC.Text           :=IntToStr(CodigoCNC);
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
    ECGC.Text                 :=CGC;
  except
  end;
  try
    EIE.Text                  :=IE;
  except
  end;
  try
    EIP.Text                  :=IP;
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
    EEMail.Text               :=EMail;
  except
  end;
  try
    ESite.Text                :=Site;
  except
  end;
  try
    ERecebeDados.Checked      := RecebeDados;
  except
  end;
  try
    EMetaQuinzena1.Text      := format('%.2f',[MetaQuinzena1]);
  except
  end;
  try
    EMetaQuinzena2.Text      := format('%.2f',[MetaQuinzena2]);
  except
  end;
  try
    EObservacao.Text                :=Observacao;
  except
  end;
end;

constructor TCentroCusto.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CENTRO_DE_CUSTO';

     { Code to perform other tasks when the component is created }

end;

function TCentroCusto.Deletar(CdCNC: Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        GeraLog(270,CdCNC,CdCNC);
        RegistrarDel(CdCNC,1220,CdCNC);
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCentroCusto.Destroy;
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

function TCentroCusto.FinalizaEdicao:Boolean;
var
  aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem:='';
  if Trim(ERazaoSocial.Text) = '' then
    mensagem := mensagem + 'Razão Social inválida!'+#13;
  if not VerificaInteiroBranco(ELogradouro.KeyValue) then
    mensagem := mensagem + 'Logradouro inválido!'+#13;
  if Trim(EEndereco.Text) = '' then
    mensagem := mensagem + 'Endereço inválido!'+#13;
  if Trim(ECidade.Text) = '' then
    mensagem := mensagem + 'Cidade inválida!'+#13;
  if (EUF.ItemIndex < 0) then
    mensagem := mensagem + 'Unidade Federativa inválida!'+#13;
  if not VerificaInteiro(EIE.Text) then
    if (upperCase(EIE.Text[1]) <> 'P') or
       (not VerificaInteiro(Copy(EIE.Text,2,Length(EIE.Text)-1))) then
      mensagem := mensagem + 'CGF/RG inválido'+#13;
  if (EIE.Text <> '') and
     (not VerificaCGFBranco(EIE.Text,EUF.Text)) then
    Exit;  //A menssagem será exibida pela função
  if not VerificaCPFCNPJ(ECGC.Text) then
    mensagem := mensagem + 'CNPJ/CPF inválido!'+#13;
{  if not VerificaFloatBranco(EMetaQuinzena1.Text) then
    mensagem := mensagem + 'Meta da Primeira quinzena inválida!'+#13;
  if not VerificaFloatBranco(EMetaQuinzena2.Text) then
    mensagem := mensagem + 'Meta da Segunda quinzena inválida!'+#13;}
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
        close;
        open;
        Estado:=0;
        AtualizaControles(False);
        Result := True;
      end;
    end
    else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Close;
        Open;
        Estado:=0;
        AtualizaControles(False);
        Result:=True;
      end;
    end;
    AfterScroll:=Aux;
  End;
end;

{ Insere um Centro de Custo }
function TCentroCusto.Inserir(CdCNC,PLogradouro: integer; RZ_SOCIAL,NOME_FAN,PCGC,PIE,PEndereco,PBairro,PCidade,PUF,PCEP,PFone,PFax:String):boolean;
Var
  Cod:Integer;
begin
  Result := False;
  if CdCNC=0 then
    Cod    := ProximoCodigo('CNC_CODIGO_ULT')
  else
    Cod    := CdCNC;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  else
  begin
   try
      INSERT;
      CodigoCNC      := Cod;
      RazaoSocial    := RZ_SOCIAL;
      NomeFantasia   := NOME_FAN;
      CGC            := PCGC;
      IE             := PIE;
      Logradouro     := PLogradouro;
      Endereco       := PEndereco;
      Bairro         := PBairro;
      Cidade         := PCidade;
      Uf             := PUF;
      CEP            := PCEP;
      Fone           := PFone;
      Fax            := PFax;
      RecebeDados    := True;
      MetaQuinzena1  := 0;
      MetaQuinzena2  := 0;

      try
        Post;
        result:=true;

      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TCentroCusto.InserirAuto:Boolean;
begin
  result:=false;
  If (localizarCod(SCodigo)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  begin
    try
      append;
      try
        CodigoCNC := SCodigo;
      except
      end;
      try
         RazaoSocial  := ERazaoSocial.Text;
      except
      end;
      try
         NomeFantasia := ENomeFantasia.Text;
      except
      end;
      try
         CGC := ECGC.Text;
      except
      end;
      try
         IE  := EIE.Text;
      except
      end;
      try
         IP  := EIP.Text;
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
      except
      end;
      try
         Fax := EFAX.Text;
      except
      end;
      try
         EMail := EEMail.Text;
      except
      end;
      try
         Site := ESite.Text;
      except
      end;
      try
         RecebeDados := ERecebeDados.Checked;
      except
      end;
      try
         MetaQuinzena1 := StrToFloat(EMetaQuinzena1.Text);
      except
      end;
      try
         MetaQuinzena2 := StrToFloat(EMetaQuinzena2.Text);
      except
      end;
      try
         Observacao := EObservacao.Text;
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
end;

procedure TCentroCusto.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoCNC.Clear;
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
    ECGC.Clear;
  except
  end;
  try
    EIE.Clear;
  except
  end;
  try
    EIP.Clear;
  except
  end;
  try
    ELogradouro.KeyValue:=0;
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
    if Estado <> 1 then
      EUF.ItemIndex := -1
    else
      ItemComboBox(EUF,CConfiguracao.UF);
  except
  end;
  try
    EEMail.Clear;
  except
  end;
  try
    ESite.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ERecebeDados.Checked := False
    else
      ERecebeDados.Checked := True;
  except
  end;
  try
    if Estado <> 1 then
      EMetaQuinzena1.clear
    else
      EMetaQuinzena1.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EMetaQuinzena2.clear
    else
      EMetaQuinzena2.Text := '0,00';
  except
  end;
  try
    EObservacao.Clear;
  except
  end;
end;

{ Localiza um centro de custo }
function TCentroCusto.LocalizarCod(cdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO', CDCNC, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TCentroCusto.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>NomeFantasia Then
    If locate('CNC_NOME_FAN',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCentroCusto.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TCentroCusto.PreparaInsercao;
begin
  ProximoCodigo('CNC_CODIGO_ULT');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TCentroCusto.deletarauto:Boolean;
var
  CdCNC: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    if Delete then
    Begin
      result:=true;
      GeraLog(270,CdCNC,CdCNC);
      RegistrarDel(CdCNC,1220,CdCNC);
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
