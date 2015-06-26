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
unit SubGrupo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Dbgrids, Windows, Funcoes, Variants;

type
  TSubGrupo = class(TSQuery)
    private
      { Private fields of TSubGrupo }
        { Storage for property BaseChave }
        FBaseChave : String;
        { Storage for property CodigoGRP }
        FCodigoGRP : Integer;
        { Storage for property CodigoSGP }
        FCodigoSGP : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property EBaseChave }
        FEBaseChave : TEdit;
        { Storage for property ECodigoGRP }
        FECodigoGRP : TDBLookupComboBox;
        { Storage for property ECodigoSGP }
        FECodigoSGP : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EEixos }
        FEEixos : TEdit;
        { Storage for property EFabricar }
        FEFabricar : TCheckBox;
        { Storage for property EFamilia }
        FEFamilia : TEdit;
        { Storage for property EIndiceRefracao }
        FEIndiceRefracao : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property EPrecoDolar }
        FEPrecoDolar : TCheckBox;
        { Storage for property EServicoObrigatorio }
        FEServicoObrigatorio : TCheckBox;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Eixos }
        FEixos : String;
        { Storage for property Fabricar }
        FFabricar : Boolean;
        { Storage for property Familia }
        FFamilia : String;
        { Storage for property IndiceRefracao }
        FIndiceRefracao : Double;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property PrecoDolar }
        FPrecoDolar : Boolean;
        { Storage for property ServicoObrigatorio }
        FServicoObrigatorio : Boolean;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TSubGrupo }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property BaseChave }
        function GetBaseChave : String;
        { Write method for property BaseChave }
        procedure SetBaseChave(Value : String);
        { Read method for property CodigoGRP }
        function GetCodigoGRP : Integer;
        { Write method for property CodigoGRP }
        procedure SetCodigoGRP(Value : Integer);
        { Read method for property CodigoSGP }
        function GetCodigoSGP : Integer;
        { Write method for property CodigoSGP }
        procedure SetCodigoSGP(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Eixos }
        function GetEixos : String;
        { Write method for property Eixos }
        procedure SetEixos(Value : String);
        { Read method for property Fabricar }
        function GetFabricar : Boolean;
        { Write method for property Fabricar }
        procedure SetFabricar(Value : Boolean);
        { Read method for property Familia }
        function GetFamilia : String;
        { Write method for property Familia }
        procedure SetFamilia(Value : String);
        { Read method for property IndiceRefracao }
        function GetIndiceRefracao : Double;
        { Write method for property IndiceRefracao }
        procedure SetIndiceRefracao(Value : Double);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property PrecoDolar }
        function GetPrecoDolar : Boolean;
        { Write method for property PrecoDolar }
        procedure SetPrecoDolar(Value : Boolean);
        { Read method for property ServicoObrigatorio }
        function GetServicoObrigatorio : Boolean;
        { Write method for property ServicoObrigatorio }
        procedure SetServicoObrigatorio(Value : Boolean);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TSubGrupo }

      { Protected methods of TSubGrupo }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TSubGrupo }

      { Public methods of TSubGrupo }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdSGP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um SubGrupo }
        function Inserir(CdCNC,CdSGP,CdGRP: integer; PDescricao, POBS, PBaseChave, PFamilia: String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdSGP:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TSubGrupo }
        property BaseChave : String read GetBaseChave write SetBaseChave;
        property CodigoGRP : Integer read GetCodigoGRP write SetCodigoGRP;
        { Código do Grupo }
        property CodigoSGP : Integer read GetCodigoSGP write SetCodigoSGP;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property EBaseChave : TEdit read FEBaseChave write FEBaseChave;
        property ECodigoGRP : TDBLookupComboBox
             read FECodigoGRP write FECodigoGRP;
        property ECodigoSGP : TEdit read FECodigoSGP write FECodigoSGP;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EEixos : TEdit read FEEixos write FEEixos;
        property EFabricar : TCheckBox read FEFabricar write FEFabricar;
        property EFamilia : TEdit read FEFamilia write FEFamilia;
        property EIndiceRefracao : TEdit
             read FEIndiceRefracao write FEIndiceRefracao;
        property EOBS : TMemo read FEOBS write FEOBS;
        property EPrecoDolar : TCheckBox read FEPrecoDolar write FEPrecoDolar;
        property EServicoObrigatorio : TCheckBox
             read FEServicoObrigatorio write FEServicoObrigatorio;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Eixos : String read GetEixos write SetEixos;
        property Fabricar : Boolean read GetFabricar write SetFabricar;
        property Familia : String read GetFamilia write SetFamilia;
        property IndiceRefracao : Double
             read GetIndiceRefracao write SetIndiceRefracao;
        property OBS : String read GetOBS write SetOBS;
        property PrecoDolar : Boolean read GetPrecoDolar write SetPrecoDolar;
        property ServicoObrigatorio : Boolean
             read GetServicoObrigatorio write SetServicoObrigatorio;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TSubGrupo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TSubGrupo]);
