////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: PSACI                                                //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: PSACI                                                //
// UNIT................: Cadastro de Agencias                                 //
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
unit Agencia;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Funcoes, Variants, DBCtrls;

type
  TAgencia = class(TSQuery)
  private
    FBairro : String;
    FCEP : String;
    FCidade : String;
    FCodigoAGN : Integer;
    FCodigoBNC : Integer;
    FContato : String;
    FDataAlterado : TDateTime;
    FDataCadastro : TDateTime;
    FEBairro : TEdit;
    FECep : TMaskEdit;
    FECidade : TEdit;
    FECodigoAGN : TEdit;
    FEContato : TEdit;
    FEDataAlterado : TMaskEdit;
    FEDataCadastro : TMaskEdit;
    FEEndereco : TEdit;
    FEFax : TMaskEdit;
    FEFone : TMaskEdit;
    FELogradouro : TDBLookUpComboBox;
    FENome : TEdit;
    FENumeroAgencia : TEdit;
    FENumeroBanco : TDBLookUpComboBox;
    FEUF : TComboBox;
    FEndereco : String;
    FFax : String;
    FFone : String;
    FLogradouro : Integer;
    FNome : String;
    FNumeroAgencia : Integer;
    FNumeroBanco : Integer;
    FUF : String;
    procedure AutoInitialize;
    procedure AutoDestroy;
    function GetBairro : String;
    procedure SetBairro(Value : String);
    function GetCEP : String;
    procedure SetCEP(Value : String);
    function GetCidade : String;
    procedure SetCidade(Value : String);
    function GetCodigoAGN : Integer;
    procedure SetCodigoAGN(Value : Integer);
    function GetCodigoBNC : Integer;
    procedure SetCodigoBNC(Value : Integer);
    function GetContato : String;
    procedure SetContato(Value : String);
    function GetDataAlterado : TDateTime;
    procedure SetDataAlterado(Value : TDateTime);
    function GetDataCadastro : TDateTime;
    procedure SetDataCadastro(Value : TDateTime);
    function GetEndereco : String;
    procedure SetEndereco(Value : String);
    function GetFax : String;
    procedure SetFax(Value : String);
    function GetFone : String;
    procedure SetFone(Value : String);
    function GetLogradouro : Integer;
    procedure SetLogradouro(Value : Integer);
    function GetNome : String;
    procedure SetNome(Value : String);
    function GetNumeroAgencia : Integer;
    procedure SetNumeroAgencia(Value : Integer);
    function GetNumeroBanco : Integer;
    procedure SetNumeroBanco(Value : Integer);
    function GetUF : String;
    procedure SetUF(Value : String);
  protected
    procedure Notification(AComponent : TComponent; Operation : TOperation); override;
  public
    function AlterarAuto:Boolean;
    procedure AtualizaControles(Habilitar:Boolean);
    procedure CancelaEdicao;
    procedure CarregaDados;
    constructor Create(AOwner: TComponent); override;
    function Deletar(CdCNC,PNumero:Integer):Boolean;
    destructor Destroy; override;
    function FinalizaEdicao:Boolean;
    function Inserir1(CdCNC,CdAGN,PNumeroAgencia,PNumeroBanco,PLOGRADOURO: integer; PNOME,PContato,PENDERECO,PBAIRRO,PCIDADE,PUF,PCEP,PFONE,PFAX:String):Boolean;
    function InserirAuto:Boolean;
    procedure LimpaCampos;
    function LocalizarCod(CdAGN,CdCNC:integer):boolean;
    function LocalizarNome(Numero,CDCNC:Integer):Boolean;
    function Localizarnumero(Numero,CDCNC:Integer):Boolean;
    procedure PreparaAlteracao;
    procedure PreparaInsercao;
    function deletarauto:Boolean;
  published
    property Bairro : String read GetBairro write SetBairro;
    property CEP : String read GetCEP write SetCEP;
    property Cidade : String read GetCidade write SetCidade;
    property CodigoAGN : Integer read GetCodigoAGN write SetCodigoAGN;
    property CodigoBNC : Integer read GetCodigoBNC write SetCodigoBNC;
    property Contato : String read GetContato write SetContato;
    property DataAlterado : TDateTime read GetDataAlterado write SetDataAlterado;
    property DataCadastro : TDateTime read GetDataCadastro write SetDataCadastro;
    property EBairro : TEdit read FEBairro write FEBairro;
    property ECep : TMaskEdit read FECep write FECep;
    property ECidade : TEdit read FECidade write FECidade;
    property ECodigoAGN : TEdit read FECodigoAGN write FECodigoAGN;
    property EContato : TEdit read FEContato write FEContato;
    property EDataAlterado : TMaskEdit read FEDataAlterado write FEDataAlterado;
    property EDataCadastro : TMaskEdit read FEDataCadastro write FEDataCadastro;
    property EEndereco : TEdit read FEEndereco write FEEndereco;
    property EFax : TMaskEdit read FEFax write FEFax;
    property EFone : TMaskEdit read FEFone write FEFone;
    property ELogradouro : TDBLookUpComboBox read FELogradouro write FELogradouro;
    property ENome : TEdit read FENome write FENome;
    property ENumeroAgencia : TEdit read FENumeroAgencia write FENumeroAgencia;
    property ENumeroBanco : TDBLookUpComboBox read FENumeroBanco write FENumeroBanco;
    property EUF : TComboBox read FEUF write FEUF;
    property Endereco : String read GetEndereco write SetEndereco;
    property Fax : String read GetFax write SetFax;
    property Fone : String read GetFone write SetFone;
    property Logradouro : Integer read GetLogradouro write SetLogradouro;
    property Nome : String read GetNome write SetNome;
    property NumeroAgencia : Integer read GetNumeroAgencia write SetNumeroAgencia;
    property NumeroBanco : Integer read GetNumeroBanco write SetNumeroBanco;
    property UF : String read GetUF write SetUF;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Softech', [TAgencia]);
