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
unit Profissao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Funcoes;

type
  TProfissao = class(TSQuery)
    private
      { Private fields of TProfissao }
        { Storage for property CodigoPRF }
        FCodigoPRF : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoPRF }
        FECodigoPRF : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property ESalarioFIM }
        FESalarioFIM : TEdit;
        { Storage for property ESalarioINI }
        FESalarioINI : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property SalarioFIM }
        FSalarioFIM : Double;
        { Storage for property SalarioINI }
        FSalarioINI : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TProfissao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoPRF }
        function GetCodigoPRF : Integer;
        { Write method for property CodigoPRF }
        procedure SetCodigoPRF(Value : Integer);
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
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property SalarioFIM }
        function GetSalarioFIM : Double;
        { Write method for property SalarioFIM }
        procedure SetSalarioFIM(Value : Double);
        { Read method for property SalarioINI }
        function GetSalarioINI : Double;
        { Write method for property SalarioINI }
        procedure SetSalarioINI(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TProfissao }

      { Protected methods of TProfissao }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TProfissao }

      { Public methods of TProfissao }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdPRF:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdPRF:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TProfissao }
        { Código do Profissao }
        property CodigoPRF : Integer read GetCodigoPRF write SetCodigoPRF;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoPRF : TEdit read FECodigoPRF write FECodigoPRF;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EOBS : TEdit read FEOBS write FEOBS;
        property ESalarioFIM : TEdit read FESalarioFIM write FESalarioFIM;
        property ESalarioINI : TEdit read FESalarioINI write FESalarioINI;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property OBS : String read GetOBS write SetOBS;
        property SalarioFIM : Double read GetSalarioFIM write SetSalarioFIM;
        property SalarioINI : Double read GetSalarioINI write SetSalarioINI;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TProfissao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TProfissao]);
end;

{ Method to set variable and property values and create objects }
procedure TProfissao.AutoInitialize;
begin
     FECodigoPRF := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDescricao := nil;
     FEOBS := nil;
     FESalarioFIM := nil;
     FESalarioINI := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TProfissao.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoPRF then
        FECodigoPRF := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESalarioFIM then
        FESalarioFIM := nil;
     if AComponent = FESalarioINI then
        FESalarioINI := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TProfissao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoPRF }
function TProfissao.GetCodigoPRF : Integer;
begin
  try
    Result := Self.fieldByName('PRF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPRF }
procedure TProfissao.SetCodigoPRF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRF_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TProfissao.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('PRF_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TProfissao.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRF_DT_ALTERADO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRF_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TProfissao.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('PRF_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TProfissao.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRF_DT_CADASTRO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRF_DT_CADASTRO"!');
  end;
end;

{ Read method for property Descricao }
function TProfissao.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('PRF_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TProfissao.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRF_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRF_DESCRICAO"!');
  end;
end;

{ Read method for property OBS }
function TProfissao.GetOBS : String;
begin
  try
    Result := Self.fieldByName('PRF_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TProfissao.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRF_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRF_OBSERVACAO"!');
  end;
end;

{ Read method for property SalarioFIM }
function TProfissao.GetSalarioFIM : Double;
begin
  try
    Result := Self.fieldByName('PRF_SALARIO_FIM').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property SalarioFIM }
procedure TProfissao.SetSalarioFIM(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRF_SALARIO_FIM').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRF_SALARIO_FIM"!');
  end;
end;

{ Read method for property SalarioINI }
function TProfissao.GetSalarioINI : Double;
begin
  try
    Result := Self.fieldByName('PRF_SALARIO_INI').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property SalarioINI }
procedure TProfissao.SetSalarioINI(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRF_SALARIO_INI').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRF_SALARIO_INI"!');
  end;
end;

{ Read method for property Situacao }
function TProfissao.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('PRF_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TProfissao.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRF_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRF_SITUACAO"!');
  end;
end;