end;

{ Method to set variable and property values and create objects }
procedure TSubGrupo.AutoInitialize;
begin
     FEBaseChave := nil;
     FECodigoGRP := nil;
     FECodigoSGP := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
     FEEixos := nil;
     FEFabricar := nil;
     FEFamilia := nil;
     FEIndiceRefracao := nil;
     FEOBS := nil;
     FEPrecoDolar := nil;
     FEServicoObrigatorio := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TSubGrupo.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBaseChave then
        FEBaseChave := nil;
     if AComponent = FECodigoGRP then
        FECodigoGRP := nil;
     if AComponent = FECodigoSGP then
        FECodigoSGP := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEEixos then
        FEEixos := nil;
     if AComponent = FEFabricar then
        FEFabricar := nil;
     if AComponent = FEFamilia then
        FEFamilia := nil;
     if AComponent = FEIndiceRefracao then
        FEIndiceRefracao := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEPrecoDolar then
        FEPrecoDolar := nil;
     if AComponent = FEServicoObrigatorio then
        FEServicoObrigatorio := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TSubGrupo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property BaseChave }
function TSubGrupo.GetBaseChave : String;
begin
  try
    Result := Self.fieldByName('SGP_BASE_CHAVE').asString;
  except
    result:= '';
  end;
end;