end;

procedure TAgencia.AutoInitialize;
begin
  FEBairro := nil;
  FECep := nil;
  FECidade := nil;
  FECodigoAGN := nil;
  FEContato := nil;
  FEDataAlterado := nil;
  FEDataCadastro := nil;
  FEEndereco := nil;
  FEFax := nil;
  FEFone := nil;
  FELogradouro := nil;
  FENome := nil;
  FENumeroAgencia := nil;
  FENumeroBanco := nil;
  FEUF := nil;
end;

procedure TAgencia.Notification(AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation <> opRemove then
    Exit;
  if AComponent = FEBairro then
    FEBairro := nil;
  if AComponent = FECep then
    FECep := nil;
  if AComponent = FECidade then
    FECidade := nil;
  if AComponent = FECodigoAGN then
    FECodigoAGN := nil;
  if AComponent = FEContato then
    FEContato := nil;
  if AComponent = FEDataAlterado then
    FEDataAlterado := nil;
  if AComponent = FEDataCadastro then
    FEDataCadastro := nil;
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
  if AComponent = FENumeroAgencia then
    FENumeroAgencia := nil;
  if AComponent = FENumeroBanco then
    FENumeroBanco := nil;
  if AComponent = FEUF then
    FEUF := nil;
end;

procedure TAgencia.AutoDestroy;
begin
end;

function TAgencia.GetBairro : String;
begin
  try
    Result := Self.fieldByName('AGN_BAIRRO').asString;
  except
    result:= ''
  end;
end;

procedure TAgencia.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_BAIRRO"!');
  end;
end;

function TAgencia.GetCEP : String;
begin
  try
    Result := Self.fieldByName('AGN_CEP').asString;
  except
    result:= ''
  end;
end;

procedure TAgencia.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_CEP"!');
  end;
end;

function TAgencia.GetCidade : String;
begin
  try
    Result := Self.fieldByName('AGN_CIDADE').asString;
  except
    result:= ''
  end;
end;

procedure TAgencia.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_CIDADE"!');
  end;
end;

function TAgencia.GetCodigoAGN : Integer;
begin
  try
    Result := Self.fieldByName('AGN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

procedure TAgencia.SetCodigoAGN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGN_CODIGO"!');
    end;
end;

function TAgencia.GetCodigoBNC : Integer;
begin
  try
    Result := Self.fieldByName('BNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

procedure TAgencia.SetCodigoBNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BNC_CODIGO"!');
    end;
end;

function TAgencia.GetContato : String;
begin
  try
    Result := Self.fieldByName('AGN_CONTATO').asString;
  except
    result:= ''
  end;
end;

procedure TAgencia.SetContato(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_CONTATO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_CONTATO"!');
  end;
end;

function TAgencia.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('AGN_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

procedure TAgencia.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_DT_ALTERADO"!');
  end;
end;

function TAgencia.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('AGN_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

procedure TAgencia.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_DT_CADASTRO"!');
  end;
end;

function TAgencia.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('AGN_ENDERECO').asString;
  except
    result:= ''
  end;
end;

procedure TAgencia.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_ENDERECO"!');
  end;
end;

function TAgencia.GetFax : String;
begin
  try
    Result := Self.fieldByName('AGN_FAX').asString;
  except
    result:= ''
  end;
end;

procedure TAgencia.SetFax(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_FAX').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_FAX"!');
  end;
end;

function TAgencia.GetFone : String;
begin
  try
    Result := Self.fieldByName('AGN_FONE').asString;
  except
    result:= ''
  end;
end;

procedure TAgencia.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_FONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_FONE"!');
  end;
end;

function TAgencia.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('AGN_LOGRADOURO').asInteger;
  except
    result:= 0;
  end;
end;

procedure TAgencia.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_LOGRADOURO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_LOGRADOURO"!');
  end;
end;

function TAgencia.GetNome : String;
begin
  try
    Result := Self.fieldByName('AGN_NOME').asString;
  except
    result:= ''
  end;
end;

procedure TAgencia.SetNome(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_NOME').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_NOME"!');
  end;
end;

function TAgencia.GetNumeroAgencia : Integer;
begin
  try
    Result := Self.fieldByName('AGN_NUMERO').asInteger;
  except
    result:= 0
  end;
end;

procedure TAgencia.SetNumeroAgencia(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGN_NUMERO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGN_NUMERO"!');
    end;
end;

function TAgencia.GetNumeroBanco : Integer;
begin
  try
    Result := Self.fieldByName('BNC_NUMERO').asInteger;
  except
    result:= 0
  end;
end;

procedure TAgencia.SetNumeroBanco(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BNC_NUMERO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BNC_NUMERO"!');
    end;
end;

function TAgencia.GetUF : String;
begin
  try
    Result := Self.fieldByName('AGN_UF').asString;
  except
    result:= ''
  end;
end;

procedure TAgencia.SetUF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGN_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGN_UF"!');
  end;
end;

function TAgencia.AlterarAuto:Boolean;
begin
  try
    edit;
    try
      CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado  := CConfiguracao.DataHora;
    except
    end;
    try
      NumeroAgencia  := StrToInt(ENumeroAgencia.text);
    except
    end;
    try
      Contato   := EContato.text;
    except
    end;
    try
      NumeroBanco := EnumeroBanco.KeyValue;
    except
    end;
    try
      Nome  := ENome.Text;
    except
    end;
    try
      Logradouro := ELogradouro.KeyValue;
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
      Fax := EFax.text;
    except
    end;
    try
      Post;
      Alterarauto:=True;
    except
      Alterarauto:=False;
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    Alterarauto:=false;
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TAgencia.AtualizaControles(Habilitar:Boolean);
begin
Try
   ENumeroAgencia.Enabled    :=Habilitar;
  except
  end;
  Try
   EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
   ENumeroBanco.Enabled      :=not Habilitar;
  except
  end;
  try
   EContato.Enabled          :=Habilitar;
  except
  end;
  try
   ENome.Enabled             :=Habilitar;
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
end;

procedure TAgencia.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if not isEmpty then
    CarregaDados
  else
    LimpaCampos;
end;

procedure TAgencia.CarregaDados;
begin
  Try
    if DataCadastro > 0 then
      EDataCadastro.Text :=formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  Try
    if DataAlterado > 0 then
      EDataAlterado.Text :=formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  Try
    ENumeroAgencia.Text       :=IntToStr(NumeroAgencia);
  except
  end;
//  try
//    EnumeroBanco.KeyValue     :=NumeroBanco;
//  except
//  end;
  try
    EContato.text             :=Contato;
  except
  end;
  try
    ENome.Text                :=Nome;
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
    EFax.text                 :=Fax;
  except
  end;
end;

constructor TAgencia.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     AutoInitialize;
end;

function TAgencia.Deletar(CdCNC,PNumero:Integer):Boolean;
var
  CdAGN: integer;
begin
  Result := False;
  If not(localizarNumero(PNumero,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdAGN := CodigoAGN;
      if Delete then
      Begin
        Result := True;
        GeraLog(670,CdCNC,CdAGN,'Agência: '+IntToStr(PNumero));
        RegistrarDel(CdCNC,1130(*Agencia*),CdAGN,'Agência: '+IntToStr(PNumero));
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TAgencia.Destroy;
begin
     AutoDestroy;
     inherited Destroy;
end;

function TAgencia.FinalizaEdicao:Boolean;
var
  Numero, cdcnc:Integer;
  menssagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  menssagem:='';
  if not VerificaInteiroBranco(ENumeroAgencia.text) then
    menssagem:=menssagem+'Número da Agência digitado incorretamente ou vazio!';
  if Trim(ENome.text) = '' then
    menssagem:=menssagem+'Nome da agência inválido!';
  if menssagem<>'' then
    ShowMessage(menssagem)
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
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      Numero:=NumeroAgencia;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarNumero(Numero, cdcnc);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TAgencia.Inserir1(CdCNC,CdAGN,PNumeroAgencia,PNumeroBanco,PLOGRADOURO: integer; PNOME,PContato,PENDERECO,PBAIRRO,PCIDADE,PUF,PCEP,PFONE,PFAX:String):Boolean;
Var
  Cod:Integer;
begin
  if CdAGN=0 then
    Cod    := ProximoCodigo('AGN_CODIGO')
  else
    Cod    := CdAGN;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
    try
        Insert;
        CodigoAGN      := Cod;
        CodigoUSU      := CConfiguracao.CodigoUSU;
        DataCadastro   := CConfiguracao.DataHora;
        NumeroAgencia  := PNumeroAgencia;
        CodigoCNC      := CdCNC;
        Contato        := PContato;
        NumeroBanco    := PNumeroBanco;
        Nome           := PNOME;
        Logradouro     := PLOGRADOURO;
        Endereco       := PENDERECO;
        Bairro         := PBAIRRO;
        Cidade         := PCIDADE;
        Uf             := PUF;
        CEP            := PCEP;
        Fone           := PFONE;
        Fax            := PFax;

        try
          Post;
          Result := True;
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

function TAgencia.InserirAuto:Boolean;
begin
  If (localizarCod(SCodigo,CodigoCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false;
  end
  Else
  begin
    If localizarNumero(StrToInt(ENumeroAgencia.text),CConfiguracao.CodigoCNC) Then
    Begin
      ShowMessage('Não foi possível incluir o registro corrente pois ele já existe!');
      Result := False;
    end
    Else
      try
        append;
        try
          codigocnc := CConfiguracao.CodigoCNC;
        except
        end;
        try
          codigoAGN := SCodigo;
        except
        end;
        try
          CodigoUSU  := CConfiguracao.CodigoUSU;
        except
        end;
        try
          DataCadastro  := CConfiguracao.DataHora;
        except
        end;
        try
          NumeroBanco := EnumeroBanco.KeyValue;
        except
        end;
        try
          NumeroAgencia := StrToInt(ENumeroAgencia.Text);
        except
        end;
        try
          contato  :=   EContato.text;
        except
        end;
        try
           Nome      := ENome.Text;
        except
        end;
        try
           Logradouro:= ELogradouro.KeyValue;
        except
        end;
        try
           Endereco  := EEndereco.Text;
        except
        end;
        try
           Bairro    := EBairro.Text;
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
           Fax := EFax.text;
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
        ShowMessage('Não foi possível incluir registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
      end;
  end;
end;

procedure TAgencia.LimpaCampos;
begin
  try
    ENumeroAgencia.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text  := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    ELogradouro.KeyValue := 0;
  except
  end;
  try
    EContato.Clear;
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
    if Estado <> 1 then
      ECidade.Clear
    else
      ECidade.Text := CConfiguracao.Cidade;
  except
  end;
  try
    if Estado <> 1 then
      EUf.ItemIndex := -1
    else
      ItemComboBox(EUf,CConfiguracao.UF);
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
end;

function TAgencia.LocalizarCod(CdAGN,CdCNC:integer):boolean;
begin
  If (CdAGN<>CodigoAGN) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;AGN_CODIGO', vararrayof([CDCNC, CdAGN]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TAgencia.LocalizarNome(Numero,CDCNC:Integer):Boolean;
Begin
  If (Numero<>NumeroAgencia) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;AGN_NUMERO', vararrayof([CDCNC, Numero]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TAgencia.Localizarnumero(Numero,CDCNC:Integer):Boolean;
begin
  If (Numero<>NumeroAgencia) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;AGN_NUMERO', vararrayof([CDCNC, Numero]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TAgencia.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;

end;

procedure TAgencia.PreparaInsercao;
begin
  ProximoCodigo('AGN_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TAgencia.deletarauto:Boolean;
var
  CdCNC, CdAGN, Numero:integer;
begin
  result:=false;
  CdCNC:=CodigoCNC;
  CdAGN:=CodigoAGN;
  Numero:=NumeroAgencia;
  try
    if Delete then
    Begin
      result:=true;
      GeraLog(670,CdCNC,CdAGN,'Agência: '+IntToStr(Numero));
      RegistrarDel(CdCNC,1130(*Agencia*),CdAGN,'Agência: '+IntToStr(Numero));
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