function TProfissao.AlterarAuto:Boolean;
var
  CdCNC, CdPRF: integer;
  sDetalhes: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdPRF := CodigoPRF;
  sDetalhes := '';
  try
    edit;
    try
      Descricao := EDescricao.Text;
      sDetalhes := sDetalhes+'Desc:'+EDescricao.Text;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      SalarioINI := StrToFloat(ESalarioINI.Text);
      sDetalhes := sDetalhes+' SalINI:'+ESalarioINI.Text;
    except
    end;
    try
      SalarioFIM := StrToFloat(ESalarioFIM.Text);
      sDetalhes := sDetalhes+' SalFIM:'+ESalarioFIM.Text;
    except
    end;
    try
      Situacao     := ESituacao.ItemIndex;
      sDetalhes := sDetalhes+' Sit:'+IntToStr(ESituacao.ItemIndex);
    except
    end;
    try
       OBS := EOBS.Text;
       sDetalhes := sDetalhes+' OBS:'+EOBS.Text;
    except
    end;
    try
      Post;
//      GeraLog(520, CdCNC, CdPRF, sDetalhes);
      Result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TProfissao.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    EDescricao.Enabled        :=Habilitar;
  except
  end;
  try
    ESalarioINI.Enabled          :=Habilitar;
  except
  end;
  try
    ESalarioFIM.Enabled          :=Habilitar;
  except
  end;
  try
    EOBS.Enabled                :=Habilitar;
  except
  end;
end;

procedure TProfissao.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TProfissao.CarregaDados;
begin
  Try
    ECodigoPRF.Text           :=IntToStr(CodigoPRF);
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    ESalarioINI.Text := Format('%.2f',[SalarioINI]);
  except
  end;
  try
    ESalarioFIM.Text := Format('%.2f',[SalarioFIM]);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ESituacao.ItemIndex     := Situacao;
  except
  end;
  try
    EOBS.Text                 :=OBS;
  except
  end;
end;

constructor TProfissao.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'PROFISSAO';

     { Code to perform other tasks when the component is created }

end;

function TProfissao.Deletar(CdPRF:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdPRF)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      If Delete then
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

destructor TProfissao.Destroy;
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

function TProfissao.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  If EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  If not VerificaFloatBranco(ESalarioINI.Text) then
    mensagem:=mensagem+'Salário INI inválido!'+#13;
  If not VerificaFloatBranco(ESalarioFIM.Text) then
    mensagem:=mensagem+'Salário FIM inválido!'+#13;
  If mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    if StrToFloat(ESalarioINI.Text) > StrToFloat(ESalarioINI.Text) then
    Begin
      ShowMessage('Salário Inicial maior que o final!');
      Exit;
    end; 
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
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoPRF;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TProfissao.InserirAuto:Boolean;
var
  CdCNC, CdPRF: integer;
  sDetalhes: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdPRF := sCodigo;
  sDetalhes := '';
  try
    append;
    try
      CodigoPRF   := CdPRF;
    except
    end;
    try
      CNCOrigem   := CentroDeCusto;
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
      Descricao := EDescricao.Text;
      sDetalhes := sDetalhes+'Desc:'+EDescricao.Text;
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
       SalarioINI  := StrToFLoat(ESalarioINI.Text);
       sDetalhes := sDetalhes+' SalINI:'+ESalarioINI.Text;
    except
    end;
    try
       SalarioFIM  := StrToFLoat(ESalarioFIM.Text);
       sDetalhes := sDetalhes+' SalFIM:'+ESalarioFIM.Text;
    except
    end;
    try
      Situacao     := ESituacao.ItemIndex;
      sDetalhes := sDetalhes+' Sit:'+IntToStr(ESituacao.ItemIndex);
    except
    end;
    try
       OBS  := EOBS.Text;
       sDetalhes := sDetalhes+' OBS:'+EOBS.Text;
    except
    end;
    try
      Post;
//      GeraLog(500, CdCNC, CdPRF, sDetalhes);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;


procedure TProfissao.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoPRF.Clear
    else
      ECodigoPRF.Text := IntToStr(SCodigo);
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
  try
    if Estado <> 1 then
      ESalarioINI.Clear
    else
      ESalarioINI.Text := '300,00';
  except
  end;
  try
    if Estado <> 1 then
      ESalarioFIM.Clear
    else
      ESalarioFIM.Text := '300,00';
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
function TProfissao.LocalizarCod(CdPRF:Integer):Boolean;
begin
  If (CdPRF<>CodigoPRF) Then
    If locate('PRF_CODIGO',CdPRF, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TProfissao.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
end;

procedure TProfissao.PreparaInsercao;
begin
  ProximoCodigo('PRF_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TProfissao.deletarauto:Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      result:=true;
//      GeraLog(510,CodigoCNC,CodigoPRF,'16');
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