{ Write method for property BaseChave }
procedure TSubGrupo.SetBaseChave(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_BASE_CHAVE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_BASE_CHAVE"!');
  end;
end;

{ Read method for property CodigoGRP }
function TSubGrupo.GetCodigoGRP : Integer;
begin
  try
    Result := Self.fieldByName('GRP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoGRP }
procedure TSubGrupo.SetCodigoGRP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('GRP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "GRP_CODIGO"!');
    end;
end;

{ Read method for property CodigoSGP }
function TSubGrupo.GetCodigoSGP : Integer;
begin
  try
    Result := Self.fieldByName('SGP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoSGP }
procedure TSubGrupo.SetCodigoSGP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SGP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SGP_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TSubGrupo.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('SGP_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TSubGrupo.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SGP_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SGP_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TSubGrupo.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('SGP_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TSubGrupo.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SGP_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SGP_DT_CADASTRO"!');
    end;
end;

{ Read method for property Descricao }
function TSubGrupo.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('SGP_DESCRICAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Descricao }
procedure TSubGrupo.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_DESCRICAO"!');
  end;
end;

{ Read method for property Eixos }
function TSubGrupo.GetEixos : String;
begin
  try
    Result := Self.fieldByName('SGP_EIXOS').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Eixos }
procedure TSubGrupo.SetEixos(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_EIXOS').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_EIXOS"!');
  end;
end;

{ Read method for property Fabricar }
function TSubGrupo.GetFabricar : Boolean;
begin
  try
    Result := (Self.fieldByName('SGP_FABRICAR').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property Fabricar }
procedure TSubGrupo.SetFabricar(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('SGP_FABRICAR').asInteger := 1
      else
        Self.fieldByName('SGP_FABRICAR').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "SGP_FABRICAR"!');
    end;
end;

{ Read method for property Familia }
function TSubGrupo.GetFamilia : String;
begin
  try
    Result := Self.fieldByName('SGP_FAMILIA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Familia }
procedure TSubGrupo.SetFamilia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_FAMILIA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_FAMILIA"!');
  end;
end;

{ Read method for property IndiceRefracao }
function TSubGrupo.GetIndiceRefracao : Double;
begin
  try
    Result := Self.fieldByName('SGP_INDICE_REFRACAO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property IndiceRefracao }
procedure TSubGrupo.SetIndiceRefracao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_INDICE_REFRACAO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_INDICE_REFRACAO"!');
  end;
end;

{ Read method for property OBS }
function TSubGrupo.GetOBS : String;
begin
  try
    Result := Self.fieldByName('SGP_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TSubGrupo.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_OBSERVACAO"!');
  end;
end;

{ Read method for property PrecoDolar }
function TSubGrupo.GetPrecoDolar : Boolean;
begin
  try
    Result := (Self.fieldByName('SGP_PRECO_DOLAR').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property PrecoDolar }
procedure TSubGrupo.SetPrecoDolar(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('SGP_PRECO_DOLAR').asInteger := 1
      else
        Self.fieldByName('SGP_PRECO_DOLAR').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "SGP_PRECO_DOLAR"!');
    end;
end;

{ Read method for property ServicoObrigatorio }
function TSubGrupo.GetServicoObrigatorio : Boolean;
begin
  try
    Result := (Self.fieldByName('SGP_SERVICO_OBRIGATORIO').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property ServicoObrigatorio }
procedure TSubGrupo.SetServicoObrigatorio(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('SGP_SERVICO_OBRIGATORIO').asInteger := 1
      else
        Self.fieldByName('SGP_SERVICO_OBRIGATORIO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "SGP_SERVICO_OBRIGATORIO"!');
    end;
end;

{ Read method for property Situacao }
function TSubGrupo.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('SGP_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TSubGrupo.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SGP_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SGP_SITUACAO"!');
    end;
end;

function TSubGrupo.AlterarAuto:Boolean;
var
  CdCNC, CdSGP: integer;
  sDetalhes: string;
begin
  Result:=false;
  CdCNC := CodigoCNC;
  CdSGP := CodigoSGP;
  sDetalhes := '';
  try
    edit;
    try
      CodigoGRP    :=  ECodigoGRP.KeyValue;
      sDetalhes := sDetalhes + 'GRP:'+IntToStr(ECodigoGRP.KeyValue);
    except
    end;
    try
      CodigoUSU    :=  CConfiguracao.CodigoUSU;
    except
    end;
    try
      Descricao    := EDescricao.Text;
      sDetalhes := sDetalhes + ' Desc:'+EDescricao.Text;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      BaseChave    := EBaseChave.Text;
      sDetalhes := sDetalhes + ' Base:'+EBaseChave.Text;
    except
    end;
    try
      Eixos    := EEixos.Text;
      sDetalhes := sDetalhes + ' Eixos:'+EEixos.Text;
    except
    end;
    try
      Familia      := EFamilia.Text;
      sDetalhes := sDetalhes + ' Familia:'+EFamilia.Text;
    except
    end;
    try
      IndiceRefracao := StrToFloat(EIndiceRefracao.Text);
      sDetalhes := sDetalhes + ' IndRef:'+EIndiceRefracao.Text;
    except
    end;
    try
      Fabricar    := EFabricar.Checked;
      if EFabricar.Checked then
        sDetalhes := sDetalhes+' Fab:S'
      else
        sDetalhes := sDetalhes+' Fab:N';
    except
    end;
    try
      PrecoDolar    := EPrecoDolar.Checked;
      if EPrecoDolar.Checked then
        sDetalhes := sDetalhes+' Dolar:S'
      else
        sDetalhes := sDetalhes+' Dolar:N';
    except
    end;
    try
      ServicoObrigatorio    := EServicoObrigatorio.Checked;
      if EServicoObrigatorio.Checked then
        sDetalhes := sDetalhes+' Obrigatorio'
      else
        sDetalhes := sDetalhes+' NObrigatorio';
    except
    end;    
    try
      Situacao     := ESituacao.ItemIndex;
      sDetalhes := sDetalhes + ' Sit:'+IntToStr(ESituacao.ItemIndex);
    except
    end;
    try
      OBS         := EOBS.Text;
      sDetalhes := sDetalhes + ' Obs:'+EOBS.Text;
    except
    end;
    try
      Post;
      GeraLog(1850, CdCNC, CdSGP, sDetalhes);
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TSubGrupo.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    ECodigoGRP.Enabled     :=not Habilitar;
  except
  end;
  try
    EDescricao.Enabled     :=Habilitar;
  except
  end;
  try
    EBaseChave.Enabled := Habilitar;
  except
  end;
  try
    EEixos.Enabled := Habilitar;
  except
  end;
  try
    EFamilia.Enabled := Habilitar;
  except
  end;
  try
    EIndiceRefracao.Enabled := Habilitar;
  except
  end;
  try
    EFabricar.Enabled := Habilitar;
  except
  end;
  try
    EPrecoDolar.Enabled := Habilitar;
  except
  end;
  try
    ESituacao.Enabled := Habilitar;
  except
  end;
  try
    EOBS.Enabled           :=Habilitar;
  except
  end;
end;

procedure TSubGrupo.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TSubGrupo.CarregaDados;
begin
  try
    ECodigoSGP.Text           :=IntToStr(CodigoSGP);
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
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    EBaseChave.Text            := BaseChave;
  except
  end;
  try
    EEixos.Text            := Eixos;
  except
  end;
  try
    EFamilia.Text              := Familia;
  except
  end;
  try
    EIndiceRefracao.Text       := format('%.4f',[IndiceRefracao]);
  except
  end;
  try
    EFabricar.Checked        := Fabricar;
  except
  end;
  try
    EPrecoDolar.Checked        := PrecoDolar;
  except
  end;
  try
    EServicoObrigatorio.Checked        := ServicoObrigatorio;
  except
  end;  
  try
    ESituacao.ItemIndex        := Situacao;
  except
  end;
  try
    EOBS.Text                  :=OBS;
  except
  end;
end;

constructor TSubGrupo.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'SUBGRUPO';

     { Code to perform other tasks when the component is created }

end;

function TSubGrupo.Deletar(CdSGP:Integer):Boolean;
var
  CdCNC: integer;
begin
  Result := False;
  If not(localizarCod(CdSGP)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      If Delete then
      Begin
        Result := True;
        GeraLog(1840,CdCNC, CdSGP,'47');
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TSubGrupo.Destroy;
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

function TSubGrupo.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem:='';
  if not ECodigoGRP.KeyValue > 0 then
    mensagem:=mensagem+'Grupo inválido!'+#13;
  if EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if not VerificaFloatBranco(EIndiceRefracao.Text) then
    mensagem:=mensagem+'Índice de Refração inválido!'+#13;
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      If Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo);
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoSGP;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=aux;
    CarregaDados;
  end;
end;

{ Insere um SubGrupo }
function TSubGrupo.Inserir(CdCNC,CdSGP,CdGRP: integer; PDescricao, POBS, PBaseChave, PFamilia: String):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdSGP=0 then
    Cod    := ProximoCodigo('SGP_CODIGO')
  else
    Cod    := CdSGP;
  If (CConfiguracao.Empresa <> 3) and (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     Insert;
     try
       CodigoSGP      := Cod;
       CodigoCNC      := CdCNC;
       CodigoGRP      := CdGRP;
       CodigoUSU      := CConfiguracao.CodigoUSU;
       DataCadastro   := CConfiguracao.DataHora;
       Descricao      := PDescricao;
       BaseChave      := PBaseChave;
       Familia        := PFamilia;
       ServicoObrigatorio := False;
       Situacao       := 0;
       OBS            := POBS;
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

function TSubGrupo.InserirAuto:Boolean;
var
  CdCNC, CdSGP: integer;
  sDetalhes: string;
begin
  result:=False;
  CdCNC := CConfiguracao.CodigoCNC;
  CdSGP := SCodigo;
  sDetalhes := '';
  try
    append;
    try
      CodigoSGP   := CdSGP;
    except
    end;
    try
      codigocnc   := CdCNC;
    except
    end;
    try
      CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
       CodigoGRP  :=  ECodigoGRP.KeyValue;
       sDetalhes := sDetalhes + 'GRP:'+IntToStr(ECodigoGRP.KeyValue);
    except
    end;
    try
       Descricao  := EDescricao.Text;
       sDetalhes := sDetalhes + ' Desc:'+EDescricao.Text;
    except
    end;
    try
      BaseChave  := EBaseChave.Text;
      sDetalhes := sDetalhes + ' Base:'+EBaseChave.Text;
    except
    end;
    try
      Eixos  := EEixos.Text;
      sDetalhes := sDetalhes + ' Base:'+EEixos.Text;
    except
    end;
    try
      Familia  := EFamilia.Text;
      sDetalhes := sDetalhes + ' Base:'+EFamilia.Text;
    except
    end;
    try
      IndiceRefracao  := StrToFloat(EIndiceRefracao.Text);
      sDetalhes := sDetalhes + ' IndRef:'+EIndiceRefracao.Text;
    except
    end;
    try
      Fabricar    := EFabricar.Checked;
      if EFabricar.Checked then
        sDetalhes := sDetalhes+' Fab:S'
      else
        sDetalhes := sDetalhes+' Fab:N';
    except
    end;
    try
      PrecoDolar    := EPrecoDolar.Checked;
      if EPrecoDolar.Checked then
        sDetalhes := sDetalhes+' Dolar:S'
      else
        sDetalhes := sDetalhes+' Dolar:N';
    except
    end;
    try
      ServicoObrigatorio    := EServicoObrigatorio.Checked;
      if EServicoObrigatorio.Checked then
        sDetalhes := sDetalhes+' Obrigatorio'
      else
        sDetalhes := sDetalhes+' NObrigatorio';
    except
    end;    
    try
      Situacao  := ESituacao.ItemIndex;
      sDetalhes := sDetalhes + ' Sit:'+IntToStr(ESituacao.ItemIndex);
    except
    end;
    try
      OBS  := EOBS.Text;
      sDetalhes := sDetalhes + ' OBS:'+EOBS.Text;
    except
    end;
    try
      Post;
      GeraLog(1830, CdCNC, CdSGP, sDetalhes);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TSubGrupo.LimpaCampos;
begin
  try
    if estado <> 1 then
      ECodigoSGP.Clear;
  except
  end;
  try
    if estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    EBaseChave.Clear;
  except
  end;
  try
    EEixos.Clear;
  except
  end;
  try
    EFamilia.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EIndiceRefracao.Clear
    else
      EIndiceRefracao.Text := '0,00';
  except
  end;
  try
    EFabricar.Checked := False;
  except
  end;
  try
    EPrecoDolar.Checked := False;
  except
  end;
  try
    EServicoObrigatorio.Checked := False;
  except
  end;  
  try
    if Estado <> 1 then
      ESituacao.itemIndex := -1
    else
      ESituacao.itemIndex := 0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

{ Localiza um Grupo }
function TSubGrupo.LocalizarCod(CdSGP:Integer):Boolean;
begin
  If (CdSGP<>CodigoSGP) Then
    If locate('SGP_CODIGO', CdSGP, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TSubGrupo.LocalizarNome(Nome:String):Boolean;
begin
  If Nome<>Descricao Then
    If locate('SGP_DESCRICAO',Nome, [loCaseInsensitive, loPartialKey]) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TSubGrupo.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TSubGrupo.PreparaInsercao;
begin
  ProximoCodigo('SGP_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TSubGrupo.deletarauto:Boolean;
var
  CdCNC, CdSGP: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdSGP := CodigoSGP;
    if Delete then
    Begin
      result:=true;
      GeraLog(1840,CdCNC, CdSGP,'47');
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
